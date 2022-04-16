find_entry:
[0003337c] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00033380] 2649                      movea.l    a1,a3
[00033382] 2628 000e                 move.l     14(a0),d3
[00033386] e48b                      lsr.l      #2,d3
[00033388] 2468 0004                 movea.l    4(a0),a2
[0003338c] 601a                      bra.s      find_entry_1
find_entry_4:
[0003338e] 2252                      movea.l    (a2),a1
[00033390] 43e9 0016                 lea.l      22(a1),a1
[00033394] 204b                      movea.l    a3,a0
[00033396] 4eb9 0008 2eba            jsr        strcmp
[0003339c] 4a40                      tst.w      d0
[0003339e] 6604                      bne.s      find_entry_2
[000333a0] 2052                      movea.l    (a2),a0
[000333a2] 600a                      bra.s      find_entry_3
find_entry_2:
[000333a4] 584a                      addq.w     #4,a2
[000333a6] 5343                      subq.w     #1,d3
find_entry_1:
[000333a8] 4a43                      tst.w      d3
[000333aa] 6ee2                      bgt.s      find_entry_4
[000333ac] 91c8                      suba.l     a0,a0
find_entry_3:
[000333ae] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000333b2] 4e75                      rts

add_entry:
[000333b4] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000333b8] 2448                      movea.l    a0,a2
[000333ba] 2849                      movea.l    a1,a4
[000333bc] 7004                      moveq.l    #4,d0
[000333be] 4eb9 0001 8028            jsr        objextent
[000333c4] 4a40                      tst.w      d0
[000333c6] 6704                      beq.s      add_entry_1
[000333c8] 70ff                      moveq.l    #-1,d0
[000333ca] 604e                      bra.s      add_entry_2
add_entry_1:
[000333cc] 262a 000e                 move.l     14(a2),d3
[000333d0] e48b                      lsr.l      #2,d3
[000333d2] 5343                      subq.w     #1,d3
[000333d4] 58aa 000e                 addq.l     #4,14(a2)
[000333d8] 266a 0004                 movea.l    4(a2),a3
[000333dc] 3003                      move.w     d3,d0
[000333de] 48c0                      ext.l      d0
[000333e0] e588                      lsl.l      #2,d0
[000333e2] d7c0                      adda.l     d0,a3
[000333e4] 6008                      bra.s      add_entry_3
add_entry_5:
[000333e6] 2753 0004                 move.l     (a3),4(a3)
[000333ea] 594b                      subq.w     #4,a3
[000333ec] 5343                      subq.w     #1,d3
add_entry_3:
[000333ee] 4a43                      tst.w      d3
[000333f0] 6b14                      bmi.s      add_entry_4
[000333f2] 2253                      movea.l    (a3),a1
[000333f4] 43e9 0016                 lea.l      22(a1),a1
[000333f8] 41ec 0016                 lea.l      22(a4),a0
[000333fc] 4eb9 0008 2eba            jsr        strcmp
[00033402] 4a40                      tst.w      d0
[00033404] 6be0                      bmi.s      add_entry_5
add_entry_4:
[00033406] 274c 0004                 move.l     a4,4(a3)
[0003340a] 202a 0012                 move.l     18(a2),d0
[0003340e] 6708                      beq.s      add_entry_6
[00033410] 2040                      movea.l    d0,a0
[00033412] 0068 0020 0056            ori.w      #$0020,86(a0)
add_entry_6:
[00033418] 4240                      clr.w      d0
add_entry_2:
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
[00033432] 6002                      bra.s      del_entry_1
del_entry_3:
[00033434] 5241                      addq.w     #1,d1
del_entry_1:
[00033436] b041                      cmp.w      d1,d0
[00033438] 6d0c                      blt.s      del_entry_2
[0003343a] 3401                      move.w     d1,d2
[0003343c] 48c2                      ext.l      d2
[0003343e] e58a                      lsl.l      #2,d2
[00033440] b3f2 2800                 cmpa.l     0(a2,d2.l),a1
[00033444] 66ee                      bne.s      del_entry_3
del_entry_2:
[00033446] b041                      cmp.w      d1,d0
[00033448] 6d2c                      blt.s      del_entry_4
[0003344a] 6014                      bra.s      del_entry_5
del_entry_6:
[0003344c] 3401                      move.w     d1,d2
[0003344e] 48c2                      ext.l      d2
[00033450] e58a                      lsl.l      #2,d2
[00033452] 3601                      move.w     d1,d3
[00033454] 48c3                      ext.l      d3
[00033456] e58b                      lsl.l      #2,d3
[00033458] 25b2 2804 3800            move.l     4(a2,d2.l),0(a2,d3.l)
[0003345e] 5241                      addq.w     #1,d1
del_entry_5:
[00033460] b041                      cmp.w      d1,d0
[00033462] 6ee8                      bgt.s      del_entry_6
[00033464] 59a8 000e                 subq.l     #4,14(a0)
[00033468] 2028 0012                 move.l     18(a0),d0
[0003346c] 6708                      beq.s      del_entry_4
[0003346e] 2240                      movea.l    d0,a1
[00033470] 0069 0020 0056            ori.w      #$0020,86(a1)
del_entry_4:
[00033476] 245f                      movea.l    (a7)+,a2
[00033478] 261f                      move.l     (a7)+,d3
[0003347a] 4e75                      rts

delete:
[0003347c] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00033480] 2448                      movea.l    a0,a2
[00033482] 2279 0010 ee4e            movea.l    ACSblk,a1
[00033488] b1e9 0240                 cmpa.l     576(a1),a0
[0003348c] 6654                      bne.s      delete_1
[0003348e] 2650                      movea.l    (a0),a3
[00033490] 4269 0248                 clr.w      584(a1)
[00033494] 6042                      bra.s      delete_2
delete_3:
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
[000334b6] 6720                      beq.s      delete_2
[000334b8] 204a                      movea.l    a2,a0
[000334ba] 3003                      move.w     d3,d0
[000334bc] 4eb9 0004 7f76            jsr        Adr_del
[000334c2] 026c feff 0038            andi.w     #$FEFF,56(a4)
[000334c8] 224c                      movea.l    a4,a1
[000334ca] 2053                      movea.l    (a3),a0
[000334cc] 2a6b 001e                 movea.l    30(a3),a5
[000334d0] 4e95                      jsr        (a5)
[000334d2] 006a 0020 0056            ori.w      #$0020,86(a2)
delete_2:
[000334d8] 4eb9 0004 7e2a            jsr        Adr_next
[000334de] 3600                      move.w     d0,d3
[000334e0] 6eb4                      bgt.s      delete_3
delete_1:
[000334e2] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000334e6] 4e75                      rts

li_changename:
[000334e8] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000334ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[000334f2] 4268 0248                 clr.w      584(a0)
[000334f6] 4eb9 0004 7e2a            jsr        Adr_next
[000334fc] 3600                      move.w     d0,d3
[000334fe] 6f00 008c                 ble        li_changename_1
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
[00033536] 6754                      beq.s      li_changename_1
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
[0003356a] 670a                      beq.s      li_changename_2
[0003356c] 224a                      movea.l    a2,a1
[0003356e] 2053                      movea.l    (a3),a0
[00033570] 2840                      movea.l    d0,a4
[00033572] 7002                      moveq.l    #2,d0
[00033574] 4e94                      jsr        (a4)
li_changename_2:
[00033576] 266a 0012                 movea.l    18(a2),a3
[0003357a] 200b                      move.l     a3,d0
[0003357c] 670e                      beq.s      li_changename_1
[0003357e] 93c9                      suba.l     a1,a1
[00033580] 303c 2710                 move.w     #$2710,d0
[00033584] 204b                      movea.l    a3,a0
[00033586] 246b 0004                 movea.l    4(a3),a2
[0003358a] 4e92                      jsr        (a2)
li_changename_1:
[0003358c] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00033590] 4e75                      rts

li_setfree:
[00033592] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00033596] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003359c] 2468 0258                 movea.l    600(a0),a2
[000335a0] 2652                      movea.l    (a2),a3
[000335a2] 4268 0248                 clr.w      584(a0)
[000335a6] 604e                      bra.s      li_setfree_1
li_setfree_3:
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
[000335d2] 6618                      bne.s      li_setfree_2
[000335d4] 2253                      movea.l    (a3),a1
[000335d6] 0069 0001 0006            ori.w      #$0001,6(a1)
[000335dc] 5268 0036                 addq.w     #1,54(a0)
[000335e0] 0068 0100 0038            ori.w      #$0100,56(a0)
[000335e6] 006a 0020 0056            ori.w      #$0020,86(a2)
li_setfree_2:
[000335ec] 3003                      move.w     d3,d0
[000335ee] 204a                      movea.l    a2,a0
[000335f0] 4eb9 0004 7f76            jsr        Adr_del
li_setfree_1:
[000335f6] 4eb9 0004 7e2a            jsr        Adr_next
[000335fc] 3600                      move.w     d0,d3
[000335fe] 6ea8                      bgt.s      li_setfree_3
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
[00033628] 6018                      bra.s      li_wopen_1
li_wopen_3:
[0003362a] 3003                      move.w     d3,d0
[0003362c] 204a                      movea.l    a2,a0
[0003362e] 4eb9 0003 3b90            jsr        open_wi
[00033634] 4a40                      tst.w      d0
[00033636] 6714                      beq.s      li_wopen_2
[00033638] 3003                      move.w     d3,d0
[0003363a] 204a                      movea.l    a2,a0
[0003363c] 4eb9 0004 7f76            jsr        Adr_del
li_wopen_1:
[00033642] 4eb9 0004 7e2a            jsr        Adr_next
[00033648] 3600                      move.w     d0,d3
[0003364a] 6ede                      bgt.s      li_wopen_3
li_wopen_2:
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
[0003367c] 6706                      beq.s      li_winfo_1
[0003367e] b1e9 0240                 cmpa.l     576(a1),a0
[00033682] 677c                      beq.s      li_winfo_2
li_winfo_1:
[00033684] 41f9 000c db52            lea.l      WI_INFO_LISTSELF,a0
[0003368a] 2279 000c db5a            movea.l    $000CDB5A,a1
[00033690] 4e91                      jsr        (a1)
[00033692] 2848                      movea.l    a0,a4
[00033694] 200c                      move.l     a4,d0
[00033696] 6700 0152                 beq        li_winfo_3
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
[000336fc] 6000 00ec                 bra        li_winfo_3
li_winfo_2:
[00033700] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033706] 4268 0248                 clr.w      584(a0)
[0003370a] 6000 00d2                 bra        li_winfo_4
li_winfo_5:
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
[00033740] 6700 009c                 beq        li_winfo_4
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
li_winfo_4:
[000337de] 4eb9 0004 7e2a            jsr        Adr_next
[000337e4] 3600                      move.w     d0,d3
[000337e6] 6e00 ff26                 bgt        li_winfo_5
li_winfo_3:
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
[00033812] 6768                      beq.s      generate_1
[00033814] 286b 0004                 movea.l    4(a3),a4
[00033818] 3239 0008 3eae            move.w     runasdemo,d1
[0003381e] 6712                      beq.s      generate_2
[00033820] 242c 000e                 move.l     14(a4),d2
[00033824] e48a                      lsr.l      #2,d2
[00033826] 5542                      subq.w     #2,d2
[00033828] 6d08                      blt.s      generate_2
[0003382a] 4eb9 0001 14a0            jsr        acs_register
[00033830] 604a                      bra.s      generate_1
generate_2:
[00033832] 224a                      movea.l    a2,a1
[00033834] 2053                      movea.l    (a3),a0
[00033836] 2a6b 001a                 movea.l    26(a3),a5
[0003383a] 4e95                      jsr        (a5)
[0003383c] 2a48                      movea.l    a0,a5
[0003383e] 200d                      move.l     a5,d0
[00033840] 6770                      beq.s      generate_3
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
[00033870] 660e                      bne.s      generate_4
[00033872] 224d                      movea.l    a5,a1
[00033874] 2053                      movea.l    (a3),a0
[00033876] 246b 001e                 movea.l    30(a3),a2
[0003387a] 4e92                      jsr        (a2)
generate_1:
[0003387c] 91c8                      suba.l     a0,a0
[0003387e] 6034                      bra.s      generate_5
generate_4:
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
[000338a0] 670a                      beq.s      generate_6
[000338a2] 224d                      movea.l    a5,a1
[000338a4] 2053                      movea.l    (a3),a0
[000338a6] 2440                      movea.l    d0,a2
[000338a8] 7001                      moveq.l    #1,d0
[000338aa] 4e92                      jsr        (a2)
generate_6:
[000338ac] 006d 0100 0038            ori.w      #$0100,56(a5)
generate_3:
[000338b2] 204d                      movea.l    a5,a0
generate_5:
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
[000338ee] 6700 0090                 beq        drag_1
[000338f2] 603a                      bra.s      drag_2
drag_4:
[000338f4] 3004                      move.w     d4,d0
[000338f6] c07c 1000                 and.w      #$1000,d0
[000338fa] 671c                      beq.s      drag_3
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
[00033916] 6016                      bra.s      drag_2
drag_3:
[00033918] 3204                      move.w     d4,d1
[0003391a] 48c1                      ext.l      d1
[0003391c] 2001                      move.l     d1,d0
[0003391e] d080                      add.l      d0,d0
[00033920] d081                      add.l      d1,d0
[00033922] e788                      lsl.l      #3,d0
[00033924] 206c 0014                 movea.l    20(a4),a0
[00033928] 43f0 0818                 lea.l      24(a0,d0.l),a1
[0003392c] 24c9                      move.l     a1,(a2)+
drag_2:
[0003392e] 4eb9 0004 7e2a            jsr        Adr_next
[00033934] 3800                      move.w     d0,d4
[00033936] 6ebc                      bgt.s      drag_4
[00033938] 4eb9 0004 810e            jsr        Adr_unselect
[0003393e] 4244                      clr.w      d4
[00033940] 6032                      bra.s      drag_5
drag_8:
[00033942] 3004                      move.w     d4,d0
[00033944] 48c0                      ext.l      d0
[00033946] e588                      lsl.l      #2,d0
[00033948] 2475 0800                 movea.l    0(a5,d0.l),a2
[0003394c] 0c6a 0002 0016            cmpi.w     #$0002,22(a2)
[00033952] 660a                      bne.s      drag_6
[00033954] 2057                      movea.l    (a7),a0
[00033956] 4eb9 0003 3988            jsr        li_newwi
[0003395c] 6014                      bra.s      drag_7
drag_6:
[0003395e] 302a 0016                 move.w     22(a2),d0
[00033962] b06b 0014                 cmp.w      20(a3),d0
[00033966] 660a                      bne.s      drag_7
[00033968] 226a 000c                 movea.l    12(a2),a1
[0003396c] 204b                      movea.l    a3,a0
[0003396e] 6100 fe96                 bsr        generate
drag_7:
[00033972] 5244                      addq.w     #1,d4
drag_5:
[00033974] b644                      cmp.w      d4,d3
[00033976] 6eca                      bgt.s      drag_8
[00033978] 204d                      movea.l    a5,a0
[0003397a] 4eb9 0004 c7c8            jsr        Ax_free
drag_1:
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
[000339a2] 671a                      beq.s      li_newwi_1
[000339a4] 006a 0004 0054            ori.w      #$0004,84(a2)
[000339aa] 2e93                      move.l     (a3),(a7)
[000339ac] 41d7                      lea.l      (a7),a0
[000339ae] 226b 0008                 movea.l    8(a3),a1
[000339b2] 2269 0008                 movea.l    8(a1),a1
[000339b6] 4e91                      jsr        (a1)
[000339b8] 026a fffb 0054            andi.w     #$FFFB,84(a2)
li_newwi_1:
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
[000339e6] 6606                      bne.s      li_init_1
[000339e8] 4eb9 0004 810e            jsr        Adr_unselect
li_init_1:
[000339ee] 2652                      movea.l    (a2),a3
[000339f0] 2a6b 0004                 movea.l    4(a3),a5
[000339f4] 4243                      clr.w      d3
[000339f6] 3803                      move.w     d3,d4
[000339f8] 286a 0014                 movea.l    20(a2),a4
[000339fc] 200c                      move.l     a4,d0
[000339fe] 6710                      beq.s      li_init_2
[00033a00] 382c 0010                 move.w     16(a4),d4
[00033a04] 362c 0012                 move.w     18(a4),d3
[00033a08] 204c                      movea.l    a4,a0
[00033a0a] 4eb9 0004 c7c8            jsr        Ax_free
li_init_2:
[00033a10] 204d                      movea.l    a5,a0
[00033a12] 226b 0022                 movea.l    34(a3),a1
[00033a16] 4e91                      jsr        (a1)
[00033a18] 2848                      movea.l    a0,a4
[00033a1a] 200c                      move.l     a4,d0
[00033a1c] 6616                      bne.s      li_init_3
[00033a1e] 41f9 000c d9f6            lea.l      LIST_NOT,a0
[00033a24] 4eb9 0004 f064            jsr        Aob_create
[00033a2a] 2848                      movea.l    a0,a4
[00033a2c] 2548 0014                 move.l     a0,20(a2)
[00033a30] 70ff                      moveq.l    #-1,d0
[00033a32] 6044                      bra.s      li_init_4
li_init_3:
[00033a34] 4bec 0018                 lea.l      24(a4),a5
[00033a38] 2b7c 0003 37f4 0004       move.l     #dragged,4(a5)
[00033a40] 3a2c 0002                 move.w     2(a4),d5
[00033a44] 601a                      bra.s      li_init_5
li_init_6:
[00033a46] 3205                      move.w     d5,d1
[00033a48] 48c1                      ext.l      d1
[00033a4a] 2001                      move.l     d1,d0
[00033a4c] d080                      add.l      d0,d0
[00033a4e] d081                      add.l      d1,d0
[00033a50] e788                      lsl.l      #3,d0
[00033a52] 4bf4 0818                 lea.l      24(a4,d0.l),a5
[00033a56] 2abc 0003 3b7a            move.l     #open_it,(a5)
[00033a5c] 3a34 0800                 move.w     0(a4,d0.l),d5
li_init_5:
[00033a60] 4a45                      tst.w      d5
[00033a62] 6ee2                      bgt.s      li_init_6
[00033a64] 254c 0014                 move.l     a4,20(a2)
[00033a68] 3944 0010                 move.w     d4,16(a4)
[00033a6c] 3943 0012                 move.w     d3,18(a4)
[00033a70] 006a 0010 0056            ori.w      #$0010,86(a2)
[00033a76] 4240                      clr.w      d0
li_init_4:
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
[00033a94] 670c                      beq.s      li_make_1
[00033a96] 204c                      movea.l    a4,a0
[00033a98] 4eb9 0005 6bea            jsr        Awi_show
[00033a9e] 6000 00ce                 bra        li_make_2
li_make_1:
[00033aa2] 702a                      moveq.l    #42,d0
[00033aa4] 4eb9 0004 c608            jsr        Ax_malloc
[00033aaa] 2448                      movea.l    a0,a2
[00033aac] 200a                      move.l     a2,d0
[00033aae] 6700 00ba                 beq        li_make_3
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
[00033b00] 6608                      bne.s      li_make_4
[00033b02] 2252                      movea.l    (a2),a1
[00033b04] 2ea9 0008                 move.l     8(a1),(a7)
[00033b08] 6002                      bra.s      li_make_5
li_make_4:
[00033b0a] 5297                      addq.l     #1,(a7)
li_make_5:
[00033b0c] 206d 005a                 movea.l    90(a5),a0
[00033b10] 2157 0008                 move.l     (a7),8(a0)
[00033b14] 204d                      movea.l    a5,a0
[00033b16] 4eb9 0005 7052            jsr        Awi_create
[00033b1c] 2848                      movea.l    a0,a4
[00033b1e] 200c                      move.l     a4,d0
[00033b20] 660a                      bne.s      li_make_6
[00033b22] 204a                      movea.l    a2,a0
[00033b24] 4eb9 0004 c7c8            jsr        Ax_free
[00033b2a] 603e                      bra.s      li_make_3
li_make_6:
[00033b2c] 2052                      movea.l    (a2),a0
[00033b2e] 4868 0168                 pea.l      360(a0)
[00033b32] 43eb 003a                 lea.l      58(a3),a1
[00033b36] 204c                      movea.l    a4,a0
[00033b38] 4eb9 0001 6372            jsr        wi_pos
[00033b3e] 584f                      addq.w     #4,a7
[00033b40] 288a                      move.l     a2,(a4)
[00033b42] 274c 0012                 move.l     a4,18(a3)
[00033b46] 202a 0016                 move.l     22(a2),d0
[00033b4a] 660a                      bne.s      li_make_7
[00033b4c] 206c 005e                 movea.l    94(a4),a0
[00033b50] 0068 0008 018a            ori.w      #$0008,394(a0)
li_make_7:
[00033b56] 204c                      movea.l    a4,a0
[00033b58] 226c 000c                 movea.l    12(a4),a1
[00033b5c] 4e91                      jsr        (a1)
[00033b5e] 4a40                      tst.w      d0
[00033b60] 670c                      beq.s      li_make_2
[00033b62] 204c                      movea.l    a4,a0
[00033b64] 4eb9 0003 3d6e            jsr        term
li_make_3:
[00033b6a] 91c8                      suba.l     a0,a0
[00033b6c] 6002                      bra.s      li_make_8
li_make_2:
[00033b6e] 204c                      movea.l    a4,a0
li_make_8:
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
[00033bc8] 6704                      beq.s      open_wi_1
[00033bca] 7001                      moveq.l    #1,d0
[00033bcc] 6002                      bra.s      open_wi_2
open_wi_1:
[00033bce] 4240                      clr.w      d0
open_wi_2:
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
[00033bee] 6700 00f8                 beq        li_service_1
[00033bf2] 6e14                      bgt.s      li_service_2
[00033bf4] 5540                      subq.w     #2,d0
[00033bf6] 6726                      beq.s      li_service_3
[00033bf8] 5740                      subq.w     #3,d0
[00033bfa] 674c                      beq.s      li_service_4
[00033bfc] 5340                      subq.w     #1,d0
[00033bfe] 6748                      beq.s      li_service_4
[00033c00] 5940                      subq.w     #4,d0
[00033c02] 6730                      beq.s      li_service_5
[00033c04] 6000 0152                 bra        li_service_6
li_service_2:
[00033c08] 907c 000f                 sub.w      #$000F,d0
[00033c0c] 6730                      beq.s      li_service_7
[00033c0e] 5340                      subq.w     #1,d0
[00033c10] 6718                      beq.s      li_service_8
[00033c12] 907c 03dd                 sub.w      #$03DD,d0
[00033c16] 6700 00da                 beq        li_service_9
[00033c1a] 6000 013c                 bra        li_service_6
li_service_3:
[00033c1e] 204a                      movea.l    a2,a0
[00033c20] 4eb9 0003 3d6e            jsr        term
[00033c26] 6000 013e                 bra        li_service_10
li_service_8:
[00033c2a] 204a                      movea.l    a2,a0
[00033c2c] 6100 fc8e                 bsr        drag
[00033c30] 6000 0134                 bra        li_service_10
li_service_5:
[00033c34] 204a                      movea.l    a2,a0
[00033c36] 6100 f9e0                 bsr        li_wopen
[00033c3a] 6000 012a                 bra        li_service_10
li_service_7:
[00033c3e] 204a                      movea.l    a2,a0
[00033c40] 6100 fa22                 bsr        li_winfo
[00033c44] 6000 0120                 bra        li_service_10
li_service_4:
[00033c48] 206a 005e                 movea.l    94(a2),a0
[00033c4c] 0068 0008 027a            ori.w      #$0008,634(a0)
[00033c52] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033c58] 0c68 0001 0246            cmpi.w     #$0001,582(a0)
[00033c5e] 6642                      bne.s      li_service_11
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
[00033c94] 6716                      beq.s      li_service_12
[00033c96] 206a 005e                 movea.l    94(a2),a0
[00033c9a] 0268 fff7 027a            andi.w     #$FFF7,634(a0)
[00033ca0] 600a                      bra.s      li_service_12
li_service_11:
[00033ca2] 206a 005e                 movea.l    94(a2),a0
[00033ca6] 0068 0008 024a            ori.w      #$0008,586(a0)
li_service_12:
[00033cac] 2079 0010 ee4e            movea.l    ACSblk,a0
[00033cb2] 3028 0246                 move.w     582(a0),d0
[00033cb6] 6f18                      ble.s      li_service_13
[00033cb8] 226a 005e                 movea.l    94(a2),a1
[00033cbc] 0269 fff7 01ba            andi.w     #$FFF7,442(a1)
[00033cc2] 206a 005e                 movea.l    94(a2),a0
[00033cc6] 0268 fff7 021a            andi.w     #$FFF7,538(a0)
[00033ccc] 6000 0098                 bra        li_service_10
li_service_13:
[00033cd0] 206a 005e                 movea.l    94(a2),a0
[00033cd4] 0068 0008 01ba            ori.w      #$0008,442(a0)
[00033cda] 206a 005e                 movea.l    94(a2),a0
[00033cde] 0068 0008 021a            ori.w      #$0008,538(a0)
[00033ce4] 6000 0080                 bra        li_service_10
li_service_1:
[00033ce8] 204a                      movea.l    a2,a0
[00033cea] 6100 f790                 bsr        delete
[00033cee] 6000 0076                 bra.w      li_service_10
li_service_9:
[00033cf2] 2052                      movea.l    (a2),a0
[00033cf4] 0c68 271c 0014            cmpi.w     #$271C,20(a0)
[00033cfa] 666a                      bne.s      li_service_10
[00033cfc] 604e                      bra.s      li_service_14
li_service_16:
[00033cfe] 7020                      moveq.l    #32,d0
[00033d00] 3403                      move.w     d3,d2
[00033d02] 48c2                      ext.l      d2
[00033d04] 2202                      move.l     d2,d1
[00033d06] d281                      add.l      d1,d1
[00033d08] d282                      add.l      d2,d1
[00033d0a] e789                      lsl.l      #3,d1
[00033d0c] 206a 0014                 movea.l    20(a2),a0
[00033d10] c070 1808                 and.w      8(a0,d1.l),d0
[00033d14] 6650                      bne.s      li_service_10
[00033d16] 3030 1820                 move.w     32(a0,d1.l),d0
[00033d1a] c07c 8000                 and.w      #$8000,d0
[00033d1e] 672a                      beq.s      li_service_15
[00033d20] 2648                      movea.l    a0,a3
[00033d22] 47f3 1818                 lea.l      24(a3,d1.l),a3
[00033d26] 286b 000c                 movea.l    12(a3),a4
[00033d2a] 240c                      move.l     a4,d2
[00033d2c] 671c                      beq.s      li_service_15
[00033d2e] 202c 0004                 move.l     4(a4),d0
[00033d32] 6716                      beq.s      li_service_15
[00033d34] 224d                      movea.l    a5,a1
[00033d36] 2040                      movea.l    d0,a0
[00033d38] 4eb9 0008 3008            jsr        strstr
[00033d3e] 2008                      move.l     a0,d0
[00033d40] 6708                      beq.s      li_service_15
[00033d42] 3003                      move.w     d3,d0
[00033d44] 204a                      movea.l    a2,a0
[00033d46] 6100 fe48                 bsr        open_wi
li_service_15:
[00033d4a] 5443                      addq.w     #2,d3
li_service_14:
[00033d4c] 206a 0014                 movea.l    20(a2),a0
[00033d50] b668 0004                 cmp.w      4(a0),d3
[00033d54] 6da8                      blt.s      li_service_16
[00033d56] 600e                      bra.s      li_service_10
li_service_6:
[00033d58] 224d                      movea.l    a5,a1
[00033d5a] 3004                      move.w     d4,d0
[00033d5c] 204a                      movea.l    a2,a0
[00033d5e] 4eb9 0005 9dd0            jsr        Awi_service
[00033d64] 6002                      bra.s      li_service_17
li_service_10:
[00033d66] 7001                      moveq.l    #1,d0
li_service_17:
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
[00033d86] 6716                      beq.s      term_1
[00033d88] 43ea 002c                 lea.l      44(a2),a1
[00033d8c] 206b 0004                 movea.l    4(a3),a0
[00033d90] 41e8 003a                 lea.l      58(a0),a0
[00033d94] 7008                      moveq.l    #8,d0
[00033d96] 4eb9 0008 3500            jsr        memcpy
[00033d9c] 6014                      bra.s      term_2
term_1:
[00033d9e] 7008                      moveq.l    #8,d0
[00033da0] 43ea 0024                 lea.l      36(a2),a1
[00033da4] 206b 0004                 movea.l    4(a3),a0
[00033da8] 41e8 003a                 lea.l      58(a0),a0
[00033dac] 4eb9 0008 3500            jsr        memcpy
term_2:
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
[00033e0e] 6606                      bne.s      work_icon_1
[00033e10] 91c8                      suba.l     a0,a0
[00033e12] 6000 00b8                 bra        work_icon_2
work_icon_1:
[00033e16] 7030                      moveq.l    #48,d0
[00033e18] 43f9 000c dd58            lea.l      inner,a1
[00033e1e] 204b                      movea.l    a3,a0
[00033e20] 4eb9 0008 3500            jsr        memcpy
[00033e26] 284b                      movea.l    a3,a4
[00033e28] 4a43                      tst.w      d3
[00033e2a] 6f00 0098                 ble        work_icon_3
[00033e2e] 3203                      move.w     d3,d1
[00033e30] d241                      add.w      d1,d1
[00033e32] 48c1                      ext.l      d1
[00033e34] 2001                      move.l     d1,d0
[00033e36] d080                      add.l      d0,d0
[00033e38] d081                      add.l      d1,d0
[00033e3a] e788                      lsl.l      #3,d0
[00033e3c] 4bf3 0830                 lea.l      48(a3,d0.l),a5
[00033e40] 7801                      moveq.l    #1,d4
[00033e42] 606a                      bra.s      work_icon_4
work_icon_6:
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
[00033e86] 6606                      bne.s      work_icon_5
[00033e88] 006c 0010 000a            ori.w      #$0010,10(a4)
work_icon_5:
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
work_icon_4:
[00033eae] 4a43                      tst.w      d3
[00033eb0] 6e92                      bgt.s      work_icon_6
[00033eb2] 377c 0002 0002            move.w     #$0002,2(a3)
[00033eb8] 70ff                      moveq.l    #-1,d0
[00033eba] d044                      add.w      d4,d0
[00033ebc] d040                      add.w      d0,d0
[00033ebe] 3740 0004                 move.w     d0,4(a3)
[00033ec2] 4254                      clr.w      (a4)
work_icon_3:
[00033ec4] 006c 0020 0020            ori.w      #$0020,32(a4)
[00033eca] 204b                      movea.l    a3,a0
work_icon_2:
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
[00033eea] 6000 00aa                 bra        li_scope_1
li_scope_7:
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
[00033f18] 6700 007c                 beq.w      li_scope_1
[00033f1c] 322c 0038                 move.w     56(a4),d1
[00033f20] c27c 0500                 and.w      #$0500,d1
[00033f24] b27c 0100                 cmp.w      #$0100,d1
[00033f28] 6616                      bne.s      li_scope_2
[00033f2a] 226b 0014                 movea.l    20(a3),a1
[00033f2e] 0269 fffe 003a            andi.w     #$FFFE,58(a1)
[00033f34] 226b 0014                 movea.l    20(a3),a1
[00033f38] 0069 0001 006a            ori.w      #$0001,106(a1)
[00033f3e] 6014                      bra.s      li_scope_3
li_scope_2:
[00033f40] 206b 0014                 movea.l    20(a3),a0
[00033f44] 0068 0001 003a            ori.w      #$0001,58(a0)
[00033f4a] 206b 0014                 movea.l    20(a3),a0
[00033f4e] 0268 fffe 006a            andi.w     #$FFFE,106(a0)
li_scope_3:
[00033f54] 204b                      movea.l    a3,a0
[00033f56] 4eb9 0005 9df4            jsr        Awi_dialog
[00033f5c] 5d40                      subq.w     #6,d0
[00033f5e] 6624                      bne.s      li_scope_4
[00033f60] 7001                      moveq.l    #1,d0
[00033f62] 206b 0014                 movea.l    20(a3),a0
[00033f66] c068 006a                 and.w      106(a0),d0
[00033f6a] 6708                      beq.s      li_scope_5
[00033f6c] 026c fbff 0038            andi.w     #$FBFF,56(a4)
[00033f72] 6006                      bra.s      li_scope_6
li_scope_5:
[00033f74] 006c 0400 0038            ori.w      #$0400,56(a4)
li_scope_6:
[00033f7a] 2057                      movea.l    (a7),a0
[00033f7c] 2250                      movea.l    (a0),a1
[00033f7e] 0069 0001 0006            ori.w      #$0001,6(a1)
li_scope_4:
[00033f84] 204b                      movea.l    a3,a0
[00033f86] 4eb9 0005 85f2            jsr        Awi_delete
[00033f8c] 3003                      move.w     d3,d0
[00033f8e] 204a                      movea.l    a2,a0
[00033f90] 4eb9 0004 7f76            jsr        Adr_del
li_scope_1:
[00033f96] 4eb9 0004 7e2a            jsr        Adr_next
[00033f9c] 3600                      move.w     d0,d3
[00033f9e] 6e00 ff4e                 bgt        li_scope_7
[00033fa2] 584f                      addq.w     #4,a7
[00033fa4] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00033fa8] 4e75                      rts

	.data


proto_alert:
[000cce46]                           dc.b '[1][Alarmbox][ OK ]',0

ABOUT:
[000cce5a]                           dc.b '  šber mich ...',0
TEXT_002:
[000cce6a]                           dc.w $004f
[000cce6c]                           dc.w $4b00
TEXT_006:
[000cce6e]                           dc.b '1234567890123456789012345678901',0
TEXT_008:
[000cce8e]                           dc.b 'Abbruch',0
TEXT_009:
[000cce96]                           dc.b 'Global',0
TEXT_01:
[000cce9d]                           dc.b '  Info...   ^I',0
TEXT_010:
[000cceac]                           dc.b 'Lokal',0
TEXT_02:
[000cceb2]                           dc.b '  Scope...  '
[000ccebe]                           dc.w $0743
[000ccec0]                           dc.w $0020
[000ccec2]                           dc.b ' Neu...    ^N',0
TEXT_04:
[000cced0]                           dc.b '  Frei      ^F',0
TEXT_05:
[000ccedf]                           dc.b '  ™ffnen    ^O',0
TEXT_059:
[000cceee]                           dc.b '12345678901234567890',0
TEXT_069:
[000ccf03]                           dc.b 'Datei:',0
TEXT_07:
[000ccf0a]                           dc.b ' Referenztypen-Kollision ',0
TEXT_070:
[000ccf24]                           dc.b 'Liste:',0
TEXT_071:
[000ccf2b]                           dc.b 'Objekt:',0
TEXT_08:
[000ccf33]                           dc.b 'Neu:',0
TEXT_09:
[000ccf38]                           dc.b ' Information ',0
TEXT_10:
[000ccf46]                           dc.b 'Alt',0
TEXT_11:
[000ccf4a]                           dc.b 'Neu',0
TEXT_12:
[000ccf4e]                           dc.b 'Alt:',0
TEXT_13:
[000ccf53]                           dc.b ' Listen-Information ',0
TEXT_133:
[000ccf68]                           dc.b '123456',0
TEXT_14:
[000ccf6f]                           dc.b ' Sichtbarkeit ',0
TEXT_15:
[000ccf7e]                           dc.b '  Name...   '
[000ccf8a]                           dc.w $074e
[000ccf8c]                           dc.w $0020
[000ccf8e]                           dc.b ' šber mich ...     ',0
TEXT_171:
[000ccfa2]                           dc.b '--------------------',0
TEXT_176:
[000ccfb7]                           dc.b ' Optionen ',0
TEXT_190:
[000ccfc2]                           dc.b 'Gr”že:',0
TEXT_192:
[000ccfc9]                           dc.b 'Nutzen:',0
TEXT_195:
[000ccfd1]                           dc.b 'Objekte:',0
al_list:
[000ccfda]                           dc.b ' ALARMBOX LISTE ',0
al_name:
[000ccfeb]                           dc.b 'ALARMBOX NAME',0
ic_list:
[000ccff9]                           dc.b ' IKONEN LISTE ',0
ic_name:
[000cd008]                           dc.b 'IKONEN NAME',0
if_list:
[000cd014]                           dc.b ' DATEN LISTE ',0
if_name:
[000cd022]                           dc.b 'DATEN NAME',0
im_list:
[000cd02d]                           dc.b ' BILDER LISTE ',0
im_name:
[000cd03c]                           dc.b 'BILD NAME',0
me_list:
[000cd046]                           dc.b ' MENš LISTE ',0
me_name:
[000cd053]                           dc.b 'MENš NAME',0
mf_list:
[000cd05d]                           dc.b ' MAUSFORMEN LISTE ',0
mf_name:
[000cd070]                           dc.b 'MAUSFORM NAME',0
ob_list:
[000cd07e]                           dc.b ' OBJEKTBŽUME LISTE ',0
ob_name:
[000cd092]                           dc.b 'OBJEKTBAUM NAME',0
proto_string:
[000cd0a2]                           dc.b 'Freier String',0
proto_wihelpfile:
[000cd0b0]                           dc.w $0000
proto_wiinfo:
[000cd0b2]                           dc.w $0020
[000cd0b4]                           dc.b 'Hinweis ',0
pu_list:
[000cd0bd]                           dc.b ' POPUP LISTE ',0
pu_name:
[000cd0cb]                           dc.b 'POPUP NAME',0
rf_list:
[000cd0d6]                           dc.b ' REFERENZEN LISTE ',0
rf_name:
[000cd0e9]                           dc.b 'REFERENZ NAME',0
st_list:
[000cd0f7]                           dc.b ' TEXTE LISTE ',0
st_name:
[000cd105]                           dc.b 'TEXT NAME',0
te_list:
[000cd10f]                           dc.b ' TEDINFO LISTE ',0
te_name:
[000cd11f]                           dc.b 'TEDINFO NAME',0
us_list:
[000cd12c]                           dc.b ' USERBLK LISTE ',0
us_name:
[000cd13c]                           dc.b 'USERBLK NAME',0
wi_list:
[000cd149]                           dc.b ' FENSTER LISTE ',0
wi_name:
[000cd159]                           dc.b 'FENSTER NAME',0
TEDI_002:
[000cd166] 000ccf68                  dc.l TEXT_133
[000cd16a] 000cce6a                  dc.l TEXT_002
[000cd16e] 000cce6a                  dc.l TEXT_002
[000cd172]                           dc.w $0003
[000cd174]                           dc.w $0006
[000cd176]                           dc.w $0001
[000cd178]                           dc.w $1101
[000cd17a]                           dc.w $0000
[000cd17c]                           dc.w $0000
[000cd17e]                           dc.w $0007
[000cd180]                           dc.w $0001
TEDI_003:
[000cd182] 000cce6e                  dc.l TEXT_006
[000cd186] 000cce6a                  dc.l TEXT_002
[000cd18a] 000cce6a                  dc.l TEXT_002
[000cd18e]                           dc.w $0003
[000cd190]                           dc.w $0006
[000cd192]                           dc.w $0000
[000cd194]                           dc.w $1180
[000cd196]                           dc.w $0000
[000cd198]                           dc.w $0000
[000cd19a]                           dc.w $0020
[000cd19c]                           dc.w $0001
TEDI_006:
[000cd19e] 000ccf68                  dc.l TEXT_133
[000cd1a2] 000cce6a                  dc.l TEXT_002
[000cd1a6] 000cce6a                  dc.l TEXT_002
[000cd1aa]                           dc.w $0003
[000cd1ac]                           dc.w $0006
[000cd1ae]                           dc.w $0001
[000cd1b0]                           dc.w $1180
[000cd1b2]                           dc.w $0000
[000cd1b4]                           dc.w $0000
[000cd1b6]                           dc.w $0007
[000cd1b8]                           dc.w $0001
TEDI_008:
[000cd1ba] 000cce6e                  dc.l TEXT_006
[000cd1be] 000cce6a                  dc.l TEXT_002
[000cd1c2] 000cce6a                  dc.l TEXT_002
[000cd1c6]                           dc.w $0003
[000cd1c8]                           dc.w $0006
[000cd1ca]                           dc.w $0002
[000cd1cc]                           dc.w $1180
[000cd1ce]                           dc.w $0000
[000cd1d0]                           dc.w $0000
[000cd1d2]                           dc.w $0020
[000cd1d4]                           dc.w $0001
TEDI_009:
[000cd1d6] 000cceee                  dc.l TEXT_059
[000cd1da] 000cce6a                  dc.l TEXT_002
[000cd1de] 000cce6a                  dc.l TEXT_002
[000cd1e2]                           dc.w $0003
[000cd1e4]                           dc.w $0006
[000cd1e6]                           dc.w $0000
[000cd1e8]                           dc.w $1180
[000cd1ea]                           dc.w $0000
[000cd1ec]                           dc.w $0000
[000cd1ee]                           dc.w $0015
[000cd1f0]                           dc.w $0001
TEDI_011:
[000cd1f2] 000cce6e                  dc.l TEXT_006
[000cd1f6] 000cce6a                  dc.l TEXT_002
[000cd1fa] 000cce6a                  dc.l TEXT_002
[000cd1fe]                           dc.w $0003
[000cd200]                           dc.w $0006
[000cd202]                           dc.w $0000
[000cd204]                           dc.w $1100
[000cd206]                           dc.w $0000
[000cd208]                           dc.w $0000
[000cd20a]                           dc.w $0020
[000cd20c]                           dc.w $0001
A_3DBUTTON01:
[000cd20e] 00064a22                  dc.l A_3Dbutton
[000cd212]                           dc.w $29c1
[000cd214]                           dc.w $0178
[000cd216] 000630f2                  dc.l Auo_string
[000cd21a] 000ccf4a                  dc.l TEXT_11
[000cd21e]                           dc.w $0000
[000cd220]                           dc.w $0000
[000cd222]                           dc.w $0000
[000cd224]                           dc.w $0000
[000cd226]                           dc.w $0000
[000cd228]                           dc.w $0000
[000cd22a]                           dc.w $0000
[000cd22c]                           dc.w $0000
A_3DBUTTON05:
[000cd22e] 00064a22                  dc.l A_3Dbutton
[000cd232]                           dc.w $29e2
[000cd234]                           dc.w $01f8
[000cd236] 000630f2                  dc.l Auo_string
[000cd23a]                           dc.w $0000
[000cd23c]                           dc.w $0000
[000cd23e]                           dc.w $0000
[000cd240]                           dc.w $0000
[000cd242]                           dc.w $0000
[000cd244]                           dc.w $0000
[000cd246]                           dc.w $0000
[000cd248]                           dc.w $0000
[000cd24a]                           dc.w $0000
[000cd24c]                           dc.w $0000
A_3DBUTTON06:
[000cd24e] 00064a22                  dc.l A_3Dbutton
[000cd252]                           dc.w $29c1
[000cd254]                           dc.w $0178
[000cd256] 000630f2                  dc.l Auo_string
[000cd25a] 000cce8e                  dc.l TEXT_008
[000cd25e]                           dc.w $0000
[000cd260]                           dc.w $0000
[000cd262]                           dc.w $0000
[000cd264]                           dc.w $0000
[000cd266]                           dc.w $0000
[000cd268]                           dc.w $0000
[000cd26a]                           dc.w $0000
[000cd26c]                           dc.w $0000
A_3DBUTTON07:
[000cd26e] 00064a22                  dc.l A_3Dbutton
[000cd272]                           dc.w $29c1
[000cd274]                           dc.w $0178
[000cd276] 000630f2                  dc.l Auo_string
[000cd27a] 000ccf46                  dc.l TEXT_10
[000cd27e]                           dc.w $0000
[000cd280]                           dc.w $0000
[000cd282]                           dc.w $0000
[000cd284]                           dc.w $0000
[000cd286]                           dc.w $0000
[000cd288]                           dc.w $0000
[000cd28a]                           dc.w $0000
[000cd28c]                           dc.w $0000
A_3DBUTTON09:
[000cd28e] 00064a22                  dc.l A_3Dbutton
[000cd292]                           dc.w $29c1
[000cd294]                           dc.w $0178
[000cd296] 000630f2                  dc.l Auo_string
[000cd29a] 000cce6b                  dc.l TEXT_003
[000cd29e]                           dc.w $0000
[000cd2a0]                           dc.w $0000
[000cd2a2]                           dc.w $0000
[000cd2a4]                           dc.w $0000
[000cd2a6]                           dc.w $0000
[000cd2a8]                           dc.w $0000
[000cd2aa]                           dc.w $0000
[000cd2ac]                           dc.w $0000
A_CHECKBOX01:
[000cd2ae] 0006323e                  dc.l A_checkbox
[000cd2b2]                           dc.w $0000
[000cd2b4]                           dc.w $0001
[000cd2b6] 000630f2                  dc.l Auo_string
[000cd2ba] 000cce96                  dc.l TEXT_009
[000cd2be]                           dc.w $0000
[000cd2c0]                           dc.w $0000
[000cd2c2]                           dc.w $0000
[000cd2c4]                           dc.w $0000
[000cd2c6]                           dc.w $0000
[000cd2c8]                           dc.w $0000
[000cd2ca]                           dc.w $0000
[000cd2cc]                           dc.w $0000
A_CHECKBOX03:
[000cd2ce] 0006323e                  dc.l A_checkbox
[000cd2d2]                           dc.w $0000
[000cd2d4]                           dc.w $0001
[000cd2d6] 000630f2                  dc.l Auo_string
[000cd2da] 000cceac                  dc.l TEXT_010
[000cd2de]                           dc.w $0000
[000cd2e0]                           dc.w $0000
[000cd2e2]                           dc.w $0000
[000cd2e4]                           dc.w $0000
[000cd2e6]                           dc.w $0000
[000cd2e8]                           dc.w $0000
[000cd2ea]                           dc.w $0000
[000cd2ec]                           dc.w $0000
MEN_LIST:
[000cd2ee]                           dc.w $ffff
[000cd2f0]                           dc.w $0001
[000cd2f2]                           dc.w $0005
[000cd2f4]                           dc.w $0019
[000cd2f6]                           dc.w $0000
[000cd2f8]                           dc.w $0000
[000cd2fa]                           dc.w $0000
[000cd2fc]                           dc.w $0000
[000cd2fe]                           dc.w $0000
[000cd300]                           dc.w $0000
[000cd302]                           dc.w $005a
[000cd304]                           dc.w $0019
_01_MEN_LIST:
[000cd306]                           dc.w $0005
[000cd308]                           dc.w $0002
[000cd30a]                           dc.w $0002
[000cd30c]                           dc.w $0014
[000cd30e]                           dc.w $0000
[000cd310]                           dc.w $0000
[000cd312]                           dc.w $0000
[000cd314]                           dc.w $1100
[000cd316]                           dc.w $0000
[000cd318]                           dc.w $0000
[000cd31a]                           dc.w $005a
[000cd31c]                           dc.w $0201
_02_MEN_LIST:
[000cd31e]                           dc.w $0001
[000cd320]                           dc.w $0003
[000cd322]                           dc.w $0004
[000cd324]                           dc.w $0019
[000cd326]                           dc.w $0000
[000cd328]                           dc.w $0000
[000cd32a]                           dc.w $0000
[000cd32c]                           dc.w $0000
[000cd32e]                           dc.w $0002
[000cd330]                           dc.w $0000
[000cd332]                           dc.w $0010
[000cd334]                           dc.w $0301
_03_MEN_LIST:
[000cd336]                           dc.w $0004
[000cd338]                           dc.w $ffff
[000cd33a]                           dc.w $ffff
[000cd33c]                           dc.w $0020
[000cd33e]                           dc.w $0000
[000cd340]                           dc.w $0000
[000cd342] 000cce6a                  dc.l TEXT_002
[000cd346]                           dc.w $0000
[000cd348]                           dc.w $0000
[000cd34a]                           dc.w $0006
[000cd34c]                           dc.w $0301
_04_MEN_LIST:
[000cd34e]                           dc.w $0002
[000cd350]                           dc.w $ffff
[000cd352]                           dc.w $ffff
[000cd354]                           dc.w $0020
[000cd356]                           dc.w $0000
[000cd358]                           dc.w $0000
[000cd35a] 000ccfb7                  dc.l TEXT_176
[000cd35e]                           dc.w $0006
[000cd360]                           dc.w $0000
[000cd362]                           dc.w $000a
[000cd364]                           dc.w $0301
_05_MEN_LIST:
[000cd366]                           dc.w $0000
[000cd368]                           dc.w $0006
[000cd36a]                           dc.w $000f
[000cd36c]                           dc.w $0019
[000cd36e]                           dc.w $0000
[000cd370]                           dc.w $0000
[000cd372]                           dc.w $0000
[000cd374]                           dc.w $0000
[000cd376]                           dc.w $0000
[000cd378]                           dc.w $0301
[000cd37a]                           dc.w $0050
[000cd37c]                           dc.w $0013
_06_MEN_LIST:
[000cd37e]                           dc.w $000f
[000cd380]                           dc.w $0007
[000cd382]                           dc.w $000e
[000cd384]                           dc.w $0014
[000cd386]                           dc.w $0000
[000cd388]                           dc.w $0000
[000cd38a]                           dc.w $00ff
[000cd38c]                           dc.w $1100
[000cd38e]                           dc.w $0002
[000cd390]                           dc.w $0000
[000cd392]                           dc.w $0014
[000cd394]                           dc.w $0008
_07_MEN_LIST:
[000cd396]                           dc.w $0008
[000cd398]                           dc.w $ffff
[000cd39a]                           dc.w $ffff
[000cd39c]                           dc.w $001c
[000cd39e]                           dc.w $0000
[000cd3a0]                           dc.w $2000
[000cd3a2] 000ccf8d                  dc.l TEXT_170
[000cd3a6]                           dc.w $0000
[000cd3a8]                           dc.w $0000
[000cd3aa]                           dc.w $0014
[000cd3ac]                           dc.w $0001
_08_MEN_LIST:
[000cd3ae]                           dc.w $0009
[000cd3b0]                           dc.w $ffff
[000cd3b2]                           dc.w $ffff
[000cd3b4]                           dc.w $001c
[000cd3b6]                           dc.w $0000
[000cd3b8]                           dc.w $2000
[000cd3ba] 000ccfa2                  dc.l TEXT_171
[000cd3be]                           dc.w $0000
[000cd3c0]                           dc.w $0001
[000cd3c2]                           dc.w $0014
[000cd3c4]                           dc.w $0001
_09_MEN_LIST:
[000cd3c6]                           dc.w $000a
[000cd3c8]                           dc.w $ffff
[000cd3ca]                           dc.w $ffff
[000cd3cc]                           dc.w $001c
[000cd3ce]                           dc.w $0000
[000cd3d0]                           dc.w $2000
[000cd3d2] 000cce6a                  dc.l TEXT_002
[000cd3d6]                           dc.w $0000
[000cd3d8]                           dc.w $0002
[000cd3da]                           dc.w $0014
[000cd3dc]                           dc.w $0001
_10_MEN_LIST:
[000cd3de]                           dc.w $000b
[000cd3e0]                           dc.w $ffff
[000cd3e2]                           dc.w $ffff
[000cd3e4]                           dc.w $001c
[000cd3e6]                           dc.w $0000
[000cd3e8]                           dc.w $2000
[000cd3ea] 000cce6a                  dc.l TEXT_002
[000cd3ee]                           dc.w $0000
[000cd3f0]                           dc.w $0003
[000cd3f2]                           dc.w $0014
[000cd3f4]                           dc.w $0001
_11_MEN_LIST:
[000cd3f6]                           dc.w $000c
[000cd3f8]                           dc.w $ffff
[000cd3fa]                           dc.w $ffff
[000cd3fc]                           dc.w $001c
[000cd3fe]                           dc.w $0000
[000cd400]                           dc.w $2000
[000cd402] 000cce6a                  dc.l TEXT_002
[000cd406]                           dc.w $0000
[000cd408]                           dc.w $0004
[000cd40a]                           dc.w $0014
[000cd40c]                           dc.w $0001
_12_MEN_LIST:
[000cd40e]                           dc.w $000d
[000cd410]                           dc.w $ffff
[000cd412]                           dc.w $ffff
[000cd414]                           dc.w $001c
[000cd416]                           dc.w $0000
[000cd418]                           dc.w $2000
[000cd41a] 000cce6a                  dc.l TEXT_002
[000cd41e]                           dc.w $0000
[000cd420]                           dc.w $0005
[000cd422]                           dc.w $0014
[000cd424]                           dc.w $0001
_13_MEN_LIST:
[000cd426]                           dc.w $000e
[000cd428]                           dc.w $ffff
[000cd42a]                           dc.w $ffff
[000cd42c]                           dc.w $001c
[000cd42e]                           dc.w $0000
[000cd430]                           dc.w $2000
[000cd432] 000cce6a                  dc.l TEXT_002
[000cd436]                           dc.w $0000
[000cd438]                           dc.w $0006
[000cd43a]                           dc.w $0014
[000cd43c]                           dc.w $0001
_14_MEN_LIST:
[000cd43e]                           dc.w $0006
[000cd440]                           dc.w $ffff
[000cd442]                           dc.w $ffff
[000cd444]                           dc.w $001c
[000cd446]                           dc.w $0000
[000cd448]                           dc.w $2000
[000cd44a] 000cce6a                  dc.l TEXT_002
[000cd44e]                           dc.w $0000
[000cd450]                           dc.w $0007
[000cd452]                           dc.w $0012
[000cd454]                           dc.w $0001
_15_MEN_LIST:
[000cd456]                           dc.w $0005
[000cd458]                           dc.w $0010
[000cd45a]                           dc.w $001a
[000cd45c]                           dc.w $0014
[000cd45e]                           dc.w $0000
[000cd460]                           dc.w $0000
[000cd462]                           dc.w $00ff
[000cd464]                           dc.w $1101
[000cd466]                           dc.w $0008
[000cd468]                           dc.w $0000
[000cd46a]                           dc.w $0015
[000cd46c]                           dc.w $0006
_16_MEN_LIST:
[000cd46e]                           dc.w $0012
[000cd470]                           dc.w $ffff
[000cd472]                           dc.w $ffff
[000cd474]                           dc.w $001c
[000cd476]                           dc.w $0000
[000cd478]                           dc.w $0100
[000cd47a] 000ccec1                  dc.l TEXT_03
[000cd47e]                           dc.w $0000
[000cd480]                           dc.w $0000
[000cd482]                           dc.w $0015
[000cd484]                           dc.w $0001
_16aMEN_LIST:
[000cd486] 000339c6                  dc.l li_new
[000cd48a]                           dc.w $0000
[000cd48c]                           dc.w $0000
[000cd48e]                           dc.w $8000
[000cd490]                           dc.w $844e
[000cd492]                           dc.w $0000
[000cd494]                           dc.w $0000
[000cd496]                           dc.w $0000
[000cd498]                           dc.w $0000
[000cd49a]                           dc.w $0000
[000cd49c]                           dc.w $0000
_18_MEN_LIST:
[000cd49e]                           dc.w $0014
[000cd4a0]                           dc.w $ffff
[000cd4a2]                           dc.w $ffff
[000cd4a4]                           dc.w $001c
[000cd4a6]                           dc.w $0000
[000cd4a8]                           dc.w $0108
[000cd4aa] 000cced0                  dc.l TEXT_04
[000cd4ae]                           dc.w $0000
[000cd4b0]                           dc.w $0004
[000cd4b2]                           dc.w $0015
[000cd4b4]                           dc.w $0001
_18aMEN_LIST:
[000cd4b6] 00033592                  dc.l li_setfree
[000cd4ba]                           dc.w $0000
[000cd4bc]                           dc.w $0000
[000cd4be]                           dc.w $8000
[000cd4c0]                           dc.w $8446
[000cd4c2]                           dc.w $0000
[000cd4c4]                           dc.w $0000
[000cd4c6]                           dc.w $0000
[000cd4c8]                           dc.w $0000
[000cd4ca]                           dc.w $0000
[000cd4cc]                           dc.w $0000
_20_MEN_LIST:
[000cd4ce]                           dc.w $0016
[000cd4d0]                           dc.w $ffff
[000cd4d2]                           dc.w $ffff
[000cd4d4]                           dc.w $001c
[000cd4d6]                           dc.w $0000
[000cd4d8]                           dc.w $0100
[000cd4da] 000cce9d                  dc.l TEXT_01
[000cd4de]                           dc.w $0000
[000cd4e0]                           dc.w $0003
[000cd4e2]                           dc.w $0015
[000cd4e4]                           dc.w $0001
_20aMEN_LIST:
[000cd4e6] 00033652                  dc.l li_info
[000cd4ea]                           dc.w $0000
[000cd4ec]                           dc.w $0000
[000cd4ee]                           dc.w $8000
[000cd4f0]                           dc.w $8449
[000cd4f2]                           dc.w $0000
[000cd4f4]                           dc.w $0000
[000cd4f6]                           dc.w $0000
[000cd4f8]                           dc.w $0000
[000cd4fa]                           dc.w $0000
[000cd4fc]                           dc.w $0000
_22_MEN_LIST:
[000cd4fe]                           dc.w $0018
[000cd500]                           dc.w $ffff
[000cd502]                           dc.w $ffff
[000cd504]                           dc.w $001c
[000cd506]                           dc.w $0000
[000cd508]                           dc.w $0108
[000cd50a] 000ccedf                  dc.l TEXT_05
[000cd50e]                           dc.w $0000
[000cd510]                           dc.w $0002
[000cd512]                           dc.w $0015
[000cd514]                           dc.w $0001
_22aMEN_LIST:
[000cd516] 00033606                  dc.l li_open
[000cd51a]                           dc.w $0000
[000cd51c]                           dc.w $0000
[000cd51e]                           dc.w $8000
[000cd520]                           dc.w $844f
[000cd522]                           dc.w $0000
[000cd524]                           dc.w $0000
[000cd526]                           dc.w $0000
[000cd528]                           dc.w $0000
[000cd52a]                           dc.w $0000
[000cd52c]                           dc.w $0000
_24_MEN_LIST:
[000cd52e]                           dc.w $001a
[000cd530]                           dc.w $ffff
[000cd532]                           dc.w $ffff
[000cd534]                           dc.w $001c
[000cd536]                           dc.w $0000
[000cd538]                           dc.w $0108
[000cd53a] 000ccf7e                  dc.l TEXT_15
[000cd53e]                           dc.w $0000
[000cd540]                           dc.w $0001
[000cd542]                           dc.w $0015
[000cd544]                           dc.w $0001
_24aMEN_LIST:
[000cd546] 000334e8                  dc.l li_changename
[000cd54a]                           dc.w $0000
[000cd54c]                           dc.w $0000
[000cd54e]                           dc.w $8000
[000cd550]                           dc.w $884e
[000cd552]                           dc.w $0000
[000cd554]                           dc.w $0000
[000cd556]                           dc.w $0000
[000cd558]                           dc.w $0000
[000cd55a]                           dc.w $0000
[000cd55c]                           dc.w $0000
_26_MEN_LIST:
[000cd55e]                           dc.w $000f
[000cd560]                           dc.w $ffff
[000cd562]                           dc.w $ffff
[000cd564]                           dc.w $001c
[000cd566]                           dc.w $0000
[000cd568]                           dc.w $0108
[000cd56a] 000cceb2                  dc.l TEXT_02
[000cd56e]                           dc.w $0000
[000cd570]                           dc.w $0005
[000cd572]                           dc.w $0015
[000cd574]                           dc.w $0001
_26aMEN_LIST:
[000cd576] 00033ed4                  dc.l li_scope
[000cd57a]                           dc.w $0000
[000cd57c]                           dc.w $0000
[000cd57e]                           dc.w $8020
[000cd580]                           dc.w $8843
[000cd582]                           dc.w $0000
[000cd584]                           dc.w $0000
[000cd586]                           dc.w $0000
[000cd588]                           dc.w $0000
[000cd58a]                           dc.w $0000
[000cd58c]                           dc.w $0000
DIFF_TYPE:
[000cd58e]                           dc.w $ffff
[000cd590]                           dc.w $0001
[000cd592]                           dc.w $0001
[000cd594]                           dc.w $0019
[000cd596]                           dc.w $0000
[000cd598]                           dc.w $0000
[000cd59a]                           dc.w $00ff
[000cd59c]                           dc.w $1141
[000cd59e]                           dc.w $0000
[000cd5a0]                           dc.w $0000
[000cd5a2]                           dc.w $0024
[000cd5a4]                           dc.w $0009
_01_DIFF_TYPE:
[000cd5a6]                           dc.w $0000
[000cd5a8]                           dc.w $0002
[000cd5aa]                           dc.w $000c
[000cd5ac]                           dc.w $0018
[000cd5ae]                           dc.w $0040
[000cd5b0]                           dc.w $0010
[000cd5b2] 000cd22e                  dc.l A_3DBUTTON05
[000cd5b6]                           dc.w $0000
[000cd5b8]                           dc.w $0000
[000cd5ba]                           dc.w $0024
[000cd5bc]                           dc.w $0009
_02_DIFF_TYPE:
[000cd5be]                           dc.w $0003
[000cd5c0]                           dc.w $ffff
[000cd5c2]                           dc.w $ffff
[000cd5c4]                           dc.w $001c
[000cd5c6]                           dc.w $0040
[000cd5c8]                           dc.w $0000
[000cd5ca] 000ccf4e                  dc.l TEXT_12
[000cd5ce]                           dc.w $0005
[000cd5d0]                           dc.w $0003
[000cd5d2]                           dc.w $0004
[000cd5d4]                           dc.w $0001
_03_DIFF_TYPE:
[000cd5d6]                           dc.w $0004
[000cd5d8]                           dc.w $ffff
[000cd5da]                           dc.w $ffff
[000cd5dc]                           dc.w $0016
[000cd5de]                           dc.w $0040
[000cd5e0]                           dc.w $0000
[000cd5e2] 000cd1d6                  dc.l TEDI_009
[000cd5e6]                           dc.w $000b
[000cd5e8]                           dc.w $0003
[000cd5ea]                           dc.w $0014
[000cd5ec]                           dc.w $0001
_04_DIFF_TYPE:
[000cd5ee]                           dc.w $0005
[000cd5f0]                           dc.w $ffff
[000cd5f2]                           dc.w $ffff
[000cd5f4]                           dc.w $0016
[000cd5f6]                           dc.w $0040
[000cd5f8]                           dc.w $0000
[000cd5fa] 000cd1d6                  dc.l TEDI_009
[000cd5fe]                           dc.w $000b
[000cd600]                           dc.w $0004
[000cd602]                           dc.w $0014
[000cd604]                           dc.w $0001
_05_DIFF_TYPE:
[000cd606]                           dc.w $0006
[000cd608]                           dc.w $ffff
[000cd60a]                           dc.w $ffff
[000cd60c]                           dc.w $001c
[000cd60e]                           dc.w $0040
[000cd610]                           dc.w $0000
[000cd612] 000ccf33                  dc.l TEXT_08
[000cd616]                           dc.w $0005
[000cd618]                           dc.w $0004
[000cd61a]                           dc.w $0004
[000cd61c]                           dc.w $0001
_06_DIFF_TYPE:
[000cd61e]                           dc.w $0008
[000cd620]                           dc.w $ffff
[000cd622]                           dc.w $ffff
[000cd624]                           dc.w $0018
[000cd626]                           dc.w $4007
[000cd628]                           dc.w $0010
[000cd62a] 000cd20e                  dc.l A_3DBUTTON01
[000cd62e]                           dc.w $0001
[000cd630]                           dc.w $0006
[000cd632]                           dc.w $000a
[000cd634]                           dc.w $0002
_06aDIFF_TYPE:
[000cd636]                           dc.w $0000
[000cd638]                           dc.w $0000
[000cd63a]                           dc.w $0000
[000cd63c]                           dc.w $0000
[000cd63e]                           dc.w $8000
[000cd640]                           dc.w $884e
[000cd642]                           dc.w $0000
[000cd644]                           dc.w $0000
[000cd646]                           dc.w $0000
[000cd648]                           dc.w $0000
[000cd64a]                           dc.w $0000
[000cd64c]                           dc.w $0000
_08_DIFF_TYPE:
[000cd64e]                           dc.w $000a
[000cd650]                           dc.w $ffff
[000cd652]                           dc.w $ffff
[000cd654]                           dc.w $0018
[000cd656]                           dc.w $4005
[000cd658]                           dc.w $0010
[000cd65a] 000cd26e                  dc.l A_3DBUTTON07
[000cd65e]                           dc.w $000d
[000cd660]                           dc.w $0006
[000cd662]                           dc.w $000a
[000cd664]                           dc.w $0002
_08aDIFF_TYPE:
[000cd666]                           dc.w $0000
[000cd668]                           dc.w $0000
[000cd66a]                           dc.w $0000
[000cd66c]                           dc.w $0000
[000cd66e]                           dc.w $8000
[000cd670]                           dc.w $884c
[000cd672]                           dc.w $0000
[000cd674]                           dc.w $0000
[000cd676]                           dc.w $0000
[000cd678]                           dc.w $0000
[000cd67a]                           dc.w $0000
[000cd67c]                           dc.w $0000
_10_DIFF_TYPE:
[000cd67e]                           dc.w $000c
[000cd680]                           dc.w $ffff
[000cd682]                           dc.w $ffff
[000cd684]                           dc.w $0018
[000cd686]                           dc.w $4005
[000cd688]                           dc.w $0010
[000cd68a] 000cd24e                  dc.l A_3DBUTTON06
[000cd68e]                           dc.w $0019
[000cd690]                           dc.w $0006
[000cd692]                           dc.w $000a
[000cd694]                           dc.w $0002
_10aDIFF_TYPE:
[000cd696]                           dc.w $0000
[000cd698]                           dc.w $0000
[000cd69a]                           dc.w $0000
[000cd69c]                           dc.w $0000
[000cd69e]                           dc.w $8000
[000cd6a0]                           dc.w $8841
[000cd6a2]                           dc.w $0000
[000cd6a4]                           dc.w $0000
[000cd6a6]                           dc.w $0000
[000cd6a8]                           dc.w $0000
[000cd6aa]                           dc.w $0000
[000cd6ac]                           dc.w $0000
_12_DIFF_TYPE:
[000cd6ae]                           dc.w $0001
[000cd6b0]                           dc.w $ffff
[000cd6b2]                           dc.w $ffff
[000cd6b4]                           dc.w $0016
[000cd6b6]                           dc.w $0060
[000cd6b8]                           dc.w $0000
[000cd6ba] 000cd1ba                  dc.l TEDI_008
[000cd6be]                           dc.w $0002
[000cd6c0]                           dc.w $0001
[000cd6c2]                           dc.w $0020
[000cd6c4]                           dc.w $0001
INFO_LIST:
[000cd6c6]                           dc.w $ffff
[000cd6c8]                           dc.w $0001
[000cd6ca]                           dc.w $0001
[000cd6cc]                           dc.w $0019
[000cd6ce]                           dc.w $0000
[000cd6d0]                           dc.w $0000
[000cd6d2]                           dc.w $00ff
[000cd6d4]                           dc.w $1141
[000cd6d6]                           dc.w $0000
[000cd6d8]                           dc.w $0000
[000cd6da]                           dc.w $0028
[000cd6dc]                           dc.w $0009
_01_INFO_LIST:
[000cd6de]                           dc.w $0000
[000cd6e0]                           dc.w $0002
[000cd6e2]                           dc.w $000d
[000cd6e4]                           dc.w $0018
[000cd6e6]                           dc.w $0000
[000cd6e8]                           dc.w $0010
[000cd6ea] 000cd22e                  dc.l A_3DBUTTON05
[000cd6ee]                           dc.w $0000
[000cd6f0]                           dc.w $0000
[000cd6f2]                           dc.w $0028
[000cd6f4]                           dc.w $0009
_02_INFO_LIST:
[000cd6f6]                           dc.w $0004
[000cd6f8]                           dc.w $ffff
[000cd6fa]                           dc.w $ffff
[000cd6fc]                           dc.w $0018
[000cd6fe]                           dc.w $0007
[000cd700]                           dc.w $0010
[000cd702] 000cd28e                  dc.l A_3DBUTTON09
[000cd706]                           dc.w $000e
[000cd708]                           dc.w $0006
[000cd70a]                           dc.w $000c
[000cd70c]                           dc.w $0002
_02aINFO_LIST:
[000cd70e]                           dc.w $0000
[000cd710]                           dc.w $0000
[000cd712]                           dc.w $0000
[000cd714]                           dc.w $0000
[000cd716]                           dc.w $8000
[000cd718]                           dc.w $884f
[000cd71a]                           dc.w $0000
[000cd71c]                           dc.w $0000
[000cd71e]                           dc.w $0000
[000cd720]                           dc.w $0000
[000cd722]                           dc.w $0000
[000cd724]                           dc.w $0000
_04_INFO_LIST:
[000cd726]                           dc.w $0005
[000cd728]                           dc.w $ffff
[000cd72a]                           dc.w $ffff
[000cd72c]                           dc.w $001c
[000cd72e]                           dc.w $0000
[000cd730]                           dc.w $0000
[000cd732] 000ccf03                  dc.l TEXT_069
[000cd736]                           dc.w $0001
[000cd738]                           dc.w $0001
[000cd73a]                           dc.w $0006
[000cd73c]                           dc.w $0001
_05_INFO_LIST:
[000cd73e]                           dc.w $0006
[000cd740]                           dc.w $ffff
[000cd742]                           dc.w $ffff
[000cd744]                           dc.w $001c
[000cd746]                           dc.w $0000
[000cd748]                           dc.w $0000
[000cd74a] 000ccf24                  dc.l TEXT_070
[000cd74e]                           dc.w $0001
[000cd750]                           dc.w $0002
[000cd752]                           dc.w $0006
[000cd754]                           dc.w $0001
_06_INFO_LIST:
[000cd756]                           dc.w $0007
[000cd758]                           dc.w $ffff
[000cd75a]                           dc.w $ffff
[000cd75c]                           dc.w $001c
[000cd75e]                           dc.w $0000
[000cd760]                           dc.w $0000
[000cd762] 000ccf2b                  dc.l TEXT_071
[000cd766]                           dc.w $0001
[000cd768]                           dc.w $0003
[000cd76a]                           dc.w $0007
[000cd76c]                           dc.w $0001
_07_INFO_LIST:
[000cd76e]                           dc.w $0008
[000cd770]                           dc.w $ffff
[000cd772]                           dc.w $ffff
[000cd774]                           dc.w $001c
[000cd776]                           dc.w $0000
[000cd778]                           dc.w $0000
[000cd77a] 000ccfc2                  dc.l TEXT_190
[000cd77e]                           dc.w $0001
[000cd780]                           dc.w $0004
[000cd782]                           dc.w $0006
[000cd784]                           dc.w $0001
_08_INFO_LIST:
[000cd786]                           dc.w $0009
[000cd788]                           dc.w $ffff
[000cd78a]                           dc.w $ffff
[000cd78c]                           dc.w $0016
[000cd78e]                           dc.w $0000
[000cd790]                           dc.w $0000
[000cd792] 000cd1f2                  dc.l TEDI_011
[000cd796]                           dc.w $0008
[000cd798]                           dc.w $0001
[000cd79a]                           dc.w $001f
[000cd79c]                           dc.w $0001
_09_INFO_LIST:
[000cd79e]                           dc.w $000a
[000cd7a0]                           dc.w $ffff
[000cd7a2]                           dc.w $ffff
[000cd7a4]                           dc.w $0016
[000cd7a6]                           dc.w $0000
[000cd7a8]                           dc.w $0000
[000cd7aa] 000cd1f2                  dc.l TEDI_011
[000cd7ae]                           dc.w $0008
[000cd7b0]                           dc.w $0002
[000cd7b2]                           dc.w $001f
[000cd7b4]                           dc.w $0001
_10_INFO_LIST:
[000cd7b6]                           dc.w $000b
[000cd7b8]                           dc.w $ffff
[000cd7ba]                           dc.w $ffff
[000cd7bc]                           dc.w $0016
[000cd7be]                           dc.w $0000
[000cd7c0]                           dc.w $0000
[000cd7c2] 000cd1f2                  dc.l TEDI_011
[000cd7c6]                           dc.w $0008
[000cd7c8]                           dc.w $0003
[000cd7ca]                           dc.w $001f
[000cd7cc]                           dc.w $0001
_11_INFO_LIST:
[000cd7ce]                           dc.w $000c
[000cd7d0]                           dc.w $ffff
[000cd7d2]                           dc.w $ffff
[000cd7d4]                           dc.w $0016
[000cd7d6]                           dc.w $0000
[000cd7d8]                           dc.w $0000
[000cd7da] 000cd166                  dc.l TEDI_002
[000cd7de]                           dc.w $0008
[000cd7e0]                           dc.w $0004
[000cd7e2]                           dc.w $0006
[000cd7e4]                           dc.w $0001
_12_INFO_LIST:
[000cd7e6]                           dc.w $000d
[000cd7e8]                           dc.w $ffff
[000cd7ea]                           dc.w $ffff
[000cd7ec]                           dc.w $001c
[000cd7ee]                           dc.w $0000
[000cd7f0]                           dc.w $0000
[000cd7f2] 000ccfc9                  dc.l TEXT_192
[000cd7f6]                           dc.w $001a
[000cd7f8]                           dc.w $0004
[000cd7fa]                           dc.w $0007
[000cd7fc]                           dc.w $0001
_13_INFO_LIST:
[000cd7fe]                           dc.w $0001
[000cd800]                           dc.w $ffff
[000cd802]                           dc.w $ffff
[000cd804]                           dc.w $0016
[000cd806]                           dc.w $0020
[000cd808]                           dc.w $0000
[000cd80a] 000cd166                  dc.l TEDI_002
[000cd80e]                           dc.w $0021
[000cd810]                           dc.w $0004
[000cd812]                           dc.w $0006
[000cd814]                           dc.w $0001
INFO_LISTSELF:
[000cd816]                           dc.w $ffff
[000cd818]                           dc.w $0001
[000cd81a]                           dc.w $0001
[000cd81c]                           dc.w $0019
[000cd81e]                           dc.w $0000
[000cd820]                           dc.w $0000
[000cd822]                           dc.w $00ff
[000cd824]                           dc.w $1141
[000cd826]                           dc.w $0000
[000cd828]                           dc.w $0000
[000cd82a]                           dc.w $002a
[000cd82c]                           dc.w $0008
_01_INFO_LISTSELF:
[000cd82e]                           dc.w $0000
[000cd830]                           dc.w $0002
[000cd832]                           dc.w $0008
[000cd834]                           dc.w $0018
[000cd836]                           dc.w $0000
[000cd838]                           dc.w $0510
[000cd83a] 000cd22e                  dc.l A_3DBUTTON05
[000cd83e]                           dc.w $0000
[000cd840]                           dc.w $0000
[000cd842]                           dc.w $002a
[000cd844]                           dc.w $0008
_02_INFO_LISTSELF:
[000cd846]                           dc.w $0003
[000cd848]                           dc.w $ffff
[000cd84a]                           dc.w $ffff
[000cd84c]                           dc.w $001c
[000cd84e]                           dc.w $0000
[000cd850]                           dc.w $0000
[000cd852] 000ccf03                  dc.l TEXT_069
[000cd856]                           dc.w $0001
[000cd858]                           dc.w $0001
[000cd85a]                           dc.w $0006
[000cd85c]                           dc.w $0001
_03_INFO_LISTSELF:
[000cd85e]                           dc.w $0004
[000cd860]                           dc.w $ffff
[000cd862]                           dc.w $ffff
[000cd864]                           dc.w $001c
[000cd866]                           dc.w $0000
[000cd868]                           dc.w $0000
[000cd86a] 000ccf24                  dc.l TEXT_070
[000cd86e]                           dc.w $0001
[000cd870]                           dc.w $0002
[000cd872]                           dc.w $0006
[000cd874]                           dc.w $0001
_04_INFO_LISTSELF:
[000cd876]                           dc.w $0005
[000cd878]                           dc.w $ffff
[000cd87a]                           dc.w $ffff
[000cd87c]                           dc.w $001c
[000cd87e]                           dc.w $0000
[000cd880]                           dc.w $0000
[000cd882] 000ccfd1                  dc.l TEXT_195
[000cd886]                           dc.w $0001
[000cd888]                           dc.w $0003
[000cd88a]                           dc.w $0008
[000cd88c]                           dc.w $0001
_05_INFO_LISTSELF:
[000cd88e]                           dc.w $0006
[000cd890]                           dc.w $ffff
[000cd892]                           dc.w $ffff
[000cd894]                           dc.w $0016
[000cd896]                           dc.w $0000
[000cd898]                           dc.w $0000
[000cd89a] 000cd19e                  dc.l TEDI_006
[000cd89e]                           dc.w $000a
[000cd8a0]                           dc.w $0003
[000cd8a2]                           dc.w $0006
[000cd8a4]                           dc.w $0001
_06_INFO_LISTSELF:
[000cd8a6]                           dc.w $0007
[000cd8a8]                           dc.w $ffff
[000cd8aa]                           dc.w $ffff
[000cd8ac]                           dc.w $0016
[000cd8ae]                           dc.w $0000
[000cd8b0]                           dc.w $0000
[000cd8b2] 000cd182                  dc.l TEDI_003
[000cd8b6]                           dc.w $000a
[000cd8b8]                           dc.w $0002
[000cd8ba]                           dc.w $001f
[000cd8bc]                           dc.w $0001
_07_INFO_LISTSELF:
[000cd8be]                           dc.w $0008
[000cd8c0]                           dc.w $ffff
[000cd8c2]                           dc.w $ffff
[000cd8c4]                           dc.w $0016
[000cd8c6]                           dc.w $0000
[000cd8c8]                           dc.w $0000
[000cd8ca] 000cd182                  dc.l TEDI_003
[000cd8ce]                           dc.w $000a
[000cd8d0]                           dc.w $0001
[000cd8d2]                           dc.w $001f
[000cd8d4]                           dc.w $0001
_08_INFO_LISTSELF:
[000cd8d6]                           dc.w $0001
[000cd8d8]                           dc.w $ffff
[000cd8da]                           dc.w $ffff
[000cd8dc]                           dc.w $0018
[000cd8de]                           dc.w $0007
[000cd8e0]                           dc.w $0010
[000cd8e2] 000cd28e                  dc.l A_3DBUTTON09
[000cd8e6]                           dc.w $000f
[000cd8e8]                           dc.w $0005
[000cd8ea]                           dc.w $000c
[000cd8ec]                           dc.w $0002
_08aINFO_LISTSELF:
[000cd8ee]                           dc.w $0000
[000cd8f0]                           dc.w $0000
[000cd8f2]                           dc.w $0000
[000cd8f4]                           dc.w $0000
[000cd8f6]                           dc.w $8020
[000cd8f8]                           dc.w $884f
[000cd8fa]                           dc.w $0000
[000cd8fc]                           dc.w $0000
[000cd8fe]                           dc.w $0000
[000cd900]                           dc.w $0000
[000cd902]                           dc.w $0000
[000cd904]                           dc.w $0000
INFO_SCOPE:
[000cd906]                           dc.w $ffff
[000cd908]                           dc.w $0001
[000cd90a]                           dc.w $0001
[000cd90c]                           dc.w $0019
[000cd90e]                           dc.w $0000
[000cd910]                           dc.w $0000
[000cd912]                           dc.w $00ff
[000cd914]                           dc.w $1141
[000cd916]                           dc.w $0000
[000cd918]                           dc.w $0000
[000cd91a]                           dc.w $0018
[000cd91c]                           dc.w $0006
_01_INFO_SCOPE:
[000cd91e]                           dc.w $0000
[000cd920]                           dc.w $0002
[000cd922]                           dc.w $0008
[000cd924]                           dc.w $0018
[000cd926]                           dc.w $0040
[000cd928]                           dc.w $0010
[000cd92a] 000cd22e                  dc.l A_3DBUTTON05
[000cd92e]                           dc.w $0000
[000cd930]                           dc.w $0000
[000cd932]                           dc.w $0018
[000cd934]                           dc.w $0006
_02_INFO_SCOPE:
[000cd936]                           dc.w $0004
[000cd938]                           dc.w $ffff
[000cd93a]                           dc.w $ffff
[000cd93c]                           dc.w $0018
[000cd93e]                           dc.w $0011
[000cd940]                           dc.w $0000
[000cd942] 000cd2ce                  dc.l A_CHECKBOX03
[000cd946]                           dc.w $0002
[000cd948]                           dc.w $0001
[000cd94a]                           dc.w $0008
[000cd94c]                           dc.w $0001
_02aINFO_SCOPE:
[000cd94e]                           dc.w $0000
[000cd950]                           dc.w $0000
[000cd952]                           dc.w $0000
[000cd954]                           dc.w $0000
[000cd956]                           dc.w $8000
[000cd958]                           dc.w $884c
[000cd95a]                           dc.w $0000
[000cd95c]                           dc.w $0000
[000cd95e]                           dc.w $0000
[000cd960]                           dc.w $0000
[000cd962]                           dc.w $0000
[000cd964]                           dc.w $0000
_04_INFO_SCOPE:
[000cd966]                           dc.w $0006
[000cd968]                           dc.w $ffff
[000cd96a]                           dc.w $ffff
[000cd96c]                           dc.w $0018
[000cd96e]                           dc.w $0011
[000cd970]                           dc.w $0000
[000cd972] 000cd2ae                  dc.l A_CHECKBOX01
[000cd976]                           dc.w $000d
[000cd978]                           dc.w $0001
[000cd97a]                           dc.w $0009
[000cd97c]                           dc.w $0001
_04aINFO_SCOPE:
[000cd97e]                           dc.w $0000
[000cd980]                           dc.w $0000
[000cd982]                           dc.w $0000
[000cd984]                           dc.w $0000
[000cd986]                           dc.w $8000
[000cd988]                           dc.w $8847
[000cd98a]                           dc.w $0000
[000cd98c]                           dc.w $0000
[000cd98e]                           dc.w $0000
[000cd990]                           dc.w $0000
[000cd992]                           dc.w $0000
[000cd994]                           dc.w $0000
_06_INFO_SCOPE:
[000cd996]                           dc.w $0008
[000cd998]                           dc.w $ffff
[000cd99a]                           dc.w $ffff
[000cd99c]                           dc.w $0018
[000cd99e]                           dc.w $4007
[000cd9a0]                           dc.w $0010
[000cd9a2] 000cd28e                  dc.l A_3DBUTTON09
[000cd9a6]                           dc.w $0001
[000cd9a8]                           dc.w $0003
[000cd9aa]                           dc.w $000a
[000cd9ac]                           dc.w $0002
_06aINFO_SCOPE:
[000cd9ae]                           dc.w $0000
[000cd9b0]                           dc.w $0000
[000cd9b2]                           dc.w $0000
[000cd9b4]                           dc.w $0000
[000cd9b6]                           dc.w $8000
[000cd9b8]                           dc.w $884f
[000cd9ba]                           dc.w $0000
[000cd9bc]                           dc.w $0000
[000cd9be]                           dc.w $0000
[000cd9c0]                           dc.w $0000
[000cd9c2]                           dc.w $0000
[000cd9c4]                           dc.w $0000
_08_INFO_SCOPE:
[000cd9c6]                           dc.w $0001
[000cd9c8]                           dc.w $ffff
[000cd9ca]                           dc.w $ffff
[000cd9cc]                           dc.w $0018
[000cd9ce]                           dc.w $4005
[000cd9d0]                           dc.w $0010
[000cd9d2] 000cd24e                  dc.l A_3DBUTTON06
[000cd9d6]                           dc.w $000d
[000cd9d8]                           dc.w $0003
[000cd9da]                           dc.w $000a
[000cd9dc]                           dc.w $0002
_08aINFO_SCOPE:
[000cd9de]                           dc.w $0000
[000cd9e0]                           dc.w $0000
[000cd9e2]                           dc.w $0000
[000cd9e4]                           dc.w $0000
[000cd9e6]                           dc.w $8020
[000cd9e8]                           dc.w $8841
[000cd9ea]                           dc.w $0000
[000cd9ec]                           dc.w $0000
[000cd9ee]                           dc.w $0000
[000cd9f0]                           dc.w $0000
[000cd9f2]                           dc.w $0000
[000cd9f4]                           dc.w $0000
LIST_NOT:
[000cd9f6]                           dc.w $ffff
[000cd9f8]                           dc.w $ffff
[000cd9fa]                           dc.w $ffff
[000cd9fc]                           dc.w $0014
[000cd9fe]                           dc.w $0060
[000cda00]                           dc.w $0000
[000cda02]                           dc.w $0000
[000cda04]                           dc.w $1142
[000cda06]                           dc.w $0000
[000cda08]                           dc.w $0000
[000cda0a]                           dc.w $0020
[000cda0c]                           dc.w $000c
WI_DIFF_TYPE:
[000cda0e]                           dc.w $0000
[000cda10]                           dc.w $0000
[000cda12] 00059dd0                  dc.l Awi_service
[000cda16] 00056c16                  dc.l Awi_selfcreate
[000cda1a] 00057428                  dc.l Awi_open
[000cda1e] 00055e94                  dc.l Awi_init
[000cda22] 000cd58e                  dc.l DIFF_TYPE
[000cda26]                           dc.w $0000
[000cda28]                           dc.w $0000
[000cda2a]                           dc.w $0000
[000cda2c]                           dc.w $0000
[000cda2e]                           dc.w $ffff
[000cda30]                           dc.w $200b
[000cda32]                           dc.w $0000
[000cda34]                           dc.w $0000
[000cda36]                           dc.w $0078
[000cda38]                           dc.w $0032
[000cda3a]                           dc.w $0000
[000cda3c]                           dc.w $0000
[000cda3e]                           dc.w $0000
[000cda40]                           dc.w $0000
[000cda42]                           dc.w $0000
[000cda44]                           dc.w $0000
[000cda46]                           dc.w $0000
[000cda48]                           dc.w $0000
[000cda4a]                           dc.w $ffff
[000cda4c]                           dc.w $ffff
[000cda4e]                           dc.w $ffff
[000cda50]                           dc.w $ffff
[000cda52]                           dc.w $0000
[000cda54]                           dc.w $0000
[000cda56]                           dc.w $f8f8
[000cda58] 000ccf0a                  dc.l TEXT_07
[000cda5c] 000cce6a                  dc.l TEXT_002
[000cda60]                           dc.w $2710
[000cda62]                           dc.w $0000
[000cda64]                           dc.w $0000
[000cda66]                           dc.w $ffff
[000cda68]                           dc.w $0000
[000cda6a]                           dc.w $0000
[000cda6c]                           dc.w $0000
[000cda6e]                           dc.w $0000
[000cda70] 0006b744                  dc.l Awi_keys
[000cda74] 00051852                  dc.l Awi_obchange
[000cda78] 00051c46                  dc.l Awi_redraw
[000cda7c] 000587a4                  dc.l Awi_topped
[000cda80] 00058362                  dc.l Awi_closed
[000cda84] 000587ec                  dc.l Awi_fulled
[000cda88] 0005217c                  dc.l Awi_arrowed
[000cda8c] 000524b4                  dc.l Awi_hslid
[000cda90] 0005255e                  dc.l Awi_vslid
[000cda94] 00058bb0                  dc.l Awi_sized
[000cda98] 00058d50                  dc.l Awi_moved
[000cda9c] 0005998a                  dc.l Awi_iconify
[000cdaa0] 00059c6c                  dc.l Awi_uniconify
[000cdaa4] 0005b5b6                  dc.l Awi_gemscript
[000cdaa8]                           dc.w $0000
[000cdaaa]                           dc.w $0000
[000cdaac]                           dc.w $0000
[000cdaae]                           dc.w $0000
WI_INFO_LIST:
[000cdab0]                           dc.w $0000
[000cdab2]                           dc.w $0000
[000cdab4] 00059dd0                  dc.l Awi_service
[000cdab8] 00056c16                  dc.l Awi_selfcreate
[000cdabc] 00057428                  dc.l Awi_open
[000cdac0] 00055e94                  dc.l Awi_init
[000cdac4] 000cd6c6                  dc.l INFO_LIST
[000cdac8]                           dc.w $0000
[000cdaca]                           dc.w $0000
[000cdacc]                           dc.w $0000
[000cdace]                           dc.w $0000
[000cdad0]                           dc.w $ffff
[000cdad2]                           dc.w $200b
[000cdad4]                           dc.w $0000
[000cdad6]                           dc.w $0000
[000cdad8]                           dc.w $0078
[000cdada]                           dc.w $0032
[000cdadc]                           dc.w $0000
[000cdade]                           dc.w $0000
[000cdae0]                           dc.w $0000
[000cdae2]                           dc.w $0000
[000cdae4]                           dc.w $0000
[000cdae6]                           dc.w $0000
[000cdae8]                           dc.w $0000
[000cdaea]                           dc.w $0000
[000cdaec]                           dc.w $ffff
[000cdaee]                           dc.w $ffff
[000cdaf0]                           dc.w $ffff
[000cdaf2]                           dc.w $ffff
[000cdaf4]                           dc.w $0000
[000cdaf6]                           dc.w $0000
[000cdaf8]                           dc.w $f8f8
[000cdafa] 000ccf53                  dc.l TEXT_13
[000cdafe] 000cce6a                  dc.l TEXT_002
[000cdb02]                           dc.w $2710
[000cdb04]                           dc.w $0000
[000cdb06]                           dc.w $0000
[000cdb08]                           dc.w $ffff
[000cdb0a]                           dc.w $0000
[000cdb0c]                           dc.w $0000
[000cdb0e]                           dc.w $0000
[000cdb10]                           dc.w $0000
[000cdb12] 0006b744                  dc.l Awi_keys
[000cdb16] 00051852                  dc.l Awi_obchange
[000cdb1a] 00051c46                  dc.l Awi_redraw
[000cdb1e] 000587a4                  dc.l Awi_topped
[000cdb22] 00058362                  dc.l Awi_closed
[000cdb26] 000587ec                  dc.l Awi_fulled
[000cdb2a] 0005217c                  dc.l Awi_arrowed
[000cdb2e] 000524b4                  dc.l Awi_hslid
[000cdb32] 0005255e                  dc.l Awi_vslid
[000cdb36] 00058bb0                  dc.l Awi_sized
[000cdb3a] 00058d50                  dc.l Awi_moved
[000cdb3e] 0005998a                  dc.l Awi_iconify
[000cdb42] 00059c6c                  dc.l Awi_uniconify
[000cdb46] 0005b5b6                  dc.l Awi_gemscript
[000cdb4a]                           dc.w $0000
[000cdb4c]                           dc.w $0000
[000cdb4e]                           dc.w $0000
[000cdb50]                           dc.w $0000
WI_INFO_LISTSELF:
[000cdb52]                           dc.w $0000
[000cdb54]                           dc.w $0000
[000cdb56] 00059dd0                  dc.l Awi_service
[000cdb5a] 00056c16                  dc.l Awi_selfcreate
[000cdb5e] 00057428                  dc.l Awi_open
[000cdb62] 00055e94                  dc.l Awi_init
[000cdb66] 000cd816                  dc.l INFO_LISTSELF
[000cdb6a]                           dc.w $0000
[000cdb6c]                           dc.w $0000
[000cdb6e]                           dc.w $0000
[000cdb70]                           dc.w $0000
[000cdb72]                           dc.w $ffff
[000cdb74]                           dc.w $200b
[000cdb76]                           dc.w $0000
[000cdb78]                           dc.w $0000
[000cdb7a]                           dc.w $0078
[000cdb7c]                           dc.w $0032
[000cdb7e]                           dc.w $0000
[000cdb80]                           dc.w $0000
[000cdb82]                           dc.w $0000
[000cdb84]                           dc.w $0000
[000cdb86]                           dc.w $0000
[000cdb88]                           dc.w $0000
[000cdb8a]                           dc.w $0000
[000cdb8c]                           dc.w $0000
[000cdb8e]                           dc.w $ffff
[000cdb90]                           dc.w $ffff
[000cdb92]                           dc.w $ffff
[000cdb94]                           dc.w $ffff
[000cdb96]                           dc.w $0000
[000cdb98]                           dc.w $0000
[000cdb9a]                           dc.w $f8f8
[000cdb9c] 000ccf38                  dc.l TEXT_09
[000cdba0] 000cce6a                  dc.l TEXT_002
[000cdba4]                           dc.w $2710
[000cdba6]                           dc.w $0000
[000cdba8]                           dc.w $0000
[000cdbaa]                           dc.w $ffff
[000cdbac]                           dc.w $0000
[000cdbae]                           dc.w $0000
[000cdbb0]                           dc.w $0000
[000cdbb2]                           dc.w $0000
[000cdbb4] 0006b744                  dc.l Awi_keys
[000cdbb8] 00051852                  dc.l Awi_obchange
[000cdbbc] 00051c46                  dc.l Awi_redraw
[000cdbc0] 000587a4                  dc.l Awi_topped
[000cdbc4] 00058362                  dc.l Awi_closed
[000cdbc8] 000587ec                  dc.l Awi_fulled
[000cdbcc] 0005217c                  dc.l Awi_arrowed
[000cdbd0] 000524b4                  dc.l Awi_hslid
[000cdbd4] 0005255e                  dc.l Awi_vslid
[000cdbd8] 00058bb0                  dc.l Awi_sized
[000cdbdc] 00058d50                  dc.l Awi_moved
[000cdbe0] 0005998a                  dc.l Awi_iconify
[000cdbe4] 00059c6c                  dc.l Awi_uniconify
[000cdbe8] 0005b5b6                  dc.l Awi_gemscript
[000cdbec]                           dc.w $0000
[000cdbee]                           dc.w $0000
[000cdbf0]                           dc.w $0000
[000cdbf2]                           dc.w $0000
WI_INFO_SCOPE:
[000cdbf4]                           dc.w $0000
[000cdbf6]                           dc.w $0000
[000cdbf8] 00059dd0                  dc.l Awi_service
[000cdbfc] 00056c16                  dc.l Awi_selfcreate
[000cdc00] 00057428                  dc.l Awi_open
[000cdc04] 00055e94                  dc.l Awi_init
[000cdc08] 000cd906                  dc.l INFO_SCOPE
[000cdc0c]                           dc.w $0000
[000cdc0e]                           dc.w $0000
[000cdc10]                           dc.w $0000
[000cdc12]                           dc.w $0000
[000cdc14]                           dc.w $ffff
[000cdc16]                           dc.w $200b
[000cdc18]                           dc.w $0000
[000cdc1a]                           dc.w $0000
[000cdc1c]                           dc.w $0078
[000cdc1e]                           dc.w $0032
[000cdc20]                           dc.w $0000
[000cdc22]                           dc.w $0000
[000cdc24]                           dc.w $0000
[000cdc26]                           dc.w $0000
[000cdc28]                           dc.w $0000
[000cdc2a]                           dc.w $0000
[000cdc2c]                           dc.w $0000
[000cdc2e]                           dc.w $0000
[000cdc30]                           dc.w $ffff
[000cdc32]                           dc.w $ffff
[000cdc34]                           dc.w $ffff
[000cdc36]                           dc.w $ffff
[000cdc38]                           dc.w $0000
[000cdc3a]                           dc.w $0000
[000cdc3c]                           dc.w $f8f8
[000cdc3e] 000ccf6f                  dc.l TEXT_14
[000cdc42] 000cce6a                  dc.l TEXT_002
[000cdc46]                           dc.w $2710
[000cdc48]                           dc.w $0000
[000cdc4a]                           dc.w $0000
[000cdc4c]                           dc.w $ffff
[000cdc4e]                           dc.w $0000
[000cdc50]                           dc.w $0000
[000cdc52]                           dc.w $0000
[000cdc54]                           dc.w $0000
[000cdc56] 0006b744                  dc.l Awi_keys
[000cdc5a] 00051852                  dc.l Awi_obchange
[000cdc5e] 00051c46                  dc.l Awi_redraw
[000cdc62] 000587a4                  dc.l Awi_topped
[000cdc66] 00058362                  dc.l Awi_closed
[000cdc6a] 000587ec                  dc.l Awi_fulled
[000cdc6e] 0005217c                  dc.l Awi_arrowed
[000cdc72] 000524b4                  dc.l Awi_hslid
[000cdc76] 0005255e                  dc.l Awi_vslid
[000cdc7a] 00058bb0                  dc.l Awi_sized
[000cdc7e] 00058d50                  dc.l Awi_moved
[000cdc82] 0005998a                  dc.l Awi_iconify
[000cdc86] 00059c6c                  dc.l Awi_uniconify
[000cdc8a] 0005b5b6                  dc.l Awi_gemscript
[000cdc8e]                           dc.w $0000
[000cdc90]                           dc.w $0000
[000cdc92]                           dc.w $0000
[000cdc94]                           dc.w $0000
WI_LIST:
[000cdc96]                           dc.w $0000
[000cdc98]                           dc.w $0000
[000cdc9a] 00033bde                  dc.l li_service
[000cdc9e] 00033a7e                  dc.l li_make
[000cdca2] 00057428                  dc.l Awi_open
[000cdca6] 000339d6                  dc.l li_init
[000cdcaa]                           dc.w $0000
[000cdcac]                           dc.w $0000
[000cdcae]                           dc.w $0000
[000cdcb0]                           dc.w $0000
[000cdcb2]                           dc.w $0000
[000cdcb4]                           dc.w $0000
[000cdcb6]                           dc.w $ffff
[000cdcb8]                           dc.w $61ff
[000cdcba]                           dc.w $0000
[000cdcbc]                           dc.w $0000
[000cdcbe]                           dc.w $0022
[000cdcc0]                           dc.w $000e
[000cdcc2]                           dc.w $0000
[000cdcc4]                           dc.w $0000
[000cdcc6]                           dc.w $0000
[000cdcc8]                           dc.w $0000
[000cdcca]                           dc.w $0000
[000cdccc]                           dc.w $0000
[000cdcce]                           dc.w $0000
[000cdcd0]                           dc.w $0000
[000cdcd2]                           dc.w $ffff
[000cdcd4]                           dc.w $ffff
[000cdcd6]                           dc.w $ffff
[000cdcd8]                           dc.w $ffff
[000cdcda]                           dc.w $0000
[000cdcdc]                           dc.w $0000
[000cdcde]                           dc.w $f8f8
[000cdce0] 000cce6a                  dc.l TEXT_002
[000cdce4] 000cce6a                  dc.l TEXT_002
[000cdce8]                           dc.w $2710
[000cdcea]                           dc.w $011b
[000cdcec]                           dc.w $0000
[000cdcee]                           dc.w $ffff
[000cdcf0]                           dc.w $0000
[000cdcf2]                           dc.w $0000
[000cdcf4] 000cd2ee                  dc.l MEN_LIST
[000cdcf8] 0006b744                  dc.l Awi_keys
[000cdcfc] 00051852                  dc.l Awi_obchange
[000cdd00] 00051c46                  dc.l Awi_redraw
[000cdd04] 000587a4                  dc.l Awi_topped
[000cdd08] 00058362                  dc.l Awi_closed
[000cdd0c] 000587ec                  dc.l Awi_fulled
[000cdd10] 0005217c                  dc.l Awi_arrowed
[000cdd14] 000524b4                  dc.l Awi_hslid
[000cdd18] 0005255e                  dc.l Awi_vslid
[000cdd1c] 00058bb0                  dc.l Awi_sized
[000cdd20] 00058d50                  dc.l Awi_moved
[000cdd24] 0005998a                  dc.l Awi_iconify
[000cdd28] 00059c6c                  dc.l Awi_uniconify
[000cdd2c] 0005b5b6                  dc.l Awi_gemscript
[000cdd30]                           dc.w $0000
[000cdd32]                           dc.w $0000
[000cdd34]                           dc.w $0000
[000cdd36]                           dc.w $0000
