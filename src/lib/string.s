	.globl Ast_create
Ast_create:
[0004643c] 4fef fff4                 lea.l      -12(a7),a7
[00046440] 2f48 0008                 move.l     a0,8(a7)
[00046444] 202f 0008                 move.l     8(a7),d0
[00046448] 6744                      beq.s      Ast_create_1
[0004644a] 206f 0008                 movea.l    8(a7),a0
[0004644e] 1010                      move.b     (a0),d0
[00046450] 673c                      beq.s      Ast_create_1
[00046452] 206f 0008                 movea.l    8(a7),a0
[00046456] 4eb9 0008 2f6c            jsr        strlen
[0004645c] 5280                      addq.l     #1,d0
[0004645e] 2e80                      move.l     d0,(a7)
[00046460] 2017                      move.l     (a7),d0
[00046462] 4eb9 0004 c608            jsr        Ax_malloc
[00046468] 2f48 0004                 move.l     a0,4(a7)
[0004646c] 202f 0004                 move.l     4(a7),d0
[00046470] 6604                      bne.s      Ast_create_2
[00046472] 91c8                      suba.l     a0,a0
[00046474] 6020                      bra.s      Ast_create_3
Ast_create_2:
[00046476] 2017                      move.l     (a7),d0
[00046478] 226f 0008                 movea.l    8(a7),a1
[0004647c] 206f 0004                 movea.l    4(a7),a0
[00046480] 4eb9 0008 3500            jsr        memcpy
[00046486] 206f 0004                 movea.l    4(a7),a0
[0004648a] 600a                      bra.s      Ast_create_3
[0004648c] 6008                      bra.s      Ast_create_3
Ast_create_1:
[0004648e] 41f9 000e 05da            lea.l      null_string,a0
[00046494] 4e71                      nop
Ast_create_3:
[00046496] 4fef 000c                 lea.l      12(a7),a7
[0004649a] 4e75                      rts

	.globl Ast_delete
Ast_delete:
[0004649c] 594f                      subq.w     #4,a7
[0004649e] 2e88                      move.l     a0,(a7)
[000464a0] 2057                      movea.l    (a7),a0
[000464a2] b1fc 000e 05da            cmpa.l     #null_string,a0
[000464a8] 6708                      beq.s      Ast_delete_1
[000464aa] 2057                      movea.l    (a7),a0
[000464ac] 4eb9 0004 c7c8            jsr        Ax_free
Ast_delete_1:
[000464b2] 584f                      addq.w     #4,a7
[000464b4] 4e75                      rts

	.globl Ach_toupper
Ach_toupper:
[000464b6] 554f                      subq.w     #2,a7
[000464b8] 1e80                      move.b     d0,(a7)
[000464ba] 1017                      move.b     (a7),d0
[000464bc] 4880                      ext.w      d0
[000464be] 4eb9 0004 4264            jsr        nkc_toup
[000464c4] 544f                      addq.w     #2,a7
[000464c6] 4e75                      rts

	.globl Ach_tolower
Ach_tolower:
[000464c8] 554f                      subq.w     #2,a7
[000464ca] 1e80                      move.b     d0,(a7)
[000464cc] 1017                      move.b     (a7),d0
[000464ce] 4880                      ext.w      d0
[000464d0] 4eb9 0004 4274            jsr        nkc_tolo
[000464d6] 544f                      addq.w     #2,a7
[000464d8] 4e75                      rts

	.globl Ast_toupper
Ast_toupper:
[000464da] 514f                      subq.w     #8,a7
[000464dc] 2f48 0004                 move.l     a0,4(a7)
[000464e0] 202f 0004                 move.l     4(a7),d0
[000464e4] 6608                      bne.s      Ast_toupper_1
[000464e6] 2f7c 000e 05da 0004       move.l     #null_string,4(a7)
Ast_toupper_1:
[000464ee] 202f 0004                 move.l     4(a7),d0
[000464f2] 671e                      beq.s      Ast_toupper_2
[000464f4] 2eaf 0004                 move.l     4(a7),(a7)
[000464f8] 6012                      bra.s      Ast_toupper_3
Ast_toupper_4:
[000464fa] 2057                      movea.l    (a7),a0
[000464fc] 1010                      move.b     (a0),d0
[000464fe] 4880                      ext.w      d0
[00046500] 4eb9 0004 4264            jsr        nkc_toup
[00046506] 2057                      movea.l    (a7),a0
[00046508] 1080                      move.b     d0,(a0)
[0004650a] 5297                      addq.l     #1,(a7)
Ast_toupper_3:
[0004650c] 2057                      movea.l    (a7),a0
[0004650e] 1010                      move.b     (a0),d0
[00046510] 66e8                      bne.s      Ast_toupper_4
Ast_toupper_2:
[00046512] 206f 0004                 movea.l    4(a7),a0
[00046516] 504f                      addq.w     #8,a7
[00046518] 4e75                      rts

	.globl Ast_tolower
Ast_tolower:
[0004651a] 514f                      subq.w     #8,a7
[0004651c] 2f48 0004                 move.l     a0,4(a7)
[00046520] 202f 0004                 move.l     4(a7),d0
[00046524] 6608                      bne.s      Ast_tolower_1
[00046526] 2f7c 000e 05da 0004       move.l     #null_string,4(a7)
Ast_tolower_1:
[0004652e] 202f 0004                 move.l     4(a7),d0
[00046532] 671e                      beq.s      Ast_tolower_2
[00046534] 2eaf 0004                 move.l     4(a7),(a7)
[00046538] 6012                      bra.s      Ast_tolower_3
Ast_tolower_4:
[0004653a] 2057                      movea.l    (a7),a0
[0004653c] 1010                      move.b     (a0),d0
[0004653e] 4880                      ext.w      d0
[00046540] 4eb9 0004 4274            jsr        nkc_tolo
[00046546] 2057                      movea.l    (a7),a0
[00046548] 1080                      move.b     d0,(a0)
[0004654a] 5297                      addq.l     #1,(a7)
Ast_tolower_3:
[0004654c] 2057                      movea.l    (a7),a0
[0004654e] 1010                      move.b     (a0),d0
[00046550] 66e8                      bne.s      Ast_tolower_4
Ast_tolower_2:
[00046552] 206f 0004                 movea.l    4(a7),a0
[00046556] 504f                      addq.w     #8,a7
[00046558] 4e75                      rts

	.globl Ast_ltrim
Ast_ltrim:
[0004655a] 4fef fff4                 lea.l      -12(a7),a7
[0004655e] 2f48 0008                 move.l     a0,8(a7)
[00046562] 202f 0008                 move.l     8(a7),d0
[00046566] 6608                      bne.s      Ast_ltrim_1
[00046568] 2f7c 000e 05da 0008       move.l     #null_string,8(a7)
Ast_ltrim_1:
[00046570] 2eaf 0008                 move.l     8(a7),(a7)
[00046574] 6002                      bra.s      Ast_ltrim_2
Ast_ltrim_4:
[00046576] 5297                      addq.l     #1,(a7)
Ast_ltrim_2:
[00046578] 2057                      movea.l    (a7),a0
[0004657a] 1010                      move.b     (a0),d0
[0004657c] 670e                      beq.s      Ast_ltrim_3
[0004657e] 2057                      movea.l    (a7),a0
[00046580] 1010                      move.b     (a0),d0
[00046582] 4eb9 0004 69d0            jsr        Ach_isWhite
[00046588] 4a40                      tst.w      d0
[0004658a] 66ea                      bne.s      Ast_ltrim_4
Ast_ltrim_3:
[0004658c] 2057                      movea.l    (a7),a0
[0004658e] 1010                      move.b     (a0),d0
[00046590] 672a                      beq.s      Ast_ltrim_5
[00046592] 2057                      movea.l    (a7),a0
[00046594] b1ef 0008                 cmpa.l     8(a7),a0
[00046598] 6322                      bls.s      Ast_ltrim_5
[0004659a] 2f6f 0008 0004            move.l     8(a7),4(a7)
[000465a0] 600e                      bra.s      Ast_ltrim_6
Ast_ltrim_7:
[000465a2] 2057                      movea.l    (a7),a0
[000465a4] 226f 0004                 movea.l    4(a7),a1
[000465a8] 1290                      move.b     (a0),(a1)
[000465aa] 5297                      addq.l     #1,(a7)
[000465ac] 52af 0004                 addq.l     #1,4(a7)
Ast_ltrim_6:
[000465b0] 2057                      movea.l    (a7),a0
[000465b2] 1010                      move.b     (a0),d0
[000465b4] 66ec                      bne.s      Ast_ltrim_7
[000465b6] 206f 0004                 movea.l    4(a7),a0
[000465ba] 4210                      clr.b      (a0)
Ast_ltrim_5:
[000465bc] 206f 0008                 movea.l    8(a7),a0
[000465c0] 4fef 000c                 lea.l      12(a7),a7
[000465c4] 4e75                      rts

	.globl Ast_rtrim
Ast_rtrim:
[000465c6] 514f                      subq.w     #8,a7
[000465c8] 2f48 0004                 move.l     a0,4(a7)
[000465cc] 202f 0004                 move.l     4(a7),d0
[000465d0] 6608                      bne.s      Ast_rtrim_1
[000465d2] 2f7c 000e 05da 0004       move.l     #null_string,4(a7)
Ast_rtrim_1:
[000465da] 2eaf 0004                 move.l     4(a7),(a7)
[000465de] 6002                      bra.s      Ast_rtrim_2
Ast_rtrim_3:
[000465e0] 5297                      addq.l     #1,(a7)
Ast_rtrim_2:
[000465e2] 2057                      movea.l    (a7),a0
[000465e4] 1010                      move.b     (a0),d0
[000465e6] 66f8                      bne.s      Ast_rtrim_3
[000465e8] 5397                      subq.l     #1,(a7)
[000465ea] 6002                      bra.s      Ast_rtrim_4
Ast_rtrim_6:
[000465ec] 5397                      subq.l     #1,(a7)
Ast_rtrim_4:
[000465ee] 2057                      movea.l    (a7),a0
[000465f0] b1ef 0004                 cmpa.l     4(a7),a0
[000465f4] 630e                      bls.s      Ast_rtrim_5
[000465f6] 2057                      movea.l    (a7),a0
[000465f8] 1010                      move.b     (a0),d0
[000465fa] 4eb9 0004 69d0            jsr        Ach_isWhite
[00046600] 4a40                      tst.w      d0
[00046602] 66e8                      bne.s      Ast_rtrim_6
Ast_rtrim_5:
[00046604] 2057                      movea.l    (a7),a0
[00046606] b1ef 0004                 cmpa.l     4(a7),a0
[0004660a] 6522                      bcs.s      Ast_rtrim_7
[0004660c] 2057                      movea.l    (a7),a0
[0004660e] 1010                      move.b     (a0),d0
[00046610] 6716                      beq.s      Ast_rtrim_8
[00046612] 2057                      movea.l    (a7),a0
[00046614] 1010                      move.b     (a0),d0
[00046616] 4eb9 0004 69d0            jsr        Ach_isWhite
[0004661c] 4a40                      tst.w      d0
[0004661e] 6608                      bne.s      Ast_rtrim_8
[00046620] 5297                      addq.l     #1,(a7)
[00046622] 2057                      movea.l    (a7),a0
[00046624] 4210                      clr.b      (a0)
[00046626] 6004                      bra.s      Ast_rtrim_9
Ast_rtrim_8:
[00046628] 2057                      movea.l    (a7),a0
[0004662a] 4210                      clr.b      (a0)
Ast_rtrim_9:
[0004662c] 6006                      bra.s      Ast_rtrim_10
Ast_rtrim_7:
[0004662e] 206f 0004                 movea.l    4(a7),a0
[00046632] 4210                      clr.b      (a0)
Ast_rtrim_10:
[00046634] 206f 0004                 movea.l    4(a7),a0
[00046638] 504f                      addq.w     #8,a7
[0004663a] 4e75                      rts

	.globl Ast_alltrim
Ast_alltrim:
[0004663c] 594f                      subq.w     #4,a7
[0004663e] 2e88                      move.l     a0,(a7)
[00046640] 2017                      move.l     (a7),d0
[00046642] 670c                      beq.s      Ast_alltrim_1
[00046644] 2057                      movea.l    (a7),a0
[00046646] 6100 ff12                 bsr        Ast_ltrim
[0004664a] 6100 ff7a                 bsr        Ast_rtrim
[0004664e] 6006                      bra.s      Ast_alltrim_2
Ast_alltrim_1:
[00046650] 41f9 000e 05da            lea.l      null_string,a0
Ast_alltrim_2:
[00046656] 584f                      addq.w     #4,a7
[00046658] 4e75                      rts

	.globl Ast_cmp
Ast_cmp:
[0004665a] 4fef fff0                 lea.l      -16(a7),a7
[0004665e] 2f48 000c                 move.l     a0,12(a7)
[00046662] 2f49 0008                 move.l     a1,8(a7)
[00046666] 202f 000c                 move.l     12(a7),d0
[0004666a] 6608                      bne.s      Ast_cmp_1
[0004666c] 2f7c 000e 05da 000c       move.l     #null_string,12(a7)
Ast_cmp_1:
[00046674] 202f 0008                 move.l     8(a7),d0
[00046678] 6608                      bne.s      Ast_cmp_2
[0004667a] 2f7c 000e 05da 0008       move.l     #null_string,8(a7)
Ast_cmp_2:
[00046682] 2f6f 000c 0004            move.l     12(a7),4(a7)
[00046688] 2eaf 0008                 move.l     8(a7),(a7)
[0004668c] 6026                      bra.s      Ast_cmp_3
Ast_cmp_9:
[0004668e] 206f 0004                 movea.l    4(a7),a0
[00046692] 1010                      move.b     (a0),d0
[00046694] 2057                      movea.l    (a7),a0
[00046696] b010                      cmp.b      (a0),d0
[00046698] 6714                      beq.s      Ast_cmp_4
[0004669a] 206f 0004                 movea.l    4(a7),a0
[0004669e] 1010                      move.b     (a0),d0
[000466a0] 2057                      movea.l    (a7),a0
[000466a2] b010                      cmp.b      (a0),d0
[000466a4] 6f04                      ble.s      Ast_cmp_5
[000466a6] 7001                      moveq.l    #1,d0
[000466a8] 6002                      bra.s      Ast_cmp_6
Ast_cmp_5:
[000466aa] 70ff                      moveq.l    #-1,d0
Ast_cmp_6:
[000466ac] 6036                      bra.s      Ast_cmp_7
Ast_cmp_4:
[000466ae] 52af 0004                 addq.l     #1,4(a7)
[000466b2] 5297                      addq.l     #1,(a7)
Ast_cmp_3:
[000466b4] 206f 0004                 movea.l    4(a7),a0
[000466b8] 1010                      move.b     (a0),d0
[000466ba] 6706                      beq.s      Ast_cmp_8
[000466bc] 2057                      movea.l    (a7),a0
[000466be] 1010                      move.b     (a0),d0
[000466c0] 66cc                      bne.s      Ast_cmp_9
Ast_cmp_8:
[000466c2] 206f 0004                 movea.l    4(a7),a0
[000466c6] 1010                      move.b     (a0),d0
[000466c8] 2057                      movea.l    (a7),a0
[000466ca] b010                      cmp.b      (a0),d0
[000466cc] 6f04                      ble.s      Ast_cmp_10
[000466ce] 7001                      moveq.l    #1,d0
[000466d0] 6012                      bra.s      Ast_cmp_7
Ast_cmp_10:
[000466d2] 206f 0004                 movea.l    4(a7),a0
[000466d6] 1010                      move.b     (a0),d0
[000466d8] 2057                      movea.l    (a7),a0
[000466da] b010                      cmp.b      (a0),d0
[000466dc] 6c04                      bge.s      Ast_cmp_11
[000466de] 70ff                      moveq.l    #-1,d0
[000466e0] 6002                      bra.s      Ast_cmp_7
Ast_cmp_11:
[000466e2] 4240                      clr.w      d0
Ast_cmp_7:
[000466e4] 4fef 0010                 lea.l      16(a7),a7
[000466e8] 4e75                      rts

	.globl Ast_icmp
Ast_icmp:
[000466ea] 4fef ffee                 lea.l      -18(a7),a7
[000466ee] 2f48 000e                 move.l     a0,14(a7)
[000466f2] 2f49 000a                 move.l     a1,10(a7)
[000466f6] 202f 000e                 move.l     14(a7),d0
[000466fa] 6608                      bne.s      Ast_icmp_1
[000466fc] 2f7c 000e 05da 000e       move.l     #null_string,14(a7)
Ast_icmp_1:
[00046704] 202f 000a                 move.l     10(a7),d0
[00046708] 6608                      bne.s      Ast_icmp_2
[0004670a] 2f7c 000e 05da 000a       move.l     #null_string,10(a7)
Ast_icmp_2:
[00046712] 2f6f 000e 0004            move.l     14(a7),4(a7)
[00046718] 2eaf 000a                 move.l     10(a7),(a7)
[0004671c] 6044                      bra.s      Ast_icmp_3
Ast_icmp_9:
[0004671e] 206f 0004                 movea.l    4(a7),a0
[00046722] 1010                      move.b     (a0),d0
[00046724] 4880                      ext.w      d0
[00046726] 4eb9 0004 4264            jsr        nkc_toup
[0004672c] 1f40 0009                 move.b     d0,9(a7)
[00046730] 2057                      movea.l    (a7),a0
[00046732] 1010                      move.b     (a0),d0
[00046734] 4880                      ext.w      d0
[00046736] 4eb9 0004 4264            jsr        nkc_toup
[0004673c] 1f40 0008                 move.b     d0,8(a7)
[00046740] 102f 0009                 move.b     9(a7),d0
[00046744] b02f 0008                 cmp.b      8(a7),d0
[00046748] 6712                      beq.s      Ast_icmp_4
[0004674a] 102f 0009                 move.b     9(a7),d0
[0004674e] b02f 0008                 cmp.b      8(a7),d0
[00046752] 6f04                      ble.s      Ast_icmp_5
[00046754] 7001                      moveq.l    #1,d0
[00046756] 6002                      bra.s      Ast_icmp_6
Ast_icmp_5:
[00046758] 70ff                      moveq.l    #-1,d0
Ast_icmp_6:
[0004675a] 6036                      bra.s      Ast_icmp_7
Ast_icmp_4:
[0004675c] 52af 0004                 addq.l     #1,4(a7)
[00046760] 5297                      addq.l     #1,(a7)
Ast_icmp_3:
[00046762] 206f 0004                 movea.l    4(a7),a0
[00046766] 1010                      move.b     (a0),d0
[00046768] 6706                      beq.s      Ast_icmp_8
[0004676a] 2057                      movea.l    (a7),a0
[0004676c] 1010                      move.b     (a0),d0
[0004676e] 66ae                      bne.s      Ast_icmp_9
Ast_icmp_8:
[00046770] 206f 0004                 movea.l    4(a7),a0
[00046774] 1010                      move.b     (a0),d0
[00046776] 2057                      movea.l    (a7),a0
[00046778] b010                      cmp.b      (a0),d0
[0004677a] 6f04                      ble.s      Ast_icmp_10
[0004677c] 7001                      moveq.l    #1,d0
[0004677e] 6012                      bra.s      Ast_icmp_7
Ast_icmp_10:
[00046780] 206f 0004                 movea.l    4(a7),a0
[00046784] 1010                      move.b     (a0),d0
[00046786] 2057                      movea.l    (a7),a0
[00046788] b010                      cmp.b      (a0),d0
[0004678a] 6c04                      bge.s      Ast_icmp_11
[0004678c] 70ff                      moveq.l    #-1,d0
[0004678e] 6002                      bra.s      Ast_icmp_7
Ast_icmp_11:
[00046790] 4240                      clr.w      d0
Ast_icmp_7:
[00046792] 4fef 0012                 lea.l      18(a7),a7
[00046796] 4e75                      rts

	.globl Ast_ncmp
Ast_ncmp:
[00046798] 4fef ffec                 lea.l      -20(a7),a7
[0004679c] 2f48 0010                 move.l     a0,16(a7)
[000467a0] 2f49 000c                 move.l     a1,12(a7)
[000467a4] 3f40 000a                 move.w     d0,10(a7)
[000467a8] 202f 0010                 move.l     16(a7),d0
[000467ac] 6608                      bne.s      Ast_ncmp_1
[000467ae] 2f7c 000e 05da 0010       move.l     #null_string,16(a7)
Ast_ncmp_1:
[000467b6] 202f 000c                 move.l     12(a7),d0
[000467ba] 6608                      bne.s      Ast_ncmp_2
[000467bc] 2f7c 000e 05da 000c       move.l     #null_string,12(a7)
Ast_ncmp_2:
[000467c4] 426f 0008                 clr.w      8(a7)
[000467c8] 2f6f 0010 0004            move.l     16(a7),4(a7)
[000467ce] 2eaf 000c                 move.l     12(a7),(a7)
[000467d2] 602a                      bra.s      Ast_ncmp_3
Ast_ncmp_9:
[000467d4] 206f 0004                 movea.l    4(a7),a0
[000467d8] 1010                      move.b     (a0),d0
[000467da] 2057                      movea.l    (a7),a0
[000467dc] b010                      cmp.b      (a0),d0
[000467de] 6714                      beq.s      Ast_ncmp_4
[000467e0] 206f 0004                 movea.l    4(a7),a0
[000467e4] 1010                      move.b     (a0),d0
[000467e6] 2057                      movea.l    (a7),a0
[000467e8] b010                      cmp.b      (a0),d0
[000467ea] 6f04                      ble.s      Ast_ncmp_5
[000467ec] 7001                      moveq.l    #1,d0
[000467ee] 6002                      bra.s      Ast_ncmp_6
Ast_ncmp_5:
[000467f0] 70ff                      moveq.l    #-1,d0
Ast_ncmp_6:
[000467f2] 6052                      bra.s      Ast_ncmp_7
Ast_ncmp_4:
[000467f4] 52af 0004                 addq.l     #1,4(a7)
[000467f8] 5297                      addq.l     #1,(a7)
[000467fa] 526f 0008                 addq.w     #1,8(a7)
Ast_ncmp_3:
[000467fe] 206f 0004                 movea.l    4(a7),a0
[00046802] 1010                      move.b     (a0),d0
[00046804] 6710                      beq.s      Ast_ncmp_8
[00046806] 2057                      movea.l    (a7),a0
[00046808] 1010                      move.b     (a0),d0
[0004680a] 670a                      beq.s      Ast_ncmp_8
[0004680c] 302f 0008                 move.w     8(a7),d0
[00046810] b06f 000a                 cmp.w      10(a7),d0
[00046814] 6dbe                      blt.s      Ast_ncmp_9
Ast_ncmp_8:
[00046816] 302f 0008                 move.w     8(a7),d0
[0004681a] b06f 000a                 cmp.w      10(a7),d0
[0004681e] 6d04                      blt.s      Ast_ncmp_10
[00046820] 4240                      clr.w      d0
[00046822] 6022                      bra.s      Ast_ncmp_7
Ast_ncmp_10:
[00046824] 206f 0004                 movea.l    4(a7),a0
[00046828] 1010                      move.b     (a0),d0
[0004682a] 2057                      movea.l    (a7),a0
[0004682c] b010                      cmp.b      (a0),d0
[0004682e] 6f04                      ble.s      Ast_ncmp_11
[00046830] 7001                      moveq.l    #1,d0
[00046832] 6012                      bra.s      Ast_ncmp_7
Ast_ncmp_11:
[00046834] 206f 0004                 movea.l    4(a7),a0
[00046838] 1010                      move.b     (a0),d0
[0004683a] 2057                      movea.l    (a7),a0
[0004683c] b010                      cmp.b      (a0),d0
[0004683e] 6c04                      bge.s      Ast_ncmp_12
[00046840] 70ff                      moveq.l    #-1,d0
[00046842] 6002                      bra.s      Ast_ncmp_7
Ast_ncmp_12:
[00046844] 4240                      clr.w      d0
Ast_ncmp_7:
[00046846] 4fef 0014                 lea.l      20(a7),a7
[0004684a] 4e75                      rts

	.globl Ast_incmp
Ast_incmp:
[0004684c] 4fef ffea                 lea.l      -22(a7),a7
[00046850] 2f48 0012                 move.l     a0,18(a7)
[00046854] 2f49 000e                 move.l     a1,14(a7)
[00046858] 3f40 000c                 move.w     d0,12(a7)
[0004685c] 202f 0012                 move.l     18(a7),d0
[00046860] 6608                      bne.s      Ast_incmp_1
[00046862] 2f7c 000e 05da 0012       move.l     #null_string,18(a7)
Ast_incmp_1:
[0004686a] 202f 000e                 move.l     14(a7),d0
[0004686e] 6608                      bne.s      Ast_incmp_2
[00046870] 2f7c 000e 05da 000e       move.l     #null_string,14(a7)
Ast_incmp_2:
[00046878] 426f 0008                 clr.w      8(a7)
[0004687c] 2f6f 0012 0004            move.l     18(a7),4(a7)
[00046882] 2eaf 000e                 move.l     14(a7),(a7)
[00046886] 6048                      bra.s      Ast_incmp_3
Ast_incmp_9:
[00046888] 206f 0004                 movea.l    4(a7),a0
[0004688c] 1010                      move.b     (a0),d0
[0004688e] 4880                      ext.w      d0
[00046890] 4eb9 0004 4264            jsr        nkc_toup
[00046896] 1f40 000b                 move.b     d0,11(a7)
[0004689a] 2057                      movea.l    (a7),a0
[0004689c] 1010                      move.b     (a0),d0
[0004689e] 4880                      ext.w      d0
[000468a0] 4eb9 0004 4264            jsr        nkc_toup
[000468a6] 1f40 000a                 move.b     d0,10(a7)
[000468aa] 102f 000b                 move.b     11(a7),d0
[000468ae] b02f 000a                 cmp.b      10(a7),d0
[000468b2] 6712                      beq.s      Ast_incmp_4
[000468b4] 102f 000b                 move.b     11(a7),d0
[000468b8] b02f 000a                 cmp.b      10(a7),d0
[000468bc] 6f04                      ble.s      Ast_incmp_5
[000468be] 7001                      moveq.l    #1,d0
[000468c0] 6002                      bra.s      Ast_incmp_6
Ast_incmp_5:
[000468c2] 70ff                      moveq.l    #-1,d0
Ast_incmp_6:
[000468c4] 6052                      bra.s      Ast_incmp_7
Ast_incmp_4:
[000468c6] 52af 0004                 addq.l     #1,4(a7)
[000468ca] 5297                      addq.l     #1,(a7)
[000468cc] 526f 0008                 addq.w     #1,8(a7)
Ast_incmp_3:
[000468d0] 206f 0004                 movea.l    4(a7),a0
[000468d4] 1010                      move.b     (a0),d0
[000468d6] 6710                      beq.s      Ast_incmp_8
[000468d8] 2057                      movea.l    (a7),a0
[000468da] 1010                      move.b     (a0),d0
[000468dc] 670a                      beq.s      Ast_incmp_8
[000468de] 302f 0008                 move.w     8(a7),d0
[000468e2] b06f 000c                 cmp.w      12(a7),d0
[000468e6] 6da0                      blt.s      Ast_incmp_9
Ast_incmp_8:
[000468e8] 302f 0008                 move.w     8(a7),d0
[000468ec] b06f 000c                 cmp.w      12(a7),d0
[000468f0] 6d04                      blt.s      Ast_incmp_10
[000468f2] 4240                      clr.w      d0
[000468f4] 6022                      bra.s      Ast_incmp_7
Ast_incmp_10:
[000468f6] 206f 0004                 movea.l    4(a7),a0
[000468fa] 1010                      move.b     (a0),d0
[000468fc] 2057                      movea.l    (a7),a0
[000468fe] b010                      cmp.b      (a0),d0
[00046900] 6f04                      ble.s      Ast_incmp_11
[00046902] 7001                      moveq.l    #1,d0
[00046904] 6012                      bra.s      Ast_incmp_7
Ast_incmp_11:
[00046906] 206f 0004                 movea.l    4(a7),a0
[0004690a] 1010                      move.b     (a0),d0
[0004690c] 2057                      movea.l    (a7),a0
[0004690e] b010                      cmp.b      (a0),d0
[00046910] 6c04                      bge.s      Ast_incmp_12
[00046912] 70ff                      moveq.l    #-1,d0
[00046914] 6002                      bra.s      Ast_incmp_7
Ast_incmp_12:
[00046916] 4240                      clr.w      d0
Ast_incmp_7:
[00046918] 4fef 0016                 lea.l      22(a7),a7
[0004691c] 4e75                      rts

	.globl Ast_istr
Ast_istr:
[0004691e] 4fef ffec                 lea.l      -20(a7),a7
[00046922] 2f48 0010                 move.l     a0,16(a7)
[00046926] 2f49 000c                 move.l     a1,12(a7)
[0004692a] 202f 0010                 move.l     16(a7),d0
[0004692e] 6608                      bne.s      Ast_istr_1
[00046930] 2f7c 000e 05da 0010       move.l     #null_string,16(a7)
Ast_istr_1:
[00046938] 202f 000c                 move.l     12(a7),d0
[0004693c] 6608                      bne.s      Ast_istr_2
[0004693e] 2f7c 000e 05da 000c       move.l     #null_string,12(a7)
Ast_istr_2:
[00046946] 206f 000c                 movea.l    12(a7),a0
[0004694a] 4eb9 0008 2f6c            jsr        strlen
[00046950] 3f40 0002                 move.w     d0,2(a7)
[00046954] 206f 0010                 movea.l    16(a7),a0
[00046958] 4eb9 0008 2f6c            jsr        strlen
[0004695e] 3f00                      move.w     d0,-(a7)
[00046960] 206f 000e                 movea.l    14(a7),a0
[00046964] 4eb9 0008 2f6c            jsr        strlen
[0004696a] 321f                      move.w     (a7)+,d1
[0004696c] 9240                      sub.w      d0,d1
[0004696e] 5241                      addq.w     #1,d1
[00046970] 3f41 0004                 move.w     d1,4(a7)
[00046974] 2f6f 0010 0008            move.l     16(a7),8(a7)
[0004697a] 426f 0006                 clr.w      6(a7)
[0004697e] 4257                      clr.w      (a7)
[00046980] 6024                      bra.s      Ast_istr_3
Ast_istr_7:
[00046982] 302f 0002                 move.w     2(a7),d0
[00046986] 226f 000c                 movea.l    12(a7),a1
[0004698a] 206f 0008                 movea.l    8(a7),a0
[0004698e] 6100 febc                 bsr        Ast_incmp
[00046992] 4a40                      tst.w      d0
[00046994] 6604                      bne.s      Ast_istr_4
[00046996] 7001                      moveq.l    #1,d0
[00046998] 6002                      bra.s      Ast_istr_5
Ast_istr_4:
[0004699a] 4240                      clr.w      d0
Ast_istr_5:
[0004699c] 3f40 0006                 move.w     d0,6(a7)
[000469a0] 52af 0008                 addq.l     #1,8(a7)
[000469a4] 5257                      addq.w     #1,(a7)
Ast_istr_3:
[000469a6] 302f 0006                 move.w     6(a7),d0
[000469aa] 6610                      bne.s      Ast_istr_6
[000469ac] 3017                      move.w     (a7),d0
[000469ae] b06f 0004                 cmp.w      4(a7),d0
[000469b2] 6c08                      bge.s      Ast_istr_6
[000469b4] 206f 0008                 movea.l    8(a7),a0
[000469b8] 1010                      move.b     (a0),d0
[000469ba] 66c6                      bne.s      Ast_istr_7
Ast_istr_6:
[000469bc] 302f 0006                 move.w     6(a7),d0
[000469c0] 6706                      beq.s      Ast_istr_8
[000469c2] 206f 0008                 movea.l    8(a7),a0
[000469c6] 6002                      bra.s      Ast_istr_9
Ast_istr_8:
[000469c8] 91c8                      suba.l     a0,a0
Ast_istr_9:
[000469ca] 4fef 0014                 lea.l      20(a7),a7
[000469ce] 4e75                      rts

	.globl Ach_isWhite
Ach_isWhite:
[000469d0] 554f                      subq.w     #2,a7
[000469d2] 1e80                      move.b     d0,(a7)
[000469d4] 1017                      move.b     (a7),d0
[000469d6] 6718                      beq.s      Ach_isWhite_1
[000469d8] 1017                      move.b     (a7),d0
[000469da] 4880                      ext.w      d0
[000469dc] 41f9 000e 05e0            lea.l      $000E05E0,a0
[000469e2] 4eb9 0008 2e8a            jsr        strchr
[000469e8] 2008                      move.l     a0,d0
[000469ea] 6704                      beq.s      Ach_isWhite_1
[000469ec] 7001                      moveq.l    #1,d0
[000469ee] 6002                      bra.s      Ach_isWhite_2
Ach_isWhite_1:
[000469f0] 4240                      clr.w      d0
Ach_isWhite_2:
[000469f2] 544f                      addq.w     #2,a7
[000469f4] 4e75                      rts

	.globl Ast_isEmpty
Ast_isEmpty:
[000469f6] 514f                      subq.w     #8,a7
[000469f8] 2f48 0004                 move.l     a0,4(a7)
[000469fc] 2eaf 0004                 move.l     4(a7),(a7)
[00046a00] 6002                      bra.s      Ast_isEmpty_1
Ast_isEmpty_3:
[00046a02] 5297                      addq.l     #1,(a7)
Ast_isEmpty_1:
[00046a04] 2017                      move.l     (a7),d0
[00046a06] 6712                      beq.s      Ast_isEmpty_2
[00046a08] 2057                      movea.l    (a7),a0
[00046a0a] 1010                      move.b     (a0),d0
[00046a0c] 670c                      beq.s      Ast_isEmpty_2
[00046a0e] 2057                      movea.l    (a7),a0
[00046a10] 1010                      move.b     (a0),d0
[00046a12] 6100 ffbc                 bsr.w      Ach_isWhite
[00046a16] 4a40                      tst.w      d0
[00046a18] 66e8                      bne.s      Ast_isEmpty_3
Ast_isEmpty_2:
[00046a1a] 2017                      move.l     (a7),d0
[00046a1c] 6712                      beq.s      Ast_isEmpty_4
[00046a1e] 2057                      movea.l    (a7),a0
[00046a20] 1010                      move.b     (a0),d0
[00046a22] 670c                      beq.s      Ast_isEmpty_4
[00046a24] 2057                      movea.l    (a7),a0
[00046a26] 1010                      move.b     (a0),d0
[00046a28] 6100 ffa6                 bsr.w      Ach_isWhite
[00046a2c] 4a40                      tst.w      d0
[00046a2e] 6704                      beq.s      Ast_isEmpty_5
Ast_isEmpty_4:
[00046a30] 7001                      moveq.l    #1,d0
[00046a32] 6002                      bra.s      Ast_isEmpty_6
Ast_isEmpty_5:
[00046a34] 4240                      clr.w      d0
Ast_isEmpty_6:
[00046a36] 504f                      addq.w     #8,a7
[00046a38] 4e75                      rts

	.globl Ast_add
Ast_add:
[00046a3a] 4fef ffe4                 lea.l      -28(a7),a7
[00046a3e] 3f40 001a                 move.w     d0,26(a7)
[00046a42] 2f48 0016                 move.l     a0,22(a7)
[00046a46] 42af 0008                 clr.l      8(a7)
[00046a4a] 2ebc ffff ffff            move.l     #$FFFFFFFF,(a7)
[00046a50] 202f 0016                 move.l     22(a7),d0
[00046a54] 660a                      bne.s      Ast_add_1
[00046a56] 41f9 000e 05da            lea.l      null_string,a0
[00046a5c] 6000 00c4                 bra        Ast_add_2
Ast_add_1:
[00046a60] 41ef 0020                 lea.l      32(a7),a0
[00046a64] 2f48 0012                 move.l     a0,18(a7)
[00046a68] 206f 0016                 movea.l    22(a7),a0
[00046a6c] 4210                      clr.b      (a0)
[00046a6e] 426f 0010                 clr.w      16(a7)
[00046a72] 6000 008a                 bra        Ast_add_3
Ast_add_7:
[00046a76] 206f 0012                 movea.l    18(a7),a0
[00046a7a] 58af 0012                 addq.l     #4,18(a7)
[00046a7e] 2f50 000c                 move.l     (a0),12(a7)
[00046a82] 202f 000c                 move.l     12(a7),d0
[00046a86] 6772                      beq.s      Ast_add_4
[00046a88] 206f 000c                 movea.l    12(a7),a0
[00046a8c] 1010                      move.b     (a0),d0
[00046a8e] 676a                      beq.s      Ast_add_4
[00046a90] 206f 000c                 movea.l    12(a7),a0
[00046a94] 4eb9 0008 2f6c            jsr        strlen
[00046a9a] 2f40 0004                 move.l     d0,4(a7)
[00046a9e] 202f 0004                 move.l     4(a7),d0
[00046aa2] b097                      cmp.l      (a7),d0
[00046aa4] 6f30                      ble.s      Ast_add_5
[00046aa6] 202f 0008                 move.l     8(a7),d0
[00046aaa] 670a                      beq.s      Ast_add_6
[00046aac] 206f 0008                 movea.l    8(a7),a0
[00046ab0] 4eb9 0004 c7c8            jsr        Ax_free
Ast_add_6:
[00046ab6] 7001                      moveq.l    #1,d0
[00046ab8] d0af 0004                 add.l      4(a7),d0
[00046abc] 4eb9 0004 c608            jsr        Ax_malloc
[00046ac2] 2f48 0008                 move.l     a0,8(a7)
[00046ac6] 2eaf 0004                 move.l     4(a7),(a7)
[00046aca] 202f 0008                 move.l     8(a7),d0
[00046ace] 6606                      bne.s      Ast_add_5
[00046ad0] 206f 0016                 movea.l    22(a7),a0
[00046ad4] 604c                      bra.s      Ast_add_2
Ast_add_5:
[00046ad6] 226f 000c                 movea.l    12(a7),a1
[00046ada] 206f 0008                 movea.l    8(a7),a0
[00046ade] 4eb9 0008 2f0c            jsr        strcpy
[00046ae4] 206f 0008                 movea.l    8(a7),a0
[00046ae8] 6100 fb52                 bsr        Ast_alltrim
[00046aec] 226f 0008                 movea.l    8(a7),a1
[00046af0] 206f 0016                 movea.l    22(a7),a0
[00046af4] 4eb9 0008 2e42            jsr        strcat
Ast_add_4:
[00046afa] 526f 0010                 addq.w     #1,16(a7)
Ast_add_3:
[00046afe] 302f 0010                 move.w     16(a7),d0
[00046b02] b06f 001a                 cmp.w      26(a7),d0
[00046b06] 6d00 ff6e                 blt        Ast_add_7
[00046b0a] 202f 0008                 move.l     8(a7),d0
[00046b0e] 670a                      beq.s      Ast_add_8
[00046b10] 206f 0008                 movea.l    8(a7),a0
[00046b14] 4eb9 0004 c7c8            jsr        Ax_free
Ast_add_8:
[00046b1a] 206f 0016                 movea.l    22(a7),a0
[00046b1e] 6100 fb1c                 bsr        Ast_alltrim
Ast_add_2:
[00046b22] 4fef 001c                 lea.l      28(a7),a7
[00046b26] 4e75                      rts

	.globl Ast_adl
Ast_adl:
[00046b28] 4fef fff4                 lea.l      -12(a7),a7
[00046b2c] 2f48 0008                 move.l     a0,8(a7)
[00046b30] 2f40 0004                 move.l     d0,4(a7)
[00046b34] 206f 0008                 movea.l    8(a7),a0
[00046b38] 4eb9 0008 2f6c            jsr        strlen
[00046b3e] 2e80                      move.l     d0,(a7)
[00046b40] 202f 0008                 move.l     8(a7),d0
[00046b44] 6604                      bne.s      Ast_adl_1
[00046b46] 91c8                      suba.l     a0,a0
[00046b48] 602e                      bra.s      Ast_adl_2
Ast_adl_1:
[00046b4a] 2017                      move.l     (a7),d0
[00046b4c] b0af 0004                 cmp.l      4(a7),d0
[00046b50] 6c16                      bge.s      Ast_adl_3
[00046b52] 222f 0004                 move.l     4(a7),d1
[00046b56] 9297                      sub.l      (a7),d1
[00046b58] 7020                      moveq.l    #32,d0
[00046b5a] 2417                      move.l     (a7),d2
[00046b5c] 206f 0008                 movea.l    8(a7),a0
[00046b60] d1c2                      adda.l     d2,a0
[00046b62] 4eb9 0008 36ea            jsr        memset
Ast_adl_3:
[00046b68] 202f 0004                 move.l     4(a7),d0
[00046b6c] 206f 0008                 movea.l    8(a7),a0
[00046b70] 4230 0800                 clr.b      0(a0,d0.l)
[00046b74] 206f 0008                 movea.l    8(a7),a0
Ast_adl_2:
[00046b78] 4fef 000c                 lea.l      12(a7),a7
[00046b7c] 4e75                      rts

	.globl Ast_adr
Ast_adr:
[00046b7e] 4fef fff4                 lea.l      -12(a7),a7
[00046b82] 2f48 0008                 move.l     a0,8(a7)
[00046b86] 2f40 0004                 move.l     d0,4(a7)
[00046b8a] 206f 0008                 movea.l    8(a7),a0
[00046b8e] 4eb9 0008 2f6c            jsr        strlen
[00046b94] 2e80                      move.l     d0,(a7)
[00046b96] 202f 0008                 move.l     8(a7),d0
[00046b9a] 6604                      bne.s      Ast_adr_1
[00046b9c] 91c8                      suba.l     a0,a0
[00046b9e] 6042                      bra.s      Ast_adr_2
Ast_adr_1:
[00046ba0] 2017                      move.l     (a7),d0
[00046ba2] b0af 0004                 cmp.l      4(a7),d0
[00046ba6] 6c2a                      bge.s      Ast_adr_3
[00046ba8] 2017                      move.l     (a7),d0
[00046baa] 226f 0008                 movea.l    8(a7),a1
[00046bae] 222f 0004                 move.l     4(a7),d1
[00046bb2] 9297                      sub.l      (a7),d1
[00046bb4] 206f 0008                 movea.l    8(a7),a0
[00046bb8] d1c1                      adda.l     d1,a0
[00046bba] 4eb9 0008 3500            jsr        memcpy
[00046bc0] 222f 0004                 move.l     4(a7),d1
[00046bc4] 9297                      sub.l      (a7),d1
[00046bc6] 7020                      moveq.l    #32,d0
[00046bc8] 206f 0008                 movea.l    8(a7),a0
[00046bcc] 4eb9 0008 36ea            jsr        memset
Ast_adr_3:
[00046bd2] 202f 0004                 move.l     4(a7),d0
[00046bd6] 206f 0008                 movea.l    8(a7),a0
[00046bda] 4230 0800                 clr.b      0(a0,d0.l)
[00046bde] 206f 0008                 movea.l    8(a7),a0
Ast_adr_2:
[00046be2] 4fef 000c                 lea.l      12(a7),a7
[00046be6] 4e75                      rts

	.globl Ast_adc
Ast_adc:
[00046be8] 4fef fff0                 lea.l      -16(a7),a7
[00046bec] 2f48 000c                 move.l     a0,12(a7)
[00046bf0] 2f40 0008                 move.l     d0,8(a7)
[00046bf4] 202f 000c                 move.l     12(a7),d0
[00046bf8] 6604                      bne.s      Ast_adc_1
[00046bfa] 91c8                      suba.l     a0,a0
[00046bfc] 604a                      bra.s      Ast_adc_2
Ast_adc_1:
[00046bfe] 206f 000c                 movea.l    12(a7),a0
[00046c02] 4eb9 0008 2f6c            jsr        strlen
[00046c08] 2f40 0004                 move.l     d0,4(a7)
[00046c0c] 202f 0008                 move.l     8(a7),d0
[00046c10] 90af 0004                 sub.l      4(a7),d0
[00046c14] 2e80                      move.l     d0,(a7)
[00046c16] 2017                      move.l     (a7),d0
[00046c18] 6f1e                      ble.s      Ast_adc_3
[00046c1a] 2017                      move.l     (a7),d0
[00046c1c] e280                      asr.l      #1,d0
[00046c1e] 206f 000c                 movea.l    12(a7),a0
[00046c22] 6100 ff04                 bsr        Ast_adl
[00046c26] 2017                      move.l     (a7),d0
[00046c28] e280                      asr.l      #1,d0
[00046c2a] 7201                      moveq.l    #1,d1
[00046c2c] c297                      and.l      (a7),d1
[00046c2e] d081                      add.l      d1,d0
[00046c30] 206f 000c                 movea.l    12(a7),a0
[00046c34] 6100 ff48                 bsr        Ast_adr
Ast_adc_3:
[00046c38] 202f 0008                 move.l     8(a7),d0
[00046c3c] 206f 000c                 movea.l    12(a7),a0
[00046c40] 4230 0800                 clr.b      0(a0,d0.l)
[00046c44] 206f 000c                 movea.l    12(a7),a0
Ast_adc_2:
[00046c48] 4fef 0010                 lea.l      16(a7),a7
[00046c4c] 4e75                      rts

	.globl Ast_filter
Ast_filter:
[00046c4e] 4fef fff0                 lea.l      -16(a7),a7
[00046c52] 2f48 000c                 move.l     a0,12(a7)
[00046c56] 2f49 0008                 move.l     a1,8(a7)
[00046c5a] 202f 000c                 move.l     12(a7),d0
[00046c5e] 670c                      beq.s      Ast_filter_1
[00046c60] 202f 0008                 move.l     8(a7),d0
[00046c64] 660c                      bne.s      Ast_filter_2
[00046c66] 202f 0014                 move.l     20(a7),d0
[00046c6a] 6606                      bne.s      Ast_filter_2
Ast_filter_1:
[00046c6c] 91c8                      suba.l     a0,a0
[00046c6e] 6000 0090                 bra        Ast_filter_3
Ast_filter_2:
[00046c72] 206f 000c                 movea.l    12(a7),a0
[00046c76] 2e88                      move.l     a0,(a7)
[00046c78] 2f48 0004                 move.l     a0,4(a7)
[00046c7c] 606a                      bra.s      Ast_filter_4
Ast_filter_13:
[00046c7e] 6004                      bra.s      Ast_filter_5
Ast_filter_7:
[00046c80] 52af 0004                 addq.l     #1,4(a7)
Ast_filter_5:
[00046c84] 202f 0008                 move.l     8(a7),d0
[00046c88] 671e                      beq.s      Ast_filter_6
[00046c8a] 206f 0004                 movea.l    4(a7),a0
[00046c8e] 1010                      move.b     (a0),d0
[00046c90] 6716                      beq.s      Ast_filter_6
[00046c92] 206f 0004                 movea.l    4(a7),a0
[00046c96] 1010                      move.b     (a0),d0
[00046c98] 4880                      ext.w      d0
[00046c9a] 206f 0008                 movea.l    8(a7),a0
[00046c9e] 4eb9 0008 2e8a            jsr        strchr
[00046ca4] 2008                      move.l     a0,d0
[00046ca6] 66d8                      bne.s      Ast_filter_7
Ast_filter_6:
[00046ca8] 6004                      bra.s      Ast_filter_8
Ast_filter_10:
[00046caa] 52af 0004                 addq.l     #1,4(a7)
Ast_filter_8:
[00046cae] 202f 0014                 move.l     20(a7),d0
[00046cb2] 671e                      beq.s      Ast_filter_9
[00046cb4] 206f 0004                 movea.l    4(a7),a0
[00046cb8] 1010                      move.b     (a0),d0
[00046cba] 6716                      beq.s      Ast_filter_9
[00046cbc] 206f 0004                 movea.l    4(a7),a0
[00046cc0] 1010                      move.b     (a0),d0
[00046cc2] 4880                      ext.w      d0
[00046cc4] 206f 0014                 movea.l    20(a7),a0
[00046cc8] 4eb9 0008 2e8a            jsr        strchr
[00046cce] 2008                      move.l     a0,d0
[00046cd0] 67d8                      beq.s      Ast_filter_10
Ast_filter_9:
[00046cd2] 206f 0004                 movea.l    4(a7),a0
[00046cd6] b1d7                      cmpa.l     (a7),a0
[00046cd8] 6708                      beq.s      Ast_filter_11
[00046cda] 206f 0004                 movea.l    4(a7),a0
[00046cde] 2257                      movea.l    (a7),a1
[00046ce0] 1290                      move.b     (a0),(a1)
Ast_filter_11:
[00046ce2] 52af 0004                 addq.l     #1,4(a7)
[00046ce6] 5297                      addq.l     #1,(a7)
Ast_filter_4:
[00046ce8] 206f 0004                 movea.l    4(a7),a0
[00046cec] 1010                      move.b     (a0),d0
[00046cee] 6708                      beq.s      Ast_filter_12
[00046cf0] 2057                      movea.l    (a7),a0
[00046cf2] 1010                      move.b     (a0),d0
[00046cf4] 6600 ff88                 bne.w      Ast_filter_13
Ast_filter_12:
[00046cf8] 2057                      movea.l    (a7),a0
[00046cfa] 4210                      clr.b      (a0)
[00046cfc] 206f 000c                 movea.l    12(a7),a0
Ast_filter_3:
[00046d00] 4fef 0010                 lea.l      16(a7),a7
[00046d04] 4e75                      rts

	.globl Ast_count
Ast_count:
[00046d06] 4fef fff0                 lea.l      -16(a7),a7
[00046d0a] 2f48 000c                 move.l     a0,12(a7)
[00046d0e] 2f49 0008                 move.l     a1,8(a7)
[00046d12] 202f 000c                 move.l     12(a7),d0
[00046d16] 6608                      bne.s      Ast_count_1
[00046d18] 2f7c 000e 05da 000c       move.l     #null_string,12(a7)
Ast_count_1:
[00046d20] 42af 0004                 clr.l      4(a7)
[00046d24] 2eaf 000c                 move.l     12(a7),(a7)
[00046d28] 601a                      bra.s      Ast_count_2
Ast_count_4:
[00046d2a] 2057                      movea.l    (a7),a0
[00046d2c] 1010                      move.b     (a0),d0
[00046d2e] 4880                      ext.w      d0
[00046d30] 206f 0008                 movea.l    8(a7),a0
[00046d34] 4eb9 0008 2e8a            jsr        strchr
[00046d3a] 2008                      move.l     a0,d0
[00046d3c] 6704                      beq.s      Ast_count_3
[00046d3e] 52af 0004                 addq.l     #1,4(a7)
Ast_count_3:
[00046d42] 5297                      addq.l     #1,(a7)
Ast_count_2:
[00046d44] 2057                      movea.l    (a7),a0
[00046d46] 1010                      move.b     (a0),d0
[00046d48] 66e0                      bne.s      Ast_count_4
[00046d4a] 202f 0004                 move.l     4(a7),d0
[00046d4e] 4fef 0010                 lea.l      16(a7),a7
[00046d52] 4e75                      rts

strfsearchafterwc:
[00046d54] 4fef ffe2                 lea.l      -30(a7),a7
[00046d58] 2f48 001a                 move.l     a0,26(a7)
[00046d5c] 2f49 0016                 move.l     a1,22(a7)
[00046d60] 206f 0016                 movea.l    22(a7),a0
[00046d64] 2050                      movea.l    (a0),a0
[00046d66] 1010                      move.b     (a0),d0
[00046d68] 4880                      ext.w      d0
[00046d6a] 206f 0026                 movea.l    38(a7),a0
[00046d6e] 4eb9 0008 2e8a            jsr        strchr
[00046d74] 2008                      move.l     a0,d0
[00046d76] 6712                      beq.s      strfsearchafterwc_1
[00046d78] 206f 0016                 movea.l    22(a7),a0
[00046d7c] 5290                      addq.l     #1,(a0)
[00046d7e] 206f 001a                 movea.l    26(a7),a0
[00046d82] 5290                      addq.l     #1,(a0)
[00046d84] 7001                      moveq.l    #1,d0
[00046d86] 6000 00f0                 bra        strfsearchafterwc_2
strfsearchafterwc_1:
[00046d8a] 6006                      bra.s      strfsearchafterwc_3
strfsearchafterwc_5:
[00046d8c] 206f 0016                 movea.l    22(a7),a0
[00046d90] 5290                      addq.l     #1,(a0)
strfsearchafterwc_3:
[00046d92] 206f 0016                 movea.l    22(a7),a0
[00046d96] 2050                      movea.l    (a0),a0
[00046d98] 1010                      move.b     (a0),d0
[00046d9a] 6718                      beq.s      strfsearchafterwc_4
[00046d9c] 206f 0016                 movea.l    22(a7),a0
[00046da0] 2050                      movea.l    (a0),a0
[00046da2] 1010                      move.b     (a0),d0
[00046da4] 4880                      ext.w      d0
[00046da6] 206f 0022                 movea.l    34(a7),a0
[00046daa] 4eb9 0008 2e8a            jsr        strchr
[00046db0] 2008                      move.l     a0,d0
[00046db2] 66d8                      bne.s      strfsearchafterwc_5
strfsearchafterwc_4:
[00046db4] 206f 0016                 movea.l    22(a7),a0
[00046db8] 2050                      movea.l    (a0),a0
[00046dba] 1010                      move.b     (a0),d0
[00046dbc] 661c                      bne.s      strfsearchafterwc_6
[00046dbe] 6006                      bra.s      strfsearchafterwc_7
strfsearchafterwc_8:
[00046dc0] 206f 001a                 movea.l    26(a7),a0
[00046dc4] 5290                      addq.l     #1,(a0)
strfsearchafterwc_7:
[00046dc6] 206f 001a                 movea.l    26(a7),a0
[00046dca] 2050                      movea.l    (a0),a0
[00046dcc] 1010                      move.b     (a0),d0
[00046dce] 66f0                      bne.s      strfsearchafterwc_8
[00046dd0] 7001                      moveq.l    #1,d0
[00046dd2] 6000 00a4                 bra        strfsearchafterwc_2
[00046dd6] 6000 009e                 bra        strfsearchafterwc_9
strfsearchafterwc_6:
[00046dda] 226f 0022                 movea.l    34(a7),a1
[00046dde] 206f 0016                 movea.l    22(a7),a0
[00046de2] 2050                      movea.l    (a0),a0
[00046de4] 4eb9 0008 2f52            jsr        strcspn
[00046dea] 2f40 000e                 move.l     d0,14(a7)
[00046dee] 226f 0026                 movea.l    38(a7),a1
[00046df2] 206f 0016                 movea.l    22(a7),a0
[00046df6] 2050                      movea.l    (a0),a0
[00046df8] 4eb9 0008 2f52            jsr        strcspn
[00046dfe] 2f40 0012                 move.l     d0,18(a7)
[00046e02] 202f 000e                 move.l     14(a7),d0
[00046e06] b0af 0012                 cmp.l      18(a7),d0
[00046e0a] 6406                      bcc.s      strfsearchafterwc_10
[00046e0c] 202f 000e                 move.l     14(a7),d0
[00046e10] 6004                      bra.s      strfsearchafterwc_11
strfsearchafterwc_10:
[00046e12] 202f 0012                 move.l     18(a7),d0
strfsearchafterwc_11:
[00046e16] 2f40 000a                 move.l     d0,10(a7)
[00046e1a] 202f 000a                 move.l     10(a7),d0
[00046e1e] 206f 0016                 movea.l    22(a7),a0
[00046e22] 2050                      movea.l    (a0),a0
[00046e24] d1c0                      adda.l     d0,a0
[00046e26] 2f48 0002                 move.l     a0,2(a7)
[00046e2a] 206f 0002                 movea.l    2(a7),a0
[00046e2e] 1e90                      move.b     (a0),(a7)
[00046e30] 206f 0002                 movea.l    2(a7),a0
[00046e34] 4210                      clr.b      (a0)
[00046e36] 206f 0016                 movea.l    22(a7),a0
[00046e3a] 2250                      movea.l    (a0),a1
[00046e3c] 206f 001a                 movea.l    26(a7),a0
[00046e40] 2050                      movea.l    (a0),a0
[00046e42] 4eb9 0008 3008            jsr        strstr
[00046e48] 2f48 0006                 move.l     a0,6(a7)
[00046e4c] 206f 0002                 movea.l    2(a7),a0
[00046e50] 1097                      move.b     (a7),(a0)
[00046e52] 206f 0016                 movea.l    22(a7),a0
[00046e56] 20af 0002                 move.l     2(a7),(a0)
[00046e5a] 202f 0006                 move.l     6(a7),d0
[00046e5e] 6604                      bne.s      strfsearchafterwc_12
[00046e60] 4240                      clr.w      d0
[00046e62] 6014                      bra.s      strfsearchafterwc_2
strfsearchafterwc_12:
[00046e64] 202f 000a                 move.l     10(a7),d0
[00046e68] 206f 001a                 movea.l    26(a7),a0
[00046e6c] 2050                      movea.l    (a0),a0
[00046e6e] d1c0                      adda.l     d0,a0
[00046e70] 226f 001a                 movea.l    26(a7),a1
[00046e74] 2288                      move.l     a0,(a1)
strfsearchafterwc_9:
[00046e76] 7001                      moveq.l    #1,d0
strfsearchafterwc_2:
[00046e78] 4fef 001e                 lea.l      30(a7),a7
[00046e7c] 4e75                      rts

	.glob Ast_fcmp
Ast_fcmp:
[00046e7e] 4fef ffd0                 lea.l      -48(a7),a7
[00046e82] 2f48 002c                 move.l     a0,44(a7)
[00046e86] 2f49 0028                 move.l     a1,40(a7)
[00046e8a] 41f9 000e 05db            lea.l      $000E05DB,a0
[00046e90] 43ef 0026                 lea.l      38(a7),a1
[00046e94] 12d8                      move.b     (a0)+,(a1)+
[00046e96] 12d8                      move.b     (a0)+,(a1)+
[00046e98] 41f9 000e 05dd            lea.l      $000E05DD,a0
[00046e9e] 43ef 0024                 lea.l      36(a7),a1
[00046ea2] 12d8                      move.b     (a0)+,(a1)+
[00046ea4] 12d8                      move.b     (a0)+,(a1)+
[00046ea6] 206f 002c                 movea.l    44(a7),a0
[00046eaa] 6100 fb4a                 bsr        Ast_isEmpty
[00046eae] 4a40                      tst.w      d0
[00046eb0] 660c                      bne.s      Ast_fcmp_1
[00046eb2] 206f 0028                 movea.l    40(a7),a0
[00046eb6] 6100 fb3e                 bsr        Ast_isEmpty
[00046eba] 4a40                      tst.w      d0
[00046ebc] 6706                      beq.s      Ast_fcmp_2
Ast_fcmp_1:
[00046ebe] 4240                      clr.w      d0
[00046ec0] 6000 020e                 bra        Ast_fcmp_3
Ast_fcmp_2:
[00046ec4] 206f 002c                 movea.l    44(a7),a0
[00046ec8] 4eb9 0008 2f6c            jsr        strlen
[00046ece] 2f40 000c                 move.l     d0,12(a7)
[00046ed2] 206f 0028                 movea.l    40(a7),a0
[00046ed6] 4eb9 0008 2f6c            jsr        strlen
[00046edc] 2f40 0008                 move.l     d0,8(a7)
[00046ee0] 43ef 0026                 lea.l      38(a7),a1
[00046ee4] 206f 002c                 movea.l    44(a7),a0
[00046ee8] 4eb9 0008 2f52            jsr        strcspn
[00046eee] b0af 000c                 cmp.l      12(a7),d0
[00046ef2] 6704                      beq.s      Ast_fcmp_4
[00046ef4] 7001                      moveq.l    #1,d0
[00046ef6] 6002                      bra.s      Ast_fcmp_5
Ast_fcmp_4:
[00046ef8] 4240                      clr.w      d0
Ast_fcmp_5:
[00046efa] 3f40 0020                 move.w     d0,32(a7)
[00046efe] 43ef 0026                 lea.l      38(a7),a1
[00046f02] 206f 0028                 movea.l    40(a7),a0
[00046f06] 4eb9 0008 2f52            jsr        strcspn
[00046f0c] b0af 0008                 cmp.l      8(a7),d0
[00046f10] 6704                      beq.s      Ast_fcmp_6
[00046f12] 7001                      moveq.l    #1,d0
[00046f14] 6002                      bra.s      Ast_fcmp_7
Ast_fcmp_6:
[00046f16] 4240                      clr.w      d0
Ast_fcmp_7:
[00046f18] 3f40 0022                 move.w     d0,34(a7)
[00046f1c] 43ef 0024                 lea.l      36(a7),a1
[00046f20] 206f 002c                 movea.l    44(a7),a0
[00046f24] 4eb9 0008 2f52            jsr        strcspn
[00046f2a] b0af 000c                 cmp.l      12(a7),d0
[00046f2e] 6704                      beq.s      Ast_fcmp_8
[00046f30] 7001                      moveq.l    #1,d0
[00046f32] 6002                      bra.s      Ast_fcmp_9
Ast_fcmp_8:
[00046f34] 4240                      clr.w      d0
Ast_fcmp_9:
[00046f36] 3f40 001c                 move.w     d0,28(a7)
[00046f3a] 43ef 0024                 lea.l      36(a7),a1
[00046f3e] 206f 0028                 movea.l    40(a7),a0
[00046f42] 4eb9 0008 2f52            jsr        strcspn
[00046f48] b0af 0008                 cmp.l      8(a7),d0
[00046f4c] 6704                      beq.s      Ast_fcmp_10
[00046f4e] 7001                      moveq.l    #1,d0
[00046f50] 6002                      bra.s      Ast_fcmp_11
Ast_fcmp_10:
[00046f52] 4240                      clr.w      d0
Ast_fcmp_11:
[00046f54] 3f40 001e                 move.w     d0,30(a7)
[00046f58] 302f 0022                 move.w     34(a7),d0
[00046f5c] 6606                      bne.s      Ast_fcmp_12
[00046f5e] 302f 001e                 move.w     30(a7),d0
[00046f62] 6706                      beq.s      Ast_fcmp_13
Ast_fcmp_12:
[00046f64] 4240                      clr.w      d0
[00046f66] 6000 0168                 bra        Ast_fcmp_3
Ast_fcmp_13:
[00046f6a] 2f6f 002c 0004            move.l     44(a7),4(a7)
[00046f70] 2eaf 0028                 move.l     40(a7),(a7)
[00046f74] 6000 0138                 bra        Ast_fcmp_14
Ast_fcmp_34:
[00046f78] 206f 0004                 movea.l    4(a7),a0
[00046f7c] 1010                      move.b     (a0),d0
[00046f7e] 4880                      ext.w      d0
[00046f80] 41ef 0026                 lea.l      38(a7),a0
[00046f84] 4eb9 0008 2e8a            jsr        strchr
[00046f8a] 2008                      move.l     a0,d0
[00046f8c] 6704                      beq.s      Ast_fcmp_15
[00046f8e] 7001                      moveq.l    #1,d0
[00046f90] 6002                      bra.s      Ast_fcmp_16
Ast_fcmp_15:
[00046f92] 4240                      clr.w      d0
Ast_fcmp_16:
[00046f94] 3f40 0014                 move.w     d0,20(a7)
[00046f98] 2057                      movea.l    (a7),a0
[00046f9a] 1010                      move.b     (a0),d0
[00046f9c] 4880                      ext.w      d0
[00046f9e] 41ef 0026                 lea.l      38(a7),a0
[00046fa2] 4eb9 0008 2e8a            jsr        strchr
[00046fa8] 2008                      move.l     a0,d0
[00046faa] 6704                      beq.s      Ast_fcmp_17
[00046fac] 7001                      moveq.l    #1,d0
[00046fae] 6002                      bra.s      Ast_fcmp_18
Ast_fcmp_17:
[00046fb0] 4240                      clr.w      d0
Ast_fcmp_18:
[00046fb2] 3f40 0016                 move.w     d0,22(a7)
[00046fb6] 206f 0004                 movea.l    4(a7),a0
[00046fba] 1010                      move.b     (a0),d0
[00046fbc] 4880                      ext.w      d0
[00046fbe] 41ef 0024                 lea.l      36(a7),a0
[00046fc2] 4eb9 0008 2e8a            jsr        strchr
[00046fc8] 2008                      move.l     a0,d0
[00046fca] 6704                      beq.s      Ast_fcmp_19
[00046fcc] 7001                      moveq.l    #1,d0
[00046fce] 6002                      bra.s      Ast_fcmp_20
Ast_fcmp_19:
[00046fd0] 4240                      clr.w      d0
Ast_fcmp_20:
[00046fd2] 3f40 0010                 move.w     d0,16(a7)
[00046fd6] 2057                      movea.l    (a7),a0
[00046fd8] 1010                      move.b     (a0),d0
[00046fda] 4880                      ext.w      d0
[00046fdc] 41ef 0024                 lea.l      36(a7),a0
[00046fe0] 4eb9 0008 2e8a            jsr        strchr
[00046fe6] 2008                      move.l     a0,d0
[00046fe8] 6704                      beq.s      Ast_fcmp_21
[00046fea] 7001                      moveq.l    #1,d0
[00046fec] 6002                      bra.s      Ast_fcmp_22
Ast_fcmp_21:
[00046fee] 4240                      clr.w      d0
Ast_fcmp_22:
[00046ff0] 3f40 0012                 move.w     d0,18(a7)
[00046ff4] 302f 0014                 move.w     20(a7),d0
[00046ff8] 6606                      bne.s      Ast_fcmp_23
[00046ffa] 302f 0010                 move.w     16(a7),d0
[00046ffe] 6704                      beq.s      Ast_fcmp_24
Ast_fcmp_23:
[00047000] 7001                      moveq.l    #1,d0
[00047002] 6002                      bra.s      Ast_fcmp_25
Ast_fcmp_24:
[00047004] 4240                      clr.w      d0
Ast_fcmp_25:
[00047006] 3f40 0018                 move.w     d0,24(a7)
[0004700a] 302f 0016                 move.w     22(a7),d0
[0004700e] 6606                      bne.s      Ast_fcmp_26
[00047010] 302f 0012                 move.w     18(a7),d0
[00047014] 6704                      beq.s      Ast_fcmp_27
Ast_fcmp_26:
[00047016] 7001                      moveq.l    #1,d0
[00047018] 6002                      bra.s      Ast_fcmp_28
Ast_fcmp_27:
[0004701a] 4240                      clr.w      d0
Ast_fcmp_28:
[0004701c] 3f40 001a                 move.w     d0,26(a7)
[00047020] 302f 0018                 move.w     24(a7),d0
[00047024] 6620                      bne.s      Ast_fcmp_29
[00047026] 302f 001a                 move.w     26(a7),d0
[0004702a] 661a                      bne.s      Ast_fcmp_29
[0004702c] 206f 0004                 movea.l    4(a7),a0
[00047030] 1010                      move.b     (a0),d0
[00047032] 2057                      movea.l    (a7),a0
[00047034] b010                      cmp.b      (a0),d0
[00047036] 6706                      beq.s      Ast_fcmp_30
[00047038] 4240                      clr.w      d0
[0004703a] 6000 0094                 bra        Ast_fcmp_3
Ast_fcmp_30:
[0004703e] 52af 0004                 addq.l     #1,4(a7)
[00047042] 5297                      addq.l     #1,(a7)
[00047044] 6068                      bra.s      Ast_fcmp_14
Ast_fcmp_29:
[00047046] 302f 0010                 move.w     16(a7),d0
[0004704a] 670e                      beq.s      Ast_fcmp_31
[0004704c] 302f 0012                 move.w     18(a7),d0
[00047050] 6708                      beq.s      Ast_fcmp_31
[00047052] 52af 0004                 addq.l     #1,4(a7)
[00047056] 5297                      addq.l     #1,(a7)
[00047058] 6054                      bra.s      Ast_fcmp_14
Ast_fcmp_31:
[0004705a] 302f 0018                 move.w     24(a7),d0
[0004705e] 6724                      beq.s      Ast_fcmp_32
[00047060] 302f 001a                 move.w     26(a7),d0
[00047064] 661e                      bne.s      Ast_fcmp_32
[00047066] 486f 0024                 pea.l      36(a7)
[0004706a] 486f 002a                 pea.l      42(a7)
[0004706e] 43ef 000c                 lea.l      12(a7),a1
[00047072] 41ef 0008                 lea.l      8(a7),a0
[00047076] 6100 fcdc                 bsr        strfsearchafterwc
[0004707a] 504f                      addq.w     #8,a7
[0004707c] 4a40                      tst.w      d0
[0004707e] 6604                      bne.s      Ast_fcmp_32
[00047080] 4240                      clr.w      d0
[00047082] 604c                      bra.s      Ast_fcmp_3
Ast_fcmp_32:
[00047084] 302f 001a                 move.w     26(a7),d0
[00047088] 6724                      beq.s      Ast_fcmp_14
[0004708a] 302f 0018                 move.w     24(a7),d0
[0004708e] 661e                      bne.s      Ast_fcmp_14
[00047090] 486f 0024                 pea.l      36(a7)
[00047094] 486f 002a                 pea.l      42(a7)
[00047098] 43ef 0008                 lea.l      8(a7),a1
[0004709c] 41ef 000c                 lea.l      12(a7),a0
[000470a0] 6100 fcb2                 bsr        strfsearchafterwc
[000470a4] 504f                      addq.w     #8,a7
[000470a6] 4a40                      tst.w      d0
[000470a8] 6604                      bne.s      Ast_fcmp_14
[000470aa] 4240                      clr.w      d0
[000470ac] 6022                      bra.s      Ast_fcmp_3
Ast_fcmp_14:
[000470ae] 206f 0004                 movea.l    4(a7),a0
[000470b2] 1010                      move.b     (a0),d0
[000470b4] 6708                      beq.s      Ast_fcmp_33
[000470b6] 2057                      movea.l    (a7),a0
[000470b8] 1010                      move.b     (a0),d0
[000470ba] 6600 febc                 bne        Ast_fcmp_34
Ast_fcmp_33:
[000470be] 206f 0004                 movea.l    4(a7),a0
[000470c2] 1010                      move.b     (a0),d0
[000470c4] 2057                      movea.l    (a7),a0
[000470c6] b010                      cmp.b      (a0),d0
[000470c8] 6604                      bne.s      Ast_fcmp_35
[000470ca] 7001                      moveq.l    #1,d0
[000470cc] 6002                      bra.s      Ast_fcmp_3
Ast_fcmp_35:
[000470ce] 4240                      clr.w      d0
Ast_fcmp_3:
[000470d0] 4fef 0030                 lea.l      48(a7),a7
[000470d4] 4e75                      rts

	.globl Ast_countASCIZZ
Ast_countASCIZZ:
[000470d6] 4fef fff6                 lea.l      -10(a7),a7
[000470da] 2f48 0006                 move.l     a0,6(a7)
[000470de] 2f6f 0006 0002            move.l     6(a7),2(a7)
[000470e4] 4257                      clr.w      (a7)
Ast_countASCIZZ_1:
[000470e6] 5257                      addq.w     #1,(a7)
[000470e8] 206f 0002                 movea.l    2(a7),a0
[000470ec] 4eb9 0008 2f6c            jsr        strlen
[000470f2] 5280                      addq.l     #1,d0
[000470f4] d1af 0002                 add.l      d0,2(a7)
[000470f8] 206f 0002                 movea.l    2(a7),a0
[000470fc] 1010                      move.b     (a0),d0
[000470fe] 66e6                      bne.s      Ast_countASCIZZ_1
[00047100] 3017                      move.w     (a7),d0
[00047102] 4fef 000a                 lea.l      10(a7),a7
[00047106] 4e75                      rts

	.globl Ast_splitASCIIZZ
Ast_splitASCIIZZ:
[00047108] 4fef ffee                 lea.l      -18(a7),a7
[0004710c] 2f48 000e                 move.l     a0,14(a7)
[00047110] 2f49 000a                 move.l     a1,10(a7)
[00047114] 206f 000e                 movea.l    14(a7),a0
[00047118] 6100 ffbc                 bsr.w      Ast_countASCIZZ
[0004711c] 206f 0016                 movea.l    22(a7),a0
[00047120] 3080                      move.w     d0,(a0)
[00047122] 206f 0016                 movea.l    22(a7),a0
[00047126] 3010                      move.w     (a0),d0
[00047128] 48c0                      ext.l      d0
[0004712a] e588                      lsl.l      #2,d0
[0004712c] 4eb9 0004 c608            jsr        Ax_malloc
[00047132] 2e88                      move.l     a0,(a7)
[00047134] 226f 000a                 movea.l    10(a7),a1
[00047138] 2288                      move.l     a0,(a1)
[0004713a] 2017                      move.l     (a7),d0
[0004713c] 6604                      bne.s      Ast_splitASCIIZZ_1
[0004713e] 4240                      clr.w      d0
[00047140] 603c                      bra.s      Ast_splitASCIIZZ_2
Ast_splitASCIIZZ_1:
[00047142] 2f6f 000e 0004            move.l     14(a7),4(a7)
[00047148] 426f 0008                 clr.w      8(a7)
[0004714c] 6022                      bra.s      Ast_splitASCIIZZ_3
Ast_splitASCIIZZ_4:
[0004714e] 206f 0004                 movea.l    4(a7),a0
[00047152] 6100 f2e8                 bsr        Ast_create
[00047156] 2257                      movea.l    (a7),a1
[00047158] 2288                      move.l     a0,(a1)
[0004715a] 206f 0004                 movea.l    4(a7),a0
[0004715e] 4eb9 0008 2f6c            jsr        strlen
[00047164] 5280                      addq.l     #1,d0
[00047166] d1af 0004                 add.l      d0,4(a7)
[0004716a] 526f 0008                 addq.w     #1,8(a7)
[0004716e] 5897                      addq.l     #4,(a7)
Ast_splitASCIIZZ_3:
[00047170] 206f 0016                 movea.l    22(a7),a0
[00047174] 302f 0008                 move.w     8(a7),d0
[00047178] b050                      cmp.w      (a0),d0
[0004717a] 6dd2                      blt.s      Ast_splitASCIIZZ_4
[0004717c] 7001                      moveq.l    #1,d0
Ast_splitASCIIZZ_2:
[0004717e] 4fef 0012                 lea.l      18(a7),a7
[00047182] 4e75                      rts

	.globl Ast_mergeASCIIZZ
Ast_mergeASCIIZZ:
[00047184] 4fef ffe4                 lea.l      -28(a7),a7
[00047188] 2f48 0018                 move.l     a0,24(a7)
[0004718c] 3f40 0016                 move.w     d0,22(a7)
[00047190] 3f41 0014                 move.w     d1,20(a7)
[00047194] 2f7c 0000 0002 0004       move.l     #$00000002,4(a7)
[0004719c] 426f 0012                 clr.w      18(a7)
[000471a0] 6000 00ba                 bra        Ast_mergeASCIIZZ_1
Ast_mergeASCIIZZ_7:
[000471a4] 302f 0012                 move.w     18(a7),d0
[000471a8] 48c0                      ext.l      d0
[000471aa] e588                      lsl.l      #2,d0
[000471ac] 206f 0018                 movea.l    24(a7),a0
[000471b0] 2030 0800                 move.l     0(a0,d0.l),d0
[000471b4] 6700 00a2                 beq        Ast_mergeASCIIZZ_2
[000471b8] 302f 0012                 move.w     18(a7),d0
[000471bc] 48c0                      ext.l      d0
[000471be] e588                      lsl.l      #2,d0
[000471c0] 206f 0018                 movea.l    24(a7),a0
[000471c4] 2070 0800                 movea.l    0(a0,d0.l),a0
[000471c8] 1010                      move.b     (a0),d0
[000471ca] 6608                      bne.s      Ast_mergeASCIIZZ_3
[000471cc] 54af 0004                 addq.l     #2,4(a7)
[000471d0] 6000 0086                 bra        Ast_mergeASCIIZZ_2
Ast_mergeASCIIZZ_3:
[000471d4] 322f 0012                 move.w     18(a7),d1
[000471d8] 48c1                      ext.l      d1
[000471da] e589                      lsl.l      #2,d1
[000471dc] 206f 0018                 movea.l    24(a7),a0
[000471e0] 2070 1800                 movea.l    0(a0,d1.l),a0
[000471e4] 1010                      move.b     (a0),d0
[000471e6] 4880                      ext.w      d0
[000471e8] 41f9 000e 05e5            lea.l      $000E05E5,a0
[000471ee] 4eb9 0008 2e8a            jsr        strchr
[000471f4] 2008                      move.l     a0,d0
[000471f6] 661e                      bne.s      Ast_mergeASCIIZZ_4
[000471f8] 302f 0012                 move.w     18(a7),d0
[000471fc] 48c0                      ext.l      d0
[000471fe] e588                      lsl.l      #2,d0
[00047200] 206f 0018                 movea.l    24(a7),a0
[00047204] 2070 0800                 movea.l    0(a0,d0.l),a0
[00047208] 4eb9 0008 2f6c            jsr        strlen
[0004720e] 5280                      addq.l     #1,d0
[00047210] d1af 0004                 add.l      d0,4(a7)
[00047214] 6042                      bra.s      Ast_mergeASCIIZZ_2
Ast_mergeASCIIZZ_4:
[00047216] 302f 0012                 move.w     18(a7),d0
[0004721a] 48c0                      ext.l      d0
[0004721c] e588                      lsl.l      #2,d0
[0004721e] 206f 0018                 movea.l    24(a7),a0
[00047222] 2070 0800                 movea.l    0(a0,d0.l),a0
[00047226] 1010                      move.b     (a0),d0
[00047228] 4880                      ext.w      d0
[0004722a] 5340                      subq.w     #1,d0
[0004722c] 6706                      beq.s      Ast_mergeASCIIZZ_5
[0004722e] 5340                      subq.w     #1,d0
[00047230] 6702                      beq.s      Ast_mergeASCIIZZ_5
[00047232] 6020                      bra.s      Ast_mergeASCIIZZ_6
Ast_mergeASCIIZZ_5:
[00047234] 302f 0012                 move.w     18(a7),d0
[00047238] 48c0                      ext.l      d0
[0004723a] e588                      lsl.l      #2,d0
[0004723c] 206f 0018                 movea.l    24(a7),a0
[00047240] 2070 0800                 movea.l    0(a0,d0.l),a0
[00047244] 4eb9 0008 2f6c            jsr        strlen
[0004724a] d080                      add.l      d0,d0
[0004724c] 5480                      addq.l     #2,d0
[0004724e] d1af 0004                 add.l      d0,4(a7)
[00047252] 6004                      bra.s      Ast_mergeASCIIZZ_2
Ast_mergeASCIIZZ_6:
[00047254] 54af 0004                 addq.l     #2,4(a7)
Ast_mergeASCIIZZ_2:
[00047258] 526f 0012                 addq.w     #1,18(a7)
Ast_mergeASCIIZZ_1:
[0004725c] 302f 0012                 move.w     18(a7),d0
[00047260] b06f 0016                 cmp.w      22(a7),d0
[00047264] 6d00 ff3e                 blt        Ast_mergeASCIIZZ_7
[00047268] 302f 0014                 move.w     20(a7),d0
[0004726c] 670e                      beq.s      Ast_mergeASCIIZZ_8
[0004726e] 202f 0004                 move.l     4(a7),d0
[00047272] 4eb9 0004 c95e            jsr        Ax_glmalloc
[00047278] 2e88                      move.l     a0,(a7)
[0004727a] 600c                      bra.s      Ast_mergeASCIIZZ_9
Ast_mergeASCIIZZ_8:
[0004727c] 202f 0004                 move.l     4(a7),d0
[00047280] 4eb9 0004 c608            jsr        Ax_malloc
[00047286] 2e88                      move.l     a0,(a7)
Ast_mergeASCIIZZ_9:
[00047288] 2017                      move.l     (a7),d0
[0004728a] 6606                      bne.s      Ast_mergeASCIIZZ_10
[0004728c] 91c8                      suba.l     a0,a0
[0004728e] 6000 017a                 bra        Ast_mergeASCIIZZ_11
Ast_mergeASCIIZZ_10:
[00047292] 222f 0004                 move.l     4(a7),d1
[00047296] 4240                      clr.w      d0
[00047298] 2057                      movea.l    (a7),a0
[0004729a] 4eb9 0008 36ea            jsr        memset
[000472a0] 426f 0012                 clr.w      18(a7)
[000472a4] 2f57 000e                 move.l     (a7),14(a7)
[000472a8] 6000 0152                 bra        Ast_mergeASCIIZZ_12
Ast_mergeASCIIZZ_23:
[000472ac] 302f 0012                 move.w     18(a7),d0
[000472b0] 48c0                      ext.l      d0
[000472b2] e588                      lsl.l      #2,d0
[000472b4] 206f 0018                 movea.l    24(a7),a0
[000472b8] 2030 0800                 move.l     0(a0,d0.l),d0
[000472bc] 6700 012a                 beq        Ast_mergeASCIIZZ_13
[000472c0] 302f 0012                 move.w     18(a7),d0
[000472c4] 48c0                      ext.l      d0
[000472c6] e588                      lsl.l      #2,d0
[000472c8] 206f 0018                 movea.l    24(a7),a0
[000472cc] 2070 0800                 movea.l    0(a0,d0.l),a0
[000472d0] 1010                      move.b     (a0),d0
[000472d2] 6614                      bne.s      Ast_mergeASCIIZZ_14
[000472d4] 43f9 000e 05ec            lea.l      $000E05EC,a1
[000472da] 206f 000e                 movea.l    14(a7),a0
[000472de] 4eb9 0008 2f0c            jsr        strcpy
[000472e4] 6000 0102                 bra        Ast_mergeASCIIZZ_13
Ast_mergeASCIIZZ_14:
[000472e8] 322f 0012                 move.w     18(a7),d1
[000472ec] 48c1                      ext.l      d1
[000472ee] e589                      lsl.l      #2,d1
[000472f0] 206f 0018                 movea.l    24(a7),a0
[000472f4] 2070 1800                 movea.l    0(a0,d1.l),a0
[000472f8] 1010                      move.b     (a0),d0
[000472fa] 4880                      ext.w      d0
[000472fc] 41f9 000e 05ee            lea.l      $000E05EE,a0
[00047302] 4eb9 0008 2e8a            jsr        strchr
[00047308] 2008                      move.l     a0,d0
[0004730a] 661e                      bne.s      Ast_mergeASCIIZZ_15
[0004730c] 302f 0012                 move.w     18(a7),d0
[00047310] 48c0                      ext.l      d0
[00047312] e588                      lsl.l      #2,d0
[00047314] 206f 0018                 movea.l    24(a7),a0
[00047318] 2270 0800                 movea.l    0(a0,d0.l),a1
[0004731c] 206f 000e                 movea.l    14(a7),a0
[00047320] 4eb9 0008 2f0c            jsr        strcpy
[00047326] 6000 00c0                 bra        Ast_mergeASCIIZZ_13
Ast_mergeASCIIZZ_15:
[0004732a] 302f 0012                 move.w     18(a7),d0
[0004732e] 48c0                      ext.l      d0
[00047330] e588                      lsl.l      #2,d0
[00047332] 206f 0018                 movea.l    24(a7),a0
[00047336] 2070 0800                 movea.l    0(a0,d0.l),a0
[0004733a] 1010                      move.b     (a0),d0
[0004733c] 4880                      ext.w      d0
[0004733e] 5340                      subq.w     #1,d0
[00047340] 6708                      beq.s      Ast_mergeASCIIZZ_16
[00047342] 5340                      subq.w     #1,d0
[00047344] 6704                      beq.s      Ast_mergeASCIIZZ_16
[00047346] 6000 00a0                 bra        Ast_mergeASCIIZZ_13
Ast_mergeASCIIZZ_16:
[0004734a] 206f 000e                 movea.l    14(a7),a0
[0004734e] 52af 000e                 addq.l     #1,14(a7)
[00047352] 10bc 0002                 move.b     #$02,(a0)
[00047356] 302f 0012                 move.w     18(a7),d0
[0004735a] 48c0                      ext.l      d0
[0004735c] e588                      lsl.l      #2,d0
[0004735e] 206f 0018                 movea.l    24(a7),a0
[00047362] 2f70 0800 000a            move.l     0(a0,d0.l),10(a7)
[00047368] 6072                      bra.s      Ast_mergeASCIIZZ_17
Ast_mergeASCIIZZ_22:
[0004736a] 206f 000a                 movea.l    10(a7),a0
[0004736e] 1010                      move.b     (a0),d0
[00047370] 4880                      ext.w      d0
[00047372] e840                      asr.w      #4,d0
[00047374] 1f40 0008                 move.b     d0,8(a7)
[00047378] 0c2f 0009 0008            cmpi.b     #$09,8(a7)
[0004737e] 6f12                      ble.s      Ast_mergeASCIIZZ_18
[00047380] 7030                      moveq.l    #48,d0
[00047382] d02f 0008                 add.b      8(a7),d0
[00047386] 206f 000e                 movea.l    14(a7),a0
[0004738a] 52af 000e                 addq.l     #1,14(a7)
[0004738e] 1080                      move.b     d0,(a0)
[00047390] 6010                      bra.s      Ast_mergeASCIIZZ_19
Ast_mergeASCIIZZ_18:
[00047392] 7041                      moveq.l    #65,d0
[00047394] d02f 0008                 add.b      8(a7),d0
[00047398] 206f 000e                 movea.l    14(a7),a0
[0004739c] 52af 000e                 addq.l     #1,14(a7)
[000473a0] 1080                      move.b     d0,(a0)
Ast_mergeASCIIZZ_19:
[000473a2] 700f                      moveq.l    #15,d0
[000473a4] 206f 000a                 movea.l    10(a7),a0
[000473a8] c010                      and.b      (a0),d0
[000473aa] 1f40 0008                 move.b     d0,8(a7)
[000473ae] 0c2f 0009 0008            cmpi.b     #$09,8(a7)
[000473b4] 6f12                      ble.s      Ast_mergeASCIIZZ_20
[000473b6] 7030                      moveq.l    #48,d0
[000473b8] d02f 0008                 add.b      8(a7),d0
[000473bc] 206f 000e                 movea.l    14(a7),a0
[000473c0] 52af 000e                 addq.l     #1,14(a7)
[000473c4] 1080                      move.b     d0,(a0)
[000473c6] 6010                      bra.s      Ast_mergeASCIIZZ_21
Ast_mergeASCIIZZ_20:
[000473c8] 7041                      moveq.l    #65,d0
[000473ca] d02f 0008                 add.b      8(a7),d0
[000473ce] 206f 000e                 movea.l    14(a7),a0
[000473d2] 52af 000e                 addq.l     #1,14(a7)
[000473d6] 1080                      move.b     d0,(a0)
Ast_mergeASCIIZZ_21:
[000473d8] 52af 000a                 addq.l     #1,10(a7)
Ast_mergeASCIIZZ_17:
[000473dc] 206f 000a                 movea.l    10(a7),a0
[000473e0] 1010                      move.b     (a0),d0
[000473e2] 6600 ff86                 bne.w      Ast_mergeASCIIZZ_22
[000473e6] 4e71                      nop
Ast_mergeASCIIZZ_13:
[000473e8] 526f 0012                 addq.w     #1,18(a7)
[000473ec] 206f 000e                 movea.l    14(a7),a0
[000473f0] 4eb9 0008 2f6c            jsr        strlen
[000473f6] 5280                      addq.l     #1,d0
[000473f8] d1af 000e                 add.l      d0,14(a7)
Ast_mergeASCIIZZ_12:
[000473fc] 302f 0012                 move.w     18(a7),d0
[00047400] b06f 0016                 cmp.w      22(a7),d0
[00047404] 6d00 fea6                 blt        Ast_mergeASCIIZZ_23
[00047408] 2057                      movea.l    (a7),a0
Ast_mergeASCIIZZ_11:
[0004740a] 4fef 001c                 lea.l      28(a7),a7
[0004740e] 4e75                      rts

	.globl Ast_deleteAry
Ast_deleteAry:
[00047410] 4fef fff4                 lea.l      -12(a7),a7
[00047414] 2f48 0008                 move.l     a0,8(a7)
[00047418] 3f40 0006                 move.w     d0,6(a7)
[0004741c] 426f 0004                 clr.w      4(a7)
[00047420] 2eaf 0008                 move.l     8(a7),(a7)
[00047424] 600e                      bra.s      Ast_deleteAry_1
Ast_deleteAry_2:
[00047426] 2057                      movea.l    (a7),a0
[00047428] 2050                      movea.l    (a0),a0
[0004742a] 6100 f070                 bsr        Ast_delete
[0004742e] 526f 0004                 addq.w     #1,4(a7)
[00047432] 5897                      addq.l     #4,(a7)
Ast_deleteAry_1:
[00047434] 302f 0004                 move.w     4(a7),d0
[00047438] b06f 0006                 cmp.w      6(a7),d0
[0004743c] 6de8                      blt.s      Ast_deleteAry_2
[0004743e] 206f 0008                 movea.l    8(a7),a0
[00047442] 4eb9 0004 c7c8            jsr        Ax_free
[00047448] 4fef 000c                 lea.l      12(a7),a7
[0004744c] 4e75                      rts

	.globl Ast_copy
Ast_copy:
[0004744e] 4fef fff2                 lea.l      -14(a7),a7
[00047452] 2f48 000a                 move.l     a0,10(a7)
[00047456] 3f40 0008                 move.w     d0,8(a7)
[0004745a] 202f 000a                 move.l     10(a7),d0
[0004745e] 6608                      bne.s      Ast_copy_1
[00047460] 2f7c 000e 05da 000a       move.l     #null_string,10(a7)
Ast_copy_1:
[00047468] 206f 000a                 movea.l    10(a7),a0
[0004746c] 4eb9 0008 2f6c            jsr        strlen
[00047472] 2f40 0004                 move.l     d0,4(a7)
[00047476] 302f 0008                 move.w     8(a7),d0
[0004747a] 670e                      beq.s      Ast_copy_2
[0004747c] 7001                      moveq.l    #1,d0
[0004747e] d0af 0004                 add.l      4(a7),d0
[00047482] 4eb9 0004 c95e            jsr        Ax_glmalloc
[00047488] 600c                      bra.s      Ast_copy_3
Ast_copy_2:
[0004748a] 7001                      moveq.l    #1,d0
[0004748c] d0af 0004                 add.l      4(a7),d0
[00047490] 4eb9 0004 c608            jsr        Ax_malloc
Ast_copy_3:
[00047496] 2e88                      move.l     a0,(a7)
[00047498] 2017                      move.l     (a7),d0
[0004749a] 6604                      bne.s      Ast_copy_4
[0004749c] 91c8                      suba.l     a0,a0
[0004749e] 601a                      bra.s      Ast_copy_5
Ast_copy_4:
[000474a0] 202f 000a                 move.l     10(a7),d0
[000474a4] 6608                      bne.s      Ast_copy_6
[000474a6] 43f9 000e 05f5            lea.l      $000E05F5,a1
[000474ac] 6004                      bra.s      Ast_copy_7
Ast_copy_6:
[000474ae] 226f 000a                 movea.l    10(a7),a1
Ast_copy_7:
[000474b2] 2057                      movea.l    (a7),a0
[000474b4] 4eb9 0008 2f0c            jsr        strcpy
Ast_copy_5:
[000474ba] 4fef 000e                 lea.l      14(a7),a7
[000474be] 4e75                      rts

	.globl Ast_reverse
Ast_reverse:
[000474c0] 4fef fff0                 lea.l      -16(a7),a7
[000474c4] 2f48 000c                 move.l     a0,12(a7)
[000474c8] 2f49 0008                 move.l     a1,8(a7)
[000474cc] 202f 0008                 move.l     8(a7),d0
[000474d0] 6608                      bne.s      Ast_reverse_1
[000474d2] 2f7c 000e 05da 0008       move.l     #null_string,8(a7)
Ast_reverse_1:
[000474da] 2eaf 0008                 move.l     8(a7),(a7)
[000474de] 6002                      bra.s      Ast_reverse_2
Ast_reverse_3:
[000474e0] 5297                      addq.l     #1,(a7)
Ast_reverse_2:
[000474e2] 2057                      movea.l    (a7),a0
[000474e4] 1010                      move.b     (a0),d0
[000474e6] 66f8                      bne.s      Ast_reverse_3
[000474e8] 2f6f 000c 0004            move.l     12(a7),4(a7)
[000474ee] 5397                      subq.l     #1,(a7)
[000474f0] 600e                      bra.s      Ast_reverse_4
Ast_reverse_5:
[000474f2] 2057                      movea.l    (a7),a0
[000474f4] 226f 0004                 movea.l    4(a7),a1
[000474f8] 1290                      move.b     (a0),(a1)
[000474fa] 5397                      subq.l     #1,(a7)
[000474fc] 52af 0004                 addq.l     #1,4(a7)
Ast_reverse_4:
[00047500] 2057                      movea.l    (a7),a0
[00047502] b1ef 0008                 cmpa.l     8(a7),a0
[00047506] 64ea                      bcc.s      Ast_reverse_5
[00047508] 206f 0004                 movea.l    4(a7),a0
[0004750c] 4210                      clr.b      (a0)
[0004750e] 206f 000c                 movea.l    12(a7),a0
[00047512] 4fef 0010                 lea.l      16(a7),a7
[00047516] 4e75                      rts

	.data

	.globl null_string
null_string:
[000e05da]                           dc.w $002a
[000e05dc]                           dc.w $003f
[000e05de]                           dc.w $0000
[000e05e0]                           dc.b ' ',$09,$0a,$0d,0
[000e05e5]                           dc.b $01
[000e05e6]                           dc.w $0203
[000e05e8]                           dc.w $0405
[000e05ea]                           dc.w $0600
[000e05ec]                           dc.w $0100
[000e05ee]                           dc.w $0102
[000e05f0]                           dc.w $0304
[000e05f2]                           dc.w $0506
[000e05f4]                           dc.w $0000
[000e05f6]                           dc.w $0000
[000e05f8]                           dc.w $0000
[000e05fa]                           dc.w $0000
[000e05fc]                           dc.w $0000
[000e05fe]                           dc.w $0000
[000e0600]                           dc.w $0000
[000e0602]                           dc.w $0000
[000e0604]                           dc.w $0000
[000e0606]                           dc.w $0000
[000e0608]                           dc.w $0000
[000e060a]                           dc.w $0000
[000e060c]                           dc.w $0000
[000e060e]                           dc.w $0000
[000e0610]                           dc.w $0000
[000e0612]                           dc.w $0000
[000e0614]                           dc.w $0000
[000e0616]                           dc.w $0000
[000e0618]                           dc.w $0000
[000e061a]                           dc.w $0000
[000e061c]                           dc.w $0000
[000e061e]                           dc.w $0000
[000e0620]                           dc.w $0000
[000e0622]                           dc.w $0000
[000e0624]                           dc.w $0000
[000e0626]                           dc.w $0000
[000e0628]                           dc.w $0000
[000e062a]                           dc.w $0000
[000e062c]                           dc.w $0000
[000e062e]                           dc.w $0000
[000e0630]                           dc.w $0000
[000e0632]                           dc.w $0000
[000e0634]                           dc.w $0000
[000e0636]                           dc.w $0000
[000e0638]                           dc.w $0000
[000e063a]                           dc.w $0000
[000e063c]                           dc.w $0000
[000e063e]                           dc.w $0000
[000e0640]                           dc.w $0000
[000e0642]                           dc.w $0000
[000e0644]                           dc.w $0000
[000e0646]                           dc.w $0000
[000e0648]                           dc.w $0000
[000e064a]                           dc.w $0000
[000e064c]                           dc.w $0000
[000e064e]                           dc.w $0000
[000e0650]                           dc.w $0000
[000e0652]                           dc.w $0000
[000e0654]                           dc.w $0000
[000e0656]                           dc.w $0000
[000e0658]                           dc.w $0000
[000e065a]                           dc.w $0000
[000e065c]                           dc.w $0000
[000e065e]                           dc.w $0000
[000e0660]                           dc.w $0000
[000e0662]                           dc.w $0000
[000e0664]                           dc.w $0000
[000e0666]                           dc.w $0000
[000e0668]                           dc.w $0000
[000e066a]                           dc.w $0000
[000e066c]                           dc.w $0000
[000e066e]                           dc.w $0000
[000e0670]                           dc.w $0000
[000e0672]                           dc.w $0000
[000e0674]                           dc.w $0000
[000e0676]                           dc.w $0000
[000e0678]                           dc.w $0000
[000e067a]                           dc.w $0000
[000e067c]                           dc.w $0000
[000e067e]                           dc.w $0000
[000e0680]                           dc.w $0000
[000e0682]                           dc.w $0000
[000e0684]                           dc.w $0000
[000e0686]                           dc.w $0000
[000e0688]                           dc.w $0000
[000e068a]                           dc.w $0000
[000e068c]                           dc.w $0000
[000e068e]                           dc.w $0000
[000e0690]                           dc.w $0000
[000e0692]                           dc.w $0000
[000e0694]                           dc.w $0000
[000e0696]                           dc.w $0000
[000e0698]                           dc.w $0000
[000e069a]                           dc.w $0000
[000e069c]                           dc.w $0000
[000e069e]                           dc.w $0000
[000e06a0]                           dc.w $0000
[000e06a2]                           dc.w $0000
[000e06a4]                           dc.w $0000
[000e06a6]                           dc.w $0000
[000e06a8]                           dc.w $0000
[000e06aa]                           dc.w $0000
[000e06ac]                           dc.w $0000
[000e06ae]                           dc.w $0000
[000e06b0]                           dc.w $0000
[000e06b2]                           dc.w $0000
[000e06b4]                           dc.w $0000
[000e06b6]                           dc.w $0000
[000e06b8]                           dc.w $0000
[000e06ba]                           dc.w $0000
[000e06bc]                           dc.w $0000
[000e06be]                           dc.w $0000
[000e06c0]                           dc.w $0000
[000e06c2]                           dc.w $0000
[000e06c4]                           dc.w $0000
[000e06c6]                           dc.w $0000
[000e06c8]                           dc.w $0000
[000e06ca]                           dc.w $0000
[000e06cc]                           dc.w $0000
[000e06ce]                           dc.w $0000
[000e06d0]                           dc.w $0000
[000e06d2]                           dc.w $0000
[000e06d4]                           dc.w $0000
[000e06d6]                           dc.w $0000
[000e06d8]                           dc.w $0000
[000e06da]                           dc.w $0000
[000e06dc]                           dc.w $0000
[000e06de]                           dc.w $0000
[000e06e0]                           dc.w $0000
[000e06e2]                           dc.w $0000
[000e06e4]                           dc.w $0000
[000e06e6]                           dc.w $0000
[000e06e8]                           dc.w $0000
[000e06ea]                           dc.w $0000
[000e06ec]                           dc.w $0000
[000e06ee]                           dc.w $0000
[000e06f0]                           dc.w $0000
[000e06f2]                           dc.w $0000
[000e06f4]                           dc.w $0000
[000e06f6]                           dc.w $0000
[000e06f8]                           dc.w $0000
[000e06fa]                           dc.w $0000
[000e06fc]                           dc.w $0000
[000e06fe]                           dc.w $0000
[000e0700]                           dc.w $0000
[000e0702]                           dc.w $0000
[000e0704]                           dc.w $0000

