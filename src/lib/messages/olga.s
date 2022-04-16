Aev_InitOlga:
[0006170c] 554f                      subq.w     #2,a7
[0006170e] 3ebc 0001                 move.w     #$0001,(a7)
[00061712] 4eb9 0007 0c0a            jsr        Alu_create
[00061718] 23c8 000e 1b4e            move.l     a0,olga_connection
[0006171e] 2039 000e 1b4e            move.l     olga_connection,d0
[00061724] 6604                      bne.s      Aev_InitOlga_1
[00061726] 4240                      clr.w      d0
[00061728] 6050                      bra.s      Aev_InitOlga_2
Aev_InitOlga_1:
[0006172a] 2079 000e 1b4e            movea.l    olga_connection,a0
[00061730] 217c 0006 1984 0004       move.l     #DelConnect,4(a0)
[00061738] 7210                      moveq.l    #16,d1
[0006173a] 70ff                      moveq.l    #-1,d0
[0006173c] 41f9 000e 1b5c            lea.l      idle_message,a0
[00061742] 4eb9 0008 36ea            jsr        memset
[00061748] 7001                      moveq.l    #1,d0
[0006174a] c079 000a 8436            and.w      $000A8436,d0
[00061750] 6720                      beq.s      Aev_InitOlga_3
[00061752] 7002                      moveq.l    #2,d0
[00061754] c079 000a 8436            and.w      $000A8436,d0
[0006175a] 670a                      beq.s      Aev_InitOlga_4
[0006175c] 4eb9 0006 1900            jsr        CheckOlga
[00061762] 3e80                      move.w     d0,(a7)
[00061764] 600c                      bra.s      Aev_InitOlga_3
Aev_InitOlga_4:
[00061766] 4eb9 0006 18ae            jsr        FindOlgaManager
[0006176c] 33c0 000e 1b52            move.w     d0,olga_id
Aev_InitOlga_3:
[00061772] 4279 000e 1b70            clr.w      phase
[00061778] 3017                      move.w     (a7),d0
Aev_InitOlga_2:
[0006177a] 544f                      addq.w     #2,a7
[0006177c] 4e75                      rts

Aev_ExitOlga:
[0006177e] 33fc 0001 000e 1b70       move.w     #$0001,phase
[00061786] 3039 000e 1b52            move.w     olga_id,d0
[0006178c] 6b06                      bmi.s      Aev_ExitOlga_1
[0006178e] 4eb9 0006 1f5a            jsr        Aev_OleExit
Aev_ExitOlga_1:
[00061794] 2039 000e 1b4e            move.l     olga_connection,d0
[0006179a] 670c                      beq.s      Aev_ExitOlga_2
[0006179c] 2079 000e 1b4e            movea.l    olga_connection,a0
[000617a2] 4eb9 0007 0c5e            jsr        Alu_delete
Aev_ExitOlga_2:
[000617a8] 7001                      moveq.l    #1,d0
[000617aa] 4e75                      rts

FindAppl:
[000617ac] 4fef ffdc                 lea.l      -36(a7),a7
[000617b0] 2f48 0020                 move.l     a0,32(a7)
[000617b4] 2f49 001c                 move.l     a1,28(a7)
[000617b8] 3f7c ffff 001a            move.w     #$FFFF,26(a7)
[000617be] 2279 000e 692a            movea.l    _globl,a1
[000617c4] 206f 0020                 movea.l    32(a7),a0
[000617c8] 4eb9 0007 8b56            jsr        mt_appl_find
[000617ce] 3f40 001a                 move.w     d0,26(a7)
[000617d2] 302f 001a                 move.w     26(a7),d0
[000617d6] 6a00 00cc                 bpl        FindAppl_1
[000617da] 206f 001c                 movea.l    28(a7),a0
[000617de] 4eb9 0005 be00            jsr        Ash_getenv
[000617e4] 2f48 0014                 move.l     a0,20(a7)
[000617e8] 202f 0014                 move.l     20(a7),d0
[000617ec] 6700 00b6                 beq        FindAppl_1
[000617f0] 226f 0014                 movea.l    20(a7),a1
[000617f4] 41d7                      lea.l      (a7),a0
[000617f6] 4eb9 0004 b66e            jsr        Af_2name
[000617fc] 7008                      moveq.l    #8,d0
[000617fe] 4eb9 0004 6b28            jsr        Ast_adl
[00061804] 2279 000e 692a            movea.l    _globl,a1
[0006180a] 41d7                      lea.l      (a7),a0
[0006180c] 4eb9 0007 8b56            jsr        mt_appl_find
[00061812] 3f40 001a                 move.w     d0,26(a7)
[00061816] 302f 001a                 move.w     26(a7),d0
[0006181a] 6a00 0088                 bpl        FindAppl_1
[0006181e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061824] 3028 0238                 move.w     568(a0),d0
[00061828] 6700 007a                 beq.w      FindAppl_1
[0006182c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061832] 2f28 028c                 move.l     652(a0),-(a7)
[00061836] 43f9 000e 1b72            lea.l      $000E1B72,a1
[0006183c] 206f 0018                 movea.l    24(a7),a0
[00061840] 4eb9 0005 5e98            jsr        Ash_prog
[00061846] 584f                      addq.w     #4,a7
[00061848] 426f 0018                 clr.w      24(a7)
[0006184c] 603e                      bra.s      FindAppl_2
[0006184e] 2079 000e 692a            movea.l    _globl,a0
FindAppl_4:
[00061854] 7064                      moveq.l    #100,d0
[00061856] 4eb9 0007 91d4            jsr        mt_evnt_timer
[0006185c] 2279 000e 692a            movea.l    _globl,a1
[00061862] 206f 0020                 movea.l    32(a7),a0
[00061866] 4eb9 0007 8b56            jsr        mt_appl_find
[0006186c] 3f40 001a                 move.w     d0,26(a7)
[00061870] 302f 001a                 move.w     26(a7),d0
[00061874] 6a12                      bpl.s      FindAppl_3
[00061876] 2279 000e 692a            movea.l    _globl,a1
[0006187c] 41d7                      lea.l      (a7),a0
[0006187e] 4eb9 0007 8b56            jsr        mt_appl_find
[00061884] 3f40 001a                 move.w     d0,26(a7)
FindAppl_3:
[00061888] 526f 0018                 addq.w     #1,24(a7)
FindAppl_2:
[0006188c] 3039 000e 1b70            move.w     phase,d0
[00061892] 6610                      bne.s      FindAppl_1
[00061894] 3039 000e 1b52            move.w     olga_id,d0
[0006189a] 6a08                      bpl.s      FindAppl_1
[0006189c] 0c6f 001e 0018            cmpi.w     #$001E,24(a7)
[000618a2] 6daa                      blt.s      FindAppl_4
FindAppl_1:
[000618a4] 302f 001a                 move.w     26(a7),d0
[000618a8] 4fef 0024                 lea.l      36(a7),a7
[000618ac] 4e75                      rts

FindOlgaManager:
[000618ae] 3039 000e 1b52            move.w     olga_id,d0
[000618b4] 6a42                      bpl.s      FindOlgaManager_1
[000618b6] 43f9 000e 1b7c            lea.l      $000E1B7C,a1
[000618bc] 41f9 000e 1b73            lea.l      $000E1B73,a0
[000618c2] 6100 fee8                 bsr        FindAppl
[000618c6] 33c0 000e 1b52            move.w     d0,olga_id
[000618cc] 3039 000e 1b52            move.w     olga_id,d0
[000618d2] 6a16                      bpl.s      FindOlgaManager_2
[000618d4] 43f9 000e 1b91            lea.l      $000E1B91,a1
[000618da] 41f9 000e 1b88            lea.l      $000E1B88,a0
[000618e0] 6100 feca                 bsr        FindAppl
[000618e4] 33c0 000e 1b52            move.w     d0,olga_id
FindOlgaManager_2:
[000618ea] 3039 000e 1b52            move.w     olga_id,d0
[000618f0] 6b06                      bmi.s      FindOlgaManager_1
[000618f2] 4eb9 0006 1ee4            jsr        Aev_OleInit
FindOlgaManager_1:
[000618f8] 3039 000e 1b52            move.w     olga_id,d0
[000618fe] 4e75                      rts

CheckOlga:
[00061900] 554f                      subq.w     #2,a7
[00061902] 3039 000e 1b5a            move.w     use_olga,d0
[00061908] 671c                      beq.s      CheckOlga_1
[0006190a] 3039 000e 1b52            move.w     olga_id,d0
[00061910] 6b14                      bmi.s      CheckOlga_1
[00061912] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061918] 3039 000e 1b52            move.w     olga_id,d0
[0006191e] b050                      cmp.w      (a0),d0
[00061920] 6704                      beq.s      CheckOlga_1
[00061922] 7001                      moveq.l    #1,d0
[00061924] 605a                      bra.s      CheckOlga_2
CheckOlga_1:
[00061926] 3039 000e 1b52            move.w     olga_id,d0
[0006192c] 6a0a                      bpl.s      CheckOlga_3
[0006192e] 6100 ff7e                 bsr        FindOlgaManager
[00061932] 33c0 000e 1b52            move.w     d0,olga_id
CheckOlga_3:
[00061938] 3039 000e 1b5a            move.w     use_olga,d0
[0006193e] 661a                      bne.s      CheckOlga_4
[00061940] 4257                      clr.w      (a7)
[00061942] 6008                      bra.s      CheckOlga_5
[00061944] 4eb9 0004 b086            jsr        Aev_mess
CheckOlga_6:
[0006194a] 5257                      addq.w     #1,(a7)
CheckOlga_5:
[0006194c] 3039 000e 1b5a            move.w     use_olga,d0
[00061952] 6606                      bne.s      CheckOlga_4
[00061954] 0c57 001e                 cmpi.w     #$001E,(a7)
[00061958] 6dea                      blt.s      CheckOlga_6
CheckOlga_4:
[0006195a] 3039 000e 1b5a            move.w     use_olga,d0
[00061960] 671c                      beq.s      CheckOlga_7
[00061962] 3039 000e 1b52            move.w     olga_id,d0
[00061968] 6b14                      bmi.s      CheckOlga_7
[0006196a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061970] 3039 000e 1b52            move.w     olga_id,d0
[00061976] b050                      cmp.w      (a0),d0
[00061978] 6704                      beq.s      CheckOlga_7
[0006197a] 7001                      moveq.l    #1,d0
[0006197c] 6002                      bra.s      CheckOlga_2
CheckOlga_7:
[0006197e] 4240                      clr.w      d0
CheckOlga_2:
[00061980] 544f                      addq.w     #2,a7
[00061982] 4e75                      rts

DelConnect:
[00061984] 2f0a                      move.l     a2,-(a7)
[00061986] 514f                      subq.w     #8,a7
[00061988] 2f48 0004                 move.l     a0,4(a7)
[0006198c] 2eaf 0004                 move.l     4(a7),(a7)
[00061990] 2257                      movea.l    (a7),a1
[00061992] 702c                      moveq.l    #44,d0
[00061994] 2057                      movea.l    (a7),a0
[00061996] 2050                      movea.l    (a0),a0
[00061998] 2457                      movea.l    (a7),a2
[0006199a] 2452                      movea.l    (a2),a2
[0006199c] 246a 0004                 movea.l    4(a2),a2
[000619a0] 4e92                      jsr        (a2)
[000619a2] 2057                      movea.l    (a7),a0
[000619a4] 2028 0006                 move.l     6(a0),d0
[000619a8] 670c                      beq.s      DelConnect_1
[000619aa] 2057                      movea.l    (a7),a0
[000619ac] 2068 0006                 movea.l    6(a0),a0
[000619b0] 4eb9 0004 c9da            jsr        Ax_glfree
DelConnect_1:
[000619b6] 2057                      movea.l    (a7),a0
[000619b8] 2028 000c                 move.l     12(a0),d0
[000619bc] 670c                      beq.s      DelConnect_2
[000619be] 2057                      movea.l    (a7),a0
[000619c0] 2068 000c                 movea.l    12(a0),a0
[000619c4] 4eb9 0004 c9da            jsr        Ax_glfree
DelConnect_2:
[000619ca] 7020                      moveq.l    #32,d0
[000619cc] 206f 0004                 movea.l    4(a7),a0
[000619d0] 4eb9 0004 cc28            jsr        Ax_recycle
[000619d6] 504f                      addq.w     #8,a7
[000619d8] 245f                      movea.l    (a7)+,a2
[000619da] 4e75                      rts

CmpIDConnect:
[000619dc] 514f                      subq.w     #8,a7
[000619de] 2f48 0004                 move.l     a0,4(a7)
[000619e2] 2e89                      move.l     a1,(a7)
[000619e4] 206f 0004                 movea.l    4(a7),a0
[000619e8] 3010                      move.w     (a0),d0
[000619ea] 2057                      movea.l    (a7),a0
[000619ec] b068 0004                 cmp.w      4(a0),d0
[000619f0] 6604                      bne.s      CmpIDConnect_1
[000619f2] 7001                      moveq.l    #1,d0
[000619f4] 6002                      bra.s      CmpIDConnect_2
CmpIDConnect_1:
[000619f6] 4240                      clr.w      d0
CmpIDConnect_2:
[000619f8] 504f                      addq.w     #8,a7
[000619fa] 4e75                      rts

CmpDatInfoConnect:
[000619fc] 514f                      subq.w     #8,a7
[000619fe] 2f48 0004                 move.l     a0,4(a7)
[00061a02] 2e89                      move.l     a1,(a7)
[00061a04] 7001                      moveq.l    #1,d0
[00061a06] 2057                      movea.l    (a7),a0
[00061a08] c068 0010                 and.w      16(a0),d0
[00061a0c] 6720                      beq.s      CmpDatInfoConnect_1
[00061a0e] 2057                      movea.l    (a7),a0
[00061a10] 2268 0006                 movea.l    6(a0),a1
[00061a14] 206f 0004                 movea.l    4(a7),a0
[00061a18] 2068 0006                 movea.l    6(a0),a0
[00061a1c] 4eb9 0004 66ea            jsr        Ast_icmp
[00061a22] 4a40                      tst.w      d0
[00061a24] 6604                      bne.s      CmpDatInfoConnect_2
[00061a26] 7001                      moveq.l    #1,d0
[00061a28] 6002                      bra.s      CmpDatInfoConnect_3
CmpDatInfoConnect_2:
[00061a2a] 4240                      clr.w      d0
CmpDatInfoConnect_3:
[00061a2c] 601e                      bra.s      CmpDatInfoConnect_4
CmpDatInfoConnect_1:
[00061a2e] 2057                      movea.l    (a7),a0
[00061a30] 2268 0006                 movea.l    6(a0),a1
[00061a34] 206f 0004                 movea.l    4(a7),a0
[00061a38] 2068 0006                 movea.l    6(a0),a0
[00061a3c] 4eb9 0004 665a            jsr        Ast_cmp
[00061a42] 4a40                      tst.w      d0
[00061a44] 6604                      bne.s      CmpDatInfoConnect_5
[00061a46] 7001                      moveq.l    #1,d0
[00061a48] 6002                      bra.s      CmpDatInfoConnect_4
CmpDatInfoConnect_5:
[00061a4a] 4240                      clr.w      d0
CmpDatInfoConnect_4:
[00061a4c] 4a40                      tst.w      d0
[00061a4e] 671a                      beq.s      CmpDatInfoConnect_6
[00061a50] 7002                      moveq.l    #2,d0
[00061a52] 206f 0004                 movea.l    4(a7),a0
[00061a56] c068 0010                 and.w      16(a0),d0
[00061a5a] 7202                      moveq.l    #2,d1
[00061a5c] 2057                      movea.l    (a7),a0
[00061a5e] c268 0012                 and.w      18(a0),d1
[00061a62] b041                      cmp.w      d1,d0
[00061a64] 6604                      bne.s      CmpDatInfoConnect_6
[00061a66] 7001                      moveq.l    #1,d0
[00061a68] 6002                      bra.s      CmpDatInfoConnect_7
CmpDatInfoConnect_6:
[00061a6a] 4240                      clr.w      d0
CmpDatInfoConnect_7:
[00061a6c] 504f                      addq.w     #8,a7
[00061a6e] 4e75                      rts

Datei2Connect:
[00061a70] 2f0a                      move.l     a2,-(a7)
[00061a72] 594f                      subq.w     #4,a7
[00061a74] 2e88                      move.l     a0,(a7)
[00061a76] 487a ff84                 pea.l      CmpDatInfoConnect(pc)
[00061a7a] 226f 0004                 movea.l    4(a7),a1
[00061a7e] 2079 000e 1b4e            movea.l    olga_connection,a0
[00061a84] 2479 000e 1b4e            movea.l    olga_connection,a2
[00061a8a] 246a 0020                 movea.l    32(a2),a2
[00061a8e] 4e92                      jsr        (a2)
[00061a90] 584f                      addq.w     #4,a7
[00061a92] 584f                      addq.w     #4,a7
[00061a94] 245f                      movea.l    (a7)+,a2
[00061a96] 4e75                      rts

ID2Connect:
[00061a98] 2f0a                      move.l     a2,-(a7)
[00061a9a] 554f                      subq.w     #2,a7
[00061a9c] 3e80                      move.w     d0,(a7)
[00061a9e] 487a ff3c                 pea.l      CmpIDConnect(pc)
[00061aa2] 43ef 0004                 lea.l      4(a7),a1
[00061aa6] 2079 000e 1b4e            movea.l    olga_connection,a0
[00061aac] 2479 000e 1b4e            movea.l    olga_connection,a2
[00061ab2] 246a 0020                 movea.l    32(a2),a2
[00061ab6] 4e92                      jsr        (a2)
[00061ab8] 584f                      addq.w     #4,a7
[00061aba] 544f                      addq.w     #2,a7
[00061abc] 245f                      movea.l    (a7)+,a2
[00061abe] 4e75                      rts

SendOlgaUpdate:
[00061ac0] 2f0a                      move.l     a2,-(a7)
[00061ac2] 514f                      subq.w     #8,a7
[00061ac4] 2f48 0004                 move.l     a0,4(a7)
[00061ac8] 2e89                      move.l     a1,(a7)
[00061aca] 206f 0004                 movea.l    4(a7),a0
[00061ace] 2257                      movea.l    (a7),a1
[00061ad0] 3368 000a 000a            move.w     10(a0),10(a1)
[00061ad6] 2257                      movea.l    (a7),a1
[00061ad8] 702b                      moveq.l    #43,d0
[00061ada] 2057                      movea.l    (a7),a0
[00061adc] 2050                      movea.l    (a0),a0
[00061ade] 2457                      movea.l    (a7),a2
[00061ae0] 2452                      movea.l    (a2),a2
[00061ae2] 246a 0004                 movea.l    4(a2),a2
[00061ae6] 4e92                      jsr        (a2)
[00061ae8] 504f                      addq.w     #8,a7
[00061aea] 245f                      movea.l    (a7)+,a2
[00061aec] 4e75                      rts

Aev_GetOlgaInit:
[00061aee] 4fef fff6                 lea.l      -10(a7),a7
[00061af2] 2f48 0006                 move.l     a0,6(a7)
[00061af6] 206f 0006                 movea.l    6(a7),a0
[00061afa] 2e90                      move.l     (a0),(a7)
[00061afc] 2057                      movea.l    (a7),a0
[00061afe] 3039 000e 1b52            move.w     olga_id,d0
[00061b04] b068 0002                 cmp.w      2(a0),d0
[00061b08] 6604                      bne.s      Aev_GetOlgaInit_1
[00061b0a] 7001                      moveq.l    #1,d0
[00061b0c] 6002                      bra.s      Aev_GetOlgaInit_2
Aev_GetOlgaInit_1:
[00061b0e] 4240                      clr.w      d0
Aev_GetOlgaInit_2:
[00061b10] 3f40 0004                 move.w     d0,4(a7)
[00061b14] 302f 0004                 move.w     4(a7),d0
[00061b18] 674e                      beq.s      Aev_GetOlgaInit_3
[00061b1a] 2057                      movea.l    (a7),a0
[00061b1c] 3028 000e                 move.w     14(a0),d0
[00061b20] 662a                      bne.s      Aev_GetOlgaInit_4
[00061b22] 33fc ffff 000e 1b52       move.w     #$FFFF,olga_id
[00061b2a] 4279 000e 1b54            clr.w      olga_infos
[00061b30] 33fc ffff 000e 1b56       move.w     #$FFFF,olga_stufe
[00061b38] 2079 000e 1b4e            movea.l    olga_connection,a0
[00061b3e] 2279 000e 1b4e            movea.l    olga_connection,a1
[00061b44] 2269 0008                 movea.l    8(a1),a1
[00061b48] 4e91                      jsr        (a1)
[00061b4a] 601c                      bra.s      Aev_GetOlgaInit_3
Aev_GetOlgaInit_4:
[00061b4c] 2057                      movea.l    (a7),a0
[00061b4e] 33e8 0006 000e 1b54       move.w     6(a0),olga_infos
[00061b56] 2057                      movea.l    (a7),a0
[00061b58] 33e8 0008 000e 1b56       move.w     8(a0),olga_stufe
[00061b60] 33fc 0001 000e 1b5a       move.w     #$0001,use_olga
Aev_GetOlgaInit_3:
[00061b68] 302f 0004                 move.w     4(a7),d0
[00061b6c] 4fef 000a                 lea.l      10(a7),a7
[00061b70] 4e75                      rts

Aev_GetOleExit:
[00061b72] 514f                      subq.w     #8,a7
[00061b74] 2f48 0004                 move.l     a0,4(a7)
[00061b78] 206f 0004                 movea.l    4(a7),a0
[00061b7c] 2e90                      move.l     (a0),(a7)
[00061b7e] 3039 000e 1b52            move.w     olga_id,d0
[00061b84] 6b40                      bmi.s      Aev_GetOleExit_1
[00061b86] 2057                      movea.l    (a7),a0
[00061b88] 3039 000e 1b52            move.w     olga_id,d0
[00061b8e] b068 0002                 cmp.w      2(a0),d0
[00061b92] 6632                      bne.s      Aev_GetOleExit_1
[00061b94] 33fc ffff 000e 1b52       move.w     #$FFFF,olga_id
[00061b9c] 4279 000e 1b54            clr.w      olga_infos
[00061ba2] 33fc ffff 000e 1b56       move.w     #$FFFF,olga_stufe
[00061baa] 4279 000e 1b5a            clr.w      use_olga
[00061bb0] 2079 000e 1b4e            movea.l    olga_connection,a0
[00061bb6] 2279 000e 1b4e            movea.l    olga_connection,a1
[00061bbc] 2269 0008                 movea.l    8(a1),a1
[00061bc0] 4e91                      jsr        (a1)
[00061bc2] 7001                      moveq.l    #1,d0
[00061bc4] 6002                      bra.s      Aev_GetOleExit_2
Aev_GetOleExit_1:
[00061bc6] 4240                      clr.w      d0
Aev_GetOleExit_2:
[00061bc8] 504f                      addq.w     #8,a7
[00061bca] 4e75                      rts

Aev_GetOleNew:
[00061bcc] 514f                      subq.w     #8,a7
[00061bce] 2f48 0004                 move.l     a0,4(a7)
[00061bd2] 206f 0004                 movea.l    4(a7),a0
[00061bd6] 2e90                      move.l     (a0),(a7)
[00061bd8] 2057                      movea.l    (a7),a0
[00061bda] 33e8 0002 000e 1b52       move.w     2(a0),olga_id
[00061be2] 2057                      movea.l    (a7),a0
[00061be4] 33e8 000e 000e 1b58       move.w     14(a0),olga_version
[00061bec] 4eb9 0006 1ee4            jsr        Aev_OleInit
[00061bf2] 504f                      addq.w     #8,a7
[00061bf4] 4e75                      rts

Aev_GetOlgaAck:
[00061bf6] 2f0a                      move.l     a2,-(a7)
[00061bf8] 4fef ffd6                 lea.l      -42(a7),a7
[00061bfc] 2f48 0022                 move.l     a0,34(a7)
[00061c00] 206f 0022                 movea.l    34(a7),a0
[00061c04] 2f50 001e                 move.l     (a0),30(a7)
[00061c08] 42af 0004                 clr.l      4(a7)
[00061c0c] 4297                      clr.l      (a7)
[00061c0e] 206f 001e                 movea.l    30(a7),a0
[00061c12] 3028 000e                 move.w     14(a0),d0
[00061c16] 907c 1238                 sub.w      #$1238,d0
[00061c1a] 6714                      beq.s      Aev_GetOlgaAck_1
[00061c1c] 5540                      subq.w     #2,d0
[00061c1e] 6764                      beq.s      Aev_GetOlgaAck_2
[00061c20] 907c 000a                 sub.w      #$000A,d0
[00061c24] 6700 0084                 beq        Aev_GetOlgaAck_3
[00061c28] 5940                      subq.w     #4,d0
[00061c2a] 6724                      beq.s      Aev_GetOlgaAck_4
[00061c2c] 6000 009a                 bra        Aev_GetOlgaAck_5
Aev_GetOlgaAck_1:
[00061c30] 206f 001e                 movea.l    30(a7),a0
[00061c34] 2f68 0006 000e            move.l     6(a0),14(a7)
[00061c3a] 3f7c 0002 0018            move.w     #$0002,24(a7)
[00061c40] 41ef 0008                 lea.l      8(a7),a0
[00061c44] 6100 fe2a                 bsr        Datei2Connect
[00061c48] 2f48 001a                 move.l     a0,26(a7)
[00061c4c] 6000 007a                 bra.w      Aev_GetOlgaAck_5
Aev_GetOlgaAck_4:
[00061c50] 206f 001e                 movea.l    30(a7),a0
[00061c54] 3028 000a                 move.w     10(a0),d0
[00061c58] 6100 fe3e                 bsr        ID2Connect
[00061c5c] 2f48 001a                 move.l     a0,26(a7)
[00061c60] 202f 001a                 move.l     26(a7),d0
[00061c64] 671c                      beq.s      Aev_GetOlgaAck_6
[00061c66] 206f 001a                 movea.l    26(a7),a0
[00061c6a] 2f50 0026                 move.l     (a0),38(a7)
[00061c6e] 226f 001a                 movea.l    26(a7),a1
[00061c72] 702f                      moveq.l    #47,d0
[00061c74] 206f 0026                 movea.l    38(a7),a0
[00061c78] 246f 0026                 movea.l    38(a7),a2
[00061c7c] 246a 0004                 movea.l    4(a2),a2
[00061c80] 4e92                      jsr        (a2)
Aev_GetOlgaAck_6:
[00061c82] 6044                      bra.s      Aev_GetOlgaAck_5
Aev_GetOlgaAck_2:
[00061c84] 206f 001e                 movea.l    30(a7),a0
[00061c88] 2f68 000a 000e            move.l     10(a0),14(a7)
[00061c8e] 3f7c 0002 0018            move.w     #$0002,24(a7)
[00061c94] 41ef 0008                 lea.l      8(a7),a0
[00061c98] 6100 fdd6                 bsr        Datei2Connect
[00061c9c] 2f48 001a                 move.l     a0,26(a7)
[00061ca0] 206f 001e                 movea.l    30(a7),a0
[00061ca4] 2ea8 0006                 move.l     6(a0),(a7)
[00061ca8] 601e                      bra.s      Aev_GetOlgaAck_5
Aev_GetOlgaAck_3:
[00061caa] 206f 001e                 movea.l    30(a7),a0
[00061cae] 2f68 0006 000e            move.l     6(a0),14(a7)
[00061cb4] 3f7c 0002 0018            move.w     #$0002,24(a7)
[00061cba] 41ef 0008                 lea.l      8(a7),a0
[00061cbe] 6100 fdb0                 bsr        Datei2Connect
[00061cc2] 2f48 001a                 move.l     a0,26(a7)
[00061cc6] 4e71                      nop
Aev_GetOlgaAck_5:
[00061cc8] 202f 001a                 move.l     26(a7),d0
[00061ccc] 6742                      beq.s      Aev_GetOlgaAck_7
[00061cce] 206f 001e                 movea.l    30(a7),a0
[00061cd2] 3010                      move.w     (a0),d0
[00061cd4] 206f 001a                 movea.l    26(a7),a0
[00061cd8] b068 001a                 cmp.w      26(a0),d0
[00061cdc] 6630                      bne.s      Aev_GetOlgaAck_8
[00061cde] 206f 001a                 movea.l    26(a7),a0
[00061ce2] 5368 001c                 subq.w     #1,28(a0)
[00061ce6] 206f 001a                 movea.l    26(a7),a0
[00061cea] 0c68 0001 001c            cmpi.w     #$0001,28(a0)
[00061cf0] 6c0a                      bge.s      Aev_GetOlgaAck_9
[00061cf2] 206f 001a                 movea.l    26(a7),a0
[00061cf6] 317c ffff 001a            move.w     #$FFFF,26(a0)
Aev_GetOlgaAck_9:
[00061cfc] 206f 001a                 movea.l    26(a7),a0
[00061d00] 3028 001e                 move.w     30(a0),d0
[00061d04] 6708                      beq.s      Aev_GetOlgaAck_8
[00061d06] 206f 001a                 movea.l    26(a7),a0
[00061d0a] 6100 fc78                 bsr        DelConnect
Aev_GetOlgaAck_8:
[00061d0e] 6006                      bra.s      Aev_GetOlgaAck_10
Aev_GetOlgaAck_7:
[00061d10] 2f6f 000e 0004            move.l     14(a7),4(a7)
Aev_GetOlgaAck_10:
[00061d16] 202f 0004                 move.l     4(a7),d0
[00061d1a] 671e                      beq.s      Aev_GetOlgaAck_11
[00061d1c] 4879 0007 0f86            pea.l      Alu_ptrCmp
[00061d22] 226f 0008                 movea.l    8(a7),a1
[00061d26] 2079 000e 147e            movea.l    globProtData,a0
[00061d2c] 2479 000e 147e            movea.l    globProtData,a2
[00061d32] 246a 0018                 movea.l    24(a2),a2
[00061d36] 4e92                      jsr        (a2)
[00061d38] 584f                      addq.w     #4,a7
Aev_GetOlgaAck_11:
[00061d3a] 2017                      move.l     (a7),d0
[00061d3c] 671e                      beq.s      Aev_GetOlgaAck_12
[00061d3e] 4879 0007 0f86            pea.l      Alu_ptrCmp
[00061d44] 226f 0004                 movea.l    4(a7),a1
[00061d48] 2079 000e 147e            movea.l    globProtData,a0
[00061d4e] 2479 000e 147e            movea.l    globProtData,a2
[00061d54] 246a 0018                 movea.l    24(a2),a2
[00061d58] 4e92                      jsr        (a2)
[00061d5a] 584f                      addq.w     #4,a7
Aev_GetOlgaAck_12:
[00061d5c] 7001                      moveq.l    #1,d0
[00061d5e] 4fef 002a                 lea.l      42(a7),a7
[00061d62] 245f                      movea.l    (a7)+,a2
[00061d64] 4e75                      rts

Aev_GetOlgaUpdated:
[00061d66] 2f0a                      move.l     a2,-(a7)
[00061d68] 4fef ffe6                 lea.l      -26(a7),a7
[00061d6c] 2f48 0016                 move.l     a0,22(a7)
[00061d70] 206f 0016                 movea.l    22(a7),a0
[00061d74] 2f50 0012                 move.l     (a0),18(a7)
[00061d78] 206f 0012                 movea.l    18(a7),a0
[00061d7c] 2f68 0006 0006            move.l     6(a0),6(a7)
[00061d82] 4241                      clr.w      d1
[00061d84] 70ff                      moveq.l    #-1,d0
[00061d86] 206f 0006                 movea.l    6(a7),a0
[00061d8a] 4eb9 0004 ca32            jsr        Ax_memCheck
[00061d90] 4a40                      tst.w      d0
[00061d92] 672e                      beq.s      Aev_GetOlgaUpdated_1
[00061d94] 206f 0012                 movea.l    18(a7),a0
[00061d98] 3f68 000a 000a            move.w     10(a0),10(a7)
[00061d9e] 426f 0010                 clr.w      16(a7)
[00061da2] 487a fd1c                 pea.l      SendOlgaUpdate(pc)
[00061da6] 487a fc54                 pea.l      CmpDatInfoConnect(pc)
[00061daa] 43ef 0008                 lea.l      8(a7),a1
[00061dae] 2079 000e 1b4e            movea.l    olga_connection,a0
[00061db4] 2479 000e 1b4e            movea.l    olga_connection,a2
[00061dba] 246a 0040                 movea.l    64(a2),a2
[00061dbe] 4e92                      jsr        (a2)
[00061dc0] 504f                      addq.w     #8,a7
Aev_GetOlgaUpdated_1:
[00061dc2] 7001                      moveq.l    #1,d0
[00061dc4] 4fef 001a                 lea.l      26(a7),a7
[00061dc8] 245f                      movea.l    (a7)+,a2
[00061dca] 4e75                      rts

Aev_GetOlgaGetInfo:
[00061dcc] 2f0a                      move.l     a2,-(a7)
[00061dce] 4fef fff0                 lea.l      -16(a7),a7
[00061dd2] 2f48 0008                 move.l     a0,8(a7)
[00061dd6] 206f 0008                 movea.l    8(a7),a0
[00061dda] 2f50 0004                 move.l     (a0),4(a7)
[00061dde] 487a fbfc                 pea.l      CmpIDConnect(pc)
[00061de2] 226f 0008                 movea.l    8(a7),a1
[00061de6] 43e9 000a                 lea.l      10(a1),a1
[00061dea] 2079 000e 1b4e            movea.l    olga_connection,a0
[00061df0] 2479 000e 1b4e            movea.l    olga_connection,a2
[00061df6] 246a 0020                 movea.l    32(a2),a2
[00061dfa] 4e92                      jsr        (a2)
[00061dfc] 584f                      addq.w     #4,a7
[00061dfe] 2e88                      move.l     a0,(a7)
[00061e00] 2017                      move.l     (a7),d0
[00061e02] 672c                      beq.s      Aev_GetOlgaGetInfo_1
[00061e04] 2057                      movea.l    (a7),a0
[00061e06] 2f50 000c                 move.l     (a0),12(a7)
[00061e0a] 2257                      movea.l    (a7),a1
[00061e0c] 702d                      moveq.l    #45,d0
[00061e0e] 206f 000c                 movea.l    12(a7),a0
[00061e12] 246f 000c                 movea.l    12(a7),a2
[00061e16] 246a 0004                 movea.l    4(a2),a2
[00061e1a] 4e92                      jsr        (a2)
[00061e1c] 4a40                      tst.w      d0
[00061e1e] 6710                      beq.s      Aev_GetOlgaGetInfo_1
[00061e20] 2057                      movea.l    (a7),a0
[00061e22] 226f 0004                 movea.l    4(a7),a1
[00061e26] 3029 0002                 move.w     2(a1),d0
[00061e2a] 4eb9 0006 210a            jsr        Aev_OlgaInfo
Aev_GetOlgaGetInfo_1:
[00061e30] 7001                      moveq.l    #1,d0
[00061e32] 4fef 0010                 lea.l      16(a7),a7
[00061e36] 245f                      movea.l    (a7)+,a2
[00061e38] 4e75                      rts

Aev_GetOlgaClientTerminated:
[00061e3a] 7001                      moveq.l    #1,d0
[00061e3c] 4e75                      rts

Aev_GetOlgaIdle:
[00061e3e] 2f0a                      move.l     a2,-(a7)
[00061e40] 4fef ffe6                 lea.l      -26(a7),a7
[00061e44] 2f48 0016                 move.l     a0,22(a7)
[00061e48] 206f 0016                 movea.l    22(a7),a0
[00061e4c] 2f50 0012                 move.l     (a0),18(a7)
[00061e50] 3ebc 0001                 move.w     #$0001,(a7)
[00061e54] 0c79 1249 000e 1b5c       cmpi.w     #$1249,idle_message
[00061e5c] 662a                      bne.s      Aev_GetOlgaIdle_1
[00061e5e] 7008                      moveq.l    #8,d0
[00061e60] 226f 0012                 movea.l    18(a7),a1
[00061e64] 5049                      addq.w     #8,a1
[00061e66] 41f9 000e 1b64            lea.l      $000E1B64,a0
[00061e6c] 4eb9 0008 34ea            jsr        memcmp
[00061e72] 4a40                      tst.w      d0
[00061e74] 6612                      bne.s      Aev_GetOlgaIdle_1
[00061e76] 7210                      moveq.l    #16,d1
[00061e78] 70ff                      moveq.l    #-1,d0
[00061e7a] 41f9 000e 1b5c            lea.l      idle_message,a0
[00061e80] 4eb9 0008 36ea            jsr        memset
[00061e86] 6052                      bra.s      Aev_GetOlgaIdle_2
Aev_GetOlgaIdle_1:
[00061e88] 206f 0012                 movea.l    18(a7),a0
[00061e8c] 3028 0002                 move.w     2(a0),d0
[00061e90] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061e96] b050                      cmp.w      (a0),d0
[00061e98] 6740                      beq.s      Aev_GetOlgaIdle_2
[00061e9a] 7010                      moveq.l    #16,d0
[00061e9c] 226f 0012                 movea.l    18(a7),a1
[00061ea0] 41ef 0002                 lea.l      2(a7),a0
[00061ea4] 4eb9 0008 3500            jsr        memcpy
[00061eaa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061eb0] 3f50 0004                 move.w     (a0),4(a7)
[00061eb4] 2279 000e 692a            movea.l    _globl,a1
[00061eba] 41ef 0002                 lea.l      2(a7),a0
[00061ebe] 7210                      moveq.l    #16,d1
[00061ec0] 246f 0012                 movea.l    18(a7),a2
[00061ec4] 302a 0002                 move.w     2(a2),d0
[00061ec8] 4eb9 0007 8ae8            jsr        mt_appl_write
[00061ece] 4a40                      tst.w      d0
[00061ed0] 6704                      beq.s      Aev_GetOlgaIdle_3
[00061ed2] 7001                      moveq.l    #1,d0
[00061ed4] 6002                      bra.s      Aev_GetOlgaIdle_4
Aev_GetOlgaIdle_3:
[00061ed6] 4240                      clr.w      d0
Aev_GetOlgaIdle_4:
[00061ed8] 3e80                      move.w     d0,(a7)
Aev_GetOlgaIdle_2:
[00061eda] 3017                      move.w     (a7),d0
[00061edc] 4fef 001a                 lea.l      26(a7),a7
[00061ee0] 245f                      movea.l    (a7)+,a2
[00061ee2] 4e75                      rts

Aev_OleInit:
[00061ee4] 4fef ffee                 lea.l      -18(a7),a7
[00061ee8] 426f 0010                 clr.w      16(a7)
[00061eec] 3039 000e 1b52            move.w     olga_id,d0
[00061ef2] 6b5c                      bmi.s      Aev_OleInit_1
[00061ef4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061efa] 3039 000e 1b52            move.w     olga_id,d0
[00061f00] b050                      cmp.w      (a0),d0
[00061f02] 674c                      beq.s      Aev_OleInit_1
[00061f04] 7210                      moveq.l    #16,d1
[00061f06] 4240                      clr.w      d0
[00061f08] 41d7                      lea.l      (a7),a0
[00061f0a] 4eb9 0008 36ea            jsr        memset
[00061f10] 3ebc 4950                 move.w     #$4950,(a7)
[00061f14] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061f1a] 3f50 0002                 move.w     (a0),2(a7)
[00061f1e] 3f7c 0801 0006            move.w     #$0801,6(a7)
[00061f24] 3f79 000a 8438 000e       move.w     $000A8438,14(a7)
[00061f2c] 2279 000e 692a            movea.l    _globl,a1
[00061f32] 41d7                      lea.l      (a7),a0
[00061f34] 7210                      moveq.l    #16,d1
[00061f36] 3039 000e 1b52            move.w     olga_id,d0
[00061f3c] 4eb9 0007 8ae8            jsr        mt_appl_write
[00061f42] 4a40                      tst.w      d0
[00061f44] 6704                      beq.s      Aev_OleInit_2
[00061f46] 7001                      moveq.l    #1,d0
[00061f48] 6002                      bra.s      Aev_OleInit_3
Aev_OleInit_2:
[00061f4a] 4240                      clr.w      d0
Aev_OleInit_3:
[00061f4c] 3f40 0010                 move.w     d0,16(a7)
Aev_OleInit_1:
[00061f50] 302f 0010                 move.w     16(a7),d0
[00061f54] 4fef 0012                 lea.l      18(a7),a7
[00061f58] 4e75                      rts

Aev_OleExit:
[00061f5a] 4fef ffee                 lea.l      -18(a7),a7
[00061f5e] 426f 0010                 clr.w      16(a7)
[00061f62] 6100 f99c                 bsr        CheckOlga
[00061f66] 4a40                      tst.w      d0
[00061f68] 676c                      beq.s      Aev_OleExit_1
[00061f6a] 7210                      moveq.l    #16,d1
[00061f6c] 4240                      clr.w      d0
[00061f6e] 41d7                      lea.l      (a7),a0
[00061f70] 4eb9 0008 36ea            jsr        memset
[00061f76] 3ebc 4951                 move.w     #$4951,(a7)
[00061f7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061f80] 3f50 0002                 move.w     (a0),2(a7)
[00061f84] 2279 000e 692a            movea.l    _globl,a1
[00061f8a] 41d7                      lea.l      (a7),a0
[00061f8c] 7210                      moveq.l    #16,d1
[00061f8e] 3039 000e 1b52            move.w     olga_id,d0
[00061f94] 4eb9 0007 8ae8            jsr        mt_appl_write
[00061f9a] 4a40                      tst.w      d0
[00061f9c] 6704                      beq.s      Aev_OleExit_2
[00061f9e] 7001                      moveq.l    #1,d0
[00061fa0] 6002                      bra.s      Aev_OleExit_3
Aev_OleExit_2:
[00061fa2] 4240                      clr.w      d0
Aev_OleExit_3:
[00061fa4] 3f40 0010                 move.w     d0,16(a7)
[00061fa8] 33fc ffff 000e 1b52       move.w     #$FFFF,olga_id
[00061fb0] 4279 000e 1b54            clr.w      olga_infos
[00061fb6] 33fc ffff 000e 1b56       move.w     #$FFFF,olga_stufe
[00061fbe] 4279 000e 1b5a            clr.w      use_olga
[00061fc4] 2079 000e 1b4e            movea.l    olga_connection,a0
[00061fca] 2279 000e 1b4e            movea.l    olga_connection,a1
[00061fd0] 2269 0008                 movea.l    8(a1),a1
[00061fd4] 4e91                      jsr        (a1)
Aev_OleExit_1:
[00061fd6] 302f 0010                 move.w     16(a7),d0
[00061fda] 4fef 0012                 lea.l      18(a7),a7
[00061fde] 4e75                      rts

Aev_OlgaUpdate:
[00061fe0] 2f0a                      move.l     a2,-(a7)
[00061fe2] 4fef ffd0                 lea.l      -48(a7),a7
[00061fe6] 2f48 002c                 move.l     a0,44(a7)
[00061fea] 426f 002a                 clr.w      42(a7)
[00061fee] 6100 f910                 bsr        CheckOlga
[00061ff2] 4a40                      tst.w      d0
[00061ff4] 6700 0108                 beq        Aev_OlgaUpdate_1
[00061ff8] 2f6f 002c 000a            move.l     44(a7),10(a7)
[00061ffe] 3f7c 0002 0014            move.w     #$0002,20(a7)
[00062004] 41ef 0004                 lea.l      4(a7),a0
[00062008] 6100 fa66                 bsr        Datei2Connect
[0006200c] 2f48 0016                 move.l     a0,22(a7)
[00062010] 7210                      moveq.l    #16,d1
[00062012] 4240                      clr.w      d0
[00062014] 41ef 001a                 lea.l      26(a7),a0
[00062018] 4eb9 0008 36ea            jsr        memset
[0006201e] 3f7c 1238 001a            move.w     #$1238,26(a7)
[00062024] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006202a] 3f50 001c                 move.w     (a0),28(a7)
[0006202e] 202f 0016                 move.l     22(a7),d0
[00062032] 660a                      bne.s      Aev_OlgaUpdate_2
[00062034] 206f 0016                 movea.l    22(a7),a0
[00062038] 3028 001e                 move.w     30(a0),d0
[0006203c] 6756                      beq.s      Aev_OlgaUpdate_3
Aev_OlgaUpdate_2:
[0006203e] 206f 0016                 movea.l    22(a7),a0
[00062042] 2068 000c                 movea.l    12(a0),a0
[00062046] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006204c] 4a40                      tst.w      d0
[0006204e] 6704                      beq.s      Aev_OlgaUpdate_4
[00062050] 4240                      clr.w      d0
[00062052] 6008                      bra.s      Aev_OlgaUpdate_5
Aev_OlgaUpdate_4:
[00062054] 206f 0016                 movea.l    22(a7),a0
[00062058] 3028 0004                 move.w     4(a0),d0
Aev_OlgaUpdate_5:
[0006205c] 3f40 0024                 move.w     d0,36(a7)
[00062060] 206f 0016                 movea.l    22(a7),a0
[00062064] 2f68 0006 0020            move.l     6(a0),32(a7)
[0006206a] 206f 0016                 movea.l    22(a7),a0
[0006206e] 0c68 1238 001a            cmpi.w     #$1238,26(a0)
[00062074] 660a                      bne.s      Aev_OlgaUpdate_6
[00062076] 206f 0016                 movea.l    22(a7),a0
[0006207a] 5268 001c                 addq.w     #1,28(a0)
[0006207e] 6008                      bra.s      Aev_OlgaUpdate_7
Aev_OlgaUpdate_6:
[00062080] 206f 0016                 movea.l    22(a7),a0
[00062084] 4268 001c                 clr.w      28(a0)
Aev_OlgaUpdate_7:
[00062088] 206f 0016                 movea.l    22(a7),a0
[0006208c] 317c 1238 001a            move.w     #$1238,26(a0)
[00062092] 6044                      bra.s      Aev_OlgaUpdate_8
Aev_OlgaUpdate_3:
[00062094] 206f 002c                 movea.l    44(a7),a0
[00062098] 4eb9 0008 2f6c            jsr        strlen
[0006209e] 5280                      addq.l     #1,d0
[000620a0] 4eb9 0004 c95e            jsr        Ax_glmalloc
[000620a6] 2e88                      move.l     a0,(a7)
[000620a8] 2017                      move.l     (a7),d0
[000620aa] 6604                      bne.s      Aev_OlgaUpdate_9
[000620ac] 4240                      clr.w      d0
[000620ae] 6052                      bra.s      Aev_OlgaUpdate_10
Aev_OlgaUpdate_9:
[000620b0] 2257                      movea.l    (a7),a1
[000620b2] 2079 000e 147e            movea.l    globProtData,a0
[000620b8] 2479 000e 147e            movea.l    globProtData,a2
[000620be] 246a 000c                 movea.l    12(a2),a2
[000620c2] 4e92                      jsr        (a2)
[000620c4] 226f 002c                 movea.l    44(a7),a1
[000620c8] 2057                      movea.l    (a7),a0
[000620ca] 4eb9 0008 2f0c            jsr        strcpy
[000620d0] 2f57 0020                 move.l     (a7),32(a7)
[000620d4] 426f 0024                 clr.w      36(a7)
Aev_OlgaUpdate_8:
[000620d8] 2279 000e 692a            movea.l    _globl,a1
[000620de] 41ef 001a                 lea.l      26(a7),a0
[000620e2] 7210                      moveq.l    #16,d1
[000620e4] 3039 000e 1b52            move.w     olga_id,d0
[000620ea] 4eb9 0007 8ae8            jsr        mt_appl_write
[000620f0] 4a40                      tst.w      d0
[000620f2] 6704                      beq.s      Aev_OlgaUpdate_11
[000620f4] 7001                      moveq.l    #1,d0
[000620f6] 6002                      bra.s      Aev_OlgaUpdate_12
Aev_OlgaUpdate_11:
[000620f8] 4240                      clr.w      d0
Aev_OlgaUpdate_12:
[000620fa] 3f40 002a                 move.w     d0,42(a7)
Aev_OlgaUpdate_1:
[000620fe] 302f 002a                 move.w     42(a7),d0
Aev_OlgaUpdate_10:
[00062102] 4fef 0030                 lea.l      48(a7),a7
[00062106] 245f                      movea.l    (a7)+,a2
[00062108] 4e75                      rts

Aev_OlgaInfo:
[0006210a] 4fef ffe8                 lea.l      -24(a7),a7
[0006210e] 3f40 0016                 move.w     d0,22(a7)
[00062112] 2f48 0012                 move.l     a0,18(a7)
[00062116] 3ebc 0001                 move.w     #$0001,(a7)
[0006211a] 6100 f7e4                 bsr        CheckOlga
[0006211e] 4a40                      tst.w      d0
[00062120] 6754                      beq.s      Aev_OlgaInfo_1
[00062122] 7210                      moveq.l    #16,d1
[00062124] 4240                      clr.w      d0
[00062126] 41ef 0002                 lea.l      2(a7),a0
[0006212a] 4eb9 0008 36ea            jsr        memset
[00062130] 3f7c 1248 0002            move.w     #$1248,2(a7)
[00062136] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006213c] 3f50 0004                 move.w     (a0),4(a7)
[00062140] 206f 0012                 movea.l    18(a7),a0
[00062144] 3f68 0004 000c            move.w     4(a0),12(a7)
[0006214a] 206f 0012                 movea.l    18(a7),a0
[0006214e] 2f68 000c 0008            move.l     12(a0),8(a7)
[00062154] 2279 000e 692a            movea.l    _globl,a1
[0006215a] 41ef 0002                 lea.l      2(a7),a0
[0006215e] 7210                      moveq.l    #16,d1
[00062160] 302f 0016                 move.w     22(a7),d0
[00062164] 4eb9 0007 8ae8            jsr        mt_appl_write
[0006216a] 4a40                      tst.w      d0
[0006216c] 6704                      beq.s      Aev_OlgaInfo_2
[0006216e] 7001                      moveq.l    #1,d0
[00062170] 6002                      bra.s      Aev_OlgaInfo_3
Aev_OlgaInfo_2:
[00062172] 4240                      clr.w      d0
Aev_OlgaInfo_3:
[00062174] 3e80                      move.w     d0,(a7)
Aev_OlgaInfo_1:
[00062176] 3017                      move.w     (a7),d0
[00062178] 4fef 0018                 lea.l      24(a7),a7
[0006217c] 4e75                      rts

	.data

olga_connection:
[000e1b4e]                           dc.w $0000
[000e1b50]                           dc.w $0000
olga_id:
[000e1b52]                           dc.w $ffff
olga_infos:
[000e1b54]                           dc.w $0000
olga_stufe:
[000e1b56]                           dc.w $ffff
olga_version:
[000e1b58]                           dc.w $0000
use_olga:
[000e1b5a]                           dc.w $0000
idle_message:
[000e1b5c]                           dc.w $ffff
[000e1b5e]                           dc.w $ffff
[000e1b60]                           dc.w $ffff
[000e1b62]                           dc.w $ffff
[000e1b64]                           dc.w $ffff
[000e1b66]                           dc.w $ffff
[000e1b68]                           dc.w $ffff
[000e1b6a]                           dc.w $ffff
max_id:
[000e1b6c]                           dc.w $0000
max_grp_id:
[000e1b6e]                           dc.w $0000
phase:
[000e1b70]                           dc.w $ffff
[000e1b72]                           dc.w $004f
[000e1b74]                           dc.b 'LGA    ',0
[000e1b7c]                           dc.b 'OLGAMANAGER',0
[000e1b88]                           dc.b 'OLEMANGR',0
[000e1b91]                           dc.b 'OLEMANAGER',0

