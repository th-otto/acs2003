ed3d_dither:
[00029a92] 2f0a                      move.l     a2,-(a7)
[00029a94] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00029a9a] 7001                      moveq.l    #1,d0
[00029a9c] 2052                      movea.l    (a2),a0
[00029a9e] 3428 0260                 move.w     608(a0),d2
[00029aa2] 48c2                      ext.l      d2
[00029aa4] 2202                      move.l     d2,d1
[00029aa6] d281                      add.l      d1,d1
[00029aa8] d282                      add.l      d2,d1
[00029aaa] e789                      lsl.l      #3,d1
[00029aac] 2268 025c                 movea.l    604(a0),a1
[00029ab0] c071 180a                 and.w      10(a1,d1.l),d0
[00029ab4] 6700 00b2                 beq        $00029B68
[00029ab8] 2069 003c                 movea.l    60(a1),a0
[00029abc] 5848                      addq.w     #4,a0
[00029abe] 0268 ff8f 0002            andi.w     #$FF8F,2(a0)
[00029ac4] 0068 0070 0002            ori.w      #$0070,2(a0)
[00029aca] 0268 fff0 0002            andi.w     #$FFF0,2(a0)
[00029ad0] 0068 0008 0002            ori.w      #$0008,2(a0)
[00029ad6] 3010                      move.w     (a0),d0
[00029ad8] e048                      lsr.w      #8,d0
[00029ada] c07c 00ff                 and.w      #$00FF,d0
[00029ade] c07c 007f                 and.w      #$007F,d0
[00029ae2] 0250 00ff                 andi.w     #$00FF,(a0)
[00029ae6] c07c 00ff                 and.w      #$00FF,d0
[00029aea] e148                      lsl.w      #8,d0
[00029aec] 8150                      or.w       d0,(a0)
[00029aee] 2279 000c a6f0            movea.l    $000CA6F0,a1
[00029af4] 7041                      moveq.l    #65,d0
[00029af6] 2052                      movea.l    (a2),a0
[00029af8] 2068 025c                 movea.l    604(a0),a0
[00029afc] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029b02] 2052                      movea.l    (a2),a0
[00029b04] 2268 025c                 movea.l    604(a0),a1
[00029b08] 0269 fff0 060e            andi.w     #$FFF0,1550(a1)
[00029b0e] 0069 0008 060e            ori.w      #$0008,1550(a1)
[00029b14] 72ff                      moveq.l    #-1,d1
[00029b16] 703e                      moveq.l    #62,d0
[00029b18] 2052                      movea.l    (a2),a0
[00029b1a] 2068 0258                 movea.l    600(a0),a0
[00029b1e] 2252                      movea.l    (a2),a1
[00029b20] 2269 0258                 movea.l    600(a1),a1
[00029b24] 2269 0066                 movea.l    102(a1),a1
[00029b28] 4e91                      jsr        (a1)
[00029b2a] 2052                      movea.l    (a2),a0
[00029b2c] 2268 025c                 movea.l    604(a0),a1
[00029b30] 0269 ff8f 057e            andi.w     #$FF8F,1406(a1)
[00029b36] 0069 0070 057e            ori.w      #$0070,1406(a1)
[00029b3c] 72ff                      moveq.l    #-1,d1
[00029b3e] 703a                      moveq.l    #58,d0
[00029b40] 2052                      movea.l    (a2),a0
[00029b42] 2068 0258                 movea.l    600(a0),a0
[00029b46] 2252                      movea.l    (a2),a1
[00029b48] 2269 0258                 movea.l    600(a1),a1
[00029b4c] 2269 0066                 movea.l    102(a1),a1
[00029b50] 4e91                      jsr        (a1)
[00029b52] 72ff                      moveq.l    #-1,d1
[00029b54] 7001                      moveq.l    #1,d0
[00029b56] 2052                      movea.l    (a2),a0
[00029b58] 2068 0258                 movea.l    600(a0),a0
[00029b5c] 2252                      movea.l    (a2),a1
[00029b5e] 2269 0258                 movea.l    600(a1),a1
[00029b62] 2269 0066                 movea.l    102(a1),a1
[00029b66] 4e91                      jsr        (a1)
[00029b68] 245f                      movea.l    (a7)+,a2
[00029b6a] 4e75                      rts
ed3d_incol:
[00029b6c] 2f03                      move.l     d3,-(a7)
[00029b6e] 2f0a                      move.l     a2,-(a7)
[00029b70] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029b76] 2268 025c                 movea.l    604(a0),a1
[00029b7a] 2469 003c                 movea.l    60(a1),a2
[00029b7e] 584a                      addq.w     #4,a2
[00029b80] 7031                      moveq.l    #49,d0
[00029b82] 3f00                      move.w     d0,-(a7)
[00029b84] 7432                      moveq.l    #50,d2
[00029b86] 722f                      moveq.l    #47,d1
[00029b88] 2012                      move.l     (a2),d0
[00029b8a] 7618                      moveq.l    #24,d3
[00029b8c] e6a0                      asr.l      d3,d0
[00029b8e] c07c 000f                 and.w      #$000F,d0
[00029b92] 4eb9 0003 0bde            jsr        oe_colsel
[00029b98] 544f                      addq.w     #2,a7
[00029b9a] 3600                      move.w     d0,d3
[00029b9c] 6b30                      bmi.s      $00029BCE
[00029b9e] 2212                      move.l     (a2),d1
[00029ba0] c2bc f0ff ffff            and.l      #$F0FFFFFF,d1
[00029ba6] 48c0                      ext.l      d0
[00029ba8] 7418                      moveq.l    #24,d2
[00029baa] e5a8                      lsl.l      d2,d0
[00029bac] 8280                      or.l       d0,d1
[00029bae] 2481                      move.l     d1,(a2)
[00029bb0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029bb6] 2068 0258                 movea.l    600(a0),a0
[00029bba] 2279 0010 ee4e            movea.l    ACSblk,a1
[00029bc0] 2469 0258                 movea.l    600(a1),a2
[00029bc4] 226a 0066                 movea.l    102(a2),a1
[00029bc8] 7001                      moveq.l    #1,d0
[00029bca] 72ff                      moveq.l    #-1,d1
[00029bcc] 4e91                      jsr        (a1)
[00029bce] 245f                      movea.l    (a7)+,a2
[00029bd0] 261f                      move.l     (a7)+,d3
[00029bd2] 4e75                      rts
ed3d_intercol:
[00029bd4] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00029bd8] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00029bde] 2052                      movea.l    (a2),a0
[00029be0] 2268 025c                 movea.l    604(a0),a1
[00029be4] 2669 003c                 movea.l    60(a1),a3
[00029be8] 584b                      addq.w     #4,a3
[00029bea] 7040                      moveq.l    #64,d0
[00029bec] 3f00                      move.w     d0,-(a7)
[00029bee] 7441                      moveq.l    #65,d2
[00029bf0] 723e                      moveq.l    #62,d1
[00029bf2] 700f                      moveq.l    #15,d0
[00029bf4] c06b 0002                 and.w      2(a3),d0
[00029bf8] 4eb9 0003 0bde            jsr        oe_colsel
[00029bfe] 544f                      addq.w     #2,a7
[00029c00] 3600                      move.w     d0,d3
[00029c02] 6b6a                      bmi.s      $00029C6E
[00029c04] 72f0                      moveq.l    #-16,d1
[00029c06] c293                      and.l      (a3),d1
[00029c08] 48c0                      ext.l      d0
[00029c0a] 8280                      or.l       d0,d1
[00029c0c] 2681                      move.l     d1,(a3)
[00029c0e] 2052                      movea.l    (a2),a0
[00029c10] 2268 025c                 movea.l    604(a0),a1
[00029c14] 2669 003c                 movea.l    60(a1),a3
[00029c18] 02ab 7fff ffff 0004       andi.l     #$7FFFFFFF,4(a3)
[00029c20] 2052                      movea.l    (a2),a0
[00029c22] 2268 0258                 movea.l    600(a0),a1
[00029c26] 2669 0014                 movea.l    20(a1),a3
[00029c2a] 322b 04ea                 move.w     1258(a3),d1
[00029c2e] c27c fffe                 and.w      #$FFFE,d1
[00029c32] 2049                      movea.l    a1,a0
[00029c34] 2269 0066                 movea.l    102(a1),a1
[00029c38] 7034                      moveq.l    #52,d0
[00029c3a] 4e91                      jsr        (a1)
[00029c3c] 2052                      movea.l    (a2),a0
[00029c3e] 2268 0258                 movea.l    600(a0),a1
[00029c42] 2669 0014                 movea.l    20(a1),a3
[00029c46] 322b 051a                 move.w     1306(a3),d1
[00029c4a] c27c fffe                 and.w      #$FFFE,d1
[00029c4e] 7036                      moveq.l    #54,d0
[00029c50] 2049                      movea.l    a1,a0
[00029c52] 2269 0066                 movea.l    102(a1),a1
[00029c56] 4e91                      jsr        (a1)
[00029c58] 72ff                      moveq.l    #-1,d1
[00029c5a] 7001                      moveq.l    #1,d0
[00029c5c] 2052                      movea.l    (a2),a0
[00029c5e] 2068 0258                 movea.l    600(a0),a0
[00029c62] 2252                      movea.l    (a2),a1
[00029c64] 2669 0258                 movea.l    600(a1),a3
[00029c68] 226b 0066                 movea.l    102(a3),a1
[00029c6c] 4e91                      jsr        (a1)
[00029c6e] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00029c72] 4e75                      rts
ed3d_nofill:
[00029c74] 2f0a                      move.l     a2,-(a7)
[00029c76] 2f0b                      move.l     a3,-(a7)
[00029c78] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00029c7e] 2052                      movea.l    (a2),a0
[00029c80] 2268 025c                 movea.l    604(a0),a1
[00029c84] 2669 003c                 movea.l    60(a1),a3
[00029c88] 584b                      addq.w     #4,a3
[00029c8a] 7001                      moveq.l    #1,d0
[00029c8c] 3428 0260                 move.w     608(a0),d2
[00029c90] 48c2                      ext.l      d2
[00029c92] 2202                      move.l     d2,d1
[00029c94] d281                      add.l      d1,d1
[00029c96] d282                      add.l      d2,d1
[00029c98] e789                      lsl.l      #3,d1
[00029c9a] c071 180a                 and.w      10(a1,d1.l),d0
[00029c9e] 6708                      beq.s      $00029CA8
[00029ca0] 0093 8000 0000            ori.l      #$80000000,(a3)
[00029ca6] 6006                      bra.s      $00029CAE
[00029ca8] 0293 7fff ffff            andi.l     #$7FFFFFFF,(a3)
[00029cae] 72ff                      moveq.l    #-1,d1
[00029cb0] 2052                      movea.l    (a2),a0
[00029cb2] 3028 0260                 move.w     608(a0),d0
[00029cb6] 2068 0258                 movea.l    600(a0),a0
[00029cba] 2252                      movea.l    (a2),a1
[00029cbc] 2669 0258                 movea.l    600(a1),a3
[00029cc0] 226b 0066                 movea.l    102(a3),a1
[00029cc4] 4e91                      jsr        (a1)
[00029cc6] 72ff                      moveq.l    #-1,d1
[00029cc8] 7001                      moveq.l    #1,d0
[00029cca] 2052                      movea.l    (a2),a0
[00029ccc] 2068 0258                 movea.l    600(a0),a0
[00029cd0] 2252                      movea.l    (a2),a1
[00029cd2] 2669 0258                 movea.l    600(a1),a3
[00029cd6] 226b 0066                 movea.l    102(a3),a1
[00029cda] 4e91                      jsr        (a1)
[00029cdc] 265f                      movea.l    (a7)+,a3
[00029cde] 245f                      movea.l    (a7)+,a2
[00029ce0] 4e75                      rts
ed3d_outcol:
[00029ce2] 2f03                      move.l     d3,-(a7)
[00029ce4] 2f0a                      move.l     a2,-(a7)
[00029ce6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029cec] 2268 025c                 movea.l    604(a0),a1
[00029cf0] 2469 003c                 movea.l    60(a1),a2
[00029cf4] 584a                      addq.w     #4,a2
[00029cf6] 702a                      moveq.l    #42,d0
[00029cf8] 3f00                      move.w     d0,-(a7)
[00029cfa] 742b                      moveq.l    #43,d2
[00029cfc] 7228                      moveq.l    #40,d1
[00029cfe] 2012                      move.l     (a2),d0
[00029d00] 760c                      moveq.l    #12,d3
[00029d02] e6a0                      asr.l      d3,d0
[00029d04] c07c 000f                 and.w      #$000F,d0
[00029d08] 4eb9 0003 0bde            jsr        oe_colsel
[00029d0e] 544f                      addq.w     #2,a7
[00029d10] 3600                      move.w     d0,d3
[00029d12] 6b30                      bmi.s      $00029D44
[00029d14] 2212                      move.l     (a2),d1
[00029d16] c2bc ffff 0fff            and.l      #$FFFF0FFF,d1
[00029d1c] 48c0                      ext.l      d0
[00029d1e] 740c                      moveq.l    #12,d2
[00029d20] e5a8                      lsl.l      d2,d0
[00029d22] 8280                      or.l       d0,d1
[00029d24] 2481                      move.l     d1,(a2)
[00029d26] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029d2c] 2068 0258                 movea.l    600(a0),a0
[00029d30] 2279 0010 ee4e            movea.l    ACSblk,a1
[00029d36] 2469 0258                 movea.l    600(a1),a2
[00029d3a] 226a 0066                 movea.l    102(a2),a1
[00029d3e] 7001                      moveq.l    #1,d0
[00029d40] 72ff                      moveq.l    #-1,d1
[00029d42] 4e91                      jsr        (a1)
[00029d44] 245f                      movea.l    (a7)+,a2
[00029d46] 261f                      move.l     (a7)+,d3
[00029d48] 4e75                      rts
ed3d_pattern:
[00029d4a] 2f0a                      move.l     a2,-(a7)
[00029d4c] 2f0b                      move.l     a3,-(a7)
[00029d4e] 514f                      subq.w     #8,a7
[00029d50] 41f9 000c 9fc8            lea.l      POP_PATSEL,a0
[00029d56] 4eb9 0004 f064            jsr        Aob_create
[00029d5c] 2448                      movea.l    a0,a2
[00029d5e] 200a                      move.l     a2,d0
[00029d60] 6700 0122                 beq        $00029E84
[00029d64] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00029d6a] 703a                      moveq.l    #58,d0
[00029d6c] 2053                      movea.l    (a3),a0
[00029d6e] 2268 0258                 movea.l    600(a0),a1
[00029d72] 2269 0014                 movea.l    20(a1),a1
[00029d76] 41d7                      lea.l      (a7),a0
[00029d78] 4eb9 0004 fe06            jsr        Aob_offset
[00029d7e] 7001                      moveq.l    #1,d0
[00029d80] 2053                      movea.l    (a3),a0
[00029d82] 2268 0258                 movea.l    600(a0),a1
[00029d86] d069 0034                 add.w      52(a1),d0
[00029d8a] d157                      add.w      d0,(a7)
[00029d8c] 7201                      moveq.l    #1,d1
[00029d8e] d269 0036                 add.w      54(a1),d1
[00029d92] d36f 0002                 add.w      d1,2(a7)
[00029d96] 2268 025c                 movea.l    604(a0),a1
[00029d9a] 2069 003c                 movea.l    60(a1),a0
[00029d9e] 2028 0004                 move.l     4(a0),d0
[00029da2] e880                      asr.l      #4,d0
[00029da4] c07c 0007                 and.w      #$0007,d0
[00029da8] 48c0                      ext.l      d0
[00029daa] 2400                      move.l     d0,d2
[00029dac] d482                      add.l      d2,d2
[00029dae] d480                      add.l      d0,d2
[00029db0] e78a                      lsl.l      #3,d2
[00029db2] 0072 0004 2822            ori.w      #$0004,34(a2,d2.l)
[00029db8] 322f 0002                 move.w     2(a7),d1
[00029dbc] 3017                      move.w     (a7),d0
[00029dbe] 224a                      movea.l    a2,a1
[00029dc0] 2053                      movea.l    (a3),a0
[00029dc2] 2068 0258                 movea.l    600(a0),a0
[00029dc6] 4eb9 0004 e84a            jsr        Ame_popup
[00029dcc] 4a40                      tst.w      d0
[00029dce] 6f00 00ac                 ble        $00029E7C
[00029dd2] 5340                      subq.w     #1,d0
[00029dd4] 2053                      movea.l    (a3),a0
[00029dd6] 2268 025c                 movea.l    604(a0),a1
[00029dda] 2069 003c                 movea.l    60(a1),a0
[00029dde] 5848                      addq.w     #4,a0
[00029de0] 728f                      moveq.l    #-113,d1
[00029de2] c290                      and.l      (a0),d1
[00029de4] 3400                      move.w     d0,d2
[00029de6] 48c2                      ext.l      d2
[00029de8] e98a                      lsl.l      #4,d2
[00029dea] 8282                      or.l       d2,d1
[00029dec] 2081                      move.l     d1,(a0)
[00029dee] 2053                      movea.l    (a3),a0
[00029df0] 2268 025c                 movea.l    604(a0),a1
[00029df4] 3200                      move.w     d0,d1
[00029df6] 0269 ff8f 057e            andi.w     #$FF8F,1406(a1)
[00029dfc] c27c 0007                 and.w      #$0007,d1
[00029e00] e949                      lsl.w      #4,d1
[00029e02] 8369 057e                 or.w       d1,1406(a1)
[00029e06] 2053                      movea.l    (a3),a0
[00029e08] 2268 025c                 movea.l    604(a0),a1
[00029e0c] 2069 003c                 movea.l    60(a1),a0
[00029e10] 02a8 7fff ffff 0004       andi.l     #$7FFFFFFF,4(a0)
[00029e18] 2053                      movea.l    (a3),a0
[00029e1a] 2268 0258                 movea.l    600(a0),a1
[00029e1e] 2069 0014                 movea.l    20(a1),a0
[00029e22] 3228 04ea                 move.w     1258(a0),d1
[00029e26] c27c fffe                 and.w      #$FFFE,d1
[00029e2a] 7034                      moveq.l    #52,d0
[00029e2c] 2049                      movea.l    a1,a0
[00029e2e] 2269 0066                 movea.l    102(a1),a1
[00029e32] 4e91                      jsr        (a1)
[00029e34] 2053                      movea.l    (a3),a0
[00029e36] 2268 0258                 movea.l    600(a0),a1
[00029e3a] 2069 0014                 movea.l    20(a1),a0
[00029e3e] 3228 051a                 move.w     1306(a0),d1
[00029e42] c27c fffe                 and.w      #$FFFE,d1
[00029e46] 7036                      moveq.l    #54,d0
[00029e48] 2049                      movea.l    a1,a0
[00029e4a] 2269 0066                 movea.l    102(a1),a1
[00029e4e] 4e91                      jsr        (a1)
[00029e50] 72ff                      moveq.l    #-1,d1
[00029e52] 703a                      moveq.l    #58,d0
[00029e54] 2053                      movea.l    (a3),a0
[00029e56] 2068 0258                 movea.l    600(a0),a0
[00029e5a] 2253                      movea.l    (a3),a1
[00029e5c] 2269 0258                 movea.l    600(a1),a1
[00029e60] 2269 0066                 movea.l    102(a1),a1
[00029e64] 4e91                      jsr        (a1)
[00029e66] 72ff                      moveq.l    #-1,d1
[00029e68] 7001                      moveq.l    #1,d0
[00029e6a] 2053                      movea.l    (a3),a0
[00029e6c] 2068 0258                 movea.l    600(a0),a0
[00029e70] 2253                      movea.l    (a3),a1
[00029e72] 2269 0258                 movea.l    600(a1),a1
[00029e76] 2269 0066                 movea.l    102(a1),a1
[00029e7a] 4e91                      jsr        (a1)
[00029e7c] 204a                      movea.l    a2,a0
[00029e7e] 4eb9 0004 f20a            jsr        Aob_delete
[00029e84] 504f                      addq.w     #8,a7
[00029e86] 265f                      movea.l    (a7)+,a3
[00029e88] 245f                      movea.l    (a7)+,a2
[00029e8a] 4e75                      rts
ed3d_pos:
[00029e8c] 48e7 0038                 movem.l    a2-a4,-(a7)
[00029e90] 514f                      subq.w     #8,a7
[00029e92] 41f9 000c 9f68            lea.l      POP_HORPOSSEL,a0
[00029e98] 4eb9 0004 f064            jsr        Aob_create
[00029e9e] 2448                      movea.l    a0,a2
[00029ea0] 200a                      move.l     a2,d0
[00029ea2] 6700 0128                 beq        $00029FCC
[00029ea6] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00029eac] 7015                      moveq.l    #21,d0
[00029eae] 2053                      movea.l    (a3),a0
[00029eb0] 2268 0258                 movea.l    600(a0),a1
[00029eb4] 2269 0014                 movea.l    20(a1),a1
[00029eb8] 41d7                      lea.l      (a7),a0
[00029eba] 4eb9 0004 fe06            jsr        Aob_offset
[00029ec0] 7001                      moveq.l    #1,d0
[00029ec2] 2053                      movea.l    (a3),a0
[00029ec4] 2268 0258                 movea.l    600(a0),a1
[00029ec8] d069 0034                 add.w      52(a1),d0
[00029ecc] d157                      add.w      d0,(a7)
[00029ece] 7201                      moveq.l    #1,d1
[00029ed0] d269 0036                 add.w      54(a1),d1
[00029ed4] d36f 0002                 add.w      d1,2(a7)
[00029ed8] 2268 025c                 movea.l    604(a0),a1
[00029edc] 2069 003c                 movea.l    60(a1),a0
[00029ee0] 2428 0004                 move.l     4(a0),d2
[00029ee4] 701c                      moveq.l    #28,d0
[00029ee6] e0a2                      asr.l      d0,d2
[00029ee8] c47c 0003                 and.w      #$0003,d2
[00029eec] 4a42                      tst.w      d2
[00029eee] 670a                      beq.s      $00029EFA
[00029ef0] 5342                      subq.w     #1,d2
[00029ef2] 670e                      beq.s      $00029F02
[00029ef4] 5342                      subq.w     #1,d2
[00029ef6] 6712                      beq.s      $00029F0A
[00029ef8] 6016                      bra.s      $00029F10
[00029efa] 006a 0004 0022            ori.w      #$0004,34(a2)
[00029f00] 600e                      bra.s      $00029F10
[00029f02] 006a 0004 0052            ori.w      #$0004,82(a2)
[00029f08] 6006                      bra.s      $00029F10
[00029f0a] 006a 0004 003a            ori.w      #$0004,58(a2)
[00029f10] 322f 0002                 move.w     2(a7),d1
[00029f14] 3017                      move.w     (a7),d0
[00029f16] 224a                      movea.l    a2,a1
[00029f18] 2053                      movea.l    (a3),a0
[00029f1a] 2068 0258                 movea.l    600(a0),a0
[00029f1e] 4eb9 0004 e84a            jsr        Ame_popup
[00029f24] 4a40                      tst.w      d0
[00029f26] 6f00 009c                 ble        $00029FC4
[00029f2a] 2053                      movea.l    (a3),a0
[00029f2c] 2268 025c                 movea.l    604(a0),a1
[00029f30] 2869 003c                 movea.l    60(a1),a4
[00029f34] 584c                      addq.w     #4,a4
[00029f36] 0294 cfff ffff            andi.l     #$CFFFFFFF,(a4)
[00029f3c] 3200                      move.w     d0,d1
[00029f3e] 5341                      subq.w     #1,d1
[00029f40] 670a                      beq.s      $00029F4C
[00029f42] 5341                      subq.w     #1,d1
[00029f44] 671c                      beq.s      $00029F62
[00029f46] 5341                      subq.w     #1,d1
[00029f48] 6734                      beq.s      $00029F7E
[00029f4a] 604c                      bra.s      $00029F98
[00029f4c] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[00029f52] 7017                      moveq.l    #23,d0
[00029f54] 2053                      movea.l    (a3),a0
[00029f56] 2068 025c                 movea.l    604(a0),a0
[00029f5a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029f60] 6036                      bra.s      $00029F98
[00029f62] 0094 2000 0000            ori.l      #$20000000,(a4)
[00029f68] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[00029f6e] 7017                      moveq.l    #23,d0
[00029f70] 2053                      movea.l    (a3),a0
[00029f72] 2068 025c                 movea.l    604(a0),a0
[00029f76] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029f7c] 601a                      bra.s      $00029F98
[00029f7e] 0094 1000 0000            ori.l      #$10000000,(a4)
[00029f84] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[00029f8a] 7017                      moveq.l    #23,d0
[00029f8c] 2053                      movea.l    (a3),a0
[00029f8e] 2068 025c                 movea.l    604(a0),a0
[00029f92] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029f98] 72ff                      moveq.l    #-1,d1
[00029f9a] 7017                      moveq.l    #23,d0
[00029f9c] 2053                      movea.l    (a3),a0
[00029f9e] 2068 0258                 movea.l    600(a0),a0
[00029fa2] 2253                      movea.l    (a3),a1
[00029fa4] 2869 0258                 movea.l    600(a1),a4
[00029fa8] 226c 0066                 movea.l    102(a4),a1
[00029fac] 4e91                      jsr        (a1)
[00029fae] 72ff                      moveq.l    #-1,d1
[00029fb0] 7001                      moveq.l    #1,d0
[00029fb2] 2053                      movea.l    (a3),a0
[00029fb4] 2068 0258                 movea.l    600(a0),a0
[00029fb8] 2253                      movea.l    (a3),a1
[00029fba] 2869 0258                 movea.l    600(a1),a4
[00029fbe] 226c 0066                 movea.l    102(a4),a1
[00029fc2] 4e91                      jsr        (a1)
[00029fc4] 204a                      movea.l    a2,a0
[00029fc6] 4eb9 0004 f20a            jsr        Aob_delete
[00029fcc] 504f                      addq.w     #8,a7
[00029fce] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00029fd2] 4e75                      rts
ed3d_replace:
[00029fd4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029fda] 2268 025c                 movea.l    604(a0),a1
[00029fde] 2069 003c                 movea.l    60(a1),a0
[00029fe2] 5848                      addq.w     #4,a0
[00029fe4] 0090 0000 0080            ori.l      #$00000080,(a0)
[00029fea] 72ff                      moveq.l    #-1,d1
[00029fec] 7001                      moveq.l    #1,d0
[00029fee] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029ff4] 2068 0258                 movea.l    600(a0),a0
[00029ff8] 2279 0010 ee4e            movea.l    ACSblk,a1
[00029ffe] 2269 0258                 movea.l    600(a1),a1
[0002a002] 2269 0066                 movea.l    102(a1),a1
[0002a006] 4e91                      jsr        (a1)
[0002a008] 4e75                      rts
ed3d_size:
[0002a00a] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002a00e] 514f                      subq.w     #8,a7
[0002a010] 41f9 000c a0a0            lea.l      POP_SIZESEL,a0
[0002a016] 4eb9 0004 f064            jsr        Aob_create
[0002a01c] 2448                      movea.l    a0,a2
[0002a01e] 200a                      move.l     a2,d0
[0002a020] 6700 00ec                 beq        $0002A10E
[0002a024] 47f9 0010 ee4e            lea.l      ACSblk,a3
[0002a02a] 7010                      moveq.l    #16,d0
[0002a02c] 2053                      movea.l    (a3),a0
[0002a02e] 2268 0258                 movea.l    600(a0),a1
[0002a032] 2269 0014                 movea.l    20(a1),a1
[0002a036] 41d7                      lea.l      (a7),a0
[0002a038] 4eb9 0004 fe06            jsr        Aob_offset
[0002a03e] 7001                      moveq.l    #1,d0
[0002a040] 2053                      movea.l    (a3),a0
[0002a042] 2268 0258                 movea.l    600(a0),a1
[0002a046] d069 0034                 add.w      52(a1),d0
[0002a04a] d157                      add.w      d0,(a7)
[0002a04c] 7201                      moveq.l    #1,d1
[0002a04e] d269 0036                 add.w      54(a1),d1
[0002a052] d36f 0002                 add.w      d1,2(a7)
[0002a056] 2268 025c                 movea.l    604(a0),a1
[0002a05a] 2069 003c                 movea.l    60(a1),a0
[0002a05e] 2028 0004                 move.l     4(a0),d0
[0002a062] 721e                      moveq.l    #30,d1
[0002a064] e2a0                      asr.l      d1,d0
[0002a066] c07c 0001                 and.w      #$0001,d0
[0002a06a] 48c0                      ext.l      d0
[0002a06c] 2400                      move.l     d0,d2
[0002a06e] d482                      add.l      d2,d2
[0002a070] d480                      add.l      d0,d2
[0002a072] e78a                      lsl.l      #3,d2
[0002a074] 0072 0004 2822            ori.w      #$0004,34(a2,d2.l)
[0002a07a] 3017                      move.w     (a7),d0
[0002a07c] 224a                      movea.l    a2,a1
[0002a07e] 2053                      movea.l    (a3),a0
[0002a080] 2068 0258                 movea.l    600(a0),a0
[0002a084] 322f 0002                 move.w     2(a7),d1
[0002a088] 4eb9 0004 e84a            jsr        Ame_popup
[0002a08e] 4a40                      tst.w      d0
[0002a090] 6f74                      ble.s      $0002A106
[0002a092] 2053                      movea.l    (a3),a0
[0002a094] 2268 025c                 movea.l    604(a0),a1
[0002a098] 2869 003c                 movea.l    60(a1),a4
[0002a09c] 584c                      addq.w     #4,a4
[0002a09e] b07c 0001                 cmp.w      #$0001,d0
[0002a0a2] 661c                      bne.s      $0002A0C0
[0002a0a4] 0294 bfff ffff            andi.l     #$BFFFFFFF,(a4)
[0002a0aa] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[0002a0b0] 7012                      moveq.l    #18,d0
[0002a0b2] 2053                      movea.l    (a3),a0
[0002a0b4] 2068 025c                 movea.l    604(a0),a0
[0002a0b8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a0be] 601a                      bra.s      $0002A0DA
[0002a0c0] 0094 4000 0000            ori.l      #$40000000,(a4)
[0002a0c6] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[0002a0cc] 7012                      moveq.l    #18,d0
[0002a0ce] 2053                      movea.l    (a3),a0
[0002a0d0] 2068 025c                 movea.l    604(a0),a0
[0002a0d4] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a0da] 72ff                      moveq.l    #-1,d1
[0002a0dc] 7012                      moveq.l    #18,d0
[0002a0de] 2053                      movea.l    (a3),a0
[0002a0e0] 2068 0258                 movea.l    600(a0),a0
[0002a0e4] 2253                      movea.l    (a3),a1
[0002a0e6] 2869 0258                 movea.l    600(a1),a4
[0002a0ea] 226c 0066                 movea.l    102(a4),a1
[0002a0ee] 4e91                      jsr        (a1)
[0002a0f0] 72ff                      moveq.l    #-1,d1
[0002a0f2] 7001                      moveq.l    #1,d0
[0002a0f4] 2053                      movea.l    (a3),a0
[0002a0f6] 2068 0258                 movea.l    600(a0),a0
[0002a0fa] 2253                      movea.l    (a3),a1
[0002a0fc] 2869 0258                 movea.l    600(a1),a4
[0002a100] 226c 0066                 movea.l    102(a4),a1
[0002a104] 4e91                      jsr        (a1)
[0002a106] 204a                      movea.l    a2,a0
[0002a108] 4eb9 0004 f20a            jsr        Aob_delete
[0002a10e] 504f                      addq.w     #8,a7
[0002a110] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002a114] 4e75                      rts
ed3d_textcol:
[0002a116] 3f03                      move.w     d3,-(a7)
[0002a118] 2f0a                      move.l     a2,-(a7)
[0002a11a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a120] 2268 025c                 movea.l    604(a0),a1
[0002a124] 2469 003c                 movea.l    60(a1),a2
[0002a128] 584a                      addq.w     #4,a2
[0002a12a] 700c                      moveq.l    #12,d0
[0002a12c] 3f00                      move.w     d0,-(a7)
[0002a12e] 740d                      moveq.l    #13,d2
[0002a130] 720a                      moveq.l    #10,d1
[0002a132] 2012                      move.l     (a2),d0
[0002a134] e080                      asr.l      #8,d0
[0002a136] c07c 000f                 and.w      #$000F,d0
[0002a13a] 4eb9 0003 0bde            jsr        oe_colsel
[0002a140] 544f                      addq.w     #2,a7
[0002a142] 3600                      move.w     d0,d3
[0002a144] 6b2e                      bmi.s      $0002A174
[0002a146] 2212                      move.l     (a2),d1
[0002a148] c2bc ffff f0ff            and.l      #$FFFFF0FF,d1
[0002a14e] 48c0                      ext.l      d0
[0002a150] e188                      lsl.l      #8,d0
[0002a152] 8280                      or.l       d0,d1
[0002a154] 2481                      move.l     d1,(a2)
[0002a156] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a15c] 2068 0258                 movea.l    600(a0),a0
[0002a160] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002a166] 2469 0258                 movea.l    600(a1),a2
[0002a16a] 226a 0066                 movea.l    102(a2),a1
[0002a16e] 7001                      moveq.l    #1,d0
[0002a170] 72ff                      moveq.l    #-1,d1
[0002a172] 4e91                      jsr        (a1)
[0002a174] 245f                      movea.l    (a7)+,a2
[0002a176] 361f                      move.w     (a7)+,d3
[0002a178] 4e75                      rts
ed3d_trans:
[0002a17a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a180] 2268 025c                 movea.l    604(a0),a1
[0002a184] 2069 003c                 movea.l    60(a1),a0
[0002a188] 5848                      addq.w     #4,a0
[0002a18a] 0290 ffff ff7f            andi.l     #$FFFFFF7F,(a0)
[0002a190] 72ff                      moveq.l    #-1,d1
[0002a192] 7001                      moveq.l    #1,d0
[0002a194] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a19a] 2068 0258                 movea.l    600(a0),a0
[0002a19e] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002a1a4] 2269 0258                 movea.l    600(a1),a1
[0002a1a8] 2269 0066                 movea.l    102(a1),a1
[0002a1ac] 4e91                      jsr        (a1)
[0002a1ae] 4e75                      rts

; start editor\ue3dbutt.c

init_3Dbutton:
[0002a1b0] 2f0a                      move.l     a2,-(a7)
[0002a1b2] 2f0b                      move.l     a3,-(a7)
[0002a1b4] 2448                      movea.l    a0,a2
[0002a1b6] 43f9 000c 2c9c            lea.l      data,a1
[0002a1bc] 303c 2329                 move.w     #$2329,d0
[0002a1c0] 266a 0004                 movea.l    4(a2),a3
[0002a1c4] 4e93                      jsr        (a3)
[0002a1c6] 265f                      movea.l    (a7)+,a3
[0002a1c8] 245f                      movea.l    (a7)+,a2
[0002a1ca] 4e75                      rts
minsize:
[0002a1cc] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0002a1d0] 2448                      movea.l    a0,a2
[0002a1d2] 2649                      movea.l    a1,a3
[0002a1d4] 202a 000c                 move.l     12(a2),d0
[0002a1d8] 6716                      beq.s      $0002A1F0
[0002a1da] 2040                      movea.l    d0,a0
[0002a1dc] 4eb9 0008 2f6c            jsr        strlen
[0002a1e2] 2600                      move.l     d0,d3
[0002a1e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a1ea] c7e8 0012                 muls.w     18(a0),d3
[0002a1ee] 600a                      bra.s      $0002A1FA
[0002a1f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a1f6] 3628 0012                 move.w     18(a0),d3
[0002a1fa] 3683                      move.w     d3,(a3)
[0002a1fc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a202] 226f 0010                 movea.l    16(a7),a1
[0002a206] 32a8 0014                 move.w     20(a0),(a1)
[0002a20a] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0002a20e] 4e75                      rts
object_tree:
[0002a210] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[0002a214] 4fef ffdc                 lea.l      -36(a7),a7
[0002a218] 2a48                      movea.l    a0,a5
[0002a21a] 2849                      movea.l    a1,a4
[0002a21c] 41f9 000c 2556            lea.l      ED_3DBUTTON,a0
[0002a222] 4eb9 0004 f064            jsr        Aob_create
[0002a228] 2448                      movea.l    a0,a2
[0002a22a] 200a                      move.l     a2,d0
[0002a22c] 6606                      bne.s      $0002A234
[0002a22e] 91c8                      suba.l     a0,a0
[0002a230] 6000 0402                 bra        $0002A634
[0002a234] 701c                      moveq.l    #28,d0
[0002a236] 224a                      movea.l    a2,a1
[0002a238] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a23e] 2068 0258                 movea.l    600(a0),a0
[0002a242] 4eb9 0003 0b9a            jsr        oe_beself
[0002a248] 7045                      moveq.l    #69,d0
[0002a24a] 224a                      movea.l    a2,a1
[0002a24c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a252] 2068 0258                 movea.l    600(a0),a0
[0002a256] 4eb9 0003 0b9a            jsr        oe_beself
[0002a25c] 7046                      moveq.l    #70,d0
[0002a25e] 224a                      movea.l    a2,a1
[0002a260] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a266] 2068 0258                 movea.l    600(a0),a0
[0002a26a] 4eb9 0003 0b9a            jsr        oe_beself
[0002a270] 47ea 0030                 lea.l      48(a2),a3
[0002a274] 7016                      moveq.l    #22,d0
[0002a276] c06c 0008                 and.w      8(a4),d0
[0002a27a] 816b 0008                 or.w       d0,8(a3)
[0002a27e] 703f                      moveq.l    #63,d0
[0002a280] c06c 000a                 and.w      10(a4),d0
[0002a284] 816b 000a                 or.w       d0,10(a3)
[0002a288] 286b 000c                 movea.l    12(a3),a4
[0002a28c] 486f 0020                 pea.l      32(a7)
[0002a290] 43f9 000c 2d06            lea.l      $000C2D06,a1
[0002a296] 2055                      movea.l    (a5),a0
[0002a298] 4eb9 0008 1b26            jsr        sscanf
[0002a29e] 584f                      addq.w     #4,a7
[0002a2a0] 296f 0020 0004            move.l     32(a7),4(a4)
[0002a2a6] 0c6d 0002 0008            cmpi.w     #$0002,8(a5)
[0002a2ac] 6620                      bne.s      $0002A2CE
[0002a2ae] 43f9 000c 2d0d            lea.l      $000C2D0D,a1
[0002a2b4] 7004                      moveq.l    #4,d0
[0002a2b6] 204b                      movea.l    a3,a0
[0002a2b8] 2c6c 0008                 movea.l    8(a4),a6
[0002a2bc] 4e96                      jsr        (a6)
[0002a2be] 226d 000a                 movea.l    10(a5),a1
[0002a2c2] 701c                      moveq.l    #28,d0
[0002a2c4] 204a                      movea.l    a2,a0
[0002a2c6] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a2cc] 6020                      bra.s      $0002A2EE
[0002a2ce] 43f9 000c 2cee            lea.l      $000C2CEE,a1
[0002a2d4] 7004                      moveq.l    #4,d0
[0002a2d6] 204b                      movea.l    a3,a0
[0002a2d8] 2c6c 0008                 movea.l    8(a4),a6
[0002a2dc] 4e96                      jsr        (a6)
[0002a2de] 43f9 000c 2cee            lea.l      $000C2CEE,a1
[0002a2e4] 701c                      moveq.l    #28,d0
[0002a2e6] 204a                      movea.l    a2,a0
[0002a2e8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a2ee] 206a 0684                 movea.l    1668(a2),a0
[0002a2f2] 2968 000c 0018            move.l     12(a0),24(a4)
[0002a2f8] 206d 0026                 movea.l    38(a5),a0
[0002a2fc] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002a302] 4a40                      tst.w      d0
[0002a304] 6712                      beq.s      $0002A318
[0002a306] 43f9 000c 2cee            lea.l      $000C2CEE,a1
[0002a30c] 7045                      moveq.l    #69,d0
[0002a30e] 204a                      movea.l    a2,a0
[0002a310] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a316] 600e                      bra.s      $0002A326
[0002a318] 226d 0026                 movea.l    38(a5),a1
[0002a31c] 7045                      moveq.l    #69,d0
[0002a31e] 204a                      movea.l    a2,a0
[0002a320] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a326] 206a 069c                 movea.l    1692(a2),a0
[0002a32a] 2968 000c 001c            move.l     12(a0),28(a4)
[0002a330] 206d 002a                 movea.l    42(a5),a0
[0002a334] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002a33a] 4a40                      tst.w      d0
[0002a33c] 6712                      beq.s      $0002A350
[0002a33e] 43f9 000c 2cee            lea.l      $000C2CEE,a1
[0002a344] 7046                      moveq.l    #70,d0
[0002a346] 204a                      movea.l    a2,a0
[0002a348] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a34e] 600e                      bra.s      $0002A35E
[0002a350] 226d 002a                 movea.l    42(a5),a1
[0002a354] 7046                      moveq.l    #70,d0
[0002a356] 204a                      movea.l    a2,a0
[0002a358] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a35e] 4bef 0012                 lea.l      18(a7),a5
[0002a362] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a368] 2aa8 0258                 move.l     600(a0),(a5)
[0002a36c] 47ea 0348                 lea.l      840(a2),a3
[0002a370] 2b4b 0004                 move.l     a3,4(a5)
[0002a374] 3b7c 0023 0008            move.w     #$0023,8(a5)
[0002a37a] 224d                      movea.l    a5,a1
[0002a37c] 7009                      moveq.l    #9,d0
[0002a37e] 204b                      movea.l    a3,a0
[0002a380] 4eb9 0003 71ba            jsr        Auo_slider
[0002a386] 49ef 001c                 lea.l      28(a7),a4
[0002a38a] 28bc 0000 0008            move.l     #$00000008,(a4)
[0002a390] 224c                      movea.l    a4,a1
[0002a392] 7064                      moveq.l    #100,d0
[0002a394] 204b                      movea.l    a3,a0
[0002a396] 4eb9 0003 71ba            jsr        Auo_slider
[0002a39c] 28bc 0000 0001            move.l     #$00000001,(a4)
[0002a3a2] 224c                      movea.l    a4,a1
[0002a3a4] 7065                      moveq.l    #101,d0
[0002a3a6] 204b                      movea.l    a3,a0
[0002a3a8] 4eb9 0003 71ba            jsr        Auo_slider
[0002a3ae] 202f 0020                 move.l     32(a7),d0
[0002a3b2] 7210                      moveq.l    #16,d1
[0002a3b4] e2a0                      asr.l      d1,d0
[0002a3b6] c0bc 0000 000f            and.l      #$0000000F,d0
[0002a3bc] 2880                      move.l     d0,(a4)
[0002a3be] 224c                      movea.l    a4,a1
[0002a3c0] 204b                      movea.l    a3,a0
[0002a3c2] 7011                      moveq.l    #17,d0
[0002a3c4] 4eb9 0003 71ba            jsr        Auo_slider
[0002a3ca] 202f 0020                 move.l     32(a7),d0
[0002a3ce] 7210                      moveq.l    #16,d1
[0002a3d0] e2a0                      asr.l      d1,d0
[0002a3d2] c07c 0007                 and.w      #$0007,d0
[0002a3d6] 3f00                      move.w     d0,-(a7)
[0002a3d8] 43f9 000c 2d11            lea.l      $000C2D11,a1
[0002a3de] 41ef 0002                 lea.l      2(a7),a0
[0002a3e2] 4eb9 0008 15ac            jsr        sprintf
[0002a3e8] 544f                      addq.w     #2,a7
[0002a3ea] 43d7                      lea.l      (a7),a1
[0002a3ec] 7004                      moveq.l    #4,d0
[0002a3ee] 204b                      movea.l    a3,a0
[0002a3f0] 4eb9 0003 71ba            jsr        Auo_slider
[0002a3f6] 2f7c 0002 a86a 000a       move.l     #live_thickness,10(a7)
[0002a3fe] 2f4b 000e                 move.l     a3,14(a7)
[0002a402] 43ef 000a                 lea.l      10(a7),a1
[0002a406] 7067                      moveq.l    #103,d0
[0002a408] 204b                      movea.l    a3,a0
[0002a40a] 4eb9 0003 71ba            jsr        Auo_slider
[0002a410] 47ea 0300                 lea.l      768(a2),a3
[0002a414] 2b4b 0004                 move.l     a3,4(a5)
[0002a418] 3b7c 0020 0008            move.w     #$0020,8(a5)
[0002a41e] 224d                      movea.l    a5,a1
[0002a420] 7009                      moveq.l    #9,d0
[0002a422] 204b                      movea.l    a3,a0
[0002a424] 4eb9 0003 71ba            jsr        Auo_slider
[0002a42a] 28bc 0000 0010            move.l     #$00000010,(a4)
[0002a430] 224c                      movea.l    a4,a1
[0002a432] 7064                      moveq.l    #100,d0
[0002a434] 204b                      movea.l    a3,a0
[0002a436] 4eb9 0003 71ba            jsr        Auo_slider
[0002a43c] 28bc 0000 0001            move.l     #$00000001,(a4)
[0002a442] 224c                      movea.l    a4,a1
[0002a444] 7065                      moveq.l    #101,d0
[0002a446] 204b                      movea.l    a3,a0
[0002a448] 4eb9 0003 71ba            jsr        Auo_slider
[0002a44e] 202f 0020                 move.l     32(a7),d0
[0002a452] 7214                      moveq.l    #20,d1
[0002a454] e2a0                      asr.l      d1,d0
[0002a456] c0bc 0000 000f            and.l      #$0000000F,d0
[0002a45c] 2880                      move.l     d0,(a4)
[0002a45e] 7408                      moveq.l    #8,d2
[0002a460] b480                      cmp.l      d0,d2
[0002a462] 6f04                      ble.s      $0002A468
[0002a464] d594                      add.l      d2,(a4)
[0002a466] 6002                      bra.s      $0002A46A
[0002a468] 5194                      subq.l     #8,(a4)
[0002a46a] 224c                      movea.l    a4,a1
[0002a46c] 7011                      moveq.l    #17,d0
[0002a46e] 204b                      movea.l    a3,a0
[0002a470] 4eb9 0003 71ba            jsr        Auo_slider
[0002a476] 202f 0020                 move.l     32(a7),d0
[0002a47a] 7214                      moveq.l    #20,d1
[0002a47c] e2a0                      asr.l      d1,d0
[0002a47e] c0bc 0000 000f            and.l      #$0000000F,d0
[0002a484] 2880                      move.l     d0,(a4)
[0002a486] 7407                      moveq.l    #7,d2
[0002a488] b480                      cmp.l      d0,d2
[0002a48a] 6c06                      bge.s      $0002A492
[0002a48c] 0494 0000 0010            subi.l     #$00000010,(a4)
[0002a492] 3f2c 0002                 move.w     2(a4),-(a7)
[0002a496] 43f9 000c 2d11            lea.l      $000C2D11,a1
[0002a49c] 41ef 0002                 lea.l      2(a7),a0
[0002a4a0] 4eb9 0008 15ac            jsr        sprintf
[0002a4a6] 544f                      addq.w     #2,a7
[0002a4a8] 43d7                      lea.l      (a7),a1
[0002a4aa] 7004                      moveq.l    #4,d0
[0002a4ac] 204b                      movea.l    a3,a0
[0002a4ae] 4eb9 0003 71ba            jsr        Auo_slider
[0002a4b4] 2f7c 0002 a7f0 000a       move.l     #live_offset,10(a7)
[0002a4bc] 2f4b 000e                 move.l     a3,14(a7)
[0002a4c0] 43ef 000a                 lea.l      10(a7),a1
[0002a4c4] 7067                      moveq.l    #103,d0
[0002a4c6] 204b                      movea.l    a3,a0
[0002a4c8] 4eb9 0003 71ba            jsr        Auo_slider
[0002a4ce] 262f 0020                 move.l     32(a7),d3
[0002a4d2] 7018                      moveq.l    #24,d0
[0002a4d4] e0a3                      asr.l      d0,d3
[0002a4d6] c67c 000f                 and.w      #$000F,d3
[0002a4da] 3203                      move.w     d3,d1
[0002a4dc] 48c1                      ext.l      d1
[0002a4de] e589                      lsl.l      #2,d1
[0002a4e0] 41f9 000c a6d0            lea.l      colour_text,a0
[0002a4e6] 2270 1800                 movea.l    0(a0,d1.l),a1
[0002a4ea] 204a                      movea.l    a2,a0
[0002a4ec] 7032                      moveq.l    #50,d0
[0002a4ee] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a4f4] 3003                      move.w     d3,d0
[0002a4f6] 026a fff0 04a6            andi.w     #$FFF0,1190(a2)
[0002a4fc] c07c 000f                 and.w      #$000F,d0
[0002a500] 816a 04a6                 or.w       d0,1190(a2)
[0002a504] 760f                      moveq.l    #15,d3
[0002a506] c66f 0022                 and.w      34(a7),d3
[0002a50a] 3003                      move.w     d3,d0
[0002a50c] 48c0                      ext.l      d0
[0002a50e] e588                      lsl.l      #2,d0
[0002a510] 41f9 000c a6d0            lea.l      colour_text,a0
[0002a516] 2270 0800                 movea.l    0(a0,d0.l),a1
[0002a51a] 204a                      movea.l    a2,a0
[0002a51c] 7041                      moveq.l    #65,d0
[0002a51e] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a524] 3003                      move.w     d3,d0
[0002a526] 026a fff0 060e            andi.w     #$FFF0,1550(a2)
[0002a52c] c07c 000f                 and.w      #$000F,d0
[0002a530] 816a 060e                 or.w       d0,1550(a2)
[0002a534] 262f 0020                 move.l     32(a7),d3
[0002a538] 700c                      moveq.l    #12,d0
[0002a53a] e0a3                      asr.l      d0,d3
[0002a53c] c67c 000f                 and.w      #$000F,d3
[0002a540] 3203                      move.w     d3,d1
[0002a542] 48c1                      ext.l      d1
[0002a544] e589                      lsl.l      #2,d1
[0002a546] 41f9 000c a6d0            lea.l      colour_text,a0
[0002a54c] 2270 1800                 movea.l    0(a0,d1.l),a1
[0002a550] 204a                      movea.l    a2,a0
[0002a552] 702b                      moveq.l    #43,d0
[0002a554] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a55a] 3003                      move.w     d3,d0
[0002a55c] 026a fff0 03fe            andi.w     #$FFF0,1022(a2)
[0002a562] c07c 000f                 and.w      #$000F,d0
[0002a566] 816a 03fe                 or.w       d0,1022(a2)
[0002a56a] 262f 0020                 move.l     32(a7),d3
[0002a56e] e883                      asr.l      #4,d3
[0002a570] c67c 0007                 and.w      #$0007,d3
[0002a574] 3003                      move.w     d3,d0
[0002a576] 026a ff8f 057e            andi.w     #$FF8F,1406(a2)
[0002a57c] c07c 0007                 and.w      #$0007,d0
[0002a580] e948                      lsl.w      #4,d0
[0002a582] 816a 057e                 or.w       d0,1406(a2)
[0002a586] 202f 0020                 move.l     32(a7),d0
[0002a58a] 721c                      moveq.l    #28,d1
[0002a58c] e2a0                      asr.l      d1,d0
[0002a58e] c07c 000f                 and.w      #$000F,d0
[0002a592] 5340                      subq.w     #1,d0
[0002a594] 6706                      beq.s      $0002A59C
[0002a596] 5340                      subq.w     #1,d0
[0002a598] 6714                      beq.s      $0002A5AE
[0002a59a] 6024                      bra.s      $0002A5C0
[0002a59c] 43f9 000c 9779            lea.l      HPOS_TEXT3,a1
[0002a5a2] 7017                      moveq.l    #23,d0
[0002a5a4] 204a                      movea.l    a2,a0
[0002a5a6] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a5ac] 6022                      bra.s      $0002A5D0
[0002a5ae] 43f9 000c 9771            lea.l      HPOS_TEXT2,a1
[0002a5b4] 7017                      moveq.l    #23,d0
[0002a5b6] 204a                      movea.l    a2,a0
[0002a5b8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a5be] 6010                      bra.s      $0002A5D0
[0002a5c0] 43f9 000c 9769            lea.l      HPOS_TEXT1,a1
[0002a5c6] 7017                      moveq.l    #23,d0
[0002a5c8] 204a                      movea.l    a2,a0
[0002a5ca] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a5d0] 202f 0020                 move.l     32(a7),d0
[0002a5d4] c0bc 4000 0000            and.l      #$40000000,d0
[0002a5da] 6712                      beq.s      $0002A5EE
[0002a5dc] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[0002a5e2] 204a                      movea.l    a2,a0
[0002a5e4] 7012                      moveq.l    #18,d0
[0002a5e6] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a5ec] 6010                      bra.s      $0002A5FE
[0002a5ee] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[0002a5f4] 7012                      moveq.l    #18,d0
[0002a5f6] 204a                      movea.l    a2,a0
[0002a5f8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a5fe] 262f 0020                 move.l     32(a7),d3
[0002a602] e083                      asr.l      #8,d3
[0002a604] c67c 000f                 and.w      #$000F,d3
[0002a608] 3003                      move.w     d3,d0
[0002a60a] 48c0                      ext.l      d0
[0002a60c] e588                      lsl.l      #2,d0
[0002a60e] 41f9 000c a6d0            lea.l      colour_text,a0
[0002a614] 2270 0800                 movea.l    0(a0,d0.l),a1
[0002a618] 204a                      movea.l    a2,a0
[0002a61a] 700d                      moveq.l    #13,d0
[0002a61c] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002a622] 3003                      move.w     d3,d0
[0002a624] 026a fff0 012e            andi.w     #$FFF0,302(a2)
[0002a62a] c07c 000f                 and.w      #$000F,d0
[0002a62e] 816a 012e                 or.w       d0,302(a2)
[0002a632] 204a                      movea.l    a2,a0
[0002a634] 4fef 0024                 lea.l      36(a7),a7
[0002a638] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[0002a63c] 4e75                      rts
test_it:
[0002a63e] 2f0a                      move.l     a2,-(a7)
[0002a640] 2f0b                      move.l     a3,-(a7)
[0002a642] 2648                      movea.l    a0,a3
[0002a644] 2449                      movea.l    a1,a2
[0002a646] 22bc 0006 4a22            move.l     #A_3Dbutton,(a1)
[0002a64c] 486a 0004                 pea.l      4(a2)
[0002a650] 43f9 000c 2d06            lea.l      $000C2D06,a1
[0002a656] 2050                      movea.l    (a0),a0
[0002a658] 4eb9 0008 1b26            jsr        sscanf
[0002a65e] 584f                      addq.w     #4,a7
[0002a660] 257c 0006 30f2 0008       move.l     #Auo_string,8(a2)
[0002a668] 0c6b 0002 0008            cmpi.w     #$0002,8(a3)
[0002a66e] 6608                      bne.s      $0002A678
[0002a670] 256b 000a 000c            move.l     10(a3),12(a2)
[0002a676] 6004                      bra.s      $0002A67C
[0002a678] 42aa 000c                 clr.l      12(a2)
[0002a67c] 7000                      moveq.l    #0,d0
[0002a67e] 2540 0014                 move.l     d0,20(a2)
[0002a682] 2540 0010                 move.l     d0,16(a2)
[0002a686] 206b 0026                 movea.l    38(a3),a0
[0002a68a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002a690] 4a40                      tst.w      d0
[0002a692] 6704                      beq.s      $0002A698
[0002a694] 91c8                      suba.l     a0,a0
[0002a696] 6004                      bra.s      $0002A69C
[0002a698] 206b 0026                 movea.l    38(a3),a0
[0002a69c] 2548 0018                 move.l     a0,24(a2)
[0002a6a0] 206b 002a                 movea.l    42(a3),a0
[0002a6a4] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002a6aa] 4a40                      tst.w      d0
[0002a6ac] 6704                      beq.s      $0002A6B2
[0002a6ae] 91c8                      suba.l     a0,a0
[0002a6b0] 6004                      bra.s      $0002A6B6
[0002a6b2] 206b 002a                 movea.l    42(a3),a0
[0002a6b6] 2548 001c                 move.l     a0,28(a2)
[0002a6ba] 265f                      movea.l    (a7)+,a3
[0002a6bc] 245f                      movea.l    (a7)+,a2
[0002a6be] 4e75                      rts
abort:
[0002a6c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a6c6] 2268 0258                 movea.l    600(a0),a1
[0002a6ca] 2069 0014                 movea.l    20(a1),a0
[0002a6ce] 2068 003c                 movea.l    60(a0),a0
[0002a6d2] 42a8 0018                 clr.l      24(a0)
[0002a6d6] 42a8 001c                 clr.l      28(a0)
[0002a6da] 2079 000c 2cdc            movea.l    $000C2CDC,a0
[0002a6e0] 2050                      movea.l    (a0),a0
[0002a6e2] 4e90                      jsr        (a0)
[0002a6e4] 4e75                      rts
ok:
[0002a6e6] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0002a6ea] 4fef ffce                 lea.l      -50(a7),a7
[0002a6ee] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002a6f4] 2052                      movea.l    (a2),a0
[0002a6f6] 2268 0258                 movea.l    600(a0),a1
[0002a6fa] 2669 0014                 movea.l    20(a1),a3
[0002a6fe] 2a6b 003c                 movea.l    60(a3),a5
[0002a702] 49f9 0010 c502            lea.l      parm,a4
[0002a708] 2f2d 0004                 move.l     4(a5),-(a7)
[0002a70c] 43f9 000c 2d06            lea.l      $000C2D06,a1
[0002a712] 204c                      movea.l    a4,a0
[0002a714] 4eb9 0008 15ac            jsr        sprintf
[0002a71a] 584f                      addq.w     #4,a7
[0002a71c] 4bef 0004                 lea.l      4(a7),a5
[0002a720] 2a8c                      move.l     a4,(a5)
[0002a722] 2b7c 000c 2cfb 0004       move.l     #$000C2CFB,4(a5)
[0002a72a] 43d7                      lea.l      (a7),a1
[0002a72c] 7003                      moveq.l    #3,d0
[0002a72e] 41eb 02a0                 lea.l      672(a3),a0
[0002a732] 4eb9 0006 a068            jsr        Auo_boxed
[0002a738] 2057                      movea.l    (a7),a0
[0002a73a] 1010                      move.b     (a0),d0
[0002a73c] 671a                      beq.s      $0002A758
[0002a73e] 4eb9 0008 2f6c            jsr        strlen
[0002a744] 2600                      move.l     d0,d3
[0002a746] 2052                      movea.l    (a2),a0
[0002a748] c7e8 0012                 muls.w     18(a0),d3
[0002a74c] 3b7c 0002 0008            move.w     #$0002,8(a5)
[0002a752] 2b57 000a                 move.l     (a7),10(a5)
[0002a756] 600e                      bra.s      $0002A766
[0002a758] 2052                      movea.l    (a2),a0
[0002a75a] 3628 0012                 move.w     18(a0),d3
[0002a75e] 426d 0008                 clr.w      8(a5)
[0002a762] 42ad 000a                 clr.l      10(a5)
[0002a766] 42ad 000e                 clr.l      14(a5)
[0002a76a] 4240                      clr.w      d0
[0002a76c] 3b40 001c                 move.w     d0,28(a5)
[0002a770] 3b40 0012                 move.w     d0,18(a5)
[0002a774] 7200                      moveq.l    #0,d1
[0002a776] 2b41 001e                 move.l     d1,30(a5)
[0002a77a] 2b41 0014                 move.l     d1,20(a5)
[0002a77e] 7000                      moveq.l    #0,d0
[0002a780] 2b40 0022                 move.l     d0,34(a5)
[0002a784] 2b40 0018                 move.l     d0,24(a5)
[0002a788] 43ed 0026                 lea.l      38(a5),a1
[0002a78c] 41eb 0678                 lea.l      1656(a3),a0
[0002a790] 7003                      moveq.l    #3,d0
[0002a792] 4eb9 0006 a068            jsr        Auo_boxed
[0002a798] 206d 0026                 movea.l    38(a5),a0
[0002a79c] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002a7a2] 4a40                      tst.w      d0
[0002a7a4] 6704                      beq.s      $0002A7AA
[0002a7a6] 42ad 0026                 clr.l      38(a5)
[0002a7aa] 43ed 002a                 lea.l      42(a5),a1
[0002a7ae] 7003                      moveq.l    #3,d0
[0002a7b0] 41eb 0690                 lea.l      1680(a3),a0
[0002a7b4] 4eb9 0006 a068            jsr        Auo_boxed
[0002a7ba] 206d 002a                 movea.l    42(a5),a0
[0002a7be] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002a7c4] 4a40                      tst.w      d0
[0002a7c6] 6704                      beq.s      $0002A7CC
[0002a7c8] 42ad 002a                 clr.l      42(a5)
[0002a7cc] 2052                      movea.l    (a2),a0
[0002a7ce] 3228 0014                 move.w     20(a0),d1
[0002a7d2] 3003                      move.w     d3,d0
[0002a7d4] 204d                      movea.l    a5,a0
[0002a7d6] 2279 000c 2cdc            movea.l    $000C2CDC,a1
[0002a7dc] 2269 0004                 movea.l    4(a1),a1
[0002a7e0] 4e91                      jsr        (a1)
[0002a7e2] 6100 fedc                 bsr        abort
[0002a7e6] 4fef 0032                 lea.l      50(a7),a7
[0002a7ea] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0002a7ee] 4e75                      rts
live_offset:
[0002a7f0] 48e7 1820                 movem.l    d3-d4/a2,-(a7)
[0002a7f4] 4fef fff0                 lea.l      -16(a7),a7
[0002a7f8] 2448                      movea.l    a0,a2
[0002a7fa] 2600                      move.l     d0,d3
[0002a7fc] 5183                      subq.l     #8,d3
[0002a7fe] 2803                      move.l     d3,d4
[0002a800] 43d7                      lea.l      (a7),a1
[0002a802] 7012                      moveq.l    #18,d0
[0002a804] 4eb9 0003 71ba            jsr        Auo_slider
[0002a80a] 2457                      movea.l    (a7),a2
[0002a80c] 206a 0014                 movea.l    20(a2),a0
[0002a810] 41e8 0030                 lea.l      48(a0),a0
[0002a814] 2268 000c                 movea.l    12(a0),a1
[0002a818] 5849                      addq.w     #4,a1
[0002a81a] 2049                      movea.l    a1,a0
[0002a81c] 4a83                      tst.l      d3
[0002a81e] 6a06                      bpl.s      $0002A826
[0002a820] d6bc 0000 0010            add.l      #$00000010,d3
[0002a826] 2010                      move.l     (a0),d0
[0002a828] 7214                      moveq.l    #20,d1
[0002a82a] e2a0                      asr.l      d1,d0
[0002a82c] c0bc 0000 000f            and.l      #$0000000F,d0
[0002a832] b680                      cmp.l      d0,d3
[0002a834] 671c                      beq.s      $0002A852
[0002a836] 2410                      move.l     (a0),d2
[0002a838] c4bc ff0f ffff            and.l      #$FF0FFFFF,d2
[0002a83e] 2003                      move.l     d3,d0
[0002a840] e3a8                      lsl.l      d1,d0
[0002a842] 8480                      or.l       d0,d2
[0002a844] 2082                      move.l     d2,(a0)
[0002a846] 204a                      movea.l    a2,a0
[0002a848] 226a 0066                 movea.l    102(a2),a1
[0002a84c] 7001                      moveq.l    #1,d0
[0002a84e] 72ff                      moveq.l    #-1,d1
[0002a850] 4e91                      jsr        (a1)
[0002a852] 720a                      moveq.l    #10,d1
[0002a854] 41ef 000a                 lea.l      10(a7),a0
[0002a858] 3004                      move.w     d4,d0
[0002a85a] 4eb9 0008 2dc0            jsr        itoa
[0002a860] 4fef 0010                 lea.l      16(a7),a7
[0002a864] 4cdf 0418                 movem.l    (a7)+,d3-d4/a2
[0002a868] 4e75                      rts
live_thickness:
[0002a86a] 48e7 1820                 movem.l    d3-d4/a2,-(a7)
[0002a86e] 4fef fff0                 lea.l      -16(a7),a7
[0002a872] 2448                      movea.l    a0,a2
[0002a874] 2600                      move.l     d0,d3
[0002a876] 3803                      move.w     d3,d4
[0002a878] 43d7                      lea.l      (a7),a1
[0002a87a] 7012                      moveq.l    #18,d0
[0002a87c] 4eb9 0003 71ba            jsr        Auo_slider
[0002a882] 2457                      movea.l    (a7),a2
[0002a884] 206a 0014                 movea.l    20(a2),a0
[0002a888] 41e8 0030                 lea.l      48(a0),a0
[0002a88c] 2268 000c                 movea.l    12(a0),a1
[0002a890] 5849                      addq.w     #4,a1
[0002a892] 2049                      movea.l    a1,a0
[0002a894] 2011                      move.l     (a1),d0
[0002a896] 7210                      moveq.l    #16,d1
[0002a898] e2a0                      asr.l      d1,d0
[0002a89a] c0bc 0000 000f            and.l      #$0000000F,d0
[0002a8a0] b680                      cmp.l      d0,d3
[0002a8a2] 671e                      beq.s      $0002A8C2
[0002a8a4] 2411                      move.l     (a1),d2
[0002a8a6] c4bc fff0 ffff            and.l      #$FFF0FFFF,d2
[0002a8ac] 3604                      move.w     d4,d3
[0002a8ae] 48c3                      ext.l      d3
[0002a8b0] e3ab                      lsl.l      d1,d3
[0002a8b2] 8483                      or.l       d3,d2
[0002a8b4] 2282                      move.l     d2,(a1)
[0002a8b6] 7001                      moveq.l    #1,d0
[0002a8b8] 204a                      movea.l    a2,a0
[0002a8ba] 226a 0066                 movea.l    102(a2),a1
[0002a8be] 72ff                      moveq.l    #-1,d1
[0002a8c0] 4e91                      jsr        (a1)
[0002a8c2] 720a                      moveq.l    #10,d1
[0002a8c4] 41ef 000a                 lea.l      10(a7),a0
[0002a8c8] 3004                      move.w     d4,d0
[0002a8ca] 4eb9 0008 2dc0            jsr        itoa
[0002a8d0] 4fef 0010                 lea.l      16(a7),a7
[0002a8d4] 4cdf 0418                 movem.l    (a7)+,d3-d4/a2
[0002a8d8] 4e75                      rts
