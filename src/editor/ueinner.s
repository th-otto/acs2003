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

	.data

BUBBLE_01:
[000c155a]                           dc.b 'Hier wird der Titel eingegeben',0
BUBBLE_03:
[000c1579]                           dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_05:
[000c15cb]                           dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
POS_TEXT0:
[000c164f]                           dc.b 'l/o',0
POS_TEXT1:
[000c1653]                           dc.b 'm/o',0
POS_TEXT2:
[000c1657]                           dc.b 'r/o',0
POS_TEXT3:
[000c165b]                           dc.b 'l/u',0
POS_TEXT4:
[000c165f]                           dc.b 'm/u',0
POS_TEXT5:
[000c1663]                           dc.b 'r/u',0
TEXT_001:
[000c1667]                           dc.b 'TITEL',0
TEXT_005:
[000c166d]                           dc.b $4f
[000c166e]                           dc.w $4b00
TEXT_009:
[000c1670]                           dc.b 'Abbruch',0
TEXT_05:
[000c1678]                           dc.b 'Sonstiges',0
TEXT_06:
[000c1682]                           dc.b 'BubbleGEM-Text',0
TEXT_07:
[000c1691]                           dc.b 'Context-Popup',0
TEXT_09:
[000c169f]                           dc.b 'unten:',0
TEXT_10:
[000c16a6]                           dc.b 'Farbe:',0
TEXT_12:
[000c16ad]                           dc.b 'Grîûe:',0
TEXT_13:
[000c16b4]                           dc.b 'Muster:',0
TEXT_14:
[000c16bc]                           dc.b 'Rahmen-Farbe:',0
TEXT_15:
[000c16ca]                           dc.b 'InnenflÑche:',0
TEXT_16:
[000c16d7]                           dc.b 'Text:',0
TEXT_18:
[000c16dd]                           dc.b 'Pos:',0
TEXT_19:
[000c16e2]                           dc.b 'oben:',0
TEXT_20:
[000c16e8]                           dc.b 'DitherModus',0
TEXT_21:
[000c16f4]                           dc.b 'links/',0
TEXT_22:
[000c16fb]                           dc.b 'rechts/',0
TEXT_23:
[000c1703]                           dc.b ' XXX ',0
help_title:
[000c1709]                           dc.b 'Der Innerframe-Editor',0
title:
[000c171f]                           dc.b 'INNERFRAME -',0
A_3DBUTTON01:
[000c172c] 00064a22                  dc.l A_3Dbutton
[000c1730]                           dc.w $29c1
[000c1732]                           dc.w $0178
[000c1734] 000630f2                  dc.l Auo_string
[000c1738] 000c166d                  dc.l TEXT_005
[000c173c]                           dc.w $0000
[000c173e]                           dc.w $0000
[000c1740]                           dc.w $0000
[000c1742]                           dc.w $0000
[000c1744]                           dc.w $0000
[000c1746]                           dc.w $0000
[000c1748]                           dc.w $0000
[000c174a]                           dc.w $0000
A_3DBUTTON02:
[000c174c] 00064a22                  dc.l A_3Dbutton
[000c1750]                           dc.w $29c1
[000c1752]                           dc.w $0178
[000c1754] 000630f2                  dc.l Auo_string
[000c1758] 000c1670                  dc.l TEXT_009
[000c175c]                           dc.w $0000
[000c175e]                           dc.w $0000
[000c1760]                           dc.w $0000
[000c1762]                           dc.w $0000
[000c1764]                           dc.w $0000
[000c1766]                           dc.w $0000
[000c1768]                           dc.w $0000
[000c176a]                           dc.w $0000
A_3DBUTTON05:
[000c176c] 00064a22                  dc.l A_3Dbutton
[000c1770]                           dc.w $29f1
[000c1772]                           dc.w $0178
[000c1774] 000630f2                  dc.l Auo_string
[000c1778]                           dc.w $0000
[000c177a]                           dc.w $0000
[000c177c]                           dc.w $0000
[000c177e]                           dc.w $0000
[000c1780]                           dc.w $0000
[000c1782]                           dc.w $0000
[000c1784]                           dc.w $0000
[000c1786]                           dc.w $0000
[000c1788]                           dc.w $0000
[000c178a]                           dc.w $0000
A_3DBUTTON06:
[000c178c] 00064a22                  dc.l A_3Dbutton
[000c1790]                           dc.w $29f1
[000c1792]                           dc.w $0178
[000c1794] 000630f2                  dc.l Auo_string
[000c1798]                           dc.w $0000
[000c179a]                           dc.w $0000
[000c179c]                           dc.w $0000
[000c179e]                           dc.w $0000
[000c17a0]                           dc.w $0000
[000c17a2]                           dc.w $0000
[000c17a4]                           dc.w $0000
[000c17a6]                           dc.w $0000
[000c17a8]                           dc.w $0000
[000c17aa]                           dc.w $0000
A_3DBUTTON27:
[000c17ac] 00064a22                  dc.l A_3Dbutton
[000c17b0]                           dc.w $09f1
[000c17b2]                           dc.w $0178
[000c17b4] 000630f2                  dc.l Auo_string
[000c17b8]                           dc.w $0000
[000c17ba]                           dc.w $0000
[000c17bc]                           dc.w $0000
[000c17be]                           dc.w $0000
[000c17c0]                           dc.w $0000
[000c17c2]                           dc.w $0000
[000c17c4]                           dc.w $0000
[000c17c6]                           dc.w $0000
[000c17c8]                           dc.w $0000
[000c17ca]                           dc.w $0000
A_ARROWS02:
[000c17cc] 00065c72                  dc.l A_arrows
[000c17d0]                           dc.w $1301
[000c17d2]                           dc.w $0001
[000c17d4]                           dc.w $0000
[000c17d6]                           dc.w $0000
[000c17d8]                           dc.w $0000
[000c17da]                           dc.w $0000
[000c17dc]                           dc.w $0000
[000c17de]                           dc.w $0000
[000c17e0]                           dc.w $0000
[000c17e2]                           dc.w $0000
[000c17e4]                           dc.w $0000
[000c17e6]                           dc.w $0000
[000c17e8]                           dc.w $0000
[000c17ea]                           dc.w $0000
A_BOXED02:
[000c17ec] 0006afea                  dc.l A_boxed
[000c17f0]                           dc.w $9000
[000c17f2]                           dc.w $ff12
[000c17f4] 0006a068                  dc.l Auo_boxed
[000c17f8]                           dc.w $0000
[000c17fa]                           dc.w $0000
[000c17fc]                           dc.w $0000
[000c17fe]                           dc.w $0000
[000c1800]                           dc.w $0000
[000c1802]                           dc.w $0000
[000c1804] 000c155a                  dc.l BUBBLE_01
[000c1808]                           dc.w $0000
[000c180a]                           dc.w $0000
A_BOXED03:
[000c180c] 0006afea                  dc.l A_boxed
[000c1810]                           dc.w $9038
[000c1812]                           dc.w $ff12
[000c1814] 0006a068                  dc.l Auo_boxed
[000c1818]                           dc.w $0000
[000c181a]                           dc.w $0000
[000c181c]                           dc.w $0000
[000c181e]                           dc.w $0000
[000c1820]                           dc.w $0000
[000c1822]                           dc.w $0000
[000c1824] 000c1579                  dc.l BUBBLE_03
[000c1828]                           dc.w $0000
[000c182a]                           dc.w $0000
A_BOXED04:
[000c182c] 0006afea                  dc.l A_boxed
[000c1830]                           dc.w $9038
[000c1832]                           dc.w $ff12
[000c1834] 0006a068                  dc.l Auo_boxed
[000c1838]                           dc.w $0000
[000c183a]                           dc.w $0000
[000c183c]                           dc.w $0000
[000c183e]                           dc.w $0000
[000c1840]                           dc.w $0000
[000c1842]                           dc.w $0000
[000c1844] 000c15cb                  dc.l BUBBLE_05
[000c1848]                           dc.w $0000
[000c184a]                           dc.w $0000
A_CHECKBOX01:
[000c184c] 0006323e                  dc.l A_checkbox
[000c1850]                           dc.w $0000
[000c1852]                           dc.w $0001
[000c1854] 000630f2                  dc.l Auo_string
[000c1858] 000c16e8                  dc.l TEXT_20
[000c185c]                           dc.w $0000
[000c185e]                           dc.w $0000
[000c1860]                           dc.w $0000
[000c1862]                           dc.w $0000
[000c1864]                           dc.w $0000
[000c1866]                           dc.w $0000
[000c1868]                           dc.w $0000
[000c186a]                           dc.w $0000
A_INNERFRAME01:
[000c186c] 00064256                  dc.l A_innerframe
[000c1870]                           dc.w $1400
[000c1872]                           dc.w $8f11
[000c1874] 000630f2                  dc.l Auo_string
[000c1878]                           dc.w $0000
[000c187a]                           dc.w $0000
[000c187c]                           dc.w $0000
[000c187e]                           dc.w $0000
[000c1880]                           dc.w $0000
[000c1882]                           dc.w $0000
[000c1884]                           dc.w $0000
[000c1886]                           dc.w $0000
[000c1888]                           dc.w $0000
[000c188a]                           dc.w $0000
A_INNERFRAME02:
[000c188c] 00064256                  dc.l A_innerframe
[000c1890]                           dc.w $1800
[000c1892]                           dc.w $8f19
[000c1894] 000630f2                  dc.l Auo_string
[000c1898] 000c16d7                  dc.l TEXT_16
[000c189c]                           dc.w $0000
[000c189e]                           dc.w $0000
[000c18a0]                           dc.w $0000
[000c18a2]                           dc.w $0000
[000c18a4]                           dc.w $0000
[000c18a6]                           dc.w $0000
[000c18a8]                           dc.w $0000
[000c18aa]                           dc.w $0000
A_INNERFRAME03:
[000c18ac] 00064256                  dc.l A_innerframe
[000c18b0]                           dc.w $1800
[000c18b2]                           dc.w $8f19
[000c18b4] 000630f2                  dc.l Auo_string
[000c18b8] 000c1678                  dc.l TEXT_05
[000c18bc]                           dc.w $0000
[000c18be]                           dc.w $0000
[000c18c0]                           dc.w $0000
[000c18c2]                           dc.w $0000
[000c18c4]                           dc.w $0000
[000c18c6]                           dc.w $0000
[000c18c8]                           dc.w $0000
[000c18ca]                           dc.w $0000
A_INNERFRAME04:
[000c18cc] 00064256                  dc.l A_innerframe
[000c18d0]                           dc.w $1800
[000c18d2]                           dc.w $8f19
[000c18d4] 000630f2                  dc.l Auo_string
[000c18d8] 000c1667                  dc.l TEXT_001
[000c18dc]                           dc.w $0000
[000c18de]                           dc.w $0000
[000c18e0]                           dc.w $0000
[000c18e2]                           dc.w $0000
[000c18e4]                           dc.w $0000
[000c18e6]                           dc.w $0000
[000c18e8]                           dc.w $0000
[000c18ea]                           dc.w $0000
A_INNERFRAME05:
[000c18ec] 00064256                  dc.l A_innerframe
[000c18f0]                           dc.w $1800
[000c18f2]                           dc.w $8f19
[000c18f4] 000630f2                  dc.l Auo_string
[000c18f8] 000c16ca                  dc.l TEXT_15
[000c18fc]                           dc.w $0000
[000c18fe]                           dc.w $0000
[000c1900]                           dc.w $0000
[000c1902]                           dc.w $0000
[000c1904]                           dc.w $0000
[000c1906]                           dc.w $0000
[000c1908]                           dc.w $0000
[000c190a]                           dc.w $0000
A_INNERFRAME06:
[000c190c] 00064256                  dc.l A_innerframe
[000c1910]                           dc.w $1800
[000c1912]                           dc.w $8f19
[000c1914] 000630f2                  dc.l Auo_string
[000c1918] 000c16bc                  dc.l TEXT_14
[000c191c]                           dc.w $0000
[000c191e]                           dc.w $0000
[000c1920]                           dc.w $0000
[000c1922]                           dc.w $0000
[000c1924]                           dc.w $0000
[000c1926]                           dc.w $0000
[000c1928]                           dc.w $0000
[000c192a]                           dc.w $0000
POP_POSSEL:
[000c192c]                           dc.w $ffff
[000c192e]                           dc.w $0001
[000c1930]                           dc.w $0001
[000c1932]                           dc.w $0014
[000c1934]                           dc.w $0000
[000c1936]                           dc.w $0020
[000c1938]                           dc.w $00ff
[000c193a]                           dc.w $1100
[000c193c]                           dc.w $0000
[000c193e]                           dc.w $0000
[000c1940]                           dc.w $000f
[000c1942]                           dc.w $0002
_01_POP_POSSEL:
[000c1944]                           dc.w $0000
[000c1946]                           dc.w $0002
[000c1948]                           dc.w $0007
[000c194a]                           dc.w $0018
[000c194c]                           dc.w $0000
[000c194e]                           dc.w $0000
[000c1950] 000c186c                  dc.l A_INNERFRAME01
[000c1954]                           dc.w $0000
[000c1956]                           dc.w $0000
[000c1958]                           dc.w $000f
[000c195a]                           dc.w $0002
_02_POP_POSSEL:
[000c195c]                           dc.w $0003
[000c195e]                           dc.w $ffff
[000c1960]                           dc.w $ffff
[000c1962]                           dc.w $001c
[000c1964]                           dc.w $0001
[000c1966]                           dc.w $0000
[000c1968] 000c1703                  dc.l TEXT_23
[000c196c]                           dc.w $0000
[000c196e]                           dc.w $0000
[000c1970]                           dc.w $0005
[000c1972]                           dc.w $0001
_03_POP_POSSEL:
[000c1974]                           dc.w $0004
[000c1976]                           dc.w $ffff
[000c1978]                           dc.w $ffff
[000c197a]                           dc.w $001c
[000c197c]                           dc.w $0001
[000c197e]                           dc.w $0000
[000c1980] 000c1703                  dc.l TEXT_23
[000c1984]                           dc.w $0005
[000c1986]                           dc.w $0000
[000c1988]                           dc.w $0005
[000c198a]                           dc.w $0001
_04_POP_POSSEL:
[000c198c]                           dc.w $0005
[000c198e]                           dc.w $ffff
[000c1990]                           dc.w $ffff
[000c1992]                           dc.w $001c
[000c1994]                           dc.w $0001
[000c1996]                           dc.w $0000
[000c1998] 000c1703                  dc.l TEXT_23
[000c199c]                           dc.w $000a
[000c199e]                           dc.w $0000
[000c19a0]                           dc.w $0005
[000c19a2]                           dc.w $0001
_05_POP_POSSEL:
[000c19a4]                           dc.w $0006
[000c19a6]                           dc.w $ffff
[000c19a8]                           dc.w $ffff
[000c19aa]                           dc.w $001c
[000c19ac]                           dc.w $0001
[000c19ae]                           dc.w $0000
[000c19b0] 000c1703                  dc.l TEXT_23
[000c19b4]                           dc.w $0000
[000c19b6]                           dc.w $0001
[000c19b8]                           dc.w $0005
[000c19ba]                           dc.w $0001
_06_POP_POSSEL:
[000c19bc]                           dc.w $0007
[000c19be]                           dc.w $ffff
[000c19c0]                           dc.w $ffff
[000c19c2]                           dc.w $001c
[000c19c4]                           dc.w $0001
[000c19c6]                           dc.w $0000
[000c19c8] 000c1703                  dc.l TEXT_23
[000c19cc]                           dc.w $0005
[000c19ce]                           dc.w $0001
[000c19d0]                           dc.w $0005
[000c19d2]                           dc.w $0001
_07_POP_POSSEL:
[000c19d4]                           dc.w $0001
[000c19d6]                           dc.w $ffff
[000c19d8]                           dc.w $ffff
[000c19da]                           dc.w $001c
[000c19dc]                           dc.w $0021
[000c19de]                           dc.w $0000
[000c19e0] 000c1703                  dc.l TEXT_23
[000c19e4]                           dc.w $000a
[000c19e6]                           dc.w $0001
[000c19e8]                           dc.w $0005
[000c19ea]                           dc.w $0001
ED_INNER:
[000c19ec]                           dc.w $ffff
[000c19ee]                           dc.w $0001
[000c19f0]                           dc.w $0035
[000c19f2]                           dc.w $0018
[000c19f4]                           dc.w $0040
[000c19f6]                           dc.w $0010
[000c19f8] 000c178c                  dc.l A_3DBUTTON06
[000c19fc]                           dc.w $0000
[000c19fe]                           dc.w $0000
[000c1a00]                           dc.w $003a
[000c1a02]                           dc.w $0014
_01_ED_INNER:
[000c1a04]                           dc.w $0003
[000c1a06]                           dc.w $0002
[000c1a08]                           dc.w $0002
[000c1a0a]                           dc.w $0018
[000c1a0c]                           dc.w $0040
[000c1a0e]                           dc.w $0000
[000c1a10] 000c176c                  dc.l A_3DBUTTON05
[000c1a14]                           dc.w $0000
[000c1a16]                           dc.w $0000
[000c1a18]                           dc.w $0016
[000c1a1a]                           dc.w $0004
_02_ED_INNER:
[000c1a1c]                           dc.w $0001
[000c1a1e]                           dc.w $ffff
[000c1a20]                           dc.w $ffff
[000c1a22]                           dc.w $0018
[000c1a24]                           dc.w $0000
[000c1a26]                           dc.w $0000
[000c1a28] 000c18cc                  dc.l A_INNERFRAME04
[000c1a2c]                           dc.w $0002
[000c1a2e]                           dc.w $0001
[000c1a30]                           dc.w $0012
[000c1a32]                           dc.w $0002
_03_ED_INNER:
[000c1a34]                           dc.w $0005
[000c1a36]                           dc.w $ffff
[000c1a38]                           dc.w $ffff
[000c1a3a]                           dc.w $0018
[000c1a3c]                           dc.w $4007
[000c1a3e]                           dc.w $0010
[000c1a40] 000c172c                  dc.l A_3DBUTTON01
[000c1a44]                           dc.w $001f
[000c1a46]                           dc.w $0001
[000c1a48]                           dc.w $000c
[000c1a4a]                           dc.w $0002
_03aED_INNER:
[000c1a4c] 00029984                  dc.l ok
[000c1a50]                           dc.w $0000
[000c1a52]                           dc.w $0000
[000c1a54]                           dc.w $8000
[000c1a56]                           dc.w $884f
[000c1a58]                           dc.w $0000
[000c1a5a]                           dc.w $0000
[000c1a5c]                           dc.w $0000
[000c1a5e]                           dc.w $0000
[000c1a60]                           dc.w $0000
[000c1a62]                           dc.w $0000
_05_ED_INNER:
[000c1a64]                           dc.w $0007
[000c1a66]                           dc.w $ffff
[000c1a68]                           dc.w $ffff
[000c1a6a]                           dc.w $0018
[000c1a6c]                           dc.w $4005
[000c1a6e]                           dc.w $0010
[000c1a70] 000c174c                  dc.l A_3DBUTTON02
[000c1a74]                           dc.w $002d
[000c1a76]                           dc.w $0001
[000c1a78]                           dc.w $000c
[000c1a7a]                           dc.w $0002
_05aED_INNER:
[000c1a7c] 0002995e                  dc.l abort
[000c1a80]                           dc.w $0000
[000c1a82]                           dc.w $0000
[000c1a84]                           dc.w $8000
[000c1a86]                           dc.w $8841
[000c1a88]                           dc.w $0000
[000c1a8a]                           dc.w $0000
[000c1a8c]                           dc.w $0000
[000c1a8e]                           dc.w $0000
[000c1a90]                           dc.w $0000
[000c1a92]                           dc.w $0000
_07_ED_INNER:
[000c1a94]                           dc.w $0019
[000c1a96]                           dc.w $0008
[000c1a98]                           dc.w $0016
[000c1a9a]                           dc.w $0018
[000c1a9c]                           dc.w $0040
[000c1a9e]                           dc.w $0000
[000c1aa0] 000c188c                  dc.l A_INNERFRAME02
[000c1aa4]                           dc.w $0001
[000c1aa6]                           dc.w $0004
[000c1aa8]                           dc.w $0038
[000c1aaa]                           dc.w $0005
_08_ED_INNER:
[000c1aac]                           dc.w $000a
[000c1aae]                           dc.w $0009
[000c1ab0]                           dc.w $0009
[000c1ab2]                           dc.w $001c
[000c1ab4]                           dc.w $0040
[000c1ab6]                           dc.w $0000
[000c1ab8] 000c16a6                  dc.l TEXT_10
[000c1abc]                           dc.w $0001
[000c1abe]                           dc.w $0001
[000c1ac0]                           dc.w $0006
[000c1ac2]                           dc.w $0001
_09_ED_INNER:
[000c1ac4]                           dc.w $0008
[000c1ac6]                           dc.w $ffff
[000c1ac8]                           dc.w $ffff
[000c1aca]                           dc.w $0018
[000c1acc]                           dc.w $0040
[000c1ace]                           dc.w $0000
[000c1ad0] 000c17cc                  dc.l A_ARROWS02
[000c1ad4]                           dc.w $0000
[000c1ad6]                           dc.w $0000
[000c1ad8]                           dc.w $0001
[000c1ada]                           dc.w $0001
_10_ED_INNER:
[000c1adc]                           dc.w $000e
[000c1ade]                           dc.w $000c
[000c1ae0]                           dc.w $000d
[000c1ae2]                           dc.w $0014
[000c1ae4]                           dc.w $0040
[000c1ae6]                           dc.w $0020
[000c1ae8]                           dc.w $00ff
[000c1aea]                           dc.w $1101
[000c1aec]                           dc.w $0008
[000c1aee]                           dc.w $0001
[000c1af0]                           dc.w $0012
[000c1af2]                           dc.w $0001
_10aED_INNER:
[000c1af4] 00029520                  dc.l edin_textcol
[000c1af8]                           dc.w $0000
[000c1afa]                           dc.w $0000
[000c1afc]                           dc.w $8000
[000c1afe]                           dc.w $8846
[000c1b00]                           dc.w $0000
[000c1b02]                           dc.w $0000
[000c1b04]                           dc.w $0000
[000c1b06]                           dc.w $0000
[000c1b08]                           dc.w $0000
[000c1b0a]                           dc.w $0000
_12_ED_INNER:
[000c1b0c]                           dc.w $000d
[000c1b0e]                           dc.w $ffff
[000c1b10]                           dc.w $ffff
[000c1b12]                           dc.w $0014
[000c1b14]                           dc.w $0000
[000c1b16]                           dc.w $0000
[000c1b18]                           dc.w $0001
[000c1b1a]                           dc.w $1171
[000c1b1c]                           dc.w $0010
[000c1b1e]                           dc.w $0000
[000c1b20]                           dc.w $0002
[000c1b22]                           dc.w $0001
_13_ED_INNER:
[000c1b24]                           dc.w $000a
[000c1b26]                           dc.w $ffff
[000c1b28]                           dc.w $ffff
[000c1b2a]                           dc.w $0018
[000c1b2c]                           dc.w $0000
[000c1b2e]                           dc.w $0000
[000c1b30] 000c17ac                  dc.l A_3DBUTTON27
[000c1b34]                           dc.w $0000
[000c1b36]                           dc.w $0000
[000c1b38]                           dc.w $0010
[000c1b3a]                           dc.w $0001
_14_ED_INNER:
[000c1b3c]                           dc.w $000f
[000c1b3e]                           dc.w $ffff
[000c1b40]                           dc.w $ffff
[000c1b42]                           dc.w $0018
[000c1b44]                           dc.w $0008
[000c1b46]                           dc.w $0010
[000c1b48] 000c17ec                  dc.l A_BOXED02
[000c1b4c]                           dc.w $0001
[000c1b4e]                           dc.w $0003
[000c1b50]                           dc.w $0036
[000c1b52]                           dc.w $0001
_15_ED_INNER:
[000c1b54]                           dc.w $0011
[000c1b56]                           dc.w $0010
[000c1b58]                           dc.w $0010
[000c1b5a]                           dc.w $001c
[000c1b5c]                           dc.w $0040
[000c1b5e]                           dc.w $0000
[000c1b60] 000c16dd                  dc.l TEXT_18
[000c1b64]                           dc.w $002d
[000c1b66]                           dc.w $0001
[000c1b68]                           dc.w $0004
[000c1b6a]                           dc.w $0001
_16_ED_INNER:
[000c1b6c]                           dc.w $000f
[000c1b6e]                           dc.w $ffff
[000c1b70]                           dc.w $ffff
[000c1b72]                           dc.w $0018
[000c1b74]                           dc.w $0040
[000c1b76]                           dc.w $0000
[000c1b78] 000c17cc                  dc.l A_ARROWS02
[000c1b7c]                           dc.w $0000
[000c1b7e]                           dc.w $0000
[000c1b80]                           dc.w $0001
[000c1b82]                           dc.w $0001
_17_ED_INNER:
[000c1b84]                           dc.w $0014
[000c1b86]                           dc.w $0013
[000c1b88]                           dc.w $0013
[000c1b8a]                           dc.w $0014
[000c1b8c]                           dc.w $0040
[000c1b8e]                           dc.w $0020
[000c1b90]                           dc.w $00ff
[000c1b92]                           dc.w $1101
[000c1b94]                           dc.w $0032
[000c1b96]                           dc.w $0001
[000c1b98]                           dc.w $0005
[000c1b9a]                           dc.w $0001
_17aED_INNER:
[000c1b9c] 000292aa                  dc.l edin_pos
[000c1ba0]                           dc.w $0000
[000c1ba2]                           dc.w $0000
[000c1ba4]                           dc.w $8000
[000c1ba6]                           dc.w $8850
[000c1ba8]                           dc.w $0000
[000c1baa]                           dc.w $0000
[000c1bac]                           dc.w $0000
[000c1bae]                           dc.w $0000
[000c1bb0]                           dc.w $0000
[000c1bb2]                           dc.w $0000
_19_ED_INNER:
[000c1bb4]                           dc.w $0011
[000c1bb6]                           dc.w $ffff
[000c1bb8]                           dc.w $ffff
[000c1bba]                           dc.w $0018
[000c1bbc]                           dc.w $0000
[000c1bbe]                           dc.w $0000
[000c1bc0] 000c17ac                  dc.l A_3DBUTTON27
[000c1bc4]                           dc.w $0000
[000c1bc6]                           dc.w $0000
[000c1bc8]                           dc.w $0005
[000c1bca]                           dc.w $0001
_20_ED_INNER:
[000c1bcc]                           dc.w $0016
[000c1bce]                           dc.w $0015
[000c1bd0]                           dc.w $0015
[000c1bd2]                           dc.w $001c
[000c1bd4]                           dc.w $0040
[000c1bd6]                           dc.w $0000
[000c1bd8] 000c16ad                  dc.l TEXT_12
[000c1bdc]                           dc.w $001c
[000c1bde]                           dc.w $0001
[000c1be0]                           dc.w $0006
[000c1be2]                           dc.w $0001
_21_ED_INNER:
[000c1be4]                           dc.w $0014
[000c1be6]                           dc.w $ffff
[000c1be8]                           dc.w $ffff
[000c1bea]                           dc.w $0018
[000c1bec]                           dc.w $0040
[000c1bee]                           dc.w $0000
[000c1bf0] 000c17cc                  dc.l A_ARROWS02
[000c1bf4]                           dc.w $0000
[000c1bf6]                           dc.w $0000
[000c1bf8]                           dc.w $0001
[000c1bfa]                           dc.w $0001
_22_ED_INNER:
[000c1bfc]                           dc.w $0007
[000c1bfe]                           dc.w $0018
[000c1c00]                           dc.w $0018
[000c1c02]                           dc.w $0014
[000c1c04]                           dc.w $0040
[000c1c06]                           dc.w $0020
[000c1c08]                           dc.w $00ff
[000c1c0a]                           dc.w $1101
[000c1c0c]                           dc.w $0023
[000c1c0e]                           dc.w $0001
[000c1c10]                           dc.w $0008
[000c1c12]                           dc.w $0001
_22aED_INNER:
[000c1c14] 00029414                  dc.l edin_size
[000c1c18]                           dc.w $0000
[000c1c1a]                           dc.w $0000
[000c1c1c]                           dc.w $8000
[000c1c1e]                           dc.w $8847
[000c1c20]                           dc.w $0000
[000c1c22]                           dc.w $0000
[000c1c24]                           dc.w $0000
[000c1c26]                           dc.w $0000
[000c1c28]                           dc.w $0000
[000c1c2a]                           dc.w $0000
_24_ED_INNER:
[000c1c2c]                           dc.w $0016
[000c1c2e]                           dc.w $ffff
[000c1c30]                           dc.w $ffff
[000c1c32]                           dc.w $0018
[000c1c34]                           dc.w $0000
[000c1c36]                           dc.w $0000
[000c1c38] 000c176c                  dc.l A_3DBUTTON05
[000c1c3c]                           dc.w $0000
[000c1c3e]                           dc.w $0000
[000c1c40]                           dc.w $0008
[000c1c42]                           dc.w $0001
_25_ED_INNER:
[000c1c44]                           dc.w $0028
[000c1c46]                           dc.w $001a
[000c1c48]                           dc.w $0024
[000c1c4a]                           dc.w $0018
[000c1c4c]                           dc.w $0040
[000c1c4e]                           dc.w $0000
[000c1c50] 000c190c                  dc.l A_INNERFRAME06
[000c1c54]                           dc.w $0001
[000c1c56]                           dc.w $0009
[000c1c58]                           dc.w $001c
[000c1c5a]                           dc.w $0006
_26_ED_INNER:
[000c1c5c]                           dc.w $001c
[000c1c5e]                           dc.w $001b
[000c1c60]                           dc.w $001b
[000c1c62]                           dc.w $001c
[000c1c64]                           dc.w $0040
[000c1c66]                           dc.w $0000
[000c1c68] 000c16f4                  dc.l TEXT_21
[000c1c6c]                           dc.w $0002
[000c1c6e]                           dc.w $0001
[000c1c70]                           dc.w $0006
[000c1c72]                           dc.w $0001
_27_ED_INNER:
[000c1c74]                           dc.w $001a
[000c1c76]                           dc.w $ffff
[000c1c78]                           dc.w $ffff
[000c1c7a]                           dc.w $0018
[000c1c7c]                           dc.w $0040
[000c1c7e]                           dc.w $0000
[000c1c80] 000c17cc                  dc.l A_ARROWS02
[000c1c84]                           dc.w $0000
[000c1c86]                           dc.w $0000
[000c1c88]                           dc.w $0001
[000c1c8a]                           dc.w $0001
_28_ED_INNER:
[000c1c8c]                           dc.w $0020
[000c1c8e]                           dc.w $001e
[000c1c90]                           dc.w $001f
[000c1c92]                           dc.w $0014
[000c1c94]                           dc.w $0040
[000c1c96]                           dc.w $0020
[000c1c98]                           dc.w $00ff
[000c1c9a]                           dc.w $1101
[000c1c9c]                           dc.w $0009
[000c1c9e]                           dc.w $0002
[000c1ca0]                           dc.w $0012
[000c1ca2]                           dc.w $0001
_28aED_INNER:
[000c1ca4] 00029150                  dc.l edin_outcol
[000c1ca8]                           dc.w $0000
[000c1caa]                           dc.w $0000
[000c1cac]                           dc.w $8000
[000c1cae]                           dc.w $884c
[000c1cb0]                           dc.w $0000
[000c1cb2]                           dc.w $0000
[000c1cb4]                           dc.w $0000
[000c1cb6]                           dc.w $0000
[000c1cb8]                           dc.w $0000
[000c1cba]                           dc.w $0000
_30_ED_INNER:
[000c1cbc]                           dc.w $001f
[000c1cbe]                           dc.w $ffff
[000c1cc0]                           dc.w $ffff
[000c1cc2]                           dc.w $0014
[000c1cc4]                           dc.w $0000
[000c1cc6]                           dc.w $0000
[000c1cc8]                           dc.w $4301
[000c1cca]                           dc.w $1371
[000c1ccc]                           dc.w $0010
[000c1cce]                           dc.w $0000
[000c1cd0]                           dc.w $0002
[000c1cd2]                           dc.w $0001
_31_ED_INNER:
[000c1cd4]                           dc.w $001c
[000c1cd6]                           dc.w $ffff
[000c1cd8]                           dc.w $ffff
[000c1cda]                           dc.w $0018
[000c1cdc]                           dc.w $0000
[000c1cde]                           dc.w $0000
[000c1ce0] 000c17ac                  dc.l A_3DBUTTON27
[000c1ce4]                           dc.w $0000
[000c1ce6]                           dc.w $0000
[000c1ce8]                           dc.w $0010
[000c1cea]                           dc.w $0001
_32_ED_INNER:
[000c1cec]                           dc.w $0021
[000c1cee]                           dc.w $ffff
[000c1cf0]                           dc.w $ffff
[000c1cf2]                           dc.w $001c
[000c1cf4]                           dc.w $0040
[000c1cf6]                           dc.w $0000
[000c1cf8] 000c16e2                  dc.l TEXT_19
[000c1cfc]                           dc.w $0003
[000c1cfe]                           dc.w $0002
[000c1d00]                           dc.w $0005
[000c1d02]                           dc.w $0001
_33_ED_INNER:
[000c1d04]                           dc.w $0023
[000c1d06]                           dc.w $0022
[000c1d08]                           dc.w $0022
[000c1d0a]                           dc.w $001c
[000c1d0c]                           dc.w $0040
[000c1d0e]                           dc.w $0000
[000c1d10] 000c16fb                  dc.l TEXT_22
[000c1d14]                           dc.w $0001
[000c1d16]                           dc.w $0003
[000c1d18]                           dc.w $0007
[000c1d1a]                           dc.w $0001
_34_ED_INNER:
[000c1d1c]                           dc.w $0021
[000c1d1e]                           dc.w $ffff
[000c1d20]                           dc.w $ffff
[000c1d22]                           dc.w $0018
[000c1d24]                           dc.w $0040
[000c1d26]                           dc.w $0000
[000c1d28] 000c17cc                  dc.l A_ARROWS02
[000c1d2c]                           dc.w $0000
[000c1d2e]                           dc.w $0000
[000c1d30]                           dc.w $0001
[000c1d32]                           dc.w $0001
_35_ED_INNER:
[000c1d34]                           dc.w $0024
[000c1d36]                           dc.w $ffff
[000c1d38]                           dc.w $ffff
[000c1d3a]                           dc.w $001c
[000c1d3c]                           dc.w $0040
[000c1d3e]                           dc.w $0000
[000c1d40] 000c169f                  dc.l TEXT_09
[000c1d44]                           dc.w $0002
[000c1d46]                           dc.w $0004
[000c1d48]                           dc.w $0006
[000c1d4a]                           dc.w $0001
_36_ED_INNER:
[000c1d4c]                           dc.w $0019
[000c1d4e]                           dc.w $0026
[000c1d50]                           dc.w $0027
[000c1d52]                           dc.w $0014
[000c1d54]                           dc.w $0040
[000c1d56]                           dc.w $0020
[000c1d58]                           dc.w $00ff
[000c1d5a]                           dc.w $1101
[000c1d5c]                           dc.w $0009
[000c1d5e]                           dc.w $0004
[000c1d60]                           dc.w $0012
[000c1d62]                           dc.w $0001
_36aED_INNER:
[000c1d64] 00029080                  dc.l edin_incol
[000c1d68]                           dc.w $0000
[000c1d6a]                           dc.w $0000
[000c1d6c]                           dc.w $8000
[000c1d6e]                           dc.w $8852
[000c1d70]                           dc.w $0000
[000c1d72]                           dc.w $0000
[000c1d74]                           dc.w $0000
[000c1d76]                           dc.w $0000
[000c1d78]                           dc.w $0000
[000c1d7a]                           dc.w $0000
_38_ED_INNER:
[000c1d7c]                           dc.w $0027
[000c1d7e]                           dc.w $ffff
[000c1d80]                           dc.w $ffff
[000c1d82]                           dc.w $0014
[000c1d84]                           dc.w $0000
[000c1d86]                           dc.w $0000
[000c1d88]                           dc.w $4301
[000c1d8a]                           dc.w $1371
[000c1d8c]                           dc.w $0010
[000c1d8e]                           dc.w $0000
[000c1d90]                           dc.w $0002
[000c1d92]                           dc.w $0001
_39_ED_INNER:
[000c1d94]                           dc.w $0024
[000c1d96]                           dc.w $ffff
[000c1d98]                           dc.w $ffff
[000c1d9a]                           dc.w $0018
[000c1d9c]                           dc.w $0000
[000c1d9e]                           dc.w $0000
[000c1da0] 000c17ac                  dc.l A_3DBUTTON27
[000c1da4]                           dc.w $0000
[000c1da6]                           dc.w $0000
[000c1da8]                           dc.w $0010
[000c1daa]                           dc.w $0001
_40_ED_INNER:
[000c1dac]                           dc.w $0035
[000c1dae]                           dc.w $0029
[000c1db0]                           dc.w $0031
[000c1db2]                           dc.w $0018
[000c1db4]                           dc.w $0040
[000c1db6]                           dc.w $0000
[000c1db8] 000c18ec                  dc.l A_INNERFRAME05
[000c1dbc]                           dc.w $001d
[000c1dbe]                           dc.w $0009
[000c1dc0]                           dc.w $001c
[000c1dc2]                           dc.w $0006
_41_ED_INNER:
[000c1dc4]                           dc.w $002b
[000c1dc6]                           dc.w $ffff
[000c1dc8]                           dc.w $ffff
[000c1dca]                           dc.w $0018
[000c1dcc]                           dc.w $0041
[000c1dce]                           dc.w $0001
[000c1dd0] 000c184c                  dc.l A_CHECKBOX01
[000c1dd4]                           dc.w $0001
[000c1dd6]                           dc.w $0001
[000c1dd8]                           dc.w $000e
[000c1dda]                           dc.w $0001
_41aED_INNER:
[000c1ddc] 0002900e                  dc.l edin_dither
[000c1de0]                           dc.w $0000
[000c1de2]                           dc.w $0000
[000c1de4]                           dc.w $8000
[000c1de6]                           dc.w $8844
[000c1de8]                           dc.w $0000
[000c1dea]                           dc.w $0000
[000c1dec]                           dc.w $0000
[000c1dee]                           dc.w $0000
[000c1df0]                           dc.w $0000
[000c1df2]                           dc.w $0000
_43_ED_INNER:
[000c1df4]                           dc.w $002d
[000c1df6]                           dc.w $ffff
[000c1df8]                           dc.w $ffff
[000c1dfa]                           dc.w $0014
[000c1dfc]                           dc.w $0040
[000c1dfe]                           dc.w $0020
[000c1e00]                           dc.w $00ff
[000c1e02]                           dc.w $1101
[000c1e04]                           dc.w $0009
[000c1e06]                           dc.w $0002
[000c1e08]                           dc.w $0012
[000c1e0a]                           dc.w $0001
_43aED_INNER:
[000c1e0c] 000291ac                  dc.l edin_pattern
[000c1e10]                           dc.w $0000
[000c1e12]                           dc.w $0000
[000c1e14]                           dc.w $8000
[000c1e16]                           dc.w $884d
[000c1e18]                           dc.w $0000
[000c1e1a]                           dc.w $0000
[000c1e1c]                           dc.w $0000
[000c1e1e]                           dc.w $0000
[000c1e20]                           dc.w $0000
[000c1e22]                           dc.w $0000
_45_ED_INNER:
[000c1e24]                           dc.w $002f
[000c1e26]                           dc.w $002e
[000c1e28]                           dc.w $002e
[000c1e2a]                           dc.w $001c
[000c1e2c]                           dc.w $0040
[000c1e2e]                           dc.w $0000
[000c1e30] 000c16b4                  dc.l TEXT_13
[000c1e34]                           dc.w $0001
[000c1e36]                           dc.w $0002
[000c1e38]                           dc.w $0008
[000c1e3a]                           dc.w $0001
_46_ED_INNER:
[000c1e3c]                           dc.w $002d
[000c1e3e]                           dc.w $ffff
[000c1e40]                           dc.w $ffff
[000c1e42]                           dc.w $0018
[000c1e44]                           dc.w $0040
[000c1e46]                           dc.w $0000
[000c1e48] 000c17cc                  dc.l A_ARROWS02
[000c1e4c]                           dc.w $0000
[000c1e4e]                           dc.w $0000
[000c1e50]                           dc.w $0001
[000c1e52]                           dc.w $0001
_47_ED_INNER:
[000c1e54]                           dc.w $0031
[000c1e56]                           dc.w $0030
[000c1e58]                           dc.w $0030
[000c1e5a]                           dc.w $001c
[000c1e5c]                           dc.w $0040
[000c1e5e]                           dc.w $0000
[000c1e60] 000c16a6                  dc.l TEXT_10
[000c1e64]                           dc.w $0002
[000c1e66]                           dc.w $0004
[000c1e68]                           dc.w $0006
[000c1e6a]                           dc.w $0001
_48_ED_INNER:
[000c1e6c]                           dc.w $002f
[000c1e6e]                           dc.w $ffff
[000c1e70]                           dc.w $ffff
[000c1e72]                           dc.w $0018
[000c1e74]                           dc.w $0040
[000c1e76]                           dc.w $0000
[000c1e78] 000c17cc                  dc.l A_ARROWS02
[000c1e7c]                           dc.w $0003
[000c1e7e]                           dc.w $0000
[000c1e80]                           dc.w $0001
[000c1e82]                           dc.w $0001
_49_ED_INNER:
[000c1e84]                           dc.w $0028
[000c1e86]                           dc.w $0033
[000c1e88]                           dc.w $0034
[000c1e8a]                           dc.w $0014
[000c1e8c]                           dc.w $0040
[000c1e8e]                           dc.w $0020
[000c1e90]                           dc.w $00ff
[000c1e92]                           dc.w $1101
[000c1e94]                           dc.w $0009
[000c1e96]                           dc.w $0004
[000c1e98]                           dc.w $0012
[000c1e9a]                           dc.w $0001
_49aED_INNER:
[000c1e9c] 000290e8                  dc.l edin_intercol
[000c1ea0]                           dc.w $0000
[000c1ea2]                           dc.w $0000
[000c1ea4]                           dc.w $8000
[000c1ea6]                           dc.w $8842
[000c1ea8]                           dc.w $0000
[000c1eaa]                           dc.w $0000
[000c1eac]                           dc.w $0000
[000c1eae]                           dc.w $0000
[000c1eb0]                           dc.w $0000
[000c1eb2]                           dc.w $0000
_51_ED_INNER:
[000c1eb4]                           dc.w $0034
[000c1eb6]                           dc.w $ffff
[000c1eb8]                           dc.w $ffff
[000c1eba]                           dc.w $0014
[000c1ebc]                           dc.w $0000
[000c1ebe]                           dc.w $0000
[000c1ec0]                           dc.w $0001
[000c1ec2]                           dc.w $1171
[000c1ec4]                           dc.w $0010
[000c1ec6]                           dc.w $0000
[000c1ec8]                           dc.w $0002
[000c1eca]                           dc.w $0001
_52_ED_INNER:
[000c1ecc]                           dc.w $0031
[000c1ece]                           dc.w $ffff
[000c1ed0]                           dc.w $ffff
[000c1ed2]                           dc.w $0018
[000c1ed4]                           dc.w $0000
[000c1ed6]                           dc.w $0000
[000c1ed8] 000c17ac                  dc.l A_3DBUTTON27
[000c1edc]                           dc.w $0000
[000c1ede]                           dc.w $0000
[000c1ee0]                           dc.w $0010
[000c1ee2]                           dc.w $0001
_53_ED_INNER:
[000c1ee4]                           dc.w $0000
[000c1ee6]                           dc.w $0036
[000c1ee8]                           dc.w $0039
[000c1eea]                           dc.w $0018
[000c1eec]                           dc.w $0040
[000c1eee]                           dc.w $0000
[000c1ef0] 000c18ac                  dc.l A_INNERFRAME03
[000c1ef4]                           dc.w $0001
[000c1ef6]                           dc.w $000f
[000c1ef8]                           dc.w $0038
[000c1efa]                           dc.w $0005
_54_ED_INNER:
[000c1efc]                           dc.w $0037
[000c1efe]                           dc.w $ffff
[000c1f00]                           dc.w $ffff
[000c1f02]                           dc.w $001c
[000c1f04]                           dc.w $0000
[000c1f06]                           dc.w $0000
[000c1f08] 000c1682                  dc.l TEXT_06
[000c1f0c]                           dc.w $0001
[000c1f0e]                           dc.w $0001
[000c1f10]                           dc.w $000e
[000c1f12]                           dc.w $0001
_55_ED_INNER:
[000c1f14]                           dc.w $0038
[000c1f16]                           dc.w $ffff
[000c1f18]                           dc.w $ffff
[000c1f1a]                           dc.w $001c
[000c1f1c]                           dc.w $0000
[000c1f1e]                           dc.w $0000
[000c1f20] 000c1691                  dc.l TEXT_07
[000c1f24]                           dc.w $0001
[000c1f26]                           dc.w $0003
[000c1f28]                           dc.w $000d
[000c1f2a]                           dc.w $0001
_56_ED_INNER:
[000c1f2c]                           dc.w $0039
[000c1f2e]                           dc.w $ffff
[000c1f30]                           dc.w $ffff
[000c1f32]                           dc.w $0018
[000c1f34]                           dc.w $0008
[000c1f36]                           dc.w $0010
[000c1f38] 000c180c                  dc.l A_BOXED03
[000c1f3c]                           dc.w $0010
[000c1f3e]                           dc.w $0001
[000c1f40]                           dc.w $0027
[000c1f42]                           dc.w $0001
_57_ED_INNER:
[000c1f44]                           dc.w $0035
[000c1f46]                           dc.w $ffff
[000c1f48]                           dc.w $ffff
[000c1f4a]                           dc.w $0018
[000c1f4c]                           dc.w $0028
[000c1f4e]                           dc.w $0010
[000c1f50] 000c182c                  dc.l A_BOXED04
[000c1f54]                           dc.w $0010
[000c1f56]                           dc.w $0003
[000c1f58]                           dc.w $0027
[000c1f5a]                           dc.w $0001
INNER1:
[000c1f5c] 00064256                  dc.l A_innerframe
[000c1f60]                           dc.w $1800
[000c1f62]                           dc.w $8f19
[000c1f64] 000630f2                  dc.l Auo_string
[000c1f68] 000c204a                  dc.l $000c204a
[000c1f6c]                           dc.w $0000
[000c1f6e]                           dc.w $0000
[000c1f70]                           dc.w $0000
[000c1f72]                           dc.w $0000
[000c1f74]                           dc.w $0000
[000c1f76]                           dc.w $0000
[000c1f78]                           dc.w $0000
[000c1f7a]                           dc.w $0000
INNER2:
[000c1f7c] 00064256                  dc.l A_innerframe
[000c1f80]                           dc.w $1000
[000c1f82]                           dc.w $8f19
[000c1f84] 000630f2                  dc.l Auo_string
[000c1f88] 000c204a                  dc.l $000c204a
[000c1f8c]                           dc.w $0000
[000c1f8e]                           dc.w $0000
[000c1f90]                           dc.w $0000
[000c1f92]                           dc.w $0000
[000c1f94]                           dc.w $0000
[000c1f96]                           dc.w $0000
[000c1f98]                           dc.w $0000
[000c1f9a]                           dc.w $0000
visual:
[000c1f9c]                           dc.w $ffff
[000c1f9e]                           dc.w $ffff
[000c1fa0]                           dc.w $ffff
[000c1fa2]                           dc.w $0018
[000c1fa4]                           dc.w $2001
[000c1fa6]                           dc.w $0010
[000c1fa8] 000c1f5c                  dc.l INNER1
[000c1fac]                           dc.w $0000
[000c1fae]                           dc.w $0000
[000c1fb0]                           dc.w $000a
[000c1fb2]                           dc.w $0002
logical:
[000c1fb4]                           dc.w $ffff
[000c1fb6]                           dc.w $ffff
[000c1fb8]                           dc.w $ffff
[000c1fba]                           dc.w $0018
[000c1fbc]                           dc.w $0040
[000c1fbe]                           dc.w $0000
[000c1fc0] 000c1f7c                  dc.l INNER2
[000c1fc4]                           dc.w $0000
[000c1fc6]                           dc.w $0000
[000c1fc8]                           dc.w $0007
[000c1fca]                           dc.w $0002
aud:
[000c1fcc] 000c2050                  dc.l $000c2050
[000c1fd0] 000c205c                  dc.l $000c205c
[000c1fd4]                           dc.w $0002
[000c1fd6] 000c204a                  dc.l $000c204a
[000c1fda]                           dc.w $0000
[000c1fdc]                           dc.w $0000
[000c1fde]                           dc.w $0000
[000c1fe0]                           dc.w $0000
[000c1fe2]                           dc.w $0000
[000c1fe4]                           dc.w $0000
[000c1fe6]                           dc.w $0000
[000c1fe8]                           dc.w $0000
[000c1fea]                           dc.w $0000
[000c1fec]                           dc.w $0000
[000c1fee]                           dc.w $0000
[000c1ff0]                           dc.w $0000
[000c1ff2]                           dc.w $0000
[000c1ff4]                           dc.w $0000
[000c1ff6]                           dc.w $0000
[000c1ff8]                           dc.w $0000
data:
[000c1ffa]                           dc.b 'A_innerframe',0
[000c2007]                           dc.b $00
[000c2008]                           dc.w $0000
[000c200a]                           dc.w $0000
[000c200c]                           dc.w $0000
[000c200e]                           dc.w $0000
[000c2010]                           dc.w $0000
[000c2012]                           dc.w $0000
[000c2014]                           dc.w $0000
[000c2016]                           dc.w $0000
[000c2018]                           dc.w $0000
[000c201a] 000295e8                  dc.l object_tree
[000c201e] 000298dc                  dc.l test_it
[000c2022] 00029984                  dc.l ok
[000c2026] 0004f20a                  dc.l Aob_delete
[000c202a] 000c1f9c                  dc.l visual
[000c202e] 000c1fb4                  dc.l logical
[000c2032] 000c1fcc                  dc.l aud
[000c2036] 000295a0                  dc.l minsize
[000c203a]                           dc.w $0000
[000c203c]                           dc.w $0000
[000c203e] 000c171f                  dc.l title
[000c2042] 000c1709                  dc.l help_title
[000c2046]                           dc.w $0000
[000c2048]                           dc.w $0000
[000c204a]                           dc.b 'Titel',0
[000c2050]                           dc.b '0x10008f19L',0
[000c205c]                           dc.b 'Auo_string',0
[000c2067]                           dc.b '0x%lxL',0
