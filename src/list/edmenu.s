add_men:
[00035770] 48e7 003c                 movem.l    a2-a5,-(a7)
[00035774] 2448                      movea.l    a0,a2
[00035776] 2849                      movea.l    a1,a4
[00035778] 006a 0001 0006            ori.w      #$0001,6(a2)
[0003577e] 266a 001c                 movea.l    28(a2),a3
[00035782] 7038                      moveq.l    #56,d0
[00035784] 204b                      movea.l    a3,a0
[00035786] 4eb9 0001 8028            jsr        objextent
[0003578c] 4a40                      tst.w      d0
[0003578e] 6610                      bne.s      $000357A0
[00035790] 224c                      movea.l    a4,a1
[00035792] 204a                      movea.l    a2,a0
[00035794] 4eb9 0003 57cc            jsr        copy_men
[0003579a] 2a48                      movea.l    a0,a5
[0003579c] 200d                      move.l     a5,d0
[0003579e] 6604                      bne.s      $000357A4
[000357a0] 91c8                      suba.l     a0,a0
[000357a2] 6022                      bra.s      $000357C6
[000357a4] 2f39 000c ec42            move.l     $000CEC42,-(a7)
[000357aa] 486c 0016                 pea.l      22(a4)
[000357ae] 224d                      movea.l    a5,a1
[000357b0] 204a                      movea.l    a2,a0
[000357b2] 4eb9 0001 81c6            jsr        objname
[000357b8] 504f                      addq.w     #8,a7
[000357ba] 224d                      movea.l    a5,a1
[000357bc] 204b                      movea.l    a3,a0
[000357be] 4eb9 0003 33b4            jsr        add_entry
[000357c4] 204d                      movea.l    a5,a0
[000357c6] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000357ca] 4e75                      rts
copy_men:
[000357cc] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[000357d0] 2648                      movea.l    a0,a3
[000357d2] 2449                      movea.l    a1,a2
[000357d4] 202a 000e                 move.l     14(a2),d0
[000357d8] 4eb9 0001 7fae            jsr        objmalloc
[000357de] 2848                      movea.l    a0,a4
[000357e0] 200c                      move.l     a4,d0
[000357e2] 6604                      bne.s      $000357E8
[000357e4] 91c8                      suba.l     a0,a0
[000357e6] 6046                      bra.s      $0003582E
[000357e8] 202a 000e                 move.l     14(a2),d0
[000357ec] 7238                      moveq.l    #56,d1
[000357ee] 4eb9 0008 3c5a            jsr        _uldiv
[000357f4] 2600                      move.l     d0,d3
[000357f6] 2a6a 0004                 movea.l    4(a2),a5
[000357fa] 2c6c 0004                 movea.l    4(a4),a6
[000357fe] 4244                      clr.w      d4
[00035800] 6020                      bra.s      $00035822
[00035802] 3204                      move.w     d4,d1
[00035804] 48c1                      ext.l      d1
[00035806] 2001                      move.l     d1,d0
[00035808] e788                      lsl.l      #3,d0
[0003580a] 9081                      sub.l      d1,d0
[0003580c] e788                      lsl.l      #3,d0
[0003580e] 4875 0800                 pea.l      0(a5,d0.l)
[00035812] 43f6 0800                 lea.l      0(a6,d0.l),a1
[00035816] 204b                      movea.l    a3,a0
[00035818] 4eb9 0002 cf48            jsr        copy_ob
[0003581e] 584f                      addq.w     #4,a7
[00035820] 5244                      addq.w     #1,d4
[00035822] b644                      cmp.w      d4,d3
[00035824] 6edc                      bgt.s      $00035802
[00035826] 296a 000e 000e            move.l     14(a2),14(a4)
[0003582c] 204c                      movea.l    a4,a0
[0003582e] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[00035832] 4e75                      rts
del_men:
[00035834] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00035838] 2448                      movea.l    a0,a2
[0003583a] 2649                      movea.l    a1,a3
[0003583c] 006a 0001 0006            ori.w      #$0001,6(a2)
[00035842] 536b 0036                 subq.w     #1,54(a3)
[00035846] 302b 0036                 move.w     54(a3),d0
[0003584a] 6e5e                      bgt.s      $000358AA
[0003584c] 286b 0012                 movea.l    18(a3),a4
[00035850] 220c                      move.l     a4,d1
[00035852] 670c                      beq.s      $00035860
[00035854] 2a6c 0004                 movea.l    4(a4),a5
[00035858] 204c                      movea.l    a4,a0
[0003585a] 7002                      moveq.l    #2,d0
[0003585c] 93c9                      suba.l     a1,a1
[0003585e] 4e95                      jsr        (a5)
[00035860] 202b 000e                 move.l     14(a3),d0
[00035864] 7238                      moveq.l    #56,d1
[00035866] 4eb9 0008 3c5a            jsr        _uldiv
[0003586c] 2600                      move.l     d0,d3
[0003586e] 286b 0004                 movea.l    4(a3),a4
[00035872] 4244                      clr.w      d4
[00035874] 601a                      bra.s      $00035890
[00035876] 3204                      move.w     d4,d1
[00035878] 48c1                      ext.l      d1
[0003587a] 2001                      move.l     d1,d0
[0003587c] e788                      lsl.l      #3,d0
[0003587e] 9081                      sub.l      d1,d0
[00035880] e788                      lsl.l      #3,d0
[00035882] 43f4 0800                 lea.l      0(a4,d0.l),a1
[00035886] 204a                      movea.l    a2,a0
[00035888] 4eb9 0002 d214            jsr        del_ob
[0003588e] 5244                      addq.w     #1,d4
[00035890] b644                      cmp.w      d4,d3
[00035892] 6ee2                      bgt.s      $00035876
[00035894] 224b                      movea.l    a3,a1
[00035896] 206a 001c                 movea.l    28(a2),a0
[0003589a] 4eb9 0003 3420            jsr        del_entry
[000358a0] 224b                      movea.l    a3,a1
[000358a2] 204a                      movea.l    a2,a0
[000358a4] 4eb9 0001 7f52            jsr        objfree
[000358aa] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[000358ae] 4e75                      rts
new_work:
[000358b0] 303c 2711                 move.w     #$2711,d0
[000358b4] 2279 000c 8d94            movea.l    $000C8D94,a1
[000358ba] 4eb9 0003 3dd6            jsr        work_icon
[000358c0] 4e75                      rts
