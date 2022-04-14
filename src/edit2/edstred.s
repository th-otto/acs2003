editstr_abort:
[000233c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000233c8] 2068 0258                 movea.l    600(a0),a0
[000233cc] 4eb9 0002 35f4            jsr        term
[000233d2] 4e75                      rts
editstr_ok:
[000233d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000233da] 2068 0258                 movea.l    600(a0),a0
[000233de] 4eb9 0002 33f6            jsr        acc_string
[000233e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000233ea] 2068 0258                 movea.l    600(a0),a0
[000233ee] 4eb9 0002 35f4            jsr        term
[000233f4] 4e75                      rts
acc_string:
[000233f6] 48e7 0038                 movem.l    a2-a4,-(a7)
[000233fa] 4fef fdf8                 lea.l      -520(a7),a7
[000233fe] 2450                      movea.l    (a0),a2
[00023400] 2252                      movea.l    (a2),a1
[00023402] 0069 0001 0006            ori.w      #$0001,6(a1)
[00023408] 2668 0014                 movea.l    20(a0),a3
[0002340c] 43d7                      lea.l      (a7),a1
[0002340e] 7003                      moveq.l    #3,d0
[00023410] 41eb 0048                 lea.l      72(a3),a0
[00023414] 4eb9 0006 a068            jsr        Auo_boxed
[0002341a] 43ef 0004                 lea.l      4(a7),a1
[0002341e] 7003                      moveq.l    #3,d0
[00023420] 41eb 0060                 lea.l      96(a3),a0
[00023424] 4eb9 0006 a068            jsr        Auo_boxed
[0002342a] 2257                      movea.l    (a7),a1
[0002342c] 41ef 0008                 lea.l      8(a7),a0
[00023430] 4eb9 0008 2f0c            jsr        strcpy
[00023436] 226f 0004                 movea.l    4(a7),a1
[0002343a] 4eb9 0008 2e42            jsr        strcat
[00023440] 41ef 0008                 lea.l      8(a7),a0
[00023444] 4eb9 0004 643c            jsr        Ast_create
[0002344a] 2848                      movea.l    a0,a4
[0002344c] 200c                      move.l     a4,d0
[0002344e] 6744                      beq.s      $00023494
[00023450] 226a 0004                 movea.l    4(a2),a1
[00023454] 2069 0004                 movea.l    4(a1),a0
[00023458] 4eb9 0004 c7c8            jsr        Ax_free
[0002345e] 206a 0004                 movea.l    4(a2),a0
[00023462] 214c 0004                 move.l     a4,4(a0)
[00023466] 204c                      movea.l    a4,a0
[00023468] 4eb9 0008 2f6c            jsr        strlen
[0002346e] 5280                      addq.l     #1,d0
[00023470] 206a 0004                 movea.l    4(a2),a0
[00023474] 2140 000a                 move.l     d0,10(a0)
[00023478] 206a 0004                 movea.l    4(a2),a0
[0002347c] 2140 000e                 move.l     d0,14(a0)
[00023480] 2052                      movea.l    (a2),a0
[00023482] 2268 0034                 movea.l    52(a0),a1
[00023486] 2069 0012                 movea.l    18(a1),a0
[0002348a] 2208                      move.l     a0,d1
[0002348c] 6706                      beq.s      $00023494
[0002348e] 0068 0020 0056            ori.w      #$0020,86(a0)
[00023494] 4fef 0208                 lea.l      520(a7),a7
[00023498] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002349c] 4e75                      rts
st_make:
[0002349e] 48e7 0038                 movem.l    a2-a4,-(a7)
[000234a2] 594f                      subq.w     #4,a7
[000234a4] 2448                      movea.l    a0,a2
[000234a6] 266a 0004                 movea.l    4(a2),a3
[000234aa] 286b 0012                 movea.l    18(a3),a4
[000234ae] 200c                      move.l     a4,d0
[000234b0] 670a                      beq.s      $000234BC
[000234b2] 204c                      movea.l    a4,a0
[000234b4] 4eb9 0005 6bea            jsr        Awi_show
[000234ba] 6072                      bra.s      $0002352E
[000234bc] 7008                      moveq.l    #8,d0
[000234be] 4eb9 0004 c608            jsr        Ax_malloc
[000234c4] 2e88                      move.l     a0,(a7)
[000234c6] 6762                      beq.s      $0002352A
[000234c8] 2092                      move.l     (a2),(a0)
[000234ca] 216a 0004 0004            move.l     4(a2),4(a0)
[000234d0] 43eb 0016                 lea.l      22(a3),a1
[000234d4] 23c9 000b 3da2            move.l     a1,$000B3DA2
[000234da] 2079 000b 3dae            movea.l    $000B3DAE,a0
[000234e0] 2149 0008                 move.l     a1,8(a0)
[000234e4] 41f9 000b 3d54            lea.l      WI_STRING,a0
[000234ea] 4eb9 0005 7052            jsr        Awi_create
[000234f0] 2848                      movea.l    a0,a4
[000234f2] 200c                      move.l     a4,d0
[000234f4] 6734                      beq.s      $0002352A
[000234f6] 2252                      movea.l    (a2),a1
[000234f8] 4869 0168                 pea.l      360(a1)
[000234fc] 43eb 003a                 lea.l      58(a3),a1
[00023500] 4eb9 0001 6372            jsr        wi_pos
[00023506] 584f                      addq.w     #4,a7
[00023508] 2897                      move.l     (a7),(a4)
[0002350a] 274c 0012                 move.l     a4,18(a3)
[0002350e] 204c                      movea.l    a4,a0
[00023510] 4eb9 0002 3584            jsr        set_string
[00023516] 204c                      movea.l    a4,a0
[00023518] 226c 000c                 movea.l    12(a4),a1
[0002351c] 4e91                      jsr        (a1)
[0002351e] 4a40                      tst.w      d0
[00023520] 670c                      beq.s      $0002352E
[00023522] 204c                      movea.l    a4,a0
[00023524] 4eb9 0002 35f4            jsr        term
[0002352a] 91c8                      suba.l     a0,a0
[0002352c] 6002                      bra.s      $00023530
[0002352e] 204c                      movea.l    a4,a0
[00023530] 584f                      addq.w     #4,a7
[00023532] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00023536] 4e75                      rts
st_service:
[00023538] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002353c] 2448                      movea.l    a0,a2
[0002353e] 3600                      move.w     d0,d3
[00023540] 2849                      movea.l    a1,a4
[00023542] 2650                      movea.l    (a0),a3
[00023544] 5540                      subq.w     #2,d0
[00023546] 6708                      beq.s      $00023550
[00023548] 907c 270e                 sub.w      #$270E,d0
[0002354c] 6712                      beq.s      $00023560
[0002354e] 601e                      bra.s      $0002356E
[00023550] 204a                      movea.l    a2,a0
[00023552] 6100 fea2                 bsr        acc_string
[00023556] 204a                      movea.l    a2,a0
[00023558] 4eb9 0002 35f4            jsr        term
[0002355e] 601c                      bra.s      $0002357C
[00023560] 226b 0004                 movea.l    4(a3),a1
[00023564] 204a                      movea.l    a2,a0
[00023566] 4eb9 0001 60ea            jsr        new_name
[0002356c] 600e                      bra.s      $0002357C
[0002356e] 224c                      movea.l    a4,a1
[00023570] 3003                      move.w     d3,d0
[00023572] 204a                      movea.l    a2,a0
[00023574] 4eb9 0005 9dd0            jsr        Awi_service
[0002357a] 6002                      bra.s      $0002357E
[0002357c] 7001                      moveq.l    #1,d0
[0002357e] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00023582] 4e75                      rts
set_string:
[00023584] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00023588] 4fef ff00                 lea.l      -256(a7),a7
[0002358c] 2250                      movea.l    (a0),a1
[0002358e] 2468 0014                 movea.l    20(a0),a2
[00023592] 2069 0004                 movea.l    4(a1),a0
[00023596] 2668 0004                 movea.l    4(a0),a3
[0002359a] 204b                      movea.l    a3,a0
[0002359c] 4eb9 0008 2f6c            jsr        strlen
[000235a2] 2600                      move.l     d0,d3
[000235a4] b67c 00ff                 cmp.w      #$00FF,d3
[000235a8] 6f1c                      ble.s      $000235C6
[000235aa] 203c 0000 00ff            move.l     #$000000FF,d0
[000235b0] 43eb 00ff                 lea.l      255(a3),a1
[000235b4] 41d7                      lea.l      (a7),a0
[000235b6] 4eb9 0008 2fd6            jsr        strncpy
[000235bc] 422f 00ff                 clr.b      255(a7)
[000235c0] 363c 00ff                 move.w     #$00FF,d3
[000235c4] 6002                      bra.s      $000235C8
[000235c6] 4217                      clr.b      (a7)
[000235c8] 2f0b                      move.l     a3,-(a7)
[000235ca] 3f03                      move.w     d3,-(a7)
[000235cc] 43f9 000b 3df6            lea.l      $000B3DF6,a1
[000235d2] 7003                      moveq.l    #3,d0
[000235d4] 204a                      movea.l    a2,a0
[000235d6] 4eb9 0005 0f94            jsr        Aob_printf
[000235dc] 5c4f                      addq.w     #6,a7
[000235de] 43d7                      lea.l      (a7),a1
[000235e0] 7004                      moveq.l    #4,d0
[000235e2] 204a                      movea.l    a2,a0
[000235e4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000235ea] 4fef 0100                 lea.l      256(a7),a7
[000235ee] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000235f2] 4e75                      rts
term:
[000235f4] 2f0a                      move.l     a2,-(a7)
[000235f6] 2f0b                      move.l     a3,-(a7)
[000235f8] 2448                      movea.l    a0,a2
[000235fa] 006a 0100 0056            ori.w      #$0100,86(a2)
[00023600] 2650                      movea.l    (a0),a3
[00023602] 226b 0004                 movea.l    4(a3),a1
[00023606] 42a9 0012                 clr.l      18(a1)
[0002360a] 302a 0056                 move.w     86(a2),d0
[0002360e] c07c 0800                 and.w      #$0800,d0
[00023612] 6716                      beq.s      $0002362A
[00023614] 43ea 002c                 lea.l      44(a2),a1
[00023618] 206b 0004                 movea.l    4(a3),a0
[0002361c] 41e8 003a                 lea.l      58(a0),a0
[00023620] 7008                      moveq.l    #8,d0
[00023622] 4eb9 0008 3500            jsr        memcpy
[00023628] 6014                      bra.s      $0002363E
[0002362a] 7008                      moveq.l    #8,d0
[0002362c] 43ea 0024                 lea.l      36(a2),a1
[00023630] 206b 0004                 movea.l    4(a3),a0
[00023634] 41e8 003a                 lea.l      58(a0),a0
[00023638] 4eb9 0008 3500            jsr        memcpy
[0002363e] 204b                      movea.l    a3,a0
[00023640] 4eb9 0004 c7c8            jsr        Ax_free
[00023646] 204a                      movea.l    a2,a0
[00023648] 4eb9 0005 8362            jsr        Awi_closed
[0002364e] 204a                      movea.l    a2,a0
[00023650] 4eb9 0005 85f2            jsr        Awi_delete
[00023656] 265f                      movea.l    (a7)+,a3
[00023658] 245f                      movea.l    (a7)+,a2
[0002365a] 4e75                      rts
