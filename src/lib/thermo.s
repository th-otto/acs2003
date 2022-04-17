	.globl Ash_thermometer
Ash_thermometer:
[0005be80] 2f0a                      move.l     a2,-(a7)
[0005be82] 4fef ffea                 lea.l      -22(a7),a7
[0005be86] 3f40 0014                 move.w     d0,20(a7)
[0005be8a] 2f48 0010                 move.l     a0,16(a7)
[0005be8e] 3f41 000e                 move.w     d1,14(a7)
[0005be92] 2f49 000a                 move.l     a1,10(a7)
[0005be96] 7072                      moveq.l    #114,d0
[0005be98] 4eb9 0004 c608            jsr        Ax_malloc
[0005be9e] 2f48 0006                 move.l     a0,6(a7)
[0005bea2] 202f 0006                 move.l     6(a7),d0
[0005bea6] 6606                      bne.s      Ash_thermometer_1
[0005bea8] 70ff                      moveq.l    #-1,d0
[0005beaa] 6000 017a                 bra        Ash_thermometer_2
Ash_thermometer_1:
[0005beae] 7272                      moveq.l    #114,d1
[0005beb0] 4240                      clr.w      d0
[0005beb2] 206f 0006                 movea.l    6(a7),a0
[0005beb6] 4eb9 0008 36ea            jsr        memset
[0005bebc] 206f 0006                 movea.l    6(a7),a0
[0005bec0] 216f 000a 0040            move.l     10(a7),64(a0)
[0005bec6] 206f 0006                 movea.l    6(a7),a0
[0005beca] 216f 001e 0044            move.l     30(a7),68(a0)
[0005bed0] 206f 0006                 movea.l    6(a7),a0
[0005bed4] 216f 0022 0048            move.l     34(a7),72(a0)
[0005beda] 206f 0006                 movea.l    6(a7),a0
[0005bede] 216f 0026 004c            move.l     38(a7),76(a0)
[0005bee4] 206f 0006                 movea.l    6(a7),a0
[0005bee8] 216f 002a 0050            move.l     42(a7),80(a0)
[0005beee] 206f 0006                 movea.l    6(a7),a0
[0005bef2] 216f 002e 0054            move.l     46(a7),84(a0)
[0005bef8] 206f 0006                 movea.l    6(a7),a0
[0005befc] 216f 0032 0058            move.l     50(a7),88(a0)
[0005bf02] 206f 0006                 movea.l    6(a7),a0
[0005bf06] 316f 0014 0064            move.w     20(a7),100(a0)
[0005bf0c] 206f 0006                 movea.l    6(a7),a0
[0005bf10] 216f 0010 005c            move.l     16(a7),92(a0)
[0005bf16] 206f 0006                 movea.l    6(a7),a0
[0005bf1a] 316f 000e 0066            move.w     14(a7),102(a0)
[0005bf20] 206f 0006                 movea.l    6(a7),a0
[0005bf24] 2279 000e 139a            movea.l    $000E139A,a1
[0005bf2a] 4e91                      jsr        (a1)
[0005bf2c] 2f48 0002                 move.l     a0,2(a7)
[0005bf30] 202f 0002                 move.l     2(a7),d0
[0005bf34] 6778                      beq.s      Ash_thermometer_3
[0005bf36] 7008                      moveq.l    #8,d0
[0005bf38] c06f 0014                 and.w      20(a7),d0
[0005bf3c] 6714                      beq.s      Ash_thermometer_4
[0005bf3e] 206f 0002                 movea.l    2(a7),a0
[0005bf42] 226f 0002                 movea.l    2(a7),a1
[0005bf46] 2269 000c                 movea.l    12(a1),a1
[0005bf4a] 4e91                      jsr        (a1)
[0005bf4c] 3ebc 0002                 move.w     #$0002,(a7)
[0005bf50] 6058                      bra.s      Ash_thermometer_5
Ash_thermometer_4:
[0005bf52] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bf58] 226f 0006                 movea.l    6(a7),a1
[0005bf5c] 2368 0232 006a            move.l     562(a0),106(a1)
[0005bf62] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bf68] 217c 0000 0001 0232       move.l     #$00000001,562(a0)
[0005bf70] 206f 0002                 movea.l    2(a7),a0
[0005bf74] 4eb9 0005 9df4            jsr        Awi_dialog
[0005bf7a] 3e80                      move.w     d0,(a7)
[0005bf7c] 93c9                      suba.l     a1,a1
[0005bf7e] 7002                      moveq.l    #2,d0
[0005bf80] 206f 0002                 movea.l    2(a7),a0
[0005bf84] 246f 0002                 movea.l    2(a7),a2
[0005bf88] 246a 0004                 movea.l    4(a2),a2
[0005bf8c] 4e92                      jsr        (a2)
[0005bf8e] 206f 0006                 movea.l    6(a7),a0
[0005bf92] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005bf98] 2368 006a 0232            move.l     106(a0),562(a1)
[0005bf9e] 7072                      moveq.l    #114,d0
[0005bfa0] 206f 0006                 movea.l    6(a7),a0
[0005bfa4] 4eb9 0004 cc28            jsr        Ax_recycle
Ash_thermometer_5:
[0005bfaa] 6000 0078                 bra.w      Ash_thermometer_6
Ash_thermometer_3:
[0005bfae] 202f 001e                 move.l     30(a7),d0
[0005bfb2] 670a                      beq.s      Ash_thermometer_7
[0005bfb4] 206f 0006                 movea.l    6(a7),a0
[0005bfb8] 226f 001e                 movea.l    30(a7),a1
[0005bfbc] 4e91                      jsr        (a1)
Ash_thermometer_7:
[0005bfbe] 202f 0022                 move.l     34(a7),d0
[0005bfc2] 670e                      beq.s      Ash_thermometer_8
[0005bfc4] 206f 0006                 movea.l    6(a7),a0
[0005bfc8] 226f 0022                 movea.l    34(a7),a1
[0005bfcc] 4e91                      jsr        (a1)
[0005bfce] 4a40                      tst.w      d0
[0005bfd0] 6736                      beq.s      Ash_thermometer_9
Ash_thermometer_8:
[0005bfd2] 202f 0026                 move.l     38(a7),d0
[0005bfd6] 6720                      beq.s      Ash_thermometer_10
[0005bfd8] 6010                      bra.s      Ash_thermometer_11
Ash_thermometer_12:
[0005bfda] 202f 002a                 move.l     42(a7),d0
[0005bfde] 670a                      beq.s      Ash_thermometer_11
[0005bfe0] 206f 0006                 movea.l    6(a7),a0
[0005bfe4] 226f 002a                 movea.l    42(a7),a1
[0005bfe8] 4e91                      jsr        (a1)
Ash_thermometer_11:
[0005bfea] 206f 0006                 movea.l    6(a7),a0
[0005bfee] 226f 0026                 movea.l    38(a7),a1
[0005bff2] 4e91                      jsr        (a1)
[0005bff4] 4a40                      tst.w      d0
[0005bff6] 66e2                      bne.s      Ash_thermometer_12
Ash_thermometer_10:
[0005bff8] 202f 002e                 move.l     46(a7),d0
[0005bffc] 670a                      beq.s      Ash_thermometer_9
[0005bffe] 206f 0006                 movea.l    6(a7),a0
[0005c002] 226f 002e                 movea.l    46(a7),a1
[0005c006] 4e91                      jsr        (a1)
Ash_thermometer_9:
[0005c008] 202f 0032                 move.l     50(a7),d0
[0005c00c] 670a                      beq.s      Ash_thermometer_13
[0005c00e] 206f 0006                 movea.l    6(a7),a0
[0005c012] 226f 0032                 movea.l    50(a7),a1
[0005c016] 4e91                      jsr        (a1)
Ash_thermometer_13:
[0005c018] 7072                      moveq.l    #114,d0
[0005c01a] 206f 0006                 movea.l    6(a7),a0
[0005c01e] 4eb9 0004 cc28            jsr        Ax_recycle
Ash_thermometer_6:
[0005c024] 3017                      move.w     (a7),d0
Ash_thermometer_2:
[0005c026] 4fef 0016                 lea.l      22(a7),a7
[0005c02a] 245f                      movea.l    (a7)+,a2
[0005c02c] 4e75                      rts

Prozent:
[0005c02e] 4fef ffe8                 lea.l      -24(a7),a7
[0005c032] 2f48 0014                 move.l     a0,20(a7)
[0005c036] 2f40 0010                 move.l     d0,16(a7)
[0005c03a] 206f 0014                 movea.l    20(a7),a0
[0005c03e] 2f50 000c                 move.l     (a0),12(a7)
[0005c042] 206f 000c                 movea.l    12(a7),a0
[0005c046] 3228 0062                 move.w     98(a0),d1
[0005c04a] d241                      add.w      d1,d1
[0005c04c] 41f9 000e 144c            lea.l      laufBNr,a0
[0005c052] 3230 1000                 move.w     0(a0,d1.w),d1
[0005c056] 48c1                      ext.l      d1
[0005c058] 2001                      move.l     d1,d0
[0005c05a] d080                      add.l      d0,d0
[0005c05c] d081                      add.l      d1,d0
[0005c05e] e788                      lsl.l      #3,d0
[0005c060] 206f 0014                 movea.l    20(a7),a0
[0005c064] 2068 0014                 movea.l    20(a0),a0
[0005c068] d1c0                      adda.l     d0,a0
[0005c06a] 2f48 0008                 move.l     a0,8(a7)
[0005c06e] 206f 000c                 movea.l    12(a7),a0
[0005c072] 3228 0062                 move.w     98(a0),d1
[0005c076] d241                      add.w      d1,d1
[0005c078] 41f9 000e 1454            lea.l      fixBNr,a0
[0005c07e] 3230 1000                 move.w     0(a0,d1.w),d1
[0005c082] 48c1                      ext.l      d1
[0005c084] 2001                      move.l     d1,d0
[0005c086] d080                      add.l      d0,d0
[0005c088] d081                      add.l      d1,d0
[0005c08a] e788                      lsl.l      #3,d0
[0005c08c] 206f 0014                 movea.l    20(a7),a0
[0005c090] 2068 0014                 movea.l    20(a0),a0
[0005c094] d1c0                      adda.l     d0,a0
[0005c096] 2f48 0004                 move.l     a0,4(a7)
[0005c09a] 4257                      clr.w      (a7)
[0005c09c] 206f 0004                 movea.l    4(a7),a0
[0005c0a0] 3028 0014                 move.w     20(a0),d0
[0005c0a4] 48c0                      ext.l      d0
[0005c0a6] 222f 0010                 move.l     16(a7),d1
[0005c0aa] 4eb9 0008 3cac            jsr        _lmul
[0005c0b0] 720c                      moveq.l    #12,d1
[0005c0b2] e2a0                      asr.l      d1,d0
[0005c0b4] 3f40 0002                 move.w     d0,2(a7)
[0005c0b8] 206f 0008                 movea.l    8(a7),a0
[0005c0bc] 3028 0014                 move.w     20(a0),d0
[0005c0c0] b06f 0002                 cmp.w      2(a7),d0
[0005c0c4] 6d06                      blt.s      Prozent_1
[0005c0c6] 302f 0002                 move.w     2(a7),d0
[0005c0ca] 665a                      bne.s      Prozent_2
Prozent_1:
[0005c0cc] 206f 0008                 movea.l    8(a7),a0
[0005c0d0] 316f 0002 0014            move.w     2(a7),20(a0)
[0005c0d6] 206f 0014                 movea.l    20(a7),a0
[0005c0da] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c0e0] 2368 0014 025c            move.l     20(a0),604(a1)
[0005c0e6] 206f 000c                 movea.l    12(a7),a0
[0005c0ea] 3028 0062                 move.w     98(a0),d0
[0005c0ee] d040                      add.w      d0,d0
[0005c0f0] 41f9 000e 144c            lea.l      laufBNr,a0
[0005c0f6] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c0fc] 3370 0000 0260            move.w     0(a0,d0.w),608(a1)
[0005c102] 72ff                      moveq.l    #-1,d1
[0005c104] 206f 000c                 movea.l    12(a7),a0
[0005c108] 3428 0062                 move.w     98(a0),d2
[0005c10c] d442                      add.w      d2,d2
[0005c10e] 41f9 000e 144c            lea.l      laufBNr,a0
[0005c114] 3030 2000                 move.w     0(a0,d2.w),d0
[0005c118] 206f 0014                 movea.l    20(a7),a0
[0005c11c] 4eb9 0005 1852            jsr        Awi_obchange
[0005c122] 3ebc 0001                 move.w     #$0001,(a7)
Prozent_2:
[0005c126] 7004                      moveq.l    #4,d0
[0005c128] 206f 000c                 movea.l    12(a7),a0
[0005c12c] c068 0064                 and.w      100(a0),d0
[0005c130] 6700 00ca                 beq        Prozent_3
[0005c134] 222f 0010                 move.l     16(a7),d1
[0005c138] 2001                      move.l     d1,d0
[0005c13a] d080                      add.l      d0,d0
[0005c13c] d081                      add.l      d1,d0
[0005c13e] e788                      lsl.l      #3,d0
[0005c140] d081                      add.l      d1,d0
[0005c142] e588                      lsl.l      #2,d0
[0005c144] 720c                      moveq.l    #12,d1
[0005c146] e2a0                      asr.l      d1,d0
[0005c148] 3f40 0002                 move.w     d0,2(a7)
[0005c14c] 3017                      move.w     (a7),d0
[0005c14e] 6616                      bne.s      Prozent_4
[0005c150] 206f 000c                 movea.l    12(a7),a0
[0005c154] 302f 0002                 move.w     2(a7),d0
[0005c158] b068 0060                 cmp.w      96(a0),d0
[0005c15c] 6e08                      bgt.s      Prozent_4
[0005c15e] 302f 0002                 move.w     2(a7),d0
[0005c162] 6600 0098                 bne        Prozent_3
Prozent_4:
[0005c166] 206f 000c                 movea.l    12(a7),a0
[0005c16a] 302f 0002                 move.w     2(a7),d0
[0005c16e] b068 0060                 cmp.w      96(a0),d0
[0005c172] 6e06                      bgt.s      Prozent_5
[0005c174] 302f 0002                 move.w     2(a7),d0
[0005c178] 660a                      bne.s      Prozent_6
Prozent_5:
[0005c17a] 206f 000c                 movea.l    12(a7),a0
[0005c17e] 316f 0002 0060            move.w     2(a7),96(a0)
Prozent_6:
[0005c184] 3f2f 0002                 move.w     2(a7),-(a7)
[0005c188] 43f9 000e 1464            lea.l      $000E1464,a1
[0005c18e] 206f 000e                 movea.l    14(a7),a0
[0005c192] 3228 0062                 move.w     98(a0),d1
[0005c196] d241                      add.w      d1,d1
[0005c198] 41f9 000e 145c            lea.l      prozNr,a0
[0005c19e] 3030 1000                 move.w     0(a0,d1.w),d0
[0005c1a2] 206f 0016                 movea.l    22(a7),a0
[0005c1a6] 2068 0014                 movea.l    20(a0),a0
[0005c1aa] 4eb9 0005 0f94            jsr        Aob_printf
[0005c1b0] 544f                      addq.w     #2,a7
[0005c1b2] 206f 0014                 movea.l    20(a7),a0
[0005c1b6] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c1bc] 2368 0014 025c            move.l     20(a0),604(a1)
[0005c1c2] 206f 000c                 movea.l    12(a7),a0
[0005c1c6] 3028 0062                 move.w     98(a0),d0
[0005c1ca] d040                      add.w      d0,d0
[0005c1cc] 41f9 000e 145c            lea.l      prozNr,a0
[0005c1d2] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c1d8] 3370 0000 0260            move.w     0(a0,d0.w),608(a1)
[0005c1de] 206f 000c                 movea.l    12(a7),a0
[0005c1e2] 3228 0062                 move.w     98(a0),d1
[0005c1e6] d241                      add.w      d1,d1
[0005c1e8] 41f9 000e 145c            lea.l      prozNr,a0
[0005c1ee] 3030 1000                 move.w     0(a0,d1.w),d0
[0005c1f2] 206f 0014                 movea.l    20(a7),a0
[0005c1f6] 4eb9 0005 1b80            jsr        Awi_obredraw
Prozent_3:
[0005c1fc] 4fef 0018                 lea.l      24(a7),a7
[0005c200] 4e75                      rts

TextUpdate:
[0005c202] 4fef fff4                 lea.l      -12(a7),a7
[0005c206] 2f48 0008                 move.l     a0,8(a7)
[0005c20a] 2f49 0004                 move.l     a1,4(a7)
[0005c20e] 206f 0008                 movea.l    8(a7),a0
[0005c212] 2e90                      move.l     (a0),(a7)
[0005c214] 7001                      moveq.l    #1,d0
[0005c216] 2057                      movea.l    (a7),a0
[0005c218] c068 0064                 and.w      100(a0),d0
[0005c21c] 676a                      beq.s      TextUpdate_1
[0005c21e] 226f 0004                 movea.l    4(a7),a1
[0005c222] 2057                      movea.l    (a7),a0
[0005c224] 3228 0062                 move.w     98(a0),d1
[0005c228] d241                      add.w      d1,d1
[0005c22a] 41f9 000e 1444            lea.l      textNr,a0
[0005c230] 3030 1000                 move.w     0(a0,d1.w),d0
[0005c234] 206f 0008                 movea.l    8(a7),a0
[0005c238] 2068 0014                 movea.l    20(a0),a0
[0005c23c] 4eb9 0005 0fd8            jsr        Aob_puttext
[0005c242] 206f 0008                 movea.l    8(a7),a0
[0005c246] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c24c] 2368 0014 025c            move.l     20(a0),604(a1)
[0005c252] 2057                      movea.l    (a7),a0
[0005c254] 3028 0062                 move.w     98(a0),d0
[0005c258] d040                      add.w      d0,d0
[0005c25a] 41f9 000e 1444            lea.l      textNr,a0
[0005c260] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c266] 3370 0000 0260            move.w     0(a0,d0.w),608(a1)
[0005c26c] 2057                      movea.l    (a7),a0
[0005c26e] 3228 0062                 move.w     98(a0),d1
[0005c272] d241                      add.w      d1,d1
[0005c274] 41f9 000e 1444            lea.l      textNr,a0
[0005c27a] 3030 1000                 move.w     0(a0,d1.w),d0
[0005c27e] 206f 0008                 movea.l    8(a7),a0
[0005c282] 4eb9 0005 1b80            jsr        Awi_obredraw
TextUpdate_1:
[0005c288] 4fef 000c                 lea.l      12(a7),a7
[0005c28c] 4e75                      rts

ThermoCreate:
[0005c28e] 2f0a                      move.l     a2,-(a7)
[0005c290] 4fef ffee                 lea.l      -18(a7),a7
[0005c294] 2f48 000a                 move.l     a0,10(a7)
[0005c298] 2f6f 000a 0002            move.l     10(a7),2(a7)
[0005c29e] 202f 0002                 move.l     2(a7),d0
[0005c2a2] 6606                      bne.s      ThermoCreate_1
[0005c2a4] 91c8                      suba.l     a0,a0
[0005c2a6] 6000 025e                 bra        ThermoCreate_2
ThermoCreate_1:
[0005c2aa] 7003                      moveq.l    #3,d0
[0005c2ac] 206f 0002                 movea.l    2(a7),a0
[0005c2b0] c068 0064                 and.w      100(a0),d0
[0005c2b4] 206f 0002                 movea.l    2(a7),a0
[0005c2b8] 3140 0062                 move.w     d0,98(a0)
[0005c2bc] 206f 0002                 movea.l    2(a7),a0
[0005c2c0] 3028 0062                 move.w     98(a0),d0
[0005c2c4] e548                      lsl.w      #2,d0
[0005c2c6] 41f9 000e 1434            lea.l      ThermObjs,a0
[0005c2cc] 23f0 0000 000e 13a6       move.l     0(a0,d0.w),$000E13A6
[0005c2d4] 206f 0002                 movea.l    2(a7),a0
[0005c2d8] 23e8 005c 000e 13dc       move.l     92(a0),$000E13DC
[0005c2e0] 41f9 000e 1392            lea.l      ThermWind,a0
[0005c2e6] 4eb9 0005 7052            jsr        Awi_create
[0005c2ec] 2f48 0006                 move.l     a0,6(a7)
[0005c2f0] 202f 0006                 move.l     6(a7),d0
[0005c2f4] 6606                      bne.s      ThermoCreate_3
[0005c2f6] 91c8                      suba.l     a0,a0
[0005c2f8] 6000 020c                 bra        ThermoCreate_2
ThermoCreate_3:
[0005c2fc] 206f 0006                 movea.l    6(a7),a0
[0005c300] 2068 0014                 movea.l    20(a0),a0
[0005c304] 226f 0006                 movea.l    6(a7),a1
[0005c308] 3368 0014 0038            move.w     20(a0),56(a1)
[0005c30e] 206f 0006                 movea.l    6(a7),a0
[0005c312] 2068 0014                 movea.l    20(a0),a0
[0005c316] 226f 0006                 movea.l    6(a7),a1
[0005c31a] 3368 0016 003a            move.w     22(a0),58(a1)
[0005c320] 2f39 000e 692a            move.l     _globl,-(a7)
[0005c326] 206f 000a                 movea.l    10(a7),a0
[0005c32a] 4868 002a                 pea.l      42(a0)
[0005c32e] 206f 000e                 movea.l    14(a7),a0
[0005c332] 4868 0028                 pea.l      40(a0)
[0005c336] 206f 0012                 movea.l    18(a7),a0
[0005c33a] 3f28 003a                 move.w     58(a0),-(a7)
[0005c33e] 206f 0014                 movea.l    20(a7),a0
[0005c342] 3f28 0038                 move.w     56(a0),-(a7)
[0005c346] 206f 0016                 movea.l    22(a7),a0
[0005c34a] 3f28 0036                 move.w     54(a0),-(a7)
[0005c34e] 43ef 0012                 lea.l      18(a7),a1
[0005c352] 41ef 0012                 lea.l      18(a7),a0
[0005c356] 246f 0018                 movea.l    24(a7),a2
[0005c35a] 342a 0034                 move.w     52(a2),d2
[0005c35e] 246f 0018                 movea.l    24(a7),a2
[0005c362] 322a 0022                 move.w     34(a2),d1
[0005c366] 4240                      clr.w      d0
[0005c368] 4eb9 0007 b8da            jsr        mt_wind_calc
[0005c36e] 4fef 0012                 lea.l      18(a7),a7
[0005c372] 206f 0006                 movea.l    6(a7),a0
[0005c376] 20af 0002                 move.l     2(a7),(a0)
[0005c37a] 206f 0002                 movea.l    2(a7),a0
[0005c37e] 216f 0006 006e            move.l     6(a7),110(a0)
[0005c384] 206f 0002                 movea.l    2(a7),a0
[0005c388] 20bc ffff ffff            move.l     #$FFFFFFFF,(a0)
[0005c38e] 206f 0002                 movea.l    2(a7),a0
[0005c392] 42a8 0004                 clr.l      4(a0)
[0005c396] 206f 0002                 movea.l    2(a7),a0
[0005c39a] 42a8 0008                 clr.l      8(a0)
[0005c39e] 206f 0002                 movea.l    2(a7),a0
[0005c3a2] 3228 0062                 move.w     98(a0),d1
[0005c3a6] d241                      add.w      d1,d1
[0005c3a8] 41f9 000e 144c            lea.l      laufBNr,a0
[0005c3ae] 3230 1000                 move.w     0(a0,d1.w),d1
[0005c3b2] 48c1                      ext.l      d1
[0005c3b4] 2001                      move.l     d1,d0
[0005c3b6] d080                      add.l      d0,d0
[0005c3b8] d081                      add.l      d1,d0
[0005c3ba] e788                      lsl.l      #3,d0
[0005c3bc] 206f 0006                 movea.l    6(a7),a0
[0005c3c0] 2068 0014                 movea.l    20(a0),a0
[0005c3c4] 4270 0814                 clr.w      20(a0,d0.l)
[0005c3c8] 7000                      moveq.l    #0,d0
[0005c3ca] 206f 0006                 movea.l    6(a7),a0
[0005c3ce] 6100 fc5e                 bsr        Prozent
[0005c3d2] 206f 0002                 movea.l    2(a7),a0
[0005c3d6] 3028 0066                 move.w     102(a0),d0
[0005c3da] 6b74                      bmi.s      ThermoCreate_4
[0005c3dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005c3e2] 0c68 0010 001a            cmpi.w     #$0010,26(a0)
[0005c3e8] 6d66                      blt.s      ThermoCreate_4
[0005c3ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005c3f0] 2068 023c                 movea.l    572(a0),a0
[0005c3f4] 3028 000e                 move.w     14(a0),d0
[0005c3f8] c07c 0100                 and.w      #$0100,d0
[0005c3fc] 6652                      bne.s      ThermoCreate_4
[0005c3fe] 206f 0002                 movea.l    2(a7),a0
[0005c402] 3228 0062                 move.w     98(a0),d1
[0005c406] d241                      add.w      d1,d1
[0005c408] 41f9 000e 144c            lea.l      laufBNr,a0
[0005c40e] 3230 1000                 move.w     0(a0,d1.w),d1
[0005c412] 48c1                      ext.l      d1
[0005c414] 2001                      move.l     d1,d0
[0005c416] d080                      add.l      d0,d0
[0005c418] d081                      add.l      d1,d0
[0005c41a] e788                      lsl.l      #3,d0
[0005c41c] 206f 0006                 movea.l    6(a7),a0
[0005c420] 2068 0014                 movea.l    20(a0),a0
[0005c424] 2f70 080c 000e            move.l     12(a0,d0.l),14(a7)
[0005c42a] 206f 000e                 movea.l    14(a7),a0
[0005c42e] 02a8 ffff ff80 0004       andi.l     #$FFFFFF80,4(a0)
[0005c436] 700f                      moveq.l    #15,d0
[0005c438] 206f 0002                 movea.l    2(a7),a0
[0005c43c] c068 0066                 and.w      102(a0),d0
[0005c440] 48c0                      ext.l      d0
[0005c442] 80bc 0000 0070            or.l       #$00000070,d0
[0005c448] 206f 000e                 movea.l    14(a7),a0
[0005c44c] 81a8 0004                 or.l       d0,4(a0)
ThermoCreate_4:
[0005c450] 206f 0002                 movea.l    2(a7),a0
[0005c454] 2010                      move.l     (a0),d0
[0005c456] 6a2e                      bpl.s      ThermoCreate_5
[0005c458] 206f 0002                 movea.l    2(a7),a0
[0005c45c] 2028 0044                 move.l     68(a0),d0
[0005c460] 6724                      beq.s      ThermoCreate_5
[0005c462] 206f 0002                 movea.l    2(a7),a0
[0005c466] 226f 0002                 movea.l    2(a7),a1
[0005c46a] 2269 0044                 movea.l    68(a1),a1
[0005c46e] 4e91                      jsr        (a1)
[0005c470] 4a40                      tst.w      d0
[0005c472] 6612                      bne.s      ThermoCreate_5
[0005c474] 93c9                      suba.l     a1,a1
[0005c476] 7002                      moveq.l    #2,d0
[0005c478] 206f 0006                 movea.l    6(a7),a0
[0005c47c] 246f 0006                 movea.l    6(a7),a2
[0005c480] 246a 0004                 movea.l    4(a2),a2
[0005c484] 4e92                      jsr        (a2)
ThermoCreate_5:
[0005c486] 7001                      moveq.l    #1,d0
[0005c488] 206f 0002                 movea.l    2(a7),a0
[0005c48c] c068 0064                 and.w      100(a0),d0
[0005c490] 672a                      beq.s      ThermoCreate_6
[0005c492] 226f 0002                 movea.l    2(a7),a1
[0005c496] 43e9 000c                 lea.l      12(a1),a1
[0005c49a] 206f 0002                 movea.l    2(a7),a0
[0005c49e] 3228 0062                 move.w     98(a0),d1
[0005c4a2] d241                      add.w      d1,d1
[0005c4a4] 41f9 000e 1444            lea.l      textNr,a0
[0005c4aa] 3030 1000                 move.w     0(a0,d1.w),d0
[0005c4ae] 206f 0006                 movea.l    6(a7),a0
[0005c4b2] 2068 0014                 movea.l    20(a0),a0
[0005c4b6] 4eb9 0005 0fd8            jsr        Aob_puttext
ThermoCreate_6:
[0005c4bc] 7004                      moveq.l    #4,d0
[0005c4be] 206f 0002                 movea.l    2(a7),a0
[0005c4c2] c068 0064                 and.w      100(a0),d0
[0005c4c6] 6604                      bne.s      ThermoCreate_7
[0005c4c8] 7401                      moveq.l    #1,d2
[0005c4ca] 6002                      bra.s      ThermoCreate_8
ThermoCreate_7:
[0005c4cc] 4242                      clr.w      d2
ThermoCreate_8:
[0005c4ce] 323c 0080                 move.w     #$0080,d1
[0005c4d2] 206f 0002                 movea.l    2(a7),a0
[0005c4d6] 3028 0062                 move.w     98(a0),d0
[0005c4da] d040                      add.w      d0,d0
[0005c4dc] 41f9 000e 145c            lea.l      prozNr,a0
[0005c4e2] 3030 0000                 move.w     0(a0,d0.w),d0
[0005c4e6] 206f 0006                 movea.l    6(a7),a0
[0005c4ea] 4eb9 0005 4784            jsr        Aob_flags
[0005c4f0] 206f 0006                 movea.l    6(a7),a0
[0005c4f4] 0068 0024 0056            ori.w      #$0024,86(a0)
[0005c4fa] 206f 0002                 movea.l    2(a7),a0
[0005c4fe] 4268 0068                 clr.w      104(a0)
[0005c502] 206f 0006                 movea.l    6(a7),a0
ThermoCreate_2:
[0005c506] 4fef 0012                 lea.l      18(a7),a7
[0005c50a] 245f                      movea.l    (a7)+,a2
[0005c50c] 4e75                      rts

ThermoService:
[0005c50e] 4fef fff6                 lea.l      -10(a7),a7
[0005c512] 2f48 0006                 move.l     a0,6(a7)
[0005c516] 3f40 0004                 move.w     d0,4(a7)
[0005c51a] 206f 0006                 movea.l    6(a7),a0
[0005c51e] 2e90                      move.l     (a0),(a7)
[0005c520] 302f 0004                 move.w     4(a7),d0
[0005c524] 5540                      subq.w     #2,d0
[0005c526] 6704                      beq.s      ThermoService_1
[0005c528] 6000 00da                 bra        ThermoService_2
ThermoService_1:
[0005c52c] 206f 0006                 movea.l    6(a7),a0
[0005c530] 3028 0056                 move.w     86(a0),d0
[0005c534] c07c 0200                 and.w      #$0200,d0
[0005c538] 6600 00c6                 bne        ThermoService_3
[0005c53c] 206f 0006                 movea.l    6(a7),a0
[0005c540] 0068 0200 0056            ori.w      #$0200,86(a0)
[0005c546] 206f 0006                 movea.l    6(a7),a0
[0005c54a] 0268 ffdf 0056            andi.w     #$FFDF,86(a0)
[0005c550] 2057                      movea.l    (a7),a0
[0005c552] 3028 0068                 move.w     104(a0),d0
[0005c556] 6742                      beq.s      ThermoService_4
[0005c558] 2057                      movea.l    (a7),a0
[0005c55a] 2028 0054                 move.l     84(a0),d0
[0005c55e] 673a                      beq.s      ThermoService_4
[0005c560] 7008                      moveq.l    #8,d0
[0005c562] 2057                      movea.l    (a7),a0
[0005c564] c068 0064                 and.w      100(a0),d0
[0005c568] 660e                      bne.s      ThermoService_5
[0005c56a] 2057                      movea.l    (a7),a0
[0005c56c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c572] 2368 006a 0232            move.l     106(a0),562(a1)
ThermoService_5:
[0005c578] 2057                      movea.l    (a7),a0
[0005c57a] 2257                      movea.l    (a7),a1
[0005c57c] 2269 0054                 movea.l    84(a1),a1
[0005c580] 4e91                      jsr        (a1)
[0005c582] 7008                      moveq.l    #8,d0
[0005c584] 2057                      movea.l    (a7),a0
[0005c586] c068 0064                 and.w      100(a0),d0
[0005c58a] 660e                      bne.s      ThermoService_4
[0005c58c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005c592] 217c 0000 0001 0232       move.l     #$00000001,562(a0)
ThermoService_4:
[0005c59a] 206f 0006                 movea.l    6(a7),a0
[0005c59e] 4eb9 0005 85f2            jsr        Awi_delete
[0005c5a4] 2057                      movea.l    (a7),a0
[0005c5a6] 42a8 006e                 clr.l      110(a0)
[0005c5aa] 2057                      movea.l    (a7),a0
[0005c5ac] 2028 0058                 move.l     88(a0),d0
[0005c5b0] 673a                      beq.s      ThermoService_6
[0005c5b2] 7008                      moveq.l    #8,d0
[0005c5b4] 2057                      movea.l    (a7),a0
[0005c5b6] c068 0064                 and.w      100(a0),d0
[0005c5ba] 660e                      bne.s      ThermoService_7
[0005c5bc] 2057                      movea.l    (a7),a0
[0005c5be] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c5c4] 2368 006a 0232            move.l     106(a0),562(a1)
ThermoService_7:
[0005c5ca] 2057                      movea.l    (a7),a0
[0005c5cc] 2257                      movea.l    (a7),a1
[0005c5ce] 2269 0058                 movea.l    88(a1),a1
[0005c5d2] 4e91                      jsr        (a1)
[0005c5d4] 7008                      moveq.l    #8,d0
[0005c5d6] 2057                      movea.l    (a7),a0
[0005c5d8] c068 0064                 and.w      100(a0),d0
[0005c5dc] 660e                      bne.s      ThermoService_6
[0005c5de] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005c5e4] 217c 0000 0001 0232       move.l     #$00000001,562(a0)
ThermoService_6:
[0005c5ec] 7008                      moveq.l    #8,d0
[0005c5ee] 2057                      movea.l    (a7),a0
[0005c5f0] c068 0064                 and.w      100(a0),d0
[0005c5f4] 670a                      beq.s      ThermoService_3
[0005c5f6] 7072                      moveq.l    #114,d0
[0005c5f8] 2057                      movea.l    (a7),a0
[0005c5fa] 4eb9 0004 cc28            jsr        Ax_recycle
ThermoService_3:
[0005c600] 7001                      moveq.l    #1,d0
[0005c602] 6002                      bra.s      ThermoService_8
ThermoService_2:
[0005c604] 4240                      clr.w      d0
ThermoService_8:
[0005c606] 4fef 000a                 lea.l      10(a7),a7
[0005c60a] 4e75                      rts

ThermoInit:
[0005c60c] 2f0a                      move.l     a2,-(a7)
[0005c60e] 4fef ffea                 lea.l      -22(a7),a7
[0005c612] 2f48 000a                 move.l     a0,10(a7)
[0005c616] 206f 000a                 movea.l    10(a7),a0
[0005c61a] 2f50 0006                 move.l     (a0),6(a7)
[0005c61e] 3ebc 0001                 move.w     #$0001,(a7)
[0005c622] 206f 0006                 movea.l    6(a7),a0
[0005c626] 3028 0068                 move.w     104(a0),d0
[0005c62a] 6700 0132                 beq        ThermoInit_1
[0005c62e] 7008                      moveq.l    #8,d0
[0005c630] 206f 0006                 movea.l    6(a7),a0
[0005c634] c068 0064                 and.w      100(a0),d0
[0005c638] 6610                      bne.s      ThermoInit_2
[0005c63a] 206f 0006                 movea.l    6(a7),a0
[0005c63e] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c644] 2368 006a 0232            move.l     106(a0),562(a1)
ThermoInit_2:
[0005c64a] 206f 000a                 movea.l    10(a7),a0
[0005c64e] 0268 ffdf 0056            andi.w     #$FFDF,86(a0)
[0005c654] 206f 0006                 movea.l    6(a7),a0
[0005c658] 2028 004c                 move.l     76(a0),d0
[0005c65c] 6716                      beq.s      ThermoInit_3
[0005c65e] 206f 0006                 movea.l    6(a7),a0
[0005c662] 226f 0006                 movea.l    6(a7),a1
[0005c666] 2269 004c                 movea.l    76(a1),a1
[0005c66a] 4e91                      jsr        (a1)
[0005c66c] 4a40                      tst.w      d0
[0005c66e] 6704                      beq.s      ThermoInit_3
[0005c670] 7001                      moveq.l    #1,d0
[0005c672] 6002                      bra.s      ThermoInit_4
ThermoInit_3:
[0005c674] 4240                      clr.w      d0
ThermoInit_4:
[0005c676] 3e80                      move.w     d0,(a7)
[0005c678] 226f 0006                 movea.l    6(a7),a1
[0005c67c] 43e9 000c                 lea.l      12(a1),a1
[0005c680] 206f 000a                 movea.l    10(a7),a0
[0005c684] 6100 fb7c                 bsr        TextUpdate
[0005c688] 3017                      move.w     (a7),d0
[0005c68a] 6718                      beq.s      ThermoInit_5
[0005c68c] 206f 0006                 movea.l    6(a7),a0
[0005c690] 2028 0050                 move.l     80(a0),d0
[0005c694] 670e                      beq.s      ThermoInit_5
[0005c696] 206f 0006                 movea.l    6(a7),a0
[0005c69a] 226f 0006                 movea.l    6(a7),a1
[0005c69e] 2269 0050                 movea.l    80(a1),a1
[0005c6a2] 4e91                      jsr        (a1)
ThermoInit_5:
[0005c6a4] 206f 0006                 movea.l    6(a7),a0
[0005c6a8] 5290                      addq.l     #1,(a0)
[0005c6aa] 7008                      moveq.l    #8,d0
[0005c6ac] 206f 0006                 movea.l    6(a7),a0
[0005c6b0] c068 0064                 and.w      100(a0),d0
[0005c6b4] 660e                      bne.s      ThermoInit_6
[0005c6b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005c6bc] 217c 0000 0001 0232       move.l     #$00000001,562(a0)
ThermoInit_6:
[0005c6c4] 3017                      move.w     (a7),d0
[0005c6c6] 6764                      beq.s      ThermoInit_7
[0005c6c8] 206f 0006                 movea.l    6(a7),a0
[0005c6cc] 2028 0008                 move.l     8(a0),d0
[0005c6d0] 675a                      beq.s      ThermoInit_7
[0005c6d2] 206f 0006                 movea.l    6(a7),a0
[0005c6d6] 2028 0004                 move.l     4(a0),d0
[0005c6da] c0bc fff0 0000            and.l      #$FFF00000,d0
[0005c6e0] 2f40 0012                 move.l     d0,18(a7)
[0005c6e4] 206f 0006                 movea.l    6(a7),a0
[0005c6e8] 2028 0004                 move.l     4(a0),d0
[0005c6ec] c0bc 000f ffff            and.l      #$000FFFFF,d0
[0005c6f2] 2f40 000e                 move.l     d0,14(a7)
[0005c6f6] 202f 000e                 move.l     14(a7),d0
[0005c6fa] 720c                      moveq.l    #12,d1
[0005c6fc] e3a8                      lsl.l      d1,d0
[0005c6fe] 206f 0006                 movea.l    6(a7),a0
[0005c702] 2228 0008                 move.l     8(a0),d1
[0005c706] 4eb9 0008 3c5a            jsr        _uldiv
[0005c70c] 2f00                      move.l     d0,-(a7)
[0005c70e] 202f 0016                 move.l     22(a7),d0
[0005c712] 206f 000a                 movea.l    10(a7),a0
[0005c716] 2228 0008                 move.l     8(a0),d1
[0005c71a] 4eb9 0008 3c5a            jsr        _uldiv
[0005c720] 720c                      moveq.l    #12,d1
[0005c722] e2a8                      lsr.l      d1,d0
[0005c724] d09f                      add.l      (a7)+,d0
[0005c726] 2f40 0002                 move.l     d0,2(a7)
[0005c72a] 6008                      bra.s      ThermoInit_8
ThermoInit_7:
[0005c72c] 2f7c 0000 1000 0002       move.l     #$00001000,2(a7)
ThermoInit_8:
[0005c734] 202f 0002                 move.l     2(a7),d0
[0005c738] 6a06                      bpl.s      ThermoInit_9
[0005c73a] 42af 0002                 clr.l      2(a7)
[0005c73e] 6012                      bra.s      ThermoInit_10
ThermoInit_9:
[0005c740] 0caf 0000 1000 0002       cmpi.l     #$00001000,2(a7)
[0005c748] 6f08                      ble.s      ThermoInit_10
[0005c74a] 2f7c 0000 1000 0002       move.l     #$00001000,2(a7)
ThermoInit_10:
[0005c752] 202f 0002                 move.l     2(a7),d0
[0005c756] 206f 000a                 movea.l    10(a7),a0
[0005c75a] 6100 f8d2                 bsr        Prozent
ThermoInit_1:
[0005c75e] 206f 0006                 movea.l    6(a7),a0
[0005c762] 3028 0068                 move.w     104(a0),d0
[0005c766] 6600 007e                 bne.w      ThermoInit_11
[0005c76a] 206f 000a                 movea.l    10(a7),a0
[0005c76e] 3028 0020                 move.w     32(a0),d0
[0005c772] 6b72                      bmi.s      ThermoInit_11
[0005c774] 206f 0006                 movea.l    6(a7),a0
[0005c778] 2028 0048                 move.l     72(a0),d0
[0005c77c] 6750                      beq.s      ThermoInit_12
[0005c77e] 7008                      moveq.l    #8,d0
[0005c780] 206f 0006                 movea.l    6(a7),a0
[0005c784] c068 0064                 and.w      100(a0),d0
[0005c788] 6610                      bne.s      ThermoInit_13
[0005c78a] 206f 0006                 movea.l    6(a7),a0
[0005c78e] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c794] 2368 006a 0232            move.l     106(a0),562(a1)
ThermoInit_13:
[0005c79a] 206f 000a                 movea.l    10(a7),a0
[0005c79e] 0268 ffdf 0056            andi.w     #$FFDF,86(a0)
[0005c7a4] 206f 0006                 movea.l    6(a7),a0
[0005c7a8] 226f 0006                 movea.l    6(a7),a1
[0005c7ac] 2269 0048                 movea.l    72(a1),a1
[0005c7b0] 4e91                      jsr        (a1)
[0005c7b2] 3e80                      move.w     d0,(a7)
[0005c7b4] 7008                      moveq.l    #8,d0
[0005c7b6] 206f 0006                 movea.l    6(a7),a0
[0005c7ba] c068 0064                 and.w      100(a0),d0
[0005c7be] 660e                      bne.s      ThermoInit_12
[0005c7c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005c7c6] 217c 0000 0001 0232       move.l     #$00000001,562(a0)
ThermoInit_12:
[0005c7ce] 226f 0006                 movea.l    6(a7),a1
[0005c7d2] 43e9 000c                 lea.l      12(a1),a1
[0005c7d6] 206f 000a                 movea.l    10(a7),a0
[0005c7da] 6100 fa26                 bsr        TextUpdate
[0005c7de] 206f 0006                 movea.l    6(a7),a0
[0005c7e2] 3157 0068                 move.w     (a7),104(a0)
ThermoInit_11:
[0005c7e6] 206f 000a                 movea.l    10(a7),a0
[0005c7ea] 3028 0056                 move.w     86(a0),d0
[0005c7ee] c07c 0200                 and.w      #$0200,d0
[0005c7f2] 6642                      bne.s      ThermoInit_14
[0005c7f4] 206f 000a                 movea.l    10(a7),a0
[0005c7f8] 0068 0020 0056            ori.w      #$0020,86(a0)
[0005c7fe] 7008                      moveq.l    #8,d0
[0005c800] 206f 0006                 movea.l    6(a7),a0
[0005c804] c068 0064                 and.w      100(a0),d0
[0005c808] 6616                      bne.s      ThermoInit_15
[0005c80a] 3017                      move.w     (a7),d0
[0005c80c] 6604                      bne.s      ThermoInit_16
[0005c80e] 7001                      moveq.l    #1,d0
[0005c810] 6002                      bra.s      ThermoInit_17
ThermoInit_16:
[0005c812] 4240                      clr.w      d0
ThermoInit_17:
[0005c814] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005c81a] 3140 0268                 move.w     d0,616(a0)
[0005c81e] 6016                      bra.s      ThermoInit_14
ThermoInit_15:
[0005c820] 3017                      move.w     (a7),d0
[0005c822] 6612                      bne.s      ThermoInit_14
[0005c824] 93c9                      suba.l     a1,a1
[0005c826] 7002                      moveq.l    #2,d0
[0005c828] 206f 000a                 movea.l    10(a7),a0
[0005c82c] 246f 000a                 movea.l    10(a7),a2
[0005c830] 246a 0004                 movea.l    4(a2),a2
[0005c834] 4e92                      jsr        (a2)
ThermoInit_14:
[0005c836] 4240                      clr.w      d0
[0005c838] 4fef 0016                 lea.l      22(a7),a7
[0005c83c] 245f                      movea.l    (a7)+,a2
[0005c83e] 4e75                      rts

ThermCancel:
[0005c840] 2f0a                      move.l     a2,-(a7)
[0005c842] 514f                      subq.w     #8,a7
[0005c844] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005c84a] 2f68 0258 0004            move.l     600(a0),4(a7)
[0005c850] 206f 0004                 movea.l    4(a7),a0
[0005c854] 2e90                      move.l     (a0),(a7)
[0005c856] 2057                      movea.l    (a7),a0
[0005c858] 2028 0054                 move.l     84(a0),d0
[0005c85c] 6700 0094                 beq        ThermCancel_1
[0005c860] 7008                      moveq.l    #8,d0
[0005c862] 2057                      movea.l    (a7),a0
[0005c864] c068 0064                 and.w      100(a0),d0
[0005c868] 660e                      bne.s      ThermCancel_2
[0005c86a] 2057                      movea.l    (a7),a0
[0005c86c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c872] 2368 006a 0232            move.l     106(a0),562(a1)
ThermCancel_2:
[0005c878] 206f 0004                 movea.l    4(a7),a0
[0005c87c] 0268 ffdf 0056            andi.w     #$FFDF,86(a0)
[0005c882] 2057                      movea.l    (a7),a0
[0005c884] 2257                      movea.l    (a7),a1
[0005c886] 2269 0054                 movea.l    84(a1),a1
[0005c88a] 4e91                      jsr        (a1)
[0005c88c] 4a40                      tst.w      d0
[0005c88e] 6740                      beq.s      ThermCancel_3
[0005c890] 2257                      movea.l    (a7),a1
[0005c892] 43e9 000c                 lea.l      12(a1),a1
[0005c896] 206f 0004                 movea.l    4(a7),a0
[0005c89a] 6100 f966                 bsr        TextUpdate
[0005c89e] 7008                      moveq.l    #8,d0
[0005c8a0] 2057                      movea.l    (a7),a0
[0005c8a2] c068 0064                 and.w      100(a0),d0
[0005c8a6] 6714                      beq.s      ThermCancel_4
[0005c8a8] 93c9                      suba.l     a1,a1
[0005c8aa] 7002                      moveq.l    #2,d0
[0005c8ac] 206f 0004                 movea.l    4(a7),a0
[0005c8b0] 246f 0004                 movea.l    4(a7),a2
[0005c8b4] 246a 0004                 movea.l    4(a2),a2
[0005c8b8] 4e92                      jsr        (a2)
[0005c8ba] 600c                      bra.s      ThermCancel_5
ThermCancel_4:
[0005c8bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005c8c2] 317c 0001 0268            move.w     #$0001,616(a0)
ThermCancel_5:
[0005c8c8] 2057                      movea.l    (a7),a0
[0005c8ca] 4268 0068                 clr.w      104(a0)
[0005c8ce] 600a                      bra.s      ThermCancel_6
ThermCancel_3:
[0005c8d0] 206f 0004                 movea.l    4(a7),a0
[0005c8d4] 0068 0020 0056            ori.w      #$0020,86(a0)
ThermCancel_6:
[0005c8da] 7008                      moveq.l    #8,d0
[0005c8dc] 2057                      movea.l    (a7),a0
[0005c8de] c068 0064                 and.w      100(a0),d0
[0005c8e2] 660e                      bne.s      ThermCancel_1
[0005c8e4] 2057                      movea.l    (a7),a0
[0005c8e6] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005c8ec] 2368 006a 0232            move.l     106(a0),562(a1)
ThermCancel_1:
[0005c8f2] 504f                      addq.w     #8,a7
[0005c8f4] 245f                      movea.l    (a7)+,a2
[0005c8f6] 4e75                      rts

ThermoClosed:
[0005c8f8] 4e75                      rts

ThermoGEMScript:
[0005c8fa] 7001                      moveq.l    #1,d0
[0005c8fc] 4e75                      rts

	.data

TEXT_02:
[000e1008]                           dc.w $0049
[000e100a]                           dc.b 'nitialisierung...                                ',0
TEXT_04:
[000e103c]                           dc.b 'Abbrechen',0
TEXT_05:
[000e1046]                           dc.w $0031
[000e1048]                           dc.b '00 %',0
[000e104d]                           dc.b $00
[000e104e] 000e1047                  dc.l TEXT_06
[000e1052] 000e1008                  dc.l TEXT_02
[000e1056] 000e1008                  dc.l TEXT_02
[000e105a]                           dc.w $0003
[000e105c]                           dc.w $0006
[000e105e]                           dc.w $0002
[000e1060]                           dc.w $1100
[000e1062]                           dc.w $0000
[000e1064]                           dc.w $0000
[000e1066]                           dc.w $0006
[000e1068]                           dc.w $0001
TEDINFO_03:
[000e106a] 000e1047                  dc.l TEXT_06
[000e106e] 000e1008                  dc.l TEXT_02
[000e1072] 000e1008                  dc.l TEXT_02
[000e1076]                           dc.w $0003
[000e1078]                           dc.w $0006
[000e107a]                           dc.w $0002
[000e107c]                           dc.w $1100
[000e107e]                           dc.w $0000
[000e1080]                           dc.w $ffff
[000e1082]                           dc.w $0006
[000e1084]                           dc.w $0001
TEDINFO_04:
[000e1086] 000e1009                  dc.l TEXT_03
[000e108a] 000e1008                  dc.l TEXT_02
[000e108e] 000e1008                  dc.l TEXT_02
[000e1092]                           dc.w $0005
[000e1094]                           dc.w $0006
[000e1096]                           dc.w $0000
[000e1098]                           dc.w $1100
[000e109a]                           dc.w $0000
[000e109c]                           dc.w $ffff
[000e109e]                           dc.w $0033
[000e10a0]                           dc.w $0001
A_3DBUTTON01:
[000e10a2] 00064a22                  dc.l A_3Dbutton
[000e10a6]                           dc.w $29f1
[000e10a8]                           dc.w $0178
[000e10aa] 000630f2                  dc.l Auo_string
[000e10ae]                           dc.w $0000
[000e10b0]                           dc.w $0000
[000e10b2]                           dc.w $0000
[000e10b4]                           dc.w $0000
[000e10b6]                           dc.w $0000
[000e10b8]                           dc.w $0000
[000e10ba]                           dc.w $0000
[000e10bc]                           dc.w $0000
[000e10be]                           dc.w $0000
[000e10c0]                           dc.w $0000
A_3DBUTTON02:
[000e10c2] 00064a22                  dc.l A_3Dbutton
[000e10c6]                           dc.w $2001
[000e10c8]                           dc.w $9178
[000e10ca] 000630f2                  dc.l Auo_string
[000e10ce]                           dc.w $0000
[000e10d0]                           dc.w $0000
[000e10d2]                           dc.w $0000
[000e10d4]                           dc.w $0000
[000e10d6]                           dc.w $0000
[000e10d8]                           dc.w $0000
[000e10da]                           dc.w $0000
[000e10dc]                           dc.w $0000
[000e10de]                           dc.w $0000
[000e10e0]                           dc.w $0000
A_3DBUTTON04:
[000e10e2] 00064a22                  dc.l A_3Dbutton
[000e10e6]                           dc.w $2901
[000e10e8]                           dc.w $0178
[000e10ea] 000630f2                  dc.l Auo_string
[000e10ee] 000e103c                  dc.l TEXT_04
[000e10f2]                           dc.w $0000
[000e10f4]                           dc.w $0000
[000e10f6]                           dc.w $0000
[000e10f8]                           dc.w $0000
[000e10fa]                           dc.w $0000
[000e10fc]                           dc.w $0000
[000e10fe]                           dc.w $0000
[000e1100]                           dc.w $0000
A_3DBUTTON05:
[000e1102] 00064a22                  dc.l A_3Dbutton
[000e1106]                           dc.w $29f1
[000e1108]                           dc.w $0178
[000e110a] 000630f2                  dc.l Auo_string
[000e110e]                           dc.w $0000
[000e1110]                           dc.w $0000
[000e1112]                           dc.w $0000
[000e1114]                           dc.w $0000
[000e1116]                           dc.w $0000
[000e1118]                           dc.w $0000
[000e111a]                           dc.w $0000
[000e111c]                           dc.w $0000
[000e111e]                           dc.w $0000
[000e1120]                           dc.w $0000
A_3DBUTTON06:
[000e1122] 00064a22                  dc.l A_3Dbutton
[000e1126]                           dc.w $29f1
[000e1128]                           dc.w $0178
[000e112a] 000630f2                  dc.l Auo_string
[000e112e]                           dc.w $0000
[000e1130]                           dc.w $0000
[000e1132]                           dc.w $0000
[000e1134]                           dc.w $0000
[000e1136]                           dc.w $0000
[000e1138]                           dc.w $0000
[000e113a]                           dc.w $0000
[000e113c]                           dc.w $0000
[000e113e]                           dc.w $0000
[000e1140]                           dc.w $0000
A_3DBUTTON07:
[000e1142] 00064a22                  dc.l A_3Dbutton
[000e1146]                           dc.w $29f1
[000e1148]                           dc.w $0178
[000e114a] 000630f2                  dc.l Auo_string
[000e114e]                           dc.w $0000
[000e1150]                           dc.w $0000
[000e1152]                           dc.w $0000
[000e1154]                           dc.w $0000
[000e1156]                           dc.w $0000
[000e1158]                           dc.w $0000
[000e115a]                           dc.w $0000
[000e115c]                           dc.w $0000
[000e115e]                           dc.w $0000
[000e1160]                           dc.w $0000
A_3DBUTTON08:
[000e1162] 00064a22                  dc.l A_3Dbutton
[000e1166]                           dc.w $29f1
[000e1168]                           dc.w $0178
[000e116a] 000630f2                  dc.l Auo_string
[000e116e]                           dc.w $0000
[000e1170]                           dc.w $0000
[000e1172]                           dc.w $0000
[000e1174]                           dc.w $0000
[000e1176]                           dc.w $0000
[000e1178]                           dc.w $0000
[000e117a]                           dc.w $0000
[000e117c]                           dc.w $0000
[000e117e]                           dc.w $0000
[000e1180]                           dc.w $0000
ThermAObj:
[000e1182]                           dc.w $ffff
[000e1184]                           dc.w $0001
[000e1186]                           dc.w $0003
[000e1188]                           dc.w $0018
[000e118a]                           dc.w $0000
[000e118c]                           dc.w $0000
[000e118e] 000e10a2                  dc.l A_3DBUTTON01
[000e1192]                           dc.w $0000
[000e1194]                           dc.w $0000
[000e1196]                           dc.w $0029
[000e1198]                           dc.w $0404
_01_ThermAObj:
[000e119a]                           dc.w $0003
[000e119c]                           dc.w $ffff
[000e119e]                           dc.w $ffff
[000e11a0]                           dc.w $0018
[000e11a2]                           dc.w $0045
[000e11a4]                           dc.w $0000
[000e11a6] 000e10e2                  dc.l A_3DBUTTON04
[000e11aa]                           dc.w $000d
[000e11ac]                           dc.w $0c02
[000e11ae]                           dc.w $0010
[000e11b0]                           dc.w $0001
_01aThermAObj:
[000e11b2] 0005c840                  dc.l ThermCancel
[000e11b6]                           dc.w $0000
[000e11b8]                           dc.w $0000
[000e11ba]                           dc.w $8000
[000e11bc]                           dc.w $8841
[000e11be]                           dc.w $0000
[000e11c0]                           dc.w $0000
[000e11c2]                           dc.w $0000
[000e11c4]                           dc.w $0000
[000e11c6]                           dc.w $0000
[000e11c8]                           dc.w $0000
_03_ThermAObj:
[000e11ca]                           dc.w $0000
[000e11cc]                           dc.w $0004
[000e11ce]                           dc.w $0005
[000e11d0]                           dc.w $0018
[000e11d2]                           dc.w $0000
[000e11d4]                           dc.w $0000
[000e11d6] 000e10c2                  dc.l A_3DBUTTON02
[000e11da]                           dc.w $0001
[000e11dc]                           dc.w $0001
[000e11de]                           dc.w $0027
[000e11e0]                           dc.w $0401
_04_ThermAObj:
[000e11e2]                           dc.w $0005
[000e11e4]                           dc.w $ffff
[000e11e6]                           dc.w $ffff
[000e11e8]                           dc.w $0018
[000e11ea]                           dc.w $0000
[000e11ec]                           dc.w $0000
[000e11ee] 000e1102                  dc.l A_3DBUTTON05
[000e11f2]                           dc.w $0000
[000e11f4]                           dc.w $0000
[000e11f6]                           dc.w $000b
[000e11f8]                           dc.w $0401
_05_ThermAObj:
[000e11fa]                           dc.w $0003
[000e11fc]                           dc.w $ffff
[000e11fe]                           dc.w $ffff
[000e1200]                           dc.w $0015
[000e1202]                           dc.w $0020
[000e1204]                           dc.w $0000
[000e1206] 000e106a                  dc.l TEDINFO_03
[000e120a]                           dc.w $0011
[000e120c]                           dc.w $0200
[000e120e]                           dc.w $0005
[000e1210]                           dc.w $0001
ThermObj:
[000e1212]                           dc.w $ffff
[000e1214]                           dc.w $0001
[000e1216]                           dc.w $0001
[000e1218]                           dc.w $0018
[000e121a]                           dc.w $0000
[000e121c]                           dc.w $0000
[000e121e] 000e10a2                  dc.l A_3DBUTTON01
[000e1222]                           dc.w $0000
[000e1224]                           dc.w $0000
[000e1226]                           dc.w $0029
[000e1228]                           dc.w $0403
_01_ThermObj:
[000e122a]                           dc.w $0000
[000e122c]                           dc.w $0002
[000e122e]                           dc.w $0003
[000e1230]                           dc.w $0018
[000e1232]                           dc.w $0000
[000e1234]                           dc.w $0000
[000e1236] 000e10c2                  dc.l A_3DBUTTON02
[000e123a]                           dc.w $0001
[000e123c]                           dc.w $0001
[000e123e]                           dc.w $0027
[000e1240]                           dc.w $0401
_02_ThermObj:
[000e1242]                           dc.w $0003
[000e1244]                           dc.w $ffff
[000e1246]                           dc.w $ffff
[000e1248]                           dc.w $0018
[000e124a]                           dc.w $0000
[000e124c]                           dc.w $0000
[000e124e] 000e1122                  dc.l A_3DBUTTON06
[000e1252]                           dc.w $0000
[000e1254]                           dc.w $0000
[000e1256]                           dc.w $000b
[000e1258]                           dc.w $0401
_03_ThermObj:
[000e125a]                           dc.w $0001
[000e125c]                           dc.w $ffff
[000e125e]                           dc.w $ffff
[000e1260]                           dc.w $0015
[000e1262]                           dc.w $0020
[000e1264]                           dc.w $0000
[000e1266] 000e106a                  dc.l TEDINFO_03
[000e126a]                           dc.w $0011
[000e126c]                           dc.w $0200
[000e126e]                           dc.w $0005
[000e1270]                           dc.w $0001
ThermTAObj:
[000e1272]                           dc.w $ffff
[000e1274]                           dc.w $0001
[000e1276]                           dc.w $0005
[000e1278]                           dc.w $0018
[000e127a]                           dc.w $0000
[000e127c]                           dc.w $0000
[000e127e] 000e10a2                  dc.l A_3DBUTTON01
[000e1282]                           dc.w $0000
[000e1284]                           dc.w $0000
[000e1286]                           dc.w $0029
[000e1288]                           dc.w $0405
_01_ThermTAObj:
[000e128a]                           dc.w $0002
[000e128c]                           dc.w $ffff
[000e128e]                           dc.w $ffff
[000e1290]                           dc.w $0015
[000e1292]                           dc.w $0000
[000e1294]                           dc.w $0000
[000e1296] 000e1086                  dc.l TEDINFO_04
[000e129a]                           dc.w $0001
[000e129c]                           dc.w $0000
[000e129e]                           dc.w $0027
[000e12a0]                           dc.w $0002
_02_ThermTAObj:
[000e12a2]                           dc.w $0005
[000e12a4]                           dc.w $0003
[000e12a6]                           dc.w $0004
[000e12a8]                           dc.w $0018
[000e12aa]                           dc.w $0000
[000e12ac]                           dc.w $0000
[000e12ae] 000e10c2                  dc.l A_3DBUTTON02
[000e12b2]                           dc.w $0001
[000e12b4]                           dc.w $0002
[000e12b6]                           dc.w $0027
[000e12b8]                           dc.w $0401
_03_ThermTAObj:
[000e12ba]                           dc.w $0004
[000e12bc]                           dc.w $ffff
[000e12be]                           dc.w $ffff
[000e12c0]                           dc.w $0018
[000e12c2]                           dc.w $0000
[000e12c4]                           dc.w $0000
[000e12c6] 000e1142                  dc.l A_3DBUTTON07
[000e12ca]                           dc.w $0000
[000e12cc]                           dc.w $0000
[000e12ce]                           dc.w $000b
[000e12d0]                           dc.w $0401
_04_ThermTAObj:
[000e12d2]                           dc.w $0002
[000e12d4]                           dc.w $ffff
[000e12d6]                           dc.w $ffff
[000e12d8]                           dc.w $0015
[000e12da]                           dc.w $0000
[000e12dc]                           dc.w $0000
[000e12de] 000e106a                  dc.l TEDINFO_03
[000e12e2]                           dc.w $0011
[000e12e4]                           dc.w $0200
[000e12e6]                           dc.w $0005
[000e12e8]                           dc.w $0001
_05_ThermTAObj:
[000e12ea]                           dc.w $0000
[000e12ec]                           dc.w $ffff
[000e12ee]                           dc.w $ffff
[000e12f0]                           dc.w $0018
[000e12f2]                           dc.w $0045
[000e12f4]                           dc.w $0000
[000e12f6] 000e10e2                  dc.l A_3DBUTTON04
[000e12fa]                           dc.w $000d
[000e12fc]                           dc.w $0c03
[000e12fe]                           dc.w $0010
[000e1300]                           dc.w $0001
_05aThermTAObj:
[000e1302] 0005c840                  dc.l ThermCancel
[000e1306]                           dc.w $0000
[000e1308]                           dc.w $0000
[000e130a]                           dc.w $8020
[000e130c]                           dc.w $8841
[000e130e]                           dc.w $0000
[000e1310]                           dc.w $0000
[000e1312]                           dc.w $0000
[000e1314]                           dc.w $0000
[000e1316]                           dc.w $0000
[000e1318]                           dc.w $0000
ThermTObj:
[000e131a]                           dc.w $ffff
[000e131c]                           dc.w $0001
[000e131e]                           dc.w $0002
[000e1320]                           dc.w $0018
[000e1322]                           dc.w $0000
[000e1324]                           dc.w $0000
[000e1326] 000e10a2                  dc.l A_3DBUTTON01
[000e132a]                           dc.w $0000
[000e132c]                           dc.w $0000
[000e132e]                           dc.w $0029
[000e1330]                           dc.w $0404
_01_ThermTObj:
[000e1332]                           dc.w $0002
[000e1334]                           dc.w $ffff
[000e1336]                           dc.w $ffff
[000e1338]                           dc.w $0015
[000e133a]                           dc.w $0000
[000e133c]                           dc.w $0000
[000e133e] 000e1086                  dc.l TEDINFO_04
[000e1342]                           dc.w $0001
[000e1344]                           dc.w $0000
[000e1346]                           dc.w $0027
[000e1348]                           dc.w $0002
_02_ThermTObj:
[000e134a]                           dc.w $0000
[000e134c]                           dc.w $0003
[000e134e]                           dc.w $0004
[000e1350]                           dc.w $0018
[000e1352]                           dc.w $0000
[000e1354]                           dc.w $0000
[000e1356] 000e10c2                  dc.l A_3DBUTTON02
[000e135a]                           dc.w $0001
[000e135c]                           dc.w $0002
[000e135e]                           dc.w $0027
[000e1360]                           dc.w $0401
_03_ThermTObj:
[000e1362]                           dc.w $0004
[000e1364]                           dc.w $ffff
[000e1366]                           dc.w $ffff
[000e1368]                           dc.w $0018
[000e136a]                           dc.w $0000
[000e136c]                           dc.w $0000
[000e136e] 000e1162                  dc.l A_3DBUTTON08
[000e1372]                           dc.w $0000
[000e1374]                           dc.w $0000
[000e1376]                           dc.w $000b
[000e1378]                           dc.w $0401
_04_ThermTObj:
[000e137a]                           dc.w $0002
[000e137c]                           dc.w $ffff
[000e137e]                           dc.w $ffff
[000e1380]                           dc.w $0015
[000e1382]                           dc.w $0020
[000e1384]                           dc.w $0000
[000e1386] 000e104e                  dc.l TEDINFO_02
[000e138a]                           dc.w $0011
[000e138c]                           dc.w $0200
[000e138e]                           dc.w $0005
[000e1390]                           dc.w $0001
	.globl ThermWind
ThermWind:
[000e1392]                           dc.w $0000
[000e1394]                           dc.w $0000
[000e1396] 0005c50e                  dc.l ThermoService
[000e139a] 0005c28e                  dc.l ThermoCreate
[000e139e] 00057428                  dc.l Awi_open
[000e13a2] 0005c60c                  dc.l ThermoInit
[000e13a6]                           dc.w $0000
[000e13a8]                           dc.w $0000
[000e13aa]                           dc.w $0000
[000e13ac]                           dc.w $0000
[000e13ae]                           dc.w $0000
[000e13b0]                           dc.w $0000
[000e13b2]                           dc.w $ffff
[000e13b4]                           dc.w $2009
[000e13b6]                           dc.w $0000
[000e13b8]                           dc.w $0000
[000e13ba]                           dc.w $0078
[000e13bc]                           dc.w $0032
[000e13be]                           dc.w $0000
[000e13c0]                           dc.w $0000
[000e13c2]                           dc.w $0000
[000e13c4]                           dc.w $0000
[000e13c6]                           dc.w $0000
[000e13c8]                           dc.w $0000
[000e13ca]                           dc.w $0000
[000e13cc]                           dc.w $0000
[000e13ce]                           dc.w $ffff
[000e13d0]                           dc.w $ffff
[000e13d2]                           dc.w $ffff
[000e13d4]                           dc.w $ffff
[000e13d6]                           dc.w $0000
[000e13d8]                           dc.w $0000
[000e13da]                           dc.w $f8f8
[000e13dc] 000e1046                  dc.l TEXT_05
[000e13e0] 000e1008                  dc.l TEXT_02
[000e13e4]                           dc.w $0000
[000e13e6]                           dc.w $0000
[000e13e8]                           dc.w $0000
[000e13ea]                           dc.w $ffff
[000e13ec]                           dc.w $0000
[000e13ee]                           dc.w $0000
[000e13f0]                           dc.w $0000
[000e13f2]                           dc.w $0000
[000e13f4] 0006b744                  dc.l Awi_keys
[000e13f8] 00051852                  dc.l Awi_obchange
[000e13fc] 00051c46                  dc.l Awi_redraw
[000e1400] 000587a4                  dc.l Awi_topped
[000e1404] 0005c8f8                  dc.l ThermoClosed
[000e1408] 000587ec                  dc.l Awi_fulled
[000e140c] 0005217c                  dc.l Awi_arrowed
[000e1410] 000524b4                  dc.l Awi_hslid
[000e1414] 0005255e                  dc.l Awi_vslid
[000e1418] 00058bb0                  dc.l Awi_sized
[000e141c] 00058d50                  dc.l Awi_moved
[000e1420] 0005998a                  dc.l Awi_iconify
[000e1424] 00059c6c                  dc.l Awi_uniconify
[000e1428] 0005c8fa                  dc.l ThermoGEMScript
[000e142c]                           dc.w $0000
[000e142e]                           dc.w $0000
[000e1430]                           dc.w $0000
[000e1432]                           dc.w $0000
ThermObjs:
[000e1434] 000e1212                  dc.l ThermObj
[000e1438] 000e131a                  dc.l ThermTObj
[000e143c] 000e1182                  dc.l ThermAObj
[000e1440] 000e1272                  dc.l ThermTAObj
textNr:
[000e1444]                           dc.w $ffff
[000e1446]                           dc.w $0001
[000e1448]                           dc.w $ffff
[000e144a]                           dc.w $0001
laufBNr:
[000e144c]                           dc.w $0002
[000e144e]                           dc.w $0003
[000e1450]                           dc.w $0004
[000e1452]                           dc.w $0003
fixBNr:
[000e1454]                           dc.w $0001
[000e1456]                           dc.w $0002
[000e1458]                           dc.w $0003
[000e145a]                           dc.w $0002
prozNr:
[000e145c]                           dc.w $0003
[000e145e]                           dc.w $0004
[000e1460]                           dc.w $0005
[000e1462]                           dc.w $0004
[000e1464]                           dc.b '%i %%',0
