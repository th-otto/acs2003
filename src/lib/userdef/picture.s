A_picture:
[00067ece] 2f02                      move.l     d2,-(a7)
[00067ed0] 2f0a                      move.l     a2,-(a7)
[00067ed2] 4fef ffda                 lea.l      -38(a7),a7
[00067ed6] 206f 0032                 movea.l    50(a7),a0
[00067eda] 3228 0004                 move.w     4(a0),d1
[00067ede] 48c1                      ext.l      d1
[00067ee0] 2001                      move.l     d1,d0
[00067ee2] d080                      add.l      d0,d0
[00067ee4] d081                      add.l      d1,d0
[00067ee6] e788                      lsl.l      #3,d0
[00067ee8] 206f 0032                 movea.l    50(a7),a0
[00067eec] 2050                      movea.l    (a0),a0
[00067eee] d1c0                      adda.l     d0,a0
[00067ef0] 2e88                      move.l     a0,(a7)
[00067ef2] 2057                      movea.l    (a7),a0
[00067ef4] 2f68 000c 0004            move.l     12(a0),4(a7)
[00067efa] 206f 0004                 movea.l    4(a7),a0
[00067efe] 2f68 0014 0008            move.l     20(a0),8(a7)
[00067f04] 202f 0008                 move.l     8(a7),d0
[00067f08] 6700 044c                 beq        A_picture_1
[00067f0c] 206f 0032                 movea.l    50(a7),a0
[00067f10] 3028 0016                 move.w     22(a0),d0
[00067f14] 660a                      bne.s      A_picture_2
[00067f16] 206f 0032                 movea.l    50(a7),a0
[00067f1a] 3028 0018                 move.w     24(a0),d0
[00067f1e] 6742                      beq.s      A_picture_3
A_picture_2:
[00067f20] 206f 0032                 movea.l    50(a7),a0
[00067f24] 3f68 0012 0016            move.w     18(a0),22(a7)
[00067f2a] 206f 0032                 movea.l    50(a7),a0
[00067f2e] 3f68 0014 0018            move.w     20(a0),24(a7)
[00067f34] 206f 0032                 movea.l    50(a7),a0
[00067f38] 3028 0012                 move.w     18(a0),d0
[00067f3c] 206f 0032                 movea.l    50(a7),a0
[00067f40] d068 0016                 add.w      22(a0),d0
[00067f44] 5340                      subq.w     #1,d0
[00067f46] 3f40 001a                 move.w     d0,26(a7)
[00067f4a] 206f 0032                 movea.l    50(a7),a0
[00067f4e] 3028 0014                 move.w     20(a0),d0
[00067f52] 206f 0032                 movea.l    50(a7),a0
[00067f56] d068 0018                 add.w      24(a0),d0
[00067f5a] 5340                      subq.w     #1,d0
[00067f5c] 3f40 001c                 move.w     d0,28(a7)
[00067f60] 604c                      bra.s      A_picture_4
A_picture_3:
[00067f62] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067f68] 3f68 0008 0016            move.w     8(a0),22(a7)
[00067f6e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067f74] 3f68 000a 0018            move.w     10(a0),24(a7)
[00067f7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067f80] 3028 0008                 move.w     8(a0),d0
[00067f84] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067f8a] d068 000a                 add.w      10(a0),d0
[00067f8e] 5340                      subq.w     #1,d0
[00067f90] 3f40 001a                 move.w     d0,26(a7)
[00067f94] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067f9a] 3028 000a                 move.w     10(a0),d0
[00067f9e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00067fa4] d068 000c                 add.w      12(a0),d0
[00067fa8] 5340                      subq.w     #1,d0
[00067faa] 3f40 001c                 move.w     d0,28(a7)
A_picture_4:
[00067fae] 206f 0032                 movea.l    50(a7),a0
[00067fb2] 302f 0016                 move.w     22(a7),d0
[00067fb6] b068 000a                 cmp.w      10(a0),d0
[00067fba] 6c0a                      bge.s      A_picture_5
[00067fbc] 206f 0032                 movea.l    50(a7),a0
[00067fc0] 3f68 000a 0016            move.w     10(a0),22(a7)
A_picture_5:
[00067fc6] 206f 0032                 movea.l    50(a7),a0
[00067fca] 302f 0018                 move.w     24(a7),d0
[00067fce] b068 000c                 cmp.w      12(a0),d0
[00067fd2] 6c0a                      bge.s      A_picture_6
[00067fd4] 206f 0032                 movea.l    50(a7),a0
[00067fd8] 3f68 000c 0018            move.w     12(a0),24(a7)
A_picture_6:
[00067fde] 206f 0032                 movea.l    50(a7),a0
[00067fe2] 3028 000a                 move.w     10(a0),d0
[00067fe6] 206f 0032                 movea.l    50(a7),a0
[00067fea] d068 000e                 add.w      14(a0),d0
[00067fee] 5340                      subq.w     #1,d0
[00067ff0] 3f40 000c                 move.w     d0,12(a7)
[00067ff4] 302f 001a                 move.w     26(a7),d0
[00067ff8] b06f 000c                 cmp.w      12(a7),d0
[00067ffc] 6f06                      ble.s      A_picture_7
[00067ffe] 3f6f 000c 001a            move.w     12(a7),26(a7)
A_picture_7:
[00068004] 206f 0032                 movea.l    50(a7),a0
[00068008] 3028 000c                 move.w     12(a0),d0
[0006800c] 206f 0032                 movea.l    50(a7),a0
[00068010] d068 0010                 add.w      16(a0),d0
[00068014] 5340                      subq.w     #1,d0
[00068016] 3f40 000c                 move.w     d0,12(a7)
[0006801a] 302f 001c                 move.w     28(a7),d0
[0006801e] b06f 000c                 cmp.w      12(a7),d0
[00068022] 6f06                      ble.s      A_picture_8
[00068024] 3f6f 000c 001c            move.w     12(a7),28(a7)
A_picture_8:
[0006802a] 302f 0016                 move.w     22(a7),d0
[0006802e] b06f 001a                 cmp.w      26(a7),d0
[00068032] 6e0a                      bgt.s      A_picture_9
[00068034] 302f 0018                 move.w     24(a7),d0
[00068038] b06f 001c                 cmp.w      28(a7),d0
[0006803c] 6f0e                      ble.s      A_picture_10
A_picture_9:
[0006803e] 70fe                      moveq.l    #-2,d0
[00068040] 206f 0032                 movea.l    50(a7),a0
[00068044] c068 0008                 and.w      8(a0),d0
[00068048] 6000 0316                 bra        A_picture_11
A_picture_10:
[0006804c] 41ef 0016                 lea.l      22(a7),a0
[00068050] 7201                      moveq.l    #1,d1
[00068052] 2279 0010 ee4e            movea.l    ACSblk,a1
[00068058] 3029 0010                 move.w     16(a1),d0
[0006805c] 4eb9 0007 2230            jsr        vs_clip
[00068062] 206f 0008                 movea.l    8(a7),a0
[00068066] 3f68 0004 0010            move.w     4(a0),16(a7)
[0006806c] 206f 0008                 movea.l    8(a7),a0
[00068070] 3f68 0006 000e            move.w     6(a0),14(a7)
[00068076] 7002                      moveq.l    #2,d0
[00068078] 206f 0032                 movea.l    50(a7),a0
[0006807c] c0a8 001a                 and.l      26(a0),d0
[00068080] 6700 00ce                 beq        A_picture_12
[00068084] 4240                      clr.w      d0
[00068086] 3f40 0018                 move.w     d0,24(a7)
[0006808a] 3f40 0016                 move.w     d0,22(a7)
[0006808e] 70ff                      moveq.l    #-1,d0
[00068090] d06f 0010                 add.w      16(a7),d0
[00068094] 3f40 001a                 move.w     d0,26(a7)
[00068098] 70ff                      moveq.l    #-1,d0
[0006809a] d06f 000e                 add.w      14(a7),d0
[0006809e] 3f40 001c                 move.w     d0,28(a7)
[000680a2] 206f 0032                 movea.l    50(a7),a0
[000680a6] 3f68 000c 0012            move.w     12(a0),18(a7)
[000680ac] 6000 0084                 bra        A_picture_13
[000680b0] 206f 0032                 movea.l    50(a7),a0
A_picture_16:
[000680b4] 3f68 000a 0014            move.w     10(a0),20(a7)
[000680ba] 6056                      bra.s      A_picture_14
[000680bc] 3f6f 0014 001e            move.w     20(a7),30(a7)
A_picture_15:
[000680c2] 3f6f 0012 0020            move.w     18(a7),32(a7)
[000680c8] 302f 0014                 move.w     20(a7),d0
[000680cc] d06f 0010                 add.w      16(a7),d0
[000680d0] 5340                      subq.w     #1,d0
[000680d2] 3f40 0022                 move.w     d0,34(a7)
[000680d6] 302f 0012                 move.w     18(a7),d0
[000680da] d06f 000e                 add.w      14(a7),d0
[000680de] 5340                      subq.w     #1,d0
[000680e0] 3f40 0024                 move.w     d0,36(a7)
[000680e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000680ea] 4868 026a                 pea.l      618(a0)
[000680ee] 226f 000c                 movea.l    12(a7),a1
[000680f2] 41ef 001a                 lea.l      26(a7),a0
[000680f6] 7203                      moveq.l    #3,d1
[000680f8] 2479 0010 ee4e            movea.l    ACSblk,a2
[000680fe] 302a 0010                 move.w     16(a2),d0
[00068102] 4eb9 0007 489e            jsr        vro_cpyfm
[00068108] 584f                      addq.w     #4,a7
[0006810a] 302f 0010                 move.w     16(a7),d0
[0006810e] d16f 0014                 add.w      d0,20(a7)
A_picture_14:
[00068112] 206f 0032                 movea.l    50(a7),a0
[00068116] 3028 000a                 move.w     10(a0),d0
[0006811a] 206f 0032                 movea.l    50(a7),a0
[0006811e] d068 000e                 add.w      14(a0),d0
[00068122] 322f 0014                 move.w     20(a7),d1
[00068126] b240                      cmp.w      d0,d1
[00068128] 6d92                      blt.s      A_picture_15
[0006812a] 302f 000e                 move.w     14(a7),d0
[0006812e] d16f 0012                 add.w      d0,18(a7)
A_picture_13:
[00068132] 206f 0032                 movea.l    50(a7),a0
[00068136] 3028 000c                 move.w     12(a0),d0
[0006813a] 206f 0032                 movea.l    50(a7),a0
[0006813e] d068 0010                 add.w      16(a0),d0
[00068142] 322f 0012                 move.w     18(a7),d1
[00068146] b240                      cmp.w      d0,d1
[00068148] 6d00 ff66                 blt        A_picture_16
[0006814c] 6000 01f2                 bra        A_picture_17
A_picture_12:
[00068150] 206f 0032                 movea.l    50(a7),a0
[00068154] 2028 001a                 move.l     26(a0),d0
[00068158] c0bc 0010 0000            and.l      #$00100000,d0
[0006815e] 676c                      beq.s      A_picture_18
[00068160] 2079 0010 ee4e            movea.l    ACSblk,a0
[00068166] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[0006816c] 6d26                      blt.s      A_picture_19
[0006816e] 7208                      moveq.l    #8,d1
[00068170] 2079 0010 ee4e            movea.l    ACSblk,a0
[00068176] 3028 0010                 move.w     16(a0),d0
[0006817a] 4eb9 0007 3708            jsr        vsf_color
[00068180] 7201                      moveq.l    #1,d1
[00068182] 2079 0010 ee4e            movea.l    ACSblk,a0
[00068188] 3028 0010                 move.w     16(a0),d0
[0006818c] 4eb9 0007 3660            jsr        vsf_interior
[00068192] 6036                      bra.s      A_picture_20
A_picture_19:
[00068194] 7201                      moveq.l    #1,d1
[00068196] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006819c] 3028 0010                 move.w     16(a0),d0
[000681a0] 4eb9 0007 3708            jsr        vsf_color
[000681a6] 7202                      moveq.l    #2,d1
[000681a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000681ae] 3028 0010                 move.w     16(a0),d0
[000681b2] 4eb9 0007 3660            jsr        vsf_interior
[000681b8] 7204                      moveq.l    #4,d1
[000681ba] 2079 0010 ee4e            movea.l    ACSblk,a0
[000681c0] 3028 0010                 move.w     16(a0),d0
[000681c4] 4eb9 0007 36b4            jsr        vsf_style
A_picture_20:
[000681ca] 605c                      bra.s      A_picture_21
A_picture_18:
[000681cc] 206f 0032                 movea.l    50(a7),a0
[000681d0] 2228 001a                 move.l     26(a0),d1
[000681d4] e881                      asr.l      #4,d1
[000681d6] c27c 000f                 and.w      #$000F,d1
[000681da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000681e0] 3028 0010                 move.w     16(a0),d0
[000681e4] 4eb9 0007 3708            jsr        vsf_color
[000681ea] 206f 0032                 movea.l    50(a7),a0
[000681ee] 2228 001a                 move.l     26(a0),d1
[000681f2] e081                      asr.l      #8,d1
[000681f4] c27c 001f                 and.w      #$001F,d1
[000681f8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000681fe] 3028 0010                 move.w     16(a0),d0
[00068202] 4eb9 0007 36b4            jsr        vsf_style
[00068208] 206f 0032                 movea.l    50(a7),a0
[0006820c] 2228 001a                 move.l     26(a0),d1
[00068210] 7010                      moveq.l    #16,d0
[00068212] e0a1                      asr.l      d0,d1
[00068214] c27c 000f                 and.w      #$000F,d1
[00068218] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006821e] 3028 0010                 move.w     16(a0),d0
[00068222] 4eb9 0007 3660            jsr        vsf_interior
A_picture_21:
[00068228] 7201                      moveq.l    #1,d1
[0006822a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00068230] 3028 0010                 move.w     16(a0),d0
[00068234] 4eb9 0007 3070            jsr        vswr_mode
[0006823a] 4241                      clr.w      d1
[0006823c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00068242] 3028 0010                 move.w     16(a0),d0
[00068246] 4eb9 0007 375c            jsr        vsf_perimeter
[0006824c] 41ef 0016                 lea.l      22(a7),a0
[00068250] 2279 0010 ee4e            movea.l    ACSblk,a1
[00068256] 3029 0010                 move.w     16(a1),d0
[0006825a] 4eb9 0007 282e            jsr        v_bar
[00068260] 4240                      clr.w      d0
[00068262] 3f40 0018                 move.w     d0,24(a7)
[00068266] 3f40 0016                 move.w     d0,22(a7)
[0006826a] 206f 0032                 movea.l    50(a7),a0
[0006826e] 3028 000e                 move.w     14(a0),d0
[00068272] 906f 0010                 sub.w      16(a7),d0
[00068276] 3f40 000c                 move.w     d0,12(a7)
[0006827a] 302f 000c                 move.w     12(a7),d0
[0006827e] 6f1e                      ble.s      A_picture_22
[00068280] 70ff                      moveq.l    #-1,d0
[00068282] d06f 0010                 add.w      16(a7),d0
[00068286] 3f40 001a                 move.w     d0,26(a7)
[0006828a] 302f 000c                 move.w     12(a7),d0
[0006828e] e240                      asr.w      #1,d0
[00068290] 206f 0032                 movea.l    50(a7),a0
[00068294] d068 000a                 add.w      10(a0),d0
[00068298] 3f40 001e                 move.w     d0,30(a7)
[0006829c] 6018                      bra.s      A_picture_23
A_picture_22:
[0006829e] 70ff                      moveq.l    #-1,d0
[000682a0] 206f 0032                 movea.l    50(a7),a0
[000682a4] d068 000e                 add.w      14(a0),d0
[000682a8] 3f40 001a                 move.w     d0,26(a7)
[000682ac] 206f 0032                 movea.l    50(a7),a0
[000682b0] 3f68 000a 001e            move.w     10(a0),30(a7)
A_picture_23:
[000682b6] 302f 001e                 move.w     30(a7),d0
[000682ba] d06f 001a                 add.w      26(a7),d0
[000682be] 3f40 0022                 move.w     d0,34(a7)
[000682c2] 206f 0032                 movea.l    50(a7),a0
[000682c6] 3028 0010                 move.w     16(a0),d0
[000682ca] 906f 000e                 sub.w      14(a7),d0
[000682ce] 3f40 000c                 move.w     d0,12(a7)
[000682d2] 302f 000c                 move.w     12(a7),d0
[000682d6] 6f1e                      ble.s      A_picture_24
[000682d8] 70ff                      moveq.l    #-1,d0
[000682da] d06f 000e                 add.w      14(a7),d0
[000682de] 3f40 001c                 move.w     d0,28(a7)
[000682e2] 302f 000c                 move.w     12(a7),d0
[000682e6] e240                      asr.w      #1,d0
[000682e8] 206f 0032                 movea.l    50(a7),a0
[000682ec] d068 000c                 add.w      12(a0),d0
[000682f0] 3f40 0020                 move.w     d0,32(a7)
[000682f4] 6018                      bra.s      A_picture_25
A_picture_24:
[000682f6] 70ff                      moveq.l    #-1,d0
[000682f8] 206f 0032                 movea.l    50(a7),a0
[000682fc] d068 0010                 add.w      16(a0),d0
[00068300] 3f40 001c                 move.w     d0,28(a7)
[00068304] 206f 0032                 movea.l    50(a7),a0
[00068308] 3f68 000c 0020            move.w     12(a0),32(a7)
A_picture_25:
[0006830e] 302f 0020                 move.w     32(a7),d0
[00068312] d06f 001c                 add.w      28(a7),d0
[00068316] 3f40 0024                 move.w     d0,36(a7)
[0006831a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00068320] 4868 026a                 pea.l      618(a0)
[00068324] 226f 000c                 movea.l    12(a7),a1
[00068328] 41ef 001a                 lea.l      26(a7),a0
[0006832c] 7203                      moveq.l    #3,d1
[0006832e] 2479 0010 ee4e            movea.l    ACSblk,a2
[00068334] 302a 0010                 move.w     16(a2),d0
[00068338] 4eb9 0007 489e            jsr        vro_cpyfm
[0006833e] 584f                      addq.w     #4,a7
A_picture_17:
[00068340] 41ef 0016                 lea.l      22(a7),a0
[00068344] 4241                      clr.w      d1
[00068346] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006834c] 3029 0010                 move.w     16(a1),d0
[00068350] 4eb9 0007 2230            jsr        vs_clip
A_picture_1:
[00068356] 70fe                      moveq.l    #-2,d0
[00068358] 206f 0032                 movea.l    50(a7),a0
[0006835c] c068 0008                 and.w      8(a0),d0
A_picture_11:
[00068360] 4fef 0026                 lea.l      38(a7),a7
[00068364] 245f                      movea.l    (a7)+,a2
[00068366] 241f                      move.l     (a7)+,d2
[00068368] 4e75                      rts

del_pic:
[0006836a] 514f                      subq.w     #8,a7
[0006836c] 2f48 0004                 move.l     a0,4(a7)
[00068370] 7001                      moveq.l    #1,d0
[00068372] 206f 0004                 movea.l    4(a7),a0
[00068376] c0a8 0004                 and.l      4(a0),d0
[0006837a] 6710                      beq.s      del_pic_1
[0006837c] 206f 0004                 movea.l    4(a7),a0
[00068380] 2068 0014                 movea.l    20(a0),a0
[00068384] 4eb9 0005 4c04            jsr        Abp_delete
[0006838a] 604c                      bra.s      del_pic_2
del_pic_1:
[0006838c] 206f 0004                 movea.l    4(a7),a0
[00068390] 2ea8 000c                 move.l     12(a0),(a7)
[00068394] 2017                      move.l     (a7),d0
[00068396] 6732                      beq.s      del_pic_3
[00068398] 2057                      movea.l    (a7),a0
[0006839a] 2068 0014                 movea.l    20(a0),a0
[0006839e] 226f 0004                 movea.l    4(a7),a1
[000683a2] b1e9 0014                 cmpa.l     20(a1),a0
[000683a6] 6622                      bne.s      del_pic_3
[000683a8] 2057                      movea.l    (a7),a0
[000683aa] 53a8 0018                 subq.l     #1,24(a0)
[000683ae] 6e18                      bgt.s      del_pic_4
[000683b0] 2057                      movea.l    (a7),a0
[000683b2] 2068 0014                 movea.l    20(a0),a0
[000683b6] 4eb9 0005 4c04            jsr        Abp_delete
[000683bc] 2057                      movea.l    (a7),a0
[000683be] 42a8 0014                 clr.l      20(a0)
[000683c2] 2057                      movea.l    (a7),a0
[000683c4] 42a8 0018                 clr.l      24(a0)
del_pic_4:
[000683c8] 600e                      bra.s      del_pic_2
del_pic_3:
[000683ca] 206f 0004                 movea.l    4(a7),a0
[000683ce] 2068 0014                 movea.l    20(a0),a0
[000683d2] 4eb9 0005 4c04            jsr        Abp_delete
del_pic_2:
[000683d8] 206f 0004                 movea.l    4(a7),a0
[000683dc] 42a8 0014                 clr.l      20(a0)
[000683e0] 504f                      addq.w     #8,a7
[000683e2] 4e75                      rts

make_pic:
[000683e4] 2f0a                      move.l     a2,-(a7)
[000683e6] 4fef ffd8                 lea.l      -40(a7),a7
[000683ea] 2f48 0024                 move.l     a0,36(a7)
[000683ee] 206f 0024                 movea.l    36(a7),a0
[000683f2] 2f68 000c 0020            move.l     12(a0),32(a7)
[000683f8] 206f 0020                 movea.l    32(a7),a0
[000683fc] 3228 0006                 move.w     6(a0),d1
[00068400] 206f 0020                 movea.l    32(a7),a0
[00068404] 3028 0004                 move.w     4(a0),d0
[00068408] 4eb9 0005 4b6e            jsr        Abp_create
[0006840e] 2f48 001c                 move.l     a0,28(a7)
[00068412] 202f 001c                 move.l     28(a7),d0
[00068416] 6606                      bne.s      make_pic_1
[00068418] 70ff                      moveq.l    #-1,d0
[0006841a] 6000 021a                 bra        make_pic_2
make_pic_1:
[0006841e] 206f 001c                 movea.l    28(a7),a0
[00068422] 3028 0008                 move.w     8(a0),d0
[00068426] 48c0                      ext.l      d0
[00068428] d080                      add.l      d0,d0
[0006842a] 206f 001c                 movea.l    28(a7),a0
[0006842e] 3228 0006                 move.w     6(a0),d1
[00068432] 48c1                      ext.l      d1
[00068434] 4eb9 0008 3cac            jsr        _lmul
[0006843a] 2f40 0010                 move.l     d0,16(a7)
[0006843e] 206f 0020                 movea.l    32(a7),a0
[00068442] 3f68 000c 0016            move.w     12(a0),22(a7)
[00068448] 302f 0016                 move.w     22(a7),d0
[0006844c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00068452] 9068 001c                 sub.w      28(a0),d0
[00068456] 3f40 0014                 move.w     d0,20(a7)
[0006845a] 302f 0014                 move.w     20(a7),d0
[0006845e] 6b54                      bmi.s      make_pic_3
[00068460] 2079 0010 ee4e            movea.l    ACSblk,a0
[00068466] 226f 0020                 movea.l    32(a7),a1
[0006846a] 3368 001c 000c            move.w     28(a0),12(a1)
[00068470] 302f 0014                 move.w     20(a7),d0
[00068474] 48c0                      ext.l      d0
[00068476] 222f 0010                 move.l     16(a7),d1
[0006847a] 4eb9 0008 3cac            jsr        _lmul
[00068480] 206f 0020                 movea.l    32(a7),a0
[00068484] 41f0 081c                 lea.l      28(a0,d0.l),a0
[00068488] 226f 0020                 movea.l    32(a7),a1
[0006848c] 2288                      move.l     a0,(a1)
[0006848e] 226f 001c                 movea.l    28(a7),a1
[00068492] 206f 0020                 movea.l    32(a7),a0
[00068496] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006849c] 302a 0010                 move.w     16(a2),d0
[000684a0] 4eb9 0007 4978            jsr        vr_trnfm
[000684a6] 206f 0020                 movea.l    32(a7),a0
[000684aa] 316f 0016 000c            move.w     22(a7),12(a0)
[000684b0] 6000 0156                 bra        make_pic_4
make_pic_3:
[000684b4] 206f 0020                 movea.l    32(a7),a0
[000684b8] 3228 0006                 move.w     6(a0),d1
[000684bc] 206f 0020                 movea.l    32(a7),a0
[000684c0] 3028 0004                 move.w     4(a0),d0
[000684c4] 4eb9 0005 4b6e            jsr        Abp_create
[000684ca] 2f48 0018                 move.l     a0,24(a7)
[000684ce] 202f 0018                 move.l     24(a7),d0
[000684d2] 6610                      bne.s      make_pic_5
[000684d4] 206f 001c                 movea.l    28(a7),a0
[000684d8] 4eb9 0005 4c04            jsr        Abp_delete
[000684de] 70ff                      moveq.l    #-1,d0
[000684e0] 6000 0154                 bra        make_pic_2
make_pic_5:
[000684e4] 0c6f 0001 0016            cmpi.w     #$0001,22(a7)
[000684ea] 6600 0090                 bne        make_pic_6
[000684ee] 206f 0018                 movea.l    24(a7),a0
[000684f2] 317c 0001 000c            move.w     #$0001,12(a0)
[000684f8] 206f 0020                 movea.l    32(a7),a0
[000684fc] 41e8 001c                 lea.l      28(a0),a0
[00068500] 226f 0020                 movea.l    32(a7),a1
[00068504] 2288                      move.l     a0,(a1)
[00068506] 226f 0018                 movea.l    24(a7),a1
[0006850a] 206f 0020                 movea.l    32(a7),a0
[0006850e] 2479 0010 ee4e            movea.l    ACSblk,a2
[00068514] 302a 0010                 move.w     16(a2),d0
[00068518] 4eb9 0007 4978            jsr        vr_trnfm
[0006851e] 4240                      clr.w      d0
[00068520] 3f40 000a                 move.w     d0,10(a7)
[00068524] 3f40 0008                 move.w     d0,8(a7)
[00068528] 3f40 0002                 move.w     d0,2(a7)
[0006852c] 3e80                      move.w     d0,(a7)
[0006852e] 70ff                      moveq.l    #-1,d0
[00068530] 206f 0018                 movea.l    24(a7),a0
[00068534] d068 0004                 add.w      4(a0),d0
[00068538] 3f40 000c                 move.w     d0,12(a7)
[0006853c] 3f40 0004                 move.w     d0,4(a7)
[00068540] 70ff                      moveq.l    #-1,d0
[00068542] 206f 0018                 movea.l    24(a7),a0
[00068546] d068 0006                 add.w      6(a0),d0
[0006854a] 3f40 000e                 move.w     d0,14(a7)
[0006854e] 3f40 0006                 move.w     d0,6(a7)
[00068552] 4879 000e 1dc6            pea.l      color
[00068558] 2f2f 0020                 move.l     32(a7),-(a7)
[0006855c] 226f 0020                 movea.l    32(a7),a1
[00068560] 41ef 0008                 lea.l      8(a7),a0
[00068564] 7201                      moveq.l    #1,d1
[00068566] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006856c] 302a 0010                 move.w     16(a2),d0
[00068570] 4eb9 0007 4902            jsr        vrt_cpyfm
[00068576] 504f                      addq.w     #8,a7
[00068578] 6000 0084                 bra        make_pic_7
make_pic_6:
[0006857c] 206f 0018                 movea.l    24(a7),a0
[00068580] 317c 0001 000a            move.w     #$0001,10(a0)
[00068586] 302f 0016                 move.w     22(a7),d0
[0006858a] 48c0                      ext.l      d0
[0006858c] 222f 0010                 move.l     16(a7),d1
[00068590] 4eb9 0008 3cac            jsr        _lmul
[00068596] 226f 0020                 movea.l    32(a7),a1
[0006859a] 43e9 001c                 lea.l      28(a1),a1
[0006859e] 206f 0018                 movea.l    24(a7),a0
[000685a2] 2050                      movea.l    (a0),a0
[000685a4] 4eb9 0008 3500            jsr        memcpy
[000685aa] 302f 0014                 move.w     20(a7),d0
[000685ae] 4440                      neg.w      d0
[000685b0] 48c0                      ext.l      d0
[000685b2] 222f 0010                 move.l     16(a7),d1
[000685b6] 4eb9 0008 3cac            jsr        _lmul
[000685bc] 2200                      move.l     d0,d1
[000685be] 4240                      clr.w      d0
[000685c0] 2f01                      move.l     d1,-(a7)
[000685c2] 3f00                      move.w     d0,-(a7)
[000685c4] 302f 001c                 move.w     28(a7),d0
[000685c8] 48c0                      ext.l      d0
[000685ca] 222f 0016                 move.l     22(a7),d1
[000685ce] 4eb9 0008 3cac            jsr        _lmul
[000685d4] 206f 001e                 movea.l    30(a7),a0
[000685d8] 2050                      movea.l    (a0),a0
[000685da] d1c0                      adda.l     d0,a0
[000685dc] 301f                      move.w     (a7)+,d0
[000685de] 221f                      move.l     (a7)+,d1
[000685e0] 4eb9 0008 36ea            jsr        memset
[000685e6] 226f 001c                 movea.l    28(a7),a1
[000685ea] 206f 0018                 movea.l    24(a7),a0
[000685ee] 2479 0010 ee4e            movea.l    ACSblk,a2
[000685f4] 302a 0010                 move.w     16(a2),d0
[000685f8] 4eb9 0007 4978            jsr        vr_trnfm
make_pic_7:
[000685fe] 206f 0018                 movea.l    24(a7),a0
[00068602] 4eb9 0005 4c04            jsr        Abp_delete
make_pic_4:
[00068608] 206f 0024                 movea.l    36(a7),a0
[0006860c] 216f 001c 0014            move.l     28(a7),20(a0)
[00068612] 7001                      moveq.l    #1,d0
[00068614] 206f 0024                 movea.l    36(a7),a0
[00068618] c0a8 0004                 and.l      4(a0),d0
[0006861c] 6616                      bne.s      make_pic_8
[0006861e] 206f 0020                 movea.l    32(a7),a0
[00068622] 216f 001c 0014            move.l     28(a7),20(a0)
[00068628] 206f 0020                 movea.l    32(a7),a0
[0006862c] 217c 0000 0001 0018       move.l     #$00000001,24(a0)
make_pic_8:
[00068634] 4240                      clr.w      d0
make_pic_2:
[00068636] 4fef 0028                 lea.l      40(a7),a7
[0006863a] 245f                      movea.l    (a7)+,a2
[0006863c] 4e75                      rts

Auo_picture:
[0006863e] 4fef ffe2                 lea.l      -30(a7),a7
[00068642] 2f48 001a                 move.l     a0,26(a7)
[00068646] 3f40 0018                 move.w     d0,24(a7)
[0006864a] 2f49 0014                 move.l     a1,20(a7)
[0006864e] 206f 001a                 movea.l    26(a7),a0
[00068652] 2ea8 000c                 move.l     12(a0),(a7)
[00068656] 302f 0018                 move.w     24(a7),d0
[0006865a] b07c 0009                 cmp.w      #$0009,d0
[0006865e] 6700 00e0                 beq        Auo_picture_1
[00068662] 6e1a                      bgt.s      Auo_picture_2
[00068664] 5340                      subq.w     #1,d0
[00068666] 6730                      beq.s      Auo_picture_3
[00068668] 5340                      subq.w     #1,d0
[0006866a] 6700 00c0                 beq        Auo_picture_4
[0006866e] 5740                      subq.w     #3,d0
[00068670] 6700 0104                 beq        Auo_picture_5
[00068674] 5340                      subq.w     #1,d0
[00068676] 6700 00fe                 beq        Auo_picture_5
[0006867a] 6000 012e                 bra        Auo_picture_6
Auo_picture_2:
[0006867e] 907c 0013                 sub.w      #$0013,d0
[00068682] 6700 0124                 beq        Auo_picture_7
[00068686] 5340                      subq.w     #1,d0
[00068688] 6700 011e                 beq        Auo_picture_7
[0006868c] 907c 01e0                 sub.w      #$01E0,d0
[00068690] 6700 0088                 beq        Auo_picture_8
[00068694] 6000 0114                 bra        Auo_picture_6
Auo_picture_3:
[00068698] 700a                      moveq.l    #10,d0
[0006869a] 4eb9 0004 c608            jsr        Ax_malloc
[000686a0] 2f48 000c                 move.l     a0,12(a7)
[000686a4] 202f 000c                 move.l     12(a7),d0
[000686a8] 660c                      bne.s      Auo_picture_9
[000686aa] 206f 0014                 movea.l    20(a7),a0
[000686ae] 30bc ffff                 move.w     #$FFFF,(a0)
[000686b2] 6000 00fa                 bra        Auo_picture_10
Auo_picture_9:
[000686b6] 2057                      movea.l    (a7),a0
[000686b8] 216f 000c 0010            move.l     12(a7),16(a0)
[000686be] 206f 000c                 movea.l    12(a7),a0
[000686c2] 4290                      clr.l      (a0)
[000686c4] 2057                      movea.l    (a7),a0
[000686c6] 2f68 000c 0010            move.l     12(a0),16(a7)
[000686cc] 202f 0010                 move.l     16(a7),d0
[000686d0] 6604                      bne.s      Auo_picture_11
[000686d2] 6000 00da                 bra        Auo_picture_10
Auo_picture_11:
[000686d6] 7001                      moveq.l    #1,d0
[000686d8] 2057                      movea.l    (a7),a0
[000686da] c0a8 0004                 and.l      4(a0),d0
[000686de] 660a                      bne.s      Auo_picture_12
[000686e0] 206f 0010                 movea.l    16(a7),a0
[000686e4] 2028 0014                 move.l     20(a0),d0
[000686e8] 6618                      bne.s      Auo_picture_13
Auo_picture_12:
[000686ea] 2057                      movea.l    (a7),a0
[000686ec] 6100 fcf6                 bsr        make_pic
[000686f0] 5240                      addq.w     #1,d0
[000686f2] 660c                      bne.s      Auo_picture_14
[000686f4] 206f 0014                 movea.l    20(a7),a0
[000686f8] 30bc ffff                 move.w     #$FFFF,(a0)
[000686fc] 6000 00b0                 bra        Auo_picture_10
Auo_picture_14:
[00068700] 6014                      bra.s      Auo_picture_15
Auo_picture_13:
[00068702] 206f 0010                 movea.l    16(a7),a0
[00068706] 52a8 0018                 addq.l     #1,24(a0)
[0006870a] 206f 0010                 movea.l    16(a7),a0
[0006870e] 2257                      movea.l    (a7),a1
[00068710] 2368 0014 0014            move.l     20(a0),20(a1)
Auo_picture_15:
[00068716] 6000 0096                 bra        Auo_picture_10
Auo_picture_8:
[0006871a] 2057                      movea.l    (a7),a0
[0006871c] 6100 fc4c                 bsr        del_pic
[00068720] 2057                      movea.l    (a7),a0
[00068722] 216f 0014 0014            move.l     20(a7),20(a0)
[00068728] 6000 0084                 bra        Auo_picture_10
Auo_picture_4:
[0006872c] 2057                      movea.l    (a7),a0
[0006872e] 2068 0010                 movea.l    16(a0),a0
[00068732] 4eb9 0004 c7c8            jsr        Ax_free
[00068738] 2057                      movea.l    (a7),a0
[0006873a] 6100 fc2e                 bsr        del_pic
[0006873e] 606e                      bra.s      Auo_picture_10
Auo_picture_1:
[00068740] 2f6f 0014 000c            move.l     20(a7),12(a7)
[00068746] 2057                      movea.l    (a7),a0
[00068748] 2f68 0010 0008            move.l     16(a0),8(a7)
[0006874e] 206f 000c                 movea.l    12(a7),a0
[00068752] 226f 0008                 movea.l    8(a7),a1
[00068756] 2290                      move.l     (a0),(a1)
[00068758] 206f 000c                 movea.l    12(a7),a0
[0006875c] 226f 0008                 movea.l    8(a7),a1
[00068760] 2368 0004 0004            move.l     4(a0),4(a1)
[00068766] 206f 000c                 movea.l    12(a7),a0
[0006876a] 226f 0008                 movea.l    8(a7),a1
[0006876e] 3368 0008 0008            move.w     8(a0),8(a1)
[00068774] 6038                      bra.s      Auo_picture_10
Auo_picture_5:
[00068776] 2057                      movea.l    (a7),a0
[00068778] 2f68 0010 000c            move.l     16(a0),12(a7)
[0006877e] 206f 000c                 movea.l    12(a7),a0
[00068782] 2f50 0004                 move.l     (a0),4(a7)
[00068786] 202f 0004                 move.l     4(a7),d0
[0006878a] 6602                      bne.s      Auo_picture_16
[0006878c] 6020                      bra.s      Auo_picture_10
Auo_picture_16:
[0006878e] 72ff                      moveq.l    #-1,d1
[00068790] 206f 000c                 movea.l    12(a7),a0
[00068794] 3028 0008                 move.w     8(a0),d0
[00068798] 206f 0004                 movea.l    4(a7),a0
[0006879c] 226f 0004                 movea.l    4(a7),a1
[000687a0] 2269 0066                 movea.l    102(a1),a1
[000687a4] 4e91                      jsr        (a1)
[000687a6] 6006                      bra.s      Auo_picture_10
Auo_picture_7:
[000687a8] 6004                      bra.s      Auo_picture_10
Auo_picture_6:
[000687aa] 4240                      clr.w      d0
[000687ac] 6002                      bra.s      Auo_picture_17
Auo_picture_10:
[000687ae] 7001                      moveq.l    #1,d0
Auo_picture_17:
[000687b0] 4fef 001e                 lea.l      30(a7),a7
[000687b4] 4e75                      rts

	.data

color:
[000e1dc6]                           dc.w $0001
[000e1dc8]                           dc.w $0000
