edbh_list:
[00012604] 514f                      subq.w     #8,a7
[00012606] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001260c] 2ea8 0258                 move.l     600(a0),(a7)
[00012610] 2057                      movea.l    (a7),a0
[00012612] 2f50 0004                 move.l     (a0),4(a7)
[00012616] 2057                      movea.l    (a7),a0
[00012618] 0068 0004 0054            ori.w      #$0004,84(a0)
[0001261e] 23ef 0004 000c e112       move.l     4(a7),list_window
[00012626] 206f 0004                 movea.l    4(a7),a0
[0001262a] 23e8 0014 000c e116       move.l     20(a0),$000CE116
[00012632] 41f9 000c e112            lea.l      list_window,a0
[00012638] 2279 000c dc9e            movea.l    $000CDC9E,a1
[0001263e] 4e91                      jsr        (a1)
[00012640] 2057                      movea.l    (a7),a0
[00012642] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00012648] 504f                      addq.w     #8,a7
[0001264a] 4e75                      rts

edbh_abort:
[0001264c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00012652] 2068 0258                 movea.l    600(a0),a0
[00012656] 4eb9 0001 2cf2            jsr        term
[0001265c] 4e75                      rts

edbh_ok:
[0001265e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00012664] 2068 0258                 movea.l    600(a0),a0
[00012668] 4eb9 0001 283a            jsr        acc_behave
[0001266e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00012674] 2068 0258                 movea.l    600(a0),a0
[00012678] 4eb9 0001 2cf2            jsr        term
[0001267e] 4e75                      rts

add_wi:
[00012680] 4fef fff4                 lea.l      -12(a7),a7
[00012684] 2f48 0008                 move.l     a0,8(a7)
[00012688] 2f49 0004                 move.l     a1,4(a7)
[0001268c] 206f 0010                 movea.l    16(a7),a0
[00012690] 1010                      move.b     (a0),d0
[00012692] 6734                      beq.s      add_wi_1
[00012694] 226f 0010                 movea.l    16(a7),a1
[00012698] 206f 0008                 movea.l    8(a7),a0
[0001269c] 2068 0014                 movea.l    20(a0),a0
[000126a0] 4eb9 0003 337c            jsr        find_entry
[000126a6] 2e88                      move.l     a0,(a7)
[000126a8] 2017                      move.l     (a7),d0
[000126aa] 6614                      bne.s      add_wi_2
[000126ac] 4240                      clr.w      d0
[000126ae] 226f 0010                 movea.l    16(a7),a1
[000126b2] 206f 0008                 movea.l    8(a7),a0
[000126b6] 4eb9 0003 5de0            jsr        dup_ref
[000126bc] 2e88                      move.l     a0,(a7)
[000126be] 6006                      bra.s      add_wi_3
add_wi_2:
[000126c0] 2057                      movea.l    (a7),a0
[000126c2] 5268 0036                 addq.w     #1,54(a0)
add_wi_3:
[000126c6] 6002                      bra.s      add_wi_4
add_wi_1:
[000126c8] 4297                      clr.l      (a7)
add_wi_4:
[000126ca] 202f 0004                 move.l     4(a7),d0
[000126ce] 6738                      beq.s      add_wi_5
[000126d0] 226f 0004                 movea.l    4(a7),a1
[000126d4] 43e9 0016                 lea.l      22(a1),a1
[000126d8] 206f 0008                 movea.l    8(a7),a0
[000126dc] 2068 0014                 movea.l    20(a0),a0
[000126e0] 4eb9 0003 337c            jsr        find_entry
[000126e6] 2008                      move.l     a0,d0
[000126e8] 6710                      beq.s      add_wi_6
[000126ea] 226f 0004                 movea.l    4(a7),a1
[000126ee] 206f 0008                 movea.l    8(a7),a0
[000126f2] 4eb9 0003 45c6            jsr        del_window
[000126f8] 600e                      bra.s      add_wi_5
add_wi_6:
[000126fa] 226f 0004                 movea.l    4(a7),a1
[000126fe] 206f 0008                 movea.l    8(a7),a0
[00012702] 4eb9 0003 5dae            jsr        del_ref
add_wi_5:
[00012708] 2057                      movea.l    (a7),a0
[0001270a] 4fef 000c                 lea.l      12(a7),a7
[0001270e] 4e75                      rts

add_fkt:
[00012710] 4fef fff2                 lea.l      -14(a7),a7
[00012714] 2f48 000a                 move.l     a0,10(a7)
[00012718] 2f49 0006                 move.l     a1,6(a7)
[0001271c] 3f40 0004                 move.w     d0,4(a7)
[00012720] 206f 0012                 movea.l    18(a7),a0
[00012724] 1010                      move.b     (a0),d0
[00012726] 6736                      beq.s      add_fkt_1
[00012728] 226f 0012                 movea.l    18(a7),a1
[0001272c] 206f 000a                 movea.l    10(a7),a0
[00012730] 2068 003c                 movea.l    60(a0),a0
[00012734] 4eb9 0003 337c            jsr        find_entry
[0001273a] 2e88                      move.l     a0,(a7)
[0001273c] 2017                      move.l     (a7),d0
[0001273e] 6616                      bne.s      add_fkt_2
[00012740] 302f 0004                 move.w     4(a7),d0
[00012744] 226f 0012                 movea.l    18(a7),a1
[00012748] 206f 000a                 movea.l    10(a7),a0
[0001274c] 4eb9 0003 5de0            jsr        dup_ref
[00012752] 2e88                      move.l     a0,(a7)
[00012754] 6006                      bra.s      add_fkt_3
add_fkt_2:
[00012756] 2057                      movea.l    (a7),a0
[00012758] 5268 0036                 addq.w     #1,54(a0)
add_fkt_3:
[0001275c] 6002                      bra.s      add_fkt_4
add_fkt_1:
[0001275e] 4297                      clr.l      (a7)
add_fkt_4:
[00012760] 202f 0006                 move.l     6(a7),d0
[00012764] 670e                      beq.s      add_fkt_5
[00012766] 226f 0006                 movea.l    6(a7),a1
[0001276a] 206f 000a                 movea.l    10(a7),a0
[0001276e] 4eb9 0003 5dae            jsr        del_ref
add_fkt_5:
[00012774] 2057                      movea.l    (a7),a0
[00012776] 4fef 000e                 lea.l      14(a7),a7
[0001277a] 4e75                      rts

swap_obj:
[0001277c] 4fef ffe0                 lea.l      -32(a7),a7
[00012780] 2f48 001c                 move.l     a0,28(a7)
[00012784] 2f49 0018                 move.l     a1,24(a7)
[00012788] 206f 0018                 movea.l    24(a7),a0
[0001278c] 2f68 0004 0004            move.l     4(a0),4(a7)
[00012792] 206f 0018                 movea.l    24(a7),a0
[00012796] 2028 000e                 move.l     14(a0),d0
[0001279a] e488                      lsr.l      #2,d0
[0001279c] 3f40 000e                 move.w     d0,14(a7)
[000127a0] 426f 000c                 clr.w      12(a7)
[000127a4] 6000 0082                 bra        swap_obj_1
[000127a8] 302f 000c                 move.w     12(a7),d0
swap_obj_2:
[000127ac] 48c0                      ext.l      d0
[000127ae] e588                      lsl.l      #2,d0
[000127b0] 206f 0004                 movea.l    4(a7),a0
[000127b4] 2eb0 0800                 move.l     0(a0,d0.l),(a7)
[000127b8] 302f 000c                 move.w     12(a7),d0
[000127bc] 48c0                      ext.l      d0
[000127be] e588                      lsl.l      #2,d0
[000127c0] 206f 001c                 movea.l    28(a7),a0
[000127c4] 2f70 0800 0008            move.l     0(a0,d0.l),8(a7)
[000127ca] 2057                      movea.l    (a7),a0
[000127cc] 2f68 0004 0010            move.l     4(a0),16(a7)
[000127d2] 206f 0008                 movea.l    8(a7),a0
[000127d6] 2257                      movea.l    (a7),a1
[000127d8] 2368 0004 0004            move.l     4(a0),4(a1)
[000127de] 206f 0008                 movea.l    8(a7),a0
[000127e2] 216f 0010 0004            move.l     16(a7),4(a0)
[000127e8] 2057                      movea.l    (a7),a0
[000127ea] 2f68 000a 0014            move.l     10(a0),20(a7)
[000127f0] 206f 0008                 movea.l    8(a7),a0
[000127f4] 2257                      movea.l    (a7),a1
[000127f6] 2368 000a 000a            move.l     10(a0),10(a1)
[000127fc] 206f 0008                 movea.l    8(a7),a0
[00012800] 216f 0014 000a            move.l     20(a7),10(a0)
[00012806] 2057                      movea.l    (a7),a0
[00012808] 2f68 000e 0014            move.l     14(a0),20(a7)
[0001280e] 206f 0008                 movea.l    8(a7),a0
[00012812] 2257                      movea.l    (a7),a1
[00012814] 2368 000e 000e            move.l     14(a0),14(a1)
[0001281a] 206f 0008                 movea.l    8(a7),a0
[0001281e] 216f 0014 000e            move.l     20(a7),14(a0)
[00012824] 526f 000c                 addq.w     #1,12(a7)
swap_obj_1:
[00012828] 302f 000c                 move.w     12(a7),d0
[0001282c] b06f 000e                 cmp.w      14(a7),d0
[00012830] 6d00 ff76                 blt        swap_obj_2
[00012834] 4fef 0020                 lea.l      32(a7),a7
[00012838] 4e75                      rts

acc_behave:
[0001283a] 2f0a                      move.l     a2,-(a7)
[0001283c] 4fef ffea                 lea.l      -22(a7),a7
[00012840] 2f48 0012                 move.l     a0,18(a7)
[00012844] 206f 0012                 movea.l    18(a7),a0
[00012848] 3028 0056                 move.w     86(a0),d0
[0001284c] c07c 0200                 and.w      #$0200,d0
[00012850] 6704                      beq.s      acc_behave_1
[00012852] 6000 0202                 bra        acc_behave_2
acc_behave_1:
[00012856] 206f 0012                 movea.l    18(a7),a0
[0001285a] 0068 0200 0056            ori.w      #$0200,86(a0)
[00012860] 206f 0012                 movea.l    18(a7),a0
[00012864] 2f68 0014 0006            move.l     20(a0),6(a7)
[0001286a] 206f 0012                 movea.l    18(a7),a0
[0001286e] 2f50 000a                 move.l     (a0),10(a7)
[00012872] 206f 000a                 movea.l    10(a7),a0
[00012876] 3028 0006                 move.w     6(a0),d0
[0001287a] c07c 87ff                 and.w      #$87FF,d0
[0001287e] 807c 0001                 or.w       #$0001,d0
[00012882] 206f 000a                 movea.l    10(a7),a0
[00012886] 3140 0006                 move.w     d0,6(a0)
[0001288a] 226f 000a                 movea.l    10(a7),a1
[0001288e] 43e9 0174                 lea.l      372(a1),a1
[00012892] 7021                      moveq.l    #33,d0
[00012894] 206f 0006                 movea.l    6(a7),a0
[00012898] 4eb9 0005 11da            jsr        Aob_gettext
[0001289e] 7001                      moveq.l    #1,d0
[000128a0] 206f 0006                 movea.l    6(a7),a0
[000128a4] c068 02c2                 and.w      706(a0),d0
[000128a8] 670a                      beq.s      acc_behave_3
[000128aa] 206f 000a                 movea.l    10(a7),a0
[000128ae] 0068 4000 0006            ori.w      #$4000,6(a0)
acc_behave_3:
[000128b4] 7001                      moveq.l    #1,d0
[000128b6] 206f 0006                 movea.l    6(a7),a0
[000128ba] c068 00fa                 and.w      250(a0),d0
[000128be] 670a                      beq.s      acc_behave_4
[000128c0] 206f 000a                 movea.l    10(a7),a0
[000128c4] 0068 2000 0006            ori.w      #$2000,6(a0)
acc_behave_4:
[000128ca] 7001                      moveq.l    #1,d0
[000128cc] 206f 0006                 movea.l    6(a7),a0
[000128d0] c068 012a                 and.w      298(a0),d0
[000128d4] 670a                      beq.s      acc_behave_5
[000128d6] 206f 000a                 movea.l    10(a7),a0
[000128da] 0068 1000 0006            ori.w      #$1000,6(a0)
acc_behave_5:
[000128e0] 7001                      moveq.l    #1,d0
[000128e2] 206f 0006                 movea.l    6(a7),a0
[000128e6] c068 0052                 and.w      82(a0),d0
[000128ea] 670a                      beq.s      acc_behave_6
[000128ec] 206f 000a                 movea.l    10(a7),a0
[000128f0] 0068 0800 0006            ori.w      #$0800,6(a0)
acc_behave_6:
[000128f6] 206f 000a                 movea.l    10(a7),a0
[000128fa] 42a8 0170                 clr.l      368(a0)
[000128fe] 7001                      moveq.l    #1,d0
[00012900] 206f 0006                 movea.l    6(a7),a0
[00012904] c068 02f2                 and.w      754(a0),d0
[00012908] 670c                      beq.s      acc_behave_7
[0001290a] 206f 000a                 movea.l    10(a7),a0
[0001290e] 00a8 0000 0002 0170       ori.l      #$00000002,368(a0)
acc_behave_7:
[00012916] 7001                      moveq.l    #1,d0
[00012918] 206f 0006                 movea.l    6(a7),a0
[0001291c] c068 015a                 and.w      346(a0),d0
[00012920] 670c                      beq.s      acc_behave_8
[00012922] 206f 000a                 movea.l    10(a7),a0
[00012926] 00a8 0000 0001 0170       ori.l      #$00000001,368(a0)
acc_behave_8:
[0001292e] 206f 0006                 movea.l    6(a7),a0
[00012932] 41e8 0078                 lea.l      120(a0),a0
[00012936] 2f48 0002                 move.l     a0,2(a7)
[0001293a] 206f 0002                 movea.l    2(a7),a0
[0001293e] 2f68 000c 000e            move.l     12(a0),14(a7)
[00012944] 226f 000a                 movea.l    10(a7),a1
[00012948] 43e9 020e                 lea.l      526(a1),a1
[0001294c] 303c 0192                 move.w     #$0192,d0
[00012950] 206f 0002                 movea.l    2(a7),a0
[00012954] 246f 000e                 movea.l    14(a7),a2
[00012958] 246a 0008                 movea.l    8(a2),a2
[0001295c] 4e92                      jsr        (a2)
[0001295e] 206f 000a                 movea.l    10(a7),a0
[00012962] 3ea8 01f4                 move.w     500(a0),(a7)
[00012966] 206f 0006                 movea.l    6(a7),a0
[0001296a] 41e8 0240                 lea.l      576(a0),a0
[0001296e] 2f48 0002                 move.l     a0,2(a7)
[00012972] 206f 0002                 movea.l    2(a7),a0
[00012976] 2f68 000c 000e            move.l     12(a0),14(a7)
[0001297c] 226f 000a                 movea.l    10(a7),a1
[00012980] 43e9 01f4                 lea.l      500(a1),a1
[00012984] 303c 0192                 move.w     #$0192,d0
[00012988] 206f 0002                 movea.l    2(a7),a0
[0001298c] 246f 000e                 movea.l    14(a7),a2
[00012990] 246a 0008                 movea.l    8(a2),a2
[00012994] 4e92                      jsr        (a2)
[00012996] 206f 000a                 movea.l    10(a7),a0
[0001299a] 3017                      move.w     (a7),d0
[0001299c] b068 01f4                 cmp.w      500(a0),d0
[000129a0] 6700 00b4                 beq        acc_behave_2
[000129a4] 4240                      clr.w      d0
[000129a6] 206f 000a                 movea.l    10(a7),a0
[000129aa] 4eb9 0001 8230            jsr        acs_closewi
[000129b0] 3017                      move.w     (a7),d0
[000129b2] 4a40                      tst.w      d0
[000129b4] 6702                      beq.s      acc_behave_9
[000129b6] 6002                      bra.s      acc_behave_10
acc_behave_9:
[000129b8] 6040                      bra.s      acc_behave_11
acc_behave_10:
[000129ba] 3017                      move.w     (a7),d0
[000129bc] 48c0                      ext.l      d0
[000129be] e588                      lsl.l      #2,d0
[000129c0] 206f 000a                 movea.l    10(a7),a0
[000129c4] d1c0                      adda.l     d0,a0
[000129c6] 2268 01f2                 movea.l    498(a0),a1
[000129ca] 206f 000a                 movea.l    10(a7),a0
[000129ce] 2068 0034                 movea.l    52(a0),a0
[000129d2] 2068 0004                 movea.l    4(a0),a0
[000129d6] 6100 fda4                 bsr        swap_obj
[000129da] 3017                      move.w     (a7),d0
[000129dc] 48c0                      ext.l      d0
[000129de] e588                      lsl.l      #2,d0
[000129e0] 206f 000a                 movea.l    10(a7),a0
[000129e4] d1c0                      adda.l     d0,a0
[000129e6] 2268 01fe                 movea.l    510(a0),a1
[000129ea] 206f 000a                 movea.l    10(a7),a0
[000129ee] 2068 0024                 movea.l    36(a0),a0
[000129f2] 2068 0004                 movea.l    4(a0),a0
[000129f6] 6100 fd84                 bsr        swap_obj
acc_behave_11:
[000129fa] 206f 000a                 movea.l    10(a7),a0
[000129fe] 3028 01f4                 move.w     500(a0),d0
[00012a02] 4a40                      tst.w      d0
[00012a04] 6702                      beq.s      acc_behave_12
[00012a06] 6002                      bra.s      acc_behave_13
acc_behave_12:
[00012a08] 604c                      bra.s      acc_behave_2
acc_behave_13:
[00012a0a] 206f 000a                 movea.l    10(a7),a0
[00012a0e] 3028 01f4                 move.w     500(a0),d0
[00012a12] 48c0                      ext.l      d0
[00012a14] e588                      lsl.l      #2,d0
[00012a16] 206f 000a                 movea.l    10(a7),a0
[00012a1a] d1c0                      adda.l     d0,a0
[00012a1c] 2268 01f2                 movea.l    498(a0),a1
[00012a20] 206f 000a                 movea.l    10(a7),a0
[00012a24] 2068 0034                 movea.l    52(a0),a0
[00012a28] 2068 0004                 movea.l    4(a0),a0
[00012a2c] 6100 fd4e                 bsr        swap_obj
[00012a30] 206f 000a                 movea.l    10(a7),a0
[00012a34] 3028 01f4                 move.w     500(a0),d0
[00012a38] 48c0                      ext.l      d0
[00012a3a] e588                      lsl.l      #2,d0
[00012a3c] 206f 000a                 movea.l    10(a7),a0
[00012a40] d1c0                      adda.l     d0,a0
[00012a42] 2268 01fe                 movea.l    510(a0),a1
[00012a46] 206f 000a                 movea.l    10(a7),a0
[00012a4a] 2068 0024                 movea.l    36(a0),a0
[00012a4e] 2068 0004                 movea.l    4(a0),a0
[00012a52] 6100 fd28                 bsr        swap_obj
acc_behave_2:
[00012a56] 4fef 0016                 lea.l      22(a7),a7
[00012a5a] 245f                      movea.l    (a7)+,a2
[00012a5c] 4e75                      rts

bh_make:
[00012a5e] 4fef ff70                 lea.l      -144(a7),a7
[00012a62] 2f48 008c                 move.l     a0,140(a7)
[00012a66] 2f6f 008c 0088            move.l     140(a7),136(a7)
[00012a6c] 206f 0088                 movea.l    136(a7),a0
[00012a70] 2028 0148                 move.l     328(a0),d0
[00012a74] 671a                      beq.s      bh_make_1
[00012a76] 206f 0088                 movea.l    136(a7),a0
[00012a7a] 2068 0148                 movea.l    328(a0),a0
[00012a7e] 4eb9 0005 6bea            jsr        Awi_show
[00012a84] 206f 0088                 movea.l    136(a7),a0
[00012a88] 2068 0148                 movea.l    328(a0),a0
[00012a8c] 6000 00bc                 bra        bh_make_2
bh_make_1:
[00012a90] 1f7c 0020 0004            move.b     #$20,4(a7)
[00012a96] 206f 0088                 movea.l    136(a7),a0
[00012a9a] 2268 0008                 movea.l    8(a0),a1
[00012a9e] 41ef 0005                 lea.l      5(a7),a0
[00012aa2] 4eb9 0008 2f0c            jsr        strcpy
[00012aa8] 23c8 0008 ae0c            move.l     a0,$0008AE0C
[00012aae] 705c                      moveq.l    #92,d0
[00012ab0] 41ef 0004                 lea.l      4(a7),a0
[00012ab4] 4eb9 0008 2e9e            jsr        strrchr
[00012aba] 2e88                      move.l     a0,(a7)
[00012abc] 2017                      move.l     (a7),d0
[00012abe] 6704                      beq.s      bh_make_3
[00012ac0] 5297                      addq.l     #1,(a7)
[00012ac2] 6006                      bra.s      bh_make_4
bh_make_3:
[00012ac4] 41ef 0004                 lea.l      4(a7),a0
[00012ac8] 2e88                      move.l     a0,(a7)
bh_make_4:
[00012aca] 2079 0008 ae18            movea.l    $0008AE18,a0
[00012ad0] 2157 0008                 move.l     (a7),8(a0)
[00012ad4] 41f9 0008 adbe            lea.l      WI_BEHAVE,a0
[00012ada] 4eb9 0005 7052            jsr        Awi_create
[00012ae0] 2f48 0084                 move.l     a0,132(a7)
[00012ae4] 202f 0084                 move.l     132(a7),d0
[00012ae8] 6604                      bne.s      bh_make_5
[00012aea] 91c8                      suba.l     a0,a0
[00012aec] 605c                      bra.s      bh_make_2
bh_make_5:
[00012aee] 206f 0088                 movea.l    136(a7),a0
[00012af2] 4868 0168                 pea.l      360(a0)
[00012af6] 226f 008c                 movea.l    140(a7),a1
[00012afa] 43e9 015c                 lea.l      348(a1),a1
[00012afe] 206f 0088                 movea.l    136(a7),a0
[00012b02] 4eb9 0001 6372            jsr        wi_pos
[00012b08] 584f                      addq.w     #4,a7
[00012b0a] 206f 0084                 movea.l    132(a7),a0
[00012b0e] 20af 0088                 move.l     136(a7),(a0)
[00012b12] 206f 0088                 movea.l    136(a7),a0
[00012b16] 216f 0084 0148            move.l     132(a7),328(a0)
[00012b1c] 206f 0084                 movea.l    132(a7),a0
[00012b20] 4eb9 0001 2bb6            jsr        set_behave
[00012b26] 206f 0084                 movea.l    132(a7),a0
[00012b2a] 226f 0084                 movea.l    132(a7),a1
[00012b2e] 2269 000c                 movea.l    12(a1),a1
[00012b32] 4e91                      jsr        (a1)
[00012b34] 4a40                      tst.w      d0
[00012b36] 670e                      beq.s      bh_make_6
[00012b38] 206f 0084                 movea.l    132(a7),a0
[00012b3c] 4eb9 0001 2cf2            jsr        term
[00012b42] 91c8                      suba.l     a0,a0
[00012b44] 6004                      bra.s      bh_make_2
bh_make_6:
[00012b46] 206f 0084                 movea.l    132(a7),a0
bh_make_2:
[00012b4a] 4fef 0090                 lea.l      144(a7),a7
[00012b4e] 4e75                      rts

bh_service:
[00012b50] 4fef fff6                 lea.l      -10(a7),a7
[00012b54] 2f48 0006                 move.l     a0,6(a7)
[00012b58] 3f40 0004                 move.w     d0,4(a7)
[00012b5c] 2e89                      move.l     a1,(a7)
[00012b5e] 302f 0004                 move.w     4(a7),d0
[00012b62] 5540                      subq.w     #2,d0
[00012b64] 6708                      beq.s      bh_service_1
[00012b66] 907c 000d                 sub.w      #$000D,d0
[00012b6a] 672e                      beq.s      bh_service_2
[00012b6c] 602e                      bra.s      bh_service_3
bh_service_1:
[00012b6e] 206f 0006                 movea.l    6(a7),a0
[00012b72] 3028 0056                 move.w     86(a0),d0
[00012b76] c07c 0200                 and.w      #$0200,d0
[00012b7a] 661c                      bne.s      bh_service_4
[00012b7c] 206f 0006                 movea.l    6(a7),a0
[00012b80] 0068 0200 0056            ori.w      #$0200,86(a0)
[00012b86] 206f 0006                 movea.l    6(a7),a0
[00012b8a] 6100 fcae                 bsr        acc_behave
[00012b8e] 206f 0006                 movea.l    6(a7),a0
[00012b92] 4eb9 0001 2cf2            jsr        term
bh_service_4:
[00012b98] 6014                      bra.s      bh_service_5
bh_service_2:
[00012b9a] 6012                      bra.s      bh_service_5
bh_service_3:
[00012b9c] 2257                      movea.l    (a7),a1
[00012b9e] 302f 0004                 move.w     4(a7),d0
[00012ba2] 206f 0006                 movea.l    6(a7),a0
[00012ba6] 4eb9 0005 9dd0            jsr        Awi_service
[00012bac] 6002                      bra.s      bh_service_6
bh_service_5:
[00012bae] 7001                      moveq.l    #1,d0
bh_service_6:
[00012bb0] 4fef 000a                 lea.l      10(a7),a7
[00012bb4] 4e75                      rts

set_behave:
[00012bb6] 2f0a                      move.l     a2,-(a7)
[00012bb8] 4fef ffec                 lea.l      -20(a7),a7
[00012bbc] 2f48 0010                 move.l     a0,16(a7)
[00012bc0] 206f 0010                 movea.l    16(a7),a0
[00012bc4] 2f68 0014 0004            move.l     20(a0),4(a7)
[00012bca] 206f 0010                 movea.l    16(a7),a0
[00012bce] 2f50 000c                 move.l     (a0),12(a7)
[00012bd2] 226f 000c                 movea.l    12(a7),a1
[00012bd6] 43e9 0174                 lea.l      372(a1),a1
[00012bda] 7021                      moveq.l    #33,d0
[00012bdc] 206f 0004                 movea.l    4(a7),a0
[00012be0] 4eb9 0005 0fd8            jsr        Aob_puttext
[00012be6] 206f 0004                 movea.l    4(a7),a0
[00012bea] 41e8 02b8                 lea.l      696(a0),a0
[00012bee] 226f 000c                 movea.l    12(a7),a1
[00012bf2] 3029 0006                 move.w     6(a1),d0
[00012bf6] c07c 4000                 and.w      #$4000,d0
[00012bfa] 4eb9 0001 58a2            jsr        set_flag
[00012c00] 206f 0004                 movea.l    4(a7),a0
[00012c04] 41e8 00f0                 lea.l      240(a0),a0
[00012c08] 226f 000c                 movea.l    12(a7),a1
[00012c0c] 3029 0006                 move.w     6(a1),d0
[00012c10] c07c 2000                 and.w      #$2000,d0
[00012c14] 4eb9 0001 58a2            jsr        set_flag
[00012c1a] 206f 0004                 movea.l    4(a7),a0
[00012c1e] 41e8 0120                 lea.l      288(a0),a0
[00012c22] 226f 000c                 movea.l    12(a7),a1
[00012c26] 3029 0006                 move.w     6(a1),d0
[00012c2a] c07c 1000                 and.w      #$1000,d0
[00012c2e] 4eb9 0001 58a2            jsr        set_flag
[00012c34] 206f 0004                 movea.l    4(a7),a0
[00012c38] 41e8 0048                 lea.l      72(a0),a0
[00012c3c] 226f 000c                 movea.l    12(a7),a1
[00012c40] 3029 0006                 move.w     6(a1),d0
[00012c44] c07c 0800                 and.w      #$0800,d0
[00012c48] 4eb9 0001 58a2            jsr        set_flag
[00012c4e] 206f 0004                 movea.l    4(a7),a0
[00012c52] 41e8 0150                 lea.l      336(a0),a0
[00012c56] 2f08                      move.l     a0,-(a7)
[00012c58] 7001                      moveq.l    #1,d0
[00012c5a] 206f 0010                 movea.l    16(a7),a0
[00012c5e] c0a8 0170                 and.l      368(a0),d0
[00012c62] 6704                      beq.s      set_behave_1
[00012c64] 7001                      moveq.l    #1,d0
[00012c66] 6002                      bra.s      set_behave_2
set_behave_1:
[00012c68] 4240                      clr.w      d0
set_behave_2:
[00012c6a] 205f                      movea.l    (a7)+,a0
[00012c6c] 4eb9 0001 58a2            jsr        set_flag
[00012c72] 206f 0004                 movea.l    4(a7),a0
[00012c76] 41e8 02e8                 lea.l      744(a0),a0
[00012c7a] 2f08                      move.l     a0,-(a7)
[00012c7c] 7002                      moveq.l    #2,d0
[00012c7e] 206f 0010                 movea.l    16(a7),a0
[00012c82] c0a8 0170                 and.l      368(a0),d0
[00012c86] 6704                      beq.s      set_behave_3
[00012c88] 7001                      moveq.l    #1,d0
[00012c8a] 6002                      bra.s      set_behave_4
set_behave_3:
[00012c8c] 4240                      clr.w      d0
set_behave_4:
[00012c8e] 205f                      movea.l    (a7)+,a0
[00012c90] 4eb9 0001 58a2            jsr        set_flag
[00012c96] 206f 0004                 movea.l    4(a7),a0
[00012c9a] 41e8 0078                 lea.l      120(a0),a0
[00012c9e] 2e88                      move.l     a0,(a7)
[00012ca0] 2057                      movea.l    (a7),a0
[00012ca2] 2f68 000c 0008            move.l     12(a0),8(a7)
[00012ca8] 226f 000c                 movea.l    12(a7),a1
[00012cac] 43e9 020e                 lea.l      526(a1),a1
[00012cb0] 303c 0191                 move.w     #$0191,d0
[00012cb4] 2057                      movea.l    (a7),a0
[00012cb6] 246f 0008                 movea.l    8(a7),a2
[00012cba] 246a 0008                 movea.l    8(a2),a2
[00012cbe] 4e92                      jsr        (a2)
[00012cc0] 206f 0004                 movea.l    4(a7),a0
[00012cc4] 41e8 0240                 lea.l      576(a0),a0
[00012cc8] 2e88                      move.l     a0,(a7)
[00012cca] 2057                      movea.l    (a7),a0
[00012ccc] 2f68 000c 0008            move.l     12(a0),8(a7)
[00012cd2] 226f 000c                 movea.l    12(a7),a1
[00012cd6] 43e9 01f4                 lea.l      500(a1),a1
[00012cda] 303c 0191                 move.w     #$0191,d0
[00012cde] 2057                      movea.l    (a7),a0
[00012ce0] 246f 0008                 movea.l    8(a7),a2
[00012ce4] 246a 0008                 movea.l    8(a2),a2
[00012ce8] 4e92                      jsr        (a2)
[00012cea] 4fef 0014                 lea.l      20(a7),a7
[00012cee] 245f                      movea.l    (a7)+,a2
[00012cf0] 4e75                      rts

term:
[00012cf2] 514f                      subq.w     #8,a7
[00012cf4] 2f48 0004                 move.l     a0,4(a7)
[00012cf8] 206f 0004                 movea.l    4(a7),a0
[00012cfc] 2e90                      move.l     (a0),(a7)
[00012cfe] 206f 0004                 movea.l    4(a7),a0
[00012d02] 3028 0056                 move.w     86(a0),d0
[00012d06] c07c 0800                 and.w      #$0800,d0
[00012d0a] 6718                      beq.s      term_1
[00012d0c] 7008                      moveq.l    #8,d0
[00012d0e] 226f 0004                 movea.l    4(a7),a1
[00012d12] 43e9 002c                 lea.l      44(a1),a1
[00012d16] 2057                      movea.l    (a7),a0
[00012d18] 41e8 015c                 lea.l      348(a0),a0
[00012d1c] 4eb9 0008 3500            jsr        memcpy
[00012d22] 6016                      bra.s      term_2
term_1:
[00012d24] 7008                      moveq.l    #8,d0
[00012d26] 226f 0004                 movea.l    4(a7),a1
[00012d2a] 43e9 0024                 lea.l      36(a1),a1
[00012d2e] 2057                      movea.l    (a7),a0
[00012d30] 41e8 015c                 lea.l      348(a0),a0
[00012d34] 4eb9 0008 3500            jsr        memcpy
term_2:
[00012d3a] 206f 0004                 movea.l    4(a7),a0
[00012d3e] 4eb9 0005 85f2            jsr        Awi_delete
[00012d44] 2057                      movea.l    (a7),a0
[00012d46] 42a8 0148                 clr.l      328(a0)
[00012d4a] 504f                      addq.w     #8,a7
[00012d4c] 4e75                      rts

edmm_setflag:
[00012d4e] 4fef fff2                 lea.l      -14(a7),a7
[00012d52] 2f48 000a                 move.l     a0,10(a7)
[00012d56] 3f40 0008                 move.w     d0,8(a7)
[00012d5a] 2f49 0004                 move.l     a1,4(a7)
[00012d5e] 3f41 0002                 move.w     d1,2(a7)
[00012d62] 3e82                      move.w     d2,(a7)
[00012d64] 7001                      moveq.l    #1,d0
[00012d66] 342f 0008                 move.w     8(a7),d2
[00012d6a] 48c2                      ext.l      d2
[00012d6c] 2202                      move.l     d2,d1
[00012d6e] d281                      add.l      d1,d1
[00012d70] d282                      add.l      d2,d1
[00012d72] e789                      lsl.l      #3,d1
[00012d74] 206f 000a                 movea.l    10(a7),a0
[00012d78] c070 180a                 and.w      10(a0,d1.l),d0
[00012d7c] 671e                      beq.s      edmm_setflag_1
[00012d7e] 3017                      move.w     (a7),d0
[00012d80] 670e                      beq.s      edmm_setflag_2
[00012d82] 302f 0002                 move.w     2(a7),d0
[00012d86] 4640                      not.w      d0
[00012d88] 206f 0004                 movea.l    4(a7),a0
[00012d8c] c150                      and.w      d0,(a0)
[00012d8e] 600a                      bra.s      edmm_setflag_3
edmm_setflag_2:
[00012d90] 302f 0002                 move.w     2(a7),d0
[00012d94] 206f 0004                 movea.l    4(a7),a0
[00012d98] 8150                      or.w       d0,(a0)
edmm_setflag_3:
[00012d9a] 601c                      bra.s      edmm_setflag_4
edmm_setflag_1:
[00012d9c] 3017                      move.w     (a7),d0
[00012d9e] 670c                      beq.s      edmm_setflag_5
[00012da0] 302f 0002                 move.w     2(a7),d0
[00012da4] 206f 0004                 movea.l    4(a7),a0
[00012da8] 8150                      or.w       d0,(a0)
[00012daa] 600c                      bra.s      edmm_setflag_4
edmm_setflag_5:
[00012dac] 302f 0002                 move.w     2(a7),d0
[00012db0] 4640                      not.w      d0
[00012db2] 206f 0004                 movea.l    4(a7),a0
[00012db6] c150                      and.w      d0,(a0)
edmm_setflag_4:
[00012db8] 4fef 000e                 lea.l      14(a7),a7
[00012dbc] 4e75                      rts

edmm_enable:
[00012dbe] 4fef fff4                 lea.l      -12(a7),a7
[00012dc2] 2f48 0008                 move.l     a0,8(a7)
[00012dc6] 206f 0008                 movea.l    8(a7),a0
[00012dca] 2f68 0014 0004            move.l     20(a0),4(a7)
[00012dd0] 7001                      moveq.l    #1,d0
[00012dd2] 206f 0004                 movea.l    4(a7),a0
[00012dd6] c068 0022                 and.w      34(a0),d0
[00012dda] 3f40 0002                 move.w     d0,2(a7)
[00012dde] 7001                      moveq.l    #1,d0
[00012de0] 206f 0004                 movea.l    4(a7),a0
[00012de4] c068 006a                 and.w      106(a0),d0
[00012de8] 3e80                      move.w     d0,(a7)
[00012dea] 4eb9 0005 5c5a            jsr        Awi_ontop
[00012df0] b1ef 0008                 cmpa.l     8(a7),a0
[00012df4] 6606                      bne.s      edmm_enable_1
[00012df6] 4eb9 0005 1388            jsr        Awi_diaend
edmm_enable_1:
[00012dfc] 7001                      moveq.l    #1,d0
[00012dfe] 206f 0004                 movea.l    4(a7),a0
[00012e02] c068 0022                 and.w      34(a0),d0
[00012e06] 3f40 0002                 move.w     d0,2(a7)
[00012e0a] 302f 0002                 move.w     2(a7),d0
[00012e0e] 6604                      bne.s      edmm_enable_2
[00012e10] 7401                      moveq.l    #1,d2
[00012e12] 6002                      bra.s      edmm_enable_3
edmm_enable_2:
[00012e14] 4242                      clr.w      d2
edmm_enable_3:
[00012e16] 7208                      moveq.l    #8,d1
[00012e18] 7004                      moveq.l    #4,d0
[00012e1a] 206f 0008                 movea.l    8(a7),a0
[00012e1e] 4eb9 0005 484e            jsr        Aob_state
[00012e24] 302f 0002                 move.w     2(a7),d0
[00012e28] 6704                      beq.s      edmm_enable_4
[00012e2a] 3017                      move.w     (a7),d0
[00012e2c] 6604                      bne.s      edmm_enable_5
edmm_enable_4:
[00012e2e] 7401                      moveq.l    #1,d2
[00012e30] 6002                      bra.s      edmm_enable_6
edmm_enable_5:
[00012e32] 4242                      clr.w      d2
edmm_enable_6:
[00012e34] 7208                      moveq.l    #8,d1
[00012e36] 700a                      moveq.l    #10,d0
[00012e38] 206f 0008                 movea.l    8(a7),a0
[00012e3c] 4eb9 0005 484e            jsr        Aob_state
[00012e42] 302f 0002                 move.w     2(a7),d0
[00012e46] 6604                      bne.s      edmm_enable_7
[00012e48] 7401                      moveq.l    #1,d2
[00012e4a] 6002                      bra.s      edmm_enable_8
edmm_enable_7:
[00012e4c] 4242                      clr.w      d2
edmm_enable_8:
[00012e4e] 7208                      moveq.l    #8,d1
[00012e50] 7006                      moveq.l    #6,d0
[00012e52] 206f 0008                 movea.l    8(a7),a0
[00012e56] 4eb9 0005 484e            jsr        Aob_state
[00012e5c] 302f 0002                 move.w     2(a7),d0
[00012e60] 6604                      bne.s      edmm_enable_9
[00012e62] 7401                      moveq.l    #1,d2
[00012e64] 6002                      bra.s      edmm_enable_10
edmm_enable_9:
[00012e66] 4242                      clr.w      d2
edmm_enable_10:
[00012e68] 7208                      moveq.l    #8,d1
[00012e6a] 7008                      moveq.l    #8,d0
[00012e6c] 206f 0008                 movea.l    8(a7),a0
[00012e70] 4eb9 0005 484e            jsr        Aob_state
[00012e76] 302f 0002                 move.w     2(a7),d0
[00012e7a] 6604                      bne.s      edmm_enable_11
[00012e7c] 7401                      moveq.l    #1,d2
[00012e7e] 6002                      bra.s      edmm_enable_12
edmm_enable_11:
[00012e80] 4242                      clr.w      d2
edmm_enable_12:
[00012e82] 7208                      moveq.l    #8,d1
[00012e84] 7028                      moveq.l    #40,d0
[00012e86] 206f 0008                 movea.l    8(a7),a0
[00012e8a] 4eb9 0005 484e            jsr        Aob_state
[00012e90] 302f 0002                 move.w     2(a7),d0
[00012e94] 6604                      bne.s      edmm_enable_13
[00012e96] 7401                      moveq.l    #1,d2
[00012e98] 6002                      bra.s      edmm_enable_14
edmm_enable_13:
[00012e9a] 4242                      clr.w      d2
edmm_enable_14:
[00012e9c] 7208                      moveq.l    #8,d1
[00012e9e] 702a                      moveq.l    #42,d0
[00012ea0] 206f 0008                 movea.l    8(a7),a0
[00012ea4] 4eb9 0005 484e            jsr        Aob_state
[00012eaa] 302f 0002                 move.w     2(a7),d0
[00012eae] 6604                      bne.s      edmm_enable_15
[00012eb0] 7401                      moveq.l    #1,d2
[00012eb2] 6002                      bra.s      edmm_enable_16
edmm_enable_15:
[00012eb4] 4242                      clr.w      d2
edmm_enable_16:
[00012eb6] 7208                      moveq.l    #8,d1
[00012eb8] 702c                      moveq.l    #44,d0
[00012eba] 206f 0008                 movea.l    8(a7),a0
[00012ebe] 4eb9 0005 484e            jsr        Aob_state
[00012ec4] 302f 0002                 move.w     2(a7),d0
[00012ec8] 6604                      bne.s      edmm_enable_17
[00012eca] 7401                      moveq.l    #1,d2
[00012ecc] 6002                      bra.s      edmm_enable_18
edmm_enable_17:
[00012ece] 4242                      clr.w      d2
edmm_enable_18:
[00012ed0] 7208                      moveq.l    #8,d1
[00012ed2] 702e                      moveq.l    #46,d0
[00012ed4] 206f 0008                 movea.l    8(a7),a0
[00012ed8] 4eb9 0005 484e            jsr        Aob_state
[00012ede] 302f 0002                 move.w     2(a7),d0
[00012ee2] 6604                      bne.s      edmm_enable_19
[00012ee4] 7401                      moveq.l    #1,d2
[00012ee6] 6002                      bra.s      edmm_enable_20
edmm_enable_19:
[00012ee8] 4242                      clr.w      d2
edmm_enable_20:
[00012eea] 7208                      moveq.l    #8,d1
[00012eec] 7024                      moveq.l    #36,d0
[00012eee] 206f 0008                 movea.l    8(a7),a0
[00012ef2] 4eb9 0005 484e            jsr        Aob_state
[00012ef8] 302f 0002                 move.w     2(a7),d0
[00012efc] 6604                      bne.s      edmm_enable_21
[00012efe] 7401                      moveq.l    #1,d2
[00012f00] 6002                      bra.s      edmm_enable_22
edmm_enable_21:
[00012f02] 4242                      clr.w      d2
edmm_enable_22:
[00012f04] 7208                      moveq.l    #8,d1
[00012f06] 7026                      moveq.l    #38,d0
[00012f08] 206f 0008                 movea.l    8(a7),a0
[00012f0c] 4eb9 0005 484e            jsr        Aob_state
[00012f12] 302f 0002                 move.w     2(a7),d0
[00012f16] 6604                      bne.s      edmm_enable_23
[00012f18] 7401                      moveq.l    #1,d2
[00012f1a] 6002                      bra.s      edmm_enable_24
edmm_enable_23:
[00012f1c] 4242                      clr.w      d2
edmm_enable_24:
[00012f1e] 7208                      moveq.l    #8,d1
[00012f20] 7030                      moveq.l    #48,d0
[00012f22] 206f 0008                 movea.l    8(a7),a0
[00012f26] 4eb9 0005 484e            jsr        Aob_state
[00012f2c] 302f 0002                 move.w     2(a7),d0
[00012f30] 6604                      bne.s      edmm_enable_25
[00012f32] 7401                      moveq.l    #1,d2
[00012f34] 6002                      bra.s      edmm_enable_26
edmm_enable_25:
[00012f36] 4242                      clr.w      d2
edmm_enable_26:
[00012f38] 7208                      moveq.l    #8,d1
[00012f3a] 7032                      moveq.l    #50,d0
[00012f3c] 206f 0008                 movea.l    8(a7),a0
[00012f40] 4eb9 0005 484e            jsr        Aob_state
[00012f46] 302f 0002                 move.w     2(a7),d0
[00012f4a] 6604                      bne.s      edmm_enable_27
[00012f4c] 7401                      moveq.l    #1,d2
[00012f4e] 6002                      bra.s      edmm_enable_28
edmm_enable_27:
[00012f50] 4242                      clr.w      d2
edmm_enable_28:
[00012f52] 7208                      moveq.l    #8,d1
[00012f54] 7034                      moveq.l    #52,d0
[00012f56] 206f 0008                 movea.l    8(a7),a0
[00012f5a] 4eb9 0005 484e            jsr        Aob_state
[00012f60] 302f 0002                 move.w     2(a7),d0
[00012f64] 6604                      bne.s      edmm_enable_29
[00012f66] 7401                      moveq.l    #1,d2
[00012f68] 6002                      bra.s      edmm_enable_30
edmm_enable_29:
[00012f6a] 4242                      clr.w      d2
edmm_enable_30:
[00012f6c] 7208                      moveq.l    #8,d1
[00012f6e] 7036                      moveq.l    #54,d0
[00012f70] 206f 0008                 movea.l    8(a7),a0
[00012f74] 4eb9 0005 484e            jsr        Aob_state
[00012f7a] 302f 0002                 move.w     2(a7),d0
[00012f7e] 6604                      bne.s      edmm_enable_31
[00012f80] 7401                      moveq.l    #1,d2
[00012f82] 6002                      bra.s      edmm_enable_32
edmm_enable_31:
[00012f84] 4242                      clr.w      d2
edmm_enable_32:
[00012f86] 7208                      moveq.l    #8,d1
[00012f88] 7038                      moveq.l    #56,d0
[00012f8a] 206f 0008                 movea.l    8(a7),a0
[00012f8e] 4eb9 0005 484e            jsr        Aob_state
[00012f94] 302f 0002                 move.w     2(a7),d0
[00012f98] 6604                      bne.s      edmm_enable_33
[00012f9a] 7401                      moveq.l    #1,d2
[00012f9c] 6002                      bra.s      edmm_enable_34
edmm_enable_33:
[00012f9e] 4242                      clr.w      d2
edmm_enable_34:
[00012fa0] 7208                      moveq.l    #8,d1
[00012fa2] 7021                      moveq.l    #33,d0
[00012fa4] 206f 0008                 movea.l    8(a7),a0
[00012fa8] 4eb9 0005 484e            jsr        Aob_state
[00012fae] 302f 0002                 move.w     2(a7),d0
[00012fb2] 6604                      bne.s      edmm_enable_35
[00012fb4] 7401                      moveq.l    #1,d2
[00012fb6] 6002                      bra.s      edmm_enable_36
edmm_enable_35:
[00012fb8] 4242                      clr.w      d2
edmm_enable_36:
[00012fba] 7208                      moveq.l    #8,d1
[00012fbc] 7010                      moveq.l    #16,d0
[00012fbe] 206f 0008                 movea.l    8(a7),a0
[00012fc2] 4eb9 0005 484e            jsr        Aob_state
[00012fc8] 342f 0002                 move.w     2(a7),d2
[00012fcc] 7208                      moveq.l    #8,d1
[00012fce] 7010                      moveq.l    #16,d0
[00012fd0] 206f 0008                 movea.l    8(a7),a0
[00012fd4] 4eb9 0005 4784            jsr        Aob_flags
[00012fda] 302f 0002                 move.w     2(a7),d0
[00012fde] 6604                      bne.s      edmm_enable_37
[00012fe0] 7401                      moveq.l    #1,d2
[00012fe2] 6002                      bra.s      edmm_enable_38
edmm_enable_37:
[00012fe4] 4242                      clr.w      d2
edmm_enable_38:
[00012fe6] 7208                      moveq.l    #8,d1
[00012fe8] 7011                      moveq.l    #17,d0
[00012fea] 206f 0008                 movea.l    8(a7),a0
[00012fee] 4eb9 0005 484e            jsr        Aob_state
[00012ff4] 342f 0002                 move.w     2(a7),d2
[00012ff8] 7208                      moveq.l    #8,d1
[00012ffa] 7011                      moveq.l    #17,d0
[00012ffc] 206f 0008                 movea.l    8(a7),a0
[00013000] 4eb9 0005 4784            jsr        Aob_flags
[00013006] 302f 0002                 move.w     2(a7),d0
[0001300a] 6604                      bne.s      edmm_enable_39
[0001300c] 7401                      moveq.l    #1,d2
[0001300e] 6002                      bra.s      edmm_enable_40
edmm_enable_39:
[00013010] 4242                      clr.w      d2
edmm_enable_40:
[00013012] 7208                      moveq.l    #8,d1
[00013014] 7013                      moveq.l    #19,d0
[00013016] 206f 0008                 movea.l    8(a7),a0
[0001301a] 4eb9 0005 484e            jsr        Aob_state
[00013020] 342f 0002                 move.w     2(a7),d2
[00013024] 7208                      moveq.l    #8,d1
[00013026] 7013                      moveq.l    #19,d0
[00013028] 206f 0008                 movea.l    8(a7),a0
[0001302c] 4eb9 0005 4784            jsr        Aob_flags
[00013032] 302f 0002                 move.w     2(a7),d0
[00013036] 6604                      bne.s      edmm_enable_41
[00013038] 7401                      moveq.l    #1,d2
[0001303a] 6002                      bra.s      edmm_enable_42
edmm_enable_41:
[0001303c] 4242                      clr.w      d2
edmm_enable_42:
[0001303e] 7208                      moveq.l    #8,d1
[00013040] 701d                      moveq.l    #29,d0
[00013042] 206f 0008                 movea.l    8(a7),a0
[00013046] 4eb9 0005 484e            jsr        Aob_state
[0001304c] 342f 0002                 move.w     2(a7),d2
[00013050] 7208                      moveq.l    #8,d1
[00013052] 701d                      moveq.l    #29,d0
[00013054] 206f 0008                 movea.l    8(a7),a0
[00013058] 4eb9 0005 4784            jsr        Aob_flags
[0001305e] 302f 0002                 move.w     2(a7),d0
[00013062] 6604                      bne.s      edmm_enable_43
[00013064] 7401                      moveq.l    #1,d2
[00013066] 6002                      bra.s      edmm_enable_44
edmm_enable_43:
[00013068] 4242                      clr.w      d2
edmm_enable_44:
[0001306a] 7208                      moveq.l    #8,d1
[0001306c] 701e                      moveq.l    #30,d0
[0001306e] 206f 0008                 movea.l    8(a7),a0
[00013072] 4eb9 0005 484e            jsr        Aob_state
[00013078] 342f 0002                 move.w     2(a7),d2
[0001307c] 7208                      moveq.l    #8,d1
[0001307e] 701e                      moveq.l    #30,d0
[00013080] 206f 0008                 movea.l    8(a7),a0
[00013084] 4eb9 0005 4784            jsr        Aob_flags
[0001308a] 302f 0002                 move.w     2(a7),d0
[0001308e] 6604                      bne.s      edmm_enable_45
[00013090] 7401                      moveq.l    #1,d2
[00013092] 6002                      bra.s      edmm_enable_46
edmm_enable_45:
[00013094] 4242                      clr.w      d2
edmm_enable_46:
[00013096] 7208                      moveq.l    #8,d1
[00013098] 703e                      moveq.l    #62,d0
[0001309a] 206f 0008                 movea.l    8(a7),a0
[0001309e] 4eb9 0005 484e            jsr        Aob_state
[000130a4] 342f 0002                 move.w     2(a7),d2
[000130a8] 7208                      moveq.l    #8,d1
[000130aa] 703e                      moveq.l    #62,d0
[000130ac] 206f 0008                 movea.l    8(a7),a0
[000130b0] 4eb9 0005 4784            jsr        Aob_flags
[000130b6] 302f 0002                 move.w     2(a7),d0
[000130ba] 6604                      bne.s      edmm_enable_47
[000130bc] 7401                      moveq.l    #1,d2
[000130be] 6002                      bra.s      edmm_enable_48
edmm_enable_47:
[000130c0] 4242                      clr.w      d2
edmm_enable_48:
[000130c2] 7208                      moveq.l    #8,d1
[000130c4] 703f                      moveq.l    #63,d0
[000130c6] 206f 0008                 movea.l    8(a7),a0
[000130ca] 4eb9 0005 484e            jsr        Aob_state
[000130d0] 342f 0002                 move.w     2(a7),d2
[000130d4] 7208                      moveq.l    #8,d1
[000130d6] 703f                      moveq.l    #63,d0
[000130d8] 206f 0008                 movea.l    8(a7),a0
[000130dc] 4eb9 0005 4784            jsr        Aob_flags
[000130e2] 302f 0002                 move.w     2(a7),d0
[000130e6] 6604                      bne.s      edmm_enable_49
[000130e8] 7401                      moveq.l    #1,d2
[000130ea] 6002                      bra.s      edmm_enable_50
edmm_enable_49:
[000130ec] 4242                      clr.w      d2
edmm_enable_50:
[000130ee] 7208                      moveq.l    #8,d1
[000130f0] 7040                      moveq.l    #64,d0
[000130f2] 206f 0008                 movea.l    8(a7),a0
[000130f6] 4eb9 0005 484e            jsr        Aob_state
[000130fc] 342f 0002                 move.w     2(a7),d2
[00013100] 7208                      moveq.l    #8,d1
[00013102] 7040                      moveq.l    #64,d0
[00013104] 206f 0008                 movea.l    8(a7),a0
[00013108] 4eb9 0005 4784            jsr        Aob_flags
[0001310e] 302f 0002                 move.w     2(a7),d0
[00013112] 6604                      bne.s      edmm_enable_51
[00013114] 7401                      moveq.l    #1,d2
[00013116] 6002                      bra.s      edmm_enable_52
edmm_enable_51:
[00013118] 4242                      clr.w      d2
edmm_enable_52:
[0001311a] 7208                      moveq.l    #8,d1
[0001311c] 7041                      moveq.l    #65,d0
[0001311e] 206f 0008                 movea.l    8(a7),a0
[00013122] 4eb9 0005 484e            jsr        Aob_state
[00013128] 342f 0002                 move.w     2(a7),d2
[0001312c] 7208                      moveq.l    #8,d1
[0001312e] 7041                      moveq.l    #65,d0
[00013130] 206f 0008                 movea.l    8(a7),a0
[00013134] 4eb9 0005 4784            jsr        Aob_flags
[0001313a] 302f 0002                 move.w     2(a7),d0
[0001313e] 6604                      bne.s      edmm_enable_53
[00013140] 7401                      moveq.l    #1,d2
[00013142] 6002                      bra.s      edmm_enable_54
edmm_enable_53:
[00013144] 4242                      clr.w      d2
edmm_enable_54:
[00013146] 7208                      moveq.l    #8,d1
[00013148] 7042                      moveq.l    #66,d0
[0001314a] 206f 0008                 movea.l    8(a7),a0
[0001314e] 4eb9 0005 484e            jsr        Aob_state
[00013154] 342f 0002                 move.w     2(a7),d2
[00013158] 7208                      moveq.l    #8,d1
[0001315a] 7042                      moveq.l    #66,d0
[0001315c] 206f 0008                 movea.l    8(a7),a0
[00013160] 4eb9 0005 4784            jsr        Aob_flags
[00013166] 302f 0002                 move.w     2(a7),d0
[0001316a] 6604                      bne.s      edmm_enable_55
[0001316c] 7401                      moveq.l    #1,d2
[0001316e] 6002                      bra.s      edmm_enable_56
edmm_enable_55:
[00013170] 4242                      clr.w      d2
edmm_enable_56:
[00013172] 7208                      moveq.l    #8,d1
[00013174] 704b                      moveq.l    #75,d0
[00013176] 206f 0008                 movea.l    8(a7),a0
[0001317a] 4eb9 0005 484e            jsr        Aob_state
[00013180] 342f 0002                 move.w     2(a7),d2
[00013184] 7208                      moveq.l    #8,d1
[00013186] 704b                      moveq.l    #75,d0
[00013188] 206f 0008                 movea.l    8(a7),a0
[0001318c] 4eb9 0005 4784            jsr        Aob_flags
[00013192] 302f 0002                 move.w     2(a7),d0
[00013196] 6604                      bne.s      edmm_enable_57
[00013198] 7401                      moveq.l    #1,d2
[0001319a] 6002                      bra.s      edmm_enable_58
edmm_enable_57:
[0001319c] 4242                      clr.w      d2
edmm_enable_58:
[0001319e] 7208                      moveq.l    #8,d1
[000131a0] 704c                      moveq.l    #76,d0
[000131a2] 206f 0008                 movea.l    8(a7),a0
[000131a6] 4eb9 0005 484e            jsr        Aob_state
[000131ac] 342f 0002                 move.w     2(a7),d2
[000131b0] 7208                      moveq.l    #8,d1
[000131b2] 704c                      moveq.l    #76,d0
[000131b4] 206f 0008                 movea.l    8(a7),a0
[000131b8] 4eb9 0005 4784            jsr        Aob_flags
[000131be] 302f 0002                 move.w     2(a7),d0
[000131c2] 6604                      bne.s      edmm_enable_59
[000131c4] 7401                      moveq.l    #1,d2
[000131c6] 6002                      bra.s      edmm_enable_60
edmm_enable_59:
[000131c8] 4242                      clr.w      d2
edmm_enable_60:
[000131ca] 7208                      moveq.l    #8,d1
[000131cc] 704d                      moveq.l    #77,d0
[000131ce] 206f 0008                 movea.l    8(a7),a0
[000131d2] 4eb9 0005 484e            jsr        Aob_state
[000131d8] 342f 0002                 move.w     2(a7),d2
[000131dc] 7208                      moveq.l    #8,d1
[000131de] 704d                      moveq.l    #77,d0
[000131e0] 206f 0008                 movea.l    8(a7),a0
[000131e4] 4eb9 0005 4784            jsr        Aob_flags
[000131ea] 302f 0002                 move.w     2(a7),d0
[000131ee] 6604                      bne.s      edmm_enable_61
[000131f0] 7401                      moveq.l    #1,d2
[000131f2] 6002                      bra.s      edmm_enable_62
edmm_enable_61:
[000131f4] 4242                      clr.w      d2
edmm_enable_62:
[000131f6] 7208                      moveq.l    #8,d1
[000131f8] 704e                      moveq.l    #78,d0
[000131fa] 206f 0008                 movea.l    8(a7),a0
[000131fe] 4eb9 0005 484e            jsr        Aob_state
[00013204] 342f 0002                 move.w     2(a7),d2
[00013208] 7208                      moveq.l    #8,d1
[0001320a] 704e                      moveq.l    #78,d0
[0001320c] 206f 0008                 movea.l    8(a7),a0
[00013210] 4eb9 0005 4784            jsr        Aob_flags
[00013216] 302f 0002                 move.w     2(a7),d0
[0001321a] 6604                      bne.s      edmm_enable_63
[0001321c] 7401                      moveq.l    #1,d2
[0001321e] 6002                      bra.s      edmm_enable_64
edmm_enable_63:
[00013220] 4242                      clr.w      d2
edmm_enable_64:
[00013222] 7208                      moveq.l    #8,d1
[00013224] 704f                      moveq.l    #79,d0
[00013226] 206f 0008                 movea.l    8(a7),a0
[0001322a] 4eb9 0005 484e            jsr        Aob_state
[00013230] 342f 0002                 move.w     2(a7),d2
[00013234] 7208                      moveq.l    #8,d1
[00013236] 704f                      moveq.l    #79,d0
[00013238] 206f 0008                 movea.l    8(a7),a0
[0001323c] 4eb9 0005 4784            jsr        Aob_flags
[00013242] 302f 0002                 move.w     2(a7),d0
[00013246] 6604                      bne.s      edmm_enable_65
[00013248] 7401                      moveq.l    #1,d2
[0001324a] 6002                      bra.s      edmm_enable_66
edmm_enable_65:
[0001324c] 4242                      clr.w      d2
edmm_enable_66:
[0001324e] 7208                      moveq.l    #8,d1
[00013250] 705f                      moveq.l    #95,d0
[00013252] 206f 0008                 movea.l    8(a7),a0
[00013256] 4eb9 0005 484e            jsr        Aob_state
[0001325c] 342f 0002                 move.w     2(a7),d2
[00013260] 7208                      moveq.l    #8,d1
[00013262] 705f                      moveq.l    #95,d0
[00013264] 206f 0008                 movea.l    8(a7),a0
[00013268] 4eb9 0005 4784            jsr        Aob_flags
[0001326e] 302f 0002                 move.w     2(a7),d0
[00013272] 6604                      bne.s      edmm_enable_67
[00013274] 7401                      moveq.l    #1,d2
[00013276] 6002                      bra.s      edmm_enable_68
edmm_enable_67:
[00013278] 4242                      clr.w      d2
edmm_enable_68:
[0001327a] 7208                      moveq.l    #8,d1
[0001327c] 7056                      moveq.l    #86,d0
[0001327e] 206f 0008                 movea.l    8(a7),a0
[00013282] 4eb9 0005 484e            jsr        Aob_state
[00013288] 342f 0002                 move.w     2(a7),d2
[0001328c] 7208                      moveq.l    #8,d1
[0001328e] 7056                      moveq.l    #86,d0
[00013290] 206f 0008                 movea.l    8(a7),a0
[00013294] 4eb9 0005 4784            jsr        Aob_flags
[0001329a] 302f 0002                 move.w     2(a7),d0
[0001329e] 6604                      bne.s      edmm_enable_69
[000132a0] 7401                      moveq.l    #1,d2
[000132a2] 6002                      bra.s      edmm_enable_70
edmm_enable_69:
[000132a4] 4242                      clr.w      d2
edmm_enable_70:
[000132a6] 7208                      moveq.l    #8,d1
[000132a8] 7058                      moveq.l    #88,d0
[000132aa] 206f 0008                 movea.l    8(a7),a0
[000132ae] 4eb9 0005 484e            jsr        Aob_state
[000132b4] 342f 0002                 move.w     2(a7),d2
[000132b8] 7208                      moveq.l    #8,d1
[000132ba] 7058                      moveq.l    #88,d0
[000132bc] 206f 0008                 movea.l    8(a7),a0
[000132c0] 4eb9 0005 4784            jsr        Aob_flags
[000132c6] 4eb9 0005 5c5a            jsr        Awi_ontop
[000132cc] b1ef 0008                 cmpa.l     8(a7),a0
[000132d0] 6606                      bne.s      edmm_enable_71
[000132d2] 4eb9 0005 147c            jsr        Awi_diastart
edmm_enable_71:
[000132d8] 4fef 000c                 lea.l      12(a7),a7
[000132dc] 4e75                      rts

edmm_setval:
[000132de] 4fef ffe8                 lea.l      -24(a7),a7
[000132e2] 2f48 0014                 move.l     a0,20(a7)
[000132e6] 206f 0014                 movea.l    20(a7),a0
[000132ea] 2f50 0010                 move.l     (a0),16(a7)
[000132ee] 206f 0010                 movea.l    16(a7),a0
[000132f2] 41e8 0214                 lea.l      532(a0),a0
[000132f6] 2f48 0008                 move.l     a0,8(a7)
[000132fa] 206f 0010                 movea.l    16(a7),a0
[000132fe] 41e8 004c                 lea.l      76(a0),a0
[00013302] 2f48 0004                 move.l     a0,4(a7)
[00013306] 206f 0014                 movea.l    20(a7),a0
[0001330a] 2ea8 0014                 move.l     20(a0),(a7)
[0001330e] 206f 0010                 movea.l    16(a7),a0
[00013312] 3028 0006                 move.w     6(a0),d0
[00013316] c07c 8000                 and.w      #$8000,d0
[0001331a] 6604                      bne.s      edmm_setval_1
[0001331c] 7401                      moveq.l    #1,d2
[0001331e] 6002                      bra.s      edmm_setval_2
edmm_setval_1:
[00013320] 4242                      clr.w      d2
edmm_setval_2:
[00013322] 7201                      moveq.l    #1,d1
[00013324] 7001                      moveq.l    #1,d0
[00013326] 206f 0014                 movea.l    20(a7),a0
[0001332a] 4eb9 0005 484e            jsr        Aob_state
[00013330] 7401                      moveq.l    #1,d2
[00013332] 206f 0010                 movea.l    16(a7),a0
[00013336] c468 0252                 and.w      594(a0),d2
[0001333a] 7201                      moveq.l    #1,d1
[0001333c] 7004                      moveq.l    #4,d0
[0001333e] 206f 0014                 movea.l    20(a7),a0
[00013342] 4eb9 0005 484e            jsr        Aob_state
[00013348] 7402                      moveq.l    #2,d2
[0001334a] 206f 0010                 movea.l    16(a7),a0
[0001334e] c468 0252                 and.w      594(a0),d2
[00013352] 7201                      moveq.l    #1,d1
[00013354] 700a                      moveq.l    #10,d0
[00013356] 206f 0014                 movea.l    20(a7),a0
[0001335a] 4eb9 0005 484e            jsr        Aob_state
[00013360] 7404                      moveq.l    #4,d2
[00013362] 206f 0010                 movea.l    16(a7),a0
[00013366] c468 0252                 and.w      594(a0),d2
[0001336a] 7201                      moveq.l    #1,d1
[0001336c] 7006                      moveq.l    #6,d0
[0001336e] 206f 0014                 movea.l    20(a7),a0
[00013372] 4eb9 0005 484e            jsr        Aob_state
[00013378] 7408                      moveq.l    #8,d2
[0001337a] 206f 0010                 movea.l    16(a7),a0
[0001337e] c468 0252                 and.w      594(a0),d2
[00013382] 7201                      moveq.l    #1,d1
[00013384] 7008                      moveq.l    #8,d0
[00013386] 206f 0014                 movea.l    20(a7),a0
[0001338a] 4eb9 0005 484e            jsr        Aob_state
[00013390] 7404                      moveq.l    #4,d2
[00013392] 206f 0010                 movea.l    16(a7),a0
[00013396] c468 005a                 and.w      90(a0),d2
[0001339a] 7201                      moveq.l    #1,d1
[0001339c] 7028                      moveq.l    #40,d0
[0001339e] 206f 0014                 movea.l    20(a7),a0
[000133a2] 4eb9 0005 484e            jsr        Aob_state
[000133a8] 7410                      moveq.l    #16,d2
[000133aa] 206f 0010                 movea.l    16(a7),a0
[000133ae] c468 005a                 and.w      90(a0),d2
[000133b2] 7201                      moveq.l    #1,d1
[000133b4] 702a                      moveq.l    #42,d0
[000133b6] 206f 0014                 movea.l    20(a7),a0
[000133ba] 4eb9 0005 484e            jsr        Aob_state
[000133c0] 7420                      moveq.l    #32,d2
[000133c2] 206f 0010                 movea.l    16(a7),a0
[000133c6] c468 005a                 and.w      90(a0),d2
[000133ca] 7201                      moveq.l    #1,d1
[000133cc] 702c                      moveq.l    #44,d0
[000133ce] 206f 0014                 movea.l    20(a7),a0
[000133d2] 4eb9 0005 484e            jsr        Aob_state
[000133d8] 343c 0080                 move.w     #$0080,d2
[000133dc] 206f 0010                 movea.l    16(a7),a0
[000133e0] c468 005a                 and.w      90(a0),d2
[000133e4] 7201                      moveq.l    #1,d1
[000133e6] 702e                      moveq.l    #46,d0
[000133e8] 206f 0014                 movea.l    20(a7),a0
[000133ec] 4eb9 0005 484e            jsr        Aob_state
[000133f2] 7401                      moveq.l    #1,d2
[000133f4] 206f 0010                 movea.l    16(a7),a0
[000133f8] c468 005a                 and.w      90(a0),d2
[000133fc] 7201                      moveq.l    #1,d1
[000133fe] 7024                      moveq.l    #36,d0
[00013400] 206f 0014                 movea.l    20(a7),a0
[00013404] 4eb9 0005 484e            jsr        Aob_state
[0001340a] 7408                      moveq.l    #8,d2
[0001340c] 206f 0010                 movea.l    16(a7),a0
[00013410] c468 005a                 and.w      90(a0),d2
[00013414] 7201                      moveq.l    #1,d1
[00013416] 7026                      moveq.l    #38,d0
[00013418] 206f 0014                 movea.l    20(a7),a0
[0001341c] 4eb9 0005 484e            jsr        Aob_state
[00013422] 206f 0010                 movea.l    16(a7),a0
[00013426] 3028 005a                 move.w     90(a0),d0
[0001342a] c07c 0100                 and.w      #$0100,d0
[0001342e] 6604                      bne.s      edmm_setval_3
[00013430] 7401                      moveq.l    #1,d2
[00013432] 6002                      bra.s      edmm_setval_4
edmm_setval_3:
[00013434] 4242                      clr.w      d2
edmm_setval_4:
[00013436] 7201                      moveq.l    #1,d1
[00013438] 7030                      moveq.l    #48,d0
[0001343a] 206f 0014                 movea.l    20(a7),a0
[0001343e] 4eb9 0005 484e            jsr        Aob_state
[00013444] 7402                      moveq.l    #2,d2
[00013446] 206f 0010                 movea.l    16(a7),a0
[0001344a] c468 005a                 and.w      90(a0),d2
[0001344e] 7201                      moveq.l    #1,d1
[00013450] 7032                      moveq.l    #50,d0
[00013452] 206f 0014                 movea.l    20(a7),a0
[00013456] 4eb9 0005 484e            jsr        Aob_state
[0001345c] 206f 0010                 movea.l    16(a7),a0
[00013460] 3028 005a                 move.w     90(a0),d0
[00013464] c07c 0400                 and.w      #$0400,d0
[00013468] 6604                      bne.s      edmm_setval_5
[0001346a] 7401                      moveq.l    #1,d2
[0001346c] 6002                      bra.s      edmm_setval_6
edmm_setval_5:
[0001346e] 4242                      clr.w      d2
edmm_setval_6:
[00013470] 7201                      moveq.l    #1,d1
[00013472] 7034                      moveq.l    #52,d0
[00013474] 206f 0014                 movea.l    20(a7),a0
[00013478] 4eb9 0005 484e            jsr        Aob_state
[0001347e] 206f 0010                 movea.l    16(a7),a0
[00013482] 3028 005a                 move.w     90(a0),d0
[00013486] c07c 0200                 and.w      #$0200,d0
[0001348a] 6604                      bne.s      edmm_setval_7
[0001348c] 7401                      moveq.l    #1,d2
[0001348e] 6002                      bra.s      edmm_setval_8
edmm_setval_7:
[00013490] 4242                      clr.w      d2
edmm_setval_8:
[00013492] 7201                      moveq.l    #1,d1
[00013494] 7036                      moveq.l    #54,d0
[00013496] 206f 0014                 movea.l    20(a7),a0
[0001349a] 4eb9 0005 484e            jsr        Aob_state
[000134a0] 206f 0010                 movea.l    16(a7),a0
[000134a4] 3028 005a                 move.w     90(a0),d0
[000134a8] c07c 1000                 and.w      #$1000,d0
[000134ac] 6604                      bne.s      edmm_setval_9
[000134ae] 7401                      moveq.l    #1,d2
[000134b0] 6002                      bra.s      edmm_setval_10
edmm_setval_9:
[000134b2] 4242                      clr.w      d2
edmm_setval_10:
[000134b4] 7201                      moveq.l    #1,d1
[000134b6] 7038                      moveq.l    #56,d0
[000134b8] 206f 0014                 movea.l    20(a7),a0
[000134bc] 4eb9 0005 484e            jsr        Aob_state
[000134c2] 226f 0004                 movea.l    4(a7),a1
[000134c6] 43e9 0012                 lea.l      18(a1),a1
[000134ca] 7010                      moveq.l    #16,d0
[000134cc] 2057                      movea.l    (a7),a0
[000134ce] 4eb9 0005 0fd8            jsr        Aob_puttext
[000134d4] 206f 0004                 movea.l    4(a7),a0
[000134d8] 2f68 0034 000c            move.l     52(a0),12(a7)
[000134de] 202f 000c                 move.l     12(a7),d0
[000134e2] 6608                      bne.s      edmm_setval_11
[000134e4] 43f9 0008 af8a            lea.l      $0008AF8A,a1
[000134ea] 6008                      bra.s      edmm_setval_12
edmm_setval_11:
[000134ec] 226f 000c                 movea.l    12(a7),a1
[000134f0] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_12:
[000134f4] 7011                      moveq.l    #17,d0
[000134f6] 2057                      movea.l    (a7),a0
[000134f8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000134fe] 206f 0004                 movea.l    4(a7),a0
[00013502] 2f68 0030 000c            move.l     48(a0),12(a7)
[00013508] 202f 000c                 move.l     12(a7),d0
[0001350c] 6608                      bne.s      edmm_setval_13
[0001350e] 43f9 0008 af8b            lea.l      $0008AF8B,a1
[00013514] 6008                      bra.s      edmm_setval_14
edmm_setval_13:
[00013516] 226f 000c                 movea.l    12(a7),a1
[0001351a] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_14:
[0001351e] 7013                      moveq.l    #19,d0
[00013520] 2057                      movea.l    (a7),a0
[00013522] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013528] 206f 0008                 movea.l    8(a7),a0
[0001352c] 2f68 0016 000c            move.l     22(a0),12(a7)
[00013532] 202f 000c                 move.l     12(a7),d0
[00013536] 6608                      bne.s      edmm_setval_15
[00013538] 43f9 0008 af8c            lea.l      $0008AF8C,a1
[0001353e] 6008                      bra.s      edmm_setval_16
edmm_setval_15:
[00013540] 226f 000c                 movea.l    12(a7),a1
[00013544] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_16:
[00013548] 7042                      moveq.l    #66,d0
[0001354a] 2057                      movea.l    (a7),a0
[0001354c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013552] 206f 0008                 movea.l    8(a7),a0
[00013556] 2f68 001a 000c            move.l     26(a0),12(a7)
[0001355c] 202f 000c                 move.l     12(a7),d0
[00013560] 6608                      bne.s      edmm_setval_17
[00013562] 43f9 0008 af8d            lea.l      $0008AF8D,a1
[00013568] 6008                      bra.s      edmm_setval_18
edmm_setval_17:
[0001356a] 226f 000c                 movea.l    12(a7),a1
[0001356e] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_18:
[00013572] 703e                      moveq.l    #62,d0
[00013574] 2057                      movea.l    (a7),a0
[00013576] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001357c] 206f 0008                 movea.l    8(a7),a0
[00013580] 2f68 001e 000c            move.l     30(a0),12(a7)
[00013586] 202f 000c                 move.l     12(a7),d0
[0001358a] 6608                      bne.s      edmm_setval_19
[0001358c] 43f9 0008 af8e            lea.l      $0008AF8E,a1
[00013592] 6008                      bra.s      edmm_setval_20
edmm_setval_19:
[00013594] 226f 000c                 movea.l    12(a7),a1
[00013598] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_20:
[0001359c] 703f                      moveq.l    #63,d0
[0001359e] 2057                      movea.l    (a7),a0
[000135a0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000135a6] 206f 0008                 movea.l    8(a7),a0
[000135aa] 2f68 0022 000c            move.l     34(a0),12(a7)
[000135b0] 202f 000c                 move.l     12(a7),d0
[000135b4] 6608                      bne.s      edmm_setval_21
[000135b6] 43f9 0008 af8f            lea.l      $0008AF8F,a1
[000135bc] 6008                      bra.s      edmm_setval_22
edmm_setval_21:
[000135be] 226f 000c                 movea.l    12(a7),a1
[000135c2] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_22:
[000135c6] 7040                      moveq.l    #64,d0
[000135c8] 2057                      movea.l    (a7),a0
[000135ca] 4eb9 0005 0fd8            jsr        Aob_puttext
[000135d0] 206f 0008                 movea.l    8(a7),a0
[000135d4] 2f68 0026 000c            move.l     38(a0),12(a7)
[000135da] 202f 000c                 move.l     12(a7),d0
[000135de] 6608                      bne.s      edmm_setval_23
[000135e0] 43f9 0008 af90            lea.l      $0008AF90,a1
[000135e6] 6008                      bra.s      edmm_setval_24
edmm_setval_23:
[000135e8] 226f 000c                 movea.l    12(a7),a1
[000135ec] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_24:
[000135f0] 704b                      moveq.l    #75,d0
[000135f2] 2057                      movea.l    (a7),a0
[000135f4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000135fa] 206f 0008                 movea.l    8(a7),a0
[000135fe] 2f68 002a 000c            move.l     42(a0),12(a7)
[00013604] 202f 000c                 move.l     12(a7),d0
[00013608] 6608                      bne.s      edmm_setval_25
[0001360a] 43f9 0008 af91            lea.l      $0008AF91,a1
[00013610] 6008                      bra.s      edmm_setval_26
edmm_setval_25:
[00013612] 226f 000c                 movea.l    12(a7),a1
[00013616] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_26:
[0001361a] 7041                      moveq.l    #65,d0
[0001361c] 2057                      movea.l    (a7),a0
[0001361e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013624] 206f 0008                 movea.l    8(a7),a0
[00013628] 2f68 002e 000c            move.l     46(a0),12(a7)
[0001362e] 202f 000c                 move.l     12(a7),d0
[00013632] 6608                      bne.s      edmm_setval_27
[00013634] 43f9 0008 af92            lea.l      $0008AF92,a1
[0001363a] 6008                      bra.s      edmm_setval_28
edmm_setval_27:
[0001363c] 226f 000c                 movea.l    12(a7),a1
[00013640] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_28:
[00013644] 704c                      moveq.l    #76,d0
[00013646] 2057                      movea.l    (a7),a0
[00013648] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001364e] 206f 0008                 movea.l    8(a7),a0
[00013652] 2f68 0032 000c            move.l     50(a0),12(a7)
[00013658] 202f 000c                 move.l     12(a7),d0
[0001365c] 6608                      bne.s      edmm_setval_29
[0001365e] 43f9 0008 af93            lea.l      $0008AF93,a1
[00013664] 6008                      bra.s      edmm_setval_30
edmm_setval_29:
[00013666] 226f 000c                 movea.l    12(a7),a1
[0001366a] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_30:
[0001366e] 704e                      moveq.l    #78,d0
[00013670] 2057                      movea.l    (a7),a0
[00013672] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013678] 206f 0008                 movea.l    8(a7),a0
[0001367c] 2f68 0036 000c            move.l     54(a0),12(a7)
[00013682] 202f 000c                 move.l     12(a7),d0
[00013686] 6608                      bne.s      edmm_setval_31
[00013688] 43f9 0008 af94            lea.l      $0008AF94,a1
[0001368e] 6008                      bra.s      edmm_setval_32
edmm_setval_31:
[00013690] 226f 000c                 movea.l    12(a7),a1
[00013694] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_32:
[00013698] 704f                      moveq.l    #79,d0
[0001369a] 2057                      movea.l    (a7),a0
[0001369c] 4eb9 0005 0fd8            jsr        Aob_puttext
[000136a2] 206f 0008                 movea.l    8(a7),a0
[000136a6] 2f68 003a 000c            move.l     58(a0),12(a7)
[000136ac] 202f 000c                 move.l     12(a7),d0
[000136b0] 6608                      bne.s      edmm_setval_33
[000136b2] 43f9 0008 af95            lea.l      $0008AF95,a1
[000136b8] 6008                      bra.s      edmm_setval_34
edmm_setval_33:
[000136ba] 226f 000c                 movea.l    12(a7),a1
[000136be] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_34:
[000136c2] 704d                      moveq.l    #77,d0
[000136c4] 2057                      movea.l    (a7),a0
[000136c6] 4eb9 0005 0fd8            jsr        Aob_puttext
[000136cc] 206f 0008                 movea.l    8(a7),a0
[000136d0] 2f68 0042 000c            move.l     66(a0),12(a7)
[000136d6] 202f 000c                 move.l     12(a7),d0
[000136da] 6608                      bne.s      edmm_setval_35
[000136dc] 43f9 0008 af96            lea.l      $0008AF96,a1
[000136e2] 6008                      bra.s      edmm_setval_36
edmm_setval_35:
[000136e4] 226f 000c                 movea.l    12(a7),a1
[000136e8] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_36:
[000136ec] 705f                      moveq.l    #95,d0
[000136ee] 2057                      movea.l    (a7),a0
[000136f0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000136f6] 206f 0008                 movea.l    8(a7),a0
[000136fa] 2f68 0046 000c            move.l     70(a0),12(a7)
[00013700] 202f 000c                 move.l     12(a7),d0
[00013704] 6608                      bne.s      edmm_setval_37
[00013706] 43f9 0008 af97            lea.l      $0008AF97,a1
[0001370c] 6008                      bra.s      edmm_setval_38
edmm_setval_37:
[0001370e] 226f 000c                 movea.l    12(a7),a1
[00013712] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_38:
[00013716] 701d                      moveq.l    #29,d0
[00013718] 2057                      movea.l    (a7),a0
[0001371a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013720] 206f 0008                 movea.l    8(a7),a0
[00013724] 2f68 004a 000c            move.l     74(a0),12(a7)
[0001372a] 202f 000c                 move.l     12(a7),d0
[0001372e] 6608                      bne.s      edmm_setval_39
[00013730] 43f9 0008 af98            lea.l      $0008AF98,a1
[00013736] 6008                      bra.s      edmm_setval_40
edmm_setval_39:
[00013738] 226f 000c                 movea.l    12(a7),a1
[0001373c] 43e9 0016                 lea.l      22(a1),a1
edmm_setval_40:
[00013740] 701e                      moveq.l    #30,d0
[00013742] 2057                      movea.l    (a7),a0
[00013744] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001374a] 206f 0004                 movea.l    4(a7),a0
[0001374e] 3f28 000a                 move.w     10(a0),-(a7)
[00013752] 43f9 0008 af99            lea.l      $0008AF99,a1
[00013758] 7056                      moveq.l    #86,d0
[0001375a] 206f 0002                 movea.l    2(a7),a0
[0001375e] 4eb9 0005 0f94            jsr        Aob_printf
[00013764] 544f                      addq.w     #2,a7
[00013766] 206f 0004                 movea.l    4(a7),a0
[0001376a] 3f28 000c                 move.w     12(a0),-(a7)
[0001376e] 43f9 0008 af9c            lea.l      $0008AF9C,a1
[00013774] 7058                      moveq.l    #88,d0
[00013776] 206f 0002                 movea.l    2(a7),a0
[0001377a] 4eb9 0005 0f94            jsr        Aob_printf
[00013780] 544f                      addq.w     #2,a7
[00013782] 226f 0008                 movea.l    8(a7),a1
[00013786] 43e9 0040                 lea.l      64(a1),a1
[0001378a] 303c 0191                 move.w     #$0191,d0
[0001378e] 2057                      movea.l    (a7),a0
[00013790] 41e8 0318                 lea.l      792(a0),a0
[00013794] 4eb9 0006 7456            jsr        Auo_cycle
[0001379a] 4fef 0018                 lea.l      24(a7),a7
[0001379e] 4e75                      rts

edmm_getval:
[000137a0] 4fef ffe2                 lea.l      -30(a7),a7
[000137a4] 2f48 001a                 move.l     a0,26(a7)
[000137a8] 206f 001a                 movea.l    26(a7),a0
[000137ac] 2f50 0016                 move.l     (a0),22(a7)
[000137b0] 206f 0016                 movea.l    22(a7),a0
[000137b4] 41e8 0214                 lea.l      532(a0),a0
[000137b8] 2f48 000e                 move.l     a0,14(a7)
[000137bc] 206f 0016                 movea.l    22(a7),a0
[000137c0] 41e8 004c                 lea.l      76(a0),a0
[000137c4] 2f48 000a                 move.l     a0,10(a7)
[000137c8] 206f 001a                 movea.l    26(a7),a0
[000137cc] 2f68 0014 0006            move.l     20(a0),6(a7)
[000137d2] 7001                      moveq.l    #1,d0
[000137d4] 206f 0006                 movea.l    6(a7),a0
[000137d8] c068 0022                 and.w      34(a0),d0
[000137dc] 6716                      beq.s      edmm_getval_1
[000137de] 206f 0016                 movea.l    22(a7),a0
[000137e2] 0268 7fff 0006            andi.w     #$7FFF,6(a0)
[000137e8] 206f 0016                 movea.l    22(a7),a0
[000137ec] 4eb9 0001 89ca            jsr        init_mess
[000137f2] 6042                      bra.s      edmm_getval_2
edmm_getval_1:
[000137f4] 206f 0016                 movea.l    22(a7),a0
[000137f8] 3028 0006                 move.w     6(a0),d0
[000137fc] c07c 8000                 and.w      #$8000,d0
[00013800] 6634                      bne.s      edmm_getval_2
[00013802] 41f9 0008 759e            lea.l      A_DELMESS,a0
[00013808] 7001                      moveq.l    #1,d0
[0001380a] 4eb9 0005 a600            jsr        Awi_alert
[00013810] 3e80                      move.w     d0,(a7)
[00013812] 3017                      move.w     (a7),d0
[00013814] 5340                      subq.w     #1,d0
[00013816] 670a                      beq.s      edmm_getval_3
[00013818] 5340                      subq.w     #1,d0
[0001381a] 6712                      beq.s      edmm_getval_4
[0001381c] 5340                      subq.w     #1,d0
[0001381e] 6710                      beq.s      edmm_getval_5
[00013820] 6014                      bra.s      edmm_getval_2
edmm_getval_3:
[00013822] 206f 0016                 movea.l    22(a7),a0
[00013826] 4eb9 0001 8902            jsr        del_mess
[0001382c] 6008                      bra.s      edmm_getval_2
edmm_getval_4:
[0001382e] 6006                      bra.s      edmm_getval_2
edmm_getval_5:
[00013830] 4240                      clr.w      d0
[00013832] 6000 0594                 bra        edmm_getval_6
edmm_getval_2:
[00013836] 206f 0016                 movea.l    22(a7),a0
[0001383a] 0068 0001 0006            ori.w      #$0001,6(a0)
[00013840] 7401                      moveq.l    #1,d2
[00013842] 323c 8000                 move.w     #$8000,d1
[00013846] 226f 0016                 movea.l    22(a7),a1
[0001384a] 5c49                      addq.w     #6,a1
[0001384c] 7001                      moveq.l    #1,d0
[0001384e] 206f 0006                 movea.l    6(a7),a0
[00013852] 6100 f4fa                 bsr        edmm_setflag
[00013856] 4242                      clr.w      d2
[00013858] 7201                      moveq.l    #1,d1
[0001385a] 226f 0016                 movea.l    22(a7),a1
[0001385e] 43e9 0252                 lea.l      594(a1),a1
[00013862] 7004                      moveq.l    #4,d0
[00013864] 206f 0006                 movea.l    6(a7),a0
[00013868] 6100 f4e4                 bsr        edmm_setflag
[0001386c] 4242                      clr.w      d2
[0001386e] 7202                      moveq.l    #2,d1
[00013870] 226f 0016                 movea.l    22(a7),a1
[00013874] 43e9 0252                 lea.l      594(a1),a1
[00013878] 700a                      moveq.l    #10,d0
[0001387a] 206f 0006                 movea.l    6(a7),a0
[0001387e] 6100 f4ce                 bsr        edmm_setflag
[00013882] 4242                      clr.w      d2
[00013884] 7204                      moveq.l    #4,d1
[00013886] 226f 0016                 movea.l    22(a7),a1
[0001388a] 43e9 0252                 lea.l      594(a1),a1
[0001388e] 7006                      moveq.l    #6,d0
[00013890] 206f 0006                 movea.l    6(a7),a0
[00013894] 6100 f4b8                 bsr        edmm_setflag
[00013898] 4242                      clr.w      d2
[0001389a] 7208                      moveq.l    #8,d1
[0001389c] 226f 0016                 movea.l    22(a7),a1
[000138a0] 43e9 0252                 lea.l      594(a1),a1
[000138a4] 7008                      moveq.l    #8,d0
[000138a6] 206f 0006                 movea.l    6(a7),a0
[000138aa] 6100 f4a2                 bsr        edmm_setflag
[000138ae] 4242                      clr.w      d2
[000138b0] 7204                      moveq.l    #4,d1
[000138b2] 226f 0016                 movea.l    22(a7),a1
[000138b6] 43e9 005a                 lea.l      90(a1),a1
[000138ba] 7028                      moveq.l    #40,d0
[000138bc] 206f 0006                 movea.l    6(a7),a0
[000138c0] 6100 f48c                 bsr        edmm_setflag
[000138c4] 4242                      clr.w      d2
[000138c6] 7210                      moveq.l    #16,d1
[000138c8] 226f 0016                 movea.l    22(a7),a1
[000138cc] 43e9 005a                 lea.l      90(a1),a1
[000138d0] 702a                      moveq.l    #42,d0
[000138d2] 206f 0006                 movea.l    6(a7),a0
[000138d6] 6100 f476                 bsr        edmm_setflag
[000138da] 4242                      clr.w      d2
[000138dc] 7220                      moveq.l    #32,d1
[000138de] 226f 0016                 movea.l    22(a7),a1
[000138e2] 43e9 005a                 lea.l      90(a1),a1
[000138e6] 702c                      moveq.l    #44,d0
[000138e8] 206f 0006                 movea.l    6(a7),a0
[000138ec] 6100 f460                 bsr        edmm_setflag
[000138f0] 4242                      clr.w      d2
[000138f2] 323c 0080                 move.w     #$0080,d1
[000138f6] 226f 0016                 movea.l    22(a7),a1
[000138fa] 43e9 005a                 lea.l      90(a1),a1
[000138fe] 702e                      moveq.l    #46,d0
[00013900] 206f 0006                 movea.l    6(a7),a0
[00013904] 6100 f448                 bsr        edmm_setflag
[00013908] 4242                      clr.w      d2
[0001390a] 7201                      moveq.l    #1,d1
[0001390c] 226f 0016                 movea.l    22(a7),a1
[00013910] 43e9 005a                 lea.l      90(a1),a1
[00013914] 7024                      moveq.l    #36,d0
[00013916] 206f 0006                 movea.l    6(a7),a0
[0001391a] 6100 f432                 bsr        edmm_setflag
[0001391e] 4242                      clr.w      d2
[00013920] 7208                      moveq.l    #8,d1
[00013922] 226f 0016                 movea.l    22(a7),a1
[00013926] 43e9 005a                 lea.l      90(a1),a1
[0001392a] 7026                      moveq.l    #38,d0
[0001392c] 206f 0006                 movea.l    6(a7),a0
[00013930] 6100 f41c                 bsr        edmm_setflag
[00013934] 7401                      moveq.l    #1,d2
[00013936] 323c 0100                 move.w     #$0100,d1
[0001393a] 226f 0016                 movea.l    22(a7),a1
[0001393e] 43e9 005a                 lea.l      90(a1),a1
[00013942] 7030                      moveq.l    #48,d0
[00013944] 206f 0006                 movea.l    6(a7),a0
[00013948] 6100 f404                 bsr        edmm_setflag
[0001394c] 4242                      clr.w      d2
[0001394e] 7202                      moveq.l    #2,d1
[00013950] 226f 0016                 movea.l    22(a7),a1
[00013954] 43e9 005a                 lea.l      90(a1),a1
[00013958] 7032                      moveq.l    #50,d0
[0001395a] 206f 0006                 movea.l    6(a7),a0
[0001395e] 6100 f3ee                 bsr        edmm_setflag
[00013962] 7401                      moveq.l    #1,d2
[00013964] 323c 0400                 move.w     #$0400,d1
[00013968] 226f 0016                 movea.l    22(a7),a1
[0001396c] 43e9 005a                 lea.l      90(a1),a1
[00013970] 7034                      moveq.l    #52,d0
[00013972] 206f 0006                 movea.l    6(a7),a0
[00013976] 6100 f3d6                 bsr        edmm_setflag
[0001397a] 7401                      moveq.l    #1,d2
[0001397c] 323c 0200                 move.w     #$0200,d1
[00013980] 226f 0016                 movea.l    22(a7),a1
[00013984] 43e9 005a                 lea.l      90(a1),a1
[00013988] 7036                      moveq.l    #54,d0
[0001398a] 206f 0006                 movea.l    6(a7),a0
[0001398e] 6100 f3be                 bsr        edmm_setflag
[00013992] 7401                      moveq.l    #1,d2
[00013994] 323c 1000                 move.w     #$1000,d1
[00013998] 226f 0016                 movea.l    22(a7),a1
[0001399c] 43e9 005a                 lea.l      90(a1),a1
[000139a0] 7038                      moveq.l    #56,d0
[000139a2] 206f 0006                 movea.l    6(a7),a0
[000139a6] 6100 f3a6                 bsr        edmm_setflag
[000139aa] 43f9 0008 af9f            lea.l      $0008AF9F,a1
[000139b0] 206f 000a                 movea.l    10(a7),a0
[000139b4] 41e8 0010                 lea.l      16(a0),a0
[000139b8] 4eb9 0008 2f0c            jsr        strcpy
[000139be] 226f 000a                 movea.l    10(a7),a1
[000139c2] 43e9 0012                 lea.l      18(a1),a1
[000139c6] 7010                      moveq.l    #16,d0
[000139c8] 206f 0006                 movea.l    6(a7),a0
[000139cc] 4eb9 0005 11da            jsr        Aob_gettext
[000139d2] 43ef 0002                 lea.l      2(a7),a1
[000139d6] 7003                      moveq.l    #3,d0
[000139d8] 206f 0006                 movea.l    6(a7),a0
[000139dc] 41e8 0198                 lea.l      408(a0),a0
[000139e0] 4eb9 0006 a068            jsr        Auo_boxed
[000139e6] 206f 000a                 movea.l    10(a7),a0
[000139ea] 2f68 0034 0012            move.l     52(a0),18(a7)
[000139f0] 2f2f 0002                 move.l     2(a7),-(a7)
[000139f4] 226f 0016                 movea.l    22(a7),a1
[000139f8] 206f 001a                 movea.l    26(a7),a0
[000139fc] 6100 ec82                 bsr        add_wi
[00013a00] 584f                      addq.w     #4,a7
[00013a02] 226f 000a                 movea.l    10(a7),a1
[00013a06] 2348 0034                 move.l     a0,52(a1)
[00013a0a] 43ef 0002                 lea.l      2(a7),a1
[00013a0e] 7003                      moveq.l    #3,d0
[00013a10] 206f 0006                 movea.l    6(a7),a0
[00013a14] 41e8 01c8                 lea.l      456(a0),a0
[00013a18] 4eb9 0006 a068            jsr        Auo_boxed
[00013a1e] 206f 000a                 movea.l    10(a7),a0
[00013a22] 2f68 0030 0012            move.l     48(a0),18(a7)
[00013a28] 2f2f 0002                 move.l     2(a7),-(a7)
[00013a2c] 226f 0016                 movea.l    22(a7),a1
[00013a30] 206f 001a                 movea.l    26(a7),a0
[00013a34] 6100 ec4a                 bsr        add_wi
[00013a38] 584f                      addq.w     #4,a7
[00013a3a] 226f 000a                 movea.l    10(a7),a1
[00013a3e] 2348 0030                 move.l     a0,48(a1)
[00013a42] 43ef 0002                 lea.l      2(a7),a1
[00013a46] 7003                      moveq.l    #3,d0
[00013a48] 206f 0006                 movea.l    6(a7),a0
[00013a4c] 41e8 0630                 lea.l      1584(a0),a0
[00013a50] 4eb9 0006 a068            jsr        Auo_boxed
[00013a56] 206f 000e                 movea.l    14(a7),a0
[00013a5a] 2f68 0016 0012            move.l     22(a0),18(a7)
[00013a60] 2f2f 0002                 move.l     2(a7),-(a7)
[00013a64] 701b                      moveq.l    #27,d0
[00013a66] 226f 0016                 movea.l    22(a7),a1
[00013a6a] 206f 001a                 movea.l    26(a7),a0
[00013a6e] 6100 eca0                 bsr        add_fkt
[00013a72] 584f                      addq.w     #4,a7
[00013a74] 226f 000e                 movea.l    14(a7),a1
[00013a78] 2348 0016                 move.l     a0,22(a1)
[00013a7c] 43ef 0002                 lea.l      2(a7),a1
[00013a80] 7003                      moveq.l    #3,d0
[00013a82] 206f 0006                 movea.l    6(a7),a0
[00013a86] 41e8 05d0                 lea.l      1488(a0),a0
[00013a8a] 4eb9 0006 a068            jsr        Auo_boxed
[00013a90] 206f 000e                 movea.l    14(a7),a0
[00013a94] 2f68 001a 0012            move.l     26(a0),18(a7)
[00013a9a] 2f2f 0002                 move.l     2(a7),-(a7)
[00013a9e] 701c                      moveq.l    #28,d0
[00013aa0] 226f 0016                 movea.l    22(a7),a1
[00013aa4] 206f 001a                 movea.l    26(a7),a0
[00013aa8] 6100 ec66                 bsr        add_fkt
[00013aac] 584f                      addq.w     #4,a7
[00013aae] 226f 000e                 movea.l    14(a7),a1
[00013ab2] 2348 001a                 move.l     a0,26(a1)
[00013ab6] 43ef 0002                 lea.l      2(a7),a1
[00013aba] 7003                      moveq.l    #3,d0
[00013abc] 206f 0006                 movea.l    6(a7),a0
[00013ac0] 41e8 05e8                 lea.l      1512(a0),a0
[00013ac4] 4eb9 0006 a068            jsr        Auo_boxed
[00013aca] 206f 000e                 movea.l    14(a7),a0
[00013ace] 2f68 001e 0012            move.l     30(a0),18(a7)
[00013ad4] 2f2f 0002                 move.l     2(a7),-(a7)
[00013ad8] 701d                      moveq.l    #29,d0
[00013ada] 226f 0016                 movea.l    22(a7),a1
[00013ade] 206f 001a                 movea.l    26(a7),a0
[00013ae2] 6100 ec2c                 bsr        add_fkt
[00013ae6] 584f                      addq.w     #4,a7
[00013ae8] 226f 000e                 movea.l    14(a7),a1
[00013aec] 2348 001e                 move.l     a0,30(a1)
[00013af0] 43ef 0002                 lea.l      2(a7),a1
[00013af4] 7003                      moveq.l    #3,d0
[00013af6] 206f 0006                 movea.l    6(a7),a0
[00013afa] 41e8 0600                 lea.l      1536(a0),a0
[00013afe] 4eb9 0006 a068            jsr        Auo_boxed
[00013b04] 206f 000e                 movea.l    14(a7),a0
[00013b08] 2f68 0022 0012            move.l     34(a0),18(a7)
[00013b0e] 2f2f 0002                 move.l     2(a7),-(a7)
[00013b12] 701e                      moveq.l    #30,d0
[00013b14] 226f 0016                 movea.l    22(a7),a1
[00013b18] 206f 001a                 movea.l    26(a7),a0
[00013b1c] 6100 ebf2                 bsr        add_fkt
[00013b20] 584f                      addq.w     #4,a7
[00013b22] 226f 000e                 movea.l    14(a7),a1
[00013b26] 2348 0022                 move.l     a0,34(a1)
[00013b2a] 43ef 0002                 lea.l      2(a7),a1
[00013b2e] 7003                      moveq.l    #3,d0
[00013b30] 206f 0006                 movea.l    6(a7),a0
[00013b34] 41e8 0708                 lea.l      1800(a0),a0
[00013b38] 4eb9 0006 a068            jsr        Auo_boxed
[00013b3e] 206f 000e                 movea.l    14(a7),a0
[00013b42] 2f68 0026 0012            move.l     38(a0),18(a7)
[00013b48] 2f2f 0002                 move.l     2(a7),-(a7)
[00013b4c] 701f                      moveq.l    #31,d0
[00013b4e] 226f 0016                 movea.l    22(a7),a1
[00013b52] 206f 001a                 movea.l    26(a7),a0
[00013b56] 6100 ebb8                 bsr        add_fkt
[00013b5a] 584f                      addq.w     #4,a7
[00013b5c] 226f 000e                 movea.l    14(a7),a1
[00013b60] 2348 0026                 move.l     a0,38(a1)
[00013b64] 43ef 0002                 lea.l      2(a7),a1
[00013b68] 7003                      moveq.l    #3,d0
[00013b6a] 206f 0006                 movea.l    6(a7),a0
[00013b6e] 41e8 0618                 lea.l      1560(a0),a0
[00013b72] 4eb9 0006 a068            jsr        Auo_boxed
[00013b78] 206f 000e                 movea.l    14(a7),a0
[00013b7c] 2f68 002a 0012            move.l     42(a0),18(a7)
[00013b82] 2f2f 0002                 move.l     2(a7),-(a7)
[00013b86] 7020                      moveq.l    #32,d0
[00013b88] 226f 0016                 movea.l    22(a7),a1
[00013b8c] 206f 001a                 movea.l    26(a7),a0
[00013b90] 6100 eb7e                 bsr        add_fkt
[00013b94] 584f                      addq.w     #4,a7
[00013b96] 226f 000e                 movea.l    14(a7),a1
[00013b9a] 2348 002a                 move.l     a0,42(a1)
[00013b9e] 43ef 0002                 lea.l      2(a7),a1
[00013ba2] 7003                      moveq.l    #3,d0
[00013ba4] 206f 0006                 movea.l    6(a7),a0
[00013ba8] 41e8 0720                 lea.l      1824(a0),a0
[00013bac] 4eb9 0006 a068            jsr        Auo_boxed
[00013bb2] 206f 000e                 movea.l    14(a7),a0
[00013bb6] 2f68 002e 0012            move.l     46(a0),18(a7)
[00013bbc] 2f2f 0002                 move.l     2(a7),-(a7)
[00013bc0] 7021                      moveq.l    #33,d0
[00013bc2] 226f 0016                 movea.l    22(a7),a1
[00013bc6] 206f 001a                 movea.l    26(a7),a0
[00013bca] 6100 eb44                 bsr        add_fkt
[00013bce] 584f                      addq.w     #4,a7
[00013bd0] 226f 000e                 movea.l    14(a7),a1
[00013bd4] 2348 002e                 move.l     a0,46(a1)
[00013bd8] 43ef 0002                 lea.l      2(a7),a1
[00013bdc] 7003                      moveq.l    #3,d0
[00013bde] 206f 0006                 movea.l    6(a7),a0
[00013be2] 41e8 0750                 lea.l      1872(a0),a0
[00013be6] 4eb9 0006 a068            jsr        Auo_boxed
[00013bec] 206f 000e                 movea.l    14(a7),a0
[00013bf0] 2f68 0032 0012            move.l     50(a0),18(a7)
[00013bf6] 2f2f 0002                 move.l     2(a7),-(a7)
[00013bfa] 7022                      moveq.l    #34,d0
[00013bfc] 226f 0016                 movea.l    22(a7),a1
[00013c00] 206f 001a                 movea.l    26(a7),a0
[00013c04] 6100 eb0a                 bsr        add_fkt
[00013c08] 584f                      addq.w     #4,a7
[00013c0a] 226f 000e                 movea.l    14(a7),a1
[00013c0e] 2348 0032                 move.l     a0,50(a1)
[00013c12] 43ef 0002                 lea.l      2(a7),a1
[00013c16] 7003                      moveq.l    #3,d0
[00013c18] 206f 0006                 movea.l    6(a7),a0
[00013c1c] 41e8 0768                 lea.l      1896(a0),a0
[00013c20] 4eb9 0006 a068            jsr        Auo_boxed
[00013c26] 206f 000e                 movea.l    14(a7),a0
[00013c2a] 2f68 0036 0012            move.l     54(a0),18(a7)
[00013c30] 2f2f 0002                 move.l     2(a7),-(a7)
[00013c34] 7023                      moveq.l    #35,d0
[00013c36] 226f 0016                 movea.l    22(a7),a1
[00013c3a] 206f 001a                 movea.l    26(a7),a0
[00013c3e] 6100 ead0                 bsr        add_fkt
[00013c42] 584f                      addq.w     #4,a7
[00013c44] 226f 000e                 movea.l    14(a7),a1
[00013c48] 2348 0036                 move.l     a0,54(a1)
[00013c4c] 43ef 0002                 lea.l      2(a7),a1
[00013c50] 7003                      moveq.l    #3,d0
[00013c52] 206f 0006                 movea.l    6(a7),a0
[00013c56] 41e8 0738                 lea.l      1848(a0),a0
[00013c5a] 4eb9 0006 a068            jsr        Auo_boxed
[00013c60] 206f 000e                 movea.l    14(a7),a0
[00013c64] 2f68 003a 0012            move.l     58(a0),18(a7)
[00013c6a] 2f2f 0002                 move.l     2(a7),-(a7)
[00013c6e] 7024                      moveq.l    #36,d0
[00013c70] 226f 0016                 movea.l    22(a7),a1
[00013c74] 206f 001a                 movea.l    26(a7),a0
[00013c78] 6100 ea96                 bsr        add_fkt
[00013c7c] 584f                      addq.w     #4,a7
[00013c7e] 226f 000e                 movea.l    14(a7),a1
[00013c82] 2348 003a                 move.l     a0,58(a1)
[00013c86] 43ef 0002                 lea.l      2(a7),a1
[00013c8a] 7003                      moveq.l    #3,d0
[00013c8c] 206f 0006                 movea.l    6(a7),a0
[00013c90] 41e8 08e8                 lea.l      2280(a0),a0
[00013c94] 4eb9 0006 a068            jsr        Auo_boxed
[00013c9a] 206f 000e                 movea.l    14(a7),a0
[00013c9e] 2f68 0042 0012            move.l     66(a0),18(a7)
[00013ca4] 2f2f 0002                 move.l     2(a7),-(a7)
[00013ca8] 7025                      moveq.l    #37,d0
[00013caa] 226f 0016                 movea.l    22(a7),a1
[00013cae] 206f 001a                 movea.l    26(a7),a0
[00013cb2] 6100 ea5c                 bsr        add_fkt
[00013cb6] 584f                      addq.w     #4,a7
[00013cb8] 226f 000e                 movea.l    14(a7),a1
[00013cbc] 2348 0042                 move.l     a0,66(a1)
[00013cc0] 43ef 0002                 lea.l      2(a7),a1
[00013cc4] 7003                      moveq.l    #3,d0
[00013cc6] 206f 0006                 movea.l    6(a7),a0
[00013cca] 41e8 02b8                 lea.l      696(a0),a0
[00013cce] 4eb9 0006 a068            jsr        Auo_boxed
[00013cd4] 206f 000e                 movea.l    14(a7),a0
[00013cd8] 2f68 0046 0012            move.l     70(a0),18(a7)
[00013cde] 2f2f 0002                 move.l     2(a7),-(a7)
[00013ce2] 7019                      moveq.l    #25,d0
[00013ce4] 226f 0016                 movea.l    22(a7),a1
[00013ce8] 206f 001a                 movea.l    26(a7),a0
[00013cec] 6100 ea22                 bsr        add_fkt
[00013cf0] 584f                      addq.w     #4,a7
[00013cf2] 226f 000e                 movea.l    14(a7),a1
[00013cf6] 2348 0046                 move.l     a0,70(a1)
[00013cfa] 43ef 0002                 lea.l      2(a7),a1
[00013cfe] 7003                      moveq.l    #3,d0
[00013d00] 206f 0006                 movea.l    6(a7),a0
[00013d04] 41e8 02d0                 lea.l      720(a0),a0
[00013d08] 4eb9 0006 a068            jsr        Auo_boxed
[00013d0e] 206f 000e                 movea.l    14(a7),a0
[00013d12] 2f68 004a 0012            move.l     74(a0),18(a7)
[00013d18] 2f2f 0002                 move.l     2(a7),-(a7)
[00013d1c] 701a                      moveq.l    #26,d0
[00013d1e] 226f 0016                 movea.l    22(a7),a1
[00013d22] 206f 001a                 movea.l    26(a7),a0
[00013d26] 6100 e9e8                 bsr        add_fkt
[00013d2a] 584f                      addq.w     #4,a7
[00013d2c] 226f 000e                 movea.l    14(a7),a1
[00013d30] 2348 004a                 move.l     a0,74(a1)
[00013d34] 206f 000a                 movea.l    10(a7),a0
[00013d38] 4868 000a                 pea.l      10(a0)
[00013d3c] 43f9 0008 afa2            lea.l      $0008AFA2,a1
[00013d42] 7056                      moveq.l    #86,d0
[00013d44] 206f 000a                 movea.l    10(a7),a0
[00013d48] 4eb9 0005 10fe            jsr        Aob_scanf
[00013d4e] 584f                      addq.w     #4,a7
[00013d50] 206f 000a                 movea.l    10(a7),a0
[00013d54] 4868 000c                 pea.l      12(a0)
[00013d58] 43f9 0008 afa6            lea.l      $0008AFA6,a1
[00013d5e] 7058                      moveq.l    #88,d0
[00013d60] 206f 000a                 movea.l    10(a7),a0
[00013d64] 4eb9 0005 10fe            jsr        Aob_scanf
[00013d6a] 584f                      addq.w     #4,a7
[00013d6c] 226f 000e                 movea.l    14(a7),a1
[00013d70] 43e9 0040                 lea.l      64(a1),a1
[00013d74] 303c 0192                 move.w     #$0192,d0
[00013d78] 206f 0006                 movea.l    6(a7),a0
[00013d7c] 41e8 0318                 lea.l      792(a0),a0
[00013d80] 4eb9 0006 7456            jsr        Auo_cycle
[00013d86] 206f 0016                 movea.l    22(a7),a0
[00013d8a] 2068 0034                 movea.l    52(a0),a0
[00013d8e] 2028 0012                 move.l     18(a0),d0
[00013d92] 6712                      beq.s      edmm_getval_7
[00013d94] 206f 0016                 movea.l    22(a7),a0
[00013d98] 2068 0034                 movea.l    52(a0),a0
[00013d9c] 2068 0012                 movea.l    18(a0),a0
[00013da0] 0068 0020 0056            ori.w      #$0020,86(a0)
edmm_getval_7:
[00013da6] 206f 0016                 movea.l    22(a7),a0
[00013daa] 2068 0024                 movea.l    36(a0),a0
[00013dae] 2028 0012                 move.l     18(a0),d0
[00013db2] 6712                      beq.s      edmm_getval_8
[00013db4] 206f 0016                 movea.l    22(a7),a0
[00013db8] 2068 0024                 movea.l    36(a0),a0
[00013dbc] 2068 0012                 movea.l    18(a0),a0
[00013dc0] 0068 0020 0056            ori.w      #$0020,86(a0)
edmm_getval_8:
[00013dc6] 7001                      moveq.l    #1,d0
edmm_getval_6:
[00013dc8] 4fef 001e                 lea.l      30(a7),a7
[00013dcc] 4e75                      rts

edmm_create:
[00013dce] 2f0a                      move.l     a2,-(a7)
[00013dd0] 4fef fff4                 lea.l      -12(a7),a7
[00013dd4] 2f48 0008                 move.l     a0,8(a7)
[00013dd8] 2f6f 0008 0004            move.l     8(a7),4(a7)
[00013dde] 206f 0004                 movea.l    4(a7),a0
[00013de2] 2028 0210                 move.l     528(a0),d0
[00013de6] 6718                      beq.s      edmm_create_1
[00013de8] 206f 0004                 movea.l    4(a7),a0
[00013dec] 2068 0210                 movea.l    528(a0),a0
[00013df0] 4eb9 0005 6bea            jsr        Awi_show
[00013df6] 206f 0004                 movea.l    4(a7),a0
[00013dfa] 2068 0210                 movea.l    528(a0),a0
[00013dfe] 6052                      bra.s      edmm_create_2
edmm_create_1:
[00013e00] 41f9 0008 ae60            lea.l      WI_MAINMOD,a0
[00013e06] 4eb9 0005 7052            jsr        Awi_create
[00013e0c] 2e88                      move.l     a0,(a7)
[00013e0e] 2017                      move.l     (a7),d0
[00013e10] 6604                      bne.s      edmm_create_3
[00013e12] 91c8                      suba.l     a0,a0
[00013e14] 603c                      bra.s      edmm_create_2
edmm_create_3:
[00013e16] 2057                      movea.l    (a7),a0
[00013e18] 20af 0004                 move.l     4(a7),(a0)
[00013e1c] 206f 0004                 movea.l    4(a7),a0
[00013e20] 2157 0210                 move.l     (a7),528(a0)
[00013e24] 2057                      movea.l    (a7),a0
[00013e26] 6100 f4b6                 bsr        edmm_setval
[00013e2a] 2057                      movea.l    (a7),a0
[00013e2c] 6100 ef90                 bsr        edmm_enable
[00013e30] 2057                      movea.l    (a7),a0
[00013e32] 2257                      movea.l    (a7),a1
[00013e34] 2269 000c                 movea.l    12(a1),a1
[00013e38] 4e91                      jsr        (a1)
[00013e3a] 4a40                      tst.w      d0
[00013e3c] 6712                      beq.s      edmm_create_4
[00013e3e] 93c9                      suba.l     a1,a1
[00013e40] 7002                      moveq.l    #2,d0
[00013e42] 2057                      movea.l    (a7),a0
[00013e44] 2457                      movea.l    (a7),a2
[00013e46] 246a 0004                 movea.l    4(a2),a2
[00013e4a] 4e92                      jsr        (a2)
[00013e4c] 91c8                      suba.l     a0,a0
[00013e4e] 6002                      bra.s      edmm_create_2
edmm_create_4:
[00013e50] 2057                      movea.l    (a7),a0
edmm_create_2:
[00013e52] 4fef 000c                 lea.l      12(a7),a7
[00013e56] 245f                      movea.l    (a7)+,a2
[00013e58] 4e75                      rts

edmm_service:
[00013e5a] 4fef fff2                 lea.l      -14(a7),a7
[00013e5e] 2f48 000a                 move.l     a0,10(a7)
[00013e62] 3f40 0008                 move.w     d0,8(a7)
[00013e66] 2f49 0004                 move.l     a1,4(a7)
[00013e6a] 206f 000a                 movea.l    10(a7),a0
[00013e6e] 2e90                      move.l     (a0),(a7)
[00013e70] 302f 0008                 move.w     8(a7),d0
[00013e74] 5540                      subq.w     #2,d0
[00013e76] 6708                      beq.s      edmm_service_1
[00013e78] 907c 000d                 sub.w      #$000D,d0
[00013e7c] 672c                      beq.s      edmm_service_2
[00013e7e] 602c                      bra.s      edmm_service_3
edmm_service_1:
[00013e80] 206f 000a                 movea.l    10(a7),a0
[00013e84] 3028 0056                 move.w     86(a0),d0
[00013e88] c07c 0200                 and.w      #$0200,d0
[00013e8c] 661a                      bne.s      edmm_service_4
[00013e8e] 206f 000a                 movea.l    10(a7),a0
[00013e92] 0068 0200 0056            ori.w      #$0200,86(a0)
[00013e98] 2057                      movea.l    (a7),a0
[00013e9a] 42a8 0210                 clr.l      528(a0)
[00013e9e] 206f 000a                 movea.l    10(a7),a0
[00013ea2] 4eb9 0005 85f2            jsr        Awi_delete
edmm_service_4:
[00013ea8] 6016                      bra.s      edmm_service_5
edmm_service_2:
[00013eaa] 6014                      bra.s      edmm_service_5
edmm_service_3:
[00013eac] 226f 0004                 movea.l    4(a7),a1
[00013eb0] 302f 0008                 move.w     8(a7),d0
[00013eb4] 206f 000a                 movea.l    10(a7),a0
[00013eb8] 4eb9 0005 9dd0            jsr        Awi_service
[00013ebe] 6002                      bra.s      edmm_service_6
edmm_service_5:
[00013ec0] 7001                      moveq.l    #1,d0
edmm_service_6:
[00013ec2] 4fef 000e                 lea.l      14(a7),a7
[00013ec6] 4e75                      rts

edmm_ismain:
[00013ec8] 4eb9 0005 0c80            jsr        Aev_release
[00013ece] 2079 0010 ee4e            movea.l    ACSblk,a0
[00013ed4] 2068 0258                 movea.l    600(a0),a0
[00013ed8] 6100 eee4                 bsr        edmm_enable
[00013edc] 4e75                      rts

edmm_init_olga:
[00013ede] 514f                      subq.w     #8,a7
[00013ee0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00013ee6] 2068 0258                 movea.l    600(a0),a0
[00013eea] 2f68 0014 0004            move.l     20(a0),4(a7)
[00013ef0] 7001                      moveq.l    #1,d0
[00013ef2] 206f 0004                 movea.l    4(a7),a0
[00013ef6] c068 0022                 and.w      34(a0),d0
[00013efa] 3f40 0002                 move.w     d0,2(a7)
[00013efe] 7001                      moveq.l    #1,d0
[00013f00] 206f 0004                 movea.l    4(a7),a0
[00013f04] c068 006a                 and.w      106(a0),d0
[00013f08] 3e80                      move.w     d0,(a7)
[00013f0a] 4eb9 0005 0c80            jsr        Aev_release
[00013f10] 302f 0002                 move.w     2(a7),d0
[00013f14] 6704                      beq.s      edmm_init_olga_1
[00013f16] 3017                      move.w     (a7),d0
[00013f18] 6604                      bne.s      edmm_init_olga_2
edmm_init_olga_1:
[00013f1a] 7401                      moveq.l    #1,d2
[00013f1c] 6002                      bra.s      edmm_init_olga_3
edmm_init_olga_2:
[00013f1e] 4242                      clr.w      d2
edmm_init_olga_3:
[00013f20] 7208                      moveq.l    #8,d1
[00013f22] 700a                      moveq.l    #10,d0
[00013f24] 2079 0010 ee4e            movea.l    ACSblk,a0
[00013f2a] 2068 0258                 movea.l    600(a0),a0
[00013f2e] 4eb9 0005 484e            jsr        Aob_state
[00013f34] 504f                      addq.w     #8,a7
[00013f36] 4e75                      rts

edmm_ok:
[00013f38] 2f0a                      move.l     a2,-(a7)
[00013f3a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00013f40] 2068 0258                 movea.l    600(a0),a0
[00013f44] 6100 f85a                 bsr        edmm_getval
[00013f48] 4a40                      tst.w      d0
[00013f4a] 671e                      beq.s      edmm_ok_1
[00013f4c] 93c9                      suba.l     a1,a1
[00013f4e] 7002                      moveq.l    #2,d0
[00013f50] 2079 0010 ee4e            movea.l    ACSblk,a0
[00013f56] 2068 0258                 movea.l    600(a0),a0
[00013f5a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00013f60] 246a 0258                 movea.l    600(a2),a2
[00013f64] 246a 0004                 movea.l    4(a2),a2
[00013f68] 4e92                      jsr        (a2)
edmm_ok_1:
[00013f6a] 245f                      movea.l    (a7)+,a2
[00013f6c] 4e75                      rts

edmm_cancel:
[00013f6e] 2f0a                      move.l     a2,-(a7)
[00013f70] 93c9                      suba.l     a1,a1
[00013f72] 7002                      moveq.l    #2,d0
[00013f74] 2079 0010 ee4e            movea.l    ACSblk,a0
[00013f7a] 2068 0258                 movea.l    600(a0),a0
[00013f7e] 2479 0010 ee4e            movea.l    ACSblk,a2
[00013f84] 246a 0258                 movea.l    600(a2),a2
[00013f88] 246a 0004                 movea.l    4(a2),a2
[00013f8c] 4e92                      jsr        (a2)
[00013f8e] 245f                      movea.l    (a7)+,a2
[00013f90] 4e75                      rts

	.data

A_DELMESS:
[0008759e]                           dc.b '[2][ Sollen die Applikations-| Meldungen gel”scht werden, | die als Hauptmodul gltig| waren?][ Ja | Nein | Abbruch ]',0
_A_COLREZ:
[00087614]                           dc.b '[1][ Die Anzahl der momentan| darstellbaren Farben oder| die aktuelle Bildaufl”sung | ist nicht korrekt!][ Abbruch ]',0
_A_CREATE_IO:
[00087689]                           dc.b '[1][ Eine Datei liež sich | nicht erzeugen!][ Abbruch ]',0
_A_CREATE_STR:
[000876c1]                           dc.b '[3][ Die Datei '%s'| l„žt sich nicht erzeugen! ][ Abbruch ]',0
_A_DEFECTIVE_MEM:
[000876fd]                           dc.b '[1][ Auf fremden Speicher | wurde zugegriffen!][ Abbruch ]',0
_A_ERR_ACC:
[00087738]                           dc.b '[2][ | Soll das Accessory | >>               << | gestartet werden?| ][Ja|  Nein  ]',0
_A_ERR_MESS:
[0008778c]                           dc.b '[2][ Unbekannte GEM-Nachricht | erhalten.| ID = '%s'| Weiterhin berichten?][Ja|  Nein  ]',0
_A_ERR_WINDOW:
[000877e5]                           dc.b '[3][ Keine freie GEM-Fenster-ID | mehr vorhanden!| Abhilfe: Ein offenes| GEM-Fenster schliežen.][    OK    ]',0
_A_ERR_WISLOT:
[00087852]                           dc.b '[3][ Kein freier ACS-Fenster- | Platz mehr vorhanden!| Abhilfe: Ein ACS-Fenster| l”schen.][    OK    ]',0
_A_GENERAL:
[000878b9]                           dc.b '[3][ Es ist ein allgemeiner | Fehler aufgetreten! ][ Abbruch ]',0
_A_GENERAL_STR:
[000878f8]                           dc.b '[1][ Ein Fehler ist aufgetreten! | %s][ Abbruch ]',0
_A_GEN_IO:
[0008792a]                           dc.b '[1][ Es ist ein Fehler bei der | Ein-/Ausgabe aufgetreten!][ Abbruch ]',0
_A_GEN_MEM:
[00087971]                           dc.b '[1][ Es ist ein Fehler in| der Speicherverwaltung | aufgetreten!][ Abbruch ]',0
_A_GEN_MOD:
[000879be]                           dc.b '[1][ Das Modul konnte nicht | geladen werden!][ Abbruch ]',0
_A_GEN_MOD_STR:
[000879f8]                           dc.b '[1][ Das Modul '%s' | konnte nicht geladen werden! ][ Abbruch ]',0
_A_LOAD_MOD:
[00087a38]                           dc.b '[1][ Beim Laden des Moduls | (mit Pexec-3) ist ein| Fehler aufgetreten!][ Abbruch ]',0
_A_LOAD_MOD_STR:
[00087a8c]                           dc.b '[1][ Beim Laden des Moduls | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]',0
_A_MEM_MOD:
[00087ad8]                           dc.b '[1][ Der dem Modul folgende| Restspeicher kann nicht | freigegeben werden!][ Abbruch ]',0
_A_MEM_MOD_STR:
[00087b2f]                           dc.b '[1][ Der dem Modul '%s' | folgenden Restspeicher kann | nicht freigegeben werden!][ Abbruch ]',0
_A_ODD_MEM:
[00087b8d]                           dc.b '[1][ Die Adresse eines Speicher- | blocks ist ungerade!][ Abbruch ]',0
_A_OPEN_IO:
[00087bd1]                           dc.b '[1][ Eine Datei liež sich| nicht korrekt ”ffnen! ][ Abbruch ]',0
_A_OPEN_STR:
[00087c0f]                           dc.b '[1][ Die Datei '%s' | l„žt sich nicht ”ffnen!][ Abbruch ]',0
_A_OUT_OF_MEM:
[00087c49]                           dc.b '[1][ Es steht nicht gengend | Speicher zur Verfgung!][ Abbruch ]',0
_A_PORT:
[00087c8c]                           dc.b '[1][ Ein Fehler trat auf einem| Ein-/Ausgabekanal auf!][ Abbruch ]',0
_A_RANGE_MEM:
[00087ccf]                           dc.b '[1][ Ein Speicherblock| befindet sich aužerhalb | der legalen Bereiche!][ Abbruch ]',0
_A_READ_IO:
[00087d23]                           dc.b '[1][ Beim Lesen aus einer Datei| ist ein Fehler aufgetreten! ][ Abbruch ]',0
_A_READ_STR:
[00087d6d]                           dc.b '[1][ Beim Lesen aus der Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]',0
_A_VER_MOD:
[00087dbc]                           dc.b '[1][ Das Modul hat leider eine | falsche Versionsnummer!][ Abbruch ]',0
_A_VER_MOD_STR:
[00087e01]                           dc.b '[1][Das Modul|'%s'|hat eine falsche|Versionsnummer!][ Abbruch ]',0
_A_WRITE_IO:
[00087e41]                           dc.b '[1][ Beim Schreiben in eine Datei | ist ein Fehler aufgetreten!][ Abbruch ]',0
_A_WRITE_STR:
[00087e8d]                           dc.b '[1][ Beim Schreiben in die Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]',0
BUBBLE_01:
[00087edf]                           dc.b 'Die Žnderungen werden bernommen und berschreiben die alten Einstellungen.',0
BUBBLE_02:
[00087f2b]                           dc.b 'Die Žnderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
[00087f76]                           dc.b 'Hier kann das Modul als Hauptmodul bestimmt werden. Jede ACS-Anwendung ben”tigt mindestens ein Hauptmodul, ACS-Module drfen keines besitzen.',0
BUBBLE_04:
[00088004]                           dc.b 'Hier wird angegeben, ob das OLGA-Protokoll beim Start initialisiert werden soll. Ggf. wird versucht, den OLGA-Manager nachzustarten.',0
BUBBLE_05:
[00088089]                           dc.b 'Hier wird angegeben, ob beim Nachstarten des OLGA-Managers gewartet werden soll, bis er l„uft. Der Start der Anwendung wird dadurch z.T. drastisch verz”gert.',0
BUBBLE_06:
[00088127]                           dc.b 'Hier wird angegeben, ob das GEMScript-Protokoll initialisiert werden soll.',0
BUBBLE_07:
[00088172]                           dc.b 'Hier wird angegeben, ob BubbleGEM initialisiert werden soll. Ggf. wird BubbleGEM nachgestartet.',0
BUBBLE_08:
[000881d2]                           dc.b 'Hier wird angegeben, ob die Anwendung im 3D-Modus laufen soll oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_09:
[00088259]                           dc.b 'Hier wird angegeben, ob modale (Fenster-)Dialoge zentriert werden sollen oder an der Maus-Position erscheinen sollen. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_10:
[0008830c]                           dc.b 'Hier wird angegeben, ob Fehler akustisch signalisiert werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_11:
[00088399]                           dc.b 'Hier wird angegeben, ob beim Start GDOS-Fonts geladen werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_12:
[00088426]                           dc.b 'Hier wird angegeben, ob bei Tastendrcken erst das Hauptmen und dann der Fenster-Dialog bercksichtigt wird oder andersherum. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_13:
[000884e2]                           dc.b 'Hier wird angegeben, ob bei Tastendrcken der Maus-Zeiger versteckt werden sollen nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_14:
[00088578]                           dc.b 'Hier wird angegeben, ob sich Fenstermens erst nach einem Maus-Klick oder bereits beim Berhren mit dem Maus-Zeiger ”ffnen. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_15:
[00088631]                           dc.b 'Importierte Texte werden in ACS neu angelegt, wenn sie nicht vorhanden sind.',0
BUBBLE_16:
[0008867e]                           dc.b 'Hier wird der XAcc-Typ der Anwendung angegeben. Genauere Informationen ber den Typ finden Sie in der XAcc-Dokumentation.',0
BUBBLE_17:
[000886f8]                           dc.b 'Hier wird angegeben, ob optische Rckmeldungen (wachsende Rechtecke, Meldung beim Ende von TOS-Programmen) verwendet werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_18:
[000887c4]                           dc.b 'Hier wird angegeben, ob allozierte und freigegebene Speicherbl”cke geprft werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_19:
[00088866]                           dc.b 'Hier wird angegeben, ob Sicherheitsprfungen (wie z.B. vor Dsetdrv/Dsetpath) durchgefhrt werden sollen oder nicht. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_20:
[00088917]                           dc.b 'Hier k”nnen Sie in Zukunft angeben, fr welche Zielplattform Code erzeugt werden soll. Noch hat diese Einstellung keinen Effekt!',0
BUBBLE_21:
[00088998]                           dc.b 'Hier stellen Sie die Programmiersprache ein, die fr dieses ACS-Modul verwendet werden soll.',0
BUBBLE_22:
[000889f5]                           dc.b 'Hier geben Sie an, welche Oberfl„chensprache aktiviert und ausgegeben werden soll.',0
BUBBLE_23:
[00088a48]                           dc.b 'Sie k”nnen bei jedem Sichern automatisch ein Backup der alten Datei anlegen lassen. Hier schalten Sie dieses ein. Geben Sie bitte auch den Pfad des Backups an!',0
BUBBLE_24:
[00088ae8]                           dc.b 'Hier geben Sie bitte den Pfad an, in dem das Backup gemacht werden soll.',0
BUBBLE_25:
[00088b31]                           dc.b 'Alle Objektnamen werden automatisch in Grožbuchstaben gewandelt.',0
BUBBLE_26:
[00088b72]                           dc.b 'Hier wird eingestellt, ob die Prototypen fr den Compiler mit exportiert werden sollen.',0
BUBBLE_27:
[00088bca]                           dc.b 'Alle nicht-globalen Definitionen werden als modul-lokal exportiert. Damit k”nnen sich gleiche Bezeichner in verschiedenen Modulen nicht berschneiden.',0
BUBBLE_28:
[00088c61]                           dc.b 'Es wird automatisch eine Liste der Definitionen und Bezeichner erstellt.',0
BUBBLE_29:
[00088caa]                           dc.b 'Hier schalten Sie die Ausgabe fr den im Popup ausgew„hlten Compiler ein.',0
BUBBLE_30:
[00088cf4]                           dc.b 'Hier wird der Name der entsprechenden Funktion eingetragen.',0
BUBBLE_31:
[00088d30]                           dc.b 'Hier wird definiert, welchen Abstand Fenster vom Bildschirmrand haben sollen.',0
BUBBLE_32:
[00088d7e]                           dc.b 'Hier schalten Sie die Verwendung von modernen 3D-Mens ein und aus. Die Einstellung kann jederzeit zur Laufzeit ge„ndert werden.',0
BUBBLE_33:
[00088dff]                           dc.b 'Die Texte der ausgew„hlten Sprache werden trotz Auslagerung der Texte in die Anwendung als Default-Texte integriert.',0
BUBBLE_34:
[00088e74]                           dc.b 'Alle Texte werden in eine ASCII-Datei ausgelagert. Diese kann gegen die einer anderen Sprache ausgetauscht werden. Das Zusammenbinden der ASCII-Dateien zur globalen ASCII-Datei der Anwendung muž getrennt erfolgen.',0
HELPFILE_01:
[00088f4a]                           dc.b 'ACSPRO',0
STGUIDE_01:
[00088f51]                           dc.b 'Der Hauptmodul-Dialog',0
STGUIDE_02:
[00088f67]                           dc.b 'Der Eigenschaften-Dialog',0
TEXT_002:
[00088f80]                           dc.w $004f
[00088f82]                           dc.w $4b00
TEXT_004:
[00088f84]                           dc.b 'Abbrechen',0
TEXT_009:
[00088f8e]                           dc.b 'Lade GDOS-Fonts',0
TEXT_01:
[00088f9e]                           dc.b 'Sprache, Texte',0
TEXT_012:
[00088fad]                           dc.b 'dy:',0
TEXT_014:
[00088fb1]                           dc.b 'dx:',0
TEXT_018:
[00088fb5]                           dc.b 'Definitionen als 'lokal'',0
TEXT_02:
[00088fce]                           dc.b 'Ausgabe:',0
TEXT_03:
[00088fd7]                           dc.b 'Taste zuerst Mens',0
TEXT_04:
[00088fea]                           dc.b 'Verhalten',0
TEXT_05:
[00088ff4]                           dc.b 'Optionen',0
TEXT_06:
[00088ffd]                           dc.b 'Plattform & Entwicklungsumgebung',0
TEXT_07:
[0008901e]                           dc.b 'Rahmen',0
TEXT_08:
[00089025]                           dc.b ' Pure-C / GNU-C | Pure-Pascal ',0
TEXT_09:
[00089044]                           dc.b 'ACS-Ausgabe',0
TEXT_10:
[00089050]                           dc.b ' Eigenschaften ',0
TEXT_11:
[00089060]                           dc.b ' 1. Sprache (D)| 2. Sprache (E)| 3. Sprache    | 4. Sprache',0
TEXT_110:
[0008909c]                           dc.b 'Sprache',0
TEXT_111:
[000890a4]                           dc.b 'Oberfl„che:',0
TEXT_112:
[000890b0]                           dc.b 'Texte',0
TEXT_118:
[000890b6]                           dc.b 'Pulldown Mens',0
TEXT_12:
[000890c5]                           dc.b 'Importieren',0
TEXT_13:
[000890d1]                           dc.b 'Namen',0
TEXT_14:
[000890d7]                           dc.b 'Verstecke Maus',0
TEXT_15:
[000890e6]                           dc.b 'Liste der Definitionen',0
TEXT_16:
[000890fd]                           dc.b 'BackUp anlegen',0
TEXT_17:
[0008910c]                           dc.b ' Atari ST | Macintosh | Windows | Linux ',0
TEXT_18:
[00089135]                           dc.b 'Plattform',0
TEXT_19:
[0008913f]                           dc.b ' Hauptmodul-Eigenschaften ',0
TEXT_20:
[0008915a]                           dc.b 'Import-Texte ggf. neu anlegen',0
TEXT_21:
[00089178]                           dc.b 'ACC-Fenster:',0
TEXT_22:
[00089185]                           dc.b 'ACC-Eintrag:',0
TEXT_23:
[00089192]                           dc.w $4f4b
[00089194]                           dc.w $0041
[00089196]                           dc.b 'bbrechen',0
TEXT_25:
[0008919f]                           dc.b 'Initialisierungs-Funktionen & -Daten',0
TEXT_26:
[000891c4]                           dc.b 'Modul ist Hauptmodul',0
TEXT_263:
[000891d9]                           dc.b 'Zentriere Dialog',0
TEXT_27:
[000891ea]                           dc.b 'ACSinit0',0
TEXT_28:
[000891f3]                           dc.b 'ACSinit',0
TEXT_29:
[000891fb]                           dc.b 'ACSterm',0
TEXT_30:
[00089203]                           dc.b 'ACSaboutme',0
TEXT_31:
[0008920e]                           dc.b 'ACSclose',0
TEXT_32:
[00089217]                           dc.b 'ACSmessage',0
TEXT_33:
[00089222]                           dc.b 'ACSmproto',0
TEXT_331:
[0008922c]                           dc.b 'VERHALTEN',0
TEXT_34:
[00089236]                           dc.b 'ACStimer',0
TEXT_345:
[0008923f]                           dc.b 'abc = ABC',0
TEXT_347:
[00089249]                           dc.b 'Prototypen',0
TEXT_35:
[00089254]                           dc.b 'ACSkey',0
TEXT_350:
[0008925b]                           dc.b 'Fehler akustisch',0
TEXT_36:
[0008926c]                           dc.b 'ACSbutton',0
TEXT_37:
[00089276]                           dc.b 'ACSmouse',0
TEXT_38:
[0008927f]                           dc.b 'ACSwikey',0
TEXT_39:
[00089288]                           dc.b 'ACSGEMScript',0
TEXT_40:
[00089295]                           dc.b 'Protokollierungs-Funktionen',0
TEXT_41:
[000892b1]                           dc.b 'Kommunikations-Protokolle',0
TEXT_42:
[000892cb]                           dc.b '3D-Darstellung',0
TEXT_43:
[000892da]                           dc.b 'Sonstige Funktionen',0
TEXT_44:
[000892ee]                           dc.b 'XAcc-Typ',0
TEXT_45:
[000892f7]                           dc.b '      keine | WP - Textverarbeitung | DP - DTP | ED - Editor | DB - Datenbank | SS - Tabellenkalkulation | RG - Pixelgraphik | VG - Vektorgraphik | GG - Graphik | MU - Musik | CD - CAD | DC - Kommunikation | DT - Desktop | PE - Programmierumgebung',0
TEXT_46:
[000893ef]                           dc.b 'Initialisierung',0
TEXT_47:
[000893ff]                           dc.b 'OLGA',0
TEXT_48:
[00089404]                           dc.b 'warten',0
TEXT_49:
[0008940b]                           dc.b 'GEMScript',0
TEXT_50:
[00089415]                           dc.b 'BubbleGEM',0
TEXT_51:
[0008941f]                           dc.b 'Optisches Feedback',0
TEXT_52:
[00089432]                           dc.b 'Speichertest',0
TEXT_53:
[0008943f]                           dc.b 'Sicherheitschecks',0
TEXT_54:
[00089451]                           dc.b 'Moderne 3D-Mens',0
TEXT_55:
[00089462]                           dc.b 'Texte aus Anwendung auslagern',0
TEXT_56:
[00089480]                           dc.b 'Default-Texte behalten',0
_AL_ATT:
[00089497]                           dc.b ' Achtung ',0
_AL_QUEST:
[000894a1]                           dc.b ' Frage ',0
_AL_STOP:
[000894a9]                           dc.b ' Stop ',0
_AL_TIMER:
[000894b0]                           dc.b ' Meldung ',0
DATAS_07:
[000894ba]                           dc.w $0000
[000894bc]                           dc.w $0000
[000894be]                           dc.w $02c0
[000894c0]                           dc.w $0000
[000894c2]                           dc.w $0000
[000894c4]                           dc.w $0000
[000894c6]                           dc.w $07ff
[000894c8]                           dc.w $ffff
[000894ca]                           dc.w $ffe0
[000894cc]                           dc.w $0400
[000894ce]                           dc.w $0000
[000894d0]                           dc.w $0020
[000894d2]                           dc.w $0400
[000894d4]                           dc.w $0000
[000894d6]                           dc.w $0020
[000894d8]                           dc.w $0401
[000894da]                           dc.w $e007
[000894dc]                           dc.w $8020
[000894de]                           dc.w $0407
[000894e0]                           dc.w $f81f
[000894e2]                           dc.w $e020
[000894e4]                           dc.w $040f
[000894e6]                           dc.w $fc3f
[000894e8]                           dc.w $f020
[000894ea]                           dc.w $040e
[000894ec]                           dc.w $1c38
[000894ee]                           dc.w $f020
[000894f0]                           dc.w $041c
[000894f2]                           dc.w $ce7b
[000894f4]                           dc.w $7820
[000894f6]                           dc.w $041d
[000894f8]                           dc.w $fe7b
[000894fa]                           dc.w $7820
[000894fc]                           dc.w $041d
[000894fe]                           dc.w $fe78
[00089500]                           dc.w $f820
[00089502]                           dc.w $041c
[00089504]                           dc.w $ce7b
[00089506]                           dc.w $7820
[00089508]                           dc.w $040e
[0008950a]                           dc.w $1c3b
[0008950c]                           dc.w $7020
[0008950e]                           dc.w $040f
[00089510]                           dc.w $fc3f
[00089512]                           dc.w $f020
[00089514]                           dc.w $0407
[00089516]                           dc.w $f81f
[00089518]                           dc.w $e020
[0008951a]                           dc.w $0401
[0008951c]                           dc.w $e007
[0008951e]                           dc.w $8020
[00089520]                           dc.w $0400
[00089522]                           dc.w $0000
[00089524]                           dc.w $0020
[00089526]                           dc.w $0400
[00089528]                           dc.w $0000
[0008952a]                           dc.w $0020
[0008952c]                           dc.w $0491
[0008952e]                           dc.w $2244
[00089530]                           dc.w $8920
[00089532]                           dc.w $0460
[00089534]                           dc.w $c183
[00089536]                           dc.w $1fa0
[00089538]                           dc.w $0463
[0008953a]                           dc.w $f183
[0008953c]                           dc.w $1fa0
[0008953e]                           dc.w $0463
[00089540]                           dc.w $f7e3
[00089542]                           dc.w $0620
[00089544]                           dc.w $0460
[00089546]                           dc.w $c7e3
[00089548]                           dc.w $0620
[0008954a]                           dc.w $05f8
[0008954c]                           dc.w $c18f
[0008954e]                           dc.w $c620
[00089550]                           dc.w $05f8
[00089552]                           dc.w $c18f
[00089554]                           dc.w $c620
[00089556]                           dc.w $0491
[00089558]                           dc.w $2244
[0008955a]                           dc.w $8920
[0008955c]                           dc.w $0400
[0008955e]                           dc.w $0000
[00089560]                           dc.w $0020
[00089562]                           dc.w $07ff
[00089564]                           dc.w $ffff
[00089566]                           dc.w $ffe0
[00089568]                           dc.w $0000
[0008956a]                           dc.w $0000
[0008956c]                           dc.w $0000
[0008956e]                           dc.w $0000
[00089570]                           dc.w $0000
[00089572]                           dc.w $0000
[00089574]                           dc.w $07ff
[00089576]                           dc.w $ffff
[00089578]                           dc.w $ffe0
[0008957a]                           dc.w $0400
[0008957c]                           dc.w $0000
[0008957e]                           dc.w $0020
[00089580]                           dc.w $0400
[00089582]                           dc.w $0000
[00089584]                           dc.w $0020
[00089586]                           dc.w $0401
[00089588]                           dc.w $e007
[0008958a]                           dc.w $8020
[0008958c]                           dc.w $0407
[0008958e]                           dc.w $f81f
[00089590]                           dc.w $e020
[00089592]                           dc.w $040f
[00089594]                           dc.w $fc3f
[00089596]                           dc.w $f020
[00089598]                           dc.w $040e
[0008959a]                           dc.w $1c38
[0008959c]                           dc.w $f020
[0008959e]                           dc.w $041c
[000895a0]                           dc.w $ce7b
[000895a2]                           dc.w $7820
[000895a4]                           dc.w $041d
[000895a6]                           dc.w $fe7b
[000895a8]                           dc.w $7820
[000895aa]                           dc.w $041d
[000895ac]                           dc.w $fe78
[000895ae]                           dc.w $f820
[000895b0]                           dc.w $041c
[000895b2]                           dc.w $ce7b
[000895b4]                           dc.w $7820
[000895b6]                           dc.w $040e
[000895b8]                           dc.w $1c3b
[000895ba]                           dc.w $7020
[000895bc]                           dc.w $040f
[000895be]                           dc.w $fc3f
[000895c0]                           dc.w $f020
[000895c2]                           dc.w $0407
[000895c4]                           dc.w $f81f
[000895c6]                           dc.w $e020
[000895c8]                           dc.w $0401
[000895ca]                           dc.w $e007
[000895cc]                           dc.w $8020
[000895ce]                           dc.w $0400
[000895d0]                           dc.w $0000
[000895d2]                           dc.w $0020
[000895d4]                           dc.w $0400
[000895d6]                           dc.w $0000
[000895d8]                           dc.w $0020
[000895da]                           dc.w $0491
[000895dc]                           dc.w $2244
[000895de]                           dc.w $8920
[000895e0]                           dc.w $0460
[000895e2]                           dc.w $c183
[000895e4]                           dc.w $0020
[000895e6]                           dc.w $0463
[000895e8]                           dc.w $3183
[000895ea]                           dc.w $0020
[000895ec]                           dc.w $0463
[000895ee]                           dc.w $3003
[000895f0]                           dc.w $0620
[000895f2]                           dc.w $0460
[000895f4]                           dc.w $c003
[000895f6]                           dc.w $0620
[000895f8]                           dc.w $0598
[000895fa]                           dc.w $c180
[000895fc]                           dc.w $0620
[000895fe]                           dc.w $0598
[00089600]                           dc.w $c180
[00089602]                           dc.w $0620
[00089604]                           dc.w $0491
[00089606]                           dc.w $2244
[00089608]                           dc.w $8920
[0008960a]                           dc.w $0400
[0008960c]                           dc.w $0000
[0008960e]                           dc.w $0020
[00089610]                           dc.w $07ff
[00089612]                           dc.w $ffff
[00089614]                           dc.w $ffe0
[00089616]                           dc.w $0000
[00089618]                           dc.w $0000
[0008961a]                           dc.w $0000
[0008961c]                           dc.w $0000
[0008961e]                           dc.w $0000
[00089620]                           dc.w $0000
[00089622]                           dc.w $07ff
[00089624]                           dc.w $ffff
[00089626]                           dc.w $ffe0
[00089628]                           dc.w $0400
[0008962a]                           dc.w $0000
[0008962c]                           dc.w $0020
[0008962e]                           dc.w $0400
[00089630]                           dc.w $0000
[00089632]                           dc.w $0020
[00089634]                           dc.w $0401
[00089636]                           dc.w $e007
[00089638]                           dc.w $8020
[0008963a]                           dc.w $0407
[0008963c]                           dc.w $f81f
[0008963e]                           dc.w $e020
[00089640]                           dc.w $040f
[00089642]                           dc.w $fc3f
[00089644]                           dc.w $f020
[00089646]                           dc.w $040f
[00089648]                           dc.w $fc3f
[0008964a]                           dc.w $f020
[0008964c]                           dc.w $041f
[0008964e]                           dc.w $fe7f
[00089650]                           dc.w $f820
[00089652]                           dc.w $041f
[00089654]                           dc.w $fe7f
[00089656]                           dc.w $f820
[00089658]                           dc.w $041f
[0008965a]                           dc.w $fe7f
[0008965c]                           dc.w $f820
[0008965e]                           dc.w $041f
[00089660]                           dc.w $fe7f
[00089662]                           dc.w $f820
[00089664]                           dc.w $040f
[00089666]                           dc.w $fc3f
[00089668]                           dc.w $f020
[0008966a]                           dc.w $040f
[0008966c]                           dc.w $fc3f
[0008966e]                           dc.w $f020
[00089670]                           dc.w $0407
[00089672]                           dc.w $f81f
[00089674]                           dc.w $e020
[00089676]                           dc.w $0401
[00089678]                           dc.w $e007
[0008967a]                           dc.w $8020
[0008967c]                           dc.w $0400
[0008967e]                           dc.w $0000
[00089680]                           dc.w $0020
[00089682]                           dc.w $0400
[00089684]                           dc.w $0000
[00089686]                           dc.w $0020
[00089688]                           dc.w $0491
[0008968a]                           dc.w $2244
[0008968c]                           dc.w $8920
[0008968e]                           dc.w $0460
[00089690]                           dc.w $c183
[00089692]                           dc.w $0020
[00089694]                           dc.w $0463
[00089696]                           dc.w $3183
[00089698]                           dc.w $0020
[0008969a]                           dc.w $0463
[0008969c]                           dc.w $3003
[0008969e]                           dc.w $0620
[000896a0]                           dc.w $0460
[000896a2]                           dc.w $c003
[000896a4]                           dc.w $0620
[000896a6]                           dc.w $0598
[000896a8]                           dc.w $c180
[000896aa]                           dc.w $0620
[000896ac]                           dc.w $0598
[000896ae]                           dc.w $c180
[000896b0]                           dc.w $0620
[000896b2]                           dc.w $0491
[000896b4]                           dc.w $2244
[000896b6]                           dc.w $8920
[000896b8]                           dc.w $0400
[000896ba]                           dc.w $0000
[000896bc]                           dc.w $0020
[000896be]                           dc.w $07ff
[000896c0]                           dc.w $ffff
[000896c2]                           dc.w $ffe0
[000896c4]                           dc.w $0000
[000896c6]                           dc.w $0000
[000896c8]                           dc.w $0000
[000896ca]                           dc.w $0000
[000896cc]                           dc.w $0000
[000896ce]                           dc.w $0000
[000896d0]                           dc.w $07ff
[000896d2]                           dc.w $ffff
[000896d4]                           dc.w $ffe0
[000896d6]                           dc.w $0400
[000896d8]                           dc.w $0000
[000896da]                           dc.w $0020
[000896dc]                           dc.w $0400
[000896de]                           dc.w $0000
[000896e0]                           dc.w $0020
[000896e2]                           dc.w $0401
[000896e4]                           dc.w $e007
[000896e6]                           dc.w $8020
[000896e8]                           dc.w $0406
[000896ea]                           dc.w $1818
[000896ec]                           dc.w $6020
[000896ee]                           dc.w $0408
[000896f0]                           dc.w $0420
[000896f2]                           dc.w $1020
[000896f4]                           dc.w $0408
[000896f6]                           dc.w $0420
[000896f8]                           dc.w $1020
[000896fa]                           dc.w $0410
[000896fc]                           dc.w $0240
[000896fe]                           dc.w $0820
[00089700]                           dc.w $0410
[00089702]                           dc.w $0240
[00089704]                           dc.w $0820
[00089706]                           dc.w $0410
[00089708]                           dc.w $0240
[0008970a]                           dc.w $0820
[0008970c]                           dc.w $0410
[0008970e]                           dc.w $0240
[00089710]                           dc.w $0820
[00089712]                           dc.w $0408
[00089714]                           dc.w $0420
[00089716]                           dc.w $1020
[00089718]                           dc.w $0408
[0008971a]                           dc.w $0420
[0008971c]                           dc.w $1020
[0008971e]                           dc.w $0406
[00089720]                           dc.w $1818
[00089722]                           dc.w $6020
[00089724]                           dc.w $0401
[00089726]                           dc.w $e007
[00089728]                           dc.w $8020
[0008972a]                           dc.w $0400
[0008972c]                           dc.w $0000
[0008972e]                           dc.w $0020
[00089730]                           dc.w $0400
[00089732]                           dc.w $0000
[00089734]                           dc.w $0020
[00089736]                           dc.w $0460
[00089738]                           dc.w $c183
[0008973a]                           dc.w $0620
[0008973c]                           dc.w $04f1
[0008973e]                           dc.w $e3c7
[00089740]                           dc.w $99a0
[00089742]                           dc.w $04f3
[00089744]                           dc.w $33c7
[00089746]                           dc.w $99a0
[00089748]                           dc.w $04f3
[0008974a]                           dc.w $3667
[0008974c]                           dc.w $8f20
[0008974e]                           dc.w $04f1
[00089750]                           dc.w $e667
[00089752]                           dc.w $8f20
[00089754]                           dc.w $0599
[00089756]                           dc.w $e3cc
[00089758]                           dc.w $cf20
[0008975a]                           dc.w $0599
[0008975c]                           dc.w $e3cc
[0008975e]                           dc.w $cf20
[00089760]                           dc.w $0460
[00089762]                           dc.w $c183
[00089764]                           dc.w $0620
[00089766]                           dc.w $0400
[00089768]                           dc.w $0000
[0008976a]                           dc.w $0020
[0008976c]                           dc.w $07ff
[0008976e]                           dc.w $ffff
[00089770]                           dc.w $ffe0
[00089772]                           dc.w $0000
[00089774]                           dc.w $0000
[00089776]                           dc.w $0000
DATAS_08:
[00089778]                           dc.w $0000
[0008977a]                           dc.w $0000
[0008977c]                           dc.w $0000
[0008977e]                           dc.w $07ff
[00089780]                           dc.w $ffff
[00089782]                           dc.w $ffe0
[00089784]                           dc.w $07ff
[00089786]                           dc.w $ffff
[00089788]                           dc.w $ffe0
[0008978a]                           dc.w $07ff
[0008978c]                           dc.w $ffff
[0008978e]                           dc.w $ffe0
[00089790]                           dc.w $07ff
[00089792]                           dc.w $ffff
[00089794]                           dc.w $ffe0
[00089796]                           dc.w $07ff
[00089798]                           dc.w $ffff
[0008979a]                           dc.w $ffe0
[0008979c]                           dc.w $07ff
[0008979e]                           dc.w $ffff
[000897a0]                           dc.w $ffe0
[000897a2]                           dc.w $07ff
[000897a4]                           dc.w $ffff
[000897a6]                           dc.w $ffe0
[000897a8]                           dc.w $07ff
[000897aa]                           dc.w $ffff
[000897ac]                           dc.w $ffe0
[000897ae]                           dc.w $07ff
[000897b0]                           dc.w $ffff
[000897b2]                           dc.w $ffe0
[000897b4]                           dc.w $07ff
[000897b6]                           dc.w $ffff
[000897b8]                           dc.w $ffe0
[000897ba]                           dc.w $07ff
[000897bc]                           dc.w $ffff
[000897be]                           dc.w $ffe0
[000897c0]                           dc.w $07ff
[000897c2]                           dc.w $ffff
[000897c4]                           dc.w $ffe0
[000897c6]                           dc.w $07ff
[000897c8]                           dc.w $ffff
[000897ca]                           dc.w $ffe0
[000897cc]                           dc.w $07ff
[000897ce]                           dc.w $ffff
[000897d0]                           dc.w $ffe0
[000897d2]                           dc.w $07ff
[000897d4]                           dc.w $ffff
[000897d6]                           dc.w $ffe0
[000897d8]                           dc.w $07ff
[000897da]                           dc.w $ffff
[000897dc]                           dc.w $ffe0
[000897de]                           dc.w $07ff
[000897e0]                           dc.w $ffff
[000897e2]                           dc.w $ffe0
[000897e4]                           dc.w $07ff
[000897e6]                           dc.w $ffff
[000897e8]                           dc.w $ffe0
[000897ea]                           dc.w $07ff
[000897ec]                           dc.w $ffff
[000897ee]                           dc.w $ffe0
[000897f0]                           dc.w $07ff
[000897f2]                           dc.w $ffff
[000897f4]                           dc.w $ffe0
[000897f6]                           dc.w $07ff
[000897f8]                           dc.w $ffff
[000897fa]                           dc.w $ffe0
[000897fc]                           dc.w $07ff
[000897fe]                           dc.w $ffff
[00089800]                           dc.w $ffe0
[00089802]                           dc.w $07ff
[00089804]                           dc.w $ffff
[00089806]                           dc.w $ffe0
[00089808]                           dc.w $07ff
[0008980a]                           dc.w $ffff
[0008980c]                           dc.w $ffe0
[0008980e]                           dc.w $07ff
[00089810]                           dc.w $ffff
[00089812]                           dc.w $ffe0
[00089814]                           dc.w $07ff
[00089816]                           dc.w $ffff
[00089818]                           dc.w $ffe0
[0008981a]                           dc.w $07ff
[0008981c]                           dc.w $ffff
[0008981e]                           dc.w $ffe0
[00089820]                           dc.w $0000
[00089822]                           dc.w $0000
[00089824]                           dc.w $0000
A_3DBUTTON01:
[00089826] 00064a22                  dc.l A_3Dbutton
[0008982a]                           dc.w $2011
[0008982c]                           dc.w $9178
[0008982e] 000630f2                  dc.l Auo_string
[00089832]                           dc.w $0000
[00089834]                           dc.w $0000
[00089836]                           dc.w $0000
[00089838]                           dc.w $0000
[0008983a]                           dc.w $0000
[0008983c]                           dc.w $0000
[0008983e]                           dc.w $0000
[00089840]                           dc.w $0000
[00089842]                           dc.w $0000
[00089844]                           dc.w $0000
A_3DBUTTON02:
[00089846] 00064a22                  dc.l A_3Dbutton
[0008984a]                           dc.w $29c1
[0008984c]                           dc.w $0178
[0008984e] 000630f2                  dc.l Auo_string
[00089852] 00088f81                  dc.l TEXT_003
[00089856]                           dc.w $0000
[00089858]                           dc.w $0000
[0008985a]                           dc.w $0000
[0008985c]                           dc.w $0000
[0008985e]                           dc.w $0000
[00089860]                           dc.w $0000
[00089862]                           dc.w $0000
[00089864]                           dc.w $0000
A_3DBUTTON03:
[00089866] 00064a22                  dc.l A_3Dbutton
[0008986a]                           dc.w $21f1
[0008986c]                           dc.w $0178
[0008986e] 000630f2                  dc.l Auo_string
[00089872]                           dc.w $0000
[00089874]                           dc.w $0000
[00089876]                           dc.w $0000
[00089878]                           dc.w $0000
[0008987a]                           dc.w $0000
[0008987c]                           dc.w $0000
[0008987e]                           dc.w $0000
[00089880]                           dc.w $0000
[00089882]                           dc.w $0000
[00089884]                           dc.w $0000
A_3DBUTTON04:
[00089886] 00064a22                  dc.l A_3Dbutton
[0008988a]                           dc.w $29f1
[0008988c]                           dc.w $0178
[0008988e] 000630f2                  dc.l Auo_string
[00089892] 000890c5                  dc.l TEXT_12
[00089896]                           dc.w $0000
[00089898]                           dc.w $0000
[0008989a]                           dc.w $0000
[0008989c]                           dc.w $0000
[0008989e]                           dc.w $0000
[000898a0]                           dc.w $0000
[000898a2]                           dc.w $0000
[000898a4]                           dc.w $0000
A_3DBUTTON05:
[000898a6] 00064a22                  dc.l A_3Dbutton
[000898aa]                           dc.w $29f1
[000898ac]                           dc.w $0178
[000898ae] 000630f2                  dc.l Auo_string
[000898b2]                           dc.w $0000
[000898b4]                           dc.w $0000
[000898b6]                           dc.w $0000
[000898b8]                           dc.w $0000
[000898ba]                           dc.w $0000
[000898bc]                           dc.w $0000
[000898be]                           dc.w $0000
[000898c0]                           dc.w $0000
[000898c2]                           dc.w $0000
[000898c4]                           dc.w $0000
A_3DBUTTON06:
[000898c6] 00064a22                  dc.l A_3Dbutton
[000898ca]                           dc.w $29c1
[000898cc]                           dc.w $0178
[000898ce] 000630f2                  dc.l Auo_string
[000898d2] 00088f84                  dc.l TEXT_004
[000898d6]                           dc.w $0000
[000898d8]                           dc.w $0000
[000898da]                           dc.w $0000
[000898dc]                           dc.w $0000
[000898de]                           dc.w $0000
[000898e0]                           dc.w $0000
[000898e2]                           dc.w $0000
[000898e4]                           dc.w $0000
A_3DBUTTON07:
[000898e6] 00064a22                  dc.l A_3Dbutton
[000898ea]                           dc.w $29c1
[000898ec]                           dc.w $0178
[000898ee] 000630f2                  dc.l Auo_string
[000898f2] 00089192                  dc.l TEXT_23
[000898f6]                           dc.w $0000
[000898f8]                           dc.w $0000
[000898fa]                           dc.w $0000
[000898fc]                           dc.w $0000
[000898fe] 00087edf                  dc.l BUBBLE_01
[00089902]                           dc.w $0000
[00089904]                           dc.w $0000
A_3DBUTTON08:
[00089906] 00064a22                  dc.l A_3Dbutton
[0008990a]                           dc.w $29c1
[0008990c]                           dc.w $0178
[0008990e] 000630f2                  dc.l Auo_string
[00089912] 00089195                  dc.l TEXT_24
[00089916]                           dc.w $0000
[00089918]                           dc.w $0000
[0008991a]                           dc.w $0000
[0008991c]                           dc.w $0000
[0008991e] 00087f2b                  dc.l BUBBLE_02
[00089922]                           dc.w $0000
[00089924]                           dc.w $0000
A_3DBUTTON09:
[00089926] 00064a22                  dc.l A_3Dbutton
[0008992a]                           dc.w $2011
[0008992c]                           dc.w $9178
[0008992e] 000630f2                  dc.l Auo_string
[00089932]                           dc.w $0000
[00089934]                           dc.w $0000
[00089936]                           dc.w $0000
[00089938]                           dc.w $0000
[0008993a]                           dc.w $0000
[0008993c]                           dc.w $0000
[0008993e]                           dc.w $0000
[00089940]                           dc.w $0000
[00089942]                           dc.w $0000
[00089944]                           dc.w $0000
A_3DBUTTON10:
[00089946] 00064a22                  dc.l A_3Dbutton
[0008994a]                           dc.w $2011
[0008994c]                           dc.w $9178
[0008994e] 000630f2                  dc.l Auo_string
[00089952]                           dc.w $0000
[00089954]                           dc.w $0000
[00089956]                           dc.w $0000
[00089958]                           dc.w $0000
[0008995a]                           dc.w $0000
[0008995c]                           dc.w $0000
[0008995e]                           dc.w $0000
[00089960]                           dc.w $0000
[00089962]                           dc.w $0000
[00089964]                           dc.w $0000
A_3DBUTTON11:
[00089966] 00064a22                  dc.l A_3Dbutton
[0008996a]                           dc.w $2011
[0008996c]                           dc.w $9178
[0008996e] 000630f2                  dc.l Auo_string
[00089972]                           dc.w $0000
[00089974]                           dc.w $0000
[00089976]                           dc.w $0000
[00089978]                           dc.w $0000
[0008997a]                           dc.w $0000
[0008997c]                           dc.w $0000
[0008997e]                           dc.w $0000
[00089980]                           dc.w $0000
[00089982]                           dc.w $0000
[00089984]                           dc.w $0000
A_3DBUTTON12:
[00089986] 00064a22                  dc.l A_3Dbutton
[0008998a]                           dc.w $2011
[0008998c]                           dc.w $9178
[0008998e] 000630f2                  dc.l Auo_string
[00089992]                           dc.w $0000
[00089994]                           dc.w $0000
[00089996]                           dc.w $0000
[00089998]                           dc.w $0000
[0008999a]                           dc.w $0000
[0008999c]                           dc.w $0000
[0008999e]                           dc.w $0000
[000899a0]                           dc.w $0000
[000899a2]                           dc.w $0000
[000899a4]                           dc.w $0000
A_BOXED01:
[000899a6] 0006afea                  dc.l A_boxed
[000899aa]                           dc.w $9078
[000899ac]                           dc.w $0512
[000899ae] 0006a068                  dc.l Auo_boxed
[000899b2]                           dc.w $0000
[000899b4]                           dc.w $0000
[000899b6]                           dc.w $0000
[000899b8]                           dc.w $0000
[000899ba]                           dc.w $0000
[000899bc]                           dc.w $0000
[000899be] 00088d30                  dc.l BUBBLE_31
[000899c2]                           dc.w $0000
[000899c4]                           dc.w $0000
A_BOXED02:
[000899c6] 0006afea                  dc.l A_boxed
[000899ca]                           dc.w $9038
[000899cc]                           dc.w $2012
[000899ce] 0006a068                  dc.l Auo_boxed
[000899d2]                           dc.w $0000
[000899d4]                           dc.w $0000
[000899d6]                           dc.w $0000
[000899d8]                           dc.w $0000
[000899da]                           dc.w $0000
[000899dc]                           dc.w $0000
[000899de]                           dc.w $0000
[000899e0]                           dc.w $0000
[000899e2]                           dc.w $0000
[000899e4]                           dc.w $0000
A_BOXED03:
[000899e6] 0006afea                  dc.l A_boxed
[000899ea]                           dc.w $9008
[000899ec]                           dc.w $ff12
[000899ee] 0006a068                  dc.l Auo_boxed
[000899f2]                           dc.w $0000
[000899f4]                           dc.w $0000
[000899f6]                           dc.w $0000
[000899f8]                           dc.w $0000
[000899fa]                           dc.w $0000
[000899fc]                           dc.w $0000
[000899fe] 00088ae8                  dc.l BUBBLE_24
[00089a02]                           dc.w $0000
[00089a04]                           dc.w $0000
A_BOXED04:
[00089a06] 0006afea                  dc.l A_boxed
[00089a0a]                           dc.w $9038
[00089a0c]                           dc.w $2012
[00089a0e] 0006a068                  dc.l Auo_boxed
[00089a12]                           dc.w $0000
[00089a14]                           dc.w $0000
[00089a16]                           dc.w $0000
[00089a18]                           dc.w $0000
[00089a1a]                           dc.w $0000
[00089a1c]                           dc.w $0000
[00089a1e] 00088cf4                  dc.l BUBBLE_30
[00089a22]                           dc.w $0000
[00089a24]                           dc.w $0000
A_BOXED05:
[00089a26] 0006afea                  dc.l A_boxed
[00089a2a]                           dc.w $9038
[00089a2c]                           dc.w $1d12
[00089a2e] 0006a068                  dc.l Auo_boxed
[00089a32]                           dc.w $0000
[00089a34]                           dc.w $0000
[00089a36]                           dc.w $0000
[00089a38]                           dc.w $0000
[00089a3a]                           dc.w $0000
[00089a3c]                           dc.w $0000
[00089a3e]                           dc.w $0000
[00089a40]                           dc.w $0000
[00089a42]                           dc.w $0000
[00089a44]                           dc.w $0000
A_CHECKBOX01:
[00089a46] 0006323e                  dc.l A_checkbox
[00089a4a]                           dc.w $0000
[00089a4c]                           dc.w $0001
[00089a4e] 000630f2                  dc.l Auo_string
[00089a52] 00088fce                  dc.l TEXT_02
[00089a56]                           dc.w $0000
[00089a58]                           dc.w $0000
[00089a5a]                           dc.w $0000
[00089a5c]                           dc.w $0000
[00089a5e] 00088caa                  dc.l BUBBLE_29
[00089a62]                           dc.w $0000
[00089a64]                           dc.w $0000
A_CHECKBOX02:
[00089a66] 0006323e                  dc.l A_checkbox
[00089a6a]                           dc.w $0000
[00089a6c]                           dc.w $0001
[00089a6e] 000630f2                  dc.l Auo_string
[00089a72] 0008915a                  dc.l TEXT_20
[00089a76]                           dc.w $0000
[00089a78]                           dc.w $0000
[00089a7a]                           dc.w $0000
[00089a7c]                           dc.w $0000
[00089a7e] 00088631                  dc.l BUBBLE_15
[00089a82]                           dc.w $0000
[00089a84]                           dc.w $0000
A_CHECKBOX03:
[00089a86] 0006323e                  dc.l A_checkbox
[00089a8a]                           dc.w $0000
[00089a8c]                           dc.w $0001
[00089a8e] 000630f2                  dc.l Auo_string
[00089a92] 000890d7                  dc.l TEXT_14
[00089a96]                           dc.w $0000
[00089a98]                           dc.w $0000
[00089a9a]                           dc.w $0000
[00089a9c]                           dc.w $0000
[00089a9e] 000884e2                  dc.l BUBBLE_13
[00089aa2]                           dc.w $0000
[00089aa4]                           dc.w $0000
A_CHECKBOX04:
[00089aa6] 0006323e                  dc.l A_checkbox
[00089aaa]                           dc.w $0000
[00089aac]                           dc.w $0001
[00089aae] 000630f2                  dc.l Auo_string
[00089ab2] 0008925b                  dc.l TEXT_350
[00089ab6]                           dc.w $0000
[00089ab8]                           dc.w $0000
[00089aba]                           dc.w $0000
[00089abc]                           dc.w $0000
[00089abe] 0008830c                  dc.l BUBBLE_10
[00089ac2]                           dc.w $0000
[00089ac4]                           dc.w $0000
A_CHECKBOX05:
[00089ac6] 0006323e                  dc.l A_checkbox
[00089aca]                           dc.w $0000
[00089acc]                           dc.w $0001
[00089ace] 000630f2                  dc.l Auo_string
[00089ad2] 000890b6                  dc.l TEXT_118
[00089ad6]                           dc.w $0000
[00089ad8]                           dc.w $0000
[00089ada]                           dc.w $0000
[00089adc]                           dc.w $0000
[00089ade] 00088578                  dc.l BUBBLE_14
[00089ae2]                           dc.w $0000
[00089ae4]                           dc.w $0000
A_CHECKBOX06:
[00089ae6] 0006323e                  dc.l A_checkbox
[00089aea]                           dc.w $0000
[00089aec]                           dc.w $0001
[00089aee] 000630f2                  dc.l Auo_string
[00089af2] 00089462                  dc.l TEXT_55
[00089af6]                           dc.w $0000
[00089af8]                           dc.w $0000
[00089afa]                           dc.w $0000
[00089afc]                           dc.w $0000
[00089afe] 00088e74                  dc.l BUBBLE_34
[00089b02]                           dc.w $0000
[00089b04]                           dc.w $0000
A_CHECKBOX07:
[00089b06] 0006323e                  dc.l A_checkbox
[00089b0a]                           dc.w $0000
[00089b0c]                           dc.w $0001
[00089b0e] 000630f2                  dc.l Auo_string
[00089b12] 00088fd7                  dc.l TEXT_03
[00089b16]                           dc.w $0000
[00089b18]                           dc.w $0000
[00089b1a]                           dc.w $0000
[00089b1c]                           dc.w $0000
[00089b1e] 00088426                  dc.l BUBBLE_12
[00089b22]                           dc.w $0000
[00089b24]                           dc.w $0000
A_CHECKBOX08:
[00089b26] 0006323e                  dc.l A_checkbox
[00089b2a]                           dc.w $0000
[00089b2c]                           dc.w $0001
[00089b2e] 000630f2                  dc.l Auo_string
[00089b32] 000891d9                  dc.l TEXT_263
[00089b36]                           dc.w $0000
[00089b38]                           dc.w $0000
[00089b3a]                           dc.w $0000
[00089b3c]                           dc.w $0000
[00089b3e] 00088259                  dc.l BUBBLE_09
[00089b42]                           dc.w $0000
[00089b44]                           dc.w $0000
A_CHECKBOX09:
[00089b46] 0006323e                  dc.l A_checkbox
[00089b4a]                           dc.w $0000
[00089b4c]                           dc.w $0001
[00089b4e] 000630f2                  dc.l Auo_string
[00089b52] 00088f8e                  dc.l TEXT_009
[00089b56]                           dc.w $0000
[00089b58]                           dc.w $0000
[00089b5a]                           dc.w $0000
[00089b5c]                           dc.w $0000
[00089b5e] 00088399                  dc.l BUBBLE_11
[00089b62]                           dc.w $0000
[00089b64]                           dc.w $0000
A_CHECKBOX10:
[00089b66] 0006323e                  dc.l A_checkbox
[00089b6a]                           dc.w $0000
[00089b6c]                           dc.w $0001
[00089b6e] 000630f2                  dc.l Auo_string
[00089b72] 000890e6                  dc.l TEXT_15
[00089b76]                           dc.w $0000
[00089b78]                           dc.w $0000
[00089b7a]                           dc.w $0000
[00089b7c]                           dc.w $0000
[00089b7e] 00088c61                  dc.l BUBBLE_28
[00089b82]                           dc.w $0000
[00089b84]                           dc.w $0000
A_CHECKBOX11:
[00089b86] 0006323e                  dc.l A_checkbox
[00089b8a]                           dc.w $0000
[00089b8c]                           dc.w $0001
[00089b8e] 000630f2                  dc.l Auo_string
[00089b92] 0008923f                  dc.l TEXT_345
[00089b96]                           dc.w $0000
[00089b98]                           dc.w $0000
[00089b9a]                           dc.w $0000
[00089b9c]                           dc.w $0000
[00089b9e] 00088b31                  dc.l BUBBLE_25
[00089ba2]                           dc.w $0000
[00089ba4]                           dc.w $0000
A_CHECKBOX12:
[00089ba6] 0006323e                  dc.l A_checkbox
[00089baa]                           dc.w $0000
[00089bac]                           dc.w $0001
[00089bae] 000630f2                  dc.l Auo_string
[00089bb2] 00089249                  dc.l TEXT_347
[00089bb6]                           dc.w $0000
[00089bb8]                           dc.w $0000
[00089bba]                           dc.w $0000
[00089bbc]                           dc.w $0000
[00089bbe] 00088b72                  dc.l BUBBLE_26
[00089bc2]                           dc.w $0000
[00089bc4]                           dc.w $0000
A_CHECKBOX13:
[00089bc6] 0006323e                  dc.l A_checkbox
[00089bca]                           dc.w $0000
[00089bcc]                           dc.w $0001
[00089bce] 000630f2                  dc.l Auo_string
[00089bd2] 00088fb5                  dc.l TEXT_018
[00089bd6]                           dc.w $0000
[00089bd8]                           dc.w $0000
[00089bda]                           dc.w $0000
[00089bdc]                           dc.w $0000
[00089bde] 00088bca                  dc.l BUBBLE_27
[00089be2]                           dc.w $0000
[00089be4]                           dc.w $0000
A_CHECKBOX14:
[00089be6] 0006323e                  dc.l A_checkbox
[00089bea]                           dc.w $0000
[00089bec]                           dc.w $0001
[00089bee] 000630f2                  dc.l Auo_string
[00089bf2] 000890fd                  dc.l TEXT_16
[00089bf6]                           dc.w $0000
[00089bf8]                           dc.w $0000
[00089bfa]                           dc.w $0000
[00089bfc]                           dc.w $0000
[00089bfe] 00088a48                  dc.l BUBBLE_23
[00089c02]                           dc.w $0000
[00089c04]                           dc.w $0000
A_CHECKBOX15:
[00089c06] 0006323e                  dc.l A_checkbox
[00089c0a]                           dc.w $0000
[00089c0c]                           dc.w $0001
[00089c0e] 000630f2                  dc.l Auo_string
[00089c12] 000891c4                  dc.l TEXT_26
[00089c16]                           dc.w $0000
[00089c18]                           dc.w $0000
[00089c1a]                           dc.w $0000
[00089c1c]                           dc.w $0000
[00089c1e] 00087f76                  dc.l BUBBLE_03
[00089c22]                           dc.w $0000
[00089c24]                           dc.w $0000
A_CHECKBOX16:
[00089c26] 0006323e                  dc.l A_checkbox
[00089c2a]                           dc.w $0000
[00089c2c]                           dc.w $0001
[00089c2e] 000630f2                  dc.l Auo_string
[00089c32] 000892cb                  dc.l TEXT_42
[00089c36]                           dc.w $0000
[00089c38]                           dc.w $0000
[00089c3a]                           dc.w $0000
[00089c3c]                           dc.w $0000
[00089c3e] 000881d2                  dc.l BUBBLE_08
[00089c42]                           dc.w $0000
[00089c44]                           dc.w $0000
A_CHECKBOX17:
[00089c46] 0006323e                  dc.l A_checkbox
[00089c4a]                           dc.w $0000
[00089c4c]                           dc.w $0001
[00089c4e] 000630f2                  dc.l Auo_string
[00089c52] 000893ff                  dc.l TEXT_47
[00089c56]                           dc.w $0000
[00089c58]                           dc.w $0000
[00089c5a]                           dc.w $0000
[00089c5c]                           dc.w $0000
[00089c5e] 00088004                  dc.l BUBBLE_04
[00089c62]                           dc.w $0000
[00089c64]                           dc.w $0000
A_CHECKBOX18:
[00089c66] 0006323e                  dc.l A_checkbox
[00089c6a]                           dc.w $0000
[00089c6c]                           dc.w $0001
[00089c6e] 000630f2                  dc.l Auo_string
[00089c72] 00089404                  dc.l TEXT_48
[00089c76]                           dc.w $0000
[00089c78]                           dc.w $0000
[00089c7a]                           dc.w $0000
[00089c7c]                           dc.w $0000
[00089c7e] 00088089                  dc.l BUBBLE_05
[00089c82]                           dc.w $0000
[00089c84]                           dc.w $0000
A_CHECKBOX19:
[00089c86] 0006323e                  dc.l A_checkbox
[00089c8a]                           dc.w $0000
[00089c8c]                           dc.w $0001
[00089c8e] 000630f2                  dc.l Auo_string
[00089c92] 0008940b                  dc.l TEXT_49
[00089c96]                           dc.w $0000
[00089c98]                           dc.w $0000
[00089c9a]                           dc.w $0000
[00089c9c]                           dc.w $0000
[00089c9e] 00088127                  dc.l BUBBLE_06
[00089ca2]                           dc.w $0000
[00089ca4]                           dc.w $0000
A_CHECKBOX20:
[00089ca6] 0006323e                  dc.l A_checkbox
[00089caa]                           dc.w $0000
[00089cac]                           dc.w $0001
[00089cae] 000630f2                  dc.l Auo_string
[00089cb2] 00089415                  dc.l TEXT_50
[00089cb6]                           dc.w $0000
[00089cb8]                           dc.w $0000
[00089cba]                           dc.w $0000
[00089cbc]                           dc.w $0000
[00089cbe] 00088172                  dc.l BUBBLE_07
[00089cc2]                           dc.w $0000
[00089cc4]                           dc.w $0000
A_CHECKBOX21:
[00089cc6] 0006323e                  dc.l A_checkbox
[00089cca]                           dc.w $0000
[00089ccc]                           dc.w $0001
[00089cce] 000630f2                  dc.l Auo_string
[00089cd2] 0008941f                  dc.l TEXT_51
[00089cd6]                           dc.w $0000
[00089cd8]                           dc.w $0000
[00089cda]                           dc.w $0000
[00089cdc]                           dc.w $0000
[00089cde] 000886f8                  dc.l BUBBLE_17
[00089ce2]                           dc.w $0000
[00089ce4]                           dc.w $0000
A_CHECKBOX22:
[00089ce6] 0006323e                  dc.l A_checkbox
[00089cea]                           dc.w $0000
[00089cec]                           dc.w $0001
[00089cee] 000630f2                  dc.l Auo_string
[00089cf2] 00089432                  dc.l TEXT_52
[00089cf6]                           dc.w $0000
[00089cf8]                           dc.w $0000
[00089cfa]                           dc.w $0000
[00089cfc]                           dc.w $0000
[00089cfe] 000887c4                  dc.l BUBBLE_18
[00089d02]                           dc.w $0000
[00089d04]                           dc.w $0000
A_CHECKBOX23:
[00089d06] 0006323e                  dc.l A_checkbox
[00089d0a]                           dc.w $0000
[00089d0c]                           dc.w $0001
[00089d0e] 000630f2                  dc.l Auo_string
[00089d12] 0008943f                  dc.l TEXT_53
[00089d16]                           dc.w $0000
[00089d18]                           dc.w $0000
[00089d1a]                           dc.w $0000
[00089d1c]                           dc.w $0000
[00089d1e] 00088866                  dc.l BUBBLE_19
[00089d22]                           dc.w $0000
[00089d24]                           dc.w $0000
A_CHECKBOX24:
[00089d26] 0006323e                  dc.l A_checkbox
[00089d2a]                           dc.w $0000
[00089d2c]                           dc.w $0001
[00089d2e] 000630f2                  dc.l Auo_string
[00089d32] 00089451                  dc.l TEXT_54
[00089d36]                           dc.w $0000
[00089d38]                           dc.w $0000
[00089d3a]                           dc.w $0000
[00089d3c]                           dc.w $0000
[00089d3e] 00088d7e                  dc.l BUBBLE_32
[00089d42]                           dc.w $0000
[00089d44]                           dc.w $0000
A_CHECKBOX25:
[00089d46] 0006323e                  dc.l A_checkbox
[00089d4a]                           dc.w $0000
[00089d4c]                           dc.w $0001
[00089d4e] 000630f2                  dc.l Auo_string
[00089d52] 00089480                  dc.l TEXT_56
[00089d56]                           dc.w $0000
[00089d58]                           dc.w $0000
[00089d5a]                           dc.w $0000
[00089d5c]                           dc.w $0000
[00089d5e] 00088dff                  dc.l BUBBLE_33
[00089d62]                           dc.w $0000
[00089d64]                           dc.w $0000
A_CYCLE01:
[00089d66] 00066c46                  dc.l A_cycle
[00089d6a]                           dc.w $0001
[00089d6c]                           dc.w $0290
[00089d6e] 00067456                  dc.l Auo_cycle
[00089d72] 00089025                  dc.l TEXT_08
[00089d76]                           dc.w $0000
[00089d78]                           dc.w $0000
[00089d7a]                           dc.w $0000
[00089d7c]                           dc.w $0000
[00089d7e] 00088998                  dc.l BUBBLE_21
[00089d82]                           dc.w $0000
[00089d84]                           dc.w $0000
A_CYCLE02:
[00089d86] 00066c46                  dc.l A_cycle
[00089d8a]                           dc.w $0001
[00089d8c]                           dc.w $0290
[00089d8e] 00067456                  dc.l Auo_cycle
[00089d92] 0008910c                  dc.l TEXT_17
[00089d96]                           dc.w $0000
[00089d98]                           dc.w $0000
[00089d9a]                           dc.w $0000
[00089d9c]                           dc.w $0000
[00089d9e] 00088917                  dc.l BUBBLE_20
[00089da2]                           dc.w $0000
[00089da4]                           dc.w $0000
A_CYCLE03:
[00089da6] 00066c46                  dc.l A_cycle
[00089daa]                           dc.w $0001
[00089dac]                           dc.w $0290
[00089dae] 00067456                  dc.l Auo_cycle
[00089db2] 00089060                  dc.l TEXT_11
[00089db6]                           dc.w $0000
[00089db8]                           dc.w $0000
[00089dba]                           dc.w $0000
[00089dbc]                           dc.w $0000
[00089dbe] 000889f5                  dc.l BUBBLE_22
[00089dc2]                           dc.w $0000
[00089dc4]                           dc.w $0000
A_CYCLE04:
[00089dc6] 00066c46                  dc.l A_cycle
[00089dca]                           dc.w $0001
[00089dcc]                           dc.w $0290
[00089dce] 00067456                  dc.l Auo_cycle
[00089dd2] 000892f7                  dc.l TEXT_45
[00089dd6]                           dc.w $0000
[00089dd8]                           dc.w $0000
[00089dda]                           dc.w $0000
[00089ddc]                           dc.w $0000
[00089dde] 0008867e                  dc.l BUBBLE_16
[00089de2]                           dc.w $0000
[00089de4]                           dc.w $0000
A_INNERFRAME01:
[00089de6] 00064256                  dc.l A_innerframe
[00089dea]                           dc.w $1800
[00089dec]                           dc.w $8f19
[00089dee] 000630f2                  dc.l Auo_string
[00089df2] 00088fea                  dc.l TEXT_04
[00089df6]                           dc.w $0000
[00089df8]                           dc.w $0000
[00089dfa]                           dc.w $0000
[00089dfc]                           dc.w $0000
[00089dfe]                           dc.w $0000
[00089e00]                           dc.w $0000
[00089e02]                           dc.w $0000
[00089e04]                           dc.w $0000
A_INNERFRAME02:
[00089e06] 00064256                  dc.l A_innerframe
[00089e0a]                           dc.w $1800
[00089e0c]                           dc.w $8f19
[00089e0e] 000630f2                  dc.l Auo_string
[00089e12] 00089044                  dc.l TEXT_09
[00089e16]                           dc.w $0000
[00089e18]                           dc.w $0000
[00089e1a]                           dc.w $0000
[00089e1c]                           dc.w $0000
[00089e1e]                           dc.w $0000
[00089e20]                           dc.w $0000
[00089e22]                           dc.w $0000
[00089e24]                           dc.w $0000
A_INNERFRAME03:
[00089e26] 00064256                  dc.l A_innerframe
[00089e2a]                           dc.w $1800
[00089e2c]                           dc.w $8f19
[00089e2e] 000630f2                  dc.l Auo_string
[00089e32] 0008901e                  dc.l TEXT_07
[00089e36]                           dc.w $0000
[00089e38]                           dc.w $0000
[00089e3a]                           dc.w $0000
[00089e3c]                           dc.w $0000
[00089e3e]                           dc.w $0000
[00089e40]                           dc.w $0000
[00089e42]                           dc.w $0000
[00089e44]                           dc.w $0000
A_INNERFRAME04:
[00089e46] 00064256                  dc.l A_innerframe
[00089e4a]                           dc.w $1800
[00089e4c]                           dc.w $8f19
[00089e4e] 000630f2                  dc.l Auo_string
[00089e52] 000890d1                  dc.l TEXT_13
[00089e56]                           dc.w $0000
[00089e58]                           dc.w $0000
[00089e5a]                           dc.w $0000
[00089e5c]                           dc.w $0000
[00089e5e]                           dc.w $0000
[00089e60]                           dc.w $0000
[00089e62]                           dc.w $0000
[00089e64]                           dc.w $0000
A_INNERFRAME05:
[00089e66] 00064256                  dc.l A_innerframe
[00089e6a]                           dc.w $1800
[00089e6c]                           dc.w $8f19
[00089e6e] 000630f2                  dc.l Auo_string
[00089e72] 00088ff4                  dc.l TEXT_05
[00089e76]                           dc.w $0000
[00089e78]                           dc.w $0000
[00089e7a]                           dc.w $0000
[00089e7c]                           dc.w $0000
[00089e7e]                           dc.w $0000
[00089e80]                           dc.w $0000
[00089e82]                           dc.w $0000
[00089e84]                           dc.w $0000
A_INNERFRAME06:
[00089e86] 00064256                  dc.l A_innerframe
[00089e8a]                           dc.w $1800
[00089e8c]                           dc.w $8f19
[00089e8e] 000630f2                  dc.l Auo_string
[00089e92] 00088ffd                  dc.l TEXT_06
[00089e96]                           dc.w $0000
[00089e98]                           dc.w $0000
[00089e9a]                           dc.w $0000
[00089e9c]                           dc.w $0000
[00089e9e]                           dc.w $0000
[00089ea0]                           dc.w $0000
[00089ea2]                           dc.w $0000
[00089ea4]                           dc.w $0000
A_INNERFRAME07:
[00089ea6] 00064256                  dc.l A_innerframe
[00089eaa]                           dc.w $1800
[00089eac]                           dc.w $8f19
[00089eae] 000630f2                  dc.l Auo_string
[00089eb2] 0008919f                  dc.l TEXT_25
[00089eb6]                           dc.w $0000
[00089eb8]                           dc.w $0000
[00089eba]                           dc.w $0000
[00089ebc]                           dc.w $0000
[00089ebe]                           dc.w $0000
[00089ec0]                           dc.w $0000
[00089ec2]                           dc.w $0000
[00089ec4]                           dc.w $0000
A_INNERFRAME08:
[00089ec6] 00064256                  dc.l A_innerframe
[00089eca]                           dc.w $1800
[00089ecc]                           dc.w $8f19
[00089ece] 000630f2                  dc.l Auo_string
[00089ed2] 00089295                  dc.l TEXT_40
[00089ed6]                           dc.w $0000
[00089ed8]                           dc.w $0000
[00089eda]                           dc.w $0000
[00089edc]                           dc.w $0000
[00089ede]                           dc.w $0000
[00089ee0]                           dc.w $0000
[00089ee2]                           dc.w $0000
[00089ee4]                           dc.w $0000
A_INNERFRAME09:
[00089ee6] 00064256                  dc.l A_innerframe
[00089eea]                           dc.w $1800
[00089eec]                           dc.w $8f19
[00089eee] 000630f2                  dc.l Auo_string
[00089ef2] 000892b1                  dc.l TEXT_41
[00089ef6]                           dc.w $0000
[00089ef8]                           dc.w $0000
[00089efa]                           dc.w $0000
[00089efc]                           dc.w $0000
[00089efe]                           dc.w $0000
[00089f00]                           dc.w $0000
[00089f02]                           dc.w $0000
[00089f04]                           dc.w $0000
A_INNERFRAME10:
[00089f06] 00064256                  dc.l A_innerframe
[00089f0a]                           dc.w $1800
[00089f0c]                           dc.w $8f19
[00089f0e] 000630f2                  dc.l Auo_string
[00089f12] 000892da                  dc.l TEXT_43
[00089f16]                           dc.w $0000
[00089f18]                           dc.w $0000
[00089f1a]                           dc.w $0000
[00089f1c]                           dc.w $0000
[00089f1e]                           dc.w $0000
[00089f20]                           dc.w $0000
[00089f22]                           dc.w $0000
[00089f24]                           dc.w $0000
A_INNERFRAME11:
[00089f26] 00064256                  dc.l A_innerframe
[00089f2a]                           dc.w $1800
[00089f2c]                           dc.w $8f19
[00089f2e] 000630f2                  dc.l Auo_string
[00089f32] 000893ef                  dc.l TEXT_46
[00089f36]                           dc.w $0000
[00089f38]                           dc.w $0000
[00089f3a]                           dc.w $0000
[00089f3c]                           dc.w $0000
[00089f3e]                           dc.w $0000
[00089f40]                           dc.w $0000
[00089f42]                           dc.w $0000
[00089f44]                           dc.w $0000
A_INNERFRAME12:
[00089f46] 00064256                  dc.l A_innerframe
[00089f4a]                           dc.w $1800
[00089f4c]                           dc.w $8f19
[00089f4e] 000630f2                  dc.l Auo_string
[00089f52] 00088f9e                  dc.l TEXT_01
[00089f56]                           dc.w $0000
[00089f58]                           dc.w $0000
[00089f5a]                           dc.w $0000
[00089f5c]                           dc.w $0000
[00089f5e]                           dc.w $0000
[00089f60]                           dc.w $0000
[00089f62]                           dc.w $0000
[00089f64]                           dc.w $0000
_C4_IC_BEHAVE:
[00089f66]                           dc.w $0004
[00089f68] 000894c0                  dc.l $000894c0
[00089f6c] 00089778                  dc.l DATAS_08
[00089f70]                           dc.w $0000
[00089f72]                           dc.w $0000
[00089f74]                           dc.w $0000
[00089f76]                           dc.w $0000
[00089f78]                           dc.w $0000
[00089f7a]                           dc.w $0000
_MSK_IC_BEHAVE:
[00089f7c]                           dc.w $0000
[00089f7e]                           dc.w $0000
[00089f80]                           dc.w $0000
[00089f82]                           dc.w $07ff
[00089f84]                           dc.w $ffff
[00089f86]                           dc.w $ffe0
[00089f88]                           dc.w $07ff
[00089f8a]                           dc.w $ffff
[00089f8c]                           dc.w $ffe0
[00089f8e]                           dc.w $07ff
[00089f90]                           dc.w $ffff
[00089f92]                           dc.w $ffe0
[00089f94]                           dc.w $07ff
[00089f96]                           dc.w $ffff
[00089f98]                           dc.w $ffe0
[00089f9a]                           dc.w $07ff
[00089f9c]                           dc.w $ffff
[00089f9e]                           dc.w $ffe0
[00089fa0]                           dc.w $07ff
[00089fa2]                           dc.w $ffff
[00089fa4]                           dc.w $ffe0
[00089fa6]                           dc.w $07ff
[00089fa8]                           dc.w $ffff
[00089faa]                           dc.w $ffe0
[00089fac]                           dc.w $07ff
[00089fae]                           dc.w $ffff
[00089fb0]                           dc.w $ffe0
[00089fb2]                           dc.w $07ff
[00089fb4]                           dc.w $ffff
[00089fb6]                           dc.w $ffe0
[00089fb8]                           dc.w $07ff
[00089fba]                           dc.w $ffff
[00089fbc]                           dc.w $ffe0
[00089fbe]                           dc.w $07ff
[00089fc0]                           dc.w $ffff
[00089fc2]                           dc.w $ffe0
[00089fc4]                           dc.w $07ff
[00089fc6]                           dc.w $ffff
[00089fc8]                           dc.w $ffe0
[00089fca]                           dc.w $07ff
[00089fcc]                           dc.w $ffff
[00089fce]                           dc.w $ffe0
[00089fd0]                           dc.w $07ff
[00089fd2]                           dc.w $ffff
[00089fd4]                           dc.w $ffe0
[00089fd6]                           dc.w $07ff
[00089fd8]                           dc.w $ffff
[00089fda]                           dc.w $ffe0
[00089fdc]                           dc.w $07ff
[00089fde]                           dc.w $ffff
[00089fe0]                           dc.w $ffe0
[00089fe2]                           dc.w $07ff
[00089fe4]                           dc.w $ffff
[00089fe6]                           dc.w $ffe0
[00089fe8]                           dc.w $07ff
[00089fea]                           dc.w $ffff
[00089fec]                           dc.w $ffe0
[00089fee]                           dc.w $07ff
[00089ff0]                           dc.w $ffff
[00089ff2]                           dc.w $ffe0
[00089ff4]                           dc.w $07ff
[00089ff6]                           dc.w $ffff
[00089ff8]                           dc.w $ffe0
[00089ffa]                           dc.w $07ff
[00089ffc]                           dc.w $ffff
[00089ffe]                           dc.w $ffe0
[0008a000]                           dc.w $07ff
[0008a002]                           dc.w $ffff
[0008a004]                           dc.w $ffe0
[0008a006]                           dc.w $07ff
[0008a008]                           dc.w $ffff
[0008a00a]                           dc.w $ffe0
[0008a00c]                           dc.w $07ff
[0008a00e]                           dc.w $ffff
[0008a010]                           dc.w $ffe0
[0008a012]                           dc.w $07ff
[0008a014]                           dc.w $ffff
[0008a016]                           dc.w $ffe0
[0008a018]                           dc.w $07ff
[0008a01a]                           dc.w $ffff
[0008a01c]                           dc.w $ffe0
[0008a01e]                           dc.w $07ff
[0008a020]                           dc.w $ffff
[0008a022]                           dc.w $ffe0
[0008a024]                           dc.w $0000
[0008a026]                           dc.w $0000
[0008a028]                           dc.w $0000
_DAT_IC_BEHAVE:
[0008a02a]                           dc.w $0000
[0008a02c]                           dc.w $0000
[0008a02e]                           dc.w $0000
[0008a030]                           dc.w $07ff
[0008a032]                           dc.w $ffff
[0008a034]                           dc.w $ffe0
[0008a036]                           dc.w $0400
[0008a038]                           dc.w $0000
[0008a03a]                           dc.w $0020
[0008a03c]                           dc.w $0400
[0008a03e]                           dc.w $0000
[0008a040]                           dc.w $0020
[0008a042]                           dc.w $0401
[0008a044]                           dc.w $e007
[0008a046]                           dc.w $8020
[0008a048]                           dc.w $0406
[0008a04a]                           dc.w $1818
[0008a04c]                           dc.w $6020
[0008a04e]                           dc.w $0408
[0008a050]                           dc.w $0420
[0008a052]                           dc.w $1020
[0008a054]                           dc.w $0409
[0008a056]                           dc.w $e427
[0008a058]                           dc.w $1020
[0008a05a]                           dc.w $0413
[0008a05c]                           dc.w $3244
[0008a05e]                           dc.w $8820
[0008a060]                           dc.w $0412
[0008a062]                           dc.w $0244
[0008a064]                           dc.w $8820
[0008a066]                           dc.w $0412
[0008a068]                           dc.w $0247
[0008a06a]                           dc.w $0820
[0008a06c]                           dc.w $0413
[0008a06e]                           dc.w $3244
[0008a070]                           dc.w $8820
[0008a072]                           dc.w $0409
[0008a074]                           dc.w $e424
[0008a076]                           dc.w $9020
[0008a078]                           dc.w $0408
[0008a07a]                           dc.w $0420
[0008a07c]                           dc.w $1020
[0008a07e]                           dc.w $0406
[0008a080]                           dc.w $1818
[0008a082]                           dc.w $6020
[0008a084]                           dc.w $0401
[0008a086]                           dc.w $e007
[0008a088]                           dc.w $8020
[0008a08a]                           dc.w $0400
[0008a08c]                           dc.w $0000
[0008a08e]                           dc.w $0020
[0008a090]                           dc.w $0400
[0008a092]                           dc.w $0000
[0008a094]                           dc.w $0020
[0008a096]                           dc.w $0460
[0008a098]                           dc.w $c183
[0008a09a]                           dc.w $0620
[0008a09c]                           dc.w $0491
[0008a09e]                           dc.w $2244
[0008a0a0]                           dc.w $9fa0
[0008a0a2]                           dc.w $0493
[0008a0a4]                           dc.w $f244
[0008a0a6]                           dc.w $9fa0
[0008a0a8]                           dc.w $0493
[0008a0aa]                           dc.w $f7e4
[0008a0ac]                           dc.w $8920
[0008a0ae]                           dc.w $0491
[0008a0b0]                           dc.w $27e4
[0008a0b2]                           dc.w $8920
[0008a0b4]                           dc.w $05f9
[0008a0b6]                           dc.w $224f
[0008a0b8]                           dc.w $c920
[0008a0ba]                           dc.w $05f9
[0008a0bc]                           dc.w $224f
[0008a0be]                           dc.w $c920
[0008a0c0]                           dc.w $0460
[0008a0c2]                           dc.w $c183
[0008a0c4]                           dc.w $0620
[0008a0c6]                           dc.w $0400
[0008a0c8]                           dc.w $0000
[0008a0ca]                           dc.w $0020
[0008a0cc]                           dc.w $07ff
[0008a0ce]                           dc.w $ffff
[0008a0d0]                           dc.w $ffe0
[0008a0d2]                           dc.w $0000
[0008a0d4]                           dc.w $0000
[0008a0d6]                           dc.w $0000
IC_BEHAVE:
[0008a0d8] 00089f7c                  dc.l _MSK_IC_BEHAVE
[0008a0dc] 0008a02a                  dc.l _DAT_IC_BEHAVE
[0008a0e0] 0008922c                  dc.l TEXT_331
[0008a0e4]                           dc.w $1000
[0008a0e6]                           dc.w $0000
[0008a0e8]                           dc.w $0000
[0008a0ea]                           dc.w $000c
[0008a0ec]                           dc.w $0000
[0008a0ee]                           dc.w $0030
[0008a0f0]                           dc.w $001d
[0008a0f2]                           dc.w $0000
[0008a0f4]                           dc.w $0020
[0008a0f6]                           dc.w $0048
[0008a0f8]                           dc.w $0008
[0008a0fa] 00089f66                  dc.l _C4_IC_BEHAVE
EDIT_BEHAVE:
[0008a0fe]                           dc.w $ffff
[0008a100]                           dc.w $0001
[0008a102]                           dc.w $0024
[0008a104]                           dc.w $0018
[0008a106]                           dc.w $0000
[0008a108]                           dc.w $0010
[0008a10a] 00089866                  dc.l A_3DBUTTON03
[0008a10e]                           dc.w $0000
[0008a110]                           dc.w $0000
[0008a112]                           dc.w $0044
[0008a114]                           dc.w $0011
_01_EDIT_BEHAVE:
[0008a116]                           dc.w $0009
[0008a118]                           dc.w $0002
[0008a11a]                           dc.w $0007
[0008a11c]                           dc.w $0018
[0008a11e]                           dc.w $0000
[0008a120]                           dc.w $0000
[0008a122] 00089e86                  dc.l A_INNERFRAME06
[0008a126]                           dc.w $0001
[0008a128]                           dc.w $0000
[0008a12a]                           dc.w $0021
[0008a12c]                           dc.w $0005
_02_EDIT_BEHAVE:
[0008a12e]                           dc.w $0003
[0008a130]                           dc.w $ffff
[0008a132]                           dc.w $ffff
[0008a134]                           dc.w $001c
[0008a136]                           dc.w $0000
[0008a138]                           dc.w $0000
[0008a13a] 00089135                  dc.l TEXT_18
[0008a13e]                           dc.w $0001
[0008a140]                           dc.w $0001
[0008a142]                           dc.w $0009
[0008a144]                           dc.w $0001
_03_EDIT_BEHAVE:
[0008a146]                           dc.w $0005
[0008a148]                           dc.w $ffff
[0008a14a]                           dc.w $ffff
[0008a14c]                           dc.w $0018
[0008a14e]                           dc.w $0001
[0008a150]                           dc.w $0001
[0008a152] 00089a46                  dc.l A_CHECKBOX01
[0008a156]                           dc.w $0001
[0008a158]                           dc.w $0003
[0008a15a]                           dc.w $000b
[0008a15c]                           dc.w $0001
_03aEDIT_BEHAVE:
[0008a15e]                           dc.w $0000
[0008a160]                           dc.w $0000
[0008a162]                           dc.w $0000
[0008a164]                           dc.w $0000
[0008a166]                           dc.w $8000
[0008a168]                           dc.w $8855
[0008a16a]                           dc.w $0000
[0008a16c]                           dc.w $0000
[0008a16e]                           dc.w $0000
[0008a170]                           dc.w $0000
[0008a172]                           dc.w $0000
[0008a174]                           dc.w $0000
_05_EDIT_BEHAVE:
[0008a176]                           dc.w $0007
[0008a178]                           dc.w $ffff
[0008a17a]                           dc.w $ffff
[0008a17c]                           dc.w $0018
[0008a17e]                           dc.w $0040
[0008a180]                           dc.w $0030
[0008a182] 00089d66                  dc.l A_CYCLE01
[0008a186]                           dc.w $000d
[0008a188]                           dc.w $0003
[0008a18a]                           dc.w $0012
[0008a18c]                           dc.w $0001
_05aEDIT_BEHAVE:
[0008a18e] 00067ca4                  dc.l Aus_cycle
[0008a192]                           dc.w $0000
[0008a194]                           dc.w $0000
[0008a196]                           dc.w $8000
[0008a198]                           dc.w $0000
[0008a19a]                           dc.w $0000
[0008a19c]                           dc.w $0000
[0008a19e]                           dc.w $0000
[0008a1a0]                           dc.w $0000
[0008a1a2]                           dc.w $0000
[0008a1a4]                           dc.w $0000
_07_EDIT_BEHAVE:
[0008a1a6]                           dc.w $0001
[0008a1a8]                           dc.w $ffff
[0008a1aa]                           dc.w $ffff
[0008a1ac]                           dc.w $0018
[0008a1ae]                           dc.w $0000
[0008a1b0]                           dc.w $0038
[0008a1b2] 00089d86                  dc.l A_CYCLE02
[0008a1b6]                           dc.w $000d
[0008a1b8]                           dc.w $0001
[0008a1ba]                           dc.w $0012
[0008a1bc]                           dc.w $0001
_07aEDIT_BEHAVE:
[0008a1be] 00067ca4                  dc.l Aus_cycle
[0008a1c2]                           dc.w $0000
[0008a1c4]                           dc.w $0000
[0008a1c6]                           dc.w $8000
[0008a1c8]                           dc.w $0000
[0008a1ca]                           dc.w $0000
[0008a1cc]                           dc.w $0000
[0008a1ce]                           dc.w $0000
[0008a1d0]                           dc.w $0000
[0008a1d2]                           dc.w $0000
[0008a1d4]                           dc.w $0000
_09_EDIT_BEHAVE:
[0008a1d6]                           dc.w $0010
[0008a1d8]                           dc.w $000a
[0008a1da]                           dc.w $000e
[0008a1dc]                           dc.w $0018
[0008a1de]                           dc.w $0040
[0008a1e0]                           dc.w $0000
[0008a1e2] 00089e06                  dc.l A_INNERFRAME02
[0008a1e6]                           dc.w $0022
[0008a1e8]                           dc.w $0000
[0008a1ea]                           dc.w $0021
[0008a1ec]                           dc.w $0005
_10_EDIT_BEHAVE:
[0008a1ee]                           dc.w $000c
[0008a1f0]                           dc.w $ffff
[0008a1f2]                           dc.w $ffff
[0008a1f4]                           dc.w $0018
[0008a1f6]                           dc.w $0001
[0008a1f8]                           dc.w $0001
[0008a1fa] 00089ba6                  dc.l A_CHECKBOX12
[0008a1fe]                           dc.w $0001
[0008a200]                           dc.w $0001
[0008a202]                           dc.w $000d
[0008a204]                           dc.w $0001
_10aEDIT_BEHAVE:
[0008a206]                           dc.w $0000
[0008a208]                           dc.w $0000
[0008a20a]                           dc.w $0000
[0008a20c]                           dc.w $0000
[0008a20e]                           dc.w $8000
[0008a210]                           dc.w $8852
[0008a212]                           dc.w $0000
[0008a214]                           dc.w $0000
[0008a216]                           dc.w $0000
[0008a218]                           dc.w $0000
[0008a21a]                           dc.w $0000
[0008a21c]                           dc.w $0000
_12_EDIT_BEHAVE:
[0008a21e]                           dc.w $000e
[0008a220]                           dc.w $ffff
[0008a222]                           dc.w $ffff
[0008a224]                           dc.w $0018
[0008a226]                           dc.w $0001
[0008a228]                           dc.w $0001
[0008a22a] 00089bc6                  dc.l A_CHECKBOX13
[0008a22e]                           dc.w $0001
[0008a230]                           dc.w $0002
[0008a232]                           dc.w $001b
[0008a234]                           dc.w $0001
_12aEDIT_BEHAVE:
[0008a236]                           dc.w $0000
[0008a238]                           dc.w $0000
[0008a23a]                           dc.w $0000
[0008a23c]                           dc.w $0000
[0008a23e]                           dc.w $8000
[0008a240]                           dc.w $884c
[0008a242]                           dc.w $0000
[0008a244]                           dc.w $0000
[0008a246]                           dc.w $0000
[0008a248]                           dc.w $0000
[0008a24a]                           dc.w $0000
[0008a24c]                           dc.w $0000
_14_EDIT_BEHAVE:
[0008a24e]                           dc.w $0009
[0008a250]                           dc.w $ffff
[0008a252]                           dc.w $ffff
[0008a254]                           dc.w $0018
[0008a256]                           dc.w $0001
[0008a258]                           dc.w $0001
[0008a25a] 00089b66                  dc.l A_CHECKBOX10
[0008a25e]                           dc.w $0001
[0008a260]                           dc.w $0003
[0008a262]                           dc.w $0019
[0008a264]                           dc.w $0001
_14aEDIT_BEHAVE:
[0008a266]                           dc.w $0000
[0008a268]                           dc.w $0000
[0008a26a]                           dc.w $0000
[0008a26c]                           dc.w $0000
[0008a26e]                           dc.w $8000
[0008a270]                           dc.w $8849
[0008a272]                           dc.w $0000
[0008a274]                           dc.w $0000
[0008a276]                           dc.w $0000
[0008a278]                           dc.w $0000
[0008a27a]                           dc.w $0000
[0008a27c]                           dc.w $0000
_16_EDIT_BEHAVE:
[0008a27e]                           dc.w $001c
[0008a280]                           dc.w $0011
[0008a282]                           dc.w $001a
[0008a284]                           dc.w $0018
[0008a286]                           dc.w $0000
[0008a288]                           dc.w $0000
[0008a28a] 00089f46                  dc.l A_INNERFRAME12
[0008a28e]                           dc.w $0001
[0008a290]                           dc.w $0005
[0008a292]                           dc.w $0042
[0008a294]                           dc.w $0005
_17_EDIT_BEHAVE:
[0008a296]                           dc.w $0013
[0008a298]                           dc.w $ffff
[0008a29a]                           dc.w $ffff
[0008a29c]                           dc.w $001c
[0008a29e]                           dc.w $0040
[0008a2a0]                           dc.w $0000
[0008a2a2] 0008909c                  dc.l TEXT_110
[0008a2a6]                           dc.w $0001
[0008a2a8]                           dc.w $0001
[0008a2aa]                           dc.w $0007
[0008a2ac]                           dc.w $0001
_17aEDIT_BEHAVE:
[0008a2ae] 00012604                  dc.l edbh_list
[0008a2b2]                           dc.w $0000
[0008a2b4]                           dc.w $0000
[0008a2b6]                           dc.w $8000
[0008a2b8]                           dc.w $0000
[0008a2ba]                           dc.w $0000
[0008a2bc]                           dc.w $0000
[0008a2be]                           dc.w $0000
[0008a2c0]                           dc.w $0000
[0008a2c2]                           dc.w $0000
[0008a2c4]                           dc.w $0000
_19_EDIT_BEHAVE:
[0008a2c6]                           dc.w $0015
[0008a2c8]                           dc.w $ffff
[0008a2ca]                           dc.w $ffff
[0008a2cc]                           dc.w $001c
[0008a2ce]                           dc.w $0040
[0008a2d0]                           dc.w $0000
[0008a2d2] 000890b0                  dc.l TEXT_112
[0008a2d6]                           dc.w $0001
[0008a2d8]                           dc.w $0003
[0008a2da]                           dc.w $0005
[0008a2dc]                           dc.w $0001
_19aEDIT_BEHAVE:
[0008a2de] 00012604                  dc.l edbh_list
[0008a2e2]                           dc.w $0000
[0008a2e4]                           dc.w $0000
[0008a2e6]                           dc.w $8000
[0008a2e8]                           dc.w $0000
[0008a2ea]                           dc.w $0000
[0008a2ec]                           dc.w $0000
[0008a2ee]                           dc.w $0000
[0008a2f0]                           dc.w $0000
[0008a2f2]                           dc.w $0000
[0008a2f4]                           dc.w $0000
_21_EDIT_BEHAVE:
[0008a2f6]                           dc.w $0016
[0008a2f8]                           dc.w $ffff
[0008a2fa]                           dc.w $ffff
[0008a2fc]                           dc.w $0018
[0008a2fe]                           dc.w $0001
[0008a300]                           dc.w $0009
[0008a302] 00089d46                  dc.l A_CHECKBOX25
[0008a306]                           dc.w $001f
[0008a308]                           dc.w $0002
[0008a30a]                           dc.w $0019
[0008a30c]                           dc.w $0001
_22_EDIT_BEHAVE:
[0008a30e]                           dc.w $0017
[0008a310]                           dc.w $ffff
[0008a312]                           dc.w $ffff
[0008a314]                           dc.w $0018
[0008a316]                           dc.w $0001
[0008a318]                           dc.w $0009
[0008a31a] 00089ae6                  dc.l A_CHECKBOX06
[0008a31e]                           dc.w $001f
[0008a320]                           dc.w $0001
[0008a322]                           dc.w $0020
[0008a324]                           dc.w $0001
_23_EDIT_BEHAVE:
[0008a326]                           dc.w $0018
[0008a328]                           dc.w $ffff
[0008a32a]                           dc.w $ffff
[0008a32c]                           dc.w $0018
[0008a32e]                           dc.w $0001
[0008a330]                           dc.w $0008
[0008a332] 00089a66                  dc.l A_CHECKBOX02
[0008a336]                           dc.w $001f
[0008a338]                           dc.w $0003
[0008a33a]                           dc.w $0020
[0008a33c]                           dc.w $0001
_24_EDIT_BEHAVE:
[0008a33e]                           dc.w $001a
[0008a340]                           dc.w $ffff
[0008a342]                           dc.w $ffff
[0008a344]                           dc.w $0018
[0008a346]                           dc.w $0040
[0008a348]                           dc.w $0030
[0008a34a] 00089da6                  dc.l A_CYCLE03
[0008a34e]                           dc.w $000a
[0008a350]                           dc.w $0001
[0008a352]                           dc.w $0012
[0008a354]                           dc.w $0001
_24aEDIT_BEHAVE:
[0008a356] 00067ca4                  dc.l Aus_cycle
[0008a35a]                           dc.w $0000
[0008a35c]                           dc.w $0000
[0008a35e]                           dc.w $8000
[0008a360]                           dc.w $0000
[0008a362]                           dc.w $0000
[0008a364]                           dc.w $0000
[0008a366]                           dc.w $0000
[0008a368]                           dc.w $0000
[0008a36a]                           dc.w $0000
[0008a36c]                           dc.w $0000
_26_EDIT_BEHAVE:
[0008a36e]                           dc.w $0010
[0008a370]                           dc.w $ffff
[0008a372]                           dc.w $ffff
[0008a374]                           dc.w $0018
[0008a376]                           dc.w $0005
[0008a378]                           dc.w $0008
[0008a37a] 00089886                  dc.l A_3DBUTTON04
[0008a37e]                           dc.w $000a
[0008a380]                           dc.w $0003
[0008a382]                           dc.w $0012
[0008a384]                           dc.w $0001
_26aEDIT_BEHAVE:
[0008a386]                           dc.w $0000
[0008a388]                           dc.w $0000
[0008a38a]                           dc.w $0000
[0008a38c]                           dc.w $0000
[0008a38e]                           dc.w $8000
[0008a390]                           dc.w $8849
[0008a392]                           dc.w $0000
[0008a394]                           dc.w $0000
[0008a396]                           dc.w $0000
[0008a398]                           dc.w $0000
[0008a39a]                           dc.w $0000
[0008a39c]                           dc.w $0000
_28_EDIT_BEHAVE:
[0008a39e]                           dc.w $0022
[0008a3a0]                           dc.w $001d
[0008a3a2]                           dc.w $0021
[0008a3a4]                           dc.w $0018
[0008a3a6]                           dc.w $0000
[0008a3a8]                           dc.w $0000
[0008a3aa] 00089e66                  dc.l A_INNERFRAME05
[0008a3ae]                           dc.w $0001
[0008a3b0]                           dc.w $000a
[0008a3b2]                           dc.w $0042
[0008a3b4]                           dc.w $0004
_29_EDIT_BEHAVE:
[0008a3b6]                           dc.w $001f
[0008a3b8]                           dc.w $ffff
[0008a3ba]                           dc.w $ffff
[0008a3bc]                           dc.w $0018
[0008a3be]                           dc.w $0001
[0008a3c0]                           dc.w $0001
[0008a3c2] 00089b86                  dc.l A_CHECKBOX11
[0008a3c6]                           dc.w $0001
[0008a3c8]                           dc.w $0001
[0008a3ca]                           dc.w $000c
[0008a3cc]                           dc.w $0001
_29aEDIT_BEHAVE:
[0008a3ce]                           dc.w $0000
[0008a3d0]                           dc.w $0000
[0008a3d2]                           dc.w $0000
[0008a3d4]                           dc.w $0000
[0008a3d6]                           dc.w $8000
[0008a3d8]                           dc.w $8842
[0008a3da]                           dc.w $0000
[0008a3dc]                           dc.w $0000
[0008a3de]                           dc.w $0000
[0008a3e0]                           dc.w $0000
[0008a3e2]                           dc.w $0000
[0008a3e4]                           dc.w $0000
_31_EDIT_BEHAVE:
[0008a3e6]                           dc.w $0021
[0008a3e8]                           dc.w $ffff
[0008a3ea]                           dc.w $ffff
[0008a3ec]                           dc.w $0018
[0008a3ee]                           dc.w $0001
[0008a3f0]                           dc.w $0001
[0008a3f2] 00089be6                  dc.l A_CHECKBOX14
[0008a3f6]                           dc.w $0001
[0008a3f8]                           dc.w $0002
[0008a3fa]                           dc.w $0011
[0008a3fc]                           dc.w $0001
_31aEDIT_BEHAVE:
[0008a3fe]                           dc.w $0000
[0008a400]                           dc.w $0000
[0008a402]                           dc.w $0000
[0008a404]                           dc.w $0000
[0008a406]                           dc.w $8000
[0008a408]                           dc.w $8843
[0008a40a]                           dc.w $0000
[0008a40c]                           dc.w $0000
[0008a40e]                           dc.w $0000
[0008a410]                           dc.w $0000
[0008a412]                           dc.w $0000
[0008a414]                           dc.w $0000
_33_EDIT_BEHAVE:
[0008a416]                           dc.w $001c
[0008a418]                           dc.w $ffff
[0008a41a]                           dc.w $ffff
[0008a41c]                           dc.w $0018
[0008a41e]                           dc.w $0008
[0008a420]                           dc.w $0010
[0008a422] 000899e6                  dc.l A_BOXED03
[0008a426]                           dc.w $0013
[0008a428]                           dc.w $0002
[0008a42a]                           dc.w $002d
[0008a42c]                           dc.w $0001
_34_EDIT_BEHAVE:
[0008a42e]                           dc.w $0024
[0008a430]                           dc.w $ffff
[0008a432]                           dc.w $ffff
[0008a434]                           dc.w $0018
[0008a436]                           dc.w $4007
[0008a438]                           dc.w $0010
[0008a43a] 00089846                  dc.l A_3DBUTTON02
[0008a43e]                           dc.w $0015
[0008a440]                           dc.w $000e
[0008a442]                           dc.w $000c
[0008a444]                           dc.w $0002
_34aEDIT_BEHAVE:
[0008a446] 0001265e                  dc.l edbh_ok
[0008a44a]                           dc.w $0000
[0008a44c]                           dc.w $0000
[0008a44e]                           dc.w $8000
[0008a450]                           dc.w $884f
[0008a452]                           dc.w $0000
[0008a454]                           dc.w $0000
[0008a456]                           dc.w $0000
[0008a458]                           dc.w $0000
[0008a45a]                           dc.w $0000
[0008a45c]                           dc.w $0000
_36_EDIT_BEHAVE:
[0008a45e]                           dc.w $0000
[0008a460]                           dc.w $ffff
[0008a462]                           dc.w $ffff
[0008a464]                           dc.w $0018
[0008a466]                           dc.w $4005
[0008a468]                           dc.w $0010
[0008a46a] 000898c6                  dc.l A_3DBUTTON06
[0008a46e]                           dc.w $0023
[0008a470]                           dc.w $000e
[0008a472]                           dc.w $000c
[0008a474]                           dc.w $0002
_36aEDIT_BEHAVE:
[0008a476] 0001264c                  dc.l edbh_abort
[0008a47a]                           dc.w $0000
[0008a47c]                           dc.w $0000
[0008a47e]                           dc.w $8020
[0008a480]                           dc.w $8841
[0008a482]                           dc.w $0000
[0008a484]                           dc.w $0000
[0008a486]                           dc.w $0000
[0008a488]                           dc.w $0000
[0008a48a]                           dc.w $0000
[0008a48c]                           dc.w $0000
EDIT_MAINMOD:
[0008a48e]                           dc.w $ffff
[0008a490]                           dc.w $0001
[0008a492]                           dc.w $0060
[0008a494]                           dc.w $0018
[0008a496]                           dc.w $0000
[0008a498]                           dc.w $0010
[0008a49a] 000898a6                  dc.l A_3DBUTTON05
[0008a49e]                           dc.w $0000
[0008a4a0]                           dc.w $0000
[0008a4a2]                           dc.w $0047
[0008a4a4]                           dc.w $001e
_01_EDIT_MAINMOD:
[0008a4a6]                           dc.w $0003
[0008a4a8]                           dc.w $ffff
[0008a4aa]                           dc.w $ffff
[0008a4ac]                           dc.w $0018
[0008a4ae]                           dc.w $0041
[0008a4b0]                           dc.w $0001
[0008a4b2] 00089c06                  dc.l A_CHECKBOX15
[0008a4b6]                           dc.w $0001
[0008a4b8]                           dc.w $0000
[0008a4ba]                           dc.w $0018
[0008a4bc]                           dc.w $0002
_01aEDIT_MAINMOD:
[0008a4be] 00013ec8                  dc.l edmm_ismain
[0008a4c2]                           dc.w $0000
[0008a4c4]                           dc.w $0000
[0008a4c6]                           dc.w $8000
[0008a4c8]                           dc.w $8848
[0008a4ca]                           dc.w $0000
[0008a4cc]                           dc.w $0000
[0008a4ce]                           dc.w $0000
[0008a4d0]                           dc.w $0000
[0008a4d2]                           dc.w $0000
[0008a4d4]                           dc.w $0000
_03_EDIT_MAINMOD:
[0008a4d6]                           dc.w $000c
[0008a4d8]                           dc.w $0004
[0008a4da]                           dc.w $000a
[0008a4dc]                           dc.w $0018
[0008a4de]                           dc.w $0040
[0008a4e0]                           dc.w $0000
[0008a4e2] 00089f26                  dc.l A_INNERFRAME11
[0008a4e6]                           dc.w $0030
[0008a4e8]                           dc.w $0001
[0008a4ea]                           dc.w $0017
[0008a4ec]                           dc.w $0006
_04_EDIT_MAINMOD:
[0008a4ee]                           dc.w $0006
[0008a4f0]                           dc.w $ffff
[0008a4f2]                           dc.w $ffff
[0008a4f4]                           dc.w $0018
[0008a4f6]                           dc.w $0041
[0008a4f8]                           dc.w $0001
[0008a4fa] 00089c46                  dc.l A_CHECKBOX17
[0008a4fe]                           dc.w $0001
[0008a500]                           dc.w $0001
[0008a502]                           dc.w $0007
[0008a504]                           dc.w $0001
_04aEDIT_MAINMOD:
[0008a506] 00013ede                  dc.l edmm_init_olga
[0008a50a]                           dc.w $0000
[0008a50c]                           dc.w $0000
[0008a50e]                           dc.w $8000
[0008a510]                           dc.w $884f
[0008a512]                           dc.w $0000
[0008a514]                           dc.w $0000
[0008a516]                           dc.w $0000
[0008a518]                           dc.w $0000
[0008a51a]                           dc.w $0000
[0008a51c]                           dc.w $0000
_06_EDIT_MAINMOD:
[0008a51e]                           dc.w $0008
[0008a520]                           dc.w $ffff
[0008a522]                           dc.w $ffff
[0008a524]                           dc.w $0018
[0008a526]                           dc.w $0001
[0008a528]                           dc.w $0001
[0008a52a] 00089c86                  dc.l A_CHECKBOX19
[0008a52e]                           dc.w $0001
[0008a530]                           dc.w $0003
[0008a532]                           dc.w $000c
[0008a534]                           dc.w $0001
_06aEDIT_MAINMOD:
[0008a536]                           dc.w $0000
[0008a538]                           dc.w $0000
[0008a53a]                           dc.w $0000
[0008a53c]                           dc.w $0000
[0008a53e]                           dc.w $8000
[0008a540]                           dc.w $8853
[0008a542]                           dc.w $0000
[0008a544]                           dc.w $0000
[0008a546]                           dc.w $0000
[0008a548]                           dc.w $0000
[0008a54a]                           dc.w $0000
[0008a54c]                           dc.w $0000
_08_EDIT_MAINMOD:
[0008a54e]                           dc.w $000a
[0008a550]                           dc.w $ffff
[0008a552]                           dc.w $ffff
[0008a554]                           dc.w $0018
[0008a556]                           dc.w $0001
[0008a558]                           dc.w $0001
[0008a55a] 00089ca6                  dc.l A_CHECKBOX20
[0008a55e]                           dc.w $0001
[0008a560]                           dc.w $0004
[0008a562]                           dc.w $000c
[0008a564]                           dc.w $0001
_08aEDIT_MAINMOD:
[0008a566]                           dc.w $0000
[0008a568]                           dc.w $0000
[0008a56a]                           dc.w $0000
[0008a56c]                           dc.w $0000
[0008a56e]                           dc.w $8000
[0008a570]                           dc.w $8842
[0008a572]                           dc.w $0000
[0008a574]                           dc.w $0000
[0008a576]                           dc.w $0000
[0008a578]                           dc.w $0000
[0008a57a]                           dc.w $0000
[0008a57c]                           dc.w $0000
_10_EDIT_MAINMOD:
[0008a57e]                           dc.w $0003
[0008a580]                           dc.w $ffff
[0008a582]                           dc.w $ffff
[0008a584]                           dc.w $0018
[0008a586]                           dc.w $0001
[0008a588]                           dc.w $0000
[0008a58a] 00089c66                  dc.l A_CHECKBOX18
[0008a58e]                           dc.w $0004
[0008a590]                           dc.w $0002
[0008a592]                           dc.w $0009
[0008a594]                           dc.w $0001
_10aEDIT_MAINMOD:
[0008a596]                           dc.w $0000
[0008a598]                           dc.w $0000
[0008a59a]                           dc.w $0000
[0008a59c]                           dc.w $0000
[0008a59e]                           dc.w $8000
[0008a5a0]                           dc.w $8857
[0008a5a2]                           dc.w $0000
[0008a5a4]                           dc.w $0000
[0008a5a6]                           dc.w $0000
[0008a5a8]                           dc.w $0000
[0008a5aa]                           dc.w $0000
[0008a5ac]                           dc.w $0000
_12_EDIT_MAINMOD:
[0008a5ae]                           dc.w $0019
[0008a5b0]                           dc.w $000d
[0008a5b2]                           dc.w $0017
[0008a5b4]                           dc.w $0018
[0008a5b6]                           dc.w $0000
[0008a5b8]                           dc.w $0000
[0008a5ba] 00089e46                  dc.l A_INNERFRAME04
[0008a5be]                           dc.w $0000
[0008a5c0]                           dc.w $0002
[0008a5c2]                           dc.w $0030
[0008a5c4]                           dc.w $0005
_13_EDIT_MAINMOD:
[0008a5c6]                           dc.w $000e
[0008a5c8]                           dc.w $ffff
[0008a5ca]                           dc.w $ffff
[0008a5cc]                           dc.w $001c
[0008a5ce]                           dc.w $0000
[0008a5d0]                           dc.w $0000
[0008a5d2] 00089185                  dc.l TEXT_22
[0008a5d6]                           dc.w $0001
[0008a5d8]                           dc.w $0001
[0008a5da]                           dc.w $000c
[0008a5dc]                           dc.w $0001
_14_EDIT_MAINMOD:
[0008a5de]                           dc.w $0015
[0008a5e0]                           dc.w $000f
[0008a5e2]                           dc.w $000f
[0008a5e4]                           dc.w $0018
[0008a5e6]                           dc.w $0000
[0008a5e8]                           dc.w $0000
[0008a5ea] 00089826                  dc.l A_3DBUTTON01
[0008a5ee]                           dc.w $000e
[0008a5f0]                           dc.w $0001
[0008a5f2]                           dc.w $0020
[0008a5f4]                           dc.w $0003
_15_EDIT_MAINMOD:
[0008a5f6]                           dc.w $000e
[0008a5f8]                           dc.w $0010
[0008a5fa]                           dc.w $0013
[0008a5fc]                           dc.w $0014
[0008a5fe]                           dc.w $0000
[0008a600]                           dc.w $0000
[0008a602]                           dc.w $00ff
[0008a604]                           dc.w $0101
[0008a606]                           dc.w $0000
[0008a608]                           dc.w $0000
[0008a60a]                           dc.w $0020
[0008a60c]                           dc.w $0003
_16_EDIT_MAINMOD:
[0008a60e]                           dc.w $0011
[0008a610]                           dc.w $ffff
[0008a612]                           dc.w $ffff
[0008a614]                           dc.w $0018
[0008a616]                           dc.w $0008
[0008a618]                           dc.w $0000
[0008a61a] 00089a26                  dc.l A_BOXED05
[0008a61e]                           dc.w $0000
[0008a620]                           dc.w $0000
[0008a622]                           dc.w $001e
[0008a624]                           dc.w $0001
_17_EDIT_MAINMOD:
[0008a626]                           dc.w $0013
[0008a628]                           dc.w $ffff
[0008a62a]                           dc.w $ffff
[0008a62c]                           dc.w $0018
[0008a62e]                           dc.w $1008
[0008a630]                           dc.w $0000
[0008a632] 000899c6                  dc.l A_BOXED02
[0008a636]                           dc.w $0000
[0008a638]                           dc.w $0001
[0008a63a]                           dc.w $0020
[0008a63c]                           dc.w $0001
_17aEDIT_MAINMOD:
[0008a63e]                           dc.w $0000
[0008a640]                           dc.w $0000
[0008a642] 00012540                  dc.l edbh_wi
[0008a646]                           dc.w $8000
[0008a648]                           dc.w $0000
[0008a64a]                           dc.w $0000
[0008a64c]                           dc.w $0000
[0008a64e]                           dc.w $0000
[0008a650]                           dc.w $0000
[0008a652]                           dc.w $0000
[0008a654]                           dc.w $0000
_19_EDIT_MAINMOD:
[0008a656]                           dc.w $000f
[0008a658]                           dc.w $ffff
[0008a65a]                           dc.w $ffff
[0008a65c]                           dc.w $0018
[0008a65e]                           dc.w $1008
[0008a660]                           dc.w $0000
[0008a662] 000899c6                  dc.l A_BOXED02
[0008a666]                           dc.w $0000
[0008a668]                           dc.w $0002
[0008a66a]                           dc.w $0020
[0008a66c]                           dc.w $0001
_19aEDIT_MAINMOD:
[0008a66e]                           dc.w $0000
[0008a670]                           dc.w $0000
[0008a672] 00012540                  dc.l edbh_wi
[0008a676]                           dc.w $8000
[0008a678]                           dc.w $0000
[0008a67a]                           dc.w $0000
[0008a67c]                           dc.w $0000
[0008a67e]                           dc.w $0000
[0008a680]                           dc.w $0000
[0008a682]                           dc.w $0000
[0008a684]                           dc.w $0000
_21_EDIT_MAINMOD:
[0008a686]                           dc.w $0017
[0008a688]                           dc.w $ffff
[0008a68a]                           dc.w $ffff
[0008a68c]                           dc.w $001c
[0008a68e]                           dc.w $0040
[0008a690]                           dc.w $0000
[0008a692] 00089178                  dc.l TEXT_21
[0008a696]                           dc.w $0001
[0008a698]                           dc.w $0002
[0008a69a]                           dc.w $000c
[0008a69c]                           dc.w $0001
_21aEDIT_MAINMOD:
[0008a69e] 00012604                  dc.l edbh_list
[0008a6a2]                           dc.w $0000
[0008a6a4]                           dc.w $0000
[0008a6a6]                           dc.w $8000
[0008a6a8]                           dc.w $0000
[0008a6aa]                           dc.w $0000
[0008a6ac]                           dc.w $0000
[0008a6ae]                           dc.w $0000
[0008a6b0]                           dc.w $0000
[0008a6b2]                           dc.w $0000
[0008a6b4]                           dc.w $0000
_23_EDIT_MAINMOD:
[0008a6b6]                           dc.w $000c
[0008a6b8]                           dc.w $ffff
[0008a6ba]                           dc.w $ffff
[0008a6bc]                           dc.w $001c
[0008a6be]                           dc.w $0040
[0008a6c0]                           dc.w $0000
[0008a6c2] 000890a4                  dc.l TEXT_111
[0008a6c6]                           dc.w $0002
[0008a6c8]                           dc.w $0003
[0008a6ca]                           dc.w $000b
[0008a6cc]                           dc.w $0001
_23aEDIT_MAINMOD:
[0008a6ce] 00012604                  dc.l edbh_list
[0008a6d2]                           dc.w $0000
[0008a6d4]                           dc.w $0000
[0008a6d6]                           dc.w $8000
[0008a6d8]                           dc.w $0000
[0008a6da]                           dc.w $0000
[0008a6dc]                           dc.w $0000
[0008a6de]                           dc.w $0000
[0008a6e0]                           dc.w $0000
[0008a6e2]                           dc.w $0000
[0008a6e4]                           dc.w $0000
_25_EDIT_MAINMOD:
[0008a6e6]                           dc.w $0023
[0008a6e8]                           dc.w $001a
[0008a6ea]                           dc.w $0021
[0008a6ec]                           dc.w $0018
[0008a6ee]                           dc.w $0000
[0008a6f0]                           dc.w $0000
[0008a6f2] 00089ea6                  dc.l A_INNERFRAME07
[0008a6f6]                           dc.w $0000
[0008a6f8]                           dc.w $0007
[0008a6fa]                           dc.w $0030
[0008a6fc]                           dc.w $0006
_26_EDIT_MAINMOD:
[0008a6fe]                           dc.w $001b
[0008a700]                           dc.w $ffff
[0008a702]                           dc.w $ffff
[0008a704]                           dc.w $001c
[0008a706]                           dc.w $0000
[0008a708]                           dc.w $0000
[0008a70a] 000891ea                  dc.l TEXT_27
[0008a70e]                           dc.w $0001
[0008a710]                           dc.w $0001
[0008a712]                           dc.w $0008
[0008a714]                           dc.w $0001
_27_EDIT_MAINMOD:
[0008a716]                           dc.w $001f
[0008a718]                           dc.w $001c
[0008a71a]                           dc.w $001c
[0008a71c]                           dc.w $0018
[0008a71e]                           dc.w $0000
[0008a720]                           dc.w $0000
[0008a722] 00089926                  dc.l A_3DBUTTON09
[0008a726]                           dc.w $000e
[0008a728]                           dc.w $0001
[0008a72a]                           dc.w $0020
[0008a72c]                           dc.w $0002
_28_EDIT_MAINMOD:
[0008a72e]                           dc.w $001b
[0008a730]                           dc.w $001d
[0008a732]                           dc.w $001e
[0008a734]                           dc.w $0014
[0008a736]                           dc.w $0000
[0008a738]                           dc.w $0000
[0008a73a]                           dc.w $0000
[0008a73c]                           dc.w $1101
[0008a73e]                           dc.w $0000
[0008a740]                           dc.w $0000
[0008a742]                           dc.w $0020
[0008a744]                           dc.w $0002
_29_EDIT_MAINMOD:
[0008a746]                           dc.w $001e
[0008a748]                           dc.w $ffff
[0008a74a]                           dc.w $ffff
[0008a74c]                           dc.w $0018
[0008a74e]                           dc.w $0008
[0008a750]                           dc.w $0000
[0008a752] 00089a06                  dc.l A_BOXED04
[0008a756]                           dc.w $0000
[0008a758]                           dc.w $0000
[0008a75a]                           dc.w $0020
[0008a75c]                           dc.w $0001
_30_EDIT_MAINMOD:
[0008a75e]                           dc.w $001c
[0008a760]                           dc.w $ffff
[0008a762]                           dc.w $ffff
[0008a764]                           dc.w $0018
[0008a766]                           dc.w $0008
[0008a768]                           dc.w $0000
[0008a76a] 00089a06                  dc.l A_BOXED04
[0008a76e]                           dc.w $0000
[0008a770]                           dc.w $0001
[0008a772]                           dc.w $0020
[0008a774]                           dc.w $0001
_31_EDIT_MAINMOD:
[0008a776]                           dc.w $0020
[0008a778]                           dc.w $ffff
[0008a77a]                           dc.w $ffff
[0008a77c]                           dc.w $001c
[0008a77e]                           dc.w $0000
[0008a780]                           dc.w $0000
[0008a782] 000891f3                  dc.l TEXT_28
[0008a786]                           dc.w $0001
[0008a788]                           dc.w $0002
[0008a78a]                           dc.w $0007
[0008a78c]                           dc.w $0001
_32_EDIT_MAINMOD:
[0008a78e]                           dc.w $0021
[0008a790]                           dc.w $ffff
[0008a792]                           dc.w $ffff
[0008a794]                           dc.w $001c
[0008a796]                           dc.w $0000
[0008a798]                           dc.w $0000
[0008a79a] 000892ee                  dc.l TEXT_44
[0008a79e]                           dc.w $0001
[0008a7a0]                           dc.w $0004
[0008a7a2]                           dc.w $0008
[0008a7a4]                           dc.w $0001
_33_EDIT_MAINMOD:
[0008a7a6]                           dc.w $0019
[0008a7a8]                           dc.w $ffff
[0008a7aa]                           dc.w $ffff
[0008a7ac]                           dc.w $0018
[0008a7ae]                           dc.w $0040
[0008a7b0]                           dc.w $0030
[0008a7b2] 00089dc6                  dc.l A_CYCLE04
[0008a7b6]                           dc.w $000e
[0008a7b8]                           dc.w $0004
[0008a7ba]                           dc.w $0020
[0008a7bc]                           dc.w $0001
_33aEDIT_MAINMOD:
[0008a7be] 00067ca4                  dc.l Aus_cycle
[0008a7c2]                           dc.w $0000
[0008a7c4]                           dc.w $0000
[0008a7c6]                           dc.w $8000
[0008a7c8]                           dc.w $0000
[0008a7ca]                           dc.w $0000
[0008a7cc]                           dc.w $0000
[0008a7ce]                           dc.w $0000
[0008a7d0]                           dc.w $0000
[0008a7d2]                           dc.w $0000
[0008a7d4]                           dc.w $0000
_35_EDIT_MAINMOD:
[0008a7d6]                           dc.w $003a
[0008a7d8]                           dc.w $0024
[0008a7da]                           dc.w $0038
[0008a7dc]                           dc.w $0018
[0008a7de]                           dc.w $0000
[0008a7e0]                           dc.w $0000
[0008a7e2] 00089de6                  dc.l A_INNERFRAME01
[0008a7e6]                           dc.w $0030
[0008a7e8]                           dc.w $0007
[0008a7ea]                           dc.w $0017
[0008a7ec]                           dc.w $000d
_36_EDIT_MAINMOD:
[0008a7ee]                           dc.w $0026
[0008a7f0]                           dc.w $ffff
[0008a7f2]                           dc.w $ffff
[0008a7f4]                           dc.w $0018
[0008a7f6]                           dc.w $0001
[0008a7f8]                           dc.w $0001
[0008a7fa] 00089ac6                  dc.l A_CHECKBOX05
[0008a7fe]                           dc.w $0001
[0008a800]                           dc.w $0001
[0008a802]                           dc.w $0011
[0008a804]                           dc.w $0001
_36aEDIT_MAINMOD:
[0008a806]                           dc.w $0000
[0008a808]                           dc.w $0000
[0008a80a]                           dc.w $0000
[0008a80c]                           dc.w $0000
[0008a80e]                           dc.w $8000
[0008a810]                           dc.w $8850
[0008a812]                           dc.w $0000
[0008a814]                           dc.w $0000
[0008a816]                           dc.w $0000
[0008a818]                           dc.w $0000
[0008a81a]                           dc.w $0000
[0008a81c]                           dc.w $0000
_38_EDIT_MAINMOD:
[0008a81e]                           dc.w $0028
[0008a820]                           dc.w $ffff
[0008a822]                           dc.w $ffff
[0008a824]                           dc.w $0018
[0008a826]                           dc.w $0001
[0008a828]                           dc.w $0001
[0008a82a] 00089a86                  dc.l A_CHECKBOX03
[0008a82e]                           dc.w $0001
[0008a830]                           dc.w $0003
[0008a832]                           dc.w $0011
[0008a834]                           dc.w $0001
_38aEDIT_MAINMOD:
[0008a836]                           dc.w $0000
[0008a838]                           dc.w $0000
[0008a83a]                           dc.w $0000
[0008a83c]                           dc.w $0000
[0008a83e]                           dc.w $8000
[0008a840]                           dc.w $8856
[0008a842]                           dc.w $0000
[0008a844]                           dc.w $0000
[0008a846]                           dc.w $0000
[0008a848]                           dc.w $0000
[0008a84a]                           dc.w $0000
[0008a84c]                           dc.w $0000
_40_EDIT_MAINMOD:
[0008a84e]                           dc.w $002a
[0008a850]                           dc.w $ffff
[0008a852]                           dc.w $ffff
[0008a854]                           dc.w $0018
[0008a856]                           dc.w $0001
[0008a858]                           dc.w $0001
[0008a85a] 00089aa6                  dc.l A_CHECKBOX04
[0008a85e]                           dc.w $0001
[0008a860]                           dc.w $0004
[0008a862]                           dc.w $0013
[0008a864]                           dc.w $0001
_40aEDIT_MAINMOD:
[0008a866]                           dc.w $0000
[0008a868]                           dc.w $0000
[0008a86a]                           dc.w $0000
[0008a86c]                           dc.w $0000
[0008a86e]                           dc.w $8000
[0008a870]                           dc.w $8846
[0008a872]                           dc.w $0000
[0008a874]                           dc.w $0000
[0008a876]                           dc.w $0000
[0008a878]                           dc.w $0000
[0008a87a]                           dc.w $0000
[0008a87c]                           dc.w $0000
_42_EDIT_MAINMOD:
[0008a87e]                           dc.w $002c
[0008a880]                           dc.w $ffff
[0008a882]                           dc.w $ffff
[0008a884]                           dc.w $0018
[0008a886]                           dc.w $0001
[0008a888]                           dc.w $0001
[0008a88a] 00089b26                  dc.l A_CHECKBOX08
[0008a88e]                           dc.w $0001
[0008a890]                           dc.w $0005
[0008a892]                           dc.w $0013
[0008a894]                           dc.w $0001
_42aEDIT_MAINMOD:
[0008a896]                           dc.w $0000
[0008a898]                           dc.w $0000
[0008a89a]                           dc.w $0000
[0008a89c]                           dc.w $0000
[0008a89e]                           dc.w $8000
[0008a8a0]                           dc.w $885a
[0008a8a2]                           dc.w $0000
[0008a8a4]                           dc.w $0000
[0008a8a6]                           dc.w $0000
[0008a8a8]                           dc.w $0000
[0008a8aa]                           dc.w $0000
[0008a8ac]                           dc.w $0000
_44_EDIT_MAINMOD:
[0008a8ae]                           dc.w $002e
[0008a8b0]                           dc.w $ffff
[0008a8b2]                           dc.w $ffff
[0008a8b4]                           dc.w $0018
[0008a8b6]                           dc.w $0001
[0008a8b8]                           dc.w $0001
[0008a8ba] 00089b46                  dc.l A_CHECKBOX09
[0008a8be]                           dc.w $0001
[0008a8c0]                           dc.w $0006
[0008a8c2]                           dc.w $0012
[0008a8c4]                           dc.w $0001
_44aEDIT_MAINMOD:
[0008a8c6]                           dc.w $0000
[0008a8c8]                           dc.w $0000
[0008a8ca]                           dc.w $0000
[0008a8cc]                           dc.w $0000
[0008a8ce]                           dc.w $8000
[0008a8d0]                           dc.w $884c
[0008a8d2]                           dc.w $0000
[0008a8d4]                           dc.w $0000
[0008a8d6]                           dc.w $0000
[0008a8d8]                           dc.w $0000
[0008a8da]                           dc.w $0000
[0008a8dc]                           dc.w $0000
_46_EDIT_MAINMOD:
[0008a8de]                           dc.w $0030
[0008a8e0]                           dc.w $ffff
[0008a8e2]                           dc.w $ffff
[0008a8e4]                           dc.w $0018
[0008a8e6]                           dc.w $0001
[0008a8e8]                           dc.w $0001
[0008a8ea] 00089b06                  dc.l A_CHECKBOX07
[0008a8ee]                           dc.w $0001
[0008a8f0]                           dc.w $0007
[0008a8f2]                           dc.w $0015
[0008a8f4]                           dc.w $0001
_46aEDIT_MAINMOD:
[0008a8f6]                           dc.w $0000
[0008a8f8]                           dc.w $0000
[0008a8fa]                           dc.w $0000
[0008a8fc]                           dc.w $0000
[0008a8fe]                           dc.w $8000
[0008a900]                           dc.w $8854
[0008a902]                           dc.w $0000
[0008a904]                           dc.w $0000
[0008a906]                           dc.w $0000
[0008a908]                           dc.w $0000
[0008a90a]                           dc.w $0000
[0008a90c]                           dc.w $0000
_48_EDIT_MAINMOD:
[0008a90e]                           dc.w $0032
[0008a910]                           dc.w $ffff
[0008a912]                           dc.w $ffff
[0008a914]                           dc.w $0018
[0008a916]                           dc.w $0001
[0008a918]                           dc.w $0001
[0008a91a] 00089c26                  dc.l A_CHECKBOX16
[0008a91e]                           dc.w $0001
[0008a920]                           dc.w $0008
[0008a922]                           dc.w $0011
[0008a924]                           dc.w $0001
_48aEDIT_MAINMOD:
[0008a926]                           dc.w $0000
[0008a928]                           dc.w $0000
[0008a92a]                           dc.w $0000
[0008a92c]                           dc.w $0000
[0008a92e]                           dc.w $8000
[0008a930]                           dc.w $8844
[0008a932]                           dc.w $0000
[0008a934]                           dc.w $0000
[0008a936]                           dc.w $0000
[0008a938]                           dc.w $0000
[0008a93a]                           dc.w $0000
[0008a93c]                           dc.w $0000
_50_EDIT_MAINMOD:
[0008a93e]                           dc.w $0034
[0008a940]                           dc.w $ffff
[0008a942]                           dc.w $ffff
[0008a944]                           dc.w $0018
[0008a946]                           dc.w $0001
[0008a948]                           dc.w $0001
[0008a94a] 00089cc6                  dc.l A_CHECKBOX21
[0008a94e]                           dc.w $0001
[0008a950]                           dc.w $0002
[0008a952]                           dc.w $0015
[0008a954]                           dc.w $0001
_50aEDIT_MAINMOD:
[0008a956]                           dc.w $0000
[0008a958]                           dc.w $0000
[0008a95a]                           dc.w $0000
[0008a95c]                           dc.w $0000
[0008a95e]                           dc.w $8000
[0008a960]                           dc.w $8849
[0008a962]                           dc.w $0000
[0008a964]                           dc.w $0000
[0008a966]                           dc.w $0000
[0008a968]                           dc.w $0000
[0008a96a]                           dc.w $0000
[0008a96c]                           dc.w $0000
_52_EDIT_MAINMOD:
[0008a96e]                           dc.w $0036
[0008a970]                           dc.w $ffff
[0008a972]                           dc.w $ffff
[0008a974]                           dc.w $0018
[0008a976]                           dc.w $0001
[0008a978]                           dc.w $0001
[0008a97a] 00089ce6                  dc.l A_CHECKBOX22
[0008a97e]                           dc.w $0001
[0008a980]                           dc.w $0009
[0008a982]                           dc.w $000f
[0008a984]                           dc.w $0001
_52aEDIT_MAINMOD:
[0008a986]                           dc.w $0000
[0008a988]                           dc.w $0000
[0008a98a]                           dc.w $0000
[0008a98c]                           dc.w $0000
[0008a98e]                           dc.w $8000
[0008a990]                           dc.w $8845
[0008a992]                           dc.w $0000
[0008a994]                           dc.w $0000
[0008a996]                           dc.w $0000
[0008a998]                           dc.w $0000
[0008a99a]                           dc.w $0000
[0008a99c]                           dc.w $0000
_54_EDIT_MAINMOD:
[0008a99e]                           dc.w $0038
[0008a9a0]                           dc.w $ffff
[0008a9a2]                           dc.w $ffff
[0008a9a4]                           dc.w $0018
[0008a9a6]                           dc.w $0001
[0008a9a8]                           dc.w $0001
[0008a9aa] 00089d06                  dc.l A_CHECKBOX23
[0008a9ae]                           dc.w $0001
[0008a9b0]                           dc.w $000a
[0008a9b2]                           dc.w $0014
[0008a9b4]                           dc.w $0001
_54aEDIT_MAINMOD:
[0008a9b6]                           dc.w $0000
[0008a9b8]                           dc.w $0000
[0008a9ba]                           dc.w $0000
[0008a9bc]                           dc.w $0000
[0008a9be]                           dc.w $8000
[0008a9c0]                           dc.w $8843
[0008a9c2]                           dc.w $0000
[0008a9c4]                           dc.w $0000
[0008a9c6]                           dc.w $0000
[0008a9c8]                           dc.w $0000
[0008a9ca]                           dc.w $0000
[0008a9cc]                           dc.w $0000
_56_EDIT_MAINMOD:
[0008a9ce]                           dc.w $0023
[0008a9d0]                           dc.w $ffff
[0008a9d2]                           dc.w $ffff
[0008a9d4]                           dc.w $0018
[0008a9d6]                           dc.w $0001
[0008a9d8]                           dc.w $0001
[0008a9da] 00089d26                  dc.l A_CHECKBOX24
[0008a9de]                           dc.w $0001
[0008a9e0]                           dc.w $000b
[0008a9e2]                           dc.w $0013
[0008a9e4]                           dc.w $0001
_56aEDIT_MAINMOD:
[0008a9e6]                           dc.w $0000
[0008a9e8]                           dc.w $0000
[0008a9ea]                           dc.w $0000
[0008a9ec]                           dc.w $0000
[0008a9ee]                           dc.w $8000
[0008a9f0]                           dc.w $884d
[0008a9f2]                           dc.w $0000
[0008a9f4]                           dc.w $0000
[0008a9f6]                           dc.w $0000
[0008a9f8]                           dc.w $0000
[0008a9fa]                           dc.w $0000
[0008a9fc]                           dc.w $0000
_58_EDIT_MAINMOD:
[0008a9fe]                           dc.w $0047
[0008aa00]                           dc.w $003b
[0008aa02]                           dc.w $0046
[0008aa04]                           dc.w $0018
[0008aa06]                           dc.w $0000
[0008aa08]                           dc.w $0000
[0008aa0a] 00089f06                  dc.l A_INNERFRAME10
[0008aa0e]                           dc.w $0000
[0008aa10]                           dc.w $000d
[0008aa12]                           dc.w $0030
[0008aa14]                           dc.w $0007
_59_EDIT_MAINMOD:
[0008aa16]                           dc.w $003c
[0008aa18]                           dc.w $ffff
[0008aa1a]                           dc.w $ffff
[0008aa1c]                           dc.w $001c
[0008aa1e]                           dc.w $0000
[0008aa20]                           dc.w $0000
[0008aa22] 00089203                  dc.l TEXT_30
[0008aa26]                           dc.w $0001
[0008aa28]                           dc.w $0001
[0008aa2a]                           dc.w $000a
[0008aa2c]                           dc.w $0001
_60_EDIT_MAINMOD:
[0008aa2e]                           dc.w $0043
[0008aa30]                           dc.w $003d
[0008aa32]                           dc.w $003d
[0008aa34]                           dc.w $0018
[0008aa36]                           dc.w $0000
[0008aa38]                           dc.w $0000
[0008aa3a] 00089986                  dc.l A_3DBUTTON12
[0008aa3e]                           dc.w $000e
[0008aa40]                           dc.w $0001
[0008aa42]                           dc.w $0020
[0008aa44]                           dc.w $0005
_61_EDIT_MAINMOD:
[0008aa46]                           dc.w $003c
[0008aa48]                           dc.w $003e
[0008aa4a]                           dc.w $0042
[0008aa4c]                           dc.w $0014
[0008aa4e]                           dc.w $0000
[0008aa50]                           dc.w $0000
[0008aa52]                           dc.w $0000
[0008aa54]                           dc.w $1101
[0008aa56]                           dc.w $0000
[0008aa58]                           dc.w $0000
[0008aa5a]                           dc.w $0020
[0008aa5c]                           dc.w $0005
_62_EDIT_MAINMOD:
[0008aa5e]                           dc.w $003f
[0008aa60]                           dc.w $ffff
[0008aa62]                           dc.w $ffff
[0008aa64]                           dc.w $0018
[0008aa66]                           dc.w $0008
[0008aa68]                           dc.w $0000
[0008aa6a] 00089a06                  dc.l A_BOXED04
[0008aa6e]                           dc.w $0000
[0008aa70]                           dc.w $0000
[0008aa72]                           dc.w $0020
[0008aa74]                           dc.w $0001
_63_EDIT_MAINMOD:
[0008aa76]                           dc.w $0040
[0008aa78]                           dc.w $ffff
[0008aa7a]                           dc.w $ffff
[0008aa7c]                           dc.w $0018
[0008aa7e]                           dc.w $0008
[0008aa80]                           dc.w $0000
[0008aa82] 00089a06                  dc.l A_BOXED04
[0008aa86]                           dc.w $0000
[0008aa88]                           dc.w $0001
[0008aa8a]                           dc.w $0020
[0008aa8c]                           dc.w $0001
_64_EDIT_MAINMOD:
[0008aa8e]                           dc.w $0041
[0008aa90]                           dc.w $ffff
[0008aa92]                           dc.w $ffff
[0008aa94]                           dc.w $0018
[0008aa96]                           dc.w $0008
[0008aa98]                           dc.w $0000
[0008aa9a] 00089a06                  dc.l A_BOXED04
[0008aa9e]                           dc.w $0000
[0008aaa0]                           dc.w $0002
[0008aaa2]                           dc.w $0020
[0008aaa4]                           dc.w $0001
_65_EDIT_MAINMOD:
[0008aaa6]                           dc.w $0042
[0008aaa8]                           dc.w $ffff
[0008aaaa]                           dc.w $ffff
[0008aaac]                           dc.w $0018
[0008aaae]                           dc.w $0008
[0008aab0]                           dc.w $0000
[0008aab2] 00089a06                  dc.l A_BOXED04
[0008aab6]                           dc.w $0000
[0008aab8]                           dc.w $0003
[0008aaba]                           dc.w $0020
[0008aabc]                           dc.w $0001
_66_EDIT_MAINMOD:
[0008aabe]                           dc.w $003d
[0008aac0]                           dc.w $ffff
[0008aac2]                           dc.w $ffff
[0008aac4]                           dc.w $0018
[0008aac6]                           dc.w $0008
[0008aac8]                           dc.w $0000
[0008aaca] 00089a06                  dc.l A_BOXED04
[0008aace]                           dc.w $0000
[0008aad0]                           dc.w $0004
[0008aad2]                           dc.w $0020
[0008aad4]                           dc.w $0001
_67_EDIT_MAINMOD:
[0008aad6]                           dc.w $0044
[0008aad8]                           dc.w $ffff
[0008aada]                           dc.w $ffff
[0008aadc]                           dc.w $001c
[0008aade]                           dc.w $0000
[0008aae0]                           dc.w $0000
[0008aae2] 0008920e                  dc.l TEXT_31
[0008aae6]                           dc.w $0001
[0008aae8]                           dc.w $0002
[0008aaea]                           dc.w $0008
[0008aaec]                           dc.w $0001
_68_EDIT_MAINMOD:
[0008aaee]                           dc.w $0045
[0008aaf0]                           dc.w $ffff
[0008aaf2]                           dc.w $ffff
[0008aaf4]                           dc.w $001c
[0008aaf6]                           dc.w $0000
[0008aaf8]                           dc.w $0000
[0008aafa] 00089217                  dc.l TEXT_32
[0008aafe]                           dc.w $0001
[0008ab00]                           dc.w $0003
[0008ab02]                           dc.w $000a
[0008ab04]                           dc.w $0001
_69_EDIT_MAINMOD:
[0008ab06]                           dc.w $0046
[0008ab08]                           dc.w $ffff
[0008ab0a]                           dc.w $ffff
[0008ab0c]                           dc.w $001c
[0008ab0e]                           dc.w $0000
[0008ab10]                           dc.w $0000
[0008ab12] 00089236                  dc.l TEXT_34
[0008ab16]                           dc.w $0001
[0008ab18]                           dc.w $0004
[0008ab1a]                           dc.w $0008
[0008ab1c]                           dc.w $0001
_70_EDIT_MAINMOD:
[0008ab1e]                           dc.w $003a
[0008ab20]                           dc.w $ffff
[0008ab22]                           dc.w $ffff
[0008ab24]                           dc.w $001c
[0008ab26]                           dc.w $0000
[0008ab28]                           dc.w $0000
[0008ab2a] 000891fb                  dc.l TEXT_29
[0008ab2e]                           dc.w $0001
[0008ab30]                           dc.w $0005
[0008ab32]                           dc.w $0007
[0008ab34]                           dc.w $0001
_71_EDIT_MAINMOD:
[0008ab36]                           dc.w $0054
[0008ab38]                           dc.w $0048
[0008ab3a]                           dc.w $0053
[0008ab3c]                           dc.w $0018
[0008ab3e]                           dc.w $0000
[0008ab40]                           dc.w $0000
[0008ab42] 00089ec6                  dc.l A_INNERFRAME08
[0008ab46]                           dc.w $0000
[0008ab48]                           dc.w $0014
[0008ab4a]                           dc.w $0030
[0008ab4c]                           dc.w $0007
_72_EDIT_MAINMOD:
[0008ab4e]                           dc.w $0049
[0008ab50]                           dc.w $ffff
[0008ab52]                           dc.w $ffff
[0008ab54]                           dc.w $001c
[0008ab56]                           dc.w $0000
[0008ab58]                           dc.w $0000
[0008ab5a] 00089222                  dc.l TEXT_33
[0008ab5e]                           dc.w $0001
[0008ab60]                           dc.w $0001
[0008ab62]                           dc.w $0009
[0008ab64]                           dc.w $0001
_73_EDIT_MAINMOD:
[0008ab66]                           dc.w $0050
[0008ab68]                           dc.w $004a
[0008ab6a]                           dc.w $004a
[0008ab6c]                           dc.w $0018
[0008ab6e]                           dc.w $0000
[0008ab70]                           dc.w $0000
[0008ab72] 00089946                  dc.l A_3DBUTTON10
[0008ab76]                           dc.w $000e
[0008ab78]                           dc.w $0001
[0008ab7a]                           dc.w $0020
[0008ab7c]                           dc.w $0005
_74_EDIT_MAINMOD:
[0008ab7e]                           dc.w $0049
[0008ab80]                           dc.w $004b
[0008ab82]                           dc.w $004f
[0008ab84]                           dc.w $0014
[0008ab86]                           dc.w $0000
[0008ab88]                           dc.w $0000
[0008ab8a]                           dc.w $0000
[0008ab8c]                           dc.w $1101
[0008ab8e]                           dc.w $0000
[0008ab90]                           dc.w $0000
[0008ab92]                           dc.w $0020
[0008ab94]                           dc.w $0005
_75_EDIT_MAINMOD:
[0008ab96]                           dc.w $004c
[0008ab98]                           dc.w $ffff
[0008ab9a]                           dc.w $ffff
[0008ab9c]                           dc.w $0018
[0008ab9e]                           dc.w $0008
[0008aba0]                           dc.w $0000
[0008aba2] 00089a06                  dc.l A_BOXED04
[0008aba6]                           dc.w $0000
[0008aba8]                           dc.w $0000
[0008abaa]                           dc.w $0020
[0008abac]                           dc.w $0001
_76_EDIT_MAINMOD:
[0008abae]                           dc.w $004d
[0008abb0]                           dc.w $ffff
[0008abb2]                           dc.w $ffff
[0008abb4]                           dc.w $0018
[0008abb6]                           dc.w $0008
[0008abb8]                           dc.w $0000
[0008abba] 00089a06                  dc.l A_BOXED04
[0008abbe]                           dc.w $0000
[0008abc0]                           dc.w $0001
[0008abc2]                           dc.w $0020
[0008abc4]                           dc.w $0001
_77_EDIT_MAINMOD:
[0008abc6]                           dc.w $004e
[0008abc8]                           dc.w $ffff
[0008abca]                           dc.w $ffff
[0008abcc]                           dc.w $0018
[0008abce]                           dc.w $0008
[0008abd0]                           dc.w $0000
[0008abd2] 00089a06                  dc.l A_BOXED04
[0008abd6]                           dc.w $0000
[0008abd8]                           dc.w $0002
[0008abda]                           dc.w $0020
[0008abdc]                           dc.w $0001
_78_EDIT_MAINMOD:
[0008abde]                           dc.w $004f
[0008abe0]                           dc.w $ffff
[0008abe2]                           dc.w $ffff
[0008abe4]                           dc.w $0018
[0008abe6]                           dc.w $0008
[0008abe8]                           dc.w $0000
[0008abea] 00089a06                  dc.l A_BOXED04
[0008abee]                           dc.w $0000
[0008abf0]                           dc.w $0003
[0008abf2]                           dc.w $0020
[0008abf4]                           dc.w $0001
_79_EDIT_MAINMOD:
[0008abf6]                           dc.w $004a
[0008abf8]                           dc.w $ffff
[0008abfa]                           dc.w $ffff
[0008abfc]                           dc.w $0018
[0008abfe]                           dc.w $0008
[0008ac00]                           dc.w $0000
[0008ac02] 00089a06                  dc.l A_BOXED04
[0008ac06]                           dc.w $0000
[0008ac08]                           dc.w $0004
[0008ac0a]                           dc.w $0020
[0008ac0c]                           dc.w $0001
_80_EDIT_MAINMOD:
[0008ac0e]                           dc.w $0051
[0008ac10]                           dc.w $ffff
[0008ac12]                           dc.w $ffff
[0008ac14]                           dc.w $001c
[0008ac16]                           dc.w $0000
[0008ac18]                           dc.w $0000
[0008ac1a] 00089254                  dc.l TEXT_35
[0008ac1e]                           dc.w $0001
[0008ac20]                           dc.w $0002
[0008ac22]                           dc.w $0006
[0008ac24]                           dc.w $0001
_81_EDIT_MAINMOD:
[0008ac26]                           dc.w $0052
[0008ac28]                           dc.w $ffff
[0008ac2a]                           dc.w $ffff
[0008ac2c]                           dc.w $001c
[0008ac2e]                           dc.w $0000
[0008ac30]                           dc.w $0000
[0008ac32] 0008927f                  dc.l TEXT_38
[0008ac36]                           dc.w $0001
[0008ac38]                           dc.w $0003
[0008ac3a]                           dc.w $0008
[0008ac3c]                           dc.w $0001
_82_EDIT_MAINMOD:
[0008ac3e]                           dc.w $0053
[0008ac40]                           dc.w $ffff
[0008ac42]                           dc.w $ffff
[0008ac44]                           dc.w $001c
[0008ac46]                           dc.w $0000
[0008ac48]                           dc.w $0000
[0008ac4a] 0008926c                  dc.l TEXT_36
[0008ac4e]                           dc.w $0001
[0008ac50]                           dc.w $0004
[0008ac52]                           dc.w $0009
[0008ac54]                           dc.w $0001
_83_EDIT_MAINMOD:
[0008ac56]                           dc.w $0047
[0008ac58]                           dc.w $ffff
[0008ac5a]                           dc.w $ffff
[0008ac5c]                           dc.w $001c
[0008ac5e]                           dc.w $0000
[0008ac60]                           dc.w $0000
[0008ac62] 00089276                  dc.l TEXT_37
[0008ac66]                           dc.w $0001
[0008ac68]                           dc.w $0005
[0008ac6a]                           dc.w $0008
[0008ac6c]                           dc.w $0001
_84_EDIT_MAINMOD:
[0008ac6e]                           dc.w $0059
[0008ac70]                           dc.w $0055
[0008ac72]                           dc.w $0058
[0008ac74]                           dc.w $0018
[0008ac76]                           dc.w $0000
[0008ac78]                           dc.w $0000
[0008ac7a] 00089e26                  dc.l A_INNERFRAME03
[0008ac7e]                           dc.w $0030
[0008ac80]                           dc.w $0014
[0008ac82]                           dc.w $0017
[0008ac84]                           dc.w $0003
_85_EDIT_MAINMOD:
[0008ac86]                           dc.w $0056
[0008ac88]                           dc.w $ffff
[0008ac8a]                           dc.w $ffff
[0008ac8c]                           dc.w $001c
[0008ac8e]                           dc.w $0000
[0008ac90]                           dc.w $0000
[0008ac92] 00088fb1                  dc.l TEXT_014
[0008ac96]                           dc.w $0001
[0008ac98]                           dc.w $0001
[0008ac9a]                           dc.w $0003
[0008ac9c]                           dc.w $0001
_86_EDIT_MAINMOD:
[0008ac9e]                           dc.w $0057
[0008aca0]                           dc.w $ffff
[0008aca2]                           dc.w $ffff
[0008aca4]                           dc.w $0018
[0008aca6]                           dc.w $0008
[0008aca8]                           dc.w $0010
[0008acaa] 000899a6                  dc.l A_BOXED01
[0008acae]                           dc.w $0005
[0008acb0]                           dc.w $0001
[0008acb2]                           dc.w $0005
[0008acb4]                           dc.w $0001
_87_EDIT_MAINMOD:
[0008acb6]                           dc.w $0058
[0008acb8]                           dc.w $ffff
[0008acba]                           dc.w $ffff
[0008acbc]                           dc.w $001c
[0008acbe]                           dc.w $0000
[0008acc0]                           dc.w $0000
[0008acc2] 00088fad                  dc.l TEXT_012
[0008acc6]                           dc.w $000c
[0008acc8]                           dc.w $0001
[0008acca]                           dc.w $0003
[0008accc]                           dc.w $0001
_88_EDIT_MAINMOD:
[0008acce]                           dc.w $0054
[0008acd0]                           dc.w $ffff
[0008acd2]                           dc.w $ffff
[0008acd4]                           dc.w $0018
[0008acd6]                           dc.w $0008
[0008acd8]                           dc.w $0010
[0008acda] 000899a6                  dc.l A_BOXED01
[0008acde]                           dc.w $0010
[0008ace0]                           dc.w $0001
[0008ace2]                           dc.w $0005
[0008ace4]                           dc.w $0001
_89_EDIT_MAINMOD:
[0008ace6]                           dc.w $005b
[0008ace8]                           dc.w $ffff
[0008acea]                           dc.w $ffff
[0008acec]                           dc.w $0018
[0008acee]                           dc.w $4005
[0008acf0]                           dc.w $0000
[0008acf2] 00089906                  dc.l A_3DBUTTON08
[0008acf6]                           dc.w $003b
[0008acf8]                           dc.w $0019
[0008acfa]                           dc.w $000b
[0008acfc]                           dc.w $0002
_89aEDIT_MAINMOD:
[0008acfe] 00013f6e                  dc.l edmm_cancel
[0008ad02]                           dc.w $0000
[0008ad04]                           dc.w $0000
[0008ad06]                           dc.w $8000
[0008ad08]                           dc.w $8841
[0008ad0a]                           dc.w $0000
[0008ad0c]                           dc.w $0000
[0008ad0e]                           dc.w $0000
[0008ad10]                           dc.w $0000
[0008ad12]                           dc.w $0000
[0008ad14]                           dc.w $0000
_91_EDIT_MAINMOD:
[0008ad16]                           dc.w $0060
[0008ad18]                           dc.w $005c
[0008ad1a]                           dc.w $005d
[0008ad1c]                           dc.w $0018
[0008ad1e]                           dc.w $0000
[0008ad20]                           dc.w $0000
[0008ad22] 00089ee6                  dc.l A_INNERFRAME09
[0008ad26]                           dc.w $0000
[0008ad28]                           dc.w $001b
[0008ad2a]                           dc.w $0030
[0008ad2c]                           dc.w $0003
_92_EDIT_MAINMOD:
[0008ad2e]                           dc.w $005d
[0008ad30]                           dc.w $ffff
[0008ad32]                           dc.w $ffff
[0008ad34]                           dc.w $001c
[0008ad36]                           dc.w $0000
[0008ad38]                           dc.w $0000
[0008ad3a] 00089288                  dc.l TEXT_39
[0008ad3e]                           dc.w $0001
[0008ad40]                           dc.w $0001
[0008ad42]                           dc.w $000c
[0008ad44]                           dc.w $0001
_93_EDIT_MAINMOD:
[0008ad46]                           dc.w $005b
[0008ad48]                           dc.w $005e
[0008ad4a]                           dc.w $005e
[0008ad4c]                           dc.w $0018
[0008ad4e]                           dc.w $0000
[0008ad50]                           dc.w $0000
[0008ad52] 00089966                  dc.l A_3DBUTTON11
[0008ad56]                           dc.w $000e
[0008ad58]                           dc.w $0001
[0008ad5a]                           dc.w $0020
[0008ad5c]                           dc.w $0001
_94_EDIT_MAINMOD:
[0008ad5e]                           dc.w $005d
[0008ad60]                           dc.w $005f
[0008ad62]                           dc.w $005f
[0008ad64]                           dc.w $0014
[0008ad66]                           dc.w $0000
[0008ad68]                           dc.w $0000
[0008ad6a]                           dc.w $0000
[0008ad6c]                           dc.w $1101
[0008ad6e]                           dc.w $0000
[0008ad70]                           dc.w $0000
[0008ad72]                           dc.w $0020
[0008ad74]                           dc.w $0001
_95_EDIT_MAINMOD:
[0008ad76]                           dc.w $005e
[0008ad78]                           dc.w $ffff
[0008ad7a]                           dc.w $ffff
[0008ad7c]                           dc.w $0018
[0008ad7e]                           dc.w $0008
[0008ad80]                           dc.w $0000
[0008ad82] 00089a06                  dc.l A_BOXED04
[0008ad86]                           dc.w $0000
[0008ad88]                           dc.w $0000
[0008ad8a]                           dc.w $0020
[0008ad8c]                           dc.w $0001
_96_EDIT_MAINMOD:
[0008ad8e]                           dc.w $0000
[0008ad90]                           dc.w $ffff
[0008ad92]                           dc.w $ffff
[0008ad94]                           dc.w $0018
[0008ad96]                           dc.w $4007
[0008ad98]                           dc.w $0000
[0008ad9a] 000898e6                  dc.l A_3DBUTTON07
[0008ad9e]                           dc.w $003b
[0008ada0]                           dc.w $001b
[0008ada2]                           dc.w $000b
[0008ada4]                           dc.w $0002
_96aEDIT_MAINMOD:
[0008ada6] 00013f38                  dc.l edmm_ok
[0008adaa]                           dc.w $0000
[0008adac]                           dc.w $0000
[0008adae]                           dc.w $8020
[0008adb0]                           dc.w $0000
[0008adb2]                           dc.w $0000
[0008adb4]                           dc.w $0000
[0008adb6]                           dc.w $0000
[0008adb8]                           dc.w $0000
[0008adba]                           dc.w $0000
[0008adbc]                           dc.w $0000
WI_BEHAVE:
[0008adbe]                           dc.w $0000
[0008adc0]                           dc.w $0000
[0008adc2] 00012b50                  dc.l bh_service
[0008adc6] 00012a5e                  dc.l bh_make
[0008adca] 00057428                  dc.l Awi_open
[0008adce] 00055e94                  dc.l Awi_init
[0008add2] 0008a0fe                  dc.l EDIT_BEHAVE
[0008add6]                           dc.w $0000
[0008add8]                           dc.w $0000
[0008adda]                           dc.w $0000
[0008addc]                           dc.w $0000
[0008adde]                           dc.w $ffff
[0008ade0]                           dc.w $601f
[0008ade2]                           dc.w $0000
[0008ade4]                           dc.w $0000
[0008ade6]                           dc.w $0063
[0008ade8]                           dc.w $0063
[0008adea]                           dc.w $0000
[0008adec]                           dc.w $0000
[0008adee]                           dc.w $0000
[0008adf0]                           dc.w $0000
[0008adf2]                           dc.w $0000
[0008adf4]                           dc.w $0000
[0008adf6]                           dc.w $0000
[0008adf8]                           dc.w $0000
[0008adfa]                           dc.w $ffff
[0008adfc]                           dc.w $ffff
[0008adfe]                           dc.w $ffff
[0008ae00]                           dc.w $ffff
[0008ae02]                           dc.w $0000
[0008ae04]                           dc.w $0000
[0008ae06]                           dc.w $fcf8
[0008ae08] 00089050                  dc.l TEXT_10
[0008ae0c] 00088f80                  dc.l TEXT_002
[0008ae10]                           dc.w $2710
[0008ae12]                           dc.w $0100
[0008ae14]                           dc.w $0000
[0008ae16]                           dc.w $ffff
[0008ae18] 0008a0d8                  dc.l IC_BEHAVE
[0008ae1c]                           dc.w $0000
[0008ae1e]                           dc.w $0000
[0008ae20] 0006b744                  dc.l Awi_keys
[0008ae24] 00051852                  dc.l Awi_obchange
[0008ae28] 00051c46                  dc.l Awi_redraw
[0008ae2c] 000587a4                  dc.l Awi_topped
[0008ae30] 00058362                  dc.l Awi_closed
[0008ae34] 000587ec                  dc.l Awi_fulled
[0008ae38] 0005217c                  dc.l Awi_arrowed
[0008ae3c] 000524b4                  dc.l Awi_hslid
[0008ae40] 0005255e                  dc.l Awi_vslid
[0008ae44] 00058bb0                  dc.l Awi_sized
[0008ae48] 00058d50                  dc.l Awi_moved
[0008ae4c] 0005998a                  dc.l Awi_iconify
[0008ae50] 00059c6c                  dc.l Awi_uniconify
[0008ae54] 0005b5b6                  dc.l Awi_gemscript
[0008ae58] 00088f67                  dc.l STGUIDE_02
[0008ae5c]                           dc.w $0000
[0008ae5e]                           dc.w $0000
WI_MAINMOD:
[0008ae60]                           dc.w $0000
[0008ae62]                           dc.w $0000
[0008ae64] 00013e5a                  dc.l edmm_service
[0008ae68] 00013dce                  dc.l edmm_create
[0008ae6c] 00057428                  dc.l Awi_open
[0008ae70] 00055e94                  dc.l Awi_init
[0008ae74] 0008a48e                  dc.l EDIT_MAINMOD
[0008ae78]                           dc.w $0000
[0008ae7a]                           dc.w $0000
[0008ae7c]                           dc.w $0000
[0008ae7e]                           dc.w $0000
[0008ae80]                           dc.w $ffff
[0008ae82]                           dc.w $6fef
[0008ae84]                           dc.w $0000
[0008ae86]                           dc.w $0000
[0008ae88]                           dc.w $0078
[0008ae8a]                           dc.w $0032
[0008ae8c]                           dc.w $0000
[0008ae8e]                           dc.w $0000
[0008ae90]                           dc.w $0000
[0008ae92]                           dc.w $0000
[0008ae94]                           dc.w $0000
[0008ae96]                           dc.w $0000
[0008ae98]                           dc.w $0000
[0008ae9a]                           dc.w $0000
[0008ae9c]                           dc.w $ffff
[0008ae9e]                           dc.w $ffff
[0008aea0]                           dc.w $ffff
[0008aea2]                           dc.w $ffff
[0008aea4]                           dc.w $0000
[0008aea6]                           dc.w $0000
[0008aea8]                           dc.w $f8f8
[0008aeaa] 0008913f                  dc.l TEXT_19
[0008aeae] 00088f80                  dc.l TEXT_002
[0008aeb2]                           dc.w $0000
[0008aeb4]                           dc.w $0100
[0008aeb6]                           dc.w $0000
[0008aeb8]                           dc.w $ffff
[0008aeba]                           dc.w $0000
[0008aebc]                           dc.w $0000
[0008aebe]                           dc.w $0000
[0008aec0]                           dc.w $0000
[0008aec2] 0006b744                  dc.l Awi_keys
[0008aec6] 00051852                  dc.l Awi_obchange
[0008aeca] 00051c46                  dc.l Awi_redraw
[0008aece] 000587a4                  dc.l Awi_topped
[0008aed2] 00058362                  dc.l Awi_closed
[0008aed6] 000587ec                  dc.l Awi_fulled
[0008aeda] 0005217c                  dc.l Awi_arrowed
[0008aede] 000524b4                  dc.l Awi_hslid
[0008aee2] 0005255e                  dc.l Awi_vslid
[0008aee6] 00058bb0                  dc.l Awi_sized
[0008aeea] 00058d50                  dc.l Awi_moved
[0008aeee] 0005998a                  dc.l Awi_iconify
[0008aef2] 00059c6c                  dc.l Awi_uniconify
[0008aef6] 0005b5b6                  dc.l Awi_gemscript
[0008aefa] 00088f51                  dc.l STGUIDE_01
[0008aefe] 00088f4a                  dc.l HELPFILE_01
mlmess:
[0008af02] 000878b9                  dc.l _A_GENERAL
[0008af06] 000878f8                  dc.l _A_GENERAL_STR
[0008af0a] 00087614                  dc.l _A_COLREZ
[0008af0e] 00087689                  dc.l _A_CREATE_IO
[0008af12] 000876c1                  dc.l _A_CREATE_STR
[0008af16] 000876fd                  dc.l _A_DEFECTIVE_MEM
[0008af1a] 00087738                  dc.l _A_ERR_ACC
[0008af1e] 0008778c                  dc.l _A_ERR_MESS
[0008af22] 000877e5                  dc.l _A_ERR_WINDOW
[0008af26] 00087852                  dc.l _A_ERR_WISLOT
[0008af2a] 0008792a                  dc.l _A_GEN_IO
[0008af2e] 00087971                  dc.l _A_GEN_MEM
[0008af32] 000879be                  dc.l _A_GEN_MOD
[0008af36] 000879f8                  dc.l _A_GEN_MOD_STR
[0008af3a] 00087a38                  dc.l _A_LOAD_MOD
[0008af3e] 00087a8c                  dc.l _A_LOAD_MOD_STR
[0008af42] 00087ad8                  dc.l _A_MEM_MOD
[0008af46] 00087b2f                  dc.l _A_MEM_MOD_STR
[0008af4a] 00087b8d                  dc.l _A_ODD_MEM
[0008af4e] 00087bd1                  dc.l _A_OPEN_IO
[0008af52] 00087c0f                  dc.l _A_OPEN_STR
[0008af56] 00087c49                  dc.l _A_OUT_OF_MEM
[0008af5a] 00087c8c                  dc.l _A_PORT
[0008af5e] 00087ccf                  dc.l _A_RANGE_MEM
[0008af62] 00087d23                  dc.l _A_READ_IO
[0008af66] 00087d6d                  dc.l _A_READ_STR
[0008af6a] 00087dbc                  dc.l _A_VER_MOD
[0008af6e] 00087e01                  dc.l _A_VER_MOD_STR
[0008af72] 00087e41                  dc.l _A_WRITE_IO
[0008af76] 00087e8d                  dc.l _A_WRITE_STR
[0008af7a] 00089497                  dc.l _AL_ATT
[0008af7e] 000894a1                  dc.l _AL_QUEST
[0008af82] 000894a9                  dc.l _AL_STOP
[0008af86] 000894b0                  dc.l _AL_TIMER
[0008af8a]                           dc.w $0000
[0008af8c]                           dc.w $0000
[0008af8e]                           dc.w $0000
[0008af90]                           dc.w $0000
[0008af92]                           dc.w $0000
[0008af94]                           dc.w $0000
[0008af96]                           dc.w $0000
[0008af98]                           dc.w $0025
[0008af9a]                           dc.w $6400
[0008af9c]                           dc.w $2564
[0008af9e]                           dc.w $0020
[0008afa0]                           dc.w $2000
[0008afa2]                           dc.b '%3d',0
[0008afa6]                           dc.b '%3d',0

