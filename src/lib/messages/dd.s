Aev_InitDD:
[0005fe5c] 7001                      moveq.l    #1,d0
[0005fe5e] 4e75                      rts
Aev_ExitDD:
[0005fe60] 7001                      moveq.l    #1,d0
[0005fe62] 4e75                      rts
Aev_ddabort:
[0005fe64] 5d4f                      subq.w     #6,a7
[0005fe66] 3f40 0004                 move.w     d0,4(a7)
[0005fe6a] 2e81                      move.l     d1,(a7)
[0005fe6c] 2057                      movea.l    (a7),a0
[0005fe6e] 700d                      moveq.l    #13,d0
[0005fe70] 4eb9 0008 0e00            jsr        Psignal
[0005fe76] 302f 0004                 move.w     4(a7),d0
[0005fe7a] 4eb9 0008 0c7e            jsr        Fclose
[0005fe80] 7001                      moveq.l    #1,d0
[0005fe82] 4eb9 0005 ae7e            jsr        Awi_update
[0005fe88] 4240                      clr.w      d0
[0005fe8a] 5c4f                      addq.w     #6,a7
[0005fe8c] 4e75                      rts
Aev_GetAPDragDrop:
[0005fe8e] 2f0a                      move.l     a2,-(a7)
[0005fe90] 4fef ffac                 lea.l      -84(a7),a7
[0005fe94] 2f48 0050                 move.l     a0,80(a7)
[0005fe98] 41f9 000e 1a2a            lea.l      $000E1A2A,a0
[0005fe9e] 43ef 003c                 lea.l      60(a7),a1
[0005fea2] 7013                      moveq.l    #19,d0
[0005fea4] 12d8                      move.b     (a0)+,(a1)+
[0005fea6] 51c8 fffc                 dbf        d0,$0005FEA4
[0005feaa] 41f9 000e 1a3e            lea.l      $000E1A3E,a0
[0005feb0] 43ef 0014                 lea.l      20(a7),a1
[0005feb4] 12d8                      move.b     (a0)+,(a1)+
[0005feb6] 12d8                      move.b     (a0)+,(a1)+
[0005feb8] 12d8                      move.b     (a0)+,(a1)+
[0005feba] 12d8                      move.b     (a0)+,(a1)+
[0005febc] 12d8                      move.b     (a0)+,(a1)+
[0005febe] 206f 0050                 movea.l    80(a7),a0
[0005fec2] 2050                      movea.l    (a0),a0
[0005fec4] 1f68 000f 004e            move.b     15(a0),78(a7)
[0005feca] 206f 0050                 movea.l    80(a7),a0
[0005fece] 2050                      movea.l    (a0),a0
[0005fed0] 3028 000e                 move.w     14(a0),d0
[0005fed4] e040                      asr.w      #8,d0
[0005fed6] 1f40 004d                 move.b     d0,77(a7)
[0005feda] 7002                      moveq.l    #2,d0
[0005fedc] 41ef 003c                 lea.l      60(a7),a0
[0005fee0] 4eb9 0008 0cc0            jsr        Fopen
[0005fee6] 2f40 0008                 move.l     d0,8(a7)
[0005feea] 202f 0008                 move.l     8(a7),d0
[0005feee] 6a06                      bpl.s      $0005FEF6
[0005fef0] 4240                      clr.w      d0
[0005fef2] 6000 0366                 bra        $0006025A
[0005fef6] 3f6f 000a 000e            move.w     10(a7),14(a7)
[0005fefc] 4240                      clr.w      d0
[0005fefe] 4eb9 0005 ae7e            jsr        Awi_update
[0005ff04] 207c 0000 0001            movea.l    #$00000001,a0
[0005ff0a] 700d                      moveq.l    #13,d0
[0005ff0c] 4eb9 0008 0e00            jsr        Psignal
[0005ff12] 2f40 0004                 move.l     d0,4(a7)
[0005ff16] 7221                      moveq.l    #33,d1
[0005ff18] 4240                      clr.w      d0
[0005ff1a] 41ef 001a                 lea.l      26(a7),a0
[0005ff1e] 4eb9 0008 36ea            jsr        memset
[0005ff24] 43f9 000e 1a58            lea.l      $000E1A58,a1
[0005ff2a] 41ef 001b                 lea.l      27(a7),a0
[0005ff2e] 4eb9 0008 2f0c            jsr        strcpy
[0005ff34] 41ef 001a                 lea.l      26(a7),a0
[0005ff38] 7221                      moveq.l    #33,d1
[0005ff3a] 302f 000e                 move.w     14(a7),d0
[0005ff3e] 4eb9 0008 0d5e            jsr        Fwrite
[0005ff44] 7221                      moveq.l    #33,d1
[0005ff46] b280                      cmp.l      d0,d1
[0005ff48] 6710                      beq.s      $0005FF5A
[0005ff4a] 222f 0004                 move.l     4(a7),d1
[0005ff4e] 302f 000e                 move.w     14(a7),d0
[0005ff52] 6100 ff10                 bsr        Aev_ddabort
[0005ff56] 6000 0302                 bra        $0006025A
[0005ff5a] 2079 000e 692a            movea.l    _globl,a0
[0005ff60] 7032                      moveq.l    #50,d0
[0005ff62] 4eb9 0007 91d4            jsr        mt_evnt_timer
[0005ff68] 41ef 000c                 lea.l      12(a7),a0
[0005ff6c] 7202                      moveq.l    #2,d1
[0005ff6e] 302f 000e                 move.w     14(a7),d0
[0005ff72] 4eb9 0008 0cd2            jsr        Fread
[0005ff78] 7202                      moveq.l    #2,d1
[0005ff7a] b280                      cmp.l      d0,d1
[0005ff7c] 6608                      bne.s      $0005FF86
[0005ff7e] 0c6f 0008 000c            cmpi.w     #$0008,12(a7)
[0005ff84] 6c10                      bge.s      $0005FF96
[0005ff86] 222f 0004                 move.l     4(a7),d1
[0005ff8a] 302f 000e                 move.w     14(a7),d0
[0005ff8e] 6100 fed4                 bsr        Aev_ddabort
[0005ff92] 6000 02c6                 bra        $0006025A
[0005ff96] 41ef 0014                 lea.l      20(a7),a0
[0005ff9a] 7204                      moveq.l    #4,d1
[0005ff9c] 302f 000e                 move.w     14(a7),d0
[0005ffa0] 4eb9 0008 0cd2            jsr        Fread
[0005ffa6] 7204                      moveq.l    #4,d1
[0005ffa8] b280                      cmp.l      d0,d1
[0005ffaa] 6710                      beq.s      $0005FFBC
[0005ffac] 222f 0004                 move.l     4(a7),d1
[0005ffb0] 302f 000e                 move.w     14(a7),d0
[0005ffb4] 6100 feae                 bsr        Aev_ddabort
[0005ffb8] 6000 02a0                 bra        $0006025A
[0005ffbc] 422f 0018                 clr.b      24(a7)
[0005ffc0] 41ef 0014                 lea.l      20(a7),a0
[0005ffc4] 4eb9 0004 64da            jsr        Ast_toupper
[0005ffca] 596f 000c                 subq.w     #4,12(a7)
[0005ffce] 7004                      moveq.l    #4,d0
[0005ffd0] 43f9 000e 1a61            lea.l      $000E1A61,a1
[0005ffd6] 41ef 0014                 lea.l      20(a7),a0
[0005ffda] 4eb9 0008 2fb8            jsr        strncmp
[0005ffe0] 4a40                      tst.w      d0
[0005ffe2] 664a                      bne.s      $0006002E
[0005ffe4] 6004                      bra.s      $0005FFEA
[0005ffe6] 536f 000c                 subq.w     #1,12(a7)
[0005ffea] 302f 000c                 move.w     12(a7),d0
[0005ffee] 6f16                      ble.s      $00060006
[0005fff0] 41ef 001a                 lea.l      26(a7),a0
[0005fff4] 7201                      moveq.l    #1,d1
[0005fff6] 302f 000e                 move.w     14(a7),d0
[0005fffa] 4eb9 0008 0cd2            jsr        Fread
[00060000] 7201                      moveq.l    #1,d1
[00060002] b280                      cmp.l      d0,d1
[00060004] 67e0                      beq.s      $0005FFE6
[00060006] 1f7c 0001 001a            move.b     #$01,26(a7)
[0006000c] 41ef 001a                 lea.l      26(a7),a0
[00060010] 7201                      moveq.l    #1,d1
[00060012] 302f 000e                 move.w     14(a7),d0
[00060016] 4eb9 0008 0d5e            jsr        Fwrite
[0006001c] 222f 0004                 move.l     4(a7),d1
[00060020] 302f 000e                 move.w     14(a7),d0
[00060024] 6100 fe3e                 bsr        Aev_ddabort
[00060028] 7001                      moveq.l    #1,d0
[0006002a] 6000 022e                 bra        $0006025A
[0006002e] 41d7                      lea.l      (a7),a0
[00060030] 7204                      moveq.l    #4,d1
[00060032] 302f 000e                 move.w     14(a7),d0
[00060036] 4eb9 0008 0cd2            jsr        Fread
[0006003c] 7204                      moveq.l    #4,d1
[0006003e] b280                      cmp.l      d0,d1
[00060040] 6710                      beq.s      $00060052
[00060042] 222f 0004                 move.l     4(a7),d1
[00060046] 302f 000e                 move.w     14(a7),d0
[0006004a] 6100 fe18                 bsr        Aev_ddabort
[0006004e] 6000 020a                 bra        $0006025A
[00060052] 596f 000c                 subq.w     #4,12(a7)
[00060056] 602a                      bra.s      $00060082
[00060058] 41ef 001a                 lea.l      26(a7),a0
[0006005c] 7201                      moveq.l    #1,d1
[0006005e] 302f 000e                 move.w     14(a7),d0
[00060062] 4eb9 0008 0cd2            jsr        Fread
[00060068] 7201                      moveq.l    #1,d1
[0006006a] b280                      cmp.l      d0,d1
[0006006c] 6710                      beq.s      $0006007E
[0006006e] 222f 0004                 move.l     4(a7),d1
[00060072] 302f 000e                 move.w     14(a7),d0
[00060076] 6100 fdec                 bsr        Aev_ddabort
[0006007a] 6000 01de                 bra        $0006025A
[0006007e] 536f 000c                 subq.w     #1,12(a7)
[00060082] 302f 000c                 move.w     12(a7),d0
[00060086] 6ed0                      bgt.s      $00060058
[00060088] 7001                      moveq.l    #1,d0
[0006008a] d097                      add.l      (a7),d0
[0006008c] 4eb9 0004 c608            jsr        Ax_malloc
[00060092] 2f48 0010                 move.l     a0,16(a7)
[00060096] 202f 0010                 move.l     16(a7),d0
[0006009a] 6626                      bne.s      $000600C2
[0006009c] 1f7c 0001 001a            move.b     #$01,26(a7)
[000600a2] 41ef 001a                 lea.l      26(a7),a0
[000600a6] 7201                      moveq.l    #1,d1
[000600a8] 302f 000e                 move.w     14(a7),d0
[000600ac] 4eb9 0008 0d5e            jsr        Fwrite
[000600b2] 222f 0004                 move.l     4(a7),d1
[000600b6] 302f 000e                 move.w     14(a7),d0
[000600ba] 6100 fda8                 bsr        Aev_ddabort
[000600be] 6000 019a                 bra        $0006025A
[000600c2] 422f 001a                 clr.b      26(a7)
[000600c6] 41ef 001a                 lea.l      26(a7),a0
[000600ca] 7201                      moveq.l    #1,d1
[000600cc] 302f 000e                 move.w     14(a7),d0
[000600d0] 4eb9 0008 0d5e            jsr        Fwrite
[000600d6] 7201                      moveq.l    #1,d1
[000600d8] b280                      cmp.l      d0,d1
[000600da] 6710                      beq.s      $000600EC
[000600dc] 222f 0004                 move.l     4(a7),d1
[000600e0] 302f 000e                 move.w     14(a7),d0
[000600e4] 6100 fd7e                 bsr        Aev_ddabort
[000600e8] 6000 0170                 bra        $0006025A
[000600ec] 2079 000e 692a            movea.l    _globl,a0
[000600f2] 7064                      moveq.l    #100,d0
[000600f4] 4eb9 0007 91d4            jsr        mt_evnt_timer
[000600fa] 206f 0010                 movea.l    16(a7),a0
[000600fe] 2217                      move.l     (a7),d1
[00060100] 302f 000e                 move.w     14(a7),d0
[00060104] 4eb9 0008 0cd2            jsr        Fread
[0006010a] b097                      cmp.l      (a7),d0
[0006010c] 671a                      beq.s      $00060128
[0006010e] 206f 0010                 movea.l    16(a7),a0
[00060112] 4eb9 0004 c7c8            jsr        Ax_free
[00060118] 222f 0004                 move.l     4(a7),d1
[0006011c] 302f 000e                 move.w     14(a7),d0
[00060120] 6100 fd42                 bsr        Aev_ddabort
[00060124] 6000 0134                 bra        $0006025A
[00060128] 222f 0004                 move.l     4(a7),d1
[0006012c] 302f 000e                 move.w     14(a7),d0
[00060130] 6100 fd32                 bsr        Aev_ddabort
[00060134] 2017                      move.l     (a7),d0
[00060136] 206f 0010                 movea.l    16(a7),a0
[0006013a] 4230 0800                 clr.b      0(a0,d0.l)
[0006013e] 7004                      moveq.l    #4,d0
[00060140] 43f9 000e 1a66            lea.l      $000E1A66,a1
[00060146] 41ef 0014                 lea.l      20(a7),a0
[0006014a] 4eb9 0008 2fb8            jsr        strncmp
[00060150] 4a40                      tst.w      d0
[00060152] 663c                      bne.s      $00060190
[00060154] 206f 0050                 movea.l    80(a7),a0
[00060158] 2f28 0014                 move.l     20(a0),-(a7)
[0006015c] 206f 0054                 movea.l    84(a7),a0
[00060160] 2f28 0010                 move.l     16(a0),-(a7)
[00060164] 206f 0058                 movea.l    88(a7),a0
[00060168] 3028 0018                 move.w     24(a0),d0
[0006016c] 206f 0058                 movea.l    88(a7),a0
[00060170] 2268 000c                 movea.l    12(a0),a1
[00060174] 206f 0018                 movea.l    24(a7),a0
[00060178] 4eb9 0005 e25c            jsr        GetImgIntoObj
[0006017e] 504f                      addq.w     #8,a7
[00060180] 206f 0010                 movea.l    16(a7),a0
[00060184] 4eb9 0004 c7c8            jsr        Ax_free
[0006018a] 7001                      moveq.l    #1,d0
[0006018c] 6000 00cc                 bra        $0006025A
[00060190] 7004                      moveq.l    #4,d0
[00060192] 43f9 000e 1a6b            lea.l      $000E1A6B,a1
[00060198] 41ef 0014                 lea.l      20(a7),a0
[0006019c] 4eb9 0008 2fb8            jsr        strncmp
[000601a2] 4a40                      tst.w      d0
[000601a4] 6716                      beq.s      $000601BC
[000601a6] 7004                      moveq.l    #4,d0
[000601a8] 43f9 000e 1a70            lea.l      $000E1A70,a1
[000601ae] 41ef 0014                 lea.l      20(a7),a0
[000601b2] 4eb9 0008 2fb8            jsr        strncmp
[000601b8] 4a40                      tst.w      d0
[000601ba] 6648                      bne.s      $00060204
[000601bc] 206f 0050                 movea.l    80(a7),a0
[000601c0] 2f28 0014                 move.l     20(a0),-(a7)
[000601c4] 206f 0054                 movea.l    84(a7),a0
[000601c8] 2f28 0010                 move.l     16(a0),-(a7)
[000601cc] 206f 0058                 movea.l    88(a7),a0
[000601d0] 2f28 000c                 move.l     12(a0),-(a7)
[000601d4] 206f 005c                 movea.l    92(a7),a0
[000601d8] 3228 001a                 move.w     26(a0),d1
[000601dc] 206f 005c                 movea.l    92(a7),a0
[000601e0] 3028 0018                 move.w     24(a0),d0
[000601e4] 43ef 0020                 lea.l      32(a7),a1
[000601e8] 206f 001c                 movea.l    28(a7),a0
[000601ec] 4eb9 0005 e2d0            jsr        GetTxtIntoObj
[000601f2] 4fef 000c                 lea.l      12(a7),a7
[000601f6] 206f 0010                 movea.l    16(a7),a0
[000601fa] 4eb9 0004 c7c8            jsr        Ax_free
[00060200] 7001                      moveq.l    #1,d0
[00060202] 6056                      bra.s      $0006025A
[00060204] 0c2f 002e 0014            cmpi.b     #$2E,20(a7)
[0006020a] 6710                      beq.s      $0006021C
[0006020c] 43f9 000e 1a75            lea.l      $000E1A75,a1
[00060212] 41ef 0014                 lea.l      20(a7),a0
[00060216] 4eb9 0008 2f0c            jsr        strcpy
[0006021c] 4241                      clr.w      d1
[0006021e] 2017                      move.l     (a7),d0
[00060220] 226f 0010                 movea.l    16(a7),a1
[00060224] 41ef 0015                 lea.l      21(a7),a0
[00060228] 4eb9 0006 cc22            jsr        Ascrp_put
[0006022e] 43ef 0015                 lea.l      21(a7),a1
[00060232] 701d                      moveq.l    #29,d0
[00060234] 206f 0050                 movea.l    80(a7),a0
[00060238] 2068 000c                 movea.l    12(a0),a0
[0006023c] 246f 0050                 movea.l    80(a7),a2
[00060240] 246a 000c                 movea.l    12(a2),a2
[00060244] 246a 0004                 movea.l    4(a2),a2
[00060248] 4e92                      jsr        (a2)
[0006024a] 4a40                      tst.w      d0
[0006024c] 660a                      bne.s      $00060258
[0006024e] 41ef 0015                 lea.l      21(a7),a0
[00060252] 4eb9 0006 c904            jsr        Ascrp_clear
[00060258] 7001                      moveq.l    #1,d0
[0006025a] 4fef 0054                 lea.l      84(a7),a7
[0006025e] 245f                      movea.l    (a7)+,a2
[00060260] 4e75                      rts
