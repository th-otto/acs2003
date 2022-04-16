Ash_printSetIcon:
[0006eb66] 5d4f                      subq.w     #6,a7
[0006eb68] 2f48 0002                 move.l     a0,2(a7)
[0006eb6c] 3e80                      move.w     d0,(a7)
[0006eb6e] 23ef 0002 000e 2bf8       move.l     2(a7),$000E2BF8
[0006eb76] 2039 000e 2bf8            move.l     $000E2BF8,d0
[0006eb7c] 660a                      bne.s      Ash_printSetIcon_1
[0006eb7e] 0279 fffc 000e 2bf2       andi.w     #$FFFC,$000E2BF2
[0006eb86] 601e                      bra.s      Ash_printSetIcon_2
Ash_printSetIcon_1:
[0006eb88] 0079 0001 000e 2bf2       ori.w      #$0001,$000E2BF2
[0006eb90] 3017                      move.w     (a7),d0
[0006eb92] 670a                      beq.s      Ash_printSetIcon_3
[0006eb94] 0079 0002 000e 2bf2       ori.w      #$0002,$000E2BF2
[0006eb9c] 6008                      bra.s      Ash_printSetIcon_2
Ash_printSetIcon_3:
[0006eb9e] 0279 fffd 000e 2bf2       andi.w     #$FFFD,$000E2BF2
Ash_printSetIcon_2:
[0006eba6] 5c4f                      addq.w     #6,a7
[0006eba8] 4e75                      rts

Ash_print:
[0006ebaa] 2f0a                      move.l     a2,-(a7)
[0006ebac] 4fef ffe8                 lea.l      -24(a7),a7
[0006ebb0] 2f48 0014                 move.l     a0,20(a7)
[0006ebb4] 3f40 0012                 move.w     d0,18(a7)
[0006ebb8] 3f41 0010                 move.w     d1,16(a7)
[0006ebbc] 3f42 000e                 move.w     d2,14(a7)
[0006ebc0] 2f49 000a                 move.l     a1,10(a7)
[0006ebc4] 3ebc ffff                 move.w     #$FFFF,(a7)
[0006ebc8] 4eb9 0006 edf8            jsr        hasPdlg
[0006ebce] 4a40                      tst.w      d0
[0006ebd0] 6606                      bne.s      Ash_print_1
[0006ebd2] 70ff                      moveq.l    #-1,d0
[0006ebd4] 6000 021a                 bra        Ash_print_2
Ash_print_1:
[0006ebd8] 7026                      moveq.l    #38,d0
[0006ebda] 4eb9 0004 c608            jsr        Ax_malloc
[0006ebe0] 2f48 0006                 move.l     a0,6(a7)
[0006ebe4] 202f 0006                 move.l     6(a7),d0
[0006ebe8] 6606                      bne.s      Ash_print_3
[0006ebea] 70ff                      moveq.l    #-1,d0
[0006ebec] 6000 0202                 bra        Ash_print_2
Ash_print_3:
[0006ebf0] 206f 0006                 movea.l    6(a7),a0
[0006ebf4] 42a8 000c                 clr.l      12(a0)
[0006ebf8] 206f 0006                 movea.l    6(a7),a0
[0006ebfc] 216f 0014 0008            move.l     20(a7),8(a0)
[0006ec02] 206f 0006                 movea.l    6(a7),a0
[0006ec06] 316f 0012 0004            move.w     18(a7),4(a0)
[0006ec0c] 206f 0006                 movea.l    6(a7),a0
[0006ec10] 316f 0010 0006            move.w     16(a7),6(a0)
[0006ec16] 206f 0006                 movea.l    6(a7),a0
[0006ec1a] 316f 000e 0010            move.w     14(a7),16(a0)
[0006ec20] 206f 000a                 movea.l    10(a7),a0
[0006ec24] 4eb9 0004 643c            jsr        Ast_create
[0006ec2a] 226f 0006                 movea.l    6(a7),a1
[0006ec2e] 2288                      move.l     a0,(a1)
[0006ec30] 206f 0006                 movea.l    6(a7),a0
[0006ec34] 216f 0020 001e            move.l     32(a7),30(a0)
[0006ec3a] 202f 0020                 move.l     32(a7),d0
[0006ec3e] 6604                      bne.s      Ash_print_4
[0006ec40] 7001                      moveq.l    #1,d0
[0006ec42] 6002                      bra.s      Ash_print_5
Ash_print_4:
[0006ec44] 4240                      clr.w      d0
Ash_print_5:
[0006ec46] 206f 0006                 movea.l    6(a7),a0
[0006ec4a] 3140 0018                 move.w     d0,24(a0)
[0006ec4e] 206f 0006                 movea.l    6(a7),a0
[0006ec52] 4268 001c                 clr.w      28(a0)
[0006ec56] 206f 0006                 movea.l    6(a7),a0
[0006ec5a] 4268 001a                 clr.w      26(a0)
[0006ec5e] 206f 0006                 movea.l    6(a7),a0
[0006ec62] 2279 000e 2ba6            movea.l    $000E2BA6,a1
[0006ec68] 4e91                      jsr        (a1)
[0006ec6a] 2f48 0002                 move.l     a0,2(a7)
[0006ec6e] 202f 0002                 move.l     2(a7),d0
[0006ec72] 6600 00fe                 bne        Ash_print_6
[0006ec76] 202f 0020                 move.l     32(a7),d0
[0006ec7a] 6600 00c4                 bne        Ash_print_7
[0006ec7e] 2079 000e 692a            movea.l    _globl,a0
[0006ec84] 2f08                      move.l     a0,-(a7)
[0006ec86] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ec8c] 2068 023c                 movea.l    572(a0),a0
[0006ec90] 3028 000e                 move.w     14(a0),d0
[0006ec94] c07c 0100                 and.w      #$0100,d0
[0006ec98] 6604                      bne.s      Ash_print_8
[0006ec9a] 7001                      moveq.l    #1,d0
[0006ec9c] 6002                      bra.s      Ash_print_9
Ash_print_8:
[0006ec9e] 4240                      clr.w      d0
Ash_print_9:
[0006eca0] 205f                      movea.l    (a7)+,a0
[0006eca2] 4eb9 0007 d16e            jsr        mt_pdlg_create
[0006eca8] 226f 0006                 movea.l    6(a7),a1
[0006ecac] 2348 000c                 move.l     a0,12(a1)
[0006ecb0] 206f 0006                 movea.l    6(a7),a0
[0006ecb4] 2028 000c                 move.l     12(a0),d0
[0006ecb8] 6700 0086                 beq        Ash_print_7
[0006ecbc] 206f 0006                 movea.l    6(a7),a0
[0006ecc0] 4eb9 0006 ee56            jsr        pdlgGetSettings
[0006ecc6] 226f 0006                 movea.l    6(a7),a1
[0006ecca] 2348 0008                 move.l     a0,8(a1)
[0006ecce] 206f 0006                 movea.l    6(a7),a0
[0006ecd2] 2028 0008                 move.l     8(a0),d0
[0006ecd6] 6750                      beq.s      Ash_print_10
[0006ecd8] 4eb9 0004 ef0c            jsr        Amo_unbusy
[0006ecde] 2f39 000e 692a            move.l     _globl,-(a7)
[0006ece4] 206f 000a                 movea.l    10(a7),a0
[0006ece8] 2f10                      move.l     (a0),-(a7)
[0006ecea] 206f 000e                 movea.l    14(a7),a0
[0006ecee] 3028 0010                 move.w     16(a0),d0
[0006ecf2] 206f 000e                 movea.l    14(a7),a0
[0006ecf6] 2268 0008                 movea.l    8(a0),a1
[0006ecfa] 206f 000e                 movea.l    14(a7),a0
[0006ecfe] 2068 000c                 movea.l    12(a0),a0
[0006ed02] 4eb9 0007 d288            jsr        mt_pdlg_do
[0006ed08] 504f                      addq.w     #8,a7
[0006ed0a] 206f 0006                 movea.l    6(a7),a0
[0006ed0e] 3140 001a                 move.w     d0,26(a0)
[0006ed12] 206f 0006                 movea.l    6(a7),a0
[0006ed16] 0c68 0002 001a            cmpi.w     #$0002,26(a0)
[0006ed1c] 6604                      bne.s      Ash_print_11
[0006ed1e] 7001                      moveq.l    #1,d0
[0006ed20] 6002                      bra.s      Ash_print_12
Ash_print_11:
[0006ed22] 4240                      clr.w      d0
Ash_print_12:
[0006ed24] 3e80                      move.w     d0,(a7)
[0006ed26] 6004                      bra.s      Ash_print_13
Ash_print_10:
[0006ed28] 3ebc ffff                 move.w     #$FFFF,(a7)
Ash_print_13:
[0006ed2c] 2279 000e 692a            movea.l    _globl,a1
[0006ed32] 206f 0006                 movea.l    6(a7),a0
[0006ed36] 2068 000c                 movea.l    12(a0),a0
[0006ed3a] 4eb9 0007 d1c8            jsr        mt_pdlg_delete
Ash_print_7:
[0006ed40] 206f 0006                 movea.l    6(a7),a0
[0006ed44] 3028 0012                 move.w     18(a0),d0
[0006ed48] 670e                      beq.s      Ash_print_14
[0006ed4a] 206f 0006                 movea.l    6(a7),a0
[0006ed4e] 2068 0008                 movea.l    8(a0),a0
[0006ed52] 4eb9 0004 c7c8            jsr        Ax_free
Ash_print_14:
[0006ed58] 206f 0006                 movea.l    6(a7),a0
[0006ed5c] 2050                      movea.l    (a0),a0
[0006ed5e] 4eb9 0004 649c            jsr        Ast_delete
[0006ed64] 206f 0006                 movea.l    6(a7),a0
[0006ed68] 4eb9 0004 c7c8            jsr        Ax_free
[0006ed6e] 6000 007e                 bra.w      Ash_print_15
Ash_print_6:
[0006ed72] 202f 0020                 move.l     32(a7),d0
[0006ed76] 6644                      bne.s      Ash_print_16
[0006ed78] 206f 0006                 movea.l    6(a7),a0
[0006ed7c] 317c 0001 0018            move.w     #$0001,24(a0)
[0006ed82] 206f 0002                 movea.l    2(a7),a0
[0006ed86] 4eb9 0005 9df4            jsr        Awi_dialog
[0006ed8c] 3e80                      move.w     d0,(a7)
[0006ed8e] 0c57 ffff                 cmpi.w     #$FFFF,(a7)
[0006ed92] 6d14                      blt.s      Ash_print_17
[0006ed94] 206f 0006                 movea.l    6(a7),a0
[0006ed98] 0c68 0002 001a            cmpi.w     #$0002,26(a0)
[0006ed9e] 6604                      bne.s      Ash_print_18
[0006eda0] 7001                      moveq.l    #1,d0
[0006eda2] 6002                      bra.s      Ash_print_19
Ash_print_18:
[0006eda4] 4240                      clr.w      d0
Ash_print_19:
[0006eda6] 3e80                      move.w     d0,(a7)
Ash_print_17:
[0006eda8] 93c9                      suba.l     a1,a1
[0006edaa] 7002                      moveq.l    #2,d0
[0006edac] 206f 0002                 movea.l    2(a7),a0
[0006edb0] 246f 0002                 movea.l    2(a7),a2
[0006edb4] 246a 0004                 movea.l    4(a2),a2
[0006edb8] 4e92                      jsr        (a2)
[0006edba] 6032                      bra.s      Ash_print_15
Ash_print_16:
[0006edbc] 206f 0006                 movea.l    6(a7),a0
[0006edc0] 4268 0018                 clr.w      24(a0)
[0006edc4] 206f 0002                 movea.l    2(a7),a0
[0006edc8] 226f 0002                 movea.l    2(a7),a1
[0006edcc] 2269 000c                 movea.l    12(a1),a1
[0006edd0] 4e91                      jsr        (a1)
[0006edd2] 4a40                      tst.w      d0
[0006edd4] 6706                      beq.s      Ash_print_20
[0006edd6] 3ebc 0002                 move.w     #$0002,(a7)
[0006edda] 6012                      bra.s      Ash_print_15
Ash_print_20:
[0006eddc] 93c9                      suba.l     a1,a1
[0006edde] 7002                      moveq.l    #2,d0
[0006ede0] 206f 0002                 movea.l    2(a7),a0
[0006ede4] 246f 0002                 movea.l    2(a7),a2
[0006ede8] 246a 0004                 movea.l    4(a2),a2
[0006edec] 4e92                      jsr        (a2)
Ash_print_15:
[0006edee] 3017                      move.w     (a7),d0
Ash_print_2:
[0006edf0] 4fef 0018                 lea.l      24(a7),a7
[0006edf4] 245f                      movea.l    (a7)+,a2
[0006edf6] 4e75                      rts

hasPdlg:
[0006edf8] 514f                      subq.w     #8,a7
[0006edfa] 3039 000e 2c40            move.w     vorhanden,d0
[0006ee00] 6a42                      bpl.s      hasPdlg_1
[0006ee02] 2f39 000e 692a            move.l     _globl,-(a7)
[0006ee08] 486f 0004                 pea.l      4(a7)
[0006ee0c] 486f 000a                 pea.l      10(a7)
[0006ee10] 43ef 0010                 lea.l      16(a7),a1
[0006ee14] 41ef 0012                 lea.l      18(a7),a0
[0006ee18] 7007                      moveq.l    #7,d0
[0006ee1a] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[0006ee20] 4fef 000c                 lea.l      12(a7),a7
[0006ee24] 4a40                      tst.w      d0
[0006ee26] 6716                      beq.s      hasPdlg_2
[0006ee28] 7010                      moveq.l    #16,d0
[0006ee2a] c06f 0006                 and.w      6(a7),d0
[0006ee2e] 6704                      beq.s      hasPdlg_3
[0006ee30] 7001                      moveq.l    #1,d0
[0006ee32] 6002                      bra.s      hasPdlg_4
hasPdlg_3:
[0006ee34] 4240                      clr.w      d0
hasPdlg_4:
[0006ee36] 33c0 000e 2c40            move.w     d0,vorhanden
[0006ee3c] 6006                      bra.s      hasPdlg_1
hasPdlg_2:
[0006ee3e] 4279 000e 2c40            clr.w      vorhanden
hasPdlg_1:
[0006ee44] 3039 000e 2c40            move.w     vorhanden,d0
[0006ee4a] 6704                      beq.s      hasPdlg_5
[0006ee4c] 7001                      moveq.l    #1,d0
[0006ee4e] 6002                      bra.s      hasPdlg_6
hasPdlg_5:
[0006ee50] 4240                      clr.w      d0
hasPdlg_6:
[0006ee52] 504f                      addq.w     #8,a7
[0006ee54] 4e75                      rts

pdlgGetSettings:
[0006ee56] 4fef ffec                 lea.l      -20(a7),a7
[0006ee5a] 2f48 000c                 move.l     a0,12(a7)
[0006ee5e] 206f 000c                 movea.l    12(a7),a0
[0006ee62] 2f68 000c 0008            move.l     12(a0),8(a7)
[0006ee68] 206f 000c                 movea.l    12(a7),a0
[0006ee6c] 2ea8 0008                 move.l     8(a0),(a7)
[0006ee70] 202f 0008                 move.l     8(a7),d0
[0006ee74] 6626                      bne.s      pdlgGetSettings_1
[0006ee76] 2079 000e 692a            movea.l    _globl,a0
[0006ee7c] 4240                      clr.w      d0
[0006ee7e] 4eb9 0007 d16e            jsr        mt_pdlg_create
[0006ee84] 2f48 0004                 move.l     a0,4(a7)
[0006ee88] 202f 0004                 move.l     4(a7),d0
[0006ee8c] 6606                      bne.s      pdlgGetSettings_2
[0006ee8e] 91c8                      suba.l     a0,a0
[0006ee90] 6000 00aa                 bra        pdlgGetSettings_3
pdlgGetSettings_2:
[0006ee94] 2f6f 0004 0008            move.l     4(a7),8(a7)
[0006ee9a] 6004                      bra.s      pdlgGetSettings_4
pdlgGetSettings_1:
[0006ee9c] 42af 0004                 clr.l      4(a7)
pdlgGetSettings_4:
[0006eea0] 2017                      move.l     (a7),d0
[0006eea2] 6604                      bne.s      pdlgGetSettings_5
[0006eea4] 7001                      moveq.l    #1,d0
[0006eea6] 6002                      bra.s      pdlgGetSettings_6
pdlgGetSettings_5:
[0006eea8] 4240                      clr.w      d0
pdlgGetSettings_6:
[0006eeaa] 206f 000c                 movea.l    12(a7),a0
[0006eeae] 3140 0012                 move.w     d0,18(a0)
[0006eeb2] 206f 000c                 movea.l    12(a7),a0
[0006eeb6] 3028 0012                 move.w     18(a0),d0
[0006eeba] 674a                      beq.s      pdlgGetSettings_7
[0006eebc] 2079 000e 692a            movea.l    _globl,a0
[0006eec2] 4eb9 0007 d3cc            jsr        mt_pdlg_get_setsize
[0006eec8] 2f40 0010                 move.l     d0,16(a7)
[0006eecc] 0caf 0000 0178 0010       cmpi.l     #$00000178,16(a7)
[0006eed4] 6306                      bls.s      pdlgGetSettings_8
[0006eed6] 202f 0010                 move.l     16(a7),d0
[0006eeda] 6006                      bra.s      pdlgGetSettings_9
pdlgGetSettings_8:
[0006eedc] 203c 0000 0178            move.l     #$00000178,d0
pdlgGetSettings_9:
[0006eee2] 4eb9 0004 c608            jsr        Ax_malloc
[0006eee8] 2e88                      move.l     a0,(a7)
[0006eeea] 2017                      move.l     (a7),d0
[0006eeec] 6716                      beq.s      pdlgGetSettings_10
[0006eeee] 2f39 000e 692a            move.l     _globl,-(a7)
[0006eef4] 226f 0004                 movea.l    4(a7),a1
[0006eef8] 206f 000c                 movea.l    12(a7),a0
[0006eefc] 4eb9 0007 d222            jsr        mt_pdlg_dflt_settings
[0006ef02] 584f                      addq.w     #4,a7
pdlgGetSettings_10:
[0006ef04] 601e                      bra.s      pdlgGetSettings_11
pdlgGetSettings_7:
[0006ef06] 2f39 000e 692a            move.l     _globl,-(a7)
[0006ef0c] 226f 0004                 movea.l    4(a7),a1
[0006ef10] 206f 000c                 movea.l    12(a7),a0
[0006ef14] 4eb9 0007 d694            jsr        mt_pdlg_validate_settings
[0006ef1a] 584f                      addq.w     #4,a7
[0006ef1c] 4a40                      tst.w      d0
[0006ef1e] 6604                      bne.s      pdlgGetSettings_11
[0006ef20] 91c8                      suba.l     a0,a0
[0006ef22] 6018                      bra.s      pdlgGetSettings_3
pdlgGetSettings_11:
[0006ef24] 202f 0004                 move.l     4(a7),d0
[0006ef28] 6710                      beq.s      pdlgGetSettings_12
[0006ef2a] 2279 000e 692a            movea.l    _globl,a1
[0006ef30] 206f 0004                 movea.l    4(a7),a0
[0006ef34] 4eb9 0007 d1c8            jsr        mt_pdlg_delete
pdlgGetSettings_12:
[0006ef3a] 2057                      movea.l    (a7),a0
pdlgGetSettings_3:
[0006ef3c] 4fef 0014                 lea.l      20(a7),a7
[0006ef40] 4e75                      rts

pdlgClose:
[0006ef42] 2f0a                      move.l     a2,-(a7)
[0006ef44] 4fef ffec                 lea.l      -20(a7),a7
[0006ef48] 2f48 0008                 move.l     a0,8(a7)
[0006ef4c] 206f 0008                 movea.l    8(a7),a0
[0006ef50] 2f68 0022 0004            move.l     34(a0),4(a7)
[0006ef56] 206f 0008                 movea.l    8(a7),a0
[0006ef5a] 2ea8 001e                 move.l     30(a0),(a7)
[0006ef5e] 202f 0004                 move.l     4(a7),d0
[0006ef62] 6744                      beq.s      pdlgClose_1
[0006ef64] 206f 0004                 movea.l    4(a7),a0
[0006ef68] 3028 0020                 move.w     32(a0),d0
[0006ef6c] 6b3a                      bmi.s      pdlgClose_1
[0006ef6e] 206f 0008                 movea.l    8(a7),a0
[0006ef72] 2028 000c                 move.l     12(a0),d0
[0006ef76] 6730                      beq.s      pdlgClose_1
[0006ef78] 2f39 000e 692a            move.l     _globl,-(a7)
[0006ef7e] 206f 0008                 movea.l    8(a7),a0
[0006ef82] 4868 002e                 pea.l      46(a0)
[0006ef86] 226f 000c                 movea.l    12(a7),a1
[0006ef8a] 43e9 002c                 lea.l      44(a1),a1
[0006ef8e] 206f 0010                 movea.l    16(a7),a0
[0006ef92] 2068 000c                 movea.l    12(a0),a0
[0006ef96] 4eb9 0007 d0ee            jsr        mt_pdlg_close
[0006ef9c] 504f                      addq.w     #8,a7
[0006ef9e] 206f 0004                 movea.l    4(a7),a0
[0006efa2] 317c ffff 0020            move.w     #$FFFF,32(a0)
pdlgClose_1:
[0006efa8] 2017                      move.l     (a7),d0
[0006efaa] 6740                      beq.s      pdlgClose_2
[0006efac] 206f 0008                 movea.l    8(a7),a0
[0006efb0] 2028 0008                 move.l     8(a0),d0
[0006efb4] 6736                      beq.s      pdlgClose_2
[0006efb6] 206f 0008                 movea.l    8(a7),a0
[0006efba] 2f68 0008 000c            move.l     8(a0),12(a7)
[0006efc0] 206f 0008                 movea.l    8(a7),a0
[0006efc4] 3f68 0010 0010            move.w     16(a0),16(a7)
[0006efca] 206f 0008                 movea.l    8(a7),a0
[0006efce] 3f68 001a 0012            move.w     26(a0),18(a7)
[0006efd4] 43ef 000c                 lea.l      12(a7),a1
[0006efd8] 7031                      moveq.l    #49,d0
[0006efda] 2057                      movea.l    (a7),a0
[0006efdc] 2457                      movea.l    (a7),a2
[0006efde] 246a 0004                 movea.l    4(a2),a2
[0006efe2] 4e92                      jsr        (a2)
[0006efe4] 206f 0008                 movea.l    8(a7),a0
[0006efe8] 42a8 001e                 clr.l      30(a0)
pdlgClose_2:
[0006efec] 7001                      moveq.l    #1,d0
[0006efee] 4fef 0014                 lea.l      20(a7),a7
[0006eff2] 245f                      movea.l    (a7)+,a2
[0006eff4] 4e75                      rts

pdlgMessage:
[0006eff6] 2f0a                      move.l     a2,-(a7)
[0006eff8] 4fef fff4                 lea.l      -12(a7),a7
[0006effc] 2f48 0008                 move.l     a0,8(a7)
[0006f000] 2f49 0004                 move.l     a1,4(a7)
[0006f004] 206f 0008                 movea.l    8(a7),a0
[0006f008] 2068 0022                 movea.l    34(a0),a0
[0006f00c] 226f 0004                 movea.l    4(a7),a1
[0006f010] 3368 0020 0026            move.w     32(a0),38(a1)
[0006f016] 2f39 000e 692a            move.l     _globl,-(a7)
[0006f01c] 486f 0004                 pea.l      4(a7)
[0006f020] 2f2f 000c                 move.l     12(a7),-(a7)
[0006f024] 206f 0014                 movea.l    20(a7),a0
[0006f028] 2268 0008                 movea.l    8(a0),a1
[0006f02c] 206f 0014                 movea.l    20(a7),a0
[0006f030] 2068 000c                 movea.l    12(a0),a0
[0006f034] 4eb9 0007 d2f8            jsr        mt_pdlg_evnt
[0006f03a] 4fef 000c                 lea.l      12(a7),a7
[0006f03e] 3f40 0002                 move.w     d0,2(a7)
[0006f042] 302f 0002                 move.w     2(a7),d0
[0006f046] 664e                      bne.s      pdlgMessage_1
[0006f048] 206f 0008                 movea.l    8(a7),a0
[0006f04c] 3028 001c                 move.w     28(a0),d0
[0006f050] 6608                      bne.s      pdlgMessage_2
[0006f052] 206f 0008                 movea.l    8(a7),a0
[0006f056] 3157 001a                 move.w     (a7),26(a0)
pdlgMessage_2:
[0006f05a] 206f 0008                 movea.l    8(a7),a0
[0006f05e] 317c 0001 001c            move.w     #$0001,28(a0)
[0006f064] 206f 0008                 movea.l    8(a7),a0
[0006f068] 3028 0018                 move.w     24(a0),d0
[0006f06c] 670e                      beq.s      pdlgMessage_3
[0006f06e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f074] 317c 0001 0268            move.w     #$0001,616(a0)
[0006f07a] 601a                      bra.s      pdlgMessage_1
pdlgMessage_3:
[0006f07c] 93c9                      suba.l     a1,a1
[0006f07e] 7002                      moveq.l    #2,d0
[0006f080] 206f 0008                 movea.l    8(a7),a0
[0006f084] 2068 0022                 movea.l    34(a0),a0
[0006f088] 246f 0008                 movea.l    8(a7),a2
[0006f08c] 246a 0022                 movea.l    34(a2),a2
[0006f090] 246a 0004                 movea.l    4(a2),a2
[0006f094] 4e92                      jsr        (a2)
pdlgMessage_1:
[0006f096] 302f 0002                 move.w     2(a7),d0
[0006f09a] 4fef 000c                 lea.l      12(a7),a7
[0006f09e] 245f                      movea.l    (a7)+,a2
[0006f0a0] 4e75                      rts

PrintCreate:
[0006f0a2] 4fef fff0                 lea.l      -16(a7),a7
[0006f0a6] 2f48 000c                 move.l     a0,12(a7)
[0006f0aa] 2f6f 000c 0008            move.l     12(a7),8(a7)
[0006f0b0] 202f 000c                 move.l     12(a7),d0
[0006f0b4] 6606                      bne.s      PrintCreate_1
[0006f0b6] 91c8                      suba.l     a0,a0
[0006f0b8] 6000 00e2                 bra        PrintCreate_2
PrintCreate_1:
[0006f0bc] 2079 000e 692a            movea.l    _globl,a0
[0006f0c2] 2f08                      move.l     a0,-(a7)
[0006f0c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f0ca] 2068 023c                 movea.l    572(a0),a0
[0006f0ce] 3028 000e                 move.w     14(a0),d0
[0006f0d2] c07c 0100                 and.w      #$0100,d0
[0006f0d6] 6604                      bne.s      PrintCreate_3
[0006f0d8] 7001                      moveq.l    #1,d0
[0006f0da] 6002                      bra.s      PrintCreate_4
PrintCreate_3:
[0006f0dc] 4240                      clr.w      d0
PrintCreate_4:
[0006f0de] 205f                      movea.l    (a7)+,a0
[0006f0e0] 4eb9 0007 d16e            jsr        mt_pdlg_create
[0006f0e6] 226f 0008                 movea.l    8(a7),a1
[0006f0ea] 2348 000c                 move.l     a0,12(a1)
[0006f0ee] 206f 0008                 movea.l    8(a7),a0
[0006f0f2] 2028 000c                 move.l     12(a0),d0
[0006f0f6] 6606                      bne.s      PrintCreate_5
[0006f0f8] 91c8                      suba.l     a0,a0
[0006f0fa] 6000 00a0                 bra        PrintCreate_2
PrintCreate_5:
[0006f0fe] 206f 0008                 movea.l    8(a7),a0
[0006f102] 6100 fd52                 bsr        pdlgGetSettings
[0006f106] 226f 0008                 movea.l    8(a7),a1
[0006f10a] 2348 0008                 move.l     a0,8(a1)
[0006f10e] 206f 0008                 movea.l    8(a7),a0
[0006f112] 2028 0008                 move.l     8(a0),d0
[0006f116] 6618                      bne.s      PrintCreate_6
[0006f118] 2279 000e 692a            movea.l    _globl,a1
[0006f11e] 206f 0008                 movea.l    8(a7),a0
[0006f122] 2068 000c                 movea.l    12(a0),a0
[0006f126] 4eb9 0007 d1c8            jsr        mt_pdlg_delete
[0006f12c] 91c8                      suba.l     a0,a0
[0006f12e] 606c                      bra.s      PrintCreate_2
PrintCreate_6:
[0006f130] 41f9 000e 2b9e            lea.l      PrintSelWind,a0
[0006f136] 4eb9 0005 7052            jsr        Awi_create
[0006f13c] 2f48 0004                 move.l     a0,4(a7)
[0006f140] 202f 0004                 move.l     4(a7),d0
[0006f144] 6618                      bne.s      PrintCreate_7
[0006f146] 2279 000e 692a            movea.l    _globl,a1
[0006f14c] 206f 0008                 movea.l    8(a7),a0
[0006f150] 2068 000c                 movea.l    12(a0),a0
[0006f154] 4eb9 0007 d1c8            jsr        mt_pdlg_delete
[0006f15a] 91c8                      suba.l     a0,a0
[0006f15c] 603e                      bra.s      PrintCreate_2
PrintCreate_7:
[0006f15e] 206f 0008                 movea.l    8(a7),a0
[0006f162] 2050                      movea.l    (a0),a0
[0006f164] 4eb9 0004 643c            jsr        Ast_create
[0006f16a] 2e88                      move.l     a0,(a7)
[0006f16c] 2017                      move.l     (a7),d0
[0006f16e] 6716                      beq.s      PrintCreate_8
[0006f170] 206f 0004                 movea.l    4(a7),a0
[0006f174] 2068 004a                 movea.l    74(a0),a0
[0006f178] 4eb9 0004 649c            jsr        Ast_delete
[0006f17e] 206f 0004                 movea.l    4(a7),a0
[0006f182] 2157 004a                 move.l     (a7),74(a0)
PrintCreate_8:
[0006f186] 206f 0004                 movea.l    4(a7),a0
[0006f18a] 20af 0008                 move.l     8(a7),(a0)
[0006f18e] 206f 0008                 movea.l    8(a7),a0
[0006f192] 216f 0004 0022            move.l     4(a7),34(a0)
[0006f198] 206f 0004                 movea.l    4(a7),a0
PrintCreate_2:
[0006f19c] 4fef 0010                 lea.l      16(a7),a7
[0006f1a0] 4e75                      rts

PrintService:
[0006f1a2] 4fef fff6                 lea.l      -10(a7),a7
[0006f1a6] 2f48 0006                 move.l     a0,6(a7)
[0006f1aa] 3f40 0004                 move.w     d0,4(a7)
[0006f1ae] 206f 0006                 movea.l    6(a7),a0
[0006f1b2] 2e90                      move.l     (a0),(a7)
[0006f1b4] 302f 0004                 move.w     4(a7),d0
[0006f1b8] 5540                      subq.w     #2,d0
[0006f1ba] 6702                      beq.s      PrintService_1
[0006f1bc] 606c                      bra.s      PrintService_2
PrintService_1:
[0006f1be] 206f 0006                 movea.l    6(a7),a0
[0006f1c2] 3028 0056                 move.w     86(a0),d0
[0006f1c6] c07c 0200                 and.w      #$0200,d0
[0006f1ca] 665a                      bne.s      PrintService_3
[0006f1cc] 206f 0006                 movea.l    6(a7),a0
[0006f1d0] 0068 0200 0056            ori.w      #$0200,86(a0)
[0006f1d6] 2057                      movea.l    (a7),a0
[0006f1d8] 6100 fd68                 bsr        pdlgClose
[0006f1dc] 2057                      movea.l    (a7),a0
[0006f1de] 2028 000c                 move.l     12(a0),d0
[0006f1e2] 6712                      beq.s      PrintService_4
[0006f1e4] 2279 000e 692a            movea.l    _globl,a1
[0006f1ea] 2057                      movea.l    (a7),a0
[0006f1ec] 2068 000c                 movea.l    12(a0),a0
[0006f1f0] 4eb9 0007 d1c8            jsr        mt_pdlg_delete
PrintService_4:
[0006f1f6] 2057                      movea.l    (a7),a0
[0006f1f8] 3028 0012                 move.w     18(a0),d0
[0006f1fc] 670c                      beq.s      PrintService_5
[0006f1fe] 2057                      movea.l    (a7),a0
[0006f200] 2068 0008                 movea.l    8(a0),a0
[0006f204] 4eb9 0004 c7c8            jsr        Ax_free
PrintService_5:
[0006f20a] 2057                      movea.l    (a7),a0
[0006f20c] 2050                      movea.l    (a0),a0
[0006f20e] 4eb9 0004 649c            jsr        Ast_delete
[0006f214] 2057                      movea.l    (a7),a0
[0006f216] 4eb9 0004 c7c8            jsr        Ax_free
[0006f21c] 206f 0006                 movea.l    6(a7),a0
[0006f220] 4eb9 0005 85f2            jsr        Awi_delete
PrintService_3:
[0006f226] 7001                      moveq.l    #1,d0
[0006f228] 6002                      bra.s      PrintService_6
PrintService_2:
[0006f22a] 4240                      clr.w      d0
PrintService_6:
[0006f22c] 4fef 000a                 lea.l      10(a7),a7
[0006f230] 4e75                      rts

PrintOpen:
[0006f232] 514f                      subq.w     #8,a7
[0006f234] 2f48 0004                 move.l     a0,4(a7)
[0006f238] 206f 0004                 movea.l    4(a7),a0
[0006f23c] 2e90                      move.l     (a0),(a7)
[0006f23e] 2f39 000e 692a            move.l     _globl,-(a7)
[0006f244] 206f 0004                 movea.l    4(a7),a0
[0006f248] 2f10                      move.l     (a0),-(a7)
[0006f24a] 206f 0008                 movea.l    8(a7),a0
[0006f24e] 3428 0006                 move.w     6(a0),d2
[0006f252] 206f 0008                 movea.l    8(a7),a0
[0006f256] 3228 0004                 move.w     4(a0),d1
[0006f25a] 206f 0008                 movea.l    8(a7),a0
[0006f25e] 3028 0010                 move.w     16(a0),d0
[0006f262] 206f 0008                 movea.l    8(a7),a0
[0006f266] 2268 0008                 movea.l    8(a0),a1
[0006f26a] 206f 0008                 movea.l    8(a7),a0
[0006f26e] 2068 000c                 movea.l    12(a0),a0
[0006f272] 4eb9 0007 d480            jsr        mt_pdlg_open
[0006f278] 504f                      addq.w     #8,a7
[0006f27a] 206f 0004                 movea.l    4(a7),a0
[0006f27e] 3140 0020                 move.w     d0,32(a0)
[0006f282] 206f 0004                 movea.l    4(a7),a0
[0006f286] 3028 0020                 move.w     32(a0),d0
[0006f28a] 6f00 00b6                 ble        PrintOpen_1
[0006f28e] 206f 0004                 movea.l    4(a7),a0
[0006f292] 4868 002a                 pea.l      42(a0)
[0006f296] 206f 0008                 movea.l    8(a7),a0
[0006f29a] 4868 0028                 pea.l      40(a0)
[0006f29e] 206f 000c                 movea.l    12(a7),a0
[0006f2a2] 4868 0026                 pea.l      38(a0)
[0006f2a6] 206f 0010                 movea.l    16(a7),a0
[0006f2aa] 4868 0024                 pea.l      36(a0)
[0006f2ae] 7205                      moveq.l    #5,d1
[0006f2b0] 206f 0014                 movea.l    20(a7),a0
[0006f2b4] 3028 0020                 move.w     32(a0),d0
[0006f2b8] 4eb9 0007 f7ba            jsr        wind_get
[0006f2be] 4fef 0010                 lea.l      16(a7),a7
[0006f2c2] 206f 0004                 movea.l    4(a7),a0
[0006f2c6] 4868 003a                 pea.l      58(a0)
[0006f2ca] 206f 0008                 movea.l    8(a7),a0
[0006f2ce] 4868 0038                 pea.l      56(a0)
[0006f2d2] 206f 000c                 movea.l    12(a7),a0
[0006f2d6] 4868 0036                 pea.l      54(a0)
[0006f2da] 206f 0010                 movea.l    16(a7),a0
[0006f2de] 4868 0034                 pea.l      52(a0)
[0006f2e2] 7204                      moveq.l    #4,d1
[0006f2e4] 206f 0014                 movea.l    20(a7),a0
[0006f2e8] 3028 0020                 move.w     32(a0),d0
[0006f2ec] 4eb9 0007 f7ba            jsr        wind_get
[0006f2f2] 4fef 0010                 lea.l      16(a7),a7
[0006f2f6] 206f 0004                 movea.l    4(a7),a0
[0006f2fa] 2068 0014                 movea.l    20(a0),a0
[0006f2fe] 4268 0010                 clr.w      16(a0)
[0006f302] 206f 0004                 movea.l    4(a7),a0
[0006f306] 2068 0014                 movea.l    20(a0),a0
[0006f30a] 4268 0012                 clr.w      18(a0)
[0006f30e] 206f 0004                 movea.l    4(a7),a0
[0006f312] 226f 0004                 movea.l    4(a7),a1
[0006f316] 2269 0014                 movea.l    20(a1),a1
[0006f31a] 3368 0038 0014            move.w     56(a0),20(a1)
[0006f320] 206f 0004                 movea.l    4(a7),a0
[0006f324] 226f 0004                 movea.l    4(a7),a1
[0006f328] 2269 0014                 movea.l    20(a1),a1
[0006f32c] 3368 003a 0016            move.w     58(a0),22(a1)
[0006f332] 206f 0004                 movea.l    4(a7),a0
[0006f336] 4eb9 0005 789e            jsr        Awi_register
[0006f33c] 4240                      clr.w      d0
[0006f33e] 6006                      bra.s      PrintOpen_2
[0006f340] 6004                      bra.s      PrintOpen_2
PrintOpen_1:
[0006f342] 70ff                      moveq.l    #-1,d0
[0006f344] 4e71                      nop
PrintOpen_2:
[0006f346] 504f                      addq.w     #8,a7
[0006f348] 4e75                      rts

PrintClosed:
[0006f34a] 4fef ffb8                 lea.l      -72(a7),a7
[0006f34e] 2f48 0044                 move.l     a0,68(a7)
[0006f352] 206f 0044                 movea.l    68(a7),a0
[0006f356] 2f50 0040                 move.l     (a0),64(a7)
[0006f35a] 41f9 000e 2c42            lea.l      $000E2C42,a0
[0006f360] 43d7                      lea.l      (a7),a1
[0006f362] 700f                      moveq.l    #15,d0
PrintClosed_1:
[0006f364] 22d8                      move.l     (a0)+,(a1)+
[0006f366] 51c8 fffc                 dbf        d0,PrintClosed_1
[0006f36a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f370] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f376] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f37c] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f382] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f388] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f38e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f394] 3028 02ce                 move.w     718(a0),d0
[0006f398] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f39e] 3f40 0008                 move.w     d0,8(a7)
[0006f3a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f3a8] 3028 02ce                 move.w     718(a0),d0
[0006f3ac] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f3b2] 3f40 000a                 move.w     d0,10(a7)
[0006f3b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f3bc] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f3c2] 43d7                      lea.l      (a7),a1
[0006f3c4] 206f 0040                 movea.l    64(a7),a0
[0006f3c8] 6100 fc2c                 bsr        pdlgMessage
[0006f3cc] 4fef 0048                 lea.l      72(a7),a7
[0006f3d0] 4e75                      rts

PrintRedraw:
[0006f3d2] 4fef ffb4                 lea.l      -76(a7),a7
[0006f3d6] 2f48 0048                 move.l     a0,72(a7)
[0006f3da] 2f49 0044                 move.l     a1,68(a7)
[0006f3de] 206f 0048                 movea.l    72(a7),a0
[0006f3e2] 2f50 0040                 move.l     (a0),64(a7)
[0006f3e6] 41f9 000e 2c82            lea.l      $000E2C82,a0
[0006f3ec] 43d7                      lea.l      (a7),a1
[0006f3ee] 700f                      moveq.l    #15,d0
PrintRedraw_1:
[0006f3f0] 22d8                      move.l     (a0)+,(a1)+
[0006f3f2] 51c8 fffc                 dbf        d0,PrintRedraw_1
[0006f3f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f3fc] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f402] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f408] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f40e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f414] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f41a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f420] 3028 02ce                 move.w     718(a0),d0
[0006f424] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f42a] 3f40 0008                 move.w     d0,8(a7)
[0006f42e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f434] 3028 02ce                 move.w     718(a0),d0
[0006f438] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f43e] 3f40 000a                 move.w     d0,10(a7)
[0006f442] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f448] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f44e] 206f 0044                 movea.l    68(a7),a0
[0006f452] 3f50 0028                 move.w     (a0),40(a7)
[0006f456] 206f 0044                 movea.l    68(a7),a0
[0006f45a] 3f68 0002 002a            move.w     2(a0),42(a7)
[0006f460] 206f 0044                 movea.l    68(a7),a0
[0006f464] 3f68 0004 002c            move.w     4(a0),44(a7)
[0006f46a] 206f 0044                 movea.l    68(a7),a0
[0006f46e] 3f68 0006 002e            move.w     6(a0),46(a7)
[0006f474] 43d7                      lea.l      (a7),a1
[0006f476] 206f 0040                 movea.l    64(a7),a0
[0006f47a] 6100 fb7a                 bsr        pdlgMessage
[0006f47e] 4fef 004c                 lea.l      76(a7),a7
[0006f482] 4e75                      rts

PrintArrowed:
[0006f484] 4fef ffb6                 lea.l      -74(a7),a7
[0006f488] 2f48 0046                 move.l     a0,70(a7)
[0006f48c] 3f40 0044                 move.w     d0,68(a7)
[0006f490] 206f 0046                 movea.l    70(a7),a0
[0006f494] 2f50 0040                 move.l     (a0),64(a7)
[0006f498] 41f9 000e 2cc2            lea.l      $000E2CC2,a0
[0006f49e] 43d7                      lea.l      (a7),a1
[0006f4a0] 700f                      moveq.l    #15,d0
PrintArrowed_1:
[0006f4a2] 22d8                      move.l     (a0)+,(a1)+
[0006f4a4] 51c8 fffc                 dbf        d0,PrintArrowed_1
[0006f4a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f4ae] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f4b4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f4ba] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f4c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f4c6] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f4cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f4d2] 3028 02ce                 move.w     718(a0),d0
[0006f4d6] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f4dc] 3f40 0008                 move.w     d0,8(a7)
[0006f4e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f4e6] 3028 02ce                 move.w     718(a0),d0
[0006f4ea] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f4f0] 3f40 000a                 move.w     d0,10(a7)
[0006f4f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f4fa] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f500] 3f6f 0044 0028            move.w     68(a7),40(a7)
[0006f506] 43d7                      lea.l      (a7),a1
[0006f508] 206f 0040                 movea.l    64(a7),a0
[0006f50c] 6100 fae8                 bsr        pdlgMessage
[0006f510] 4fef 004a                 lea.l      74(a7),a7
[0006f514] 4e75                      rts

PrintChange:
[0006f516] 2f0a                      move.l     a2,-(a7)
[0006f518] 594f                      subq.w     #4,a7
[0006f51a] 2e88                      move.l     a0,(a7)
[0006f51c] 2257                      movea.l    (a7),a1
[0006f51e] 43e9 0034                 lea.l      52(a1),a1
[0006f522] 2057                      movea.l    (a7),a0
[0006f524] 2457                      movea.l    (a7),a2
[0006f526] 246a 006a                 movea.l    106(a2),a2
[0006f52a] 4e92                      jsr        (a2)
[0006f52c] 584f                      addq.w     #4,a7
[0006f52e] 245f                      movea.l    (a7)+,a2
[0006f530] 4e75                      rts

PrintFulled:
[0006f532] 4fef ffb8                 lea.l      -72(a7),a7
[0006f536] 2f48 0044                 move.l     a0,68(a7)
[0006f53a] 206f 0044                 movea.l    68(a7),a0
[0006f53e] 2f50 0040                 move.l     (a0),64(a7)
[0006f542] 41f9 000e 2d02            lea.l      $000E2D02,a0
[0006f548] 43d7                      lea.l      (a7),a1
[0006f54a] 700f                      moveq.l    #15,d0
PrintFulled_1:
[0006f54c] 22d8                      move.l     (a0)+,(a1)+
[0006f54e] 51c8 fffc                 dbf        d0,PrintFulled_1
[0006f552] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f558] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f55e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f564] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f56a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f570] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f576] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f57c] 3028 02ce                 move.w     718(a0),d0
[0006f580] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f586] 3f40 0008                 move.w     d0,8(a7)
[0006f58a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f590] 3028 02ce                 move.w     718(a0),d0
[0006f594] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f59a] 3f40 000a                 move.w     d0,10(a7)
[0006f59e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f5a4] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f5aa] 43d7                      lea.l      (a7),a1
[0006f5ac] 206f 0040                 movea.l    64(a7),a0
[0006f5b0] 6100 fa44                 bsr        pdlgMessage
[0006f5b4] 4fef 0048                 lea.l      72(a7),a7
[0006f5b8] 4e75                      rts

PrintInit:
[0006f5ba] 4240                      clr.w      d0
[0006f5bc] 4e75                      rts

PrintHSlide:
[0006f5be] 4fef ffb6                 lea.l      -74(a7),a7
[0006f5c2] 2f48 0046                 move.l     a0,70(a7)
[0006f5c6] 3f40 0044                 move.w     d0,68(a7)
[0006f5ca] 206f 0046                 movea.l    70(a7),a0
[0006f5ce] 2f50 0040                 move.l     (a0),64(a7)
[0006f5d2] 41f9 000e 2d42            lea.l      $000E2D42,a0
[0006f5d8] 43d7                      lea.l      (a7),a1
[0006f5da] 700f                      moveq.l    #15,d0
PrintHSlide_1:
[0006f5dc] 22d8                      move.l     (a0)+,(a1)+
[0006f5de] 51c8 fffc                 dbf        d0,PrintHSlide_1
[0006f5e2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f5e8] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f5ee] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f5f4] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f5fa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f600] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f606] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f60c] 3028 02ce                 move.w     718(a0),d0
[0006f610] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f616] 3f40 0008                 move.w     d0,8(a7)
[0006f61a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f620] 3028 02ce                 move.w     718(a0),d0
[0006f624] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f62a] 3f40 000a                 move.w     d0,10(a7)
[0006f62e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f634] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f63a] 3f6f 0044 0028            move.w     68(a7),40(a7)
[0006f640] 43d7                      lea.l      (a7),a1
[0006f642] 206f 0040                 movea.l    64(a7),a0
[0006f646] 6100 f9ae                 bsr        pdlgMessage
[0006f64a] 4fef 004a                 lea.l      74(a7),a7
[0006f64e] 4e75                      rts

PrintVSlide:
[0006f650] 4fef ffb6                 lea.l      -74(a7),a7
[0006f654] 2f48 0046                 move.l     a0,70(a7)
[0006f658] 3f40 0044                 move.w     d0,68(a7)
[0006f65c] 206f 0046                 movea.l    70(a7),a0
[0006f660] 2f50 0040                 move.l     (a0),64(a7)
[0006f664] 41f9 000e 2d82            lea.l      $000E2D82,a0
[0006f66a] 43d7                      lea.l      (a7),a1
[0006f66c] 700f                      moveq.l    #15,d0
PrintVSlide_1:
[0006f66e] 22d8                      move.l     (a0)+,(a1)+
[0006f670] 51c8 fffc                 dbf        d0,PrintVSlide_1
[0006f674] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f67a] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f680] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f686] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f68c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f692] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f698] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f69e] 3028 02ce                 move.w     718(a0),d0
[0006f6a2] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f6a8] 3f40 0008                 move.w     d0,8(a7)
[0006f6ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f6b2] 3028 02ce                 move.w     718(a0),d0
[0006f6b6] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f6bc] 3f40 000a                 move.w     d0,10(a7)
[0006f6c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f6c6] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f6cc] 3f6f 0044 0028            move.w     68(a7),40(a7)
[0006f6d2] 43d7                      lea.l      (a7),a1
[0006f6d4] 206f 0040                 movea.l    64(a7),a0
[0006f6d8] 6100 f91c                 bsr        pdlgMessage
[0006f6dc] 4fef 004a                 lea.l      74(a7),a7
[0006f6e0] 4e75                      rts

PrintKeys:
[0006f6e2] 4fef ffb6                 lea.l      -74(a7),a7
[0006f6e6] 2f48 0046                 move.l     a0,70(a7)
[0006f6ea] 3f41 0044                 move.w     d1,68(a7)
[0006f6ee] 206f 0046                 movea.l    70(a7),a0
[0006f6f2] 2f50 0040                 move.l     (a0),64(a7)
[0006f6f6] 41f9 000e 2dc2            lea.l      $000E2DC2,a0
[0006f6fc] 43d7                      lea.l      (a7),a1
[0006f6fe] 700f                      moveq.l    #15,d0
PrintKeys_1:
[0006f700] 22d8                      move.l     (a0)+,(a1)+
[0006f702] 51c8 fffc                 dbf        d0,PrintKeys_1
[0006f706] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f70c] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f712] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f718] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f71e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f724] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f72a] 302f 0044                 move.w     68(a7),d0
[0006f72e] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f734] 3f40 0008                 move.w     d0,8(a7)
[0006f738] 302f 0044                 move.w     68(a7),d0
[0006f73c] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f742] 3f40 000a                 move.w     d0,10(a7)
[0006f746] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f74c] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f752] 43d7                      lea.l      (a7),a1
[0006f754] 206f 0040                 movea.l    64(a7),a0
[0006f758] 6100 f89c                 bsr        pdlgMessage
[0006f75c] 4240                      clr.w      d0
[0006f75e] 4fef 004a                 lea.l      74(a7),a7
[0006f762] 4e75                      rts

PrintTopped:
[0006f764] 4fef ffb8                 lea.l      -72(a7),a7
[0006f768] 2f48 0044                 move.l     a0,68(a7)
[0006f76c] 206f 0044                 movea.l    68(a7),a0
[0006f770] 2f50 0040                 move.l     (a0),64(a7)
[0006f774] 41f9 000e 2e02            lea.l      $000E2E02,a0
[0006f77a] 43d7                      lea.l      (a7),a1
[0006f77c] 700f                      moveq.l    #15,d0
PrintTopped_1:
[0006f77e] 22d8                      move.l     (a0)+,(a1)+
[0006f780] 51c8 fffc                 dbf        d0,PrintTopped_1
[0006f784] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f78a] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f790] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f796] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f79c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f7a2] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f7a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f7ae] 3028 02ce                 move.w     718(a0),d0
[0006f7b2] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f7b8] 3f40 0008                 move.w     d0,8(a7)
[0006f7bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f7c2] 3028 02ce                 move.w     718(a0),d0
[0006f7c6] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f7cc] 3f40 000a                 move.w     d0,10(a7)
[0006f7d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f7d6] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f7dc] 43d7                      lea.l      (a7),a1
[0006f7de] 206f 0040                 movea.l    64(a7),a0
[0006f7e2] 6100 f812                 bsr        pdlgMessage
[0006f7e6] 4fef 0048                 lea.l      72(a7),a7
[0006f7ea] 4e75                      rts

PrintMoved:
[0006f7ec] 4fef ffb4                 lea.l      -76(a7),a7
[0006f7f0] 2f48 0048                 move.l     a0,72(a7)
[0006f7f4] 2f49 0044                 move.l     a1,68(a7)
[0006f7f8] 206f 0048                 movea.l    72(a7),a0
[0006f7fc] 2f50 0040                 move.l     (a0),64(a7)
[0006f800] 41f9 000e 2e42            lea.l      $000E2E42,a0
[0006f806] 43d7                      lea.l      (a7),a1
[0006f808] 700f                      moveq.l    #15,d0
PrintMoved_1:
[0006f80a] 22d8                      move.l     (a0)+,(a1)+
[0006f80c] 51c8 fffc                 dbf        d0,PrintMoved_1
[0006f810] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f816] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f81c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f822] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f828] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f82e] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f834] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f83a] 3028 02ce                 move.w     718(a0),d0
[0006f83e] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f844] 3f40 0008                 move.w     d0,8(a7)
[0006f848] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f84e] 3028 02ce                 move.w     718(a0),d0
[0006f852] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f858] 3f40 000a                 move.w     d0,10(a7)
[0006f85c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f862] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f868] 206f 0044                 movea.l    68(a7),a0
[0006f86c] 3f50 0028                 move.w     (a0),40(a7)
[0006f870] 206f 0044                 movea.l    68(a7),a0
[0006f874] 3f68 0002 002a            move.w     2(a0),42(a7)
[0006f87a] 206f 0044                 movea.l    68(a7),a0
[0006f87e] 3f68 0004 002c            move.w     4(a0),44(a7)
[0006f884] 206f 0044                 movea.l    68(a7),a0
[0006f888] 3f68 0006 002e            move.w     6(a0),46(a7)
[0006f88e] 43d7                      lea.l      (a7),a1
[0006f890] 206f 0040                 movea.l    64(a7),a0
[0006f894] 6100 f760                 bsr        pdlgMessage
[0006f898] 206f 0048                 movea.l    72(a7),a0
[0006f89c] 4868 002a                 pea.l      42(a0)
[0006f8a0] 206f 004c                 movea.l    76(a7),a0
[0006f8a4] 4868 0028                 pea.l      40(a0)
[0006f8a8] 206f 0050                 movea.l    80(a7),a0
[0006f8ac] 4868 0026                 pea.l      38(a0)
[0006f8b0] 206f 0054                 movea.l    84(a7),a0
[0006f8b4] 4868 0024                 pea.l      36(a0)
[0006f8b8] 7205                      moveq.l    #5,d1
[0006f8ba] 206f 0058                 movea.l    88(a7),a0
[0006f8be] 3028 0020                 move.w     32(a0),d0
[0006f8c2] 4eb9 0007 f7ba            jsr        wind_get
[0006f8c8] 4fef 0010                 lea.l      16(a7),a7
[0006f8cc] 206f 0048                 movea.l    72(a7),a0
[0006f8d0] 4868 003a                 pea.l      58(a0)
[0006f8d4] 206f 004c                 movea.l    76(a7),a0
[0006f8d8] 4868 0038                 pea.l      56(a0)
[0006f8dc] 206f 0050                 movea.l    80(a7),a0
[0006f8e0] 4868 0036                 pea.l      54(a0)
[0006f8e4] 206f 0054                 movea.l    84(a7),a0
[0006f8e8] 4868 0034                 pea.l      52(a0)
[0006f8ec] 7204                      moveq.l    #4,d1
[0006f8ee] 206f 0058                 movea.l    88(a7),a0
[0006f8f2] 3028 0020                 move.w     32(a0),d0
[0006f8f6] 4eb9 0007 f7ba            jsr        wind_get
[0006f8fc] 4fef 0010                 lea.l      16(a7),a7
[0006f900] 206f 0048                 movea.l    72(a7),a0
[0006f904] 226f 0048                 movea.l    72(a7),a1
[0006f908] 2269 0014                 movea.l    20(a1),a1
[0006f90c] 3368 0038 0014            move.w     56(a0),20(a1)
[0006f912] 206f 0048                 movea.l    72(a7),a0
[0006f916] 226f 0048                 movea.l    72(a7),a1
[0006f91a] 2269 0014                 movea.l    20(a1),a1
[0006f91e] 3368 003a 0016            move.w     58(a0),22(a1)
[0006f924] 4fef 004c                 lea.l      76(a7),a7
[0006f928] 4e75                      rts

PrintSized:
[0006f92a] 4fef ffb4                 lea.l      -76(a7),a7
[0006f92e] 2f48 0048                 move.l     a0,72(a7)
[0006f932] 2f49 0044                 move.l     a1,68(a7)
[0006f936] 206f 0048                 movea.l    72(a7),a0
[0006f93a] 2f50 0040                 move.l     (a0),64(a7)
[0006f93e] 41f9 000e 2e82            lea.l      $000E2E82,a0
[0006f944] 43d7                      lea.l      (a7),a1
[0006f946] 700f                      moveq.l    #15,d0
PrintSized_1:
[0006f948] 22d8                      move.l     (a0)+,(a1)+
[0006f94a] 51c8 fffc                 dbf        d0,PrintSized_1
[0006f94e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f954] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006f95a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f960] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006f966] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f96c] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006f972] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f978] 3028 02ce                 move.w     718(a0),d0
[0006f97c] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006f982] 3f40 0008                 move.w     d0,8(a7)
[0006f986] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f98c] 3028 02ce                 move.w     718(a0),d0
[0006f990] 4eb9 0004 4330            jsr        nkc_n2gem
[0006f996] 3f40 000a                 move.w     d0,10(a7)
[0006f99a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006f9a0] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006f9a6] 206f 0044                 movea.l    68(a7),a0
[0006f9aa] 3f50 0028                 move.w     (a0),40(a7)
[0006f9ae] 206f 0044                 movea.l    68(a7),a0
[0006f9b2] 3f68 0002 002a            move.w     2(a0),42(a7)
[0006f9b8] 206f 0044                 movea.l    68(a7),a0
[0006f9bc] 3f68 0004 002c            move.w     4(a0),44(a7)
[0006f9c2] 206f 0044                 movea.l    68(a7),a0
[0006f9c6] 3f68 0006 002e            move.w     6(a0),46(a7)
[0006f9cc] 43d7                      lea.l      (a7),a1
[0006f9ce] 206f 0040                 movea.l    64(a7),a0
[0006f9d2] 6100 f622                 bsr        pdlgMessage
[0006f9d6] 206f 0048                 movea.l    72(a7),a0
[0006f9da] 4868 002a                 pea.l      42(a0)
[0006f9de] 206f 004c                 movea.l    76(a7),a0
[0006f9e2] 4868 0028                 pea.l      40(a0)
[0006f9e6] 206f 0050                 movea.l    80(a7),a0
[0006f9ea] 4868 0026                 pea.l      38(a0)
[0006f9ee] 206f 0054                 movea.l    84(a7),a0
[0006f9f2] 4868 0024                 pea.l      36(a0)
[0006f9f6] 7205                      moveq.l    #5,d1
[0006f9f8] 206f 0058                 movea.l    88(a7),a0
[0006f9fc] 3028 0020                 move.w     32(a0),d0
[0006fa00] 4eb9 0007 f7ba            jsr        wind_get
[0006fa06] 4fef 0010                 lea.l      16(a7),a7
[0006fa0a] 206f 0048                 movea.l    72(a7),a0
[0006fa0e] 4868 003a                 pea.l      58(a0)
[0006fa12] 206f 004c                 movea.l    76(a7),a0
[0006fa16] 4868 0038                 pea.l      56(a0)
[0006fa1a] 206f 0050                 movea.l    80(a7),a0
[0006fa1e] 4868 0036                 pea.l      54(a0)
[0006fa22] 206f 0054                 movea.l    84(a7),a0
[0006fa26] 4868 0034                 pea.l      52(a0)
[0006fa2a] 7204                      moveq.l    #4,d1
[0006fa2c] 206f 0058                 movea.l    88(a7),a0
[0006fa30] 3028 0020                 move.w     32(a0),d0
[0006fa34] 4eb9 0007 f7ba            jsr        wind_get
[0006fa3a] 4fef 0010                 lea.l      16(a7),a7
[0006fa3e] 206f 0048                 movea.l    72(a7),a0
[0006fa42] 226f 0048                 movea.l    72(a7),a1
[0006fa46] 2269 0014                 movea.l    20(a1),a1
[0006fa4a] 3368 0038 0014            move.w     56(a0),20(a1)
[0006fa50] 206f 0048                 movea.l    72(a7),a0
[0006fa54] 226f 0048                 movea.l    72(a7),a1
[0006fa58] 2269 0014                 movea.l    20(a1),a1
[0006fa5c] 3368 003a 0016            move.w     58(a0),22(a1)
[0006fa62] 4fef 004c                 lea.l      76(a7),a7
[0006fa66] 4e75                      rts

PrintIconify:
[0006fa68] 5d4f                      subq.w     #6,a7
[0006fa6a] 2f48 0002                 move.l     a0,2(a7)
[0006fa6e] 3e80                      move.w     d0,(a7)
[0006fa70] 3017                      move.w     (a7),d0
[0006fa72] 206f 0002                 movea.l    2(a7),a0
[0006fa76] 4eb9 0005 998a            jsr        Awi_iconify
[0006fa7c] 5c4f                      addq.w     #6,a7
[0006fa7e] 4e75                      rts

PrintUniconify:
[0006fa80] 594f                      subq.w     #4,a7
[0006fa82] 2e88                      move.l     a0,(a7)
[0006fa84] 2057                      movea.l    (a7),a0
[0006fa86] 4eb9 0005 9c6c            jsr        Awi_uniconify
[0006fa8c] 584f                      addq.w     #4,a7
[0006fa8e] 4e75                      rts

PrintGEMScript:
[0006fa90] 4fef fff6                 lea.l      -10(a7),a7
[0006fa94] 2f48 0006                 move.l     a0,6(a7)
[0006fa98] 3f40 0004                 move.w     d0,4(a7)
[0006fa9c] 2e89                      move.l     a1,(a7)
[0006fa9e] 2f2f 000e                 move.l     14(a7),-(a7)
[0006faa2] 226f 0004                 movea.l    4(a7),a1
[0006faa6] 302f 0008                 move.w     8(a7),d0
[0006faaa] 206f 000a                 movea.l    10(a7),a0
[0006faae] 4eb9 0005 b5b6            jsr        Awi_gemscript
[0006fab4] 584f                      addq.w     #4,a7
[0006fab6] 4fef 000a                 lea.l      10(a7),a7
[0006faba] 4e75                      rts

PrintClicked:
[0006fabc] 4fef ffbc                 lea.l      -68(a7),a7
[0006fac0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006fac6] 2068 0258                 movea.l    600(a0),a0
[0006faca] 2f50 0040                 move.l     (a0),64(a7)
[0006face] 41f9 000e 2ec2            lea.l      $000E2EC2,a0
[0006fad4] 43d7                      lea.l      (a7),a1
[0006fad6] 700f                      moveq.l    #15,d0
PrintClicked_1:
[0006fad8] 22d8                      move.l     (a0)+,(a1)+
[0006fada] 51c8 fffc                 dbf        d0,PrintClicked_1
[0006fade] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006fae4] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006faea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006faf0] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006faf6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006fafc] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006fb02] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006fb08] 3028 02ce                 move.w     718(a0),d0
[0006fb0c] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006fb12] 3f40 0008                 move.w     d0,8(a7)
[0006fb16] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006fb1c] 3028 02ce                 move.w     718(a0),d0
[0006fb20] 4eb9 0004 4330            jsr        nkc_n2gem
[0006fb26] 3f40 000a                 move.w     d0,10(a7)
[0006fb2a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006fb30] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006fb36] 43d7                      lea.l      (a7),a1
[0006fb38] 206f 0040                 movea.l    64(a7),a0
[0006fb3c] 6100 f4b8                 bsr        pdlgMessage
[0006fb40] 4fef 0044                 lea.l      68(a7),a7
[0006fb44] 4e75                      rts

	.data

TEXT_01:
[000e2b6c]                           dc.w $0000
PrintSelObj:
[000e2b6e]                           dc.w $ffff
[000e2b70]                           dc.w $ffff
[000e2b72]                           dc.w $ffff
[000e2b74]                           dc.w $0014
[000e2b76]                           dc.w $0040
[000e2b78]                           dc.w $0000
[000e2b7a]                           dc.w $0002
[000e2b7c]                           dc.w $1100
[000e2b7e]                           dc.w $0000
[000e2b80]                           dc.w $0000
[000e2b82]                           dc.w $0028
[000e2b84]                           dc.w $0014
_00aPrintSelObj:
[000e2b86] 0006fabc                  dc.l PrintClicked
[000e2b8a]                           dc.w $0000
[000e2b8c]                           dc.w $0000
[000e2b8e]                           dc.w $8020
[000e2b90]                           dc.w $0000
[000e2b92]                           dc.w $0000
[000e2b94]                           dc.w $0000
[000e2b96]                           dc.w $0000
[000e2b98]                           dc.w $0000
[000e2b9a]                           dc.w $0000
[000e2b9c]                           dc.w $0000
PrintSelWind:
[000e2b9e]                           dc.w $0000
[000e2ba0]                           dc.w $0000
[000e2ba2] 0006f1a2                  dc.l PrintService
[000e2ba6] 0006f0a2                  dc.l PrintCreate
[000e2baa] 0006f232                  dc.l PrintOpen
[000e2bae] 0006f5ba                  dc.l PrintInit
[000e2bb2] 000e2b6e                  dc.l PrintSelObj
[000e2bb6]                           dc.w $0000
[000e2bb8]                           dc.w $0000
[000e2bba]                           dc.w $0000
[000e2bbc]                           dc.w $0000
[000e2bbe]                           dc.w $ffff
[000e2bc0]                           dc.w $6fef
[000e2bc2]                           dc.w $0000
[000e2bc4]                           dc.w $0000
[000e2bc6]                           dc.w $0078
[000e2bc8]                           dc.w $0032
[000e2bca]                           dc.w $0000
[000e2bcc]                           dc.w $0000
[000e2bce]                           dc.w $0000
[000e2bd0]                           dc.w $0000
[000e2bd2]                           dc.w $0000
[000e2bd4]                           dc.w $0000
[000e2bd6]                           dc.w $0000
[000e2bd8]                           dc.w $0000
[000e2bda]                           dc.w $ffff
[000e2bdc]                           dc.w $ffff
[000e2bde]                           dc.w $ffff
[000e2be0]                           dc.w $ffff
[000e2be2]                           dc.w $0000
[000e2be4]                           dc.w $0000
[000e2be6]                           dc.w $f8f8
[000e2be8] 000e2b6c                  dc.l TEXT_01
[000e2bec] 000e2b6d                  dc.l TEXT_02
[000e2bf0]                           dc.w $0000
[000e2bf2]                           dc.w $0100
[000e2bf4]                           dc.w $0000
[000e2bf6]                           dc.w $ffff
[000e2bf8]                           dc.w $0000
[000e2bfa]                           dc.w $0000
[000e2bfc]                           dc.w $0000
[000e2bfe]                           dc.w $0000
[000e2c00] 0006f6e2                  dc.l PrintKeys
[000e2c04] 0006f516                  dc.l PrintChange
[000e2c08] 0006f3d2                  dc.l PrintRedraw
[000e2c0c] 0006f764                  dc.l PrintTopped
[000e2c10] 0006f34a                  dc.l PrintClosed
[000e2c14] 0006f532                  dc.l PrintFulled
[000e2c18] 0006f484                  dc.l PrintArrowed
[000e2c1c] 0006f5be                  dc.l PrintHSlide
[000e2c20] 0006f650                  dc.l PrintVSlide
[000e2c24] 0006f92a                  dc.l PrintSized
[000e2c28] 0006f7ec                  dc.l PrintMoved
[000e2c2c] 0006fa68                  dc.l PrintIconify
[000e2c30] 0006fa80                  dc.l PrintUniconify
[000e2c34] 0006fa90                  dc.l PrintGEMScript
[000e2c38]                           dc.w $0000
[000e2c3a]                           dc.w $0000
[000e2c3c]                           dc.w $0000
[000e2c3e]                           dc.w $0000
vorhanden:
[000e2c40]                           dc.w $ffff
[000e2c42]                           dc.w $0010
[000e2c44]                           dc.w $0000
[000e2c46]                           dc.w $0000
[000e2c48]                           dc.w $0000
[000e2c4a]                           dc.w $0000
[000e2c4c]                           dc.w $0000
[000e2c4e]                           dc.w $0000
[000e2c50]                           dc.w $0000
[000e2c52]                           dc.w $0000
[000e2c54]                           dc.w $0000
[000e2c56]                           dc.w $0000
[000e2c58]                           dc.w $0000
[000e2c5a]                           dc.w $0000
[000e2c5c]                           dc.w $0000
[000e2c5e]                           dc.w $0000
[000e2c60]                           dc.w $0000
[000e2c62]                           dc.w $0016
[000e2c64]                           dc.w $0001
[000e2c66]                           dc.w $0000
[000e2c68]                           dc.w $0000
[000e2c6a]                           dc.w $0000
[000e2c6c]                           dc.w $0000
[000e2c6e]                           dc.w $0000
[000e2c70]                           dc.w $0000
[000e2c72]                           dc.w $0000
[000e2c74]                           dc.w $0000
[000e2c76]                           dc.w $0000
[000e2c78]                           dc.w $0000
[000e2c7a]                           dc.w $0000
[000e2c7c]                           dc.w $0000
[000e2c7e]                           dc.w $0000
[000e2c80]                           dc.w $0000
[000e2c82]                           dc.w $0010
[000e2c84]                           dc.w $0000
[000e2c86]                           dc.w $0000
[000e2c88]                           dc.w $0000
[000e2c8a]                           dc.w $0000
[000e2c8c]                           dc.w $0000
[000e2c8e]                           dc.w $0000
[000e2c90]                           dc.w $0000
[000e2c92]                           dc.w $0000
[000e2c94]                           dc.w $0000
[000e2c96]                           dc.w $0000
[000e2c98]                           dc.w $0000
[000e2c9a]                           dc.w $0000
[000e2c9c]                           dc.w $0000
[000e2c9e]                           dc.w $0000
[000e2ca0]                           dc.w $0000
[000e2ca2]                           dc.w $0014
[000e2ca4]                           dc.w $0001
[000e2ca6]                           dc.w $0000
[000e2ca8]                           dc.w $0000
[000e2caa]                           dc.w $0000
[000e2cac]                           dc.w $0000
[000e2cae]                           dc.w $0000
[000e2cb0]                           dc.w $0000
[000e2cb2]                           dc.w $0000
[000e2cb4]                           dc.w $0000
[000e2cb6]                           dc.w $0000
[000e2cb8]                           dc.w $0000
[000e2cba]                           dc.w $0000
[000e2cbc]                           dc.w $0000
[000e2cbe]                           dc.w $0000
[000e2cc0]                           dc.w $0000
[000e2cc2]                           dc.w $0010
[000e2cc4]                           dc.w $0000
[000e2cc6]                           dc.w $0000
[000e2cc8]                           dc.w $0000
[000e2cca]                           dc.w $0000
[000e2ccc]                           dc.w $0000
[000e2cce]                           dc.w $0000
[000e2cd0]                           dc.w $0000
[000e2cd2]                           dc.w $0000
[000e2cd4]                           dc.w $0000
[000e2cd6]                           dc.w $0000
[000e2cd8]                           dc.w $0000
[000e2cda]                           dc.w $0000
[000e2cdc]                           dc.w $0000
[000e2cde]                           dc.w $0000
[000e2ce0]                           dc.w $0000
[000e2ce2]                           dc.w $0018
[000e2ce4]                           dc.w $0001
[000e2ce6]                           dc.w $0000
[000e2ce8]                           dc.w $0000
[000e2cea]                           dc.w $0000
[000e2cec]                           dc.w $0000
[000e2cee]                           dc.w $0000
[000e2cf0]                           dc.w $0000
[000e2cf2]                           dc.w $0000
[000e2cf4]                           dc.w $0000
[000e2cf6]                           dc.w $0000
[000e2cf8]                           dc.w $0000
[000e2cfa]                           dc.w $0000
[000e2cfc]                           dc.w $0000
[000e2cfe]                           dc.w $0000
[000e2d00]                           dc.w $0000
[000e2d02]                           dc.w $0010
[000e2d04]                           dc.w $0000
[000e2d06]                           dc.w $0000
[000e2d08]                           dc.w $0000
[000e2d0a]                           dc.w $0000
[000e2d0c]                           dc.w $0000
[000e2d0e]                           dc.w $0000
[000e2d10]                           dc.w $0000
[000e2d12]                           dc.w $0000
[000e2d14]                           dc.w $0000
[000e2d16]                           dc.w $0000
[000e2d18]                           dc.w $0000
[000e2d1a]                           dc.w $0000
[000e2d1c]                           dc.w $0000
[000e2d1e]                           dc.w $0000
[000e2d20]                           dc.w $0000
[000e2d22]                           dc.w $0017
[000e2d24]                           dc.w $0001
[000e2d26]                           dc.w $0000
[000e2d28]                           dc.w $0000
[000e2d2a]                           dc.w $0000
[000e2d2c]                           dc.w $0000
[000e2d2e]                           dc.w $0000
[000e2d30]                           dc.w $0000
[000e2d32]                           dc.w $0000
[000e2d34]                           dc.w $0000
[000e2d36]                           dc.w $0000
[000e2d38]                           dc.w $0000
[000e2d3a]                           dc.w $0000
[000e2d3c]                           dc.w $0000
[000e2d3e]                           dc.w $0000
[000e2d40]                           dc.w $0000
[000e2d42]                           dc.w $0010
[000e2d44]                           dc.w $0000
[000e2d46]                           dc.w $0000
[000e2d48]                           dc.w $0000
[000e2d4a]                           dc.w $0000
[000e2d4c]                           dc.w $0000
[000e2d4e]                           dc.w $0000
[000e2d50]                           dc.w $0000
[000e2d52]                           dc.w $0000
[000e2d54]                           dc.w $0000
[000e2d56]                           dc.w $0000
[000e2d58]                           dc.w $0000
[000e2d5a]                           dc.w $0000
[000e2d5c]                           dc.w $0000
[000e2d5e]                           dc.w $0000
[000e2d60]                           dc.w $0000
[000e2d62]                           dc.w $0019
[000e2d64]                           dc.w $0001
[000e2d66]                           dc.w $0000
[000e2d68]                           dc.w $0000
[000e2d6a]                           dc.w $0000
[000e2d6c]                           dc.w $0000
[000e2d6e]                           dc.w $0000
[000e2d70]                           dc.w $0000
[000e2d72]                           dc.w $0000
[000e2d74]                           dc.w $0000
[000e2d76]                           dc.w $0000
[000e2d78]                           dc.w $0000
[000e2d7a]                           dc.w $0000
[000e2d7c]                           dc.w $0000
[000e2d7e]                           dc.w $0000
[000e2d80]                           dc.w $0000
[000e2d82]                           dc.w $0010
[000e2d84]                           dc.w $0000
[000e2d86]                           dc.w $0000
[000e2d88]                           dc.w $0000
[000e2d8a]                           dc.w $0000
[000e2d8c]                           dc.w $0000
[000e2d8e]                           dc.w $0000
[000e2d90]                           dc.w $0000
[000e2d92]                           dc.w $0000
[000e2d94]                           dc.w $0000
[000e2d96]                           dc.w $0000
[000e2d98]                           dc.w $0000
[000e2d9a]                           dc.w $0000
[000e2d9c]                           dc.w $0000
[000e2d9e]                           dc.w $0000
[000e2da0]                           dc.w $0000
[000e2da2]                           dc.w $001a
[000e2da4]                           dc.w $0001
[000e2da6]                           dc.w $0000
[000e2da8]                           dc.w $0000
[000e2daa]                           dc.w $0000
[000e2dac]                           dc.w $0000
[000e2dae]                           dc.w $0000
[000e2db0]                           dc.w $0000
[000e2db2]                           dc.w $0000
[000e2db4]                           dc.w $0000
[000e2db6]                           dc.w $0000
[000e2db8]                           dc.w $0000
[000e2dba]                           dc.w $0000
[000e2dbc]                           dc.w $0000
[000e2dbe]                           dc.w $0000
[000e2dc0]                           dc.w $0000
[000e2dc2]                           dc.w $0001
[000e2dc4]                           dc.w $0000
[000e2dc6]                           dc.w $0000
[000e2dc8]                           dc.w $0000
[000e2dca]                           dc.w $0000
[000e2dcc]                           dc.w $0000
[000e2dce]                           dc.w $0000
[000e2dd0]                           dc.w $0000
[000e2dd2]                           dc.w $0000
[000e2dd4]                           dc.w $0000
[000e2dd6]                           dc.w $0000
[000e2dd8]                           dc.w $0000
[000e2dda]                           dc.w $0000
[000e2ddc]                           dc.w $0000
[000e2dde]                           dc.w $0000
[000e2de0]                           dc.w $0000
[000e2de2]                           dc.w $0000
[000e2de4]                           dc.w $0000
[000e2de6]                           dc.w $0000
[000e2de8]                           dc.w $0000
[000e2dea]                           dc.w $0000
[000e2dec]                           dc.w $0000
[000e2dee]                           dc.w $0000
[000e2df0]                           dc.w $0000
[000e2df2]                           dc.w $0000
[000e2df4]                           dc.w $0000
[000e2df6]                           dc.w $0000
[000e2df8]                           dc.w $0000
[000e2dfa]                           dc.w $0000
[000e2dfc]                           dc.w $0000
[000e2dfe]                           dc.w $0000
[000e2e00]                           dc.w $0000
[000e2e02]                           dc.w $0010
[000e2e04]                           dc.w $0000
[000e2e06]                           dc.w $0000
[000e2e08]                           dc.w $0000
[000e2e0a]                           dc.w $0000
[000e2e0c]                           dc.w $0000
[000e2e0e]                           dc.w $0000
[000e2e10]                           dc.w $0000
[000e2e12]                           dc.w $0000
[000e2e14]                           dc.w $0000
[000e2e16]                           dc.w $0000
[000e2e18]                           dc.w $0000
[000e2e1a]                           dc.w $0000
[000e2e1c]                           dc.w $0000
[000e2e1e]                           dc.w $0000
[000e2e20]                           dc.w $0000
[000e2e22]                           dc.w $0015
[000e2e24]                           dc.w $0001
[000e2e26]                           dc.w $0000
[000e2e28]                           dc.w $0000
[000e2e2a]                           dc.w $0000
[000e2e2c]                           dc.w $0000
[000e2e2e]                           dc.w $0000
[000e2e30]                           dc.w $0000
[000e2e32]                           dc.w $0000
[000e2e34]                           dc.w $0000
[000e2e36]                           dc.w $0000
[000e2e38]                           dc.w $0000
[000e2e3a]                           dc.w $0000
[000e2e3c]                           dc.w $0000
[000e2e3e]                           dc.w $0000
[000e2e40]                           dc.w $0000
[000e2e42]                           dc.w $0010
[000e2e44]                           dc.w $0000
[000e2e46]                           dc.w $0000
[000e2e48]                           dc.w $0000
[000e2e4a]                           dc.w $0000
[000e2e4c]                           dc.w $0000
[000e2e4e]                           dc.w $0000
[000e2e50]                           dc.w $0000
[000e2e52]                           dc.w $0000
[000e2e54]                           dc.w $0000
[000e2e56]                           dc.w $0000
[000e2e58]                           dc.w $0000
[000e2e5a]                           dc.w $0000
[000e2e5c]                           dc.w $0000
[000e2e5e]                           dc.w $0000
[000e2e60]                           dc.w $0000
[000e2e62]                           dc.w $001c
[000e2e64]                           dc.w $0001
[000e2e66]                           dc.w $0000
[000e2e68]                           dc.w $0000
[000e2e6a]                           dc.w $0000
[000e2e6c]                           dc.w $0000
[000e2e6e]                           dc.w $0000
[000e2e70]                           dc.w $0000
[000e2e72]                           dc.w $0000
[000e2e74]                           dc.w $0000
[000e2e76]                           dc.w $0000
[000e2e78]                           dc.w $0000
[000e2e7a]                           dc.w $0000
[000e2e7c]                           dc.w $0000
[000e2e7e]                           dc.w $0000
[000e2e80]                           dc.w $0000
[000e2e82]                           dc.w $0010
[000e2e84]                           dc.w $0000
[000e2e86]                           dc.w $0000
[000e2e88]                           dc.w $0000
[000e2e8a]                           dc.w $0000
[000e2e8c]                           dc.w $0000
[000e2e8e]                           dc.w $0000
[000e2e90]                           dc.w $0000
[000e2e92]                           dc.w $0000
[000e2e94]                           dc.w $0000
[000e2e96]                           dc.w $0000
[000e2e98]                           dc.w $0000
[000e2e9a]                           dc.w $0000
[000e2e9c]                           dc.w $0000
[000e2e9e]                           dc.w $0000
[000e2ea0]                           dc.w $0000
[000e2ea2]                           dc.w $001b
[000e2ea4]                           dc.w $0001
[000e2ea6]                           dc.w $0000
[000e2ea8]                           dc.w $0000
[000e2eaa]                           dc.w $0000
[000e2eac]                           dc.w $0000
[000e2eae]                           dc.w $0000
[000e2eb0]                           dc.w $0000
[000e2eb2]                           dc.w $0000
[000e2eb4]                           dc.w $0000
[000e2eb6]                           dc.w $0000
[000e2eb8]                           dc.w $0000
[000e2eba]                           dc.w $0000
[000e2ebc]                           dc.w $0000
[000e2ebe]                           dc.w $0000
[000e2ec0]                           dc.w $0000
[000e2ec2]                           dc.w $0002
[000e2ec4]                           dc.w $0000
[000e2ec6]                           dc.w $0000
[000e2ec8]                           dc.w $0000
[000e2eca]                           dc.w $0000
[000e2ecc]                           dc.w $0000
[000e2ece]                           dc.w $0000
[000e2ed0]                           dc.w $0000
[000e2ed2]                           dc.w $0000
[000e2ed4]                           dc.w $0000
[000e2ed6]                           dc.w $0000
[000e2ed8]                           dc.w $0000
[000e2eda]                           dc.w $0000
[000e2edc]                           dc.w $0000
[000e2ede]                           dc.w $0000
[000e2ee0]                           dc.w $0000
[000e2ee2]                           dc.w $0000
[000e2ee4]                           dc.w $0000
[000e2ee6]                           dc.w $0000
[000e2ee8]                           dc.w $0000
[000e2eea]                           dc.w $0000
[000e2eec]                           dc.w $0000
[000e2eee]                           dc.w $0000
[000e2ef0]                           dc.w $0000
[000e2ef2]                           dc.w $0000
[000e2ef4]                           dc.w $0000
[000e2ef6]                           dc.w $0000
[000e2ef8]                           dc.w $0000
[000e2efa]                           dc.w $0000
[000e2efc]                           dc.w $0000
[000e2efe]                           dc.w $0000
[000e2f00]                           dc.w $0000

