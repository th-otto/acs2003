	.globl Aev_InitGEMScript
Aev_InitGEMScript:
[0006086c] 700c                      moveq.l    #12,d0
[0006086e] 4eb9 0004 c95e            jsr        Ax_glmalloc
[00060874] 23c8 000e 1ab2            move.l     a0,gs_infodata
[0006087a] 2039 000e 1ab2            move.l     gs_infodata,d0
[00060880] 6604                      bne.s      Aev_InitGEMScript_1
[00060882] 4240                      clr.w      d0
[00060884] 4e75                      rts
Aev_InitGEMScript_1:

[00060886] 2079 000e 1ab2            movea.l    gs_infodata,a0
[0006088c] 20bc 0000 000c            move.l     #$0000000C,(a0)
[00060892] 2079 000e 1ab2            movea.l    gs_infodata,a0
[00060898] 317c 0120 0004            move.w     #$0120,4(a0)
[0006089e] 2079 000e 1ab2            movea.l    gs_infodata,a0
[000608a4] 317c 0009 0006            move.w     #$0009,6(a0)
[000608aa] 2079 000e 1ab2            movea.l    gs_infodata,a0
[000608b0] 42a8 0008                 clr.l      8(a0)
[000608b4] 4eb9 0007 0c0a            jsr        Alu_create
[000608ba] 23c8 000e 1ab6            move.l     a0,gs_connect
[000608c0] 2039 000e 1ab6            move.l     gs_connect,d0
[000608c6] 6604                      bne.s      x60886_1
[000608c8] 4240                      clr.w      d0
[000608ca] 4e75                      rts
x60886_1:

[000608cc] 2079 000e 1ab6            movea.l    gs_connect,a0
[000608d2] 217c 0006 09e6 0004       move.l     #ClearConnect,4(a0)
[000608da] 7001                      moveq.l    #1,d0
[000608dc] 4e75                      rts

	.globl Aev_ExitGEMScript
Aev_ExitGEMScript:
[000608de] 2079 000e 1ab6            movea.l    gs_connect,a0
[000608e4] 4eb9 0007 0c5e            jsr        Alu_delete
[000608ea] 42b9 000e 1ab6            clr.l      gs_connect
[000608f0] 2039 000e 1ab2            move.l     gs_infodata,d0
[000608f6] 670c                      beq.s      Aev_ExitGEMScript_1
[000608f8] 2079 000e 1ab2            movea.l    gs_infodata,a0
[000608fe] 4eb9 0004 c9da            jsr        Ax_glfree
Aev_ExitGEMScript_1:
[00060904] 42b9 000e 1ab2            clr.l      gs_infodata
[0006090a] 7001                      moveq.l    #1,d0
[0006090c] 4e75                      rts

CmpIDKanal:
[0006090e] 514f                      subq.w     #8,a7
[00060910] 2f48 0004                 move.l     a0,4(a7)
[00060914] 2e89                      move.l     a1,(a7)
[00060916] 206f 0004                 movea.l    4(a7),a0
[0006091a] 3010                      move.w     (a0),d0
[0006091c] 2057                      movea.l    (a7),a0
[0006091e] b050                      cmp.w      (a0),d0
[00060920] 6614                      bne.s      CmpIDKanal_1
[00060922] 206f 0004                 movea.l    4(a7),a0
[00060926] 3028 0002                 move.w     2(a0),d0
[0006092a] 2057                      movea.l    (a7),a0
[0006092c] b068 000e                 cmp.w      14(a0),d0
[00060930] 6604                      bne.s      CmpIDKanal_1
[00060932] 7001                      moveq.l    #1,d0
[00060934] 6002                      bra.s      CmpIDKanal_2
CmpIDKanal_1:
[00060936] 4240                      clr.w      d0
CmpIDKanal_2:
[00060938] 504f                      addq.w     #8,a7
[0006093a] 4e75                      rts

SetStatus:
[0006093c] 514f                      subq.w     #8,a7
[0006093e] 2f48 0004                 move.l     a0,4(a7)
[00060942] 2e89                      move.l     a1,(a7)
[00060944] 206f 0004                 movea.l    4(a7),a0
[00060948] 3028 0006                 move.w     6(a0),d0
[0006094c] 6710                      beq.s      SetStatus_1
[0006094e] 206f 0004                 movea.l    4(a7),a0
[00060952] 3028 0004                 move.w     4(a0),d0
[00060956] 2057                      movea.l    (a7),a0
[00060958] 8168 0010                 or.w       d0,16(a0)
[0006095c] 6010                      bra.s      SetStatus_2
SetStatus_1:
[0006095e] 206f 0004                 movea.l    4(a7),a0
[00060962] 3028 0004                 move.w     4(a0),d0
[00060966] 4640                      not.w      d0
[00060968] 2057                      movea.l    (a7),a0
[0006096a] c168 0010                 and.w      d0,16(a0)
SetStatus_2:
[0006096e] 504f                      addq.w     #8,a7
[00060970] 4e75                      rts

SendGsAck:
[00060972] 2f0a                      move.l     a2,-(a7)
[00060974] 514f                      subq.w     #8,a7
[00060976] 2f48 0004                 move.l     a0,4(a7)
[0006097a] 206f 0004                 movea.l    4(a7),a0
[0006097e] 2028 0010                 move.l     16(a0),d0
[00060982] 671c                      beq.s      SendGsAck_1
[00060984] 7201                      moveq.l    #1,d1
[00060986] 206f 0004                 movea.l    4(a7),a0
[0006098a] 3028 0014                 move.w     20(a0),d0
[0006098e] 206f 0004                 movea.l    4(a7),a0
[00060992] 2068 0010                 movea.l    16(a0),a0
[00060996] 4eb9 0004 7184            jsr        Ast_mergeASCIIZZ
[0006099c] 2e88                      move.l     a0,(a7)
[0006099e] 6018                      bra.s      SendGsAck_2
SendGsAck_1:
[000609a0] 7003                      moveq.l    #3,d0
[000609a2] 4eb9 0004 c95e            jsr        Ax_glmalloc
[000609a8] 2e88                      move.l     a0,(a7)
[000609aa] 43f9 000e 1af6            lea.l      $000E1AF6,a1
[000609b0] 2057                      movea.l    (a7),a0
[000609b2] 4eb9 0008 2f0c            jsr        strcpy
SendGsAck_2:
[000609b8] 2257                      movea.l    (a7),a1
[000609ba] 206f 0004                 movea.l    4(a7),a0
[000609be] 3028 0016                 move.w     22(a0),d0
[000609c2] 206f 0004                 movea.l    4(a7),a0
[000609c6] 4eb9 0006 11c8            jsr        Aev_GSAck
[000609cc] 2257                      movea.l    (a7),a1
[000609ce] 2079 000e 147e            movea.l    globProtData,a0
[000609d4] 2479 000e 147e            movea.l    globProtData,a2
[000609da] 246a 000c                 movea.l    12(a2),a2
[000609de] 4e92                      jsr        (a2)
[000609e0] 504f                      addq.w     #8,a7
[000609e2] 245f                      movea.l    (a7)+,a2
[000609e4] 4e75                      rts

ClearConnect:
[000609e6] 594f                      subq.w     #4,a7
[000609e8] 2e88                      move.l     a0,(a7)
[000609ea] 7002                      moveq.l    #2,d0
[000609ec] 2057                      movea.l    (a7),a0
[000609ee] c068 0010                 and.w      16(a0),d0
[000609f2] 6608                      bne.s      ClearConnect_1
[000609f4] 2057                      movea.l    (a7),a0
[000609f6] 4eb9 0006 115e            jsr        Aev_GSQuit
ClearConnect_1:
[000609fc] 7012                      moveq.l    #18,d0
[000609fe] 2057                      movea.l    (a7),a0
[00060a00] 4eb9 0004 cc28            jsr        Ax_recycle
[00060a06] 584f                      addq.w     #4,a7
[00060a08] 4e75                      rts

ParseGSCommands:
[00060a0a] 4fef ffdc                 lea.l      -36(a7),a7
[00060a0e] 2f48 0020                 move.l     a0,32(a7)
[00060a12] 2f49 001c                 move.l     a1,28(a7)
[00060a16] 426f 0002                 clr.w      2(a7)
[00060a1a] 4257                      clr.w      (a7)
[00060a1c] 4857                      pea.l      (a7)
[00060a1e] 43ef 0008                 lea.l      8(a7),a1
[00060a22] 206f 0024                 movea.l    36(a7),a0
[00060a26] 4eb9 0004 7108            jsr        Ast_splitASCIIZZ
[00060a2c] 584f                      addq.w     #4,a7
[00060a2e] 4a40                      tst.w      d0
[00060a30] 6700 027c                 beq        ParseGSCommands_1
[00060a34] 3017                      move.w     (a7),d0
[00060a36] 6f00 0276                 ble        ParseGSCommands_1
[00060a3a] 426f 001a                 clr.w      26(a7)
[00060a3e] 2f6f 0004 000c            move.l     4(a7),12(a7)
[00060a44] 6000 01ae                 bra        ParseGSCommands_2
ParseGSCommands_15:
[00060a48] 206f 000c                 movea.l    12(a7),a0
[00060a4c] 2050                      movea.l    (a0),a0
[00060a4e] 1010                      move.b     (a0),d0
[00060a50] 4880                      ext.w      d0
[00060a52] 41f9 000e 1af9            lea.l      $000E1AF9,a0
[00060a58] 4eb9 0008 2e8a            jsr        strchr
[00060a5e] 2008                      move.l     a0,d0
[00060a60] 6700 018a                 beq        ParseGSCommands_3
[00060a64] 206f 000c                 movea.l    12(a7),a0
[00060a68] 2050                      movea.l    (a0),a0
[00060a6a] 1010                      move.b     (a0),d0
[00060a6c] 4880                      ext.w      d0
[00060a6e] 5340                      subq.w     #1,d0
[00060a70] 6708                      beq.s      ParseGSCommands_4
[00060a72] 5340                      subq.w     #1,d0
[00060a74] 6726                      beq.s      ParseGSCommands_5
[00060a76] 6000 0162                 bra        ParseGSCommands_6
ParseGSCommands_4:
[00060a7a] 206f 000c                 movea.l    12(a7),a0
[00060a7e] 2050                      movea.l    (a0),a0
[00060a80] 4eb9 0004 649c            jsr        Ast_delete
[00060a86] 41f9 000e 1b00            lea.l      $000E1B00,a0
[00060a8c] 4eb9 0004 643c            jsr        Ast_create
[00060a92] 226f 000c                 movea.l    12(a7),a1
[00060a96] 2288                      move.l     a0,(a1)
[00060a98] 6000 0152                 bra        ParseGSCommands_3
ParseGSCommands_5:
[00060a9c] 206f 000c                 movea.l    12(a7),a0
[00060aa0] 2050                      movea.l    (a0),a0
[00060aa2] 4eb9 0008 2f6c            jsr        strlen
[00060aa8] 5340                      subq.w     #1,d0
[00060aaa] 3f40 0002                 move.w     d0,2(a7)
[00060aae] 302f 0002                 move.w     2(a7),d0
[00060ab2] e240                      asr.w      #1,d0
[00060ab4] 7201                      moveq.l    #1,d1
[00060ab6] c26f 0002                 and.w      2(a7),d1
[00060aba] d041                      add.w      d1,d0
[00060abc] 3f40 0002                 move.w     d0,2(a7)
[00060ac0] 7001                      moveq.l    #1,d0
[00060ac2] d06f 0002                 add.w      2(a7),d0
[00060ac6] 48c0                      ext.l      d0
[00060ac8] 4eb9 0004 c608            jsr        Ax_malloc
[00060ace] 2f48 0008                 move.l     a0,8(a7)
[00060ad2] 202f 0008                 move.l     8(a7),d0
[00060ad6] 6700 00ec                 beq        ParseGSCommands_7
[00060ada] 426f 0018                 clr.w      24(a7)
[00060ade] 206f 000c                 movea.l    12(a7),a0
[00060ae2] 2050                      movea.l    (a0),a0
[00060ae4] 5248                      addq.w     #1,a0
[00060ae6] 2f48 0014                 move.l     a0,20(a7)
[00060aea] 2f6f 0008 0010            move.l     8(a7),16(a7)
[00060af0] 6000 00b8                 bra        ParseGSCommands_8
ParseGSCommands_14:
[00060af4] 206f 0014                 movea.l    20(a7),a0
[00060af8] 1010                      move.b     (a0),d0
[00060afa] 4880                      ext.w      d0
[00060afc] 4eb9 0008 37ce            jsr        isdigit
[00060b02] 4a40                      tst.w      d0
[00060b04] 6710                      beq.s      ParseGSCommands_9
[00060b06] 70d0                      moveq.l    #-48,d0
[00060b08] 206f 0014                 movea.l    20(a7),a0
[00060b0c] d010                      add.b      (a0),d0
[00060b0e] 206f 0010                 movea.l    16(a7),a0
[00060b12] 1080                      move.b     d0,(a0)
[00060b14] 6028                      bra.s      ParseGSCommands_10
ParseGSCommands_9:
[00060b16] 206f 0014                 movea.l    20(a7),a0
[00060b1a] 1010                      move.b     (a0),d0
[00060b1c] 4880                      ext.w      d0
[00060b1e] 4eb9 0008 3808            jsr        isxdigit
[00060b24] 4a40                      tst.w      d0
[00060b26] 6716                      beq.s      ParseGSCommands_10
[00060b28] 206f 0014                 movea.l    20(a7),a0
[00060b2c] 1010                      move.b     (a0),d0
[00060b2e] 4eb9 0004 64b6            jsr        Ach_toupper
[00060b34] d03c ffc9                 add.b      #$C9,d0
[00060b38] 206f 0010                 movea.l    16(a7),a0
[00060b3c] 1080                      move.b     d0,(a0)
ParseGSCommands_10:
[00060b3e] 52af 0014                 addq.l     #1,20(a7)
[00060b42] 206f 0014                 movea.l    20(a7),a0
[00060b46] 1010                      move.b     (a0),d0
[00060b48] 6754                      beq.s      ParseGSCommands_11
[00060b4a] 206f 0010                 movea.l    16(a7),a0
[00060b4e] 1010                      move.b     (a0),d0
[00060b50] e908                      lsl.b      #4,d0
[00060b52] 1080                      move.b     d0,(a0)
[00060b54] 206f 0014                 movea.l    20(a7),a0
[00060b58] 1010                      move.b     (a0),d0
[00060b5a] 4880                      ext.w      d0
[00060b5c] 4eb9 0008 37ce            jsr        isdigit
[00060b62] 4a40                      tst.w      d0
[00060b64] 6710                      beq.s      ParseGSCommands_12
[00060b66] 70d0                      moveq.l    #-48,d0
[00060b68] 206f 0014                 movea.l    20(a7),a0
[00060b6c] d010                      add.b      (a0),d0
[00060b6e] 206f 0010                 movea.l    16(a7),a0
[00060b72] 8110                      or.b       d0,(a0)
[00060b74] 6028                      bra.s      ParseGSCommands_11
ParseGSCommands_12:
[00060b76] 206f 0014                 movea.l    20(a7),a0
[00060b7a] 1010                      move.b     (a0),d0
[00060b7c] 4880                      ext.w      d0
[00060b7e] 4eb9 0008 3808            jsr        isxdigit
[00060b84] 4a40                      tst.w      d0
[00060b86] 6716                      beq.s      ParseGSCommands_11
[00060b88] 206f 0014                 movea.l    20(a7),a0
[00060b8c] 1010                      move.b     (a0),d0
[00060b8e] 4eb9 0004 64b6            jsr        Ach_toupper
[00060b94] d03c ffc9                 add.b      #$C9,d0
[00060b98] 206f 0010                 movea.l    16(a7),a0
[00060b9c] 8110                      or.b       d0,(a0)
ParseGSCommands_11:
[00060b9e] 52af 0010                 addq.l     #1,16(a7)
[00060ba2] 52af 0014                 addq.l     #1,20(a7)
[00060ba6] 526f 0018                 addq.w     #1,24(a7)
ParseGSCommands_8:
[00060baa] 206f 0014                 movea.l    20(a7),a0
[00060bae] 1010                      move.b     (a0),d0
[00060bb0] 670c                      beq.s      ParseGSCommands_13
[00060bb2] 302f 0018                 move.w     24(a7),d0
[00060bb6] b06f 0002                 cmp.w      2(a7),d0
[00060bba] 6d00 ff38                 blt        ParseGSCommands_14
ParseGSCommands_13:
[00060bbe] 206f 0010                 movea.l    16(a7),a0
[00060bc2] 4210                      clr.b      (a0)
ParseGSCommands_7:
[00060bc4] 206f 000c                 movea.l    12(a7),a0
[00060bc8] 2050                      movea.l    (a0),a0
[00060bca] 4eb9 0004 649c            jsr        Ast_delete
[00060bd0] 206f 000c                 movea.l    12(a7),a0
[00060bd4] 20af 0008                 move.l     8(a7),(a0)
[00060bd8] 6012                      bra.s      ParseGSCommands_3
ParseGSCommands_6:
[00060bda] 206f 000c                 movea.l    12(a7),a0
[00060bde] 2050                      movea.l    (a0),a0
[00060be0] 4eb9 0004 649c            jsr        Ast_delete
[00060be6] 206f 000c                 movea.l    12(a7),a0
[00060bea] 4290                      clr.l      (a0)
ParseGSCommands_3:
[00060bec] 526f 001a                 addq.w     #1,26(a7)
[00060bf0] 58af 000c                 addq.l     #4,12(a7)
ParseGSCommands_2:
[00060bf4] 302f 001a                 move.w     26(a7),d0
[00060bf8] b057                      cmp.w      (a7),d0
[00060bfa] 6d00 fe4c                 blt        ParseGSCommands_15
[00060bfe] 426f 0002                 clr.w      2(a7)
[00060c02] 426f 001a                 clr.w      26(a7)
[00060c06] 2f6f 0004 000c            move.l     4(a7),12(a7)
[00060c0c] 6014                      bra.s      ParseGSCommands_16
ParseGSCommands_18:
[00060c0e] 206f 000c                 movea.l    12(a7),a0
[00060c12] 2010                      move.l     (a0),d0
[00060c14] 6704                      beq.s      ParseGSCommands_17
[00060c16] 526f 0002                 addq.w     #1,2(a7)
ParseGSCommands_17:
[00060c1a] 526f 001a                 addq.w     #1,26(a7)
[00060c1e] 58af 000c                 addq.l     #4,12(a7)
ParseGSCommands_16:
[00060c22] 302f 001a                 move.w     26(a7),d0
[00060c26] b057                      cmp.w      (a7),d0
[00060c28] 6de4                      blt.s      ParseGSCommands_18
[00060c2a] 302f 0002                 move.w     2(a7),d0
[00060c2e] 48c0                      ext.l      d0
[00060c30] e588                      lsl.l      #2,d0
[00060c32] 4eb9 0004 c608            jsr        Ax_malloc
[00060c38] 226f 001c                 movea.l    28(a7),a1
[00060c3c] 2288                      move.l     a0,(a1)
[00060c3e] 202f 001c                 move.l     28(a7),d0
[00060c42] 6612                      bne.s      ParseGSCommands_19
[00060c44] 426f 0002                 clr.w      2(a7)
[00060c48] 3017                      move.w     (a7),d0
[00060c4a] 206f 0004                 movea.l    4(a7),a0
[00060c4e] 4eb9 0004 7410            jsr        Ast_deleteAry
[00060c54] 6058                      bra.s      ParseGSCommands_1
ParseGSCommands_19:
[00060c56] 4240                      clr.w      d0
[00060c58] 3f40 0018                 move.w     d0,24(a7)
[00060c5c] 3f40 001a                 move.w     d0,26(a7)
[00060c60] 2f6f 0004 000c            move.l     4(a7),12(a7)
[00060c66] 602a                      bra.s      ParseGSCommands_20
ParseGSCommands_23:
[00060c68] 206f 000c                 movea.l    12(a7),a0
[00060c6c] 2010                      move.l     (a0),d0
[00060c6e] 671a                      beq.s      ParseGSCommands_21
[00060c70] 206f 000c                 movea.l    12(a7),a0
[00060c74] 302f 0018                 move.w     24(a7),d0
[00060c78] 48c0                      ext.l      d0
[00060c7a] e588                      lsl.l      #2,d0
[00060c7c] 226f 001c                 movea.l    28(a7),a1
[00060c80] 2251                      movea.l    (a1),a1
[00060c82] 2390 0800                 move.l     (a0),0(a1,d0.l)
[00060c86] 526f 0018                 addq.w     #1,24(a7)
ParseGSCommands_21:
[00060c8a] 526f 001a                 addq.w     #1,26(a7)
[00060c8e] 58af 000c                 addq.l     #4,12(a7)
ParseGSCommands_20:
[00060c92] 302f 001a                 move.w     26(a7),d0
[00060c96] b057                      cmp.w      (a7),d0
[00060c98] 6c0a                      bge.s      ParseGSCommands_22
[00060c9a] 302f 0018                 move.w     24(a7),d0
[00060c9e] b06f 0002                 cmp.w      2(a7),d0
[00060ca2] 6dc4                      blt.s      ParseGSCommands_23
ParseGSCommands_22:
[00060ca4] 206f 0004                 movea.l    4(a7),a0
[00060ca8] 4eb9 0004 c7c8            jsr        Ax_free
ParseGSCommands_1:
[00060cae] 302f 0002                 move.w     2(a7),d0
[00060cb2] 4fef 0024                 lea.l      36(a7),a7
[00060cb6] 4e75                      rts

	.globl Aev_GetGSRequest
Aev_GetGSRequest:
[00060cb8] 2f0a                      move.l     a2,-(a7)
[00060cba] 4fef ffe8                 lea.l      -24(a7),a7
[00060cbe] 2f48 0014                 move.l     a0,20(a7)
[00060cc2] 206f 0014                 movea.l    20(a7),a0
[00060cc6] 2f50 0010                 move.l     (a0),16(a7)
[00060cca] 206f 0010                 movea.l    16(a7),a0
[00060cce] 3f68 0002 0004            move.w     2(a0),4(a7)
[00060cd4] 206f 0010                 movea.l    16(a7),a0
[00060cd8] 3f68 000e 0006            move.w     14(a0),6(a7)
[00060cde] 487a fc2e                 pea.l      CmpIDKanal(pc)
[00060ce2] 43ef 0008                 lea.l      8(a7),a1
[00060ce6] 2079 000e 1ab6            movea.l    gs_connect,a0
[00060cec] 2479 000e 1ab6            movea.l    gs_connect,a2
[00060cf2] 246a 0020                 movea.l    32(a2),a2
[00060cf6] 4e92                      jsr        (a2)
[00060cf8] 584f                      addq.w     #4,a7
[00060cfa] 2f48 000c                 move.l     a0,12(a7)
[00060cfe] 202f 000c                 move.l     12(a7),d0
[00060d02] 6658                      bne.s      Aev_GetGSRequest_1
[00060d04] 7012                      moveq.l    #18,d0
[00060d06] 4eb9 0004 c608            jsr        Ax_malloc
[00060d0c] 2f48 000c                 move.l     a0,12(a7)
[00060d10] 202f 000c                 move.l     12(a7),d0
[00060d14] 6606                      bne.s      Aev_GetGSRequest_2
[00060d16] 4240                      clr.w      d0
[00060d18] 6000 00a0                 bra        Aev_GetGSRequest_3
Aev_GetGSRequest_2:
[00060d1c] 7212                      moveq.l    #18,d1
[00060d1e] 4240                      clr.w      d0
[00060d20] 206f 000c                 movea.l    12(a7),a0
[00060d24] 4eb9 0008 36ea            jsr        memset
[00060d2a] 206f 0010                 movea.l    16(a7),a0
[00060d2e] 226f 000c                 movea.l    12(a7),a1
[00060d32] 32a8 0002                 move.w     2(a0),(a1)
[00060d36] 206f 0010                 movea.l    16(a7),a0
[00060d3a] 226f 000c                 movea.l    12(a7),a1
[00060d3e] 3368 000e 000e            move.w     14(a0),14(a1)
[00060d44] 226f 000c                 movea.l    12(a7),a1
[00060d48] 2079 000e 1ab6            movea.l    gs_connect,a0
[00060d4e] 2479 000e 1ab6            movea.l    gs_connect,a2
[00060d54] 246a 000c                 movea.l    12(a2),a2
[00060d58] 4e92                      jsr        (a2)
[00060d5a] 600e                      bra.s      Aev_GetGSRequest_4
Aev_GetGSRequest_1:
[00060d5c] 7002                      moveq.l    #2,d0
[00060d5e] 206f 000c                 movea.l    12(a7),a0
[00060d62] 4eb9 0006 10e2            jsr        Aev_GSReply
[00060d68] 6050                      bra.s      Aev_GetGSRequest_3
Aev_GetGSRequest_4:
[00060d6a] 206f 0010                 movea.l    16(a7),a0
[00060d6e] 2ea8 0006                 move.l     6(a0),(a7)
[00060d72] 4241                      clr.w      d1
[00060d74] 700c                      moveq.l    #12,d0
[00060d76] 2057                      movea.l    (a7),a0
[00060d78] 4eb9 0004 ca32            jsr        Ax_memCheck
[00060d7e] 4a40                      tst.w      d0
[00060d80] 672a                      beq.s      Aev_GetGSRequest_5
[00060d82] 700c                      moveq.l    #12,d0
[00060d84] 2257                      movea.l    (a7),a1
[00060d86] 206f 000c                 movea.l    12(a7),a0
[00060d8a] 5448                      addq.w     #2,a0
[00060d8c] 4eb9 0008 3500            jsr        memcpy
[00060d92] 206f 000c                 movea.l    12(a7),a0
[00060d96] 0068 0001 0010            ori.w      #$0001,16(a0)
[00060d9c] 4240                      clr.w      d0
[00060d9e] 206f 000c                 movea.l    12(a7),a0
[00060da2] 4eb9 0006 10e2            jsr        Aev_GSReply
[00060da8] 6010                      bra.s      Aev_GetGSRequest_3
[00060daa] 600e                      bra.s      Aev_GetGSRequest_3
Aev_GetGSRequest_5:
[00060dac] 7001                      moveq.l    #1,d0
[00060dae] 206f 000c                 movea.l    12(a7),a0
[00060db2] 4eb9 0006 10e2            jsr        Aev_GSReply
[00060db8] 4e71                      nop
Aev_GetGSRequest_3:
[00060dba] 4fef 0018                 lea.l      24(a7),a7
[00060dbe] 245f                      movea.l    (a7)+,a2
[00060dc0] 4e75                      rts

	.globl Aev_GetGSQuit
Aev_GetGSQuit:
[00060dc2] 2f0a                      move.l     a2,-(a7)
[00060dc4] 4fef fff4                 lea.l      -12(a7),a7
[00060dc8] 2f48 0008                 move.l     a0,8(a7)
[00060dcc] 41f9 000e 1aba            lea.l      $000E1ABA,a0
[00060dd2] 43d7                      lea.l      (a7),a1
[00060dd4] 22d8                      move.l     (a0)+,(a1)+
[00060dd6] 22d8                      move.l     (a0)+,(a1)+
[00060dd8] 206f 0008                 movea.l    8(a7),a0
[00060ddc] 2050                      movea.l    (a0),a0
[00060dde] 3ea8 0002                 move.w     2(a0),(a7)
[00060de2] 206f 0008                 movea.l    8(a7),a0
[00060de6] 2050                      movea.l    (a0),a0
[00060de8] 3f68 000e 0002            move.w     14(a0),2(a7)
[00060dee] 487a fb4c                 pea.l      SetStatus(pc)
[00060df2] 487a fb1a                 pea.l      CmpIDKanal(pc)
[00060df6] 43ef 0008                 lea.l      8(a7),a1
[00060dfa] 2079 000e 1ab6            movea.l    gs_connect,a0
[00060e00] 2479 000e 1ab6            movea.l    gs_connect,a2
[00060e06] 246a 0040                 movea.l    64(a2),a2
[00060e0a] 4e92                      jsr        (a2)
[00060e0c] 504f                      addq.w     #8,a7
[00060e0e] 487a fafe                 pea.l      CmpIDKanal(pc)
[00060e12] 43ef 0004                 lea.l      4(a7),a1
[00060e16] 2079 000e 1ab6            movea.l    gs_connect,a0
[00060e1c] 2479 000e 1ab6            movea.l    gs_connect,a2
[00060e22] 246a 0018                 movea.l    24(a2),a2
[00060e26] 4e92                      jsr        (a2)
[00060e28] 584f                      addq.w     #4,a7
[00060e2a] 7001                      moveq.l    #1,d0
[00060e2c] 4fef 000c                 lea.l      12(a7),a7
[00060e30] 245f                      movea.l    (a7)+,a2
[00060e32] 4e75                      rts

	.globl Aev_GetGSCommand
Aev_GetGSCommand:
[00060e34] 2f0a                      move.l     a2,-(a7)
[00060e36] 4fef ffd0                 lea.l      -48(a7),a7
[00060e3a] 2f48 002c                 move.l     a0,44(a7)
[00060e3e] 206f 002c                 movea.l    44(a7),a0
[00060e42] 2f50 0028                 move.l     (a0),40(a7)
[00060e46] 7010                      moveq.l    #16,d0
[00060e48] 226f 0028                 movea.l    40(a7),a1
[00060e4c] 41d7                      lea.l      (a7),a0
[00060e4e] 4eb9 0008 3500            jsr        memcpy
[00060e54] 7004                      moveq.l    #4,d0
[00060e56] 4eb9 0004 c608            jsr        Ax_malloc
[00060e5c] 2f48 0010                 move.l     a0,16(a7)
[00060e60] 3f7c 0001 0014            move.w     #$0001,20(a7)
[00060e66] 426f 0016                 clr.w      22(a7)
[00060e6a] 202f 0010                 move.l     16(a7),d0
[00060e6e] 660e                      bne.s      Aev_GetGSCommand_1
[00060e70] 41d7                      lea.l      (a7),a0
[00060e72] 6100 fafe                 bsr        SendGsAck
[00060e76] 4240                      clr.w      d0
[00060e78] 6000 010c                 bra        Aev_GetGSCommand_2
[00060e7c] 6012                      bra.s      Aev_GetGSCommand_3
Aev_GetGSCommand_1:
[00060e7e] 41f9 000e 1b01            lea.l      $000E1B01,a0
[00060e84] 4eb9 0004 643c            jsr        Ast_create
[00060e8a] 226f 0010                 movea.l    16(a7),a1
[00060e8e] 2288                      move.l     a0,(a1)
Aev_GetGSCommand_3:
[00060e90] 206f 0028                 movea.l    40(a7),a0
[00060e94] 2f68 0006 0024            move.l     6(a0),36(a7)
[00060e9a] 4241                      clr.w      d1
[00060e9c] 70fe                      moveq.l    #-2,d0
[00060e9e] 206f 0024                 movea.l    36(a7),a0
[00060ea2] 4eb9 0004 ca32            jsr        Ax_memCheck
[00060ea8] 4a40                      tst.w      d0
[00060eaa] 6700 00cc                 beq        Aev_GetGSCommand_4
[00060eae] 43ef 0020                 lea.l      32(a7),a1
[00060eb2] 206f 0024                 movea.l    36(a7),a0
[00060eb6] 6100 fb52                 bsr        ParseGSCommands
[00060eba] 3f40 001c                 move.w     d0,28(a7)
[00060ebe] 43ef 0010                 lea.l      16(a7),a1
[00060ec2] 206f 0020                 movea.l    32(a7),a0
[00060ec6] 302f 001c                 move.w     28(a7),d0
[00060eca] 2479 0010 ee4e            movea.l    ACSblk,a2
[00060ed0] 246a 04ee                 movea.l    1262(a2),a2
[00060ed4] 4e92                      jsr        (a2)
[00060ed6] 3f40 0016                 move.w     d0,22(a7)
[00060eda] 302f 0016                 move.w     22(a7),d0
[00060ede] 6754                      beq.s      Aev_GetGSCommand_5
[00060ee0] 0c6f 0001 001c            cmpi.w     #$0001,28(a7)
[00060ee6] 6f12                      ble.s      Aev_GetGSCommand_6
[00060ee8] 4240                      clr.w      d0
[00060eea] 206f 0020                 movea.l    32(a7),a0
[00060eee] 2068 0004                 movea.l    4(a0),a0
[00060ef2] 4eb9 0005 b3e0            jsr        Awi_name
[00060ef8] 6006                      bra.s      Aev_GetGSCommand_7
Aev_GetGSCommand_6:
[00060efa] 4eb9 0005 5e8c            jsr        Awi_root
Aev_GetGSCommand_7:
[00060f00] 2f48 0018                 move.l     a0,24(a7)
[00060f04] 202f 0018                 move.l     24(a7),d0
[00060f08] 672a                      beq.s      Aev_GetGSCommand_5
[00060f0a] 206f 0018                 movea.l    24(a7),a0
[00060f0e] 2028 0096                 move.l     150(a0),d0
[00060f12] 6720                      beq.s      Aev_GetGSCommand_5
[00060f14] 486f 0010                 pea.l      16(a7)
[00060f18] 226f 0024                 movea.l    36(a7),a1
[00060f1c] 302f 0020                 move.w     32(a7),d0
[00060f20] 206f 001c                 movea.l    28(a7),a0
[00060f24] 246f 001c                 movea.l    28(a7),a2
[00060f28] 246a 0096                 movea.l    150(a2),a2
[00060f2c] 4e92                      jsr        (a2)
[00060f2e] 584f                      addq.w     #4,a7
[00060f30] 3f40 0016                 move.w     d0,22(a7)
Aev_GetGSCommand_5:
[00060f34] 302f 001c                 move.w     28(a7),d0
[00060f38] 206f 0020                 movea.l    32(a7),a0
[00060f3c] 4eb9 0004 7410            jsr        Ast_deleteAry
[00060f42] 426f 001e                 clr.w      30(a7)
[00060f46] 601a                      bra.s      Aev_GetGSCommand_8
Aev_GetGSCommand_9:
[00060f48] 302f 001e                 move.w     30(a7),d0
[00060f4c] 48c0                      ext.l      d0
[00060f4e] e588                      lsl.l      #2,d0
[00060f50] 206f 0010                 movea.l    16(a7),a0
[00060f54] 2070 0800                 movea.l    0(a0,d0.l),a0
[00060f58] 4eb9 0004 649c            jsr        Ast_delete
[00060f5e] 526f 001e                 addq.w     #1,30(a7)
Aev_GetGSCommand_8:
[00060f62] 302f 001e                 move.w     30(a7),d0
[00060f66] b06f 0014                 cmp.w      20(a7),d0
[00060f6a] 6ddc                      blt.s      Aev_GetGSCommand_9
[00060f6c] 206f 0010                 movea.l    16(a7),a0
[00060f70] 4eb9 0004 c7c8            jsr        Ax_free
[00060f76] 6006                      bra.s      Aev_GetGSCommand_10
Aev_GetGSCommand_4:
[00060f78] 3f7c 0002 0016            move.w     #$0002,22(a7)
Aev_GetGSCommand_10:
[00060f7e] 41d7                      lea.l      (a7),a0
[00060f80] 6100 f9f0                 bsr        SendGsAck
[00060f84] 7001                      moveq.l    #1,d0
Aev_GetGSCommand_2:
[00060f86] 4fef 0030                 lea.l      48(a7),a7
[00060f8a] 245f                      movea.l    (a7)+,a2
[00060f8c] 4e75                      rts

	.globl Aev_GetGSAck
Aev_GetGSAck:
[00060f8e] 2f0a                      move.l     a2,-(a7)
[00060f90] 4fef ffc6                 lea.l      -58(a7),a7
[00060f94] 2f48 0036                 move.l     a0,54(a7)
[00060f98] 206f 0036                 movea.l    54(a7),a0
[00060f9c] 2f50 0032                 move.l     (a0),50(a7)
[00060fa0] 206f 0032                 movea.l    50(a7),a0
[00060fa4] 2f68 0006 002e            move.l     6(a0),46(a7)
[00060faa] 206f 0032                 movea.l    50(a7),a0
[00060fae] 2f68 000a 002a            move.l     10(a0),42(a7)
[00060fb4] 3f7c 1352 0028            move.w     #$1352,40(a7)
[00060fba] 206f 0032                 movea.l    50(a7),a0
[00060fbe] 3ea8 0002                 move.w     2(a0),(a7)
[00060fc2] 41ef 0028                 lea.l      40(a7),a0
[00060fc6] 2f48 0004                 move.l     a0,4(a7)
[00060fca] 42af 0008                 clr.l      8(a7)
[00060fce] 42af 000c                 clr.l      12(a7)
[00060fd2] 206f 0032                 movea.l    50(a7),a0
[00060fd6] 5c48                      addq.w     #6,a0
[00060fd8] 2f48 0010                 move.l     a0,16(a7)
[00060fdc] 206f 0032                 movea.l    50(a7),a0
[00060fe0] 5048                      addq.w     #8,a0
[00060fe2] 2f48 0014                 move.l     a0,20(a7)
[00060fe6] 202f 002e                 move.l     46(a7),d0
[00060fea] 6704                      beq.s      Aev_GetGSAck_1
[00060fec] 91c8                      suba.l     a0,a0
[00060fee] 6008                      bra.s      Aev_GetGSAck_2
Aev_GetGSAck_1:
[00060ff0] 206f 0032                 movea.l    50(a7),a0
[00060ff4] 41e8 000a                 lea.l      10(a0),a0
Aev_GetGSAck_2:
[00060ff8] 2f48 0018                 move.l     a0,24(a7)
[00060ffc] 202f 002e                 move.l     46(a7),d0
[00061000] 6704                      beq.s      Aev_GetGSAck_3
[00061002] 91c8                      suba.l     a0,a0
[00061004] 6008                      bra.s      Aev_GetGSAck_4
Aev_GetGSAck_3:
[00061006] 206f 0032                 movea.l    50(a7),a0
[0006100a] 41e8 000c                 lea.l      12(a0),a0
Aev_GetGSAck_4:
[0006100e] 2f48 001c                 move.l     a0,28(a7)
[00061012] 42af 0020                 clr.l      32(a7)
[00061016] 4879 0005 d87e            pea.l      Aev_CmpMsgInList
[0006101c] 43ef 0004                 lea.l      4(a7),a1
[00061020] 2079 000d fba6            movea.l    SentMsg,a0
[00061026] 2479 000d fba6            movea.l    SentMsg,a2
[0006102c] 246a 0020                 movea.l    32(a2),a2
[00061030] 4e92                      jsr        (a2)
[00061032] 584f                      addq.w     #4,a7
[00061034] 2f48 0024                 move.l     a0,36(a7)
[00061038] 202f 0024                 move.l     36(a7),d0
[0006103c] 6728                      beq.s      Aev_GetGSAck_5
[0006103e] 206f 0024                 movea.l    36(a7),a0
[00061042] 2028 0002                 move.l     2(a0),d0
[00061046] 4e71                      nop
[00061048] 4879 0007 0f86            pea.l      Alu_ptrCmp
[0006104e] 226f 0028                 movea.l    40(a7),a1
[00061052] 2079 000d fba6            movea.l    SentMsg,a0
[00061058] 2479 000d fba6            movea.l    SentMsg,a2
[0006105e] 246a 0020                 movea.l    32(a2),a2
[00061062] 4e92                      jsr        (a2)
[00061064] 584f                      addq.w     #4,a7
Aev_GetGSAck_5:
[00061066] 202f 002e                 move.l     46(a7),d0
[0006106a] 6748                      beq.s      Aev_GetGSAck_6
[0006106c] 4879 0007 0f86            pea.l      Alu_ptrCmp
[00061072] 226f 0032                 movea.l    50(a7),a1
[00061076] 2079 000e 147e            movea.l    globProtData,a0
[0006107c] 2479 000e 147e            movea.l    globProtData,a2
[00061082] 246a 0018                 movea.l    24(a2),a2
[00061086] 4e92                      jsr        (a2)
[00061088] 584f                      addq.w     #4,a7
[0006108a] 202f 002a                 move.l     42(a7),d0
[0006108e] 6722                      beq.s      Aev_GetGSAck_7
[00061090] 206f 0032                 movea.l    50(a7),a0
[00061094] 4268 0006                 clr.w      6(a0)
[00061098] 206f 0032                 movea.l    50(a7),a0
[0006109c] 4268 0008                 clr.w      8(a0)
[000610a0] 43f9 000e 1b03            lea.l      $000E1B03,a1
[000610a6] 4240                      clr.w      d0
[000610a8] 206f 0032                 movea.l    50(a7),a0
[000610ac] 4eb9 0006 11c8            jsr        Aev_GSAck
Aev_GetGSAck_7:
[000610b2] 6024                      bra.s      Aev_GetGSAck_8
Aev_GetGSAck_6:
[000610b4] 202f 002a                 move.l     42(a7),d0
[000610b8] 671e                      beq.s      Aev_GetGSAck_8
[000610ba] 4879 0007 0f86            pea.l      Alu_ptrCmp
[000610c0] 226f 002e                 movea.l    46(a7),a1
[000610c4] 2079 000e 147e            movea.l    globProtData,a0
[000610ca] 2479 000e 147e            movea.l    globProtData,a2
[000610d0] 246a 0018                 movea.l    24(a2),a2
[000610d4] 4e92                      jsr        (a2)
[000610d6] 584f                      addq.w     #4,a7
Aev_GetGSAck_8:
[000610d8] 7001                      moveq.l    #1,d0
[000610da] 4fef 003a                 lea.l      58(a7),a7
[000610de] 245f                      movea.l    (a7)+,a2
[000610e0] 4e75                      rts

Aev_GSReply:
[000610e2] 2f0a                      move.l     a2,-(a7)
[000610e4] 4fef ffea                 lea.l      -22(a7),a7
[000610e8] 2f48 0012                 move.l     a0,18(a7)
[000610ec] 3f40 0010                 move.w     d0,16(a7)
[000610f0] 206f 0012                 movea.l    18(a7),a0
[000610f4] 3010                      move.w     (a0),d0
[000610f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000610fc] b050                      cmp.w      (a0),d0
[000610fe] 6754                      beq.s      Aev_GSReply_1
[00061100] 7210                      moveq.l    #16,d1
[00061102] 4240                      clr.w      d0
[00061104] 41d7                      lea.l      (a7),a0
[00061106] 4eb9 0008 36ea            jsr        memset
[0006110c] 3ebc 1351                 move.w     #$1351,(a7)
[00061110] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061116] 3f50 0002                 move.w     (a0),2(a7)
[0006111a] 3f6f 0010 000c            move.w     16(a7),12(a7)
[00061120] 206f 0012                 movea.l    18(a7),a0
[00061124] 3f68 000e 000e            move.w     14(a0),14(a7)
[0006112a] 2f79 000e 1ab2 0006       move.l     gs_infodata,6(a7)
[00061132] 2279 000e 692a            movea.l    _globl,a1
[00061138] 41d7                      lea.l      (a7),a0
[0006113a] 7210                      moveq.l    #16,d1
[0006113c] 246f 0012                 movea.l    18(a7),a2
[00061140] 3012                      move.w     (a2),d0
[00061142] 4eb9 0007 8ae8            jsr        mt_appl_write
[00061148] 4a40                      tst.w      d0
[0006114a] 6704                      beq.s      Aev_GSReply_2
[0006114c] 7001                      moveq.l    #1,d0
[0006114e] 6002                      bra.s      Aev_GSReply_3
Aev_GSReply_2:
[00061150] 4240                      clr.w      d0
Aev_GSReply_3:
[00061152] 6002                      bra.s      Aev_GSReply_4
Aev_GSReply_1:
[00061154] 4240                      clr.w      d0
Aev_GSReply_4:
[00061156] 4fef 0016                 lea.l      22(a7),a7
[0006115a] 245f                      movea.l    (a7)+,a2
[0006115c] 4e75                      rts

Aev_GSQuit:
[0006115e] 2f0a                      move.l     a2,-(a7)
[00061160] 4fef ffdc                 lea.l      -36(a7),a7
[00061164] 2f48 0020                 move.l     a0,32(a7)
[00061168] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006116e] 3010                      move.w     (a0),d0
[00061170] 206f 0020                 movea.l    32(a7),a0
[00061174] b050                      cmp.w      (a0),d0
[00061176] 6746                      beq.s      Aev_GSQuit_1
[00061178] 7210                      moveq.l    #16,d1
[0006117a] 4240                      clr.w      d0
[0006117c] 41d7                      lea.l      (a7),a0
[0006117e] 4eb9 0008 36ea            jsr        memset
[00061184] 3ebc 1354                 move.w     #$1354,(a7)
[00061188] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006118e] 3f50 0002                 move.w     (a0),2(a7)
[00061192] 206f 0020                 movea.l    32(a7),a0
[00061196] 3f68 000e 000e            move.w     14(a0),14(a7)
[0006119c] 2279 000e 692a            movea.l    _globl,a1
[000611a2] 41d7                      lea.l      (a7),a0
[000611a4] 7210                      moveq.l    #16,d1
[000611a6] 246f 0020                 movea.l    32(a7),a2
[000611aa] 3012                      move.w     (a2),d0
[000611ac] 4eb9 0007 8ae8            jsr        mt_appl_write
[000611b2] 4a40                      tst.w      d0
[000611b4] 6704                      beq.s      Aev_GSQuit_2
[000611b6] 7001                      moveq.l    #1,d0
[000611b8] 6002                      bra.s      Aev_GSQuit_3
Aev_GSQuit_2:
[000611ba] 4240                      clr.w      d0
Aev_GSQuit_3:
[000611bc] 6002                      bra.s      Aev_GSQuit_4
Aev_GSQuit_1:
[000611be] 4240                      clr.w      d0
Aev_GSQuit_4:
[000611c0] 4fef 0024                 lea.l      36(a7),a7
[000611c4] 245f                      movea.l    (a7)+,a2
[000611c6] 4e75                      rts

Aev_GSAck:
[000611c8] 2f0a                      move.l     a2,-(a7)
[000611ca] 4fef ffd6                 lea.l      -42(a7),a7
[000611ce] 2f48 0026                 move.l     a0,38(a7)
[000611d2] 3f40 0024                 move.w     d0,36(a7)
[000611d6] 2f49 0020                 move.l     a1,32(a7)
[000611da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000611e0] 3010                      move.w     (a0),d0
[000611e2] 206f 0026                 movea.l    38(a7),a0
[000611e6] b068 0002                 cmp.w      2(a0),d0
[000611ea] 675e                      beq.s      Aev_GSAck_1
[000611ec] 7210                      moveq.l    #16,d1
[000611ee] 4240                      clr.w      d0
[000611f0] 41d7                      lea.l      (a7),a0
[000611f2] 4eb9 0008 36ea            jsr        memset
[000611f8] 3ebc 1353                 move.w     #$1353,(a7)
[000611fc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00061202] 3f50 0002                 move.w     (a0),2(a7)
[00061206] 206f 0026                 movea.l    38(a7),a0
[0006120a] 3f68 0006 0006            move.w     6(a0),6(a7)
[00061210] 206f 0026                 movea.l    38(a7),a0
[00061214] 3f68 0008 0008            move.w     8(a0),8(a7)
[0006121a] 3f6f 0024 000e            move.w     36(a7),14(a7)
[00061220] 2f6f 0020 000a            move.l     32(a7),10(a7)
[00061226] 2279 000e 692a            movea.l    _globl,a1
[0006122c] 41d7                      lea.l      (a7),a0
[0006122e] 7210                      moveq.l    #16,d1
[00061230] 246f 0026                 movea.l    38(a7),a2
[00061234] 302a 0002                 move.w     2(a2),d0
[00061238] 4eb9 0007 8ae8            jsr        mt_appl_write
[0006123e] 4a40                      tst.w      d0
[00061240] 6704                      beq.s      Aev_GSAck_2
[00061242] 7001                      moveq.l    #1,d0
[00061244] 6002                      bra.s      Aev_GSAck_3
Aev_GSAck_2:
[00061246] 4240                      clr.w      d0
Aev_GSAck_3:
[00061248] 6002                      bra.s      Aev_GSAck_4
Aev_GSAck_1:
[0006124a] 4240                      clr.w      d0
Aev_GSAck_4:
[0006124c] 4fef 002a                 lea.l      42(a7),a7
[00061250] 245f                      movea.l    (a7)+,a2
[00061252] 4e75                      rts

_gs_cmp:
[00061254] 514f                      subq.w     #8,a7
[00061256] 2f48 0004                 move.l     a0,4(a7)
[0006125a] 2e89                      move.l     a1,(a7)
[0006125c] 2057                      movea.l    (a7),a0
[0006125e] 2250                      movea.l    (a0),a1
[00061260] 206f 0004                 movea.l    4(a7),a0
[00061264] 2050                      movea.l    (a0),a0
[00061266] 4eb9 0004 66ea            jsr        Ast_icmp
[0006126c] 504f                      addq.w     #8,a7
[0006126e] 4e75                      rts

_gs_search:
[00061270] 514f                      subq.w     #8,a7
[00061272] 2f48 0004                 move.l     a0,4(a7)
[00061276] 2e89                      move.l     a1,(a7)
[00061278] 2057                      movea.l    (a7),a0
[0006127a] 2250                      movea.l    (a0),a1
[0006127c] 206f 0004                 movea.l    4(a7),a0
[00061280] 4eb9 0004 66ea            jsr        Ast_icmp
[00061286] 504f                      addq.w     #8,a7
[00061288] 4e75                      rts

	.globl _gs_strcmp
_gs_strcmp:
[0006128a] 514f                      subq.w     #8,a7
[0006128c] 2f48 0004                 move.l     a0,4(a7)
[00061290] 2e89                      move.l     a1,(a7)
[00061292] 2057                      movea.l    (a7),a0
[00061294] 2250                      movea.l    (a0),a1
[00061296] 206f 0004                 movea.l    4(a7),a0
[0006129a] 2050                      movea.l    (a0),a0
[0006129c] 4eb9 0004 66ea            jsr        Ast_icmp
[000612a2] 504f                      addq.w     #8,a7
[000612a4] 4e75                      rts

	.globl Aev_GEMScript
Aev_GEMScript:
[000612a6] 2f0a                      move.l     a2,-(a7)
[000612a8] 4fef fff2                 lea.l      -14(a7),a7
[000612ac] 3f40 000c                 move.w     d0,12(a7)
[000612b0] 2f48 0008                 move.l     a0,8(a7)
[000612b4] 2f49 0004                 move.l     a1,4(a7)
[000612b8] 206f 0004                 movea.l    4(a7),a0
[000612bc] 317c 0001 0006            move.w     #$0001,6(a0)
[000612c2] 3039 000e 1af4            move.w     _gs_sorted,d0
[000612c8] 6622                      bne.s      Aev_GEMScript_1
[000612ca] 43fa ff88                 lea.l      _gs_cmp(pc),a1
[000612ce] 7208                      moveq.l    #8,d1
[000612d0] 3039 000e 1af2            move.w     _gs_cmd_anzahl,d0
[000612d6] 48c0                      ext.l      d0
[000612d8] 41f9 000e 1ac2            lea.l      _gs_commands,a0
[000612de] 4eb9 0008 1240            jsr        qsort
[000612e4] 33fc 0001 000e 1af4       move.w     #$0001,_gs_sorted
Aev_GEMScript_1:
[000612ec] 487a ff82                 pea.l      _gs_search(pc)
[000612f0] 7208                      moveq.l    #8,d1
[000612f2] 3039 000e 1af2            move.w     _gs_cmd_anzahl,d0
[000612f8] 48c0                      ext.l      d0
[000612fa] 43f9 000e 1ac2            lea.l      _gs_commands,a1
[00061300] 206f 000c                 movea.l    12(a7),a0
[00061304] 2050                      movea.l    (a0),a0
[00061306] 4eb9 0008 10a4            jsr        bsearch
[0006130c] 584f                      addq.w     #4,a7
[0006130e] 2e88                      move.l     a0,(a7)
[00061310] 2017                      move.l     (a7),d0
[00061312] 672e                      beq.s      Aev_GEMScript_2
[00061314] 2057                      movea.l    (a7),a0
[00061316] 2028 0004                 move.l     4(a0),d0
[0006131a] 671e                      beq.s      Aev_GEMScript_3
[0006131c] 226f 0004                 movea.l    4(a7),a1
[00061320] 206f 0008                 movea.l    8(a7),a0
[00061324] 302f 000c                 move.w     12(a7),d0
[00061328] 2457                      movea.l    (a7),a2
[0006132a] 246a 0004                 movea.l    4(a2),a2
[0006132e] 4e92                      jsr        (a2)
[00061330] 206f 0004                 movea.l    4(a7),a0
[00061334] 3140 0006                 move.w     d0,6(a0)
[00061338] 6008                      bra.s      Aev_GEMScript_2
Aev_GEMScript_3:
[0006133a] 206f 0004                 movea.l    4(a7),a0
[0006133e] 4268 0006                 clr.w      6(a0)
Aev_GEMScript_2:
[00061342] 206f 0004                 movea.l    4(a7),a0
[00061346] 3028 0006                 move.w     6(a0),d0
[0006134a] 4fef 000e                 lea.l      14(a7),a7
[0006134e] 245f                      movea.l    (a7)+,a2
[00061350] 4e75                      rts

gs_SendToTopWindow:
[00061352] 2f0a                      move.l     a2,-(a7)
[00061354] 4fef fff2                 lea.l      -14(a7),a7
[00061358] 3f40 000c                 move.w     d0,12(a7)
[0006135c] 2f48 0008                 move.l     a0,8(a7)
[00061360] 2f49 0004                 move.l     a1,4(a7)
[00061364] 4eb9 0005 5c5a            jsr        Awi_ontop
[0006136a] 2e88                      move.l     a0,(a7)
[0006136c] 2f2f 0004                 move.l     4(a7),-(a7)
[00061370] 226f 000c                 movea.l    12(a7),a1
[00061374] 302f 0010                 move.w     16(a7),d0
[00061378] 206f 0004                 movea.l    4(a7),a0
[0006137c] 246f 0004                 movea.l    4(a7),a2
[00061380] 246a 0096                 movea.l    150(a2),a2
[00061384] 4e92                      jsr        (a2)
[00061386] 584f                      addq.w     #4,a7
[00061388] 4fef 000e                 lea.l      14(a7),a7
[0006138c] 245f                      movea.l    (a7)+,a2
[0006138e] 4e75                      rts

gs_AppGetLongName:
[00061390] 594f                      subq.w     #4,a7
[00061392] 2e89                      move.l     a1,(a7)
[00061394] 2057                      movea.l    (a7),a0
[00061396] 2050                      movea.l    (a0),a0
[00061398] 2050                      movea.l    (a0),a0
[0006139a] 4eb9 0004 c7c8            jsr        Ax_free
[000613a0] 2057                      movea.l    (a7),a0
[000613a2] 317c 0001 0004            move.w     #$0001,4(a0)
[000613a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000613ae] 2068 04e6                 movea.l    1254(a0),a0
[000613b2] 4eb9 0004 643c            jsr        Ast_create
[000613b8] 2257                      movea.l    (a7),a1
[000613ba] 2251                      movea.l    (a1),a1
[000613bc] 2288                      move.l     a0,(a1)
[000613be] 4240                      clr.w      d0
[000613c0] 584f                      addq.w     #4,a7
[000613c2] 4e75                      rts

gs_CheckCommand:
[000613c4] 4fef fff2                 lea.l      -14(a7),a7
[000613c8] 3f40 000c                 move.w     d0,12(a7)
[000613cc] 2f48 0008                 move.l     a0,8(a7)
[000613d0] 2f49 0004                 move.l     a1,4(a7)
[000613d4] 0c6f 0002 000c            cmpi.w     #$0002,12(a7)
[000613da] 6c06                      bge.s      gs_CheckCommand_1
[000613dc] 7002                      moveq.l    #2,d0
[000613de] 6000 0090                 bra        gs_CheckCommand_2
gs_CheckCommand_1:
[000613e2] 487a fe8c                 pea.l      _gs_search(pc)
[000613e6] 7208                      moveq.l    #8,d1
[000613e8] 3039 000e 1af2            move.w     _gs_cmd_anzahl,d0
[000613ee] 48c0                      ext.l      d0
[000613f0] 43f9 000e 1ac2            lea.l      _gs_commands,a1
[000613f6] 206f 000c                 movea.l    12(a7),a0
[000613fa] 2068 0004                 movea.l    4(a0),a0
[000613fe] 4eb9 0008 10a4            jsr        bsearch
[00061404] 584f                      addq.w     #4,a7
[00061406] 2e88                      move.l     a0,(a7)
[00061408] 2017                      move.l     (a7),d0
[0006140a] 6736                      beq.s      gs_CheckCommand_3
[0006140c] 206f 0004                 movea.l    4(a7),a0
[00061410] 2050                      movea.l    (a0),a0
[00061412] 2050                      movea.l    (a0),a0
[00061414] 4eb9 0004 c7c8            jsr        Ax_free
[0006141a] 41f9 000e 1b49            lea.l      $000E1B49,a0
[00061420] 4eb9 0004 643c            jsr        Ast_create
[00061426] 226f 0004                 movea.l    4(a7),a1
[0006142a] 2251                      movea.l    (a1),a1
[0006142c] 2288                      move.l     a0,(a1)
[0006142e] 206f 0004                 movea.l    4(a7),a0
[00061432] 317c 0001 0004            move.w     #$0001,4(a0)
[00061438] 206f 0004                 movea.l    4(a7),a0
[0006143c] 4268 0006                 clr.w      6(a0)
[00061440] 6026                      bra.s      gs_CheckCommand_4
gs_CheckCommand_3:
[00061442] 2f2f 0004                 move.l     4(a7),-(a7)
[00061446] 226f 000c                 movea.l    12(a7),a1
[0006144a] 2f09                      move.l     a1,-(a7)
[0006144c] 4eb9 0005 5e8c            jsr        Awi_root
[00061452] 302f 0014                 move.w     20(a7),d0
[00061456] 225f                      movea.l    (a7)+,a1
[00061458] 4eb9 0005 b5b6            jsr        Awi_gemscript
[0006145e] 584f                      addq.w     #4,a7
[00061460] 206f 0004                 movea.l    4(a7),a0
[00061464] 3140 0006                 move.w     d0,6(a0)
gs_CheckCommand_4:
[00061468] 206f 0004                 movea.l    4(a7),a0
[0006146c] 3028 0006                 move.w     6(a0),d0
gs_CheckCommand_2:
[00061470] 4fef 000e                 lea.l      14(a7),a7
[00061474] 4e75                      rts

gs_Quit:
[00061476] 594f                      subq.w     #4,a7
[00061478] 2e89                      move.l     a1,(a7)
[0006147a] 4eb9 0004 a30e            jsr        Aev_quit
[00061480] 2057                      movea.l    (a7),a0
[00061482] 2050                      movea.l    (a0),a0
[00061484] 2050                      movea.l    (a0),a0
[00061486] 4eb9 0004 c7c8            jsr        Ax_free
[0006148c] 41f9 000e 1b4b            lea.l      $000E1B4B,a0
[00061492] 4eb9 0004 643c            jsr        Ast_create
[00061498] 2257                      movea.l    (a7),a1
[0006149a] 2251                      movea.l    (a1),a1
[0006149c] 2288                      move.l     a0,(a1)
[0006149e] 2057                      movea.l    (a7),a0
[000614a0] 317c 0001 0004            move.w     #$0001,4(a0)
[000614a6] 4240                      clr.w      d0
[000614a8] 584f                      addq.w     #4,a7
[000614aa] 4e75                      rts

gs_GetAllCommands:
[000614ac] 2f0a                      move.l     a2,-(a7)
[000614ae] 4fef ffe2                 lea.l      -30(a7),a7
[000614b2] 3f40 001c                 move.w     d0,28(a7)
[000614b6] 2f48 0018                 move.l     a0,24(a7)
[000614ba] 2f49 0014                 move.l     a1,20(a7)
[000614be] 4eb9 0005 5c5a            jsr        Awi_ontop
[000614c4] 2e88                      move.l     a0,(a7)
[000614c6] 2f2f 0014                 move.l     20(a7),-(a7)
[000614ca] 226f 001c                 movea.l    28(a7),a1
[000614ce] 302f 0020                 move.w     32(a7),d0
[000614d2] 206f 0004                 movea.l    4(a7),a0
[000614d6] 246f 0004                 movea.l    4(a7),a2
[000614da] 246a 0096                 movea.l    150(a2),a2
[000614de] 4e92                      jsr        (a2)
[000614e0] 584f                      addq.w     #4,a7
[000614e2] 3f40 0012                 move.w     d0,18(a7)
[000614e6] 302f 0012                 move.w     18(a7),d0
[000614ea] 6708                      beq.s      gs_GetAllCommands_1
[000614ec] 302f 0012                 move.w     18(a7),d0
[000614f0] 6000 0212                 bra        gs_GetAllCommands_2
gs_GetAllCommands_1:
[000614f4] 3039 000e 1af2            move.w     _gs_cmd_anzahl,d0
[000614fa] 206f 0014                 movea.l    20(a7),a0
[000614fe] d068 0004                 add.w      4(a0),d0
[00061502] 3f40 000c                 move.w     d0,12(a7)
[00061506] 302f 000c                 move.w     12(a7),d0
[0006150a] 48c0                      ext.l      d0
[0006150c] e588                      lsl.l      #2,d0
[0006150e] 4eb9 0004 c608            jsr        Ax_malloc
[00061514] 2f48 0008                 move.l     a0,8(a7)
[00061518] 202f 0008                 move.l     8(a7),d0
[0006151c] 6606                      bne.s      gs_GetAllCommands_3
[0006151e] 7002                      moveq.l    #2,d0
[00061520] 6000 01e2                 bra        gs_GetAllCommands_2
gs_GetAllCommands_3:
[00061524] 322f 000c                 move.w     12(a7),d1
[00061528] 48c1                      ext.l      d1
[0006152a] e589                      lsl.l      #2,d1
[0006152c] 4240                      clr.w      d0
[0006152e] 206f 0008                 movea.l    8(a7),a0
[00061532] 4eb9 0008 36ea            jsr        memset
[00061538] 426f 0012                 clr.w      18(a7)
[0006153c] 6046                      bra.s      gs_GetAllCommands_4
gs_GetAllCommands_6:
[0006153e] 302f 0012                 move.w     18(a7),d0
[00061542] e748                      lsl.w      #3,d0
[00061544] 41f9 000e 1ac2            lea.l      _gs_commands,a0
[0006154a] 2070 0000                 movea.l    0(a0,d0.w),a0
[0006154e] 4eb9 0004 643c            jsr        Ast_create
[00061554] 302f 0012                 move.w     18(a7),d0
[00061558] 48c0                      ext.l      d0
[0006155a] e588                      lsl.l      #2,d0
[0006155c] 226f 0008                 movea.l    8(a7),a1
[00061560] 2388 0800                 move.l     a0,0(a1,d0.l)
[00061564] 202f 0008                 move.l     8(a7),d0
[00061568] 6616                      bne.s      gs_GetAllCommands_5
[0006156a] 3039 000e 1af2            move.w     _gs_cmd_anzahl,d0
[00061570] 206f 0008                 movea.l    8(a7),a0
[00061574] 4eb9 0004 7410            jsr        Ast_deleteAry
[0006157a] 7002                      moveq.l    #2,d0
[0006157c] 6000 0186                 bra        gs_GetAllCommands_2
gs_GetAllCommands_5:
[00061580] 526f 0012                 addq.w     #1,18(a7)
gs_GetAllCommands_4:
[00061584] 302f 0012                 move.w     18(a7),d0
[00061588] b079 000e 1af2            cmp.w      _gs_cmd_anzahl,d0
[0006158e] 6dae                      blt.s      gs_GetAllCommands_6
[00061590] 206f 0014                 movea.l    20(a7),a0
[00061594] 3028 0004                 move.w     4(a0),d0
[00061598] 48c0                      ext.l      d0
[0006159a] e588                      lsl.l      #2,d0
[0006159c] 206f 0014                 movea.l    20(a7),a0
[000615a0] 2250                      movea.l    (a0),a1
[000615a2] 3239 000e 1af2            move.w     _gs_cmd_anzahl,d1
[000615a8] 48c1                      ext.l      d1
[000615aa] e589                      lsl.l      #2,d1
[000615ac] 206f 0008                 movea.l    8(a7),a0
[000615b0] d1c1                      adda.l     d1,a0
[000615b2] 4eb9 0008 3500            jsr        memcpy
[000615b8] 43fa fcd0                 lea.l      _gs_strcmp(pc),a1
[000615bc] 7204                      moveq.l    #4,d1
[000615be] 302f 000c                 move.w     12(a7),d0
[000615c2] 48c0                      ext.l      d0
[000615c4] 206f 0008                 movea.l    8(a7),a0
[000615c8] 4eb9 0008 1240            jsr        qsort
[000615ce] 426f 000e                 clr.w      14(a7)
[000615d2] 3f7c 0001 0012            move.w     #$0001,18(a7)
[000615d8] 6032                      bra.s      gs_GetAllCommands_7
gs_GetAllCommands_9:
[000615da] 302f 0012                 move.w     18(a7),d0
[000615de] 48c0                      ext.l      d0
[000615e0] e588                      lsl.l      #2,d0
[000615e2] 206f 0008                 movea.l    8(a7),a0
[000615e6] 2270 0800                 movea.l    0(a0,d0.l),a1
[000615ea] 302f 0012                 move.w     18(a7),d0
[000615ee] 48c0                      ext.l      d0
[000615f0] e588                      lsl.l      #2,d0
[000615f2] 206f 0008                 movea.l    8(a7),a0
[000615f6] 2070 08fc                 movea.l    -4(a0,d0.l),a0
[000615fa] 4eb9 0004 66ea            jsr        Ast_icmp
[00061600] 4a40                      tst.w      d0
[00061602] 6604                      bne.s      gs_GetAllCommands_8
[00061604] 526f 000e                 addq.w     #1,14(a7)
gs_GetAllCommands_8:
[00061608] 526f 0012                 addq.w     #1,18(a7)
gs_GetAllCommands_7:
[0006160c] 302f 0012                 move.w     18(a7),d0
[00061610] b06f 000c                 cmp.w      12(a7),d0
[00061614] 6dc4                      blt.s      gs_GetAllCommands_9
[00061616] 302f 000c                 move.w     12(a7),d0
[0006161a] 906f 000e                 sub.w      14(a7),d0
[0006161e] 48c0                      ext.l      d0
[00061620] e588                      lsl.l      #2,d0
[00061622] 4eb9 0004 c608            jsr        Ax_malloc
[00061628] 2f48 0004                 move.l     a0,4(a7)
[0006162c] 202f 0004                 move.l     4(a7),d0
[00061630] 6700 00ac                 beq        gs_GetAllCommands_10
[00061634] 206f 0008                 movea.l    8(a7),a0
[00061638] 226f 0004                 movea.l    4(a7),a1
[0006163c] 2290                      move.l     (a0),(a1)
[0006163e] 3f7c 0001 0012            move.w     #$0001,18(a7)
[00061644] 3f7c 0001 0010            move.w     #$0001,16(a7)
[0006164a] 6060                      bra.s      gs_GetAllCommands_11
gs_GetAllCommands_14:
[0006164c] 302f 0010                 move.w     16(a7),d0
[00061650] 48c0                      ext.l      d0
[00061652] e588                      lsl.l      #2,d0
[00061654] 206f 0004                 movea.l    4(a7),a0
[00061658] 2270 08fc                 movea.l    -4(a0,d0.l),a1
[0006165c] 302f 0012                 move.w     18(a7),d0
[00061660] 48c0                      ext.l      d0
[00061662] e588                      lsl.l      #2,d0
[00061664] 206f 0008                 movea.l    8(a7),a0
[00061668] 2070 0800                 movea.l    0(a0,d0.l),a0
[0006166c] 4eb9 0004 66ea            jsr        Ast_icmp
[00061672] 4a40                      tst.w      d0
[00061674] 6732                      beq.s      gs_GetAllCommands_12
[00061676] 302f 0012                 move.w     18(a7),d0
[0006167a] 48c0                      ext.l      d0
[0006167c] e588                      lsl.l      #2,d0
[0006167e] 206f 0008                 movea.l    8(a7),a0
[00061682] 322f 0010                 move.w     16(a7),d1
[00061686] 48c1                      ext.l      d1
[00061688] e589                      lsl.l      #2,d1
[0006168a] 226f 0004                 movea.l    4(a7),a1
[0006168e] 23b0 0800 1800            move.l     0(a0,d0.l),0(a1,d1.l)
[00061694] 526f 0010                 addq.w     #1,16(a7)
[00061698] 302f 0012                 move.w     18(a7),d0
[0006169c] 48c0                      ext.l      d0
[0006169e] e588                      lsl.l      #2,d0
[000616a0] 206f 0008                 movea.l    8(a7),a0
[000616a4] 42b0 0800                 clr.l      0(a0,d0.l)
gs_GetAllCommands_12:
[000616a8] 526f 0012                 addq.w     #1,18(a7)
gs_GetAllCommands_11:
[000616ac] 302f 0012                 move.w     18(a7),d0
[000616b0] b06f 000c                 cmp.w      12(a7),d0
[000616b4] 6c10                      bge.s      gs_GetAllCommands_13
[000616b6] 302f 000c                 move.w     12(a7),d0
[000616ba] 906f 000e                 sub.w      14(a7),d0
[000616be] 322f 0010                 move.w     16(a7),d1
[000616c2] b240                      cmp.w      d0,d1
[000616c4] 6d86                      blt.s      gs_GetAllCommands_14
gs_GetAllCommands_13:
[000616c6] 302f 000c                 move.w     12(a7),d0
[000616ca] 206f 0008                 movea.l    8(a7),a0
[000616ce] 4eb9 0004 7410            jsr        Ast_deleteAry
[000616d4] 302f 000e                 move.w     14(a7),d0
[000616d8] 916f 000c                 sub.w      d0,12(a7)
[000616dc] 6006                      bra.s      gs_GetAllCommands_15
gs_GetAllCommands_10:
[000616de] 2f6f 0008 0004            move.l     8(a7),4(a7)
gs_GetAllCommands_15:
[000616e4] 206f 0014                 movea.l    20(a7),a0
[000616e8] 2050                      movea.l    (a0),a0
[000616ea] 4eb9 0004 c7c8            jsr        Ax_free
[000616f0] 206f 0014                 movea.l    20(a7),a0
[000616f4] 316f 000c 0004            move.w     12(a7),4(a0)
[000616fa] 206f 0014                 movea.l    20(a7),a0
[000616fe] 20af 0004                 move.l     4(a7),(a0)
[00061702] 4240                      clr.w      d0
gs_GetAllCommands_2:
[00061704] 4fef 001e                 lea.l      30(a7),a7
[00061708] 245f                      movea.l    (a7)+,a2
[0006170a] 4e75                      rts

	.data

gs_infodata:
[000e1ab2]                           dc.w $0000
[000e1ab4]                           dc.w $0000
gs_connect:
[000e1ab6]                           dc.w $0000
[000e1ab8]                           dc.w $0000
[000e1aba]                           dc.w $0000
[000e1abc]                           dc.w $0000
[000e1abe]                           dc.w $0002
[000e1ac0]                           dc.w $0001
_gs_commands:
[000e1ac2] 000e1b07                  dc.l $000e1b07
[000e1ac6] 000613c4                  dc.l gs_CheckCommand
[000e1aca] 000e1b14                  dc.l $000e1b14
[000e1ace] 00061352                  dc.l gs_SendToTopWindow
[000e1ad2] 000e1b1d                  dc.l $000e1b1d
[000e1ad6] 00061476                  dc.l gs_Quit
[000e1ada] 000e1b22                  dc.l $000e1b22
[000e1ade] 00061390                  dc.l gs_AppGetLongName
[000e1ae2] 000e1b31                  dc.l $000e1b31
[000e1ae6] 00061352                  dc.l gs_SendToTopWindow
[000e1aea] 000e1b3a                  dc.l $000e1b3a
[000e1aee] 000614ac                  dc.l gs_GetAllCommands
_gs_cmd_anzahl:
[000e1af2]                           dc.w $0006
_gs_sorted:
[000e1af4]                           dc.w $0000
[000e1af6]                           dc.w $3000
[000e1af8]                           dc.w $0001
[000e1afa]                           dc.w $0203
[000e1afc]                           dc.w $0405
[000e1afe]                           dc.w $0600
[000e1b00]                           dc.w $0030
[000e1b02]                           dc.w $0031
[000e1b04]                           dc.w $0000
[000e1b06]                           dc.w $0043
[000e1b08]                           dc.b 'heckCommand',0
[000e1b14]                           dc.b 'GetFront',0
[000e1b1d]                           dc.b 'Quit',0
[000e1b22]                           dc.b 'AppGetLongName',0
[000e1b31]                           dc.b 'KeyPress',0
[000e1b3a]                           dc.b 'GetAllCommands',0
[000e1b49]                           dc.b $31
[000e1b4a]                           dc.w $0031
[000e1b4c]                           dc.w $0000

