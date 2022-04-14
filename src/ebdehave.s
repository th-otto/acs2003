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
[00012692] 6734                      beq.s      $000126C8
[00012694] 226f 0010                 movea.l    16(a7),a1
[00012698] 206f 0008                 movea.l    8(a7),a0
[0001269c] 2068 0014                 movea.l    20(a0),a0
[000126a0] 4eb9 0003 337c            jsr        find_entry
[000126a6] 2e88                      move.l     a0,(a7)
[000126a8] 2017                      move.l     (a7),d0
[000126aa] 6614                      bne.s      $000126C0
[000126ac] 4240                      clr.w      d0
[000126ae] 226f 0010                 movea.l    16(a7),a1
[000126b2] 206f 0008                 movea.l    8(a7),a0
[000126b6] 4eb9 0003 5de0            jsr        dup_ref
[000126bc] 2e88                      move.l     a0,(a7)
[000126be] 6006                      bra.s      $000126C6
[000126c0] 2057                      movea.l    (a7),a0
[000126c2] 5268 0036                 addq.w     #1,54(a0)
[000126c6] 6002                      bra.s      $000126CA
[000126c8] 4297                      clr.l      (a7)
[000126ca] 202f 0004                 move.l     4(a7),d0
[000126ce] 6738                      beq.s      $00012708
[000126d0] 226f 0004                 movea.l    4(a7),a1
[000126d4] 43e9 0016                 lea.l      22(a1),a1
[000126d8] 206f 0008                 movea.l    8(a7),a0
[000126dc] 2068 0014                 movea.l    20(a0),a0
[000126e0] 4eb9 0003 337c            jsr        find_entry
[000126e6] 2008                      move.l     a0,d0
[000126e8] 6710                      beq.s      $000126FA
[000126ea] 226f 0004                 movea.l    4(a7),a1
[000126ee] 206f 0008                 movea.l    8(a7),a0
[000126f2] 4eb9 0003 45c6            jsr        del_window
[000126f8] 600e                      bra.s      $00012708
[000126fa] 226f 0004                 movea.l    4(a7),a1
[000126fe] 206f 0008                 movea.l    8(a7),a0
[00012702] 4eb9 0003 5dae            jsr        del_ref
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
[00012726] 6736                      beq.s      $0001275E
[00012728] 226f 0012                 movea.l    18(a7),a1
[0001272c] 206f 000a                 movea.l    10(a7),a0
[00012730] 2068 003c                 movea.l    60(a0),a0
[00012734] 4eb9 0003 337c            jsr        find_entry
[0001273a] 2e88                      move.l     a0,(a7)
[0001273c] 2017                      move.l     (a7),d0
[0001273e] 6616                      bne.s      $00012756
[00012740] 302f 0004                 move.w     4(a7),d0
[00012744] 226f 0012                 movea.l    18(a7),a1
[00012748] 206f 000a                 movea.l    10(a7),a0
[0001274c] 4eb9 0003 5de0            jsr        dup_ref
[00012752] 2e88                      move.l     a0,(a7)
[00012754] 6006                      bra.s      $0001275C
[00012756] 2057                      movea.l    (a7),a0
[00012758] 5268 0036                 addq.w     #1,54(a0)
[0001275c] 6002                      bra.s      $00012760
[0001275e] 4297                      clr.l      (a7)
[00012760] 202f 0006                 move.l     6(a7),d0
[00012764] 670e                      beq.s      $00012774
[00012766] 226f 0006                 movea.l    6(a7),a1
[0001276a] 206f 000a                 movea.l    10(a7),a0
[0001276e] 4eb9 0003 5dae            jsr        del_ref
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
[000127a4] 6000 0082                 bra        $00012828
[000127a8] 302f 000c                 move.w     12(a7),d0
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
[00012828] 302f 000c                 move.w     12(a7),d0
[0001282c] b06f 000e                 cmp.w      14(a7),d0
[00012830] 6d00 ff76                 blt        $000127A8
[00012834] 4fef 0020                 lea.l      32(a7),a7
[00012838] 4e75                      rts
acc_behave:
[0001283a] 2f0a                      move.l     a2,-(a7)
[0001283c] 4fef ffea                 lea.l      -22(a7),a7
[00012840] 2f48 0012                 move.l     a0,18(a7)
[00012844] 206f 0012                 movea.l    18(a7),a0
[00012848] 3028 0056                 move.w     86(a0),d0
[0001284c] c07c 0200                 and.w      #$0200,d0
[00012850] 6704                      beq.s      $00012856
[00012852] 6000 0202                 bra        $00012A56
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
[000128a8] 670a                      beq.s      $000128B4
[000128aa] 206f 000a                 movea.l    10(a7),a0
[000128ae] 0068 4000 0006            ori.w      #$4000,6(a0)
[000128b4] 7001                      moveq.l    #1,d0
[000128b6] 206f 0006                 movea.l    6(a7),a0
[000128ba] c068 00fa                 and.w      250(a0),d0
[000128be] 670a                      beq.s      $000128CA
[000128c0] 206f 000a                 movea.l    10(a7),a0
[000128c4] 0068 2000 0006            ori.w      #$2000,6(a0)
[000128ca] 7001                      moveq.l    #1,d0
[000128cc] 206f 0006                 movea.l    6(a7),a0
[000128d0] c068 012a                 and.w      298(a0),d0
[000128d4] 670a                      beq.s      $000128E0
[000128d6] 206f 000a                 movea.l    10(a7),a0
[000128da] 0068 1000 0006            ori.w      #$1000,6(a0)
[000128e0] 7001                      moveq.l    #1,d0
[000128e2] 206f 0006                 movea.l    6(a7),a0
[000128e6] c068 0052                 and.w      82(a0),d0
[000128ea] 670a                      beq.s      $000128F6
[000128ec] 206f 000a                 movea.l    10(a7),a0
[000128f0] 0068 0800 0006            ori.w      #$0800,6(a0)
[000128f6] 206f 000a                 movea.l    10(a7),a0
[000128fa] 42a8 0170                 clr.l      368(a0)
[000128fe] 7001                      moveq.l    #1,d0
[00012900] 206f 0006                 movea.l    6(a7),a0
[00012904] c068 02f2                 and.w      754(a0),d0
[00012908] 670c                      beq.s      $00012916
[0001290a] 206f 000a                 movea.l    10(a7),a0
[0001290e] 00a8 0000 0002 0170       ori.l      #$00000002,368(a0)
[00012916] 7001                      moveq.l    #1,d0
[00012918] 206f 0006                 movea.l    6(a7),a0
[0001291c] c068 015a                 and.w      346(a0),d0
[00012920] 670c                      beq.s      $0001292E
[00012922] 206f 000a                 movea.l    10(a7),a0
[00012926] 00a8 0000 0001 0170       ori.l      #$00000001,368(a0)
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
[000129a0] 6700 00b4                 beq        $00012A56
[000129a4] 4240                      clr.w      d0
[000129a6] 206f 000a                 movea.l    10(a7),a0
[000129aa] 4eb9 0001 8230            jsr        acs_closewi
[000129b0] 3017                      move.w     (a7),d0
[000129b2] 4a40                      tst.w      d0
[000129b4] 6702                      beq.s      $000129B8
[000129b6] 6002                      bra.s      $000129BA
[000129b8] 6040                      bra.s      $000129FA
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
[000129fa] 206f 000a                 movea.l    10(a7),a0
[000129fe] 3028 01f4                 move.w     500(a0),d0
[00012a02] 4a40                      tst.w      d0
[00012a04] 6702                      beq.s      $00012A08
[00012a06] 6002                      bra.s      $00012A0A
[00012a08] 604c                      bra.s      $00012A56
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
[00012a56] 4fef 0016                 lea.l      22(a7),a7
[00012a5a] 245f                      movea.l    (a7)+,a2
[00012a5c] 4e75                      rts
bh_make:
[00012a5e] 4fef ff70                 lea.l      -144(a7),a7
[00012a62] 2f48 008c                 move.l     a0,140(a7)
[00012a66] 2f6f 008c 0088            move.l     140(a7),136(a7)
[00012a6c] 206f 0088                 movea.l    136(a7),a0
[00012a70] 2028 0148                 move.l     328(a0),d0
[00012a74] 671a                      beq.s      $00012A90
[00012a76] 206f 0088                 movea.l    136(a7),a0
[00012a7a] 2068 0148                 movea.l    328(a0),a0
[00012a7e] 4eb9 0005 6bea            jsr        Awi_show
[00012a84] 206f 0088                 movea.l    136(a7),a0
[00012a88] 2068 0148                 movea.l    328(a0),a0
[00012a8c] 6000 00bc                 bra        $00012B4A
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
[00012abe] 6704                      beq.s      $00012AC4
[00012ac0] 5297                      addq.l     #1,(a7)
[00012ac2] 6006                      bra.s      $00012ACA
[00012ac4] 41ef 0004                 lea.l      4(a7),a0
[00012ac8] 2e88                      move.l     a0,(a7)
[00012aca] 2079 0008 ae18            movea.l    $0008AE18,a0
[00012ad0] 2157 0008                 move.l     (a7),8(a0)
[00012ad4] 41f9 0008 adbe            lea.l      WI_BEHAVE,a0
[00012ada] 4eb9 0005 7052            jsr        Awi_create
[00012ae0] 2f48 0084                 move.l     a0,132(a7)
[00012ae4] 202f 0084                 move.l     132(a7),d0
[00012ae8] 6604                      bne.s      $00012AEE
[00012aea] 91c8                      suba.l     a0,a0
[00012aec] 605c                      bra.s      $00012B4A
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
[00012b36] 670e                      beq.s      $00012B46
[00012b38] 206f 0084                 movea.l    132(a7),a0
[00012b3c] 4eb9 0001 2cf2            jsr        term
[00012b42] 91c8                      suba.l     a0,a0
[00012b44] 6004                      bra.s      $00012B4A
[00012b46] 206f 0084                 movea.l    132(a7),a0
[00012b4a] 4fef 0090                 lea.l      144(a7),a7
[00012b4e] 4e75                      rts
bh_service:
[00012b50] 4fef fff6                 lea.l      -10(a7),a7
[00012b54] 2f48 0006                 move.l     a0,6(a7)
[00012b58] 3f40 0004                 move.w     d0,4(a7)
[00012b5c] 2e89                      move.l     a1,(a7)
[00012b5e] 302f 0004                 move.w     4(a7),d0
[00012b62] 5540                      subq.w     #2,d0
[00012b64] 6708                      beq.s      $00012B6E
[00012b66] 907c 000d                 sub.w      #$000D,d0
[00012b6a] 672e                      beq.s      $00012B9A
[00012b6c] 602e                      bra.s      $00012B9C
[00012b6e] 206f 0006                 movea.l    6(a7),a0
[00012b72] 3028 0056                 move.w     86(a0),d0
[00012b76] c07c 0200                 and.w      #$0200,d0
[00012b7a] 661c                      bne.s      $00012B98
[00012b7c] 206f 0006                 movea.l    6(a7),a0
[00012b80] 0068 0200 0056            ori.w      #$0200,86(a0)
[00012b86] 206f 0006                 movea.l    6(a7),a0
[00012b8a] 6100 fcae                 bsr        acc_behave
[00012b8e] 206f 0006                 movea.l    6(a7),a0
[00012b92] 4eb9 0001 2cf2            jsr        term
[00012b98] 6014                      bra.s      $00012BAE
[00012b9a] 6012                      bra.s      $00012BAE
[00012b9c] 2257                      movea.l    (a7),a1
[00012b9e] 302f 0004                 move.w     4(a7),d0
[00012ba2] 206f 0006                 movea.l    6(a7),a0
[00012ba6] 4eb9 0005 9dd0            jsr        Awi_service
[00012bac] 6002                      bra.s      $00012BB0
[00012bae] 7001                      moveq.l    #1,d0
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
[00012c62] 6704                      beq.s      $00012C68
[00012c64] 7001                      moveq.l    #1,d0
[00012c66] 6002                      bra.s      $00012C6A
[00012c68] 4240                      clr.w      d0
[00012c6a] 205f                      movea.l    (a7)+,a0
[00012c6c] 4eb9 0001 58a2            jsr        set_flag
[00012c72] 206f 0004                 movea.l    4(a7),a0
[00012c76] 41e8 02e8                 lea.l      744(a0),a0
[00012c7a] 2f08                      move.l     a0,-(a7)
[00012c7c] 7002                      moveq.l    #2,d0
[00012c7e] 206f 0010                 movea.l    16(a7),a0
[00012c82] c0a8 0170                 and.l      368(a0),d0
[00012c86] 6704                      beq.s      $00012C8C
[00012c88] 7001                      moveq.l    #1,d0
[00012c8a] 6002                      bra.s      $00012C8E
[00012c8c] 4240                      clr.w      d0
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
[00012d0a] 6718                      beq.s      $00012D24
[00012d0c] 7008                      moveq.l    #8,d0
[00012d0e] 226f 0004                 movea.l    4(a7),a1
[00012d12] 43e9 002c                 lea.l      44(a1),a1
[00012d16] 2057                      movea.l    (a7),a0
[00012d18] 41e8 015c                 lea.l      348(a0),a0
[00012d1c] 4eb9 0008 3500            jsr        memcpy
[00012d22] 6016                      bra.s      $00012D3A
[00012d24] 7008                      moveq.l    #8,d0
[00012d26] 226f 0004                 movea.l    4(a7),a1
[00012d2a] 43e9 0024                 lea.l      36(a1),a1
[00012d2e] 2057                      movea.l    (a7),a0
[00012d30] 41e8 015c                 lea.l      348(a0),a0
[00012d34] 4eb9 0008 3500            jsr        memcpy
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
[00012d7c] 671e                      beq.s      $00012D9C
[00012d7e] 3017                      move.w     (a7),d0
[00012d80] 670e                      beq.s      $00012D90
[00012d82] 302f 0002                 move.w     2(a7),d0
[00012d86] 4640                      not.w      d0
[00012d88] 206f 0004                 movea.l    4(a7),a0
[00012d8c] c150                      and.w      d0,(a0)
[00012d8e] 600a                      bra.s      $00012D9A
[00012d90] 302f 0002                 move.w     2(a7),d0
[00012d94] 206f 0004                 movea.l    4(a7),a0
[00012d98] 8150                      or.w       d0,(a0)
[00012d9a] 601c                      bra.s      $00012DB8
[00012d9c] 3017                      move.w     (a7),d0
[00012d9e] 670c                      beq.s      $00012DAC
[00012da0] 302f 0002                 move.w     2(a7),d0
[00012da4] 206f 0004                 movea.l    4(a7),a0
[00012da8] 8150                      or.w       d0,(a0)
[00012daa] 600c                      bra.s      $00012DB8
[00012dac] 302f 0002                 move.w     2(a7),d0
[00012db0] 4640                      not.w      d0
[00012db2] 206f 0004                 movea.l    4(a7),a0
[00012db6] c150                      and.w      d0,(a0)
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
[00012df4] 6606                      bne.s      $00012DFC
[00012df6] 4eb9 0005 1388            jsr        Awi_diaend
[00012dfc] 7001                      moveq.l    #1,d0
[00012dfe] 206f 0004                 movea.l    4(a7),a0
[00012e02] c068 0022                 and.w      34(a0),d0
[00012e06] 3f40 0002                 move.w     d0,2(a7)
[00012e0a] 302f 0002                 move.w     2(a7),d0
[00012e0e] 6604                      bne.s      $00012E14
[00012e10] 7401                      moveq.l    #1,d2
[00012e12] 6002                      bra.s      $00012E16
[00012e14] 4242                      clr.w      d2
[00012e16] 7208                      moveq.l    #8,d1
[00012e18] 7004                      moveq.l    #4,d0
[00012e1a] 206f 0008                 movea.l    8(a7),a0
[00012e1e] 4eb9 0005 484e            jsr        Aob_state
[00012e24] 302f 0002                 move.w     2(a7),d0
[00012e28] 6704                      beq.s      $00012E2E
[00012e2a] 3017                      move.w     (a7),d0
[00012e2c] 6604                      bne.s      $00012E32
[00012e2e] 7401                      moveq.l    #1,d2
[00012e30] 6002                      bra.s      $00012E34
[00012e32] 4242                      clr.w      d2
[00012e34] 7208                      moveq.l    #8,d1
[00012e36] 700a                      moveq.l    #10,d0
[00012e38] 206f 0008                 movea.l    8(a7),a0
[00012e3c] 4eb9 0005 484e            jsr        Aob_state
[00012e42] 302f 0002                 move.w     2(a7),d0
[00012e46] 6604                      bne.s      $00012E4C
[00012e48] 7401                      moveq.l    #1,d2
[00012e4a] 6002                      bra.s      $00012E4E
[00012e4c] 4242                      clr.w      d2
[00012e4e] 7208                      moveq.l    #8,d1
[00012e50] 7006                      moveq.l    #6,d0
[00012e52] 206f 0008                 movea.l    8(a7),a0
[00012e56] 4eb9 0005 484e            jsr        Aob_state
[00012e5c] 302f 0002                 move.w     2(a7),d0
[00012e60] 6604                      bne.s      $00012E66
[00012e62] 7401                      moveq.l    #1,d2
[00012e64] 6002                      bra.s      $00012E68
[00012e66] 4242                      clr.w      d2
[00012e68] 7208                      moveq.l    #8,d1
[00012e6a] 7008                      moveq.l    #8,d0
[00012e6c] 206f 0008                 movea.l    8(a7),a0
[00012e70] 4eb9 0005 484e            jsr        Aob_state
[00012e76] 302f 0002                 move.w     2(a7),d0
[00012e7a] 6604                      bne.s      $00012E80
[00012e7c] 7401                      moveq.l    #1,d2
[00012e7e] 6002                      bra.s      $00012E82
[00012e80] 4242                      clr.w      d2
[00012e82] 7208                      moveq.l    #8,d1
[00012e84] 7028                      moveq.l    #40,d0
[00012e86] 206f 0008                 movea.l    8(a7),a0
[00012e8a] 4eb9 0005 484e            jsr        Aob_state
[00012e90] 302f 0002                 move.w     2(a7),d0
[00012e94] 6604                      bne.s      $00012E9A
[00012e96] 7401                      moveq.l    #1,d2
[00012e98] 6002                      bra.s      $00012E9C
[00012e9a] 4242                      clr.w      d2
[00012e9c] 7208                      moveq.l    #8,d1
[00012e9e] 702a                      moveq.l    #42,d0
[00012ea0] 206f 0008                 movea.l    8(a7),a0
[00012ea4] 4eb9 0005 484e            jsr        Aob_state
[00012eaa] 302f 0002                 move.w     2(a7),d0
[00012eae] 6604                      bne.s      $00012EB4
[00012eb0] 7401                      moveq.l    #1,d2
[00012eb2] 6002                      bra.s      $00012EB6
[00012eb4] 4242                      clr.w      d2
[00012eb6] 7208                      moveq.l    #8,d1
[00012eb8] 702c                      moveq.l    #44,d0
[00012eba] 206f 0008                 movea.l    8(a7),a0
[00012ebe] 4eb9 0005 484e            jsr        Aob_state
[00012ec4] 302f 0002                 move.w     2(a7),d0
[00012ec8] 6604                      bne.s      $00012ECE
[00012eca] 7401                      moveq.l    #1,d2
[00012ecc] 6002                      bra.s      $00012ED0
[00012ece] 4242                      clr.w      d2
[00012ed0] 7208                      moveq.l    #8,d1
[00012ed2] 702e                      moveq.l    #46,d0
[00012ed4] 206f 0008                 movea.l    8(a7),a0
[00012ed8] 4eb9 0005 484e            jsr        Aob_state
[00012ede] 302f 0002                 move.w     2(a7),d0
[00012ee2] 6604                      bne.s      $00012EE8
[00012ee4] 7401                      moveq.l    #1,d2
[00012ee6] 6002                      bra.s      $00012EEA
[00012ee8] 4242                      clr.w      d2
[00012eea] 7208                      moveq.l    #8,d1
[00012eec] 7024                      moveq.l    #36,d0
[00012eee] 206f 0008                 movea.l    8(a7),a0
[00012ef2] 4eb9 0005 484e            jsr        Aob_state
[00012ef8] 302f 0002                 move.w     2(a7),d0
[00012efc] 6604                      bne.s      $00012F02
[00012efe] 7401                      moveq.l    #1,d2
[00012f00] 6002                      bra.s      $00012F04
[00012f02] 4242                      clr.w      d2
[00012f04] 7208                      moveq.l    #8,d1
[00012f06] 7026                      moveq.l    #38,d0
[00012f08] 206f 0008                 movea.l    8(a7),a0
[00012f0c] 4eb9 0005 484e            jsr        Aob_state
[00012f12] 302f 0002                 move.w     2(a7),d0
[00012f16] 6604                      bne.s      $00012F1C
[00012f18] 7401                      moveq.l    #1,d2
[00012f1a] 6002                      bra.s      $00012F1E
[00012f1c] 4242                      clr.w      d2
[00012f1e] 7208                      moveq.l    #8,d1
[00012f20] 7030                      moveq.l    #48,d0
[00012f22] 206f 0008                 movea.l    8(a7),a0
[00012f26] 4eb9 0005 484e            jsr        Aob_state
[00012f2c] 302f 0002                 move.w     2(a7),d0
[00012f30] 6604                      bne.s      $00012F36
[00012f32] 7401                      moveq.l    #1,d2
[00012f34] 6002                      bra.s      $00012F38
[00012f36] 4242                      clr.w      d2
[00012f38] 7208                      moveq.l    #8,d1
[00012f3a] 7032                      moveq.l    #50,d0
[00012f3c] 206f 0008                 movea.l    8(a7),a0
[00012f40] 4eb9 0005 484e            jsr        Aob_state
[00012f46] 302f 0002                 move.w     2(a7),d0
[00012f4a] 6604                      bne.s      $00012F50
[00012f4c] 7401                      moveq.l    #1,d2
[00012f4e] 6002                      bra.s      $00012F52
[00012f50] 4242                      clr.w      d2
[00012f52] 7208                      moveq.l    #8,d1
[00012f54] 7034                      moveq.l    #52,d0
[00012f56] 206f 0008                 movea.l    8(a7),a0
[00012f5a] 4eb9 0005 484e            jsr        Aob_state
[00012f60] 302f 0002                 move.w     2(a7),d0
[00012f64] 6604                      bne.s      $00012F6A
[00012f66] 7401                      moveq.l    #1,d2
[00012f68] 6002                      bra.s      $00012F6C
[00012f6a] 4242                      clr.w      d2
[00012f6c] 7208                      moveq.l    #8,d1
[00012f6e] 7036                      moveq.l    #54,d0
[00012f70] 206f 0008                 movea.l    8(a7),a0
[00012f74] 4eb9 0005 484e            jsr        Aob_state
[00012f7a] 302f 0002                 move.w     2(a7),d0
[00012f7e] 6604                      bne.s      $00012F84
[00012f80] 7401                      moveq.l    #1,d2
[00012f82] 6002                      bra.s      $00012F86
[00012f84] 4242                      clr.w      d2
[00012f86] 7208                      moveq.l    #8,d1
[00012f88] 7038                      moveq.l    #56,d0
[00012f8a] 206f 0008                 movea.l    8(a7),a0
[00012f8e] 4eb9 0005 484e            jsr        Aob_state
[00012f94] 302f 0002                 move.w     2(a7),d0
[00012f98] 6604                      bne.s      $00012F9E
[00012f9a] 7401                      moveq.l    #1,d2
[00012f9c] 6002                      bra.s      $00012FA0
[00012f9e] 4242                      clr.w      d2
[00012fa0] 7208                      moveq.l    #8,d1
[00012fa2] 7021                      moveq.l    #33,d0
[00012fa4] 206f 0008                 movea.l    8(a7),a0
[00012fa8] 4eb9 0005 484e            jsr        Aob_state
[00012fae] 302f 0002                 move.w     2(a7),d0
[00012fb2] 6604                      bne.s      $00012FB8
[00012fb4] 7401                      moveq.l    #1,d2
[00012fb6] 6002                      bra.s      $00012FBA
[00012fb8] 4242                      clr.w      d2
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
[00012fde] 6604                      bne.s      $00012FE4
[00012fe0] 7401                      moveq.l    #1,d2
[00012fe2] 6002                      bra.s      $00012FE6
[00012fe4] 4242                      clr.w      d2
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
[0001300a] 6604                      bne.s      $00013010
[0001300c] 7401                      moveq.l    #1,d2
[0001300e] 6002                      bra.s      $00013012
[00013010] 4242                      clr.w      d2
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
[00013036] 6604                      bne.s      $0001303C
[00013038] 7401                      moveq.l    #1,d2
[0001303a] 6002                      bra.s      $0001303E
[0001303c] 4242                      clr.w      d2
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
[00013062] 6604                      bne.s      $00013068
[00013064] 7401                      moveq.l    #1,d2
[00013066] 6002                      bra.s      $0001306A
[00013068] 4242                      clr.w      d2
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
[0001308e] 6604                      bne.s      $00013094
[00013090] 7401                      moveq.l    #1,d2
[00013092] 6002                      bra.s      $00013096
[00013094] 4242                      clr.w      d2
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
[000130ba] 6604                      bne.s      $000130C0
[000130bc] 7401                      moveq.l    #1,d2
[000130be] 6002                      bra.s      $000130C2
[000130c0] 4242                      clr.w      d2
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
[000130e6] 6604                      bne.s      $000130EC
[000130e8] 7401                      moveq.l    #1,d2
[000130ea] 6002                      bra.s      $000130EE
[000130ec] 4242                      clr.w      d2
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
[00013112] 6604                      bne.s      $00013118
[00013114] 7401                      moveq.l    #1,d2
[00013116] 6002                      bra.s      $0001311A
[00013118] 4242                      clr.w      d2
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
[0001313e] 6604                      bne.s      $00013144
[00013140] 7401                      moveq.l    #1,d2
[00013142] 6002                      bra.s      $00013146
[00013144] 4242                      clr.w      d2
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
[0001316a] 6604                      bne.s      $00013170
[0001316c] 7401                      moveq.l    #1,d2
[0001316e] 6002                      bra.s      $00013172
[00013170] 4242                      clr.w      d2
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
[00013196] 6604                      bne.s      $0001319C
[00013198] 7401                      moveq.l    #1,d2
[0001319a] 6002                      bra.s      $0001319E
[0001319c] 4242                      clr.w      d2
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
[000131c2] 6604                      bne.s      $000131C8
[000131c4] 7401                      moveq.l    #1,d2
[000131c6] 6002                      bra.s      $000131CA
[000131c8] 4242                      clr.w      d2
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
[000131ee] 6604                      bne.s      $000131F4
[000131f0] 7401                      moveq.l    #1,d2
[000131f2] 6002                      bra.s      $000131F6
[000131f4] 4242                      clr.w      d2
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
[0001321a] 6604                      bne.s      $00013220
[0001321c] 7401                      moveq.l    #1,d2
[0001321e] 6002                      bra.s      $00013222
[00013220] 4242                      clr.w      d2
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
[00013246] 6604                      bne.s      $0001324C
[00013248] 7401                      moveq.l    #1,d2
[0001324a] 6002                      bra.s      $0001324E
[0001324c] 4242                      clr.w      d2
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
[00013272] 6604                      bne.s      $00013278
[00013274] 7401                      moveq.l    #1,d2
[00013276] 6002                      bra.s      $0001327A
[00013278] 4242                      clr.w      d2
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
[0001329e] 6604                      bne.s      $000132A4
[000132a0] 7401                      moveq.l    #1,d2
[000132a2] 6002                      bra.s      $000132A6
[000132a4] 4242                      clr.w      d2
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
[000132d0] 6606                      bne.s      $000132D8
[000132d2] 4eb9 0005 147c            jsr        Awi_diastart
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
[0001331a] 6604                      bne.s      $00013320
[0001331c] 7401                      moveq.l    #1,d2
[0001331e] 6002                      bra.s      $00013322
[00013320] 4242                      clr.w      d2
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
[0001342e] 6604                      bne.s      $00013434
[00013430] 7401                      moveq.l    #1,d2
[00013432] 6002                      bra.s      $00013436
[00013434] 4242                      clr.w      d2
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
[00013468] 6604                      bne.s      $0001346E
[0001346a] 7401                      moveq.l    #1,d2
[0001346c] 6002                      bra.s      $00013470
[0001346e] 4242                      clr.w      d2
[00013470] 7201                      moveq.l    #1,d1
[00013472] 7034                      moveq.l    #52,d0
[00013474] 206f 0014                 movea.l    20(a7),a0
[00013478] 4eb9 0005 484e            jsr        Aob_state
[0001347e] 206f 0010                 movea.l    16(a7),a0
[00013482] 3028 005a                 move.w     90(a0),d0
[00013486] c07c 0200                 and.w      #$0200,d0
[0001348a] 6604                      bne.s      $00013490
[0001348c] 7401                      moveq.l    #1,d2
[0001348e] 6002                      bra.s      $00013492
[00013490] 4242                      clr.w      d2
[00013492] 7201                      moveq.l    #1,d1
[00013494] 7036                      moveq.l    #54,d0
[00013496] 206f 0014                 movea.l    20(a7),a0
[0001349a] 4eb9 0005 484e            jsr        Aob_state
[000134a0] 206f 0010                 movea.l    16(a7),a0
[000134a4] 3028 005a                 move.w     90(a0),d0
[000134a8] c07c 1000                 and.w      #$1000,d0
[000134ac] 6604                      bne.s      $000134B2
[000134ae] 7401                      moveq.l    #1,d2
[000134b0] 6002                      bra.s      $000134B4
[000134b2] 4242                      clr.w      d2
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
[000134e2] 6608                      bne.s      $000134EC
[000134e4] 43f9 0008 af8a            lea.l      $0008AF8A,a1
[000134ea] 6008                      bra.s      $000134F4
[000134ec] 226f 000c                 movea.l    12(a7),a1
[000134f0] 43e9 0016                 lea.l      22(a1),a1
[000134f4] 7011                      moveq.l    #17,d0
[000134f6] 2057                      movea.l    (a7),a0
[000134f8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000134fe] 206f 0004                 movea.l    4(a7),a0
[00013502] 2f68 0030 000c            move.l     48(a0),12(a7)
[00013508] 202f 000c                 move.l     12(a7),d0
[0001350c] 6608                      bne.s      $00013516
[0001350e] 43f9 0008 af8b            lea.l      $0008AF8B,a1
[00013514] 6008                      bra.s      $0001351E
[00013516] 226f 000c                 movea.l    12(a7),a1
[0001351a] 43e9 0016                 lea.l      22(a1),a1
[0001351e] 7013                      moveq.l    #19,d0
[00013520] 2057                      movea.l    (a7),a0
[00013522] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013528] 206f 0008                 movea.l    8(a7),a0
[0001352c] 2f68 0016 000c            move.l     22(a0),12(a7)
[00013532] 202f 000c                 move.l     12(a7),d0
[00013536] 6608                      bne.s      $00013540
[00013538] 43f9 0008 af8c            lea.l      $0008AF8C,a1
[0001353e] 6008                      bra.s      $00013548
[00013540] 226f 000c                 movea.l    12(a7),a1
[00013544] 43e9 0016                 lea.l      22(a1),a1
[00013548] 7042                      moveq.l    #66,d0
[0001354a] 2057                      movea.l    (a7),a0
[0001354c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013552] 206f 0008                 movea.l    8(a7),a0
[00013556] 2f68 001a 000c            move.l     26(a0),12(a7)
[0001355c] 202f 000c                 move.l     12(a7),d0
[00013560] 6608                      bne.s      $0001356A
[00013562] 43f9 0008 af8d            lea.l      $0008AF8D,a1
[00013568] 6008                      bra.s      $00013572
[0001356a] 226f 000c                 movea.l    12(a7),a1
[0001356e] 43e9 0016                 lea.l      22(a1),a1
[00013572] 703e                      moveq.l    #62,d0
[00013574] 2057                      movea.l    (a7),a0
[00013576] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001357c] 206f 0008                 movea.l    8(a7),a0
[00013580] 2f68 001e 000c            move.l     30(a0),12(a7)
[00013586] 202f 000c                 move.l     12(a7),d0
[0001358a] 6608                      bne.s      $00013594
[0001358c] 43f9 0008 af8e            lea.l      $0008AF8E,a1
[00013592] 6008                      bra.s      $0001359C
[00013594] 226f 000c                 movea.l    12(a7),a1
[00013598] 43e9 0016                 lea.l      22(a1),a1
[0001359c] 703f                      moveq.l    #63,d0
[0001359e] 2057                      movea.l    (a7),a0
[000135a0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000135a6] 206f 0008                 movea.l    8(a7),a0
[000135aa] 2f68 0022 000c            move.l     34(a0),12(a7)
[000135b0] 202f 000c                 move.l     12(a7),d0
[000135b4] 6608                      bne.s      $000135BE
[000135b6] 43f9 0008 af8f            lea.l      $0008AF8F,a1
[000135bc] 6008                      bra.s      $000135C6
[000135be] 226f 000c                 movea.l    12(a7),a1
[000135c2] 43e9 0016                 lea.l      22(a1),a1
[000135c6] 7040                      moveq.l    #64,d0
[000135c8] 2057                      movea.l    (a7),a0
[000135ca] 4eb9 0005 0fd8            jsr        Aob_puttext
[000135d0] 206f 0008                 movea.l    8(a7),a0
[000135d4] 2f68 0026 000c            move.l     38(a0),12(a7)
[000135da] 202f 000c                 move.l     12(a7),d0
[000135de] 6608                      bne.s      $000135E8
[000135e0] 43f9 0008 af90            lea.l      $0008AF90,a1
[000135e6] 6008                      bra.s      $000135F0
[000135e8] 226f 000c                 movea.l    12(a7),a1
[000135ec] 43e9 0016                 lea.l      22(a1),a1
[000135f0] 704b                      moveq.l    #75,d0
[000135f2] 2057                      movea.l    (a7),a0
[000135f4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000135fa] 206f 0008                 movea.l    8(a7),a0
[000135fe] 2f68 002a 000c            move.l     42(a0),12(a7)
[00013604] 202f 000c                 move.l     12(a7),d0
[00013608] 6608                      bne.s      $00013612
[0001360a] 43f9 0008 af91            lea.l      $0008AF91,a1
[00013610] 6008                      bra.s      $0001361A
[00013612] 226f 000c                 movea.l    12(a7),a1
[00013616] 43e9 0016                 lea.l      22(a1),a1
[0001361a] 7041                      moveq.l    #65,d0
[0001361c] 2057                      movea.l    (a7),a0
[0001361e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013624] 206f 0008                 movea.l    8(a7),a0
[00013628] 2f68 002e 000c            move.l     46(a0),12(a7)
[0001362e] 202f 000c                 move.l     12(a7),d0
[00013632] 6608                      bne.s      $0001363C
[00013634] 43f9 0008 af92            lea.l      $0008AF92,a1
[0001363a] 6008                      bra.s      $00013644
[0001363c] 226f 000c                 movea.l    12(a7),a1
[00013640] 43e9 0016                 lea.l      22(a1),a1
[00013644] 704c                      moveq.l    #76,d0
[00013646] 2057                      movea.l    (a7),a0
[00013648] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001364e] 206f 0008                 movea.l    8(a7),a0
[00013652] 2f68 0032 000c            move.l     50(a0),12(a7)
[00013658] 202f 000c                 move.l     12(a7),d0
[0001365c] 6608                      bne.s      $00013666
[0001365e] 43f9 0008 af93            lea.l      $0008AF93,a1
[00013664] 6008                      bra.s      $0001366E
[00013666] 226f 000c                 movea.l    12(a7),a1
[0001366a] 43e9 0016                 lea.l      22(a1),a1
[0001366e] 704e                      moveq.l    #78,d0
[00013670] 2057                      movea.l    (a7),a0
[00013672] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013678] 206f 0008                 movea.l    8(a7),a0
[0001367c] 2f68 0036 000c            move.l     54(a0),12(a7)
[00013682] 202f 000c                 move.l     12(a7),d0
[00013686] 6608                      bne.s      $00013690
[00013688] 43f9 0008 af94            lea.l      $0008AF94,a1
[0001368e] 6008                      bra.s      $00013698
[00013690] 226f 000c                 movea.l    12(a7),a1
[00013694] 43e9 0016                 lea.l      22(a1),a1
[00013698] 704f                      moveq.l    #79,d0
[0001369a] 2057                      movea.l    (a7),a0
[0001369c] 4eb9 0005 0fd8            jsr        Aob_puttext
[000136a2] 206f 0008                 movea.l    8(a7),a0
[000136a6] 2f68 003a 000c            move.l     58(a0),12(a7)
[000136ac] 202f 000c                 move.l     12(a7),d0
[000136b0] 6608                      bne.s      $000136BA
[000136b2] 43f9 0008 af95            lea.l      $0008AF95,a1
[000136b8] 6008                      bra.s      $000136C2
[000136ba] 226f 000c                 movea.l    12(a7),a1
[000136be] 43e9 0016                 lea.l      22(a1),a1
[000136c2] 704d                      moveq.l    #77,d0
[000136c4] 2057                      movea.l    (a7),a0
[000136c6] 4eb9 0005 0fd8            jsr        Aob_puttext
[000136cc] 206f 0008                 movea.l    8(a7),a0
[000136d0] 2f68 0042 000c            move.l     66(a0),12(a7)
[000136d6] 202f 000c                 move.l     12(a7),d0
[000136da] 6608                      bne.s      $000136E4
[000136dc] 43f9 0008 af96            lea.l      $0008AF96,a1
[000136e2] 6008                      bra.s      $000136EC
[000136e4] 226f 000c                 movea.l    12(a7),a1
[000136e8] 43e9 0016                 lea.l      22(a1),a1
[000136ec] 705f                      moveq.l    #95,d0
[000136ee] 2057                      movea.l    (a7),a0
[000136f0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000136f6] 206f 0008                 movea.l    8(a7),a0
[000136fa] 2f68 0046 000c            move.l     70(a0),12(a7)
[00013700] 202f 000c                 move.l     12(a7),d0
[00013704] 6608                      bne.s      $0001370E
[00013706] 43f9 0008 af97            lea.l      $0008AF97,a1
[0001370c] 6008                      bra.s      $00013716
[0001370e] 226f 000c                 movea.l    12(a7),a1
[00013712] 43e9 0016                 lea.l      22(a1),a1
[00013716] 701d                      moveq.l    #29,d0
[00013718] 2057                      movea.l    (a7),a0
[0001371a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00013720] 206f 0008                 movea.l    8(a7),a0
[00013724] 2f68 004a 000c            move.l     74(a0),12(a7)
[0001372a] 202f 000c                 move.l     12(a7),d0
[0001372e] 6608                      bne.s      $00013738
[00013730] 43f9 0008 af98            lea.l      $0008AF98,a1
[00013736] 6008                      bra.s      $00013740
[00013738] 226f 000c                 movea.l    12(a7),a1
[0001373c] 43e9 0016                 lea.l      22(a1),a1
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
[000137dc] 6716                      beq.s      $000137F4
[000137de] 206f 0016                 movea.l    22(a7),a0
[000137e2] 0268 7fff 0006            andi.w     #$7FFF,6(a0)
[000137e8] 206f 0016                 movea.l    22(a7),a0
[000137ec] 4eb9 0001 89ca            jsr        init_mess
[000137f2] 6042                      bra.s      $00013836
[000137f4] 206f 0016                 movea.l    22(a7),a0
[000137f8] 3028 0006                 move.w     6(a0),d0
[000137fc] c07c 8000                 and.w      #$8000,d0
[00013800] 6634                      bne.s      $00013836
[00013802] 41f9 0008 759e            lea.l      A_DELMESS,a0
[00013808] 7001                      moveq.l    #1,d0
[0001380a] 4eb9 0005 a600            jsr        Awi_alert
[00013810] 3e80                      move.w     d0,(a7)
[00013812] 3017                      move.w     (a7),d0
[00013814] 5340                      subq.w     #1,d0
[00013816] 670a                      beq.s      $00013822
[00013818] 5340                      subq.w     #1,d0
[0001381a] 6712                      beq.s      $0001382E
[0001381c] 5340                      subq.w     #1,d0
[0001381e] 6710                      beq.s      $00013830
[00013820] 6014                      bra.s      $00013836
[00013822] 206f 0016                 movea.l    22(a7),a0
[00013826] 4eb9 0001 8902            jsr        del_mess
[0001382c] 6008                      bra.s      $00013836
[0001382e] 6006                      bra.s      $00013836
[00013830] 4240                      clr.w      d0
[00013832] 6000 0594                 bra        $00013DC8
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
[00013d92] 6712                      beq.s      $00013DA6
[00013d94] 206f 0016                 movea.l    22(a7),a0
[00013d98] 2068 0034                 movea.l    52(a0),a0
[00013d9c] 2068 0012                 movea.l    18(a0),a0
[00013da0] 0068 0020 0056            ori.w      #$0020,86(a0)
[00013da6] 206f 0016                 movea.l    22(a7),a0
[00013daa] 2068 0024                 movea.l    36(a0),a0
[00013dae] 2028 0012                 move.l     18(a0),d0
[00013db2] 6712                      beq.s      $00013DC6
[00013db4] 206f 0016                 movea.l    22(a7),a0
[00013db8] 2068 0024                 movea.l    36(a0),a0
[00013dbc] 2068 0012                 movea.l    18(a0),a0
[00013dc0] 0068 0020 0056            ori.w      #$0020,86(a0)
[00013dc6] 7001                      moveq.l    #1,d0
[00013dc8] 4fef 001e                 lea.l      30(a7),a7
[00013dcc] 4e75                      rts
edmm_create:
[00013dce] 2f0a                      move.l     a2,-(a7)
[00013dd0] 4fef fff4                 lea.l      -12(a7),a7
[00013dd4] 2f48 0008                 move.l     a0,8(a7)
[00013dd8] 2f6f 0008 0004            move.l     8(a7),4(a7)
[00013dde] 206f 0004                 movea.l    4(a7),a0
[00013de2] 2028 0210                 move.l     528(a0),d0
[00013de6] 6718                      beq.s      $00013E00
[00013de8] 206f 0004                 movea.l    4(a7),a0
[00013dec] 2068 0210                 movea.l    528(a0),a0
[00013df0] 4eb9 0005 6bea            jsr        Awi_show
[00013df6] 206f 0004                 movea.l    4(a7),a0
[00013dfa] 2068 0210                 movea.l    528(a0),a0
[00013dfe] 6052                      bra.s      $00013E52
[00013e00] 41f9 0008 ae60            lea.l      WI_MAINMOD,a0
[00013e06] 4eb9 0005 7052            jsr        Awi_create
[00013e0c] 2e88                      move.l     a0,(a7)
[00013e0e] 2017                      move.l     (a7),d0
[00013e10] 6604                      bne.s      $00013E16
[00013e12] 91c8                      suba.l     a0,a0
[00013e14] 603c                      bra.s      $00013E52
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
[00013e3c] 6712                      beq.s      $00013E50
[00013e3e] 93c9                      suba.l     a1,a1
[00013e40] 7002                      moveq.l    #2,d0
[00013e42] 2057                      movea.l    (a7),a0
[00013e44] 2457                      movea.l    (a7),a2
[00013e46] 246a 0004                 movea.l    4(a2),a2
[00013e4a] 4e92                      jsr        (a2)
[00013e4c] 91c8                      suba.l     a0,a0
[00013e4e] 6002                      bra.s      $00013E52
[00013e50] 2057                      movea.l    (a7),a0
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
[00013e76] 6708                      beq.s      $00013E80
[00013e78] 907c 000d                 sub.w      #$000D,d0
[00013e7c] 672c                      beq.s      $00013EAA
[00013e7e] 602c                      bra.s      $00013EAC
[00013e80] 206f 000a                 movea.l    10(a7),a0
[00013e84] 3028 0056                 move.w     86(a0),d0
[00013e88] c07c 0200                 and.w      #$0200,d0
[00013e8c] 661a                      bne.s      $00013EA8
[00013e8e] 206f 000a                 movea.l    10(a7),a0
[00013e92] 0068 0200 0056            ori.w      #$0200,86(a0)
[00013e98] 2057                      movea.l    (a7),a0
[00013e9a] 42a8 0210                 clr.l      528(a0)
[00013e9e] 206f 000a                 movea.l    10(a7),a0
[00013ea2] 4eb9 0005 85f2            jsr        Awi_delete
[00013ea8] 6016                      bra.s      $00013EC0
[00013eaa] 6014                      bra.s      $00013EC0
[00013eac] 226f 0004                 movea.l    4(a7),a1
[00013eb0] 302f 0008                 move.w     8(a7),d0
[00013eb4] 206f 000a                 movea.l    10(a7),a0
[00013eb8] 4eb9 0005 9dd0            jsr        Awi_service
[00013ebe] 6002                      bra.s      $00013EC2
[00013ec0] 7001                      moveq.l    #1,d0
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
[00013f14] 6704                      beq.s      $00013F1A
[00013f16] 3017                      move.w     (a7),d0
[00013f18] 6604                      bne.s      $00013F1E
[00013f1a] 7401                      moveq.l    #1,d2
[00013f1c] 6002                      bra.s      $00013F20
[00013f1e] 4242                      clr.w      d2
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
[00013f4a] 671e                      beq.s      $00013F6A
[00013f4c] 93c9                      suba.l     a1,a1
[00013f4e] 7002                      moveq.l    #2,d0
[00013f50] 2079 0010 ee4e            movea.l    ACSblk,a0
[00013f56] 2068 0258                 movea.l    600(a0),a0
[00013f5a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00013f60] 246a 0258                 movea.l    600(a2),a2
[00013f64] 246a 0004                 movea.l    4(a2),a2
[00013f68] 4e92                      jsr        (a2)
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
