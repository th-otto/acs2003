boxed_insert:
[000687b6] 2f0a                      move.l     a2,-(a7)
[000687b8] 4fef fed8                 lea.l      -296(a7),a7
[000687bc] 2f48 0124                 move.l     a0,292(a7)
[000687c0] 2f49 0120                 move.l     a1,288(a7)
[000687c4] 3f40 011e                 move.w     d0,286(a7)
[000687c8] 3f7c ffff 0014            move.w     #$FFFF,20(a7)
[000687ce] 206f 0124                 movea.l    292(a7),a0
[000687d2] 2f68 000c 000c            move.l     12(a0),12(a7)
[000687d8] 206f 000c                 movea.l    12(a7),a0
[000687dc] 2f68 0010 0008            move.l     16(a0),8(a7)
[000687e2] 206f 0008                 movea.l    8(a7),a0
[000687e6] 2f68 0204 0004            move.l     516(a0),4(a7)
[000687ec] 206f 000c                 movea.l    12(a7),a0
[000687f0] 5848                      addq.w     #4,a0
[000687f2] 2e88                      move.l     a0,(a7)
[000687f4] 202f 0004                 move.l     4(a7),d0
[000687f8] 672a                      beq.s      $00068824
[000687fa] 206f 0004                 movea.l    4(a7),a0
[000687fe] 3028 001c                 move.w     28(a0),d0
[00068802] 206f 0008                 movea.l    8(a7),a0
[00068806] b068 020c                 cmp.w      524(a0),d0
[0006880a] 6618                      bne.s      $00068824
[0006880c] 206f 0008                 movea.l    8(a7),a0
[00068810] 2068 0210                 movea.l    528(a0),a0
[00068814] 3f50 0014                 move.w     (a0),20(a7)
[00068818] 206f 0008                 movea.l    8(a7),a0
[0006881c] 2068 0214                 movea.l    532(a0),a0
[00068820] 3f50 0016                 move.w     (a0),22(a7)
[00068824] 302f 0014                 move.w     20(a7),d0
[00068828] 6a0e                      bpl.s      $00068838
[0006882a] 426f 0014                 clr.w      20(a7)
[0006882e] 206f 0008                 movea.l    8(a7),a0
[00068832] 3f68 020e 0016            move.w     526(a0),22(a7)
[00068838] 302f 0016                 move.w     22(a7),d0
[0006883c] 6f12                      ble.s      $00068850
[0006883e] 322f 0016                 move.w     22(a7),d1
[00068842] 302f 0014                 move.w     20(a7),d0
[00068846] 206f 0124                 movea.l    292(a7),a0
[0006884a] 4eb9 0006 974a            jsr        boxed_delsel
[00068850] 2057                      movea.l    (a7),a0
[00068852] 3028 0002                 move.w     2(a0),d0
[00068856] e048                      lsr.w      #8,d0
[00068858] c07c 00ff                 and.w      #$00FF,d0
[0006885c] 3f40 0012                 move.w     d0,18(a7)
[00068860] 206f 0120                 movea.l    288(a7),a0
[00068864] 4eb9 0008 2f6c            jsr        strlen
[0006886a] 3f40 0018                 move.w     d0,24(a7)
[0006886e] 206f 0008                 movea.l    8(a7),a0
[00068872] 3028 020e                 move.w     526(a0),d0
[00068876] d06f 0018                 add.w      24(a7),d0
[0006887a] b06f 0012                 cmp.w      18(a7),d0
[0006887e] 6f10                      ble.s      $00068890
[00068880] 302f 0012                 move.w     18(a7),d0
[00068884] 206f 0008                 movea.l    8(a7),a0
[00068888] 9068 020e                 sub.w      526(a0),d0
[0006888c] 3f40 0018                 move.w     d0,24(a7)
[00068890] 302f 0018                 move.w     24(a7),d0
[00068894] 6f00 0192                 ble        $00068A28
[00068898] 486f 0018                 pea.l      24(a7)
[0006889c] 486f 001e                 pea.l      30(a7)
[000688a0] 226f 0128                 movea.l    296(a7),a1
[000688a4] 206f 012c                 movea.l    300(a7),a0
[000688a8] 4eb9 0006 8afe            jsr        boxed_checktext
[000688ae] 504f                      addq.w     #8,a7
[000688b0] 4a40                      tst.w      d0
[000688b2] 6700 0174                 beq        $00068A28
[000688b6] 302f 0014                 move.w     20(a7),d0
[000688ba] 206f 0008                 movea.l    8(a7),a0
[000688be] d0c0                      adda.w     d0,a0
[000688c0] 41e8 0100                 lea.l      256(a0),a0
[000688c4] 2f48 011a                 move.l     a0,282(a7)
[000688c8] 206f 0008                 movea.l    8(a7),a0
[000688cc] 3028 020e                 move.w     526(a0),d0
[000688d0] 322f 0014                 move.w     20(a7),d1
[000688d4] d26f 0018                 add.w      24(a7),d1
[000688d8] 9041                      sub.w      d1,d0
[000688da] 5240                      addq.w     #1,d0
[000688dc] 3f40 0010                 move.w     d0,16(a7)
[000688e0] 302f 0010                 move.w     16(a7),d0
[000688e4] 6e10                      bgt.s      $000688F6
[000688e6] 43ef 001a                 lea.l      26(a7),a1
[000688ea] 206f 011a                 movea.l    282(a7),a0
[000688ee] 4eb9 0008 2f0c            jsr        strcpy
[000688f4] 603a                      bra.s      $00068930
[000688f6] 601e                      bra.s      $00068916
[000688f8] 302f 0010                 move.w     16(a7),d0
[000688fc] 206f 011a                 movea.l    282(a7),a0
[00068900] 322f 0010                 move.w     16(a7),d1
[00068904] d26f 0018                 add.w      24(a7),d1
[00068908] 226f 011a                 movea.l    282(a7),a1
[0006890c] 13b0 0000 1000            move.b     0(a0,d0.w),0(a1,d1.w)
[00068912] 536f 0010                 subq.w     #1,16(a7)
[00068916] 302f 0010                 move.w     16(a7),d0
[0006891a] 6adc                      bpl.s      $000688F8
[0006891c] 302f 0018                 move.w     24(a7),d0
[00068920] 48c0                      ext.l      d0
[00068922] 43ef 001a                 lea.l      26(a7),a1
[00068926] 206f 011a                 movea.l    282(a7),a0
[0006892a] 4eb9 0008 3500            jsr        memcpy
[00068930] 202f 0004                 move.l     4(a7),d0
[00068934] 6700 00a8                 beq        $000689DE
[00068938] 206f 0008                 movea.l    8(a7),a0
[0006893c] 3028 020c                 move.w     524(a0),d0
[00068940] 206f 0004                 movea.l    4(a7),a0
[00068944] b068 001c                 cmp.w      28(a0),d0
[00068948] 6600 0094                 bne        $000689DE
[0006894c] 206f 0008                 movea.l    8(a7),a0
[00068950] 2068 0210                 movea.l    528(a0),a0
[00068954] 3010                      move.w     (a0),d0
[00068956] 6b00 0086                 bmi        $000689DE
[0006895a] 302f 011e                 move.w     286(a7),d0
[0006895e] 673e                      beq.s      $0006899E
[00068960] 206f 0008                 movea.l    8(a7),a0
[00068964] 2068 0214                 movea.l    532(a0),a0
[00068968] 30af 0018                 move.w     24(a7),(a0)
[0006896c] 302f 0018                 move.w     24(a7),d0
[00068970] 48c0                      ext.l      d0
[00068972] 206f 0008                 movea.l    8(a7),a0
[00068976] 2068 0210                 movea.l    528(a0),a0
[0006897a] 3210                      move.w     (a0),d1
[0006897c] 226f 0008                 movea.l    8(a7),a1
[00068980] d2c1                      adda.w     d1,a1
[00068982] 43e9 0100                 lea.l      256(a1),a1
[00068986] 206f 0008                 movea.l    8(a7),a0
[0006898a] 4eb9 0008 3500            jsr        memcpy
[00068990] 302f 0018                 move.w     24(a7),d0
[00068994] 206f 0008                 movea.l    8(a7),a0
[00068998] 4230 0000                 clr.b      0(a0,d0.w)
[0006899c] 601c                      bra.s      $000689BA
[0006899e] 226f 0008                 movea.l    8(a7),a1
[000689a2] 43e9 0100                 lea.l      256(a1),a1
[000689a6] 206f 0008                 movea.l    8(a7),a0
[000689aa] 4eb9 0008 2f0c            jsr        strcpy
[000689b0] 206f 0008                 movea.l    8(a7),a0
[000689b4] 2068 0210                 movea.l    528(a0),a0
[000689b8] 5250                      addq.w     #1,(a0)
[000689ba] 302f 0018                 move.w     24(a7),d0
[000689be] 206f 0008                 movea.l    8(a7),a0
[000689c2] d168 020e                 add.w      d0,526(a0)
[000689c6] 206f 0124                 movea.l    292(a7),a0
[000689ca] 4eb9 0006 931c            jsr        boxed_postcheck
[000689d0] 70ff                      moveq.l    #-1,d0
[000689d2] 206f 0124                 movea.l    292(a7),a0
[000689d6] 4eb9 0006 9834            jsr        boxed_viewpos
[000689dc] 6028                      bra.s      $00068A06
[000689de] 226f 0008                 movea.l    8(a7),a1
[000689e2] 43e9 0100                 lea.l      256(a1),a1
[000689e6] 206f 0008                 movea.l    8(a7),a0
[000689ea] 4eb9 0008 2f0c            jsr        strcpy
[000689f0] 302f 0018                 move.w     24(a7),d0
[000689f4] 206f 0008                 movea.l    8(a7),a0
[000689f8] d168 020e                 add.w      d0,526(a0)
[000689fc] 206f 0124                 movea.l    292(a7),a0
[00068a00] 4eb9 0006 931c            jsr        boxed_postcheck
[00068a06] 206f 0008                 movea.l    8(a7),a0
[00068a0a] 0068 0004 0222            ori.w      #$0004,546(a0)
[00068a10] 202f 0004                 move.l     4(a7),d0
[00068a14] 6712                      beq.s      $00068A28
[00068a16] 93c9                      suba.l     a1,a1
[00068a18] 701a                      moveq.l    #26,d0
[00068a1a] 206f 0004                 movea.l    4(a7),a0
[00068a1e] 246f 0004                 movea.l    4(a7),a2
[00068a22] 246a 0004                 movea.l    4(a2),a2
[00068a26] 4e92                      jsr        (a2)
[00068a28] 4fef 0128                 lea.l      296(a7),a7
[00068a2c] 245f                      movea.l    (a7)+,a2
[00068a2e] 4e75                      rts
boxed_within:
[00068a30] 4fef fff2                 lea.l      -14(a7),a7
[00068a34] 1f40 000c                 move.b     d0,12(a7)
[00068a38] 2f48 0008                 move.l     a0,8(a7)
[00068a3c] 2f49 0004                 move.l     a1,4(a7)
[00068a40] 426f 0002                 clr.w      2(a7)
[00068a44] 206f 0008                 movea.l    8(a7),a0
[00068a48] 4eb9 0008 2f6c            jsr        strlen
[00068a4e] e240                      asr.w      #1,d0
[00068a50] 3e80                      move.w     d0,(a7)
[00068a52] 602e                      bra.s      $00068A82
[00068a54] 302f 0002                 move.w     2(a7),d0
[00068a58] 206f 0008                 movea.l    8(a7),a0
[00068a5c] 122f 000c                 move.b     12(a7),d1
[00068a60] b230 0000                 cmp.b      0(a0,d0.w),d1
[00068a64] 6516                      bcs.s      $00068A7C
[00068a66] 302f 0002                 move.w     2(a7),d0
[00068a6a] 206f 0008                 movea.l    8(a7),a0
[00068a6e] 122f 000c                 move.b     12(a7),d1
[00068a72] b230 0001                 cmp.b      1(a0,d0.w),d1
[00068a76] 6204                      bhi.s      $00068A7C
[00068a78] 7001                      moveq.l    #1,d0
[00068a7a] 602a                      bra.s      $00068AA6
[00068a7c] 5357                      subq.w     #1,(a7)
[00068a7e] 546f 0002                 addq.w     #2,2(a7)
[00068a82] 3017                      move.w     (a7),d0
[00068a84] 6ece                      bgt.s      $00068A54
[00068a86] 202f 0004                 move.l     4(a7),d0
[00068a8a] 6718                      beq.s      $00068AA4
[00068a8c] 4240                      clr.w      d0
[00068a8e] 102f 000c                 move.b     12(a7),d0
[00068a92] 206f 0004                 movea.l    4(a7),a0
[00068a96] 4eb9 0008 2e8a            jsr        strchr
[00068a9c] 2008                      move.l     a0,d0
[00068a9e] 6704                      beq.s      $00068AA4
[00068aa0] 7001                      moveq.l    #1,d0
[00068aa2] 6002                      bra.s      $00068AA6
[00068aa4] 4240                      clr.w      d0
[00068aa6] 4fef 000e                 lea.l      14(a7),a7
[00068aaa] 4e75                      rts
boxed_findsep:
[00068aac] 4fef fff6                 lea.l      -10(a7),a7
[00068ab0] 2f48 0006                 move.l     a0,6(a7)
[00068ab4] 1f40 0004                 move.b     d0,4(a7)
[00068ab8] 2e89                      move.l     a1,(a7)
[00068aba] 7000                      moveq.l    #0,d0
[00068abc] 2057                      movea.l    (a7),a0
[00068abe] 2140 0004                 move.l     d0,4(a0)
[00068ac2] 2057                      movea.l    (a7),a0
[00068ac4] 2080                      move.l     d0,(a0)
[00068ac6] 102f 0004                 move.b     4(a7),d0
[00068aca] 4880                      ext.w      d0
[00068acc] 206f 0006                 movea.l    6(a7),a0
[00068ad0] 4eb9 0008 2e8a            jsr        strchr
[00068ad6] 2257                      movea.l    (a7),a1
[00068ad8] 2288                      move.l     a0,(a1)
[00068ada] 2057                      movea.l    (a7),a0
[00068adc] 2010                      move.l     (a0),d0
[00068ade] 6718                      beq.s      $00068AF8
[00068ae0] 102f 0004                 move.b     4(a7),d0
[00068ae4] 4880                      ext.w      d0
[00068ae6] 2057                      movea.l    (a7),a0
[00068ae8] 2050                      movea.l    (a0),a0
[00068aea] 5248                      addq.w     #1,a0
[00068aec] 4eb9 0008 2e8a            jsr        strchr
[00068af2] 2257                      movea.l    (a7),a1
[00068af4] 2348 0004                 move.l     a0,4(a1)
[00068af8] 4fef 000a                 lea.l      10(a7),a7
[00068afc] 4e75                      rts
boxed_checktext:
[00068afe] 2f0a                      move.l     a2,-(a7)
[00068b00] 4fef ffce                 lea.l      -50(a7),a7
[00068b04] 2f48 002e                 move.l     a0,46(a7)
[00068b08] 2f49 002a                 move.l     a1,42(a7)
[00068b0c] 3f7c ffff 0028            move.w     #$FFFF,40(a7)
[00068b12] 426f 0026                 clr.w      38(a7)
[00068b16] 422f 0010                 clr.b      16(a7)
[00068b1a] 206f 003a                 movea.l    58(a7),a0
[00068b1e] 4210                      clr.b      (a0)
[00068b20] 206f 002e                 movea.l    46(a7),a0
[00068b24] 2f68 000c 0004            move.l     12(a0),4(a7)
[00068b2a] 206f 0004                 movea.l    4(a7),a0
[00068b2e] 2f68 0010 000c            move.l     16(a0),12(a7)
[00068b34] 206f 0004                 movea.l    4(a7),a0
[00068b38] 5848                      addq.w     #4,a0
[00068b3a] 2e88                      move.l     a0,(a7)
[00068b3c] 206f 000c                 movea.l    12(a7),a0
[00068b40] 2f68 0204 0008            move.l     516(a0),8(a7)
[00068b46] 202f 0008                 move.l     8(a7),d0
[00068b4a] 671e                      beq.s      $00068B6A
[00068b4c] 206f 0008                 movea.l    8(a7),a0
[00068b50] 3028 001c                 move.w     28(a0),d0
[00068b54] 206f 000c                 movea.l    12(a7),a0
[00068b58] b068 020c                 cmp.w      524(a0),d0
[00068b5c] 660c                      bne.s      $00068B6A
[00068b5e] 206f 000c                 movea.l    12(a7),a0
[00068b62] 2068 0210                 movea.l    528(a0),a0
[00068b66] 3f50 0028                 move.w     (a0),40(a7)
[00068b6a] 302f 0028                 move.w     40(a7),d0
[00068b6e] 6a0a                      bpl.s      $00068B7A
[00068b70] 206f 000c                 movea.l    12(a7),a0
[00068b74] 3f68 020e 0028            move.w     526(a0),40(a7)
[00068b7a] 206f 003e                 movea.l    62(a7),a0
[00068b7e] 3f50 0022                 move.w     (a0),34(a7)
[00068b82] 6e06                      bgt.s      $00068B8A
[00068b84] 4240                      clr.w      d0
[00068b86] 6000 0708                 bra        $00069290
[00068b8a] 2057                      movea.l    (a7),a0
[00068b8c] 3028 0002                 move.w     2(a0),d0
[00068b90] e648                      lsr.w      #3,d0
[00068b92] c07c 0001                 and.w      #$0001,d0
[00068b96] 6704                      beq.s      $00068B9C
[00068b98] 7001                      moveq.l    #1,d0
[00068b9a] 6002                      bra.s      $00068B9E
[00068b9c] 4240                      clr.w      d0
[00068b9e] 3f40 0020                 move.w     d0,32(a7)
[00068ba2] 2f6f 003a 001a            move.l     58(a7),26(a7)
[00068ba8] 426f 0024                 clr.w      36(a7)
[00068bac] 206f 000c                 movea.l    12(a7),a0
[00068bb0] 2028 0200                 move.l     512(a0),d0
[00068bb4] 674a                      beq.s      $00068C00
[00068bb6] 6018                      bra.s      $00068BD0
[00068bb8] 302f 0024                 move.w     36(a7),d0
[00068bbc] 206f 002a                 movea.l    42(a7),a0
[00068bc0] 226f 001a                 movea.l    26(a7),a1
[00068bc4] 52af 001a                 addq.l     #1,26(a7)
[00068bc8] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068bcc] 526f 0024                 addq.w     #1,36(a7)
[00068bd0] 302f 0024                 move.w     36(a7),d0
[00068bd4] b06f 0022                 cmp.w      34(a7),d0
[00068bd8] 6c22                      bge.s      $00068BFC
[00068bda] 302f 0024                 move.w     36(a7),d0
[00068bde] 206f 002a                 movea.l    42(a7),a0
[00068be2] 4241                      clr.w      d1
[00068be4] 1230 0000                 move.b     0(a0,d0.w),d1
[00068be8] 3001                      move.w     d1,d0
[00068bea] 206f 000c                 movea.l    12(a7),a0
[00068bee] 2068 0200                 movea.l    512(a0),a0
[00068bf2] 4eb9 0008 2e8a            jsr        strchr
[00068bf8] 2008                      move.l     a0,d0
[00068bfa] 66bc                      bne.s      $00068BB8
[00068bfc] 6000 064c                 bra        $0006924A
[00068c00] 2057                      movea.l    (a7),a0
[00068c02] 3010                      move.w     (a0),d0
[00068c04] e648                      lsr.w      #3,d0
[00068c06] c07c 001f                 and.w      #$001F,d0
[00068c0a] b07c 001a                 cmp.w      #$001A,d0
[00068c0e] 6200 063a                 bhi        $0006924A
[00068c12] d040                      add.w      d0,d0
[00068c14] 303b 0006                 move.w     $00068C1C(pc,d0.w),d0
[00068c18] 4efb 0002                 jmp        $00068C1C(pc,d0.w)
J54:
[00068c1c] 0036                      dc.w $0036   ; $00068c52-$00068c1c
[00068c1e] 0036                      dc.w $0036   ; $00068c52-$00068c1c
[00068c20] 0066                      dc.w $0066   ; $00068c82-$00068c1c
[00068c22] 00ae                      dc.w $00ae   ; $00068cca-$00068c1c
[00068c24] 00fc                      dc.w $00fc   ; $00068d18-$00068c1c
[00068c26] 014a                      dc.w $014a   ; $00068d66-$00068c1c
[00068c28] 0198                      dc.w $0198   ; $00068db4-$00068c1c
[00068c2a] 01e6                      dc.w $01e6   ; $00068e02-$00068c1c
[00068c2c] 021e                      dc.w $021e   ; $00068e3a-$00068c1c
[00068c2e] 0224                      dc.w $0224   ; $00068e40-$00068c1c
[00068c30] 02b2                      dc.w $02b2   ; $00068ece-$00068c1c
[00068c32] 027e                      dc.w $027e   ; $00068e9a-$00068c1c
[00068c34] 032a                      dc.w $032a   ; $00068f46-$00068c1c
[00068c36] 02f6                      dc.w $02f6   ; $00068f12-$00068c1c
[00068c38] 03a2                      dc.w $03a2   ; $00068fbe-$00068c1c
[00068c3a] 036e                      dc.w $036e   ; $00068f8a-$00068c1c
[00068c3c] 041a                      dc.w $041a   ; $00069036-$00068c1c
[00068c3e] 03e6                      dc.w $03e6   ; $00069002-$00068c1c
[00068c40] 0498                      dc.w $0498   ; $000690b4-$00068c1c
[00068c42] 0464                      dc.w $0464   ; $00069080-$00068c1c
[00068c44] 0542                      dc.w $0542   ; $0006915e-$00068c1c
[00068c46] 0548                      dc.w $0548   ; $00069164-$00068c1c
[00068c48] 0542                      dc.w $0542   ; $0006915e-$00068c1c
[00068c4a] 0548                      dc.w $0548   ; $00069164-$00068c1c
[00068c4c] 0554                      dc.w $0554   ; $00069170-$00068c1c
[00068c4e] 0554                      dc.w $0554   ; $00069170-$00068c1c
[00068c50] 0554                      dc.w $0554   ; $00069170-$00068c1c
[00068c52] 302f 0022                 move.w     34(a7),d0
[00068c56] 906f 0024                 sub.w      36(a7),d0
[00068c5a] 48c0                      ext.l      d0
[00068c5c] 322f 0024                 move.w     36(a7),d1
[00068c60] 226f 002a                 movea.l    42(a7),a1
[00068c64] d2c1                      adda.w     d1,a1
[00068c66] 206f 001a                 movea.l    26(a7),a0
[00068c6a] 4eb9 0008 2fd6            jsr        strncpy
[00068c70] 302f 0022                 move.w     34(a7),d0
[00068c74] 906f 0024                 sub.w      36(a7),d0
[00068c78] 48c0                      ext.l      d0
[00068c7a] d1af 001a                 add.l      d0,26(a7)
[00068c7e] 6000 05ca                 bra        $0006924A
[00068c82] 6018                      bra.s      $00068C9C
[00068c84] 302f 0024                 move.w     36(a7),d0
[00068c88] 206f 002a                 movea.l    42(a7),a0
[00068c8c] 226f 001a                 movea.l    26(a7),a1
[00068c90] 52af 001a                 addq.l     #1,26(a7)
[00068c94] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068c98] 526f 0024                 addq.w     #1,36(a7)
[00068c9c] 302f 0024                 move.w     36(a7),d0
[00068ca0] b06f 0022                 cmp.w      34(a7),d0
[00068ca4] 6c20                      bge.s      $00068CC6
[00068ca6] 302f 0024                 move.w     36(a7),d0
[00068caa] 206f 002a                 movea.l    42(a7),a0
[00068cae] 4241                      clr.w      d1
[00068cb0] 1230 0000                 move.b     0(a0,d0.w),d1
[00068cb4] 3001                      move.w     d1,d0
[00068cb6] 41f9 000e 1efe            lea.l      $000E1EFE,a0
[00068cbc] 4eb9 0008 2e8a            jsr        strchr
[00068cc2] 2008                      move.l     a0,d0
[00068cc4] 67be                      beq.s      $00068C84
[00068cc6] 6000 0582                 bra        $0006924A
[00068cca] 3f7c 0001 0020            move.w     #$0001,32(a7)
[00068cd0] 6018                      bra.s      $00068CEA
[00068cd2] 302f 0024                 move.w     36(a7),d0
[00068cd6] 206f 002a                 movea.l    42(a7),a0
[00068cda] 226f 001a                 movea.l    26(a7),a1
[00068cde] 52af 001a                 addq.l     #1,26(a7)
[00068ce2] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068ce6] 526f 0024                 addq.w     #1,36(a7)
[00068cea] 302f 0024                 move.w     36(a7),d0
[00068cee] b06f 0022                 cmp.w      34(a7),d0
[00068cf2] 6c20                      bge.s      $00068D14
[00068cf4] 43f9 000e 1f08            lea.l      $000E1F08,a1
[00068cfa] 41f9 000e 1f01            lea.l      $000E1F01,a0
[00068d00] 322f 0024                 move.w     36(a7),d1
[00068d04] 246f 002a                 movea.l    42(a7),a2
[00068d08] 1032 1000                 move.b     0(a2,d1.w),d0
[00068d0c] 6100 fd22                 bsr        boxed_within
[00068d10] 4a40                      tst.w      d0
[00068d12] 66be                      bne.s      $00068CD2
[00068d14] 6000 0534                 bra        $0006924A
[00068d18] 3f7c 0001 0020            move.w     #$0001,32(a7)
[00068d1e] 6018                      bra.s      $00068D38
[00068d20] 302f 0024                 move.w     36(a7),d0
[00068d24] 206f 002a                 movea.l    42(a7),a0
[00068d28] 226f 001a                 movea.l    26(a7),a1
[00068d2c] 52af 001a                 addq.l     #1,26(a7)
[00068d30] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068d34] 526f 0024                 addq.w     #1,36(a7)
[00068d38] 302f 0024                 move.w     36(a7),d0
[00068d3c] b06f 0022                 cmp.w      34(a7),d0
[00068d40] 6c20                      bge.s      $00068D62
[00068d42] 43f9 000e 1f2a            lea.l      $000E1F2A,a1
[00068d48] 41f9 000e 1f23            lea.l      $000E1F23,a0
[00068d4e] 322f 0024                 move.w     36(a7),d1
[00068d52] 246f 002a                 movea.l    42(a7),a2
[00068d56] 1032 1000                 move.b     0(a2,d1.w),d0
[00068d5a] 6100 fcd4                 bsr        boxed_within
[00068d5e] 4a40                      tst.w      d0
[00068d60] 66be                      bne.s      $00068D20
[00068d62] 6000 04e6                 bra        $0006924A
[00068d66] 3f7c 0001 0020            move.w     #$0001,32(a7)
[00068d6c] 6018                      bra.s      $00068D86
[00068d6e] 302f 0024                 move.w     36(a7),d0
[00068d72] 206f 002a                 movea.l    42(a7),a0
[00068d76] 226f 001a                 movea.l    26(a7),a1
[00068d7a] 52af 001a                 addq.l     #1,26(a7)
[00068d7e] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068d82] 526f 0024                 addq.w     #1,36(a7)
[00068d86] 302f 0024                 move.w     36(a7),d0
[00068d8a] b06f 0022                 cmp.w      34(a7),d0
[00068d8e] 6c20                      bge.s      $00068DB0
[00068d90] 43f9 000e 1f4e            lea.l      $000E1F4E,a1
[00068d96] 41f9 000e 1f47            lea.l      $000E1F47,a0
[00068d9c] 322f 0024                 move.w     36(a7),d1
[00068da0] 246f 002a                 movea.l    42(a7),a2
[00068da4] 1032 1000                 move.b     0(a2,d1.w),d0
[00068da8] 6100 fc86                 bsr        boxed_within
[00068dac] 4a40                      tst.w      d0
[00068dae] 66be                      bne.s      $00068D6E
[00068db0] 6000 0498                 bra        $0006924A
[00068db4] 3f7c 0001 0020            move.w     #$0001,32(a7)
[00068dba] 6018                      bra.s      $00068DD4
[00068dbc] 302f 0024                 move.w     36(a7),d0
[00068dc0] 206f 002a                 movea.l    42(a7),a0
[00068dc4] 226f 001a                 movea.l    26(a7),a1
[00068dc8] 52af 001a                 addq.l     #1,26(a7)
[00068dcc] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068dd0] 526f 0024                 addq.w     #1,36(a7)
[00068dd4] 302f 0024                 move.w     36(a7),d0
[00068dd8] b06f 0022                 cmp.w      34(a7),d0
[00068ddc] 6c20                      bge.s      $00068DFE
[00068dde] 43f9 000e 1f72            lea.l      $000E1F72,a1
[00068de4] 41f9 000e 1f6b            lea.l      $000E1F6B,a0
[00068dea] 322f 0024                 move.w     36(a7),d1
[00068dee] 246f 002a                 movea.l    42(a7),a2
[00068df2] 1032 1000                 move.b     0(a2,d1.w),d0
[00068df6] 6100 fc38                 bsr        boxed_within
[00068dfa] 4a40                      tst.w      d0
[00068dfc] 66be                      bne.s      $00068DBC
[00068dfe] 6000 044a                 bra        $0006924A
[00068e02] 6018                      bra.s      $00068E1C
[00068e04] 302f 0024                 move.w     36(a7),d0
[00068e08] 206f 002a                 movea.l    42(a7),a0
[00068e0c] 226f 001a                 movea.l    26(a7),a1
[00068e10] 52af 001a                 addq.l     #1,26(a7)
[00068e14] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068e18] 526f 0024                 addq.w     #1,36(a7)
[00068e1c] 302f 0024                 move.w     36(a7),d0
[00068e20] b06f 0022                 cmp.w      34(a7),d0
[00068e24] 6c10                      bge.s      $00068E36
[00068e26] 302f 0024                 move.w     36(a7),d0
[00068e2a] 206f 002a                 movea.l    42(a7),a0
[00068e2e] 0c30 0020 0000            cmpi.b     #$20,0(a0,d0.w)
[00068e34] 64ce                      bcc.s      $00068E04
[00068e36] 6000 0412                 bra        $0006924A
[00068e3a] 3f7c 0001 0026            move.w     #$0001,38(a7)
[00068e40] 6018                      bra.s      $00068E5A
[00068e42] 302f 0024                 move.w     36(a7),d0
[00068e46] 206f 002a                 movea.l    42(a7),a0
[00068e4a] 226f 001a                 movea.l    26(a7),a1
[00068e4e] 52af 001a                 addq.l     #1,26(a7)
[00068e52] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068e56] 526f 0024                 addq.w     #1,36(a7)
[00068e5a] 302f 0024                 move.w     36(a7),d0
[00068e5e] b06f 0022                 cmp.w      34(a7),d0
[00068e62] 6c32                      bge.s      $00068E96
[00068e64] 43f9 000e 1f9d            lea.l      $000E1F9D,a1
[00068e6a] 2f09                      move.l     a1,-(a7)
[00068e6c] 302f 002a                 move.w     42(a7),d0
[00068e70] 6708                      beq.s      $00068E7A
[00068e72] 41f9 000e 1f91            lea.l      $000E1F91,a0
[00068e78] 6006                      bra.s      $00068E80
[00068e7a] 41f9 000e 1f96            lea.l      $000E1F96,a0
[00068e80] 322f 0028                 move.w     40(a7),d1
[00068e84] 226f 002e                 movea.l    46(a7),a1
[00068e88] 1031 1000                 move.b     0(a1,d1.w),d0
[00068e8c] 225f                      movea.l    (a7)+,a1
[00068e8e] 6100 fba0                 bsr        boxed_within
[00068e92] 4a40                      tst.w      d0
[00068e94] 66ac                      bne.s      $00068E42
[00068e96] 6000 03b2                 bra        $0006924A
[00068e9a] 302f 0024                 move.w     36(a7),d0
[00068e9e] 662e                      bne.s      $00068ECE
[00068ea0] 302f 0028                 move.w     40(a7),d0
[00068ea4] 6628                      bne.s      $00068ECE
[00068ea6] 302f 0024                 move.w     36(a7),d0
[00068eaa] 206f 002a                 movea.l    42(a7),a0
[00068eae] 0c30 002d 0000            cmpi.b     #$2D,0(a0,d0.w)
[00068eb4] 6618                      bne.s      $00068ECE
[00068eb6] 302f 0024                 move.w     36(a7),d0
[00068eba] 206f 002a                 movea.l    42(a7),a0
[00068ebe] 226f 001a                 movea.l    26(a7),a1
[00068ec2] 52af 001a                 addq.l     #1,26(a7)
[00068ec6] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068eca] 526f 0024                 addq.w     #1,36(a7)
[00068ece] 6018                      bra.s      $00068EE8
[00068ed0] 302f 0024                 move.w     36(a7),d0
[00068ed4] 206f 002a                 movea.l    42(a7),a0
[00068ed8] 226f 001a                 movea.l    26(a7),a1
[00068edc] 52af 001a                 addq.l     #1,26(a7)
[00068ee0] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068ee4] 526f 0024                 addq.w     #1,36(a7)
[00068ee8] 302f 0024                 move.w     36(a7),d0
[00068eec] b06f 0022                 cmp.w      34(a7),d0
[00068ef0] 6c1c                      bge.s      $00068F0E
[00068ef2] 93c9                      suba.l     a1,a1
[00068ef4] 41f9 000e 1f9f            lea.l      $000E1F9F,a0
[00068efa] 322f 0024                 move.w     36(a7),d1
[00068efe] 246f 002a                 movea.l    42(a7),a2
[00068f02] 1032 1000                 move.b     0(a2,d1.w),d0
[00068f06] 6100 fb28                 bsr        boxed_within
[00068f0a] 4a40                      tst.w      d0
[00068f0c] 66c2                      bne.s      $00068ED0
[00068f0e] 6000 033a                 bra        $0006924A
[00068f12] 302f 0024                 move.w     36(a7),d0
[00068f16] 662e                      bne.s      $00068F46
[00068f18] 302f 0028                 move.w     40(a7),d0
[00068f1c] 6628                      bne.s      $00068F46
[00068f1e] 302f 0024                 move.w     36(a7),d0
[00068f22] 206f 002a                 movea.l    42(a7),a0
[00068f26] 0c30 002d 0000            cmpi.b     #$2D,0(a0,d0.w)
[00068f2c] 6618                      bne.s      $00068F46
[00068f2e] 302f 0024                 move.w     36(a7),d0
[00068f32] 206f 002a                 movea.l    42(a7),a0
[00068f36] 226f 001a                 movea.l    26(a7),a1
[00068f3a] 52af 001a                 addq.l     #1,26(a7)
[00068f3e] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068f42] 526f 0024                 addq.w     #1,36(a7)
[00068f46] 6018                      bra.s      $00068F60
[00068f48] 302f 0024                 move.w     36(a7),d0
[00068f4c] 206f 002a                 movea.l    42(a7),a0
[00068f50] 226f 001a                 movea.l    26(a7),a1
[00068f54] 52af 001a                 addq.l     #1,26(a7)
[00068f58] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068f5c] 526f 0024                 addq.w     #1,36(a7)
[00068f60] 302f 0024                 move.w     36(a7),d0
[00068f64] b06f 0022                 cmp.w      34(a7),d0
[00068f68] 6c1c                      bge.s      $00068F86
[00068f6a] 93c9                      suba.l     a1,a1
[00068f6c] 41f9 000e 1fa2            lea.l      $000E1FA2,a0
[00068f72] 322f 0024                 move.w     36(a7),d1
[00068f76] 246f 002a                 movea.l    42(a7),a2
[00068f7a] 1032 1000                 move.b     0(a2,d1.w),d0
[00068f7e] 6100 fab0                 bsr        boxed_within
[00068f82] 4a40                      tst.w      d0
[00068f84] 66c2                      bne.s      $00068F48
[00068f86] 6000 02c2                 bra        $0006924A
[00068f8a] 302f 0024                 move.w     36(a7),d0
[00068f8e] 662e                      bne.s      $00068FBE
[00068f90] 302f 0028                 move.w     40(a7),d0
[00068f94] 6628                      bne.s      $00068FBE
[00068f96] 302f 0024                 move.w     36(a7),d0
[00068f9a] 206f 002a                 movea.l    42(a7),a0
[00068f9e] 0c30 002d 0000            cmpi.b     #$2D,0(a0,d0.w)
[00068fa4] 6618                      bne.s      $00068FBE
[00068fa6] 302f 0024                 move.w     36(a7),d0
[00068faa] 206f 002a                 movea.l    42(a7),a0
[00068fae] 226f 001a                 movea.l    26(a7),a1
[00068fb2] 52af 001a                 addq.l     #1,26(a7)
[00068fb6] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068fba] 526f 0024                 addq.w     #1,36(a7)
[00068fbe] 6018                      bra.s      $00068FD8
[00068fc0] 302f 0024                 move.w     36(a7),d0
[00068fc4] 206f 002a                 movea.l    42(a7),a0
[00068fc8] 226f 001a                 movea.l    26(a7),a1
[00068fcc] 52af 001a                 addq.l     #1,26(a7)
[00068fd0] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00068fd4] 526f 0024                 addq.w     #1,36(a7)
[00068fd8] 302f 0024                 move.w     36(a7),d0
[00068fdc] b06f 0022                 cmp.w      34(a7),d0
[00068fe0] 6c1c                      bge.s      $00068FFE
[00068fe2] 93c9                      suba.l     a1,a1
[00068fe4] 41f9 000e 1fa5            lea.l      $000E1FA5,a0
[00068fea] 322f 0024                 move.w     36(a7),d1
[00068fee] 246f 002a                 movea.l    42(a7),a2
[00068ff2] 1032 1000                 move.b     0(a2,d1.w),d0
[00068ff6] 6100 fa38                 bsr        boxed_within
[00068ffa] 4a40                      tst.w      d0
[00068ffc] 66c2                      bne.s      $00068FC0
[00068ffe] 6000 024a                 bra        $0006924A
[00069002] 302f 0024                 move.w     36(a7),d0
[00069006] 662e                      bne.s      $00069036
[00069008] 302f 0028                 move.w     40(a7),d0
[0006900c] 6628                      bne.s      $00069036
[0006900e] 302f 0024                 move.w     36(a7),d0
[00069012] 206f 002a                 movea.l    42(a7),a0
[00069016] 0c30 002d 0000            cmpi.b     #$2D,0(a0,d0.w)
[0006901c] 6618                      bne.s      $00069036
[0006901e] 302f 0024                 move.w     36(a7),d0
[00069022] 206f 002a                 movea.l    42(a7),a0
[00069026] 226f 001a                 movea.l    26(a7),a1
[0006902a] 52af 001a                 addq.l     #1,26(a7)
[0006902e] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00069032] 526f 0024                 addq.w     #1,36(a7)
[00069036] 3f7c 0001 0020            move.w     #$0001,32(a7)
[0006903c] 6018                      bra.s      $00069056
[0006903e] 302f 0024                 move.w     36(a7),d0
[00069042] 206f 002a                 movea.l    42(a7),a0
[00069046] 226f 001a                 movea.l    26(a7),a1
[0006904a] 52af 001a                 addq.l     #1,26(a7)
[0006904e] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00069052] 526f 0024                 addq.w     #1,36(a7)
[00069056] 302f 0024                 move.w     36(a7),d0
[0006905a] b06f 0022                 cmp.w      34(a7),d0
[0006905e] 6c1c                      bge.s      $0006907C
[00069060] 93c9                      suba.l     a1,a1
[00069062] 41f9 000e 1fa8            lea.l      $000E1FA8,a0
[00069068] 322f 0024                 move.w     36(a7),d1
[0006906c] 246f 002a                 movea.l    42(a7),a2
[00069070] 1032 1000                 move.b     0(a2,d1.w),d0
[00069074] 6100 f9ba                 bsr        boxed_within
[00069078] 4a40                      tst.w      d0
[0006907a] 66c2                      bne.s      $0006903E
[0006907c] 6000 01cc                 bra        $0006924A
[00069080] 302f 0024                 move.w     36(a7),d0
[00069084] 662e                      bne.s      $000690B4
[00069086] 302f 0028                 move.w     40(a7),d0
[0006908a] 6628                      bne.s      $000690B4
[0006908c] 302f 0024                 move.w     36(a7),d0
[00069090] 206f 002a                 movea.l    42(a7),a0
[00069094] 0c30 002d 0000            cmpi.b     #$2D,0(a0,d0.w)
[0006909a] 6618                      bne.s      $000690B4
[0006909c] 302f 0024                 move.w     36(a7),d0
[000690a0] 206f 002a                 movea.l    42(a7),a0
[000690a4] 226f 001a                 movea.l    26(a7),a1
[000690a8] 52af 001a                 addq.l     #1,26(a7)
[000690ac] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[000690b0] 526f 0024                 addq.w     #1,36(a7)
[000690b4] 702e                      moveq.l    #46,d0
[000690b6] 206f 000c                 movea.l    12(a7),a0
[000690ba] 41e8 0100                 lea.l      256(a0),a0
[000690be] 4eb9 0008 2e8a            jsr        strchr
[000690c4] 2f48 0012                 move.l     a0,18(a7)
[000690c8] 702e                      moveq.l    #46,d0
[000690ca] 206f 002a                 movea.l    42(a7),a0
[000690ce] 4eb9 0008 2e8a            jsr        strchr
[000690d4] 2f48 0016                 move.l     a0,22(a7)
[000690d8] 6054                      bra.s      $0006912E
[000690da] 302f 0024                 move.w     36(a7),d0
[000690de] 206f 002a                 movea.l    42(a7),a0
[000690e2] 0c30 002e 0000            cmpi.b     #$2E,0(a0,d0.w)
[000690e8] 662c                      bne.s      $00069116
[000690ea] 202f 0012                 move.l     18(a7),d0
[000690ee] 6624                      bne.s      $00069114
[000690f0] 302f 0024                 move.w     36(a7),d0
[000690f4] 206f 002a                 movea.l    42(a7),a0
[000690f8] d0c0                      adda.w     d0,a0
[000690fa] b1ef 0016                 cmpa.l     22(a7),a0
[000690fe] 6614                      bne.s      $00069114
[00069100] 302f 0024                 move.w     36(a7),d0
[00069104] 206f 002a                 movea.l    42(a7),a0
[00069108] 226f 001a                 movea.l    26(a7),a1
[0006910c] 52af 001a                 addq.l     #1,26(a7)
[00069110] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00069114] 6014                      bra.s      $0006912A
[00069116] 302f 0024                 move.w     36(a7),d0
[0006911a] 206f 002a                 movea.l    42(a7),a0
[0006911e] 226f 001a                 movea.l    26(a7),a1
[00069122] 52af 001a                 addq.l     #1,26(a7)
[00069126] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[0006912a] 526f 0024                 addq.w     #1,36(a7)
[0006912e] 302f 0024                 move.w     36(a7),d0
[00069132] b06f 0022                 cmp.w      34(a7),d0
[00069136] 6c22                      bge.s      $0006915A
[00069138] 43f9 000e 1fb2            lea.l      $000E1FB2,a1
[0006913e] 41f9 000e 1faf            lea.l      $000E1FAF,a0
[00069144] 322f 0024                 move.w     36(a7),d1
[00069148] 246f 002a                 movea.l    42(a7),a2
[0006914c] 1032 1000                 move.b     0(a2,d1.w),d0
[00069150] 6100 f8de                 bsr        boxed_within
[00069154] 4a40                      tst.w      d0
[00069156] 6600 ff82                 bne.w      $000690DA
[0006915a] 6000 00ee                 bra        $0006924A
[0006915e] 1f7c 002e 0010            move.b     #$2E,16(a7)
[00069164] 102f 0010                 move.b     16(a7),d0
[00069168] 6606                      bne.s      $00069170
[0006916a] 1f7c 002f 0010            move.b     #$2F,16(a7)
[00069170] 102f 0010                 move.b     16(a7),d0
[00069174] 6606                      bne.s      $0006917C
[00069176] 1f7c 003a 0010            move.b     #$3A,16(a7)
[0006917c] 43ef 0012                 lea.l      18(a7),a1
[00069180] 102f 0010                 move.b     16(a7),d0
[00069184] 206f 000c                 movea.l    12(a7),a0
[00069188] 41e8 0100                 lea.l      256(a0),a0
[0006918c] 6100 f91e                 bsr        boxed_findsep
[00069190] 6000 00aa                 bra        $0006923C
[00069194] 302f 0024                 move.w     36(a7),d0
[00069198] 206f 002a                 movea.l    42(a7),a0
[0006919c] 4241                      clr.w      d1
[0006919e] 1230 0000                 move.b     0(a0,d0.w),d1
[000691a2] 927c 002e                 sub.w      #$002E,d1
[000691a6] 670c                      beq.s      $000691B4
[000691a8] 5341                      subq.w     #1,d1
[000691aa] 6708                      beq.s      $000691B4
[000691ac] 927c 000b                 sub.w      #$000B,d1
[000691b0] 6702                      beq.s      $000691B4
[000691b2] 6054                      bra.s      $00069208
[000691b4] 302f 0024                 move.w     36(a7),d0
[000691b8] 206f 002a                 movea.l    42(a7),a0
[000691bc] 1030 0000                 move.b     0(a0,d0.w),d0
[000691c0] b02f 0010                 cmp.b      16(a7),d0
[000691c4] 6640                      bne.s      $00069206
[000691c6] 426f 001e                 clr.w      30(a7)
[000691ca] 6032                      bra.s      $000691FE
[000691cc] 302f 001e                 move.w     30(a7),d0
[000691d0] e548                      lsl.w      #2,d0
[000691d2] 2037 0012                 move.l     18(a7,d0.w),d0
[000691d6] 6622                      bne.s      $000691FA
[000691d8] 302f 0024                 move.w     36(a7),d0
[000691dc] 206f 002a                 movea.l    42(a7),a0
[000691e0] d0c0                      adda.w     d0,a0
[000691e2] 302f 001e                 move.w     30(a7),d0
[000691e6] e548                      lsl.w      #2,d0
[000691e8] 2f88 0012                 move.l     a0,18(a7,d0.w)
[000691ec] 206f 001a                 movea.l    26(a7),a0
[000691f0] 52af 001a                 addq.l     #1,26(a7)
[000691f4] 10af 0010                 move.b     16(a7),(a0)
[000691f8] 600c                      bra.s      $00069206
[000691fa] 526f 001e                 addq.w     #1,30(a7)
[000691fe] 0c6f 0002 001e            cmpi.w     #$0002,30(a7)
[00069204] 6dc6                      blt.s      $000691CC
[00069206] 6030                      bra.s      $00069238
[00069208] 93c9                      suba.l     a1,a1
[0006920a] 41f9 000e 1fb4            lea.l      $000E1FB4,a0
[00069210] 322f 0024                 move.w     36(a7),d1
[00069214] 246f 002a                 movea.l    42(a7),a2
[00069218] 1032 1000                 move.b     0(a2,d1.w),d0
[0006921c] 6100 f812                 bsr        boxed_within
[00069220] 4a40                      tst.w      d0
[00069222] 6714                      beq.s      $00069238
[00069224] 302f 0024                 move.w     36(a7),d0
[00069228] 206f 002a                 movea.l    42(a7),a0
[0006922c] 226f 001a                 movea.l    26(a7),a1
[00069230] 52af 001a                 addq.l     #1,26(a7)
[00069234] 12b0 0000                 move.b     0(a0,d0.w),(a1)
[00069238] 526f 0024                 addq.w     #1,36(a7)
[0006923c] 302f 0024                 move.w     36(a7),d0
[00069240] b06f 0022                 cmp.w      34(a7),d0
[00069244] 6d00 ff4e                 blt        $00069194
[00069248] 4e71                      nop
[0006924a] 4200                      clr.b      d0
[0006924c] 206f 001a                 movea.l    26(a7),a0
[00069250] 1080                      move.b     d0,(a0)
[00069252] 322f 0022                 move.w     34(a7),d1
[00069256] 206f 003a                 movea.l    58(a7),a0
[0006925a] 1180 1000                 move.b     d0,0(a0,d1.w)
[0006925e] 302f 0020                 move.w     32(a7),d0
[00069262] 670a                      beq.s      $0006926E
[00069264] 206f 003a                 movea.l    58(a7),a0
[00069268] 4eb9 0004 64da            jsr        Ast_toupper
[0006926e] 206f 003a                 movea.l    58(a7),a0
[00069272] 4eb9 0008 2f6c            jsr        strlen
[00069278] 206f 003e                 movea.l    62(a7),a0
[0006927c] 3080                      move.w     d0,(a0)
[0006927e] 206f 003e                 movea.l    62(a7),a0
[00069282] 3010                      move.w     (a0),d0
[00069284] 6f06                      ble.s      $0006928C
[00069286] 7001                      moveq.l    #1,d0
[00069288] 6006                      bra.s      $00069290
[0006928a] 6004                      bra.s      $00069290
[0006928c] 4240                      clr.w      d0
[0006928e] 4e71                      nop
[00069290] 4fef 0032                 lea.l      50(a7),a7
[00069294] 245f                      movea.l    (a7)+,a2
[00069296] 4e75                      rts
boxed_validate:
[00069298] 4fef fff4                 lea.l      -12(a7),a7
[0006929c] 2f48 0008                 move.l     a0,8(a7)
[000692a0] 2f49 0004                 move.l     a1,4(a7)
[000692a4] 4297                      clr.l      (a7)
[000692a6] 206f 0004                 movea.l    4(a7),a0
[000692aa] 41e8 fff7                 lea.l      -9(a0),a0
[000692ae] b1ef 0008                 cmpa.l     8(a7),a0
[000692b2] 630c                      bls.s      $000692C0
[000692b4] 206f 0008                 movea.l    8(a7),a0
[000692b8] 41e8 0009                 lea.l      9(a0),a0
[000692bc] 2f48 0004                 move.l     a0,4(a7)
[000692c0] 206f 0008                 movea.l    8(a7),a0
[000692c4] 1010                      move.b     (a0),d0
[000692c6] 4880                      ext.w      d0
[000692c8] 4eb9 0008 37ce            jsr        isdigit
[000692ce] 4a40                      tst.w      d0
[000692d0] 6604                      bne.s      $000692D6
[000692d2] 70ff                      moveq.l    #-1,d0
[000692d4] 6040                      bra.s      $00069316
[000692d6] 6020                      bra.s      $000692F8
[000692d8] 2217                      move.l     (a7),d1
[000692da] 2001                      move.l     d1,d0
[000692dc] e588                      lsl.l      #2,d0
[000692de] d081                      add.l      d1,d0
[000692e0] d080                      add.l      d0,d0
[000692e2] 2e80                      move.l     d0,(a7)
[000692e4] 206f 0008                 movea.l    8(a7),a0
[000692e8] 1010                      move.b     (a0),d0
[000692ea] 4880                      ext.w      d0
[000692ec] d07c ffd0                 add.w      #$FFD0,d0
[000692f0] 48c0                      ext.l      d0
[000692f2] d197                      add.l      d0,(a7)
[000692f4] 52af 0008                 addq.l     #1,8(a7)
[000692f8] 206f 0008                 movea.l    8(a7),a0
[000692fc] b1ef 0004                 cmpa.l     4(a7),a0
[00069300] 6412                      bcc.s      $00069314
[00069302] 206f 0008                 movea.l    8(a7),a0
[00069306] 1010                      move.b     (a0),d0
[00069308] 4880                      ext.w      d0
[0006930a] 4eb9 0008 37ce            jsr        isdigit
[00069310] 4a40                      tst.w      d0
[00069312] 66c4                      bne.s      $000692D8
[00069314] 2017                      move.l     (a7),d0
[00069316] 4fef 000c                 lea.l      12(a7),a7
[0006931a] 4e75                      rts
boxed_postcheck:
[0006931c] 4fef fed4                 lea.l      -300(a7),a7
[00069320] 2f48 0128                 move.l     a0,296(a7)
[00069324] 41f9 000e 1dfa            lea.l      $000E1DFA,a0
[0006932a] 43ef 0012                 lea.l      18(a7),a1
[0006932e] 303c 00ff                 move.w     #$00FF,d0
[00069332] 12d8                      move.b     (a0)+,(a1)+
[00069334] 51c8 fffc                 dbf        d0,$00069332
[00069338] 2f7c ffff ffff 000e       move.l     #$FFFFFFFF,14(a7)
[00069340] 2f7c ffff ffff 000a       move.l     #$FFFFFFFF,10(a7)
[00069348] 2f7c ffff ffff 0006       move.l     #$FFFFFFFF,6(a7)
[00069350] 206f 0128                 movea.l    296(a7),a0
[00069354] 2f68 000c 0124            move.l     12(a0),292(a7)
[0006935a] 206f 0124                 movea.l    292(a7),a0
[0006935e] 2f68 0010 0120            move.l     16(a0),288(a7)
[00069364] 206f 0124                 movea.l    292(a7),a0
[00069368] 5848                      addq.w     #4,a0
[0006936a] 2f48 011c                 move.l     a0,284(a7)
[0006936e] 206f 011c                 movea.l    284(a7),a0
[00069372] 3010                      move.w     (a0),d0
[00069374] e648                      lsr.w      #3,d0
[00069376] c07c 001f                 and.w      #$001F,d0
[0006937a] 907c 0014                 sub.w      #$0014,d0
[0006937e] b07c 0006                 cmp.w      #$0006,d0
[00069382] 622e                      bhi.s      $000693B2
[00069384] d040                      add.w      d0,d0
[00069386] 303b 0006                 move.w     $0006938E(pc,d0.w),d0
[0006938a] 4efb 0002                 jmp        $0006938E(pc,d0.w)
J55:
[0006938e] 000e                      dc.w $000e   ; $0006939c-$0006938e
[00069390] 0016                      dc.w $0016   ; $000693a4-$0006938e
[00069392] 000e                      dc.w $000e   ; $0006939c-$0006938e
[00069394] 0016                      dc.w $0016   ; $000693a4-$0006938e
[00069396] 001e                      dc.w $001e   ; $000693ac-$0006938e
[00069398] 001e                      dc.w $001e   ; $000693ac-$0006938e
[0006939a] 001e                      dc.w $001e   ; $000693ac-$0006938e
[0006939c] 1f7c 002e 011a            move.b     #$2E,282(a7)
[000693a2] 600e                      bra.s      $000693B2
[000693a4] 1f7c 002f 011a            move.b     #$2F,282(a7)
[000693aa] 6006                      bra.s      $000693B2
[000693ac] 1f7c 003a 011a            move.b     #$3A,282(a7)
[000693b2] 206f 011c                 movea.l    284(a7),a0
[000693b6] 3010                      move.w     (a0),d0
[000693b8] e648                      lsr.w      #3,d0
[000693ba] c07c 001f                 and.w      #$001F,d0
[000693be] b07c 0014                 cmp.w      #$0014,d0
[000693c2] 6500 00b0                 bcs        $00069474
[000693c6] 206f 011c                 movea.l    284(a7),a0
[000693ca] 3010                      move.w     (a0),d0
[000693cc] e648                      lsr.w      #3,d0
[000693ce] c07c 001f                 and.w      #$001F,d0
[000693d2] b07c 001a                 cmp.w      #$001A,d0
[000693d6] 6200 009c                 bhi        $00069474
[000693da] 43ef 0112                 lea.l      274(a7),a1
[000693de] 102f 011a                 move.b     282(a7),d0
[000693e2] 206f 0120                 movea.l    288(a7),a0
[000693e6] 41e8 0100                 lea.l      256(a0),a0
[000693ea] 6100 f6c0                 bsr        boxed_findsep
[000693ee] 202f 0112                 move.l     274(a7),d0
[000693f2] 6706                      beq.s      $000693FA
[000693f4] 226f 0112                 movea.l    274(a7),a1
[000693f8] 6012                      bra.s      $0006940C
[000693fa] 206f 0120                 movea.l    288(a7),a0
[000693fe] 3028 020e                 move.w     526(a0),d0
[00069402] 226f 0120                 movea.l    288(a7),a1
[00069406] d2c0                      adda.w     d0,a1
[00069408] 43e9 0100                 lea.l      256(a1),a1
[0006940c] 206f 0120                 movea.l    288(a7),a0
[00069410] 41e8 0100                 lea.l      256(a0),a0
[00069414] 6100 fe82                 bsr        boxed_validate
[00069418] 2f40 000e                 move.l     d0,14(a7)
[0006941c] 202f 0112                 move.l     274(a7),d0
[00069420] 6752                      beq.s      $00069474
[00069422] 202f 0116                 move.l     278(a7),d0
[00069426] 6706                      beq.s      $0006942E
[00069428] 226f 0116                 movea.l    278(a7),a1
[0006942c] 6012                      bra.s      $00069440
[0006942e] 206f 0120                 movea.l    288(a7),a0
[00069432] 3028 020e                 move.w     526(a0),d0
[00069436] 226f 0120                 movea.l    288(a7),a1
[0006943a] d2c0                      adda.w     d0,a1
[0006943c] 43e9 0100                 lea.l      256(a1),a1
[00069440] 206f 0112                 movea.l    274(a7),a0
[00069444] 5248                      addq.w     #1,a0
[00069446] 6100 fe50                 bsr        boxed_validate
[0006944a] 2f40 000a                 move.l     d0,10(a7)
[0006944e] 202f 0116                 move.l     278(a7),d0
[00069452] 6720                      beq.s      $00069474
[00069454] 206f 0120                 movea.l    288(a7),a0
[00069458] 3028 020e                 move.w     526(a0),d0
[0006945c] 226f 0120                 movea.l    288(a7),a1
[00069460] d2c0                      adda.w     d0,a1
[00069462] 43e9 0100                 lea.l      256(a1),a1
[00069466] 206f 0116                 movea.l    278(a7),a0
[0006946a] 5248                      addq.w     #1,a0
[0006946c] 6100 fe2a                 bsr        boxed_validate
[00069470] 2f40 0006                 move.l     d0,6(a7)
[00069474] 206f 011c                 movea.l    284(a7),a0
[00069478] 3010                      move.w     (a0),d0
[0006947a] e648                      lsr.w      #3,d0
[0006947c] c07c 001f                 and.w      #$001F,d0
[00069480] 907c 0014                 sub.w      #$0014,d0
[00069484] b07c 0006                 cmp.w      #$0006,d0
[00069488] 6200 0174                 bhi        $000695FE
[0006948c] d040                      add.w      d0,d0
[0006948e] 303b 0006                 move.w     $00069496(pc,d0.w),d0
[00069492] 4efb 0002                 jmp        $00069496(pc,d0.w)
J56:
[00069496] 000e                      dc.w $000e   ; $000694a4-$00069496
[00069498] 000e                      dc.w $000e   ; $000694a4-$00069496
[0006949a] 000e                      dc.w $000e   ; $000694a4-$00069496
[0006949c] 000e                      dc.w $000e   ; $000694a4-$00069496
[0006949e] 0148                      dc.w $0148   ; $000695de-$00069496
[000694a0] 0128                      dc.w $0128   ; $000695be-$00069496
[000694a2] 0138                      dc.w $0138   ; $000695ce-$00069496
[000694a4] 206f 011c                 movea.l    284(a7),a0
[000694a8] 3010                      move.w     (a0),d0
[000694aa] e648                      lsr.w      #3,d0
[000694ac] c07c 001f                 and.w      #$001F,d0
[000694b0] b07c 0016                 cmp.w      #$0016,d0
[000694b4] 6712                      beq.s      $000694C8
[000694b6] 206f 011c                 movea.l    284(a7),a0
[000694ba] 3010                      move.w     (a0),d0
[000694bc] e648                      lsr.w      #3,d0
[000694be] c07c 001f                 and.w      #$001F,d0
[000694c2] b07c 0017                 cmp.w      #$0017,d0
[000694c6] 6612                      bne.s      $000694DA
[000694c8] 2f6f 000e 0002            move.l     14(a7),2(a7)
[000694ce] 2f6f 000a 000e            move.l     10(a7),14(a7)
[000694d4] 2f6f 0002 000a            move.l     2(a7),10(a7)
[000694da] 700c                      moveq.l    #12,d0
[000694dc] b0af 000a                 cmp.l      10(a7),d0
[000694e0] 6c08                      bge.s      $000694EA
[000694e2] 2f7c 0000 000c 000a       move.l     #$0000000C,10(a7)
[000694ea] 202f 000a                 move.l     10(a7),d0
[000694ee] 6f00 007e                 ble.w      $0006956E
[000694f2] 202f 0006                 move.l     6(a7),d0
[000694f6] 6b00 0076                 bmi.w      $0006956E
[000694fa] 7002                      moveq.l    #2,d0
[000694fc] b0af 000a                 cmp.l      10(a7),d0
[00069500] 663e                      bne.s      $00069540
[00069502] 202f 0006                 move.l     6(a7),d0
[00069506] 223c 0000 0190            move.l     #$00000190,d1
[0006950c] 4eb9 0008 3d6a            jsr        _lmod
[00069512] 4a80                      tst.l      d0
[00069514] 6720                      beq.s      $00069536
[00069516] 202f 0006                 move.l     6(a7),d0
[0006951a] 7204                      moveq.l    #4,d1
[0006951c] 4eb9 0008 3d6a            jsr        _lmod
[00069522] 4a80                      tst.l      d0
[00069524] 6614                      bne.s      $0006953A
[00069526] 202f 0006                 move.l     6(a7),d0
[0006952a] 7264                      moveq.l    #100,d1
[0006952c] 4eb9 0008 3d6a            jsr        _lmod
[00069532] 4a80                      tst.l      d0
[00069534] 6704                      beq.s      $0006953A
[00069536] 701d                      moveq.l    #29,d0
[00069538] 6002                      bra.s      $0006953C
[0006953a] 701c                      moveq.l    #28,d0
[0006953c] 3e80                      move.w     d0,(a7)
[0006953e] 602c                      bra.s      $0006956C
[00069540] 7007                      moveq.l    #7,d0
[00069542] b0af 000a                 cmp.l      10(a7),d0
[00069546] 6c08                      bge.s      $00069550
[00069548] 70f9                      moveq.l    #-7,d0
[0006954a] d06f 000c                 add.w      12(a7),d0
[0006954e] 6004                      bra.s      $00069554
[00069550] 302f 000c                 move.w     12(a7),d0
[00069554] 3e80                      move.w     d0,(a7)
[00069556] 3017                      move.w     (a7),d0
[00069558] 48c0                      ext.l      d0
[0006955a] 81fc 0002                 divs.w     #$0002,d0
[0006955e] 4840                      swap       d0
[00069560] 4a40                      tst.w      d0
[00069562] 6604                      bne.s      $00069568
[00069564] 701e                      moveq.l    #30,d0
[00069566] 6002                      bra.s      $0006956A
[00069568] 701f                      moveq.l    #31,d0
[0006956a] 3e80                      move.w     d0,(a7)
[0006956c] 6004                      bra.s      $00069572
[0006956e] 3ebc 001f                 move.w     #$001F,(a7)
[00069572] 3017                      move.w     (a7),d0
[00069574] 48c0                      ext.l      d0
[00069576] 222f 000e                 move.l     14(a7),d1
[0006957a] b280                      cmp.l      d0,d1
[0006957c] 6f08                      ble.s      $00069586
[0006957e] 3017                      move.w     (a7),d0
[00069580] 48c0                      ext.l      d0
[00069582] 2f40 000e                 move.l     d0,14(a7)
[00069586] 206f 011c                 movea.l    284(a7),a0
[0006958a] 3010                      move.w     (a0),d0
[0006958c] e648                      lsr.w      #3,d0
[0006958e] c07c 001f                 and.w      #$001F,d0
[00069592] b07c 0016                 cmp.w      #$0016,d0
[00069596] 6712                      beq.s      $000695AA
[00069598] 206f 011c                 movea.l    284(a7),a0
[0006959c] 3010                      move.w     (a0),d0
[0006959e] e648                      lsr.w      #3,d0
[000695a0] c07c 001f                 and.w      #$001F,d0
[000695a4] b07c 0017                 cmp.w      #$0017,d0
[000695a8] 6612                      bne.s      $000695BC
[000695aa] 2f6f 000e 0002            move.l     14(a7),2(a7)
[000695b0] 2f6f 000a 000e            move.l     10(a7),14(a7)
[000695b6] 2f6f 0002 000a            move.l     2(a7),10(a7)
[000695bc] 6040                      bra.s      $000695FE
[000695be] 700c                      moveq.l    #12,d0
[000695c0] b0af 000e                 cmp.l      14(a7),d0
[000695c4] 6c08                      bge.s      $000695CE
[000695c6] 2f7c 0000 000c 000e       move.l     #$0000000C,14(a7)
[000695ce] 7017                      moveq.l    #23,d0
[000695d0] b0af 000e                 cmp.l      14(a7),d0
[000695d4] 6c08                      bge.s      $000695DE
[000695d6] 2f7c 0000 0017 000e       move.l     #$00000017,14(a7)
[000695de] 703b                      moveq.l    #59,d0
[000695e0] b0af 000a                 cmp.l      10(a7),d0
[000695e4] 6c08                      bge.s      $000695EE
[000695e6] 2f7c 0000 003b 000a       move.l     #$0000003B,10(a7)
[000695ee] 703b                      moveq.l    #59,d0
[000695f0] b0af 0006                 cmp.l      6(a7),d0
[000695f4] 6c08                      bge.s      $000695FE
[000695f6] 2f7c 0000 003b 0006       move.l     #$0000003B,6(a7)
[000695fe] 206f 011c                 movea.l    284(a7),a0
[00069602] 3010                      move.w     (a0),d0
[00069604] e648                      lsr.w      #3,d0
[00069606] c07c 001f                 and.w      #$001F,d0
[0006960a] b07c 0014                 cmp.w      #$0014,d0
[0006960e] 6500 0134                 bcs        $00069744
[00069612] 206f 011c                 movea.l    284(a7),a0
[00069616] 3010                      move.w     (a0),d0
[00069618] e648                      lsr.w      #3,d0
[0006961a] c07c 001f                 and.w      #$001F,d0
[0006961e] b07c 001a                 cmp.w      #$001A,d0
[00069622] 6200 0120                 bhi        $00069744
[00069626] 4257                      clr.w      (a7)
[00069628] 202f 000e                 move.l     14(a7),d0
[0006962c] 6b18                      bmi.s      $00069646
[0006962e] 2f2f 000e                 move.l     14(a7),-(a7)
[00069632] 43f9 000e 1fb7            lea.l      $000E1FB7,a1
[00069638] 41ef 0016                 lea.l      22(a7),a0
[0006963c] 4eb9 0008 15ac            jsr        sprintf
[00069642] 584f                      addq.w     #4,a7
[00069644] 3e80                      move.w     d0,(a7)
[00069646] 202f 0112                 move.l     274(a7),d0
[0006964a] 6720                      beq.s      $0006966C
[0006964c] 4240                      clr.w      d0
[0006964e] 102f 011a                 move.b     282(a7),d0
[00069652] 3f00                      move.w     d0,-(a7)
[00069654] 43f9 000e 1fbb            lea.l      $000E1FBB,a1
[0006965a] 302f 0002                 move.w     2(a7),d0
[0006965e] 41f7 0014                 lea.l      20(a7,d0.w),a0
[00069662] 4eb9 0008 15ac            jsr        sprintf
[00069668] 544f                      addq.w     #2,a7
[0006966a] d157                      add.w      d0,(a7)
[0006966c] 202f 000a                 move.l     10(a7),d0
[00069670] 6b1c                      bmi.s      $0006968E
[00069672] 2f2f 000a                 move.l     10(a7),-(a7)
[00069676] 43f9 000e 1fbe            lea.l      $000E1FBE,a1
[0006967c] 302f 0004                 move.w     4(a7),d0
[00069680] 41f7 0016                 lea.l      22(a7,d0.w),a0
[00069684] 4eb9 0008 15ac            jsr        sprintf
[0006968a] 584f                      addq.w     #4,a7
[0006968c] d157                      add.w      d0,(a7)
[0006968e] 202f 0116                 move.l     278(a7),d0
[00069692] 6720                      beq.s      $000696B4
[00069694] 4240                      clr.w      d0
[00069696] 102f 011a                 move.b     282(a7),d0
[0006969a] 3f00                      move.w     d0,-(a7)
[0006969c] 43f9 000e 1fc2            lea.l      $000E1FC2,a1
[000696a2] 302f 0002                 move.w     2(a7),d0
[000696a6] 41f7 0014                 lea.l      20(a7,d0.w),a0
[000696aa] 4eb9 0008 15ac            jsr        sprintf
[000696b0] 544f                      addq.w     #2,a7
[000696b2] d157                      add.w      d0,(a7)
[000696b4] 202f 0006                 move.l     6(a7),d0
[000696b8] 6b1c                      bmi.s      $000696D6
[000696ba] 2f2f 0006                 move.l     6(a7),-(a7)
[000696be] 43f9 000e 1fc5            lea.l      $000E1FC5,a1
[000696c4] 302f 0004                 move.w     4(a7),d0
[000696c8] 41f7 0016                 lea.l      22(a7,d0.w),a0
[000696cc] 4eb9 0008 15ac            jsr        sprintf
[000696d2] 584f                      addq.w     #4,a7
[000696d4] d157                      add.w      d0,(a7)
[000696d6] 3017                      move.w     (a7),d0
[000696d8] 6f6a                      ble.s      $00069744
[000696da] 206f 0120                 movea.l    288(a7),a0
[000696de] 3028 020e                 move.w     526(a0),d0
[000696e2] 9057                      sub.w      (a7),d0
[000696e4] 3e80                      move.w     d0,(a7)
[000696e6] 3017                      move.w     (a7),d0
[000696e8] 206f 0120                 movea.l    288(a7),a0
[000696ec] 9168 020e                 sub.w      d0,526(a0)
[000696f0] 206f 0120                 movea.l    288(a7),a0
[000696f4] 2028 0210                 move.l     528(a0),d0
[000696f8] 670c                      beq.s      $00069706
[000696fa] 3017                      move.w     (a7),d0
[000696fc] 206f 0120                 movea.l    288(a7),a0
[00069700] 2068 0210                 movea.l    528(a0),a0
[00069704] 9150                      sub.w      d0,(a0)
[00069706] 206f 0120                 movea.l    288(a7),a0
[0006970a] 2028 0214                 move.l     532(a0),d0
[0006970e] 6722                      beq.s      $00069732
[00069710] 3017                      move.w     (a7),d0
[00069712] 206f 0120                 movea.l    288(a7),a0
[00069716] 2068 0214                 movea.l    532(a0),a0
[0006971a] 9150                      sub.w      d0,(a0)
[0006971c] 206f 0120                 movea.l    288(a7),a0
[00069720] 2068 0214                 movea.l    532(a0),a0
[00069724] 3010                      move.w     (a0),d0
[00069726] 6a0a                      bpl.s      $00069732
[00069728] 206f 0120                 movea.l    288(a7),a0
[0006972c] 2068 0214                 movea.l    532(a0),a0
[00069730] 4250                      clr.w      (a0)
[00069732] 43ef 0012                 lea.l      18(a7),a1
[00069736] 206f 0120                 movea.l    288(a7),a0
[0006973a] 41e8 0100                 lea.l      256(a0),a0
[0006973e] 4eb9 0008 2f0c            jsr        strcpy
[00069744] 4fef 012c                 lea.l      300(a7),a7
[00069748] 4e75                      rts
boxed_delsel:
[0006974a] 2f0a                      move.l     a2,-(a7)
[0006974c] 4fef ffec                 lea.l      -20(a7),a7
[00069750] 2f48 0010                 move.l     a0,16(a7)
[00069754] 3f40 000e                 move.w     d0,14(a7)
[00069758] 3f41 000c                 move.w     d1,12(a7)
[0006975c] 206f 0010                 movea.l    16(a7),a0
[00069760] 2068 000c                 movea.l    12(a0),a0
[00069764] 2f68 0010 0008            move.l     16(a0),8(a7)
[0006976a] 302f 000c                 move.w     12(a7),d0
[0006976e] 6f00 00bc                 ble        $0006982C
[00069772] 206f 0008                 movea.l    8(a7),a0
[00069776] 3028 020e                 move.w     526(a0),d0
[0006977a] 6f00 00b0                 ble        $0006982C
[0006977e] 302f 000e                 move.w     14(a7),d0
[00069782] 6b00 00a8                 bmi        $0006982C
[00069786] 302f 000e                 move.w     14(a7),d0
[0006978a] d06f 000c                 add.w      12(a7),d0
[0006978e] 206f 0008                 movea.l    8(a7),a0
[00069792] b068 020e                 cmp.w      526(a0),d0
[00069796] 6e00 0094                 bgt        $0006982C
[0006979a] 302f 000e                 move.w     14(a7),d0
[0006979e] 206f 0008                 movea.l    8(a7),a0
[000697a2] d0c0                      adda.w     d0,a0
[000697a4] 41e8 0100                 lea.l      256(a0),a0
[000697a8] 2f48 0004                 move.l     a0,4(a7)
[000697ac] 302f 000c                 move.w     12(a7),d0
[000697b0] 226f 0004                 movea.l    4(a7),a1
[000697b4] d2c0                      adda.w     d0,a1
[000697b6] 206f 0004                 movea.l    4(a7),a0
[000697ba] 4eb9 0008 2f0c            jsr        strcpy
[000697c0] 302f 000c                 move.w     12(a7),d0
[000697c4] 206f 0008                 movea.l    8(a7),a0
[000697c8] 9168 020e                 sub.w      d0,526(a0)
[000697cc] 206f 0008                 movea.l    8(a7),a0
[000697d0] 2028 0214                 move.l     532(a0),d0
[000697d4] 670a                      beq.s      $000697E0
[000697d6] 206f 0008                 movea.l    8(a7),a0
[000697da] 2068 0214                 movea.l    532(a0),a0
[000697de] 4250                      clr.w      (a0)
[000697e0] 206f 0008                 movea.l    8(a7),a0
[000697e4] 2028 0214                 move.l     532(a0),d0
[000697e8] 670c                      beq.s      $000697F6
[000697ea] 206f 0008                 movea.l    8(a7),a0
[000697ee] 2068 0210                 movea.l    528(a0),a0
[000697f2] 30af 000e                 move.w     14(a7),(a0)
[000697f6] 206f 0008                 movea.l    8(a7),a0
[000697fa] 0068 0004 0222            ori.w      #$0004,546(a0)
[00069800] 226f 0008                 movea.l    8(a7),a1
[00069804] 43e9 0100                 lea.l      256(a1),a1
[00069808] 206f 0008                 movea.l    8(a7),a0
[0006980c] 4eb9 0008 2f0c            jsr        strcpy
[00069812] 206f 0008                 movea.l    8(a7),a0
[00069816] 2ea8 0204                 move.l     516(a0),(a7)
[0006981a] 2017                      move.l     (a7),d0
[0006981c] 670e                      beq.s      $0006982C
[0006981e] 93c9                      suba.l     a1,a1
[00069820] 701a                      moveq.l    #26,d0
[00069822] 2057                      movea.l    (a7),a0
[00069824] 2457                      movea.l    (a7),a2
[00069826] 246a 0004                 movea.l    4(a2),a2
[0006982a] 4e92                      jsr        (a2)
[0006982c] 4fef 0014                 lea.l      20(a7),a7
[00069830] 245f                      movea.l    (a7)+,a2
[00069832] 4e75                      rts
boxed_viewpos:
[00069834] 4fef ffe6                 lea.l      -26(a7),a7
[00069838] 2f48 0016                 move.l     a0,22(a7)
[0006983c] 3f40 0014                 move.w     d0,20(a7)
[00069840] 206f 0016                 movea.l    22(a7),a0
[00069844] 2068 000c                 movea.l    12(a0),a0
[00069848] 2f68 0010 0008            move.l     16(a0),8(a7)
[0006984e] 206f 0008                 movea.l    8(a7),a0
[00069852] 3f68 021c 0010            move.w     540(a0),16(a7)
[00069858] 206f 0008                 movea.l    8(a7),a0
[0006985c] 2ea8 0204                 move.l     516(a0),(a7)
[00069860] 206f 0008                 movea.l    8(a7),a0
[00069864] 3028 020c                 move.w     524(a0),d0
[00069868] c07c 1000                 and.w      #$1000,d0
[0006986c] 670a                      beq.s      $00069878
[0006986e] 2057                      movea.l    (a7),a0
[00069870] 2f68 0018 0004            move.l     24(a0),4(a7)
[00069876] 6008                      bra.s      $00069880
[00069878] 2057                      movea.l    (a7),a0
[0006987a] 2f68 0014 0004            move.l     20(a0),4(a7)
[00069880] 206f 0008                 movea.l    8(a7),a0
[00069884] 3228 020c                 move.w     524(a0),d1
[00069888] c27c 0fff                 and.w      #$0FFF,d1
[0006988c] 48c1                      ext.l      d1
[0006988e] 2001                      move.l     d1,d0
[00069890] d080                      add.l      d0,d0
[00069892] d081                      add.l      d1,d0
[00069894] e788                      lsl.l      #3,d0
[00069896] 206f 0004                 movea.l    4(a7),a0
[0006989a] 3030 0814                 move.w     20(a0,d0.l),d0
[0006989e] 48c0                      ext.l      d0
[000698a0] 206f 0008                 movea.l    8(a7),a0
[000698a4] 81e8 021e                 divs.w     542(a0),d0
[000698a8] 3f40 000e                 move.w     d0,14(a7)
[000698ac] 3f6f 0014 000c            move.w     20(a7),12(a7)
[000698b2] 302f 000c                 move.w     12(a7),d0
[000698b6] 6a0c                      bpl.s      $000698C4
[000698b8] 206f 0008                 movea.l    8(a7),a0
[000698bc] 2068 0210                 movea.l    528(a0),a0
[000698c0] 3f50 000c                 move.w     (a0),12(a7)
[000698c4] 206f 0008                 movea.l    8(a7),a0
[000698c8] 302f 000c                 move.w     12(a7),d0
[000698cc] b068 020e                 cmp.w      526(a0),d0
[000698d0] 6f0a                      ble.s      $000698DC
[000698d2] 206f 0008                 movea.l    8(a7),a0
[000698d6] 3f68 020e 000c            move.w     526(a0),12(a7)
[000698dc] 302f 000c                 move.w     12(a7),d0
[000698e0] 6f18                      ble.s      $000698FA
[000698e2] 70ff                      moveq.l    #-1,d0
[000698e4] d06f 000c                 add.w      12(a7),d0
[000698e8] b06f 0010                 cmp.w      16(a7),d0
[000698ec] 6c0c                      bge.s      $000698FA
[000698ee] 70ff                      moveq.l    #-1,d0
[000698f0] d06f 000c                 add.w      12(a7),d0
[000698f4] 3f40 0010                 move.w     d0,16(a7)
[000698f8] 602a                      bra.s      $00069924
[000698fa] 302f 000c                 move.w     12(a7),d0
[000698fe] 906f 0010                 sub.w      16(a7),d0
[00069902] 906f 000e                 sub.w      14(a7),d0
[00069906] 5240                      addq.w     #1,d0
[00069908] 3f40 0012                 move.w     d0,18(a7)
[0006990c] 302f 0012                 move.w     18(a7),d0
[00069910] 6e0a                      bgt.s      $0006991C
[00069912] 302f 000c                 move.w     12(a7),d0
[00069916] b06f 0010                 cmp.w      16(a7),d0
[0006991a] 6c08                      bge.s      $00069924
[0006991c] 302f 0012                 move.w     18(a7),d0
[00069920] d16f 0010                 add.w      d0,16(a7)
[00069924] 302f 0010                 move.w     16(a7),d0
[00069928] d06f 000e                 add.w      14(a7),d0
[0006992c] 206f 0008                 movea.l    8(a7),a0
[00069930] 9068 020e                 sub.w      526(a0),d0
[00069934] 3f40 0012                 move.w     d0,18(a7)
[00069938] 302f 0012                 move.w     18(a7),d0
[0006993c] 6f08                      ble.s      $00069946
[0006993e] 302f 0012                 move.w     18(a7),d0
[00069942] 916f 0010                 sub.w      d0,16(a7)
[00069946] 302f 0010                 move.w     16(a7),d0
[0006994a] 6a04                      bpl.s      $00069950
[0006994c] 426f 0010                 clr.w      16(a7)
[00069950] 206f 0008                 movea.l    8(a7),a0
[00069954] 3028 021c                 move.w     540(a0),d0
[00069958] b06f 0010                 cmp.w      16(a7),d0
[0006995c] 670a                      beq.s      $00069968
[0006995e] 206f 0008                 movea.l    8(a7),a0
[00069962] 0068 0004 0222            ori.w      #$0004,546(a0)
[00069968] 206f 0008                 movea.l    8(a7),a0
[0006996c] 316f 0010 021c            move.w     16(a7),540(a0)
[00069972] 4fef 001a                 lea.l      26(a7),a7
[00069976] 4e75                      rts
boxed_charlist:
[00069978] 4fef ffec                 lea.l      -20(a7),a7
[0006997c] 2f48 0010                 move.l     a0,16(a7)
[00069980] 41f9 000e 1efa            lea.l      $000E1EFA,a0
[00069986] 43ef 0002                 lea.l      2(a7),a1
[0006998a] 12d8                      move.b     (a0)+,(a1)+
[0006998c] 12d8                      move.b     (a0)+,(a1)+
[0006998e] 41f9 000e 1efc            lea.l      $000E1EFC,a0
[00069994] 43d7                      lea.l      (a7),a1
[00069996] 12d8                      move.b     (a0)+,(a1)+
[00069998] 12d8                      move.b     (a0)+,(a1)+
[0006999a] 203c 0000 1818            move.l     #$00001818,d0
[000699a0] 4eb9 0004 c608            jsr        Ax_malloc
[000699a6] 2f48 000c                 move.l     a0,12(a7)
[000699aa] 2f48 0008                 move.l     a0,8(a7)
[000699ae] 202f 000c                 move.l     12(a7),d0
[000699b2] 6604                      bne.s      $000699B8
[000699b4] 6000 0192                 bra        $00069B48
[000699b8] 7018                      moveq.l    #24,d0
[000699ba] 43f9 000e 1dca            lea.l      CHARLIST,a1
[000699c0] 206f 0008                 movea.l    8(a7),a0
[000699c4] 4eb9 0008 3500            jsr        memcpy
[000699ca] 206f 0008                 movea.l    8(a7),a0
[000699ce] 317c 0001 0002            move.w     #$0001,2(a0)
[000699d4] 206f 0008                 movea.l    8(a7),a0
[000699d8] 317c 0100 0004            move.w     #$0100,4(a0)
[000699de] 06af 0000 0018 0008       addi.l     #$00000018,8(a7)
[000699e6] 426f 0006                 clr.w      6(a7)
[000699ea] 6000 00c0                 bra        $00069AAC
[000699ee] 7018                      moveq.l    #24,d0
[000699f0] 43f9 000e 1de2            lea.l      CHARENTRY,a1
[000699f6] 206f 0008                 movea.l    8(a7),a0
[000699fa] 4eb9 0008 3500            jsr        memcpy
[00069a00] 206f 0008                 movea.l    8(a7),a0
[00069a04] 4240                      clr.w      d0
[00069a06] 102f 0007                 move.b     7(a7),d0
[00069a0a] 0268 00ff 000c            andi.w     #$00FF,12(a0)
[00069a10] c07c 00ff                 and.w      #$00FF,d0
[00069a14] e148                      lsl.w      #8,d0
[00069a16] 8168 000c                 or.w       d0,12(a0)
[00069a1a] 7002                      moveq.l    #2,d0
[00069a1c] d06f 0006                 add.w      6(a7),d0
[00069a20] 206f 0008                 movea.l    8(a7),a0
[00069a24] 3080                      move.w     d0,(a0)
[00069a26] 302f 0006                 move.w     6(a7),d0
[00069a2a] 48c0                      ext.l      d0
[00069a2c] 81fc 0010                 divs.w     #$0010,d0
[00069a30] 4840                      swap       d0
[00069a32] d040                      add.w      d0,d0
[00069a34] 206f 0008                 movea.l    8(a7),a0
[00069a38] 3140 0010                 move.w     d0,16(a0)
[00069a3c] 302f 0006                 move.w     6(a7),d0
[00069a40] 48c0                      ext.l      d0
[00069a42] 81fc 0010                 divs.w     #$0010,d0
[00069a46] 206f 0008                 movea.l    8(a7),a0
[00069a4a] 3140 0012                 move.w     d0,18(a0)
[00069a4e] 1f6f 0007 0002            move.b     7(a7),2(a7)
[00069a54] 3f7c 0001 0004            move.w     #$0001,4(a7)
[00069a5a] 486f 0004                 pea.l      4(a7)
[00069a5e] 486f 0004                 pea.l      4(a7)
[00069a62] 43ef 000a                 lea.l      10(a7),a1
[00069a66] 206f 0018                 movea.l    24(a7),a0
[00069a6a] 6100 f092                 bsr        boxed_checktext
[00069a6e] 504f                      addq.w     #8,a7
[00069a70] 4a40                      tst.w      d0
[00069a72] 6708                      beq.s      $00069A7C
[00069a74] 1017                      move.b     (a7),d0
[00069a76] b02f 0007                 cmp.b      7(a7),d0
[00069a7a] 6724                      beq.s      $00069AA0
[00069a7c] 206f 0008                 movea.l    8(a7),a0
[00069a80] 0068 0008 000a            ori.w      #$0008,10(a0)
[00069a86] 206f 0008                 movea.l    8(a7),a0
[00069a8a] 0268 f0ff 000e            andi.w     #$F0FF,14(a0)
[00069a90] 206f 0008                 movea.l    8(a7),a0
[00069a94] 0268 fff0 000e            andi.w     #$FFF0,14(a0)
[00069a9a] 0068 0008 000e            ori.w      #$0008,14(a0)
[00069aa0] 06af 0000 0018 0008       addi.l     #$00000018,8(a7)
[00069aa8] 526f 0006                 addq.w     #1,6(a7)
[00069aac] 0c6f 0100 0006            cmpi.w     #$0100,6(a7)
[00069ab2] 6d00 ff3a                 blt        $000699EE
[00069ab6] 04af 0000 0018 0008       subi.l     #$00000018,8(a7)
[00069abe] 206f 0008                 movea.l    8(a7),a0
[00069ac2] 0068 0020 0008            ori.w      #$0020,8(a0)
[00069ac8] 206f 0008                 movea.l    8(a7),a0
[00069acc] 4250                      clr.w      (a0)
[00069ace] 206f 000c                 movea.l    12(a7),a0
[00069ad2] 4eb9 0004 fbdc            jsr        Aob_fix
[00069ad8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069ade] 3228 0264                 move.w     612(a0),d1
[00069ae2] 206f 000c                 movea.l    12(a7),a0
[00069ae6] 3028 0016                 move.w     22(a0),d0
[00069aea] e240                      asr.w      #1,d0
[00069aec] 9240                      sub.w      d0,d1
[00069aee] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069af4] 3028 0262                 move.w     610(a0),d0
[00069af8] 206f 000c                 movea.l    12(a7),a0
[00069afc] 3428 0014                 move.w     20(a0),d2
[00069b00] e242                      asr.w      #1,d2
[00069b02] 9042                      sub.w      d2,d0
[00069b04] 226f 000c                 movea.l    12(a7),a1
[00069b08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069b0e] 2068 0258                 movea.l    600(a0),a0
[00069b12] 4eb9 0004 e84a            jsr        Ame_popup
[00069b18] 3f40 0004                 move.w     d0,4(a7)
[00069b1c] 0c6f 0001 0004            cmpi.w     #$0001,4(a7)
[00069b22] 6f1a                      ble.s      $00069B3E
[00069b24] 102f 0005                 move.b     5(a7),d0
[00069b28] d03c 00ff                 add.b      #$FF,d0
[00069b2c] 1f40 0002                 move.b     d0,2(a7)
[00069b30] 4240                      clr.w      d0
[00069b32] 43ef 0002                 lea.l      2(a7),a1
[00069b36] 206f 0010                 movea.l    16(a7),a0
[00069b3a] 6100 ec7a                 bsr        boxed_insert
[00069b3e] 206f 000c                 movea.l    12(a7),a0
[00069b42] 4eb9 0004 c7c8            jsr        Ax_free
[00069b48] 4fef 0014                 lea.l      20(a7),a7
[00069b4c] 4e75                      rts
Aus_boxed:
[00069b4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069b54] 3028 0260                 move.w     608(a0),d0
[00069b58] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069b5e] 2268 025c                 movea.l    604(a0),a1
[00069b62] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069b68] 2068 0258                 movea.l    600(a0),a0
[00069b6c] 4eb9 0006 9b74            jsr        Aus_objboxed
[00069b72] 4e75                      rts
Aus_objboxed:
[00069b74] 2f0a                      move.l     a2,-(a7)
[00069b76] 4fef ff94                 lea.l      -108(a7),a7
[00069b7a] 2f48 0068                 move.l     a0,104(a7)
[00069b7e] 2f49 0064                 move.l     a1,100(a7)
[00069b82] 3f40 0062                 move.w     d0,98(a7)
[00069b86] 3f7c 0006 0006            move.w     #$0006,6(a7)
[00069b8c] 3f7c 0064 0004            move.w     #$0064,4(a7)
[00069b92] 3ebc 0002                 move.w     #$0002,(a7)
[00069b96] 322f 0062                 move.w     98(a7),d1
[00069b9a] c27c 0fff                 and.w      #$0FFF,d1
[00069b9e] 48c1                      ext.l      d1
[00069ba0] 2001                      move.l     d1,d0
[00069ba2] d080                      add.l      d0,d0
[00069ba4] d081                      add.l      d1,d0
[00069ba6] e788                      lsl.l      #3,d0
[00069ba8] 206f 0064                 movea.l    100(a7),a0
[00069bac] d1c0                      adda.l     d0,a0
[00069bae] 2f48 005a                 move.l     a0,90(a7)
[00069bb2] 206f 005a                 movea.l    90(a7),a0
[00069bb6] 2f68 000c 0052            move.l     12(a0),82(a7)
[00069bbc] 206f 0052                 movea.l    82(a7),a0
[00069bc0] 2f68 0010 0056            move.l     16(a0),86(a7)
[00069bc6] 206f 005a                 movea.l    90(a7),a0
[00069bca] 0c28 0018 0007            cmpi.b     #$18,7(a0)
[00069bd0] 6616                      bne.s      $00069BE8
[00069bd2] 202f 0052                 move.l     82(a7),d0
[00069bd6] 6710                      beq.s      $00069BE8
[00069bd8] 206f 0052                 movea.l    82(a7),a0
[00069bdc] 2028 0008                 move.l     8(a0),d0
[00069be0] 6706                      beq.s      $00069BE8
[00069be2] 202f 0056                 move.l     86(a7),d0
[00069be6] 6604                      bne.s      $00069BEC
[00069be8] 6000 0476                 bra        $0006A060
[00069bec] 42a7                      clr.l      -(a7)
[00069bee] 42a7                      clr.l      -(a7)
[00069bf0] 42a7                      clr.l      -(a7)
[00069bf2] 486f 0016                 pea.l      22(a7)
[00069bf6] 720a                      moveq.l    #10,d1
[00069bf8] 4240                      clr.w      d0
[00069bfa] 4eb9 0007 f7ba            jsr        wind_get
[00069c00] 4fef 0010                 lea.l      16(a7),a7
[00069c04] 302f 000a                 move.w     10(a7),d0
[00069c08] 4eb9 0005 5e68            jsr        Awi_wid
[00069c0e] 2f48 005e                 move.l     a0,94(a7)
[00069c12] 302f 000a                 move.w     10(a7),d0
[00069c16] 6f10                      ble.s      $00069C28
[00069c18] 202f 005e                 move.l     94(a7),d0
[00069c1c] 670a                      beq.s      $00069C28
[00069c1e] 206f 005e                 movea.l    94(a7),a0
[00069c22] b1ef 0068                 cmpa.l     104(a7),a0
[00069c26] 6712                      beq.s      $00069C3A
[00069c28] 206f 0068                 movea.l    104(a7),a0
[00069c2c] 226f 0068                 movea.l    104(a7),a1
[00069c30] 2269 006e                 movea.l    110(a1),a1
[00069c34] 4e91                      jsr        (a1)
[00069c36] 6000 0428                 bra        $0006A060
[00069c3a] 2f6f 0068 0018            move.l     104(a7),24(a7)
[00069c40] 2f6f 005a 001c            move.l     90(a7),28(a7)
[00069c46] 3f6f 0062 0020            move.w     98(a7),32(a7)
[00069c4c] 43ef 0018                 lea.l      24(a7),a1
[00069c50] 7009                      moveq.l    #9,d0
[00069c52] 206f 005a                 movea.l    90(a7),a0
[00069c56] 246f 0052                 movea.l    82(a7),a2
[00069c5a] 246a 0008                 movea.l    8(a2),a2
[00069c5e] 4e92                      jsr        (a2)
[00069c60] 206f 0068                 movea.l    104(a7),a0
[00069c64] 3028 001c                 move.w     28(a0),d0
[00069c68] 6f14                      ble.s      $00069C7E
[00069c6a] 206f 0068                 movea.l    104(a7),a0
[00069c6e] 3028 001c                 move.w     28(a0),d0
[00069c72] b06f 0062                 cmp.w      98(a7),d0
[00069c76] 6706                      beq.s      $00069C7E
[00069c78] 4eb9 0005 1388            jsr        Awi_diaend
[00069c7e] 206f 0068                 movea.l    104(a7),a0
[00069c82] 316f 0062 001c            move.w     98(a7),28(a0)
[00069c88] 4eb9 0005 147c            jsr        Awi_diastart
[00069c8e] 206f 0068                 movea.l    104(a7),a0
[00069c92] 3028 001c                 move.w     28(a0),d0
[00069c96] 6a04                      bpl.s      $00069C9C
[00069c98] 6000 03c6                 bra        $0006A060
[00069c9c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069ca2] 2068 023c                 movea.l    572(a0),a0
[00069ca6] 41e8 0050                 lea.l      80(a0),a0
[00069caa] 4eb9 0004 ee3c            jsr        Amo_new
[00069cb0] 7230                      moveq.l    #48,d1
[00069cb2] 4240                      clr.w      d0
[00069cb4] 41ef 0022                 lea.l      34(a7),a0
[00069cb8] 4eb9 0008 36ea            jsr        memset
[00069cbe] 302f 0062                 move.w     98(a7),d0
[00069cc2] c07c 0fff                 and.w      #$0FFF,d0
[00069cc6] 226f 0064                 movea.l    100(a7),a1
[00069cca] 41ef 0032                 lea.l      50(a7),a0
[00069cce] 4eb9 0004 fe06            jsr        Aob_offset
[00069cd4] 206f 0068                 movea.l    104(a7),a0
[00069cd8] 3028 0034                 move.w     52(a0),d0
[00069cdc] d16f 0032                 add.w      d0,50(a7)
[00069ce0] 206f 0068                 movea.l    104(a7),a0
[00069ce4] 3028 0036                 move.w     54(a0),d0
[00069ce8] d16f 0034                 add.w      d0,52(a7)
[00069cec] 426f 0016                 clr.w      22(a7)
[00069cf0] 602c                      bra.s      $00069D1E
[00069cf2] 302f 0016                 move.w     22(a7),d0
[00069cf6] e748                      lsl.w      #3,d0
[00069cf8] 4277 0024                 clr.w      36(a7,d0.w)
[00069cfc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069d02] 3028 000a                 move.w     10(a0),d0
[00069d06] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069d0c] d068 000e                 add.w      14(a0),d0
[00069d10] 322f 0016                 move.w     22(a7),d1
[00069d14] e749                      lsl.w      #3,d1
[00069d16] 3f80 1028                 move.w     d0,40(a7,d1.w)
[00069d1a] 526f 0016                 addq.w     #1,22(a7)
[00069d1e] 0c6f 0006 0016            cmpi.w     #$0006,22(a7)
[00069d24] 6dcc                      blt.s      $00069CF2
[00069d26] 3f6f 0032 0010            move.w     50(a7),16(a7)
[00069d2c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069d32] 3028 0012                 move.w     18(a0),d0
[00069d36] d040                      add.w      d0,d0
[00069d38] 322f 0036                 move.w     54(a7),d1
[00069d3c] b240                      cmp.w      d0,d1
[00069d3e] 6f1e                      ble.s      $00069D5E
[00069d40] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069d46] 3028 0012                 move.w     18(a0),d0
[00069d4a] d16f 0032                 add.w      d0,50(a7)
[00069d4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069d54] 3028 0012                 move.w     18(a0),d0
[00069d58] d040                      add.w      d0,d0
[00069d5a] 916f 0036                 sub.w      d0,54(a7)
[00069d5e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069d64] 3028 0012                 move.w     18(a0),d0
[00069d68] d040                      add.w      d0,d0
[00069d6a] 3f40 003e                 move.w     d0,62(a7)
[00069d6e] 3f40 002e                 move.w     d0,46(a7)
[00069d72] 302f 0032                 move.w     50(a7),d0
[00069d76] 906f 002e                 sub.w      46(a7),d0
[00069d7a] 3f40 002a                 move.w     d0,42(a7)
[00069d7e] 3f40 0026                 move.w     d0,38(a7)
[00069d82] 302f 0032                 move.w     50(a7),d0
[00069d86] d06f 0036                 add.w      54(a7),d0
[00069d8a] 3f40 003a                 move.w     d0,58(a7)
[00069d8e] 302f 003a                 move.w     58(a7),d0
[00069d92] d06f 003e                 add.w      62(a7),d0
[00069d96] 3f40 0042                 move.w     d0,66(a7)
[00069d9a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069da0] 3028 000c                 move.w     12(a0),d0
[00069da4] 906f 0042                 sub.w      66(a7),d0
[00069da8] 3f40 0046                 move.w     d0,70(a7)
[00069dac] 206f 0056                 movea.l    86(a7),a0
[00069db0] 3f68 021e 004e            move.w     542(a0),78(a7)
[00069db6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00069dbc] 3f68 0262 000e            move.w     610(a0),14(a7)
[00069dc2] 302f 000e                 move.w     14(a7),d0
[00069dc6] 906f 0010                 sub.w      16(a7),d0
[00069dca] 48c0                      ext.l      d0
[00069dcc] 206f 0056                 movea.l    86(a7),a0
[00069dd0] 81e8 021e                 divs.w     542(a0),d0
[00069dd4] 206f 0056                 movea.l    86(a7),a0
[00069dd8] d068 021c                 add.w      540(a0),d0
[00069ddc] 3f40 0014                 move.w     d0,20(a7)
[00069de0] 3f40 0012                 move.w     d0,18(a7)
[00069de4] 43ef 0012                 lea.l      18(a7),a1
[00069de8] 7011                      moveq.l    #17,d0
[00069dea] 206f 005a                 movea.l    90(a7),a0
[00069dee] 246f 0052                 movea.l    82(a7),a2
[00069df2] 246a 0008                 movea.l    8(a2),a2
[00069df6] 4e92                      jsr        (a2)
[00069df8] 93c9                      suba.l     a1,a1
[00069dfa] 7005                      moveq.l    #5,d0
[00069dfc] 206f 005a                 movea.l    90(a7),a0
[00069e00] 246f 0052                 movea.l    82(a7),a2
[00069e04] 246a 0008                 movea.l    8(a2),a2
[00069e08] 4e92                      jsr        (a2)
[00069e0a] 206f 005a                 movea.l    90(a7),a0
[00069e0e] 3028 000a                 move.w     10(a0),d0
[00069e12] c07c 4000                 and.w      #$4000,d0
[00069e16] 6738                      beq.s      $00069E50
[00069e18] 3f6f 0012 0014            move.w     18(a7),20(a7)
[00069e1e] 206f 0056                 movea.l    86(a7),a0
[00069e22] 0068 0010 0222            ori.w      #$0010,546(a0)
[00069e28] 43ef 0012                 lea.l      18(a7),a1
[00069e2c] 303c 02c2                 move.w     #$02C2,d0
[00069e30] 206f 005a                 movea.l    90(a7),a0
[00069e34] 246f 0052                 movea.l    82(a7),a2
[00069e38] 246a 0008                 movea.l    8(a2),a2
[00069e3c] 4e92                      jsr        (a2)
[00069e3e] 93c9                      suba.l     a1,a1
[00069e40] 7005                      moveq.l    #5,d0
[00069e42] 206f 005a                 movea.l    90(a7),a0
[00069e46] 246f 0052                 movea.l    82(a7),a2
[00069e4a] 246a 0008                 movea.l    8(a2),a2
[00069e4e] 4e92                      jsr        (a2)
[00069e50] 6000 01ec                 bra        $0006A03E
[00069e54] 0c57 0002                 cmpi.w     #$0002,(a7)
[00069e58] 662a                      bne.s      $00069E84
[00069e5a] 302f 000e                 move.w     14(a7),d0
[00069e5e] 906f 0010                 sub.w      16(a7),d0
[00069e62] 48c0                      ext.l      d0
[00069e64] 206f 0056                 movea.l    86(a7),a0
[00069e68] 81e8 021e                 divs.w     542(a0),d0
[00069e6c] 206f 0056                 movea.l    86(a7),a0
[00069e70] c1e8 021e                 muls.w     542(a0),d0
[00069e74] d06f 0010                 add.w      16(a7),d0
[00069e78] 3f40 004a                 move.w     d0,74(a7)
[00069e7c] 3f7c 0005 0002            move.w     #$0005,2(a7)
[00069e82] 6004                      bra.s      $00069E88
[00069e84] 3f57 0002                 move.w     (a7),2(a7)
[00069e88] 2f39 000e 692a            move.l     _globl,-(a7)
[00069e8e] 486f 001a                 pea.l      26(a7)
[00069e92] 486f 001e                 pea.l      30(a7)
[00069e96] 486f 0022                 pea.l      34(a7)
[00069e9a] 486f 0026                 pea.l      38(a7)
[00069e9e] 486f 0020                 pea.l      32(a7)
[00069ea2] 302f 001c                 move.w     28(a7),d0
[00069ea6] 48c0                      ext.l      d0
[00069ea8] 80bc 0000 0000            or.l       #$00000000,d0
[00069eae] 2f00                      move.l     d0,-(a7)
[00069eb0] 4267                      clr.w      -(a7)
[00069eb2] 4267                      clr.w      -(a7)
[00069eb4] 4267                      clr.w      -(a7)
[00069eb6] 4267                      clr.w      -(a7)
[00069eb8] 4267                      clr.w      -(a7)
[00069eba] 302f 0028                 move.w     40(a7),d0
[00069ebe] e748                      lsl.w      #3,d0
[00069ec0] 3f37 004e                 move.w     78(a7,d0.w),-(a7)
[00069ec4] 302f 002a                 move.w     42(a7),d0
[00069ec8] e748                      lsl.w      #3,d0
[00069eca] 3f37 004e                 move.w     78(a7,d0.w),-(a7)
[00069ece] 302f 002c                 move.w     44(a7),d0
[00069ed2] e748                      lsl.w      #3,d0
[00069ed4] 3f37 004e                 move.w     78(a7,d0.w),-(a7)
[00069ed8] 302f 002e                 move.w     46(a7),d0
[00069edc] e748                      lsl.w      #3,d0
[00069ede] 3f37 004e                 move.w     78(a7,d0.w),-(a7)
[00069ee2] 7001                      moveq.l    #1,d0
[00069ee4] 3f00                      move.w     d0,-(a7)
[00069ee6] 4267                      clr.w      -(a7)
[00069ee8] 43ef 0040                 lea.l      64(a7),a1
[00069eec] 91c8                      suba.l     a0,a0
[00069eee] 2479 0010 ee4e            movea.l    ACSblk,a2
[00069ef4] 342a 02ca                 move.w     714(a2),d2
[00069ef8] 7201                      moveq.l    #1,d1
[00069efa] 302f 0038                 move.w     56(a7),d0
[00069efe] 4eb9 0007 9240            jsr        mt_evnt_multi
[00069f04] 4fef 0032                 lea.l      50(a7),a7
[00069f08] 3f40 0008                 move.w     d0,8(a7)
[00069f0c] 7002                      moveq.l    #2,d0
[00069f0e] c06f 0008                 and.w      8(a7),d0
[00069f12] 6704                      beq.s      $00069F18
[00069f14] 6000 012c                 bra        $0006A042
[00069f18] 7004                      moveq.l    #4,d0
[00069f1a] c06f 0008                 and.w      8(a7),d0
[00069f1e] 6700 0074                 beq.w      $00069F94
[00069f22] 322f 000c                 move.w     12(a7),d1
[00069f26] 302f 000e                 move.w     14(a7),d0
[00069f2a] 41ef 0032                 lea.l      50(a7),a0
[00069f2e] 4eb9 0006 b7a6            jsr        Aob_within
[00069f34] 4a40                      tst.w      d0
[00069f36] 6706                      beq.s      $00069F3E
[00069f38] 3ebc 0002                 move.w     #$0002,(a7)
[00069f3c] 6056                      bra.s      $00069F94
[00069f3e] 322f 000c                 move.w     12(a7),d1
[00069f42] 302f 000e                 move.w     14(a7),d0
[00069f46] 41ef 002a                 lea.l      42(a7),a0
[00069f4a] 4eb9 0006 b7a6            jsr        Aob_within
[00069f50] 4a40                      tst.w      d0
[00069f52] 6706                      beq.s      $00069F5A
[00069f54] 3ebc 0001                 move.w     #$0001,(a7)
[00069f58] 603a                      bra.s      $00069F94
[00069f5a] 322f 000c                 move.w     12(a7),d1
[00069f5e] 302f 000e                 move.w     14(a7),d0
[00069f62] 41ef 0022                 lea.l      34(a7),a0
[00069f66] 4eb9 0006 b7a6            jsr        Aob_within
[00069f6c] 4a40                      tst.w      d0
[00069f6e] 6704                      beq.s      $00069F74
[00069f70] 4257                      clr.w      (a7)
[00069f72] 6020                      bra.s      $00069F94
[00069f74] 322f 000c                 move.w     12(a7),d1
[00069f78] 302f 000e                 move.w     14(a7),d0
[00069f7c] 41ef 003a                 lea.l      58(a7),a0
[00069f80] 4eb9 0006 b7a6            jsr        Aob_within
[00069f86] 4a40                      tst.w      d0
[00069f88] 6706                      beq.s      $00069F90
[00069f8a] 3ebc 0003                 move.w     #$0003,(a7)
[00069f8e] 6004                      bra.s      $00069F94
[00069f90] 3ebc 0004                 move.w     #$0004,(a7)
[00069f94] 006f 0020 0006            ori.w      #$0020,6(a7)
[00069f9a] 3017                      move.w     (a7),d0
[00069f9c] b07c 0004                 cmp.w      #$0004,d0
[00069fa0] 626a                      bhi.s      $0006A00C
[00069fa2] d040                      add.w      d0,d0
[00069fa4] 303b 0006                 move.w     $00069FAC(pc,d0.w),d0
[00069fa8] 4efb 0002                 jmp        $00069FAC(pc,d0.w)
J57:
[00069fac] 000a                      dc.w $000a   ; $00069fb6-$00069fac
[00069fae] 0016                      dc.w $0016   ; $00069fc2-$00069fac
[00069fb0] 0022                      dc.w $0022   ; $00069fce-$00069fac
[00069fb2] 0048                      dc.w $0048   ; $00069ff4-$00069fac
[00069fb4] 0054                      dc.w $0054   ; $0006a000-$00069fac
[00069fb6] 536f 0014                 subq.w     #1,20(a7)
[00069fba] 3f7c 001e 0004            move.w     #$001E,4(a7)
[00069fc0] 604a                      bra.s      $0006A00C
[00069fc2] 536f 0014                 subq.w     #1,20(a7)
[00069fc6] 3f7c 0064 0004            move.w     #$0064,4(a7)
[00069fcc] 603e                      bra.s      $0006A00C
[00069fce] 302f 000e                 move.w     14(a7),d0
[00069fd2] 906f 0010                 sub.w      16(a7),d0
[00069fd6] 48c0                      ext.l      d0
[00069fd8] 206f 0056                 movea.l    86(a7),a0
[00069fdc] 81e8 021e                 divs.w     542(a0),d0
[00069fe0] 206f 0056                 movea.l    86(a7),a0
[00069fe4] d068 021c                 add.w      540(a0),d0
[00069fe8] 3f40 0014                 move.w     d0,20(a7)
[00069fec] 026f ffdf 0006            andi.w     #$FFDF,6(a7)
[00069ff2] 6018                      bra.s      $0006A00C
[00069ff4] 526f 0014                 addq.w     #1,20(a7)
[00069ff8] 3f7c 0064 0004            move.w     #$0064,4(a7)
[00069ffe] 600c                      bra.s      $0006A00C
[0006a000] 526f 0014                 addq.w     #1,20(a7)
[0006a004] 3f7c 001e 0004            move.w     #$001E,4(a7)
[0006a00a] 4e71                      nop
[0006a00c] 302f 0014                 move.w     20(a7),d0
[0006a010] 6a04                      bpl.s      $0006A016
[0006a012] 426f 0014                 clr.w      20(a7)
[0006a016] 43ef 0012                 lea.l      18(a7),a1
[0006a01a] 303c 02c2                 move.w     #$02C2,d0
[0006a01e] 206f 005a                 movea.l    90(a7),a0
[0006a022] 246f 0052                 movea.l    82(a7),a2
[0006a026] 246a 0008                 movea.l    8(a2),a2
[0006a02a] 4e92                      jsr        (a2)
[0006a02c] 93c9                      suba.l     a1,a1
[0006a02e] 7005                      moveq.l    #5,d0
[0006a030] 206f 005a                 movea.l    90(a7),a0
[0006a034] 246f 0052                 movea.l    82(a7),a2
[0006a038] 246a 0008                 movea.l    8(a2),a2
[0006a03c] 4e92                      jsr        (a2)
[0006a03e] 6000 fe14                 bra        $00069E54
[0006a042] 206f 0056                 movea.l    86(a7),a0
[0006a046] 0268 ffef 0222            andi.w     #$FFEF,546(a0)
[0006a04c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006a052] 2068 023c                 movea.l    572(a0),a0
[0006a056] 41e8 0050                 lea.l      80(a0),a0
[0006a05a] 4eb9 0004 ee3c            jsr        Amo_new
[0006a060] 4fef 006c                 lea.l      108(a7),a7
[0006a064] 245f                      movea.l    (a7)+,a2
[0006a066] 4e75                      rts
Auo_boxed:
[0006a068] 2f0a                      move.l     a2,-(a7)
[0006a06a] 4fef ffb4                 lea.l      -76(a7),a7
[0006a06e] 2f48 0048                 move.l     a0,72(a7)
[0006a072] 3f40 0046                 move.w     d0,70(a7)
[0006a076] 2f49 0042                 move.l     a1,66(a7)
[0006a07a] 206f 0048                 movea.l    72(a7),a0
[0006a07e] 2f68 000c 0036            move.l     12(a0),54(a7)
[0006a084] 206f 0036                 movea.l    54(a7),a0
[0006a088] 5848                      addq.w     #4,a0
[0006a08a] 2e88                      move.l     a0,(a7)
[0006a08c] 206f 0036                 movea.l    54(a7),a0
[0006a090] 2f68 0010 003e            move.l     16(a0),62(a7)
[0006a096] 0c6f 0001 0046            cmpi.w     #$0001,70(a7)
[0006a09c] 670a                      beq.s      $0006A0A8
[0006a09e] 206f 003e                 movea.l    62(a7),a0
[0006a0a2] 2f68 0204 0032            move.l     516(a0),50(a7)
[0006a0a8] 302f 0046                 move.w     70(a7),d0
[0006a0ac] b07c 0009                 cmp.w      #$0009,d0
[0006a0b0] 6700 016a                 beq        $0006A21C
[0006a0b4] 6e20                      bgt.s      $0006A0D6
[0006a0b6] b07c 0006                 cmp.w      #$0006,d0
[0006a0ba] 6200 05ae                 bhi        $0006A66A
[0006a0be] d040                      add.w      d0,d0
[0006a0c0] 303b 0006                 move.w     $0006A0C8(pc,d0.w),d0
[0006a0c4] 4efb 0002                 jmp        $0006A0C8(pc,d0.w)
J58:
[0006a0c8] 05a2                      dc.w $05a2   ; $0006a66a-$0006a0c8
[0006a0ca] 003c                      dc.w $003c   ; $0006a104-$0006a0c8
[0006a0cc] 01dc                      dc.w $01dc   ; $0006a2a4-$0006a0c8
[0006a0ce] 023e                      dc.w $023e   ; $0006a306-$0006a0c8
[0006a0d0] 01f2                      dc.w $01f2   ; $0006a2ba-$0006a0c8
[0006a0d2] 0278                      dc.w $0278   ; $0006a340-$0006a0c8
[0006a0d4] 026e                      dc.w $026e   ; $0006a336-$0006a0c8
[0006a0d6] b07c                      dc.w $b07c   ; $00065144-$0006a0c8
[0006a0d8] 0014                      dc.w $0014   ; $0006a0dc-$0006a0c8
[0006a0da] 6700                      dc.w $6700   ; $000707c8-$0006a0c8
[0006a0dc] 01da                      bset       d0,(a2)+
[0006a0de] 6e12                      bgt.s      $0006A0F2
[0006a0e0] 907c 0012                 sub.w      #$0012,d0
[0006a0e4] 6700 018c                 beq        $0006A272
[0006a0e8] 5340                      subq.w     #1,d0
[0006a0ea] 6700 01ca                 beq        $0006A2B6
[0006a0ee] 6000 057a                 bra        $0006A66A
[0006a0f2] 907c 02c0                 sub.w      #$02C0,d0
[0006a0f6] 6700 054e                 beq        $0006A646
[0006a0fa] 5340                      subq.w     #1,d0
[0006a0fc] 6700 055a                 beq        $0006A658
[0006a100] 6000 0568                 bra        $0006A66A
[0006a104] 206f 0036                 movea.l    54(a7),a0
[0006a108] 2f68 000c 0008            move.l     12(a0),8(a7)
[0006a10e] 203c 0000 0224            move.l     #$00000224,d0
[0006a114] 4eb9 0004 c608            jsr        Ax_malloc
[0006a11a] 226f 0036                 movea.l    54(a7),a1
[0006a11e] 2348 0010                 move.l     a0,16(a1)
[0006a122] 2f48 003e                 move.l     a0,62(a7)
[0006a126] 202f 003e                 move.l     62(a7),d0
[0006a12a] 6606                      bne.s      $0006A132
[0006a12c] 4240                      clr.w      d0
[0006a12e] 6000 0eb2                 bra        $0006AFE2
[0006a132] 223c 0000 0224            move.l     #$00000224,d1
[0006a138] 4240                      clr.w      d0
[0006a13a] 206f 003e                 movea.l    62(a7),a0
[0006a13e] 4eb9 0008 36ea            jsr        memset
[0006a144] 206f 0036                 movea.l    54(a7),a0
[0006a148] 216f 003e 000c            move.l     62(a7),12(a0)
[0006a14e] 2057                      movea.l    (a7),a0
[0006a150] 3028 0002                 move.w     2(a0),d0
[0006a154] e448                      lsr.w      #2,d0
[0006a156] c07c 0001                 and.w      #$0001,d0
[0006a15a] 6750                      beq.s      $0006A1AC
[0006a15c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006a162] 3228 0294                 move.w     660(a0),d1
[0006a166] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006a16c] 3028 0010                 move.w     16(a0),d0
[0006a170] 4eb9 0007 34e6            jsr        vst_font
[0006a176] 206f 003e                 movea.l    62(a7),a0
[0006a17a] 4868 0220                 pea.l      544(a0)
[0006a17e] 206f 0042                 movea.l    66(a7),a0
[0006a182] 4868 021e                 pea.l      542(a0)
[0006a186] 43ef 001e                 lea.l      30(a7),a1
[0006a18a] 41ef 001e                 lea.l      30(a7),a0
[0006a18e] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006a194] 322a 0296                 move.w     662(a2),d1
[0006a198] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006a19e] 302a 0010                 move.w     16(a2),d0
[0006a1a2] 4eb9 0007 3370            jsr        vst_height
[0006a1a8] 504f                      addq.w     #8,a7
[0006a1aa] 604e                      bra.s      $0006A1FA
[0006a1ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006a1b2] 3228 0290                 move.w     656(a0),d1
[0006a1b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006a1bc] 3028 0010                 move.w     16(a0),d0
[0006a1c0] 4eb9 0007 34e6            jsr        vst_font
[0006a1c6] 206f 003e                 movea.l    62(a7),a0
[0006a1ca] 4868 0220                 pea.l      544(a0)
[0006a1ce] 206f 0042                 movea.l    66(a7),a0
[0006a1d2] 4868 021e                 pea.l      542(a0)
[0006a1d6] 43ef 001e                 lea.l      30(a7),a1
[0006a1da] 41ef 001e                 lea.l      30(a7),a0
[0006a1de] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006a1e4] 322a 0292                 move.w     658(a2),d1
[0006a1e8] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006a1ee] 302a 0010                 move.w     16(a2),d0
[0006a1f2] 4eb9 0007 3370            jsr        vst_height
[0006a1f8] 504f                      addq.w     #8,a7
[0006a1fa] 202f 0008                 move.l     8(a7),d0
[0006a1fe] 670e                      beq.s      $0006A20E
[0006a200] 7001                      moveq.l    #1,d0
[0006a202] 226f 0008                 movea.l    8(a7),a1
[0006a206] 206f 0048                 movea.l    72(a7),a0
[0006a20a] 6100 e5aa                 bsr        boxed_insert
[0006a20e] 206f 003e                 movea.l    62(a7),a0
[0006a212] 317c 0004 0222            move.w     #$0004,546(a0)
[0006a218] 6000 0dc6                 bra        $0006AFE0
[0006a21c] 2f6f 0042 001e            move.l     66(a7),30(a7)
[0006a222] 206f 001e                 movea.l    30(a7),a0
[0006a226] 226f 003e                 movea.l    62(a7),a1
[0006a22a] 2350 0204                 move.l     (a0),516(a1)
[0006a22e] 206f 001e                 movea.l    30(a7),a0
[0006a232] 226f 003e                 movea.l    62(a7),a1
[0006a236] 2368 0004 0208            move.l     4(a0),520(a1)
[0006a23c] 206f 001e                 movea.l    30(a7),a0
[0006a240] 226f 003e                 movea.l    62(a7),a1
[0006a244] 3368 0008 020c            move.w     8(a0),524(a1)
[0006a24a] 206f 001e                 movea.l    30(a7),a0
[0006a24e] 2050                      movea.l    (a0),a0
[0006a250] 41e8 001e                 lea.l      30(a0),a0
[0006a254] 226f 003e                 movea.l    62(a7),a1
[0006a258] 2348 0210                 move.l     a0,528(a1)
[0006a25c] 206f 001e                 movea.l    30(a7),a0
[0006a260] 2050                      movea.l    (a0),a0
[0006a262] 41e8 0052                 lea.l      82(a0),a0
[0006a266] 226f 003e                 movea.l    62(a7),a1
[0006a26a] 2348 0214                 move.l     a0,532(a1)
[0006a26e] 6000 0d70                 bra        $0006AFE0
[0006a272] 2f6f 0042 001e            move.l     66(a7),30(a7)
[0006a278] 206f 003e                 movea.l    62(a7),a0
[0006a27c] 226f 001e                 movea.l    30(a7),a1
[0006a280] 22a8 0204                 move.l     516(a0),(a1)
[0006a284] 206f 003e                 movea.l    62(a7),a0
[0006a288] 226f 001e                 movea.l    30(a7),a1
[0006a28c] 2368 0208 0004            move.l     520(a0),4(a1)
[0006a292] 206f 003e                 movea.l    62(a7),a0
[0006a296] 226f 001e                 movea.l    30(a7),a1
[0006a29a] 3368 020c 0008            move.w     524(a0),8(a1)
[0006a2a0] 6000 0d3e                 bra        $0006AFE0
[0006a2a4] 206f 0036                 movea.l    54(a7),a0
[0006a2a8] 2068 0010                 movea.l    16(a0),a0
[0006a2ac] 4eb9 0004 c7c8            jsr        Ax_free
[0006a2b2] 6000 0d2c                 bra        $0006AFE0
[0006a2b6] 6000 0d28                 bra        $0006AFE0
[0006a2ba] 202f 0032                 move.l     50(a7),d0
[0006a2be] 6714                      beq.s      $0006A2D4
[0006a2c0] 206f 003e                 movea.l    62(a7),a0
[0006a2c4] 2028 0210                 move.l     528(a0),d0
[0006a2c8] 670a                      beq.s      $0006A2D4
[0006a2ca] 206f 003e                 movea.l    62(a7),a0
[0006a2ce] 2028 0214                 move.l     532(a0),d0
[0006a2d2] 6606                      bne.s      $0006A2DA
[0006a2d4] 4240                      clr.w      d0
[0006a2d6] 6000 0d0a                 bra        $0006AFE2
[0006a2da] 206f 003e                 movea.l    62(a7),a0
[0006a2de] 2068 0210                 movea.l    528(a0),a0
[0006a2e2] 4250                      clr.w      (a0)
[0006a2e4] 206f 003e                 movea.l    62(a7),a0
[0006a2e8] 226f 003e                 movea.l    62(a7),a1
[0006a2ec] 2269 0214                 movea.l    532(a1),a1
[0006a2f0] 32a8 020e                 move.w     526(a0),(a1)
[0006a2f4] 7001                      moveq.l    #1,d0
[0006a2f6] 226f 0042                 movea.l    66(a7),a1
[0006a2fa] 206f 0048                 movea.l    72(a7),a0
[0006a2fe] 6100 e4b6                 bsr        boxed_insert
[0006a302] 6000 0cdc                 bra        $0006AFE0
[0006a306] 202f 0032                 move.l     50(a7),d0
[0006a30a] 6714                      beq.s      $0006A320
[0006a30c] 206f 003e                 movea.l    62(a7),a0
[0006a310] 2028 0210                 move.l     528(a0),d0
[0006a314] 670a                      beq.s      $0006A320
[0006a316] 206f 003e                 movea.l    62(a7),a0
[0006a31a] 2028 0214                 move.l     532(a0),d0
[0006a31e] 6606                      bne.s      $0006A326
[0006a320] 4240                      clr.w      d0
[0006a322] 6000 0cbe                 bra        $0006AFE2
[0006a326] 206f 0036                 movea.l    54(a7),a0
[0006a32a] 226f 0042                 movea.l    66(a7),a1
[0006a32e] 22a8 000c                 move.l     12(a0),(a1)
[0006a332] 6000 0cac                 bra        $0006AFE0
[0006a336] 206f 003e                 movea.l    62(a7),a0
[0006a33a] 0068 0004 0222            ori.w      #$0004,546(a0)
[0006a340] 202f 0032                 move.l     50(a7),d0
[0006a344] 6714                      beq.s      $0006A35A
[0006a346] 206f 003e                 movea.l    62(a7),a0
[0006a34a] 2028 0210                 move.l     528(a0),d0
[0006a34e] 670a                      beq.s      $0006A35A
[0006a350] 206f 003e                 movea.l    62(a7),a0
[0006a354] 2028 0214                 move.l     532(a0),d0
[0006a358] 6606                      bne.s      $0006A360
[0006a35a] 4240                      clr.w      d0
[0006a35c] 6000 0c84                 bra        $0006AFE2
[0006a360] 206f 003e                 movea.l    62(a7),a0
[0006a364] 2068 0214                 movea.l    532(a0),a0
[0006a368] 3f50 0010                 move.w     (a0),16(a7)
[0006a36c] 206f 0032                 movea.l    50(a7),a0
[0006a370] 3028 001c                 move.w     28(a0),d0
[0006a374] 206f 003e                 movea.l    62(a7),a0
[0006a378] b068 020c                 cmp.w      524(a0),d0
[0006a37c] 6638                      bne.s      $0006A3B6
[0006a37e] 302f 0010                 move.w     16(a7),d0
[0006a382] 6f32                      ble.s      $0006A3B6
[0006a384] 302f 0010                 move.w     16(a7),d0
[0006a388] 48c0                      ext.l      d0
[0006a38a] 206f 003e                 movea.l    62(a7),a0
[0006a38e] 2068 0210                 movea.l    528(a0),a0
[0006a392] 3210                      move.w     (a0),d1
[0006a394] 226f 003e                 movea.l    62(a7),a1
[0006a398] d2c1                      adda.w     d1,a1
[0006a39a] 43e9 0100                 lea.l      256(a1),a1
[0006a39e] 206f 003e                 movea.l    62(a7),a0
[0006a3a2] 4eb9 0008 3500            jsr        memcpy
[0006a3a8] 302f 0010                 move.w     16(a7),d0
[0006a3ac] 206f 003e                 movea.l    62(a7),a0
[0006a3b0] 4230 0000                 clr.b      0(a0,d0.w)
[0006a3b4] 6012                      bra.s      $0006A3C8
[0006a3b6] 226f 003e                 movea.l    62(a7),a1
[0006a3ba] 43e9 0100                 lea.l      256(a1),a1
[0006a3be] 206f 003e                 movea.l    62(a7),a0
[0006a3c2] 4eb9 0008 2f0c            jsr        strcpy
[0006a3c8] 7007                      moveq.l    #7,d0
[0006a3ca] 206f 003e                 movea.l    62(a7),a0
[0006a3ce] c068 0222                 and.w      546(a0),d0
[0006a3d2] 6700 024e                 beq        $0006A622
[0006a3d6] 206f 003e                 movea.l    62(a7),a0
[0006a3da] 3028 020c                 move.w     524(a0),d0
[0006a3de] c07c 1000                 and.w      #$1000,d0
[0006a3e2] 670c                      beq.s      $0006A3F0
[0006a3e4] 206f 0032                 movea.l    50(a7),a0
[0006a3e8] 2f68 0018 003a            move.l     24(a0),58(a7)
[0006a3ee] 600a                      bra.s      $0006A3FA
[0006a3f0] 206f 0032                 movea.l    50(a7),a0
[0006a3f4] 2f68 0014 003a            move.l     20(a0),58(a7)
[0006a3fa] 206f 0048                 movea.l    72(a7),a0
[0006a3fe] 3f68 000a 000e            move.w     10(a0),14(a7)
[0006a404] 206f 0048                 movea.l    72(a7),a0
[0006a408] 3f68 0008 000c            move.w     8(a0),12(a7)
[0006a40e] 206f 0048                 movea.l    72(a7),a0
[0006a412] 0268 ffcf 000a            andi.w     #$FFCF,10(a0)
[0006a418] 206f 0048                 movea.l    72(a7),a0
[0006a41c] 0268 bff7 0008            andi.w     #$BFF7,8(a0)
[0006a422] 206f 003e                 movea.l    62(a7),a0
[0006a426] 3028 020c                 move.w     524(a0),d0
[0006a42a] c07c 0fff                 and.w      #$0FFF,d0
[0006a42e] 226f 003a                 movea.l    58(a7),a1
[0006a432] 41ef 002a                 lea.l      42(a7),a0
[0006a436] 4eb9 0004 fe06            jsr        Aob_offset
[0006a43c] 206f 0048                 movea.l    72(a7),a0
[0006a440] 316f 000e 000a            move.w     14(a7),10(a0)
[0006a446] 206f 0048                 movea.l    72(a7),a0
[0006a44a] 316f 000c 0008            move.w     12(a7),8(a0)
[0006a450] 206f 0032                 movea.l    50(a7),a0
[0006a454] 3028 0034                 move.w     52(a0),d0
[0006a458] d16f 002a                 add.w      d0,42(a7)
[0006a45c] 206f 0032                 movea.l    50(a7),a0
[0006a460] 3028 0036                 move.w     54(a0),d0
[0006a464] d16f 002c                 add.w      d0,44(a7)
[0006a468] 3f6f 002c 0024            move.w     44(a7),36(a7)
[0006a46e] 3f6f 0030 0028            move.w     48(a7),40(a7)
[0006a474] 7007                      moveq.l    #7,d0
[0006a476] 206f 003e                 movea.l    62(a7),a0
[0006a47a] c068 0222                 and.w      546(a0),d0
[0006a47e] 5340                      subq.w     #1,d0
[0006a480] 6600 00a2                 bne        $0006A524
[0006a484] 206f 003e                 movea.l    62(a7),a0
[0006a488] 3028 0218                 move.w     536(a0),d0
[0006a48c] 206f 003e                 movea.l    62(a7),a0
[0006a490] 2068 0210                 movea.l    528(a0),a0
[0006a494] b050                      cmp.w      (a0),d0
[0006a496] 6700 0088                 beq        $0006A520
[0006a49a] 3f7c 0001 0026            move.w     #$0001,38(a7)
[0006a4a0] 206f 003e                 movea.l    62(a7),a0
[0006a4a4] 3028 0218                 move.w     536(a0),d0
[0006a4a8] 6b34                      bmi.s      $0006A4DE
[0006a4aa] 206f 003e                 movea.l    62(a7),a0
[0006a4ae] 3028 0218                 move.w     536(a0),d0
[0006a4b2] 206f 003e                 movea.l    62(a7),a0
[0006a4b6] 9068 021c                 sub.w      540(a0),d0
[0006a4ba] 206f 003e                 movea.l    62(a7),a0
[0006a4be] c1e8 021e                 muls.w     542(a0),d0
[0006a4c2] d06f 002a                 add.w      42(a7),d0
[0006a4c6] 5240                      addq.w     #1,d0
[0006a4c8] 3f40 0022                 move.w     d0,34(a7)
[0006a4cc] 43ef 0022                 lea.l      34(a7),a1
[0006a4d0] 206f 0032                 movea.l    50(a7),a0
[0006a4d4] 246f 0032                 movea.l    50(a7),a2
[0006a4d8] 246a 006a                 movea.l    106(a2),a2
[0006a4dc] 4e92                      jsr        (a2)
[0006a4de] 206f 003e                 movea.l    62(a7),a0
[0006a4e2] 2068 0210                 movea.l    528(a0),a0
[0006a4e6] 3010                      move.w     (a0),d0
[0006a4e8] 6b36                      bmi.s      $0006A520
[0006a4ea] 206f 003e                 movea.l    62(a7),a0
[0006a4ee] 2068 0210                 movea.l    528(a0),a0
[0006a4f2] 3010                      move.w     (a0),d0
[0006a4f4] 206f 003e                 movea.l    62(a7),a0
[0006a4f8] 9068 021c                 sub.w      540(a0),d0
[0006a4fc] 206f 003e                 movea.l    62(a7),a0
[0006a500] c1e8 021e                 muls.w     542(a0),d0
[0006a504] d06f 002a                 add.w      42(a7),d0
[0006a508] 5240                      addq.w     #1,d0
[0006a50a] 3f40 0022                 move.w     d0,34(a7)
[0006a50e] 43ef 0022                 lea.l      34(a7),a1
[0006a512] 206f 0032                 movea.l    50(a7),a0
[0006a516] 246f 0032                 movea.l    50(a7),a2
[0006a51a] 246a 006a                 movea.l    106(a2),a2
[0006a51e] 4e92                      jsr        (a2)
[0006a520] 6000 00f6                 bra        $0006A618
[0006a524] 7007                      moveq.l    #7,d0
[0006a526] 206f 003e                 movea.l    62(a7),a0
[0006a52a] c068 0222                 and.w      546(a0),d0
[0006a52e] 5540                      subq.w     #2,d0
[0006a530] 6600 00c6                 bne        $0006A5F8
[0006a534] 206f 003e                 movea.l    62(a7),a0
[0006a538] 3028 0218                 move.w     536(a0),d0
[0006a53c] 206f 003e                 movea.l    62(a7),a0
[0006a540] 2068 0210                 movea.l    528(a0),a0
[0006a544] b050                      cmp.w      (a0),d0
[0006a546] 6616                      bne.s      $0006A55E
[0006a548] 206f 003e                 movea.l    62(a7),a0
[0006a54c] 3028 021a                 move.w     538(a0),d0
[0006a550] 206f 003e                 movea.l    62(a7),a0
[0006a554] 2068 0214                 movea.l    532(a0),a0
[0006a558] b050                      cmp.w      (a0),d0
[0006a55a] 6700 009a                 beq        $0006A5F6
[0006a55e] 206f 003e                 movea.l    62(a7),a0
[0006a562] 2068 0210                 movea.l    528(a0),a0
[0006a566] 3010                      move.w     (a0),d0
[0006a568] 206f 003e                 movea.l    62(a7),a0
[0006a56c] b068 0218                 cmp.w      536(a0),d0
[0006a570] 6c0c                      bge.s      $0006A57E
[0006a572] 206f 003e                 movea.l    62(a7),a0
[0006a576] 2068 0210                 movea.l    528(a0),a0
[0006a57a] 3010                      move.w     (a0),d0
[0006a57c] 6008                      bra.s      $0006A586
[0006a57e] 206f 003e                 movea.l    62(a7),a0
[0006a582] 3028 0218                 move.w     536(a0),d0
[0006a586] 3f40 0014                 move.w     d0,20(a7)
[0006a58a] 206f 003e                 movea.l    62(a7),a0
[0006a58e] 2068 0214                 movea.l    532(a0),a0
[0006a592] 3010                      move.w     (a0),d0
[0006a594] 206f 003e                 movea.l    62(a7),a0
[0006a598] b068 021a                 cmp.w      538(a0),d0
[0006a59c] 6f0c                      ble.s      $0006A5AA
[0006a59e] 206f 003e                 movea.l    62(a7),a0
[0006a5a2] 2068 0214                 movea.l    532(a0),a0
[0006a5a6] 3010                      move.w     (a0),d0
[0006a5a8] 6008                      bra.s      $0006A5B2
[0006a5aa] 206f 003e                 movea.l    62(a7),a0
[0006a5ae] 3028 021a                 move.w     538(a0),d0
[0006a5b2] 3f40 0010                 move.w     d0,16(a7)
[0006a5b6] 302f 0014                 move.w     20(a7),d0
[0006a5ba] 206f 003e                 movea.l    62(a7),a0
[0006a5be] 9068 021c                 sub.w      540(a0),d0
[0006a5c2] 206f 003e                 movea.l    62(a7),a0
[0006a5c6] c1e8 021e                 muls.w     542(a0),d0
[0006a5ca] d06f 002a                 add.w      42(a7),d0
[0006a5ce] 3f40 0022                 move.w     d0,34(a7)
[0006a5d2] 302f 0010                 move.w     16(a7),d0
[0006a5d6] 206f 003e                 movea.l    62(a7),a0
[0006a5da] c1e8 021e                 muls.w     542(a0),d0
[0006a5de] 5440                      addq.w     #2,d0
[0006a5e0] 3f40 0026                 move.w     d0,38(a7)
[0006a5e4] 43ef 0022                 lea.l      34(a7),a1
[0006a5e8] 206f 0032                 movea.l    50(a7),a0
[0006a5ec] 246f 0032                 movea.l    50(a7),a2
[0006a5f0] 246a 006a                 movea.l    106(a2),a2
[0006a5f4] 4e92                      jsr        (a2)
[0006a5f6] 6020                      bra.s      $0006A618
[0006a5f8] 72ff                      moveq.l    #-1,d1
[0006a5fa] 206f 003e                 movea.l    62(a7),a0
[0006a5fe] 3028 020c                 move.w     524(a0),d0
[0006a602] 206f 003e                 movea.l    62(a7),a0
[0006a606] 2068 0204                 movea.l    516(a0),a0
[0006a60a] 226f 003e                 movea.l    62(a7),a1
[0006a60e] 2269 0204                 movea.l    516(a1),a1
[0006a612] 2269 0066                 movea.l    102(a1),a1
[0006a616] 4e91                      jsr        (a1)
[0006a618] 206f 003e                 movea.l    62(a7),a0
[0006a61c] 0268 fff8 0222            andi.w     #$FFF8,546(a0)
[0006a622] 206f 003e                 movea.l    62(a7),a0
[0006a626] 2068 0210                 movea.l    528(a0),a0
[0006a62a] 226f 003e                 movea.l    62(a7),a1
[0006a62e] 3350 0218                 move.w     (a0),536(a1)
[0006a632] 206f 003e                 movea.l    62(a7),a0
[0006a636] 2068 0214                 movea.l    532(a0),a0
[0006a63a] 226f 003e                 movea.l    62(a7),a1
[0006a63e] 3350 021a                 move.w     (a0),538(a1)
[0006a642] 6000 099c                 bra        $0006AFE0
[0006a646] 4240                      clr.w      d0
[0006a648] 226f 0042                 movea.l    66(a7),a1
[0006a64c] 206f 0048                 movea.l    72(a7),a0
[0006a650] 6100 e164                 bsr        boxed_insert
[0006a654] 6000 098a                 bra        $0006AFE0
[0006a658] 7001                      moveq.l    #1,d0
[0006a65a] 226f 0042                 movea.l    66(a7),a1
[0006a65e] 206f 0048                 movea.l    72(a7),a0
[0006a662] 6100 e152                 bsr        boxed_insert
[0006a666] 6000 0978                 bra        $0006AFE0
[0006a66a] 206f 0032                 movea.l    50(a7),a0
[0006a66e] 3028 001c                 move.w     28(a0),d0
[0006a672] 206f 003e                 movea.l    62(a7),a0
[0006a676] b068 020c                 cmp.w      524(a0),d0
[0006a67a] 6614                      bne.s      $0006A690
[0006a67c] 206f 003e                 movea.l    62(a7),a0
[0006a680] 2028 0210                 move.l     528(a0),d0
[0006a684] 670a                      beq.s      $0006A690
[0006a686] 206f 003e                 movea.l    62(a7),a0
[0006a68a] 2028 0214                 move.l     532(a0),d0
[0006a68e] 6606                      bne.s      $0006A696
[0006a690] 4240                      clr.w      d0
[0006a692] 6000 094e                 bra        $0006AFE2
[0006a696] 302f 0046                 move.w     70(a7),d0
[0006a69a] b07c 02c4                 cmp.w      #$02C4,d0
[0006a69e] 6700 071c                 beq        $0006ADBC
[0006a6a2] 6e46                      bgt.s      $0006A6EA
[0006a6a4] b07c 02bd                 cmp.w      #$02BD,d0
[0006a6a8] 6700 036c                 beq        $0006AA16
[0006a6ac] 6e1e                      bgt.s      $0006A6CC
[0006a6ae] 907c 000e                 sub.w      #$000E,d0
[0006a6b2] 675c                      beq.s      $0006A710
[0006a6b4] 5340                      subq.w     #1,d0
[0006a6b6] 6700 009c                 beq        $0006A754
[0006a6ba] 5540                      subq.w     #2,d0
[0006a6bc] 6700 00e0                 beq        $0006A79E
[0006a6c0] 907c 02ab                 sub.w      #$02AB,d0
[0006a6c4] 6700 021c                 beq        $0006A8E2
[0006a6c8] 6000 0912                 bra        $0006AFDC
[0006a6cc] 907c 02be                 sub.w      #$02BE,d0
[0006a6d0] 6700 0142                 beq        $0006A814
[0006a6d4] 5340                      subq.w     #1,d0
[0006a6d6] 6700 0280                 beq        $0006A958
[0006a6da] 5740                      subq.w     #3,d0
[0006a6dc] 6700 0392                 beq        $0006AA70
[0006a6e0] 5340                      subq.w     #1,d0
[0006a6e2] 6700 05a4                 beq        $0006AC88
[0006a6e6] 6000 08f4                 bra        $0006AFDC
[0006a6ea] 907c 02c5                 sub.w      #$02C5,d0
[0006a6ee] b07c 0007                 cmp.w      #$0007,d0
[0006a6f2] 6200 08e8                 bhi        $0006AFDC
[0006a6f6] d040                      add.w      d0,d0
[0006a6f8] 303b 0006                 move.w     $0006A700(pc,d0.w),d0
[0006a6fc] 4efb 0002                 jmp        $0006A700(pc,d0.w)
J59:
[0006a700] 05e0                      dc.w $05e0   ; $0006ace0-$0006a700
[0006a702] 05b8                      dc.w $05b8   ; $0006acb8-$0006a700
[0006a704] 0816                      dc.w $0816   ; $0006af16-$0006a700
[0006a706] 0746                      dc.w $0746   ; $0006ae46-$0006a700
[0006a708] 071e                      dc.w $071e   ; $0006ae1e-$0006a700
[0006a70a] 0874                      dc.w $0874   ; $0006af74-$0006a700
[0006a70c] 0892                      dc.w $0892   ; $0006af92-$0006a700
[0006a70e] 08d2                      dc.w $08d2   ; $0006afd2-$0006a700
[0006a710] 206f 003e                 movea.l    62(a7),a0
[0006a714] 2068 0214                 movea.l    532(a0),a0
[0006a718] 3010                      move.w     (a0),d0
[0006a71a] 6f0c                      ble.s      $0006A728
[0006a71c] 206f 003e                 movea.l    62(a7),a0
[0006a720] 0068 0004 0222            ori.w      #$0004,546(a0)
[0006a726] 600a                      bra.s      $0006A732
[0006a728] 206f 003e                 movea.l    62(a7),a0
[0006a72c] 0068 0001 0222            ori.w      #$0001,546(a0)
[0006a732] 206f 003e                 movea.l    62(a7),a0
[0006a736] 2068 0210                 movea.l    528(a0),a0
[0006a73a] 4250                      clr.w      (a0)
[0006a73c] 206f 003e                 movea.l    62(a7),a0
[0006a740] 2068 0214                 movea.l    532(a0),a0
[0006a744] 4250                      clr.w      (a0)
[0006a746] 70ff                      moveq.l    #-1,d0
[0006a748] 206f 0048                 movea.l    72(a7),a0
[0006a74c] 6100 f0e6                 bsr        boxed_viewpos
[0006a750] 6000 088e                 bra        $0006AFE0
[0006a754] 206f 003e                 movea.l    62(a7),a0
[0006a758] 2068 0214                 movea.l    532(a0),a0
[0006a75c] 3010                      move.w     (a0),d0
[0006a75e] 6f0c                      ble.s      $0006A76C
[0006a760] 206f 003e                 movea.l    62(a7),a0
[0006a764] 0068 0004 0222            ori.w      #$0004,546(a0)
[0006a76a] 600a                      bra.s      $0006A776
[0006a76c] 206f 003e                 movea.l    62(a7),a0
[0006a770] 0068 0001 0222            ori.w      #$0001,546(a0)
[0006a776] 206f 003e                 movea.l    62(a7),a0
[0006a77a] 226f 003e                 movea.l    62(a7),a1
[0006a77e] 2269 0210                 movea.l    528(a1),a1
[0006a782] 32a8 020e                 move.w     526(a0),(a1)
[0006a786] 206f 003e                 movea.l    62(a7),a0
[0006a78a] 2068 0214                 movea.l    532(a0),a0
[0006a78e] 4250                      clr.w      (a0)
[0006a790] 70ff                      moveq.l    #-1,d0
[0006a792] 206f 0048                 movea.l    72(a7),a0
[0006a796] 6100 f09c                 bsr        boxed_viewpos
[0006a79a] 6000 0844                 bra        $0006AFE0
[0006a79e] 206f 0042                 movea.l    66(a7),a0
[0006a7a2] 226f 003e                 movea.l    62(a7),a1
[0006a7a6] 2269 0210                 movea.l    528(a1),a1
[0006a7aa] 3290                      move.w     (a0),(a1)
[0006a7ac] 206f 003e                 movea.l    62(a7),a0
[0006a7b0] 2068 0214                 movea.l    532(a0),a0
[0006a7b4] 3010                      move.w     (a0),d0
[0006a7b6] 6f14                      ble.s      $0006A7CC
[0006a7b8] 206f 003e                 movea.l    62(a7),a0
[0006a7bc] 2068 0214                 movea.l    532(a0),a0
[0006a7c0] 4250                      clr.w      (a0)
[0006a7c2] 206f 003e                 movea.l    62(a7),a0
[0006a7c6] 0068 0004 0222            ori.w      #$0004,546(a0)
[0006a7cc] 206f 003e                 movea.l    62(a7),a0
[0006a7d0] 2068 0210                 movea.l    528(a0),a0
[0006a7d4] 3010                      move.w     (a0),d0
[0006a7d6] 6b14                      bmi.s      $0006A7EC
[0006a7d8] 206f 003e                 movea.l    62(a7),a0
[0006a7dc] 2068 0210                 movea.l    528(a0),a0
[0006a7e0] 3010                      move.w     (a0),d0
[0006a7e2] 206f 003e                 movea.l    62(a7),a0
[0006a7e6] b068 020e                 cmp.w      526(a0),d0
[0006a7ea] 6f10                      ble.s      $0006A7FC
[0006a7ec] 206f 003e                 movea.l    62(a7),a0
[0006a7f0] 226f 003e                 movea.l    62(a7),a1
[0006a7f4] 2269 0210                 movea.l    528(a1),a1
[0006a7f8] 32a8 020e                 move.w     526(a0),(a1)
[0006a7fc] 206f 003e                 movea.l    62(a7),a0
[0006a800] 0068 0001 0222            ori.w      #$0001,546(a0)
[0006a806] 70ff                      moveq.l    #-1,d0
[0006a808] 206f 0048                 movea.l    72(a7),a0
[0006a80c] 6100 f026                 bsr        boxed_viewpos
[0006a810] 6000 07ce                 bra        $0006AFE0
[0006a814] 206f 003e                 movea.l    62(a7),a0
[0006a818] 2068 0214                 movea.l    532(a0),a0
[0006a81c] 3010                      move.w     (a0),d0
[0006a81e] 6600 00c2                 bne        $0006A8E2
[0006a822] 206f 003e                 movea.l    62(a7),a0
[0006a826] 2068 0210                 movea.l    528(a0),a0
[0006a82a] 3010                      move.w     (a0),d0
[0006a82c] 206f 003e                 movea.l    62(a7),a0
[0006a830] b068 020e                 cmp.w      526(a0),d0
[0006a834] 6604                      bne.s      $0006A83A
[0006a836] 6000 07a8                 bra        $0006AFE0
[0006a83a] 206f 003e                 movea.l    62(a7),a0
[0006a83e] 41e8 0100                 lea.l      256(a0),a0
[0006a842] 2f48 0008                 move.l     a0,8(a7)
[0006a846] 206f 003e                 movea.l    62(a7),a0
[0006a84a] 2068 0210                 movea.l    528(a0),a0
[0006a84e] 3f50 001c                 move.w     (a0),28(a7)
[0006a852] 6004                      bra.s      $0006A858
[0006a854] 526f 001c                 addq.w     #1,28(a7)
[0006a858] 206f 003e                 movea.l    62(a7),a0
[0006a85c] 302f 001c                 move.w     28(a7),d0
[0006a860] b068 020e                 cmp.w      526(a0),d0
[0006a864] 6c22                      bge.s      $0006A888
[0006a866] 322f 001c                 move.w     28(a7),d1
[0006a86a] 206f 0008                 movea.l    8(a7),a0
[0006a86e] 1030 1000                 move.b     0(a0,d1.w),d0
[0006a872] 4880                      ext.w      d0
[0006a874] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006a87a] 41e8 03e6                 lea.l      998(a0),a0
[0006a87e] 4eb9 0008 2e8a            jsr        strchr
[0006a884] 2008                      move.l     a0,d0
[0006a886] 67cc                      beq.s      $0006A854
[0006a888] 6004                      bra.s      $0006A88E
[0006a88a] 526f 001c                 addq.w     #1,28(a7)
[0006a88e] 206f 003e                 movea.l    62(a7),a0
[0006a892] 302f 001c                 move.w     28(a7),d0
[0006a896] b068 020e                 cmp.w      526(a0),d0
[0006a89a] 6c22                      bge.s      $0006A8BE
[0006a89c] 322f 001c                 move.w     28(a7),d1
[0006a8a0] 206f 0008                 movea.l    8(a7),a0
[0006a8a4] 1030 1000                 move.b     0(a0,d1.w),d0
[0006a8a8] 4880                      ext.w      d0
[0006a8aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006a8b0] 41e8 03e6                 lea.l      998(a0),a0
[0006a8b4] 4eb9 0008 2e8a            jsr        strchr
[0006a8ba] 2008                      move.l     a0,d0
[0006a8bc] 66cc                      bne.s      $0006A88A
[0006a8be] 206f 003e                 movea.l    62(a7),a0
[0006a8c2] 2068 0210                 movea.l    528(a0),a0
[0006a8c6] 30af 001c                 move.w     28(a7),(a0)
[0006a8ca] 206f 003e                 movea.l    62(a7),a0
[0006a8ce] 0068 0001 0222            ori.w      #$0001,546(a0)
[0006a8d4] 70ff                      moveq.l    #-1,d0
[0006a8d6] 206f 0048                 movea.l    72(a7),a0
[0006a8da] 6100 ef58                 bsr        boxed_viewpos
[0006a8de] 6000 0700                 bra        $0006AFE0
[0006a8e2] 206f 003e                 movea.l    62(a7),a0
[0006a8e6] 2068 0214                 movea.l    532(a0),a0
[0006a8ea] 3010                      move.w     (a0),d0
[0006a8ec] 6f34                      ble.s      $0006A922
[0006a8ee] 206f 003e                 movea.l    62(a7),a0
[0006a8f2] 2068 0214                 movea.l    532(a0),a0
[0006a8f6] 3010                      move.w     (a0),d0
[0006a8f8] 206f 003e                 movea.l    62(a7),a0
[0006a8fc] 2068 0210                 movea.l    528(a0),a0
[0006a900] d150                      add.w      d0,(a0)
[0006a902] 206f 003e                 movea.l    62(a7),a0
[0006a906] 2068 0214                 movea.l    532(a0),a0
[0006a90a] 4250                      clr.w      (a0)
[0006a90c] 206f 003e                 movea.l    62(a7),a0
[0006a910] 0068 0004 0222            ori.w      #$0004,546(a0)
[0006a916] 70ff                      moveq.l    #-1,d0
[0006a918] 206f 0048                 movea.l    72(a7),a0
[0006a91c] 6100 ef16                 bsr        boxed_viewpos
[0006a920] 6032                      bra.s      $0006A954
[0006a922] 206f 003e                 movea.l    62(a7),a0
[0006a926] 2068 0210                 movea.l    528(a0),a0
[0006a92a] 3010                      move.w     (a0),d0
[0006a92c] 206f 003e                 movea.l    62(a7),a0
[0006a930] b068 020e                 cmp.w      526(a0),d0
[0006a934] 6c1e                      bge.s      $0006A954
[0006a936] 206f 003e                 movea.l    62(a7),a0
[0006a93a] 2068 0210                 movea.l    528(a0),a0
[0006a93e] 5250                      addq.w     #1,(a0)
[0006a940] 70ff                      moveq.l    #-1,d0
[0006a942] 206f 0048                 movea.l    72(a7),a0
[0006a946] 6100 eeec                 bsr        boxed_viewpos
[0006a94a] 206f 003e                 movea.l    62(a7),a0
[0006a94e] 0068 0001 0222            ori.w      #$0001,546(a0)
[0006a954] 6000 068a                 bra        $0006AFE0
[0006a958] 206f 003e                 movea.l    62(a7),a0
[0006a95c] 2068 0214                 movea.l    532(a0),a0
[0006a960] 3010                      move.w     (a0),d0
[0006a962] 6600 00b2                 bne        $0006AA16
[0006a966] 206f 003e                 movea.l    62(a7),a0
[0006a96a] 2068 0210                 movea.l    528(a0),a0
[0006a96e] 3010                      move.w     (a0),d0
[0006a970] 6604                      bne.s      $0006A976
[0006a972] 6000 066c                 bra        $0006AFE0
[0006a976] 206f 003e                 movea.l    62(a7),a0
[0006a97a] 41e8 0100                 lea.l      256(a0),a0
[0006a97e] 2f48 0008                 move.l     a0,8(a7)
[0006a982] 70ff                      moveq.l    #-1,d0
[0006a984] 206f 003e                 movea.l    62(a7),a0
[0006a988] 2068 0210                 movea.l    528(a0),a0
[0006a98c] d050                      add.w      (a0),d0
[0006a98e] 3f40 001c                 move.w     d0,28(a7)
[0006a992] 6004                      bra.s      $0006A998
[0006a994] 536f 001c                 subq.w     #1,28(a7)
[0006a998] 302f 001c                 move.w     28(a7),d0
[0006a99c] 6b22                      bmi.s      $0006A9C0
[0006a99e] 322f 001c                 move.w     28(a7),d1
[0006a9a2] 206f 0008                 movea.l    8(a7),a0
[0006a9a6] 1030 1000                 move.b     0(a0,d1.w),d0
[0006a9aa] 4880                      ext.w      d0
[0006a9ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006a9b2] 41e8 03e6                 lea.l      998(a0),a0
[0006a9b6] 4eb9 0008 2e8a            jsr        strchr
[0006a9bc] 2008                      move.l     a0,d0
[0006a9be] 66d4                      bne.s      $0006A994
[0006a9c0] 6004                      bra.s      $0006A9C6
[0006a9c2] 536f 001c                 subq.w     #1,28(a7)
[0006a9c6] 302f 001c                 move.w     28(a7),d0
[0006a9ca] 6b22                      bmi.s      $0006A9EE
[0006a9cc] 322f 001c                 move.w     28(a7),d1
[0006a9d0] 206f 0008                 movea.l    8(a7),a0
[0006a9d4] 1030 1000                 move.b     0(a0,d1.w),d0
[0006a9d8] 4880                      ext.w      d0
[0006a9da] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006a9e0] 41e8 03e6                 lea.l      998(a0),a0
[0006a9e4] 4eb9 0008 2e8a            jsr        strchr
[0006a9ea] 2008                      move.l     a0,d0
[0006a9ec] 67d4                      beq.s      $0006A9C2
[0006a9ee] 7001                      moveq.l    #1,d0
[0006a9f0] d06f 001c                 add.w      28(a7),d0
[0006a9f4] 206f 003e                 movea.l    62(a7),a0
[0006a9f8] 2068 0210                 movea.l    528(a0),a0
[0006a9fc] 3080                      move.w     d0,(a0)
[0006a9fe] 206f 003e                 movea.l    62(a7),a0
[0006aa02] 0068 0001 0222            ori.w      #$0001,546(a0)
[0006aa08] 70ff                      moveq.l    #-1,d0
[0006aa0a] 206f 0048                 movea.l    72(a7),a0
[0006aa0e] 6100 ee24                 bsr        boxed_viewpos
[0006aa12] 6000 05cc                 bra        $0006AFE0
[0006aa16] 206f 003e                 movea.l    62(a7),a0
[0006aa1a] 2068 0214                 movea.l    532(a0),a0
[0006aa1e] 3010                      move.w     (a0),d0
[0006aa20] 6f20                      ble.s      $0006AA42
[0006aa22] 206f 003e                 movea.l    62(a7),a0
[0006aa26] 2068 0214                 movea.l    532(a0),a0
[0006aa2a] 4250                      clr.w      (a0)
[0006aa2c] 206f 003e                 movea.l    62(a7),a0
[0006aa30] 0068 0004 0222            ori.w      #$0004,546(a0)
[0006aa36] 70ff                      moveq.l    #-1,d0
[0006aa38] 206f 0048                 movea.l    72(a7),a0
[0006aa3c] 6100 edf6                 bsr        boxed_viewpos
[0006aa40] 602a                      bra.s      $0006AA6C
[0006aa42] 206f 003e                 movea.l    62(a7),a0
[0006aa46] 2068 0210                 movea.l    528(a0),a0
[0006aa4a] 3010                      move.w     (a0),d0
[0006aa4c] 6f1e                      ble.s      $0006AA6C
[0006aa4e] 206f 003e                 movea.l    62(a7),a0
[0006aa52] 2068 0210                 movea.l    528(a0),a0
[0006aa56] 5350                      subq.w     #1,(a0)
[0006aa58] 70ff                      moveq.l    #-1,d0
[0006aa5a] 206f 0048                 movea.l    72(a7),a0
[0006aa5e] 6100 edd4                 bsr        boxed_viewpos
[0006aa62] 206f 003e                 movea.l    62(a7),a0
[0006aa66] 0068 0001 0222            ori.w      #$0001,546(a0)
[0006aa6c] 6000 0572                 bra        $0006AFE0
[0006aa70] 2f6f 0042 0018            move.l     66(a7),24(a7)
[0006aa76] 206f 0018                 movea.l    24(a7),a0
[0006aa7a] 3010                      move.w     (a0),d0
[0006aa7c] 206f 0018                 movea.l    24(a7),a0
[0006aa80] b068 0002                 cmp.w      2(a0),d0
[0006aa84] 6c14                      bge.s      $0006AA9A
[0006aa86] 206f 0018                 movea.l    24(a7),a0
[0006aa8a] 3f50 0014                 move.w     (a0),20(a7)
[0006aa8e] 206f 0018                 movea.l    24(a7),a0
[0006aa92] 3f68 0002 0012            move.w     2(a0),18(a7)
[0006aa98] 6012                      bra.s      $0006AAAC
[0006aa9a] 206f 0018                 movea.l    24(a7),a0
[0006aa9e] 3f68 0002 0014            move.w     2(a0),20(a7)
[0006aaa4] 206f 0018                 movea.l    24(a7),a0
[0006aaa8] 3f50 0012                 move.w     (a0),18(a7)
[0006aaac] 302f 0014                 move.w     20(a7),d0
[0006aab0] 6a0e                      bpl.s      $0006AAC0
[0006aab2] 206f 003e                 movea.l    62(a7),a0
[0006aab6] 3f68 020e 0012            move.w     526(a0),18(a7)
[0006aabc] 426f 0014                 clr.w      20(a7)
[0006aac0] 206f 003e                 movea.l    62(a7),a0
[0006aac4] 302f 0012                 move.w     18(a7),d0
[0006aac8] b068 020e                 cmp.w      526(a0),d0
[0006aacc] 6f0a                      ble.s      $0006AAD8
[0006aace] 206f 003e                 movea.l    62(a7),a0
[0006aad2] 3f68 020e 0012            move.w     526(a0),18(a7)
[0006aad8] 206f 003e                 movea.l    62(a7),a0
[0006aadc] 302f 0014                 move.w     20(a7),d0
[0006aae0] b068 020e                 cmp.w      526(a0),d0
[0006aae4] 6f0a                      ble.s      $0006AAF0
[0006aae6] 206f 003e                 movea.l    62(a7),a0
[0006aaea] 3f68 020e 0014            move.w     526(a0),20(a7)
[0006aaf0] 7010                      moveq.l    #16,d0
[0006aaf2] 206f 003e                 movea.l    62(a7),a0
[0006aaf6] c068 0222                 and.w      546(a0),d0
[0006aafa] 6700 012e                 beq        $0006AC2A
[0006aafe] 206f 003e                 movea.l    62(a7),a0
[0006ab02] 41e8 0100                 lea.l      256(a0),a0
[0006ab06] 2f48 0008                 move.l     a0,8(a7)
[0006ab0a] 322f 0014                 move.w     20(a7),d1
[0006ab0e] 206f 0008                 movea.l    8(a7),a0
[0006ab12] 1030 1000                 move.b     0(a0,d1.w),d0
[0006ab16] 4880                      ext.w      d0
[0006ab18] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ab1e] 41e8 03e6                 lea.l      998(a0),a0
[0006ab22] 4eb9 0008 2e8a            jsr        strchr
[0006ab28] 2f48 0004                 move.l     a0,4(a7)
[0006ab2c] 6004                      bra.s      $0006AB32
[0006ab2e] 536f 0014                 subq.w     #1,20(a7)
[0006ab32] 302f 0014                 move.w     20(a7),d0
[0006ab36] 6b5c                      bmi.s      $0006AB94
[0006ab38] 202f 0004                 move.l     4(a7),d0
[0006ab3c] 672a                      beq.s      $0006AB68
[0006ab3e] 322f 0014                 move.w     20(a7),d1
[0006ab42] 206f 0008                 movea.l    8(a7),a0
[0006ab46] 1030 1000                 move.b     0(a0,d1.w),d0
[0006ab4a] 4880                      ext.w      d0
[0006ab4c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ab52] 41e8 03e6                 lea.l      998(a0),a0
[0006ab56] 4eb9 0008 2e8a            jsr        strchr
[0006ab5c] 2008                      move.l     a0,d0
[0006ab5e] 6704                      beq.s      $0006AB64
[0006ab60] 7001                      moveq.l    #1,d0
[0006ab62] 6002                      bra.s      $0006AB66
[0006ab64] 4240                      clr.w      d0
[0006ab66] 6028                      bra.s      $0006AB90
[0006ab68] 322f 0014                 move.w     20(a7),d1
[0006ab6c] 206f 0008                 movea.l    8(a7),a0
[0006ab70] 1030 1000                 move.b     0(a0,d1.w),d0
[0006ab74] 4880                      ext.w      d0
[0006ab76] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ab7c] 41e8 03e6                 lea.l      998(a0),a0
[0006ab80] 4eb9 0008 2e8a            jsr        strchr
[0006ab86] 2008                      move.l     a0,d0
[0006ab88] 6604                      bne.s      $0006AB8E
[0006ab8a] 7001                      moveq.l    #1,d0
[0006ab8c] 6002                      bra.s      $0006AB90
[0006ab8e] 4240                      clr.w      d0
[0006ab90] 4a40                      tst.w      d0
[0006ab92] 669a                      bne.s      $0006AB2E
[0006ab94] 526f 0014                 addq.w     #1,20(a7)
[0006ab98] 322f 0012                 move.w     18(a7),d1
[0006ab9c] 206f 0008                 movea.l    8(a7),a0
[0006aba0] 1030 1000                 move.b     0(a0,d1.w),d0
[0006aba4] 4880                      ext.w      d0
[0006aba6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006abac] 41e8 03e6                 lea.l      998(a0),a0
[0006abb0] 4eb9 0008 2e8a            jsr        strchr
[0006abb6] 2f48 0004                 move.l     a0,4(a7)
[0006abba] 6004                      bra.s      $0006ABC0
[0006abbc] 526f 0012                 addq.w     #1,18(a7)
[0006abc0] 206f 003e                 movea.l    62(a7),a0
[0006abc4] 302f 0012                 move.w     18(a7),d0
[0006abc8] b068 020e                 cmp.w      526(a0),d0
[0006abcc] 6c5c                      bge.s      $0006AC2A
[0006abce] 202f 0004                 move.l     4(a7),d0
[0006abd2] 672a                      beq.s      $0006ABFE
[0006abd4] 322f 0012                 move.w     18(a7),d1
[0006abd8] 206f 0008                 movea.l    8(a7),a0
[0006abdc] 1030 1000                 move.b     0(a0,d1.w),d0
[0006abe0] 4880                      ext.w      d0
[0006abe2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006abe8] 41e8 03e6                 lea.l      998(a0),a0
[0006abec] 4eb9 0008 2e8a            jsr        strchr
[0006abf2] 2008                      move.l     a0,d0
[0006abf4] 6704                      beq.s      $0006ABFA
[0006abf6] 7001                      moveq.l    #1,d0
[0006abf8] 6002                      bra.s      $0006ABFC
[0006abfa] 4240                      clr.w      d0
[0006abfc] 6028                      bra.s      $0006AC26
[0006abfe] 322f 0012                 move.w     18(a7),d1
[0006ac02] 206f 0008                 movea.l    8(a7),a0
[0006ac06] 1030 1000                 move.b     0(a0,d1.w),d0
[0006ac0a] 4880                      ext.w      d0
[0006ac0c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ac12] 41e8 03e6                 lea.l      998(a0),a0
[0006ac16] 4eb9 0008 2e8a            jsr        strchr
[0006ac1c] 2008                      move.l     a0,d0
[0006ac1e] 6604                      bne.s      $0006AC24
[0006ac20] 7001                      moveq.l    #1,d0
[0006ac22] 6002                      bra.s      $0006AC26
[0006ac24] 4240                      clr.w      d0
[0006ac26] 4a40                      tst.w      d0
[0006ac28] 6692                      bne.s      $0006ABBC
[0006ac2a] 206f 0018                 movea.l    24(a7),a0
[0006ac2e] 3028 0002                 move.w     2(a0),d0
[0006ac32] 206f 0048                 movea.l    72(a7),a0
[0006ac36] 6100 ebfc                 bsr        boxed_viewpos
[0006ac3a] 302f 0014                 move.w     20(a7),d0
[0006ac3e] b06f 0012                 cmp.w      18(a7),d0
[0006ac42] 6618                      bne.s      $0006AC5C
[0006ac44] 206f 003e                 movea.l    62(a7),a0
[0006ac48] 2068 0210                 movea.l    528(a0),a0
[0006ac4c] 30af 0014                 move.w     20(a7),(a0)
[0006ac50] 206f 003e                 movea.l    62(a7),a0
[0006ac54] 2068 0214                 movea.l    532(a0),a0
[0006ac58] 4250                      clr.w      (a0)
[0006ac5a] 601e                      bra.s      $0006AC7A
[0006ac5c] 206f 003e                 movea.l    62(a7),a0
[0006ac60] 2068 0210                 movea.l    528(a0),a0
[0006ac64] 30af 0014                 move.w     20(a7),(a0)
[0006ac68] 302f 0012                 move.w     18(a7),d0
[0006ac6c] 906f 0014                 sub.w      20(a7),d0
[0006ac70] 206f 003e                 movea.l    62(a7),a0
[0006ac74] 2068 0214                 movea.l    532(a0),a0
[0006ac78] 3080                      move.w     d0,(a0)
[0006ac7a] 206f 003e                 movea.l    62(a7),a0
[0006ac7e] 0068 0002 0222            ori.w      #$0002,546(a0)
[0006ac84] 6000 035a                 bra        $0006AFE0
[0006ac88] 2f6f 0042 0018            move.l     66(a7),24(a7)
[0006ac8e] 206f 003e                 movea.l    62(a7),a0
[0006ac92] 2068 0210                 movea.l    528(a0),a0
[0006ac96] 226f 0018                 movea.l    24(a7),a1
[0006ac9a] 3290                      move.w     (a0),(a1)
[0006ac9c] 206f 0018                 movea.l    24(a7),a0
[0006aca0] 3010                      move.w     (a0),d0
[0006aca2] 206f 003e                 movea.l    62(a7),a0
[0006aca6] 2068 0214                 movea.l    532(a0),a0
[0006acaa] d050                      add.w      (a0),d0
[0006acac] 206f 0018                 movea.l    24(a7),a0
[0006acb0] 3140 0002                 move.w     d0,2(a0)
[0006acb4] 6000 032a                 bra        $0006AFE0
[0006acb8] 206f 003e                 movea.l    62(a7),a0
[0006acbc] 2068 0214                 movea.l    532(a0),a0
[0006acc0] 3010                      move.w     (a0),d0
[0006acc2] 661c                      bne.s      $0006ACE0
[0006acc4] 206f 003e                 movea.l    62(a7),a0
[0006acc8] 2068 0210                 movea.l    528(a0),a0
[0006accc] 226f 003e                 movea.l    62(a7),a1
[0006acd0] 2269 0214                 movea.l    532(a1),a1
[0006acd4] 3290                      move.w     (a0),(a1)
[0006acd6] 206f 003e                 movea.l    62(a7),a0
[0006acda] 2068 0210                 movea.l    528(a0),a0
[0006acde] 4250                      clr.w      (a0)
[0006ace0] 206f 003e                 movea.l    62(a7),a0
[0006ace4] 2068 0214                 movea.l    532(a0),a0
[0006ace8] 3010                      move.w     (a0),d0
[0006acea] 6600 00d0                 bne        $0006ADBC
[0006acee] 70ff                      moveq.l    #-1,d0
[0006acf0] 206f 003e                 movea.l    62(a7),a0
[0006acf4] 2068 0210                 movea.l    528(a0),a0
[0006acf8] d050                      add.w      (a0),d0
[0006acfa] 3f40 001c                 move.w     d0,28(a7)
[0006acfe] 206f 003e                 movea.l    62(a7),a0
[0006ad02] 41e8 0100                 lea.l      256(a0),a0
[0006ad06] 2f48 0008                 move.l     a0,8(a7)
[0006ad0a] 322f 001c                 move.w     28(a7),d1
[0006ad0e] 206f 0008                 movea.l    8(a7),a0
[0006ad12] 1030 1000                 move.b     0(a0,d1.w),d0
[0006ad16] 4880                      ext.w      d0
[0006ad18] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ad1e] 41e8 03e6                 lea.l      998(a0),a0
[0006ad22] 4eb9 0008 2e8a            jsr        strchr
[0006ad28] 2f48 0004                 move.l     a0,4(a7)
[0006ad2c] 6004                      bra.s      $0006AD32
[0006ad2e] 536f 001c                 subq.w     #1,28(a7)
[0006ad32] 302f 001c                 move.w     28(a7),d0
[0006ad36] 6b5c                      bmi.s      $0006AD94
[0006ad38] 202f 0004                 move.l     4(a7),d0
[0006ad3c] 672a                      beq.s      $0006AD68
[0006ad3e] 322f 001c                 move.w     28(a7),d1
[0006ad42] 206f 0008                 movea.l    8(a7),a0
[0006ad46] 1030 1000                 move.b     0(a0,d1.w),d0
[0006ad4a] 4880                      ext.w      d0
[0006ad4c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ad52] 41e8 03e6                 lea.l      998(a0),a0
[0006ad56] 4eb9 0008 2e8a            jsr        strchr
[0006ad5c] 2008                      move.l     a0,d0
[0006ad5e] 6704                      beq.s      $0006AD64
[0006ad60] 7001                      moveq.l    #1,d0
[0006ad62] 6002                      bra.s      $0006AD66
[0006ad64] 4240                      clr.w      d0
[0006ad66] 6028                      bra.s      $0006AD90
[0006ad68] 322f 001c                 move.w     28(a7),d1
[0006ad6c] 206f 0008                 movea.l    8(a7),a0
[0006ad70] 1030 1000                 move.b     0(a0,d1.w),d0
[0006ad74] 4880                      ext.w      d0
[0006ad76] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ad7c] 41e8 03e6                 lea.l      998(a0),a0
[0006ad80] 4eb9 0008 2e8a            jsr        strchr
[0006ad86] 2008                      move.l     a0,d0
[0006ad88] 6604                      bne.s      $0006AD8E
[0006ad8a] 7001                      moveq.l    #1,d0
[0006ad8c] 6002                      bra.s      $0006AD90
[0006ad8e] 4240                      clr.w      d0
[0006ad90] 4a40                      tst.w      d0
[0006ad92] 669a                      bne.s      $0006AD2E
[0006ad94] 526f 001c                 addq.w     #1,28(a7)
[0006ad98] 206f 003e                 movea.l    62(a7),a0
[0006ad9c] 2068 0210                 movea.l    528(a0),a0
[0006ada0] 3010                      move.w     (a0),d0
[0006ada2] 906f 001c                 sub.w      28(a7),d0
[0006ada6] 206f 003e                 movea.l    62(a7),a0
[0006adaa] 2068 0214                 movea.l    532(a0),a0
[0006adae] 3080                      move.w     d0,(a0)
[0006adb0] 206f 003e                 movea.l    62(a7),a0
[0006adb4] 2068 0210                 movea.l    528(a0),a0
[0006adb8] 30af 001c                 move.w     28(a7),(a0)
[0006adbc] 206f 003e                 movea.l    62(a7),a0
[0006adc0] 2068 0214                 movea.l    532(a0),a0
[0006adc4] 3010                      move.w     (a0),d0
[0006adc6] 6620                      bne.s      $0006ADE8
[0006adc8] 206f 003e                 movea.l    62(a7),a0
[0006adcc] 2068 0210                 movea.l    528(a0),a0
[0006add0] 3010                      move.w     (a0),d0
[0006add2] 6f14                      ble.s      $0006ADE8
[0006add4] 206f 003e                 movea.l    62(a7),a0
[0006add8] 2068 0214                 movea.l    532(a0),a0
[0006addc] 5250                      addq.w     #1,(a0)
[0006adde] 206f 003e                 movea.l    62(a7),a0
[0006ade2] 2068 0210                 movea.l    528(a0),a0
[0006ade6] 5350                      subq.w     #1,(a0)
[0006ade8] 206f 003e                 movea.l    62(a7),a0
[0006adec] 2068 0214                 movea.l    532(a0),a0
[0006adf0] 3010                      move.w     (a0),d0
[0006adf2] 6726                      beq.s      $0006AE1A
[0006adf4] 206f 003e                 movea.l    62(a7),a0
[0006adf8] 2068 0214                 movea.l    532(a0),a0
[0006adfc] 3210                      move.w     (a0),d1
[0006adfe] 206f 003e                 movea.l    62(a7),a0
[0006ae02] 2068 0210                 movea.l    528(a0),a0
[0006ae06] 3010                      move.w     (a0),d0
[0006ae08] 206f 0048                 movea.l    72(a7),a0
[0006ae0c] 6100 e93c                 bsr        boxed_delsel
[0006ae10] 70ff                      moveq.l    #-1,d0
[0006ae12] 206f 0048                 movea.l    72(a7),a0
[0006ae16] 6100 ea1c                 bsr        boxed_viewpos
[0006ae1a] 6000 01c4                 bra        $0006AFE0
[0006ae1e] 206f 003e                 movea.l    62(a7),a0
[0006ae22] 2068 0214                 movea.l    532(a0),a0
[0006ae26] 3010                      move.w     (a0),d0
[0006ae28] 661c                      bne.s      $0006AE46
[0006ae2a] 206f 003e                 movea.l    62(a7),a0
[0006ae2e] 3028 020e                 move.w     526(a0),d0
[0006ae32] 206f 003e                 movea.l    62(a7),a0
[0006ae36] 2068 0210                 movea.l    528(a0),a0
[0006ae3a] 9050                      sub.w      (a0),d0
[0006ae3c] 206f 003e                 movea.l    62(a7),a0
[0006ae40] 2068 0214                 movea.l    532(a0),a0
[0006ae44] 3080                      move.w     d0,(a0)
[0006ae46] 206f 003e                 movea.l    62(a7),a0
[0006ae4a] 2068 0214                 movea.l    532(a0),a0
[0006ae4e] 3010                      move.w     (a0),d0
[0006ae50] 6600 00c4                 bne        $0006AF16
[0006ae54] 206f 003e                 movea.l    62(a7),a0
[0006ae58] 2068 0210                 movea.l    528(a0),a0
[0006ae5c] 3f50 001c                 move.w     (a0),28(a7)
[0006ae60] 206f 003e                 movea.l    62(a7),a0
[0006ae64] 41e8 0100                 lea.l      256(a0),a0
[0006ae68] 2f48 0008                 move.l     a0,8(a7)
[0006ae6c] 322f 001c                 move.w     28(a7),d1
[0006ae70] 206f 0008                 movea.l    8(a7),a0
[0006ae74] 1030 1000                 move.b     0(a0,d1.w),d0
[0006ae78] 4880                      ext.w      d0
[0006ae7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ae80] 41e8 03e6                 lea.l      998(a0),a0
[0006ae84] 4eb9 0008 2e8a            jsr        strchr
[0006ae8a] 2f48 0004                 move.l     a0,4(a7)
[0006ae8e] 6004                      bra.s      $0006AE94
[0006ae90] 526f 001c                 addq.w     #1,28(a7)
[0006ae94] 206f 003e                 movea.l    62(a7),a0
[0006ae98] 302f 001c                 move.w     28(a7),d0
[0006ae9c] b068 020e                 cmp.w      526(a0),d0
[0006aea0] 6c5c                      bge.s      $0006AEFE
[0006aea2] 202f 0004                 move.l     4(a7),d0
[0006aea6] 672a                      beq.s      $0006AED2
[0006aea8] 322f 001c                 move.w     28(a7),d1
[0006aeac] 206f 0008                 movea.l    8(a7),a0
[0006aeb0] 1030 1000                 move.b     0(a0,d1.w),d0
[0006aeb4] 4880                      ext.w      d0
[0006aeb6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006aebc] 41e8 03e6                 lea.l      998(a0),a0
[0006aec0] 4eb9 0008 2e8a            jsr        strchr
[0006aec6] 2008                      move.l     a0,d0
[0006aec8] 6704                      beq.s      $0006AECE
[0006aeca] 7001                      moveq.l    #1,d0
[0006aecc] 6002                      bra.s      $0006AED0
[0006aece] 4240                      clr.w      d0
[0006aed0] 6028                      bra.s      $0006AEFA
[0006aed2] 322f 001c                 move.w     28(a7),d1
[0006aed6] 206f 0008                 movea.l    8(a7),a0
[0006aeda] 1030 1000                 move.b     0(a0,d1.w),d0
[0006aede] 4880                      ext.w      d0
[0006aee0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006aee6] 41e8 03e6                 lea.l      998(a0),a0
[0006aeea] 4eb9 0008 2e8a            jsr        strchr
[0006aef0] 2008                      move.l     a0,d0
[0006aef2] 6604                      bne.s      $0006AEF8
[0006aef4] 7001                      moveq.l    #1,d0
[0006aef6] 6002                      bra.s      $0006AEFA
[0006aef8] 4240                      clr.w      d0
[0006aefa] 4a40                      tst.w      d0
[0006aefc] 6692                      bne.s      $0006AE90
[0006aefe] 302f 001c                 move.w     28(a7),d0
[0006af02] 206f 003e                 movea.l    62(a7),a0
[0006af06] 2068 0210                 movea.l    528(a0),a0
[0006af0a] 9050                      sub.w      (a0),d0
[0006af0c] 206f 003e                 movea.l    62(a7),a0
[0006af10] 2068 0214                 movea.l    532(a0),a0
[0006af14] 3080                      move.w     d0,(a0)
[0006af16] 206f 003e                 movea.l    62(a7),a0
[0006af1a] 2068 0214                 movea.l    532(a0),a0
[0006af1e] 3010                      move.w     (a0),d0
[0006af20] 661e                      bne.s      $0006AF40
[0006af22] 206f 003e                 movea.l    62(a7),a0
[0006af26] 2068 0210                 movea.l    528(a0),a0
[0006af2a] 3010                      move.w     (a0),d0
[0006af2c] 206f 003e                 movea.l    62(a7),a0
[0006af30] b068 020e                 cmp.w      526(a0),d0
[0006af34] 6c0a                      bge.s      $0006AF40
[0006af36] 206f 003e                 movea.l    62(a7),a0
[0006af3a] 2068 0214                 movea.l    532(a0),a0
[0006af3e] 5250                      addq.w     #1,(a0)
[0006af40] 206f 003e                 movea.l    62(a7),a0
[0006af44] 2068 0214                 movea.l    532(a0),a0
[0006af48] 3010                      move.w     (a0),d0
[0006af4a] 6726                      beq.s      $0006AF72
[0006af4c] 206f 003e                 movea.l    62(a7),a0
[0006af50] 2068 0214                 movea.l    532(a0),a0
[0006af54] 3210                      move.w     (a0),d1
[0006af56] 206f 003e                 movea.l    62(a7),a0
[0006af5a] 2068 0210                 movea.l    528(a0),a0
[0006af5e] 3010                      move.w     (a0),d0
[0006af60] 206f 0048                 movea.l    72(a7),a0
[0006af64] 6100 e7e4                 bsr        boxed_delsel
[0006af68] 70ff                      moveq.l    #-1,d0
[0006af6a] 206f 0048                 movea.l    72(a7),a0
[0006af6e] 6100 e8c4                 bsr        boxed_viewpos
[0006af72] 606c                      bra.s      $0006AFE0
[0006af74] 206f 003e                 movea.l    62(a7),a0
[0006af78] 3228 020e                 move.w     526(a0),d1
[0006af7c] 4240                      clr.w      d0
[0006af7e] 206f 0048                 movea.l    72(a7),a0
[0006af82] 6100 e7c6                 bsr        boxed_delsel
[0006af86] 70ff                      moveq.l    #-1,d0
[0006af88] 206f 0048                 movea.l    72(a7),a0
[0006af8c] 6100 e8a6                 bsr        boxed_viewpos
[0006af90] 604e                      bra.s      $0006AFE0
[0006af92] 206f 003e                 movea.l    62(a7),a0
[0006af96] 2028 0200                 move.l     512(a0),d0
[0006af9a] 6716                      beq.s      $0006AFB2
[0006af9c] 206f 003e                 movea.l    62(a7),a0
[0006afa0] 2068 0200                 movea.l    512(a0),a0
[0006afa4] 4eb9 0004 649c            jsr        Ast_delete
[0006afaa] 206f 003e                 movea.l    62(a7),a0
[0006afae] 42a8 0200                 clr.l      512(a0)
[0006afb2] 2f6f 0042 0008            move.l     66(a7),8(a7)
[0006afb8] 202f 0008                 move.l     8(a7),d0
[0006afbc] 6712                      beq.s      $0006AFD0
[0006afbe] 206f 0008                 movea.l    8(a7),a0
[0006afc2] 4eb9 0004 643c            jsr        Ast_create
[0006afc8] 226f 003e                 movea.l    62(a7),a1
[0006afcc] 2348 0200                 move.l     a0,512(a1)
[0006afd0] 600e                      bra.s      $0006AFE0
[0006afd2] 206f 0048                 movea.l    72(a7),a0
[0006afd6] 6100 e9a0                 bsr        boxed_charlist
[0006afda] 6004                      bra.s      $0006AFE0
[0006afdc] 4240                      clr.w      d0
[0006afde] 6002                      bra.s      $0006AFE2
[0006afe0] 7001                      moveq.l    #1,d0
[0006afe2] 4fef 004c                 lea.l      76(a7),a7
[0006afe6] 245f                      movea.l    (a7)+,a2
[0006afe8] 4e75                      rts
A_boxed:
[0006afea] 2f02                      move.l     d2,-(a7)
[0006afec] 2f0a                      move.l     a2,-(a7)
[0006afee] 4fef fdb2                 lea.l      -590(a7),a7
[0006aff2] 42af 0206                 clr.l      518(a7)
[0006aff6] 206f 025a                 movea.l    602(a7),a0
[0006affa] 3028 0016                 move.w     22(a0),d0
[0006affe] 660a                      bne.s      $0006B00A
[0006b000] 206f 025a                 movea.l    602(a7),a0
[0006b004] 3028 0018                 move.w     24(a0),d0
[0006b008] 6750                      beq.s      $0006B05A
[0006b00a] 206f 025a                 movea.l    602(a7),a0
[0006b00e] 3f68 0012 022e            move.w     18(a0),558(a7)
[0006b014] 302f 022e                 move.w     558(a7),d0
[0006b018] 206f 025a                 movea.l    602(a7),a0
[0006b01c] d068 0016                 add.w      22(a0),d0
[0006b020] 5340                      subq.w     #1,d0
[0006b022] 3f40 0232                 move.w     d0,562(a7)
[0006b026] 206f 025a                 movea.l    602(a7),a0
[0006b02a] 3f68 0014 0230            move.w     20(a0),560(a7)
[0006b030] 302f 0230                 move.w     560(a7),d0
[0006b034] 206f 025a                 movea.l    602(a7),a0
[0006b038] d068 0018                 add.w      24(a0),d0
[0006b03c] 5340                      subq.w     #1,d0
[0006b03e] 3f40 0234                 move.w     d0,564(a7)
[0006b042] 41ef 022e                 lea.l      558(a7),a0
[0006b046] 7201                      moveq.l    #1,d1
[0006b048] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b04e] 3029 0010                 move.w     16(a1),d0
[0006b052] 4eb9 0007 2230            jsr        vs_clip
[0006b058] 6016                      bra.s      $0006B070
[0006b05a] 41ef 022e                 lea.l      558(a7),a0
[0006b05e] 4241                      clr.w      d1
[0006b060] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b066] 3029 0010                 move.w     16(a1),d0
[0006b06a] 4eb9 0007 2230            jsr        vs_clip
[0006b070] 206f 025a                 movea.l    602(a7),a0
[0006b074] 41e8 001a                 lea.l      26(a0),a0
[0006b078] 2f48 020a                 move.l     a0,522(a7)
[0006b07c] 206f 025a                 movea.l    602(a7),a0
[0006b080] 3228 0004                 move.w     4(a0),d1
[0006b084] 48c1                      ext.l      d1
[0006b086] 2001                      move.l     d1,d0
[0006b088] d080                      add.l      d0,d0
[0006b08a] d081                      add.l      d1,d0
[0006b08c] e788                      lsl.l      #3,d0
[0006b08e] 206f 025a                 movea.l    602(a7),a0
[0006b092] 2050                      movea.l    (a0),a0
[0006b094] d1c0                      adda.l     d0,a0
[0006b096] 2f48 0246                 move.l     a0,582(a7)
[0006b09a] 206f 0246                 movea.l    582(a7),a0
[0006b09e] 2f68 000c 023e            move.l     12(a0),574(a7)
[0006b0a4] 206f 023e                 movea.l    574(a7),a0
[0006b0a8] 2f68 0010 024a            move.l     16(a0),586(a7)
[0006b0ae] 206f 024a                 movea.l    586(a7),a0
[0006b0b2] 2f68 0204 0242            move.l     516(a0),578(a7)
[0006b0b8] 202f 0242                 move.l     578(a7),d0
[0006b0bc] 6728                      beq.s      $0006B0E6
[0006b0be] 206f 0242                 movea.l    578(a7),a0
[0006b0c2] 3028 001c                 move.w     28(a0),d0
[0006b0c6] 206f 024a                 movea.l    586(a7),a0
[0006b0ca] b068 020c                 cmp.w      524(a0),d0
[0006b0ce] 6616                      bne.s      $0006B0E6
[0006b0d0] 206f 0242                 movea.l    578(a7),a0
[0006b0d4] 3f68 001e 020e            move.w     30(a0),526(a7)
[0006b0da] 206f 024a                 movea.l    586(a7),a0
[0006b0de] 3f68 021c 0210            move.w     540(a0),528(a7)
[0006b0e4] 600a                      bra.s      $0006B0F0
[0006b0e6] 3f7c ffff 020e            move.w     #$FFFF,526(a7)
[0006b0ec] 426f 0210                 clr.w      528(a7)
[0006b0f0] 206f 025a                 movea.l    602(a7),a0
[0006b0f4] 3028 000e                 move.w     14(a0),d0
[0006b0f8] 48c0                      ext.l      d0
[0006b0fa] 206f 024a                 movea.l    586(a7),a0
[0006b0fe] 81e8 021e                 divs.w     542(a0),d0
[0006b102] 3f40 0226                 move.w     d0,550(a7)
[0006b106] 206f 020a                 movea.l    522(a7),a0
[0006b10a] 3028 0002                 move.w     2(a0),d0
[0006b10e] e048                      lsr.w      #8,d0
[0006b110] c07c 00ff                 and.w      #$00FF,d0
[0006b114] b06f 0226                 cmp.w      550(a7),d0
[0006b118] 6412                      bcc.s      $0006B12C
[0006b11a] 206f 020a                 movea.l    522(a7),a0
[0006b11e] 3028 0002                 move.w     2(a0),d0
[0006b122] e048                      lsr.w      #8,d0
[0006b124] c07c 00ff                 and.w      #$00FF,d0
[0006b128] 3f40 0226                 move.w     d0,550(a7)
[0006b12c] 302f 0226                 move.w     550(a7),d0
[0006b130] 206f 024a                 movea.l    586(a7),a0
[0006b134] c1e8 021e                 muls.w     542(a0),d0
[0006b138] 3f40 0228                 move.w     d0,552(a7)
[0006b13c] 70ff                      moveq.l    #-1,d0
[0006b13e] 206f 025a                 movea.l    602(a7),a0
[0006b142] d068 000a                 add.w      10(a0),d0
[0006b146] 3f40 0236                 move.w     d0,566(a7)
[0006b14a] 302f 0236                 move.w     566(a7),d0
[0006b14e] d06f 0228                 add.w      552(a7),d0
[0006b152] 5240                      addq.w     #1,d0
[0006b154] 3f40 023a                 move.w     d0,570(a7)
[0006b158] 206f 025a                 movea.l    602(a7),a0
[0006b15c] 3028 0010                 move.w     16(a0),d0
[0006b160] 206f 024a                 movea.l    586(a7),a0
[0006b164] 9068 0220                 sub.w      544(a0),d0
[0006b168] e240                      asr.w      #1,d0
[0006b16a] 206f 025a                 movea.l    602(a7),a0
[0006b16e] d068 000c                 add.w      12(a0),d0
[0006b172] 5340                      subq.w     #1,d0
[0006b174] 3f40 0238                 move.w     d0,568(a7)
[0006b178] 302f 0238                 move.w     568(a7),d0
[0006b17c] 206f 024a                 movea.l    586(a7),a0
[0006b180] d068 0220                 add.w      544(a0),d0
[0006b184] 3f40 023c                 move.w     d0,572(a7)
[0006b188] 7201                      moveq.l    #1,d1
[0006b18a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b190] 3028 0010                 move.w     16(a0),d0
[0006b194] 4eb9 0007 3070            jsr        vswr_mode
[0006b19a] 7201                      moveq.l    #1,d1
[0006b19c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b1a2] 3028 0010                 move.w     16(a0),d0
[0006b1a6] 4eb9 0007 316a            jsr        vsl_width
[0006b1ac] 4242                      clr.w      d2
[0006b1ae] 4241                      clr.w      d1
[0006b1b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b1b6] 3028 0010                 move.w     16(a0),d0
[0006b1ba] 4eb9 0007 3214            jsr        vsl_ends
[0006b1c0] 7201                      moveq.l    #1,d1
[0006b1c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b1c8] 3028 0010                 move.w     16(a0),d0
[0006b1cc] 4eb9 0007 30c4            jsr        vsl_type
[0006b1d2] 4241                      clr.w      d1
[0006b1d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b1da] 3028 0010                 move.w     16(a0),d0
[0006b1de] 4eb9 0007 358e            jsr        vst_effects
[0006b1e4] 206f 020a                 movea.l    522(a7),a0
[0006b1e8] 3028 0002                 move.w     2(a0),d0
[0006b1ec] e448                      lsr.w      #2,d0
[0006b1ee] c07c 0001                 and.w      #$0001,d0
[0006b1f2] 6748                      beq.s      $0006B23C
[0006b1f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b1fa] 3228 0294                 move.w     660(a0),d1
[0006b1fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b204] 3028 0010                 move.w     16(a0),d0
[0006b208] 4eb9 0007 34e6            jsr        vst_font
[0006b20e] 486f 022a                 pea.l      554(a7)
[0006b212] 486f 022e                 pea.l      558(a7)
[0006b216] 43ef 0232                 lea.l      562(a7),a1
[0006b21a] 41ef 0232                 lea.l      562(a7),a0
[0006b21e] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006b224] 322a 0296                 move.w     662(a2),d1
[0006b228] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006b22e] 302a 0010                 move.w     16(a2),d0
[0006b232] 4eb9 0007 3370            jsr        vst_height
[0006b238] 504f                      addq.w     #8,a7
[0006b23a] 6046                      bra.s      $0006B282
[0006b23c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b242] 3228 0290                 move.w     656(a0),d1
[0006b246] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b24c] 3028 0010                 move.w     16(a0),d0
[0006b250] 4eb9 0007 34e6            jsr        vst_font
[0006b256] 486f 022a                 pea.l      554(a7)
[0006b25a] 486f 022e                 pea.l      558(a7)
[0006b25e] 43ef 0232                 lea.l      562(a7),a1
[0006b262] 41ef 0232                 lea.l      562(a7),a0
[0006b266] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006b26c] 322a 0292                 move.w     658(a2),d1
[0006b270] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006b276] 302a 0010                 move.w     16(a2),d0
[0006b27a] 4eb9 0007 3370            jsr        vst_height
[0006b280] 504f                      addq.w     #8,a7
[0006b282] 4241                      clr.w      d1
[0006b284] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b28a] 3028 0010                 move.w     16(a0),d0
[0006b28e] 4eb9 0007 3660            jsr        vsf_interior
[0006b294] 4241                      clr.w      d1
[0006b296] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b29c] 3028 0010                 move.w     16(a0),d0
[0006b2a0] 4eb9 0007 375c            jsr        vsf_perimeter
[0006b2a6] 41ef 0236                 lea.l      566(a7),a0
[0006b2aa] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b2b0] 3029 0010                 move.w     16(a1),d0
[0006b2b4] 4eb9 0007 282e            jsr        v_bar
[0006b2ba] 7010                      moveq.l    #16,d0
[0006b2bc] 206f 0246                 movea.l    582(a7),a0
[0006b2c0] c068 000a                 and.w      10(a0),d0
[0006b2c4] 6700 010e                 beq        $0006B3D4
[0006b2c8] 206f 020a                 movea.l    522(a7),a0
[0006b2cc] 3028 0002                 move.w     2(a0),d0
[0006b2d0] e248                      lsr.w      #1,d0
[0006b2d2] c07c 0001                 and.w      #$0001,d0
[0006b2d6] 6746                      beq.s      $0006B31E
[0006b2d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b2de] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[0006b2e4] 6d38                      blt.s      $0006B31E
[0006b2e6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b2ec] 2068 023c                 movea.l    572(a0),a0
[0006b2f0] 3028 000e                 move.w     14(a0),d0
[0006b2f4] c07c 0100                 and.w      #$0100,d0
[0006b2f8] 6624                      bne.s      $0006B31E
[0006b2fa] 206f 020a                 movea.l    522(a7),a0
[0006b2fe] 3010                      move.w     (a0),d0
[0006b300] 720c                      moveq.l    #12,d1
[0006b302] e268                      lsr.w      d1,d0
[0006b304] c07c 000f                 and.w      #$000F,d0
[0006b308] 3f40 022c                 move.w     d0,556(a7)
[0006b30c] 206f 020a                 movea.l    522(a7),a0
[0006b310] 3010                      move.w     (a0),d0
[0006b312] e048                      lsr.w      #8,d0
[0006b314] c07c 000f                 and.w      #$000F,d0
[0006b318] 3f40 022a                 move.w     d0,554(a7)
[0006b31c] 600a                      bra.s      $0006B328
[0006b31e] 7001                      moveq.l    #1,d0
[0006b320] 3f40 022a                 move.w     d0,554(a7)
[0006b324] 3f40 022c                 move.w     d0,556(a7)
[0006b328] 7001                      moveq.l    #1,d0
[0006b32a] d06f 023a                 add.w      570(a7),d0
[0006b32e] 3f40 0212                 move.w     d0,530(a7)
[0006b332] 3f40 0222                 move.w     d0,546(a7)
[0006b336] 70ff                      moveq.l    #-1,d0
[0006b338] d06f 0238                 add.w      568(a7),d0
[0006b33c] 3f40 0214                 move.w     d0,532(a7)
[0006b340] 3f40 0224                 move.w     d0,548(a7)
[0006b344] 7001                      moveq.l    #1,d0
[0006b346] d06f 023a                 add.w      570(a7),d0
[0006b34a] 3f40 0216                 move.w     d0,534(a7)
[0006b34e] 7001                      moveq.l    #1,d0
[0006b350] d06f 023c                 add.w      572(a7),d0
[0006b354] 3f40 0218                 move.w     d0,536(a7)
[0006b358] 70ff                      moveq.l    #-1,d0
[0006b35a] d06f 0236                 add.w      566(a7),d0
[0006b35e] 3f40 021a                 move.w     d0,538(a7)
[0006b362] 7001                      moveq.l    #1,d0
[0006b364] d06f 023c                 add.w      572(a7),d0
[0006b368] 3f40 021c                 move.w     d0,540(a7)
[0006b36c] 70ff                      moveq.l    #-1,d0
[0006b36e] d06f 0236                 add.w      566(a7),d0
[0006b372] 3f40 021e                 move.w     d0,542(a7)
[0006b376] 70ff                      moveq.l    #-1,d0
[0006b378] d06f 0238                 add.w      568(a7),d0
[0006b37c] 3f40 0220                 move.w     d0,544(a7)
[0006b380] 322f 022c                 move.w     556(a7),d1
[0006b384] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b38a] 3028 0010                 move.w     16(a0),d0
[0006b38e] 4eb9 0007 31c0            jsr        vsl_color
[0006b394] 41ef 021a                 lea.l      538(a7),a0
[0006b398] 7203                      moveq.l    #3,d1
[0006b39a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b3a0] 3029 0010                 move.w     16(a1),d0
[0006b3a4] 4eb9 0007 22e0            jsr        v_pline
[0006b3aa] 322f 022a                 move.w     554(a7),d1
[0006b3ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b3b4] 3028 0010                 move.w     16(a0),d0
[0006b3b8] 4eb9 0007 31c0            jsr        vsl_color
[0006b3be] 41ef 0212                 lea.l      530(a7),a0
[0006b3c2] 7203                      moveq.l    #3,d1
[0006b3c4] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b3ca] 3029 0010                 move.w     16(a1),d0
[0006b3ce] 4eb9 0007 22e0            jsr        v_pline
[0006b3d4] 526f 0236                 addq.w     #1,566(a7)
[0006b3d8] 526f 0238                 addq.w     #1,568(a7)
[0006b3dc] 556f 023a                 subq.w     #2,570(a7)
[0006b3e0] 536f 023c                 subq.w     #1,572(a7)
[0006b3e4] 206f 020a                 movea.l    522(a7),a0
[0006b3e8] 3228 0002                 move.w     2(a0),d1
[0006b3ec] e849                      lsr.w      #4,d1
[0006b3ee] c27c 000f                 and.w      #$000F,d1
[0006b3f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b3f8] 3028 0010                 move.w     16(a0),d0
[0006b3fc] 4eb9 0007 353a            jsr        vst_color
[0006b402] 43ef 022a                 lea.l      554(a7),a1
[0006b406] 41ef 022a                 lea.l      554(a7),a0
[0006b40a] 7405                      moveq.l    #5,d2
[0006b40c] 4241                      clr.w      d1
[0006b40e] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006b414] 302a 0010                 move.w     16(a2),d0
[0006b418] 4eb9 0007 35e2            jsr        vst_alignment
[0006b41e] 206f 024a                 movea.l    586(a7),a0
[0006b422] 3028 020e                 move.w     526(a0),d0
[0006b426] 6700 00ba                 beq        $0006B4E2
[0006b42a] 7001                      moveq.l    #1,d0
[0006b42c] 206f 020a                 movea.l    522(a7),a0
[0006b430] c068 0002                 and.w      2(a0),d0
[0006b434] 6732                      beq.s      $0006B468
[0006b436] 41ef 0100                 lea.l      256(a7),a0
[0006b43a] 2f48 0202                 move.l     a0,514(a7)
[0006b43e] 223c 0000 00ff            move.l     #$000000FF,d1
[0006b444] 702a                      moveq.l    #42,d0
[0006b446] 41ef 0100                 lea.l      256(a7),a0
[0006b44a] 4eb9 0008 36ea            jsr        memset
[0006b450] 4200                      clr.b      d0
[0006b452] 1f40 01ff                 move.b     d0,511(a7)
[0006b456] 206f 024a                 movea.l    586(a7),a0
[0006b45a] 3228 020e                 move.w     526(a0),d1
[0006b45e] 41ef 0100                 lea.l      256(a7),a0
[0006b462] 1180 1000                 move.b     d0,0(a0,d1.w)
[0006b466] 6012                      bra.s      $0006B47A
[0006b468] 302f 0210                 move.w     528(a7),d0
[0006b46c] 206f 024a                 movea.l    586(a7),a0
[0006b470] d0c0                      adda.w     d0,a0
[0006b472] 41e8 0100                 lea.l      256(a0),a0
[0006b476] 2f48 0202                 move.l     a0,514(a7)
[0006b47a] 206f 024a                 movea.l    586(a7),a0
[0006b47e] 3028 020e                 move.w     526(a0),d0
[0006b482] 906f 0210                 sub.w      528(a7),d0
[0006b486] b06f 0226                 cmp.w      550(a7),d0
[0006b48a] 6f1c                      ble.s      $0006B4A8
[0006b48c] 302f 0226                 move.w     550(a7),d0
[0006b490] 206f 0202                 movea.l    514(a7),a0
[0006b494] d0c0                      adda.w     d0,a0
[0006b496] 2f48 0206                 move.l     a0,518(a7)
[0006b49a] 206f 0206                 movea.l    518(a7),a0
[0006b49e] 1f50 0200                 move.b     (a0),512(a7)
[0006b4a2] 206f 0206                 movea.l    518(a7),a0
[0006b4a6] 4210                      clr.b      (a0)
[0006b4a8] 226f 0202                 movea.l    514(a7),a1
[0006b4ac] 41d7                      lea.l      (a7),a0
[0006b4ae] 4eb9 0008 2f0c            jsr        strcpy
[0006b4b4] 206f 0202                 movea.l    514(a7),a0
[0006b4b8] 342f 0238                 move.w     568(a7),d2
[0006b4bc] 226f 025a                 movea.l    602(a7),a1
[0006b4c0] 3229 000a                 move.w     10(a1),d1
[0006b4c4] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b4ca] 3029 0010                 move.w     16(a1),d0
[0006b4ce] 4eb9 0007 24b0            jsr        v_gtext
[0006b4d4] 202f 0206                 move.l     518(a7),d0
[0006b4d8] 6708                      beq.s      $0006B4E2
[0006b4da] 206f 0206                 movea.l    518(a7),a0
[0006b4de] 10af 0200                 move.b     512(a7),(a0)
[0006b4e2] 302f 0226                 move.w     550(a7),d0
[0006b4e6] 206f 024a                 movea.l    586(a7),a0
[0006b4ea] 9068 020e                 sub.w      526(a0),d0
[0006b4ee] d06f 0210                 add.w      528(a7),d0
[0006b4f2] 3f40 022a                 move.w     d0,554(a7)
[0006b4f6] 302f 022a                 move.w     554(a7),d0
[0006b4fa] 6f52                      ble.s      $0006B54E
[0006b4fc] 223c 0000 00ff            move.l     #$000000FF,d1
[0006b502] 705f                      moveq.l    #95,d0
[0006b504] 41ef 0100                 lea.l      256(a7),a0
[0006b508] 4eb9 0008 36ea            jsr        memset
[0006b50e] 302f 022a                 move.w     554(a7),d0
[0006b512] 41ef 0100                 lea.l      256(a7),a0
[0006b516] 4230 0000                 clr.b      0(a0,d0.w)
[0006b51a] 41ef 0100                 lea.l      256(a7),a0
[0006b51e] 342f 0238                 move.w     568(a7),d2
[0006b522] 226f 024a                 movea.l    586(a7),a1
[0006b526] 3229 020e                 move.w     526(a1),d1
[0006b52a] 926f 0210                 sub.w      528(a7),d1
[0006b52e] 226f 024a                 movea.l    586(a7),a1
[0006b532] c3e9 021e                 muls.w     542(a1),d1
[0006b536] 226f 025a                 movea.l    602(a7),a1
[0006b53a] d269 000a                 add.w      10(a1),d1
[0006b53e] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b544] 3029 0010                 move.w     16(a1),d0
[0006b548] 4eb9 0007 24b0            jsr        v_gtext
[0006b54e] 7201                      moveq.l    #1,d1
[0006b550] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b556] 3028 0010                 move.w     16(a0),d0
[0006b55a] 4eb9 0007 31c0            jsr        vsl_color
[0006b560] 7001                      moveq.l    #1,d0
[0006b562] 206f 025a                 movea.l    602(a7),a0
[0006b566] c068 0008                 and.w      8(a0),d0
[0006b56a] 677a                      beq.s      $0006B5E6
[0006b56c] 70ff                      moveq.l    #-1,d0
[0006b56e] 206f 025a                 movea.l    602(a7),a0
[0006b572] d068 000a                 add.w      10(a0),d0
[0006b576] 3f40 0212                 move.w     d0,530(a7)
[0006b57a] 3f40 0222                 move.w     d0,546(a7)
[0006b57e] 3f40 021e                 move.w     d0,542(a7)
[0006b582] 302f 0212                 move.w     530(a7),d0
[0006b586] d06f 0228                 add.w      552(a7),d0
[0006b58a] 5240                      addq.w     #1,d0
[0006b58c] 3f40 021a                 move.w     d0,538(a7)
[0006b590] 3f40 0216                 move.w     d0,534(a7)
[0006b594] 206f 025a                 movea.l    602(a7),a0
[0006b598] 3028 0010                 move.w     16(a0),d0
[0006b59c] 206f 024a                 movea.l    586(a7),a0
[0006b5a0] 9068 0220                 sub.w      544(a0),d0
[0006b5a4] e240                      asr.w      #1,d0
[0006b5a6] 206f 025a                 movea.l    602(a7),a0
[0006b5aa] d068 000c                 add.w      12(a0),d0
[0006b5ae] 5340                      subq.w     #1,d0
[0006b5b0] 3f40 0214                 move.w     d0,532(a7)
[0006b5b4] 3f40 0224                 move.w     d0,548(a7)
[0006b5b8] 3f40 0218                 move.w     d0,536(a7)
[0006b5bc] 302f 0214                 move.w     532(a7),d0
[0006b5c0] 206f 024a                 movea.l    586(a7),a0
[0006b5c4] d068 0220                 add.w      544(a0),d0
[0006b5c8] 3f40 021c                 move.w     d0,540(a7)
[0006b5cc] 3f40 0220                 move.w     d0,544(a7)
[0006b5d0] 41ef 0212                 lea.l      530(a7),a0
[0006b5d4] 7205                      moveq.l    #5,d1
[0006b5d6] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b5dc] 3029 0010                 move.w     16(a1),d0
[0006b5e0] 4eb9 0007 22e0            jsr        v_pline
[0006b5e6] 302f 020e                 move.w     526(a7),d0
[0006b5ea] 6b00 012e                 bmi        $0006B71A
[0006b5ee] 7203                      moveq.l    #3,d1
[0006b5f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b5f6] 3028 0010                 move.w     16(a0),d0
[0006b5fa] 4eb9 0007 3070            jsr        vswr_mode
[0006b600] 206f 024a                 movea.l    586(a7),a0
[0006b604] 2068 0214                 movea.l    532(a0),a0
[0006b608] 3010                      move.w     (a0),d0
[0006b60a] 6f00 00b0                 ble        $0006B6BC
[0006b60e] 7201                      moveq.l    #1,d1
[0006b610] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b616] 3028 0010                 move.w     16(a0),d0
[0006b61a] 4eb9 0007 3660            jsr        vsf_interior
[0006b620] 7201                      moveq.l    #1,d1
[0006b622] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b628] 3028 0010                 move.w     16(a0),d0
[0006b62c] 4eb9 0007 3708            jsr        vsf_color
[0006b632] 302f 020e                 move.w     526(a7),d0
[0006b636] 906f 0210                 sub.w      528(a7),d0
[0006b63a] 206f 024a                 movea.l    586(a7),a0
[0006b63e] c1e8 021e                 muls.w     542(a0),d0
[0006b642] 206f 025a                 movea.l    602(a7),a0
[0006b646] d068 000a                 add.w      10(a0),d0
[0006b64a] 3f40 0236                 move.w     d0,566(a7)
[0006b64e] 206f 024a                 movea.l    586(a7),a0
[0006b652] 2068 0214                 movea.l    532(a0),a0
[0006b656] 3010                      move.w     (a0),d0
[0006b658] 206f 024a                 movea.l    586(a7),a0
[0006b65c] c1e8 021e                 muls.w     542(a0),d0
[0006b660] d06f 0236                 add.w      566(a7),d0
[0006b664] 5340                      subq.w     #1,d0
[0006b666] 3f40 023a                 move.w     d0,570(a7)
[0006b66a] 206f 025a                 movea.l    602(a7),a0
[0006b66e] 302f 0236                 move.w     566(a7),d0
[0006b672] b068 000a                 cmp.w      10(a0),d0
[0006b676] 6c0a                      bge.s      $0006B682
[0006b678] 206f 025a                 movea.l    602(a7),a0
[0006b67c] 3f68 000a 0236            move.w     10(a0),566(a7)
[0006b682] 206f 025a                 movea.l    602(a7),a0
[0006b686] 3028 000a                 move.w     10(a0),d0
[0006b68a] d06f 0228                 add.w      552(a7),d0
[0006b68e] 322f 023a                 move.w     570(a7),d1
[0006b692] b240                      cmp.w      d0,d1
[0006b694] 6f10                      ble.s      $0006B6A6
[0006b696] 206f 025a                 movea.l    602(a7),a0
[0006b69a] 3028 000a                 move.w     10(a0),d0
[0006b69e] d06f 0228                 add.w      552(a7),d0
[0006b6a2] 3f40 023a                 move.w     d0,570(a7)
[0006b6a6] 41ef 0236                 lea.l      566(a7),a0
[0006b6aa] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b6b0] 3029 0010                 move.w     16(a1),d0
[0006b6b4] 4eb9 0007 282e            jsr        v_bar
[0006b6ba] 605e                      bra.s      $0006B71A
[0006b6bc] 302f 020e                 move.w     526(a7),d0
[0006b6c0] 906f 0210                 sub.w      528(a7),d0
[0006b6c4] 206f 024a                 movea.l    586(a7),a0
[0006b6c8] c1e8 021e                 muls.w     542(a0),d0
[0006b6cc] 206f 025a                 movea.l    602(a7),a0
[0006b6d0] d068 000a                 add.w      10(a0),d0
[0006b6d4] 3f40 0236                 move.w     d0,566(a7)
[0006b6d8] 3f6f 0236 023a            move.w     566(a7),570(a7)
[0006b6de] 206f 025a                 movea.l    602(a7),a0
[0006b6e2] 302f 0236                 move.w     566(a7),d0
[0006b6e6] b068 000a                 cmp.w      10(a0),d0
[0006b6ea] 6d2e                      blt.s      $0006B71A
[0006b6ec] 206f 025a                 movea.l    602(a7),a0
[0006b6f0] 3028 000a                 move.w     10(a0),d0
[0006b6f4] 206f 025a                 movea.l    602(a7),a0
[0006b6f8] d068 000e                 add.w      14(a0),d0
[0006b6fc] 322f 0236                 move.w     566(a7),d1
[0006b700] b240                      cmp.w      d0,d1
[0006b702] 6e16                      bgt.s      $0006B71A
[0006b704] 41ef 0236                 lea.l      566(a7),a0
[0006b708] 7202                      moveq.l    #2,d1
[0006b70a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b710] 3029 0010                 move.w     16(a1),d0
[0006b714] 4eb9 0007 22e0            jsr        v_pline
[0006b71a] 41ef 022e                 lea.l      558(a7),a0
[0006b71e] 4241                      clr.w      d1
[0006b720] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006b726] 3029 0010                 move.w     16(a1),d0
[0006b72a] 4eb9 0007 2230            jsr        vs_clip
[0006b730] 70ee                      moveq.l    #-18,d0
[0006b732] 206f 025a                 movea.l    602(a7),a0
[0006b736] c068 0008                 and.w      8(a0),d0
[0006b73a] 4fef 024e                 lea.l      590(a7),a7
[0006b73e] 245f                      movea.l    (a7)+,a2
[0006b740] 241f                      move.l     (a7)+,d2
[0006b742] 4e75                      rts

	.data

CHARLIST:
[000e1dca]                           dc.w $ffff
[000e1dcc]                           dc.w $ffff
[000e1dce]                           dc.w $ffff
[000e1dd0]                           dc.w $0014
[000e1dd2]                           dc.w $0000
[000e1dd4]                           dc.w $0020
[000e1dd6]                           dc.w $00ff
[000e1dd8]                           dc.w $1100
[000e1dda]                           dc.w $0000
[000e1ddc]                           dc.w $0000
[000e1dde]                           dc.w $0020
[000e1de0]                           dc.w $0010
CHARENTRY:
[000e1de2]                           dc.w $ffff
[000e1de4]                           dc.w $ffff
[000e1de6]                           dc.w $ffff
[000e1de8]                           dc.w $001b
[000e1dea]                           dc.w $0005
[000e1dec]                           dc.w $0000
[000e1dee]                           dc.w $0000
[000e1df0]                           dc.w $0170
[000e1df2]                           dc.w $0000
[000e1df4]                           dc.w $0000
[000e1df6]                           dc.w $0002
[000e1df8]                           dc.w $0001
[000e1dfa]                           dc.w $0000
[000e1dfc]                           dc.w $0000
[000e1dfe]                           dc.w $0000
[000e1e00]                           dc.w $0000
[000e1e02]                           dc.w $0000
[000e1e04]                           dc.w $0000
[000e1e06]                           dc.w $0000
[000e1e08]                           dc.w $0000
[000e1e0a]                           dc.w $0000
[000e1e0c]                           dc.w $0000
[000e1e0e]                           dc.w $0000
[000e1e10]                           dc.w $0000
[000e1e12]                           dc.w $0000
[000e1e14]                           dc.w $0000
[000e1e16]                           dc.w $0000
[000e1e18]                           dc.w $0000
[000e1e1a]                           dc.w $0000
[000e1e1c]                           dc.w $0000
[000e1e1e]                           dc.w $0000
[000e1e20]                           dc.w $0000
[000e1e22]                           dc.w $0000
[000e1e24]                           dc.w $0000
[000e1e26]                           dc.w $0000
[000e1e28]                           dc.w $0000
[000e1e2a]                           dc.w $0000
[000e1e2c]                           dc.w $0000
[000e1e2e]                           dc.w $0000
[000e1e30]                           dc.w $0000
[000e1e32]                           dc.w $0000
[000e1e34]                           dc.w $0000
[000e1e36]                           dc.w $0000
[000e1e38]                           dc.w $0000
[000e1e3a]                           dc.w $0000
[000e1e3c]                           dc.w $0000
[000e1e3e]                           dc.w $0000
[000e1e40]                           dc.w $0000
[000e1e42]                           dc.w $0000
[000e1e44]                           dc.w $0000
[000e1e46]                           dc.w $0000
[000e1e48]                           dc.w $0000
[000e1e4a]                           dc.w $0000
[000e1e4c]                           dc.w $0000
[000e1e4e]                           dc.w $0000
[000e1e50]                           dc.w $0000
[000e1e52]                           dc.w $0000
[000e1e54]                           dc.w $0000
[000e1e56]                           dc.w $0000
[000e1e58]                           dc.w $0000
[000e1e5a]                           dc.w $0000
[000e1e5c]                           dc.w $0000
[000e1e5e]                           dc.w $0000
[000e1e60]                           dc.w $0000
[000e1e62]                           dc.w $0000
[000e1e64]                           dc.w $0000
[000e1e66]                           dc.w $0000
[000e1e68]                           dc.w $0000
[000e1e6a]                           dc.w $0000
[000e1e6c]                           dc.w $0000
[000e1e6e]                           dc.w $0000
[000e1e70]                           dc.w $0000
[000e1e72]                           dc.w $0000
[000e1e74]                           dc.w $0000
[000e1e76]                           dc.w $0000
[000e1e78]                           dc.w $0000
[000e1e7a]                           dc.w $0000
[000e1e7c]                           dc.w $0000
[000e1e7e]                           dc.w $0000
[000e1e80]                           dc.w $0000
[000e1e82]                           dc.w $0000
[000e1e84]                           dc.w $0000
[000e1e86]                           dc.w $0000
[000e1e88]                           dc.w $0000
[000e1e8a]                           dc.w $0000
[000e1e8c]                           dc.w $0000
[000e1e8e]                           dc.w $0000
[000e1e90]                           dc.w $0000
[000e1e92]                           dc.w $0000
[000e1e94]                           dc.w $0000
[000e1e96]                           dc.w $0000
[000e1e98]                           dc.w $0000
[000e1e9a]                           dc.w $0000
[000e1e9c]                           dc.w $0000
[000e1e9e]                           dc.w $0000
[000e1ea0]                           dc.w $0000
[000e1ea2]                           dc.w $0000
[000e1ea4]                           dc.w $0000
[000e1ea6]                           dc.w $0000
[000e1ea8]                           dc.w $0000
[000e1eaa]                           dc.w $0000
[000e1eac]                           dc.w $0000
[000e1eae]                           dc.w $0000
[000e1eb0]                           dc.w $0000
[000e1eb2]                           dc.w $0000
[000e1eb4]                           dc.w $0000
[000e1eb6]                           dc.w $0000
[000e1eb8]                           dc.w $0000
[000e1eba]                           dc.w $0000
[000e1ebc]                           dc.w $0000
[000e1ebe]                           dc.w $0000
[000e1ec0]                           dc.w $0000
[000e1ec2]                           dc.w $0000
[000e1ec4]                           dc.w $0000
[000e1ec6]                           dc.w $0000
[000e1ec8]                           dc.w $0000
[000e1eca]                           dc.w $0000
[000e1ecc]                           dc.w $0000
[000e1ece]                           dc.w $0000
[000e1ed0]                           dc.w $0000
[000e1ed2]                           dc.w $0000
[000e1ed4]                           dc.w $0000
[000e1ed6]                           dc.w $0000
[000e1ed8]                           dc.w $0000
[000e1eda]                           dc.w $0000
[000e1edc]                           dc.w $0000
[000e1ede]                           dc.w $0000
[000e1ee0]                           dc.w $0000
[000e1ee2]                           dc.w $0000
[000e1ee4]                           dc.w $0000
[000e1ee6]                           dc.w $0000
[000e1ee8]                           dc.w $0000
[000e1eea]                           dc.w $0000
[000e1eec]                           dc.w $0000
[000e1eee]                           dc.w $0000
[000e1ef0]                           dc.w $0000
[000e1ef2]                           dc.w $0000
[000e1ef4]                           dc.w $0000
[000e1ef6]                           dc.w $0000
[000e1ef8]                           dc.w $0000
[000e1efa]                           dc.w $2000
[000e1efc]                           dc.w $2000
[000e1efe]                           dc.w $3a5c
[000e1f00]                           dc.w $0061
[000e1f02]                           dc.b 'zAZ09',0
[000e1f08]                           dc.b '._!@#$%^&()+-=~';",<>|[]{}',0
[000e1f23]                           dc.b 'azAZ09',0
[000e1f2a]                           dc.b '._!@#$%^&()+-=~';",<>|[]{}*?',0
[000e1f47]                           dc.b 'azAZ09',0
[000e1f4e]                           dc.b '._!@#$%^&()+-=~';",<>|[]{}\:',0
[000e1f6b]                           dc.b 'azAZ09',0
[000e1f72]                           dc.b '._!@#$%^&()+-=~';",<>|[]{}*?\:',0
[000e1f91]                           dc.b 'azAZ',0
[000e1f96]                           dc.b 'azAZ09',0
[000e1f9d]                           dc.b $20
[000e1f9e]                           dc.w $0030
[000e1fa0]                           dc.w $3100
[000e1fa2]                           dc.w $3037
[000e1fa4]                           dc.w $0030
[000e1fa6]                           dc.w $3900
[000e1fa8]                           dc.b '09afAF',0
[000e1faf]                           dc.b $30
[000e1fb0]                           dc.w $3900
[000e1fb2]                           dc.w $2e00
[000e1fb4]                           dc.w $3039
[000e1fb6]                           dc.w $0025
[000e1fb8]                           dc.w $6c64
[000e1fba]                           dc.w $0025
[000e1fbc]                           dc.w $6300
[000e1fbe]                           dc.b '%ld',0
[000e1fc2]                           dc.w $2563
[000e1fc4]                           dc.w $0025
[000e1fc6]                           dc.w $6c64
[000e1fc8]                           dc.w $0000
