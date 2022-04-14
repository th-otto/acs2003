edwi_tme:
[0002365c] 2f0a                      move.l     a2,-(a7)
[0002365e] 2f0b                      move.l     a3,-(a7)
[00023660] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023666] 2468 0258                 movea.l    600(a0),a2
[0002366a] 2052                      movea.l    (a2),a0
[0002366c] 006a 0004 0054            ori.w      #$0004,84(a2)
[00023672] 47f9 000c ec32            lea.l      list_menu,a3
[00023678] 2690                      move.l     (a0),(a3)
[0002367a] 2250                      movea.l    (a0),a1
[0002367c] 2769 001c 0004            move.l     28(a1),4(a3)
[00023682] 204b                      movea.l    a3,a0
[00023684] 2279 000c dc9e            movea.l    $000CDC9E,a1
[0002368a] 4e91                      jsr        (a1)
[0002368c] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[00023692] 265f                      movea.l    (a7)+,a3
[00023694] 245f                      movea.l    (a7)+,a2
[00023696] 4e75                      rts
edwi_two:
[00023698] 2f0a                      move.l     a2,-(a7)
[0002369a] 2f0b                      move.l     a3,-(a7)
[0002369c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000236a2] 2468 0258                 movea.l    600(a0),a2
[000236a6] 2052                      movea.l    (a2),a0
[000236a8] 006a 0004 0054            ori.w      #$0004,84(a2)
[000236ae] 47f9 000c ed8c            lea.l      list_object,a3
[000236b4] 2690                      move.l     (a0),(a3)
[000236b6] 2250                      movea.l    (a0),a1
[000236b8] 2769 0018 0004            move.l     24(a1),4(a3)
[000236be] 204b                      movea.l    a3,a0
[000236c0] 2279 000c dc9e            movea.l    $000CDC9E,a1
[000236c6] 4e91                      jsr        (a1)
[000236c8] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[000236ce] 265f                      movea.l    (a7)+,a3
[000236d0] 245f                      movea.l    (a7)+,a2
[000236d2] 4e75                      rts
edwi_tic:
[000236d4] 2f0a                      move.l     a2,-(a7)
[000236d6] 2f0b                      move.l     a3,-(a7)
[000236d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000236de] 2468 0258                 movea.l    600(a0),a2
[000236e2] 2052                      movea.l    (a2),a0
[000236e4] 006a 0004 0054            ori.w      #$0004,84(a2)
[000236ea] 47f9 000c e332            lea.l      list_icon,a3
[000236f0] 2690                      move.l     (a0),(a3)
[000236f2] 2250                      movea.l    (a0),a1
[000236f4] 2769 002c 0004            move.l     44(a1),4(a3)
[000236fa] 204b                      movea.l    a3,a0
[000236fc] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00023702] 4e91                      jsr        (a1)
[00023704] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[0002370a] 265f                      movea.l    (a7)+,a3
[0002370c] 245f                      movea.l    (a7)+,a2
[0002370e] 4e75                      rts
edwi_ref:
[00023710] 2f0a                      move.l     a2,-(a7)
[00023712] 2f0b                      move.l     a3,-(a7)
[00023714] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002371a] 2468 0258                 movea.l    600(a0),a2
[0002371e] 2052                      movea.l    (a2),a0
[00023720] 006a 0004 0054            ori.w      #$0004,84(a2)
[00023726] 47f9 000c eefc            lea.l      list_reference,a3
[0002372c] 2690                      move.l     (a0),(a3)
[0002372e] 2250                      movea.l    (a0),a1
[00023730] 2769 003c 0004            move.l     60(a1),4(a3)
[00023736] 204b                      movea.l    a3,a0
[00023738] 2279 000c dc9e            movea.l    $000CDC9E,a1
[0002373e] 4e91                      jsr        (a1)
[00023740] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[00023746] 265f                      movea.l    (a7)+,a3
[00023748] 245f                      movea.l    (a7)+,a2
[0002374a] 4e75                      rts
edwi_ok:
[0002374c] 4240                      clr.w      d0
[0002374e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023754] 2068 0258                 movea.l    600(a0),a0
[00023758] 4eb9 0002 382a            jsr        acc_window
[0002375e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023764] 2068 0258                 movea.l    600(a0),a0
[00023768] 4eb9 0002 4842            jsr        term
[0002376e] 4e75                      rts
edwi_abort:
[00023770] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023776] 2068 0258                 movea.l    600(a0),a0
[0002377a] 4eb9 0002 4842            jsr        term
[00023780] 4e75                      rts
edwi_acc:
[00023782] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00023786] 594f                      subq.w     #4,a7
[00023788] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002378e] 2052                      movea.l    (a2),a0
[00023790] 2668 0258                 movea.l    600(a0),a3
[00023794] 286b 0014                 movea.l    20(a3),a4
[00023798] 4268 0248                 clr.w      584(a0)
[0002379c] 4eb9 0004 7e2a            jsr        Adr_next
[000237a2] 3600                      move.w     d0,d3
[000237a4] 6b00 007c                 bmi.w      $00023822
[000237a8] 48c0                      ext.l      d0
[000237aa] 2200                      move.l     d0,d1
[000237ac] d281                      add.l      d1,d1
[000237ae] d280                      add.l      d0,d1
[000237b0] e789                      lsl.l      #3,d1
[000237b2] 2052                      movea.l    (a2),a0
[000237b4] 2268 0240                 movea.l    576(a0),a1
[000237b8] 2069 0014                 movea.l    20(a1),a0
[000237bc] 41f0 1818                 lea.l      24(a0,d1.l),a0
[000237c0] 2ea8 000c                 move.l     12(a0),(a7)
[000237c4] 0c68 2710 0016            cmpi.w     #$2710,22(a0)
[000237ca] 6718                      beq.s      $000237E4
[000237cc] 0c68 2711 0016            cmpi.w     #$2711,22(a0)
[000237d2] 6710                      beq.s      $000237E4
[000237d4] 0c68 2720 0016            cmpi.w     #$2720,22(a0)
[000237da] 6708                      beq.s      $000237E4
[000237dc] 0c68 271c 0016            cmpi.w     #$271C,22(a0)
[000237e2] 663e                      bne.s      $00023822
[000237e4] 4eb9 0005 1388            jsr        Awi_diaend
[000237ea] 2257                      movea.l    (a7),a1
[000237ec] 43e9 0016                 lea.l      22(a1),a1
[000237f0] 2052                      movea.l    (a2),a0
[000237f2] 3028 0260                 move.w     608(a0),d0
[000237f6] 204c                      movea.l    a4,a0
[000237f8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000237fe] 72ff                      moveq.l    #-1,d1
[00023800] 2052                      movea.l    (a2),a0
[00023802] 3028 0260                 move.w     608(a0),d0
[00023806] 226b 0066                 movea.l    102(a3),a1
[0002380a] 204b                      movea.l    a3,a0
[0002380c] 4e91                      jsr        (a1)
[0002380e] 4eb9 0005 147c            jsr        Awi_diastart
[00023814] 3003                      move.w     d3,d0
[00023816] 2052                      movea.l    (a2),a0
[00023818] 2068 0240                 movea.l    576(a0),a0
[0002381c] 4eb9 0004 7f76            jsr        Adr_del
[00023822] 584f                      addq.w     #4,a7
[00023824] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00023828] 4e75                      rts
acc_window:
[0002382a] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0002382e] 4fef ff64                 lea.l      -156(a7),a7
[00023832] 2f48 0098                 move.l     a0,152(a7)
[00023836] 3600                      move.w     d0,d3
[00023838] 43f9 000b 7a10            lea.l      $000B7A10,a1
[0002383e] 41ef 0042                 lea.l      66(a7),a0
[00023842] 720f                      moveq.l    #15,d1
[00023844] 20d9                      move.l     (a1)+,(a0)+
[00023846] 51c9 fffc                 dbf        d1,$00023844
[0002384a] 30d9                      move.w     (a1)+,(a0)+
[0002384c] 41f9 000b 7a52            lea.l      $000B7A52,a0
[00023852] 43d7                      lea.l      (a7),a1
[00023854] 720f                      moveq.l    #15,d1
[00023856] 22d8                      move.l     (a0)+,(a1)+
[00023858] 51c9 fffc                 dbf        d1,$00023856
[0002385c] 32d8                      move.w     (a0)+,(a1)+
[0002385e] 206f 0098                 movea.l    152(a7),a0
[00023862] 2050                      movea.l    (a0),a0
[00023864] 2a50                      movea.l    (a0),a5
[00023866] 2268 0004                 movea.l    4(a0),a1
[0002386a] 2469 0004                 movea.l    4(a1),a2
[0002386e] 206f 0098                 movea.l    152(a7),a0
[00023872] 2668 0014                 movea.l    20(a0),a3
[00023876] 49ef 0088                 lea.l      136(a7),a4
[0002387a] 224c                      movea.l    a4,a1
[0002387c] 7003                      moveq.l    #3,d0
[0002387e] 41eb 0948                 lea.l      2376(a3),a0
[00023882] 4eb9 0006 a068            jsr        Auo_boxed
[00023888] 2054                      movea.l    (a4),a0
[0002388a] 1010                      move.b     (a0),d0
[0002388c] 6612                      bne.s      $000238A0
[0002388e] 4a43                      tst.w      d3
[00023890] 660e                      bne.s      $000238A0
[00023892] 41f9 000b 3edd            lea.l      WARN_CREATE,a0
[00023898] 7001                      moveq.l    #1,d0
[0002389a] 4eb9 0005 a600            jsr        Awi_alert
[000238a0] 006d 0001 0006            ori.w      #$0001,6(a5)
[000238a6] 4240                      clr.w      d0
[000238a8] 7201                      moveq.l    #1,d1
[000238aa] c26b 0232                 and.w      562(a3),d1
[000238ae] 6704                      beq.s      $000238B4
[000238b0] 807c 0002                 or.w       #$0002,d0
[000238b4] 7201                      moveq.l    #1,d1
[000238b6] c26b 03ca                 and.w      970(a3),d1
[000238ba] 6704                      beq.s      $000238C0
[000238bc] 807c 1000                 or.w       #$1000,d0
[000238c0] 7201                      moveq.l    #1,d1
[000238c2] c26b 03b2                 and.w      946(a3),d1
[000238c6] 6704                      beq.s      $000238CC
[000238c8] 807c 0008                 or.w       #$0008,d0
[000238cc] 7201                      moveq.l    #1,d1
[000238ce] c26b 039a                 and.w      922(a3),d1
[000238d2] 6704                      beq.s      $000238D8
[000238d4] 807c 0001                 or.w       #$0001,d0
[000238d8] 7201                      moveq.l    #1,d1
[000238da] c26b 024a                 and.w      586(a3),d1
[000238de] 6704                      beq.s      $000238E4
[000238e0] 807c 0010                 or.w       #$0010,d0
[000238e4] 7201                      moveq.l    #1,d1
[000238e6] c26b 0352                 and.w      850(a3),d1
[000238ea] 6704                      beq.s      $000238F0
[000238ec] 807c 0004                 or.w       #$0004,d0
[000238f0] 7201                      moveq.l    #1,d1
[000238f2] c26b 02da                 and.w      730(a3),d1
[000238f6] 6704                      beq.s      $000238FC
[000238f8] 807c 0020                 or.w       #$0020,d0
[000238fc] 7201                      moveq.l    #1,d1
[000238fe] c26b 033a                 and.w      826(a3),d1
[00023902] 6704                      beq.s      $00023908
[00023904] 807c 0040                 or.w       #$0040,d0
[00023908] 7201                      moveq.l    #1,d1
[0002390a] c26b 02f2                 and.w      754(a3),d1
[0002390e] 6704                      beq.s      $00023914
[00023910] 807c 0080                 or.w       #$0080,d0
[00023914] 7201                      moveq.l    #1,d1
[00023916] c26b 02c2                 and.w      706(a3),d1
[0002391a] 6704                      beq.s      $00023920
[0002391c] 807c 0400                 or.w       #$0400,d0
[00023920] 7201                      moveq.l    #1,d1
[00023922] c26b 02aa                 and.w      682(a3),d1
[00023926] 6704                      beq.s      $0002392C
[00023928] 807c 0200                 or.w       #$0200,d0
[0002392c] 7201                      moveq.l    #1,d1
[0002392e] c26b 0292                 and.w      658(a3),d1
[00023932] 6704                      beq.s      $00023938
[00023934] 807c 0800                 or.w       #$0800,d0
[00023938] 7201                      moveq.l    #1,d1
[0002393a] c26b 0322                 and.w      802(a3),d1
[0002393e] 6704                      beq.s      $00023944
[00023940] 807c 0100                 or.w       #$0100,d0
[00023944] 7201                      moveq.l    #1,d1
[00023946] c26b 036a                 and.w      874(a3),d1
[0002394a] 6704                      beq.s      $00023950
[0002394c] 807c 4000                 or.w       #$4000,d0
[00023950] 7201                      moveq.l    #1,d1
[00023952] c26b 0382                 and.w      898(a3),d1
[00023956] 6704                      beq.s      $0002395C
[00023958] 807c 2000                 or.w       #$2000,d0
[0002395c] 3540 0022                 move.w     d0,34(a2)
[00023960] 4240                      clr.w      d0
[00023962] 7201                      moveq.l    #1,d1
[00023964] c26b 03fa                 and.w      1018(a3),d1
[00023968] 6704                      beq.s      $0002396E
[0002396a] 807c 0008                 or.w       #$0008,d0
[0002396e] 7201                      moveq.l    #1,d1
[00023970] c26b 042a                 and.w      1066(a3),d1
[00023974] 6704                      beq.s      $0002397A
[00023976] 807c 0004                 or.w       #$0004,d0
[0002397a] 7201                      moveq.l    #1,d1
[0002397c] c26b 045a                 and.w      1114(a3),d1
[00023980] 6704                      beq.s      $00023986
[00023982] 807c 0001                 or.w       #$0001,d0
[00023986] 7201                      moveq.l    #1,d1
[00023988] c26b 048a                 and.w      1162(a3),d1
[0002398c] 6704                      beq.s      $00023992
[0002398e] 807c 0002                 or.w       #$0002,d0
[00023992] 7201                      moveq.l    #1,d1
[00023994] c26b 04ba                 and.w      1210(a3),d1
[00023998] 6704                      beq.s      $0002399E
[0002399a] 807c 0010                 or.w       #$0010,d0
[0002399e] 7201                      moveq.l    #1,d1
[000239a0] c26b 04ea                 and.w      1258(a3),d1
[000239a4] 6704                      beq.s      $000239AA
[000239a6] 807c 0100                 or.w       #$0100,d0
[000239aa] 3540 0054                 move.w     d0,84(a2)
[000239ae] 206f 0098                 movea.l    152(a7),a0
[000239b2] 2268 0014                 movea.l    20(a0),a1
[000239b6] 43e9 0150                 lea.l      336(a1),a1
[000239ba] 2f49 008c                 move.l     a1,140(a7)
[000239be] 224c                      movea.l    a4,a1
[000239c0] 206f 008c                 movea.l    140(a7),a0
[000239c4] 7003                      moveq.l    #3,d0
[000239c6] 4eb9 0003 71ba            jsr        Auo_slider
[000239cc] 486f 0086                 pea.l      134(a7)
[000239d0] 43f9 000b 7a94            lea.l      $000B7A94,a1
[000239d6] 2054                      movea.l    (a4),a0
[000239d8] 4eb9 0008 1b26            jsr        sscanf
[000239de] 584f                      addq.w     #4,a7
[000239e0] 206f 0098                 movea.l    152(a7),a0
[000239e4] 2268 0014                 movea.l    20(a0),a1
[000239e8] 43e9 0198                 lea.l      408(a1),a1
[000239ec] 2f49 008c                 move.l     a1,140(a7)
[000239f0] 224c                      movea.l    a4,a1
[000239f2] 7003                      moveq.l    #3,d0
[000239f4] 206f 008c                 movea.l    140(a7),a0
[000239f8] 4eb9 0003 71ba            jsr        Auo_slider
[000239fe] 486f 0084                 pea.l      132(a7)
[00023a02] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a08] 2054                      movea.l    (a4),a0
[00023a0a] 4eb9 0008 1b26            jsr        sscanf
[00023a10] 584f                      addq.w     #4,a7
[00023a12] 302f 0086                 move.w     134(a7),d0
[00023a16] 4440                      neg.w      d0
[00023a18] 322f 0084                 move.w     132(a7),d1
[00023a1c] 4441                      neg.w      d1
[00023a1e] e149                      lsl.w      #8,d1
[00023a20] 827c 00ff                 or.w       #$00FF,d1
[00023a24] c041                      and.w      d1,d0
[00023a26] 3540 0048                 move.w     d0,72(a2)
[00023a2a] 486a 0024                 pea.l      36(a2)
[00023a2e] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a34] 204b                      movea.l    a3,a0
[00023a36] 7003                      moveq.l    #3,d0
[00023a38] 4eb9 0005 10fe            jsr        Aob_scanf
[00023a3e] 584f                      addq.w     #4,a7
[00023a40] 486a 0026                 pea.l      38(a2)
[00023a44] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a4a] 7005                      moveq.l    #5,d0
[00023a4c] 204b                      movea.l    a3,a0
[00023a4e] 4eb9 0005 10fe            jsr        Aob_scanf
[00023a54] 584f                      addq.w     #4,a7
[00023a56] 486a 0028                 pea.l      40(a2)
[00023a5a] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a60] 7007                      moveq.l    #7,d0
[00023a62] 204b                      movea.l    a3,a0
[00023a64] 4eb9 0005 10fe            jsr        Aob_scanf
[00023a6a] 584f                      addq.w     #4,a7
[00023a6c] 486a 002a                 pea.l      42(a2)
[00023a70] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a76] 7009                      moveq.l    #9,d0
[00023a78] 204b                      movea.l    a3,a0
[00023a7a] 4eb9 0005 10fe            jsr        Aob_scanf
[00023a80] 584f                      addq.w     #4,a7
[00023a82] 224c                      movea.l    a4,a1
[00023a84] 7003                      moveq.l    #3,d0
[00023a86] 41eb 0570                 lea.l      1392(a3),a0
[00023a8a] 4eb9 0006 a068            jsr        Auo_boxed
[00023a90] 2f14                      move.l     (a4),-(a7)
[00023a92] 226a 004a                 movea.l    74(a2),a1
[00023a96] 204d                      movea.l    a5,a0
[00023a98] 4eb9 0003 607a            jsr        change_string
[00023a9e] 584f                      addq.w     #4,a7
[00023aa0] 224c                      movea.l    a4,a1
[00023aa2] 7003                      moveq.l    #3,d0
[00023aa4] 41eb 0588                 lea.l      1416(a3),a0
[00023aa8] 4eb9 0006 a068            jsr        Auo_boxed
[00023aae] 2f14                      move.l     (a4),-(a7)
[00023ab0] 226a 004e                 movea.l    78(a2),a1
[00023ab4] 204d                      movea.l    a5,a0
[00023ab6] 4eb9 0003 607a            jsr        change_string
[00023abc] 584f                      addq.w     #4,a7
[00023abe] 2f6a 0014 0094            move.l     20(a2),148(a7)
[00023ac4] 224c                      movea.l    a4,a1
[00023ac6] 7003                      moveq.l    #3,d0
[00023ac8] 41eb 0750                 lea.l      1872(a3),a0
[00023acc] 4eb9 0006 a068            jsr        Auo_boxed
[00023ad2] 2054                      movea.l    (a4),a0
[00023ad4] 1010                      move.b     (a0),d0
[00023ad6] 672e                      beq.s      $00023B06
[00023ad8] 2248                      movea.l    a0,a1
[00023ada] 206d 0018                 movea.l    24(a5),a0
[00023ade] 4eb9 0003 337c            jsr        find_entry
[00023ae4] 2f48 0090                 move.l     a0,144(a7)
[00023ae8] 2008                      move.l     a0,d0
[00023aea] 6610                      bne.s      $00023AFC
[00023aec] 2254                      movea.l    (a4),a1
[00023aee] 41f9 000b 3e8e            lea.l      ERR_OB_DEL,a0
[00023af4] 4eb9 0006 b80c            jsr        alert_str
[00023afa] 600e                      bra.s      $00023B0A
[00023afc] 206f 0090                 movea.l    144(a7),a0
[00023b00] 5268 0036                 addq.w     #1,54(a0)
[00023b04] 6004                      bra.s      $00023B0A
[00023b06] 42af 0090                 clr.l      144(a7)
[00023b0a] 202f 0094                 move.l     148(a7),d0
[00023b0e] 670a                      beq.s      $00023B1A
[00023b10] 2240                      movea.l    d0,a1
[00023b12] 204d                      movea.l    a5,a0
[00023b14] 4eb9 0003 5aa2            jsr        del_object
[00023b1a] 256f 0090 0014            move.l     144(a7),20(a2)
[00023b20] 2f6a 0018 0094            move.l     24(a2),148(a7)
[00023b26] 224c                      movea.l    a4,a1
[00023b28] 7003                      moveq.l    #3,d0
[00023b2a] 41eb 0720                 lea.l      1824(a3),a0
[00023b2e] 4eb9 0006 a068            jsr        Auo_boxed
[00023b34] 2054                      movea.l    (a4),a0
[00023b36] 1010                      move.b     (a0),d0
[00023b38] 672e                      beq.s      $00023B68
[00023b3a] 2248                      movea.l    a0,a1
[00023b3c] 206d 0018                 movea.l    24(a5),a0
[00023b40] 4eb9 0003 337c            jsr        find_entry
[00023b46] 2f48 0090                 move.l     a0,144(a7)
[00023b4a] 2008                      move.l     a0,d0
[00023b4c] 6610                      bne.s      $00023B5E
[00023b4e] 2254                      movea.l    (a4),a1
[00023b50] 41f9 000b 3e8e            lea.l      ERR_OB_DEL,a0
[00023b56] 4eb9 0006 b80c            jsr        alert_str
[00023b5c] 600e                      bra.s      $00023B6C
[00023b5e] 206f 0090                 movea.l    144(a7),a0
[00023b62] 5268 0036                 addq.w     #1,54(a0)
[00023b66] 6004                      bra.s      $00023B6C
[00023b68] 42af 0090                 clr.l      144(a7)
[00023b6c] 202f 0094                 move.l     148(a7),d0
[00023b70] 670a                      beq.s      $00023B7C
[00023b72] 2240                      movea.l    d0,a1
[00023b74] 204d                      movea.l    a5,a0
[00023b76] 4eb9 0003 5aa2            jsr        del_object
[00023b7c] 256f 0090 0018            move.l     144(a7),24(a2)
[00023b82] 2f6a 005e 0094            move.l     94(a2),148(a7)
[00023b88] 224c                      movea.l    a4,a1
[00023b8a] 7003                      moveq.l    #3,d0
[00023b8c] 41eb 06f0                 lea.l      1776(a3),a0
[00023b90] 4eb9 0006 a068            jsr        Auo_boxed
[00023b96] 2054                      movea.l    (a4),a0
[00023b98] 1010                      move.b     (a0),d0
[00023b9a] 672e                      beq.s      $00023BCA
[00023b9c] 2248                      movea.l    a0,a1
[00023b9e] 206d 001c                 movea.l    28(a5),a0
[00023ba2] 4eb9 0003 337c            jsr        find_entry
[00023ba8] 2f48 0090                 move.l     a0,144(a7)
[00023bac] 2008                      move.l     a0,d0
[00023bae] 6610                      bne.s      $00023BC0
[00023bb0] 2254                      movea.l    (a4),a1
[00023bb2] 41f9 000b 3e45            lea.l      ERR_ME_DEL,a0
[00023bb8] 4eb9 0006 b80c            jsr        alert_str
[00023bbe] 600e                      bra.s      $00023BCE
[00023bc0] 206f 0090                 movea.l    144(a7),a0
[00023bc4] 5268 0036                 addq.w     #1,54(a0)
[00023bc8] 6004                      bra.s      $00023BCE
[00023bca] 42af 0090                 clr.l      144(a7)
[00023bce] 202f 0094                 move.l     148(a7),d0
[00023bd2] 670a                      beq.s      $00023BDE
[00023bd4] 2240                      movea.l    d0,a1
[00023bd6] 204d                      movea.l    a5,a0
[00023bd8] 4eb9 0003 5834            jsr        del_men
[00023bde] 256f 0090 005e            move.l     144(a7),94(a2)
[00023be4] 2f6a 005a 0094            move.l     90(a2),148(a7)
[00023bea] 224c                      movea.l    a4,a1
[00023bec] 7003                      moveq.l    #3,d0
[00023bee] 41eb 0780                 lea.l      1920(a3),a0
[00023bf2] 4eb9 0006 a068            jsr        Auo_boxed
[00023bf8] 2054                      movea.l    (a4),a0
[00023bfa] 1010                      move.b     (a0),d0
[00023bfc] 672e                      beq.s      $00023C2C
[00023bfe] 2248                      movea.l    a0,a1
[00023c00] 206d 002c                 movea.l    44(a5),a0
[00023c04] 4eb9 0003 337c            jsr        find_entry
[00023c0a] 2f48 0090                 move.l     a0,144(a7)
[00023c0e] 2008                      move.l     a0,d0
[00023c10] 6610                      bne.s      $00023C22
[00023c12] 2254                      movea.l    (a4),a1
[00023c14] 41f9 000b 3dfc            lea.l      ERR_IC_DEL,a0
[00023c1a] 4eb9 0006 b80c            jsr        alert_str
[00023c20] 600e                      bra.s      $00023C30
[00023c22] 206f 0090                 movea.l    144(a7),a0
[00023c26] 5268 0036                 addq.w     #1,54(a0)
[00023c2a] 6004                      bra.s      $00023C30
[00023c2c] 42af 0090                 clr.l      144(a7)
[00023c30] 202f 0094                 move.l     148(a7),d0
[00023c34] 670a                      beq.s      $00023C40
[00023c36] 2240                      movea.l    d0,a1
[00023c38] 204d                      movea.l    a5,a0
[00023c3a] 4eb9 0003 4b40            jsr        del_icon
[00023c40] 256f 0090 005a            move.l     144(a7),90(a2)
[00023c46] 224c                      movea.l    a4,a1
[00023c48] 7003                      moveq.l    #3,d0
[00023c4a] 41eb 07b0                 lea.l      1968(a3),a0
[00023c4e] 4eb9 0006 a068            jsr        Auo_boxed
[00023c54] 2f14                      move.l     (a4),-(a7)
[00023c56] 4240                      clr.w      d0
[00023c58] 224a                      movea.l    a2,a1
[00023c5a] 204d                      movea.l    a5,a0
[00023c5c] 4eb9 0001 58c6            jsr        mod_ref
[00023c62] 584f                      addq.w     #4,a7
[00023c64] 224c                      movea.l    a4,a1
[00023c66] 7003                      moveq.l    #3,d0
[00023c68] 41eb 0918                 lea.l      2328(a3),a0
[00023c6c] 4eb9 0006 a068            jsr        Auo_boxed
[00023c72] 2f14                      move.l     (a4),-(a7)
[00023c74] 7006                      moveq.l    #6,d0
[00023c76] 43ea 000c                 lea.l      12(a2),a1
[00023c7a] 204d                      movea.l    a5,a0
[00023c7c] 4eb9 0001 58c6            jsr        mod_ref
[00023c82] 584f                      addq.w     #4,a7
[00023c84] 224c                      movea.l    a4,a1
[00023c86] 7003                      moveq.l    #3,d0
[00023c88] 41eb 0948                 lea.l      2376(a3),a0
[00023c8c] 4eb9 0006 a068            jsr        Auo_boxed
[00023c92] 2f14                      move.l     (a4),-(a7)
[00023c94] 7007                      moveq.l    #7,d0
[00023c96] 43ea 0008                 lea.l      8(a2),a1
[00023c9a] 204d                      movea.l    a5,a0
[00023c9c] 4eb9 0001 58c6            jsr        mod_ref
[00023ca2] 584f                      addq.w     #4,a7
[00023ca4] 224c                      movea.l    a4,a1
[00023ca6] 7003                      moveq.l    #3,d0
[00023ca8] 41eb 0978                 lea.l      2424(a3),a0
[00023cac] 4eb9 0006 a068            jsr        Auo_boxed
[00023cb2] 2f14                      move.l     (a4),-(a7)
[00023cb4] 7015                      moveq.l    #21,d0
[00023cb6] 43ea 0004                 lea.l      4(a2),a1
[00023cba] 204d                      movea.l    a5,a0
[00023cbc] 4eb9 0001 58c6            jsr        mod_ref
[00023cc2] 584f                      addq.w     #4,a7
[00023cc4] 224c                      movea.l    a4,a1
[00023cc6] 7003                      moveq.l    #3,d0
[00023cc8] 41eb 09a8                 lea.l      2472(a3),a0
[00023ccc] 4eb9 0006 a068            jsr        Auo_boxed
[00023cd2] 2f14                      move.l     (a4),-(a7)
[00023cd4] 7008                      moveq.l    #8,d0
[00023cd6] 43ea 0010                 lea.l      16(a2),a1
[00023cda] 204d                      movea.l    a5,a0
[00023cdc] 4eb9 0001 58c6            jsr        mod_ref
[00023ce2] 584f                      addq.w     #4,a7
[00023ce4] 224c                      movea.l    a4,a1
[00023ce6] 7003                      moveq.l    #3,d0
[00023ce8] 41eb 09d8                 lea.l      2520(a3),a0
[00023cec] 4eb9 0006 a068            jsr        Auo_boxed
[00023cf2] 2f14                      move.l     (a4),-(a7)
[00023cf4] 7009                      moveq.l    #9,d0
[00023cf6] 43ea 0062                 lea.l      98(a2),a1
[00023cfa] 204d                      movea.l    a5,a0
[00023cfc] 4eb9 0001 58c6            jsr        mod_ref
[00023d02] 584f                      addq.w     #4,a7
[00023d04] 224c                      movea.l    a4,a1
[00023d06] 7003                      moveq.l    #3,d0
[00023d08] 41eb 0a08                 lea.l      2568(a3),a0
[00023d0c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d12] 2f14                      move.l     (a4),-(a7)
[00023d14] 700a                      moveq.l    #10,d0
[00023d16] 43ea 0066                 lea.l      102(a2),a1
[00023d1a] 204d                      movea.l    a5,a0
[00023d1c] 4eb9 0001 58c6            jsr        mod_ref
[00023d22] 584f                      addq.w     #4,a7
[00023d24] 224c                      movea.l    a4,a1
[00023d26] 7003                      moveq.l    #3,d0
[00023d28] 41eb 0a38                 lea.l      2616(a3),a0
[00023d2c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d32] 2f14                      move.l     (a4),-(a7)
[00023d34] 700b                      moveq.l    #11,d0
[00023d36] 43ea 006a                 lea.l      106(a2),a1
[00023d3a] 204d                      movea.l    a5,a0
[00023d3c] 4eb9 0001 58c6            jsr        mod_ref
[00023d42] 584f                      addq.w     #4,a7
[00023d44] 224c                      movea.l    a4,a1
[00023d46] 7003                      moveq.l    #3,d0
[00023d48] 41eb 0a68                 lea.l      2664(a3),a0
[00023d4c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d52] 2f14                      move.l     (a4),-(a7)
[00023d54] 700c                      moveq.l    #12,d0
[00023d56] 43ea 006e                 lea.l      110(a2),a1
[00023d5a] 204d                      movea.l    a5,a0
[00023d5c] 4eb9 0001 58c6            jsr        mod_ref
[00023d62] 584f                      addq.w     #4,a7
[00023d64] 224c                      movea.l    a4,a1
[00023d66] 7003                      moveq.l    #3,d0
[00023d68] 41eb 0a98                 lea.l      2712(a3),a0
[00023d6c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d72] 2f14                      move.l     (a4),-(a7)
[00023d74] 700e                      moveq.l    #14,d0
[00023d76] 43ea 0072                 lea.l      114(a2),a1
[00023d7a] 204d                      movea.l    a5,a0
[00023d7c] 4eb9 0001 58c6            jsr        mod_ref
[00023d82] 584f                      addq.w     #4,a7
[00023d84] 224c                      movea.l    a4,a1
[00023d86] 7003                      moveq.l    #3,d0
[00023d88] 41eb 0ac8                 lea.l      2760(a3),a0
[00023d8c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d92] 2f14                      move.l     (a4),-(a7)
[00023d94] 7014                      moveq.l    #20,d0
[00023d96] 43ea 0076                 lea.l      118(a2),a1
[00023d9a] 204d                      movea.l    a5,a0
[00023d9c] 4eb9 0001 58c6            jsr        mod_ref
[00023da2] 584f                      addq.w     #4,a7
[00023da4] 224c                      movea.l    a4,a1
[00023da6] 7003                      moveq.l    #3,d0
[00023da8] 41eb 0af8                 lea.l      2808(a3),a0
[00023dac] 4eb9 0006 a068            jsr        Auo_boxed
[00023db2] 2f14                      move.l     (a4),-(a7)
[00023db4] 700f                      moveq.l    #15,d0
[00023db6] 43ea 007a                 lea.l      122(a2),a1
[00023dba] 204d                      movea.l    a5,a0
[00023dbc] 4eb9 0001 58c6            jsr        mod_ref
[00023dc2] 584f                      addq.w     #4,a7
[00023dc4] 224c                      movea.l    a4,a1
[00023dc6] 7003                      moveq.l    #3,d0
[00023dc8] 41eb 0b28                 lea.l      2856(a3),a0
[00023dcc] 4eb9 0006 a068            jsr        Auo_boxed
[00023dd2] 2f14                      move.l     (a4),-(a7)
[00023dd4] 7010                      moveq.l    #16,d0
[00023dd6] 43ea 007e                 lea.l      126(a2),a1
[00023dda] 204d                      movea.l    a5,a0
[00023ddc] 4eb9 0001 58c6            jsr        mod_ref
[00023de2] 584f                      addq.w     #4,a7
[00023de4] 224c                      movea.l    a4,a1
[00023de6] 7003                      moveq.l    #3,d0
[00023de8] 41eb 0b58                 lea.l      2904(a3),a0
[00023dec] 4eb9 0006 a068            jsr        Auo_boxed
[00023df2] 2f14                      move.l     (a4),-(a7)
[00023df4] 7011                      moveq.l    #17,d0
[00023df6] 43ea 0082                 lea.l      130(a2),a1
[00023dfa] 204d                      movea.l    a5,a0
[00023dfc] 4eb9 0001 58c6            jsr        mod_ref
[00023e02] 584f                      addq.w     #4,a7
[00023e04] 224c                      movea.l    a4,a1
[00023e06] 7003                      moveq.l    #3,d0
[00023e08] 41eb 0bb8                 lea.l      3000(a3),a0
[00023e0c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e12] 2f14                      move.l     (a4),-(a7)
[00023e14] 7013                      moveq.l    #19,d0
[00023e16] 43ea 0086                 lea.l      134(a2),a1
[00023e1a] 204d                      movea.l    a5,a0
[00023e1c] 4eb9 0001 58c6            jsr        mod_ref
[00023e22] 584f                      addq.w     #4,a7
[00023e24] 224c                      movea.l    a4,a1
[00023e26] 7003                      moveq.l    #3,d0
[00023e28] 41eb 0b88                 lea.l      2952(a3),a0
[00023e2c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e32] 2f14                      move.l     (a4),-(a7)
[00023e34] 7012                      moveq.l    #18,d0
[00023e36] 43ea 008a                 lea.l      138(a2),a1
[00023e3a] 204d                      movea.l    a5,a0
[00023e3c] 4eb9 0001 58c6            jsr        mod_ref
[00023e42] 584f                      addq.w     #4,a7
[00023e44] 224c                      movea.l    a4,a1
[00023e46] 7003                      moveq.l    #3,d0
[00023e48] 41eb 0be8                 lea.l      3048(a3),a0
[00023e4c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e52] 2f14                      move.l     (a4),-(a7)
[00023e54] 7016                      moveq.l    #22,d0
[00023e56] 43ea 008e                 lea.l      142(a2),a1
[00023e5a] 204d                      movea.l    a5,a0
[00023e5c] 4eb9 0001 58c6            jsr        mod_ref
[00023e62] 584f                      addq.w     #4,a7
[00023e64] 224c                      movea.l    a4,a1
[00023e66] 7003                      moveq.l    #3,d0
[00023e68] 41eb 0c18                 lea.l      3096(a3),a0
[00023e6c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e72] 2f14                      move.l     (a4),-(a7)
[00023e74] 7017                      moveq.l    #23,d0
[00023e76] 43ea 0092                 lea.l      146(a2),a1
[00023e7a] 204d                      movea.l    a5,a0
[00023e7c] 4eb9 0001 58c6            jsr        mod_ref
[00023e82] 584f                      addq.w     #4,a7
[00023e84] 224c                      movea.l    a4,a1
[00023e86] 7003                      moveq.l    #3,d0
[00023e88] 41eb 0c48                 lea.l      3144(a3),a0
[00023e8c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e92] 2f14                      move.l     (a4),-(a7)
[00023e94] 7018                      moveq.l    #24,d0
[00023e96] 43ea 0096                 lea.l      150(a2),a1
[00023e9a] 204d                      movea.l    a5,a0
[00023e9c] 4eb9 0001 58c6            jsr        mod_ref
[00023ea2] 584f                      addq.w     #4,a7
[00023ea4] 2f6a 009e 0094            move.l     158(a2),148(a7)
[00023eaa] 43ef 0004                 lea.l      4(a7),a1
[00023eae] 7003                      moveq.l    #3,d0
[00023eb0] 41eb 0648                 lea.l      1608(a3),a0
[00023eb4] 4eb9 0006 a068            jsr        Auo_boxed
[00023eba] 206f 0004                 movea.l    4(a7),a0
[00023ebe] 4eb9 0008 2f6c            jsr        strlen
[00023ec4] 5280                      addq.l     #1,d0
[00023ec6] 2f40 000a                 move.l     d0,10(a7)
[00023eca] 2f40 000e                 move.l     d0,14(a7)
[00023ece] 206f 0004                 movea.l    4(a7),a0
[00023ed2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00023ed8] 4a40                      tst.w      d0
[00023eda] 662e                      bne.s      $00023F0A
[00023edc] 202f 0094                 move.l     148(a7),d0
[00023ee0] 6610                      bne.s      $00023EF2
[00023ee2] 43d7                      lea.l      (a7),a1
[00023ee4] 204d                      movea.l    a5,a0
[00023ee6] 4eb9 0003 5f3e            jsr        add_string
[00023eec] 2f48 0090                 move.l     a0,144(a7)
[00023ef0] 601c                      bra.s      $00023F0E
[00023ef2] 2f2f 0004                 move.l     4(a7),-(a7)
[00023ef6] 226f 0098                 movea.l    152(a7),a1
[00023efa] 204d                      movea.l    a5,a0
[00023efc] 4eb9 0003 607a            jsr        change_string
[00023f02] 584f                      addq.w     #4,a7
[00023f04] 2f48 0090                 move.l     a0,144(a7)
[00023f08] 6004                      bra.s      $00023F0E
[00023f0a] 42af 0090                 clr.l      144(a7)
[00023f0e] 202f 0094                 move.l     148(a7),d0
[00023f12] 6710                      beq.s      $00023F24
[00023f14] b0af 0090                 cmp.l      144(a7),d0
[00023f18] 670a                      beq.s      $00023F24
[00023f1a] 2240                      movea.l    d0,a1
[00023f1c] 204d                      movea.l    a5,a0
[00023f1e] 4eb9 0003 6108            jsr        del_string
[00023f24] 256f 0090 009e            move.l     144(a7),158(a2)
[00023f2a] 2f6a 009a 0094            move.l     154(a2),148(a7)
[00023f30] 43ef 0046                 lea.l      70(a7),a1
[00023f34] 7003                      moveq.l    #3,d0
[00023f36] 41eb 0630                 lea.l      1584(a3),a0
[00023f3a] 4eb9 0006 a068            jsr        Auo_boxed
[00023f40] 206f 0046                 movea.l    70(a7),a0
[00023f44] 4eb9 0008 2f6c            jsr        strlen
[00023f4a] 5280                      addq.l     #1,d0
[00023f4c] 2f40 004c                 move.l     d0,76(a7)
[00023f50] 2f40 0050                 move.l     d0,80(a7)
[00023f54] 206f 0046                 movea.l    70(a7),a0
[00023f58] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00023f5e] 4a40                      tst.w      d0
[00023f60] 6630                      bne.s      $00023F92
[00023f62] 202f 0094                 move.l     148(a7),d0
[00023f66] 6612                      bne.s      $00023F7A
[00023f68] 43ef 0042                 lea.l      66(a7),a1
[00023f6c] 204d                      movea.l    a5,a0
[00023f6e] 4eb9 0003 5f3e            jsr        add_string
[00023f74] 2f48 0090                 move.l     a0,144(a7)
[00023f78] 601c                      bra.s      $00023F96
[00023f7a] 2f2f 0046                 move.l     70(a7),-(a7)
[00023f7e] 226f 0098                 movea.l    152(a7),a1
[00023f82] 204d                      movea.l    a5,a0
[00023f84] 4eb9 0003 607a            jsr        change_string
[00023f8a] 584f                      addq.w     #4,a7
[00023f8c] 2f48 0090                 move.l     a0,144(a7)
[00023f90] 6004                      bra.s      $00023F96
[00023f92] 42af 0090                 clr.l      144(a7)
[00023f96] 202f 0094                 move.l     148(a7),d0
[00023f9a] 6710                      beq.s      $00023FAC
[00023f9c] b0af 0090                 cmp.l      144(a7),d0
[00023fa0] 670a                      beq.s      $00023FAC
[00023fa2] 2240                      movea.l    d0,a1
[00023fa4] 204d                      movea.l    a5,a0
[00023fa6] 4eb9 0003 6108            jsr        del_string
[00023fac] 256f 0090 009a            move.l     144(a7),154(a2)
[00023fb2] 4fef 009c                 lea.l      156(a7),a7
[00023fb6] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00023fba] 4e75                      rts
wi_make:
[00023fbc] 48e7 0038                 movem.l    a2-a4,-(a7)
[00023fc0] 594f                      subq.w     #4,a7
[00023fc2] 2e88                      move.l     a0,(a7)
[00023fc4] 2668 0004                 movea.l    4(a0),a3
[00023fc8] 286b 0012                 movea.l    18(a3),a4
[00023fcc] 200c                      move.l     a4,d0
[00023fce] 670c                      beq.s      $00023FDC
[00023fd0] 204c                      movea.l    a4,a0
[00023fd2] 4eb9 0005 6bea            jsr        Awi_show
[00023fd8] 6000 0086                 bra        $00024060
[00023fdc] 7008                      moveq.l    #8,d0
[00023fde] 4eb9 0004 c608            jsr        Ax_malloc
[00023fe4] 2448                      movea.l    a0,a2
[00023fe6] 200a                      move.l     a2,d0
[00023fe8] 6772                      beq.s      $0002405C
[00023fea] 2257                      movea.l    (a7),a1
[00023fec] 2091                      move.l     (a1),(a0)
[00023fee] 2569 0004 0004            move.l     4(a1),4(a2)
[00023ff4] 41eb 0016                 lea.l      22(a3),a0
[00023ff8] 23c8 000b 79bc            move.l     a0,$000B79BC
[00023ffe] 2279 000b 79c8            movea.l    $000B79C8,a1
[00024004] 2348 0008                 move.l     a0,8(a1)
[00024008] 41f9 000b 796e            lea.l      WI_WINDOW,a0
[0002400e] 4eb9 0005 7052            jsr        Awi_create
[00024014] 2848                      movea.l    a0,a4
[00024016] 200c                      move.l     a4,d0
[00024018] 660a                      bne.s      $00024024
[0002401a] 204a                      movea.l    a2,a0
[0002401c] 4eb9 0004 c7c8            jsr        Ax_free
[00024022] 6038                      bra.s      $0002405C
[00024024] 2057                      movea.l    (a7),a0
[00024026] 2250                      movea.l    (a0),a1
[00024028] 4869 0168                 pea.l      360(a1)
[0002402c] 43eb 003a                 lea.l      58(a3),a1
[00024030] 204c                      movea.l    a4,a0
[00024032] 4eb9 0001 6372            jsr        wi_pos
[00024038] 584f                      addq.w     #4,a7
[0002403a] 288a                      move.l     a2,(a4)
[0002403c] 274c 0012                 move.l     a4,18(a3)
[00024040] 204c                      movea.l    a4,a0
[00024042] 4eb9 0002 4148            jsr        set_window
[00024048] 204c                      movea.l    a4,a0
[0002404a] 226c 000c                 movea.l    12(a4),a1
[0002404e] 4e91                      jsr        (a1)
[00024050] 4a40                      tst.w      d0
[00024052] 670c                      beq.s      $00024060
[00024054] 204c                      movea.l    a4,a0
[00024056] 4eb9 0002 4842            jsr        term
[0002405c] 91c8                      suba.l     a0,a0
[0002405e] 6002                      bra.s      $00024062
[00024060] 204c                      movea.l    a4,a0
[00024062] 584f                      addq.w     #4,a7
[00024064] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00024068] 4e75                      rts
wi_service:
[0002406a] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002406e] 2448                      movea.l    a0,a2
[00024070] 3600                      move.w     d0,d3
[00024072] 2849                      movea.l    a1,a4
[00024074] 2650                      movea.l    (a0),a3
[00024076] b07c 0024                 cmp.w      #$0024,d0
[0002407a] 672a                      beq.s      $000240A6
[0002407c] 6e0e                      bgt.s      $0002408C
[0002407e] 5540                      subq.w     #2,d0
[00024080] 6700 0090                 beq        $00024112
[00024084] 5f40                      subq.w     #7,d0
[00024086] 6726                      beq.s      $000240AE
[00024088] 6000 00a8                 bra        $00024132
[0002408c] 907c 0025                 sub.w      #$0025,d0
[00024090] 670c                      beq.s      $0002409E
[00024092] 907c 26eb                 sub.w      #$26EB,d0
[00024096] 6700 008c                 beq        $00024124
[0002409a] 6000 0096                 bra        $00024132
[0002409e] 42ac 0002                 clr.l      2(a4)
[000240a2] 6000 009c                 bra        $00024140
[000240a6] 38bc 0001                 move.w     #$0001,(a4)
[000240aa] 6000 0094                 bra        $00024140
[000240ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[000240b4] 2268 0254                 movea.l    596(a0),a1
[000240b8] 3211                      move.w     (a1),d1
[000240ba] 48c1                      ext.l      d1
[000240bc] 2001                      move.l     d1,d0
[000240be] d080                      add.l      d0,d0
[000240c0] d081                      add.l      d1,d0
[000240c2] e788                      lsl.l      #3,d0
[000240c4] 2268 0240                 movea.l    576(a0),a1
[000240c8] 2069 0014                 movea.l    20(a1),a0
[000240cc] 41f0 0818                 lea.l      24(a0,d0.l),a0
[000240d0] 3414                      move.w     (a4),d2
[000240d2] 947c 004a                 sub.w      #$004A,d2
[000240d6] 6718                      beq.s      $000240F0
[000240d8] 5542                      subq.w     #2,d2
[000240da] 670a                      beq.s      $000240E6
[000240dc] 5542                      subq.w     #2,d2
[000240de] 6706                      beq.s      $000240E6
[000240e0] 5542                      subq.w     #2,d2
[000240e2] 6716                      beq.s      $000240FA
[000240e4] 6022                      bra.s      $00024108
[000240e6] 0c68 2710 0016            cmpi.w     #$2710,22(a0)
[000240ec] 6752                      beq.s      $00024140
[000240ee] 6012                      bra.s      $00024102
[000240f0] 0c68 2711 0016            cmpi.w     #$2711,22(a0)
[000240f6] 6748                      beq.s      $00024140
[000240f8] 6008                      bra.s      $00024102
[000240fa] 0c68 2720 0016            cmpi.w     #$2720,22(a0)
[00024100] 673e                      beq.s      $00024140
[00024102] 426c 0002                 clr.w      2(a4)
[00024106] 6038                      bra.s      $00024140
[00024108] 0c68 271c 0016            cmpi.w     #$271C,22(a0)
[0002410e] 6730                      beq.s      $00024140
[00024110] 60f0                      bra.s      $00024102
[00024112] 7001                      moveq.l    #1,d0
[00024114] 204a                      movea.l    a2,a0
[00024116] 6100 f712                 bsr        acc_window
[0002411a] 204a                      movea.l    a2,a0
[0002411c] 4eb9 0002 4842            jsr        term
[00024122] 601c                      bra.s      $00024140
[00024124] 226b 0004                 movea.l    4(a3),a1
[00024128] 204a                      movea.l    a2,a0
[0002412a] 4eb9 0001 60ea            jsr        new_name
[00024130] 600e                      bra.s      $00024140
[00024132] 224c                      movea.l    a4,a1
[00024134] 3003                      move.w     d3,d0
[00024136] 204a                      movea.l    a2,a0
[00024138] 4eb9 0005 9dd0            jsr        Awi_service
[0002413e] 6002                      bra.s      $00024142
[00024140] 7001                      moveq.l    #1,d0
[00024142] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00024146] 4e75                      rts
set_window:
[00024148] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0002414c] 4fef ffc2                 lea.l      -62(a7),a7
[00024150] 2a48                      movea.l    a0,a5
[00024152] 2050                      movea.l    (a0),a0
[00024154] 2268 0004                 movea.l    4(a0),a1
[00024158] 2469 0004                 movea.l    4(a1),a2
[0002415c] 266d 0014                 movea.l    20(a5),a3
[00024160] 362a 0022                 move.w     34(a2),d3
[00024164] 41eb 0228                 lea.l      552(a3),a0
[00024168] 7002                      moveq.l    #2,d0
[0002416a] c043                      and.w      d3,d0
[0002416c] 4eb9 0001 58a2            jsr        set_flag
[00024172] 41eb 03c0                 lea.l      960(a3),a0
[00024176] 3003                      move.w     d3,d0
[00024178] c07c 1000                 and.w      #$1000,d0
[0002417c] 4eb9 0001 58a2            jsr        set_flag
[00024182] 41eb 03a8                 lea.l      936(a3),a0
[00024186] 7008                      moveq.l    #8,d0
[00024188] c043                      and.w      d3,d0
[0002418a] 4eb9 0001 58a2            jsr        set_flag
[00024190] 41eb 0390                 lea.l      912(a3),a0
[00024194] 7001                      moveq.l    #1,d0
[00024196] c043                      and.w      d3,d0
[00024198] 4eb9 0001 58a2            jsr        set_flag
[0002419e] 41eb 0240                 lea.l      576(a3),a0
[000241a2] 7010                      moveq.l    #16,d0
[000241a4] c043                      and.w      d3,d0
[000241a6] 4eb9 0001 58a2            jsr        set_flag
[000241ac] 41eb 0348                 lea.l      840(a3),a0
[000241b0] 7004                      moveq.l    #4,d0
[000241b2] c043                      and.w      d3,d0
[000241b4] 4eb9 0001 58a2            jsr        set_flag
[000241ba] 41eb 02d0                 lea.l      720(a3),a0
[000241be] 7020                      moveq.l    #32,d0
[000241c0] c043                      and.w      d3,d0
[000241c2] 4eb9 0001 58a2            jsr        set_flag
[000241c8] 41eb 0330                 lea.l      816(a3),a0
[000241cc] 7040                      moveq.l    #64,d0
[000241ce] c043                      and.w      d3,d0
[000241d0] 4eb9 0001 58a2            jsr        set_flag
[000241d6] 41eb 02e8                 lea.l      744(a3),a0
[000241da] 303c 0080                 move.w     #$0080,d0
[000241de] c043                      and.w      d3,d0
[000241e0] 4eb9 0001 58a2            jsr        set_flag
[000241e6] 41eb 02b8                 lea.l      696(a3),a0
[000241ea] 3003                      move.w     d3,d0
[000241ec] c07c 0400                 and.w      #$0400,d0
[000241f0] 4eb9 0001 58a2            jsr        set_flag
[000241f6] 41eb 02a0                 lea.l      672(a3),a0
[000241fa] 3003                      move.w     d3,d0
[000241fc] c07c 0200                 and.w      #$0200,d0
[00024200] 4eb9 0001 58a2            jsr        set_flag
[00024206] 41eb 0318                 lea.l      792(a3),a0
[0002420a] 3003                      move.w     d3,d0
[0002420c] c07c 0100                 and.w      #$0100,d0
[00024210] 4eb9 0001 58a2            jsr        set_flag
[00024216] 41eb 0288                 lea.l      648(a3),a0
[0002421a] 3003                      move.w     d3,d0
[0002421c] c07c 0800                 and.w      #$0800,d0
[00024220] 4eb9 0001 58a2            jsr        set_flag
[00024226] 41eb 0360                 lea.l      864(a3),a0
[0002422a] 3003                      move.w     d3,d0
[0002422c] c07c 4000                 and.w      #$4000,d0
[00024230] 4eb9 0001 58a2            jsr        set_flag
[00024236] 41eb 0378                 lea.l      888(a3),a0
[0002423a] 3003                      move.w     d3,d0
[0002423c] c07c 2000                 and.w      #$2000,d0
[00024240] 4eb9 0001 58a2            jsr        set_flag
[00024246] 362a 0054                 move.w     84(a2),d3
[0002424a] 41eb 03f0                 lea.l      1008(a3),a0
[0002424e] 7008                      moveq.l    #8,d0
[00024250] c043                      and.w      d3,d0
[00024252] 4eb9 0001 58a2            jsr        set_flag
[00024258] 41eb 0420                 lea.l      1056(a3),a0
[0002425c] 7004                      moveq.l    #4,d0
[0002425e] c043                      and.w      d3,d0
[00024260] 4eb9 0001 58a2            jsr        set_flag
[00024266] 41eb 0450                 lea.l      1104(a3),a0
[0002426a] 7001                      moveq.l    #1,d0
[0002426c] c043                      and.w      d3,d0
[0002426e] 4eb9 0001 58a2            jsr        set_flag
[00024274] 41eb 0480                 lea.l      1152(a3),a0
[00024278] 7002                      moveq.l    #2,d0
[0002427a] c043                      and.w      d3,d0
[0002427c] 4eb9 0001 58a2            jsr        set_flag
[00024282] 41eb 04b0                 lea.l      1200(a3),a0
[00024286] 7010                      moveq.l    #16,d0
[00024288] c043                      and.w      d3,d0
[0002428a] 4eb9 0001 58a2            jsr        set_flag
[00024290] 41eb 04e0                 lea.l      1248(a3),a0
[00024294] 3003                      move.w     d3,d0
[00024296] c07c 0100                 and.w      #$0100,d0
[0002429a] 4eb9 0001 58a2            jsr        set_flag
[000242a0] 2f4d 0034                 move.l     a5,52(a7)
[000242a4] 4beb 0150                 lea.l      336(a3),a5
[000242a8] 2f4d 0038                 move.l     a5,56(a7)
[000242ac] 3f7c 000e 003c            move.w     #$000E,60(a7)
[000242b2] 43ef 0034                 lea.l      52(a7),a1
[000242b6] 7009                      moveq.l    #9,d0
[000242b8] 204d                      movea.l    a5,a0
[000242ba] 4eb9 0003 71ba            jsr        Auo_slider
[000242c0] 2f7c 0000 0007 002c       move.l     #$00000007,44(a7)
[000242c8] 43ef 002c                 lea.l      44(a7),a1
[000242cc] 7064                      moveq.l    #100,d0
[000242ce] 204d                      movea.l    a5,a0
[000242d0] 4eb9 0003 71ba            jsr        Auo_slider
[000242d6] 2f7c 0000 0001 002c       move.l     #$00000001,44(a7)
[000242de] 43ef 002c                 lea.l      44(a7),a1
[000242e2] 7065                      moveq.l    #101,d0
[000242e4] 204d                      movea.l    a5,a0
[000242e6] 4eb9 0003 71ba            jsr        Auo_slider
[000242ec] 302a 0048                 move.w     72(a2),d0
[000242f0] 807c ff00                 or.w       #$FF00,d0
[000242f4] 4440                      neg.w      d0
[000242f6] b07c 0008                 cmp.w      #$0008,d0
[000242fa] 673e                      beq.s      $0002433A
[000242fc] 6e0e                      bgt.s      $0002430C
[000242fe] 5340                      subq.w     #1,d0
[00024300] 671e                      beq.s      $00024320
[00024302] 5340                      subq.w     #1,d0
[00024304] 6720                      beq.s      $00024326
[00024306] 5540                      subq.w     #2,d0
[00024308] 6726                      beq.s      $00024330
[0002430a] 6054                      bra.s      $00024360
[0002430c] 907c 0010                 sub.w      #$0010,d0
[00024310] 6732                      beq.s      $00024344
[00024312] 907c 0010                 sub.w      #$0010,d0
[00024316] 6736                      beq.s      $0002434E
[00024318] 907c 0020                 sub.w      #$0020,d0
[0002431c] 673a                      beq.s      $00024358
[0002431e] 6040                      bra.s      $00024360
[00024320] 42af 002c                 clr.l      44(a7)
[00024324] 603a                      bra.s      $00024360
[00024326] 2f7c 0000 0001 002c       move.l     #$00000001,44(a7)
[0002432e] 6030                      bra.s      $00024360
[00024330] 2f7c 0000 0002 002c       move.l     #$00000002,44(a7)
[00024338] 6026                      bra.s      $00024360
[0002433a] 2f7c 0000 0003 002c       move.l     #$00000003,44(a7)
[00024342] 601c                      bra.s      $00024360
[00024344] 2f7c 0000 0004 002c       move.l     #$00000004,44(a7)
[0002434c] 6012                      bra.s      $00024360
[0002434e] 2f7c 0000 0005 002c       move.l     #$00000005,44(a7)
[00024356] 6008                      bra.s      $00024360
[00024358] 2f7c 0000 0006 002c       move.l     #$00000006,44(a7)
[00024360] 43ef 002c                 lea.l      44(a7),a1
[00024364] 7011                      moveq.l    #17,d0
[00024366] 204d                      movea.l    a5,a0
[00024368] 4eb9 0003 71ba            jsr        Auo_slider
[0002436e] 49ef 0008                 lea.l      8(a7),a4
[00024372] 302a 0048                 move.w     72(a2),d0
[00024376] 807c ff00                 or.w       #$FF00,d0
[0002437a] 4440                      neg.w      d0
[0002437c] 3f00                      move.w     d0,-(a7)
[0002437e] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00024384] 204c                      movea.l    a4,a0
[00024386] 4eb9 0008 15ac            jsr        sprintf
[0002438c] 544f                      addq.w     #2,a7
[0002438e] 224c                      movea.l    a4,a1
[00024390] 7004                      moveq.l    #4,d0
[00024392] 204d                      movea.l    a5,a0
[00024394] 4eb9 0003 71ba            jsr        Auo_slider
[0002439a] 2ebc 0002 47f2            move.l     #live_snap,(a7)
[000243a0] 2f4d 0004                 move.l     a5,4(a7)
[000243a4] 43d7                      lea.l      (a7),a1
[000243a6] 7067                      moveq.l    #103,d0
[000243a8] 204d                      movea.l    a5,a0
[000243aa] 4eb9 0003 71ba            jsr        Auo_slider
[000243b0] 4beb 0198                 lea.l      408(a3),a5
[000243b4] 2f4d 0038                 move.l     a5,56(a7)
[000243b8] 3f7c 0011 003c            move.w     #$0011,60(a7)
[000243be] 43ef 0034                 lea.l      52(a7),a1
[000243c2] 7009                      moveq.l    #9,d0
[000243c4] 204d                      movea.l    a5,a0
[000243c6] 4eb9 0003 71ba            jsr        Auo_slider
[000243cc] 2f7c 0000 0007 002c       move.l     #$00000007,44(a7)
[000243d4] 43ef 002c                 lea.l      44(a7),a1
[000243d8] 7064                      moveq.l    #100,d0
[000243da] 204d                      movea.l    a5,a0
[000243dc] 4eb9 0003 71ba            jsr        Auo_slider
[000243e2] 2f7c 0000 0001 002c       move.l     #$00000001,44(a7)
[000243ea] 43ef 002c                 lea.l      44(a7),a1
[000243ee] 7065                      moveq.l    #101,d0
[000243f0] 204d                      movea.l    a5,a0
[000243f2] 4eb9 0003 71ba            jsr        Auo_slider
[000243f8] 302a 0048                 move.w     72(a2),d0
[000243fc] e040                      asr.w      #8,d0
[000243fe] 4440                      neg.w      d0
[00024400] b07c 0008                 cmp.w      #$0008,d0
[00024404] 673e                      beq.s      $00024444
[00024406] 6e0e                      bgt.s      $00024416
[00024408] 5340                      subq.w     #1,d0
[0002440a] 671e                      beq.s      $0002442A
[0002440c] 5340                      subq.w     #1,d0
[0002440e] 6720                      beq.s      $00024430
[00024410] 5540                      subq.w     #2,d0
[00024412] 6726                      beq.s      $0002443A
[00024414] 6054                      bra.s      $0002446A
[00024416] 907c 0010                 sub.w      #$0010,d0
[0002441a] 6732                      beq.s      $0002444E
[0002441c] 907c 0010                 sub.w      #$0010,d0
[00024420] 6736                      beq.s      $00024458
[00024422] 907c 0020                 sub.w      #$0020,d0
[00024426] 673a                      beq.s      $00024462
[00024428] 6040                      bra.s      $0002446A
[0002442a] 42af 002c                 clr.l      44(a7)
[0002442e] 603a                      bra.s      $0002446A
[00024430] 2f7c 0000 0001 002c       move.l     #$00000001,44(a7)
[00024438] 6030                      bra.s      $0002446A
[0002443a] 2f7c 0000 0002 002c       move.l     #$00000002,44(a7)
[00024442] 6026                      bra.s      $0002446A
[00024444] 2f7c 0000 0003 002c       move.l     #$00000003,44(a7)
[0002444c] 601c                      bra.s      $0002446A
[0002444e] 2f7c 0000 0004 002c       move.l     #$00000004,44(a7)
[00024456] 6012                      bra.s      $0002446A
[00024458] 2f7c 0000 0005 002c       move.l     #$00000005,44(a7)
[00024460] 6008                      bra.s      $0002446A
[00024462] 2f7c 0000 0006 002c       move.l     #$00000006,44(a7)
[0002446a] 43ef 002c                 lea.l      44(a7),a1
[0002446e] 7011                      moveq.l    #17,d0
[00024470] 204d                      movea.l    a5,a0
[00024472] 4eb9 0003 71ba            jsr        Auo_slider
[00024478] 302a 0048                 move.w     72(a2),d0
[0002447c] e040                      asr.w      #8,d0
[0002447e] 4440                      neg.w      d0
[00024480] 3f00                      move.w     d0,-(a7)
[00024482] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00024488] 204c                      movea.l    a4,a0
[0002448a] 4eb9 0008 15ac            jsr        sprintf
[00024490] 544f                      addq.w     #2,a7
[00024492] 224c                      movea.l    a4,a1
[00024494] 7004                      moveq.l    #4,d0
[00024496] 204d                      movea.l    a5,a0
[00024498] 4eb9 0003 71ba            jsr        Auo_slider
[0002449e] 2ebc 0002 47f2            move.l     #live_snap,(a7)
[000244a4] 2f4d 0004                 move.l     a5,4(a7)
[000244a8] 43d7                      lea.l      (a7),a1
[000244aa] 7067                      moveq.l    #103,d0
[000244ac] 204d                      movea.l    a5,a0
[000244ae] 4eb9 0003 71ba            jsr        Auo_slider
[000244b4] 3f2a 0024                 move.w     36(a2),-(a7)
[000244b8] 43f9 000b 7a94            lea.l      $000B7A94,a1
[000244be] 7003                      moveq.l    #3,d0
[000244c0] 204b                      movea.l    a3,a0
[000244c2] 4eb9 0005 0f94            jsr        Aob_printf
[000244c8] 544f                      addq.w     #2,a7
[000244ca] 3f2a 0026                 move.w     38(a2),-(a7)
[000244ce] 43f9 000b 7a94            lea.l      $000B7A94,a1
[000244d4] 7005                      moveq.l    #5,d0
[000244d6] 204b                      movea.l    a3,a0
[000244d8] 4eb9 0005 0f94            jsr        Aob_printf
[000244de] 544f                      addq.w     #2,a7
[000244e0] 3f2a 0028                 move.w     40(a2),-(a7)
[000244e4] 43f9 000b 7a94            lea.l      $000B7A94,a1
[000244ea] 7007                      moveq.l    #7,d0
[000244ec] 204b                      movea.l    a3,a0
[000244ee] 4eb9 0005 0f94            jsr        Aob_printf
[000244f4] 544f                      addq.w     #2,a7
[000244f6] 3f2a 002a                 move.w     42(a2),-(a7)
[000244fa] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00024500] 7009                      moveq.l    #9,d0
[00024502] 204b                      movea.l    a3,a0
[00024504] 4eb9 0005 0f94            jsr        Aob_printf
[0002450a] 544f                      addq.w     #2,a7
[0002450c] 2f6a 004a 0030            move.l     74(a2),48(a7)
[00024512] 206f 0030                 movea.l    48(a7),a0
[00024516] 2268 0004                 movea.l    4(a0),a1
[0002451a] 703a                      moveq.l    #58,d0
[0002451c] 204b                      movea.l    a3,a0
[0002451e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00024524] 2f6a 004e 0030            move.l     78(a2),48(a7)
[0002452a] 206f 0030                 movea.l    48(a7),a0
[0002452e] 2268 0004                 movea.l    4(a0),a1
[00024532] 703b                      moveq.l    #59,d0
[00024534] 204b                      movea.l    a3,a0
[00024536] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002453c] 224c                      movea.l    a4,a1
[0002453e] 206a 0014                 movea.l    20(a2),a0
[00024542] 4eb9 0001 591a            jsr        set_ref
[00024548] 224c                      movea.l    a4,a1
[0002454a] 7004                      moveq.l    #4,d0
[0002454c] 41eb 0750                 lea.l      1872(a3),a0
[00024550] 4eb9 0006 a068            jsr        Auo_boxed
[00024556] 224c                      movea.l    a4,a1
[00024558] 206a 0018                 movea.l    24(a2),a0
[0002455c] 4eb9 0001 591a            jsr        set_ref
[00024562] 224c                      movea.l    a4,a1
[00024564] 7004                      moveq.l    #4,d0
[00024566] 41eb 0720                 lea.l      1824(a3),a0
[0002456a] 4eb9 0006 a068            jsr        Auo_boxed
[00024570] 224c                      movea.l    a4,a1
[00024572] 206a 005e                 movea.l    94(a2),a0
[00024576] 4eb9 0001 591a            jsr        set_ref
[0002457c] 224c                      movea.l    a4,a1
[0002457e] 7004                      moveq.l    #4,d0
[00024580] 41eb 06f0                 lea.l      1776(a3),a0
[00024584] 4eb9 0006 a068            jsr        Auo_boxed
[0002458a] 224c                      movea.l    a4,a1
[0002458c] 206a 005a                 movea.l    90(a2),a0
[00024590] 4eb9 0001 591a            jsr        set_ref
[00024596] 224c                      movea.l    a4,a1
[00024598] 7004                      moveq.l    #4,d0
[0002459a] 41eb 0780                 lea.l      1920(a3),a0
[0002459e] 4eb9 0006 a068            jsr        Auo_boxed
[000245a4] 224c                      movea.l    a4,a1
[000245a6] 2052                      movea.l    (a2),a0
[000245a8] 4eb9 0001 591a            jsr        set_ref
[000245ae] 224c                      movea.l    a4,a1
[000245b0] 7004                      moveq.l    #4,d0
[000245b2] 41eb 07b0                 lea.l      1968(a3),a0
[000245b6] 4eb9 0006 a068            jsr        Auo_boxed
[000245bc] 224c                      movea.l    a4,a1
[000245be] 206a 000c                 movea.l    12(a2),a0
[000245c2] 4eb9 0001 591a            jsr        set_ref
[000245c8] 224c                      movea.l    a4,a1
[000245ca] 7004                      moveq.l    #4,d0
[000245cc] 41eb 0918                 lea.l      2328(a3),a0
[000245d0] 4eb9 0006 a068            jsr        Auo_boxed
[000245d6] 224c                      movea.l    a4,a1
[000245d8] 206a 0008                 movea.l    8(a2),a0
[000245dc] 4eb9 0001 591a            jsr        set_ref
[000245e2] 224c                      movea.l    a4,a1
[000245e4] 7004                      moveq.l    #4,d0
[000245e6] 41eb 0948                 lea.l      2376(a3),a0
[000245ea] 4eb9 0006 a068            jsr        Auo_boxed
[000245f0] 224c                      movea.l    a4,a1
[000245f2] 206a 0004                 movea.l    4(a2),a0
[000245f6] 4eb9 0001 591a            jsr        set_ref
[000245fc] 224c                      movea.l    a4,a1
[000245fe] 7004                      moveq.l    #4,d0
[00024600] 41eb 0978                 lea.l      2424(a3),a0
[00024604] 4eb9 0006 a068            jsr        Auo_boxed
[0002460a] 224c                      movea.l    a4,a1
[0002460c] 206a 0010                 movea.l    16(a2),a0
[00024610] 4eb9 0001 591a            jsr        set_ref
[00024616] 224c                      movea.l    a4,a1
[00024618] 7004                      moveq.l    #4,d0
[0002461a] 41eb 09a8                 lea.l      2472(a3),a0
[0002461e] 4eb9 0006 a068            jsr        Auo_boxed
[00024624] 224c                      movea.l    a4,a1
[00024626] 206a 0062                 movea.l    98(a2),a0
[0002462a] 4eb9 0001 591a            jsr        set_ref
[00024630] 224c                      movea.l    a4,a1
[00024632] 7004                      moveq.l    #4,d0
[00024634] 41eb 09d8                 lea.l      2520(a3),a0
[00024638] 4eb9 0006 a068            jsr        Auo_boxed
[0002463e] 224c                      movea.l    a4,a1
[00024640] 206a 0066                 movea.l    102(a2),a0
[00024644] 4eb9 0001 591a            jsr        set_ref
[0002464a] 224c                      movea.l    a4,a1
[0002464c] 7004                      moveq.l    #4,d0
[0002464e] 41eb 0a08                 lea.l      2568(a3),a0
[00024652] 4eb9 0006 a068            jsr        Auo_boxed
[00024658] 224c                      movea.l    a4,a1
[0002465a] 206a 006a                 movea.l    106(a2),a0
[0002465e] 4eb9 0001 591a            jsr        set_ref
[00024664] 224c                      movea.l    a4,a1
[00024666] 7004                      moveq.l    #4,d0
[00024668] 41eb 0a38                 lea.l      2616(a3),a0
[0002466c] 4eb9 0006 a068            jsr        Auo_boxed
[00024672] 224c                      movea.l    a4,a1
[00024674] 206a 006e                 movea.l    110(a2),a0
[00024678] 4eb9 0001 591a            jsr        set_ref
[0002467e] 224c                      movea.l    a4,a1
[00024680] 7004                      moveq.l    #4,d0
[00024682] 41eb 0a68                 lea.l      2664(a3),a0
[00024686] 4eb9 0006 a068            jsr        Auo_boxed
[0002468c] 224c                      movea.l    a4,a1
[0002468e] 206a 0072                 movea.l    114(a2),a0
[00024692] 4eb9 0001 591a            jsr        set_ref
[00024698] 224c                      movea.l    a4,a1
[0002469a] 7004                      moveq.l    #4,d0
[0002469c] 41eb 0a98                 lea.l      2712(a3),a0
[000246a0] 4eb9 0006 a068            jsr        Auo_boxed
[000246a6] 224c                      movea.l    a4,a1
[000246a8] 206a 0076                 movea.l    118(a2),a0
[000246ac] 4eb9 0001 591a            jsr        set_ref
[000246b2] 224c                      movea.l    a4,a1
[000246b4] 7004                      moveq.l    #4,d0
[000246b6] 41eb 0ac8                 lea.l      2760(a3),a0
[000246ba] 4eb9 0006 a068            jsr        Auo_boxed
[000246c0] 224c                      movea.l    a4,a1
[000246c2] 206a 007a                 movea.l    122(a2),a0
[000246c6] 4eb9 0001 591a            jsr        set_ref
[000246cc] 224c                      movea.l    a4,a1
[000246ce] 7004                      moveq.l    #4,d0
[000246d0] 41eb 0af8                 lea.l      2808(a3),a0
[000246d4] 4eb9 0006 a068            jsr        Auo_boxed
[000246da] 224c                      movea.l    a4,a1
[000246dc] 206a 007e                 movea.l    126(a2),a0
[000246e0] 4eb9 0001 591a            jsr        set_ref
[000246e6] 224c                      movea.l    a4,a1
[000246e8] 7004                      moveq.l    #4,d0
[000246ea] 41eb 0b28                 lea.l      2856(a3),a0
[000246ee] 4eb9 0006 a068            jsr        Auo_boxed
[000246f4] 224c                      movea.l    a4,a1
[000246f6] 206a 0082                 movea.l    130(a2),a0
[000246fa] 4eb9 0001 591a            jsr        set_ref
[00024700] 224c                      movea.l    a4,a1
[00024702] 7004                      moveq.l    #4,d0
[00024704] 41eb 0b58                 lea.l      2904(a3),a0
[00024708] 4eb9 0006 a068            jsr        Auo_boxed
[0002470e] 224c                      movea.l    a4,a1
[00024710] 206a 0086                 movea.l    134(a2),a0
[00024714] 4eb9 0001 591a            jsr        set_ref
[0002471a] 224c                      movea.l    a4,a1
[0002471c] 7004                      moveq.l    #4,d0
[0002471e] 41eb 0bb8                 lea.l      3000(a3),a0
[00024722] 4eb9 0006 a068            jsr        Auo_boxed
[00024728] 224c                      movea.l    a4,a1
[0002472a] 206a 008a                 movea.l    138(a2),a0
[0002472e] 4eb9 0001 591a            jsr        set_ref
[00024734] 224c                      movea.l    a4,a1
[00024736] 7004                      moveq.l    #4,d0
[00024738] 41eb 0b88                 lea.l      2952(a3),a0
[0002473c] 4eb9 0006 a068            jsr        Auo_boxed
[00024742] 224c                      movea.l    a4,a1
[00024744] 206a 008e                 movea.l    142(a2),a0
[00024748] 4eb9 0001 591a            jsr        set_ref
[0002474e] 224c                      movea.l    a4,a1
[00024750] 7004                      moveq.l    #4,d0
[00024752] 41eb 0be8                 lea.l      3048(a3),a0
[00024756] 4eb9 0006 a068            jsr        Auo_boxed
[0002475c] 224c                      movea.l    a4,a1
[0002475e] 206a 0092                 movea.l    146(a2),a0
[00024762] 4eb9 0001 591a            jsr        set_ref
[00024768] 224c                      movea.l    a4,a1
[0002476a] 7004                      moveq.l    #4,d0
[0002476c] 41eb 0c18                 lea.l      3096(a3),a0
[00024770] 4eb9 0006 a068            jsr        Auo_boxed
[00024776] 224c                      movea.l    a4,a1
[00024778] 206a 0096                 movea.l    150(a2),a0
[0002477c] 4eb9 0001 591a            jsr        set_ref
[00024782] 224c                      movea.l    a4,a1
[00024784] 7004                      moveq.l    #4,d0
[00024786] 41eb 0c48                 lea.l      3144(a3),a0
[0002478a] 4eb9 0006 a068            jsr        Auo_boxed
[00024790] 202a 009e                 move.l     158(a2),d0
[00024794] 6716                      beq.s      $000247AC
[00024796] 2f40 0030                 move.l     d0,48(a7)
[0002479a] 2040                      movea.l    d0,a0
[0002479c] 2268 0004                 movea.l    4(a0),a1
[000247a0] 204b                      movea.l    a3,a0
[000247a2] 7043                      moveq.l    #67,d0
[000247a4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000247aa] 6010                      bra.s      $000247BC
[000247ac] 43f9 000b 7a96            lea.l      $000B7A96,a1
[000247b2] 7043                      moveq.l    #67,d0
[000247b4] 204b                      movea.l    a3,a0
[000247b6] 4eb9 0005 0fd8            jsr        Aob_puttext
[000247bc] 202a 009a                 move.l     154(a2),d0
[000247c0] 6716                      beq.s      $000247D8
[000247c2] 2f40 0030                 move.l     d0,48(a7)
[000247c6] 2040                      movea.l    d0,a0
[000247c8] 2268 0004                 movea.l    4(a0),a1
[000247cc] 204b                      movea.l    a3,a0
[000247ce] 7042                      moveq.l    #66,d0
[000247d0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000247d6] 6010                      bra.s      $000247E8
[000247d8] 43f9 000b 7a96            lea.l      $000B7A96,a1
[000247de] 7042                      moveq.l    #66,d0
[000247e0] 204b                      movea.l    a3,a0
[000247e2] 4eb9 0005 0fd8            jsr        Aob_puttext
[000247e8] 4fef 003e                 lea.l      62(a7),a7
[000247ec] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000247f0] 4e75                      rts
live_snap:
[000247f2] 2f03                      move.l     d3,-(a7)
[000247f4] 5d4f                      subq.w     #6,a7
[000247f6] 3200                      move.w     d0,d1
[000247f8] b27c 0006                 cmp.w      #$0006,d1
[000247fc] 6232                      bhi.s      $00024830
[000247fe] d241                      add.w      d1,d1
[00024800] 323b 1006                 move.w     $00024808(pc,d1.w),d1
[00024804] 4efb 1002                 jmp        $00024808(pc,d1.w)
J9:
[00024808] 000e                      dc.w $000e   ; $00024816-$00024808
[0002480a] 0012                      dc.w $0012   ; $0002481a-$00024808
[0002480c] 0016                      dc.w $0016   ; $0002481e-$00024808
[0002480e] 001a                      dc.w $001a   ; $00024822-$00024808
[00024810] 001e                      dc.w $001e   ; $00024826-$00024808
[00024812] 0022                      dc.w $0022   ; $0002482a-$00024808
[00024814] 0026                      dc.w $0026   ; $0002482e-$00024808
[00024816] 7601                      moveq.l    #1,d3
[00024818] 6016                      bra.s      $00024830
[0002481a] 7602                      moveq.l    #2,d3
[0002481c] 6012                      bra.s      $00024830
[0002481e] 7604                      moveq.l    #4,d3
[00024820] 600e                      bra.s      $00024830
[00024822] 7608                      moveq.l    #8,d3
[00024824] 600a                      bra.s      $00024830
[00024826] 7610                      moveq.l    #16,d3
[00024828] 6006                      bra.s      $00024830
[0002482a] 7620                      moveq.l    #32,d3
[0002482c] 6002                      bra.s      $00024830
[0002482e] 7640                      moveq.l    #64,d3
[00024830] 720a                      moveq.l    #10,d1
[00024832] 41d7                      lea.l      (a7),a0
[00024834] 3003                      move.w     d3,d0
[00024836] 4eb9 0008 2dc0            jsr        itoa
[0002483c] 5c4f                      addq.w     #6,a7
[0002483e] 261f                      move.l     (a7)+,d3
[00024840] 4e75                      rts
term:
[00024842] 2f0a                      move.l     a2,-(a7)
[00024844] 2f0b                      move.l     a3,-(a7)
[00024846] 2448                      movea.l    a0,a2
[00024848] 2650                      movea.l    (a0),a3
[0002484a] 226b 0004                 movea.l    4(a3),a1
[0002484e] 42a9 0012                 clr.l      18(a1)
[00024852] 302a 0056                 move.w     86(a2),d0
[00024856] c07c 0800                 and.w      #$0800,d0
[0002485a] 6716                      beq.s      $00024872
[0002485c] 43ea 002c                 lea.l      44(a2),a1
[00024860] 206b 0004                 movea.l    4(a3),a0
[00024864] 41e8 003a                 lea.l      58(a0),a0
[00024868] 7008                      moveq.l    #8,d0
[0002486a] 4eb9 0008 3500            jsr        memcpy
[00024870] 6014                      bra.s      $00024886
[00024872] 7008                      moveq.l    #8,d0
[00024874] 43ea 0024                 lea.l      36(a2),a1
[00024878] 206b 0004                 movea.l    4(a3),a0
[0002487c] 41e8 003a                 lea.l      58(a0),a0
[00024880] 4eb9 0008 3500            jsr        memcpy
[00024886] 204b                      movea.l    a3,a0
[00024888] 4eb9 0004 c7c8            jsr        Ax_free
[0002488e] 204a                      movea.l    a2,a0
[00024890] 4eb9 0005 85f2            jsr        Awi_delete
[00024896] 265f                      movea.l    (a7)+,a3
[00024898] 245f                      movea.l    (a7)+,a2
[0002489a] 4e75                      rts
