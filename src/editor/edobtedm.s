edte_framecol:
[00031bec] 2f03                      move.l     d3,-(a7)
[00031bee] 2f0a                      move.l     a2,-(a7)
[00031bf0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031bf6] 2268 025c                 movea.l    604(a0),a1
[00031bfa] 2469 003c                 movea.l    60(a1),a2
[00031bfe] 702f                      moveq.l    #47,d0
[00031c00] 3f00                      move.w     d0,-(a7)
[00031c02] 7430                      moveq.l    #48,d2
[00031c04] 722d                      moveq.l    #45,d1
[00031c06] 302a 0012                 move.w     18(a2),d0
[00031c0a] 760c                      moveq.l    #12,d3
[00031c0c] e660                      asr.w      d3,d0
[00031c0e] c07c 000f                 and.w      #$000F,d0
[00031c12] 4eb9 0003 0bde            jsr        oe_colsel
[00031c18] 544f                      addq.w     #2,a7
[00031c1a] 3600                      move.w     d0,d3
[00031c1c] 6b30                      bmi.s      $00031C4E
[00031c1e] 322a 0012                 move.w     18(a2),d1
[00031c22] c27c 0fff                 and.w      #$0FFF,d1
[00031c26] 740c                      moveq.l    #12,d2
[00031c28] e568                      lsl.w      d2,d0
[00031c2a] 8240                      or.w       d0,d1
[00031c2c] 3541 0012                 move.w     d1,18(a2)
[00031c30] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031c36] 2068 0258                 movea.l    600(a0),a0
[00031c3a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00031c40] 2469 0258                 movea.l    600(a1),a2
[00031c44] 226a 0066                 movea.l    102(a2),a1
[00031c48] 7001                      moveq.l    #1,d0
[00031c4a] 72ff                      moveq.l    #-1,d1
[00031c4c] 4e91                      jsr        (a1)
[00031c4e] 245f                      movea.l    (a7)+,a2
[00031c50] 261f                      move.l     (a7)+,d3
[00031c52] 4e75                      rts
edte_intercol:
[00031c54] 3f03                      move.w     d3,-(a7)
[00031c56] 2f0a                      move.l     a2,-(a7)
[00031c58] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031c5e] 2268 025c                 movea.l    604(a0),a1
[00031c62] 2469 003c                 movea.l    60(a1),a2
[00031c66] 7049                      moveq.l    #73,d0
[00031c68] 3f00                      move.w     d0,-(a7)
[00031c6a] 744a                      moveq.l    #74,d2
[00031c6c] 7247                      moveq.l    #71,d1
[00031c6e] 700f                      moveq.l    #15,d0
[00031c70] c06a 0012                 and.w      18(a2),d0
[00031c74] 4eb9 0003 0bde            jsr        oe_colsel
[00031c7a] 544f                      addq.w     #2,a7
[00031c7c] 3600                      move.w     d0,d3
[00031c7e] 6b2c                      bmi.s      $00031CAC
[00031c80] 322a 0012                 move.w     18(a2),d1
[00031c84] c27c fff0                 and.w      #$FFF0,d1
[00031c88] 8243                      or.w       d3,d1
[00031c8a] 3541 0012                 move.w     d1,18(a2)
[00031c8e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031c94] 2068 0258                 movea.l    600(a0),a0
[00031c98] 2279 0010 ee4e            movea.l    ACSblk,a1
[00031c9e] 2469 0258                 movea.l    600(a1),a2
[00031ca2] 226a 0066                 movea.l    102(a2),a1
[00031ca6] 7001                      moveq.l    #1,d0
[00031ca8] 72ff                      moveq.l    #-1,d1
[00031caa] 4e91                      jsr        (a1)
[00031cac] 245f                      movea.l    (a7)+,a2
[00031cae] 361f                      move.w     (a7)+,d3
[00031cb0] 4e75                      rts
edte_pattern:
[00031cb2] 48e7 0034                 movem.l    a2-a3/a5,-(a7)
[00031cb6] 514f                      subq.w     #8,a7
[00031cb8] 41f9 000c 9fc8            lea.l      POP_PATSEL,a0
[00031cbe] 4eb9 0004 f064            jsr        Aob_create
[00031cc4] 2448                      movea.l    a0,a2
[00031cc6] 200a                      move.l     a2,d0
[00031cc8] 6700 00ce                 beq        $00031D98
[00031ccc] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00031cd2] 7043                      moveq.l    #67,d0
[00031cd4] 2053                      movea.l    (a3),a0
[00031cd6] 2268 0258                 movea.l    600(a0),a1
[00031cda] 2269 0014                 movea.l    20(a1),a1
[00031cde] 41d7                      lea.l      (a7),a0
[00031ce0] 4eb9 0004 fe06            jsr        Aob_offset
[00031ce6] 7001                      moveq.l    #1,d0
[00031ce8] 2053                      movea.l    (a3),a0
[00031cea] 2268 0258                 movea.l    600(a0),a1
[00031cee] d069 0034                 add.w      52(a1),d0
[00031cf2] d157                      add.w      d0,(a7)
[00031cf4] 7201                      moveq.l    #1,d1
[00031cf6] d269 0036                 add.w      54(a1),d1
[00031cfa] d36f 0002                 add.w      d1,2(a7)
[00031cfe] 2268 025c                 movea.l    604(a0),a1
[00031d02] 2a69 003c                 movea.l    60(a1),a5
[00031d06] 302d 0012                 move.w     18(a5),d0
[00031d0a] e840                      asr.w      #4,d0
[00031d0c] c07c 0003                 and.w      #$0003,d0
[00031d10] 48c0                      ext.l      d0
[00031d12] 2400                      move.l     d0,d2
[00031d14] d482                      add.l      d2,d2
[00031d16] d480                      add.l      d0,d2
[00031d18] e78a                      lsl.l      #3,d2
[00031d1a] 0072 0004 2822            ori.w      #$0004,34(a2,d2.l)
[00031d20] 322f 0002                 move.w     2(a7),d1
[00031d24] 3017                      move.w     (a7),d0
[00031d26] 224a                      movea.l    a2,a1
[00031d28] 2053                      movea.l    (a3),a0
[00031d2a] 2068 0258                 movea.l    600(a0),a0
[00031d2e] 4eb9 0004 e84a            jsr        Ame_popup
[00031d34] 4a40                      tst.w      d0
[00031d36] 6f58                      ble.s      $00031D90
[00031d38] 5340                      subq.w     #1,d0
[00031d3a] 322d 0012                 move.w     18(a5),d1
[00031d3e] c27c ff8f                 and.w      #$FF8F,d1
[00031d42] 3400                      move.w     d0,d2
[00031d44] e94a                      lsl.w      #4,d2
[00031d46] 8242                      or.w       d2,d1
[00031d48] 3b41 0012                 move.w     d1,18(a5)
[00031d4c] 2053                      movea.l    (a3),a0
[00031d4e] 2268 025c                 movea.l    604(a0),a1
[00031d52] 3200                      move.w     d0,d1
[00031d54] 0269 ff8f 0656            andi.w     #$FF8F,1622(a1)
[00031d5a] c27c 0007                 and.w      #$0007,d1
[00031d5e] e949                      lsl.w      #4,d1
[00031d60] 8369 0656                 or.w       d1,1622(a1)
[00031d64] 72ff                      moveq.l    #-1,d1
[00031d66] 2053                      movea.l    (a3),a0
[00031d68] 2068 0258                 movea.l    600(a0),a0
[00031d6c] 2253                      movea.l    (a3),a1
[00031d6e] 2a69 0258                 movea.l    600(a1),a5
[00031d72] 226d 0066                 movea.l    102(a5),a1
[00031d76] 7043                      moveq.l    #67,d0
[00031d78] 4e91                      jsr        (a1)
[00031d7a] 72ff                      moveq.l    #-1,d1
[00031d7c] 7001                      moveq.l    #1,d0
[00031d7e] 2053                      movea.l    (a3),a0
[00031d80] 2068 0258                 movea.l    600(a0),a0
[00031d84] 2253                      movea.l    (a3),a1
[00031d86] 2a69 0258                 movea.l    600(a1),a5
[00031d8a] 226d 0066                 movea.l    102(a5),a1
[00031d8e] 4e91                      jsr        (a1)
[00031d90] 204a                      movea.l    a2,a0
[00031d92] 4eb9 0004 f20a            jsr        Aob_delete
[00031d98] 504f                      addq.w     #8,a7
[00031d9a] 4cdf 2c00                 movem.l    (a7)+,a2-a3/a5
[00031d9e] 4e75                      rts
edte_pos:
[00031da0] 2f0a                      move.l     a2,-(a7)
[00031da2] 2f0b                      move.l     a3,-(a7)
[00031da4] 514f                      subq.w     #8,a7
[00031da6] 41f9 000c 9f68            lea.l      POP_HORPOSSEL,a0
[00031dac] 4eb9 0004 f064            jsr        Aob_create
[00031db2] 2448                      movea.l    a0,a2
[00031db4] 200a                      move.l     a2,d0
[00031db6] 6700 012c                 beq        $00031EE4
[00031dba] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00031dc0] 7015                      moveq.l    #21,d0
[00031dc2] 2053                      movea.l    (a3),a0
[00031dc4] 2268 0258                 movea.l    600(a0),a1
[00031dc8] 2269 0014                 movea.l    20(a1),a1
[00031dcc] 41d7                      lea.l      (a7),a0
[00031dce] 4eb9 0004 fe06            jsr        Aob_offset
[00031dd4] 7001                      moveq.l    #1,d0
[00031dd6] 2053                      movea.l    (a3),a0
[00031dd8] 2268 0258                 movea.l    600(a0),a1
[00031ddc] d069 0034                 add.w      52(a1),d0
[00031de0] d157                      add.w      d0,(a7)
[00031de2] 7201                      moveq.l    #1,d1
[00031de4] d269 0036                 add.w      54(a1),d1
[00031de8] d36f 0002                 add.w      d1,2(a7)
[00031dec] 2268 025c                 movea.l    604(a0),a1
[00031df0] 2069 003c                 movea.l    60(a1),a0
[00031df4] 3428 0010                 move.w     16(a0),d2
[00031df8] 4a42                      tst.w      d2
[00031dfa] 670a                      beq.s      $00031E06
[00031dfc] 5342                      subq.w     #1,d2
[00031dfe] 670e                      beq.s      $00031E0E
[00031e00] 5342                      subq.w     #1,d2
[00031e02] 6712                      beq.s      $00031E16
[00031e04] 6016                      bra.s      $00031E1C
[00031e06] 006a 0004 0022            ori.w      #$0004,34(a2)
[00031e0c] 600e                      bra.s      $00031E1C
[00031e0e] 006a 0004 0052            ori.w      #$0004,82(a2)
[00031e14] 6006                      bra.s      $00031E1C
[00031e16] 006a 0004 003a            ori.w      #$0004,58(a2)
[00031e1c] 322f 0002                 move.w     2(a7),d1
[00031e20] 3017                      move.w     (a7),d0
[00031e22] 224a                      movea.l    a2,a1
[00031e24] 2053                      movea.l    (a3),a0
[00031e26] 2068 0258                 movea.l    600(a0),a0
[00031e2a] 4eb9 0004 e84a            jsr        Ame_popup
[00031e30] 3200                      move.w     d0,d1
[00031e32] 5341                      subq.w     #1,d1
[00031e34] 670c                      beq.s      $00031E42
[00031e36] 5341                      subq.w     #1,d1
[00031e38] 672c                      beq.s      $00031E66
[00031e3a] 5341                      subq.w     #1,d1
[00031e3c] 674e                      beq.s      $00031E8C
[00031e3e] 6000 009c                 bra        $00031EDC
[00031e42] 2053                      movea.l    (a3),a0
[00031e44] 2268 025c                 movea.l    604(a0),a1
[00031e48] 2069 003c                 movea.l    60(a1),a0
[00031e4c] 4268 0010                 clr.w      16(a0)
[00031e50] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[00031e56] 7017                      moveq.l    #23,d0
[00031e58] 2053                      movea.l    (a3),a0
[00031e5a] 2068 025c                 movea.l    604(a0),a0
[00031e5e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031e64] 604a                      bra.s      $00031EB0
[00031e66] 2053                      movea.l    (a3),a0
[00031e68] 2268 025c                 movea.l    604(a0),a1
[00031e6c] 2069 003c                 movea.l    60(a1),a0
[00031e70] 317c 0002 0010            move.w     #$0002,16(a0)
[00031e76] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[00031e7c] 7017                      moveq.l    #23,d0
[00031e7e] 2053                      movea.l    (a3),a0
[00031e80] 2068 025c                 movea.l    604(a0),a0
[00031e84] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031e8a] 6024                      bra.s      $00031EB0
[00031e8c] 2053                      movea.l    (a3),a0
[00031e8e] 2268 025c                 movea.l    604(a0),a1
[00031e92] 2069 003c                 movea.l    60(a1),a0
[00031e96] 317c 0001 0010            move.w     #$0001,16(a0)
[00031e9c] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[00031ea2] 7017                      moveq.l    #23,d0
[00031ea4] 2053                      movea.l    (a3),a0
[00031ea6] 2068 025c                 movea.l    604(a0),a0
[00031eaa] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031eb0] 72ff                      moveq.l    #-1,d1
[00031eb2] 7017                      moveq.l    #23,d0
[00031eb4] 2053                      movea.l    (a3),a0
[00031eb6] 2068 0258                 movea.l    600(a0),a0
[00031eba] 2253                      movea.l    (a3),a1
[00031ebc] 2269 0258                 movea.l    600(a1),a1
[00031ec0] 2269 0066                 movea.l    102(a1),a1
[00031ec4] 4e91                      jsr        (a1)
[00031ec6] 72ff                      moveq.l    #-1,d1
[00031ec8] 7001                      moveq.l    #1,d0
[00031eca] 2053                      movea.l    (a3),a0
[00031ecc] 2068 0258                 movea.l    600(a0),a0
[00031ed0] 2253                      movea.l    (a3),a1
[00031ed2] 2269 0258                 movea.l    600(a1),a1
[00031ed6] 2269 0066                 movea.l    102(a1),a1
[00031eda] 4e91                      jsr        (a1)
[00031edc] 204a                      movea.l    a2,a0
[00031ede] 4eb9 0004 f20a            jsr        Aob_delete
[00031ee4] 504f                      addq.w     #8,a7
[00031ee6] 265f                      movea.l    (a7)+,a3
[00031ee8] 245f                      movea.l    (a7)+,a2
[00031eea] 4e75                      rts
edte_replace:
[00031eec] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031ef2] 2268 025c                 movea.l    604(a0),a1
[00031ef6] 2069 003c                 movea.l    60(a1),a0
[00031efa] 0068 0080 0012            ori.w      #$0080,18(a0)
[00031f00] 72ff                      moveq.l    #-1,d1
[00031f02] 7001                      moveq.l    #1,d0
[00031f04] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031f0a] 2068 0258                 movea.l    600(a0),a0
[00031f0e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00031f14] 2269 0258                 movea.l    600(a1),a1
[00031f18] 2269 0066                 movea.l    102(a1),a1
[00031f1c] 4e91                      jsr        (a1)
[00031f1e] 4e75                      rts
edte_size:
[00031f20] 2f0a                      move.l     a2,-(a7)
[00031f22] 2f0b                      move.l     a3,-(a7)
[00031f24] 514f                      subq.w     #8,a7
[00031f26] 41f9 000c a0a0            lea.l      POP_SIZESEL,a0
[00031f2c] 4eb9 0004 f064            jsr        Aob_create
[00031f32] 2448                      movea.l    a0,a2
[00031f34] 200a                      move.l     a2,d0
[00031f36] 6700 00f6                 beq        $0003202E
[00031f3a] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00031f40] 701a                      moveq.l    #26,d0
[00031f42] 2053                      movea.l    (a3),a0
[00031f44] 2268 0258                 movea.l    600(a0),a1
[00031f48] 2269 0014                 movea.l    20(a1),a1
[00031f4c] 41d7                      lea.l      (a7),a0
[00031f4e] 4eb9 0004 fe06            jsr        Aob_offset
[00031f54] 7001                      moveq.l    #1,d0
[00031f56] 2053                      movea.l    (a3),a0
[00031f58] 2268 0258                 movea.l    600(a0),a1
[00031f5c] d069 0034                 add.w      52(a1),d0
[00031f60] d157                      add.w      d0,(a7)
[00031f62] 7201                      moveq.l    #1,d1
[00031f64] d269 0036                 add.w      54(a1),d1
[00031f68] d36f 0002                 add.w      d1,2(a7)
[00031f6c] 2268 025c                 movea.l    604(a0),a1
[00031f70] 2069 003c                 movea.l    60(a1),a0
[00031f74] 3428 000c                 move.w     12(a0),d2
[00031f78] 5742                      subq.w     #3,d2
[00031f7a] 6706                      beq.s      $00031F82
[00031f7c] 5542                      subq.w     #2,d2
[00031f7e] 670a                      beq.s      $00031F8A
[00031f80] 600e                      bra.s      $00031F90
[00031f82] 006a 0004 0022            ori.w      #$0004,34(a2)
[00031f88] 6006                      bra.s      $00031F90
[00031f8a] 006a 0004 003a            ori.w      #$0004,58(a2)
[00031f90] 322f 0002                 move.w     2(a7),d1
[00031f94] 3017                      move.w     (a7),d0
[00031f96] 224a                      movea.l    a2,a1
[00031f98] 2053                      movea.l    (a3),a0
[00031f9a] 2068 0258                 movea.l    600(a0),a0
[00031f9e] 4eb9 0004 e84a            jsr        Ame_popup
[00031fa4] 3200                      move.w     d0,d1
[00031fa6] 5341                      subq.w     #1,d1
[00031fa8] 6706                      beq.s      $00031FB0
[00031faa] 5341                      subq.w     #1,d1
[00031fac] 6728                      beq.s      $00031FD6
[00031fae] 6076                      bra.s      $00032026
[00031fb0] 2053                      movea.l    (a3),a0
[00031fb2] 2268 025c                 movea.l    604(a0),a1
[00031fb6] 2069 003c                 movea.l    60(a1),a0
[00031fba] 317c 0003 000c            move.w     #$0003,12(a0)
[00031fc0] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[00031fc6] 701c                      moveq.l    #28,d0
[00031fc8] 2053                      movea.l    (a3),a0
[00031fca] 2068 025c                 movea.l    604(a0),a0
[00031fce] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031fd4] 6024                      bra.s      $00031FFA
[00031fd6] 2053                      movea.l    (a3),a0
[00031fd8] 2268 025c                 movea.l    604(a0),a1
[00031fdc] 2069 003c                 movea.l    60(a1),a0
[00031fe0] 317c 0005 000c            move.w     #$0005,12(a0)
[00031fe6] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[00031fec] 701c                      moveq.l    #28,d0
[00031fee] 2053                      movea.l    (a3),a0
[00031ff0] 2068 025c                 movea.l    604(a0),a0
[00031ff4] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031ffa] 72ff                      moveq.l    #-1,d1
[00031ffc] 701c                      moveq.l    #28,d0
[00031ffe] 2053                      movea.l    (a3),a0
[00032000] 2068 0258                 movea.l    600(a0),a0
[00032004] 2253                      movea.l    (a3),a1
[00032006] 2269 0258                 movea.l    600(a1),a1
[0003200a] 2269 0066                 movea.l    102(a1),a1
[0003200e] 4e91                      jsr        (a1)
[00032010] 72ff                      moveq.l    #-1,d1
[00032012] 7001                      moveq.l    #1,d0
[00032014] 2053                      movea.l    (a3),a0
[00032016] 2068 0258                 movea.l    600(a0),a0
[0003201a] 2253                      movea.l    (a3),a1
[0003201c] 2269 0258                 movea.l    600(a1),a1
[00032020] 2269 0066                 movea.l    102(a1),a1
[00032024] 4e91                      jsr        (a1)
[00032026] 204a                      movea.l    a2,a0
[00032028] 4eb9 0004 f20a            jsr        Aob_delete
[0003202e] 504f                      addq.w     #8,a7
[00032030] 265f                      movea.l    (a7)+,a3
[00032032] 245f                      movea.l    (a7)+,a2
[00032034] 4e75                      rts
edte_textcol:
[00032036] 3f03                      move.w     d3,-(a7)
[00032038] 2f0a                      move.l     a2,-(a7)
[0003203a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00032040] 2268 025c                 movea.l    604(a0),a1
[00032044] 2469 003c                 movea.l    60(a1),a2
[00032048] 7011                      moveq.l    #17,d0
[0003204a] 3f00                      move.w     d0,-(a7)
[0003204c] 7412                      moveq.l    #18,d2
[0003204e] 720f                      moveq.l    #15,d1
[00032050] 302a 0012                 move.w     18(a2),d0
[00032054] e040                      asr.w      #8,d0
[00032056] c07c 000f                 and.w      #$000F,d0
[0003205a] 4eb9 0003 0bde            jsr        oe_colsel
[00032060] 544f                      addq.w     #2,a7
[00032062] 3600                      move.w     d0,d3
[00032064] 6b2e                      bmi.s      $00032094
[00032066] 322a 0012                 move.w     18(a2),d1
[0003206a] c27c f0ff                 and.w      #$F0FF,d1
[0003206e] e148                      lsl.w      #8,d0
[00032070] 8240                      or.w       d0,d1
[00032072] 3541 0012                 move.w     d1,18(a2)
[00032076] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003207c] 2068 0258                 movea.l    600(a0),a0
[00032080] 2279 0010 ee4e            movea.l    ACSblk,a1
[00032086] 2469 0258                 movea.l    600(a1),a2
[0003208a] 226a 0066                 movea.l    102(a2),a1
[0003208e] 7001                      moveq.l    #1,d0
[00032090] 72ff                      moveq.l    #-1,d1
[00032092] 4e91                      jsr        (a1)
[00032094] 245f                      movea.l    (a7)+,a2
[00032096] 361f                      move.w     (a7)+,d3
[00032098] 4e75                      rts
edte_trans:
[0003209a] 2079 0010 ee4e            movea.l    ACSblk,a0
[000320a0] 2268 025c                 movea.l    604(a0),a1
[000320a4] 2069 003c                 movea.l    60(a1),a0
[000320a8] 0268 ff7f 0012            andi.w     #$FF7F,18(a0)
[000320ae] 72ff                      moveq.l    #-1,d1
[000320b0] 7001                      moveq.l    #1,d0
[000320b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000320b8] 2068 0258                 movea.l    600(a0),a0
[000320bc] 2279 0010 ee4e            movea.l    ACSblk,a1
[000320c2] 2269 0258                 movea.l    600(a1),a1
[000320c6] 2269 0066                 movea.l    102(a1),a1
[000320ca] 4e91                      jsr        (a1)
[000320cc] 4e75                      rts
edte_type:
[000320ce] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[000320d2] 514f                      subq.w     #8,a7
[000320d4] 45f9 000c b25c            lea.l      POP_TYPESEL,a2
[000320da] 204a                      movea.l    a2,a0
[000320dc] 4eb9 0004 f064            jsr        Aob_create
[000320e2] 2648                      movea.l    a0,a3
[000320e4] 200b                      move.l     a3,d0
[000320e6] 6700 017a                 beq        $00032262
[000320ea] 49f9 0010 ee4e            lea.l      ACSblk,a4
[000320f0] 7005                      moveq.l    #5,d0
[000320f2] 2054                      movea.l    (a4),a0
[000320f4] 2268 0258                 movea.l    600(a0),a1
[000320f8] 2269 0014                 movea.l    20(a1),a1
[000320fc] 41d7                      lea.l      (a7),a0
[000320fe] 4eb9 0004 fe06            jsr        Aob_offset
[00032104] 7001                      moveq.l    #1,d0
[00032106] 2054                      movea.l    (a4),a0
[00032108] 2268 0258                 movea.l    600(a0),a1
[0003210c] d069 0034                 add.w      52(a1),d0
[00032110] d157                      add.w      d0,(a7)
[00032112] 7201                      moveq.l    #1,d1
[00032114] d269 0036                 add.w      54(a1),d1
[00032118] d36f 0002                 add.w      d1,2(a7)
[0003211c] 2268 025c                 movea.l    604(a0),a1
[00032120] 3629 0036                 move.w     54(a1),d3
[00032124] 3403                      move.w     d3,d2
[00032126] 947c 0015                 sub.w      #$0015,d2
[0003212a] 670e                      beq.s      $0003213A
[0003212c] 5342                      subq.w     #1,d2
[0003212e] 6712                      beq.s      $00032142
[00032130] 5f42                      subq.w     #7,d2
[00032132] 6716                      beq.s      $0003214A
[00032134] 5342                      subq.w     #1,d2
[00032136] 671a                      beq.s      $00032152
[00032138] 601e                      bra.s      $00032158
[0003213a] 006b 0004 0022            ori.w      #$0004,34(a3)
[00032140] 6016                      bra.s      $00032158
[00032142] 006b 0004 003a            ori.w      #$0004,58(a3)
[00032148] 600e                      bra.s      $00032158
[0003214a] 006b 0004 0052            ori.w      #$0004,82(a3)
[00032150] 6006                      bra.s      $00032158
[00032152] 006b 0004 006a            ori.w      #$0004,106(a3)
[00032158] 322f 0002                 move.w     2(a7),d1
[0003215c] 3017                      move.w     (a7),d0
[0003215e] 224b                      movea.l    a3,a1
[00032160] 2054                      movea.l    (a4),a0
[00032162] 2068 0258                 movea.l    600(a0),a0
[00032166] 4eb9 0004 e84a            jsr        Ame_popup
[0003216c] 3800                      move.w     d0,d4
[0003216e] 5340                      subq.w     #1,d0
[00032170] 6712                      beq.s      $00032184
[00032172] 5340                      subq.w     #1,d0
[00032174] 6742                      beq.s      $000321B8
[00032176] 5340                      subq.w     #1,d0
[00032178] 675e                      beq.s      $000321D8
[0003217a] 5340                      subq.w     #1,d0
[0003217c] 6700 008c                 beq        $0003220A
[00032180] 6000 00a8                 bra        $0003222A
[00032184] 2054                      movea.l    (a4),a0
[00032186] 2268 025c                 movea.l    604(a0),a1
[0003218a] 337c 0015 0036            move.w     #$0015,54(a1)
[00032190] 43ea fd9e                 lea.l      -610(a2),a1
[00032194] 7007                      moveq.l    #7,d0
[00032196] 2054                      movea.l    (a4),a0
[00032198] 2068 025c                 movea.l    604(a0),a0
[0003219c] 4eb9 0005 0fd8            jsr        Aob_puttext
[000321a2] b67c 001d                 cmp.w      #$001D,d3
[000321a6] 6708                      beq.s      $000321B0
[000321a8] b67c 001e                 cmp.w      #$001E,d3
[000321ac] 6600 007c                 bne.w      $0003222A
[000321b0] 4eb9 0003 2664            jsr        edte_xtext
[000321b6] 6072                      bra.s      $0003222A
[000321b8] 2054                      movea.l    (a4),a0
[000321ba] 2268 025c                 movea.l    604(a0),a1
[000321be] 337c 0016 0036            move.w     #$0016,54(a1)
[000321c4] 43ea fda5                 lea.l      -603(a2),a1
[000321c8] 7007                      moveq.l    #7,d0
[000321ca] 2054                      movea.l    (a4),a0
[000321cc] 2068 025c                 movea.l    604(a0),a0
[000321d0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000321d6] 60ca                      bra.s      $000321A2
[000321d8] 2054                      movea.l    (a4),a0
[000321da] 2268 025c                 movea.l    604(a0),a1
[000321de] 337c 001d 0036            move.w     #$001D,54(a1)
[000321e4] 43ea fdaf                 lea.l      -593(a2),a1
[000321e8] 7007                      moveq.l    #7,d0
[000321ea] 2054                      movea.l    (a4),a0
[000321ec] 2068 025c                 movea.l    604(a0),a0
[000321f0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000321f6] b67c 0015                 cmp.w      #$0015,d3
[000321fa] 6706                      beq.s      $00032202
[000321fc] b67c 0016                 cmp.w      #$0016,d3
[00032200] 6628                      bne.s      $0003222A
[00032202] 4eb9 0003 26bc            jsr        edte_xftext
[00032208] 6020                      bra.s      $0003222A
[0003220a] 2054                      movea.l    (a4),a0
[0003220c] 2268 025c                 movea.l    604(a0),a1
[00032210] 337c 001e 0036            move.w     #$001E,54(a1)
[00032216] 43ea fdb8                 lea.l      -584(a2),a1
[0003221a] 7007                      moveq.l    #7,d0
[0003221c] 2054                      movea.l    (a4),a0
[0003221e] 2068 025c                 movea.l    604(a0),a0
[00032222] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032228] 60cc                      bra.s      $000321F6
[0003222a] 4a44                      tst.w      d4
[0003222c] 6f2c                      ble.s      $0003225A
[0003222e] 72ff                      moveq.l    #-1,d1
[00032230] 7005                      moveq.l    #5,d0
[00032232] 2054                      movea.l    (a4),a0
[00032234] 2068 0258                 movea.l    600(a0),a0
[00032238] 2254                      movea.l    (a4),a1
[0003223a] 2469 0258                 movea.l    600(a1),a2
[0003223e] 226a 0066                 movea.l    102(a2),a1
[00032242] 4e91                      jsr        (a1)
[00032244] 72ff                      moveq.l    #-1,d1
[00032246] 7001                      moveq.l    #1,d0
[00032248] 2054                      movea.l    (a4),a0
[0003224a] 2068 0258                 movea.l    600(a0),a0
[0003224e] 2254                      movea.l    (a4),a1
[00032250] 2469 0258                 movea.l    600(a1),a2
[00032254] 226a 0066                 movea.l    102(a2),a1
[00032258] 4e91                      jsr        (a1)
[0003225a] 204b                      movea.l    a3,a0
[0003225c] 4eb9 0004 f20a            jsr        Aob_delete
[00032262] 504f                      addq.w     #8,a7
[00032264] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[00032268] 4e75                      rts

; start editor\edobtedm.c

edte_ok:
[0003226a] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003226e] 4fef ffe4                 lea.l      -28(a7),a7
[00032272] 2079 0010 ee4e            movea.l    ACSblk,a0
[00032278] 2068 0258                 movea.l    600(a0),a0
[0003227c] 2468 0014                 movea.l    20(a0),a2
[00032280] 2a50                      movea.l    (a0),a5
[00032282] 2655                      movea.l    (a5),a3
[00032284] 006b 0001 0006            ori.w      #$0001,6(a3)
[0003228a] 206d 0004                 movea.l    4(a5),a0
[0003228e] 2868 0004                 movea.l    4(a0),a4
[00032292] 322d 000a                 move.w     10(a5),d1
[00032296] 48c1                      ext.l      d1
[00032298] 2001                      move.l     d1,d0
[0003229a] e788                      lsl.l      #3,d0
[0003229c] 9081                      sub.l      d1,d0
[0003229e] e788                      lsl.l      #3,d0
[000322a0] d9c0                      adda.l     d0,a4
[000322a2] 226c 0014                 movea.l    20(a4),a1
[000322a6] 204b                      movea.l    a3,a0
[000322a8] 4eb9 0003 6686            jsr        del_tedinfo
[000322ae] 396a 0036 000e            move.w     54(a2),14(a4)
[000322b4] 701c                      moveq.l    #28,d0
[000322b6] 226a 003c                 movea.l    60(a2),a1
[000322ba] 41d7                      lea.l      (a7),a0
[000322bc] 4eb9 0008 3500            jsr        memcpy
[000322c2] 43d7                      lea.l      (a7),a1
[000322c4] 7003                      moveq.l    #3,d0
[000322c6] 41ea 0378                 lea.l      888(a2),a0
[000322ca] 4eb9 0006 a068            jsr        Auo_boxed
[000322d0] 2057                      movea.l    (a7),a0
[000322d2] 4eb9 0008 2f6c            jsr        strlen
[000322d8] 2600                      move.l     d0,d3
[000322da] 5243                      addq.w     #1,d3
[000322dc] 3f43 0018                 move.w     d3,24(a7)
[000322e0] 0c2c 0015 000f            cmpi.b     #$15,15(a4)
[000322e6] 6708                      beq.s      $000322F0
[000322e8] 0c2c 0016 000f            cmpi.b     #$16,15(a4)
[000322ee] 661a                      bne.s      $0003230A
[000322f0] 41f9 000c b9f4            lea.l      $000CB9F4,a0
[000322f6] 2f48 0008                 move.l     a0,8(a7)
[000322fa] 2f48 0004                 move.l     a0,4(a7)
[000322fe] 426f 001a                 clr.w      26(a7)
[00032302] 026c fff7 0010            andi.w     #$FFF7,16(a4)
[00032308] 6032                      bra.s      $0003233C
[0003230a] 43ef 0004                 lea.l      4(a7),a1
[0003230e] 7003                      moveq.l    #3,d0
[00032310] 41ea 0390                 lea.l      912(a2),a0
[00032314] 4eb9 0006 a068            jsr        Auo_boxed
[0003231a] 43ef 0008                 lea.l      8(a7),a1
[0003231e] 7003                      moveq.l    #3,d0
[00032320] 41ea 03a8                 lea.l      936(a2),a0
[00032324] 4eb9 0006 a068            jsr        Auo_boxed
[0003232a] 206f 0004                 movea.l    4(a7),a0
[0003232e] 4eb9 0008 2f6c            jsr        strlen
[00032334] 2600                      move.l     d0,d3
[00032336] 5243                      addq.w     #1,d3
[00032338] 3f43 001a                 move.w     d3,26(a7)
[0003233c] 43d7                      lea.l      (a7),a1
[0003233e] 204b                      movea.l    a3,a0
[00032340] 4eb9 0003 66de            jsr        dup_tedinfo
[00032346] 2948 0014                 move.l     a0,20(a4)
[0003234a] 5343                      subq.w     #1,d3
[0003234c] 3003                      move.w     d3,d0
[0003234e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00032354] c1e9 0012                 muls.w     18(a1),d0
[00032358] 3600                      move.w     d0,d3
[0003235a] 302c 001c                 move.w     28(a4),d0
[0003235e] 4eb9 0002 d91c            jsr        pixel_x
[00032364] b640                      cmp.w      d0,d3
[00032366] 6f0c                      ble.s      $00032374
[00032368] 3003                      move.w     d3,d0
[0003236a] 4eb9 0002 d888            jsr        char_x
[00032370] 3940 001c                 move.w     d0,28(a4)
[00032374] 4eb9 0002 f27c            jsr        ed_abort
[0003237a] 4fef 001c                 lea.l      28(a7),a7
[0003237e] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00032382] 4e75                      rts
set_ted:
[00032384] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00032388] 2648                      movea.l    a0,a3
[0003238a] 4bf9 000c b9dc            lea.l      sm,a5
[00032390] 41ed f8f8                 lea.l      -1800(a5),a0
[00032394] 4eb9 0004 f064            jsr        Aob_create
[0003239a] 2448                      movea.l    a0,a2
[0003239c] 200a                      move.l     a2,d0
[0003239e] 6606                      bne.s      $000323A6
[000323a0] 91c8                      suba.l     a0,a0
[000323a2] 6000 0274                 bra        $00032618
[000323a6] 7025                      moveq.l    #37,d0
[000323a8] 224a                      movea.l    a2,a1
[000323aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[000323b0] 2068 0258                 movea.l    600(a0),a0
[000323b4] 4eb9 0003 0b9a            jsr        oe_beself
[000323ba] 7026                      moveq.l    #38,d0
[000323bc] 224a                      movea.l    a2,a1
[000323be] 2079 0010 ee4e            movea.l    ACSblk,a0
[000323c4] 2068 0258                 movea.l    600(a0),a0
[000323c8] 4eb9 0003 0b9a            jsr        oe_beself
[000323ce] 7027                      moveq.l    #39,d0
[000323d0] 224a                      movea.l    a2,a1
[000323d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000323d8] 2068 0258                 movea.l    600(a0),a0
[000323dc] 4eb9 0003 0b9a            jsr        oe_beself
[000323e2] 356b 000e 0036            move.w     14(a3),54(a2)
[000323e8] 102a 0037                 move.b     55(a2),d0
[000323ec] 4880                      ext.w      d0
[000323ee] 907c 0015                 sub.w      #$0015,d0
[000323f2] 670e                      beq.s      $00032402
[000323f4] 5340                      subq.w     #1,d0
[000323f6] 670a                      beq.s      $00032402
[000323f8] 5f40                      subq.w     #7,d0
[000323fa] 6720                      beq.s      $0003241C
[000323fc] 5340                      subq.w     #1,d0
[000323fe] 671c                      beq.s      $0003241C
[00032400] 6032                      bra.s      $00032434
[00032402] 006a 0080 0398            ori.w      #$0080,920(a2)
[00032408] 026a fff7 0398            andi.w     #$FFF7,920(a2)
[0003240e] 006a 0080 03b0            ori.w      #$0080,944(a2)
[00032414] 026a fff7 03b0            andi.w     #$FFF7,944(a2)
[0003241a] 6018                      bra.s      $00032434
[0003241c] 026a ff7f 0398            andi.w     #$FF7F,920(a2)
[00032422] 006a 0008 0398            ori.w      #$0008,920(a2)
[00032428] 026a ff7f 03b0            andi.w     #$FF7F,944(a2)
[0003242e] 006a 0008 03b0            ori.w      #$0008,944(a2)
[00032434] 356b 0012 003a            move.w     18(a3),58(a2)
[0003243a] 206b 0014                 movea.l    20(a3),a0
[0003243e] 2868 0004                 movea.l    4(a0),a4
[00032442] 206a 003c                 movea.l    60(a2),a0
[00032446] 316c 000c 000c            move.w     12(a4),12(a0)
[0003244c] 316c 0010 0010            move.w     16(a4),16(a0)
[00032452] 316c 0012 0012            move.w     18(a4),18(a0)
[00032458] 316c 0016 0016            move.w     22(a4),22(a0)
[0003245e] 2054                      movea.l    (a4),a0
[00032460] 2268 0004                 movea.l    4(a0),a1
[00032464] 7025                      moveq.l    #37,d0
[00032466] 204a                      movea.l    a2,a0
[00032468] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003246e] 206c 0004                 movea.l    4(a4),a0
[00032472] 2268 0004                 movea.l    4(a0),a1
[00032476] 7026                      moveq.l    #38,d0
[00032478] 204a                      movea.l    a2,a0
[0003247a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032480] 206c 0008                 movea.l    8(a4),a0
[00032484] 2268 0004                 movea.l    4(a0),a1
[00032488] 7027                      moveq.l    #39,d0
[0003248a] 204a                      movea.l    a2,a0
[0003248c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032492] 362c 0012                 move.w     18(a4),d3
[00032496] 700c                      moveq.l    #12,d0
[00032498] e063                      asr.w      d0,d3
[0003249a] c67c 000f                 and.w      #$000F,d3
[0003249e] 3203                      move.w     d3,d1
[000324a0] 48c1                      ext.l      d1
[000324a2] e589                      lsl.l      #2,d1
[000324a4] 41f9 000c a6d0            lea.l      colour_text,a0
[000324aa] 2270 1800                 movea.l    0(a0,d1.l),a1
[000324ae] 204a                      movea.l    a2,a0
[000324b0] 7030                      moveq.l    #48,d0
[000324b2] 4eb9 0005 0fd8            jsr        Aob_puttext
[000324b8] 3003                      move.w     d3,d0
[000324ba] 026a fff0 0476            andi.w     #$FFF0,1142(a2)
[000324c0] c07c 000f                 and.w      #$000F,d0
[000324c4] 816a 0476                 or.w       d0,1142(a2)
[000324c8] 760f                      moveq.l    #15,d3
[000324ca] c66c 0012                 and.w      18(a4),d3
[000324ce] 3003                      move.w     d3,d0
[000324d0] 48c0                      ext.l      d0
[000324d2] e588                      lsl.l      #2,d0
[000324d4] 41f9 000c a6d0            lea.l      colour_text,a0
[000324da] 2270 0800                 movea.l    0(a0,d0.l),a1
[000324de] 204a                      movea.l    a2,a0
[000324e0] 704a                      moveq.l    #74,d0
[000324e2] 4eb9 0005 0fd8            jsr        Aob_puttext
[000324e8] 3003                      move.w     d3,d0
[000324ea] 026a fff0 06e6            andi.w     #$FFF0,1766(a2)
[000324f0] c07c 000f                 and.w      #$000F,d0
[000324f4] 816a 06e6                 or.w       d0,1766(a2)
[000324f8] 362c 0012                 move.w     18(a4),d3
[000324fc] e843                      asr.w      #4,d3
[000324fe] c67c 0007                 and.w      #$0007,d3
[00032502] 3003                      move.w     d3,d0
[00032504] 026a ff8f 0656            andi.w     #$FF8F,1622(a2)
[0003250a] c07c 0007                 and.w      #$0007,d0
[0003250e] e948                      lsl.w      #4,d0
[00032510] 816a 0656                 or.w       d0,1622(a2)
[00032514] 302c 0010                 move.w     16(a4),d0
[00032518] 4a40                      tst.w      d0
[0003251a] 670a                      beq.s      $00032526
[0003251c] 5340                      subq.w     #1,d0
[0003251e] 672a                      beq.s      $0003254A
[00032520] 5340                      subq.w     #1,d0
[00032522] 6714                      beq.s      $00032538
[00032524] 6034                      bra.s      $0003255A
[00032526] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[0003252c] 7017                      moveq.l    #23,d0
[0003252e] 204a                      movea.l    a2,a0
[00032530] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032536] 6022                      bra.s      $0003255A
[00032538] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[0003253e] 7017                      moveq.l    #23,d0
[00032540] 204a                      movea.l    a2,a0
[00032542] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032548] 6010                      bra.s      $0003255A
[0003254a] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[00032550] 7017                      moveq.l    #23,d0
[00032552] 204a                      movea.l    a2,a0
[00032554] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003255a] 302c 000c                 move.w     12(a4),d0
[0003255e] 5740                      subq.w     #3,d0
[00032560] 6706                      beq.s      $00032568
[00032562] 5540                      subq.w     #2,d0
[00032564] 6714                      beq.s      $0003257A
[00032566] 6022                      bra.s      $0003258A
[00032568] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[0003256e] 701c                      moveq.l    #28,d0
[00032570] 204a                      movea.l    a2,a0
[00032572] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032578] 6010                      bra.s      $0003258A
[0003257a] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[00032580] 701c                      moveq.l    #28,d0
[00032582] 204a                      movea.l    a2,a0
[00032584] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003258a] 362c 0012                 move.w     18(a4),d3
[0003258e] e043                      asr.w      #8,d3
[00032590] c67c 000f                 and.w      #$000F,d3
[00032594] 3003                      move.w     d3,d0
[00032596] 48c0                      ext.l      d0
[00032598] e588                      lsl.l      #2,d0
[0003259a] 41f9 000c a6d0            lea.l      colour_text,a0
[000325a0] 2270 0800                 movea.l    0(a0,d0.l),a1
[000325a4] 204a                      movea.l    a2,a0
[000325a6] 7012                      moveq.l    #18,d0
[000325a8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000325ae] 3003                      move.w     d3,d0
[000325b0] 026a fff0 01a6            andi.w     #$FFF0,422(a2)
[000325b6] c07c 000f                 and.w      #$000F,d0
[000325ba] 816a 01a6                 or.w       d0,422(a2)
[000325be] 302b 000e                 move.w     14(a3),d0
[000325c2] 907c 0015                 sub.w      #$0015,d0
[000325c6] 670e                      beq.s      $000325D6
[000325c8] 5340                      subq.w     #1,d0
[000325ca] 671a                      beq.s      $000325E6
[000325cc] 5f40                      subq.w     #7,d0
[000325ce] 6726                      beq.s      $000325F6
[000325d0] 5340                      subq.w     #1,d0
[000325d2] 6732                      beq.s      $00032606
[000325d4] 603e                      bra.s      $00032614
[000325d6] 43ed f61e                 lea.l      -2530(a5),a1
[000325da] 7007                      moveq.l    #7,d0
[000325dc] 204a                      movea.l    a2,a0
[000325de] 4eb9 0005 0fd8            jsr        Aob_puttext
[000325e4] 602e                      bra.s      $00032614
[000325e6] 43ed f625                 lea.l      -2523(a5),a1
[000325ea] 7007                      moveq.l    #7,d0
[000325ec] 204a                      movea.l    a2,a0
[000325ee] 4eb9 0005 0fd8            jsr        Aob_puttext
[000325f4] 601e                      bra.s      $00032614
[000325f6] 43ed f62f                 lea.l      -2513(a5),a1
[000325fa] 7007                      moveq.l    #7,d0
[000325fc] 204a                      movea.l    a2,a0
[000325fe] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032604] 600e                      bra.s      $00032614
[00032606] 43ed f638                 lea.l      -2504(a5),a1
[0003260a] 7007                      moveq.l    #7,d0
[0003260c] 204a                      movea.l    a2,a0
[0003260e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032614] 2a8a                      move.l     a2,(a5)
[00032616] 204d                      movea.l    a5,a0
[00032618] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003261c] 4e75                      rts
edte_th:
[0003261e] 2f0a                      move.l     a2,-(a7)
[00032620] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00032626] 2052                      movea.l    (a2),a0
[00032628] 3228 0260                 move.w     608(a0),d1
[0003262c] 48c1                      ext.l      d1
[0003262e] 2001                      move.l     d1,d0
[00032630] d080                      add.l      d0,d0
[00032632] d081                      add.l      d1,d0
[00032634] e788                      lsl.l      #3,d0
[00032636] 2268 025c                 movea.l    604(a0),a1
[0003263a] 3431 080c                 move.w     12(a1,d0.l),d2
[0003263e] e14a                      lsl.w      #8,d2
[00032640] e042                      asr.w      #8,d2
[00032642] 2069 003c                 movea.l    60(a1),a0
[00032646] 3142 0016                 move.w     d2,22(a0)
[0003264a] 72ff                      moveq.l    #-1,d1
[0003264c] 7001                      moveq.l    #1,d0
[0003264e] 2052                      movea.l    (a2),a0
[00032650] 2068 0258                 movea.l    600(a0),a0
[00032654] 2252                      movea.l    (a2),a1
[00032656] 2269 0258                 movea.l    600(a1),a1
[0003265a] 2269 0066                 movea.l    102(a1),a1
[0003265e] 4e91                      jsr        (a1)
[00032660] 245f                      movea.l    (a7)+,a2
[00032662] 4e75                      rts
edte_xtext:
[00032664] 2f0a                      move.l     a2,-(a7)
[00032666] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003266c] 2468 0258                 movea.l    600(a0),a2
[00032670] 4eb9 0005 1388            jsr        Awi_diaend
[00032676] 206a 0014                 movea.l    20(a2),a0
[0003267a] 357c 0025 001c            move.w     #$0025,28(a2)
[00032680] 357c ffff 001e            move.w     #$FFFF,30(a2)
[00032686] 0068 0080 0398            ori.w      #$0080,920(a0)
[0003268c] 0268 fff7 0398            andi.w     #$FFF7,920(a0)
[00032692] 0068 0080 03b0            ori.w      #$0080,944(a0)
[00032698] 0268 fff7 03b0            andi.w     #$FFF7,944(a0)
[0003269e] 7026                      moveq.l    #38,d0
[000326a0] 204a                      movea.l    a2,a0
[000326a2] 4eb9 0005 1b80            jsr        Awi_obredraw
[000326a8] 7027                      moveq.l    #39,d0
[000326aa] 204a                      movea.l    a2,a0
[000326ac] 4eb9 0005 1b80            jsr        Awi_obredraw
[000326b2] 4eb9 0005 147c            jsr        Awi_diastart
[000326b8] 245f                      movea.l    (a7)+,a2
[000326ba] 4e75                      rts
edte_xftext:
[000326bc] 2f0a                      move.l     a2,-(a7)
[000326be] 2f0b                      move.l     a3,-(a7)
[000326c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000326c6] 2468 0258                 movea.l    600(a0),a2
[000326ca] 4eb9 0005 1388            jsr        Awi_diaend
[000326d0] 266a 0014                 movea.l    20(a2),a3
[000326d4] 026b ff7f 0398            andi.w     #$FF7F,920(a3)
[000326da] 006b 0008 0398            ori.w      #$0008,920(a3)
[000326e0] 026b ff7f 03b0            andi.w     #$FF7F,944(a3)
[000326e6] 006b 0008 03b0            ori.w      #$0008,944(a3)
[000326ec] 322b 039a                 move.w     922(a3),d1
[000326f0] 7026                      moveq.l    #38,d0
[000326f2] 204a                      movea.l    a2,a0
[000326f4] 226a 0066                 movea.l    102(a2),a1
[000326f8] 4e91                      jsr        (a1)
[000326fa] 322b 03b2                 move.w     946(a3),d1
[000326fe] 7027                      moveq.l    #39,d0
[00032700] 204a                      movea.l    a2,a0
[00032702] 226a 0066                 movea.l    102(a2),a1
[00032706] 4e91                      jsr        (a1)
[00032708] 4eb9 0005 147c            jsr        Awi_diastart
[0003270e] 265f                      movea.l    (a7)+,a3
[00032710] 245f                      movea.l    (a7)+,a2
[00032712] 4e75                      rts
