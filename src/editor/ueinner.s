edin_dither:
[0002900e] 2f0a                      move.l     a2,-(a7)
[00029010] 2f0b                      move.l     a3,-(a7)
[00029012] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00029018] 2052                      movea.l    (a2),a0
[0002901a] 2268 025c                 movea.l    604(a0),a1
[0002901e] 2669 003c                 movea.l    60(a1),a3
[00029022] 584b                      addq.w     #4,a3
[00029024] 0293 efff ffff            andi.l     #$EFFFFFFF,(a3)
[0002902a] 7001                      moveq.l    #1,d0
[0002902c] 2052                      movea.l    (a2),a0
[0002902e] 3428 0260                 move.w     608(a0),d2
[00029032] 48c2                      ext.l      d2
[00029034] 2202                      move.l     d2,d1
[00029036] d281                      add.l      d1,d1
[00029038] d282                      add.l      d2,d1
[0002903a] e789                      lsl.l      #3,d1
[0002903c] 2268 025c                 movea.l    604(a0),a1
[00029040] c071 180a                 and.w      10(a1,d1.l),d0
[00029044] 6706                      beq.s      $0002904C
[00029046] 0093 1000 0000            ori.l      #$10000000,(a3)
[0002904c] 72ff                      moveq.l    #-1,d1
[0002904e] 2052                      movea.l    (a2),a0
[00029050] 3028 0260                 move.w     608(a0),d0
[00029054] 2068 0258                 movea.l    600(a0),a0
[00029058] 2252                      movea.l    (a2),a1
[0002905a] 2669 0258                 movea.l    600(a1),a3
[0002905e] 226b 0066                 movea.l    102(a3),a1
[00029062] 4e91                      jsr        (a1)
[00029064] 72ff                      moveq.l    #-1,d1
[00029066] 7001                      moveq.l    #1,d0
[00029068] 2052                      movea.l    (a2),a0
[0002906a] 2068 0258                 movea.l    600(a0),a0
[0002906e] 2252                      movea.l    (a2),a1
[00029070] 2669 0258                 movea.l    600(a1),a3
[00029074] 226b 0066                 movea.l    102(a3),a1
[00029078] 4e91                      jsr        (a1)
[0002907a] 265f                      movea.l    (a7)+,a3
[0002907c] 245f                      movea.l    (a7)+,a2
[0002907e] 4e75                      rts
edin_incol:
[00029080] 2f03                      move.l     d3,-(a7)
[00029082] 2f0a                      move.l     a2,-(a7)
[00029084] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002908a] 2268 025c                 movea.l    604(a0),a1
[0002908e] 2469 003c                 movea.l    60(a1),a2
[00029092] 584a                      addq.w     #4,a2
[00029094] 7026                      moveq.l    #38,d0
[00029096] 3f00                      move.w     d0,-(a7)
[00029098] 7427                      moveq.l    #39,d2
[0002909a] 7224                      moveq.l    #36,d1
[0002909c] 2012                      move.l     (a2),d0
[0002909e] 7610                      moveq.l    #16,d3
[000290a0] e6a0                      asr.l      d3,d0
[000290a2] c07c 000f                 and.w      #$000F,d0
[000290a6] 4eb9 0003 0bde            jsr        oe_colsel
[000290ac] 544f                      addq.w     #2,a7
[000290ae] 3600                      move.w     d0,d3
[000290b0] 6b30                      bmi.s      $000290E2
[000290b2] 2212                      move.l     (a2),d1
[000290b4] c2bc fff0 ffff            and.l      #$FFF0FFFF,d1
[000290ba] 48c0                      ext.l      d0
[000290bc] 7410                      moveq.l    #16,d2
[000290be] e5a8                      lsl.l      d2,d0
[000290c0] 8280                      or.l       d0,d1
[000290c2] 2481                      move.l     d1,(a2)
[000290c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000290ca] 2068 0258                 movea.l    600(a0),a0
[000290ce] 2279 0010 ee4e            movea.l    ACSblk,a1
[000290d4] 2469 0258                 movea.l    600(a1),a2
[000290d8] 226a 0066                 movea.l    102(a2),a1
[000290dc] 7001                      moveq.l    #1,d0
[000290de] 72ff                      moveq.l    #-1,d1
[000290e0] 4e91                      jsr        (a1)
[000290e2] 245f                      movea.l    (a7)+,a2
[000290e4] 261f                      move.l     (a7)+,d3
[000290e6] 4e75                      rts
edin_intercol:
[000290e8] 2f03                      move.l     d3,-(a7)
[000290ea] 2f0a                      move.l     a2,-(a7)
[000290ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[000290f2] 2268 025c                 movea.l    604(a0),a1
[000290f6] 2469 003c                 movea.l    60(a1),a2
[000290fa] 584a                      addq.w     #4,a2
[000290fc] 7033                      moveq.l    #51,d0
[000290fe] 3f00                      move.w     d0,-(a7)
[00029100] 7434                      moveq.l    #52,d2
[00029102] 7231                      moveq.l    #49,d1
[00029104] 2012                      move.l     (a2),d0
[00029106] 760c                      moveq.l    #12,d3
[00029108] e6a0                      asr.l      d3,d0
[0002910a] c07c 000f                 and.w      #$000F,d0
[0002910e] 4eb9 0003 0bde            jsr        oe_colsel
[00029114] 544f                      addq.w     #2,a7
[00029116] 3600                      move.w     d0,d3
[00029118] 6b30                      bmi.s      $0002914A
[0002911a] 2212                      move.l     (a2),d1
[0002911c] c2bc ffff 0fff            and.l      #$FFFF0FFF,d1
[00029122] 48c0                      ext.l      d0
[00029124] 740c                      moveq.l    #12,d2
[00029126] e5a8                      lsl.l      d2,d0
[00029128] 8280                      or.l       d0,d1
[0002912a] 2481                      move.l     d1,(a2)
[0002912c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029132] 2068 0258                 movea.l    600(a0),a0
[00029136] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002913c] 2469 0258                 movea.l    600(a1),a2
[00029140] 226a 0066                 movea.l    102(a2),a1
[00029144] 7001                      moveq.l    #1,d0
[00029146] 72ff                      moveq.l    #-1,d1
[00029148] 4e91                      jsr        (a1)
[0002914a] 245f                      movea.l    (a7)+,a2
[0002914c] 261f                      move.l     (a7)+,d3
[0002914e] 4e75                      rts
edin_outcol:
[00029150] 3f03                      move.w     d3,-(a7)
[00029152] 2f0a                      move.l     a2,-(a7)
[00029154] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002915a] 2268 025c                 movea.l    604(a0),a1
[0002915e] 2469 003c                 movea.l    60(a1),a2
[00029162] 584a                      addq.w     #4,a2
[00029164] 701e                      moveq.l    #30,d0
[00029166] 3f00                      move.w     d0,-(a7)
[00029168] 741f                      moveq.l    #31,d2
[0002916a] 721c                      moveq.l    #28,d1
[0002916c] 700f                      moveq.l    #15,d0
[0002916e] c06a 0002                 and.w      2(a2),d0
[00029172] 4eb9 0003 0bde            jsr        oe_colsel
[00029178] 544f                      addq.w     #2,a7
[0002917a] 3600                      move.w     d0,d3
[0002917c] 6b28                      bmi.s      $000291A6
[0002917e] 72f0                      moveq.l    #-16,d1
[00029180] c292                      and.l      (a2),d1
[00029182] 48c0                      ext.l      d0
[00029184] 8280                      or.l       d0,d1
[00029186] 2481                      move.l     d1,(a2)
[00029188] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002918e] 2068 0258                 movea.l    600(a0),a0
[00029192] 2279 0010 ee4e            movea.l    ACSblk,a1
[00029198] 2469 0258                 movea.l    600(a1),a2
[0002919c] 226a 0066                 movea.l    102(a2),a1
[000291a0] 7001                      moveq.l    #1,d0
[000291a2] 72ff                      moveq.l    #-1,d1
[000291a4] 4e91                      jsr        (a1)
[000291a6] 245f                      movea.l    (a7)+,a2
[000291a8] 361f                      move.w     (a7)+,d3
[000291aa] 4e75                      rts
edin_pattern:
[000291ac] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000291b0] 514f                      subq.w     #8,a7
[000291b2] 41f9 000c 9fc8            lea.l      POP_PATSEL,a0
[000291b8] 4eb9 0004 f064            jsr        Aob_create
[000291be] 2448                      movea.l    a0,a2
[000291c0] 200a                      move.l     a2,d0
[000291c2] 6700 00de                 beq        $000292A2
[000291c6] 47f9 0010 ee4e            lea.l      ACSblk,a3
[000291cc] 702b                      moveq.l    #43,d0
[000291ce] 2053                      movea.l    (a3),a0
[000291d0] 2268 0258                 movea.l    600(a0),a1
[000291d4] 2269 0014                 movea.l    20(a1),a1
[000291d8] 41d7                      lea.l      (a7),a0
[000291da] 4eb9 0004 fe06            jsr        Aob_offset
[000291e0] 7001                      moveq.l    #1,d0
[000291e2] 2053                      movea.l    (a3),a0
[000291e4] 2268 0258                 movea.l    600(a0),a1
[000291e8] d069 0034                 add.w      52(a1),d0
[000291ec] d157                      add.w      d0,(a7)
[000291ee] 7201                      moveq.l    #1,d1
[000291f0] d269 0036                 add.w      54(a1),d1
[000291f4] d36f 0002                 add.w      d1,2(a7)
[000291f8] 2268 025c                 movea.l    604(a0),a1
[000291fc] 2069 003c                 movea.l    60(a1),a0
[00029200] 2028 0004                 move.l     4(a0),d0
[00029204] 7209                      moveq.l    #9,d1
[00029206] e2a0                      asr.l      d1,d0
[00029208] c07c 0007                 and.w      #$0007,d0
[0002920c] 48c0                      ext.l      d0
[0002920e] 2400                      move.l     d0,d2
[00029210] d482                      add.l      d2,d2
[00029212] d480                      add.l      d0,d2
[00029214] e78a                      lsl.l      #3,d2
[00029216] 0072 0004 2822            ori.w      #$0004,34(a2,d2.l)
[0002921c] 3017                      move.w     (a7),d0
[0002921e] 224a                      movea.l    a2,a1
[00029220] 2053                      movea.l    (a3),a0
[00029222] 2068 0258                 movea.l    600(a0),a0
[00029226] 322f 0002                 move.w     2(a7),d1
[0002922a] 4eb9 0004 e84a            jsr        Ame_popup
[00029230] 4a40                      tst.w      d0
[00029232] 6f66                      ble.s      $0002929A
[00029234] 5340                      subq.w     #1,d0
[00029236] 2053                      movea.l    (a3),a0
[00029238] 2268 025c                 movea.l    604(a0),a1
[0002923c] 2069 003c                 movea.l    60(a1),a0
[00029240] 5848                      addq.w     #4,a0
[00029242] 2210                      move.l     (a0),d1
[00029244] c2bc ffff f1ff            and.l      #$FFFFF1FF,d1
[0002924a] 3400                      move.w     d0,d2
[0002924c] 48c2                      ext.l      d2
[0002924e] 7609                      moveq.l    #9,d3
[00029250] e7aa                      lsl.l      d3,d2
[00029252] 8282                      or.l       d2,d1
[00029254] 2081                      move.l     d1,(a0)
[00029256] 2053                      movea.l    (a3),a0
[00029258] 2268 025c                 movea.l    604(a0),a1
[0002925c] 3200                      move.w     d0,d1
[0002925e] 0269 ff8f 0416            andi.w     #$FF8F,1046(a1)
[00029264] c27c 0007                 and.w      #$0007,d1
[00029268] e949                      lsl.w      #4,d1
[0002926a] 8369 0416                 or.w       d1,1046(a1)
[0002926e] 72ff                      moveq.l    #-1,d1
[00029270] 2053                      movea.l    (a3),a0
[00029272] 2068 0258                 movea.l    600(a0),a0
[00029276] 2253                      movea.l    (a3),a1
[00029278] 2269 0258                 movea.l    600(a1),a1
[0002927c] 2269 0066                 movea.l    102(a1),a1
[00029280] 702b                      moveq.l    #43,d0
[00029282] 4e91                      jsr        (a1)
[00029284] 72ff                      moveq.l    #-1,d1
[00029286] 7001                      moveq.l    #1,d0
[00029288] 2053                      movea.l    (a3),a0
[0002928a] 2068 0258                 movea.l    600(a0),a0
[0002928e] 2253                      movea.l    (a3),a1
[00029290] 2269 0258                 movea.l    600(a1),a1
[00029294] 2269 0066                 movea.l    102(a1),a1
[00029298] 4e91                      jsr        (a1)
[0002929a] 204a                      movea.l    a2,a0
[0002929c] 4eb9 0004 f20a            jsr        Aob_delete
[000292a2] 504f                      addq.w     #8,a7
[000292a4] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000292a8] 4e75                      rts
edin_pos:
[000292aa] 48e7 003c                 movem.l    a2-a5,-(a7)
[000292ae] 514f                      subq.w     #8,a7
[000292b0] 45f9 000c 192c            lea.l      POP_POSSEL,a2
[000292b6] 204a                      movea.l    a2,a0
[000292b8] 4eb9 0004 f064            jsr        Aob_create
[000292be] 2648                      movea.l    a0,a3
[000292c0] 200b                      move.l     a3,d0
[000292c2] 6700 0148                 beq        $0002940C
[000292c6] 49f9 0010 ee4e            lea.l      ACSblk,a4
[000292cc] 7011                      moveq.l    #17,d0
[000292ce] 2054                      movea.l    (a4),a0
[000292d0] 2268 0258                 movea.l    600(a0),a1
[000292d4] 2269 0014                 movea.l    20(a1),a1
[000292d8] 41d7                      lea.l      (a7),a0
[000292da] 4eb9 0004 fe06            jsr        Aob_offset
[000292e0] 7001                      moveq.l    #1,d0
[000292e2] 2054                      movea.l    (a4),a0
[000292e4] 2268 0258                 movea.l    600(a0),a1
[000292e8] d069 0034                 add.w      52(a1),d0
[000292ec] d157                      add.w      d0,(a7)
[000292ee] 7201                      moveq.l    #1,d1
[000292f0] d269 0036                 add.w      54(a1),d1
[000292f4] d36f 0002                 add.w      d1,2(a7)
[000292f8] 2049                      movea.l    a1,a0
[000292fa] 224b                      movea.l    a3,a1
[000292fc] 3017                      move.w     (a7),d0
[000292fe] 322f 0002                 move.w     2(a7),d1
[00029302] 4eb9 0004 e84a            jsr        Ame_popup
[00029308] 4a40                      tst.w      d0
[0002930a] 6f00 00f8                 ble        $00029404
[0002930e] 5540                      subq.w     #2,d0
[00029310] 2054                      movea.l    (a4),a0
[00029312] 2268 025c                 movea.l    604(a0),a1
[00029316] 2a69 003c                 movea.l    60(a1),a5
[0002931a] 584d                      addq.w     #4,a5
[0002931c] 0295 f8ff ffff            andi.l     #$F8FFFFFF,(a5)
[00029322] 3200                      move.w     d0,d1
[00029324] b27c 0005                 cmp.w      #$0005,d1
[00029328] 6200 00ae                 bhi        $000293D8
[0002932c] d241                      add.w      d1,d1
[0002932e] 323b 1006                 move.w     $00029336(pc,d1.w),d1
[00029332] 4efb 1002                 jmp        $00029336(pc,d1.w)
J13:
[00029336] 000c                      dc.w $000c   ; $00029342-$00029336
[00029338] 0022                      dc.w $0022   ; $00029358-$00029336
[0002933a] 003c                      dc.w $003c   ; $00029372-$00029336
[0002933c] 0056                      dc.w $0056   ; $0002938c-$00029336
[0002933e] 0070                      dc.w $0070   ; $000293a6-$00029336
[00029340] 008a                      dc.w $008a   ; $000293c0-$00029336
[00029342] 43ea fd23                 lea.l      -733(a2),a1
[00029346] 7013                      moveq.l    #19,d0
[00029348] 2054                      movea.l    (a4),a0
[0002934a] 2068 025c                 movea.l    604(a0),a0
[0002934e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029354] 6000 0082                 bra        $000293D8
[00029358] 0095 0100 0000            ori.l      #$01000000,(a5)
[0002935e] 43ea fd27                 lea.l      -729(a2),a1
[00029362] 7013                      moveq.l    #19,d0
[00029364] 2054                      movea.l    (a4),a0
[00029366] 2068 025c                 movea.l    604(a0),a0
[0002936a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029370] 6066                      bra.s      $000293D8
[00029372] 0095 0200 0000            ori.l      #$02000000,(a5)
[00029378] 43ea fd2b                 lea.l      -725(a2),a1
[0002937c] 7013                      moveq.l    #19,d0
[0002937e] 2054                      movea.l    (a4),a0
[00029380] 2068 025c                 movea.l    604(a0),a0
[00029384] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002938a] 604c                      bra.s      $000293D8
[0002938c] 0095 0400 0000            ori.l      #$04000000,(a5)
[00029392] 43ea fd2f                 lea.l      -721(a2),a1
[00029396] 7013                      moveq.l    #19,d0
[00029398] 2054                      movea.l    (a4),a0
[0002939a] 2068 025c                 movea.l    604(a0),a0
[0002939e] 4eb9 0005 0fd8            jsr        Aob_puttext
[000293a4] 6032                      bra.s      $000293D8
[000293a6] 0095 0500 0000            ori.l      #$05000000,(a5)
[000293ac] 43ea fd33                 lea.l      -717(a2),a1
[000293b0] 7013                      moveq.l    #19,d0
[000293b2] 2054                      movea.l    (a4),a0
[000293b4] 2068 025c                 movea.l    604(a0),a0
[000293b8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000293be] 6018                      bra.s      $000293D8
[000293c0] 0095 0600 0000            ori.l      #$06000000,(a5)
[000293c6] 43ea fd37                 lea.l      -713(a2),a1
[000293ca] 7013                      moveq.l    #19,d0
[000293cc] 2054                      movea.l    (a4),a0
[000293ce] 2068 025c                 movea.l    604(a0),a0
[000293d2] 4eb9 0005 0fd8            jsr        Aob_puttext
[000293d8] 72ff                      moveq.l    #-1,d1
[000293da] 7013                      moveq.l    #19,d0
[000293dc] 2054                      movea.l    (a4),a0
[000293de] 2068 0258                 movea.l    600(a0),a0
[000293e2] 2254                      movea.l    (a4),a1
[000293e4] 2469 0258                 movea.l    600(a1),a2
[000293e8] 226a 0066                 movea.l    102(a2),a1
[000293ec] 4e91                      jsr        (a1)
[000293ee] 72ff                      moveq.l    #-1,d1
[000293f0] 7001                      moveq.l    #1,d0
[000293f2] 2054                      movea.l    (a4),a0
[000293f4] 2068 0258                 movea.l    600(a0),a0
[000293f8] 2254                      movea.l    (a4),a1
[000293fa] 2469 0258                 movea.l    600(a1),a2
[000293fe] 226a 0066                 movea.l    102(a2),a1
[00029402] 4e91                      jsr        (a1)
[00029404] 204b                      movea.l    a3,a0
[00029406] 4eb9 0004 f20a            jsr        Aob_delete
[0002940c] 504f                      addq.w     #8,a7
[0002940e] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00029412] 4e75                      rts
edin_size:
[00029414] 48e7 0038                 movem.l    a2-a4,-(a7)
[00029418] 514f                      subq.w     #8,a7
[0002941a] 41f9 000c a0a0            lea.l      POP_SIZESEL,a0
[00029420] 4eb9 0004 f064            jsr        Aob_create
[00029426] 2448                      movea.l    a0,a2
[00029428] 200a                      move.l     a2,d0
[0002942a] 6700 00ec                 beq        $00029518
[0002942e] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00029434] 7016                      moveq.l    #22,d0
[00029436] 2053                      movea.l    (a3),a0
[00029438] 2268 0258                 movea.l    600(a0),a1
[0002943c] 2269 0014                 movea.l    20(a1),a1
[00029440] 41d7                      lea.l      (a7),a0
[00029442] 4eb9 0004 fe06            jsr        Aob_offset
[00029448] 7001                      moveq.l    #1,d0
[0002944a] 2053                      movea.l    (a3),a0
[0002944c] 2268 0258                 movea.l    600(a0),a1
[00029450] d069 0034                 add.w      52(a1),d0
[00029454] d157                      add.w      d0,(a7)
[00029456] 7201                      moveq.l    #1,d1
[00029458] d269 0036                 add.w      54(a1),d1
[0002945c] d36f 0002                 add.w      d1,2(a7)
[00029460] 2268 025c                 movea.l    604(a0),a1
[00029464] 2069 003c                 movea.l    60(a1),a0
[00029468] 2028 0004                 move.l     4(a0),d0
[0002946c] 721b                      moveq.l    #27,d1
[0002946e] e2a0                      asr.l      d1,d0
[00029470] c07c 0001                 and.w      #$0001,d0
[00029474] 48c0                      ext.l      d0
[00029476] 2400                      move.l     d0,d2
[00029478] d482                      add.l      d2,d2
[0002947a] d480                      add.l      d0,d2
[0002947c] e78a                      lsl.l      #3,d2
[0002947e] 0072 0004 2822            ori.w      #$0004,34(a2,d2.l)
[00029484] 3017                      move.w     (a7),d0
[00029486] 224a                      movea.l    a2,a1
[00029488] 2053                      movea.l    (a3),a0
[0002948a] 2068 0258                 movea.l    600(a0),a0
[0002948e] 322f 0002                 move.w     2(a7),d1
[00029492] 4eb9 0004 e84a            jsr        Ame_popup
[00029498] 4a40                      tst.w      d0
[0002949a] 6f74                      ble.s      $00029510
[0002949c] 2053                      movea.l    (a3),a0
[0002949e] 2268 025c                 movea.l    604(a0),a1
[000294a2] 2869 003c                 movea.l    60(a1),a4
[000294a6] 584c                      addq.w     #4,a4
[000294a8] b07c 0001                 cmp.w      #$0001,d0
[000294ac] 661c                      bne.s      $000294CA
[000294ae] 0294 f7ff ffff            andi.l     #$F7FFFFFF,(a4)
[000294b4] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[000294ba] 7018                      moveq.l    #24,d0
[000294bc] 2053                      movea.l    (a3),a0
[000294be] 2068 025c                 movea.l    604(a0),a0
[000294c2] 4eb9 0005 0fd8            jsr        Aob_puttext
[000294c8] 601a                      bra.s      $000294E4
[000294ca] 0094 0800 0000            ori.l      #$08000000,(a4)
[000294d0] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[000294d6] 7018                      moveq.l    #24,d0
[000294d8] 2053                      movea.l    (a3),a0
[000294da] 2068 025c                 movea.l    604(a0),a0
[000294de] 4eb9 0005 0fd8            jsr        Aob_puttext
[000294e4] 72ff                      moveq.l    #-1,d1
[000294e6] 7018                      moveq.l    #24,d0
[000294e8] 2053                      movea.l    (a3),a0
[000294ea] 2068 0258                 movea.l    600(a0),a0
[000294ee] 2253                      movea.l    (a3),a1
[000294f0] 2869 0258                 movea.l    600(a1),a4
[000294f4] 226c 0066                 movea.l    102(a4),a1
[000294f8] 4e91                      jsr        (a1)
[000294fa] 72ff                      moveq.l    #-1,d1
[000294fc] 7001                      moveq.l    #1,d0
[000294fe] 2053                      movea.l    (a3),a0
[00029500] 2068 0258                 movea.l    600(a0),a0
[00029504] 2253                      movea.l    (a3),a1
[00029506] 2869 0258                 movea.l    600(a1),a4
[0002950a] 226c 0066                 movea.l    102(a4),a1
[0002950e] 4e91                      jsr        (a1)
[00029510] 204a                      movea.l    a2,a0
[00029512] 4eb9 0004 f20a            jsr        Aob_delete
[00029518] 504f                      addq.w     #8,a7
[0002951a] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002951e] 4e75                      rts
edin_textcol:
[00029520] 3f03                      move.w     d3,-(a7)
[00029522] 2f0a                      move.l     a2,-(a7)
[00029524] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002952a] 2268 025c                 movea.l    604(a0),a1
[0002952e] 2469 003c                 movea.l    60(a1),a2
[00029532] 584a                      addq.w     #4,a2
[00029534] 700c                      moveq.l    #12,d0
[00029536] 3f00                      move.w     d0,-(a7)
[00029538] 740d                      moveq.l    #13,d2
[0002953a] 720a                      moveq.l    #10,d1
[0002953c] 2012                      move.l     (a2),d0
[0002953e] e880                      asr.l      #4,d0
[00029540] c07c 000f                 and.w      #$000F,d0
[00029544] 4eb9 0003 0bde            jsr        oe_colsel
[0002954a] 544f                      addq.w     #2,a7
[0002954c] 3600                      move.w     d0,d3
[0002954e] 6b2e                      bmi.s      $0002957E
[00029550] 2212                      move.l     (a2),d1
[00029552] c2bc ffff ff0f            and.l      #$FFFFFF0F,d1
[00029558] 48c0                      ext.l      d0
[0002955a] e988                      lsl.l      #4,d0
[0002955c] 8280                      or.l       d0,d1
[0002955e] 2481                      move.l     d1,(a2)
[00029560] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029566] 2068 0258                 movea.l    600(a0),a0
[0002956a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00029570] 2469 0258                 movea.l    600(a1),a2
[00029574] 226a 0066                 movea.l    102(a2),a1
[00029578] 7001                      moveq.l    #1,d0
[0002957a] 72ff                      moveq.l    #-1,d1
[0002957c] 4e91                      jsr        (a1)
[0002957e] 245f                      movea.l    (a7)+,a2
[00029580] 361f                      move.w     (a7)+,d3
[00029582] 4e75                      rts

; start editor\ueinner.c

init_inner:
[00029584] 2f0a                      move.l     a2,-(a7)
[00029586] 2f0b                      move.l     a3,-(a7)
[00029588] 2448                      movea.l    a0,a2
[0002958a] 43f9 000c 1ffa            lea.l      data,a1
[00029590] 303c 2329                 move.w     #$2329,d0
[00029594] 266a 0004                 movea.l    4(a2),a3
[00029598] 4e93                      jsr        (a3)
[0002959a] 265f                      movea.l    (a7)+,a3
[0002959c] 245f                      movea.l    (a7)+,a2
[0002959e] 4e75                      rts
minsize:
[000295a0] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000295a4] 2448                      movea.l    a0,a2
[000295a6] 2649                      movea.l    a1,a3
[000295a8] 202a 000c                 move.l     12(a2),d0
[000295ac] 6718                      beq.s      $000295C6
[000295ae] 2040                      movea.l    d0,a0
[000295b0] 4eb9 0008 2f6c            jsr        strlen
[000295b6] 2600                      move.l     d0,d3
[000295b8] 5443                      addq.w     #2,d3
[000295ba] 2079 0010 ee4e            movea.l    ACSblk,a0
[000295c0] c7e8 0012                 muls.w     18(a0),d3
[000295c4] 600c                      bra.s      $000295D2
[000295c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000295cc] 3628 0012                 move.w     18(a0),d3
[000295d0] d643                      add.w      d3,d3
[000295d2] 3683                      move.w     d3,(a3)
[000295d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000295da] 226f 0010                 movea.l    16(a7),a1
[000295de] 32a8 0014                 move.w     20(a0),(a1)
[000295e2] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000295e6] 4e75                      rts
object_tree:
[000295e8] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[000295ec] 594f                      subq.w     #4,a7
[000295ee] 2448                      movea.l    a0,a2
[000295f0] 2849                      movea.l    a1,a4
[000295f2] 41f9 000c 19ec            lea.l      ED_INNER,a0
[000295f8] 4eb9 0004 f064            jsr        Aob_create
[000295fe] 2648                      movea.l    a0,a3
[00029600] 200b                      move.l     a3,d0
[00029602] 6606                      bne.s      $0002960A
[00029604] 91c8                      suba.l     a0,a0
[00029606] 6000 02cc                 bra        $000298D4
[0002960a] 4beb 0030                 lea.l      48(a3),a5
[0002960e] 7016                      moveq.l    #22,d0
[00029610] c06c 0008                 and.w      8(a4),d0
[00029614] 816d 0008                 or.w       d0,8(a5)
[00029618] 703f                      moveq.l    #63,d0
[0002961a] c06c 000a                 and.w      10(a4),d0
[0002961e] 816d 000a                 or.w       d0,10(a5)
[00029622] 700e                      moveq.l    #14,d0
[00029624] 224b                      movea.l    a3,a1
[00029626] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002962c] 2068 0258                 movea.l    600(a0),a0
[00029630] 4eb9 0003 0b9a            jsr        oe_beself
[00029636] 7038                      moveq.l    #56,d0
[00029638] 224b                      movea.l    a3,a1
[0002963a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029640] 2068 0258                 movea.l    600(a0),a0
[00029644] 4eb9 0003 0b9a            jsr        oe_beself
[0002964a] 7039                      moveq.l    #57,d0
[0002964c] 224b                      movea.l    a3,a1
[0002964e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029654] 2068 0258                 movea.l    600(a0),a0
[00029658] 4eb9 0003 0b9a            jsr        oe_beself
[0002965e] 286d 000c                 movea.l    12(a5),a4
[00029662] 4857                      pea.l      (a7)
[00029664] 43f9 000c 2067            lea.l      $000C2067,a1
[0002966a] 2052                      movea.l    (a2),a0
[0002966c] 4eb9 0008 1b26            jsr        sscanf
[00029672] 584f                      addq.w     #4,a7
[00029674] 2957 0004                 move.l     (a7),4(a4)
[00029678] 0c6a 0002 0008            cmpi.w     #$0002,8(a2)
[0002967e] 6610                      bne.s      $00029690
[00029680] 226a 000a                 movea.l    10(a2),a1
[00029684] 700e                      moveq.l    #14,d0
[00029686] 204b                      movea.l    a3,a0
[00029688] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002968e] 6020                      bra.s      $000296B0
[00029690] 43f9 000c 204f            lea.l      $000C204F,a1
[00029696] 7004                      moveq.l    #4,d0
[00029698] 204d                      movea.l    a5,a0
[0002969a] 2c6c 0008                 movea.l    8(a4),a6
[0002969e] 4e96                      jsr        (a6)
[000296a0] 43f9 000c 204f            lea.l      $000C204F,a1
[000296a6] 700e                      moveq.l    #14,d0
[000296a8] 204b                      movea.l    a3,a0
[000296aa] 4eb9 0005 0fd8            jsr        Aob_puttext
[000296b0] 2017                      move.l     (a7),d0
[000296b2] 721c                      moveq.l    #28,d1
[000296b4] e2a0                      asr.l      d1,d0
[000296b6] c0bc 0000 0001            and.l      #$00000001,d0
[000296bc] 6708                      beq.s      $000296C6
[000296be] 006b 0001 03e2            ori.w      #$0001,994(a3)
[000296c4] 6006                      bra.s      $000296CC
[000296c6] 026b fffe 03e2            andi.w     #$FFFE,994(a3)
[000296cc] 2617                      move.l     (a7),d3
[000296ce] 7010                      moveq.l    #16,d0
[000296d0] e0a3                      asr.l      d0,d3
[000296d2] c67c 000f                 and.w      #$000F,d3
[000296d6] 4bf9 000c a6d0            lea.l      colour_text,a5
[000296dc] 3003                      move.w     d3,d0
[000296de] 48c0                      ext.l      d0
[000296e0] e588                      lsl.l      #2,d0
[000296e2] 2275 0800                 movea.l    0(a5,d0.l),a1
[000296e6] 204b                      movea.l    a3,a0
[000296e8] 7027                      moveq.l    #39,d0
[000296ea] 4eb9 0005 0fd8            jsr        Aob_puttext
[000296f0] 3003                      move.w     d3,d0
[000296f2] 026b fff0 039e            andi.w     #$FFF0,926(a3)
[000296f8] c07c 000f                 and.w      #$000F,d0
[000296fc] 816b 039e                 or.w       d0,926(a3)
[00029700] 760f                      moveq.l    #15,d3
[00029702] c66f 0002                 and.w      2(a7),d3
[00029706] 3003                      move.w     d3,d0
[00029708] 48c0                      ext.l      d0
[0002970a] e588                      lsl.l      #2,d0
[0002970c] 2275 0800                 movea.l    0(a5,d0.l),a1
[00029710] 204b                      movea.l    a3,a0
[00029712] 701f                      moveq.l    #31,d0
[00029714] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002971a] 3003                      move.w     d3,d0
[0002971c] 026b fff0 02de            andi.w     #$FFF0,734(a3)
[00029722] c07c 000f                 and.w      #$000F,d0
[00029726] 816b 02de                 or.w       d0,734(a3)
[0002972a] 2617                      move.l     (a7),d3
[0002972c] 700c                      moveq.l    #12,d0
[0002972e] e0a3                      asr.l      d0,d3
[00029730] c67c 000f                 and.w      #$000F,d3
[00029734] 3203                      move.w     d3,d1
[00029736] 48c1                      ext.l      d1
[00029738] e589                      lsl.l      #2,d1
[0002973a] 2275 1800                 movea.l    0(a5,d1.l),a1
[0002973e] 204b                      movea.l    a3,a0
[00029740] 7034                      moveq.l    #52,d0
[00029742] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029748] 3003                      move.w     d3,d0
[0002974a] 026b fff0 04d6            andi.w     #$FFF0,1238(a3)
[00029750] c07c 000f                 and.w      #$000F,d0
[00029754] 816b 04d6                 or.w       d0,1238(a3)
[00029758] 2617                      move.l     (a7),d3
[0002975a] 7009                      moveq.l    #9,d0
[0002975c] e0a3                      asr.l      d0,d3
[0002975e] c67c 0007                 and.w      #$0007,d3
[00029762] 3203                      move.w     d3,d1
[00029764] 026b ff8f 0416            andi.w     #$FF8F,1046(a3)
[0002976a] c27c 0007                 and.w      #$0007,d1
[0002976e] e949                      lsl.w      #4,d1
[00029770] 836b 0416                 or.w       d1,1046(a3)
[00029774] 2617                      move.l     (a7),d3
[00029776] 7218                      moveq.l    #24,d1
[00029778] e2a3                      asr.l      d1,d3
[0002977a] c67c 0007                 and.w      #$0007,d3
[0002977e] 3403                      move.w     d3,d2
[00029780] b47c 0006                 cmp.w      #$0006,d2
[00029784] 6200 0084                 bhi        $0002980A
[00029788] d442                      add.w      d2,d2
[0002978a] 343b 2006                 move.w     $00029792(pc,d2.w),d2
[0002978e] 4efb 2002                 jmp        $00029792(pc,d2.w)
J14:
[00029792] 000e                      dc.w $000e   ; $000297a0-$00029792
[00029794] 0020                      dc.w $0020   ; $000297b2-$00029792
[00029796] 0032                      dc.w $0032   ; $000297c4-$00029792
[00029798] 0078                      dc.w $0078   ; $0002980a-$00029792
[0002979a] 0044                      dc.w $0044   ; $000297d6-$00029792
[0002979c] 0056                      dc.w $0056   ; $000297e8-$00029792
[0002979e] 0068                      dc.w $0068   ; $000297fa-$00029792
[000297a0] 43f9 000c 164f            lea.l      POS_TEXT0,a1
[000297a6] 7013                      moveq.l    #19,d0
[000297a8] 204b                      movea.l    a3,a0
[000297aa] 4eb9 0005 0fd8            jsr        Aob_puttext
[000297b0] 6058                      bra.s      $0002980A
[000297b2] 43f9 000c 1653            lea.l      POS_TEXT1,a1
[000297b8] 7013                      moveq.l    #19,d0
[000297ba] 204b                      movea.l    a3,a0
[000297bc] 4eb9 0005 0fd8            jsr        Aob_puttext
[000297c2] 6046                      bra.s      $0002980A
[000297c4] 43f9 000c 1657            lea.l      POS_TEXT2,a1
[000297ca] 7013                      moveq.l    #19,d0
[000297cc] 204b                      movea.l    a3,a0
[000297ce] 4eb9 0005 0fd8            jsr        Aob_puttext
[000297d4] 6034                      bra.s      $0002980A
[000297d6] 43f9 000c 165b            lea.l      POS_TEXT3,a1
[000297dc] 7013                      moveq.l    #19,d0
[000297de] 204b                      movea.l    a3,a0
[000297e0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000297e6] 6022                      bra.s      $0002980A
[000297e8] 43f9 000c 165f            lea.l      POS_TEXT4,a1
[000297ee] 7013                      moveq.l    #19,d0
[000297f0] 204b                      movea.l    a3,a0
[000297f2] 4eb9 0005 0fd8            jsr        Aob_puttext
[000297f8] 6010                      bra.s      $0002980A
[000297fa] 43f9 000c 1663            lea.l      POS_TEXT5,a1
[00029800] 7013                      moveq.l    #19,d0
[00029802] 204b                      movea.l    a3,a0
[00029804] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002980a] 2017                      move.l     (a7),d0
[0002980c] c0bc 0800 0000            and.l      #$08000000,d0
[00029812] 6712                      beq.s      $00029826
[00029814] 43f9 000c 9787            lea.l      SIZE_TEXT1,a1
[0002981a] 204b                      movea.l    a3,a0
[0002981c] 7018                      moveq.l    #24,d0
[0002981e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029824] 6010                      bra.s      $00029836
[00029826] 43f9 000c 9782            lea.l      SIZE_TEXT0,a1
[0002982c] 7018                      moveq.l    #24,d0
[0002982e] 204b                      movea.l    a3,a0
[00029830] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029836] 2617                      move.l     (a7),d3
[00029838] e883                      asr.l      #4,d3
[0002983a] c67c 000f                 and.w      #$000F,d3
[0002983e] 3003                      move.w     d3,d0
[00029840] 48c0                      ext.l      d0
[00029842] e588                      lsl.l      #2,d0
[00029844] 2275 0800                 movea.l    0(a5,d0.l),a1
[00029848] 204b                      movea.l    a3,a0
[0002984a] 700d                      moveq.l    #13,d0
[0002984c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00029852] 3003                      move.w     d3,d0
[00029854] 026b fff0 012e            andi.w     #$FFF0,302(a3)
[0002985a] c07c 000f                 and.w      #$000F,d0
[0002985e] 816b 012e                 or.w       d0,302(a3)
[00029862] 206b 054c                 movea.l    1356(a3),a0
[00029866] 2968 000c 0018            move.l     12(a0),24(a4)
[0002986c] 206a 0026                 movea.l    38(a2),a0
[00029870] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00029876] 4a40                      tst.w      d0
[00029878] 6712                      beq.s      $0002988C
[0002987a] 43f9 000c 204f            lea.l      $000C204F,a1
[00029880] 7038                      moveq.l    #56,d0
[00029882] 204b                      movea.l    a3,a0
[00029884] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002988a] 600e                      bra.s      $0002989A
[0002988c] 226a 0026                 movea.l    38(a2),a1
[00029890] 7038                      moveq.l    #56,d0
[00029892] 204b                      movea.l    a3,a0
[00029894] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002989a] 206b 0564                 movea.l    1380(a3),a0
[0002989e] 2968 000c 001c            move.l     12(a0),28(a4)
[000298a4] 206a 002a                 movea.l    42(a2),a0
[000298a8] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000298ae] 4a40                      tst.w      d0
[000298b0] 6712                      beq.s      $000298C4
[000298b2] 43f9 000c 204f            lea.l      $000C204F,a1
[000298b8] 7039                      moveq.l    #57,d0
[000298ba] 204b                      movea.l    a3,a0
[000298bc] 4eb9 0005 0fd8            jsr        Aob_puttext
[000298c2] 600e                      bra.s      $000298D2
[000298c4] 226a 002a                 movea.l    42(a2),a1
[000298c8] 7039                      moveq.l    #57,d0
[000298ca] 204b                      movea.l    a3,a0
[000298cc] 4eb9 0005 0fd8            jsr        Aob_puttext
[000298d2] 204b                      movea.l    a3,a0
[000298d4] 584f                      addq.w     #4,a7
[000298d6] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[000298da] 4e75                      rts
test_it:
[000298dc] 2f0a                      move.l     a2,-(a7)
[000298de] 2f0b                      move.l     a3,-(a7)
[000298e0] 2648                      movea.l    a0,a3
[000298e2] 2449                      movea.l    a1,a2
[000298e4] 22bc 0006 4256            move.l     #A_innerframe,(a1)
[000298ea] 486a 0004                 pea.l      4(a2)
[000298ee] 43f9 000c 2067            lea.l      $000C2067,a1
[000298f4] 2050                      movea.l    (a0),a0
[000298f6] 4eb9 0008 1b26            jsr        sscanf
[000298fc] 584f                      addq.w     #4,a7
[000298fe] 257c 0006 30f2 0008       move.l     #Auo_string,8(a2)
[00029906] 0c6b 0002 0008            cmpi.w     #$0002,8(a3)
[0002990c] 6608                      bne.s      $00029916
[0002990e] 256b 000a 000c            move.l     10(a3),12(a2)
[00029914] 6004                      bra.s      $0002991A
[00029916] 42aa 000c                 clr.l      12(a2)
[0002991a] 7000                      moveq.l    #0,d0
[0002991c] 2540 0014                 move.l     d0,20(a2)
[00029920] 2540 0010                 move.l     d0,16(a2)
[00029924] 206b 0026                 movea.l    38(a3),a0
[00029928] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002992e] 4a40                      tst.w      d0
[00029930] 6704                      beq.s      $00029936
[00029932] 91c8                      suba.l     a0,a0
[00029934] 6004                      bra.s      $0002993A
[00029936] 206b 0026                 movea.l    38(a3),a0
[0002993a] 2548 0018                 move.l     a0,24(a2)
[0002993e] 206b 002a                 movea.l    42(a3),a0
[00029942] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00029948] 4a40                      tst.w      d0
[0002994a] 6704                      beq.s      $00029950
[0002994c] 91c8                      suba.l     a0,a0
[0002994e] 6004                      bra.s      $00029954
[00029950] 206b 002a                 movea.l    42(a3),a0
[00029954] 2548 001c                 move.l     a0,28(a2)
[00029958] 265f                      movea.l    (a7)+,a3
[0002995a] 245f                      movea.l    (a7)+,a2
[0002995c] 4e75                      rts
abort:
[0002995e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00029964] 2268 0258                 movea.l    600(a0),a1
[00029968] 2069 0014                 movea.l    20(a1),a0
[0002996c] 2068 003c                 movea.l    60(a0),a0
[00029970] 42a8 0018                 clr.l      24(a0)
[00029974] 42a8 001c                 clr.l      28(a0)
[00029978] 2079 000c 203a            movea.l    $000C203A,a0
[0002997e] 2050                      movea.l    (a0),a0
[00029980] 4e90                      jsr        (a0)
[00029982] 4e75                      rts
ok:
[00029984] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00029988] 4fef ffce                 lea.l      -50(a7),a7
[0002998c] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00029992] 2052                      movea.l    (a2),a0
[00029994] 2268 0258                 movea.l    600(a0),a1
[00029998] 2669 0014                 movea.l    20(a1),a3
[0002999c] 2a6b 003c                 movea.l    60(a3),a5
[000299a0] 49f9 0010 c4e2            lea.l      parm,a4
[000299a6] 2f2d 0004                 move.l     4(a5),-(a7)
[000299aa] 43f9 000c 2067            lea.l      $000C2067,a1
[000299b0] 204c                      movea.l    a4,a0
[000299b2] 4eb9 0008 15ac            jsr        sprintf
[000299b8] 584f                      addq.w     #4,a7
[000299ba] 4bef 0004                 lea.l      4(a7),a5
[000299be] 2a8c                      move.l     a4,(a5)
[000299c0] 2b7c 000c 205c 0004       move.l     #$000C205C,4(a5)
[000299c8] 43d7                      lea.l      (a7),a1
[000299ca] 7003                      moveq.l    #3,d0
[000299cc] 41eb 0150                 lea.l      336(a3),a0
[000299d0] 4eb9 0006 a068            jsr        Auo_boxed
[000299d6] 2057                      movea.l    (a7),a0
[000299d8] 1010                      move.b     (a0),d0
[000299da] 671c                      beq.s      $000299F8
[000299dc] 4eb9 0008 2f6c            jsr        strlen
[000299e2] 2600                      move.l     d0,d3
[000299e4] 5443                      addq.w     #2,d3
[000299e6] 2052                      movea.l    (a2),a0
[000299e8] c7e8 0012                 muls.w     18(a0),d3
[000299ec] 3b7c 0002 0008            move.w     #$0002,8(a5)
[000299f2] 2b57 000a                 move.l     (a7),10(a5)
[000299f6] 6010                      bra.s      $00029A08
[000299f8] 2052                      movea.l    (a2),a0
[000299fa] 3628 0012                 move.w     18(a0),d3
[000299fe] d643                      add.w      d3,d3
[00029a00] 426d 0008                 clr.w      8(a5)
[00029a04] 42ad 000a                 clr.l      10(a5)
[00029a08] 42ad 000e                 clr.l      14(a5)
[00029a0c] 4240                      clr.w      d0
[00029a0e] 3b40 001c                 move.w     d0,28(a5)
[00029a12] 3b40 0012                 move.w     d0,18(a5)
[00029a16] 7200                      moveq.l    #0,d1
[00029a18] 2b41 001e                 move.l     d1,30(a5)
[00029a1c] 2b41 0014                 move.l     d1,20(a5)
[00029a20] 7000                      moveq.l    #0,d0
[00029a22] 2b40 0022                 move.l     d0,34(a5)
[00029a26] 2b40 0018                 move.l     d0,24(a5)
[00029a2a] 43ed 0026                 lea.l      38(a5),a1
[00029a2e] 41eb 0540                 lea.l      1344(a3),a0
[00029a32] 7003                      moveq.l    #3,d0
[00029a34] 4eb9 0006 a068            jsr        Auo_boxed
[00029a3a] 206d 0026                 movea.l    38(a5),a0
[00029a3e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00029a44] 4a40                      tst.w      d0
[00029a46] 6704                      beq.s      $00029A4C
[00029a48] 42ad 0026                 clr.l      38(a5)
[00029a4c] 43ed 002a                 lea.l      42(a5),a1
[00029a50] 7003                      moveq.l    #3,d0
[00029a52] 41eb 0558                 lea.l      1368(a3),a0
[00029a56] 4eb9 0006 a068            jsr        Auo_boxed
[00029a5c] 206d 002a                 movea.l    42(a5),a0
[00029a60] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00029a66] 4a40                      tst.w      d0
[00029a68] 6704                      beq.s      $00029A6E
[00029a6a] 42ad 002a                 clr.l      42(a5)
[00029a6e] 2052                      movea.l    (a2),a0
[00029a70] 3228 0014                 move.w     20(a0),d1
[00029a74] 3003                      move.w     d3,d0
[00029a76] 204d                      movea.l    a5,a0
[00029a78] 2279 000c 203a            movea.l    $000C203A,a1
[00029a7e] 2269 0004                 movea.l    4(a1),a1
[00029a82] 4e91                      jsr        (a1)
[00029a84] 6100 fed8                 bsr        abort
[00029a88] 4fef 0032                 lea.l      50(a7),a7
[00029a8c] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00029a90] 4e75                      rts
