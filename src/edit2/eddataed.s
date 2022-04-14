editdat_abort:
[0001d31e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001d324] 2068 0258                 movea.l    600(a0),a0
[0001d328] 4eb9 0001 d418            jsr        term
[0001d32e] 4e75                      rts
dt_make:
[0001d330] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001d334] 594f                      subq.w     #4,a7
[0001d336] 2448                      movea.l    a0,a2
[0001d338] 266a 0004                 movea.l    4(a2),a3
[0001d33c] 286b 0012                 movea.l    18(a3),a4
[0001d340] 200c                      move.l     a4,d0
[0001d342] 670a                      beq.s      $0001D34E
[0001d344] 204c                      movea.l    a4,a0
[0001d346] 4eb9 0005 6bea            jsr        Awi_show
[0001d34c] 6076                      bra.s      $0001D3C4
[0001d34e] 7008                      moveq.l    #8,d0
[0001d350] 4eb9 0004 c608            jsr        Ax_malloc
[0001d356] 2e88                      move.l     a0,(a7)
[0001d358] 2008                      move.l     a0,d0
[0001d35a] 6764                      beq.s      $0001D3C0
[0001d35c] 224a                      movea.l    a2,a1
[0001d35e] 7008                      moveq.l    #8,d0
[0001d360] 4eb9 0008 3500            jsr        memcpy
[0001d366] 41eb 0016                 lea.l      22(a3),a0
[0001d36a] 23c8 000a 9476            move.l     a0,$000A9476
[0001d370] 2279 000a 9482            movea.l    $000A9482,a1
[0001d376] 2348 0008                 move.l     a0,8(a1)
[0001d37a] 41f9 000a 9428            lea.l      WI_DATA,a0
[0001d380] 4eb9 0005 7052            jsr        Awi_create
[0001d386] 2848                      movea.l    a0,a4
[0001d388] 200c                      move.l     a4,d0
[0001d38a] 6734                      beq.s      $0001D3C0
[0001d38c] 2252                      movea.l    (a2),a1
[0001d38e] 4869 0168                 pea.l      360(a1)
[0001d392] 43eb 003a                 lea.l      58(a3),a1
[0001d396] 4eb9 0001 6372            jsr        wi_pos
[0001d39c] 584f                      addq.w     #4,a7
[0001d39e] 2897                      move.l     (a7),(a4)
[0001d3a0] 274c 0012                 move.l     a4,18(a3)
[0001d3a4] 204c                      movea.l    a4,a0
[0001d3a6] 4eb9 0001 d414            jsr        set_data
[0001d3ac] 204c                      movea.l    a4,a0
[0001d3ae] 226c 000c                 movea.l    12(a4),a1
[0001d3b2] 4e91                      jsr        (a1)
[0001d3b4] 4a40                      tst.w      d0
[0001d3b6] 670c                      beq.s      $0001D3C4
[0001d3b8] 204c                      movea.l    a4,a0
[0001d3ba] 4eb9 0001 d418            jsr        term
[0001d3c0] 91c8                      suba.l     a0,a0
[0001d3c2] 6002                      bra.s      $0001D3C6
[0001d3c4] 204c                      movea.l    a4,a0
[0001d3c6] 584f                      addq.w     #4,a7
[0001d3c8] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001d3cc] 4e75                      rts
dt_service:
[0001d3ce] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001d3d2] 2448                      movea.l    a0,a2
[0001d3d4] 3600                      move.w     d0,d3
[0001d3d6] 2849                      movea.l    a1,a4
[0001d3d8] 2650                      movea.l    (a0),a3
[0001d3da] 5540                      subq.w     #2,d0
[0001d3dc] 6708                      beq.s      $0001D3E6
[0001d3de] 907c 270e                 sub.w      #$270E,d0
[0001d3e2] 670c                      beq.s      $0001D3F0
[0001d3e4] 6018                      bra.s      $0001D3FE
[0001d3e6] 204a                      movea.l    a2,a0
[0001d3e8] 4eb9 0001 d418            jsr        term
[0001d3ee] 601c                      bra.s      $0001D40C
[0001d3f0] 226b 0004                 movea.l    4(a3),a1
[0001d3f4] 204a                      movea.l    a2,a0
[0001d3f6] 4eb9 0001 60ea            jsr        new_name
[0001d3fc] 600e                      bra.s      $0001D40C
[0001d3fe] 224c                      movea.l    a4,a1
[0001d400] 3003                      move.w     d3,d0
[0001d402] 204a                      movea.l    a2,a0
[0001d404] 4eb9 0005 9dd0            jsr        Awi_service
[0001d40a] 6002                      bra.s      $0001D40E
[0001d40c] 7001                      moveq.l    #1,d0
[0001d40e] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001d412] 4e75                      rts
set_data:
[0001d414] 2250                      movea.l    (a0),a1
[0001d416] 4e75                      rts
term:
[0001d418] 2f0a                      move.l     a2,-(a7)
[0001d41a] 2f0b                      move.l     a3,-(a7)
[0001d41c] 2448                      movea.l    a0,a2
[0001d41e] 006a 0100 0056            ori.w      #$0100,86(a2)
[0001d424] 2650                      movea.l    (a0),a3
[0001d426] 226b 0004                 movea.l    4(a3),a1
[0001d42a] 42a9 0012                 clr.l      18(a1)
[0001d42e] 302a 0056                 move.w     86(a2),d0
[0001d432] c07c 0800                 and.w      #$0800,d0
[0001d436] 6716                      beq.s      $0001D44E
[0001d438] 43ea 002c                 lea.l      44(a2),a1
[0001d43c] 206b 0004                 movea.l    4(a3),a0
[0001d440] 41e8 003a                 lea.l      58(a0),a0
[0001d444] 7008                      moveq.l    #8,d0
[0001d446] 4eb9 0008 3500            jsr        memcpy
[0001d44c] 6014                      bra.s      $0001D462
[0001d44e] 7008                      moveq.l    #8,d0
[0001d450] 43ea 0024                 lea.l      36(a2),a1
[0001d454] 206b 0004                 movea.l    4(a3),a0
[0001d458] 41e8 003a                 lea.l      58(a0),a0
[0001d45c] 4eb9 0008 3500            jsr        memcpy
[0001d462] 204b                      movea.l    a3,a0
[0001d464] 4eb9 0004 c7c8            jsr        Ax_free
[0001d46a] 204a                      movea.l    a2,a0
[0001d46c] 4eb9 0005 8362            jsr        Awi_closed
[0001d472] 204a                      movea.l    a2,a0
[0001d474] 4eb9 0005 85f2            jsr        Awi_delete
[0001d47a] 265f                      movea.l    (a7)+,a3
[0001d47c] 245f                      movea.l    (a7)+,a2
[0001d47e] 4e75                      rts
