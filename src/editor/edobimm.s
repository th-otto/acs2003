edoim_new:
[000317c8] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000317cc] 594f                      subq.w     #4,a7
[000317ce] 41f9 0010 ee4e            lea.l      ACSblk,a0
[000317d4] 2250                      movea.l    (a0),a1
[000317d6] 2469 0258                 movea.l    600(a1),a2
[000317da] 266a 0014                 movea.l    20(a2),a3
[000317de] 2869 0240                 movea.l    576(a1),a4
[000317e2] 4269 0248                 clr.w      584(a1)
[000317e6] 4eb9 0004 7e2a            jsr        Adr_next
[000317ec] 3600                      move.w     d0,d3
[000317ee] 6f50                      ble.s      $00031840
[000317f0] 48c0                      ext.l      d0
[000317f2] 2200                      move.l     d0,d1
[000317f4] d281                      add.l      d1,d1
[000317f6] d280                      add.l      d0,d1
[000317f8] e789                      lsl.l      #3,d1
[000317fa] 206c 0014                 movea.l    20(a4),a0
[000317fe] 41f0 1818                 lea.l      24(a0,d1.l),a0
[00031802] 0c68 2721 0016            cmpi.w     #$2721,22(a0)
[00031808] 6636                      bne.s      $00031840
[0003180a] 2ea8 000c                 move.l     12(a0),(a7)
[0003180e] 4eb9 0005 1388            jsr        Awi_diaend
[00031814] 2257                      movea.l    (a7),a1
[00031816] 43e9 0016                 lea.l      22(a1),a1
[0003181a] 7002                      moveq.l    #2,d0
[0003181c] 204b                      movea.l    a3,a0
[0003181e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031824] 72ff                      moveq.l    #-1,d1
[00031826] 7002                      moveq.l    #2,d0
[00031828] 204a                      movea.l    a2,a0
[0003182a] 226a 0066                 movea.l    102(a2),a1
[0003182e] 4e91                      jsr        (a1)
[00031830] 4eb9 0005 147c            jsr        Awi_diastart
[00031836] 3003                      move.w     d3,d0
[00031838] 204c                      movea.l    a4,a0
[0003183a] 4eb9 0004 7f76            jsr        Adr_del
[00031840] 584f                      addq.w     #4,a7
[00031842] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00031846] 4e75                      rts
edoim_edit:
[00031848] 2f0a                      move.l     a2,-(a7)
[0003184a] 2f0b                      move.l     a3,-(a7)
[0003184c] 514f                      subq.w     #8,a7
[0003184e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031854] 2468 0258                 movea.l    600(a0),a2
[00031858] 2652                      movea.l    (a2),a3
[0003185a] 226a 0014                 movea.l    20(a2),a1
[0003185e] 2069 003c                 movea.l    60(a1),a0
[00031862] 2250                      movea.l    (a0),a1
[00031864] 2053                      movea.l    (a3),a0
[00031866] 2068 0030                 movea.l    48(a0),a0
[0003186a] 4eb9 0003 337c            jsr        find_entry
[00031870] 2008                      move.l     a0,d0
[00031872] 671c                      beq.s      $00031890
[00031874] 006a 0004 0054            ori.w      #$0004,84(a2)
[0003187a] 2e93                      move.l     (a3),(a7)
[0003187c] 2f40 0004                 move.l     d0,4(a7)
[00031880] 41d7                      lea.l      (a7),a0
[00031882] 2279 000b 1d66            movea.l    $000B1D66,a1
[00031888] 4e91                      jsr        (a1)
[0003188a] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[00031890] 504f                      addq.w     #8,a7
[00031892] 265f                      movea.l    (a7)+,a3
[00031894] 245f                      movea.l    (a7)+,a2
[00031896] 4e75                      rts
edoim_ok:
[00031898] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003189c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000318a2] 2868 0258                 movea.l    600(a0),a4
[000318a6] 2a54                      movea.l    (a4),a5
[000318a8] 2455                      movea.l    (a5),a2
[000318aa] 006a 0001 0006            ori.w      #$0001,6(a2)
[000318b0] 206d 0004                 movea.l    4(a5),a0
[000318b4] 2668 0004                 movea.l    4(a0),a3
[000318b8] 322d 000a                 move.w     10(a5),d1
[000318bc] 48c1                      ext.l      d1
[000318be] 2001                      move.l     d1,d0
[000318c0] e788                      lsl.l      #3,d0
[000318c2] 9081                      sub.l      d1,d0
[000318c4] e788                      lsl.l      #3,d0
[000318c6] d7c0                      adda.l     d0,a3
[000318c8] 226c 0014                 movea.l    20(a4),a1
[000318cc] 2a69 003c                 movea.l    60(a1),a5
[000318d0] 2a55                      movea.l    (a5),a5
[000318d2] 206a 0030                 movea.l    48(a2),a0
[000318d6] 224d                      movea.l    a5,a1
[000318d8] 4eb9 0003 337c            jsr        find_entry
[000318de] 2848                      movea.l    a0,a4
[000318e0] 200c                      move.l     a4,d0
[000318e2] 6610                      bne.s      $000318F4
[000318e4] 224d                      movea.l    a5,a1
[000318e6] 41f9 000c a99a            lea.l      ERR_IM_DEL,a0
[000318ec] 4eb9 0006 b80c            jsr        alert_str
[000318f2] 6020                      bra.s      $00031914
[000318f4] 2a6b 0014                 movea.l    20(a3),a5
[000318f8] bbcc                      cmpa.l     a4,a5
[000318fa] 6712                      beq.s      $0003190E
[000318fc] 526c 0036                 addq.w     #1,54(a4)
[00031900] 274c 0014                 move.l     a4,20(a3)
[00031904] 224d                      movea.l    a5,a1
[00031906] 204a                      movea.l    a2,a0
[00031908] 4eb9 0003 4d5a            jsr        del_image
[0003190e] 4eb9 0002 f27c            jsr        ed_abort
[00031914] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00031918] 4e75                      rts
set_image:
[0003191a] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003191e] 2648                      movea.l    a0,a3
[00031920] 49f9 000c abf2            lea.l      sm,a4
[00031926] 41ec ff10                 lea.l      -240(a4),a0
[0003192a] 4eb9 0004 f064            jsr        Aob_create
[00031930] 2448                      movea.l    a0,a2
[00031932] 200a                      move.l     a2,d0
[00031934] 6604                      bne.s      $0003193A
[00031936] 91c8                      suba.l     a0,a0
[00031938] 6016                      bra.s      $00031950
[0003193a] 266b 0014                 movea.l    20(a3),a3
[0003193e] 43eb 0016                 lea.l      22(a3),a1
[00031942] 7002                      moveq.l    #2,d0
[00031944] 204a                      movea.l    a2,a0
[00031946] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003194c] 288a                      move.l     a2,(a4)
[0003194e] 204c                      movea.l    a4,a0
[00031950] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00031954] 4e75                      rts
edoim_list:
[00031956] 2f0a                      move.l     a2,-(a7)
[00031958] 2f0b                      move.l     a3,-(a7)
[0003195a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031960] 2468 0258                 movea.l    600(a0),a2
[00031964] 2052                      movea.l    (a2),a0
[00031966] 006a 0004 0054            ori.w      #$0004,84(a2)
[0003196c] 47f9 000c e4d6            lea.l      list_image,a3
[00031972] 2690                      move.l     (a0),(a3)
[00031974] 2250                      movea.l    (a0),a1
[00031976] 2769 0030 0004            move.l     48(a1),4(a3)
[0003197c] 204b                      movea.l    a3,a0
[0003197e] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00031984] 4e91                      jsr        (a1)
[00031986] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[0003198c] 265f                      movea.l    (a7)+,a3
[0003198e] 245f                      movea.l    (a7)+,a2
[00031990] 4e75                      rts
