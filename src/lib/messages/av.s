Aev_InitVA:
[0005f804] 4fef fff0                 lea.l      -16(a7),a7
[0005f808] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005f80e] 3028 0238                 move.w     568(a0),d0
[0005f812] 6700 00bc                 beq        $0005F8D0
[0005f816] 41f9 000e 19fc            lea.l      $000E19FC,a0
[0005f81c] 4eb9 0005 be00            jsr        Ash_getenv
[0005f822] 2f48 000a                 move.l     a0,10(a7)
[0005f826] 3f7c ffff 000e            move.w     #$FFFF,14(a7)
[0005f82c] 202f 000a                 move.l     10(a7),d0
[0005f830] 672a                      beq.s      $0005F85C
[0005f832] 7008                      moveq.l    #8,d0
[0005f834] 226f 000a                 movea.l    10(a7),a1
[0005f838] 41d7                      lea.l      (a7),a0
[0005f83a] 4eb9 0008 2fd6            jsr        strncpy
[0005f840] 7008                      moveq.l    #8,d0
[0005f842] 41d7                      lea.l      (a7),a0
[0005f844] 4eb9 0004 6b28            jsr        Ast_adl
[0005f84a] 2279 000e 692a            movea.l    _globl,a1
[0005f850] 41d7                      lea.l      (a7),a0
[0005f852] 4eb9 0007 8b56            jsr        mt_appl_find
[0005f858] 3f40 000e                 move.w     d0,14(a7)
[0005f85c] 302f 000e                 move.w     14(a7),d0
[0005f860] 6a60                      bpl.s      $0005F8C2
[0005f862] 2279 000e 692a            movea.l    _globl,a1
[0005f868] 41f9 000e 1a05            lea.l      $000E1A05,a0
[0005f86e] 4eb9 0007 8b56            jsr        mt_appl_find
[0005f874] 3f40 000e                 move.w     d0,14(a7)
[0005f878] 6a48                      bpl.s      $0005F8C2
[0005f87a] 2279 000e 692a            movea.l    _globl,a1
[0005f880] 41f9 000e 1a0e            lea.l      $000E1A0E,a0
[0005f886] 4eb9 0007 8b56            jsr        mt_appl_find
[0005f88c] 3f40 000e                 move.w     d0,14(a7)
[0005f890] 6a30                      bpl.s      $0005F8C2
[0005f892] 2279 000e 692a            movea.l    _globl,a1
[0005f898] 41f9 000e 1a17            lea.l      $000E1A17,a0
[0005f89e] 4eb9 0007 8b56            jsr        mt_appl_find
[0005f8a4] 3f40 000e                 move.w     d0,14(a7)
[0005f8a8] 6a18                      bpl.s      $0005F8C2
[0005f8aa] 2279 000e 692a            movea.l    _globl,a1
[0005f8b0] 41f9 000e 1a20            lea.l      $000E1A20,a0
[0005f8b6] 4eb9 0007 8b56            jsr        mt_appl_find
[0005f8bc] 3f40 000e                 move.w     d0,14(a7)
[0005f8c0] 6b0e                      bmi.s      $0005F8D0
[0005f8c2] 4241                      clr.w      d1
[0005f8c4] 91c8                      suba.l     a0,a0
[0005f8c6] 302f 000e                 move.w     14(a7),d0
[0005f8ca] 4eb9 0005 fc0e            jsr        Aev_AvProtokoll
[0005f8d0] 7001                      moveq.l    #1,d0
[0005f8d2] 4fef 0010                 lea.l      16(a7),a7
[0005f8d6] 4e75                      rts
Aev_ExitVA:
[0005f8d8] 7001                      moveq.l    #1,d0
[0005f8da] 4e75                      rts
VaDataDelete:
[0005f8dc] 4e75                      rts
Aev_GetAvExit:
[0005f8de] 4fef fff4                 lea.l      -12(a7),a7
[0005f8e2] 2f48 0008                 move.l     a0,8(a7)
[0005f8e6] 206f 0008                 movea.l    8(a7),a0
[0005f8ea] 2f50 0004                 move.l     (a0),4(a7)
[0005f8ee] 206f 0004                 movea.l    4(a7),a0
[0005f8f2] 3028 0002                 move.w     2(a0),d0
[0005f8f6] 4eb9 0005 dab8            jsr        Aev_DDSearch
[0005f8fc] 2e88                      move.l     a0,(a7)
[0005f8fe] 2017                      move.l     (a7),d0
[0005f900] 6724                      beq.s      $0005F926
[0005f902] 70fb                      moveq.l    #-5,d0
[0005f904] 2057                      movea.l    (a7),a0
[0005f906] c0a8 0002                 and.l      2(a0),d0
[0005f90a] 670c                      beq.s      $0005F918
[0005f90c] 2057                      movea.l    (a7),a0
[0005f90e] 02a8 ffff fffb 0002       andi.l     #$FFFFFFFB,2(a0)
[0005f916] 600e                      bra.s      $0005F926
[0005f918] 206f 0004                 movea.l    4(a7),a0
[0005f91c] 3028 0002                 move.w     2(a0),d0
[0005f920] 4eb9 0005 dbce            jsr        Aev_DDDelete
[0005f926] 7001                      moveq.l    #1,d0
[0005f928] 4fef 000c                 lea.l      12(a7),a7
[0005f92c] 4e75                      rts
Aev_GetVaProtoStatus:
[0005f92e] 2f0a                      move.l     a2,-(a7)
[0005f930] 4fef fff4                 lea.l      -12(a7),a7
[0005f934] 2f48 0008                 move.l     a0,8(a7)
[0005f938] 206f 0008                 movea.l    8(a7),a0
[0005f93c] 2f50 0004                 move.l     (a0),4(a7)
[0005f940] 206f 0004                 movea.l    4(a7),a0
[0005f944] 2ea8 000c                 move.l     12(a0),(a7)
[0005f948] 4241                      clr.w      d1
[0005f94a] 70ff                      moveq.l    #-1,d0
[0005f94c] 2057                      movea.l    (a7),a0
[0005f94e] 4eb9 0004 ca32            jsr        Ax_memCheck
[0005f954] 4a40                      tst.w      d0
[0005f956] 671c                      beq.s      $0005F974
[0005f958] 2257                      movea.l    (a7),a1
[0005f95a] 206f 0004                 movea.l    4(a7),a0
[0005f95e] 5c48                      addq.w     #6,a0
[0005f960] 7204                      moveq.l    #4,d1
[0005f962] 246f 0004                 movea.l    4(a7),a2
[0005f966] 302a 0002                 move.w     2(a2),d0
[0005f96a] 4eb9 0005 daec            jsr        Aev_DDAdd
[0005f970] 6006                      bra.s      $0005F978
[0005f972] 6004                      bra.s      $0005F978
[0005f974] 4240                      clr.w      d0
[0005f976] 4e71                      nop
[0005f978] 4fef 000c                 lea.l      12(a7),a7
[0005f97c] 245f                      movea.l    (a7)+,a2
[0005f97e] 4e75                      rts
Aev_GetVaStart:
[0005f980] 2f0a                      move.l     a2,-(a7)
[0005f982] 4fef fff2                 lea.l      -14(a7),a7
[0005f986] 2f48 000a                 move.l     a0,10(a7)
[0005f98a] 206f 000a                 movea.l    10(a7),a0
[0005f98e] 2f50 0006                 move.l     (a0),6(a7)
[0005f992] 206f 0006                 movea.l    6(a7),a0
[0005f996] 2f68 0006 0002            move.l     6(a0),2(a7)
[0005f99c] 202f 0002                 move.l     2(a7),d0
[0005f9a0] 6736                      beq.s      $0005F9D8
[0005f9a2] 4241                      clr.w      d1
[0005f9a4] 70ff                      moveq.l    #-1,d0
[0005f9a6] 206f 0002                 movea.l    2(a7),a0
[0005f9aa] 4eb9 0004 ca32            jsr        Ax_memCheck
[0005f9b0] 4a40                      tst.w      d0
[0005f9b2] 6724                      beq.s      $0005F9D8
[0005f9b4] 226f 0006                 movea.l    6(a7),a1
[0005f9b8] 2f09                      move.l     a1,-(a7)
[0005f9ba] 4eb9 0005 5e8c            jsr        Awi_root
[0005f9c0] 2f08                      move.l     a0,-(a7)
[0005f9c2] 4eb9 0005 5e8c            jsr        Awi_root
[0005f9c8] 2468 0004                 movea.l    4(a0),a2
[0005f9cc] 205f                      movea.l    (a7)+,a0
[0005f9ce] 701b                      moveq.l    #27,d0
[0005f9d0] 225f                      movea.l    (a7)+,a1
[0005f9d2] 4e92                      jsr        (a2)
[0005f9d4] 3e80                      move.w     d0,(a7)
[0005f9d6] 6002                      bra.s      $0005F9DA
[0005f9d8] 4257                      clr.w      (a7)
[0005f9da] 206f 0002                 movea.l    2(a7),a0
[0005f9de] 3217                      move.w     (a7),d1
[0005f9e0] 226f 0006                 movea.l    6(a7),a1
[0005f9e4] 3029 0002                 move.w     2(a1),d0
[0005f9e8] 4eb9 0005 fdde            jsr        Aev_AvStarted
[0005f9ee] 7001                      moveq.l    #1,d0
[0005f9f0] 4fef 000e                 lea.l      14(a7),a7
[0005f9f4] 245f                      movea.l    (a7)+,a2
[0005f9f6] 4e75                      rts
Aev_GetAvStarted:
[0005f9f8] 2f0a                      move.l     a2,-(a7)
[0005f9fa] 4fef ffca                 lea.l      -54(a7),a7
[0005f9fe] 2f48 0032                 move.l     a0,50(a7)
[0005fa02] 206f 0032                 movea.l    50(a7),a0
[0005fa06] 2f50 002e                 move.l     (a0),46(a7)
[0005fa0a] 3f7c 4711 0004            move.w     #$4711,4(a7)
[0005fa10] 206f 002e                 movea.l    46(a7),a0
[0005fa14] 2ea8 0006                 move.l     6(a0),(a7)
[0005fa18] 206f 002e                 movea.l    46(a7),a0
[0005fa1c] 3f68 0002 000a            move.w     2(a0),10(a7)
[0005fa22] 3f7c 0001 000c            move.w     #$0001,12(a7)
[0005fa28] 41ef 0004                 lea.l      4(a7),a0
[0005fa2c] 2f48 000e                 move.l     a0,14(a7)
[0005fa30] 42af 0012                 clr.l      18(a7)
[0005fa34] 42af 0016                 clr.l      22(a7)
[0005fa38] 206f 002e                 movea.l    46(a7),a0
[0005fa3c] 5c48                      addq.w     #6,a0
[0005fa3e] 2f48 001a                 move.l     a0,26(a7)
[0005fa42] 206f 002e                 movea.l    46(a7),a0
[0005fa46] 5048                      addq.w     #8,a0
[0005fa48] 2f48 001e                 move.l     a0,30(a7)
[0005fa4c] 42af 0022                 clr.l      34(a7)
[0005fa50] 42af 0026                 clr.l      38(a7)
[0005fa54] 42af 002a                 clr.l      42(a7)
[0005fa58] 4879 0005 d87e            pea.l      Aev_CmpMsgInList
[0005fa5e] 43ef 000e                 lea.l      14(a7),a1
[0005fa62] 2079 000d fba6            movea.l    SentMsg,a0
[0005fa68] 2479 000d fba6            movea.l    SentMsg,a2
[0005fa6e] 246a 0020                 movea.l    32(a2),a2
[0005fa72] 4e92                      jsr        (a2)
[0005fa74] 584f                      addq.w     #4,a7
[0005fa76] 2f48 0006                 move.l     a0,6(a7)
[0005fa7a] 202f 0006                 move.l     6(a7),d0
[0005fa7e] 6744                      beq.s      $0005FAC4
[0005fa80] 206f 0006                 movea.l    6(a7),a0
[0005fa84] 2028 0002                 move.l     2(a0),d0
[0005fa88] 671c                      beq.s      $0005FAA6
[0005fa8a] 2257                      movea.l    (a7),a1
[0005fa8c] 303c 0191                 move.w     #$0191,d0
[0005fa90] 206f 0006                 movea.l    6(a7),a0
[0005fa94] 2068 0002                 movea.l    2(a0),a0
[0005fa98] 246f 0006                 movea.l    6(a7),a2
[0005fa9c] 246a 0002                 movea.l    2(a2),a2
[0005faa0] 246a 0004                 movea.l    4(a2),a2
[0005faa4] 4e92                      jsr        (a2)
[0005faa6] 4879 0007 0f86            pea.l      Alu_ptrCmp
[0005faac] 226f 000a                 movea.l    10(a7),a1
[0005fab0] 2079 000d fba6            movea.l    SentMsg,a0
[0005fab6] 2479 000d fba6            movea.l    SentMsg,a2
[0005fabc] 246a 0020                 movea.l    32(a2),a2
[0005fac0] 4e92                      jsr        (a2)
[0005fac2] 584f                      addq.w     #4,a7
[0005fac4] 2057                      movea.l    (a7),a0
[0005fac6] 4eb9 0004 c9da            jsr        Ax_glfree
[0005facc] 7001                      moveq.l    #1,d0
[0005face] 4fef 0036                 lea.l      54(a7),a7
[0005fad2] 245f                      movea.l    (a7)+,a2
[0005fad4] 4e75                      rts
Aev_GetAvSendKey:
[0005fad6] 514f                      subq.w     #8,a7
[0005fad8] 2f48 0004                 move.l     a0,4(a7)
[0005fadc] 206f 0004                 movea.l    4(a7),a0
[0005fae0] 2e90                      move.l     (a0),(a7)
[0005fae2] 2057                      movea.l    (a7),a0
[0005fae4] 3028 0006                 move.w     6(a0),d0
[0005fae8] 662a                      bne.s      $0005FB14
[0005faea] 2057                      movea.l    (a7),a0
[0005faec] 0c68 5048 000a            cmpi.w     #$5048,10(a0)
[0005faf2] 6620                      bne.s      $0005FB14
[0005faf4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fafa] 4268 0266                 clr.w      614(a0)
[0005fafe] 2057                      movea.l    (a7),a0
[0005fb00] 3028 0008                 move.w     8(a0),d0
[0005fb04] c07c 00ff                 and.w      #$00FF,d0
[0005fb08] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fb0e] 3140 02ce                 move.w     d0,718(a0)
[0005fb12] 602a                      bra.s      $0005FB3E
[0005fb14] 2057                      movea.l    (a7),a0
[0005fb16] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005fb1c] 3368 0006 0266            move.w     6(a0),614(a1)
[0005fb22] 2057                      movea.l    (a7),a0
[0005fb24] 3228 0006                 move.w     6(a0),d1
[0005fb28] 2057                      movea.l    (a7),a0
[0005fb2a] 3028 0008                 move.w     8(a0),d0
[0005fb2e] 4eb9 0004 4284            jsr        nkc_gemks2n
[0005fb34] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fb3a] 3140 02ce                 move.w     d0,718(a0)
[0005fb3e] 91c8                      suba.l     a0,a0
[0005fb40] 4eb9 0004 a498            jsr        evkeybrd
[0005fb46] 5240                      addq.w     #1,d0
[0005fb48] 6d04                      blt.s      $0005FB4E
[0005fb4a] 7001                      moveq.l    #1,d0
[0005fb4c] 6002                      bra.s      $0005FB50
[0005fb4e] 4240                      clr.w      d0
[0005fb50] 504f                      addq.w     #8,a7
[0005fb52] 4e75                      rts
Aev_GetAvSendClick:
[0005fb54] 514f                      subq.w     #8,a7
[0005fb56] 2f48 0004                 move.l     a0,4(a7)
[0005fb5a] 206f 0004                 movea.l    4(a7),a0
[0005fb5e] 2e90                      move.l     (a0),(a7)
[0005fb60] 2057                      movea.l    (a7),a0
[0005fb62] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005fb68] 3368 0006 0262            move.w     6(a0),610(a1)
[0005fb6e] 2057                      movea.l    (a7),a0
[0005fb70] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005fb76] 3368 0008 0264            move.w     8(a0),612(a1)
[0005fb7c] 2057                      movea.l    (a7),a0
[0005fb7e] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005fb84] 3368 000a 02ca            move.w     10(a0),714(a1)
[0005fb8a] 2057                      movea.l    (a7),a0
[0005fb8c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005fb92] 3368 000c 0266            move.w     12(a0),614(a1)
[0005fb98] 2057                      movea.l    (a7),a0
[0005fb9a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005fba0] 3368 000e 02cc            move.w     14(a0),716(a1)
[0005fba6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fbac] 3228 02cc                 move.w     716(a0),d1
[0005fbb0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fbb6] 3028 02ca                 move.w     714(a0),d0
[0005fbba] 4eb9 0004 ab64            jsr        evbutton
[0005fbc0] 4a40                      tst.w      d0
[0005fbc2] 6b04                      bmi.s      $0005FBC8
[0005fbc4] 7001                      moveq.l    #1,d0
[0005fbc6] 6002                      bra.s      $0005FBCA
[0005fbc8] 4240                      clr.w      d0
[0005fbca] 504f                      addq.w     #8,a7
[0005fbcc] 4e75                      rts
Aev_GetVaPathUpdate:
[0005fbce] 4fef fff4                 lea.l      -12(a7),a7
[0005fbd2] 2f48 0008                 move.l     a0,8(a7)
[0005fbd6] 206f 0008                 movea.l    8(a7),a0
[0005fbda] 2f50 0004                 move.l     (a0),4(a7)
[0005fbde] 206f 0004                 movea.l    4(a7),a0
[0005fbe2] 2ea8 0006                 move.l     6(a0),(a7)
[0005fbe6] 2017                      move.l     (a7),d0
[0005fbe8] 671c                      beq.s      $0005FC06
[0005fbea] 4241                      clr.w      d1
[0005fbec] 70ff                      moveq.l    #-1,d0
[0005fbee] 2057                      movea.l    (a7),a0
[0005fbf0] 4eb9 0004 ca32            jsr        Ax_memCheck
[0005fbf6] 4a40                      tst.w      d0
[0005fbf8] 670c                      beq.s      $0005FC06
[0005fbfa] 2057                      movea.l    (a7),a0
[0005fbfc] 303c 03ea                 move.w     #$03EA,d0
[0005fc00] 4eb9 0005 6a20            jsr        Awi_sendall
[0005fc06] 7001                      moveq.l    #1,d0
[0005fc08] 4fef 000c                 lea.l      12(a7),a7
[0005fc0c] 4e75                      rts
Aev_AvProtokoll:
[0005fc0e] 4fef ffe8                 lea.l      -24(a7),a7
[0005fc12] 3f40 0016                 move.w     d0,22(a7)
[0005fc16] 2f48 0012                 move.l     a0,18(a7)
[0005fc1a] 3f41 0010                 move.w     d1,16(a7)
[0005fc1e] 41f9 000e 19ac            lea.l      $000E19AC,a0
[0005fc24] 43d7                      lea.l      (a7),a1
[0005fc26] 700f                      moveq.l    #15,d0
[0005fc28] 12d8                      move.b     (a0)+,(a1)+
[0005fc2a] 51c8 fffc                 dbf        d0,$0005FC28
[0005fc2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fc34] 302f 0016                 move.w     22(a7),d0
[0005fc38] b050                      cmp.w      (a0),d0
[0005fc3a] 675c                      beq.s      $0005FC98
[0005fc3c] 3ebc 4700                 move.w     #$4700,(a7)
[0005fc40] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fc46] 3f50 0002                 move.w     (a0),2(a7)
[0005fc4a] 426f 0008                 clr.w      8(a7)
[0005fc4e] 426f 000a                 clr.w      10(a7)
[0005fc52] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fc58] 2f68 03dc 000c            move.l     988(a0),12(a7)
[0005fc5e] 3f7c 0036 0006            move.w     #$0036,6(a7)
[0005fc64] 302f 0016                 move.w     22(a7),d0
[0005fc68] 6b1a                      bmi.s      $0005FC84
[0005fc6a] 342f 0010                 move.w     16(a7),d2
[0005fc6e] 226f 0012                 movea.l    18(a7),a1
[0005fc72] 41d7                      lea.l      (a7),a0
[0005fc74] 7201                      moveq.l    #1,d1
[0005fc76] 302f 0016                 move.w     22(a7),d0
[0005fc7a] 4eb9 0005 d902            jsr        Aev_SendMsg
[0005fc80] 6018                      bra.s      $0005FC9A
[0005fc82] 6014                      bra.s      $0005FC98
[0005fc84] 322f 0010                 move.w     16(a7),d1
[0005fc88] 226f 0012                 movea.l    18(a7),a1
[0005fc8c] 7001                      moveq.l    #1,d0
[0005fc8e] 41d7                      lea.l      (a7),a0
[0005fc90] 4eb9 0005 da46            jsr        Aev_SendAllMsg
[0005fc96] 6002                      bra.s      $0005FC9A
[0005fc98] 4240                      clr.w      d0
[0005fc9a] 4fef 0018                 lea.l      24(a7),a7
[0005fc9e] 4e75                      rts
Aev_AvExit:
[0005fca0] 4fef ffe8                 lea.l      -24(a7),a7
[0005fca4] 3f40 0016                 move.w     d0,22(a7)
[0005fca8] 2f48 0012                 move.l     a0,18(a7)
[0005fcac] 3f41 0010                 move.w     d1,16(a7)
[0005fcb0] 41f9 000e 19bc            lea.l      $000E19BC,a0
[0005fcb6] 43d7                      lea.l      (a7),a1
[0005fcb8] 700f                      moveq.l    #15,d0
[0005fcba] 12d8                      move.b     (a0)+,(a1)+
[0005fcbc] 51c8 fffc                 dbf        d0,$0005FCBA
[0005fcc0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fcc6] 302f 0016                 move.w     22(a7),d0
[0005fcca] b050                      cmp.w      (a0),d0
[0005fccc] 675a                      beq.s      $0005FD28
[0005fcce] 3ebc 4736                 move.w     #$4736,(a7)
[0005fcd2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fcd8] 3f50 0002                 move.w     (a0),2(a7)
[0005fcdc] 426f 0004                 clr.w      4(a7)
[0005fce0] 426f 0006                 clr.w      6(a7)
[0005fce4] 426f 0008                 clr.w      8(a7)
[0005fce8] 426f 000a                 clr.w      10(a7)
[0005fcec] 426f 000c                 clr.w      12(a7)
[0005fcf0] 426f 000e                 clr.w      14(a7)
[0005fcf4] 302f 0016                 move.w     22(a7),d0
[0005fcf8] 6b1a                      bmi.s      $0005FD14
[0005fcfa] 342f 0010                 move.w     16(a7),d2
[0005fcfe] 226f 0012                 movea.l    18(a7),a1
[0005fd02] 41d7                      lea.l      (a7),a0
[0005fd04] 7201                      moveq.l    #1,d1
[0005fd06] 302f 0016                 move.w     22(a7),d0
[0005fd0a] 4eb9 0005 d902            jsr        Aev_SendMsg
[0005fd10] 6018                      bra.s      $0005FD2A
[0005fd12] 6014                      bra.s      $0005FD28
[0005fd14] 322f 0010                 move.w     16(a7),d1
[0005fd18] 226f 0012                 movea.l    18(a7),a1
[0005fd1c] 7001                      moveq.l    #1,d0
[0005fd1e] 41d7                      lea.l      (a7),a0
[0005fd20] 4eb9 0005 da46            jsr        Aev_SendAllMsg
[0005fd26] 6002                      bra.s      $0005FD2A
[0005fd28] 4240                      clr.w      d0
[0005fd2a] 4fef 0018                 lea.l      24(a7),a7
[0005fd2e] 4e75                      rts
Aev_VaStart:
[0005fd30] 4fef ffe0                 lea.l      -32(a7),a7
[0005fd34] 3f40 001e                 move.w     d0,30(a7)
[0005fd38] 2f48 001a                 move.l     a0,26(a7)
[0005fd3c] 2f49 0016                 move.l     a1,22(a7)
[0005fd40] 3f41 0014                 move.w     d1,20(a7)
[0005fd44] 41f9 000e 19dc            lea.l      $000E19DC,a0
[0005fd4a] 43ef 0004                 lea.l      4(a7),a1
[0005fd4e] 700f                      moveq.l    #15,d0
[0005fd50] 12d8                      move.b     (a0)+,(a1)+
[0005fd52] 51c8 fffc                 dbf        d0,$0005FD50
[0005fd56] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fd5c] 302f 001e                 move.w     30(a7),d0
[0005fd60] b050                      cmp.w      (a0),d0
[0005fd62] 6772                      beq.s      $0005FDD6
[0005fd64] 7001                      moveq.l    #1,d0
[0005fd66] 206f 001a                 movea.l    26(a7),a0
[0005fd6a] 4eb9 0004 744e            jsr        Ast_copy
[0005fd70] 2e88                      move.l     a0,(a7)
[0005fd72] 2017                      move.l     (a7),d0
[0005fd74] 6604                      bne.s      $0005FD7A
[0005fd76] 4240                      clr.w      d0
[0005fd78] 605e                      bra.s      $0005FDD8
[0005fd7a] 3f7c 4711 0004            move.w     #$4711,4(a7)
[0005fd80] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fd86] 3f50 0006                 move.w     (a0),6(a7)
[0005fd8a] 426f 0008                 clr.w      8(a7)
[0005fd8e] 426f 000e                 clr.w      14(a7)
[0005fd92] 426f 0010                 clr.w      16(a7)
[0005fd96] 426f 0012                 clr.w      18(a7)
[0005fd9a] 2f57 000a                 move.l     (a7),10(a7)
[0005fd9e] 302f 001e                 move.w     30(a7),d0
[0005fda2] 6b1c                      bmi.s      $0005FDC0
[0005fda4] 342f 0014                 move.w     20(a7),d2
[0005fda8] 226f 0016                 movea.l    22(a7),a1
[0005fdac] 41ef 0004                 lea.l      4(a7),a0
[0005fdb0] 7201                      moveq.l    #1,d1
[0005fdb2] 302f 001e                 move.w     30(a7),d0
[0005fdb6] 4eb9 0005 d902            jsr        Aev_SendMsg
[0005fdbc] 601a                      bra.s      $0005FDD8
[0005fdbe] 6016                      bra.s      $0005FDD6
[0005fdc0] 322f 0014                 move.w     20(a7),d1
[0005fdc4] 226f 0016                 movea.l    22(a7),a1
[0005fdc8] 7001                      moveq.l    #1,d0
[0005fdca] 41ef 0004                 lea.l      4(a7),a0
[0005fdce] 4eb9 0005 da46            jsr        Aev_SendAllMsg
[0005fdd4] 6002                      bra.s      $0005FDD8
[0005fdd6] 4240                      clr.w      d0
[0005fdd8] 4fef 0020                 lea.l      32(a7),a7
[0005fddc] 4e75                      rts
Aev_AvStarted:
[0005fdde] 4fef ffea                 lea.l      -22(a7),a7
[0005fde2] 3f40 0014                 move.w     d0,20(a7)
[0005fde6] 2f48 0010                 move.l     a0,16(a7)
[0005fdea] 41f9 000e 19ec            lea.l      $000E19EC,a0
[0005fdf0] 43d7                      lea.l      (a7),a1
[0005fdf2] 700f                      moveq.l    #15,d0
[0005fdf4] 12d8                      move.b     (a0)+,(a1)+
[0005fdf6] 51c8 fffc                 dbf        d0,$0005FDF4
[0005fdfa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fe00] 302f 0014                 move.w     20(a7),d0
[0005fe04] b050                      cmp.w      (a0),d0
[0005fe06] 674c                      beq.s      $0005FE54
[0005fe08] 7210                      moveq.l    #16,d1
[0005fe0a] 4240                      clr.w      d0
[0005fe0c] 41d7                      lea.l      (a7),a0
[0005fe0e] 4eb9 0008 36ea            jsr        memset
[0005fe14] 3ebc 4738                 move.w     #$4738,(a7)
[0005fe18] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005fe1e] 3f50 0002                 move.w     (a0),2(a7)
[0005fe22] 2f6f 0010 0006            move.l     16(a7),6(a7)
[0005fe28] 302f 0014                 move.w     20(a7),d0
[0005fe2c] 6b16                      bmi.s      $0005FE44
[0005fe2e] 74ff                      moveq.l    #-1,d2
[0005fe30] 93c9                      suba.l     a1,a1
[0005fe32] 41d7                      lea.l      (a7),a0
[0005fe34] 7201                      moveq.l    #1,d1
[0005fe36] 302f 0014                 move.w     20(a7),d0
[0005fe3a] 4eb9 0005 d902            jsr        Aev_SendMsg
[0005fe40] 6014                      bra.s      $0005FE56
[0005fe42] 6010                      bra.s      $0005FE54
[0005fe44] 72ff                      moveq.l    #-1,d1
[0005fe46] 93c9                      suba.l     a1,a1
[0005fe48] 7001                      moveq.l    #1,d0
[0005fe4a] 41d7                      lea.l      (a7),a0
[0005fe4c] 4eb9 0005 da46            jsr        Aev_SendAllMsg
[0005fe52] 6002                      bra.s      $0005FE56
[0005fe54] 4240                      clr.w      d0
[0005fe56] 4fef 0016                 lea.l      22(a7),a7
[0005fe5a] 4e75                      rts
