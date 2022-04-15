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

	.data

TEXT_005:
[000bd77c]                           dc.b 'OK',0
TEXT_009:
[000bd780]                           dc.b 'Abbruch',0
TEXT_01:
[000bd787]                           dc.b 'Kachel-Modus',0
TEXT_02:
[000bd794]                           dc.b 'Hintergrund:',0
TEXT_04:
[000bd7a1]                           dc.b 'Dither-Modus',0
TEXT_05:
[000bd7ae]                           dc.b 'Muster:',0
TEXT_11:
[000bd7b6]                           dc.b 'Farbe:',0
help_title:
[000bd7bd]                           dc.b 'Der Picture-Editor',0
title:
[000bd7d0]                           dc.b ' PICTURE -',0
[000bd7db]                           dc.b $00
DATAS_01:
[000bd7dc]                           dc.w $0035
[000bd7de]                           dc.w $28d6
[000bd7e0]                           dc.w $0030
[000bd7e2]                           dc.w $0020
[000bd7e4]                           dc.w $0003
[000bd7e6]                           dc.w $0001
[000bd7e8]                           dc.w $0004
[000bd7ea]                           dc.w $0000
[000bd7ec]                           dc.w $0000
[000bd7ee]                           dc.w $0000
[000bd7f0]                           dc.w $0000
[000bd7f2]                           dc.w $0000
[000bd7f4]                           dc.w $0000
[000bd7f6]                           dc.w $0000
[000bd7f8]                           dc.w $0000
[000bd7fa]                           dc.w $0000
[000bd7fc]                           dc.w $0000
[000bd7fe]                           dc.w $0000
[000bd800]                           dc.w $0000
[000bd802]                           dc.w $0000
[000bd804]                           dc.w $0000
[000bd806]                           dc.w $0000
[000bd808]                           dc.w $0000
[000bd80a]                           dc.w $0000
[000bd80c]                           dc.w $0000
[000bd80e]                           dc.w $0000
[000bd810]                           dc.w $0000
[000bd812]                           dc.w $0000
[000bd814]                           dc.w $0000
[000bd816]                           dc.w $0000
[000bd818]                           dc.w $0000
[000bd81a]                           dc.w $0000
[000bd81c]                           dc.w $0000
[000bd81e]                           dc.w $2110
[000bd820]                           dc.w $0000
[000bd822]                           dc.w $0000
[000bd824]                           dc.w $2110
[000bd826]                           dc.w $3700
[000bd828]                           dc.w $0001
[000bd82a]                           dc.w $1020
[000bd82c]                           dc.w $4880
[000bd82e]                           dc.w $6c00
[000bd830]                           dc.w $8782
[000bd832]                           dc.w $3700
[000bd834]                           dc.w $1000
[000bd836]                           dc.w $1864
[000bd838]                           dc.w $0000
[000bd83a]                           dc.w $000c
[000bd83c]                           dc.w $2010
[000bd83e]                           dc.w $c000
[000bd840]                           dc.w $0002
[000bd842]                           dc.w $4009
[000bd844]                           dc.w $0000
[000bd846]                           dc.w $0000
[000bd848]                           dc.w $4008
[000bd84a]                           dc.w $0000
[000bd84c]                           dc.w $0000
[000bd84e]                           dc.w $8004
[000bd850]                           dc.w $0000
[000bd852]                           dc.w $000e
[000bd854]                           dc.w $8005
[000bd856]                           dc.w $c000
[000bd858]                           dc.w $0000
[000bd85a]                           dc.w $8004
[000bd85c]                           dc.w $0000
[000bd85e]                           dc.w $0000
[000bd860]                           dc.w $8004
[000bd862]                           dc.w $0000
[000bd864]                           dc.w $3f1c
[000bd866]                           dc.w $7878
[000bd868]                           dc.w $70f0
[000bd86a]                           dc.w $00e3
[000bd86c]                           dc.w $8787
[000bd86e]                           dc.w $8f0c
[000bd870]                           dc.w $fe18
[000bd872]                           dc.w $0000
[000bd874]                           dc.w $0000
[000bd876]                           dc.w $01e7
[000bd878]                           dc.b '8p<`',0
[000bd87d]                           dc.b $00
[000bd87e]                           dc.w $0787
[000bd880]                           dc.w $c39f
[000bd882]                           dc.w $fe1c
[000bd884]                           dc.w $0000
[000bd886]                           dc.w $0000
[000bd888]                           dc.w $01e3
[000bd88a]                           dc.w $9ce0
[000bd88c]                           dc.w $e1e0
[000bd88e]                           dc.w $0000
[000bd890]                           dc.w $030f
[000bd892]                           dc.w $1e1f
[000bd894]                           dc.w $0f07
[000bd896]                           dc.w $e000
[000bd898]                           dc.w $70c0
[000bd89a]                           dc.w $30f8
[000bd89c]                           dc.w $0ccf
[000bd89e]                           dc.w $8f3c
[000bd8a0]                           dc.w $0000
[000bd8a2]                           dc.w $0300
[000bd8a4]                           dc.w $0000
[000bd8a6]                           dc.w $0000
[000bd8a8]                           dc.w $0000
[000bd8aa]                           dc.w $0000
[000bd8ac]                           dc.w $0000
[000bd8ae]                           dc.w $0000
[000bd8b0]                           dc.w $0000
[000bd8b2]                           dc.w $0000
[000bd8b4]                           dc.w $0000
[000bd8b6]                           dc.w $0000
[000bd8b8]                           dc.w $0000
[000bd8ba]                           dc.w $0000
[000bd8bc]                           dc.w $0000
[000bd8be]                           dc.w $0000
[000bd8c0]                           dc.w $0000
[000bd8c2]                           dc.w $0000
[000bd8c4]                           dc.w $0000
[000bd8c6]                           dc.w $0000
[000bd8c8]                           dc.w $0000
[000bd8ca]                           dc.w $0000
[000bd8cc]                           dc.w $0000
[000bd8ce]                           dc.w $0000
[000bd8d0]                           dc.w $0000
[000bd8d2]                           dc.w $0000
[000bd8d4]                           dc.w $0000
[000bd8d6]                           dc.w $0000
[000bd8d8]                           dc.w $0000
[000bd8da]                           dc.w $0000
[000bd8dc]                           dc.w $0000
[000bd8de]                           dc.w $2110
[000bd8e0]                           dc.w $0000
[000bd8e2]                           dc.w $0000
[000bd8e4]                           dc.w $2110
[000bd8e6]                           dc.w $3700
[000bd8e8]                           dc.w $0001
[000bd8ea]                           dc.w $1020
[000bd8ec]                           dc.w $4880
[000bd8ee]                           dc.w $6c00
[000bd8f0]                           dc.w $8782
[000bd8f2]                           dc.w $3700
[000bd8f4]                           dc.w $1000
[000bd8f6]                           dc.w $1864
[000bd8f8]                           dc.w $0000
[000bd8fa]                           dc.w $000c
[000bd8fc]                           dc.w $2010
[000bd8fe]                           dc.w $c000
[000bd900]                           dc.w $0002
[000bd902]                           dc.w $4009
[000bd904]                           dc.w $0000
[000bd906]                           dc.w $0000
[000bd908]                           dc.w $4008
[000bd90a]                           dc.w $0000
[000bd90c]                           dc.w $0000
[000bd90e]                           dc.w $8004
[000bd910]                           dc.w $0000
[000bd912]                           dc.w $000e
[000bd914]                           dc.w $8005
[000bd916]                           dc.w $c000
[000bd918]                           dc.w $0000
[000bd91a]                           dc.w $8004
[000bd91c]                           dc.w $0000
[000bd91e]                           dc.w $0000
[000bd920]                           dc.w $8004
[000bd922]                           dc.w $0000
[000bd924]                           dc.w $3f1c
[000bd926]                           dc.w $7878
[000bd928]                           dc.w $70f0
[000bd92a]                           dc.w $00e3
[000bd92c]                           dc.w $8787
[000bd92e]                           dc.w $8f0c
[000bd930]                           dc.w $fe18
[000bd932]                           dc.w $0000
[000bd934]                           dc.w $0000
[000bd936]                           dc.w $01e7
[000bd938]                           dc.b '8p<`',0
[000bd93d]                           dc.b $00
[000bd93e]                           dc.w $0787
[000bd940]                           dc.w $c39f
[000bd942]                           dc.w $fe1c
[000bd944]                           dc.w $0000
[000bd946]                           dc.w $0000
[000bd948]                           dc.w $01e3
[000bd94a]                           dc.w $9ce0
[000bd94c]                           dc.w $e1e0
[000bd94e]                           dc.w $0000
[000bd950]                           dc.w $030f
[000bd952]                           dc.w $1e1f
[000bd954]                           dc.w $0f07
[000bd956]                           dc.w $e000
[000bd958]                           dc.w $70c0
[000bd95a]                           dc.w $30f8
[000bd95c]                           dc.w $0ccf
[000bd95e]                           dc.w $8f3c
[000bd960]                           dc.w $0000
[000bd962]                           dc.w $0300
[000bd964]                           dc.w $0000
[000bd966]                           dc.w $0000
[000bd968]                           dc.w $0000
[000bd96a]                           dc.w $0000
[000bd96c]                           dc.w $0000
[000bd96e]                           dc.w $0000
[000bd970]                           dc.w $0000
[000bd972]                           dc.w $0000
[000bd974]                           dc.w $0000
[000bd976]                           dc.w $0000
[000bd978]                           dc.w $0000
[000bd97a]                           dc.w $0000
[000bd97c]                           dc.w $0000
[000bd97e]                           dc.w $0000
[000bd980]                           dc.w $0000
[000bd982]                           dc.w $0000
[000bd984]                           dc.w $0000
[000bd986]                           dc.w $0000
[000bd988]                           dc.w $0000
[000bd98a]                           dc.w $0000
[000bd98c]                           dc.w $0000
[000bd98e]                           dc.w $0000
[000bd990]                           dc.w $0000
[000bd992]                           dc.w $0000
[000bd994]                           dc.w $0000
[000bd996]                           dc.w $0000
[000bd998]                           dc.w $0000
[000bd99a]                           dc.w $0000
[000bd99c]                           dc.w $0000
[000bd99e]                           dc.w $2110
[000bd9a0]                           dc.w $0000
[000bd9a2]                           dc.w $0000
[000bd9a4]                           dc.w $2110
[000bd9a6]                           dc.w $3700
[000bd9a8]                           dc.w $0001
[000bd9aa]                           dc.w $1020
[000bd9ac]                           dc.w $4880
[000bd9ae]                           dc.w $6c00
[000bd9b0]                           dc.w $8782
[000bd9b2]                           dc.w $3700
[000bd9b4]                           dc.w $1000
[000bd9b6]                           dc.w $1864
[000bd9b8]                           dc.w $0000
[000bd9ba]                           dc.w $000c
[000bd9bc]                           dc.w $2010
[000bd9be]                           dc.w $c000
[000bd9c0]                           dc.w $0002
[000bd9c2]                           dc.w $4009
[000bd9c4]                           dc.w $0000
[000bd9c6]                           dc.w $0000
[000bd9c8]                           dc.w $4008
[000bd9ca]                           dc.w $0000
[000bd9cc]                           dc.w $0000
[000bd9ce]                           dc.w $8004
[000bd9d0]                           dc.w $0000
[000bd9d2]                           dc.w $000e
[000bd9d4]                           dc.w $8005
[000bd9d6]                           dc.w $c000
[000bd9d8]                           dc.w $0000
[000bd9da]                           dc.w $8004
[000bd9dc]                           dc.w $0000
[000bd9de]                           dc.w $0000
[000bd9e0]                           dc.w $8004
[000bd9e2]                           dc.w $0000
[000bd9e4]                           dc.w $3f1c
[000bd9e6]                           dc.w $7878
[000bd9e8]                           dc.w $70f0
[000bd9ea]                           dc.w $00e3
[000bd9ec]                           dc.w $8787
[000bd9ee]                           dc.w $8f0c
[000bd9f0]                           dc.w $fe18
[000bd9f2]                           dc.w $0000
[000bd9f4]                           dc.w $0000
[000bd9f6]                           dc.w $01e7
[000bd9f8]                           dc.b '8p<`',0
[000bd9fd]                           dc.b $00
[000bd9fe]                           dc.w $0787
[000bda00]                           dc.w $c39f
[000bda02]                           dc.w $fe1c
[000bda04]                           dc.w $0000
[000bda06]                           dc.w $0000
[000bda08]                           dc.w $01e3
[000bda0a]                           dc.w $9ce0
[000bda0c]                           dc.w $e1e0
[000bda0e]                           dc.w $0000
[000bda10]                           dc.w $030f
[000bda12]                           dc.w $1e1f
[000bda14]                           dc.w $0f07
[000bda16]                           dc.w $e000
[000bda18]                           dc.w $70c0
[000bda1a]                           dc.w $30f8
[000bda1c]                           dc.w $0ccf
[000bda1e]                           dc.w $8f3c
[000bda20]                           dc.w $0000
[000bda22]                           dc.w $0300
[000bda24]                           dc.w $0000
[000bda26]                           dc.w $0000
[000bda28]                           dc.w $0000
[000bda2a]                           dc.w $0000
[000bda2c]                           dc.w $0000
[000bda2e]                           dc.w $0000
[000bda30]                           dc.w $0000
[000bda32]                           dc.w $0000
[000bda34]                           dc.w $0000
[000bda36]                           dc.w $0000
[000bda38]                           dc.w $0000
[000bda3a]                           dc.w $0000
[000bda3c]                           dc.w $0000
[000bda3e]                           dc.w $0000
[000bda40]                           dc.w $0000
[000bda42]                           dc.w $0000
[000bda44]                           dc.w $0000
[000bda46]                           dc.w $0000
[000bda48]                           dc.w $0000
[000bda4a]                           dc.w $0000
[000bda4c]                           dc.w $0000
[000bda4e]                           dc.w $0000
[000bda50]                           dc.w $0000
[000bda52]                           dc.w $0000
[000bda54]                           dc.w $0000
[000bda56]                           dc.w $0000
[000bda58]                           dc.w $0000
[000bda5a]                           dc.w $0000
[000bda5c]                           dc.w $0000
[000bda5e]                           dc.w $2110
[000bda60]                           dc.w $0000
[000bda62]                           dc.w $0000
[000bda64]                           dc.w $2110
[000bda66]                           dc.w $3700
[000bda68]                           dc.w $0001
[000bda6a]                           dc.w $1020
[000bda6c]                           dc.w $4880
[000bda6e]                           dc.w $6c00
[000bda70]                           dc.w $8782
[000bda72]                           dc.w $3700
[000bda74]                           dc.w $1000
[000bda76]                           dc.w $1864
[000bda78]                           dc.w $0000
[000bda7a]                           dc.w $000c
[000bda7c]                           dc.w $2010
[000bda7e]                           dc.w $c000
[000bda80]                           dc.w $0002
[000bda82]                           dc.w $4009
[000bda84]                           dc.w $0000
[000bda86]                           dc.w $0000
[000bda88]                           dc.w $4008
[000bda8a]                           dc.w $0000
[000bda8c]                           dc.w $0000
[000bda8e]                           dc.w $8004
[000bda90]                           dc.w $0000
[000bda92]                           dc.w $000e
[000bda94]                           dc.w $8005
[000bda96]                           dc.w $c000
[000bda98]                           dc.w $0000
[000bda9a]                           dc.w $8004
[000bda9c]                           dc.w $0000
[000bda9e]                           dc.w $0000
[000bdaa0]                           dc.w $8004
[000bdaa2]                           dc.w $0000
[000bdaa4]                           dc.w $3f1c
[000bdaa6]                           dc.w $7878
[000bdaa8]                           dc.w $70f0
[000bdaaa]                           dc.w $00e3
[000bdaac]                           dc.w $8787
[000bdaae]                           dc.w $8f0c
[000bdab0]                           dc.w $fe18
[000bdab2]                           dc.w $0000
[000bdab4]                           dc.w $0000
[000bdab6]                           dc.w $01e7
[000bdab8]                           dc.b '8p<`',0
[000bdabd]                           dc.b $00
[000bdabe]                           dc.w $0787
[000bdac0]                           dc.w $c39f
[000bdac2]                           dc.w $fe1c
[000bdac4]                           dc.w $0000
[000bdac6]                           dc.w $0000
[000bdac8]                           dc.w $01e3
[000bdaca]                           dc.w $9ce0
[000bdacc]                           dc.w $e1e0
[000bdace]                           dc.w $0000
[000bdad0]                           dc.w $030f
[000bdad2]                           dc.w $1e1f
[000bdad4]                           dc.w $0f07
[000bdad6]                           dc.w $e000
[000bdad8]                           dc.w $70c0
[000bdada]                           dc.w $30f8
[000bdadc]                           dc.w $0ccf
[000bdade]                           dc.w $8f3c
[000bdae0]                           dc.w $0000
[000bdae2]                           dc.w $0300
[000bdae4]                           dc.w $0000
[000bdae6]                           dc.w $0000
[000bdae8]                           dc.w $0000
[000bdaea]                           dc.w $0000
[000bdaec]                           dc.w $0000
[000bdaee]                           dc.w $0000
[000bdaf0]                           dc.w $0000
[000bdaf2]                           dc.w $0000
[000bdaf4]                           dc.w $0000
[000bdaf6]                           dc.w $0000
PICDATA:
[000bdaf8]                           dc.w $0028
[000bdafa]                           dc.w $cbe6
[000bdafc]                           dc.w $0030
[000bdafe]                           dc.w $0020
[000bdb00]                           dc.w $0003
[000bdb02]                           dc.w $0001
[000bdb04]                           dc.w $0001
[000bdb06]                           dc.w $0000
[000bdb08]                           dc.w $0000
[000bdb0a]                           dc.w $0000
[000bdb0c]                           dc.w $0000
[000bdb0e]                           dc.w $0000
[000bdb10]                           dc.w $0000
[000bdb12]                           dc.w $0000
[000bdb14]                           dc.w $0000
[000bdb16]                           dc.w $0000
[000bdb18]                           dc.w $0000
[000bdb1a]                           dc.w $0000
[000bdb1c]                           dc.w $0000
[000bdb1e]                           dc.w $0000
[000bdb20]                           dc.w $0000
[000bdb22]                           dc.w $0000
[000bdb24]                           dc.w $0000
[000bdb26]                           dc.w $0000
[000bdb28]                           dc.w $0000
[000bdb2a]                           dc.w $0000
[000bdb2c]                           dc.w $0000
[000bdb2e]                           dc.w $0000
[000bdb30]                           dc.w $0000
[000bdb32]                           dc.w $0000
[000bdb34]                           dc.w $0000
[000bdb36]                           dc.w $0000
[000bdb38]                           dc.w $0000
[000bdb3a]                           dc.w $2110
[000bdb3c]                           dc.w $0000
[000bdb3e]                           dc.w $0000
[000bdb40]                           dc.w $2110
[000bdb42]                           dc.w $3700
[000bdb44]                           dc.w $0001
[000bdb46]                           dc.w $1020
[000bdb48]                           dc.w $4880
[000bdb4a]                           dc.w $6c00
[000bdb4c]                           dc.w $8782
[000bdb4e]                           dc.w $3700
[000bdb50]                           dc.w $1000
[000bdb52]                           dc.w $1864
[000bdb54]                           dc.w $0000
[000bdb56]                           dc.w $000c
[000bdb58]                           dc.w $2010
[000bdb5a]                           dc.w $c000
[000bdb5c]                           dc.w $0002
[000bdb5e]                           dc.w $4009
[000bdb60]                           dc.w $0000
[000bdb62]                           dc.w $0000
[000bdb64]                           dc.w $4008
[000bdb66]                           dc.w $0000
[000bdb68]                           dc.w $0000
[000bdb6a]                           dc.w $8004
[000bdb6c]                           dc.w $0000
[000bdb6e]                           dc.w $000e
[000bdb70]                           dc.w $8005
[000bdb72]                           dc.w $c000
[000bdb74]                           dc.w $0000
[000bdb76]                           dc.w $8004
[000bdb78]                           dc.w $0000
[000bdb7a]                           dc.w $0000
[000bdb7c]                           dc.w $8004
[000bdb7e]                           dc.w $0000
[000bdb80]                           dc.w $3f1c
[000bdb82]                           dc.w $7878
[000bdb84]                           dc.w $70f0
[000bdb86]                           dc.w $00e3
[000bdb88]                           dc.w $8787
[000bdb8a]                           dc.w $8f0c
[000bdb8c]                           dc.w $fe18
[000bdb8e]                           dc.w $0000
[000bdb90]                           dc.w $0000
[000bdb92]                           dc.w $01e7
[000bdb94]                           dc.b '8p<`',0
[000bdb99]                           dc.b $00
[000bdb9a]                           dc.w $0787
[000bdb9c]                           dc.w $c39f
[000bdb9e]                           dc.w $fe1c
[000bdba0]                           dc.w $0000
[000bdba2]                           dc.w $0000
[000bdba4]                           dc.w $01e3
[000bdba6]                           dc.w $9ce0
[000bdba8]                           dc.w $e1e0
[000bdbaa]                           dc.w $0000
[000bdbac]                           dc.w $030f
[000bdbae]                           dc.w $1e1f
[000bdbb0]                           dc.w $0f07
[000bdbb2]                           dc.w $e000
[000bdbb4]                           dc.w $70c0
[000bdbb6]                           dc.w $30f8
[000bdbb8]                           dc.w $0ccf
[000bdbba]                           dc.w $8f3c
[000bdbbc]                           dc.w $0000
[000bdbbe]                           dc.w $0300
[000bdbc0]                           dc.w $0000
[000bdbc2]                           dc.w $0000
[000bdbc4]                           dc.w $0000
[000bdbc6]                           dc.w $0000
[000bdbc8]                           dc.w $0000
[000bdbca]                           dc.w $0000
[000bdbcc]                           dc.w $0000
[000bdbce]                           dc.w $0000
[000bdbd0]                           dc.w $0000
[000bdbd2]                           dc.w $0000
A_3DBUTTON01:
[000bdbd4] 00064a22                  dc.l A_3Dbutton
[000bdbd8]                           dc.w $29f1
[000bdbda]                           dc.w $0178
[000bdbdc] 000630f2                  dc.l Auo_string
[000bdbe0]                           dc.w $0000
[000bdbe2]                           dc.w $0000
[000bdbe4]                           dc.w $0000
[000bdbe6]                           dc.w $0000
[000bdbe8]                           dc.w $0000
[000bdbea]                           dc.w $0000
[000bdbec]                           dc.w $0000
[000bdbee]                           dc.w $0000
[000bdbf0]                           dc.w $0000
[000bdbf2]                           dc.w $0000
A_3DBUTTON02:
[000bdbf4] 00064a22                  dc.l A_3Dbutton
[000bdbf8]                           dc.w $29f1
[000bdbfa]                           dc.w $0178
[000bdbfc] 000630f2                  dc.l Auo_string
[000bdc00]                           dc.w $0000
[000bdc02]                           dc.w $0000
[000bdc04]                           dc.w $0000
[000bdc06]                           dc.w $0000
[000bdc08]                           dc.w $0000
[000bdc0a]                           dc.w $0000
[000bdc0c]                           dc.w $0000
[000bdc0e]                           dc.w $0000
[000bdc10]                           dc.w $0000
[000bdc12]                           dc.w $0000
A_3DBUTTON03:
[000bdc14] 00064a22                  dc.l A_3Dbutton
[000bdc18]                           dc.w $29c1
[000bdc1a]                           dc.w $0178
[000bdc1c] 000630f2                  dc.l Auo_string
[000bdc20] 000bd77c                  dc.l TEXT_005
[000bdc24]                           dc.w $0000
[000bdc26]                           dc.w $0000
[000bdc28]                           dc.w $0000
[000bdc2a]                           dc.w $0000
[000bdc2c]                           dc.w $0000
[000bdc2e]                           dc.w $0000
[000bdc30]                           dc.w $0000
[000bdc32]                           dc.w $0000
A_3DBUTTON04:
[000bdc34] 00064a22                  dc.l A_3Dbutton
[000bdc38]                           dc.w $29c1
[000bdc3a]                           dc.w $0178
[000bdc3c] 000630f2                  dc.l Auo_string
[000bdc40] 000bd77f                  dc.l TEXT_009
[000bdc44]                           dc.w $0000
[000bdc46]                           dc.w $0000
[000bdc48]                           dc.w $0000
[000bdc4a]                           dc.w $0000
[000bdc4c]                           dc.w $0000
[000bdc4e]                           dc.w $0000
[000bdc50]                           dc.w $0000
[000bdc52]                           dc.w $0000
A_3DBUTTON27:
[000bdc54] 00064a22                  dc.l A_3Dbutton
[000bdc58]                           dc.w $09f1
[000bdc5a]                           dc.w $0178
[000bdc5c] 000630f2                  dc.l Auo_string
[000bdc60]                           dc.w $0000
[000bdc62]                           dc.w $0000
[000bdc64]                           dc.w $0000
[000bdc66]                           dc.w $0000
[000bdc68]                           dc.w $0000
[000bdc6a]                           dc.w $0000
[000bdc6c]                           dc.w $0000
[000bdc6e]                           dc.w $0000
[000bdc70]                           dc.w $0000
[000bdc72]                           dc.w $0000
A_ARROWS02:
[000bdc74] 00065c72                  dc.l A_arrows
[000bdc78]                           dc.w $1301
[000bdc7a]                           dc.w $0001
[000bdc7c]                           dc.w $0000
[000bdc7e]                           dc.w $0000
[000bdc80]                           dc.w $0000
[000bdc82]                           dc.w $0000
[000bdc84]                           dc.w $0000
[000bdc86]                           dc.w $0000
[000bdc88]                           dc.w $0000
[000bdc8a]                           dc.w $0000
[000bdc8c]                           dc.w $0000
[000bdc8e]                           dc.w $0000
[000bdc90]                           dc.w $0000
[000bdc92]                           dc.w $0000
A_CHECKBOX02:
[000bdc94] 0006323e                  dc.l A_checkbox
[000bdc98]                           dc.w $0000
[000bdc9a]                           dc.w $0001
[000bdc9c] 000630f2                  dc.l Auo_string
[000bdca0] 000bd787                  dc.l TEXT_01
[000bdca4]                           dc.w $0000
[000bdca6]                           dc.w $0000
[000bdca8]                           dc.w $0000
[000bdcaa]                           dc.w $0000
[000bdcac]                           dc.w $0000
[000bdcae]                           dc.w $0000
[000bdcb0]                           dc.w $0000
[000bdcb2]                           dc.w $0000
A_CHECKBOX03:
[000bdcb4] 0006323e                  dc.l A_checkbox
[000bdcb8]                           dc.w $0000
[000bdcba]                           dc.w $0001
[000bdcbc] 000630f2                  dc.l Auo_string
[000bdcc0] 000bd7a1                  dc.l TEXT_04
[000bdcc4]                           dc.w $0000
[000bdcc6]                           dc.w $0000
[000bdcc8]                           dc.w $0000
[000bdcca]                           dc.w $0000
[000bdccc]                           dc.w $0000
[000bdcce]                           dc.w $0000
[000bdcd0]                           dc.w $0000
[000bdcd2]                           dc.w $0000
A_INNERFRAME01:
[000bdcd4] 00064256                  dc.l A_innerframe
[000bdcd8]                           dc.w $1000
[000bdcda]                           dc.w $8f19
[000bdcdc] 000630f2                  dc.l Auo_string
[000bdce0] 000bd794                  dc.l TEXT_02
[000bdce4]                           dc.w $0000
[000bdce6]                           dc.w $0000
[000bdce8]                           dc.w $0000
[000bdcea]                           dc.w $0000
[000bdcec]                           dc.w $0000
[000bdcee]                           dc.w $0000
[000bdcf0]                           dc.w $0000
[000bdcf2]                           dc.w $0000
A_INNERFRAME03:
[000bdcf4] 00064256                  dc.l A_innerframe
[000bdcf8]                           dc.w $1000
[000bdcfa]                           dc.w $8f19
[000bdcfc] 000630f2                  dc.l Auo_string
[000bdd00] 000bd7ae                  dc.l TEXT_05
[000bdd04]                           dc.w $0000
[000bdd06]                           dc.w $0000
[000bdd08]                           dc.w $0000
[000bdd0a]                           dc.w $0000
[000bdd0c]                           dc.w $0000
[000bdd0e]                           dc.w $0000
[000bdd10]                           dc.w $0000
[000bdd12]                           dc.w $0000
A_PATTERN01:
[000bdd14] 000659ea                  dc.l A_pattern
[000bdd18]                           dc.w $0023
[000bdd1a]                           dc.w $0001
[000bdd1c]                           dc.w $0000
[000bdd1e]                           dc.w $0000
[000bdd20]                           dc.w $0000
[000bdd22]                           dc.w $0000
[000bdd24]                           dc.w $0000
[000bdd26]                           dc.w $0000
[000bdd28]                           dc.w $0000
[000bdd2a]                           dc.w $0000
[000bdd2c]                           dc.w $0000
[000bdd2e]                           dc.w $0000
[000bdd30]                           dc.w $0000
[000bdd32]                           dc.w $0000
A_PICTURE01:
[000bdd34] 00067ece                  dc.l A_picture
[000bdd38]                           dc.w $0002
[000bdd3a]                           dc.w $0481
[000bdd3c] 0006863e                  dc.l Auo_picture
[000bdd40] 000bd7dc                  dc.l DATAS_01
[000bdd44]                           dc.w $0000
[000bdd46]                           dc.w $0000
[000bdd48]                           dc.w $0000
[000bdd4a]                           dc.w $0000
[000bdd4c]                           dc.w $0000
[000bdd4e]                           dc.w $0000
[000bdd50]                           dc.w $0000
[000bdd52]                           dc.w $0000
USER_007:
[000bdd54] 000659ea                  dc.l A_pattern
[000bdd58]                           dc.w $0021
[000bdd5a]                           dc.w $0001
[000bdd5c]                           dc.w $0000
[000bdd5e]                           dc.w $0000
[000bdd60]                           dc.w $0000
[000bdd62]                           dc.w $0000
[000bdd64]                           dc.w $0000
[000bdd66]                           dc.w $0000
[000bdd68]                           dc.w $0000
[000bdd6a]                           dc.w $0000
[000bdd6c]                           dc.w $0000
[000bdd6e]                           dc.w $0000
[000bdd70]                           dc.w $0000
[000bdd72]                           dc.w $0000
USER_012:
[000bdd74] 000659ea                  dc.l A_pattern
[000bdd78]                           dc.w $0022
[000bdd7a]                           dc.w $0001
[000bdd7c]                           dc.w $0000
[000bdd7e]                           dc.w $0000
[000bdd80]                           dc.w $0000
[000bdd82]                           dc.w $0000
[000bdd84]                           dc.w $0000
[000bdd86]                           dc.w $0000
[000bdd88]                           dc.w $0000
[000bdd8a]                           dc.w $0000
[000bdd8c]                           dc.w $0000
[000bdd8e]                           dc.w $0000
[000bdd90]                           dc.w $0000
[000bdd92]                           dc.w $0000
USER_013:
[000bdd94] 000659ea                  dc.l A_pattern
[000bdd98]                           dc.w $0024
[000bdd9a]                           dc.w $0001
[000bdd9c]                           dc.w $0000
[000bdd9e]                           dc.w $0000
[000bdda0]                           dc.w $0000
[000bdda2]                           dc.w $0000
[000bdda4]                           dc.w $0000
[000bdda6]                           dc.w $0000
[000bdda8]                           dc.w $0000
[000bddaa]                           dc.w $0000
[000bddac]                           dc.w $0000
[000bddae]                           dc.w $0000
[000bddb0]                           dc.w $0000
[000bddb2]                           dc.w $0000
USER_014:
[000bddb4] 000659ea                  dc.l A_pattern
[000bddb8]                           dc.w $0025
[000bddba]                           dc.w $0001
[000bddbc]                           dc.w $0000
[000bddbe]                           dc.w $0000
[000bddc0]                           dc.w $0000
[000bddc2]                           dc.w $0000
[000bddc4]                           dc.w $0000
[000bddc6]                           dc.w $0000
[000bddc8]                           dc.w $0000
[000bddca]                           dc.w $0000
[000bddcc]                           dc.w $0000
[000bddce]                           dc.w $0000
[000bddd0]                           dc.w $0000
[000bddd2]                           dc.w $0000
USER_015:
[000bddd4] 000659ea                  dc.l A_pattern
[000bddd8]                           dc.w $0026
[000bddda]                           dc.w $0001
[000bdddc]                           dc.w $0000
[000bddde]                           dc.w $0000
[000bdde0]                           dc.w $0000
[000bdde2]                           dc.w $0000
[000bdde4]                           dc.w $0000
[000bdde6]                           dc.w $0000
[000bdde8]                           dc.w $0000
[000bddea]                           dc.w $0000
[000bddec]                           dc.w $0000
[000bddee]                           dc.w $0000
[000bddf0]                           dc.w $0000
[000bddf2]                           dc.w $0000
USER_016:
[000bddf4] 000659ea                  dc.l A_pattern
[000bddf8]                           dc.w $0027
[000bddfa]                           dc.w $0001
[000bddfc]                           dc.w $0000
[000bddfe]                           dc.w $0000
[000bde00]                           dc.w $0000
[000bde02]                           dc.w $0000
[000bde04]                           dc.w $0000
[000bde06]                           dc.w $0000
[000bde08]                           dc.w $0000
[000bde0a]                           dc.w $0000
[000bde0c]                           dc.w $0000
[000bde0e]                           dc.w $0000
[000bde10]                           dc.w $0000
[000bde12]                           dc.w $0000
USER_017:
[000bde14] 000659ea                  dc.l A_pattern
[000bde18]                           dc.w $0028
[000bde1a]                           dc.w $0001
[000bde1c]                           dc.w $0000
[000bde1e]                           dc.w $0000
[000bde20]                           dc.w $0000
[000bde22]                           dc.w $0000
[000bde24]                           dc.w $0000
[000bde26]                           dc.w $0000
[000bde28]                           dc.w $0000
[000bde2a]                           dc.w $0000
[000bde2c]                           dc.w $0000
[000bde2e]                           dc.w $0000
[000bde30]                           dc.w $0000
[000bde32]                           dc.w $0000
USER_018:
[000bde34] 000659ea                  dc.l A_pattern
[000bde38]                           dc.w $0029
[000bde3a]                           dc.w $0001
[000bde3c]                           dc.w $0000
[000bde3e]                           dc.w $0000
[000bde40]                           dc.w $0000
[000bde42]                           dc.w $0000
[000bde44]                           dc.w $0000
[000bde46]                           dc.w $0000
[000bde48]                           dc.w $0000
[000bde4a]                           dc.w $0000
[000bde4c]                           dc.w $0000
[000bde4e]                           dc.w $0000
[000bde50]                           dc.w $0000
[000bde52]                           dc.w $0000
USER_019:
[000bde54] 000659ea                  dc.l A_pattern
[000bde58]                           dc.w $002a
[000bde5a]                           dc.w $0001
[000bde5c]                           dc.w $0000
[000bde5e]                           dc.w $0000
[000bde60]                           dc.w $0000
[000bde62]                           dc.w $0000
[000bde64]                           dc.w $0000
[000bde66]                           dc.w $0000
[000bde68]                           dc.w $0000
[000bde6a]                           dc.w $0000
[000bde6c]                           dc.w $0000
[000bde6e]                           dc.w $0000
[000bde70]                           dc.w $0000
[000bde72]                           dc.w $0000
USER_020:
[000bde74] 000659ea                  dc.l A_pattern
[000bde78]                           dc.w $002b
[000bde7a]                           dc.w $0001
[000bde7c]                           dc.w $0000
[000bde7e]                           dc.w $0000
[000bde80]                           dc.w $0000
[000bde82]                           dc.w $0000
[000bde84]                           dc.w $0000
[000bde86]                           dc.w $0000
[000bde88]                           dc.w $0000
[000bde8a]                           dc.w $0000
[000bde8c]                           dc.w $0000
[000bde8e]                           dc.w $0000
[000bde90]                           dc.w $0000
[000bde92]                           dc.w $0000
USER_021:
[000bde94] 000659ea                  dc.l A_pattern
[000bde98]                           dc.w $002c
[000bde9a]                           dc.w $0001
[000bde9c]                           dc.w $0000
[000bde9e]                           dc.w $0000
[000bdea0]                           dc.w $0000
[000bdea2]                           dc.w $0000
[000bdea4]                           dc.w $0000
[000bdea6]                           dc.w $0000
[000bdea8]                           dc.w $0000
[000bdeaa]                           dc.w $0000
[000bdeac]                           dc.w $0000
[000bdeae]                           dc.w $0000
[000bdeb0]                           dc.w $0000
[000bdeb2]                           dc.w $0000
USER_022:
[000bdeb4] 000659ea                  dc.l A_pattern
[000bdeb8]                           dc.w $0061
[000bdeba]                           dc.w $0001
[000bdebc]                           dc.w $0000
[000bdebe]                           dc.w $0000
[000bdec0]                           dc.w $0000
[000bdec2]                           dc.w $0000
[000bdec4]                           dc.w $0000
[000bdec6]                           dc.w $0000
[000bdec8]                           dc.w $0000
[000bdeca]                           dc.w $0000
[000bdecc]                           dc.w $0000
[000bdece]                           dc.w $0000
[000bded0]                           dc.w $0000
[000bded2]                           dc.w $0000
USER_023:
[000bded4] 000659ea                  dc.l A_pattern
[000bded8]                           dc.w $0062
[000bdeda]                           dc.w $0001
[000bdedc]                           dc.w $0000
[000bdede]                           dc.w $0000
[000bdee0]                           dc.w $0000
[000bdee2]                           dc.w $0000
[000bdee4]                           dc.w $0000
[000bdee6]                           dc.w $0000
[000bdee8]                           dc.w $0000
[000bdeea]                           dc.w $0000
[000bdeec]                           dc.w $0000
[000bdeee]                           dc.w $0000
[000bdef0]                           dc.w $0000
[000bdef2]                           dc.w $0000
USER_024:
[000bdef4] 000659ea                  dc.l A_pattern
[000bdef8]                           dc.w $0063
[000bdefa]                           dc.w $0001
[000bdefc]                           dc.w $0000
[000bdefe]                           dc.w $0000
[000bdf00]                           dc.w $0000
[000bdf02]                           dc.w $0000
[000bdf04]                           dc.w $0000
[000bdf06]                           dc.w $0000
[000bdf08]                           dc.w $0000
[000bdf0a]                           dc.w $0000
[000bdf0c]                           dc.w $0000
[000bdf0e]                           dc.w $0000
[000bdf10]                           dc.w $0000
[000bdf12]                           dc.w $0000
USER_025:
[000bdf14] 000659ea                  dc.l A_pattern
[000bdf18]                           dc.w $0064
[000bdf1a]                           dc.w $0001
[000bdf1c]                           dc.w $0000
[000bdf1e]                           dc.w $0000
[000bdf20]                           dc.w $0000
[000bdf22]                           dc.w $0000
[000bdf24]                           dc.w $0000
[000bdf26]                           dc.w $0000
[000bdf28]                           dc.w $0000
[000bdf2a]                           dc.w $0000
[000bdf2c]                           dc.w $0000
[000bdf2e]                           dc.w $0000
[000bdf30]                           dc.w $0000
[000bdf32]                           dc.w $0000
USER_026:
[000bdf34] 000659ea                  dc.l A_pattern
[000bdf38]                           dc.w $0065
[000bdf3a]                           dc.w $0001
[000bdf3c]                           dc.w $0000
[000bdf3e]                           dc.w $0000
[000bdf40]                           dc.w $0000
[000bdf42]                           dc.w $0000
[000bdf44]                           dc.w $0000
[000bdf46]                           dc.w $0000
[000bdf48]                           dc.w $0000
[000bdf4a]                           dc.w $0000
[000bdf4c]                           dc.w $0000
[000bdf4e]                           dc.w $0000
[000bdf50]                           dc.w $0000
[000bdf52]                           dc.w $0000
USER_027:
[000bdf54] 000659ea                  dc.l A_pattern
[000bdf58]                           dc.w $0066
[000bdf5a]                           dc.w $0001
[000bdf5c]                           dc.w $0000
[000bdf5e]                           dc.w $0000
[000bdf60]                           dc.w $0000
[000bdf62]                           dc.w $0000
[000bdf64]                           dc.w $0000
[000bdf66]                           dc.w $0000
[000bdf68]                           dc.w $0000
[000bdf6a]                           dc.w $0000
[000bdf6c]                           dc.w $0000
[000bdf6e]                           dc.w $0000
[000bdf70]                           dc.w $0000
[000bdf72]                           dc.w $0000
USER_028:
[000bdf74] 000659ea                  dc.l A_pattern
[000bdf78]                           dc.w $0067
[000bdf7a]                           dc.w $0001
[000bdf7c]                           dc.w $0000
[000bdf7e]                           dc.w $0000
[000bdf80]                           dc.w $0000
[000bdf82]                           dc.w $0000
[000bdf84]                           dc.w $0000
[000bdf86]                           dc.w $0000
[000bdf88]                           dc.w $0000
[000bdf8a]                           dc.w $0000
[000bdf8c]                           dc.w $0000
[000bdf8e]                           dc.w $0000
[000bdf90]                           dc.w $0000
[000bdf92]                           dc.w $0000
USER_029:
[000bdf94] 000659ea                  dc.l A_pattern
[000bdf98]                           dc.w $0068
[000bdf9a]                           dc.w $0001
[000bdf9c]                           dc.w $0000
[000bdf9e]                           dc.w $0000
[000bdfa0]                           dc.w $0000
[000bdfa2]                           dc.w $0000
[000bdfa4]                           dc.w $0000
[000bdfa6]                           dc.w $0000
[000bdfa8]                           dc.w $0000
[000bdfaa]                           dc.w $0000
[000bdfac]                           dc.w $0000
[000bdfae]                           dc.w $0000
[000bdfb0]                           dc.w $0000
[000bdfb2]                           dc.w $0000
USER_030:
[000bdfb4] 000659ea                  dc.l A_pattern
[000bdfb8]                           dc.w $0069
[000bdfba]                           dc.w $0001
[000bdfbc]                           dc.w $0000
[000bdfbe]                           dc.w $0000
[000bdfc0]                           dc.w $0000
[000bdfc2]                           dc.w $0000
[000bdfc4]                           dc.w $0000
[000bdfc6]                           dc.w $0000
[000bdfc8]                           dc.w $0000
[000bdfca]                           dc.w $0000
[000bdfcc]                           dc.w $0000
[000bdfce]                           dc.w $0000
[000bdfd0]                           dc.w $0000
[000bdfd2]                           dc.w $0000
USER_031:
[000bdfd4] 000659ea                  dc.l A_pattern
[000bdfd8]                           dc.w $006b
[000bdfda]                           dc.w $0001
[000bdfdc]                           dc.w $0000
[000bdfde]                           dc.w $0000
[000bdfe0]                           dc.w $0000
[000bdfe2]                           dc.w $0000
[000bdfe4]                           dc.w $0000
[000bdfe6]                           dc.w $0000
[000bdfe8]                           dc.w $0000
[000bdfea]                           dc.w $0000
[000bdfec]                           dc.w $0000
[000bdfee]                           dc.w $0000
[000bdff0]                           dc.w $0000
[000bdff2]                           dc.w $0000
USER_032:
[000bdff4] 000659ea                  dc.l A_pattern
[000bdff8]                           dc.w $006a
[000bdffa]                           dc.w $0001
[000bdffc]                           dc.w $0000
[000bdffe]                           dc.w $0000
[000be000]                           dc.w $0000
[000be002]                           dc.w $0000
[000be004]                           dc.w $0000
[000be006]                           dc.w $0000
[000be008]                           dc.w $0000
[000be00a]                           dc.w $0000
[000be00c]                           dc.w $0000
[000be00e]                           dc.w $0000
[000be010]                           dc.w $0000
[000be012]                           dc.w $0000
USER_033:
[000be014] 000659ea                  dc.l A_pattern
[000be018]                           dc.w $006c
[000be01a]                           dc.w $0001
[000be01c]                           dc.w $0000
[000be01e]                           dc.w $0000
[000be020]                           dc.w $0000
[000be022]                           dc.w $0000
[000be024]                           dc.w $0000
[000be026]                           dc.w $0000
[000be028]                           dc.w $0000
[000be02a]                           dc.w $0000
[000be02c]                           dc.w $0000
[000be02e]                           dc.w $0000
[000be030]                           dc.w $0000
[000be032]                           dc.w $0000
USER_034:
[000be034] 000659ea                  dc.l A_pattern
[000be038]                           dc.w $006d
[000be03a]                           dc.w $0001
[000be03c]                           dc.w $0000
[000be03e]                           dc.w $0000
[000be040]                           dc.w $0000
[000be042]                           dc.w $0000
[000be044]                           dc.w $0000
[000be046]                           dc.w $0000
[000be048]                           dc.w $0000
[000be04a]                           dc.w $0000
[000be04c]                           dc.w $0000
[000be04e]                           dc.w $0000
[000be050]                           dc.w $0000
[000be052]                           dc.w $0000
USER_035:
[000be054] 000659ea                  dc.l A_pattern
[000be058]                           dc.w $006e
[000be05a]                           dc.w $0001
[000be05c]                           dc.w $0000
[000be05e]                           dc.w $0000
[000be060]                           dc.w $0000
[000be062]                           dc.w $0000
[000be064]                           dc.w $0000
[000be066]                           dc.w $0000
[000be068]                           dc.w $0000
[000be06a]                           dc.w $0000
[000be06c]                           dc.w $0000
[000be06e]                           dc.w $0000
[000be070]                           dc.w $0000
[000be072]                           dc.w $0000
USER_036:
[000be074] 000659ea                  dc.l A_pattern
[000be078]                           dc.w $006f
[000be07a]                           dc.w $0001
[000be07c]                           dc.w $0000
[000be07e]                           dc.w $0000
[000be080]                           dc.w $0000
[000be082]                           dc.w $0000
[000be084]                           dc.w $0000
[000be086]                           dc.w $0000
[000be088]                           dc.w $0000
[000be08a]                           dc.w $0000
[000be08c]                           dc.w $0000
[000be08e]                           dc.w $0000
[000be090]                           dc.w $0000
[000be092]                           dc.w $0000
USER_037:
[000be094] 000659ea                  dc.l A_pattern
[000be098]                           dc.w $0070
[000be09a]                           dc.w $0001
[000be09c]                           dc.w $0000
[000be09e]                           dc.w $0000
[000be0a0]                           dc.w $0000
[000be0a2]                           dc.w $0000
[000be0a4]                           dc.w $0000
[000be0a6]                           dc.w $0000
[000be0a8]                           dc.w $0000
[000be0aa]                           dc.w $0000
[000be0ac]                           dc.w $0000
[000be0ae]                           dc.w $0000
[000be0b0]                           dc.w $0000
[000be0b2]                           dc.w $0000
USER_038:
[000be0b4] 000659ea                  dc.l A_pattern
[000be0b8]                           dc.w $0071
[000be0ba]                           dc.w $0001
[000be0bc]                           dc.w $0000
[000be0be]                           dc.w $0000
[000be0c0]                           dc.w $0000
[000be0c2]                           dc.w $0000
[000be0c4]                           dc.w $0000
[000be0c6]                           dc.w $0000
[000be0c8]                           dc.w $0000
[000be0ca]                           dc.w $0000
[000be0cc]                           dc.w $0000
[000be0ce]                           dc.w $0000
[000be0d0]                           dc.w $0000
[000be0d2]                           dc.w $0000
USER_039:
[000be0d4] 000659ea                  dc.l A_pattern
[000be0d8]                           dc.w $0072
[000be0da]                           dc.w $0001
[000be0dc]                           dc.w $0000
[000be0de]                           dc.w $0000
[000be0e0]                           dc.w $0000
[000be0e2]                           dc.w $0000
[000be0e4]                           dc.w $0000
[000be0e6]                           dc.w $0000
[000be0e8]                           dc.w $0000
[000be0ea]                           dc.w $0000
[000be0ec]                           dc.w $0000
[000be0ee]                           dc.w $0000
[000be0f0]                           dc.w $0000
[000be0f2]                           dc.w $0000
USER_040:
[000be0f4] 000659ea                  dc.l A_pattern
[000be0f8]                           dc.w $0073
[000be0fa]                           dc.w $0001
[000be0fc]                           dc.w $0000
[000be0fe]                           dc.w $0000
[000be100]                           dc.w $0000
[000be102]                           dc.w $0000
[000be104]                           dc.w $0000
[000be106]                           dc.w $0000
[000be108]                           dc.w $0000
[000be10a]                           dc.w $0000
[000be10c]                           dc.w $0000
[000be10e]                           dc.w $0000
[000be110]                           dc.w $0000
[000be112]                           dc.w $0000
USER_041:
[000be114] 000659ea                  dc.l A_pattern
[000be118]                           dc.w $0074
[000be11a]                           dc.w $0001
[000be11c]                           dc.w $0000
[000be11e]                           dc.w $0000
[000be120]                           dc.w $0000
[000be122]                           dc.w $0000
[000be124]                           dc.w $0000
[000be126]                           dc.w $0000
[000be128]                           dc.w $0000
[000be12a]                           dc.w $0000
[000be12c]                           dc.w $0000
[000be12e]                           dc.w $0000
[000be130]                           dc.w $0000
[000be132]                           dc.w $0000
USER_042:
[000be134] 000659ea                  dc.l A_pattern
[000be138]                           dc.w $0075
[000be13a]                           dc.w $0001
[000be13c]                           dc.w $0000
[000be13e]                           dc.w $0000
[000be140]                           dc.w $0000
[000be142]                           dc.w $0000
[000be144]                           dc.w $0000
[000be146]                           dc.w $0000
[000be148]                           dc.w $0000
[000be14a]                           dc.w $0000
[000be14c]                           dc.w $0000
[000be14e]                           dc.w $0000
[000be150]                           dc.w $0000
[000be152]                           dc.w $0000
USER_043:
[000be154] 000659ea                  dc.l A_pattern
[000be158]                           dc.w $0076
[000be15a]                           dc.w $0001
[000be15c]                           dc.w $0000
[000be15e]                           dc.w $0000
[000be160]                           dc.w $0000
[000be162]                           dc.w $0000
[000be164]                           dc.w $0000
[000be166]                           dc.w $0000
[000be168]                           dc.w $0000
[000be16a]                           dc.w $0000
[000be16c]                           dc.w $0000
[000be16e]                           dc.w $0000
[000be170]                           dc.w $0000
[000be172]                           dc.w $0000
USER_044:
[000be174] 000659ea                  dc.l A_pattern
[000be178]                           dc.w $0077
[000be17a]                           dc.w $0001
[000be17c]                           dc.w $0000
[000be17e]                           dc.w $0000
[000be180]                           dc.w $0000
[000be182]                           dc.w $0000
[000be184]                           dc.w $0000
[000be186]                           dc.w $0000
[000be188]                           dc.w $0000
[000be18a]                           dc.w $0000
[000be18c]                           dc.w $0000
[000be18e]                           dc.w $0000
[000be190]                           dc.w $0000
[000be192]                           dc.w $0000
ED_PICTURE:
[000be194]                           dc.w $ffff
[000be196]                           dc.w $0001
[000be198]                           dc.w $000c
[000be19a]                           dc.w $0018
[000be19c]                           dc.w $0000
[000be19e]                           dc.w $0010
[000be1a0] 000bdbf4                  dc.l A_3DBUTTON02
[000be1a4]                           dc.w $0000
[000be1a6]                           dc.w $0000
[000be1a8]                           dc.w $002a
[000be1aa]                           dc.w $000d
_01_ED_PICTURE:
[000be1ac]                           dc.w $0004
[000be1ae]                           dc.w $0002
[000be1b0]                           dc.w $0002
[000be1b2]                           dc.w $0018
[000be1b4]                           dc.w $0040
[000be1b6]                           dc.w $0000
[000be1b8] 000bdbd4                  dc.l A_3DBUTTON01
[000be1bc]                           dc.w $0000
[000be1be]                           dc.w $0000
[000be1c0]                           dc.w $000d
[000be1c2]                           dc.w $0005
_02_ED_PICTURE:
[000be1c4]                           dc.w $0001
[000be1c6]                           dc.w $ffff
[000be1c8]                           dc.w $ffff
[000be1ca]                           dc.w $0018
[000be1cc]                           dc.w $1800
[000be1ce]                           dc.w $0000
[000be1d0] 000bdd34                  dc.l A_PICTURE01
[000be1d4]                           dc.w $0000
[000be1d6]                           dc.w $0000
[000be1d8]                           dc.w $000d
[000be1da]                           dc.w $0005
_02aED_PICTURE:
[000be1dc]                           dc.w $0000
[000be1de]                           dc.w $0000
[000be1e0] 00027d2a                  dc.l acc
[000be1e4]                           dc.w $8000
[000be1e6]                           dc.w $0000
[000be1e8]                           dc.w $0000
[000be1ea]                           dc.w $0000
[000be1ec]                           dc.w $0000
[000be1ee]                           dc.w $0000
[000be1f0]                           dc.w $0000
[000be1f2]                           dc.w $0000
_04_ED_PICTURE:
[000be1f4]                           dc.w $0006
[000be1f6]                           dc.w $ffff
[000be1f8]                           dc.w $ffff
[000be1fa]                           dc.w $0018
[000be1fc]                           dc.w $4007
[000be1fe]                           dc.w $0010
[000be200] 000bdc14                  dc.l A_3DBUTTON03
[000be204]                           dc.w $000f
[000be206]                           dc.w $0001
[000be208]                           dc.w $000c
[000be20a]                           dc.w $0002
_04aED_PICTURE:
[000be20c] 00027c12                  dc.l ok
[000be210]                           dc.w $0000
[000be212]                           dc.w $0000
[000be214]                           dc.w $8000
[000be216]                           dc.w $884f
[000be218]                           dc.w $0000
[000be21a]                           dc.w $0000
[000be21c]                           dc.w $0000
[000be21e]                           dc.w $0000
[000be220]                           dc.w $0000
[000be222]                           dc.w $0000
_06_ED_PICTURE:
[000be224]                           dc.w $0008
[000be226]                           dc.w $ffff
[000be228]                           dc.w $ffff
[000be22a]                           dc.w $0018
[000be22c]                           dc.w $4005
[000be22e]                           dc.w $0010
[000be230] 000bdc34                  dc.l A_3DBUTTON04
[000be234]                           dc.w $001d
[000be236]                           dc.w $0001
[000be238]                           dc.w $000c
[000be23a]                           dc.w $0002
_06aED_PICTURE:
[000be23c] 00027c06                  dc.l abort
[000be240]                           dc.w $0000
[000be242]                           dc.w $0000
[000be244]                           dc.w $8000
[000be246]                           dc.w $8841
[000be248]                           dc.w $0000
[000be24a]                           dc.w $0000
[000be24c]                           dc.w $0000
[000be24e]                           dc.w $0000
[000be250]                           dc.w $0000
[000be252]                           dc.w $0000
_08_ED_PICTURE:
[000be254]                           dc.w $000a
[000be256]                           dc.w $ffff
[000be258]                           dc.w $ffff
[000be25a]                           dc.w $0018
[000be25c]                           dc.w $0041
[000be25e]                           dc.w $0000
[000be260] 000bdc94                  dc.l A_CHECKBOX02
[000be264]                           dc.w $000f
[000be266]                           dc.w $0004
[000be268]                           dc.w $000f
[000be26a]                           dc.w $0001
_08aED_PICTURE:
[000be26c] 00027a4e                  dc.l edpi_tile
[000be270]                           dc.w $0000
[000be272]                           dc.w $0000
[000be274]                           dc.w $8000
[000be276]                           dc.w $884b
[000be278]                           dc.w $0000
[000be27a]                           dc.w $0000
[000be27c]                           dc.w $0000
[000be27e]                           dc.w $0000
[000be280]                           dc.w $0000
[000be282]                           dc.w $0000
_10_ED_PICTURE:
[000be284]                           dc.w $000c
[000be286]                           dc.w $ffff
[000be288]                           dc.w $ffff
[000be28a]                           dc.w $0018
[000be28c]                           dc.w $0041
[000be28e]                           dc.w $0000
[000be290] 000bdcb4                  dc.l A_CHECKBOX03
[000be294]                           dc.w $000f
[000be296]                           dc.w $0005
[000be298]                           dc.w $000f
[000be29a]                           dc.w $0001
_10aED_PICTURE:
[000be29c] 000279c0                  dc.l edpi_dither
[000be2a0]                           dc.w $0000
[000be2a2]                           dc.w $0000
[000be2a4]                           dc.w $8000
[000be2a6]                           dc.w $8844
[000be2a8]                           dc.w $0000
[000be2aa]                           dc.w $0000
[000be2ac]                           dc.w $0000
[000be2ae]                           dc.w $0000
[000be2b0]                           dc.w $0000
[000be2b2]                           dc.w $0000
_12_ED_PICTURE:
[000be2b4]                           dc.w $0000
[000be2b6]                           dc.w $000d
[000be2b8]                           dc.w $0013
[000be2ba]                           dc.w $0018
[000be2bc]                           dc.w $0040
[000be2be]                           dc.w $0000
[000be2c0] 000bdcd4                  dc.l A_INNERFRAME01
[000be2c4]                           dc.w $0001
[000be2c6]                           dc.w $0006
[000be2c8]                           dc.w $0028
[000be2ca]                           dc.w $0007
_13_ED_PICTURE:
[000be2cc]                           dc.w $000f
[000be2ce]                           dc.w $000e
[000be2d0]                           dc.w $000e
[000be2d2]                           dc.w $001c
[000be2d4]                           dc.w $0040
[000be2d6]                           dc.w $0000
[000be2d8] 000bd7b6                  dc.l TEXT_11
[000be2dc]                           dc.w $0003
[000be2de]                           dc.w $0001
[000be2e0]                           dc.w $0006
[000be2e2]                           dc.w $0001
_14_ED_PICTURE:
[000be2e4]                           dc.w $000d
[000be2e6]                           dc.w $ffff
[000be2e8]                           dc.w $ffff
[000be2ea]                           dc.w $0018
[000be2ec]                           dc.w $0040
[000be2ee]                           dc.w $0000
[000be2f0] 000bdc74                  dc.l A_ARROWS02
[000be2f4]                           dc.w $0000
[000be2f6]                           dc.w $0000
[000be2f8]                           dc.w $0001
[000be2fa]                           dc.w $0001
_15_ED_PICTURE:
[000be2fc]                           dc.w $0013
[000be2fe]                           dc.w $0011
[000be300]                           dc.w $0012
[000be302]                           dc.w $0014
[000be304]                           dc.w $0040
[000be306]                           dc.w $0020
[000be308]                           dc.w $00ff
[000be30a]                           dc.w $1101
[000be30c]                           dc.w $000a
[000be30e]                           dc.w $0001
[000be310]                           dc.w $0012
[000be312]                           dc.w $0001
_15aED_PICTURE:
[000be314] 0002795c                  dc.l edpi_col
[000be318]                           dc.w $0000
[000be31a]                           dc.w $0000
[000be31c]                           dc.w $8000
[000be31e]                           dc.w $8846
[000be320]                           dc.w $0000
[000be322]                           dc.w $0000
[000be324]                           dc.w $0000
[000be326]                           dc.w $0000
[000be328]                           dc.w $0000
[000be32a]                           dc.w $0000
_17_ED_PICTURE:
[000be32c]                           dc.w $0012
[000be32e]                           dc.w $ffff
[000be330]                           dc.w $ffff
[000be332]                           dc.w $0014
[000be334]                           dc.w $0000
[000be336]                           dc.w $0000
[000be338]                           dc.w $0001
[000be33a]                           dc.w $1171
[000be33c]                           dc.w $0010
[000be33e]                           dc.w $0000
[000be340]                           dc.w $0002
[000be342]                           dc.w $0001
_18_ED_PICTURE:
[000be344]                           dc.w $000f
[000be346]                           dc.w $ffff
[000be348]                           dc.w $ffff
[000be34a]                           dc.w $0018
[000be34c]                           dc.w $0000
[000be34e]                           dc.w $0000
[000be350] 000bdc54                  dc.l A_3DBUTTON27
[000be354]                           dc.w $0000
[000be356]                           dc.w $0000
[000be358]                           dc.w $0010
[000be35a]                           dc.w $0001
_19_ED_PICTURE:
[000be35c]                           dc.w $000c
[000be35e]                           dc.w $0014
[000be360]                           dc.w $005a
[000be362]                           dc.w $0018
[000be364]                           dc.w $0040
[000be366]                           dc.w $0000
[000be368] 000bdcf4                  dc.l A_INNERFRAME03
[000be36c]                           dc.w $0001
[000be36e]                           dc.w $0002
[000be370]                           dc.w $0026
[000be372]                           dc.w $0005
_20_ED_PICTURE:
[000be374]                           dc.w $0016
[000be376]                           dc.w $ffff
[000be378]                           dc.w $ffff
[000be37a]                           dc.w $0018
[000be37c]                           dc.w $0005
[000be37e]                           dc.w $0000
[000be380] 000bdd54                  dc.l USER_007
[000be384]                           dc.w $0001
[000be386]                           dc.w $0001
[000be388]                           dc.w $0003
[000be38a]                           dc.w $0001
_20aED_PICTURE:
[000be38c] 000279f6                  dc.l edpi_pattern
[000be390]                           dc.w $0000
[000be392]                           dc.w $0000
[000be394]                           dc.w $8000
[000be396]                           dc.w $0000
[000be398]                           dc.w $0003
[000be39a]                           dc.w $0100
[000be39c]                           dc.w $0000
[000be39e]                           dc.w $0000
[000be3a0]                           dc.w $0000
[000be3a2]                           dc.w $0000
_22_ED_PICTURE:
[000be3a4]                           dc.w $0018
[000be3a6]                           dc.w $ffff
[000be3a8]                           dc.w $ffff
[000be3aa]                           dc.w $0018
[000be3ac]                           dc.w $0005
[000be3ae]                           dc.w $0000
[000be3b0] 000bdd74                  dc.l USER_012
[000be3b4]                           dc.w $0001
[000be3b6]                           dc.w $0002
[000be3b8]                           dc.w $0003
[000be3ba]                           dc.w $0001
_22aED_PICTURE:
[000be3bc] 000279f6                  dc.l edpi_pattern
[000be3c0]                           dc.w $0000
[000be3c2]                           dc.w $0000
[000be3c4]                           dc.w $8000
[000be3c6]                           dc.w $0000
[000be3c8]                           dc.w $0003
[000be3ca]                           dc.w $0200
[000be3cc]                           dc.w $0000
[000be3ce]                           dc.w $0000
[000be3d0]                           dc.w $0000
[000be3d2]                           dc.w $0000
_24_ED_PICTURE:
[000be3d4]                           dc.w $001a
[000be3d6]                           dc.w $ffff
[000be3d8]                           dc.w $ffff
[000be3da]                           dc.w $0018
[000be3dc]                           dc.w $0005
[000be3de]                           dc.w $0000
[000be3e0] 000bdd14                  dc.l A_PATTERN01
[000be3e4]                           dc.w $0001
[000be3e6]                           dc.w $0003
[000be3e8]                           dc.w $0003
[000be3ea]                           dc.w $0001
_24aED_PICTURE:
[000be3ec] 000279f6                  dc.l edpi_pattern
[000be3f0]                           dc.w $0000
[000be3f2]                           dc.w $0000
[000be3f4]                           dc.w $8000
[000be3f6]                           dc.w $0000
[000be3f8]                           dc.w $0003
[000be3fa]                           dc.w $0300
[000be3fc]                           dc.w $0000
[000be3fe]                           dc.w $0000
[000be400]                           dc.w $0000
[000be402]                           dc.w $0000
_26_ED_PICTURE:
[000be404]                           dc.w $001c
[000be406]                           dc.w $ffff
[000be408]                           dc.w $ffff
[000be40a]                           dc.w $0018
[000be40c]                           dc.w $0005
[000be40e]                           dc.w $0000
[000be410] 000bdd94                  dc.l USER_013
[000be414]                           dc.w $0004
[000be416]                           dc.w $0001
[000be418]                           dc.w $0003
[000be41a]                           dc.w $0001
_26aED_PICTURE:
[000be41c] 000279f6                  dc.l edpi_pattern
[000be420]                           dc.w $0000
[000be422]                           dc.w $0000
[000be424]                           dc.w $8000
[000be426]                           dc.w $0000
[000be428]                           dc.w $0003
[000be42a]                           dc.w $0400
[000be42c]                           dc.w $0000
[000be42e]                           dc.w $0000
[000be430]                           dc.w $0000
[000be432]                           dc.w $0000
_28_ED_PICTURE:
[000be434]                           dc.w $001e
[000be436]                           dc.w $ffff
[000be438]                           dc.w $ffff
[000be43a]                           dc.w $0018
[000be43c]                           dc.w $0005
[000be43e]                           dc.w $0000
[000be440] 000bddb4                  dc.l USER_014
[000be444]                           dc.w $0004
[000be446]                           dc.w $0002
[000be448]                           dc.w $0003
[000be44a]                           dc.w $0001
_28aED_PICTURE:
[000be44c] 000279f6                  dc.l edpi_pattern
[000be450]                           dc.w $0000
[000be452]                           dc.w $0000
[000be454]                           dc.w $8000
[000be456]                           dc.w $0000
[000be458]                           dc.w $0003
[000be45a]                           dc.w $0500
[000be45c]                           dc.w $0000
[000be45e]                           dc.w $0000
[000be460]                           dc.w $0000
[000be462]                           dc.w $0000
_30_ED_PICTURE:
[000be464]                           dc.w $0020
[000be466]                           dc.w $ffff
[000be468]                           dc.w $ffff
[000be46a]                           dc.w $0018
[000be46c]                           dc.w $0005
[000be46e]                           dc.w $0000
[000be470] 000bddd4                  dc.l USER_015
[000be474]                           dc.w $0004
[000be476]                           dc.w $0003
[000be478]                           dc.w $0003
[000be47a]                           dc.w $0001
_30aED_PICTURE:
[000be47c] 000279f6                  dc.l edpi_pattern
[000be480]                           dc.w $0000
[000be482]                           dc.w $0000
[000be484]                           dc.w $8000
[000be486]                           dc.w $0000
[000be488]                           dc.w $0003
[000be48a]                           dc.w $0600
[000be48c]                           dc.w $0000
[000be48e]                           dc.w $0000
[000be490]                           dc.w $0000
[000be492]                           dc.w $0000
_32_ED_PICTURE:
[000be494]                           dc.w $0022
[000be496]                           dc.w $ffff
[000be498]                           dc.w $ffff
[000be49a]                           dc.w $0018
[000be49c]                           dc.w $0005
[000be49e]                           dc.w $0000
[000be4a0] 000bddf4                  dc.l USER_016
[000be4a4]                           dc.w $0007
[000be4a6]                           dc.w $0001
[000be4a8]                           dc.w $0003
[000be4aa]                           dc.w $0001
_32aED_PICTURE:
[000be4ac] 000279f6                  dc.l edpi_pattern
[000be4b0]                           dc.w $0000
[000be4b2]                           dc.w $0000
[000be4b4]                           dc.w $8000
[000be4b6]                           dc.w $0000
[000be4b8]                           dc.w $0003
[000be4ba]                           dc.w $0700
[000be4bc]                           dc.w $0000
[000be4be]                           dc.w $0000
[000be4c0]                           dc.w $0000
[000be4c2]                           dc.w $0000
_34_ED_PICTURE:
[000be4c4]                           dc.w $0024
[000be4c6]                           dc.w $ffff
[000be4c8]                           dc.w $ffff
[000be4ca]                           dc.w $0018
[000be4cc]                           dc.w $0005
[000be4ce]                           dc.w $0000
[000be4d0] 000bde14                  dc.l USER_017
[000be4d4]                           dc.w $0007
[000be4d6]                           dc.w $0002
[000be4d8]                           dc.w $0003
[000be4da]                           dc.w $0001
_34aED_PICTURE:
[000be4dc] 000279f6                  dc.l edpi_pattern
[000be4e0]                           dc.w $0000
[000be4e2]                           dc.w $0000
[000be4e4]                           dc.w $8000
[000be4e6]                           dc.w $0000
[000be4e8]                           dc.w $0003
[000be4ea]                           dc.w $0800
[000be4ec]                           dc.w $0000
[000be4ee]                           dc.w $0000
[000be4f0]                           dc.w $0000
[000be4f2]                           dc.w $0000
_36_ED_PICTURE:
[000be4f4]                           dc.w $0026
[000be4f6]                           dc.w $ffff
[000be4f8]                           dc.w $ffff
[000be4fa]                           dc.w $0018
[000be4fc]                           dc.w $0005
[000be4fe]                           dc.w $0000
[000be500] 000bde34                  dc.l USER_018
[000be504]                           dc.w $0007
[000be506]                           dc.w $0003
[000be508]                           dc.w $0003
[000be50a]                           dc.w $0001
_36aED_PICTURE:
[000be50c] 000279f6                  dc.l edpi_pattern
[000be510]                           dc.w $0000
[000be512]                           dc.w $0000
[000be514]                           dc.w $8000
[000be516]                           dc.w $0000
[000be518]                           dc.w $0003
[000be51a]                           dc.w $0900
[000be51c]                           dc.w $0000
[000be51e]                           dc.w $0000
[000be520]                           dc.w $0000
[000be522]                           dc.w $0000
_38_ED_PICTURE:
[000be524]                           dc.w $0028
[000be526]                           dc.w $ffff
[000be528]                           dc.w $ffff
[000be52a]                           dc.w $0018
[000be52c]                           dc.w $0005
[000be52e]                           dc.w $0000
[000be530] 000bde54                  dc.l USER_019
[000be534]                           dc.w $000a
[000be536]                           dc.w $0001
[000be538]                           dc.w $0003
[000be53a]                           dc.w $0001
_38aED_PICTURE:
[000be53c] 000279f6                  dc.l edpi_pattern
[000be540]                           dc.w $0000
[000be542]                           dc.w $0000
[000be544]                           dc.w $8000
[000be546]                           dc.w $0000
[000be548]                           dc.w $0003
[000be54a]                           dc.w $0a00
[000be54c]                           dc.w $0000
[000be54e]                           dc.w $0000
[000be550]                           dc.w $0000
[000be552]                           dc.w $0000
_40_ED_PICTURE:
[000be554]                           dc.w $002a
[000be556]                           dc.w $ffff
[000be558]                           dc.w $ffff
[000be55a]                           dc.w $0018
[000be55c]                           dc.w $0005
[000be55e]                           dc.w $0000
[000be560] 000bde74                  dc.l USER_020
[000be564]                           dc.w $000a
[000be566]                           dc.w $0002
[000be568]                           dc.w $0003
[000be56a]                           dc.w $0001
_40aED_PICTURE:
[000be56c] 000279f6                  dc.l edpi_pattern
[000be570]                           dc.w $0000
[000be572]                           dc.w $0000
[000be574]                           dc.w $8000
[000be576]                           dc.w $0000
[000be578]                           dc.w $0003
[000be57a]                           dc.w $0b00
[000be57c]                           dc.w $0000
[000be57e]                           dc.w $0000
[000be580]                           dc.w $0000
[000be582]                           dc.w $0000
_42_ED_PICTURE:
[000be584]                           dc.w $002c
[000be586]                           dc.w $ffff
[000be588]                           dc.w $ffff
[000be58a]                           dc.w $0018
[000be58c]                           dc.w $0005
[000be58e]                           dc.w $0000
[000be590] 000bde94                  dc.l USER_021
[000be594]                           dc.w $000a
[000be596]                           dc.w $0003
[000be598]                           dc.w $0003
[000be59a]                           dc.w $0001
_42aED_PICTURE:
[000be59c] 000279f6                  dc.l edpi_pattern
[000be5a0]                           dc.w $0000
[000be5a2]                           dc.w $0000
[000be5a4]                           dc.w $8000
[000be5a6]                           dc.w $0000
[000be5a8]                           dc.w $0003
[000be5aa]                           dc.w $0c00
[000be5ac]                           dc.w $0000
[000be5ae]                           dc.w $0000
[000be5b0]                           dc.w $0000
[000be5b2]                           dc.w $0000
_44_ED_PICTURE:
[000be5b4]                           dc.w $002e
[000be5b6]                           dc.w $ffff
[000be5b8]                           dc.w $ffff
[000be5ba]                           dc.w $0014
[000be5bc]                           dc.w $0005
[000be5be]                           dc.w $0000
[000be5c0]                           dc.w $0001
[000be5c2]                           dc.w $1101
[000be5c4]                           dc.w $000d
[000be5c6]                           dc.w $0001
[000be5c8]                           dc.w $0003
[000be5ca]                           dc.w $0001
_44aED_PICTURE:
[000be5cc] 000279f6                  dc.l edpi_pattern
[000be5d0]                           dc.w $0000
[000be5d2]                           dc.w $0000
[000be5d4]                           dc.w $8000
[000be5d6]                           dc.w $0000
[000be5d8]                           dc.w $0000
[000be5da]                           dc.w $0000
[000be5dc]                           dc.w $0000
[000be5de]                           dc.w $0000
[000be5e0]                           dc.w $0000
[000be5e2]                           dc.w $0000
_46_ED_PICTURE:
[000be5e4]                           dc.w $0030
[000be5e6]                           dc.w $ffff
[000be5e8]                           dc.w $ffff
[000be5ea]                           dc.w $0018
[000be5ec]                           dc.w $0005
[000be5ee]                           dc.w $0000
[000be5f0] 000bdeb4                  dc.l USER_022
[000be5f4]                           dc.w $000d
[000be5f6]                           dc.w $0002
[000be5f8]                           dc.w $0003
[000be5fa]                           dc.w $0001
_46aED_PICTURE:
[000be5fc] 000279f6                  dc.l edpi_pattern
[000be600]                           dc.w $0000
[000be602]                           dc.w $0000
[000be604]                           dc.w $8000
[000be606]                           dc.w $0000
[000be608]                           dc.w $0002
[000be60a]                           dc.w $0100
[000be60c]                           dc.w $0000
[000be60e]                           dc.w $0000
[000be610]                           dc.w $0000
[000be612]                           dc.w $0000
_48_ED_PICTURE:
[000be614]                           dc.w $0032
[000be616]                           dc.w $ffff
[000be618]                           dc.w $ffff
[000be61a]                           dc.w $0018
[000be61c]                           dc.w $0005
[000be61e]                           dc.w $0000
[000be620] 000bded4                  dc.l USER_023
[000be624]                           dc.w $000d
[000be626]                           dc.w $0003
[000be628]                           dc.w $0003
[000be62a]                           dc.w $0001
_48aED_PICTURE:
[000be62c] 000279f6                  dc.l edpi_pattern
[000be630]                           dc.w $0000
[000be632]                           dc.w $0000
[000be634]                           dc.w $8000
[000be636]                           dc.w $0000
[000be638]                           dc.w $0002
[000be63a]                           dc.w $0200
[000be63c]                           dc.w $0000
[000be63e]                           dc.w $0000
[000be640]                           dc.w $0000
[000be642]                           dc.w $0000
_50_ED_PICTURE:
[000be644]                           dc.w $0034
[000be646]                           dc.w $ffff
[000be648]                           dc.w $ffff
[000be64a]                           dc.w $0018
[000be64c]                           dc.w $0005
[000be64e]                           dc.w $0000
[000be650] 000bdef4                  dc.l USER_024
[000be654]                           dc.w $0010
[000be656]                           dc.w $0001
[000be658]                           dc.w $0003
[000be65a]                           dc.w $0001
_50aED_PICTURE:
[000be65c] 000279f6                  dc.l edpi_pattern
[000be660]                           dc.w $0000
[000be662]                           dc.w $0000
[000be664]                           dc.w $8000
[000be666]                           dc.w $0000
[000be668]                           dc.w $0002
[000be66a]                           dc.w $0300
[000be66c]                           dc.w $0000
[000be66e]                           dc.w $0000
[000be670]                           dc.w $0000
[000be672]                           dc.w $0000
_52_ED_PICTURE:
[000be674]                           dc.w $0036
[000be676]                           dc.w $ffff
[000be678]                           dc.w $ffff
[000be67a]                           dc.w $0018
[000be67c]                           dc.w $0005
[000be67e]                           dc.w $0000
[000be680] 000bdf14                  dc.l USER_025
[000be684]                           dc.w $0010
[000be686]                           dc.w $0002
[000be688]                           dc.w $0003
[000be68a]                           dc.w $0001
_52aED_PICTURE:
[000be68c] 000279f6                  dc.l edpi_pattern
[000be690]                           dc.w $0000
[000be692]                           dc.w $0000
[000be694]                           dc.w $8000
[000be696]                           dc.w $0000
[000be698]                           dc.w $0002
[000be69a]                           dc.w $0400
[000be69c]                           dc.w $0000
[000be69e]                           dc.w $0000
[000be6a0]                           dc.w $0000
[000be6a2]                           dc.w $0000
_54_ED_PICTURE:
[000be6a4]                           dc.w $0038
[000be6a6]                           dc.w $ffff
[000be6a8]                           dc.w $ffff
[000be6aa]                           dc.w $0018
[000be6ac]                           dc.w $0005
[000be6ae]                           dc.w $0000
[000be6b0] 000bdf34                  dc.l USER_026
[000be6b4]                           dc.w $0010
[000be6b6]                           dc.w $0003
[000be6b8]                           dc.w $0003
[000be6ba]                           dc.w $0001
_54aED_PICTURE:
[000be6bc] 000279f6                  dc.l edpi_pattern
[000be6c0]                           dc.w $0000
[000be6c2]                           dc.w $0000
[000be6c4]                           dc.w $8000
[000be6c6]                           dc.w $0000
[000be6c8]                           dc.w $0002
[000be6ca]                           dc.w $0500
[000be6cc]                           dc.w $0000
[000be6ce]                           dc.w $0000
[000be6d0]                           dc.w $0000
[000be6d2]                           dc.w $0000
_56_ED_PICTURE:
[000be6d4]                           dc.w $003a
[000be6d6]                           dc.w $ffff
[000be6d8]                           dc.w $ffff
[000be6da]                           dc.w $0018
[000be6dc]                           dc.w $0005
[000be6de]                           dc.w $0000
[000be6e0] 000bdf54                  dc.l USER_027
[000be6e4]                           dc.w $0013
[000be6e6]                           dc.w $0001
[000be6e8]                           dc.w $0003
[000be6ea]                           dc.w $0001
_56aED_PICTURE:
[000be6ec] 000279f6                  dc.l edpi_pattern
[000be6f0]                           dc.w $0000
[000be6f2]                           dc.w $0000
[000be6f4]                           dc.w $8000
[000be6f6]                           dc.w $0000
[000be6f8]                           dc.w $0002
[000be6fa]                           dc.w $0600
[000be6fc]                           dc.w $0000
[000be6fe]                           dc.w $0000
[000be700]                           dc.w $0000
[000be702]                           dc.w $0000
_58_ED_PICTURE:
[000be704]                           dc.w $003c
[000be706]                           dc.w $ffff
[000be708]                           dc.w $ffff
[000be70a]                           dc.w $0018
[000be70c]                           dc.w $0005
[000be70e]                           dc.w $0000
[000be710] 000bdf74                  dc.l USER_028
[000be714]                           dc.w $0013
[000be716]                           dc.w $0002
[000be718]                           dc.w $0003
[000be71a]                           dc.w $0001
_58aED_PICTURE:
[000be71c] 000279f6                  dc.l edpi_pattern
[000be720]                           dc.w $0000
[000be722]                           dc.w $0000
[000be724]                           dc.w $8000
[000be726]                           dc.w $0000
[000be728]                           dc.w $0002
[000be72a]                           dc.w $0700
[000be72c]                           dc.w $0000
[000be72e]                           dc.w $0000
[000be730]                           dc.w $0000
[000be732]                           dc.w $0000
_60_ED_PICTURE:
[000be734]                           dc.w $003e
[000be736]                           dc.w $ffff
[000be738]                           dc.w $ffff
[000be73a]                           dc.w $0018
[000be73c]                           dc.w $0005
[000be73e]                           dc.w $0000
[000be740] 000bdf94                  dc.l USER_029
[000be744]                           dc.w $0013
[000be746]                           dc.w $0003
[000be748]                           dc.w $0003
[000be74a]                           dc.w $0001
_60aED_PICTURE:
[000be74c] 000279f6                  dc.l edpi_pattern
[000be750]                           dc.w $0000
[000be752]                           dc.w $0000
[000be754]                           dc.w $8000
[000be756]                           dc.w $0000
[000be758]                           dc.w $0002
[000be75a]                           dc.w $0800
[000be75c]                           dc.w $0000
[000be75e]                           dc.w $0000
[000be760]                           dc.w $0000
[000be762]                           dc.w $0000
_62_ED_PICTURE:
[000be764]                           dc.w $0040
[000be766]                           dc.w $ffff
[000be768]                           dc.w $ffff
[000be76a]                           dc.w $0018
[000be76c]                           dc.w $0005
[000be76e]                           dc.w $0000
[000be770] 000bdfb4                  dc.l USER_030
[000be774]                           dc.w $0016
[000be776]                           dc.w $0001
[000be778]                           dc.w $0003
[000be77a]                           dc.w $0001
_62aED_PICTURE:
[000be77c] 000279f6                  dc.l edpi_pattern
[000be780]                           dc.w $0000
[000be782]                           dc.w $0000
[000be784]                           dc.w $8000
[000be786]                           dc.w $0000
[000be788]                           dc.w $0002
[000be78a]                           dc.w $0900
[000be78c]                           dc.w $0000
[000be78e]                           dc.w $0000
[000be790]                           dc.w $0000
[000be792]                           dc.w $0000
_64_ED_PICTURE:
[000be794]                           dc.w $0042
[000be796]                           dc.w $ffff
[000be798]                           dc.w $ffff
[000be79a]                           dc.w $0018
[000be79c]                           dc.w $0005
[000be79e]                           dc.w $0000
[000be7a0] 000bdff4                  dc.l USER_032
[000be7a4]                           dc.w $0016
[000be7a6]                           dc.w $0002
[000be7a8]                           dc.w $0003
[000be7aa]                           dc.w $0001
_64aED_PICTURE:
[000be7ac] 000279f6                  dc.l edpi_pattern
[000be7b0]                           dc.w $0000
[000be7b2]                           dc.w $0000
[000be7b4]                           dc.w $8000
[000be7b6]                           dc.w $0000
[000be7b8]                           dc.w $0002
[000be7ba]                           dc.w $0a00
[000be7bc]                           dc.w $0000
[000be7be]                           dc.w $0000
[000be7c0]                           dc.w $0000
[000be7c2]                           dc.w $0000
_66_ED_PICTURE:
[000be7c4]                           dc.w $0044
[000be7c6]                           dc.w $ffff
[000be7c8]                           dc.w $ffff
[000be7ca]                           dc.w $0018
[000be7cc]                           dc.w $0005
[000be7ce]                           dc.w $0000
[000be7d0] 000bdfd4                  dc.l USER_031
[000be7d4]                           dc.w $0016
[000be7d6]                           dc.w $0003
[000be7d8]                           dc.w $0003
[000be7da]                           dc.w $0001
_66aED_PICTURE:
[000be7dc] 000279f6                  dc.l edpi_pattern
[000be7e0]                           dc.w $0000
[000be7e2]                           dc.w $0000
[000be7e4]                           dc.w $8000
[000be7e6]                           dc.w $0000
[000be7e8]                           dc.w $0002
[000be7ea]                           dc.w $0b00
[000be7ec]                           dc.w $0000
[000be7ee]                           dc.w $0000
[000be7f0]                           dc.w $0000
[000be7f2]                           dc.w $0000
_68_ED_PICTURE:
[000be7f4]                           dc.w $0046
[000be7f6]                           dc.w $ffff
[000be7f8]                           dc.w $ffff
[000be7fa]                           dc.w $0018
[000be7fc]                           dc.w $0005
[000be7fe]                           dc.w $0000
[000be800] 000be014                  dc.l USER_033
[000be804]                           dc.w $0019
[000be806]                           dc.w $0001
[000be808]                           dc.w $0003
[000be80a]                           dc.w $0001
_68aED_PICTURE:
[000be80c] 000279f6                  dc.l edpi_pattern
[000be810]                           dc.w $0000
[000be812]                           dc.w $0000
[000be814]                           dc.w $8000
[000be816]                           dc.w $0000
[000be818]                           dc.w $0002
[000be81a]                           dc.w $0c00
[000be81c]                           dc.w $0000
[000be81e]                           dc.w $0000
[000be820]                           dc.w $0000
[000be822]                           dc.w $0000
_70_ED_PICTURE:
[000be824]                           dc.w $0048
[000be826]                           dc.w $ffff
[000be828]                           dc.w $ffff
[000be82a]                           dc.w $0018
[000be82c]                           dc.w $0005
[000be82e]                           dc.w $0000
[000be830] 000be034                  dc.l USER_034
[000be834]                           dc.w $0019
[000be836]                           dc.w $0002
[000be838]                           dc.w $0003
[000be83a]                           dc.w $0001
_70aED_PICTURE:
[000be83c] 000279f6                  dc.l edpi_pattern
[000be840]                           dc.w $0000
[000be842]                           dc.w $0000
[000be844]                           dc.w $8000
[000be846]                           dc.w $0000
[000be848]                           dc.w $0002
[000be84a]                           dc.w $0d00
[000be84c]                           dc.w $0000
[000be84e]                           dc.w $0000
[000be850]                           dc.w $0000
[000be852]                           dc.w $0000
_72_ED_PICTURE:
[000be854]                           dc.w $004a
[000be856]                           dc.w $ffff
[000be858]                           dc.w $ffff
[000be85a]                           dc.w $0018
[000be85c]                           dc.w $0005
[000be85e]                           dc.w $0000
[000be860] 000be054                  dc.l USER_035
[000be864]                           dc.w $0019
[000be866]                           dc.w $0003
[000be868]                           dc.w $0003
[000be86a]                           dc.w $0001
_72aED_PICTURE:
[000be86c] 000279f6                  dc.l edpi_pattern
[000be870]                           dc.w $0000
[000be872]                           dc.w $0000
[000be874]                           dc.w $8000
[000be876]                           dc.w $0000
[000be878]                           dc.w $0002
[000be87a]                           dc.w $0e00
[000be87c]                           dc.w $0000
[000be87e]                           dc.w $0000
[000be880]                           dc.w $0000
[000be882]                           dc.w $0000
_74_ED_PICTURE:
[000be884]                           dc.w $004c
[000be886]                           dc.w $ffff
[000be888]                           dc.w $ffff
[000be88a]                           dc.w $0018
[000be88c]                           dc.w $0005
[000be88e]                           dc.w $0000
[000be890] 000be074                  dc.l USER_036
[000be894]                           dc.w $001c
[000be896]                           dc.w $0001
[000be898]                           dc.w $0003
[000be89a]                           dc.w $0001
_74aED_PICTURE:
[000be89c] 000279f6                  dc.l edpi_pattern
[000be8a0]                           dc.w $0000
[000be8a2]                           dc.w $0000
[000be8a4]                           dc.w $8000
[000be8a6]                           dc.w $0000
[000be8a8]                           dc.w $0002
[000be8aa]                           dc.w $0f00
[000be8ac]                           dc.w $0000
[000be8ae]                           dc.w $0000
[000be8b0]                           dc.w $0000
[000be8b2]                           dc.w $0000
_76_ED_PICTURE:
[000be8b4]                           dc.w $004e
[000be8b6]                           dc.w $ffff
[000be8b8]                           dc.w $ffff
[000be8ba]                           dc.w $0018
[000be8bc]                           dc.w $0005
[000be8be]                           dc.w $0000
[000be8c0] 000be094                  dc.l USER_037
[000be8c4]                           dc.w $001c
[000be8c6]                           dc.w $0002
[000be8c8]                           dc.w $0003
[000be8ca]                           dc.w $0001
_76aED_PICTURE:
[000be8cc] 000279f6                  dc.l edpi_pattern
[000be8d0]                           dc.w $0000
[000be8d2]                           dc.w $0000
[000be8d4]                           dc.w $8000
[000be8d6]                           dc.w $0000
[000be8d8]                           dc.w $0002
[000be8da]                           dc.w $1000
[000be8dc]                           dc.w $0000
[000be8de]                           dc.w $0000
[000be8e0]                           dc.w $0000
[000be8e2]                           dc.w $0000
_78_ED_PICTURE:
[000be8e4]                           dc.w $0050
[000be8e6]                           dc.w $ffff
[000be8e8]                           dc.w $ffff
[000be8ea]                           dc.w $0018
[000be8ec]                           dc.w $0005
[000be8ee]                           dc.w $0000
[000be8f0] 000be0b4                  dc.l USER_038
[000be8f4]                           dc.w $001c
[000be8f6]                           dc.w $0003
[000be8f8]                           dc.w $0003
[000be8fa]                           dc.w $0001
_78aED_PICTURE:
[000be8fc] 000279f6                  dc.l edpi_pattern
[000be900]                           dc.w $0000
[000be902]                           dc.w $0000
[000be904]                           dc.w $8000
[000be906]                           dc.w $0000
[000be908]                           dc.w $0002
[000be90a]                           dc.w $1100
[000be90c]                           dc.w $0000
[000be90e]                           dc.w $0000
[000be910]                           dc.w $0000
[000be912]                           dc.w $0000
_80_ED_PICTURE:
[000be914]                           dc.w $0052
[000be916]                           dc.w $ffff
[000be918]                           dc.w $ffff
[000be91a]                           dc.w $0018
[000be91c]                           dc.w $0005
[000be91e]                           dc.w $0000
[000be920] 000be0d4                  dc.l USER_039
[000be924]                           dc.w $001f
[000be926]                           dc.w $0001
[000be928]                           dc.w $0003
[000be92a]                           dc.w $0001
_80aED_PICTURE:
[000be92c] 000279f6                  dc.l edpi_pattern
[000be930]                           dc.w $0000
[000be932]                           dc.w $0000
[000be934]                           dc.w $8000
[000be936]                           dc.w $0000
[000be938]                           dc.w $0002
[000be93a]                           dc.w $1200
[000be93c]                           dc.w $0000
[000be93e]                           dc.w $0000
[000be940]                           dc.w $0000
[000be942]                           dc.w $0000
_82_ED_PICTURE:
[000be944]                           dc.w $0054
[000be946]                           dc.w $ffff
[000be948]                           dc.w $ffff
[000be94a]                           dc.w $0018
[000be94c]                           dc.w $0005
[000be94e]                           dc.w $0000
[000be950] 000be0f4                  dc.l USER_040
[000be954]                           dc.w $001f
[000be956]                           dc.w $0002
[000be958]                           dc.w $0003
[000be95a]                           dc.w $0001
_82aED_PICTURE:
[000be95c] 000279f6                  dc.l edpi_pattern
[000be960]                           dc.w $0000
[000be962]                           dc.w $0000
[000be964]                           dc.w $8000
[000be966]                           dc.w $0000
[000be968]                           dc.w $0002
[000be96a]                           dc.w $1300
[000be96c]                           dc.w $0000
[000be96e]                           dc.w $0000
[000be970]                           dc.w $0000
[000be972]                           dc.w $0000
_84_ED_PICTURE:
[000be974]                           dc.w $0056
[000be976]                           dc.w $ffff
[000be978]                           dc.w $ffff
[000be97a]                           dc.w $0018
[000be97c]                           dc.w $0005
[000be97e]                           dc.w $0000
[000be980] 000be114                  dc.l USER_041
[000be984]                           dc.w $001f
[000be986]                           dc.w $0003
[000be988]                           dc.w $0003
[000be98a]                           dc.w $0001
_84aED_PICTURE:
[000be98c] 000279f6                  dc.l edpi_pattern
[000be990]                           dc.w $0000
[000be992]                           dc.w $0000
[000be994]                           dc.w $8000
[000be996]                           dc.w $0000
[000be998]                           dc.w $0002
[000be99a]                           dc.w $1400
[000be99c]                           dc.w $0000
[000be99e]                           dc.w $0000
[000be9a0]                           dc.w $0000
[000be9a2]                           dc.w $0000
_86_ED_PICTURE:
[000be9a4]                           dc.w $0058
[000be9a6]                           dc.w $ffff
[000be9a8]                           dc.w $ffff
[000be9aa]                           dc.w $0018
[000be9ac]                           dc.w $0005
[000be9ae]                           dc.w $0000
[000be9b0] 000be134                  dc.l USER_042
[000be9b4]                           dc.w $0022
[000be9b6]                           dc.w $0001
[000be9b8]                           dc.w $0003
[000be9ba]                           dc.w $0001
_86aED_PICTURE:
[000be9bc] 000279f6                  dc.l edpi_pattern
[000be9c0]                           dc.w $0000
[000be9c2]                           dc.w $0000
[000be9c4]                           dc.w $8000
[000be9c6]                           dc.w $0000
[000be9c8]                           dc.w $0002
[000be9ca]                           dc.w $1500
[000be9cc]                           dc.w $0000
[000be9ce]                           dc.w $0000
[000be9d0]                           dc.w $0000
[000be9d2]                           dc.w $0000
_88_ED_PICTURE:
[000be9d4]                           dc.w $005a
[000be9d6]                           dc.w $ffff
[000be9d8]                           dc.w $ffff
[000be9da]                           dc.w $0018
[000be9dc]                           dc.w $0005
[000be9de]                           dc.w $0000
[000be9e0] 000be154                  dc.l USER_043
[000be9e4]                           dc.w $0022
[000be9e6]                           dc.w $0002
[000be9e8]                           dc.w $0003
[000be9ea]                           dc.w $0001
_88aED_PICTURE:
[000be9ec] 000279f6                  dc.l edpi_pattern
[000be9f0]                           dc.w $0000
[000be9f2]                           dc.w $0000
[000be9f4]                           dc.w $8000
[000be9f6]                           dc.w $0000
[000be9f8]                           dc.w $0002
[000be9fa]                           dc.w $1600
[000be9fc]                           dc.w $0000
[000be9fe]                           dc.w $0000
[000bea00]                           dc.w $0000
[000bea02]                           dc.w $0000
_90_ED_PICTURE:
[000bea04]                           dc.w $0013
[000bea06]                           dc.w $ffff
[000bea08]                           dc.w $ffff
[000bea0a]                           dc.w $0018
[000bea0c]                           dc.w $0005
[000bea0e]                           dc.w $0000
[000bea10] 000be174                  dc.l USER_044
[000bea14]                           dc.w $0022
[000bea16]                           dc.w $0003
[000bea18]                           dc.w $0003
[000bea1a]                           dc.w $0001
_90aED_PICTURE:
[000bea1c] 000279f6                  dc.l edpi_pattern
[000bea20]                           dc.w $0000
[000bea22]                           dc.w $0000
[000bea24]                           dc.w $8020
[000bea26]                           dc.w $0000
[000bea28]                           dc.w $0002
[000bea2a]                           dc.w $1700
[000bea2c]                           dc.w $0000
[000bea2e]                           dc.w $0000
[000bea30]                           dc.w $0000
[000bea32]                           dc.w $0000
picture:
[000bea34] 00067ece                  dc.l A_picture
[000bea38]                           dc.w $0000
[000bea3a]                           dc.w $0000
[000bea3c] 0006863e                  dc.l Auo_picture
[000bea40] 000bdaf8                  dc.l PICDATA
[000bea44]                           dc.w $0000
[000bea46]                           dc.w $0000
[000bea48]                           dc.w $0000
[000bea4a]                           dc.w $0000
[000bea4c]                           dc.w $0000
[000bea4e]                           dc.w $0000
[000bea50]                           dc.w $0000
[000bea52]                           dc.w $0000
visual:
[000bea54]                           dc.w $ffff
[000bea56]                           dc.w $ffff
[000bea58]                           dc.w $ffff
[000bea5a]                           dc.w $0018
[000bea5c]                           dc.w $0000
[000bea5e]                           dc.w $0000
[000bea60] 000bea34                  dc.l picture
[000bea64]                           dc.w $0000
[000bea66]                           dc.w $0000
[000bea68]                           dc.w $0006
[000bea6a]                           dc.w $0002
logical:
[000bea6c]                           dc.w $ffff
[000bea6e]                           dc.w $ffff
[000bea70]                           dc.w $ffff
[000bea72]                           dc.w $0018
[000bea74]                           dc.w $0040
[000bea76]                           dc.w $0000
[000bea78]                           dc.w $0000
[000bea7a]                           dc.w $0000
[000bea7c]                           dc.w $0000
[000bea7e]                           dc.w $0000
[000bea80]                           dc.w $0006
[000bea82]                           dc.w $0002
aud:
[000bea84] 000beb02                  dc.l $000beb02
[000bea88] 000beb07                  dc.l $000beb07
[000bea8c]                           dc.w $0003
[000bea8e] 000bdaf8                  dc.l PICDATA
[000bea92]                           dc.w $0000
[000bea94]                           dc.w $00dc
[000bea96]                           dc.w $0000
[000bea98]                           dc.w $0000
[000bea9a]                           dc.w $0000
[000bea9c]                           dc.w $0000
[000bea9e]                           dc.w $0000
[000beaa0]                           dc.w $0000
[000beaa2]                           dc.w $0000
[000beaa4]                           dc.w $0000
[000beaa6]                           dc.w $0000
[000beaa8]                           dc.w $0000
[000beaaa]                           dc.w $0000
[000beaac]                           dc.w $0000
[000beaae]                           dc.w $0000
[000beab0]                           dc.w $0000
data:
[000beab2]                           dc.b 'A_picture',0
[000beabc]                           dc.w $0000
[000beabe]                           dc.w $0000
[000beac0]                           dc.w $0000
[000beac2]                           dc.w $0000
[000beac4]                           dc.w $0000
[000beac6]                           dc.w $0000
[000beac8]                           dc.w $0000
[000beaca]                           dc.w $0000
[000beacc]                           dc.w $0000
[000beace]                           dc.w $0000
[000bead0]                           dc.w $0000
[000bead2] 00027ad0                  dc.l object_tree
[000bead6] 00027bb6                  dc.l test_it
[000beada] 00027c12                  dc.l ok
[000beade] 0004f20a                  dc.l Aob_delete
[000beae2] 000bea54                  dc.l visual
[000beae6] 000bea6c                  dc.l logical
[000beaea] 000bea84                  dc.l aud
[000beaee] 00027aa0                  dc.l minsize
[000beaf2]                           dc.w $0000
[000beaf4]                           dc.w $0000
[000beaf6] 000bd7d0                  dc.l title
[000beafa] 000bd7bd                  dc.l help_title
[000beafe]                           dc.w $0000
[000beb00]                           dc.w $0000
[000beb02]                           dc.b '0x0L',0
[000beb07]                           dc.b 'Auo_picture',0
[000beb13]                           dc.b '0x%lxL',0
