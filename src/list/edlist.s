find_entry:
[0003337c] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00033380] 2649                      movea.l    a1,a3
[00033382] 2628 000e                 move.l     14(a0),d3
[00033386] e48b                      lsr.l      #2,d3
[00033388] 2468 0004                 movea.l    4(a0),a2
[0003338c] 601a                      bra.s      $000333A8
[0003338e] 2252                      movea.l    (a2),a1
[00033390] 43e9 0016                 lea.l      22(a1),a1
[00033394] 204b                      movea.l    a3,a0
[00033396] 4eb9 0008 2eba            jsr        strcmp
[0003339c] 4a40                      tst.w      d0
[0003339e] 6604                      bne.s      $000333A4
[000333a0] 2052                      movea.l    (a2),a0
[000333a2] 600a                      bra.s      $000333AE
[000333a4] 584a                      addq.w     #4,a2
[000333a6] 5343                      subq.w     #1,d3
[000333a8] 4a43                      tst.w      d3
[000333aa] 6ee2                      bgt.s      $0003338E
[000333ac] 91c8                      suba.l     a0,a0
[000333ae] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000333b2] 4e75                      rts
add_entry:
[000333b4] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000333b8] 2448                      movea.l    a0,a2
[000333ba] 2849                      movea.l    a1,a4
[000333bc] 7004                      moveq.l    #4,d0
[000333be] 4eb9 0001 8028            jsr        objextent
[000333c4] 4a40                      tst.w      d0
[000333c6] 6704                      beq.s      $000333CC
[000333c8] 70ff                      moveq.l    #-1,d0
[000333ca] 604e                      bra.s      $0003341A
[000333cc] 262a 000e                 move.l     14(a2),d3
[000333d0] e48b                      lsr.l      #2,d3
[000333d2] 5343                      subq.w     #1,d3
[000333d4] 58aa 000e                 addq.l     #4,14(a2)
[000333d8] 266a 0004                 movea.l    4(a2),a3
[000333dc] 3003                      move.w     d3,d0
[000333de] 48c0                      ext.l      d0
[000333e0] e588                      lsl.l      #2,d0
[000333e2] d7c0                      adda.l     d0,a3
[000333e4] 6008                      bra.s      $000333EE
[000333e6] 2753 0004                 move.l     (a3),4(a3)
[000333ea] 594b                      subq.w     #4,a3
[000333ec] 5343                      subq.w     #1,d3
[000333ee] 4a43                      tst.w      d3
[000333f0] 6b14                      bmi.s      $00033406
[000333f2] 2253                      movea.l    (a3),a1
[000333f4] 43e9 0016                 lea.l      22(a1),a1
[000333f8] 41ec 0016                 lea.l      22(a4),a0
[000333fc] 4eb9 0008 2eba            jsr        strcmp
[00033402] 4a40                      tst.w      d0
[00033404] 6be0                      bmi.s      $000333E6
[00033406] 274c 0004                 move.l     a4,4(a3)
[0003340a] 202a 0012                 move.l     18(a2),d0
[0003340e] 6708                      beq.s      $00033418
[00033410] 2040                      movea.l    d0,a0
[00033412] 0068 0020 0056            ori.w      #$0020,86(a0)
[00033418] 4240                      clr.w      d0
[0003341a] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003341e] 4e75                      rts
del_entry:
[00033420] 2f03                      move.l     d3,-(a7)
[00033422] 2f0a                      move.l     a2,-(a7)
[00033424] 2028 000e                 move.l     14(a0),d0
[00033428] e488                      lsr.l      #2,d0
[0003342a] 5340                      subq.w     #1,d0
[0003342c] 2468 0004                 movea.l    4(a0),a2
[00033430] 4241                      clr.w      d1
[00033432] 6002                      bra.s      $00033436
[00033434] 5241                      addq.w     #1,d1
[00033436] b041                      cmp.w      d1,d0
[00033438] 6d0c                      blt.s      $00033446
[0003343a] 3401                      move.w     d1,d2
[0003343c] 48c2                      ext.l      d2
[0003343e] e58a                      lsl.l      #2,d2
[00033440] b3f2 2800                 cmpa.l     0(a2,d2.l),a1
[00033444] 66ee                      bne.s      $00033434
[00033446] b041                      cmp.w      d1,d0
[00033448] 6d2c                      blt.s      $00033476
[0003344a] 6014                      bra.s      $00033460
[0003344c] 3401                      move.w     d1,d2
[0003344e] 48c2                      ext.l      d2
[00033450] e58a                      lsl.l      #2,d2
[00033452] 3601                      move.w     d1,d3
[00033454] 48c3                      ext.l      d3
[00033456] e58b                      lsl.l      #2,d3
[00033458] 25b2 2804 3800            move.l     4(a2,d2.l),0(a2,d3.l)
[0003345e] 5241                      addq.w     #1,d1
[00033460] b041                      cmp.w      d1,d0
[00033462] 6ee8                      bgt.s      $0003344C
[00033464] 59a8 000e                 subq.l     #4,14(a0)
[00033468] 2028 0012                 move.l     18(a0),d0
[0003346c] 6708                      beq.s      $00033476
[0003346e] 2240                      movea.l    d0,a1
[00033470] 0069 0020 0056            ori.w      #$0020,86(a1)
[00033476] 245f                      movea.l    (a7)+,a2
[00033478] 261f                      move.l     (a7)+,d3
[0003347a] 4e75                      rts
delete:
[0003347c] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00033480] 2448                      movea.l    a0,a2
[00033482] 2279 0010 ee4e            movea.l    ACSblk,a1
[00033488] b1e9 0240                 cmpa.l     576(a1),a0
[0003348c] 6654                      bne.s      $000334E2
[0003348e] 2650                      movea.l    (a0),a3
[00033490] 4269 0248                 clr.w      584(a1)
[00033494] 6042                      bra.s      $000334D8
[00033496] 3203                      move.w     d3,d1
[00033498] 48c1                      ext.l      d1
[0003349a] 2001                      move.l     d1,d0
[0003349c] d080                      add.l      d0,d0
[0003349e] d081                      add.l      d1,d0
[000334a0] e788                      lsl.l      #3,d0
[000334a2] 206a 0014                 movea.l    20(a2),a0
[000334a6] 41f0 0818                 lea.l      24(a0,d0.l),a0
[000334aa] 2868 000c                 movea.l    12(a0),a4
[000334ae] 342c 0038                 move.w     56(a4),d2
[000334b2] c47c 0100                 and.w      #$0100,d2
[000334b6] 6720                      beq.s      $000334D8
[000334b8] 204a                      movea.l    a2,a0
[000334ba] 3003                      move.w     d3,d0
[000334bc] 4eb9 0004 7f76            jsr        Adr_del
[000334c2] 026c feff 0038            andi.w     #$FEFF,56(a4)
[000334c8] 224c                      movea.l    a4,a1
[000334ca] 2053                      movea.l    (a3),a0
[000334cc] 2a6b 001e                 movea.l    30(a3),a5
[000334d0] 4e95                      jsr        (a5)
[000334d2] 006a 0020 0056            ori.w      #$0020,86(a2)
[000334d8] 4eb9 0004 7e2a            jsr        Adr_next
[000334de] 3600                      move.w     d0,d3
[000334e0] 6eb4                      bgt.s      $00033496
[000334e2] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000334e6] 4e75                      rts
li_changename:
[000334e8] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000334ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[000334f2] 4268 0248                 clr.w      584(a0)
[000334f6] 4eb9 0004 7e2a            jsr        Adr_next
[000334fc] 3600                      move.w     d0,d3
[000334fe] 6f00 008c                 ble        $0003358C
[00033502] 48c0                      ext.l      d0
[00033504] 2200                      move.l     d0,d1
[00033506] d281                      add.l      d1,d1
[00033508] d280                      add.l      d0,d1
[0003350a] e789                      lsl.l      #3,d1
[0003350c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033512] 2268 0258                 movea.l    600(a0),a1
[00033516] 2069 0014                 movea.l    20(a1),a0
[0003351a] 41f0 1818                 lea.l      24(a0,d1.l),a0
[0003351e] 2651                      movea.l    (a1),a3
[00033520] 2468 000c                 movea.l    12(a0),a2
[00033524] 2f2b 0010                 move.l     16(a3),-(a7)
[00033528] 2053                      movea.l    (a3),a0
[0003352a] 224a                      movea.l    a2,a1
[0003352c] 4eb9 0001 6252            jsr        new2label
[00033532] 584f                      addq.w     #4,a7
[00033534] 4a40                      tst.w      d0
[00033536] 6754                      beq.s      $0003358C
[00033538] 2f2b 0010                 move.l     16(a3),-(a7)
[0003353c] 486a 0016                 pea.l      22(a2)
[00033540] 224a                      movea.l    a2,a1
[00033542] 2053                      movea.l    (a3),a0
[00033544] 4eb9 0001 81c6            jsr        objname
[0003354a] 504f                      addq.w     #8,a7
[0003354c] 4eb9 0004 810e            jsr        Adr_unselect
[00033552] 224a                      movea.l    a2,a1
[00033554] 206b 0004                 movea.l    4(a3),a0
[00033558] 6100 fec6                 bsr        del_entry
[0003355c] 224a                      movea.l    a2,a1
[0003355e] 206b 0004                 movea.l    4(a3),a0
[00033562] 6100 fe50                 bsr        add_entry
[00033566] 202b 0026                 move.l     38(a3),d0
[0003356a] 670a                      beq.s      $00033576
[0003356c] 224a                      movea.l    a2,a1
[0003356e] 2053                      movea.l    (a3),a0
[00033570] 2840                      movea.l    d0,a4
[00033572] 7002                      moveq.l    #2,d0
[00033574] 4e94                      jsr        (a4)
[00033576] 266a 0012                 movea.l    18(a2),a3
[0003357a] 200b                      move.l     a3,d0
[0003357c] 670e                      beq.s      $0003358C
[0003357e] 93c9                      suba.l     a1,a1
[00033580] 303c 2710                 move.w     #$2710,d0
[00033584] 204b                      movea.l    a3,a0
[00033586] 246b 0004                 movea.l    4(a3),a2
[0003358a] 4e92                      jsr        (a2)
[0003358c] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00033590] 4e75                      rts
li_setfree:
[00033592] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00033596] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003359c] 2468 0258                 movea.l    600(a0),a2
[000335a0] 2652                      movea.l    (a2),a3
[000335a2] 4268 0248                 clr.w      584(a0)
[000335a6] 604e                      bra.s      $000335F6
[000335a8] 3203                      move.w     d3,d1
[000335aa] 48c1                      ext.l      d1
[000335ac] 2001                      move.l     d1,d0
[000335ae] d080                      add.l      d0,d0
[000335b0] d081                      add.l      d1,d0
[000335b2] e788                      lsl.l      #3,d0
[000335b4] 286a 0014                 movea.l    20(a2),a4
[000335b8] 49f4 0818                 lea.l      24(a4,d0.l),a4
[000335bc] 206a 0014                 movea.l    20(a2),a0
[000335c0] 0270 ffef 080a            andi.w     #$FFEF,10(a0,d0.l)
[000335c6] 206c 000c                 movea.l    12(a4),a0
[000335ca] 3428 0038                 move.w     56(a0),d2
[000335ce] c47c 0100                 and.w      #$0100,d2
[000335d2] 6618                      bne.s      $000335EC
[000335d4] 2253                      movea.l    (a3),a1
[000335d6] 0069 0001 0006            ori.w      #$0001,6(a1)
[000335dc] 5268 0036                 addq.w     #1,54(a0)
[000335e0] 0068 0100 0038            ori.w      #$0100,56(a0)
[000335e6] 006a 0020 0056            ori.w      #$0020,86(a2)
[000335ec] 3003                      move.w     d3,d0
[000335ee] 204a                      movea.l    a2,a0
[000335f0] 4eb9 0004 7f76            jsr        Adr_del
[000335f6] 4eb9 0004 7e2a            jsr        Adr_next
[000335fc] 3600                      move.w     d0,d3
[000335fe] 6ea8                      bgt.s      $000335A8
[00033600] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00033604] 4e75                      rts
li_open:
[00033606] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003360c] 2068 0258                 movea.l    600(a0),a0
[00033610] 4eb9 0003 3618            jsr        li_wopen
[00033616] 4e75                      rts
li_wopen:
[00033618] 3f03                      move.w     d3,-(a7)
[0003361a] 2f0a                      move.l     a2,-(a7)
[0003361c] 2448                      movea.l    a0,a2
[0003361e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00033624] 4269 0248                 clr.w      584(a1)
[00033628] 6018                      bra.s      $00033642
[0003362a] 3003                      move.w     d3,d0
[0003362c] 204a                      movea.l    a2,a0
[0003362e] 4eb9 0003 3b90            jsr        open_wi
[00033634] 4a40                      tst.w      d0
[00033636] 6714                      beq.s      $0003364C
[00033638] 3003                      move.w     d3,d0
[0003363a] 204a                      movea.l    a2,a0
[0003363c] 4eb9 0004 7f76            jsr        Adr_del
[00033642] 4eb9 0004 7e2a            jsr        Adr_next
[00033648] 3600                      move.w     d0,d3
[0003364a] 6ede                      bgt.s      $0003362A
[0003364c] 245f                      movea.l    (a7)+,a2
[0003364e] 361f                      move.w     (a7)+,d3
[00033650] 4e75                      rts
li_info:
[00033652] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033658] 2068 0258                 movea.l    600(a0),a0
[0003365c] 4eb9 0003 3664            jsr        li_winfo
[00033662] 4e75                      rts
li_winfo:
[00033664] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00033668] 4fef ffde                 lea.l      -34(a7),a7
[0003366c] 2f48 001e                 move.l     a0,30(a7)
[00033670] 2650                      movea.l    (a0),a3
[00033672] 2279 0010 ee4e            movea.l    ACSblk,a1
[00033678] 3029 0246                 move.w     582(a1),d0
[0003367c] 6706                      beq.s      $00033684
[0003367e] b1e9 0240                 cmpa.l     576(a1),a0
[00033682] 677c                      beq.s      $00033700
[00033684] 41f9 000c db52            lea.l      WI_INFO_LISTSELF,a0
[0003368a] 2279 000c db5a            movea.l    $000CDB5A,a1
[00033690] 4e91                      jsr        (a1)
[00033692] 2848                      movea.l    a0,a4
[00033694] 200c                      move.l     a4,d0
[00033696] 6700 0152                 beq        $000337EA
[0003369a] 2253                      movea.l    (a3),a1
[0003369c] 2269 0008                 movea.l    8(a1),a1
[000336a0] 206c 0014                 movea.l    20(a4),a0
[000336a4] 7007                      moveq.l    #7,d0
[000336a6] 4eb9 0005 0fd8            jsr        Aob_puttext
[000336ac] 226b 0004                 movea.l    4(a3),a1
[000336b0] 43e9 0016                 lea.l      22(a1),a1
[000336b4] 7006                      moveq.l    #6,d0
[000336b6] 206c 0014                 movea.l    20(a4),a0
[000336ba] 4eb9 0005 0fd8            jsr        Aob_puttext
[000336c0] 206b 0004                 movea.l    4(a3),a0
[000336c4] 2028 000e                 move.l     14(a0),d0
[000336c8] e488                      lsr.l      #2,d0
[000336ca] 2f00                      move.l     d0,-(a7)
[000336cc] 43f9 000c ddb8            lea.l      $000CDDB8,a1
[000336d2] 41ef 0004                 lea.l      4(a7),a0
[000336d6] 4eb9 0008 15ac            jsr        sprintf
[000336dc] 584f                      addq.w     #4,a7
[000336de] 43d7                      lea.l      (a7),a1
[000336e0] 7005                      moveq.l    #5,d0
[000336e2] 206c 0014                 movea.l    20(a4),a0
[000336e6] 4eb9 0005 0fd8            jsr        Aob_puttext
[000336ec] 204c                      movea.l    a4,a0
[000336ee] 4eb9 0005 9df4            jsr        Awi_dialog
[000336f4] 204c                      movea.l    a4,a0
[000336f6] 4eb9 0005 85f2            jsr        Awi_delete
[000336fc] 6000 00ec                 bra        $000337EA
[00033700] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033706] 4268 0248                 clr.w      584(a0)
[0003370a] 6000 00d2                 bra        $000337DE
[0003370e] 3203                      move.w     d3,d1
[00033710] 48c1                      ext.l      d1
[00033712] 2001                      move.l     d1,d0
[00033714] d080                      add.l      d0,d0
[00033716] d081                      add.l      d1,d0
[00033718] e788                      lsl.l      #3,d0
[0003371a] 206f 001e                 movea.l    30(a7),a0
[0003371e] 2268 0014                 movea.l    20(a0),a1
[00033722] 41f1 0818                 lea.l      24(a1,d0.l),a0
[00033726] 2f48 001a                 move.l     a0,26(a7)
[0003372a] 2468 000c                 movea.l    12(a0),a2
[0003372e] 41f9 000c dab0            lea.l      WI_INFO_LIST,a0
[00033734] 2279 000c dab8            movea.l    $000CDAB8,a1
[0003373a] 4e91                      jsr        (a1)
[0003373c] 2848                      movea.l    a0,a4
[0003373e] 200c                      move.l     a4,d0
[00033740] 6700 009c                 beq        $000337DE
[00033744] 2253                      movea.l    (a3),a1
[00033746] 2269 0008                 movea.l    8(a1),a1
[0003374a] 206c 0014                 movea.l    20(a4),a0
[0003374e] 7008                      moveq.l    #8,d0
[00033750] 4eb9 0005 0fd8            jsr        Aob_puttext
[00033756] 226b 0004                 movea.l    4(a3),a1
[0003375a] 43e9 0016                 lea.l      22(a1),a1
[0003375e] 7009                      moveq.l    #9,d0
[00033760] 206c 0014                 movea.l    20(a4),a0
[00033764] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003376a] 43ea 0016                 lea.l      22(a2),a1
[0003376e] 700a                      moveq.l    #10,d0
[00033770] 206c 0014                 movea.l    20(a4),a0
[00033774] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003377a] 2f2a 000e                 move.l     14(a2),-(a7)
[0003377e] 43f9 000c ddb8            lea.l      $000CDDB8,a1
[00033784] 41ef 0004                 lea.l      4(a7),a0
[00033788] 4eb9 0008 15ac            jsr        sprintf
[0003378e] 584f                      addq.w     #4,a7
[00033790] 43d7                      lea.l      (a7),a1
[00033792] 700b                      moveq.l    #11,d0
[00033794] 206c 0014                 movea.l    20(a4),a0
[00033798] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003379e] 3f2a 0036                 move.w     54(a2),-(a7)
[000337a2] 43f9 000c ddbc            lea.l      $000CDDBC,a1
[000337a8] 41ef 0002                 lea.l      2(a7),a0
[000337ac] 4eb9 0008 15ac            jsr        sprintf
[000337b2] 544f                      addq.w     #2,a7
[000337b4] 43d7                      lea.l      (a7),a1
[000337b6] 700d                      moveq.l    #13,d0
[000337b8] 206c 0014                 movea.l    20(a4),a0
[000337bc] 4eb9 0005 0fd8            jsr        Aob_puttext
[000337c2] 204c                      movea.l    a4,a0
[000337c4] 4eb9 0005 9df4            jsr        Awi_dialog
[000337ca] 204c                      movea.l    a4,a0
[000337cc] 4eb9 0005 85f2            jsr        Awi_delete
[000337d2] 3003                      move.w     d3,d0
[000337d4] 206f 001e                 movea.l    30(a7),a0
[000337d8] 4eb9 0004 7f76            jsr        Adr_del
[000337de] 4eb9 0004 7e2a            jsr        Adr_next
[000337e4] 3600                      move.w     d0,d3
[000337e6] 6e00 ff26                 bgt        $0003370E
[000337ea] 4fef 0022                 lea.l      34(a7),a7
[000337ee] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[000337f2] 4e75                      rts
dragged:
[000337f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000337fa] 2068 0258                 movea.l    600(a0),a0
[000337fe] 4eb9 0003 38bc            jsr        drag
[00033804] 4e75                      rts
generate:
[00033806] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003380a] 594f                      subq.w     #4,a7
[0003380c] 2648                      movea.l    a0,a3
[0003380e] 2449                      movea.l    a1,a2
[00033810] 200a                      move.l     a2,d0
[00033812] 6768                      beq.s      $0003387C
[00033814] 286b 0004                 movea.l    4(a3),a4
[00033818] 3239 0008 3eae            move.w     runasdemo,d1
[0003381e] 6712                      beq.s      $00033832
[00033820] 242c 000e                 move.l     14(a4),d2
[00033824] e48a                      lsr.l      #2,d2
[00033826] 5542                      subq.w     #2,d2
[00033828] 6d08                      blt.s      $00033832
[0003382a] 4eb9 0001 14a0            jsr        acs_register
[00033830] 604a                      bra.s      $0003387C
[00033832] 224a                      movea.l    a2,a1
[00033834] 2053                      movea.l    (a3),a0
[00033836] 2a6b 001a                 movea.l    26(a3),a5
[0003383a] 4e95                      jsr        (a5)
[0003383c] 2a48                      movea.l    a0,a5
[0003383e] 200d                      move.l     a5,d0
[00033840] 6770                      beq.s      $000338B2
[00033842] 43ea 0016                 lea.l      22(a2),a1
[00033846] 41ed 0016                 lea.l      22(a5),a0
[0003384a] 4eb9 0008 2f0c            jsr        strcpy
[00033850] 4857                      pea.l      (a7)
[00033852] 224d                      movea.l    a5,a1
[00033854] 2053                      movea.l    (a3),a0
[00033856] 4eb9 0001 80f2            jsr        uniquename
[0003385c] 584f                      addq.w     #4,a7
[0003385e] 2f2b 0010                 move.l     16(a3),-(a7)
[00033862] 224d                      movea.l    a5,a1
[00033864] 2053                      movea.l    (a3),a0
[00033866] 4eb9 0001 6252            jsr        new2label
[0003386c] 584f                      addq.w     #4,a7
[0003386e] 4a40                      tst.w      d0
[00033870] 660e                      bne.s      $00033880
[00033872] 224d                      movea.l    a5,a1
[00033874] 2053                      movea.l    (a3),a0
[00033876] 246b 001e                 movea.l    30(a3),a2
[0003387a] 4e92                      jsr        (a2)
[0003387c] 91c8                      suba.l     a0,a0
[0003387e] 6034                      bra.s      $000338B4
[00033880] 2f2b 0010                 move.l     16(a3),-(a7)
[00033884] 486d 0016                 pea.l      22(a5)
[00033888] 224d                      movea.l    a5,a1
[0003388a] 2053                      movea.l    (a3),a0
[0003388c] 4eb9 0001 81c6            jsr        objname
[00033892] 504f                      addq.w     #8,a7
[00033894] 224d                      movea.l    a5,a1
[00033896] 204c                      movea.l    a4,a0
[00033898] 6100 fb1a                 bsr        add_entry
[0003389c] 202b 0026                 move.l     38(a3),d0
[000338a0] 670a                      beq.s      $000338AC
[000338a2] 224d                      movea.l    a5,a1
[000338a4] 2053                      movea.l    (a3),a0
[000338a6] 2440                      movea.l    d0,a2
[000338a8] 7001                      moveq.l    #1,d0
[000338aa] 4e92                      jsr        (a2)
[000338ac] 006d 0100 0038            ori.w      #$0100,56(a5)
[000338b2] 204d                      movea.l    a5,a0
[000338b4] 584f                      addq.w     #4,a7
[000338b6] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000338ba] 4e75                      rts
drag:
[000338bc] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[000338c0] 594f                      subq.w     #4,a7
[000338c2] 2e88                      move.l     a0,(a7)
[000338c4] 2650                      movea.l    (a0),a3
[000338c6] 41f9 0010 ee4e            lea.l      ACSblk,a0
[000338cc] 2250                      movea.l    (a0),a1
[000338ce] 2869 0240                 movea.l    576(a1),a4
[000338d2] 4269 0248                 clr.w      584(a1)
[000338d6] 2250                      movea.l    (a0),a1
[000338d8] 3629 0246                 move.w     582(a1),d3
[000338dc] 3003                      move.w     d3,d0
[000338de] 48c0                      ext.l      d0
[000338e0] e588                      lsl.l      #2,d0
[000338e2] 4eb9 0004 c608            jsr        Ax_malloc
[000338e8] 2a48                      movea.l    a0,a5
[000338ea] 244d                      movea.l    a5,a2
[000338ec] 200a                      move.l     a2,d0
[000338ee] 6700 0090                 beq        $00033980
[000338f2] 603a                      bra.s      $0003392E
[000338f4] 3004                      move.w     d4,d0
[000338f6] c07c 1000                 and.w      #$1000,d0
[000338fa] 671c                      beq.s      $00033918
[000338fc] 3404                      move.w     d4,d2
[000338fe] c47c 0fff                 and.w      #$0FFF,d2
[00033902] 48c2                      ext.l      d2
[00033904] 2202                      move.l     d2,d1
[00033906] d281                      add.l      d1,d1
[00033908] d282                      add.l      d2,d1
[0003390a] e789                      lsl.l      #3,d1
[0003390c] 206c 0018                 movea.l    24(a4),a0
[00033910] 43f0 1818                 lea.l      24(a0,d1.l),a1
[00033914] 24c9                      move.l     a1,(a2)+
[00033916] 6016                      bra.s      $0003392E
[00033918] 3204                      move.w     d4,d1
[0003391a] 48c1                      ext.l      d1
[0003391c] 2001                      move.l     d1,d0
[0003391e] d080                      add.l      d0,d0
[00033920] d081                      add.l      d1,d0
[00033922] e788                      lsl.l      #3,d0
[00033924] 206c 0014                 movea.l    20(a4),a0
[00033928] 43f0 0818                 lea.l      24(a0,d0.l),a1
[0003392c] 24c9                      move.l     a1,(a2)+
[0003392e] 4eb9 0004 7e2a            jsr        Adr_next
[00033934] 3800                      move.w     d0,d4
[00033936] 6ebc                      bgt.s      $000338F4
[00033938] 4eb9 0004 810e            jsr        Adr_unselect
[0003393e] 4244                      clr.w      d4
[00033940] 6032                      bra.s      $00033974
[00033942] 3004                      move.w     d4,d0
[00033944] 48c0                      ext.l      d0
[00033946] e588                      lsl.l      #2,d0
[00033948] 2475 0800                 movea.l    0(a5,d0.l),a2
[0003394c] 0c6a 0002 0016            cmpi.w     #$0002,22(a2)
[00033952] 660a                      bne.s      $0003395E
[00033954] 2057                      movea.l    (a7),a0
[00033956] 4eb9 0003 3988            jsr        li_newwi
[0003395c] 6014                      bra.s      $00033972
[0003395e] 302a 0016                 move.w     22(a2),d0
[00033962] b06b 0014                 cmp.w      20(a3),d0
[00033966] 660a                      bne.s      $00033972
[00033968] 226a 000c                 movea.l    12(a2),a1
[0003396c] 204b                      movea.l    a3,a0
[0003396e] 6100 fe96                 bsr        generate
[00033972] 5244                      addq.w     #1,d4
[00033974] b644                      cmp.w      d4,d3
[00033976] 6eca                      bgt.s      $00033942
[00033978] 204d                      movea.l    a5,a0
[0003397a] 4eb9 0004 c7c8            jsr        Ax_free
[00033980] 584f                      addq.w     #4,a7
[00033982] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00033986] 4e75                      rts
li_newwi:
[00033988] 2f0a                      move.l     a2,-(a7)
[0003398a] 2f0b                      move.l     a3,-(a7)
[0003398c] 514f                      subq.w     #8,a7
[0003398e] 2448                      movea.l    a0,a2
[00033990] 2650                      movea.l    (a0),a3
[00033992] 226b 0016                 movea.l    22(a3),a1
[00033996] 204b                      movea.l    a3,a0
[00033998] 6100 fe6c                 bsr        generate
[0003399c] 2f48 0004                 move.l     a0,4(a7)
[000339a0] 2008                      move.l     a0,d0
[000339a2] 671a                      beq.s      $000339BE
[000339a4] 006a 0004 0054            ori.w      #$0004,84(a2)
[000339aa] 2e93                      move.l     (a3),(a7)
[000339ac] 41d7                      lea.l      (a7),a0
[000339ae] 226b 0008                 movea.l    8(a3),a1
[000339b2] 2269 0008                 movea.l    8(a1),a1
[000339b6] 4e91                      jsr        (a1)
[000339b8] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[000339be] 504f                      addq.w     #8,a7
[000339c0] 265f                      movea.l    (a7)+,a3
[000339c2] 245f                      movea.l    (a7)+,a2
[000339c4] 4e75                      rts
li_new:
[000339c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000339cc] 2068 0258                 movea.l    600(a0),a0
[000339d0] 6100 ffb6                 bsr.w      li_newwi
[000339d4] 4e75                      rts
li_init:
[000339d6] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[000339da] 2448                      movea.l    a0,a2
[000339dc] 2279 0010 ee4e            movea.l    ACSblk,a1
[000339e2] b1e9 0240                 cmpa.l     576(a1),a0
[000339e6] 6606                      bne.s      $000339EE
[000339e8] 4eb9 0004 810e            jsr        Adr_unselect
[000339ee] 2652                      movea.l    (a2),a3
[000339f0] 2a6b 0004                 movea.l    4(a3),a5
[000339f4] 4243                      clr.w      d3
[000339f6] 3803                      move.w     d3,d4
[000339f8] 286a 0014                 movea.l    20(a2),a4
[000339fc] 200c                      move.l     a4,d0
[000339fe] 6710                      beq.s      $00033A10
[00033a00] 382c 0010                 move.w     16(a4),d4
[00033a04] 362c 0012                 move.w     18(a4),d3
[00033a08] 204c                      movea.l    a4,a0
[00033a0a] 4eb9 0004 c7c8            jsr        Ax_free
[00033a10] 204d                      movea.l    a5,a0
[00033a12] 226b 0022                 movea.l    34(a3),a1
[00033a16] 4e91                      jsr        (a1)
[00033a18] 2848                      movea.l    a0,a4
[00033a1a] 200c                      move.l     a4,d0
[00033a1c] 6616                      bne.s      $00033A34
[00033a1e] 41f9 000c d9f6            lea.l      LIST_NOT,a0
[00033a24] 4eb9 0004 f064            jsr        Aob_create
[00033a2a] 2848                      movea.l    a0,a4
[00033a2c] 2548 0014                 move.l     a0,20(a2)
[00033a30] 70ff                      moveq.l    #-1,d0
[00033a32] 6044                      bra.s      $00033A78
[00033a34] 4bec 0018                 lea.l      24(a4),a5
[00033a38] 2b7c 0003 37f4 0004       move.l     #dragged,4(a5)
[00033a40] 3a2c 0002                 move.w     2(a4),d5
[00033a44] 601a                      bra.s      $00033A60
[00033a46] 3205                      move.w     d5,d1
[00033a48] 48c1                      ext.l      d1
[00033a4a] 2001                      move.l     d1,d0
[00033a4c] d080                      add.l      d0,d0
[00033a4e] d081                      add.l      d1,d0
[00033a50] e788                      lsl.l      #3,d0
[00033a52] 4bf4 0818                 lea.l      24(a4,d0.l),a5
[00033a56] 2abc 0003 3b7a            move.l     #open_it,(a5)
[00033a5c] 3a34 0800                 move.w     0(a4,d0.l),d5
[00033a60] 4a45                      tst.w      d5
[00033a62] 6ee2                      bgt.s      $00033A46
[00033a64] 254c 0014                 move.l     a4,20(a2)
[00033a68] 3944 0010                 move.w     d4,16(a4)
[00033a6c] 3943 0012                 move.w     d3,18(a4)
[00033a70] 006a 0010 0056            ori.w      #$0010,86(a2)
[00033a76] 4240                      clr.w      d0
[00033a78] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[00033a7c] 4e75                      rts
li_make:
[00033a7e] 48e7 003c                 movem.l    a2-a5,-(a7)
[00033a82] 4fef ffb6                 lea.l      -74(a7),a7
[00033a86] 2a48                      movea.l    a0,a5
[00033a88] 2448                      movea.l    a0,a2
[00033a8a] 266a 0004                 movea.l    4(a2),a3
[00033a8e] 286b 0012                 movea.l    18(a3),a4
[00033a92] 200c                      move.l     a4,d0
[00033a94] 670c                      beq.s      $00033AA2
[00033a96] 204c                      movea.l    a4,a0
[00033a98] 4eb9 0005 6bea            jsr        Awi_show
[00033a9e] 6000 00ce                 bra        $00033B6E
[00033aa2] 702a                      moveq.l    #42,d0
[00033aa4] 4eb9 0004 c608            jsr        Ax_malloc
[00033aaa] 2448                      movea.l    a0,a2
[00033aac] 200a                      move.l     a2,d0
[00033aae] 6700 00ba                 beq        $00033B6A
[00033ab2] 702a                      moveq.l    #42,d0
[00033ab4] 224d                      movea.l    a5,a1
[00033ab6] 4eb9 0008 3500            jsr        memcpy
[00033abc] 4bf9 000c dc96            lea.l      WI_LIST,a5
[00033ac2] 2b6a 000c 004a            move.l     12(a2),74(a5)
[00033ac8] 1f7c 0020 0004            move.b     #$20,4(a7)
[00033ace] 2052                      movea.l    (a2),a0
[00033ad0] 2268 0008                 movea.l    8(a0),a1
[00033ad4] 41ef 0005                 lea.l      5(a7),a0
[00033ad8] 4eb9 0008 2f0c            jsr        strcpy
[00033ade] 41ef 0004                 lea.l      4(a7),a0
[00033ae2] 2b48 004e                 move.l     a0,78(a5)
[00033ae6] 226a 0008                 movea.l    8(a2),a1
[00033aea] 2b69 005a 005a            move.l     90(a1),90(a5)
[00033af0] 705c                      moveq.l    #92,d0
[00033af2] 2052                      movea.l    (a2),a0
[00033af4] 2068 0008                 movea.l    8(a0),a0
[00033af8] 4eb9 0008 2e9e            jsr        strrchr
[00033afe] 2e88                      move.l     a0,(a7)
[00033b00] 6608                      bne.s      $00033B0A
[00033b02] 2252                      movea.l    (a2),a1
[00033b04] 2ea9 0008                 move.l     8(a1),(a7)
[00033b08] 6002                      bra.s      $00033B0C
[00033b0a] 5297                      addq.l     #1,(a7)
[00033b0c] 206d 005a                 movea.l    90(a5),a0
[00033b10] 2157 0008                 move.l     (a7),8(a0)
[00033b14] 204d                      movea.l    a5,a0
[00033b16] 4eb9 0005 7052            jsr        Awi_create
[00033b1c] 2848                      movea.l    a0,a4
[00033b1e] 200c                      move.l     a4,d0
[00033b20] 660a                      bne.s      $00033B2C
[00033b22] 204a                      movea.l    a2,a0
[00033b24] 4eb9 0004 c7c8            jsr        Ax_free
[00033b2a] 603e                      bra.s      $00033B6A
[00033b2c] 2052                      movea.l    (a2),a0
[00033b2e] 4868 0168                 pea.l      360(a0)
[00033b32] 43eb 003a                 lea.l      58(a3),a1
[00033b36] 204c                      movea.l    a4,a0
[00033b38] 4eb9 0001 6372            jsr        wi_pos
[00033b3e] 584f                      addq.w     #4,a7
[00033b40] 288a                      move.l     a2,(a4)
[00033b42] 274c 0012                 move.l     a4,18(a3)
[00033b46] 202a 0016                 move.l     22(a2),d0
[00033b4a] 660a                      bne.s      $00033B56
[00033b4c] 206c 005e                 movea.l    94(a4),a0
[00033b50] 0068 0008 018a            ori.w      #$0008,394(a0)
[00033b56] 204c                      movea.l    a4,a0
[00033b58] 226c 000c                 movea.l    12(a4),a1
[00033b5c] 4e91                      jsr        (a1)
[00033b5e] 4a40                      tst.w      d0
[00033b60] 670c                      beq.s      $00033B6E
[00033b62] 204c                      movea.l    a4,a0
[00033b64] 4eb9 0003 3d6e            jsr        term
[00033b6a] 91c8                      suba.l     a0,a0
[00033b6c] 6002                      bra.s      $00033B70
[00033b6e] 204c                      movea.l    a4,a0
[00033b70] 4fef 004a                 lea.l      74(a7),a7
[00033b74] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00033b78] 4e75                      rts
open_it:
[00033b7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033b80] 3028 0260                 move.w     608(a0),d0
[00033b84] 2068 0258                 movea.l    600(a0),a0
[00033b88] 4eb9 0003 3b90            jsr        open_wi
[00033b8e] 4e75                      rts
open_wi:
[00033b90] 2f0a                      move.l     a2,-(a7)
[00033b92] 2f0b                      move.l     a3,-(a7)
[00033b94] 514f                      subq.w     #8,a7
[00033b96] 2448                      movea.l    a0,a2
[00033b98] 2650                      movea.l    (a0),a3
[00033b9a] 006a 0004 0054            ori.w      #$0004,84(a2)
[00033ba0] 2e93                      move.l     (a3),(a7)
[00033ba2] 226b 0004                 movea.l    4(a3),a1
[00033ba6] 2069 0004                 movea.l    4(a1),a0
[00033baa] 72fe                      moveq.l    #-2,d1
[00033bac] d240                      add.w      d0,d1
[00033bae] e241                      asr.w      #1,d1
[00033bb0] 48c1                      ext.l      d1
[00033bb2] e589                      lsl.l      #2,d1
[00033bb4] 2f70 1800 0004            move.l     0(a0,d1.l),4(a7)
[00033bba] 41d7                      lea.l      (a7),a0
[00033bbc] 226b 0008                 movea.l    8(a3),a1
[00033bc0] 2269 0008                 movea.l    8(a1),a1
[00033bc4] 4e91                      jsr        (a1)
[00033bc6] 2008                      move.l     a0,d0
[00033bc8] 6704                      beq.s      $00033BCE
[00033bca] 7001                      moveq.l    #1,d0
[00033bcc] 6002                      bra.s      $00033BD0
[00033bce] 4240                      clr.w      d0
[00033bd0] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[00033bd6] 504f                      addq.w     #8,a7
[00033bd8] 265f                      movea.l    (a7)+,a3
[00033bda] 245f                      movea.l    (a7)+,a2
[00033bdc] 4e75                      rts
li_service:
[00033bde] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00033be2] 2448                      movea.l    a0,a2
[00033be4] 3800                      move.w     d0,d4
[00033be6] 2a49                      movea.l    a1,a5
[00033be8] 7602                      moveq.l    #2,d3
[00033bea] b07c 000b                 cmp.w      #$000B,d0
[00033bee] 6700 00f8                 beq        $00033CE8
[00033bf2] 6e14                      bgt.s      $00033C08
[00033bf4] 5540                      subq.w     #2,d0
[00033bf6] 6726                      beq.s      $00033C1E
[00033bf8] 5740                      subq.w     #3,d0
[00033bfa] 674c                      beq.s      $00033C48
[00033bfc] 5340                      subq.w     #1,d0
[00033bfe] 6748                      beq.s      $00033C48
[00033c00] 5940                      subq.w     #4,d0
[00033c02] 6730                      beq.s      $00033C34
[00033c04] 6000 0152                 bra        $00033D58
[00033c08] 907c 000f                 sub.w      #$000F,d0
[00033c0c] 6730                      beq.s      $00033C3E
[00033c0e] 5340                      subq.w     #1,d0
[00033c10] 6718                      beq.s      $00033C2A
[00033c12] 907c 03dd                 sub.w      #$03DD,d0
[00033c16] 6700 00da                 beq        $00033CF2
[00033c1a] 6000 013c                 bra        $00033D58
[00033c1e] 204a                      movea.l    a2,a0
[00033c20] 4eb9 0003 3d6e            jsr        term
[00033c26] 6000 013e                 bra        $00033D66
[00033c2a] 204a                      movea.l    a2,a0
[00033c2c] 6100 fc8e                 bsr        drag
[00033c30] 6000 0134                 bra        $00033D66
[00033c34] 204a                      movea.l    a2,a0
[00033c36] 6100 f9e0                 bsr        li_wopen
[00033c3a] 6000 012a                 bra        $00033D66
[00033c3e] 204a                      movea.l    a2,a0
[00033c40] 6100 fa22                 bsr        li_winfo
[00033c44] 6000 0120                 bra        $00033D66
[00033c48] 206a 005e                 movea.l    94(a2),a0
[00033c4c] 0068 0008 027a            ori.w      #$0008,634(a0)
[00033c52] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033c58] 0c68 0001 0246            cmpi.w     #$0001,582(a0)
[00033c5e] 6642                      bne.s      $00033CA2
[00033c60] 226a 005e                 movea.l    94(a2),a1
[00033c64] 0269 fff7 024a            andi.w     #$FFF7,586(a1)
[00033c6a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033c70] 2268 0254                 movea.l    596(a0),a1
[00033c74] 3211                      move.w     (a1),d1
[00033c76] 48c1                      ext.l      d1
[00033c78] 2001                      move.l     d1,d0
[00033c7a] d080                      add.l      d0,d0
[00033c7c] d081                      add.l      d1,d0
[00033c7e] e788                      lsl.l      #3,d0
[00033c80] 266a 0014                 movea.l    20(a2),a3
[00033c84] 47f3 0818                 lea.l      24(a3,d0.l),a3
[00033c88] 286b 000c                 movea.l    12(a3),a4
[00033c8c] 342c 0038                 move.w     56(a4),d2
[00033c90] c47c 0100                 and.w      #$0100,d2
[00033c94] 6716                      beq.s      $00033CAC
[00033c96] 206a 005e                 movea.l    94(a2),a0
[00033c9a] 0268 fff7 027a            andi.w     #$FFF7,634(a0)
[00033ca0] 600a                      bra.s      $00033CAC
[00033ca2] 206a 005e                 movea.l    94(a2),a0
[00033ca6] 0068 0008 024a            ori.w      #$0008,586(a0)
[00033cac] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033cb2] 3028 0246                 move.w     582(a0),d0
[00033cb6] 6f18                      ble.s      $00033CD0
[00033cb8] 226a 005e                 movea.l    94(a2),a1
[00033cbc] 0269 fff7 01ba            andi.w     #$FFF7,442(a1)
[00033cc2] 206a 005e                 movea.l    94(a2),a0
[00033cc6] 0268 fff7 021a            andi.w     #$FFF7,538(a0)
[00033ccc] 6000 0098                 bra        $00033D66
[00033cd0] 206a 005e                 movea.l    94(a2),a0
[00033cd4] 0068 0008 01ba            ori.w      #$0008,442(a0)
[00033cda] 206a 005e                 movea.l    94(a2),a0
[00033cde] 0068 0008 021a            ori.w      #$0008,538(a0)
[00033ce4] 6000 0080                 bra        $00033D66
[00033ce8] 204a                      movea.l    a2,a0
[00033cea] 6100 f790                 bsr        delete
[00033cee] 6000 0076                 bra.w      $00033D66
[00033cf2] 2052                      movea.l    (a2),a0
[00033cf4] 0c68 271c 0014            cmpi.w     #$271C,20(a0)
[00033cfa] 666a                      bne.s      $00033D66
[00033cfc] 604e                      bra.s      $00033D4C
[00033cfe] 7020                      moveq.l    #32,d0
[00033d00] 3403                      move.w     d3,d2
[00033d02] 48c2                      ext.l      d2
[00033d04] 2202                      move.l     d2,d1
[00033d06] d281                      add.l      d1,d1
[00033d08] d282                      add.l      d2,d1
[00033d0a] e789                      lsl.l      #3,d1
[00033d0c] 206a 0014                 movea.l    20(a2),a0
[00033d10] c070 1808                 and.w      8(a0,d1.l),d0
[00033d14] 6650                      bne.s      $00033D66
[00033d16] 3030 1820                 move.w     32(a0,d1.l),d0
[00033d1a] c07c 8000                 and.w      #$8000,d0
[00033d1e] 672a                      beq.s      $00033D4A
[00033d20] 2648                      movea.l    a0,a3
[00033d22] 47f3 1818                 lea.l      24(a3,d1.l),a3
[00033d26] 286b 000c                 movea.l    12(a3),a4
[00033d2a] 240c                      move.l     a4,d2
[00033d2c] 671c                      beq.s      $00033D4A
[00033d2e] 202c 0004                 move.l     4(a4),d0
[00033d32] 6716                      beq.s      $00033D4A
[00033d34] 224d                      movea.l    a5,a1
[00033d36] 2040                      movea.l    d0,a0
[00033d38] 4eb9 0008 3008            jsr        strstr
[00033d3e] 2008                      move.l     a0,d0
[00033d40] 6708                      beq.s      $00033D4A
[00033d42] 3003                      move.w     d3,d0
[00033d44] 204a                      movea.l    a2,a0
[00033d46] 6100 fe48                 bsr        open_wi
[00033d4a] 5443                      addq.w     #2,d3
[00033d4c] 206a 0014                 movea.l    20(a2),a0
[00033d50] b668 0004                 cmp.w      4(a0),d3
[00033d54] 6da8                      blt.s      $00033CFE
[00033d56] 600e                      bra.s      $00033D66
[00033d58] 224d                      movea.l    a5,a1
[00033d5a] 3004                      move.w     d4,d0
[00033d5c] 204a                      movea.l    a2,a0
[00033d5e] 4eb9 0005 9dd0            jsr        Awi_service
[00033d64] 6002                      bra.s      $00033D68
[00033d66] 7001                      moveq.l    #1,d0
[00033d68] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00033d6c] 4e75                      rts
term:
[00033d6e] 2f0a                      move.l     a2,-(a7)
[00033d70] 2f0b                      move.l     a3,-(a7)
[00033d72] 2448                      movea.l    a0,a2
[00033d74] 2650                      movea.l    (a0),a3
[00033d76] 226b 0004                 movea.l    4(a3),a1
[00033d7a] 42a9 0012                 clr.l      18(a1)
[00033d7e] 302a 0056                 move.w     86(a2),d0
[00033d82] c07c 0800                 and.w      #$0800,d0
[00033d86] 6716                      beq.s      $00033D9E
[00033d88] 43ea 002c                 lea.l      44(a2),a1
[00033d8c] 206b 0004                 movea.l    4(a3),a0
[00033d90] 41e8 003a                 lea.l      58(a0),a0
[00033d94] 7008                      moveq.l    #8,d0
[00033d96] 4eb9 0008 3500            jsr        memcpy
[00033d9c] 6014                      bra.s      $00033DB2
[00033d9e] 7008                      moveq.l    #8,d0
[00033da0] 43ea 0024                 lea.l      36(a2),a1
[00033da4] 206b 0004                 movea.l    4(a3),a0
[00033da8] 41e8 003a                 lea.l      58(a0),a0
[00033dac] 4eb9 0008 3500            jsr        memcpy
[00033db2] 204b                      movea.l    a3,a0
[00033db4] 4eb9 0004 c7c8            jsr        Ax_free
[00033dba] 206a 0014                 movea.l    20(a2),a0
[00033dbe] 4eb9 0004 c7c8            jsr        Ax_free
[00033dc4] 42aa 0014                 clr.l      20(a2)
[00033dc8] 204a                      movea.l    a2,a0
[00033dca] 4eb9 0005 85f2            jsr        Awi_delete
[00033dd0] 265f                      movea.l    (a7)+,a3
[00033dd2] 245f                      movea.l    (a7)+,a2
[00033dd4] 4e75                      rts
work_icon:
[00033dd6] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00033dda] 594f                      subq.w     #4,a7
[00033ddc] 2e89                      move.l     a1,(a7)
[00033dde] 2468 0004                 movea.l    4(a0),a2
[00033de2] 33c0 000c ddb6            move.w     d0,$000CDDB6
[00033de8] 2628 000e                 move.l     14(a0),d3
[00033dec] e48b                      lsr.l      #2,d3
[00033dee] 7201                      moveq.l    #1,d1
[00033df0] d243                      add.w      d3,d1
[00033df2] 48c1                      ext.l      d1
[00033df4] 2001                      move.l     d1,d0
[00033df6] e588                      lsl.l      #2,d0
[00033df8] d081                      add.l      d1,d0
[00033dfa] e588                      lsl.l      #2,d0
[00033dfc] d081                      add.l      d1,d0
[00033dfe] d080                      add.l      d0,d0
[00033e00] d081                      add.l      d1,d0
[00033e02] d080                      add.l      d0,d0
[00033e04] 4eb9 0004 c608            jsr        Ax_malloc
[00033e0a] 2648                      movea.l    a0,a3
[00033e0c] 200b                      move.l     a3,d0
[00033e0e] 6606                      bne.s      $00033E16
[00033e10] 91c8                      suba.l     a0,a0
[00033e12] 6000 00b8                 bra        $00033ECC
[00033e16] 7030                      moveq.l    #48,d0
[00033e18] 43f9 000c dd58            lea.l      inner,a1
[00033e1e] 204b                      movea.l    a3,a0
[00033e20] 4eb9 0008 3500            jsr        memcpy
[00033e26] 284b                      movea.l    a3,a4
[00033e28] 4a43                      tst.w      d3
[00033e2a] 6f00 0098                 ble        $00033EC4
[00033e2e] 3203                      move.w     d3,d1
[00033e30] d241                      add.w      d1,d1
[00033e32] 48c1                      ext.l      d1
[00033e34] 2001                      move.l     d1,d0
[00033e36] d080                      add.l      d0,d0
[00033e38] d081                      add.l      d1,d0
[00033e3a] e788                      lsl.l      #3,d0
[00033e3c] 4bf3 0830                 lea.l      48(a3,d0.l),a5
[00033e40] 7801                      moveq.l    #1,d4
[00033e42] 606a                      bra.s      $00033EAE
[00033e44] 5244                      addq.w     #1,d4
[00033e46] 49ec 0030                 lea.l      48(a4),a4
[00033e4a] 7030                      moveq.l    #48,d0
[00033e4c] 43f9 000c dd88            lea.l      proto,a1
[00033e52] 204c                      movea.l    a4,a0
[00033e54] 4eb9 0008 3500            jsr        memcpy
[00033e5a] 7026                      moveq.l    #38,d0
[00033e5c] 2257                      movea.l    (a7),a1
[00033e5e] 204d                      movea.l    a5,a0
[00033e60] 4eb9 0008 3500            jsr        memcpy
[00033e66] 3004                      move.w     d4,d0
[00033e68] d040                      add.w      d0,d0
[00033e6a] 3880                      move.w     d0,(a4)
[00033e6c] 294d 000c                 move.l     a5,12(a4)
[00033e70] 3204                      move.w     d4,d1
[00033e72] 48c1                      ext.l      d1
[00033e74] e589                      lsl.l      #2,d1
[00033e76] 2072 18f8                 movea.l    -8(a2,d1.l),a0
[00033e7a] 2948 0024                 move.l     a0,36(a4)
[00033e7e] 3428 0038                 move.w     56(a0),d2
[00033e82] c47c 0100                 and.w      #$0100,d2
[00033e86] 6606                      bne.s      $00033E8E
[00033e88] 006c 0010 000a            ori.w      #$0010,10(a4)
[00033e8e] 204c                      movea.l    a4,a0
[00033e90] 4eb9 0004 fd76            jsr        Aob_icon
[00033e96] 3004                      move.w     d4,d0
[00033e98] 48c0                      ext.l      d0
[00033e9a] e588                      lsl.l      #2,d0
[00033e9c] 2072 08f8                 movea.l    -8(a2,d0.l),a0
[00033ea0] 41e8 0016                 lea.l      22(a0),a0
[00033ea4] 2b48 0008                 move.l     a0,8(a5)
[00033ea8] 4bed 0026                 lea.l      38(a5),a5
[00033eac] 5343                      subq.w     #1,d3
[00033eae] 4a43                      tst.w      d3
[00033eb0] 6e92                      bgt.s      $00033E44
[00033eb2] 377c 0002 0002            move.w     #$0002,2(a3)
[00033eb8] 70ff                      moveq.l    #-1,d0
[00033eba] d044                      add.w      d4,d0
[00033ebc] d040                      add.w      d0,d0
[00033ebe] 3740 0004                 move.w     d0,4(a3)
[00033ec2] 4254                      clr.w      (a4)
[00033ec4] 006c 0020 0020            ori.w      #$0020,32(a4)
[00033eca] 204b                      movea.l    a3,a0
[00033ecc] 584f                      addq.w     #4,a7
[00033ece] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00033ed2] 4e75                      rts
li_scope:
[00033ed4] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00033ed8] 594f                      subq.w     #4,a7
[00033eda] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033ee0] 2468 0258                 movea.l    600(a0),a2
[00033ee4] 2e92                      move.l     (a2),(a7)
[00033ee6] 4268 0248                 clr.w      584(a0)
[00033eea] 6000 00aa                 bra        $00033F96
[00033eee] 3203                      move.w     d3,d1
[00033ef0] 48c1                      ext.l      d1
[00033ef2] 2001                      move.l     d1,d0
[00033ef4] d080                      add.l      d0,d0
[00033ef6] d081                      add.l      d1,d0
[00033ef8] e788                      lsl.l      #3,d0
[00033efa] 206a 0014                 movea.l    20(a2),a0
[00033efe] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00033f02] 2868 000c                 movea.l    12(a0),a4
[00033f06] 41f9 000c dbf4            lea.l      WI_INFO_SCOPE,a0
[00033f0c] 2279 000c dbfc            movea.l    $000CDBFC,a1
[00033f12] 4e91                      jsr        (a1)
[00033f14] 2648                      movea.l    a0,a3
[00033f16] 200b                      move.l     a3,d0
[00033f18] 6700 007c                 beq.w      $00033F96
[00033f1c] 322c 0038                 move.w     56(a4),d1
[00033f20] c27c 0500                 and.w      #$0500,d1
[00033f24] b27c 0100                 cmp.w      #$0100,d1
[00033f28] 6616                      bne.s      $00033F40
[00033f2a] 226b 0014                 movea.l    20(a3),a1
[00033f2e] 0269 fffe 003a            andi.w     #$FFFE,58(a1)
[00033f34] 226b 0014                 movea.l    20(a3),a1
[00033f38] 0069 0001 006a            ori.w      #$0001,106(a1)
[00033f3e] 6014                      bra.s      $00033F54
[00033f40] 206b 0014                 movea.l    20(a3),a0
[00033f44] 0068 0001 003a            ori.w      #$0001,58(a0)
[00033f4a] 206b 0014                 movea.l    20(a3),a0
[00033f4e] 0268 fffe 006a            andi.w     #$FFFE,106(a0)
[00033f54] 204b                      movea.l    a3,a0
[00033f56] 4eb9 0005 9df4            jsr        Awi_dialog
[00033f5c] 5d40                      subq.w     #6,d0
[00033f5e] 6624                      bne.s      $00033F84
[00033f60] 7001                      moveq.l    #1,d0
[00033f62] 206b 0014                 movea.l    20(a3),a0
[00033f66] c068 006a                 and.w      106(a0),d0
[00033f6a] 6708                      beq.s      $00033F74
[00033f6c] 026c fbff 0038            andi.w     #$FBFF,56(a4)
[00033f72] 6006                      bra.s      $00033F7A
[00033f74] 006c 0400 0038            ori.w      #$0400,56(a4)
[00033f7a] 2057                      movea.l    (a7),a0
[00033f7c] 2250                      movea.l    (a0),a1
[00033f7e] 0069 0001 0006            ori.w      #$0001,6(a1)
[00033f84] 204b                      movea.l    a3,a0
[00033f86] 4eb9 0005 85f2            jsr        Awi_delete
[00033f8c] 3003                      move.w     d3,d0
[00033f8e] 204a                      movea.l    a2,a0
[00033f90] 4eb9 0004 7f76            jsr        Adr_del
[00033f96] 4eb9 0004 7e2a            jsr        Adr_next
[00033f9c] 3600                      move.w     d0,d3
[00033f9e] 6e00 ff4e                 bgt        $00033EEE
[00033fa2] 584f                      addq.w     #4,a7
[00033fa4] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00033fa8] 4e75                      rts
