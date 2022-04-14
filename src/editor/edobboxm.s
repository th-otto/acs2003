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
[0003108a] 6b24                      bmi.s      $000310B0
[0003108c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031092] 2268 025c                 movea.l    604(a0),a1
[00031096] 3203                      move.w     d3,d1
[00031098] 0269 0fff 003e            andi.w     #$0FFF,62(a1)
[0003109e] c27c 000f                 and.w      #$000F,d1
[000310a2] e149                      lsl.w      #8,d1
[000310a4] e949                      lsl.w      #4,d1
[000310a6] 8369 003e                 or.w       d1,62(a1)
[000310aa] 4eb9 0003 15bc            jsr        edbo_update
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
[000310d8] 6b20                      bmi.s      $000310FA
[000310da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000310e0] 2268 025c                 movea.l    604(a0),a1
[000310e4] 3203                      move.w     d3,d1
[000310e6] 0269 fff0 003e            andi.w     #$FFF0,62(a1)
[000310ec] c27c 000f                 and.w      #$000F,d1
[000310f0] 8369 003e                 or.w       d1,62(a1)
[000310f4] 4eb9 0003 15bc            jsr        edbo_update
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
[00031114] 6700 00c6                 beq        $000311DC
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
[00031182] 6f50                      ble.s      $000311D4
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
[000311d4] 204a                      movea.l    a2,a0
[000311d6] 4eb9 0004 f20a            jsr        Aob_delete
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
[0003122a] 6b22                      bmi.s      $0003124E
[0003122c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031232] 2268 025c                 movea.l    604(a0),a1
[00031236] 3203                      move.w     d3,d1
[00031238] 0269 f0ff 003e            andi.w     #$F0FF,62(a1)
[0003123e] c27c 000f                 and.w      #$000F,d1
[00031242] e149                      lsl.w      #8,d1
[00031244] 8369 003e                 or.w       d1,62(a1)
[00031248] 4eb9 0003 15bc            jsr        edbo_update
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
[00031282] 6700 010c                 beq        $00031390
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
[000312c4] 670a                      beq.s      $000312D0
[000312c6] 5b42                      subq.w     #5,d2
[000312c8] 670e                      beq.s      $000312D8
[000312ca] 5542                      subq.w     #2,d2
[000312cc] 6712                      beq.s      $000312E0
[000312ce] 6016                      bra.s      $000312E6
[000312d0] 006b 0004 0022            ori.w      #$0004,34(a3)
[000312d6] 600e                      bra.s      $000312E6
[000312d8] 006b 0004 003a            ori.w      #$0004,58(a3)
[000312de] 6006                      bra.s      $000312E6
[000312e0] 006b 0004 0052            ori.w      #$0004,82(a3)
[000312e6] 322f 0002                 move.w     2(a7),d1
[000312ea] 3017                      move.w     (a7),d0
[000312ec] 224b                      movea.l    a3,a1
[000312ee] 2054                      movea.l    (a4),a0
[000312f0] 2068 0258                 movea.l    600(a0),a0
[000312f4] 4eb9 0004 e84a            jsr        Ame_popup
[000312fa] 3600                      move.w     d0,d3
[000312fc] 5340                      subq.w     #1,d0
[000312fe] 670a                      beq.s      $0003130A
[00031300] 5340                      subq.w     #1,d0
[00031302] 6726                      beq.s      $0003132A
[00031304] 5340                      subq.w     #1,d0
[00031306] 6742                      beq.s      $0003134A
[00031308] 605e                      bra.s      $00031368
[0003130a] 2054                      movea.l    (a4),a0
[0003130c] 2268 025c                 movea.l    604(a0),a1
[00031310] 337c 0014 0036            move.w     #$0014,54(a1)
[00031316] 43ea f6f5                 lea.l      -2315(a2),a1
[0003131a] 7007                      moveq.l    #7,d0
[0003131c] 2054                      movea.l    (a4),a0
[0003131e] 2068 025c                 movea.l    604(a0),a0
[00031322] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031328] 603e                      bra.s      $00031368
[0003132a] 2054                      movea.l    (a4),a0
[0003132c] 2268 025c                 movea.l    604(a0),a1
[00031330] 337c 0019 0036            move.w     #$0019,54(a1)
[00031336] 43ea f6fb                 lea.l      -2309(a2),a1
[0003133a] 7007                      moveq.l    #7,d0
[0003133c] 2054                      movea.l    (a4),a0
[0003133e] 2068 025c                 movea.l    604(a0),a0
[00031342] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031348] 601e                      bra.s      $00031368
[0003134a] 2054                      movea.l    (a4),a0
[0003134c] 2268 025c                 movea.l    604(a0),a1
[00031350] 337c 001b 0036            move.w     #$001B,54(a1)
[00031356] 43ea f703                 lea.l      -2301(a2),a1
[0003135a] 7007                      moveq.l    #7,d0
[0003135c] 2054                      movea.l    (a4),a0
[0003135e] 2068 025c                 movea.l    604(a0),a0
[00031362] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031368] 4a43                      tst.w      d3
[0003136a] 6f1c                      ble.s      $00031388
[0003136c] 72ff                      moveq.l    #-1,d1
[0003136e] 7005                      moveq.l    #5,d0
[00031370] 2054                      movea.l    (a4),a0
[00031372] 2068 0258                 movea.l    600(a0),a0
[00031376] 2254                      movea.l    (a4),a1
[00031378] 2469 0258                 movea.l    600(a1),a2
[0003137c] 226a 0066                 movea.l    102(a2),a1
[00031380] 4e91                      jsr        (a1)
[00031382] 4eb9 0003 15bc            jsr        edbo_update
[00031388] 204b                      movea.l    a3,a0
[0003138a] 4eb9 0004 f20a            jsr        Aob_delete
[00031390] 504f                      addq.w     #8,a7
[00031392] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00031396] 4e75                      rts

; start editor\edobboxm.c

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
[00031432] 6606                      bne.s      $0003143A
[00031434] 91c8                      suba.l     a0,a0
[00031436] 6000 0142                 bra        $0003157A
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
[00031482] 670a                      beq.s      $0003148E
[00031484] 5b40                      subq.w     #5,d0
[00031486] 6716                      beq.s      $0003149E
[00031488] 5540                      subq.w     #2,d0
[0003148a] 6722                      beq.s      $000314AE
[0003148c] 602e                      bra.s      $000314BC
[0003148e] 43ec f10d                 lea.l      -3827(a4),a1
[00031492] 7007                      moveq.l    #7,d0
[00031494] 204a                      movea.l    a2,a0
[00031496] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003149c] 601e                      bra.s      $000314BC
[0003149e] 43ec f113                 lea.l      -3821(a4),a1
[000314a2] 7007                      moveq.l    #7,d0
[000314a4] 204a                      movea.l    a2,a0
[000314a6] 4eb9 0005 0fd8            jsr        Aob_puttext
[000314ac] 600e                      bra.s      $000314BC
[000314ae] 43ec f11b                 lea.l      -3813(a4),a1
[000314b2] 7007                      moveq.l    #7,d0
[000314b4] 204a                      movea.l    a2,a0
[000314b6] 4eb9 0005 0fd8            jsr        Aob_puttext
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
