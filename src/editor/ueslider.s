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
[0002751a] 6716                      beq.s      minsize_1
[0002751c] 2052                      movea.l    (a2),a0
[0002751e] 3228 0012                 move.w     18(a0),d1
[00027522] d241                      add.w      d1,d1
[00027524] 3281                      move.w     d1,(a1)
[00027526] 2052                      movea.l    (a2),a0
[00027528] 3028 0014                 move.w     20(a0),d0
[0002752c] e548                      lsl.w      #2,d0
[0002752e] 3680                      move.w     d0,(a3)
[00027530] 6014                      bra.s      minsize_2
minsize_1:
[00027532] 2052                      movea.l    (a2),a0
[00027534] 3228 0012                 move.w     18(a0),d1
[00027538] 3001                      move.w     d1,d0
[0002753a] e748                      lsl.w      #3,d0
[0002753c] 9041                      sub.w      d1,d0
[0002753e] 3280                      move.w     d0,(a1)
[00027540] 2052                      movea.l    (a2),a0
[00027542] 36a8 0014                 move.w     20(a0),(a3)
minsize_2:
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
[00027566] 6700 0146                 beq        object_tree_1
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
[000275e2] 671c                      beq.s      object_tree_2
[000275e4] 4dea 01b0                 lea.l      432(a2),a6
[000275e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000275ee] 3228 0012                 move.w     18(a0),d1
[000275f2] d241                      add.w      d1,d1
[000275f4] 3941 0014                 move.w     d1,20(a4)
[000275f8] 396e 0016 0016            move.w     22(a6),22(a4)
[000275fe] 6016                      bra.s      object_tree_3
object_tree_2:
[00027600] 4dea 01e0                 lea.l      480(a2),a6
[00027604] 396e 0014 0014            move.w     20(a6),20(a4)
[0002760a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027610] 3968 0014 0016            move.w     20(a0),22(a4)
object_tree_3:
[00027616] 7002                      moveq.l    #2,d0
[00027618] c097                      and.l      (a7),d0
[0002761a] 6708                      beq.s      object_tree_4
[0002761c] 006a 0001 00e2            ori.w      #$0001,226(a2)
[00027622] 6006                      bra.s      object_tree_5
object_tree_4:
[00027624] 026a fffe 00e2            andi.w     #$FFFE,226(a2)
object_tree_5:
[0002762a] 7004                      moveq.l    #4,d0
[0002762c] c097                      and.l      (a7),d0
[0002762e] 6708                      beq.s      object_tree_6
[00027630] 026a fffe 0112            andi.w     #$FFFE,274(a2)
[00027636] 6006                      bra.s      object_tree_7
object_tree_6:
[00027638] 006a 0001 0112            ori.w      #$0001,274(a2)
object_tree_7:
[0002763e] 206a 015c                 movea.l    348(a2),a0
[00027642] 2b68 000c 0018            move.l     12(a0),24(a5)
[00027648] 206b 0026                 movea.l    38(a3),a0
[0002764c] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00027652] 4a40                      tst.w      d0
[00027654] 6712                      beq.s      object_tree_8
[00027656] 43f9 000b d768            lea.l      $000BD768,a1
[0002765c] 700e                      moveq.l    #14,d0
[0002765e] 204a                      movea.l    a2,a0
[00027660] 4eb9 0005 0fd8            jsr        Aob_puttext
[00027666] 600e                      bra.s      object_tree_9
object_tree_8:
[00027668] 226b 0026                 movea.l    38(a3),a1
[0002766c] 700e                      moveq.l    #14,d0
[0002766e] 204a                      movea.l    a2,a0
[00027670] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_9:
[00027676] 206a 018c                 movea.l    396(a2),a0
[0002767a] 2b68 000c 001c            move.l     12(a0),28(a5)
[00027680] 206b 002a                 movea.l    42(a3),a0
[00027684] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002768a] 4a40                      tst.w      d0
[0002768c] 6712                      beq.s      object_tree_10
[0002768e] 43f9 000b d768            lea.l      $000BD768,a1
[00027694] 7010                      moveq.l    #16,d0
[00027696] 204a                      movea.l    a2,a0
[00027698] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002769e] 600e                      bra.s      object_tree_1
object_tree_10:
[000276a0] 226b 002a                 movea.l    42(a3),a1
[000276a4] 7010                      moveq.l    #16,d0
[000276a6] 204a                      movea.l    a2,a0
[000276a8] 4eb9 0005 0fd8            jsr        Aob_puttext
object_tree_1:
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
[000276fc] 6704                      beq.s      test_it_1
[000276fe] 91c8                      suba.l     a0,a0
[00027700] 6004                      bra.s      test_it_2
test_it_1:
[00027702] 206b 0026                 movea.l    38(a3),a0
test_it_2:
[00027706] 2548 0018                 move.l     a0,24(a2)
[0002770a] 206b 002a                 movea.l    42(a3),a0
[0002770e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00027714] 4a40                      tst.w      d0
[00027716] 6704                      beq.s      test_it_3
[00027718] 91c8                      suba.l     a0,a0
[0002771a] 6004                      bra.s      test_it_4
test_it_3:
[0002771c] 206b 002a                 movea.l    42(a3),a0
test_it_4:
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
[000277ee] 6704                      beq.s      ok_1
[000277f0] 42ac 0026                 clr.l      38(a4)
ok_1:
[000277f4] 43ec 002a                 lea.l      42(a4),a1
[000277f8] 7003                      moveq.l    #3,d0
[000277fa] 41ea 0180                 lea.l      384(a2),a0
[000277fe] 4eb9 0006 a068            jsr        Auo_boxed
[00027804] 206c 002a                 movea.l    42(a4),a0
[00027808] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002780e] 4a40                      tst.w      d0
[00027810] 6704                      beq.s      ok_2
[00027812] 42ac 002a                 clr.l      42(a4)
ok_2:
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
[00027854] 6736                      beq.s      horizontal_1
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
horizontal_1:
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
[000278b8] 6630                      bne.s      vertical_1
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
vertical_1:
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

	.data

BUBBLE_01:
[000bd038]                           dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
[000bd084]                           dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
[000bd0cf]                           dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_04:
[000bd121]                           dc.b 'Hiermit wird der 3D-Modus fÅr den Slider ein- und ausgeschaltet',0
BUBBLE_05:
[000bd161]                           dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
BUBBLE_06:
[000bd1e5]                           dc.b 'Hier wird angegeben, ob der Schieber in der Mitte vorhanden sein soll oder nicht.',0
BUBBLE_07:
[000bd237]                           dc.b 'Der Slider wird als horizontaler Slider verwendet.',0
BUBBLE_08:
[000bd26a]                           dc.b 'Der Slider wird als vertikaler Slider verwendet.',0
TEXT_005:
[000bd29b]                           dc.b $4f
[000bd29c]                           dc.w $4b00
TEXT_009:
[000bd29e]                           dc.b 'Abbruch',0
TEXT_01:
[000bd2a6]                           dc.b '3D-Modus',0
TEXT_02:
[000bd2af]                           dc.b 'Orientierung',0
TEXT_04:
[000bd2bc]                           dc.b 'Slider',0
TEXT_05:
[000bd2c3]                           dc.b 'Sonstiges',0
TEXT_06:
[000bd2cd]                           dc.b 'BubbleGEM-Text',0
TEXT_07:
[000bd2dc]                           dc.b 'Context-Popup',0
help_title:
[000bd2ea]                           dc.b 'Der Slider-Editor',0
title:
[000bd2fc]                           dc.b 'SLIDER -',0
[000bd305]                           dc.b $00
[000bd306] 00064a22                  dc.l A_3Dbutton
[000bd30a]                           dc.w $29f1
[000bd30c]                           dc.w $01f8
[000bd30e] 000630f2                  dc.l Auo_string
[000bd312]                           dc.w $0000
[000bd314]                           dc.w $0000
[000bd316]                           dc.w $0000
[000bd318]                           dc.w $0000
[000bd31a]                           dc.w $0000
[000bd31c]                           dc.w $0000
[000bd31e]                           dc.w $0000
[000bd320]                           dc.w $0000
[000bd322]                           dc.w $0000
[000bd324]                           dc.w $0000
A_3DBUTTON02:
[000bd326] 00064a22                  dc.l A_3Dbutton
[000bd32a]                           dc.w $21f1
[000bd32c]                           dc.w $01f8
[000bd32e] 000630f2                  dc.l Auo_string
[000bd332]                           dc.w $0000
[000bd334]                           dc.w $0000
[000bd336]                           dc.w $0000
[000bd338]                           dc.w $0000
[000bd33a]                           dc.w $0000
[000bd33c]                           dc.w $0000
[000bd33e]                           dc.w $0000
[000bd340]                           dc.w $0000
[000bd342]                           dc.w $0000
[000bd344]                           dc.w $0000
A_3DBUTTON03:
[000bd346] 00064a22                  dc.l A_3Dbutton
[000bd34a]                           dc.w $29c1
[000bd34c]                           dc.w $0178
[000bd34e] 000630f2                  dc.l Auo_string
[000bd352] 000bd29b                  dc.l TEXT_005
[000bd356]                           dc.w $0000
[000bd358]                           dc.w $0000
[000bd35a]                           dc.w $0000
[000bd35c]                           dc.w $0000
[000bd35e] 000bd038                  dc.l BUBBLE_01
[000bd362]                           dc.w $0000
[000bd364]                           dc.w $0000
A_3DBUTTON06:
[000bd366] 00064a22                  dc.l A_3Dbutton
[000bd36a]                           dc.w $29c1
[000bd36c]                           dc.w $0178
[000bd36e] 000630f2                  dc.l Auo_string
[000bd372] 000bd29e                  dc.l TEXT_009
[000bd376]                           dc.w $0000
[000bd378]                           dc.w $0000
[000bd37a]                           dc.w $0000
[000bd37c]                           dc.w $0000
[000bd37e] 000bd084                  dc.l BUBBLE_02
[000bd382]                           dc.w $0000
[000bd384]                           dc.w $0000
A_BOXED03:
[000bd386] 0006afea                  dc.l A_boxed
[000bd38a]                           dc.w $9038
[000bd38c]                           dc.w $ff12
[000bd38e] 0006a068                  dc.l Auo_boxed
[000bd392]                           dc.w $0000
[000bd394]                           dc.w $0000
[000bd396]                           dc.w $0000
[000bd398]                           dc.w $0000
[000bd39a]                           dc.w $0000
[000bd39c]                           dc.w $0000
[000bd39e] 000bd0cf                  dc.l BUBBLE_03
[000bd3a2]                           dc.w $0000
[000bd3a4]                           dc.w $0000
A_BOXED04:
[000bd3a6] 0006afea                  dc.l A_boxed
[000bd3aa]                           dc.w $9038
[000bd3ac]                           dc.w $ff12
[000bd3ae] 0006a068                  dc.l Auo_boxed
[000bd3b2]                           dc.w $0000
[000bd3b4]                           dc.w $0000
[000bd3b6]                           dc.w $0000
[000bd3b8]                           dc.w $0000
[000bd3ba]                           dc.w $0000
[000bd3bc]                           dc.w $0000
[000bd3be] 000bd161                  dc.l BUBBLE_05
[000bd3c2]                           dc.w $0000
[000bd3c4]                           dc.w $0000
A_CHECKBOX01:
[000bd3c6] 0006323e                  dc.l A_checkbox
[000bd3ca]                           dc.w $0000
[000bd3cc]                           dc.w $0001
[000bd3ce] 000630f2                  dc.l Auo_string
[000bd3d2] 000bd2a6                  dc.l TEXT_01
[000bd3d6]                           dc.w $0000
[000bd3d8]                           dc.w $0000
[000bd3da]                           dc.w $0000
[000bd3dc]                           dc.w $0000
[000bd3de] 000bd121                  dc.l BUBBLE_04
[000bd3e2]                           dc.w $0000
[000bd3e4]                           dc.w $0000
A_CHECKBOX03:
[000bd3e6] 0006323e                  dc.l A_checkbox
[000bd3ea]                           dc.w $0000
[000bd3ec]                           dc.w $0001
[000bd3ee] 000630f2                  dc.l Auo_string
[000bd3f2] 000bd2bc                  dc.l TEXT_04
[000bd3f6]                           dc.w $0000
[000bd3f8]                           dc.w $0000
[000bd3fa]                           dc.w $0000
[000bd3fc]                           dc.w $0000
[000bd3fe] 000bd1e5                  dc.l BUBBLE_06
[000bd402]                           dc.w $0000
[000bd404]                           dc.w $0000
A_INNERFRAME02:
[000bd406] 00064256                  dc.l A_innerframe
[000bd40a]                           dc.w $1800
[000bd40c]                           dc.w $8f19
[000bd40e] 000630f2                  dc.l Auo_string
[000bd412] 000bd2af                  dc.l TEXT_02
[000bd416]                           dc.w $0000
[000bd418]                           dc.w $0000
[000bd41a]                           dc.w $0000
[000bd41c]                           dc.w $0000
[000bd41e]                           dc.w $0000
[000bd420]                           dc.w $0000
[000bd422]                           dc.w $0000
[000bd424]                           dc.w $0000
A_INNERFRAME03:
[000bd426] 00064256                  dc.l A_innerframe
[000bd42a]                           dc.w $1800
[000bd42c]                           dc.w $8f19
[000bd42e] 000630f2                  dc.l Auo_string
[000bd432] 000bd2c3                  dc.l TEXT_05
[000bd436]                           dc.w $0000
[000bd438]                           dc.w $0000
[000bd43a]                           dc.w $0000
[000bd43c]                           dc.w $0000
[000bd43e]                           dc.w $0000
[000bd440]                           dc.w $0000
[000bd442]                           dc.w $0000
[000bd444]                           dc.w $0000
A_SLIDER01:
[000bd446] 00036928                  dc.l A_slider
[000bd44a]                           dc.w $0000
[000bd44c]                           dc.w $0002
[000bd44e] 000371ba                  dc.l Auo_slider
[000bd452]                           dc.w $0000
[000bd454]                           dc.w $0000
[000bd456]                           dc.w $0000
[000bd458]                           dc.w $0000
[000bd45a]                           dc.w $0000
[000bd45c]                           dc.w $0000
[000bd45e] 000bd237                  dc.l BUBBLE_07
[000bd462]                           dc.w $0000
[000bd464]                           dc.w $0000
A_SLIDER02:
[000bd466] 00036928                  dc.l A_slider
[000bd46a]                           dc.w $0000
[000bd46c]                           dc.w $0003
[000bd46e] 000371ba                  dc.l Auo_slider
[000bd472]                           dc.w $0000
[000bd474]                           dc.w $0000
[000bd476]                           dc.w $0000
[000bd478]                           dc.w $0000
[000bd47a]                           dc.w $0000
[000bd47c]                           dc.w $0000
[000bd47e] 000bd26a                  dc.l BUBBLE_08
[000bd482]                           dc.w $0000
[000bd484]                           dc.w $0000
ED_SLIDER:
[000bd486]                           dc.w $ffff
[000bd488]                           dc.w $0001
[000bd48a]                           dc.w $0011
[000bd48c]                           dc.w $0018
[000bd48e]                           dc.w $0040
[000bd490]                           dc.w $0010
[000bd492] 000bd326                  dc.l A_3DBUTTON02
[000bd496]                           dc.w $0000
[000bd498]                           dc.w $0000
[000bd49a]                           dc.w $0029
[000bd49c]                           dc.w $000d
_01_ED_SLIDER:
[000bd49e]                           dc.w $0004
[000bd4a0]                           dc.w $0002
[000bd4a2]                           dc.w $0002
[000bd4a4]                           dc.w $0018
[000bd4a6]                           dc.w $0000
[000bd4a8]                           dc.w $0010
[000bd4aa] 000bd306                  dc.l A_3DBUTTON01
[000bd4ae]                           dc.w $0000
[000bd4b0]                           dc.w $0000
[000bd4b2]                           dc.w $000c
[000bd4b4]                           dc.w $0006
_02_ED_SLIDER:
[000bd4b6]                           dc.w $0001
[000bd4b8]                           dc.w $ffff
[000bd4ba]                           dc.w $ffff
[000bd4bc]                           dc.w $0018
[000bd4be]                           dc.w $0040
[000bd4c0]                           dc.w $0000
[000bd4c2] 000bd446                  dc.l A_SLIDER01
[000bd4c6]                           dc.w $0001
[000bd4c8]                           dc.w $0001
[000bd4ca]                           dc.w $000a
[000bd4cc]                           dc.w $0001
_02aED_SLIDER:
[000bd4ce] 000375d6                  dc.l Aus_slider
[000bd4d2]                           dc.w $0000
[000bd4d4]                           dc.w $0000
[000bd4d6]                           dc.w $8000
[000bd4d8]                           dc.w $0000
[000bd4da]                           dc.w $0000
[000bd4dc]                           dc.w $0000
[000bd4de]                           dc.w $0000
[000bd4e0]                           dc.w $0000
[000bd4e2]                           dc.w $0000
[000bd4e4]                           dc.w $0000
_04_ED_SLIDER:
[000bd4e6]                           dc.w $0006
[000bd4e8]                           dc.w $ffff
[000bd4ea]                           dc.w $ffff
[000bd4ec]                           dc.w $0018
[000bd4ee]                           dc.w $4005
[000bd4f0]                           dc.w $0010
[000bd4f2] 000bd366                  dc.l A_3DBUTTON06
[000bd4f6]                           dc.w $001d
[000bd4f8]                           dc.w $0001
[000bd4fa]                           dc.w $000a
[000bd4fc]                           dc.w $0002
_04aED_SLIDER:
[000bd4fe] 0002772a                  dc.l abort
[000bd502]                           dc.w $0000
[000bd504]                           dc.w $0000
[000bd506]                           dc.w $8000
[000bd508]                           dc.w $8841
[000bd50a]                           dc.w $0000
[000bd50c]                           dc.w $0000
[000bd50e]                           dc.w $0000
[000bd510]                           dc.w $0000
[000bd512]                           dc.w $0000
[000bd514]                           dc.w $0000
_06_ED_SLIDER:
[000bd516]                           dc.w $0008
[000bd518]                           dc.w $ffff
[000bd51a]                           dc.w $ffff
[000bd51c]                           dc.w $0018
[000bd51e]                           dc.w $4007
[000bd520]                           dc.w $0010
[000bd522] 000bd346                  dc.l A_3DBUTTON03
[000bd526]                           dc.w $0012
[000bd528]                           dc.w $0001
[000bd52a]                           dc.w $000a
[000bd52c]                           dc.w $0002
_06aED_SLIDER:
[000bd52e] 00027750                  dc.l ok
[000bd532]                           dc.w $0000
[000bd534]                           dc.w $0000
[000bd536]                           dc.w $8000
[000bd538]                           dc.w $884f
[000bd53a]                           dc.w $0000
[000bd53c]                           dc.w $0000
[000bd53e]                           dc.w $0000
[000bd540]                           dc.w $0000
[000bd542]                           dc.w $0000
[000bd544]                           dc.w $0000
_08_ED_SLIDER:
[000bd546]                           dc.w $0011
[000bd548]                           dc.w $0009
[000bd54a]                           dc.w $0010
[000bd54c]                           dc.w $0018
[000bd54e]                           dc.w $0040
[000bd550]                           dc.w $0000
[000bd552] 000bd426                  dc.l A_INNERFRAME03
[000bd556]                           dc.w $0010
[000bd558]                           dc.w $0004
[000bd55a]                           dc.w $0018
[000bd55c]                           dc.w $0009
_09_ED_SLIDER:
[000bd55e]                           dc.w $000b
[000bd560]                           dc.w $ffff
[000bd562]                           dc.w $ffff
[000bd564]                           dc.w $0018
[000bd566]                           dc.w $0041
[000bd568]                           dc.w $0000
[000bd56a] 000bd3c6                  dc.l A_CHECKBOX01
[000bd56e]                           dc.w $0001
[000bd570]                           dc.w $0001
[000bd572]                           dc.w $000b
[000bd574]                           dc.w $0001
_09aED_SLIDER:
[000bd576] 000278f0                  dc.l edsl_3d
[000bd57a]                           dc.w $0000
[000bd57c]                           dc.w $0000
[000bd57e]                           dc.w $8000
[000bd580]                           dc.w $8844
[000bd582]                           dc.w $0000
[000bd584]                           dc.w $0000
[000bd586]                           dc.w $0000
[000bd588]                           dc.w $0000
[000bd58a]                           dc.w $0000
[000bd58c]                           dc.w $0000
_11_ED_SLIDER:
[000bd58e]                           dc.w $000d
[000bd590]                           dc.w $ffff
[000bd592]                           dc.w $ffff
[000bd594]                           dc.w $0018
[000bd596]                           dc.w $0041
[000bd598]                           dc.w $0000
[000bd59a] 000bd3e6                  dc.l A_CHECKBOX03
[000bd59e]                           dc.w $000e
[000bd5a0]                           dc.w $0001
[000bd5a2]                           dc.w $0009
[000bd5a4]                           dc.w $0001
_11aED_SLIDER:
[000bd5a6] 00027926                  dc.l edsl_slider
[000bd5aa]                           dc.w $0000
[000bd5ac]                           dc.w $0000
[000bd5ae]                           dc.w $8000
[000bd5b0]                           dc.w $8853
[000bd5b2]                           dc.w $0000
[000bd5b4]                           dc.w $0000
[000bd5b6]                           dc.w $0000
[000bd5b8]                           dc.w $0000
[000bd5ba]                           dc.w $0000
[000bd5bc]                           dc.w $0000
_13_ED_SLIDER:
[000bd5be]                           dc.w $000e
[000bd5c0]                           dc.w $ffff
[000bd5c2]                           dc.w $ffff
[000bd5c4]                           dc.w $001c
[000bd5c6]                           dc.w $0000
[000bd5c8]                           dc.w $0000
[000bd5ca] 000bd2cd                  dc.l TEXT_06
[000bd5ce]                           dc.w $0001
[000bd5d0]                           dc.w $0003
[000bd5d2]                           dc.w $000e
[000bd5d4]                           dc.w $0001
_14_ED_SLIDER:
[000bd5d6]                           dc.w $000f
[000bd5d8]                           dc.w $ffff
[000bd5da]                           dc.w $ffff
[000bd5dc]                           dc.w $0018
[000bd5de]                           dc.w $0008
[000bd5e0]                           dc.w $0010
[000bd5e2] 000bd386                  dc.l A_BOXED03
[000bd5e6]                           dc.w $0001
[000bd5e8]                           dc.w $0004
[000bd5ea]                           dc.w $0016
[000bd5ec]                           dc.w $0001
_15_ED_SLIDER:
[000bd5ee]                           dc.w $0010
[000bd5f0]                           dc.w $ffff
[000bd5f2]                           dc.w $ffff
[000bd5f4]                           dc.w $001c
[000bd5f6]                           dc.w $0000
[000bd5f8]                           dc.w $0000
[000bd5fa] 000bd2dc                  dc.l TEXT_07
[000bd5fe]                           dc.w $0001
[000bd600]                           dc.w $0006
[000bd602]                           dc.w $000d
[000bd604]                           dc.w $0001
_16_ED_SLIDER:
[000bd606]                           dc.w $0008
[000bd608]                           dc.w $ffff
[000bd60a]                           dc.w $ffff
[000bd60c]                           dc.w $0018
[000bd60e]                           dc.w $0008
[000bd610]                           dc.w $0010
[000bd612] 000bd3a6                  dc.l A_BOXED04
[000bd616]                           dc.w $0001
[000bd618]                           dc.w $0007
[000bd61a]                           dc.w $0016
[000bd61c]                           dc.w $0001
_17_ED_SLIDER:
[000bd61e]                           dc.w $0000
[000bd620]                           dc.w $0012
[000bd622]                           dc.w $0014
[000bd624]                           dc.w $0018
[000bd626]                           dc.w $0040
[000bd628]                           dc.w $0000
[000bd62a] 000bd406                  dc.l A_INNERFRAME02
[000bd62e]                           dc.w $0001
[000bd630]                           dc.w $0007
[000bd632]                           dc.w $000f
[000bd634]                           dc.w $0006
_18_ED_SLIDER:
[000bd636]                           dc.w $0014
[000bd638]                           dc.w $ffff
[000bd63a]                           dc.w $ffff
[000bd63c]                           dc.w $0018
[000bd63e]                           dc.w $0040
[000bd640]                           dc.w $0020
[000bd642] 000bd466                  dc.l A_SLIDER02
[000bd646]                           dc.w $0001
[000bd648]                           dc.w $0001
[000bd64a]                           dc.w $0002
[000bd64c]                           dc.w $0004
_18aED_SLIDER:
[000bd64e] 00027890                  dc.l vertical
[000bd652]                           dc.w $0000
[000bd654]                           dc.w $0000
[000bd656]                           dc.w $8000
[000bd658]                           dc.w $0000
[000bd65a]                           dc.w $0000
[000bd65c]                           dc.w $0000
[000bd65e]                           dc.w $0000
[000bd660]                           dc.w $0000
[000bd662]                           dc.w $0000
[000bd664]                           dc.w $0000
_20_ED_SLIDER:
[000bd666]                           dc.w $0011
[000bd668]                           dc.w $ffff
[000bd66a]                           dc.w $ffff
[000bd66c]                           dc.w $0018
[000bd66e]                           dc.w $0040
[000bd670]                           dc.w $0020
[000bd672] 000bd446                  dc.l A_SLIDER01
[000bd676]                           dc.w $0004
[000bd678]                           dc.w $0001
[000bd67a]                           dc.w $000a
[000bd67c]                           dc.w $0001
_20aED_SLIDER:
[000bd67e] 00027838                  dc.l horizontal
[000bd682]                           dc.w $0000
[000bd684]                           dc.w $0000
[000bd686]                           dc.w $8020
[000bd688]                           dc.w $0000
[000bd68a]                           dc.w $0000
[000bd68c]                           dc.w $0000
[000bd68e]                           dc.w $0000
[000bd690]                           dc.w $0000
[000bd692]                           dc.w $0000
[000bd694]                           dc.w $0000
slider:
[000bd696] 00036928                  dc.l A_slider
[000bd69a]                           dc.w $0000
[000bd69c]                           dc.w $0002
[000bd69e] 000371ba                  dc.l Auo_slider
[000bd6a2]                           dc.w $0000
[000bd6a4]                           dc.w $0000
[000bd6a6]                           dc.w $0000
[000bd6a8]                           dc.w $0000
[000bd6aa]                           dc.w $0000
[000bd6ac]                           dc.w $0000
[000bd6ae]                           dc.w $0000
[000bd6b0]                           dc.w $0000
[000bd6b2]                           dc.w $0000
[000bd6b4]                           dc.w $0000
visual:
[000bd6b6]                           dc.w $ffff
[000bd6b8]                           dc.w $ffff
[000bd6ba]                           dc.w $ffff
[000bd6bc]                           dc.w $0018
[000bd6be]                           dc.w $2001
[000bd6c0]                           dc.w $0000
[000bd6c2] 000bd696                  dc.l slider
[000bd6c6]                           dc.w $0000
[000bd6c8]                           dc.w $0000
[000bd6ca]                           dc.w $0007
[000bd6cc]                           dc.w $0001
logical:
[000bd6ce]                           dc.w $ffff
[000bd6d0]                           dc.w $ffff
[000bd6d2]                           dc.w $ffff
[000bd6d4]                           dc.w $0018
[000bd6d6]                           dc.w $0040
[000bd6d8]                           dc.w $0000
[000bd6da] 000bd696                  dc.l slider
[000bd6de]                           dc.w $0000
[000bd6e0]                           dc.w $0000
[000bd6e2]                           dc.w $0007
[000bd6e4]                           dc.w $0001
aud:
[000bd6e6] 000bd764                  dc.l $000bd764
[000bd6ea] 000bd769                  dc.l $000bd769
[000bd6ee]                           dc.w $0000
[000bd6f0]                           dc.w $0000
[000bd6f2]                           dc.w $0000
[000bd6f4]                           dc.w $0000
[000bd6f6]                           dc.w $0000
[000bd6f8]                           dc.w $0000
[000bd6fa]                           dc.w $0000
[000bd6fc]                           dc.w $0000
[000bd6fe]                           dc.w $0000
[000bd700]                           dc.w $0000
[000bd702]                           dc.w $0000
[000bd704]                           dc.w $0000
[000bd706]                           dc.w $0000
[000bd708]                           dc.w $0000
[000bd70a]                           dc.w $0000
[000bd70c]                           dc.w $0000
[000bd70e]                           dc.w $0000
[000bd710]                           dc.w $0000
[000bd712]                           dc.w $0000
data:
[000bd714]                           dc.b 'A_slider',0
[000bd71d]                           dc.b $00
[000bd71e]                           dc.w $0000
[000bd720]                           dc.w $0000
[000bd722]                           dc.w $0000
[000bd724]                           dc.w $0000
[000bd726]                           dc.w $0000
[000bd728]                           dc.w $0000
[000bd72a]                           dc.w $0000
[000bd72c]                           dc.w $0000
[000bd72e]                           dc.w $0000
[000bd730]                           dc.w $0000
[000bd732]                           dc.w $0000
[000bd734] 0002754c                  dc.l object_tree
[000bd738] 000276b8                  dc.l test_it
[000bd73c] 00027750                  dc.l ok
[000bd740] 0004f20a                  dc.l Aob_delete
[000bd744] 000bd6b6                  dc.l visual
[000bd748] 000bd6ce                  dc.l logical
[000bd74c] 000bd6e6                  dc.l aud
[000bd750] 00027506                  dc.l minsize
[000bd754]                           dc.w $0000
[000bd756]                           dc.w $0000
[000bd758] 000bd2fc                  dc.l title
[000bd75c] 000bd2ea                  dc.l help_title
[000bd760]                           dc.w $0000
[000bd762]                           dc.w $0000
[000bd764]                           dc.b '0x2L',0
[000bd769]                           dc.b 'Auo_slider',0
[000bd774]                           dc.b '0x%lxL',0
[000bd77b]                           dc.b $00
