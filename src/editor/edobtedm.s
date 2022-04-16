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
[00031c1c] 6b30                      bmi.s      edte_framecol_1
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
edte_framecol_1:
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
[00031c7e] 6b2c                      bmi.s      edte_intercol_1
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
edte_intercol_1:
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
[00031cc8] 6700 00ce                 beq        edte_pattern_1
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
[00031d36] 6f58                      ble.s      edte_pattern_2
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
edte_pattern_2:
[00031d90] 204a                      movea.l    a2,a0
[00031d92] 4eb9 0004 f20a            jsr        Aob_delete
edte_pattern_1:
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
[00031db6] 6700 012c                 beq        edte_pos_1
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
[00031dfa] 670a                      beq.s      edte_pos_2
[00031dfc] 5342                      subq.w     #1,d2
[00031dfe] 670e                      beq.s      edte_pos_3
[00031e00] 5342                      subq.w     #1,d2
[00031e02] 6712                      beq.s      edte_pos_4
[00031e04] 6016                      bra.s      edte_pos_5
edte_pos_2:
[00031e06] 006a 0004 0022            ori.w      #$0004,34(a2)
[00031e0c] 600e                      bra.s      edte_pos_5
edte_pos_3:
[00031e0e] 006a 0004 0052            ori.w      #$0004,82(a2)
[00031e14] 6006                      bra.s      edte_pos_5
edte_pos_4:
[00031e16] 006a 0004 003a            ori.w      #$0004,58(a2)
edte_pos_5:
[00031e1c] 322f 0002                 move.w     2(a7),d1
[00031e20] 3017                      move.w     (a7),d0
[00031e22] 224a                      movea.l    a2,a1
[00031e24] 2053                      movea.l    (a3),a0
[00031e26] 2068 0258                 movea.l    600(a0),a0
[00031e2a] 4eb9 0004 e84a            jsr        Ame_popup
[00031e30] 3200                      move.w     d0,d1
[00031e32] 5341                      subq.w     #1,d1
[00031e34] 670c                      beq.s      edte_pos_6
[00031e36] 5341                      subq.w     #1,d1
[00031e38] 672c                      beq.s      edte_pos_7
[00031e3a] 5341                      subq.w     #1,d1
[00031e3c] 674e                      beq.s      edte_pos_8
[00031e3e] 6000 009c                 bra        edte_pos_9
edte_pos_6:
[00031e42] 2053                      movea.l    (a3),a0
[00031e44] 2268 025c                 movea.l    604(a0),a1
[00031e48] 2069 003c                 movea.l    60(a1),a0
[00031e4c] 4268 0010                 clr.w      16(a0)
[00031e50] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[00031e56] 7017                      moveq.l    #23,d0
[00031e58] 2053                      movea.l    (a3),a0
[00031e5a] 2068 025c                 movea.l    604(a0),a0
[00031e5e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031e64] 604a                      bra.s      edte_pos_10
edte_pos_7:
[00031e66] 2053                      movea.l    (a3),a0
[00031e68] 2268 025c                 movea.l    604(a0),a1
[00031e6c] 2069 003c                 movea.l    60(a1),a0
[00031e70] 317c 0002 0010            move.w     #$0002,16(a0)
[00031e76] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[00031e7c] 7017                      moveq.l    #23,d0
[00031e7e] 2053                      movea.l    (a3),a0
[00031e80] 2068 025c                 movea.l    604(a0),a0
[00031e84] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031e8a] 6024                      bra.s      edte_pos_10
edte_pos_8:
[00031e8c] 2053                      movea.l    (a3),a0
[00031e8e] 2268 025c                 movea.l    604(a0),a1
[00031e92] 2069 003c                 movea.l    60(a1),a0
[00031e96] 317c 0001 0010            move.w     #$0001,16(a0)
[00031e9c] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[00031ea2] 7017                      moveq.l    #23,d0
[00031ea4] 2053                      movea.l    (a3),a0
[00031ea6] 2068 025c                 movea.l    604(a0),a0
[00031eaa] 4eb9 0005 0fd8            jsr        Aob_puttext
edte_pos_10:
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
edte_pos_9:
[00031edc] 204a                      movea.l    a2,a0
[00031ede] 4eb9 0004 f20a            jsr        Aob_delete
edte_pos_1:
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
[00031f36] 6700 00f6                 beq        edte_size_1
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
[00031f7a] 6706                      beq.s      edte_size_2
[00031f7c] 5542                      subq.w     #2,d2
[00031f7e] 670a                      beq.s      edte_size_3
[00031f80] 600e                      bra.s      edte_size_4
edte_size_2:
[00031f82] 006a 0004 0022            ori.w      #$0004,34(a2)
[00031f88] 6006                      bra.s      edte_size_4
edte_size_3:
[00031f8a] 006a 0004 003a            ori.w      #$0004,58(a2)
edte_size_4:
[00031f90] 322f 0002                 move.w     2(a7),d1
[00031f94] 3017                      move.w     (a7),d0
[00031f96] 224a                      movea.l    a2,a1
[00031f98] 2053                      movea.l    (a3),a0
[00031f9a] 2068 0258                 movea.l    600(a0),a0
[00031f9e] 4eb9 0004 e84a            jsr        Ame_popup
[00031fa4] 3200                      move.w     d0,d1
[00031fa6] 5341                      subq.w     #1,d1
[00031fa8] 6706                      beq.s      edte_size_5
[00031faa] 5341                      subq.w     #1,d1
[00031fac] 6728                      beq.s      edte_size_6
[00031fae] 6076                      bra.s      edte_size_7
edte_size_5:
[00031fb0] 2053                      movea.l    (a3),a0
[00031fb2] 2268 025c                 movea.l    604(a0),a1
[00031fb6] 2069 003c                 movea.l    60(a1),a0
[00031fba] 317c 0003 000c            move.w     #$0003,12(a0)
[00031fc0] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[00031fc6] 701c                      moveq.l    #28,d0
[00031fc8] 2053                      movea.l    (a3),a0
[00031fca] 2068 025c                 movea.l    604(a0),a0
[00031fce] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031fd4] 6024                      bra.s      edte_size_8
edte_size_6:
[00031fd6] 2053                      movea.l    (a3),a0
[00031fd8] 2268 025c                 movea.l    604(a0),a1
[00031fdc] 2069 003c                 movea.l    60(a1),a0
[00031fe0] 317c 0005 000c            move.w     #$0005,12(a0)
[00031fe6] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[00031fec] 701c                      moveq.l    #28,d0
[00031fee] 2053                      movea.l    (a3),a0
[00031ff0] 2068 025c                 movea.l    604(a0),a0
[00031ff4] 4eb9 0005 0fd8            jsr        Aob_puttext
edte_size_8:
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
edte_size_7:
[00032026] 204a                      movea.l    a2,a0
[00032028] 4eb9 0004 f20a            jsr        Aob_delete
edte_size_1:
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
[00032064] 6b2e                      bmi.s      edte_textcol_1
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
edte_textcol_1:
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
[000320e6] 6700 017a                 beq        edte_type_1
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
[0003212a] 670e                      beq.s      edte_type_2
[0003212c] 5342                      subq.w     #1,d2
[0003212e] 6712                      beq.s      edte_type_3
[00032130] 5f42                      subq.w     #7,d2
[00032132] 6716                      beq.s      edte_type_4
[00032134] 5342                      subq.w     #1,d2
[00032136] 671a                      beq.s      edte_type_5
[00032138] 601e                      bra.s      edte_type_6
edte_type_2:
[0003213a] 006b 0004 0022            ori.w      #$0004,34(a3)
[00032140] 6016                      bra.s      edte_type_6
edte_type_3:
[00032142] 006b 0004 003a            ori.w      #$0004,58(a3)
[00032148] 600e                      bra.s      edte_type_6
edte_type_4:
[0003214a] 006b 0004 0052            ori.w      #$0004,82(a3)
[00032150] 6006                      bra.s      edte_type_6
edte_type_5:
[00032152] 006b 0004 006a            ori.w      #$0004,106(a3)
edte_type_6:
[00032158] 322f 0002                 move.w     2(a7),d1
[0003215c] 3017                      move.w     (a7),d0
[0003215e] 224b                      movea.l    a3,a1
[00032160] 2054                      movea.l    (a4),a0
[00032162] 2068 0258                 movea.l    600(a0),a0
[00032166] 4eb9 0004 e84a            jsr        Ame_popup
[0003216c] 3800                      move.w     d0,d4
[0003216e] 5340                      subq.w     #1,d0
[00032170] 6712                      beq.s      edte_type_7
[00032172] 5340                      subq.w     #1,d0
[00032174] 6742                      beq.s      edte_type_8
[00032176] 5340                      subq.w     #1,d0
[00032178] 675e                      beq.s      edte_type_9
[0003217a] 5340                      subq.w     #1,d0
[0003217c] 6700 008c                 beq        edte_type_10
[00032180] 6000 00a8                 bra        edte_type_11
edte_type_7:
[00032184] 2054                      movea.l    (a4),a0
[00032186] 2268 025c                 movea.l    604(a0),a1
[0003218a] 337c 0015 0036            move.w     #$0015,54(a1)
[00032190] 43ea fd9e                 lea.l      -610(a2),a1
[00032194] 7007                      moveq.l    #7,d0
[00032196] 2054                      movea.l    (a4),a0
[00032198] 2068 025c                 movea.l    604(a0),a0
[0003219c] 4eb9 0005 0fd8            jsr        Aob_puttext
edte_type_13:
[000321a2] b67c 001d                 cmp.w      #$001D,d3
[000321a6] 6708                      beq.s      edte_type_12
[000321a8] b67c 001e                 cmp.w      #$001E,d3
[000321ac] 6600 007c                 bne.w      edte_type_11
edte_type_12:
[000321b0] 4eb9 0003 2664            jsr        edte_xtext
[000321b6] 6072                      bra.s      edte_type_11
edte_type_8:
[000321b8] 2054                      movea.l    (a4),a0
[000321ba] 2268 025c                 movea.l    604(a0),a1
[000321be] 337c 0016 0036            move.w     #$0016,54(a1)
[000321c4] 43ea fda5                 lea.l      -603(a2),a1
[000321c8] 7007                      moveq.l    #7,d0
[000321ca] 2054                      movea.l    (a4),a0
[000321cc] 2068 025c                 movea.l    604(a0),a0
[000321d0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000321d6] 60ca                      bra.s      edte_type_13
edte_type_9:
[000321d8] 2054                      movea.l    (a4),a0
[000321da] 2268 025c                 movea.l    604(a0),a1
[000321de] 337c 001d 0036            move.w     #$001D,54(a1)
[000321e4] 43ea fdaf                 lea.l      -593(a2),a1
[000321e8] 7007                      moveq.l    #7,d0
[000321ea] 2054                      movea.l    (a4),a0
[000321ec] 2068 025c                 movea.l    604(a0),a0
[000321f0] 4eb9 0005 0fd8            jsr        Aob_puttext
edte_type_15:
[000321f6] b67c 0015                 cmp.w      #$0015,d3
[000321fa] 6706                      beq.s      edte_type_14
[000321fc] b67c 0016                 cmp.w      #$0016,d3
[00032200] 6628                      bne.s      edte_type_11
edte_type_14:
[00032202] 4eb9 0003 26bc            jsr        edte_xftext
[00032208] 6020                      bra.s      edte_type_11
edte_type_10:
[0003220a] 2054                      movea.l    (a4),a0
[0003220c] 2268 025c                 movea.l    604(a0),a1
[00032210] 337c 001e 0036            move.w     #$001E,54(a1)
[00032216] 43ea fdb8                 lea.l      -584(a2),a1
[0003221a] 7007                      moveq.l    #7,d0
[0003221c] 2054                      movea.l    (a4),a0
[0003221e] 2068 025c                 movea.l    604(a0),a0
[00032222] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032228] 60cc                      bra.s      edte_type_15
edte_type_11:
[0003222a] 4a44                      tst.w      d4
[0003222c] 6f2c                      ble.s      edte_type_16
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
edte_type_16:
[0003225a] 204b                      movea.l    a3,a0
[0003225c] 4eb9 0004 f20a            jsr        Aob_delete
edte_type_1:
[00032262] 504f                      addq.w     #8,a7
[00032264] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[00032268] 4e75                      rts

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
[000322e6] 6708                      beq.s      edte_ok_1
[000322e8] 0c2c 0016 000f            cmpi.b     #$16,15(a4)
[000322ee] 661a                      bne.s      edte_ok_2
edte_ok_1:
[000322f0] 41f9 000c b9f4            lea.l      $000CB9F4,a0
[000322f6] 2f48 0008                 move.l     a0,8(a7)
[000322fa] 2f48 0004                 move.l     a0,4(a7)
[000322fe] 426f 001a                 clr.w      26(a7)
[00032302] 026c fff7 0010            andi.w     #$FFF7,16(a4)
[00032308] 6032                      bra.s      edte_ok_3
edte_ok_2:
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
edte_ok_3:
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
[00032366] 6f0c                      ble.s      edte_ok_4
[00032368] 3003                      move.w     d3,d0
[0003236a] 4eb9 0002 d888            jsr        char_x
[00032370] 3940 001c                 move.w     d0,28(a4)
edte_ok_4:
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
[0003239e] 6606                      bne.s      set_ted_1
[000323a0] 91c8                      suba.l     a0,a0
[000323a2] 6000 0274                 bra        set_ted_2
set_ted_1:
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
[000323f2] 670e                      beq.s      set_ted_3
[000323f4] 5340                      subq.w     #1,d0
[000323f6] 670a                      beq.s      set_ted_3
[000323f8] 5f40                      subq.w     #7,d0
[000323fa] 6720                      beq.s      set_ted_4
[000323fc] 5340                      subq.w     #1,d0
[000323fe] 671c                      beq.s      set_ted_4
[00032400] 6032                      bra.s      set_ted_5
set_ted_3:
[00032402] 006a 0080 0398            ori.w      #$0080,920(a2)
[00032408] 026a fff7 0398            andi.w     #$FFF7,920(a2)
[0003240e] 006a 0080 03b0            ori.w      #$0080,944(a2)
[00032414] 026a fff7 03b0            andi.w     #$FFF7,944(a2)
[0003241a] 6018                      bra.s      set_ted_5
set_ted_4:
[0003241c] 026a ff7f 0398            andi.w     #$FF7F,920(a2)
[00032422] 006a 0008 0398            ori.w      #$0008,920(a2)
[00032428] 026a ff7f 03b0            andi.w     #$FF7F,944(a2)
[0003242e] 006a 0008 03b0            ori.w      #$0008,944(a2)
set_ted_5:
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
[0003251a] 670a                      beq.s      set_ted_6
[0003251c] 5340                      subq.w     #1,d0
[0003251e] 672a                      beq.s      set_ted_7
[00032520] 5340                      subq.w     #1,d0
[00032522] 6714                      beq.s      set_ted_8
[00032524] 6034                      bra.s      set_ted_9
set_ted_6:
[00032526] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[0003252c] 7017                      moveq.l    #23,d0
[0003252e] 204a                      movea.l    a2,a0
[00032530] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032536] 6022                      bra.s      set_ted_9
set_ted_8:
[00032538] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[0003253e] 7017                      moveq.l    #23,d0
[00032540] 204a                      movea.l    a2,a0
[00032542] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032548] 6010                      bra.s      set_ted_9
set_ted_7:
[0003254a] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[00032550] 7017                      moveq.l    #23,d0
[00032552] 204a                      movea.l    a2,a0
[00032554] 4eb9 0005 0fd8            jsr        Aob_puttext
set_ted_9:
[0003255a] 302c 000c                 move.w     12(a4),d0
[0003255e] 5740                      subq.w     #3,d0
[00032560] 6706                      beq.s      set_ted_10
[00032562] 5540                      subq.w     #2,d0
[00032564] 6714                      beq.s      set_ted_11
[00032566] 6022                      bra.s      set_ted_12
set_ted_10:
[00032568] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[0003256e] 701c                      moveq.l    #28,d0
[00032570] 204a                      movea.l    a2,a0
[00032572] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032578] 6010                      bra.s      set_ted_12
set_ted_11:
[0003257a] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[00032580] 701c                      moveq.l    #28,d0
[00032582] 204a                      movea.l    a2,a0
[00032584] 4eb9 0005 0fd8            jsr        Aob_puttext
set_ted_12:
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
[000325c6] 670e                      beq.s      set_ted_13
[000325c8] 5340                      subq.w     #1,d0
[000325ca] 671a                      beq.s      set_ted_14
[000325cc] 5f40                      subq.w     #7,d0
[000325ce] 6726                      beq.s      set_ted_15
[000325d0] 5340                      subq.w     #1,d0
[000325d2] 6732                      beq.s      set_ted_16
[000325d4] 603e                      bra.s      set_ted_17
set_ted_13:
[000325d6] 43ed f61e                 lea.l      -2530(a5),a1
[000325da] 7007                      moveq.l    #7,d0
[000325dc] 204a                      movea.l    a2,a0
[000325de] 4eb9 0005 0fd8            jsr        Aob_puttext
[000325e4] 602e                      bra.s      set_ted_17
set_ted_14:
[000325e6] 43ed f625                 lea.l      -2523(a5),a1
[000325ea] 7007                      moveq.l    #7,d0
[000325ec] 204a                      movea.l    a2,a0
[000325ee] 4eb9 0005 0fd8            jsr        Aob_puttext
[000325f4] 601e                      bra.s      set_ted_17
set_ted_15:
[000325f6] 43ed f62f                 lea.l      -2513(a5),a1
[000325fa] 7007                      moveq.l    #7,d0
[000325fc] 204a                      movea.l    a2,a0
[000325fe] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032604] 600e                      bra.s      set_ted_17
set_ted_16:
[00032606] 43ed f638                 lea.l      -2504(a5),a1
[0003260a] 7007                      moveq.l    #7,d0
[0003260c] 204a                      movea.l    a2,a0
[0003260e] 4eb9 0005 0fd8            jsr        Aob_puttext
set_ted_17:
[00032614] 2a8a                      move.l     a2,(a5)
[00032616] 204d                      movea.l    a5,a0
set_ted_2:
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

	.data

TEXT_003:
[000caf84]                           dc.w $4f4b
[000caf86]                           dc.w $0041
[000caf88]                           dc.b 'bbruch',0
TEXT_01:
[000caf8f]                           dc.b 'Position:',0
TEXT_02:
[000caf99]                           dc.b '1234',0
TEXT_03:
[000caf9e]                           dc.b 'EDIT:____',0
TEXT_04:
[000cafa8]                           dc.b '9999',0
TEXT_05:
[000cafad]                           dc.b 'Typ:',0
TEXT_06:
[000cafb2]                           dc.b 'Modus:',0
TEXT_07:
[000cafb9]                           dc.b 'Muster:',0
TEXT_08:
[000cafc1]                           dc.b 'Text:',0
TEXT_09:
[000cafc7]                           dc.b 'Rand:',0
TEXT_11:
[000cafcd]                           dc.b 'Tmp:',0
TEXT_12:
[000cafd2]                           dc.b 'Val:',0
TEXT_13:
[000cafd7]                           dc.b 'Rahmen:',0
TEXT_14:
[000cafdf]                           dc.b 'Gr”že:',0
TEXT_15:
[000cafe6]                           dc.b 'Farbe:',0
TEXT_17:
[000cafed]                           dc.b 'Innenfl„che:',0
TYPE0:
[000caffa]                           dc.b '  Text',0
TYPE1:
[000cb001]                           dc.b '  BoxText',0
TYPE2:
[000cb00b]                           dc.b '  F-Text',0
TYPE3:
[000cb014]                           dc.b '  F-BoxText',0
help_title:
[000cb020]                           dc.b 'Der TEDINFO-Editor',0
title:
[000cb033]                           dc.b ' TEDINFOS -',0
[000cb03f]                           dc.b $00
[000cb040] 000caf99                  dc.l TEXT_02
[000cb044] 000caf9e                  dc.l TEXT_03
[000cb048] 000cafa8                  dc.l TEXT_04
[000cb04c]                           dc.w $0003
[000cb04e]                           dc.w $0006
[000cb050]                           dc.w $0002
[000cb052]                           dc.w $1180
[000cb054]                           dc.w $0000
[000cb056]                           dc.w $ffff
[000cb058]                           dc.w $0005
[000cb05a]                           dc.w $000a
A_3DBUTTON01:
[000cb05c] 00064a22                  dc.l A_3Dbutton
[000cb060]                           dc.w $2011
[000cb062]                           dc.w $9178
[000cb064] 000630f2                  dc.l Auo_string
[000cb068]                           dc.w $0000
[000cb06a]                           dc.w $0000
[000cb06c]                           dc.w $0000
[000cb06e]                           dc.w $0000
[000cb070]                           dc.w $0000
[000cb072]                           dc.w $0000
[000cb074]                           dc.w $0000
[000cb076]                           dc.w $0000
[000cb078]                           dc.w $0000
[000cb07a]                           dc.w $0000
A_3DBUTTON02:
[000cb07c] 00064a22                  dc.l A_3Dbutton
[000cb080]                           dc.w $29c1
[000cb082]                           dc.w $0178
[000cb084] 000630f2                  dc.l Auo_string
[000cb088] 000caf84                  dc.l TEXT_003
[000cb08c]                           dc.w $0000
[000cb08e]                           dc.w $0000
[000cb090]                           dc.w $0000
[000cb092]                           dc.w $0000
[000cb094]                           dc.w $0000
[000cb096]                           dc.w $0000
[000cb098]                           dc.w $0000
[000cb09a]                           dc.w $0000
A_3DBUTTON03:
[000cb09c] 00064a22                  dc.l A_3Dbutton
[000cb0a0]                           dc.w $29c1
[000cb0a2]                           dc.w $0178
[000cb0a4] 000630f2                  dc.l Auo_string
[000cb0a8] 000caf87                  dc.l TEXT_004
[000cb0ac]                           dc.w $0000
[000cb0ae]                           dc.w $0000
[000cb0b0]                           dc.w $0000
[000cb0b2]                           dc.w $0000
[000cb0b4]                           dc.w $0000
[000cb0b6]                           dc.w $0000
[000cb0b8]                           dc.w $0000
[000cb0ba]                           dc.w $0000
A_3DBUTTON04:
[000cb0bc] 00064a22                  dc.l A_3Dbutton
[000cb0c0]                           dc.w $09f1
[000cb0c2]                           dc.w $0178
[000cb0c4] 000630f2                  dc.l Auo_string
[000cb0c8] 000cb00b                  dc.l TYPE2
[000cb0cc]                           dc.w $0000
[000cb0ce]                           dc.w $0000
[000cb0d0]                           dc.w $0000
[000cb0d2]                           dc.w $0000
[000cb0d4]                           dc.w $0000
[000cb0d6]                           dc.w $0000
[000cb0d8]                           dc.w $0000
[000cb0da]                           dc.w $0000
A_3DBUTTON05:
[000cb0dc] 00064a22                  dc.l A_3Dbutton
[000cb0e0]                           dc.w $21f1
[000cb0e2]                           dc.w $0178
[000cb0e4] 000630f2                  dc.l Auo_string
[000cb0e8]                           dc.w $0000
[000cb0ea]                           dc.w $0000
[000cb0ec]                           dc.w $0000
[000cb0ee]                           dc.w $0000
[000cb0f0]                           dc.w $0000
[000cb0f2]                           dc.w $0000
[000cb0f4]                           dc.w $0000
[000cb0f6]                           dc.w $0000
[000cb0f8]                           dc.w $0000
[000cb0fa]                           dc.w $0000
A_3DBUTTON07:
[000cb0fc] 00064a22                  dc.l A_3Dbutton
[000cb100]                           dc.w $09f1
[000cb102]                           dc.w $0178
[000cb104] 000630f2                  dc.l Auo_string
[000cb108] 000cb001                  dc.l TYPE1
[000cb10c]                           dc.w $0000
[000cb10e]                           dc.w $0000
[000cb110]                           dc.w $0000
[000cb112]                           dc.w $0000
[000cb114]                           dc.w $0000
[000cb116]                           dc.w $0000
[000cb118]                           dc.w $0000
[000cb11a]                           dc.w $0000
A_3DBUTTON09:
[000cb11c] 00064a22                  dc.l A_3Dbutton
[000cb120]                           dc.w $29f1
[000cb122]                           dc.w $0178
[000cb124] 000630f2                  dc.l Auo_string
[000cb128]                           dc.w $0000
[000cb12a]                           dc.w $0000
[000cb12c]                           dc.w $0000
[000cb12e]                           dc.w $0000
[000cb130]                           dc.w $0000
[000cb132]                           dc.w $0000
[000cb134]                           dc.w $0000
[000cb136]                           dc.w $0000
[000cb138]                           dc.w $0000
[000cb13a]                           dc.w $0000
A_3DBUTTON10:
[000cb13c] 00064a22                  dc.l A_3Dbutton
[000cb140]                           dc.w $09f1
[000cb142]                           dc.w $0178
[000cb144] 000630f2                  dc.l Auo_string
[000cb148] 000caffa                  dc.l TYPE0
[000cb14c]                           dc.w $0000
[000cb14e]                           dc.w $0000
[000cb150]                           dc.w $0000
[000cb152]                           dc.w $0000
[000cb154]                           dc.w $0000
[000cb156]                           dc.w $0000
[000cb158]                           dc.w $0000
[000cb15a]                           dc.w $0000
A_3DBUTTON11:
[000cb15c] 00064a22                  dc.l A_3Dbutton
[000cb160]                           dc.w $09f1
[000cb162]                           dc.w $0178
[000cb164] 000630f2                  dc.l Auo_string
[000cb168] 000cb014                  dc.l TYPE3
[000cb16c]                           dc.w $0000
[000cb16e]                           dc.w $0000
[000cb170]                           dc.w $0000
[000cb172]                           dc.w $0000
[000cb174]                           dc.w $0000
[000cb176]                           dc.w $0000
[000cb178]                           dc.w $0000
[000cb17a]                           dc.w $0000
A_3DBUTTON23:
[000cb17c] 00064a22                  dc.l A_3Dbutton
[000cb180]                           dc.w $09f1
[000cb182]                           dc.w $0178
[000cb184] 000630f2                  dc.l Auo_string
[000cb188]                           dc.w $0000
[000cb18a]                           dc.w $0000
[000cb18c]                           dc.w $0000
[000cb18e]                           dc.w $0000
[000cb190]                           dc.w $0000
[000cb192]                           dc.w $0000
[000cb194]                           dc.w $0000
[000cb196]                           dc.w $0000
[000cb198]                           dc.w $0000
[000cb19a]                           dc.w $0000
A_ARROWS02:
[000cb19c] 00065c72                  dc.l A_arrows
[000cb1a0]                           dc.w $1301
[000cb1a2]                           dc.w $0001
[000cb1a4]                           dc.w $0000
[000cb1a6]                           dc.w $0000
[000cb1a8]                           dc.w $0000
[000cb1aa]                           dc.w $0000
[000cb1ac]                           dc.w $0000
[000cb1ae]                           dc.w $0000
[000cb1b0]                           dc.w $0000
[000cb1b2]                           dc.w $0000
[000cb1b4]                           dc.w $0000
[000cb1b6]                           dc.w $0000
[000cb1b8]                           dc.w $0000
[000cb1ba]                           dc.w $0000
A_BOXED01:
[000cb1bc] 0006afea                  dc.l A_boxed
[000cb1c0]                           dc.w $9038
[000cb1c2]                           dc.w $5012
[000cb1c4] 0006a068                  dc.l Auo_boxed
[000cb1c8]                           dc.w $0000
[000cb1ca]                           dc.w $0000
[000cb1cc]                           dc.w $0000
[000cb1ce]                           dc.w $0000
[000cb1d0]                           dc.w $0000
[000cb1d2]                           dc.w $0000
[000cb1d4]                           dc.w $0000
[000cb1d6]                           dc.w $0000
[000cb1d8]                           dc.w $0000
[000cb1da]                           dc.w $0000
A_BOXED02:
[000cb1dc] 0006afea                  dc.l A_boxed
[000cb1e0]                           dc.w $9000
[000cb1e2]                           dc.w $5012
[000cb1e4] 0006a068                  dc.l Auo_boxed
[000cb1e8]                           dc.w $0000
[000cb1ea]                           dc.w $0000
[000cb1ec]                           dc.w $0000
[000cb1ee]                           dc.w $0000
[000cb1f0]                           dc.w $0000
[000cb1f2]                           dc.w $0000
[000cb1f4]                           dc.w $0000
[000cb1f6]                           dc.w $0000
[000cb1f8]                           dc.w $0000
[000cb1fa]                           dc.w $0000
A_INNERFRAME01:
[000cb1fc] 00064256                  dc.l A_innerframe
[000cb200]                           dc.w $1000
[000cb202]                           dc.w $8f19
[000cb204] 000630f2                  dc.l Auo_string
[000cb208] 000cafc1                  dc.l TEXT_08
[000cb20c]                           dc.w $0000
[000cb20e]                           dc.w $0000
[000cb210]                           dc.w $0000
[000cb212]                           dc.w $0000
[000cb214]                           dc.w $0000
[000cb216]                           dc.w $0000
[000cb218]                           dc.w $0000
[000cb21a]                           dc.w $0000
A_INNERFRAME02:
[000cb21c] 00064256                  dc.l A_innerframe
[000cb220]                           dc.w $1000
[000cb222]                           dc.w $8f19
[000cb224] 000630f2                  dc.l Auo_string
[000cb228] 000cafed                  dc.l TEXT_17
[000cb22c]                           dc.w $0000
[000cb22e]                           dc.w $0000
[000cb230]                           dc.w $0000
[000cb232]                           dc.w $0000
[000cb234]                           dc.w $0000
[000cb236]                           dc.w $0000
[000cb238]                           dc.w $0000
[000cb23a]                           dc.w $0000
A_INNERFRAME04:
[000cb23c] 00064256                  dc.l A_innerframe
[000cb240]                           dc.w $1000
[000cb242]                           dc.w $8f19
[000cb244] 000630f2                  dc.l Auo_string
[000cb248] 000cafd7                  dc.l TEXT_13
[000cb24c]                           dc.w $0000
[000cb24e]                           dc.w $0000
[000cb250]                           dc.w $0000
[000cb252]                           dc.w $0000
[000cb254]                           dc.w $0000
[000cb256]                           dc.w $0000
[000cb258]                           dc.w $0000
[000cb25a]                           dc.w $0000
POP_TYPESEL:
[000cb25c]                           dc.w $ffff
[000cb25e]                           dc.w $0001
[000cb260]                           dc.w $0004
[000cb262]                           dc.w $0014
[000cb264]                           dc.w $0000
[000cb266]                           dc.w $0020
[000cb268]                           dc.w $00ff
[000cb26a]                           dc.w $1100
[000cb26c]                           dc.w $0000
[000cb26e]                           dc.w $0000
[000cb270]                           dc.w $000d
[000cb272]                           dc.w $0004
_01_POP_TYPESEL:
[000cb274]                           dc.w $0002
[000cb276]                           dc.w $ffff
[000cb278]                           dc.w $ffff
[000cb27a]                           dc.w $0018
[000cb27c]                           dc.w $0041
[000cb27e]                           dc.w $0000
[000cb280] 000cb13c                  dc.l A_3DBUTTON10
[000cb284]                           dc.w $0000
[000cb286]                           dc.w $0000
[000cb288]                           dc.w $000d
[000cb28a]                           dc.w $0001
_02_POP_TYPESEL:
[000cb28c]                           dc.w $0003
[000cb28e]                           dc.w $ffff
[000cb290]                           dc.w $ffff
[000cb292]                           dc.w $0018
[000cb294]                           dc.w $0041
[000cb296]                           dc.w $0000
[000cb298] 000cb0fc                  dc.l A_3DBUTTON07
[000cb29c]                           dc.w $0000
[000cb29e]                           dc.w $0001
[000cb2a0]                           dc.w $000d
[000cb2a2]                           dc.w $0001
_03_POP_TYPESEL:
[000cb2a4]                           dc.w $0004
[000cb2a6]                           dc.w $ffff
[000cb2a8]                           dc.w $ffff
[000cb2aa]                           dc.w $0018
[000cb2ac]                           dc.w $0041
[000cb2ae]                           dc.w $0000
[000cb2b0] 000cb0bc                  dc.l A_3DBUTTON04
[000cb2b4]                           dc.w $0000
[000cb2b6]                           dc.w $0002
[000cb2b8]                           dc.w $000d
[000cb2ba]                           dc.w $0001
_04_POP_TYPESEL:
[000cb2bc]                           dc.w $0000
[000cb2be]                           dc.w $ffff
[000cb2c0]                           dc.w $ffff
[000cb2c2]                           dc.w $0018
[000cb2c4]                           dc.w $0061
[000cb2c6]                           dc.w $0000
[000cb2c8] 000cb15c                  dc.l A_3DBUTTON11
[000cb2cc]                           dc.w $0000
[000cb2ce]                           dc.w $0003
[000cb2d0]                           dc.w $000d
[000cb2d2]                           dc.w $0001
ED_TEDI:
[000cb2d4]                           dc.w $ffff
[000cb2d6]                           dc.w $0001
[000cb2d8]                           dc.w $0040
[000cb2da]                           dc.w $0018
[000cb2dc]                           dc.w $0040
[000cb2de]                           dc.w $0010
[000cb2e0] 000cb0dc                  dc.l A_3DBUTTON05
[000cb2e4]                           dc.w $0000
[000cb2e6]                           dc.w $0000
[000cb2e8]                           dc.w $0043
[000cb2ea]                           dc.w $0012
_01_ED_TEDI:
[000cb2ec]                           dc.w $0003
[000cb2ee]                           dc.w $0002
[000cb2f0]                           dc.w $0002
[000cb2f2]                           dc.w $0018
[000cb2f4]                           dc.w $0000
[000cb2f6]                           dc.w $0010
[000cb2f8] 000cb11c                  dc.l A_3DBUTTON09
[000cb2fc]                           dc.w $0000
[000cb2fe]                           dc.w $0000
[000cb300]                           dc.w $000e
[000cb302]                           dc.w $0004
_02_ED_TEDI:
[000cb304]                           dc.w $0001
[000cb306]                           dc.w $ffff
[000cb308]                           dc.w $ffff
[000cb30a]                           dc.w $001e
[000cb30c]                           dc.w $0040
[000cb30e]                           dc.w $0000
[000cb310] 000cb040                  dc.l TEDINFO_01
[000cb314]                           dc.w $0001
[000cb316]                           dc.w $0001
[000cb318]                           dc.w $000c
[000cb31a]                           dc.w $0002
_03_ED_TEDI:
[000cb31c]                           dc.w $0005
[000cb31e]                           dc.w $0004
[000cb320]                           dc.w $0004
[000cb322]                           dc.w $001c
[000cb324]                           dc.w $0040
[000cb326]                           dc.w $0000
[000cb328] 000cafad                  dc.l TEXT_05
[000cb32c]                           dc.w $0010
[000cb32e]                           dc.w $0001
[000cb330]                           dc.w $0005
[000cb332]                           dc.w $0001
_04_ED_TEDI:
[000cb334]                           dc.w $0003
[000cb336]                           dc.w $ffff
[000cb338]                           dc.w $ffff
[000cb33a]                           dc.w $0018
[000cb33c]                           dc.w $0040
[000cb33e]                           dc.w $0000
[000cb340] 000cb19c                  dc.l A_ARROWS02
[000cb344]                           dc.w $0000
[000cb346]                           dc.w $0000
[000cb348]                           dc.w $0001
[000cb34a]                           dc.w $0001
_05_ED_TEDI:
[000cb34c]                           dc.w $0008
[000cb34e]                           dc.w $0007
[000cb350]                           dc.w $0007
[000cb352]                           dc.w $0014
[000cb354]                           dc.w $0040
[000cb356]                           dc.w $0020
[000cb358]                           dc.w $00ff
[000cb35a]                           dc.w $1101
[000cb35c]                           dc.w $0015
[000cb35e]                           dc.w $0001
[000cb360]                           dc.w $000d
[000cb362]                           dc.w $0001
_05aED_TEDI:
[000cb364] 000320ce                  dc.l edte_type
[000cb368]                           dc.w $0000
[000cb36a]                           dc.w $0000
[000cb36c]                           dc.w $8000
[000cb36e]                           dc.w $8854
[000cb370]                           dc.w $0000
[000cb372]                           dc.w $0000
[000cb374]                           dc.w $0000
[000cb376]                           dc.w $0000
[000cb378]                           dc.w $0000
[000cb37a]                           dc.w $0000
_07_ED_TEDI:
[000cb37c]                           dc.w $0005
[000cb37e]                           dc.w $ffff
[000cb380]                           dc.w $ffff
[000cb382]                           dc.w $0018
[000cb384]                           dc.w $0000
[000cb386]                           dc.w $0000
[000cb388] 000cb17c                  dc.l A_3DBUTTON23
[000cb38c]                           dc.w $0000
[000cb38e]                           dc.w $0000
[000cb390]                           dc.w $000d
[000cb392]                           dc.w $0001
_08_ED_TEDI:
[000cb394]                           dc.w $000a
[000cb396]                           dc.w $ffff
[000cb398]                           dc.w $ffff
[000cb39a]                           dc.w $0018
[000cb39c]                           dc.w $4007
[000cb39e]                           dc.w $0010
[000cb3a0] 000cb07c                  dc.l A_3DBUTTON02
[000cb3a4]                           dc.w $0027
[000cb3a6]                           dc.w $0001
[000cb3a8]                           dc.w $000c
[000cb3aa]                           dc.w $0002
_08aED_TEDI:
[000cb3ac] 0003226a                  dc.l edte_ok
[000cb3b0]                           dc.w $0000
[000cb3b2]                           dc.w $0000
[000cb3b4]                           dc.w $8000
[000cb3b6]                           dc.w $884f
[000cb3b8]                           dc.w $0000
[000cb3ba]                           dc.w $0000
[000cb3bc]                           dc.w $0000
[000cb3be]                           dc.w $0000
[000cb3c0]                           dc.w $0000
[000cb3c2]                           dc.w $0000
_10_ED_TEDI:
[000cb3c4]                           dc.w $000c
[000cb3c6]                           dc.w $ffff
[000cb3c8]                           dc.w $ffff
[000cb3ca]                           dc.w $0018
[000cb3cc]                           dc.w $4005
[000cb3ce]                           dc.w $0010
[000cb3d0] 000cb09c                  dc.l A_3DBUTTON03
[000cb3d4]                           dc.w $0035
[000cb3d6]                           dc.w $0001
[000cb3d8]                           dc.w $000c
[000cb3da]                           dc.w $0002
_10aED_TEDI:
[000cb3dc] 0002f27c                  dc.l ed_abort
[000cb3e0]                           dc.w $0000
[000cb3e2]                           dc.w $0000
[000cb3e4]                           dc.w $8000
[000cb3e6]                           dc.w $8841
[000cb3e8]                           dc.w $0000
[000cb3ea]                           dc.w $0000
[000cb3ec]                           dc.w $0000
[000cb3ee]                           dc.w $0000
[000cb3f0]                           dc.w $0000
[000cb3f2]                           dc.w $0000
_12_ED_TEDI:
[000cb3f4]                           dc.w $002a
[000cb3f6]                           dc.w $000d
[000cb3f8]                           dc.w $0029
[000cb3fa]                           dc.w $0018
[000cb3fc]                           dc.w $0040
[000cb3fe]                           dc.w $0000
[000cb400] 000cb1fc                  dc.l A_INNERFRAME01
[000cb404]                           dc.w $0001
[000cb406]                           dc.w $0004
[000cb408]                           dc.w $0041
[000cb40a]                           dc.w $0009
_13_ED_TEDI:
[000cb40c]                           dc.w $000f
[000cb40e]                           dc.w $000e
[000cb410]                           dc.w $000e
[000cb412]                           dc.w $001c
[000cb414]                           dc.w $0040
[000cb416]                           dc.w $0000
[000cb418] 000cafe6                  dc.l TEXT_15
[000cb41c]                           dc.w $0001
[000cb41e]                           dc.w $0001
[000cb420]                           dc.w $0006
[000cb422]                           dc.w $0001
_14_ED_TEDI:
[000cb424]                           dc.w $000d
[000cb426]                           dc.w $ffff
[000cb428]                           dc.w $ffff
[000cb42a]                           dc.w $0018
[000cb42c]                           dc.w $0040
[000cb42e]                           dc.w $0000
[000cb430] 000cb19c                  dc.l A_ARROWS02
[000cb434]                           dc.w $0000
[000cb436]                           dc.w $0000
[000cb438]                           dc.w $0001
[000cb43a]                           dc.w $0001
_15_ED_TEDI:
[000cb43c]                           dc.w $0013
[000cb43e]                           dc.w $0011
[000cb440]                           dc.w $0012
[000cb442]                           dc.w $0014
[000cb444]                           dc.w $0040
[000cb446]                           dc.w $0020
[000cb448]                           dc.w $00ff
[000cb44a]                           dc.w $1101
[000cb44c]                           dc.w $0008
[000cb44e]                           dc.w $0001
[000cb450]                           dc.w $0012
[000cb452]                           dc.w $0001
_15aED_TEDI:
[000cb454] 00032036                  dc.l edte_textcol
[000cb458]                           dc.w $0000
[000cb45a]                           dc.w $0000
[000cb45c]                           dc.w $8000
[000cb45e]                           dc.w $8846
[000cb460]                           dc.w $0000
[000cb462]                           dc.w $0000
[000cb464]                           dc.w $0000
[000cb466]                           dc.w $0000
[000cb468]                           dc.w $0000
[000cb46a]                           dc.w $0000
_17_ED_TEDI:
[000cb46c]                           dc.w $0012
[000cb46e]                           dc.w $ffff
[000cb470]                           dc.w $ffff
[000cb472]                           dc.w $0014
[000cb474]                           dc.w $0000
[000cb476]                           dc.w $0000
[000cb478]                           dc.w $0001
[000cb47a]                           dc.w $1171
[000cb47c]                           dc.w $0010
[000cb47e]                           dc.w $0000
[000cb480]                           dc.w $0002
[000cb482]                           dc.w $0001
_18_ED_TEDI:
[000cb484]                           dc.w $000f
[000cb486]                           dc.w $ffff
[000cb488]                           dc.w $ffff
[000cb48a]                           dc.w $0018
[000cb48c]                           dc.w $0000
[000cb48e]                           dc.w $0000
[000cb490] 000cb17c                  dc.l A_3DBUTTON23
[000cb494]                           dc.w $0000
[000cb496]                           dc.w $0000
[000cb498]                           dc.w $0010
[000cb49a]                           dc.w $0001
_19_ED_TEDI:
[000cb49c]                           dc.w $0015
[000cb49e]                           dc.w $0014
[000cb4a0]                           dc.w $0014
[000cb4a2]                           dc.w $001c
[000cb4a4]                           dc.w $0040
[000cb4a6]                           dc.w $0000
[000cb4a8] 000caf8f                  dc.l TEXT_01
[000cb4ac]                           dc.w $0020
[000cb4ae]                           dc.w $0001
[000cb4b0]                           dc.w $0009
[000cb4b2]                           dc.w $0001
_20_ED_TEDI:
[000cb4b4]                           dc.w $0013
[000cb4b6]                           dc.w $ffff
[000cb4b8]                           dc.w $ffff
[000cb4ba]                           dc.w $0018
[000cb4bc]                           dc.w $0040
[000cb4be]                           dc.w $0000
[000cb4c0] 000cb19c                  dc.l A_ARROWS02
[000cb4c4]                           dc.w $0000
[000cb4c6]                           dc.w $0000
[000cb4c8]                           dc.w $0001
[000cb4ca]                           dc.w $0001
_21_ED_TEDI:
[000cb4cc]                           dc.w $0018
[000cb4ce]                           dc.w $0017
[000cb4d0]                           dc.w $0017
[000cb4d2]                           dc.w $0014
[000cb4d4]                           dc.w $0040
[000cb4d6]                           dc.w $0020
[000cb4d8]                           dc.w $00ff
[000cb4da]                           dc.w $1101
[000cb4dc]                           dc.w $002a
[000cb4de]                           dc.w $0001
[000cb4e0]                           dc.w $000a
[000cb4e2]                           dc.w $0001
_21aED_TEDI:
[000cb4e4] 00031da0                  dc.l edte_pos
[000cb4e8]                           dc.w $0000
[000cb4ea]                           dc.w $0000
[000cb4ec]                           dc.w $8000
[000cb4ee]                           dc.w $8850
[000cb4f0]                           dc.w $0000
[000cb4f2]                           dc.w $0000
[000cb4f4]                           dc.w $0000
[000cb4f6]                           dc.w $0000
[000cb4f8]                           dc.w $0000
[000cb4fa]                           dc.w $0000
_23_ED_TEDI:
[000cb4fc]                           dc.w $0015
[000cb4fe]                           dc.w $ffff
[000cb500]                           dc.w $ffff
[000cb502]                           dc.w $0018
[000cb504]                           dc.w $0000
[000cb506]                           dc.w $0000
[000cb508] 000cb17c                  dc.l A_3DBUTTON23
[000cb50c]                           dc.w $0000
[000cb50e]                           dc.w $0000
[000cb510]                           dc.w $000a
[000cb512]                           dc.w $0001
_24_ED_TEDI:
[000cb514]                           dc.w $001a
[000cb516]                           dc.w $0019
[000cb518]                           dc.w $0019
[000cb51a]                           dc.w $001c
[000cb51c]                           dc.w $0040
[000cb51e]                           dc.w $0000
[000cb520] 000cafdf                  dc.l TEXT_14
[000cb524]                           dc.w $0001
[000cb526]                           dc.w $0003
[000cb528]                           dc.w $0006
[000cb52a]                           dc.w $0001
_25_ED_TEDI:
[000cb52c]                           dc.w $0018
[000cb52e]                           dc.w $ffff
[000cb530]                           dc.w $ffff
[000cb532]                           dc.w $0018
[000cb534]                           dc.w $0040
[000cb536]                           dc.w $0000
[000cb538] 000cb19c                  dc.l A_ARROWS02
[000cb53c]                           dc.w $0000
[000cb53e]                           dc.w $0000
[000cb540]                           dc.w $0001
[000cb542]                           dc.w $0001
_26_ED_TEDI:
[000cb544]                           dc.w $001d
[000cb546]                           dc.w $001c
[000cb548]                           dc.w $001c
[000cb54a]                           dc.w $0014
[000cb54c]                           dc.w $0040
[000cb54e]                           dc.w $0020
[000cb550]                           dc.w $00ff
[000cb552]                           dc.w $1101
[000cb554]                           dc.w $0008
[000cb556]                           dc.w $0003
[000cb558]                           dc.w $0008
[000cb55a]                           dc.w $0001
_26aED_TEDI:
[000cb55c] 00031f20                  dc.l edte_size
[000cb560]                           dc.w $0000
[000cb562]                           dc.w $0000
[000cb564]                           dc.w $8000
[000cb566]                           dc.w $8847
[000cb568]                           dc.w $0000
[000cb56a]                           dc.w $0000
[000cb56c]                           dc.w $0000
[000cb56e]                           dc.w $0000
[000cb570]                           dc.w $0000
[000cb572]                           dc.w $0000
_28_ED_TEDI:
[000cb574]                           dc.w $001a
[000cb576]                           dc.w $ffff
[000cb578]                           dc.w $ffff
[000cb57a]                           dc.w $0018
[000cb57c]                           dc.w $0000
[000cb57e]                           dc.w $0000
[000cb580] 000cb11c                  dc.l A_3DBUTTON09
[000cb584]                           dc.w $0000
[000cb586]                           dc.w $0000
[000cb588]                           dc.w $0008
[000cb58a]                           dc.w $0001
_29_ED_TEDI:
[000cb58c]                           dc.w $001e
[000cb58e]                           dc.w $ffff
[000cb590]                           dc.w $ffff
[000cb592]                           dc.w $001c
[000cb594]                           dc.w $0040
[000cb596]                           dc.w $0000
[000cb598] 000cafb2                  dc.l TEXT_06
[000cb59c]                           dc.w $0023
[000cb59e]                           dc.w $0003
[000cb5a0]                           dc.w $0006
[000cb5a2]                           dc.w $0001
_30_ED_TEDI:
[000cb5a4]                           dc.w $0020
[000cb5a6]                           dc.w $ffff
[000cb5a8]                           dc.w $ffff
[000cb5aa]                           dc.w $001b
[000cb5ac]                           dc.w $0005
[000cb5ae]                           dc.w $0000
[000cb5b0]                           dc.w $43ff
[000cb5b2]                           dc.w $1121
[000cb5b4]                           dc.w $002a
[000cb5b6]                           dc.w $0003
[000cb5b8]                           dc.w $0003
[000cb5ba]                           dc.w $0001
_30aED_TEDI:
[000cb5bc] 0003209a                  dc.l edte_trans
[000cb5c0]                           dc.w $0000
[000cb5c2]                           dc.w $0000
[000cb5c4]                           dc.w $8000
[000cb5c6]                           dc.w $0000
[000cb5c8]                           dc.w $0000
[000cb5ca]                           dc.w $0000
[000cb5cc]                           dc.w $0000
[000cb5ce]                           dc.w $0000
[000cb5d0]                           dc.w $0000
[000cb5d2]                           dc.w $0000
_32_ED_TEDI:
[000cb5d4]                           dc.w $0022
[000cb5d6]                           dc.w $ffff
[000cb5d8]                           dc.w $ffff
[000cb5da]                           dc.w $001b
[000cb5dc]                           dc.w $0005
[000cb5de]                           dc.w $0000
[000cb5e0]                           dc.w $43ff
[000cb5e2]                           dc.w $11a1
[000cb5e4]                           dc.w $002e
[000cb5e6]                           dc.w $0003
[000cb5e8]                           dc.w $0003
[000cb5ea]                           dc.w $0001
_32aED_TEDI:
[000cb5ec] 00031eec                  dc.l edte_replace
[000cb5f0]                           dc.w $0000
[000cb5f2]                           dc.w $0000
[000cb5f4]                           dc.w $8000
[000cb5f6]                           dc.w $0000
[000cb5f8]                           dc.w $0000
[000cb5fa]                           dc.w $0000
[000cb5fc]                           dc.w $0000
[000cb5fe]                           dc.w $0000
[000cb600]                           dc.w $0000
[000cb602]                           dc.w $0000
_34_ED_TEDI:
[000cb604]                           dc.w $0023
[000cb606]                           dc.w $ffff
[000cb608]                           dc.w $ffff
[000cb60a]                           dc.w $001c
[000cb60c]                           dc.w $0000
[000cb60e]                           dc.w $0000
[000cb610] 000cafc1                  dc.l TEXT_08
[000cb614]                           dc.w $0001
[000cb616]                           dc.w $0005
[000cb618]                           dc.w $0005
[000cb61a]                           dc.w $0001
_35_ED_TEDI:
[000cb61c]                           dc.w $0028
[000cb61e]                           dc.w $0024
[000cb620]                           dc.w $0024
[000cb622]                           dc.w $0018
[000cb624]                           dc.w $0040
[000cb626]                           dc.w $0000
[000cb628] 000cb05c                  dc.l A_3DBUTTON01
[000cb62c]                           dc.w $0007
[000cb62e]                           dc.w $0005
[000cb630]                           dc.w $0039
[000cb632]                           dc.w $0003
_36_ED_TEDI:
[000cb634]                           dc.w $0023
[000cb636]                           dc.w $0025
[000cb638]                           dc.w $0027
[000cb63a]                           dc.w $0014
[000cb63c]                           dc.w $0040
[000cb63e]                           dc.w $0000
[000cb640]                           dc.w $00ff
[000cb642]                           dc.w $0101
[000cb644]                           dc.w $0000
[000cb646]                           dc.w $0000
[000cb648]                           dc.w $0039
[000cb64a]                           dc.w $0003
_37_ED_TEDI:
[000cb64c]                           dc.w $0026
[000cb64e]                           dc.w $ffff
[000cb650]                           dc.w $ffff
[000cb652]                           dc.w $0018
[000cb654]                           dc.w $0008
[000cb656]                           dc.w $0000
[000cb658] 000cb1dc                  dc.l A_BOXED02
[000cb65c]                           dc.w $0000
[000cb65e]                           dc.w $0000
[000cb660]                           dc.w $0039
[000cb662]                           dc.w $0001
_38_ED_TEDI:
[000cb664]                           dc.w $0027
[000cb666]                           dc.w $ffff
[000cb668]                           dc.w $ffff
[000cb66a]                           dc.w $0018
[000cb66c]                           dc.w $0008
[000cb66e]                           dc.w $0000
[000cb670] 000cb1dc                  dc.l A_BOXED02
[000cb674]                           dc.w $0000
[000cb676]                           dc.w $0001
[000cb678]                           dc.w $0039
[000cb67a]                           dc.w $0001
_39_ED_TEDI:
[000cb67c]                           dc.w $0024
[000cb67e]                           dc.w $ffff
[000cb680]                           dc.w $ffff
[000cb682]                           dc.w $0018
[000cb684]                           dc.w $0008
[000cb686]                           dc.w $0000
[000cb688] 000cb1bc                  dc.l A_BOXED01
[000cb68c]                           dc.w $0000
[000cb68e]                           dc.w $0002
[000cb690]                           dc.w $0039
[000cb692]                           dc.w $0001
_40_ED_TEDI:
[000cb694]                           dc.w $0029
[000cb696]                           dc.w $ffff
[000cb698]                           dc.w $ffff
[000cb69a]                           dc.w $001c
[000cb69c]                           dc.w $0000
[000cb69e]                           dc.w $0000
[000cb6a0] 000cafcd                  dc.l TEXT_11
[000cb6a4]                           dc.w $0002
[000cb6a6]                           dc.w $0006
[000cb6a8]                           dc.w $0004
[000cb6aa]                           dc.w $0001
_41_ED_TEDI:
[000cb6ac]                           dc.w $000c
[000cb6ae]                           dc.w $ffff
[000cb6b0]                           dc.w $ffff
[000cb6b2]                           dc.w $001c
[000cb6b4]                           dc.w $0000
[000cb6b6]                           dc.w $0000
[000cb6b8] 000cafd2                  dc.l TEXT_12
[000cb6bc]                           dc.w $0002
[000cb6be]                           dc.w $0007
[000cb6c0]                           dc.w $0004
[000cb6c2]                           dc.w $0001
_42_ED_TEDI:
[000cb6c4]                           dc.w $0040
[000cb6c6]                           dc.w $002b
[000cb6c8]                           dc.w $003e
[000cb6ca]                           dc.w $0018
[000cb6cc]                           dc.w $0040
[000cb6ce]                           dc.w $0000
[000cb6d0] 000cb23c                  dc.l A_INNERFRAME04
[000cb6d4]                           dc.w $0001
[000cb6d6]                           dc.w $000d
[000cb6d8]                           dc.w $0020
[000cb6da]                           dc.w $0005
_43_ED_TEDI:
[000cb6dc]                           dc.w $002d
[000cb6de]                           dc.w $002c
[000cb6e0]                           dc.w $002c
[000cb6e2]                           dc.w $001c
[000cb6e4]                           dc.w $0040
[000cb6e6]                           dc.w $0000
[000cb6e8] 000cafe6                  dc.l TEXT_15
[000cb6ec]                           dc.w $0001
[000cb6ee]                           dc.w $0001
[000cb6f0]                           dc.w $0006
[000cb6f2]                           dc.w $0001
_44_ED_TEDI:
[000cb6f4]                           dc.w $002b
[000cb6f6]                           dc.w $ffff
[000cb6f8]                           dc.w $ffff
[000cb6fa]                           dc.w $0018
[000cb6fc]                           dc.w $0040
[000cb6fe]                           dc.w $0000
[000cb700] 000cb19c                  dc.l A_ARROWS02
[000cb704]                           dc.w $0002
[000cb706]                           dc.w $0000
[000cb708]                           dc.w $0001
[000cb70a]                           dc.w $0001
_45_ED_TEDI:
[000cb70c]                           dc.w $0031
[000cb70e]                           dc.w $002f
[000cb710]                           dc.w $0030
[000cb712]                           dc.w $0014
[000cb714]                           dc.w $0040
[000cb716]                           dc.w $0020
[000cb718]                           dc.w $00ff
[000cb71a]                           dc.w $1101
[000cb71c]                           dc.w $0008
[000cb71e]                           dc.w $0001
[000cb720]                           dc.w $0012
[000cb722]                           dc.w $0001
_45aED_TEDI:
[000cb724] 00031bec                  dc.l edte_framecol
[000cb728]                           dc.w $0000
[000cb72a]                           dc.w $0000
[000cb72c]                           dc.w $8000
[000cb72e]                           dc.w $8852
[000cb730]                           dc.w $0000
[000cb732]                           dc.w $0000
[000cb734]                           dc.w $0000
[000cb736]                           dc.w $0000
[000cb738]                           dc.w $0000
[000cb73a]                           dc.w $0000
_47_ED_TEDI:
[000cb73c]                           dc.w $0030
[000cb73e]                           dc.w $ffff
[000cb740]                           dc.w $ffff
[000cb742]                           dc.w $0014
[000cb744]                           dc.w $0000
[000cb746]                           dc.w $0000
[000cb748]                           dc.w $4301
[000cb74a]                           dc.w $1371
[000cb74c]                           dc.w $0010
[000cb74e]                           dc.w $0000
[000cb750]                           dc.w $0002
[000cb752]                           dc.w $0001
_48_ED_TEDI:
[000cb754]                           dc.w $002d
[000cb756]                           dc.w $ffff
[000cb758]                           dc.w $ffff
[000cb75a]                           dc.w $0018
[000cb75c]                           dc.w $0000
[000cb75e]                           dc.w $0000
[000cb760] 000cb17c                  dc.l A_3DBUTTON23
[000cb764]                           dc.w $0000
[000cb766]                           dc.w $0000
[000cb768]                           dc.w $0010
[000cb76a]                           dc.w $0001
_49_ED_TEDI:
[000cb76c]                           dc.w $0032
[000cb76e]                           dc.w $ffff
[000cb770]                           dc.w $ffff
[000cb772]                           dc.w $001c
[000cb774]                           dc.w $0040
[000cb776]                           dc.w $0000
[000cb778] 000cafc7                  dc.l TEXT_09
[000cb77c]                           dc.w $0002
[000cb77e]                           dc.w $0003
[000cb780]                           dc.w $0006
[000cb782]                           dc.w $0001
_50_ED_TEDI:
[000cb784]                           dc.w $0034
[000cb786]                           dc.w $ffff
[000cb788]                           dc.w $ffff
[000cb78a]                           dc.w $0014
[000cb78c]                           dc.w $0005
[000cb78e]                           dc.w $0000
[000cb790]                           dc.w $0003
[000cb792]                           dc.w $1111
[000cb794]                           dc.w $0008
[000cb796]                           dc.w $0003
[000cb798]                           dc.w $0002
[000cb79a]                           dc.w $0001
_50aED_TEDI:
[000cb79c] 0003261e                  dc.l edte_th
[000cb7a0]                           dc.w $0000
[000cb7a2]                           dc.w $0000
[000cb7a4]                           dc.w $8000
[000cb7a6]                           dc.w $0000
[000cb7a8]                           dc.w $0000
[000cb7aa]                           dc.w $0000
[000cb7ac]                           dc.w $0000
[000cb7ae]                           dc.w $0000
[000cb7b0]                           dc.w $0000
[000cb7b2]                           dc.w $0000
_52_ED_TEDI:
[000cb7b4]                           dc.w $0036
[000cb7b6]                           dc.w $ffff
[000cb7b8]                           dc.w $ffff
[000cb7ba]                           dc.w $0014
[000cb7bc]                           dc.w $0005
[000cb7be]                           dc.w $0000
[000cb7c0]                           dc.w $0002
[000cb7c2]                           dc.w $1111
[000cb7c4]                           dc.w $000b
[000cb7c6]                           dc.w $0003
[000cb7c8]                           dc.w $0002
[000cb7ca]                           dc.w $0001
_52aED_TEDI:
[000cb7cc] 0003261e                  dc.l edte_th
[000cb7d0]                           dc.w $0000
[000cb7d2]                           dc.w $0000
[000cb7d4]                           dc.w $8000
[000cb7d6]                           dc.w $0000
[000cb7d8]                           dc.w $0000
[000cb7da]                           dc.w $0000
[000cb7dc]                           dc.w $0000
[000cb7de]                           dc.w $0000
[000cb7e0]                           dc.w $0000
[000cb7e2]                           dc.w $0000
_54_ED_TEDI:
[000cb7e4]                           dc.w $0038
[000cb7e6]                           dc.w $ffff
[000cb7e8]                           dc.w $ffff
[000cb7ea]                           dc.w $0014
[000cb7ec]                           dc.w $0005
[000cb7ee]                           dc.w $0000
[000cb7f0]                           dc.w $0001
[000cb7f2]                           dc.w $1111
[000cb7f4]                           dc.w $000e
[000cb7f6]                           dc.w $0003
[000cb7f8]                           dc.w $0002
[000cb7fa]                           dc.w $0001
_54aED_TEDI:
[000cb7fc] 0003261e                  dc.l edte_th
[000cb800]                           dc.w $0000
[000cb802]                           dc.w $0000
[000cb804]                           dc.w $8000
[000cb806]                           dc.w $0000
[000cb808]                           dc.w $0000
[000cb80a]                           dc.w $0000
[000cb80c]                           dc.w $0000
[000cb80e]                           dc.w $0000
[000cb810]                           dc.w $0000
[000cb812]                           dc.w $0000
_56_ED_TEDI:
[000cb814]                           dc.w $003a
[000cb816]                           dc.w $ffff
[000cb818]                           dc.w $ffff
[000cb81a]                           dc.w $0014
[000cb81c]                           dc.w $0005
[000cb81e]                           dc.w $0000
[000cb820]                           dc.w $0000
[000cb822]                           dc.w $1111
[000cb824]                           dc.w $0011
[000cb826]                           dc.w $0003
[000cb828]                           dc.w $0002
[000cb82a]                           dc.w $0001
_56aED_TEDI:
[000cb82c] 0003261e                  dc.l edte_th
[000cb830]                           dc.w $0000
[000cb832]                           dc.w $0000
[000cb834]                           dc.w $8000
[000cb836]                           dc.w $0000
[000cb838]                           dc.w $0000
[000cb83a]                           dc.w $0000
[000cb83c]                           dc.w $0000
[000cb83e]                           dc.w $0000
[000cb840]                           dc.w $0000
[000cb842]                           dc.w $0000
_58_ED_TEDI:
[000cb844]                           dc.w $003c
[000cb846]                           dc.w $ffff
[000cb848]                           dc.w $ffff
[000cb84a]                           dc.w $0014
[000cb84c]                           dc.w $0005
[000cb84e]                           dc.w $0000
[000cb850]                           dc.w $00ff
[000cb852]                           dc.w $1111
[000cb854]                           dc.w $0014
[000cb856]                           dc.w $0003
[000cb858]                           dc.w $0002
[000cb85a]                           dc.w $0001
_58aED_TEDI:
[000cb85c] 0003261e                  dc.l edte_th
[000cb860]                           dc.w $0000
[000cb862]                           dc.w $0000
[000cb864]                           dc.w $8000
[000cb866]                           dc.w $0000
[000cb868]                           dc.w $0000
[000cb86a]                           dc.w $0000
[000cb86c]                           dc.w $0000
[000cb86e]                           dc.w $0000
[000cb870]                           dc.w $0000
[000cb872]                           dc.w $0000
_60_ED_TEDI:
[000cb874]                           dc.w $003e
[000cb876]                           dc.w $ffff
[000cb878]                           dc.w $ffff
[000cb87a]                           dc.w $0014
[000cb87c]                           dc.w $0005
[000cb87e]                           dc.w $0000
[000cb880]                           dc.w $00fe
[000cb882]                           dc.w $1111
[000cb884]                           dc.w $0017
[000cb886]                           dc.w $0003
[000cb888]                           dc.w $0002
[000cb88a]                           dc.w $0001
_60aED_TEDI:
[000cb88c] 0003261e                  dc.l edte_th
[000cb890]                           dc.w $0000
[000cb892]                           dc.w $0000
[000cb894]                           dc.w $8000
[000cb896]                           dc.w $0000
[000cb898]                           dc.w $0000
[000cb89a]                           dc.w $0000
[000cb89c]                           dc.w $0000
[000cb89e]                           dc.w $0000
[000cb8a0]                           dc.w $0000
[000cb8a2]                           dc.w $0000
_62_ED_TEDI:
[000cb8a4]                           dc.w $002a
[000cb8a6]                           dc.w $ffff
[000cb8a8]                           dc.w $ffff
[000cb8aa]                           dc.w $0014
[000cb8ac]                           dc.w $0005
[000cb8ae]                           dc.w $0000
[000cb8b0]                           dc.w $00fd
[000cb8b2]                           dc.w $1111
[000cb8b4]                           dc.w $001a
[000cb8b6]                           dc.w $0003
[000cb8b8]                           dc.w $0002
[000cb8ba]                           dc.w $0001
_62aED_TEDI:
[000cb8bc] 0003261e                  dc.l edte_th
[000cb8c0]                           dc.w $0000
[000cb8c2]                           dc.w $0000
[000cb8c4]                           dc.w $8000
[000cb8c6]                           dc.w $0000
[000cb8c8]                           dc.w $0000
[000cb8ca]                           dc.w $0000
[000cb8cc]                           dc.w $0000
[000cb8ce]                           dc.w $0000
[000cb8d0]                           dc.w $0000
[000cb8d2]                           dc.w $0000
_64_ED_TEDI:
[000cb8d4]                           dc.w $0000
[000cb8d6]                           dc.w $0041
[000cb8d8]                           dc.w $0047
[000cb8da]                           dc.w $0018
[000cb8dc]                           dc.w $0000
[000cb8de]                           dc.w $0000
[000cb8e0] 000cb21c                  dc.l A_INNERFRAME02
[000cb8e4]                           dc.w $0022
[000cb8e6]                           dc.w $000d
[000cb8e8]                           dc.w $0020
[000cb8ea]                           dc.w $0005
_65_ED_TEDI:
[000cb8ec]                           dc.w $0043
[000cb8ee]                           dc.w $0042
[000cb8f0]                           dc.w $0042
[000cb8f2]                           dc.w $001c
[000cb8f4]                           dc.w $0040
[000cb8f6]                           dc.w $0000
[000cb8f8] 000cafb9                  dc.l TEXT_07
[000cb8fc]                           dc.w $0001
[000cb8fe]                           dc.w $0001
[000cb900]                           dc.w $0008
[000cb902]                           dc.w $0001
_66_ED_TEDI:
[000cb904]                           dc.w $0041
[000cb906]                           dc.w $ffff
[000cb908]                           dc.w $ffff
[000cb90a]                           dc.w $0018
[000cb90c]                           dc.w $0040
[000cb90e]                           dc.w $0000
[000cb910] 000cb19c                  dc.l A_ARROWS02
[000cb914]                           dc.w $0000
[000cb916]                           dc.w $0000
[000cb918]                           dc.w $0001
[000cb91a]                           dc.w $0001
_67_ED_TEDI:
[000cb91c]                           dc.w $0045
[000cb91e]                           dc.w $ffff
[000cb920]                           dc.w $ffff
[000cb922]                           dc.w $0014
[000cb924]                           dc.w $0040
[000cb926]                           dc.w $0020
[000cb928]                           dc.w $00ff
[000cb92a]                           dc.w $1101
[000cb92c]                           dc.w $0009
[000cb92e]                           dc.w $0001
[000cb930]                           dc.w $0012
[000cb932]                           dc.w $0001
_67aED_TEDI:
[000cb934] 00031cb2                  dc.l edte_pattern
[000cb938]                           dc.w $0000
[000cb93a]                           dc.w $0000
[000cb93c]                           dc.w $8000
[000cb93e]                           dc.w $884d
[000cb940]                           dc.w $0000
[000cb942]                           dc.w $0000
[000cb944]                           dc.w $0000
[000cb946]                           dc.w $0000
[000cb948]                           dc.w $0000
[000cb94a]                           dc.w $0000
_69_ED_TEDI:
[000cb94c]                           dc.w $0047
[000cb94e]                           dc.w $0046
[000cb950]                           dc.w $0046
[000cb952]                           dc.w $001c
[000cb954]                           dc.w $0040
[000cb956]                           dc.w $0000
[000cb958] 000cafe6                  dc.l TEXT_15
[000cb95c]                           dc.w $0002
[000cb95e]                           dc.w $0003
[000cb960]                           dc.w $0006
[000cb962]                           dc.w $0001
_70_ED_TEDI:
[000cb964]                           dc.w $0045
[000cb966]                           dc.w $ffff
[000cb968]                           dc.w $ffff
[000cb96a]                           dc.w $0018
[000cb96c]                           dc.w $0040
[000cb96e]                           dc.w $0000
[000cb970] 000cb19c                  dc.l A_ARROWS02
[000cb974]                           dc.w $0003
[000cb976]                           dc.w $0000
[000cb978]                           dc.w $0001
[000cb97a]                           dc.w $0001
_71_ED_TEDI:
[000cb97c]                           dc.w $0040
[000cb97e]                           dc.w $0049
[000cb980]                           dc.w $004a
[000cb982]                           dc.w $0014
[000cb984]                           dc.w $0040
[000cb986]                           dc.w $0020
[000cb988]                           dc.w $00ff
[000cb98a]                           dc.w $1101
[000cb98c]                           dc.w $0009
[000cb98e]                           dc.w $0003
[000cb990]                           dc.w $0012
[000cb992]                           dc.w $0001
_71aED_TEDI:
[000cb994] 00031c54                  dc.l edte_intercol
[000cb998]                           dc.w $0000
[000cb99a]                           dc.w $0000
[000cb99c]                           dc.w $8000
[000cb99e]                           dc.w $8842
[000cb9a0]                           dc.w $0000
[000cb9a2]                           dc.w $0000
[000cb9a4]                           dc.w $0000
[000cb9a6]                           dc.w $0000
[000cb9a8]                           dc.w $0000
[000cb9aa]                           dc.w $0000
_73_ED_TEDI:
[000cb9ac]                           dc.w $004a
[000cb9ae]                           dc.w $ffff
[000cb9b0]                           dc.w $ffff
[000cb9b2]                           dc.w $0014
[000cb9b4]                           dc.w $0000
[000cb9b6]                           dc.w $0000
[000cb9b8]                           dc.w $0001
[000cb9ba]                           dc.w $1171
[000cb9bc]                           dc.w $0010
[000cb9be]                           dc.w $0000
[000cb9c0]                           dc.w $0002
[000cb9c2]                           dc.w $0001
_74_ED_TEDI:
[000cb9c4]                           dc.w $0047
[000cb9c6]                           dc.w $ffff
[000cb9c8]                           dc.w $ffff
[000cb9ca]                           dc.w $0018
[000cb9cc]                           dc.w $0020
[000cb9ce]                           dc.w $0000
[000cb9d0] 000cb17c                  dc.l A_3DBUTTON23
[000cb9d4]                           dc.w $0000
[000cb9d6]                           dc.w $0000
[000cb9d8]                           dc.w $0010
[000cb9da]                           dc.w $0001
sm:
[000cb9dc]                           dc.w $0000
[000cb9de]                           dc.w $0000
[000cb9e0] 0003226a                  dc.l edte_ok
[000cb9e4] 0004f20a                  dc.l Aob_delete
[000cb9e8] 000cb033                  dc.l title
[000cb9ec] 000cb020                  dc.l help_title
[000cb9f0]                           dc.w $0000
[000cb9f2]                           dc.w $0000
[000cb9f4]                           dc.w $0000

