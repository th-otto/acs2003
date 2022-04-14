editus_ok:
[00022ff6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022ffc] 2068 0258                 movea.l    600(a0),a0
[00023000] 4eb9 0002 31b2            jsr        term
[00023006] 4e75                      rts
user_make:
[00023008] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002300c] 594f                      subq.w     #4,a7
[0002300e] 2e88                      move.l     a0,(a7)
[00023010] 97cb                      suba.l     a3,a3
[00023012] 2868 0004                 movea.l    4(a0),a4
[00023016] 246c 0012                 movea.l    18(a4),a2
[0002301a] 200a                      move.l     a2,d0
[0002301c] 670c                      beq.s      $0002302A
[0002301e] 204a                      movea.l    a2,a0
[00023020] 4eb9 0005 6bea            jsr        Awi_show
[00023026] 6000 007c                 bra.w      $000230A4
[0002302a] 7008                      moveq.l    #8,d0
[0002302c] 4eb9 0004 c608            jsr        Ax_malloc
[00023032] 2648                      movea.l    a0,a3
[00023034] 200b                      move.l     a3,d0
[00023036] 6768                      beq.s      $000230A0
[00023038] 2257                      movea.l    (a7),a1
[0002303a] 2091                      move.l     (a1),(a0)
[0002303c] 2769 0004 0004            move.l     4(a1),4(a3)
[00023042] 41ec 0016                 lea.l      22(a4),a0
[00023046] 23c8 000b 3264            move.l     a0,$000B3264
[0002304c] 2279 000b 3270            movea.l    $000B3270,a1
[00023052] 2348 0008                 move.l     a0,8(a1)
[00023056] 41f9 000b 3216            lea.l      WI_USER,a0
[0002305c] 4eb9 0005 7052            jsr        Awi_create
[00023062] 2448                      movea.l    a0,a2
[00023064] 200a                      move.l     a2,d0
[00023066] 6738                      beq.s      $000230A0
[00023068] 2257                      movea.l    (a7),a1
[0002306a] 2051                      movea.l    (a1),a0
[0002306c] 4868 0168                 pea.l      360(a0)
[00023070] 43ec 003a                 lea.l      58(a4),a1
[00023074] 204a                      movea.l    a2,a0
[00023076] 4eb9 0001 6372            jsr        wi_pos
[0002307c] 584f                      addq.w     #4,a7
[0002307e] 248b                      move.l     a3,(a2)
[00023080] 294a 0012                 move.l     a2,18(a4)
[00023084] 204a                      movea.l    a2,a0
[00023086] 4eb9 0002 30f4            jsr        set_user
[0002308c] 204a                      movea.l    a2,a0
[0002308e] 226a 000c                 movea.l    12(a2),a1
[00023092] 4e91                      jsr        (a1)
[00023094] 4a40                      tst.w      d0
[00023096] 670c                      beq.s      $000230A4
[00023098] 204a                      movea.l    a2,a0
[0002309a] 4eb9 0002 31b2            jsr        term
[000230a0] 91c8                      suba.l     a0,a0
[000230a2] 6002                      bra.s      $000230A6
[000230a4] 204a                      movea.l    a2,a0
[000230a6] 584f                      addq.w     #4,a7
[000230a8] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000230ac] 4e75                      rts
user_service:
[000230ae] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000230b2] 2448                      movea.l    a0,a2
[000230b4] 3600                      move.w     d0,d3
[000230b6] 2849                      movea.l    a1,a4
[000230b8] 2650                      movea.l    (a0),a3
[000230ba] 5540                      subq.w     #2,d0
[000230bc] 6708                      beq.s      $000230C6
[000230be] 907c 270e                 sub.w      #$270E,d0
[000230c2] 670c                      beq.s      $000230D0
[000230c4] 6018                      bra.s      $000230DE
[000230c6] 204a                      movea.l    a2,a0
[000230c8] 4eb9 0002 31b2            jsr        term
[000230ce] 601c                      bra.s      $000230EC
[000230d0] 226b 0004                 movea.l    4(a3),a1
[000230d4] 204a                      movea.l    a2,a0
[000230d6] 4eb9 0001 60ea            jsr        new_name
[000230dc] 600e                      bra.s      $000230EC
[000230de] 224c                      movea.l    a4,a1
[000230e0] 3003                      move.w     d3,d0
[000230e2] 204a                      movea.l    a2,a0
[000230e4] 4eb9 0005 9dd0            jsr        Awi_service
[000230ea] 6002                      bra.s      $000230EE
[000230ec] 7001                      moveq.l    #1,d0
[000230ee] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[000230f2] 4e75                      rts
set_user:
[000230f4] 48e7 0038                 movem.l    a2-a4,-(a7)
[000230f8] 594f                      subq.w     #4,a7
[000230fa] 2250                      movea.l    (a0),a1
[000230fc] 2ea8 0014                 move.l     20(a0),(a7)
[00023100] 2069 0004                 movea.l    4(a1),a0
[00023104] 2668 0004                 movea.l    4(a0),a3
[00023108] 2253                      movea.l    (a3),a1
[0002310a] 43e9 0016                 lea.l      22(a1),a1
[0002310e] 7008                      moveq.l    #8,d0
[00023110] 2057                      movea.l    (a7),a0
[00023112] 4eb9 0005 0fd8            jsr        Aob_puttext
[00023118] 226b 0004                 movea.l    4(a3),a1
[0002311c] 43e9 0016                 lea.l      22(a1),a1
[00023120] 7009                      moveq.l    #9,d0
[00023122] 2057                      movea.l    (a7),a0
[00023124] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002312a] 286b 0008                 movea.l    8(a3),a4
[0002312e] 200c                      move.l     a4,d0
[00023130] 6706                      beq.s      $00023138
[00023132] 45ec 0016                 lea.l      22(a4),a2
[00023136] 6006                      bra.s      $0002313E
[00023138] 45f9 000b 32b8            lea.l      $000B32B8,a2
[0002313e] 224a                      movea.l    a2,a1
[00023140] 700a                      moveq.l    #10,d0
[00023142] 2057                      movea.l    (a7),a0
[00023144] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002314a] 286b 000c                 movea.l    12(a3),a4
[0002314e] 200c                      move.l     a4,d0
[00023150] 6706                      beq.s      $00023158
[00023152] 45ec 0016                 lea.l      22(a4),a2
[00023156] 6006                      bra.s      $0002315E
[00023158] 45f9 000b 32b8            lea.l      $000B32B8,a2
[0002315e] 224a                      movea.l    a2,a1
[00023160] 700b                      moveq.l    #11,d0
[00023162] 2057                      movea.l    (a7),a0
[00023164] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002316a] 286b 0010                 movea.l    16(a3),a4
[0002316e] 200c                      move.l     a4,d0
[00023170] 6706                      beq.s      $00023178
[00023172] 45ec 0016                 lea.l      22(a4),a2
[00023176] 6006                      bra.s      $0002317E
[00023178] 45f9 000b 32b8            lea.l      $000B32B8,a2
[0002317e] 224a                      movea.l    a2,a1
[00023180] 700c                      moveq.l    #12,d0
[00023182] 2057                      movea.l    (a7),a0
[00023184] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002318a] 286b 0014                 movea.l    20(a3),a4
[0002318e] 200c                      move.l     a4,d0
[00023190] 6706                      beq.s      $00023198
[00023192] 45ec 0016                 lea.l      22(a4),a2
[00023196] 6006                      bra.s      $0002319E
[00023198] 45f9 000b 32b8            lea.l      $000B32B8,a2
[0002319e] 224a                      movea.l    a2,a1
[000231a0] 700d                      moveq.l    #13,d0
[000231a2] 2057                      movea.l    (a7),a0
[000231a4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000231aa] 584f                      addq.w     #4,a7
[000231ac] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000231b0] 4e75                      rts
term:
[000231b2] 2f0a                      move.l     a2,-(a7)
[000231b4] 2f0b                      move.l     a3,-(a7)
[000231b6] 2448                      movea.l    a0,a2
[000231b8] 006a 0100 0056            ori.w      #$0100,86(a2)
[000231be] 2650                      movea.l    (a0),a3
[000231c0] 226b 0004                 movea.l    4(a3),a1
[000231c4] 42a9 0012                 clr.l      18(a1)
[000231c8] 302a 0056                 move.w     86(a2),d0
[000231cc] c07c 0800                 and.w      #$0800,d0
[000231d0] 6716                      beq.s      $000231E8
[000231d2] 43ea 002c                 lea.l      44(a2),a1
[000231d6] 206b 0004                 movea.l    4(a3),a0
[000231da] 41e8 003a                 lea.l      58(a0),a0
[000231de] 7008                      moveq.l    #8,d0
[000231e0] 4eb9 0008 3500            jsr        memcpy
[000231e6] 6014                      bra.s      $000231FC
[000231e8] 7008                      moveq.l    #8,d0
[000231ea] 43ea 0024                 lea.l      36(a2),a1
[000231ee] 206b 0004                 movea.l    4(a3),a0
[000231f2] 41e8 003a                 lea.l      58(a0),a0
[000231f6] 4eb9 0008 3500            jsr        memcpy
[000231fc] 204b                      movea.l    a3,a0
[000231fe] 4eb9 0004 c7c8            jsr        Ax_free
[00023204] 204a                      movea.l    a2,a0
[00023206] 4eb9 0005 8362            jsr        Awi_closed
[0002320c] 204a                      movea.l    a2,a0
[0002320e] 4eb9 0005 85f2            jsr        Awi_delete
[00023214] 265f                      movea.l    (a7)+,a3
[00023216] 245f                      movea.l    (a7)+,a2
[00023218] 4e75                      rts
