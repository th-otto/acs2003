edoic_new:
[0003160a] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003160e] 594f                      subq.w     #4,a7
[00031610] 41f9 0010 ee4e            lea.l      ACSblk,a0
[00031616] 2250                      movea.l    (a0),a1
[00031618] 2469 0258                 movea.l    600(a1),a2
[0003161c] 266a 0014                 movea.l    20(a2),a3
[00031620] 2869 0240                 movea.l    576(a1),a4
[00031624] 4269 0248                 clr.w      584(a1)
[00031628] 4eb9 0004 7e2a            jsr        Adr_next
[0003162e] 3600                      move.w     d0,d3
[00031630] 6f44                      ble.s      $00031676
[00031632] 48c0                      ext.l      d0
[00031634] 2200                      move.l     d0,d1
[00031636] d281                      add.l      d1,d1
[00031638] d280                      add.l      d0,d1
[0003163a] e789                      lsl.l      #3,d1
[0003163c] 206c 0014                 movea.l    20(a4),a0
[00031640] 41f0 1818                 lea.l      24(a0,d1.l),a0
[00031644] 0c68 2720 0016            cmpi.w     #$2720,22(a0)
[0003164a] 662a                      bne.s      $00031676
[0003164c] 2ea8 000c                 move.l     12(a0),(a7)
[00031650] 2257                      movea.l    (a7),a1
[00031652] 43e9 0016                 lea.l      22(a1),a1
[00031656] 204b                      movea.l    a3,a0
[00031658] 7002                      moveq.l    #2,d0
[0003165a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031660] 72ff                      moveq.l    #-1,d1
[00031662] 7002                      moveq.l    #2,d0
[00031664] 204a                      movea.l    a2,a0
[00031666] 226a 0066                 movea.l    102(a2),a1
[0003166a] 4e91                      jsr        (a1)
[0003166c] 3003                      move.w     d3,d0
[0003166e] 204c                      movea.l    a4,a0
[00031670] 4eb9 0004 7f76            jsr        Adr_del
[00031676] 584f                      addq.w     #4,a7
[00031678] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003167c] 4e75                      rts
edoic_edit:
[0003167e] 2f0a                      move.l     a2,-(a7)
[00031680] 2f0b                      move.l     a3,-(a7)
[00031682] 514f                      subq.w     #8,a7
[00031684] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003168a] 2468 0258                 movea.l    600(a0),a2
[0003168e] 2652                      movea.l    (a2),a3
[00031690] 226a 0014                 movea.l    20(a2),a1
[00031694] 2069 003c                 movea.l    60(a1),a0
[00031698] 2250                      movea.l    (a0),a1
[0003169a] 2053                      movea.l    (a3),a0
[0003169c] 2068 002c                 movea.l    44(a0),a0
[000316a0] 4eb9 0003 337c            jsr        find_entry
[000316a6] 2008                      move.l     a0,d0
[000316a8] 671c                      beq.s      $000316C6
[000316aa] 006a 0004 0054            ori.w      #$0004,84(a2)
[000316b0] 2e93                      move.l     (a3),(a7)
[000316b2] 2f40 0004                 move.l     d0,4(a7)
[000316b6] 41d7                      lea.l      (a7),a0
[000316b8] 2279 000b 0cee            movea.l    $000B0CEE,a1
[000316be] 4e91                      jsr        (a1)
[000316c0] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[000316c6] 504f                      addq.w     #8,a7
[000316c8] 265f                      movea.l    (a7)+,a3
[000316ca] 245f                      movea.l    (a7)+,a2
[000316cc] 4e75                      rts
edoic_ok:
[000316ce] 48e7 003c                 movem.l    a2-a5,-(a7)
[000316d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000316d8] 2868 0258                 movea.l    600(a0),a4
[000316dc] 2a54                      movea.l    (a4),a5
[000316de] 2455                      movea.l    (a5),a2
[000316e0] 006a 0001 0006            ori.w      #$0001,6(a2)
[000316e6] 206d 0004                 movea.l    4(a5),a0
[000316ea] 2668 0004                 movea.l    4(a0),a3
[000316ee] 322d 000a                 move.w     10(a5),d1
[000316f2] 48c1                      ext.l      d1
[000316f4] 2001                      move.l     d1,d0
[000316f6] e788                      lsl.l      #3,d0
[000316f8] 9081                      sub.l      d1,d0
[000316fa] e788                      lsl.l      #3,d0
[000316fc] d7c0                      adda.l     d0,a3
[000316fe] 226c 0014                 movea.l    20(a4),a1
[00031702] 2a69 003c                 movea.l    60(a1),a5
[00031706] 2a55                      movea.l    (a5),a5
[00031708] 206a 002c                 movea.l    44(a2),a0
[0003170c] 224d                      movea.l    a5,a1
[0003170e] 4eb9 0003 337c            jsr        find_entry
[00031714] 2848                      movea.l    a0,a4
[00031716] 200c                      move.l     a4,d0
[00031718] 6610                      bne.s      $0003172A
[0003171a] 224d                      movea.l    a5,a1
[0003171c] 41f9 000c a72a            lea.l      ERR_IC_DEL,a0
[00031722] 4eb9 0006 b80c            jsr        alert_str
[00031728] 6020                      bra.s      $0003174A
[0003172a] 2a6b 0014                 movea.l    20(a3),a5
[0003172e] bbcc                      cmpa.l     a4,a5
[00031730] 6712                      beq.s      $00031744
[00031732] 526c 0036                 addq.w     #1,54(a4)
[00031736] 274c 0014                 move.l     a4,20(a3)
[0003173a] 224d                      movea.l    a5,a1
[0003173c] 204a                      movea.l    a2,a0
[0003173e] 4eb9 0003 4b40            jsr        del_icon
[00031744] 4eb9 0002 f27c            jsr        ed_abort
[0003174a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003174e] 4e75                      rts
set_icon:
[00031750] 48e7 0038                 movem.l    a2-a4,-(a7)
[00031754] 2648                      movea.l    a0,a3
[00031756] 49f9 000c a982            lea.l      sm,a4
[0003175c] 41ec ff10                 lea.l      -240(a4),a0
[00031760] 4eb9 0004 f064            jsr        Aob_create
[00031766] 2448                      movea.l    a0,a2
[00031768] 200a                      move.l     a2,d0
[0003176a] 6604                      bne.s      $00031770
[0003176c] 91c8                      suba.l     a0,a0
[0003176e] 6016                      bra.s      $00031786
[00031770] 266b 0014                 movea.l    20(a3),a3
[00031774] 43eb 0016                 lea.l      22(a3),a1
[00031778] 7002                      moveq.l    #2,d0
[0003177a] 204a                      movea.l    a2,a0
[0003177c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031782] 288a                      move.l     a2,(a4)
[00031784] 204c                      movea.l    a4,a0
[00031786] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003178a] 4e75                      rts
edoic_list:
[0003178c] 2f0a                      move.l     a2,-(a7)
[0003178e] 2f0b                      move.l     a3,-(a7)
[00031790] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031796] 2468 0258                 movea.l    600(a0),a2
[0003179a] 2052                      movea.l    (a2),a0
[0003179c] 006a 0004 0054            ori.w      #$0004,84(a2)
[000317a2] 47f9 000c e332            lea.l      list_icon,a3
[000317a8] 2690                      move.l     (a0),(a3)
[000317aa] 2250                      movea.l    (a0),a1
[000317ac] 2769 002c 0004            move.l     44(a1),4(a3)
[000317b2] 204b                      movea.l    a3,a0
[000317b4] 2279 000c dc9e            movea.l    $000CDC9E,a1
[000317ba] 4e91                      jsr        (a1)
[000317bc] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[000317c2] 265f                      movea.l    (a7)+,a3
[000317c4] 245f                      movea.l    (a7)+,a2
[000317c6] 4e75                      rts
