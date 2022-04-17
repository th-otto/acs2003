	.globl A_ftext
A_ftext:
[0006639a] 2f02                      move.l     d2,-(a7)
[0006639c] 2f0a                      move.l     a2,-(a7)
[0006639e] 4fef ff94                 lea.l      -108(a7),a7
[000663a2] 42af 0026                 clr.l      38(a7)
[000663a6] 206f 0078                 movea.l    120(a7),a0
[000663aa] 3228 0004                 move.w     4(a0),d1
[000663ae] 48c1                      ext.l      d1
[000663b0] 2001                      move.l     d1,d0
[000663b2] d080                      add.l      d0,d0
[000663b4] d081                      add.l      d1,d0
[000663b6] e788                      lsl.l      #3,d0
[000663b8] 206f 0078                 movea.l    120(a7),a0
[000663bc] 2050                      movea.l    (a0),a0
[000663be] d1c0                      adda.l     d0,a0
[000663c0] 2f48 0040                 move.l     a0,64(a7)
[000663c4] 206f 0040                 movea.l    64(a7),a0
[000663c8] 2f68 000c 0044            move.l     12(a0),68(a7)
[000663ce] 206f 0044                 movea.l    68(a7),a0
[000663d2] 2028 0004                 move.l     4(a0),d0
[000663d6] 7210                      moveq.l    #16,d1
[000663d8] e2a0                      asr.l      d1,d0
[000663da] 3f40 0052                 move.w     d0,82(a7)
[000663de] 206f 0044                 movea.l    68(a7),a0
[000663e2] 2068 000c                 movea.l    12(a0),a0
[000663e6] 2f48 002e                 move.l     a0,46(a7)
[000663ea] 4eb9 0008 2f6c            jsr        strlen
[000663f0] 3f40 003c                 move.w     d0,60(a7)
[000663f4] 302f 003c                 move.w     60(a7),d0
[000663f8] 206f 002e                 movea.l    46(a7),a0
[000663fc] d0c0                      adda.w     d0,a0
[000663fe] 2f48 001a                 move.l     a0,26(a7)
[00066402] 206f 0044                 movea.l    68(a7),a0
[00066406] 2ea8 0010                 move.l     16(a0),(a7)
[0006640a] 206f 0044                 movea.l    68(a7),a0
[0006640e] 2028 0004                 move.l     4(a0),d0
[00066412] e080                      asr.l      #8,d0
[00066414] c07c 003f                 and.w      #$003F,d0
[00066418] 3f40 004a                 move.w     d0,74(a7)
[0006641c] 206f 0044                 movea.l    68(a7),a0
[00066420] 2028 0004                 move.l     4(a0),d0
[00066424] 720e                      moveq.l    #14,d1
[00066426] e2a0                      asr.l      d1,d0
[00066428] c07c 0003                 and.w      #$0003,d0
[0006642c] 3f40 0048                 move.w     d0,72(a7)
[00066430] 206f 0078                 movea.l    120(a7),a0
[00066434] 3028 000c                 move.w     12(a0),d0
[00066438] 206f 0078                 movea.l    120(a7),a0
[0006643c] d068 0010                 add.w      16(a0),d0
[00066440] 5340                      subq.w     #1,d0
[00066442] 3f40 0038                 move.w     d0,56(a7)
[00066446] 206f 0078                 movea.l    120(a7),a0
[0006644a] 3028 0016                 move.w     22(a0),d0
[0006644e] 6648                      bne.s      A_ftext_1
[00066450] 206f 0078                 movea.l    120(a7),a0
[00066454] 3028 0018                 move.w     24(a0),d0
[00066458] 663e                      bne.s      A_ftext_1
[0006645a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066460] 3f68 0008 0064            move.w     8(a0),100(a7)
[00066466] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006646c] 3f68 000a 0066            move.w     10(a0),102(a7)
[00066472] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066478] 3f68 000c 0068            move.w     12(a0),104(a7)
[0006647e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066484] 3028 000a                 move.w     10(a0),d0
[00066488] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006648e] d068 000e                 add.w      14(a0),d0
[00066492] 3f40 006a                 move.w     d0,106(a7)
[00066496] 6028                      bra.s      A_ftext_2
A_ftext_1:
[00066498] 206f 0078                 movea.l    120(a7),a0
[0006649c] 3f68 0012 0064            move.w     18(a0),100(a7)
[000664a2] 206f 0078                 movea.l    120(a7),a0
[000664a6] 3f68 0014 0066            move.w     20(a0),102(a7)
[000664ac] 206f 0078                 movea.l    120(a7),a0
[000664b0] 3f68 0016 0068            move.w     22(a0),104(a7)
[000664b6] 206f 0078                 movea.l    120(a7),a0
[000664ba] 3f68 0018 006a            move.w     24(a0),106(a7)
A_ftext_2:
[000664c0] 70ff                      moveq.l    #-1,d0
[000664c2] d06f 0064                 add.w      100(a7),d0
[000664c6] d16f 0068                 add.w      d0,104(a7)
[000664ca] 70ff                      moveq.l    #-1,d0
[000664cc] d06f 0066                 add.w      102(a7),d0
[000664d0] d16f 006a                 add.w      d0,106(a7)
[000664d4] 302f 006a                 move.w     106(a7),d0
[000664d8] b06f 0038                 cmp.w      56(a7),d0
[000664dc] 6f06                      ble.s      A_ftext_3
[000664de] 3f6f 0038 006a            move.w     56(a7),106(a7)
A_ftext_3:
[000664e4] 302f 006a                 move.w     106(a7),d0
[000664e8] b06f 0066                 cmp.w      102(a7),d0
[000664ec] 6c0e                      bge.s      A_ftext_4
[000664ee] 70fe                      moveq.l    #-2,d0
[000664f0] 206f 0078                 movea.l    120(a7),a0
[000664f4] c068 0008                 and.w      8(a0),d0
[000664f8] 6000 0420                 bra        A_ftext_5
A_ftext_4:
[000664fc] 41ef 0064                 lea.l      100(a7),a0
[00066500] 7201                      moveq.l    #1,d1
[00066502] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066508] 3029 0010                 move.w     16(a1),d0
[0006650c] 4eb9 0007 2230            jsr        vs_clip
[00066512] 7202                      moveq.l    #2,d1
[00066514] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006651a] 3028 0010                 move.w     16(a0),d0
[0006651e] 4eb9 0007 3070            jsr        vswr_mode
[00066524] 322f 0052                 move.w     82(a7),d1
[00066528] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006652e] 3028 0010                 move.w     16(a0),d0
[00066532] 4eb9 0007 34e6            jsr        vst_font
[00066538] 4241                      clr.w      d1
[0006653a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066540] 3028 0010                 move.w     16(a0),d0
[00066544] 4eb9 0007 3492            jsr        vst_rotation
[0006654a] 322f 004a                 move.w     74(a7),d1
[0006654e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066554] 3028 0010                 move.w     16(a0),d0
[00066558] 4eb9 0007 358e            jsr        vst_effects
[0006655e] 206f 0078                 movea.l    120(a7),a0
[00066562] 3f68 000c 003a            move.w     12(a0),58(a7)
[00066568] 206f 0044                 movea.l    68(a7),a0
[0006656c] 3028 0006                 move.w     6(a0),d0
[00066570] c07c 00ff                 and.w      #$00FF,d0
[00066574] 3f40 0050                 move.w     d0,80(a7)
[00066578] 660c                      bne.s      A_ftext_6
[0006657a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066580] 3f68 0018 0050            move.w     24(a0),80(a7)
A_ftext_6:
[00066586] 486f 0050                 pea.l      80(a7)
[0006658a] 486f 0052                 pea.l      82(a7)
[0006658e] 43ef 0054                 lea.l      84(a7),a1
[00066592] 41ef 0054                 lea.l      84(a7),a0
[00066596] 322f 0058                 move.w     88(a7),d1
[0006659a] 2479 0010 ee4e            movea.l    ACSblk,a2
[000665a0] 302a 0010                 move.w     16(a2),d0
[000665a4] 4eb9 0007 3370            jsr        vst_height
[000665aa] 504f                      addq.w     #8,a7
[000665ac] 2057                      movea.l    (a7),a0
[000665ae] 3210                      move.w     (a0),d1
[000665b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000665b6] 3028 0010                 move.w     16(a0),d0
[000665ba] 4eb9 0007 353a            jsr        vst_color
[000665c0] 486f 0054                 pea.l      84(a7)
[000665c4] 486f 0050                 pea.l      80(a7)
[000665c8] 486f 0062                 pea.l      98(a7)
[000665cc] 43ef 0058                 lea.l      88(a7),a1
[000665d0] 41ef 0058                 lea.l      88(a7),a0
[000665d4] 2479 0010 ee4e            movea.l    ACSblk,a2
[000665da] 302a 0010                 move.w     16(a2),d0
[000665de] 4eb9 0007 59de            jsr        vqt_fontinfo
[000665e4] 4fef 000c                 lea.l      12(a7),a7
[000665e8] 302f 0054                 move.w     84(a7),d0
[000665ec] d16f 004e                 add.w      d0,78(a7)
[000665f0] 302f 0054                 move.w     84(a7),d0
[000665f4] d16f 0050                 add.w      d0,80(a7)
[000665f8] 206f 0078                 movea.l    120(a7),a0
[000665fc] 3f68 000a 0036            move.w     10(a0),54(a7)
[00066602] 206f 0078                 movea.l    120(a7),a0
[00066606] 3f68 000e 0034            move.w     14(a0),52(a7)
[0006660c] 302f 0048                 move.w     72(a7),d0
[00066610] 4a40                      tst.w      d0
[00066612] 673a                      beq.s      A_ftext_7
[00066614] 5340                      subq.w     #1,d0
[00066616] 670e                      beq.s      A_ftext_8
[00066618] 5340                      subq.w     #1,d0
[0006661a] 6760                      beq.s      A_ftext_9
[0006661c] 5340                      subq.w     #1,d0
[0006661e] 6700 0096                 beq        A_ftext_10
[00066622] 6000 00b0                 bra        A_ftext_11
A_ftext_8:
[00066626] 302f 0056                 move.w     86(a7),d0
[0006662a] d16f 0036                 add.w      d0,54(a7)
[0006662e] 43ef 004c                 lea.l      76(a7),a1
[00066632] 41ef 004c                 lea.l      76(a7),a0
[00066636] 7405                      moveq.l    #5,d2
[00066638] 4241                      clr.w      d1
[0006663a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00066640] 302a 0010                 move.w     16(a2),d0
[00066644] 4eb9 0007 35e2            jsr        vst_alignment
[0006664a] 6000 0088                 bra        A_ftext_11
A_ftext_7:
[0006664e] 206f 0078                 movea.l    120(a7),a0
[00066652] 3028 000e                 move.w     14(a0),d0
[00066656] e240                      asr.w      #1,d0
[00066658] 5240                      addq.w     #1,d0
[0006665a] d16f 0036                 add.w      d0,54(a7)
[0006665e] 43ef 004c                 lea.l      76(a7),a1
[00066662] 41ef 004c                 lea.l      76(a7),a0
[00066666] 7405                      moveq.l    #5,d2
[00066668] 7201                      moveq.l    #1,d1
[0006666a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00066670] 302a 0010                 move.w     16(a2),d0
[00066674] 4eb9 0007 35e2            jsr        vst_alignment
[0006667a] 6058                      bra.s      A_ftext_11
A_ftext_9:
[0006667c] 206f 0078                 movea.l    120(a7),a0
[00066680] 3028 000e                 move.w     14(a0),d0
[00066684] 906f 0058                 sub.w      88(a7),d0
[00066688] d16f 0036                 add.w      d0,54(a7)
[0006668c] 7010                      moveq.l    #16,d0
[0006668e] c06f 004a                 and.w      74(a7),d0
[00066692] 6704                      beq.s      A_ftext_12
[00066694] 556f 0036                 subq.w     #2,54(a7)
A_ftext_12:
[00066698] 43ef 004c                 lea.l      76(a7),a1
[0006669c] 41ef 004c                 lea.l      76(a7),a0
[000666a0] 7405                      moveq.l    #5,d2
[000666a2] 7202                      moveq.l    #2,d1
[000666a4] 2479 0010 ee4e            movea.l    ACSblk,a2
[000666aa] 302a 0010                 move.w     16(a2),d0
[000666ae] 4eb9 0007 35e2            jsr        vst_alignment
[000666b4] 601e                      bra.s      A_ftext_11
A_ftext_10:
[000666b6] 43ef 004c                 lea.l      76(a7),a1
[000666ba] 41ef 004c                 lea.l      76(a7),a0
[000666be] 7405                      moveq.l    #5,d2
[000666c0] 4241                      clr.w      d1
[000666c2] 2479 0010 ee4e            movea.l    ACSblk,a2
[000666c8] 302a 0010                 move.w     16(a2),d0
[000666cc] 4eb9 0007 35e2            jsr        vst_alignment
[000666d2] 4e71                      nop
A_ftext_11:
[000666d4] 302f 0034                 move.w     52(a7),d0
[000666d8] 906f 0056                 sub.w      86(a7),d0
[000666dc] 906f 0058                 sub.w      88(a7),d0
[000666e0] 3f40 0032                 move.w     d0,50(a7)
[000666e4] 302f 004e                 move.w     78(a7),d0
[000666e8] 6e06                      bgt.s      A_ftext_13
[000666ea] 3f7c 0001 004e            move.w     #$0001,78(a7)
A_ftext_13:
[000666f0] 302f 0032                 move.w     50(a7),d0
[000666f4] 48c0                      ext.l      d0
[000666f6] 81ef 004e                 divs.w     78(a7),d0
[000666fa] 3f40 003e                 move.w     d0,62(a7)
[000666fe] 0c6f 0001 003e            cmpi.w     #$0001,62(a7)
[00066704] 6c0e                      bge.s      A_ftext_14
[00066706] 70fe                      moveq.l    #-2,d0
[00066708] 206f 0078                 movea.l    120(a7),a0
[0006670c] c068 0008                 and.w      8(a0),d0
[00066710] 6000 0208                 bra        A_ftext_5
A_ftext_14:
[00066714] 2f6f 002e 0022            move.l     46(a7),34(a7)
A_ftext_36:
[0006671a] 707c                      moveq.l    #124,d0
[0006671c] 206f 0022                 movea.l    34(a7),a0
[00066720] 4eb9 0008 2e8a            jsr        strchr
[00066726] 2f48 002a                 move.l     a0,42(a7)
[0006672a] 302f 003e                 move.w     62(a7),d0
[0006672e] 206f 0022                 movea.l    34(a7),a0
[00066732] d0c0                      adda.w     d0,a0
[00066734] 2f48 001e                 move.l     a0,30(a7)
[00066738] 202f 002a                 move.l     42(a7),d0
[0006673c] 671e                      beq.s      A_ftext_15
[0006673e] 206f 002a                 movea.l    42(a7),a0
[00066742] b1ef 001e                 cmpa.l     30(a7),a0
[00066746] 6414                      bcc.s      A_ftext_15
[00066748] 2f6f 002a 001e            move.l     42(a7),30(a7)
[0006674e] 206f 002a                 movea.l    42(a7),a0
[00066752] 5248                      addq.w     #1,a0
[00066754] 2f48 0026                 move.l     a0,38(a7)
[00066758] 6000 00e2                 bra        A_ftext_16
A_ftext_15:
[0006675c] 206f 001a                 movea.l    26(a7),a0
[00066760] b1ef 001e                 cmpa.l     30(a7),a0
[00066764] 6300 0076                 bls.w      A_ftext_17
[00066768] 426f 0052                 clr.w      82(a7)
A_ftext_22:
[0006676c] 202f 002a                 move.l     42(a7),d0
[00066770] 670c                      beq.s      A_ftext_18
[00066772] 206f 001e                 movea.l    30(a7),a0
[00066776] b1ef 002a                 cmpa.l     42(a7),a0
[0006677a] 6502                      bcs.s      A_ftext_18
[0006677c] 605e                      bra.s      A_ftext_17
A_ftext_18:
[0006677e] 206f 001e                 movea.l    30(a7),a0
[00066782] 1f50 0014                 move.b     (a0),20(a7)
[00066786] 206f 001e                 movea.l    30(a7),a0
[0006678a] 4210                      clr.b      (a0)
[0006678c] 43ef 0004                 lea.l      4(a7),a1
[00066790] 206f 0022                 movea.l    34(a7),a0
[00066794] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006679a] 302a 0010                 move.w     16(a2),d0
[0006679e] 4eb9 0007 55fe            jsr        vqt_extent
[000667a4] 206f 001e                 movea.l    30(a7),a0
[000667a8] 10af 0014                 move.b     20(a7),(a0)
[000667ac] 302f 0008                 move.w     8(a7),d0
[000667b0] 906f 0004                 sub.w      4(a7),d0
[000667b4] b06f 0032                 cmp.w      50(a7),d0
[000667b8] 6f0e                      ble.s      A_ftext_19
[000667ba] 53af 001e                 subq.l     #1,30(a7)
[000667be] 302f 0052                 move.w     82(a7),d0
[000667c2] 6702                      beq.s      A_ftext_20
[000667c4] 6016                      bra.s      A_ftext_17
A_ftext_20:
[000667c6] 600a                      bra.s      A_ftext_21
A_ftext_19:
[000667c8] 52af 001e                 addq.l     #1,30(a7)
[000667cc] 3f7c 0001 0052            move.w     #$0001,82(a7)
A_ftext_21:
[000667d2] 206f 001e                 movea.l    30(a7),a0
[000667d6] b1ef 001a                 cmpa.l     26(a7),a0
[000667da] 6390                      bls.s      A_ftext_22
A_ftext_17:
[000667dc] 206f 002a                 movea.l    42(a7),a0
[000667e0] b1ef 001e                 cmpa.l     30(a7),a0
[000667e4] 673c                      beq.s      A_ftext_23
[000667e6] 206f 001e                 movea.l    30(a7),a0
[000667ea] b1ef 001a                 cmpa.l     26(a7),a0
[000667ee] 6432                      bcc.s      A_ftext_23
[000667f0] 2f6f 001e 0016            move.l     30(a7),22(a7)
[000667f6] 6004                      bra.s      A_ftext_24
A_ftext_26:
[000667f8] 53af 001e                 subq.l     #1,30(a7)
A_ftext_24:
[000667fc] 206f 001e                 movea.l    30(a7),a0
[00066800] 0c28 0020 ffff            cmpi.b     #$20,-1(a0)
[00066806] 670a                      beq.s      A_ftext_25
[00066808] 206f 001e                 movea.l    30(a7),a0
[0006680c] b1ef 0022                 cmpa.l     34(a7),a0
[00066810] 62e6                      bhi.s      A_ftext_26
A_ftext_25:
[00066812] 206f 001e                 movea.l    30(a7),a0
[00066816] b1ef 0022                 cmpa.l     34(a7),a0
[0006681a] 6606                      bne.s      A_ftext_23
[0006681c] 2f6f 0016 001e            move.l     22(a7),30(a7)
A_ftext_23:
[00066822] 2f6f 001e 0026            move.l     30(a7),38(a7)
[00066828] 202f 002a                 move.l     42(a7),d0
[0006682c] 670e                      beq.s      A_ftext_16
[0006682e] 206f 002a                 movea.l    42(a7),a0
[00066832] b1ef 001e                 cmpa.l     30(a7),a0
[00066836] 6604                      bne.s      A_ftext_16
[00066838] 52af 0026                 addq.l     #1,38(a7)
A_ftext_16:
[0006683c] 6004                      bra.s      A_ftext_27
A_ftext_29:
[0006683e] 52af 0022                 addq.l     #1,34(a7)
A_ftext_27:
[00066842] 206f 0022                 movea.l    34(a7),a0
[00066846] 0c10 0020                 cmpi.b     #$20,(a0)
[0006684a] 660a                      bne.s      A_ftext_28
[0006684c] 206f 0022                 movea.l    34(a7),a0
[00066850] b1ef 001e                 cmpa.l     30(a7),a0
[00066854] 65e8                      bcs.s      A_ftext_29
A_ftext_28:
[00066856] 6004                      bra.s      A_ftext_30
A_ftext_32:
[00066858] 53af 001e                 subq.l     #1,30(a7)
A_ftext_30:
[0006685c] 206f 001e                 movea.l    30(a7),a0
[00066860] 0c28 0020 ffff            cmpi.b     #$20,-1(a0)
[00066866] 660a                      bne.s      A_ftext_31
[00066868] 206f 001e                 movea.l    30(a7),a0
[0006686c] b1ef 0022                 cmpa.l     34(a7),a0
[00066870] 62e6                      bhi.s      A_ftext_32
A_ftext_31:
[00066872] 206f 001e                 movea.l    30(a7),a0
[00066876] 1f50 0014                 move.b     (a0),20(a7)
[0006687a] 206f 001e                 movea.l    30(a7),a0
[0006687e] 4210                      clr.b      (a0)
[00066880] 0c6f 0003 0048            cmpi.w     #$0003,72(a7)
[00066886] 662a                      bne.s      A_ftext_33
[00066888] 4267                      clr.w      -(a7)
[0006688a] 7001                      moveq.l    #1,d0
[0006688c] 3f00                      move.w     d0,-(a7)
[0006688e] 3f2f 0038                 move.w     56(a7),-(a7)
[00066892] 206f 0028                 movea.l    40(a7),a0
[00066896] 342f 0040                 move.w     64(a7),d2
[0006689a] 322f 003c                 move.w     60(a7),d1
[0006689e] 2279 0010 ee4e            movea.l    ACSblk,a1
[000668a4] 3029 0010                 move.w     16(a1),d0
[000668a8] 4eb9 0007 2bc8            jsr        v_justified
[000668ae] 5c4f                      addq.w     #6,a7
[000668b0] 601c                      bra.s      A_ftext_34
A_ftext_33:
[000668b2] 206f 0022                 movea.l    34(a7),a0
[000668b6] 342f 003a                 move.w     58(a7),d2
[000668ba] 322f 0036                 move.w     54(a7),d1
[000668be] 2279 0010 ee4e            movea.l    ACSblk,a1
[000668c4] 3029 0010                 move.w     16(a1),d0
[000668c8] 4eb9 0007 24b0            jsr        v_gtext
A_ftext_34:
[000668ce] 206f 001e                 movea.l    30(a7),a0
[000668d2] 10af 0014                 move.b     20(a7),(a0)
[000668d6] 2f6f 0026 0022            move.l     38(a7),34(a7)
[000668dc] 302f 0050                 move.w     80(a7),d0
[000668e0] d16f 003a                 add.w      d0,58(a7)
[000668e4] 302f 003a                 move.w     58(a7),d0
[000668e8] b06f 0038                 cmp.w      56(a7),d0
[000668ec] 6c0c                      bge.s      A_ftext_35
[000668ee] 206f 0022                 movea.l    34(a7),a0
[000668f2] b1ef 001a                 cmpa.l     26(a7),a0
[000668f6] 6500 fe22                 bcs        A_ftext_36
A_ftext_35:
[000668fa] 41ef 0064                 lea.l      100(a7),a0
[000668fe] 4241                      clr.w      d1
[00066900] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066906] 3029 0010                 move.w     16(a1),d0
[0006690a] 4eb9 0007 2230            jsr        vs_clip
[00066910] 70fe                      moveq.l    #-2,d0
[00066912] 206f 0078                 movea.l    120(a7),a0
[00066916] c068 0008                 and.w      8(a0),d0
A_ftext_5:
[0006691a] 4fef 006c                 lea.l      108(a7),a7
[0006691e] 245f                      movea.l    (a7)+,a2
[00066920] 241f                      move.l     (a7)+,d2
[00066922] 4e75                      rts

	.globl Auo_ftext
Auo_ftext:
[00066924] 4fef ffe2                 lea.l      -30(a7),a7
[00066928] 2f48 001a                 move.l     a0,26(a7)
[0006692c] 3f40 0018                 move.w     d0,24(a7)
[00066930] 2f49 0014                 move.l     a1,20(a7)
[00066934] 206f 001a                 movea.l    26(a7),a0
[00066938] 2f68 000c 0010            move.l     12(a0),16(a7)
[0006693e] 206f 0010                 movea.l    16(a7),a0
[00066942] 2f68 0010 0004            move.l     16(a0),4(a7)
[00066948] 302f 0018                 move.w     24(a7),d0
[0006694c] b07c 0014                 cmp.w      #$0014,d0
[00066950] 6700 02e6                 beq        Auo_ftext_1
[00066954] 6e3a                      bgt.s      Auo_ftext_2
[00066956] b07c 0013                 cmp.w      #$0013,d0
[0006695a] 6200 02de                 bhi        Auo_ftext_3
[0006695e] d040                      add.w      d0,d0
[00066960] 303b 0006                 move.w     $00066968(pc,d0.w),d0
[00066964] 4efb 0002                 jmp        $00066968(pc,d0.w)
J51:
[00066968] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[0006696a] 004e                      dc.w $004e   ; Auo_ftext_4-J51
[0006696c] 00c0                      dc.w $00c0   ; Auo_ftext_5-J51
[0006696e] 0182                      dc.w $0182   ; Auo_ftext_6-J51
[00066970] 0140                      dc.w $0140   ; Auo_ftext_7-J51
[00066972] 0192                      dc.w $0192   ; Auo_ftext_8-J51
[00066974] 0192                      dc.w $0192   ; Auo_ftext_8-J51
[00066976] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[00066978] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[0006697a] 00dc                      dc.w $00dc   ; Auo_ftext_9-J51
[0006697c] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[0006697e] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[00066980] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[00066982] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[00066984] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[00066986] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[00066988] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[0006698a] 02d2                      dc.w $02d2   ; Auo_ftext_3-J51
[0006698c] 010e                      dc.w $010e   ; Auo_ftext_10-J51
[0006698e] 02d0                      dc.w $02d0   ; Auo_ftext_1-J51
Auo_ftext_2:
[00066990] 907c                      dc.w $907c   ; Auo_ftext_11-J51
[00066992] 012c                      dc.w $012c   ; Auo_ftext_12-J51
[00066994] b07c                      dc.w $b07c   ; Auo_ftext_13-J51
[00066996] 0007 6200                 ori.b      #$00,d7
[0006699a] 02a0 d040 303b            andi.l     #$D040303B,-(a0)
[000669a0] 0006 4efb                 ori.b      #$FB,d6
[000669a4] 0002 017c                 ori.b      #$7C,d2
[000669a8] 01a8 01dc                 bclr       d0,476(a0)
[000669ac] 01ea 021a                 bset       d0,538(a2)
[000669b0] 0238 0256 0274            andi.b     #$56,($00000274).w
Auo_ftext_4:
[000669b6] 206f 0010                 movea.l    16(a7),a0
[000669ba] 2028 000c                 move.l     12(a0),d0
[000669be] 6716                      beq.s      Auo_ftext_14
[000669c0] 206f 0010                 movea.l    16(a7),a0
[000669c4] 2068 000c                 movea.l    12(a0),a0
[000669c8] 4eb9 0004 643c            jsr        Ast_create
[000669ce] 226f 0010                 movea.l    16(a7),a1
[000669d2] 2348 000c                 move.l     a0,12(a1)
Auo_ftext_14:
[000669d6] 206f 0010                 movea.l    16(a7),a0
[000669da] 2028 000c                 move.l     12(a0),d0
[000669de] 6614                      bne.s      Auo_ftext_15
[000669e0] 41f9 000e 1d96            lea.l      $000E1D96,a0
[000669e6] 4eb9 0004 643c            jsr        Ast_create
[000669ec] 226f 0010                 movea.l    16(a7),a1
[000669f0] 2348 000c                 move.l     a0,12(a1)
Auo_ftext_15:
[000669f4] 7010                      moveq.l    #16,d0
[000669f6] 4eb9 0004 c608            jsr        Ax_malloc
[000669fc] 2f48 0004                 move.l     a0,4(a7)
[00066a00] 6606                      bne.s      Auo_ftext_16
[00066a02] 4240                      clr.w      d0
[00066a04] 6000 023a                 bra        Auo_ftext_17
Auo_ftext_16:
[00066a08] 7010                      moveq.l    #16,d0
[00066a0a] 43f9 000e 1d86            lea.l      ftextproto,a1
[00066a10] 206f 0004                 movea.l    4(a7),a0
[00066a14] 4eb9 0008 3500            jsr        memcpy
[00066a1a] 206f 0010                 movea.l    16(a7),a0
[00066a1e] 216f 0004 0010            move.l     4(a7),16(a0)
[00066a24] 6000 0218                 bra        Auo_ftext_18
Auo_ftext_5:
[00066a28] 206f 0010                 movea.l    16(a7),a0
[00066a2c] 2068 000c                 movea.l    12(a0),a0
[00066a30] 4eb9 0004 649c            jsr        Ast_delete
[00066a36] 206f 0004                 movea.l    4(a7),a0
[00066a3a] 4eb9 0004 c7c8            jsr        Ax_free
[00066a40] 6000 01fc                 bra        Auo_ftext_18
Auo_ftext_9:
[00066a44] 2f6f 0014 000c            move.l     20(a7),12(a7)
[00066a4a] 206f 000c                 movea.l    12(a7),a0
[00066a4e] 226f 0004                 movea.l    4(a7),a1
[00066a52] 2350 0006                 move.l     (a0),6(a1)
[00066a56] 206f 000c                 movea.l    12(a7),a0
[00066a5a] 226f 0004                 movea.l    4(a7),a1
[00066a5e] 2368 0004 000a            move.l     4(a0),10(a1)
[00066a64] 206f 000c                 movea.l    12(a7),a0
[00066a68] 226f 0004                 movea.l    4(a7),a1
[00066a6c] 3368 0008 000e            move.w     8(a0),14(a1)
[00066a72] 6000 01ca                 bra        Auo_ftext_18
Auo_ftext_10:
[00066a76] 2f6f 0014 000c            move.l     20(a7),12(a7)
[00066a7c] 206f 0004                 movea.l    4(a7),a0
[00066a80] 226f 000c                 movea.l    12(a7),a1
[00066a84] 22a8 0006                 move.l     6(a0),(a1)
[00066a88] 206f 0004                 movea.l    4(a7),a0
[00066a8c] 226f 000c                 movea.l    12(a7),a1
[00066a90] 2368 000a 0004            move.l     10(a0),4(a1)
Auo_ftext_12:
[00066a96] 206f 0004                 movea.l    4(a7),a0
[00066a9a] 226f 000c                 movea.l    12(a7),a1
[00066a9e] 3368 000e 0008            move.w     14(a0),8(a1)
[00066aa4] 6000 0198                 bra        Auo_ftext_18
Auo_ftext_7:
[00066aa8] 206f 0010                 movea.l    16(a7),a0
[00066aac] 2068 000c                 movea.l    12(a0),a0
[00066ab0] 4eb9 0004 649c            jsr        Ast_delete
[00066ab6] 206f 0014                 movea.l    20(a7),a0
[00066aba] 4eb9 0004 643c            jsr        Ast_create
[00066ac0] 226f 0010                 movea.l    16(a7),a1
[00066ac4] 2348 000c                 move.l     a0,12(a1)
[00066ac8] 206f 0010                 movea.l    16(a7),a0
[00066acc] 2028 000c                 move.l     12(a0),d0
[00066ad0] 6614                      bne.s      Auo_ftext_19
[00066ad2] 41f9 000e 1d97            lea.l      $000E1D97,a0
[00066ad8] 4eb9 0004 643c            jsr        Ast_create
[00066ade] 226f 0010                 movea.l    16(a7),a1
[00066ae2] 2348 000c                 move.l     a0,12(a1)
Auo_ftext_19:
[00066ae6] 6000 0156                 bra        Auo_ftext_18
Auo_ftext_6:
[00066aea] 206f 0010                 movea.l    16(a7),a0
[00066aee] 226f 0014                 movea.l    20(a7),a1
[00066af2] 22a8 000c                 move.l     12(a0),(a1)
[00066af6] 6000 0146                 bra        Auo_ftext_18
Auo_ftext_8:
[00066afa] 206f 0004                 movea.l    4(a7),a0
[00066afe] 2f68 0006 0008            move.l     6(a0),8(a7)
[00066b04] 6718                      beq.s      Auo_ftext_20
[00066b06] 72ff                      moveq.l    #-1,d1
[00066b08] 206f 0004                 movea.l    4(a7),a0
[00066b0c] 3028 000e                 move.w     14(a0),d0
[00066b10] 206f 0008                 movea.l    8(a7),a0
[00066b14] 226f 0008                 movea.l    8(a7),a1
[00066b18] 2269 0066                 movea.l    102(a1),a1
[00066b1c] 4e91                      jsr        (a1)
Auo_ftext_20:
[00066b1e] 6000 011e                 bra        Auo_ftext_18
[00066b22] 206f 0014                 movea.l    20(a7),a0
[00066b26] 3010                      move.w     (a0),d0
[00066b28] 48c0                      ext.l      d0
[00066b2a] 2e80                      move.l     d0,(a7)
[00066b2c] 206f 0010                 movea.l    16(a7),a0
[00066b30] 2028 0004                 move.l     4(a0),d0
[00066b34] c0bc 0000 ffff            and.l      #$0000FFFF,d0
[00066b3a] 2217                      move.l     (a7),d1
[00066b3c] 7410                      moveq.l    #16,d2
[00066b3e] e5a9                      lsl.l      d2,d1
[00066b40] 8081                      or.l       d1,d0
[00066b42] 206f 0010                 movea.l    16(a7),a0
[00066b46] 2140 0004                 move.l     d0,4(a0)
[00066b4a] 6000 00f2                 bra        Auo_ftext_18
[00066b4e] 206f 0014                 movea.l    20(a7),a0
[00066b52] 3010                      move.w     (a0),d0
[00066b54] 48c0                      ext.l      d0
[00066b56] 2e80                      move.l     d0,(a7)
[00066b58] 0c97 0000 00ff            cmpi.l     #$000000FF,(a7)
[00066b5e] 6f06                      ble.s      Auo_ftext_21
[00066b60] 2ebc 0000 00ff            move.l     #$000000FF,(a7)
Auo_ftext_21:
[00066b66] 206f 0010                 movea.l    16(a7),a0
[00066b6a] 2028 0004                 move.l     4(a0),d0
[00066b6e] c0bc ffff ff00            and.l      #$FFFFFF00,d0
[00066b74] 8097                      or.l       (a7),d0
[00066b76] 206f 0010                 movea.l    16(a7),a0
[00066b7a] 2140 0004                 move.l     d0,4(a0)
[00066b7e] 6000 00be                 bra        Auo_ftext_18
[00066b82] 206f 0014                 movea.l    20(a7),a0
[00066b86] 226f 0004                 movea.l    4(a7),a1
[00066b8a] 3290                      move.w     (a0),(a1)
[00066b8c] 6000 00b0                 bra        Auo_ftext_18
[00066b90] 206f 0014                 movea.l    20(a7),a0
[00066b94] 3010                      move.w     (a0),d0
[00066b96] 48c0                      ext.l      d0
[00066b98] c0bc 0000 003f            and.l      #$0000003F,d0
[00066b9e] 2e80                      move.l     d0,(a7)
[00066ba0] 206f 0010                 movea.l    16(a7),a0
[00066ba4] 2028 0004                 move.l     4(a0),d0
[00066ba8] c0bc ffff c0ff            and.l      #$FFFFC0FF,d0
[00066bae] 2217                      move.l     (a7),d1
[00066bb0] e189                      lsl.l      #8,d1
[00066bb2] 8081                      or.l       d1,d0
[00066bb4] 206f 0010                 movea.l    16(a7),a0
[00066bb8] 2140 0004                 move.l     d0,4(a0)
[00066bbc] 6000 0080                 bra        Auo_ftext_18
[00066bc0] 206f 0010                 movea.l    16(a7),a0
[00066bc4] 2028 0004                 move.l     4(a0),d0
[00066bc8] c0bc ffff 3fff            and.l      #$FFFF3FFF,d0
[00066bce] 80bc 0000 4000            or.l       #$00004000,d0
[00066bd4] 206f 0010                 movea.l    16(a7),a0
[00066bd8] 2140 0004                 move.l     d0,4(a0)
[00066bdc] 6060                      bra.s      Auo_ftext_18
[00066bde] 206f 0010                 movea.l    16(a7),a0
[00066be2] 2028 0004                 move.l     4(a0),d0
[00066be6] c0bc ffff 3fff            and.l      #$FFFF3FFF,d0
[00066bec] 80bc ffff 8000            or.l       #$FFFF8000,d0
[00066bf2] 206f 0010                 movea.l    16(a7),a0
[00066bf6] 2140 0004                 move.l     d0,4(a0)
[00066bfa] 6042                      bra.s      Auo_ftext_18
[00066bfc] 206f 0010                 movea.l    16(a7),a0
[00066c00] 2028 0004                 move.l     4(a0),d0
[00066c04] c0bc ffff 3fff            and.l      #$FFFF3FFF,d0
[00066c0a] 80bc 0000 0000            or.l       #$00000000,d0
[00066c10] 206f 0010                 movea.l    16(a7),a0
[00066c14] 2140 0004                 move.l     d0,4(a0)
[00066c18] 6024                      bra.s      Auo_ftext_18
[00066c1a] 206f 0010                 movea.l    16(a7),a0
[00066c1e] 2028 0004                 move.l     4(a0),d0
[00066c22] c0bc ffff 3fff            and.l      #$FFFF3FFF,d0
[00066c28] 80bc ffff c000            or.l       #$FFFFC000,d0
[00066c2e] 206f 0010                 movea.l    16(a7),a0
[00066c32] 2140 0004                 move.l     d0,4(a0)
[00066c36] 6006                      bra.s      Auo_ftext_18
Auo_ftext_1:
[00066c38] 6004                      bra.s      Auo_ftext_18
Auo_ftext_3:
[00066c3a] 4240                      clr.w      d0
[00066c3c] 6002                      bra.s      Auo_ftext_17
Auo_ftext_18:
[00066c3e] 7001                      moveq.l    #1,d0
Auo_ftext_17:
[00066c40] 4fef 001e                 lea.l      30(a7),a7
[00066c44] 4e75                      rts

	.data

ftextproto:
[000e1d86]                           dc.w $0001
[000e1d88]                           dc.w $0000
[000e1d8a]                           dc.w $0000
[000e1d8c]                           dc.w $0000
[000e1d8e]                           dc.w $0000
[000e1d90]                           dc.w $0000
[000e1d92]                           dc.w $0000
[000e1d94]                           dc.w $0000
[000e1d96]                           dc.w $0000
