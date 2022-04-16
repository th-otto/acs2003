Awi_keys:
[0006b744] 4fef fff6                 lea.l      -10(a7),a7
[0006b748] 2f48 0006                 move.l     a0,6(a7)
[0006b74c] 3f40 0004                 move.w     d0,4(a7)
[0006b750] 3f41 0002                 move.w     d1,2(a7)
[0006b754] 322f 0002                 move.w     2(a7),d1
[0006b758] 302f 0004                 move.w     4(a7),d0
[0006b75c] 206f 0006                 movea.l    6(a7),a0
[0006b760] 4eb9 0005 37a2            jsr        Awi_keysend
[0006b766] 3e80                      move.w     d0,(a7)
[0006b768] 0c57 ffff                 cmpi.w     #$FFFF,(a7)
[0006b76c] 6c04                      bge.s      Awi_keys_1
[0006b76e] 70ff                      moveq.l    #-1,d0
[0006b770] 6002                      bra.s      Awi_keys_2
Awi_keys_1:
[0006b772] 3017                      move.w     (a7),d0
Awi_keys_2:
[0006b774] 4fef 000a                 lea.l      10(a7),a7
[0006b778] 4e75                      rts

Awi_nokey:
[0006b77a] 5d4f                      subq.w     #6,a7
[0006b77c] 2f48 0002                 move.l     a0,2(a7)
[0006b780] 3e81                      move.w     d1,(a7)
[0006b782] 3017                      move.w     (a7),d0
[0006b784] 6a1a                      bpl.s      Awi_nokey_1
[0006b786] 102f 0001                 move.b     1(a7),d0
[0006b78a] 4880                      ext.w      d0
[0006b78c] 907c 000e                 sub.w      #$000E,d0
[0006b790] 6702                      beq.s      Awi_nokey_2
[0006b792] 600c                      bra.s      Awi_nokey_1
Awi_nokey_2:
[0006b794] 206f 0002                 movea.l    2(a7),a0
[0006b798] 4eb9 0005 3456            jsr        Awi_help
[0006b79e] 4e71                      nop
Awi_nokey_1:
[0006b7a0] 70ff                      moveq.l    #-1,d0
[0006b7a2] 5c4f                      addq.w     #6,a7
[0006b7a4] 4e75                      rts

Aob_within:
[0006b7a6] 514f                      subq.w     #8,a7
[0006b7a8] 2f48 0004                 move.l     a0,4(a7)
[0006b7ac] 3f40 0002                 move.w     d0,2(a7)
[0006b7b0] 3e81                      move.w     d1,(a7)
[0006b7b2] 206f 0004                 movea.l    4(a7),a0
[0006b7b6] 302f 0002                 move.w     2(a7),d0
[0006b7ba] b050                      cmp.w      (a0),d0
[0006b7bc] 6c04                      bge.s      Aob_within_1
[0006b7be] 4240                      clr.w      d0
[0006b7c0] 6046                      bra.s      Aob_within_2
Aob_within_1:
[0006b7c2] 206f 0004                 movea.l    4(a7),a0
[0006b7c6] 3017                      move.w     (a7),d0
[0006b7c8] b068 0002                 cmp.w      2(a0),d0
[0006b7cc] 6c04                      bge.s      Aob_within_3
[0006b7ce] 4240                      clr.w      d0
[0006b7d0] 6036                      bra.s      Aob_within_2
Aob_within_3:
[0006b7d2] 206f 0004                 movea.l    4(a7),a0
[0006b7d6] 3010                      move.w     (a0),d0
[0006b7d8] 206f 0004                 movea.l    4(a7),a0
[0006b7dc] d068 0004                 add.w      4(a0),d0
[0006b7e0] 322f 0002                 move.w     2(a7),d1
[0006b7e4] b240                      cmp.w      d0,d1
[0006b7e6] 6d04                      blt.s      Aob_within_4
[0006b7e8] 4240                      clr.w      d0
[0006b7ea] 601c                      bra.s      Aob_within_2
Aob_within_4:
[0006b7ec] 206f 0004                 movea.l    4(a7),a0
[0006b7f0] 3028 0002                 move.w     2(a0),d0
[0006b7f4] 206f 0004                 movea.l    4(a7),a0
[0006b7f8] d068 0006                 add.w      6(a0),d0
[0006b7fc] 3217                      move.w     (a7),d1
[0006b7fe] b240                      cmp.w      d0,d1
[0006b800] 6d04                      blt.s      Aob_within_5
[0006b802] 4240                      clr.w      d0
[0006b804] 6002                      bra.s      Aob_within_2
Aob_within_5:
[0006b806] 7001                      moveq.l    #1,d0
Aob_within_2:
[0006b808] 504f                      addq.w     #8,a7
[0006b80a] 4e75                      rts

alert_str:
[0006b80c] 4fef fef4                 lea.l      -268(a7),a7
[0006b810] 2f48 0108                 move.l     a0,264(a7)
[0006b814] 2f49 0104                 move.l     a1,260(a7)
[0006b818] 41ef 0004                 lea.l      4(a7),a0
[0006b81c] 2e88                      move.l     a0,(a7)
[0006b81e] 602a                      bra.s      alert_str_1
[0006b820] 206f 0108                 movea.l    264(a7),a0
alert_str_4:
[0006b824] 0c10 0025                 cmpi.b     #$25,(a0)
[0006b828] 6612                      bne.s      alert_str_2
[0006b82a] 206f 0108                 movea.l    264(a7),a0
[0006b82e] 0c28 0073 0001            cmpi.b     #$73,1(a0)
[0006b834] 6606                      bne.s      alert_str_2
[0006b836] 54af 0108                 addq.l     #2,264(a7)
[0006b83a] 6016                      bra.s      alert_str_3
alert_str_2:
[0006b83c] 206f 0108                 movea.l    264(a7),a0
[0006b840] 52af 0108                 addq.l     #1,264(a7)
[0006b844] 2257                      movea.l    (a7),a1
[0006b846] 5297                      addq.l     #1,(a7)
[0006b848] 1290                      move.b     (a0),(a1)
alert_str_1:
[0006b84a] 206f 0108                 movea.l    264(a7),a0
[0006b84e] 1010                      move.b     (a0),d0
[0006b850] 66ce                      bne.s      alert_str_4
alert_str_3:
[0006b852] 2057                      movea.l    (a7),a0
[0006b854] 4210                      clr.b      (a0)
[0006b856] 701e                      moveq.l    #30,d0
[0006b858] 226f 0104                 movea.l    260(a7),a1
[0006b85c] 2057                      movea.l    (a7),a0
[0006b85e] 4eb9 0008 2f96            jsr        strncat
[0006b864] 226f 0108                 movea.l    264(a7),a1
[0006b868] 2057                      movea.l    (a7),a0
[0006b86a] 4eb9 0008 2e42            jsr        strcat
[0006b870] 41ef 0004                 lea.l      4(a7),a0
[0006b874] 7001                      moveq.l    #1,d0
[0006b876] 4eb9 0005 a600            jsr        Awi_alert
[0006b87c] 4fef 010c                 lea.l      268(a7),a7
[0006b880] 4e75                      rts

dia_obchange:
[0006b882] 4fef ffe8                 lea.l      -24(a7),a7
[0006b886] 2f48 0014                 move.l     a0,20(a7)
[0006b88a] 3f40 0012                 move.w     d0,18(a7)
[0006b88e] 3f41 0010                 move.w     d1,16(a7)
[0006b892] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b898] 2f68 025c 000c            move.l     604(a0),12(a7)
[0006b89e] 322f 0012                 move.w     18(a7),d1
[0006b8a2] 48c1                      ext.l      d1
[0006b8a4] 2001                      move.l     d1,d0
[0006b8a6] d080                      add.l      d0,d0
[0006b8a8] d081                      add.l      d1,d0
[0006b8aa] e788                      lsl.l      #3,d0
[0006b8ac] 206f 000c                 movea.l    12(a7),a0
[0006b8b0] d1c0                      adda.l     d0,a0
[0006b8b2] 2f48 0008                 move.l     a0,8(a7)
[0006b8b6] 302f 0012                 move.w     18(a7),d0
[0006b8ba] 226f 000c                 movea.l    12(a7),a1
[0006b8be] 41d7                      lea.l      (a7),a0
[0006b8c0] 4eb9 0004 fe06            jsr        Aob_offset
[0006b8c6] 206f 0008                 movea.l    8(a7),a0
[0006b8ca] 0c28 0021 0007            cmpi.b     #$21,7(a0)
[0006b8d0] 6610                      bne.s      dia_obchange_1
[0006b8d2] 302f 0012                 move.w     18(a7),d0
[0006b8d6] 206f 0014                 movea.l    20(a7),a0
[0006b8da] 4eb9 0005 1b80            jsr        Awi_obredraw
[0006b8e0] 6072                      bra.s      dia_obchange_2
dia_obchange_1:
[0006b8e2] 0c6f ffff 0010            cmpi.w     #$FFFF,16(a7)
[0006b8e8] 670e                      beq.s      dia_obchange_3
[0006b8ea] 206f 0008                 movea.l    8(a7),a0
[0006b8ee] 3028 000a                 move.w     10(a0),d0
[0006b8f2] b06f 0010                 cmp.w      16(a7),d0
[0006b8f6] 662a                      bne.s      dia_obchange_4
dia_obchange_3:
[0006b8f8] 3f2f 0006                 move.w     6(a7),-(a7)
[0006b8fc] 3f2f 0006                 move.w     6(a7),-(a7)
[0006b900] 3f2f 0006                 move.w     6(a7),-(a7)
[0006b904] 2279 000e 692a            movea.l    _globl,a1
[0006b90a] 342f 0006                 move.w     6(a7),d2
[0006b90e] 7206                      moveq.l    #6,d1
[0006b910] 302f 0018                 move.w     24(a7),d0
[0006b914] 206f 0012                 movea.l    18(a7),a0
[0006b918] 4eb9 0007 9c0c            jsr        mt_objc_draw
[0006b91e] 5c4f                      addq.w     #6,a7
[0006b920] 6032                      bra.s      dia_obchange_2
dia_obchange_4:
[0006b922] 7001                      moveq.l    #1,d0
[0006b924] 3f00                      move.w     d0,-(a7)
[0006b926] 3f2f 0012                 move.w     18(a7),-(a7)
[0006b92a] 3f2f 000a                 move.w     10(a7),-(a7)
[0006b92e] 3f2f 000a                 move.w     10(a7),-(a7)
[0006b932] 3f2f 000a                 move.w     10(a7),-(a7)
[0006b936] 2279 000e 692a            movea.l    _globl,a1
[0006b93c] 342f 000a                 move.w     10(a7),d2
[0006b940] 4241                      clr.w      d1
[0006b942] 302f 001c                 move.w     28(a7),d0
[0006b946] 206f 0016                 movea.l    22(a7),a0
[0006b94a] 4eb9 0007 9f2c            jsr        mt_objc_change
[0006b950] 4fef 000a                 lea.l      10(a7),a7
dia_obchange_2:
[0006b954] 4fef 0018                 lea.l      24(a7),a7
[0006b958] 4e75                      rts

dia_redraw:
[0006b95a] 594f                      subq.w     #4,a7
[0006b95c] 2e89                      move.l     a1,(a7)
[0006b95e] 2057                      movea.l    (a7),a0
[0006b960] 3f28 0006                 move.w     6(a0),-(a7)
[0006b964] 206f 0002                 movea.l    2(a7),a0
[0006b968] 3f28 0004                 move.w     4(a0),-(a7)
[0006b96c] 206f 0004                 movea.l    4(a7),a0
[0006b970] 3f28 0002                 move.w     2(a0),-(a7)
[0006b974] 2279 000e 692a            movea.l    _globl,a1
[0006b97a] 206f 0006                 movea.l    6(a7),a0
[0006b97e] 3410                      move.w     (a0),d2
[0006b980] 7206                      moveq.l    #6,d1
[0006b982] 4240                      clr.w      d0
[0006b984] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b98a] 2068 025c                 movea.l    604(a0),a0
[0006b98e] 4eb9 0007 9c0c            jsr        mt_objc_draw
[0006b994] 5c4f                      addq.w     #6,a7
[0006b996] 584f                      addq.w     #4,a7
[0006b998] 4e75                      rts

Aform_do:
[0006b99a] 2f0a                      move.l     a2,-(a7)
[0006b99c] 4fef ffe4                 lea.l      -28(a7),a7
[0006b9a0] 2f48 0018                 move.l     a0,24(a7)
[0006b9a4] 2f49 0014                 move.l     a1,20(a7)
[0006b9a8] 426f 000e                 clr.w      14(a7)
[0006b9ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006b9b2] 216f 0018 025c            move.l     24(a7),604(a0)
[0006b9b8] 206f 0014                 movea.l    20(a7),a0
[0006b9bc] 3010                      move.w     (a0),d0
[0006b9be] 6e14                      bgt.s      Aform_do_1
[0006b9c0] 7208                      moveq.l    #8,d1
[0006b9c2] 4240                      clr.w      d0
[0006b9c4] 206f 0018                 movea.l    24(a7),a0
[0006b9c8] 4eb9 0005 0e62            jsr        Aob_findflag
[0006b9ce] 3f40 0012                 move.w     d0,18(a7)
[0006b9d2] 6008                      bra.s      Aform_do_2
Aform_do_1:
[0006b9d4] 206f 0014                 movea.l    20(a7),a0
[0006b9d8] 3f50 0012                 move.w     (a0),18(a7)
Aform_do_2:
[0006b9dc] 206f 0014                 movea.l    20(a7),a0
[0006b9e0] 4250                      clr.w      (a0)
[0006b9e2] 302f 0012                 move.w     18(a7),d0
[0006b9e6] 6e04                      bgt.s      Aform_do_3
[0006b9e8] 426f 0012                 clr.w      18(a7)
Aform_do_3:
[0006b9ec] 3f7c 0001 000a            move.w     #$0001,10(a7)
[0006b9f2] 6000 0556                 bra        Aform_do_4
[0006b9f6] 302f 0012                 move.w     18(a7),d0
Aform_do_21:
[0006b9fa] 6754                      beq.s      Aform_do_5
[0006b9fc] 206f 0014                 movea.l    20(a7),a0
[0006ba00] 3010                      move.w     (a0),d0
[0006ba02] b06f 0012                 cmp.w      18(a7),d0
[0006ba06] 6748                      beq.s      Aform_do_5
[0006ba08] 206f 0014                 movea.l    20(a7),a0
[0006ba0c] 30af 0012                 move.w     18(a7),(a0)
[0006ba10] 426f 0012                 clr.w      18(a7)
[0006ba14] 7008                      moveq.l    #8,d0
[0006ba16] 206f 0014                 movea.l    20(a7),a0
[0006ba1a] 3410                      move.w     (a0),d2
[0006ba1c] 48c2                      ext.l      d2
[0006ba1e] 2202                      move.l     d2,d1
[0006ba20] d281                      add.l      d1,d1
[0006ba22] d282                      add.l      d2,d1
[0006ba24] e789                      lsl.l      #3,d1
[0006ba26] 206f 0018                 movea.l    24(a7),a0
[0006ba2a] c070 1808                 and.w      8(a0,d1.l),d0
[0006ba2e] 6720                      beq.s      Aform_do_5
[0006ba30] 2f39 000e 692a            move.l     _globl,-(a7)
[0006ba36] 7401                      moveq.l    #1,d2
[0006ba38] 43ef 000a                 lea.l      10(a7),a1
[0006ba3c] 4241                      clr.w      d1
[0006ba3e] 206f 0018                 movea.l    24(a7),a0
[0006ba42] 3010                      move.w     (a0),d0
[0006ba44] 206f 001c                 movea.l    28(a7),a0
[0006ba48] 4eb9 0007 9e02            jsr        mt_objc_edit
[0006ba4e] 584f                      addq.w     #4,a7
Aform_do_5:
[0006ba50] 2f39 000e 692a            move.l     _globl,-(a7)
[0006ba56] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ba5c] 4868 02cc                 pea.l      716(a0)
[0006ba60] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ba66] 4868 02ce                 pea.l      718(a0)
[0006ba6a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ba70] 4868 0266                 pea.l      614(a0)
[0006ba74] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ba7a] 4868 02ca                 pea.l      714(a0)
[0006ba7e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ba84] 4868 0264                 pea.l      612(a0)
[0006ba88] 42a7                      clr.l      -(a7)
[0006ba8a] 4267                      clr.w      -(a7)
[0006ba8c] 4267                      clr.w      -(a7)
[0006ba8e] 4267                      clr.w      -(a7)
[0006ba90] 4267                      clr.w      -(a7)
[0006ba92] 4267                      clr.w      -(a7)
[0006ba94] 4267                      clr.w      -(a7)
[0006ba96] 4267                      clr.w      -(a7)
[0006ba98] 4267                      clr.w      -(a7)
[0006ba9a] 4267                      clr.w      -(a7)
[0006ba9c] 4267                      clr.w      -(a7)
[0006ba9e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006baa4] 3f28 02c8                 move.w     712(a0),-(a7)
[0006baa8] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006baae] 43e9 0262                 lea.l      610(a1),a1
[0006bab2] 91c8                      suba.l     a0,a0
[0006bab4] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006baba] 342a 02c6                 move.w     710(a2),d2
[0006babe] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006bac4] 322a 02d0                 move.w     720(a2),d1
[0006bac8] 7003                      moveq.l    #3,d0
[0006baca] 4eb9 0007 9240            jsr        mt_evnt_multi
[0006bad0] 4fef 0032                 lea.l      50(a7),a7
[0006bad4] 3f40 000c                 move.w     d0,12(a7)
[0006bad8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bade] 3228 0266                 move.w     614(a0),d1
[0006bae2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bae8] 3028 02ce                 move.w     718(a0),d0
[0006baec] 4eb9 0004 4284            jsr        nkc_gemks2n
[0006baf2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006baf8] 3140 02ce                 move.w     d0,718(a0)
[0006bafc] 7001                      moveq.l    #1,d0
[0006bafe] c06f 000c                 and.w      12(a7),d0
[0006bb02] 6700 02da                 beq        Aform_do_6
[0006bb06] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006bb0c] 43e9 02ce                 lea.l      718(a1),a1
[0006bb10] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bb16] 41e8 0266                 lea.l      614(a0),a0
[0006bb1a] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006bb20] 246a 02b6                 movea.l    694(a2),a2
[0006bb24] 4e92                      jsr        (a2)
[0006bb26] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006bb2c] 43e9 02ce                 lea.l      718(a1),a1
[0006bb30] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bb36] 41e8 0266                 lea.l      614(a0),a0
[0006bb3a] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006bb40] 246a 02c2                 movea.l    706(a2),a2
[0006bb44] 4e92                      jsr        (a2)
[0006bb46] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bb4c] 3028 02ce                 move.w     718(a0),d0
[0006bb50] 6700 028c                 beq        Aform_do_6
[0006bb54] 426f 000c                 clr.w      12(a7)
[0006bb58] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bb5e] 3228 02ce                 move.w     718(a0),d1
[0006bb62] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bb68] 3028 0266                 move.w     614(a0),d0
[0006bb6c] 206f 0018                 movea.l    24(a7),a0
[0006bb70] 4eb9 0005 0ce8            jsr        Aob_key
[0006bb76] 3f40 0008                 move.w     d0,8(a7)
[0006bb7a] 302f 0008                 move.w     8(a7),d0
[0006bb7e] 6b2a                      bmi.s      Aform_do_7
[0006bb80] 3f6f 0008 0012            move.w     8(a7),18(a7)
[0006bb86] 2f39 000e 692a            move.l     _globl,-(a7)
[0006bb8c] 43ef 0016                 lea.l      22(a7),a1
[0006bb90] 7201                      moveq.l    #1,d1
[0006bb92] 302f 0016                 move.w     22(a7),d0
[0006bb96] 206f 001c                 movea.l    28(a7),a0
[0006bb9a] 4eb9 0007 a33e            jsr        mt_form_button
[0006bba0] 584f                      addq.w     #4,a7
[0006bba2] 3f40 000a                 move.w     d0,10(a7)
[0006bba6] 6000 0236                 bra        Aform_do_6
Aform_do_7:
[0006bbaa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bbb0] 3028 02ce                 move.w     718(a0),d0
[0006bbb4] c07c 0400                 and.w      #$0400,d0
[0006bbb8] 6748                      beq.s      Aform_do_8
[0006bbba] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bbc0] 3028 02ce                 move.w     718(a0),d0
[0006bbc4] c07c 0400                 and.w      #$0400,d0
[0006bbc8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bbce] 3228 02ce                 move.w     718(a0),d1
[0006bbd2] c27c 1f00                 and.w      #$1F00,d1
[0006bbd6] b041                      cmp.w      d1,d0
[0006bbd8] 6628                      bne.s      Aform_do_8
[0006bbda] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bbe0] 0c28 0009 02cf            cmpi.b     #$09,719(a0)
[0006bbe6] 661a                      bne.s      Aform_do_8
[0006bbe8] 226f 0018                 movea.l    24(a7),a1
[0006bbec] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bbf2] 2068 0258                 movea.l    600(a0),a0
[0006bbf6] 4eb9 0005 2c9c            jsr        Aob_chdef
[0006bbfc] 4a40                      tst.w      d0
[0006bbfe] 6600 01de                 bne        Aform_do_6
Aform_do_8:
[0006bc02] 2f39 000e 692a            move.l     _globl,-(a7)
[0006bc08] 486f 0012                 pea.l      18(a7)
[0006bc0c] 43ef 001a                 lea.l      26(a7),a1
[0006bc10] 2f09                      move.l     a1,-(a7)
[0006bc12] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bc18] 3028 02ce                 move.w     718(a0),d0
[0006bc1c] 4eb9 0004 4330            jsr        nkc_n2gem
[0006bc22] 3400                      move.w     d0,d2
[0006bc24] 206f 0020                 movea.l    32(a7),a0
[0006bc28] 3210                      move.w     (a0),d1
[0006bc2a] 206f 0020                 movea.l    32(a7),a0
[0006bc2e] 3010                      move.w     (a0),d0
[0006bc30] 206f 0024                 movea.l    36(a7),a0
[0006bc34] 225f                      movea.l    (a7)+,a1
[0006bc36] 4eb9 0007 a2aa            jsr        mt_form_keybd
[0006bc3c] 504f                      addq.w     #8,a7
[0006bc3e] 3f40 000a                 move.w     d0,10(a7)
[0006bc42] 7020                      moveq.l    #32,d0
[0006bc44] 206f 0014                 movea.l    20(a7),a0
[0006bc48] 3410                      move.w     (a0),d2
[0006bc4a] 48c2                      ext.l      d2
[0006bc4c] 2202                      move.l     d2,d1
[0006bc4e] d281                      add.l      d1,d1
[0006bc50] d282                      add.l      d2,d1
[0006bc52] e789                      lsl.l      #3,d1
[0006bc54] 206f 0018                 movea.l    24(a7),a0
[0006bc58] c070 1808                 and.w      8(a0,d1.l),d0
[0006bc5c] 6714                      beq.s      Aform_do_9
[0006bc5e] 206f 0014                 movea.l    20(a7),a0
[0006bc62] 302f 0012                 move.w     18(a7),d0
[0006bc66] b050                      cmp.w      (a0),d0
[0006bc68] 6f08                      ble.s      Aform_do_9
[0006bc6a] 206f 0014                 movea.l    20(a7),a0
[0006bc6e] 3f50 0012                 move.w     (a0),18(a7)
Aform_do_9:
[0006bc72] 302f 000e                 move.w     14(a7),d0
[0006bc76] 6700 0166                 beq        Aform_do_6
[0006bc7a] 7008                      moveq.l    #8,d0
[0006bc7c] 206f 0014                 movea.l    20(a7),a0
[0006bc80] 3410                      move.w     (a0),d2
[0006bc82] 48c2                      ext.l      d2
[0006bc84] 2202                      move.l     d2,d1
[0006bc86] d281                      add.l      d1,d1
[0006bc88] d282                      add.l      d2,d1
[0006bc8a] e789                      lsl.l      #3,d1
[0006bc8c] 206f 0018                 movea.l    24(a7),a0
[0006bc90] c070 1808                 and.w      8(a0,d1.l),d0
[0006bc94] 6700 0148                 beq        Aform_do_6
[0006bc98] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bc9e] 1028 02cf                 move.b     719(a0),d0
[0006bca2] 4880                      ext.w      d0
[0006bca4] 4a40                      tst.w      d0
[0006bca6] 670e                      beq.s      Aform_do_10
[0006bca8] 5740                      subq.w     #3,d0
[0006bcaa] 6700 008c                 beq        Aform_do_11
[0006bcae] 5340                      subq.w     #1,d0
[0006bcb0] 6708                      beq.s      Aform_do_12
[0006bcb2] 6000 00d6                 bra        Aform_do_13
Aform_do_10:
[0006bcb6] 6000 0126                 bra        Aform_do_6
Aform_do_12:
[0006bcba] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bcc0] 3028 02ce                 move.w     718(a0),d0
[0006bcc4] c07c 8300                 and.w      #$8300,d0
[0006bcc8] 676e                      beq.s      Aform_do_11
[0006bcca] 2f39 000e 692a            move.l     _globl,-(a7)
[0006bcd0] 7403                      moveq.l    #3,d2
[0006bcd2] 43ef 000a                 lea.l      10(a7),a1
[0006bcd6] 4241                      clr.w      d1
[0006bcd8] 206f 0018                 movea.l    24(a7),a0
[0006bcdc] 3010                      move.w     (a0),d0
[0006bcde] 206f 001c                 movea.l    28(a7),a0
[0006bce2] 4eb9 0007 9e02            jsr        mt_objc_edit
[0006bce8] 584f                      addq.w     #4,a7
[0006bcea] 206f 0014                 movea.l    20(a7),a0
[0006bcee] 3210                      move.w     (a0),d1
[0006bcf0] 48c1                      ext.l      d1
[0006bcf2] 2001                      move.l     d1,d0
[0006bcf4] d080                      add.l      d0,d0
[0006bcf6] d081                      add.l      d1,d0
[0006bcf8] e788                      lsl.l      #3,d0
[0006bcfa] 206f 0018                 movea.l    24(a7),a0
[0006bcfe] 2070 080c                 movea.l    12(a0,d0.l),a0
[0006bd02] 2e90                      move.l     (a0),(a7)
[0006bd04] 2057                      movea.l    (a7),a0
[0006bd06] 1f50 0004                 move.b     (a0),4(a7)
[0006bd0a] 2057                      movea.l    (a7),a0
[0006bd0c] 4210                      clr.b      (a0)
[0006bd0e] 2f39 000e 692a            move.l     _globl,-(a7)
[0006bd14] 7401                      moveq.l    #1,d2
[0006bd16] 43ef 000a                 lea.l      10(a7),a1
[0006bd1a] 4241                      clr.w      d1
[0006bd1c] 206f 0018                 movea.l    24(a7),a0
[0006bd20] 3010                      move.w     (a0),d0
[0006bd22] 206f 001c                 movea.l    28(a7),a0
[0006bd26] 4eb9 0007 9e02            jsr        mt_objc_edit
[0006bd2c] 584f                      addq.w     #4,a7
[0006bd2e] 2057                      movea.l    (a7),a0
[0006bd30] 10af 0004                 move.b     4(a7),(a0)
[0006bd34] 6000 00a8                 bra        Aform_do_6
Aform_do_11:
[0006bd38] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bd3e] 3028 02ce                 move.w     718(a0),d0
[0006bd42] c07c 8300                 and.w      #$8300,d0
[0006bd46] 6742                      beq.s      Aform_do_13
[0006bd48] 2f39 000e 692a            move.l     _globl,-(a7)
[0006bd4e] 7403                      moveq.l    #3,d2
[0006bd50] 43ef 000a                 lea.l      10(a7),a1
[0006bd54] 4241                      clr.w      d1
[0006bd56] 206f 0018                 movea.l    24(a7),a0
[0006bd5a] 3010                      move.w     (a0),d0
[0006bd5c] 206f 001c                 movea.l    28(a7),a0
[0006bd60] 4eb9 0007 9e02            jsr        mt_objc_edit
[0006bd66] 584f                      addq.w     #4,a7
[0006bd68] 2f39 000e 692a            move.l     _globl,-(a7)
[0006bd6e] 7401                      moveq.l    #1,d2
[0006bd70] 43ef 000a                 lea.l      10(a7),a1
[0006bd74] 4241                      clr.w      d1
[0006bd76] 206f 0018                 movea.l    24(a7),a0
[0006bd7a] 3010                      move.w     (a0),d0
[0006bd7c] 206f 001c                 movea.l    28(a7),a0
[0006bd80] 4eb9 0007 9e02            jsr        mt_objc_edit
[0006bd86] 584f                      addq.w     #4,a7
[0006bd88] 6054                      bra.s      Aform_do_6
Aform_do_13:
[0006bd8a] 7008                      moveq.l    #8,d0
[0006bd8c] 206f 0014                 movea.l    20(a7),a0
[0006bd90] 3410                      move.w     (a0),d2
[0006bd92] 48c2                      ext.l      d2
[0006bd94] 2202                      move.l     d2,d1
[0006bd96] d281                      add.l      d1,d1
[0006bd98] d282                      add.l      d2,d1
[0006bd9a] e789                      lsl.l      #3,d1
[0006bd9c] 206f 0018                 movea.l    24(a7),a0
[0006bda0] c070 1808                 and.w      8(a0,d1.l),d0
[0006bda4] 6738                      beq.s      Aform_do_6
[0006bda6] 2f39 000e 692a            move.l     _globl,-(a7)
[0006bdac] 7402                      moveq.l    #2,d2
[0006bdae] 43ef 000a                 lea.l      10(a7),a1
[0006bdb2] 3f02                      move.w     d2,-(a7)
[0006bdb4] 2f09                      move.l     a1,-(a7)
[0006bdb6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bdbc] 3028 02ce                 move.w     718(a0),d0
[0006bdc0] 4eb9 0004 4330            jsr        nkc_n2gem
[0006bdc6] 3200                      move.w     d0,d1
[0006bdc8] 206f 001e                 movea.l    30(a7),a0
[0006bdcc] 3010                      move.w     (a0),d0
[0006bdce] 206f 0022                 movea.l    34(a7),a0
[0006bdd2] 225f                      movea.l    (a7)+,a1
[0006bdd4] 341f                      move.w     (a7)+,d2
[0006bdd6] 4eb9 0007 9e02            jsr        mt_objc_edit
[0006bddc] 584f                      addq.w     #4,a7
Aform_do_6:
[0006bdde] 7002                      moveq.l    #2,d0
[0006bde0] c06f 000c                 and.w      12(a7),d0
[0006bde4] 6700 0110                 beq        Aform_do_14
[0006bde8] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006bdee] 43e9 02cc                 lea.l      716(a1),a1
[0006bdf2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bdf8] 41e8 02ca                 lea.l      714(a0),a0
[0006bdfc] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006be02] 246a 02ba                 movea.l    698(a2),a2
[0006be06] 4e92                      jsr        (a2)
[0006be08] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006be0e] 3f28 0264                 move.w     612(a0),-(a7)
[0006be12] 2279 000e 692a            movea.l    _globl,a1
[0006be18] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006be1e] 3428 0262                 move.w     610(a0),d2
[0006be22] 7206                      moveq.l    #6,d1
[0006be24] 4240                      clr.w      d0
[0006be26] 206f 001a                 movea.l    26(a7),a0
[0006be2a] 4eb9 0007 9c96            jsr        mt_objc_find
[0006be30] 544f                      addq.w     #2,a7
[0006be32] 3f40 0012                 move.w     d0,18(a7)
[0006be36] 0c6f ffff 0012            cmpi.w     #$FFFF,18(a7)
[0006be3c] 6600 0078                 bne.w      Aform_do_15
[0006be40] 426f 0012                 clr.w      18(a7)
[0006be44] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006be4a] 0c68 0002 02cc            cmpi.w     #$0002,716(a0)
[0006be50] 6606                      bne.s      Aform_do_16
[0006be52] 426f 000a                 clr.w      10(a7)
[0006be56] 605c                      bra.s      Aform_do_17
Aform_do_16:
[0006be58] 206f 0018                 movea.l    24(a7),a0
[0006be5c] 3f68 000a 0010            move.w     10(a0),16(a7)
[0006be62] 7004                      moveq.l    #4,d0
[0006be64] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006be6a] 2068 023c                 movea.l    572(a0),a0
[0006be6e] c068 000e                 and.w      14(a0),d0
[0006be72] 670c                      beq.s      Aform_do_18
[0006be74] 7207                      moveq.l    #7,d1
[0006be76] 7002                      moveq.l    #2,d0
[0006be78] 4eb9 0008 0b1a            jsr        Bconout
[0006be7e] 6034                      bra.s      Aform_do_17
Aform_do_18:
[0006be80] 2279 000e 692a            movea.l    _globl,a1
[0006be86] 7401                      moveq.l    #1,d2
[0006be88] 846f 0010                 or.w       16(a7),d2
[0006be8c] 322f 0010                 move.w     16(a7),d1
[0006be90] 4240                      clr.w      d0
[0006be92] 206f 0018                 movea.l    24(a7),a0
[0006be96] 4eb9 0007 a94c            jsr        mt_graf_watchbox
[0006be9c] 4a40                      tst.w      d0
[0006be9e] 6614                      bne.s      Aform_do_17
[0006bea0] 322f 0010                 move.w     16(a7),d1
[0006bea4] 4240                      clr.w      d0
[0006bea6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006beac] 2068 0258                 movea.l    600(a0),a0
[0006beb0] 6100 f9d0                 bsr        dia_obchange
Aform_do_17:
[0006beb4] 6040                      bra.s      Aform_do_14
Aform_do_15:
[0006beb6] 7008                      moveq.l    #8,d0
[0006beb8] 342f 0012                 move.w     18(a7),d2
[0006bebc] 48c2                      ext.l      d2
[0006bebe] 2202                      move.l     d2,d1
[0006bec0] d281                      add.l      d1,d1
[0006bec2] d282                      add.l      d2,d1
[0006bec4] e789                      lsl.l      #3,d1
[0006bec6] 206f 0018                 movea.l    24(a7),a0
[0006beca] c070 180a                 and.w      10(a0,d1.l),d0
[0006bece] 6622                      bne.s      Aform_do_19
[0006bed0] 2f39 000e 692a            move.l     _globl,-(a7)
[0006bed6] 43ef 0016                 lea.l      22(a7),a1
[0006beda] 7201                      moveq.l    #1,d1
[0006bedc] 302f 0016                 move.w     22(a7),d0
[0006bee0] 206f 001c                 movea.l    28(a7),a0
[0006bee4] 4eb9 0007 a33e            jsr        mt_form_button
[0006beea] 584f                      addq.w     #4,a7
[0006beec] 3f40 000a                 move.w     d0,10(a7)
[0006bef0] 6004                      bra.s      Aform_do_14
Aform_do_19:
[0006bef2] 426f 0012                 clr.w      18(a7)
Aform_do_14:
[0006bef6] 302f 000a                 move.w     10(a7),d0
[0006befa] 6712                      beq.s      Aform_do_20
[0006befc] 302f 0012                 move.w     18(a7),d0
[0006bf00] 6748                      beq.s      Aform_do_4
[0006bf02] 206f 0014                 movea.l    20(a7),a0
[0006bf06] 302f 0012                 move.w     18(a7),d0
[0006bf0a] b050                      cmp.w      (a0),d0
[0006bf0c] 673c                      beq.s      Aform_do_4
Aform_do_20:
[0006bf0e] 7008                      moveq.l    #8,d0
[0006bf10] 206f 0014                 movea.l    20(a7),a0
[0006bf14] 3410                      move.w     (a0),d2
[0006bf16] 48c2                      ext.l      d2
[0006bf18] 2202                      move.l     d2,d1
[0006bf1a] d281                      add.l      d1,d1
[0006bf1c] d282                      add.l      d2,d1
[0006bf1e] e789                      lsl.l      #3,d1
[0006bf20] 206f 0018                 movea.l    24(a7),a0
[0006bf24] c070 1808                 and.w      8(a0,d1.l),d0
[0006bf28] 6720                      beq.s      Aform_do_4
[0006bf2a] 2f39 000e 692a            move.l     _globl,-(a7)
[0006bf30] 7403                      moveq.l    #3,d2
[0006bf32] 43ef 000a                 lea.l      10(a7),a1
[0006bf36] 4241                      clr.w      d1
[0006bf38] 206f 0018                 movea.l    24(a7),a0
[0006bf3c] 3010                      move.w     (a0),d0
[0006bf3e] 206f 001c                 movea.l    28(a7),a0
[0006bf42] 4eb9 0007 9e02            jsr        mt_objc_edit
[0006bf48] 584f                      addq.w     #4,a7
Aform_do_4:
[0006bf4a] 302f 000a                 move.w     10(a7),d0
[0006bf4e] 6600 faa6                 bne        Aform_do_21
[0006bf52] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bf58] 0c68 0002 02cc            cmpi.w     #$0002,716(a0)
[0006bf5e] 661a                      bne.s      Aform_do_22
[0006bf60] 322f 0012                 move.w     18(a7),d1
[0006bf64] 48c1                      ext.l      d1
[0006bf66] 2001                      move.l     d1,d0
[0006bf68] d080                      add.l      d0,d0
[0006bf6a] d081                      add.l      d1,d0
[0006bf6c] e788                      lsl.l      #3,d0
[0006bf6e] 206f 0018                 movea.l    24(a7),a0
[0006bf72] 0070 4000 080a            ori.w      #$4000,10(a0,d0.l)
[0006bf78] 6018                      bra.s      Aform_do_23
Aform_do_22:
[0006bf7a] 322f 0012                 move.w     18(a7),d1
[0006bf7e] 48c1                      ext.l      d1
[0006bf80] 2001                      move.l     d1,d0
[0006bf82] d080                      add.l      d0,d0
[0006bf84] d081                      add.l      d1,d0
[0006bf86] e788                      lsl.l      #3,d0
[0006bf88] 206f 0018                 movea.l    24(a7),a0
[0006bf8c] 0270 bfff 080a            andi.w     #$BFFF,10(a0,d0.l)
Aform_do_23:
[0006bf92] 302f 0012                 move.w     18(a7),d0
[0006bf96] 4fef 001c                 lea.l      28(a7),a7
[0006bf9a] 245f                      movea.l    (a7)+,a2
[0006bf9c] 4e75                      rts

Act_save:
[0006bf9e] 594f                      subq.w     #4,a7
[0006bfa0] 2e88                      move.l     a0,(a7)
[0006bfa2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bfa8] 2257                      movea.l    (a7),a1
[0006bfaa] 22a8 0258                 move.l     600(a0),(a1)
[0006bfae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bfb4] 2257                      movea.l    (a7),a1
[0006bfb6] 2368 025c 0004            move.l     604(a0),4(a1)
[0006bfbc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bfc2] 2257                      movea.l    (a7),a1
[0006bfc4] 3368 0260 0008            move.w     608(a0),8(a1)
[0006bfca] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bfd0] 2257                      movea.l    (a7),a1
[0006bfd2] 3368 0262 000a            move.w     610(a0),10(a1)
[0006bfd8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bfde] 2257                      movea.l    (a7),a1
[0006bfe0] 3368 0264 000c            move.w     612(a0),12(a1)
[0006bfe6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006bfec] 2257                      movea.l    (a7),a1
[0006bfee] 3368 0266 000e            move.w     614(a0),14(a1)
[0006bff4] 2057                      movea.l    (a7),a0
[0006bff6] 41e8 0012                 lea.l      18(a0),a0
[0006bffa] 4eb9 0004 efa2            jsr        Amo_restart
[0006c000] 2057                      movea.l    (a7),a0
[0006c002] 3140 0010                 move.w     d0,16(a0)
[0006c006] 584f                      addq.w     #4,a7
[0006c008] 4e75                      rts

Act_restore:
[0006c00a] 594f                      subq.w     #4,a7
[0006c00c] 2e88                      move.l     a0,(a7)
[0006c00e] 2057                      movea.l    (a7),a0
[0006c010] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006c016] 2350 0258                 move.l     (a0),600(a1)
[0006c01a] 2057                      movea.l    (a7),a0
[0006c01c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006c022] 2368 0004 025c            move.l     4(a0),604(a1)
[0006c028] 2057                      movea.l    (a7),a0
[0006c02a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006c030] 3368 0008 0260            move.w     8(a0),608(a1)
[0006c036] 2057                      movea.l    (a7),a0
[0006c038] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006c03e] 3368 000a 0262            move.w     10(a0),610(a1)
[0006c044] 2057                      movea.l    (a7),a0
[0006c046] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006c04c] 3368 000c 0264            move.w     12(a0),612(a1)
[0006c052] 2057                      movea.l    (a7),a0
[0006c054] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006c05a] 3368 000e 0266            move.w     14(a0),614(a1)
[0006c060] 2057                      movea.l    (a7),a0
[0006c062] 41e8 0012                 lea.l      18(a0),a0
[0006c066] 2257                      movea.l    (a7),a1
[0006c068] 3029 0010                 move.w     16(a1),d0
[0006c06c] 4eb9 0004 f002            jsr        Amo_return
[0006c072] 584f                      addq.w     #4,a7
[0006c074] 4e75                      rts

A_isModDia:
[0006c076] 3039 000e 1fca            move.w     a_dialog_active,d0
[0006c07c] 6f04                      ble.s      A_isModDia_1
[0006c07e] 7001                      moveq.l    #1,d0
[0006c080] 4e75                      rts
A_isModDia_1:

[0006c082] 4240                      clr.w      d0
[0006c084] 4e75                      rts

A_exdialog:
[0006c086] 2f0a                      move.l     a2,-(a7)
[0006c088] 4fef ffb6                 lea.l      -74(a7),a7
[0006c08c] 2f48 0046                 move.l     a0,70(a7)
[0006c090] 3f40 0044                 move.w     d0,68(a7)
[0006c094] 4eb9 0004 a2f8            jsr        Aev_unhidepointer
[0006c09a] 41ef 0028                 lea.l      40(a7),a0
[0006c09e] 6100 fefe                 bsr        Act_save
[0006c0a2] 206f 0046                 movea.l    70(a7),a0
[0006c0a6] 4eb9 0004 fbdc            jsr        Aob_fix
[0006c0ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c0b2] 2068 0258                 movea.l    600(a0),a0
[0006c0b6] 2f68 006a 0024            move.l     106(a0),36(a7)
[0006c0bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c0c2] 2068 0258                 movea.l    600(a0),a0
[0006c0c6] 2f68 0066 0020            move.l     102(a0),32(a7)
[0006c0cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c0d2] 2068 0258                 movea.l    600(a0),a0
[0006c0d6] 3f68 0056 0004            move.w     86(a0),4(a7)
[0006c0dc] 7008                      moveq.l    #8,d0
[0006c0de] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c0e4] 2268 0258                 movea.l    600(a0),a1
[0006c0e8] 43e9 0034                 lea.l      52(a1),a1
[0006c0ec] 41ef 000c                 lea.l      12(a7),a0
[0006c0f0] 4eb9 0008 3500            jsr        memcpy
[0006c0f6] 4240                      clr.w      d0
[0006c0f8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c0fe] 2068 0258                 movea.l    600(a0),a0
[0006c102] 3140 0036                 move.w     d0,54(a0)
[0006c106] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c10c] 2068 0258                 movea.l    600(a0),a0
[0006c110] 3140 0034                 move.w     d0,52(a0)
[0006c114] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c11a] 3028 0008                 move.w     8(a0),d0
[0006c11e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c124] d068 000c                 add.w      12(a0),d0
[0006c128] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c12e] 2068 0258                 movea.l    600(a0),a0
[0006c132] 3140 0038                 move.w     d0,56(a0)
[0006c136] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c13c] 3028 000a                 move.w     10(a0),d0
[0006c140] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c146] d068 000e                 add.w      14(a0),d0
[0006c14a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c150] 2068 0258                 movea.l    600(a0),a0
[0006c154] 3140 003a                 move.w     d0,58(a0)
[0006c158] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c15e] 2068 0258                 movea.l    600(a0),a0
[0006c162] 217c 0006 b95a 006a       move.l     #dia_redraw,106(a0)
[0006c16a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c170] 2068 0258                 movea.l    600(a0),a0
[0006c174] 217c 0006 b882 0066       move.l     #dia_obchange,102(a0)
[0006c17c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c182] 2068 0258                 movea.l    600(a0),a0
[0006c186] 0068 0008 0056            ori.w      #$0008,86(a0)
[0006c18c] 4257                      clr.w      (a7)
[0006c18e] 302f 0044                 move.w     68(a7),d0
[0006c192] 6700 0090                 beq        A_exdialog_1
[0006c196] 7010                      moveq.l    #16,d0
[0006c198] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c19e] 2068 023c                 movea.l    572(a0),a0
[0006c1a2] c068 000e                 and.w      14(a0),d0
[0006c1a6] 6726                      beq.s      A_exdialog_2
[0006c1a8] 2f39 000e 692a            move.l     _globl,-(a7)
[0006c1ae] 486f 001e                 pea.l      30(a7)
[0006c1b2] 486f 0020                 pea.l      32(a7)
[0006c1b6] 486f 0022                 pea.l      34(a7)
[0006c1ba] 43ef 0024                 lea.l      36(a7),a1
[0006c1be] 206f 0056                 movea.l    86(a7),a0
[0006c1c2] 4eb9 0007 a218            jsr        mt_form_center
[0006c1c8] 4fef 0010                 lea.l      16(a7),a7
[0006c1cc] 6054                      bra.s      A_exdialog_3
A_exdialog_2:
[0006c1ce] 2f39 000e 692a            move.l     _globl,-(a7)
[0006c1d4] 486f 0006                 pea.l      6(a7)
[0006c1d8] 486f 000a                 pea.l      10(a7)
[0006c1dc] 43ef 004c                 lea.l      76(a7),a1
[0006c1e0] 41ef 004e                 lea.l      78(a7),a0
[0006c1e4] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0006c1ea] 4fef 000c                 lea.l      12(a7),a7
[0006c1ee] 026f ffc0 0042            andi.w     #$FFC0,66(a7)
[0006c1f4] 026f ffc0 0040            andi.w     #$FFC0,64(a7)
[0006c1fa] 302f 0042                 move.w     66(a7),d0
[0006c1fe] 206f 0046                 movea.l    70(a7),a0
[0006c202] 3228 0014                 move.w     20(a0),d1
[0006c206] e241                      asr.w      #1,d1
[0006c208] 9041                      sub.w      d1,d0
[0006c20a] 3f40 0014                 move.w     d0,20(a7)
[0006c20e] 302f 0040                 move.w     64(a7),d0
[0006c212] 206f 0046                 movea.l    70(a7),a0
[0006c216] 3228 0016                 move.w     22(a0),d1
[0006c21a] e241                      asr.w      #1,d1
[0006c21c] 9041                      sub.w      d1,d0
[0006c21e] 3f40 0016                 move.w     d0,22(a7)
A_exdialog_3:
[0006c222] 601c                      bra.s      A_exdialog_4
A_exdialog_1:
[0006c224] 70f8                      moveq.l    #-8,d0
[0006c226] 206f 0046                 movea.l    70(a7),a0
[0006c22a] d068 0010                 add.w      16(a0),d0
[0006c22e] 3f40 0014                 move.w     d0,20(a7)
[0006c232] 70f8                      moveq.l    #-8,d0
[0006c234] 206f 0046                 movea.l    70(a7),a0
[0006c238] d068 0012                 add.w      18(a0),d0
[0006c23c] 3f40 0016                 move.w     d0,22(a7)
A_exdialog_4:
[0006c240] 7008                      moveq.l    #8,d0
[0006c242] 206f 0046                 movea.l    70(a7),a0
[0006c246] d068 0014                 add.w      20(a0),d0
[0006c24a] 3f40 0018                 move.w     d0,24(a7)
[0006c24e] 7008                      moveq.l    #8,d0
[0006c250] 206f 0046                 movea.l    70(a7),a0
[0006c254] d068 0016                 add.w      22(a0),d0
[0006c258] 3f40 001a                 move.w     d0,26(a7)
[0006c25c] 5279 000e 1fca            addq.w     #1,a_dialog_active
[0006c262] 7003                      moveq.l    #3,d0
[0006c264] 4eb9 0005 ae7e            jsr        Awi_update
[0006c26a] 4240                      clr.w      d0
[0006c26c] 4eb9 0005 7f1c            jsr        Awi_show_menu
[0006c272] 6000 02a0                 bra        A_exdialog_5
[0006c276] 2279 0010 ee4e            movea.l    ACSblk,a1
A_exdialog_16:
[0006c27c] 5049                      addq.w     #8,a1
[0006c27e] 41ef 0014                 lea.l      20(a7),a0
[0006c282] 4eb9 0006 c5b6            jsr        fitin
[0006c288] 7004                      moveq.l    #4,d0
[0006c28a] d06f 0014                 add.w      20(a7),d0
[0006c28e] 206f 0046                 movea.l    70(a7),a0
[0006c292] 3140 0010                 move.w     d0,16(a0)
[0006c296] 7004                      moveq.l    #4,d0
[0006c298] d06f 0016                 add.w      22(a7),d0
[0006c29c] 206f 0046                 movea.l    70(a7),a0
[0006c2a0] 3140 0012                 move.w     d0,18(a0)
[0006c2a4] 41ef 0014                 lea.l      20(a7),a0
[0006c2a8] 4eb9 0005 009c            jsr        Aob_save
[0006c2ae] 2f48 0008                 move.l     a0,8(a7)
[0006c2b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c2b8] 3f28 000e                 move.w     14(a0),-(a7)
[0006c2bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c2c2] 3f28 000c                 move.w     12(a0),-(a7)
[0006c2c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c2cc] 3f28 000a                 move.w     10(a0),-(a7)
[0006c2d0] 2279 000e 692a            movea.l    _globl,a1
[0006c2d6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c2dc] 3428 0008                 move.w     8(a0),d2
[0006c2e0] 7206                      moveq.l    #6,d1
[0006c2e2] 4240                      clr.w      d0
[0006c2e4] 206f 004c                 movea.l    76(a7),a0
[0006c2e8] 4eb9 0007 9c0c            jsr        mt_objc_draw
[0006c2ee] 5c4f                      addq.w     #6,a7
[0006c2f0] 426f 0006                 clr.w      6(a7)
[0006c2f4] 6000 0156                 bra        A_exdialog_6
[0006c2f8] 43d7                      lea.l      (a7),a1
A_exdialog_12:
[0006c2fa] 206f 0046                 movea.l    70(a7),a0
[0006c2fe] 6100 f69a                 bsr        Aform_do
[0006c302] 3f40 0006                 move.w     d0,6(a7)
[0006c306] 322f 0006                 move.w     6(a7),d1
[0006c30a] 48c1                      ext.l      d1
[0006c30c] 2001                      move.l     d1,d0
[0006c30e] d080                      add.l      d0,d0
[0006c310] d081                      add.l      d1,d0
[0006c312] e788                      lsl.l      #3,d0
[0006c314] 206f 0046                 movea.l    70(a7),a0
[0006c318] 3030 0808                 move.w     8(a0,d0.l),d0
[0006c31c] c07c 2000                 and.w      #$2000,d0
[0006c320] 6704                      beq.s      A_exdialog_7
[0006c322] 6000 012c                 bra        A_exdialog_8
A_exdialog_7:
[0006c326] 322f 0006                 move.w     6(a7),d1
[0006c32a] 48c1                      ext.l      d1
[0006c32c] 2001                      move.l     d1,d0
[0006c32e] d080                      add.l      d0,d0
[0006c330] d081                      add.l      d1,d0
[0006c332] e788                      lsl.l      #3,d0
[0006c334] 206f 0046                 movea.l    70(a7),a0
[0006c338] 41f0 0818                 lea.l      24(a0,d0.l),a0
[0006c33c] 2f48 001c                 move.l     a0,28(a7)
[0006c340] 7020                      moveq.l    #32,d0
[0006c342] 342f 0006                 move.w     6(a7),d2
[0006c346] 48c2                      ext.l      d2
[0006c348] 2202                      move.l     d2,d1
[0006c34a] d281                      add.l      d1,d1
[0006c34c] d282                      add.l      d2,d1
[0006c34e] e789                      lsl.l      #3,d1
[0006c350] 206f 0046                 movea.l    70(a7),a0
[0006c354] c070 1808                 and.w      8(a0,d1.l),d0
[0006c358] 6600 00d0                 bne        A_exdialog_9
[0006c35c] 206f 001c                 movea.l    28(a7),a0
[0006c360] 3028 0008                 move.w     8(a0),d0
[0006c364] c07c 8000                 and.w      #$8000,d0
[0006c368] 6700 00c0                 beq        A_exdialog_9
[0006c36c] 206f 001c                 movea.l    28(a7),a0
[0006c370] 2010                      move.l     (a0),d0
[0006c372] 6700 00b6                 beq        A_exdialog_9
[0006c376] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c37c] 216f 0046 025c            move.l     70(a7),604(a0)
[0006c382] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c388] 316f 0006 0260            move.w     6(a7),608(a0)
[0006c38e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c394] 4268 0268                 clr.w      616(a0)
[0006c398] 206f 001c                 movea.l    28(a7),a0
[0006c39c] 2050                      movea.l    (a0),a0
[0006c39e] 4e90                      jsr        (a0)
[0006c3a0] 7001                      moveq.l    #1,d0
[0006c3a2] 342f 0006                 move.w     6(a7),d2
[0006c3a6] 48c2                      ext.l      d2
[0006c3a8] 2202                      move.l     d2,d1
[0006c3aa] d281                      add.l      d1,d1
[0006c3ac] d282                      add.l      d2,d1
[0006c3ae] e789                      lsl.l      #3,d1
[0006c3b0] 206f 0046                 movea.l    70(a7),a0
[0006c3b4] c070 1808                 and.w      8(a0,d1.l),d0
[0006c3b8] 6760                      beq.s      A_exdialog_10
[0006c3ba] 7040                      moveq.l    #64,d0
[0006c3bc] 342f 0006                 move.w     6(a7),d2
[0006c3c0] 48c2                      ext.l      d2
[0006c3c2] 2202                      move.l     d2,d1
[0006c3c4] d281                      add.l      d1,d1
[0006c3c6] d282                      add.l      d2,d1
[0006c3c8] e789                      lsl.l      #3,d1
[0006c3ca] 206f 0046                 movea.l    70(a7),a0
[0006c3ce] c070 1808                 and.w      8(a0,d1.l),d0
[0006c3d2] 6646                      bne.s      A_exdialog_10
[0006c3d4] 7001                      moveq.l    #1,d0
[0006c3d6] 342f 0006                 move.w     6(a7),d2
[0006c3da] 48c2                      ext.l      d2
[0006c3dc] 2202                      move.l     d2,d1
[0006c3de] d281                      add.l      d1,d1
[0006c3e0] d282                      add.l      d2,d1
[0006c3e2] e789                      lsl.l      #3,d1
[0006c3e4] 206f 0046                 movea.l    70(a7),a0
[0006c3e8] c070 180a                 and.w      10(a0,d1.l),d0
[0006c3ec] 672c                      beq.s      A_exdialog_10
[0006c3ee] 342f 0006                 move.w     6(a7),d2
[0006c3f2] 48c2                      ext.l      d2
[0006c3f4] 2002                      move.l     d2,d0
[0006c3f6] d080                      add.l      d0,d0
[0006c3f8] d082                      add.l      d2,d0
[0006c3fa] e788                      lsl.l      #3,d0
[0006c3fc] 206f 0046                 movea.l    70(a7),a0
[0006c400] 3230 080a                 move.w     10(a0,d0.l),d1
[0006c404] c27c fffe                 and.w      #$FFFE,d1
[0006c408] 302f 0006                 move.w     6(a7),d0
[0006c40c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c412] 2068 0258                 movea.l    600(a0),a0
[0006c416] 6100 f46a                 bsr        dia_obchange
A_exdialog_10:
[0006c41a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c420] 3028 0268                 move.w     616(a0),d0
[0006c424] 6702                      beq.s      A_exdialog_11
[0006c426] 6028                      bra.s      A_exdialog_8
A_exdialog_11:
[0006c428] 6022                      bra.s      A_exdialog_6
A_exdialog_9:
[0006c42a] 322f 0006                 move.w     6(a7),d1
[0006c42e] 48c1                      ext.l      d1
[0006c430] 2001                      move.l     d1,d0
[0006c432] d080                      add.l      d0,d0
[0006c434] d081                      add.l      d1,d0
[0006c436] e788                      lsl.l      #3,d0
[0006c438] 206f 0046                 movea.l    70(a7),a0
[0006c43c] 3030 0808                 move.w     8(a0,d0.l),d0
[0006c440] c07c 2047                 and.w      #$2047,d0
[0006c444] b07c 0040                 cmp.w      #$0040,d0
[0006c448] 6702                      beq.s      A_exdialog_6
[0006c44a] 6004                      bra.s      A_exdialog_8
A_exdialog_6:
[0006c44c] 6000 feaa                 bra        A_exdialog_12
A_exdialog_8:
[0006c450] 322f 0006                 move.w     6(a7),d1
[0006c454] 48c1                      ext.l      d1
[0006c456] 2001                      move.l     d1,d0
[0006c458] d080                      add.l      d0,d0
[0006c45a] d081                      add.l      d1,d0
[0006c45c] e788                      lsl.l      #3,d0
[0006c45e] 206f 0046                 movea.l    70(a7),a0
[0006c462] 0270 fffe 080a            andi.w     #$FFFE,10(a0,d0.l)
[0006c468] 43ef 0014                 lea.l      20(a7),a1
[0006c46c] 206f 0008                 movea.l    8(a7),a0
[0006c470] 4eb9 0005 021e            jsr        Aob_restore
[0006c476] 302f 0006                 move.w     6(a7),d0
[0006c47a] 6612                      bne.s      A_exdialog_13
[0006c47c] 206f 0046                 movea.l    70(a7),a0
[0006c480] 3028 000a                 move.w     10(a0),d0
[0006c484] c07c 4000                 and.w      #$4000,d0
[0006c488] 6704                      beq.s      A_exdialog_13
[0006c48a] 6000 008c                 bra        A_exdialog_14
A_exdialog_13:
[0006c48e] 322f 0006                 move.w     6(a7),d1
[0006c492] 48c1                      ext.l      d1
[0006c494] 2001                      move.l     d1,d0
[0006c496] d080                      add.l      d0,d0
[0006c498] d081                      add.l      d1,d0
[0006c49a] e788                      lsl.l      #3,d0
[0006c49c] 206f 0046                 movea.l    70(a7),a0
[0006c4a0] 3030 0808                 move.w     8(a0,d0.l),d0
[0006c4a4] c07c 2000                 and.w      #$2000,d0
[0006c4a8] 6602                      bne.s      A_exdialog_15
[0006c4aa] 606c                      bra.s      A_exdialog_14
A_exdialog_15:
[0006c4ac] 2f39 000e 692a            move.l     _globl,-(a7)
[0006c4b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c4b8] 3f28 000e                 move.w     14(a0),-(a7)
[0006c4bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c4c2] 3f28 000c                 move.w     12(a0),-(a7)
[0006c4c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c4cc] 3f28 000a                 move.w     10(a0),-(a7)
[0006c4d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c4d6] 3f28 0008                 move.w     8(a0),-(a7)
[0006c4da] 206f 0052                 movea.l    82(a7),a0
[0006c4de] 3f28 0012                 move.w     18(a0),-(a7)
[0006c4e2] 43ef 0024                 lea.l      36(a7),a1
[0006c4e6] 41ef 0022                 lea.l      34(a7),a0
[0006c4ea] 246f 0054                 movea.l    84(a7),a2
[0006c4ee] 342a 0010                 move.w     16(a2),d2
[0006c4f2] 246f 0054                 movea.l    84(a7),a2
[0006c4f6] 322a 0016                 move.w     22(a2),d1
[0006c4fa] 246f 0054                 movea.l    84(a7),a2
[0006c4fe] 302a 0014                 move.w     20(a2),d0
[0006c502] 4eb9 0007 a6ce            jsr        mt_graf_dragbox
[0006c508] 4fef 000e                 lea.l      14(a7),a7
[0006c50c] 596f 0014                 subq.w     #4,20(a7)
[0006c510] 596f 0016                 subq.w     #4,22(a7)
A_exdialog_5:
[0006c514] 6000 fd60                 bra        A_exdialog_16
A_exdialog_14:
[0006c518] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c51e] 4268 0268                 clr.w      616(a0)
[0006c522] 7002                      moveq.l    #2,d0
[0006c524] 4eb9 0005 ae7e            jsr        Awi_update
[0006c52a] 5379 000e 1fca            subq.w     #1,a_dialog_active
[0006c530] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c536] 2068 0258                 movea.l    600(a0),a0
[0006c53a] 216f 0024 006a            move.l     36(a7),106(a0)
[0006c540] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c546] 2068 0258                 movea.l    600(a0),a0
[0006c54a] 216f 0020 0066            move.l     32(a7),102(a0)
[0006c550] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c556] 2068 0258                 movea.l    600(a0),a0
[0006c55a] 316f 0004 0056            move.w     4(a7),86(a0)
[0006c560] 7008                      moveq.l    #8,d0
[0006c562] 43ef 000c                 lea.l      12(a7),a1
[0006c566] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c56c] 2068 0258                 movea.l    600(a0),a0
[0006c570] 41e8 0034                 lea.l      52(a0),a0
[0006c574] 4eb9 0008 3500            jsr        memcpy
[0006c57a] 41ef 0028                 lea.l      40(a7),a0
[0006c57e] 6100 fa8a                 bsr        Act_restore
[0006c582] 7001                      moveq.l    #1,d0
[0006c584] 4eb9 0005 7f1c            jsr        Awi_show_menu
[0006c58a] 302f 0006                 move.w     6(a7),d0
[0006c58e] 4fef 004a                 lea.l      74(a7),a7
[0006c592] 245f                      movea.l    (a7)+,a2
[0006c594] 4e75                      rts

A_dialog:
[0006c596] 594f                      subq.w     #4,a7
[0006c598] 2e88                      move.l     a0,(a7)
[0006c59a] 7001                      moveq.l    #1,d0
[0006c59c] 2057                      movea.l    (a7),a0
[0006c59e] 6100 fae6                 bsr        A_exdialog
[0006c5a2] 584f                      addq.w     #4,a7
[0006c5a4] 4e75                      rts

A_dialog2:
[0006c5a6] 594f                      subq.w     #4,a7
[0006c5a8] 2e88                      move.l     a0,(a7)
[0006c5aa] 4240                      clr.w      d0
[0006c5ac] 2057                      movea.l    (a7),a0
[0006c5ae] 6100 fad6                 bsr        A_exdialog
[0006c5b2] 584f                      addq.w     #4,a7
[0006c5b4] 4e75                      rts

fitin:
[0006c5b6] 514f                      subq.w     #8,a7
[0006c5b8] 2f48 0004                 move.l     a0,4(a7)
[0006c5bc] 2e89                      move.l     a1,(a7)
[0006c5be] 206f 0004                 movea.l    4(a7),a0
[0006c5c2] 3010                      move.w     (a0),d0
[0006c5c4] 2057                      movea.l    (a7),a0
[0006c5c6] b050                      cmp.w      (a0),d0
[0006c5c8] 6c08                      bge.s      fitin_1
[0006c5ca] 2057                      movea.l    (a7),a0
[0006c5cc] 226f 0004                 movea.l    4(a7),a1
[0006c5d0] 3290                      move.w     (a0),(a1)
fitin_1:
[0006c5d2] 206f 0004                 movea.l    4(a7),a0
[0006c5d6] 3028 0002                 move.w     2(a0),d0
[0006c5da] 2057                      movea.l    (a7),a0
[0006c5dc] b068 0002                 cmp.w      2(a0),d0
[0006c5e0] 6c0c                      bge.s      fitin_2
[0006c5e2] 2057                      movea.l    (a7),a0
[0006c5e4] 226f 0004                 movea.l    4(a7),a1
[0006c5e8] 3368 0002 0002            move.w     2(a0),2(a1)
fitin_2:
[0006c5ee] 206f 0004                 movea.l    4(a7),a0
[0006c5f2] 3010                      move.w     (a0),d0
[0006c5f4] 206f 0004                 movea.l    4(a7),a0
[0006c5f8] d068 0004                 add.w      4(a0),d0
[0006c5fc] 2057                      movea.l    (a7),a0
[0006c5fe] 3210                      move.w     (a0),d1
[0006c600] 2057                      movea.l    (a7),a0
[0006c602] d268 0004                 add.w      4(a0),d1
[0006c606] b041                      cmp.w      d1,d0
[0006c608] 6f18                      ble.s      fitin_3
[0006c60a] 2057                      movea.l    (a7),a0
[0006c60c] 3010                      move.w     (a0),d0
[0006c60e] 2057                      movea.l    (a7),a0
[0006c610] d068 0004                 add.w      4(a0),d0
[0006c614] 206f 0004                 movea.l    4(a7),a0
[0006c618] 9068 0004                 sub.w      4(a0),d0
[0006c61c] 206f 0004                 movea.l    4(a7),a0
[0006c620] 3080                      move.w     d0,(a0)
fitin_3:
[0006c622] 206f 0004                 movea.l    4(a7),a0
[0006c626] 3028 0002                 move.w     2(a0),d0
[0006c62a] 206f 0004                 movea.l    4(a7),a0
[0006c62e] d068 0006                 add.w      6(a0),d0
[0006c632] 2057                      movea.l    (a7),a0
[0006c634] 3228 0002                 move.w     2(a0),d1
[0006c638] 2057                      movea.l    (a7),a0
[0006c63a] d268 0006                 add.w      6(a0),d1
[0006c63e] b041                      cmp.w      d1,d0
[0006c640] 6f1c                      ble.s      fitin_4
[0006c642] 2057                      movea.l    (a7),a0
[0006c644] 3028 0002                 move.w     2(a0),d0
[0006c648] 2057                      movea.l    (a7),a0
[0006c64a] d068 0006                 add.w      6(a0),d0
[0006c64e] 206f 0004                 movea.l    4(a7),a0
[0006c652] 9068 0006                 sub.w      6(a0),d0
[0006c656] 206f 0004                 movea.l    4(a7),a0
[0006c65a] 3140 0002                 move.w     d0,2(a0)
fitin_4:
[0006c65e] 504f                      addq.w     #8,a7
[0006c660] 4e75                      rts

intersect:
[0006c662] 4fef fff4                 lea.l      -12(a7),a7
[0006c666] 2f48 0008                 move.l     a0,8(a7)
[0006c66a] 2f49 0004                 move.l     a1,4(a7)
[0006c66e] 206f 0008                 movea.l    8(a7),a0
[0006c672] 3010                      move.w     (a0),d0
[0006c674] 206f 0008                 movea.l    8(a7),a0
[0006c678] d068 0004                 add.w      4(a0),d0
[0006c67c] 206f 0004                 movea.l    4(a7),a0
[0006c680] 3210                      move.w     (a0),d1
[0006c682] 206f 0004                 movea.l    4(a7),a0
[0006c686] d268 0004                 add.w      4(a0),d1
[0006c68a] b041                      cmp.w      d1,d0
[0006c68c] 6c10                      bge.s      intersect_1
[0006c68e] 206f 0008                 movea.l    8(a7),a0
[0006c692] 3010                      move.w     (a0),d0
[0006c694] 206f 0008                 movea.l    8(a7),a0
[0006c698] d068 0004                 add.w      4(a0),d0
[0006c69c] 600e                      bra.s      intersect_2
intersect_1:
[0006c69e] 206f 0004                 movea.l    4(a7),a0
[0006c6a2] 3010                      move.w     (a0),d0
[0006c6a4] 206f 0004                 movea.l    4(a7),a0
[0006c6a8] d068 0004                 add.w      4(a0),d0
intersect_2:
[0006c6ac] 3f40 0002                 move.w     d0,2(a7)
[0006c6b0] 206f 0008                 movea.l    8(a7),a0
[0006c6b4] 3028 0002                 move.w     2(a0),d0
[0006c6b8] 206f 0008                 movea.l    8(a7),a0
[0006c6bc] d068 0006                 add.w      6(a0),d0
[0006c6c0] 206f 0004                 movea.l    4(a7),a0
[0006c6c4] 3228 0002                 move.w     2(a0),d1
[0006c6c8] 206f 0004                 movea.l    4(a7),a0
[0006c6cc] d268 0006                 add.w      6(a0),d1
[0006c6d0] b041                      cmp.w      d1,d0
[0006c6d2] 6c12                      bge.s      intersect_3
[0006c6d4] 206f 0008                 movea.l    8(a7),a0
[0006c6d8] 3028 0002                 move.w     2(a0),d0
[0006c6dc] 206f 0008                 movea.l    8(a7),a0
[0006c6e0] d068 0006                 add.w      6(a0),d0
[0006c6e4] 6010                      bra.s      intersect_4
intersect_3:
[0006c6e6] 206f 0004                 movea.l    4(a7),a0
[0006c6ea] 3028 0002                 move.w     2(a0),d0
[0006c6ee] 206f 0004                 movea.l    4(a7),a0
[0006c6f2] d068 0006                 add.w      6(a0),d0
intersect_4:
[0006c6f6] 3e80                      move.w     d0,(a7)
[0006c6f8] 206f 0008                 movea.l    8(a7),a0
[0006c6fc] 3010                      move.w     (a0),d0
[0006c6fe] 206f 0004                 movea.l    4(a7),a0
[0006c702] b050                      cmp.w      (a0),d0
[0006c704] 6f08                      ble.s      intersect_5
[0006c706] 206f 0008                 movea.l    8(a7),a0
[0006c70a] 3010                      move.w     (a0),d0
[0006c70c] 6006                      bra.s      intersect_6
intersect_5:
[0006c70e] 206f 0004                 movea.l    4(a7),a0
[0006c712] 3010                      move.w     (a0),d0
intersect_6:
[0006c714] 206f 0008                 movea.l    8(a7),a0
[0006c718] 3080                      move.w     d0,(a0)
[0006c71a] 206f 0008                 movea.l    8(a7),a0
[0006c71e] 3028 0002                 move.w     2(a0),d0
[0006c722] 206f 0004                 movea.l    4(a7),a0
[0006c726] b068 0002                 cmp.w      2(a0),d0
[0006c72a] 6f0a                      ble.s      intersect_7
[0006c72c] 206f 0008                 movea.l    8(a7),a0
[0006c730] 3028 0002                 move.w     2(a0),d0
[0006c734] 6008                      bra.s      intersect_8
intersect_7:
[0006c736] 206f 0004                 movea.l    4(a7),a0
[0006c73a] 3028 0002                 move.w     2(a0),d0
intersect_8:
[0006c73e] 206f 0008                 movea.l    8(a7),a0
[0006c742] 3140 0002                 move.w     d0,2(a0)
[0006c746] 302f 0002                 move.w     2(a7),d0
[0006c74a] 206f 0008                 movea.l    8(a7),a0
[0006c74e] 9050                      sub.w      (a0),d0
[0006c750] 206f 0008                 movea.l    8(a7),a0
[0006c754] 3140 0004                 move.w     d0,4(a0)
[0006c758] 3017                      move.w     (a7),d0
[0006c75a] 206f 0008                 movea.l    8(a7),a0
[0006c75e] 9068 0002                 sub.w      2(a0),d0
[0006c762] 206f 0008                 movea.l    8(a7),a0
[0006c766] 3140 0006                 move.w     d0,6(a0)
[0006c76a] 206f 0008                 movea.l    8(a7),a0
[0006c76e] 3028 0004                 move.w     4(a0),d0
[0006c772] 6f0a                      ble.s      intersect_9
[0006c774] 206f 0008                 movea.l    8(a7),a0
[0006c778] 3028 0006                 move.w     6(a0),d0
[0006c77c] 6e18                      bgt.s      intersect_10
intersect_9:
[0006c77e] 4240                      clr.w      d0
[0006c780] 206f 0008                 movea.l    8(a7),a0
[0006c784] 3140 0006                 move.w     d0,6(a0)
[0006c788] 206f 0008                 movea.l    8(a7),a0
[0006c78c] 3140 0004                 move.w     d0,4(a0)
[0006c790] 4240                      clr.w      d0
[0006c792] 6006                      bra.s      intersect_11
[0006c794] 6004                      bra.s      intersect_11
intersect_10:
[0006c796] 7001                      moveq.l    #1,d0
[0006c798] 4e71                      nop
intersect_11:
[0006c79a] 4fef 000c                 lea.l      12(a7),a7
[0006c79e] 4e75                      rts

xywh2array:
[0006c7a0] 514f                      subq.w     #8,a7
[0006c7a2] 2f48 0004                 move.l     a0,4(a7)
[0006c7a6] 2e89                      move.l     a1,(a7)
[0006c7a8] 2057                      movea.l    (a7),a0
[0006c7aa] 226f 0004                 movea.l    4(a7),a1
[0006c7ae] 54af 0004                 addq.l     #2,4(a7)
[0006c7b2] 3290                      move.w     (a0),(a1)
[0006c7b4] 2057                      movea.l    (a7),a0
[0006c7b6] 226f 0004                 movea.l    4(a7),a1
[0006c7ba] 54af 0004                 addq.l     #2,4(a7)
[0006c7be] 32a8 0002                 move.w     2(a0),(a1)
[0006c7c2] 2057                      movea.l    (a7),a0
[0006c7c4] 3010                      move.w     (a0),d0
[0006c7c6] 2057                      movea.l    (a7),a0
[0006c7c8] d068 0004                 add.w      4(a0),d0
[0006c7cc] 5340                      subq.w     #1,d0
[0006c7ce] 206f 0004                 movea.l    4(a7),a0
[0006c7d2] 54af 0004                 addq.l     #2,4(a7)
[0006c7d6] 3080                      move.w     d0,(a0)
[0006c7d8] 2057                      movea.l    (a7),a0
[0006c7da] 3028 0002                 move.w     2(a0),d0
[0006c7de] 2057                      movea.l    (a7),a0
[0006c7e0] d068 0006                 add.w      6(a0),d0
[0006c7e4] 5340                      subq.w     #1,d0
[0006c7e6] 206f 0004                 movea.l    4(a7),a0
[0006c7ea] 3080                      move.w     d0,(a0)
[0006c7ec] 504f                      addq.w     #8,a7
[0006c7ee] 4e75                      rts

array2xywh:
[0006c7f0] 514f                      subq.w     #8,a7
[0006c7f2] 2f48 0004                 move.l     a0,4(a7)
[0006c7f6] 2e89                      move.l     a1,(a7)
[0006c7f8] 2057                      movea.l    (a7),a0
[0006c7fa] 226f 0004                 movea.l    4(a7),a1
[0006c7fe] 3290                      move.w     (a0),(a1)
[0006c800] 2057                      movea.l    (a7),a0
[0006c802] 226f 0004                 movea.l    4(a7),a1
[0006c806] 3368 0002 0002            move.w     2(a0),2(a1)
[0006c80c] 2057                      movea.l    (a7),a0
[0006c80e] 3028 0004                 move.w     4(a0),d0
[0006c812] 206f 0004                 movea.l    4(a7),a0
[0006c816] 9050                      sub.w      (a0),d0
[0006c818] 5240                      addq.w     #1,d0
[0006c81a] 206f 0004                 movea.l    4(a7),a0
[0006c81e] 3140 0004                 move.w     d0,4(a0)
[0006c822] 2057                      movea.l    (a7),a0
[0006c824] 3028 0006                 move.w     6(a0),d0
[0006c828] 206f 0004                 movea.l    4(a7),a0
[0006c82c] 9068 0002                 sub.w      2(a0),d0
[0006c830] 5240                      addq.w     #1,d0
[0006c832] 206f 0004                 movea.l    4(a7),a0
[0006c836] 3140 0006                 move.w     d0,6(a0)
[0006c83a] 504f                      addq.w     #8,a7
[0006c83c] 4e75                      rts

scrp_chg:
[0006c83e] 4fef ffe0                 lea.l      -32(a7),a7
[0006c842] 3f40 001e                 move.w     d0,30(a7)
[0006c846] 41f9 000e 1fcc            lea.l      $000E1FCC,a0
[0006c84c] 43ef 000e                 lea.l      14(a7),a1
[0006c850] 700f                      moveq.l    #15,d0
[0006c852] 12d8                      move.b     (a0)+,(a1)+
scrp_chg_1:
[0006c854] 51c8 fffc                 dbf        d0,scrp_chg_1
[0006c858] 3f7c ffff 000a            move.w     #$FFFF,10(a7)
[0006c85e] 3f7c 0050 000e            move.w     #$0050,14(a7)
[0006c864] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c86a] 3f50 0012                 move.w     (a0),18(a7)
[0006c86e] 70ff                      moveq.l    #-1,d0
[0006c870] 41ef 000e                 lea.l      14(a7),a0
[0006c874] 4eb9 0005 dc8e            jsr        Ash_sendall
[0006c87a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c880] 2068 0280                 movea.l    640(a0),a0
[0006c884] 0c50 0400                 cmpi.w     #$0400,(a0)
[0006c888] 6c0a                      bge.s      scrp_chg_2
[0006c88a] 0c79 0200 0010 f55c       cmpi.w     #$0200,_ACSv_magix
[0006c892] 6d28                      blt.s      scrp_chg_3
scrp_chg_2:
[0006c894] 2f39 000e 692a            move.l     _globl,-(a7)
[0006c89a] 486f 000e                 pea.l      14(a7)
[0006c89e] 43ef 0014                 lea.l      20(a7),a1
[0006c8a2] 41ef 0008                 lea.l      8(a7),a0
[0006c8a6] 7002                      moveq.l    #2,d0
[0006c8a8] 4eb9 0007 8cd2            jsr        mt_appl_search
[0006c8ae] 504f                      addq.w     #8,a7
[0006c8b0] 4a40                      tst.w      d0
[0006c8b2] 6606                      bne.s      scrp_chg_4
[0006c8b4] 3f7c ffff 000a            move.w     #$FFFF,10(a7)
scrp_chg_4:
[0006c8ba] 6010                      bra.s      scrp_chg_5
scrp_chg_3:
[0006c8bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c8c2] 3028 0238                 move.w     568(a0),d0
[0006c8c6] 6604                      bne.s      scrp_chg_5
[0006c8c8] 426f 000a                 clr.w      10(a7)
scrp_chg_5:
[0006c8cc] 302f 000a                 move.w     10(a7),d0
[0006c8d0] 6b22                      bmi.s      scrp_chg_6
[0006c8d2] 3f7c 0048 000e            move.w     #$0048,14(a7)
[0006c8d8] 3f6f 001e 0014            move.w     30(a7),20(a7)
[0006c8de] 2279 000e 692a            movea.l    _globl,a1
[0006c8e4] 41ef 000e                 lea.l      14(a7),a0
[0006c8e8] 7210                      moveq.l    #16,d1
[0006c8ea] 302f 000a                 move.w     10(a7),d0
[0006c8ee] 4eb9 0007 8ae8            jsr        mt_appl_write
scrp_chg_6:
[0006c8f4] 91c8                      suba.l     a0,a0
[0006c8f6] 701c                      moveq.l    #28,d0
[0006c8f8] 4eb9 0005 6a20            jsr        Awi_sendall
[0006c8fe] 4fef 0020                 lea.l      32(a7),a7
[0006c902] 4e75                      rts

Ascrp_clear:
[0006c904] 4fef fe74                 lea.l      -396(a7),a7
[0006c908] 2f48 0188                 move.l     a0,392(a7)
[0006c90c] 41f9 000e 1fdc            lea.l      $000E1FDC,a0
[0006c912] 43ef 0108                 lea.l      264(a7),a1
[0006c916] 707f                      moveq.l    #127,d0
[0006c918] 12d8                      move.b     (a0)+,(a1)+
Ascrp_clear_1:
[0006c91a] 51c8 fffc                 dbf        d0,Ascrp_clear_1
[0006c91e] 4297                      clr.l      (a7)
[0006c920] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c926] 1028 0356                 move.b     854(a0),d0
[0006c92a] 6700 00fa                 beq        Ascrp_clear_2
[0006c92e] 4eb9 0004 eec0            jsr        Amo_busy
[0006c934] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006c93a] 41e8 0356                 lea.l      854(a0),a0
[0006c93e] 4eb9 0004 b548            jsr        Af_2drv
[0006c944] d12f 0108                 add.b      d0,264(a7)
[0006c948] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006c94e] 43e9 0356                 lea.l      854(a1),a1
[0006c952] 41ef 010a                 lea.l      266(a7),a0
[0006c956] 4eb9 0004 b586            jsr        Af_2path
[0006c95c] 41ef 0108                 lea.l      264(a7),a0
[0006c960] 4eb9 0004 bfa2            jsr        Af_readdir
[0006c966] 2e88                      move.l     a0,(a7)
[0006c968] 2f48 0004                 move.l     a0,4(a7)
[0006c96c] 202f 0004                 move.l     4(a7),d0
[0006c970] 6700 00ae                 beq        Ascrp_clear_3
[0006c974] 6000 008c                 bra        Ascrp_clear_4
[0006c978] 206f 0004                 movea.l    4(a7),a0
Ascrp_clear_10:
[0006c97c] 2250                      movea.l    (a0),a1
[0006c97e] 41ef 0088                 lea.l      136(a7),a0
[0006c982] 4eb9 0004 b66e            jsr        Af_2name
[0006c988] 4eb9 0004 64da            jsr        Ast_toupper
[0006c98e] 206f 0004                 movea.l    4(a7),a0
[0006c992] 2250                      movea.l    (a0),a1
[0006c994] 41ef 0008                 lea.l      8(a7),a0
[0006c998] 4eb9 0004 b758            jsr        Af_2ext
[0006c99e] 43f9 000e 20e9            lea.l      $000E20E9,a1
[0006c9a4] 41ef 0088                 lea.l      136(a7),a0
[0006c9a8] 4eb9 0008 322e            jsr        stricmp
[0006c9ae] 4a40                      tst.w      d0
[0006c9b0] 6646                      bne.s      Ascrp_clear_5
[0006c9b2] 202f 0188                 move.l     392(a7),d0
[0006c9b6] 6708                      beq.s      Ascrp_clear_6
[0006c9b8] 206f 0188                 movea.l    392(a7),a0
[0006c9bc] 1010                      move.b     (a0),d0
[0006c9be] 6614                      bne.s      Ascrp_clear_7
Ascrp_clear_6:
[0006c9c0] 206f 0004                 movea.l    4(a7),a0
[0006c9c4] 2050                      movea.l    (a0),a0
[0006c9c6] 4eb9 0008 0ca0            jsr        Fdelete
[0006c9cc] 4a80                      tst.l      d0
[0006c9ce] 6702                      beq.s      Ascrp_clear_8
[0006c9d0] 6038                      bra.s      Ascrp_clear_9
Ascrp_clear_8:
[0006c9d2] 6024                      bra.s      Ascrp_clear_5
Ascrp_clear_7:
[0006c9d4] 226f 0188                 movea.l    392(a7),a1
[0006c9d8] 41ef 0008                 lea.l      8(a7),a0
[0006c9dc] 4eb9 0008 2eba            jsr        strcmp
[0006c9e2] 4a40                      tst.w      d0
[0006c9e4] 6612                      bne.s      Ascrp_clear_5
[0006c9e6] 206f 0004                 movea.l    4(a7),a0
[0006c9ea] 2050                      movea.l    (a0),a0
[0006c9ec] 4eb9 0008 0ca0            jsr        Fdelete
[0006c9f2] 4a80                      tst.l      d0
[0006c9f4] 6702                      beq.s      Ascrp_clear_5
[0006c9f6] 6012                      bra.s      Ascrp_clear_9
Ascrp_clear_5:
[0006c9f8] 206f 0004                 movea.l    4(a7),a0
[0006c9fc] 2f68 0004 0004            move.l     4(a0),4(a7)
Ascrp_clear_4:
[0006ca02] 202f 0004                 move.l     4(a7),d0
[0006ca06] 6600 ff70                 bne        Ascrp_clear_10
Ascrp_clear_9:
[0006ca0a] 2057                      movea.l    (a7),a0
[0006ca0c] 4eb9 0004 c0a6            jsr        Af_freedir
[0006ca12] 102f 0108                 move.b     264(a7),d0
[0006ca16] 4880                      ext.w      d0
[0006ca18] d07c ffbf                 add.w      #$FFBF,d0
[0006ca1c] 6100 fe20                 bsr        scrp_chg
Ascrp_clear_3:
[0006ca20] 4eb9 0004 ef0c            jsr        Amo_unbusy
Ascrp_clear_2:
[0006ca26] 4fef 018c                 lea.l      396(a7),a7
[0006ca2a] 4e75                      rts

Ascrp_get:
[0006ca2c] 4fef fe6a                 lea.l      -406(a7),a7
[0006ca30] 2f48 0192                 move.l     a0,402(a7)
[0006ca34] 2f49 018e                 move.l     a1,398(a7)
[0006ca38] 41f9 000e 205c            lea.l      $000E205C,a0
[0006ca3e] 43ef 010e                 lea.l      270(a7),a1
[0006ca42] 707f                      moveq.l    #127,d0
[0006ca44] 12d8                      move.b     (a0)+,(a1)+
Ascrp_get_1:
[0006ca46] 51c8 fffc                 dbf        d0,Ascrp_get_1
[0006ca4a] 42af 0002                 clr.l      2(a7)
[0006ca4e] 4257                      clr.w      (a7)
[0006ca50] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ca56] 1028 0356                 move.b     854(a0),d0
[0006ca5a] 6700 01be                 beq        Ascrp_get_2
[0006ca5e] 4eb9 0004 eec0            jsr        Amo_busy
[0006ca64] 202f 0192                 move.l     402(a7),d0
[0006ca68] 670a                      beq.s      Ascrp_get_3
[0006ca6a] 206f 0192                 movea.l    402(a7),a0
[0006ca6e] 4eb9 0004 64da            jsr        Ast_toupper
Ascrp_get_3:
[0006ca74] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006ca7a] 41e8 0356                 lea.l      854(a0),a0
[0006ca7e] 4eb9 0004 b548            jsr        Af_2drv
[0006ca84] d12f 010e                 add.b      d0,270(a7)
[0006ca88] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006ca8e] 43e9 0356                 lea.l      854(a1),a1
[0006ca92] 41ef 0110                 lea.l      272(a7),a0
[0006ca96] 4eb9 0004 b586            jsr        Af_2path
[0006ca9c] 41ef 010e                 lea.l      270(a7),a0
[0006caa0] 4eb9 0004 bfa2            jsr        Af_readdir
[0006caa6] 2f48 0002                 move.l     a0,2(a7)
[0006caaa] 2f48 0006                 move.l     a0,6(a7)
[0006caae] 202f 0006                 move.l     6(a7),d0
[0006cab2] 6700 0160                 beq        Ascrp_get_4
[0006cab6] 6000 007c                 bra.w      Ascrp_get_5
[0006caba] 206f 0006                 movea.l    6(a7),a0
Ascrp_get_10:
[0006cabe] 2250                      movea.l    (a0),a1
[0006cac0] 41ef 008e                 lea.l      142(a7),a0
[0006cac4] 4eb9 0004 b66e            jsr        Af_2name
[0006caca] 4eb9 0004 64da            jsr        Ast_toupper
[0006cad0] 206f 0006                 movea.l    6(a7),a0
[0006cad4] 2250                      movea.l    (a0),a1
[0006cad6] 41ef 000e                 lea.l      14(a7),a0
[0006cada] 4eb9 0004 b758            jsr        Af_2ext
[0006cae0] 4eb9 0004 64da            jsr        Ast_toupper
[0006cae6] 43f9 000e 20ef            lea.l      $000E20EF,a1
[0006caec] 41ef 008e                 lea.l      142(a7),a0
[0006caf0] 4eb9 0004 66ea            jsr        Ast_icmp
[0006caf6] 4a40                      tst.w      d0
[0006caf8] 6630                      bne.s      Ascrp_get_6
[0006cafa] 202f 0192                 move.l     402(a7),d0
[0006cafe] 6712                      beq.s      Ascrp_get_7
[0006cb00] 206f 0192                 movea.l    402(a7),a0
[0006cb04] 1010                      move.b     (a0),d0
[0006cb06] 670a                      beq.s      Ascrp_get_7
[0006cb08] 206f 0192                 movea.l    402(a7),a0
[0006cb0c] 0c10 002a                 cmpi.b     #$2A,(a0)
[0006cb10] 6604                      bne.s      Ascrp_get_8
Ascrp_get_7:
[0006cb12] 6028                      bra.s      Ascrp_get_9
[0006cb14] 6014                      bra.s      Ascrp_get_6
Ascrp_get_8:
[0006cb16] 226f 0192                 movea.l    402(a7),a1
[0006cb1a] 41ef 000e                 lea.l      14(a7),a0
[0006cb1e] 4eb9 0004 66ea            jsr        Ast_icmp
[0006cb24] 4a40                      tst.w      d0
[0006cb26] 6602                      bne.s      Ascrp_get_6
[0006cb28] 6012                      bra.s      Ascrp_get_9
Ascrp_get_6:
[0006cb2a] 206f 0006                 movea.l    6(a7),a0
[0006cb2e] 2f68 0004 0006            move.l     4(a0),6(a7)
Ascrp_get_5:
[0006cb34] 202f 0006                 move.l     6(a7),d0
[0006cb38] 6600 ff80                 bne.w      Ascrp_get_10
Ascrp_get_9:
[0006cb3c] 202f 0006                 move.l     6(a7),d0
[0006cb40] 6700 00c8                 beq        Ascrp_get_11
[0006cb44] 206f 0006                 movea.l    6(a7),a0
[0006cb48] 2050                      movea.l    (a0),a0
[0006cb4a] 4eb9 0004 b8fa            jsr        Af_length
[0006cb50] 206f 019a                 movea.l    410(a7),a0
[0006cb54] 2080                      move.l     d0,(a0)
[0006cb56] 202f 018e                 move.l     398(a7),d0
[0006cb5a] 6608                      bne.s      Ascrp_get_12
[0006cb5c] 3ebc 0001                 move.w     #$0001,(a7)
[0006cb60] 6000 0092                 bra        Ascrp_get_13
Ascrp_get_12:
[0006cb64] 7001                      moveq.l    #1,d0
[0006cb66] 206f 019a                 movea.l    410(a7),a0
[0006cb6a] d090                      add.l      (a0),d0
[0006cb6c] 4eb9 0004 c608            jsr        Ax_malloc
[0006cb72] 226f 018e                 movea.l    398(a7),a1
[0006cb76] 2288                      move.l     a0,(a1)
[0006cb78] 206f 018e                 movea.l    398(a7),a0
[0006cb7c] 2010                      move.l     (a0),d0
[0006cb7e] 6774                      beq.s      Ascrp_get_13
[0006cb80] 4240                      clr.w      d0
[0006cb82] 206f 0006                 movea.l    6(a7),a0
[0006cb86] 2050                      movea.l    (a0),a0
[0006cb88] 4eb9 0008 0cc0            jsr        Fopen
[0006cb8e] 2f40 000a                 move.l     d0,10(a7)
[0006cb92] 202f 000a                 move.l     10(a7),d0
[0006cb96] 6a0e                      bpl.s      Ascrp_get_14
[0006cb98] 206f 018e                 movea.l    398(a7),a0
[0006cb9c] 2050                      movea.l    (a0),a0
[0006cb9e] 4eb9 0004 c7c8            jsr        Ax_free
[0006cba4] 604e                      bra.s      Ascrp_get_13
Ascrp_get_14:
[0006cba6] 206f 019a                 movea.l    410(a7),a0
[0006cbaa] 2f08                      move.l     a0,-(a7)
[0006cbac] 206f 0192                 movea.l    402(a7),a0
[0006cbb0] 2050                      movea.l    (a0),a0
[0006cbb2] 226f 019e                 movea.l    414(a7),a1
[0006cbb6] 2211                      move.l     (a1),d1
[0006cbb8] 302f 0010                 move.w     16(a7),d0
[0006cbbc] 4eb9 0008 0cd2            jsr        Fread
[0006cbc2] 205f                      movea.l    (a7)+,a0
[0006cbc4] b090                      cmp.l      (a0),d0
[0006cbc6] 670e                      beq.s      Ascrp_get_15
[0006cbc8] 206f 018e                 movea.l    398(a7),a0
[0006cbcc] 2050                      movea.l    (a0),a0
[0006cbce] 4eb9 0004 c7c8            jsr        Ax_free
[0006cbd4] 6014                      bra.s      Ascrp_get_16
Ascrp_get_15:
[0006cbd6] 206f 019a                 movea.l    410(a7),a0
[0006cbda] 2010                      move.l     (a0),d0
[0006cbdc] 206f 018e                 movea.l    398(a7),a0
[0006cbe0] 2050                      movea.l    (a0),a0
[0006cbe2] 4230 0800                 clr.b      0(a0,d0.l)
[0006cbe6] 3ebc 0001                 move.w     #$0001,(a7)
Ascrp_get_16:
[0006cbea] 302f 000c                 move.w     12(a7),d0
[0006cbee] 4eb9 0008 0c7e            jsr        Fclose
Ascrp_get_13:
[0006cbf4] 202f 0192                 move.l     402(a7),d0
[0006cbf8] 6710                      beq.s      Ascrp_get_11
[0006cbfa] 206f 0006                 movea.l    6(a7),a0
[0006cbfe] 2250                      movea.l    (a0),a1
[0006cc00] 206f 0192                 movea.l    402(a7),a0
[0006cc04] 4eb9 0004 b758            jsr        Af_2ext
Ascrp_get_11:
[0006cc0a] 206f 0002                 movea.l    2(a7),a0
[0006cc0e] 4eb9 0004 c0a6            jsr        Af_freedir
Ascrp_get_4:
[0006cc14] 4eb9 0004 ef0c            jsr        Amo_unbusy
Ascrp_get_2:
[0006cc1a] 3017                      move.w     (a7),d0
[0006cc1c] 4fef 0196                 lea.l      406(a7),a7
[0006cc20] 4e75                      rts

Ascrp_put:
[0006cc22] 4fef fee8                 lea.l      -280(a7),a7
[0006cc26] 2f48 0114                 move.l     a0,276(a7)
[0006cc2a] 2f49 0110                 move.l     a1,272(a7)
[0006cc2e] 2f40 010c                 move.l     d0,268(a7)
[0006cc32] 3f41 010a                 move.w     d1,266(a7)
[0006cc36] 3ebc 0001                 move.w     #$0001,(a7)
[0006cc3a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006cc40] 1028 0356                 move.b     854(a0),d0
[0006cc44] 6700 0138                 beq        Ascrp_put_1
[0006cc48] 206f 0114                 movea.l    276(a7),a0
[0006cc4c] 1010                      move.b     (a0),d0
[0006cc4e] 6700 012e                 beq        Ascrp_put_1
[0006cc52] 2f2f 0114                 move.l     276(a7),-(a7)
[0006cc56] 4879 000e 20f5            pea.l      $000E20F5
[0006cc5c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006cc62] 43e9 0356                 lea.l      854(a1),a1
[0006cc66] 41ef 0012                 lea.l      18(a7),a0
[0006cc6a] 4eb9 0004 b586            jsr        Af_2path
[0006cc70] 2248                      movea.l    a0,a1
[0006cc72] 2f09                      move.l     a1,-(a7)
[0006cc74] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006cc7a] 41e8 0356                 lea.l      854(a0),a0
[0006cc7e] 4eb9 0004 b548            jsr        Af_2drv
[0006cc84] 41ef 0096                 lea.l      150(a7),a0
[0006cc88] 225f                      movea.l    (a7)+,a1
[0006cc8a] 4eb9 0004 b7bc            jsr        Af_buildname
[0006cc90] 504f                      addq.w     #8,a7
[0006cc92] 4eb9 0004 eec0            jsr        Amo_busy
[0006cc98] 41ef 008a                 lea.l      138(a7),a0
[0006cc9c] 4eb9 0004 b8fa            jsr        Af_length
[0006cca2] 2f40 0002                 move.l     d0,2(a7)
[0006cca6] 72ff                      moveq.l    #-1,d1
[0006cca8] b280                      cmp.l      d0,d1
[0006ccaa] 6606                      bne.s      Ascrp_put_2
[0006ccac] 4240                      clr.w      d0
[0006ccae] 6000 00d0                 bra        Ascrp_put_3
Ascrp_put_2:
[0006ccb2] 302f 010a                 move.w     266(a7),d0
[0006ccb6] 674a                      beq.s      Ascrp_put_4
[0006ccb8] 202f 0002                 move.l     2(a7),d0
[0006ccbc] 6a16                      bpl.s      Ascrp_put_5
[0006ccbe] 4240                      clr.w      d0
[0006ccc0] 41ef 008a                 lea.l      138(a7),a0
[0006ccc4] 4eb9 0008 0c8e            jsr        Fcreate
[0006ccca] 2f40 0006                 move.l     d0,6(a7)
[0006ccce] 6a02                      bpl.s      Ascrp_put_6
[0006ccd0] 4257                      clr.w      (a7)
Ascrp_put_6:
[0006ccd2] 602c                      bra.s      Ascrp_put_7
Ascrp_put_5:
[0006ccd4] 7002                      moveq.l    #2,d0
[0006ccd6] 41ef 008a                 lea.l      138(a7),a0
[0006ccda] 4eb9 0008 0cc0            jsr        Fopen
[0006cce0] 2f40 0006                 move.l     d0,6(a7)
[0006cce4] 6a04                      bpl.s      Ascrp_put_8
[0006cce6] 4257                      clr.w      (a7)
[0006cce8] 6016                      bra.s      Ascrp_put_7
Ascrp_put_8:
[0006ccea] 7402                      moveq.l    #2,d2
[0006ccec] 322f 0008                 move.w     8(a7),d1
[0006ccf0] 7000                      moveq.l    #0,d0
[0006ccf2] 4eb9 0008 0cfe            jsr        Fseek
[0006ccf8] b0af 0002                 cmp.l      2(a7),d0
[0006ccfc] 6702                      beq.s      Ascrp_put_7
[0006ccfe] 4257                      clr.w      (a7)
Ascrp_put_7:
[0006cd00] 602a                      bra.s      Ascrp_put_9
Ascrp_put_4:
[0006cd02] 202f 0002                 move.l     2(a7),d0
[0006cd06] 6b10                      bmi.s      Ascrp_put_10
[0006cd08] 41ef 008a                 lea.l      138(a7),a0
[0006cd0c] 4eb9 0008 0ca0            jsr        Fdelete
[0006cd12] 4a80                      tst.l      d0
[0006cd14] 6702                      beq.s      Ascrp_put_10
[0006cd16] 4257                      clr.w      (a7)
Ascrp_put_10:
[0006cd18] 4240                      clr.w      d0
[0006cd1a] 41ef 008a                 lea.l      138(a7),a0
[0006cd1e] 4eb9 0008 0c8e            jsr        Fcreate
[0006cd24] 2f40 0006                 move.l     d0,6(a7)
[0006cd28] 6a02                      bpl.s      Ascrp_put_9
[0006cd2a] 4257                      clr.w      (a7)
Ascrp_put_9:
[0006cd2c] 3017                      move.w     (a7),d0
[0006cd2e] 6748                      beq.s      Ascrp_put_11
[0006cd30] 206f 0110                 movea.l    272(a7),a0
[0006cd34] 222f 010c                 move.l     268(a7),d1
[0006cd38] 302f 0008                 move.w     8(a7),d0
[0006cd3c] 4eb9 0008 0d5e            jsr        Fwrite
[0006cd42] b0af 010c                 cmp.l      268(a7),d0
[0006cd46] 6718                      beq.s      Ascrp_put_12
[0006cd48] 302f 0008                 move.w     8(a7),d0
[0006cd4c] 4eb9 0008 0c7e            jsr        Fclose
[0006cd52] 41ef 008a                 lea.l      138(a7),a0
[0006cd56] 4eb9 0008 0ca0            jsr        Fdelete
[0006cd5c] 4257                      clr.w      (a7)
[0006cd5e] 6018                      bra.s      Ascrp_put_11
Ascrp_put_12:
[0006cd60] 302f 0008                 move.w     8(a7),d0
[0006cd64] 4eb9 0008 0c7e            jsr        Fclose
[0006cd6a] 102f 008a                 move.b     138(a7),d0
[0006cd6e] 4880                      ext.w      d0
[0006cd70] d07c ffbf                 add.w      #$FFBF,d0
[0006cd74] 6100 fac8                 bsr        scrp_chg
Ascrp_put_11:
[0006cd78] 4eb9 0004 ef0c            jsr        Amo_unbusy
Ascrp_put_1:
[0006cd7e] 3017                      move.w     (a7),d0
Ascrp_put_3:
[0006cd80] 4fef 0118                 lea.l      280(a7),a7
[0006cd84] 4e75                      rts

	.data

a_dialog_active:
[000e1fca]                           dc.w $0000
[000e1fcc]                           dc.w $0000
[000e1fce]                           dc.w $0000
[000e1fd0]                           dc.w $0000
[000e1fd2]                           dc.w $0000
[000e1fd4]                           dc.w $0000
[000e1fd6]                           dc.w $0000
[000e1fd8]                           dc.w $0000
[000e1fda]                           dc.w $0000
[000e1fdc]                           dc.b 'A:\',0
[000e1fe0]                           dc.w $0000
[000e1fe2]                           dc.w $0000
[000e1fe4]                           dc.w $0000
[000e1fe6]                           dc.w $0000
[000e1fe8]                           dc.w $0000
[000e1fea]                           dc.w $0000
[000e1fec]                           dc.w $0000
[000e1fee]                           dc.w $0000
[000e1ff0]                           dc.w $0000
[000e1ff2]                           dc.w $0000
[000e1ff4]                           dc.w $0000
[000e1ff6]                           dc.w $0000
[000e1ff8]                           dc.w $0000
[000e1ffa]                           dc.w $0000
[000e1ffc]                           dc.w $0000
[000e1ffe]                           dc.w $0000
[000e2000]                           dc.w $0000
[000e2002]                           dc.w $0000
[000e2004]                           dc.w $0000
[000e2006]                           dc.w $0000
[000e2008]                           dc.w $0000
[000e200a]                           dc.w $0000
[000e200c]                           dc.w $0000
[000e200e]                           dc.w $0000
[000e2010]                           dc.w $0000
[000e2012]                           dc.w $0000
[000e2014]                           dc.w $0000
[000e2016]                           dc.w $0000
[000e2018]                           dc.w $0000
[000e201a]                           dc.w $0000
[000e201c]                           dc.w $0000
[000e201e]                           dc.w $0000
[000e2020]                           dc.w $0000
[000e2022]                           dc.w $0000
[000e2024]                           dc.w $0000
[000e2026]                           dc.w $0000
[000e2028]                           dc.w $0000
[000e202a]                           dc.w $0000
[000e202c]                           dc.w $0000
[000e202e]                           dc.w $0000
[000e2030]                           dc.w $0000
[000e2032]                           dc.w $0000
[000e2034]                           dc.w $0000
[000e2036]                           dc.w $0000
[000e2038]                           dc.w $0000
[000e203a]                           dc.w $0000
[000e203c]                           dc.w $0000
[000e203e]                           dc.w $0000
[000e2040]                           dc.w $0000
[000e2042]                           dc.w $0000
[000e2044]                           dc.w $0000
[000e2046]                           dc.w $0000
[000e2048]                           dc.w $0000
[000e204a]                           dc.w $0000
[000e204c]                           dc.w $0000
[000e204e]                           dc.w $0000
[000e2050]                           dc.w $0000
[000e2052]                           dc.w $0000
[000e2054]                           dc.w $0000
[000e2056]                           dc.w $0000
[000e2058]                           dc.w $0000
[000e205a]                           dc.w $0000
[000e205c]                           dc.b 'A:\',0
[000e2060]                           dc.w $0000
[000e2062]                           dc.w $0000
[000e2064]                           dc.w $0000
[000e2066]                           dc.w $0000
[000e2068]                           dc.w $0000
[000e206a]                           dc.w $0000
[000e206c]                           dc.w $0000
[000e206e]                           dc.w $0000
[000e2070]                           dc.w $0000
[000e2072]                           dc.w $0000
[000e2074]                           dc.w $0000
[000e2076]                           dc.w $0000
[000e2078]                           dc.w $0000
[000e207a]                           dc.w $0000
[000e207c]                           dc.w $0000
[000e207e]                           dc.w $0000
[000e2080]                           dc.w $0000
[000e2082]                           dc.w $0000
[000e2084]                           dc.w $0000
[000e2086]                           dc.w $0000
[000e2088]                           dc.w $0000
[000e208a]                           dc.w $0000
[000e208c]                           dc.w $0000
[000e208e]                           dc.w $0000
[000e2090]                           dc.w $0000
[000e2092]                           dc.w $0000
[000e2094]                           dc.w $0000
[000e2096]                           dc.w $0000
[000e2098]                           dc.w $0000
[000e209a]                           dc.w $0000
[000e209c]                           dc.w $0000
[000e209e]                           dc.w $0000
[000e20a0]                           dc.w $0000
[000e20a2]                           dc.w $0000
[000e20a4]                           dc.w $0000
[000e20a6]                           dc.w $0000
[000e20a8]                           dc.w $0000
[000e20aa]                           dc.w $0000
[000e20ac]                           dc.w $0000
[000e20ae]                           dc.w $0000
[000e20b0]                           dc.w $0000
[000e20b2]                           dc.w $0000
[000e20b4]                           dc.w $0000
[000e20b6]                           dc.w $0000
[000e20b8]                           dc.w $0000
[000e20ba]                           dc.w $0000
[000e20bc]                           dc.w $0000
[000e20be]                           dc.w $0000
[000e20c0]                           dc.w $0000
[000e20c2]                           dc.w $0000
[000e20c4]                           dc.w $0000
[000e20c6]                           dc.w $0000
[000e20c8]                           dc.w $0000
[000e20ca]                           dc.w $0000
[000e20cc]                           dc.w $0000
[000e20ce]                           dc.w $0000
[000e20d0]                           dc.w $0000
[000e20d2]                           dc.w $0000
[000e20d4]                           dc.w $0000
[000e20d6]                           dc.w $0000
[000e20d8]                           dc.w $0000
[000e20da]                           dc.w $0000
[000e20dc]                           dc.b '[3][',0
[000e20e1]                           dc.b '][ OK ]',0
[000e20e9]                           dc.b 'SCRAP',0
[000e20ef]                           dc.b 'SCRAP',0
[000e20f5]                           dc.b 'scrap',0
[000e20fb]                           dc.b $00
