mod_height:
[00040b72] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00040b76] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040b7c] 2668 025c                 movea.l    604(a0),a3
[00040b80] 4eb9 0003 b3b6            jsr        Aus_editor
[00040b86] 45f9 0010 ee4a            lea.l      height,a2
[00040b8c] 302a 0002                 move.w     2(a2),d0
[00040b90] 674e                      beq.s      $00040BE0
[00040b92] 3612                      move.w     (a2),d3
[00040b94] 4852                      pea.l      (a2)
[00040b96] 43f9 000d 4ec2            lea.l      $000D4EC2,a1
[00040b9c] 204b                      movea.l    a3,a0
[00040b9e] 7014                      moveq.l    #20,d0
[00040ba0] 4eb9 0005 10fe            jsr        Aob_scanf
[00040ba6] 584f                      addq.w     #4,a7
[00040ba8] b652                      cmp.w      (a2),d3
[00040baa] 6734                      beq.s      $00040BE0
[00040bac] 47eb 00d8                 lea.l      216(a3),a3
[00040bb0] 286b 000c                 movea.l    12(a3),a4
[00040bb4] 224a                      movea.l    a2,a1
[00040bb6] 303c 012d                 move.w     #$012D,d0
[00040bba] 204b                      movea.l    a3,a0
[00040bbc] 2a6c 0008                 movea.l    8(a4),a5
[00040bc0] 4e95                      jsr        (a5)
[00040bc2] 72ff                      moveq.l    #-1,d1
[00040bc4] 7008                      moveq.l    #8,d0
[00040bc6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040bcc] 2068 0258                 movea.l    600(a0),a0
[00040bd0] 2279 0010 ee4e            movea.l    ACSblk,a1
[00040bd6] 2469 0258                 movea.l    600(a1),a2
[00040bda] 226a 0066                 movea.l    102(a2),a1
[00040bde] 4e91                      jsr        (a1)
[00040be0] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00040be4] 4e75                      rts
liveheight:
[00040be6] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00040bea] 594f                      subq.w     #4,a7
[00040bec] 2849                      movea.l    a1,a4
[00040bee] 45f9 0010 ee4a            lea.l      height,a2
[00040bf4] 3612                      move.w     (a2),d3
[00040bf6] 2648                      movea.l    a0,a3
[00040bf8] 0c14 0020                 cmpi.b     #$20,(a4)
[00040bfc] 6650                      bne.s      $00040C4E
[00040bfe] 486f 0002                 pea.l      2(a7)
[00040c02] 43f9 000d 4ec2            lea.l      $000D4EC2,a1
[00040c08] 204c                      movea.l    a4,a0
[00040c0a] 4eb9 0008 1b26            jsr        sscanf
[00040c10] 584f                      addq.w     #4,a7
[00040c12] 322a fffe                 move.w     -2(a2),d1
[00040c16] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040c1c] 3028 0010                 move.w     16(a0),d0
[00040c20] 4eb9 0007 34e6            jsr        vst_font
[00040c26] 4857                      pea.l      (a7)
[00040c28] 486f 0004                 pea.l      4(a7)
[00040c2c] 224a                      movea.l    a2,a1
[00040c2e] 41ef 0008                 lea.l      8(a7),a0
[00040c32] 322f 000a                 move.w     10(a7),d1
[00040c36] 2879 0010 ee4e            movea.l    ACSblk,a4
[00040c3c] 302c 0010                 move.w     16(a4),d0
[00040c40] 4eb9 0007 3402            jsr        vst_point
[00040c46] 504f                      addq.w     #8,a7
[00040c48] 426a 0002                 clr.w      2(a2)
[00040c4c] 601a                      bra.s      $00040C68
[00040c4e] 4852                      pea.l      (a2)
[00040c50] 43f9 000d 4ec2            lea.l      $000D4EC2,a1
[00040c56] 7014                      moveq.l    #20,d0
[00040c58] 204b                      movea.l    a3,a0
[00040c5a] 4eb9 0005 10fe            jsr        Aob_scanf
[00040c60] 584f                      addq.w     #4,a7
[00040c62] 357c 0001 0002            move.w     #$0001,2(a2)
[00040c68] b652                      cmp.w      (a2),d3
[00040c6a] 6734                      beq.s      $00040CA0
[00040c6c] 49eb 00d8                 lea.l      216(a3),a4
[00040c70] 266c 000c                 movea.l    12(a4),a3
[00040c74] 224a                      movea.l    a2,a1
[00040c76] 303c 012d                 move.w     #$012D,d0
[00040c7a] 204c                      movea.l    a4,a0
[00040c7c] 2a6b 0008                 movea.l    8(a3),a5
[00040c80] 4e95                      jsr        (a5)
[00040c82] 72ff                      moveq.l    #-1,d1
[00040c84] 7008                      moveq.l    #8,d0
[00040c86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040c8c] 2068 0258                 movea.l    600(a0),a0
[00040c90] 2279 0010 ee4e            movea.l    ACSblk,a1
[00040c96] 2469 0258                 movea.l    600(a1),a2
[00040c9a] 226a 0066                 movea.l    102(a2),a1
[00040c9e] 4e91                      jsr        (a1)
[00040ca0] 584f                      addq.w     #4,a7
[00040ca2] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00040ca6] 4e75                      rts
set_font:
[00040ca8] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[00040cac] 4fef ffd8                 lea.l      -40(a7),a7
[00040cb0] 2448                      movea.l    a0,a2
[00040cb2] 3600                      move.w     d0,d3
[00040cb4] 4879 0010 ee4a            pea.l      height
[00040cba] 43f9 000d 4ec2            lea.l      $000D4EC2,a1
[00040cc0] 7014                      moveq.l    #20,d0
[00040cc2] 4eb9 0005 10fe            jsr        Aob_scanf
[00040cc8] 584f                      addq.w     #4,a7
[00040cca] 3203                      move.w     d3,d1
[00040ccc] 48c1                      ext.l      d1
[00040cce] 2001                      move.l     d1,d0
[00040cd0] e988                      lsl.l      #4,d0
[00040cd2] 9081                      sub.l      d1,d0
[00040cd4] e588                      lsl.l      #2,d0
[00040cd6] 2079 0010 ee42            movea.l    table,a0
[00040cdc] d1c0                      adda.l     d0,a0
[00040cde] 2f48 0010                 move.l     a0,16(a7)
[00040ce2] 33e8 0022 0010 ee48       move.w     34(a0),fontid
[00040cea] 43ea 00d8                 lea.l      216(a2),a1
[00040cee] 2f49 0014                 move.l     a1,20(a7)
[00040cf2] 2a69 000c                 movea.l    12(a1),a5
[00040cf6] 43f9 0010 ee48            lea.l      fontid,a1
[00040cfc] 266d 0008                 movea.l    8(a5),a3
[00040d00] 206f 0014                 movea.l    20(a7),a0
[00040d04] 303c 012c                 move.w     #$012C,d0
[00040d08] 4e93                      jsr        (a3)
[00040d0a] 43f9 0010 ee4a            lea.l      height,a1
[00040d10] 303c 012d                 move.w     #$012D,d0
[00040d14] 206f 0014                 movea.l    20(a7),a0
[00040d18] 266d 0008                 movea.l    8(a5),a3
[00040d1c] 4e93                      jsr        (a3)
[00040d1e] 4bea 0168                 lea.l      360(a2),a5
[00040d22] 93c9                      suba.l     a1,a1
[00040d24] 303c 00ce                 move.w     #$00CE,d0
[00040d28] 204d                      movea.l    a5,a0
[00040d2a] 4eb9 0003 a772            jsr        Auo_editor
[00040d30] 76ff                      moveq.l    #-1,d3
[00040d32] 3239 0010 ee48            move.w     fontid,d1
[00040d38] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040d3e] 3028 0010                 move.w     16(a0),d0
[00040d42] 4eb9 0007 34e6            jsr        vst_font
[00040d48] 4244                      clr.w      d4
[00040d4a] 45ef 0004                 lea.l      4(a7),a2
[00040d4e] 47ef 0002                 lea.l      2(a7),a3
[00040d52] 6078                      bra.s      $00040DCC
[00040d54] 3004                      move.w     d4,d0
[00040d56] 48c0                      ext.l      d0
[00040d58] d080                      add.l      d0,d0
[00040d5a] 206f 0010                 movea.l    16(a7),a0
[00040d5e] 3a30 0824                 move.w     36(a0,d0.l),d5
[00040d62] 4a45                      tst.w      d5
[00040d64] 6f64                      ble.s      $00040DCA
[00040d66] 3f05                      move.w     d5,-(a7)
[00040d68] 43f9 000d 4ec5            lea.l      $000D4EC5,a1
[00040d6e] 204a                      movea.l    a2,a0
[00040d70] 4eb9 0008 15ac            jsr        sprintf
[00040d76] 544f                      addq.w     #2,a7
[00040d78] 224a                      movea.l    a2,a1
[00040d7a] 303c 00cc                 move.w     #$00CC,d0
[00040d7e] 204d                      movea.l    a5,a0
[00040d80] 4eb9 0003 a772            jsr        Auo_editor
[00040d86] 93c9                      suba.l     a1,a1
[00040d88] 303c 00cb                 move.w     #$00CB,d0
[00040d8c] 204d                      movea.l    a5,a0
[00040d8e] 4eb9 0003 a772            jsr        Auo_editor
[00040d94] 4853                      pea.l      (a3)
[00040d96] 4853                      pea.l      (a3)
[00040d98] 43ef 0008                 lea.l      8(a7),a1
[00040d9c] 204b                      movea.l    a3,a0
[00040d9e] 3205                      move.w     d5,d1
[00040da0] 2879 0010 ee4e            movea.l    ACSblk,a4
[00040da6] 302c 0010                 move.w     16(a4),d0
[00040daa] 4eb9 0007 3402            jsr        vst_point
[00040db0] 504f                      addq.w     #8,a7
[00040db2] 4a43                      tst.w      d3
[00040db4] 6a14                      bpl.s      $00040DCA
[00040db6] 5343                      subq.w     #1,d3
[00040db8] 3017                      move.w     (a7),d0
[00040dba] b079 0010 ee4a            cmp.w      height,d0
[00040dc0] 6608                      bne.s      $00040DCA
[00040dc2] 3203                      move.w     d3,d1
[00040dc4] 4441                      neg.w      d1
[00040dc6] 5541                      subq.w     #2,d1
[00040dc8] 3601                      move.w     d1,d3
[00040dca] 5244                      addq.w     #1,d4
[00040dcc] b87c 000c                 cmp.w      #$000C,d4
[00040dd0] 6d00 ff82                 blt.w      $00040D54
[00040dd4] 43f9 000d 4ec9            lea.l      $000D4EC9,a1
[00040dda] 303c 00cc                 move.w     #$00CC,d0
[00040dde] 204d                      movea.l    a5,a0
[00040de0] 4eb9 0003 a772            jsr        Auo_editor
[00040de6] 49ef 0018                 lea.l      24(a7),a4
[00040dea] 4a43                      tst.w      d3
[00040dec] 6a1e                      bpl.s      $00040E0C
[00040dee] 43ef 000c                 lea.l      12(a7),a1
[00040df2] 303c 00e9                 move.w     #$00E9,d0
[00040df6] 204d                      movea.l    a5,a0
[00040df8] 4eb9 0003 a772            jsr        Auo_editor
[00040dfe] 70ff                      moveq.l    #-1,d0
[00040e00] d0af 000c                 add.l      12(a7),d0
[00040e04] 2940 0008                 move.l     d0,8(a4)
[00040e08] 2880                      move.l     d0,(a4)
[00040e0a] 600a                      bra.s      $00040E16
[00040e0c] 3003                      move.w     d3,d0
[00040e0e] 48c0                      ext.l      d0
[00040e10] 2940 0008                 move.l     d0,8(a4)
[00040e14] 2880                      move.l     d0,(a4)
[00040e16] 7000                      moveq.l    #0,d0
[00040e18] 2940 000c                 move.l     d0,12(a4)
[00040e1c] 2940 0004                 move.l     d0,4(a4)
[00040e20] 224c                      movea.l    a4,a1
[00040e22] 204d                      movea.l    a5,a0
[00040e24] 303c 00e4                 move.w     #$00E4,d0
[00040e28] 4eb9 0003 a772            jsr        Auo_editor
[00040e2e] 93c9                      suba.l     a1,a1
[00040e30] 303c 00db                 move.w     #$00DB,d0
[00040e34] 204d                      movea.l    a5,a0
[00040e36] 4eb9 0003 a772            jsr        Auo_editor
[00040e3c] 33fc 0001 0010 ee4c       move.w     #$0001,pixel
[00040e44] 4fef 0028                 lea.l      40(a7),a7
[00040e48] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[00040e4c] 4e75                      rts
livefont:
[00040e4e] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[00040e52] 594f                      subq.w     #4,a7
[00040e54] 2448                      movea.l    a0,a2
[00040e56] 2e89                      move.l     a1,(a7)
[00040e58] 2648                      movea.l    a0,a3
[00040e5a] 286b 0174                 movea.l    372(a3),a4
[00040e5e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00040e64] 2a69 0258                 movea.l    600(a1),a5
[00040e68] 4243                      clr.w      d3
[00040e6a] 6046                      bra.s      $00040EB2
[00040e6c] 3203                      move.w     d3,d1
[00040e6e] 48c1                      ext.l      d1
[00040e70] 2001                      move.l     d1,d0
[00040e72] e988                      lsl.l      #4,d0
[00040e74] 9081                      sub.l      d1,d0
[00040e76] e588                      lsl.l      #2,d0
[00040e78] 2279 0010 ee42            movea.l    table,a1
[00040e7e] d3c0                      adda.l     d0,a1
[00040e80] 2057                      movea.l    (a7),a0
[00040e82] 4eb9 0008 2eba            jsr        strcmp
[00040e88] 4a40                      tst.w      d0
[00040e8a] 6624                      bne.s      $00040EB0
[00040e8c] 3003                      move.w     d3,d0
[00040e8e] 204a                      movea.l    a2,a0
[00040e90] 6100 fe16                 bsr        set_font
[00040e94] 72ff                      moveq.l    #-1,d1
[00040e96] 7008                      moveq.l    #8,d0
[00040e98] 204d                      movea.l    a5,a0
[00040e9a] 226d 0066                 movea.l    102(a5),a1
[00040e9e] 4e91                      jsr        (a1)
[00040ea0] 93c9                      suba.l     a1,a1
[00040ea2] 7006                      moveq.l    #6,d0
[00040ea4] 41eb 0168                 lea.l      360(a3),a0
[00040ea8] 2c6c 0008                 movea.l    8(a4),a6
[00040eac] 4e96                      jsr        (a6)
[00040eae] 600a                      bra.s      $00040EBA
[00040eb0] 5243                      addq.w     #1,d3
[00040eb2] b679 0010 ee46            cmp.w      fonts,d3
[00040eb8] 6db2                      blt.s      $00040E6C
[00040eba] 584f                      addq.w     #4,a7
[00040ebc] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[00040ec0] 4e75                      rts
get_fontinfo:
[00040ec2] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[00040ec6] 4fef ff76                 lea.l      -138(a7),a7
[00040eca] 2f48 0086                 move.l     a0,134(a7)
[00040ece] 3a00                      move.w     d0,d5
[00040ed0] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00040ed6] 2052                      movea.l    (a2),a0
[00040ed8] 3228 0284                 move.w     644(a0),d1
[00040edc] 48c1                      ext.l      d1
[00040ede] 2001                      move.l     d1,d0
[00040ee0] e988                      lsl.l      #4,d0
[00040ee2] 9081                      sub.l      d1,d0
[00040ee4] e588                      lsl.l      #2,d0
[00040ee6] 4eb9 0004 c608            jsr        Ax_malloc
[00040eec] 23c8 0010 ee42            move.l     a0,table
[00040ef2] 6606                      bne.s      $00040EFA
[00040ef4] 4240                      clr.w      d0
[00040ef6] 6000 017e                 bra        $00041076
[00040efa] 4eb9 0004 eec0            jsr        Amo_busy
[00040f00] 2679 0010 ee42            movea.l    table,a3
[00040f06] 33fc 0001 0010 ee46       move.w     #$0001,fonts
[00040f0e] 7601                      moveq.l    #1,d3
[00040f10] 4bef 0084                 lea.l      132(a7),a5
[00040f14] 49ef 0080                 lea.l      128(a7),a4
[00040f18] 6000 014a                 bra        $00041064
[00040f1c] 204b                      movea.l    a3,a0
[00040f1e] 3203                      move.w     d3,d1
[00040f20] 2252                      movea.l    (a2),a1
[00040f22] 3029 0010                 move.w     16(a1),d0
[00040f26] 4eb9 0007 5734            jsr        vqt_name
[00040f2c] 3740 0022                 move.w     d0,34(a3)
[00040f30] 3200                      move.w     d0,d1
[00040f32] 2052                      movea.l    (a2),a0
[00040f34] 3028 0010                 move.w     16(a0),d0
[00040f38] 4eb9 0007 34e6            jsr        vst_font
[00040f3e] 4855                      pea.l      (a5)
[00040f40] 4855                      pea.l      (a5)
[00040f42] 224d                      movea.l    a5,a1
[00040f44] 204d                      movea.l    a5,a0
[00040f46] 323c 00c8                 move.w     #$00C8,d1
[00040f4a] 2c52                      movea.l    (a2),a6
[00040f4c] 302e 0010                 move.w     16(a6),d0
[00040f50] 4eb9 0007 3402            jsr        vst_point
[00040f56] 504f                      addq.w     #8,a7
[00040f58] 3800                      move.w     d0,d4
[00040f5a] b07c 00c8                 cmp.w      #$00C8,d0
[00040f5e] 6e00 0102                 bgt        $00041062
[00040f62] 5340                      subq.w     #1,d0
[00040f64] 6d00 00fc                 blt        $00041062
[00040f68] 4a45                      tst.w      d5
[00040f6a] 6600 0080                 bne        $00040FEC
[00040f6e] 486f 0074                 pea.l      116(a7)
[00040f72] 486f 0082                 pea.l      130(a7)
[00040f76] 486f 007c                 pea.l      124(a7)
[00040f7a] 224c                      movea.l    a4,a1
[00040f7c] 41ef 008e                 lea.l      142(a7),a0
[00040f80] 2c52                      movea.l    (a2),a6
[00040f82] 302e 0010                 move.w     16(a6),d0
[00040f86] 4eb9 0007 59de            jsr        vqt_fontinfo
[00040f8c] 4fef 000c                 lea.l      12(a7),a7
[00040f90] 4255                      clr.w      (a5)
[00040f92] 0c6f 0020 0082            cmpi.w     #$0020,130(a7)
[00040f98] 6c04                      bge.s      $00040F9E
[00040f9a] 7c20                      moveq.l    #32,d6
[00040f9c] 6004                      bra.s      $00040FA2
[00040f9e] 3c2f 0082                 move.w     130(a7),d6
[00040fa2] 600a                      bra.s      $00040FAE
[00040fa4] 3015                      move.w     (a5),d0
[00040fa6] 1f86 0000                 move.b     d6,0(a7,d0.w)
[00040faa] 5255                      addq.w     #1,(a5)
[00040fac] 5246                      addq.w     #1,d6
[00040fae] 0c54 0080                 cmpi.w     #$0080,(a4)
[00040fb2] 6c04                      bge.s      $00040FB8
[00040fb4] 3014                      move.w     (a4),d0
[00040fb6] 6004                      bra.s      $00040FBC
[00040fb8] 303c 0080                 move.w     #$0080,d0
[00040fbc] bc40                      cmp.w      d0,d6
[00040fbe] 6fe4                      ble.s      $00040FA4
[00040fc0] 3015                      move.w     (a5),d0
[00040fc2] 4237 0000                 clr.b      0(a7,d0.w)
[00040fc6] 43ef 0064                 lea.l      100(a7),a1
[00040fca] 41d7                      lea.l      (a7),a0
[00040fcc] 2c52                      movea.l    (a2),a6
[00040fce] 302e 0010                 move.w     16(a6),d0
[00040fd2] 4eb9 0007 55fe            jsr        vqt_extent
[00040fd8] 302f 0068                 move.w     104(a7),d0
[00040fdc] d06f 0064                 add.w      100(a7),d0
[00040fe0] 48c0                      ext.l      d0
[00040fe2] 81d5                      divs.w     (a5),d0
[00040fe4] b06f 007e                 cmp.w      126(a7),d0
[00040fe8] 6600 0078                 bne.w      $00041062
[00040fec] b67c 0001                 cmp.w      #$0001,d3
[00040ff0] 6f10                      ble.s      $00041002
[00040ff2] 93c9                      suba.l     a1,a1
[00040ff4] 303c 00cb                 move.w     #$00CB,d0
[00040ff8] 206f 0086                 movea.l    134(a7),a0
[00040ffc] 4eb9 0003 a772            jsr        Auo_editor
[00041002] 224b                      movea.l    a3,a1
[00041004] 303c 00cc                 move.w     #$00CC,d0
[00041008] 206f 0086                 movea.l    134(a7),a0
[0004100c] 4eb9 0003 a772            jsr        Auo_editor
[00041012] 3e3c 00c8                 move.w     #$00C8,d7
[00041016] 7c0b                      moveq.l    #11,d6
[00041018] 603a                      bra.s      $00041054
[0004101a] 4855                      pea.l      (a5)
[0004101c] 4855                      pea.l      (a5)
[0004101e] 224d                      movea.l    a5,a1
[00041020] 204d                      movea.l    a5,a0
[00041022] 72ff                      moveq.l    #-1,d1
[00041024] d247                      add.w      d7,d1
[00041026] 2c52                      movea.l    (a2),a6
[00041028] 302e 0010                 move.w     16(a6),d0
[0004102c] 4eb9 0007 3402            jsr        vst_point
[00041032] 504f                      addq.w     #8,a7
[00041034] 3800                      move.w     d0,d4
[00041036] b047                      cmp.w      d7,d0
[00041038] 660c                      bne.s      $00041046
[0004103a] 3206                      move.w     d6,d1
[0004103c] 48c1                      ext.l      d1
[0004103e] d281                      add.l      d1,d1
[00041040] 4273 1824                 clr.w      36(a3,d1.l)
[00041044] 600c                      bra.s      $00041052
[00041046] 3006                      move.w     d6,d0
[00041048] 48c0                      ext.l      d0
[0004104a] d080                      add.l      d0,d0
[0004104c] 3784 0824                 move.w     d4,36(a3,d0.l)
[00041050] 3e04                      move.w     d4,d7
[00041052] 5346                      subq.w     #1,d6
[00041054] 4a46                      tst.w      d6
[00041056] 6ac2                      bpl.s      $0004101A
[00041058] 5279 0010 ee46            addq.w     #1,fonts
[0004105e] 47eb 003c                 lea.l      60(a3),a3
[00041062] 5243                      addq.w     #1,d3
[00041064] 2052                      movea.l    (a2),a0
[00041066] b668 0284                 cmp.w      644(a0),d3
[0004106a] 6f00 feb0                 ble        $00040F1C
[0004106e] 4eb9 0004 ef0c            jsr        Amo_unbusy
[00041074] 7001                      moveq.l    #1,d0
[00041076] 4fef 008a                 lea.l      138(a7),a7
[0004107a] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0004107e] 4e75                      rts
serv_wi_font:
[00041080] 2f0a                      move.l     a2,-(a7)
[00041082] 2448                      movea.l    a0,a2
[00041084] 3200                      move.w     d0,d1
[00041086] 5541                      subq.w     #2,d1
[00041088] 6708                      beq.s      $00041092
[0004108a] 927c 0018                 sub.w      #$0018,d1
[0004108e] 670c                      beq.s      $0004109C
[00041090] 602c                      bra.s      $000410BE
[00041092] 204a                      movea.l    a2,a0
[00041094] 4eb9 0005 85f2            jsr        Awi_delete
[0004109a] 6026                      bra.s      $000410C2
[0004109c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000410a2] 214a 0258                 move.l     a2,600(a0)
[000410a6] 206a 0014                 movea.l    20(a2),a0
[000410aa] 41e8 0168                 lea.l      360(a0),a0
[000410ae] 2448                      movea.l    a0,a2
[000410b0] 93c9                      suba.l     a1,a1
[000410b2] 303c 00e6                 move.w     #$00E6,d0
[000410b6] 4eb9 0003 a772            jsr        Auo_editor
[000410bc] 6004                      bra.s      $000410C2
[000410be] 4240                      clr.w      d0
[000410c0] 6002                      bra.s      $000410C4
[000410c2] 7001                      moveq.l    #1,d0
[000410c4] 245f                      movea.l    (a7)+,a2
[000410c6] 4e75                      rts
A_fontsel:
[000410c8] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[000410cc] 4fef ffd6                 lea.l      -42(a7),a7
[000410d0] 2f48 0026                 move.l     a0,38(a7)
[000410d4] 2f49 0022                 move.l     a1,34(a7)
[000410d8] 3600                      move.w     d0,d3
[000410da] 49f9 0010 ee4a            lea.l      height,a4
[000410e0] 206f 0026                 movea.l    38(a7),a0
[000410e4] 3950 fffe                 move.w     (a0),-2(a4)
[000410e8] 226f 0022                 movea.l    34(a7),a1
[000410ec] 3891                      move.w     (a1),(a4)
[000410ee] 41f9 000d 4e20            lea.l      WI_FONTSEL,a0
[000410f4] 2279 000d 4e28            movea.l    $000D4E28,a1
[000410fa] 4e91                      jsr        (a1)
[000410fc] 2a48                      movea.l    a0,a5
[000410fe] 200d                      move.l     a5,d0
[00041100] 671c                      beq.s      $0004111E
[00041102] 266d 0014                 movea.l    20(a5),a3
[00041106] 47eb 0048                 lea.l      72(a3),a3
[0004110a] 3003                      move.w     d3,d0
[0004110c] 204b                      movea.l    a3,a0
[0004110e] 6100 fdb2                 bsr        get_fontinfo
[00041112] 4a40                      tst.w      d0
[00041114] 660e                      bne.s      $00041124
[00041116] 204d                      movea.l    a5,a0
[00041118] 4eb9 0005 85f2            jsr        Awi_delete
[0004111e] 70ff                      moveq.l    #-1,d0
[00041120] 6000 0182                 bra        $000412A4
[00041124] 3f14                      move.w     (a4),-(a7)
[00041126] 43f9 000d 4ec2            lea.l      $000D4EC2,a1
[0004112c] 7014                      moveq.l    #20,d0
[0004112e] 206d 0014                 movea.l    20(a5),a0
[00041132] 4eb9 0005 0f94            jsr        Aob_printf
[00041138] 544f                      addq.w     #2,a7
[0004113a] 93c9                      suba.l     a1,a1
[0004113c] 303c 00dc                 move.w     #$00DC,d0
[00041140] 204b                      movea.l    a3,a0
[00041142] 4eb9 0003 a772            jsr        Auo_editor
[00041148] 76ff                      moveq.l    #-1,d3
[0004114a] d66c fffc                 add.w      -4(a4),d3
[0004114e] 6002                      bra.s      $00041152
[00041150] 5343                      subq.w     #1,d3
[00041152] 4a43                      tst.w      d3
[00041154] 6f1a                      ble.s      $00041170
[00041156] 3203                      move.w     d3,d1
[00041158] 48c1                      ext.l      d1
[0004115a] 2001                      move.l     d1,d0
[0004115c] e988                      lsl.l      #4,d0
[0004115e] 9081                      sub.l      d1,d0
[00041160] e588                      lsl.l      #2,d0
[00041162] 206c fff8                 movea.l    -8(a4),a0
[00041166] 342c fffe                 move.w     -2(a4),d2
[0004116a] b470 0822                 cmp.w      34(a0,d0.l),d2
[0004116e] 66e0                      bne.s      $00041150
[00041170] 3003                      move.w     d3,d0
[00041172] 206d 0014                 movea.l    20(a5),a0
[00041176] 6100 fb30                 bsr        set_font
[0004117a] 45ef 0012                 lea.l      18(a7),a2
[0004117e] 3003                      move.w     d3,d0
[00041180] 48c0                      ext.l      d0
[00041182] 2540 0008                 move.l     d0,8(a2)
[00041186] 2480                      move.l     d0,(a2)
[00041188] 7200                      moveq.l    #0,d1
[0004118a] 2541 000c                 move.l     d1,12(a2)
[0004118e] 2541 0004                 move.l     d1,4(a2)
[00041192] 224a                      movea.l    a2,a1
[00041194] 303c 00da                 move.w     #$00DA,d0
[00041198] 204b                      movea.l    a3,a0
[0004119a] 4eb9 0003 a772            jsr        Auo_editor
[000411a0] 224a                      movea.l    a2,a1
[000411a2] 303c 00e4                 move.w     #$00E4,d0
[000411a6] 204b                      movea.l    a3,a0
[000411a8] 4eb9 0003 a772            jsr        Auo_editor
[000411ae] 2e8d                      move.l     a5,(a7)
[000411b0] 2f4b 0004                 move.l     a3,4(a7)
[000411b4] 3f7c 0003 0008            move.w     #$0003,8(a7)
[000411ba] 43d7                      lea.l      (a7),a1
[000411bc] 7009                      moveq.l    #9,d0
[000411be] 204b                      movea.l    a3,a0
[000411c0] 4eb9 0003 a772            jsr        Auo_editor
[000411c6] 206d 0014                 movea.l    20(a5),a0
[000411ca] 41e8 0078                 lea.l      120(a0),a0
[000411ce] 2f48 0004                 move.l     a0,4(a7)
[000411d2] 3f7c 0005 0008            move.w     #$0005,8(a7)
[000411d8] 43d7                      lea.l      (a7),a1
[000411da] 303c 00c8                 move.w     #$00C8,d0
[000411de] 204b                      movea.l    a3,a0
[000411e0] 4eb9 0003 a772            jsr        Auo_editor
[000411e6] 2f7c 0004 0e4e 000a       move.l     #livefont,10(a7)
[000411ee] 2f6d 0014 000e            move.l     20(a5),14(a7)
[000411f4] 43ef 000a                 lea.l      10(a7),a1
[000411f8] 303c 00e5                 move.w     #$00E5,d0
[000411fc] 204b                      movea.l    a3,a0
[000411fe] 4eb9 0003 a772            jsr        Auo_editor
[00041204] 266d 0014                 movea.l    20(a5),a3
[00041208] 47eb 0168                 lea.l      360(a3),a3
[0004120c] 2f4b 0004                 move.l     a3,4(a7)
[00041210] 3f7c 000f 0008            move.w     #$000F,8(a7)
[00041216] 43d7                      lea.l      (a7),a1
[00041218] 7009                      moveq.l    #9,d0
[0004121a] 204b                      movea.l    a3,a0
[0004121c] 4eb9 0003 a772            jsr        Auo_editor
[00041222] 206d 0014                 movea.l    20(a5),a0
[00041226] 41e8 0198                 lea.l      408(a0),a0
[0004122a] 2f48 0004                 move.l     a0,4(a7)
[0004122e] 3f7c 0011 0008            move.w     #$0011,8(a7)
[00041234] 43d7                      lea.l      (a7),a1
[00041236] 303c 00c8                 move.w     #$00C8,d0
[0004123a] 204b                      movea.l    a3,a0
[0004123c] 4eb9 0003 a772            jsr        Auo_editor
[00041242] 2f7c 0004 0be6 000a       move.l     #liveheight,10(a7)
[0004124a] 2f6d 0014 000e            move.l     20(a5),14(a7)
[00041250] 43ef 000a                 lea.l      10(a7),a1
[00041254] 303c 00e5                 move.w     #$00E5,d0
[00041258] 204b                      movea.l    a3,a0
[0004125a] 4eb9 0003 a772            jsr        Auo_editor
[00041260] 204d                      movea.l    a5,a0
[00041262] 4eb9 0005 9df4            jsr        Awi_dialog
[00041268] b07c 000a                 cmp.w      #$000A,d0
[0004126c] 6620                      bne.s      $0004128E
[0004126e] 3014                      move.w     (a4),d0
[00041270] 660a                      bne.s      $0004127C
[00041272] 2079 0010 ee4e            movea.l    ACSblk,a0
[00041278] 38a8 0018                 move.w     24(a0),(a4)
[0004127c] 206f 0022                 movea.l    34(a7),a0
[00041280] 3094                      move.w     (a4),(a0)
[00041282] 226f 0026                 movea.l    38(a7),a1
[00041286] 32ac fffe                 move.w     -2(a4),(a1)
[0004128a] 4243                      clr.w      d3
[0004128c] 6002                      bra.s      $00041290
[0004128e] 76ff                      moveq.l    #-1,d3
[00041290] 204d                      movea.l    a5,a0
[00041292] 4eb9 0005 85f2            jsr        Awi_delete
[00041298] 206c fff8                 movea.l    -8(a4),a0
[0004129c] 4eb9 0004 c6c8            jsr        Ax_ifree
[000412a2] 3003                      move.w     d3,d0
[000412a4] 4fef 002a                 lea.l      42(a7),a7
[000412a8] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000412ac] 4e75                      rts
