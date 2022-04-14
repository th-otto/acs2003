editte_ok:
[0002321a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023220] 2068 0258                 movea.l    600(a0),a0
[00023224] 4eb9 0002 335a            jsr        term
[0002322a] 4e75                      rts
tedi_make:
[0002322c] 48e7 0038                 movem.l    a2-a4,-(a7)
[00023230] 594f                      subq.w     #4,a7
[00023232] 2448                      movea.l    a0,a2
[00023234] 266a 0004                 movea.l    4(a2),a3
[00023238] 286b 0012                 movea.l    18(a3),a4
[0002323c] 200c                      move.l     a4,d0
[0002323e] 670a                      beq.s      $0002324A
[00023240] 204c                      movea.l    a4,a0
[00023242] 4eb9 0005 6bea            jsr        Awi_show
[00023248] 6074                      bra.s      $000232BE
[0002324a] 7008                      moveq.l    #8,d0
[0002324c] 4eb9 0004 c608            jsr        Ax_malloc
[00023252] 2e88                      move.l     a0,(a7)
[00023254] 2008                      move.l     a0,d0
[00023256] 6762                      beq.s      $000232BA
[00023258] 2092                      move.l     (a2),(a0)
[0002325a] 216a 0004 0004            move.l     4(a2),4(a0)
[00023260] 43eb 0016                 lea.l      22(a3),a1
[00023264] 23c9 000b 39e6            move.l     a1,$000B39E6
[0002326a] 2079 000b 39f2            movea.l    $000B39F2,a0
[00023270] 2149 0008                 move.l     a1,8(a0)
[00023274] 41f9 000b 3998            lea.l      WI_TEDI,a0
[0002327a] 4eb9 0005 7052            jsr        Awi_create
[00023280] 2848                      movea.l    a0,a4
[00023282] 200c                      move.l     a4,d0
[00023284] 6734                      beq.s      $000232BA
[00023286] 2252                      movea.l    (a2),a1
[00023288] 4869 0168                 pea.l      360(a1)
[0002328c] 43eb 003a                 lea.l      58(a3),a1
[00023290] 4eb9 0001 6372            jsr        wi_pos
[00023296] 584f                      addq.w     #4,a7
[00023298] 2897                      move.l     (a7),(a4)
[0002329a] 274c 0012                 move.l     a4,18(a3)
[0002329e] 204c                      movea.l    a4,a0
[000232a0] 4eb9 0002 330e            jsr        set_tedi
[000232a6] 204c                      movea.l    a4,a0
[000232a8] 226c 000c                 movea.l    12(a4),a1
[000232ac] 4e91                      jsr        (a1)
[000232ae] 4a40                      tst.w      d0
[000232b0] 670c                      beq.s      $000232BE
[000232b2] 204c                      movea.l    a4,a0
[000232b4] 4eb9 0002 335a            jsr        term
[000232ba] 91c8                      suba.l     a0,a0
[000232bc] 6002                      bra.s      $000232C0
[000232be] 204c                      movea.l    a4,a0
[000232c0] 584f                      addq.w     #4,a7
[000232c2] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000232c6] 4e75                      rts
tedi_service:
[000232c8] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000232cc] 2448                      movea.l    a0,a2
[000232ce] 3600                      move.w     d0,d3
[000232d0] 2849                      movea.l    a1,a4
[000232d2] 2650                      movea.l    (a0),a3
[000232d4] 5540                      subq.w     #2,d0
[000232d6] 6708                      beq.s      $000232E0
[000232d8] 907c 270e                 sub.w      #$270E,d0
[000232dc] 670c                      beq.s      $000232EA
[000232de] 6018                      bra.s      $000232F8
[000232e0] 204a                      movea.l    a2,a0
[000232e2] 4eb9 0002 335a            jsr        term
[000232e8] 601c                      bra.s      $00023306
[000232ea] 226b 0004                 movea.l    4(a3),a1
[000232ee] 204a                      movea.l    a2,a0
[000232f0] 4eb9 0001 60ea            jsr        new_name
[000232f6] 600e                      bra.s      $00023306
[000232f8] 224c                      movea.l    a4,a1
[000232fa] 3003                      move.w     d3,d0
[000232fc] 204a                      movea.l    a2,a0
[000232fe] 4eb9 0005 9dd0            jsr        Awi_service
[00023304] 6002                      bra.s      $00023308
[00023306] 7001                      moveq.l    #1,d0
[00023308] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0002330c] 4e75                      rts
set_tedi:
[0002330e] 2f0a                      move.l     a2,-(a7)
[00023310] 2f0b                      move.l     a3,-(a7)
[00023312] 2250                      movea.l    (a0),a1
[00023314] 2468 0014                 movea.l    20(a0),a2
[00023318] 2069 0004                 movea.l    4(a1),a0
[0002331c] 2668 0004                 movea.l    4(a0),a3
[00023320] 2253                      movea.l    (a3),a1
[00023322] 2269 0004                 movea.l    4(a1),a1
[00023326] 7003                      moveq.l    #3,d0
[00023328] 204a                      movea.l    a2,a0
[0002332a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00023330] 206b 0004                 movea.l    4(a3),a0
[00023334] 2268 0004                 movea.l    4(a0),a1
[00023338] 7005                      moveq.l    #5,d0
[0002333a] 204a                      movea.l    a2,a0
[0002333c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00023342] 206b 0008                 movea.l    8(a3),a0
[00023346] 2268 0004                 movea.l    4(a0),a1
[0002334a] 7007                      moveq.l    #7,d0
[0002334c] 204a                      movea.l    a2,a0
[0002334e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00023354] 265f                      movea.l    (a7)+,a3
[00023356] 245f                      movea.l    (a7)+,a2
[00023358] 4e75                      rts
term:
[0002335a] 2f0a                      move.l     a2,-(a7)
[0002335c] 2f0b                      move.l     a3,-(a7)
[0002335e] 2448                      movea.l    a0,a2
[00023360] 006a 0100 0056            ori.w      #$0100,86(a2)
[00023366] 2650                      movea.l    (a0),a3
[00023368] 226b 0004                 movea.l    4(a3),a1
[0002336c] 42a9 0012                 clr.l      18(a1)
[00023370] 302a 0056                 move.w     86(a2),d0
[00023374] c07c 0800                 and.w      #$0800,d0
[00023378] 6716                      beq.s      $00023390
[0002337a] 43ea 002c                 lea.l      44(a2),a1
[0002337e] 206b 0004                 movea.l    4(a3),a0
[00023382] 41e8 003a                 lea.l      58(a0),a0
[00023386] 7008                      moveq.l    #8,d0
[00023388] 4eb9 0008 3500            jsr        memcpy
[0002338e] 6014                      bra.s      $000233A4
[00023390] 7008                      moveq.l    #8,d0
[00023392] 43ea 0024                 lea.l      36(a2),a1
[00023396] 206b 0004                 movea.l    4(a3),a0
[0002339a] 41e8 003a                 lea.l      58(a0),a0
[0002339e] 4eb9 0008 3500            jsr        memcpy
[000233a4] 204b                      movea.l    a3,a0
[000233a6] 4eb9 0004 c7c8            jsr        Ax_free
[000233ac] 204a                      movea.l    a2,a0
[000233ae] 4eb9 0005 8362            jsr        Awi_closed
[000233b4] 204a                      movea.l    a2,a0
[000233b6] 4eb9 0005 85f2            jsr        Awi_delete
[000233bc] 265f                      movea.l    (a7)+,a3
[000233be] 245f                      movea.l    (a7)+,a2
[000233c0] 4e75                      rts
