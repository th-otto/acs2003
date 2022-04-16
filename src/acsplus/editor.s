untab:
[00037b1a] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[00037b1e] 2648                      movea.l    a0,a3
[00037b20] 3800                      move.w     d0,d4
[00037b22] 3601                      move.w     d1,d3
[00037b24] b27c 0400                 cmp.w      #$0400,d1
[00037b28] 6d04                      blt.s      untab_1
[00037b2a] 363c 03ff                 move.w     #$03FF,d3
untab_1:
[00037b2e] 45f9 0010 c83e            lea.l      buffer,a2
[00037b34] 3203                      move.w     d3,d1
[00037b36] 48c1                      ext.l      d1
[00037b38] 7020                      moveq.l    #32,d0
[00037b3a] 204a                      movea.l    a2,a0
[00037b3c] 4eb9 0008 36ea            jsr        memset
[00037b42] 4232 3000                 clr.b      0(a2,d3.w)
[00037b46] 204b                      movea.l    a3,a0
[00037b48] 224a                      movea.l    a2,a1
[00037b4a] 200b                      move.l     a3,d0
[00037b4c] 6624                      bne.s      untab_2
[00037b4e] 602e                      bra.s      untab_3
untab_5:
[00037b50] 1018                      move.b     (a0)+,d0
[00037b52] b03c 0009                 cmp.b      #$09,d0
[00037b56] 6618                      bne.s      untab_4
[00037b58] 3204                      move.w     d4,d1
[00037b5a] 2409                      move.l     a1,d2
[00037b5c] 948a                      sub.l      a2,d2
[00037b5e] 48c2                      ext.l      d2
[00037b60] 85c4                      divs.w     d4,d2
[00037b62] 4842                      swap       d2
[00037b64] 9242                      sub.w      d2,d1
[00037b66] 74ff                      moveq.l    #-1,d2
[00037b68] d441                      add.w      d1,d2
[00037b6a] 9642                      sub.w      d2,d3
[00037b6c] d2c1                      adda.w     d1,a1
[00037b6e] 6002                      bra.s      untab_2
untab_4:
[00037b70] 12c0                      move.b     d0,(a1)+
untab_2:
[00037b72] 1010                      move.b     (a0),d0
[00037b74] 6708                      beq.s      untab_3
[00037b76] 3203                      move.w     d3,d1
[00037b78] 5343                      subq.w     #1,d3
[00037b7a] 4a41                      tst.w      d1
[00037b7c] 66d2                      bne.s      untab_5
untab_3:
[00037b7e] 204a                      movea.l    a2,a0
[00037b80] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[00037b84] 4e75                      rts

posv:
[00037b86] 48e7 1c00                 movem.l    d3-d5,-(a7)
[00037b8a] 4242                      clr.w      d2
[00037b8c] 3602                      move.w     d2,d3
[00037b8e] 2808                      move.l     a0,d4
[00037b90] 6620                      bne.s      posv_1
[00037b92] 6026                      bra.s      posv_2
posv_5:
[00037b94] 0c18 0009                 cmpi.b     #$09,(a0)+
[00037b98] 6614                      bne.s      posv_3
[00037b9a] 3800                      move.w     d0,d4
[00037b9c] 3a02                      move.w     d2,d5
[00037b9e] 48c5                      ext.l      d5
[00037ba0] 8bc0                      divs.w     d0,d5
[00037ba2] 4845                      swap       d5
[00037ba4] 9845                      sub.w      d5,d4
[00037ba6] d444                      add.w      d4,d2
[00037ba8] b242                      cmp.w      d2,d1
[00037baa] 6d0e                      blt.s      posv_2
[00037bac] 6002                      bra.s      posv_4
posv_3:
[00037bae] 5242                      addq.w     #1,d2
posv_4:
[00037bb0] 5243                      addq.w     #1,d3
posv_1:
[00037bb2] 1810                      move.b     (a0),d4
[00037bb4] 6704                      beq.s      posv_2
[00037bb6] b242                      cmp.w      d2,d1
[00037bb8] 6eda                      bgt.s      posv_5
posv_2:
[00037bba] 3003                      move.w     d3,d0
[00037bbc] 4cdf 0038                 movem.l    (a7)+,d3-d5
[00037bc0] 4e75                      rts

vpos:
[00037bc2] 2f03                      move.l     d3,-(a7)
[00037bc4] 2f04                      move.l     d4,-(a7)
[00037bc6] 4242                      clr.w      d2
[00037bc8] 2608                      move.l     a0,d3
[00037bca] 661a                      bne.s      vpos_1
[00037bcc] 6024                      bra.s      vpos_2
vpos_4:
[00037bce] 0c18 0009                 cmpi.b     #$09,(a0)+
[00037bd2] 6610                      bne.s      vpos_3
[00037bd4] 3600                      move.w     d0,d3
[00037bd6] 3802                      move.w     d2,d4
[00037bd8] 48c4                      ext.l      d4
[00037bda] 89c0                      divs.w     d0,d4
[00037bdc] 4844                      swap       d4
[00037bde] 9644                      sub.w      d4,d3
[00037be0] d443                      add.w      d3,d2
[00037be2] 6002                      bra.s      vpos_1
vpos_3:
[00037be4] 5242                      addq.w     #1,d2
vpos_1:
[00037be6] 1610                      move.b     (a0),d3
[00037be8] 6708                      beq.s      vpos_2
[00037bea] 3801                      move.w     d1,d4
[00037bec] 5341                      subq.w     #1,d1
[00037bee] 4a44                      tst.w      d4
[00037bf0] 66dc                      bne.s      vpos_4
vpos_2:
[00037bf2] 3002                      move.w     d2,d0
[00037bf4] 281f                      move.l     (a7)+,d4
[00037bf6] 261f                      move.l     (a7)+,d3
[00037bf8] 4e75                      rts

A_editor:
[00037bfa] 48e7 3f3e                 movem.l    d2-d7/a2-a6,-(a7)
[00037bfe] 4fef ffc8                 lea.l      -56(a7),a7
[00037c02] 206f 0068                 movea.l    104(a7),a0
[00037c06] 3228 0004                 move.w     4(a0),d1
[00037c0a] 48c1                      ext.l      d1
[00037c0c] 2001                      move.l     d1,d0
[00037c0e] d080                      add.l      d0,d0
[00037c10] d081                      add.l      d1,d0
[00037c12] e788                      lsl.l      #3,d0
[00037c14] 2850                      movea.l    (a0),a4
[00037c16] d9c0                      adda.l     d0,a4
[00037c18] 2c6c 000c                 movea.l    12(a4),a6
[00037c1c] 266e 000c                 movea.l    12(a6),a3
[00037c20] 200b                      move.l     a3,d0
[00037c22] 6700 00d4                 beq        A_editor_1
[00037c26] 7201                      moveq.l    #1,d1
[00037c28] c26b 0012                 and.w      18(a3),d1
[00037c2c] 6708                      beq.s      A_editor_2
[00037c2e] 204c                      movea.l    a4,a0
[00037c30] 4eb9 0003 a130            jsr        resize
A_editor_2:
[00037c36] 3f7c 0001 000a            move.w     #$0001,10(a7)
[00037c3c] 7002                      moveq.l    #2,d0
[00037c3e] c06b 0012                 and.w      18(a3),d0
[00037c42] 670c                      beq.s      A_editor_3
[00037c44] 7204                      moveq.l    #4,d1
[00037c46] c26b 0012                 and.w      18(a3),d1
[00037c4a] 6704                      beq.s      A_editor_3
[00037c4c] 426f 000a                 clr.w      10(a7)
A_editor_3:
[00037c50] 206f 0068                 movea.l    104(a7),a0
[00037c54] 3028 000a                 move.w     10(a0),d0
[00037c58] 3f40 001e                 move.w     d0,30(a7)
[00037c5c] 3f40 001a                 move.w     d0,26(a7)
[00037c60] 3028 000c                 move.w     12(a0),d0
[00037c64] 3f40 001c                 move.w     d0,28(a7)
[00037c68] 72ff                      moveq.l    #-1,d1
[00037c6a] d26b 004a                 add.w      74(a3),d1
[00037c6e] d36f 001a                 add.w      d1,26(a7)
[00037c72] 74ff                      moveq.l    #-1,d2
[00037c74] d46b 0048                 add.w      72(a3),d2
[00037c78] d042                      add.w      d2,d0
[00037c7a] 3228 0012                 move.w     18(a0),d1
[00037c7e] 3f41 0014                 move.w     d1,20(a7)
[00037c82] 3f41 0010                 move.w     d1,16(a7)
[00037c86] 3428 0014                 move.w     20(a0),d2
[00037c8a] 3f42 0012                 move.w     d2,18(a7)
[00037c8e] 3f42 000e                 move.w     d2,14(a7)
[00037c92] 326f 0014                 movea.w    20(a7),a1
[00037c96] b2ef 001e                 cmpa.w     30(a7),a1
[00037c9a] 6c06                      bge.s      A_editor_4
[00037c9c] 3f6f 001e 0014            move.w     30(a7),20(a7)
A_editor_4:
[00037ca2] 322f 0012                 move.w     18(a7),d1
[00037ca6] b26f 001c                 cmp.w      28(a7),d1
[00037caa] 6c06                      bge.s      A_editor_5
[00037cac] 3f6f 001c 0012            move.w     28(a7),18(a7)
A_editor_5:
[00037cb2] 72ff                      moveq.l    #-1,d1
[00037cb4] 206f 0068                 movea.l    104(a7),a0
[00037cb8] d268 0016                 add.w      22(a0),d1
[00037cbc] d36f 0010                 add.w      d1,16(a7)
[00037cc0] 74ff                      moveq.l    #-1,d2
[00037cc2] d468 0018                 add.w      24(a0),d2
[00037cc6] d56f 000e                 add.w      d2,14(a7)
[00037cca] 326f 0010                 movea.w    16(a7),a1
[00037cce] b2ef 001a                 cmpa.w     26(a7),a1
[00037cd2] 6f06                      ble.s      A_editor_6
[00037cd4] 3f6f 001a 0010            move.w     26(a7),16(a7)
A_editor_6:
[00037cda] b06f 000e                 cmp.w      14(a7),d0
[00037cde] 6c04                      bge.s      A_editor_7
[00037ce0] 3f40 000e                 move.w     d0,14(a7)
A_editor_7:
[00037ce4] 302f 0014                 move.w     20(a7),d0
[00037ce8] b06f 0010                 cmp.w      16(a7),d0
[00037cec] 6e0a                      bgt.s      A_editor_1
[00037cee] 322f 0012                 move.w     18(a7),d1
[00037cf2] b26f 000e                 cmp.w      14(a7),d1
[00037cf6] 6f0c                      ble.s      A_editor_8
A_editor_1:
[00037cf8] 206f 0068                 movea.l    104(a7),a0
[00037cfc] 3028 0008                 move.w     8(a0),d0
[00037d00] 6000 04fe                 bra        A_editor_9
A_editor_8:
[00037d04] 49ef 0028                 lea.l      40(a7),a4
[00037d08] 38af 0014                 move.w     20(a7),(a4)
[00037d0c] 396f 0012 0002            move.w     18(a7),2(a4)
[00037d12] 396f 0010 0004            move.w     16(a7),4(a4)
[00037d18] 396f 000e 0006            move.w     14(a7),6(a4)
[00037d1e] 4bf9 0010 ee4e            lea.l      ACSblk,a5
[00037d24] 204c                      movea.l    a4,a0
[00037d26] 7201                      moveq.l    #1,d1
[00037d28] 2255                      movea.l    (a5),a1
[00037d2a] 3029 0010                 move.w     16(a1),d0
[00037d2e] 4eb9 0007 2230            jsr        vs_clip
[00037d34] 362b 009a                 move.w     154(a3),d3
[00037d38] 3e2b 001e                 move.w     30(a3),d7
[00037d3c] 7201                      moveq.l    #1,d1
[00037d3e] 2055                      movea.l    (a5),a0
[00037d40] 3028 0010                 move.w     16(a0),d0
[00037d44] 4eb9 0007 3660            jsr        vsf_interior
[00037d4a] 7040                      moveq.l    #64,d0
[00037d4c] c06b 0012                 and.w      18(a3),d0
[00037d50] 6600 035c                 bne        A_editor_10
[00037d54] 7201                      moveq.l    #1,d1
[00037d56] 2055                      movea.l    (a5),a0
[00037d58] 3028 0010                 move.w     16(a0),d0
[00037d5c] 4eb9 0007 3070            jsr        vswr_mode
[00037d62] 4241                      clr.w      d1
[00037d64] 2055                      movea.l    (a5),a0
[00037d66] 3028 0010                 move.w     16(a0),d0
[00037d6a] 4eb9 0007 3492            jsr        vst_rotation
[00037d70] 322b 0002                 move.w     2(a3),d1
[00037d74] 2055                      movea.l    (a5),a0
[00037d76] 3028 0010                 move.w     16(a0),d0
[00037d7a] 4eb9 0007 34e6            jsr        vst_font
[00037d80] 45ef 000c                 lea.l      12(a7),a2
[00037d84] 4852                      pea.l      (a2)
[00037d86] 4852                      pea.l      (a2)
[00037d88] 224a                      movea.l    a2,a1
[00037d8a] 204a                      movea.l    a2,a0
[00037d8c] 322b 0004                 move.w     4(a3),d1
[00037d90] 2c55                      movea.l    (a5),a6
[00037d92] 302e 0010                 move.w     16(a6),d0
[00037d96] 4eb9 0007 3370            jsr        vst_height
[00037d9c] 504f                      addq.w     #8,a7
[00037d9e] 3213                      move.w     (a3),d1
[00037da0] 2055                      movea.l    (a5),a0
[00037da2] 3028 0010                 move.w     16(a0),d0
[00037da6] 4eb9 0007 353a            jsr        vst_color
[00037dac] 4241                      clr.w      d1
[00037dae] 2055                      movea.l    (a5),a0
[00037db0] 3028 0010                 move.w     16(a0),d0
[00037db4] 4eb9 0007 358e            jsr        vst_effects
[00037dba] 224a                      movea.l    a2,a1
[00037dbc] 204a                      movea.l    a2,a0
[00037dbe] 7405                      moveq.l    #5,d2
[00037dc0] 4241                      clr.w      d1
[00037dc2] 2c55                      movea.l    (a5),a6
[00037dc4] 302e 0010                 move.w     16(a6),d0
[00037dc8] 4eb9 0007 35e2            jsr        vst_alignment
[00037dce] 4241                      clr.w      d1
[00037dd0] 2055                      movea.l    (a5),a0
[00037dd2] 3028 0010                 move.w     16(a0),d0
[00037dd6] 4eb9 0007 3708            jsr        vsf_color
[00037ddc] 2f6b 000a 0004            move.l     10(a3),4(a7)
[00037de2] 2c2b 0018                 move.l     24(a3),d6
[00037de6] 3f6b 0010 0008            move.w     16(a3),8(a7)
[00037dec] 2006                      move.l     d6,d0
[00037dee] e788                      lsl.l      #3,d0
[00037df0] 206b 002c                 movea.l    44(a3),a0
[00037df4] d1c0                      adda.l     d0,a0
[00037df6] 2e88                      move.l     a0,(a7)
[00037df8] 322f 0012                 move.w     18(a7),d1
[00037dfc] 926b 0006                 sub.w      6(a3),d1
[00037e00] 3f41 0016                 move.w     d1,22(a7)
[00037e04] 7401                      moveq.l    #1,d2
[00037e06] d46f 000e                 add.w      14(a7),d2
[00037e0a] 3f42 0018                 move.w     d2,24(a7)
[00037e0e] 326f 0010                 movea.w    16(a7),a1
[00037e12] 3949 000c                 move.w     a1,12(a4)
[00037e16] 3949 0004                 move.w     a1,4(a4)
[00037e1a] 6000 0286                 bra        A_editor_11
A_editor_40:
[00037e1e] 302f 001c                 move.w     28(a7),d0
[00037e22] b06f 0016                 cmp.w      22(a7),d0
[00037e26] 6f00 026a                 ble        A_editor_12
[00037e2a] 322f 000a                 move.w     10(a7),d1
[00037e2e] 6608                      bne.s      A_editor_13
[00037e30] bcab 0066                 cmp.l      102(a3),d6
[00037e34] 6600 025c                 bne        A_editor_12
A_editor_13:
[00037e38] 302f 001c                 move.w     28(a7),d0
[00037e3c] 3940 000a                 move.w     d0,10(a4)
[00037e40] 3940 0002                 move.w     d0,2(a4)
[00037e44] 322f 001c                 move.w     28(a7),d1
[00037e48] d26b 0006                 add.w      6(a3),d1
[00037e4c] 5341                      subq.w     #1,d1
[00037e4e] 3941 000e                 move.w     d1,14(a4)
[00037e52] 3941 0006                 move.w     d1,6(a4)
[00037e56] bcab 0028                 cmp.l      40(a3),d6
[00037e5a] 6e00 0224                 bgt        A_editor_14
[00037e5e] 202f 0004                 move.l     4(a7),d0
[00037e62] 6f00 021c                 ble        A_editor_14
[00037e66] 342b 0012                 move.w     18(a3),d2
[00037e6a] c47c 0100                 and.w      #$0100,d2
[00037e6e] 6600 00e0                 bne        A_editor_15
[00037e72] 2057                      movea.l    (a7),a0
[00037e74] 2450                      movea.l    (a0),a2
[00037e76] 220a                      move.l     a2,d1
[00037e78] 672a                      beq.s      A_editor_16
[00037e7a] 4244                      clr.w      d4
[00037e7c] 6018                      bra.s      A_editor_17
A_editor_20:
[00037e7e] 0c1a 0009                 cmpi.b     #$09,(a2)+
[00037e82] 6610                      bne.s      A_editor_18
[00037e84] 3003                      move.w     d3,d0
[00037e86] 3204                      move.w     d4,d1
[00037e88] 48c1                      ext.l      d1
[00037e8a] 83c3                      divs.w     d3,d1
[00037e8c] 4841                      swap       d1
[00037e8e] 9041                      sub.w      d1,d0
[00037e90] d840                      add.w      d0,d4
[00037e92] 6002                      bra.s      A_editor_17
A_editor_18:
[00037e94] 5244                      addq.w     #1,d4
A_editor_17:
[00037e96] be44                      cmp.w      d4,d7
[00037e98] 6f04                      ble.s      A_editor_19
[00037e9a] 1012                      move.b     (a2),d0
[00037e9c] 66e0                      bne.s      A_editor_20
A_editor_19:
[00037e9e] 3a04                      move.w     d4,d5
[00037ea0] 9a47                      sub.w      d7,d5
[00037ea2] 6002                      bra.s      A_editor_21
A_editor_16:
[00037ea4] 7aff                      moveq.l    #-1,d5
A_editor_21:
[00037ea6] 4a45                      tst.w      d5
[00037ea8] 6b00 0094                 bmi        A_editor_22
[00037eac] 1012                      move.b     (a2),d0
[00037eae] 6700 008e                 beq        A_editor_22
[00037eb2] 4a45                      tst.w      d5
[00037eb4] 6f12                      ble.s      A_editor_23
[00037eb6] 3205                      move.w     d5,d1
[00037eb8] 48c1                      ext.l      d1
[00037eba] 41f9 0010 cc3e            lea.l      line,a0
[00037ec0] 7020                      moveq.l    #32,d0
[00037ec2] 4eb9 0008 36ea            jsr        memset
A_editor_23:
[00037ec8] 4df9 0010 cc3e            lea.l      line,a6
[00037ece] dcc5                      adda.w     d5,a6
[00037ed0] 602c                      bra.s      A_editor_24
A_editor_29:
[00037ed2] 101a                      move.b     (a2)+,d0
[00037ed4] b03c 0009                 cmp.b      #$09,d0
[00037ed8] 6620                      bne.s      A_editor_25
[00037eda] 3803                      move.w     d3,d4
[00037edc] 3205                      move.w     d5,d1
[00037ede] d247                      add.w      d7,d1
[00037ee0] 48c1                      ext.l      d1
[00037ee2] 83c3                      divs.w     d3,d1
[00037ee4] 4841                      swap       d1
[00037ee6] 9841                      sub.w      d1,d4
[00037ee8] da44                      add.w      d4,d5
[00037eea] 6004                      bra.s      A_editor_26
A_editor_27:
[00037eec] 1cfc 0020                 move.b     #$20,(a6)+
A_editor_26:
[00037ef0] 3204                      move.w     d4,d1
[00037ef2] 5344                      subq.w     #1,d4
[00037ef4] 4a41                      tst.w      d1
[00037ef6] 66f4                      bne.s      A_editor_27
[00037ef8] 6004                      bra.s      A_editor_24
A_editor_25:
[00037efa] 5245                      addq.w     #1,d5
[00037efc] 1cc0                      move.b     d0,(a6)+
A_editor_24:
[00037efe] 1012                      move.b     (a2),d0
[00037f00] 6706                      beq.s      A_editor_28
[00037f02] ba6f 0008                 cmp.w      8(a7),d5
[00037f06] 6dca                      blt.s      A_editor_29
A_editor_28:
[00037f08] 4216                      clr.b      (a6)
[00037f0a] 41f9 0010 cc3e            lea.l      line,a0
[00037f10] 342f 001c                 move.w     28(a7),d2
[00037f14] 322f 001e                 move.w     30(a7),d1
[00037f18] 2255                      movea.l    (a5),a1
[00037f1a] 3029 0010                 move.w     16(a1),d0
[00037f1e] 4eb9 0007 24b0            jsr        v_gtext
[00037f24] ba6f 0008                 cmp.w      8(a7),d5
[00037f28] 6c26                      bge.s      A_editor_15
[00037f2a] 3005                      move.w     d5,d0
[00037f2c] c1eb 0008                 muls.w     8(a3),d0
[00037f30] d06f 001e                 add.w      30(a7),d0
[00037f34] 3880                      move.w     d0,(a4)
[00037f36] b06c 0004                 cmp.w      4(a4),d0
[00037f3a] 6e14                      bgt.s      A_editor_15
[00037f3c] 6004                      bra.s      A_editor_30
A_editor_22:
[00037f3e] 38af 0014                 move.w     20(a7),(a4)
A_editor_30:
[00037f42] 204c                      movea.l    a4,a0
[00037f44] 2255                      movea.l    (a5),a1
[00037f46] 3029 0010                 move.w     16(a1),d0
[00037f4a] 4eb9 0007 27e2            jsr        vr_recfl
A_editor_15:
[00037f50] 7003                      moveq.l    #3,d0
[00037f52] 2057                      movea.l    (a7),a0
[00037f54] c068 0006                 and.w      6(a0),d0
[00037f58] 6700 0138                 beq        A_editor_12
[00037f5c] 7202                      moveq.l    #2,d1
[00037f5e] c268 0006                 and.w      6(a0),d1
[00037f62] 660c                      bne.s      A_editor_31
[00037f64] 342b 0012                 move.w     18(a3),d2
[00037f68] c47c 0100                 and.w      #$0100,d2
[00037f6c] 6600 0124                 bne        A_editor_12
A_editor_31:
[00037f70] 302b 0070                 move.w     112(a3),d0
[00037f74] 6652                      bne.s      A_editor_32
[00037f76] bcab 0030                 cmp.l      48(a3),d6
[00037f7a] 6706                      beq.s      A_editor_33
[00037f7c] bcab 0038                 cmp.l      56(a3),d6
[00037f80] 6646                      bne.s      A_editor_32
A_editor_33:
[00037f82] 302b 0012                 move.w     18(a3),d0
[00037f86] c07c 0200                 and.w      #$0200,d0
[00037f8a] 6700 0106                 beq        A_editor_12
[00037f8e] bcab 0030                 cmp.l      48(a3),d6
[00037f92] 6622                      bne.s      A_editor_34
[00037f94] 202b 0040                 move.l     64(a3),d0
[00037f98] 3207                      move.w     d7,d1
[00037f9a] 48c1                      ext.l      d1
[00037f9c] 9081                      sub.l      d1,d0
[00037f9e] 322b 0008                 move.w     8(a3),d1
[00037fa2] 48c1                      ext.l      d1
[00037fa4] 4eb9 0008 3cac            jsr        _lmul
[00037faa] d06f 001e                 add.w      30(a7),d0
[00037fae] 3940 0008                 move.w     d0,8(a4)
[00037fb2] 3880                      move.w     d0,(a4)
[00037fb4] 600a                      bra.s      A_editor_35
A_editor_34:
[00037fb6] 302f 0014                 move.w     20(a7),d0
[00037fba] 3940 0008                 move.w     d0,8(a4)
[00037fbe] 3880                      move.w     d0,(a4)
A_editor_35:
[00037fc0] bcab 0038                 cmp.l      56(a3),d6
[00037fc4] 665c                      bne.s      A_editor_36
[00037fc6] 6036                      bra.s      A_editor_37
A_editor_32:
[00037fc8] 0c6b 0005 0070            cmpi.w     #$0005,112(a3)
[00037fce] 6600 0086                 bne        A_editor_38
[00037fd2] 302b 0012                 move.w     18(a3),d0
[00037fd6] c07c 0200                 and.w      #$0200,d0
[00037fda] 6700 00b6                 beq        A_editor_12
[00037fde] 202b 0040                 move.l     64(a3),d0
[00037fe2] 3207                      move.w     d7,d1
[00037fe4] 48c1                      ext.l      d1
[00037fe6] 9081                      sub.l      d1,d0
[00037fe8] 322b 0008                 move.w     8(a3),d1
[00037fec] 48c1                      ext.l      d1
[00037fee] 4eb9 0008 3cac            jsr        _lmul
[00037ff4] d06f 001e                 add.w      30(a7),d0
[00037ff8] 3940 0008                 move.w     d0,8(a4)
[00037ffc] 3880                      move.w     d0,(a4)
A_editor_37:
[00037ffe] 202b 0044                 move.l     68(a3),d0
[00038002] 3207                      move.w     d7,d1
[00038004] 48c1                      ext.l      d1
[00038006] 9081                      sub.l      d1,d0
[00038008] 322b 0008                 move.w     8(a3),d1
[0003800c] 48c1                      ext.l      d1
[0003800e] 4eb9 0008 3cac            jsr        _lmul
[00038014] d06f 001e                 add.w      30(a7),d0
[00038018] 5340                      subq.w     #1,d0
[0003801a] 3940 000c                 move.w     d0,12(a4)
[0003801e] 3940 0004                 move.w     d0,4(a4)
A_editor_36:
[00038022] 3014                      move.w     (a4),d0
[00038024] b06c 0004                 cmp.w      4(a4),d0
[00038028] 6e1e                      bgt.s      A_editor_39
[0003802a] 2055                      movea.l    (a5),a0
[0003802c] 4868 026a                 pea.l      618(a0)
[00038030] 2248                      movea.l    a0,a1
[00038032] 43e9 026a                 lea.l      618(a1),a1
[00038036] 204c                      movea.l    a4,a0
[00038038] 720a                      moveq.l    #10,d1
[0003803a] 2455                      movea.l    (a5),a2
[0003803c] 302a 0010                 move.w     16(a2),d0
[00038040] 4eb9 0007 489e            jsr        vro_cpyfm
[00038046] 584f                      addq.w     #4,a7
A_editor_39:
[00038048] 302f 0010                 move.w     16(a7),d0
[0003804c] 3940 000c                 move.w     d0,12(a4)
[00038050] 3940 0004                 move.w     d0,4(a4)
[00038054] 603c                      bra.s      A_editor_12
A_editor_38:
[00038056] 302f 0014                 move.w     20(a7),d0
[0003805a] 3940 0008                 move.w     d0,8(a4)
[0003805e] 3880                      move.w     d0,(a4)
[00038060] 2055                      movea.l    (a5),a0
[00038062] 4868 026a                 pea.l      618(a0)
[00038066] 2248                      movea.l    a0,a1
[00038068] 43e9 026a                 lea.l      618(a1),a1
[0003806c] 204c                      movea.l    a4,a0
[0003806e] 720a                      moveq.l    #10,d1
[00038070] 2455                      movea.l    (a5),a2
[00038072] 302a 0010                 move.w     16(a2),d0
[00038076] 4eb9 0007 489e            jsr        vro_cpyfm
[0003807c] 584f                      addq.w     #4,a7
[0003807e] 6012                      bra.s      A_editor_12
A_editor_14:
[00038080] 38af 0014                 move.w     20(a7),(a4)
[00038084] 204c                      movea.l    a4,a0
[00038086] 2255                      movea.l    (a5),a1
[00038088] 3029 0010                 move.w     16(a1),d0
[0003808c] 4eb9 0007 27e2            jsr        vr_recfl
A_editor_12:
[00038092] 302b 0006                 move.w     6(a3),d0
[00038096] d16f 001c                 add.w      d0,28(a7)
[0003809a] 5097                      addq.l     #8,(a7)
[0003809c] 5286                      addq.l     #1,d6
[0003809e] 53af 0004                 subq.l     #1,4(a7)
A_editor_11:
[000380a2] 302f 001c                 move.w     28(a7),d0
[000380a6] b06f 0018                 cmp.w      24(a7),d0
[000380aa] 6d00 fd72                 blt        A_editor_40
A_editor_10:
[000380ae] 303c 0080                 move.w     #$0080,d0
[000380b2] c06b 0012                 and.w      18(a3),d0
[000380b6] 6700 012e                 beq        A_editor_41
[000380ba] 222b 0030                 move.l     48(a3),d1
[000380be] 242b 0018                 move.l     24(a3),d2
[000380c2] d4ab 000a                 add.l      10(a3),d2
[000380c6] b282                      cmp.l      d2,d1
[000380c8] 6c00 011c                 bge        A_editor_41
[000380cc] b2ab 0018                 cmp.l      24(a3),d1
[000380d0] 6d00 0114                 blt        A_editor_41
[000380d4] 382f 000a                 move.w     10(a7),d4
[000380d8] 660a                      bne.s      A_editor_42
[000380da] 2a2b 0066                 move.l     102(a3),d5
[000380de] ba81                      cmp.l      d1,d5
[000380e0] 6600 0104                 bne        A_editor_41
A_editor_42:
[000380e4] 302b 0012                 move.w     18(a3),d0
[000380e8] c07c 0200                 and.w      #$0200,d0
[000380ec] 6600 00f8                 bne        A_editor_41
[000380f0] 222b 0030                 move.l     48(a3),d1
[000380f4] e789                      lsl.l      #3,d1
[000380f6] 206b 002c                 movea.l    44(a3),a0
[000380fa] d1c1                      adda.l     d1,a0
[000380fc] 2e88                      move.l     a0,(a7)
[000380fe] 322b 0042                 move.w     66(a3),d1
[00038102] 2050                      movea.l    (a0),a0
[00038104] 3003                      move.w     d3,d0
[00038106] 6100 fa7e                 bsr        posv
[0003810a] 3f40 0008                 move.w     d0,8(a7)
[0003810e] 3200                      move.w     d0,d1
[00038110] 2057                      movea.l    (a7),a0
[00038112] 2050                      movea.l    (a0),a0
[00038114] 3003                      move.w     d3,d0
[00038116] 6100 faaa                 bsr        vpos
[0003811a] 3f40 0008                 move.w     d0,8(a7)
[0003811e] 7203                      moveq.l    #3,d1
[00038120] 2055                      movea.l    (a5),a0
[00038122] 3028 0010                 move.w     16(a0),d0
[00038126] 4eb9 0007 3070            jsr        vswr_mode
[0003812c] 7201                      moveq.l    #1,d1
[0003812e] 2055                      movea.l    (a5),a0
[00038130] 3028 0010                 move.w     16(a0),d0
[00038134] 4eb9 0007 3708            jsr        vsf_color
[0003813a] 302f 0008                 move.w     8(a7),d0
[0003813e] 9047                      sub.w      d7,d0
[00038140] c1eb 0008                 muls.w     8(a3),d0
[00038144] 206f 0068                 movea.l    104(a7),a0
[00038148] d068 000a                 add.w      10(a0),d0
[0003814c] 3f40 0020                 move.w     d0,32(a7)
[00038150] 322b 0032                 move.w     50(a3),d1
[00038154] 926b 001a                 sub.w      26(a3),d1
[00038158] c3eb 0006                 muls.w     6(a3),d1
[0003815c] d268 000c                 add.w      12(a0),d1
[00038160] 3f41 0022                 move.w     d1,34(a7)
[00038164] 342f 0020                 move.w     32(a7),d2
[00038168] d46b 0008                 add.w      8(a3),d2
[0003816c] 5342                      subq.w     #1,d2
[0003816e] 3f42 0024                 move.w     d2,36(a7)
[00038172] 362f 0022                 move.w     34(a7),d3
[00038176] d66b 0006                 add.w      6(a3),d3
[0003817a] 5343                      subq.w     #1,d3
[0003817c] 3f43 0026                 move.w     d3,38(a7)
[00038180] 342b 009c                 move.w     156(a3),d2
[00038184] 5342                      subq.w     #1,d2
[00038186] 670a                      beq.s      A_editor_43
[00038188] 5342                      subq.w     #1,d2
[0003818a] 674a                      beq.s      A_editor_44
[0003818c] 5342                      subq.w     #1,d2
[0003818e] 670e                      beq.s      A_editor_45
[00038190] 603a                      bra.s      A_editor_46
A_editor_43:
[00038192] 70ff                      moveq.l    #-1,d0
[00038194] d06f 0026                 add.w      38(a7),d0
[00038198] 3f40 0022                 move.w     d0,34(a7)
[0003819c] 6038                      bra.s      A_editor_44
A_editor_45:
[0003819e] 7201                      moveq.l    #1,d1
[000381a0] 2055                      movea.l    (a5),a0
[000381a2] 3028 0010                 move.w     16(a0),d0
[000381a6] 4eb9 0007 375c            jsr        vsf_perimeter
[000381ac] 4241                      clr.w      d1
[000381ae] 2055                      movea.l    (a5),a0
[000381b0] 3028 0010                 move.w     16(a0),d0
[000381b4] 4eb9 0007 3660            jsr        vsf_interior
[000381ba] 41ef 0020                 lea.l      32(a7),a0
[000381be] 2255                      movea.l    (a5),a1
[000381c0] 3029 0010                 move.w     16(a1),d0
[000381c4] 4eb9 0007 282e            jsr        v_bar
[000381ca] 601a                      bra.s      A_editor_41
A_editor_46:
[000381cc] 7001                      moveq.l    #1,d0
[000381ce] d06f 0020                 add.w      32(a7),d0
[000381d2] 3f40 0024                 move.w     d0,36(a7)
A_editor_44:
[000381d6] 41ef 0020                 lea.l      32(a7),a0
[000381da] 2255                      movea.l    (a5),a1
[000381dc] 3029 0010                 move.w     16(a1),d0
[000381e0] 4eb9 0007 27e2            jsr        vr_recfl
A_editor_41:
[000381e6] 204c                      movea.l    a4,a0
[000381e8] 4241                      clr.w      d1
[000381ea] 2255                      movea.l    (a5),a1
[000381ec] 3029 0010                 move.w     16(a1),d0
[000381f0] 4eb9 0007 2230            jsr        vs_clip
[000381f6] 70f6                      moveq.l    #-10,d0
[000381f8] 206f 0068                 movea.l    104(a7),a0
[000381fc] c068 0008                 and.w      8(a0),d0
A_editor_9:
[00038200] 4fef 0038                 lea.l      56(a7),a7
[00038204] 4cdf 7cfc                 movem.l    (a7)+,d2-d7/a2-a6
[00038208] 4e75                      rts

edit_view:
[0003820a] 2f03                      move.l     d3,-(a7)
[0003820c] 2f04                      move.l     d4,-(a7)
[0003820e] 2028 0030                 move.l     48(a0),d0
[00038212] 2228 0018                 move.l     24(a0),d1
[00038216] d2a8 000a                 add.l      10(a0),d1
[0003821a] 5381                      subq.l     #1,d1
[0003821c] b2a8 0028                 cmp.l      40(a0),d1
[00038220] 6f18                      ble.s      edit_view_1
[00038222] 2228 0028                 move.l     40(a0),d1
[00038226] 2401                      move.l     d1,d2
[00038228] 94a8 000a                 sub.l      10(a0),d2
[0003822c] 5282                      addq.l     #1,d2
[0003822e] 2142 0018                 move.l     d2,24(a0)
[00038232] 4a82                      tst.l      d2
[00038234] 6a04                      bpl.s      edit_view_1
[00038236] 42a8 0018                 clr.l      24(a0)
edit_view_1:
[0003823a] 2428 0018                 move.l     24(a0),d2
[0003823e] 9480                      sub.l      d0,d2
[00038240] 2600                      move.l     d0,d3
[00038242] 9681                      sub.l      d1,d3
[00038244] 4a82                      tst.l      d2
[00038246] 6e04                      bgt.s      edit_view_2
[00038248] 4a83                      tst.l      d3
[0003824a] 6f3e                      ble.s      edit_view_3
edit_view_2:
[0003824c] 4a82                      tst.l      d2
[0003824e] 6f08                      ble.s      edit_view_4
[00038250] 7802                      moveq.l    #2,d4
[00038252] b882                      cmp.l      d2,d4
[00038254] 6c1a                      bge.s      edit_view_5
[00038256] 6006                      bra.s      edit_view_6
edit_view_4:
[00038258] 7402                      moveq.l    #2,d2
[0003825a] b483                      cmp.l      d3,d2
[0003825c] 6c0a                      bge.s      edit_view_7
edit_view_6:
[0003825e] 2428 000a                 move.l     10(a0),d2
[00038262] e282                      asr.l      #1,d2
[00038264] 9082                      sub.l      d2,d0
[00038266] 6008                      bra.s      edit_view_5
edit_view_7:
[00038268] 74ff                      moveq.l    #-1,d2
[0003826a] d4a8 000a                 add.l      10(a0),d2
[0003826e] 9082                      sub.l      d2,d0
edit_view_5:
[00038270] 2228 0028                 move.l     40(a0),d1
[00038274] 92a8 000a                 sub.l      10(a0),d1
[00038278] 5281                      addq.l     #1,d1
[0003827a] b280                      cmp.l      d0,d1
[0003827c] 6c02                      bge.s      edit_view_8
[0003827e] 2001                      move.l     d1,d0
edit_view_8:
[00038280] 4a80                      tst.l      d0
[00038282] 6a02                      bpl.s      edit_view_9
[00038284] 7000                      moveq.l    #0,d0
edit_view_9:
[00038286] 2140 0018                 move.l     d0,24(a0)
edit_view_3:
[0003828a] 2628 0040                 move.l     64(a0),d3
[0003828e] 2228 001c                 move.l     28(a0),d1
[00038292] d2a8 000e                 add.l      14(a0),d1
[00038296] b2a8 0020                 cmp.l      32(a0),d1
[0003829a] 6f04                      ble.s      edit_view_10
[0003829c] 2228 0020                 move.l     32(a0),d1
edit_view_10:
[000382a0] b6a8 001c                 cmp.l      28(a0),d3
[000382a4] 6f04                      ble.s      edit_view_11
[000382a6] b283                      cmp.l      d3,d1
[000382a8] 6e2e                      bgt.s      edit_view_12
edit_view_11:
[000382aa] 2028 000e                 move.l     14(a0),d0
[000382ae] e280                      asr.l      #1,d0
[000382b0] 5280                      addq.l     #1,d0
[000382b2] 9680                      sub.l      d0,d3
[000382b4] 2228 0020                 move.l     32(a0),d1
[000382b8] 92a8 000e                 sub.l      14(a0),d1
[000382bc] b283                      cmp.l      d3,d1
[000382be] 6c02                      bge.s      edit_view_13
[000382c0] 2601                      move.l     d1,d3
edit_view_13:
[000382c2] 4a83                      tst.l      d3
[000382c4] 6a02                      bpl.s      edit_view_14
[000382c6] 7600                      moveq.l    #0,d3
edit_view_14:
[000382c8] b6a8 001c                 cmp.l      28(a0),d3
[000382cc] 670a                      beq.s      edit_view_12
[000382ce] 0068 0008 0012            ori.w      #$0008,18(a0)
[000382d4] 2143 001c                 move.l     d3,28(a0)
edit_view_12:
[000382d8] 281f                      move.l     (a7)+,d4
[000382da] 261f                      move.l     (a7)+,d3
[000382dc] 4e75                      rts

edit_showcol:
[000382de] b0a8 0020                 cmp.l      32(a0),d0
[000382e2] 6f04                      ble.s      edit_showcol_1
[000382e4] 2028 0020                 move.l     32(a0),d0
edit_showcol_1:
[000382e8] b0a8 001c                 cmp.l      28(a0),d0
[000382ec] 6c16                      bge.s      edit_showcol_2
[000382ee] 2228 000e                 move.l     14(a0),d1
[000382f2] e481                      asr.l      #2,d1
[000382f4] 93a8 001c                 sub.l      d1,28(a0)
[000382f8] 2228 001c                 move.l     28(a0),d1
[000382fc] 6a34                      bpl.s      edit_showcol_3
[000382fe] 42a8 001c                 clr.l      28(a0)
[00038302] 602e                      bra.s      edit_showcol_3
edit_showcol_2:
[00038304] 2228 001c                 move.l     28(a0),d1
[00038308] d2a8 000e                 add.l      14(a0),d1
[0003830c] b081                      cmp.l      d1,d0
[0003830e] 6d22                      blt.s      edit_showcol_3
[00038310] 2028 000e                 move.l     14(a0),d0
[00038314] e480                      asr.l      #2,d0
[00038316] d1a8 001c                 add.l      d0,28(a0)
[0003831a] 2028 0020                 move.l     32(a0),d0
[0003831e] 90a8 000e                 sub.l      14(a0),d0
[00038322] 4a80                      tst.l      d0
[00038324] 6a02                      bpl.s      edit_showcol_4
[00038326] 7000                      moveq.l    #0,d0
edit_showcol_4:
[00038328] b0a8 001c                 cmp.l      28(a0),d0
[0003832c] 6c04                      bge.s      edit_showcol_3
[0003832e] 2140 001c                 move.l     d0,28(a0)
edit_showcol_3:
[00038332] 4e75                      rts

edit_freeundo:
[00038334] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00038338] 2448                      movea.l    a0,a2
[0003833a] 2600                      move.l     d0,d3
[0003833c] 220a                      move.l     a2,d1
[0003833e] 671c                      beq.s      edit_freeundo_1
[00038340] 264a                      movea.l    a2,a3
[00038342] 6008                      bra.s      edit_freeundo_2
edit_freeundo_3:
[00038344] 205b                      movea.l    (a3)+,a0
[00038346] 4eb9 0004 c6c8            jsr        Ax_ifree
edit_freeundo_2:
[0003834c] 2003                      move.l     d3,d0
[0003834e] 5383                      subq.l     #1,d3
[00038350] 4a80                      tst.l      d0
[00038352] 66f0                      bne.s      edit_freeundo_3
[00038354] 204a                      movea.l    a2,a0
[00038356] 4eb9 0004 c6c8            jsr        Ax_ifree
edit_freeundo_1:
[0003835c] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00038360] 4e75                      rts

edit_makeundo:
[00038362] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[00038366] 2648                      movea.l    a0,a3
[00038368] 2600                      move.l     d0,d3
[0003836a] 2801                      move.l     d1,d4
[0003836c] 9880                      sub.l      d0,d4
[0003836e] 5284                      addq.l     #1,d4
[00038370] 4a84                      tst.l      d4
[00038372] 6f16                      ble.s      edit_makeundo_1
[00038374] 2004                      move.l     d4,d0
[00038376] e588                      lsl.l      #2,d0
[00038378] 4eb9 0004 c608            jsr        Ax_malloc
[0003837e] 2448                      movea.l    a0,a2
[00038380] 200a                      move.l     a2,d0
[00038382] 660a                      bne.s      edit_makeundo_2
[00038384] 006b 0001 009e            ori.w      #$0001,158(a3)
edit_makeundo_1:
[0003838a] 91c8                      suba.l     a0,a0
[0003838c] 601c                      bra.s      edit_makeundo_3
edit_makeundo_2:
[0003838e] 204a                      movea.l    a2,a0
[00038390] 2003                      move.l     d3,d0
[00038392] e788                      lsl.l      #3,d0
[00038394] 226b 002c                 movea.l    44(a3),a1
[00038398] d3c0                      adda.l     d0,a1
[0003839a] 6006                      bra.s      edit_makeundo_4
edit_makeundo_5:
[0003839c] 2491                      move.l     (a1),(a2)
[0003839e] 584a                      addq.w     #4,a2
[000383a0] 5049                      addq.w     #8,a1
edit_makeundo_4:
[000383a2] 2004                      move.l     d4,d0
[000383a4] 5384                      subq.l     #1,d4
[000383a6] 4a80                      tst.l      d0
[000383a8] 66f2                      bne.s      edit_makeundo_5
edit_makeundo_3:
[000383aa] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[000383ae] 4e75                      rts

edit_movelines:
[000383b0] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[000383b4] 2448                      movea.l    a0,a2
[000383b6] 2800                      move.l     d0,d4
[000383b8] 2601                      move.l     d1,d3
[000383ba] 4a81                      tst.l      d1
[000383bc] 6f4e                      ble.s      edit_movelines_1
[000383be] 242a 0028                 move.l     40(a2),d2
[000383c2] d481                      add.l      d1,d2
[000383c4] b4aa 0024                 cmp.l      36(a2),d2
[000383c8] 6d12                      blt.s      edit_movelines_2
[000383ca] 2001                      move.l     d1,d0
[000383cc] 4eb9 0003 8eb8            jsr        edit_expand
[000383d2] 4a40                      tst.w      d0
[000383d4] 6706                      beq.s      edit_movelines_2
[000383d6] 70ff                      moveq.l    #-1,d0
[000383d8] 6000 008e                 bra        edit_movelines_3
edit_movelines_2:
[000383dc] 2004                      move.l     d4,d0
[000383de] e788                      lsl.l      #3,d0
[000383e0] 266a 002c                 movea.l    44(a2),a3
[000383e4] d7c0                      adda.l     d0,a3
[000383e6] 7a01                      moveq.l    #1,d5
[000383e8] daaa 0028                 add.l      40(a2),d5
[000383ec] 9a84                      sub.l      d4,d5
[000383ee] 4a85                      tst.l      d5
[000383f0] 6f14                      ble.s      edit_movelines_4
[000383f2] 2005                      move.l     d5,d0
[000383f4] e788                      lsl.l      #3,d0
[000383f6] 224b                      movea.l    a3,a1
[000383f8] 2203                      move.l     d3,d1
[000383fa] e789                      lsl.l      #3,d1
[000383fc] 41f3 1800                 lea.l      0(a3,d1.l),a0
[00038400] 4eb9 0008 3500            jsr        memcpy
edit_movelines_4:
[00038406] d7aa 0028                 add.l      d3,40(a2)
[0003840a] 605a                      bra.s      edit_movelines_5
edit_movelines_1:
[0003840c] 4a83                      tst.l      d3
[0003840e] 6a56                      bpl.s      edit_movelines_5
[00038410] 2004                      move.l     d4,d0
[00038412] e788                      lsl.l      #3,d0
[00038414] 266a 002c                 movea.l    44(a2),a3
[00038418] d7c0                      adda.l     d0,a3
[0003841a] 4483                      neg.l      d3
[0003841c] 7a01                      moveq.l    #1,d5
[0003841e] daaa 0028                 add.l      40(a2),d5
[00038422] 9a84                      sub.l      d4,d5
[00038424] 9a83                      sub.l      d3,d5
[00038426] 97aa 0028                 sub.l      d3,40(a2)
[0003842a] 4a85                      tst.l      d5
[0003842c] 6f14                      ble.s      edit_movelines_6
[0003842e] 2005                      move.l     d5,d0
[00038430] e788                      lsl.l      #3,d0
[00038432] 2203                      move.l     d3,d1
[00038434] e789                      lsl.l      #3,d1
[00038436] 43f3 1800                 lea.l      0(a3,d1.l),a1
[0003843a] 204b                      movea.l    a3,a0
[0003843c] 4eb9 0008 3500            jsr        memcpy
edit_movelines_6:
[00038442] 2203                      move.l     d3,d1
[00038444] e789                      lsl.l      #3,d1
[00038446] 4240                      clr.w      d0
[00038448] 242a 0028                 move.l     40(a2),d2
[0003844c] e78a                      lsl.l      #3,d2
[0003844e] 206a 002c                 movea.l    44(a2),a0
[00038452] 41f0 2808                 lea.l      8(a0,d2.l),a0
[00038456] 4eb9 0008 36ea            jsr        memset
[0003845c] 202a 0028                 move.l     40(a2),d0
[00038460] 6a04                      bpl.s      edit_movelines_5
[00038462] 42aa 0028                 clr.l      40(a2)
edit_movelines_5:
[00038466] 4240                      clr.w      d0
edit_movelines_3:
[00038468] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[0003846c] 4e75                      rts

edit_insblk:
[0003846e] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[00038472] 4fef ffe0                 lea.l      -32(a7),a7
[00038476] 2648                      movea.l    a0,a3
[00038478] 2f49 001c                 move.l     a1,28(a7)
[0003847c] 2611                      move.l     (a1),d3
[0003847e] 2003                      move.l     d3,d0
[00038480] d0a9 0010                 add.l      16(a1),d0
[00038484] 5380                      subq.l     #1,d0
[00038486] 2f40 000c                 move.l     d0,12(a7)
[0003848a] 90ab 0024                 sub.l      36(a3),d0
[0003848e] 5280                      addq.l     #1,d0
[00038490] 2f40 0008                 move.l     d0,8(a7)
[00038494] 4a80                      tst.l      d0
[00038496] 6f0c                      ble.s      edit_insblk_1
[00038498] 4eb9 0003 8eb8            jsr        edit_expand
[0003849e] 4a40                      tst.w      d0
[000384a0] 6600 020a                 bne        edit_insblk_2
edit_insblk_1:
[000384a4] 2f6f 000c 0004            move.l     12(a7),4(a7)
[000384aa] 202f 000c                 move.l     12(a7),d0
[000384ae] b0ab 0028                 cmp.l      40(a3),d0
[000384b2] 6f0a                      ble.s      edit_insblk_3
[000384b4] 2f6b 0028 0004            move.l     40(a3),4(a7)
[000384ba] 2740 0028                 move.l     d0,40(a3)
edit_insblk_3:
[000384be] 202f 0004                 move.l     4(a7),d0
[000384c2] 9083                      sub.l      d3,d0
[000384c4] 5280                      addq.l     #1,d0
[000384c6] 2f40 0010                 move.l     d0,16(a7)
[000384ca] 222f 0004                 move.l     4(a7),d1
[000384ce] 204b                      movea.l    a3,a0
[000384d0] 2003                      move.l     d3,d0
[000384d2] 6100 fe8e                 bsr        edit_makeundo
[000384d6] 2848                      movea.l    a0,a4
[000384d8] 200c                      move.l     a4,d0
[000384da] 6700 01d0                 beq        edit_insblk_2
[000384de] 202b 0092                 move.l     146(a3),d0
[000384e2] 206b 0096                 movea.l    150(a3),a0
[000384e6] 6100 fe4c                 bsr        edit_freeundo
[000384ea] 42ab 0096                 clr.l      150(a3)
[000384ee] 42ab 0092                 clr.l      146(a3)
[000384f2] 206f 001c                 movea.l    28(a7),a0
[000384f6] 2f68 0014 0018            move.l     20(a0),24(a7)
[000384fc] 226f 0018                 movea.l    24(a7),a1
[00038500] 2051                      movea.l    (a1),a0
[00038502] 4eb9 0008 2f6c            jsr        strlen
[00038508] 3e80                      move.w     d0,(a7)
[0003850a] 3c2b 009a                 move.w     154(a3),d6
[0003850e] 206f 001c                 movea.l    28(a7),a0
[00038512] 3228 0006                 move.w     6(a0),d1
[00038516] 2403                      move.l     d3,d2
[00038518] e78a                      lsl.l      #3,d2
[0003851a] 226b 002c                 movea.l    44(a3),a1
[0003851e] 2071 2800                 movea.l    0(a1,d2.l),a0
[00038522] 3006                      move.w     d6,d0
[00038524] 6100 f69c                 bsr        vpos
[00038528] 3f40 0002                 move.w     d0,2(a7)
[0003852c] 2e03                      move.l     d3,d7
[0003852e] 6000 010c                 bra        edit_insblk_4
edit_insblk_13:
[00038532] 2007                      move.l     d7,d0
[00038534] e788                      lsl.l      #3,d0
[00038536] 2c6b 002c                 movea.l    44(a3),a6
[0003853a] ddc0                      adda.l     d0,a6
[0003853c] 2456                      movea.l    (a6),a2
[0003853e] 220a                      move.l     a2,d1
[00038540] 6606                      bne.s      edit_insblk_5
[00038542] 45f9 000c f36c            lea.l      $000CF36C,a2
edit_insblk_5:
[00038548] 322f 0002                 move.w     2(a7),d1
[0003854c] 3006                      move.w     d6,d0
[0003854e] 204a                      movea.l    a2,a0
[00038550] 6100 f634                 bsr        posv
[00038554] 3a00                      move.w     d0,d5
[00038556] 3205                      move.w     d5,d1
[00038558] 204a                      movea.l    a2,a0
[0003855a] 3006                      move.w     d6,d0
[0003855c] 6100 f664                 bsr        vpos
[00038560] 382f 0002                 move.w     2(a7),d4
[00038564] 9840                      sub.w      d0,d4
[00038566] 206f 0018                 movea.l    24(a7),a0
[0003856a] 2050                      movea.l    (a0),a0
[0003856c] 4eb9 0008 2f6c            jsr        strlen
[00038572] 322e 0004                 move.w     4(a6),d1
[00038576] 48c1                      ext.l      d1
[00038578] d081                      add.l      d1,d0
[0003857a] 3404                      move.w     d4,d2
[0003857c] 48c2                      ext.l      d2
[0003857e] d082                      add.l      d2,d0
[00038580] 2f40 0014                 move.l     d0,20(a7)
[00038584] 7001                      moveq.l    #1,d0
[00038586] d0af 0014                 add.l      20(a7),d0
[0003858a] 4eb9 0004 c608            jsr        Ax_malloc
[00038590] 2a48                      movea.l    a0,a5
[00038592] 200d                      move.l     a5,d0
[00038594] 6744                      beq.s      edit_insblk_6
[00038596] 3005                      move.w     d5,d0
[00038598] 48c0                      ext.l      d0
[0003859a] 224a                      movea.l    a2,a1
[0003859c] 4eb9 0008 2fd6            jsr        strncpy
[000385a2] 4a44                      tst.w      d4
[000385a4] 6710                      beq.s      edit_insblk_7
[000385a6] 3204                      move.w     d4,d1
[000385a8] 48c1                      ext.l      d1
[000385aa] 7020                      moveq.l    #32,d0
[000385ac] 41f5 5000                 lea.l      0(a5,d5.w),a0
[000385b0] 4eb9 0008 36ea            jsr        memset
edit_insblk_7:
[000385b6] 206f 0018                 movea.l    24(a7),a0
[000385ba] 2250                      movea.l    (a0),a1
[000385bc] 41f5 5000                 lea.l      0(a5,d5.w),a0
[000385c0] d0c4                      adda.w     d4,a0
[000385c2] 4eb9 0008 2f0c            jsr        strcpy
[000385c8] 43f2 5000                 lea.l      0(a2,d5.w),a1
[000385cc] 41f5 5000                 lea.l      0(a5,d5.w),a0
[000385d0] d0c4                      adda.w     d4,a0
[000385d2] 4eb9 0008 2e42            jsr        strcat
[000385d8] 6050                      bra.s      edit_insblk_8
edit_insblk_6:
[000385da] 006b 0001 009e            ori.w      #$0001,158(a3)
[000385e0] 2803                      move.l     d3,d4
[000385e2] 6036                      bra.s      edit_insblk_9
edit_insblk_12:
[000385e4] 2004                      move.l     d4,d0
[000385e6] e788                      lsl.l      #3,d0
[000385e8] 2c6b 002c                 movea.l    44(a3),a6
[000385ec] ddc0                      adda.l     d0,a6
[000385ee] 2056                      movea.l    (a6),a0
[000385f0] 4eb9 0004 c6c8            jsr        Ax_ifree
[000385f6] 2004                      move.l     d4,d0
[000385f8] 9083                      sub.l      d3,d0
[000385fa] e588                      lsl.l      #2,d0
[000385fc] 2cb4 0800                 move.l     0(a4,d0.l),(a6)
[00038600] 2216                      move.l     (a6),d1
[00038602] 6710                      beq.s      edit_insblk_10
[00038604] 2041                      movea.l    d1,a0
[00038606] 4eb9 0008 2f6c            jsr        strlen
[0003860c] 5240                      addq.w     #1,d0
[0003860e] 3d40 0004                 move.w     d0,4(a6)
[00038612] 6004                      bra.s      edit_insblk_11
edit_insblk_10:
[00038614] 426e 0004                 clr.w      4(a6)
edit_insblk_11:
[00038618] 5284                      addq.l     #1,d4
edit_insblk_9:
[0003861a] be84                      cmp.l      d4,d7
[0003861c] 6cc6                      bge.s      edit_insblk_12
[0003861e] 204c                      movea.l    a4,a0
[00038620] 4eb9 0004 c6c8            jsr        Ax_ifree
[00038626] 6000 0084                 bra        edit_insblk_2
edit_insblk_8:
[0003862a] 2c8d                      move.l     a5,(a6)
[0003862c] 3d6f 0016 0004            move.w     22(a7),4(a6)
[00038632] 426e 0006                 clr.w      6(a6)
[00038636] 58af 0018                 addq.l     #4,24(a7)
[0003863a] 5287                      addq.l     #1,d7
edit_insblk_4:
[0003863c] beaf 000c                 cmp.l      12(a7),d7
[00038640] 6f00 fef0                 ble        edit_insblk_13
[00038644] 274c 0096                 move.l     a4,150(a3)
[00038648] 276f 0010 0092            move.l     16(a7),146(a3)
[0003864e] 026b fdff 0012            andi.w     #$FDFF,18(a3)
[00038654] 006b 0008 0012            ori.w      #$0008,18(a3)
[0003865a] 2743 007a                 move.l     d3,122(a3)
[0003865e] 276f 0004 0082            move.l     4(a7),130(a3)
[00038664] 206f 001c                 movea.l    28(a7),a0
[00038668] 2028 0004                 move.l     4(a0),d0
[0003866c] 2740 007e                 move.l     d0,126(a3)
[00038670] 2740 0086                 move.l     d0,134(a3)
[00038674] 276f 000c 008a            move.l     12(a7),138(a3)
[0003867a] 3017                      move.w     (a7),d0
[0003867c] 48c0                      ext.l      d0
[0003867e] d0a8 0004                 add.l      4(a0),d0
[00038682] 2740 008e                 move.l     d0,142(a3)
[00038686] 2743 0030                 move.l     d3,48(a3)
[0003868a] 276b 008e 0034            move.l     142(a3),52(a3)
[00038690] 322b 0036                 move.w     54(a3),d1
[00038694] 3006                      move.w     d6,d0
[00038696] 2403                      move.l     d3,d2
[00038698] e78a                      lsl.l      #3,d2
[0003869a] 226b 002c                 movea.l    44(a3),a1
[0003869e] 2071 2800                 movea.l    0(a1,d2.l),a0
[000386a2] 6100 f51e                 bsr        vpos
[000386a6] 48c0                      ext.l      d0
[000386a8] 2740 0040                 move.l     d0,64(a3)
edit_insblk_2:
[000386ac] 4fef 0020                 lea.l      32(a7),a7
[000386b0] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[000386b4] 4e75                      rts

edit_cutblk:
[000386b6] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[000386ba] 4fef fff4                 lea.l      -12(a7),a7
[000386be] 2648                      movea.l    a0,a3
[000386c0] 2449                      movea.l    a1,a2
[000386c2] 202a 0004                 move.l     4(a2),d0
[000386c6] b0aa 000c                 cmp.l      12(a2),d0
[000386ca] 6d10                      blt.s      edit_cutblk_1
[000386cc] 202a 0010                 move.l     16(a2),d0
[000386d0] 206a 0014                 movea.l    20(a2),a0
[000386d4] 6100 fc5e                 bsr        edit_freeundo
[000386d8] 6000 01a6                 bra        edit_cutblk_2
edit_cutblk_1:
[000386dc] 222a 0008                 move.l     8(a2),d1
[000386e0] 2012                      move.l     (a2),d0
[000386e2] 204b                      movea.l    a3,a0
[000386e4] 6100 fc7c                 bsr        edit_makeundo
[000386e8] 2f48 0008                 move.l     a0,8(a7)
[000386ec] 2008                      move.l     a0,d0
[000386ee] 6700 0190                 beq        edit_cutblk_2
[000386f2] 202b 0092                 move.l     146(a3),d0
[000386f6] 206b 0096                 movea.l    150(a3),a0
[000386fa] 6100 fc38                 bsr        edit_freeundo
[000386fe] 42ab 0096                 clr.l      150(a3)
[00038702] 42ab 0092                 clr.l      146(a3)
[00038706] 202a 0008                 move.l     8(a2),d0
[0003870a] 9092                      sub.l      (a2),d0
[0003870c] 5280                      addq.l     #1,d0
[0003870e] 2f40 0004                 move.l     d0,4(a7)
[00038712] 382b 009a                 move.w     154(a3),d4
[00038716] 322a 0006                 move.w     6(a2),d1
[0003871a] 2412                      move.l     (a2),d2
[0003871c] e78a                      lsl.l      #3,d2
[0003871e] 206b 002c                 movea.l    44(a3),a0
[00038722] 2070 2800                 movea.l    0(a0,d2.l),a0
[00038726] 3004                      move.w     d4,d0
[00038728] 6100 f498                 bsr        vpos
[0003872c] 3f40 0002                 move.w     d0,2(a7)
[00038730] 322a 000e                 move.w     14(a2),d1
[00038734] 242a 0008                 move.l     8(a2),d2
[00038738] e78a                      lsl.l      #3,d2
[0003873a] 206b 002c                 movea.l    44(a3),a0
[0003873e] 2070 2800                 movea.l    0(a0,d2.l),a0
[00038742] 3004                      move.w     d4,d0
[00038744] 6100 f47c                 bsr        vpos
[00038748] 3e80                      move.w     d0,(a7)
[0003874a] 322f 0002                 move.w     2(a7),d1
[0003874e] b240                      cmp.w      d0,d1
[00038750] 6f08                      ble.s      edit_cutblk_3
[00038752] 3001                      move.w     d1,d0
[00038754] 3f57 0002                 move.w     (a7),2(a7)
[00038758] 3e80                      move.w     d0,(a7)
edit_cutblk_3:
[0003875a] 2e12                      move.l     (a2),d7
[0003875c] 6000 00d2                 bra        edit_cutblk_4
edit_cutblk_13:
[00038760] 2007                      move.l     d7,d0
[00038762] e788                      lsl.l      #3,d0
[00038764] 2a6b 002c                 movea.l    44(a3),a5
[00038768] dbc0                      adda.l     d0,a5
[0003876a] 2c55                      movea.l    (a5),a6
[0003876c] 220e                      move.l     a6,d1
[0003876e] 6700 00be                 beq        edit_cutblk_5
[00038772] 204e                      movea.l    a6,a0
[00038774] 3004                      move.w     d4,d0
[00038776] 322f 0002                 move.w     2(a7),d1
[0003877a] 6100 f40a                 bsr        posv
[0003877e] 3600                      move.w     d0,d3
[00038780] 3217                      move.w     (a7),d1
[00038782] 204e                      movea.l    a6,a0
[00038784] 3004                      move.w     d4,d0
[00038786] 6100 f3fe                 bsr        posv
[0003878a] 3a00                      move.w     d0,d5
[0003878c] 3c05                      move.w     d5,d6
[0003878e] 9c43                      sub.w      d3,d6
[00038790] 48c6                      ext.l      d6
[00038792] 4a86                      tst.l      d6
[00038794] 6f00 0098                 ble        edit_cutblk_5
[00038798] 322d 0004                 move.w     4(a5),d1
[0003879c] 48c1                      ext.l      d1
[0003879e] 9286                      sub.l      d6,d1
[000387a0] 2c01                      move.l     d1,d6
[000387a2] 4a81                      tst.l      d1
[000387a4] 6f00 007c                 ble.w      edit_cutblk_6
[000387a8] 7001                      moveq.l    #1,d0
[000387aa] d081                      add.l      d1,d0
[000387ac] 4eb9 0004 c608            jsr        Ax_malloc
[000387b2] 2848                      movea.l    a0,a4
[000387b4] 200c                      move.l     a4,d0
[000387b6] 671c                      beq.s      edit_cutblk_7
[000387b8] 3003                      move.w     d3,d0
[000387ba] 48c0                      ext.l      d0
[000387bc] 224e                      movea.l    a6,a1
[000387be] 4eb9 0008 2fd6            jsr        strncpy
[000387c4] 43f6 5000                 lea.l      0(a6,d5.w),a1
[000387c8] 41f4 3000                 lea.l      0(a4,d3.w),a0
[000387cc] 4eb9 0008 2f0c            jsr        strcpy
[000387d2] 6050                      bra.s      edit_cutblk_8
edit_cutblk_7:
[000387d4] 2a12                      move.l     (a2),d5
[000387d6] 603a                      bra.s      edit_cutblk_9
[000387d8] 2005                      move.l     d5,d0
edit_cutblk_12:
[000387da] e788                      lsl.l      #3,d0
[000387dc] 2a6b 002c                 movea.l    44(a3),a5
[000387e0] dbc0                      adda.l     d0,a5
[000387e2] 2055                      movea.l    (a5),a0
[000387e4] 4eb9 0004 c6c8            jsr        Ax_ifree
[000387ea] 2005                      move.l     d5,d0
[000387ec] 9092                      sub.l      (a2),d0
[000387ee] e588                      lsl.l      #2,d0
[000387f0] 206f 0008                 movea.l    8(a7),a0
[000387f4] 2ab0 0800                 move.l     0(a0,d0.l),(a5)
[000387f8] 2015                      move.l     (a5),d0
[000387fa] 6710                      beq.s      edit_cutblk_10
[000387fc] 2040                      movea.l    d0,a0
[000387fe] 4eb9 0008 2f6c            jsr        strlen
[00038804] 5240                      addq.w     #1,d0
[00038806] 3b40 0004                 move.w     d0,4(a5)
[0003880a] 6004                      bra.s      edit_cutblk_11
edit_cutblk_10:
[0003880c] 426d 0004                 clr.w      4(a5)
edit_cutblk_11:
[00038810] 5285                      addq.l     #1,d5
edit_cutblk_9:
[00038812] be85                      cmp.l      d5,d7
[00038814] 6ec2                      bgt.s      edit_cutblk_12
[00038816] 206f 0008                 movea.l    8(a7),a0
[0003881a] 4eb9 0004 c6c8            jsr        Ax_ifree
[00038820] 605e                      bra.s      edit_cutblk_2
edit_cutblk_6:
[00038822] 99cc                      suba.l     a4,a4
edit_cutblk_8:
[00038824] 2a8c                      move.l     a4,(a5)
[00038826] 3b46 0004                 move.w     d6,4(a5)
[0003882a] 426d 0006                 clr.w      6(a5)
edit_cutblk_5:
[0003882e] 5287                      addq.l     #1,d7
edit_cutblk_4:
[00038830] beaa 0008                 cmp.l      8(a2),d7
[00038834] 6f00 ff2a                 ble        edit_cutblk_13
[00038838] 2752 007a                 move.l     (a2),122(a3)
[0003883c] 202a 0004                 move.l     4(a2),d0
[00038840] 2740 007e                 move.l     d0,126(a3)
[00038844] 2740 008e                 move.l     d0,142(a3)
[00038848] 2740 0034                 move.l     d0,52(a3)
[0003884c] 222a 0008                 move.l     8(a2),d1
[00038850] 2741 0082                 move.l     d1,130(a3)
[00038854] 2741 008a                 move.l     d1,138(a3)
[00038858] 276a 000c 0086            move.l     12(a2),134(a3)
[0003885e] 302f 0002                 move.w     2(a7),d0
[00038862] 48c0                      ext.l      d0
[00038864] 2740 0040                 move.l     d0,64(a3)
[00038868] 276f 0008 0096            move.l     8(a7),150(a3)
[0003886e] 276f 0004 0092            move.l     4(a7),146(a3)
[00038874] 026b fdff 0012            andi.w     #$FDFF,18(a3)
[0003887a] 006b 0008 0012            ori.w      #$0008,18(a3)
edit_cutblk_2:
[00038880] 4fef 000c                 lea.l      12(a7),a7
[00038884] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[00038888] 4e75                      rts

edit_substitute:
[0003888a] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0003888e] 4fef ffe6                 lea.l      -26(a7),a7
[00038892] 2448                      movea.l    a0,a2
[00038894] 2649                      movea.l    a1,a3
[00038896] 006a 2000 0012            ori.w      #$2000,18(a2)
[0003889c] 426f 0010                 clr.w      16(a7)
[000388a0] 0c6a 0005 0070            cmpi.w     #$0005,112(a2)
[000388a6] 6670                      bne.s      edit_substitute_1
[000388a8] 302a 0012                 move.w     18(a2),d0
[000388ac] c07c 0200                 and.w      #$0200,d0
[000388b0] 6710                      beq.s      edit_substitute_2
[000388b2] 4242                      clr.w      d2
[000388b4] 222a 0038                 move.l     56(a2),d1
[000388b8] 202a 0030                 move.l     48(a2),d0
[000388bc] 4eb9 0003 966e            jsr        edit_selrange
edit_substitute_2:
[000388c2] 2013                      move.l     (a3),d0
[000388c4] b0ab 0008                 cmp.l      8(a3),d0
[000388c8] 6620                      bne.s      edit_substitute_3
[000388ca] 222b 0004                 move.l     4(a3),d1
[000388ce] b2ab 000c                 cmp.l      12(a3),d1
[000388d2] 6616                      bne.s      edit_substitute_3
[000388d4] 206b 0014                 movea.l    20(a3),a0
[000388d8] 2250                      movea.l    (a0),a1
[000388da] 1411                      move.b     (a1),d2
[000388dc] 673a                      beq.s      edit_substitute_1
[000388de] 204a                      movea.l    a2,a0
[000388e0] 224b                      movea.l    a3,a1
[000388e2] 6100 fb8a                 bsr        edit_insblk
[000388e6] 6000 0376                 bra        edit_substitute_4
edit_substitute_3:
[000388ea] 7001                      moveq.l    #1,d0
[000388ec] b0ab 0010                 cmp.l      16(a3),d0
[000388f0] 6616                      bne.s      edit_substitute_5
[000388f2] 206b 0014                 movea.l    20(a3),a0
[000388f6] 2250                      movea.l    (a0),a1
[000388f8] 1211                      move.b     (a1),d1
[000388fa] 660c                      bne.s      edit_substitute_5
[000388fc] 204a                      movea.l    a2,a0
[000388fe] 224b                      movea.l    a3,a1
[00038900] 6100 fdb4                 bsr        edit_cutblk
[00038904] 6000 0358                 bra        edit_substitute_4
edit_substitute_5:
[00038908] 3f7c 0001 0010            move.w     #$0001,16(a7)
[0003890e] 2753 0008                 move.l     (a3),8(a3)
[00038912] 276b 0004 000c            move.l     4(a3),12(a3)
edit_substitute_1:
[00038918] 2813                      move.l     (a3),d4
[0003891a] 2a2b 0008                 move.l     8(a3),d5
[0003891e] 9a84                      sub.l      d4,d5
[00038920] 5285                      addq.l     #1,d5
[00038922] 222b 0008                 move.l     8(a3),d1
[00038926] 2013                      move.l     (a3),d0
[00038928] 204a                      movea.l    a2,a0
[0003892a] 6100 fa36                 bsr        edit_makeundo
[0003892e] 2f48 0008                 move.l     a0,8(a7)
[00038932] 2008                      move.l     a0,d0
[00038934] 6700 0328                 beq        edit_substitute_4
[00038938] 202a 0092                 move.l     146(a2),d0
[0003893c] 206a 0096                 movea.l    150(a2),a0
[00038940] 6100 f9f2                 bsr        edit_freeundo
[00038944] 42aa 0096                 clr.l      150(a2)
[00038948] 42aa 0092                 clr.l      146(a2)
[0003894c] 7008                      moveq.l    #8,d0
[0003894e] 222b 0008                 move.l     8(a3),d1
[00038952] e789                      lsl.l      #3,d1
[00038954] 226a 002c                 movea.l    44(a2),a1
[00038958] d3c1                      adda.l     d1,a1
[0003895a] 41d7                      lea.l      (a7),a0
[0003895c] 4eb9 0008 3500            jsr        memcpy
[00038962] 7001                      moveq.l    #1,d0
[00038964] d084                      add.l      d4,d0
[00038966] 2f40 0016                 move.l     d0,22(a7)
[0003896a] 72ff                      moveq.l    #-1,d1
[0003896c] d2ab 0010                 add.l      16(a3),d1
[00038970] 92ab 0008                 sub.l      8(a3),d1
[00038974] d284                      add.l      d4,d1
[00038976] 2f41 0012                 move.l     d1,18(a7)
[0003897a] 204a                      movea.l    a2,a0
[0003897c] 6100 fa32                 bsr        edit_movelines
[00038980] 4a40                      tst.w      d0
[00038982] 670e                      beq.s      edit_substitute_6
[00038984] 206f 0008                 movea.l    8(a7),a0
[00038988] 4eb9 0004 c6c8            jsr        Ax_ifree
[0003898e] 6000 02ce                 bra        edit_substitute_4
edit_substitute_6:
[00038992] 026a fdff 0012            andi.w     #$FDFF,18(a2)
[00038998] 2553 007a                 move.l     (a3),122(a2)
[0003899c] 256b 0004 007e            move.l     4(a3),126(a2)
[000389a2] 256b 0008 0082            move.l     8(a3),130(a2)
[000389a8] 256b 000c 0086            move.l     12(a3),134(a2)
[000389ae] 2f6b 0014 000c            move.l     20(a3),12(a7)
[000389b4] 7001                      moveq.l    #1,d0
[000389b6] b0ab 0010                 cmp.l      16(a3),d0
[000389ba] 6600 00cc                 bne        edit_substitute_7
[000389be] b085                      cmp.l      d5,d0
[000389c0] 6612                      bne.s      edit_substitute_8
[000389c2] 322f 0010                 move.w     16(a7),d1
[000389c6] 660c                      bne.s      edit_substitute_8
[000389c8] 204a                      movea.l    a2,a0
[000389ca] 2004                      move.l     d4,d0
[000389cc] 4eb9 0003 8dc8            jsr        edit_updateline
[000389d2] 6006                      bra.s      edit_substitute_9
edit_substitute_8:
[000389d4] 006a 0008 0012            ori.w      #$0008,18(a2)
edit_substitute_9:
[000389da] 2004                      move.l     d4,d0
[000389dc] e788                      lsl.l      #3,d0
[000389de] 2a6a 002c                 movea.l    44(a2),a5
[000389e2] dbc0                      adda.l     d0,a5
[000389e4] 206f 000c                 movea.l    12(a7),a0
[000389e8] 2050                      movea.l    (a0),a0
[000389ea] 4eb9 0008 2f6c            jsr        strlen
[000389f0] 2600                      move.l     d0,d3
[000389f2] d6ab 0004                 add.l      4(a3),d3
[000389f6] 2e03                      move.l     d3,d7
[000389f8] 9eab 000c                 sub.l      12(a3),d7
[000389fc] 302f 0004                 move.w     4(a7),d0
[00038a00] 48c0                      ext.l      d0
[00038a02] de80                      add.l      d0,d7
[00038a04] 4a87                      tst.l      d7
[00038a06] 6f56                      ble.s      edit_substitute_10
[00038a08] 7001                      moveq.l    #1,d0
[00038a0a] d087                      add.l      d7,d0
[00038a0c] 4eb9 0004 c608            jsr        Ax_malloc
[00038a12] 2848                      movea.l    a0,a4
[00038a14] 200c                      move.l     a4,d0
[00038a16] 6700 0226                 beq        edit_substitute_11
[00038a1a] 302d 0004                 move.w     4(a5),d0
[00038a1e] 6f0c                      ble.s      edit_substitute_12
[00038a20] 202b 0004                 move.l     4(a3),d0
[00038a24] 2255                      movea.l    (a5),a1
[00038a26] 4eb9 0008 2fd6            jsr        strncpy
edit_substitute_12:
[00038a2c] 206f 000c                 movea.l    12(a7),a0
[00038a30] 2250                      movea.l    (a0),a1
[00038a32] 202b 0004                 move.l     4(a3),d0
[00038a36] 41f4 0800                 lea.l      0(a4,d0.l),a0
[00038a3a] 4eb9 0008 2f0c            jsr        strcpy
[00038a40] 302f 0004                 move.w     4(a7),d0
[00038a44] 6f1a                      ble.s      edit_substitute_13
[00038a46] 222b 000c                 move.l     12(a3),d1
[00038a4a] 2257                      movea.l    (a7),a1
[00038a4c] d3c1                      adda.l     d1,a1
[00038a4e] 242b 0004                 move.l     4(a3),d2
[00038a52] 41f4 2800                 lea.l      0(a4,d2.l),a0
[00038a56] 4eb9 0008 2e42            jsr        strcat
[00038a5c] 6002                      bra.s      edit_substitute_13
edit_substitute_10:
[00038a5e] 99cc                      suba.l     a4,a4
edit_substitute_13:
[00038a60] 2544 0030                 move.l     d4,48(a2)
[00038a64] 2543 0034                 move.l     d3,52(a2)
[00038a68] 3203                      move.w     d3,d1
[00038a6a] 302a 009a                 move.w     154(a2),d0
[00038a6e] 204c                      movea.l    a4,a0
[00038a70] 6100 f150                 bsr        vpos
[00038a74] 48c0                      ext.l      d0
[00038a76] 2540 0040                 move.l     d0,64(a2)
[00038a7a] 2a8c                      move.l     a4,(a5)
[00038a7c] 3b47 0004                 move.w     d7,4(a5)
[00038a80] 426d 0006                 clr.w      6(a5)
[00038a84] 6000 0156                 bra        edit_substitute_14
edit_substitute_7:
[00038a88] 006a 0008 0012            ori.w      #$0008,18(a2)
[00038a8e] 2004                      move.l     d4,d0
[00038a90] e788                      lsl.l      #3,d0
[00038a92] 2a6a 002c                 movea.l    44(a2),a5
[00038a96] dbc0                      adda.l     d0,a5
[00038a98] 206f 000c                 movea.l    12(a7),a0
[00038a9c] 2050                      movea.l    (a0),a0
[00038a9e] 4eb9 0008 2f6c            jsr        strlen
[00038aa4] 2e00                      move.l     d0,d7
[00038aa6] deab 0004                 add.l      4(a3),d7
[00038aaa] 4a87                      tst.l      d7
[00038aac] 6f34                      ble.s      edit_substitute_15
[00038aae] 7001                      moveq.l    #1,d0
[00038ab0] d087                      add.l      d7,d0
[00038ab2] 4eb9 0004 c608            jsr        Ax_malloc
[00038ab8] 2848                      movea.l    a0,a4
[00038aba] 200c                      move.l     a4,d0
[00038abc] 6700 0180                 beq        edit_substitute_11
[00038ac0] 202b 0004                 move.l     4(a3),d0
[00038ac4] 2255                      movea.l    (a5),a1
[00038ac6] 4eb9 0008 2fd6            jsr        strncpy
[00038acc] 206f 000c                 movea.l    12(a7),a0
[00038ad0] 2250                      movea.l    (a0),a1
[00038ad2] 202b 0004                 move.l     4(a3),d0
[00038ad6] 41f4 0800                 lea.l      0(a4,d0.l),a0
[00038ada] 4eb9 0008 2f0c            jsr        strcpy
[00038ae0] 6002                      bra.s      edit_substitute_16
edit_substitute_15:
[00038ae2] 99cc                      suba.l     a4,a4
edit_substitute_16:
[00038ae4] 2a8c                      move.l     a4,(a5)
[00038ae6] 3b47 0004                 move.w     d7,4(a5)
[00038aea] 426d 0006                 clr.w      6(a5)
[00038aee] 202b 0010                 move.l     16(a3),d0
[00038af2] e588                      lsl.l      #2,d0
[00038af4] 206f 000c                 movea.l    12(a7),a0
[00038af8] 2c70 08fc                 movea.l    -4(a0,d0.l),a6
[00038afc] 204e                      movea.l    a6,a0
[00038afe] 4eb9 0008 2f6c            jsr        strlen
[00038b04] 2600                      move.l     d0,d3
[00038b06] 3e2f 0004                 move.w     4(a7),d7
[00038b0a] 48c7                      ext.l      d7
[00038b0c] de83                      add.l      d3,d7
[00038b0e] 9eab 000c                 sub.l      12(a3),d7
[00038b12] 4a87                      tst.l      d7
[00038b14] 6f36                      ble.s      edit_substitute_17
[00038b16] 7001                      moveq.l    #1,d0
[00038b18] d087                      add.l      d7,d0
[00038b1a] 4eb9 0004 c608            jsr        Ax_malloc
[00038b20] 2848                      movea.l    a0,a4
[00038b22] 200c                      move.l     a4,d0
[00038b24] 6720                      beq.s      edit_substitute_18
[00038b26] 224e                      movea.l    a6,a1
[00038b28] 4eb9 0008 2f0c            jsr        strcpy
[00038b2e] 302f 0004                 move.w     4(a7),d0
[00038b32] 6f1a                      ble.s      edit_substitute_19
[00038b34] 222b 000c                 move.l     12(a3),d1
[00038b38] 2257                      movea.l    (a7),a1
[00038b3a] d3c1                      adda.l     d1,a1
[00038b3c] 204c                      movea.l    a4,a0
[00038b3e] 4eb9 0008 2e42            jsr        strcat
[00038b44] 6008                      bra.s      edit_substitute_19
edit_substitute_18:
[00038b46] 7c01                      moveq.l    #1,d6
[00038b48] 6000 00aa                 bra        edit_substitute_20
edit_substitute_17:
[00038b4c] 99cc                      suba.l     a4,a4
edit_substitute_19:
[00038b4e] 3203                      move.w     d3,d1
[00038b50] 302a 009a                 move.w     154(a2),d0
[00038b54] 204c                      movea.l    a4,a0
[00038b56] 6100 f06a                 bsr        vpos
[00038b5a] 48c0                      ext.l      d0
[00038b5c] 2540 0040                 move.l     d0,64(a2)
[00038b60] 222b 0010                 move.l     16(a3),d1
[00038b64] e789                      lsl.l      #3,d1
[00038b66] 2404                      move.l     d4,d2
[00038b68] e78a                      lsl.l      #3,d2
[00038b6a] 2a6a 002c                 movea.l    44(a2),a5
[00038b6e] dbc2                      adda.l     d2,a5
[00038b70] 4bf5 18f8                 lea.l      -8(a5,d1.l),a5
[00038b74] 2a8c                      move.l     a4,(a5)
[00038b76] 3b47 0004                 move.w     d7,4(a5)
[00038b7a] 426d 0006                 clr.w      6(a5)
[00038b7e] 7c01                      moveq.l    #1,d6
[00038b80] 6040                      bra.s      edit_substitute_21
edit_substitute_22:
[00038b82] 2006                      move.l     d6,d0
[00038b84] e788                      lsl.l      #3,d0
[00038b86] 2204                      move.l     d4,d1
[00038b88] e789                      lsl.l      #3,d1
[00038b8a] 2a6a 002c                 movea.l    44(a2),a5
[00038b8e] dbc1                      adda.l     d1,a5
[00038b90] dbc0                      adda.l     d0,a5
[00038b92] 2406                      move.l     d6,d2
[00038b94] e58a                      lsl.l      #2,d2
[00038b96] 206f 000c                 movea.l    12(a7),a0
[00038b9a] 2c70 2800                 movea.l    0(a0,d2.l),a6
[00038b9e] 204e                      movea.l    a6,a0
[00038ba0] 4eb9 0008 2f6c            jsr        strlen
[00038ba6] 2e00                      move.l     d0,d7
[00038ba8] 204e                      movea.l    a6,a0
[00038baa] 4eb9 0004 643c            jsr        Ast_create
[00038bb0] 2848                      movea.l    a0,a4
[00038bb2] 200c                      move.l     a4,d0
[00038bb4] 673e                      beq.s      edit_substitute_20
[00038bb6] 2a80                      move.l     d0,(a5)
[00038bb8] 3b47 0004                 move.w     d7,4(a5)
[00038bbc] 426d 0006                 clr.w      6(a5)
[00038bc0] 5286                      addq.l     #1,d6
edit_substitute_21:
[00038bc2] 70ff                      moveq.l    #-1,d0
[00038bc4] d0ab 0010                 add.l      16(a3),d0
[00038bc8] bc80                      cmp.l      d0,d6
[00038bca] 6db6                      blt.s      edit_substitute_22
[00038bcc] 2543 0034                 move.l     d3,52(a2)
[00038bd0] 2004                      move.l     d4,d0
[00038bd2] d0ab 0010                 add.l      16(a3),d0
[00038bd6] 5380                      subq.l     #1,d0
[00038bd8] 2540 0030                 move.l     d0,48(a2)
edit_substitute_14:
[00038bdc] 256a 0030 008a            move.l     48(a2),138(a2)
[00038be2] 256a 0034 008e            move.l     52(a2),142(a2)
[00038be8] 256f 0008 0096            move.l     8(a7),150(a2)
[00038bee] 2545 0092                 move.l     d5,146(a2)
[00038bf2] 606a                      bra.s      edit_substitute_4
edit_substitute_20:
[00038bf4] 7e00                      moveq.l    #0,d7
[00038bf6] 6042                      bra.s      edit_substitute_23
edit_substitute_26:
[00038bf8] 2007                      move.l     d7,d0
[00038bfa] e788                      lsl.l      #3,d0
[00038bfc] 2204                      move.l     d4,d1
[00038bfe] e789                      lsl.l      #3,d1
[00038c00] 2a6a 002c                 movea.l    44(a2),a5
[00038c04] dbc1                      adda.l     d1,a5
[00038c06] dbc0                      adda.l     d0,a5
[00038c08] 2055                      movea.l    (a5),a0
[00038c0a] 4eb9 0004 c6c8            jsr        Ax_ifree
[00038c10] ba87                      cmp.l      d7,d5
[00038c12] 6f24                      ble.s      edit_substitute_24
[00038c14] 2007                      move.l     d7,d0
[00038c16] e588                      lsl.l      #2,d0
[00038c18] 206f 0008                 movea.l    8(a7),a0
[00038c1c] 2ab0 0800                 move.l     0(a0,d0.l),(a5)
[00038c20] 2215                      move.l     (a5),d1
[00038c22] 6710                      beq.s      edit_substitute_25
[00038c24] 2041                      movea.l    d1,a0
[00038c26] 4eb9 0008 2f6c            jsr        strlen
[00038c2c] 5240                      addq.w     #1,d0
[00038c2e] 3b40 0004                 move.w     d0,4(a5)
[00038c32] 6004                      bra.s      edit_substitute_24
edit_substitute_25:
[00038c34] 426d 0004                 clr.w      4(a5)
edit_substitute_24:
[00038c38] 5287                      addq.l     #1,d7
edit_substitute_23:
[00038c3a] bc87                      cmp.l      d7,d6
[00038c3c] 6eba                      bgt.s      edit_substitute_26
edit_substitute_11:
[00038c3e] 222f 0012                 move.l     18(a7),d1
[00038c42] 4481                      neg.l      d1
[00038c44] 202f 0016                 move.l     22(a7),d0
[00038c48] 204a                      movea.l    a2,a0
[00038c4a] 6100 f764                 bsr        edit_movelines
[00038c4e] 206f 0008                 movea.l    8(a7),a0
[00038c52] 4eb9 0004 c6c8            jsr        Ax_ifree
[00038c58] 006a 0008 0012            ori.w      #$0008,18(a2)
edit_substitute_4:
[00038c5e] 4fef 001a                 lea.l      26(a7),a7
[00038c62] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[00038c66] 4e75                      rts

edit_undo:
[00038c68] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00038c6c] 2448                      movea.l    a0,a2
[00038c6e] 202a 0096                 move.l     150(a2),d0
[00038c72] 6700 014e                 beq        edit_undo_1
[00038c76] 222a 008a                 move.l     138(a2),d1
[00038c7a] 202a 007a                 move.l     122(a2),d0
[00038c7e] 6100 f6e2                 bsr        edit_makeundo
[00038c82] 2648                      movea.l    a0,a3
[00038c84] 200b                      move.l     a3,d0
[00038c86] 6700 013a                 beq        edit_undo_1
[00038c8a] 262a 0082                 move.l     130(a2),d3
[00038c8e] 96aa 008a                 sub.l      138(a2),d3
[00038c92] 2203                      move.l     d3,d1
[00038c94] 202a 007a                 move.l     122(a2),d0
[00038c98] 204a                      movea.l    a2,a0
[00038c9a] 6100 f714                 bsr        edit_movelines
[00038c9e] 4a40                      tst.w      d0
[00038ca0] 6600 0120                 bne        edit_undo_1
[00038ca4] 302a 0012                 move.w     18(a2),d0
[00038ca8] c07c 0200                 and.w      #$0200,d0
[00038cac] 6712                      beq.s      edit_undo_2
[00038cae] 4242                      clr.w      d2
[00038cb0] 222a 0038                 move.l     56(a2),d1
[00038cb4] 202a 0030                 move.l     48(a2),d0
[00038cb8] 204a                      movea.l    a2,a0
[00038cba] 4eb9 0003 966e            jsr        edit_selrange
edit_undo_2:
[00038cc0] 202a 007a                 move.l     122(a2),d0
[00038cc4] e788                      lsl.l      #3,d0
[00038cc6] 286a 002c                 movea.l    44(a2),a4
[00038cca] d9c0                      adda.l     d0,a4
[00038ccc] 262a 0092                 move.l     146(a2),d3
[00038cd0] 2a6a 0096                 movea.l    150(a2),a5
[00038cd4] 6022                      bra.s      edit_undo_3
edit_undo_6:
[00038cd6] 2895                      move.l     (a5),(a4)
[00038cd8] 2015                      move.l     (a5),d0
[00038cda] 670e                      beq.s      edit_undo_4
[00038cdc] 2040                      movea.l    d0,a0
[00038cde] 4eb9 0008 2f6c            jsr        strlen
[00038ce4] 3940 0004                 move.w     d0,4(a4)
[00038ce8] 6004                      bra.s      edit_undo_5
edit_undo_4:
[00038cea] 426c 0004                 clr.w      4(a4)
edit_undo_5:
[00038cee] 397c 0001 0006            move.w     #$0001,6(a4)
[00038cf4] 584d                      addq.w     #4,a5
[00038cf6] 504c                      addq.w     #8,a4
edit_undo_3:
[00038cf8] 2003                      move.l     d3,d0
[00038cfa] 5383                      subq.l     #1,d3
[00038cfc] 4a80                      tst.l      d0
[00038cfe] 66d6                      bne.s      edit_undo_6
[00038d00] 206a 0096                 movea.l    150(a2),a0
[00038d04] 4eb9 0004 c6c8            jsr        Ax_ifree
[00038d0a] 254b 0096                 move.l     a3,150(a2)
[00038d0e] 202a 008a                 move.l     138(a2),d0
[00038d12] 90aa 007a                 sub.l      122(a2),d0
[00038d16] 5280                      addq.l     #1,d0
[00038d18] 2540 0092                 move.l     d0,146(a2)
[00038d1c] 256a 0082 0038            move.l     130(a2),56(a2)
[00038d22] 256a 008a 0082            move.l     138(a2),130(a2)
[00038d28] 256a 0038 008a            move.l     56(a2),138(a2)
[00038d2e] 256a 0086 003c            move.l     134(a2),60(a2)
[00038d34] 256a 008e 0086            move.l     142(a2),134(a2)
[00038d3a] 256a 003c 008e            move.l     60(a2),142(a2)
[00038d40] 256a 007a 0030            move.l     122(a2),48(a2)
[00038d46] 256a 007e 0034            move.l     126(a2),52(a2)
[00038d4c] 322a 0036                 move.w     54(a2),d1
[00038d50] 302a 009a                 move.w     154(a2),d0
[00038d54] 242a 0030                 move.l     48(a2),d2
[00038d58] e78a                      lsl.l      #3,d2
[00038d5a] 206a 002c                 movea.l    44(a2),a0
[00038d5e] 2070 2800                 movea.l    0(a0,d2.l),a0
[00038d62] 6100 ee5e                 bsr        vpos
[00038d66] 48c0                      ext.l      d0
[00038d68] 2540 0040                 move.l     d0,64(a2)
[00038d6c] 322a 003e                 move.w     62(a2),d1
[00038d70] 302a 009a                 move.w     154(a2),d0
[00038d74] 242a 0038                 move.l     56(a2),d2
[00038d78] e78a                      lsl.l      #3,d2
[00038d7a] 206a 002c                 movea.l    44(a2),a0
[00038d7e] 2070 2800                 movea.l    0(a0,d2.l),a0
[00038d82] 6100 ee3e                 bsr        vpos
[00038d86] 48c0                      ext.l      d0
[00038d88] 2540 0044                 move.l     d0,68(a2)
[00038d8c] 0c6a 0005 0070            cmpi.w     #$0005,112(a2)
[00038d92] 670a                      beq.s      edit_undo_7
[00038d94] 222a 0030                 move.l     48(a2),d1
[00038d98] b2aa 0038                 cmp.l      56(a2),d1
[00038d9c] 6618                      bne.s      edit_undo_8
edit_undo_7:
[00038d9e] 202a 0034                 move.l     52(a2),d0
[00038da2] b0aa 003c                 cmp.l      60(a2),d0
[00038da6] 660e                      bne.s      edit_undo_8
[00038da8] 006a 0008 0012            ori.w      #$0008,18(a2)
[00038dae] 026a fdff 0012            andi.w     #$FDFF,18(a2)
[00038db4] 6006                      bra.s      edit_undo_9
edit_undo_8:
[00038db6] 006a 0208 0012            ori.w      #$0208,18(a2)
edit_undo_9:
[00038dbc] 204a                      movea.l    a2,a0
[00038dbe] 6100 f44a                 bsr        edit_view
edit_undo_1:
[00038dc2] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00038dc6] 4e75                      rts

edit_updateline:
[00038dc8] 7204                      moveq.l    #4,d1
[00038dca] c268 0012                 and.w      18(a0),d1
[00038dce] 6730                      beq.s      edit_updateline_1
[00038dd0] b0a8 0066                 cmp.l      102(a0),d0
[00038dd4] 6738                      beq.s      edit_updateline_2
[00038dd6] b0a8 006a                 cmp.l      106(a0),d0
[00038dda] 6732                      beq.s      edit_updateline_2
[00038ddc] 7401                      moveq.l    #1,d2
[00038dde] d4a8 006a                 add.l      106(a0),d2
[00038de2] b082                      cmp.l      d2,d0
[00038de4] 6612                      bne.s      edit_updateline_3
[00038de6] 2228 0018                 move.l     24(a0),d1
[00038dea] d2a8 000a                 add.l      10(a0),d1
[00038dee] b081                      cmp.l      d1,d0
[00038df0] 6606                      bne.s      edit_updateline_3
[00038df2] 52a8 006a                 addq.l     #1,106(a0)
[00038df6] 4e75                      rts
edit_updateline_3:
edit_updateline_1:
edit_updateline_2:

[00038df8] 0068 0008 0012            ori.w      #$0008,18(a0)
[00038dfe] 4e75                      rts

[00038e00] 0068 0004 0012            ori.w      #$0004,18(a0)
[00038e06] 2140 0066                 move.l     d0,102(a0)
[00038e0a] 2140 006a                 move.l     d0,106(a0)
[00038e0e] 4e75                      rts

edit_showline:
[00038e10] 2f03                      move.l     d3,-(a7)
[00038e12] 2f0a                      move.l     a2,-(a7)
[00038e14] 2448                      movea.l    a0,a2
[00038e16] 2600                      move.l     d0,d3
[00038e18] 4a80                      tst.l      d0
[00038e1a] 6a02                      bpl.s      edit_showline_1
[00038e1c] 7600                      moveq.l    #0,d3
edit_showline_1:
[00038e1e] b6aa 0028                 cmp.l      40(a2),d3
[00038e22] 6f04                      ble.s      edit_showline_2
[00038e24] 262a 0028                 move.l     40(a2),d3
edit_showline_2:
[00038e28] b6aa 0018                 cmp.l      24(a2),d3
[00038e2c] 6c06                      bge.s      edit_showline_3
[00038e2e] 2543 0018                 move.l     d3,24(a2)
[00038e32] 6022                      bra.s      edit_showline_4
edit_showline_3:
[00038e34] 202a 0018                 move.l     24(a2),d0
[00038e38] d0aa 000a                 add.l      10(a2),d0
[00038e3c] b680                      cmp.l      d0,d3
[00038e3e] 6d0e                      blt.s      edit_showline_5
[00038e40] 2203                      move.l     d3,d1
[00038e42] 92aa 000a                 sub.l      10(a2),d1
[00038e46] 5281                      addq.l     #1,d1
[00038e48] 2541 0018                 move.l     d1,24(a2)
[00038e4c] 6008                      bra.s      edit_showline_4
edit_showline_5:
[00038e4e] 2003                      move.l     d3,d0
[00038e50] 204a                      movea.l    a2,a0
[00038e52] 6100 ff74                 bsr        edit_updateline
edit_showline_4:
[00038e56] 245f                      movea.l    (a7)+,a2
[00038e58] 261f                      move.l     (a7)+,d3
[00038e5a] 4e75                      rts

edit_exmem:
[00038e5c] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[00038e60] 2648                      movea.l    a0,a3
[00038e62] 2600                      move.l     d0,d3
[00038e64] 2800                      move.l     d0,d4
[00038e66] e78c                      lsl.l      #3,d4
[00038e68] 2004                      move.l     d4,d0
[00038e6a] 4eb9 0004 c608            jsr        Ax_malloc
[00038e70] 2448                      movea.l    a0,a2
[00038e72] 200a                      move.l     a2,d0
[00038e74] 660a                      bne.s      edit_exmem_1
[00038e76] 006b 0001 009e            ori.w      #$0001,158(a3)
[00038e7c] 70ff                      moveq.l    #-1,d0
[00038e7e] 6032                      bra.s      edit_exmem_2
edit_exmem_1:
[00038e80] 2204                      move.l     d4,d1
[00038e82] 4240                      clr.w      d0
[00038e84] 204a                      movea.l    a2,a0
[00038e86] 4eb9 0008 36ea            jsr        memset
[00038e8c] 202b 0024                 move.l     36(a3),d0
[00038e90] e788                      lsl.l      #3,d0
[00038e92] 226b 002c                 movea.l    44(a3),a1
[00038e96] 204a                      movea.l    a2,a0
[00038e98] 4eb9 0008 3500            jsr        memcpy
[00038e9e] 206b 002c                 movea.l    44(a3),a0
[00038ea2] 4eb9 0004 c6c8            jsr        Ax_ifree
[00038ea8] 274a 002c                 move.l     a2,44(a3)
[00038eac] 2743 0024                 move.l     d3,36(a3)
[00038eb0] 4240                      clr.w      d0
edit_exmem_2:
[00038eb2] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[00038eb6] 4e75                      rts

edit_expand:
[00038eb8] 48e7 1820                 movem.l    d3-d4/a2,-(a7)
[00038ebc] 2448                      movea.l    a0,a2
[00038ebe] 2800                      move.l     d0,d4
[00038ec0] 70ff                      moveq.l    #-1,d0
[00038ec2] 4eb9 0008 0d8a            jsr        Malloc
[00038ec8] 2608                      move.l     a0,d3
[00038eca] 202a 0024                 move.l     36(a2),d0
[00038ece] d084                      add.l      d4,d0
[00038ed0] d0bc 0000 01ff            add.l      #$000001FF,d0
[00038ed6] 2800                      move.l     d0,d4
[00038ed8] 223c 0000 0200            move.l     #$00000200,d1
[00038ede] 4eb9 0008 3d6a            jsr        _lmod
[00038ee4] 9880                      sub.l      d0,d4
[00038ee6] 2004                      move.l     d4,d0
[00038ee8] e788                      lsl.l      #3,d0
[00038eea] b083                      cmp.l      d3,d0
[00038eec] 6e26                      bgt.s      edit_expand_1
[00038eee] 2200                      move.l     d0,d1
[00038ef0] e281                      asr.l      #1,d1
[00038ef2] d280                      add.l      d0,d1
[00038ef4] b681                      cmp.l      d1,d3
[00038ef6] 6f08                      ble.s      edit_expand_2
[00038ef8] 2404                      move.l     d4,d2
[00038efa] e282                      asr.l      #1,d2
[00038efc] d882                      add.l      d2,d4
[00038efe] 6014                      bra.s      edit_expand_1
edit_expand_2:
[00038f00] 2803                      move.l     d3,d4
[00038f02] e68c                      lsr.l      #3,d4
[00038f04] 2004                      move.l     d4,d0
[00038f06] 223c 0000 0200            move.l     #$00000200,d1
[00038f0c] 4eb9 0008 3d6a            jsr        _lmod
[00038f12] 9880                      sub.l      d0,d4
edit_expand_1:
[00038f14] 2004                      move.l     d4,d0
[00038f16] 204a                      movea.l    a2,a0
[00038f18] 6100 ff42                 bsr        edit_exmem
[00038f1c] 4cdf 0418                 movem.l    (a7)+,d3-d4/a2
[00038f20] 4e75                      rts

edit_newline:
[00038f22] 2f03                      move.l     d3,-(a7)
[00038f24] 2f0a                      move.l     a2,-(a7)
[00038f26] 2068 000c                 movea.l    12(a0),a0
[00038f2a] 2468 000c                 movea.l    12(a0),a2
[00038f2e] 202a 0024                 move.l     36(a2),d0
[00038f32] 7201                      moveq.l    #1,d1
[00038f34] d2aa 0028                 add.l      40(a2),d1
[00038f38] b081                      cmp.l      d1,d0
[00038f3a] 6e00 0088                 bgt        edit_newline_1
[00038f3e] 202a 0014                 move.l     20(a2),d0
[00038f42] 90aa 0024                 sub.l      36(a2),d0
[00038f46] 4a80                      tst.l      d0
[00038f48] 6f26                      ble.s      edit_newline_2
[00038f4a] 242a 0014                 move.l     20(a2),d2
[00038f4e] 7219                      moveq.l    #25,d1
[00038f50] d2aa 0024                 add.l      36(a2),d1
[00038f54] b481                      cmp.l      d1,d2
[00038f56] 6c04                      bge.s      edit_newline_3
[00038f58] 2002                      move.l     d2,d0
[00038f5a] 6006                      bra.s      edit_newline_4
edit_newline_3:
[00038f5c] 7019                      moveq.l    #25,d0
[00038f5e] d0aa 0024                 add.l      36(a2),d0
edit_newline_4:
[00038f62] 204a                      movea.l    a2,a0
[00038f64] 6100 fef6                 bsr        edit_exmem
[00038f68] 4a40                      tst.w      d0
[00038f6a] 6758                      beq.s      edit_newline_1
[00038f6c] 70ff                      moveq.l    #-1,d0
[00038f6e] 6064                      bra.s      edit_newline_5
edit_newline_2:
[00038f70] 206a 002c                 movea.l    44(a2),a0
[00038f74] 3028 0004                 move.w     4(a0),d0
[00038f78] 6708                      beq.s      edit_newline_6
[00038f7a] 2050                      movea.l    (a0),a0
[00038f7c] 4eb9 0004 c6c8            jsr        Ax_ifree
edit_newline_6:
[00038f82] 262a 0028                 move.l     40(a2),d3
[00038f86] e78b                      lsl.l      #3,d3
[00038f88] 2003                      move.l     d3,d0
[00038f8a] 226a 002c                 movea.l    44(a2),a1
[00038f8e] 5049                      addq.w     #8,a1
[00038f90] 206a 002c                 movea.l    44(a2),a0
[00038f94] 4eb9 0008 3500            jsr        memcpy
[00038f9a] 202a 0028                 move.l     40(a2),d0
[00038f9e] e788                      lsl.l      #3,d0
[00038fa0] 206a 002c                 movea.l    44(a2),a0
[00038fa4] d1c0                      adda.l     d0,a0
[00038fa6] 4290                      clr.l      (a0)
[00038fa8] 4268 0004                 clr.w      4(a0)
[00038fac] 4268 0006                 clr.w      6(a0)
[00038fb0] 53aa 0066                 subq.l     #1,102(a2)
[00038fb4] 53aa 006a                 subq.l     #1,106(a2)
[00038fb8] 526a 006e                 addq.w     #1,110(a2)
[00038fbc] 006a 0010 0012            ori.w      #$0010,18(a2)
[00038fc2] 6004                      bra.s      edit_newline_7
edit_newline_1:
[00038fc4] 52aa 0028                 addq.l     #1,40(a2)
edit_newline_7:
[00038fc8] 202a 0028                 move.l     40(a2),d0
[00038fcc] 204a                      movea.l    a2,a0
[00038fce] 6100 fe40                 bsr        edit_showline
[00038fd2] 4240                      clr.w      d0
edit_newline_5:
[00038fd4] 245f                      movea.l    (a7)+,a2
[00038fd6] 261f                      move.l     (a7)+,d3
[00038fd8] 4e75                      rts

change_cur:
[00038fda] 2f0a                      move.l     a2,-(a7)
[00038fdc] 2f0b                      move.l     a3,-(a7)
[00038fde] 2448                      movea.l    a0,a2
[00038fe0] 266a 0054                 movea.l    84(a2),a3
[00038fe4] 200b                      move.l     a3,d0
[00038fe6] 671a                      beq.s      change_cur_1
[00038fe8] 006a 0040 0012            ori.w      #$0040,18(a2)
[00038fee] 72ff                      moveq.l    #-1,d1
[00038ff0] 302a 005c                 move.w     92(a2),d0
[00038ff4] 226b 0066                 movea.l    102(a3),a1
[00038ff8] 204b                      movea.l    a3,a0
[00038ffa] 4e91                      jsr        (a1)
[00038ffc] 026a ffbf 0012            andi.w     #$FFBF,18(a2)
change_cur_1:
[00039002] 265f                      movea.l    (a7)+,a3
[00039004] 245f                      movea.l    (a7)+,a2
[00039006] 4e75                      rts

edit_update:
[00039008] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[0003900c] 2448                      movea.l    a0,a2
[0003900e] 266a 0054                 movea.l    84(a2),a3
[00039012] 200b                      move.l     a3,d0
[00039014] 6700 00a8                 beq        edit_update_1
[00039018] 362a 005c                 move.w     92(a2),d3
[0003901c] 204b                      movea.l    a3,a0
[0003901e] 3003                      move.w     d3,d0
[00039020] 4eb9 0005 4a98            jsr        Awi_obvisible
[00039026] 4a40                      tst.w      d0
[00039028] 6700 0094                 beq        edit_update_1
[0003902c] 382a 001e                 move.w     30(a2),d4
[00039030] 986a 0052                 sub.w      82(a2),d4
[00039034] c9ea 0008                 muls.w     8(a2),d4
[00039038] 3a2a 001a                 move.w     26(a2),d5
[0003903c] 9a6a 004e                 sub.w      78(a2),d5
[00039040] cbea 0006                 muls.w     6(a2),d5
[00039044] 7008                      moveq.l    #8,d0
[00039046] c06a 0012                 and.w      18(a2),d0
[0003904a] 663e                      bne.s      edit_update_2
[0003904c] 322b 0020                 move.w     32(a3),d1
[00039050] 6b38                      bmi.s      edit_update_2
[00039052] 7404                      moveq.l    #4,d2
[00039054] c46a 0012                 and.w      18(a2),d2
[00039058] 673e                      beq.s      edit_update_3
[0003905a] 7010                      moveq.l    #16,d0
[0003905c] c06a 0012                 and.w      18(a2),d0
[00039060] 6710                      beq.s      edit_update_4
[00039062] 322a 006e                 move.w     110(a2),d1
[00039066] c3ea 0006                 muls.w     6(a2),d1
[0003906a] da41                      add.w      d1,d5
[0003906c] 426a 006e                 clr.w      110(a2)
[00039070] 602e                      bra.s      edit_update_5
edit_update_4:
[00039072] 4a44                      tst.w      d4
[00039074] 662a                      bne.s      edit_update_5
[00039076] 4a45                      tst.w      d5
[00039078] 6626                      bne.s      edit_update_5
[0003907a] 202a 0066                 move.l     102(a2),d0
[0003907e] b0aa 006a                 cmp.l      106(a2),d0
[00039082] 6606                      bne.s      edit_update_2
[00039084] 006a 0002 0012            ori.w      #$0002,18(a2)
edit_update_2:
[0003908a] 72ff                      moveq.l    #-1,d1
[0003908c] 3003                      move.w     d3,d0
[0003908e] 204b                      movea.l    a3,a0
[00039090] 226b 0066                 movea.l    102(a3),a1
[00039094] 4e91                      jsr        (a1)
[00039096] 6014                      bra.s      edit_update_6
edit_update_3:
[00039098] 4a44                      tst.w      d4
[0003909a] 6604                      bne.s      edit_update_5
[0003909c] 4a45                      tst.w      d5
[0003909e] 670c                      beq.s      edit_update_6
edit_update_5:
[000390a0] 3205                      move.w     d5,d1
[000390a2] 3004                      move.w     d4,d0
[000390a4] 204a                      movea.l    a2,a0
[000390a6] 4eb9 0003 90c4            jsr        uedit_scroll
edit_update_6:
[000390ac] 026a ffe1 0012            andi.w     #$FFE1,18(a2)
[000390b2] 256a 0018 004c            move.l     24(a2),76(a2)
[000390b8] 256a 001c 0050            move.l     28(a2),80(a2)
edit_update_1:
[000390be] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[000390c2] 4e75                      rts

uedit_scroll:
[000390c4] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[000390c8] 4fef ffd4                 lea.l      -44(a7),a7
[000390cc] 2448                      movea.l    a0,a2
[000390ce] 3600                      move.w     d0,d3
[000390d0] 3801                      move.w     d1,d4
[000390d2] 4a40                      tst.w      d0
[000390d4] 6606                      bne.s      uedit_scroll_1
[000390d6] 4a41                      tst.w      d1
[000390d8] 6700 02c0                 beq        uedit_scroll_2
uedit_scroll_1:
[000390dc] 2f6a 0054 0018            move.l     84(a2),24(a7)
[000390e2] 206f 0018                 movea.l    24(a7),a0
[000390e6] 3a28 0020                 move.w     32(a0),d5
[000390ea] 4a45                      tst.w      d5
[000390ec] 6b00 02ac                 bmi        uedit_scroll_2
[000390f0] 7008                      moveq.l    #8,d0
[000390f2] c068 0056                 and.w      86(a0),d0
[000390f6] 6720                      beq.s      uedit_scroll_3
[000390f8] 2279 0010 ee4e            movea.l    ACSblk,a1
[000390fe] 5049                      addq.w     #8,a1
[00039100] 41ef 0008                 lea.l      8(a7),a0
[00039104] 7008                      moveq.l    #8,d0
[00039106] 4eb9 0008 3500            jsr        memcpy
[0003910c] 4240                      clr.w      d0
[0003910e] 3f40 0006                 move.w     d0,6(a7)
[00039112] 3f40 0004                 move.w     d0,4(a7)
[00039116] 604c                      bra.s      uedit_scroll_4
uedit_scroll_3:
[00039118] 486f 000e                 pea.l      14(a7)
[0003911c] 486f 0010                 pea.l      16(a7)
[00039120] 486f 0012                 pea.l      18(a7)
[00039124] 486f 0014                 pea.l      20(a7)
[00039128] 720b                      moveq.l    #11,d1
[0003912a] 3005                      move.w     d5,d0
[0003912c] 4eb9 0007 f7ba            jsr        wind_get
[00039132] 4fef 0010                 lea.l      16(a7),a7
[00039136] 302f 000c                 move.w     12(a7),d0
[0003913a] 6700 025e                 beq        uedit_scroll_2
[0003913e] 322f 000e                 move.w     14(a7),d1
[00039142] 6700 0256                 beq        uedit_scroll_2
[00039146] 486f 0006                 pea.l      6(a7)
[0003914a] 486f 0008                 pea.l      8(a7)
[0003914e] 486f 000a                 pea.l      10(a7)
[00039152] 486f 000c                 pea.l      12(a7)
[00039156] 3005                      move.w     d5,d0
[00039158] 720c                      moveq.l    #12,d1
[0003915a] 4eb9 0007 f7ba            jsr        wind_get
[00039160] 4fef 0010                 lea.l      16(a7),a7
uedit_scroll_4:
[00039164] 3a2a 005c                 move.w     92(a2),d5
[00039168] 286a 0058                 movea.l    88(a2),a4
[0003916c] 3205                      move.w     d5,d1
[0003916e] 48c1                      ext.l      d1
[00039170] 2001                      move.l     d1,d0
[00039172] d080                      add.l      d0,d0
[00039174] d081                      add.l      d1,d0
[00039176] e788                      lsl.l      #3,d0
[00039178] 99c0                      suba.l     d0,a4
[0003917a] 4bef 0010                 lea.l      16(a7),a5
[0003917e] 2f39 000e 692a            move.l     _globl,-(a7)
[00039184] 486d 0002                 pea.l      2(a5)
[00039188] 224d                      movea.l    a5,a1
[0003918a] 3005                      move.w     d5,d0
[0003918c] 204c                      movea.l    a4,a0
[0003918e] 4eb9 0007 9d14            jsr        mt_objc_offset
[00039194] 504f                      addq.w     #8,a7
[00039196] 206f 0018                 movea.l    24(a7),a0
[0003919a] 3028 0034                 move.w     52(a0),d0
[0003919e] d155                      add.w      d0,(a5)
[000391a0] 3228 0036                 move.w     54(a0),d1
[000391a4] d36d 0002                 add.w      d1,2(a5)
[000391a8] 3e2d 0002                 move.w     2(a5),d7
[000391ac] 3b6a 004a 0004            move.w     74(a2),4(a5)
[000391b2] 3b6a 0048 0006            move.w     72(a2),6(a5)
[000391b8] 43ef 0008                 lea.l      8(a7),a1
[000391bc] 204d                      movea.l    a5,a0
[000391be] 4eb9 0006 c662            jsr        intersect
[000391c4] 2279 0010 ee4e            movea.l    ACSblk,a1
[000391ca] 5049                      addq.w     #8,a1
[000391cc] 204d                      movea.l    a5,a0
[000391ce] 4eb9 0006 c662            jsr        intersect
[000391d4] 4246                      clr.w      d6
[000391d6] 4a44                      tst.w      d4
[000391d8] 6f26                      ble.s      uedit_scroll_5
[000391da] 7004                      moveq.l    #4,d0
[000391dc] c06a 0012                 and.w      18(a2),d0
[000391e0] 671e                      beq.s      uedit_scroll_5
[000391e2] 302a 0068                 move.w     104(a2),d0
[000391e6] 906a 001a                 sub.w      26(a2),d0
[000391ea] c1ea 0006                 muls.w     6(a2),d0
[000391ee] d047                      add.w      d7,d0
[000391f0] 322d 0002                 move.w     2(a5),d1
[000391f4] d26d 0006                 add.w      6(a5),d1
[000391f8] b041                      cmp.w      d1,d0
[000391fa] 6c04                      bge.s      uedit_scroll_5
[000391fc] 3c2a 0006                 move.w     6(a2),d6
uedit_scroll_5:
[00039200] 302f 0004                 move.w     4(a7),d0
[00039204] 6632                      bne.s      uedit_scroll_6
[00039206] 322f 0006                 move.w     6(a7),d1
[0003920a] 662c                      bne.s      uedit_scroll_6
[0003920c] b66d 0004                 cmp.w      4(a5),d3
[00039210] 6c26                      bge.s      uedit_scroll_6
[00039212] 3403                      move.w     d3,d2
[00039214] 4442                      neg.w      d2
[00039216] b46d 0004                 cmp.w      4(a5),d2
[0003921a] 6c1c                      bge.s      uedit_scroll_6
[0003921c] 3e04                      move.w     d4,d7
[0003921e] de46                      add.w      d6,d7
[00039220] be6d 0006                 cmp.w      6(a5),d7
[00039224] 6c12                      bge.s      uedit_scroll_6
[00039226] 3004                      move.w     d4,d0
[00039228] 4440                      neg.w      d0
[0003922a] b06d 0006                 cmp.w      6(a5),d0
[0003922e] 6c08                      bge.s      uedit_scroll_6
[00039230] 4a44                      tst.w      d4
[00039232] 671a                      beq.s      uedit_scroll_7
[00039234] 4a43                      tst.w      d3
[00039236] 6716                      beq.s      uedit_scroll_7
uedit_scroll_6:
[00039238] 72ff                      moveq.l    #-1,d1
[0003923a] 3005                      move.w     d5,d0
[0003923c] 206f 0018                 movea.l    24(a7),a0
[00039240] 226f 0018                 movea.l    24(a7),a1
[00039244] 2269 0066                 movea.l    102(a1),a1
[00039248] 4e91                      jsr        (a1)
[0003924a] 6000 014e                 bra        uedit_scroll_2
uedit_scroll_7:
[0003924e] 47ef 001c                 lea.l      28(a7),a3
[00039252] 3015                      move.w     (a5),d0
[00039254] 3740 0008                 move.w     d0,8(a3)
[00039258] 3680                      move.w     d0,(a3)
[0003925a] 322d 0002                 move.w     2(a5),d1
[0003925e] 3741 000a                 move.w     d1,10(a3)
[00039262] 3741 0002                 move.w     d1,2(a3)
[00039266] 3015                      move.w     (a5),d0
[00039268] d06d 0004                 add.w      4(a5),d0
[0003926c] 5340                      subq.w     #1,d0
[0003926e] 3740 000c                 move.w     d0,12(a3)
[00039272] 3740 0004                 move.w     d0,4(a3)
[00039276] 322d 0002                 move.w     2(a5),d1
[0003927a] d26d 0006                 add.w      6(a5),d1
[0003927e] 5341                      subq.w     #1,d1
[00039280] 3741 000e                 move.w     d1,14(a3)
[00039284] 3741 0006                 move.w     d1,6(a3)
[00039288] 4a43                      tst.w      d3
[0003928a] 6728                      beq.s      uedit_scroll_8
[0003928c] 4a43                      tst.w      d3
[0003928e] 6f14                      ble.s      uedit_scroll_9
[00039290] d753                      add.w      d3,(a3)
[00039292] 976b 000c                 sub.w      d3,12(a3)
[00039296] 7001                      moveq.l    #1,d0
[00039298] d06b 000c                 add.w      12(a3),d0
[0003929c] 3a80                      move.w     d0,(a5)
[0003929e] 3b43 0004                 move.w     d3,4(a5)
[000392a2] 6010                      bra.s      uedit_scroll_8
uedit_scroll_9:
[000392a4] d76b 0004                 add.w      d3,4(a3)
[000392a8] 976b 0008                 sub.w      d3,8(a3)
[000392ac] 3003                      move.w     d3,d0
[000392ae] 4440                      neg.w      d0
[000392b0] 3b40 0004                 move.w     d0,4(a5)
uedit_scroll_8:
[000392b4] 4a44                      tst.w      d4
[000392b6] 6734                      beq.s      uedit_scroll_10
[000392b8] 4a44                      tst.w      d4
[000392ba] 6f20                      ble.s      uedit_scroll_11
[000392bc] d96b 0002                 add.w      d4,2(a3)
[000392c0] 3004                      move.w     d4,d0
[000392c2] d046                      add.w      d6,d0
[000392c4] 916b 000e                 sub.w      d0,14(a3)
[000392c8] 9d6b 0006                 sub.w      d6,6(a3)
[000392cc] 7201                      moveq.l    #1,d1
[000392ce] d26b 000e                 add.w      14(a3),d1
[000392d2] 3b41 0002                 move.w     d1,2(a5)
[000392d6] 3b40 0006                 move.w     d0,6(a5)
[000392da] 6010                      bra.s      uedit_scroll_10
uedit_scroll_11:
[000392dc] d96b 0006                 add.w      d4,6(a3)
[000392e0] 996b 000a                 sub.w      d4,10(a3)
[000392e4] 3004                      move.w     d4,d0
[000392e6] 4440                      neg.w      d0
[000392e8] 3b40 0006                 move.w     d0,6(a5)
uedit_scroll_10:
[000392ec] 204b                      movea.l    a3,a0
[000392ee] 4241                      clr.w      d1
[000392f0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000392f6] 3029 0010                 move.w     16(a1),d0
[000392fa] 4eb9 0007 2230            jsr        vs_clip
[00039300] 3c2c 0010                 move.w     16(a4),d6
[00039304] 3e2c 0012                 move.w     18(a4),d7
[00039308] 206f 0018                 movea.l    24(a7),a0
[0003930c] 3028 0034                 move.w     52(a0),d0
[00039310] d16c 0010                 add.w      d0,16(a4)
[00039314] 3028 0036                 move.w     54(a0),d0
[00039318] d16c 0012                 add.w      d0,18(a4)
[0003931c] 2279 000e 692a            movea.l    _globl,a1
[00039322] 303c 0100                 move.w     #$0100,d0
[00039326] 91c8                      suba.l     a0,a0
[00039328] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0003932e] 302b 0002                 move.w     2(a3),d0
[00039332] b06b 0006                 cmp.w      6(a3),d0
[00039336] 6e26                      bgt.s      uedit_scroll_12
[00039338] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003933e] 4868 026a                 pea.l      618(a0)
[00039342] 2248                      movea.l    a0,a1
[00039344] 43e9 026a                 lea.l      618(a1),a1
[00039348] 204b                      movea.l    a3,a0
[0003934a] 7203                      moveq.l    #3,d1
[0003934c] 2479 0010 ee4e            movea.l    ACSblk,a2
[00039352] 302a 0010                 move.w     16(a2),d0
[00039356] 4eb9 0007 489e            jsr        vro_cpyfm
[0003935c] 584f                      addq.w     #4,a7
uedit_scroll_12:
[0003935e] 3f2d 0006                 move.w     6(a5),-(a7)
[00039362] 3f2d 0004                 move.w     4(a5),-(a7)
[00039366] 3f2d 0002                 move.w     2(a5),-(a7)
[0003936a] 2279 000e 692a            movea.l    _globl,a1
[00039370] 3415                      move.w     (a5),d2
[00039372] 4241                      clr.w      d1
[00039374] 3005                      move.w     d5,d0
[00039376] 204c                      movea.l    a4,a0
[00039378] 4eb9 0007 9c0c            jsr        mt_objc_draw
[0003937e] 5c4f                      addq.w     #6,a7
[00039380] 2279 000e 692a            movea.l    _globl,a1
[00039386] 91c8                      suba.l     a0,a0
[00039388] 303c 0101                 move.w     #$0101,d0
[0003938c] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00039392] 3946 0010                 move.w     d6,16(a4)
[00039396] 3947 0012                 move.w     d7,18(a4)
uedit_scroll_2:
[0003939a] 4fef 002c                 lea.l      44(a7),a7
[0003939e] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[000393a2] 4e75                      rts

edit_invers:
[000393a4] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[000393a8] 2448                      movea.l    a0,a2
[000393aa] 2600                      move.l     d0,d3
[000393ac] b0aa 0018                 cmp.l      24(a2),d0
[000393b0] 6d56                      blt.s      edit_invers_1
[000393b2] 222a 0018                 move.l     24(a2),d1
[000393b6] d2aa 000a                 add.l      10(a2),d1
[000393ba] b081                      cmp.l      d1,d0
[000393bc] 6c4a                      bge.s      edit_invers_1
[000393be] 382a 0012                 move.w     18(a2),d4
[000393c2] 2a2a 0066                 move.l     102(a2),d5
[000393c6] 357c 0304 0012            move.w     #$0304,18(a2)
[000393cc] 2540 0066                 move.l     d0,102(a2)
[000393d0] e788                      lsl.l      #3,d0
[000393d2] 226a 002c                 movea.l    44(a2),a1
[000393d6] 0071 0002 0806            ori.w      #$0002,6(a1,d0.l)
[000393dc] 266a 0054                 movea.l    84(a2),a3
[000393e0] 220b                      move.l     a3,d1
[000393e2] 670e                      beq.s      edit_invers_2
[000393e4] 302a 005c                 move.w     92(a2),d0
[000393e8] 226b 0066                 movea.l    102(a3),a1
[000393ec] 204b                      movea.l    a3,a0
[000393ee] 72ff                      moveq.l    #-1,d1
[000393f0] 4e91                      jsr        (a1)
edit_invers_2:
[000393f2] 2003                      move.l     d3,d0
[000393f4] e788                      lsl.l      #3,d0
[000393f6] 206a 002c                 movea.l    44(a2),a0
[000393fa] 0270 fffd 0806            andi.w     #$FFFD,6(a0,d0.l)
[00039400] 2545 0066                 move.l     d5,102(a2)
[00039404] 3544 0012                 move.w     d4,18(a2)
edit_invers_1:
[00039408] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[0003940c] 4e75                      rts

edit_col:
[0003940e] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00039412] 594f                      subq.w     #4,a7
[00039414] 2448                      movea.l    a0,a2
[00039416] 3600                      move.w     d0,d3
[00039418] 266a 0054                 movea.l    84(a2),a3
[0003941c] 286a 0058                 movea.l    88(a2),a4
[00039420] 342a 005c                 move.w     92(a2),d2
[00039424] 48c2                      ext.l      d2
[00039426] 2202                      move.l     d2,d1
[00039428] d281                      add.l      d1,d1
[0003942a] d282                      add.l      d2,d1
[0003942c] e789                      lsl.l      #3,d1
[0003942e] 99c1                      suba.l     d1,a4
[00039430] 2f39 000e 692a            move.l     _globl,-(a7)
[00039436] 486f 0006                 pea.l      6(a7)
[0003943a] 43ef 0008                 lea.l      8(a7),a1
[0003943e] 302a 005c                 move.w     92(a2),d0
[00039442] 204c                      movea.l    a4,a0
[00039444] 4eb9 0007 9d14            jsr        mt_objc_offset
[0003944a] 504f                      addq.w     #8,a7
[0003944c] 302b 0034                 move.w     52(a3),d0
[00039450] d057                      add.w      (a7),d0
[00039452] 322a 0008                 move.w     8(a2),d1
[00039456] e241                      asr.w      #1,d1
[00039458] 9041                      sub.w      d1,d0
[0003945a] 9640                      sub.w      d0,d3
[0003945c] 3003                      move.w     d3,d0
[0003945e] 48c0                      ext.l      d0
[00039460] 81ea 0008                 divs.w     8(a2),d0
[00039464] 48c0                      ext.l      d0
[00039466] d0aa 001c                 add.l      28(a2),d0
[0003946a] 4a43                      tst.w      d3
[0003946c] 6a02                      bpl.s      edit_col_1
[0003946e] 5380                      subq.l     #1,d0
edit_col_1:
[00039470] 4a80                      tst.l      d0
[00039472] 6a02                      bpl.s      edit_col_2
[00039474] 7000                      moveq.l    #0,d0
edit_col_2:
[00039476] b0aa 0020                 cmp.l      32(a2),d0
[0003947a] 6f04                      ble.s      edit_col_3
[0003947c] 202a 0020                 move.l     32(a2),d0
edit_col_3:
[00039480] 584f                      addq.w     #4,a7
[00039482] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00039486] 4e75                      rts

edit_row:
[00039488] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003948c] 594f                      subq.w     #4,a7
[0003948e] 2448                      movea.l    a0,a2
[00039490] 3600                      move.w     d0,d3
[00039492] 266a 0054                 movea.l    84(a2),a3
[00039496] 286a 0058                 movea.l    88(a2),a4
[0003949a] 342a 005c                 move.w     92(a2),d2
[0003949e] 48c2                      ext.l      d2
[000394a0] 2202                      move.l     d2,d1
[000394a2] d281                      add.l      d1,d1
[000394a4] d282                      add.l      d2,d1
[000394a6] e789                      lsl.l      #3,d1
[000394a8] 99c1                      suba.l     d1,a4
[000394aa] 2f39 000e 692a            move.l     _globl,-(a7)
[000394b0] 486f 0004                 pea.l      4(a7)
[000394b4] 43ef 000a                 lea.l      10(a7),a1
[000394b8] 302a 005c                 move.w     92(a2),d0
[000394bc] 204c                      movea.l    a4,a0
[000394be] 4eb9 0007 9d14            jsr        mt_objc_offset
[000394c4] 504f                      addq.w     #8,a7
[000394c6] 302b 0036                 move.w     54(a3),d0
[000394ca] d057                      add.w      (a7),d0
[000394cc] 9640                      sub.w      d0,d3
[000394ce] 3003                      move.w     d3,d0
[000394d0] 48c0                      ext.l      d0
[000394d2] 81ea 0006                 divs.w     6(a2),d0
[000394d6] 48c0                      ext.l      d0
[000394d8] d0aa 0018                 add.l      24(a2),d0
[000394dc] 4a43                      tst.w      d3
[000394de] 6a02                      bpl.s      edit_row_1
[000394e0] 5380                      subq.l     #1,d0
edit_row_1:
[000394e2] 4a80                      tst.l      d0
[000394e4] 6a02                      bpl.s      edit_row_2
[000394e6] 7000                      moveq.l    #0,d0
edit_row_2:
[000394e8] b0aa 0028                 cmp.l      40(a2),d0
[000394ec] 6f04                      ble.s      edit_row_3
[000394ee] 202a 0028                 move.l     40(a2),d0
edit_row_3:
[000394f2] 584f                      addq.w     #4,a7
[000394f4] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[000394f8] 4e75                      rts

edit_1select:
[000394fa] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[000394fe] 5d4f                      subq.w     #6,a7
[00039500] 2648                      movea.l    a0,a3
[00039502] 3f40 0004                 move.w     d0,4(a7)
edit_1select_6:
[00039506] 45ef 0002                 lea.l      2(a7),a2
[0003950a] 302f 0004                 move.w     4(a7),d0
[0003950e] 204b                      movea.l    a3,a0
[00039510] 6100 ff76                 bsr        edit_row
[00039514] 2600                      move.l     d0,d3
[00039516] e788                      lsl.l      #3,d0
[00039518] 286b 002c                 movea.l    44(a3),a4
[0003951c] d9c0                      adda.l     d0,a4
[0003951e] 7201                      moveq.l    #1,d1
[00039520] c26c 0006                 and.w      6(a4),d1
[00039524] 6600 008a                 bne        edit_1select_1
[00039528] 242b 0030                 move.l     48(a3),d2
[0003952c] e78a                      lsl.l      #3,d2
[0003952e] 2a6b 002c                 movea.l    44(a3),a5
[00039532] dbc2                      adda.l     d2,a5
[00039534] 7001                      moveq.l    #1,d0
[00039536] c06d 0006                 and.w      6(a5),d0
[0003953a] 6710                      beq.s      edit_1select_2
[0003953c] 202b 0030                 move.l     48(a3),d0
[00039540] 204b                      movea.l    a3,a0
[00039542] 6100 fe60                 bsr        edit_invers
[00039546] 026d fffe 0006            andi.w     #$FFFE,6(a5)
edit_1select_2:
[0003954c] 2003                      move.l     d3,d0
[0003954e] 204b                      movea.l    a3,a0
[00039550] 6100 fe52                 bsr        edit_invers
[00039554] 006c 0001 0006            ori.w      #$0001,6(a4)
[0003955a] 2743 0030                 move.l     d3,48(a3)
[0003955e] 2743 0038                 move.l     d3,56(a3)
[00039562] 006b 0200 0012            ori.w      #$0200,18(a3)
[00039568] 202b 0072                 move.l     114(a3),d0
[0003956c] 6718                      beq.s      edit_1select_3
[0003956e] 2a54                      movea.l    (a4),a5
[00039570] 220d                      move.l     a5,d1
[00039572] 6606                      bne.s      edit_1select_4
[00039574] 4bf9 000c f36c            lea.l      $000CF36C,a5
edit_1select_4:
[0003957a] 224d                      movea.l    a5,a1
[0003957c] 206b 0076                 movea.l    118(a3),a0
[00039580] 286b 0072                 movea.l    114(a3),a4
[00039584] 4e94                      jsr        (a4)
edit_1select_3:
[00039586] b6ab 0018                 cmp.l      24(a3),d3
[0003958a] 6d0c                      blt.s      edit_1select_5
[0003958c] 202b 0018                 move.l     24(a3),d0
[00039590] d0ab 000a                 add.l      10(a3),d0
[00039594] b680                      cmp.l      d0,d3
[00039596] 6d18                      blt.s      edit_1select_1
edit_1select_5:
[00039598] 2003                      move.l     d3,d0
[0003959a] 204b                      movea.l    a3,a0
[0003959c] 6100 f872                 bsr        edit_showline
[000395a0] 204b                      movea.l    a3,a0
[000395a2] 6100 fa64                 bsr        edit_update
[000395a6] 7001                      moveq.l    #1,d0
[000395a8] 204b                      movea.l    a3,a0
[000395aa] 4eb9 0003 b618            jsr        cleanup
edit_1select_1:
[000395b0] 2f39 000e 692a            move.l     _globl,-(a7)
[000395b6] 4852                      pea.l      (a2)
[000395b8] 486f 0008                 pea.l      8(a7)
[000395bc] 43ef 0010                 lea.l      16(a7),a1
[000395c0] 204a                      movea.l    a2,a0
[000395c2] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[000395c8] 4fef 000c                 lea.l      12(a7),a7
[000395cc] 7001                      moveq.l    #1,d0
[000395ce] c057                      and.w      (a7),d0
[000395d0] 6600 ff34                 bne        edit_1select_6
[000395d4] 5c4f                      addq.w     #6,a7
[000395d6] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000395da] 4e75                      rts

edit_01select:
[000395dc] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000395e0] 5d4f                      subq.w     #6,a7
[000395e2] 2648                      movea.l    a0,a3
[000395e4] 3f40 0004                 move.w     d0,4(a7)
[000395e8] 45ef 0004                 lea.l      4(a7),a2
[000395ec] 3012                      move.w     (a2),d0
[000395ee] 204b                      movea.l    a3,a0
[000395f0] 6100 fe96                 bsr        edit_row
[000395f4] 2600                      move.l     d0,d3
[000395f6] e788                      lsl.l      #3,d0
[000395f8] 286b 002c                 movea.l    44(a3),a4
[000395fc] d9c0                      adda.l     d0,a4
[000395fe] 7201                      moveq.l    #1,d1
[00039600] c26c 0006                 and.w      6(a4),d1
[00039604] 6758                      beq.s      edit_01select_1
[00039606] 204b                      movea.l    a3,a0
[00039608] 2003                      move.l     d3,d0
[0003960a] 6100 fd98                 bsr        edit_invers
[0003960e] 026c fffe 0006            andi.w     #$FFFE,6(a4)
[00039614] 026b fdff 0012            andi.w     #$FDFF,18(a3)
[0003961a] 202b 0072                 move.l     114(a3),d0
[0003961e] 670e                      beq.s      edit_01select_2
[00039620] 43f9 000c f36c            lea.l      $000CF36C,a1
[00039626] 206b 0076                 movea.l    118(a3),a0
[0003962a] 2840                      movea.l    d0,a4
[0003962c] 4e94                      jsr        (a4)
edit_01select_2:
[0003962e] 49ef 0002                 lea.l      2(a7),a4
[00039632] 2f39 000e 692a            move.l     _globl,-(a7)
[00039638] 4854                      pea.l      (a4)
[0003963a] 486f 0008                 pea.l      8(a7)
[0003963e] 224a                      movea.l    a2,a1
[00039640] 204c                      movea.l    a4,a0
[00039642] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00039648] 4fef 000c                 lea.l      12(a7),a7
[0003964c] 7001                      moveq.l    #1,d0
[0003964e] c057                      and.w      (a7),d0
[00039650] 6714                      beq.s      edit_01select_3
[00039652] 204b                      movea.l    a3,a0
[00039654] 3012                      move.w     (a2),d0
[00039656] 6100 fe30                 bsr        edit_row
[0003965a] b680                      cmp.l      d0,d3
[0003965c] 67d0                      beq.s      edit_01select_2
edit_01select_1:
[0003965e] 3012                      move.w     (a2),d0
[00039660] 204b                      movea.l    a3,a0
[00039662] 6100 fe96                 bsr        edit_1select
edit_01select_3:
[00039666] 5c4f                      addq.w     #6,a7
[00039668] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003966c] 4e75                      rts

edit_selrange:
[0003966e] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[00039672] 594f                      subq.w     #4,a7
[00039674] 2448                      movea.l    a0,a2
[00039676] 262a 0018                 move.l     24(a2),d3
[0003967a] 2803                      move.l     d3,d4
[0003967c] d8aa 000a                 add.l      10(a2),d4
[00039680] 5384                      subq.l     #1,d4
[00039682] b8aa 0028                 cmp.l      40(a2),d4
[00039686] 6f04                      ble.s      edit_selrange_1
[00039688] 282a 0028                 move.l     40(a2),d4
edit_selrange_1:
[0003968c] 4257                      clr.w      (a7)
[0003968e] 2a00                      move.l     d0,d5
[00039690] 604c                      bra.s      edit_selrange_2
edit_selrange_7:
[00039692] 2005                      move.l     d5,d0
[00039694] e788                      lsl.l      #3,d0
[00039696] 206a 002c                 movea.l    44(a2),a0
[0003969a] d1c0                      adda.l     d0,a0
[0003969c] 3002                      move.w     d2,d0
[0003969e] 4a40                      tst.w      d0
[000396a0] 670a                      beq.s      edit_selrange_3
[000396a2] 5340                      subq.w     #1,d0
[000396a4] 6716                      beq.s      edit_selrange_4
[000396a6] 5340                      subq.w     #1,d0
[000396a8] 6720                      beq.s      edit_selrange_5
[000396aa] 6030                      bra.s      edit_selrange_6
edit_selrange_3:
[000396ac] 7001                      moveq.l    #1,d0
[000396ae] c068 0006                 and.w      6(a0),d0
[000396b2] 6728                      beq.s      edit_selrange_6
[000396b4] 0268 fffe 0006            andi.w     #$FFFE,6(a0)
[000396ba] 600e                      bra.s      edit_selrange_5
edit_selrange_4:
[000396bc] 7001                      moveq.l    #1,d0
[000396be] c068 0006                 and.w      6(a0),d0
[000396c2] 6618                      bne.s      edit_selrange_6
[000396c4] 0068 0001 0006            ori.w      #$0001,6(a0)
edit_selrange_5:
[000396ca] b685                      cmp.l      d5,d3
[000396cc] 6e0e                      bgt.s      edit_selrange_6
[000396ce] b885                      cmp.l      d5,d4
[000396d0] 6d0a                      blt.s      edit_selrange_6
[000396d2] 3ebc 0001                 move.w     #$0001,(a7)
[000396d6] 0068 0002 0006            ori.w      #$0002,6(a0)
edit_selrange_6:
[000396dc] 5285                      addq.l     #1,d5
edit_selrange_2:
[000396de] b285                      cmp.l      d5,d1
[000396e0] 6cb0                      bge.s      edit_selrange_7
[000396e2] 3017                      move.w     (a7),d0
[000396e4] 6740                      beq.s      edit_selrange_8
[000396e6] 266a 0054                 movea.l    84(a2),a3
[000396ea] 220b                      move.l     a3,d1
[000396ec] 6720                      beq.s      edit_selrange_9
[000396ee] 3f6a 0012 0002            move.w     18(a2),2(a7)
[000396f4] 357c 0300 0012            move.w     #$0300,18(a2)
[000396fa] 302a 005c                 move.w     92(a2),d0
[000396fe] 204b                      movea.l    a3,a0
[00039700] 226b 0066                 movea.l    102(a3),a1
[00039704] 72ff                      moveq.l    #-1,d1
[00039706] 4e91                      jsr        (a1)
[00039708] 356f 0002 0012            move.w     2(a7),18(a2)
edit_selrange_9:
[0003970e] 2a03                      move.l     d3,d5
[00039710] 6010                      bra.s      edit_selrange_10
edit_selrange_11:
[00039712] 2005                      move.l     d5,d0
[00039714] e788                      lsl.l      #3,d0
[00039716] 206a 002c                 movea.l    44(a2),a0
[0003971a] 0270 fffd 0806            andi.w     #$FFFD,6(a0,d0.l)
[00039720] 5285                      addq.l     #1,d5
edit_selrange_10:
[00039722] b885                      cmp.l      d5,d4
[00039724] 6cec                      bge.s      edit_selrange_11
edit_selrange_8:
[00039726] 584f                      addq.w     #4,a7
[00039728] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[0003972c] 4e75                      rts

edit_nselect:
[0003972e] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[00039732] 5d4f                      subq.w     #6,a7
[00039734] 2448                      movea.l    a0,a2
[00039736] 3f40 0004                 move.w     d0,4(a7)
[0003973a] 3602                      move.w     d2,d3
[0003973c] 47ef 0004                 lea.l      4(a7),a3
[00039740] 4a43                      tst.w      d3
[00039742] 6604                      bne.s      edit_nselect_1
[00039744] 7801                      moveq.l    #1,d4
[00039746] 6002                      bra.s      edit_nselect_2
edit_nselect_1:
[00039748] 4244                      clr.w      d4
edit_nselect_2:
[0003974a] 7003                      moveq.l    #3,d0
[0003974c] c041                      and.w      d1,d0
[0003974e] 6724                      beq.s      edit_nselect_3
[00039750] 222a 0030                 move.l     48(a2),d1
[00039754] d2aa 0038                 add.l      56(a2),d1
[00039758] e281                      asr.l      #1,d1
[0003975a] 2f01                      move.l     d1,-(a7)
[0003975c] 204a                      movea.l    a2,a0
[0003975e] 3013                      move.w     (a3),d0
[00039760] 6100 fd26                 bsr        edit_row
[00039764] b09f                      cmp.l      (a7)+,d0
[00039766] 6f06                      ble.s      edit_nselect_4
[00039768] 2a2a 0030                 move.l     48(a2),d5
[0003976c] 6028                      bra.s      edit_nselect_5
edit_nselect_4:
[0003976e] 2a2a 0038                 move.l     56(a2),d5
[00039772] 6022                      bra.s      edit_nselect_5
edit_nselect_3:
[00039774] 3404                      move.w     d4,d2
[00039776] 222a 0038                 move.l     56(a2),d1
[0003977a] 202a 0030                 move.l     48(a2),d0
[0003977e] 204a                      movea.l    a2,a0
[00039780] 6100 feec                 bsr        edit_selrange
[00039784] 3013                      move.w     (a3),d0
[00039786] 204a                      movea.l    a2,a0
[00039788] 6100 fcfe                 bsr        edit_row
[0003978c] 2a00                      move.l     d0,d5
[0003978e] 2540 0038                 move.l     d0,56(a2)
[00039792] 2540 0030                 move.l     d0,48(a2)
edit_nselect_5:
[00039796] 7cfe                      moveq.l    #-2,d6
edit_nselect_17:
[00039798] 49ef 0002                 lea.l      2(a7),a4
[0003979c] 3013                      move.w     (a3),d0
[0003979e] 204a                      movea.l    a2,a0
[000397a0] 6100 fce6                 bsr        edit_row
[000397a4] 2e00                      move.l     d0,d7
[000397a6] bc80                      cmp.l      d0,d6
[000397a8] 6700 00ec                 beq        edit_nselect_6
[000397ac] ba80                      cmp.l      d0,d5
[000397ae] 6e54                      bgt.s      edit_nselect_7
[000397b0] b0aa 0038                 cmp.l      56(a2),d0
[000397b4] 6c12                      bge.s      edit_nselect_8
[000397b6] 3404                      move.w     d4,d2
[000397b8] 222a 0038                 move.l     56(a2),d1
[000397bc] 7001                      moveq.l    #1,d0
[000397be] d087                      add.l      d7,d0
[000397c0] 204a                      movea.l    a2,a0
[000397c2] 6100 feaa                 bsr        edit_selrange
[000397c6] 6032                      bra.s      edit_nselect_9
edit_nselect_8:
[000397c8] baaa 0038                 cmp.l      56(a2),d5
[000397cc] 6c10                      bge.s      edit_nselect_10
[000397ce] 3403                      move.w     d3,d2
[000397d0] 2207                      move.l     d7,d1
[000397d2] 202a 0038                 move.l     56(a2),d0
[000397d6] 204a                      movea.l    a2,a0
[000397d8] 6100 fe94                 bsr        edit_selrange
[000397dc] 601c                      bra.s      edit_nselect_9
edit_nselect_10:
[000397de] 3404                      move.w     d4,d2
[000397e0] 72ff                      moveq.l    #-1,d1
[000397e2] d285                      add.l      d5,d1
[000397e4] 202a 0030                 move.l     48(a2),d0
[000397e8] 204a                      movea.l    a2,a0
[000397ea] 6100 fe82                 bsr        edit_selrange
[000397ee] 3403                      move.w     d3,d2
[000397f0] 2207                      move.l     d7,d1
[000397f2] 2005                      move.l     d5,d0
[000397f4] 204a                      movea.l    a2,a0
[000397f6] 6100 fe76                 bsr        edit_selrange
edit_nselect_9:
[000397fa] 2545 0030                 move.l     d5,48(a2)
[000397fe] 2547 0038                 move.l     d7,56(a2)
[00039802] 6054                      bra.s      edit_nselect_11
edit_nselect_7:
[00039804] beaa 0030                 cmp.l      48(a2),d7
[00039808] 6f12                      ble.s      edit_nselect_12
[0003980a] 3404                      move.w     d4,d2
[0003980c] 72ff                      moveq.l    #-1,d1
[0003980e] d287                      add.l      d7,d1
[00039810] 202a 0030                 move.l     48(a2),d0
[00039814] 204a                      movea.l    a2,a0
[00039816] 6100 fe56                 bsr        edit_selrange
[0003981a] 6034                      bra.s      edit_nselect_13
edit_nselect_12:
[0003981c] baaa 0030                 cmp.l      48(a2),d5
[00039820] 6f10                      ble.s      edit_nselect_14
[00039822] 3403                      move.w     d3,d2
[00039824] 222a 0030                 move.l     48(a2),d1
[00039828] 2007                      move.l     d7,d0
[0003982a] 204a                      movea.l    a2,a0
[0003982c] 6100 fe40                 bsr        edit_selrange
[00039830] 601e                      bra.s      edit_nselect_13
edit_nselect_14:
[00039832] 3404                      move.w     d4,d2
[00039834] 222a 0038                 move.l     56(a2),d1
[00039838] 7001                      moveq.l    #1,d0
[0003983a] d085                      add.l      d5,d0
[0003983c] 204a                      movea.l    a2,a0
[0003983e] 6100 fe2e                 bsr        edit_selrange
[00039842] 3403                      move.w     d3,d2
[00039844] 72ff                      moveq.l    #-1,d1
[00039846] d285                      add.l      d5,d1
[00039848] 2007                      move.l     d7,d0
[0003984a] 204a                      movea.l    a2,a0
[0003984c] 6100 fe20                 bsr        edit_selrange
edit_nselect_13:
[00039850] 2547 0030                 move.l     d7,48(a2)
[00039854] 2545 0038                 move.l     d5,56(a2)
edit_nselect_11:
[00039858] beaa 0018                 cmp.l      24(a2),d7
[0003985c] 6d0c                      blt.s      edit_nselect_15
[0003985e] 202a 0018                 move.l     24(a2),d0
[00039862] d0aa 000a                 add.l      10(a2),d0
[00039866] be80                      cmp.l      d0,d7
[00039868] 6d18                      blt.s      edit_nselect_16
edit_nselect_15:
[0003986a] 2007                      move.l     d7,d0
[0003986c] 204a                      movea.l    a2,a0
[0003986e] 6100 f5a0                 bsr        edit_showline
[00039872] 204a                      movea.l    a2,a0
[00039874] 6100 f792                 bsr        edit_update
[00039878] 7001                      moveq.l    #1,d0
[0003987a] 204a                      movea.l    a2,a0
[0003987c] 4eb9 0003 b618            jsr        cleanup
edit_nselect_16:
[00039882] 202a 0072                 move.l     114(a2),d0
[00039886] 670e                      beq.s      edit_nselect_6
[00039888] 43f9 000c f36c            lea.l      $000CF36C,a1
[0003988e] 206a 0076                 movea.l    118(a2),a0
[00039892] 2a40                      movea.l    d0,a5
[00039894] 4e95                      jsr        (a5)
edit_nselect_6:
[00039896] 2c07                      move.l     d7,d6
[00039898] 2f39 000e 692a            move.l     _globl,-(a7)
[0003989e] 4854                      pea.l      (a4)
[000398a0] 486f 0008                 pea.l      8(a7)
[000398a4] 224b                      movea.l    a3,a1
[000398a6] 204c                      movea.l    a4,a0
[000398a8] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[000398ae] 4fef 000c                 lea.l      12(a7),a7
[000398b2] 7001                      moveq.l    #1,d0
[000398b4] c057                      and.w      (a7),d0
[000398b6] 6600 fee0                 bne        edit_nselect_17
[000398ba] 5c4f                      addq.w     #6,a7
[000398bc] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[000398c0] 4e75                      rts

edit_nmselect:
[000398c2] 3f03                      move.w     d3,-(a7)
[000398c4] 2f0a                      move.l     a2,-(a7)
[000398c6] 2448                      movea.l    a0,a2
[000398c8] 3600                      move.w     d0,d3
[000398ca] 6100 fbbc                 bsr        edit_row
[000398ce] 2540 0038                 move.l     d0,56(a2)
[000398d2] 2540 0030                 move.l     d0,48(a2)
[000398d6] 7201                      moveq.l    #1,d1
[000398d8] e788                      lsl.l      #3,d0
[000398da] 206a 002c                 movea.l    44(a2),a0
[000398de] c270 0806                 and.w      6(a0,d0.l),d1
[000398e2] 6604                      bne.s      edit_nmselect_1
[000398e4] 7401                      moveq.l    #1,d2
[000398e6] 6002                      bra.s      edit_nmselect_2
edit_nmselect_1:
[000398e8] 4242                      clr.w      d2
edit_nmselect_2:
[000398ea] 4241                      clr.w      d1
[000398ec] 3003                      move.w     d3,d0
[000398ee] 204a                      movea.l    a2,a0
[000398f0] 6100 fe3c                 bsr        edit_nselect
[000398f4] 245f                      movea.l    (a7)+,a2
[000398f6] 361f                      move.w     (a7)+,d3
[000398f8] 4e75                      rts

comp_rc:
[000398fa] 2f03                      move.l     d3,-(a7)
[000398fc] 262f 0008                 move.l     8(a7),d3
[00039900] b480                      cmp.l      d0,d2
[00039902] 6d08                      blt.s      comp_rc_1
[00039904] b480                      cmp.l      d0,d2
[00039906] 6e0c                      bgt.s      comp_rc_2
[00039908] b681                      cmp.l      d1,d3
[0003990a] 6c04                      bge.s      comp_rc_3
comp_rc_1:
[0003990c] 7001                      moveq.l    #1,d0
[0003990e] 600a                      bra.s      comp_rc_4
comp_rc_3:
[00039910] b681                      cmp.l      d1,d3
[00039912] 6f04                      ble.s      comp_rc_5
comp_rc_2:
[00039914] 70ff                      moveq.l    #-1,d0
[00039916] 6002                      bra.s      comp_rc_4
comp_rc_5:
[00039918] 4240                      clr.w      d0
comp_rc_4:
[0003991a] 261f                      move.l     (a7)+,d3
[0003991c] 4e75                      rts

edit_charselect:
[0003991e] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[00039922] 4fef ffe2                 lea.l      -30(a7),a7
[00039926] 2648                      movea.l    a0,a3
[00039928] 3f40 001c                 move.w     d0,28(a7)
[0003992c] 3f41 001a                 move.w     d1,26(a7)
[00039930] 3f42 0018                 move.w     d2,24(a7)
[00039934] 45ef 001a                 lea.l      26(a7),a2
[00039938] 49ef 001c                 lea.l      28(a7),a4
[0003993c] 3012                      move.w     (a2),d0
[0003993e] 204b                      movea.l    a3,a0
[00039940] 6100 fb46                 bsr        edit_row
[00039944] 2600                      move.l     d0,d3
[00039946] 204b                      movea.l    a3,a0
[00039948] 3014                      move.w     (a4),d0
[0003994a] 6100 fac2                 bsr        edit_col
[0003994e] 2f40 0008                 move.l     d0,8(a7)
[00039952] 2203                      move.l     d3,d1
[00039954] e789                      lsl.l      #3,d1
[00039956] 206b 002c                 movea.l    44(a3),a0
[0003995a] 2a70 1800                 movea.l    0(a0,d1.l),a5
[0003995e] 302b 009a                 move.w     154(a3),d0
[00039962] 204d                      movea.l    a5,a0
[00039964] 322f 000a                 move.w     10(a7),d1
[00039968] 6100 e21c                 bsr        posv
[0003996c] 48c0                      ext.l      d0
[0003996e] 2f40 0008                 move.l     d0,8(a7)
[00039972] 7203                      moveq.l    #3,d1
[00039974] c26f 0018                 and.w      24(a7),d1
[00039978] 674a                      beq.s      edit_charselect_1
[0003997a] 242b 0034                 move.l     52(a3),d2
[0003997e] d4ab 003c                 add.l      60(a3),d2
[00039982] e282                      asr.l      #1,d2
[00039984] 2f02                      move.l     d2,-(a7)
[00039986] 242b 0030                 move.l     48(a3),d2
[0003998a] d4ab 0038                 add.l      56(a3),d2
[0003998e] e282                      asr.l      #1,d2
[00039990] 2003                      move.l     d3,d0
[00039992] 222f 000c                 move.l     12(a7),d1
[00039996] 6100 ff62                 bsr        comp_rc
[0003999a] 584f                      addq.w     #4,a7
[0003999c] 4a40                      tst.w      d0
[0003999e] 6f12                      ble.s      edit_charselect_2
[000399a0] 262b 0030                 move.l     48(a3),d3
[000399a4] 2f6b 0034 0008            move.l     52(a3),8(a7)
[000399aa] 2f6b 0040 0004            move.l     64(a3),4(a7)
[000399b0] 6046                      bra.s      edit_charselect_3
edit_charselect_2:
[000399b2] 262b 0038                 move.l     56(a3),d3
[000399b6] 2f6b 003c 0008            move.l     60(a3),8(a7)
[000399bc] 2f6b 0044 0004            move.l     68(a3),4(a7)
[000399c2] 6034                      bra.s      edit_charselect_3
edit_charselect_1:
[000399c4] 4242                      clr.w      d2
[000399c6] 222b 0038                 move.l     56(a3),d1
[000399ca] 202b 0030                 move.l     48(a3),d0
[000399ce] 204b                      movea.l    a3,a0
[000399d0] 6100 fc9c                 bsr        edit_selrange
[000399d4] 2743 0038                 move.l     d3,56(a3)
[000399d8] 2743 0030                 move.l     d3,48(a3)
[000399dc] 322f 000a                 move.w     10(a7),d1
[000399e0] 302b 009a                 move.w     154(a3),d0
[000399e4] 204d                      movea.l    a5,a0
[000399e6] 6100 e1da                 bsr        vpos
[000399ea] 48c0                      ext.l      d0
[000399ec] 2f40 0004                 move.l     d0,4(a7)
[000399f0] 2740 0044                 move.l     d0,68(a3)
[000399f4] 2740 0040                 move.l     d0,64(a3)
edit_charselect_3:
[000399f8] 70fd                      moveq.l    #-3,d0
[000399fa] 2f40 0010                 move.l     d0,16(a7)
[000399fe] 2f40 0014                 move.l     d0,20(a7)
edit_charselect_19:
[00039a02] 3012                      move.w     (a2),d0
[00039a04] 204b                      movea.l    a3,a0
[00039a06] 6100 fa80                 bsr        edit_row
[00039a0a] 2e00                      move.l     d0,d7
[00039a0c] 204b                      movea.l    a3,a0
[00039a0e] 3014                      move.w     (a4),d0
[00039a10] 6100 f9fc                 bsr        edit_col
[00039a14] 2c00                      move.l     d0,d6
[00039a16] 2f46 000c                 move.l     d6,12(a7)
[00039a1a] 2007                      move.l     d7,d0
[00039a1c] e788                      lsl.l      #3,d0
[00039a1e] 206b 002c                 movea.l    44(a3),a0
[00039a22] 2a70 0800                 movea.l    0(a0,d0.l),a5
[00039a26] 3206                      move.w     d6,d1
[00039a28] 302b 009a                 move.w     154(a3),d0
[00039a2c] 204d                      movea.l    a5,a0
[00039a2e] 6100 e156                 bsr        posv
[00039a32] 48c0                      ext.l      d0
[00039a34] 2c00                      move.l     d0,d6
[00039a36] 3206                      move.w     d6,d1
[00039a38] 302b 009a                 move.w     154(a3),d0
[00039a3c] 204d                      movea.l    a5,a0
[00039a3e] 6100 e182                 bsr        vpos
[00039a42] 3a00                      move.w     d0,d5
[00039a44] 48c5                      ext.l      d5
[00039a46] beaf 0014                 cmp.l      20(a7),d7
[00039a4a] 6608                      bne.s      edit_charselect_4
[00039a4c] bcaf 0010                 cmp.l      16(a7),d6
[00039a50] 6700 01f6                 beq        edit_charselect_5
edit_charselect_4:
[00039a54] 2f2f 0008                 move.l     8(a7),-(a7)
[00039a58] 2403                      move.l     d3,d2
[00039a5a] 2206                      move.l     d6,d1
[00039a5c] 2007                      move.l     d7,d0
[00039a5e] 6100 fe9a                 bsr        comp_rc
[00039a62] 584f                      addq.w     #4,a7
[00039a64] 4a40                      tst.w      d0
[00039a66] 6b00 00fc                 bmi        edit_charselect_6
[00039a6a] 2f2b 003c                 move.l     60(a3),-(a7)
[00039a6e] 242b 0038                 move.l     56(a3),d2
[00039a72] 2206                      move.l     d6,d1
[00039a74] 2007                      move.l     d7,d0
[00039a76] 6100 fe82                 bsr        comp_rc
[00039a7a] 584f                      addq.w     #4,a7
[00039a7c] 4a40                      tst.w      d0
[00039a7e] 6a28                      bpl.s      edit_charselect_7
[00039a80] 2747 0030                 move.l     d7,48(a3)
[00039a84] 2745 0040                 move.l     d5,64(a3)
[00039a88] 4242                      clr.w      d2
[00039a8a] 222b 0038                 move.l     56(a3),d1
[00039a8e] 2007                      move.l     d7,d0
[00039a90] 204b                      movea.l    a3,a0
[00039a92] 6100 fbda                 bsr        edit_selrange
[00039a96] 2007                      move.l     d7,d0
[00039a98] e788                      lsl.l      #3,d0
[00039a9a] 206b 002c                 movea.l    44(a3),a0
[00039a9e] 0070 0001 0806            ori.w      #$0001,6(a0,d0.l)
[00039aa4] 6000 009e                 bra        edit_charselect_8
edit_charselect_7:
[00039aa8] 2f2b 003c                 move.l     60(a3),-(a7)
[00039aac] 242b 0038                 move.l     56(a3),d2
[00039ab0] 222f 000c                 move.l     12(a7),d1
[00039ab4] 2003                      move.l     d3,d0
[00039ab6] 6100 fe42                 bsr        comp_rc
[00039aba] 584f                      addq.w     #4,a7
[00039abc] 4a40                      tst.w      d0
[00039abe] 6a42                      bpl.s      edit_charselect_9
[00039ac0] 282b 0038                 move.l     56(a3),d4
[00039ac4] 2744 0030                 move.l     d4,48(a3)
[00039ac8] 276b 0044 0040            move.l     68(a3),64(a3)
[00039ace] 2747 0038                 move.l     d7,56(a3)
[00039ad2] 2745 0044                 move.l     d5,68(a3)
[00039ad6] be84                      cmp.l      d4,d7
[00039ad8] 6606                      bne.s      edit_charselect_10
[00039ada] baab 0040                 cmp.l      64(a3),d5
[00039ade] 6f1c                      ble.s      edit_charselect_11
edit_charselect_10:
[00039ae0] 2004                      move.l     d4,d0
[00039ae2] e788                      lsl.l      #3,d0
[00039ae4] 206b 002c                 movea.l    44(a3),a0
[00039ae8] 0270 fffe 0806            andi.w     #$FFFE,6(a0,d0.l)
[00039aee] 7401                      moveq.l    #1,d2
[00039af0] 2207                      move.l     d7,d1
[00039af2] 204b                      movea.l    a3,a0
[00039af4] 2004                      move.l     d4,d0
[00039af6] 6100 fb76                 bsr        edit_selrange
[00039afa] 6048                      bra.s      edit_charselect_8
edit_charselect_11:
[00039afc] 2747 0038                 move.l     d7,56(a3)
[00039b00] 6042                      bra.s      edit_charselect_8
edit_charselect_9:
[00039b02] 2f2b 0034                 move.l     52(a3),-(a7)
[00039b06] 242b 0030                 move.l     48(a3),d2
[00039b0a] 2206                      move.l     d6,d1
[00039b0c] 2007                      move.l     d7,d0
[00039b0e] 6100 fdea                 bsr        comp_rc
[00039b12] 584f                      addq.w     #4,a7
[00039b14] 4a40                      tst.w      d0
[00039b16] 6f2c                      ble.s      edit_charselect_8
[00039b18] 4242                      clr.w      d2
[00039b1a] 2203                      move.l     d3,d1
[00039b1c] 202b 0030                 move.l     48(a3),d0
[00039b20] 204b                      movea.l    a3,a0
[00039b22] 6100 fb4a                 bsr        edit_selrange
[00039b26] 2743 0030                 move.l     d3,48(a3)
[00039b2a] 276f 0004 0040            move.l     4(a7),64(a3)
[00039b30] 2747 0038                 move.l     d7,56(a3)
[00039b34] 2745 0044                 move.l     d5,68(a3)
[00039b38] 7401                      moveq.l    #1,d2
[00039b3a] 2207                      move.l     d7,d1
[00039b3c] 2003                      move.l     d3,d0
[00039b3e] 204b                      movea.l    a3,a0
[00039b40] 6100 fb2c                 bsr        edit_selrange
edit_charselect_8:
[00039b44] 2743 0030                 move.l     d3,48(a3)
[00039b48] 276f 0008 0034            move.l     8(a7),52(a3)
[00039b4e] 276f 0004 0040            move.l     4(a7),64(a3)
[00039b54] 2747 0038                 move.l     d7,56(a3)
[00039b58] 2746 003c                 move.l     d6,60(a3)
[00039b5c] 2745 0044                 move.l     d5,68(a3)
[00039b60] 6000 00e6                 bra        edit_charselect_5
edit_charselect_6:
[00039b64] 2f2b 0034                 move.l     52(a3),-(a7)
[00039b68] 242b 0030                 move.l     48(a3),d2
[00039b6c] 2206                      move.l     d6,d1
[00039b6e] 2007                      move.l     d7,d0
[00039b70] 6100 fd88                 bsr        comp_rc
[00039b74] 584f                      addq.w     #4,a7
[00039b76] 4a40                      tst.w      d0
[00039b78] 6f28                      ble.s      edit_charselect_12
[00039b7a] 2747 0038                 move.l     d7,56(a3)
[00039b7e] 2745 0044                 move.l     d5,68(a3)
[00039b82] 4242                      clr.w      d2
[00039b84] 2207                      move.l     d7,d1
[00039b86] 202b 0030                 move.l     48(a3),d0
[00039b8a] 204b                      movea.l    a3,a0
[00039b8c] 6100 fae0                 bsr        edit_selrange
[00039b90] 2007                      move.l     d7,d0
[00039b92] e788                      lsl.l      #3,d0
[00039b94] 206b 002c                 movea.l    44(a3),a0
[00039b98] 0070 0001 0806            ori.w      #$0001,6(a0,d0.l)
[00039b9e] 6000 008c                 bra        edit_charselect_13
edit_charselect_12:
[00039ba2] 2f2b 0034                 move.l     52(a3),-(a7)
[00039ba6] 242b 0030                 move.l     48(a3),d2
[00039baa] 222f 000c                 move.l     12(a7),d1
[00039bae] 2003                      move.l     d3,d0
[00039bb0] 6100 fd48                 bsr        comp_rc
[00039bb4] 584f                      addq.w     #4,a7
[00039bb6] 4a40                      tst.w      d0
[00039bb8] 6f44                      ble.s      edit_charselect_14
[00039bba] 282b 0030                 move.l     48(a3),d4
[00039bbe] 2744 0038                 move.l     d4,56(a3)
[00039bc2] 276b 0040 0044            move.l     64(a3),68(a3)
[00039bc8] 2747 0030                 move.l     d7,48(a3)
[00039bcc] 2745 0040                 move.l     d5,64(a3)
[00039bd0] be84                      cmp.l      d4,d7
[00039bd2] 6608                      bne.s      edit_charselect_15
[00039bd4] 202b 0044                 move.l     68(a3),d0
[00039bd8] b085                      cmp.l      d5,d0
[00039bda] 6f1c                      ble.s      edit_charselect_16
edit_charselect_15:
[00039bdc] 2004                      move.l     d4,d0
[00039bde] e788                      lsl.l      #3,d0
[00039be0] 206b 002c                 movea.l    44(a3),a0
[00039be4] 0270 fffe 0806            andi.w     #$FFFE,6(a0,d0.l)
[00039bea] 7401                      moveq.l    #1,d2
[00039bec] 2204                      move.l     d4,d1
[00039bee] 204b                      movea.l    a3,a0
[00039bf0] 2007                      move.l     d7,d0
[00039bf2] 6100 fa7a                 bsr        edit_selrange
[00039bf6] 6034                      bra.s      edit_charselect_13
edit_charselect_16:
[00039bf8] 2747 0038                 move.l     d7,56(a3)
[00039bfc] 602e                      bra.s      edit_charselect_13
edit_charselect_14:
[00039bfe] 4242                      clr.w      d2
[00039c00] 222b 0038                 move.l     56(a3),d1
[00039c04] 202b 0030                 move.l     48(a3),d0
[00039c08] 204b                      movea.l    a3,a0
[00039c0a] 6100 fa62                 bsr        edit_selrange
[00039c0e] 2747 0030                 move.l     d7,48(a3)
[00039c12] 2745 0040                 move.l     d5,64(a3)
[00039c16] 2743 0038                 move.l     d3,56(a3)
[00039c1a] 276f 0004 0044            move.l     4(a7),68(a3)
[00039c20] 7401                      moveq.l    #1,d2
[00039c22] 2203                      move.l     d3,d1
[00039c24] 2007                      move.l     d7,d0
[00039c26] 204b                      movea.l    a3,a0
[00039c28] 6100 fa44                 bsr        edit_selrange
edit_charselect_13:
[00039c2c] 2747 0030                 move.l     d7,48(a3)
[00039c30] 2746 0034                 move.l     d6,52(a3)
[00039c34] 2745 0040                 move.l     d5,64(a3)
[00039c38] 2743 0038                 move.l     d3,56(a3)
[00039c3c] 276f 0008 003c            move.l     8(a7),60(a3)
[00039c42] 276f 0004 0044            move.l     4(a7),68(a3)
edit_charselect_5:
[00039c48] beab 0018                 cmp.l      24(a3),d7
[00039c4c] 6d22                      blt.s      edit_charselect_17
[00039c4e] 202b 0018                 move.l     24(a3),d0
[00039c52] d0ab 000a                 add.l      10(a3),d0
[00039c56] be80                      cmp.l      d0,d7
[00039c58] 6c16                      bge.s      edit_charselect_17
[00039c5a] 222f 000c                 move.l     12(a7),d1
[00039c5e] b2ab 001c                 cmp.l      28(a3),d1
[00039c62] 6d0c                      blt.s      edit_charselect_17
[00039c64] 242b 001c                 move.l     28(a3),d2
[00039c68] d4ab 000e                 add.l      14(a3),d2
[00039c6c] b282                      cmp.l      d2,d1
[00039c6e] 6f22                      ble.s      edit_charselect_18
edit_charselect_17:
[00039c70] 2007                      move.l     d7,d0
[00039c72] 204b                      movea.l    a3,a0
[00039c74] 6100 f19a                 bsr        edit_showline
[00039c78] 202f 000c                 move.l     12(a7),d0
[00039c7c] 204b                      movea.l    a3,a0
[00039c7e] 6100 e65e                 bsr        edit_showcol
[00039c82] 204b                      movea.l    a3,a0
[00039c84] 6100 f382                 bsr        edit_update
[00039c88] 7001                      moveq.l    #1,d0
[00039c8a] 204b                      movea.l    a3,a0
[00039c8c] 4eb9 0003 b618            jsr        cleanup
edit_charselect_18:
[00039c92] 2f47 0014                 move.l     d7,20(a7)
[00039c96] 2f46 0010                 move.l     d6,16(a7)
[00039c9a] 2f39 000e 692a            move.l     _globl,-(a7)
[00039ca0] 486f 0006                 pea.l      6(a7)
[00039ca4] 486f 0008                 pea.l      8(a7)
[00039ca8] 224a                      movea.l    a2,a1
[00039caa] 204c                      movea.l    a4,a0
[00039cac] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00039cb2] 4fef 000c                 lea.l      12(a7),a7
[00039cb6] 7001                      moveq.l    #1,d0
[00039cb8] c057                      and.w      (a7),d0
[00039cba] 6600 fd46                 bne        edit_charselect_19
[00039cbe] 4fef 001e                 lea.l      30(a7),a7
[00039cc2] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[00039cc6] 4e75                      rts

edit_blkselect:
[00039cc8] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[00039ccc] 4fef fff4                 lea.l      -12(a7),a7
[00039cd0] 2448                      movea.l    a0,a2
[00039cd2] 3f40 000a                 move.w     d0,10(a7)
[00039cd6] 3f41 0008                 move.w     d1,8(a7)
[00039cda] 47ef 000a                 lea.l      10(a7),a3
[00039cde] 49ef 0008                 lea.l      8(a7),a4
[00039ce2] 7003                      moveq.l    #3,d0
[00039ce4] c042                      and.w      d2,d0
[00039ce6] 6746                      beq.s      edit_blkselect_1
[00039ce8] 222a 0040                 move.l     64(a2),d1
[00039cec] d2aa 0044                 add.l      68(a2),d1
[00039cf0] e281                      asr.l      #1,d1
[00039cf2] 2f01                      move.l     d1,-(a7)
[00039cf4] 204a                      movea.l    a2,a0
[00039cf6] 3013                      move.w     (a3),d0
[00039cf8] 6100 f714                 bsr        edit_col
[00039cfc] b09f                      cmp.l      (a7)+,d0
[00039cfe] 6f06                      ble.s      edit_blkselect_2
[00039d00] 262a 0040                 move.l     64(a2),d3
[00039d04] 6004                      bra.s      edit_blkselect_3
edit_blkselect_2:
[00039d06] 262a 0044                 move.l     68(a2),d3
edit_blkselect_3:
[00039d0a] 202a 0030                 move.l     48(a2),d0
[00039d0e] d0aa 0038                 add.l      56(a2),d0
[00039d12] e280                      asr.l      #1,d0
[00039d14] 2f00                      move.l     d0,-(a7)
[00039d16] 204a                      movea.l    a2,a0
[00039d18] 3014                      move.w     (a4),d0
[00039d1a] 6100 f76c                 bsr        edit_row
[00039d1e] b09f                      cmp.l      (a7)+,d0
[00039d20] 6f06                      ble.s      edit_blkselect_4
[00039d22] 282a 0030                 move.l     48(a2),d4
[00039d26] 6078                      bra.s      edit_blkselect_5
edit_blkselect_4:
[00039d28] 282a 0038                 move.l     56(a2),d4
[00039d2c] 6072                      bra.s      edit_blkselect_5
edit_blkselect_1:
[00039d2e] 4242                      clr.w      d2
[00039d30] 222a 0038                 move.l     56(a2),d1
[00039d34] 202a 0030                 move.l     48(a2),d0
[00039d38] 204a                      movea.l    a2,a0
[00039d3a] 6100 f932                 bsr        edit_selrange
[00039d3e] 3014                      move.w     (a4),d0
[00039d40] 204a                      movea.l    a2,a0
[00039d42] 6100 f744                 bsr        edit_row
[00039d46] 2800                      move.l     d0,d4
[00039d48] 2540 0038                 move.l     d0,56(a2)
[00039d4c] 2540 0030                 move.l     d0,48(a2)
[00039d50] 2204                      move.l     d4,d1
[00039d52] e789                      lsl.l      #3,d1
[00039d54] 206a 002c                 movea.l    44(a2),a0
[00039d58] 2a70 1800                 movea.l    0(a0,d1.l),a5
[00039d5c] 204a                      movea.l    a2,a0
[00039d5e] 3013                      move.w     (a3),d0
[00039d60] 6100 f6ac                 bsr        edit_col
[00039d64] 2a00                      move.l     d0,d5
[00039d66] 3205                      move.w     d5,d1
[00039d68] 302a 009a                 move.w     154(a2),d0
[00039d6c] 204d                      movea.l    a5,a0
[00039d6e] 6100 de16                 bsr        posv
[00039d72] 48c0                      ext.l      d0
[00039d74] 2a00                      move.l     d0,d5
[00039d76] 3205                      move.w     d5,d1
[00039d78] 302a 009a                 move.w     154(a2),d0
[00039d7c] 204d                      movea.l    a5,a0
[00039d7e] 6100 de42                 bsr        vpos
[00039d82] 48c0                      ext.l      d0
[00039d84] 2a00                      move.l     d0,d5
[00039d86] 2605                      move.l     d5,d3
[00039d88] 2543 0044                 move.l     d3,68(a2)
[00039d8c] 2543 0040                 move.l     d3,64(a2)
[00039d90] 7401                      moveq.l    #1,d2
[00039d92] 222a 0038                 move.l     56(a2),d1
[00039d96] 202a 0030                 move.l     48(a2),d0
[00039d9a] 204a                      movea.l    a2,a0
[00039d9c] 6100 f8d0                 bsr        edit_selrange
edit_blkselect_5:
[00039da0] 7efe                      moveq.l    #-2,d7
[00039da2] 2f47 0004                 move.l     d7,4(a7)
edit_blkselect_30:
[00039da6] 3014                      move.w     (a4),d0
[00039da8] 204a                      movea.l    a2,a0
[00039daa] 6100 f6dc                 bsr        edit_row
[00039dae] 2c00                      move.l     d0,d6
[00039db0] 204a                      movea.l    a2,a0
[00039db2] 3013                      move.w     (a3),d0
[00039db4] 6100 f658                 bsr        edit_col
[00039db8] 2a00                      move.l     d0,d5
[00039dba] 2206                      move.l     d6,d1
[00039dbc] e789                      lsl.l      #3,d1
[00039dbe] 206a 002c                 movea.l    44(a2),a0
[00039dc2] 2a70 1800                 movea.l    0(a0,d1.l),a5
[00039dc6] 302a 009a                 move.w     154(a2),d0
[00039dca] 204d                      movea.l    a5,a0
[00039dcc] 3205                      move.w     d5,d1
[00039dce] 6100 ddb6                 bsr        posv
[00039dd2] 48c0                      ext.l      d0
[00039dd4] 2a00                      move.l     d0,d5
[00039dd6] 3205                      move.w     d5,d1
[00039dd8] 302a 009a                 move.w     154(a2),d0
[00039ddc] 204d                      movea.l    a5,a0
[00039dde] 6100 dde2                 bsr        vpos
[00039de2] 48c0                      ext.l      d0
[00039de4] 2a00                      move.l     d0,d5
[00039de6] be86                      cmp.l      d6,d7
[00039de8] 6608                      bne.s      edit_blkselect_6
[00039dea] b0af 0004                 cmp.l      4(a7),d0
[00039dee] 6700 01b0                 beq        edit_blkselect_7
edit_blkselect_6:
[00039df2] b685                      cmp.l      d5,d3
[00039df4] 6e5c                      bgt.s      edit_blkselect_8
[00039df6] baaa 0044                 cmp.l      68(a2),d5
[00039dfa] 6c06                      bge.s      edit_blkselect_9
[00039dfc] 2545 0040                 move.l     d5,64(a2)
[00039e00] 6036                      bra.s      edit_blkselect_10
edit_blkselect_9:
[00039e02] b6aa 0044                 cmp.l      68(a2),d3
[00039e06] 6c08                      bge.s      edit_blkselect_11
[00039e08] 256a 0044 0040            move.l     68(a2),64(a2)
[00039e0e] 601e                      bra.s      edit_blkselect_12
edit_blkselect_11:
[00039e10] 202a 0044                 move.l     68(a2),d0
[00039e14] b0aa 0040                 cmp.l      64(a2),d0
[00039e18] 6d10                      blt.s      edit_blkselect_13
[00039e1a] 7402                      moveq.l    #2,d2
[00039e1c] 222a 0038                 move.l     56(a2),d1
[00039e20] 202a 0030                 move.l     48(a2),d0
[00039e24] 204a                      movea.l    a2,a0
[00039e26] 6100 f846                 bsr        edit_selrange
edit_blkselect_13:
[00039e2a] 2543 0040                 move.l     d3,64(a2)
edit_blkselect_12:
[00039e2e] 2545 0044                 move.l     d5,68(a2)
[00039e32] baaa 0040                 cmp.l      64(a2),d5
[00039e36] 6d10                      blt.s      edit_blkselect_14
edit_blkselect_10:
[00039e38] 7402                      moveq.l    #2,d2
[00039e3a] 222a 0038                 move.l     56(a2),d1
[00039e3e] 202a 0030                 move.l     48(a2),d0
[00039e42] 204a                      movea.l    a2,a0
[00039e44] 6100 f828                 bsr        edit_selrange
edit_blkselect_14:
[00039e48] 2543 0040                 move.l     d3,64(a2)
[00039e4c] 2545 0044                 move.l     d5,68(a2)
[00039e50] 605e                      bra.s      edit_blkselect_15
edit_blkselect_8:
[00039e52] baaa 0040                 cmp.l      64(a2),d5
[00039e56] 6d0c                      blt.s      edit_blkselect_16
[00039e58] baaa 0040                 cmp.l      64(a2),d5
[00039e5c] 6f4a                      ble.s      edit_blkselect_17
[00039e5e] 2545 0044                 move.l     d5,68(a2)
[00039e62] 6034                      bra.s      edit_blkselect_18
edit_blkselect_16:
[00039e64] b6aa 0040                 cmp.l      64(a2),d3
[00039e68] 6f0c                      ble.s      edit_blkselect_19
[00039e6a] 256a 0040 0044            move.l     64(a2),68(a2)
[00039e70] 2545 0040                 move.l     d5,64(a2)
[00039e74] 6022                      bra.s      edit_blkselect_18
edit_blkselect_19:
[00039e76] 202a 0044                 move.l     68(a2),d0
[00039e7a] b0aa 0040                 cmp.l      64(a2),d0
[00039e7e] 6d10                      blt.s      edit_blkselect_20
[00039e80] 7402                      moveq.l    #2,d2
[00039e82] 222a 0038                 move.l     56(a2),d1
[00039e86] 202a 0030                 move.l     48(a2),d0
[00039e8a] 204a                      movea.l    a2,a0
[00039e8c] 6100 f7e0                 bsr        edit_selrange
edit_blkselect_20:
[00039e90] 2545 0040                 move.l     d5,64(a2)
[00039e94] 2543 0044                 move.l     d3,68(a2)
edit_blkselect_18:
[00039e98] 7402                      moveq.l    #2,d2
[00039e9a] 222a 0038                 move.l     56(a2),d1
[00039e9e] 202a 0030                 move.l     48(a2),d0
[00039ea2] 204a                      movea.l    a2,a0
[00039ea4] 6100 f7c8                 bsr        edit_selrange
edit_blkselect_17:
[00039ea8] 2545 0040                 move.l     d5,64(a2)
[00039eac] 2543 0044                 move.l     d3,68(a2)
edit_blkselect_15:
[00039eb0] b886                      cmp.l      d6,d4
[00039eb2] 6c54                      bge.s      edit_blkselect_21
[00039eb4] bcaa 0038                 cmp.l      56(a2),d6
[00039eb8] 6c12                      bge.s      edit_blkselect_22
[00039eba] 4242                      clr.w      d2
[00039ebc] 222a 0038                 move.l     56(a2),d1
[00039ec0] 7001                      moveq.l    #1,d0
[00039ec2] d086                      add.l      d6,d0
[00039ec4] 204a                      movea.l    a2,a0
[00039ec6] 6100 f7a6                 bsr        edit_selrange
[00039eca] 6032                      bra.s      edit_blkselect_23
edit_blkselect_22:
[00039ecc] b8aa 0038                 cmp.l      56(a2),d4
[00039ed0] 6c10                      bge.s      edit_blkselect_24
[00039ed2] 7401                      moveq.l    #1,d2
[00039ed4] 2206                      move.l     d6,d1
[00039ed6] 202a 0038                 move.l     56(a2),d0
[00039eda] 204a                      movea.l    a2,a0
[00039edc] 6100 f790                 bsr        edit_selrange
[00039ee0] 601c                      bra.s      edit_blkselect_23
edit_blkselect_24:
[00039ee2] 4242                      clr.w      d2
[00039ee4] 72ff                      moveq.l    #-1,d1
[00039ee6] d284                      add.l      d4,d1
[00039ee8] 202a 0030                 move.l     48(a2),d0
[00039eec] 204a                      movea.l    a2,a0
[00039eee] 6100 f77e                 bsr        edit_selrange
[00039ef2] 7401                      moveq.l    #1,d2
[00039ef4] 2206                      move.l     d6,d1
[00039ef6] 2004                      move.l     d4,d0
[00039ef8] 204a                      movea.l    a2,a0
[00039efa] 6100 f772                 bsr        edit_selrange
edit_blkselect_23:
[00039efe] 2544 0030                 move.l     d4,48(a2)
[00039f02] 2546 0038                 move.l     d6,56(a2)
[00039f06] 6054                      bra.s      edit_blkselect_25
edit_blkselect_21:
[00039f08] bcaa 0030                 cmp.l      48(a2),d6
[00039f0c] 6f12                      ble.s      edit_blkselect_26
[00039f0e] 4242                      clr.w      d2
[00039f10] 72ff                      moveq.l    #-1,d1
[00039f12] d286                      add.l      d6,d1
[00039f14] 202a 0030                 move.l     48(a2),d0
[00039f18] 204a                      movea.l    a2,a0
[00039f1a] 6100 f752                 bsr        edit_selrange
[00039f1e] 6034                      bra.s      edit_blkselect_27
edit_blkselect_26:
[00039f20] b8aa 0030                 cmp.l      48(a2),d4
[00039f24] 6f10                      ble.s      edit_blkselect_28
[00039f26] 7401                      moveq.l    #1,d2
[00039f28] 222a 0030                 move.l     48(a2),d1
[00039f2c] 2006                      move.l     d6,d0
[00039f2e] 204a                      movea.l    a2,a0
[00039f30] 6100 f73c                 bsr        edit_selrange
[00039f34] 601e                      bra.s      edit_blkselect_27
edit_blkselect_28:
[00039f36] 4242                      clr.w      d2
[00039f38] 222a 0038                 move.l     56(a2),d1
[00039f3c] 7001                      moveq.l    #1,d0
[00039f3e] d084                      add.l      d4,d0
[00039f40] 204a                      movea.l    a2,a0
[00039f42] 6100 f72a                 bsr        edit_selrange
[00039f46] 7401                      moveq.l    #1,d2
[00039f48] 72ff                      moveq.l    #-1,d1
[00039f4a] d284                      add.l      d4,d1
[00039f4c] 2006                      move.l     d6,d0
[00039f4e] 204a                      movea.l    a2,a0
[00039f50] 6100 f71c                 bsr        edit_selrange
edit_blkselect_27:
[00039f54] 2546 0030                 move.l     d6,48(a2)
[00039f58] 2544 0038                 move.l     d4,56(a2)
edit_blkselect_25:
[00039f5c] bcaa 0018                 cmp.l      24(a2),d6
[00039f60] 6d1e                      blt.s      edit_blkselect_29
[00039f62] 202a 0018                 move.l     24(a2),d0
[00039f66] d0aa 000a                 add.l      10(a2),d0
[00039f6a] bc80                      cmp.l      d0,d6
[00039f6c] 6c12                      bge.s      edit_blkselect_29
[00039f6e] baaa 001c                 cmp.l      28(a2),d5
[00039f72] 6d0c                      blt.s      edit_blkselect_29
[00039f74] 222a 001c                 move.l     28(a2),d1
[00039f78] d2aa 000e                 add.l      14(a2),d1
[00039f7c] ba81                      cmp.l      d1,d5
[00039f7e] 6d20                      blt.s      edit_blkselect_7
edit_blkselect_29:
[00039f80] 2006                      move.l     d6,d0
[00039f82] 204a                      movea.l    a2,a0
[00039f84] 6100 ee8a                 bsr        edit_showline
[00039f88] 2005                      move.l     d5,d0
[00039f8a] 204a                      movea.l    a2,a0
[00039f8c] 6100 e350                 bsr        edit_showcol
[00039f90] 204a                      movea.l    a2,a0
[00039f92] 6100 f074                 bsr        edit_update
[00039f96] 7001                      moveq.l    #1,d0
[00039f98] 204a                      movea.l    a2,a0
[00039f9a] 4eb9 0003 b618            jsr        cleanup
edit_blkselect_7:
[00039fa0] 2e06                      move.l     d6,d7
[00039fa2] 2f45 0004                 move.l     d5,4(a7)
[00039fa6] 2f39 000e 692a            move.l     _globl,-(a7)
[00039fac] 486f 0006                 pea.l      6(a7)
[00039fb0] 486f 0008                 pea.l      8(a7)
[00039fb4] 224c                      movea.l    a4,a1
[00039fb6] 204b                      movea.l    a3,a0
[00039fb8] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00039fbe] 4fef 000c                 lea.l      12(a7),a7
[00039fc2] 7001                      moveq.l    #1,d0
[00039fc4] c057                      and.w      (a7),d0
[00039fc6] 6600 fdde                 bne        edit_blkselect_30
[00039fca] 222a 0030                 move.l     48(a2),d1
[00039fce] e789                      lsl.l      #3,d1
[00039fd0] 206a 002c                 movea.l    44(a2),a0
[00039fd4] 2a70 1800                 movea.l    0(a0,d1.l),a5
[00039fd8] 322a 0042                 move.w     66(a2),d1
[00039fdc] 302a 009a                 move.w     154(a2),d0
[00039fe0] 204d                      movea.l    a5,a0
[00039fe2] 6100 dba2                 bsr        posv
[00039fe6] 48c0                      ext.l      d0
[00039fe8] 2540 0034                 move.l     d0,52(a2)
[00039fec] 222a 0038                 move.l     56(a2),d1
[00039ff0] e789                      lsl.l      #3,d1
[00039ff2] 206a 002c                 movea.l    44(a2),a0
[00039ff6] 2a70 1800                 movea.l    0(a0,d1.l),a5
[00039ffa] 322a 0046                 move.w     70(a2),d1
[00039ffe] 302a 009a                 move.w     154(a2),d0
[0003a002] 204d                      movea.l    a5,a0
[0003a004] 6100 db80                 bsr        posv
[0003a008] 48c0                      ext.l      d0
[0003a00a] 2540 003c                 move.l     d0,60(a2)
[0003a00e] 4fef 000c                 lea.l      12(a7),a7
[0003a012] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[0003a016] 4e75                      rts

edit_add:
[0003a018] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003a01c] 2a48                      movea.l    a0,a5
[0003a01e] 2649                      movea.l    a1,a3
[0003a020] 222d 002c                 move.l     44(a5),d1
[0003a024] 672e                      beq.s      edit_add_1
[0003a026] 2400                      move.l     d0,d2
[0003a028] e78a                      lsl.l      #3,d2
[0003a02a] 2441                      movea.l    d1,a2
[0003a02c] d5c2                      adda.l     d2,a2
[0003a02e] 2049                      movea.l    a1,a0
[0003a030] 4eb9 0008 2f6c            jsr        strlen
[0003a036] 2600                      move.l     d0,d3
[0003a038] d66a 0004                 add.w      4(a2),d3
[0003a03c] 7001                      moveq.l    #1,d0
[0003a03e] d043                      add.w      d3,d0
[0003a040] 48c0                      ext.l      d0
[0003a042] 4eb9 0004 c608            jsr        Ax_malloc
[0003a048] 2848                      movea.l    a0,a4
[0003a04a] 200c                      move.l     a4,d0
[0003a04c] 660a                      bne.s      edit_add_2
[0003a04e] 006d 0001 009e            ori.w      #$0001,158(a5)
edit_add_1:
[0003a054] 70ff                      moveq.l    #-1,d0
[0003a056] 6038                      bra.s      edit_add_3
edit_add_2:
[0003a058] 302a 0004                 move.w     4(a2),d0
[0003a05c] 6720                      beq.s      edit_add_4
[0003a05e] 2a52                      movea.l    (a2),a5
[0003a060] 224d                      movea.l    a5,a1
[0003a062] 204c                      movea.l    a4,a0
[0003a064] 4eb9 0008 2f0c            jsr        strcpy
[0003a06a] 224b                      movea.l    a3,a1
[0003a06c] 4eb9 0008 2e42            jsr        strcat
[0003a072] 2488                      move.l     a0,(a2)
[0003a074] 204d                      movea.l    a5,a0
[0003a076] 4eb9 0004 c6c8            jsr        Ax_ifree
[0003a07c] 600c                      bra.s      edit_add_5
edit_add_4:
[0003a07e] 224b                      movea.l    a3,a1
[0003a080] 204c                      movea.l    a4,a0
[0003a082] 4eb9 0008 2f0c            jsr        strcpy
[0003a088] 2488                      move.l     a0,(a2)
edit_add_5:
[0003a08a] 3543 0004                 move.w     d3,4(a2)
[0003a08e] 4240                      clr.w      d0
edit_add_3:
[0003a090] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003a094] 4e75                      rts

edit_appline:
[0003a096] 2f0a                      move.l     a2,-(a7)
[0003a098] 2068 000c                 movea.l    12(a0),a0
[0003a09c] 2468 000c                 movea.l    12(a0),a2
[0003a0a0] 1011                      move.b     (a1),d0
[0003a0a2] 6712                      beq.s      edit_appline_1
[0003a0a4] 202a 0028                 move.l     40(a2),d0
[0003a0a8] 204a                      movea.l    a2,a0
[0003a0aa] 6100 ff6c                 bsr        edit_add
[0003a0ae] 4a40                      tst.w      d0
[0003a0b0] 6704                      beq.s      edit_appline_1
[0003a0b2] 70ff                      moveq.l    #-1,d0
[0003a0b4] 600c                      bra.s      edit_appline_2
edit_appline_1:
[0003a0b6] 202a 0028                 move.l     40(a2),d0
[0003a0ba] 204a                      movea.l    a2,a0
[0003a0bc] 6100 ed52                 bsr        edit_showline
[0003a0c0] 4240                      clr.w      d0
edit_appline_2:
[0003a0c2] 245f                      movea.l    (a7)+,a2
[0003a0c4] 4e75                      rts

edit_free:
[0003a0c6] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0003a0ca] 2448                      movea.l    a0,a2
[0003a0cc] 266a 002c                 movea.l    44(a2),a3
[0003a0d0] 262a 0028                 move.l     40(a2),d3
[0003a0d4] 6012                      bra.s      edit_free_1
edit_free_3:
[0003a0d6] 302b 0004                 move.w     4(a3),d0
[0003a0da] 6f08                      ble.s      edit_free_2
[0003a0dc] 2053                      movea.l    (a3),a0
[0003a0de] 4eb9 0004 c6c8            jsr        Ax_ifree
edit_free_2:
[0003a0e4] 504b                      addq.w     #8,a3
[0003a0e6] 5383                      subq.l     #1,d3
edit_free_1:
[0003a0e8] 4a83                      tst.l      d3
[0003a0ea] 6aea                      bpl.s      edit_free_3
[0003a0ec] 206a 002c                 movea.l    44(a2),a0
[0003a0f0] 4eb9 0004 c6c8            jsr        Ax_ifree
[0003a0f6] 202a 0092                 move.l     146(a2),d0
[0003a0fa] 206a 0096                 movea.l    150(a2),a0
[0003a0fe] 6100 e234                 bsr        edit_freeundo
[0003a102] 42aa 0096                 clr.l      150(a2)
[0003a106] 42aa 0092                 clr.l      146(a2)
[0003a10a] 7000                      moveq.l    #0,d0
[0003a10c] 2540 0044                 move.l     d0,68(a2)
[0003a110] 2540 0040                 move.l     d0,64(a2)
[0003a114] 2540 003c                 move.l     d0,60(a2)
[0003a118] 2540 0034                 move.l     d0,52(a2)
[0003a11c] 2540 0038                 move.l     d0,56(a2)
[0003a120] 2540 0030                 move.l     d0,48(a2)
[0003a124] 026a fdff 0012            andi.w     #$FDFF,18(a2)
[0003a12a] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0003a12e] 4e75                      rts

resize:
[0003a130] 2f0a                      move.l     a2,-(a7)
[0003a132] 2268 000c                 movea.l    12(a0),a1
[0003a136] 2469 000c                 movea.l    12(a1),a2
[0003a13a] 3028 0016                 move.w     22(a0),d0
[0003a13e] 48c0                      ext.l      d0
[0003a140] 81ea 0006                 divs.w     6(a2),d0
[0003a144] 48c0                      ext.l      d0
[0003a146] 2540 000a                 move.l     d0,10(a2)
[0003a14a] 3228 0014                 move.w     20(a0),d1
[0003a14e] 48c1                      ext.l      d1
[0003a150] 83ea 0008                 divs.w     8(a2),d1
[0003a154] 48c1                      ext.l      d1
[0003a156] 2541 000e                 move.l     d1,14(a2)
[0003a15a] 2001                      move.l     d1,d0
[0003a15c] 322a 0008                 move.w     8(a2),d1
[0003a160] 48c1                      ext.l      d1
[0003a162] 4eb9 0008 3cac            jsr        _lmul
[0003a168] 3540 004a                 move.w     d0,74(a2)
[0003a16c] 202a 000a                 move.l     10(a2),d0
[0003a170] 322a 0006                 move.w     6(a2),d1
[0003a174] 48c1                      ext.l      d1
[0003a176] 4eb9 0008 3cac            jsr        _lmul
[0003a17c] 3540 0048                 move.w     d0,72(a2)
[0003a180] 026a fffe 0012            andi.w     #$FFFE,18(a2)
[0003a186] 006a 0008 0012            ori.w      #$0008,18(a2)
[0003a18c] 202a 0020                 move.l     32(a2),d0
[0003a190] 90aa 000e                 sub.l      14(a2),d0
[0003a194] 4a80                      tst.l      d0
[0003a196] 6a02                      bpl.s      resize_1
[0003a198] 7000                      moveq.l    #0,d0
resize_1:
[0003a19a] b0aa 001c                 cmp.l      28(a2),d0
[0003a19e] 6c04                      bge.s      resize_2
[0003a1a0] 2540 001c                 move.l     d0,28(a2)
resize_2:
[0003a1a4] 7001                      moveq.l    #1,d0
[0003a1a6] d0aa 0028                 add.l      40(a2),d0
[0003a1aa] 90aa 000a                 sub.l      10(a2),d0
[0003a1ae] 4a80                      tst.l      d0
[0003a1b0] 6a02                      bpl.s      resize_3
[0003a1b2] 7000                      moveq.l    #0,d0
resize_3:
[0003a1b4] b0aa 0018                 cmp.l      24(a2),d0
[0003a1b8] 6c04                      bge.s      resize_4
[0003a1ba] 2540 0018                 move.l     d0,24(a2)
resize_4:
[0003a1be] 245f                      movea.l    (a7)+,a2
[0003a1c0] 4e75                      rts

edit_nextrange:
[0003a1c2] 2f0a                      move.l     a2,-(a7)
[0003a1c4] 2011                      move.l     (a1),d0
[0003a1c6] 6b50                      bmi.s      edit_nextrange_1
[0003a1c8] 7001                      moveq.l    #1,d0
[0003a1ca] d0a9 0008                 add.l      8(a1),d0
[0003a1ce] 6018                      bra.s      edit_nextrange_2
edit_nextrange_3:
[0003a1d0] 5280                      addq.l     #1,d0
[0003a1d2] b0a8 0028                 cmp.l      40(a0),d0
[0003a1d6] 6f10                      ble.s      edit_nextrange_2
[0003a1d8] 22bc ffff ffff            move.l     #$FFFFFFFF,(a1)
[0003a1de] 237c ffff ffff 0008       move.l     #$FFFFFFFF,8(a1)
[0003a1e6] 6030                      bra.s      edit_nextrange_1
edit_nextrange_2:
[0003a1e8] 7201                      moveq.l    #1,d1
[0003a1ea] 2400                      move.l     d0,d2
[0003a1ec] e78a                      lsl.l      #3,d2
[0003a1ee] 2468 002c                 movea.l    44(a0),a2
[0003a1f2] c272 2806                 and.w      6(a2,d2.l),d1
[0003a1f6] 67d8                      beq.s      edit_nextrange_3
[0003a1f8] 2280                      move.l     d0,(a1)
[0003a1fa] 6002                      bra.s      edit_nextrange_4
edit_nextrange_6:
[0003a1fc] 5280                      addq.l     #1,d0
edit_nextrange_4:
[0003a1fe] b0a8 0028                 cmp.l      40(a0),d0
[0003a202] 6c10                      bge.s      edit_nextrange_5
[0003a204] 7201                      moveq.l    #1,d1
[0003a206] 2400                      move.l     d0,d2
[0003a208] e78a                      lsl.l      #3,d2
[0003a20a] 2468 002c                 movea.l    44(a0),a2
[0003a20e] c272 280e                 and.w      14(a2,d2.l),d1
[0003a212] 66e8                      bne.s      edit_nextrange_6
edit_nextrange_5:
[0003a214] 2340 0008                 move.l     d0,8(a1)
edit_nextrange_1:
[0003a218] 245f                      movea.l    (a7)+,a2
[0003a21a] 4e75                      rts

edit_getrow:
[0003a21c] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003a220] 2648                      movea.l    a0,a3
[0003a222] 2449                      movea.l    a1,a2
[0003a224] 2011                      move.l     (a1),d0
[0003a226] 4a80                      tst.l      d0
[0003a228] 6b06                      bmi.s      edit_getrow_1
[0003a22a] b0ab 0028                 cmp.l      40(a3),d0
[0003a22e] 6f14                      ble.s      edit_getrow_2
edit_getrow_1:
[0003a230] 257c 000c f36c 0008       move.l     #$000CF36C,8(a2)
[0003a238] 257c ffff ffff 0004       move.l     #$FFFFFFFF,4(a2)
[0003a240] 6000 00bc                 bra        edit_getrow_3
edit_getrow_2:
[0003a244] 2200                      move.l     d0,d1
[0003a246] e789                      lsl.l      #3,d1
[0003a248] 286b 002c                 movea.l    44(a3),a4
[0003a24c] d9c1                      adda.l     d1,a4
[0003a24e] 2054                      movea.l    (a4),a0
[0003a250] 2408                      move.l     a0,d2
[0003a252] 6610                      bne.s      edit_getrow_4
[0003a254] 257c 000c f36c 0008       move.l     #$000CF36C,8(a2)
[0003a25c] 42aa 0004                 clr.l      4(a2)
[0003a260] 6000 009c                 bra        edit_getrow_3
edit_getrow_4:
[0003a264] 322b 0012                 move.w     18(a3),d1
[0003a268] c27c 0200                 and.w      #$0200,d1
[0003a26c] 6700 0082                 beq        edit_getrow_5
[0003a270] 342b 0070                 move.w     112(a3),d2
[0003a274] 6648                      bne.s      edit_getrow_6
[0003a276] b0ab 0030                 cmp.l      48(a3),d0
[0003a27a] 6630                      bne.s      edit_getrow_7
[0003a27c] 222b 0034                 move.l     52(a3),d1
[0003a280] 2054                      movea.l    (a4),a0
[0003a282] d1c1                      adda.l     d1,a0
[0003a284] 2548 0008                 move.l     a0,8(a2)
[0003a288] b0ab 0038                 cmp.l      56(a3),d0
[0003a28c] 660e                      bne.s      edit_getrow_8
[0003a28e] 222b 003c                 move.l     60(a3),d1
[0003a292] 92ab 0034                 sub.l      52(a3),d1
[0003a296] 2541 0004                 move.l     d1,4(a2)
[0003a29a] 6062                      bra.s      edit_getrow_3
edit_getrow_8:
[0003a29c] 322c 0004                 move.w     4(a4),d1
[0003a2a0] 48c1                      ext.l      d1
[0003a2a2] 92ab 0034                 sub.l      52(a3),d1
[0003a2a6] 2541 0004                 move.l     d1,4(a2)
[0003a2aa] 6052                      bra.s      edit_getrow_3
edit_getrow_7:
[0003a2ac] b0ab 0038                 cmp.l      56(a3),d0
[0003a2b0] 663e                      bne.s      edit_getrow_5
[0003a2b2] 2554 0008                 move.l     (a4),8(a2)
[0003a2b6] 256b 003c 0004            move.l     60(a3),4(a2)
[0003a2bc] 6040                      bra.s      edit_getrow_3
edit_getrow_6:
[0003a2be] 0c6b 0005 0070            cmpi.w     #$0005,112(a3)
[0003a2c4] 662a                      bne.s      edit_getrow_5
[0003a2c6] 202b 0044                 move.l     68(a3),d0
[0003a2ca] 90ab 0040                 sub.l      64(a3),d0
[0003a2ce] 2540 0004                 move.l     d0,4(a2)
[0003a2d2] 222b 0040                 move.l     64(a3),d1
[0003a2d6] 2f01                      move.l     d1,-(a7)
[0003a2d8] 322b 0046                 move.w     70(a3),d1
[0003a2dc] 302b 009a                 move.w     154(a3),d0
[0003a2e0] 2054                      movea.l    (a4),a0
[0003a2e2] 6100 d836                 bsr        untab
[0003a2e6] 201f                      move.l     (a7)+,d0
[0003a2e8] d1c0                      adda.l     d0,a0
[0003a2ea] 2548 0008                 move.l     a0,8(a2)
[0003a2ee] 600e                      bra.s      edit_getrow_3
edit_getrow_5:
[0003a2f0] 2554 0008                 move.l     (a4),8(a2)
[0003a2f4] 302c 0004                 move.w     4(a4),d0
[0003a2f8] 48c0                      ext.l      d0
[0003a2fa] 2540 0004                 move.l     d0,4(a2)
edit_getrow_3:
[0003a2fe] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003a302] 4e75                      rts

edit_unselect:
[0003a304] 2f0a                      move.l     a2,-(a7)
[0003a306] 2448                      movea.l    a0,a2
[0003a308] 0c6a 0004 0070            cmpi.w     #$0004,112(a2)
[0003a30e] 660e                      bne.s      edit_unselect_1
[0003a310] 4242                      clr.w      d2
[0003a312] 222a 0028                 move.l     40(a2),d1
[0003a316] 7000                      moveq.l    #0,d0
[0003a318] 6100 f354                 bsr        edit_selrange
[0003a31c] 6010                      bra.s      edit_unselect_2
edit_unselect_1:
[0003a31e] 4242                      clr.w      d2
[0003a320] 222a 0038                 move.l     56(a2),d1
[0003a324] 202a 0030                 move.l     48(a2),d0
[0003a328] 204a                      movea.l    a2,a0
[0003a32a] 6100 f342                 bsr        edit_selrange
edit_unselect_2:
[0003a32e] 302a 0012                 move.w     18(a2),d0
[0003a332] c07c 0200                 and.w      #$0200,d0
[0003a336] 6716                      beq.s      edit_unselect_3
[0003a338] 026a fdff 0012            andi.w     #$FDFF,18(a2)
[0003a33e] 303c 0080                 move.w     #$0080,d0
[0003a342] c06a 0012                 and.w      18(a2),d0
[0003a346] 6706                      beq.s      edit_unselect_3
[0003a348] 204a                      movea.l    a2,a0
[0003a34a] 6100 ec8e                 bsr        change_cur
edit_unselect_3:
[0003a34e] 245f                      movea.l    (a7)+,a2
[0003a350] 4e75                      rts

edit_setselect:
[0003a352] 2f0a                      move.l     a2,-(a7)
[0003a354] 2f0b                      move.l     a3,-(a7)
[0003a356] 2448                      movea.l    a0,a2
[0003a358] 2649                      movea.l    a1,a3
[0003a35a] 302a 0012                 move.w     18(a2),d0
[0003a35e] c07c 0200                 and.w      #$0200,d0
[0003a362] 673e                      beq.s      edit_setselect_1
[0003a364] 0c6a 0004 0070            cmpi.w     #$0004,112(a2)
[0003a36a] 6736                      beq.s      edit_setselect_1
[0003a36c] 222a 0030                 move.l     48(a2),d1
[0003a370] b291                      cmp.l      (a1),d1
[0003a372] 661e                      bne.s      edit_setselect_2
[0003a374] 242a 0034                 move.l     52(a2),d2
[0003a378] b4ab 0004                 cmp.l      4(a3),d2
[0003a37c] 6614                      bne.s      edit_setselect_2
[0003a37e] 202a 0038                 move.l     56(a2),d0
[0003a382] b0ab 0008                 cmp.l      8(a3),d0
[0003a386] 660a                      bne.s      edit_setselect_2
[0003a388] 222a 003c                 move.l     60(a2),d1
[0003a38c] b2ab 000c                 cmp.l      12(a3),d1
[0003a390] 677c                      beq.s      edit_setselect_3
edit_setselect_2:
[0003a392] 4242                      clr.w      d2
[0003a394] 222a 0038                 move.l     56(a2),d1
[0003a398] 202a 0030                 move.l     48(a2),d0
[0003a39c] 204a                      movea.l    a2,a0
[0003a39e] 6100 f2ce                 bsr        edit_selrange
edit_setselect_1:
[0003a3a2] 2553 0030                 move.l     (a3),48(a2)
[0003a3a6] 256b 0004 0034            move.l     4(a3),52(a2)
[0003a3ac] 322a 0036                 move.w     54(a2),d1
[0003a3b0] 302a 009a                 move.w     154(a2),d0
[0003a3b4] 242a 0030                 move.l     48(a2),d2
[0003a3b8] e78a                      lsl.l      #3,d2
[0003a3ba] 206a 002c                 movea.l    44(a2),a0
[0003a3be] 2070 2800                 movea.l    0(a0,d2.l),a0
[0003a3c2] 6100 d7fe                 bsr        vpos
[0003a3c6] 48c0                      ext.l      d0
[0003a3c8] 2540 0040                 move.l     d0,64(a2)
[0003a3cc] 256b 0008 0038            move.l     8(a3),56(a2)
[0003a3d2] 256b 000c 003c            move.l     12(a3),60(a2)
[0003a3d8] 322a 003e                 move.w     62(a2),d1
[0003a3dc] 302a 009a                 move.w     154(a2),d0
[0003a3e0] 242a 0038                 move.l     56(a2),d2
[0003a3e4] e78a                      lsl.l      #3,d2
[0003a3e6] 206a 002c                 movea.l    44(a2),a0
[0003a3ea] 2070 2800                 movea.l    0(a0,d2.l),a0
[0003a3ee] 6100 d7d2                 bsr        vpos
[0003a3f2] 48c0                      ext.l      d0
[0003a3f4] 2540 0044                 move.l     d0,68(a2)
[0003a3f8] 006a 0200 0012            ori.w      #$0200,18(a2)
[0003a3fe] 7401                      moveq.l    #1,d2
[0003a400] 222a 0038                 move.l     56(a2),d1
[0003a404] 202a 0030                 move.l     48(a2),d0
[0003a408] 204a                      movea.l    a2,a0
[0003a40a] 6100 f262                 bsr        edit_selrange
edit_setselect_3:
[0003a40e] 265f                      movea.l    (a7)+,a3
[0003a410] 245f                      movea.l    (a7)+,a2
[0003a412] 4e75                      rts

edit_find:
[0003a414] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[0003a418] 4fef ffdc                 lea.l      -36(a7),a7
[0003a41c] 2648                      movea.l    a0,a3
[0003a41e] 2449                      movea.l    a1,a2
[0003a420] 1011                      move.b     (a1),d0
[0003a422] 6700 027c                 beq        edit_find_1
[0003a426] 206b 0058                 movea.l    88(a3),a0
[0003a42a] 2f68 000c 0020            move.l     12(a0),32(a7)
[0003a430] 43f9 000c f36c            lea.l      $000CF36C,a1
[0003a436] 286f 0020                 movea.l    32(a7),a4
[0003a43a] 286c 0008                 movea.l    8(a4),a4
[0003a43e] 303c 0104                 move.w     #$0104,d0
[0003a442] 4e94                      jsr        (a4)
[0003a444] 302b 0012                 move.w     18(a3),d0
[0003a448] c07c 0400                 and.w      #$0400,d0
[0003a44c] 6604                      bne.s      edit_find_2
[0003a44e] 7201                      moveq.l    #1,d1
[0003a450] 6002                      bra.s      edit_find_3
edit_find_2:
[0003a452] 4241                      clr.w      d1
edit_find_3:
[0003a454] 3f41 0002                 move.w     d1,2(a7)
[0003a458] 302b 0012                 move.w     18(a3),d0
[0003a45c] c07c 0800                 and.w      #$0800,d0
[0003a460] 6604                      bne.s      edit_find_4
[0003a462] 7401                      moveq.l    #1,d2
[0003a464] 6002                      bra.s      edit_find_5
edit_find_4:
[0003a466] 4242                      clr.w      d2
edit_find_5:
[0003a468] 3e82                      move.w     d2,(a7)
[0003a46a] 1a12                      move.b     (a2),d5
[0003a46c] 1c05                      move.b     d5,d6
[0003a46e] 4a42                      tst.w      d2
[0003a470] 6622                      bne.s      edit_find_6
[0003a472] ba3c 0061                 cmp.b      #$61,d5
[0003a476] 6d0c                      blt.s      edit_find_7
[0003a478] ba3c 007a                 cmp.b      #$7A,d5
[0003a47c] 6e06                      bgt.s      edit_find_7
[0003a47e] dc3c ffe0                 add.b      #$E0,d6
[0003a482] 6010                      bra.s      edit_find_6
edit_find_7:
[0003a484] ba3c 0041                 cmp.b      #$41,d5
[0003a488] 6d0a                      blt.s      edit_find_6
[0003a48a] ba3c 005a                 cmp.b      #$5A,d5
[0003a48e] 6e04                      bgt.s      edit_find_6
[0003a490] dc3c 0020                 add.b      #$20,d6
edit_find_6:
[0003a494] 204a                      movea.l    a2,a0
[0003a496] 4eb9 0008 2f6c            jsr        strlen
[0003a49c] 2e00                      move.l     d0,d7
[0003a49e] 262b 0030                 move.l     48(a3),d3
[0003a4a2] 2f6b 0034 0008            move.l     52(a3),8(a7)
[0003a4a8] 4bef 000c                 lea.l      12(a7),a5
[0003a4ac] 302b 0012                 move.w     18(a3),d0
[0003a4b0] c07c 1000                 and.w      #$1000,d0
[0003a4b4] 6700 00d6                 beq        edit_find_8
[0003a4b8] 6000 00c8                 bra        edit_find_9
edit_find_21:
[0003a4bc] 2003                      move.l     d3,d0
[0003a4be] e788                      lsl.l      #3,d0
[0003a4c0] 206b 002c                 movea.l    44(a3),a0
[0003a4c4] d1c0                      adda.l     d0,a0
[0003a4c6] 2f48 001c                 move.l     a0,28(a7)
[0003a4ca] 3228 0004                 move.w     4(a0),d1
[0003a4ce] 6f00 00a8                 ble        edit_find_10
[0003a4d2] 242f 0008                 move.l     8(a7),d2
[0003a4d6] 6b06                      bmi.s      edit_find_11
[0003a4d8] 78ff                      moveq.l    #-1,d4
[0003a4da] d882                      add.l      d2,d4
[0003a4dc] 600c                      bra.s      edit_find_12
edit_find_11:
[0003a4de] 206f 001c                 movea.l    28(a7),a0
[0003a4e2] 3828 0004                 move.w     4(a0),d4
[0003a4e6] 48c4                      ext.l      d4
[0003a4e8] 9887                      sub.l      d7,d4
edit_find_12:
[0003a4ea] 206f 001c                 movea.l    28(a7),a0
[0003a4ee] 2850                      movea.l    (a0),a4
[0003a4f0] d9c4                      adda.l     d4,a4
[0003a4f2] 6000 007e                 bra.w      edit_find_13
edit_find_20:
[0003a4f6] ba14                      cmp.b      (a4),d5
[0003a4f8] 6704                      beq.s      edit_find_14
[0003a4fa] bc14                      cmp.b      (a4),d6
[0003a4fc] 6670                      bne.s      edit_find_15
edit_find_14:
[0003a4fe] 3017                      move.w     (a7),d0
[0003a500] 6710                      beq.s      edit_find_16
[0003a502] 224c                      movea.l    a4,a1
[0003a504] 204a                      movea.l    a2,a0
[0003a506] 2007                      move.l     d7,d0
[0003a508] 4eb9 0008 2fb8            jsr        strncmp
[0003a50e] 4a40                      tst.w      d0
[0003a510] 6710                      beq.s      edit_find_17
edit_find_16:
[0003a512] 2007                      move.l     d7,d0
[0003a514] 224c                      movea.l    a4,a1
[0003a516] 204a                      movea.l    a2,a0
[0003a518] 4eb9 0008 3266            jsr        strnicmp
[0003a51e] 4a40                      tst.w      d0
[0003a520] 664c                      bne.s      edit_find_15
edit_find_17:
[0003a522] 302f 0002                 move.w     2(a7),d0
[0003a526] 6600 010a                 bne        edit_find_18
[0003a52a] 4a84                      tst.l      d4
[0003a52c] 6616                      bne.s      edit_find_19
[0003a52e] 1034 7800                 move.b     0(a4,d7.l),d0
[0003a532] 4880                      ext.w      d0
[0003a534] 41eb 00a0                 lea.l      160(a3),a0
[0003a538] 4eb9 0008 2e8a            jsr        strchr
[0003a53e] 2008                      move.l     a0,d0
[0003a540] 6600 00f0                 bne        edit_find_18
edit_find_19:
[0003a544] 102c ffff                 move.b     -1(a4),d0
[0003a548] 4880                      ext.w      d0
[0003a54a] 41eb 00a0                 lea.l      160(a3),a0
[0003a54e] 4eb9 0008 2e8a            jsr        strchr
[0003a554] 2008                      move.l     a0,d0
[0003a556] 6716                      beq.s      edit_find_15
[0003a558] 1034 7800                 move.b     0(a4,d7.l),d0
[0003a55c] 4880                      ext.w      d0
[0003a55e] 41eb 00a0                 lea.l      160(a3),a0
[0003a562] 4eb9 0008 2e8a            jsr        strchr
[0003a568] 2008                      move.l     a0,d0
[0003a56a] 6600 00c6                 bne        edit_find_18
edit_find_15:
[0003a56e] 534c                      subq.w     #1,a4
[0003a570] 5384                      subq.l     #1,d4
edit_find_13:
[0003a572] 4a84                      tst.l      d4
[0003a574] 6a00 ff80                 bpl.w      edit_find_20
edit_find_10:
[0003a578] 2f7c ffff ffff 0008       move.l     #$FFFFFFFF,8(a7)
[0003a580] 5383                      subq.l     #1,d3
edit_find_9:
[0003a582] 4a83                      tst.l      d3
[0003a584] 6a00 ff36                 bpl        edit_find_21
[0003a588] 6000 00dc                 bra        edit_find_22
edit_find_8:
[0003a58c] 2f6b 0028 0004            move.l     40(a3),4(a7)
[0003a592] 52af 0008                 addq.l     #1,8(a7)
[0003a596] 6000 00c6                 bra        edit_find_23
edit_find_32:
[0003a59a] 2003                      move.l     d3,d0
[0003a59c] e788                      lsl.l      #3,d0
[0003a59e] 206b 002c                 movea.l    44(a3),a0
[0003a5a2] d1c0                      adda.l     d0,a0
[0003a5a4] 2f48 001c                 move.l     a0,28(a7)
[0003a5a8] 3228 0004                 move.w     4(a0),d1
[0003a5ac] 6f00 00aa                 ble        edit_find_24
[0003a5b0] 242f 0008                 move.l     8(a7),d2
[0003a5b4] 2850                      movea.l    (a0),a4
[0003a5b6] d9c2                      adda.l     d2,a4
[0003a5b8] 2802                      move.l     d2,d4
[0003a5ba] 6000 0096                 bra        edit_find_25
edit_find_31:
[0003a5be] ba14                      cmp.b      (a4),d5
[0003a5c0] 6706                      beq.s      edit_find_26
[0003a5c2] bc14                      cmp.b      (a4),d6
[0003a5c4] 6600 0088                 bne        edit_find_27
edit_find_26:
[0003a5c8] 3017                      move.w     (a7),d0
[0003a5ca] 6710                      beq.s      edit_find_28
[0003a5cc] 224c                      movea.l    a4,a1
[0003a5ce] 204a                      movea.l    a2,a0
[0003a5d0] 2007                      move.l     d7,d0
[0003a5d2] 4eb9 0008 2fb8            jsr        strncmp
[0003a5d8] 4a40                      tst.w      d0
[0003a5da] 6710                      beq.s      edit_find_29
edit_find_28:
[0003a5dc] 2007                      move.l     d7,d0
[0003a5de] 224c                      movea.l    a4,a1
[0003a5e0] 204a                      movea.l    a2,a0
[0003a5e2] 4eb9 0008 3266            jsr        strnicmp
[0003a5e8] 4a40                      tst.w      d0
[0003a5ea] 6662                      bne.s      edit_find_27
edit_find_29:
[0003a5ec] 302f 0002                 move.w     2(a7),d0
[0003a5f0] 6640                      bne.s      edit_find_18
[0003a5f2] 4a84                      tst.l      d4
[0003a5f4] 6614                      bne.s      edit_find_30
[0003a5f6] 1034 7800                 move.b     0(a4,d7.l),d0
[0003a5fa] 4880                      ext.w      d0
[0003a5fc] 41eb 00a0                 lea.l      160(a3),a0
[0003a600] 4eb9 0008 2e8a            jsr        strchr
[0003a606] 2008                      move.l     a0,d0
[0003a608] 6628                      bne.s      edit_find_18
edit_find_30:
[0003a60a] 102c ffff                 move.b     -1(a4),d0
[0003a60e] 4880                      ext.w      d0
[0003a610] 41eb 00a0                 lea.l      160(a3),a0
[0003a614] 4eb9 0008 2e8a            jsr        strchr
[0003a61a] 2008                      move.l     a0,d0
[0003a61c] 6730                      beq.s      edit_find_27
[0003a61e] 1034 7800                 move.b     0(a4,d7.l),d0
[0003a622] 4880                      ext.w      d0
[0003a624] 41eb 00a0                 lea.l      160(a3),a0
[0003a628] 4eb9 0008 2e8a            jsr        strchr
[0003a62e] 2008                      move.l     a0,d0
[0003a630] 671c                      beq.s      edit_find_27
edit_find_18:
[0003a632] 2a83                      move.l     d3,(a5)
[0003a634] 2b43 0008                 move.l     d3,8(a5)
[0003a638] 2b44 0004                 move.l     d4,4(a5)
[0003a63c] 2004                      move.l     d4,d0
[0003a63e] d087                      add.l      d7,d0
[0003a640] 2b40 000c                 move.l     d0,12(a5)
[0003a644] 224d                      movea.l    a5,a1
[0003a646] 204b                      movea.l    a3,a0
[0003a648] 6100 fd08                 bsr        edit_setselect
[0003a64c] 6052                      bra.s      edit_find_1
edit_find_27:
[0003a64e] 524c                      addq.w     #1,a4
[0003a650] 5284                      addq.l     #1,d4
edit_find_25:
[0003a652] 1014                      move.b     (a4),d0
[0003a654] 6600 ff68                 bne        edit_find_31
edit_find_24:
[0003a658] 42af 0008                 clr.l      8(a7)
[0003a65c] 5283                      addq.l     #1,d3
edit_find_23:
[0003a65e] b6af 0004                 cmp.l      4(a7),d3
[0003a662] 6f00 ff36                 ble        edit_find_32
edit_find_22:
[0003a666] 7004                      moveq.l    #4,d0
[0003a668] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003a66e] 2268 023c                 movea.l    572(a0),a1
[0003a672] c069 000e                 and.w      14(a1),d0
[0003a676] 670a                      beq.s      edit_find_33
[0003a678] 7207                      moveq.l    #7,d1
[0003a67a] 7002                      moveq.l    #2,d0
[0003a67c] 4eb9 0008 0b1a            jsr        Bconout
edit_find_33:
[0003a682] 43f9 000c f36d            lea.l      $000CF36D,a1
[0003a688] 303c 0104                 move.w     #$0104,d0
[0003a68c] 206b 0058                 movea.l    88(a3),a0
[0003a690] 246f 0020                 movea.l    32(a7),a2
[0003a694] 246a 0008                 movea.l    8(a2),a2
[0003a698] 4e92                      jsr        (a2)
[0003a69a] 0a6b 1000 0012            eori.w     #$1000,18(a3)
edit_find_1:
[0003a6a0] 4fef 0024                 lea.l      36(a7),a7
[0003a6a4] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[0003a6a8] 4e75                      rts

edit_getneed:
[0003a6aa] 2f0a                      move.l     a2,-(a7)
[0003a6ac] 2468 002c                 movea.l    44(a0),a2
[0003a6b0] 2028 0028                 move.l     40(a0),d0
[0003a6b4] 72fe                      moveq.l    #-2,d1
[0003a6b6] 600c                      bra.s      edit_getneed_1
edit_getneed_2:
[0003a6b8] 7402                      moveq.l    #2,d2
[0003a6ba] d46a 0004                 add.w      4(a2),d2
[0003a6be] 48c2                      ext.l      d2
[0003a6c0] d282                      add.l      d2,d1
[0003a6c2] 504a                      addq.w     #8,a2
edit_getneed_1:
[0003a6c4] 2400                      move.l     d0,d2
[0003a6c6] 5380                      subq.l     #1,d0
[0003a6c8] 4a82                      tst.l      d2
[0003a6ca] 6aec                      bpl.s      edit_getneed_2
[0003a6cc] 2281                      move.l     d1,(a1)
[0003a6ce] 245f                      movea.l    (a7)+,a2
[0003a6d0] 4e75                      rts

edit_selectword:
[0003a6d2] 48e7 1e30                 movem.l    d3-d6/a2-a3,-(a7)
[0003a6d6] 4fef fff0                 lea.l      -16(a7),a7
[0003a6da] 2448                      movea.l    a0,a2
[0003a6dc] 2600                      move.l     d0,d3
[0003a6de] e788                      lsl.l      #3,d0
[0003a6e0] 206a 002c                 movea.l    44(a2),a0
[0003a6e4] d1c0                      adda.l     d0,a0
[0003a6e6] 3828 0004                 move.w     4(a0),d4
[0003a6ea] 2650                      movea.l    (a0),a3
[0003a6ec] 3a01                      move.w     d1,d5
[0003a6ee] 3c05                      move.w     d5,d6
[0003a6f0] 6002                      bra.s      edit_selectword_1
edit_selectword_3:
[0003a6f2] 5346                      subq.w     #1,d6
edit_selectword_1:
[0003a6f4] 4a46                      tst.w      d6
[0003a6f6] 6f18                      ble.s      edit_selectword_2
[0003a6f8] 1033 60ff                 move.b     -1(a3,d6.w),d0
[0003a6fc] 4880                      ext.w      d0
[0003a6fe] 41ea 00a0                 lea.l      160(a2),a0
[0003a702] 4eb9 0008 2e8a            jsr        strchr
[0003a708] 2008                      move.l     a0,d0
[0003a70a] 67e6                      beq.s      edit_selectword_3
[0003a70c] 6002                      bra.s      edit_selectword_2
edit_selectword_5:
[0003a70e] 5245                      addq.w     #1,d5
edit_selectword_2:
[0003a710] b845                      cmp.w      d5,d4
[0003a712] 6f14                      ble.s      edit_selectword_4
[0003a714] 1033 5000                 move.b     0(a3,d5.w),d0
[0003a718] 4880                      ext.w      d0
[0003a71a] 41ea 00a0                 lea.l      160(a2),a0
[0003a71e] 4eb9 0008 2e8a            jsr        strchr
[0003a724] 2008                      move.l     a0,d0
[0003a726] 67e6                      beq.s      edit_selectword_5
edit_selectword_4:
[0003a728] ba46                      cmp.w      d6,d5
[0003a72a] 6f20                      ble.s      edit_selectword_6
[0003a72c] 2f43 0008                 move.l     d3,8(a7)
[0003a730] 2e83                      move.l     d3,(a7)
[0003a732] 3006                      move.w     d6,d0
[0003a734] 48c0                      ext.l      d0
[0003a736] 2f40 0004                 move.l     d0,4(a7)
[0003a73a] 3205                      move.w     d5,d1
[0003a73c] 48c1                      ext.l      d1
[0003a73e] 2f41 000c                 move.l     d1,12(a7)
[0003a742] 43d7                      lea.l      (a7),a1
[0003a744] 204a                      movea.l    a2,a0
[0003a746] 6100 fc0a                 bsr        edit_setselect
[0003a74a] 601c                      bra.s      edit_selectword_7
edit_selectword_6:
[0003a74c] 7004                      moveq.l    #4,d0
[0003a74e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003a754] 2268 023c                 movea.l    572(a0),a1
[0003a758] c069 000e                 and.w      14(a1),d0
[0003a75c] 670a                      beq.s      edit_selectword_7
[0003a75e] 7207                      moveq.l    #7,d1
[0003a760] 7002                      moveq.l    #2,d0
[0003a762] 4eb9 0008 0b1a            jsr        Bconout
edit_selectword_7:
[0003a768] 4fef 0010                 lea.l      16(a7),a7
[0003a76c] 4cdf 0c78                 movem.l    (a7)+,d3-d6/a2-a3
[0003a770] 4e75                      rts

Auo_editor:
[0003a772] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003a776] 4fef ffe2                 lea.l      -30(a7),a7
[0003a77a] 2f48 001a                 move.l     a0,26(a7)
[0003a77e] 2849                      movea.l    a1,a4
[0003a780] 2068 000c                 movea.l    12(a0),a0
[0003a784] 2668 000c                 movea.l    12(a0),a3
[0003a788] 3200                      move.w     d0,d1
[0003a78a] b27c 0107                 cmp.w      #$0107,d1
[0003a78e] 6200 08a6                 bhi        Auo_editor_1
[0003a792] d241                      add.w      d1,d1
[0003a794] 323b 1006                 move.w     $0003A79C(pc,d1.w),d1
[0003a798] 4efb 1002                 jmp        $0003A79C(pc,d1.w)
J26:
[0003a79c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a79e] 057e                      dc.w $057e   ; Auo_editor_2-J26
[0003a7a0] 0596                      dc.w $0596   ; Auo_editor_3-J26
[0003a7a2] 05e4                      dc.w $05e4   ; Auo_editor_4-J26
[0003a7a4] 05a8                      dc.w $05a8   ; Auo_editor_5-J26
[0003a7a6] 06b4                      dc.w $06b4   ; Auo_editor_6-J26
[0003a7a8] 06ae                      dc.w $06ae   ; Auo_editor_7-J26
[0003a7aa] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7ac] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7ae] 04b0                      dc.w $04b0   ; Auo_editor_8-J26
[0003a7b0] 06c8                      dc.w $06c8   ; Auo_editor_9-J26
[0003a7b2] 06ce                      dc.w $06ce   ; Auo_editor_10-J26
[0003a7b4] 06d4                      dc.w $06d4   ; Auo_editor_11-J26
[0003a7b6] 06de                      dc.w $06de   ; Auo_editor_12-J26
[0003a7b8] 06ee                      dc.w $06ee   ; Auo_editor_13-J26
[0003a7ba] 06f6                      dc.w $06f6   ; Auo_editor_14-J26
[0003a7bc] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7be] 0700                      dc.w $0700   ; Auo_editor_15-J26
[0003a7c0] 04c6                      dc.w $04c6   ; Auo_editor_16-J26
[0003a7c2] 089e                      dc.w $089e   ; Auo_editor_17-J26
[0003a7c4] 089e                      dc.w $089e   ; Auo_editor_17-J26
[0003a7c6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7c8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7ca] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7cc] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7ce] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7d0] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7d2] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7d4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7d6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7d8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7da] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7dc] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7de] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7e0] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7e2] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7e4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7e6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7e8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7ea] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7ec] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7ee] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7f0] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7f2] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7f4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7f6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7f8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7fa] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7fc] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a7fe] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a800] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a802] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a804] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a806] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a808] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a80a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a80c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a80e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a810] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a812] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a814] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a816] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a818] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a81a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a81c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a81e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a820] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a822] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a824] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a826] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a828] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a82a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a82c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a82e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a830] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a832] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a834] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a836] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a838] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a83a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a83c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a83e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a840] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a842] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a844] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a846] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a848] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a84a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a84c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a84e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a850] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a852] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a854] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a856] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a858] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a85a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a85c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a85e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a860] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a862] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a864] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a866] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a868] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a86a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a86c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a86e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a870] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a872] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a874] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a876] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a878] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a87a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a87c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a87e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a880] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a882] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a884] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a886] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a888] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a88a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a88c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a88e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a890] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a892] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a894] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a896] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a898] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a89a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a89c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a89e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8a0] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8a2] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8a4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8a6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8a8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8aa] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8ac] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8ae] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8b0] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8b2] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8b4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8b6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8b8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8ba] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8bc] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8be] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8c0] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8c2] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8c4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8c6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8c8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8ca] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8cc] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8ce] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8d0] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8d2] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8d4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8d6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8d8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8da] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8dc] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8de] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8e0] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8e2] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8e4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8e6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8e8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8ea] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8ec] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8ee] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8f0] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8f2] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8f4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8f6] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8f8] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8fa] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8fc] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a8fe] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a900] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a902] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a904] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a906] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a908] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a90a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a90c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a90e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a910] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a912] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a914] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a916] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a918] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a91a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a91c] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a91e] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a920] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a922] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a924] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a926] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a928] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a92a] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a92c] 078c                      dc.w $078c   ; Auo_editor_18-J26
[0003a92e] 07e4                      dc.w $07e4   ; Auo_editor_19-J26
[0003a930] 02f6                      dc.w $02f6   ; Auo_editor_20-J26
[0003a932] 0780                      dc.w $0780   ; Auo_editor_21-J26
[0003a934] 0676                      dc.w $0676   ; Auo_editor_22-J26
[0003a936] 0684                      dc.w $0684   ; Auo_editor_23-J26
[0003a938] 069c                      dc.w $069c   ; Auo_editor_24-J26
[0003a93a] 060a                      dc.w $060a   ; Auo_editor_25-J26
[0003a93c] 0622                      dc.w $0622   ; Auo_editor_26-J26
[0003a93e] 064e                      dc.w $064e   ; Auo_editor_27-J26
[0003a940] 0654                      dc.w $0654   ; Auo_editor_28-J26
[0003a942] 04e6                      dc.w $04e6   ; Auo_editor_29-J26
[0003a944] 04f6                      dc.w $04f6   ; Auo_editor_30-J26
[0003a946] 0500                      dc.w $0500   ; Auo_editor_31-J26
[0003a948] 051e                      dc.w $051e   ; Auo_editor_32-J26
[0003a94a] 0544                      dc.w $0544   ; Auo_editor_33-J26
[0003a94c] 0576                      dc.w $0576   ; Auo_editor_34-J26
[0003a94e] 071c                      dc.w $071c   ; Auo_editor_35-J26
[0003a950] 074a                      dc.w $074a   ; Auo_editor_36-J26
[0003a952] 04dc                      dc.w $04dc   ; Auo_editor_37-J26
[0003a954] 0476                      dc.w $0476   ; Auo_editor_38-J26
[0003a956] 0480                      dc.w $0480   ; Auo_editor_39-J26
[0003a958] 048a                      dc.w $048a   ; Auo_editor_40-J26
[0003a95a] 0494                      dc.w $0494   ; Auo_editor_41-J26
[0003a95c] 049e                      dc.w $049e   ; Auo_editor_42-J26
[0003a95e] 04a6                      dc.w $04a6   ; Auo_editor_43-J26
[0003a960] 03c0                      dc.w $03c0   ; Auo_editor_44-J26
[0003a962] 03ca                      dc.w $03ca   ; Auo_editor_45-J26
[0003a964] 040c                      dc.w $040c   ; Auo_editor_46-J26
[0003a966] 0418                      dc.w $0418   ; Auo_editor_47-J26
[0003a968] 0426                      dc.w $0426   ; Auo_editor_48-J26
[0003a96a] 0398                      dc.w $0398   ; Auo_editor_49-J26
[0003a96c] 036a                      dc.w $036a   ; Auo_editor_50-J26
[0003a96e] 035e                      dc.w $035e   ; Auo_editor_51-J26
[0003a970] 0352                      dc.w $0352   ; Auo_editor_52-J26
[0003a972] 02ec                      dc.w $02ec   ; Auo_editor_53-J26
[0003a974] 030a                      dc.w $030a   ; Auo_editor_54-J26
[0003a976] 02d4                      dc.w $02d4   ; Auo_editor_55-J26
[0003a978] 02b8                      dc.w $02b8   ; Auo_editor_56-J26
[0003a97a] 06be                      dc.w $06be   ; Auo_editor_57-J26
[0003a97c] 0302                      dc.w $0302   ; Auo_editor_58-J26
[0003a97e] 02a8                      dc.w $02a8   ; Auo_editor_59-J26
[0003a980] 0260                      dc.w $0260   ; Auo_editor_60-J26
[0003a982] 0280                      dc.w $0280   ; Auo_editor_61-J26
[0003a984] 028a                      dc.w $028a   ; Auo_editor_62-J26
[0003a986] 029e                      dc.w $029e   ; Auo_editor_63-J26
[0003a988] 0294                      dc.w $0294   ; Auo_editor_64-J26
[0003a98a] 026c                      dc.w $026c   ; Auo_editor_65-J26
[0003a98c] 0276                      dc.w $0276   ; Auo_editor_66-J26
[0003a98e] 0246                      dc.w $0246   ; Auo_editor_67-J26
[0003a990] 0250                      dc.w $0250   ; Auo_editor_68-J26
[0003a992] 023a                      dc.w $023a   ; Auo_editor_69-J26
[0003a994] 0228                      dc.w $0228   ; Auo_editor_70-J26
[0003a996] 0870                      dc.w $0870   ; Auo_editor_71-J26
[0003a998] 0220                      dc.w $0220   ; Auo_editor_72-J26
[0003a99a] 0380                      dc.w $0380   ; Auo_editor_73-J26
[0003a99c] 0742                      dc.w $0742   ; Auo_editor_74-J26
[0003a99e] 0778                      dc.w $0778   ; Auo_editor_75-J26
[0003a9a0] 0210                      dc.w $0210   ; Auo_editor_76-J26
[0003a9a2] 0218                      dc.w $0218   ; Auo_editor_77-J26
[0003a9a4] 089a                      dc.w $089a   ; Auo_editor_1-J26
[0003a9a6] 087c                      dc.w $087c   ; Auo_editor_78-J26
[0003a9a8] 0884                      dc.w $0884   ; Auo_editor_79-J26
[0003a9aa] 0892                      dc.w $0892   ; Auo_editor_80-J26
Auo_editor_76:
[0003a9ac] 38ab 009e                 move.w     158(a3),(a4)
[0003a9b0] 6000 0688                 bra        Auo_editor_17
Auo_editor_77:
[0003a9b4] 426b 009e                 clr.w      158(a3)
[0003a9b8] 6000 0680                 bra        Auo_editor_17
Auo_editor_72:
[0003a9bc] 3754 009c                 move.w     (a4),156(a3)
[0003a9c0] 6000 0678                 bra        Auo_editor_17
Auo_editor_70:
[0003a9c4] 222b 0034                 move.l     52(a3),d1
[0003a9c8] 202b 0030                 move.l     48(a3),d0
[0003a9cc] 204b                      movea.l    a3,a0
[0003a9ce] 6100 fd02                 bsr        edit_selectword
[0003a9d2] 6000 0666                 bra        Auo_editor_17
Auo_editor_69:
[0003a9d6] 224c                      movea.l    a4,a1
[0003a9d8] 204b                      movea.l    a3,a0
[0003a9da] 6100 fcce                 bsr        edit_getneed
[0003a9de] 6000 065a                 bra        Auo_editor_17
Auo_editor_67:
[0003a9e2] 026b dfff 0012            andi.w     #$DFFF,18(a3)
[0003a9e8] 6000 0650                 bra        Auo_editor_17
Auo_editor_68:
[0003a9ec] 302b 0012                 move.w     18(a3),d0
[0003a9f0] c07c 2000                 and.w      #$2000,d0
[0003a9f4] 6656                      bne.s      Auo_editor_81
Auo_editor_82:
[0003a9f6] 4254                      clr.w      (a4)
[0003a9f8] 6000 0640                 bra        Auo_editor_17
Auo_editor_60:
[0003a9fc] 224c                      movea.l    a4,a1
[0003a9fe] 204b                      movea.l    a3,a0
[0003aa00] 6100 fa12                 bsr        edit_find
[0003aa04] 6000 0634                 bra        Auo_editor_17
Auo_editor_65:
[0003aa08] 006b 0400 0012            ori.w      #$0400,18(a3)
[0003aa0e] 6000 062a                 bra        Auo_editor_17
Auo_editor_66:
[0003aa12] 026b fbff 0012            andi.w     #$FBFF,18(a3)
[0003aa18] 6000 0620                 bra        Auo_editor_17
Auo_editor_61:
[0003aa1c] 006b 1000 0012            ori.w      #$1000,18(a3)
[0003aa22] 6000 0616                 bra        Auo_editor_17
Auo_editor_62:
[0003aa26] 026b efff 0012            andi.w     #$EFFF,18(a3)
[0003aa2c] 6000 060c                 bra        Auo_editor_17
Auo_editor_64:
[0003aa30] 006b 0800 0012            ori.w      #$0800,18(a3)
[0003aa36] 6000 0602                 bra        Auo_editor_17
Auo_editor_63:
[0003aa3a] 026b f7ff 0012            andi.w     #$F7FF,18(a3)
[0003aa40] 6000 05f8                 bra        Auo_editor_17
Auo_editor_59:
[0003aa44] 0c6b 0005 0070            cmpi.w     #$0005,112(a3)
[0003aa4a] 66aa                      bne.s      Auo_editor_82
Auo_editor_81:
[0003aa4c] 38bc 0001                 move.w     #$0001,(a4)
[0003aa50] 6000 05e8                 bra        Auo_editor_17
Auo_editor_56:
[0003aa54] 206f 001a                 movea.l    26(a7),a0
[0003aa58] 6100 f6d6                 bsr        resize
[0003aa5c] 206f 001a                 movea.l    26(a7),a0
[0003aa60] 316b 004a 0014            move.w     74(a3),20(a0)
[0003aa66] 316b 0048 0016            move.w     72(a3),22(a0)
[0003aa6c] 6000 05cc                 bra        Auo_editor_17
Auo_editor_55:
[0003aa70] 202b 0092                 move.l     146(a3),d0
[0003aa74] 206b 0096                 movea.l    150(a3),a0
[0003aa78] 6100 d8ba                 bsr        edit_freeundo
[0003aa7c] 42ab 0096                 clr.l      150(a3)
[0003aa80] 42ab 0092                 clr.l      146(a3)
[0003aa84] 6000 05b4                 bra        Auo_editor_17
Auo_editor_53:
[0003aa88] 204b                      movea.l    a3,a0
[0003aa8a] 6100 e1dc                 bsr        edit_undo
[0003aa8e] 6000 05aa                 bra        Auo_editor_17
Auo_editor_20:
[0003aa92] 224c                      movea.l    a4,a1
[0003aa94] 204b                      movea.l    a3,a0
[0003aa96] 6100 f784                 bsr        edit_getrow
[0003aa9a] 6000 059e                 bra        Auo_editor_17
Auo_editor_58:
[0003aa9e] 38ab 009a                 move.w     154(a3),(a4)
[0003aaa2] 6000 0596                 bra        Auo_editor_17
Auo_editor_54:
[0003aaa6] 3754 009a                 move.w     (a4),154(a3)
[0003aaaa] 322b 0036                 move.w     54(a3),d1
[0003aaae] 302b 009a                 move.w     154(a3),d0
[0003aab2] 242b 0030                 move.l     48(a3),d2
[0003aab6] e78a                      lsl.l      #3,d2
[0003aab8] 206b 002c                 movea.l    44(a3),a0
[0003aabc] 2070 2800                 movea.l    0(a0,d2.l),a0
[0003aac0] 6100 d100                 bsr        vpos
[0003aac4] 48c0                      ext.l      d0
[0003aac6] 2740 0040                 move.l     d0,64(a3)
[0003aaca] 322b 003e                 move.w     62(a3),d1
[0003aace] 302b 009a                 move.w     154(a3),d0
[0003aad2] 242b 0038                 move.l     56(a3),d2
[0003aad6] e78a                      lsl.l      #3,d2
[0003aad8] 206b 002c                 movea.l    44(a3),a0
[0003aadc] 2070 2800                 movea.l    0(a0,d2.l),a0
[0003aae0] 6100 d0e0                 bsr        vpos
[0003aae4] 48c0                      ext.l      d0
[0003aae6] 2740 0044                 move.l     d0,68(a3)
[0003aaea] 6000 054e                 bra        Auo_editor_17
Auo_editor_52:
[0003aaee] 224c                      movea.l    a4,a1
[0003aaf0] 204b                      movea.l    a3,a0
[0003aaf2] 6100 dd96                 bsr        edit_substitute
[0003aaf6] 6000 0542                 bra        Auo_editor_17
Auo_editor_51:
[0003aafa] 7001                      moveq.l    #1,d0
[0003aafc] d0ab 0028                 add.l      40(a3),d0
[0003ab00] 2880                      move.l     d0,(a4)
[0003ab02] 6000 0536                 bra        Auo_editor_17
Auo_editor_50:
[0003ab06] 202b 0030                 move.l     48(a3),d0
[0003ab0a] e788                      lsl.l      #3,d0
[0003ab0c] 206b 002c                 movea.l    44(a3),a0
[0003ab10] 3230 0804                 move.w     4(a0,d0.l),d1
[0003ab14] 48c1                      ext.l      d1
[0003ab16] 2881                      move.l     d1,(a4)
[0003ab18] 6000 0520                 bra        Auo_editor_17
Auo_editor_73:
[0003ab1c] 202b 0030                 move.l     48(a3),d0
[0003ab20] e788                      lsl.l      #3,d0
[0003ab22] 206b 002c                 movea.l    44(a3),a0
[0003ab26] d1c0                      adda.l     d0,a0
[0003ab28] 2f48 0012                 move.l     a0,18(a7)
[0003ab2c] 28ab 0040                 move.l     64(a3),(a4)
[0003ab30] 6000 0508                 bra        Auo_editor_17
Auo_editor_49:
[0003ab34] 202b 0030                 move.l     48(a3),d0
[0003ab38] e788                      lsl.l      #3,d0
[0003ab3a] 206b 002c                 movea.l    44(a3),a0
[0003ab3e] d1c0                      adda.l     d0,a0
[0003ab40] 2f48 0012                 move.l     a0,18(a7)
[0003ab44] 322b 0042                 move.w     66(a3),d1
[0003ab48] 302b 009a                 move.w     154(a3),d0
[0003ab4c] 2050                      movea.l    (a0),a0
[0003ab4e] 6100 d036                 bsr        posv
[0003ab52] 3600                      move.w     d0,d3
[0003ab54] 48c3                      ext.l      d3
[0003ab56] 2883                      move.l     d3,(a4)
[0003ab58] 6000 04e0                 bra        Auo_editor_17
Auo_editor_44:
[0003ab5c] 204b                      movea.l    a3,a0
[0003ab5e] 6100 f7a4                 bsr        edit_unselect
[0003ab62] 6000 04d6                 bra        Auo_editor_17
Auo_editor_45:
[0003ab66] 0c6b 0004 0070            cmpi.w     #$0004,112(a3)
[0003ab6c] 660c                      bne.s      Auo_editor_83
[0003ab6e] 224c                      movea.l    a4,a1
[0003ab70] 204b                      movea.l    a3,a0
[0003ab72] 6100 f64e                 bsr        edit_nextrange
[0003ab76] 6000 04c2                 bra        Auo_editor_17
Auo_editor_83:
[0003ab7a] 302b 0012                 move.w     18(a3),d0
[0003ab7e] c07c 0200                 and.w      #$0200,d0
[0003ab82] 671a                      beq.s      Auo_editor_84
[0003ab84] 28ab 0030                 move.l     48(a3),(a4)
[0003ab88] 296b 0034 0004            move.l     52(a3),4(a4)
[0003ab8e] 296b 0038 0008            move.l     56(a3),8(a4)
[0003ab94] 296b 003c 000c            move.l     60(a3),12(a4)
[0003ab9a] 6000 049e                 bra        Auo_editor_17
Auo_editor_84:
[0003ab9e] 28bc ffff ffff            move.l     #$FFFFFFFF,(a4)
[0003aba4] 6000 0494                 bra        Auo_editor_17
Auo_editor_46:
[0003aba8] 224c                      movea.l    a4,a1
[0003abaa] 204b                      movea.l    a3,a0
[0003abac] 6100 f7a4                 bsr        edit_setselect
[0003abb0] 6000 0488                 bra        Auo_editor_17
Auo_editor_47:
[0003abb4] 2754 0072                 move.l     (a4),114(a3)
[0003abb8] 276c 0004 0076            move.l     4(a4),118(a3)
[0003abbe] 6000 047a                 bra        Auo_editor_17
Auo_editor_48:
[0003abc2] 202b 0072                 move.l     114(a3),d0
[0003abc6] 6700 0472                 beq        Auo_editor_17
[0003abca] 222b 0030                 move.l     48(a3),d1
[0003abce] e789                      lsl.l      #3,d1
[0003abd0] 206b 002c                 movea.l    44(a3),a0
[0003abd4] d1c1                      adda.l     d1,a0
[0003abd6] 2f48 0012                 move.l     a0,18(a7)
[0003abda] 0c6b 0002 0070            cmpi.w     #$0002,112(a3)
[0003abe0] 6708                      beq.s      Auo_editor_85
[0003abe2] 0c6b 0001 0070            cmpi.w     #$0001,112(a3)
[0003abe8] 6612                      bne.s      Auo_editor_86
Auo_editor_85:
[0003abea] 7001                      moveq.l    #1,d0
[0003abec] 206f 0012                 movea.l    18(a7),a0
[0003abf0] c068 0006                 and.w      6(a0),d0
[0003abf4] 6706                      beq.s      Auo_editor_86
[0003abf6] 2e90                      move.l     (a0),(a7)
[0003abf8] 2217                      move.l     (a7),d1
[0003abfa] 6606                      bne.s      Auo_editor_87
Auo_editor_86:
[0003abfc] 2ebc 000c f36c            move.l     #$000CF36C,(a7)
Auo_editor_87:
[0003ac02] 2257                      movea.l    (a7),a1
[0003ac04] 206b 0076                 movea.l    118(a3),a0
[0003ac08] 2a6b 0072                 movea.l    114(a3),a5
[0003ac0c] 4e95                      jsr        (a5)
[0003ac0e] 6000 042a                 bra        Auo_editor_17
Auo_editor_38:
[0003ac12] 377c 0002 0070            move.w     #$0002,112(a3)
[0003ac18] 6000 0420                 bra        Auo_editor_17
Auo_editor_39:
[0003ac1c] 377c 0001 0070            move.w     #$0001,112(a3)
[0003ac22] 6000 0416                 bra        Auo_editor_17
Auo_editor_40:
[0003ac26] 377c 0003 0070            move.w     #$0003,112(a3)
[0003ac2c] 6000 040c                 bra        Auo_editor_17
Auo_editor_41:
[0003ac30] 377c 0004 0070            move.w     #$0004,112(a3)
[0003ac36] 6000 0402                 bra        Auo_editor_17
Auo_editor_42:
[0003ac3a] 426b 0070                 clr.w      112(a3)
[0003ac3e] 6000 03fa                 bra        Auo_editor_17
Auo_editor_43:
[0003ac42] 377c 0005 0070            move.w     #$0005,112(a3)
[0003ac48] 6000 03f0                 bra        Auo_editor_17
Auo_editor_8:
[0003ac4c] 244c                      movea.l    a4,a2
[0003ac4e] 2752 0054                 move.l     (a2),84(a3)
[0003ac52] 276a 0004 0058            move.l     4(a2),88(a3)
[0003ac58] 376a 0008 005c            move.w     8(a2),92(a3)
[0003ac5e] 6000 03da                 bra        Auo_editor_17
Auo_editor_16:
[0003ac62] 244c                      movea.l    a4,a2
[0003ac64] 24ab 0054                 move.l     84(a3),(a2)
[0003ac68] 256b 0058 0004            move.l     88(a3),4(a2)
[0003ac6e] 356b 005c 0008            move.w     92(a3),8(a2)
[0003ac74] 6000 03c4                 bra        Auo_editor_17
Auo_editor_37:
[0003ac78] 204b                      movea.l    a3,a0
[0003ac7a] 6100 d58e                 bsr        edit_view
[0003ac7e] 6000 03ba                 bra        Auo_editor_17
Auo_editor_29:
[0003ac82] 006b 0020 0012            ori.w      #$0020,18(a3)
Auo_editor_88:
[0003ac88] 026b ff7f 0012            andi.w     #$FF7F,18(a3)
[0003ac8e] 6000 03aa                 bra        Auo_editor_17
Auo_editor_30:
[0003ac92] 026b ff5f 0012            andi.w     #$FF5F,18(a3)
[0003ac98] 6000 03a0                 bra        Auo_editor_17
Auo_editor_31:
[0003ac9c] 7020                      moveq.l    #32,d0
[0003ac9e] c06b 0012                 and.w      18(a3),d0
[0003aca2] 6700 0396                 beq        Auo_editor_17
[0003aca6] 323c 0080                 move.w     #$0080,d1
[0003acaa] c26b 0012                 and.w      18(a3),d1
[0003acae] 6700 038a                 beq        Auo_editor_17
[0003acb2] 204b                      movea.l    a3,a0
[0003acb4] 6100 e324                 bsr        change_cur
[0003acb8] 60ce                      bra.s      Auo_editor_88
Auo_editor_32:
[0003acba] 7020                      moveq.l    #32,d0
[0003acbc] c06b 0012                 and.w      18(a3),d0
[0003acc0] 6700 0378                 beq        Auo_editor_17
[0003acc4] 323c 0080                 move.w     #$0080,d1
[0003acc8] c26b 0012                 and.w      18(a3),d1
[0003accc] 6600 036c                 bne        Auo_editor_17
[0003acd0] 006b 0080 0012            ori.w      #$0080,18(a3)
[0003acd6] 204b                      movea.l    a3,a0
[0003acd8] 6100 e300                 bsr        change_cur
[0003acdc] 6000 035c                 bra        Auo_editor_17
Auo_editor_33:
[0003ace0] 2754 0034                 move.l     (a4),52(a3)
[0003ace4] 276b 0034 003c            move.l     52(a3),60(a3)
[0003acea] 322b 0036                 move.w     54(a3),d1
[0003acee] 302b 009a                 move.w     154(a3),d0
[0003acf2] 242b 0030                 move.l     48(a3),d2
[0003acf6] e78a                      lsl.l      #3,d2
[0003acf8] 206b 002c                 movea.l    44(a3),a0
[0003acfc] 2070 2800                 movea.l    0(a0,d2.l),a0
[0003ad00] 6100 cec0                 bsr        vpos
[0003ad04] 48c0                      ext.l      d0
[0003ad06] 2740 0040                 move.l     d0,64(a3)
[0003ad0a] 2740 0044                 move.l     d0,68(a3)
[0003ad0e] 6000 032a                 bra        Auo_editor_17
Auo_editor_34:
[0003ad12] 28ab 0030                 move.l     48(a3),(a4)
[0003ad16] 6000 0322                 bra        Auo_editor_17
Auo_editor_2:
[0003ad1a] 206f 001a                 movea.l    26(a7),a0
[0003ad1e] 4eb9 0003 b586            jsr        create
[0003ad24] 4a40                      tst.w      d0
[0003ad26] 6700 0312                 beq        Auo_editor_17
[0003ad2a] 38bc ffff                 move.w     #$FFFF,(a4)
[0003ad2e] 6000 030a                 bra        Auo_editor_17
Auo_editor_3:
[0003ad32] 204b                      movea.l    a3,a0
[0003ad34] 6100 f390                 bsr        edit_free
[0003ad38] 204b                      movea.l    a3,a0
[0003ad3a] 4eb9 0004 c6c8            jsr        Ax_ifree
[0003ad40] 6000 02f8                 bra        Auo_editor_17
Auo_editor_5:
[0003ad44] 202b 0030                 move.l     48(a3),d0
[0003ad48] e788                      lsl.l      #3,d0
[0003ad4a] 206b 002c                 movea.l    44(a3),a0
[0003ad4e] d1c0                      adda.l     d0,a0
[0003ad50] 2f48 0012                 move.l     a0,18(a7)
[0003ad54] 2050                      movea.l    (a0),a0
[0003ad56] 4eb9 0004 c6c8            jsr        Ax_ifree
[0003ad5c] 206f 0012                 movea.l    18(a7),a0
[0003ad60] 4290                      clr.l      (a0)
[0003ad62] 4268 0004                 clr.w      4(a0)
[0003ad66] 224c                      movea.l    a4,a1
[0003ad68] 202b 0030                 move.l     48(a3),d0
[0003ad6c] 204b                      movea.l    a3,a0
[0003ad6e] 6100 f2a8                 bsr        edit_add
[0003ad72] 202b 0030                 move.l     48(a3),d0
[0003ad76] 204b                      movea.l    a3,a0
[0003ad78] 6100 e096                 bsr        edit_showline
[0003ad7c] 6000 02bc                 bra        Auo_editor_17
Auo_editor_4:
[0003ad80] 202b 0030                 move.l     48(a3),d0
[0003ad84] e788                      lsl.l      #3,d0
[0003ad86] 206b 002c                 movea.l    44(a3),a0
[0003ad8a] d1c0                      adda.l     d0,a0
[0003ad8c] 2f48 0012                 move.l     a0,18(a7)
[0003ad90] 3228 0004                 move.w     4(a0),d1
[0003ad94] 6f06                      ble.s      Auo_editor_89
[0003ad96] 2890                      move.l     (a0),(a4)
[0003ad98] 6000 02a0                 bra        Auo_editor_17
Auo_editor_89:
[0003ad9c] 28bc 000c f36c            move.l     #$000CF36C,(a4)
[0003ada2] 6000 0296                 bra        Auo_editor_17
Auo_editor_25:
[0003ada6] 3214                      move.w     (a4),d1
[0003ada8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003adae] 3028 0010                 move.w     16(a0),d0
[0003adb2] 4eb9 0007 34e6            jsr        vst_font
[0003adb8] 3740 0002                 move.w     d0,2(a3)
[0003adbc] 6004                      bra.s      Auo_editor_90
Auo_editor_26:
[0003adbe] 3754 0004                 move.w     (a4),4(a3)
Auo_editor_90:
[0003adc2] 486b 0006                 pea.l      6(a3)
[0003adc6] 486b 0008                 pea.l      8(a3)
[0003adca] 43eb 0004                 lea.l      4(a3),a1
[0003adce] 41ef 0018                 lea.l      24(a7),a0
[0003add2] 322b 0004                 move.w     4(a3),d1
[0003add6] 2a79 0010 ee4e            movea.l    ACSblk,a5
[0003addc] 302d 0010                 move.w     16(a5),d0
[0003ade0] 4eb9 0007 3370            jsr        vst_height
[0003ade6] 504f                      addq.w     #8,a7
[0003ade8] 601c                      bra.s      Auo_editor_91
Auo_editor_27:
[0003adea] 3694                      move.w     (a4),(a3)
[0003adec] 6000 024c                 bra        Auo_editor_17
Auo_editor_28:
[0003adf0] 2754 0020                 move.l     (a4),32(a3)
[0003adf4] 0cab 0000 0200 0020       cmpi.l     #$00000200,32(a3)
[0003adfc] 6f08                      ble.s      Auo_editor_91
[0003adfe] 277c 0000 0200 0020       move.l     #$00000200,32(a3)
Auo_editor_91:
[0003ae06] 206f 001a                 movea.l    26(a7),a0
[0003ae0a] 6100 f324                 bsr        resize
[0003ae0e] 6000 022a                 bra        Auo_editor_17
Auo_editor_22:
[0003ae12] 224c                      movea.l    a4,a1
[0003ae14] 206f 001a                 movea.l    26(a7),a0
[0003ae18] 6100 f27c                 bsr        edit_appline
[0003ae1c] 6000 021c                 bra        Auo_editor_17
Auo_editor_23:
[0003ae20] 2754 0014                 move.l     (a4),20(a3)
[0003ae24] 202b 0024                 move.l     36(a3),d0
[0003ae28] b0ab 0014                 cmp.l      20(a3),d0
[0003ae2c] 6f00 020c                 ble        Auo_editor_17
[0003ae30] 2740 0014                 move.l     d0,20(a3)
[0003ae34] 6000 0204                 bra        Auo_editor_17
Auo_editor_24:
[0003ae38] 204b                      movea.l    a3,a0
[0003ae3a] 6100 f28a                 bsr        edit_free
[0003ae3e] 204b                      movea.l    a3,a0
[0003ae40] 4eb9 0003 b548            jsr        edit_restart
[0003ae46] 6000 01f2                 bra        Auo_editor_17
Auo_editor_7:
[0003ae4a] 006b 0008 0012            ori.w      #$0008,18(a3)
Auo_editor_6:
[0003ae50] 204b                      movea.l    a3,a0
[0003ae52] 6100 e1b4                 bsr        edit_update
[0003ae56] 6000 01b4                 bra        Auo_editor_71
Auo_editor_57:
[0003ae5a] 204b                      movea.l    a3,a0
[0003ae5c] 6100 e1aa                 bsr        edit_update
[0003ae60] 6000 01d8                 bra        Auo_editor_17
Auo_editor_9:
[0003ae64] 52ab 0030                 addq.l     #1,48(a3)
[0003ae68] 6040                      bra.s      Auo_editor_92
Auo_editor_10:
[0003ae6a] 53ab 0030                 subq.l     #1,48(a3)
[0003ae6e] 6012                      bra.s      Auo_editor_93
Auo_editor_11:
[0003ae70] 202b 000a                 move.l     10(a3),d0
[0003ae74] d1ab 0030                 add.l      d0,48(a3)
[0003ae78] 6030                      bra.s      Auo_editor_92
Auo_editor_12:
[0003ae7a] 202b 000a                 move.l     10(a3),d0
[0003ae7e] 91ab 0030                 sub.l      d0,48(a3)
Auo_editor_93:
[0003ae82] 202b 0030                 move.l     48(a3),d0
[0003ae86] 6a00 01b2                 bpl        Auo_editor_17
Auo_editor_13:
[0003ae8a] 42ab 0030                 clr.l      48(a3)
[0003ae8e] 6000 01aa                 bra        Auo_editor_17
Auo_editor_14:
[0003ae92] 276b 0028 0030            move.l     40(a3),48(a3)
[0003ae98] 6000 01a0                 bra        Auo_editor_17
Auo_editor_15:
[0003ae9c] 2754 0030                 move.l     (a4),48(a3)
[0003aea0] 202b 0030                 move.l     48(a3),d0
[0003aea4] 6a04                      bpl.s      Auo_editor_92
[0003aea6] 42ab 0030                 clr.l      48(a3)
Auo_editor_92:
[0003aeaa] 202b 0030                 move.l     48(a3),d0
[0003aeae] b0ab 0028                 cmp.l      40(a3),d0
[0003aeb2] 6f00 0186                 ble        Auo_editor_17
[0003aeb6] 60da                      bra.s      Auo_editor_14
Auo_editor_35:
[0003aeb8] 2754 001c                 move.l     (a4),28(a3)
[0003aebc] 262b 0020                 move.l     32(a3),d3
[0003aec0] 96ab 000e                 sub.l      14(a3),d3
[0003aec4] b6ab 001c                 cmp.l      28(a3),d3
[0003aec8] 6c04                      bge.s      Auo_editor_94
[0003aeca] 2743 001c                 move.l     d3,28(a3)
Auo_editor_94:
[0003aece] 202b 001c                 move.l     28(a3),d0
[0003aed2] 6a00 0166                 bpl        Auo_editor_17
[0003aed6] 42ab 001c                 clr.l      28(a3)
[0003aeda] 6000 015e                 bra        Auo_editor_17
Auo_editor_74:
[0003aede] 28ab 001c                 move.l     28(a3),(a4)
[0003aee2] 6000 0156                 bra        Auo_editor_17
Auo_editor_36:
[0003aee6] 2754 0018                 move.l     (a4),24(a3)
[0003aeea] 202b 0018                 move.l     24(a3),d0
[0003aeee] 6a04                      bpl.s      Auo_editor_95
[0003aef0] 42ab 0018                 clr.l      24(a3)
Auo_editor_95:
[0003aef4] 262b 0028                 move.l     40(a3),d3
[0003aef8] 96ab 000a                 sub.l      10(a3),d3
[0003aefc] 5283                      addq.l     #1,d3
[0003aefe] 4a83                      tst.l      d3
[0003af00] 6b00 0138                 bmi        Auo_editor_17
[0003af04] b6ab 0018                 cmp.l      24(a3),d3
[0003af08] 6c00 0130                 bge        Auo_editor_17
[0003af0c] 2743 0018                 move.l     d3,24(a3)
[0003af10] 6000 0128                 bra        Auo_editor_17
Auo_editor_75:
[0003af14] 28ab 0018                 move.l     24(a3),(a4)
[0003af18] 6000 0120                 bra        Auo_editor_17
Auo_editor_21:
[0003af1c] 206f 001a                 movea.l    26(a7),a0
[0003af20] 6100 e000                 bsr        edit_newline
[0003af24] 6000 0114                 bra        Auo_editor_17
Auo_editor_18:
[0003af28] 7001                      moveq.l    #1,d0
[0003af2a] c06b 0012                 and.w      18(a3),d0
[0003af2e] 6708                      beq.s      Auo_editor_96
[0003af30] 206f 001a                 movea.l    26(a7),a0
[0003af34] 6100 f1fa                 bsr        resize
Auo_editor_96:
[0003af38] 244c                      movea.l    a4,a2
[0003af3a] 206a 0004                 movea.l    4(a2),a0
[0003af3e] 2748 0062                 move.l     a0,98(a3)
[0003af42] 2f48 000c                 move.l     a0,12(a7)
[0003af46] 2f7c 0003 b6f4 0004       move.l     #vertical,4(a7)
[0003af4e] 43eb 0054                 lea.l      84(a3),a1
[0003af52] 2f49 0008                 move.l     a1,8(a7)
[0003af56] 2f68 000c 0016            move.l     12(a0),22(a7)
[0003af5c] 7009                      moveq.l    #9,d0
[0003af5e] 2a6f 0016                 movea.l    22(a7),a5
[0003af62] 2a6d 0008                 movea.l    8(a5),a5
[0003af66] 224a                      movea.l    a2,a1
[0003af68] 4e95                      jsr        (a5)
[0003af6a] 43ef 0004                 lea.l      4(a7),a1
[0003af6e] 7067                      moveq.l    #103,d0
[0003af70] 206f 000c                 movea.l    12(a7),a0
[0003af74] 2a6f 0016                 movea.l    22(a7),a5
[0003af78] 2a6d 0008                 movea.l    8(a5),a5
[0003af7c] 4e95                      jsr        (a5)
[0003af7e] 606a                      bra.s      Auo_editor_97
Auo_editor_19:
[0003af80] 7001                      moveq.l    #1,d0
[0003af82] c06b 0012                 and.w      18(a3),d0
[0003af86] 6708                      beq.s      Auo_editor_98
[0003af88] 206f 001a                 movea.l    26(a7),a0
[0003af8c] 6100 f1a2                 bsr        resize
Auo_editor_98:
[0003af90] 244c                      movea.l    a4,a2
[0003af92] 206a 0004                 movea.l    4(a2),a0
[0003af96] 2748 005e                 move.l     a0,94(a3)
[0003af9a] 2f48 000c                 move.l     a0,12(a7)
[0003af9e] 2f7c 0003 b6c6 0004       move.l     #horizontal,4(a7)
[0003afa6] 43eb 0054                 lea.l      84(a3),a1
[0003afaa] 2f49 0008                 move.l     a1,8(a7)
[0003afae] 2f68 000c 0016            move.l     12(a0),22(a7)
[0003afb4] 7009                      moveq.l    #9,d0
[0003afb6] 2a6f 0016                 movea.l    22(a7),a5
[0003afba] 2a6d 0008                 movea.l    8(a5),a5
[0003afbe] 224a                      movea.l    a2,a1
[0003afc0] 4e95                      jsr        (a5)
[0003afc2] 43ef 0004                 lea.l      4(a7),a1
[0003afc6] 7067                      moveq.l    #103,d0
[0003afc8] 206f 000c                 movea.l    12(a7),a0
[0003afcc] 246f 0016                 movea.l    22(a7),a2
[0003afd0] 246a 0008                 movea.l    8(a2),a2
[0003afd4] 4e92                      jsr        (a2)
[0003afd6] 43eb 0020                 lea.l      32(a3),a1
[0003afda] 7064                      moveq.l    #100,d0
[0003afdc] 206f 000c                 movea.l    12(a7),a0
[0003afe0] 246f 0016                 movea.l    22(a7),a2
[0003afe4] 246a 0008                 movea.l    8(a2),a2
[0003afe8] 4e92                      jsr        (a2)
Auo_editor_97:
[0003afea] 43f9 000c f36c            lea.l      $000CF36C,a1
[0003aff0] 7004                      moveq.l    #4,d0
[0003aff2] 206f 000c                 movea.l    12(a7),a0
[0003aff6] 246f 0016                 movea.l    22(a7),a2
[0003affa] 246a 0008                 movea.l    8(a2),a2
[0003affe] 4e92                      jsr        (a2)
[0003b000] 4240                      clr.w      d0
[0003b002] 204b                      movea.l    a3,a0
[0003b004] 4eb9 0003 b618            jsr        cleanup
[0003b00a] 602e                      bra.s      Auo_editor_17
Auo_editor_71:
[0003b00c] 7001                      moveq.l    #1,d0
[0003b00e] 204b                      movea.l    a3,a0
[0003b010] 4eb9 0003 b618            jsr        cleanup
[0003b016] 6022                      bra.s      Auo_editor_17
Auo_editor_78:
[0003b018] 006b 2000 0012            ori.w      #$2000,18(a3)
[0003b01e] 601a                      bra.s      Auo_editor_17
Auo_editor_79:
[0003b020] 224c                      movea.l    a4,a1
[0003b022] 41eb 00a0                 lea.l      160(a3),a0
[0003b026] 4eb9 0008 2f0c            jsr        strcpy
[0003b02c] 600c                      bra.s      Auo_editor_17
Auo_editor_80:
[0003b02e] 41eb 00a0                 lea.l      160(a3),a0
[0003b032] 2888                      move.l     a0,(a4)
[0003b034] 6004                      bra.s      Auo_editor_17
Auo_editor_1:
[0003b036] 4240                      clr.w      d0
[0003b038] 6002                      bra.s      Auo_editor_99
Auo_editor_17:
[0003b03a] 7001                      moveq.l    #1,d0
Auo_editor_99:
[0003b03c] 4fef 001e                 lea.l      30(a7),a7
[0003b040] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003b044] 4e75                      rts

edit_forbracket:
[0003b046] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[0003b04a] 4fef ffec                 lea.l      -20(a7),a7
[0003b04e] 2f48 0010                 move.l     a0,16(a7)
[0003b052] 2a00                      move.l     d0,d5
[0003b054] 2c01                      move.l     d1,d6
[0003b056] 1602                      move.b     d2,d3
[0003b058] 4882                      ext.w      d2
[0003b05a] 947c 0028                 sub.w      #$0028,d2
[0003b05e] 6718                      beq.s      edit_forbracket_1
[0003b060] 947c 0014                 sub.w      #$0014,d2
[0003b064] 671a                      beq.s      edit_forbracket_2
[0003b066] 947c 001f                 sub.w      #$001F,d2
[0003b06a] 6708                      beq.s      edit_forbracket_3
[0003b06c] 947c 0020                 sub.w      #$0020,d2
[0003b070] 670a                      beq.s      edit_forbracket_4
[0003b072] 600e                      bra.s      edit_forbracket_5
edit_forbracket_3:
[0003b074] 785d                      moveq.l    #93,d4
[0003b076] 600a                      bra.s      edit_forbracket_5
edit_forbracket_1:
[0003b078] 7829                      moveq.l    #41,d4
[0003b07a] 6006                      bra.s      edit_forbracket_5
edit_forbracket_4:
[0003b07c] 787d                      moveq.l    #125,d4
[0003b07e] 6002                      bra.s      edit_forbracket_5
edit_forbracket_2:
[0003b080] 783e                      moveq.l    #62,d4
edit_forbracket_5:
[0003b082] 2e85                      move.l     d5,(a7)
[0003b084] 2f46 0004                 move.l     d6,4(a7)
[0003b088] 5286                      addq.l     #1,d6
[0003b08a] 2005                      move.l     d5,d0
[0003b08c] e788                      lsl.l      #3,d0
[0003b08e] 206f 0010                 movea.l    16(a7),a0
[0003b092] 2868 002c                 movea.l    44(a0),a4
[0003b096] d9c0                      adda.l     d0,a4
[0003b098] 7e01                      moveq.l    #1,d7
[0003b09a] 6000 009a                 bra        edit_forbracket_6
edit_forbracket_14:
[0003b09e] 206f 0010                 movea.l    16(a7),a0
[0003b0a2] baa8 0028                 cmp.l      40(a0),d5
[0003b0a6] 6f3e                      ble.s      edit_forbracket_7
[0003b0a8] 7004                      moveq.l    #4,d0
[0003b0aa] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003b0b0] 2069 023c                 movea.l    572(a1),a0
[0003b0b4] c068 000e                 and.w      14(a0),d0
[0003b0b8] 670a                      beq.s      edit_forbracket_8
[0003b0ba] 7207                      moveq.l    #7,d1
[0003b0bc] 7002                      moveq.l    #2,d0
[0003b0be] 4eb9 0008 0b1a            jsr        Bconout
edit_forbracket_8:
[0003b0c4] 206f 0010                 movea.l    16(a7),a0
[0003b0c8] 2268 0058                 movea.l    88(a0),a1
[0003b0cc] 2a69 000c                 movea.l    12(a1),a5
[0003b0d0] 43f9 000c f37e            lea.l      $000CF37E,a1
[0003b0d6] 303c 0104                 move.w     #$0104,d0
[0003b0da] 2068 0058                 movea.l    88(a0),a0
[0003b0de] 246d 0008                 movea.l    8(a5),a2
[0003b0e2] 4e92                      jsr        (a2)
[0003b0e4] 6068                      bra.s      edit_forbracket_9
edit_forbracket_7:
[0003b0e6] 302c 0004                 move.w     4(a4),d0
[0003b0ea] 6f44                      ble.s      edit_forbracket_10
[0003b0ec] 2a54                      movea.l    (a4),a5
[0003b0ee] dbc6                      adda.l     d6,a5
[0003b0f0] 1003                      move.b     d3,d0
[0003b0f2] 4880                      ext.w      d0
[0003b0f4] 204d                      movea.l    a5,a0
[0003b0f6] 4eb9 0008 2e8a            jsr        strchr
[0003b0fc] 2448                      movea.l    a0,a2
[0003b0fe] 1004                      move.b     d4,d0
[0003b100] 4880                      ext.w      d0
[0003b102] 204d                      movea.l    a5,a0
[0003b104] 4eb9 0008 2e8a            jsr        strchr
[0003b10a] 2648                      movea.l    a0,a3
[0003b10c] 200b                      move.l     a3,d0
[0003b10e] 660e                      bne.s      edit_forbracket_11
[0003b110] 220a                      move.l     a2,d1
[0003b112] 671c                      beq.s      edit_forbracket_10
edit_forbracket_13:
[0003b114] 2c0a                      move.l     a2,d6
[0003b116] 9c94                      sub.l      (a4),d6
[0003b118] 5286                      addq.l     #1,d6
[0003b11a] 5247                      addq.w     #1,d7
[0003b11c] 6018                      bra.s      edit_forbracket_6
edit_forbracket_11:
[0003b11e] 200a                      move.l     a2,d0
[0003b120] 6704                      beq.s      edit_forbracket_12
[0003b122] b7c0                      cmpa.l     d0,a3
[0003b124] 64ee                      bcc.s      edit_forbracket_13
edit_forbracket_12:
[0003b126] 2c0b                      move.l     a3,d6
[0003b128] 9c94                      sub.l      (a4),d6
[0003b12a] 5286                      addq.l     #1,d6
[0003b12c] 5347                      subq.w     #1,d7
[0003b12e] 6006                      bra.s      edit_forbracket_6
edit_forbracket_10:
[0003b130] 7c00                      moveq.l    #0,d6
[0003b132] 5285                      addq.l     #1,d5
[0003b134] 504c                      addq.w     #8,a4
edit_forbracket_6:
[0003b136] 4a47                      tst.w      d7
[0003b138] 6e00 ff64                 bgt        edit_forbracket_14
[0003b13c] 2f45 0008                 move.l     d5,8(a7)
[0003b140] 2f46 000c                 move.l     d6,12(a7)
[0003b144] 43d7                      lea.l      (a7),a1
[0003b146] 206f 0010                 movea.l    16(a7),a0
[0003b14a] 6100 f206                 bsr        edit_setselect
edit_forbracket_9:
[0003b14e] 4fef 0014                 lea.l      20(a7),a7
[0003b152] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[0003b156] 4e75                      rts

edit_backbracket:
[0003b158] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[0003b15c] 4fef ffe6                 lea.l      -26(a7),a7
[0003b160] 2f48 0016                 move.l     a0,22(a7)
[0003b164] 2a00                      move.l     d0,d5
[0003b166] 2c01                      move.l     d1,d6
[0003b168] 1f42 0014                 move.b     d2,20(a7)
[0003b16c] 4882                      ext.w      d2
[0003b16e] 947c 0029                 sub.w      #$0029,d2
[0003b172] 6718                      beq.s      edit_backbracket_1
[0003b174] 947c 0015                 sub.w      #$0015,d2
[0003b178] 671a                      beq.s      edit_backbracket_2
[0003b17a] 947c 001f                 sub.w      #$001F,d2
[0003b17e] 6708                      beq.s      edit_backbracket_3
[0003b180] 947c 0020                 sub.w      #$0020,d2
[0003b184] 670a                      beq.s      edit_backbracket_4
[0003b186] 600e                      bra.s      edit_backbracket_5
edit_backbracket_3:
[0003b188] 785b                      moveq.l    #91,d4
[0003b18a] 600a                      bra.s      edit_backbracket_5
edit_backbracket_1:
[0003b18c] 7828                      moveq.l    #40,d4
[0003b18e] 6006                      bra.s      edit_backbracket_5
edit_backbracket_4:
[0003b190] 787b                      moveq.l    #123,d4
[0003b192] 6002                      bra.s      edit_backbracket_5
edit_backbracket_2:
[0003b194] 783c                      moveq.l    #60,d4
edit_backbracket_5:
[0003b196] 2f45 000c                 move.l     d5,12(a7)
[0003b19a] 7001                      moveq.l    #1,d0
[0003b19c] d086                      add.l      d6,d0
[0003b19e] 2f40 0010                 move.l     d0,16(a7)
[0003b1a2] 2205                      move.l     d5,d1
[0003b1a4] e789                      lsl.l      #3,d1
[0003b1a6] 206f 0016                 movea.l    22(a7),a0
[0003b1aa] 2868 002c                 movea.l    44(a0),a4
[0003b1ae] d9c1                      adda.l     d1,a4
[0003b1b0] 7e01                      moveq.l    #1,d7
[0003b1b2] 6000 00ba                 bra        edit_backbracket_6
edit_backbracket_16:
[0003b1b6] 4a86                      tst.l      d6
[0003b1b8] 6a0a                      bpl.s      edit_backbracket_7
[0003b1ba] 5385                      subq.l     #1,d5
[0003b1bc] 514c                      subq.w     #8,a4
[0003b1be] 3c2c 0004                 move.w     4(a4),d6
[0003b1c2] 48c6                      ext.l      d6
edit_backbracket_7:
[0003b1c4] 4a85                      tst.l      d5
[0003b1c6] 6a40                      bpl.s      edit_backbracket_8
[0003b1c8] 7004                      moveq.l    #4,d0
[0003b1ca] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003b1d0] 2268 023c                 movea.l    572(a0),a1
[0003b1d4] c069 000e                 and.w      14(a1),d0
[0003b1d8] 670a                      beq.s      edit_backbracket_9
[0003b1da] 7207                      moveq.l    #7,d1
[0003b1dc] 7002                      moveq.l    #2,d0
[0003b1de] 4eb9 0008 0b1a            jsr        Bconout
edit_backbracket_9:
[0003b1e4] 206f 0016                 movea.l    22(a7),a0
[0003b1e8] 2268 0058                 movea.l    88(a0),a1
[0003b1ec] 2a69 000c                 movea.l    12(a1),a5
[0003b1f0] 43f9 000c f37e            lea.l      $000CF37E,a1
[0003b1f6] 303c 0104                 move.w     #$0104,d0
[0003b1fa] 2068 0058                 movea.l    88(a0),a0
[0003b1fe] 246d 0008                 movea.l    8(a5),a2
[0003b202] 4e92                      jsr        (a2)
[0003b204] 6000 0082                 bra        edit_backbracket_10
edit_backbracket_8:
[0003b208] 302c 0004                 move.w     4(a4),d0
[0003b20c] 6f56                      ble.s      edit_backbracket_11
[0003b20e] 2a54                      movea.l    (a4),a5
[0003b210] 45f5 6800                 lea.l      0(a5,d6.l),a2
[0003b214] 1612                      move.b     (a2),d3
[0003b216] 4212                      clr.b      (a2)
[0003b218] 102f 0014                 move.b     20(a7),d0
[0003b21c] 4880                      ext.w      d0
[0003b21e] 204d                      movea.l    a5,a0
[0003b220] 4eb9 0008 2e9e            jsr        strrchr
[0003b226] 2648                      movea.l    a0,a3
[0003b228] 1004                      move.b     d4,d0
[0003b22a] 4880                      ext.w      d0
[0003b22c] 204d                      movea.l    a5,a0
[0003b22e] 4eb9 0008 2e9e            jsr        strrchr
[0003b234] 2e88                      move.l     a0,(a7)
[0003b236] 1483                      move.b     d3,(a2)
[0003b238] 2008                      move.l     a0,d0
[0003b23a] 6704                      beq.s      edit_backbracket_12
[0003b23c] b5c0                      cmpa.l     d0,a2
[0003b23e] 6210                      bhi.s      edit_backbracket_13
edit_backbracket_12:
[0003b240] 200b                      move.l     a3,d0
[0003b242] 6720                      beq.s      edit_backbracket_11
[0003b244] b5c0                      cmpa.l     d0,a2
[0003b246] 631c                      bls.s      edit_backbracket_11
edit_backbracket_15:
[0003b248] 2c0b                      move.l     a3,d6
[0003b24a] 9c94                      sub.l      (a4),d6
[0003b24c] 5247                      addq.w     #1,d7
[0003b24e] 601e                      bra.s      edit_backbracket_6
edit_backbracket_13:
[0003b250] 200b                      move.l     a3,d0
[0003b252] 6708                      beq.s      edit_backbracket_14
[0003b254] b5c0                      cmpa.l     d0,a2
[0003b256] 6304                      bls.s      edit_backbracket_14
[0003b258] b097                      cmp.l      (a7),d0
[0003b25a] 64ec                      bcc.s      edit_backbracket_15
edit_backbracket_14:
[0003b25c] 2c17                      move.l     (a7),d6
[0003b25e] 9c94                      sub.l      (a4),d6
[0003b260] 5347                      subq.w     #1,d7
[0003b262] 600a                      bra.s      edit_backbracket_6
edit_backbracket_11:
[0003b264] 5385                      subq.l     #1,d5
[0003b266] 514c                      subq.w     #8,a4
[0003b268] 3c2c 0004                 move.w     4(a4),d6
[0003b26c] 48c6                      ext.l      d6
edit_backbracket_6:
[0003b26e] 4a47                      tst.w      d7
[0003b270] 6e00 ff44                 bgt        edit_backbracket_16
[0003b274] 2f45 0004                 move.l     d5,4(a7)
[0003b278] 2f46 0008                 move.l     d6,8(a7)
[0003b27c] 43ef 0004                 lea.l      4(a7),a1
[0003b280] 206f 0016                 movea.l    22(a7),a0
[0003b284] 6100 f0cc                 bsr        edit_setselect
edit_backbracket_10:
[0003b288] 4fef 001a                 lea.l      26(a7),a7
[0003b28c] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[0003b290] 4e75                      rts

edit_click:
[0003b292] 48e7 1c38                 movem.l    d3-d5/a2-a4,-(a7)
[0003b296] 4fef fff0                 lea.l      -16(a7),a7
[0003b29a] 2448                      movea.l    a0,a2
[0003b29c] 3a00                      move.w     d0,d5
[0003b29e] 3601                      move.w     d1,d3
[0003b2a0] 3802                      move.w     d2,d4
[0003b2a2] 3001                      move.w     d1,d0
[0003b2a4] 6100 e1e2                 bsr        edit_row
[0003b2a8] 2600                      move.l     d0,d3
[0003b2aa] e788                      lsl.l      #3,d0
[0003b2ac] 266a 002c                 movea.l    44(a2),a3
[0003b2b0] d7c0                      adda.l     d0,a3
[0003b2b2] 7203                      moveq.l    #3,d1
[0003b2b4] c244                      and.w      d4,d1
[0003b2b6] 6734                      beq.s      edit_click_1
[0003b2b8] 2e83                      move.l     d3,(a7)
[0003b2ba] 42af 0004                 clr.l      4(a7)
[0003b2be] b6aa 0028                 cmp.l      40(a2),d3
[0003b2c2] 670e                      beq.s      edit_click_2
[0003b2c4] 7401                      moveq.l    #1,d2
[0003b2c6] d483                      add.l      d3,d2
[0003b2c8] 2f42 0008                 move.l     d2,8(a7)
[0003b2cc] 42af 000c                 clr.l      12(a7)
[0003b2d0] 600e                      bra.s      edit_click_3
edit_click_2:
[0003b2d2] 2f43 0008                 move.l     d3,8(a7)
[0003b2d6] 302b 0004                 move.w     4(a3),d0
[0003b2da] 48c0                      ext.l      d0
[0003b2dc] 2f40 000c                 move.l     d0,12(a7)
edit_click_3:
[0003b2e0] 43d7                      lea.l      (a7),a1
[0003b2e2] 204a                      movea.l    a2,a0
[0003b2e4] 6100 f06c                 bsr        edit_setselect
[0003b2e8] 6000 00c2                 bra        edit_click_4
edit_click_1:
[0003b2ec] 2853                      movea.l    (a3),a4
[0003b2ee] 3005                      move.w     d5,d0
[0003b2f0] 204a                      movea.l    a2,a0
[0003b2f2] 6100 e11a                 bsr        edit_col
[0003b2f6] 2a00                      move.l     d0,d5
[0003b2f8] 322b 0004                 move.w     4(a3),d1
[0003b2fc] 6f1a                      ble.s      edit_click_5
[0003b2fe] 302a 009a                 move.w     154(a2),d0
[0003b302] 204c                      movea.l    a4,a0
[0003b304] 3205                      move.w     d5,d1
[0003b306] 6100 c87e                 bsr        posv
[0003b30a] 3800                      move.w     d0,d4
[0003b30c] 48c4                      ext.l      d4
[0003b30e] 302b 0004                 move.w     4(a3),d0
[0003b312] 48c0                      ext.l      d0
[0003b314] b880                      cmp.l      d0,d4
[0003b316] 6d22                      blt.s      edit_click_6
edit_click_5:
[0003b318] 7004                      moveq.l    #4,d0
[0003b31a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003b320] 2268 023c                 movea.l    572(a0),a1
[0003b324] c069 000e                 and.w      14(a1),d0
[0003b328] 6700 0082                 beq        edit_click_4
[0003b32c] 7207                      moveq.l    #7,d1
[0003b32e] 7002                      moveq.l    #2,d0
[0003b330] 4eb9 0008 0b1a            jsr        Bconout
[0003b336] 6000 0074                 bra.w      edit_click_4
edit_click_6:
[0003b33a] 1a34 4800                 move.b     0(a4,d4.l),d5
[0003b33e] 1005                      move.b     d5,d0
[0003b340] 4880                      ext.w      d0
[0003b342] b07c 005b                 cmp.w      #$005B,d0
[0003b346] 672a                      beq.s      edit_click_7
[0003b348] 6e16                      bgt.s      edit_click_8
[0003b34a] 907c 0028                 sub.w      #$0028,d0
[0003b34e] 6722                      beq.s      edit_click_7
[0003b350] 5340                      subq.w     #1,d0
[0003b352] 672c                      beq.s      edit_click_9
[0003b354] 907c 0013                 sub.w      #$0013,d0
[0003b358] 6718                      beq.s      edit_click_7
[0003b35a] 5540                      subq.w     #2,d0
[0003b35c] 6722                      beq.s      edit_click_9
[0003b35e] 602e                      bra.s      edit_click_10
edit_click_8:
[0003b360] 907c 005d                 sub.w      #$005D,d0
[0003b364] 671a                      beq.s      edit_click_9
[0003b366] 907c 001e                 sub.w      #$001E,d0
[0003b36a] 6706                      beq.s      edit_click_7
[0003b36c] 5540                      subq.w     #2,d0
[0003b36e] 6710                      beq.s      edit_click_9
[0003b370] 601c                      bra.s      edit_click_10
edit_click_7:
[0003b372] 1405                      move.b     d5,d2
[0003b374] 2204                      move.l     d4,d1
[0003b376] 2003                      move.l     d3,d0
[0003b378] 204a                      movea.l    a2,a0
[0003b37a] 6100 fcca                 bsr        edit_forbracket
[0003b37e] 602c                      bra.s      edit_click_4
edit_click_9:
[0003b380] 1405                      move.b     d5,d2
[0003b382] 2204                      move.l     d4,d1
[0003b384] 2003                      move.l     d3,d0
[0003b386] 204a                      movea.l    a2,a0
[0003b388] 6100 fdce                 bsr        edit_backbracket
[0003b38c] 601e                      bra.s      edit_click_4
edit_click_10:
[0003b38e] 1005                      move.b     d5,d0
[0003b390] 4880                      ext.w      d0
[0003b392] 41ea 00a0                 lea.l      160(a2),a0
[0003b396] 4eb9 0008 2e8a            jsr        strchr
[0003b39c] 2008                      move.l     a0,d0
[0003b39e] 6600 ff78                 bne        edit_click_5
[0003b3a2] 2204                      move.l     d4,d1
[0003b3a4] 2003                      move.l     d3,d0
[0003b3a6] 204a                      movea.l    a2,a0
[0003b3a8] 6100 f328                 bsr        edit_selectword
edit_click_4:
[0003b3ac] 4fef 0010                 lea.l      16(a7),a7
[0003b3b0] 4cdf 1c38                 movem.l    (a7)+,d3-d5/a2-a4
[0003b3b4] 4e75                      rts

Aus_editor:
[0003b3b6] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003b3ba] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0003b3c0] 2052                      movea.l    (a2),a0
[0003b3c2] 3228 0260                 move.w     608(a0),d1
[0003b3c6] 48c1                      ext.l      d1
[0003b3c8] 2001                      move.l     d1,d0
[0003b3ca] d080                      add.l      d0,d0
[0003b3cc] d081                      add.l      d1,d0
[0003b3ce] e788                      lsl.l      #3,d0
[0003b3d0] 2668 025c                 movea.l    604(a0),a3
[0003b3d4] d7c0                      adda.l     d0,a3
[0003b3d6] 206b 000c                 movea.l    12(a3),a0
[0003b3da] 2868 000c                 movea.l    12(a0),a4
[0003b3de] 342c 0070                 move.w     112(a4),d2
[0003b3e2] b47c 0005                 cmp.w      #$0005,d2
[0003b3e6] 6200 015a                 bhi        Aus_editor_1
[0003b3ea] d442                      add.w      d2,d2
[0003b3ec] 343b 2006                 move.w     $0003B3F4(pc,d2.w),d2
[0003b3f0] 4efb 2002                 jmp        $0003B3F4(pc,d2.w)
J27:
[0003b3f4] 0052                      dc.w $0052   ; Aus_editor_2-J27
[0003b3f6] 000c                      dc.w $000c   ; Aus_editor_3-J27
[0003b3f8] 001c                      dc.w $001c   ; Aus_editor_4-J27
[0003b3fa] 002c                      dc.w $002c   ; Aus_editor_5-J27
[0003b3fc] 0042                      dc.w $0042   ; Aus_editor_6-J27
[0003b3fe] 00de                      dc.w $00de   ; Aus_editor_7-J27
Aus_editor_3:
[0003b400] 2052                      movea.l    (a2),a0
[0003b402] 3028 0264                 move.w     612(a0),d0
[0003b406] 204c                      movea.l    a4,a0
[0003b408] 6100 e1d2                 bsr        edit_01select
[0003b40c] 6000 0134                 bra        Aus_editor_1
Aus_editor_4:
[0003b410] 2052                      movea.l    (a2),a0
[0003b412] 3028 0264                 move.w     612(a0),d0
[0003b416] 204c                      movea.l    a4,a0
[0003b418] 6100 e0e0                 bsr        edit_1select
[0003b41c] 6000 0124                 bra        Aus_editor_1
Aus_editor_5:
[0003b420] 7401                      moveq.l    #1,d2
[0003b422] 2052                      movea.l    (a2),a0
[0003b424] 3228 0266                 move.w     614(a0),d1
[0003b428] 3028 0264                 move.w     612(a0),d0
[0003b42c] 204c                      movea.l    a4,a0
[0003b42e] 6100 e2fe                 bsr        edit_nselect
[0003b432] 6000 010e                 bra        Aus_editor_1
Aus_editor_6:
[0003b436] 2052                      movea.l    (a2),a0
[0003b438] 3028 0264                 move.w     612(a0),d0
[0003b43c] 204c                      movea.l    a4,a0
[0003b43e] 6100 e482                 bsr        edit_nmselect
[0003b442] 6000 00fe                 bra        Aus_editor_1
Aus_editor_2:
[0003b446] 93c9                      suba.l     a1,a1
[0003b448] 303c 00d5                 move.w     #$00D5,d0
[0003b44c] 204b                      movea.l    a3,a0
[0003b44e] 6100 f322                 bsr        Auo_editor
[0003b452] 302c 0012                 move.w     18(a4),d0
[0003b456] c07c 0200                 and.w      #$0200,d0
[0003b45a] 6618                      bne.s      Aus_editor_8
[0003b45c] 006c 0200 0012            ori.w      #$0200,18(a4)
[0003b462] 296c 0030 0038            move.l     48(a4),56(a4)
[0003b468] 296c 0034 003c            move.l     52(a4),60(a4)
[0003b46e] 296c 0040 0044            move.l     64(a4),68(a4)
Aus_editor_8:
[0003b474] 302b 000a                 move.w     10(a3),d0
[0003b478] c07c 4000                 and.w      #$4000,d0
[0003b47c] 6716                      beq.s      Aus_editor_9
[0003b47e] 2052                      movea.l    (a2),a0
[0003b480] 3428 0266                 move.w     614(a0),d2
[0003b484] 3228 0264                 move.w     612(a0),d1
[0003b488] 3028 0262                 move.w     610(a0),d0
[0003b48c] 204c                      movea.l    a4,a0
[0003b48e] 6100 fe02                 bsr        edit_click
[0003b492] 6014                      bra.s      Aus_editor_10
Aus_editor_9:
[0003b494] 2052                      movea.l    (a2),a0
[0003b496] 3428 0266                 move.w     614(a0),d2
[0003b49a] 3228 0264                 move.w     612(a0),d1
[0003b49e] 3028 0262                 move.w     610(a0),d0
[0003b4a2] 204c                      movea.l    a4,a0
[0003b4a4] 6100 e478                 bsr        edit_charselect
Aus_editor_10:
[0003b4a8] 202c 0030                 move.l     48(a4),d0
[0003b4ac] b0ac 0038                 cmp.l      56(a4),d0
[0003b4b0] 6600 007e                 bne.w      Aus_editor_11
[0003b4b4] 222c 0034                 move.l     52(a4),d1
[0003b4b8] b2ac 003c                 cmp.l      60(a4),d1
[0003b4bc] 6672                      bne.s      Aus_editor_11
[0003b4be] e788                      lsl.l      #3,d0
[0003b4c0] 206c 002c                 movea.l    44(a4),a0
[0003b4c4] 0270 fffe 0806            andi.w     #$FFFE,6(a0,d0.l)
Aus_editor_14:
[0003b4ca] 026c fdff 0012            andi.w     #$FDFF,18(a4)
[0003b4d0] 6064                      bra.s      Aus_editor_12
Aus_editor_7:
[0003b4d2] 93c9                      suba.l     a1,a1
[0003b4d4] 303c 00d5                 move.w     #$00D5,d0
[0003b4d8] 204b                      movea.l    a3,a0
[0003b4da] 6100 f296                 bsr        Auo_editor
[0003b4de] 302c 0012                 move.w     18(a4),d0
[0003b4e2] c07c 0200                 and.w      #$0200,d0
[0003b4e6] 6618                      bne.s      Aus_editor_13
[0003b4e8] 006c 0200 0012            ori.w      #$0200,18(a4)
[0003b4ee] 296c 0030 0038            move.l     48(a4),56(a4)
[0003b4f4] 296c 0034 003c            move.l     52(a4),60(a4)
[0003b4fa] 296c 0040 0044            move.l     64(a4),68(a4)
Aus_editor_13:
[0003b500] 2052                      movea.l    (a2),a0
[0003b502] 3428 0266                 move.w     614(a0),d2
[0003b506] 3228 0264                 move.w     612(a0),d1
[0003b50a] 3028 0262                 move.w     610(a0),d0
[0003b50e] 204c                      movea.l    a4,a0
[0003b510] 6100 e7b6                 bsr        edit_blkselect
[0003b514] 202c 0040                 move.l     64(a4),d0
[0003b518] b0ac 0044                 cmp.l      68(a4),d0
[0003b51c] 6612                      bne.s      Aus_editor_11
[0003b51e] 4242                      clr.w      d2
[0003b520] 222c 0038                 move.l     56(a4),d1
[0003b524] 202c 0030                 move.l     48(a4),d0
[0003b528] 204c                      movea.l    a4,a0
[0003b52a] 6100 e142                 bsr        edit_selrange
[0003b52e] 609a                      bra.s      Aus_editor_14
Aus_editor_11:
[0003b530] 006c 0200 0012            ori.w      #$0200,18(a4)
Aus_editor_12:
[0003b536] 93c9                      suba.l     a1,a1
[0003b538] 303c 00d6                 move.w     #$00D6,d0
[0003b53c] 204b                      movea.l    a3,a0
[0003b53e] 6100 f232                 bsr        Auo_editor
Aus_editor_1:
[0003b542] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003b546] 4e75                      rts

edit_restart:
[0003b548] 2f0a                      move.l     a2,-(a7)
[0003b54a] 2448                      movea.l    a0,a2
[0003b54c] 7008                      moveq.l    #8,d0
[0003b54e] 4eb9 0004 c608            jsr        Ax_malloc
[0003b554] 2008                      move.l     a0,d0
[0003b556] 6608                      bne.s      edit_restart_1
[0003b558] 006a 0001 009e            ori.w      #$0001,158(a2)
[0003b55e] 6022                      bra.s      edit_restart_2
edit_restart_1:
[0003b560] 4290                      clr.l      (a0)
[0003b562] 4240                      clr.w      d0
[0003b564] 3140 0004                 move.w     d0,4(a0)
[0003b568] 3140 0006                 move.w     d0,6(a0)
[0003b56c] 2548 002c                 move.l     a0,44(a2)
[0003b570] 257c 0000 0001 0024       move.l     #$00000001,36(a2)
[0003b578] 7000                      moveq.l    #0,d0
[0003b57a] 2540 0018                 move.l     d0,24(a2)
[0003b57e] 2540 0028                 move.l     d0,40(a2)
edit_restart_2:
[0003b582] 245f                      movea.l    (a7)+,a2
[0003b584] 4e75                      rts

create:
[0003b586] 2f0a                      move.l     a2,-(a7)
[0003b588] 2f0b                      move.l     a3,-(a7)
[0003b58a] 554f                      subq.w     #2,a7
[0003b58c] 2468 000c                 movea.l    12(a0),a2
[0003b590] 203c 0000 01a2            move.l     #$000001A2,d0
[0003b596] 4eb9 0004 c608            jsr        Ax_malloc
[0003b59c] 2648                      movea.l    a0,a3
[0003b59e] 200b                      move.l     a3,d0
[0003b5a0] 6604                      bne.s      create_1
[0003b5a2] 70ff                      moveq.l    #-1,d0
[0003b5a4] 606a                      bra.s      create_2
create_1:
[0003b5a6] 254b 000c                 move.l     a3,12(a2)
[0003b5aa] 203c 0000 01a2            move.l     #$000001A2,d0
[0003b5b0] 43f9 000c f1ca            lea.l      proto,a1
[0003b5b6] 204b                      movea.l    a3,a0
[0003b5b8] 4eb9 0008 3500            jsr        memcpy
[0003b5be] 322b 0002                 move.w     2(a3),d1
[0003b5c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003b5c8] 3028 0010                 move.w     16(a0),d0
[0003b5cc] 4eb9 0007 34e6            jsr        vst_font
[0003b5d2] 3740 0002                 move.w     d0,2(a3)
[0003b5d6] 486b 0006                 pea.l      6(a3)
[0003b5da] 486b 0008                 pea.l      8(a3)
[0003b5de] 43eb 0004                 lea.l      4(a3),a1
[0003b5e2] 41ef 0008                 lea.l      8(a7),a0
[0003b5e6] 2479 0010 ee4e            movea.l    ACSblk,a2
[0003b5ec] 322a 0018                 move.w     24(a2),d1
[0003b5f0] 302a 0010                 move.w     16(a2),d0
[0003b5f4] 4eb9 0007 3370            jsr        vst_height
[0003b5fa] 504f                      addq.w     #8,a7
[0003b5fc] 377c 0002 0070            move.w     #$0002,112(a3)
[0003b602] 377c 0004 009a            move.w     #$0004,154(a3)
[0003b608] 204b                      movea.l    a3,a0
[0003b60a] 6100 ff3c                 bsr        edit_restart
[0003b60e] 4240                      clr.w      d0
create_2:
[0003b610] 544f                      addq.w     #2,a7
[0003b612] 265f                      movea.l    (a7)+,a3
[0003b614] 245f                      movea.l    (a7)+,a2
[0003b616] 4e75                      rts

cleanup:
[0003b618] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003b61c] 594f                      subq.w     #4,a7
[0003b61e] 2448                      movea.l    a0,a2
[0003b620] 3600                      move.w     d0,d3
[0003b622] 266a 0062                 movea.l    98(a2),a3
[0003b626] 220b                      move.l     a3,d1
[0003b628] 674e                      beq.s      cleanup_1
[0003b62a] 286b 000c                 movea.l    12(a3),a4
[0003b62e] 7401                      moveq.l    #1,d2
[0003b630] d4aa 0028                 add.l      40(a2),d2
[0003b634] 2e82                      move.l     d2,(a7)
[0003b636] b4aa 000a                 cmp.l      10(a2),d2
[0003b63a] 6c04                      bge.s      cleanup_2
[0003b63c] 2eaa 000a                 move.l     10(a2),(a7)
cleanup_2:
[0003b640] 43d7                      lea.l      (a7),a1
[0003b642] 7064                      moveq.l    #100,d0
[0003b644] 204b                      movea.l    a3,a0
[0003b646] 2a6c 0008                 movea.l    8(a4),a5
[0003b64a] 4e95                      jsr        (a5)
[0003b64c] 43ea 000a                 lea.l      10(a2),a1
[0003b650] 7065                      moveq.l    #101,d0
[0003b652] 204b                      movea.l    a3,a0
[0003b654] 2a6c 0008                 movea.l    8(a4),a5
[0003b658] 4e95                      jsr        (a5)
[0003b65a] 43ea 0018                 lea.l      24(a2),a1
[0003b65e] 7011                      moveq.l    #17,d0
[0003b660] 204b                      movea.l    a3,a0
[0003b662] 2a6c 0008                 movea.l    8(a4),a5
[0003b666] 4e95                      jsr        (a5)
[0003b668] 4a43                      tst.w      d3
[0003b66a] 670c                      beq.s      cleanup_1
[0003b66c] 93c9                      suba.l     a1,a1
[0003b66e] 7005                      moveq.l    #5,d0
[0003b670] 204b                      movea.l    a3,a0
[0003b672] 2a6c 0008                 movea.l    8(a4),a5
[0003b676] 4e95                      jsr        (a5)
cleanup_1:
[0003b678] 266a 005e                 movea.l    94(a2),a3
[0003b67c] 200b                      move.l     a3,d0
[0003b67e] 673e                      beq.s      cleanup_3
[0003b680] 286b 000c                 movea.l    12(a3),a4
[0003b684] 43ea 0020                 lea.l      32(a2),a1
[0003b688] 204b                      movea.l    a3,a0
[0003b68a] 2a6c 0008                 movea.l    8(a4),a5
[0003b68e] 7064                      moveq.l    #100,d0
[0003b690] 4e95                      jsr        (a5)
[0003b692] 43ea 001c                 lea.l      28(a2),a1
[0003b696] 7011                      moveq.l    #17,d0
[0003b698] 204b                      movea.l    a3,a0
[0003b69a] 2a6c 0008                 movea.l    8(a4),a5
[0003b69e] 4e95                      jsr        (a5)
[0003b6a0] 43ea 000e                 lea.l      14(a2),a1
[0003b6a4] 7065                      moveq.l    #101,d0
[0003b6a6] 204b                      movea.l    a3,a0
[0003b6a8] 2a6c 0008                 movea.l    8(a4),a5
[0003b6ac] 4e95                      jsr        (a5)
[0003b6ae] 4a43                      tst.w      d3
[0003b6b0] 670c                      beq.s      cleanup_3
[0003b6b2] 93c9                      suba.l     a1,a1
[0003b6b4] 7005                      moveq.l    #5,d0
[0003b6b6] 204b                      movea.l    a3,a0
[0003b6b8] 246c 0008                 movea.l    8(a4),a2
[0003b6bc] 4e92                      jsr        (a2)
cleanup_3:
[0003b6be] 584f                      addq.w     #4,a7
[0003b6c0] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003b6c4] 4e75                      rts

horizontal:
[0003b6c6] 2f0a                      move.l     a2,-(a7)
[0003b6c8] 594f                      subq.w     #4,a7
[0003b6ca] 2e80                      move.l     d0,(a7)
[0003b6cc] 2468 0004                 movea.l    4(a0),a2
[0003b6d0] 43d7                      lea.l      (a7),a1
[0003b6d2] 204a                      movea.l    a2,a0
[0003b6d4] 303c 00d9                 move.w     #$00D9,d0
[0003b6d8] 6100 f098                 bsr        Auo_editor
[0003b6dc] 93c9                      suba.l     a1,a1
[0003b6de] 303c 00ef                 move.w     #$00EF,d0
[0003b6e2] 204a                      movea.l    a2,a0
[0003b6e4] 6100 f08c                 bsr        Auo_editor
[0003b6e8] 41f9 000c f36c            lea.l      $000CF36C,a0
[0003b6ee] 584f                      addq.w     #4,a7
[0003b6f0] 245f                      movea.l    (a7)+,a2
[0003b6f2] 4e75                      rts

vertical:
[0003b6f4] 2f0a                      move.l     a2,-(a7)
[0003b6f6] 594f                      subq.w     #4,a7
[0003b6f8] 2e80                      move.l     d0,(a7)
[0003b6fa] 2468 0004                 movea.l    4(a0),a2
[0003b6fe] 43d7                      lea.l      (a7),a1
[0003b700] 204a                      movea.l    a2,a0
[0003b702] 303c 00da                 move.w     #$00DA,d0
[0003b706] 6100 f06a                 bsr        Auo_editor
[0003b70a] 93c9                      suba.l     a1,a1
[0003b70c] 303c 00ef                 move.w     #$00EF,d0
[0003b710] 204a                      movea.l    a2,a0
[0003b712] 6100 f05e                 bsr        Auo_editor
[0003b716] 41f9 000c f36c            lea.l      $000CF36C,a0
[0003b71c] 584f                      addq.w     #4,a7
[0003b71e] 245f                      movea.l    (a7)+,a2
[0003b720] 4e75                      rts

wwputs:
[0003b722] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0003b726] 2a49                      movea.l    a1,a5
[0003b728] 4243                      clr.w      d3
[0003b72a] 3803                      move.w     d3,d4
[0003b72c] 2448                      movea.l    a0,a2
wwputs_8:
[0003b72e] 700a                      moveq.l    #10,d0
[0003b730] 204a                      movea.l    a2,a0
[0003b732] 4eb9 0008 2e8a            jsr        strchr
[0003b738] 2648                      movea.l    a0,a3
[0003b73a] 700d                      moveq.l    #13,d0
[0003b73c] 204a                      movea.l    a2,a0
[0003b73e] 4eb9 0008 2e8a            jsr        strchr
[0003b744] 2848                      movea.l    a0,a4
[0003b746] 200b                      move.l     a3,d0
[0003b748] 660e                      bne.s      wwputs_1
[0003b74a] 220c                      move.l     a4,d1
[0003b74c] 660a                      bne.s      wwputs_1
[0003b74e] 224a                      movea.l    a2,a1
[0003b750] 204d                      movea.l    a5,a0
[0003b752] 6100 e942                 bsr        edit_appline
[0003b756] 6052                      bra.s      wwputs_2
wwputs_1:
[0003b758] 200c                      move.l     a4,d0
[0003b75a] 6708                      beq.s      wwputs_3
[0003b75c] 220b                      move.l     a3,d1
[0003b75e] 6726                      beq.s      wwputs_4
[0003b760] b280                      cmp.l      d0,d1
[0003b762] 6422                      bcc.s      wwputs_4
wwputs_3:
[0003b764] 4213                      clr.b      (a3)
[0003b766] 224a                      movea.l    a2,a1
[0003b768] 204d                      movea.l    a5,a0
[0003b76a] 6100 e92a                 bsr        edit_appline
[0003b76e] 3800                      move.w     d0,d4
[0003b770] 16bc 000a                 move.b     #$0A,(a3)
[0003b774] 5240                      addq.w     #1,d0
[0003b776] 6708                      beq.s      wwputs_5
[0003b778] 204d                      movea.l    a5,a0
[0003b77a] 6100 d7a6                 bsr        edit_newline
[0003b77e] 3600                      move.w     d0,d3
wwputs_5:
[0003b780] 45eb 0001                 lea.l      1(a3),a2
[0003b784] 6014                      bra.s      wwputs_6
wwputs_4:
[0003b786] 4214                      clr.b      (a4)
[0003b788] 224a                      movea.l    a2,a1
[0003b78a] 204d                      movea.l    a5,a0
[0003b78c] 6100 e908                 bsr        edit_appline
[0003b790] 3800                      move.w     d0,d4
[0003b792] 18bc 000d                 move.b     #$0D,(a4)
[0003b796] 45ec 0001                 lea.l      1(a4),a2
wwputs_6:
[0003b79a] b87c ffff                 cmp.w      #$FFFF,d4
[0003b79e] 6708                      beq.s      wwputs_7
[0003b7a0] b67c ffff                 cmp.w      #$FFFF,d3
[0003b7a4] 6600 ff88                 bne.w      wwputs_8
wwputs_7:
[0003b7a8] 70ff                      moveq.l    #-1,d0
wwputs_2:
[0003b7aa] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0003b7ae] 4e75                      rts

uvprintf:
[0003b7b0] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003b7b4] 2448                      movea.l    a0,a2
[0003b7b6] 2849                      movea.l    a1,a4
[0003b7b8] 266a 000c                 movea.l    12(a2),a3
[0003b7bc] 4bf9 0010 c83e            lea.l      buffer,a5
[0003b7c2] 2f2f 0018                 move.l     24(a7),-(a7)
[0003b7c6] 224c                      movea.l    a4,a1
[0003b7c8] 204d                      movea.l    a5,a0
[0003b7ca] 4eb9 0008 15de            jsr        vsprintf
[0003b7d0] 584f                      addq.w     #4,a7
[0003b7d2] 3600                      move.w     d0,d3
[0003b7d4] 224a                      movea.l    a2,a1
[0003b7d6] 204d                      movea.l    a5,a0
[0003b7d8] 6100 ff48                 bsr        wwputs
[0003b7dc] 93c9                      suba.l     a1,a1
[0003b7de] 7005                      moveq.l    #5,d0
[0003b7e0] 204a                      movea.l    a2,a0
[0003b7e2] 286b 0008                 movea.l    8(a3),a4
[0003b7e6] 4e94                      jsr        (a4)
[0003b7e8] 3003                      move.w     d3,d0
[0003b7ea] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003b7ee] 4e75                      rts

	.data

proto:
[000cf1ca]                           dc.w $0001
[000cf1cc]                           dc.w $0001
[000cf1ce]                           dc.w $0000
[000cf1d0]                           dc.w $0000
[000cf1d2]                           dc.w $0000
[000cf1d4]                           dc.w $0000
[000cf1d6]                           dc.w $0000
[000cf1d8]                           dc.w $0000
[000cf1da]                           dc.w $0000
[000cf1dc]                           dc.w $0001
[000cf1de]                           dc.w $0000
[000cf1e0]                           dc.w $0200
[000cf1e2]                           dc.w $0000
[000cf1e4]                           dc.w $0000
[000cf1e6]                           dc.w $0000
[000cf1e8]                           dc.w $0000
[000cf1ea]                           dc.w $0000
[000cf1ec]                           dc.w $0200
[000cf1ee]                           dc.w $0000
[000cf1f0]                           dc.w $0001
[000cf1f2]                           dc.w $0000
[000cf1f4]                           dc.w $0000
[000cf1f6]                           dc.w $0000
[000cf1f8]                           dc.w $0000
[000cf1fa]                           dc.w $0000
[000cf1fc]                           dc.w $0000
[000cf1fe]                           dc.w $0000
[000cf200]                           dc.w $0000
[000cf202]                           dc.w $0000
[000cf204]                           dc.w $0000
[000cf206]                           dc.w $0000
[000cf208]                           dc.w $0000
[000cf20a]                           dc.w $0000
[000cf20c]                           dc.w $0000
[000cf20e]                           dc.w $0000
[000cf210]                           dc.w $0000
[000cf212]                           dc.w $0000
[000cf214]                           dc.w $0000
[000cf216]                           dc.w $0000
[000cf218]                           dc.w $0000
[000cf21a]                           dc.w $0000
[000cf21c]                           dc.w $0000
[000cf21e]                           dc.w $0000
[000cf220]                           dc.w $0000
[000cf222]                           dc.w $0000
[000cf224]                           dc.w $0000
[000cf226]                           dc.w $0000
[000cf228]                           dc.w $0000
[000cf22a]                           dc.w $0000
[000cf22c]                           dc.w $0000
[000cf22e]                           dc.w $0000
[000cf230]                           dc.w $0000
[000cf232]                           dc.w $0000
[000cf234]                           dc.w $0000
[000cf236]                           dc.w $0000
[000cf238]                           dc.w $0000
[000cf23a]                           dc.w $0000
[000cf23c]                           dc.w $0000
[000cf23e]                           dc.w $0000
[000cf240]                           dc.w $0000
[000cf242]                           dc.w $0000
[000cf244]                           dc.w $0000
[000cf246]                           dc.w $0000
[000cf248]                           dc.w $0000
[000cf24a]                           dc.w $0000
[000cf24c]                           dc.w $0000
[000cf24e]                           dc.w $0000
[000cf250]                           dc.w $0000
[000cf252]                           dc.w $0000
[000cf254]                           dc.w $0000
[000cf256]                           dc.w $0000
[000cf258]                           dc.w $0000
[000cf25a]                           dc.w $0000
[000cf25c]                           dc.w $0000
[000cf25e]                           dc.w $0000
[000cf260]                           dc.w $0000
[000cf262]                           dc.w $0000
[000cf264]                           dc.w $0000
[000cf266]                           dc.w $0000
[000cf268]                           dc.w $0000
[000cf26a]                           dc.b ' ',$09,'=+-*/()!&|[]{}<>,.;:'
[000cf280]                           dc.w $dd24
[000cf282]                           dc.b '%?`'^#~@\"',0
[000cf28d]                           dc.b $00
[000cf28e]                           dc.w $0000
[000cf290]                           dc.w $0000
[000cf292]                           dc.w $0000
[000cf294]                           dc.w $0000
[000cf296]                           dc.w $0000
[000cf298]                           dc.w $0000
[000cf29a]                           dc.w $0000
[000cf29c]                           dc.w $0000
[000cf29e]                           dc.w $0000
[000cf2a0]                           dc.w $0000
[000cf2a2]                           dc.w $0000
[000cf2a4]                           dc.w $0000
[000cf2a6]                           dc.w $0000
[000cf2a8]                           dc.w $0000
[000cf2aa]                           dc.w $0000
[000cf2ac]                           dc.w $0000
[000cf2ae]                           dc.w $0000
[000cf2b0]                           dc.w $0000
[000cf2b2]                           dc.w $0000
[000cf2b4]                           dc.w $0000
[000cf2b6]                           dc.w $0000
[000cf2b8]                           dc.w $0000
[000cf2ba]                           dc.w $0000
[000cf2bc]                           dc.w $0000
[000cf2be]                           dc.w $0000
[000cf2c0]                           dc.w $0000
[000cf2c2]                           dc.w $0000
[000cf2c4]                           dc.w $0000
[000cf2c6]                           dc.w $0000
[000cf2c8]                           dc.w $0000
[000cf2ca]                           dc.w $0000
[000cf2cc]                           dc.w $0000
[000cf2ce]                           dc.w $0000
[000cf2d0]                           dc.w $0000
[000cf2d2]                           dc.w $0000
[000cf2d4]                           dc.w $0000
[000cf2d6]                           dc.w $0000
[000cf2d8]                           dc.w $0000
[000cf2da]                           dc.w $0000
[000cf2dc]                           dc.w $0000
[000cf2de]                           dc.w $0000
[000cf2e0]                           dc.w $0000
[000cf2e2]                           dc.w $0000
[000cf2e4]                           dc.w $0000
[000cf2e6]                           dc.w $0000
[000cf2e8]                           dc.w $0000
[000cf2ea]                           dc.w $0000
[000cf2ec]                           dc.w $0000
[000cf2ee]                           dc.w $0000
[000cf2f0]                           dc.w $0000
[000cf2f2]                           dc.w $0000
[000cf2f4]                           dc.w $0000
[000cf2f6]                           dc.w $0000
[000cf2f8]                           dc.w $0000
[000cf2fa]                           dc.w $0000
[000cf2fc]                           dc.w $0000
[000cf2fe]                           dc.w $0000
[000cf300]                           dc.w $0000
[000cf302]                           dc.w $0000
[000cf304]                           dc.w $0000
[000cf306]                           dc.w $0000
[000cf308]                           dc.w $0000
[000cf30a]                           dc.w $0000
[000cf30c]                           dc.w $0000
[000cf30e]                           dc.w $0000
[000cf310]                           dc.w $0000
[000cf312]                           dc.w $0000
[000cf314]                           dc.w $0000
[000cf316]                           dc.w $0000
[000cf318]                           dc.w $0000
[000cf31a]                           dc.w $0000
[000cf31c]                           dc.w $0000
[000cf31e]                           dc.w $0000
[000cf320]                           dc.w $0000
[000cf322]                           dc.w $0000
[000cf324]                           dc.w $0000
[000cf326]                           dc.w $0000
[000cf328]                           dc.w $0000
[000cf32a]                           dc.w $0000
[000cf32c]                           dc.w $0000
[000cf32e]                           dc.w $0000
[000cf330]                           dc.w $0000
[000cf332]                           dc.w $0000
[000cf334]                           dc.w $0000
[000cf336]                           dc.w $0000
[000cf338]                           dc.w $0000
[000cf33a]                           dc.w $0000
[000cf33c]                           dc.w $0000
[000cf33e]                           dc.w $0000
[000cf340]                           dc.w $0000
[000cf342]                           dc.w $0000
[000cf344]                           dc.w $0000
[000cf346]                           dc.w $0000
[000cf348]                           dc.w $0000
[000cf34a]                           dc.w $0000
[000cf34c]                           dc.w $0000
[000cf34e]                           dc.w $0000
[000cf350]                           dc.w $0000
[000cf352]                           dc.w $0000
[000cf354]                           dc.w $0000
[000cf356]                           dc.w $0000
[000cf358]                           dc.w $0000
[000cf35a]                           dc.w $0000
[000cf35c]                           dc.w $0000
[000cf35e]                           dc.w $0000
[000cf360]                           dc.w $0000
[000cf362]                           dc.w $0000
[000cf364]                           dc.w $0000
[000cf366]                           dc.w $0000
[000cf368]                           dc.w $0000
[000cf36a]                           dc.w $0000
[000cf36c]                           dc.b 0
[000cf36d]                           dc.b 'Nichts gefunden.',0
[000cf37e]                           dc.b 'Keine Klammer.',0
[000cf38d]                           dc.b $00
