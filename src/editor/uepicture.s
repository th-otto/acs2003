edpi_col:
[0002795c] 3f03                      move.w     d3,-(a7)
[0002795e] 2f0a                      move.l     a2,-(a7)
[00027960] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027966] 2268 025c                 movea.l    604(a0),a1
[0002796a] 2469 003c                 movea.l    60(a1),a2
[0002796e] 584a                      addq.w     #4,a2
[00027970] 7011                      moveq.l    #17,d0
[00027972] 3f00                      move.w     d0,-(a7)
[00027974] 7412                      moveq.l    #18,d2
[00027976] 720f                      moveq.l    #15,d1
[00027978] 2012                      move.l     (a2),d0
[0002797a] e880                      asr.l      #4,d0
[0002797c] c07c 000f                 and.w      #$000F,d0
[00027980] 4eb9 0003 0bde            jsr        oe_colsel
[00027986] 544f                      addq.w     #2,a7
[00027988] 3600                      move.w     d0,d3
[0002798a] 6b2e                      bmi.s      $000279BA
[0002798c] 2212                      move.l     (a2),d1
[0002798e] c2bc ffff ff0f            and.l      #$FFFFFF0F,d1
[00027994] 48c0                      ext.l      d0
[00027996] e988                      lsl.l      #4,d0
[00027998] 8280                      or.l       d0,d1
[0002799a] 2481                      move.l     d1,(a2)
[0002799c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000279a2] 2068 0258                 movea.l    600(a0),a0
[000279a6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000279ac] 2469 0258                 movea.l    600(a1),a2
[000279b0] 226a 0066                 movea.l    102(a2),a1
[000279b4] 7001                      moveq.l    #1,d0
[000279b6] 72ff                      moveq.l    #-1,d1
[000279b8] 4e91                      jsr        (a1)
[000279ba] 245f                      movea.l    (a7)+,a2
[000279bc] 361f                      move.w     (a7)+,d3
[000279be] 4e75                      rts
edpi_dither:
[000279c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000279c6] 2268 025c                 movea.l    604(a0),a1
[000279ca] 2069 003c                 movea.l    60(a1),a0
[000279ce] 0aa8 0010 0000 0004       eori.l     #$00100000,4(a0)
[000279d6] 72ff                      moveq.l    #-1,d1
[000279d8] 7001                      moveq.l    #1,d0
[000279da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000279e0] 2068 0258                 movea.l    600(a0),a0
[000279e4] 2279 0010 ee4e            movea.l    ACSblk,a1
[000279ea] 2269 0258                 movea.l    600(a1),a1
[000279ee] 2269 0066                 movea.l    102(a1),a1
[000279f2] 4e91                      jsr        (a1)
[000279f4] 4e75                      rts
edpi_pattern:
[000279f6] 2f0a                      move.l     a2,-(a7)
[000279f8] 45f9 0010 ee4e            lea.l      ACSblk,a2
[000279fe] 2052                      movea.l    (a2),a0
[00027a00] 3228 0260                 move.w     608(a0),d1
[00027a04] 48c1                      ext.l      d1
[00027a06] 2001                      move.l     d1,d0
[00027a08] d080                      add.l      d0,d0
[00027a0a] d081                      add.l      d1,d0
[00027a0c] e788                      lsl.l      #3,d0
[00027a0e] 2268 0258                 movea.l    600(a0),a1
[00027a12] 2069 0014                 movea.l    20(a1),a0
[00027a16] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00027a1a] 2252                      movea.l    (a2),a1
[00027a1c] 2269 025c                 movea.l    604(a1),a1
[00027a20] 2269 003c                 movea.l    60(a1),a1
[00027a24] 5849                      addq.w     #4,a1
[00027a26] 2411                      move.l     (a1),d2
[00027a28] c4bc fff0 00ff            and.l      #$FFF000FF,d2
[00027a2e] 84a8 000c                 or.l       12(a0),d2
[00027a32] 2282                      move.l     d2,(a1)
[00027a34] 72ff                      moveq.l    #-1,d1
[00027a36] 7001                      moveq.l    #1,d0
[00027a38] 2052                      movea.l    (a2),a0
[00027a3a] 2068 0258                 movea.l    600(a0),a0
[00027a3e] 2252                      movea.l    (a2),a1
[00027a40] 2269 0258                 movea.l    600(a1),a1
[00027a44] 2269 0066                 movea.l    102(a1),a1
[00027a48] 4e91                      jsr        (a1)
[00027a4a] 245f                      movea.l    (a7)+,a2
[00027a4c] 4e75                      rts
edpi_tile:
[00027a4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027a54] 2268 025c                 movea.l    604(a0),a1
[00027a58] 2069 003c                 movea.l    60(a1),a0
[00027a5c] 0aa8 0000 0002 0004       eori.l     #$00000002,4(a0)
[00027a64] 72ff                      moveq.l    #-1,d1
[00027a66] 7001                      moveq.l    #1,d0
[00027a68] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027a6e] 2068 0258                 movea.l    600(a0),a0
[00027a72] 2279 0010 ee4e            movea.l    ACSblk,a1
[00027a78] 2269 0258                 movea.l    600(a1),a1
[00027a7c] 2269 0066                 movea.l    102(a1),a1
[00027a80] 4e91                      jsr        (a1)
[00027a82] 4e75                      rts

; start editor\uepicture.c

init_picture:
[00027a84] 2f0a                      move.l     a2,-(a7)
[00027a86] 2f0b                      move.l     a3,-(a7)
[00027a88] 2448                      movea.l    a0,a2
[00027a8a] 43f9 000b eab2            lea.l      data,a1
[00027a90] 303c 2329                 move.w     #$2329,d0
[00027a94] 266a 0004                 movea.l    4(a2),a3
[00027a98] 4e93                      jsr        (a3)
[00027a9a] 265f                      movea.l    (a7)+,a3
[00027a9c] 245f                      movea.l    (a7)+,a2
[00027a9e] 4e75                      rts
minsize:
[00027aa0] 2f0a                      move.l     a2,-(a7)
[00027aa2] 246f 0008                 movea.l    8(a7),a2
[00027aa6] 2068 000c                 movea.l    12(a0),a0
[00027aaa] 2008                      move.l     a0,d0
[00027aac] 670a                      beq.s      $00027AB8
[00027aae] 32a8 0004                 move.w     4(a0),(a1)
[00027ab2] 34a8 0006                 move.w     6(a0),(a2)
[00027ab6] 6014                      bra.s      $00027ACC
[00027ab8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027abe] 32a8 0012                 move.w     18(a0),(a1)
[00027ac2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027ac8] 34a8 0014                 move.w     20(a0),(a2)
[00027acc] 245f                      movea.l    (a7)+,a2
[00027ace] 4e75                      rts
object_tree:
[00027ad0] 48e7 003e                 movem.l    a2-a6,-(a7)
[00027ad4] 4fef fff6                 lea.l      -10(a7),a7
[00027ad8] 2f48 0006                 move.l     a0,6(a7)
[00027adc] 2849                      movea.l    a1,a4
[00027ade] 41f9 000b e194            lea.l      ED_PICTURE,a0
[00027ae4] 4eb9 0004 f064            jsr        Aob_create
[00027aea] 2448                      movea.l    a0,a2
[00027aec] 200a                      move.l     a2,d0
[00027aee] 6700 00ba                 beq        $00027BAA
[00027af2] 4eb9 0004 fbdc            jsr        Aob_fix
[00027af8] 47ea 0030                 lea.l      48(a2),a3
[00027afc] 7016                      moveq.l    #22,d0
[00027afe] c06c 0008                 and.w      8(a4),d0
[00027b02] 816b 0008                 or.w       d0,8(a3)
[00027b06] 703f                      moveq.l    #63,d0
[00027b08] c06c 000a                 and.w      10(a4),d0
[00027b0c] 816b 000a                 or.w       d0,10(a3)
[00027b10] 286b 000c                 movea.l    12(a3),a4
[00027b14] 93c9                      suba.l     a1,a1
[00027b16] 7002                      moveq.l    #2,d0
[00027b18] 204b                      movea.l    a3,a0
[00027b1a] 2a6c 0008                 movea.l    8(a4),a5
[00027b1e] 4e95                      jsr        (a5)
[00027b20] 4bef 0002                 lea.l      2(a7),a5
[00027b24] 4855                      pea.l      (a5)
[00027b26] 43f9 000b eb13            lea.l      $000BEB13,a1
[00027b2c] 206f 000a                 movea.l    10(a7),a0
[00027b30] 2050                      movea.l    (a0),a0
[00027b32] 4eb9 0008 1b26            jsr        sscanf
[00027b38] 584f                      addq.w     #4,a7
[00027b3a] 7002                      moveq.l    #2,d0
[00027b3c] c095                      and.l      (a5),d0
[00027b3e] 6706                      beq.s      $00027B46
[00027b40] 006a 0001 00ca            ori.w      #$0001,202(a2)
[00027b46] 2015                      move.l     (a5),d0
[00027b48] c0bc 0010 0000            and.l      #$00100000,d0
[00027b4e] 6706                      beq.s      $00027B56
[00027b50] 006a 0001 00fa            ori.w      #$0001,250(a2)
[00027b56] 7001                      moveq.l    #1,d0
[00027b58] 8095                      or.l       (a5),d0
[00027b5a] 2940 0004                 move.l     d0,4(a4)
[00027b5e] 206f 0006                 movea.l    6(a7),a0
[00027b62] 2968 000a 000c            move.l     10(a0),12(a4)
[00027b68] 43d7                      lea.l      (a7),a1
[00027b6a] 7001                      moveq.l    #1,d0
[00027b6c] 2c6c 0008                 movea.l    8(a4),a6
[00027b70] 204b                      movea.l    a3,a0
[00027b72] 4e96                      jsr        (a6)
[00027b74] 2015                      move.l     (a5),d0
[00027b76] e880                      asr.l      #4,d0
[00027b78] c07c 000f                 and.w      #$000F,d0
[00027b7c] 48c0                      ext.l      d0
[00027b7e] e588                      lsl.l      #2,d0
[00027b80] 41f9 000c a6d0            lea.l      colour_text,a0
[00027b86] 2270 0800                 movea.l    0(a0,d0.l),a1
[00027b8a] 204a                      movea.l    a2,a0
[00027b8c] 7012                      moveq.l    #18,d0
[00027b8e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00027b94] 2015                      move.l     (a5),d0
[00027b96] e880                      asr.l      #4,d0
[00027b98] c07c 000f                 and.w      #$000F,d0
[00027b9c] 026a fff0 01a6            andi.w     #$FFF0,422(a2)
[00027ba2] c07c 000f                 and.w      #$000F,d0
[00027ba6] 816a 01a6                 or.w       d0,422(a2)
[00027baa] 204a                      movea.l    a2,a0
[00027bac] 4fef 000a                 lea.l      10(a7),a7
[00027bb0] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[00027bb4] 4e75                      rts
test_it:
[00027bb6] 2f0a                      move.l     a2,-(a7)
[00027bb8] 2f0b                      move.l     a3,-(a7)
[00027bba] 2648                      movea.l    a0,a3
[00027bbc] 2449                      movea.l    a1,a2
[00027bbe] 22bc 0006 7ece            move.l     #A_picture,(a1)
[00027bc4] 486a 0004                 pea.l      4(a2)
[00027bc8] 43f9 000b eb13            lea.l      $000BEB13,a1
[00027bce] 2050                      movea.l    (a0),a0
[00027bd0] 4eb9 0008 1b26            jsr        sscanf
[00027bd6] 584f                      addq.w     #4,a7
[00027bd8] 00aa 0000 0001 0004       ori.l      #$00000001,4(a2)
[00027be0] 257c 0006 863e 0008       move.l     #Auo_picture,8(a2)
[00027be8] 256b 000a 000c            move.l     10(a3),12(a2)
[00027bee] 7000                      moveq.l    #0,d0
[00027bf0] 2540 0014                 move.l     d0,20(a2)
[00027bf4] 2540 0010                 move.l     d0,16(a2)
[00027bf8] 42aa 0018                 clr.l      24(a2)
[00027bfc] 42aa 001c                 clr.l      28(a2)
[00027c00] 265f                      movea.l    (a7)+,a3
[00027c02] 245f                      movea.l    (a7)+,a2
[00027c04] 4e75                      rts
abort:
[00027c06] 2079 000b eaf2            movea.l    $000BEAF2,a0
[00027c0c] 2050                      movea.l    (a0),a0
[00027c0e] 4e90                      jsr        (a0)
[00027c10] 4e75                      rts
ok:
[00027c12] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00027c16] 4fef ffd2                 lea.l      -46(a7),a7
[00027c1a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027c20] 2268 0258                 movea.l    600(a0),a1
[00027c24] 2069 0014                 movea.l    20(a1),a0
[00027c28] 2868 003c                 movea.l    60(a0),a4
[00027c2c] 246c 0014                 movea.l    20(a4),a2
[00027c30] 200a                      move.l     a2,d0
[00027c32] 6700 00e8                 beq        $00027D1C
[00027c36] 302a 0006                 move.w     6(a2),d0
[00027c3a] 48c0                      ext.l      d0
[00027c3c] d080                      add.l      d0,d0
[00027c3e] 322a 0008                 move.w     8(a2),d1
[00027c42] 48c1                      ext.l      d1
[00027c44] 4eb9 0008 3cac            jsr        _lmul
[00027c4a] 322a 000c                 move.w     12(a2),d1
[00027c4e] 48c1                      ext.l      d1
[00027c50] 4eb9 0008 3cac            jsr        _lmul
[00027c56] 2600                      move.l     d0,d3
[00027c58] d6bc 0000 001c            add.l      #$0000001C,d3
[00027c5e] 2003                      move.l     d3,d0
[00027c60] 4eb9 0004 c608            jsr        Ax_malloc
[00027c66] 2648                      movea.l    a0,a3
[00027c68] 200b                      move.l     a3,d0
[00027c6a] 6700 00b0                 beq        $00027D1C
[00027c6e] 224a                      movea.l    a2,a1
[00027c70] 7014                      moveq.l    #20,d0
[00027c72] 4eb9 0008 3500            jsr        memcpy
[00027c78] 42ab 0014                 clr.l      20(a3)
[00027c7c] 42ab 0018                 clr.l      24(a3)
[00027c80] 41eb 001c                 lea.l      28(a3),a0
[00027c84] 2688                      move.l     a0,(a3)
[00027c86] 377c 0001 000a            move.w     #$0001,10(a3)
[00027c8c] 224b                      movea.l    a3,a1
[00027c8e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027c94] 3028 0010                 move.w     16(a0),d0
[00027c98] 204a                      movea.l    a2,a0
[00027c9a] 4eb9 0007 4978            jsr        vr_trnfm
[00027ca0] 70fe                      moveq.l    #-2,d0
[00027ca2] c0ac 0004                 and.l      4(a4),d0
[00027ca6] 2f00                      move.l     d0,-(a7)
[00027ca8] 43f9 000b eb13            lea.l      $000BEB13,a1
[00027cae] 41f9 0010 c45e            lea.l      parm,a0
[00027cb4] 4eb9 0008 15ac            jsr        sprintf
[00027cba] 584f                      addq.w     #4,a7
[00027cbc] 2ebc 0010 c45e            move.l     #parm,(a7)
[00027cc2] 2f7c 000b eb07 0004       move.l     #$000BEB07,4(a7)
[00027cca] 3f7c 0003 0008            move.w     #$0003,8(a7)
[00027cd0] 2f4b 000a                 move.l     a3,10(a7)
[00027cd4] 2f43 000e                 move.l     d3,14(a7)
[00027cd8] 4240                      clr.w      d0
[00027cda] 3f40 001c                 move.w     d0,28(a7)
[00027cde] 3f40 0012                 move.w     d0,18(a7)
[00027ce2] 7200                      moveq.l    #0,d1
[00027ce4] 2f41 001e                 move.l     d1,30(a7)
[00027ce8] 2f41 0014                 move.l     d1,20(a7)
[00027cec] 7000                      moveq.l    #0,d0
[00027cee] 2f40 0022                 move.l     d0,34(a7)
[00027cf2] 2f40 0018                 move.l     d0,24(a7)
[00027cf6] 42af 0026                 clr.l      38(a7)
[00027cfa] 42af 002a                 clr.l      42(a7)
[00027cfe] 322a 0006                 move.w     6(a2),d1
[00027d02] 302a 0004                 move.w     4(a2),d0
[00027d06] 41d7                      lea.l      (a7),a0
[00027d08] 2279 000b eaf2            movea.l    $000BEAF2,a1
[00027d0e] 2269 0004                 movea.l    4(a1),a1
[00027d12] 4e91                      jsr        (a1)
[00027d14] 204b                      movea.l    a3,a0
[00027d16] 4eb9 0004 c6c8            jsr        Ax_ifree
[00027d1c] 6100 fee8                 bsr        abort
[00027d20] 4fef 002e                 lea.l      46(a7),a7
[00027d24] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00027d28] 4e75                      rts
acc:
[00027d2a] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[00027d2e] 4fef fff4                 lea.l      -12(a7),a7
[00027d32] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027d38] 2468 0258                 movea.l    600(a0),a2
[00027d3c] 2eaa 0014                 move.l     20(a2),(a7)
[00027d40] 2f68 0240 0008            move.l     576(a0),8(a7)
[00027d46] 4eb9 0004 7e1e            jsr        Adr_start
[00027d4c] 4eb9 0004 7e2a            jsr        Adr_next
[00027d52] 3600                      move.w     d0,d3
[00027d54] 6f00 00c6                 ble        $00027E1C
[00027d58] 48c0                      ext.l      d0
[00027d5a] 2200                      move.l     d0,d1
[00027d5c] d281                      add.l      d1,d1
[00027d5e] d280                      add.l      d0,d1
[00027d60] e789                      lsl.l      #3,d1
[00027d62] 206f 0008                 movea.l    8(a7),a0
[00027d66] 2068 0014                 movea.l    20(a0),a0
[00027d6a] 41f0 1818                 lea.l      24(a0,d1.l),a0
[00027d6e] 0c68 000a 0016            cmpi.w     #$000A,22(a0)
[00027d74] 6600 00a6                 bne        $00027E1C
[00027d78] 2668 000c                 movea.l    12(a0),a3
[00027d7c] 382b 0004                 move.w     4(a3),d4
[00027d80] 3a2b 0006                 move.w     6(a3),d5
[00027d84] 3004                      move.w     d4,d0
[00027d86] 3205                      move.w     d5,d1
[00027d88] 4eb9 0005 4b6e            jsr        Abp_create
[00027d8e] 2848                      movea.l    a0,a4
[00027d90] 200c                      move.l     a4,d0
[00027d92] 6700 0088                 beq        $00027E1C
[00027d96] 0c6b 0001 000a            cmpi.w     #$0001,10(a3)
[00027d9c] 661a                      bne.s      $00027DB8
[00027d9e] 426c 000a                 clr.w      10(a4)
[00027da2] 224c                      movea.l    a4,a1
[00027da4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027daa] 3028 0010                 move.w     16(a0),d0
[00027dae] 204b                      movea.l    a3,a0
[00027db0] 4eb9 0007 4978            jsr        vr_trnfm
[00027db6] 6028                      bra.s      $00027DE0
[00027db8] 3005                      move.w     d5,d0
[00027dba] 48c0                      ext.l      d0
[00027dbc] d080                      add.l      d0,d0
[00027dbe] 322c 0008                 move.w     8(a4),d1
[00027dc2] 48c1                      ext.l      d1
[00027dc4] 4eb9 0008 3cac            jsr        _lmul
[00027dca] 322c 000c                 move.w     12(a4),d1
[00027dce] 48c1                      ext.l      d1
[00027dd0] 4eb9 0008 3cac            jsr        _lmul
[00027dd6] 2253                      movea.l    (a3),a1
[00027dd8] 2054                      movea.l    (a4),a0
[00027dda] 4eb9 0008 3500            jsr        memcpy
[00027de0] 2657                      movea.l    (a7),a3
[00027de2] 47eb 0030                 lea.l      48(a3),a3
[00027de6] 2f6b 000c 0004            move.l     12(a3),4(a7)
[00027dec] 224c                      movea.l    a4,a1
[00027dee] 303c 01f4                 move.w     #$01F4,d0
[00027df2] 204b                      movea.l    a3,a0
[00027df4] 2a6f 0004                 movea.l    4(a7),a5
[00027df8] 2a6d 0008                 movea.l    8(a5),a5
[00027dfc] 4e95                      jsr        (a5)
[00027dfe] 006a 0010 0056            ori.w      #$0010,86(a2)
[00027e04] 43ea 0024                 lea.l      36(a2),a1
[00027e08] 204a                      movea.l    a2,a0
[00027e0a] 266a 0086                 movea.l    134(a2),a3
[00027e0e] 4e93                      jsr        (a3)
[00027e10] 3003                      move.w     d3,d0
[00027e12] 206f 0008                 movea.l    8(a7),a0
[00027e16] 4eb9 0004 7f76            jsr        Adr_del
[00027e1c] 4fef 000c                 lea.l      12(a7),a7
[00027e20] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[00027e24] 4e75                      rts
