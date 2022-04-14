Aev_unhidepointer:
[0004a2f8] 3039 000e 073c            move.w     hidepointer,d0
[0004a2fe] 670c                      beq.s      $0004A30C
[0004a300] 4279 000e 073c            clr.w      hidepointer
[0004a306] 4eb9 0004 ef66            jsr        Amo_show
[0004a30c] 4e75                      rts
Aev_quit:
[0004a30e] 7001                      moveq.l    #1,d0
[0004a310] 33c0 000e 073a            move.w     d0,exitapp
[0004a316] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a31c] 3140 023a                 move.w     d0,570(a0)
[0004a320] 4e75                      rts
IsDeadKey:
[0004a322] 4fef ffec                 lea.l      -20(a7),a7
[0004a326] 2f48 000c                 move.l     a0,12(a7)
[0004a32a] 3f40 000a                 move.w     d0,10(a7)
[0004a32e] 2f49 0006                 move.l     a1,6(a7)
[0004a332] 426f 0004                 clr.w      4(a7)
[0004a336] 206f 0006                 movea.l    6(a7),a0
[0004a33a] 30af 000a                 move.w     10(a7),(a0)
[0004a33e] 3039 000e 0790            move.w     dead_handling,d0
[0004a344] 6706                      beq.s      $0004A34C
[0004a346] 4240                      clr.w      d0
[0004a348] 6000 0148                 bra        $0004A492
[0004a34c] 33fc 0001 000e 0790       move.w     #$0001,dead_handling
[0004a354] 3039 000e 0792            move.w     dead_key,d0
[0004a35a] 6700 00d8                 beq        $0004A434
[0004a35e] 70ff                      moveq.l    #-1,d0
[0004a360] c039 000e 0793            and.b      $000E0793,d0
[0004a366] 4880                      ext.w      d0
[0004a368] 41f9 000e 073e            lea.l      DeadKeys,a0
[0004a36e] 4eb9 0008 2e8a            jsr        strchr
[0004a374] 2e88                      move.l     a0,(a7)
[0004a376] 2017                      move.l     (a7),d0
[0004a378] 6700 00b2                 beq        $0004A42C
[0004a37c] 2057                      movea.l    (a7),a0
[0004a37e] 91fc 000e 073e            suba.l     #DeadKeys,a0
[0004a384] 3f48 0012                 move.w     a0,18(a7)
[0004a388] 70ff                      moveq.l    #-1,d0
[0004a38a] c02f 000b                 and.b      11(a7),d0
[0004a38e] 4880                      ext.w      d0
[0004a390] 322f 0012                 move.w     18(a7),d1
[0004a394] e749                      lsl.w      #3,d1
[0004a396] 41f9 000e 0748            lea.l      CombKeys,a0
[0004a39c] 2070 1000                 movea.l    0(a0,d1.w),a0
[0004a3a0] 4eb9 0008 2e8a            jsr        strchr
[0004a3a6] 2e88                      move.l     a0,(a7)
[0004a3a8] 302f 000a                 move.w     10(a7),d0
[0004a3ac] c07c 8000                 and.w      #$8000,d0
[0004a3b0] 665a                      bne.s      $0004A40C
[0004a3b2] 2017                      move.l     (a7),d0
[0004a3b4] 6756                      beq.s      $0004A40C
[0004a3b6] 70ff                      moveq.l    #-1,d0
[0004a3b8] c039 000e 0793            and.b      $000E0793,d0
[0004a3be] 4880                      ext.w      d0
[0004a3c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a3c6] 41e8 04f2                 lea.l      1266(a0),a0
[0004a3ca] 4eb9 0008 2e8a            jsr        strchr
[0004a3d0] 2008                      move.l     a0,d0
[0004a3d2] 6738                      beq.s      $0004A40C
[0004a3d4] 2057                      movea.l    (a7),a0
[0004a3d6] 302f 0012                 move.w     18(a7),d0
[0004a3da] e748                      lsl.w      #3,d0
[0004a3dc] 43f9 000e 0748            lea.l      CombKeys,a1
[0004a3e2] 91f1 0000                 suba.l     0(a1,d0.w),a0
[0004a3e6] 3f48 0010                 move.w     a0,16(a7)
[0004a3ea] 302f 0010                 move.w     16(a7),d0
[0004a3ee] 322f 0012                 move.w     18(a7),d1
[0004a3f2] e749                      lsl.w      #3,d1
[0004a3f4] 41f9 000e 0748            lea.l      CombKeys,a0
[0004a3fa] 2070 1004                 movea.l    4(a0,d1.w),a0
[0004a3fe] 1030 0000                 move.b     0(a0,d0.w),d0
[0004a402] 4880                      ext.w      d0
[0004a404] 206f 0006                 movea.l    6(a7),a0
[0004a408] 3080                      move.w     d0,(a0)
[0004a40a] 6020                      bra.s      $0004A42C
[0004a40c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a412] 3179 000e 0792 02ce       move.w     dead_key,718(a0)
[0004a41a] 206f 000c                 movea.l    12(a7),a0
[0004a41e] 4eb9 0004 a498            jsr        evkeybrd
[0004a424] 206f 0006                 movea.l    6(a7),a0
[0004a428] 30af 000a                 move.w     10(a7),(a0)
[0004a42c] 4279 000e 0792            clr.w      dead_key
[0004a432] 6054                      bra.s      $0004A488
[0004a434] 302f 000a                 move.w     10(a7),d0
[0004a438] c07c 8000                 and.w      #$8000,d0
[0004a43c] 664a                      bne.s      $0004A488
[0004a43e] 70ff                      moveq.l    #-1,d0
[0004a440] c02f 000b                 and.b      11(a7),d0
[0004a444] 4880                      ext.w      d0
[0004a446] 41f9 000e 073e            lea.l      DeadKeys,a0
[0004a44c] 4eb9 0008 2e8a            jsr        strchr
[0004a452] 2e88                      move.l     a0,(a7)
[0004a454] 2017                      move.l     (a7),d0
[0004a456] 6730                      beq.s      $0004A488
[0004a458] 70ff                      moveq.l    #-1,d0
[0004a45a] c02f 000b                 and.b      11(a7),d0
[0004a45e] 4880                      ext.w      d0
[0004a460] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a466] 41e8 04f2                 lea.l      1266(a0),a0
[0004a46a] 4eb9 0008 2e8a            jsr        strchr
[0004a470] 2008                      move.l     a0,d0
[0004a472] 6714                      beq.s      $0004A488
[0004a474] 33ef 000a 000e 0792       move.w     10(a7),dead_key
[0004a47c] 206f 0006                 movea.l    6(a7),a0
[0004a480] 4250                      clr.w      (a0)
[0004a482] 3f7c 0001 0004            move.w     #$0001,4(a7)
[0004a488] 4279 000e 0790            clr.w      dead_handling
[0004a48e] 302f 0004                 move.w     4(a7),d0
[0004a492] 4fef 0014                 lea.l      20(a7),a7
[0004a496] 4e75                      rts
evkeybrd:
[0004a498] 2f0a                      move.l     a2,-(a7)
[0004a49a] 4fef ffe0                 lea.l      -32(a7),a7
[0004a49e] 2f48 001c                 move.l     a0,28(a7)
[0004a4a2] 41f9 000e 0794            lea.l      $000E0794,a0
[0004a4a8] 43ef 0006                 lea.l      6(a7),a1
[0004a4ac] 700f                      moveq.l    #15,d0
[0004a4ae] 12d8                      move.b     (a0)+,(a1)+
[0004a4b0] 51c8 fffc                 dbf        d0,$0004A4AE
[0004a4b4] 3f7c ffff 0004            move.w     #$FFFF,4(a7)
[0004a4ba] 4297                      clr.l      (a7)
[0004a4bc] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004a4c2] 43e9 02ce                 lea.l      718(a1),a1
[0004a4c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a4cc] 3028 02ce                 move.w     718(a0),d0
[0004a4d0] 206f 001c                 movea.l    28(a7),a0
[0004a4d4] 6100 fe4c                 bsr        IsDeadKey
[0004a4d8] 4a40                      tst.w      d0
[0004a4da] 6706                      beq.s      $0004A4E2
[0004a4dc] 4240                      clr.w      d0
[0004a4de] 6000 03c2                 bra        $0004A8A2
[0004a4e2] 4eb9 0005 5e8c            jsr        Awi_root
[0004a4e8] 2f48 0018                 move.l     a0,24(a7)
[0004a4ec] 202f 001c                 move.l     28(a7),d0
[0004a4f0] 6652                      bne.s      $0004A544
[0004a4f2] 42a7                      clr.l      -(a7)
[0004a4f4] 42a7                      clr.l      -(a7)
[0004a4f6] 42a7                      clr.l      -(a7)
[0004a4f8] 486f 0022                 pea.l      34(a7)
[0004a4fc] 720a                      moveq.l    #10,d1
[0004a4fe] 4240                      clr.w      d0
[0004a500] 4eb9 0007 f7ba            jsr        wind_get
[0004a506] 4fef 0010                 lea.l      16(a7),a7
[0004a50a] 302f 0016                 move.w     22(a7),d0
[0004a50e] 4eb9 0005 5e68            jsr        Awi_wid
[0004a514] 2f48 001c                 move.l     a0,28(a7)
[0004a518] 202f 001c                 move.l     28(a7),d0
[0004a51c] 6626                      bne.s      $0004A544
[0004a51e] 3039 0011 4528            move.w     _ACSv_wmenu,d0
[0004a524] 661e                      bne.s      $0004A544
[0004a526] 206f 0018                 movea.l    24(a7),a0
[0004a52a] 3028 0020                 move.w     32(a0),d0
[0004a52e] 6a0e                      bpl.s      $0004A53E
[0004a530] 206f 0018                 movea.l    24(a7),a0
[0004a534] 226f 0018                 movea.l    24(a7),a1
[0004a538] 2269 000c                 movea.l    12(a1),a1
[0004a53c] 4e91                      jsr        (a1)
[0004a53e] 70ff                      moveq.l    #-1,d0
[0004a540] 6000 0360                 bra        $0004A8A2
[0004a544] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004a54a] 43e9 02ce                 lea.l      718(a1),a1
[0004a54e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a554] 41e8 0266                 lea.l      614(a0),a0
[0004a558] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004a55e] 246a 02b6                 movea.l    694(a2),a2
[0004a562] 4e92                      jsr        (a2)
[0004a564] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a56a] 3028 02ce                 move.w     718(a0),d0
[0004a56e] 6608                      bne.s      $0004A578
[0004a570] 302f 0004                 move.w     4(a7),d0
[0004a574] 6000 032c                 bra        $0004A8A2
[0004a578] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a57e] 3028 02ce                 move.w     718(a0),d0
[0004a582] c07c 0c00                 and.w      #$0C00,d0
[0004a586] b07c 0c00                 cmp.w      #$0C00,d0
[0004a58a] 662e                      bne.s      $0004A5BA
[0004a58c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a592] 1028 02cf                 move.b     719(a0),d0
[0004a596] 4880                      ext.w      d0
[0004a598] 907c 0051                 sub.w      #$0051,d0
[0004a59c] 6702                      beq.s      $0004A5A0
[0004a59e] 601a                      bra.s      $0004A5BA
[0004a5a0] 3039 000e 07a4            move.w     quote,d0
[0004a5a6] 6610                      bne.s      $0004A5B8
[0004a5a8] 33fc 0001 000e 07a4       move.w     #$0001,quote
[0004a5b0] 302f 0004                 move.w     4(a7),d0
[0004a5b4] 6000 02ec                 bra        $0004A8A2
[0004a5b8] 4e71                      nop
[0004a5ba] 3039 000e 073c            move.w     hidepointer,d0
[0004a5c0] 6620                      bne.s      $0004A5E2
[0004a5c2] 7008                      moveq.l    #8,d0
[0004a5c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a5ca] 2068 023c                 movea.l    572(a0),a0
[0004a5ce] c068 000e                 and.w      14(a0),d0
[0004a5d2] 670e                      beq.s      $0004A5E2
[0004a5d4] 33fc 0001 000e 073c       move.w     #$0001,hidepointer
[0004a5dc] 4eb9 0004 ef40            jsr        Amo_hide
[0004a5e2] 3039 000e 07a4            move.w     quote,d0
[0004a5e8] 6600 01e0                 bne        $0004A7CA
[0004a5ec] 202f 001c                 move.l     28(a7),d0
[0004a5f0] 6700 0152                 beq        $0004A744
[0004a5f4] 4eb9 0005 7b82            jsr        Awi_modal
[0004a5fa] 2008                      move.l     a0,d0
[0004a5fc] 6628                      bne.s      $0004A626
[0004a5fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a604] 3228 02ce                 move.w     718(a0),d1
[0004a608] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a60e] 3028 0266                 move.w     614(a0),d0
[0004a612] 206f 001c                 movea.l    28(a7),a0
[0004a616] 4eb9 0004 ea9c            jsr        Ame_key
[0004a61c] 3f40 0004                 move.w     d0,4(a7)
[0004a620] 6b04                      bmi.s      $0004A626
[0004a622] 6000 027a                 bra        $0004A89E
[0004a626] 303c 0080                 move.w     #$0080,d0
[0004a62a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a630] 2068 023c                 movea.l    572(a0),a0
[0004a634] c068 000e                 and.w      14(a0),d0
[0004a638] 6700 0088                 beq        $0004A6C2
[0004a63c] 4eb9 0005 7b82            jsr        Awi_modal
[0004a642] 2008                      move.l     a0,d0
[0004a644] 6628                      bne.s      $0004A66E
[0004a646] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a64c] 3228 02ce                 move.w     718(a0),d1
[0004a650] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a656] 3028 0266                 move.w     614(a0),d0
[0004a65a] 206f 0018                 movea.l    24(a7),a0
[0004a65e] 4eb9 0004 ea9c            jsr        Ame_key
[0004a664] 3f40 0004                 move.w     d0,4(a7)
[0004a668] 6b04                      bmi.s      $0004A66E
[0004a66a] 6000 0232                 bra        $0004A89E
[0004a66e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a674] 3228 02ce                 move.w     718(a0),d1
[0004a678] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a67e] 3028 0266                 move.w     614(a0),d0
[0004a682] 206f 001c                 movea.l    28(a7),a0
[0004a686] 4eb9 0005 0334            jsr        Aob_tobkey
[0004a68c] 3f40 0004                 move.w     d0,4(a7)
[0004a690] 6b04                      bmi.s      $0004A696
[0004a692] 6000 020a                 bra        $0004A89E
[0004a696] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a69c] 3228 02ce                 move.w     718(a0),d1
[0004a6a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a6a6] 3028 0266                 move.w     614(a0),d0
[0004a6aa] 206f 001c                 movea.l    28(a7),a0
[0004a6ae] 4eb9 0005 03d0            jsr        Aob_wobkey
[0004a6b4] 3f40 0004                 move.w     d0,4(a7)
[0004a6b8] 6b04                      bmi.s      $0004A6BE
[0004a6ba] 6000 01e2                 bra        $0004A89E
[0004a6be] 6000 0084                 bra        $0004A744
[0004a6c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a6c8] 3228 02ce                 move.w     718(a0),d1
[0004a6cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a6d2] 3028 0266                 move.w     614(a0),d0
[0004a6d6] 206f 001c                 movea.l    28(a7),a0
[0004a6da] 4eb9 0005 0334            jsr        Aob_tobkey
[0004a6e0] 3f40 0004                 move.w     d0,4(a7)
[0004a6e4] 6b04                      bmi.s      $0004A6EA
[0004a6e6] 6000 01b6                 bra        $0004A89E
[0004a6ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a6f0] 3228 02ce                 move.w     718(a0),d1
[0004a6f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a6fa] 3028 0266                 move.w     614(a0),d0
[0004a6fe] 206f 001c                 movea.l    28(a7),a0
[0004a702] 4eb9 0005 03d0            jsr        Aob_wobkey
[0004a708] 3f40 0004                 move.w     d0,4(a7)
[0004a70c] 6b04                      bmi.s      $0004A712
[0004a70e] 6000 018e                 bra        $0004A89E
[0004a712] 4eb9 0005 7b82            jsr        Awi_modal
[0004a718] 2008                      move.l     a0,d0
[0004a71a] 6628                      bne.s      $0004A744
[0004a71c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a722] 3228 02ce                 move.w     718(a0),d1
[0004a726] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a72c] 3028 0266                 move.w     614(a0),d0
[0004a730] 206f 0018                 movea.l    24(a7),a0
[0004a734] 4eb9 0004 ea9c            jsr        Ame_key
[0004a73a] 3f40 0004                 move.w     d0,4(a7)
[0004a73e] 6b04                      bmi.s      $0004A744
[0004a740] 6000 015c                 bra        $0004A89E
[0004a744] 4eb9 0005 7b82            jsr        Awi_modal
[0004a74a] 2008                      move.l     a0,d0
[0004a74c] 6600 007c                 bne.w      $0004A7CA
[0004a750] 202f 0018                 move.l     24(a7),d0
[0004a754] 6774                      beq.s      $0004A7CA
[0004a756] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a75c] 3228 02ce                 move.w     718(a0),d1
[0004a760] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a766] 3028 0266                 move.w     614(a0),d0
[0004a76a] 206f 0018                 movea.l    24(a7),a0
[0004a76e] 4eb9 0004 ea9c            jsr        Ame_key
[0004a774] 3f40 0004                 move.w     d0,4(a7)
[0004a778] 6a50                      bpl.s      $0004A7CA
[0004a77a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a780] 3228 02ce                 move.w     718(a0),d1
[0004a784] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a78a] 3028 0266                 move.w     614(a0),d0
[0004a78e] 206f 0018                 movea.l    24(a7),a0
[0004a792] 4eb9 0005 0334            jsr        Aob_tobkey
[0004a798] 3f40 0004                 move.w     d0,4(a7)
[0004a79c] 6b04                      bmi.s      $0004A7A2
[0004a79e] 6000 00fe                 bra        $0004A89E
[0004a7a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a7a8] 3228 02ce                 move.w     718(a0),d1
[0004a7ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a7b2] 3028 0266                 move.w     614(a0),d0
[0004a7b6] 206f 0018                 movea.l    24(a7),a0
[0004a7ba] 4eb9 0005 03d0            jsr        Aob_wobkey
[0004a7c0] 3f40 0004                 move.w     d0,4(a7)
[0004a7c4] 6b04                      bmi.s      $0004A7CA
[0004a7c6] 6000 00d6                 bra        $0004A89E
[0004a7ca] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004a7d0] 43e9 02ce                 lea.l      718(a1),a1
[0004a7d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a7da] 41e8 0266                 lea.l      614(a0),a0
[0004a7de] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004a7e4] 246a 02c2                 movea.l    706(a2),a2
[0004a7e8] 4e92                      jsr        (a2)
[0004a7ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a7f0] 3028 02ce                 move.w     718(a0),d0
[0004a7f4] 6604                      bne.s      $0004A7FA
[0004a7f6] 6000 00a6                 bra        $0004A89E
[0004a7fa] 202f 001c                 move.l     28(a7),d0
[0004a7fe] 6726                      beq.s      $0004A826
[0004a800] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a806] 3228 02ce                 move.w     718(a0),d1
[0004a80a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a810] 3028 0266                 move.w     614(a0),d0
[0004a814] 206f 001c                 movea.l    28(a7),a0
[0004a818] 226f 001c                 movea.l    28(a7),a1
[0004a81c] 2269 0062                 movea.l    98(a1),a1
[0004a820] 4e91                      jsr        (a1)
[0004a822] 3f40 0004                 move.w     d0,4(a7)
[0004a826] 0c6f ffff 0004            cmpi.w     #$FFFF,4(a7)
[0004a82c] 6c6a                      bge.s      $0004A898
[0004a82e] 605c                      bra.s      $0004A88C
[0004a830] 7004                      moveq.l    #4,d0
[0004a832] 2057                      movea.l    (a7),a0
[0004a834] c0a8 0002                 and.l      2(a0),d0
[0004a838] 6752                      beq.s      $0004A88C
[0004a83a] 7001                      moveq.l    #1,d0
[0004a83c] 2057                      movea.l    (a7),a0
[0004a83e] c068 000c                 and.w      12(a0),d0
[0004a842] 6748                      beq.s      $0004A88C
[0004a844] 3f7c 4710 0006            move.w     #$4710,6(a7)
[0004a84a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a850] 3f50 0008                 move.w     (a0),8(a7)
[0004a854] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a85a] 3f68 0266 000c            move.w     614(a0),12(a7)
[0004a860] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a866] 3028 02ce                 move.w     718(a0),d0
[0004a86a] 4eb9 0004 4330            jsr        nkc_n2gem
[0004a870] 3f40 000e                 move.w     d0,14(a7)
[0004a874] 2279 000e 692a            movea.l    _globl,a1
[0004a87a] 41ef 0006                 lea.l      6(a7),a0
[0004a87e] 7210                      moveq.l    #16,d1
[0004a880] 2457                      movea.l    (a7),a2
[0004a882] 3012                      move.w     (a2),d0
[0004a884] 4eb9 0007 8ae8            jsr        mt_appl_write
[0004a88a] 600c                      bra.s      $0004A898
[0004a88c] 2057                      movea.l    (a7),a0
[0004a88e] 4eb9 0005 dd58            jsr        Ash_nextdd
[0004a894] 2e88                      move.l     a0,(a7)
[0004a896] 6698                      bne.s      $0004A830
[0004a898] 4279 000e 07a4            clr.w      quote
[0004a89e] 302f 0004                 move.w     4(a7),d0
[0004a8a2] 4fef 0020                 lea.l      32(a7),a7
[0004a8a6] 245f                      movea.l    (a7)+,a2
[0004a8a8] 4e75                      rts
ev_dobutton:
[0004a8aa] 4fef ffde                 lea.l      -34(a7),a7
[0004a8ae] 2f48 001e                 move.l     a0,30(a7)
[0004a8b2] 2f49 001a                 move.l     a1,26(a7)
[0004a8b6] 3f40 0018                 move.w     d0,24(a7)
[0004a8ba] 3f41 0016                 move.w     d1,22(a7)
[0004a8be] 3f42 0014                 move.w     d2,20(a7)
[0004a8c2] 3f7c ffff 0008            move.w     #$FFFF,8(a7)
[0004a8c8] 3f2f 0016                 move.w     22(a7),-(a7)
[0004a8cc] 342f 001a                 move.w     26(a7),d2
[0004a8d0] 7208                      moveq.l    #8,d1
[0004a8d2] 4240                      clr.w      d0
[0004a8d4] 206f 001c                 movea.l    28(a7),a0
[0004a8d8] 4eb9 0004 8fd4            jsr        Adr_find
[0004a8de] 544f                      addq.w     #2,a7
[0004a8e0] 3f40 000c                 move.w     d0,12(a7)
[0004a8e4] 302f 000c                 move.w     12(a7),d0
[0004a8e8] 6a06                      bpl.s      $0004A8F0
[0004a8ea] 70ff                      moveq.l    #-1,d0
[0004a8ec] 6000 0208                 bra        $0004AAF6
[0004a8f0] 426f 0012                 clr.w      18(a7)
[0004a8f4] 426f 000e                 clr.w      14(a7)
[0004a8f8] 3f6f 000c 000a            move.w     12(a7),10(a7)
[0004a8fe] 6012                      bra.s      $0004A912
[0004a900] 302f 000a                 move.w     10(a7),d0
[0004a904] 206f 001a                 movea.l    26(a7),a0
[0004a908] 4eb9 0005 0f3a            jsr        Aob_up
[0004a90e] 3f40 000a                 move.w     d0,10(a7)
[0004a912] 302f 000a                 move.w     10(a7),d0
[0004a916] 6b1c                      bmi.s      $0004A934
[0004a918] 322f 000a                 move.w     10(a7),d1
[0004a91c] 48c1                      ext.l      d1
[0004a91e] 2001                      move.l     d1,d0
[0004a920] d080                      add.l      d0,d0
[0004a922] d081                      add.l      d1,d0
[0004a924] e788                      lsl.l      #3,d0
[0004a926] 206f 001a                 movea.l    26(a7),a0
[0004a92a] 3030 0808                 move.w     8(a0,d0.l),d0
[0004a92e] c07c 2049                 and.w      #$2049,d0
[0004a932] 67cc                      beq.s      $0004A900
[0004a934] 302f 000a                 move.w     10(a7),d0
[0004a938] 6b06                      bmi.s      $0004A940
[0004a93a] 3f6f 000a 000c            move.w     10(a7),12(a7)
[0004a940] 322f 000c                 move.w     12(a7),d1
[0004a944] 48c1                      ext.l      d1
[0004a946] 2001                      move.l     d1,d0
[0004a948] d080                      add.l      d0,d0
[0004a94a] d081                      add.l      d1,d0
[0004a94c] e788                      lsl.l      #3,d0
[0004a94e] 206f 001a                 movea.l    26(a7),a0
[0004a952] d1c0                      adda.l     d0,a0
[0004a954] 2e88                      move.l     a0,(a7)
[0004a956] 0c6f 0002 0014            cmpi.w     #$0002,20(a7)
[0004a95c] 6c00 00e2                 bge        $0004AA40
[0004a960] 2057                      movea.l    (a7),a0
[0004a962] 3028 0008                 move.w     8(a0),d0
[0004a966] c07c 2049                 and.w      #$2049,d0
[0004a96a] 6624                      bne.s      $0004A990
[0004a96c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a972] 3228 0264                 move.w     612(a0),d1
[0004a976] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a97c] 3028 0262                 move.w     610(a0),d0
[0004a980] 4eb9 0004 84fe            jsr        Adr_box
[0004a986] 70ff                      moveq.l    #-1,d0
[0004a988] 6000 016c                 bra        $0004AAF6
[0004a98c] 6000 00b2                 bra        $0004AA40
[0004a990] 2057                      movea.l    (a7),a0
[0004a992] 3028 0008                 move.w     8(a0),d0
[0004a996] c07c 205d                 and.w      #$205D,d0
[0004a99a] 5340                      subq.w     #1,d0
[0004a99c] 660a                      bne.s      $0004A9A8
[0004a99e] 3f7c 0001 0012            move.w     #$0001,18(a7)
[0004a9a4] 6000 009a                 bra        $0004AA40
[0004a9a8] 2057                      movea.l    (a7),a0
[0004a9aa] 3028 0008                 move.w     8(a0),d0
[0004a9ae] c07c 2000                 and.w      #$2000,d0
[0004a9b2] 6766                      beq.s      $0004AA1A
[0004a9b4] 7001                      moveq.l    #1,d0
[0004a9b6] 2057                      movea.l    (a7),a0
[0004a9b8] c068 000a                 and.w      10(a0),d0
[0004a9bc] 6738                      beq.s      $0004A9F6
[0004a9be] 7003                      moveq.l    #3,d0
[0004a9c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a9c6] c068 0266                 and.w      614(a0),d0
[0004a9ca] 6708                      beq.s      $0004A9D4
[0004a9cc] 3f7c 0001 0012            move.w     #$0001,18(a7)
[0004a9d2] 6020                      bra.s      $0004A9F4
[0004a9d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a9da] 3228 0264                 move.w     612(a0),d1
[0004a9de] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a9e4] 3028 0262                 move.w     610(a0),d0
[0004a9e8] 4eb9 0004 9140            jsr        Adr_drag
[0004a9ee] 70ff                      moveq.l    #-1,d0
[0004a9f0] 6000 0104                 bra        $0004AAF6
[0004a9f4] 6022                      bra.s      $0004AA18
[0004a9f6] 7003                      moveq.l    #3,d0
[0004a9f8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a9fe] c068 0266                 and.w      614(a0),d0
[0004aa02] 670e                      beq.s      $0004AA12
[0004aa04] 3f7c 0001 0012            move.w     #$0001,18(a7)
[0004aa0a] 3f7c 0001 000e            move.w     #$0001,14(a7)
[0004aa10] 6006                      bra.s      $0004AA18
[0004aa12] 4eb9 0004 810e            jsr        Adr_unselect
[0004aa18] 6026                      bra.s      $0004AA40
[0004aa1a] 7004                      moveq.l    #4,d0
[0004aa1c] 2057                      movea.l    (a7),a0
[0004aa1e] c068 0008                 and.w      8(a0),d0
[0004aa22] 671c                      beq.s      $0004AA40
[0004aa24] 302f 0028                 move.w     40(a7),d0
[0004aa28] 806f 000c                 or.w       12(a7),d0
[0004aa2c] 206f 001e                 movea.l    30(a7),a0
[0004aa30] 4eb9 0005 09a4            jsr        Aob_watch
[0004aa36] 4a40                      tst.w      d0
[0004aa38] 6606                      bne.s      $0004AA40
[0004aa3a] 70ff                      moveq.l    #-1,d0
[0004aa3c] 6000 00b8                 bra        $0004AAF6
[0004aa40] 0c6f 0002 0014            cmpi.w     #$0002,20(a7)
[0004aa46] 6d04                      blt.s      $0004AA4C
[0004aa48] 7201                      moveq.l    #1,d1
[0004aa4a] 6002                      bra.s      $0004AA4E
[0004aa4c] 4241                      clr.w      d1
[0004aa4e] 302f 000c                 move.w     12(a7),d0
[0004aa52] 226f 001a                 movea.l    26(a7),a1
[0004aa56] 206f 001e                 movea.l    30(a7),a0
[0004aa5a] 4eb9 0005 0696            jsr        Aob_select
[0004aa60] 4a40                      tst.w      d0
[0004aa62] 670c                      beq.s      $0004AA70
[0004aa64] 302f 0028                 move.w     40(a7),d0
[0004aa68] 806f 000c                 or.w       12(a7),d0
[0004aa6c] 3f40 0008                 move.w     d0,8(a7)
[0004aa70] 302f 0012                 move.w     18(a7),d0
[0004aa74] 6700 007c                 beq.w      $0004AAF2
[0004aa78] 3f7c 0002 0010            move.w     #$0002,16(a7)
[0004aa7e] 536f 0010                 subq.w     #1,16(a7)
[0004aa82] 2079 000e 692a            movea.l    _globl,a0
[0004aa88] 700a                      moveq.l    #10,d0
[0004aa8a] 4eb9 0007 91d4            jsr        mt_evnt_timer
[0004aa90] 2f39 000e 692a            move.l     _globl,-(a7)
[0004aa96] 486f 000a                 pea.l      10(a7)
[0004aa9a] 486f 000c                 pea.l      12(a7)
[0004aa9e] 43ef 0012                 lea.l      18(a7),a1
[0004aaa2] 41ef 0012                 lea.l      18(a7),a0
[0004aaa6] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0004aaac] 4fef 000c                 lea.l      12(a7),a7
[0004aab0] 302f 0004                 move.w     4(a7),d0
[0004aab4] 322f 0026                 move.w     38(a7),d1
[0004aab8] b340                      eor.w      d1,d0
[0004aaba] c07c 0001                 and.w      #$0001,d0
[0004aabe] 660c                      bne.s      $0004AACC
[0004aac0] 302f 0010                 move.w     16(a7),d0
[0004aac4] 6eb8                      bgt.s      $0004AA7E
[0004aac6] 302f 000e                 move.w     14(a7),d0
[0004aaca] 67b2                      beq.s      $0004AA7E
[0004aacc] 302f 000e                 move.w     14(a7),d0
[0004aad0] 6720                      beq.s      $0004AAF2
[0004aad2] 302f 0010                 move.w     16(a7),d0
[0004aad6] 6e1a                      bgt.s      $0004AAF2
[0004aad8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004aade] 3228 0264                 move.w     612(a0),d1
[0004aae2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004aae8] 3028 0262                 move.w     610(a0),d0
[0004aaec] 4eb9 0004 9140            jsr        Adr_drag
[0004aaf2] 302f 0008                 move.w     8(a7),d0
[0004aaf6] 4fef 0022                 lea.l      34(a7),a7
[0004aafa] 4e75                      rts
evmwheel:
[0004aafc] 4fef fff2                 lea.l      -14(a7),a7
[0004ab00] 2f48 000a                 move.l     a0,10(a7)
[0004ab04] 3f40 0008                 move.w     d0,8(a7)
[0004ab08] 3f41 0006                 move.w     d1,6(a7)
[0004ab0c] 2079 000e 692a            movea.l    _globl,a0
[0004ab12] 322f 0006                 move.w     6(a7),d1
[0004ab16] 302f 0008                 move.w     8(a7),d0
[0004ab1a] 4eb9 0007 b81c            jsr        mt_wind_find
[0004ab20] 3f40 0004                 move.w     d0,4(a7)
[0004ab24] 302f 0004                 move.w     4(a7),d0
[0004ab28] 6b0c                      bmi.s      $0004AB36
[0004ab2a] 302f 0004                 move.w     4(a7),d0
[0004ab2e] 4eb9 0005 5e68            jsr        Awi_wid
[0004ab34] 6006                      bra.s      $0004AB3C
[0004ab36] 4eb9 0005 5c5a            jsr        Awi_ontop
[0004ab3c] 2e88                      move.l     a0,(a7)
[0004ab3e] 2017                      move.l     (a7),d0
[0004ab40] 6718                      beq.s      $0004AB5A
[0004ab42] 322f 0006                 move.w     6(a7),d1
[0004ab46] 302f 0008                 move.w     8(a7),d0
[0004ab4a] 226f 000a                 movea.l    10(a7),a1
[0004ab4e] 2057                      movea.l    (a7),a0
[0004ab50] 4eb9 0005 2606            jsr        Awi_wheeled
[0004ab56] 6006                      bra.s      $0004AB5E
[0004ab58] 6004                      bra.s      $0004AB5E
[0004ab5a] 4240                      clr.w      d0
[0004ab5c] 4e71                      nop
[0004ab5e] 4fef 000e                 lea.l      14(a7),a7
[0004ab62] 4e75                      rts
evbutton:
[0004ab64] 2f0a                      move.l     a2,-(a7)
[0004ab66] 4fef ffe2                 lea.l      -30(a7),a7
[0004ab6a] 3f40 001c                 move.w     d0,28(a7)
[0004ab6e] 3f41 001a                 move.w     d1,26(a7)
[0004ab72] 426f 0012                 clr.w      18(a7)
[0004ab76] 6100 f780                 bsr        Aev_unhidepointer
[0004ab7a] 43ef 001a                 lea.l      26(a7),a1
[0004ab7e] 41ef 001c                 lea.l      28(a7),a0
[0004ab82] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004ab88] 246a 02ba                 movea.l    698(a2),a2
[0004ab8c] 4e92                      jsr        (a2)
[0004ab8e] 2079 000e 692a            movea.l    _globl,a0
[0004ab94] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004ab9a] 3229 0264                 move.w     612(a1),d1
[0004ab9e] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004aba4] 3029 0262                 move.w     610(a1),d0
[0004aba8] 4eb9 0007 b81c            jsr        mt_wind_find
[0004abae] 3f40 0018                 move.w     d0,24(a7)
[0004abb2] 302f 0018                 move.w     24(a7),d0
[0004abb6] 4eb9 0005 5e68            jsr        Awi_wid
[0004abbc] 2f48 0008                 move.l     a0,8(a7)
[0004abc0] 202f 0008                 move.l     8(a7),d0
[0004abc4] 6606                      bne.s      $0004ABCC
[0004abc6] 70ff                      moveq.l    #-1,d0
[0004abc8] 6000 0272                 bra        $0004AE3C
[0004abcc] 4eb9 0005 7b82            jsr        Awi_modal
[0004abd2] 2f48 0004                 move.l     a0,4(a7)
[0004abd6] 202f 0004                 move.l     4(a7),d0
[0004abda] 6716                      beq.s      $0004ABF2
[0004abdc] 206f 0004                 movea.l    4(a7),a0
[0004abe0] b1ef 0008                 cmpa.l     8(a7),a0
[0004abe4] 670c                      beq.s      $0004ABF2
[0004abe6] 4eb9 0005 7bb6            jsr        Awi_up_modal
[0004abec] 70ff                      moveq.l    #-1,d0
[0004abee] 6000 024c                 bra        $0004AE3C
[0004abf2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004abf8] 3028 0264                 move.w     612(a0),d0
[0004abfc] 206f 0008                 movea.l    8(a7),a0
[0004ac00] 9068 0036                 sub.w      54(a0),d0
[0004ac04] 3f40 0014                 move.w     d0,20(a7)
[0004ac08] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ac0e] 3028 0262                 move.w     610(a0),d0
[0004ac12] 206f 0008                 movea.l    8(a7),a0
[0004ac16] 9068 0034                 sub.w      52(a0),d0
[0004ac1a] 3f40 0016                 move.w     d0,22(a7)
[0004ac1e] 7002                      moveq.l    #2,d0
[0004ac20] c06f 001c                 and.w      28(a7),d0
[0004ac24] 6700 0136                 beq        $0004AD5C
[0004ac28] 2f39 000e 692a            move.l     _globl,-(a7)
[0004ac2e] 486f 0012                 pea.l      18(a7)
[0004ac32] 486f 0014                 pea.l      20(a7)
[0004ac36] 43ef 001a                 lea.l      26(a7),a1
[0004ac3a] 41ef 001a                 lea.l      26(a7),a0
[0004ac3e] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0004ac44] 4fef 000c                 lea.l      12(a7),a7
[0004ac48] 7002                      moveq.l    #2,d0
[0004ac4a] c06f 000c                 and.w      12(a7),d0
[0004ac4e] 6750                      beq.s      $0004ACA0
[0004ac50] 2f39 000e 692a            move.l     _globl,-(a7)
[0004ac56] 486f 0012                 pea.l      18(a7)
[0004ac5a] 486f 0016                 pea.l      22(a7)
[0004ac5e] 486f 001a                 pea.l      26(a7)
[0004ac62] 486f 001c                 pea.l      28(a7)
[0004ac66] 486f 0022                 pea.l      34(a7)
[0004ac6a] 4878 00fa                 pea.l      ($000000FA).w
[0004ac6e] 4267                      clr.w      -(a7)
[0004ac70] 4267                      clr.w      -(a7)
[0004ac72] 4267                      clr.w      -(a7)
[0004ac74] 4267                      clr.w      -(a7)
[0004ac76] 4267                      clr.w      -(a7)
[0004ac78] 4267                      clr.w      -(a7)
[0004ac7a] 4267                      clr.w      -(a7)
[0004ac7c] 4267                      clr.w      -(a7)
[0004ac7e] 4267                      clr.w      -(a7)
[0004ac80] 4267                      clr.w      -(a7)
[0004ac82] 4267                      clr.w      -(a7)
[0004ac84] 43ef 0040                 lea.l      64(a7),a1
[0004ac88] 91c8                      suba.l     a0,a0
[0004ac8a] 7402                      moveq.l    #2,d2
[0004ac8c] 4241                      clr.w      d1
[0004ac8e] 7022                      moveq.l    #34,d0 MU_TIMER | MU_BUTTON
[0004ac90] 4eb9 0007 9240            jsr        mt_evnt_multi
[0004ac96] 4fef 0032                 lea.l      50(a7),a7
[0004ac9a] 3f40 0010                 move.w     d0,16(a7)
[0004ac9e] 6006                      bra.s      $0004ACA6
[0004aca0] 3f7c 0002 0010            move.w     #$0002,16(a7)
[0004aca6] 7002                      moveq.l    #2,d0
[0004aca8] c06f 0010                 and.w      16(a7),d0
[0004acac] 6724                      beq.s      $0004ACD2
[0004acae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004acb4] 3228 0264                 move.w     612(a0),d1
[0004acb8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004acbe] 3028 0262                 move.w     610(a0),d0
[0004acc2] 206f 0008                 movea.l    8(a7),a0
[0004acc6] 4eb9 0005 b292            jsr        Awi_bubblegem
[0004accc] 3f40 0012                 move.w     d0,18(a7)
[0004acd0] 602a                      bra.s      $0004ACFC
[0004acd2] 7020                      moveq.l    #32,d0
[0004acd4] c06f 0010                 and.w      16(a7),d0
[0004acd8] 6722                      beq.s      $0004ACFC
[0004acda] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ace0] 3228 0264                 move.w     612(a0),d1
[0004ace4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004acea] 3028 0262                 move.w     610(a0),d0
[0004acee] 206f 0008                 movea.l    8(a7),a0
[0004acf2] 4eb9 0005 b2f0            jsr        Awi_context
[0004acf8] 3f40 0012                 move.w     d0,18(a7)
[0004acfc] 302f 0012                 move.w     18(a7),d0
[0004ad00] 6656                      bne.s      $0004AD58
[0004ad02] 7002                      moveq.l    #2,d0
[0004ad04] c06f 0010                 and.w      16(a7),d0
[0004ad08] 6724                      beq.s      $0004AD2E
[0004ad0a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ad10] 3228 0264                 move.w     612(a0),d1
[0004ad14] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ad1a] 3028 0262                 move.w     610(a0),d0
[0004ad1e] 206f 0008                 movea.l    8(a7),a0
[0004ad22] 4eb9 0005 b2f0            jsr        Awi_context
[0004ad28] 3f40 0012                 move.w     d0,18(a7)
[0004ad2c] 602a                      bra.s      $0004AD58
[0004ad2e] 7020                      moveq.l    #32,d0
[0004ad30] c06f 0010                 and.w      16(a7),d0
[0004ad34] 6722                      beq.s      $0004AD58
[0004ad36] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ad3c] 3228 0264                 move.w     612(a0),d1
[0004ad40] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ad46] 3028 0262                 move.w     610(a0),d0
[0004ad4a] 206f 0008                 movea.l    8(a7),a0
[0004ad4e] 4eb9 0005 b292            jsr        Awi_bubblegem
[0004ad54] 3f40 0012                 move.w     d0,18(a7)
[0004ad58] 6000 00de                 bra        $0004AE38
[0004ad5c] 302f 0014                 move.w     20(a7),d0
[0004ad60] 6a00 007e                 bpl.w      $0004ADE0
[0004ad64] 206f 0008                 movea.l    8(a7),a0
[0004ad68] 2ea8 0018                 move.l     24(a0),(a7)
[0004ad6c] 2017                      move.l     (a7),d0
[0004ad6e] 6732                      beq.s      $0004ADA2
[0004ad70] 2057                      movea.l    (a7),a0
[0004ad72] 302f 0014                 move.w     20(a7),d0
[0004ad76] b068 0012                 cmp.w      18(a0),d0
[0004ad7a] 6d26                      blt.s      $0004ADA2
[0004ad7c] 3f3c 1000                 move.w     #$1000,-(a7)
[0004ad80] 3f2f 001e                 move.w     30(a7),-(a7)
[0004ad84] 342f 001e                 move.w     30(a7),d2
[0004ad88] 322f 0018                 move.w     24(a7),d1
[0004ad8c] 302f 001a                 move.w     26(a7),d0
[0004ad90] 226f 0004                 movea.l    4(a7),a1
[0004ad94] 206f 000c                 movea.l    12(a7),a0
[0004ad98] 6100 fb10                 bsr        ev_dobutton
[0004ad9c] 584f                      addq.w     #4,a7
[0004ad9e] 6000 009c                 bra        $0004AE3C
[0004ada2] 7001                      moveq.l    #1,d0
[0004ada4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004adaa] 2068 023c                 movea.l    572(a0),a0
[0004adae] c068 000e                 and.w      14(a0),d0
[0004adb2] 6724                      beq.s      $0004ADD8
[0004adb4] 302f 0018                 move.w     24(a7),d0
[0004adb8] 671e                      beq.s      $0004ADD8
[0004adba] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004adc0] 3228 0264                 move.w     612(a0),d1
[0004adc4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004adca] 3028 0262                 move.w     610(a0),d0
[0004adce] 206f 0008                 movea.l    8(a7),a0
[0004add2] 4eb9 0004 e9d4            jsr        Ame_drop
[0004add8] 3f7c ffff 0012            move.w     #$FFFF,18(a7)
[0004adde] 6058                      bra.s      $0004AE38
[0004ade0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ade6] 3228 0264                 move.w     612(a0),d1
[0004adea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004adf0] 3028 0262                 move.w     610(a0),d0
[0004adf4] 206f 0008                 movea.l    8(a7),a0
[0004adf8] 41e8 0034                 lea.l      52(a0),a0
[0004adfc] 4eb9 0006 b7a6            jsr        Aob_within
[0004ae02] 4a40                      tst.w      d0
[0004ae04] 6732                      beq.s      $0004AE38
[0004ae06] 206f 0008                 movea.l    8(a7),a0
[0004ae0a] 2028 0014                 move.l     20(a0),d0
[0004ae0e] 6728                      beq.s      $0004AE38
[0004ae10] 4267                      clr.w      -(a7)
[0004ae12] 3f2f 001e                 move.w     30(a7),-(a7)
[0004ae16] 342f 001e                 move.w     30(a7),d2
[0004ae1a] 322f 0018                 move.w     24(a7),d1
[0004ae1e] 302f 001a                 move.w     26(a7),d0
[0004ae22] 206f 000c                 movea.l    12(a7),a0
[0004ae26] 2268 0014                 movea.l    20(a0),a1
[0004ae2a] 206f 000c                 movea.l    12(a7),a0
[0004ae2e] 6100 fa7a                 bsr        ev_dobutton
[0004ae32] 584f                      addq.w     #4,a7
[0004ae34] 3f40 0012                 move.w     d0,18(a7)
[0004ae38] 302f 0012                 move.w     18(a7),d0
[0004ae3c] 4fef 001e                 lea.l      30(a7),a7
[0004ae40] 245f                      movea.l    (a7)+,a2
[0004ae42] 4e75                      rts
evmouse:
[0004ae44] 2f0a                      move.l     a2,-(a7)
[0004ae46] 4fef ffe8                 lea.l      -24(a7),a7
[0004ae4a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ae50] 2068 02be                 movea.l    702(a0),a0
[0004ae54] 4e90                      jsr        (a0)
[0004ae56] 42a7                      clr.l      -(a7)
[0004ae58] 42a7                      clr.l      -(a7)
[0004ae5a] 42a7                      clr.l      -(a7)
[0004ae5c] 486f 0022                 pea.l      34(a7)
[0004ae60] 720a                      moveq.l    #10,d1
[0004ae62] 4240                      clr.w      d0
[0004ae64] 4eb9 0007 f7ba            jsr        wind_get
[0004ae6a] 4fef 0010                 lea.l      16(a7),a7
[0004ae6e] 302f 0016                 move.w     22(a7),d0
[0004ae72] 4eb9 0005 5e68            jsr        Awi_wid
[0004ae78] 2f48 0008                 move.l     a0,8(a7)
[0004ae7c] 202f 0008                 move.l     8(a7),d0
[0004ae80] 6604                      bne.s      $0004AE86
[0004ae82] 6000 01fa                 bra        $0004B07E
[0004ae86] 4eb9 0005 7b82            jsr        Awi_modal
[0004ae8c] 2f48 0004                 move.l     a0,4(a7)
[0004ae90] 202f 0004                 move.l     4(a7),d0
[0004ae94] 6714                      beq.s      $0004AEAA
[0004ae96] 206f 0004                 movea.l    4(a7),a0
[0004ae9a] b1ef 0008                 cmpa.l     8(a7),a0
[0004ae9e] 670a                      beq.s      $0004AEAA
[0004aea0] 4eb9 0005 7bb6            jsr        Awi_up_modal
[0004aea6] 6000 01d6                 bra        $0004B07E
[0004aeaa] 206f 0008                 movea.l    8(a7),a0
[0004aeae] 4eb9 0005 a47c            jsr        Awi_shadow
[0004aeb4] 4a40                      tst.w      d0
[0004aeb6] 6718                      beq.s      $0004AED0
[0004aeb8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004aebe] 2068 023c                 movea.l    572(a0),a0
[0004aec2] 41e8 0038                 lea.l      56(a0),a0
[0004aec6] 4eb9 0004 ee3c            jsr        Amo_new
[0004aecc] 6000 01b0                 bra        $0004B07E
[0004aed0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004aed6] 3228 0264                 move.w     612(a0),d1
[0004aeda] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004aee0] 3028 0262                 move.w     610(a0),d0
[0004aee4] 206f 0008                 movea.l    8(a7),a0
[0004aee8] 41e8 0034                 lea.l      52(a0),a0
[0004aeec] 4eb9 0006 b7a6            jsr        Aob_within
[0004aef2] 4a40                      tst.w      d0
[0004aef4] 6700 0144                 beq        $0004B03A
[0004aef8] 206f 0008                 movea.l    8(a7),a0
[0004aefc] 2ea8 0014                 move.l     20(a0),(a7)
[0004af00] 2017                      move.l     (a7),d0
[0004af02] 6700 0122                 beq        $0004B026
[0004af06] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004af0c] 3028 0262                 move.w     610(a0),d0
[0004af10] 206f 0008                 movea.l    8(a7),a0
[0004af14] 9068 0034                 sub.w      52(a0),d0
[0004af18] 3f40 0012                 move.w     d0,18(a7)
[0004af1c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004af22] 3028 0264                 move.w     612(a0),d0
[0004af26] 206f 0008                 movea.l    8(a7),a0
[0004af2a] 9068 0036                 sub.w      54(a0),d0
[0004af2e] 3f40 0010                 move.w     d0,16(a7)
[0004af32] 426f 000e                 clr.w      14(a7)
[0004af36] 3f2f 0010                 move.w     16(a7),-(a7)
[0004af3a] 342f 0014                 move.w     20(a7),d2
[0004af3e] 7208                      moveq.l    #8,d1
[0004af40] 4240                      clr.w      d0
[0004af42] 206f 0002                 movea.l    2(a7),a0
[0004af46] 4eb9 0004 8fd4            jsr        Adr_find
[0004af4c] 544f                      addq.w     #2,a7
[0004af4e] 3f40 0014                 move.w     d0,20(a7)
[0004af52] 6000 00a2                 bra        $0004AFF6
[0004af56] 7008                      moveq.l    #8,d0
[0004af58] 342f 0014                 move.w     20(a7),d2
[0004af5c] 48c2                      ext.l      d2
[0004af5e] 2202                      move.l     d2,d1
[0004af60] d281                      add.l      d1,d1
[0004af62] d282                      add.l      d2,d1
[0004af64] e789                      lsl.l      #3,d1
[0004af66] 2057                      movea.l    (a7),a0
[0004af68] c070 1808                 and.w      8(a0,d1.l),d0
[0004af6c] 6720                      beq.s      $0004AF8E
[0004af6e] 303c 0080                 move.w     #$0080,d0
[0004af72] 342f 0014                 move.w     20(a7),d2
[0004af76] 48c2                      ext.l      d2
[0004af78] 2202                      move.l     d2,d1
[0004af7a] d281                      add.l      d1,d1
[0004af7c] d282                      add.l      d2,d1
[0004af7e] e789                      lsl.l      #3,d1
[0004af80] 2057                      movea.l    (a7),a0
[0004af82] c070 1808                 and.w      8(a0,d1.l),d0
[0004af86] 6606                      bne.s      $0004AF8E
[0004af88] 3f7c 0004 000e            move.w     #$0004,14(a7)
[0004af8e] 7020                      moveq.l    #32,d0
[0004af90] 342f 0014                 move.w     20(a7),d2
[0004af94] 48c2                      ext.l      d2
[0004af96] 2202                      move.l     d2,d1
[0004af98] d281                      add.l      d1,d1
[0004af9a] d282                      add.l      d2,d1
[0004af9c] e789                      lsl.l      #3,d1
[0004af9e] 2057                      movea.l    (a7),a0
[0004afa0] c070 1808                 and.w      8(a0,d1.l),d0
[0004afa4] 6640                      bne.s      $0004AFE6
[0004afa6] 322f 0014                 move.w     20(a7),d1
[0004afaa] 48c1                      ext.l      d1
[0004afac] 2001                      move.l     d1,d0
[0004afae] d080                      add.l      d0,d0
[0004afb0] d081                      add.l      d1,d0
[0004afb2] e788                      lsl.l      #3,d0
[0004afb4] 2057                      movea.l    (a7),a0
[0004afb6] 3030 0820                 move.w     32(a0,d0.l),d0
[0004afba] c07c 8000                 and.w      #$8000,d0
[0004afbe] 6726                      beq.s      $0004AFE6
[0004afc0] 701f                      moveq.l    #31,d0
[0004afc2] 342f 0014                 move.w     20(a7),d2
[0004afc6] 48c2                      ext.l      d2
[0004afc8] 2202                      move.l     d2,d1
[0004afca] d281                      add.l      d1,d1
[0004afcc] d282                      add.l      d2,d1
[0004afce] e789                      lsl.l      #3,d1
[0004afd0] 2057                      movea.l    (a7),a0
[0004afd2] c070 182c                 and.w      44(a0,d1.l),d0
[0004afd6] 3f40 000c                 move.w     d0,12(a7)
[0004afda] 302f 000c                 move.w     12(a7),d0
[0004afde] 6f06                      ble.s      $0004AFE6
[0004afe0] 3f6f 000c 000e            move.w     12(a7),14(a7)
[0004afe6] 302f 0014                 move.w     20(a7),d0
[0004afea] 2057                      movea.l    (a7),a0
[0004afec] 4eb9 0005 0f3a            jsr        Aob_up
[0004aff2] 3f40 0014                 move.w     d0,20(a7)
[0004aff6] 302f 0014                 move.w     20(a7),d0
[0004affa] 6b08                      bmi.s      $0004B004
[0004affc] 302f 000e                 move.w     14(a7),d0
[0004b000] 6f00 ff54                 ble        $0004AF56
[0004b004] 322f 000e                 move.w     14(a7),d1
[0004b008] 48c1                      ext.l      d1
[0004b00a] 2001                      move.l     d1,d0
[0004b00c] d080                      add.l      d0,d0
[0004b00e] d081                      add.l      d1,d0
[0004b010] d080                      add.l      d0,d0
[0004b012] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b018] 2068 023c                 movea.l    572(a0),a0
[0004b01c] 41f0 0838                 lea.l      56(a0,d0.l),a0
[0004b020] 4eb9 0004 ee3c            jsr        Amo_new
[0004b026] 93c9                      suba.l     a1,a1
[0004b028] 7004                      moveq.l    #4,d0
[0004b02a] 206f 0008                 movea.l    8(a7),a0
[0004b02e] 246f 0008                 movea.l    8(a7),a2
[0004b032] 246a 0004                 movea.l    4(a2),a2
[0004b036] 4e92                      jsr        (a2)
[0004b038] 6044                      bra.s      $0004B07E
[0004b03a] 6100 f2bc                 bsr        Aev_unhidepointer
[0004b03e] 4eb9 0004 ee96            jsr        Amo_point
[0004b044] 7001                      moveq.l    #1,d0
[0004b046] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b04c] 2068 023c                 movea.l    572(a0),a0
[0004b050] c068 000e                 and.w      14(a0),d0
[0004b054] 6628                      bne.s      $0004B07E
[0004b056] 206f 0008                 movea.l    8(a7),a0
[0004b05a] 2028 005e                 move.l     94(a0),d0
[0004b05e] 671e                      beq.s      $0004B07E
[0004b060] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b066] 3228 0264                 move.w     612(a0),d1
[0004b06a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b070] 3028 0262                 move.w     610(a0),d0
[0004b074] 206f 0008                 movea.l    8(a7),a0
[0004b078] 4eb9 0004 e9d4            jsr        Ame_drop
[0004b07e] 4fef 0018                 lea.l      24(a7),a7
[0004b082] 245f                      movea.l    (a7)+,a2
[0004b084] 4e75                      rts
Aev_mess:
[0004b086] 4fef ffec                 lea.l      -20(a7),a7
[0004b08a] 4eb9 0005 5e8c            jsr        Awi_root
[0004b090] 2008                      move.l     a0,d0
[0004b092] 6604                      bne.s      $0004B098
[0004b094] 6000 00b4                 bra        $0004B14A
[0004b098] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b09e] 3028 027e                 move.w     638(a0),d0
[0004b0a2] 6704                      beq.s      $0004B0A8
[0004b0a4] 6000 00a4                 bra        $0004B14A
[0004b0a8] 3f7c 0004 0010            move.w     #$0004,16(a7)
[0004b0ae] 7010                      moveq.l    #16,d0
[0004b0b0] 4eb9 0005 ae7e            jsr        Awi_update
[0004b0b6] 6000 0082                 bra        $0004B13A
[0004b0ba] 2f39 000e 692a            move.l     _globl,-(a7)
[0004b0c0] 486f 0016                 pea.l      22(a7)
[0004b0c4] 486f 001a                 pea.l      26(a7)
[0004b0c8] 486f 001e                 pea.l      30(a7)
[0004b0cc] 486f 0022                 pea.l      34(a7)
[0004b0d0] 486f 0026                 pea.l      38(a7)
[0004b0d4] 7014                      moveq.l    #20,d0
[0004b0d6] 2f00                      move.l     d0,-(a7)
[0004b0d8] 4267                      clr.w      -(a7)
[0004b0da] 4267                      clr.w      -(a7)
[0004b0dc] 4267                      clr.w      -(a7)
[0004b0de] 4267                      clr.w      -(a7)
[0004b0e0] 4267                      clr.w      -(a7)
[0004b0e2] 4267                      clr.w      -(a7)
[0004b0e4] 4267                      clr.w      -(a7)
[0004b0e6] 4267                      clr.w      -(a7)
[0004b0e8] 4267                      clr.w      -(a7)
[0004b0ea] 4267                      clr.w      -(a7)
[0004b0ec] 4267                      clr.w      -(a7)
[0004b0ee] 43ef 0044                 lea.l      68(a7),a1
[0004b0f2] 41ef 0032                 lea.l      50(a7),a0
[0004b0f6] 4242                      clr.w      d2
[0004b0f8] 4241                      clr.w      d1
[0004b0fa] 7030                      moveq.l    #48,d0 MU_TIMER | MU_MESAG
[0004b0fc] 4eb9 0007 9240            jsr        mt_evnt_multi
[0004b102] 4fef 0032                 lea.l      50(a7),a7
[0004b106] c07c 0010                 and.w      #$0010,d0
[0004b10a] 672a                      beq.s      $0004B136
[0004b10c] 7020                      moveq.l    #32,d0
[0004b10e] 4eb9 0005 ae7e            jsr        Awi_update
[0004b114] 41d7                      lea.l      (a7),a0
[0004b116] 4eb9 0005 d5e6            jsr        Aev_message
[0004b11c] 4a40                      tst.w      d0
[0004b11e] 6708                      beq.s      $0004B128
[0004b120] 3f7c 0004 0010            move.w     #$0004,16(a7)
[0004b126] 6004                      bra.s      $0004B12C
[0004b128] 536f 0010                 subq.w     #1,16(a7)
[0004b12c] 7010                      moveq.l    #16,d0
[0004b12e] 4eb9 0005 ae7e            jsr        Awi_update
[0004b134] 6004                      bra.s      $0004B13A
[0004b136] 536f 0010                 subq.w     #1,16(a7)
[0004b13a] 302f 0010                 move.w     16(a7),d0
[0004b13e] 6e00 ff7a                 bgt        $0004B0BA
[0004b142] 7020                      moveq.l    #32,d0
[0004b144] 4eb9 0005 ae7e            jsr        Awi_update
[0004b14a] 4fef 0014                 lea.l      20(a7),a7
[0004b14e] 4e75                      rts
ACSeventhandler:
[0004b150] 2f0a                      move.l     a2,-(a7)
[0004b152] 4fef ffc2                 lea.l      -62(a7),a7
[0004b156] 4eb9 0005 5e8c            jsr        Awi_root
[0004b15c] 2f48 003a                 move.l     a0,58(a7)
[0004b160] 2f39 000e 692a            move.l     _globl,-(a7)
[0004b166] 486f 0010                 pea.l      16(a7)
[0004b16a] 486f 0012                 pea.l      18(a7)
[0004b16e] 43ef 0014                 lea.l      20(a7),a1
[0004b172] 41ef 0012                 lea.l      18(a7),a0
[0004b176] 7008                      moveq.l    #8,d0
[0004b178] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[0004b17e] 4fef 000c                 lea.l      12(a7),a7
[0004b182] 4a40                      tst.w      d0
[0004b184] 6710                      beq.s      $0004B196
[0004b186] 302f 000a                 move.w     10(a7),d0
[0004b18a] 6704                      beq.s      $0004B190
[0004b18c] 7001                      moveq.l    #1,d0
[0004b18e] 6002                      bra.s      $0004B192
[0004b190] 4240                      clr.w      d0
[0004b192] 3e80                      move.w     d0,(a7)
[0004b194] 6002                      bra.s      $0004B198
[0004b196] 4257                      clr.w      (a7)
[0004b198] 7220                      moveq.l    #32,d1
[0004b19a] 4240                      clr.w      d0
[0004b19c] 41ef 0006                 lea.l      6(a7),a0
[0004b1a0] 4eb9 0008 36ea            jsr        memset
[0004b1a6] 4240                      clr.w      d0
[0004b1a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b1ae] 3140 0264                 move.w     d0,612(a0)
[0004b1b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b1b8] 3140 0262                 move.w     d0,610(a0)
[0004b1bc] 206f 003a                 movea.l    58(a7),a0
[0004b1c0] 2f68 005e 0036            move.l     94(a0),54(a7)
[0004b1c6] 202f 0036                 move.l     54(a7),d0
[0004b1ca] 6732                      beq.s      $0004B1FE
[0004b1cc] 6024                      bra.s      $0004B1F2
[0004b1ce] 206f 0036                 movea.l    54(a7),a0
[0004b1d2] 3028 0008                 move.w     8(a0),d0
[0004b1d6] c07c 8000                 and.w      #$8000,d0
[0004b1da] 670e                      beq.s      $0004B1EA
[0004b1dc] 206f 0036                 movea.l    54(a7),a0
[0004b1e0] 226f 0036                 movea.l    54(a7),a1
[0004b1e4] 3368 000a 0016            move.w     10(a0),22(a1)
[0004b1ea] 06af 0000 0018 0036       addi.l     #$00000018,54(a7)
[0004b1f2] 7020                      moveq.l    #32,d0
[0004b1f4] 206f 0036                 movea.l    54(a7),a0
[0004b1f8] c068 0008                 and.w      8(a0),d0
[0004b1fc] 67d0                      beq.s      $0004B1CE
[0004b1fe] 4240                      clr.w      d0
[0004b200] 33c0 000e 073a            move.w     d0,exitapp
[0004b206] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b20c] 3140 023a                 move.w     d0,570(a0)
[0004b210] 206f 003a                 movea.l    58(a7),a0
[0004b214] 2f68 005e 0036            move.l     94(a0),54(a7)
[0004b21a] 202f 0036                 move.l     54(a7),d0
[0004b21e] 6732                      beq.s      $0004B252
[0004b220] 6024                      bra.s      $0004B246
[0004b222] 206f 0036                 movea.l    54(a7),a0
[0004b226] 3028 0008                 move.w     8(a0),d0
[0004b22a] c07c 8000                 and.w      #$8000,d0
[0004b22e] 670e                      beq.s      $0004B23E
[0004b230] 206f 0036                 movea.l    54(a7),a0
[0004b234] 226f 0036                 movea.l    54(a7),a1
[0004b238] 3368 0016 000a            move.w     22(a0),10(a1)
[0004b23e] 06af 0000 0018 0036       addi.l     #$00000018,54(a7)
[0004b246] 7020                      moveq.l    #32,d0
[0004b248] 206f 0036                 movea.l    54(a7),a0
[0004b24c] c068 0008                 and.w      8(a0),d0
[0004b250] 67d0                      beq.s      $0004B222
[0004b252] 3017                      move.w     (a7),d0
[0004b254] 6710                      beq.s      $0004B266
[0004b256] 303c 0080                 move.w     #$0080,d0
[0004b25a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b260] 8068 02c6                 or.w       710(a0),d0
[0004b264] 600a                      bra.s      $0004B270
[0004b266] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b26c] 3028 02c6                 move.w     710(a0),d0
[0004b270] 3f40 0004                 move.w     d0,4(a7)
[0004b274] 2f39 000e 692a            move.l     _globl,-(a7)
[0004b27a] 486f 000a                 pea.l      10(a7)
[0004b27e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b284] 4868 02cc                 pea.l      716(a0)
[0004b288] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b28e] 4868 02ce                 pea.l      718(a0)
[0004b292] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b298] 4868 0266                 pea.l      614(a0)
[0004b29c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b2a2] 4868 02ca                 pea.l      714(a0)
[0004b2a6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b2ac] 4868 0264                 pea.l      612(a0)
[0004b2b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b2b6] 2028 0232                 move.l     562(a0),d0
[0004b2ba] 7210                      moveq.l    #16,d1
[0004b2bc] e2a0                      asr.l      d1,d0
[0004b2be] 7200                      moveq.l    #0,d1
[0004b2c0] 3200                      move.w     d0,d1
[0004b2c2] 7010                      moveq.l    #16,d0
[0004b2c4] e1a9                      lsl.l      d0,d1
[0004b2c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b2cc] 7000                      moveq.l    #0,d0
[0004b2ce] 3028 0234                 move.w     564(a0),d0
[0004b2d2] 8280                      or.l       d0,d1
[0004b2d4] 2f01                      move.l     d1,-(a7)
[0004b2d6] 4267                      clr.w      -(a7)
[0004b2d8] 4267                      clr.w      -(a7)
[0004b2da] 4267                      clr.w      -(a7)
[0004b2dc] 4267                      clr.w      -(a7)
[0004b2de] 4267                      clr.w      -(a7)
[0004b2e0] 7001                      moveq.l    #1,d0
[0004b2e2] 3f00                      move.w     d0,-(a7)
[0004b2e4] 7001                      moveq.l    #1,d0
[0004b2e6] 3f00                      move.w     d0,-(a7)
[0004b2e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b2ee] 3f28 0264                 move.w     612(a0),-(a7)
[0004b2f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b2f8] 3f28 0262                 move.w     610(a0),-(a7)
[0004b2fc] 7001                      moveq.l    #1,d0
[0004b2fe] 3f00                      move.w     d0,-(a7)
[0004b300] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b306] 3f28 02c8                 move.w     712(a0),-(a7)
[0004b30a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004b310] 43e9 0262                 lea.l      610(a1),a1
[0004b314] 41ef 005c                 lea.l      92(a7),a0
[0004b318] 342f 003a                 move.w     58(a7),d2
[0004b31c] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004b322] 322a 02d0                 move.w     720(a2),d1
[0004b326] 7037                      moveq.l    #55,d0
[0004b328] 4eb9 0007 9372            jsr        mt_evnt_xmulti
[0004b32e] 4fef 0036                 lea.l      54(a7),a7
[0004b332] 3f40 0002                 move.w     d0,2(a7)
[0004b336] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b33c] 3228 0266                 move.w     614(a0),d1
[0004b340] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b346] 3028 02ce                 move.w     718(a0),d0
[0004b34a] 4eb9 0004 4284            jsr        nkc_gemks2n
[0004b350] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b356] 3140 02ce                 move.w     d0,718(a0)
[0004b35a] 7001                      moveq.l    #1,d0
[0004b35c] 4eb9 0005 ae7e            jsr        Awi_update
[0004b362] 7010                      moveq.l    #16,d0
[0004b364] c06f 0002                 and.w      2(a7),d0
[0004b368] 670a                      beq.s      $0004B374
[0004b36a] 41ef 0026                 lea.l      38(a7),a0
[0004b36e] 4eb9 0005 d5e6            jsr        Aev_message
[0004b374] 7002                      moveq.l    #2,d0
[0004b376] c06f 0002                 and.w      2(a7),d0
[0004b37a] 6744                      beq.s      $0004B3C0
[0004b37c] 303c 0080                 move.w     #$0080,d0
[0004b380] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b386] c068 02ca                 and.w      714(a0),d0
[0004b38a] 671c                      beq.s      $0004B3A8
[0004b38c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b392] 3228 0264                 move.w     612(a0),d1
[0004b396] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b39c] 3028 0262                 move.w     610(a0),d0
[0004b3a0] 41ef 0006                 lea.l      6(a7),a0
[0004b3a4] 6100 f756                 bsr        evmwheel
[0004b3a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b3ae] 3228 02cc                 move.w     716(a0),d1
[0004b3b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b3b8] 3028 02ca                 move.w     714(a0),d0
[0004b3bc] 6100 f7a6                 bsr        evbutton
[0004b3c0] 7001                      moveq.l    #1,d0
[0004b3c2] c06f 0002                 and.w      2(a7),d0
[0004b3c6] 6706                      beq.s      $0004B3CE
[0004b3c8] 91c8                      suba.l     a0,a0
[0004b3ca] 6100 f0cc                 bsr        evkeybrd
[0004b3ce] 2f39 000e 692a            move.l     _globl,-(a7)
[0004b3d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b3da] 4868 0266                 pea.l      614(a0)
[0004b3de] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b3e4] 4868 02ca                 pea.l      714(a0)
[0004b3e8] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004b3ee] 43e9 0264                 lea.l      612(a1),a1
[0004b3f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b3f8] 41e8 0262                 lea.l      610(a0),a0
[0004b3fc] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0004b402] 4fef 000c                 lea.l      12(a7),a7
[0004b406] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b40c] 3028 02ca                 move.w     714(a0),d0
[0004b410] 6610                      bne.s      $0004B422
[0004b412] 7004                      moveq.l    #4,d0
[0004b414] c06f 0002                 and.w      2(a7),d0
[0004b418] 6704                      beq.s      $0004B41E
[0004b41a] 6100 eedc                 bsr        Aev_unhidepointer
[0004b41e] 6100 fa24                 bsr        evmouse
[0004b422] 4eb9 0004 c8f6            jsr        Ax_release
[0004b428] 4eb9 0005 6a6e            jsr        Awi_lateupdate
[0004b42e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b434] 216f 003a 0258            move.l     58(a7),600(a0)
[0004b43a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b440] 2068 02ac                 movea.l    684(a0),a0
[0004b444] 4e90                      jsr        (a0)
[0004b446] 4240                      clr.w      d0
[0004b448] 4eb9 0005 ae7e            jsr        Awi_update
[0004b44e] 91c8                      suba.l     a0,a0
[0004b450] 4eb9 0007 13c0            jsr        Ax_mterm
[0004b456] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b45c] 3028 0236                 move.w     566(a0),d0
[0004b460] 6708                      beq.s      $0004B46A
[0004b462] 3039 000e 073a            move.w     exitapp,d0
[0004b468] 660e                      bne.s      $0004B478
[0004b46a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b470] 3028 027e                 move.w     638(a0),d0
[0004b474] 6700 fd88                 beq        $0004B1FE
[0004b478] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b47e] 317c 0001 023a            move.w     #$0001,570(a0)
[0004b484] 6100 ee72                 bsr        Aev_unhidepointer
[0004b488] 4eb9 0004 eec0            jsr        Amo_busy
[0004b48e] 4fef 003e                 lea.l      62(a7),a7
[0004b492] 245f                      movea.l    (a7)+,a2
[0004b494] 4e75                      rts
