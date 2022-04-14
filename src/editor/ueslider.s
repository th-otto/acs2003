init_slider:
[000274ea] 2f0a                      move.l     a2,-(a7)
[000274ec] 2f0b                      move.l     a3,-(a7)
[000274ee] 2448                      movea.l    a0,a2
[000274f0] 43f9 000b d714            lea.l      data,a1
[000274f6] 303c 2329                 move.w     #$2329,d0
[000274fa] 266a 0004                 movea.l    4(a2),a3
[000274fe] 4e93                      jsr        (a3)
[00027500] 265f                      movea.l    (a7)+,a3
[00027502] 245f                      movea.l    (a7)+,a2
[00027504] 4e75                      rts
minsize:
[00027506] 2f0a                      move.l     a2,-(a7)
[00027508] 2f0b                      move.l     a3,-(a7)
[0002750a] 266f 000c                 movea.l    12(a7),a3
[0002750e] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00027514] 7001                      moveq.l    #1,d0
[00027516] c0a8 0004                 and.l      4(a0),d0
[0002751a] 6716                      beq.s      $00027532
[0002751c] 2052                      movea.l    (a2),a0
[0002751e] 3228 0012                 move.w     18(a0),d1
[00027522] d241                      add.w      d1,d1
[00027524] 3281                      move.w     d1,(a1)
[00027526] 2052                      movea.l    (a2),a0
[00027528] 3028 0014                 move.w     20(a0),d0
[0002752c] e548                      lsl.w      #2,d0
[0002752e] 3680                      move.w     d0,(a3)
[00027530] 6014                      bra.s      $00027546
[00027532] 2052                      movea.l    (a2),a0
[00027534] 3228 0012                 move.w     18(a0),d1
[00027538] 3001                      move.w     d1,d0
[0002753a] e748                      lsl.w      #3,d0
[0002753c] 9041                      sub.w      d1,d0
[0002753e] 3280                      move.w     d0,(a1)
[00027540] 2052                      movea.l    (a2),a0
[00027542] 36a8 0014                 move.w     20(a0),(a3)
[00027546] 265f                      movea.l    (a7)+,a3
[00027548] 245f                      movea.l    (a7)+,a2
[0002754a] 4e75                      rts
object_tree:
[0002754c] 48e7 003e                 movem.l    a2-a6,-(a7)
[00027550] 594f                      subq.w     #4,a7
[00027552] 2648                      movea.l    a0,a3
[00027554] 2a49                      movea.l    a1,a5
[00027556] 41f9 000b d486            lea.l      ED_SLIDER,a0
[0002755c] 4eb9 0004 f064            jsr        Aob_create
[00027562] 2448                      movea.l    a0,a2
[00027564] 200a                      move.l     a2,d0
[00027566] 6700 0146                 beq        $000276AE
[0002756a] 4eb9 0004 fbdc            jsr        Aob_fix
[00027570] 7002                      moveq.l    #2,d0
[00027572] 224a                      movea.l    a2,a1
[00027574] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002757a] 2068 0258                 movea.l    600(a0),a0
[0002757e] 4eb9 0003 0b9a            jsr        oe_beself
[00027584] 700e                      moveq.l    #14,d0
[00027586] 224a                      movea.l    a2,a1
[00027588] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002758e] 2068 0258                 movea.l    600(a0),a0
[00027592] 4eb9 0003 0b9a            jsr        oe_beself
[00027598] 7010                      moveq.l    #16,d0
[0002759a] 224a                      movea.l    a2,a1
[0002759c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000275a2] 2068 0258                 movea.l    600(a0),a0
[000275a6] 4eb9 0003 0b9a            jsr        oe_beself
[000275ac] 49ea 0030                 lea.l      48(a2),a4
[000275b0] 7016                      moveq.l    #22,d0
[000275b2] c06d 0008                 and.w      8(a5),d0
[000275b6] 816c 0008                 or.w       d0,8(a4)
[000275ba] 703f                      moveq.l    #63,d0
[000275bc] c06d 000a                 and.w      10(a5),d0
[000275c0] 816c 000a                 or.w       d0,10(a4)
[000275c4] 2a6c 000c                 movea.l    12(a4),a5
[000275c8] 4857                      pea.l      (a7)
[000275ca] 43f9 000b d774            lea.l      $000BD774,a1
[000275d0] 2053                      movea.l    (a3),a0
[000275d2] 4eb9 0008 1b26            jsr        sscanf
[000275d8] 584f                      addq.w     #4,a7
[000275da] 2b57 0004                 move.l     (a7),4(a5)
[000275de] 7001                      moveq.l    #1,d0
[000275e0] c097                      and.l      (a7),d0
[000275e2] 671c                      beq.s      $00027600
[000275e4] 4dea 01b0                 lea.l      432(a2),a6
[000275e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000275ee] 3228 0012                 move.w     18(a0),d1
[000275f2] d241                      add.w      d1,d1
[000275f4] 3941 0014                 move.w     d1,20(a4)
[000275f8] 396e 0016 0016            move.w     22(a6),22(a4)
[000275fe] 6016                      bra.s      $00027616
[00027600] 4dea 01e0                 lea.l      480(a2),a6
[00027604] 396e 0014 0014            move.w     20(a6),20(a4)
[0002760a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027610] 3968 0014 0016            move.w     20(a0),22(a4)
[00027616] 7002                      moveq.l    #2,d0
[00027618] c097                      and.l      (a7),d0
[0002761a] 6708                      beq.s      $00027624
[0002761c] 006a 0001 00e2            ori.w      #$0001,226(a2)
[00027622] 6006                      bra.s      $0002762A
[00027624] 026a fffe 00e2            andi.w     #$FFFE,226(a2)
[0002762a] 7004                      moveq.l    #4,d0
[0002762c] c097                      and.l      (a7),d0
[0002762e] 6708                      beq.s      $00027638
[00027630] 026a fffe 0112            andi.w     #$FFFE,274(a2)
[00027636] 6006                      bra.s      $0002763E
[00027638] 006a 0001 0112            ori.w      #$0001,274(a2)
[0002763e] 206a 015c                 movea.l    348(a2),a0
[00027642] 2b68 000c 0018            move.l     12(a0),24(a5)
[00027648] 206b 0026                 movea.l    38(a3),a0
[0002764c] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00027652] 4a40                      tst.w      d0
[00027654] 6712                      beq.s      $00027668
[00027656] 43f9 000b d768            lea.l      $000BD768,a1
[0002765c] 700e                      moveq.l    #14,d0
[0002765e] 204a                      movea.l    a2,a0
[00027660] 4eb9 0005 0fd8            jsr        Aob_puttext
[00027666] 600e                      bra.s      $00027676
[00027668] 226b 0026                 movea.l    38(a3),a1
[0002766c] 700e                      moveq.l    #14,d0
[0002766e] 204a                      movea.l    a2,a0
[00027670] 4eb9 0005 0fd8            jsr        Aob_puttext
[00027676] 206a 018c                 movea.l    396(a2),a0
[0002767a] 2b68 000c 001c            move.l     12(a0),28(a5)
[00027680] 206b 002a                 movea.l    42(a3),a0
[00027684] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002768a] 4a40                      tst.w      d0
[0002768c] 6712                      beq.s      $000276A0
[0002768e] 43f9 000b d768            lea.l      $000BD768,a1
[00027694] 7010                      moveq.l    #16,d0
[00027696] 204a                      movea.l    a2,a0
[00027698] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002769e] 600e                      bra.s      $000276AE
[000276a0] 226b 002a                 movea.l    42(a3),a1
[000276a4] 7010                      moveq.l    #16,d0
[000276a6] 204a                      movea.l    a2,a0
[000276a8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000276ae] 204a                      movea.l    a2,a0
[000276b0] 584f                      addq.w     #4,a7
[000276b2] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[000276b6] 4e75                      rts
test_it:
[000276b8] 2f0a                      move.l     a2,-(a7)
[000276ba] 2f0b                      move.l     a3,-(a7)
[000276bc] 2648                      movea.l    a0,a3
[000276be] 2449                      movea.l    a1,a2
[000276c0] 22bc 0003 6928            move.l     #A_slider,(a1)
[000276c6] 486a 0004                 pea.l      4(a2)
[000276ca] 43f9 000b d774            lea.l      $000BD774,a1
[000276d0] 2050                      movea.l    (a0),a0
[000276d2] 4eb9 0008 1b26            jsr        sscanf
[000276d8] 584f                      addq.w     #4,a7
[000276da] 257c 0003 71ba 0008       move.l     #Auo_slider,8(a2)
[000276e2] 7000                      moveq.l    #0,d0
[000276e4] 2540 0014                 move.l     d0,20(a2)
[000276e8] 2540 0010                 move.l     d0,16(a2)
[000276ec] 2540 000c                 move.l     d0,12(a2)
[000276f0] 206b 0026                 movea.l    38(a3),a0
[000276f4] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000276fa] 4a40                      tst.w      d0
[000276fc] 6704                      beq.s      $00027702
[000276fe] 91c8                      suba.l     a0,a0
[00027700] 6004                      bra.s      $00027706
[00027702] 206b 0026                 movea.l    38(a3),a0
[00027706] 2548 0018                 move.l     a0,24(a2)
[0002770a] 206b 002a                 movea.l    42(a3),a0
[0002770e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00027714] 4a40                      tst.w      d0
[00027716] 6704                      beq.s      $0002771C
[00027718] 91c8                      suba.l     a0,a0
[0002771a] 6004                      bra.s      $00027720
[0002771c] 206b 002a                 movea.l    42(a3),a0
[00027720] 2548 001c                 move.l     a0,28(a2)
[00027724] 265f                      movea.l    (a7)+,a3
[00027726] 245f                      movea.l    (a7)+,a2
[00027728] 4e75                      rts
abort:
[0002772a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027730] 2268 0258                 movea.l    600(a0),a1
[00027734] 2069 0014                 movea.l    20(a1),a0
[00027738] 2068 003c                 movea.l    60(a0),a0
[0002773c] 42a8 0018                 clr.l      24(a0)
[00027740] 42a8 001c                 clr.l      28(a0)
[00027744] 2079 000b d754            movea.l    $000BD754,a0
[0002774a] 2050                      movea.l    (a0),a0
[0002774c] 4e90                      jsr        (a0)
[0002774e] 4e75                      rts
ok:
[00027750] 48e7 0038                 movem.l    a2-a4,-(a7)
[00027754] 4fef ffce                 lea.l      -50(a7),a7
[00027758] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002775e] 2268 0258                 movea.l    600(a0),a1
[00027762] 2469 0014                 movea.l    20(a1),a2
[00027766] 286a 003c                 movea.l    60(a2),a4
[0002776a] 4857                      pea.l      (a7)
[0002776c] 43ef 0006                 lea.l      6(a7),a1
[00027770] 204c                      movea.l    a4,a0
[00027772] 6100 fd92                 bsr        minsize
[00027776] 584f                      addq.w     #4,a7
[00027778] 47f9 0010 c43e            lea.l      parm,a3
[0002777e] 2f2c 0004                 move.l     4(a4),-(a7)
[00027782] 43f9 000b d774            lea.l      $000BD774,a1
[00027788] 204b                      movea.l    a3,a0
[0002778a] 4eb9 0008 15ac            jsr        sprintf
[00027790] 584f                      addq.w     #4,a7
[00027792] 49ef 0004                 lea.l      4(a7),a4
[00027796] 288b                      move.l     a3,(a4)
[00027798] 297c 000b d769 0004       move.l     #$000BD769,4(a4)
[000277a0] 4240                      clr.w      d0
[000277a2] 3940 001c                 move.w     d0,28(a4)
[000277a6] 3940 0012                 move.w     d0,18(a4)
[000277aa] 3940 0008                 move.w     d0,8(a4)
[000277ae] 7200                      moveq.l    #0,d1
[000277b0] 2941 001e                 move.l     d1,30(a4)
[000277b4] 2941 0014                 move.l     d1,20(a4)
[000277b8] 2941 000a                 move.l     d1,10(a4)
[000277bc] 7000                      moveq.l    #0,d0
[000277be] 2940 0022                 move.l     d0,34(a4)
[000277c2] 2940 0018                 move.l     d0,24(a4)
[000277c6] 2940 000e                 move.l     d0,14(a4)
[000277ca] 42ac 0026                 clr.l      38(a4)
[000277ce] 42ac 002a                 clr.l      42(a4)
[000277d2] 43ec 0026                 lea.l      38(a4),a1
[000277d6] 7003                      moveq.l    #3,d0
[000277d8] 41ea 0150                 lea.l      336(a2),a0
[000277dc] 4eb9 0006 a068            jsr        Auo_boxed
[000277e2] 206c 0026                 movea.l    38(a4),a0
[000277e6] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000277ec] 4a40                      tst.w      d0
[000277ee] 6704                      beq.s      $000277F4
[000277f0] 42ac 0026                 clr.l      38(a4)
[000277f4] 43ec 002a                 lea.l      42(a4),a1
[000277f8] 7003                      moveq.l    #3,d0
[000277fa] 41ea 0180                 lea.l      384(a2),a0
[000277fe] 4eb9 0006 a068            jsr        Auo_boxed
[00027804] 206c 002a                 movea.l    42(a4),a0
[00027808] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002780e] 4a40                      tst.w      d0
[00027810] 6704                      beq.s      $00027816
[00027812] 42ac 002a                 clr.l      42(a4)
[00027816] 3217                      move.w     (a7),d1
[00027818] 302f 0002                 move.w     2(a7),d0
[0002781c] 204c                      movea.l    a4,a0
[0002781e] 2279 000b d754            movea.l    $000BD754,a1
[00027824] 2269 0004                 movea.l    4(a1),a1
[00027828] 4e91                      jsr        (a1)
[0002782a] 6100 fefe                 bsr        abort
[0002782e] 4fef 0032                 lea.l      50(a7),a7
[00027832] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00027836] 4e75                      rts
horizontal:
[00027838] 2f0a                      move.l     a2,-(a7)
[0002783a] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00027840] 2052                      movea.l    (a2),a0
[00027842] 2068 025c                 movea.l    604(a0),a0
[00027846] 41e8 0030                 lea.l      48(a0),a0
[0002784a] 2268 000c                 movea.l    12(a0),a1
[0002784e] 7001                      moveq.l    #1,d0
[00027850] c0a9 0004                 and.l      4(a1),d0
[00027854] 6736                      beq.s      $0002788C
[00027856] 02a9 ffff fffe 0004       andi.l     #$FFFFFFFE,4(a1)
[0002785e] 2252                      movea.l    (a2),a1
[00027860] 2269 025c                 movea.l    604(a1),a1
[00027864] 43e9 01e0                 lea.l      480(a1),a1
[00027868] 3169 0014 0014            move.w     20(a1),20(a0)
[0002786e] 2252                      movea.l    (a2),a1
[00027870] 3169 0014 0016            move.w     20(a1),22(a0)
[00027876] 72ff                      moveq.l    #-1,d1
[00027878] 7001                      moveq.l    #1,d0
[0002787a] 2052                      movea.l    (a2),a0
[0002787c] 2068 0258                 movea.l    600(a0),a0
[00027880] 2252                      movea.l    (a2),a1
[00027882] 2269 0258                 movea.l    600(a1),a1
[00027886] 2269 0066                 movea.l    102(a1),a1
[0002788a] 4e91                      jsr        (a1)
[0002788c] 245f                      movea.l    (a7)+,a2
[0002788e] 4e75                      rts
vertical:
[00027890] 2f0a                      move.l     a2,-(a7)
[00027892] 2f0b                      move.l     a3,-(a7)
[00027894] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002789a] 2052                      movea.l    (a2),a0
[0002789c] 2068 025c                 movea.l    604(a0),a0
[000278a0] 41e8 0030                 lea.l      48(a0),a0
[000278a4] 2252                      movea.l    (a2),a1
[000278a6] 2269 025c                 movea.l    604(a1),a1
[000278aa] 43e9 01b0                 lea.l      432(a1),a1
[000278ae] 2668 000c                 movea.l    12(a0),a3
[000278b2] 7001                      moveq.l    #1,d0
[000278b4] c0ab 0004                 and.l      4(a3),d0
[000278b8] 6630                      bne.s      $000278EA
[000278ba] 00ab 0000 0001 0004       ori.l      #$00000001,4(a3)
[000278c2] 2652                      movea.l    (a2),a3
[000278c4] 302b 0012                 move.w     18(a3),d0
[000278c8] d040                      add.w      d0,d0
[000278ca] 3140 0014                 move.w     d0,20(a0)
[000278ce] 3169 0016 0016            move.w     22(a1),22(a0)
[000278d4] 72ff                      moveq.l    #-1,d1
[000278d6] 7001                      moveq.l    #1,d0
[000278d8] 2052                      movea.l    (a2),a0
[000278da] 2068 0258                 movea.l    600(a0),a0
[000278de] 2252                      movea.l    (a2),a1
[000278e0] 2669 0258                 movea.l    600(a1),a3
[000278e4] 226b 0066                 movea.l    102(a3),a1
[000278e8] 4e91                      jsr        (a1)
[000278ea] 265f                      movea.l    (a7)+,a3
[000278ec] 245f                      movea.l    (a7)+,a2
[000278ee] 4e75                      rts
edsl_3d:
[000278f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000278f6] 2268 025c                 movea.l    604(a0),a1
[000278fa] 2069 003c                 movea.l    60(a1),a0
[000278fe] 0aa8 0000 0002 0004       eori.l     #$00000002,4(a0)
[00027906] 72ff                      moveq.l    #-1,d1
[00027908] 7001                      moveq.l    #1,d0
[0002790a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027910] 2068 0258                 movea.l    600(a0),a0
[00027914] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002791a] 2269 0258                 movea.l    600(a1),a1
[0002791e] 2269 0066                 movea.l    102(a1),a1
[00027922] 4e91                      jsr        (a1)
[00027924] 4e75                      rts
edsl_slider:
[00027926] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002792c] 2268 025c                 movea.l    604(a0),a1
[00027930] 2069 003c                 movea.l    60(a1),a0
[00027934] 0aa8 0000 0004 0004       eori.l     #$00000004,4(a0)
[0002793c] 72ff                      moveq.l    #-1,d1
[0002793e] 7001                      moveq.l    #1,d0
[00027940] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027946] 2068 0258                 movea.l    600(a0),a0
[0002794a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00027950] 2269 0258                 movea.l    600(a1),a1
[00027954] 2269 0066                 movea.l    102(a1),a1
[00027958] 4e91                      jsr        (a1)
[0002795a] 4e75                      rts
