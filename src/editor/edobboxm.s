edbo_framecol:
[00031060] 2f03                      move.l     d3,-(a7)
[00031062] 702b                      moveq.l    #43,d0
[00031064] 3f00                      move.w     d0,-(a7)
[00031066] 742c                      moveq.l    #44,d2
[00031068] 7229                      moveq.l    #41,d1
[0003106a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031070] 2268 025c                 movea.l    604(a0),a1
[00031074] 3029 003e                 move.w     62(a1),d0
[00031078] 760c                      moveq.l    #12,d3
[0003107a] e668                      lsr.w      d3,d0
[0003107c] c07c 000f                 and.w      #$000F,d0
[00031080] 4eb9 0003 0bde            jsr        oe_colsel
[00031086] 544f                      addq.w     #2,a7
[00031088] 3600                      move.w     d0,d3
[0003108a] 6b24                      bmi.s      edbo_framecol_1
[0003108c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031092] 2268 025c                 movea.l    604(a0),a1
[00031096] 3203                      move.w     d3,d1
[00031098] 0269 0fff 003e            andi.w     #$0FFF,62(a1)
[0003109e] c27c 000f                 and.w      #$000F,d1
[000310a2] e149                      lsl.w      #8,d1
[000310a4] e949                      lsl.w      #4,d1
[000310a6] 8369 003e                 or.w       d1,62(a1)
[000310aa] 4eb9 0003 15bc            jsr        edbo_update
edbo_framecol_1:
[000310b0] 261f                      move.l     (a7)+,d3
[000310b2] 4e75                      rts

edbo_intercol:
[000310b4] 3f03                      move.w     d3,-(a7)
[000310b6] 7035                      moveq.l    #53,d0
[000310b8] 3f00                      move.w     d0,-(a7)
[000310ba] 7436                      moveq.l    #54,d2
[000310bc] 7233                      moveq.l    #51,d1
[000310be] 700f                      moveq.l    #15,d0
[000310c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000310c6] 2268 025c                 movea.l    604(a0),a1
[000310ca] c069 003e                 and.w      62(a1),d0
[000310ce] 4eb9 0003 0bde            jsr        oe_colsel
[000310d4] 544f                      addq.w     #2,a7
[000310d6] 3600                      move.w     d0,d3
[000310d8] 6b20                      bmi.s      edbo_intercol_1
[000310da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000310e0] 2268 025c                 movea.l    604(a0),a1
[000310e4] 3203                      move.w     d3,d1
[000310e6] 0269 fff0 003e            andi.w     #$FFF0,62(a1)
[000310ec] c27c 000f                 and.w      #$000F,d1
[000310f0] 8369 003e                 or.w       d1,62(a1)
[000310f4] 4eb9 0003 15bc            jsr        edbo_update
edbo_intercol_1:
[000310fa] 361f                      move.w     (a7)+,d3
[000310fc] 4e75                      rts

edbo_pattern:
[000310fe] 2f0a                      move.l     a2,-(a7)
[00031100] 2f0b                      move.l     a3,-(a7)
[00031102] 514f                      subq.w     #8,a7
[00031104] 41f9 000c 9fc8            lea.l      POP_PATSEL,a0
[0003110a] 4eb9 0004 f064            jsr        Aob_create
[00031110] 2448                      movea.l    a0,a2
[00031112] 200a                      move.l     a2,d0
[00031114] 6700 00c6                 beq        edbo_pattern_1
[00031118] 47f9 0010 ee4e            lea.l      ACSblk,a3
[0003111e] 7031                      moveq.l    #49,d0
[00031120] 2053                      movea.l    (a3),a0
[00031122] 2268 0258                 movea.l    600(a0),a1
[00031126] 2269 0014                 movea.l    20(a1),a1
[0003112a] 41d7                      lea.l      (a7),a0
[0003112c] 4eb9 0004 fe06            jsr        Aob_offset
[00031132] 7001                      moveq.l    #1,d0
[00031134] 2053                      movea.l    (a3),a0
[00031136] 2268 0258                 movea.l    600(a0),a1
[0003113a] d069 0034                 add.w      52(a1),d0
[0003113e] d157                      add.w      d0,(a7)
[00031140] 7201                      moveq.l    #1,d1
[00031142] d269 0036                 add.w      54(a1),d1
[00031146] d36f 0002                 add.w      d1,2(a7)
[0003114a] 2268 025c                 movea.l    604(a0),a1
[0003114e] 3029 003e                 move.w     62(a1),d0
[00031152] e848                      lsr.w      #4,d0
[00031154] c07c 0007                 and.w      #$0007,d0
[00031158] 5240                      addq.w     #1,d0
[0003115a] 7200                      moveq.l    #0,d1
[0003115c] 3200                      move.w     d0,d1
[0003115e] 2401                      move.l     d1,d2
[00031160] d482                      add.l      d2,d2
[00031162] d481                      add.l      d1,d2
[00031164] e78a                      lsl.l      #3,d2
[00031166] 0072 0004 280a            ori.w      #$0004,10(a2,d2.l)
[0003116c] 322f 0002                 move.w     2(a7),d1
[00031170] 3017                      move.w     (a7),d0
[00031172] 224a                      movea.l    a2,a1
[00031174] 2053                      movea.l    (a3),a0
[00031176] 2068 0258                 movea.l    600(a0),a0
[0003117a] 4eb9 0004 e84a            jsr        Ame_popup
[00031180] 4a40                      tst.w      d0
[00031182] 6f50                      ble.s      edbo_pattern_2
[00031184] 2053                      movea.l    (a3),a0
[00031186] 2268 025c                 movea.l    604(a0),a1
[0003118a] 72ff                      moveq.l    #-1,d1
[0003118c] d240                      add.w      d0,d1
[0003118e] 0269 ff8f 003e            andi.w     #$FF8F,62(a1)
[00031194] c27c 0007                 and.w      #$0007,d1
[00031198] e949                      lsl.w      #4,d1
[0003119a] 8369 003e                 or.w       d1,62(a1)
[0003119e] 2053                      movea.l    (a3),a0
[000311a0] 2268 025c                 movea.l    604(a0),a1
[000311a4] 72ff                      moveq.l    #-1,d1
[000311a6] d240                      add.w      d0,d1
[000311a8] 0269 ff8f 04a6            andi.w     #$FF8F,1190(a1)
[000311ae] c27c 0007                 and.w      #$0007,d1
[000311b2] e949                      lsl.w      #4,d1
[000311b4] 8369 04a6                 or.w       d1,1190(a1)
[000311b8] 72ff                      moveq.l    #-1,d1
[000311ba] 7031                      moveq.l    #49,d0
[000311bc] 2053                      movea.l    (a3),a0
[000311be] 2068 0258                 movea.l    600(a0),a0
[000311c2] 2253                      movea.l    (a3),a1
[000311c4] 2269 0258                 movea.l    600(a1),a1
[000311c8] 2269 0066                 movea.l    102(a1),a1
[000311cc] 4e91                      jsr        (a1)
[000311ce] 4eb9 0003 15bc            jsr        edbo_update
edbo_pattern_2:
[000311d4] 204a                      movea.l    a2,a0
[000311d6] 4eb9 0004 f20a            jsr        Aob_delete
edbo_pattern_1:
[000311dc] 504f                      addq.w     #8,a7
[000311de] 265f                      movea.l    (a7)+,a3
[000311e0] 245f                      movea.l    (a7)+,a2
[000311e2] 4e75                      rts

edbo_replace:
[000311e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000311ea] 2268 025c                 movea.l    604(a0),a1
[000311ee] 0269 ff7f 003e            andi.w     #$FF7F,62(a1)
[000311f4] 0069 0080 003e            ori.w      #$0080,62(a1)
[000311fa] 4eb9 0003 15bc            jsr        edbo_update
[00031200] 4e75                      rts

edbo_textcol:
[00031202] 3f03                      move.w     d3,-(a7)
[00031204] 700f                      moveq.l    #15,d0
[00031206] 3f00                      move.w     d0,-(a7)
[00031208] 7410                      moveq.l    #16,d2
[0003120a] 720d                      moveq.l    #13,d1
[0003120c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031212] 2268 025c                 movea.l    604(a0),a1
[00031216] 3029 003e                 move.w     62(a1),d0
[0003121a] e048                      lsr.w      #8,d0
[0003121c] c07c 000f                 and.w      #$000F,d0
[00031220] 4eb9 0003 0bde            jsr        oe_colsel
[00031226] 544f                      addq.w     #2,a7
[00031228] 3600                      move.w     d0,d3
[0003122a] 6b22                      bmi.s      edbo_textcol_1
[0003122c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031232] 2268 025c                 movea.l    604(a0),a1
[00031236] 3203                      move.w     d3,d1
[00031238] 0269 f0ff 003e            andi.w     #$F0FF,62(a1)
[0003123e] c27c 000f                 and.w      #$000F,d1
[00031242] e149                      lsl.w      #8,d1
[00031244] 8369 003e                 or.w       d1,62(a1)
[00031248] 4eb9 0003 15bc            jsr        edbo_update
edbo_textcol_1:
[0003124e] 361f                      move.w     (a7)+,d3
[00031250] 4e75                      rts

edbo_trans:
[00031252] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031258] 2268 025c                 movea.l    604(a0),a1
[0003125c] 0269 ff7f 003e            andi.w     #$FF7F,62(a1)
[00031262] 4eb9 0003 15bc            jsr        edbo_update
[00031268] 4e75                      rts

edbo_type:
[0003126a] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003126e] 514f                      subq.w     #8,a7
[00031270] 45f9 000c a0e8            lea.l      POP_TYPESEL,a2
[00031276] 204a                      movea.l    a2,a0
[00031278] 4eb9 0004 f064            jsr        Aob_create
[0003127e] 2648                      movea.l    a0,a3
[00031280] 200b                      move.l     a3,d0
[00031282] 6700 010c                 beq        edbo_type_1
[00031286] 49f9 0010 ee4e            lea.l      ACSblk,a4
[0003128c] 7005                      moveq.l    #5,d0
[0003128e] 2054                      movea.l    (a4),a0
[00031290] 2268 0258                 movea.l    600(a0),a1
[00031294] 2269 0014                 movea.l    20(a1),a1
[00031298] 41d7                      lea.l      (a7),a0
[0003129a] 4eb9 0004 fe06            jsr        Aob_offset
[000312a0] 7001                      moveq.l    #1,d0
[000312a2] 2054                      movea.l    (a4),a0
[000312a4] 2268 0258                 movea.l    600(a0),a1
[000312a8] d069 0034                 add.w      52(a1),d0
[000312ac] d157                      add.w      d0,(a7)
[000312ae] 7201                      moveq.l    #1,d1
[000312b0] d269 0036                 add.w      54(a1),d1
[000312b4] d36f 0002                 add.w      d1,2(a7)
[000312b8] 2268 025c                 movea.l    604(a0),a1
[000312bc] 3429 0036                 move.w     54(a1),d2
[000312c0] 947c 0014                 sub.w      #$0014,d2
[000312c4] 670a                      beq.s      edbo_type_2
[000312c6] 5b42                      subq.w     #5,d2
[000312c8] 670e                      beq.s      edbo_type_3
[000312ca] 5542                      subq.w     #2,d2
[000312cc] 6712                      beq.s      edbo_type_4
[000312ce] 6016                      bra.s      edbo_type_5
edbo_type_2:
[000312d0] 006b 0004 0022            ori.w      #$0004,34(a3)
[000312d6] 600e                      bra.s      edbo_type_5
edbo_type_3:
[000312d8] 006b 0004 003a            ori.w      #$0004,58(a3)
[000312de] 6006                      bra.s      edbo_type_5
edbo_type_4:
[000312e0] 006b 0004 0052            ori.w      #$0004,82(a3)
edbo_type_5:
[000312e6] 322f 0002                 move.w     2(a7),d1
[000312ea] 3017                      move.w     (a7),d0
[000312ec] 224b                      movea.l    a3,a1
[000312ee] 2054                      movea.l    (a4),a0
[000312f0] 2068 0258                 movea.l    600(a0),a0
[000312f4] 4eb9 0004 e84a            jsr        Ame_popup
[000312fa] 3600                      move.w     d0,d3
[000312fc] 5340                      subq.w     #1,d0
[000312fe] 670a                      beq.s      edbo_type_6
[00031300] 5340                      subq.w     #1,d0
[00031302] 6726                      beq.s      edbo_type_7
[00031304] 5340                      subq.w     #1,d0
[00031306] 6742                      beq.s      edbo_type_8
[00031308] 605e                      bra.s      edbo_type_9
edbo_type_6:
[0003130a] 2054                      movea.l    (a4),a0
[0003130c] 2268 025c                 movea.l    604(a0),a1
[00031310] 337c 0014 0036            move.w     #$0014,54(a1)
[00031316] 43ea f6f5                 lea.l      -2315(a2),a1
[0003131a] 7007                      moveq.l    #7,d0
[0003131c] 2054                      movea.l    (a4),a0
[0003131e] 2068 025c                 movea.l    604(a0),a0
[00031322] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031328] 603e                      bra.s      edbo_type_9
edbo_type_7:
[0003132a] 2054                      movea.l    (a4),a0
[0003132c] 2268 025c                 movea.l    604(a0),a1
[00031330] 337c 0019 0036            move.w     #$0019,54(a1)
[00031336] 43ea f6fb                 lea.l      -2309(a2),a1
[0003133a] 7007                      moveq.l    #7,d0
[0003133c] 2054                      movea.l    (a4),a0
[0003133e] 2068 025c                 movea.l    604(a0),a0
[00031342] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031348] 601e                      bra.s      edbo_type_9
edbo_type_8:
[0003134a] 2054                      movea.l    (a4),a0
[0003134c] 2268 025c                 movea.l    604(a0),a1
[00031350] 337c 001b 0036            move.w     #$001B,54(a1)
[00031356] 43ea f703                 lea.l      -2301(a2),a1
[0003135a] 7007                      moveq.l    #7,d0
[0003135c] 2054                      movea.l    (a4),a0
[0003135e] 2068 025c                 movea.l    604(a0),a0
[00031362] 4eb9 0005 0fd8            jsr        Aob_puttext
edbo_type_9:
[00031368] 4a43                      tst.w      d3
[0003136a] 6f1c                      ble.s      edbo_type_10
[0003136c] 72ff                      moveq.l    #-1,d1
[0003136e] 7005                      moveq.l    #5,d0
[00031370] 2054                      movea.l    (a4),a0
[00031372] 2068 0258                 movea.l    600(a0),a0
[00031376] 2254                      movea.l    (a4),a1
[00031378] 2469 0258                 movea.l    600(a1),a2
[0003137c] 226a 0066                 movea.l    102(a2),a1
[00031380] 4e91                      jsr        (a1)
[00031382] 4eb9 0003 15bc            jsr        edbo_update
edbo_type_10:
[00031388] 204b                      movea.l    a3,a0
[0003138a] 4eb9 0004 f20a            jsr        Aob_delete
edbo_type_1:
[00031390] 504f                      addq.w     #8,a7
[00031392] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00031396] 4e75                      rts

edbo_ok:
[00031398] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003139c] 594f                      subq.w     #4,a7
[0003139e] 2079 0010 ee4e            movea.l    ACSblk,a0
[000313a4] 2268 0258                 movea.l    600(a0),a1
[000313a8] 2451                      movea.l    (a1),a2
[000313aa] 2669 0014                 movea.l    20(a1),a3
[000313ae] 2052                      movea.l    (a2),a0
[000313b0] 0068 0001 0006            ori.w      #$0001,6(a0)
[000313b6] 206a 0004                 movea.l    4(a2),a0
[000313ba] 2868 0004                 movea.l    4(a0),a4
[000313be] 322a 000a                 move.w     10(a2),d1
[000313c2] 48c1                      ext.l      d1
[000313c4] 2001                      move.l     d1,d0
[000313c6] e788                      lsl.l      #3,d0
[000313c8] 9081                      sub.l      d1,d0
[000313ca] e788                      lsl.l      #3,d0
[000313cc] d9c0                      adda.l     d0,a4
[000313ce] 396b 0036 000e            move.w     54(a3),14(a4)
[000313d4] 296b 003c 0014            move.l     60(a3),20(a4)
[000313da] 43d7                      lea.l      (a7),a1
[000313dc] 7003                      moveq.l    #3,d0
[000313de] 41eb 01f8                 lea.l      504(a3),a0
[000313e2] 4eb9 0006 a068            jsr        Auo_boxed
[000313e8] 2057                      movea.l    (a7),a0
[000313ea] 1010                      move.b     (a0),d0
[000313ec] 4880                      ext.w      d0
[000313ee] 026c 00ff 0014            andi.w     #$00FF,20(a4)
[000313f4] c07c 00ff                 and.w      #$00FF,d0
[000313f8] e148                      lsl.w      #8,d0
[000313fa] 816c 0014                 or.w       d0,20(a4)
[000313fe] 4eb9 0002 f27c            jsr        ed_abort
[00031404] 584f                      addq.w     #4,a7
[00031406] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003140a] 4e75                      rts

set_box:
[0003140c] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00031410] 554f                      subq.w     #2,a7
[00031412] 2648                      movea.l    a0,a3
[00031414] 49f9 000c a6d0            lea.l      colour_text,a4
[0003141a] 41ec 0040                 lea.l      64(a4),a0
[0003141e] 43d7                      lea.l      (a7),a1
[00031420] 12d8                      move.b     (a0)+,(a1)+
[00031422] 12d8                      move.b     (a0)+,(a1)+
[00031424] 41ec fa78                 lea.l      -1416(a4),a0
[00031428] 4eb9 0004 f064            jsr        Aob_create
[0003142e] 2448                      movea.l    a0,a2
[00031430] 200a                      move.l     a2,d0
[00031432] 6606                      bne.s      set_box_1
[00031434] 91c8                      suba.l     a0,a0
[00031436] 6000 0142                 bra        set_box_2
set_box_1:
[0003143a] 356b 000e 0036            move.w     14(a3),54(a2)
[00031440] 256b 0014 003c            move.l     20(a3),60(a2)
[00031446] 356b 0012 003a            move.w     18(a3),58(a2)
[0003144c] 7015                      moveq.l    #21,d0
[0003144e] 224a                      movea.l    a2,a1
[00031450] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031456] 2068 0258                 movea.l    600(a0),a0
[0003145a] 4eb9 0003 0b9a            jsr        oe_beself
[00031460] 302b 0014                 move.w     20(a3),d0
[00031464] e048                      lsr.w      #8,d0
[00031466] c07c 00ff                 and.w      #$00FF,d0
[0003146a] 1e80                      move.b     d0,(a7)
[0003146c] 43d7                      lea.l      (a7),a1
[0003146e] 204a                      movea.l    a2,a0
[00031470] 7015                      moveq.l    #21,d0
[00031472] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031478] 102b 000f                 move.b     15(a3),d0
[0003147c] 4880                      ext.w      d0
[0003147e] 907c 0014                 sub.w      #$0014,d0
[00031482] 670a                      beq.s      set_box_3
[00031484] 5b40                      subq.w     #5,d0
[00031486] 6716                      beq.s      set_box_4
[00031488] 5540                      subq.w     #2,d0
[0003148a] 6722                      beq.s      set_box_5
[0003148c] 602e                      bra.s      set_box_6
set_box_3:
[0003148e] 43ec f10d                 lea.l      -3827(a4),a1
[00031492] 7007                      moveq.l    #7,d0
[00031494] 204a                      movea.l    a2,a0
[00031496] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003149c] 601e                      bra.s      set_box_6
set_box_4:
[0003149e] 43ec f113                 lea.l      -3821(a4),a1
[000314a2] 7007                      moveq.l    #7,d0
[000314a4] 204a                      movea.l    a2,a0
[000314a6] 4eb9 0005 0fd8            jsr        Aob_puttext
[000314ac] 600e                      bra.s      set_box_6
set_box_5:
[000314ae] 43ec f11b                 lea.l      -3813(a4),a1
[000314b2] 7007                      moveq.l    #7,d0
[000314b4] 204a                      movea.l    a2,a0
[000314b6] 4eb9 0005 0fd8            jsr        Aob_puttext
set_box_6:
[000314bc] 362b 0016                 move.w     22(a3),d3
[000314c0] 700c                      moveq.l    #12,d0
[000314c2] e06b                      lsr.w      d0,d3
[000314c4] c67c 000f                 and.w      #$000F,d3
[000314c8] 3203                      move.w     d3,d1
[000314ca] e549                      lsl.w      #2,d1
[000314cc] 2274 1000                 movea.l    0(a4,d1.w),a1
[000314d0] 204a                      movea.l    a2,a0
[000314d2] 702c                      moveq.l    #44,d0
[000314d4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000314da] 3003                      move.w     d3,d0
[000314dc] 026a fff0 0416            andi.w     #$FFF0,1046(a2)
[000314e2] c07c 000f                 and.w      #$000F,d0
[000314e6] 816a 0416                 or.w       d0,1046(a2)
[000314ea] 760f                      moveq.l    #15,d3
[000314ec] c66b 0016                 and.w      22(a3),d3
[000314f0] 3003                      move.w     d3,d0
[000314f2] e548                      lsl.w      #2,d0
[000314f4] 2274 0000                 movea.l    0(a4,d0.w),a1
[000314f8] 204a                      movea.l    a2,a0
[000314fa] 7036                      moveq.l    #54,d0
[000314fc] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031502] 3003                      move.w     d3,d0
[00031504] 026a fff0 0506            andi.w     #$FFF0,1286(a2)
[0003150a] c07c 000f                 and.w      #$000F,d0
[0003150e] 816a 0506                 or.w       d0,1286(a2)
[00031512] 302b 0016                 move.w     22(a3),d0
[00031516] e848                      lsr.w      #4,d0
[00031518] c07c 0007                 and.w      #$0007,d0
[0003151c] 026a ff8f 04a6            andi.w     #$FF8F,1190(a2)
[00031522] c07c 0007                 and.w      #$0007,d0
[00031526] e948                      lsl.w      #4,d0
[00031528] 816a 04a6                 or.w       d0,1190(a2)
[0003152c] 362b 0016                 move.w     22(a3),d3
[00031530] e04b                      lsr.w      #8,d3
[00031532] c67c 000f                 and.w      #$000F,d3
[00031536] 3003                      move.w     d3,d0
[00031538] e548                      lsl.w      #2,d0
[0003153a] 2274 0000                 movea.l    0(a4,d0.w),a1
[0003153e] 204a                      movea.l    a2,a0
[00031540] 7010                      moveq.l    #16,d0
[00031542] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031548] 3003                      move.w     d3,d0
[0003154a] 026a fff0 0176            andi.w     #$FFF0,374(a2)
[00031550] c07c 000f                 and.w      #$000F,d0
[00031554] 816a 0176                 or.w       d0,374(a2)
[00031558] 302b 0016                 move.w     22(a3),d0
[0003155c] ee48                      lsr.w      #7,d0
[0003155e] c07c 0001                 and.w      #$0001,d0
[00031562] 026a ff7f 003e            andi.w     #$FF7F,62(a2)
[00031568] c07c 0001                 and.w      #$0001,d0
[0003156c] ef48                      lsl.w      #7,d0
[0003156e] 816a 003e                 or.w       d0,62(a2)
[00031572] 294a 0042                 move.l     a2,66(a4)
[00031576] 41ec 0042                 lea.l      66(a4),a0
set_box_2:
[0003157a] 544f                      addq.w     #2,a7
[0003157c] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00031580] 4e75                      rts

edbo_th:
[00031582] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031588] 2268 025c                 movea.l    604(a0),a1
[0003158c] 3228 0260                 move.w     608(a0),d1
[00031590] 48c1                      ext.l      d1
[00031592] 2001                      move.l     d1,d0
[00031594] d080                      add.l      d0,d0
[00031596] d081                      add.l      d1,d0
[00031598] e788                      lsl.l      #3,d0
[0003159a] 2068 025c                 movea.l    604(a0),a0
[0003159e] 3430 080c                 move.w     12(a0,d0.l),d2
[000315a2] e14a                      lsl.w      #8,d2
[000315a4] e042                      asr.w      #8,d2
[000315a6] 0269 ff00 003c            andi.w     #$FF00,60(a1)
[000315ac] c47c 00ff                 and.w      #$00FF,d2
[000315b0] 8569 003c                 or.w       d2,60(a1)
[000315b4] 4eb9 0003 15bc            jsr        edbo_update
[000315ba] 4e75                      rts

edbo_update:
[000315bc] 2f0a                      move.l     a2,-(a7)
[000315be] 2f0b                      move.l     a3,-(a7)
[000315c0] 594f                      subq.w     #4,a7
[000315c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000315c8] 2468 0258                 movea.l    600(a0),a2
[000315cc] 266a 0014                 movea.l    20(a2),a3
[000315d0] 43d7                      lea.l      (a7),a1
[000315d2] 7003                      moveq.l    #3,d0
[000315d4] 41eb 01f8                 lea.l      504(a3),a0
[000315d8] 4eb9 0006 a068            jsr        Auo_boxed
[000315de] 2057                      movea.l    (a7),a0
[000315e0] 1010                      move.b     (a0),d0
[000315e2] 4880                      ext.w      d0
[000315e4] 026b 00ff 003c            andi.w     #$00FF,60(a3)
[000315ea] c07c 00ff                 and.w      #$00FF,d0
[000315ee] e148                      lsl.w      #8,d0
[000315f0] 816b 003c                 or.w       d0,60(a3)
[000315f4] 322b 0022                 move.w     34(a3),d1
[000315f8] 7001                      moveq.l    #1,d0
[000315fa] 204a                      movea.l    a2,a0
[000315fc] 226a 0066                 movea.l    102(a2),a1
[00031600] 4e91                      jsr        (a1)
[00031602] 584f                      addq.w     #4,a7
[00031604] 265f                      movea.l    (a7)+,a3
[00031606] 245f                      movea.l    (a7)+,a2
[00031608] 4e75                      rts

	.data

COLOUR00:
[000c96c4]                           dc.b '  Weiû',0
COLOUR01:
[000c96cb]                           dc.b '  Schwarz',0
COLOUR02:
[000c96d5]                           dc.b '  Rot',0
COLOUR03:
[000c96db]                           dc.b '  GrÅn',0
COLOUR04:
[000c96e2]                           dc.b '  Blau',0
COLOUR05:
[000c96e9]                           dc.b '  Cyan',0
COLOUR06:
[000c96f0]                           dc.b '  Gelb',0
COLOUR07:
[000c96f7]                           dc.b '  Magenta',0
COLOUR08:
[000c9701]                           dc.b '  Hellgrau',0
COLOUR09:
[000c970c]                           dc.b '  Dunkelgrau',0
COLOUR10:
[000c9719]                           dc.b '  Dunkelrot',0
COLOUR11:
[000c9725]                           dc.b '  DunkelgrÅn',0
COLOUR12:
[000c9732]                           dc.b '  Dunkelblau',0
COLOUR13:
[000c973f]                           dc.b '  Dunkelcyan',0
COLOUR14:
[000c974c]                           dc.b '  Dunkelgelb',0
COLOUR15:
[000c9759]                           dc.b '  Dunkelmagenta',0

HPOS_TEXT1:
[000c9769]                           dc.b '  Links',0
HPOS_TEXT2:
[000c9771]                           dc.b '  Mitte',0
HPOS_TEXT3:
[000c9779]                           dc.b '  Rechts',0
SIZE_TEXT0:
[000c9782]                           dc.b 'groû',0
SIZE_TEXT1:
[000c9787]                           dc.b 'klein',0
TEXT_003:
[000c978d]                           dc.b $4f
[000c978e]                           dc.w $4b00
TEXT_004:
[000c9790]                           dc.b 'Abbruch',0
TEXT_01:
[000c9798]                           dc.b 'Muster:',0
TEXT_02:
[000c97a0]                           dc.b 'Modus:',0
TEXT_03:
[000c97a7]                           dc.b 'Zeichen:',0
TEXT_04:
[000c97b0]                           dc.b 'Typ:',0
TEXT_05:
[000c97b5]                           dc.b 'Rand:',0
TEXT_08:
[000c97bb]                           dc.b 'Rahmen:',0
TEXT_11:
[000c97c3]                           dc.b 'Text:',0
TEXT_13:
[000c97c9]                           dc.b 'Farbe:',0
TEXT_16:
[000c97d0]                           dc.b 'InnenflÑche:',0
TYPE0:
[000c97dd]                           dc.b '  Box',0
TYPE1:
[000c97e3]                           dc.b '  I-Box',0
TYPE2:
[000c97eb]                           dc.b '  BoxChar',0
help_title:
[000c97f5]                           dc.b 'Der Boxen-Editor',0
title:
[000c9806]                           dc.b ' BOXEN -',0
[000c980f]                           dc.b $00
[000c9810] 00064a22                  dc.l A_3Dbutton
[000c9814]                           dc.w $09f1
[000c9816]                           dc.w $0178
[000c9818] 000630f2                  dc.l Auo_string
[000c981c] 000c97dd                  dc.l TYPE0
[000c9820]                           dc.w $0000
[000c9822]                           dc.w $0000
[000c9824]                           dc.w $0000
[000c9826]                           dc.w $0000
[000c9828]                           dc.w $0000
[000c982a]                           dc.w $0000
[000c982c]                           dc.w $0000
[000c982e]                           dc.w $0000
A_3DBUTTON02:
[000c9830] 00064a22                  dc.l A_3Dbutton
[000c9834]                           dc.w $29c1
[000c9836]                           dc.w $0178
[000c9838] 000630f2                  dc.l Auo_string
[000c983c] 000c978d                  dc.l TEXT_003
[000c9840]                           dc.w $0000
[000c9842]                           dc.w $0000
[000c9844]                           dc.w $0000
[000c9846]                           dc.w $0000
[000c9848]                           dc.w $0000
[000c984a]                           dc.w $0000
[000c984c]                           dc.w $0000
[000c984e]                           dc.w $0000
A_3DBUTTON03:
[000c9850] 00064a22                  dc.l A_3Dbutton
[000c9854]                           dc.w $09f1
[000c9856]                           dc.w $0178
[000c9858] 000630f2                  dc.l Auo_string
[000c985c] 000c96cb                  dc.l COLOUR01
[000c9860]                           dc.w $0000
[000c9862]                           dc.w $0000
[000c9864]                           dc.w $0000
[000c9866]                           dc.w $0000
[000c9868]                           dc.w $0000
[000c986a]                           dc.w $0000
[000c986c]                           dc.w $0000
[000c986e]                           dc.w $0000
A_3DBUTTON04:
[000c9870] 00064a22                  dc.l A_3Dbutton
[000c9874]                           dc.w $09f1
[000c9876]                           dc.w $0178
[000c9878] 000630f2                  dc.l Auo_string
[000c987c] 000c97e3                  dc.l TYPE1
[000c9880]                           dc.w $0000
[000c9882]                           dc.w $0000
[000c9884]                           dc.w $0000
[000c9886]                           dc.w $0000
[000c9888]                           dc.w $0000
[000c988a]                           dc.w $0000
[000c988c]                           dc.w $0000
[000c988e]                           dc.w $0000
A_3DBUTTON05:
[000c9890] 00064a22                  dc.l A_3Dbutton
[000c9894]                           dc.w $21f1
[000c9896]                           dc.w $0178
[000c9898] 000630f2                  dc.l Auo_string
[000c989c]                           dc.w $0000
[000c989e]                           dc.w $0000
[000c98a0]                           dc.w $0000
[000c98a2]                           dc.w $0000
[000c98a4]                           dc.w $0000
[000c98a6]                           dc.w $0000
[000c98a8]                           dc.w $0000
[000c98aa]                           dc.w $0000
[000c98ac]                           dc.w $0000
[000c98ae]                           dc.w $0000
A_3DBUTTON06:
[000c98b0] 00064a22                  dc.l A_3Dbutton
[000c98b4]                           dc.w $29c1
[000c98b6]                           dc.w $0178
[000c98b8] 000630f2                  dc.l Auo_string
[000c98bc] 000c9790                  dc.l TEXT_004
[000c98c0]                           dc.w $0000
[000c98c2]                           dc.w $0000
[000c98c4]                           dc.w $0000
[000c98c6]                           dc.w $0000
[000c98c8]                           dc.w $0000
[000c98ca]                           dc.w $0000
[000c98cc]                           dc.w $0000
[000c98ce]                           dc.w $0000
A_3DBUTTON07:
[000c98d0] 00064a22                  dc.l A_3Dbutton
[000c98d4]                           dc.w $09f1
[000c98d6]                           dc.w $0178
[000c98d8] 000630f2                  dc.l Auo_string
[000c98dc] 000c96d5                  dc.l COLOUR02
[000c98e0]                           dc.w $0000
[000c98e2]                           dc.w $0000
[000c98e4]                           dc.w $0000
[000c98e6]                           dc.w $0000
[000c98e8]                           dc.w $0000
[000c98ea]                           dc.w $0000
[000c98ec]                           dc.w $0000
[000c98ee]                           dc.w $0000
A_3DBUTTON08:
[000c98f0] 00064a22                  dc.l A_3Dbutton
[000c98f4]                           dc.w $09f1
[000c98f6]                           dc.w $0178
[000c98f8] 000630f2                  dc.l Auo_string
[000c98fc] 000c97eb                  dc.l TYPE2
[000c9900]                           dc.w $0000
[000c9902]                           dc.w $0000
[000c9904]                           dc.w $0000
[000c9906]                           dc.w $0000
[000c9908]                           dc.w $0000
[000c990a]                           dc.w $0000
[000c990c]                           dc.w $0000
[000c990e]                           dc.w $0000
A_3DBUTTON09:
[000c9910] 00064a22                  dc.l A_3Dbutton
[000c9914]                           dc.w $09f1
[000c9916]                           dc.w $0178
[000c9918] 000630f2                  dc.l Auo_string
[000c991c] 000c96c4                  dc.l COLOUR00
[000c9920]                           dc.w $0000
[000c9922]                           dc.w $0000
[000c9924]                           dc.w $0000
[000c9926]                           dc.w $0000
[000c9928]                           dc.w $0000
[000c992a]                           dc.w $0000
[000c992c]                           dc.w $0000
[000c992e]                           dc.w $0000
A_3DBUTTON10:
[000c9930] 00064a22                  dc.l A_3Dbutton
[000c9934]                           dc.w $09f1
[000c9936]                           dc.w $0178
[000c9938] 000630f2                  dc.l Auo_string
[000c993c] 000c96db                  dc.l COLOUR03
[000c9940]                           dc.w $0000
[000c9942]                           dc.w $0000
[000c9944]                           dc.w $0000
[000c9946]                           dc.w $0000
[000c9948]                           dc.w $0000
[000c994a]                           dc.w $0000
[000c994c]                           dc.w $0000
[000c994e]                           dc.w $0000
A_3DBUTTON11:
[000c9950] 00064a22                  dc.l A_3Dbutton
[000c9954]                           dc.w $09f1
[000c9956]                           dc.w $0178
[000c9958] 000630f2                  dc.l Auo_string
[000c995c] 000c96e2                  dc.l COLOUR04
[000c9960]                           dc.w $0000
[000c9962]                           dc.w $0000
[000c9964]                           dc.w $0000
[000c9966]                           dc.w $0000
[000c9968]                           dc.w $0000
[000c996a]                           dc.w $0000
[000c996c]                           dc.w $0000
[000c996e]                           dc.w $0000
A_3DBUTTON12:
[000c9970] 00064a22                  dc.l A_3Dbutton
[000c9974]                           dc.w $09f1
[000c9976]                           dc.w $0178
[000c9978] 000630f2                  dc.l Auo_string
[000c997c] 000c96e9                  dc.l COLOUR05
[000c9980]                           dc.w $0000
[000c9982]                           dc.w $0000
[000c9984]                           dc.w $0000
[000c9986]                           dc.w $0000
[000c9988]                           dc.w $0000
[000c998a]                           dc.w $0000
[000c998c]                           dc.w $0000
[000c998e]                           dc.w $0000
A_3DBUTTON13:
[000c9990] 00064a22                  dc.l A_3Dbutton
[000c9994]                           dc.w $09f1
[000c9996]                           dc.w $0178
[000c9998] 000630f2                  dc.l Auo_string
[000c999c] 000c96f0                  dc.l COLOUR06
[000c99a0]                           dc.w $0000
[000c99a2]                           dc.w $0000
[000c99a4]                           dc.w $0000
[000c99a6]                           dc.w $0000
[000c99a8]                           dc.w $0000
[000c99aa]                           dc.w $0000
[000c99ac]                           dc.w $0000
[000c99ae]                           dc.w $0000
A_3DBUTTON14:
[000c99b0] 00064a22                  dc.l A_3Dbutton
[000c99b4]                           dc.w $09f1
[000c99b6]                           dc.w $0178
[000c99b8] 000630f2                  dc.l Auo_string
[000c99bc] 000c96f7                  dc.l COLOUR07
[000c99c0]                           dc.w $0000
[000c99c2]                           dc.w $0000
[000c99c4]                           dc.w $0000
[000c99c6]                           dc.w $0000
[000c99c8]                           dc.w $0000
[000c99ca]                           dc.w $0000
[000c99cc]                           dc.w $0000
[000c99ce]                           dc.w $0000
A_3DBUTTON15:
[000c99d0] 00064a22                  dc.l A_3Dbutton
[000c99d4]                           dc.w $09f1
[000c99d6]                           dc.w $0178
[000c99d8] 000630f2                  dc.l Auo_string
[000c99dc] 000c9701                  dc.l COLOUR08
[000c99e0]                           dc.w $0000
[000c99e2]                           dc.w $0000
[000c99e4]                           dc.w $0000
[000c99e6]                           dc.w $0000
[000c99e8]                           dc.w $0000
[000c99ea]                           dc.w $0000
[000c99ec]                           dc.w $0000
[000c99ee]                           dc.w $0000
A_3DBUTTON16:
[000c99f0] 00064a22                  dc.l A_3Dbutton
[000c99f4]                           dc.w $09f1
[000c99f6]                           dc.w $0178
[000c99f8] 000630f2                  dc.l Auo_string
[000c99fc] 000c970c                  dc.l COLOUR09
[000c9a00]                           dc.w $0000
[000c9a02]                           dc.w $0000
[000c9a04]                           dc.w $0000
[000c9a06]                           dc.w $0000
[000c9a08]                           dc.w $0000
[000c9a0a]                           dc.w $0000
[000c9a0c]                           dc.w $0000
[000c9a0e]                           dc.w $0000
A_3DBUTTON17:
[000c9a10] 00064a22                  dc.l A_3Dbutton
[000c9a14]                           dc.w $09f1
[000c9a16]                           dc.w $0178
[000c9a18] 000630f2                  dc.l Auo_string
[000c9a1c] 000c9719                  dc.l COLOUR10
[000c9a20]                           dc.w $0000
[000c9a22]                           dc.w $0000
[000c9a24]                           dc.w $0000
[000c9a26]                           dc.w $0000
[000c9a28]                           dc.w $0000
[000c9a2a]                           dc.w $0000
[000c9a2c]                           dc.w $0000
[000c9a2e]                           dc.w $0000
A_3DBUTTON18:
[000c9a30] 00064a22                  dc.l A_3Dbutton
[000c9a34]                           dc.w $09f1
[000c9a36]                           dc.w $0178
[000c9a38] 000630f2                  dc.l Auo_string
[000c9a3c] 000c9725                  dc.l COLOUR11
[000c9a40]                           dc.w $0000
[000c9a42]                           dc.w $0000
[000c9a44]                           dc.w $0000
[000c9a46]                           dc.w $0000
[000c9a48]                           dc.w $0000
[000c9a4a]                           dc.w $0000
[000c9a4c]                           dc.w $0000
[000c9a4e]                           dc.w $0000
A_3DBUTTON19:
[000c9a50] 00064a22                  dc.l A_3Dbutton
[000c9a54]                           dc.w $09f1
[000c9a56]                           dc.w $0178
[000c9a58] 000630f2                  dc.l Auo_string
[000c9a5c] 000c973f                  dc.l COLOUR13
[000c9a60]                           dc.w $0000
[000c9a62]                           dc.w $0000
[000c9a64]                           dc.w $0000
[000c9a66]                           dc.w $0000
[000c9a68]                           dc.w $0000
[000c9a6a]                           dc.w $0000
[000c9a6c]                           dc.w $0000
[000c9a6e]                           dc.w $0000
A_3DBUTTON20:
[000c9a70] 00064a22                  dc.l A_3Dbutton
[000c9a74]                           dc.w $09f1
[000c9a76]                           dc.w $0178
[000c9a78] 000630f2                  dc.l Auo_string
[000c9a7c] 000c9732                  dc.l COLOUR12
[000c9a80]                           dc.w $0000
[000c9a82]                           dc.w $0000
[000c9a84]                           dc.w $0000
[000c9a86]                           dc.w $0000
[000c9a88]                           dc.w $0000
[000c9a8a]                           dc.w $0000
[000c9a8c]                           dc.w $0000
[000c9a8e]                           dc.w $0000
A_3DBUTTON21:
[000c9a90] 00064a22                  dc.l A_3Dbutton
[000c9a94]                           dc.w $09f1
[000c9a96]                           dc.w $0178
[000c9a98] 000630f2                  dc.l Auo_string
[000c9a9c] 000c974c                  dc.l COLOUR14
[000c9aa0]                           dc.w $0000
[000c9aa2]                           dc.w $0000
[000c9aa4]                           dc.w $0000
[000c9aa6]                           dc.w $0000
[000c9aa8]                           dc.w $0000
[000c9aaa]                           dc.w $0000
[000c9aac]                           dc.w $0000
[000c9aae]                           dc.w $0000
A_3DBUTTON22:
[000c9ab0] 00064a22                  dc.l A_3Dbutton
[000c9ab4]                           dc.w $09f1
[000c9ab6]                           dc.w $0178
[000c9ab8] 000630f2                  dc.l Auo_string
[000c9abc] 000c9759                  dc.l COLOUR15
[000c9ac0]                           dc.w $0000
[000c9ac2]                           dc.w $0000
[000c9ac4]                           dc.w $0000
[000c9ac6]                           dc.w $0000
[000c9ac8]                           dc.w $0000
[000c9aca]                           dc.w $0000
[000c9acc]                           dc.w $0000
[000c9ace]                           dc.w $0000
A_3DBUTTON23:
[000c9ad0] 00064a22                  dc.l A_3Dbutton
[000c9ad4]                           dc.w $09f1
[000c9ad6]                           dc.w $0178
[000c9ad8] 000630f2                  dc.l Auo_string
[000c9adc]                           dc.w $0000
[000c9ade]                           dc.w $0000
[000c9ae0]                           dc.w $0000
[000c9ae2]                           dc.w $0000
[000c9ae4]                           dc.w $0000
[000c9ae6]                           dc.w $0000
[000c9ae8]                           dc.w $0000
[000c9aea]                           dc.w $0000
[000c9aec]                           dc.w $0000
[000c9aee]                           dc.w $0000
A_3DBUTTON25:
[000c9af0] 00064a22                  dc.l A_3Dbutton
[000c9af4]                           dc.w $29f1
[000c9af6]                           dc.w $0178
[000c9af8] 000630f2                  dc.l Auo_string
[000c9afc] 000c9782                  dc.l SIZE_TEXT0
[000c9b00]                           dc.w $0000
[000c9b02]                           dc.w $0000
[000c9b04]                           dc.w $0000
[000c9b06]                           dc.w $0000
[000c9b08]                           dc.w $0000
[000c9b0a]                           dc.w $0000
[000c9b0c]                           dc.w $0000
[000c9b0e]                           dc.w $0000
A_3DBUTTON27:
[000c9b10] 00064a22                  dc.l A_3Dbutton
[000c9b14]                           dc.w $09f1
[000c9b16]                           dc.w $0178
[000c9b18] 000630f2                  dc.l Auo_string
[000c9b1c] 000c9769                  dc.l HPOS_TEXT1
[000c9b20]                           dc.w $0000
[000c9b22]                           dc.w $0000
[000c9b24]                           dc.w $0000
[000c9b26]                           dc.w $0000
[000c9b28]                           dc.w $0000
[000c9b2a]                           dc.w $0000
[000c9b2c]                           dc.w $0000
[000c9b2e]                           dc.w $0000
A_3DBUTTON28:
[000c9b30] 00064a22                  dc.l A_3Dbutton
[000c9b34]                           dc.w $09f1
[000c9b36]                           dc.w $0178
[000c9b38] 000630f2                  dc.l Auo_string
[000c9b3c] 000c9771                  dc.l HPOS_TEXT2
[000c9b40]                           dc.w $0000
[000c9b42]                           dc.w $0000
[000c9b44]                           dc.w $0000
[000c9b46]                           dc.w $0000
[000c9b48]                           dc.w $0000
[000c9b4a]                           dc.w $0000
[000c9b4c]                           dc.w $0000
[000c9b4e]                           dc.w $0000
A_3DBUTTON29:
[000c9b50] 00064a22                  dc.l A_3Dbutton
[000c9b54]                           dc.w $09f1
[000c9b56]                           dc.w $0178
[000c9b58] 000630f2                  dc.l Auo_string
[000c9b5c] 000c9779                  dc.l HPOS_TEXT3
[000c9b60]                           dc.w $0000
[000c9b62]                           dc.w $0000
[000c9b64]                           dc.w $0000
[000c9b66]                           dc.w $0000
[000c9b68]                           dc.w $0000
[000c9b6a]                           dc.w $0000
[000c9b6c]                           dc.w $0000
[000c9b6e]                           dc.w $0000
A_3DBUTTON30:
[000c9b70] 00064a22                  dc.l A_3Dbutton
[000c9b74]                           dc.w $29f1
[000c9b76]                           dc.w $0178
[000c9b78] 000630f2                  dc.l Auo_string
[000c9b7c]                           dc.w $0000
[000c9b7e]                           dc.w $0000
[000c9b80]                           dc.w $0000
[000c9b82]                           dc.w $0000
[000c9b84]                           dc.w $0000
[000c9b86]                           dc.w $0000
[000c9b88]                           dc.w $0000
[000c9b8a]                           dc.w $0000
[000c9b8c]                           dc.w $0000
[000c9b8e]                           dc.w $0000
A_3DBUTTON31:
[000c9b90] 00064a22                  dc.l A_3Dbutton
[000c9b94]                           dc.w $29f1
[000c9b96]                           dc.w $0178
[000c9b98] 000630f2                  dc.l Auo_string
[000c9b9c] 000c9787                  dc.l SIZE_TEXT1
[000c9ba0]                           dc.w $0000
[000c9ba2]                           dc.w $0000
[000c9ba4]                           dc.w $0000
[000c9ba6]                           dc.w $0000
[000c9ba8]                           dc.w $0000
[000c9baa]                           dc.w $0000
[000c9bac]                           dc.w $0000
[000c9bae]                           dc.w $0000
A_ARROWS02:
[000c9bb0] 00065c72                  dc.l A_arrows
[000c9bb4]                           dc.w $1301
[000c9bb6]                           dc.w $0001
[000c9bb8]                           dc.w $0000
[000c9bba]                           dc.w $0000
[000c9bbc]                           dc.w $0000
[000c9bbe]                           dc.w $0000
[000c9bc0]                           dc.w $0000
[000c9bc2]                           dc.w $0000
[000c9bc4]                           dc.w $0000
[000c9bc6]                           dc.w $0000
[000c9bc8]                           dc.w $0000
[000c9bca]                           dc.w $0000
[000c9bcc]                           dc.w $0000
[000c9bce]                           dc.w $0000
A_BOXED01:
[000c9bd0] 0006afea                  dc.l A_boxed
[000c9bd4]                           dc.w $9000
[000c9bd6]                           dc.w $0112
[000c9bd8] 0006a068                  dc.l Auo_boxed
[000c9bdc]                           dc.w $0000
[000c9bde]                           dc.w $0000
[000c9be0]                           dc.w $0000
[000c9be2]                           dc.w $0000
[000c9be4]                           dc.w $0000
[000c9be6]                           dc.w $0000
[000c9be8]                           dc.w $0000
[000c9bea]                           dc.w $0000
[000c9bec]                           dc.w $0000
[000c9bee]                           dc.w $0000
A_INNERFRAME01:
[000c9bf0] 00064256                  dc.l A_innerframe
[000c9bf4]                           dc.w $1000
[000c9bf6]                           dc.w $8f19
[000c9bf8] 000630f2                  dc.l Auo_string
[000c9bfc] 000c97d0                  dc.l TEXT_16
[000c9c00]                           dc.w $0000
[000c9c02]                           dc.w $0000
[000c9c04]                           dc.w $0000
[000c9c06]                           dc.w $0000
[000c9c08]                           dc.w $0000
[000c9c0a]                           dc.w $0000
[000c9c0c]                           dc.w $0000
[000c9c0e]                           dc.w $0000
A_INNERFRAME04:
[000c9c10] 00064256                  dc.l A_innerframe
[000c9c14]                           dc.w $1000
[000c9c16]                           dc.w $8f19
[000c9c18] 000630f2                  dc.l Auo_string
[000c9c1c] 000c97bb                  dc.l TEXT_08
[000c9c20]                           dc.w $0000
[000c9c22]                           dc.w $0000
[000c9c24]                           dc.w $0000
[000c9c26]                           dc.w $0000
[000c9c28]                           dc.w $0000
[000c9c2a]                           dc.w $0000
[000c9c2c]                           dc.w $0000
[000c9c2e]                           dc.w $0000
A_INNERFRAME05:
[000c9c30] 00064256                  dc.l A_innerframe
[000c9c34]                           dc.w $1000
[000c9c36]                           dc.w $8f19
[000c9c38] 000630f2                  dc.l Auo_string
[000c9c3c] 000c97c3                  dc.l TEXT_11
[000c9c40]                           dc.w $0000
[000c9c42]                           dc.w $0000
[000c9c44]                           dc.w $0000
[000c9c46]                           dc.w $0000
[000c9c48]                           dc.w $0000
[000c9c4a]                           dc.w $0000
[000c9c4c]                           dc.w $0000
[000c9c4e]                           dc.w $0000
POP_COLSEL:
[000c9c50]                           dc.w $ffff
[000c9c52]                           dc.w $0001
[000c9c54]                           dc.w $0020
[000c9c56]                           dc.w $0014
[000c9c58]                           dc.w $0000
[000c9c5a]                           dc.w $0020
[000c9c5c]                           dc.w $00ff
[000c9c5e]                           dc.w $1100
[000c9c60]                           dc.w $0000
[000c9c62]                           dc.w $0000
[000c9c64]                           dc.w $0012
[000c9c66]                           dc.w $0010
_01_POP_COLSEL:
[000c9c68]                           dc.w $0002
[000c9c6a]                           dc.w $ffff
[000c9c6c]                           dc.w $ffff
[000c9c6e]                           dc.w $0018
[000c9c70]                           dc.w $0041
[000c9c72]                           dc.w $0000
[000c9c74] 000c9910                  dc.l A_3DBUTTON09
[000c9c78]                           dc.w $0000
[000c9c7a]                           dc.w $0000
[000c9c7c]                           dc.w $0010
[000c9c7e]                           dc.w $0001
_02_POP_COLSEL:
[000c9c80]                           dc.w $0003
[000c9c82]                           dc.w $ffff
[000c9c84]                           dc.w $ffff
[000c9c86]                           dc.w $0014
[000c9c88]                           dc.w $0000
[000c9c8a]                           dc.w $0000
[000c9c8c]                           dc.w $0001
[000c9c8e]                           dc.w $1170
[000c9c90]                           dc.w $0010
[000c9c92]                           dc.w $0000
[000c9c94]                           dc.w $0002
[000c9c96]                           dc.w $0001
_03_POP_COLSEL:
[000c9c98]                           dc.w $0004
[000c9c9a]                           dc.w $ffff
[000c9c9c]                           dc.w $ffff
[000c9c9e]                           dc.w $0018
[000c9ca0]                           dc.w $0041
[000c9ca2]                           dc.w $0000
[000c9ca4] 000c9850                  dc.l A_3DBUTTON03
[000c9ca8]                           dc.w $0000
[000c9caa]                           dc.w $0001
[000c9cac]                           dc.w $0010
[000c9cae]                           dc.w $0001
_04_POP_COLSEL:
[000c9cb0]                           dc.w $0005
[000c9cb2]                           dc.w $ffff
[000c9cb4]                           dc.w $ffff
[000c9cb6]                           dc.w $0014
[000c9cb8]                           dc.w $0000
[000c9cba]                           dc.w $0000
[000c9cbc]                           dc.w $0001
[000c9cbe]                           dc.w $1171
[000c9cc0]                           dc.w $0010
[000c9cc2]                           dc.w $0001
[000c9cc4]                           dc.w $0002
[000c9cc6]                           dc.w $0001
_05_POP_COLSEL:
[000c9cc8]                           dc.w $0006
[000c9cca]                           dc.w $ffff
[000c9ccc]                           dc.w $ffff
[000c9cce]                           dc.w $0018
[000c9cd0]                           dc.w $0041
[000c9cd2]                           dc.w $0000
[000c9cd4] 000c98d0                  dc.l A_3DBUTTON07
[000c9cd8]                           dc.w $0000
[000c9cda]                           dc.w $0002
[000c9cdc]                           dc.w $0010
[000c9cde]                           dc.w $0001
_06_POP_COLSEL:
[000c9ce0]                           dc.w $0007
[000c9ce2]                           dc.w $ffff
[000c9ce4]                           dc.w $ffff
[000c9ce6]                           dc.w $0014
[000c9ce8]                           dc.w $0000
[000c9cea]                           dc.w $0000
[000c9cec]                           dc.w $0001
[000c9cee]                           dc.w $1172
[000c9cf0]                           dc.w $0010
[000c9cf2]                           dc.w $0002
[000c9cf4]                           dc.w $0002
[000c9cf6]                           dc.w $0001
_07_POP_COLSEL:
[000c9cf8]                           dc.w $0008
[000c9cfa]                           dc.w $ffff
[000c9cfc]                           dc.w $ffff
[000c9cfe]                           dc.w $0018
[000c9d00]                           dc.w $0041
[000c9d02]                           dc.w $0000
[000c9d04] 000c9930                  dc.l A_3DBUTTON10
[000c9d08]                           dc.w $0000
[000c9d0a]                           dc.w $0003
[000c9d0c]                           dc.w $0010
[000c9d0e]                           dc.w $0001
_08_POP_COLSEL:
[000c9d10]                           dc.w $0009
[000c9d12]                           dc.w $ffff
[000c9d14]                           dc.w $ffff
[000c9d16]                           dc.w $0014
[000c9d18]                           dc.w $0000
[000c9d1a]                           dc.w $0000
[000c9d1c]                           dc.w $0001
[000c9d1e]                           dc.w $1173
[000c9d20]                           dc.w $0010
[000c9d22]                           dc.w $0003
[000c9d24]                           dc.w $0002
[000c9d26]                           dc.w $0001
_09_POP_COLSEL:
[000c9d28]                           dc.w $000a
[000c9d2a]                           dc.w $ffff
[000c9d2c]                           dc.w $ffff
[000c9d2e]                           dc.w $0018
[000c9d30]                           dc.w $0041
[000c9d32]                           dc.w $0000
[000c9d34] 000c9950                  dc.l A_3DBUTTON11
[000c9d38]                           dc.w $0000
[000c9d3a]                           dc.w $0004
[000c9d3c]                           dc.w $0010
[000c9d3e]                           dc.w $0001
_10_POP_COLSEL:
[000c9d40]                           dc.w $000b
[000c9d42]                           dc.w $ffff
[000c9d44]                           dc.w $ffff
[000c9d46]                           dc.w $0014
[000c9d48]                           dc.w $0000
[000c9d4a]                           dc.w $0000
[000c9d4c]                           dc.w $0001
[000c9d4e]                           dc.w $1174
[000c9d50]                           dc.w $0010
[000c9d52]                           dc.w $0004
[000c9d54]                           dc.w $0002
[000c9d56]                           dc.w $0001
_11_POP_COLSEL:
[000c9d58]                           dc.w $000c
[000c9d5a]                           dc.w $ffff
[000c9d5c]                           dc.w $ffff
[000c9d5e]                           dc.w $0018
[000c9d60]                           dc.w $0041
[000c9d62]                           dc.w $0000
[000c9d64] 000c9970                  dc.l A_3DBUTTON12
[000c9d68]                           dc.w $0000
[000c9d6a]                           dc.w $0005
[000c9d6c]                           dc.w $0010
[000c9d6e]                           dc.w $0001
_12_POP_COLSEL:
[000c9d70]                           dc.w $000d
[000c9d72]                           dc.w $ffff
[000c9d74]                           dc.w $ffff
[000c9d76]                           dc.w $0014
[000c9d78]                           dc.w $0000
[000c9d7a]                           dc.w $0000
[000c9d7c]                           dc.w $0001
[000c9d7e]                           dc.w $1175
[000c9d80]                           dc.w $0010
[000c9d82]                           dc.w $0005
[000c9d84]                           dc.w $0002
[000c9d86]                           dc.w $0001
_13_POP_COLSEL:
[000c9d88]                           dc.w $000e
[000c9d8a]                           dc.w $ffff
[000c9d8c]                           dc.w $ffff
[000c9d8e]                           dc.w $0018
[000c9d90]                           dc.w $0041
[000c9d92]                           dc.w $0000
[000c9d94] 000c9990                  dc.l A_3DBUTTON13
[000c9d98]                           dc.w $0000
[000c9d9a]                           dc.w $0006
[000c9d9c]                           dc.w $0010
[000c9d9e]                           dc.w $0001
_14_POP_COLSEL:
[000c9da0]                           dc.w $000f
[000c9da2]                           dc.w $ffff
[000c9da4]                           dc.w $ffff
[000c9da6]                           dc.w $0014
[000c9da8]                           dc.w $0000
[000c9daa]                           dc.w $0000
[000c9dac]                           dc.w $0001
[000c9dae]                           dc.w $1176
[000c9db0]                           dc.w $0010
[000c9db2]                           dc.w $0006
[000c9db4]                           dc.w $0002
[000c9db6]                           dc.w $0001
_15_POP_COLSEL:
[000c9db8]                           dc.w $0010
[000c9dba]                           dc.w $ffff
[000c9dbc]                           dc.w $ffff
[000c9dbe]                           dc.w $0018
[000c9dc0]                           dc.w $0041
[000c9dc2]                           dc.w $0000
[000c9dc4] 000c99b0                  dc.l A_3DBUTTON14
[000c9dc8]                           dc.w $0000
[000c9dca]                           dc.w $0007
[000c9dcc]                           dc.w $0010
[000c9dce]                           dc.w $0001
_16_POP_COLSEL:
[000c9dd0]                           dc.w $0011
[000c9dd2]                           dc.w $ffff
[000c9dd4]                           dc.w $ffff
[000c9dd6]                           dc.w $0014
[000c9dd8]                           dc.w $0000
[000c9dda]                           dc.w $0000
[000c9ddc]                           dc.w $0001
[000c9dde]                           dc.w $1177
[000c9de0]                           dc.w $0010
[000c9de2]                           dc.w $0007
[000c9de4]                           dc.w $0002
[000c9de6]                           dc.w $0001
_17_POP_COLSEL:
[000c9de8]                           dc.w $0012
[000c9dea]                           dc.w $ffff
[000c9dec]                           dc.w $ffff
[000c9dee]                           dc.w $0018
[000c9df0]                           dc.w $0041
[000c9df2]                           dc.w $0000
[000c9df4] 000c99d0                  dc.l A_3DBUTTON15
[000c9df8]                           dc.w $0000
[000c9dfa]                           dc.w $0008
[000c9dfc]                           dc.w $0010
[000c9dfe]                           dc.w $0001
_18_POP_COLSEL:
[000c9e00]                           dc.w $0013
[000c9e02]                           dc.w $ffff
[000c9e04]                           dc.w $ffff
[000c9e06]                           dc.w $0014
[000c9e08]                           dc.w $0000
[000c9e0a]                           dc.w $0000
[000c9e0c]                           dc.w $0001
[000c9e0e]                           dc.w $1178
[000c9e10]                           dc.w $0010
[000c9e12]                           dc.w $0008
[000c9e14]                           dc.w $0002
[000c9e16]                           dc.w $0001
_19_POP_COLSEL:
[000c9e18]                           dc.w $0014
[000c9e1a]                           dc.w $ffff
[000c9e1c]                           dc.w $ffff
[000c9e1e]                           dc.w $0018
[000c9e20]                           dc.w $0041
[000c9e22]                           dc.w $0000
[000c9e24] 000c99f0                  dc.l A_3DBUTTON16
[000c9e28]                           dc.w $0000
[000c9e2a]                           dc.w $0009
[000c9e2c]                           dc.w $0010
[000c9e2e]                           dc.w $0001
_20_POP_COLSEL:
[000c9e30]                           dc.w $0015
[000c9e32]                           dc.w $ffff
[000c9e34]                           dc.w $ffff
[000c9e36]                           dc.w $0014
[000c9e38]                           dc.w $0000
[000c9e3a]                           dc.w $0000
[000c9e3c]                           dc.w $0001
[000c9e3e]                           dc.w $1179
[000c9e40]                           dc.w $0010
[000c9e42]                           dc.w $0009
[000c9e44]                           dc.w $0002
[000c9e46]                           dc.w $0001
_21_POP_COLSEL:
[000c9e48]                           dc.w $0016
[000c9e4a]                           dc.w $ffff
[000c9e4c]                           dc.w $ffff
[000c9e4e]                           dc.w $0018
[000c9e50]                           dc.w $0041
[000c9e52]                           dc.w $0000
[000c9e54] 000c9a10                  dc.l A_3DBUTTON17
[000c9e58]                           dc.w $0000
[000c9e5a]                           dc.w $000a
[000c9e5c]                           dc.w $0010
[000c9e5e]                           dc.w $0001
_22_POP_COLSEL:
[000c9e60]                           dc.w $0017
[000c9e62]                           dc.w $ffff
[000c9e64]                           dc.w $ffff
[000c9e66]                           dc.w $0014
[000c9e68]                           dc.w $0000
[000c9e6a]                           dc.w $0000
[000c9e6c]                           dc.w $0001
[000c9e6e]                           dc.w $117a
[000c9e70]                           dc.w $0010
[000c9e72]                           dc.w $000a
[000c9e74]                           dc.w $0002
[000c9e76]                           dc.w $0001
_23_POP_COLSEL:
[000c9e78]                           dc.w $0018
[000c9e7a]                           dc.w $ffff
[000c9e7c]                           dc.w $ffff
[000c9e7e]                           dc.w $0018
[000c9e80]                           dc.w $0041
[000c9e82]                           dc.w $0000
[000c9e84] 000c9a30                  dc.l A_3DBUTTON18
[000c9e88]                           dc.w $0000
[000c9e8a]                           dc.w $000b
[000c9e8c]                           dc.w $0010
[000c9e8e]                           dc.w $0001
_24_POP_COLSEL:
[000c9e90]                           dc.w $0019
[000c9e92]                           dc.w $ffff
[000c9e94]                           dc.w $ffff
[000c9e96]                           dc.w $0014
[000c9e98]                           dc.w $0000
[000c9e9a]                           dc.w $0000
[000c9e9c]                           dc.w $0001
[000c9e9e]                           dc.w $117b
[000c9ea0]                           dc.w $0010
[000c9ea2]                           dc.w $000b
[000c9ea4]                           dc.w $0002
[000c9ea6]                           dc.w $0001
_25_POP_COLSEL:
[000c9ea8]                           dc.w $001a
[000c9eaa]                           dc.w $ffff
[000c9eac]                           dc.w $ffff
[000c9eae]                           dc.w $0018
[000c9eb0]                           dc.w $0041
[000c9eb2]                           dc.w $0000
[000c9eb4] 000c9a70                  dc.l A_3DBUTTON20
[000c9eb8]                           dc.w $0000
[000c9eba]                           dc.w $000c
[000c9ebc]                           dc.w $0010
[000c9ebe]                           dc.w $0001
_26_POP_COLSEL:
[000c9ec0]                           dc.w $001b
[000c9ec2]                           dc.w $ffff
[000c9ec4]                           dc.w $ffff
[000c9ec6]                           dc.w $0014
[000c9ec8]                           dc.w $0000
[000c9eca]                           dc.w $0000
[000c9ecc]                           dc.w $0001
[000c9ece]                           dc.w $117c
[000c9ed0]                           dc.w $0010
[000c9ed2]                           dc.w $000c
[000c9ed4]                           dc.w $0002
[000c9ed6]                           dc.w $0001
_27_POP_COLSEL:
[000c9ed8]                           dc.w $001c
[000c9eda]                           dc.w $ffff
[000c9edc]                           dc.w $ffff
[000c9ede]                           dc.w $0018
[000c9ee0]                           dc.w $0041
[000c9ee2]                           dc.w $0000
[000c9ee4] 000c9a50                  dc.l A_3DBUTTON19
[000c9ee8]                           dc.w $0000
[000c9eea]                           dc.w $000d
[000c9eec]                           dc.w $0010
[000c9eee]                           dc.w $0001
_28_POP_COLSEL:
[000c9ef0]                           dc.w $001d
[000c9ef2]                           dc.w $ffff
[000c9ef4]                           dc.w $ffff
[000c9ef6]                           dc.w $0014
[000c9ef8]                           dc.w $0000
[000c9efa]                           dc.w $0000
[000c9efc]                           dc.w $0001
[000c9efe]                           dc.w $117d
[000c9f00]                           dc.w $0010
[000c9f02]                           dc.w $000d
[000c9f04]                           dc.w $0002
[000c9f06]                           dc.w $0001
_29_POP_COLSEL:
[000c9f08]                           dc.w $001e
[000c9f0a]                           dc.w $ffff
[000c9f0c]                           dc.w $ffff
[000c9f0e]                           dc.w $0018
[000c9f10]                           dc.w $0041
[000c9f12]                           dc.w $0000
[000c9f14] 000c9a90                  dc.l A_3DBUTTON21
[000c9f18]                           dc.w $0000
[000c9f1a]                           dc.w $000e
[000c9f1c]                           dc.w $0010
[000c9f1e]                           dc.w $0001
_30_POP_COLSEL:
[000c9f20]                           dc.w $001f
[000c9f22]                           dc.w $ffff
[000c9f24]                           dc.w $ffff
[000c9f26]                           dc.w $0014
[000c9f28]                           dc.w $0000
[000c9f2a]                           dc.w $0000
[000c9f2c]                           dc.w $0001
[000c9f2e]                           dc.w $117e
[000c9f30]                           dc.w $0010
[000c9f32]                           dc.w $000e
[000c9f34]                           dc.w $0002
[000c9f36]                           dc.w $0001
_31_POP_COLSEL:
[000c9f38]                           dc.w $0020
[000c9f3a]                           dc.w $ffff
[000c9f3c]                           dc.w $ffff
[000c9f3e]                           dc.w $0018
[000c9f40]                           dc.w $0041
[000c9f42]                           dc.w $0000
[000c9f44] 000c9ab0                  dc.l A_3DBUTTON22
[000c9f48]                           dc.w $0000
[000c9f4a]                           dc.w $000f
[000c9f4c]                           dc.w $0010
[000c9f4e]                           dc.w $0001
_32_POP_COLSEL:
[000c9f50]                           dc.w $0000
[000c9f52]                           dc.w $ffff
[000c9f54]                           dc.w $ffff
[000c9f56]                           dc.w $0014
[000c9f58]                           dc.w $0020
[000c9f5a]                           dc.w $0000
[000c9f5c]                           dc.w $0001
[000c9f5e]                           dc.w $117f
[000c9f60]                           dc.w $0010
[000c9f62]                           dc.w $000f
[000c9f64]                           dc.w $0002
[000c9f66]                           dc.w $0001
POP_HORPOSSEL:
[000c9f68]                           dc.w $ffff
[000c9f6a]                           dc.w $0001
[000c9f6c]                           dc.w $0003
[000c9f6e]                           dc.w $0014
[000c9f70]                           dc.w $0000
[000c9f72]                           dc.w $0020
[000c9f74]                           dc.w $00ff
[000c9f76]                           dc.w $1100
[000c9f78]                           dc.w $0000
[000c9f7a]                           dc.w $0000
[000c9f7c]                           dc.w $000a
[000c9f7e]                           dc.w $0003
_01_POP_HORPOSSEL:
[000c9f80]                           dc.w $0002
[000c9f82]                           dc.w $ffff
[000c9f84]                           dc.w $ffff
[000c9f86]                           dc.w $0018
[000c9f88]                           dc.w $0001
[000c9f8a]                           dc.w $0000
[000c9f8c] 000c9b10                  dc.l A_3DBUTTON27
[000c9f90]                           dc.w $0000
[000c9f92]                           dc.w $0000
[000c9f94]                           dc.w $000a
[000c9f96]                           dc.w $0001
_02_POP_HORPOSSEL:
[000c9f98]                           dc.w $0003
[000c9f9a]                           dc.w $ffff
[000c9f9c]                           dc.w $ffff
[000c9f9e]                           dc.w $0018
[000c9fa0]                           dc.w $0001
[000c9fa2]                           dc.w $0000
[000c9fa4] 000c9b30                  dc.l A_3DBUTTON28
[000c9fa8]                           dc.w $0000
[000c9faa]                           dc.w $0001
[000c9fac]                           dc.w $000a
[000c9fae]                           dc.w $0001
_03_POP_HORPOSSEL:
[000c9fb0]                           dc.w $0000
[000c9fb2]                           dc.w $ffff
[000c9fb4]                           dc.w $ffff
[000c9fb6]                           dc.w $0018
[000c9fb8]                           dc.w $0021
[000c9fba]                           dc.w $0000
[000c9fbc] 000c9b50                  dc.l A_3DBUTTON29
[000c9fc0]                           dc.w $0000
[000c9fc2]                           dc.w $0002
[000c9fc4]                           dc.w $000a
[000c9fc6]                           dc.w $0001
POP_PATSEL:
[000c9fc8]                           dc.w $ffff
[000c9fca]                           dc.w $0001
[000c9fcc]                           dc.w $0008
[000c9fce]                           dc.w $0014
[000c9fd0]                           dc.w $0000
[000c9fd2]                           dc.w $0020
[000c9fd4]                           dc.w $00ff
[000c9fd6]                           dc.w $1100
[000c9fd8]                           dc.w $0000
[000c9fda]                           dc.w $0000
[000c9fdc]                           dc.w $0012
[000c9fde]                           dc.w $0008
_01_POP_PATSEL:
[000c9fe0]                           dc.w $0002
[000c9fe2]                           dc.w $ffff
[000c9fe4]                           dc.w $ffff
[000c9fe6]                           dc.w $0014
[000c9fe8]                           dc.w $0001
[000c9fea]                           dc.w $0000
[000c9fec]                           dc.w $0001
[000c9fee]                           dc.w $1101
[000c9ff0]                           dc.w $0000
[000c9ff2]                           dc.w $0000
[000c9ff4]                           dc.w $0012
[000c9ff6]                           dc.w $0001
_02_POP_PATSEL:
[000c9ff8]                           dc.w $0003
[000c9ffa]                           dc.w $ffff
[000c9ffc]                           dc.w $ffff
[000c9ffe]                           dc.w $0014
[000ca000]                           dc.w $0001
[000ca002]                           dc.w $0000
[000ca004]                           dc.w $0001
[000ca006]                           dc.w $1111
[000ca008]                           dc.w $0000
[000ca00a]                           dc.w $0001
[000ca00c]                           dc.w $0012
[000ca00e]                           dc.w $0001
_03_POP_PATSEL:
[000ca010]                           dc.w $0004
[000ca012]                           dc.w $ffff
[000ca014]                           dc.w $ffff
[000ca016]                           dc.w $0014
[000ca018]                           dc.w $0001
[000ca01a]                           dc.w $0000
[000ca01c]                           dc.w $0001
[000ca01e]                           dc.w $1121
[000ca020]                           dc.w $0000
[000ca022]                           dc.w $0002
[000ca024]                           dc.w $0012
[000ca026]                           dc.w $0001
_04_POP_PATSEL:
[000ca028]                           dc.w $0005
[000ca02a]                           dc.w $ffff
[000ca02c]                           dc.w $ffff
[000ca02e]                           dc.w $0014
[000ca030]                           dc.w $0001
[000ca032]                           dc.w $0000
[000ca034]                           dc.w $0001
[000ca036]                           dc.w $1131
[000ca038]                           dc.w $0000
[000ca03a]                           dc.w $0003
[000ca03c]                           dc.w $0012
[000ca03e]                           dc.w $0001
_05_POP_PATSEL:
[000ca040]                           dc.w $0006
[000ca042]                           dc.w $ffff
[000ca044]                           dc.w $ffff
[000ca046]                           dc.w $0014
[000ca048]                           dc.w $0001
[000ca04a]                           dc.w $0000
[000ca04c]                           dc.w $0001
[000ca04e]                           dc.w $1141
[000ca050]                           dc.w $0000
[000ca052]                           dc.w $0004
[000ca054]                           dc.w $0012
[000ca056]                           dc.w $0001
_06_POP_PATSEL:
[000ca058]                           dc.w $0007
[000ca05a]                           dc.w $ffff
[000ca05c]                           dc.w $ffff
[000ca05e]                           dc.w $0014
[000ca060]                           dc.w $0001
[000ca062]                           dc.w $0000
[000ca064]                           dc.w $0001
[000ca066]                           dc.w $1151
[000ca068]                           dc.w $0000
[000ca06a]                           dc.w $0005
[000ca06c]                           dc.w $0012
[000ca06e]                           dc.w $0001
_07_POP_PATSEL:
[000ca070]                           dc.w $0008
[000ca072]                           dc.w $ffff
[000ca074]                           dc.w $ffff
[000ca076]                           dc.w $0014
[000ca078]                           dc.w $0001
[000ca07a]                           dc.w $0000
[000ca07c]                           dc.w $0001
[000ca07e]                           dc.w $1161
[000ca080]                           dc.w $0000
[000ca082]                           dc.w $0006
[000ca084]                           dc.w $0012
[000ca086]                           dc.w $0001
_08_POP_PATSEL:
[000ca088]                           dc.w $0000
[000ca08a]                           dc.w $ffff
[000ca08c]                           dc.w $ffff
[000ca08e]                           dc.w $0014
[000ca090]                           dc.w $0021
[000ca092]                           dc.w $0000
[000ca094]                           dc.w $0001
[000ca096]                           dc.w $1171
[000ca098]                           dc.w $0000
[000ca09a]                           dc.w $0007
[000ca09c]                           dc.w $0012
[000ca09e]                           dc.w $0001
POP_SIZESEL:
[000ca0a0]                           dc.w $ffff
[000ca0a2]                           dc.w $0001
[000ca0a4]                           dc.w $0002
[000ca0a6]                           dc.w $0014
[000ca0a8]                           dc.w $0000
[000ca0aa]                           dc.w $0020
[000ca0ac]                           dc.w $00ff
[000ca0ae]                           dc.w $1100
[000ca0b0]                           dc.w $0000
[000ca0b2]                           dc.w $0000
[000ca0b4]                           dc.w $0008
[000ca0b6]                           dc.w $0002
_01_POP_SIZESEL:
[000ca0b8]                           dc.w $0002
[000ca0ba]                           dc.w $ffff
[000ca0bc]                           dc.w $ffff
[000ca0be]                           dc.w $0018
[000ca0c0]                           dc.w $0001
[000ca0c2]                           dc.w $0000
[000ca0c4] 000c9af0                  dc.l A_3DBUTTON25
[000ca0c8]                           dc.w $0000
[000ca0ca]                           dc.w $0000
[000ca0cc]                           dc.w $0008
[000ca0ce]                           dc.w $0001
_02_POP_SIZESEL:
[000ca0d0]                           dc.w $0000
[000ca0d2]                           dc.w $ffff
[000ca0d4]                           dc.w $ffff
[000ca0d6]                           dc.w $0018
[000ca0d8]                           dc.w $0021
[000ca0da]                           dc.w $0000
[000ca0dc] 000c9b90                  dc.l A_3DBUTTON31
[000ca0e0]                           dc.w $0000
[000ca0e2]                           dc.w $0001
[000ca0e4]                           dc.w $0008
[000ca0e6]                           dc.w $0001
POP_TYPESEL:
[000ca0e8]                           dc.w $ffff
[000ca0ea]                           dc.w $0001
[000ca0ec]                           dc.w $0003
[000ca0ee]                           dc.w $0014
[000ca0f0]                           dc.w $0000
[000ca0f2]                           dc.w $0020
[000ca0f4]                           dc.w $00ff
[000ca0f6]                           dc.w $1100
[000ca0f8]                           dc.w $0000
[000ca0fa]                           dc.w $0000
[000ca0fc]                           dc.w $000b
[000ca0fe]                           dc.w $0003
_01_POP_TYPESEL:
[000ca100]                           dc.w $0002
[000ca102]                           dc.w $ffff
[000ca104]                           dc.w $ffff
[000ca106]                           dc.w $0018
[000ca108]                           dc.w $0041
[000ca10a]                           dc.w $0000
[000ca10c] 000c9810                  dc.l A_3DBUTTON01
[000ca110]                           dc.w $0000
[000ca112]                           dc.w $0000
[000ca114]                           dc.w $000b
[000ca116]                           dc.w $0001
_02_POP_TYPESEL:
[000ca118]                           dc.w $0003
[000ca11a]                           dc.w $ffff
[000ca11c]                           dc.w $ffff
[000ca11e]                           dc.w $0018
[000ca120]                           dc.w $0041
[000ca122]                           dc.w $0000
[000ca124] 000c9870                  dc.l A_3DBUTTON04
[000ca128]                           dc.w $0000
[000ca12a]                           dc.w $0001
[000ca12c]                           dc.w $000b
[000ca12e]                           dc.w $0001
_03_POP_TYPESEL:
[000ca130]                           dc.w $0000
[000ca132]                           dc.w $ffff
[000ca134]                           dc.w $ffff
[000ca136]                           dc.w $0018
[000ca138]                           dc.w $0061
[000ca13a]                           dc.w $0000
[000ca13c] 000c98f0                  dc.l A_3DBUTTON08
[000ca140]                           dc.w $0000
[000ca142]                           dc.w $0002
[000ca144]                           dc.w $000b
[000ca146]                           dc.w $0001
ED_BOX:
[000ca148]                           dc.w $ffff
[000ca14a]                           dc.w $0001
[000ca14c]                           dc.w $0030
[000ca14e]                           dc.w $0018
[000ca150]                           dc.w $0040
[000ca152]                           dc.w $0010
[000ca154] 000c9890                  dc.l A_3DBUTTON05
[000ca158]                           dc.w $0000
[000ca15a]                           dc.w $0000
[000ca15c]                           dc.w $003c
[000ca15e]                           dc.w $000c
_01_ED_BOX:
[000ca160]                           dc.w $0003
[000ca162]                           dc.w $0002
[000ca164]                           dc.w $0002
[000ca166]                           dc.w $0018
[000ca168]                           dc.w $0040
[000ca16a]                           dc.w $0000
[000ca16c] 000c9b70                  dc.l A_3DBUTTON30
[000ca170]                           dc.w $0000
[000ca172]                           dc.w $0000
[000ca174]                           dc.w $0009
[000ca176]                           dc.w $0004
_02_ED_BOX:
[000ca178]                           dc.w $0001
[000ca17a]                           dc.w $ffff
[000ca17c]                           dc.w $ffff
[000ca17e]                           dc.w $001b
[000ca180]                           dc.w $0040
[000ca182]                           dc.w $0000
[000ca184]                           dc.w $43ff
[000ca186]                           dc.w $1101
[000ca188]                           dc.w $0001
[000ca18a]                           dc.w $0001
[000ca18c]                           dc.w $0007
[000ca18e]                           dc.w $0002
_03_ED_BOX:
[000ca190]                           dc.w $0005
[000ca192]                           dc.w $0004
[000ca194]                           dc.w $0004
[000ca196]                           dc.w $001c
[000ca198]                           dc.w $0040
[000ca19a]                           dc.w $0000
[000ca19c] 000c97b0                  dc.l TEXT_04
[000ca1a0]                           dc.w $000b
[000ca1a2]                           dc.w $0001
[000ca1a4]                           dc.w $0005
[000ca1a6]                           dc.w $0001
_04_ED_BOX:
[000ca1a8]                           dc.w $0003
[000ca1aa]                           dc.w $ffff
[000ca1ac]                           dc.w $ffff
[000ca1ae]                           dc.w $0018
[000ca1b0]                           dc.w $0040
[000ca1b2]                           dc.w $0000
[000ca1b4] 000c9bb0                  dc.l A_ARROWS02
[000ca1b8]                           dc.w $0000
[000ca1ba]                           dc.w $0000
[000ca1bc]                           dc.w $0001
[000ca1be]                           dc.w $0001
_05_ED_BOX:
[000ca1c0]                           dc.w $0008
[000ca1c2]                           dc.w $0007
[000ca1c4]                           dc.w $0007
[000ca1c6]                           dc.w $0014
[000ca1c8]                           dc.w $0040
[000ca1ca]                           dc.w $0020
[000ca1cc]                           dc.w $00ff
[000ca1ce]                           dc.w $1101
[000ca1d0]                           dc.w $0010
[000ca1d2]                           dc.w $0001
[000ca1d4]                           dc.w $000b
[000ca1d6]                           dc.w $0001
_05aED_BOX:
[000ca1d8] 0003126a                  dc.l edbo_type
[000ca1dc]                           dc.w $0000
[000ca1de]                           dc.w $0000
[000ca1e0]                           dc.w $8000
[000ca1e2]                           dc.w $8854
[000ca1e4]                           dc.w $0000
[000ca1e6]                           dc.w $0000
[000ca1e8]                           dc.w $0000
[000ca1ea]                           dc.w $0000
[000ca1ec]                           dc.w $0000
[000ca1ee]                           dc.w $0000
_07_ED_BOX:
[000ca1f0]                           dc.w $0005
[000ca1f2]                           dc.w $ffff
[000ca1f4]                           dc.w $ffff
[000ca1f6]                           dc.w $0018
[000ca1f8]                           dc.w $0000
[000ca1fa]                           dc.w $0000
[000ca1fc] 000c9ad0                  dc.l A_3DBUTTON23
[000ca200]                           dc.w $0000
[000ca202]                           dc.w $0000
[000ca204]                           dc.w $000b
[000ca206]                           dc.w $0001
_08_ED_BOX:
[000ca208]                           dc.w $000a
[000ca20a]                           dc.w $ffff
[000ca20c]                           dc.w $ffff
[000ca20e]                           dc.w $0018
[000ca210]                           dc.w $4007
[000ca212]                           dc.w $0010
[000ca214] 000c9830                  dc.l A_3DBUTTON02
[000ca218]                           dc.w $0021
[000ca21a]                           dc.w $0001
[000ca21c]                           dc.w $000c
[000ca21e]                           dc.w $0002
_08aED_BOX:
[000ca220] 00031398                  dc.l edbo_ok
[000ca224]                           dc.w $0000
[000ca226]                           dc.w $0000
[000ca228]                           dc.w $8000
[000ca22a]                           dc.w $884f
[000ca22c]                           dc.w $0000
[000ca22e]                           dc.w $0000
[000ca230]                           dc.w $0000
[000ca232]                           dc.w $0000
[000ca234]                           dc.w $0000
[000ca236]                           dc.w $0000
_10_ED_BOX:
[000ca238]                           dc.w $000c
[000ca23a]                           dc.w $ffff
[000ca23c]                           dc.w $ffff
[000ca23e]                           dc.w $0018
[000ca240]                           dc.w $4005
[000ca242]                           dc.w $0010
[000ca244] 000c98b0                  dc.l A_3DBUTTON06
[000ca248]                           dc.w $002f
[000ca24a]                           dc.w $0001
[000ca24c]                           dc.w $000c
[000ca24e]                           dc.w $0002
_10aED_BOX:
[000ca250] 0002f27c                  dc.l ed_abort
[000ca254]                           dc.w $0000
[000ca256]                           dc.w $0000
[000ca258]                           dc.w $8000
[000ca25a]                           dc.w $8841
[000ca25c]                           dc.w $0000
[000ca25e]                           dc.w $0000
[000ca260]                           dc.w $0000
[000ca262]                           dc.w $0000
[000ca264]                           dc.w $0000
[000ca266]                           dc.w $0000
_12_ED_BOX:
[000ca268]                           dc.w $001a
[000ca26a]                           dc.w $000d
[000ca26c]                           dc.w $0019
[000ca26e]                           dc.w $0018
[000ca270]                           dc.w $0040
[000ca272]                           dc.w $0000
[000ca274] 000c9c30                  dc.l A_INNERFRAME05
[000ca278]                           dc.w $0001
[000ca27a]                           dc.w $0004
[000ca27c]                           dc.w $003a
[000ca27e]                           dc.w $0003
_13_ED_BOX:
[000ca280]                           dc.w $0011
[000ca282]                           dc.w $000f
[000ca284]                           dc.w $0010
[000ca286]                           dc.w $0014
[000ca288]                           dc.w $0040
[000ca28a]                           dc.w $0020
[000ca28c]                           dc.w $00ff
[000ca28e]                           dc.w $1101
[000ca290]                           dc.w $0008
[000ca292]                           dc.w $0001
[000ca294]                           dc.w $0012
[000ca296]                           dc.w $0001
_13aED_BOX:
[000ca298] 00031202                  dc.l edbo_textcol
[000ca29c]                           dc.w $0000
[000ca29e]                           dc.w $0000
[000ca2a0]                           dc.w $8000
[000ca2a2]                           dc.w $8846
[000ca2a4]                           dc.w $0000
[000ca2a6]                           dc.w $0000
[000ca2a8]                           dc.w $0000
[000ca2aa]                           dc.w $0000
[000ca2ac]                           dc.w $0000
[000ca2ae]                           dc.w $0000
_15_ED_BOX:
[000ca2b0]                           dc.w $0010
[000ca2b2]                           dc.w $ffff
[000ca2b4]                           dc.w $ffff
[000ca2b6]                           dc.w $0014
[000ca2b8]                           dc.w $0000
[000ca2ba]                           dc.w $0000
[000ca2bc]                           dc.w $0001
[000ca2be]                           dc.w $1171
[000ca2c0]                           dc.w $0010
[000ca2c2]                           dc.w $0000
[000ca2c4]                           dc.w $0002
[000ca2c6]                           dc.w $0001
_16_ED_BOX:
[000ca2c8]                           dc.w $000d
[000ca2ca]                           dc.w $ffff
[000ca2cc]                           dc.w $ffff
[000ca2ce]                           dc.w $0018
[000ca2d0]                           dc.w $0000
[000ca2d2]                           dc.w $0000
[000ca2d4] 000c9ad0                  dc.l A_3DBUTTON23
[000ca2d8]                           dc.w $0000
[000ca2da]                           dc.w $0000
[000ca2dc]                           dc.w $0010
[000ca2de]                           dc.w $0001
_17_ED_BOX:
[000ca2e0]                           dc.w $0013
[000ca2e2]                           dc.w $ffff
[000ca2e4]                           dc.w $ffff
[000ca2e6]                           dc.w $001b
[000ca2e8]                           dc.w $0005
[000ca2ea]                           dc.w $0000
[000ca2ec]                           dc.w $43ff
[000ca2ee]                           dc.w $1121
[000ca2f0]                           dc.w $0024
[000ca2f2]                           dc.w $0001
[000ca2f4]                           dc.w $0003
[000ca2f6]                           dc.w $0001
_17aED_BOX:
[000ca2f8] 00031252                  dc.l edbo_trans
[000ca2fc]                           dc.w $0000
[000ca2fe]                           dc.w $0000
[000ca300]                           dc.w $8000
[000ca302]                           dc.w $0000
[000ca304]                           dc.w $0000
[000ca306]                           dc.w $0000
[000ca308]                           dc.w $0000
[000ca30a]                           dc.w $0000
[000ca30c]                           dc.w $0000
[000ca30e]                           dc.w $0000
_19_ED_BOX:
[000ca310]                           dc.w $0015
[000ca312]                           dc.w $ffff
[000ca314]                           dc.w $ffff
[000ca316]                           dc.w $001b
[000ca318]                           dc.w $0005
[000ca31a]                           dc.w $0000
[000ca31c]                           dc.w $43ff
[000ca31e]                           dc.w $11a1
[000ca320]                           dc.w $0028
[000ca322]                           dc.w $0001
[000ca324]                           dc.w $0003
[000ca326]                           dc.w $0001
_19aED_BOX:
[000ca328] 000311e4                  dc.l edbo_replace
[000ca32c]                           dc.w $0000
[000ca32e]                           dc.w $0000
[000ca330]                           dc.w $8000
[000ca332]                           dc.w $0000
[000ca334]                           dc.w $0000
[000ca336]                           dc.w $0000
[000ca338]                           dc.w $0000
[000ca33a]                           dc.w $0000
[000ca33c]                           dc.w $0000
[000ca33e]                           dc.w $0000
_21_ED_BOX:
[000ca340]                           dc.w $0016
[000ca342]                           dc.w $ffff
[000ca344]                           dc.w $ffff
[000ca346]                           dc.w $0018
[000ca348]                           dc.w $0008
[000ca34a]                           dc.w $0010
[000ca34c] 000c9bd0                  dc.l A_BOXED01
[000ca350]                           dc.w $0037
[000ca352]                           dc.w $0001
[000ca354]                           dc.w $0001
[000ca356]                           dc.w $0001
_22_ED_BOX:
[000ca358]                           dc.w $0018
[000ca35a]                           dc.w $0017
[000ca35c]                           dc.w $0017
[000ca35e]                           dc.w $001c
[000ca360]                           dc.w $0040
[000ca362]                           dc.w $0000
[000ca364] 000c97c9                  dc.l TEXT_13
[000ca368]                           dc.w $0001
[000ca36a]                           dc.w $0001
[000ca36c]                           dc.w $0006
[000ca36e]                           dc.w $0001
_23_ED_BOX:
[000ca370]                           dc.w $0016
[000ca372]                           dc.w $ffff
[000ca374]                           dc.w $ffff
[000ca376]                           dc.w $0018
[000ca378]                           dc.w $0040
[000ca37a]                           dc.w $0000
[000ca37c] 000c9bb0                  dc.l A_ARROWS02
[000ca380]                           dc.w $0000
[000ca382]                           dc.w $0000
[000ca384]                           dc.w $0001
[000ca386]                           dc.w $0001
_24_ED_BOX:
[000ca388]                           dc.w $0019
[000ca38a]                           dc.w $ffff
[000ca38c]                           dc.w $ffff
[000ca38e]                           dc.w $001c
[000ca390]                           dc.w $0040
[000ca392]                           dc.w $0000
[000ca394] 000c97a0                  dc.l TEXT_02
[000ca398]                           dc.w $001d
[000ca39a]                           dc.w $0001
[000ca39c]                           dc.w $0006
[000ca39e]                           dc.w $0001
_25_ED_BOX:
[000ca3a0]                           dc.w $000c
[000ca3a2]                           dc.w $ffff
[000ca3a4]                           dc.w $ffff
[000ca3a6]                           dc.w $001c
[000ca3a8]                           dc.w $0040
[000ca3aa]                           dc.w $0000
[000ca3ac] 000c97a7                  dc.l TEXT_03
[000ca3b0]                           dc.w $002e
[000ca3b2]                           dc.w $0001
[000ca3b4]                           dc.w $0008
[000ca3b6]                           dc.w $0001
_26_ED_BOX:
[000ca3b8]                           dc.w $0030
[000ca3ba]                           dc.w $001b
[000ca3bc]                           dc.w $002f
[000ca3be]                           dc.w $0018
[000ca3c0]                           dc.w $0040
[000ca3c2]                           dc.w $0000
[000ca3c4] 000c9c10                  dc.l A_INNERFRAME04
[000ca3c8]                           dc.w $0001
[000ca3ca]                           dc.w $0007
[000ca3cc]                           dc.w $001e
[000ca3ce]                           dc.w $0005
_27_ED_BOX:
[000ca3d0]                           dc.w $001d
[000ca3d2]                           dc.w $ffff
[000ca3d4]                           dc.w $ffff
[000ca3d6]                           dc.w $0014
[000ca3d8]                           dc.w $0005
[000ca3da]                           dc.w $0000
[000ca3dc]                           dc.w $0003
[000ca3de]                           dc.w $1111
[000ca3e0]                           dc.w $0008
[000ca3e2]                           dc.w $0003
[000ca3e4]                           dc.w $0002
[000ca3e6]                           dc.w $0001
_27aED_BOX:
[000ca3e8] 00031582                  dc.l edbo_th
[000ca3ec]                           dc.w $0000
[000ca3ee]                           dc.w $0000
[000ca3f0]                           dc.w $8000
[000ca3f2]                           dc.w $0000
[000ca3f4]                           dc.w $0000
[000ca3f6]                           dc.w $0000
[000ca3f8]                           dc.w $0000
[000ca3fa]                           dc.w $0000
[000ca3fc]                           dc.w $0000
[000ca3fe]                           dc.w $0000
_29_ED_BOX:
[000ca400]                           dc.w $001f
[000ca402]                           dc.w $ffff
[000ca404]                           dc.w $ffff
[000ca406]                           dc.w $0014
[000ca408]                           dc.w $0005
[000ca40a]                           dc.w $0000
[000ca40c]                           dc.w $0002
[000ca40e]                           dc.w $1111
[000ca410]                           dc.w $000b
[000ca412]                           dc.w $0003
[000ca414]                           dc.w $0002
[000ca416]                           dc.w $0001
_29aED_BOX:
[000ca418] 00031582                  dc.l edbo_th
[000ca41c]                           dc.w $0000
[000ca41e]                           dc.w $0000
[000ca420]                           dc.w $8000
[000ca422]                           dc.w $0000
[000ca424]                           dc.w $0000
[000ca426]                           dc.w $0000
[000ca428]                           dc.w $0000
[000ca42a]                           dc.w $0000
[000ca42c]                           dc.w $0000
[000ca42e]                           dc.w $0000
_31_ED_BOX:
[000ca430]                           dc.w $0021
[000ca432]                           dc.w $ffff
[000ca434]                           dc.w $ffff
[000ca436]                           dc.w $0014
[000ca438]                           dc.w $0005
[000ca43a]                           dc.w $0000
[000ca43c]                           dc.w $0001
[000ca43e]                           dc.w $1111
[000ca440]                           dc.w $000e
[000ca442]                           dc.w $0003
[000ca444]                           dc.w $0002
[000ca446]                           dc.w $0001
_31aED_BOX:
[000ca448] 00031582                  dc.l edbo_th
[000ca44c]                           dc.w $0000
[000ca44e]                           dc.w $0000
[000ca450]                           dc.w $8000
[000ca452]                           dc.w $0000
[000ca454]                           dc.w $0000
[000ca456]                           dc.w $0000
[000ca458]                           dc.w $0000
[000ca45a]                           dc.w $0000
[000ca45c]                           dc.w $0000
[000ca45e]                           dc.w $0000
_33_ED_BOX:
[000ca460]                           dc.w $0023
[000ca462]                           dc.w $ffff
[000ca464]                           dc.w $ffff
[000ca466]                           dc.w $0014
[000ca468]                           dc.w $0005
[000ca46a]                           dc.w $0000
[000ca46c]                           dc.w $0000
[000ca46e]                           dc.w $1111
[000ca470]                           dc.w $0011
[000ca472]                           dc.w $0003
[000ca474]                           dc.w $0002
[000ca476]                           dc.w $0001
_33aED_BOX:
[000ca478] 00031582                  dc.l edbo_th
[000ca47c]                           dc.w $0000
[000ca47e]                           dc.w $0000
[000ca480]                           dc.w $8000
[000ca482]                           dc.w $0000
[000ca484]                           dc.w $0000
[000ca486]                           dc.w $0000
[000ca488]                           dc.w $0000
[000ca48a]                           dc.w $0000
[000ca48c]                           dc.w $0000
[000ca48e]                           dc.w $0000
_35_ED_BOX:
[000ca490]                           dc.w $0025
[000ca492]                           dc.w $ffff
[000ca494]                           dc.w $ffff
[000ca496]                           dc.w $0014
[000ca498]                           dc.w $0005
[000ca49a]                           dc.w $0000
[000ca49c]                           dc.w $00ff
[000ca49e]                           dc.w $1111
[000ca4a0]                           dc.w $0014
[000ca4a2]                           dc.w $0003
[000ca4a4]                           dc.w $0002
[000ca4a6]                           dc.w $0001
_35aED_BOX:
[000ca4a8] 00031582                  dc.l edbo_th
[000ca4ac]                           dc.w $0000
[000ca4ae]                           dc.w $0000
[000ca4b0]                           dc.w $8000
[000ca4b2]                           dc.w $0000
[000ca4b4]                           dc.w $0000
[000ca4b6]                           dc.w $0000
[000ca4b8]                           dc.w $0000
[000ca4ba]                           dc.w $0000
[000ca4bc]                           dc.w $0000
[000ca4be]                           dc.w $0000
_37_ED_BOX:
[000ca4c0]                           dc.w $0027
[000ca4c2]                           dc.w $ffff
[000ca4c4]                           dc.w $ffff
[000ca4c6]                           dc.w $0014
[000ca4c8]                           dc.w $0005
[000ca4ca]                           dc.w $0000
[000ca4cc]                           dc.w $00fe
[000ca4ce]                           dc.w $1111
[000ca4d0]                           dc.w $0017
[000ca4d2]                           dc.w $0003
[000ca4d4]                           dc.w $0002
[000ca4d6]                           dc.w $0001
_37aED_BOX:
[000ca4d8] 00031582                  dc.l edbo_th
[000ca4dc]                           dc.w $0000
[000ca4de]                           dc.w $0000
[000ca4e0]                           dc.w $8000
[000ca4e2]                           dc.w $0000
[000ca4e4]                           dc.w $0000
[000ca4e6]                           dc.w $0000
[000ca4e8]                           dc.w $0000
[000ca4ea]                           dc.w $0000
[000ca4ec]                           dc.w $0000
[000ca4ee]                           dc.w $0000
_39_ED_BOX:
[000ca4f0]                           dc.w $0029
[000ca4f2]                           dc.w $ffff
[000ca4f4]                           dc.w $ffff
[000ca4f6]                           dc.w $0014
[000ca4f8]                           dc.w $0005
[000ca4fa]                           dc.w $0000
[000ca4fc]                           dc.w $00fd
[000ca4fe]                           dc.w $1111
[000ca500]                           dc.w $001a
[000ca502]                           dc.w $0003
[000ca504]                           dc.w $0002
[000ca506]                           dc.w $0001
_39aED_BOX:
[000ca508] 00031582                  dc.l edbo_th
[000ca50c]                           dc.w $0000
[000ca50e]                           dc.w $0000
[000ca510]                           dc.w $8000
[000ca512]                           dc.w $0000
[000ca514]                           dc.w $0000
[000ca516]                           dc.w $0000
[000ca518]                           dc.w $0000
[000ca51a]                           dc.w $0000
[000ca51c]                           dc.w $0000
[000ca51e]                           dc.w $0000
_41_ED_BOX:
[000ca520]                           dc.w $002d
[000ca522]                           dc.w $002b
[000ca524]                           dc.w $002c
[000ca526]                           dc.w $0014
[000ca528]                           dc.w $0040
[000ca52a]                           dc.w $0020
[000ca52c]                           dc.w $00ff
[000ca52e]                           dc.w $1101
[000ca530]                           dc.w $0008
[000ca532]                           dc.w $0001
[000ca534]                           dc.w $0012
[000ca536]                           dc.w $0001
_41aED_BOX:
[000ca538] 00031060                  dc.l edbo_framecol
[000ca53c]                           dc.w $0000
[000ca53e]                           dc.w $0000
[000ca540]                           dc.w $8000
[000ca542]                           dc.w $8852
[000ca544]                           dc.w $0000
[000ca546]                           dc.w $0000
[000ca548]                           dc.w $0000
[000ca54a]                           dc.w $0000
[000ca54c]                           dc.w $0000
[000ca54e]                           dc.w $0000
_43_ED_BOX:
[000ca550]                           dc.w $002c
[000ca552]                           dc.w $ffff
[000ca554]                           dc.w $ffff
[000ca556]                           dc.w $0014
[000ca558]                           dc.w $0000
[000ca55a]                           dc.w $0000
[000ca55c]                           dc.w $4301
[000ca55e]                           dc.w $1371
[000ca560]                           dc.w $0010
[000ca562]                           dc.w $0000
[000ca564]                           dc.w $0002
[000ca566]                           dc.w $0001
_44_ED_BOX:
[000ca568]                           dc.w $0029
[000ca56a]                           dc.w $ffff
[000ca56c]                           dc.w $ffff
[000ca56e]                           dc.w $0018
[000ca570]                           dc.w $0000
[000ca572]                           dc.w $0000
[000ca574] 000c9ad0                  dc.l A_3DBUTTON23
[000ca578]                           dc.w $0000
[000ca57a]                           dc.w $0000
[000ca57c]                           dc.w $0010
[000ca57e]                           dc.w $0001
_45_ED_BOX:
[000ca580]                           dc.w $002f
[000ca582]                           dc.w $002e
[000ca584]                           dc.w $002e
[000ca586]                           dc.w $001c
[000ca588]                           dc.w $0040
[000ca58a]                           dc.w $0000
[000ca58c] 000c97c9                  dc.l TEXT_13
[000ca590]                           dc.w $0001
[000ca592]                           dc.w $0001
[000ca594]                           dc.w $0006
[000ca596]                           dc.w $0001
_46_ED_BOX:
[000ca598]                           dc.w $002d
[000ca59a]                           dc.w $ffff
[000ca59c]                           dc.w $ffff
[000ca59e]                           dc.w $0018
[000ca5a0]                           dc.w $0040
[000ca5a2]                           dc.w $0000
[000ca5a4] 000c9bb0                  dc.l A_ARROWS02
[000ca5a8]                           dc.w $0002
[000ca5aa]                           dc.w $0000
[000ca5ac]                           dc.w $0001
[000ca5ae]                           dc.w $0001
_47_ED_BOX:
[000ca5b0]                           dc.w $001a
[000ca5b2]                           dc.w $ffff
[000ca5b4]                           dc.w $ffff
[000ca5b6]                           dc.w $001c
[000ca5b8]                           dc.w $0040
[000ca5ba]                           dc.w $0000
[000ca5bc] 000c97b5                  dc.l TEXT_05
[000ca5c0]                           dc.w $0002
[000ca5c2]                           dc.w $0003
[000ca5c4]                           dc.w $0006
[000ca5c6]                           dc.w $0001
_48_ED_BOX:
[000ca5c8]                           dc.w $0000
[000ca5ca]                           dc.w $0031
[000ca5cc]                           dc.w $0039
[000ca5ce]                           dc.w $0018
[000ca5d0]                           dc.w $0000
[000ca5d2]                           dc.w $0000
[000ca5d4] 000c9bf0                  dc.l A_INNERFRAME01
[000ca5d8]                           dc.w $001f
[000ca5da]                           dc.w $0007
[000ca5dc]                           dc.w $001c
[000ca5de]                           dc.w $0005
_49_ED_BOX:
[000ca5e0]                           dc.w $0033
[000ca5e2]                           dc.w $ffff
[000ca5e4]                           dc.w $ffff
[000ca5e6]                           dc.w $0014
[000ca5e8]                           dc.w $0040
[000ca5ea]                           dc.w $0020
[000ca5ec]                           dc.w $00ff
[000ca5ee]                           dc.w $1101
[000ca5f0]                           dc.w $0009
[000ca5f2]                           dc.w $0001
[000ca5f4]                           dc.w $0012
[000ca5f6]                           dc.w $0001
_49aED_BOX:
[000ca5f8] 000310fe                  dc.l edbo_pattern
[000ca5fc]                           dc.w $0000
[000ca5fe]                           dc.w $0000
[000ca600]                           dc.w $8000
[000ca602]                           dc.w $884d
[000ca604]                           dc.w $0000
[000ca606]                           dc.w $0000
[000ca608]                           dc.w $0000
[000ca60a]                           dc.w $0000
[000ca60c]                           dc.w $0000
[000ca60e]                           dc.w $0000
_51_ED_BOX:
[000ca610]                           dc.w $0037
[000ca612]                           dc.w $0035
[000ca614]                           dc.w $0036
[000ca616]                           dc.w $0014
[000ca618]                           dc.w $0040
[000ca61a]                           dc.w $0020
[000ca61c]                           dc.w $00ff
[000ca61e]                           dc.w $1101
[000ca620]                           dc.w $0009
[000ca622]                           dc.w $0003
[000ca624]                           dc.w $0012
[000ca626]                           dc.w $0001
_51aED_BOX:
[000ca628] 000310b4                  dc.l edbo_intercol
[000ca62c]                           dc.w $0000
[000ca62e]                           dc.w $0000
[000ca630]                           dc.w $8000
[000ca632]                           dc.w $8842
[000ca634]                           dc.w $0000
[000ca636]                           dc.w $0000
[000ca638]                           dc.w $0000
[000ca63a]                           dc.w $0000
[000ca63c]                           dc.w $0000
[000ca63e]                           dc.w $0000
_53_ED_BOX:
[000ca640]                           dc.w $0036
[000ca642]                           dc.w $ffff
[000ca644]                           dc.w $ffff
[000ca646]                           dc.w $0014
[000ca648]                           dc.w $0000
[000ca64a]                           dc.w $0000
[000ca64c]                           dc.w $0001
[000ca64e]                           dc.w $1171
[000ca650]                           dc.w $0010
[000ca652]                           dc.w $0000
[000ca654]                           dc.w $0002
[000ca656]                           dc.w $0001
_54_ED_BOX:
[000ca658]                           dc.w $0033
[000ca65a]                           dc.w $ffff
[000ca65c]                           dc.w $ffff
[000ca65e]                           dc.w $0018
[000ca660]                           dc.w $0000
[000ca662]                           dc.w $0000
[000ca664] 000c9ad0                  dc.l A_3DBUTTON23
[000ca668]                           dc.w $0000
[000ca66a]                           dc.w $0000
[000ca66c]                           dc.w $0010
[000ca66e]                           dc.w $0001
_55_ED_BOX:
[000ca670]                           dc.w $0039
[000ca672]                           dc.w $0038
[000ca674]                           dc.w $0038
[000ca676]                           dc.w $001c
[000ca678]                           dc.w $0040
[000ca67a]                           dc.w $0000
[000ca67c] 000c97c9                  dc.l TEXT_13
[000ca680]                           dc.w $0002
[000ca682]                           dc.w $0003
[000ca684]                           dc.w $0006
[000ca686]                           dc.w $0001
_56_ED_BOX:
[000ca688]                           dc.w $0037
[000ca68a]                           dc.w $ffff
[000ca68c]                           dc.w $ffff
[000ca68e]                           dc.w $0018
[000ca690]                           dc.w $0040
[000ca692]                           dc.w $0000
[000ca694] 000c9bb0                  dc.l A_ARROWS02
[000ca698]                           dc.w $0003
[000ca69a]                           dc.w $0000
[000ca69c]                           dc.w $0001
[000ca69e]                           dc.w $0001
_57_ED_BOX:
[000ca6a0]                           dc.w $0030
[000ca6a2]                           dc.w $003a
[000ca6a4]                           dc.w $003a
[000ca6a6]                           dc.w $001c
[000ca6a8]                           dc.w $0040
[000ca6aa]                           dc.w $0000
[000ca6ac] 000c9798                  dc.l TEXT_01
[000ca6b0]                           dc.w $0001
[000ca6b2]                           dc.w $0001
[000ca6b4]                           dc.w $0008
[000ca6b6]                           dc.w $0001
_58_ED_BOX:
[000ca6b8]                           dc.w $0039
[000ca6ba]                           dc.w $ffff
[000ca6bc]                           dc.w $ffff
[000ca6be]                           dc.w $0018
[000ca6c0]                           dc.w $0060
[000ca6c2]                           dc.w $0000
[000ca6c4] 000c9bb0                  dc.l A_ARROWS02
[000ca6c8]                           dc.w $0000
[000ca6ca]                           dc.w $0000
[000ca6cc]                           dc.w $0001
[000ca6ce]                           dc.w $0001
colour_text:
[000ca6d0] 000c96c4                  dc.l COLOUR00
[000ca6d4] 000c96cb                  dc.l COLOUR01
[000ca6d8] 000c96d5                  dc.l COLOUR02
[000ca6dc] 000c96db                  dc.l COLOUR03
[000ca6e0] 000c96e2                  dc.l COLOUR04
[000ca6e4] 000c96e9                  dc.l COLOUR05
[000ca6e8] 000c96f0                  dc.l COLOUR06
[000ca6ec] 000c96f7                  dc.l COLOUR07
[000ca6f0] 000c9701                  dc.l COLOUR08
[000ca6f4] 000c970c                  dc.l COLOUR09
[000ca6f8] 000c9719                  dc.l COLOUR10
[000ca6fc] 000c9725                  dc.l COLOUR11
[000ca700] 000c9732                  dc.l COLOUR12
[000ca704] 000c973f                  dc.l COLOUR13
[000ca708] 000c974c                  dc.l COLOUR14
[000ca70c] 000c9759                  dc.l COLOUR15
[000ca710]                           dc.w $2000
sm:
[000ca712]                           dc.w $0000
[000ca714]                           dc.w $0000
[000ca716] 00031398                  dc.l edbo_ok
[000ca71a] 0004f20a                  dc.l Aob_delete
[000ca71e] 000c9806                  dc.l title
[000ca722] 000c97f5                  dc.l help_title
[000ca726]                           dc.w $0000
[000ca728]                           dc.w $0000
