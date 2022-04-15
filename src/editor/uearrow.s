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

	.data

BUBBLE_01:
[000bf58e]                           dc.b 'Hier wird angegeben, ob eine 3D-Darstellung verwendet werden soll.',0
BUBBLE_02:
[000bf5d1]                           dc.b 'Hier wird angegeben, ob die Linie breit sein soll oder normal.',0
BUBBLE_03:
[000bf610]                           dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_05:
[000bf662]                           dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
TEXT_005:
[000bf6e6]                           dc.w $4f4b
[000bf6e8]                           dc.w $0041
[000bf6ea]                           dc.b 'bbruch',0
TEXT_05:
[000bf6f1]                           dc.b 'Sonstiges',0
TEXT_06:
[000bf6fb]                           dc.b '3D-Modus',0
TEXT_07:
[000bf704]                           dc.b 'Richtung:',0
TEXT_08:
[000bf70e]                           dc.b 'breit',0
TEXT_09:
[000bf714]                           dc.b 'LÑngen:',0
TEXT_10:
[000bf71c]                           dc.b 'Enden:',0
TEXT_11:
[000bf723]                           dc.b 'Farbe:',0
TEXT_12:
[000bf72a]                           dc.b 'Stil:',0
TEXT_13:
[000bf730]                           dc.b 'BubbleGEM-Text',0
TEXT_14:
[000bf73f]                           dc.b 'Context-Popup',0
help_title:
[000bf74d]                           dc.b 'Der Arrows-Editor',0
title:
[000bf75f]                           dc.b 'PFEILE -',0
ARROW001:
[000bf768] 00065c72                  dc.l A_arrows
[000bf76c]                           dc.w $2251
[000bf76e]                           dc.w $0001
[000bf770]                           dc.w $0000
[000bf772]                           dc.w $0000
[000bf774]                           dc.w $0000
[000bf776]                           dc.w $0000
[000bf778]                           dc.w $0000
[000bf77a]                           dc.w $0000
[000bf77c]                           dc.w $0000
[000bf77e]                           dc.w $0000
[000bf780]                           dc.w $0000
[000bf782]                           dc.w $0000
[000bf784]                           dc.w $0000
[000bf786]                           dc.w $0000
ARROW002:
[000bf788] 00065c72                  dc.l A_arrows
[000bf78c]                           dc.w $2211
[000bf78e]                           dc.w $0001
[000bf790]                           dc.w $0000
[000bf792]                           dc.w $0000
[000bf794]                           dc.w $0000
[000bf796]                           dc.w $0000
[000bf798]                           dc.w $0000
[000bf79a]                           dc.w $0000
[000bf79c]                           dc.w $0000
[000bf79e]                           dc.w $0000
[000bf7a0]                           dc.w $0000
[000bf7a2]                           dc.w $0000
[000bf7a4]                           dc.w $0000
[000bf7a6]                           dc.w $0000
ARROW003:
[000bf7a8] 00065c72                  dc.l A_arrows
[000bf7ac]                           dc.w $2201
[000bf7ae]                           dc.w $0001
[000bf7b0]                           dc.w $0000
[000bf7b2]                           dc.w $0000
[000bf7b4]                           dc.w $0000
[000bf7b6]                           dc.w $0000
[000bf7b8]                           dc.w $0000
[000bf7ba]                           dc.w $0000
[000bf7bc]                           dc.w $0000
[000bf7be]                           dc.w $0000
[000bf7c0]                           dc.w $0000
[000bf7c2]                           dc.w $0000
[000bf7c4]                           dc.w $0000
[000bf7c6]                           dc.w $0000
ARROW004:
[000bf7c8] 00065c72                  dc.l A_arrows
[000bf7cc]                           dc.w $2601
[000bf7ce]                           dc.w $0001
[000bf7d0]                           dc.w $0000
[000bf7d2]                           dc.w $0000
[000bf7d4]                           dc.w $0000
[000bf7d6]                           dc.w $0000
[000bf7d8]                           dc.w $0000
[000bf7da]                           dc.w $0000
[000bf7dc]                           dc.w $0000
[000bf7de]                           dc.w $0000
[000bf7e0]                           dc.w $0000
[000bf7e2]                           dc.w $0000
[000bf7e4]                           dc.w $0000
[000bf7e6]                           dc.w $0000
ARROW005:
[000bf7e8] 00065c72                  dc.l A_arrows
[000bf7ec]                           dc.w $2241
[000bf7ee]                           dc.w $0001
[000bf7f0]                           dc.w $0000
[000bf7f2]                           dc.w $0000
[000bf7f4]                           dc.w $0000
[000bf7f6]                           dc.w $0000
[000bf7f8]                           dc.w $0000
[000bf7fa]                           dc.w $0000
[000bf7fc]                           dc.w $0000
[000bf7fe]                           dc.w $0000
[000bf800]                           dc.w $0000
[000bf802]                           dc.w $0000
[000bf804]                           dc.w $0000
[000bf806]                           dc.w $0000
ARROW006:
[000bf808] 00065c72                  dc.l A_arrows
[000bf80c]                           dc.w $6201
[000bf80e]                           dc.w $0001
[000bf810]                           dc.w $0000
[000bf812]                           dc.w $0000
[000bf814]                           dc.w $0000
[000bf816]                           dc.w $0000
[000bf818]                           dc.w $0000
[000bf81a]                           dc.w $0000
[000bf81c]                           dc.w $0000
[000bf81e]                           dc.w $0000
[000bf820]                           dc.w $0000
[000bf822]                           dc.w $0000
[000bf824]                           dc.w $0000
[000bf826]                           dc.w $0000
ARROW007:
[000bf828] 00065c72                  dc.l A_arrows
[000bf82c]                           dc.w $6601
[000bf82e]                           dc.w $0001
[000bf830]                           dc.w $0000
[000bf832]                           dc.w $0000
[000bf834]                           dc.w $0000
[000bf836]                           dc.w $0000
[000bf838]                           dc.w $0000
[000bf83a]                           dc.w $0000
[000bf83c]                           dc.w $0000
[000bf83e]                           dc.w $0000
[000bf840]                           dc.w $0000
[000bf842]                           dc.w $0000
[000bf844]                           dc.w $0000
[000bf846]                           dc.w $0000
ARROW008:
[000bf848] 00065c72                  dc.l A_arrows
[000bf84c]                           dc.w $0011
[000bf84e]                           dc.w $0001
[000bf850]                           dc.w $0000
[000bf852]                           dc.w $0000
[000bf854]                           dc.w $0000
[000bf856]                           dc.w $0000
[000bf858]                           dc.w $0000
[000bf85a]                           dc.w $0000
[000bf85c]                           dc.w $0000
[000bf85e]                           dc.w $0000
[000bf860]                           dc.w $0000
[000bf862]                           dc.w $0000
[000bf864]                           dc.w $0000
[000bf866]                           dc.w $0000
ARROW009:
[000bf868] 00065c72                  dc.l A_arrows
[000bf86c]                           dc.w $1111
[000bf86e]                           dc.w $0001
[000bf870]                           dc.w $0000
[000bf872]                           dc.w $0000
[000bf874]                           dc.w $0000
[000bf876]                           dc.w $0000
[000bf878]                           dc.w $0000
[000bf87a]                           dc.w $0000
[000bf87c]                           dc.w $0000
[000bf87e]                           dc.w $0000
[000bf880]                           dc.w $0000
[000bf882]                           dc.w $0000
[000bf884]                           dc.w $0000
[000bf886]                           dc.w $0000
ARROW010:
[000bf888] 00065c72                  dc.l A_arrows
[000bf88c]                           dc.w $3311
[000bf88e]                           dc.w $0001
[000bf890]                           dc.w $0000
[000bf892]                           dc.w $0000
[000bf894]                           dc.w $0000
[000bf896]                           dc.w $0000
[000bf898]                           dc.w $0000
[000bf89a]                           dc.w $0000
[000bf89c]                           dc.w $0000
[000bf89e]                           dc.w $0000
[000bf8a0]                           dc.w $0000
[000bf8a2]                           dc.w $0000
[000bf8a4]                           dc.w $0000
[000bf8a6]                           dc.w $0000
ARROW011:
[000bf8a8] 00065c72                  dc.l A_arrows
[000bf8ac]                           dc.w $0041
[000bf8ae]                           dc.w $0001
[000bf8b0]                           dc.w $0000
[000bf8b2]                           dc.w $0000
[000bf8b4]                           dc.w $0000
[000bf8b6]                           dc.w $0000
[000bf8b8]                           dc.w $0000
[000bf8ba]                           dc.w $0000
[000bf8bc]                           dc.w $0000
[000bf8be]                           dc.w $0000
[000bf8c0]                           dc.w $0000
[000bf8c2]                           dc.w $0000
[000bf8c4]                           dc.w $0000
[000bf8c6]                           dc.w $0000
ARROW012:
[000bf8c8] 00065c72                  dc.l A_arrows
[000bf8cc]                           dc.w $1141
[000bf8ce]                           dc.w $0001
[000bf8d0]                           dc.w $0000
[000bf8d2]                           dc.w $0000
[000bf8d4]                           dc.w $0000
[000bf8d6]                           dc.w $0000
[000bf8d8]                           dc.w $0000
[000bf8da]                           dc.w $0000
[000bf8dc]                           dc.w $0000
[000bf8de]                           dc.w $0000
[000bf8e0]                           dc.w $0000
[000bf8e2]                           dc.w $0000
[000bf8e4]                           dc.w $0000
[000bf8e6]                           dc.w $0000
ARROW013:
[000bf8e8] 00065c72                  dc.l A_arrows
[000bf8ec]                           dc.w $3341
[000bf8ee]                           dc.w $0001
[000bf8f0]                           dc.w $0000
[000bf8f2]                           dc.w $0000
[000bf8f4]                           dc.w $0000
[000bf8f6]                           dc.w $0000
[000bf8f8]                           dc.w $0000
[000bf8fa]                           dc.w $0000
[000bf8fc]                           dc.w $0000
[000bf8fe]                           dc.w $0000
[000bf900]                           dc.w $0000
[000bf902]                           dc.w $0000
[000bf904]                           dc.w $0000
[000bf906]                           dc.w $0000
A_3DBUTTON02:
[000bf908] 00064a22                  dc.l A_3Dbutton
[000bf90c]                           dc.w $29f1
[000bf90e]                           dc.w $0178
[000bf910] 000630f2                  dc.l Auo_string
[000bf914]                           dc.w $0000
[000bf916]                           dc.w $0000
[000bf918]                           dc.w $0000
[000bf91a]                           dc.w $0000
[000bf91c]                           dc.w $0000
[000bf91e]                           dc.w $0000
[000bf920]                           dc.w $0000
[000bf922]                           dc.w $0000
[000bf924]                           dc.w $0000
[000bf926]                           dc.w $0000
A_3DBUTTON03:
[000bf928] 00064a22                  dc.l A_3Dbutton
[000bf92c]                           dc.w $29c1
[000bf92e]                           dc.w $0178
[000bf930] 000630f2                  dc.l Auo_string
[000bf934] 000bf6e6                  dc.l TEXT_005
[000bf938]                           dc.w $0000
[000bf93a]                           dc.w $0000
[000bf93c]                           dc.w $0000
[000bf93e]                           dc.w $0000
[000bf940]                           dc.w $0000
[000bf942]                           dc.w $0000
[000bf944]                           dc.w $0000
[000bf946]                           dc.w $0000
A_3DBUTTON05:
[000bf948] 00064a22                  dc.l A_3Dbutton
[000bf94c]                           dc.w $29c1
[000bf94e]                           dc.w $0178
[000bf950] 000630f2                  dc.l Auo_string
[000bf954] 000bf6e9                  dc.l TEXT_009
[000bf958]                           dc.w $0000
[000bf95a]                           dc.w $0000
[000bf95c]                           dc.w $0000
[000bf95e]                           dc.w $0000
[000bf960]                           dc.w $0000
[000bf962]                           dc.w $0000
[000bf964]                           dc.w $0000
[000bf966]                           dc.w $0000
A_3DBUTTON06:
[000bf968] 00064a22                  dc.l A_3Dbutton
[000bf96c]                           dc.w $21f1
[000bf96e]                           dc.w $01f8
[000bf970] 000630f2                  dc.l Auo_string
[000bf974]                           dc.w $0000
[000bf976]                           dc.w $0000
[000bf978]                           dc.w $0000
[000bf97a]                           dc.w $0000
[000bf97c]                           dc.w $0000
[000bf97e]                           dc.w $0000
[000bf980]                           dc.w $0000
[000bf982]                           dc.w $0000
[000bf984]                           dc.w $0000
[000bf986]                           dc.w $0000
A_3DBUTTON23:
[000bf988] 00064a22                  dc.l A_3Dbutton
[000bf98c]                           dc.w $09f1
[000bf98e]                           dc.w $0178
[000bf990] 000630f2                  dc.l Auo_string
[000bf994]                           dc.w $0000
[000bf996]                           dc.w $0000
[000bf998]                           dc.w $0000
[000bf99a]                           dc.w $0000
[000bf99c]                           dc.w $0000
[000bf99e]                           dc.w $0000
[000bf9a0]                           dc.w $0000
[000bf9a2]                           dc.w $0000
[000bf9a4]                           dc.w $0000
[000bf9a6]                           dc.w $0000
A_ARROWS01:
[000bf9a8] 00065c72                  dc.l A_arrows
[000bf9ac]                           dc.w $1301
[000bf9ae]                           dc.w $0001
[000bf9b0]                           dc.w $0000
[000bf9b2]                           dc.w $0000
[000bf9b4]                           dc.w $0000
[000bf9b6]                           dc.w $0000
[000bf9b8]                           dc.w $0000
[000bf9ba]                           dc.w $0000
[000bf9bc]                           dc.w $0000
[000bf9be]                           dc.w $0000
[000bf9c0]                           dc.w $0000
[000bf9c2]                           dc.w $0000
[000bf9c4]                           dc.w $0000
[000bf9c6]                           dc.w $0000
A_ARROWS02:
[000bf9c8] 00065c72                  dc.l A_arrows
[000bf9cc]                           dc.w $6602
[000bf9ce]                           dc.w $0001
[000bf9d0]                           dc.w $0000
[000bf9d2]                           dc.w $0000
[000bf9d4]                           dc.w $0000
[000bf9d6]                           dc.w $0000
[000bf9d8]                           dc.w $0000
[000bf9da]                           dc.w $0000
[000bf9dc]                           dc.w $0000
[000bf9de]                           dc.w $0000
[000bf9e0]                           dc.w $0000
[000bf9e2]                           dc.w $0000
[000bf9e4]                           dc.w $0000
[000bf9e6]                           dc.w $0000
A_ARROWS03:
[000bf9e8] 00065c72                  dc.l A_arrows
[000bf9ec]                           dc.w $6603
[000bf9ee]                           dc.w $0001
[000bf9f0]                           dc.w $0000
[000bf9f2]                           dc.w $0000
[000bf9f4]                           dc.w $0000
[000bf9f6]                           dc.w $0000
[000bf9f8]                           dc.w $0000
[000bf9fa]                           dc.w $0000
[000bf9fc]                           dc.w $0000
[000bf9fe]                           dc.w $0000
[000bfa00]                           dc.w $0000
[000bfa02]                           dc.w $0000
[000bfa04]                           dc.w $0000
[000bfa06]                           dc.w $0000
A_ARROWS04:
[000bfa08] 00065c72                  dc.l A_arrows
[000bfa0c]                           dc.w $6604
[000bfa0e]                           dc.w $0001
[000bfa10]                           dc.w $0000
[000bfa12]                           dc.w $0000
[000bfa14]                           dc.w $0000
[000bfa16]                           dc.w $0000
[000bfa18]                           dc.w $0000
[000bfa1a]                           dc.w $0000
[000bfa1c]                           dc.w $0000
[000bfa1e]                           dc.w $0000
[000bfa20]                           dc.w $0000
[000bfa22]                           dc.w $0000
[000bfa24]                           dc.w $0000
[000bfa26]                           dc.w $0000
A_ARROWS05:
[000bfa28] 00065c72                  dc.l A_arrows
[000bfa2c]                           dc.w $6605
[000bfa2e]                           dc.w $0001
[000bfa30]                           dc.w $0000
[000bfa32]                           dc.w $0000
[000bfa34]                           dc.w $0000
[000bfa36]                           dc.w $0000
[000bfa38]                           dc.w $0000
[000bfa3a]                           dc.w $0000
[000bfa3c]                           dc.w $0000
[000bfa3e]                           dc.w $0000
[000bfa40]                           dc.w $0000
[000bfa42]                           dc.w $0000
[000bfa44]                           dc.w $0000
[000bfa46]                           dc.w $0000
A_ARROWS06:
[000bfa48] 00065c72                  dc.l A_arrows
[000bfa4c]                           dc.w $6606
[000bfa4e]                           dc.w $0001
[000bfa50]                           dc.w $0000
[000bfa52]                           dc.w $0000
[000bfa54]                           dc.w $0000
[000bfa56]                           dc.w $0000
[000bfa58]                           dc.w $0000
[000bfa5a]                           dc.w $0000
[000bfa5c]                           dc.w $0000
[000bfa5e]                           dc.w $0000
[000bfa60]                           dc.w $0000
[000bfa62]                           dc.w $0000
[000bfa64]                           dc.w $0000
[000bfa66]                           dc.w $0000
A_ARROWS07:
[000bfa68] 00065c72                  dc.l A_arrows
[000bfa6c]                           dc.w $6607
[000bfa6e]                           dc.w $0001
[000bfa70]                           dc.w $0000
[000bfa72]                           dc.w $0000
[000bfa74]                           dc.w $0000
[000bfa76]                           dc.w $0000
[000bfa78]                           dc.w $0000
[000bfa7a]                           dc.w $0000
[000bfa7c]                           dc.w $0000
[000bfa7e]                           dc.w $0000
[000bfa80]                           dc.w $0000
[000bfa82]                           dc.w $0000
[000bfa84]                           dc.w $0000
[000bfa86]                           dc.w $0000
A_ARROWS08:
[000bfa88] 00065c72                  dc.l A_arrows
[000bfa8c]                           dc.w $2611
[000bfa8e]                           dc.w $0001
[000bfa90]                           dc.w $0000
[000bfa92]                           dc.w $0000
[000bfa94]                           dc.w $0000
[000bfa96]                           dc.w $0000
[000bfa98]                           dc.w $0000
[000bfa9a]                           dc.w $0000
[000bfa9c]                           dc.w $0000
[000bfa9e]                           dc.w $0000
[000bfaa0]                           dc.w $0000
[000bfaa2]                           dc.w $0000
[000bfaa4]                           dc.w $0000
[000bfaa6]                           dc.w $0000
A_ARROWS09:
[000bfaa8] 00065c72                  dc.l A_arrows
[000bfaac]                           dc.w $6241
[000bfaae]                           dc.w $0001
[000bfab0]                           dc.w $0000
[000bfab2]                           dc.w $0000
[000bfab4]                           dc.w $0000
[000bfab6]                           dc.w $0000
[000bfab8]                           dc.w $0000
[000bfaba]                           dc.w $0000
[000bfabc]                           dc.w $0000
[000bfabe]                           dc.w $0000
[000bfac0]                           dc.w $0000
[000bfac2]                           dc.w $0000
[000bfac4]                           dc.w $0000
[000bfac6]                           dc.w $0000
A_BOXED03:
[000bfac8] 0006afea                  dc.l A_boxed
[000bfacc]                           dc.w $9038
[000bface]                           dc.w $ff12
[000bfad0] 0006a068                  dc.l Auo_boxed
[000bfad4]                           dc.w $0000
[000bfad6]                           dc.w $0000
[000bfad8]                           dc.w $0000
[000bfada]                           dc.w $0000
[000bfadc]                           dc.w $0000
[000bfade]                           dc.w $0000
[000bfae0] 000bf610                  dc.l BUBBLE_03
[000bfae4]                           dc.w $0000
[000bfae6]                           dc.w $0000
A_BOXED04:
[000bfae8] 0006afea                  dc.l A_boxed
[000bfaec]                           dc.w $9038
[000bfaee]                           dc.w $ff12
[000bfaf0] 0006a068                  dc.l Auo_boxed
[000bfaf4]                           dc.w $0000
[000bfaf6]                           dc.w $0000
[000bfaf8]                           dc.w $0000
[000bfafa]                           dc.w $0000
[000bfafc]                           dc.w $0000
[000bfafe]                           dc.w $0000
[000bfb00] 000bf662                  dc.l BUBBLE_05
[000bfb04]                           dc.w $0000
[000bfb06]                           dc.w $0000
A_CHECKBOX02:
[000bfb08] 0006323e                  dc.l A_checkbox
[000bfb0c]                           dc.w $0000
[000bfb0e]                           dc.w $0001
[000bfb10] 000630f2                  dc.l Auo_string
[000bfb14] 000bf6fb                  dc.l TEXT_06
[000bfb18]                           dc.w $0000
[000bfb1a]                           dc.w $0000
[000bfb1c]                           dc.w $0000
[000bfb1e]                           dc.w $0000
[000bfb20] 000bf58e                  dc.l BUBBLE_01
[000bfb24]                           dc.w $0000
[000bfb26]                           dc.w $0000
A_CHECKBOX03:
[000bfb28] 0006323e                  dc.l A_checkbox
[000bfb2c]                           dc.w $0000
[000bfb2e]                           dc.w $0001
[000bfb30] 000630f2                  dc.l Auo_string
[000bfb34] 000bf70e                  dc.l TEXT_08
[000bfb38]                           dc.w $0000
[000bfb3a]                           dc.w $0000
[000bfb3c]                           dc.w $0000
[000bfb3e]                           dc.w $0000
[000bfb40] 000bf5d1                  dc.l BUBBLE_02
[000bfb44]                           dc.w $0000
[000bfb46]                           dc.w $0000
A_INNERFRAME03:
[000bfb48] 00064256                  dc.l A_innerframe
[000bfb4c]                           dc.w $1800
[000bfb4e]                           dc.w $8f19
[000bfb50] 000630f2                  dc.l Auo_string
[000bfb54] 000bf6f1                  dc.l TEXT_05
[000bfb58]                           dc.w $0000
[000bfb5a]                           dc.w $0000
[000bfb5c]                           dc.w $0000
[000bfb5e]                           dc.w $0000
[000bfb60]                           dc.w $0000
[000bfb62]                           dc.w $0000
[000bfb64]                           dc.w $0000
[000bfb66]                           dc.w $0000
POP_ARR:
[000bfb68]                           dc.w $ffff
[000bfb6a]                           dc.w $0001
[000bfb6c]                           dc.w $0008
[000bfb6e]                           dc.w $0014
[000bfb70]                           dc.w $0000
[000bfb72]                           dc.w $0020
[000bfb74]                           dc.w $00ff
[000bfb76]                           dc.w $1100
[000bfb78]                           dc.w $0000
[000bfb7a]                           dc.w $0000
[000bfb7c]                           dc.w $0006
[000bfb7e]                           dc.w $0004
_01_POP_ARR:
[000bfb80]                           dc.w $0002
[000bfb82]                           dc.w $ffff
[000bfb84]                           dc.w $ffff
[000bfb86]                           dc.w $0018
[000bfb88]                           dc.w $0001
[000bfb8a]                           dc.w $0000
[000bfb8c] 000bf848                  dc.l ARROW008
[000bfb90]                           dc.w $0000
[000bfb92]                           dc.w $0000
[000bfb94]                           dc.w $0003
[000bfb96]                           dc.w $0001
_02_POP_ARR:
[000bfb98]                           dc.w $0003
[000bfb9a]                           dc.w $ffff
[000bfb9c]                           dc.w $ffff
[000bfb9e]                           dc.w $0018
[000bfba0]                           dc.w $0001
[000bfba2]                           dc.w $0000
[000bfba4] 000bf8a8                  dc.l ARROW011
[000bfba8]                           dc.w $0003
[000bfbaa]                           dc.w $0000
[000bfbac]                           dc.w $0003
[000bfbae]                           dc.w $0001
_03_POP_ARR:
[000bfbb0]                           dc.w $0004
[000bfbb2]                           dc.w $ffff
[000bfbb4]                           dc.w $ffff
[000bfbb6]                           dc.w $0018
[000bfbb8]                           dc.w $0001
[000bfbba]                           dc.w $0000
[000bfbbc] 000bf868                  dc.l ARROW009
[000bfbc0]                           dc.w $0000
[000bfbc2]                           dc.w $0001
[000bfbc4]                           dc.w $0003
[000bfbc6]                           dc.w $0001
_04_POP_ARR:
[000bfbc8]                           dc.w $0005
[000bfbca]                           dc.w $ffff
[000bfbcc]                           dc.w $ffff
[000bfbce]                           dc.w $0018
[000bfbd0]                           dc.w $0001
[000bfbd2]                           dc.w $0000
[000bfbd4] 000bf8c8                  dc.l ARROW012
[000bfbd8]                           dc.w $0003
[000bfbda]                           dc.w $0001
[000bfbdc]                           dc.w $0003
[000bfbde]                           dc.w $0001
_05_POP_ARR:
[000bfbe0]                           dc.w $0006
[000bfbe2]                           dc.w $ffff
[000bfbe4]                           dc.w $ffff
[000bfbe6]                           dc.w $0018
[000bfbe8]                           dc.w $0001
[000bfbea]                           dc.w $0000
[000bfbec] 000bf788                  dc.l ARROW002
[000bfbf0]                           dc.w $0000
[000bfbf2]                           dc.w $0002
[000bfbf4]                           dc.w $0003
[000bfbf6]                           dc.w $0001
_06_POP_ARR:
[000bfbf8]                           dc.w $0007
[000bfbfa]                           dc.w $ffff
[000bfbfc]                           dc.w $ffff
[000bfbfe]                           dc.w $0018
[000bfc00]                           dc.w $0001
[000bfc02]                           dc.w $0000
[000bfc04] 000bf7e8                  dc.l ARROW005
[000bfc08]                           dc.w $0003
[000bfc0a]                           dc.w $0002
[000bfc0c]                           dc.w $0003
[000bfc0e]                           dc.w $0001
_07_POP_ARR:
[000bfc10]                           dc.w $0008
[000bfc12]                           dc.w $ffff
[000bfc14]                           dc.w $ffff
[000bfc16]                           dc.w $0018
[000bfc18]                           dc.w $0001
[000bfc1a]                           dc.w $0000
[000bfc1c] 000bf888                  dc.l ARROW010
[000bfc20]                           dc.w $0000
[000bfc22]                           dc.w $0003
[000bfc24]                           dc.w $0003
[000bfc26]                           dc.w $0001
_08_POP_ARR:
[000bfc28]                           dc.w $0000
[000bfc2a]                           dc.w $ffff
[000bfc2c]                           dc.w $ffff
[000bfc2e]                           dc.w $0018
[000bfc30]                           dc.w $0021
[000bfc32]                           dc.w $0000
[000bfc34] 000bf8e8                  dc.l ARROW013
[000bfc38]                           dc.w $0003
[000bfc3a]                           dc.w $0003
[000bfc3c]                           dc.w $0003
[000bfc3e]                           dc.w $0001
POP_END:
[000bfc40]                           dc.w $ffff
[000bfc42]                           dc.w $0001
[000bfc44]                           dc.w $0004
[000bfc46]                           dc.w $0014
[000bfc48]                           dc.w $0000
[000bfc4a]                           dc.w $0020
[000bfc4c]                           dc.w $00ff
[000bfc4e]                           dc.w $1100
[000bfc50]                           dc.w $0000
[000bfc52]                           dc.w $0000
[000bfc54]                           dc.w $0006
[000bfc56]                           dc.w $0002
_01_POP_END:
[000bfc58]                           dc.w $0002
[000bfc5a]                           dc.w $ffff
[000bfc5c]                           dc.w $ffff
[000bfc5e]                           dc.w $0018
[000bfc60]                           dc.w $0001
[000bfc62]                           dc.w $0000
[000bfc64] 000bf7c8                  dc.l ARROW004
[000bfc68]                           dc.w $0000
[000bfc6a]                           dc.w $0000
[000bfc6c]                           dc.w $0003
[000bfc6e]                           dc.w $0001
_02_POP_END:
[000bfc70]                           dc.w $0003
[000bfc72]                           dc.w $ffff
[000bfc74]                           dc.w $ffff
[000bfc76]                           dc.w $0018
[000bfc78]                           dc.w $0001
[000bfc7a]                           dc.w $0000
[000bfc7c] 000bf808                  dc.l ARROW006
[000bfc80]                           dc.w $0003
[000bfc82]                           dc.w $0000
[000bfc84]                           dc.w $0003
[000bfc86]                           dc.w $0001
_03_POP_END:
[000bfc88]                           dc.w $0004
[000bfc8a]                           dc.w $ffff
[000bfc8c]                           dc.w $ffff
[000bfc8e]                           dc.w $0018
[000bfc90]                           dc.w $0001
[000bfc92]                           dc.w $0000
[000bfc94] 000bfa88                  dc.l A_ARROWS08
[000bfc98]                           dc.w $0000
[000bfc9a]                           dc.w $0001
[000bfc9c]                           dc.w $0003
[000bfc9e]                           dc.w $0001
_04_POP_END:
[000bfca0]                           dc.w $0000
[000bfca2]                           dc.w $ffff
[000bfca4]                           dc.w $ffff
[000bfca6]                           dc.w $0018
[000bfca8]                           dc.w $0021
[000bfcaa]                           dc.w $0000
[000bfcac] 000bfaa8                  dc.l A_ARROWS09
[000bfcb0]                           dc.w $0003
[000bfcb2]                           dc.w $0001
[000bfcb4]                           dc.w $0003
[000bfcb6]                           dc.w $0001
POP_LEN:
[000bfcb8]                           dc.w $ffff
[000bfcba]                           dc.w $0001
[000bfcbc]                           dc.w $0004
[000bfcbe]                           dc.w $0014
[000bfcc0]                           dc.w $0000
[000bfcc2]                           dc.w $0020
[000bfcc4]                           dc.w $00ff
[000bfcc6]                           dc.w $1100
[000bfcc8]                           dc.w $0000
[000bfcca]                           dc.w $0000
[000bfccc]                           dc.w $0006
[000bfcce]                           dc.w $0002
_01_POP_LEN:
[000bfcd0]                           dc.w $0002
[000bfcd2]                           dc.w $ffff
[000bfcd4]                           dc.w $ffff
[000bfcd6]                           dc.w $0018
[000bfcd8]                           dc.w $0001
[000bfcda]                           dc.w $0000
[000bfcdc] 000bf7a8                  dc.l ARROW003
[000bfce0]                           dc.w $0000
[000bfce2]                           dc.w $0000
[000bfce4]                           dc.w $0003
[000bfce6]                           dc.w $0001
_02_POP_LEN:
[000bfce8]                           dc.w $0003
[000bfcea]                           dc.w $ffff
[000bfcec]                           dc.w $ffff
[000bfcee]                           dc.w $0018
[000bfcf0]                           dc.w $0001
[000bfcf2]                           dc.w $0000
[000bfcf4] 000bf7a8                  dc.l ARROW003
[000bfcf8]                           dc.w $0003
[000bfcfa]                           dc.w $0000
[000bfcfc]                           dc.w $0003
[000bfcfe]                           dc.w $0001
_03_POP_LEN:
[000bfd00]                           dc.w $0004
[000bfd02]                           dc.w $ffff
[000bfd04]                           dc.w $ffff
[000bfd06]                           dc.w $0018
[000bfd08]                           dc.w $0001
[000bfd0a]                           dc.w $0000
[000bfd0c] 000bf7c8                  dc.l ARROW004
[000bfd10]                           dc.w $0000
[000bfd12]                           dc.w $0001
[000bfd14]                           dc.w $0003
[000bfd16]                           dc.w $0001
_04_POP_LEN:
[000bfd18]                           dc.w $0000
[000bfd1a]                           dc.w $ffff
[000bfd1c]                           dc.w $ffff
[000bfd1e]                           dc.w $0018
[000bfd20]                           dc.w $0021
[000bfd22]                           dc.w $0000
[000bfd24] 000bf808                  dc.l ARROW006
[000bfd28]                           dc.w $0003
[000bfd2a]                           dc.w $0001
[000bfd2c]                           dc.w $0003
[000bfd2e]                           dc.w $0001
POP_STYLESEL:
[000bfd30]                           dc.w $ffff
[000bfd32]                           dc.w $0001
[000bfd34]                           dc.w $0007
[000bfd36]                           dc.w $0014
[000bfd38]                           dc.w $0000
[000bfd3a]                           dc.w $0020
[000bfd3c]                           dc.w $00ff
[000bfd3e]                           dc.w $1100
[000bfd40]                           dc.w $0000
[000bfd42]                           dc.w $0000
[000bfd44]                           dc.w $0006
[000bfd46]                           dc.w $0007
_01_POP_STYLESEL:
[000bfd48]                           dc.w $0002
[000bfd4a]                           dc.w $ffff
[000bfd4c]                           dc.w $ffff
[000bfd4e]                           dc.w $0018
[000bfd50]                           dc.w $0001
[000bfd52]                           dc.w $0000
[000bfd54] 000bf828                  dc.l ARROW007
[000bfd58]                           dc.w $0000
[000bfd5a]                           dc.w $0000
[000bfd5c]                           dc.w $0006
[000bfd5e]                           dc.w $0001
_02_POP_STYLESEL:
[000bfd60]                           dc.w $0003
[000bfd62]                           dc.w $ffff
[000bfd64]                           dc.w $ffff
[000bfd66]                           dc.w $0018
[000bfd68]                           dc.w $0001
[000bfd6a]                           dc.w $0000
[000bfd6c] 000bf9c8                  dc.l A_ARROWS02
[000bfd70]                           dc.w $0000
[000bfd72]                           dc.w $0001
[000bfd74]                           dc.w $0006
[000bfd76]                           dc.w $0001
_03_POP_STYLESEL:
[000bfd78]                           dc.w $0004
[000bfd7a]                           dc.w $ffff
[000bfd7c]                           dc.w $ffff
[000bfd7e]                           dc.w $0018
[000bfd80]                           dc.w $0001
[000bfd82]                           dc.w $0000
[000bfd84] 000bf9e8                  dc.l A_ARROWS03
[000bfd88]                           dc.w $0000
[000bfd8a]                           dc.w $0002
[000bfd8c]                           dc.w $0006
[000bfd8e]                           dc.w $0001
_04_POP_STYLESEL:
[000bfd90]                           dc.w $0005
[000bfd92]                           dc.w $ffff
[000bfd94]                           dc.w $ffff
[000bfd96]                           dc.w $0018
[000bfd98]                           dc.w $0001
[000bfd9a]                           dc.w $0000
[000bfd9c] 000bfa08                  dc.l A_ARROWS04
[000bfda0]                           dc.w $0000
[000bfda2]                           dc.w $0003
[000bfda4]                           dc.w $0006
[000bfda6]                           dc.w $0001
_05_POP_STYLESEL:
[000bfda8]                           dc.w $0006
[000bfdaa]                           dc.w $ffff
[000bfdac]                           dc.w $ffff
[000bfdae]                           dc.w $0018
[000bfdb0]                           dc.w $0001
[000bfdb2]                           dc.w $0000
[000bfdb4] 000bfa28                  dc.l A_ARROWS05
[000bfdb8]                           dc.w $0000
[000bfdba]                           dc.w $0004
[000bfdbc]                           dc.w $0006
[000bfdbe]                           dc.w $0001
_06_POP_STYLESEL:
[000bfdc0]                           dc.w $0007
[000bfdc2]                           dc.w $ffff
[000bfdc4]                           dc.w $ffff
[000bfdc6]                           dc.w $0018
[000bfdc8]                           dc.w $0001
[000bfdca]                           dc.w $0000
[000bfdcc] 000bfa48                  dc.l A_ARROWS06
[000bfdd0]                           dc.w $0000
[000bfdd2]                           dc.w $0005
[000bfdd4]                           dc.w $0006
[000bfdd6]                           dc.w $0001
_07_POP_STYLESEL:
[000bfdd8]                           dc.w $0000
[000bfdda]                           dc.w $ffff
[000bfddc]                           dc.w $ffff
[000bfdde]                           dc.w $0018
[000bfde0]                           dc.w $0021
[000bfde2]                           dc.w $0000
[000bfde4] 000bfa68                  dc.l A_ARROWS07
[000bfde8]                           dc.w $0000
[000bfdea]                           dc.w $0006
[000bfdec]                           dc.w $0006
[000bfdee]                           dc.w $0001
ED_ARROW:
[000bfdf0]                           dc.w $ffff
[000bfdf2]                           dc.w $0001
[000bfdf4]                           dc.w $0028
[000bfdf6]                           dc.w $0018
[000bfdf8]                           dc.w $0040
[000bfdfa]                           dc.w $0010
[000bfdfc] 000bf968                  dc.l A_3DBUTTON06
[000bfe00]                           dc.w $0000
[000bfe02]                           dc.w $0000
[000bfe04]                           dc.w $002e
[000bfe06]                           dc.w $0010
_01_ED_ARROW:
[000bfe08]                           dc.w $0003
[000bfe0a]                           dc.w $0002
[000bfe0c]                           dc.w $0002
[000bfe0e]                           dc.w $0018
[000bfe10]                           dc.w $0040
[000bfe12]                           dc.w $0000
[000bfe14] 000bf908                  dc.l A_3DBUTTON02
[000bfe18]                           dc.w $0000
[000bfe1a]                           dc.w $0000
[000bfe1c]                           dc.w $000c
[000bfe1e]                           dc.w $0004
_02_ED_ARROW:
[000bfe20]                           dc.w $0001
[000bfe22]                           dc.w $ffff
[000bfe24]                           dc.w $ffff
[000bfe26]                           dc.w $0018
[000bfe28]                           dc.w $0000
[000bfe2a]                           dc.w $0000
[000bfe2c] 000bf768                  dc.l ARROW001
[000bfe30]                           dc.w $0002
[000bfe32]                           dc.w $0001
[000bfe34]                           dc.w $0008
[000bfe36]                           dc.w $0002
_03_ED_ARROW:
[000bfe38]                           dc.w $0005
[000bfe3a]                           dc.w $ffff
[000bfe3c]                           dc.w $ffff
[000bfe3e]                           dc.w $0018
[000bfe40]                           dc.w $4007
[000bfe42]                           dc.w $0010
[000bfe44] 000bf928                  dc.l A_3DBUTTON03
[000bfe48]                           dc.w $0013
[000bfe4a]                           dc.w $0001
[000bfe4c]                           dc.w $000c
[000bfe4e]                           dc.w $0002
_03aED_ARROW:
[000bfe50] 00028c8c                  dc.l ok
[000bfe54]                           dc.w $0000
[000bfe56]                           dc.w $0000
[000bfe58]                           dc.w $8000
[000bfe5a]                           dc.w $884f
[000bfe5c]                           dc.w $0000
[000bfe5e]                           dc.w $0000
[000bfe60]                           dc.w $0000
[000bfe62]                           dc.w $0000
[000bfe64]                           dc.w $0000
[000bfe66]                           dc.w $0000
_05_ED_ARROW:
[000bfe68]                           dc.w $0007
[000bfe6a]                           dc.w $ffff
[000bfe6c]                           dc.w $ffff
[000bfe6e]                           dc.w $0018
[000bfe70]                           dc.w $4005
[000bfe72]                           dc.w $0010
[000bfe74] 000bf948                  dc.l A_3DBUTTON05
[000bfe78]                           dc.w $0021
[000bfe7a]                           dc.w $0001
[000bfe7c]                           dc.w $000c
[000bfe7e]                           dc.w $0002
_05aED_ARROW:
[000bfe80] 00028c66                  dc.l abort
[000bfe84]                           dc.w $0000
[000bfe86]                           dc.w $0000
[000bfe88]                           dc.w $8000
[000bfe8a]                           dc.w $8841
[000bfe8c]                           dc.w $0000
[000bfe8e]                           dc.w $0000
[000bfe90]                           dc.w $0000
[000bfe92]                           dc.w $0000
[000bfe94]                           dc.w $0000
[000bfe96]                           dc.w $0000
_07_ED_ARROW:
[000bfe98]                           dc.w $0009
[000bfe9a]                           dc.w $0008
[000bfe9c]                           dc.w $0008
[000bfe9e]                           dc.w $001c
[000bfea0]                           dc.w $0040
[000bfea2]                           dc.w $0000
[000bfea4] 000bf704                  dc.l TEXT_07
[000bfea8]                           dc.w $0001
[000bfeaa]                           dc.w $0005
[000bfeac]                           dc.w $000a
[000bfeae]                           dc.w $0001
_08_ED_ARROW:
[000bfeb0]                           dc.w $0007
[000bfeb2]                           dc.w $ffff
[000bfeb4]                           dc.w $ffff
[000bfeb6]                           dc.w $0018
[000bfeb8]                           dc.w $0040
[000bfeba]                           dc.w $0000
[000bfebc] 000bf9a8                  dc.l A_ARROWS01
[000bfec0]                           dc.w $0000
[000bfec2]                           dc.w $0000
[000bfec4]                           dc.w $0001
[000bfec6]                           dc.w $0001
_09_ED_ARROW:
[000bfec8]                           dc.w $000d
[000bfeca]                           dc.w $000b
[000bfecc]                           dc.w $000c
[000bfece]                           dc.w $0014
[000bfed0]                           dc.w $0040
[000bfed2]                           dc.w $0020
[000bfed4]                           dc.w $00ff
[000bfed6]                           dc.w $1101
[000bfed8]                           dc.w $000b
[000bfeda]                           dc.w $0005
[000bfedc]                           dc.w $0006
[000bfede]                           dc.w $0001
_09aED_ARROW:
[000bfee0] 000283f2                  dc.l edar_arr
[000bfee4]                           dc.w $0000
[000bfee6]                           dc.w $0000
[000bfee8]                           dc.w $8000
[000bfeea]                           dc.w $8852
[000bfeec]                           dc.w $0000
[000bfeee]                           dc.w $0000
[000bfef0]                           dc.w $0000
[000bfef2]                           dc.w $0000
[000bfef4]                           dc.w $0000
[000bfef6]                           dc.w $0000
_11_ED_ARROW:
[000bfef8]                           dc.w $000c
[000bfefa]                           dc.w $ffff
[000bfefc]                           dc.w $ffff
[000bfefe]                           dc.w $0018
[000bff00]                           dc.w $0000
[000bff02]                           dc.w $0000
[000bff04] 000bf848                  dc.l ARROW008
[000bff08]                           dc.w $0000
[000bff0a]                           dc.w $0000
[000bff0c]                           dc.w $0003
[000bff0e]                           dc.w $0001
_12_ED_ARROW:
[000bff10]                           dc.w $0009
[000bff12]                           dc.w $ffff
[000bff14]                           dc.w $ffff
[000bff16]                           dc.w $0018
[000bff18]                           dc.w $0000
[000bff1a]                           dc.w $0000
[000bff1c] 000bf8a8                  dc.l ARROW011
[000bff20]                           dc.w $0003
[000bff22]                           dc.w $0000
[000bff24]                           dc.w $0003
[000bff26]                           dc.w $0001
_13_ED_ARROW:
[000bff28]                           dc.w $000f
[000bff2a]                           dc.w $000e
[000bff2c]                           dc.w $000e
[000bff2e]                           dc.w $001c
[000bff30]                           dc.w $0040
[000bff32]                           dc.w $0000
[000bff34] 000bf723                  dc.l TEXT_11
[000bff38]                           dc.w $0013
[000bff3a]                           dc.w $0005
[000bff3c]                           dc.w $0006
[000bff3e]                           dc.w $0001
_14_ED_ARROW:
[000bff40]                           dc.w $000d
[000bff42]                           dc.w $ffff
[000bff44]                           dc.w $ffff
[000bff46]                           dc.w $0018
[000bff48]                           dc.w $0040
[000bff4a]                           dc.w $0000
[000bff4c] 000bf9a8                  dc.l A_ARROWS01
[000bff50]                           dc.w $0000
[000bff52]                           dc.w $0000
[000bff54]                           dc.w $0001
[000bff56]                           dc.w $0001
_15_ED_ARROW:
[000bff58]                           dc.w $0013
[000bff5a]                           dc.w $0011
[000bff5c]                           dc.w $0012
[000bff5e]                           dc.w $0014
[000bff60]                           dc.w $0040
[000bff62]                           dc.w $0020
[000bff64]                           dc.w $00ff
[000bff66]                           dc.w $1101
[000bff68]                           dc.w $001a
[000bff6a]                           dc.w $0005
[000bff6c]                           dc.w $0012
[000bff6e]                           dc.w $0001
_15aED_ARROW:
[000bff70] 00028518                  dc.l edar_col
[000bff74]                           dc.w $0000
[000bff76]                           dc.w $0000
[000bff78]                           dc.w $8000
[000bff7a]                           dc.w $8846
[000bff7c]                           dc.w $0000
[000bff7e]                           dc.w $0000
[000bff80]                           dc.w $0000
[000bff82]                           dc.w $0000
[000bff84]                           dc.w $0000
[000bff86]                           dc.w $0000
_17_ED_ARROW:
[000bff88]                           dc.w $0012
[000bff8a]                           dc.w $ffff
[000bff8c]                           dc.w $ffff
[000bff8e]                           dc.w $0014
[000bff90]                           dc.w $0000
[000bff92]                           dc.w $0000
[000bff94]                           dc.w $0001
[000bff96]                           dc.w $1171
[000bff98]                           dc.w $0010
[000bff9a]                           dc.w $0000
[000bff9c]                           dc.w $0002
[000bff9e]                           dc.w $0001
_18_ED_ARROW:
[000bffa0]                           dc.w $000f
[000bffa2]                           dc.w $ffff
[000bffa4]                           dc.w $ffff
[000bffa6]                           dc.w $0018
[000bffa8]                           dc.w $0000
[000bffaa]                           dc.w $0000
[000bffac] 000bf988                  dc.l A_3DBUTTON23
[000bffb0]                           dc.w $0000
[000bffb2]                           dc.w $0000
[000bffb4]                           dc.w $0010
[000bffb6]                           dc.w $0001
_19_ED_ARROW:
[000bffb8]                           dc.w $0015
[000bffba]                           dc.w $0014
[000bffbc]                           dc.w $0014
[000bffbe]                           dc.w $001c
[000bffc0]                           dc.w $0040
[000bffc2]                           dc.w $0000
[000bffc4] 000bf714                  dc.l TEXT_09
[000bffc8]                           dc.w $0003
[000bffca]                           dc.w $0007
[000bffcc]                           dc.w $0007
[000bffce]                           dc.w $0001
_20_ED_ARROW:
[000bffd0]                           dc.w $0013
[000bffd2]                           dc.w $ffff
[000bffd4]                           dc.w $ffff
[000bffd6]                           dc.w $0018
[000bffd8]                           dc.w $0040
[000bffda]                           dc.w $0000
[000bffdc] 000bf9a8                  dc.l A_ARROWS01
[000bffe0]                           dc.w $0000
[000bffe2]                           dc.w $0000
[000bffe4]                           dc.w $0001
[000bffe6]                           dc.w $0001
_21_ED_ARROW:
[000bffe8]                           dc.w $0019
[000bffea]                           dc.w $0017
[000bffec]                           dc.w $0018
[000bffee]                           dc.w $0014
[000bfff0]                           dc.w $0040
[000bfff2]                           dc.w $0020
[000bfff4]                           dc.w $00ff
[000bfff6]                           dc.w $1101
[000bfff8]                           dc.w $000b
[000bfffa]                           dc.w $0007
[000bfffc]                           dc.w $0006
[000bfffe]                           dc.w $0001
_21aED_ARROW:
[000c0000] 000286f8                  dc.l edar_len
[000c0004]                           dc.w $0000
[000c0006]                           dc.w $0000
[000c0008]                           dc.w $8000
[000c000a]                           dc.w $884c
[000c000c]                           dc.w $0000
[000c000e]                           dc.w $0000
[000c0010]                           dc.w $0000
[000c0012]                           dc.w $0000
[000c0014]                           dc.w $0000
[000c0016]                           dc.w $0000
_23_ED_ARROW:
[000c0018]                           dc.w $0018
[000c001a]                           dc.w $ffff
[000c001c]                           dc.w $ffff
[000c001e]                           dc.w $0018
[000c0020]                           dc.w $0000
[000c0022]                           dc.w $0000
[000c0024] 000bf7a8                  dc.l ARROW003
[000c0028]                           dc.w $0000
[000c002a]                           dc.w $0000
[000c002c]                           dc.w $0003
[000c002e]                           dc.w $0001
_24_ED_ARROW:
[000c0030]                           dc.w $0015
[000c0032]                           dc.w $ffff
[000c0034]                           dc.w $ffff
[000c0036]                           dc.w $0018
[000c0038]                           dc.w $0000
[000c003a]                           dc.w $0000
[000c003c] 000bf7a8                  dc.l ARROW003
[000c0040]                           dc.w $0003
[000c0042]                           dc.w $0000
[000c0044]                           dc.w $0003
[000c0046]                           dc.w $0001
_25_ED_ARROW:
[000c0048]                           dc.w $001b
[000c004a]                           dc.w $001a
[000c004c]                           dc.w $001a
[000c004e]                           dc.w $001c
[000c0050]                           dc.w $0040
[000c0052]                           dc.w $0000
[000c0054] 000bf72a                  dc.l TEXT_12
[000c0058]                           dc.w $0014
[000c005a]                           dc.w $0007
[000c005c]                           dc.w $0006
[000c005e]                           dc.w $0001
_26_ED_ARROW:
[000c0060]                           dc.w $0019
[000c0062]                           dc.w $ffff
[000c0064]                           dc.w $ffff
[000c0066]                           dc.w $0018
[000c0068]                           dc.w $0040
[000c006a]                           dc.w $0000
[000c006c] 000bf9a8                  dc.l A_ARROWS01
[000c0070]                           dc.w $0000
[000c0072]                           dc.w $0000
[000c0074]                           dc.w $0001
[000c0076]                           dc.w $0001
_27_ED_ARROW:
[000c0078]                           dc.w $001e
[000c007a]                           dc.w $001d
[000c007c]                           dc.w $001d
[000c007e]                           dc.w $0014
[000c0080]                           dc.w $0040
[000c0082]                           dc.w $0020
[000c0084]                           dc.w $00ff
[000c0086]                           dc.w $1101
[000c0088]                           dc.w $001a
[000c008a]                           dc.w $0007
[000c008c]                           dc.w $0006
[000c008e]                           dc.w $0001
_27aED_ARROW:
[000c0090] 0002882a                  dc.l edar_stil
[000c0094]                           dc.w $0000
[000c0096]                           dc.w $0000
[000c0098]                           dc.w $8000
[000c009a]                           dc.w $8853
[000c009c]                           dc.w $0000
[000c009e]                           dc.w $0000
[000c00a0]                           dc.w $0000
[000c00a2]                           dc.w $0000
[000c00a4]                           dc.w $0000
[000c00a6]                           dc.w $0000
_29_ED_ARROW:
[000c00a8]                           dc.w $001b
[000c00aa]                           dc.w $ffff
[000c00ac]                           dc.w $ffff
[000c00ae]                           dc.w $0018
[000c00b0]                           dc.w $0000
[000c00b2]                           dc.w $0000
[000c00b4] 000bf828                  dc.l ARROW007
[000c00b8]                           dc.w $0000
[000c00ba]                           dc.w $0000
[000c00bc]                           dc.w $0006
[000c00be]                           dc.w $0001
_30_ED_ARROW:
[000c00c0]                           dc.w $0020
[000c00c2]                           dc.w $001f
[000c00c4]                           dc.w $001f
[000c00c6]                           dc.w $001c
[000c00c8]                           dc.w $0040
[000c00ca]                           dc.w $0000
[000c00cc] 000bf71c                  dc.l TEXT_10
[000c00d0]                           dc.w $0004
[000c00d2]                           dc.w $0009
[000c00d4]                           dc.w $0006
[000c00d6]                           dc.w $0001
_31_ED_ARROW:
[000c00d8]                           dc.w $001e
[000c00da]                           dc.w $ffff
[000c00dc]                           dc.w $ffff
[000c00de]                           dc.w $0018
[000c00e0]                           dc.w $0040
[000c00e2]                           dc.w $0000
[000c00e4] 000bf9a8                  dc.l A_ARROWS01
[000c00e8]                           dc.w $0000
[000c00ea]                           dc.w $0000
[000c00ec]                           dc.w $0001
[000c00ee]                           dc.w $0001
_32_ED_ARROW:
[000c00f0]                           dc.w $0024
[000c00f2]                           dc.w $0022
[000c00f4]                           dc.w $0023
[000c00f6]                           dc.w $0014
[000c00f8]                           dc.w $0040
[000c00fa]                           dc.w $0020
[000c00fc]                           dc.w $00ff
[000c00fe]                           dc.w $1101
[000c0100]                           dc.w $000b
[000c0102]                           dc.w $0009
[000c0104]                           dc.w $0006
[000c0106]                           dc.w $0001
_32aED_ARROW:
[000c0108] 00028574                  dc.l edar_ends
[000c010c]                           dc.w $0000
[000c010e]                           dc.w $0000
[000c0110]                           dc.w $8000
[000c0112]                           dc.w $8845
[000c0114]                           dc.w $0000
[000c0116]                           dc.w $0000
[000c0118]                           dc.w $0000
[000c011a]                           dc.w $0000
[000c011c]                           dc.w $0000
[000c011e]                           dc.w $0000
_34_ED_ARROW:
[000c0120]                           dc.w $0023
[000c0122]                           dc.w $ffff
[000c0124]                           dc.w $ffff
[000c0126]                           dc.w $0018
[000c0128]                           dc.w $0000
[000c012a]                           dc.w $0000
[000c012c] 000bf7a8                  dc.l ARROW003
[000c0130]                           dc.w $0000
[000c0132]                           dc.w $0000
[000c0134]                           dc.w $0003
[000c0136]                           dc.w $0001
_35_ED_ARROW:
[000c0138]                           dc.w $0020
[000c013a]                           dc.w $ffff
[000c013c]                           dc.w $ffff
[000c013e]                           dc.w $0018
[000c0140]                           dc.w $0000
[000c0142]                           dc.w $0000
[000c0144] 000bf7a8                  dc.l ARROW003
[000c0148]                           dc.w $0003
[000c014a]                           dc.w $0000
[000c014c]                           dc.w $0003
[000c014e]                           dc.w $0001
_36_ED_ARROW:
[000c0150]                           dc.w $0026
[000c0152]                           dc.w $ffff
[000c0154]                           dc.w $ffff
[000c0156]                           dc.w $0018
[000c0158]                           dc.w $0041
[000c015a]                           dc.w $0001
[000c015c] 000bfb28                  dc.l A_CHECKBOX03
[000c0160]                           dc.w $0017
[000c0162]                           dc.w $0009
[000c0164]                           dc.w $0008
[000c0166]                           dc.w $0001
_36aED_ARROW:
[000c0168] 000286c2                  dc.l edar_fat
[000c016c]                           dc.w $0000
[000c016e]                           dc.w $0000
[000c0170]                           dc.w $8000
[000c0172]                           dc.w $8842
[000c0174]                           dc.w $0000
[000c0176]                           dc.w $0000
[000c0178]                           dc.w $0000
[000c017a]                           dc.w $0000
[000c017c]                           dc.w $0000
[000c017e]                           dc.w $0000
_38_ED_ARROW:
[000c0180]                           dc.w $0028
[000c0182]                           dc.w $ffff
[000c0184]                           dc.w $ffff
[000c0186]                           dc.w $0018
[000c0188]                           dc.w $0041
[000c018a]                           dc.w $0001
[000c018c] 000bfb08                  dc.l A_CHECKBOX02
[000c0190]                           dc.w $0021
[000c0192]                           dc.w $0009
[000c0194]                           dc.w $000b
[000c0196]                           dc.w $0001
_38aED_ARROW:
[000c0198] 000283bc                  dc.l edar_3d
[000c019c]                           dc.w $0000
[000c019e]                           dc.w $0000
[000c01a0]                           dc.w $8000
[000c01a2]                           dc.w $8844
[000c01a4]                           dc.w $0000
[000c01a6]                           dc.w $0000
[000c01a8]                           dc.w $0000
[000c01aa]                           dc.w $0000
[000c01ac]                           dc.w $0000
[000c01ae]                           dc.w $0000
_40_ED_ARROW:
[000c01b0]                           dc.w $0000
[000c01b2]                           dc.w $0029
[000c01b4]                           dc.w $002c
[000c01b6]                           dc.w $0018
[000c01b8]                           dc.w $0040
[000c01ba]                           dc.w $0000
[000c01bc] 000bfb48                  dc.l A_INNERFRAME03
[000c01c0]                           dc.w $0001
[000c01c2]                           dc.w $000b
[000c01c4]                           dc.w $002c
[000c01c6]                           dc.w $0005
_41_ED_ARROW:
[000c01c8]                           dc.w $002a
[000c01ca]                           dc.w $ffff
[000c01cc]                           dc.w $ffff
[000c01ce]                           dc.w $001c
[000c01d0]                           dc.w $0000
[000c01d2]                           dc.w $0000
[000c01d4] 000bf730                  dc.l TEXT_13
[000c01d8]                           dc.w $0001
[000c01da]                           dc.w $0001
[000c01dc]                           dc.w $000e
[000c01de]                           dc.w $0001
_42_ED_ARROW:
[000c01e0]                           dc.w $002b
[000c01e2]                           dc.w $ffff
[000c01e4]                           dc.w $ffff
[000c01e6]                           dc.w $001c
[000c01e8]                           dc.w $0000
[000c01ea]                           dc.w $0000
[000c01ec] 000bf73f                  dc.l TEXT_14
[000c01f0]                           dc.w $0001
[000c01f2]                           dc.w $0003
[000c01f4]                           dc.w $000d
[000c01f6]                           dc.w $0001
_43_ED_ARROW:
[000c01f8]                           dc.w $002c
[000c01fa]                           dc.w $ffff
[000c01fc]                           dc.w $ffff
[000c01fe]                           dc.w $0018
[000c0200]                           dc.w $0008
[000c0202]                           dc.w $0010
[000c0204] 000bfac8                  dc.l A_BOXED03
[000c0208]                           dc.w $0010
[000c020a]                           dc.w $0001
[000c020c]                           dc.w $001b
[000c020e]                           dc.w $0001
_44_ED_ARROW:
[000c0210]                           dc.w $0028
[000c0212]                           dc.w $ffff
[000c0214]                           dc.w $ffff
[000c0216]                           dc.w $0018
[000c0218]                           dc.w $0028
[000c021a]                           dc.w $0010
[000c021c] 000bfae8                  dc.l A_BOXED04
[000c0220]                           dc.w $0010
[000c0222]                           dc.w $0003
[000c0224]                           dc.w $001b
[000c0226]                           dc.w $0001
arrow:
[000c0228] 00065c72                  dc.l A_arrows
[000c022c]                           dc.w $2251
[000c022e]                           dc.w $0001
[000c0230]                           dc.w $0000
[000c0232]                           dc.w $0000
[000c0234]                           dc.w $0000
[000c0236]                           dc.w $0000
[000c0238]                           dc.w $0000
[000c023a]                           dc.w $0000
[000c023c]                           dc.w $0000
[000c023e]                           dc.w $0000
[000c0240]                           dc.w $0000
[000c0242]                           dc.w $0000
[000c0244]                           dc.w $0000
[000c0246]                           dc.w $0000
disline:
[000c0248] 00065c72                  dc.l A_arrows
[000c024c]                           dc.w $2209
[000c024e]                           dc.w $0001
[000c0250]                           dc.w $0000
[000c0252]                           dc.w $0000
[000c0254]                           dc.w $0000
[000c0256]                           dc.w $0000
[000c0258]                           dc.w $0000
[000c025a]                           dc.w $0000
[000c025c]                           dc.w $0000
[000c025e]                           dc.w $0000
[000c0260]                           dc.w $0000
[000c0262]                           dc.w $0000
[000c0264]                           dc.w $0000
[000c0266]                           dc.w $0000
visual:
[000c0268]                           dc.w $ffff
[000c026a]                           dc.w $ffff
[000c026c]                           dc.w $ffff
[000c026e]                           dc.w $0018
[000c0270]                           dc.w $2001
[000c0272]                           dc.w $0000
[000c0274] 000c0228                  dc.l arrow
[000c0278]                           dc.w $0000
[000c027a]                           dc.w $0000
[000c027c]                           dc.w $000a
[000c027e]                           dc.w $0001
logical:
[000c0280]                           dc.w $ffff
[000c0282]                           dc.w $ffff
[000c0284]                           dc.w $ffff
[000c0286]                           dc.w $0018
[000c0288]                           dc.w $0000
[000c028a]                           dc.w $0000
[000c028c] 000c0228                  dc.l arrow
[000c0290]                           dc.w $0000
[000c0292]                           dc.w $0000
[000c0294]                           dc.w $0004
[000c0296]                           dc.w $0001
disvisual:
[000c0298]                           dc.w $ffff
[000c029a]                           dc.w $ffff
[000c029c]                           dc.w $ffff
[000c029e]                           dc.w $0018
[000c02a0]                           dc.w $2001
[000c02a2]                           dc.w $0000
[000c02a4] 000c0248                  dc.l disline
[000c02a8]                           dc.w $0000
[000c02aa]                           dc.w $0000
[000c02ac]                           dc.w $000a
[000c02ae]                           dc.w $0001
dislogical:
[000c02b0]                           dc.w $ffff
[000c02b2]                           dc.w $ffff
[000c02b4]                           dc.w $ffff
[000c02b6]                           dc.w $0018
[000c02b8]                           dc.w $0000
[000c02ba]                           dc.w $0108
[000c02bc] 000c0248                  dc.l disline
[000c02c0]                           dc.w $0000
[000c02c2]                           dc.w $0000
[000c02c4]                           dc.w $0004
[000c02c6]                           dc.w $0001
aud:
[000c02c8] 000c03c4                  dc.l $000c03c4
[000c02cc]                           dc.w $0000
[000c02ce]                           dc.w $0000
[000c02d0]                           dc.w $0000
[000c02d2]                           dc.w $0000
[000c02d4]                           dc.w $0000
[000c02d6]                           dc.w $0000
[000c02d8]                           dc.w $0000
[000c02da]                           dc.w $0000
[000c02dc]                           dc.w $0000
[000c02de]                           dc.w $0000
[000c02e0]                           dc.w $0000
[000c02e2]                           dc.w $0000
[000c02e4]                           dc.w $0000
[000c02e6]                           dc.w $0000
[000c02e8]                           dc.w $0000
[000c02ea]                           dc.w $0000
[000c02ec]                           dc.w $0000
[000c02ee]                           dc.w $0000
[000c02f0]                           dc.w $0000
[000c02f2]                           dc.w $0000
[000c02f4]                           dc.w $0000
disaud:
[000c02f6] 000c03d0                  dc.l $000c03d0
[000c02fa]                           dc.w $0000
[000c02fc]                           dc.w $0000
[000c02fe]                           dc.w $0000
[000c0300]                           dc.w $0000
[000c0302]                           dc.w $0000
[000c0304]                           dc.w $0000
[000c0306]                           dc.w $0000
[000c0308]                           dc.w $0000
[000c030a]                           dc.w $0000
[000c030c]                           dc.w $0000
[000c030e]                           dc.w $0000
[000c0310]                           dc.w $0000
[000c0312]                           dc.w $0000
[000c0314]                           dc.w $0000
[000c0316]                           dc.w $0000
[000c0318]                           dc.w $0000
[000c031a]                           dc.w $0000
[000c031c]                           dc.w $0000
[000c031e]                           dc.w $0000
[000c0320]                           dc.w $0000
[000c0322]                           dc.w $0000
data:
[000c0324]                           dc.b 'A_arrows',0
[000c032d]                           dc.b $00
[000c032e]                           dc.w $0000
[000c0330]                           dc.w $0000
[000c0332]                           dc.w $0000
[000c0334]                           dc.w $0000
[000c0336]                           dc.w $0000
[000c0338]                           dc.w $0000
[000c033a]                           dc.w $0000
[000c033c]                           dc.w $0000
[000c033e]                           dc.w $0000
[000c0340]                           dc.w $0000
[000c0342]                           dc.w $0000
[000c0344] 0002894a                  dc.l object_tree
[000c0348] 00028bf8                  dc.l test_it
[000c034c] 00028c8c                  dc.l ok
[000c0350] 0004f20a                  dc.l Aob_delete
[000c0354] 000c0268                  dc.l visual
[000c0358] 000c0280                  dc.l logical
[000c035c] 000c02c8                  dc.l aud
[000c0360] 0002892c                  dc.l minsize
[000c0364]                           dc.w $0000
[000c0366]                           dc.w $0000
[000c0368] 000bf75f                  dc.l title
[000c036c] 000bf74d                  dc.l help_title
[000c0370]                           dc.w $0000
[000c0372]                           dc.w $0000
disdata:
[000c0374]                           dc.b 'A_arrows',0
[000c037d]                           dc.b $00
[000c037e]                           dc.w $0000
[000c0380]                           dc.w $0000
[000c0382]                           dc.w $0000
[000c0384]                           dc.w $0000
[000c0386]                           dc.w $0000
[000c0388]                           dc.w $0000
[000c038a]                           dc.w $0000
[000c038c]                           dc.w $0000
[000c038e]                           dc.w $0000
[000c0390]                           dc.w $0000
[000c0392]                           dc.w $0000
[000c0394] 0002894a                  dc.l object_tree
[000c0398] 00028bf8                  dc.l test_it
[000c039c] 00028c8c                  dc.l ok
[000c03a0] 0004f20a                  dc.l Aob_delete
[000c03a4] 000c0298                  dc.l disvisual
[000c03a8] 000c02b0                  dc.l dislogical
[000c03ac] 000c02f6                  dc.l disaud
[000c03b0] 0002892c                  dc.l minsize
[000c03b4]                           dc.w $0000
[000c03b6]                           dc.w $0000
[000c03b8] 000bf75f                  dc.l title
[000c03bc] 000bf74d                  dc.l help_title
[000c03c0]                           dc.w $0000
[000c03c2]                           dc.w $0000
[000c03c4]                           dc.b '0x22510001L',0
[000c03d0]                           dc.b '0x22090001L',0
[000c03dc]                           dc.b '0x%lxL',0
[000c03e3]                           dc.b $00
