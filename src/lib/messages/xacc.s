Aev_InitXAcc:
[0005ec38] 4fef fff0                 lea.l      -16(a7),a7
[0005ec3c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ec42] 3028 0238                 move.w     568(a0),d0
[0005ec46] 6700 007a                 beq.w      $0005ECC2
[0005ec4a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ec50] 2068 0280                 movea.l    640(a0),a0
[0005ec54] 0c50 0400                 cmpi.w     #$0400,(a0)
[0005ec58] 6c0a                      bge.s      $0005EC64
[0005ec5a] 0c79 0200 0010 f55c       cmpi.w     #$0200,_ACSv_magix
[0005ec62] 6d5e                      blt.s      $0005ECC2
[0005ec64] 2f39 000e 692a            move.l     _globl,-(a7)
[0005ec6a] 486f 000e                 pea.l      14(a7)
[0005ec6e] 43ef 0014                 lea.l      20(a7),a1
[0005ec72] 41ef 0008                 lea.l      8(a7),a0
[0005ec76] 4240                      clr.w      d0
[0005ec78] 4eb9 0007 8cd2            jsr        mt_appl_search
[0005ec7e] 504f                      addq.w     #8,a7
[0005ec80] 3f40 000e                 move.w     d0,14(a7)
[0005ec84] 6036                      bra.s      $0005ECBC
[0005ec86] 7006                      moveq.l    #6,d0
[0005ec88] c06f 000c                 and.w      12(a7),d0
[0005ec8c] 670e                      beq.s      $0005EC9C
[0005ec8e] 4241                      clr.w      d1
[0005ec90] 91c8                      suba.l     a0,a0
[0005ec92] 302f 000a                 move.w     10(a7),d0
[0005ec96] 4eb9 0005 f56e            jsr        Aev_AccID
[0005ec9c] 2f39 000e 692a            move.l     _globl,-(a7)
[0005eca2] 486f 000e                 pea.l      14(a7)
[0005eca6] 43ef 0014                 lea.l      20(a7),a1
[0005ecaa] 41ef 0008                 lea.l      8(a7),a0
[0005ecae] 7001                      moveq.l    #1,d0
[0005ecb0] 4eb9 0007 8cd2            jsr        mt_appl_search
[0005ecb6] 504f                      addq.w     #8,a7
[0005ecb8] 3f40 000e                 move.w     d0,14(a7)
[0005ecbc] 302f 000e                 move.w     14(a7),d0
[0005ecc0] 66c4                      bne.s      $0005EC86
[0005ecc2] 7001                      moveq.l    #1,d0
[0005ecc4] 4fef 0010                 lea.l      16(a7),a7
[0005ecc8] 4e75                      rts
Aev_ExitXAcc:
[0005ecca] 7001                      moveq.l    #1,d0
[0005eccc] 4e75                      rts
XAccDataDelete:
[0005ecce] 2f0a                      move.l     a2,-(a7)
[0005ecd0] 594f                      subq.w     #4,a7
[0005ecd2] 2e88                      move.l     a0,(a7)
[0005ecd4] 2017                      move.l     (a7),d0
[0005ecd6] 6736                      beq.s      $0005ED0E
[0005ecd8] 2057                      movea.l    (a7),a0
[0005ecda] 2028 0006                 move.l     6(a0),d0
[0005ecde] 6722                      beq.s      $0005ED02
[0005ece0] 4879 0007 0f86            pea.l      Alu_ptrCmp
[0005ece6] 206f 0004                 movea.l    4(a7),a0
[0005ecea] 2268 0006                 movea.l    6(a0),a1
[0005ecee] 2079 000e 147e            movea.l    globProtData,a0
[0005ecf4] 2479 000e 147e            movea.l    globProtData,a2
[0005ecfa] 246a 0018                 movea.l    24(a2),a2
[0005ecfe] 4e92                      jsr        (a2)
[0005ed00] 584f                      addq.w     #4,a7
[0005ed02] 720a                      moveq.l    #10,d1
[0005ed04] 4240                      clr.w      d0
[0005ed06] 2057                      movea.l    (a7),a0
[0005ed08] 4eb9 0008 36ea            jsr        memset
[0005ed0e] 584f                      addq.w     #4,a7
[0005ed10] 245f                      movea.l    (a7)+,a2
[0005ed12] 4e75                      rts
Aev_CheckXAccPart:
[0005ed14] 5d4f                      subq.w     #6,a7
[0005ed16] 3f40 0004                 move.w     d0,4(a7)
[0005ed1a] 302f 0004                 move.w     4(a7),d0
[0005ed1e] 4eb9 0005 dab8            jsr        Aev_DDSearch
[0005ed24] 2e88                      move.l     a0,(a7)
[0005ed26] 2017                      move.l     (a7),d0
[0005ed28] 670a                      beq.s      $0005ED34
[0005ed2a] 7002                      moveq.l    #2,d0
[0005ed2c] 2057                      movea.l    (a7),a0
[0005ed2e] c0a8 0002                 and.l      2(a0),d0
[0005ed32] 6610                      bne.s      $0005ED44
[0005ed34] 4241                      clr.w      d1
[0005ed36] 302f 0004                 move.w     4(a7),d0
[0005ed3a] 4eb9 0005 f77c            jsr        Aev_AccAck
[0005ed40] 91c8                      suba.l     a0,a0
[0005ed42] 6002                      bra.s      $0005ED46
[0005ed44] 2057                      movea.l    (a7),a0
[0005ed46] 5c4f                      addq.w     #6,a7
[0005ed48] 4e75                      rts
Aev_GetAccID:
[0005ed4a] 2f0a                      move.l     a2,-(a7)
[0005ed4c] 4fef fff2                 lea.l      -14(a7),a7
[0005ed50] 2f48 000a                 move.l     a0,10(a7)
[0005ed54] 206f 000a                 movea.l    10(a7),a0
[0005ed58] 2f50 0006                 move.l     (a0),6(a7)
[0005ed5c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ed62] 3028 0238                 move.w     568(a0),d0
[0005ed66] 661a                      bne.s      $0005ED82
[0005ed68] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ed6e] 3010                      move.w     (a0),d0
[0005ed70] 6610                      bne.s      $0005ED82
[0005ed72] 72ff                      moveq.l    #-1,d1
[0005ed74] 93c9                      suba.l     a1,a1
[0005ed76] 206f 0006                 movea.l    6(a7),a0
[0005ed7a] 70ff                      moveq.l    #-1,d0
[0005ed7c] 4eb9 0005 f60a            jsr        Aev_AccAcc
[0005ed82] 206f 0006                 movea.l    6(a7),a0
[0005ed86] 2f68 0008 0002            move.l     8(a0),2(a7)
[0005ed8c] 4241                      clr.w      d1
[0005ed8e] 70ff                      moveq.l    #-1,d0
[0005ed90] 206f 0002                 movea.l    2(a7),a0
[0005ed94] 4eb9 0004 ca32            jsr        Ax_memCheck
[0005ed9a] 4a40                      tst.w      d0
[0005ed9c] 671e                      beq.s      $0005EDBC
[0005ed9e] 226f 0002                 movea.l    2(a7),a1
[0005eda2] 206f 0006                 movea.l    6(a7),a0
[0005eda6] 5c48                      addq.w     #6,a0
[0005eda8] 7202                      moveq.l    #2,d1
[0005edaa] 246f 0006                 movea.l    6(a7),a2
[0005edae] 302a 0002                 move.w     2(a2),d0
[0005edb2] 4eb9 0005 daec            jsr        Aev_DDAdd
[0005edb8] 3e80                      move.w     d0,(a7)
[0005edba] 6002                      bra.s      $0005EDBE
[0005edbc] 4257                      clr.w      (a7)
[0005edbe] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005edc4] 3028 0238                 move.w     568(a0),d0
[0005edc8] 660a                      bne.s      $0005EDD4
[0005edca] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005edd0] 3010                      move.w     (a0),d0
[0005edd2] 6616                      bne.s      $0005EDEA
[0005edd4] 72ff                      moveq.l    #-1,d1
[0005edd6] 93c9                      suba.l     a1,a1
[0005edd8] 206f 0006                 movea.l    6(a7),a0
[0005eddc] 246f 0006                 movea.l    6(a7),a2
[0005ede0] 302a 0002                 move.w     2(a2),d0
[0005ede4] 4eb9 0005 f60a            jsr        Aev_AccAcc
[0005edea] 3017                      move.w     (a7),d0
[0005edec] 4fef 000e                 lea.l      14(a7),a7
[0005edf0] 245f                      movea.l    (a7)+,a2
[0005edf2] 4e75                      rts
Aev_GetAccAck:
[0005edf4] 2f0a                      move.l     a2,-(a7)
[0005edf6] 4fef fff0                 lea.l      -16(a7),a7
[0005edfa] 2f48 000c                 move.l     a0,12(a7)
[0005edfe] 206f 000c                 movea.l    12(a7),a0
[0005ee02] 2f50 0008                 move.l     (a0),8(a7)
[0005ee06] 4297                      clr.l      (a7)
[0005ee08] 206f 0008                 movea.l    8(a7),a0
[0005ee0c] 3028 0002                 move.w     2(a0),d0
[0005ee10] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ee16] b050                      cmp.w      (a0),d0
[0005ee18] 6700 00ae                 beq        $0005EEC8
[0005ee1c] 206f 0008                 movea.l    8(a7),a0
[0005ee20] 3028 0002                 move.w     2(a0),d0
[0005ee24] 6100 feee                 bsr        Aev_CheckXAccPart
[0005ee28] 2f48 0004                 move.l     a0,4(a7)
[0005ee2c] 202f 0004                 move.l     4(a7),d0
[0005ee30] 670c                      beq.s      $0005EE3E
[0005ee32] 206f 0004                 movea.l    4(a7),a0
[0005ee36] 41e8 0016                 lea.l      22(a0),a0
[0005ee3a] 6100 fe92                 bsr        XAccDataDelete
[0005ee3e] 4879 0005 d8e4            pea.l      Aev_CmpDestID
[0005ee44] 226f 000c                 movea.l    12(a7),a1
[0005ee48] 5449                      addq.w     #2,a1
[0005ee4a] 2079 000d fba6            movea.l    SentMsg,a0
[0005ee50] 2479 000d fba6            movea.l    SentMsg,a2
[0005ee56] 246a 0020                 movea.l    32(a2),a2
[0005ee5a] 4e92                      jsr        (a2)
[0005ee5c] 584f                      addq.w     #4,a7
[0005ee5e] 2e88                      move.l     a0,(a7)
[0005ee60] 2017                      move.l     (a7),d0
[0005ee62] 6764                      beq.s      $0005EEC8
[0005ee64] 4879 0007 0f86            pea.l      Alu_ptrCmp
[0005ee6a] 226f 0004                 movea.l    4(a7),a1
[0005ee6e] 2079 000d fba6            movea.l    SentMsg,a0
[0005ee74] 2479 000d fba6            movea.l    SentMsg,a2
[0005ee7a] 246a 0020                 movea.l    32(a2),a2
[0005ee7e] 4e92                      jsr        (a2)
[0005ee80] 584f                      addq.w     #4,a7
[0005ee82] 2008                      move.l     a0,d0
[0005ee84] 6742                      beq.s      $0005EEC8
[0005ee86] 2057                      movea.l    (a7),a0
[0005ee88] 2028 0002                 move.l     2(a0),d0
[0005ee8c] 671c                      beq.s      $0005EEAA
[0005ee8e] 226f 0008                 movea.l    8(a7),a1
[0005ee92] 5c49                      addq.w     #6,a1
[0005ee94] 303c 0190                 move.w     #$0190,d0
[0005ee98] 2057                      movea.l    (a7),a0
[0005ee9a] 2068 0002                 movea.l    2(a0),a0
[0005ee9e] 2457                      movea.l    (a7),a2
[0005eea0] 246a 0002                 movea.l    2(a2),a2
[0005eea4] 246a 0004                 movea.l    4(a2),a2
[0005eea8] 4e92                      jsr        (a2)
[0005eeaa] 4879 0007 0f86            pea.l      Alu_ptrCmp
[0005eeb0] 226f 0004                 movea.l    4(a7),a1
[0005eeb4] 2079 000d fba6            movea.l    SentMsg,a0
[0005eeba] 2479 000d fba6            movea.l    SentMsg,a2
[0005eec0] 246a 0018                 movea.l    24(a2),a2
[0005eec4] 4e92                      jsr        (a2)
[0005eec6] 584f                      addq.w     #4,a7
[0005eec8] 2017                      move.l     (a7),d0
[0005eeca] 6704                      beq.s      $0005EED0
[0005eecc] 7001                      moveq.l    #1,d0
[0005eece] 6002                      bra.s      $0005EED2
[0005eed0] 4240                      clr.w      d0
[0005eed2] 4fef 0010                 lea.l      16(a7),a7
[0005eed6] 245f                      movea.l    (a7)+,a2
[0005eed8] 4e75                      rts
Aev_GetAccAcc:
[0005eeda] 4fef fff2                 lea.l      -14(a7),a7
[0005eede] 2f48 000a                 move.l     a0,10(a7)
[0005eee2] 206f 000a                 movea.l    10(a7),a0
[0005eee6] 2f50 0006                 move.l     (a0),6(a7)
[0005eeea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005eef0] 3028 0238                 move.w     568(a0),d0
[0005eef4] 660a                      bne.s      $0005EF00
[0005eef6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005eefc] 3010                      move.w     (a0),d0
[0005eefe] 6766                      beq.s      $0005EF66
[0005ef00] 206f 0006                 movea.l    6(a7),a0
[0005ef04] 2f68 0008 0002            move.l     8(a0),2(a7)
[0005ef0a] 202f 0002                 move.l     2(a7),d0
[0005ef0e] 6752                      beq.s      $0005EF62
[0005ef10] 4241                      clr.w      d1
[0005ef12] 70ff                      moveq.l    #-1,d0
[0005ef14] 206f 0002                 movea.l    2(a7),a0
[0005ef18] 4eb9 0004 ca32            jsr        Ax_memCheck
[0005ef1e] 4a40                      tst.w      d0
[0005ef20] 6740                      beq.s      $0005EF62
[0005ef22] 226f 0002                 movea.l    2(a7),a1
[0005ef26] 206f 0006                 movea.l    6(a7),a0
[0005ef2a] 5c48                      addq.w     #6,a0
[0005ef2c] 7202                      moveq.l    #2,d1
[0005ef2e] 2f09                      move.l     a1,-(a7)
[0005ef30] 2f08                      move.l     a0,-(a7)
[0005ef32] 3f01                      move.w     d1,-(a7)
[0005ef34] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ef3a] 3228 0238                 move.w     568(a0),d1
[0005ef3e] 6704                      beq.s      $0005EF44
[0005ef40] 7201                      moveq.l    #1,d1
[0005ef42] 6002                      bra.s      $0005EF46
[0005ef44] 7207                      moveq.l    #7,d1
[0005ef46] 48c1                      ext.l      d1
[0005ef48] d281                      add.l      d1,d1
[0005ef4a] 206f 0010                 movea.l    16(a7),a0
[0005ef4e] 3030 1800                 move.w     0(a0,d1.l),d0
[0005ef52] 321f                      move.w     (a7)+,d1
[0005ef54] 205f                      movea.l    (a7)+,a0
[0005ef56] 225f                      movea.l    (a7)+,a1
[0005ef58] 4eb9 0005 daec            jsr        Aev_DDAdd
[0005ef5e] 3e80                      move.w     d0,(a7)
[0005ef60] 6004                      bra.s      $0005EF66
[0005ef62] 3ebc ffff                 move.w     #$FFFF,(a7)
[0005ef66] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ef6c] 3028 0238                 move.w     568(a0),d0
[0005ef70] 661c                      bne.s      $0005EF8E
[0005ef72] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ef78] 3010                      move.w     (a0),d0
[0005ef7a] 6712                      beq.s      $0005EF8E
[0005ef7c] 72ff                      moveq.l    #-1,d1
[0005ef7e] 91c8                      suba.l     a0,a0
[0005ef80] 226f 0006                 movea.l    6(a7),a1
[0005ef84] 3029 000e                 move.w     14(a1),d0
[0005ef88] 4eb9 0005 f56e            jsr        Aev_AccID
[0005ef8e] 3017                      move.w     (a7),d0
[0005ef90] 4fef 000e                 lea.l      14(a7),a7
[0005ef94] 4e75                      rts
Aev_GetAccKey:
[0005ef96] 4fef fff2                 lea.l      -14(a7),a7
[0005ef9a] 2f48 000a                 move.l     a0,10(a7)
[0005ef9e] 206f 000a                 movea.l    10(a7),a0
[0005efa2] 2f68 000c 0006            move.l     12(a0),6(a7)
[0005efa8] 206f 000a                 movea.l    10(a7),a0
[0005efac] 2f50 0002                 move.l     (a0),2(a7)
[0005efb0] 206f 0002                 movea.l    2(a7),a0
[0005efb4] 3028 0002                 move.w     2(a0),d0
[0005efb8] 6100 fd5a                 bsr        Aev_CheckXAccPart
[0005efbc] 2008                      move.l     a0,d0
[0005efbe] 6604                      bne.s      $0005EFC4
[0005efc0] 7001                      moveq.l    #1,d0
[0005efc2] 6064                      bra.s      $0005F028
[0005efc4] 206f 0002                 movea.l    2(a7),a0
[0005efc8] 3228 0008                 move.w     8(a0),d1
[0005efcc] 206f 0002                 movea.l    2(a7),a0
[0005efd0] 3028 0006                 move.w     6(a0),d0
[0005efd4] 4eb9 0004 4284            jsr        nkc_gemks2n
[0005efda] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005efe0] 3140 02ce                 move.w     d0,718(a0)
[0005efe4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005efea] 3228 02ce                 move.w     718(a0),d1
[0005efee] c27c bfff                 and.w      #$BFFF,d1
[0005eff2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005eff8] 3028 0266                 move.w     614(a0),d0
[0005effc] 206f 0006                 movea.l    6(a7),a0
[0005f000] 226f 0006                 movea.l    6(a7),a1
[0005f004] 2269 0062                 movea.l    98(a1),a1
[0005f008] 4e91                      jsr        (a1)
[0005f00a] 3e80                      move.w     d0,(a7)
[0005f00c] 0c57 ffff                 cmpi.w     #$FFFF,(a7)
[0005f010] 6d04                      blt.s      $0005F016
[0005f012] 7201                      moveq.l    #1,d1
[0005f014] 6002                      bra.s      $0005F018
[0005f016] 4241                      clr.w      d1
[0005f018] 206f 0002                 movea.l    2(a7),a0
[0005f01c] 3028 0002                 move.w     2(a0),d0
[0005f020] 4eb9 0005 f77c            jsr        Aev_AccAck
[0005f026] 7001                      moveq.l    #1,d0
[0005f028] 4fef 000e                 lea.l      14(a7),a7
[0005f02c] 4e75                      rts
Aev_GetAccText:
[0005f02e] 4fef fff4                 lea.l      -12(a7),a7
[0005f032] 2f48 0008                 move.l     a0,8(a7)
[0005f036] 206f 0008                 movea.l    8(a7),a0
[0005f03a] 2f50 0004                 move.l     (a0),4(a7)
[0005f03e] 206f 0004                 movea.l    4(a7),a0
[0005f042] 3028 0002                 move.w     2(a0),d0
[0005f046] 6100 fccc                 bsr        Aev_CheckXAccPart
[0005f04a] 2008                      move.l     a0,d0
[0005f04c] 6606                      bne.s      $0005F054
[0005f04e] 7001                      moveq.l    #1,d0
[0005f050] 6000 009e                 bra        $0005F0F0
[0005f054] 206f 0004                 movea.l    4(a7),a0
[0005f058] 2ea8 0008                 move.l     8(a0),(a7)
[0005f05c] 4241                      clr.w      d1
[0005f05e] 70ff                      moveq.l    #-1,d0
[0005f060] 2057                      movea.l    (a7),a0
[0005f062] 4eb9 0004 ca32            jsr        Ax_memCheck
[0005f068] 4a40                      tst.w      d0
[0005f06a] 6750                      beq.s      $0005F0BC
[0005f06c] 206f 0008                 movea.l    8(a7),a0
[0005f070] 2f28 0014                 move.l     20(a0),-(a7)
[0005f074] 206f 000c                 movea.l    12(a7),a0
[0005f078] 2f28 0010                 move.l     16(a0),-(a7)
[0005f07c] 206f 0010                 movea.l    16(a7),a0
[0005f080] 2f28 000c                 move.l     12(a0),-(a7)
[0005f084] 206f 0014                 movea.l    20(a7),a0
[0005f088] 3228 001a                 move.w     26(a0),d1
[0005f08c] 206f 0014                 movea.l    20(a7),a0
[0005f090] 3028 0018                 move.w     24(a0),d0
[0005f094] 43f9 000e 1848            lea.l      $000E1848,a1
[0005f09a] 206f 000c                 movea.l    12(a7),a0
[0005f09e] 4eb9 0005 e2d0            jsr        GetTxtIntoObj
[0005f0a4] 4fef 000c                 lea.l      12(a7),a7
[0005f0a8] 3200                      move.w     d0,d1
[0005f0aa] 206f 0004                 movea.l    4(a7),a0
[0005f0ae] 3028 0002                 move.w     2(a0),d0
[0005f0b2] 4eb9 0005 f77c            jsr        Aev_AccAck
[0005f0b8] 6036                      bra.s      $0005F0F0
[0005f0ba] 6034                      bra.s      $0005F0F0
[0005f0bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f0c2] 2068 023c                 movea.l    572(a0),a0
[0005f0c6] 3028 000e                 move.w     14(a0),d0
[0005f0ca] c07c 0400                 and.w      #$0400,d0
[0005f0ce] 670e                      beq.s      $0005F0DE
[0005f0d0] 41f9 000e 1850            lea.l      $000E1850,a0
[0005f0d6] 7001                      moveq.l    #1,d0
[0005f0d8] 4eb9 0005 a600            jsr        Awi_alert
[0005f0de] 4241                      clr.w      d1
[0005f0e0] 206f 0004                 movea.l    4(a7),a0
[0005f0e4] 3028 0002                 move.w     2(a0),d0
[0005f0e8] 4eb9 0005 f77c            jsr        Aev_AccAck
[0005f0ee] 4e71                      nop
[0005f0f0] 4fef 000c                 lea.l      12(a7),a7
[0005f0f4] 4e75                      rts
Aev_GetAccImg:
[0005f0f6] 2f0a                      move.l     a2,-(a7)
[0005f0f8] 4fef ffec                 lea.l      -20(a7),a7
[0005f0fc] 2f48 0010                 move.l     a0,16(a7)
[0005f100] 206f 0010                 movea.l    16(a7),a0
[0005f104] 2f50 000c                 move.l     (a0),12(a7)
[0005f108] 3f7c 0001 000a            move.w     #$0001,10(a7)
[0005f10e] 206f 000c                 movea.l    12(a7),a0
[0005f112] 0c68 0001 0006            cmpi.w     #$0001,6(a0)
[0005f118] 6604                      bne.s      $0005F11E
[0005f11a] 7001                      moveq.l    #1,d0
[0005f11c] 6002                      bra.s      $0005F120
[0005f11e] 4240                      clr.w      d0
[0005f120] 3f40 0008                 move.w     d0,8(a7)
[0005f124] 206f 000c                 movea.l    12(a7),a0
[0005f128] 3028 0002                 move.w     2(a0),d0
[0005f12c] 6100 fbe6                 bsr        Aev_CheckXAccPart
[0005f130] 2008                      move.l     a0,d0
[0005f132] 6606                      bne.s      $0005F13A
[0005f134] 7001                      moveq.l    #1,d0
[0005f136] 6000 020a                 bra        $0005F342
[0005f13a] 2039 000e 1802            move.l     GetXAccData,d0
[0005f140] 670c                      beq.s      $0005F14E
[0005f142] 0cb9 0049 4d47 000e 1802  cmpi.l     #$00494D47,GetXAccData
[0005f14c] 6618                      bne.s      $0005F166
[0005f14e] 3039 000e 1806            move.w     GetXAccID,d0
[0005f154] 6b26                      bmi.s      $0005F17C
[0005f156] 206f 000c                 movea.l    12(a7),a0
[0005f15a] 3039 000e 1806            move.w     GetXAccID,d0
[0005f160] b068 0002                 cmp.w      2(a0),d0
[0005f164] 6716                      beq.s      $0005F17C
[0005f166] 4241                      clr.w      d1
[0005f168] 206f 000c                 movea.l    12(a7),a0
[0005f16c] 3028 0002                 move.w     2(a0),d0
[0005f170] 4eb9 0005 f77c            jsr        Aev_AccAck
[0005f176] 7001                      moveq.l    #1,d0
[0005f178] 6000 01c8                 bra        $0005F342
[0005f17c] 206f 000c                 movea.l    12(a7),a0
[0005f180] 2ea8 0008                 move.l     8(a0),(a7)
[0005f184] 206f 000c                 movea.l    12(a7),a0
[0005f188] 2f68 000c 0004            move.l     12(a0),4(a7)
[0005f18e] 4241                      clr.w      d1
[0005f190] 202f 0004                 move.l     4(a7),d0
[0005f194] 2057                      movea.l    (a7),a0
[0005f196] 4eb9 0004 ca32            jsr        Ax_memCheck
[0005f19c] 3f40 000a                 move.w     d0,10(a7)
[0005f1a0] 302f 0008                 move.w     8(a7),d0
[0005f1a4] 6700 00da                 beq        $0005F280
[0005f1a8] 302f 000a                 move.w     10(a7),d0
[0005f1ac] 6700 00d2                 beq        $0005F280
[0005f1b0] 0cb9 0049 4d47 000e 1802  cmpi.l     #$00494D47,GetXAccData
[0005f1ba] 6648                      bne.s      $0005F204
[0005f1bc] 206f 000c                 movea.l    12(a7),a0
[0005f1c0] 3039 000e 1806            move.w     GetXAccID,d0
[0005f1c6] b068 0002                 cmp.w      2(a0),d0
[0005f1ca] 6638                      bne.s      $0005F204
[0005f1cc] 7201                      moveq.l    #1,d1
[0005f1ce] 202f 0004                 move.l     4(a7),d0
[0005f1d2] 2257                      movea.l    (a7),a1
[0005f1d4] 41f9 000e 18b4            lea.l      $000E18B4,a0
[0005f1da] 4eb9 0006 cc22            jsr        Ascrp_put
[0005f1e0] 3f40 000a                 move.w     d0,10(a7)
[0005f1e4] 302f 000a                 move.w     10(a7),d0
[0005f1e8] 671a                      beq.s      $0005F204
[0005f1ea] 486f 0004                 pea.l      4(a7)
[0005f1ee] 43ef 0004                 lea.l      4(a7),a1
[0005f1f2] 41f9 000e 18b8            lea.l      $000E18B8,a0
[0005f1f8] 4eb9 0006 ca2c            jsr        Ascrp_get
[0005f1fe] 584f                      addq.w     #4,a7
[0005f200] 3f40 000a                 move.w     d0,10(a7)
[0005f204] 302f 000a                 move.w     10(a7),d0
[0005f208] 6774                      beq.s      $0005F27E
[0005f20a] 206f 0010                 movea.l    16(a7),a0
[0005f20e] 2028 0010                 move.l     16(a0),d0
[0005f212] 6748                      beq.s      $0005F25C
[0005f214] 206f 0010                 movea.l    16(a7),a0
[0005f218] 2068 0010                 movea.l    16(a0),a0
[0005f21c] 2028 0004                 move.l     4(a0),d0
[0005f220] 673a                      beq.s      $0005F25C
[0005f222] 206f 0010                 movea.l    16(a7),a0
[0005f226] 2f28 0014                 move.l     20(a0),-(a7)
[0005f22a] 206f 0014                 movea.l    20(a7),a0
[0005f22e] 2f28 0010                 move.l     16(a0),-(a7)
[0005f232] 206f 0018                 movea.l    24(a7),a0
[0005f236] 3028 0018                 move.w     24(a0),d0
[0005f23a] 206f 0018                 movea.l    24(a7),a0
[0005f23e] 2268 000c                 movea.l    12(a0),a1
[0005f242] 206f 0008                 movea.l    8(a7),a0
[0005f246] 4eb9 0005 e25c            jsr        GetImgIntoObj
[0005f24c] 504f                      addq.w     #8,a7
[0005f24e] 3f40 000a                 move.w     d0,10(a7)
[0005f252] 2057                      movea.l    (a7),a0
[0005f254] 4eb9 0004 c7c8            jsr        Ax_free
[0005f25a] 6022                      bra.s      $0005F27E
[0005f25c] 43f9 000e 18bc            lea.l      $000E18BC,a1
[0005f262] 701d                      moveq.l    #29,d0
[0005f264] 206f 0010                 movea.l    16(a7),a0
[0005f268] 2068 000c                 movea.l    12(a0),a0
[0005f26c] 246f 0010                 movea.l    16(a7),a2
[0005f270] 246a 000c                 movea.l    12(a2),a2
[0005f274] 246a 0004                 movea.l    4(a2),a2
[0005f278] 4e92                      jsr        (a2)
[0005f27a] 3f40 000a                 move.w     d0,10(a7)
[0005f27e] 606a                      bra.s      $0005F2EA
[0005f280] 302f 000a                 move.w     10(a7),d0
[0005f284] 6742                      beq.s      $0005F2C8
[0005f286] 0cb9 0049 4d47 000e 1802  cmpi.l     #$00494D47,GetXAccData
[0005f290] 6610                      bne.s      $0005F2A2
[0005f292] 206f 000c                 movea.l    12(a7),a0
[0005f296] 3039 000e 1806            move.w     GetXAccID,d0
[0005f29c] b068 0002                 cmp.w      2(a0),d0
[0005f2a0] 670c                      beq.s      $0005F2AE
[0005f2a2] 41f9 000e 18c0            lea.l      $000E18C0,a0
[0005f2a8] 4eb9 0006 c904            jsr        Ascrp_clear
[0005f2ae] 7201                      moveq.l    #1,d1
[0005f2b0] 202f 0004                 move.l     4(a7),d0
[0005f2b4] 2257                      movea.l    (a7),a1
[0005f2b6] 41f9 000e 18c4            lea.l      $000E18C4,a0
[0005f2bc] 4eb9 0006 cc22            jsr        Ascrp_put
[0005f2c2] 3f40 000a                 move.w     d0,10(a7)
[0005f2c6] 6022                      bra.s      $0005F2EA
[0005f2c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f2ce] 2068 023c                 movea.l    572(a0),a0
[0005f2d2] 3028 000e                 move.w     14(a0),d0
[0005f2d6] c07c 0400                 and.w      #$0400,d0
[0005f2da] 670e                      beq.s      $0005F2EA
[0005f2dc] 41f9 000e 18c8            lea.l      $000E18C8,a0
[0005f2e2] 7001                      moveq.l    #1,d0
[0005f2e4] 4eb9 0005 a600            jsr        Awi_alert
[0005f2ea] 322f 000a                 move.w     10(a7),d1
[0005f2ee] 206f 000c                 movea.l    12(a7),a0
[0005f2f2] 3028 0002                 move.w     2(a0),d0
[0005f2f6] 4eb9 0005 f77c            jsr        Aev_AccAck
[0005f2fc] 302f 0008                 move.w     8(a7),d0
[0005f300] 6606                      bne.s      $0005F308
[0005f302] 302f 000a                 move.w     10(a7),d0
[0005f306] 6622                      bne.s      $0005F32A
[0005f308] 302f 0008                 move.w     8(a7),d0
[0005f30c] 660c                      bne.s      $0005F31A
[0005f30e] 41f9 000e 192c            lea.l      $000E192C,a0
[0005f314] 4eb9 0006 c904            jsr        Ascrp_clear
[0005f31a] 42b9 000e 1802            clr.l      GetXAccData
[0005f320] 33fc ffff 000e 1806       move.w     #$FFFF,GetXAccID
[0005f328] 6016                      bra.s      $0005F340
[0005f32a] 23fc 0049 4d47 000e 1802  move.l     #$00494D47,GetXAccData
[0005f334] 206f 000c                 movea.l    12(a7),a0
[0005f338] 33e8 0002 000e 1806       move.w     2(a0),GetXAccID
[0005f340] 7001                      moveq.l    #1,d0
[0005f342] 4fef 0014                 lea.l      20(a7),a7
[0005f346] 245f                      movea.l    (a7)+,a2
[0005f348] 4e75                      rts
Aev_GetAccMeta:
[0005f34a] 2f0a                      move.l     a2,-(a7)
[0005f34c] 4fef ffec                 lea.l      -20(a7),a7
[0005f350] 2f48 0010                 move.l     a0,16(a7)
[0005f354] 206f 0010                 movea.l    16(a7),a0
[0005f358] 2f50 000c                 move.l     (a0),12(a7)
[0005f35c] 3f7c 0001 000a            move.w     #$0001,10(a7)
[0005f362] 206f 000c                 movea.l    12(a7),a0
[0005f366] 0c68 0001 0006            cmpi.w     #$0001,6(a0)
[0005f36c] 6604                      bne.s      $0005F372
[0005f36e] 7001                      moveq.l    #1,d0
[0005f370] 6002                      bra.s      $0005F374
[0005f372] 4240                      clr.w      d0
[0005f374] 3f40 0008                 move.w     d0,8(a7)
[0005f378] 206f 000c                 movea.l    12(a7),a0
[0005f37c] 3028 0002                 move.w     2(a0),d0
[0005f380] 6100 f992                 bsr        Aev_CheckXAccPart
[0005f384] 2008                      move.l     a0,d0
[0005f386] 6606                      bne.s      $0005F38E
[0005f388] 7001                      moveq.l    #1,d0
[0005f38a] 6000 01da                 bra        $0005F566
[0005f38e] 2039 000e 1802            move.l     GetXAccData,d0
[0005f394] 670c                      beq.s      $0005F3A2
[0005f396] 0cb9 0047 454d 000e 1802  cmpi.l     #$0047454D,GetXAccData
[0005f3a0] 6618                      bne.s      $0005F3BA
[0005f3a2] 3039 000e 1806            move.w     GetXAccID,d0
[0005f3a8] 6b26                      bmi.s      $0005F3D0
[0005f3aa] 206f 000c                 movea.l    12(a7),a0
[0005f3ae] 3039 000e 1806            move.w     GetXAccID,d0
[0005f3b4] b068 0002                 cmp.w      2(a0),d0
[0005f3b8] 6716                      beq.s      $0005F3D0
[0005f3ba] 4241                      clr.w      d1
[0005f3bc] 206f 000c                 movea.l    12(a7),a0
[0005f3c0] 3028 0002                 move.w     2(a0),d0
[0005f3c4] 4eb9 0005 f77c            jsr        Aev_AccAck
[0005f3ca] 7001                      moveq.l    #1,d0
[0005f3cc] 6000 0198                 bra        $0005F566
[0005f3d0] 206f 000c                 movea.l    12(a7),a0
[0005f3d4] 3028 0008                 move.w     8(a0),d0
[0005f3d8] 48c0                      ext.l      d0
[0005f3da] 7210                      moveq.l    #16,d1
[0005f3dc] e3a8                      lsl.l      d1,d0
[0005f3de] 206f 000c                 movea.l    12(a7),a0
[0005f3e2] 3228 000a                 move.w     10(a0),d1
[0005f3e6] 48c1                      ext.l      d1
[0005f3e8] 8081                      or.l       d1,d0
[0005f3ea] 2e80                      move.l     d0,(a7)
[0005f3ec] 206f 000c                 movea.l    12(a7),a0
[0005f3f0] 3028 000c                 move.w     12(a0),d0
[0005f3f4] 48c0                      ext.l      d0
[0005f3f6] 7210                      moveq.l    #16,d1
[0005f3f8] e3a8                      lsl.l      d1,d0
[0005f3fa] 206f 000c                 movea.l    12(a7),a0
[0005f3fe] 3228 000e                 move.w     14(a0),d1
[0005f402] 48c1                      ext.l      d1
[0005f404] 8081                      or.l       d1,d0
[0005f406] 2f40 0004                 move.l     d0,4(a7)
[0005f40a] 4241                      clr.w      d1
[0005f40c] 202f 0004                 move.l     4(a7),d0
[0005f410] 2057                      movea.l    (a7),a0
[0005f412] 4eb9 0004 ca32            jsr        Ax_memCheck
[0005f418] 3f40 000a                 move.w     d0,10(a7)
[0005f41c] 302f 0008                 move.w     8(a7),d0
[0005f420] 6700 0082                 beq        $0005F4A4
[0005f424] 302f 000a                 move.w     10(a7),d0
[0005f428] 6700 007a                 beq.w      $0005F4A4
[0005f42c] 0cb9 0047 454d 000e 1802  cmpi.l     #$0047454D,GetXAccData
[0005f436] 6648                      bne.s      $0005F480
[0005f438] 206f 000c                 movea.l    12(a7),a0
[0005f43c] 3039 000e 1806            move.w     GetXAccID,d0
[0005f442] b068 0002                 cmp.w      2(a0),d0
[0005f446] 6638                      bne.s      $0005F480
[0005f448] 7201                      moveq.l    #1,d1
[0005f44a] 202f 0004                 move.l     4(a7),d0
[0005f44e] 2257                      movea.l    (a7),a1
[0005f450] 41f9 000e 1930            lea.l      $000E1930,a0
[0005f456] 4eb9 0006 cc22            jsr        Ascrp_put
[0005f45c] 3f40 000a                 move.w     d0,10(a7)
[0005f460] 302f 000a                 move.w     10(a7),d0
[0005f464] 671a                      beq.s      $0005F480
[0005f466] 486f 0004                 pea.l      4(a7)
[0005f46a] 43ef 0004                 lea.l      4(a7),a1
[0005f46e] 41f9 000e 1934            lea.l      $000E1934,a0
[0005f474] 4eb9 0006 ca2c            jsr        Ascrp_get
[0005f47a] 584f                      addq.w     #4,a7
[0005f47c] 3f40 000a                 move.w     d0,10(a7)
[0005f480] 43f9 000e 1938            lea.l      $000E1938,a1
[0005f486] 701d                      moveq.l    #29,d0
[0005f488] 206f 0010                 movea.l    16(a7),a0
[0005f48c] 2068 000c                 movea.l    12(a0),a0
[0005f490] 246f 0010                 movea.l    16(a7),a2
[0005f494] 246a 000c                 movea.l    12(a2),a2
[0005f498] 246a 0004                 movea.l    4(a2),a2
[0005f49c] 4e92                      jsr        (a2)
[0005f49e] 3f40 000a                 move.w     d0,10(a7)
[0005f4a2] 606a                      bra.s      $0005F50E
[0005f4a4] 302f 000a                 move.w     10(a7),d0
[0005f4a8] 6742                      beq.s      $0005F4EC
[0005f4aa] 0cb9 0047 454d 000e 1802  cmpi.l     #$0047454D,GetXAccData
[0005f4b4] 6610                      bne.s      $0005F4C6
[0005f4b6] 206f 000c                 movea.l    12(a7),a0
[0005f4ba] 3039 000e 1806            move.w     GetXAccID,d0
[0005f4c0] b068 0002                 cmp.w      2(a0),d0
[0005f4c4] 670c                      beq.s      $0005F4D2
[0005f4c6] 41f9 000e 193c            lea.l      $000E193C,a0
[0005f4cc] 4eb9 0006 c904            jsr        Ascrp_clear
[0005f4d2] 7201                      moveq.l    #1,d1
[0005f4d4] 202f 0004                 move.l     4(a7),d0
[0005f4d8] 2257                      movea.l    (a7),a1
[0005f4da] 41f9 000e 1940            lea.l      $000E1940,a0
[0005f4e0] 4eb9 0006 cc22            jsr        Ascrp_put
[0005f4e6] 3f40 000a                 move.w     d0,10(a7)
[0005f4ea] 6022                      bra.s      $0005F50E
[0005f4ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f4f2] 2068 023c                 movea.l    572(a0),a0
[0005f4f6] 3028 000e                 move.w     14(a0),d0
[0005f4fa] c07c 0400                 and.w      #$0400,d0
[0005f4fe] 670e                      beq.s      $0005F50E
[0005f500] 41f9 000e 1944            lea.l      $000E1944,a0
[0005f506] 7001                      moveq.l    #1,d0
[0005f508] 4eb9 0005 a600            jsr        Awi_alert
[0005f50e] 322f 000a                 move.w     10(a7),d1
[0005f512] 206f 000c                 movea.l    12(a7),a0
[0005f516] 3028 0002                 move.w     2(a0),d0
[0005f51a] 4eb9 0005 f77c            jsr        Aev_AccAck
[0005f520] 302f 0008                 move.w     8(a7),d0
[0005f524] 6606                      bne.s      $0005F52C
[0005f526] 302f 000a                 move.w     10(a7),d0
[0005f52a] 6622                      bne.s      $0005F54E
[0005f52c] 302f 0008                 move.w     8(a7),d0
[0005f530] 660c                      bne.s      $0005F53E
[0005f532] 41f9 000e 19a8            lea.l      $000E19A8,a0
[0005f538] 4eb9 0006 c904            jsr        Ascrp_clear
[0005f53e] 42b9 000e 1802            clr.l      GetXAccData
[0005f544] 33fc ffff 000e 1806       move.w     #$FFFF,GetXAccID
[0005f54c] 6016                      bra.s      $0005F564
[0005f54e] 23fc 0047 454d 000e 1802  move.l     #$0047454D,GetXAccData
[0005f558] 206f 000c                 movea.l    12(a7),a0
[0005f55c] 33e8 0002 000e 1806       move.w     2(a0),GetXAccID
[0005f564] 7001                      moveq.l    #1,d0
[0005f566] 4fef 0014                 lea.l      20(a7),a7
[0005f56a] 245f                      movea.l    (a7)+,a2
[0005f56c] 4e75                      rts
Aev_AccID:
[0005f56e] 4fef ffe8                 lea.l      -24(a7),a7
[0005f572] 3f40 0016                 move.w     d0,22(a7)
[0005f576] 2f48 0012                 move.l     a0,18(a7)
[0005f57a] 3f41 0010                 move.w     d1,16(a7)
[0005f57e] 41f9 000e 1808            lea.l      $000E1808,a0
[0005f584] 43d7                      lea.l      (a7),a1
[0005f586] 700f                      moveq.l    #15,d0
[0005f588] 12d8                      move.b     (a0)+,(a1)+
[0005f58a] 51c8 fffc                 dbf        d0,$0005F588
[0005f58e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f594] 302f 0016                 move.w     22(a7),d0
[0005f598] b050                      cmp.w      (a0),d0
[0005f59a] 6766                      beq.s      $0005F602
[0005f59c] 3ebc 0400                 move.w     #$0400,(a7)
[0005f5a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f5a6] 3f50 0002                 move.w     (a0),2(a7)
[0005f5aa] 3f7c 0003 0006            move.w     #$0003,6(a7)
[0005f5b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f5b6] 3f68 03da 000c            move.w     986(a0),12(a7)
[0005f5bc] 3f7c ffff 000e            move.w     #$FFFF,14(a7)
[0005f5c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f5c8] 2f68 04e6 0008            move.l     1254(a0),8(a7)
[0005f5ce] 302f 0016                 move.w     22(a7),d0
[0005f5d2] 6b1a                      bmi.s      $0005F5EE
[0005f5d4] 342f 0010                 move.w     16(a7),d2
[0005f5d8] 226f 0012                 movea.l    18(a7),a1
[0005f5dc] 41d7                      lea.l      (a7),a0
[0005f5de] 7202                      moveq.l    #2,d1
[0005f5e0] 302f 0016                 move.w     22(a7),d0
[0005f5e4] 4eb9 0005 d902            jsr        Aev_SendMsg
[0005f5ea] 6018                      bra.s      $0005F604
[0005f5ec] 6014                      bra.s      $0005F602
[0005f5ee] 322f 0010                 move.w     16(a7),d1
[0005f5f2] 226f 0012                 movea.l    18(a7),a1
[0005f5f6] 7002                      moveq.l    #2,d0
[0005f5f8] 41d7                      lea.l      (a7),a0
[0005f5fa] 4eb9 0005 da46            jsr        Aev_SendAllMsg
[0005f600] 6002                      bra.s      $0005F604
[0005f602] 4240                      clr.w      d0
[0005f604] 4fef 0018                 lea.l      24(a7),a7
[0005f608] 4e75                      rts
Aev_AccAcc:
[0005f60a] 4fef ffe4                 lea.l      -28(a7),a7
[0005f60e] 3f40 001a                 move.w     d0,26(a7)
[0005f612] 2f48 0016                 move.l     a0,22(a7)
[0005f616] 2f49 0012                 move.l     a1,18(a7)
[0005f61a] 3f41 0010                 move.w     d1,16(a7)
[0005f61e] 41f9 000e 1818            lea.l      $000E1818,a0
[0005f624] 43d7                      lea.l      (a7),a1
[0005f626] 700f                      moveq.l    #15,d0
[0005f628] 12d8                      move.b     (a0)+,(a1)+
[0005f62a] 51c8 fffc                 dbf        d0,$0005F628
[0005f62e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f634] 302f 001a                 move.w     26(a7),d0
[0005f638] b050                      cmp.w      (a0),d0
[0005f63a] 6700 00ac                 beq        $0005F6E8
[0005f63e] 3ebc 0403                 move.w     #$0403,(a7)
[0005f642] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f648] 3f50 0002                 move.w     (a0),2(a7)
[0005f64c] 426f 0004                 clr.w      4(a7)
[0005f650] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f656] 3028 0238                 move.w     568(a0),d0
[0005f65a] 6726                      beq.s      $0005F682
[0005f65c] 3f7c 0003 0006            move.w     #$0003,6(a7)
[0005f662] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f668] 3f68 03da 000c            move.w     986(a0),12(a7)
[0005f66e] 3f7c ffff 000e            move.w     #$FFFF,14(a7)
[0005f674] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f67a] 2f68 04e6 0008            move.l     1254(a0),8(a7)
[0005f680] 6032                      bra.s      $0005F6B4
[0005f682] 206f 0016                 movea.l    22(a7),a0
[0005f686] 3f68 0006 0006            move.w     6(a0),6(a7)
[0005f68c] 206f 0016                 movea.l    22(a7),a0
[0005f690] 3f68 0008 0008            move.w     8(a0),8(a7)
[0005f696] 206f 0016                 movea.l    22(a7),a0
[0005f69a] 3f68 000a 000a            move.w     10(a0),10(a7)
[0005f6a0] 206f 0016                 movea.l    22(a7),a0
[0005f6a4] 3f68 000c 000c            move.w     12(a0),12(a7)
[0005f6aa] 206f 0016                 movea.l    22(a7),a0
[0005f6ae] 3f68 0002 000e            move.w     2(a0),14(a7)
[0005f6b4] 302f 001a                 move.w     26(a7),d0
[0005f6b8] 6b1a                      bmi.s      $0005F6D4
[0005f6ba] 342f 0010                 move.w     16(a7),d2
[0005f6be] 226f 0012                 movea.l    18(a7),a1
[0005f6c2] 41d7                      lea.l      (a7),a0
[0005f6c4] 7202                      moveq.l    #2,d1
[0005f6c6] 302f 001a                 move.w     26(a7),d0
[0005f6ca] 4eb9 0005 d902            jsr        Aev_SendMsg
[0005f6d0] 6018                      bra.s      $0005F6EA
[0005f6d2] 6014                      bra.s      $0005F6E8
[0005f6d4] 322f 0010                 move.w     16(a7),d1
[0005f6d8] 226f 0012                 movea.l    18(a7),a1
[0005f6dc] 7002                      moveq.l    #2,d0
[0005f6de] 41d7                      lea.l      (a7),a0
[0005f6e0] 4eb9 0005 da46            jsr        Aev_SendAllMsg
[0005f6e6] 6002                      bra.s      $0005F6EA
[0005f6e8] 4240                      clr.w      d0
[0005f6ea] 4fef 001c                 lea.l      28(a7),a7
[0005f6ee] 4e75                      rts
Aev_AccExit:
[0005f6f0] 4fef ffe8                 lea.l      -24(a7),a7
[0005f6f4] 3f40 0016                 move.w     d0,22(a7)
[0005f6f8] 2f48 0012                 move.l     a0,18(a7)
[0005f6fc] 3f41 0010                 move.w     d1,16(a7)
[0005f700] 41f9 000e 1828            lea.l      $000E1828,a0
[0005f706] 43d7                      lea.l      (a7),a1
[0005f708] 700f                      moveq.l    #15,d0
[0005f70a] 12d8                      move.b     (a0)+,(a1)+
[0005f70c] 51c8 fffc                 dbf        d0,$0005F70A
[0005f710] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f716] 302f 0016                 move.w     22(a7),d0
[0005f71a] b050                      cmp.w      (a0),d0
[0005f71c] 6756                      beq.s      $0005F774
[0005f71e] 3ebc 0404                 move.w     #$0404,(a7)
[0005f722] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f728] 3f50 0002                 move.w     (a0),2(a7)
[0005f72c] 426f 0006                 clr.w      6(a7)
[0005f730] 426f 0008                 clr.w      8(a7)
[0005f734] 426f 000a                 clr.w      10(a7)
[0005f738] 426f 000c                 clr.w      12(a7)
[0005f73c] 426f 000e                 clr.w      14(a7)
[0005f740] 302f 0016                 move.w     22(a7),d0
[0005f744] 6b1a                      bmi.s      $0005F760
[0005f746] 342f 0010                 move.w     16(a7),d2
[0005f74a] 226f 0012                 movea.l    18(a7),a1
[0005f74e] 41d7                      lea.l      (a7),a0
[0005f750] 7202                      moveq.l    #2,d1
[0005f752] 302f 0016                 move.w     22(a7),d0
[0005f756] 4eb9 0005 d902            jsr        Aev_SendMsg
[0005f75c] 6018                      bra.s      $0005F776
[0005f75e] 6014                      bra.s      $0005F774
[0005f760] 322f 0010                 move.w     16(a7),d1
[0005f764] 226f 0012                 movea.l    18(a7),a1
[0005f768] 7002                      moveq.l    #2,d0
[0005f76a] 41d7                      lea.l      (a7),a0
[0005f76c] 4eb9 0005 da46            jsr        Aev_SendAllMsg
[0005f772] 6002                      bra.s      $0005F776
[0005f774] 4240                      clr.w      d0
[0005f776] 4fef 0018                 lea.l      24(a7),a7
[0005f77a] 4e75                      rts
Aev_AccAck:
[0005f77c] 4fef ffec                 lea.l      -20(a7),a7
[0005f780] 3f40 0012                 move.w     d0,18(a7)
[0005f784] 3f41 0010                 move.w     d1,16(a7)
[0005f788] 41f9 000e 1838            lea.l      $000E1838,a0
[0005f78e] 43d7                      lea.l      (a7),a1
[0005f790] 700f                      moveq.l    #15,d0
[0005f792] 12d8                      move.b     (a0)+,(a1)+
[0005f794] 51c8 fffc                 dbf        d0,$0005F792
[0005f798] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f79e] 302f 0012                 move.w     18(a7),d0
[0005f7a2] b050                      cmp.w      (a0),d0
[0005f7a4] 6756                      beq.s      $0005F7FC
[0005f7a6] 7210                      moveq.l    #16,d1
[0005f7a8] 4240                      clr.w      d0
[0005f7aa] 41d7                      lea.l      (a7),a0
[0005f7ac] 4eb9 0008 36ea            jsr        memset
[0005f7b2] 3ebc 0500                 move.w     #$0500,(a7)
[0005f7b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f7bc] 3f50 0002                 move.w     (a0),2(a7)
[0005f7c0] 302f 0010                 move.w     16(a7),d0
[0005f7c4] 6704                      beq.s      $0005F7CA
[0005f7c6] 7001                      moveq.l    #1,d0
[0005f7c8] 6002                      bra.s      $0005F7CC
[0005f7ca] 4240                      clr.w      d0
[0005f7cc] 3f40 0006                 move.w     d0,6(a7)
[0005f7d0] 302f 0012                 move.w     18(a7),d0
[0005f7d4] 6b16                      bmi.s      $0005F7EC
[0005f7d6] 74ff                      moveq.l    #-1,d2
[0005f7d8] 93c9                      suba.l     a1,a1
[0005f7da] 41d7                      lea.l      (a7),a0
[0005f7dc] 7202                      moveq.l    #2,d1
[0005f7de] 302f 0012                 move.w     18(a7),d0
[0005f7e2] 4eb9 0005 d902            jsr        Aev_SendMsg
[0005f7e8] 6014                      bra.s      $0005F7FE
[0005f7ea] 6010                      bra.s      $0005F7FC
[0005f7ec] 72ff                      moveq.l    #-1,d1
[0005f7ee] 93c9                      suba.l     a1,a1
[0005f7f0] 7002                      moveq.l    #2,d0
[0005f7f2] 41d7                      lea.l      (a7),a0
[0005f7f4] 4eb9 0005 da46            jsr        Aev_SendAllMsg
[0005f7fa] 6002                      bra.s      $0005F7FE
[0005f7fc] 4240                      clr.w      d0
[0005f7fe] 4fef 0014                 lea.l      20(a7),a7
[0005f802] 4e75                      rts

	.data

GetXAccData:
[000e1802]                           dc.w $0000
[000e1804]                           dc.w $0000
GetXAccID:
[000e1806]                           dc.w $ffff
[000e1808]                           dc.w $0000
[000e180a]                           dc.w $0000
[000e180c]                           dc.w $0000
[000e180e]                           dc.w $0000
[000e1810]                           dc.w $0000
[000e1812]                           dc.w $0000
[000e1814]                           dc.w $0000
[000e1816]                           dc.w $0000
[000e1818]                           dc.w $0000
[000e181a]                           dc.w $0000
[000e181c]                           dc.w $0000
[000e181e]                           dc.w $0000
[000e1820]                           dc.w $0000
[000e1822]                           dc.w $0000
[000e1824]                           dc.w $0000
[000e1826]                           dc.w $0000
[000e1828]                           dc.w $0000
[000e182a]                           dc.w $0000
[000e182c]                           dc.w $0000
[000e182e]                           dc.w $0000
[000e1830]                           dc.w $0000
[000e1832]                           dc.w $0000
[000e1834]                           dc.w $0000
[000e1836]                           dc.w $0000
[000e1838]                           dc.w $0000
[000e183a]                           dc.w $0000
[000e183c]                           dc.w $0000
[000e183e]                           dc.w $0000
[000e1840]                           dc.w $0000
[000e1842]                           dc.w $0000
[000e1844]                           dc.w $0000
[000e1846]                           dc.w $0000
[000e1848]                           dc.b 'XAccTxt',0
[000e1850]                           dc.b '[4][Bei einem XAcc-Transfer|konnte auf den Speicher|nicht zugegriffen|werden (Speicherschutz)!][OK]',0
[000e18b4]                           dc.b 'img',0
[000e18b8]                           dc.b 'img',0
[000e18bc]                           dc.b 'IMG',0
[000e18c0]                           dc.b 'img',0
[000e18c4]                           dc.b 'img',0
[000e18c8]                           dc.b '[4][Bei einem XAcc-Transfer|konnte auf den Speicher|nicht zugegriffen|werden (Speicherschutz)!][OK]',0
[000e192c]                           dc.b 'img',0
[000e1930]                           dc.b 'gem',0
[000e1934]                           dc.b 'gem',0
[000e1938]                           dc.b 'gem',0
[000e193c]                           dc.b 'gem',0
[000e1940]                           dc.b 'gem',0
[000e1944]                           dc.b '[4][Bei einem XAcc-Transfer|konnte auf den Speicher|nicht zugegriffen|werden (Speicherschutz)!][OK]',0
[000e19a8]                           dc.b 'gem',0
