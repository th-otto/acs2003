edar_3d:
[000283bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000283c2] 2268 025c                 movea.l    604(a0),a1
[000283c6] 2069 003c                 movea.l    60(a1),a0
[000283ca] 0aa8 8000 0000 0004       eori.l     #$80000000,4(a0)
[000283d2] 72ff                      moveq.l    #-1,d1
[000283d4] 7001                      moveq.l    #1,d0
[000283d6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000283dc] 2068 0258                 movea.l    600(a0),a0
[000283e0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000283e6] 2269 0258                 movea.l    600(a1),a1
[000283ea] 2269 0066                 movea.l    102(a1),a1
[000283ee] 4e91                      jsr        (a1)
[000283f0] 4e75                      rts
edar_arr:
[000283f2] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000283f6] 514f                      subq.w     #8,a7
[000283f8] 41f9 000b fb68            lea.l      POP_ARR,a0
[000283fe] 4eb9 0004 f064            jsr        Aob_create
[00028404] 2448                      movea.l    a0,a2
[00028406] 200a                      move.l     a2,d0
[00028408] 6700 0106                 beq        $00028510
[0002840c] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00028412] 7009                      moveq.l    #9,d0
[00028414] 2053                      movea.l    (a3),a0
[00028416] 2268 0258                 movea.l    600(a0),a1
[0002841a] 2269 0014                 movea.l    20(a1),a1
[0002841e] 41d7                      lea.l      (a7),a0
[00028420] 4eb9 0004 fe06            jsr        Aob_offset
[00028426] 7001                      moveq.l    #1,d0
[00028428] 2053                      movea.l    (a3),a0
[0002842a] 2268 0258                 movea.l    600(a0),a1
[0002842e] d069 0034                 add.w      52(a1),d0
[00028432] d157                      add.w      d0,(a7)
[00028434] 7201                      moveq.l    #1,d1
[00028436] d269 0036                 add.w      54(a1),d1
[0002843a] d36f 0002                 add.w      d1,2(a7)
[0002843e] 2049                      movea.l    a1,a0
[00028440] 224a                      movea.l    a2,a1
[00028442] 3017                      move.w     (a7),d0
[00028444] 322f 0002                 move.w     2(a7),d1
[00028448] 4eb9 0004 e84a            jsr        Ame_popup
[0002844e] 3600                      move.w     d0,d3
[00028450] 4a40                      tst.w      d0
[00028452] 6f00 00b4                 ble        $00028508
[00028456] 2053                      movea.l    (a3),a0
[00028458] 2268 025c                 movea.l    604(a0),a1
[0002845c] 2869 003c                 movea.l    60(a1),a4
[00028460] 584c                      addq.w     #4,a4
[00028462] 48c0                      ext.l      d0
[00028464] 2200                      move.l     d0,d1
[00028466] d281                      add.l      d1,d1
[00028468] d280                      add.l      d0,d1
[0002846a] e789                      lsl.l      #3,d1
[0002846c] 2072 180c                 movea.l    12(a2,d1.l),a0
[00028470] 5848                      addq.w     #4,a0
[00028472] 3403                      move.w     d3,d2
[00028474] b47c 0008                 cmp.w      #$0008,d2
[00028478] 6262                      bhi.s      $000284DC
[0002847a] d442                      add.w      d2,d2
[0002847c] 343b 2006                 move.w     $00028484(pc,d2.w),d2
[00028480] 4efb 2002                 jmp        $00028484(pc,d2.w)
J10:
[00028484] 0058                      dc.w $0058   ; $000284dc-$00028484
[00028486] 0012                      dc.w $0012   ; $00028496-$00028484
[00028488] 0036                      dc.w $0036   ; $000284ba-$00028484
[0002848a] 0012                      dc.w $0012   ; $00028496-$00028484
[0002848c] 0036                      dc.w $0036   ; $000284ba-$00028484
[0002848e] 0012                      dc.w $0012   ; $00028496-$00028484
[00028490] 0036                      dc.w $0036   ; $000284ba-$00028484
[00028492] 0012                      dc.w $0012   ; $00028496-$00028484
[00028494] 0036                      dc.w $0036   ; $000284ba-$00028484
[00028496] 2014                      move.l     (a4),d0
[00028498] c0bc fcff ffff            and.l      #$FCFFFFFF,d0
[0002849e] 2210                      move.l     (a0),d1
[000284a0] c2bc 0300 0000            and.l      #$03000000,d1
[000284a6] 8081                      or.l       d1,d0
[000284a8] 2880                      move.l     d0,(a4)
[000284aa] 2253                      movea.l    (a3),a1
[000284ac] 2269 025c                 movea.l    604(a1),a1
[000284b0] 2269 0114                 movea.l    276(a1),a1
[000284b4] 2350 0004                 move.l     (a0),4(a1)
[000284b8] 6022                      bra.s      $000284DC
[000284ba] 2014                      move.l     (a4),d0
[000284bc] c0bc cfff ffff            and.l      #$CFFFFFFF,d0
[000284c2] 2210                      move.l     (a0),d1
[000284c4] c2bc 3000 0000            and.l      #$30000000,d1
[000284ca] 8081                      or.l       d1,d0
[000284cc] 2880                      move.l     d0,(a4)
[000284ce] 2253                      movea.l    (a3),a1
[000284d0] 2869 025c                 movea.l    604(a1),a4
[000284d4] 226c 012c                 movea.l    300(a4),a1
[000284d8] 2350 0004                 move.l     (a0),4(a1)
[000284dc] 72ff                      moveq.l    #-1,d1
[000284de] 7009                      moveq.l    #9,d0
[000284e0] 2053                      movea.l    (a3),a0
[000284e2] 2068 0258                 movea.l    600(a0),a0
[000284e6] 2253                      movea.l    (a3),a1
[000284e8] 2869 0258                 movea.l    600(a1),a4
[000284ec] 226c 0066                 movea.l    102(a4),a1
[000284f0] 4e91                      jsr        (a1)
[000284f2] 72ff                      moveq.l    #-1,d1
[000284f4] 7001                      moveq.l    #1,d0
[000284f6] 2053                      movea.l    (a3),a0
[000284f8] 2068 0258                 movea.l    600(a0),a0
[000284fc] 2253                      movea.l    (a3),a1
[000284fe] 2869 0258                 movea.l    600(a1),a4
[00028502] 226c 0066                 movea.l    102(a4),a1
[00028506] 4e91                      jsr        (a1)
[00028508] 204a                      movea.l    a2,a0
[0002850a] 4eb9 0004 f20a            jsr        Aob_delete
[00028510] 504f                      addq.w     #8,a7
[00028512] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00028516] 4e75                      rts
edar_col:
[00028518] 3f03                      move.w     d3,-(a7)
[0002851a] 2f0a                      move.l     a2,-(a7)
[0002851c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028522] 2268 025c                 movea.l    604(a0),a1
[00028526] 2469 003c                 movea.l    60(a1),a2
[0002852a] 584a                      addq.w     #4,a2
[0002852c] 7011                      moveq.l    #17,d0
[0002852e] 3f00                      move.w     d0,-(a7)
[00028530] 7412                      moveq.l    #18,d2
[00028532] 720f                      moveq.l    #15,d1
[00028534] 700f                      moveq.l    #15,d0
[00028536] c06a 0002                 and.w      2(a2),d0
[0002853a] 4eb9 0003 0bde            jsr        oe_colsel
[00028540] 544f                      addq.w     #2,a7
[00028542] 3600                      move.w     d0,d3
[00028544] 6b28                      bmi.s      $0002856E
[00028546] 72f0                      moveq.l    #-16,d1
[00028548] c292                      and.l      (a2),d1
[0002854a] 48c0                      ext.l      d0
[0002854c] 8280                      or.l       d0,d1
[0002854e] 2481                      move.l     d1,(a2)
[00028550] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028556] 2068 0258                 movea.l    600(a0),a0
[0002855a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00028560] 2469 0258                 movea.l    600(a1),a2
[00028564] 226a 0066                 movea.l    102(a2),a1
[00028568] 7001                      moveq.l    #1,d0
[0002856a] 72ff                      moveq.l    #-1,d1
[0002856c] 4e91                      jsr        (a1)
[0002856e] 245f                      movea.l    (a7)+,a2
[00028570] 361f                      move.w     (a7)+,d3
[00028572] 4e75                      rts
edar_ends:
[00028574] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00028578] 514f                      subq.w     #8,a7
[0002857a] 41f9 000b fc40            lea.l      POP_END,a0
[00028580] 4eb9 0004 f064            jsr        Aob_create
[00028586] 2448                      movea.l    a0,a2
[00028588] 200a                      move.l     a2,d0
[0002858a] 6700 012e                 beq        $000286BA
[0002858e] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00028594] 7020                      moveq.l    #32,d0
[00028596] 2053                      movea.l    (a3),a0
[00028598] 2268 0258                 movea.l    600(a0),a1
[0002859c] 2269 0014                 movea.l    20(a1),a1
[000285a0] 41d7                      lea.l      (a7),a0
[000285a2] 4eb9 0004 fe06            jsr        Aob_offset
[000285a8] 7001                      moveq.l    #1,d0
[000285aa] 2053                      movea.l    (a3),a0
[000285ac] 2268 0258                 movea.l    600(a0),a1
[000285b0] d069 0034                 add.w      52(a1),d0
[000285b4] d157                      add.w      d0,(a7)
[000285b6] 7201                      moveq.l    #1,d1
[000285b8] d269 0036                 add.w      54(a1),d1
[000285bc] d36f 0002                 add.w      d1,2(a7)
[000285c0] 2049                      movea.l    a1,a0
[000285c2] 224a                      movea.l    a2,a1
[000285c4] 3017                      move.w     (a7),d0
[000285c6] 322f 0002                 move.w     2(a7),d1
[000285ca] 4eb9 0004 e84a            jsr        Ame_popup
[000285d0] 3600                      move.w     d0,d3
[000285d2] 4a40                      tst.w      d0
[000285d4] 6f00 00dc                 ble        $000286B2
[000285d8] 2053                      movea.l    (a3),a0
[000285da] 2268 025c                 movea.l    604(a0),a1
[000285de] 2069 003c                 movea.l    60(a1),a0
[000285e2] 5848                      addq.w     #4,a0
[000285e4] 5340                      subq.w     #1,d0
[000285e6] 670e                      beq.s      $000285F6
[000285e8] 5340                      subq.w     #1,d0
[000285ea] 6716                      beq.s      $00028602
[000285ec] 5340                      subq.w     #1,d0
[000285ee] 671e                      beq.s      $0002860E
[000285f0] 5340                      subq.w     #1,d0
[000285f2] 672c                      beq.s      $00028620
[000285f4] 603a                      bra.s      $00028630
[000285f6] 2010                      move.l     (a0),d0
[000285f8] c0bc ffcf ffff            and.l      #$FFCFFFFF,d0
[000285fe] 2080                      move.l     d0,(a0)
[00028600] 602e                      bra.s      $00028630
[00028602] 2010                      move.l     (a0),d0
[00028604] c0bc ff3f ffff            and.l      #$FF3FFFFF,d0
[0002860a] 2080                      move.l     d0,(a0)
[0002860c] 6022                      bra.s      $00028630
[0002860e] 2010                      move.l     (a0),d0
[00028610] c0bc ffcf ffff            and.l      #$FFCFFFFF,d0
[00028616] 80bc 0010 0000            or.l       #$00100000,d0
[0002861c] 2080                      move.l     d0,(a0)
[0002861e] 6010                      bra.s      $00028630
[00028620] 2010                      move.l     (a0),d0
[00028622] c0bc ff3f ffff            and.l      #$FF3FFFFF,d0
[00028628] 80bc 0040 0000            or.l       #$00400000,d0
[0002862e] 2080                      move.l     d0,(a0)
[00028630] 3003                      move.w     d3,d0
[00028632] 5340                      subq.w     #1,d0
[00028634] 670e                      beq.s      $00028644
[00028636] 5340                      subq.w     #1,d0
[00028638] 672c                      beq.s      $00028666
[0002863a] 5340                      subq.w     #1,d0
[0002863c] 6706                      beq.s      $00028644
[0002863e] 5340                      subq.w     #1,d0
[00028640] 6724                      beq.s      $00028666
[00028642] 6042                      bra.s      $00028686
[00028644] 3203                      move.w     d3,d1
[00028646] 48c1                      ext.l      d1
[00028648] 2001                      move.l     d1,d0
[0002864a] d080                      add.l      d0,d0
[0002864c] d081                      add.l      d1,d0
[0002864e] e788                      lsl.l      #3,d0
[00028650] 2072 080c                 movea.l    12(a2,d0.l),a0
[00028654] 2253                      movea.l    (a3),a1
[00028656] 2269 025c                 movea.l    604(a1),a1
[0002865a] 2269 033c                 movea.l    828(a1),a1
[0002865e] 2368 0004 0004            move.l     4(a0),4(a1)
[00028664] 6020                      bra.s      $00028686
[00028666] 3203                      move.w     d3,d1
[00028668] 48c1                      ext.l      d1
[0002866a] 2001                      move.l     d1,d0
[0002866c] d080                      add.l      d0,d0
[0002866e] d081                      add.l      d1,d0
[00028670] e788                      lsl.l      #3,d0
[00028672] 2072 080c                 movea.l    12(a2,d0.l),a0
[00028676] 2253                      movea.l    (a3),a1
[00028678] 2269 025c                 movea.l    604(a1),a1
[0002867c] 2269 0354                 movea.l    852(a1),a1
[00028680] 2368 0004 0004            move.l     4(a0),4(a1)
[00028686] 72ff                      moveq.l    #-1,d1
[00028688] 7020                      moveq.l    #32,d0
[0002868a] 2053                      movea.l    (a3),a0
[0002868c] 2068 0258                 movea.l    600(a0),a0
[00028690] 2253                      movea.l    (a3),a1
[00028692] 2269 0258                 movea.l    600(a1),a1
[00028696] 2269 0066                 movea.l    102(a1),a1
[0002869a] 4e91                      jsr        (a1)
[0002869c] 72ff                      moveq.l    #-1,d1
[0002869e] 7001                      moveq.l    #1,d0
[000286a0] 2053                      movea.l    (a3),a0
[000286a2] 2068 0258                 movea.l    600(a0),a0
[000286a6] 2253                      movea.l    (a3),a1
[000286a8] 2269 0258                 movea.l    600(a1),a1
[000286ac] 2269 0066                 movea.l    102(a1),a1
[000286b0] 4e91                      jsr        (a1)
[000286b2] 204a                      movea.l    a2,a0
[000286b4] 4eb9 0004 f20a            jsr        Aob_delete
[000286ba] 504f                      addq.w     #8,a7
[000286bc] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000286c0] 4e75                      rts
edar_fat:
[000286c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000286c8] 2268 025c                 movea.l    604(a0),a1
[000286cc] 2069 003c                 movea.l    60(a1),a0
[000286d0] 0aa8 0008 0000 0004       eori.l     #$00080000,4(a0)
[000286d8] 72ff                      moveq.l    #-1,d1
[000286da] 7001                      moveq.l    #1,d0
[000286dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000286e2] 2068 0258                 movea.l    600(a0),a0
[000286e6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000286ec] 2269 0258                 movea.l    600(a1),a1
[000286f0] 2269 0066                 movea.l    102(a1),a1
[000286f4] 4e91                      jsr        (a1)
[000286f6] 4e75                      rts
edar_len:
[000286f8] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000286fc] 514f                      subq.w     #8,a7
[000286fe] 41f9 000b fcb8            lea.l      POP_LEN,a0
[00028704] 4eb9 0004 f064            jsr        Aob_create
[0002870a] 2448                      movea.l    a0,a2
[0002870c] 200a                      move.l     a2,d0
[0002870e] 6700 0112                 beq        $00028822
[00028712] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00028718] 7015                      moveq.l    #21,d0
[0002871a] 2053                      movea.l    (a3),a0
[0002871c] 2268 0258                 movea.l    600(a0),a1
[00028720] 2269 0014                 movea.l    20(a1),a1
[00028724] 41d7                      lea.l      (a7),a0
[00028726] 4eb9 0004 fe06            jsr        Aob_offset
[0002872c] 7001                      moveq.l    #1,d0
[0002872e] 2053                      movea.l    (a3),a0
[00028730] 2268 0258                 movea.l    600(a0),a1
[00028734] d069 0034                 add.w      52(a1),d0
[00028738] d157                      add.w      d0,(a7)
[0002873a] 7201                      moveq.l    #1,d1
[0002873c] d269 0036                 add.w      54(a1),d1
[00028740] d36f 0002                 add.w      d1,2(a7)
[00028744] 2049                      movea.l    a1,a0
[00028746] 224a                      movea.l    a2,a1
[00028748] 3017                      move.w     (a7),d0
[0002874a] 322f 0002                 move.w     2(a7),d1
[0002874e] 4eb9 0004 e84a            jsr        Ame_popup
[00028754] 3600                      move.w     d0,d3
[00028756] 4a40                      tst.w      d0
[00028758] 6f00 00c0                 ble        $0002881A
[0002875c] 2053                      movea.l    (a3),a0
[0002875e] 2268 025c                 movea.l    604(a0),a1
[00028762] 2069 003c                 movea.l    60(a1),a0
[00028766] 5848                      addq.w     #4,a0
[00028768] 5340                      subq.w     #1,d0
[0002876a] 670e                      beq.s      $0002877A
[0002876c] 5340                      subq.w     #1,d0
[0002876e] 6712                      beq.s      $00028782
[00028770] 5340                      subq.w     #1,d0
[00028772] 6716                      beq.s      $0002878A
[00028774] 5340                      subq.w     #1,d0
[00028776] 671a                      beq.s      $00028792
[00028778] 601e                      bra.s      $00028798
[0002877a] 0290 fbff ffff            andi.l     #$FBFFFFFF,(a0)
[00028780] 6016                      bra.s      $00028798
[00028782] 0290 bfff ffff            andi.l     #$BFFFFFFF,(a0)
[00028788] 600e                      bra.s      $00028798
[0002878a] 0090 0400 0000            ori.l      #$04000000,(a0)
[00028790] 6006                      bra.s      $00028798
[00028792] 0090 4000 0000            ori.l      #$40000000,(a0)
[00028798] 3003                      move.w     d3,d0
[0002879a] 5340                      subq.w     #1,d0
[0002879c] 670e                      beq.s      $000287AC
[0002879e] 5340                      subq.w     #1,d0
[000287a0] 672c                      beq.s      $000287CE
[000287a2] 5340                      subq.w     #1,d0
[000287a4] 6706                      beq.s      $000287AC
[000287a6] 5340                      subq.w     #1,d0
[000287a8] 6724                      beq.s      $000287CE
[000287aa] 6042                      bra.s      $000287EE
[000287ac] 3203                      move.w     d3,d1
[000287ae] 48c1                      ext.l      d1
[000287b0] 2001                      move.l     d1,d0
[000287b2] d080                      add.l      d0,d0
[000287b4] d081                      add.l      d1,d0
[000287b6] e788                      lsl.l      #3,d0
[000287b8] 2072 080c                 movea.l    12(a2,d0.l),a0
[000287bc] 2253                      movea.l    (a3),a1
[000287be] 2269 025c                 movea.l    604(a1),a1
[000287c2] 2269 0234                 movea.l    564(a1),a1
[000287c6] 2368 0004 0004            move.l     4(a0),4(a1)
[000287cc] 6020                      bra.s      $000287EE
[000287ce] 3203                      move.w     d3,d1
[000287d0] 48c1                      ext.l      d1
[000287d2] 2001                      move.l     d1,d0
[000287d4] d080                      add.l      d0,d0
[000287d6] d081                      add.l      d1,d0
[000287d8] e788                      lsl.l      #3,d0
[000287da] 2072 080c                 movea.l    12(a2,d0.l),a0
[000287de] 2253                      movea.l    (a3),a1
[000287e0] 2269 025c                 movea.l    604(a1),a1
[000287e4] 2269 024c                 movea.l    588(a1),a1
[000287e8] 2368 0004 0004            move.l     4(a0),4(a1)
[000287ee] 72ff                      moveq.l    #-1,d1
[000287f0] 7015                      moveq.l    #21,d0
[000287f2] 2053                      movea.l    (a3),a0
[000287f4] 2068 0258                 movea.l    600(a0),a0
[000287f8] 2253                      movea.l    (a3),a1
[000287fa] 2269 0258                 movea.l    600(a1),a1
[000287fe] 2269 0066                 movea.l    102(a1),a1
[00028802] 4e91                      jsr        (a1)
[00028804] 72ff                      moveq.l    #-1,d1
[00028806] 7001                      moveq.l    #1,d0
[00028808] 2053                      movea.l    (a3),a0
[0002880a] 2068 0258                 movea.l    600(a0),a0
[0002880e] 2253                      movea.l    (a3),a1
[00028810] 2269 0258                 movea.l    600(a1),a1
[00028814] 2269 0066                 movea.l    102(a1),a1
[00028818] 4e91                      jsr        (a1)
[0002881a] 204a                      movea.l    a2,a0
[0002881c] 4eb9 0004 f20a            jsr        Aob_delete
[00028822] 504f                      addq.w     #8,a7
[00028824] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00028828] 4e75                      rts
edar_stil:
[0002882a] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0002882e] 514f                      subq.w     #8,a7
[00028830] 41f9 000b fd30            lea.l      POP_STYLESEL,a0
[00028836] 4eb9 0004 f064            jsr        Aob_create
[0002883c] 2448                      movea.l    a0,a2
[0002883e] 200a                      move.l     a2,d0
[00028840] 6700 00b4                 beq        $000288F6
[00028844] 47f9 0010 ee4e            lea.l      ACSblk,a3
[0002884a] 701b                      moveq.l    #27,d0
[0002884c] 2053                      movea.l    (a3),a0
[0002884e] 2268 0258                 movea.l    600(a0),a1
[00028852] 2269 0014                 movea.l    20(a1),a1
[00028856] 41d7                      lea.l      (a7),a0
[00028858] 4eb9 0004 fe06            jsr        Aob_offset
[0002885e] 7001                      moveq.l    #1,d0
[00028860] 2053                      movea.l    (a3),a0
[00028862] 2268 0258                 movea.l    600(a0),a1
[00028866] d069 0034                 add.w      52(a1),d0
[0002886a] d157                      add.w      d0,(a7)
[0002886c] 7201                      moveq.l    #1,d1
[0002886e] d269 0036                 add.w      54(a1),d1
[00028872] d36f 0002                 add.w      d1,2(a7)
[00028876] 2049                      movea.l    a1,a0
[00028878] 224a                      movea.l    a2,a1
[0002887a] 3017                      move.w     (a7),d0
[0002887c] 322f 0002                 move.w     2(a7),d1
[00028880] 4eb9 0004 e84a            jsr        Ame_popup
[00028886] 4a40                      tst.w      d0
[00028888] 6f64                      ble.s      $000288EE
[0002888a] 2053                      movea.l    (a3),a0
[0002888c] 2268 025c                 movea.l    604(a0),a1
[00028890] 2069 003c                 movea.l    60(a1),a0
[00028894] 5848                      addq.w     #4,a0
[00028896] 2210                      move.l     (a0),d1
[00028898] c2bc fff8 ffff            and.l      #$FFF8FFFF,d1
[0002889e] 3400                      move.w     d0,d2
[000288a0] 48c2                      ext.l      d2
[000288a2] 7610                      moveq.l    #16,d3
[000288a4] e7aa                      lsl.l      d3,d2
[000288a6] 8282                      or.l       d2,d1
[000288a8] 2081                      move.l     d1,(a0)
[000288aa] 2053                      movea.l    (a3),a0
[000288ac] 2268 025c                 movea.l    604(a0),a1
[000288b0] 2069 02c4                 movea.l    708(a1),a0
[000288b4] 5848                      addq.w     #4,a0
[000288b6] 2210                      move.l     (a0),d1
[000288b8] c2bc fff8 ffff            and.l      #$FFF8FFFF,d1
[000288be] 8282                      or.l       d2,d1
[000288c0] 2081                      move.l     d1,(a0)
[000288c2] 701b                      moveq.l    #27,d0
[000288c4] 2053                      movea.l    (a3),a0
[000288c6] 2068 0258                 movea.l    600(a0),a0
[000288ca] 2253                      movea.l    (a3),a1
[000288cc] 2269 0258                 movea.l    600(a1),a1
[000288d0] 2269 0066                 movea.l    102(a1),a1
[000288d4] 72ff                      moveq.l    #-1,d1
[000288d6] 4e91                      jsr        (a1)
[000288d8] 72ff                      moveq.l    #-1,d1
[000288da] 7001                      moveq.l    #1,d0
[000288dc] 2053                      movea.l    (a3),a0
[000288de] 2068 0258                 movea.l    600(a0),a0
[000288e2] 2253                      movea.l    (a3),a1
[000288e4] 2269 0258                 movea.l    600(a1),a1
[000288e8] 2269 0066                 movea.l    102(a1),a1
[000288ec] 4e91                      jsr        (a1)
[000288ee] 204a                      movea.l    a2,a0
[000288f0] 4eb9 0004 f20a            jsr        Aob_delete
[000288f6] 504f                      addq.w     #8,a7
[000288f8] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000288fc] 4e75                      rts

; start editor\uearrow.c

init_arrow:
[000288fe] 2f0a                      move.l     a2,-(a7)
[00028900] 2f0b                      move.l     a3,-(a7)
[00028902] 2448                      movea.l    a0,a2
[00028904] 43f9 000c 0324            lea.l      data,a1
[0002890a] 303c 2329                 move.w     #$2329,d0
[0002890e] 266a 0004                 movea.l    4(a2),a3
[00028912] 4e93                      jsr        (a3)
[00028914] 43f9 000c 0374            lea.l      disdata,a1
[0002891a] 303c 2329                 move.w     #$2329,d0
[0002891e] 204a                      movea.l    a2,a0
[00028920] 266a 0004                 movea.l    4(a2),a3
[00028924] 4e93                      jsr        (a3)
[00028926] 265f                      movea.l    (a7)+,a3
[00028928] 245f                      movea.l    (a7)+,a2
[0002892a] 4e75                      rts
minsize:
[0002892c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028932] 3028 0012                 move.w     18(a0),d0
[00028936] d040                      add.w      d0,d0
[00028938] 3280                      move.w     d0,(a1)
[0002893a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028940] 226f 0004                 movea.l    4(a7),a1
[00028944] 32a8 0014                 move.w     20(a0),(a1)
[00028948] 4e75                      rts
object_tree:
[0002894a] 48e7 0034                 movem.l    a2-a3/a5,-(a7)
[0002894e] 514f                      subq.w     #8,a7
[00028950] 2f48 0004                 move.l     a0,4(a7)
[00028954] 2649                      movea.l    a1,a3
[00028956] 41f9 000b fdf0            lea.l      ED_ARROW,a0
[0002895c] 4eb9 0004 f064            jsr        Aob_create
[00028962] 2448                      movea.l    a0,a2
[00028964] 200a                      move.l     a2,d0
[00028966] 6606                      bne.s      $0002896E
[00028968] 91c8                      suba.l     a0,a0
[0002896a] 6000 0284                 bra        $00028BF0
[0002896e] 41ea 0030                 lea.l      48(a2),a0
[00028972] 7016                      moveq.l    #22,d0
[00028974] c06b 0008                 and.w      8(a3),d0
[00028978] 8168 0008                 or.w       d0,8(a0)
[0002897c] 703f                      moveq.l    #63,d0
[0002897e] c06b 000a                 and.w      10(a3),d0
[00028982] 8168 000a                 or.w       d0,10(a0)
[00028986] 2668 000c                 movea.l    12(a0),a3
[0002898a] 702b                      moveq.l    #43,d0
[0002898c] 224a                      movea.l    a2,a1
[0002898e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028994] 2068 0258                 movea.l    600(a0),a0
[00028998] 4eb9 0003 0b9a            jsr        oe_beself
[0002899e] 702c                      moveq.l    #44,d0
[000289a0] 224a                      movea.l    a2,a1
[000289a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000289a8] 2068 0258                 movea.l    600(a0),a0
[000289ac] 4eb9 0003 0b9a            jsr        oe_beself
[000289b2] 4857                      pea.l      (a7)
[000289b4] 43f9 000c 03dc            lea.l      $000C03DC,a1
[000289ba] 206f 0008                 movea.l    8(a7),a0
[000289be] 2050                      movea.l    (a0),a0
[000289c0] 4eb9 0008 1b26            jsr        sscanf
[000289c6] 584f                      addq.w     #4,a7
[000289c8] 2757 0004                 move.l     (a7),4(a3)
[000289cc] 2a6a 0024                 movea.l    36(a2),a5
[000289d0] 584d                      addq.w     #4,a5
[000289d2] 0295 ffff fff0            andi.l     #$FFFFFFF0,(a5)
[000289d8] 700f                      moveq.l    #15,d0
[000289da] c06f 0002                 and.w      2(a7),d0
[000289de] 6608                      bne.s      $000289E8
[000289e0] 0095 0000 0001            ori.l      #$00000001,(a5)
[000289e6] 6006                      bra.s      $000289EE
[000289e8] 0095 0000 0000            ori.l      #$00000000,(a5)
[000289ee] 700f                      moveq.l    #15,d0
[000289f0] c06f 0002                 and.w      2(a7),d0
[000289f4] 48c0                      ext.l      d0
[000289f6] e588                      lsl.l      #2,d0
[000289f8] 41f9 000c a6d0            lea.l      colour_text,a0
[000289fe] 2270 0800                 movea.l    0(a0,d0.l),a1
[00028a02] 204a                      movea.l    a2,a0
[00028a04] 7012                      moveq.l    #18,d0
[00028a06] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028a0c] 700f                      moveq.l    #15,d0
[00028a0e] c06f 0002                 and.w      2(a7),d0
[00028a12] 026a fff0 01a6            andi.w     #$FFF0,422(a2)
[00028a18] c07c 000f                 and.w      #$000F,d0
[00028a1c] 816a 01a6                 or.w       d0,422(a2)
[00028a20] 2a6a 0114                 movea.l    276(a2),a5
[00028a24] 584d                      addq.w     #4,a5
[00028a26] 2017                      move.l     (a7),d0
[00028a28] 7218                      moveq.l    #24,d1
[00028a2a] e2a0                      asr.l      d1,d0
[00028a2c] c07c 0007                 and.w      #$0007,d0
[00028a30] b07c 0007                 cmp.w      #$0007,d0
[00028a34] 6238                      bhi.s      $00028A6E
[00028a36] d040                      add.w      d0,d0
[00028a38] 303b 0006                 move.w     $00028A40(pc,d0.w),d0
[00028a3c] 4efb 0002                 jmp        $00028A40(pc,d0.w)
J11:
[00028a40] 0010                      dc.w $0010   ; $00028a50-$00028a40
[00028a42] 0018                      dc.w $0018   ; $00028a58-$00028a40
[00028a44] 0020                      dc.w $0020   ; $00028a60-$00028a40
[00028a46] 0028                      dc.w $0028   ; $00028a68-$00028a40
[00028a48] 0010                      dc.w $0010   ; $00028a50-$00028a40
[00028a4a] 0018                      dc.w $0018   ; $00028a58-$00028a40
[00028a4c] 0020                      dc.w $0020   ; $00028a60-$00028a40
[00028a4e] 0028                      dc.w $0028   ; $00028a68-$00028a40
[00028a50] 2abc 0011 0001            move.l     #$00110001,(a5)
[00028a56] 6016                      bra.s      $00028A6E
[00028a58] 2abc 1111 0001            move.l     #$11110001,(a5)
[00028a5e] 600e                      bra.s      $00028A6E
[00028a60] 2abc 2211 0001            move.l     #$22110001,(a5)
[00028a66] 6006                      bra.s      $00028A6E
[00028a68] 2abc 3311 0001            move.l     #$33110001,(a5)
[00028a6e] 2a6a 012c                 movea.l    300(a2),a5
[00028a72] 584d                      addq.w     #4,a5
[00028a74] 2017                      move.l     (a7),d0
[00028a76] 721c                      moveq.l    #28,d1
[00028a78] e2a0                      asr.l      d1,d0
[00028a7a] c07c 0007                 and.w      #$0007,d0
[00028a7e] b07c 0007                 cmp.w      #$0007,d0
[00028a82] 6238                      bhi.s      $00028ABC
[00028a84] d040                      add.w      d0,d0
[00028a86] 303b 0006                 move.w     $00028A8E(pc,d0.w),d0
[00028a8a] 4efb 0002                 jmp        $00028A8E(pc,d0.w)
J12:
[00028a8e] 0010                      dc.w $0010   ; $00028a9e-$00028a8e
[00028a90] 0018                      dc.w $0018   ; $00028aa6-$00028a8e
[00028a92] 0020                      dc.w $0020   ; $00028aae-$00028a8e
[00028a94] 0028                      dc.w $0028   ; $00028ab6-$00028a8e
[00028a96] 0010                      dc.w $0010   ; $00028a9e-$00028a8e
[00028a98] 0018                      dc.w $0018   ; $00028aa6-$00028a8e
[00028a9a] 0020                      dc.w $0020   ; $00028aae-$00028a8e
[00028a9c] 0028                      dc.w $0028   ; $00028ab6-$00028a8e
[00028a9e] 2abc 0041 0001            move.l     #$00410001,(a5)
[00028aa4] 6016                      bra.s      $00028ABC
[00028aa6] 2abc 1141 0001            move.l     #$11410001,(a5)
[00028aac] 600e                      bra.s      $00028ABC
[00028aae] 2abc 2241 0001            move.l     #$22410001,(a5)
[00028ab4] 6006                      bra.s      $00028ABC
[00028ab6] 2abc 3341 0001            move.l     #$33410001,(a5)
[00028abc] 2a6a 033c                 movea.l    828(a2),a5
[00028ac0] 584d                      addq.w     #4,a5
[00028ac2] 2015                      move.l     (a5),d0
[00028ac4] c0bc ffcf ffff            and.l      #$FFCFFFFF,d0
[00028aca] 2217                      move.l     (a7),d1
[00028acc] c2bc 0030 0000            and.l      #$00300000,d1
[00028ad2] 8081                      or.l       d1,d0
[00028ad4] 2a80                      move.l     d0,(a5)
[00028ad6] 2a6a 0354                 movea.l    852(a2),a5
[00028ada] 584d                      addq.w     #4,a5
[00028adc] 2015                      move.l     (a5),d0
[00028ade] c0bc ff3f ffff            and.l      #$FF3FFFFF,d0
[00028ae4] 2217                      move.l     (a7),d1
[00028ae6] c2bc 00c0 0000            and.l      #$00C00000,d1
[00028aec] 8081                      or.l       d1,d0
[00028aee] 2a80                      move.l     d0,(a5)
[00028af0] 2217                      move.l     (a7),d1
[00028af2] c2bc 0008 0000            and.l      #$00080000,d1
[00028af8] 6708                      beq.s      $00028B02
[00028afa] 006a 0001 036a            ori.w      #$0001,874(a2)
[00028b00] 6006                      bra.s      $00028B08
[00028b02] 026a fffe 036a            andi.w     #$FFFE,874(a2)
[00028b08] 2017                      move.l     (a7),d0
[00028b0a] c0bc 8000 0000            and.l      #$80000000,d0
[00028b10] 6708                      beq.s      $00028B1A
[00028b12] 006a 0001 039a            ori.w      #$0001,922(a2)
[00028b18] 6006                      bra.s      $00028B20
[00028b1a] 026a fffe 039a            andi.w     #$FFFE,922(a2)
[00028b20] 2a6a 0234                 movea.l    564(a2),a5
[00028b24] 584d                      addq.w     #4,a5
[00028b26] 2015                      move.l     (a5),d0
[00028b28] c0bc fbff ffff            and.l      #$FBFFFFFF,d0
[00028b2e] 2217                      move.l     (a7),d1
[00028b30] c2bc 0400 0000            and.l      #$04000000,d1
[00028b36] 8081                      or.l       d1,d0
[00028b38] 2a80                      move.l     d0,(a5)
[00028b3a] 2a6a 024c                 movea.l    588(a2),a5
[00028b3e] 584d                      addq.w     #4,a5
[00028b40] 2015                      move.l     (a5),d0
[00028b42] c0bc bfff ffff            and.l      #$BFFFFFFF,d0
[00028b48] 2217                      move.l     (a7),d1
[00028b4a] c2bc 4000 0000            and.l      #$40000000,d1
[00028b50] 8081                      or.l       d1,d0
[00028b52] 2a80                      move.l     d0,(a5)
[00028b54] 2a6a 02c4                 movea.l    708(a2),a5
[00028b58] 584d                      addq.w     #4,a5
[00028b5a] 2015                      move.l     (a5),d0
[00028b5c] c0bc fff8 ffff            and.l      #$FFF8FFFF,d0
[00028b62] 2217                      move.l     (a7),d1
[00028b64] c2bc 0007 0000            and.l      #$00070000,d1
[00028b6a] 8081                      or.l       d1,d0
[00028b6c] 2a80                      move.l     d0,(a5)
[00028b6e] 206a 0414                 movea.l    1044(a2),a0
[00028b72] 2768 000c 0018            move.l     12(a0),24(a3)
[00028b78] 206f 0004                 movea.l    4(a7),a0
[00028b7c] 2068 0026                 movea.l    38(a0),a0
[00028b80] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00028b86] 4a40                      tst.w      d0
[00028b88] 6712                      beq.s      $00028B9C
[00028b8a] 43f9 000c 03cf            lea.l      $000C03CF,a1
[00028b90] 702b                      moveq.l    #43,d0
[00028b92] 204a                      movea.l    a2,a0
[00028b94] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028b9a] 6012                      bra.s      $00028BAE
[00028b9c] 206f 0004                 movea.l    4(a7),a0
[00028ba0] 2268 0026                 movea.l    38(a0),a1
[00028ba4] 702b                      moveq.l    #43,d0
[00028ba6] 204a                      movea.l    a2,a0
[00028ba8] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028bae] 206a 042c                 movea.l    1068(a2),a0
[00028bb2] 2768 000c 001c            move.l     12(a0),28(a3)
[00028bb8] 206f 0004                 movea.l    4(a7),a0
[00028bbc] 2068 002a                 movea.l    42(a0),a0
[00028bc0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00028bc6] 4a40                      tst.w      d0
[00028bc8] 6712                      beq.s      $00028BDC
[00028bca] 43f9 000c 03cf            lea.l      $000C03CF,a1
[00028bd0] 702c                      moveq.l    #44,d0
[00028bd2] 204a                      movea.l    a2,a0
[00028bd4] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028bda] 6012                      bra.s      $00028BEE
[00028bdc] 206f 0004                 movea.l    4(a7),a0
[00028be0] 2268 002a                 movea.l    42(a0),a1
[00028be4] 702c                      moveq.l    #44,d0
[00028be6] 204a                      movea.l    a2,a0
[00028be8] 4eb9 0005 0fd8            jsr        Aob_puttext
[00028bee] 204a                      movea.l    a2,a0
[00028bf0] 504f                      addq.w     #8,a7
[00028bf2] 4cdf 2c00                 movem.l    (a7)+,a2-a3/a5
[00028bf6] 4e75                      rts
test_it:
[00028bf8] 2f0a                      move.l     a2,-(a7)
[00028bfa] 2f0b                      move.l     a3,-(a7)
[00028bfc] 2648                      movea.l    a0,a3
[00028bfe] 2449                      movea.l    a1,a2
[00028c00] 22bc 0006 5c72            move.l     #A_arrows,(a1)
[00028c06] 486a 0004                 pea.l      4(a2)
[00028c0a] 43f9 000c 03dc            lea.l      $000C03DC,a1
[00028c10] 2050                      movea.l    (a0),a0
[00028c12] 4eb9 0008 1b26            jsr        sscanf
[00028c18] 584f                      addq.w     #4,a7
[00028c1a] 7000                      moveq.l    #0,d0
[00028c1c] 2540 0014                 move.l     d0,20(a2)
[00028c20] 2540 0010                 move.l     d0,16(a2)
[00028c24] 2540 000c                 move.l     d0,12(a2)
[00028c28] 2540 0008                 move.l     d0,8(a2)
[00028c2c] 206b 0026                 movea.l    38(a3),a0
[00028c30] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00028c36] 4a40                      tst.w      d0
[00028c38] 6704                      beq.s      $00028C3E
[00028c3a] 91c8                      suba.l     a0,a0
[00028c3c] 6004                      bra.s      $00028C42
[00028c3e] 206b 0026                 movea.l    38(a3),a0
[00028c42] 2548 0018                 move.l     a0,24(a2)
[00028c46] 206b 002a                 movea.l    42(a3),a0
[00028c4a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00028c50] 4a40                      tst.w      d0
[00028c52] 6704                      beq.s      $00028C58
[00028c54] 91c8                      suba.l     a0,a0
[00028c56] 6004                      bra.s      $00028C5C
[00028c58] 206b 002a                 movea.l    42(a3),a0
[00028c5c] 2548 001c                 move.l     a0,28(a2)
[00028c60] 265f                      movea.l    (a7)+,a3
[00028c62] 245f                      movea.l    (a7)+,a2
[00028c64] 4e75                      rts
abort:
[00028c66] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028c6c] 2268 0258                 movea.l    600(a0),a1
[00028c70] 2069 0014                 movea.l    20(a1),a0
[00028c74] 2068 003c                 movea.l    60(a0),a0
[00028c78] 42a8 0018                 clr.l      24(a0)
[00028c7c] 42a8 001c                 clr.l      28(a0)
[00028c80] 2079 000c 0364            movea.l    $000C0364,a0
[00028c86] 2050                      movea.l    (a0),a0
[00028c88] 4e90                      jsr        (a0)
[00028c8a] 4e75                      rts
ok:
[00028c8c] 48e7 0038                 movem.l    a2-a4,-(a7)
[00028c90] 4fef ffd2                 lea.l      -46(a7),a7
[00028c94] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028c9a] 2268 0258                 movea.l    600(a0),a1
[00028c9e] 2469 0014                 movea.l    20(a1),a2
[00028ca2] 286a 003c                 movea.l    60(a2),a4
[00028ca6] 47f9 0010 c4a2            lea.l      parm,a3
[00028cac] 2f2c 0004                 move.l     4(a4),-(a7)
[00028cb0] 43f9 000c 03dc            lea.l      $000C03DC,a1
[00028cb6] 204b                      movea.l    a3,a0
[00028cb8] 4eb9 0008 15ac            jsr        sprintf
[00028cbe] 584f                      addq.w     #4,a7
[00028cc0] 2e8b                      move.l     a3,(a7)
[00028cc2] 2f7c 000c 03cf 0004       move.l     #$000C03CF,4(a7)
[00028cca] 4240                      clr.w      d0
[00028ccc] 3f40 001c                 move.w     d0,28(a7)
[00028cd0] 3f40 0012                 move.w     d0,18(a7)
[00028cd4] 3f40 0008                 move.w     d0,8(a7)
[00028cd8] 7200                      moveq.l    #0,d1
[00028cda] 2f41 001e                 move.l     d1,30(a7)
[00028cde] 2f41 0014                 move.l     d1,20(a7)
[00028ce2] 2f41 000a                 move.l     d1,10(a7)
[00028ce6] 7000                      moveq.l    #0,d0
[00028ce8] 2f40 0022                 move.l     d0,34(a7)
[00028cec] 2f40 0018                 move.l     d0,24(a7)
[00028cf0] 2f40 000e                 move.l     d0,14(a7)
[00028cf4] 43ef 0026                 lea.l      38(a7),a1
[00028cf8] 41ea 0408                 lea.l      1032(a2),a0
[00028cfc] 7003                      moveq.l    #3,d0
[00028cfe] 4eb9 0006 a068            jsr        Auo_boxed
[00028d04] 206f 0026                 movea.l    38(a7),a0
[00028d08] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00028d0e] 4a40                      tst.w      d0
[00028d10] 6704                      beq.s      $00028D16
[00028d12] 42af 0026                 clr.l      38(a7)
[00028d16] 43ef 002a                 lea.l      42(a7),a1
[00028d1a] 7003                      moveq.l    #3,d0
[00028d1c] 41ea 0420                 lea.l      1056(a2),a0
[00028d20] 4eb9 0006 a068            jsr        Auo_boxed
[00028d26] 206f 002a                 movea.l    42(a7),a0
[00028d2a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00028d30] 4a40                      tst.w      d0
[00028d32] 6704                      beq.s      $00028D38
[00028d34] 42af 002a                 clr.l      42(a7)
[00028d38] 2079 0010 ee4e            movea.l    ACSblk,a0
[00028d3e] 3228 0014                 move.w     20(a0),d1
[00028d42] 3028 0012                 move.w     18(a0),d0
[00028d46] d040                      add.w      d0,d0
[00028d48] 41d7                      lea.l      (a7),a0
[00028d4a] 2279 000c 0364            movea.l    $000C0364,a1
[00028d50] 2269 0004                 movea.l    4(a1),a1
[00028d54] 4e91                      jsr        (a1)
[00028d56] 6100 ff0e                 bsr        abort
[00028d5a] 4fef 002e                 lea.l      46(a7),a7
[00028d5e] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00028d62] 4e75                      rts
