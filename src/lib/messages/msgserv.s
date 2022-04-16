INMsgService:
[0005d566] 2039 000e 147e            move.l     globProtData,d0
[0005d56c] 6626                      bne.s      INMsgService_1
[0005d56e] 4eb9 0007 0c0a            jsr        Alu_create
[0005d574] 23c8 000e 147e            move.l     a0,globProtData
[0005d57a] 2039 000e 147e            move.l     globProtData,d0
[0005d580] 6604                      bne.s      INMsgService_2
[0005d582] 70ff                      moveq.l    #-1,d0
[0005d584] 4e75                      rts
INMsgService_2:
INMsgService_1:

[0005d586] 2079 000e 147e            movea.l    globProtData,a0
[0005d58c] 217c 0004 c9da 0004       move.l     #Ax_glfree,4(a0)
[0005d594] 43f9 0005 d5d0            lea.l      P2IntCmp,a1
[0005d59a] 720e                      moveq.l    #14,d1
[0005d59c] 3039 000e 17e6            move.w     MsgListeLen,d0
[0005d5a2] 48c0                      ext.l      d0
[0005d5a4] 41f9 000e 1482            lea.l      MsgListe,a0
[0005d5aa] 4eb9 0008 1240            jsr        qsort
[0005d5b0] 4240                      clr.w      d0
[0005d5b2] 4e75                      rts

TRMsgService:
[0005d5b4] 2039 000e 147e            move.l     globProtData,d0
[0005d5ba] 670c                      beq.s      TRMsgService_1
[0005d5bc] 2079 000e 147e            movea.l    globProtData,a0
[0005d5c2] 4eb9 0007 0c5e            jsr        Alu_delete
TRMsgService_1:
[0005d5c8] 42b9 000e 147e            clr.l      globProtData
[0005d5ce] 4e75                      rts

P2IntCmp:
[0005d5d0] 514f                      subq.w     #8,a7
[0005d5d2] 2f48 0004                 move.l     a0,4(a7)
[0005d5d6] 2e89                      move.l     a1,(a7)
[0005d5d8] 206f 0004                 movea.l    4(a7),a0
[0005d5dc] 3010                      move.w     (a0),d0
[0005d5de] 2057                      movea.l    (a7),a0
[0005d5e0] 9050                      sub.w      (a0),d0
[0005d5e2] 504f                      addq.w     #8,a7
[0005d5e4] 4e75                      rts

Aev_message:
[0005d5e6] 2f0a                      move.l     a2,-(a7)
[0005d5e8] 4fef ffd8                 lea.l      -40(a7),a7
[0005d5ec] 2f48 0024                 move.l     a0,36(a7)
[0005d5f0] 3ebc 0001                 move.w     #$0001,(a7)
[0005d5f4] 4eb9 0005 5e8c            jsr        Awi_root
[0005d5fa] 2008                      move.l     a0,d0
[0005d5fc] 6606                      bne.s      Aev_message_1
[0005d5fe] 4240                      clr.w      d0
[0005d600] 6000 0274                 bra        Aev_message_2
Aev_message_1:
[0005d604] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005d60a] 2028 02a8                 move.l     680(a0),d0
[0005d60e] 6710                      beq.s      Aev_message_3
[0005d610] 206f 0024                 movea.l    36(a7),a0
[0005d614] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005d61a] 2269 02a8                 movea.l    680(a1),a1
[0005d61e] 4e91                      jsr        (a1)
Aev_message_3:
[0005d620] 206f 0024                 movea.l    36(a7),a0
[0005d624] 0c50 0029                 cmpi.w     #$0029,(a0)
[0005d628] 660c                      bne.s      Aev_message_4
[0005d62a] 91c8                      suba.l     a0,a0
[0005d62c] 4eb9 0005 ead4            jsr        Aev_GetAcClose
[0005d632] 6000 0242                 bra        Aev_message_2
Aev_message_4:
[0005d636] 487a ff98                 pea.l      P2IntCmp(pc)
[0005d63a] 720e                      moveq.l    #14,d1
[0005d63c] 3039 000e 17e6            move.w     MsgListeLen,d0
[0005d642] 48c0                      ext.l      d0
[0005d644] 43f9 000e 1482            lea.l      MsgListe,a1
[0005d64a] 206f 0028                 movea.l    40(a7),a0
[0005d64e] 4eb9 0008 10a4            jsr        bsearch
[0005d654] 584f                      addq.w     #4,a7
[0005d656] 2f48 0020                 move.l     a0,32(a7)
[0005d65a] 202f 0020                 move.l     32(a7),d0
[0005d65e] 6700 01ee                 beq        Aev_message_5
[0005d662] 721e                      moveq.l    #30,d1
[0005d664] 4240                      clr.w      d0
[0005d666] 41ef 0002                 lea.l      2(a7),a0
[0005d66a] 4eb9 0008 36ea            jsr        memset
[0005d670] 2f6f 0024 0002            move.l     36(a7),2(a7)
[0005d676] 206f 0020                 movea.l    32(a7),a0
[0005d67a] 1028 000b                 move.b     11(a0),d0
[0005d67e] 4880                      ext.w      d0
[0005d680] 5340                      subq.w     #1,d0
[0005d682] 6706                      beq.s      Aev_message_6
[0005d684] 5340                      subq.w     #1,d0
[0005d686] 670e                      beq.s      Aev_message_7
[0005d688] 6032                      bra.s      Aev_message_8
Aev_message_6:
[0005d68a] 4eb9 0005 5c5a            jsr        Awi_ontop
[0005d690] 2f48 000e                 move.l     a0,14(a7)
[0005d694] 602a                      bra.s      Aev_message_9
Aev_message_7:
[0005d696] 486f 001c                 pea.l      28(a7)
[0005d69a] 486f 001e                 pea.l      30(a7)
[0005d69e] 486f 001e                 pea.l      30(a7)
[0005d6a2] 486f 001e                 pea.l      30(a7)
[0005d6a6] 43ef 001e                 lea.l      30(a7),a1
[0005d6aa] 206f 0034                 movea.l    52(a7),a0
[0005d6ae] 4eb9 0005 deaa            jsr        dd_find_dest
[0005d6b4] 4fef 0010                 lea.l      16(a7),a7
[0005d6b8] 3e80                      move.w     d0,(a7)
[0005d6ba] 6004                      bra.s      Aev_message_9
Aev_message_8:
[0005d6bc] 42af 000e                 clr.l      14(a7)
Aev_message_9:
[0005d6c0] 202f 000e                 move.l     14(a7),d0
[0005d6c4] 666c                      bne.s      Aev_message_10
[0005d6c6] 206f 0020                 movea.l    32(a7),a0
[0005d6ca] 1028 0006                 move.b     6(a0),d0
[0005d6ce] 6b62                      bmi.s      Aev_message_10
[0005d6d0] 206f 0020                 movea.l    32(a7),a0
[0005d6d4] 1028 0006                 move.b     6(a0),d0
[0005d6d8] 4880                      ext.w      d0
[0005d6da] 48c0                      ext.l      d0
[0005d6dc] d080                      add.l      d0,d0
[0005d6de] 206f 0024                 movea.l    36(a7),a0
[0005d6e2] 3030 0800                 move.w     0(a0,d0.l),d0
[0005d6e6] 6b4a                      bmi.s      Aev_message_10
[0005d6e8] 206f 0020                 movea.l    32(a7),a0
[0005d6ec] 1228 0006                 move.b     6(a0),d1
[0005d6f0] 4881                      ext.w      d1
[0005d6f2] 48c1                      ext.l      d1
[0005d6f4] d281                      add.l      d1,d1
[0005d6f6] 206f 0024                 movea.l    36(a7),a0
[0005d6fa] 3030 1800                 move.w     0(a0,d1.l),d0
[0005d6fe] 4eb9 0005 5e68            jsr        Awi_wid
[0005d704] 2f48 000e                 move.l     a0,14(a7)
[0005d708] 202f 000e                 move.l     14(a7),d0
[0005d70c] 6606                      bne.s      Aev_message_11
[0005d70e] 4240                      clr.w      d0
[0005d710] 6000 0164                 bra        Aev_message_2
Aev_message_11:
[0005d714] 7002                      moveq.l    #2,d0
[0005d716] 206f 000e                 movea.l    14(a7),a0
[0005d71a] c068 0056                 and.w      86(a0),d0
[0005d71e] 660a                      bne.s      Aev_message_12
[0005d720] 206f 0024                 movea.l    36(a7),a0
[0005d724] 0c50 0015                 cmpi.w     #$0015,(a0)
[0005d728] 6606                      bne.s      Aev_message_13
Aev_message_12:
[0005d72a] 4eb9 0005 1388            jsr        Awi_diaend
Aev_message_13:
[0005d730] 6010                      bra.s      Aev_message_14
Aev_message_10:
[0005d732] 202f 000e                 move.l     14(a7),d0
[0005d736] 660a                      bne.s      Aev_message_14
[0005d738] 4eb9 0005 5e8c            jsr        Awi_root
[0005d73e] 2f48 000e                 move.l     a0,14(a7)
Aev_message_14:
[0005d742] 206f 0020                 movea.l    32(a7),a0
[0005d746] 1028 0007                 move.b     7(a0),d0
[0005d74a] 6b18                      bmi.s      Aev_message_15
[0005d74c] 206f 0020                 movea.l    32(a7),a0
[0005d750] 1028 0007                 move.b     7(a0),d0
[0005d754] 4880                      ext.w      d0
[0005d756] 48c0                      ext.l      d0
[0005d758] d080                      add.l      d0,d0
[0005d75a] 206f 0024                 movea.l    36(a7),a0
[0005d75e] 3030 0800                 move.w     0(a0,d0.l),d0
[0005d762] 600a                      bra.s      Aev_message_16
Aev_message_15:
[0005d764] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005d76a] 3028 0008                 move.w     8(a0),d0
Aev_message_16:
[0005d76e] 3f40 0006                 move.w     d0,6(a7)
[0005d772] 206f 0020                 movea.l    32(a7),a0
[0005d776] 1028 0008                 move.b     8(a0),d0
[0005d77a] 6b18                      bmi.s      Aev_message_17
[0005d77c] 206f 0020                 movea.l    32(a7),a0
[0005d780] 1028 0008                 move.b     8(a0),d0
[0005d784] 4880                      ext.w      d0
[0005d786] 48c0                      ext.l      d0
[0005d788] d080                      add.l      d0,d0
[0005d78a] 206f 0024                 movea.l    36(a7),a0
[0005d78e] 3030 0800                 move.w     0(a0,d0.l),d0
[0005d792] 600a                      bra.s      Aev_message_18
Aev_message_17:
[0005d794] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005d79a] 3028 000a                 move.w     10(a0),d0
Aev_message_18:
[0005d79e] 3f40 0008                 move.w     d0,8(a7)
[0005d7a2] 206f 0020                 movea.l    32(a7),a0
[0005d7a6] 1028 0009                 move.b     9(a0),d0
[0005d7aa] 6b18                      bmi.s      Aev_message_19
[0005d7ac] 206f 0020                 movea.l    32(a7),a0
[0005d7b0] 1028 0009                 move.b     9(a0),d0
[0005d7b4] 4880                      ext.w      d0
[0005d7b6] 48c0                      ext.l      d0
[0005d7b8] d080                      add.l      d0,d0
[0005d7ba] 206f 0024                 movea.l    36(a7),a0
[0005d7be] 3030 0800                 move.w     0(a0,d0.l),d0
[0005d7c2] 600a                      bra.s      Aev_message_20
Aev_message_19:
[0005d7c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005d7ca] 3028 000c                 move.w     12(a0),d0
Aev_message_20:
[0005d7ce] 3f40 000a                 move.w     d0,10(a7)
[0005d7d2] 206f 0020                 movea.l    32(a7),a0
[0005d7d6] 1028 000a                 move.b     10(a0),d0
[0005d7da] 6b18                      bmi.s      Aev_message_21
[0005d7dc] 206f 0020                 movea.l    32(a7),a0
[0005d7e0] 1028 000a                 move.b     10(a0),d0
[0005d7e4] 4880                      ext.w      d0
[0005d7e6] 48c0                      ext.l      d0
[0005d7e8] d080                      add.l      d0,d0
[0005d7ea] 206f 0024                 movea.l    36(a7),a0
[0005d7ee] 3030 0800                 move.w     0(a0,d0.l),d0
[0005d7f2] 600a                      bra.s      Aev_message_22
Aev_message_21:
[0005d7f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005d7fa] 3028 000e                 move.w     14(a0),d0
Aev_message_22:
[0005d7fe] 3f40 000c                 move.w     d0,12(a7)
[0005d802] 206f 0020                 movea.l    32(a7),a0
[0005d806] 3028 000c                 move.w     12(a0),d0
[0005d80a] 6b18                      bmi.s      Aev_message_23
[0005d80c] 206f 0020                 movea.l    32(a7),a0
[0005d810] 3028 000c                 move.w     12(a0),d0
[0005d814] 48c0                      ext.l      d0
[0005d816] d080                      add.l      d0,d0
[0005d818] 206f 0024                 movea.l    36(a7),a0
[0005d81c] 3f70 0800 001e            move.w     0(a0,d0.l),30(a7)
[0005d822] 6004                      bra.s      Aev_message_24
Aev_message_23:
[0005d824] 426f 001e                 clr.w      30(a7)
Aev_message_24:
[0005d828] 206f 0020                 movea.l    32(a7),a0
[0005d82c] 2028 0002                 move.l     2(a0),d0
[0005d830] 6716                      beq.s      Aev_message_25
[0005d832] 3017                      move.w     (a7),d0
[0005d834] 6712                      beq.s      Aev_message_25
[0005d836] 41ef 0002                 lea.l      2(a7),a0
[0005d83a] 226f 0020                 movea.l    32(a7),a1
[0005d83e] 2269 0002                 movea.l    2(a1),a1
[0005d842] 4e91                      jsr        (a1)
[0005d844] 3e80                      move.w     d0,(a7)
[0005d846] 6004                      bra.s      Aev_message_26
Aev_message_25:
[0005d848] 3ebc 0001                 move.w     #$0001,(a7)
Aev_message_26:
[0005d84c] 6020                      bra.s      Aev_message_27
Aev_message_5:
[0005d84e] 4eb9 0005 5e8c            jsr        Awi_root
[0005d854] 2f48 000e                 move.l     a0,14(a7)
[0005d858] 226f 0024                 movea.l    36(a7),a1
[0005d85c] 701b                      moveq.l    #27,d0
[0005d85e] 206f 000e                 movea.l    14(a7),a0
[0005d862] 246f 000e                 movea.l    14(a7),a2
[0005d866] 246a 0004                 movea.l    4(a2),a2
[0005d86a] 4e92                      jsr        (a2)
[0005d86c] 3e80                      move.w     d0,(a7)
Aev_message_27:
[0005d86e] 4eb9 0005 147c            jsr        Awi_diastart
[0005d874] 3017                      move.w     (a7),d0
Aev_message_2:
[0005d876] 4fef 0028                 lea.l      40(a7),a7
[0005d87a] 245f                      movea.l    (a7)+,a2
[0005d87c] 4e75                      rts

Aev_CmpMsgInList:
[0005d87e] 4fef fff6                 lea.l      -10(a7),a7
[0005d882] 2f48 0006                 move.l     a0,6(a7)
[0005d886] 2f49 0002                 move.l     a1,2(a7)
[0005d88a] 206f 0006                 movea.l    6(a7),a0
[0005d88e] 3010                      move.w     (a0),d0
[0005d890] 206f 0002                 movea.l    2(a7),a0
[0005d894] b050                      cmp.w      (a0),d0
[0005d896] 6704                      beq.s      Aev_CmpMsgInList_1
[0005d898] 4240                      clr.w      d0
[0005d89a] 6042                      bra.s      Aev_CmpMsgInList_2
Aev_CmpMsgInList_1:
[0005d89c] 4257                      clr.w      (a7)
[0005d89e] 6036                      bra.s      Aev_CmpMsgInList_3
Aev_CmpMsgInList_5:
[0005d8a0] 3017                      move.w     (a7),d0
[0005d8a2] 48c0                      ext.l      d0
[0005d8a4] e588                      lsl.l      #2,d0
[0005d8a6] 206f 0006                 movea.l    6(a7),a0
[0005d8aa] 2030 0804                 move.l     4(a0,d0.l),d0
[0005d8ae] 6724                      beq.s      Aev_CmpMsgInList_4
[0005d8b0] 3017                      move.w     (a7),d0
[0005d8b2] 48c0                      ext.l      d0
[0005d8b4] d080                      add.l      d0,d0
[0005d8b6] 206f 0002                 movea.l    2(a7),a0
[0005d8ba] 3030 080a                 move.w     10(a0,d0.l),d0
[0005d8be] 3217                      move.w     (a7),d1
[0005d8c0] 48c1                      ext.l      d1
[0005d8c2] e589                      lsl.l      #2,d1
[0005d8c4] 206f 0006                 movea.l    6(a7),a0
[0005d8c8] 2070 1804                 movea.l    4(a0,d1.l),a0
[0005d8cc] b050                      cmp.w      (a0),d0
[0005d8ce] 6704                      beq.s      Aev_CmpMsgInList_4
[0005d8d0] 4240                      clr.w      d0
[0005d8d2] 600a                      bra.s      Aev_CmpMsgInList_2
Aev_CmpMsgInList_4:
[0005d8d4] 5257                      addq.w     #1,(a7)
Aev_CmpMsgInList_3:
[0005d8d6] 0c57 0008                 cmpi.w     #$0008,(a7)
[0005d8da] 6dc4                      blt.s      Aev_CmpMsgInList_5
[0005d8dc] 7001                      moveq.l    #1,d0
Aev_CmpMsgInList_2:
[0005d8de] 4fef 000a                 lea.l      10(a7),a7
[0005d8e2] 4e75                      rts

Aev_CmpDestID:
[0005d8e4] 514f                      subq.w     #8,a7
[0005d8e6] 2f48 0004                 move.l     a0,4(a7)
[0005d8ea] 2e89                      move.l     a1,(a7)
[0005d8ec] 206f 0004                 movea.l    4(a7),a0
[0005d8f0] 3010                      move.w     (a0),d0
[0005d8f2] 2057                      movea.l    (a7),a0
[0005d8f4] b050                      cmp.w      (a0),d0
[0005d8f6] 6604                      bne.s      Aev_CmpDestID_1
[0005d8f8] 7001                      moveq.l    #1,d0
[0005d8fa] 6002                      bra.s      Aev_CmpDestID_2
Aev_CmpDestID_1:
[0005d8fc] 4240                      clr.w      d0
Aev_CmpDestID_2:
[0005d8fe] 504f                      addq.w     #8,a7
[0005d900] 4e75                      rts

Aev_SendMsg:
[0005d902] 2f0a                      move.l     a2,-(a7)
[0005d904] 4fef ffec                 lea.l      -20(a7),a7
[0005d908] 3f40 0012                 move.w     d0,18(a7)
[0005d90c] 3f41 0010                 move.w     d1,16(a7)
[0005d910] 2f48 000c                 move.l     a0,12(a7)
[0005d914] 2f49 0008                 move.l     a1,8(a7)
[0005d918] 3f42 0006                 move.w     d2,6(a7)
[0005d91c] 4257                      clr.w      (a7)
[0005d91e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005d924] 226f 000c                 movea.l    12(a7),a1
[0005d928] 3350 0002                 move.w     (a0),2(a1)
[0005d92c] 2279 000e 692a            movea.l    _globl,a1
[0005d932] 206f 000c                 movea.l    12(a7),a0
[0005d936] 7210                      moveq.l    #16,d1
[0005d938] 302f 0012                 move.w     18(a7),d0
[0005d93c] 4eb9 0007 8ae8            jsr        mt_appl_write
[0005d942] 4a40                      tst.w      d0
[0005d944] 6704                      beq.s      Aev_SendMsg_1
[0005d946] 7001                      moveq.l    #1,d0
[0005d948] 6002                      bra.s      Aev_SendMsg_2
Aev_SendMsg_1:
[0005d94a] 4240                      clr.w      d0
Aev_SendMsg_2:
[0005d94c] 3e80                      move.w     d0,(a7)
[0005d94e] 3017                      move.w     (a7),d0
[0005d950] 6700 0090                 beq        Aev_SendMsg_3
[0005d954] 302f 0006                 move.w     6(a7),d0
[0005d958] 6b00 0088                 bmi        Aev_SendMsg_3
[0005d95c] 202f 0008                 move.l     8(a7),d0
[0005d960] 6700 0080                 beq        Aev_SendMsg_3
[0005d964] 701a                      moveq.l    #26,d0
[0005d966] 4eb9 0004 c608            jsr        Ax_malloc
[0005d96c] 2f48 0002                 move.l     a0,2(a7)
[0005d970] 202f 0002                 move.l     2(a7),d0
[0005d974] 6604                      bne.s      Aev_SendMsg_4
[0005d976] 4240                      clr.w      d0
[0005d978] 606a                      bra.s      Aev_SendMsg_5
Aev_SendMsg_4:
[0005d97a] 206f 0002                 movea.l    2(a7),a0
[0005d97e] 30af 0012                 move.w     18(a7),(a0)
[0005d982] 206f 0002                 movea.l    2(a7),a0
[0005d986] 216f 0008 0002            move.l     8(a7),2(a0)
[0005d98c] 206f 0002                 movea.l    2(a7),a0
[0005d990] 316f 0006 0006            move.w     6(a7),6(a0)
[0005d996] 206f 0002                 movea.l    2(a7),a0
[0005d99a] 316f 0010 0008            move.w     16(a7),8(a0)
[0005d9a0] 7010                      moveq.l    #16,d0
[0005d9a2] 226f 000c                 movea.l    12(a7),a1
[0005d9a6] 206f 0002                 movea.l    2(a7),a0
[0005d9aa] 41e8 000a                 lea.l      10(a0),a0
[0005d9ae] 4eb9 0008 3500            jsr        memcpy
[0005d9b4] 226f 0002                 movea.l    2(a7),a1
[0005d9b8] 2079 000d fba6            movea.l    SentMsg,a0
[0005d9be] 2479 000d fba6            movea.l    SentMsg,a2
[0005d9c4] 246a 000c                 movea.l    12(a2),a2
[0005d9c8] 4e92                      jsr        (a2)
[0005d9ca] 5340                      subq.w     #1,d0
[0005d9cc] 6714                      beq.s      Aev_SendMsg_3
[0005d9ce] 226f 000c                 movea.l    12(a7),a1
[0005d9d2] 7004                      moveq.l    #4,d0
[0005d9d4] 206f 0008                 movea.l    8(a7),a0
[0005d9d8] 246f 0008                 movea.l    8(a7),a2
[0005d9dc] 246a 0004                 movea.l    4(a2),a2
[0005d9e0] 4e92                      jsr        (a2)
Aev_SendMsg_3:
[0005d9e2] 3017                      move.w     (a7),d0
Aev_SendMsg_5:
[0005d9e4] 4fef 0014                 lea.l      20(a7),a7
[0005d9e8] 245f                      movea.l    (a7)+,a2
[0005d9ea] 4e75                      rts

Aev_SendMsg2all:
[0005d9ec] 2f0a                      move.l     a2,-(a7)
[0005d9ee] 514f                      subq.w     #8,a7
[0005d9f0] 2f48 0004                 move.l     a0,4(a7)
[0005d9f4] 2e89                      move.l     a1,(a7)
[0005d9f6] 206f 0004                 movea.l    4(a7),a0
[0005d9fa] 3028 0008                 move.w     8(a0),d0
[0005d9fe] 6b28                      bmi.s      Aev_SendMsg2all_1
[0005da00] 206f 0004                 movea.l    4(a7),a0
[0005da04] 3428 0008                 move.w     8(a0),d2
[0005da08] 206f 0004                 movea.l    4(a7),a0
[0005da0c] 2268 0004                 movea.l    4(a0),a1
[0005da10] 206f 0004                 movea.l    4(a7),a0
[0005da14] 2050                      movea.l    (a0),a0
[0005da16] 246f 0004                 movea.l    4(a7),a2
[0005da1a] 322a 000a                 move.w     10(a2),d1
[0005da1e] 2457                      movea.l    (a7),a2
[0005da20] 3012                      move.w     (a2),d0
[0005da22] 6100 fede                 bsr        Aev_SendMsg
[0005da26] 6018                      bra.s      Aev_SendMsg2all_2
Aev_SendMsg2all_1:
[0005da28] 2279 000e 692a            movea.l    _globl,a1
[0005da2e] 206f 0004                 movea.l    4(a7),a0
[0005da32] 2050                      movea.l    (a0),a0
[0005da34] 7210                      moveq.l    #16,d1
[0005da36] 2457                      movea.l    (a7),a2
[0005da38] 3012                      move.w     (a2),d0
[0005da3a] 4eb9 0007 8ae8            jsr        mt_appl_write
Aev_SendMsg2all_2:
[0005da40] 504f                      addq.w     #8,a7
[0005da42] 245f                      movea.l    (a7)+,a2
[0005da44] 4e75                      rts

Aev_SendAllMsg:
[0005da46] 2f0a                      move.l     a2,-(a7)
[0005da48] 4fef ffe8                 lea.l      -24(a7),a7
[0005da4c] 2f48 0014                 move.l     a0,20(a7)
[0005da50] 3f40 0012                 move.w     d0,18(a7)
[0005da54] 2f49 000e                 move.l     a1,14(a7)
[0005da58] 3f41 000c                 move.w     d1,12(a7)
[0005da5c] 2eaf 0014                 move.l     20(a7),(a7)
[0005da60] 2f6f 000e 0004            move.l     14(a7),4(a7)
[0005da66] 3f6f 000c 0008            move.w     12(a7),8(a7)
[0005da6c] 3f6f 0012 000a            move.w     18(a7),10(a7)
[0005da72] 487a ff78                 pea.l      Aev_SendMsg2all(pc)
[0005da76] 42a7                      clr.l      -(a7)
[0005da78] 43ef 0008                 lea.l      8(a7),a1
[0005da7c] 2079 000d fbaa            movea.l    ListOfApps,a0
[0005da82] 2479 000d fbaa            movea.l    ListOfApps,a2
[0005da88] 246a 0040                 movea.l    64(a2),a2
[0005da8c] 4e92                      jsr        (a2)
[0005da8e] 504f                      addq.w     #8,a7
[0005da90] 7001                      moveq.l    #1,d0
[0005da92] 4fef 0018                 lea.l      24(a7),a7
[0005da96] 245f                      movea.l    (a7)+,a2
[0005da98] 4e75                      rts

DDCmpIDs:
[0005da9a] 514f                      subq.w     #8,a7
[0005da9c] 2f48 0004                 move.l     a0,4(a7)
[0005daa0] 2e89                      move.l     a1,(a7)
[0005daa2] 2057                      movea.l    (a7),a0
[0005daa4] 3010                      move.w     (a0),d0
[0005daa6] 206f 0004                 movea.l    4(a7),a0
[0005daaa] b050                      cmp.w      (a0),d0
[0005daac] 6604                      bne.s      DDCmpIDs_1
[0005daae] 7001                      moveq.l    #1,d0
[0005dab0] 6002                      bra.s      DDCmpIDs_2
DDCmpIDs_1:
[0005dab2] 4240                      clr.w      d0
DDCmpIDs_2:
[0005dab4] 504f                      addq.w     #8,a7
[0005dab6] 4e75                      rts

Aev_DDSearch:
[0005dab8] 2f0a                      move.l     a2,-(a7)
[0005daba] 514f                      subq.w     #8,a7
[0005dabc] 3f40 0006                 move.w     d0,6(a7)
[0005dac0] 3f6f 0006 0004            move.w     6(a7),4(a7)
[0005dac6] 487a ffd2                 pea.l      DDCmpIDs(pc)
[0005daca] 43ef 0008                 lea.l      8(a7),a1
[0005dace] 2079 000d fbaa            movea.l    ListOfApps,a0
[0005dad4] 2479 000d fbaa            movea.l    ListOfApps,a2
[0005dada] 246a 0020                 movea.l    32(a2),a2
[0005dade] 4e92                      jsr        (a2)
[0005dae0] 584f                      addq.w     #4,a7
[0005dae2] 2e88                      move.l     a0,(a7)
[0005dae4] 2057                      movea.l    (a7),a0
[0005dae6] 504f                      addq.w     #8,a7
[0005dae8] 245f                      movea.l    (a7)+,a2
[0005daea] 4e75                      rts

Aev_DDAdd:
[0005daec] 2f0a                      move.l     a2,-(a7)
[0005daee] 4fef fff0                 lea.l      -16(a7),a7
[0005daf2] 3f40 000e                 move.w     d0,14(a7)
[0005daf6] 3f41 000c                 move.w     d1,12(a7)
[0005dafa] 2f48 0008                 move.l     a0,8(a7)
[0005dafe] 2f49 0004                 move.l     a1,4(a7)
[0005db02] 0c6f 0002 000c            cmpi.w     #$0002,12(a7)
[0005db08] 670e                      beq.s      Aev_DDAdd_1
[0005db0a] 0c6f 0004 000c            cmpi.w     #$0004,12(a7)
[0005db10] 6706                      beq.s      Aev_DDAdd_1
[0005db12] 4240                      clr.w      d0
[0005db14] 6000 00b0                 bra        Aev_DDAdd_2
Aev_DDAdd_1:
[0005db18] 302f 000e                 move.w     14(a7),d0
[0005db1c] 6100 ff9a                 bsr.w      Aev_DDSearch
[0005db20] 2e88                      move.l     a0,(a7)
[0005db22] 2017                      move.l     (a7),d0
[0005db24] 664c                      bne.s      Aev_DDAdd_3
[0005db26] 7024                      moveq.l    #36,d0
[0005db28] 4eb9 0004 c608            jsr        Ax_malloc
[0005db2e] 2e88                      move.l     a0,(a7)
[0005db30] 2017                      move.l     (a7),d0
[0005db32] 6606                      bne.s      Aev_DDAdd_4
[0005db34] 4240                      clr.w      d0
[0005db36] 6000 008e                 bra        Aev_DDAdd_2
Aev_DDAdd_4:
[0005db3a] 7224                      moveq.l    #36,d1
[0005db3c] 4240                      clr.w      d0
[0005db3e] 2057                      movea.l    (a7),a0
[0005db40] 4eb9 0008 36ea            jsr        memset
[0005db46] 2057                      movea.l    (a7),a0
[0005db48] 30af 000e                 move.w     14(a7),(a0)
[0005db4c] 2257                      movea.l    (a7),a1
[0005db4e] 2079 000d fbaa            movea.l    ListOfApps,a0
[0005db54] 2479 000d fbaa            movea.l    ListOfApps,a2
[0005db5a] 246a 000c                 movea.l    12(a2),a2
[0005db5e] 4e92                      jsr        (a2)
[0005db60] 4a40                      tst.w      d0
[0005db62] 660e                      bne.s      Aev_DDAdd_3
[0005db64] 7024                      moveq.l    #36,d0
[0005db66] 2057                      movea.l    (a7),a0
[0005db68] 4eb9 0004 cc28            jsr        Ax_recycle
[0005db6e] 4240                      clr.w      d0
[0005db70] 6054                      bra.s      Aev_DDAdd_2
Aev_DDAdd_3:
[0005db72] 302f 000c                 move.w     12(a7),d0
[0005db76] 5540                      subq.w     #2,d0
[0005db78] 6706                      beq.s      Aev_DDAdd_5
[0005db7a] 5540                      subq.w     #2,d0
[0005db7c] 6720                      beq.s      Aev_DDAdd_6
[0005db7e] 6044                      bra.s      Aev_DDAdd_7
Aev_DDAdd_5:
[0005db80] 2057                      movea.l    (a7),a0
[0005db82] 00a8 0000 0002 0002       ori.l      #$00000002,2(a0)
[0005db8a] 206f 0008                 movea.l    8(a7),a0
[0005db8e] 2257                      movea.l    (a7),a1
[0005db90] 3350 0006                 move.w     (a0),6(a1)
[0005db94] 2057                      movea.l    (a7),a0
[0005db96] 216f 0004 0008            move.l     4(a7),8(a0)
[0005db9c] 6026                      bra.s      Aev_DDAdd_7
Aev_DDAdd_6:
[0005db9e] 2057                      movea.l    (a7),a0
[0005dba0] 00a8 0000 0004 0002       ori.l      #$00000004,2(a0)
[0005dba8] 7006                      moveq.l    #6,d0
[0005dbaa] 226f 0008                 movea.l    8(a7),a1
[0005dbae] 2057                      movea.l    (a7),a0
[0005dbb0] 41e8 000c                 lea.l      12(a0),a0
[0005dbb4] 4eb9 0008 3500            jsr        memcpy
[0005dbba] 2057                      movea.l    (a7),a0
[0005dbbc] 216f 0004 0012            move.l     4(a7),18(a0)
[0005dbc2] 4e71                      nop
Aev_DDAdd_7:
[0005dbc4] 7001                      moveq.l    #1,d0
Aev_DDAdd_2:
[0005dbc6] 4fef 0010                 lea.l      16(a7),a7
[0005dbca] 245f                      movea.l    (a7)+,a2
[0005dbcc] 4e75                      rts

Aev_DDDelete:
[0005dbce] 2f0a                      move.l     a2,-(a7)
[0005dbd0] 554f                      subq.w     #2,a7
[0005dbd2] 3e80                      move.w     d0,(a7)
[0005dbd4] 487a fec4                 pea.l      DDCmpIDs(pc)
[0005dbd8] 43ef 0004                 lea.l      4(a7),a1
[0005dbdc] 2079 000d fbaa            movea.l    ListOfApps,a0
[0005dbe2] 2479 000d fbaa            movea.l    ListOfApps,a2
[0005dbe8] 246a 0018                 movea.l    24(a2),a2
[0005dbec] 4e92                      jsr        (a2)
[0005dbee] 584f                      addq.w     #4,a7
[0005dbf0] 7201                      moveq.l    #1,d1
[0005dbf2] b280                      cmp.l      d0,d1
[0005dbf4] 6604                      bne.s      Aev_DDDelete_1
[0005dbf6] 7001                      moveq.l    #1,d0
[0005dbf8] 6002                      bra.s      Aev_DDDelete_2
Aev_DDDelete_1:
[0005dbfa] 4240                      clr.w      d0
Aev_DDDelete_2:
[0005dbfc] 544f                      addq.w     #2,a7
[0005dbfe] 245f                      movea.l    (a7)+,a2
[0005dc00] 4e75                      rts

Aev_DDRemove:
[0005dc02] 594f                      subq.w     #4,a7
[0005dc04] 2e88                      move.l     a0,(a7)
[0005dc06] 7002                      moveq.l    #2,d0
[0005dc08] 2057                      movea.l    (a7),a0
[0005dc0a] c0a8 0002                 and.l      2(a0),d0
[0005dc0e] 670e                      beq.s      Aev_DDRemove_1
[0005dc10] 72ff                      moveq.l    #-1,d1
[0005dc12] 91c8                      suba.l     a0,a0
[0005dc14] 2257                      movea.l    (a7),a1
[0005dc16] 3011                      move.w     (a1),d0
[0005dc18] 4eb9 0005 f6f0            jsr        Aev_AccExit
Aev_DDRemove_1:
[0005dc1e] 7004                      moveq.l    #4,d0
[0005dc20] 2057                      movea.l    (a7),a0
[0005dc22] c0a8 0002                 and.l      2(a0),d0
[0005dc26] 670e                      beq.s      Aev_DDRemove_2
[0005dc28] 72ff                      moveq.l    #-1,d1
[0005dc2a] 91c8                      suba.l     a0,a0
[0005dc2c] 2257                      movea.l    (a7),a1
[0005dc2e] 3011                      move.w     (a1),d0
[0005dc30] 4eb9 0005 fca0            jsr        Aev_AvExit
Aev_DDRemove_2:
[0005dc36] 2057                      movea.l    (a7),a0
[0005dc38] 41e8 0016                 lea.l      22(a0),a0
[0005dc3c] 4eb9 0005 ecce            jsr        XAccDataDelete
[0005dc42] 2057                      movea.l    (a7),a0
[0005dc44] 2068 0020                 movea.l    32(a0),a0
[0005dc48] 4eb9 0005 f8dc            jsr        VaDataDelete
[0005dc4e] 7024                      moveq.l    #36,d0
[0005dc50] 2057                      movea.l    (a7),a0
[0005dc52] 4eb9 0004 cc28            jsr        Ax_recycle
[0005dc58] 7001                      moveq.l    #1,d0
[0005dc5a] 584f                      addq.w     #4,a7
[0005dc5c] 4e75                      rts

Ash_chkDDtype:
[0005dc5e] 514f                      subq.w     #8,a7
[0005dc60] 2f48 0004                 move.l     a0,4(a7)
[0005dc64] 2e89                      move.l     a1,(a7)
[0005dc66] 206f 0004                 movea.l    4(a7),a0
[0005dc6a] 0c50 0002                 cmpi.w     #$0002,(a0)
[0005dc6e] 670a                      beq.s      Ash_chkDDtype_1
[0005dc70] 206f 0004                 movea.l    4(a7),a0
[0005dc74] 0c50 0004                 cmpi.w     #$0004,(a0)
[0005dc78] 660e                      bne.s      Ash_chkDDtype_2
Ash_chkDDtype_1:
[0005dc7a] 2057                      movea.l    (a7),a0
[0005dc7c] 3028 0004                 move.w     4(a0),d0
[0005dc80] 206f 0004                 movea.l    4(a7),a0
[0005dc84] c050                      and.w      (a0),d0
[0005dc86] 6002                      bra.s      Ash_chkDDtype_3
Ash_chkDDtype_2:
[0005dc88] 4240                      clr.w      d0
Ash_chkDDtype_3:
[0005dc8a] 504f                      addq.w     #8,a7
[0005dc8c] 4e75                      rts

Ash_sendall:
[0005dc8e] 2f0a                      move.l     a2,-(a7)
[0005dc90] 4fef ffe8                 lea.l      -24(a7),a7
[0005dc94] 2f48 0014                 move.l     a0,20(a7)
[0005dc98] 2f40 0010                 move.l     d0,16(a7)
[0005dc9c] 202f 0010                 move.l     16(a7),d0
[0005dca0] 6a00 008c                 bpl        Ash_sendall_1
[0005dca4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005dcaa] 2068 0280                 movea.l    640(a0),a0
[0005dcae] 0c50 0400                 cmpi.w     #$0400,(a0)
[0005dcb2] 6c0a                      bge.s      Ash_sendall_2
[0005dcb4] 0c79 0200 0010 f55c       cmpi.w     #$0200,_ACSv_magix
[0005dcbc] 6d70                      blt.s      Ash_sendall_1
Ash_sendall_2:
[0005dcbe] 2f39 000e 692a            move.l     _globl,-(a7)
[0005dcc4] 486f 000e                 pea.l      14(a7)
[0005dcc8] 43ef 0014                 lea.l      20(a7),a1
[0005dccc] 41ef 0008                 lea.l      8(a7),a0
[0005dcd0] 4240                      clr.w      d0
[0005dcd2] 4eb9 0007 8cd2            jsr        mt_appl_search
[0005dcd8] 504f                      addq.w     #8,a7
[0005dcda] 3f40 000e                 move.w     d0,14(a7)
[0005dcde] 6046                      bra.s      Ash_sendall_3
Ash_sendall_6:
[0005dce0] 7006                      moveq.l    #6,d0
[0005dce2] c06f 000c                 and.w      12(a7),d0
[0005dce6] 671e                      beq.s      Ash_sendall_4
[0005dce8] 2279 000e 692a            movea.l    _globl,a1
[0005dcee] 206f 0014                 movea.l    20(a7),a0
[0005dcf2] 7210                      moveq.l    #16,d1
[0005dcf4] 302f 000a                 move.w     10(a7),d0
[0005dcf8] 4eb9 0007 8ae8            jsr        mt_appl_write
[0005dcfe] 4a40                      tst.w      d0
[0005dd00] 6604                      bne.s      Ash_sendall_4
[0005dd02] 4240                      clr.w      d0
[0005dd04] 604a                      bra.s      Ash_sendall_5
Ash_sendall_4:
[0005dd06] 2f39 000e 692a            move.l     _globl,-(a7)
[0005dd0c] 486f 000e                 pea.l      14(a7)
[0005dd10] 43ef 0014                 lea.l      20(a7),a1
[0005dd14] 41ef 0008                 lea.l      8(a7),a0
[0005dd18] 7001                      moveq.l    #1,d0
[0005dd1a] 4eb9 0007 8cd2            jsr        mt_appl_search
[0005dd20] 504f                      addq.w     #8,a7
[0005dd22] 3f40 000e                 move.w     d0,14(a7)
Ash_sendall_3:
[0005dd26] 302f 000e                 move.w     14(a7),d0
[0005dd2a] 66b4                      bne.s      Ash_sendall_6
[0005dd2c] 6020                      bra.s      Ash_sendall_7
Ash_sendall_1:
[0005dd2e] 487a fcbc                 pea.l      Aev_SendMsg2all(pc)
[0005dd32] 487a ff2a                 pea.l      Ash_chkDDtype(pc)
[0005dd36] 43ef 0018                 lea.l      24(a7),a1
[0005dd3a] 2079 000d fbaa            movea.l    ListOfApps,a0
[0005dd40] 2479 000d fbaa            movea.l    ListOfApps,a2
[0005dd46] 246a 0040                 movea.l    64(a2),a2
[0005dd4a] 4e92                      jsr        (a2)
[0005dd4c] 504f                      addq.w     #8,a7
Ash_sendall_7:
[0005dd4e] 7001                      moveq.l    #1,d0
Ash_sendall_5:
[0005dd50] 4fef 0018                 lea.l      24(a7),a7
[0005dd54] 245f                      movea.l    (a7)+,a2
[0005dd56] 4e75                      rts

Ash_nextdd:
[0005dd58] 594f                      subq.w     #4,a7
[0005dd5a] 2e88                      move.l     a0,(a7)
[0005dd5c] 2017                      move.l     (a7),d0
[0005dd5e] 6616                      bne.s      Ash_nextdd_1
[0005dd60] 2079 000d fbaa            movea.l    ListOfApps,a0
[0005dd66] 2279 000d fbaa            movea.l    ListOfApps,a1
[0005dd6c] 2269 0024                 movea.l    36(a1),a1
[0005dd70] 4e91                      jsr        (a1)
[0005dd72] 601a                      bra.s      Ash_nextdd_2
[0005dd74] 6018                      bra.s      Ash_nextdd_2
Ash_nextdd_1:
[0005dd76] 7201                      moveq.l    #1,d1
[0005dd78] 7001                      moveq.l    #1,d0
[0005dd7a] 2079 000d fbaa            movea.l    ListOfApps,a0
[0005dd80] 2279 000d fbaa            movea.l    ListOfApps,a1
[0005dd86] 2269 0034                 movea.l    52(a1),a1
[0005dd8a] 4e91                      jsr        (a1)
[0005dd8c] 4e71                      nop
Ash_nextdd_2:
[0005dd8e] 584f                      addq.w     #4,a7
[0005dd90] 4e75                      rts

dd_exec:
[0005dd92] 2f0a                      move.l     a2,-(a7)
[0005dd94] 4fef ffdc                 lea.l      -36(a7),a7
[0005dd98] 2f48 001e                 move.l     a0,30(a7)
[0005dd9c] 2f49 001a                 move.l     a1,26(a7)
[0005dda0] 3f40 0018                 move.w     d0,24(a7)
[0005dda4] 202f 001e                 move.l     30(a7),d0
[0005dda8] 6604                      bne.s      dd_exec_1
[0005ddaa] 6000 00f6                 bra        dd_exec_2
dd_exec_1:
[0005ddae] 202f 002c                 move.l     44(a7),d0
[0005ddb2] 670a                      beq.s      dd_exec_3
[0005ddb4] 206f 002c                 movea.l    44(a7),a0
[0005ddb8] 2028 0004                 move.l     4(a0),d0
[0005ddbc] 660a                      bne.s      dd_exec_4
dd_exec_3:
[0005ddbe] 302f 0018                 move.w     24(a7),d0
[0005ddc2] 6b04                      bmi.s      dd_exec_4
[0005ddc4] 6000 00dc                 bra        dd_exec_2
dd_exec_4:
[0005ddc8] 4eb9 0004 810e            jsr        Adr_unselect
[0005ddce] 41d7                      lea.l      (a7),a0
[0005ddd0] 4eb9 0006 bf9e            jsr        Act_save
[0005ddd6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005dddc] 216f 001e 0258            move.l     30(a7),600(a0)
[0005dde2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005dde8] 316f 0018 0260            move.w     24(a7),608(a0)
[0005ddee] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ddf4] 216f 001a 025c            move.l     26(a7),604(a0)
[0005ddfa] 7002                      moveq.l    #2,d0
[0005ddfc] 41f9 000d f9c0            lea.l      _WDD,a0
[0005de02] 4eb9 0004 7e6a            jsr        Adr_add
[0005de08] 206f 001a                 movea.l    26(a7),a0
[0005de0c] 3028 0008                 move.w     8(a0),d0
[0005de10] c07c 0800                 and.w      #$0800,d0
[0005de14] 661c                      bne.s      dd_exec_5
[0005de16] 7201                      moveq.l    #1,d1
[0005de18] 206f 001a                 movea.l    26(a7),a0
[0005de1c] 8268 000a                 or.w       10(a0),d1
[0005de20] 302f 0018                 move.w     24(a7),d0
[0005de24] 206f 001e                 movea.l    30(a7),a0
[0005de28] 226f 001e                 movea.l    30(a7),a1
[0005de2c] 2269 0066                 movea.l    102(a1),a1
[0005de30] 4e91                      jsr        (a1)
dd_exec_5:
[0005de32] 302f 0018                 move.w     24(a7),d0
[0005de36] 6a34                      bpl.s      dd_exec_6
[0005de38] 3f7c 0001 0022            move.w     #$0001,34(a7)
[0005de3e] 43ef 0022                 lea.l      34(a7),a1
[0005de42] 7011                      moveq.l    #17,d0
[0005de44] 206f 001e                 movea.l    30(a7),a0
[0005de48] 246f 001e                 movea.l    30(a7),a2
[0005de4c] 246a 0004                 movea.l    4(a2),a2
[0005de50] 4e92                      jsr        (a2)
[0005de52] 302f 0022                 move.w     34(a7),d0
[0005de56] 6712                      beq.s      dd_exec_7
[0005de58] 93c9                      suba.l     a1,a1
[0005de5a] 7010                      moveq.l    #16,d0
[0005de5c] 206f 001e                 movea.l    30(a7),a0
[0005de60] 246f 001e                 movea.l    30(a7),a2
[0005de64] 246a 0004                 movea.l    4(a2),a2
[0005de68] 4e92                      jsr        (a2)
dd_exec_7:
[0005de6a] 600a                      bra.s      dd_exec_8
dd_exec_6:
[0005de6c] 206f 002c                 movea.l    44(a7),a0
[0005de70] 2068 0004                 movea.l    4(a0),a0
[0005de74] 4e90                      jsr        (a0)
dd_exec_8:
[0005de76] 206f 001a                 movea.l    26(a7),a0
[0005de7a] 3228 000a                 move.w     10(a0),d1
[0005de7e] c27c fffe                 and.w      #$FFFE,d1
[0005de82] 302f 0018                 move.w     24(a7),d0
[0005de86] 206f 001e                 movea.l    30(a7),a0
[0005de8a] 226f 001e                 movea.l    30(a7),a1
[0005de8e] 2269 0066                 movea.l    102(a1),a1
[0005de92] 4e91                      jsr        (a1)
[0005de94] 4eb9 0004 810e            jsr        Adr_unselect
[0005de9a] 41d7                      lea.l      (a7),a0
[0005de9c] 4eb9 0006 c00a            jsr        Act_restore
dd_exec_2:
[0005dea2] 4fef 0024                 lea.l      36(a7),a7
[0005dea6] 245f                      movea.l    (a7)+,a2
[0005dea8] 4e75                      rts

dd_find_dest:
[0005deaa] 4fef ffdc                 lea.l      -36(a7),a7
[0005deae] 2f48 0020                 move.l     a0,32(a7)
[0005deb2] 2f49 001c                 move.l     a1,28(a7)
[0005deb6] 4eb9 0005 5e8c            jsr        Awi_root
[0005debc] 2f48 0010                 move.l     a0,16(a7)
[0005dec0] 42a7                      clr.l      -(a7)
[0005dec2] 42a7                      clr.l      -(a7)
[0005dec4] 42a7                      clr.l      -(a7)
[0005dec6] 486f 0024                 pea.l      36(a7)
[0005deca] 720a                      moveq.l    #10,d1
[0005decc] 4240                      clr.w      d0
[0005dece] 4eb9 0007 f7ba            jsr        wind_get
[0005ded4] 4fef 0010                 lea.l      16(a7),a7
[0005ded8] 206f 0020                 movea.l    32(a7),a0
[0005dedc] 0c50 003f                 cmpi.w     #$003F,(a0)
[0005dee0] 6616                      bne.s      dd_find_dest_1
[0005dee2] 206f 0020                 movea.l    32(a7),a0
[0005dee6] 3f68 0008 0016            move.w     8(a0),22(a7)
[0005deec] 206f 0020                 movea.l    32(a7),a0
[0005def0] 3f68 000a 0014            move.w     10(a0),20(a7)
[0005def6] 6018                      bra.s      dd_find_dest_2
dd_find_dest_1:
[0005def8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005defe] 3f68 0262 0016            move.w     610(a0),22(a7)
[0005df04] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005df0a] 3f68 0264 0014            move.w     612(a0),20(a7)
dd_find_dest_2:
[0005df10] 206f 0020                 movea.l    32(a7),a0
[0005df14] 0c50 003f                 cmpi.w     #$003F,(a0)
[0005df18] 6610                      bne.s      dd_find_dest_3
[0005df1a] 206f 0020                 movea.l    32(a7),a0
[0005df1e] 3028 0006                 move.w     6(a0),d0
[0005df22] 4eb9 0005 5e68            jsr        Awi_wid
[0005df28] 601a                      bra.s      dd_find_dest_4
dd_find_dest_3:
[0005df2a] 2079 000e 692a            movea.l    _globl,a0
[0005df30] 322f 0014                 move.w     20(a7),d1
[0005df34] 302f 0016                 move.w     22(a7),d0
[0005df38] 4eb9 0007 b81c            jsr        mt_wind_find
[0005df3e] 4eb9 0005 5e68            jsr        Awi_wid
dd_find_dest_4:
[0005df44] 2f48 000c                 move.l     a0,12(a7)
[0005df48] 202f 000c                 move.l     12(a7),d0
[0005df4c] 6614                      bne.s      dd_find_dest_5
[0005df4e] 206f 0020                 movea.l    32(a7),a0
[0005df52] 0c50 003f                 cmpi.w     #$003F,(a0)
[0005df56] 670a                      beq.s      dd_find_dest_5
[0005df58] 4eb9 0005 5c5a            jsr        Awi_ontop
[0005df5e] 2f48 000c                 move.l     a0,12(a7)
dd_find_dest_5:
[0005df62] 202f 000c                 move.l     12(a7),d0
[0005df66] 6606                      bne.s      dd_find_dest_6
[0005df68] 2f6f 0010 000c            move.l     16(a7),12(a7)
dd_find_dest_6:
[0005df6e] 206f 000c                 movea.l    12(a7),a0
[0005df72] 3028 0056                 move.w     86(a0),d0
[0005df76] c07c 0800                 and.w      #$0800,d0
[0005df7a] 6706                      beq.s      dd_find_dest_7
[0005df7c] 4240                      clr.w      d0
[0005df7e] 6000 02d6                 bra        dd_find_dest_8
dd_find_dest_7:
[0005df82] 206f 000c                 movea.l    12(a7),a0
[0005df86] 302f 0018                 move.w     24(a7),d0
[0005df8a] b068 0020                 cmp.w      32(a0),d0
[0005df8e] 671e                      beq.s      dd_find_dest_9
[0005df90] 206f 000c                 movea.l    12(a7),a0
[0005df94] b1ef 0010                 cmpa.l     16(a7),a0
[0005df98] 6714                      beq.s      dd_find_dest_9
[0005df9a] 206f 000c                 movea.l    12(a7),a0
[0005df9e] 226f 000c                 movea.l    12(a7),a1
[0005dfa2] 2269 006e                 movea.l    110(a1),a1
[0005dfa6] 4e91                      jsr        (a1)
[0005dfa8] 4eb9 0004 b086            jsr        Aev_mess
dd_find_dest_9:
[0005dfae] 206f 0030                 movea.l    48(a7),a0
[0005dfb2] 30bc ffff                 move.w     #$FFFF,(a0)
[0005dfb6] 206f 0028                 movea.l    40(a7),a0
[0005dfba] 4290                      clr.l      (a0)
[0005dfbc] 206f 000c                 movea.l    12(a7),a0
[0005dfc0] 2028 0014                 move.l     20(a0),d0
[0005dfc4] 6700 00ca                 beq        dd_find_dest_10
[0005dfc8] 302f 0014                 move.w     20(a7),d0
[0005dfcc] 206f 000c                 movea.l    12(a7),a0
[0005dfd0] 9068 0036                 sub.w      54(a0),d0
[0005dfd4] 3f00                      move.w     d0,-(a7)
[0005dfd6] 342f 0018                 move.w     24(a7),d2
[0005dfda] 206f 000e                 movea.l    14(a7),a0
[0005dfde] 9468 0034                 sub.w      52(a0),d2
[0005dfe2] 7208                      moveq.l    #8,d1
[0005dfe4] 4240                      clr.w      d0
[0005dfe6] 206f 000e                 movea.l    14(a7),a0
[0005dfea] 2068 0014                 movea.l    20(a0),a0
[0005dfee] 4eb9 0004 8fd4            jsr        Adr_find
[0005dff4] 544f                      addq.w     #2,a7
[0005dff6] 206f 0030                 movea.l    48(a7),a0
[0005dffa] 3080                      move.w     d0,(a0)
[0005dffc] 206f 0030                 movea.l    48(a7),a0
[0005e000] 3010                      move.w     (a0),d0
[0005e002] 6b00 008c                 bmi        dd_find_dest_10
[0005e006] 206f 0030                 movea.l    48(a7),a0
[0005e00a] 3f50 001a                 move.w     (a0),26(a7)
dd_find_dest_12:
[0005e00e] 322f 001a                 move.w     26(a7),d1
[0005e012] 48c1                      ext.l      d1
[0005e014] 2001                      move.l     d1,d0
[0005e016] d080                      add.l      d0,d0
[0005e018] d081                      add.l      d1,d0
[0005e01a] e788                      lsl.l      #3,d0
[0005e01c] 206f 000c                 movea.l    12(a7),a0
[0005e020] 2068 0014                 movea.l    20(a0),a0
[0005e024] d1c0                      adda.l     d0,a0
[0005e026] 2f48 0008                 move.l     a0,8(a7)
[0005e02a] 7020                      moveq.l    #32,d0
[0005e02c] 206f 0008                 movea.l    8(a7),a0
[0005e030] c068 0008                 and.w      8(a0),d0
[0005e034] 663e                      bne.s      dd_find_dest_11
[0005e036] 206f 0008                 movea.l    8(a7),a0
[0005e03a] 3028 0020                 move.w     32(a0),d0
[0005e03e] c07c 8000                 and.w      #$8000,d0
[0005e042] 6730                      beq.s      dd_find_dest_11
[0005e044] 206f 0008                 movea.l    8(a7),a0
[0005e048] 41e8 0018                 lea.l      24(a0),a0
[0005e04c] 226f 0028                 movea.l    40(a7),a1
[0005e050] 2288                      move.l     a0,(a1)
[0005e052] 206f 0028                 movea.l    40(a7),a0
[0005e056] 2050                      movea.l    (a0),a0
[0005e058] 2028 0004                 move.l     4(a0),d0
[0005e05c] 6716                      beq.s      dd_find_dest_11
[0005e05e] 206f 0030                 movea.l    48(a7),a0
[0005e062] 30af 001a                 move.w     26(a7),(a0)
[0005e066] 206f 000c                 movea.l    12(a7),a0
[0005e06a] 226f 002c                 movea.l    44(a7),a1
[0005e06e] 22a8 0014                 move.l     20(a0),(a1)
[0005e072] 601c                      bra.s      dd_find_dest_10
dd_find_dest_11:
[0005e074] 302f 001a                 move.w     26(a7),d0
[0005e078] 206f 000c                 movea.l    12(a7),a0
[0005e07c] 2068 0014                 movea.l    20(a0),a0
[0005e080] 4eb9 0005 0f3a            jsr        Aob_up
[0005e086] 3f40 001a                 move.w     d0,26(a7)
[0005e08a] 5240                      addq.w     #1,d0
[0005e08c] 6600 ff80                 bne.w      dd_find_dest_12
dd_find_dest_10:
[0005e090] 206f 0030                 movea.l    48(a7),a0
[0005e094] 3010                      move.w     (a0),d0
[0005e096] 6a00 00de                 bpl        dd_find_dest_13
[0005e09a] 206f 000c                 movea.l    12(a7),a0
[0005e09e] 2028 0018                 move.l     24(a0),d0
[0005e0a2] 6700 00d2                 beq        dd_find_dest_13
[0005e0a6] 302f 0014                 move.w     20(a7),d0
[0005e0aa] 206f 000c                 movea.l    12(a7),a0
[0005e0ae] 9068 0036                 sub.w      54(a0),d0
[0005e0b2] 3f00                      move.w     d0,-(a7)
[0005e0b4] 342f 0018                 move.w     24(a7),d2
[0005e0b8] 206f 000e                 movea.l    14(a7),a0
[0005e0bc] 9468 0034                 sub.w      52(a0),d2
[0005e0c0] 7208                      moveq.l    #8,d1
[0005e0c2] 4240                      clr.w      d0
[0005e0c4] 206f 000e                 movea.l    14(a7),a0
[0005e0c8] 2068 0018                 movea.l    24(a0),a0
[0005e0cc] 4eb9 0004 8fd4            jsr        Adr_find
[0005e0d2] 544f                      addq.w     #2,a7
[0005e0d4] 206f 0030                 movea.l    48(a7),a0
[0005e0d8] 3080                      move.w     d0,(a0)
[0005e0da] 206f 0030                 movea.l    48(a7),a0
[0005e0de] 3010                      move.w     (a0),d0
[0005e0e0] 6b00 0094                 bmi        dd_find_dest_13
[0005e0e4] 206f 0030                 movea.l    48(a7),a0
[0005e0e8] 3f50 001a                 move.w     (a0),26(a7)
dd_find_dest_16:
[0005e0ec] 322f 001a                 move.w     26(a7),d1
[0005e0f0] 48c1                      ext.l      d1
[0005e0f2] 2001                      move.l     d1,d0
[0005e0f4] d080                      add.l      d0,d0
[0005e0f6] d081                      add.l      d1,d0
[0005e0f8] e788                      lsl.l      #3,d0
[0005e0fa] 206f 000c                 movea.l    12(a7),a0
[0005e0fe] 2068 0018                 movea.l    24(a0),a0
[0005e102] d1c0                      adda.l     d0,a0
[0005e104] 2f48 0008                 move.l     a0,8(a7)
[0005e108] 7020                      moveq.l    #32,d0
[0005e10a] 206f 0008                 movea.l    8(a7),a0
[0005e10e] c068 0008                 and.w      8(a0),d0
[0005e112] 663e                      bne.s      dd_find_dest_14
[0005e114] 206f 0008                 movea.l    8(a7),a0
[0005e118] 3028 0020                 move.w     32(a0),d0
[0005e11c] c07c 8000                 and.w      #$8000,d0
[0005e120] 6730                      beq.s      dd_find_dest_14
[0005e122] 206f 0008                 movea.l    8(a7),a0
[0005e126] 41e8 0018                 lea.l      24(a0),a0
[0005e12a] 226f 0028                 movea.l    40(a7),a1
[0005e12e] 2288                      move.l     a0,(a1)
[0005e130] 206f 0028                 movea.l    40(a7),a0
[0005e134] 2050                      movea.l    (a0),a0
[0005e136] 2028 0004                 move.l     4(a0),d0
[0005e13a] 6716                      beq.s      dd_find_dest_14
[0005e13c] 206f 0030                 movea.l    48(a7),a0
[0005e140] 30af 001a                 move.w     26(a7),(a0)
[0005e144] 206f 000c                 movea.l    12(a7),a0
[0005e148] 226f 002c                 movea.l    44(a7),a1
[0005e14c] 22a8 0018                 move.l     24(a0),(a1)
[0005e150] 601c                      bra.s      dd_find_dest_15
dd_find_dest_14:
[0005e152] 302f 001a                 move.w     26(a7),d0
[0005e156] 206f 000c                 movea.l    12(a7),a0
[0005e15a] 2068 0018                 movea.l    24(a0),a0
[0005e15e] 4eb9 0005 0f3a            jsr        Aob_up
[0005e164] 3f40 001a                 move.w     d0,26(a7)
[0005e168] 5240                      addq.w     #1,d0
[0005e16a] 6600 ff80                 bne.w      dd_find_dest_16
dd_find_dest_15:
[0005e16e] 206f 0030                 movea.l    48(a7),a0
[0005e172] 0050 1000                 ori.w      #$1000,(a0)
dd_find_dest_13:
[0005e176] 206f 0030                 movea.l    48(a7),a0
[0005e17a] 3010                      move.w     (a0),d0
[0005e17c] c07c 0fff                 and.w      #$0FFF,d0
[0005e180] 670c                      beq.s      dd_find_dest_17
[0005e182] 206f 0034                 movea.l    52(a7),a0
[0005e186] 30bc ffff                 move.w     #$FFFF,(a0)
[0005e18a] 6000 00ac                 bra        dd_find_dest_18
dd_find_dest_17:
[0005e18e] 70ff                      moveq.l    #-1,d0
[0005e190] 3f40 001a                 move.w     d0,26(a7)
[0005e194] 206f 0034                 movea.l    52(a7),a0
[0005e198] 3080                      move.w     d0,(a0)
[0005e19a] 6044                      bra.s      dd_find_dest_19
dd_find_dest_21:
[0005e19c] 206f 0034                 movea.l    52(a7),a0
[0005e1a0] 3f50 001a                 move.w     (a0),26(a7)
[0005e1a4] 206f 0034                 movea.l    52(a7),a0
[0005e1a8] 3010                      move.w     (a0),d0
[0005e1aa] 206f 000c                 movea.l    12(a7),a0
[0005e1ae] 2268 0014                 movea.l    20(a0),a1
[0005e1b2] 41d7                      lea.l      (a7),a0
[0005e1b4] 4eb9 0004 fe06            jsr        Aob_offset
[0005e1ba] 322f 0014                 move.w     20(a7),d1
[0005e1be] 206f 000c                 movea.l    12(a7),a0
[0005e1c2] 9268 0036                 sub.w      54(a0),d1
[0005e1c6] 302f 0016                 move.w     22(a7),d0
[0005e1ca] 206f 000c                 movea.l    12(a7),a0
[0005e1ce] 9068 0034                 sub.w      52(a0),d0
[0005e1d2] 41d7                      lea.l      (a7),a0
[0005e1d4] 4eb9 0006 b7a6            jsr        Aob_within
[0005e1da] 4a40                      tst.w      d0
[0005e1dc] 6702                      beq.s      dd_find_dest_19
[0005e1de] 601e                      bra.s      dd_find_dest_20
dd_find_dest_19:
[0005e1e0] 7208                      moveq.l    #8,d1
[0005e1e2] 206f 0034                 movea.l    52(a7),a0
[0005e1e6] 3010                      move.w     (a0),d0
[0005e1e8] 206f 000c                 movea.l    12(a7),a0
[0005e1ec] 2068 0014                 movea.l    20(a0),a0
[0005e1f0] 4eb9 0005 0e62            jsr        Aob_findflag
[0005e1f6] 206f 0034                 movea.l    52(a7),a0
[0005e1fa] 3080                      move.w     d0,(a0)
[0005e1fc] 6a9e                      bpl.s      dd_find_dest_21
dd_find_dest_20:
[0005e1fe] 206f 0034                 movea.l    52(a7),a0
[0005e202] 3010                      move.w     (a0),d0
[0005e204] 6b32                      bmi.s      dd_find_dest_18
[0005e206] 206f 000c                 movea.l    12(a7),a0
[0005e20a] 3028 001c                 move.w     28(a0),d0
[0005e20e] 206f 0034                 movea.l    52(a7),a0
[0005e212] b050                      cmp.w      (a0),d0
[0005e214] 6722                      beq.s      dd_find_dest_18
[0005e216] 4eb9 0005 1388            jsr        Awi_diaend
[0005e21c] 206f 0034                 movea.l    52(a7),a0
[0005e220] 226f 000c                 movea.l    12(a7),a1
[0005e224] 3350 001c                 move.w     (a0),28(a1)
[0005e228] 206f 000c                 movea.l    12(a7),a0
[0005e22c] 317c ffff 001e            move.w     #$FFFF,30(a0)
[0005e232] 4eb9 0005 147c            jsr        Awi_diastart
dd_find_dest_18:
[0005e238] 206f 001c                 movea.l    28(a7),a0
[0005e23c] 20af 000c                 move.l     12(a7),(a0)
[0005e240] 206f 0030                 movea.l    48(a7),a0
[0005e244] 3010                      move.w     (a0),d0
[0005e246] c07c 0fff                 and.w      #$0FFF,d0
[0005e24a] 6a06                      bpl.s      dd_find_dest_22
[0005e24c] 4240                      clr.w      d0
[0005e24e] 6006                      bra.s      dd_find_dest_8
[0005e250] 6004                      bra.s      dd_find_dest_8
dd_find_dest_22:
[0005e252] 7001                      moveq.l    #1,d0
[0005e254] 4e71                      nop
dd_find_dest_8:
[0005e256] 4fef 0024                 lea.l      36(a7),a7
[0005e25a] 4e75                      rts

GetImgIntoObj:
[0005e25c] 4fef ffee                 lea.l      -18(a7),a7
[0005e260] 2f48 000e                 move.l     a0,14(a7)
[0005e264] 2f49 000a                 move.l     a1,10(a7)
[0005e268] 3f40 0008                 move.w     d0,8(a7)
[0005e26c] 4240                      clr.w      d0
[0005e26e] 43d7                      lea.l      (a7),a1
[0005e270] 206f 000e                 movea.l    14(a7),a0
[0005e274] 4eb9 0005 5410            jsr        Abp_img2mfdb
[0005e27a] 4a40                      tst.w      d0
[0005e27c] 664a                      bne.s      GetImgIntoObj_1
[0005e27e] 2079 000d f9d4            movea.l    $000DF9D4,a0
[0005e284] 41e8 0048                 lea.l      72(a0),a0
[0005e288] 2f48 0004                 move.l     a0,4(a7)
[0005e28c] 206f 0004                 movea.l    4(a7),a0
[0005e290] 317c 000a 0016            move.w     #$000A,22(a0)
[0005e296] 206f 0004                 movea.l    4(a7),a0
[0005e29a] 2157 000c                 move.l     (a7),12(a0)
[0005e29e] 2f2f 0016                 move.l     22(a7),-(a7)
[0005e2a2] 302f 000c                 move.w     12(a7),d0
[0005e2a6] 226f 001e                 movea.l    30(a7),a1
[0005e2aa] 206f 000e                 movea.l    14(a7),a0
[0005e2ae] 6100 fae2                 bsr        dd_exec
[0005e2b2] 584f                      addq.w     #4,a7
[0005e2b4] 206f 0004                 movea.l    4(a7),a0
[0005e2b8] 4268 0016                 clr.w      22(a0)
[0005e2bc] 206f 0004                 movea.l    4(a7),a0
[0005e2c0] 42a8 000c                 clr.l      12(a0)
[0005e2c4] 7001                      moveq.l    #1,d0
[0005e2c6] 6002                      bra.s      GetImgIntoObj_2
GetImgIntoObj_1:
[0005e2c8] 4240                      clr.w      d0
GetImgIntoObj_2:
[0005e2ca] 4fef 0012                 lea.l      18(a7),a7
[0005e2ce] 4e75                      rts

GetTxtIntoObj:
[0005e2d0] 2f0a                      move.l     a2,-(a7)
[0005e2d2] 4fef fbce                 lea.l      -1074(a7),a7
[0005e2d6] 2f48 0010                 move.l     a0,16(a7)
[0005e2da] 2f49 000c                 move.l     a1,12(a7)
[0005e2de] 3f40 000a                 move.w     d0,10(a7)
[0005e2e2] 3f41 0008                 move.w     d1,8(a7)
[0005e2e6] 2079 000d f9d4            movea.l    $000DF9D4,a0
[0005e2ec] 41e8 0048                 lea.l      72(a0),a0
[0005e2f0] 2f48 0004                 move.l     a0,4(a7)
[0005e2f4] 202f 043e                 move.l     1086(a7),d0
[0005e2f8] 6700 0136                 beq        GetTxtIntoObj_1
[0005e2fc] 206f 043e                 movea.l    1086(a7),a0
[0005e300] 2028 0004                 move.l     4(a0),d0
[0005e304] 6700 012a                 beq        GetTxtIntoObj_1
[0005e308] 302f 000a                 move.w     10(a7),d0
[0005e30c] 6b00 0122                 bmi        GetTxtIntoObj_1
[0005e310] 7004                      moveq.l    #4,d0
[0005e312] 43f9 000e 17e8            lea.l      $000E17E8,a1
[0005e318] 206f 000c                 movea.l    12(a7),a0
[0005e31c] 4eb9 0008 2fb8            jsr        strncmp
[0005e322] 4a40                      tst.w      d0
[0005e324] 6600 007c                 bne.w      GetTxtIntoObj_2
[0005e328] 206f 0010                 movea.l    16(a7),a0
[0005e32c] 4eb9 0004 c366            jsr        Af_parseCmdLine
[0005e332] 2f48 0414                 move.l     a0,1044(a7)
[0005e336] 202f 0414                 move.l     1044(a7),d0
[0005e33a] 6762                      beq.s      GetTxtIntoObj_3
[0005e33c] 206f 0414                 movea.l    1044(a7),a0
[0005e340] 226f 0414                 movea.l    1044(a7),a1
[0005e344] 2269 0024                 movea.l    36(a1),a1
[0005e348] 4e91                      jsr        (a1)
[0005e34a] 2e88                      move.l     a0,(a7)
[0005e34c] 604c                      bra.s      GetTxtIntoObj_4
GetTxtIntoObj_5:
[0005e34e] 2257                      movea.l    (a7),a1
[0005e350] 41ef 0014                 lea.l      20(a7),a0
[0005e354] 4eb9 0004 c1a6            jsr        Af_quote
[0005e35a] 206f 0004                 movea.l    4(a7),a0
[0005e35e] 317c 0014 0016            move.w     #$0014,22(a0)
[0005e364] 41ef 0014                 lea.l      20(a7),a0
[0005e368] 226f 0004                 movea.l    4(a7),a1
[0005e36c] 2348 000c                 move.l     a0,12(a1)
[0005e370] 2f2f 043e                 move.l     1086(a7),-(a7)
[0005e374] 302f 000e                 move.w     14(a7),d0
[0005e378] 226f 0446                 movea.l    1094(a7),a1
[0005e37c] 206f 043e                 movea.l    1086(a7),a0
[0005e380] 6100 fa10                 bsr        dd_exec
[0005e384] 584f                      addq.w     #4,a7
[0005e386] 7201                      moveq.l    #1,d1
[0005e388] 7001                      moveq.l    #1,d0
[0005e38a] 206f 0414                 movea.l    1044(a7),a0
[0005e38e] 226f 0414                 movea.l    1044(a7),a1
[0005e392] 2269 0034                 movea.l    52(a1),a1
[0005e396] 4e91                      jsr        (a1)
[0005e398] 2e88                      move.l     a0,(a7)
GetTxtIntoObj_4:
[0005e39a] 2017                      move.l     (a7),d0
[0005e39c] 66b0                      bne.s      GetTxtIntoObj_5
GetTxtIntoObj_3:
[0005e39e] 6000 007c                 bra.w      GetTxtIntoObj_6
GetTxtIntoObj_2:
[0005e3a2] 43f9 000e 17ed            lea.l      $000E17ED,a1
[0005e3a8] 206f 0010                 movea.l    16(a7),a0
[0005e3ac] 4eb9 0008 2ff0            jsr        strpbrk
[0005e3b2] 2008                      move.l     a0,d0
[0005e3b4] 670c                      beq.s      GetTxtIntoObj_7
[0005e3b6] 206f 0004                 movea.l    4(a7),a0
[0005e3ba] 317c 001f 0016            move.w     #$001F,22(a0)
[0005e3c0] 603a                      bra.s      GetTxtIntoObj_8
GetTxtIntoObj_7:
[0005e3c2] 43f9 000e 17f0            lea.l      $000E17F0,a1
[0005e3c8] 206f 000c                 movea.l    12(a7),a0
[0005e3cc] 4eb9 0008 2f0c            jsr        strcpy
[0005e3d2] 2008                      move.l     a0,d0
[0005e3d4] 6610                      bne.s      GetTxtIntoObj_9
[0005e3d6] 206f 0010                 movea.l    16(a7),a0
[0005e3da] 4eb9 0004 b8fa            jsr        Af_length
[0005e3e0] 72ff                      moveq.l    #-1,d1
[0005e3e2] b280                      cmp.l      d0,d1
[0005e3e4] 6f0c                      ble.s      GetTxtIntoObj_10
GetTxtIntoObj_9:
[0005e3e6] 206f 0004                 movea.l    4(a7),a0
[0005e3ea] 317c 000b 0016            move.w     #$000B,22(a0)
[0005e3f0] 600a                      bra.s      GetTxtIntoObj_8
GetTxtIntoObj_10:
[0005e3f2] 206f 0004                 movea.l    4(a7),a0
[0005e3f6] 317c 0014 0016            move.w     #$0014,22(a0)
GetTxtIntoObj_8:
[0005e3fc] 206f 0004                 movea.l    4(a7),a0
[0005e400] 216f 0010 000c            move.l     16(a7),12(a0)
[0005e406] 2f2f 043e                 move.l     1086(a7),-(a7)
[0005e40a] 302f 000e                 move.w     14(a7),d0
[0005e40e] 226f 0446                 movea.l    1094(a7),a1
[0005e412] 206f 043e                 movea.l    1086(a7),a0
[0005e416] 6100 f97a                 bsr        dd_exec
[0005e41a] 584f                      addq.w     #4,a7
GetTxtIntoObj_6:
[0005e41c] 206f 0004                 movea.l    4(a7),a0
[0005e420] 4268 0016                 clr.w      22(a0)
[0005e424] 206f 0004                 movea.l    4(a7),a0
[0005e428] 42a8 000c                 clr.l      12(a0)
[0005e42c] 6000 01f6                 bra        GetTxtIntoObj_11
GetTxtIntoObj_1:
[0005e430] 7004                      moveq.l    #4,d0
[0005e432] 43f9 000e 17f8            lea.l      $000E17F8,a1
[0005e438] 206f 000c                 movea.l    12(a7),a0
[0005e43c] 4eb9 0008 2fb8            jsr        strncmp
[0005e442] 4a40                      tst.w      d0
[0005e444] 6600 00ea                 bne        GetTxtIntoObj_12
[0005e448] 3f7c 0001 0430            move.w     #$0001,1072(a7)
[0005e44e] 206f 0010                 movea.l    16(a7),a0
[0005e452] 4eb9 0004 c366            jsr        Af_parseCmdLine
[0005e458] 2f48 0414                 move.l     a0,1044(a7)
[0005e45c] 202f 0414                 move.l     1044(a7),d0
[0005e460] 6700 00ca                 beq        GetTxtIntoObj_13
[0005e464] 206f 0414                 movea.l    1044(a7),a0
[0005e468] 226f 0414                 movea.l    1044(a7),a1
[0005e46c] 2269 0024                 movea.l    36(a1),a1
[0005e470] 4e91                      jsr        (a1)
[0005e472] 2e88                      move.l     a0,(a7)
[0005e474] 6000 00b0                 bra        GetTxtIntoObj_14
GetTxtIntoObj_16:
[0005e478] 2257                      movea.l    (a7),a1
[0005e47a] 41ef 0014                 lea.l      20(a7),a0
[0005e47e] 4eb9 0004 c1a6            jsr        Af_quote
[0005e484] 206f 0004                 movea.l    4(a7),a0
[0005e488] 317c 0014 0016            move.w     #$0014,22(a0)
[0005e48e] 41ef 0014                 lea.l      20(a7),a0
[0005e492] 226f 0004                 movea.l    4(a7),a1
[0005e496] 2348 000c                 move.l     a0,12(a1)
[0005e49a] 4eb9 0004 810e            jsr        Adr_unselect
[0005e4a0] 41ef 0418                 lea.l      1048(a7),a0
[0005e4a4] 4eb9 0006 bf9e            jsr        Act_save
[0005e4aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e4b0] 216f 043a 0258            move.l     1082(a7),600(a0)
[0005e4b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e4bc] 316f 000a 0260            move.w     10(a7),608(a0)
[0005e4c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e4c8] 216f 0442 025c            move.l     1090(a7),604(a0)
[0005e4ce] 7002                      moveq.l    #2,d0
[0005e4d0] 41f9 000d f9c0            lea.l      _WDD,a0
[0005e4d6] 4eb9 0004 7e6a            jsr        Adr_add
[0005e4dc] 43ef 0430                 lea.l      1072(a7),a1
[0005e4e0] 7011                      moveq.l    #17,d0
[0005e4e2] 206f 043a                 movea.l    1082(a7),a0
[0005e4e6] 246f 043a                 movea.l    1082(a7),a2
[0005e4ea] 246a 0004                 movea.l    4(a2),a2
[0005e4ee] 4e92                      jsr        (a2)
[0005e4f0] 302f 0430                 move.w     1072(a7),d0
[0005e4f4] 6712                      beq.s      GetTxtIntoObj_15
[0005e4f6] 93c9                      suba.l     a1,a1
[0005e4f8] 7010                      moveq.l    #16,d0
[0005e4fa] 206f 043a                 movea.l    1082(a7),a0
[0005e4fe] 246f 043a                 movea.l    1082(a7),a2
[0005e502] 246a 0004                 movea.l    4(a2),a2
[0005e506] 4e92                      jsr        (a2)
GetTxtIntoObj_15:
[0005e508] 41ef 0418                 lea.l      1048(a7),a0
[0005e50c] 4eb9 0006 c00a            jsr        Act_restore
[0005e512] 7201                      moveq.l    #1,d1
[0005e514] 7001                      moveq.l    #1,d0
[0005e516] 206f 0414                 movea.l    1044(a7),a0
[0005e51a] 226f 0414                 movea.l    1044(a7),a1
[0005e51e] 2269 0034                 movea.l    52(a1),a1
[0005e522] 4e91                      jsr        (a1)
[0005e524] 2e88                      move.l     a0,(a7)
GetTxtIntoObj_14:
[0005e526] 2017                      move.l     (a7),d0
[0005e528] 6600 ff4e                 bne        GetTxtIntoObj_16
GetTxtIntoObj_13:
[0005e52c] 6000 00f6                 bra        GetTxtIntoObj_11
GetTxtIntoObj_12:
[0005e530] 7004                      moveq.l    #4,d0
[0005e532] 43f9 000e 17fd            lea.l      $000E17FD,a1
[0005e538] 206f 000c                 movea.l    12(a7),a0
[0005e53c] 4eb9 0008 2fb8            jsr        strncmp
[0005e542] 4a40                      tst.w      d0
[0005e544] 6600 00de                 bne        GetTxtIntoObj_11
[0005e548] 302f 0008                 move.w     8(a7),d0
[0005e54c] 6b4e                      bmi.s      GetTxtIntoObj_17
[0005e54e] 6040                      bra.s      GetTxtIntoObj_18
GetTxtIntoObj_20:
[0005e550] 206f 0010                 movea.l    16(a7),a0
[0005e554] 0c10 001f                 cmpi.b     #$1F,(a0)
[0005e558] 6f32                      ble.s      GetTxtIntoObj_19
[0005e55a] 206f 0010                 movea.l    16(a7),a0
[0005e55e] 1010                      move.b     (a0),d0
[0005e560] 4880                      ext.w      d0
[0005e562] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e568] 3140 02ce                 move.w     d0,718(a0)
[0005e56c] 206f 0010                 movea.l    16(a7),a0
[0005e570] 1210                      move.b     (a0),d1
[0005e572] 4881                      ext.w      d1
[0005e574] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e57a] 3028 0266                 move.w     614(a0),d0
[0005e57e] 206f 043a                 movea.l    1082(a7),a0
[0005e582] 226f 043a                 movea.l    1082(a7),a1
[0005e586] 2269 0062                 movea.l    98(a1),a1
[0005e58a] 4e91                      jsr        (a1)
GetTxtIntoObj_19:
[0005e58c] 52af 0010                 addq.l     #1,16(a7)
GetTxtIntoObj_18:
[0005e590] 206f 0010                 movea.l    16(a7),a0
[0005e594] 1010                      move.b     (a0),d0
[0005e596] 66b8                      bne.s      GetTxtIntoObj_20
[0005e598] 6000 008a                 bra        GetTxtIntoObj_11
GetTxtIntoObj_17:
[0005e59c] 6000 007c                 bra.w      GetTxtIntoObj_21
GetTxtIntoObj_27:
[0005e5a0] 206f 0010                 movea.l    16(a7),a0
[0005e5a4] 1010                      move.b     (a0),d0
[0005e5a6] 4880                      ext.w      d0
[0005e5a8] 907c 0009                 sub.w      #$0009,d0
[0005e5ac] 6718                      beq.s      GetTxtIntoObj_22
[0005e5ae] 5340                      subq.w     #1,d0
[0005e5b0] 6722                      beq.s      GetTxtIntoObj_23
[0005e5b2] 5740                      subq.w     #3,d0
[0005e5b4] 6702                      beq.s      GetTxtIntoObj_24
[0005e5b6] 602a                      bra.s      GetTxtIntoObj_25
GetTxtIntoObj_24:
[0005e5b8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e5be] 317c 8000 02ce            move.w     #$8000,718(a0)
[0005e5c4] 602e                      bra.s      GetTxtIntoObj_26
GetTxtIntoObj_22:
[0005e5c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e5cc] 317c 8009 02ce            move.w     #$8009,718(a0)
[0005e5d2] 6020                      bra.s      GetTxtIntoObj_26
GetTxtIntoObj_23:
[0005e5d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e5da] 317c 800d 02ce            move.w     #$800D,718(a0)
[0005e5e0] 6012                      bra.s      GetTxtIntoObj_26
GetTxtIntoObj_25:
[0005e5e2] 206f 0010                 movea.l    16(a7),a0
[0005e5e6] 1010                      move.b     (a0),d0
[0005e5e8] 4880                      ext.w      d0
[0005e5ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e5f0] 3140 02ce                 move.w     d0,718(a0)
GetTxtIntoObj_26:
[0005e5f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e5fa] 3228 02ce                 move.w     718(a0),d1
[0005e5fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e604] 3028 0266                 move.w     614(a0),d0
[0005e608] 206f 043a                 movea.l    1082(a7),a0
[0005e60c] 226f 043a                 movea.l    1082(a7),a1
[0005e610] 2269 0062                 movea.l    98(a1),a1
[0005e614] 4e91                      jsr        (a1)
[0005e616] 52af 0010                 addq.l     #1,16(a7)
GetTxtIntoObj_21:
[0005e61a] 206f 0010                 movea.l    16(a7),a0
[0005e61e] 1010                      move.b     (a0),d0
[0005e620] 6600 ff7e                 bne        GetTxtIntoObj_27
GetTxtIntoObj_11:
[0005e624] 7001                      moveq.l    #1,d0
[0005e626] 4fef 0432                 lea.l      1074(a7),a7
[0005e62a] 245f                      movea.l    (a7)+,a2
[0005e62c] 4e75                      rts

	.data

globProtData:
[000e147e]                           dc.w $0000
[000e1480]                           dc.w $0000
MsgListe:
[000e1482]                           dc.w $0400
[000e1484] 0005ed4a                  dc.l Aev_GetAccID
[000e1488]                           dc.w $ffff
[000e148a]                           dc.w $ffff
[000e148c]                           dc.w $ff00
[000e148e]                           dc.w $ffff
[000e1490]                           dc.w $0403
[000e1492] 0005eeda                  dc.l Aev_GetAccAcc
[000e1496]                           dc.w $ffff
[000e1498]                           dc.w $ffff
[000e149a]                           dc.w $ff00
[000e149c]                           dc.w $ffff
[000e149e]                           dc.w $0500
[000e14a0] 0005edf4                  dc.l Aev_GetAccAck
[000e14a4]                           dc.w $ffff
[000e14a6]                           dc.w $ffff
[000e14a8]                           dc.w $ff00
[000e14aa]                           dc.w $ffff
[000e14ac]                           dc.w $0502
[000e14ae] 0005ef96                  dc.l Aev_GetAccKey
[000e14b2]                           dc.w $ffff
[000e14b4]                           dc.w $ffff
[000e14b6]                           dc.w $ff01
[000e14b8]                           dc.w $ffff
[000e14ba]                           dc.w $0501
[000e14bc] 0005f02e                  dc.l Aev_GetAccText
[000e14c0]                           dc.w $ffff
[000e14c2]                           dc.w $ffff
[000e14c4]                           dc.w $ff02
[000e14c6]                           dc.w $ffff
[000e14c8]                           dc.w $0504
[000e14ca] 0005f0f6                  dc.l Aev_GetAccImg
[000e14ce]                           dc.w $ffff
[000e14d0]                           dc.w $ffff
[000e14d2]                           dc.w $ff02
[000e14d4]                           dc.w $ffff
[000e14d6]                           dc.w $0503
[000e14d8] 0005f34a                  dc.l Aev_GetAccMeta
[000e14dc]                           dc.w $ffff
[000e14de]                           dc.w $ffff
[000e14e0]                           dc.w $ff02
[000e14e2]                           dc.w $ffff
[000e14e4]                           dc.w $4701
[000e14e6] 0005f92e                  dc.l Aev_GetVaProtoStatus
[000e14ea]                           dc.w $ffff
[000e14ec]                           dc.w $ffff
[000e14ee]                           dc.w $ff00
[000e14f0]                           dc.w $ffff
[000e14f2]                           dc.w $4736
[000e14f4] 0005f8de                  dc.l Aev_GetAvExit
[000e14f8]                           dc.w $ffff
[000e14fa]                           dc.w $ffff
[000e14fc]                           dc.w $ff00
[000e14fe]                           dc.w $ffff
[000e1500]                           dc.w $4711
[000e1502] 0005f980                  dc.l Aev_GetVaStart
[000e1506]                           dc.w $ffff
[000e1508]                           dc.w $ffff
[000e150a]                           dc.w $ff00
[000e150c]                           dc.w $ffff
[000e150e]                           dc.w $4738
[000e1510] 0005f9f8                  dc.l Aev_GetAvStarted
[000e1514]                           dc.w $ffff
[000e1516]                           dc.w $ffff
[000e1518]                           dc.w $ff00
[000e151a]                           dc.w $ffff
[000e151c]                           dc.w $4710
[000e151e] 0005fad6                  dc.l Aev_GetAvSendKey
[000e1522]                           dc.w $ffff
[000e1524]                           dc.w $ffff
[000e1526]                           dc.w $ff00
[000e1528]                           dc.w $ffff
[000e152a]                           dc.w $4709
[000e152c] 0005fb54                  dc.l Aev_GetAvSendClick
[000e1530]                           dc.w $ffff
[000e1532]                           dc.w $ffff
[000e1534]                           dc.w $ff00
[000e1536]                           dc.w $ffff
[000e1538]                           dc.w $4730
[000e153a] 0005fbce                  dc.l Aev_GetVaPathUpdate
[000e153e]                           dc.w $ffff
[000e1540]                           dc.w $ffff
[000e1542]                           dc.w $ff00
[000e1544]                           dc.w $ffff
[000e1546]                           dc.w $003f
[000e1548] 0005fe8e                  dc.l Aev_GetAPDragDrop
[000e154c]                           dc.w $03ff
[000e154e]                           dc.w $ffff
[000e1550]                           dc.w $ff02
[000e1552]                           dc.w $ffff
[000e1554]                           dc.w $1236
[000e1556] 00061aee                  dc.l Aev_GetOlgaInit
[000e155a]                           dc.w $ffff
[000e155c]                           dc.w $ffff
[000e155e]                           dc.w $ff00
[000e1560]                           dc.w $ffff
[000e1562]                           dc.w $4951
[000e1564] 00061b72                  dc.l Aev_GetOleExit
[000e1568]                           dc.w $ffff
[000e156a]                           dc.w $ffff
[000e156c]                           dc.w $ff00
[000e156e]                           dc.w $ffff
[000e1570]                           dc.w $4952
[000e1572] 00061bcc                  dc.l Aev_GetOleNew
[000e1576]                           dc.w $ffff
[000e1578]                           dc.w $ffff
[000e157a]                           dc.w $ff00
[000e157c]                           dc.w $ffff
[000e157e]                           dc.w $1239
[000e1580] 00061bf6                  dc.l Aev_GetOlgaAck
[000e1584]                           dc.w $ffff
[000e1586]                           dc.w $ffff
[000e1588]                           dc.w $ff00
[000e158a]                           dc.w $ffff
[000e158c]                           dc.w $123f
[000e158e] 00061d66                  dc.l Aev_GetOlgaUpdated
[000e1592]                           dc.w $ffff
[000e1594]                           dc.w $ffff
[000e1596]                           dc.w $ff00
[000e1598]                           dc.w $ffff
[000e159a]                           dc.w $1247
[000e159c] 00061dcc                  dc.l Aev_GetOlgaGetInfo
[000e15a0]                           dc.w $ffff
[000e15a2]                           dc.w $ffff
[000e15a4]                           dc.w $ff00
[000e15a6]                           dc.w $ffff
[000e15a8]                           dc.w $1249
[000e15aa] 00061e3e                  dc.l Aev_GetOlgaIdle
[000e15ae]                           dc.w $ffff
[000e15b0]                           dc.w $ffff
[000e15b2]                           dc.w $ff00
[000e15b4]                           dc.w $ffff
[000e15b6]                           dc.w $1255
[000e15b8] 00061e3a                  dc.l Aev_GetOlgaClientTerminated
[000e15bc]                           dc.w $ffff
[000e15be]                           dc.w $ffff
[000e15c0]                           dc.w $ff00
[000e15c2]                           dc.w $ffff
[000e15c4]                           dc.w $babc
[000e15c6] 000606ea                  dc.l Aev_GetAckBubbleGEM
[000e15ca]                           dc.w $ffff
[000e15cc]                           dc.w $ffff
[000e15ce]                           dc.w $ff00
[000e15d0]                           dc.w $ffff
[000e15d2]                           dc.w $baba
[000e15d4] 0006072e                  dc.l Aev_GetRequestBubbleGEM
[000e15d8]                           dc.w $0304
[000e15da]                           dc.w $0504
[000e15dc]                           dc.w $0500
[000e15de]                           dc.w $ffff
[000e15e0]                           dc.w $1350
[000e15e2] 00060cb8                  dc.l Aev_GetGSRequest
[000e15e6]                           dc.w $ffff
[000e15e8]                           dc.w $ffff
[000e15ea]                           dc.w $ff00
[000e15ec]                           dc.w $ffff
[000e15ee]                           dc.w $1354
[000e15f0] 00060dc2                  dc.l Aev_GetGSQuit
[000e15f4]                           dc.w $ffff
[000e15f6]                           dc.w $ffff
[000e15f8]                           dc.w $ff00
[000e15fa]                           dc.w $ffff
[000e15fc]                           dc.w $1352
[000e15fe] 00060e34                  dc.l Aev_GetGSCommand
[000e1602]                           dc.w $ffff
[000e1604]                           dc.w $ffff
[000e1606]                           dc.w $ff00
[000e1608]                           dc.w $ffff
[000e160a]                           dc.w $1353
[000e160c] 00060f8e                  dc.l Aev_GetGSAck
[000e1610]                           dc.w $ffff
[000e1612]                           dc.w $ffff
[000e1614]                           dc.w $ff00
[000e1616]                           dc.w $ffff
[000e1618]                           dc.w $0402
[000e161a] 00062488                  dc.l Aev_GetAcReply
[000e161e]                           dc.w $ffff
[000e1620]                           dc.w $ffff
[000e1622]                           dc.w $ff00
[000e1624]                           dc.w $ffff
[000e1626]                           dc.w $dadd
[000e1628] 00060338                  dc.l Aev_GetDhstAdd
[000e162c]                           dc.w $ffff
[000e162e]                           dc.w $ffff
[000e1630]                           dc.w $ff00
[000e1632]                           dc.w $ffff
[000e1634]                           dc.w $dade
[000e1636] 0006033c                  dc.l Aev_GetDhstAck
[000e163a]                           dc.w $ffff
[000e163c]                           dc.w $ffff
[000e163e]                           dc.w $ff00
[000e1640]                           dc.w $ffff
[000e1642]                           dc.w $000a
[000e1644] 0005e62e                  dc.l Aev_GetMnSelected
[000e1648]                           dc.w $ffff
[000e164a]                           dc.w $ffff
[000e164c]                           dc.w $ff00
[000e164e]                           dc.w $ffff
[000e1650]                           dc.w $0014
[000e1652] 0005e64e                  dc.l Aev_GetWmRedraw
[000e1656]                           dc.w $0304
[000e1658]                           dc.w $0506
[000e165a]                           dc.w $0700
[000e165c]                           dc.w $ffff
[000e165e]                           dc.w $0015
[000e1660] 0005e672                  dc.l Aev_GetWmTopped
[000e1664]                           dc.w $03ff
[000e1666]                           dc.w $ffff
[000e1668]                           dc.w $ff00
[000e166a]                           dc.w $ffff
[000e166c]                           dc.w $0016
[000e166e] 0005e6fc                  dc.l Aev_GetWmClosed
[000e1672]                           dc.w $03ff
[000e1674]                           dc.w $ffff
[000e1676]                           dc.w $ff00
[000e1678]                           dc.w $ffff
[000e167a]                           dc.w $0017
[000e167c] 0005e76c                  dc.l Aev_GetWmFulled
[000e1680]                           dc.w $03ff
[000e1682]                           dc.w $ffff
[000e1684]                           dc.w $ff00
[000e1686]                           dc.w $ffff
[000e1688]                           dc.w $0018
[000e168a] 0005e788                  dc.l Aev_GetWmArrowed
[000e168e]                           dc.w $03ff
[000e1690]                           dc.w $ffff
[000e1692]                           dc.w $ff00
[000e1694]                           dc.w $ffff
[000e1696]                           dc.w $0019
[000e1698] 0005e85c                  dc.l Aev_GetWmHSlid
[000e169c]                           dc.w $03ff
[000e169e]                           dc.w $ffff
[000e16a0]                           dc.w $ff00
[000e16a2]                           dc.w $ffff
[000e16a4]                           dc.w $001a
[000e16a6] 0005e880                  dc.l Aev_GetWmVSlid
[000e16aa]                           dc.w $03ff
[000e16ac]                           dc.w $ffff
[000e16ae]                           dc.w $ff00
[000e16b0]                           dc.w $ffff
[000e16b2]                           dc.w $001b
[000e16b4] 0005e8a4                  dc.l Aev_GetWmSized
[000e16b8]                           dc.w $0304
[000e16ba]                           dc.w $0506
[000e16bc]                           dc.w $0700
[000e16be]                           dc.w $ffff
[000e16c0]                           dc.w $001c
[000e16c2] 0005e8c8                  dc.l Aev_GetWmMoved
[000e16c6]                           dc.w $0304
[000e16c8]                           dc.w $0506
[000e16ca]                           dc.w $0700
[000e16cc]                           dc.w $ffff
[000e16ce]                           dc.w $0064
[000e16d0] 0005e8ec                  dc.l Aev_GetWmBottomed
[000e16d4]                           dc.w $03ff
[000e16d6]                           dc.w $ffff
[000e16d8]                           dc.w $ff00
[000e16da]                           dc.w $ffff
[000e16dc]                           dc.w $0021
[000e16de] 0005e8ec                  dc.l Aev_GetWmBottomed
[000e16e2]                           dc.w $03ff
[000e16e4]                           dc.w $ffff
[000e16e6]                           dc.w $ff00
[000e16e8]                           dc.w $ffff
[000e16ea]                           dc.w $001f
[000e16ec] 0005e902                  dc.l Aev_GetWmOnTop
[000e16f0]                           dc.w $03ff
[000e16f2]                           dc.w $ffff
[000e16f4]                           dc.w $ff00
[000e16f6]                           dc.w $ffff
[000e16f8]                           dc.w $001e
[000e16fa] 0005e932                  dc.l Aev_GetWmUnTopped
[000e16fe]                           dc.w $03ff
[000e1700]                           dc.w $ffff
[000e1702]                           dc.w $ff00
[000e1704]                           dc.w $ffff
[000e1706]                           dc.w $001d
[000e1708]                           dc.w $0000
[000e170a]                           dc.w $0000
[000e170c]                           dc.w $ffff
[000e170e]                           dc.w $ffff
[000e1710]                           dc.w $ff00
[000e1712]                           dc.w $ffff
[000e1714]                           dc.w $0020
[000e1716]                           dc.w $0000
[000e1718]                           dc.w $0000
[000e171a]                           dc.w $ffff
[000e171c]                           dc.w $ffff
[000e171e]                           dc.w $ff00
[000e1720]                           dc.w $ffff
[000e1722]                           dc.w $5758
[000e1724] 0005e93a                  dc.l Aev_GetWmShaded
[000e1728]                           dc.w $03ff
[000e172a]                           dc.w $ffff
[000e172c]                           dc.w $ff00
[000e172e]                           dc.w $ffff
[000e1730]                           dc.w $5759
[000e1732] 0005e96a                  dc.l Aev_GetWmUnshaded
[000e1736]                           dc.w $03ff
[000e1738]                           dc.w $ffff
[000e173a]                           dc.w $ff00
[000e173c]                           dc.w $ffff
[000e173e]                           dc.w $0930
[000e1740] 0005e812                  dc.l Aev_GetWmMouseWheel
[000e1744]                           dc.w $0305
[000e1746]                           dc.w $06ff
[000e1748]                           dc.w $ff00
[000e174a]                           dc.w $0004
[000e174c]                           dc.w $0025
[000e174e] 0005e936                  dc.l Aev_GetWmToolbar
[000e1752]                           dc.w $03ff
[000e1754]                           dc.w $ffff
[000e1756]                           dc.w $ff00
[000e1758]                           dc.w $ffff
[000e175a]                           dc.w $0032
[000e175c] 0005ea0a                  dc.l Aev_GetApTerm
[000e1760]                           dc.w $ffff
[000e1762]                           dc.w $ffff
[000e1764]                           dc.w $ff00
[000e1766]                           dc.w $ffff
[000e1768]                           dc.w $0050
[000e176a] 0005ea20                  dc.l Aev_GetScChanged
[000e176e]                           dc.w $ffff
[000e1770]                           dc.w $ffff
[000e1772]                           dc.w $ff00
[000e1774]                           dc.w $ffff
[000e1776]                           dc.w $0053
[000e1778] 0005ea2e                  dc.l Aev_GetFntChanged
[000e177c]                           dc.w $ffff
[000e177e]                           dc.w $ffff
[000e1780]                           dc.w $ff00
[000e1782]                           dc.w $ffff
[000e1784]                           dc.w $0052
[000e1786] 0005ea92                  dc.l Aev_GetPrnChanged
[000e178a]                           dc.w $ffff
[000e178c]                           dc.w $ffff
[000e178e]                           dc.w $ff00
[000e1790]                           dc.w $ffff
[000e1792]                           dc.w $0054
[000e1794] 0005eaaa                  dc.l Aev_GetColorsChanged
[000e1798]                           dc.w $ffff
[000e179a]                           dc.w $ffff
[000e179c]                           dc.w $ff00
[000e179e]                           dc.w $ffff
[000e17a0]                           dc.w $0028
[000e17a2] 0005eb44                  dc.l Aev_GetAcOpen
[000e17a6]                           dc.w $ffff
[000e17a8]                           dc.w $ffff
[000e17aa]                           dc.w $ff00
[000e17ac]                           dc.w $ffff
[000e17ae]                           dc.w $0029
[000e17b0] 0005ead4                  dc.l Aev_GetAcClose
[000e17b4]                           dc.w $ffff
[000e17b6]                           dc.w $ffff
[000e17b8]                           dc.w $ff00
[000e17ba]                           dc.w $ffff
[000e17bc]                           dc.w $0022
[000e17be] 0005e9b2                  dc.l Aev_GetWmIconify
[000e17c2]                           dc.w $03ff
[000e17c4]                           dc.w $ffff
[000e17c6]                           dc.w $ff00
[000e17c8]                           dc.w $ffff
[000e17ca]                           dc.w $0024
[000e17cc] 0005e9d0                  dc.l Aev_GetWmAllIconify
[000e17d0]                           dc.w $03ff
[000e17d2]                           dc.w $ffff
[000e17d4]                           dc.w $ff00
[000e17d6]                           dc.w $ffff
[000e17d8]                           dc.w $0023
[000e17da] 0005e9ee                  dc.l Aev_GetWmUnIconify
[000e17de]                           dc.w $03ff
[000e17e0]                           dc.w $ffff
[000e17e2]                           dc.w $ff00
[000e17e4]                           dc.w $ffff
MsgListeLen:
[000e17e6]                           dc.w $003e
[000e17e8]                           dc.b 'ARGS',0
[000e17ed]                           dc.b $0a
[000e17ee]                           dc.w $0d00
[000e17f0]                           dc.b 'XAccTxt',0
[000e17f8]                           dc.b 'ARGS',0
[000e17fd]                           dc.b '.TXT',0
