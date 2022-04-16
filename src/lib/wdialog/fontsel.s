Ash_fontSetIcon:
[0006fb46] 5d4f                      subq.w     #6,a7
[0006fb48] 2f48 0002                 move.l     a0,2(a7)
[0006fb4c] 3e80                      move.w     d0,(a7)
[0006fb4e] 23ef 0002 000e 2f8e       move.l     2(a7),$000E2F8E
[0006fb56] 2039 000e 2f8e            move.l     $000E2F8E,d0
[0006fb5c] 660a                      bne.s      Ash_fontSetIcon_1
[0006fb5e] 0279 fffc 000e 2f88       andi.w     #$FFFC,$000E2F88
[0006fb66] 601e                      bra.s      Ash_fontSetIcon_2
Ash_fontSetIcon_1:
[0006fb68] 0079 0001 000e 2f88       ori.w      #$0001,$000E2F88
[0006fb70] 3017                      move.w     (a7),d0
[0006fb72] 670a                      beq.s      Ash_fontSetIcon_3
[0006fb74] 0079 0002 000e 2f88       ori.w      #$0002,$000E2F88
[0006fb7c] 6008                      bra.s      Ash_fontSetIcon_2
Ash_fontSetIcon_3:
[0006fb7e] 0279 fffd 000e 2f88       andi.w     #$FFFD,$000E2F88
Ash_fontSetIcon_2:
[0006fb86] 5c4f                      addq.w     #6,a7
[0006fb88] 4e75                      rts

Ash_font:
[0006fb8a] 2f0a                      move.l     a2,-(a7)
[0006fb8c] 4fef ffe4                 lea.l      -28(a7),a7
[0006fb90] 2f48 0014                 move.l     a0,20(a7)
[0006fb94] 3f40 0012                 move.w     d0,18(a7)
[0006fb98] 3f41 0010                 move.w     d1,16(a7)
[0006fb9c] 3f42 000e                 move.w     d2,14(a7)
[0006fba0] 2f49 000a                 move.l     a1,10(a7)
[0006fba4] 3ebc ffff                 move.w     #$FFFF,(a7)
[0006fba8] 202f 000a                 move.l     10(a7),d0
[0006fbac] 6606                      bne.s      Ash_font_1
[0006fbae] 70fd                      moveq.l    #-3,d0
[0006fbb0] 6000 03aa                 bra        Ash_font_2
Ash_font_1:
[0006fbb4] 4eb9 0006 ff64            jsr        hasFnts
[0006fbba] 4a40                      tst.w      d0
[0006fbbc] 6606                      bne.s      Ash_font_3
[0006fbbe] 70fe                      moveq.l    #-2,d0
[0006fbc0] 6000 039a                 bra        Ash_font_2
Ash_font_3:
[0006fbc4] 7044                      moveq.l    #68,d0
[0006fbc6] 4eb9 0004 c608            jsr        Ax_malloc
[0006fbcc] 2f48 0006                 move.l     a0,6(a7)
[0006fbd0] 202f 0006                 move.l     6(a7),d0
[0006fbd4] 6606                      bne.s      Ash_font_4
[0006fbd6] 70ff                      moveq.l    #-1,d0
[0006fbd8] 6000 0382                 bra        Ash_font_2
Ash_font_4:
[0006fbdc] 206f 0006                 movea.l    6(a7),a0
[0006fbe0] 30af 0012                 move.w     18(a7),(a0)
[0006fbe4] 206f 0006                 movea.l    6(a7),a0
[0006fbe8] 316f 0010 0002            move.w     16(a7),2(a0)
[0006fbee] 206f 0006                 movea.l    6(a7),a0
[0006fbf2] 316f 000e 0012            move.w     14(a7),18(a0)
[0006fbf8] 206f 0006                 movea.l    6(a7),a0
[0006fbfc] 316f 0024 0004            move.w     36(a7),4(a0)
[0006fc02] 206f 0026                 movea.l    38(a7),a0
[0006fc06] 4eb9 0004 643c            jsr        Ast_create
[0006fc0c] 226f 0006                 movea.l    6(a7),a1
[0006fc10] 2348 000a                 move.l     a0,10(a1)
[0006fc14] 206f 002a                 movea.l    42(a7),a0
[0006fc18] 4eb9 0004 643c            jsr        Ast_create
[0006fc1e] 226f 0006                 movea.l    6(a7),a1
[0006fc22] 2348 000e                 move.l     a0,14(a1)
[0006fc26] 206f 0006                 movea.l    6(a7),a0
[0006fc2a] 216f 003a 002c            move.l     58(a7),44(a0)
[0006fc30] 206f 0006                 movea.l    6(a7),a0
[0006fc34] 216f 002e 0030            move.l     46(a7),48(a0)
[0006fc3a] 206f 0006                 movea.l    6(a7),a0
[0006fc3e] 216f 0032 0034            move.l     50(a7),52(a0)
[0006fc44] 206f 0006                 movea.l    6(a7),a0
[0006fc48] 216f 0036 0038            move.l     54(a7),56(a0)
[0006fc4e] 206f 0006                 movea.l    6(a7),a0
[0006fc52] 216f 003e 003c            move.l     62(a7),60(a0)
[0006fc58] 206f 0006                 movea.l    6(a7),a0
[0006fc5c] 2028 0030                 move.l     48(a0),d0
[0006fc60] 660a                      bne.s      Ash_font_5
[0006fc62] 206f 0006                 movea.l    6(a7),a0
[0006fc66] 0268 dfff 0004            andi.w     #$DFFF,4(a0)
Ash_font_5:
[0006fc6c] 206f 0006                 movea.l    6(a7),a0
[0006fc70] 2028 0034                 move.l     52(a0),d0
[0006fc74] 660a                      bne.s      Ash_font_6
[0006fc76] 206f 0006                 movea.l    6(a7),a0
[0006fc7a] 0268 bfff 0004            andi.w     #$BFFF,4(a0)
Ash_font_6:
[0006fc80] 206f 0006                 movea.l    6(a7),a0
[0006fc84] 2028 0038                 move.l     56(a0),d0
[0006fc88] 6608                      bne.s      Ash_font_7
[0006fc8a] 206f 0006                 movea.l    6(a7),a0
[0006fc8e] 42a8 000e                 clr.l      14(a0)
Ash_font_7:
[0006fc92] 7010                      moveq.l    #16,d0
[0006fc94] 226f 000a                 movea.l    10(a7),a1
[0006fc98] 206f 0006                 movea.l    6(a7),a0
[0006fc9c] 41e8 0014                 lea.l      20(a0),a0
[0006fca0] 4eb9 0008 3500            jsr        memcpy
[0006fca6] 206f 0006                 movea.l    6(a7),a0
[0006fcaa] 4268 0014                 clr.w      20(a0)
[0006fcae] 206f 0006                 movea.l    6(a7),a0
[0006fcb2] 4268 0016                 clr.w      22(a0)
[0006fcb6] 206f 000a                 movea.l    10(a7),a0
[0006fcba] 2028 0004                 move.l     4(a0),d0
[0006fcbe] 6a0e                      bpl.s      Ash_font_8
[0006fcc0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006fcc6] 3028 0290                 move.w     656(a0),d0
[0006fcca] 48c0                      ext.l      d0
[0006fccc] 6008                      bra.s      Ash_font_9
Ash_font_8:
[0006fcce] 206f 000a                 movea.l    10(a7),a0
[0006fcd2] 2028 0004                 move.l     4(a0),d0
Ash_font_9:
[0006fcd6] 206f 0006                 movea.l    6(a7),a0
[0006fcda] 2140 0018                 move.l     d0,24(a0)
[0006fcde] 206f 000a                 movea.l    10(a7),a0
[0006fce2] 2028 0008                 move.l     8(a0),d0
[0006fce6] 6a12                      bpl.s      Ash_font_10
[0006fce8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006fcee] 3028 0292                 move.w     658(a0),d0
[0006fcf2] 48c0                      ext.l      d0
[0006fcf4] 7210                      moveq.l    #16,d1
[0006fcf6] e3a8                      lsl.l      d1,d0
[0006fcf8] 6008                      bra.s      Ash_font_11
Ash_font_10:
[0006fcfa] 206f 000a                 movea.l    10(a7),a0
[0006fcfe] 2028 0008                 move.l     8(a0),d0
Ash_font_11:
[0006fd02] 206f 0006                 movea.l    6(a7),a0
[0006fd06] 2140 001c                 move.l     d0,28(a0)
[0006fd0a] 206f 000a                 movea.l    10(a7),a0
[0006fd0e] 2028 000c                 move.l     12(a0),d0
[0006fd12] 6a08                      bpl.s      Ash_font_12
[0006fd14] 203c 0001 0000            move.l     #$00010000,d0
[0006fd1a] 6008                      bra.s      Ash_font_13
Ash_font_12:
[0006fd1c] 206f 000a                 movea.l    10(a7),a0
[0006fd20] 2028 000c                 move.l     12(a0),d0
Ash_font_13:
[0006fd24] 206f 0006                 movea.l    6(a7),a0
[0006fd28] 2140 0020                 move.l     d0,32(a0)
[0006fd2c] 206f 0006                 movea.l    6(a7),a0
[0006fd30] 2279 000e 2f3c            movea.l    $000E2F3C,a1
[0006fd36] 4e91                      jsr        (a1)
[0006fd38] 2f48 0002                 move.l     a0,2(a7)
[0006fd3c] 202f 0002                 move.l     2(a7),d0
[0006fd40] 6600 0140                 bne        Ash_font_14
[0006fd44] 202f 003e                 move.l     62(a7),d0
[0006fd48] 6600 00f8                 bne        Ash_font_15
[0006fd4c] 2f39 000e 692a            move.l     _globl,-(a7)
[0006fd52] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006fd58] 2068 023c                 movea.l    572(a0),a0
[0006fd5c] 3028 000e                 move.w     14(a0),d0
[0006fd60] c07c 0100                 and.w      #$0100,d0
[0006fd64] 6704                      beq.s      Ash_font_16
[0006fd66] 4240                      clr.w      d0
[0006fd68] 6002                      bra.s      Ash_font_17
Ash_font_16:
[0006fd6a] 7001                      moveq.l    #1,d0
Ash_font_17:
[0006fd6c] 3f00                      move.w     d0,-(a7)
[0006fd6e] 206f 000c                 movea.l    12(a7),a0
[0006fd72] 2268 000e                 movea.l    14(a0),a1
[0006fd76] 206f 000c                 movea.l    12(a7),a0
[0006fd7a] 2068 000a                 movea.l    10(a0),a0
[0006fd7e] 246f 000c                 movea.l    12(a7),a2
[0006fd82] 342a 0012                 move.w     18(a2),d2
[0006fd86] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006fd8c] 322a 0284                 move.w     644(a2),d1
[0006fd90] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006fd96] 302a 0010                 move.w     16(a2),d0
[0006fd9a] 4eb9 0007 c072            jsr        mt_fnts_create
[0006fda0] 5c4f                      addq.w     #6,a7
[0006fda2] 226f 0006                 movea.l    6(a7),a1
[0006fda6] 2348 0006                 move.l     a0,6(a1)
[0006fdaa] 206f 0006                 movea.l    6(a7),a0
[0006fdae] 2028 0006                 move.l     6(a0),d0
[0006fdb2] 6700 008e                 beq        Ash_font_15
[0006fdb6] 4eb9 0004 ef0c            jsr        Amo_unbusy
Ash_font_18:
[0006fdbc] 2f39 000e 692a            move.l     _globl,-(a7)
[0006fdc2] 206f 000a                 movea.l    10(a7),a0
[0006fdc6] 4868 0020                 pea.l      32(a0)
[0006fdca] 206f 000e                 movea.l    14(a7),a0
[0006fdce] 4868 001c                 pea.l      28(a0)
[0006fdd2] 206f 0012                 movea.l    18(a7),a0
[0006fdd6] 4868 0018                 pea.l      24(a0)
[0006fdda] 206f 0016                 movea.l    22(a7),a0
[0006fdde] 2f28 0020                 move.l     32(a0),-(a7)
[0006fde2] 226f 001a                 movea.l    26(a7),a1
[0006fde6] 43e9 0016                 lea.l      22(a1),a1
[0006fdea] 206f 001a                 movea.l    26(a7),a0
[0006fdee] 2428 001c                 move.l     28(a0),d2
[0006fdf2] 206f 001a                 movea.l    26(a7),a0
[0006fdf6] 2228 0018                 move.l     24(a0),d1
[0006fdfa] 206f 001a                 movea.l    26(a7),a0
[0006fdfe] 3028 0004                 move.w     4(a0),d0
[0006fe02] 206f 001a                 movea.l    26(a7),a0
[0006fe06] 2068 0006                 movea.l    6(a0),a0
[0006fe0a] 4eb9 0007 c15a            jsr        mt_fnts_do
[0006fe10] 4fef 0014                 lea.l      20(a7),a7
[0006fe14] 206f 0006                 movea.l    6(a7),a0
[0006fe18] 3140 0014                 move.w     d0,20(a0)
[0006fe1c] 206f 0006                 movea.l    6(a7),a0
[0006fe20] 4eb9 0007 0102            jsr        doButton
[0006fe26] 4a40                      tst.w      d0
[0006fe28] 6792                      beq.s      Ash_font_18
[0006fe2a] 2279 000e 692a            movea.l    _globl,a1
[0006fe30] 4240                      clr.w      d0
[0006fe32] 206f 0006                 movea.l    6(a7),a0
[0006fe36] 2068 0006                 movea.l    6(a0),a0
[0006fe3a] 4eb9 0007 c0f6            jsr        mt_fnts_delete
[0006fe40] 4257                      clr.w      (a7)
Ash_font_15:
[0006fe42] 7010                      moveq.l    #16,d0
[0006fe44] 226f 0006                 movea.l    6(a7),a1
[0006fe48] 43e9 0014                 lea.l      20(a1),a1
[0006fe4c] 206f 000a                 movea.l    10(a7),a0
[0006fe50] 4eb9 0008 3500            jsr        memcpy
[0006fe56] 206f 0006                 movea.l    6(a7),a0
[0006fe5a] 2068 000e                 movea.l    14(a0),a0
[0006fe5e] 4eb9 0004 649c            jsr        Ast_delete
[0006fe64] 206f 0006                 movea.l    6(a7),a0
[0006fe68] 2068 000a                 movea.l    10(a0),a0
[0006fe6c] 4eb9 0004 649c            jsr        Ast_delete
[0006fe72] 7044                      moveq.l    #68,d0
[0006fe74] 206f 0006                 movea.l    6(a7),a0
[0006fe78] 4eb9 0004 cc28            jsr        Ax_recycle
[0006fe7e] 6000 00da                 bra        Ash_font_19
Ash_font_14:
[0006fe82] 206f 0014                 movea.l    20(a7),a0
[0006fe86] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006fe8c] 4a40                      tst.w      d0
[0006fe8e] 663c                      bne.s      Ash_font_20
[0006fe90] 206f 0002                 movea.l    2(a7),a0
[0006fe94] 2f68 004a 0018            move.l     74(a0),24(a7)
[0006fe9a] 206f 0014                 movea.l    20(a7),a0
[0006fe9e] 4eb9 0004 643c            jsr        Ast_create
[0006fea4] 226f 0002                 movea.l    2(a7),a1
[0006fea8] 2348 004a                 move.l     a0,74(a1)
[0006feac] 206f 0002                 movea.l    2(a7),a0
[0006feb0] 2028 004a                 move.l     74(a0),d0
[0006feb4] 670c                      beq.s      Ash_font_21
[0006feb6] 206f 0018                 movea.l    24(a7),a0
[0006feba] 4eb9 0004 649c            jsr        Ast_delete
[0006fec0] 600a                      bra.s      Ash_font_20
Ash_font_21:
[0006fec2] 206f 0002                 movea.l    2(a7),a0
[0006fec6] 216f 0018 004a            move.l     24(a7),74(a0)
Ash_font_20:
[0006fecc] 202f 003e                 move.l     62(a7),d0
[0006fed0] 6656                      bne.s      Ash_font_22
[0006fed2] 206f 0006                 movea.l    6(a7),a0
[0006fed6] 317c 0001 0026            move.w     #$0001,38(a0)
[0006fedc] 206f 0002                 movea.l    2(a7),a0
[0006fee0] 226f 0002                 movea.l    2(a7),a1
[0006fee4] 2269 000c                 movea.l    12(a1),a1
[0006fee8] 4e91                      jsr        (a1)
[0006feea] 4a40                      tst.w      d0
[0006feec] 6712                      beq.s      Ash_font_23
[0006feee] 206f 0002                 movea.l    2(a7),a0
[0006fef2] 4eb9 0005 9df4            jsr        Awi_dialog
[0006fef8] 4a40                      tst.w      d0
[0006fefa] 6b04                      bmi.s      Ash_font_23
[0006fefc] 3ebc 0001                 move.w     #$0001,(a7)
Ash_font_23:
[0006ff00] 7010                      moveq.l    #16,d0
[0006ff02] 226f 0006                 movea.l    6(a7),a1
[0006ff06] 43e9 0014                 lea.l      20(a1),a1
[0006ff0a] 206f 000a                 movea.l    10(a7),a0
[0006ff0e] 4eb9 0008 3500            jsr        memcpy
[0006ff14] 93c9                      suba.l     a1,a1
[0006ff16] 7002                      moveq.l    #2,d0
[0006ff18] 206f 0002                 movea.l    2(a7),a0
[0006ff1c] 246f 0002                 movea.l    2(a7),a2
[0006ff20] 246a 0004                 movea.l    4(a2),a2
[0006ff24] 4e92                      jsr        (a2)
[0006ff26] 6032                      bra.s      Ash_font_19
Ash_font_22:
[0006ff28] 206f 0006                 movea.l    6(a7),a0
[0006ff2c] 4268 0026                 clr.w      38(a0)
[0006ff30] 206f 0002                 movea.l    2(a7),a0
[0006ff34] 226f 0002                 movea.l    2(a7),a1
[0006ff38] 2269 000c                 movea.l    12(a1),a1
[0006ff3c] 4e91                      jsr        (a1)
[0006ff3e] 4a40                      tst.w      d0
[0006ff40] 6706                      beq.s      Ash_font_24
[0006ff42] 3ebc 0002                 move.w     #$0002,(a7)
[0006ff46] 6012                      bra.s      Ash_font_19
Ash_font_24:
[0006ff48] 93c9                      suba.l     a1,a1
[0006ff4a] 7002                      moveq.l    #2,d0
[0006ff4c] 206f 0002                 movea.l    2(a7),a0
[0006ff50] 246f 0002                 movea.l    2(a7),a2
[0006ff54] 246a 0004                 movea.l    4(a2),a2
[0006ff58] 4e92                      jsr        (a2)
Ash_font_19:
[0006ff5a] 3017                      move.w     (a7),d0
Ash_font_2:
[0006ff5c] 4fef 001c                 lea.l      28(a7),a7
[0006ff60] 245f                      movea.l    (a7)+,a2
[0006ff62] 4e75                      rts

hasFnts:
[0006ff64] 514f                      subq.w     #8,a7
[0006ff66] 3039 000e 2fd6            move.w     vorhanden,d0
[0006ff6c] 6a42                      bpl.s      hasFnts_1
[0006ff6e] 2f39 000e 692a            move.l     _globl,-(a7)
[0006ff74] 486f 0004                 pea.l      4(a7)
[0006ff78] 486f 000a                 pea.l      10(a7)
[0006ff7c] 43ef 0010                 lea.l      16(a7),a1
[0006ff80] 41ef 0012                 lea.l      18(a7),a0
[0006ff84] 7007                      moveq.l    #7,d0
[0006ff86] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[0006ff8c] 4fef 000c                 lea.l      12(a7),a7
[0006ff90] 4a40                      tst.w      d0
[0006ff92] 6716                      beq.s      hasFnts_2
[0006ff94] 7004                      moveq.l    #4,d0
[0006ff96] c06f 0006                 and.w      6(a7),d0
[0006ff9a] 6704                      beq.s      hasFnts_3
[0006ff9c] 7001                      moveq.l    #1,d0
[0006ff9e] 6002                      bra.s      hasFnts_4
hasFnts_3:
[0006ffa0] 4240                      clr.w      d0
hasFnts_4:
[0006ffa2] 33c0 000e 2fd6            move.w     d0,vorhanden
[0006ffa8] 6006                      bra.s      hasFnts_1
hasFnts_2:
[0006ffaa] 4279 000e 2fd6            clr.w      vorhanden
hasFnts_1:
[0006ffb0] 3039 000e 2fd6            move.w     vorhanden,d0
[0006ffb6] 6704                      beq.s      hasFnts_5
[0006ffb8] 7001                      moveq.l    #1,d0
[0006ffba] 6002                      bra.s      hasFnts_6
hasFnts_5:
[0006ffbc] 4240                      clr.w      d0
hasFnts_6:
[0006ffbe] 504f                      addq.w     #8,a7
[0006ffc0] 4e75                      rts

fntsClose:
[0006ffc2] 2f0a                      move.l     a2,-(a7)
[0006ffc4] 4fef fff4                 lea.l      -12(a7),a7
[0006ffc8] 2f48 0008                 move.l     a0,8(a7)
[0006ffcc] 206f 0008                 movea.l    8(a7),a0
[0006ffd0] 2f68 0040 0004            move.l     64(a0),4(a7)
[0006ffd6] 206f 0008                 movea.l    8(a7),a0
[0006ffda] 2ea8 003c                 move.l     60(a0),(a7)
[0006ffde] 202f 0004                 move.l     4(a7),d0
[0006ffe2] 6752                      beq.s      fntsClose_1
[0006ffe4] 206f 0004                 movea.l    4(a7),a0
[0006ffe8] 3028 0020                 move.w     32(a0),d0
[0006ffec] 6b48                      bmi.s      fntsClose_1
[0006ffee] 2f39 000e 692a            move.l     _globl,-(a7)
[0006fff4] 206f 0008                 movea.l    8(a7),a0
[0006fff8] 4868 002e                 pea.l      46(a0)
[0006fffc] 226f 000c                 movea.l    12(a7),a1
[00070000] 43e9 002c                 lea.l      44(a1),a1
[00070004] 206f 0010                 movea.l    16(a7),a0
[00070008] 2068 0006                 movea.l    6(a0),a0
[0007000c] 4eb9 0007 bff0            jsr        mt_fnts_close
[00070012] 504f                      addq.w     #8,a7
[00070014] 206f 0004                 movea.l    4(a7),a0
[00070018] 317c ffff 0020            move.w     #$FFFF,32(a0)
[0007001e] 2017                      move.l     (a7),d0
[00070020] 6714                      beq.s      fntsClose_1
[00070022] 226f 0008                 movea.l    8(a7),a1
[00070026] 43e9 0014                 lea.l      20(a1),a1
[0007002a] 7034                      moveq.l    #52,d0
[0007002c] 2057                      movea.l    (a7),a0
[0007002e] 2457                      movea.l    (a7),a2
[00070030] 246a 0004                 movea.l    4(a2),a2
[00070034] 4e92                      jsr        (a2)
fntsClose_1:
[00070036] 7001                      moveq.l    #1,d0
[00070038] 4fef 000c                 lea.l      12(a7),a7
[0007003c] 245f                      movea.l    (a7)+,a2
[0007003e] 4e75                      rts

fntsMessage:
[00070040] 2f0a                      move.l     a2,-(a7)
[00070042] 4fef fff6                 lea.l      -10(a7),a7
[00070046] 2f48 0006                 move.l     a0,6(a7)
[0007004a] 2f49 0002                 move.l     a1,2(a7)
[0007004e] 206f 0006                 movea.l    6(a7),a0
[00070052] 2068 0040                 movea.l    64(a0),a0
[00070056] 226f 0002                 movea.l    2(a7),a1
[0007005a] 3368 0020 0026            move.w     32(a0),38(a1)
[00070060] 2f39 000e 692a            move.l     _globl,-(a7)
[00070066] 206f 000a                 movea.l    10(a7),a0
[0007006a] 4868 0020                 pea.l      32(a0)
[0007006e] 206f 000e                 movea.l    14(a7),a0
[00070072] 4868 001c                 pea.l      28(a0)
[00070076] 206f 0012                 movea.l    18(a7),a0
[0007007a] 4868 0018                 pea.l      24(a0)
[0007007e] 206f 0016                 movea.l    22(a7),a0
[00070082] 4868 0016                 pea.l      22(a0)
[00070086] 206f 001a                 movea.l    26(a7),a0
[0007008a] 4868 0014                 pea.l      20(a0)
[0007008e] 226f 001a                 movea.l    26(a7),a1
[00070092] 206f 001e                 movea.l    30(a7),a0
[00070096] 2068 0006                 movea.l    6(a0),a0
[0007009a] 4eb9 0007 c210            jsr        mt_fnts_evnt
[000700a0] 4fef 0018                 lea.l      24(a7),a7
[000700a4] 3e80                      move.w     d0,(a7)
[000700a6] 3017                      move.w     (a7),d0
[000700a8] 664e                      bne.s      fntsMessage_1
[000700aa] 206f 0006                 movea.l    6(a7),a0
[000700ae] 4eb9 0007 0102            jsr        doButton
[000700b4] 206f 0006                 movea.l    6(a7),a0
[000700b8] 3140 002a                 move.w     d0,42(a0)
[000700bc] 206f 0006                 movea.l    6(a7),a0
[000700c0] 3028 002a                 move.w     42(a0),d0
[000700c4] 6732                      beq.s      fntsMessage_1
[000700c6] 206f 0006                 movea.l    6(a7),a0
[000700ca] 3028 0026                 move.w     38(a0),d0
[000700ce] 670e                      beq.s      fntsMessage_2
[000700d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000700d6] 317c 0001 0268            move.w     #$0001,616(a0)
[000700dc] 601a                      bra.s      fntsMessage_1
fntsMessage_2:
[000700de] 93c9                      suba.l     a1,a1
[000700e0] 7002                      moveq.l    #2,d0
[000700e2] 206f 0006                 movea.l    6(a7),a0
[000700e6] 2068 0040                 movea.l    64(a0),a0
[000700ea] 246f 0006                 movea.l    6(a7),a2
[000700ee] 246a 0040                 movea.l    64(a2),a2
[000700f2] 246a 0004                 movea.l    4(a2),a2
[000700f6] 4e92                      jsr        (a2)
fntsMessage_1:
[000700f8] 3017                      move.w     (a7),d0
[000700fa] 4fef 000a                 lea.l      10(a7),a7
[000700fe] 245f                      movea.l    (a7)+,a2
[00070100] 4e75                      rts

doButton:
[00070102] 2f0a                      move.l     a2,-(a7)
[00070104] 594f                      subq.w     #4,a7
[00070106] 2e88                      move.l     a0,(a7)
[00070108] 2057                      movea.l    (a7),a0
[0007010a] 4268 002a                 clr.w      42(a0)
[0007010e] 2057                      movea.l    (a7),a0
[00070110] 3028 0014                 move.w     20(a0),d0
[00070114] b07c 0005                 cmp.w      #$0005,d0
[00070118] 6200 009a                 bhi        doButton_1
[0007011c] d040                      add.w      d0,d0
[0007011e] 303b 0006                 move.w     $00070126(pc,d0.w),d0
[00070122] 4efb 0002                 jmp        $00070126(pc,d0.w)
J59:
[00070126] 008e                      dc.w $008e   ; doButton_1-J59
[00070128] 000c                      dc.w $000c   ; doButton_2-J59
[0007012a] 0018                      dc.w $0018   ; doButton_3-J59
[0007012c] 0022                      dc.w $0022   ; doButton_4-J59
[0007012e] 0046                      dc.w $0046   ; doButton_5-J59
[00070130] 006a                      dc.w $006a   ; doButton_6-J59
doButton_2:
[00070132] 2057                      movea.l    (a7),a0
[00070134] 317c 0001 002a            move.w     #$0001,42(a0)
[0007013a] 6000 0078                 bra.w      doButton_1
doButton_3:
[0007013e] 2057                      movea.l    (a7),a0
[00070140] 317c 0001 002a            move.w     #$0001,42(a0)
[00070146] 606c                      bra.s      doButton_1
doButton_4:
[00070148] 2057                      movea.l    (a7),a0
[0007014a] 2028 0030                 move.l     48(a0),d0
[0007014e] 671a                      beq.s      doButton_7
[00070150] 2257                      movea.l    (a7),a1
[00070152] 43e9 0014                 lea.l      20(a1),a1
[00070156] 2057                      movea.l    (a7),a0
[00070158] 2068 002c                 movea.l    44(a0),a0
[0007015c] 2457                      movea.l    (a7),a2
[0007015e] 246a 0030                 movea.l    48(a2),a2
[00070162] 4e92                      jsr        (a2)
[00070164] 2057                      movea.l    (a7),a0
[00070166] 3140 002a                 move.w     d0,42(a0)
doButton_7:
[0007016a] 6048                      bra.s      doButton_1
doButton_5:
[0007016c] 2057                      movea.l    (a7),a0
[0007016e] 2028 0034                 move.l     52(a0),d0
[00070172] 671a                      beq.s      doButton_8
[00070174] 2257                      movea.l    (a7),a1
[00070176] 43e9 0014                 lea.l      20(a1),a1
[0007017a] 2057                      movea.l    (a7),a0
[0007017c] 2068 002c                 movea.l    44(a0),a0
[00070180] 2457                      movea.l    (a7),a2
[00070182] 246a 0034                 movea.l    52(a2),a2
[00070186] 4e92                      jsr        (a2)
[00070188] 2057                      movea.l    (a7),a0
[0007018a] 3140 002a                 move.w     d0,42(a0)
doButton_8:
[0007018e] 6024                      bra.s      doButton_1
doButton_6:
[00070190] 2057                      movea.l    (a7),a0
[00070192] 2028 0038                 move.l     56(a0),d0
[00070196] 671a                      beq.s      doButton_9
[00070198] 2257                      movea.l    (a7),a1
[0007019a] 43e9 0014                 lea.l      20(a1),a1
[0007019e] 2057                      movea.l    (a7),a0
[000701a0] 2068 002c                 movea.l    44(a0),a0
[000701a4] 2457                      movea.l    (a7),a2
[000701a6] 246a 0038                 movea.l    56(a2),a2
[000701aa] 4e92                      jsr        (a2)
[000701ac] 2057                      movea.l    (a7),a0
[000701ae] 3140 002a                 move.w     d0,42(a0)
doButton_9:
[000701b2] 4e71                      nop
doButton_1:
[000701b4] 2057                      movea.l    (a7),a0
[000701b6] 3028 002a                 move.w     42(a0),d0
[000701ba] 584f                      addq.w     #4,a7
[000701bc] 245f                      movea.l    (a7)+,a2
[000701be] 4e75                      rts

FontCreate:
[000701c0] 2f0a                      move.l     a2,-(a7)
[000701c2] 4fef fff4                 lea.l      -12(a7),a7
[000701c6] 2f48 0008                 move.l     a0,8(a7)
[000701ca] 2f6f 0008 0004            move.l     8(a7),4(a7)
[000701d0] 202f 0008                 move.l     8(a7),d0
[000701d4] 6606                      bne.s      FontCreate_1
[000701d6] 91c8                      suba.l     a0,a0
[000701d8] 6000 0086                 bra        FontCreate_2
FontCreate_1:
[000701dc] 41f9 000e 2f34            lea.l      FontSelWind,a0
[000701e2] 4eb9 0005 7052            jsr        Awi_create
[000701e8] 2e88                      move.l     a0,(a7)
[000701ea] 2017                      move.l     (a7),d0
[000701ec] 6604                      bne.s      FontCreate_3
[000701ee] 91c8                      suba.l     a0,a0
[000701f0] 606e                      bra.s      FontCreate_2
FontCreate_3:
[000701f2] 2057                      movea.l    (a7),a0
[000701f4] 20af 0004                 move.l     4(a7),(a0)
[000701f8] 206f 0004                 movea.l    4(a7),a0
[000701fc] 2157 0040                 move.l     (a7),64(a0)
[00070200] 2f39 000e 692a            move.l     _globl,-(a7)
[00070206] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007020c] 2068 023c                 movea.l    572(a0),a0
[00070210] 3028 000e                 move.w     14(a0),d0
[00070214] c07c 0100                 and.w      #$0100,d0
[00070218] 6704                      beq.s      FontCreate_4
[0007021a] 4240                      clr.w      d0
[0007021c] 6002                      bra.s      FontCreate_5
FontCreate_4:
[0007021e] 7001                      moveq.l    #1,d0
FontCreate_5:
[00070220] 3f00                      move.w     d0,-(a7)
[00070222] 206f 000a                 movea.l    10(a7),a0
[00070226] 2268 000e                 movea.l    14(a0),a1
[0007022a] 206f 000a                 movea.l    10(a7),a0
[0007022e] 2068 000a                 movea.l    10(a0),a0
[00070232] 246f 000a                 movea.l    10(a7),a2
[00070236] 342a 0012                 move.w     18(a2),d2
[0007023a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00070240] 322a 0284                 move.w     644(a2),d1
[00070244] 2479 0010 ee4e            movea.l    ACSblk,a2
[0007024a] 302a 0010                 move.w     16(a2),d0
[0007024e] 4eb9 0007 c072            jsr        mt_fnts_create
[00070254] 5c4f                      addq.w     #6,a7
[00070256] 226f 0004                 movea.l    4(a7),a1
[0007025a] 2348 0006                 move.l     a0,6(a1)
[0007025e] 2057                      movea.l    (a7),a0
FontCreate_2:
[00070260] 4fef 000c                 lea.l      12(a7),a7
[00070264] 245f                      movea.l    (a7)+,a2
[00070266] 4e75                      rts

FontService:
[00070268] 4fef fff6                 lea.l      -10(a7),a7
[0007026c] 2f48 0006                 move.l     a0,6(a7)
[00070270] 3f40 0004                 move.w     d0,4(a7)
[00070274] 206f 0006                 movea.l    6(a7),a0
[00070278] 2e90                      move.l     (a0),(a7)
[0007027a] 302f 0004                 move.w     4(a7),d0
[0007027e] 5540                      subq.w     #2,d0
[00070280] 6702                      beq.s      FontService_1
[00070282] 6062                      bra.s      FontService_2
FontService_1:
[00070284] 206f 0006                 movea.l    6(a7),a0
[00070288] 3028 0056                 move.w     86(a0),d0
[0007028c] c07c 0200                 and.w      #$0200,d0
[00070290] 6650                      bne.s      FontService_3
[00070292] 206f 0006                 movea.l    6(a7),a0
[00070296] 0068 0200 0056            ori.w      #$0200,86(a0)
[0007029c] 2057                      movea.l    (a7),a0
[0007029e] 6100 fd22                 bsr        fntsClose
[000702a2] 2279 000e 692a            movea.l    _globl,a1
[000702a8] 4240                      clr.w      d0
[000702aa] 2057                      movea.l    (a7),a0
[000702ac] 2068 0006                 movea.l    6(a0),a0
[000702b0] 4eb9 0007 c0f6            jsr        mt_fnts_delete
[000702b6] 2057                      movea.l    (a7),a0
[000702b8] 2068 000e                 movea.l    14(a0),a0
[000702bc] 4eb9 0004 649c            jsr        Ast_delete
[000702c2] 2057                      movea.l    (a7),a0
[000702c4] 2068 000a                 movea.l    10(a0),a0
[000702c8] 4eb9 0004 649c            jsr        Ast_delete
[000702ce] 7044                      moveq.l    #68,d0
[000702d0] 2057                      movea.l    (a7),a0
[000702d2] 4eb9 0004 cc28            jsr        Ax_recycle
[000702d8] 206f 0006                 movea.l    6(a7),a0
[000702dc] 4eb9 0005 85f2            jsr        Awi_delete
FontService_3:
[000702e2] 7001                      moveq.l    #1,d0
[000702e4] 6002                      bra.s      FontService_4
FontService_2:
[000702e6] 4240                      clr.w      d0
FontService_4:
[000702e8] 4fef 000a                 lea.l      10(a7),a7
[000702ec] 4e75                      rts

FontOpen:
[000702ee] 514f                      subq.w     #8,a7
[000702f0] 2f48 0004                 move.l     a0,4(a7)
[000702f4] 206f 0004                 movea.l    4(a7),a0
[000702f8] 2e90                      move.l     (a0),(a7)
[000702fa] 2057                      movea.l    (a7),a0
[000702fc] 2f28 0020                 move.l     32(a0),-(a7)
[00070300] 206f 0004                 movea.l    4(a7),a0
[00070304] 2f28 001c                 move.l     28(a0),-(a7)
[00070308] 206f 0008                 movea.l    8(a7),a0
[0007030c] 2f28 0018                 move.l     24(a0),-(a7)
[00070310] 2279 000e 692a            movea.l    _globl,a1
[00070316] 206f 000c                 movea.l    12(a7),a0
[0007031a] 3428 0002                 move.w     2(a0),d2
[0007031e] 206f 000c                 movea.l    12(a7),a0
[00070322] 3210                      move.w     (a0),d1
[00070324] 206f 000c                 movea.l    12(a7),a0
[00070328] 3028 0004                 move.w     4(a0),d0
[0007032c] 206f 000c                 movea.l    12(a7),a0
[00070330] 2068 0006                 movea.l    6(a0),a0
[00070334] 4eb9 0007 c494            jsr        mt_fnts_open
[0007033a] 4fef 000c                 lea.l      12(a7),a7
[0007033e] 206f 0004                 movea.l    4(a7),a0
[00070342] 3140 0020                 move.w     d0,32(a0)
[00070346] 206f 0004                 movea.l    4(a7),a0
[0007034a] 3028 0020                 move.w     32(a0),d0
[0007034e] 6f00 00b6                 ble        FontOpen_1
[00070352] 206f 0004                 movea.l    4(a7),a0
[00070356] 4868 002a                 pea.l      42(a0)
[0007035a] 206f 0008                 movea.l    8(a7),a0
[0007035e] 4868 0028                 pea.l      40(a0)
[00070362] 206f 000c                 movea.l    12(a7),a0
[00070366] 4868 0026                 pea.l      38(a0)
[0007036a] 206f 0010                 movea.l    16(a7),a0
[0007036e] 4868 0024                 pea.l      36(a0)
[00070372] 7205                      moveq.l    #5,d1
[00070374] 206f 0014                 movea.l    20(a7),a0
[00070378] 3028 0020                 move.w     32(a0),d0
[0007037c] 4eb9 0007 f7ba            jsr        wind_get
[00070382] 4fef 0010                 lea.l      16(a7),a7
[00070386] 206f 0004                 movea.l    4(a7),a0
[0007038a] 4868 003a                 pea.l      58(a0)
[0007038e] 206f 0008                 movea.l    8(a7),a0
[00070392] 4868 0038                 pea.l      56(a0)
[00070396] 206f 000c                 movea.l    12(a7),a0
[0007039a] 4868 0036                 pea.l      54(a0)
[0007039e] 206f 0010                 movea.l    16(a7),a0
[000703a2] 4868 0034                 pea.l      52(a0)
[000703a6] 7204                      moveq.l    #4,d1
[000703a8] 206f 0014                 movea.l    20(a7),a0
[000703ac] 3028 0020                 move.w     32(a0),d0
[000703b0] 4eb9 0007 f7ba            jsr        wind_get
[000703b6] 4fef 0010                 lea.l      16(a7),a7
[000703ba] 206f 0004                 movea.l    4(a7),a0
[000703be] 2068 0014                 movea.l    20(a0),a0
[000703c2] 4268 0010                 clr.w      16(a0)
[000703c6] 206f 0004                 movea.l    4(a7),a0
[000703ca] 2068 0014                 movea.l    20(a0),a0
[000703ce] 4268 0012                 clr.w      18(a0)
[000703d2] 206f 0004                 movea.l    4(a7),a0
[000703d6] 226f 0004                 movea.l    4(a7),a1
[000703da] 2269 0014                 movea.l    20(a1),a1
[000703de] 3368 0038 0014            move.w     56(a0),20(a1)
[000703e4] 206f 0004                 movea.l    4(a7),a0
[000703e8] 226f 0004                 movea.l    4(a7),a1
[000703ec] 2269 0014                 movea.l    20(a1),a1
[000703f0] 3368 003a 0016            move.w     58(a0),22(a1)
[000703f6] 206f 0004                 movea.l    4(a7),a0
[000703fa] 4eb9 0005 789e            jsr        Awi_register
[00070400] 7001                      moveq.l    #1,d0
[00070402] 6006                      bra.s      FontOpen_2
[00070404] 6004                      bra.s      FontOpen_2
FontOpen_1:
[00070406] 4240                      clr.w      d0
[00070408] 4e71                      nop
FontOpen_2:
[0007040a] 504f                      addq.w     #8,a7
[0007040c] 4e75                      rts

FontClosed:
[0007040e] 4fef ffb8                 lea.l      -72(a7),a7
[00070412] 2f48 0044                 move.l     a0,68(a7)
[00070416] 206f 0044                 movea.l    68(a7),a0
[0007041a] 2f50 0040                 move.l     (a0),64(a7)
[0007041e] 41f9 000e 2fd8            lea.l      $000E2FD8,a0
[00070424] 43d7                      lea.l      (a7),a1
[00070426] 700f                      moveq.l    #15,d0
FontClosed_1:
[00070428] 22d8                      move.l     (a0)+,(a1)+
[0007042a] 51c8 fffc                 dbf        d0,FontClosed_1
[0007042e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070434] 3f68 0262 0002            move.w     610(a0),2(a7)
[0007043a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070440] 3f68 0264 0004            move.w     612(a0),4(a7)
[00070446] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007044c] 3f68 02ca 0006            move.w     714(a0),6(a7)
[00070452] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070458] 3028 02ce                 move.w     718(a0),d0
[0007045c] 4eb9 0004 435a            jsr        nkc_n2kstate
[00070462] 3f40 0008                 move.w     d0,8(a7)
[00070466] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007046c] 3028 02ce                 move.w     718(a0),d0
[00070470] 4eb9 0004 4330            jsr        nkc_n2gem
[00070476] 3f40 000a                 move.w     d0,10(a7)
[0007047a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070480] 3f68 02cc 000c            move.w     716(a0),12(a7)
[00070486] 43d7                      lea.l      (a7),a1
[00070488] 206f 0040                 movea.l    64(a7),a0
[0007048c] 6100 fbb2                 bsr        fntsMessage
[00070490] 4fef 0048                 lea.l      72(a7),a7
[00070494] 4e75                      rts

FontRedraw:
[00070496] 4fef ffb4                 lea.l      -76(a7),a7
[0007049a] 2f48 0048                 move.l     a0,72(a7)
[0007049e] 2f49 0044                 move.l     a1,68(a7)
[000704a2] 206f 0048                 movea.l    72(a7),a0
[000704a6] 2f50 0040                 move.l     (a0),64(a7)
[000704aa] 41f9 000e 3018            lea.l      $000E3018,a0
[000704b0] 43d7                      lea.l      (a7),a1
[000704b2] 700f                      moveq.l    #15,d0
FontRedraw_1:
[000704b4] 22d8                      move.l     (a0)+,(a1)+
[000704b6] 51c8 fffc                 dbf        d0,FontRedraw_1
[000704ba] 2079 0010 ee4e            movea.l    ACSblk,a0
[000704c0] 3f68 0262 0002            move.w     610(a0),2(a7)
[000704c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000704cc] 3f68 0264 0004            move.w     612(a0),4(a7)
[000704d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000704d8] 3f68 02ca 0006            move.w     714(a0),6(a7)
[000704de] 2079 0010 ee4e            movea.l    ACSblk,a0
[000704e4] 3028 02ce                 move.w     718(a0),d0
[000704e8] 4eb9 0004 435a            jsr        nkc_n2kstate
[000704ee] 3f40 0008                 move.w     d0,8(a7)
[000704f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000704f8] 3028 02ce                 move.w     718(a0),d0
[000704fc] 4eb9 0004 4330            jsr        nkc_n2gem
[00070502] 3f40 000a                 move.w     d0,10(a7)
[00070506] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007050c] 3f68 02cc 000c            move.w     716(a0),12(a7)
[00070512] 206f 0044                 movea.l    68(a7),a0
[00070516] 3f50 0028                 move.w     (a0),40(a7)
[0007051a] 206f 0044                 movea.l    68(a7),a0
[0007051e] 3f68 0002 002a            move.w     2(a0),42(a7)
[00070524] 206f 0044                 movea.l    68(a7),a0
[00070528] 3f68 0004 002c            move.w     4(a0),44(a7)
[0007052e] 206f 0044                 movea.l    68(a7),a0
[00070532] 3f68 0006 002e            move.w     6(a0),46(a7)
[00070538] 43d7                      lea.l      (a7),a1
[0007053a] 206f 0040                 movea.l    64(a7),a0
[0007053e] 6100 fb00                 bsr        fntsMessage
[00070542] 4fef 004c                 lea.l      76(a7),a7
[00070546] 4e75                      rts

FontArrowed:
[00070548] 4fef ffb6                 lea.l      -74(a7),a7
[0007054c] 2f48 0046                 move.l     a0,70(a7)
[00070550] 3f40 0044                 move.w     d0,68(a7)
[00070554] 206f 0046                 movea.l    70(a7),a0
[00070558] 2f50 0040                 move.l     (a0),64(a7)
[0007055c] 41f9 000e 3058            lea.l      $000E3058,a0
[00070562] 43d7                      lea.l      (a7),a1
[00070564] 700f                      moveq.l    #15,d0
FontArrowed_1:
[00070566] 22d8                      move.l     (a0)+,(a1)+
[00070568] 51c8 fffc                 dbf        d0,FontArrowed_1
[0007056c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070572] 3f68 0262 0002            move.w     610(a0),2(a7)
[00070578] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007057e] 3f68 0264 0004            move.w     612(a0),4(a7)
[00070584] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007058a] 3f68 02ca 0006            move.w     714(a0),6(a7)
[00070590] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070596] 3028 02ce                 move.w     718(a0),d0
[0007059a] 4eb9 0004 435a            jsr        nkc_n2kstate
[000705a0] 3f40 0008                 move.w     d0,8(a7)
[000705a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000705aa] 3028 02ce                 move.w     718(a0),d0
[000705ae] 4eb9 0004 4330            jsr        nkc_n2gem
[000705b4] 3f40 000a                 move.w     d0,10(a7)
[000705b8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000705be] 3f68 02cc 000c            move.w     716(a0),12(a7)
[000705c4] 3f6f 0044 0028            move.w     68(a7),40(a7)
[000705ca] 43d7                      lea.l      (a7),a1
[000705cc] 206f 0040                 movea.l    64(a7),a0
[000705d0] 6100 fa6e                 bsr        fntsMessage
[000705d4] 4fef 004a                 lea.l      74(a7),a7
[000705d8] 4e75                      rts

FontChange:
[000705da] 2f0a                      move.l     a2,-(a7)
[000705dc] 594f                      subq.w     #4,a7
[000705de] 2e88                      move.l     a0,(a7)
[000705e0] 2257                      movea.l    (a7),a1
[000705e2] 43e9 0034                 lea.l      52(a1),a1
[000705e6] 2057                      movea.l    (a7),a0
[000705e8] 2457                      movea.l    (a7),a2
[000705ea] 246a 006a                 movea.l    106(a2),a2
[000705ee] 4e92                      jsr        (a2)
[000705f0] 584f                      addq.w     #4,a7
[000705f2] 245f                      movea.l    (a7)+,a2
[000705f4] 4e75                      rts

FontFulled:
[000705f6] 4fef ffb8                 lea.l      -72(a7),a7
[000705fa] 2f48 0044                 move.l     a0,68(a7)
[000705fe] 206f 0044                 movea.l    68(a7),a0
[00070602] 2f50 0040                 move.l     (a0),64(a7)
[00070606] 41f9 000e 3098            lea.l      $000E3098,a0
[0007060c] 43d7                      lea.l      (a7),a1
[0007060e] 700f                      moveq.l    #15,d0
FontFulled_1:
[00070610] 22d8                      move.l     (a0)+,(a1)+
[00070612] 51c8 fffc                 dbf        d0,FontFulled_1
[00070616] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007061c] 3f68 0262 0002            move.w     610(a0),2(a7)
[00070622] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070628] 3f68 0264 0004            move.w     612(a0),4(a7)
[0007062e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070634] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0007063a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070640] 3028 02ce                 move.w     718(a0),d0
[00070644] 4eb9 0004 435a            jsr        nkc_n2kstate
[0007064a] 3f40 0008                 move.w     d0,8(a7)
[0007064e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070654] 3028 02ce                 move.w     718(a0),d0
[00070658] 4eb9 0004 4330            jsr        nkc_n2gem
[0007065e] 3f40 000a                 move.w     d0,10(a7)
[00070662] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070668] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0007066e] 43d7                      lea.l      (a7),a1
[00070670] 206f 0040                 movea.l    64(a7),a0
[00070674] 6100 f9ca                 bsr        fntsMessage
[00070678] 4fef 0048                 lea.l      72(a7),a7
[0007067c] 4e75                      rts

FontInit:
[0007067e] 4240                      clr.w      d0
[00070680] 4e75                      rts

FontHSlide:
[00070682] 4fef ffb6                 lea.l      -74(a7),a7
[00070686] 2f48 0046                 move.l     a0,70(a7)
[0007068a] 3f40 0044                 move.w     d0,68(a7)
[0007068e] 206f 0046                 movea.l    70(a7),a0
[00070692] 2f50 0040                 move.l     (a0),64(a7)
[00070696] 41f9 000e 30d8            lea.l      $000E30D8,a0
[0007069c] 43d7                      lea.l      (a7),a1
[0007069e] 700f                      moveq.l    #15,d0
FontHSlide_1:
[000706a0] 22d8                      move.l     (a0)+,(a1)+
[000706a2] 51c8 fffc                 dbf        d0,FontHSlide_1
[000706a6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000706ac] 3f68 0262 0002            move.w     610(a0),2(a7)
[000706b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000706b8] 3f68 0264 0004            move.w     612(a0),4(a7)
[000706be] 2079 0010 ee4e            movea.l    ACSblk,a0
[000706c4] 3f68 02ca 0006            move.w     714(a0),6(a7)
[000706ca] 2079 0010 ee4e            movea.l    ACSblk,a0
[000706d0] 3028 02ce                 move.w     718(a0),d0
[000706d4] 4eb9 0004 435a            jsr        nkc_n2kstate
[000706da] 3f40 0008                 move.w     d0,8(a7)
[000706de] 2079 0010 ee4e            movea.l    ACSblk,a0
[000706e4] 3028 02ce                 move.w     718(a0),d0
[000706e8] 4eb9 0004 4330            jsr        nkc_n2gem
[000706ee] 3f40 000a                 move.w     d0,10(a7)
[000706f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000706f8] 3f68 02cc 000c            move.w     716(a0),12(a7)
[000706fe] 3f6f 0044 0028            move.w     68(a7),40(a7)
[00070704] 43d7                      lea.l      (a7),a1
[00070706] 206f 0040                 movea.l    64(a7),a0
[0007070a] 6100 f934                 bsr        fntsMessage
[0007070e] 4fef 004a                 lea.l      74(a7),a7
[00070712] 4e75                      rts

FontVSlide:
[00070714] 4fef ffb6                 lea.l      -74(a7),a7
[00070718] 2f48 0046                 move.l     a0,70(a7)
[0007071c] 3f40 0044                 move.w     d0,68(a7)
[00070720] 206f 0046                 movea.l    70(a7),a0
[00070724] 2f50 0040                 move.l     (a0),64(a7)
[00070728] 41f9 000e 3118            lea.l      $000E3118,a0
[0007072e] 43d7                      lea.l      (a7),a1
[00070730] 700f                      moveq.l    #15,d0
FontVSlide_1:
[00070732] 22d8                      move.l     (a0)+,(a1)+
[00070734] 51c8 fffc                 dbf        d0,FontVSlide_1
[00070738] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007073e] 3f68 0262 0002            move.w     610(a0),2(a7)
[00070744] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007074a] 3f68 0264 0004            move.w     612(a0),4(a7)
[00070750] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070756] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0007075c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070762] 3028 02ce                 move.w     718(a0),d0
[00070766] 4eb9 0004 435a            jsr        nkc_n2kstate
[0007076c] 3f40 0008                 move.w     d0,8(a7)
[00070770] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070776] 3028 02ce                 move.w     718(a0),d0
[0007077a] 4eb9 0004 4330            jsr        nkc_n2gem
[00070780] 3f40 000a                 move.w     d0,10(a7)
[00070784] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007078a] 3f68 02cc 000c            move.w     716(a0),12(a7)
[00070790] 3f6f 0044 0028            move.w     68(a7),40(a7)
[00070796] 43d7                      lea.l      (a7),a1
[00070798] 206f 0040                 movea.l    64(a7),a0
[0007079c] 6100 f8a2                 bsr        fntsMessage
[000707a0] 4fef 004a                 lea.l      74(a7),a7
[000707a4] 4e75                      rts

FontKeys:
[000707a6] 4fef ffb6                 lea.l      -74(a7),a7
[000707aa] 2f48 0046                 move.l     a0,70(a7)
[000707ae] 3f41 0044                 move.w     d1,68(a7)
[000707b2] 206f 0046                 movea.l    70(a7),a0
[000707b6] 2f50 0040                 move.l     (a0),64(a7)
[000707ba] 41f9 000e 3158            lea.l      $000E3158,a0
[000707c0] 43d7                      lea.l      (a7),a1
[000707c2] 700f                      moveq.l    #15,d0
FontKeys_1:
[000707c4] 22d8                      move.l     (a0)+,(a1)+
[000707c6] 51c8 fffc                 dbf        d0,FontKeys_1
[000707ca] 2079 0010 ee4e            movea.l    ACSblk,a0
[000707d0] 3f68 0262 0002            move.w     610(a0),2(a7)
[000707d6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000707dc] 3f68 0264 0004            move.w     612(a0),4(a7)
[000707e2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000707e8] 3f68 02ca 0006            move.w     714(a0),6(a7)
[000707ee] 302f 0044                 move.w     68(a7),d0
[000707f2] 4eb9 0004 435a            jsr        nkc_n2kstate
[000707f8] 3f40 0008                 move.w     d0,8(a7)
[000707fc] 302f 0044                 move.w     68(a7),d0
[00070800] 4eb9 0004 4330            jsr        nkc_n2gem
[00070806] 3f40 000a                 move.w     d0,10(a7)
[0007080a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070810] 3f68 02cc 000c            move.w     716(a0),12(a7)
[00070816] 43d7                      lea.l      (a7),a1
[00070818] 206f 0040                 movea.l    64(a7),a0
[0007081c] 6100 f822                 bsr        fntsMessage
[00070820] 4240                      clr.w      d0
[00070822] 4fef 004a                 lea.l      74(a7),a7
[00070826] 4e75                      rts

FontTopped:
[00070828] 4fef ffb8                 lea.l      -72(a7),a7
[0007082c] 2f48 0044                 move.l     a0,68(a7)
[00070830] 206f 0044                 movea.l    68(a7),a0
[00070834] 2f50 0040                 move.l     (a0),64(a7)
[00070838] 41f9 000e 3198            lea.l      $000E3198,a0
[0007083e] 43d7                      lea.l      (a7),a1
[00070840] 700f                      moveq.l    #15,d0
FontTopped_1:
[00070842] 22d8                      move.l     (a0)+,(a1)+
[00070844] 51c8 fffc                 dbf        d0,FontTopped_1
[00070848] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007084e] 3f68 0262 0002            move.w     610(a0),2(a7)
[00070854] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007085a] 3f68 0264 0004            move.w     612(a0),4(a7)
[00070860] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070866] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0007086c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070872] 3028 02ce                 move.w     718(a0),d0
[00070876] 4eb9 0004 435a            jsr        nkc_n2kstate
[0007087c] 3f40 0008                 move.w     d0,8(a7)
[00070880] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070886] 3028 02ce                 move.w     718(a0),d0
[0007088a] 4eb9 0004 4330            jsr        nkc_n2gem
[00070890] 3f40 000a                 move.w     d0,10(a7)
[00070894] 2079 0010 ee4e            movea.l    ACSblk,a0
[0007089a] 3f68 02cc 000c            move.w     716(a0),12(a7)
[000708a0] 43d7                      lea.l      (a7),a1
[000708a2] 206f 0040                 movea.l    64(a7),a0
[000708a6] 6100 f798                 bsr        fntsMessage
[000708aa] 4fef 0048                 lea.l      72(a7),a7
[000708ae] 4e75                      rts

FontMoved:
[000708b0] 4fef ffb4                 lea.l      -76(a7),a7
[000708b4] 2f48 0048                 move.l     a0,72(a7)
[000708b8] 2f49 0044                 move.l     a1,68(a7)
[000708bc] 206f 0048                 movea.l    72(a7),a0
[000708c0] 2f50 0040                 move.l     (a0),64(a7)
[000708c4] 41f9 000e 31d8            lea.l      $000E31D8,a0
[000708ca] 43d7                      lea.l      (a7),a1
[000708cc] 700f                      moveq.l    #15,d0
FontMoved_1:
[000708ce] 22d8                      move.l     (a0)+,(a1)+
[000708d0] 51c8 fffc                 dbf        d0,FontMoved_1
[000708d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000708da] 3f68 0262 0002            move.w     610(a0),2(a7)
[000708e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000708e6] 3f68 0264 0004            move.w     612(a0),4(a7)
[000708ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[000708f2] 3f68 02ca 0006            move.w     714(a0),6(a7)
[000708f8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000708fe] 3028 02ce                 move.w     718(a0),d0
[00070902] 4eb9 0004 435a            jsr        nkc_n2kstate
[00070908] 3f40 0008                 move.w     d0,8(a7)
[0007090c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070912] 3028 02ce                 move.w     718(a0),d0
[00070916] 4eb9 0004 4330            jsr        nkc_n2gem
[0007091c] 3f40 000a                 move.w     d0,10(a7)
[00070920] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070926] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0007092c] 206f 0044                 movea.l    68(a7),a0
[00070930] 3f50 0028                 move.w     (a0),40(a7)
[00070934] 206f 0044                 movea.l    68(a7),a0
[00070938] 3f68 0002 002a            move.w     2(a0),42(a7)
[0007093e] 206f 0044                 movea.l    68(a7),a0
[00070942] 3f68 0004 002c            move.w     4(a0),44(a7)
[00070948] 206f 0044                 movea.l    68(a7),a0
[0007094c] 3f68 0006 002e            move.w     6(a0),46(a7)
[00070952] 43d7                      lea.l      (a7),a1
[00070954] 206f 0040                 movea.l    64(a7),a0
[00070958] 6100 f6e6                 bsr        fntsMessage
[0007095c] 206f 0048                 movea.l    72(a7),a0
[00070960] 4868 002a                 pea.l      42(a0)
[00070964] 206f 004c                 movea.l    76(a7),a0
[00070968] 4868 0028                 pea.l      40(a0)
[0007096c] 206f 0050                 movea.l    80(a7),a0
[00070970] 4868 0026                 pea.l      38(a0)
[00070974] 206f 0054                 movea.l    84(a7),a0
[00070978] 4868 0024                 pea.l      36(a0)
[0007097c] 7205                      moveq.l    #5,d1
[0007097e] 206f 0058                 movea.l    88(a7),a0
[00070982] 3028 0020                 move.w     32(a0),d0
[00070986] 4eb9 0007 f7ba            jsr        wind_get
[0007098c] 4fef 0010                 lea.l      16(a7),a7
[00070990] 206f 0048                 movea.l    72(a7),a0
[00070994] 4868 003a                 pea.l      58(a0)
[00070998] 206f 004c                 movea.l    76(a7),a0
[0007099c] 4868 0038                 pea.l      56(a0)
[000709a0] 206f 0050                 movea.l    80(a7),a0
[000709a4] 4868 0036                 pea.l      54(a0)
[000709a8] 206f 0054                 movea.l    84(a7),a0
[000709ac] 4868 0034                 pea.l      52(a0)
[000709b0] 7204                      moveq.l    #4,d1
[000709b2] 206f 0058                 movea.l    88(a7),a0
[000709b6] 3028 0020                 move.w     32(a0),d0
[000709ba] 4eb9 0007 f7ba            jsr        wind_get
[000709c0] 4fef 0010                 lea.l      16(a7),a7
[000709c4] 206f 0048                 movea.l    72(a7),a0
[000709c8] 226f 0048                 movea.l    72(a7),a1
[000709cc] 2269 0014                 movea.l    20(a1),a1
[000709d0] 3368 0038 0014            move.w     56(a0),20(a1)
[000709d6] 206f 0048                 movea.l    72(a7),a0
[000709da] 226f 0048                 movea.l    72(a7),a1
[000709de] 2269 0014                 movea.l    20(a1),a1
[000709e2] 3368 003a 0016            move.w     58(a0),22(a1)
[000709e8] 4fef 004c                 lea.l      76(a7),a7
[000709ec] 4e75                      rts

FontSized:
[000709ee] 4fef ffb4                 lea.l      -76(a7),a7
[000709f2] 2f48 0048                 move.l     a0,72(a7)
[000709f6] 2f49 0044                 move.l     a1,68(a7)
[000709fa] 206f 0048                 movea.l    72(a7),a0
[000709fe] 2f50 0040                 move.l     (a0),64(a7)
[00070a02] 41f9 000e 3218            lea.l      $000E3218,a0
[00070a08] 43d7                      lea.l      (a7),a1
[00070a0a] 700f                      moveq.l    #15,d0
FontSized_1:
[00070a0c] 22d8                      move.l     (a0)+,(a1)+
[00070a0e] 51c8 fffc                 dbf        d0,FontSized_1
[00070a12] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070a18] 3f68 0262 0002            move.w     610(a0),2(a7)
[00070a1e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070a24] 3f68 0264 0004            move.w     612(a0),4(a7)
[00070a2a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070a30] 3f68 02ca 0006            move.w     714(a0),6(a7)
[00070a36] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070a3c] 3028 02ce                 move.w     718(a0),d0
[00070a40] 4eb9 0004 435a            jsr        nkc_n2kstate
[00070a46] 3f40 0008                 move.w     d0,8(a7)
[00070a4a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070a50] 3028 02ce                 move.w     718(a0),d0
[00070a54] 4eb9 0004 4330            jsr        nkc_n2gem
[00070a5a] 3f40 000a                 move.w     d0,10(a7)
[00070a5e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070a64] 3f68 02cc 000c            move.w     716(a0),12(a7)
[00070a6a] 206f 0044                 movea.l    68(a7),a0
[00070a6e] 3f50 0028                 move.w     (a0),40(a7)
[00070a72] 206f 0044                 movea.l    68(a7),a0
[00070a76] 3f68 0002 002a            move.w     2(a0),42(a7)
[00070a7c] 206f 0044                 movea.l    68(a7),a0
[00070a80] 3f68 0004 002c            move.w     4(a0),44(a7)
[00070a86] 206f 0044                 movea.l    68(a7),a0
[00070a8a] 3f68 0006 002e            move.w     6(a0),46(a7)
[00070a90] 43d7                      lea.l      (a7),a1
[00070a92] 206f 0040                 movea.l    64(a7),a0
[00070a96] 6100 f5a8                 bsr        fntsMessage
[00070a9a] 206f 0048                 movea.l    72(a7),a0
[00070a9e] 4868 002a                 pea.l      42(a0)
[00070aa2] 206f 004c                 movea.l    76(a7),a0
[00070aa6] 4868 0028                 pea.l      40(a0)
[00070aaa] 206f 0050                 movea.l    80(a7),a0
[00070aae] 4868 0026                 pea.l      38(a0)
[00070ab2] 206f 0054                 movea.l    84(a7),a0
[00070ab6] 4868 0024                 pea.l      36(a0)
[00070aba] 7205                      moveq.l    #5,d1
[00070abc] 206f 0058                 movea.l    88(a7),a0
[00070ac0] 3028 0020                 move.w     32(a0),d0
[00070ac4] 4eb9 0007 f7ba            jsr        wind_get
[00070aca] 4fef 0010                 lea.l      16(a7),a7
[00070ace] 206f 0048                 movea.l    72(a7),a0
[00070ad2] 4868 003a                 pea.l      58(a0)
[00070ad6] 206f 004c                 movea.l    76(a7),a0
[00070ada] 4868 0038                 pea.l      56(a0)
[00070ade] 206f 0050                 movea.l    80(a7),a0
[00070ae2] 4868 0036                 pea.l      54(a0)
[00070ae6] 206f 0054                 movea.l    84(a7),a0
[00070aea] 4868 0034                 pea.l      52(a0)
[00070aee] 7204                      moveq.l    #4,d1
[00070af0] 206f 0058                 movea.l    88(a7),a0
[00070af4] 3028 0020                 move.w     32(a0),d0
[00070af8] 4eb9 0007 f7ba            jsr        wind_get
[00070afe] 4fef 0010                 lea.l      16(a7),a7
[00070b02] 206f 0048                 movea.l    72(a7),a0
[00070b06] 226f 0048                 movea.l    72(a7),a1
[00070b0a] 2269 0014                 movea.l    20(a1),a1
[00070b0e] 3368 0038 0014            move.w     56(a0),20(a1)
[00070b14] 206f 0048                 movea.l    72(a7),a0
[00070b18] 226f 0048                 movea.l    72(a7),a1
[00070b1c] 2269 0014                 movea.l    20(a1),a1
[00070b20] 3368 003a 0016            move.w     58(a0),22(a1)
[00070b26] 4fef 004c                 lea.l      76(a7),a7
[00070b2a] 4e75                      rts

FontIconify:
[00070b2c] 5d4f                      subq.w     #6,a7
[00070b2e] 2f48 0002                 move.l     a0,2(a7)
[00070b32] 3e80                      move.w     d0,(a7)
[00070b34] 3017                      move.w     (a7),d0
[00070b36] 206f 0002                 movea.l    2(a7),a0
[00070b3a] 4eb9 0005 998a            jsr        Awi_iconify
[00070b40] 5c4f                      addq.w     #6,a7
[00070b42] 4e75                      rts

FontUniconify:
[00070b44] 594f                      subq.w     #4,a7
[00070b46] 2e88                      move.l     a0,(a7)
[00070b48] 2057                      movea.l    (a7),a0
[00070b4a] 4eb9 0005 9c6c            jsr        Awi_uniconify
[00070b50] 584f                      addq.w     #4,a7
[00070b52] 4e75                      rts

FontGEMScript:
[00070b54] 4fef fff6                 lea.l      -10(a7),a7
[00070b58] 2f48 0006                 move.l     a0,6(a7)
[00070b5c] 3f40 0004                 move.w     d0,4(a7)
[00070b60] 2e89                      move.l     a1,(a7)
[00070b62] 2f2f 000e                 move.l     14(a7),-(a7)
[00070b66] 226f 0004                 movea.l    4(a7),a1
[00070b6a] 302f 0008                 move.w     8(a7),d0
[00070b6e] 206f 000a                 movea.l    10(a7),a0
[00070b72] 4eb9 0005 b5b6            jsr        Awi_gemscript
[00070b78] 584f                      addq.w     #4,a7
[00070b7a] 4fef 000a                 lea.l      10(a7),a7
[00070b7e] 4e75                      rts

FontClicked:
[00070b80] 4fef ffbc                 lea.l      -68(a7),a7
[00070b84] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070b8a] 2068 0258                 movea.l    600(a0),a0
[00070b8e] 2f50 0040                 move.l     (a0),64(a7)
[00070b92] 41f9 000e 3258            lea.l      $000E3258,a0
[00070b98] 43d7                      lea.l      (a7),a1
[00070b9a] 700f                      moveq.l    #15,d0
FontClicked_1:
[00070b9c] 22d8                      move.l     (a0)+,(a1)+
[00070b9e] 51c8 fffc                 dbf        d0,FontClicked_1
[00070ba2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070ba8] 3f68 0262 0002            move.w     610(a0),2(a7)
[00070bae] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070bb4] 3f68 0264 0004            move.w     612(a0),4(a7)
[00070bba] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070bc0] 3f68 02ca 0006            move.w     714(a0),6(a7)
[00070bc6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070bcc] 3028 02ce                 move.w     718(a0),d0
[00070bd0] 4eb9 0004 435a            jsr        nkc_n2kstate
[00070bd6] 3f40 0008                 move.w     d0,8(a7)
[00070bda] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070be0] 3028 02ce                 move.w     718(a0),d0
[00070be4] 4eb9 0004 4330            jsr        nkc_n2gem
[00070bea] 3f40 000a                 move.w     d0,10(a7)
[00070bee] 2079 0010 ee4e            movea.l    ACSblk,a0
[00070bf4] 3f68 02cc 000c            move.w     716(a0),12(a7)
[00070bfa] 43d7                      lea.l      (a7),a1
[00070bfc] 206f 0040                 movea.l    64(a7),a0
[00070c00] 6100 f43e                 bsr        fntsMessage
[00070c04] 4fef 0044                 lea.l      68(a7),a7
[00070c08] 4e75                      rts

	.data

TEXT_01:
[000e2f02]                           dc.w $0000
FontSelObj:
[000e2f04]                           dc.w $ffff
[000e2f06]                           dc.w $ffff
[000e2f08]                           dc.w $ffff
[000e2f0a]                           dc.w $0014
[000e2f0c]                           dc.w $0040
[000e2f0e]                           dc.w $0000
[000e2f10]                           dc.w $0002
[000e2f12]                           dc.w $1100
[000e2f14]                           dc.w $0000
[000e2f16]                           dc.w $0000
[000e2f18]                           dc.w $0028
[000e2f1a]                           dc.w $0014
_00aFontSelObj:
[000e2f1c] 00070b80                  dc.l FontClicked
[000e2f20]                           dc.w $0000
[000e2f22]                           dc.w $0000
[000e2f24]                           dc.w $8020
[000e2f26]                           dc.w $0000
[000e2f28]                           dc.w $0000
[000e2f2a]                           dc.w $0000
[000e2f2c]                           dc.w $0000
[000e2f2e]                           dc.w $0000
[000e2f30]                           dc.w $0000
[000e2f32]                           dc.w $0000
FontSelWind:
[000e2f34]                           dc.w $0000
[000e2f36]                           dc.w $0000
[000e2f38] 00070268                  dc.l FontService
[000e2f3c] 000701c0                  dc.l FontCreate
[000e2f40] 000702ee                  dc.l FontOpen
[000e2f44] 0007067e                  dc.l FontInit
[000e2f48] 000e2f04                  dc.l FontSelObj
[000e2f4c]                           dc.w $0000
[000e2f4e]                           dc.w $0000
[000e2f50]                           dc.w $0000
[000e2f52]                           dc.w $0000
[000e2f54]                           dc.w $ffff
[000e2f56]                           dc.w $6fef
[000e2f58]                           dc.w $0000
[000e2f5a]                           dc.w $0000
[000e2f5c]                           dc.w $0078
[000e2f5e]                           dc.w $0032
[000e2f60]                           dc.w $0000
[000e2f62]                           dc.w $0000
[000e2f64]                           dc.w $0000
[000e2f66]                           dc.w $0000
[000e2f68]                           dc.w $0000
[000e2f6a]                           dc.w $0000
[000e2f6c]                           dc.w $0000
[000e2f6e]                           dc.w $0000
[000e2f70]                           dc.w $ffff
[000e2f72]                           dc.w $ffff
[000e2f74]                           dc.w $ffff
[000e2f76]                           dc.w $ffff
[000e2f78]                           dc.w $0000
[000e2f7a]                           dc.w $0000
[000e2f7c]                           dc.w $f8f8
[000e2f7e] 000e2f02                  dc.l TEXT_01
[000e2f82] 000e2f03                  dc.l TEXT_02
[000e2f86]                           dc.w $0000
[000e2f88]                           dc.w $0100
[000e2f8a]                           dc.w $0000
[000e2f8c]                           dc.w $ffff
[000e2f8e]                           dc.w $0000
[000e2f90]                           dc.w $0000
[000e2f92]                           dc.w $0000
[000e2f94]                           dc.w $0000
[000e2f96] 000707a6                  dc.l FontKeys
[000e2f9a] 000705da                  dc.l FontChange
[000e2f9e] 00070496                  dc.l FontRedraw
[000e2fa2] 00070828                  dc.l FontTopped
[000e2fa6] 0007040e                  dc.l FontClosed
[000e2faa] 000705f6                  dc.l FontFulled
[000e2fae] 00070548                  dc.l FontArrowed
[000e2fb2] 00070682                  dc.l FontHSlide
[000e2fb6] 00070714                  dc.l FontVSlide
[000e2fba] 000709ee                  dc.l FontSized
[000e2fbe] 000708b0                  dc.l FontMoved
[000e2fc2] 00070b2c                  dc.l FontIconify
[000e2fc6] 00070b44                  dc.l FontUniconify
[000e2fca] 00070b54                  dc.l FontGEMScript
[000e2fce]                           dc.w $0000
[000e2fd0]                           dc.w $0000
[000e2fd2]                           dc.w $0000
[000e2fd4]                           dc.w $0000
vorhanden:
[000e2fd6]                           dc.w $ffff
[000e2fd8]                           dc.w $0010
[000e2fda]                           dc.w $0000
[000e2fdc]                           dc.w $0000
[000e2fde]                           dc.w $0000
[000e2fe0]                           dc.w $0000
[000e2fe2]                           dc.w $0000
[000e2fe4]                           dc.w $0000
[000e2fe6]                           dc.w $0000
[000e2fe8]                           dc.w $0000
[000e2fea]                           dc.w $0000
[000e2fec]                           dc.w $0000
[000e2fee]                           dc.w $0000
[000e2ff0]                           dc.w $0000
[000e2ff2]                           dc.w $0000
[000e2ff4]                           dc.w $0000
[000e2ff6]                           dc.w $0000
[000e2ff8]                           dc.w $0016
[000e2ffa]                           dc.w $0001
[000e2ffc]                           dc.w $0000
[000e2ffe]                           dc.w $0000
[000e3000]                           dc.w $0000
[000e3002]                           dc.w $0000
[000e3004]                           dc.w $0000
[000e3006]                           dc.w $0000
[000e3008]                           dc.w $0000
[000e300a]                           dc.w $0000
[000e300c]                           dc.w $0000
[000e300e]                           dc.w $0000
[000e3010]                           dc.w $0000
[000e3012]                           dc.w $0000
[000e3014]                           dc.w $0000
[000e3016]                           dc.w $0000
[000e3018]                           dc.w $0010
[000e301a]                           dc.w $0000
[000e301c]                           dc.w $0000
[000e301e]                           dc.w $0000
[000e3020]                           dc.w $0000
[000e3022]                           dc.w $0000
[000e3024]                           dc.w $0000
[000e3026]                           dc.w $0000
[000e3028]                           dc.w $0000
[000e302a]                           dc.w $0000
[000e302c]                           dc.w $0000
[000e302e]                           dc.w $0000
[000e3030]                           dc.w $0000
[000e3032]                           dc.w $0000
[000e3034]                           dc.w $0000
[000e3036]                           dc.w $0000
[000e3038]                           dc.w $0014
[000e303a]                           dc.w $0001
[000e303c]                           dc.w $0000
[000e303e]                           dc.w $0000
[000e3040]                           dc.w $0000
[000e3042]                           dc.w $0000
[000e3044]                           dc.w $0000
[000e3046]                           dc.w $0000
[000e3048]                           dc.w $0000
[000e304a]                           dc.w $0000
[000e304c]                           dc.w $0000
[000e304e]                           dc.w $0000
[000e3050]                           dc.w $0000
[000e3052]                           dc.w $0000
[000e3054]                           dc.w $0000
[000e3056]                           dc.w $0000
[000e3058]                           dc.w $0010
[000e305a]                           dc.w $0000
[000e305c]                           dc.w $0000
[000e305e]                           dc.w $0000
[000e3060]                           dc.w $0000
[000e3062]                           dc.w $0000
[000e3064]                           dc.w $0000
[000e3066]                           dc.w $0000
[000e3068]                           dc.w $0000
[000e306a]                           dc.w $0000
[000e306c]                           dc.w $0000
[000e306e]                           dc.w $0000
[000e3070]                           dc.w $0000
[000e3072]                           dc.w $0000
[000e3074]                           dc.w $0000
[000e3076]                           dc.w $0000
[000e3078]                           dc.w $0018
[000e307a]                           dc.w $0001
[000e307c]                           dc.w $0000
[000e307e]                           dc.w $0000
[000e3080]                           dc.w $0000
[000e3082]                           dc.w $0000
[000e3084]                           dc.w $0000
[000e3086]                           dc.w $0000
[000e3088]                           dc.w $0000
[000e308a]                           dc.w $0000
[000e308c]                           dc.w $0000
[000e308e]                           dc.w $0000
[000e3090]                           dc.w $0000
[000e3092]                           dc.w $0000
[000e3094]                           dc.w $0000
[000e3096]                           dc.w $0000
[000e3098]                           dc.w $0010
[000e309a]                           dc.w $0000
[000e309c]                           dc.w $0000
[000e309e]                           dc.w $0000
[000e30a0]                           dc.w $0000
[000e30a2]                           dc.w $0000
[000e30a4]                           dc.w $0000
[000e30a6]                           dc.w $0000
[000e30a8]                           dc.w $0000
[000e30aa]                           dc.w $0000
[000e30ac]                           dc.w $0000
[000e30ae]                           dc.w $0000
[000e30b0]                           dc.w $0000
[000e30b2]                           dc.w $0000
[000e30b4]                           dc.w $0000
[000e30b6]                           dc.w $0000
[000e30b8]                           dc.w $0017
[000e30ba]                           dc.w $0001
[000e30bc]                           dc.w $0000
[000e30be]                           dc.w $0000
[000e30c0]                           dc.w $0000
[000e30c2]                           dc.w $0000
[000e30c4]                           dc.w $0000
[000e30c6]                           dc.w $0000
[000e30c8]                           dc.w $0000
[000e30ca]                           dc.w $0000
[000e30cc]                           dc.w $0000
[000e30ce]                           dc.w $0000
[000e30d0]                           dc.w $0000
[000e30d2]                           dc.w $0000
[000e30d4]                           dc.w $0000
[000e30d6]                           dc.w $0000
[000e30d8]                           dc.w $0010
[000e30da]                           dc.w $0000
[000e30dc]                           dc.w $0000
[000e30de]                           dc.w $0000
[000e30e0]                           dc.w $0000
[000e30e2]                           dc.w $0000
[000e30e4]                           dc.w $0000
[000e30e6]                           dc.w $0000
[000e30e8]                           dc.w $0000
[000e30ea]                           dc.w $0000
[000e30ec]                           dc.w $0000
[000e30ee]                           dc.w $0000
[000e30f0]                           dc.w $0000
[000e30f2]                           dc.w $0000
[000e30f4]                           dc.w $0000
[000e30f6]                           dc.w $0000
[000e30f8]                           dc.w $0019
[000e30fa]                           dc.w $0001
[000e30fc]                           dc.w $0000
[000e30fe]                           dc.w $0000
[000e3100]                           dc.w $0000
[000e3102]                           dc.w $0000
[000e3104]                           dc.w $0000
[000e3106]                           dc.w $0000
[000e3108]                           dc.w $0000
[000e310a]                           dc.w $0000
[000e310c]                           dc.w $0000
[000e310e]                           dc.w $0000
[000e3110]                           dc.w $0000
[000e3112]                           dc.w $0000
[000e3114]                           dc.w $0000
[000e3116]                           dc.w $0000
[000e3118]                           dc.w $0010
[000e311a]                           dc.w $0000
[000e311c]                           dc.w $0000
[000e311e]                           dc.w $0000
[000e3120]                           dc.w $0000
[000e3122]                           dc.w $0000
[000e3124]                           dc.w $0000
[000e3126]                           dc.w $0000
[000e3128]                           dc.w $0000
[000e312a]                           dc.w $0000
[000e312c]                           dc.w $0000
[000e312e]                           dc.w $0000
[000e3130]                           dc.w $0000
[000e3132]                           dc.w $0000
[000e3134]                           dc.w $0000
[000e3136]                           dc.w $0000
[000e3138]                           dc.w $001a
[000e313a]                           dc.w $0001
[000e313c]                           dc.w $0000
[000e313e]                           dc.w $0000
[000e3140]                           dc.w $0000
[000e3142]                           dc.w $0000
[000e3144]                           dc.w $0000
[000e3146]                           dc.w $0000
[000e3148]                           dc.w $0000
[000e314a]                           dc.w $0000
[000e314c]                           dc.w $0000
[000e314e]                           dc.w $0000
[000e3150]                           dc.w $0000
[000e3152]                           dc.w $0000
[000e3154]                           dc.w $0000
[000e3156]                           dc.w $0000
[000e3158]                           dc.w $0001
[000e315a]                           dc.w $0000
[000e315c]                           dc.w $0000
[000e315e]                           dc.w $0000
[000e3160]                           dc.w $0000
[000e3162]                           dc.w $0000
[000e3164]                           dc.w $0000
[000e3166]                           dc.w $0000
[000e3168]                           dc.w $0000
[000e316a]                           dc.w $0000
[000e316c]                           dc.w $0000
[000e316e]                           dc.w $0000
[000e3170]                           dc.w $0000
[000e3172]                           dc.w $0000
[000e3174]                           dc.w $0000
[000e3176]                           dc.w $0000
[000e3178]                           dc.w $0000
[000e317a]                           dc.w $0000
[000e317c]                           dc.w $0000
[000e317e]                           dc.w $0000
[000e3180]                           dc.w $0000
[000e3182]                           dc.w $0000
[000e3184]                           dc.w $0000
[000e3186]                           dc.w $0000
[000e3188]                           dc.w $0000
[000e318a]                           dc.w $0000
[000e318c]                           dc.w $0000
[000e318e]                           dc.w $0000
[000e3190]                           dc.w $0000
[000e3192]                           dc.w $0000
[000e3194]                           dc.w $0000
[000e3196]                           dc.w $0000
[000e3198]                           dc.w $0010
[000e319a]                           dc.w $0000
[000e319c]                           dc.w $0000
[000e319e]                           dc.w $0000
[000e31a0]                           dc.w $0000
[000e31a2]                           dc.w $0000
[000e31a4]                           dc.w $0000
[000e31a6]                           dc.w $0000
[000e31a8]                           dc.w $0000
[000e31aa]                           dc.w $0000
[000e31ac]                           dc.w $0000
[000e31ae]                           dc.w $0000
[000e31b0]                           dc.w $0000
[000e31b2]                           dc.w $0000
[000e31b4]                           dc.w $0000
[000e31b6]                           dc.w $0000
[000e31b8]                           dc.w $0015
[000e31ba]                           dc.w $0001
[000e31bc]                           dc.w $0000
[000e31be]                           dc.w $0000
[000e31c0]                           dc.w $0000
[000e31c2]                           dc.w $0000
[000e31c4]                           dc.w $0000
[000e31c6]                           dc.w $0000
[000e31c8]                           dc.w $0000
[000e31ca]                           dc.w $0000
[000e31cc]                           dc.w $0000
[000e31ce]                           dc.w $0000
[000e31d0]                           dc.w $0000
[000e31d2]                           dc.w $0000
[000e31d4]                           dc.w $0000
[000e31d6]                           dc.w $0000
[000e31d8]                           dc.w $0010
[000e31da]                           dc.w $0000
[000e31dc]                           dc.w $0000
[000e31de]                           dc.w $0000
[000e31e0]                           dc.w $0000
[000e31e2]                           dc.w $0000
[000e31e4]                           dc.w $0000
[000e31e6]                           dc.w $0000
[000e31e8]                           dc.w $0000
[000e31ea]                           dc.w $0000
[000e31ec]                           dc.w $0000
[000e31ee]                           dc.w $0000
[000e31f0]                           dc.w $0000
[000e31f2]                           dc.w $0000
[000e31f4]                           dc.w $0000
[000e31f6]                           dc.w $0000
[000e31f8]                           dc.w $001c
[000e31fa]                           dc.w $0001
[000e31fc]                           dc.w $0000
[000e31fe]                           dc.w $0000
[000e3200]                           dc.w $0000
[000e3202]                           dc.w $0000
[000e3204]                           dc.w $0000
[000e3206]                           dc.w $0000
[000e3208]                           dc.w $0000
[000e320a]                           dc.w $0000
[000e320c]                           dc.w $0000
[000e320e]                           dc.w $0000
[000e3210]                           dc.w $0000
[000e3212]                           dc.w $0000
[000e3214]                           dc.w $0000
[000e3216]                           dc.w $0000
[000e3218]                           dc.w $0010
[000e321a]                           dc.w $0000
[000e321c]                           dc.w $0000
[000e321e]                           dc.w $0000
[000e3220]                           dc.w $0000
[000e3222]                           dc.w $0000
[000e3224]                           dc.w $0000
[000e3226]                           dc.w $0000
[000e3228]                           dc.w $0000
[000e322a]                           dc.w $0000
[000e322c]                           dc.w $0000
[000e322e]                           dc.w $0000
[000e3230]                           dc.w $0000
[000e3232]                           dc.w $0000
[000e3234]                           dc.w $0000
[000e3236]                           dc.w $0000
[000e3238]                           dc.w $001b
[000e323a]                           dc.w $0001
[000e323c]                           dc.w $0000
[000e323e]                           dc.w $0000
[000e3240]                           dc.w $0000
[000e3242]                           dc.w $0000
[000e3244]                           dc.w $0000
[000e3246]                           dc.w $0000
[000e3248]                           dc.w $0000
[000e324a]                           dc.w $0000
[000e324c]                           dc.w $0000
[000e324e]                           dc.w $0000
[000e3250]                           dc.w $0000
[000e3252]                           dc.w $0000
[000e3254]                           dc.w $0000
[000e3256]                           dc.w $0000
[000e3258]                           dc.w $0002
[000e325a]                           dc.w $0000
[000e325c]                           dc.w $0000
[000e325e]                           dc.w $0000
[000e3260]                           dc.w $0000
[000e3262]                           dc.w $0000
[000e3264]                           dc.w $0000
[000e3266]                           dc.w $0000
[000e3268]                           dc.w $0000
[000e326a]                           dc.w $0000
[000e326c]                           dc.w $0000
[000e326e]                           dc.w $0000
[000e3270]                           dc.w $0000
[000e3272]                           dc.w $0000
[000e3274]                           dc.w $0000
[000e3276]                           dc.w $0000
[000e3278]                           dc.w $0000
[000e327a]                           dc.w $0000
[000e327c]                           dc.w $0000
[000e327e]                           dc.w $0000
[000e3280]                           dc.w $0000
[000e3282]                           dc.w $0000
[000e3284]                           dc.w $0000
[000e3286]                           dc.w $0000
[000e3288]                           dc.w $0000
[000e328a]                           dc.w $0000
[000e328c]                           dc.w $0000
[000e328e]                           dc.w $0000
[000e3290]                           dc.w $0000
[000e3292]                           dc.w $0000
[000e3294]                           dc.w $0000
[000e3296]                           dc.w $0000
