Aob_create:
[0004f064] 2f0a                      move.l     a2,-(a7)
[0004f066] 4fef ffe6                 lea.l      -26(a7),a7
[0004f06a] 2f48 0016                 move.l     a0,22(a7)
[0004f06e] 42af 0004                 clr.l      4(a7)
[0004f072] 2f00                      move.l     d0,-(a7)
[0004f074] 7001                      moveq.l    #1,d0
[0004f076] 206f 001a                 movea.l    26(a7),a0
[0004f07a] 4eb9 0004 f302            jsr        Aob_count
[0004f080] 48c0                      ext.l      d0
[0004f082] 221f                      move.l     (a7)+,d1
[0004f084] 2200                      move.l     d0,d1
[0004f086] d281                      add.l      d1,d1
[0004f088] d280                      add.l      d0,d1
[0004f08a] e789                      lsl.l      #3,d1
[0004f08c] 2f41 0004                 move.l     d1,4(a7)
[0004f090] 202f 0004                 move.l     4(a7),d0
[0004f094] 4eb9 0004 c608            jsr        Ax_malloc
[0004f09a] 2f48 0012                 move.l     a0,18(a7)
[0004f09e] 6606                      bne.s      $0004F0A6
[0004f0a0] 91c8                      suba.l     a0,a0
[0004f0a2] 6000 015e                 bra        $0004F202
[0004f0a6] 202f 0004                 move.l     4(a7),d0
[0004f0aa] 226f 0016                 movea.l    22(a7),a1
[0004f0ae] 206f 0012                 movea.l    18(a7),a0
[0004f0b2] 4eb9 0008 3500            jsr        memcpy
[0004f0b8] 426f 000c                 clr.w      12(a7)
[0004f0bc] 206f 0012                 movea.l    18(a7),a0
[0004f0c0] 2f48 000e                 move.l     a0,14(a7)
[0004f0c4] 2f48 0008                 move.l     a0,8(a7)
[0004f0c8] 206f 000e                 movea.l    14(a7),a0
[0004f0cc] 3028 0008                 move.w     8(a0),d0
[0004f0d0] c07c 8000                 and.w      #$8000,d0
[0004f0d4] 6600 0112                 bne        $0004F1E8
[0004f0d8] 206f 000e                 movea.l    14(a7),a0
[0004f0dc] 3028 000a                 move.w     10(a0),d0
[0004f0e0] c07c 2000                 and.w      #$2000,d0
[0004f0e4] 6600 0102                 bne        $0004F1E8
[0004f0e8] 206f 000e                 movea.l    14(a7),a0
[0004f0ec] 1028 0007                 move.b     7(a0),d0
[0004f0f0] 4880                      ext.w      d0
[0004f0f2] 907c 0014                 sub.w      #$0014,d0
[0004f0f6] b07c 000d                 cmp.w      #$000D,d0
[0004f0fa] 6200 00e2                 bhi        $0004F1DE
[0004f0fe] d040                      add.w      d0,d0
[0004f100] 303b 0006                 move.w     $0004F108(pc,d0.w),d0
[0004f104] 4efb 0002                 jmp        $0004F108(pc,d0.w)
J36:
[0004f108] 0080                      dc.w $0080   ; $0004f188-$0004f108
[0004f10a] 001c                      dc.w $001c   ; $0004f124-$0004f108
[0004f10c] 001c                      dc.w $001c   ; $0004f124-$0004f108
[0004f10e] 0082                      dc.w $0082   ; $0004f18a-$0004f108
[0004f110] 003a                      dc.w $003a   ; $0004f142-$0004f108
[0004f112] 0080                      dc.w $0080   ; $0004f188-$0004f108
[0004f114] 00ba                      dc.w $00ba   ; $0004f1c2-$0004f108
[0004f116] 0080                      dc.w $0080   ; $0004f188-$0004f108
[0004f118] 00ba                      dc.w $00ba   ; $0004f1c2-$0004f108
[0004f11a] 001c                      dc.w $001c   ; $0004f124-$0004f108
[0004f11c] 001c                      dc.w $001c   ; $0004f124-$0004f108
[0004f11e] 009e                      dc.w $009e   ; $0004f1a6-$0004f108
[0004f120] 00ba                      dc.w $00ba   ; $0004f1c2-$0004f108
[0004f122] 009e                      dc.w $009e   ; $0004f1a6-$0004f108
[0004f124] 206f 000e                 movea.l    14(a7),a0
[0004f128] 2068 000c                 movea.l    12(a0),a0
[0004f12c] 4eb9 0004 fa88            jsr        Ate_create
[0004f132] 2f48 0008                 move.l     a0,8(a7)
[0004f136] 226f 000e                 movea.l    14(a7),a1
[0004f13a] 2348 000c                 move.l     a0,12(a1)
[0004f13e] 6000 009e                 bra        $0004F1DE
[0004f142] 206f 000e                 movea.l    14(a7),a0
[0004f146] 2068 000c                 movea.l    12(a0),a0
[0004f14a] 4eb9 0004 fb5e            jsr        Aus_create
[0004f150] 2e88                      move.l     a0,(a7)
[0004f152] 2f48 0008                 move.l     a0,8(a7)
[0004f156] 226f 000e                 movea.l    14(a7),a1
[0004f15a] 2348 000c                 move.l     a0,12(a1)
[0004f15e] 2057                      movea.l    (a7),a0
[0004f160] 2028 0008                 move.l     8(a0),d0
[0004f164] 6712                      beq.s      $0004F178
[0004f166] 43ef 000c                 lea.l      12(a7),a1
[0004f16a] 7001                      moveq.l    #1,d0
[0004f16c] 206f 000e                 movea.l    14(a7),a0
[0004f170] 2457                      movea.l    (a7),a2
[0004f172] 246a 0008                 movea.l    8(a2),a2
[0004f176] 4e92                      jsr        (a2)
[0004f178] 0c6f ffff 000c            cmpi.w     #$FFFF,12(a7)
[0004f17e] 6606                      bne.s      $0004F186
[0004f180] 91c8                      suba.l     a0,a0
[0004f182] 6000 007e                 bra.w      $0004F202
[0004f186] 6056                      bra.s      $0004F1DE
[0004f188] 6054                      bra.s      $0004F1DE
[0004f18a] 206f 000e                 movea.l    14(a7),a0
[0004f18e] 2068 000c                 movea.l    12(a0),a0
[0004f192] 4eb9 0004 fa4c            jsr        Aim_create
[0004f198] 2f48 0008                 move.l     a0,8(a7)
[0004f19c] 226f 000e                 movea.l    14(a7),a1
[0004f1a0] 2348 000c                 move.l     a0,12(a1)
[0004f1a4] 6038                      bra.s      $0004F1DE
[0004f1a6] 206f 000e                 movea.l    14(a7),a0
[0004f1aa] 2068 000c                 movea.l    12(a0),a0
[0004f1ae] 4eb9 0004 f606            jsr        Aic_create
[0004f1b4] 2f48 0008                 move.l     a0,8(a7)
[0004f1b8] 226f 000e                 movea.l    14(a7),a1
[0004f1bc] 2348 000c                 move.l     a0,12(a1)
[0004f1c0] 601c                      bra.s      $0004F1DE
[0004f1c2] 206f 000e                 movea.l    14(a7),a0
[0004f1c6] 2068 000c                 movea.l    12(a0),a0
[0004f1ca] 4eb9 0004 643c            jsr        Ast_create
[0004f1d0] 2f48 0008                 move.l     a0,8(a7)
[0004f1d4] 226f 000e                 movea.l    14(a7),a1
[0004f1d8] 2348 000c                 move.l     a0,12(a1)
[0004f1dc] 4e71                      nop
[0004f1de] 202f 0008                 move.l     8(a7),d0
[0004f1e2] 6604                      bne.s      $0004F1E8
[0004f1e4] 91c8                      suba.l     a0,a0
[0004f1e6] 601a                      bra.s      $0004F202
[0004f1e8] 7020                      moveq.l    #32,d0
[0004f1ea] 206f 000e                 movea.l    14(a7),a0
[0004f1ee] 06af 0000 0018 000e       addi.l     #$00000018,14(a7)
[0004f1f6] c068 0008                 and.w      8(a0),d0
[0004f1fa] 6700 fecc                 beq        $0004F0C8
[0004f1fe] 206f 0012                 movea.l    18(a7),a0
[0004f202] 4fef 001a                 lea.l      26(a7),a7
[0004f206] 245f                      movea.l    (a7)+,a2
[0004f208] 4e75                      rts
Aob_delete:
[0004f20a] 2f0a                      move.l     a2,-(a7)
[0004f20c] 4fef fff4                 lea.l      -12(a7),a7
[0004f210] 2f48 0008                 move.l     a0,8(a7)
[0004f214] 202f 0008                 move.l     8(a7),d0
[0004f218] 6604                      bne.s      $0004F21E
[0004f21a] 6000 00de                 bra        $0004F2FA
[0004f21e] 2eaf 0008                 move.l     8(a7),(a7)
[0004f222] 2057                      movea.l    (a7),a0
[0004f224] 3028 0008                 move.w     8(a0),d0
[0004f228] c07c 8000                 and.w      #$8000,d0
[0004f22c] 6600 00b0                 bne        $0004F2DE
[0004f230] 2057                      movea.l    (a7),a0
[0004f232] 3028 000a                 move.w     10(a0),d0
[0004f236] c07c 2000                 and.w      #$2000,d0
[0004f23a] 6600 00a2                 bne        $0004F2DE
[0004f23e] 2057                      movea.l    (a7),a0
[0004f240] 1028 0007                 move.b     7(a0),d0
[0004f244] 4880                      ext.w      d0
[0004f246] 907c 0014                 sub.w      #$0014,d0
[0004f24a] b07c 000d                 cmp.w      #$000D,d0
[0004f24e] 6200 008e                 bhi        $0004F2DE
[0004f252] d040                      add.w      d0,d0
[0004f254] 303b 0006                 move.w     $0004F25C(pc,d0.w),d0
[0004f258] 4efb 0002                 jmp        $0004F25C(pc,d0.w)
J37:
[0004f25c] 0082                      dc.w $0082   ; $0004f2de-$0004f25c
[0004f25e] 001c                      dc.w $001c   ; $0004f278-$0004f25c
[0004f260] 001c                      dc.w $001c   ; $0004f278-$0004f25c
[0004f262] 0066                      dc.w $0066   ; $0004f2c2-$0004f25c
[0004f264] 002a                      dc.w $002a   ; $0004f286-$0004f25c
[0004f266] 0082                      dc.w $0082   ; $0004f2de-$0004f25c
[0004f268] 0058                      dc.w $0058   ; $0004f2b4-$0004f25c
[0004f26a] 0082                      dc.w $0082   ; $0004f2de-$0004f25c
[0004f26c] 0058                      dc.w $0058   ; $0004f2b4-$0004f25c
[0004f26e] 001c                      dc.w $001c   ; $0004f278-$0004f25c
[0004f270] 001c                      dc.w $001c   ; $0004f278-$0004f25c
[0004f272] 0074                      dc.w $0074   ; $0004f2d0-$0004f25c
[0004f274] 0058                      dc.w $0058   ; $0004f2b4-$0004f25c
[0004f276] 0074                      dc.w $0074   ; $0004f2d0-$0004f25c
[0004f278] 2057                      movea.l    (a7),a0
[0004f27a] 2068 000c                 movea.l    12(a0),a0
[0004f27e] 4eb9 0004 fb24            jsr        Ate_delete
[0004f284] 6058                      bra.s      $0004F2DE
[0004f286] 2057                      movea.l    (a7),a0
[0004f288] 2f68 000c 0004            move.l     12(a0),4(a7)
[0004f28e] 206f 0004                 movea.l    4(a7),a0
[0004f292] 2028 0008                 move.l     8(a0),d0
[0004f296] 6710                      beq.s      $0004F2A8
[0004f298] 93c9                      suba.l     a1,a1
[0004f29a] 7002                      moveq.l    #2,d0
[0004f29c] 2057                      movea.l    (a7),a0
[0004f29e] 246f 0004                 movea.l    4(a7),a2
[0004f2a2] 246a 0008                 movea.l    8(a2),a2
[0004f2a6] 4e92                      jsr        (a2)
[0004f2a8] 206f 0004                 movea.l    4(a7),a0
[0004f2ac] 4eb9 0004 fbb2            jsr        Aus_delete
[0004f2b2] 602a                      bra.s      $0004F2DE
[0004f2b4] 2057                      movea.l    (a7),a0
[0004f2b6] 2068 000c                 movea.l    12(a0),a0
[0004f2ba] 4eb9 0004 649c            jsr        Ast_delete
[0004f2c0] 601c                      bra.s      $0004F2DE
[0004f2c2] 2057                      movea.l    (a7),a0
[0004f2c4] 2068 000c                 movea.l    12(a0),a0
[0004f2c8] 4eb9 0004 fa76            jsr        Aim_delete
[0004f2ce] 600e                      bra.s      $0004F2DE
[0004f2d0] 2057                      movea.l    (a7),a0
[0004f2d2] 2068 000c                 movea.l    12(a0),a0
[0004f2d6] 4eb9 0004 f99a            jsr        Aic_delete
[0004f2dc] 4e71                      nop
[0004f2de] 7020                      moveq.l    #32,d0
[0004f2e0] 2057                      movea.l    (a7),a0
[0004f2e2] 0697 0000 0018            addi.l     #$00000018,(a7)
[0004f2e8] c068 0008                 and.w      8(a0),d0
[0004f2ec] 6700 ff34                 beq        $0004F222
[0004f2f0] 206f 0008                 movea.l    8(a7),a0
[0004f2f4] 4eb9 0004 c7c8            jsr        Ax_free
[0004f2fa] 4fef 000c                 lea.l      12(a7),a7
[0004f2fe] 245f                      movea.l    (a7)+,a2
[0004f300] 4e75                      rts
Aob_count:
[0004f302] 4fef fff4                 lea.l      -12(a7),a7
[0004f306] 2f48 0008                 move.l     a0,8(a7)
[0004f30a] 3f40 0006                 move.w     d0,6(a7)
[0004f30e] 3ebc 0001                 move.w     #$0001,(a7)
[0004f312] 2f6f 0008 0002            move.l     8(a7),2(a7)
[0004f318] 601e                      bra.s      $0004F338
[0004f31a] 302f 0006                 move.w     6(a7),d0
[0004f31e] 660e                      bne.s      $0004F32E
[0004f320] 206f 0002                 movea.l    2(a7),a0
[0004f324] 3028 0008                 move.w     8(a0),d0
[0004f328] c07c 8000                 and.w      #$8000,d0
[0004f32c] 6602                      bne.s      $0004F330
[0004f32e] 5257                      addq.w     #1,(a7)
[0004f330] 06af 0000 0018 0002       addi.l     #$00000018,2(a7)
[0004f338] 7020                      moveq.l    #32,d0
[0004f33a] 206f 0002                 movea.l    2(a7),a0
[0004f33e] c068 0008                 and.w      8(a0),d0
[0004f342] 67d6                      beq.s      $0004F31A
[0004f344] 5257                      addq.w     #1,(a7)
[0004f346] 3017                      move.w     (a7),d0
[0004f348] 4fef 000c                 lea.l      12(a7),a7
[0004f34c] 4e75                      rts
convert:
[0004f34e] 2f0a                      move.l     a2,-(a7)
[0004f350] 4fef ffcc                 lea.l      -52(a7),a7
[0004f354] 2f48 0030                 move.l     a0,48(a7)
[0004f358] 2f49 002c                 move.l     a1,44(a7)
[0004f35c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f362] 2068 023c                 movea.l    572(a0),a0
[0004f366] 3028 000e                 move.w     14(a0),d0
[0004f36a] c07c 0800                 and.w      #$0800,d0
[0004f36e] 6734                      beq.s      $0004F3A4
[0004f370] 206f 0030                 movea.l    48(a7),a0
[0004f374] 3028 0008                 move.w     8(a0),d0
[0004f378] 206f 0030                 movea.l    48(a7),a0
[0004f37c] c1e8 0006                 muls.w     6(a0),d0
[0004f380] d040                      add.w      d0,d0
[0004f382] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f388] c1e8 001c                 muls.w     28(a0),d0
[0004f38c] 48c0                      ext.l      d0
[0004f38e] 206f 0030                 movea.l    48(a7),a0
[0004f392] 2250                      movea.l    (a0),a1
[0004f394] 206f 002c                 movea.l    44(a7),a0
[0004f398] 2050                      movea.l    (a0),a0
[0004f39a] 4eb9 0008 3500            jsr        memcpy
[0004f3a0] 6000 025c                 bra        $0004F5FE
[0004f3a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f3aa] 7001                      moveq.l    #1,d0
[0004f3ac] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004f3b2] 1229 001d                 move.b     29(a1),d1
[0004f3b6] e368                      lsl.w      d1,d0
[0004f3b8] b068 001a                 cmp.w      26(a0),d0
[0004f3bc] 6700 0228                 beq        $0004F5E6
[0004f3c0] 206f 0030                 movea.l    48(a7),a0
[0004f3c4] 3028 0008                 move.w     8(a0),d0
[0004f3c8] 206f 0030                 movea.l    48(a7),a0
[0004f3cc] c1e8 0006                 muls.w     6(a0),d0
[0004f3d0] 48c0                      ext.l      d0
[0004f3d2] 2f40 0026                 move.l     d0,38(a7)
[0004f3d6] 4240                      clr.w      d0
[0004f3d8] 3f40 0006                 move.w     d0,6(a7)
[0004f3dc] 3f40 0004                 move.w     d0,4(a7)
[0004f3e0] 3f40 0002                 move.w     d0,2(a7)
[0004f3e4] 3e80                      move.w     d0,(a7)
[0004f3e6] 426f 0010                 clr.w      16(a7)
[0004f3ea] 6000 01e8                 bra        $0004F5D4
[0004f3ee] 302f 0010                 move.w     16(a7),d0
[0004f3f2] 3f40 000e                 move.w     d0,14(a7)
[0004f3f6] 3f40 000a                 move.w     d0,10(a7)
[0004f3fa] 302f 0010                 move.w     16(a7),d0
[0004f3fe] 206f 0030                 movea.l    48(a7),a0
[0004f402] c1e8 0008                 muls.w     8(a0),d0
[0004f406] 48c0                      ext.l      d0
[0004f408] 2f40 0022                 move.l     d0,34(a7)
[0004f40c] 426f 0012                 clr.w      18(a7)
[0004f410] 6000 01ae                 bra        $0004F5C0
[0004f414] 302f 0012                 move.w     18(a7),d0
[0004f418] e840                      asr.w      #4,d0
[0004f41a] 48c0                      ext.l      d0
[0004f41c] d0af 0022                 add.l      34(a7),d0
[0004f420] 2f40 001e                 move.l     d0,30(a7)
[0004f424] 202f 001e                 move.l     30(a7),d0
[0004f428] d080                      add.l      d0,d0
[0004f42a] 206f 003c                 movea.l    60(a7),a0
[0004f42e] d1c0                      adda.l     d0,a0
[0004f430] 2f48 0014                 move.l     a0,20(a7)
[0004f434] 202f 001e                 move.l     30(a7),d0
[0004f438] d080                      add.l      d0,d0
[0004f43a] 206f 0030                 movea.l    48(a7),a0
[0004f43e] 2050                      movea.l    (a0),a0
[0004f440] d1c0                      adda.l     d0,a0
[0004f442] 2f48 0018                 move.l     a0,24(a7)
[0004f446] 302f 0012                 move.w     18(a7),d0
[0004f44a] 3f40 000c                 move.w     d0,12(a7)
[0004f44e] 3f40 0008                 move.w     d0,8(a7)
[0004f452] 203c 0000 8000            move.l     #$00008000,d0
[0004f458] 720f                      moveq.l    #15,d1
[0004f45a] c22f 0013                 and.b      19(a7),d1
[0004f45e] e2a0                      asr.l      d1,d0
[0004f460] 3f40 001c                 move.w     d0,28(a7)
[0004f464] 206f 0014                 movea.l    20(a7),a0
[0004f468] 3010                      move.w     (a0),d0
[0004f46a] c06f 001c                 and.w      28(a7),d0
[0004f46e] 6700 0104                 beq        $0004F574
[0004f472] 426f 002a                 clr.w      42(a7)
[0004f476] 206f 0018                 movea.l    24(a7),a0
[0004f47a] 3010                      move.w     (a0),d0
[0004f47c] c06f 001c                 and.w      28(a7),d0
[0004f480] 6704                      beq.s      $0004F486
[0004f482] 526f 002a                 addq.w     #1,42(a7)
[0004f486] 202f 0026                 move.l     38(a7),d0
[0004f48a] d080                      add.l      d0,d0
[0004f48c] d1af 0018                 add.l      d0,24(a7)
[0004f490] 206f 0018                 movea.l    24(a7),a0
[0004f494] 3010                      move.w     (a0),d0
[0004f496] c06f 001c                 and.w      28(a7),d0
[0004f49a] 6704                      beq.s      $0004F4A0
[0004f49c] 546f 002a                 addq.w     #2,42(a7)
[0004f4a0] 202f 0026                 move.l     38(a7),d0
[0004f4a4] d080                      add.l      d0,d0
[0004f4a6] d1af 0018                 add.l      d0,24(a7)
[0004f4aa] 206f 0018                 movea.l    24(a7),a0
[0004f4ae] 3010                      move.w     (a0),d0
[0004f4b0] c06f 001c                 and.w      28(a7),d0
[0004f4b4] 6704                      beq.s      $0004F4BA
[0004f4b6] 586f 002a                 addq.w     #4,42(a7)
[0004f4ba] 202f 0026                 move.l     38(a7),d0
[0004f4be] d080                      add.l      d0,d0
[0004f4c0] d1af 0018                 add.l      d0,24(a7)
[0004f4c4] 206f 0018                 movea.l    24(a7),a0
[0004f4c8] 3010                      move.w     (a0),d0
[0004f4ca] c06f 001c                 and.w      28(a7),d0
[0004f4ce] 6704                      beq.s      $0004F4D4
[0004f4d0] 506f 002a                 addq.w     #8,42(a7)
[0004f4d4] 202f 0026                 move.l     38(a7),d0
[0004f4d8] d080                      add.l      d0,d0
[0004f4da] d1af 0018                 add.l      d0,24(a7)
[0004f4de] 206f 0018                 movea.l    24(a7),a0
[0004f4e2] 3010                      move.w     (a0),d0
[0004f4e4] c06f 001c                 and.w      28(a7),d0
[0004f4e8] 6706                      beq.s      $0004F4F0
[0004f4ea] 066f 0010 002a            addi.w     #$0010,42(a7)
[0004f4f0] 202f 0026                 move.l     38(a7),d0
[0004f4f4] d080                      add.l      d0,d0
[0004f4f6] d1af 0018                 add.l      d0,24(a7)
[0004f4fa] 206f 0018                 movea.l    24(a7),a0
[0004f4fe] 3010                      move.w     (a0),d0
[0004f500] c06f 001c                 and.w      28(a7),d0
[0004f504] 6706                      beq.s      $0004F50C
[0004f506] 066f 0020 002a            addi.w     #$0020,42(a7)
[0004f50c] 202f 0026                 move.l     38(a7),d0
[0004f510] d080                      add.l      d0,d0
[0004f512] d1af 0018                 add.l      d0,24(a7)
[0004f516] 206f 0018                 movea.l    24(a7),a0
[0004f51a] 3010                      move.w     (a0),d0
[0004f51c] c06f 001c                 and.w      28(a7),d0
[0004f520] 6706                      beq.s      $0004F528
[0004f522] 066f 0040 002a            addi.w     #$0040,42(a7)
[0004f528] 202f 0026                 move.l     38(a7),d0
[0004f52c] d080                      add.l      d0,d0
[0004f52e] d1af 0018                 add.l      d0,24(a7)
[0004f532] 206f 0018                 movea.l    24(a7),a0
[0004f536] 3010                      move.w     (a0),d0
[0004f538] c06f 001c                 and.w      28(a7),d0
[0004f53c] 6706                      beq.s      $0004F544
[0004f53e] 066f 0080 002a            addi.w     #$0080,42(a7)
[0004f544] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f54a] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[0004f550] 6c06                      bge.s      $0004F558
[0004f552] 026f 000f 002a            andi.w     #$000F,42(a7)
[0004f558] 0c6f 0010 002a            cmpi.w     #$0010,42(a7)
[0004f55e] 6c12                      bge.s      $0004F572
[0004f560] 302f 002a                 move.w     42(a7),d0
[0004f564] d040                      add.w      d0,d0
[0004f566] 41f9 000e 0c58            lea.l      map,a0
[0004f56c] 3f70 0000 002a            move.w     0(a0,d0.w),42(a7)
[0004f572] 6010                      bra.s      $0004F584
[0004f574] 70ff                      moveq.l    #-1,d0
[0004f576] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f57c] d068 001a                 add.w      26(a0),d0
[0004f580] 3f40 002a                 move.w     d0,42(a7)
[0004f584] 302f 002a                 move.w     42(a7),d0
[0004f588] 33c0 0011 3acc            move.w     d0,col
[0004f58e] 33c0 0011 3ace            move.w     d0,$00113ACE
[0004f594] 4879 0011 3acc            pea.l      col
[0004f59a] 2f2f 0030                 move.l     48(a7),-(a7)
[0004f59e] 43f9 000e 0c7a            lea.l      punkt,a1
[0004f5a4] 41ef 0008                 lea.l      8(a7),a0
[0004f5a8] 7201                      moveq.l    #1,d1
[0004f5aa] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004f5b0] 302a 0010                 move.w     16(a2),d0
[0004f5b4] 4eb9 0007 4902            jsr        vrt_cpyfm
[0004f5ba] 504f                      addq.w     #8,a7
[0004f5bc] 526f 0012                 addq.w     #1,18(a7)
[0004f5c0] 206f 002c                 movea.l    44(a7),a0
[0004f5c4] 302f 0012                 move.w     18(a7),d0
[0004f5c8] b068 0004                 cmp.w      4(a0),d0
[0004f5cc] 6d00 fe46                 blt        $0004F414
[0004f5d0] 526f 0010                 addq.w     #1,16(a7)
[0004f5d4] 206f 002c                 movea.l    44(a7),a0
[0004f5d8] 302f 0010                 move.w     16(a7),d0
[0004f5dc] b068 0006                 cmp.w      6(a0),d0
[0004f5e0] 6d00 fe0c                 blt        $0004F3EE
[0004f5e4] 6018                      bra.s      $0004F5FE
[0004f5e6] 226f 002c                 movea.l    44(a7),a1
[0004f5ea] 206f 0030                 movea.l    48(a7),a0
[0004f5ee] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004f5f4] 302a 0010                 move.w     16(a2),d0
[0004f5f8] 4eb9 0007 4978            jsr        vr_trnfm
[0004f5fe] 4fef 0034                 lea.l      52(a7),a7
[0004f602] 245f                      movea.l    (a7)+,a2
[0004f604] 4e75                      rts
Aic_create:
[0004f606] 4fef ffb2                 lea.l      -78(a7),a7
[0004f60a] 2f48 004a                 move.l     a0,74(a7)
[0004f60e] 7026                      moveq.l    #38,d0
[0004f610] 4eb9 0004 c608            jsr        Ax_malloc
[0004f616] 2f48 0046                 move.l     a0,70(a7)
[0004f61a] 202f 0046                 move.l     70(a7),d0
[0004f61e] 6606                      bne.s      $0004F626
[0004f620] 91c8                      suba.l     a0,a0
[0004f622] 6000 0370                 bra        $0004F994
[0004f626] 7026                      moveq.l    #38,d0
[0004f628] 226f 004a                 movea.l    74(a7),a1
[0004f62c] 206f 0046                 movea.l    70(a7),a0
[0004f630] 4eb9 0008 3500            jsr        memcpy
[0004f636] 206f 004a                 movea.l    74(a7),a0
[0004f63a] 2068 0008                 movea.l    8(a0),a0
[0004f63e] 4eb9 0004 643c            jsr        Ast_create
[0004f644] 226f 0046                 movea.l    70(a7),a1
[0004f648] 2348 0008                 move.l     a0,8(a1)
[0004f64c] 206f 0046                 movea.l    70(a7),a0
[0004f650] 2028 0008                 move.l     8(a0),d0
[0004f654] 6612                      bne.s      $0004F668
[0004f656] 7026                      moveq.l    #38,d0
[0004f658] 206f 0046                 movea.l    70(a7),a0
[0004f65c] 4eb9 0004 cc28            jsr        Ax_recycle
[0004f662] 91c8                      suba.l     a0,a0
[0004f664] 6000 032e                 bra        $0004F994
[0004f668] 42af 003e                 clr.l      62(a7)
[0004f66c] 206f 0046                 movea.l    70(a7),a0
[0004f670] 2f68 0022 0042            move.l     34(a0),66(a7)
[0004f676] 202f 0042                 move.l     66(a7),d0
[0004f67a] 6700 030c                 beq        $0004F988
[0004f67e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f684] 2068 0280                 movea.l    640(a0),a0
[0004f688] 0c50 0330                 cmpi.w     #$0330,(a0)
[0004f68c] 6f10                      ble.s      $0004F69E
[0004f68e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f694] 2068 0280                 movea.l    640(a0),a0
[0004f698] 0c50 0350                 cmpi.w     #$0350,(a0)
[0004f69c] 6d30                      blt.s      $0004F6CE
[0004f69e] 2f39 000e 692a            move.l     _globl,-(a7)
[0004f6a4] 486f 002e                 pea.l      46(a7)
[0004f6a8] 486f 0030                 pea.l      48(a7)
[0004f6ac] 43ef 0036                 lea.l      54(a7),a1
[0004f6b0] 41ef 0036                 lea.l      54(a7),a0
[0004f6b4] 7002                      moveq.l    #2,d0
[0004f6b6] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[0004f6bc] 4fef 000c                 lea.l      12(a7),a7
[0004f6c0] 4a40                      tst.w      d0
[0004f6c2] 6700 02c4                 beq        $0004F988
[0004f6c6] 302f 0028                 move.w     40(a7),d0
[0004f6ca] 6700 02bc                 beq        $0004F988
[0004f6ce] 700f                      moveq.l    #15,d0
[0004f6d0] 206f 0046                 movea.l    70(a7),a0
[0004f6d4] d068 0016                 add.w      22(a0),d0
[0004f6d8] c07c fff0                 and.w      #$FFF0,d0
[0004f6dc] 3f40 002c                 move.w     d0,44(a7)
[0004f6e0] 302f 002c                 move.w     44(a7),d0
[0004f6e4] 206f 0046                 movea.l    70(a7),a0
[0004f6e8] c1e8 0018                 muls.w     24(a0),d0
[0004f6ec] e640                      asr.w      #3,d0
[0004f6ee] 48c0                      ext.l      d0
[0004f6f0] 2f40 0036                 move.l     d0,54(a7)
[0004f6f4] 2f6f 0042 003e            move.l     66(a7),62(a7)
[0004f6fa] 206f 003e                 movea.l    62(a7),a0
[0004f6fe] 2028 0012                 move.l     18(a0),d0
[0004f702] 6720                      beq.s      $0004F724
[0004f704] 206f 003e                 movea.l    62(a7),a0
[0004f708] 2068 0012                 movea.l    18(a0),a0
[0004f70c] 3010                      move.w     (a0),d0
[0004f70e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f714] b068 001c                 cmp.w      28(a0),d0
[0004f718] 6e0a                      bgt.s      $0004F724
[0004f71a] 206f 003e                 movea.l    62(a7),a0
[0004f71e] 2f68 0012 003e            move.l     18(a0),62(a7)
[0004f724] 206f 0046                 movea.l    70(a7),a0
[0004f728] 216f 003e 0022            move.l     62(a7),34(a0)
[0004f72e] 206f 003e                 movea.l    62(a7),a0
[0004f732] 42a8 0012                 clr.l      18(a0)
[0004f736] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f73c] 3028 001c                 move.w     28(a0),d0
[0004f740] 206f 003e                 movea.l    62(a7),a0
[0004f744] b050                      cmp.w      (a0),d0
[0004f746] 6d00 0236                 blt        $0004F97E
[0004f74a] 206f 003e                 movea.l    62(a7),a0
[0004f74e] 2f68 0002 003a            move.l     2(a0),58(a7)
[0004f754] 5daf 003a                 subq.l     #6,58(a7)
[0004f758] 206f 003a                 movea.l    58(a7),a0
[0004f75c] 3010                      move.w     (a0),d0
[0004f75e] 6f40                      ble.s      $0004F7A0
[0004f760] 206f 003a                 movea.l    58(a7),a0
[0004f764] 5250                      addq.w     #1,(a0)
[0004f766] 206f 003a                 movea.l    58(a7),a0
[0004f76a] 5c48                      addq.w     #6,a0
[0004f76c] 226f 003e                 movea.l    62(a7),a1
[0004f770] 2348 0002                 move.l     a0,2(a1)
[0004f774] 206f 003e                 movea.l    62(a7),a0
[0004f778] 2f68 000a 003a            move.l     10(a0),58(a7)
[0004f77e] 202f 003a                 move.l     58(a7),d0
[0004f782] 6718                      beq.s      $0004F79C
[0004f784] 5daf 003a                 subq.l     #6,58(a7)
[0004f788] 206f 003a                 movea.l    58(a7),a0
[0004f78c] 5250                      addq.w     #1,(a0)
[0004f78e] 206f 003a                 movea.l    58(a7),a0
[0004f792] 5c48                      addq.w     #6,a0
[0004f794] 226f 003e                 movea.l    62(a7),a1
[0004f798] 2348 000a                 move.l     a0,10(a1)
[0004f79c] 6000 01de                 bra        $0004F97C
[0004f7a0] 202f 0036                 move.l     54(a7),d0
[0004f7a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f7aa] 3228 001c                 move.w     28(a0),d1
[0004f7ae] 48c1                      ext.l      d1
[0004f7b0] 4eb9 0008 3cac            jsr        _lmul
[0004f7b6] 5c80                      addq.l     #6,d0
[0004f7b8] 2f40 0032                 move.l     d0,50(a7)
[0004f7bc] 202f 0036                 move.l     54(a7),d0
[0004f7c0] 206f 003e                 movea.l    62(a7),a0
[0004f7c4] 3210                      move.w     (a0),d1
[0004f7c6] 48c1                      ext.l      d1
[0004f7c8] 4eb9 0008 3cac            jsr        _lmul
[0004f7ce] 2f40 002e                 move.l     d0,46(a7)
[0004f7d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f7d8] 226f 003e                 movea.l    62(a7),a1
[0004f7dc] 32a8 001c                 move.w     28(a0),(a1)
[0004f7e0] 426f 000a                 clr.w      10(a7)
[0004f7e4] 3f7c 0001 001e            move.w     #$0001,30(a7)
[0004f7ea] 302f 002c                 move.w     44(a7),d0
[0004f7ee] 3f40 0018                 move.w     d0,24(a7)
[0004f7f2] 3f40 0004                 move.w     d0,4(a7)
[0004f7f6] 206f 0046                 movea.l    70(a7),a0
[0004f7fa] 3028 0018                 move.w     24(a0),d0
[0004f7fe] 3f40 001a                 move.w     d0,26(a7)
[0004f802] 3f40 0006                 move.w     d0,6(a7)
[0004f806] 302f 002c                 move.w     44(a7),d0
[0004f80a] e840                      asr.w      #4,d0
[0004f80c] 3f40 001c                 move.w     d0,28(a7)
[0004f810] 3f40 0008                 move.w     d0,8(a7)
[0004f814] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f81a] 3028 001c                 move.w     28(a0),d0
[0004f81e] 3f40 0020                 move.w     d0,32(a7)
[0004f822] 3f40 000c                 move.w     d0,12(a7)
[0004f826] 4240                      clr.w      d0
[0004f828] 3f40 0026                 move.w     d0,38(a7)
[0004f82c] 3f40 0024                 move.w     d0,36(a7)
[0004f830] 3f40 0022                 move.w     d0,34(a7)
[0004f834] 3f40 0012                 move.w     d0,18(a7)
[0004f838] 3f40 0010                 move.w     d0,16(a7)
[0004f83c] 3f40 000e                 move.w     d0,14(a7)
[0004f840] 202f 0032                 move.l     50(a7),d0
[0004f844] 4eb9 0004 c608            jsr        Ax_malloc
[0004f84a] 2f48 003a                 move.l     a0,58(a7)
[0004f84e] 202f 003a                 move.l     58(a7),d0
[0004f852] 6610                      bne.s      $0004F864
[0004f854] 206f 0046                 movea.l    70(a7),a0
[0004f858] 42a8 0022                 clr.l      34(a0)
[0004f85c] 206f 0046                 movea.l    70(a7),a0
[0004f860] 6000 0132                 bra        $0004F994
[0004f864] 2f6f 003a 0014            move.l     58(a7),20(a7)
[0004f86a] 222f 0032                 move.l     50(a7),d1
[0004f86e] 4240                      clr.w      d0
[0004f870] 206f 0014                 movea.l    20(a7),a0
[0004f874] 4eb9 0008 36ea            jsr        memset
[0004f87a] 202f 002e                 move.l     46(a7),d0
[0004f87e] 206f 003e                 movea.l    62(a7),a0
[0004f882] 2268 0002                 movea.l    2(a0),a1
[0004f886] 206f 0014                 movea.l    20(a7),a0
[0004f88a] 4eb9 0008 3500            jsr        memcpy
[0004f890] 202f 0032                 move.l     50(a7),d0
[0004f894] 4eb9 0004 c608            jsr        Ax_malloc
[0004f89a] 2f48 003a                 move.l     a0,58(a7)
[0004f89e] 202f 003a                 move.l     58(a7),d0
[0004f8a2] 6610                      bne.s      $0004F8B4
[0004f8a4] 206f 0046                 movea.l    70(a7),a0
[0004f8a8] 42a8 0022                 clr.l      34(a0)
[0004f8ac] 206f 0046                 movea.l    70(a7),a0
[0004f8b0] 6000 00e2                 bra        $0004F994
[0004f8b4] 206f 003a                 movea.l    58(a7),a0
[0004f8b8] 5c48                      addq.w     #6,a0
[0004f8ba] 2e88                      move.l     a0,(a7)
[0004f8bc] 206f 003a                 movea.l    58(a7),a0
[0004f8c0] 30bc 0001                 move.w     #$0001,(a0)
[0004f8c4] 206f 003e                 movea.l    62(a7),a0
[0004f8c8] 226f 003a                 movea.l    58(a7),a1
[0004f8cc] 2368 0002 0002            move.l     2(a0),2(a1)
[0004f8d2] 206f 003e                 movea.l    62(a7),a0
[0004f8d6] 2f28 0006                 move.l     6(a0),-(a7)
[0004f8da] 43ef 0004                 lea.l      4(a7),a1
[0004f8de] 41ef 0018                 lea.l      24(a7),a0
[0004f8e2] 6100 fa6a                 bsr        convert
[0004f8e6] 584f                      addq.w     #4,a7
[0004f8e8] 206f 003e                 movea.l    62(a7),a0
[0004f8ec] 2157 0002                 move.l     (a7),2(a0)
[0004f8f0] 206f 003e                 movea.l    62(a7),a0
[0004f8f4] 2028 000a                 move.l     10(a0),d0
[0004f8f8] 6778                      beq.s      $0004F972
[0004f8fa] 202f 0032                 move.l     50(a7),d0
[0004f8fe] 4eb9 0004 c608            jsr        Ax_malloc
[0004f904] 2f48 003a                 move.l     a0,58(a7)
[0004f908] 202f 003a                 move.l     58(a7),d0
[0004f90c] 6612                      bne.s      $0004F920
[0004f90e] 206f 003e                 movea.l    62(a7),a0
[0004f912] 42a8 000a                 clr.l      10(a0)
[0004f916] 206f 003e                 movea.l    62(a7),a0
[0004f91a] 42a8 000e                 clr.l      14(a0)
[0004f91e] 6052                      bra.s      $0004F972
[0004f920] 202f 002e                 move.l     46(a7),d0
[0004f924] 206f 003e                 movea.l    62(a7),a0
[0004f928] 2268 000a                 movea.l    10(a0),a1
[0004f92c] 206f 0014                 movea.l    20(a7),a0
[0004f930] 4eb9 0008 3500            jsr        memcpy
[0004f936] 206f 003a                 movea.l    58(a7),a0
[0004f93a] 5c48                      addq.w     #6,a0
[0004f93c] 2e88                      move.l     a0,(a7)
[0004f93e] 206f 003a                 movea.l    58(a7),a0
[0004f942] 30bc 0001                 move.w     #$0001,(a0)
[0004f946] 206f 003e                 movea.l    62(a7),a0
[0004f94a] 226f 003a                 movea.l    58(a7),a1
[0004f94e] 2368 000a 0002            move.l     10(a0),2(a1)
[0004f954] 206f 003e                 movea.l    62(a7),a0
[0004f958] 2f28 000e                 move.l     14(a0),-(a7)
[0004f95c] 43ef 0004                 lea.l      4(a7),a1
[0004f960] 41ef 0018                 lea.l      24(a7),a0
[0004f964] 6100 f9e8                 bsr        convert
[0004f968] 584f                      addq.w     #4,a7
[0004f96a] 206f 003e                 movea.l    62(a7),a0
[0004f96e] 2157 000a                 move.l     (a7),10(a0)
[0004f972] 206f 0014                 movea.l    20(a7),a0
[0004f976] 4eb9 0004 c6c8            jsr        Ax_ifree
[0004f97c] 6008                      bra.s      $0004F986
[0004f97e] 206f 0046                 movea.l    70(a7),a0
[0004f982] 42a8 0022                 clr.l      34(a0)
[0004f986] 6008                      bra.s      $0004F990
[0004f988] 206f 0046                 movea.l    70(a7),a0
[0004f98c] 42a8 0022                 clr.l      34(a0)
[0004f990] 206f 0046                 movea.l    70(a7),a0
[0004f994] 4fef 004e                 lea.l      78(a7),a7
[0004f998] 4e75                      rts
Aic_delete:
[0004f99a] 4fef fff4                 lea.l      -12(a7),a7
[0004f99e] 2f48 0008                 move.l     a0,8(a7)
[0004f9a2] 202f 0008                 move.l     8(a7),d0
[0004f9a6] 6604                      bne.s      $0004F9AC
[0004f9a8] 6000 009c                 bra        $0004FA46
[0004f9ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f9b2] 2068 023c                 movea.l    572(a0),a0
[0004f9b6] 3028 000e                 move.w     14(a0),d0
[0004f9ba] c07c 0800                 and.w      #$0800,d0
[0004f9be] 6704                      beq.s      $0004F9C4
[0004f9c0] 6000 0084                 bra        $0004FA46
[0004f9c4] 206f 0008                 movea.l    8(a7),a0
[0004f9c8] 2f68 0022 0004            move.l     34(a0),4(a7)
[0004f9ce] 202f 0004                 move.l     4(a7),d0
[0004f9d2] 6758                      beq.s      $0004FA2C
[0004f9d4] 206f 0004                 movea.l    4(a7),a0
[0004f9d8] 2ea8 0002                 move.l     2(a0),(a7)
[0004f9dc] 5d97                      subq.l     #6,(a7)
[0004f9de] 2057                      movea.l    (a7),a0
[0004f9e0] 5350                      subq.w     #1,(a0)
[0004f9e2] 2057                      movea.l    (a7),a0
[0004f9e4] 0c50 0001                 cmpi.w     #$0001,(a0)
[0004f9e8] 6c14                      bge.s      $0004F9FE
[0004f9ea] 2057                      movea.l    (a7),a0
[0004f9ec] 226f 0004                 movea.l    4(a7),a1
[0004f9f0] 2368 0002 0002            move.l     2(a0),2(a1)
[0004f9f6] 2057                      movea.l    (a7),a0
[0004f9f8] 4eb9 0004 c6c8            jsr        Ax_ifree
[0004f9fe] 206f 0004                 movea.l    4(a7),a0
[0004fa02] 2ea8 000a                 move.l     10(a0),(a7)
[0004fa06] 2017                      move.l     (a7),d0
[0004fa08] 6722                      beq.s      $0004FA2C
[0004fa0a] 5d97                      subq.l     #6,(a7)
[0004fa0c] 2057                      movea.l    (a7),a0
[0004fa0e] 5350                      subq.w     #1,(a0)
[0004fa10] 2057                      movea.l    (a7),a0
[0004fa12] 0c50 0001                 cmpi.w     #$0001,(a0)
[0004fa16] 6c14                      bge.s      $0004FA2C
[0004fa18] 2057                      movea.l    (a7),a0
[0004fa1a] 226f 0004                 movea.l    4(a7),a1
[0004fa1e] 2368 0002 000a            move.l     2(a0),10(a1)
[0004fa24] 2057                      movea.l    (a7),a0
[0004fa26] 4eb9 0004 c6c8            jsr        Ax_ifree
[0004fa2c] 206f 0008                 movea.l    8(a7),a0
[0004fa30] 2068 0008                 movea.l    8(a0),a0
[0004fa34] 4eb9 0004 649c            jsr        Ast_delete
[0004fa3a] 7026                      moveq.l    #38,d0
[0004fa3c] 206f 0008                 movea.l    8(a7),a0
[0004fa40] 4eb9 0004 cc28            jsr        Ax_recycle
[0004fa46] 4fef 000c                 lea.l      12(a7),a7
[0004fa4a] 4e75                      rts
Aim_create:
[0004fa4c] 514f                      subq.w     #8,a7
[0004fa4e] 2f48 0004                 move.l     a0,4(a7)
[0004fa52] 700e                      moveq.l    #14,d0
[0004fa54] 4eb9 0004 c608            jsr        Ax_malloc
[0004fa5a] 2e88                      move.l     a0,(a7)
[0004fa5c] 6604                      bne.s      $0004FA62
[0004fa5e] 91c8                      suba.l     a0,a0
[0004fa60] 6010                      bra.s      $0004FA72
[0004fa62] 700e                      moveq.l    #14,d0
[0004fa64] 226f 0004                 movea.l    4(a7),a1
[0004fa68] 2057                      movea.l    (a7),a0
[0004fa6a] 4eb9 0008 3500            jsr        memcpy
[0004fa70] 2057                      movea.l    (a7),a0
[0004fa72] 504f                      addq.w     #8,a7
[0004fa74] 4e75                      rts
Aim_delete:
[0004fa76] 594f                      subq.w     #4,a7
[0004fa78] 2e88                      move.l     a0,(a7)
[0004fa7a] 700e                      moveq.l    #14,d0
[0004fa7c] 2057                      movea.l    (a7),a0
[0004fa7e] 4eb9 0004 cc28            jsr        Ax_recycle
[0004fa84] 584f                      addq.w     #4,a7
[0004fa86] 4e75                      rts
Ate_create:
[0004fa88] 514f                      subq.w     #8,a7
[0004fa8a] 2f48 0004                 move.l     a0,4(a7)
[0004fa8e] 701c                      moveq.l    #28,d0
[0004fa90] 4eb9 0004 c608            jsr        Ax_malloc
[0004fa96] 2e88                      move.l     a0,(a7)
[0004fa98] 6606                      bne.s      $0004FAA0
[0004fa9a] 91c8                      suba.l     a0,a0
[0004fa9c] 6000 0082                 bra        $0004FB20
[0004faa0] 701c                      moveq.l    #28,d0
[0004faa2] 226f 0004                 movea.l    4(a7),a1
[0004faa6] 2057                      movea.l    (a7),a0
[0004faa8] 4eb9 0008 3500            jsr        memcpy
[0004faae] 206f 0004                 movea.l    4(a7),a0
[0004fab2] 2050                      movea.l    (a0),a0
[0004fab4] 4eb9 0004 643c            jsr        Ast_create
[0004faba] 2257                      movea.l    (a7),a1
[0004fabc] 2288                      move.l     a0,(a1)
[0004fabe] 206f 0004                 movea.l    4(a7),a0
[0004fac2] 2068 0004                 movea.l    4(a0),a0
[0004fac6] 4eb9 0004 643c            jsr        Ast_create
[0004facc] 2257                      movea.l    (a7),a1
[0004face] 2348 0004                 move.l     a0,4(a1)
[0004fad2] 206f 0004                 movea.l    4(a7),a0
[0004fad6] 2068 0008                 movea.l    8(a0),a0
[0004fada] 4eb9 0004 643c            jsr        Ast_create
[0004fae0] 2257                      movea.l    (a7),a1
[0004fae2] 2348 0008                 move.l     a0,8(a1)
[0004fae6] 2057                      movea.l    (a7),a0
[0004fae8] 2010                      move.l     (a0),d0
[0004faea] 6710                      beq.s      $0004FAFC
[0004faec] 2057                      movea.l    (a7),a0
[0004faee] 2028 0004                 move.l     4(a0),d0
[0004faf2] 6708                      beq.s      $0004FAFC
[0004faf4] 2057                      movea.l    (a7),a0
[0004faf6] 2028 0008                 move.l     8(a0),d0
[0004fafa] 6622                      bne.s      $0004FB1E
[0004fafc] 2057                      movea.l    (a7),a0
[0004fafe] 2050                      movea.l    (a0),a0
[0004fb00] 4eb9 0004 c7c8            jsr        Ax_free
[0004fb06] 2057                      movea.l    (a7),a0
[0004fb08] 2068 0004                 movea.l    4(a0),a0
[0004fb0c] 4eb9 0004 c7c8            jsr        Ax_free
[0004fb12] 2057                      movea.l    (a7),a0
[0004fb14] 4eb9 0004 c7c8            jsr        Ax_free
[0004fb1a] 91c8                      suba.l     a0,a0
[0004fb1c] 6002                      bra.s      $0004FB20
[0004fb1e] 2057                      movea.l    (a7),a0
[0004fb20] 504f                      addq.w     #8,a7
[0004fb22] 4e75                      rts
Ate_delete:
[0004fb24] 594f                      subq.w     #4,a7
[0004fb26] 2e88                      move.l     a0,(a7)
[0004fb28] 2017                      move.l     (a7),d0
[0004fb2a] 6602                      bne.s      $0004FB2E
[0004fb2c] 602c                      bra.s      $0004FB5A
[0004fb2e] 2057                      movea.l    (a7),a0
[0004fb30] 2068 0008                 movea.l    8(a0),a0
[0004fb34] 4eb9 0004 649c            jsr        Ast_delete
[0004fb3a] 2057                      movea.l    (a7),a0
[0004fb3c] 2068 0004                 movea.l    4(a0),a0
[0004fb40] 4eb9 0004 649c            jsr        Ast_delete
[0004fb46] 2057                      movea.l    (a7),a0
[0004fb48] 2050                      movea.l    (a0),a0
[0004fb4a] 4eb9 0004 649c            jsr        Ast_delete
[0004fb50] 701c                      moveq.l    #28,d0
[0004fb52] 2057                      movea.l    (a7),a0
[0004fb54] 4eb9 0004 cc28            jsr        Ax_recycle
[0004fb5a] 584f                      addq.w     #4,a7
[0004fb5c] 4e75                      rts
Aus_create:
[0004fb5e] 514f                      subq.w     #8,a7
[0004fb60] 2f48 0004                 move.l     a0,4(a7)
[0004fb64] 7020                      moveq.l    #32,d0
[0004fb66] 4eb9 0004 c608            jsr        Ax_malloc
[0004fb6c] 2e88                      move.l     a0,(a7)
[0004fb6e] 2017                      move.l     (a7),d0
[0004fb70] 6604                      bne.s      $0004FB76
[0004fb72] 91c8                      suba.l     a0,a0
[0004fb74] 6038                      bra.s      $0004FBAE
[0004fb76] 7020                      moveq.l    #32,d0
[0004fb78] 226f 0004                 movea.l    4(a7),a1
[0004fb7c] 2057                      movea.l    (a7),a0
[0004fb7e] 4eb9 0008 3500            jsr        memcpy
[0004fb84] 206f 0004                 movea.l    4(a7),a0
[0004fb88] 2068 0018                 movea.l    24(a0),a0
[0004fb8c] 4eb9 0004 643c            jsr        Ast_create
[0004fb92] 2257                      movea.l    (a7),a1
[0004fb94] 2348 0018                 move.l     a0,24(a1)
[0004fb98] 206f 0004                 movea.l    4(a7),a0
[0004fb9c] 2068 001c                 movea.l    28(a0),a0
[0004fba0] 4eb9 0004 643c            jsr        Ast_create
[0004fba6] 2257                      movea.l    (a7),a1
[0004fba8] 2348 001c                 move.l     a0,28(a1)
[0004fbac] 2057                      movea.l    (a7),a0
[0004fbae] 504f                      addq.w     #8,a7
[0004fbb0] 4e75                      rts
Aus_delete:
[0004fbb2] 594f                      subq.w     #4,a7
[0004fbb4] 2e88                      move.l     a0,(a7)
[0004fbb6] 2057                      movea.l    (a7),a0
[0004fbb8] 2068 001c                 movea.l    28(a0),a0
[0004fbbc] 4eb9 0004 649c            jsr        Ast_delete
[0004fbc2] 2057                      movea.l    (a7),a0
[0004fbc4] 2068 0018                 movea.l    24(a0),a0
[0004fbc8] 4eb9 0004 649c            jsr        Ast_delete
[0004fbce] 7020                      moveq.l    #32,d0
[0004fbd0] 2057                      movea.l    (a7),a0
[0004fbd2] 4eb9 0004 cc28            jsr        Ax_recycle
[0004fbd8] 584f                      addq.w     #4,a7
[0004fbda] 4e75                      rts
Aob_fix:
[0004fbdc] 4fef fff0                 lea.l      -16(a7),a7
[0004fbe0] 2f48 000c                 move.l     a0,12(a7)
[0004fbe4] 206f 000c                 movea.l    12(a7),a0
[0004fbe8] 3028 000a                 move.w     10(a0),d0
[0004fbec] c07c 8000                 and.w      #$8000,d0
[0004fbf0] 6704                      beq.s      $0004FBF6
[0004fbf2] 6000 017c                 bra        $0004FD70
[0004fbf6] 206f 000c                 movea.l    12(a7),a0
[0004fbfa] 0068 8000 000a            ori.w      #$8000,10(a0)
[0004fc00] 206f 000c                 movea.l    12(a7),a0
[0004fc04] 3028 0008                 move.w     8(a0),d0
[0004fc08] c07c 8000                 and.w      #$8000,d0
[0004fc0c] 6600 014c                 bne        $0004FD5A
[0004fc10] 206f 000c                 movea.l    12(a7),a0
[0004fc14] 1028 0007                 move.b     7(a0),d0
[0004fc18] 4880                      ext.w      d0
[0004fc1a] 907c 0017                 sub.w      #$0017,d0
[0004fc1e] 6700 00c4                 beq        $0004FCE4
[0004fc22] 5140                      subq.w     #8,d0
[0004fc24] 6708                      beq.s      $0004FC2E
[0004fc26] 5540                      subq.w     #2,d0
[0004fc28] 670e                      beq.s      $0004FC38
[0004fc2a] 6000 011c                 bra        $0004FD48
[0004fc2e] 206f 000c                 movea.l    12(a7),a0
[0004fc32] 4eb9 0004 fd76            jsr        Aob_icon
[0004fc38] 2279 000e 692a            movea.l    _globl,a1
[0004fc3e] 4240                      clr.w      d0
[0004fc40] 206f 000c                 movea.l    12(a7),a0
[0004fc44] 4eb9 0007 bbd8            jsr        mt_rsrc_obfix
[0004fc4a] 206f 000c                 movea.l    12(a7),a0
[0004fc4e] 2ea8 000c                 move.l     12(a0),(a7)
[0004fc52] 2057                      movea.l    (a7),a0
[0004fc54] 3028 0012                 move.w     18(a0),d0
[0004fc58] 2057                      movea.l    (a7),a0
[0004fc5a] d068 0016                 add.w      22(a0),d0
[0004fc5e] 3f40 000a                 move.w     d0,10(a7)
[0004fc62] 2057                      movea.l    (a7),a0
[0004fc64] 3028 001a                 move.w     26(a0),d0
[0004fc68] 2057                      movea.l    (a7),a0
[0004fc6a] d068 001e                 add.w      30(a0),d0
[0004fc6e] 3f40 0008                 move.w     d0,8(a7)
[0004fc72] 302f 0008                 move.w     8(a7),d0
[0004fc76] b06f 000a                 cmp.w      10(a7),d0
[0004fc7a] 6f06                      ble.s      $0004FC82
[0004fc7c] 3f6f 0008 000a            move.w     8(a7),10(a7)
[0004fc82] 206f 000c                 movea.l    12(a7),a0
[0004fc86] 3028 0014                 move.w     20(a0),d0
[0004fc8a] b06f 000a                 cmp.w      10(a7),d0
[0004fc8e] 6c0a                      bge.s      $0004FC9A
[0004fc90] 206f 000c                 movea.l    12(a7),a0
[0004fc94] 316f 000a 0014            move.w     10(a7),20(a0)
[0004fc9a] 2057                      movea.l    (a7),a0
[0004fc9c] 3028 0014                 move.w     20(a0),d0
[0004fca0] 2057                      movea.l    (a7),a0
[0004fca2] d068 0018                 add.w      24(a0),d0
[0004fca6] 3f40 000a                 move.w     d0,10(a7)
[0004fcaa] 2057                      movea.l    (a7),a0
[0004fcac] 3028 001c                 move.w     28(a0),d0
[0004fcb0] 2057                      movea.l    (a7),a0
[0004fcb2] d068 0020                 add.w      32(a0),d0
[0004fcb6] 3f40 0008                 move.w     d0,8(a7)
[0004fcba] 302f 0008                 move.w     8(a7),d0
[0004fcbe] b06f 000a                 cmp.w      10(a7),d0
[0004fcc2] 6f06                      ble.s      $0004FCCA
[0004fcc4] 3f6f 0008 000a            move.w     8(a7),10(a7)
[0004fcca] 206f 000c                 movea.l    12(a7),a0
[0004fcce] 3028 0016                 move.w     22(a0),d0
[0004fcd2] b06f 000a                 cmp.w      10(a7),d0
[0004fcd6] 6c0a                      bge.s      $0004FCE2
[0004fcd8] 206f 000c                 movea.l    12(a7),a0
[0004fcdc] 316f 000a 0016            move.w     10(a7),22(a0)
[0004fce2] 6076                      bra.s      $0004FD5A
[0004fce4] 2279 000e 692a            movea.l    _globl,a1
[0004fcea] 4240                      clr.w      d0
[0004fcec] 206f 000c                 movea.l    12(a7),a0
[0004fcf0] 4eb9 0007 bbd8            jsr        mt_rsrc_obfix
[0004fcf6] 206f 000c                 movea.l    12(a7),a0
[0004fcfa] 2f68 000c 0004            move.l     12(a0),4(a7)
[0004fd00] 206f 0004                 movea.l    4(a7),a0
[0004fd04] 3028 0004                 move.w     4(a0),d0
[0004fd08] e748                      lsl.w      #3,d0
[0004fd0a] 3f40 000a                 move.w     d0,10(a7)
[0004fd0e] 206f 000c                 movea.l    12(a7),a0
[0004fd12] 3028 0014                 move.w     20(a0),d0
[0004fd16] b06f 000a                 cmp.w      10(a7),d0
[0004fd1a] 6c0a                      bge.s      $0004FD26
[0004fd1c] 206f 000c                 movea.l    12(a7),a0
[0004fd20] 316f 000a 0014            move.w     10(a7),20(a0)
[0004fd26] 206f 000c                 movea.l    12(a7),a0
[0004fd2a] 3028 0016                 move.w     22(a0),d0
[0004fd2e] 206f 0004                 movea.l    4(a7),a0
[0004fd32] b068 0006                 cmp.w      6(a0),d0
[0004fd36] 6c0e                      bge.s      $0004FD46
[0004fd38] 206f 0004                 movea.l    4(a7),a0
[0004fd3c] 226f 000c                 movea.l    12(a7),a1
[0004fd40] 3368 0006 0016            move.w     6(a0),22(a1)
[0004fd46] 6012                      bra.s      $0004FD5A
[0004fd48] 2279 000e 692a            movea.l    _globl,a1
[0004fd4e] 4240                      clr.w      d0
[0004fd50] 206f 000c                 movea.l    12(a7),a0
[0004fd54] 4eb9 0007 bbd8            jsr        mt_rsrc_obfix
[0004fd5a] 7020                      moveq.l    #32,d0
[0004fd5c] 206f 000c                 movea.l    12(a7),a0
[0004fd60] 06af 0000 0018 000c       addi.l     #$00000018,12(a7)
[0004fd68] c068 0008                 and.w      8(a0),d0
[0004fd6c] 6700 fe92                 beq        $0004FC00
[0004fd70] 4fef 0010                 lea.l      16(a7),a7
[0004fd74] 4e75                      rts
Aob_icon:
[0004fd76] 4fef fff4                 lea.l      -12(a7),a7
[0004fd7a] 2f48 0008                 move.l     a0,8(a7)
[0004fd7e] 206f 0008                 movea.l    8(a7),a0
[0004fd82] 2f68 000c 0004            move.l     12(a0),4(a7)
[0004fd88] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004fd8e] 0c68 0001 001c            cmpi.w     #$0001,28(a0)
[0004fd94] 6f60                      ble.s      $0004FDF6
[0004fd96] 206f 0004                 movea.l    4(a7),a0
[0004fd9a] 2028 0022                 move.l     34(a0),d0
[0004fd9e] 6756                      beq.s      $0004FDF6
[0004fda0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004fda6] 2068 0280                 movea.l    640(a0),a0
[0004fdaa] 0c50 0330                 cmpi.w     #$0330,(a0)
[0004fdae] 6f10                      ble.s      $0004FDC0
[0004fdb0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004fdb6] 2068 0280                 movea.l    640(a0),a0
[0004fdba] 0c50 0350                 cmpi.w     #$0350,(a0)
[0004fdbe] 6d2a                      blt.s      $0004FDEA
[0004fdc0] 2f39 000e 692a            move.l     _globl,-(a7)
[0004fdc6] 486f 0006                 pea.l      6(a7)
[0004fdca] 486f 0008                 pea.l      8(a7)
[0004fdce] 43ef 000e                 lea.l      14(a7),a1
[0004fdd2] 41ef 000e                 lea.l      14(a7),a0
[0004fdd6] 7002                      moveq.l    #2,d0
[0004fdd8] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[0004fdde] 4fef 000c                 lea.l      12(a7),a7
[0004fde2] 4a40                      tst.w      d0
[0004fde4] 6710                      beq.s      $0004FDF6
[0004fde6] 3017                      move.w     (a7),d0
[0004fde8] 670c                      beq.s      $0004FDF6
[0004fdea] 206f 0008                 movea.l    8(a7),a0
[0004fdee] 317c 0021 0006            move.w     #$0021,6(a0)
[0004fdf4] 600a                      bra.s      $0004FE00
[0004fdf6] 206f 0008                 movea.l    8(a7),a0
[0004fdfa] 317c 001f 0006            move.w     #$001F,6(a0)
[0004fe00] 4fef 000c                 lea.l      12(a7),a7
[0004fe04] 4e75                      rts
Aob_offset:
[0004fe06] 4fef ffe6                 lea.l      -26(a7),a7
[0004fe0a] 2f48 0016                 move.l     a0,22(a7)
[0004fe0e] 2f49 0012                 move.l     a1,18(a7)
[0004fe12] 3f40 0010                 move.w     d0,16(a7)
[0004fe16] 322f 0010                 move.w     16(a7),d1
[0004fe1a] 48c1                      ext.l      d1
[0004fe1c] 2001                      move.l     d1,d0
[0004fe1e] d080                      add.l      d0,d0
[0004fe20] d081                      add.l      d1,d0
[0004fe22] e788                      lsl.l      #3,d0
[0004fe24] 206f 0012                 movea.l    18(a7),a0
[0004fe28] d1c0                      adda.l     d0,a0
[0004fe2a] 2f48 0008                 move.l     a0,8(a7)
[0004fe2e] 426f 0002                 clr.w      2(a7)
[0004fe32] 206f 0008                 movea.l    8(a7),a0
[0004fe36] 1028 0007                 move.b     7(a0),d0
[0004fe3a] 4880                      ext.w      d0
[0004fe3c] 907c 0014                 sub.w      #$0014,d0
[0004fe40] b07c 000a                 cmp.w      #$000A,d0
[0004fe44] 6200 010c                 bhi        $0004FF52
[0004fe48] d040                      add.w      d0,d0
[0004fe4a] 303b 0006                 move.w     $0004FE52(pc,d0.w),d0
[0004fe4e] 4efb 0002                 jmp        $0004FE52(pc,d0.w)
J38:
[0004fe52] 0016                      dc.w $0016   ; $0004fe68-$0004fe52
[0004fe54] 002e                      dc.w $002e   ; $0004fe80-$0004fe52
[0004fe56] 002e                      dc.w $002e   ; $0004fe80-$0004fe52
[0004fe58] 0100                      dc.w $0100   ; $0004ff52-$0004fe52
[0004fe5a] 0074                      dc.w $0074   ; $0004fec6-$0004fe52
[0004fe5c] 0016                      dc.w $0016   ; $0004fe68-$0004fe52
[0004fe5e] 0044                      dc.w $0044   ; $0004fe96-$0004fe52
[0004fe60] 0016                      dc.w $0016   ; $0004fe68-$0004fe52
[0004fe62] 0100                      dc.w $0100   ; $0004ff52-$0004fe52
[0004fe64] 002e                      dc.w $002e   ; $0004fe80-$0004fe52
[0004fe66] 002e                      dc.w $002e   ; $0004fe80-$0004fe52
[0004fe68] 206f 0008                 movea.l    8(a7),a0
[0004fe6c] 2028 000c                 move.l     12(a0),d0
[0004fe70] 7210                      moveq.l    #16,d1
[0004fe72] e2a0                      asr.l      d1,d0
[0004fe74] 4880                      ext.w      d0
[0004fe76] 4440                      neg.w      d0
[0004fe78] 3f40 0002                 move.w     d0,2(a7)
[0004fe7c] 6000 00d4                 bra        $0004FF52
[0004fe80] 206f 0008                 movea.l    8(a7),a0
[0004fe84] 2068 000c                 movea.l    12(a0),a0
[0004fe88] 3028 0016                 move.w     22(a0),d0
[0004fe8c] 4440                      neg.w      d0
[0004fe8e] 3f40 0002                 move.w     d0,2(a7)
[0004fe92] 6000 00be                 bra        $0004FF52
[0004fe96] 3f7c 0001 0002            move.w     #$0001,2(a7)
[0004fe9c] 7004                      moveq.l    #4,d0
[0004fe9e] 206f 0008                 movea.l    8(a7),a0
[0004fea2] c068 0008                 and.w      8(a0),d0
[0004fea6] 6706                      beq.s      $0004FEAE
[0004fea8] 3f7c 0002 0002            move.w     #$0002,2(a7)
[0004feae] 206f 0008                 movea.l    8(a7),a0
[0004feb2] 3028 0008                 move.w     8(a0),d0
[0004feb6] c07c 4002                 and.w      #$4002,d0
[0004feba] 6706                      beq.s      $0004FEC2
[0004febc] 3f7c 0003 0002            move.w     #$0003,2(a7)
[0004fec2] 6000 008e                 bra        $0004FF52
[0004fec6] 206f 0008                 movea.l    8(a7),a0
[0004feca] 2f68 000c 000c            move.l     12(a0),12(a7)
[0004fed0] 206f 000c                 movea.l    12(a7),a0
[0004fed4] 2050                      movea.l    (a0),a0
[0004fed6] b1fc 0006 4a22            cmpa.l     #A_3Dbutton,a0
[0004fedc] 666e                      bne.s      $0004FF4C
[0004fede] 206f 000c                 movea.l    12(a7),a0
[0004fee2] 2028 0004                 move.l     4(a0),d0
[0004fee6] 7214                      moveq.l    #20,d1
[0004fee8] e2a0                      asr.l      d1,d0
[0004feea] c07c 000f                 and.w      #$000F,d0
[0004feee] 3f40 0002                 move.w     d0,2(a7)
[0004fef2] 0c6f 0007 0002            cmpi.w     #$0007,2(a7)
[0004fef8] 6f06                      ble.s      $0004FF00
[0004fefa] 066f fff0 0002            addi.w     #$FFF0,2(a7)
[0004ff00] 206f 000c                 movea.l    12(a7),a0
[0004ff04] 2028 0004                 move.l     4(a0),d0
[0004ff08] 7210                      moveq.l    #16,d1
[0004ff0a] e2a0                      asr.l      d1,d0
[0004ff0c] c07c 000f                 and.w      #$000F,d0
[0004ff10] 3f40 0004                 move.w     d0,4(a7)
[0004ff14] 302f 0004                 move.w     4(a7),d0
[0004ff18] 6f12                      ble.s      $0004FF2C
[0004ff1a] 206f 0008                 movea.l    8(a7),a0
[0004ff1e] 3028 0008                 move.w     8(a0),d0
[0004ff22] c07c 4002                 and.w      #$4002,d0
[0004ff26] 6704                      beq.s      $0004FF2C
[0004ff28] 526f 0004                 addq.w     #1,4(a7)
[0004ff2c] 7005                      moveq.l    #5,d0
[0004ff2e] 206f 0008                 movea.l    8(a7),a0
[0004ff32] c068 0008                 and.w      8(a0),d0
[0004ff36] 5b40                      subq.w     #5,d0
[0004ff38] 6604                      bne.s      $0004FF3E
[0004ff3a] 526f 0004                 addq.w     #1,4(a7)
[0004ff3e] 302f 0004                 move.w     4(a7),d0
[0004ff42] d06f 0002                 add.w      2(a7),d0
[0004ff46] 3f40 0002                 move.w     d0,2(a7)
[0004ff4a] 6006                      bra.s      $0004FF52
[0004ff4c] 3f7c 0001 0002            move.w     #$0001,2(a7)
[0004ff52] 302f 0002                 move.w     2(a7),d0
[0004ff56] 6a04                      bpl.s      $0004FF5C
[0004ff58] 426f 0002                 clr.w      2(a7)
[0004ff5c] 7010                      moveq.l    #16,d0
[0004ff5e] 206f 0008                 movea.l    8(a7),a0
[0004ff62] c068 000a                 and.w      10(a0),d0
[0004ff66] 670e                      beq.s      $0004FF76
[0004ff68] 0c6f 0003 0002            cmpi.w     #$0003,2(a7)
[0004ff6e] 6c06                      bge.s      $0004FF76
[0004ff70] 3f7c 0003 0002            move.w     #$0003,2(a7)
[0004ff76] 206f 0008                 movea.l    8(a7),a0
[0004ff7a] 3028 0008                 move.w     8(a0),d0
[0004ff7e] c07c 4008                 and.w      #$4008,d0
[0004ff82] 670e                      beq.s      $0004FF92
[0004ff84] 0c6f 0003 0002            cmpi.w     #$0003,2(a7)
[0004ff8a] 6c06                      bge.s      $0004FF92
[0004ff8c] 3f7c 0003 0002            move.w     #$0003,2(a7)
[0004ff92] 4257                      clr.w      (a7)
[0004ff94] 7020                      moveq.l    #32,d0
[0004ff96] 206f 0008                 movea.l    8(a7),a0
[0004ff9a] c068 000a                 and.w      10(a0),d0
[0004ff9e] 671a                      beq.s      $0004FFBA
[0004ffa0] 302f 0002                 move.w     2(a7),d0
[0004ffa4] 6f0a                      ble.s      $0004FFB0
[0004ffa6] 302f 0002                 move.w     2(a7),d0
[0004ffaa] d040                      add.w      d0,d0
[0004ffac] 3e80                      move.w     d0,(a7)
[0004ffae] 600a                      bra.s      $0004FFBA
[0004ffb0] 302f 0002                 move.w     2(a7),d0
[0004ffb4] 4440                      neg.w      d0
[0004ffb6] d040                      add.w      d0,d0
[0004ffb8] 3e80                      move.w     d0,(a7)
[0004ffba] 206f 0008                 movea.l    8(a7),a0
[0004ffbe] 3028 0010                 move.w     16(a0),d0
[0004ffc2] 906f 0002                 sub.w      2(a7),d0
[0004ffc6] 206f 0016                 movea.l    22(a7),a0
[0004ffca] 3080                      move.w     d0,(a0)
[0004ffcc] 206f 0008                 movea.l    8(a7),a0
[0004ffd0] 3028 0012                 move.w     18(a0),d0
[0004ffd4] 906f 0002                 sub.w      2(a7),d0
[0004ffd8] 206f 0016                 movea.l    22(a7),a0
[0004ffdc] 3140 0002                 move.w     d0,2(a0)
[0004ffe0] 302f 0002                 move.w     2(a7),d0
[0004ffe4] d040                      add.w      d0,d0
[0004ffe6] 206f 0008                 movea.l    8(a7),a0
[0004ffea] d068 0014                 add.w      20(a0),d0
[0004ffee] d057                      add.w      (a7),d0
[0004fff0] 206f 0016                 movea.l    22(a7),a0
[0004fff4] 3140 0004                 move.w     d0,4(a0)
[0004fff8] 302f 0002                 move.w     2(a7),d0
[0004fffc] d040                      add.w      d0,d0
[0004fffe] 206f 0008                 movea.l    8(a7),a0
[00050002] d068 0016                 add.w      22(a0),d0
[00050006] d057                      add.w      (a7),d0
[00050008] 206f 0016                 movea.l    22(a7),a0
[0005000c] 3140 0006                 move.w     d0,6(a0)
[00050010] 6000 0080                 bra        $00050092
[00050014] 3f6f 0010 0006            move.w     16(a7),6(a7)
[0005001a] 322f 0006                 move.w     6(a7),d1
[0005001e] 48c1                      ext.l      d1
[00050020] 2001                      move.l     d1,d0
[00050022] d080                      add.l      d0,d0
[00050024] d081                      add.l      d1,d0
[00050026] e788                      lsl.l      #3,d0
[00050028] 206f 0012                 movea.l    18(a7),a0
[0005002c] 3f70 0800 0010            move.w     0(a0,d0.l),16(a7)
[00050032] 0c6f ffff 0010            cmpi.w     #$FFFF,16(a7)
[00050038] 6602                      bne.s      $0005003C
[0005003a] 605a                      bra.s      $00050096
[0005003c] 322f 0010                 move.w     16(a7),d1
[00050040] 48c1                      ext.l      d1
[00050042] 2001                      move.l     d1,d0
[00050044] d080                      add.l      d0,d0
[00050046] d081                      add.l      d1,d0
[00050048] e788                      lsl.l      #3,d0
[0005004a] 206f 0012                 movea.l    18(a7),a0
[0005004e] 322f 0006                 move.w     6(a7),d1
[00050052] b270 0804                 cmp.w      4(a0,d0.l),d1
[00050056] 663a                      bne.s      $00050092
[00050058] 322f 0010                 move.w     16(a7),d1
[0005005c] 48c1                      ext.l      d1
[0005005e] 2001                      move.l     d1,d0
[00050060] d080                      add.l      d0,d0
[00050062] d081                      add.l      d1,d0
[00050064] e788                      lsl.l      #3,d0
[00050066] 206f 0012                 movea.l    18(a7),a0
[0005006a] 3030 0810                 move.w     16(a0,d0.l),d0
[0005006e] 206f 0016                 movea.l    22(a7),a0
[00050072] d150                      add.w      d0,(a0)
[00050074] 322f 0010                 move.w     16(a7),d1
[00050078] 48c1                      ext.l      d1
[0005007a] 2001                      move.l     d1,d0
[0005007c] d080                      add.l      d0,d0
[0005007e] d081                      add.l      d1,d0
[00050080] e788                      lsl.l      #3,d0
[00050082] 206f 0012                 movea.l    18(a7),a0
[00050086] 3030 0812                 move.w     18(a0,d0.l),d0
[0005008a] 206f 0016                 movea.l    22(a7),a0
[0005008e] d168 0002                 add.w      d0,2(a0)
[00050092] 6000 ff80                 bra.w      $00050014
[00050096] 4fef 001a                 lea.l      26(a7),a7
[0005009a] 4e75                      rts
Aob_save:
[0005009c] 2f0a                      move.l     a2,-(a7)
[0005009e] 4fef ffe6                 lea.l      -26(a7),a7
[000500a2] 2f48 0016                 move.l     a0,22(a7)
[000500a6] 206f 0016                 movea.l    22(a7),a0
[000500aa] 3010                      move.w     (a0),d0
[000500ac] 6a14                      bpl.s      $000500C2
[000500ae] 206f 0016                 movea.l    22(a7),a0
[000500b2] 3010                      move.w     (a0),d0
[000500b4] 206f 0016                 movea.l    22(a7),a0
[000500b8] 9168 0004                 sub.w      d0,4(a0)
[000500bc] 206f 0016                 movea.l    22(a7),a0
[000500c0] 4250                      clr.w      (a0)
[000500c2] 206f 0016                 movea.l    22(a7),a0
[000500c6] 3028 0002                 move.w     2(a0),d0
[000500ca] 6a18                      bpl.s      $000500E4
[000500cc] 206f 0016                 movea.l    22(a7),a0
[000500d0] 3028 0002                 move.w     2(a0),d0
[000500d4] 206f 0016                 movea.l    22(a7),a0
[000500d8] 9168 0006                 sub.w      d0,6(a0)
[000500dc] 206f 0016                 movea.l    22(a7),a0
[000500e0] 4268 0002                 clr.w      2(a0)
[000500e4] 206f 0016                 movea.l    22(a7),a0
[000500e8] 3010                      move.w     (a0),d0
[000500ea] 206f 0016                 movea.l    22(a7),a0
[000500ee] d068 0004                 add.w      4(a0),d0
[000500f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000500f8] 9068 000c                 sub.w      12(a0),d0
[000500fc] 3e80                      move.w     d0,(a7)
[000500fe] 3017                      move.w     (a7),d0
[00050100] 6f0a                      ble.s      $0005010C
[00050102] 3017                      move.w     (a7),d0
[00050104] 206f 0016                 movea.l    22(a7),a0
[00050108] 9168 0004                 sub.w      d0,4(a0)
[0005010c] 206f 0016                 movea.l    22(a7),a0
[00050110] 3028 0002                 move.w     2(a0),d0
[00050114] 206f 0016                 movea.l    22(a7),a0
[00050118] d068 0006                 add.w      6(a0),d0
[0005011c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050122] 9068 000a                 sub.w      10(a0),d0
[00050126] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005012c] 9068 000e                 sub.w      14(a0),d0
[00050130] 3e80                      move.w     d0,(a7)
[00050132] 3017                      move.w     (a7),d0
[00050134] 6f0a                      ble.s      $00050140
[00050136] 3017                      move.w     (a7),d0
[00050138] 206f 0016                 movea.l    22(a7),a0
[0005013c] 9168 0006                 sub.w      d0,6(a0)
[00050140] 303c fff8                 move.w     #$FFF8,d0
[00050144] 206f 0016                 movea.l    22(a7),a0
[00050148] c050                      and.w      (a0),d0
[0005014a] 3f40 0002                 move.w     d0,2(a7)
[0005014e] 206f 0016                 movea.l    22(a7),a0
[00050152] 3f68 0002 0004            move.w     2(a0),4(a7)
[00050158] 206f 0016                 movea.l    22(a7),a0
[0005015c] 3010                      move.w     (a0),d0
[0005015e] 206f 0016                 movea.l    22(a7),a0
[00050162] d068 0004                 add.w      4(a0),d0
[00050166] 807c 0007                 or.w       #$0007,d0
[0005016a] 3f40 0006                 move.w     d0,6(a7)
[0005016e] 206f 0016                 movea.l    22(a7),a0
[00050172] 3028 0002                 move.w     2(a0),d0
[00050176] 206f 0016                 movea.l    22(a7),a0
[0005017a] d068 0006                 add.w      6(a0),d0
[0005017e] 5340                      subq.w     #1,d0
[00050180] 3f40 0008                 move.w     d0,8(a7)
[00050184] 206f 0016                 movea.l    22(a7),a0
[00050188] 3228 0006                 move.w     6(a0),d1
[0005018c] 302f 0006                 move.w     6(a7),d0
[00050190] 906f 0002                 sub.w      2(a7),d0
[00050194] 5240                      addq.w     #1,d0
[00050196] 4eb9 0005 4b6e            jsr        Abp_create
[0005019c] 2f48 0012                 move.l     a0,18(a7)
[000501a0] 6604                      bne.s      $000501A6
[000501a2] 91c8                      suba.l     a0,a0
[000501a4] 6070                      bra.s      $00050216
[000501a6] 426f 000a                 clr.w      10(a7)
[000501aa] 426f 000c                 clr.w      12(a7)
[000501ae] 302f 0006                 move.w     6(a7),d0
[000501b2] 906f 0002                 sub.w      2(a7),d0
[000501b6] 3f40 000e                 move.w     d0,14(a7)
[000501ba] 70ff                      moveq.l    #-1,d0
[000501bc] 206f 0016                 movea.l    22(a7),a0
[000501c0] d068 0006                 add.w      6(a0),d0
[000501c4] 3f40 0010                 move.w     d0,16(a7)
[000501c8] 2279 000e 692a            movea.l    _globl,a1
[000501ce] 91c8                      suba.l     a0,a0
[000501d0] 303c 0100                 move.w     #$0100,d0
[000501d4] 4eb9 0007 abe4            jsr        mt_graf_mouse
[000501da] 2f2f 0012                 move.l     18(a7),-(a7)
[000501de] 2279 0010 ee4e            movea.l    ACSblk,a1
[000501e4] 43e9 026a                 lea.l      618(a1),a1
[000501e8] 41ef 0006                 lea.l      6(a7),a0
[000501ec] 7203                      moveq.l    #3,d1
[000501ee] 2479 0010 ee4e            movea.l    ACSblk,a2
[000501f4] 302a 0010                 move.w     16(a2),d0
[000501f8] 4eb9 0007 489e            jsr        vro_cpyfm
[000501fe] 584f                      addq.w     #4,a7
[00050200] 2279 000e 692a            movea.l    _globl,a1
[00050206] 91c8                      suba.l     a0,a0
[00050208] 303c 0101                 move.w     #$0101,d0
[0005020c] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00050212] 206f 0012                 movea.l    18(a7),a0
[00050216] 4fef 001a                 lea.l      26(a7),a7
[0005021a] 245f                      movea.l    (a7)+,a2
[0005021c] 4e75                      rts
Aob_restore:
[0005021e] 2f0a                      move.l     a2,-(a7)
[00050220] 4fef ffe8                 lea.l      -24(a7),a7
[00050224] 2f48 0014                 move.l     a0,20(a7)
[00050228] 2f49 0010                 move.l     a1,16(a7)
[0005022c] 41f9 000e 0c8e            lea.l      $000E0C8E,a0
[00050232] 43d7                      lea.l      (a7),a1
[00050234] 700f                      moveq.l    #15,d0
[00050236] 12d8                      move.b     (a0)+,(a1)+
[00050238] 51c8 fffc                 dbf        d0,$00050236
[0005023c] 202f 0014                 move.l     20(a7),d0
[00050240] 661e                      bne.s      $00050260
[00050242] 206f 0010                 movea.l    16(a7),a0
[00050246] 72ff                      moveq.l    #-1,d1
[00050248] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005024e] 3011                      move.w     (a1),d0
[00050250] 4eb9 0005 eb60            jsr        Aev_WmRedraw
[00050256] 4eb9 0004 b086            jsr        Aev_mess
[0005025c] 6000 00ce                 bra        $0005032C
[00050260] 303c fff8                 move.w     #$FFF8,d0
[00050264] 206f 0010                 movea.l    16(a7),a0
[00050268] c050                      and.w      (a0),d0
[0005026a] 3f40 0008                 move.w     d0,8(a7)
[0005026e] 206f 0010                 movea.l    16(a7),a0
[00050272] 3f68 0002 000a            move.w     2(a0),10(a7)
[00050278] 206f 0010                 movea.l    16(a7),a0
[0005027c] 3010                      move.w     (a0),d0
[0005027e] 206f 0010                 movea.l    16(a7),a0
[00050282] d068 0004                 add.w      4(a0),d0
[00050286] 807c 0007                 or.w       #$0007,d0
[0005028a] 3f40 000c                 move.w     d0,12(a7)
[0005028e] 206f 0010                 movea.l    16(a7),a0
[00050292] 3028 0002                 move.w     2(a0),d0
[00050296] 206f 0010                 movea.l    16(a7),a0
[0005029a] d068 0006                 add.w      6(a0),d0
[0005029e] 5340                      subq.w     #1,d0
[000502a0] 3f40 000e                 move.w     d0,14(a7)
[000502a4] 4257                      clr.w      (a7)
[000502a6] 426f 0002                 clr.w      2(a7)
[000502aa] 302f 000c                 move.w     12(a7),d0
[000502ae] 906f 0008                 sub.w      8(a7),d0
[000502b2] 3f40 0004                 move.w     d0,4(a7)
[000502b6] 70ff                      moveq.l    #-1,d0
[000502b8] 206f 0010                 movea.l    16(a7),a0
[000502bc] d068 0006                 add.w      6(a0),d0
[000502c0] 3f40 0006                 move.w     d0,6(a7)
[000502c4] 41d7                      lea.l      (a7),a0
[000502c6] 4241                      clr.w      d1
[000502c8] 2279 0010 ee4e            movea.l    ACSblk,a1
[000502ce] 3029 0010                 move.w     16(a1),d0
[000502d2] 4eb9 0007 2230            jsr        vs_clip
[000502d8] 2279 000e 692a            movea.l    _globl,a1
[000502de] 91c8                      suba.l     a0,a0
[000502e0] 303c 0100                 move.w     #$0100,d0
[000502e4] 4eb9 0007 abe4            jsr        mt_graf_mouse
[000502ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[000502f0] 4868 026a                 pea.l      618(a0)
[000502f4] 226f 0018                 movea.l    24(a7),a1
[000502f8] 41ef 0004                 lea.l      4(a7),a0
[000502fc] 7203                      moveq.l    #3,d1
[000502fe] 2479 0010 ee4e            movea.l    ACSblk,a2
[00050304] 302a 0010                 move.w     16(a2),d0
[00050308] 4eb9 0007 489e            jsr        vro_cpyfm
[0005030e] 584f                      addq.w     #4,a7
[00050310] 2279 000e 692a            movea.l    _globl,a1
[00050316] 91c8                      suba.l     a0,a0
[00050318] 303c 0101                 move.w     #$0101,d0
[0005031c] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00050322] 206f 0014                 movea.l    20(a7),a0
[00050326] 4eb9 0005 4c04            jsr        Abp_delete
[0005032c] 4fef 0018                 lea.l      24(a7),a7
[00050330] 245f                      movea.l    (a7)+,a2
[00050332] 4e75                      rts
Aob_tobkey:
[00050334] 4fef fff0                 lea.l      -16(a7),a7
[00050338] 2f48 000c                 move.l     a0,12(a7)
[0005033c] 3f40 000a                 move.w     d0,10(a7)
[00050340] 3f41 0008                 move.w     d1,8(a7)
[00050344] 206f 000c                 movea.l    12(a7),a0
[00050348] 2f68 0018 0004            move.l     24(a0),4(a7)
[0005034e] 670e                      beq.s      $0005035E
[00050350] 206f 000c                 movea.l    12(a7),a0
[00050354] 3028 0056                 move.w     86(a0),d0
[00050358] c07c 0800                 and.w      #$0800,d0
[0005035c] 6704                      beq.s      $00050362
[0005035e] 70ff                      moveq.l    #-1,d0
[00050360] 6068                      bra.s      $000503CA
[00050362] 322f 0008                 move.w     8(a7),d1
[00050366] 302f 000a                 move.w     10(a7),d0
[0005036a] 206f 0004                 movea.l    4(a7),a0
[0005036e] 4eb9 0005 0ce8            jsr        Aob_key
[00050374] 3f40 0002                 move.w     d0,2(a7)
[00050378] 302f 0002                 move.w     2(a7),d0
[0005037c] 6a04                      bpl.s      $00050382
[0005037e] 70ff                      moveq.l    #-1,d0
[00050380] 6048                      bra.s      $000503CA
[00050382] 322f 0002                 move.w     2(a7),d1
[00050386] 48c1                      ext.l      d1
[00050388] 2001                      move.l     d1,d0
[0005038a] d080                      add.l      d0,d0
[0005038c] d081                      add.l      d1,d0
[0005038e] e788                      lsl.l      #3,d0
[00050390] 206f 0004                 movea.l    4(a7),a0
[00050394] 3030 0808                 move.w     8(a0,d0.l),d0
[00050398] c07c 2000                 and.w      #$2000,d0
[0005039c] 6706                      beq.s      $000503A4
[0005039e] 3ebc 0001                 move.w     #$0001,(a7)
[000503a2] 6002                      bra.s      $000503A6
[000503a4] 4257                      clr.w      (a7)
[000503a6] 3217                      move.w     (a7),d1
[000503a8] 302f 0002                 move.w     2(a7),d0
[000503ac] 226f 0004                 movea.l    4(a7),a1
[000503b0] 206f 000c                 movea.l    12(a7),a0
[000503b4] 4eb9 0005 0696            jsr        Aob_select
[000503ba] 4a40                      tst.w      d0
[000503bc] 6f0a                      ble.s      $000503C8
[000503be] 302f 0002                 move.w     2(a7),d0
[000503c2] 807c 1000                 or.w       #$1000,d0
[000503c6] 6002                      bra.s      $000503CA
[000503c8] 70ff                      moveq.l    #-1,d0
[000503ca] 4fef 0010                 lea.l      16(a7),a7
[000503ce] 4e75                      rts
Aob_wobkey:
[000503d0] 4fef fff0                 lea.l      -16(a7),a7
[000503d4] 2f48 000c                 move.l     a0,12(a7)
[000503d8] 3f40 000a                 move.w     d0,10(a7)
[000503dc] 3f41 0008                 move.w     d1,8(a7)
[000503e0] 206f 000c                 movea.l    12(a7),a0
[000503e4] 2f68 0014 0004            move.l     20(a0),4(a7)
[000503ea] 202f 0004                 move.l     4(a7),d0
[000503ee] 670e                      beq.s      $000503FE
[000503f0] 206f 000c                 movea.l    12(a7),a0
[000503f4] 3028 0056                 move.w     86(a0),d0
[000503f8] c07c 0800                 and.w      #$0800,d0
[000503fc] 6704                      beq.s      $00050402
[000503fe] 70ff                      moveq.l    #-1,d0
[00050400] 6064                      bra.s      $00050466
[00050402] 322f 0008                 move.w     8(a7),d1
[00050406] 302f 000a                 move.w     10(a7),d0
[0005040a] 206f 0004                 movea.l    4(a7),a0
[0005040e] 4eb9 0005 0ce8            jsr        Aob_key
[00050414] 3f40 0002                 move.w     d0,2(a7)
[00050418] 302f 0002                 move.w     2(a7),d0
[0005041c] 6a04                      bpl.s      $00050422
[0005041e] 70ff                      moveq.l    #-1,d0
[00050420] 6044                      bra.s      $00050466
[00050422] 322f 0002                 move.w     2(a7),d1
[00050426] 48c1                      ext.l      d1
[00050428] 2001                      move.l     d1,d0
[0005042a] d080                      add.l      d0,d0
[0005042c] d081                      add.l      d1,d0
[0005042e] e788                      lsl.l      #3,d0
[00050430] 206f 0004                 movea.l    4(a7),a0
[00050434] 3030 0808                 move.w     8(a0,d0.l),d0
[00050438] c07c 2000                 and.w      #$2000,d0
[0005043c] 6706                      beq.s      $00050444
[0005043e] 3ebc 0001                 move.w     #$0001,(a7)
[00050442] 6002                      bra.s      $00050446
[00050444] 4257                      clr.w      (a7)
[00050446] 3217                      move.w     (a7),d1
[00050448] 302f 0002                 move.w     2(a7),d0
[0005044c] 226f 0004                 movea.l    4(a7),a1
[00050450] 206f 000c                 movea.l    12(a7),a0
[00050454] 4eb9 0005 0696            jsr        Aob_select
[0005045a] 4a40                      tst.w      d0
[0005045c] 6706                      beq.s      $00050464
[0005045e] 302f 0002                 move.w     2(a7),d0
[00050462] 6002                      bra.s      $00050466
[00050464] 70ff                      moveq.l    #-1,d0
[00050466] 4fef 0010                 lea.l      16(a7),a7
[0005046a] 4e75                      rts
Aob_execute:
[0005046c] 4fef ffec                 lea.l      -20(a7),a7
[00050470] 2f48 0010                 move.l     a0,16(a7)
[00050474] 2f49 000c                 move.l     a1,12(a7)
[00050478] 3f40 000a                 move.w     d0,10(a7)
[0005047c] 3eaf 000a                 move.w     10(a7),(a7)
[00050480] 302f 000a                 move.w     10(a7),d0
[00050484] 6a06                      bpl.s      $0005048C
[00050486] 70ff                      moveq.l    #-1,d0
[00050488] 6000 016a                 bra        $000505F4
[0005048c] 322f 000a                 move.w     10(a7),d1
[00050490] 48c1                      ext.l      d1
[00050492] 2001                      move.l     d1,d0
[00050494] d080                      add.l      d0,d0
[00050496] d081                      add.l      d1,d0
[00050498] e788                      lsl.l      #3,d0
[0005049a] 206f 000c                 movea.l    12(a7),a0
[0005049e] d1c0                      adda.l     d0,a0
[000504a0] 2f48 0002                 move.l     a0,2(a7)
[000504a4] 206f 0002                 movea.l    2(a7),a0
[000504a8] 41e8 0018                 lea.l      24(a0),a0
[000504ac] 2f48 0006                 move.l     a0,6(a7)
[000504b0] 206f 0010                 movea.l    16(a7),a0
[000504b4] 226f 000c                 movea.l    12(a7),a1
[000504b8] b3e8 0018                 cmpa.l     24(a0),a1
[000504bc] 6604                      bne.s      $000504C2
[000504be] 0057 1000                 ori.w      #$1000,(a7)
[000504c2] 7040                      moveq.l    #64,d0
[000504c4] 206f 0002                 movea.l    2(a7),a0
[000504c8] c068 0008                 and.w      8(a0),d0
[000504cc] 671c                      beq.s      $000504EA
[000504ce] 206f 0006                 movea.l    6(a7),a0
[000504d2] 2010                      move.l     (a0),d0
[000504d4] 670e                      beq.s      $000504E4
[000504d6] 206f 0006                 movea.l    6(a7),a0
[000504da] 3028 0008                 move.w     8(a0),d0
[000504de] c07c 8000                 and.w      #$8000,d0
[000504e2] 6606                      bne.s      $000504EA
[000504e4] 4240                      clr.w      d0
[000504e6] 6000 010c                 bra        $000505F4
[000504ea] 7005                      moveq.l    #5,d0
[000504ec] 206f 0002                 movea.l    2(a7),a0
[000504f0] c068 0008                 and.w      8(a0),d0
[000504f4] 5b40                      subq.w     #5,d0
[000504f6] 6618                      bne.s      $00050510
[000504f8] 7001                      moveq.l    #1,d0
[000504fa] 206f 0002                 movea.l    2(a7),a0
[000504fe] c068 000a                 and.w      10(a0),d0
[00050502] 660c                      bne.s      $00050510
[00050504] 3017                      move.w     (a7),d0
[00050506] 206f 0010                 movea.l    16(a7),a0
[0005050a] 4eb9 0004 7e6a            jsr        Adr_add
[00050510] 7020                      moveq.l    #32,d0
[00050512] 206f 0002                 movea.l    2(a7),a0
[00050516] c068 0008                 and.w      8(a0),d0
[0005051a] 6600 0088                 bne        $000505A4
[0005051e] 206f 0006                 movea.l    6(a7),a0
[00050522] 3028 0008                 move.w     8(a0),d0
[00050526] c07c 8000                 and.w      #$8000,d0
[0005052a] 6700 0078                 beq.w      $000505A4
[0005052e] 206f 0006                 movea.l    6(a7),a0
[00050532] 2010                      move.l     (a0),d0
[00050534] 676e                      beq.s      $000505A4
[00050536] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005053c] 216f 0010 0258            move.l     16(a7),600(a0)
[00050542] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050548] 216f 000c 025c            move.l     12(a7),604(a0)
[0005054e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050554] 316f 000a 0260            move.w     10(a7),608(a0)
[0005055a] 7040                      moveq.l    #64,d0
[0005055c] 206f 0002                 movea.l    2(a7),a0
[00050560] c068 0008                 and.w      8(a0),d0
[00050564] 670a                      beq.s      $00050570
[00050566] 206f 0006                 movea.l    6(a7),a0
[0005056a] 2050                      movea.l    (a0),a0
[0005056c] 4e90                      jsr        (a0)
[0005056e] 6014                      bra.s      $00050584
[00050570] 4eb9 0004 eec0            jsr        Amo_busy
[00050576] 206f 0006                 movea.l    6(a7),a0
[0005057a] 2050                      movea.l    (a0),a0
[0005057c] 4e90                      jsr        (a0)
[0005057e] 4eb9 0004 ef0c            jsr        Amo_unbusy
[00050584] 206f 0010                 movea.l    16(a7),a0
[00050588] 226f 000c                 movea.l    12(a7),a1
[0005058c] b3e8 0014                 cmpa.l     20(a0),a1
[00050590] 6712                      beq.s      $000505A4
[00050592] 206f 0010                 movea.l    16(a7),a0
[00050596] 226f 000c                 movea.l    12(a7),a1
[0005059a] b3e8 0018                 cmpa.l     24(a0),a1
[0005059e] 6704                      beq.s      $000505A4
[000505a0] 70ff                      moveq.l    #-1,d0
[000505a2] 6050                      bra.s      $000505F4
[000505a4] 7005                      moveq.l    #5,d0
[000505a6] 206f 0002                 movea.l    2(a7),a0
[000505aa] c068 0008                 and.w      8(a0),d0
[000505ae] 5b40                      subq.w     #5,d0
[000505b0] 6640                      bne.s      $000505F2
[000505b2] 7001                      moveq.l    #1,d0
[000505b4] 206f 0002                 movea.l    2(a7),a0
[000505b8] c068 000a                 and.w      10(a0),d0
[000505bc] 6734                      beq.s      $000505F2
[000505be] 3017                      move.w     (a7),d0
[000505c0] 206f 0010                 movea.l    16(a7),a0
[000505c4] 4eb9 0004 7f76            jsr        Adr_del
[000505ca] 7001                      moveq.l    #1,d0
[000505cc] 206f 0002                 movea.l    2(a7),a0
[000505d0] c068 000a                 and.w      10(a0),d0
[000505d4] 671c                      beq.s      $000505F2
[000505d6] 206f 0002                 movea.l    2(a7),a0
[000505da] 3228 000a                 move.w     10(a0),d1
[000505de] c27c fffe                 and.w      #$FFFE,d1
[000505e2] 3017                      move.w     (a7),d0
[000505e4] 206f 0010                 movea.l    16(a7),a0
[000505e8] 226f 0010                 movea.l    16(a7),a1
[000505ec] 2269 0066                 movea.l    102(a1),a1
[000505f0] 4e91                      jsr        (a1)
[000505f2] 7001                      moveq.l    #1,d0
[000505f4] 4fef 0014                 lea.l      20(a7),a7
[000505f8] 4e75                      rts
Aob_alias:
[000505fa] 4fef fff2                 lea.l      -14(a7),a7
[000505fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050604] 2f68 0258 000a            move.l     600(a0),10(a7)
[0005060a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050610] 2f68 025c 0006            move.l     604(a0),6(a7)
[00050616] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005061c] 3ea8 0260                 move.w     608(a0),(a7)
[00050620] 3217                      move.w     (a7),d1
[00050622] 48c1                      ext.l      d1
[00050624] 2001                      move.l     d1,d0
[00050626] d080                      add.l      d0,d0
[00050628] d081                      add.l      d1,d0
[0005062a] e788                      lsl.l      #3,d0
[0005062c] 206f 0006                 movea.l    6(a7),a0
[00050630] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00050634] 2f48 0002                 move.l     a0,2(a7)
[00050638] 3217                      move.w     (a7),d1
[0005063a] 48c1                      ext.l      d1
[0005063c] 2001                      move.l     d1,d0
[0005063e] d080                      add.l      d0,d0
[00050640] d081                      add.l      d1,d0
[00050642] e788                      lsl.l      #3,d0
[00050644] 206f 0006                 movea.l    6(a7),a0
[00050648] 3030 080a                 move.w     10(a0,d0.l),d0
[0005064c] c07c 4000                 and.w      #$4000,d0
[00050650] 6704                      beq.s      $00050656
[00050652] 7201                      moveq.l    #1,d1
[00050654] 6002                      bra.s      $00050658
[00050656] 4241                      clr.w      d1
[00050658] 206f 0002                 movea.l    2(a7),a0
[0005065c] 3028 000e                 move.w     14(a0),d0
[00050660] 226f 0006                 movea.l    6(a7),a1
[00050664] 206f 000a                 movea.l    10(a7),a0
[00050668] 4eb9 0005 0696            jsr        Aob_select
[0005066e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050674] 216f 000a 0258            move.l     10(a7),600(a0)
[0005067a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050680] 216f 0006 025c            move.l     6(a7),604(a0)
[00050686] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005068c] 3157 0260                 move.w     (a7),608(a0)
[00050690] 4fef 000e                 lea.l      14(a7),a7
[00050694] 4e75                      rts
Aob_select:
[00050696] 4fef ffe8                 lea.l      -24(a7),a7
[0005069a] 2f48 0014                 move.l     a0,20(a7)
[0005069e] 2f49 0010                 move.l     a1,16(a7)
[000506a2] 3f40 000e                 move.w     d0,14(a7)
[000506a6] 3f41 000c                 move.w     d1,12(a7)
[000506aa] 426f 000a                 clr.w      10(a7)
[000506ae] 206f 0014                 movea.l    20(a7),a0
[000506b2] 226f 0010                 movea.l    16(a7),a1
[000506b6] b3e8 0014                 cmpa.l     20(a0),a1
[000506ba] 6608                      bne.s      $000506C4
[000506bc] 3f6f 000e 0004            move.w     14(a7),4(a7)
[000506c2] 600c                      bra.s      $000506D0
[000506c4] 303c 1000                 move.w     #$1000,d0
[000506c8] 806f 000e                 or.w       14(a7),d0
[000506cc] 3f40 0004                 move.w     d0,4(a7)
[000506d0] 322f 000e                 move.w     14(a7),d1
[000506d4] 48c1                      ext.l      d1
[000506d6] 2001                      move.l     d1,d0
[000506d8] d080                      add.l      d0,d0
[000506da] d081                      add.l      d1,d0
[000506dc] e788                      lsl.l      #3,d0
[000506de] 206f 0010                 movea.l    16(a7),a0
[000506e2] d1c0                      adda.l     d0,a0
[000506e4] 2e88                      move.l     a0,(a7)
[000506e6] 303c 0080                 move.w     #$0080,d0
[000506ea] 2057                      movea.l    (a7),a0
[000506ec] c068 0008                 and.w      8(a0),d0
[000506f0] 6706                      beq.s      $000506F8
[000506f2] 4240                      clr.w      d0
[000506f4] 6000 02a8                 bra        $0005099E
[000506f8] 7008                      moveq.l    #8,d0
[000506fa] 2057                      movea.l    (a7),a0
[000506fc] c068 000a                 and.w      10(a0),d0
[00050700] 6706                      beq.s      $00050708
[00050702] 4240                      clr.w      d0
[00050704] 6000 0298                 bra        $0005099E
[00050708] 302f 000c                 move.w     12(a7),d0
[0005070c] 670a                      beq.s      $00050718
[0005070e] 2057                      movea.l    (a7),a0
[00050710] 0068 4000 000a            ori.w      #$4000,10(a0)
[00050716] 6008                      bra.s      $00050720
[00050718] 2057                      movea.l    (a7),a0
[0005071a] 0268 bfff 000a            andi.w     #$BFFF,10(a0)
[00050720] 2057                      movea.l    (a7),a0
[00050722] 3028 0008                 move.w     8(a0),d0
[00050726] c07c 204d                 and.w      #$204D,d0
[0005072a] 5140                      subq.w     #8,d0
[0005072c] 6648                      bne.s      $00050776
[0005072e] 2057                      movea.l    (a7),a0
[00050730] 0c28 0018 0007            cmpi.b     #$18,7(a0)
[00050736] 663e                      bne.s      $00050776
[00050738] 206f 0014                 movea.l    20(a7),a0
[0005073c] 3028 001c                 move.w     28(a0),d0
[00050740] b06f 000e                 cmp.w      14(a7),d0
[00050744] 671a                      beq.s      $00050760
[00050746] 322f 000e                 move.w     14(a7),d1
[0005074a] 206f 0014                 movea.l    20(a7),a0
[0005074e] 3028 001c                 move.w     28(a0),d0
[00050752] 206f 0014                 movea.l    20(a7),a0
[00050756] 4eb9 0005 30a6            jsr        Awi_focuschg
[0005075c] 5340                      subq.w     #1,d0
[0005075e] 6612                      bne.s      $00050772
[00050760] 302f 000e                 move.w     14(a7),d0
[00050764] 226f 0010                 movea.l    16(a7),a1
[00050768] 206f 0014                 movea.l    20(a7),a0
[0005076c] 4eb9 0006 9b74            jsr        Aus_objboxed
[00050772] 426f 000a                 clr.w      10(a7)
[00050776] 2057                      movea.l    (a7),a0
[00050778] 3028 0008                 move.w     8(a0),d0
[0005077c] c07c 2000                 and.w      #$2000,d0
[00050780] 6756                      beq.s      $000507D8
[00050782] 302f 000c                 move.w     12(a7),d0
[00050786] 6722                      beq.s      $000507AA
[00050788] 7004                      moveq.l    #4,d0
[0005078a] 2057                      movea.l    (a7),a0
[0005078c] c068 0008                 and.w      8(a0),d0
[00050790] 6718                      beq.s      $000507AA
[00050792] 4eb9 0004 810e            jsr        Adr_unselect
[00050798] 302f 000e                 move.w     14(a7),d0
[0005079c] 226f 0010                 movea.l    16(a7),a1
[000507a0] 206f 0014                 movea.l    20(a7),a0
[000507a4] 6100 fcc6                 bsr        Aob_execute
[000507a8] 6028                      bra.s      $000507D2
[000507aa] 7001                      moveq.l    #1,d0
[000507ac] 2057                      movea.l    (a7),a0
[000507ae] c068 000a                 and.w      10(a0),d0
[000507b2] 6710                      beq.s      $000507C4
[000507b4] 302f 0004                 move.w     4(a7),d0
[000507b8] 206f 0014                 movea.l    20(a7),a0
[000507bc] 4eb9 0004 7f76            jsr        Adr_del
[000507c2] 600e                      bra.s      $000507D2
[000507c4] 302f 0004                 move.w     4(a7),d0
[000507c8] 206f 0014                 movea.l    20(a7),a0
[000507cc] 4eb9 0004 7e6a            jsr        Adr_add
[000507d2] 7001                      moveq.l    #1,d0
[000507d4] 6000 01c8                 bra        $0005099E
[000507d8] 2057                      movea.l    (a7),a0
[000507da] 3028 0008                 move.w     8(a0),d0
[000507de] 807c ffee                 or.w       #$FFEE,d0
[000507e2] b07c ffff                 cmp.w      #$FFFF,d0
[000507e6] 6600 011e                 bne        $00050906
[000507ea] 7001                      moveq.l    #1,d0
[000507ec] 2057                      movea.l    (a7),a0
[000507ee] c068 000a                 and.w      10(a0),d0
[000507f2] 6600 010c                 bne        $00050900
[000507f6] 302f 000e                 move.w     14(a7),d0
[000507fa] 206f 0010                 movea.l    16(a7),a0
[000507fe] 4eb9 0005 0f3a            jsr        Aob_up
[00050804] 3f40 0008                 move.w     d0,8(a7)
[00050808] 322f 0008                 move.w     8(a7),d1
[0005080c] 48c1                      ext.l      d1
[0005080e] 2001                      move.l     d1,d0
[00050810] d080                      add.l      d0,d0
[00050812] d081                      add.l      d1,d0
[00050814] e788                      lsl.l      #3,d0
[00050816] 206f 0010                 movea.l    16(a7),a0
[0005081a] 3f70 0802 0006            move.w     2(a0,d0.l),6(a7)
[00050820] 6000 00b8                 bra        $000508DA
[00050824] 7010                      moveq.l    #16,d0
[00050826] 342f 0006                 move.w     6(a7),d2
[0005082a] 48c2                      ext.l      d2
[0005082c] 2202                      move.l     d2,d1
[0005082e] d281                      add.l      d1,d1
[00050830] d282                      add.l      d2,d1
[00050832] e789                      lsl.l      #3,d1
[00050834] 206f 0010                 movea.l    16(a7),a0
[00050838] c070 1808                 and.w      8(a0,d1.l),d0
[0005083c] 6700 0084                 beq        $000508C2
[00050840] 7001                      moveq.l    #1,d0
[00050842] 342f 0006                 move.w     6(a7),d2
[00050846] 48c2                      ext.l      d2
[00050848] 2202                      move.l     d2,d1
[0005084a] d281                      add.l      d1,d1
[0005084c] d282                      add.l      d2,d1
[0005084e] e789                      lsl.l      #3,d1
[00050850] 206f 0010                 movea.l    16(a7),a0
[00050854] c070 180a                 and.w      10(a0,d1.l),d0
[00050858] 6768                      beq.s      $000508C2
[0005085a] 302f 0004                 move.w     4(a7),d0
[0005085e] c07c 1000                 and.w      #$1000,d0
[00050862] 6732                      beq.s      $00050896
[00050864] 342f 0006                 move.w     6(a7),d2
[00050868] 48c2                      ext.l      d2
[0005086a] 2002                      move.l     d2,d0
[0005086c] d080                      add.l      d0,d0
[0005086e] d082                      add.l      d2,d0
[00050870] e788                      lsl.l      #3,d0
[00050872] 206f 0010                 movea.l    16(a7),a0
[00050876] 3230 080a                 move.w     10(a0,d0.l),d1
[0005087a] c27c fffe                 and.w      #$FFFE,d1
[0005087e] 302f 0006                 move.w     6(a7),d0
[00050882] 807c 1000                 or.w       #$1000,d0
[00050886] 206f 0014                 movea.l    20(a7),a0
[0005088a] 226f 0014                 movea.l    20(a7),a1
[0005088e] 2269 0066                 movea.l    102(a1),a1
[00050892] 4e91                      jsr        (a1)
[00050894] 602c                      bra.s      $000508C2
[00050896] 342f 0006                 move.w     6(a7),d2
[0005089a] 48c2                      ext.l      d2
[0005089c] 2002                      move.l     d2,d0
[0005089e] d080                      add.l      d0,d0
[000508a0] d082                      add.l      d2,d0
[000508a2] e788                      lsl.l      #3,d0
[000508a4] 206f 0010                 movea.l    16(a7),a0
[000508a8] 3230 080a                 move.w     10(a0,d0.l),d1
[000508ac] c27c fffe                 and.w      #$FFFE,d1
[000508b0] 302f 0006                 move.w     6(a7),d0
[000508b4] 206f 0014                 movea.l    20(a7),a0
[000508b8] 226f 0014                 movea.l    20(a7),a1
[000508bc] 2269 0066                 movea.l    102(a1),a1
[000508c0] 4e91                      jsr        (a1)
[000508c2] 322f 0006                 move.w     6(a7),d1
[000508c6] 48c1                      ext.l      d1
[000508c8] 2001                      move.l     d1,d0
[000508ca] d080                      add.l      d0,d0
[000508cc] d081                      add.l      d1,d0
[000508ce] e788                      lsl.l      #3,d0
[000508d0] 206f 0010                 movea.l    16(a7),a0
[000508d4] 3f70 0800 0006            move.w     0(a0,d0.l),6(a7)
[000508da] 302f 0006                 move.w     6(a7),d0
[000508de] b06f 0008                 cmp.w      8(a7),d0
[000508e2] 6600 ff40                 bne        $00050824
[000508e6] 7201                      moveq.l    #1,d1
[000508e8] 2057                      movea.l    (a7),a0
[000508ea] 8268 000a                 or.w       10(a0),d1
[000508ee] 302f 0004                 move.w     4(a7),d0
[000508f2] 206f 0014                 movea.l    20(a7),a0
[000508f6] 226f 0014                 movea.l    20(a7),a1
[000508fa] 2269 0066                 movea.l    102(a1),a1
[000508fe] 4e91                      jsr        (a1)
[00050900] 3f7c 0001 000a            move.w     #$0001,10(a7)
[00050906] 7005                      moveq.l    #5,d0
[00050908] 2057                      movea.l    (a7),a0
[0005090a] c068 0008                 and.w      8(a0),d0
[0005090e] 5b40                      subq.w     #5,d0
[00050910] 6616                      bne.s      $00050928
[00050912] 302f 000e                 move.w     14(a7),d0
[00050916] 226f 0010                 movea.l    16(a7),a1
[0005091a] 206f 0014                 movea.l    20(a7),a0
[0005091e] 6100 fb4c                 bsr        Aob_execute
[00050922] 7001                      moveq.l    #1,d0
[00050924] 6000 0078                 bra.w      $0005099E
[00050928] 7011                      moveq.l    #17,d0
[0005092a] 2057                      movea.l    (a7),a0
[0005092c] c068 0008                 and.w      8(a0),d0
[00050930] 5340                      subq.w     #1,d0
[00050932] 6622                      bne.s      $00050956
[00050934] 7201                      moveq.l    #1,d1
[00050936] 2057                      movea.l    (a7),a0
[00050938] 3028 000a                 move.w     10(a0),d0
[0005093c] b141                      eor.w      d0,d1
[0005093e] 302f 0004                 move.w     4(a7),d0
[00050942] 206f 0014                 movea.l    20(a7),a0
[00050946] 226f 0014                 movea.l    20(a7),a1
[0005094a] 2269 0066                 movea.l    102(a1),a1
[0005094e] 4e91                      jsr        (a1)
[00050950] 3f7c 0001 000a            move.w     #$0001,10(a7)
[00050956] 7040                      moveq.l    #64,d0
[00050958] 2057                      movea.l    (a7),a0
[0005095a] c068 0008                 and.w      8(a0),d0
[0005095e] 673a                      beq.s      $0005099A
[00050960] 302f 000e                 move.w     14(a7),d0
[00050964] 226f 0010                 movea.l    16(a7),a1
[00050968] 206f 0014                 movea.l    20(a7),a0
[0005096c] 6100 fafe                 bsr        Aob_execute
[00050970] 4a40                      tst.w      d0
[00050972] 6622                      bne.s      $00050996
[00050974] 302f 000c                 move.w     12(a7),d0
[00050978] 671c                      beq.s      $00050996
[0005097a] 206f 0014                 movea.l    20(a7),a0
[0005097e] 3028 0054                 move.w     84(a0),d0
[00050982] c07c 0100                 and.w      #$0100,d0
[00050986] 670e                      beq.s      $00050996
[00050988] 206f 0014                 movea.l    20(a7),a0
[0005098c] 226f 0014                 movea.l    20(a7),a1
[00050990] 2269 006e                 movea.l    110(a1),a1
[00050994] 4e91                      jsr        (a1)
[00050996] 7001                      moveq.l    #1,d0
[00050998] 6004                      bra.s      $0005099E
[0005099a] 302f 000a                 move.w     10(a7),d0
[0005099e] 4fef 0018                 lea.l      24(a7),a7
[000509a2] 4e75                      rts
Aob_watch:
[000509a4] 4fef ffd8                 lea.l      -40(a7),a7
[000509a8] 2f48 0024                 move.l     a0,36(a7)
[000509ac] 3f40 0022                 move.w     d0,34(a7)
[000509b0] 302f 0022                 move.w     34(a7),d0
[000509b4] c07c 1000                 and.w      #$1000,d0
[000509b8] 6718                      beq.s      $000509D2
[000509ba] 206f 0024                 movea.l    36(a7),a0
[000509be] 2f68 0018 0014            move.l     24(a0),20(a7)
[000509c4] 302f 0022                 move.w     34(a7),d0
[000509c8] c07c 0fff                 and.w      #$0FFF,d0
[000509cc] 3f40 0020                 move.w     d0,32(a7)
[000509d0] 6010                      bra.s      $000509E2
[000509d2] 206f 0024                 movea.l    36(a7),a0
[000509d6] 2f68 0014 0014            move.l     20(a0),20(a7)
[000509dc] 3f6f 0022 0020            move.w     34(a7),32(a7)
[000509e2] 2f39 000e 692a            move.l     _globl,-(a7)
[000509e8] 486f 0012                 pea.l      18(a7)
[000509ec] 43ef 0014                 lea.l      20(a7),a1
[000509f0] 302f 0028                 move.w     40(a7),d0
[000509f4] 206f 001c                 movea.l    28(a7),a0
[000509f8] 4eb9 0007 9d14            jsr        mt_objc_offset
[000509fe] 504f                      addq.w     #8,a7
[00050a00] 206f 0024                 movea.l    36(a7),a0
[00050a04] 3028 0034                 move.w     52(a0),d0
[00050a08] d16f 000c                 add.w      d0,12(a7)
[00050a0c] 206f 0024                 movea.l    36(a7),a0
[00050a10] 3028 0036                 move.w     54(a0),d0
[00050a14] d16f 000e                 add.w      d0,14(a7)
[00050a18] 322f 0020                 move.w     32(a7),d1
[00050a1c] 48c1                      ext.l      d1
[00050a1e] 2001                      move.l     d1,d0
[00050a20] d080                      add.l      d0,d0
[00050a22] d081                      add.l      d1,d0
[00050a24] e788                      lsl.l      #3,d0
[00050a26] 206f 0014                 movea.l    20(a7),a0
[00050a2a] 3f70 0814 0010            move.w     20(a0,d0.l),16(a7)
[00050a30] 322f 0020                 move.w     32(a7),d1
[00050a34] 48c1                      ext.l      d1
[00050a36] 2001                      move.l     d1,d0
[00050a38] d080                      add.l      d0,d0
[00050a3a] d081                      add.l      d1,d0
[00050a3c] e788                      lsl.l      #3,d0
[00050a3e] 206f 0014                 movea.l    20(a7),a0
[00050a42] 3f70 0816 0012            move.w     22(a0,d0.l),18(a7)
[00050a48] 322f 0020                 move.w     32(a7),d1
[00050a4c] 48c1                      ext.l      d1
[00050a4e] 2001                      move.l     d1,d0
[00050a50] d080                      add.l      d0,d0
[00050a52] d081                      add.l      d1,d0
[00050a54] e788                      lsl.l      #3,d0
[00050a56] 206f 0014                 movea.l    20(a7),a0
[00050a5a] 3030 0806                 move.w     6(a0,d0.l),d0
[00050a5e] c07c 00ff                 and.w      #$00FF,d0
[00050a62] 3f40 001a                 move.w     d0,26(a7)
[00050a66] b07c 001f                 cmp.w      #$001F,d0
[00050a6a] 6708                      beq.s      $00050A74
[00050a6c] 0c6f 0021 001a            cmpi.w     #$0021,26(a7)
[00050a72] 6668                      bne.s      $00050ADC
[00050a74] 322f 0020                 move.w     32(a7),d1
[00050a78] 48c1                      ext.l      d1
[00050a7a] 2001                      move.l     d1,d0
[00050a7c] d080                      add.l      d0,d0
[00050a7e] d081                      add.l      d1,d0
[00050a80] e788                      lsl.l      #3,d0
[00050a82] 206f 0014                 movea.l    20(a7),a0
[00050a86] 2eb0 080c                 move.l     12(a0,d0.l),(a7)
[00050a8a] 302f 000c                 move.w     12(a7),d0
[00050a8e] 2057                      movea.l    (a7),a0
[00050a90] d068 001a                 add.w      26(a0),d0
[00050a94] 3f40 0004                 move.w     d0,4(a7)
[00050a98] 302f 000e                 move.w     14(a7),d0
[00050a9c] 2057                      movea.l    (a7),a0
[00050a9e] d068 001c                 add.w      28(a0),d0
[00050aa2] 3f40 0006                 move.w     d0,6(a7)
[00050aa6] 2057                      movea.l    (a7),a0
[00050aa8] 3f68 001e 0008            move.w     30(a0),8(a7)
[00050aae] 2057                      movea.l    (a7),a0
[00050ab0] 3f68 0020 000a            move.w     32(a0),10(a7)
[00050ab6] 2057                      movea.l    (a7),a0
[00050ab8] 3028 0012                 move.w     18(a0),d0
[00050abc] d16f 000c                 add.w      d0,12(a7)
[00050ac0] 2057                      movea.l    (a7),a0
[00050ac2] 3028 0014                 move.w     20(a0),d0
[00050ac6] d16f 000e                 add.w      d0,14(a7)
[00050aca] 2057                      movea.l    (a7),a0
[00050acc] 3f68 0016 0010            move.w     22(a0),16(a7)
[00050ad2] 2057                      movea.l    (a7),a0
[00050ad4] 3f68 0018 0012            move.w     24(a0),18(a7)
[00050ada] 6010                      bra.s      $00050AEC
[00050adc] 7008                      moveq.l    #8,d0
[00050ade] 43ef 000c                 lea.l      12(a7),a1
[00050ae2] 41ef 0004                 lea.l      4(a7),a0
[00050ae6] 4eb9 0008 3500            jsr        memcpy
[00050aec] 7201                      moveq.l    #1,d1
[00050aee] 342f 0020                 move.w     32(a7),d2
[00050af2] 48c2                      ext.l      d2
[00050af4] 2002                      move.l     d2,d0
[00050af6] d080                      add.l      d0,d0
[00050af8] d082                      add.l      d2,d0
[00050afa] e788                      lsl.l      #3,d0
[00050afc] 206f 0014                 movea.l    20(a7),a0
[00050b00] 8270 080a                 or.w       10(a0,d0.l),d1
[00050b04] 302f 0022                 move.w     34(a7),d0
[00050b08] 206f 0024                 movea.l    36(a7),a0
[00050b0c] 226f 0024                 movea.l    36(a7),a1
[00050b10] 2269 0066                 movea.l    102(a1),a1
[00050b14] 4e91                      jsr        (a1)
[00050b16] 3f7c 0001 0018            move.w     #$0001,24(a7)
[00050b1c] 4240                      clr.w      d0
[00050b1e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050b24] 3140 0264                 move.w     d0,612(a0)
[00050b28] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050b2e] 3140 0262                 move.w     d0,610(a0)
[00050b32] 6000 013e                 bra        $00050C72
[00050b36] 7003                      moveq.l    #3,d0
[00050b38] 4eb9 0005 ae7e            jsr        Awi_update
[00050b3e] 2f39 000e 692a            move.l     _globl,-(a7)
[00050b44] 486f 0022                 pea.l      34(a7)
[00050b48] 486f 0026                 pea.l      38(a7)
[00050b4c] 486f 002a                 pea.l      42(a7)
[00050b50] 486f 002e                 pea.l      46(a7)
[00050b54] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050b5a] 4868 0264                 pea.l      612(a0)
[00050b5e] 42a7                      clr.l      -(a7)
[00050b60] 4267                      clr.w      -(a7)
[00050b62] 4267                      clr.w      -(a7)
[00050b64] 4267                      clr.w      -(a7)
[00050b66] 4267                      clr.w      -(a7)
[00050b68] 4267                      clr.w      -(a7)
[00050b6a] 7001                      moveq.l    #1,d0
[00050b6c] 3f00                      move.w     d0,-(a7)
[00050b6e] 7001                      moveq.l    #1,d0
[00050b70] 3f00                      move.w     d0,-(a7)
[00050b72] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050b78] 3f28 0264                 move.w     612(a0),-(a7)
[00050b7c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050b82] 3f28 0262                 move.w     610(a0),-(a7)
[00050b86] 7001                      moveq.l    #1,d0
[00050b88] 3f00                      move.w     d0,-(a7)
[00050b8a] 4267                      clr.w      -(a7)
[00050b8c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00050b92] 43e9 0262                 lea.l      610(a1),a1
[00050b96] 91c8                      suba.l     a0,a0
[00050b98] 7403                      moveq.l    #3,d2
[00050b9a] 7201                      moveq.l    #1,d1
[00050b9c] 7006                      moveq.l    #6,d0 MU_BUTTON | MU_M1
[00050b9e] 4eb9 0007 9240            jsr        mt_evnt_multi
[00050ba4] 4fef 0032                 lea.l      50(a7),a7
[00050ba8] 3f40 001c                 move.w     d0,28(a7)
[00050bac] 7002                      moveq.l    #2,d0
[00050bae] 4eb9 0005 ae7e            jsr        Awi_update
[00050bb4] 7002                      moveq.l    #2,d0
[00050bb6] c06f 001c                 and.w      28(a7),d0
[00050bba] 6704                      beq.s      $00050BC0
[00050bbc] 6000 00b8                 bra        $00050C76
[00050bc0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050bc6] 3228 0264                 move.w     612(a0),d1
[00050bca] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050bd0] 3028 0262                 move.w     610(a0),d0
[00050bd4] 41ef 000c                 lea.l      12(a7),a0
[00050bd8] 4eb9 0006 b7a6            jsr        Aob_within
[00050bde] 4a40                      tst.w      d0
[00050be0] 6622                      bne.s      $00050C04
[00050be2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050be8] 3228 0264                 move.w     612(a0),d1
[00050bec] 2079 0010 ee4e            movea.l    ACSblk,a0
[00050bf2] 3028 0262                 move.w     610(a0),d0
[00050bf6] 41ef 0004                 lea.l      4(a7),a0
[00050bfa] 4eb9 0006 b7a6            jsr        Aob_within
[00050c00] 4a40                      tst.w      d0
[00050c02] 6738                      beq.s      $00050C3C
[00050c04] 302f 0018                 move.w     24(a7),d0
[00050c08] 6630                      bne.s      $00050C3A
[00050c0a] 3f7c 0001 0018            move.w     #$0001,24(a7)
[00050c10] 7201                      moveq.l    #1,d1
[00050c12] 342f 0020                 move.w     32(a7),d2
[00050c16] 48c2                      ext.l      d2
[00050c18] 2002                      move.l     d2,d0
[00050c1a] d080                      add.l      d0,d0
[00050c1c] d082                      add.l      d2,d0
[00050c1e] e788                      lsl.l      #3,d0
[00050c20] 206f 0014                 movea.l    20(a7),a0
[00050c24] 8270 080a                 or.w       10(a0,d0.l),d1
[00050c28] 302f 0022                 move.w     34(a7),d0
[00050c2c] 206f 0024                 movea.l    36(a7),a0
[00050c30] 226f 0024                 movea.l    36(a7),a1
[00050c34] 2269 0066                 movea.l    102(a1),a1
[00050c38] 4e91                      jsr        (a1)
[00050c3a] 6036                      bra.s      $00050C72
[00050c3c] 302f 0018                 move.w     24(a7),d0
[00050c40] 6730                      beq.s      $00050C72
[00050c42] 426f 0018                 clr.w      24(a7)
[00050c46] 342f 0020                 move.w     32(a7),d2
[00050c4a] 48c2                      ext.l      d2
[00050c4c] 2002                      move.l     d2,d0
[00050c4e] d080                      add.l      d0,d0
[00050c50] d082                      add.l      d2,d0
[00050c52] e788                      lsl.l      #3,d0
[00050c54] 206f 0014                 movea.l    20(a7),a0
[00050c58] 3230 080a                 move.w     10(a0,d0.l),d1
[00050c5c] c27c fffe                 and.w      #$FFFE,d1
[00050c60] 302f 0022                 move.w     34(a7),d0
[00050c64] 206f 0024                 movea.l    36(a7),a0
[00050c68] 226f 0024                 movea.l    36(a7),a1
[00050c6c] 2269 0066                 movea.l    102(a1),a1
[00050c70] 4e91                      jsr        (a1)
[00050c72] 6000 fec2                 bra        $00050B36
[00050c76] 302f 0018                 move.w     24(a7),d0
[00050c7a] 4fef 0028                 lea.l      40(a7),a7
[00050c7e] 4e75                      rts
Aev_release:
[00050c80] 594f                      subq.w     #4,a7
[00050c82] 7003                      moveq.l    #3,d0
[00050c84] 4eb9 0005 ae7e            jsr        Awi_update
[00050c8a] 2f39 000e 692a            move.l     _globl,-(a7)
[00050c90] 486f 0006                 pea.l      6(a7)
[00050c94] 486f 000a                 pea.l      10(a7)
[00050c98] 486f 000e                 pea.l      14(a7)
[00050c9c] 486f 0012                 pea.l      18(a7)
[00050ca0] 486f 0016                 pea.l      22(a7)
[00050ca4] 700a                      moveq.l    #10,d0
[00050ca6] 2f00                      move.l     d0,-(a7)
[00050ca8] 4267                      clr.w      -(a7)
[00050caa] 4267                      clr.w      -(a7)
[00050cac] 4267                      clr.w      -(a7)
[00050cae] 4267                      clr.w      -(a7)
[00050cb0] 4267                      clr.w      -(a7)
[00050cb2] 4267                      clr.w      -(a7)
[00050cb4] 4267                      clr.w      -(a7)
[00050cb6] 4267                      clr.w      -(a7)
[00050cb8] 4267                      clr.w      -(a7)
[00050cba] 4267                      clr.w      -(a7)
[00050cbc] 4267                      clr.w      -(a7)
[00050cbe] 43ef 0034                 lea.l      52(a7),a1
[00050cc2] 91c8                      suba.l     a0,a0
[00050cc4] 7403                      moveq.l    #3,d2
[00050cc6] 7201                      moveq.l    #1,d1
[00050cc8] 7022                      moveq.l    #34,d0 MU_TIMER | MU_BUTTON
[00050cca] 4eb9 0007 9240            jsr        mt_evnt_multi
[00050cd0] 4fef 0032                 lea.l      50(a7),a7
[00050cd4] 3e80                      move.w     d0,(a7)
[00050cd6] 7002                      moveq.l    #2,d0
[00050cd8] 4eb9 0005 ae7e            jsr        Awi_update
[00050cde] 7002                      moveq.l    #2,d0
[00050ce0] c057                      and.w      (a7),d0
[00050ce2] 679e                      beq.s      $00050C82
[00050ce4] 584f                      addq.w     #4,a7
[00050ce6] 4e75                      rts
Aob_key:
[00050ce8] 4fef fff4                 lea.l      -12(a7),a7
[00050cec] 2f48 0008                 move.l     a0,8(a7)
[00050cf0] 3f41 0006                 move.w     d1,6(a7)
[00050cf4] 102f 0007                 move.b     7(a7),d0
[00050cf8] 4880                      ext.w      d0
[00050cfa] 4eb9 0008 37dc            jsr        isprint
[00050d00] 4a40                      tst.w      d0
[00050d02] 671c                      beq.s      $00050D20
[00050d04] 70ff                      moveq.l    #-1,d0
[00050d06] c02f 0007                 and.b      7(a7),d0
[00050d0a] 4eb9 0004 64b6            jsr        Ach_toupper
[00050d10] 4880                      ext.w      d0
[00050d12] 322f 0006                 move.w     6(a7),d1
[00050d16] c27c ff00                 and.w      #$FF00,d1
[00050d1a] 8041                      or.w       d1,d0
[00050d1c] 3f40 0006                 move.w     d0,6(a7)
[00050d20] 302f 0006                 move.w     6(a7),d0
[00050d24] c07c 1300                 and.w      #$1300,d0
[00050d28] 6710                      beq.s      $00050D3A
[00050d2a] 302f 0006                 move.w     6(a7),d0
[00050d2e] 807c 0300                 or.w       #$0300,d0
[00050d32] c07c efff                 and.w      #$EFFF,d0
[00050d36] 3f40 0006                 move.w     d0,6(a7)
[00050d3a] 026f 9fff 0006            andi.w     #$9FFF,6(a7)
[00050d40] 426f 0002                 clr.w      2(a7)
[00050d44] 6000 0112                 bra        $00050E58
[00050d48] 302f 0002                 move.w     2(a7),d0
[00050d4c] 6a06                      bpl.s      $00050D54
[00050d4e] 426f 0004                 clr.w      4(a7)
[00050d52] 603c                      bra.s      $00050D90
[00050d54] 303c 0080                 move.w     #$0080,d0
[00050d58] 342f 0002                 move.w     2(a7),d2
[00050d5c] 48c2                      ext.l      d2
[00050d5e] 2202                      move.l     d2,d1
[00050d60] d281                      add.l      d1,d1
[00050d62] d282                      add.l      d2,d1
[00050d64] e789                      lsl.l      #3,d1
[00050d66] 206f 0008                 movea.l    8(a7),a0
[00050d6a] c070 1808                 and.w      8(a0,d1.l),d0
[00050d6e] 6708                      beq.s      $00050D78
[00050d70] 3f7c ffff 0004            move.w     #$FFFF,4(a7)
[00050d76] 6018                      bra.s      $00050D90
[00050d78] 322f 0002                 move.w     2(a7),d1
[00050d7c] 48c1                      ext.l      d1
[00050d7e] 2001                      move.l     d1,d0
[00050d80] d080                      add.l      d0,d0
[00050d82] d081                      add.l      d1,d0
[00050d84] e788                      lsl.l      #3,d0
[00050d86] 206f 0008                 movea.l    8(a7),a0
[00050d8a] 3f70 0802 0004            move.w     2(a0,d0.l),4(a7)
[00050d90] 302f 0004                 move.w     4(a7),d0
[00050d94] 6a5a                      bpl.s      $00050DF0
[00050d96] 322f 0002                 move.w     2(a7),d1
[00050d9a] 48c1                      ext.l      d1
[00050d9c] 2001                      move.l     d1,d0
[00050d9e] d080                      add.l      d0,d0
[00050da0] d081                      add.l      d1,d0
[00050da2] e788                      lsl.l      #3,d0
[00050da4] 206f 0008                 movea.l    8(a7),a0
[00050da8] 3f70 0800 0004            move.w     0(a0,d0.l),4(a7)
[00050dae] 601e                      bra.s      $00050DCE
[00050db0] 3f6f 0004 0002            move.w     4(a7),2(a7)
[00050db6] 322f 0004                 move.w     4(a7),d1
[00050dba] 48c1                      ext.l      d1
[00050dbc] 2001                      move.l     d1,d0
[00050dbe] d080                      add.l      d0,d0
[00050dc0] d081                      add.l      d1,d0
[00050dc2] e788                      lsl.l      #3,d0
[00050dc4] 206f 0008                 movea.l    8(a7),a0
[00050dc8] 3f70 0800 0004            move.w     0(a0,d0.l),4(a7)
[00050dce] 302f 0004                 move.w     4(a7),d0
[00050dd2] 6b1c                      bmi.s      $00050DF0
[00050dd4] 322f 0004                 move.w     4(a7),d1
[00050dd8] 48c1                      ext.l      d1
[00050dda] 2001                      move.l     d1,d0
[00050ddc] d080                      add.l      d0,d0
[00050dde] d081                      add.l      d1,d0
[00050de0] e788                      lsl.l      #3,d0
[00050de2] 206f 0008                 movea.l    8(a7),a0
[00050de6] 322f 0002                 move.w     2(a7),d1
[00050dea] b270 0804                 cmp.w      4(a0,d0.l),d1
[00050dee] 67c0                      beq.s      $00050DB0
[00050df0] 302f 0004                 move.w     4(a7),d0
[00050df4] 6b56                      bmi.s      $00050E4C
[00050df6] 322f 0004                 move.w     4(a7),d1
[00050dfa] 48c1                      ext.l      d1
[00050dfc] 2001                      move.l     d1,d0
[00050dfe] d080                      add.l      d0,d0
[00050e00] d081                      add.l      d1,d0
[00050e02] e788                      lsl.l      #3,d0
[00050e04] 206f 0008                 movea.l    8(a7),a0
[00050e08] 3030 0820                 move.w     32(a0,d0.l),d0
[00050e0c] c07c 8000                 and.w      #$8000,d0
[00050e10] 6740                      beq.s      $00050E52
[00050e12] 7008                      moveq.l    #8,d0
[00050e14] 342f 0004                 move.w     4(a7),d2
[00050e18] 48c2                      ext.l      d2
[00050e1a] 2202                      move.l     d2,d1
[00050e1c] d281                      add.l      d1,d1
[00050e1e] d282                      add.l      d2,d1
[00050e20] e789                      lsl.l      #3,d1
[00050e22] 206f 0008                 movea.l    8(a7),a0
[00050e26] c070 180a                 and.w      10(a0,d1.l),d0
[00050e2a] 6626                      bne.s      $00050E52
[00050e2c] 322f 0004                 move.w     4(a7),d1
[00050e30] 48c1                      ext.l      d1
[00050e32] 2001                      move.l     d1,d0
[00050e34] d080                      add.l      d0,d0
[00050e36] d081                      add.l      d1,d0
[00050e38] e788                      lsl.l      #3,d0
[00050e3a] 206f 0008                 movea.l    8(a7),a0
[00050e3e] 3eb0 0822                 move.w     34(a0,d0.l),(a7)
[00050e42] 670e                      beq.s      $00050E52
[00050e44] 3017                      move.w     (a7),d0
[00050e46] b06f 0006                 cmp.w      6(a7),d0
[00050e4a] 6606                      bne.s      $00050E52
[00050e4c] 302f 0004                 move.w     4(a7),d0
[00050e50] 600a                      bra.s      $00050E5C
[00050e52] 3f6f 0004 0002            move.w     4(a7),2(a7)
[00050e58] 6000 feee                 bra        $00050D48
[00050e5c] 4fef 000c                 lea.l      12(a7),a7
[00050e60] 4e75                      rts
Aob_findflag:
[00050e62] 4fef fff6                 lea.l      -10(a7),a7
[00050e66] 2f48 0006                 move.l     a0,6(a7)
[00050e6a] 3f40 0004                 move.w     d0,4(a7)
[00050e6e] 3f41 0002                 move.w     d1,2(a7)
[00050e72] 6000 00bc                 bra        $00050F30
[00050e76] 302f 0004                 move.w     4(a7),d0
[00050e7a] 6a04                      bpl.s      $00050E80
[00050e7c] 4257                      clr.w      (a7)
[00050e7e] 6038                      bra.s      $00050EB8
[00050e80] 303c 0080                 move.w     #$0080,d0
[00050e84] 342f 0004                 move.w     4(a7),d2
[00050e88] 48c2                      ext.l      d2
[00050e8a] 2202                      move.l     d2,d1
[00050e8c] d281                      add.l      d1,d1
[00050e8e] d282                      add.l      d2,d1
[00050e90] e789                      lsl.l      #3,d1
[00050e92] 206f 0006                 movea.l    6(a7),a0
[00050e96] c070 1808                 and.w      8(a0,d1.l),d0
[00050e9a] 6706                      beq.s      $00050EA2
[00050e9c] 3ebc ffff                 move.w     #$FFFF,(a7)
[00050ea0] 6016                      bra.s      $00050EB8
[00050ea2] 322f 0004                 move.w     4(a7),d1
[00050ea6] 48c1                      ext.l      d1
[00050ea8] 2001                      move.l     d1,d0
[00050eaa] d080                      add.l      d0,d0
[00050eac] d081                      add.l      d1,d0
[00050eae] e788                      lsl.l      #3,d0
[00050eb0] 206f 0006                 movea.l    6(a7),a0
[00050eb4] 3eb0 0802                 move.w     2(a0,d0.l),(a7)
[00050eb8] 3017                      move.w     (a7),d0
[00050eba] 6a4e                      bpl.s      $00050F0A
[00050ebc] 322f 0004                 move.w     4(a7),d1
[00050ec0] 48c1                      ext.l      d1
[00050ec2] 2001                      move.l     d1,d0
[00050ec4] d080                      add.l      d0,d0
[00050ec6] d081                      add.l      d1,d0
[00050ec8] e788                      lsl.l      #3,d0
[00050eca] 206f 0006                 movea.l    6(a7),a0
[00050ece] 3eb0 0800                 move.w     0(a0,d0.l),(a7)
[00050ed2] 6018                      bra.s      $00050EEC
[00050ed4] 3f57 0004                 move.w     (a7),4(a7)
[00050ed8] 3217                      move.w     (a7),d1
[00050eda] 48c1                      ext.l      d1
[00050edc] 2001                      move.l     d1,d0
[00050ede] d080                      add.l      d0,d0
[00050ee0] d081                      add.l      d1,d0
[00050ee2] e788                      lsl.l      #3,d0
[00050ee4] 206f 0006                 movea.l    6(a7),a0
[00050ee8] 3eb0 0800                 move.w     0(a0,d0.l),(a7)
[00050eec] 3017                      move.w     (a7),d0
[00050eee] 6b1a                      bmi.s      $00050F0A
[00050ef0] 3217                      move.w     (a7),d1
[00050ef2] 48c1                      ext.l      d1
[00050ef4] 2001                      move.l     d1,d0
[00050ef6] d080                      add.l      d0,d0
[00050ef8] d081                      add.l      d1,d0
[00050efa] e788                      lsl.l      #3,d0
[00050efc] 206f 0006                 movea.l    6(a7),a0
[00050f00] 322f 0004                 move.w     4(a7),d1
[00050f04] b270 0804                 cmp.w      4(a0,d0.l),d1
[00050f08] 67ca                      beq.s      $00050ED4
[00050f0a] 3017                      move.w     (a7),d0
[00050f0c] 6b1a                      bmi.s      $00050F28
[00050f0e] 3217                      move.w     (a7),d1
[00050f10] 48c1                      ext.l      d1
[00050f12] 2001                      move.l     d1,d0
[00050f14] d080                      add.l      d0,d0
[00050f16] d081                      add.l      d1,d0
[00050f18] e788                      lsl.l      #3,d0
[00050f1a] 206f 0006                 movea.l    6(a7),a0
[00050f1e] 3030 0808                 move.w     8(a0,d0.l),d0
[00050f22] c06f 0002                 and.w      2(a7),d0
[00050f26] 6704                      beq.s      $00050F2C
[00050f28] 3017                      move.w     (a7),d0
[00050f2a] 6008                      bra.s      $00050F34
[00050f2c] 3f57 0004                 move.w     (a7),4(a7)
[00050f30] 6000 ff44                 bra        $00050E76
[00050f34] 4fef 000a                 lea.l      10(a7),a7
[00050f38] 4e75                      rts
Aob_up:
[00050f3a] 4fef fff6                 lea.l      -10(a7),a7
[00050f3e] 2f48 0006                 move.l     a0,6(a7)
[00050f42] 3f40 0004                 move.w     d0,4(a7)
[00050f46] 3f6f 0004 0002            move.w     4(a7),2(a7)
[00050f4c] 322f 0002                 move.w     2(a7),d1
[00050f50] 48c1                      ext.l      d1
[00050f52] 2001                      move.l     d1,d0
[00050f54] d080                      add.l      d0,d0
[00050f56] d081                      add.l      d1,d0
[00050f58] e788                      lsl.l      #3,d0
[00050f5a] 206f 0006                 movea.l    6(a7),a0
[00050f5e] 3eb0 0800                 move.w     0(a0,d0.l),(a7)
[00050f62] 3017                      move.w     (a7),d0
[00050f64] 6a04                      bpl.s      $00050F6A
[00050f66] 70ff                      moveq.l    #-1,d0
[00050f68] 6024                      bra.s      $00050F8E
[00050f6a] 3217                      move.w     (a7),d1
[00050f6c] 48c1                      ext.l      d1
[00050f6e] 2001                      move.l     d1,d0
[00050f70] d080                      add.l      d0,d0
[00050f72] d081                      add.l      d1,d0
[00050f74] e788                      lsl.l      #3,d0
[00050f76] 206f 0006                 movea.l    6(a7),a0
[00050f7a] 3030 0804                 move.w     4(a0,d0.l),d0
[00050f7e] b06f 0002                 cmp.w      2(a7),d0
[00050f82] 6604                      bne.s      $00050F88
[00050f84] 3017                      move.w     (a7),d0
[00050f86] 6006                      bra.s      $00050F8E
[00050f88] 3f57 0002                 move.w     (a7),2(a7)
[00050f8c] 60be                      bra.s      $00050F4C
[00050f8e] 4fef 000a                 lea.l      10(a7),a7
[00050f92] 4e75                      rts
Aob_printf:
[00050f94] 4fef fff2                 lea.l      -14(a7),a7
[00050f98] 2f48 000a                 move.l     a0,10(a7)
[00050f9c] 3f40 0008                 move.w     d0,8(a7)
[00050fa0] 2f49 0004                 move.l     a1,4(a7)
[00050fa4] 41ef 0012                 lea.l      18(a7),a0
[00050fa8] 2e88                      move.l     a0,(a7)
[00050faa] 2f17                      move.l     (a7),-(a7)
[00050fac] 226f 0008                 movea.l    8(a7),a1
[00050fb0] 41f9 0011 36cc            lea.l      ob_inout,a0
[00050fb6] 4eb9 0008 15de            jsr        vsprintf
[00050fbc] 584f                      addq.w     #4,a7
[00050fbe] 43f9 0011 36cc            lea.l      ob_inout,a1
[00050fc4] 302f 0008                 move.w     8(a7),d0
[00050fc8] 206f 000a                 movea.l    10(a7),a0
[00050fcc] 4eb9 0005 0fd8            jsr        Aob_puttext
[00050fd2] 4fef 000e                 lea.l      14(a7),a7
[00050fd6] 4e75                      rts
Aob_puttext:
[00050fd8] 2f0a                      move.l     a2,-(a7)
[00050fda] 4fef ffee                 lea.l      -18(a7),a7
[00050fde] 2f48 000e                 move.l     a0,14(a7)
[00050fe2] 3f40 000c                 move.w     d0,12(a7)
[00050fe6] 2f49 0008                 move.l     a1,8(a7)
[00050fea] 322f 000c                 move.w     12(a7),d1
[00050fee] 48c1                      ext.l      d1
[00050ff0] 2001                      move.l     d1,d0
[00050ff2] d080                      add.l      d0,d0
[00050ff4] d081                      add.l      d1,d0
[00050ff6] e788                      lsl.l      #3,d0
[00050ff8] 206f 000e                 movea.l    14(a7),a0
[00050ffc] 1030 0807                 move.b     7(a0,d0.l),d0
[00051000] 4880                      ext.w      d0
[00051002] 907c 0015                 sub.w      #$0015,d0
[00051006] b07c 000c                 cmp.w      #$000C,d0
[0005100a] 6200 00ea                 bhi        $000510F6
[0005100e] d040                      add.w      d0,d0
[00051010] 303b 0006                 move.w     $00051018(pc,d0.w),d0
[00051014] 4efb 0002                 jmp        $00051018(pc,d0.w)
J39:
[00051018] 001a                      dc.w $001a   ; $00051032-$00051018
[0005101a] 001a                      dc.w $001a   ; $00051032-$00051018
[0005101c] 00de                      dc.w $00de   ; $000510f6-$00051018
[0005101e] 00a0                      dc.w $00a0   ; $000510b8-$00051018
[00051020] 00de                      dc.w $00de   ; $000510f6-$00051018
[00051022] 0058                      dc.w $0058   ; $00051070-$00051018
[00051024] 00de                      dc.w $00de   ; $000510f6-$00051018
[00051026] 0058                      dc.w $0058   ; $00051070-$00051018
[00051028] 001a                      dc.w $001a   ; $00051032-$00051018
[0005102a] 001a                      dc.w $001a   ; $00051032-$00051018
[0005102c] 007a                      dc.w $007a   ; $00051092-$00051018
[0005102e] 0058                      dc.w $0058   ; $00051070-$00051018
[00051030] 007a                      dc.w $007a   ; $00051092-$00051018
[00051032] 322f 000c                 move.w     12(a7),d1
[00051036] 48c1                      ext.l      d1
[00051038] 2001                      move.l     d1,d0
[0005103a] d080                      add.l      d0,d0
[0005103c] d081                      add.l      d1,d0
[0005103e] e788                      lsl.l      #3,d0
[00051040] 206f 000e                 movea.l    14(a7),a0
[00051044] 2eb0 080c                 move.l     12(a0,d0.l),(a7)
[00051048] 2057                      movea.l    (a7),a0
[0005104a] 3028 0018                 move.w     24(a0),d0
[0005104e] 48c0                      ext.l      d0
[00051050] 226f 0008                 movea.l    8(a7),a1
[00051054] 2057                      movea.l    (a7),a0
[00051056] 2050                      movea.l    (a0),a0
[00051058] 4eb9 0008 2fd6            jsr        strncpy
[0005105e] 2057                      movea.l    (a7),a0
[00051060] 3028 0018                 move.w     24(a0),d0
[00051064] 2057                      movea.l    (a7),a0
[00051066] 2050                      movea.l    (a0),a0
[00051068] 4230 00ff                 clr.b      -1(a0,d0.w)
[0005106c] 6000 0088                 bra        $000510F6
[00051070] 226f 0008                 movea.l    8(a7),a1
[00051074] 322f 000c                 move.w     12(a7),d1
[00051078] 48c1                      ext.l      d1
[0005107a] 2001                      move.l     d1,d0
[0005107c] d080                      add.l      d0,d0
[0005107e] d081                      add.l      d1,d0
[00051080] e788                      lsl.l      #3,d0
[00051082] 206f 000e                 movea.l    14(a7),a0
[00051086] 2070 080c                 movea.l    12(a0,d0.l),a0
[0005108a] 4eb9 0008 2f0c            jsr        strcpy
[00051090] 6064                      bra.s      $000510F6
[00051092] 226f 0008                 movea.l    8(a7),a1
[00051096] 322f 000c                 move.w     12(a7),d1
[0005109a] 48c1                      ext.l      d1
[0005109c] 2001                      move.l     d1,d0
[0005109e] d080                      add.l      d0,d0
[000510a0] d081                      add.l      d1,d0
[000510a2] e788                      lsl.l      #3,d0
[000510a4] 206f 000e                 movea.l    14(a7),a0
[000510a8] 2070 080c                 movea.l    12(a0,d0.l),a0
[000510ac] 2068 0008                 movea.l    8(a0),a0
[000510b0] 4eb9 0008 2f0c            jsr        strcpy
[000510b6] 603e                      bra.s      $000510F6
[000510b8] 322f 000c                 move.w     12(a7),d1
[000510bc] 48c1                      ext.l      d1
[000510be] 2001                      move.l     d1,d0
[000510c0] d080                      add.l      d0,d0
[000510c2] d081                      add.l      d1,d0
[000510c4] e788                      lsl.l      #3,d0
[000510c6] 206f 000e                 movea.l    14(a7),a0
[000510ca] 2f70 080c 0004            move.l     12(a0,d0.l),4(a7)
[000510d0] 226f 0008                 movea.l    8(a7),a1
[000510d4] 7004                      moveq.l    #4,d0
[000510d6] 342f 000c                 move.w     12(a7),d2
[000510da] 48c2                      ext.l      d2
[000510dc] 2202                      move.l     d2,d1
[000510de] d281                      add.l      d1,d1
[000510e0] d282                      add.l      d2,d1
[000510e2] e789                      lsl.l      #3,d1
[000510e4] 206f 000e                 movea.l    14(a7),a0
[000510e8] d1c1                      adda.l     d1,a0
[000510ea] 246f 0004                 movea.l    4(a7),a2
[000510ee] 246a 0008                 movea.l    8(a2),a2
[000510f2] 4e92                      jsr        (a2)
[000510f4] 4e71                      nop
[000510f6] 4fef 0012                 lea.l      18(a7),a7
[000510fa] 245f                      movea.l    (a7)+,a2
[000510fc] 4e75                      rts
Aob_scanf:
[000510fe] 4fef ffec                 lea.l      -20(a7),a7
[00051102] 2f48 0010                 move.l     a0,16(a7)
[00051106] 3f40 000e                 move.w     d0,14(a7)
[0005110a] 2f49 000a                 move.l     a1,10(a7)
[0005110e] 43f9 0011 36cc            lea.l      ob_inout,a1
[00051114] 302f 000e                 move.w     14(a7),d0
[00051118] 206f 0010                 movea.l    16(a7),a0
[0005111c] 4eb9 0005 11da            jsr        Aob_gettext
[00051122] 3f40 0004                 move.w     d0,4(a7)
[00051126] 202f 000a                 move.l     10(a7),d0
[0005112a] 6700 00a4                 beq        $000511D0
[0005112e] 1039 0011 36cc            move.b     ob_inout,d0
[00051134] 6600 007c                 bne.w      $000511B2
[00051138] 7025                      moveq.l    #37,d0
[0005113a] 206f 000a                 movea.l    10(a7),a0
[0005113e] 4eb9 0008 2e8a            jsr        strchr
[00051144] 2e88                      move.l     a0,(a7)
[00051146] 676a                      beq.s      $000511B2
[00051148] 5297                      addq.l     #1,(a7)
[0005114a] 6002                      bra.s      $0005114E
[0005114c] 5297                      addq.l     #1,(a7)
[0005114e] 2057                      movea.l    (a7),a0
[00051150] 1010                      move.b     (a0),d0
[00051152] 4880                      ext.w      d0
[00051154] 4eb9 0008 37ce            jsr        isdigit
[0005115a] 4a40                      tst.w      d0
[0005115c] 66ee                      bne.s      $0005114C
[0005115e] 2057                      movea.l    (a7),a0
[00051160] 0c10 0068                 cmpi.b     #$68,(a0)
[00051164] 6710                      beq.s      $00051176
[00051166] 2057                      movea.l    (a7),a0
[00051168] 0c10 006c                 cmpi.b     #$6C,(a0)
[0005116c] 6708                      beq.s      $00051176
[0005116e] 2057                      movea.l    (a7),a0
[00051170] 0c10 004c                 cmpi.b     #$4C,(a0)
[00051174] 6602                      bne.s      $00051178
[00051176] 5297                      addq.l     #1,(a7)
[00051178] 2057                      movea.l    (a7),a0
[0005117a] 0c10 0064                 cmpi.b     #$64,(a0)
[0005117e] 6720                      beq.s      $000511A0
[00051180] 2057                      movea.l    (a7),a0
[00051182] 0c10 006f                 cmpi.b     #$6F,(a0)
[00051186] 6718                      beq.s      $000511A0
[00051188] 2057                      movea.l    (a7),a0
[0005118a] 0c10 0069                 cmpi.b     #$69,(a0)
[0005118e] 6710                      beq.s      $000511A0
[00051190] 2057                      movea.l    (a7),a0
[00051192] 0c10 0075                 cmpi.b     #$75,(a0)
[00051196] 6708                      beq.s      $000511A0
[00051198] 2057                      movea.l    (a7),a0
[0005119a] 0c10 0078                 cmpi.b     #$78,(a0)
[0005119e] 6612                      bne.s      $000511B2
[000511a0] 43f9 000e 0c9e            lea.l      $000E0C9E,a1
[000511a6] 41f9 0011 36cc            lea.l      ob_inout,a0
[000511ac] 4eb9 0008 2f0c            jsr        strcpy
[000511b2] 41ef 0018                 lea.l      24(a7),a0
[000511b6] 2f48 0006                 move.l     a0,6(a7)
[000511ba] 2f2f 0006                 move.l     6(a7),-(a7)
[000511be] 226f 000e                 movea.l    14(a7),a1
[000511c2] 41f9 0011 36cc            lea.l      ob_inout,a0
[000511c8] 4eb9 0008 1b5c            jsr        vsscanf
[000511ce] 584f                      addq.w     #4,a7
[000511d0] 302f 0004                 move.w     4(a7),d0
[000511d4] 4fef 0014                 lea.l      20(a7),a7
[000511d8] 4e75                      rts
Aob_gettext:
[000511da] 2f0a                      move.l     a2,-(a7)
[000511dc] 4fef ffec                 lea.l      -20(a7),a7
[000511e0] 2f48 0010                 move.l     a0,16(a7)
[000511e4] 3f40 000e                 move.w     d0,14(a7)
[000511e8] 2f49 000a                 move.l     a1,10(a7)
[000511ec] 3f7c ffff 0004            move.w     #$FFFF,4(a7)
[000511f2] 4297                      clr.l      (a7)
[000511f4] 322f 000e                 move.w     14(a7),d1
[000511f8] 48c1                      ext.l      d1
[000511fa] 2001                      move.l     d1,d0
[000511fc] d080                      add.l      d0,d0
[000511fe] d081                      add.l      d1,d0
[00051200] e788                      lsl.l      #3,d0
[00051202] 206f 0010                 movea.l    16(a7),a0
[00051206] 1030 0807                 move.b     7(a0,d0.l),d0
[0005120a] 4880                      ext.w      d0
[0005120c] 907c 0015                 sub.w      #$0015,d0
[00051210] b07c 000c                 cmp.w      #$000C,d0
[00051214] 6200 0166                 bhi        $0005137C
[00051218] d040                      add.w      d0,d0
[0005121a] 303b 0006                 move.w     $00051222(pc,d0.w),d0
[0005121e] 4efb 0002                 jmp        $00051222(pc,d0.w)
J40:
[00051222] 001a                      dc.w $001a   ; $0005123c-$00051222
[00051224] 001a                      dc.w $001a   ; $0005123c-$00051222
[00051226] 015a                      dc.w $015a   ; $0005137c-$00051222
[00051228] 00fc                      dc.w $00fc   ; $0005131e-$00051222
[0005122a] 015a                      dc.w $015a   ; $0005137c-$00051222
[0005122c] 00b4                      dc.w $00b4   ; $000512d6-$00051222
[0005122e] 015a                      dc.w $015a   ; $0005137c-$00051222
[00051230] 00b4                      dc.w $00b4   ; $000512d6-$00051222
[00051232] 001a                      dc.w $001a   ; $0005123c-$00051222
[00051234] 001a                      dc.w $001a   ; $0005123c-$00051222
[00051236] 0062                      dc.w $0062   ; $00051284-$00051222
[00051238] 00b4                      dc.w $00b4   ; $000512d6-$00051222
[0005123a] 0062                      dc.w $0062   ; $00051284-$00051222
[0005123c] 322f 000e                 move.w     14(a7),d1
[00051240] 48c1                      ext.l      d1
[00051242] 2001                      move.l     d1,d0
[00051244] d080                      add.l      d0,d0
[00051246] d081                      add.l      d1,d0
[00051248] e788                      lsl.l      #3,d0
[0005124a] 206f 0010                 movea.l    16(a7),a0
[0005124e] 2070 080c                 movea.l    12(a0,d0.l),a0
[00051252] 3f68 0018 0004            move.w     24(a0),4(a7)
[00051258] 202f 000a                 move.l     10(a7),d0
[0005125c] 6722                      beq.s      $00051280
[0005125e] 322f 000e                 move.w     14(a7),d1
[00051262] 48c1                      ext.l      d1
[00051264] 2001                      move.l     d1,d0
[00051266] d080                      add.l      d0,d0
[00051268] d081                      add.l      d1,d0
[0005126a] e788                      lsl.l      #3,d0
[0005126c] 206f 0010                 movea.l    16(a7),a0
[00051270] 2070 080c                 movea.l    12(a0,d0.l),a0
[00051274] 2250                      movea.l    (a0),a1
[00051276] 206f 000a                 movea.l    10(a7),a0
[0005127a] 4eb9 0008 2f0c            jsr        strcpy
[00051280] 6000 00fa                 bra        $0005137C
[00051284] 322f 000e                 move.w     14(a7),d1
[00051288] 48c1                      ext.l      d1
[0005128a] 2001                      move.l     d1,d0
[0005128c] d080                      add.l      d0,d0
[0005128e] d081                      add.l      d1,d0
[00051290] e788                      lsl.l      #3,d0
[00051292] 206f 0010                 movea.l    16(a7),a0
[00051296] 2070 080c                 movea.l    12(a0,d0.l),a0
[0005129a] 2068 0008                 movea.l    8(a0),a0
[0005129e] 4eb9 0008 2f6c            jsr        strlen
[000512a4] 3f40 0004                 move.w     d0,4(a7)
[000512a8] 202f 000a                 move.l     10(a7),d0
[000512ac] 6724                      beq.s      $000512D2
[000512ae] 322f 000e                 move.w     14(a7),d1
[000512b2] 48c1                      ext.l      d1
[000512b4] 2001                      move.l     d1,d0
[000512b6] d080                      add.l      d0,d0
[000512b8] d081                      add.l      d1,d0
[000512ba] e788                      lsl.l      #3,d0
[000512bc] 206f 0010                 movea.l    16(a7),a0
[000512c0] 2070 080c                 movea.l    12(a0,d0.l),a0
[000512c4] 2268 0008                 movea.l    8(a0),a1
[000512c8] 206f 000a                 movea.l    10(a7),a0
[000512cc] 4eb9 0008 2f0c            jsr        strcpy
[000512d2] 6000 00a8                 bra        $0005137C
[000512d6] 322f 000e                 move.w     14(a7),d1
[000512da] 48c1                      ext.l      d1
[000512dc] 2001                      move.l     d1,d0
[000512de] d080                      add.l      d0,d0
[000512e0] d081                      add.l      d1,d0
[000512e2] e788                      lsl.l      #3,d0
[000512e4] 206f 0010                 movea.l    16(a7),a0
[000512e8] 2070 080c                 movea.l    12(a0,d0.l),a0
[000512ec] 4eb9 0008 2f6c            jsr        strlen
[000512f2] 3f40 0004                 move.w     d0,4(a7)
[000512f6] 202f 000a                 move.l     10(a7),d0
[000512fa] 6720                      beq.s      $0005131C
[000512fc] 322f 000e                 move.w     14(a7),d1
[00051300] 48c1                      ext.l      d1
[00051302] 2001                      move.l     d1,d0
[00051304] d080                      add.l      d0,d0
[00051306] d081                      add.l      d1,d0
[00051308] e788                      lsl.l      #3,d0
[0005130a] 206f 0010                 movea.l    16(a7),a0
[0005130e] 2270 080c                 movea.l    12(a0,d0.l),a1
[00051312] 206f 000a                 movea.l    10(a7),a0
[00051316] 4eb9 0008 2f0c            jsr        strcpy
[0005131c] 605e                      bra.s      $0005137C
[0005131e] 322f 000e                 move.w     14(a7),d1
[00051322] 48c1                      ext.l      d1
[00051324] 2001                      move.l     d1,d0
[00051326] d080                      add.l      d0,d0
[00051328] d081                      add.l      d1,d0
[0005132a] e788                      lsl.l      #3,d0
[0005132c] 206f 0010                 movea.l    16(a7),a0
[00051330] 2f70 080c 0006            move.l     12(a0,d0.l),6(a7)
[00051336] 43d7                      lea.l      (a7),a1
[00051338] 7003                      moveq.l    #3,d0
[0005133a] 342f 000e                 move.w     14(a7),d2
[0005133e] 48c2                      ext.l      d2
[00051340] 2202                      move.l     d2,d1
[00051342] d281                      add.l      d1,d1
[00051344] d282                      add.l      d2,d1
[00051346] e789                      lsl.l      #3,d1
[00051348] 206f 0010                 movea.l    16(a7),a0
[0005134c] d1c1                      adda.l     d1,a0
[0005134e] 246f 0006                 movea.l    6(a7),a2
[00051352] 246a 0008                 movea.l    8(a2),a2
[00051356] 4e92                      jsr        (a2)
[00051358] 2017                      move.l     (a7),d0
[0005135a] 671e                      beq.s      $0005137A
[0005135c] 2057                      movea.l    (a7),a0
[0005135e] 4eb9 0008 2f6c            jsr        strlen
[00051364] 3f40 0004                 move.w     d0,4(a7)
[00051368] 202f 000a                 move.l     10(a7),d0
[0005136c] 670c                      beq.s      $0005137A
[0005136e] 2257                      movea.l    (a7),a1
[00051370] 206f 000a                 movea.l    10(a7),a0
[00051374] 4eb9 0008 2f0c            jsr        strcpy
[0005137a] 4e71                      nop
[0005137c] 302f 0004                 move.w     4(a7),d0
[00051380] 4fef 0014                 lea.l      20(a7),a7
[00051384] 245f                      movea.l    (a7)+,a2
[00051386] 4e75                      rts

	.data

map:
[000e0c58]                           dc.w $0000
[000e0c5a]                           dc.w $0002
[000e0c5c]                           dc.w $0003
[000e0c5e]                           dc.w $0006
[000e0c60]                           dc.w $0004
[000e0c62]                           dc.w $0007
[000e0c64]                           dc.w $0005
[000e0c66]                           dc.w $0008
[000e0c68]                           dc.w $0009
[000e0c6a]                           dc.w $000a
[000e0c6c]                           dc.w $000b
[000e0c6e]                           dc.w $000e
[000e0c70]                           dc.w $000c
[000e0c72]                           dc.w $000f
[000e0c74]                           dc.w $000d
[000e0c76]                           dc.w $0001
xff:
[000e0c78]                           dc.w $ffff
punkt:
[000e0c7a] 000e0c78                  dc.l xff
[000e0c7e]                           dc.w $0001
[000e0c80]                           dc.w $0001
[000e0c82]                           dc.w $0001
[000e0c84]                           dc.w $0000
[000e0c86]                           dc.w $0001
[000e0c88]                           dc.w $0000
[000e0c8a]                           dc.w $0000
[000e0c8c]                           dc.w $0000
[000e0c8e]                           dc.w $0000
[000e0c90]                           dc.w $0000
[000e0c92]                           dc.w $0000
[000e0c94]                           dc.w $0000
[000e0c96]                           dc.w $0000
[000e0c98]                           dc.w $0000
[000e0c9a]                           dc.w $0000
[000e0c9c]                           dc.w $0000
[000e0c9e]                           dc.b '0 0 0 0 0 0 0 0 0 0',0
