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
[0002344e] 6744                      beq.s      acc_string_1
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
[0002348c] 6706                      beq.s      acc_string_1
[0002348e] 0068 0020 0056            ori.w      #$0020,86(a0)
acc_string_1:
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
[000234b0] 670a                      beq.s      st_make_1
[000234b2] 204c                      movea.l    a4,a0
[000234b4] 4eb9 0005 6bea            jsr        Awi_show
[000234ba] 6072                      bra.s      st_make_2
st_make_1:
[000234bc] 7008                      moveq.l    #8,d0
[000234be] 4eb9 0004 c608            jsr        Ax_malloc
[000234c4] 2e88                      move.l     a0,(a7)
[000234c6] 6762                      beq.s      st_make_3
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
[000234f4] 6734                      beq.s      st_make_3
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
[00023520] 670c                      beq.s      st_make_2
[00023522] 204c                      movea.l    a4,a0
[00023524] 4eb9 0002 35f4            jsr        term
st_make_3:
[0002352a] 91c8                      suba.l     a0,a0
[0002352c] 6002                      bra.s      st_make_4
st_make_2:
[0002352e] 204c                      movea.l    a4,a0
st_make_4:
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
[00023546] 6708                      beq.s      st_service_1
[00023548] 907c 270e                 sub.w      #$270E,d0
[0002354c] 6712                      beq.s      st_service_2
[0002354e] 601e                      bra.s      st_service_3
st_service_1:
[00023550] 204a                      movea.l    a2,a0
[00023552] 6100 fea2                 bsr        acc_string
[00023556] 204a                      movea.l    a2,a0
[00023558] 4eb9 0002 35f4            jsr        term
[0002355e] 601c                      bra.s      st_service_4
st_service_2:
[00023560] 226b 0004                 movea.l    4(a3),a1
[00023564] 204a                      movea.l    a2,a0
[00023566] 4eb9 0001 60ea            jsr        new_name
[0002356c] 600e                      bra.s      st_service_4
st_service_3:
[0002356e] 224c                      movea.l    a4,a1
[00023570] 3003                      move.w     d3,d0
[00023572] 204a                      movea.l    a2,a0
[00023574] 4eb9 0005 9dd0            jsr        Awi_service
[0002357a] 6002                      bra.s      st_service_5
st_service_4:
[0002357c] 7001                      moveq.l    #1,d0
st_service_5:
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
[000235a8] 6f1c                      ble.s      set_string_1
[000235aa] 203c 0000 00ff            move.l     #$000000FF,d0
[000235b0] 43eb 00ff                 lea.l      255(a3),a1
[000235b4] 41d7                      lea.l      (a7),a0
[000235b6] 4eb9 0008 2fd6            jsr        strncpy
[000235bc] 422f 00ff                 clr.b      255(a7)
[000235c0] 363c 00ff                 move.w     #$00FF,d3
[000235c4] 6002                      bra.s      set_string_2
set_string_1:
[000235c6] 4217                      clr.b      (a7)
set_string_2:
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
[00023612] 6716                      beq.s      term_1
[00023614] 43ea 002c                 lea.l      44(a2),a1
[00023618] 206b 0004                 movea.l    4(a3),a0
[0002361c] 41e8 003a                 lea.l      58(a0),a0
[00023620] 7008                      moveq.l    #8,d0
[00023622] 4eb9 0008 3500            jsr        memcpy
[00023628] 6014                      bra.s      term_2
term_1:
[0002362a] 7008                      moveq.l    #8,d0
[0002362c] 43ea 0024                 lea.l      36(a2),a1
[00023630] 206b 0004                 movea.l    4(a3),a0
[00023634] 41e8 003a                 lea.l      58(a0),a0
[00023638] 4eb9 0008 3500            jsr        memcpy
term_2:
[0002363e] 204b                      movea.l    a3,a0
[00023640] 4eb9 0004 c7c8            jsr        Ax_free
[00023646] 204a                      movea.l    a2,a0
[00023648] 4eb9 0005 8362            jsr        Awi_closed
[0002364e] 204a                      movea.l    a2,a0
[00023650] 4eb9 0005 85f2            jsr        Awi_delete
[00023656] 265f                      movea.l    (a7)+,a3
[00023658] 245f                      movea.l    (a7)+,a2
[0002365a] 4e75                      rts

edwi_tme:
[0002365c] 2f0a                      move.l     a2,-(a7)
[0002365e] 2f0b                      move.l     a3,-(a7)
[00023660] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023666] 2468 0258                 movea.l    600(a0),a2
[0002366a] 2052                      movea.l    (a2),a0
[0002366c] 006a 0004 0054            ori.w      #$0004,84(a2)
[00023672] 47f9 000c ec32            lea.l      list_menu,a3
[00023678] 2690                      move.l     (a0),(a3)
[0002367a] 2250                      movea.l    (a0),a1
[0002367c] 2769 001c 0004            move.l     28(a1),4(a3)
[00023682] 204b                      movea.l    a3,a0
[00023684] 2279 000c dc9e            movea.l    $000CDC9E,a1
[0002368a] 4e91                      jsr        (a1)
[0002368c] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[00023692] 265f                      movea.l    (a7)+,a3
[00023694] 245f                      movea.l    (a7)+,a2
[00023696] 4e75                      rts

edwi_two:
[00023698] 2f0a                      move.l     a2,-(a7)
[0002369a] 2f0b                      move.l     a3,-(a7)
[0002369c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000236a2] 2468 0258                 movea.l    600(a0),a2
[000236a6] 2052                      movea.l    (a2),a0
[000236a8] 006a 0004 0054            ori.w      #$0004,84(a2)
[000236ae] 47f9 000c ed8c            lea.l      list_object,a3
[000236b4] 2690                      move.l     (a0),(a3)
[000236b6] 2250                      movea.l    (a0),a1
[000236b8] 2769 0018 0004            move.l     24(a1),4(a3)
[000236be] 204b                      movea.l    a3,a0
[000236c0] 2279 000c dc9e            movea.l    $000CDC9E,a1
[000236c6] 4e91                      jsr        (a1)
[000236c8] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[000236ce] 265f                      movea.l    (a7)+,a3
[000236d0] 245f                      movea.l    (a7)+,a2
[000236d2] 4e75                      rts

edwi_tic:
[000236d4] 2f0a                      move.l     a2,-(a7)
[000236d6] 2f0b                      move.l     a3,-(a7)
[000236d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000236de] 2468 0258                 movea.l    600(a0),a2
[000236e2] 2052                      movea.l    (a2),a0
[000236e4] 006a 0004 0054            ori.w      #$0004,84(a2)
[000236ea] 47f9 000c e332            lea.l      list_icon,a3
[000236f0] 2690                      move.l     (a0),(a3)
[000236f2] 2250                      movea.l    (a0),a1
[000236f4] 2769 002c 0004            move.l     44(a1),4(a3)
[000236fa] 204b                      movea.l    a3,a0
[000236fc] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00023702] 4e91                      jsr        (a1)
[00023704] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[0002370a] 265f                      movea.l    (a7)+,a3
[0002370c] 245f                      movea.l    (a7)+,a2
[0002370e] 4e75                      rts

edwi_ref:
[00023710] 2f0a                      move.l     a2,-(a7)
[00023712] 2f0b                      move.l     a3,-(a7)
[00023714] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002371a] 2468 0258                 movea.l    600(a0),a2
[0002371e] 2052                      movea.l    (a2),a0
[00023720] 006a 0004 0054            ori.w      #$0004,84(a2)
[00023726] 47f9 000c eefc            lea.l      list_reference,a3
[0002372c] 2690                      move.l     (a0),(a3)
[0002372e] 2250                      movea.l    (a0),a1
[00023730] 2769 003c 0004            move.l     60(a1),4(a3)
[00023736] 204b                      movea.l    a3,a0
[00023738] 2279 000c dc9e            movea.l    $000CDC9E,a1
[0002373e] 4e91                      jsr        (a1)
[00023740] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[00023746] 265f                      movea.l    (a7)+,a3
[00023748] 245f                      movea.l    (a7)+,a2
[0002374a] 4e75                      rts

edwi_ok:
[0002374c] 4240                      clr.w      d0
[0002374e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023754] 2068 0258                 movea.l    600(a0),a0
[00023758] 4eb9 0002 382a            jsr        acc_window
[0002375e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023764] 2068 0258                 movea.l    600(a0),a0
[00023768] 4eb9 0002 4842            jsr        term
[0002376e] 4e75                      rts

edwi_abort:
[00023770] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023776] 2068 0258                 movea.l    600(a0),a0
[0002377a] 4eb9 0002 4842            jsr        term
[00023780] 4e75                      rts

edwi_acc:
[00023782] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00023786] 594f                      subq.w     #4,a7
[00023788] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002378e] 2052                      movea.l    (a2),a0
[00023790] 2668 0258                 movea.l    600(a0),a3
[00023794] 286b 0014                 movea.l    20(a3),a4
[00023798] 4268 0248                 clr.w      584(a0)
[0002379c] 4eb9 0004 7e2a            jsr        Adr_next
[000237a2] 3600                      move.w     d0,d3
[000237a4] 6b00 007c                 bmi.w      edwi_acc_1
[000237a8] 48c0                      ext.l      d0
[000237aa] 2200                      move.l     d0,d1
[000237ac] d281                      add.l      d1,d1
[000237ae] d280                      add.l      d0,d1
[000237b0] e789                      lsl.l      #3,d1
[000237b2] 2052                      movea.l    (a2),a0
[000237b4] 2268 0240                 movea.l    576(a0),a1
[000237b8] 2069 0014                 movea.l    20(a1),a0
[000237bc] 41f0 1818                 lea.l      24(a0,d1.l),a0
[000237c0] 2ea8 000c                 move.l     12(a0),(a7)
[000237c4] 0c68 2710 0016            cmpi.w     #$2710,22(a0)
[000237ca] 6718                      beq.s      edwi_acc_2
[000237cc] 0c68 2711 0016            cmpi.w     #$2711,22(a0)
[000237d2] 6710                      beq.s      edwi_acc_2
[000237d4] 0c68 2720 0016            cmpi.w     #$2720,22(a0)
[000237da] 6708                      beq.s      edwi_acc_2
[000237dc] 0c68 271c 0016            cmpi.w     #$271C,22(a0)
[000237e2] 663e                      bne.s      edwi_acc_1
edwi_acc_2:
[000237e4] 4eb9 0005 1388            jsr        Awi_diaend
[000237ea] 2257                      movea.l    (a7),a1
[000237ec] 43e9 0016                 lea.l      22(a1),a1
[000237f0] 2052                      movea.l    (a2),a0
[000237f2] 3028 0260                 move.w     608(a0),d0
[000237f6] 204c                      movea.l    a4,a0
[000237f8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000237fe] 72ff                      moveq.l    #-1,d1
[00023800] 2052                      movea.l    (a2),a0
[00023802] 3028 0260                 move.w     608(a0),d0
[00023806] 226b 0066                 movea.l    102(a3),a1
[0002380a] 204b                      movea.l    a3,a0
[0002380c] 4e91                      jsr        (a1)
[0002380e] 4eb9 0005 147c            jsr        Awi_diastart
[00023814] 3003                      move.w     d3,d0
[00023816] 2052                      movea.l    (a2),a0
[00023818] 2068 0240                 movea.l    576(a0),a0
[0002381c] 4eb9 0004 7f76            jsr        Adr_del
edwi_acc_1:
[00023822] 584f                      addq.w     #4,a7
[00023824] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00023828] 4e75                      rts

acc_window:
[0002382a] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0002382e] 4fef ff64                 lea.l      -156(a7),a7
[00023832] 2f48 0098                 move.l     a0,152(a7)
[00023836] 3600                      move.w     d0,d3
[00023838] 43f9 000b 7a10            lea.l      $000B7A10,a1
[0002383e] 41ef 0042                 lea.l      66(a7),a0
[00023842] 720f                      moveq.l    #15,d1
acc_window_1:
[00023844] 20d9                      move.l     (a1)+,(a0)+
[00023846] 51c9 fffc                 dbf        d1,acc_window_1
[0002384a] 30d9                      move.w     (a1)+,(a0)+
[0002384c] 41f9 000b 7a52            lea.l      $000B7A52,a0
[00023852] 43d7                      lea.l      (a7),a1
[00023854] 720f                      moveq.l    #15,d1
acc_window_2:
[00023856] 22d8                      move.l     (a0)+,(a1)+
[00023858] 51c9 fffc                 dbf        d1,acc_window_2
[0002385c] 32d8                      move.w     (a0)+,(a1)+
[0002385e] 206f 0098                 movea.l    152(a7),a0
[00023862] 2050                      movea.l    (a0),a0
[00023864] 2a50                      movea.l    (a0),a5
[00023866] 2268 0004                 movea.l    4(a0),a1
[0002386a] 2469 0004                 movea.l    4(a1),a2
[0002386e] 206f 0098                 movea.l    152(a7),a0
[00023872] 2668 0014                 movea.l    20(a0),a3
[00023876] 49ef 0088                 lea.l      136(a7),a4
[0002387a] 224c                      movea.l    a4,a1
[0002387c] 7003                      moveq.l    #3,d0
[0002387e] 41eb 0948                 lea.l      2376(a3),a0
[00023882] 4eb9 0006 a068            jsr        Auo_boxed
[00023888] 2054                      movea.l    (a4),a0
[0002388a] 1010                      move.b     (a0),d0
[0002388c] 6612                      bne.s      acc_window_3
[0002388e] 4a43                      tst.w      d3
[00023890] 660e                      bne.s      acc_window_3
[00023892] 41f9 000b 3edd            lea.l      WARN_CREATE,a0
[00023898] 7001                      moveq.l    #1,d0
[0002389a] 4eb9 0005 a600            jsr        Awi_alert
acc_window_3:
[000238a0] 006d 0001 0006            ori.w      #$0001,6(a5)
[000238a6] 4240                      clr.w      d0
[000238a8] 7201                      moveq.l    #1,d1
[000238aa] c26b 0232                 and.w      562(a3),d1
[000238ae] 6704                      beq.s      acc_window_4
[000238b0] 807c 0002                 or.w       #$0002,d0
acc_window_4:
[000238b4] 7201                      moveq.l    #1,d1
[000238b6] c26b 03ca                 and.w      970(a3),d1
[000238ba] 6704                      beq.s      acc_window_5
[000238bc] 807c 1000                 or.w       #$1000,d0
acc_window_5:
[000238c0] 7201                      moveq.l    #1,d1
[000238c2] c26b 03b2                 and.w      946(a3),d1
[000238c6] 6704                      beq.s      acc_window_6
[000238c8] 807c 0008                 or.w       #$0008,d0
acc_window_6:
[000238cc] 7201                      moveq.l    #1,d1
[000238ce] c26b 039a                 and.w      922(a3),d1
[000238d2] 6704                      beq.s      acc_window_7
[000238d4] 807c 0001                 or.w       #$0001,d0
acc_window_7:
[000238d8] 7201                      moveq.l    #1,d1
[000238da] c26b 024a                 and.w      586(a3),d1
[000238de] 6704                      beq.s      acc_window_8
[000238e0] 807c 0010                 or.w       #$0010,d0
acc_window_8:
[000238e4] 7201                      moveq.l    #1,d1
[000238e6] c26b 0352                 and.w      850(a3),d1
[000238ea] 6704                      beq.s      acc_window_9
[000238ec] 807c 0004                 or.w       #$0004,d0
acc_window_9:
[000238f0] 7201                      moveq.l    #1,d1
[000238f2] c26b 02da                 and.w      730(a3),d1
[000238f6] 6704                      beq.s      acc_window_10
[000238f8] 807c 0020                 or.w       #$0020,d0
acc_window_10:
[000238fc] 7201                      moveq.l    #1,d1
[000238fe] c26b 033a                 and.w      826(a3),d1
[00023902] 6704                      beq.s      acc_window_11
[00023904] 807c 0040                 or.w       #$0040,d0
acc_window_11:
[00023908] 7201                      moveq.l    #1,d1
[0002390a] c26b 02f2                 and.w      754(a3),d1
[0002390e] 6704                      beq.s      acc_window_12
[00023910] 807c 0080                 or.w       #$0080,d0
acc_window_12:
[00023914] 7201                      moveq.l    #1,d1
[00023916] c26b 02c2                 and.w      706(a3),d1
[0002391a] 6704                      beq.s      acc_window_13
[0002391c] 807c 0400                 or.w       #$0400,d0
acc_window_13:
[00023920] 7201                      moveq.l    #1,d1
[00023922] c26b 02aa                 and.w      682(a3),d1
[00023926] 6704                      beq.s      acc_window_14
[00023928] 807c 0200                 or.w       #$0200,d0
acc_window_14:
[0002392c] 7201                      moveq.l    #1,d1
[0002392e] c26b 0292                 and.w      658(a3),d1
[00023932] 6704                      beq.s      acc_window_15
[00023934] 807c 0800                 or.w       #$0800,d0
acc_window_15:
[00023938] 7201                      moveq.l    #1,d1
[0002393a] c26b 0322                 and.w      802(a3),d1
[0002393e] 6704                      beq.s      acc_window_16
[00023940] 807c 0100                 or.w       #$0100,d0
acc_window_16:
[00023944] 7201                      moveq.l    #1,d1
[00023946] c26b 036a                 and.w      874(a3),d1
[0002394a] 6704                      beq.s      acc_window_17
[0002394c] 807c 4000                 or.w       #$4000,d0
acc_window_17:
[00023950] 7201                      moveq.l    #1,d1
[00023952] c26b 0382                 and.w      898(a3),d1
[00023956] 6704                      beq.s      acc_window_18
[00023958] 807c 2000                 or.w       #$2000,d0
acc_window_18:
[0002395c] 3540 0022                 move.w     d0,34(a2)
[00023960] 4240                      clr.w      d0
[00023962] 7201                      moveq.l    #1,d1
[00023964] c26b 03fa                 and.w      1018(a3),d1
[00023968] 6704                      beq.s      acc_window_19
[0002396a] 807c 0008                 or.w       #$0008,d0
acc_window_19:
[0002396e] 7201                      moveq.l    #1,d1
[00023970] c26b 042a                 and.w      1066(a3),d1
[00023974] 6704                      beq.s      acc_window_20
[00023976] 807c 0004                 or.w       #$0004,d0
acc_window_20:
[0002397a] 7201                      moveq.l    #1,d1
[0002397c] c26b 045a                 and.w      1114(a3),d1
[00023980] 6704                      beq.s      acc_window_21
[00023982] 807c 0001                 or.w       #$0001,d0
acc_window_21:
[00023986] 7201                      moveq.l    #1,d1
[00023988] c26b 048a                 and.w      1162(a3),d1
[0002398c] 6704                      beq.s      acc_window_22
[0002398e] 807c 0002                 or.w       #$0002,d0
acc_window_22:
[00023992] 7201                      moveq.l    #1,d1
[00023994] c26b 04ba                 and.w      1210(a3),d1
[00023998] 6704                      beq.s      acc_window_23
[0002399a] 807c 0010                 or.w       #$0010,d0
acc_window_23:
[0002399e] 7201                      moveq.l    #1,d1
[000239a0] c26b 04ea                 and.w      1258(a3),d1
[000239a4] 6704                      beq.s      acc_window_24
[000239a6] 807c 0100                 or.w       #$0100,d0
acc_window_24:
[000239aa] 3540 0054                 move.w     d0,84(a2)
[000239ae] 206f 0098                 movea.l    152(a7),a0
[000239b2] 2268 0014                 movea.l    20(a0),a1
[000239b6] 43e9 0150                 lea.l      336(a1),a1
[000239ba] 2f49 008c                 move.l     a1,140(a7)
[000239be] 224c                      movea.l    a4,a1
[000239c0] 206f 008c                 movea.l    140(a7),a0
[000239c4] 7003                      moveq.l    #3,d0
[000239c6] 4eb9 0003 71ba            jsr        Auo_slider
[000239cc] 486f 0086                 pea.l      134(a7)
[000239d0] 43f9 000b 7a94            lea.l      $000B7A94,a1
[000239d6] 2054                      movea.l    (a4),a0
[000239d8] 4eb9 0008 1b26            jsr        sscanf
[000239de] 584f                      addq.w     #4,a7
[000239e0] 206f 0098                 movea.l    152(a7),a0
[000239e4] 2268 0014                 movea.l    20(a0),a1
[000239e8] 43e9 0198                 lea.l      408(a1),a1
[000239ec] 2f49 008c                 move.l     a1,140(a7)
[000239f0] 224c                      movea.l    a4,a1
[000239f2] 7003                      moveq.l    #3,d0
[000239f4] 206f 008c                 movea.l    140(a7),a0
[000239f8] 4eb9 0003 71ba            jsr        Auo_slider
[000239fe] 486f 0084                 pea.l      132(a7)
[00023a02] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a08] 2054                      movea.l    (a4),a0
[00023a0a] 4eb9 0008 1b26            jsr        sscanf
[00023a10] 584f                      addq.w     #4,a7
[00023a12] 302f 0086                 move.w     134(a7),d0
[00023a16] 4440                      neg.w      d0
[00023a18] 322f 0084                 move.w     132(a7),d1
[00023a1c] 4441                      neg.w      d1
[00023a1e] e149                      lsl.w      #8,d1
[00023a20] 827c 00ff                 or.w       #$00FF,d1
[00023a24] c041                      and.w      d1,d0
[00023a26] 3540 0048                 move.w     d0,72(a2)
[00023a2a] 486a 0024                 pea.l      36(a2)
[00023a2e] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a34] 204b                      movea.l    a3,a0
[00023a36] 7003                      moveq.l    #3,d0
[00023a38] 4eb9 0005 10fe            jsr        Aob_scanf
[00023a3e] 584f                      addq.w     #4,a7
[00023a40] 486a 0026                 pea.l      38(a2)
[00023a44] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a4a] 7005                      moveq.l    #5,d0
[00023a4c] 204b                      movea.l    a3,a0
[00023a4e] 4eb9 0005 10fe            jsr        Aob_scanf
[00023a54] 584f                      addq.w     #4,a7
[00023a56] 486a 0028                 pea.l      40(a2)
[00023a5a] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a60] 7007                      moveq.l    #7,d0
[00023a62] 204b                      movea.l    a3,a0
[00023a64] 4eb9 0005 10fe            jsr        Aob_scanf
[00023a6a] 584f                      addq.w     #4,a7
[00023a6c] 486a 002a                 pea.l      42(a2)
[00023a70] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00023a76] 7009                      moveq.l    #9,d0
[00023a78] 204b                      movea.l    a3,a0
[00023a7a] 4eb9 0005 10fe            jsr        Aob_scanf
[00023a80] 584f                      addq.w     #4,a7
[00023a82] 224c                      movea.l    a4,a1
[00023a84] 7003                      moveq.l    #3,d0
[00023a86] 41eb 0570                 lea.l      1392(a3),a0
[00023a8a] 4eb9 0006 a068            jsr        Auo_boxed
[00023a90] 2f14                      move.l     (a4),-(a7)
[00023a92] 226a 004a                 movea.l    74(a2),a1
[00023a96] 204d                      movea.l    a5,a0
[00023a98] 4eb9 0003 607a            jsr        change_string
[00023a9e] 584f                      addq.w     #4,a7
[00023aa0] 224c                      movea.l    a4,a1
[00023aa2] 7003                      moveq.l    #3,d0
[00023aa4] 41eb 0588                 lea.l      1416(a3),a0
[00023aa8] 4eb9 0006 a068            jsr        Auo_boxed
[00023aae] 2f14                      move.l     (a4),-(a7)
[00023ab0] 226a 004e                 movea.l    78(a2),a1
[00023ab4] 204d                      movea.l    a5,a0
[00023ab6] 4eb9 0003 607a            jsr        change_string
[00023abc] 584f                      addq.w     #4,a7
[00023abe] 2f6a 0014 0094            move.l     20(a2),148(a7)
[00023ac4] 224c                      movea.l    a4,a1
[00023ac6] 7003                      moveq.l    #3,d0
[00023ac8] 41eb 0750                 lea.l      1872(a3),a0
[00023acc] 4eb9 0006 a068            jsr        Auo_boxed
[00023ad2] 2054                      movea.l    (a4),a0
[00023ad4] 1010                      move.b     (a0),d0
[00023ad6] 672e                      beq.s      acc_window_25
[00023ad8] 2248                      movea.l    a0,a1
[00023ada] 206d 0018                 movea.l    24(a5),a0
[00023ade] 4eb9 0003 337c            jsr        find_entry
[00023ae4] 2f48 0090                 move.l     a0,144(a7)
[00023ae8] 2008                      move.l     a0,d0
[00023aea] 6610                      bne.s      acc_window_26
[00023aec] 2254                      movea.l    (a4),a1
[00023aee] 41f9 000b 3e8e            lea.l      ERR_OB_DEL,a0
[00023af4] 4eb9 0006 b80c            jsr        alert_str
[00023afa] 600e                      bra.s      acc_window_27
acc_window_26:
[00023afc] 206f 0090                 movea.l    144(a7),a0
[00023b00] 5268 0036                 addq.w     #1,54(a0)
[00023b04] 6004                      bra.s      acc_window_27
acc_window_25:
[00023b06] 42af 0090                 clr.l      144(a7)
acc_window_27:
[00023b0a] 202f 0094                 move.l     148(a7),d0
[00023b0e] 670a                      beq.s      acc_window_28
[00023b10] 2240                      movea.l    d0,a1
[00023b12] 204d                      movea.l    a5,a0
[00023b14] 4eb9 0003 5aa2            jsr        del_object
acc_window_28:
[00023b1a] 256f 0090 0014            move.l     144(a7),20(a2)
[00023b20] 2f6a 0018 0094            move.l     24(a2),148(a7)
[00023b26] 224c                      movea.l    a4,a1
[00023b28] 7003                      moveq.l    #3,d0
[00023b2a] 41eb 0720                 lea.l      1824(a3),a0
[00023b2e] 4eb9 0006 a068            jsr        Auo_boxed
[00023b34] 2054                      movea.l    (a4),a0
[00023b36] 1010                      move.b     (a0),d0
[00023b38] 672e                      beq.s      acc_window_29
[00023b3a] 2248                      movea.l    a0,a1
[00023b3c] 206d 0018                 movea.l    24(a5),a0
[00023b40] 4eb9 0003 337c            jsr        find_entry
[00023b46] 2f48 0090                 move.l     a0,144(a7)
[00023b4a] 2008                      move.l     a0,d0
[00023b4c] 6610                      bne.s      acc_window_30
[00023b4e] 2254                      movea.l    (a4),a1
[00023b50] 41f9 000b 3e8e            lea.l      ERR_OB_DEL,a0
[00023b56] 4eb9 0006 b80c            jsr        alert_str
[00023b5c] 600e                      bra.s      acc_window_31
acc_window_30:
[00023b5e] 206f 0090                 movea.l    144(a7),a0
[00023b62] 5268 0036                 addq.w     #1,54(a0)
[00023b66] 6004                      bra.s      acc_window_31
acc_window_29:
[00023b68] 42af 0090                 clr.l      144(a7)
acc_window_31:
[00023b6c] 202f 0094                 move.l     148(a7),d0
[00023b70] 670a                      beq.s      acc_window_32
[00023b72] 2240                      movea.l    d0,a1
[00023b74] 204d                      movea.l    a5,a0
[00023b76] 4eb9 0003 5aa2            jsr        del_object
acc_window_32:
[00023b7c] 256f 0090 0018            move.l     144(a7),24(a2)
[00023b82] 2f6a 005e 0094            move.l     94(a2),148(a7)
[00023b88] 224c                      movea.l    a4,a1
[00023b8a] 7003                      moveq.l    #3,d0
[00023b8c] 41eb 06f0                 lea.l      1776(a3),a0
[00023b90] 4eb9 0006 a068            jsr        Auo_boxed
[00023b96] 2054                      movea.l    (a4),a0
[00023b98] 1010                      move.b     (a0),d0
[00023b9a] 672e                      beq.s      acc_window_33
[00023b9c] 2248                      movea.l    a0,a1
[00023b9e] 206d 001c                 movea.l    28(a5),a0
[00023ba2] 4eb9 0003 337c            jsr        find_entry
[00023ba8] 2f48 0090                 move.l     a0,144(a7)
[00023bac] 2008                      move.l     a0,d0
[00023bae] 6610                      bne.s      acc_window_34
[00023bb0] 2254                      movea.l    (a4),a1
[00023bb2] 41f9 000b 3e45            lea.l      ERR_ME_DEL,a0
[00023bb8] 4eb9 0006 b80c            jsr        alert_str
[00023bbe] 600e                      bra.s      acc_window_35
acc_window_34:
[00023bc0] 206f 0090                 movea.l    144(a7),a0
[00023bc4] 5268 0036                 addq.w     #1,54(a0)
[00023bc8] 6004                      bra.s      acc_window_35
acc_window_33:
[00023bca] 42af 0090                 clr.l      144(a7)
acc_window_35:
[00023bce] 202f 0094                 move.l     148(a7),d0
[00023bd2] 670a                      beq.s      acc_window_36
[00023bd4] 2240                      movea.l    d0,a1
[00023bd6] 204d                      movea.l    a5,a0
[00023bd8] 4eb9 0003 5834            jsr        del_men
acc_window_36:
[00023bde] 256f 0090 005e            move.l     144(a7),94(a2)
[00023be4] 2f6a 005a 0094            move.l     90(a2),148(a7)
[00023bea] 224c                      movea.l    a4,a1
[00023bec] 7003                      moveq.l    #3,d0
[00023bee] 41eb 0780                 lea.l      1920(a3),a0
[00023bf2] 4eb9 0006 a068            jsr        Auo_boxed
[00023bf8] 2054                      movea.l    (a4),a0
[00023bfa] 1010                      move.b     (a0),d0
[00023bfc] 672e                      beq.s      acc_window_37
[00023bfe] 2248                      movea.l    a0,a1
[00023c00] 206d 002c                 movea.l    44(a5),a0
[00023c04] 4eb9 0003 337c            jsr        find_entry
[00023c0a] 2f48 0090                 move.l     a0,144(a7)
[00023c0e] 2008                      move.l     a0,d0
[00023c10] 6610                      bne.s      acc_window_38
[00023c12] 2254                      movea.l    (a4),a1
[00023c14] 41f9 000b 3dfc            lea.l      ERR_IC_DEL,a0
[00023c1a] 4eb9 0006 b80c            jsr        alert_str
[00023c20] 600e                      bra.s      acc_window_39
acc_window_38:
[00023c22] 206f 0090                 movea.l    144(a7),a0
[00023c26] 5268 0036                 addq.w     #1,54(a0)
[00023c2a] 6004                      bra.s      acc_window_39
acc_window_37:
[00023c2c] 42af 0090                 clr.l      144(a7)
acc_window_39:
[00023c30] 202f 0094                 move.l     148(a7),d0
[00023c34] 670a                      beq.s      acc_window_40
[00023c36] 2240                      movea.l    d0,a1
[00023c38] 204d                      movea.l    a5,a0
[00023c3a] 4eb9 0003 4b40            jsr        del_icon
acc_window_40:
[00023c40] 256f 0090 005a            move.l     144(a7),90(a2)
[00023c46] 224c                      movea.l    a4,a1
[00023c48] 7003                      moveq.l    #3,d0
[00023c4a] 41eb 07b0                 lea.l      1968(a3),a0
[00023c4e] 4eb9 0006 a068            jsr        Auo_boxed
[00023c54] 2f14                      move.l     (a4),-(a7)
[00023c56] 4240                      clr.w      d0
[00023c58] 224a                      movea.l    a2,a1
[00023c5a] 204d                      movea.l    a5,a0
[00023c5c] 4eb9 0001 58c6            jsr        mod_ref
[00023c62] 584f                      addq.w     #4,a7
[00023c64] 224c                      movea.l    a4,a1
[00023c66] 7003                      moveq.l    #3,d0
[00023c68] 41eb 0918                 lea.l      2328(a3),a0
[00023c6c] 4eb9 0006 a068            jsr        Auo_boxed
[00023c72] 2f14                      move.l     (a4),-(a7)
[00023c74] 7006                      moveq.l    #6,d0
[00023c76] 43ea 000c                 lea.l      12(a2),a1
[00023c7a] 204d                      movea.l    a5,a0
[00023c7c] 4eb9 0001 58c6            jsr        mod_ref
[00023c82] 584f                      addq.w     #4,a7
[00023c84] 224c                      movea.l    a4,a1
[00023c86] 7003                      moveq.l    #3,d0
[00023c88] 41eb 0948                 lea.l      2376(a3),a0
[00023c8c] 4eb9 0006 a068            jsr        Auo_boxed
[00023c92] 2f14                      move.l     (a4),-(a7)
[00023c94] 7007                      moveq.l    #7,d0
[00023c96] 43ea 0008                 lea.l      8(a2),a1
[00023c9a] 204d                      movea.l    a5,a0
[00023c9c] 4eb9 0001 58c6            jsr        mod_ref
[00023ca2] 584f                      addq.w     #4,a7
[00023ca4] 224c                      movea.l    a4,a1
[00023ca6] 7003                      moveq.l    #3,d0
[00023ca8] 41eb 0978                 lea.l      2424(a3),a0
[00023cac] 4eb9 0006 a068            jsr        Auo_boxed
[00023cb2] 2f14                      move.l     (a4),-(a7)
[00023cb4] 7015                      moveq.l    #21,d0
[00023cb6] 43ea 0004                 lea.l      4(a2),a1
[00023cba] 204d                      movea.l    a5,a0
[00023cbc] 4eb9 0001 58c6            jsr        mod_ref
[00023cc2] 584f                      addq.w     #4,a7
[00023cc4] 224c                      movea.l    a4,a1
[00023cc6] 7003                      moveq.l    #3,d0
[00023cc8] 41eb 09a8                 lea.l      2472(a3),a0
[00023ccc] 4eb9 0006 a068            jsr        Auo_boxed
[00023cd2] 2f14                      move.l     (a4),-(a7)
[00023cd4] 7008                      moveq.l    #8,d0
[00023cd6] 43ea 0010                 lea.l      16(a2),a1
[00023cda] 204d                      movea.l    a5,a0
[00023cdc] 4eb9 0001 58c6            jsr        mod_ref
[00023ce2] 584f                      addq.w     #4,a7
[00023ce4] 224c                      movea.l    a4,a1
[00023ce6] 7003                      moveq.l    #3,d0
[00023ce8] 41eb 09d8                 lea.l      2520(a3),a0
[00023cec] 4eb9 0006 a068            jsr        Auo_boxed
[00023cf2] 2f14                      move.l     (a4),-(a7)
[00023cf4] 7009                      moveq.l    #9,d0
[00023cf6] 43ea 0062                 lea.l      98(a2),a1
[00023cfa] 204d                      movea.l    a5,a0
[00023cfc] 4eb9 0001 58c6            jsr        mod_ref
[00023d02] 584f                      addq.w     #4,a7
[00023d04] 224c                      movea.l    a4,a1
[00023d06] 7003                      moveq.l    #3,d0
[00023d08] 41eb 0a08                 lea.l      2568(a3),a0
[00023d0c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d12] 2f14                      move.l     (a4),-(a7)
[00023d14] 700a                      moveq.l    #10,d0
[00023d16] 43ea 0066                 lea.l      102(a2),a1
[00023d1a] 204d                      movea.l    a5,a0
[00023d1c] 4eb9 0001 58c6            jsr        mod_ref
[00023d22] 584f                      addq.w     #4,a7
[00023d24] 224c                      movea.l    a4,a1
[00023d26] 7003                      moveq.l    #3,d0
[00023d28] 41eb 0a38                 lea.l      2616(a3),a0
[00023d2c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d32] 2f14                      move.l     (a4),-(a7)
[00023d34] 700b                      moveq.l    #11,d0
[00023d36] 43ea 006a                 lea.l      106(a2),a1
[00023d3a] 204d                      movea.l    a5,a0
[00023d3c] 4eb9 0001 58c6            jsr        mod_ref
[00023d42] 584f                      addq.w     #4,a7
[00023d44] 224c                      movea.l    a4,a1
[00023d46] 7003                      moveq.l    #3,d0
[00023d48] 41eb 0a68                 lea.l      2664(a3),a0
[00023d4c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d52] 2f14                      move.l     (a4),-(a7)
[00023d54] 700c                      moveq.l    #12,d0
[00023d56] 43ea 006e                 lea.l      110(a2),a1
[00023d5a] 204d                      movea.l    a5,a0
[00023d5c] 4eb9 0001 58c6            jsr        mod_ref
[00023d62] 584f                      addq.w     #4,a7
[00023d64] 224c                      movea.l    a4,a1
[00023d66] 7003                      moveq.l    #3,d0
[00023d68] 41eb 0a98                 lea.l      2712(a3),a0
[00023d6c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d72] 2f14                      move.l     (a4),-(a7)
[00023d74] 700e                      moveq.l    #14,d0
[00023d76] 43ea 0072                 lea.l      114(a2),a1
[00023d7a] 204d                      movea.l    a5,a0
[00023d7c] 4eb9 0001 58c6            jsr        mod_ref
[00023d82] 584f                      addq.w     #4,a7
[00023d84] 224c                      movea.l    a4,a1
[00023d86] 7003                      moveq.l    #3,d0
[00023d88] 41eb 0ac8                 lea.l      2760(a3),a0
[00023d8c] 4eb9 0006 a068            jsr        Auo_boxed
[00023d92] 2f14                      move.l     (a4),-(a7)
[00023d94] 7014                      moveq.l    #20,d0
[00023d96] 43ea 0076                 lea.l      118(a2),a1
[00023d9a] 204d                      movea.l    a5,a0
[00023d9c] 4eb9 0001 58c6            jsr        mod_ref
[00023da2] 584f                      addq.w     #4,a7
[00023da4] 224c                      movea.l    a4,a1
[00023da6] 7003                      moveq.l    #3,d0
[00023da8] 41eb 0af8                 lea.l      2808(a3),a0
[00023dac] 4eb9 0006 a068            jsr        Auo_boxed
[00023db2] 2f14                      move.l     (a4),-(a7)
[00023db4] 700f                      moveq.l    #15,d0
[00023db6] 43ea 007a                 lea.l      122(a2),a1
[00023dba] 204d                      movea.l    a5,a0
[00023dbc] 4eb9 0001 58c6            jsr        mod_ref
[00023dc2] 584f                      addq.w     #4,a7
[00023dc4] 224c                      movea.l    a4,a1
[00023dc6] 7003                      moveq.l    #3,d0
[00023dc8] 41eb 0b28                 lea.l      2856(a3),a0
[00023dcc] 4eb9 0006 a068            jsr        Auo_boxed
[00023dd2] 2f14                      move.l     (a4),-(a7)
[00023dd4] 7010                      moveq.l    #16,d0
[00023dd6] 43ea 007e                 lea.l      126(a2),a1
[00023dda] 204d                      movea.l    a5,a0
[00023ddc] 4eb9 0001 58c6            jsr        mod_ref
[00023de2] 584f                      addq.w     #4,a7
[00023de4] 224c                      movea.l    a4,a1
[00023de6] 7003                      moveq.l    #3,d0
[00023de8] 41eb 0b58                 lea.l      2904(a3),a0
[00023dec] 4eb9 0006 a068            jsr        Auo_boxed
[00023df2] 2f14                      move.l     (a4),-(a7)
[00023df4] 7011                      moveq.l    #17,d0
[00023df6] 43ea 0082                 lea.l      130(a2),a1
[00023dfa] 204d                      movea.l    a5,a0
[00023dfc] 4eb9 0001 58c6            jsr        mod_ref
[00023e02] 584f                      addq.w     #4,a7
[00023e04] 224c                      movea.l    a4,a1
[00023e06] 7003                      moveq.l    #3,d0
[00023e08] 41eb 0bb8                 lea.l      3000(a3),a0
[00023e0c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e12] 2f14                      move.l     (a4),-(a7)
[00023e14] 7013                      moveq.l    #19,d0
[00023e16] 43ea 0086                 lea.l      134(a2),a1
[00023e1a] 204d                      movea.l    a5,a0
[00023e1c] 4eb9 0001 58c6            jsr        mod_ref
[00023e22] 584f                      addq.w     #4,a7
[00023e24] 224c                      movea.l    a4,a1
[00023e26] 7003                      moveq.l    #3,d0
[00023e28] 41eb 0b88                 lea.l      2952(a3),a0
[00023e2c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e32] 2f14                      move.l     (a4),-(a7)
[00023e34] 7012                      moveq.l    #18,d0
[00023e36] 43ea 008a                 lea.l      138(a2),a1
[00023e3a] 204d                      movea.l    a5,a0
[00023e3c] 4eb9 0001 58c6            jsr        mod_ref
[00023e42] 584f                      addq.w     #4,a7
[00023e44] 224c                      movea.l    a4,a1
[00023e46] 7003                      moveq.l    #3,d0
[00023e48] 41eb 0be8                 lea.l      3048(a3),a0
[00023e4c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e52] 2f14                      move.l     (a4),-(a7)
[00023e54] 7016                      moveq.l    #22,d0
[00023e56] 43ea 008e                 lea.l      142(a2),a1
[00023e5a] 204d                      movea.l    a5,a0
[00023e5c] 4eb9 0001 58c6            jsr        mod_ref
[00023e62] 584f                      addq.w     #4,a7
[00023e64] 224c                      movea.l    a4,a1
[00023e66] 7003                      moveq.l    #3,d0
[00023e68] 41eb 0c18                 lea.l      3096(a3),a0
[00023e6c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e72] 2f14                      move.l     (a4),-(a7)
[00023e74] 7017                      moveq.l    #23,d0
[00023e76] 43ea 0092                 lea.l      146(a2),a1
[00023e7a] 204d                      movea.l    a5,a0
[00023e7c] 4eb9 0001 58c6            jsr        mod_ref
[00023e82] 584f                      addq.w     #4,a7
[00023e84] 224c                      movea.l    a4,a1
[00023e86] 7003                      moveq.l    #3,d0
[00023e88] 41eb 0c48                 lea.l      3144(a3),a0
[00023e8c] 4eb9 0006 a068            jsr        Auo_boxed
[00023e92] 2f14                      move.l     (a4),-(a7)
[00023e94] 7018                      moveq.l    #24,d0
[00023e96] 43ea 0096                 lea.l      150(a2),a1
[00023e9a] 204d                      movea.l    a5,a0
[00023e9c] 4eb9 0001 58c6            jsr        mod_ref
[00023ea2] 584f                      addq.w     #4,a7
[00023ea4] 2f6a 009e 0094            move.l     158(a2),148(a7)
[00023eaa] 43ef 0004                 lea.l      4(a7),a1
[00023eae] 7003                      moveq.l    #3,d0
[00023eb0] 41eb 0648                 lea.l      1608(a3),a0
[00023eb4] 4eb9 0006 a068            jsr        Auo_boxed
[00023eba] 206f 0004                 movea.l    4(a7),a0
[00023ebe] 4eb9 0008 2f6c            jsr        strlen
[00023ec4] 5280                      addq.l     #1,d0
[00023ec6] 2f40 000a                 move.l     d0,10(a7)
[00023eca] 2f40 000e                 move.l     d0,14(a7)
[00023ece] 206f 0004                 movea.l    4(a7),a0
[00023ed2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00023ed8] 4a40                      tst.w      d0
[00023eda] 662e                      bne.s      acc_window_41
[00023edc] 202f 0094                 move.l     148(a7),d0
[00023ee0] 6610                      bne.s      acc_window_42
[00023ee2] 43d7                      lea.l      (a7),a1
[00023ee4] 204d                      movea.l    a5,a0
[00023ee6] 4eb9 0003 5f3e            jsr        add_string
[00023eec] 2f48 0090                 move.l     a0,144(a7)
[00023ef0] 601c                      bra.s      acc_window_43
acc_window_42:
[00023ef2] 2f2f 0004                 move.l     4(a7),-(a7)
[00023ef6] 226f 0098                 movea.l    152(a7),a1
[00023efa] 204d                      movea.l    a5,a0
[00023efc] 4eb9 0003 607a            jsr        change_string
[00023f02] 584f                      addq.w     #4,a7
[00023f04] 2f48 0090                 move.l     a0,144(a7)
[00023f08] 6004                      bra.s      acc_window_43
acc_window_41:
[00023f0a] 42af 0090                 clr.l      144(a7)
acc_window_43:
[00023f0e] 202f 0094                 move.l     148(a7),d0
[00023f12] 6710                      beq.s      acc_window_44
[00023f14] b0af 0090                 cmp.l      144(a7),d0
[00023f18] 670a                      beq.s      acc_window_44
[00023f1a] 2240                      movea.l    d0,a1
[00023f1c] 204d                      movea.l    a5,a0
[00023f1e] 4eb9 0003 6108            jsr        del_string
acc_window_44:
[00023f24] 256f 0090 009e            move.l     144(a7),158(a2)
[00023f2a] 2f6a 009a 0094            move.l     154(a2),148(a7)
[00023f30] 43ef 0046                 lea.l      70(a7),a1
[00023f34] 7003                      moveq.l    #3,d0
[00023f36] 41eb 0630                 lea.l      1584(a3),a0
[00023f3a] 4eb9 0006 a068            jsr        Auo_boxed
[00023f40] 206f 0046                 movea.l    70(a7),a0
[00023f44] 4eb9 0008 2f6c            jsr        strlen
[00023f4a] 5280                      addq.l     #1,d0
[00023f4c] 2f40 004c                 move.l     d0,76(a7)
[00023f50] 2f40 0050                 move.l     d0,80(a7)
[00023f54] 206f 0046                 movea.l    70(a7),a0
[00023f58] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00023f5e] 4a40                      tst.w      d0
[00023f60] 6630                      bne.s      acc_window_45
[00023f62] 202f 0094                 move.l     148(a7),d0
[00023f66] 6612                      bne.s      acc_window_46
[00023f68] 43ef 0042                 lea.l      66(a7),a1
[00023f6c] 204d                      movea.l    a5,a0
[00023f6e] 4eb9 0003 5f3e            jsr        add_string
[00023f74] 2f48 0090                 move.l     a0,144(a7)
[00023f78] 601c                      bra.s      acc_window_47
acc_window_46:
[00023f7a] 2f2f 0046                 move.l     70(a7),-(a7)
[00023f7e] 226f 0098                 movea.l    152(a7),a1
[00023f82] 204d                      movea.l    a5,a0
[00023f84] 4eb9 0003 607a            jsr        change_string
[00023f8a] 584f                      addq.w     #4,a7
[00023f8c] 2f48 0090                 move.l     a0,144(a7)
[00023f90] 6004                      bra.s      acc_window_47
acc_window_45:
[00023f92] 42af 0090                 clr.l      144(a7)
acc_window_47:
[00023f96] 202f 0094                 move.l     148(a7),d0
[00023f9a] 6710                      beq.s      acc_window_48
[00023f9c] b0af 0090                 cmp.l      144(a7),d0
[00023fa0] 670a                      beq.s      acc_window_48
[00023fa2] 2240                      movea.l    d0,a1
[00023fa4] 204d                      movea.l    a5,a0
[00023fa6] 4eb9 0003 6108            jsr        del_string
acc_window_48:
[00023fac] 256f 0090 009a            move.l     144(a7),154(a2)
[00023fb2] 4fef 009c                 lea.l      156(a7),a7
[00023fb6] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00023fba] 4e75                      rts

wi_make:
[00023fbc] 48e7 0038                 movem.l    a2-a4,-(a7)
[00023fc0] 594f                      subq.w     #4,a7
[00023fc2] 2e88                      move.l     a0,(a7)
[00023fc4] 2668 0004                 movea.l    4(a0),a3
[00023fc8] 286b 0012                 movea.l    18(a3),a4
[00023fcc] 200c                      move.l     a4,d0
[00023fce] 670c                      beq.s      wi_make_1
[00023fd0] 204c                      movea.l    a4,a0
[00023fd2] 4eb9 0005 6bea            jsr        Awi_show
[00023fd8] 6000 0086                 bra        wi_make_2
wi_make_1:
[00023fdc] 7008                      moveq.l    #8,d0
[00023fde] 4eb9 0004 c608            jsr        Ax_malloc
[00023fe4] 2448                      movea.l    a0,a2
[00023fe6] 200a                      move.l     a2,d0
[00023fe8] 6772                      beq.s      wi_make_3
[00023fea] 2257                      movea.l    (a7),a1
[00023fec] 2091                      move.l     (a1),(a0)
[00023fee] 2569 0004 0004            move.l     4(a1),4(a2)
[00023ff4] 41eb 0016                 lea.l      22(a3),a0
[00023ff8] 23c8 000b 79bc            move.l     a0,$000B79BC
[00023ffe] 2279 000b 79c8            movea.l    $000B79C8,a1
[00024004] 2348 0008                 move.l     a0,8(a1)
[00024008] 41f9 000b 796e            lea.l      WI_WINDOW,a0
[0002400e] 4eb9 0005 7052            jsr        Awi_create
[00024014] 2848                      movea.l    a0,a4
[00024016] 200c                      move.l     a4,d0
[00024018] 660a                      bne.s      wi_make_4
[0002401a] 204a                      movea.l    a2,a0
[0002401c] 4eb9 0004 c7c8            jsr        Ax_free
[00024022] 6038                      bra.s      wi_make_3
wi_make_4:
[00024024] 2057                      movea.l    (a7),a0
[00024026] 2250                      movea.l    (a0),a1
[00024028] 4869 0168                 pea.l      360(a1)
[0002402c] 43eb 003a                 lea.l      58(a3),a1
[00024030] 204c                      movea.l    a4,a0
[00024032] 4eb9 0001 6372            jsr        wi_pos
[00024038] 584f                      addq.w     #4,a7
[0002403a] 288a                      move.l     a2,(a4)
[0002403c] 274c 0012                 move.l     a4,18(a3)
[00024040] 204c                      movea.l    a4,a0
[00024042] 4eb9 0002 4148            jsr        set_window
[00024048] 204c                      movea.l    a4,a0
[0002404a] 226c 000c                 movea.l    12(a4),a1
[0002404e] 4e91                      jsr        (a1)
[00024050] 4a40                      tst.w      d0
[00024052] 670c                      beq.s      wi_make_2
[00024054] 204c                      movea.l    a4,a0
[00024056] 4eb9 0002 4842            jsr        term
wi_make_3:
[0002405c] 91c8                      suba.l     a0,a0
[0002405e] 6002                      bra.s      wi_make_5
wi_make_2:
[00024060] 204c                      movea.l    a4,a0
wi_make_5:
[00024062] 584f                      addq.w     #4,a7
[00024064] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00024068] 4e75                      rts

wi_service:
[0002406a] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002406e] 2448                      movea.l    a0,a2
[00024070] 3600                      move.w     d0,d3
[00024072] 2849                      movea.l    a1,a4
[00024074] 2650                      movea.l    (a0),a3
[00024076] b07c 0024                 cmp.w      #$0024,d0
[0002407a] 672a                      beq.s      wi_service_1
[0002407c] 6e0e                      bgt.s      wi_service_2
[0002407e] 5540                      subq.w     #2,d0
[00024080] 6700 0090                 beq        wi_service_3
[00024084] 5f40                      subq.w     #7,d0
[00024086] 6726                      beq.s      wi_service_4
[00024088] 6000 00a8                 bra        wi_service_5
wi_service_2:
[0002408c] 907c 0025                 sub.w      #$0025,d0
[00024090] 670c                      beq.s      wi_service_6
[00024092] 907c 26eb                 sub.w      #$26EB,d0
[00024096] 6700 008c                 beq        wi_service_7
[0002409a] 6000 0096                 bra        wi_service_5
wi_service_6:
[0002409e] 42ac 0002                 clr.l      2(a4)
[000240a2] 6000 009c                 bra        wi_service_8
wi_service_1:
[000240a6] 38bc 0001                 move.w     #$0001,(a4)
[000240aa] 6000 0094                 bra        wi_service_8
wi_service_4:
[000240ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[000240b4] 2268 0254                 movea.l    596(a0),a1
[000240b8] 3211                      move.w     (a1),d1
[000240ba] 48c1                      ext.l      d1
[000240bc] 2001                      move.l     d1,d0
[000240be] d080                      add.l      d0,d0
[000240c0] d081                      add.l      d1,d0
[000240c2] e788                      lsl.l      #3,d0
[000240c4] 2268 0240                 movea.l    576(a0),a1
[000240c8] 2069 0014                 movea.l    20(a1),a0
[000240cc] 41f0 0818                 lea.l      24(a0,d0.l),a0
[000240d0] 3414                      move.w     (a4),d2
[000240d2] 947c 004a                 sub.w      #$004A,d2
[000240d6] 6718                      beq.s      wi_service_9
[000240d8] 5542                      subq.w     #2,d2
[000240da] 670a                      beq.s      wi_service_10
[000240dc] 5542                      subq.w     #2,d2
[000240de] 6706                      beq.s      wi_service_10
[000240e0] 5542                      subq.w     #2,d2
[000240e2] 6716                      beq.s      wi_service_11
[000240e4] 6022                      bra.s      wi_service_12
wi_service_10:
[000240e6] 0c68 2710 0016            cmpi.w     #$2710,22(a0)
[000240ec] 6752                      beq.s      wi_service_8
[000240ee] 6012                      bra.s      wi_service_13
wi_service_9:
[000240f0] 0c68 2711 0016            cmpi.w     #$2711,22(a0)
[000240f6] 6748                      beq.s      wi_service_8
[000240f8] 6008                      bra.s      wi_service_13
wi_service_11:
[000240fa] 0c68 2720 0016            cmpi.w     #$2720,22(a0)
[00024100] 673e                      beq.s      wi_service_8
wi_service_13:
[00024102] 426c 0002                 clr.w      2(a4)
[00024106] 6038                      bra.s      wi_service_8
wi_service_12:
[00024108] 0c68 271c 0016            cmpi.w     #$271C,22(a0)
[0002410e] 6730                      beq.s      wi_service_8
[00024110] 60f0                      bra.s      wi_service_13
wi_service_3:
[00024112] 7001                      moveq.l    #1,d0
[00024114] 204a                      movea.l    a2,a0
[00024116] 6100 f712                 bsr        acc_window
[0002411a] 204a                      movea.l    a2,a0
[0002411c] 4eb9 0002 4842            jsr        term
[00024122] 601c                      bra.s      wi_service_8
wi_service_7:
[00024124] 226b 0004                 movea.l    4(a3),a1
[00024128] 204a                      movea.l    a2,a0
[0002412a] 4eb9 0001 60ea            jsr        new_name
[00024130] 600e                      bra.s      wi_service_8
wi_service_5:
[00024132] 224c                      movea.l    a4,a1
[00024134] 3003                      move.w     d3,d0
[00024136] 204a                      movea.l    a2,a0
[00024138] 4eb9 0005 9dd0            jsr        Awi_service
[0002413e] 6002                      bra.s      wi_service_14
wi_service_8:
[00024140] 7001                      moveq.l    #1,d0
wi_service_14:
[00024142] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00024146] 4e75                      rts

set_window:
[00024148] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0002414c] 4fef ffc2                 lea.l      -62(a7),a7
[00024150] 2a48                      movea.l    a0,a5
[00024152] 2050                      movea.l    (a0),a0
[00024154] 2268 0004                 movea.l    4(a0),a1
[00024158] 2469 0004                 movea.l    4(a1),a2
[0002415c] 266d 0014                 movea.l    20(a5),a3
[00024160] 362a 0022                 move.w     34(a2),d3
[00024164] 41eb 0228                 lea.l      552(a3),a0
[00024168] 7002                      moveq.l    #2,d0
[0002416a] c043                      and.w      d3,d0
[0002416c] 4eb9 0001 58a2            jsr        set_flag
[00024172] 41eb 03c0                 lea.l      960(a3),a0
[00024176] 3003                      move.w     d3,d0
[00024178] c07c 1000                 and.w      #$1000,d0
[0002417c] 4eb9 0001 58a2            jsr        set_flag
[00024182] 41eb 03a8                 lea.l      936(a3),a0
[00024186] 7008                      moveq.l    #8,d0
[00024188] c043                      and.w      d3,d0
[0002418a] 4eb9 0001 58a2            jsr        set_flag
[00024190] 41eb 0390                 lea.l      912(a3),a0
[00024194] 7001                      moveq.l    #1,d0
[00024196] c043                      and.w      d3,d0
[00024198] 4eb9 0001 58a2            jsr        set_flag
[0002419e] 41eb 0240                 lea.l      576(a3),a0
[000241a2] 7010                      moveq.l    #16,d0
[000241a4] c043                      and.w      d3,d0
[000241a6] 4eb9 0001 58a2            jsr        set_flag
[000241ac] 41eb 0348                 lea.l      840(a3),a0
[000241b0] 7004                      moveq.l    #4,d0
[000241b2] c043                      and.w      d3,d0
[000241b4] 4eb9 0001 58a2            jsr        set_flag
[000241ba] 41eb 02d0                 lea.l      720(a3),a0
[000241be] 7020                      moveq.l    #32,d0
[000241c0] c043                      and.w      d3,d0
[000241c2] 4eb9 0001 58a2            jsr        set_flag
[000241c8] 41eb 0330                 lea.l      816(a3),a0
[000241cc] 7040                      moveq.l    #64,d0
[000241ce] c043                      and.w      d3,d0
[000241d0] 4eb9 0001 58a2            jsr        set_flag
[000241d6] 41eb 02e8                 lea.l      744(a3),a0
[000241da] 303c 0080                 move.w     #$0080,d0
[000241de] c043                      and.w      d3,d0
[000241e0] 4eb9 0001 58a2            jsr        set_flag
[000241e6] 41eb 02b8                 lea.l      696(a3),a0
[000241ea] 3003                      move.w     d3,d0
[000241ec] c07c 0400                 and.w      #$0400,d0
[000241f0] 4eb9 0001 58a2            jsr        set_flag
[000241f6] 41eb 02a0                 lea.l      672(a3),a0
[000241fa] 3003                      move.w     d3,d0
[000241fc] c07c 0200                 and.w      #$0200,d0
[00024200] 4eb9 0001 58a2            jsr        set_flag
[00024206] 41eb 0318                 lea.l      792(a3),a0
[0002420a] 3003                      move.w     d3,d0
[0002420c] c07c 0100                 and.w      #$0100,d0
[00024210] 4eb9 0001 58a2            jsr        set_flag
[00024216] 41eb 0288                 lea.l      648(a3),a0
[0002421a] 3003                      move.w     d3,d0
[0002421c] c07c 0800                 and.w      #$0800,d0
[00024220] 4eb9 0001 58a2            jsr        set_flag
[00024226] 41eb 0360                 lea.l      864(a3),a0
[0002422a] 3003                      move.w     d3,d0
[0002422c] c07c 4000                 and.w      #$4000,d0
[00024230] 4eb9 0001 58a2            jsr        set_flag
[00024236] 41eb 0378                 lea.l      888(a3),a0
[0002423a] 3003                      move.w     d3,d0
[0002423c] c07c 2000                 and.w      #$2000,d0
[00024240] 4eb9 0001 58a2            jsr        set_flag
[00024246] 362a 0054                 move.w     84(a2),d3
[0002424a] 41eb 03f0                 lea.l      1008(a3),a0
[0002424e] 7008                      moveq.l    #8,d0
[00024250] c043                      and.w      d3,d0
[00024252] 4eb9 0001 58a2            jsr        set_flag
[00024258] 41eb 0420                 lea.l      1056(a3),a0
[0002425c] 7004                      moveq.l    #4,d0
[0002425e] c043                      and.w      d3,d0
[00024260] 4eb9 0001 58a2            jsr        set_flag
[00024266] 41eb 0450                 lea.l      1104(a3),a0
[0002426a] 7001                      moveq.l    #1,d0
[0002426c] c043                      and.w      d3,d0
[0002426e] 4eb9 0001 58a2            jsr        set_flag
[00024274] 41eb 0480                 lea.l      1152(a3),a0
[00024278] 7002                      moveq.l    #2,d0
[0002427a] c043                      and.w      d3,d0
[0002427c] 4eb9 0001 58a2            jsr        set_flag
[00024282] 41eb 04b0                 lea.l      1200(a3),a0
[00024286] 7010                      moveq.l    #16,d0
[00024288] c043                      and.w      d3,d0
[0002428a] 4eb9 0001 58a2            jsr        set_flag
[00024290] 41eb 04e0                 lea.l      1248(a3),a0
[00024294] 3003                      move.w     d3,d0
[00024296] c07c 0100                 and.w      #$0100,d0
[0002429a] 4eb9 0001 58a2            jsr        set_flag
[000242a0] 2f4d 0034                 move.l     a5,52(a7)
[000242a4] 4beb 0150                 lea.l      336(a3),a5
[000242a8] 2f4d 0038                 move.l     a5,56(a7)
[000242ac] 3f7c 000e 003c            move.w     #$000E,60(a7)
[000242b2] 43ef 0034                 lea.l      52(a7),a1
[000242b6] 7009                      moveq.l    #9,d0
[000242b8] 204d                      movea.l    a5,a0
[000242ba] 4eb9 0003 71ba            jsr        Auo_slider
[000242c0] 2f7c 0000 0007 002c       move.l     #$00000007,44(a7)
[000242c8] 43ef 002c                 lea.l      44(a7),a1
[000242cc] 7064                      moveq.l    #100,d0
[000242ce] 204d                      movea.l    a5,a0
[000242d0] 4eb9 0003 71ba            jsr        Auo_slider
[000242d6] 2f7c 0000 0001 002c       move.l     #$00000001,44(a7)
[000242de] 43ef 002c                 lea.l      44(a7),a1
[000242e2] 7065                      moveq.l    #101,d0
[000242e4] 204d                      movea.l    a5,a0
[000242e6] 4eb9 0003 71ba            jsr        Auo_slider
[000242ec] 302a 0048                 move.w     72(a2),d0
[000242f0] 807c ff00                 or.w       #$FF00,d0
[000242f4] 4440                      neg.w      d0
[000242f6] b07c 0008                 cmp.w      #$0008,d0
[000242fa] 673e                      beq.s      set_window_1
[000242fc] 6e0e                      bgt.s      set_window_2
[000242fe] 5340                      subq.w     #1,d0
[00024300] 671e                      beq.s      set_window_3
[00024302] 5340                      subq.w     #1,d0
[00024304] 6720                      beq.s      set_window_4
[00024306] 5540                      subq.w     #2,d0
[00024308] 6726                      beq.s      set_window_5
[0002430a] 6054                      bra.s      set_window_6
set_window_2:
[0002430c] 907c 0010                 sub.w      #$0010,d0
[00024310] 6732                      beq.s      set_window_7
[00024312] 907c 0010                 sub.w      #$0010,d0
[00024316] 6736                      beq.s      set_window_8
[00024318] 907c 0020                 sub.w      #$0020,d0
[0002431c] 673a                      beq.s      set_window_9
[0002431e] 6040                      bra.s      set_window_6
set_window_3:
[00024320] 42af 002c                 clr.l      44(a7)
[00024324] 603a                      bra.s      set_window_6
set_window_4:
[00024326] 2f7c 0000 0001 002c       move.l     #$00000001,44(a7)
[0002432e] 6030                      bra.s      set_window_6
set_window_5:
[00024330] 2f7c 0000 0002 002c       move.l     #$00000002,44(a7)
[00024338] 6026                      bra.s      set_window_6
set_window_1:
[0002433a] 2f7c 0000 0003 002c       move.l     #$00000003,44(a7)
[00024342] 601c                      bra.s      set_window_6
set_window_7:
[00024344] 2f7c 0000 0004 002c       move.l     #$00000004,44(a7)
[0002434c] 6012                      bra.s      set_window_6
set_window_8:
[0002434e] 2f7c 0000 0005 002c       move.l     #$00000005,44(a7)
[00024356] 6008                      bra.s      set_window_6
set_window_9:
[00024358] 2f7c 0000 0006 002c       move.l     #$00000006,44(a7)
set_window_6:
[00024360] 43ef 002c                 lea.l      44(a7),a1
[00024364] 7011                      moveq.l    #17,d0
[00024366] 204d                      movea.l    a5,a0
[00024368] 4eb9 0003 71ba            jsr        Auo_slider
[0002436e] 49ef 0008                 lea.l      8(a7),a4
[00024372] 302a 0048                 move.w     72(a2),d0
[00024376] 807c ff00                 or.w       #$FF00,d0
[0002437a] 4440                      neg.w      d0
[0002437c] 3f00                      move.w     d0,-(a7)
[0002437e] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00024384] 204c                      movea.l    a4,a0
[00024386] 4eb9 0008 15ac            jsr        sprintf
[0002438c] 544f                      addq.w     #2,a7
[0002438e] 224c                      movea.l    a4,a1
[00024390] 7004                      moveq.l    #4,d0
[00024392] 204d                      movea.l    a5,a0
[00024394] 4eb9 0003 71ba            jsr        Auo_slider
[0002439a] 2ebc 0002 47f2            move.l     #live_snap,(a7)
[000243a0] 2f4d 0004                 move.l     a5,4(a7)
[000243a4] 43d7                      lea.l      (a7),a1
[000243a6] 7067                      moveq.l    #103,d0
[000243a8] 204d                      movea.l    a5,a0
[000243aa] 4eb9 0003 71ba            jsr        Auo_slider
[000243b0] 4beb 0198                 lea.l      408(a3),a5
[000243b4] 2f4d 0038                 move.l     a5,56(a7)
[000243b8] 3f7c 0011 003c            move.w     #$0011,60(a7)
[000243be] 43ef 0034                 lea.l      52(a7),a1
[000243c2] 7009                      moveq.l    #9,d0
[000243c4] 204d                      movea.l    a5,a0
[000243c6] 4eb9 0003 71ba            jsr        Auo_slider
[000243cc] 2f7c 0000 0007 002c       move.l     #$00000007,44(a7)
[000243d4] 43ef 002c                 lea.l      44(a7),a1
[000243d8] 7064                      moveq.l    #100,d0
[000243da] 204d                      movea.l    a5,a0
[000243dc] 4eb9 0003 71ba            jsr        Auo_slider
[000243e2] 2f7c 0000 0001 002c       move.l     #$00000001,44(a7)
[000243ea] 43ef 002c                 lea.l      44(a7),a1
[000243ee] 7065                      moveq.l    #101,d0
[000243f0] 204d                      movea.l    a5,a0
[000243f2] 4eb9 0003 71ba            jsr        Auo_slider
[000243f8] 302a 0048                 move.w     72(a2),d0
[000243fc] e040                      asr.w      #8,d0
[000243fe] 4440                      neg.w      d0
[00024400] b07c 0008                 cmp.w      #$0008,d0
[00024404] 673e                      beq.s      set_window_10
[00024406] 6e0e                      bgt.s      set_window_11
[00024408] 5340                      subq.w     #1,d0
[0002440a] 671e                      beq.s      set_window_12
[0002440c] 5340                      subq.w     #1,d0
[0002440e] 6720                      beq.s      set_window_13
[00024410] 5540                      subq.w     #2,d0
[00024412] 6726                      beq.s      set_window_14
[00024414] 6054                      bra.s      set_window_15
set_window_11:
[00024416] 907c 0010                 sub.w      #$0010,d0
[0002441a] 6732                      beq.s      set_window_16
[0002441c] 907c 0010                 sub.w      #$0010,d0
[00024420] 6736                      beq.s      set_window_17
[00024422] 907c 0020                 sub.w      #$0020,d0
[00024426] 673a                      beq.s      set_window_18
[00024428] 6040                      bra.s      set_window_15
set_window_12:
[0002442a] 42af 002c                 clr.l      44(a7)
[0002442e] 603a                      bra.s      set_window_15
set_window_13:
[00024430] 2f7c 0000 0001 002c       move.l     #$00000001,44(a7)
[00024438] 6030                      bra.s      set_window_15
set_window_14:
[0002443a] 2f7c 0000 0002 002c       move.l     #$00000002,44(a7)
[00024442] 6026                      bra.s      set_window_15
set_window_10:
[00024444] 2f7c 0000 0003 002c       move.l     #$00000003,44(a7)
[0002444c] 601c                      bra.s      set_window_15
set_window_16:
[0002444e] 2f7c 0000 0004 002c       move.l     #$00000004,44(a7)
[00024456] 6012                      bra.s      set_window_15
set_window_17:
[00024458] 2f7c 0000 0005 002c       move.l     #$00000005,44(a7)
[00024460] 6008                      bra.s      set_window_15
set_window_18:
[00024462] 2f7c 0000 0006 002c       move.l     #$00000006,44(a7)
set_window_15:
[0002446a] 43ef 002c                 lea.l      44(a7),a1
[0002446e] 7011                      moveq.l    #17,d0
[00024470] 204d                      movea.l    a5,a0
[00024472] 4eb9 0003 71ba            jsr        Auo_slider
[00024478] 302a 0048                 move.w     72(a2),d0
[0002447c] e040                      asr.w      #8,d0
[0002447e] 4440                      neg.w      d0
[00024480] 3f00                      move.w     d0,-(a7)
[00024482] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00024488] 204c                      movea.l    a4,a0
[0002448a] 4eb9 0008 15ac            jsr        sprintf
[00024490] 544f                      addq.w     #2,a7
[00024492] 224c                      movea.l    a4,a1
[00024494] 7004                      moveq.l    #4,d0
[00024496] 204d                      movea.l    a5,a0
[00024498] 4eb9 0003 71ba            jsr        Auo_slider
[0002449e] 2ebc 0002 47f2            move.l     #live_snap,(a7)
[000244a4] 2f4d 0004                 move.l     a5,4(a7)
[000244a8] 43d7                      lea.l      (a7),a1
[000244aa] 7067                      moveq.l    #103,d0
[000244ac] 204d                      movea.l    a5,a0
[000244ae] 4eb9 0003 71ba            jsr        Auo_slider
[000244b4] 3f2a 0024                 move.w     36(a2),-(a7)
[000244b8] 43f9 000b 7a94            lea.l      $000B7A94,a1
[000244be] 7003                      moveq.l    #3,d0
[000244c0] 204b                      movea.l    a3,a0
[000244c2] 4eb9 0005 0f94            jsr        Aob_printf
[000244c8] 544f                      addq.w     #2,a7
[000244ca] 3f2a 0026                 move.w     38(a2),-(a7)
[000244ce] 43f9 000b 7a94            lea.l      $000B7A94,a1
[000244d4] 7005                      moveq.l    #5,d0
[000244d6] 204b                      movea.l    a3,a0
[000244d8] 4eb9 0005 0f94            jsr        Aob_printf
[000244de] 544f                      addq.w     #2,a7
[000244e0] 3f2a 0028                 move.w     40(a2),-(a7)
[000244e4] 43f9 000b 7a94            lea.l      $000B7A94,a1
[000244ea] 7007                      moveq.l    #7,d0
[000244ec] 204b                      movea.l    a3,a0
[000244ee] 4eb9 0005 0f94            jsr        Aob_printf
[000244f4] 544f                      addq.w     #2,a7
[000244f6] 3f2a 002a                 move.w     42(a2),-(a7)
[000244fa] 43f9 000b 7a94            lea.l      $000B7A94,a1
[00024500] 7009                      moveq.l    #9,d0
[00024502] 204b                      movea.l    a3,a0
[00024504] 4eb9 0005 0f94            jsr        Aob_printf
[0002450a] 544f                      addq.w     #2,a7
[0002450c] 2f6a 004a 0030            move.l     74(a2),48(a7)
[00024512] 206f 0030                 movea.l    48(a7),a0
[00024516] 2268 0004                 movea.l    4(a0),a1
[0002451a] 703a                      moveq.l    #58,d0
[0002451c] 204b                      movea.l    a3,a0
[0002451e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00024524] 2f6a 004e 0030            move.l     78(a2),48(a7)
[0002452a] 206f 0030                 movea.l    48(a7),a0
[0002452e] 2268 0004                 movea.l    4(a0),a1
[00024532] 703b                      moveq.l    #59,d0
[00024534] 204b                      movea.l    a3,a0
[00024536] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002453c] 224c                      movea.l    a4,a1
[0002453e] 206a 0014                 movea.l    20(a2),a0
[00024542] 4eb9 0001 591a            jsr        set_ref
[00024548] 224c                      movea.l    a4,a1
[0002454a] 7004                      moveq.l    #4,d0
[0002454c] 41eb 0750                 lea.l      1872(a3),a0
[00024550] 4eb9 0006 a068            jsr        Auo_boxed
[00024556] 224c                      movea.l    a4,a1
[00024558] 206a 0018                 movea.l    24(a2),a0
[0002455c] 4eb9 0001 591a            jsr        set_ref
[00024562] 224c                      movea.l    a4,a1
[00024564] 7004                      moveq.l    #4,d0
[00024566] 41eb 0720                 lea.l      1824(a3),a0
[0002456a] 4eb9 0006 a068            jsr        Auo_boxed
[00024570] 224c                      movea.l    a4,a1
[00024572] 206a 005e                 movea.l    94(a2),a0
[00024576] 4eb9 0001 591a            jsr        set_ref
[0002457c] 224c                      movea.l    a4,a1
[0002457e] 7004                      moveq.l    #4,d0
[00024580] 41eb 06f0                 lea.l      1776(a3),a0
[00024584] 4eb9 0006 a068            jsr        Auo_boxed
[0002458a] 224c                      movea.l    a4,a1
[0002458c] 206a 005a                 movea.l    90(a2),a0
[00024590] 4eb9 0001 591a            jsr        set_ref
[00024596] 224c                      movea.l    a4,a1
[00024598] 7004                      moveq.l    #4,d0
[0002459a] 41eb 0780                 lea.l      1920(a3),a0
[0002459e] 4eb9 0006 a068            jsr        Auo_boxed
[000245a4] 224c                      movea.l    a4,a1
[000245a6] 2052                      movea.l    (a2),a0
[000245a8] 4eb9 0001 591a            jsr        set_ref
[000245ae] 224c                      movea.l    a4,a1
[000245b0] 7004                      moveq.l    #4,d0
[000245b2] 41eb 07b0                 lea.l      1968(a3),a0
[000245b6] 4eb9 0006 a068            jsr        Auo_boxed
[000245bc] 224c                      movea.l    a4,a1
[000245be] 206a 000c                 movea.l    12(a2),a0
[000245c2] 4eb9 0001 591a            jsr        set_ref
[000245c8] 224c                      movea.l    a4,a1
[000245ca] 7004                      moveq.l    #4,d0
[000245cc] 41eb 0918                 lea.l      2328(a3),a0
[000245d0] 4eb9 0006 a068            jsr        Auo_boxed
[000245d6] 224c                      movea.l    a4,a1
[000245d8] 206a 0008                 movea.l    8(a2),a0
[000245dc] 4eb9 0001 591a            jsr        set_ref
[000245e2] 224c                      movea.l    a4,a1
[000245e4] 7004                      moveq.l    #4,d0
[000245e6] 41eb 0948                 lea.l      2376(a3),a0
[000245ea] 4eb9 0006 a068            jsr        Auo_boxed
[000245f0] 224c                      movea.l    a4,a1
[000245f2] 206a 0004                 movea.l    4(a2),a0
[000245f6] 4eb9 0001 591a            jsr        set_ref
[000245fc] 224c                      movea.l    a4,a1
[000245fe] 7004                      moveq.l    #4,d0
[00024600] 41eb 0978                 lea.l      2424(a3),a0
[00024604] 4eb9 0006 a068            jsr        Auo_boxed
[0002460a] 224c                      movea.l    a4,a1
[0002460c] 206a 0010                 movea.l    16(a2),a0
[00024610] 4eb9 0001 591a            jsr        set_ref
[00024616] 224c                      movea.l    a4,a1
[00024618] 7004                      moveq.l    #4,d0
[0002461a] 41eb 09a8                 lea.l      2472(a3),a0
[0002461e] 4eb9 0006 a068            jsr        Auo_boxed
[00024624] 224c                      movea.l    a4,a1
[00024626] 206a 0062                 movea.l    98(a2),a0
[0002462a] 4eb9 0001 591a            jsr        set_ref
[00024630] 224c                      movea.l    a4,a1
[00024632] 7004                      moveq.l    #4,d0
[00024634] 41eb 09d8                 lea.l      2520(a3),a0
[00024638] 4eb9 0006 a068            jsr        Auo_boxed
[0002463e] 224c                      movea.l    a4,a1
[00024640] 206a 0066                 movea.l    102(a2),a0
[00024644] 4eb9 0001 591a            jsr        set_ref
[0002464a] 224c                      movea.l    a4,a1
[0002464c] 7004                      moveq.l    #4,d0
[0002464e] 41eb 0a08                 lea.l      2568(a3),a0
[00024652] 4eb9 0006 a068            jsr        Auo_boxed
[00024658] 224c                      movea.l    a4,a1
[0002465a] 206a 006a                 movea.l    106(a2),a0
[0002465e] 4eb9 0001 591a            jsr        set_ref
[00024664] 224c                      movea.l    a4,a1
[00024666] 7004                      moveq.l    #4,d0
[00024668] 41eb 0a38                 lea.l      2616(a3),a0
[0002466c] 4eb9 0006 a068            jsr        Auo_boxed
[00024672] 224c                      movea.l    a4,a1
[00024674] 206a 006e                 movea.l    110(a2),a0
[00024678] 4eb9 0001 591a            jsr        set_ref
[0002467e] 224c                      movea.l    a4,a1
[00024680] 7004                      moveq.l    #4,d0
[00024682] 41eb 0a68                 lea.l      2664(a3),a0
[00024686] 4eb9 0006 a068            jsr        Auo_boxed
[0002468c] 224c                      movea.l    a4,a1
[0002468e] 206a 0072                 movea.l    114(a2),a0
[00024692] 4eb9 0001 591a            jsr        set_ref
[00024698] 224c                      movea.l    a4,a1
[0002469a] 7004                      moveq.l    #4,d0
[0002469c] 41eb 0a98                 lea.l      2712(a3),a0
[000246a0] 4eb9 0006 a068            jsr        Auo_boxed
[000246a6] 224c                      movea.l    a4,a1
[000246a8] 206a 0076                 movea.l    118(a2),a0
[000246ac] 4eb9 0001 591a            jsr        set_ref
[000246b2] 224c                      movea.l    a4,a1
[000246b4] 7004                      moveq.l    #4,d0
[000246b6] 41eb 0ac8                 lea.l      2760(a3),a0
[000246ba] 4eb9 0006 a068            jsr        Auo_boxed
[000246c0] 224c                      movea.l    a4,a1
[000246c2] 206a 007a                 movea.l    122(a2),a0
[000246c6] 4eb9 0001 591a            jsr        set_ref
[000246cc] 224c                      movea.l    a4,a1
[000246ce] 7004                      moveq.l    #4,d0
[000246d0] 41eb 0af8                 lea.l      2808(a3),a0
[000246d4] 4eb9 0006 a068            jsr        Auo_boxed
[000246da] 224c                      movea.l    a4,a1
[000246dc] 206a 007e                 movea.l    126(a2),a0
[000246e0] 4eb9 0001 591a            jsr        set_ref
[000246e6] 224c                      movea.l    a4,a1
[000246e8] 7004                      moveq.l    #4,d0
[000246ea] 41eb 0b28                 lea.l      2856(a3),a0
[000246ee] 4eb9 0006 a068            jsr        Auo_boxed
[000246f4] 224c                      movea.l    a4,a1
[000246f6] 206a 0082                 movea.l    130(a2),a0
[000246fa] 4eb9 0001 591a            jsr        set_ref
[00024700] 224c                      movea.l    a4,a1
[00024702] 7004                      moveq.l    #4,d0
[00024704] 41eb 0b58                 lea.l      2904(a3),a0
[00024708] 4eb9 0006 a068            jsr        Auo_boxed
[0002470e] 224c                      movea.l    a4,a1
[00024710] 206a 0086                 movea.l    134(a2),a0
[00024714] 4eb9 0001 591a            jsr        set_ref
[0002471a] 224c                      movea.l    a4,a1
[0002471c] 7004                      moveq.l    #4,d0
[0002471e] 41eb 0bb8                 lea.l      3000(a3),a0
[00024722] 4eb9 0006 a068            jsr        Auo_boxed
[00024728] 224c                      movea.l    a4,a1
[0002472a] 206a 008a                 movea.l    138(a2),a0
[0002472e] 4eb9 0001 591a            jsr        set_ref
[00024734] 224c                      movea.l    a4,a1
[00024736] 7004                      moveq.l    #4,d0
[00024738] 41eb 0b88                 lea.l      2952(a3),a0
[0002473c] 4eb9 0006 a068            jsr        Auo_boxed
[00024742] 224c                      movea.l    a4,a1
[00024744] 206a 008e                 movea.l    142(a2),a0
[00024748] 4eb9 0001 591a            jsr        set_ref
[0002474e] 224c                      movea.l    a4,a1
[00024750] 7004                      moveq.l    #4,d0
[00024752] 41eb 0be8                 lea.l      3048(a3),a0
[00024756] 4eb9 0006 a068            jsr        Auo_boxed
[0002475c] 224c                      movea.l    a4,a1
[0002475e] 206a 0092                 movea.l    146(a2),a0
[00024762] 4eb9 0001 591a            jsr        set_ref
[00024768] 224c                      movea.l    a4,a1
[0002476a] 7004                      moveq.l    #4,d0
[0002476c] 41eb 0c18                 lea.l      3096(a3),a0
[00024770] 4eb9 0006 a068            jsr        Auo_boxed
[00024776] 224c                      movea.l    a4,a1
[00024778] 206a 0096                 movea.l    150(a2),a0
[0002477c] 4eb9 0001 591a            jsr        set_ref
[00024782] 224c                      movea.l    a4,a1
[00024784] 7004                      moveq.l    #4,d0
[00024786] 41eb 0c48                 lea.l      3144(a3),a0
[0002478a] 4eb9 0006 a068            jsr        Auo_boxed
[00024790] 202a 009e                 move.l     158(a2),d0
[00024794] 6716                      beq.s      set_window_19
[00024796] 2f40 0030                 move.l     d0,48(a7)
[0002479a] 2040                      movea.l    d0,a0
[0002479c] 2268 0004                 movea.l    4(a0),a1
[000247a0] 204b                      movea.l    a3,a0
[000247a2] 7043                      moveq.l    #67,d0
[000247a4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000247aa] 6010                      bra.s      set_window_20
set_window_19:
[000247ac] 43f9 000b 7a96            lea.l      $000B7A96,a1
[000247b2] 7043                      moveq.l    #67,d0
[000247b4] 204b                      movea.l    a3,a0
[000247b6] 4eb9 0005 0fd8            jsr        Aob_puttext
set_window_20:
[000247bc] 202a 009a                 move.l     154(a2),d0
[000247c0] 6716                      beq.s      set_window_21
[000247c2] 2f40 0030                 move.l     d0,48(a7)
[000247c6] 2040                      movea.l    d0,a0
[000247c8] 2268 0004                 movea.l    4(a0),a1
[000247cc] 204b                      movea.l    a3,a0
[000247ce] 7042                      moveq.l    #66,d0
[000247d0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000247d6] 6010                      bra.s      set_window_22
set_window_21:
[000247d8] 43f9 000b 7a96            lea.l      $000B7A96,a1
[000247de] 7042                      moveq.l    #66,d0
[000247e0] 204b                      movea.l    a3,a0
[000247e2] 4eb9 0005 0fd8            jsr        Aob_puttext
set_window_22:
[000247e8] 4fef 003e                 lea.l      62(a7),a7
[000247ec] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[000247f0] 4e75                      rts

live_snap:
[000247f2] 2f03                      move.l     d3,-(a7)
[000247f4] 5d4f                      subq.w     #6,a7
[000247f6] 3200                      move.w     d0,d1
[000247f8] b27c 0006                 cmp.w      #$0006,d1
[000247fc] 6232                      bhi.s      live_snap_1
[000247fe] d241                      add.w      d1,d1
[00024800] 323b 1006                 move.w     $00024808(pc,d1.w),d1
[00024804] 4efb 1002                 jmp        $00024808(pc,d1.w)
J9:
[00024808] 000e                      dc.w $000e   ; live_snap_2-J9
[0002480a] 0012                      dc.w $0012   ; live_snap_3-J9
[0002480c] 0016                      dc.w $0016   ; live_snap_4-J9
[0002480e] 001a                      dc.w $001a   ; live_snap_5-J9
[00024810] 001e                      dc.w $001e   ; live_snap_6-J9
[00024812] 0022                      dc.w $0022   ; live_snap_7-J9
[00024814] 0026                      dc.w $0026   ; live_snap_8-J9
live_snap_2:
[00024816] 7601                      moveq.l    #1,d3
[00024818] 6016                      bra.s      live_snap_1
live_snap_3:
[0002481a] 7602                      moveq.l    #2,d3
[0002481c] 6012                      bra.s      live_snap_1
live_snap_4:
[0002481e] 7604                      moveq.l    #4,d3
[00024820] 600e                      bra.s      live_snap_1
live_snap_5:
[00024822] 7608                      moveq.l    #8,d3
[00024824] 600a                      bra.s      live_snap_1
live_snap_6:
[00024826] 7610                      moveq.l    #16,d3
[00024828] 6006                      bra.s      live_snap_1
live_snap_7:
[0002482a] 7620                      moveq.l    #32,d3
[0002482c] 6002                      bra.s      live_snap_1
live_snap_8:
[0002482e] 7640                      moveq.l    #64,d3
live_snap_1:
[00024830] 720a                      moveq.l    #10,d1
[00024832] 41d7                      lea.l      (a7),a0
[00024834] 3003                      move.w     d3,d0
[00024836] 4eb9 0008 2dc0            jsr        itoa
[0002483c] 5c4f                      addq.w     #6,a7
[0002483e] 261f                      move.l     (a7)+,d3
[00024840] 4e75                      rts

term:
[00024842] 2f0a                      move.l     a2,-(a7)
[00024844] 2f0b                      move.l     a3,-(a7)
[00024846] 2448                      movea.l    a0,a2
[00024848] 2650                      movea.l    (a0),a3
[0002484a] 226b 0004                 movea.l    4(a3),a1
[0002484e] 42a9 0012                 clr.l      18(a1)
[00024852] 302a 0056                 move.w     86(a2),d0
[00024856] c07c 0800                 and.w      #$0800,d0
[0002485a] 6716                      beq.s      term_1
[0002485c] 43ea 002c                 lea.l      44(a2),a1
[00024860] 206b 0004                 movea.l    4(a3),a0
[00024864] 41e8 003a                 lea.l      58(a0),a0
[00024868] 7008                      moveq.l    #8,d0
[0002486a] 4eb9 0008 3500            jsr        memcpy
[00024870] 6014                      bra.s      term_2
term_1:
[00024872] 7008                      moveq.l    #8,d0
[00024874] 43ea 0024                 lea.l      36(a2),a1
[00024878] 206b 0004                 movea.l    4(a3),a0
[0002487c] 41e8 003a                 lea.l      58(a0),a0
[00024880] 4eb9 0008 3500            jsr        memcpy
term_2:
[00024886] 204b                      movea.l    a3,a0
[00024888] 4eb9 0004 c7c8            jsr        Ax_free
[0002488e] 204a                      movea.l    a2,a0
[00024890] 4eb9 0005 85f2            jsr        Awi_delete
[00024896] 265f                      movea.l    (a7)+,a3
[00024898] 245f                      movea.l    (a7)+,a2
[0002489a] 4e75                      rts

	.data

ERR_IC_DEL:
[000b3dfc]                           dc.b '[3][ Die Ikone| '%s' | ist nicht (mehr) Teil | dieser Datei][    OK    ]',0
ERR_ME_DEL:
[000b3e45]                           dc.b '[3][ Das MenÅ| '%s' | ist nicht (mehr) Teil | dieser Datei.][    OK    ]',0
ERR_OB_DEL:
[000b3e8e]                           dc.b '[3][ Der Objektbaum| '%s' | ist nicht (mehr) Teil | dieser Datei.][    OK    ]',0
WARN_CREATE:
[000b3edd]                           dc.b '[1][ Die 'create'-Routine wurde| nicht definiert. Es wird| 'Awi_selfcreate' eingesetzt! ][   OK   ]',0
BUBBLE_01:
[000b3f41]                           dc.b 'Hier kann der Dateinamen des ST-Guide-Hypertextes angeben werden, der fÅr die Anzeige der Hilfe verwendet werden soll.',0
BUBBLE_02:
[000b3fb8]                           dc.b 'Hier kann die Infozeile des Fensters angegeben werden.',0
BUBBLE_03:
[000b3fef]                           dc.b 'Bei dem Fenster handlet es sich um ein Listenfenster.',0
BUBBLE_04:
[000b4025]                           dc.b 'Das Fenster kann nicht automatisch von ACS geschlossen werden.',0
BUBBLE_05:
[000b4064]                           dc.b 'Das Fenster kann im Hintergrund wie ein Werkzeug-Fenster bedient werden.',0
BUBBLE_06:
[000b40ad]                           dc.b 'Das offene Fenster wird durch ein grau schattiertes Icon auf dem Desktop reprÑsentiert.',0
BUBBLE_07:
[000b4105]                           dc.b 'Das geschlossene Fenster wird auf dem Desktop durch ein Icon dargestellt.|ACHTUNG: Beim Schlieûen des Fensters ohne dieses Flag wird das Fenster gelîscht!',0
BUBBLE_08:
[000b41a0]                           dc.b 'Das Fenster akzeptiert Objekte, die auf das Icon des Fensters auf dem Desktop gezogen werden.',0
BUBBLE_09:
[000b41fe]                           dc.b 'Hier kann der Namen des Fensters angegeben werden, der in der Titelzeile erscheinen soll.',0
BUBBLE_10:
[000b4258]                           dc.b 'Hier kann das Thema der Hilfe angegeben werden. Das Thema wird als Referenz an ST-Guide Åbergeben.',0
BUBBLE_11:
[000b42bb]                           dc.b 'Hier kann dem Fenster ein Fenster-MenÅ zugeordnet werden. Der Name des MenÅ-Baumes kann eingegeben werden oder per Drag&Drop aus der MenÅ-Liste Åbergeben werden.',0
BUBBLE_12:
[000b435d]                           dc.b 'Hier kann dem Fenster eine Toolbar zugeordnet werden. Der Name des Objekt-Baumes kann eingegeben werden oder per Drag&Drop aus der Objekt-Liste Åbergeben werden.',0
BUBBLE_13:
[000b43ff]                           dc.b 'Hier wird dem Fenster das Arbeits-Objekt, das sog. Work-Objekt, zugeordnet. Der Name des Objekt-Baumes kann eingegeben werden oder per Drag&Drop aus der Objekt-Liste Åbergeben werden.',0
BUBBLE_14:
[000b44b7]                           dc.b 'Hier kann dem Fenster ein Icon zugeordnet werden. Der Name des Icons kann eingegeben werden oder per Drag&Drop aus der Icon-Liste Åbergeben werden.',0
BUBBLE_15:
[000b454b]                           dc.b 'Hier kann der user-Zeiger des Fensters, in die Daten des Fensters abgelegt sind, vorbelegt werden (s. Online-Hilfe). Sinnvoll ist dies z.B. fÅr eine statische Struktur, die Åber ein Fenster editiert werden soll.',0
BUBBLE_16:
[000b461f]                           dc.b 'Die Schrittweite bei Scroll-Operationen in X- und Y-Richtung wird hier angegeben.|Tip: Schneller wird es ab 8 Pixeln, da dann im VDI immer Wort-Grenzen getroffen werden',0
BUBBLE_17:
[000b46c8]                           dc.b 'Hier wird die X-Position des Fensters eingegeben. Falls die Y-Position 0 ist, wird beim ôffnen des Fensters die X-Position bestimmt.',0
BUBBLE_18:
[000b474d]                           dc.b 'Hier wird die Y-Position des Fensters eingegeben. Falls die Y-Position 0 ist, wird beim ôffnen des Fensters die Y-Position bestimmt.',0
BUBBLE_19:
[000b47d2]                           dc.b 'Hier wird die Breite des Fensters eingegeben. Falls die Y-Position 0 ist, wird beim ôffnen des Fensters die Breite automatisch bestimmt.',0
BUBBLE_20:
[000b485b]                           dc.b 'Hier wird die Hîhe des Fensters eingegeben. Falls die Y-Position 0 ist, wird beim ôffnen des Fensters die Hîhe automatisch bestimmt werden.',0
BUBBLE_21:
[000b48e7]                           dc.b 'Einstellung, ob das Fenster einen CLOSER hat.',0
BUBBLE_22:
[000b4915]                           dc.b 'Einstellung, ob das Fenster einen MOVER hat.',0
BUBBLE_23:
[000b4942]                           dc.b 'Einstellung, ob das Fenster eine Titelzeile hat - ggf. muû die Titelzeile NAME unten angegeben werden.',0
BUBBLE_24:
[000b49a9]                           dc.b 'Einstellung, ob das Fenster eine Infozeile hat - ggf. muû die Infozeile unten angegeben werden.',0
BUBBLE_25:
[000b4a09]                           dc.b 'Einstellung, ob das Fenster einen FULLER hat.',0
BUBBLE_26:
[000b4a37]                           dc.b 'Einstellung, ob das Fenster ICONIFY hat.',0
BUBBLE_27:
[000b4a60]                           dc.b 'Einstellung, ob das Fenster BACKDROP selbst Åbernimmt (sollte eigentlich immer eingeschaltet sein).',0
BUBBLE_28:
[000b4ac4]                           dc.b 'Einstellung, ob das Fenster einen Up-Scrollpfeil UPARROW hat.',0
BUBBLE_29:
[000b4b02]                           dc.b 'Einstellung, ob das Fenster einen Down-Scrollpfeil DNARROW hat.',0
BUBBLE_30:
[000b4b42]                           dc.b 'Einstellung, ob das Fenster einen Rechts-Scrollpfeil RTARROW hat.',0
BUBBLE_31:
[000b4b84]                           dc.b 'Einstellung, ob das Fenster einen Links-Scrollpfeil LFARROW hat.',0
BUBBLE_32:
[000b4bc5]                           dc.b 'Einstellung, ob das Fenster einen SIZER hat.',0
BUBBLE_33:
[000b4bf2]                           dc.b 'Einstellung, ob das Fenster einen vertikalen Scrollbalken VSLIDE hat.',0
BUBBLE_34:
[000b4c38]                           dc.b 'Einstellung, ob das Fenster einen horizontalen Scrollbalken HSLIDE hat.',0
BUBBLE_35:
[000b4c80]                           dc.b 'Hier sollte dem Fenster eine Create-Routine zugeordnet werden - ansonsten wird Awi_selfcreate verwendet. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_36:
[000b4d51]                           dc.b 'Hier kann dem Fenster eine Open-Routine zugeordnet werden - Default ist Awi_open. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_37:
[000b4e0b]                           dc.b 'Hier kann dem Fenster eine Service-Routine zugeordnet werden - Default ist Awi_service. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_38:
[000b4ecb]                           dc.b 'Hier kann dem Fenster eine Change-Routine zugeordnet werden - Default ist Awi_obchange. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_39:
[000b4f8b]                           dc.b 'Hier kann dem Fenster eine Key-Routine zugeordnet werden - Default ist Awi_keys. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_40:
[000b5044]                           dc.b 'Hier kann dem Fenster eine Init-Routine zugeordnet werden - Default ist Awi_init. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_41:
[000b50fe]                           dc.b 'Hier kann dem Fenster eine Redraw-Routine zugeordnet werden - Default ist Awi_redraw. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_42:
[000b51bc]                           dc.b 'Hier kann dem Fenster eine Topped-Routine zugeordnet werden - Default ist Awi_topped. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_43:
[000b527a]                           dc.b 'Hier kann dem Fenster eine Closed-Routine zugeordnet werden - Default ist Awi_closed. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_44:
[000b5338]                           dc.b 'Hier kann dem Fenster eine Fulled-Routine zugeordnet werden - Default ist Awi_fulled. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_45:
[000b53f6]                           dc.b 'Hier kann dem Fenster eine Arrowed-Routine zugeordnet werden - Default ist Awi_arrowed. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben werden.',0
BUBBLE_46:
[000b54b6]                           dc.b 'Hier kann dem Fenster eine HSlide-Routine zugeordnet werden - Default ist Awi_hslid. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben ',0
BUBBLE_47:
[000b556c]                           dc.b 'Hier kann dem Fenster eine VSlide-Routine zugeordnet werden - Default ist Awi_vslid. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben ',0
BUBBLE_48:
[000b5622]                           dc.b 'Hier kann dem Fenster eine Moved-Routine zugeordnet werden - Default ist Awi_moved. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben ',0
BUBBLE_49:
[000b56d7]                           dc.b 'Hier kann dem Fenster eine Sized-Routine zugeordnet werden - Default ist Awi_sized. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben ',0
BUBBLE_50:
[000b578c]                           dc.b 'Hier kann dem Fenster eine Iconify-Routine zugeordnet werden - Default ist Awi_iconify. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben ',0
BUBBLE_51:
[000b5845]                           dc.b 'Hier kann dem Fenster eine Uniconify-Routine zugeordnet werden - Default ist Awi_uniconify. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben ',0
BUBBLE_52:
[000b5902]                           dc.b 'Hier kann dem Fenster eine GEMScript-Routine zugeordnet werden - Default ist Awi_gemscript. Der Name der Routine kann eingegeben werden oder per Drag&Drop aus der Referenz-Liste Åbergeben ',0
BUBBLE_53:
[000b59bf]                           dc.b 'Einstellung, ob das Fenster eine HOTCLOSEBOX hat.',0
STGUIDE_01:
[000b59f1]                           dc.b 'Der Fenster-Editor',0
TEXT_002:
[000b5a04]                           dc.w $004f
[000b5a06]                           dc.w $4b00
TEXT_004:
[000b5a08]                           dc.b 'Abbruch',0
TEXT_01:
[000b5a10]                           dc.b ' Info',0
TEXT_012:
[000b5a16]                           dc.w $593a
[000b5a18]                           dc.w $0058
[000b5a1a]                           dc.w $3a00
TEXT_014:
[000b5a1c]                           dc.w $573a
[000b5a1e]                           dc.w $0048
[000b5a20]                           dc.w $3a00
TEXT_02:
[000b5a22]                           dc.w $0100
TEXT_03:
[000b5a24]                           dc.b 'Liste',0
TEXT_04:
[000b5a2a]                           dc.b 'Bleibt',0
TEXT_05:
[000b5a31]                           dc.b 'Icon',0
TEXT_06:
[000b5a36]                           dc.b 'Geisticon',0
TEXT_07:
[000b5a40]                           dc.b 'Nimmt an ',0
TEXT_08:
[000b5a4a]                           dc.b 'Hintergrd.',0
TEXT_09:
[000b5a55]                           dc.b 'Toolbar:',0
TEXT_10:
[000b5a5e]                           dc.b 'Position:',0
TEXT_11:
[000b5a68]                           dc.b 'Attribute:',0
TEXT_12:
[000b5a73]                           dc.b 'Name:',0
TEXT_13:
[000b5a79]                           dc.b 'Menu:',0
TEXT_14:
[000b5a7f]                           dc.b 'Open:',0
TEXT_15:
[000b5a85]                           dc.b ' Fenster-Editor ',0
TEXT_16:
[000b5a96]                           dc.b 'Raster:',0
TEXT_17:
[000b5a9e]                           dc.b 'Routinen:',0
TEXT_18:
[000b5aa8]                           dc.b 'Info:',0
TEXT_19:
[000b5aae]                           dc.b 'Objekte:',0
TEXT_20:
[000b5ab7]                           dc.b 'Work:',0
TEXT_205:
[000b5abd]                           dc.b 'FENSTER',0
TEXT_21:
[000b5ac5]                           dc.b 'Icon:',0
TEXT_22:
[000b5acb]                           dc.b 'User:',0
TEXT_23:
[000b5ad1]                           dc.b 'Service:',0
TEXT_24:
[000b5ada]                           dc.w $0200
TEXT_25:
[000b5adc]                           dc.b 'Create:',0
TEXT_26:
[000b5ae4]                           dc.b 'Init:',0
TEXT_27:
[000b5aea]                           dc.b 'Keys:',0
TEXT_28:
[000b5af0]                           dc.b 'Change:',0
TEXT_29:
[000b5af8]                           dc.b 'Redraw:',0
TEXT_30:
[000b5b00]                           dc.b 'Topped:',0
TEXT_31:
[000b5b08]                           dc.b 'Closed:',0
TEXT_32:
[000b5b10]                           dc.b 'Fulled:',0
TEXT_33:
[000b5b18]                           dc.b 'Arrowed:',0
TEXT_34:
[000b5b21]                           dc.b 'H-Slide:',0
TEXT_35:
[000b5b2a]                           dc.b 'V-Slide:',0
TEXT_36:
[000b5b33]                           dc.b 'Moved:',0
TEXT_37:
[000b5b3a]                           dc.b 'Sized:',0
TEXT_38:
[000b5b41]                           dc.b 'Texte:',0
TEXT_39:
[000b5b48]                           dc.b 'Komponenten:',0
TEXT_40:
[000b5b55]                           dc.b $07
[000b5b56]                           dc.w $007f
[000b5b58]                           dc.w $001f
[000b5b5a]                           dc.w $004e
[000b5b5c]                           dc.b 'ame',0
TEXT_44:
[000b5b60]                           dc.b 'Mover',0
TEXT_45:
[000b5b66]                           dc.w $0500
TEXT_46:
[000b5b68]                           dc.w $0600
TEXT_47:
[000b5b6a]                           dc.w $0300
TEXT_48:
[000b5b6c]                           dc.w $0400
TEXT_49:
[000b5b6e]                           dc.b 'Iconify:',0
TEXT_50:
[000b5b77]                           dc.b '.HYP',0
TEXT_51:
[000b5b7c]                           dc.b 'UnIcon.:',0
TEXT_52:
[000b5b85]                           dc.b 'GEMScr.:',0
TEXT_53:
[000b5b8e]                           dc.b 'Titel:',0
TEXT_54:
[000b5b95]                           dc.b 'Datei:',0
TEXT_55:
[000b5b9c]                           dc.b 'ST-Guide-Hilfe',0
TEXT_56:
[000b5bab]                           dc.b $fa
[000b5bac]                           dc.w $0000
DATAS_27:
[000b5bae]                           dc.w $0000
[000b5bb0]                           dc.w $0000
[000b5bb2]                           dc.w $02f0
[000b5bb4]                           dc.w $0000
[000b5bb6]                           dc.w $0000
[000b5bb8]                           dc.w $0000
[000b5bba]                           dc.w $7fff
[000b5bbc]                           dc.w $ffff
[000b5bbe]                           dc.w $fffe
[000b5bc0]                           dc.w $5f00
[000b5bc2]                           dc.w $0000
[000b5bc4]                           dc.w $00bf
[000b5bc6]                           dc.w $7700
[000b5bc8]                           dc.w $65b0
[000b5bca]                           dc.w $00d7
[000b5bcc]                           dc.w $6b00
[000b5bce]                           dc.w $54e0
[000b5bd0]                           dc.w $00ef
[000b5bd2]                           dc.w $7700
[000b5bd4]                           dc.w $4db0
[000b5bd6]                           dc.w $00d7
[000b5bd8]                           dc.w $7f00
[000b5bda]                           dc.w $0000
[000b5bdc]                           dc.w $00ff
[000b5bde]                           dc.w $7fff
[000b5be0]                           dc.w $ffff
[000b5be2]                           dc.w $ffff
[000b5be4]                           dc.w $4fff
[000b5be6]                           dc.w $f800
[000b5be8]                           dc.w $00bf
[000b5bea]                           dc.w $4edb
[000b5bec]                           dc.w $f800
[000b5bee]                           dc.w $00ef
[000b5bf0]                           dc.w $4e1b
[000b5bf2]                           dc.w $f800
[000b5bf4]                           dc.w $00c7
[000b5bf6]                           dc.w $4ed8
[000b5bf8]                           dc.w $f800
[000b5bfa]                           dc.w $00ff
[000b5bfc]                           dc.w $4fff
[000b5bfe]                           dc.w $f800
[000b5c00]                           dc.w $00ff
[000b5c02]                           dc.w $7fff
[000b5c04]                           dc.w $ffff
[000b5c06]                           dc.w $ffff
[000b5c08]                           dc.w $4800
[000b5c0a]                           dc.w $0c00
[000b5c0c]                           dc.w $0083
[000b5c0e]                           dc.w $4a40
[000b5c10]                           dc.w $0c00
[000b5c12]                           dc.w $00bf
[000b5c14]                           dc.w $4bcf
[000b5c16]                           dc.w $0c00
[000b5c18]                           dc.w $00bf
[000b5c1a]                           dc.w $4800
[000b5c1c]                           dc.w $0c00
[000b5c1e]                           dc.w $00ff
[000b5c20]                           dc.w $4fff
[000b5c22]                           dc.w $fc00
[000b5c24]                           dc.w $00bf
[000b5c26]                           dc.w $47ff
[000b5c28]                           dc.w $fc00
[000b5c2a]                           dc.w $00ff
[000b5c2c]                           dc.w $4000
[000b5c2e]                           dc.w $0000
[000b5c30]                           dc.w $00c7
[000b5c32]                           dc.w $4000
[000b5c34]                           dc.w $0000
[000b5c36]                           dc.w $00ef
[000b5c38]                           dc.w $4000
[000b5c3a]                           dc.w $0000
[000b5c3c]                           dc.w $00ff
[000b5c3e]                           dc.w $7fff
[000b5c40]                           dc.w $ffff
[000b5c42]                           dc.w $ffff
[000b5c44]                           dc.w $5f01
[000b5c46]                           dc.w $0080
[000b5c48]                           dc.w $2fbf
[000b5c4a]                           dc.w $7701
[000b5c4c]                           dc.w $7f80
[000b5c4e]                           dc.w $3bc7
[000b5c50]                           dc.w $6701
[000b5c52]                           dc.w $7f80
[000b5c54]                           dc.w $39cf
[000b5c56]                           dc.w $7701
[000b5c58]                           dc.w $7f80
[000b5c5a]                           dc.w $3bd7
[000b5c5c]                           dc.w $7f01
[000b5c5e]                           dc.w $7f80
[000b5c60]                           dc.w $3fff
[000b5c62]                           dc.w $7fff
[000b5c64]                           dc.w $ffff
[000b5c66]                           dc.w $ffff
[000b5c68]                           dc.w $3fff
[000b5c6a]                           dc.w $ffff
[000b5c6c]                           dc.w $ffff
[000b5c6e]                           dc.w $0000
[000b5c70]                           dc.w $0000
[000b5c72]                           dc.w $0000
[000b5c74]                           dc.w $7fff
[000b5c76]                           dc.w $ffff
[000b5c78]                           dc.w $fffe
[000b5c7a]                           dc.w $5f00
[000b5c7c]                           dc.w $0000
[000b5c7e]                           dc.w $00bf
[000b5c80]                           dc.w $7700
[000b5c82]                           dc.w $0000
[000b5c84]                           dc.w $00d7
[000b5c86]                           dc.w $6b00
[000b5c88]                           dc.w $0000
[000b5c8a]                           dc.w $00ef
[000b5c8c]                           dc.w $7700
[000b5c8e]                           dc.w $0000
[000b5c90]                           dc.w $00d7
[000b5c92]                           dc.w $7f00
[000b5c94]                           dc.w $0000
[000b5c96]                           dc.w $00ff
[000b5c98]                           dc.w $7fff
[000b5c9a]                           dc.w $ffff
[000b5c9c]                           dc.w $ffff
[000b5c9e]                           dc.w $4fff
[000b5ca0]                           dc.w $f800
[000b5ca2]                           dc.w $00bf
[000b5ca4]                           dc.w $4edb
[000b5ca6]                           dc.w $f800
[000b5ca8]                           dc.w $00ef
[000b5caa]                           dc.w $4e1b
[000b5cac]                           dc.w $f800
[000b5cae]                           dc.w $00c7
[000b5cb0]                           dc.w $4ed8
[000b5cb2]                           dc.w $f800
[000b5cb4]                           dc.w $00ff
[000b5cb6]                           dc.w $4fff
[000b5cb8]                           dc.w $f800
[000b5cba]                           dc.w $00ff
[000b5cbc]                           dc.w $7fff
[000b5cbe]                           dc.w $ffff
[000b5cc0]                           dc.w $ffff
[000b5cc2]                           dc.w $4800
[000b5cc4]                           dc.w $0c00
[000b5cc6]                           dc.w $0083
[000b5cc8]                           dc.w $4a40
[000b5cca]                           dc.w $0c00
[000b5ccc]                           dc.w $00bf
[000b5cce]                           dc.w $4bcf
[000b5cd0]                           dc.w $0c00
[000b5cd2]                           dc.w $00bf
[000b5cd4]                           dc.w $4800
[000b5cd6]                           dc.w $0c00
[000b5cd8]                           dc.w $00ff
[000b5cda]                           dc.w $4fff
[000b5cdc]                           dc.w $fc00
[000b5cde]                           dc.w $00bf
[000b5ce0]                           dc.w $47ff
[000b5ce2]                           dc.w $fc00
[000b5ce4]                           dc.w $00ff
[000b5ce6]                           dc.w $4000
[000b5ce8]                           dc.w $0000
[000b5cea]                           dc.w $00c7
[000b5cec]                           dc.w $4000
[000b5cee]                           dc.w $0000
[000b5cf0]                           dc.w $00ef
[000b5cf2]                           dc.w $4000
[000b5cf4]                           dc.w $0000
[000b5cf6]                           dc.w $00ff
[000b5cf8]                           dc.w $7fff
[000b5cfa]                           dc.w $ffff
[000b5cfc]                           dc.w $ffff
[000b5cfe]                           dc.w $5f01
[000b5d00]                           dc.w $0080
[000b5d02]                           dc.w $2fbf
[000b5d04]                           dc.w $7701
[000b5d06]                           dc.w $7f80
[000b5d08]                           dc.w $3bc7
[000b5d0a]                           dc.w $6701
[000b5d0c]                           dc.w $7f80
[000b5d0e]                           dc.w $39cf
[000b5d10]                           dc.w $7701
[000b5d12]                           dc.w $7f80
[000b5d14]                           dc.w $3bd7
[000b5d16]                           dc.w $7f01
[000b5d18]                           dc.w $7f80
[000b5d1a]                           dc.w $3fff
[000b5d1c]                           dc.w $7fff
[000b5d1e]                           dc.w $ffff
[000b5d20]                           dc.w $ffff
[000b5d22]                           dc.w $3fff
[000b5d24]                           dc.w $ffff
[000b5d26]                           dc.w $ffff
[000b5d28]                           dc.w $0000
[000b5d2a]                           dc.w $0000
[000b5d2c]                           dc.w $0000
[000b5d2e]                           dc.w $7fff
[000b5d30]                           dc.w $ffff
[000b5d32]                           dc.w $fffe
[000b5d34]                           dc.w $5fff
[000b5d36]                           dc.w $ffff
[000b5d38]                           dc.w $ffbf
[000b5d3a]                           dc.w $77ff
[000b5d3c]                           dc.w $9a4f
[000b5d3e]                           dc.w $ffd7
[000b5d40]                           dc.w $6bff
[000b5d42]                           dc.w $ab1f
[000b5d44]                           dc.w $ffef
[000b5d46]                           dc.w $77ff
[000b5d48]                           dc.w $b24f
[000b5d4a]                           dc.w $ffd7
[000b5d4c]                           dc.w $7fff
[000b5d4e]                           dc.w $ffff
[000b5d50]                           dc.w $ffff
[000b5d52]                           dc.w $7fff
[000b5d54]                           dc.w $ffff
[000b5d56]                           dc.w $ffff
[000b5d58]                           dc.w $4fff
[000b5d5a]                           dc.w $f800
[000b5d5c]                           dc.w $00bf
[000b5d5e]                           dc.w $4edb
[000b5d60]                           dc.w $f800
[000b5d62]                           dc.w $00ef
[000b5d64]                           dc.w $4e1b
[000b5d66]                           dc.w $f800
[000b5d68]                           dc.w $00c7
[000b5d6a]                           dc.w $4ed8
[000b5d6c]                           dc.w $f800
[000b5d6e]                           dc.w $00ff
[000b5d70]                           dc.w $4fff
[000b5d72]                           dc.w $f800
[000b5d74]                           dc.w $00ff
[000b5d76]                           dc.w $7fff
[000b5d78]                           dc.w $ffff
[000b5d7a]                           dc.w $ffff
[000b5d7c]                           dc.w $4800
[000b5d7e]                           dc.w $0c00
[000b5d80]                           dc.w $0083
[000b5d82]                           dc.w $4a40
[000b5d84]                           dc.w $0c00
[000b5d86]                           dc.w $00bf
[000b5d88]                           dc.w $4bcf
[000b5d8a]                           dc.w $0c00
[000b5d8c]                           dc.w $00bf
[000b5d8e]                           dc.w $4800
[000b5d90]                           dc.w $0c00
[000b5d92]                           dc.w $00ff
[000b5d94]                           dc.w $4fff
[000b5d96]                           dc.w $fc00
[000b5d98]                           dc.w $00bf
[000b5d9a]                           dc.w $47ff
[000b5d9c]                           dc.w $fc00
[000b5d9e]                           dc.w $00ff
[000b5da0]                           dc.w $4000
[000b5da2]                           dc.w $0000
[000b5da4]                           dc.w $00c7
[000b5da6]                           dc.w $4000
[000b5da8]                           dc.w $0000
[000b5daa]                           dc.w $00ef
[000b5dac]                           dc.w $4000
[000b5dae]                           dc.w $0000
[000b5db0]                           dc.w $00ff
[000b5db2]                           dc.w $7fff
[000b5db4]                           dc.w $ffff
[000b5db6]                           dc.w $ffff
[000b5db8]                           dc.w $5f01
[000b5dba]                           dc.w $0080
[000b5dbc]                           dc.w $2fbf
[000b5dbe]                           dc.w $7701
[000b5dc0]                           dc.w $7f80
[000b5dc2]                           dc.w $3bc7
[000b5dc4]                           dc.w $6701
[000b5dc6]                           dc.w $7f80
[000b5dc8]                           dc.w $39cf
[000b5dca]                           dc.w $7701
[000b5dcc]                           dc.w $7f80
[000b5dce]                           dc.w $3bd7
[000b5dd0]                           dc.w $7f01
[000b5dd2]                           dc.w $7f80
[000b5dd4]                           dc.w $3fff
[000b5dd6]                           dc.w $7fff
[000b5dd8]                           dc.w $ffff
[000b5dda]                           dc.w $ffff
[000b5ddc]                           dc.w $3fff
[000b5dde]                           dc.w $ffff
[000b5de0]                           dc.w $ffff
[000b5de2]                           dc.w $0000
[000b5de4]                           dc.w $0000
[000b5de6]                           dc.w $0000
[000b5de8]                           dc.w $7fff
[000b5dea]                           dc.w $ffff
[000b5dec]                           dc.w $fffe
[000b5dee]                           dc.w $4100
[000b5df0]                           dc.w $0000
[000b5df2]                           dc.w $0083
[000b5df4]                           dc.w $4900
[000b5df6]                           dc.w $0000
[000b5df8]                           dc.w $00ab
[000b5dfa]                           dc.w $5500
[000b5dfc]                           dc.w $0000
[000b5dfe]                           dc.w $0093
[000b5e00]                           dc.w $4900
[000b5e02]                           dc.w $0000
[000b5e04]                           dc.w $00ab
[000b5e06]                           dc.w $4100
[000b5e08]                           dc.w $0000
[000b5e0a]                           dc.w $0083
[000b5e0c]                           dc.w $7fff
[000b5e0e]                           dc.w $ffff
[000b5e10]                           dc.w $ffff
[000b5e12]                           dc.w $4fff
[000b5e14]                           dc.w $f800
[000b5e16]                           dc.w $0083
[000b5e18]                           dc.w $4edb
[000b5e1a]                           dc.w $f800
[000b5e1c]                           dc.w $0093
[000b5e1e]                           dc.w $4e1b
[000b5e20]                           dc.w $f800
[000b5e22]                           dc.w $00bb
[000b5e24]                           dc.w $4ed8
[000b5e26]                           dc.w $f800
[000b5e28]                           dc.w $0083
[000b5e2a]                           dc.w $4fff
[000b5e2c]                           dc.w $f800
[000b5e2e]                           dc.w $0083
[000b5e30]                           dc.w $7fff
[000b5e32]                           dc.w $ffff
[000b5e34]                           dc.w $ffff
[000b5e36]                           dc.w $4800
[000b5e38]                           dc.w $0c00
[000b5e3a]                           dc.w $0083
[000b5e3c]                           dc.w $4a40
[000b5e3e]                           dc.w $0c00
[000b5e40]                           dc.w $0083
[000b5e42]                           dc.w $4bcf
[000b5e44]                           dc.w $0c00
[000b5e46]                           dc.w $0083
[000b5e48]                           dc.w $4800
[000b5e4a]                           dc.w $0c00
[000b5e4c]                           dc.w $00ff
[000b5e4e]                           dc.w $4fff
[000b5e50]                           dc.w $fc00
[000b5e52]                           dc.w $0083
[000b5e54]                           dc.w $47ff
[000b5e56]                           dc.w $fc00
[000b5e58]                           dc.w $0083
[000b5e5a]                           dc.w $4000
[000b5e5c]                           dc.w $0000
[000b5e5e]                           dc.w $00bb
[000b5e60]                           dc.w $4000
[000b5e62]                           dc.w $0000
[000b5e64]                           dc.w $0093
[000b5e66]                           dc.w $4000
[000b5e68]                           dc.w $0000
[000b5e6a]                           dc.w $0083
[000b5e6c]                           dc.w $7fff
[000b5e6e]                           dc.w $ffff
[000b5e70]                           dc.w $ffff
[000b5e72]                           dc.w $41ff
[000b5e74]                           dc.w $00ff
[000b5e76]                           dc.w $e083
[000b5e78]                           dc.w $49ff
[000b5e7a]                           dc.w $00ff
[000b5e7c]                           dc.w $e4bb
[000b5e7e]                           dc.w $59ff
[000b5e80]                           dc.w $00ff
[000b5e82]                           dc.w $e6b3
[000b5e84]                           dc.w $49ff
[000b5e86]                           dc.w $00ff
[000b5e88]                           dc.w $e4ab
[000b5e8a]                           dc.w $41ff
[000b5e8c]                           dc.w $00ff
[000b5e8e]                           dc.w $e083
[000b5e90]                           dc.w $7fff
[000b5e92]                           dc.w $ffff
[000b5e94]                           dc.w $ffff
[000b5e96]                           dc.w $3fff
[000b5e98]                           dc.w $ffff
[000b5e9a]                           dc.w $ffff
DATAS_28:
[000b5e9c]                           dc.w $0000
[000b5e9e]                           dc.w $0000
[000b5ea0]                           dc.w $0000
[000b5ea2]                           dc.w $7fff
[000b5ea4]                           dc.w $ffff
[000b5ea6]                           dc.w $fffe
[000b5ea8]                           dc.w $7fff
[000b5eaa]                           dc.w $ffff
[000b5eac]                           dc.w $ffff
[000b5eae]                           dc.w $7fff
[000b5eb0]                           dc.w $ffff
[000b5eb2]                           dc.w $ffff
[000b5eb4]                           dc.w $7fff
[000b5eb6]                           dc.w $ffff
[000b5eb8]                           dc.w $ffff
[000b5eba]                           dc.w $7fff
[000b5ebc]                           dc.w $ffff
[000b5ebe]                           dc.w $ffff
[000b5ec0]                           dc.w $7fff
[000b5ec2]                           dc.w $ffff
[000b5ec4]                           dc.w $ffff
[000b5ec6]                           dc.w $7fff
[000b5ec8]                           dc.w $ffff
[000b5eca]                           dc.w $ffff
[000b5ecc]                           dc.w $7fff
[000b5ece]                           dc.w $ffff
[000b5ed0]                           dc.w $ffff
[000b5ed2]                           dc.w $7fff
[000b5ed4]                           dc.w $ffff
[000b5ed6]                           dc.w $ffff
[000b5ed8]                           dc.w $7fff
[000b5eda]                           dc.w $ffff
[000b5edc]                           dc.w $ffff
[000b5ede]                           dc.w $7fff
[000b5ee0]                           dc.w $ffff
[000b5ee2]                           dc.w $ffff
[000b5ee4]                           dc.w $7fff
[000b5ee6]                           dc.w $ffff
[000b5ee8]                           dc.w $ffff
[000b5eea]                           dc.w $7fff
[000b5eec]                           dc.w $ffff
[000b5eee]                           dc.w $ffff
[000b5ef0]                           dc.w $7fff
[000b5ef2]                           dc.w $ffff
[000b5ef4]                           dc.w $ffff
[000b5ef6]                           dc.w $7fff
[000b5ef8]                           dc.w $ffff
[000b5efa]                           dc.w $ffff
[000b5efc]                           dc.w $7fff
[000b5efe]                           dc.w $ffff
[000b5f00]                           dc.w $ffff
[000b5f02]                           dc.w $7fff
[000b5f04]                           dc.w $ffff
[000b5f06]                           dc.w $ffff
[000b5f08]                           dc.w $7fff
[000b5f0a]                           dc.w $ffff
[000b5f0c]                           dc.w $ffff
[000b5f0e]                           dc.w $7fff
[000b5f10]                           dc.w $ffff
[000b5f12]                           dc.w $ffff
[000b5f14]                           dc.w $7fff
[000b5f16]                           dc.w $ffff
[000b5f18]                           dc.w $ffff
[000b5f1a]                           dc.w $7fff
[000b5f1c]                           dc.w $ffff
[000b5f1e]                           dc.w $ffff
[000b5f20]                           dc.w $7fff
[000b5f22]                           dc.w $ffff
[000b5f24]                           dc.w $ffff
[000b5f26]                           dc.w $7fff
[000b5f28]                           dc.w $ffff
[000b5f2a]                           dc.w $ffff
[000b5f2c]                           dc.w $7fff
[000b5f2e]                           dc.w $ffff
[000b5f30]                           dc.w $ffff
[000b5f32]                           dc.w $7fff
[000b5f34]                           dc.w $ffff
[000b5f36]                           dc.w $ffff
[000b5f38]                           dc.w $7fff
[000b5f3a]                           dc.w $ffff
[000b5f3c]                           dc.w $ffff
[000b5f3e]                           dc.w $7fff
[000b5f40]                           dc.w $ffff
[000b5f42]                           dc.w $ffff
[000b5f44]                           dc.w $7fff
[000b5f46]                           dc.w $ffff
[000b5f48]                           dc.w $ffff
[000b5f4a]                           dc.w $7fff
[000b5f4c]                           dc.w $ffff
[000b5f4e]                           dc.w $ffff
[000b5f50]                           dc.w $3fff
[000b5f52]                           dc.w $ffff
[000b5f54]                           dc.w $ffff
A_3DBUTTON01:
[000b5f56] 00064a22                  dc.l A_3Dbutton
[000b5f5a]                           dc.w $2011
[000b5f5c]                           dc.w $9178
[000b5f5e] 000630f2                  dc.l Auo_string
[000b5f62]                           dc.w $0000
[000b5f64]                           dc.w $0000
[000b5f66]                           dc.w $0000
[000b5f68]                           dc.w $0000
[000b5f6a]                           dc.w $0000
[000b5f6c]                           dc.w $0000
[000b5f6e]                           dc.w $0000
[000b5f70]                           dc.w $0000
[000b5f72]                           dc.w $0000
[000b5f74]                           dc.w $0000
A_3DBUTTON02:
[000b5f76] 00064a22                  dc.l A_3Dbutton
[000b5f7a]                           dc.w $21f1
[000b5f7c]                           dc.w $01f8
[000b5f7e] 000630f2                  dc.l Auo_string
[000b5f82]                           dc.w $0000
[000b5f84]                           dc.w $0000
[000b5f86]                           dc.w $0000
[000b5f88]                           dc.w $0000
[000b5f8a]                           dc.w $0000
[000b5f8c]                           dc.w $0000
[000b5f8e]                           dc.w $0000
[000b5f90]                           dc.w $0000
[000b5f92]                           dc.w $0000
[000b5f94]                           dc.w $0000
A_3DBUTTON03:
[000b5f96] 00064a22                  dc.l A_3Dbutton
[000b5f9a]                           dc.w $29f1
[000b5f9c]                           dc.w $0108
[000b5f9e] 000630f2                  dc.l Auo_string
[000b5fa2] 000b5b55                  dc.l TEXT_40
[000b5fa6]                           dc.w $0000
[000b5fa8]                           dc.w $0000
[000b5faa]                           dc.w $0000
[000b5fac]                           dc.w $0000
[000b5fae] 000b4a09                  dc.l BUBBLE_25
[000b5fb2]                           dc.w $0000
[000b5fb4]                           dc.w $0000
A_3DBUTTON04:
[000b5fb6] 00064a22                  dc.l A_3Dbutton
[000b5fba]                           dc.w $29c1
[000b5fbc]                           dc.w $0178
[000b5fbe] 000630f2                  dc.l Auo_string
[000b5fc2] 000b5a08                  dc.l TEXT_004
[000b5fc6]                           dc.w $0000
[000b5fc8]                           dc.w $0000
[000b5fca]                           dc.w $0000
[000b5fcc]                           dc.w $0000
[000b5fce]                           dc.w $0000
[000b5fd0]                           dc.w $0000
[000b5fd2]                           dc.w $0000
[000b5fd4]                           dc.w $0000
A_3DBUTTON05:
[000b5fd6] 00064a22                  dc.l A_3Dbutton
[000b5fda]                           dc.w $29c1
[000b5fdc]                           dc.w $0178
[000b5fde] 000630f2                  dc.l Auo_string
[000b5fe2] 000b5a05                  dc.l TEXT_003
[000b5fe6]                           dc.w $0000
[000b5fe8]                           dc.w $0000
[000b5fea]                           dc.w $0000
[000b5fec]                           dc.w $0000
[000b5fee]                           dc.w $0000
[000b5ff0]                           dc.w $0000
[000b5ff2]                           dc.w $0000
[000b5ff4]                           dc.w $0000
A_3DBUTTON06:
[000b5ff6] 00064a22                  dc.l A_3Dbutton
[000b5ffa]                           dc.w $29f1
[000b5ffc]                           dc.w $0108
[000b5ffe] 000630f2                  dc.l Auo_string
[000b6002] 000b5b57                  dc.l TEXT_41
[000b6006]                           dc.w $0000
[000b6008]                           dc.w $0000
[000b600a]                           dc.w $0000
[000b600c]                           dc.w $0000
[000b600e] 000b4a37                  dc.l BUBBLE_26
[000b6012]                           dc.w $0000
[000b6014]                           dc.w $0000
A_3DBUTTON07:
[000b6016] 00064a22                  dc.l A_3Dbutton
[000b601a]                           dc.w $29f1
[000b601c]                           dc.w $0188
[000b601e] 000630f2                  dc.l Auo_string
[000b6022] 000b5b59                  dc.l TEXT_42
[000b6026]                           dc.w $0000
[000b6028]                           dc.w $0000
[000b602a]                           dc.w $0000
[000b602c]                           dc.w $0000
[000b602e] 000b4a60                  dc.l BUBBLE_27
[000b6032]                           dc.w $0000
[000b6034]                           dc.w $0000
A_3DBUTTON08:
[000b6036] 00064a22                  dc.l A_3Dbutton
[000b603a]                           dc.w $29f1
[000b603c]                           dc.w $0191
[000b603e] 000630f2                  dc.l Auo_string
[000b6042] 000b5b5b                  dc.l TEXT_43
[000b6046]                           dc.w $0000
[000b6048]                           dc.w $0000
[000b604a]                           dc.w $0000
[000b604c]                           dc.w $0000
[000b604e] 000b4942                  dc.l BUBBLE_23
[000b6052]                           dc.w $0000
[000b6054]                           dc.w $0000
A_3DBUTTON09:
[000b6056] 00064a22                  dc.l A_3Dbutton
[000b605a]                           dc.w $29f1
[000b605c]                           dc.w $0191
[000b605e] 000630f2                  dc.l Auo_string
[000b6062] 000b5b60                  dc.l TEXT_44
[000b6066]                           dc.w $0000
[000b6068]                           dc.w $0000
[000b606a]                           dc.w $0000
[000b606c]                           dc.w $0000
[000b606e] 000b4915                  dc.l BUBBLE_22
[000b6072]                           dc.w $0000
[000b6074]                           dc.w $0000
A_3DBUTTON10:
[000b6076] 00064a22                  dc.l A_3Dbutton
[000b607a]                           dc.w $29f1
[000b607c]                           dc.w $0101
[000b607e] 000630f2                  dc.l Auo_string
[000b6082] 000b5b66                  dc.l TEXT_45
[000b6086]                           dc.w $0000
[000b6088]                           dc.w $0000
[000b608a]                           dc.w $0000
[000b608c]                           dc.w $0000
[000b608e] 000b48e7                  dc.l BUBBLE_21
[000b6092]                           dc.w $0000
[000b6094]                           dc.w $0000
A_3DBUTTON11:
[000b6096] 00064a22                  dc.l A_3Dbutton
[000b609a]                           dc.w $09f1
[000b609c]                           dc.w $0101
[000b609e] 000630f2                  dc.l Auo_string
[000b60a2] 000b5a10                  dc.l TEXT_01
[000b60a6]                           dc.w $0000
[000b60a8]                           dc.w $0000
[000b60aa]                           dc.w $0000
[000b60ac]                           dc.w $0000
[000b60ae] 000b49a9                  dc.l BUBBLE_24
[000b60b2]                           dc.w $0000
[000b60b4]                           dc.w $0000
A_3DBUTTON12:
[000b60b6] 00064a22                  dc.l A_3Dbutton
[000b60ba]                           dc.w $2102
[000b60bc]                           dc.w $1178
[000b60be] 000630f2                  dc.l Auo_string
[000b60c2]                           dc.w $0000
[000b60c4]                           dc.w $0000
[000b60c6]                           dc.w $0000
[000b60c8]                           dc.w $0000
[000b60ca]                           dc.w $0000
[000b60cc]                           dc.w $0000
[000b60ce]                           dc.w $0000
[000b60d0]                           dc.w $0000
[000b60d2]                           dc.w $0000
[000b60d4]                           dc.w $0000
A_3DBUTTON13:
[000b60d6] 00064a22                  dc.l A_3Dbutton
[000b60da]                           dc.w $29f1
[000b60dc]                           dc.w $0188
[000b60de] 000630f2                  dc.l Auo_string
[000b60e2] 000b5a22                  dc.l TEXT_02
[000b60e6]                           dc.w $0000
[000b60e8]                           dc.w $0000
[000b60ea]                           dc.w $0000
[000b60ec]                           dc.w $0000
[000b60ee] 000b4ac4                  dc.l BUBBLE_28
[000b60f2]                           dc.w $0000
[000b60f4]                           dc.w $0000
A_3DBUTTON14:
[000b60f6] 00064a22                  dc.l A_3Dbutton
[000b60fa]                           dc.w $29f1
[000b60fc]                           dc.w $0181
[000b60fe] 000630f2                  dc.l Auo_string
[000b6102] 000b5ada                  dc.l TEXT_24
[000b6106]                           dc.w $0000
[000b6108]                           dc.w $0000
[000b610a]                           dc.w $0000
[000b610c]                           dc.w $0000
[000b610e] 000b4b02                  dc.l BUBBLE_29
[000b6112]                           dc.w $0000
[000b6114]                           dc.w $0000
A_3DBUTTON15:
[000b6116] 00064a22                  dc.l A_3Dbutton
[000b611a]                           dc.w $29f1
[000b611c]                           dc.w $0181
[000b611e] 000630f2                  dc.l Auo_string
[000b6122] 000b5b68                  dc.l TEXT_46
[000b6126]                           dc.w $0000
[000b6128]                           dc.w $0000
[000b612a]                           dc.w $0000
[000b612c]                           dc.w $0000
[000b612e] 000b4bc5                  dc.l BUBBLE_32
[000b6132]                           dc.w $0000
[000b6134]                           dc.w $0000
A_3DBUTTON16:
[000b6136] 00064a22                  dc.l A_3Dbutton
[000b613a]                           dc.w $29f1
[000b613c]                           dc.w $0181
[000b613e] 000630f2                  dc.l Auo_string
[000b6142] 000b5b6a                  dc.l TEXT_47
[000b6146]                           dc.w $0000
[000b6148]                           dc.w $0000
[000b614a]                           dc.w $0000
[000b614c]                           dc.w $0000
[000b614e] 000b4b42                  dc.l BUBBLE_30
[000b6152]                           dc.w $0000
[000b6154]                           dc.w $0000
A_3DBUTTON17:
[000b6156] 00064a22                  dc.l A_3Dbutton
[000b615a]                           dc.w $29f1
[000b615c]                           dc.w $0181
[000b615e] 000630f2                  dc.l Auo_string
[000b6162] 000b5b6c                  dc.l TEXT_48
[000b6166]                           dc.w $0000
[000b6168]                           dc.w $0000
[000b616a]                           dc.w $0000
[000b616c]                           dc.w $0000
[000b616e] 000b4b84                  dc.l BUBBLE_31
[000b6172]                           dc.w $0000
[000b6174]                           dc.w $0000
A_3DBUTTON18:
[000b6176] 00064a22                  dc.l A_3Dbutton
[000b617a]                           dc.w $29f1
[000b617c]                           dc.w $0178
[000b617e] 000630f2                  dc.l Auo_string
[000b6182]                           dc.w $0000
[000b6184]                           dc.w $0000
[000b6186]                           dc.w $0000
[000b6188]                           dc.w $0000
[000b618a]                           dc.w $0000
[000b618c]                           dc.w $0000
[000b618e]                           dc.w $0000
[000b6190]                           dc.w $0000
[000b6192]                           dc.w $0000
[000b6194]                           dc.w $0000
A_3DBUTTON19:
[000b6196] 00064a22                  dc.l A_3Dbutton
[000b619a]                           dc.w $29d1
[000b619c]                           dc.w $0101
[000b619e] 000630f2                  dc.l Auo_string
[000b61a2]                           dc.w $0000
[000b61a4]                           dc.w $0000
[000b61a6]                           dc.w $0000
[000b61a8]                           dc.w $0000
[000b61aa]                           dc.w $0000
[000b61ac]                           dc.w $0000
[000b61ae] 000b4bf2                  dc.l BUBBLE_33
[000b61b2]                           dc.w $0000
[000b61b4]                           dc.w $0000
A_3DBUTTON20:
[000b61b6] 00064a22                  dc.l A_3Dbutton
[000b61ba]                           dc.w $29f1
[000b61bc]                           dc.w $0121
[000b61be] 000630f2                  dc.l Auo_string
[000b61c2]                           dc.w $0000
[000b61c4]                           dc.w $0000
[000b61c6]                           dc.w $0000
[000b61c8]                           dc.w $0000
[000b61ca]                           dc.w $0000
[000b61cc]                           dc.w $0000
[000b61ce]                           dc.w $0000
[000b61d0]                           dc.w $0000
[000b61d2]                           dc.w $0000
[000b61d4]                           dc.w $0000
A_3DBUTTON21:
[000b61d6] 00064a22                  dc.l A_3Dbutton
[000b61da]                           dc.w $29f1
[000b61dc]                           dc.w $0121
[000b61de] 000630f2                  dc.l Auo_string
[000b61e2]                           dc.w $0000
[000b61e4]                           dc.w $0000
[000b61e6]                           dc.w $0000
[000b61e8]                           dc.w $0000
[000b61ea]                           dc.w $0000
[000b61ec]                           dc.w $0000
[000b61ee]                           dc.w $0000
[000b61f0]                           dc.w $0000
[000b61f2]                           dc.w $0000
[000b61f4]                           dc.w $0000
A_3DBUTTON22:
[000b61f6] 00064a22                  dc.l A_3Dbutton
[000b61fa]                           dc.w $29d1
[000b61fc]                           dc.w $0101
[000b61fe] 000630f2                  dc.l Auo_string
[000b6202]                           dc.w $0000
[000b6204]                           dc.w $0000
[000b6206]                           dc.w $0000
[000b6208]                           dc.w $0000
[000b620a]                           dc.w $0000
[000b620c]                           dc.w $0000
[000b620e] 000b4c38                  dc.l BUBBLE_34
[000b6212]                           dc.w $0000
[000b6214]                           dc.w $0000
A_3DBUTTON23:
[000b6216] 00064a22                  dc.l A_3Dbutton
[000b621a]                           dc.w $2011
[000b621c]                           dc.w $9178
[000b621e] 000630f2                  dc.l Auo_string
[000b6222]                           dc.w $0000
[000b6224]                           dc.w $0000
[000b6226]                           dc.w $0000
[000b6228]                           dc.w $0000
[000b622a]                           dc.w $0000
[000b622c]                           dc.w $0000
[000b622e]                           dc.w $0000
[000b6230]                           dc.w $0000
[000b6232]                           dc.w $0000
[000b6234]                           dc.w $0000
A_3DBUTTON24:
[000b6236] 00064a22                  dc.l A_3Dbutton
[000b623a]                           dc.w $29f1
[000b623c]                           dc.w $0101
[000b623e] 000630f2                  dc.l Auo_string
[000b6242] 000b5bab                  dc.l TEXT_56
[000b6246]                           dc.w $0000
[000b6248]                           dc.w $0000
[000b624a]                           dc.w $0000
[000b624c]                           dc.w $0000
[000b624e] 000b59bf                  dc.l BUBBLE_53
[000b6252]                           dc.w $0000
[000b6254]                           dc.w $0000
A_BOXED01:
[000b6256] 0006afea                  dc.l A_boxed
[000b625a]                           dc.w $9038
[000b625c]                           dc.w $2012
[000b625e] 0006a068                  dc.l Auo_boxed
[000b6262]                           dc.w $0000
[000b6264]                           dc.w $0000
[000b6266]                           dc.w $0000
[000b6268]                           dc.w $0000
[000b626a]                           dc.w $0000
[000b626c]                           dc.w $0000
[000b626e] 000b4258                  dc.l BUBBLE_10
[000b6272]                           dc.w $0000
[000b6274]                           dc.w $0000
A_BOXED02:
[000b6276] 0006afea                  dc.l A_boxed
[000b627a]                           dc.w $907a
[000b627c]                           dc.w $0512
[000b627e] 0006a068                  dc.l Auo_boxed
[000b6282]                           dc.w $0000
[000b6284]                           dc.w $0000
[000b6286]                           dc.w $0000
[000b6288]                           dc.w $0000
[000b628a]                           dc.w $0000
[000b628c]                           dc.w $0000
[000b628e] 000b46c8                  dc.l BUBBLE_17
[000b6292]                           dc.w $0000
[000b6294]                           dc.w $0000
A_BOXED03:
[000b6296] 0006afea                  dc.l A_boxed
[000b629a]                           dc.w $9070
[000b629c]                           dc.w $0512
[000b629e] 0006a068                  dc.l Auo_boxed
[000b62a2]                           dc.w $0000
[000b62a4]                           dc.w $0000
[000b62a6]                           dc.w $0000
[000b62a8]                           dc.w $0000
[000b62aa]                           dc.w $0000
[000b62ac]                           dc.w $0000
[000b62ae] 000b47d2                  dc.l BUBBLE_19
[000b62b2]                           dc.w $0000
[000b62b4]                           dc.w $0000
A_BOXED04:
[000b62b6] 0006afea                  dc.l A_boxed
[000b62ba]                           dc.w $9018
[000b62bc]                           dc.w $0812
[000b62be] 0006a068                  dc.l Auo_boxed
[000b62c2]                           dc.w $0000
[000b62c4]                           dc.w $0000
[000b62c6]                           dc.w $0000
[000b62c8]                           dc.w $0000
[000b62ca]                           dc.w $0000
[000b62cc]                           dc.w $0000
[000b62ce] 000b3f41                  dc.l BUBBLE_01
[000b62d2]                           dc.w $0000
[000b62d4]                           dc.w $0000
A_BOXED05:
[000b62d6] 0006afea                  dc.l A_boxed
[000b62da]                           dc.w $9078
[000b62dc]                           dc.w $0512
[000b62de] 0006a068                  dc.l Auo_boxed
[000b62e2]                           dc.w $0000
[000b62e4]                           dc.w $0000
[000b62e6]                           dc.w $0000
[000b62e8]                           dc.w $0000
[000b62ea]                           dc.w $0000
[000b62ec]                           dc.w $0000
[000b62ee] 000b474d                  dc.l BUBBLE_18
[000b62f2]                           dc.w $0000
[000b62f4]                           dc.w $0000
A_BOXED06:
[000b62f6] 0006afea                  dc.l A_boxed
[000b62fa]                           dc.w $9038
[000b62fc]                           dc.w $2012
[000b62fe] 0006a068                  dc.l Auo_boxed
[000b6302]                           dc.w $0000
[000b6304]                           dc.w $0000
[000b6306]                           dc.w $0000
[000b6308]                           dc.w $0000
[000b630a]                           dc.w $0000
[000b630c]                           dc.w $0000
[000b630e] 000b41fe                  dc.l BUBBLE_09
[000b6312]                           dc.w $0000
[000b6314]                           dc.w $0000
A_BOXED07:
[000b6316] 0006afea                  dc.l A_boxed
[000b631a]                           dc.w $9038
[000b631c]                           dc.w $2012
[000b631e] 0006a068                  dc.l Auo_boxed
[000b6322]                           dc.w $0000
[000b6324]                           dc.w $0000
[000b6326]                           dc.w $0000
[000b6328]                           dc.w $0000
[000b632a]                           dc.w $0000
[000b632c]                           dc.w $0000
[000b632e] 000b3fb8                  dc.l BUBBLE_02
[000b6332]                           dc.w $0000
[000b6334]                           dc.w $0000
A_BOXED08:
[000b6336] 0006afea                  dc.l A_boxed
[000b633a]                           dc.w $9038
[000b633c]                           dc.w $2012
[000b633e] 0006a068                  dc.l Auo_boxed
[000b6342]                           dc.w $0000
[000b6344]                           dc.w $0000
[000b6346]                           dc.w $0000
[000b6348]                           dc.w $0000
[000b634a]                           dc.w $0000
[000b634c]                           dc.w $0000
[000b634e] 000b42bb                  dc.l BUBBLE_11
[000b6352]                           dc.w $0000
[000b6354]                           dc.w $0000
A_BOXED09:
[000b6356] 0006afea                  dc.l A_boxed
[000b635a]                           dc.w $9038
[000b635c]                           dc.w $2012
[000b635e] 0006a068                  dc.l Auo_boxed
[000b6362]                           dc.w $0000
[000b6364]                           dc.w $0000
[000b6366]                           dc.w $0000
[000b6368]                           dc.w $0000
[000b636a]                           dc.w $0000
[000b636c]                           dc.w $0000
[000b636e] 000b435d                  dc.l BUBBLE_12
[000b6372]                           dc.w $0000
[000b6374]                           dc.w $0000
A_BOXED10:
[000b6376] 0006afea                  dc.l A_boxed
[000b637a]                           dc.w $9038
[000b637c]                           dc.w $2012
[000b637e] 0006a068                  dc.l Auo_boxed
[000b6382]                           dc.w $0000
[000b6384]                           dc.w $0000
[000b6386]                           dc.w $0000
[000b6388]                           dc.w $0000
[000b638a]                           dc.w $0000
[000b638c]                           dc.w $0000
[000b638e] 000b43ff                  dc.l BUBBLE_13
[000b6392]                           dc.w $0000
[000b6394]                           dc.w $0000
A_BOXED11:
[000b6396] 0006afea                  dc.l A_boxed
[000b639a]                           dc.w $9038
[000b639c]                           dc.w $2012
[000b639e] 0006a068                  dc.l Auo_boxed
[000b63a2]                           dc.w $0000
[000b63a4]                           dc.w $0000
[000b63a6]                           dc.w $0000
[000b63a8]                           dc.w $0000
[000b63aa]                           dc.w $0000
[000b63ac]                           dc.w $0000
[000b63ae] 000b44b7                  dc.l BUBBLE_14
[000b63b2]                           dc.w $0000
[000b63b4]                           dc.w $0000
A_BOXED12:
[000b63b6] 0006afea                  dc.l A_boxed
[000b63ba]                           dc.w $9038
[000b63bc]                           dc.w $2012
[000b63be] 0006a068                  dc.l Auo_boxed
[000b63c2]                           dc.w $0000
[000b63c4]                           dc.w $0000
[000b63c6]                           dc.w $0000
[000b63c8]                           dc.w $0000
[000b63ca]                           dc.w $0000
[000b63cc]                           dc.w $0000
[000b63ce] 000b454b                  dc.l BUBBLE_15
[000b63d2]                           dc.w $0000
[000b63d4]                           dc.w $0000
A_BOXED13:
[000b63d6] 0006afea                  dc.l A_boxed
[000b63da]                           dc.w $9070
[000b63dc]                           dc.w $0512
[000b63de] 0006a068                  dc.l Auo_boxed
[000b63e2]                           dc.w $0000
[000b63e4]                           dc.w $0000
[000b63e6]                           dc.w $0000
[000b63e8]                           dc.w $0000
[000b63ea]                           dc.w $0000
[000b63ec]                           dc.w $0000
[000b63ee] 000b485b                  dc.l BUBBLE_20
[000b63f2]                           dc.w $0000
[000b63f4]                           dc.w $0000
A_BOXED14:
[000b63f6] 0006afea                  dc.l A_boxed
[000b63fa]                           dc.w $9038
[000b63fc]                           dc.w $2012
[000b63fe] 0006a068                  dc.l Auo_boxed
[000b6402]                           dc.w $0000
[000b6404]                           dc.w $0000
[000b6406]                           dc.w $0000
[000b6408]                           dc.w $0000
[000b640a]                           dc.w $0000
[000b640c]                           dc.w $0000
[000b640e] 000b4e0b                  dc.l BUBBLE_37
[000b6412]                           dc.w $0000
[000b6414]                           dc.w $0000
A_BOXED15:
[000b6416] 0006afea                  dc.l A_boxed
[000b641a]                           dc.w $9038
[000b641c]                           dc.w $2012
[000b641e] 0006a068                  dc.l Auo_boxed
[000b6422]                           dc.w $0000
[000b6424]                           dc.w $0000
[000b6426]                           dc.w $0000
[000b6428]                           dc.w $0000
[000b642a]                           dc.w $0000
[000b642c]                           dc.w $0000
[000b642e] 000b4c80                  dc.l BUBBLE_35
[000b6432]                           dc.w $0000
[000b6434]                           dc.w $0000
A_BOXED16:
[000b6436] 0006afea                  dc.l A_boxed
[000b643a]                           dc.w $9038
[000b643c]                           dc.w $2012
[000b643e] 0006a068                  dc.l Auo_boxed
[000b6442]                           dc.w $0000
[000b6444]                           dc.w $0000
[000b6446]                           dc.w $0000
[000b6448]                           dc.w $0000
[000b644a]                           dc.w $0000
[000b644c]                           dc.w $0000
[000b644e] 000b4d51                  dc.l BUBBLE_36
[000b6452]                           dc.w $0000
[000b6454]                           dc.w $0000
A_BOXED17:
[000b6456] 0006afea                  dc.l A_boxed
[000b645a]                           dc.w $9038
[000b645c]                           dc.w $2012
[000b645e] 0006a068                  dc.l Auo_boxed
[000b6462]                           dc.w $0000
[000b6464]                           dc.w $0000
[000b6466]                           dc.w $0000
[000b6468]                           dc.w $0000
[000b646a]                           dc.w $0000
[000b646c]                           dc.w $0000
[000b646e] 000b5044                  dc.l BUBBLE_40
[000b6472]                           dc.w $0000
[000b6474]                           dc.w $0000
A_BOXED18:
[000b6476] 0006afea                  dc.l A_boxed
[000b647a]                           dc.w $9038
[000b647c]                           dc.w $2012
[000b647e] 0006a068                  dc.l Auo_boxed
[000b6482]                           dc.w $0000
[000b6484]                           dc.w $0000
[000b6486]                           dc.w $0000
[000b6488]                           dc.w $0000
[000b648a]                           dc.w $0000
[000b648c]                           dc.w $0000
[000b648e] 000b4f8b                  dc.l BUBBLE_39
[000b6492]                           dc.w $0000
[000b6494]                           dc.w $0000
A_BOXED19:
[000b6496] 0006afea                  dc.l A_boxed
[000b649a]                           dc.w $9038
[000b649c]                           dc.w $2012
[000b649e] 0006a068                  dc.l Auo_boxed
[000b64a2]                           dc.w $0000
[000b64a4]                           dc.w $0000
[000b64a6]                           dc.w $0000
[000b64a8]                           dc.w $0000
[000b64aa]                           dc.w $0000
[000b64ac]                           dc.w $0000
[000b64ae] 000b4ecb                  dc.l BUBBLE_38
[000b64b2]                           dc.w $0000
[000b64b4]                           dc.w $0000
A_BOXED20:
[000b64b6] 0006afea                  dc.l A_boxed
[000b64ba]                           dc.w $9038
[000b64bc]                           dc.w $2012
[000b64be] 0006a068                  dc.l Auo_boxed
[000b64c2]                           dc.w $0000
[000b64c4]                           dc.w $0000
[000b64c6]                           dc.w $0000
[000b64c8]                           dc.w $0000
[000b64ca]                           dc.w $0000
[000b64cc]                           dc.w $0000
[000b64ce] 000b50fe                  dc.l BUBBLE_41
[000b64d2]                           dc.w $0000
[000b64d4]                           dc.w $0000
A_BOXED21:
[000b64d6] 0006afea                  dc.l A_boxed
[000b64da]                           dc.w $9038
[000b64dc]                           dc.w $2012
[000b64de] 0006a068                  dc.l Auo_boxed
[000b64e2]                           dc.w $0000
[000b64e4]                           dc.w $0000
[000b64e6]                           dc.w $0000
[000b64e8]                           dc.w $0000
[000b64ea]                           dc.w $0000
[000b64ec]                           dc.w $0000
[000b64ee] 000b51bc                  dc.l BUBBLE_42
[000b64f2]                           dc.w $0000
[000b64f4]                           dc.w $0000
A_BOXED22:
[000b64f6] 0006afea                  dc.l A_boxed
[000b64fa]                           dc.w $9038
[000b64fc]                           dc.w $2012
[000b64fe] 0006a068                  dc.l Auo_boxed
[000b6502]                           dc.w $0000
[000b6504]                           dc.w $0000
[000b6506]                           dc.w $0000
[000b6508]                           dc.w $0000
[000b650a]                           dc.w $0000
[000b650c]                           dc.w $0000
[000b650e] 000b527a                  dc.l BUBBLE_43
[000b6512]                           dc.w $0000
[000b6514]                           dc.w $0000
A_BOXED23:
[000b6516] 0006afea                  dc.l A_boxed
[000b651a]                           dc.w $9038
[000b651c]                           dc.w $2012
[000b651e] 0006a068                  dc.l Auo_boxed
[000b6522]                           dc.w $0000
[000b6524]                           dc.w $0000
[000b6526]                           dc.w $0000
[000b6528]                           dc.w $0000
[000b652a]                           dc.w $0000
[000b652c]                           dc.w $0000
[000b652e] 000b5338                  dc.l BUBBLE_44
[000b6532]                           dc.w $0000
[000b6534]                           dc.w $0000
A_BOXED24:
[000b6536] 0006afea                  dc.l A_boxed
[000b653a]                           dc.w $9038
[000b653c]                           dc.w $2012
[000b653e] 0006a068                  dc.l Auo_boxed
[000b6542]                           dc.w $0000
[000b6544]                           dc.w $0000
[000b6546]                           dc.w $0000
[000b6548]                           dc.w $0000
[000b654a]                           dc.w $0000
[000b654c]                           dc.w $0000
[000b654e] 000b53f6                  dc.l BUBBLE_45
[000b6552]                           dc.w $0000
[000b6554]                           dc.w $0000
A_BOXED25:
[000b6556] 0006afea                  dc.l A_boxed
[000b655a]                           dc.w $9038
[000b655c]                           dc.w $2012
[000b655e] 0006a068                  dc.l Auo_boxed
[000b6562]                           dc.w $0000
[000b6564]                           dc.w $0000
[000b6566]                           dc.w $0000
[000b6568]                           dc.w $0000
[000b656a]                           dc.w $0000
[000b656c]                           dc.w $0000
[000b656e] 000b54b6                  dc.l BUBBLE_46
[000b6572]                           dc.w $0000
[000b6574]                           dc.w $0000
A_BOXED26:
[000b6576] 0006afea                  dc.l A_boxed
[000b657a]                           dc.w $9038
[000b657c]                           dc.w $2012
[000b657e] 0006a068                  dc.l Auo_boxed
[000b6582]                           dc.w $0000
[000b6584]                           dc.w $0000
[000b6586]                           dc.w $0000
[000b6588]                           dc.w $0000
[000b658a]                           dc.w $0000
[000b658c]                           dc.w $0000
[000b658e] 000b556c                  dc.l BUBBLE_47
[000b6592]                           dc.w $0000
[000b6594]                           dc.w $0000
A_BOXED27:
[000b6596] 0006afea                  dc.l A_boxed
[000b659a]                           dc.w $9038
[000b659c]                           dc.w $2012
[000b659e] 0006a068                  dc.l Auo_boxed
[000b65a2]                           dc.w $0000
[000b65a4]                           dc.w $0000
[000b65a6]                           dc.w $0000
[000b65a8]                           dc.w $0000
[000b65aa]                           dc.w $0000
[000b65ac]                           dc.w $0000
[000b65ae] 000b5622                  dc.l BUBBLE_48
[000b65b2]                           dc.w $0000
[000b65b4]                           dc.w $0000
A_BOXED28:
[000b65b6] 0006afea                  dc.l A_boxed
[000b65ba]                           dc.w $9038
[000b65bc]                           dc.w $2012
[000b65be] 0006a068                  dc.l Auo_boxed
[000b65c2]                           dc.w $0000
[000b65c4]                           dc.w $0000
[000b65c6]                           dc.w $0000
[000b65c8]                           dc.w $0000
[000b65ca]                           dc.w $0000
[000b65cc]                           dc.w $0000
[000b65ce] 000b56d7                  dc.l BUBBLE_49
[000b65d2]                           dc.w $0000
[000b65d4]                           dc.w $0000
A_BOXED29:
[000b65d6] 0006afea                  dc.l A_boxed
[000b65da]                           dc.w $9038
[000b65dc]                           dc.w $2012
[000b65de] 0006a068                  dc.l Auo_boxed
[000b65e2]                           dc.w $0000
[000b65e4]                           dc.w $0000
[000b65e6]                           dc.w $0000
[000b65e8]                           dc.w $0000
[000b65ea]                           dc.w $0000
[000b65ec]                           dc.w $0000
[000b65ee] 000b578c                  dc.l BUBBLE_50
[000b65f2]                           dc.w $0000
[000b65f4]                           dc.w $0000
A_BOXED30:
[000b65f6] 0006afea                  dc.l A_boxed
[000b65fa]                           dc.w $9038
[000b65fc]                           dc.w $2012
[000b65fe] 0006a068                  dc.l Auo_boxed
[000b6602]                           dc.w $0000
[000b6604]                           dc.w $0000
[000b6606]                           dc.w $0000
[000b6608]                           dc.w $0000
[000b660a]                           dc.w $0000
[000b660c]                           dc.w $0000
[000b660e] 000b5845                  dc.l BUBBLE_51
[000b6612]                           dc.w $0000
[000b6614]                           dc.w $0000
A_BOXED31:
[000b6616] 0006afea                  dc.l A_boxed
[000b661a]                           dc.w $9038
[000b661c]                           dc.w $2012
[000b661e] 0006a068                  dc.l Auo_boxed
[000b6622]                           dc.w $0000
[000b6624]                           dc.w $0000
[000b6626]                           dc.w $0000
[000b6628]                           dc.w $0000
[000b662a]                           dc.w $0000
[000b662c]                           dc.w $0000
[000b662e] 000b5902                  dc.l BUBBLE_52
[000b6632]                           dc.w $0000
[000b6634]                           dc.w $0000
A_CHECKBOX01:
[000b6636] 0006323e                  dc.l A_checkbox
[000b663a]                           dc.w $0000
[000b663c]                           dc.w $0001
[000b663e] 000630f2                  dc.l Auo_string
[000b6642] 000b5a2a                  dc.l TEXT_04
[000b6646]                           dc.w $0000
[000b6648]                           dc.w $0000
[000b664a]                           dc.w $0000
[000b664c]                           dc.w $0000
[000b664e] 000b4025                  dc.l BUBBLE_04
[000b6652]                           dc.w $0000
[000b6654]                           dc.w $0000
A_CHECKBOX02:
[000b6656] 0006323e                  dc.l A_checkbox
[000b665a]                           dc.w $0000
[000b665c]                           dc.w $0001
[000b665e] 000630f2                  dc.l Auo_string
[000b6662] 000b5a31                  dc.l TEXT_05
[000b6666]                           dc.w $0000
[000b6668]                           dc.w $0000
[000b666a]                           dc.w $0000
[000b666c]                           dc.w $0000
[000b666e] 000b4105                  dc.l BUBBLE_07
[000b6672]                           dc.w $0000
[000b6674]                           dc.w $0000
A_CHECKBOX03:
[000b6676] 0006323e                  dc.l A_checkbox
[000b667a]                           dc.w $0000
[000b667c]                           dc.w $0001
[000b667e] 000630f2                  dc.l Auo_string
[000b6682] 000b5a36                  dc.l TEXT_06
[000b6686]                           dc.w $0000
[000b6688]                           dc.w $0000
[000b668a]                           dc.w $0000
[000b668c]                           dc.w $0000
[000b668e] 000b40ad                  dc.l BUBBLE_06
[000b6692]                           dc.w $0000
[000b6694]                           dc.w $0000
A_CHECKBOX04:
[000b6696] 0006323e                  dc.l A_checkbox
[000b669a]                           dc.w $0000
[000b669c]                           dc.w $0001
[000b669e] 000630f2                  dc.l Auo_string
[000b66a2] 000b5a40                  dc.l TEXT_07
[000b66a6]                           dc.w $0000
[000b66a8]                           dc.w $0000
[000b66aa]                           dc.w $0000
[000b66ac]                           dc.w $0000
[000b66ae] 000b41a0                  dc.l BUBBLE_08
[000b66b2]                           dc.w $0000
[000b66b4]                           dc.w $0000
A_CHECKBOX05:
[000b66b6] 0006323e                  dc.l A_checkbox
[000b66ba]                           dc.w $0000
[000b66bc]                           dc.w $0001
[000b66be] 000630f2                  dc.l Auo_string
[000b66c2] 000b5a4a                  dc.l TEXT_08
[000b66c6]                           dc.w $0000
[000b66c8]                           dc.w $0000
[000b66ca]                           dc.w $0000
[000b66cc]                           dc.w $0000
[000b66ce] 000b4064                  dc.l BUBBLE_05
[000b66d2]                           dc.w $0000
[000b66d4]                           dc.w $0000
A_CHECKBOX07:
[000b66d6] 0006323e                  dc.l A_checkbox
[000b66da]                           dc.w $0000
[000b66dc]                           dc.w $0001
[000b66de] 000630f2                  dc.l Auo_string
[000b66e2] 000b5a24                  dc.l TEXT_03
[000b66e6]                           dc.w $0000
[000b66e8]                           dc.w $0000
[000b66ea]                           dc.w $0000
[000b66ec]                           dc.w $0000
[000b66ee] 000b3fef                  dc.l BUBBLE_03
[000b66f2]                           dc.w $0000
[000b66f4]                           dc.w $0000
A_INNERFRAME01:
[000b66f6] 00064256                  dc.l A_innerframe
[000b66fa]                           dc.w $1800
[000b66fc]                           dc.w $8f19
[000b66fe] 000630f2                  dc.l Auo_string
[000b6702] 000b5a5e                  dc.l TEXT_10
[000b6706]                           dc.w $0000
[000b6708]                           dc.w $0000
[000b670a]                           dc.w $0000
[000b670c]                           dc.w $0000
[000b670e]                           dc.w $0000
[000b6710]                           dc.w $0000
[000b6712]                           dc.w $0000
[000b6714]                           dc.w $0000
A_INNERFRAME02:
[000b6716] 00064256                  dc.l A_innerframe
[000b671a]                           dc.w $1800
[000b671c]                           dc.w $8f19
[000b671e] 000630f2                  dc.l Auo_string
[000b6722] 000b5b48                  dc.l TEXT_39
[000b6726]                           dc.w $0000
[000b6728]                           dc.w $0000
[000b672a]                           dc.w $0000
[000b672c]                           dc.w $0000
[000b672e]                           dc.w $0000
[000b6730]                           dc.w $0000
[000b6732]                           dc.w $0000
[000b6734]                           dc.w $0000
A_INNERFRAME03:
[000b6736] 00064256                  dc.l A_innerframe
[000b673a]                           dc.w $1800
[000b673c]                           dc.w $8f19
[000b673e] 000630f2                  dc.l Auo_string
[000b6742] 000b5a96                  dc.l TEXT_16
[000b6746]                           dc.w $0000
[000b6748]                           dc.w $0000
[000b674a]                           dc.w $0000
[000b674c]                           dc.w $0000
[000b674e]                           dc.w $0000
[000b6750]                           dc.w $0000
[000b6752]                           dc.w $0000
[000b6754]                           dc.w $0000
A_INNERFRAME04:
[000b6756] 00064256                  dc.l A_innerframe
[000b675a]                           dc.w $1800
[000b675c]                           dc.w $8f19
[000b675e] 000630f2                  dc.l Auo_string
[000b6762] 000b5aae                  dc.l TEXT_19
[000b6766]                           dc.w $0000
[000b6768]                           dc.w $0000
[000b676a]                           dc.w $0000
[000b676c]                           dc.w $0000
[000b676e]                           dc.w $0000
[000b6770]                           dc.w $0000
[000b6772]                           dc.w $0000
[000b6774]                           dc.w $0000
A_INNERFRAME05:
[000b6776] 00064256                  dc.l A_innerframe
[000b677a]                           dc.w $1800
[000b677c]                           dc.w $8f19
[000b677e] 000630f2                  dc.l Auo_string
[000b6782] 000b5b41                  dc.l TEXT_38
[000b6786]                           dc.w $0000
[000b6788]                           dc.w $0000
[000b678a]                           dc.w $0000
[000b678c]                           dc.w $0000
[000b678e]                           dc.w $0000
[000b6790]                           dc.w $0000
[000b6792]                           dc.w $0000
[000b6794]                           dc.w $0000
A_INNERFRAME06:
[000b6796] 00064256                  dc.l A_innerframe
[000b679a]                           dc.w $1800
[000b679c]                           dc.w $8f19
[000b679e] 000630f2                  dc.l Auo_string
[000b67a2] 000b5b9c                  dc.l TEXT_55
[000b67a6]                           dc.w $0000
[000b67a8]                           dc.w $0000
[000b67aa]                           dc.w $0000
[000b67ac]                           dc.w $0000
[000b67ae]                           dc.w $0000
[000b67b0]                           dc.w $0000
[000b67b2]                           dc.w $0000
[000b67b4]                           dc.w $0000
A_INNERFRAME07:
[000b67b6] 00064256                  dc.l A_innerframe
[000b67ba]                           dc.w $1800
[000b67bc]                           dc.w $8f19
[000b67be] 000630f2                  dc.l Auo_string
[000b67c2] 000b5a9e                  dc.l TEXT_17
[000b67c6]                           dc.w $0000
[000b67c8]                           dc.w $0000
[000b67ca]                           dc.w $0000
[000b67cc]                           dc.w $0000
[000b67ce]                           dc.w $0000
[000b67d0]                           dc.w $0000
[000b67d2]                           dc.w $0000
[000b67d4]                           dc.w $0000
A_INNERFRAME08:
[000b67d6] 00064256                  dc.l A_innerframe
[000b67da]                           dc.w $1800
[000b67dc]                           dc.w $8f19
[000b67de] 000630f2                  dc.l Auo_string
[000b67e2] 000b5a68                  dc.l TEXT_11
[000b67e6]                           dc.w $0000
[000b67e8]                           dc.w $0000
[000b67ea]                           dc.w $0000
[000b67ec]                           dc.w $0000
[000b67ee]                           dc.w $0000
[000b67f0]                           dc.w $0000
[000b67f2]                           dc.w $0000
[000b67f4]                           dc.w $0000
A_SLIDER01:
[000b67f6] 00036928                  dc.l A_slider
[000b67fa]                           dc.w $0000
[000b67fc]                           dc.w $0002
[000b67fe] 000371ba                  dc.l Auo_slider
[000b6802]                           dc.w $0000
[000b6804]                           dc.w $0000
[000b6806]                           dc.w $0000
[000b6808]                           dc.w $0000
[000b680a]                           dc.w $0000
[000b680c]                           dc.w $0000
[000b680e] 000b461f                  dc.l BUBBLE_16
[000b6812]                           dc.w $0000
[000b6814]                           dc.w $0000
_C4_IC_WINDOW:
[000b6816]                           dc.w $0004
[000b6818] 000b5bb4                  dc.l $000b5bb4
[000b681c] 000b5e9c                  dc.l DATAS_28
[000b6820]                           dc.w $0000
[000b6822]                           dc.w $0000
[000b6824]                           dc.w $0000
[000b6826]                           dc.w $0000
[000b6828]                           dc.w $0000
[000b682a]                           dc.w $0000
_MSK_IC_WINDOW:
[000b682c]                           dc.w $0000
[000b682e]                           dc.w $0000
[000b6830]                           dc.w $0000
[000b6832]                           dc.w $7fff
[000b6834]                           dc.w $ffff
[000b6836]                           dc.w $fffe
[000b6838]                           dc.w $7fff
[000b683a]                           dc.w $ffff
[000b683c]                           dc.w $ffff
[000b683e]                           dc.w $7fff
[000b6840]                           dc.w $ffff
[000b6842]                           dc.w $ffff
[000b6844]                           dc.w $7fff
[000b6846]                           dc.w $ffff
[000b6848]                           dc.w $ffff
[000b684a]                           dc.w $7fff
[000b684c]                           dc.w $ffff
[000b684e]                           dc.w $ffff
[000b6850]                           dc.w $7fff
[000b6852]                           dc.w $ffff
[000b6854]                           dc.w $ffff
[000b6856]                           dc.w $7fff
[000b6858]                           dc.w $ffff
[000b685a]                           dc.w $ffff
[000b685c]                           dc.w $7fff
[000b685e]                           dc.w $ffff
[000b6860]                           dc.w $ffff
[000b6862]                           dc.w $7fff
[000b6864]                           dc.w $ffff
[000b6866]                           dc.w $ffff
[000b6868]                           dc.w $7fff
[000b686a]                           dc.w $ffff
[000b686c]                           dc.w $ffff
[000b686e]                           dc.w $7fff
[000b6870]                           dc.w $ffff
[000b6872]                           dc.w $ffff
[000b6874]                           dc.w $7fff
[000b6876]                           dc.w $ffff
[000b6878]                           dc.w $ffff
[000b687a]                           dc.w $7fff
[000b687c]                           dc.w $ffff
[000b687e]                           dc.w $ffff
[000b6880]                           dc.w $7fff
[000b6882]                           dc.w $ffff
[000b6884]                           dc.w $ffff
[000b6886]                           dc.w $7fff
[000b6888]                           dc.w $ffff
[000b688a]                           dc.w $ffff
[000b688c]                           dc.w $7fff
[000b688e]                           dc.w $ffff
[000b6890]                           dc.w $ffff
[000b6892]                           dc.w $7fff
[000b6894]                           dc.w $ffff
[000b6896]                           dc.w $ffff
[000b6898]                           dc.w $7fff
[000b689a]                           dc.w $ffff
[000b689c]                           dc.w $ffff
[000b689e]                           dc.w $7fff
[000b68a0]                           dc.w $ffff
[000b68a2]                           dc.w $ffff
[000b68a4]                           dc.w $7fff
[000b68a6]                           dc.w $ffff
[000b68a8]                           dc.w $ffff
[000b68aa]                           dc.w $7fff
[000b68ac]                           dc.w $ffff
[000b68ae]                           dc.w $ffff
[000b68b0]                           dc.w $7fff
[000b68b2]                           dc.w $ffff
[000b68b4]                           dc.w $ffff
[000b68b6]                           dc.w $7fff
[000b68b8]                           dc.w $ffff
[000b68ba]                           dc.w $ffff
[000b68bc]                           dc.w $7fff
[000b68be]                           dc.w $ffff
[000b68c0]                           dc.w $ffff
[000b68c2]                           dc.w $7fff
[000b68c4]                           dc.w $ffff
[000b68c6]                           dc.w $ffff
[000b68c8]                           dc.w $7fff
[000b68ca]                           dc.w $ffff
[000b68cc]                           dc.w $ffff
[000b68ce]                           dc.w $7fff
[000b68d0]                           dc.w $ffff
[000b68d2]                           dc.w $ffff
[000b68d4]                           dc.w $7fff
[000b68d6]                           dc.w $ffff
[000b68d8]                           dc.w $ffff
[000b68da]                           dc.w $7fff
[000b68dc]                           dc.w $ffff
[000b68de]                           dc.w $ffff
[000b68e0]                           dc.w $3fff
[000b68e2]                           dc.w $ffff
[000b68e4]                           dc.w $ffff
_DAT_IC_WINDOW:
[000b68e6]                           dc.w $0000
[000b68e8]                           dc.w $0000
[000b68ea]                           dc.w $0000
[000b68ec]                           dc.w $7fff
[000b68ee]                           dc.w $ffff
[000b68f0]                           dc.w $fffe
[000b68f2]                           dc.w $4155
[000b68f4]                           dc.w $0002
[000b68f6]                           dc.w $aa83
[000b68f8]                           dc.w $49aa
[000b68fa]                           dc.w $6401
[000b68fc]                           dc.w $55ab
[000b68fe]                           dc.w $5555
[000b6900]                           dc.w $5492
[000b6902]                           dc.w $aa93
[000b6904]                           dc.w $49aa
[000b6906]                           dc.w $4cf1
[000b6908]                           dc.w $55ab
[000b690a]                           dc.w $4155
[000b690c]                           dc.w $0002
[000b690e]                           dc.w $aa83
[000b6910]                           dc.w $7fff
[000b6912]                           dc.w $ffff
[000b6914]                           dc.w $ffff
[000b6916]                           dc.w $4fff
[000b6918]                           dc.w $f800
[000b691a]                           dc.w $0093
[000b691c]                           dc.w $4edb
[000b691e]                           dc.w $f800
[000b6920]                           dc.w $00bb
[000b6922]                           dc.w $4e1b
[000b6924]                           dc.w $f800
[000b6926]                           dc.w $0093
[000b6928]                           dc.w $4ed8
[000b692a]                           dc.w $f800
[000b692c]                           dc.w $0093
[000b692e]                           dc.w $4fff
[000b6930]                           dc.w $f800
[000b6932]                           dc.w $0083
[000b6934]                           dc.w $7fff
[000b6936]                           dc.w $ffff
[000b6938]                           dc.w $ffff
[000b693a]                           dc.w $4800
[000b693c]                           dc.w $0c00
[000b693e]                           dc.w $0083
[000b6940]                           dc.w $4a40
[000b6942]                           dc.w $0c00
[000b6944]                           dc.w $0083
[000b6946]                           dc.w $4bcf
[000b6948]                           dc.w $0c00
[000b694a]                           dc.w $0083
[000b694c]                           dc.w $4800
[000b694e]                           dc.w $0c00
[000b6950]                           dc.w $00ff
[000b6952]                           dc.w $4fff
[000b6954]                           dc.w $fc00
[000b6956]                           dc.w $0083
[000b6958]                           dc.w $47ff
[000b695a]                           dc.w $fc00
[000b695c]                           dc.w $0093
[000b695e]                           dc.w $4000
[000b6960]                           dc.w $0000
[000b6962]                           dc.w $0093
[000b6964]                           dc.w $4000
[000b6966]                           dc.w $0000
[000b6968]                           dc.w $00bb
[000b696a]                           dc.w $4000
[000b696c]                           dc.w $0000
[000b696e]                           dc.w $0093
[000b6970]                           dc.w $7fff
[000b6972]                           dc.w $ffff
[000b6974]                           dc.w $ffff
[000b6976]                           dc.w $4155
[000b6978]                           dc.w $00aa
[000b697a]                           dc.w $a083
[000b697c]                           dc.w $51ab
[000b697e]                           dc.w $00d5
[000b6980]                           dc.w $62bb
[000b6982]                           dc.w $7d55
[000b6984]                           dc.w $00aa
[000b6986]                           dc.w $afb3
[000b6988]                           dc.w $51ab
[000b698a]                           dc.w $00d5
[000b698c]                           dc.w $62ab
[000b698e]                           dc.w $4155
[000b6990]                           dc.w $00aa
[000b6992]                           dc.w $a083
[000b6994]                           dc.w $7fff
[000b6996]                           dc.w $ffff
[000b6998]                           dc.w $ffff
[000b699a]                           dc.w $3fff
[000b699c]                           dc.w $ffff
[000b699e]                           dc.w $ffff
IC_WINDOW:
[000b69a0] 000b682c                  dc.l _MSK_IC_WINDOW
[000b69a4] 000b68e6                  dc.l _DAT_IC_WINDOW
[000b69a8] 000b5abd                  dc.l TEXT_205
[000b69ac]                           dc.w $1000
[000b69ae]                           dc.w $0000
[000b69b0]                           dc.w $0000
[000b69b2]                           dc.w $000c
[000b69b4]                           dc.w $0000
[000b69b6]                           dc.w $0030
[000b69b8]                           dc.w $001f
[000b69ba]                           dc.w $0000
[000b69bc]                           dc.w $0020
[000b69be]                           dc.w $0048
[000b69c0]                           dc.w $0008
[000b69c2] 000b6816                  dc.l _C4_IC_WINDOW
EDIT_WINDOW:
[000b69c6]                           dc.w $ffff
[000b69c8]                           dc.w $0001
[000b69ca]                           dc.w $005c
[000b69cc]                           dc.w $0018
[000b69ce]                           dc.w $0000
[000b69d0]                           dc.w $0010
[000b69d2] 000b5f76                  dc.l A_3DBUTTON02
[000b69d6]                           dc.w $0000
[000b69d8]                           dc.w $0000
[000b69da]                           dc.w $002e
[000b69dc]                           dc.w $0031
_01_EDIT_WINDOW:
[000b69de]                           dc.w $000a
[000b69e0]                           dc.w $0002
[000b69e2]                           dc.w $0009
[000b69e4]                           dc.w $0018
[000b69e6]                           dc.w $0000
[000b69e8]                           dc.w $0000
[000b69ea] 000b66f6                  dc.l A_INNERFRAME01
[000b69ee]                           dc.w $0001
[000b69f0]                           dc.w $0000
[000b69f2]                           dc.w $001d
[000b69f4]                           dc.w $0003
_02_EDIT_WINDOW:
[000b69f6]                           dc.w $0003
[000b69f8]                           dc.w $ffff
[000b69fa]                           dc.w $ffff
[000b69fc]                           dc.w $001c
[000b69fe]                           dc.w $0000
[000b6a00]                           dc.w $0000
[000b6a02] 000b5a19                  dc.l TEXT_013
[000b6a06]                           dc.w $0001
[000b6a08]                           dc.w $0001
[000b6a0a]                           dc.w $0002
[000b6a0c]                           dc.w $0001
_03_EDIT_WINDOW:
[000b6a0e]                           dc.w $0004
[000b6a10]                           dc.w $ffff
[000b6a12]                           dc.w $ffff
[000b6a14]                           dc.w $0018
[000b6a16]                           dc.w $0008
[000b6a18]                           dc.w $0010
[000b6a1a] 000b6276                  dc.l A_BOXED02
[000b6a1e]                           dc.w $0003
[000b6a20]                           dc.w $0001
[000b6a22]                           dc.w $0004
[000b6a24]                           dc.w $0001
_04_EDIT_WINDOW:
[000b6a26]                           dc.w $0005
[000b6a28]                           dc.w $ffff
[000b6a2a]                           dc.w $ffff
[000b6a2c]                           dc.w $001c
[000b6a2e]                           dc.w $0000
[000b6a30]                           dc.w $0000
[000b6a32] 000b5a16                  dc.l TEXT_012
[000b6a36]                           dc.w $0008
[000b6a38]                           dc.w $0001
[000b6a3a]                           dc.w $0002
[000b6a3c]                           dc.w $0001
_05_EDIT_WINDOW:
[000b6a3e]                           dc.w $0006
[000b6a40]                           dc.w $ffff
[000b6a42]                           dc.w $ffff
[000b6a44]                           dc.w $0018
[000b6a46]                           dc.w $0008
[000b6a48]                           dc.w $0010
[000b6a4a] 000b62d6                  dc.l A_BOXED05
[000b6a4e]                           dc.w $000a
[000b6a50]                           dc.w $0001
[000b6a52]                           dc.w $0004
[000b6a54]                           dc.w $0001
_06_EDIT_WINDOW:
[000b6a56]                           dc.w $0007
[000b6a58]                           dc.w $ffff
[000b6a5a]                           dc.w $ffff
[000b6a5c]                           dc.w $001c
[000b6a5e]                           dc.w $0000
[000b6a60]                           dc.w $0000
[000b6a62] 000b5a1c                  dc.l TEXT_014
[000b6a66]                           dc.w $000f
[000b6a68]                           dc.w $0001
[000b6a6a]                           dc.w $0002
[000b6a6c]                           dc.w $0001
_07_EDIT_WINDOW:
[000b6a6e]                           dc.w $0008
[000b6a70]                           dc.w $ffff
[000b6a72]                           dc.w $ffff
[000b6a74]                           dc.w $0018
[000b6a76]                           dc.w $0008
[000b6a78]                           dc.w $0010
[000b6a7a] 000b6296                  dc.l A_BOXED03
[000b6a7e]                           dc.w $0011
[000b6a80]                           dc.w $0001
[000b6a82]                           dc.w $0004
[000b6a84]                           dc.w $0001
_08_EDIT_WINDOW:
[000b6a86]                           dc.w $0009
[000b6a88]                           dc.w $ffff
[000b6a8a]                           dc.w $ffff
[000b6a8c]                           dc.w $001c
[000b6a8e]                           dc.w $0000
[000b6a90]                           dc.w $0000
[000b6a92] 000b5a1f                  dc.l TEXT_015
[000b6a96]                           dc.w $0016
[000b6a98]                           dc.w $0001
[000b6a9a]                           dc.w $0002
[000b6a9c]                           dc.w $0001
_09_EDIT_WINDOW:
[000b6a9e]                           dc.w $0001
[000b6aa0]                           dc.w $ffff
[000b6aa2]                           dc.w $ffff
[000b6aa4]                           dc.w $0018
[000b6aa6]                           dc.w $0008
[000b6aa8]                           dc.w $0010
[000b6aaa] 000b63d6                  dc.l A_BOXED13
[000b6aae]                           dc.w $0018
[000b6ab0]                           dc.w $0001
[000b6ab2]                           dc.w $0004
[000b6ab4]                           dc.w $0001
_10_EDIT_WINDOW:
[000b6ab6]                           dc.w $000c
[000b6ab8]                           dc.w $ffff
[000b6aba]                           dc.w $ffff
[000b6abc]                           dc.w $0018
[000b6abe]                           dc.w $4007
[000b6ac0]                           dc.w $0010
[000b6ac2] 000b5fd6                  dc.l A_3DBUTTON05
[000b6ac6]                           dc.w $0020
[000b6ac8]                           dc.w $0001
[000b6aca]                           dc.w $000c
[000b6acc]                           dc.w $0002
_10aEDIT_WINDOW:
[000b6ace] 0002374c                  dc.l edwi_ok
[000b6ad2]                           dc.w $0000
[000b6ad4]                           dc.w $0000
[000b6ad6]                           dc.w $8000
[000b6ad8]                           dc.w $884f
[000b6ada]                           dc.w $0000
[000b6adc]                           dc.w $0000
[000b6ade]                           dc.w $0000
[000b6ae0]                           dc.w $0000
[000b6ae2]                           dc.w $0000
[000b6ae4]                           dc.w $0000
_12_EDIT_WINDOW:
[000b6ae6]                           dc.w $0013
[000b6ae8]                           dc.w $000d
[000b6aea]                           dc.w $0011
[000b6aec]                           dc.w $0018
[000b6aee]                           dc.w $0000
[000b6af0]                           dc.w $0000
[000b6af2] 000b6736                  dc.l A_INNERFRAME03
[000b6af6]                           dc.w $0001
[000b6af8]                           dc.w $0003
[000b6afa]                           dc.w $001d
[000b6afc]                           dc.w $0003
_13_EDIT_WINDOW:
[000b6afe]                           dc.w $000e
[000b6b00]                           dc.w $ffff
[000b6b02]                           dc.w $ffff
[000b6b04]                           dc.w $001c
[000b6b06]                           dc.w $0000
[000b6b08]                           dc.w $0000
[000b6b0a] 000b5a19                  dc.l TEXT_013
[000b6b0e]                           dc.w $0001
[000b6b10]                           dc.w $0001
[000b6b12]                           dc.w $0002
[000b6b14]                           dc.w $0001
_14_EDIT_WINDOW:
[000b6b16]                           dc.w $0010
[000b6b18]                           dc.w $ffff
[000b6b1a]                           dc.w $ffff
[000b6b1c]                           dc.w $0018
[000b6b1e]                           dc.w $0040
[000b6b20]                           dc.w $0000
[000b6b22] 000b67f6                  dc.l A_SLIDER01
[000b6b26]                           dc.w $0003
[000b6b28]                           dc.w $0001
[000b6b2a]                           dc.w $000b
[000b6b2c]                           dc.w $0001
_14aEDIT_WINDOW:
[000b6b2e] 000375d6                  dc.l Aus_slider
[000b6b32]                           dc.w $0000
[000b6b34]                           dc.w $0000
[000b6b36]                           dc.w $8000
[000b6b38]                           dc.w $0000
[000b6b3a]                           dc.w $0000
[000b6b3c]                           dc.w $0000
[000b6b3e]                           dc.w $0000
[000b6b40]                           dc.w $0000
[000b6b42]                           dc.w $0000
[000b6b44]                           dc.w $0000
_16_EDIT_WINDOW:
[000b6b46]                           dc.w $0011
[000b6b48]                           dc.w $ffff
[000b6b4a]                           dc.w $ffff
[000b6b4c]                           dc.w $001c
[000b6b4e]                           dc.w $0000
[000b6b50]                           dc.w $0000
[000b6b52] 000b5a16                  dc.l TEXT_012
[000b6b56]                           dc.w $000f
[000b6b58]                           dc.w $0001
[000b6b5a]                           dc.w $0002
[000b6b5c]                           dc.w $0001
_17_EDIT_WINDOW:
[000b6b5e]                           dc.w $000c
[000b6b60]                           dc.w $ffff
[000b6b62]                           dc.w $ffff
[000b6b64]                           dc.w $0018
[000b6b66]                           dc.w $0040
[000b6b68]                           dc.w $0000
[000b6b6a] 000b67f6                  dc.l A_SLIDER01
[000b6b6e]                           dc.w $0011
[000b6b70]                           dc.w $0001
[000b6b72]                           dc.w $000b
[000b6b74]                           dc.w $0001
_17aEDIT_WINDOW:
[000b6b76] 000375d6                  dc.l Aus_slider
[000b6b7a]                           dc.w $0000
[000b6b7c]                           dc.w $0000
[000b6b7e]                           dc.w $8000
[000b6b80]                           dc.w $0000
[000b6b82]                           dc.w $0000
[000b6b84]                           dc.w $0000
[000b6b86]                           dc.w $0000
[000b6b88]                           dc.w $0000
[000b6b8a]                           dc.w $0000
[000b6b8c]                           dc.w $0000
_19_EDIT_WINDOW:
[000b6b8e]                           dc.w $0015
[000b6b90]                           dc.w $ffff
[000b6b92]                           dc.w $ffff
[000b6b94]                           dc.w $0018
[000b6b96]                           dc.w $4005
[000b6b98]                           dc.w $0010
[000b6b9a] 000b5fb6                  dc.l A_3DBUTTON04
[000b6b9e]                           dc.w $0020
[000b6ba0]                           dc.w $0003
[000b6ba2]                           dc.w $000c
[000b6ba4]                           dc.w $0002
_19aEDIT_WINDOW:
[000b6ba6] 00023770                  dc.l edwi_abort
[000b6baa]                           dc.w $0000
[000b6bac]                           dc.w $0000
[000b6bae]                           dc.w $8000
[000b6bb0]                           dc.w $8841
[000b6bb2]                           dc.w $0000
[000b6bb4]                           dc.w $0000
[000b6bb6]                           dc.w $0000
[000b6bb8]                           dc.w $0000
[000b6bba]                           dc.w $0000
[000b6bbc]                           dc.w $0000
_21_EDIT_WINDOW:
[000b6bbe]                           dc.w $0029
[000b6bc0]                           dc.w $0016
[000b6bc2]                           dc.w $0016
[000b6bc4]                           dc.w $0018
[000b6bc6]                           dc.w $0000
[000b6bc8]                           dc.w $0000
[000b6bca] 000b6716                  dc.l A_INNERFRAME02
[000b6bce]                           dc.w $0001
[000b6bd0]                           dc.w $0006
[000b6bd2]                           dc.w $001d
[000b6bd4]                           dc.w $0008
_22_EDIT_WINDOW:
[000b6bd6]                           dc.w $0015
[000b6bd8]                           dc.w $0017
[000b6bda]                           dc.w $0028
[000b6bdc]                           dc.w $0018
[000b6bde]                           dc.w $0000
[000b6be0]                           dc.w $0000
[000b6be2] 000b60b6                  dc.l A_3DBUTTON12
[000b6be6]                           dc.w $0002
[000b6be8]                           dc.w $0001
[000b6bea]                           dc.w $0019
[000b6bec]                           dc.w $0006
_23_EDIT_WINDOW:
[000b6bee]                           dc.w $0018
[000b6bf0]                           dc.w $ffff
[000b6bf2]                           dc.w $ffff
[000b6bf4]                           dc.w $0018
[000b6bf6]                           dc.w $0001
[000b6bf8]                           dc.w $0000
[000b6bfa] 000b6076                  dc.l A_3DBUTTON10
[000b6bfe]                           dc.w $0000
[000b6c00]                           dc.w $0000
[000b6c02]                           dc.w $0002
[000b6c04]                           dc.w $0001
_24_EDIT_WINDOW:
[000b6c06]                           dc.w $0019
[000b6c08]                           dc.w $ffff
[000b6c0a]                           dc.w $ffff
[000b6c0c]                           dc.w $0018
[000b6c0e]                           dc.w $0001
[000b6c10]                           dc.w $0030
[000b6c12] 000b6096                  dc.l A_3DBUTTON11
[000b6c16]                           dc.w $0000
[000b6c18]                           dc.w $0001
[000b6c1a]                           dc.w $0017
[000b6c1c]                           dc.w $0001
_25_EDIT_WINDOW:
[000b6c1e]                           dc.w $001a
[000b6c20]                           dc.w $ffff
[000b6c22]                           dc.w $ffff
[000b6c24]                           dc.w $0018
[000b6c26]                           dc.w $0000
[000b6c28]                           dc.w $0000
[000b6c2a] 000b6176                  dc.l A_3DBUTTON18
[000b6c2e]                           dc.w $0000
[000b6c30]                           dc.w $0002
[000b6c32]                           dc.w $0017
[000b6c34]                           dc.w $0003
_26_EDIT_WINDOW:
[000b6c36]                           dc.w $001c
[000b6c38]                           dc.w $001b
[000b6c3a]                           dc.w $001b
[000b6c3c]                           dc.w $0018
[000b6c3e]                           dc.w $0000
[000b6c40]                           dc.w $0000
[000b6c42] 000b61d6                  dc.l A_3DBUTTON21
[000b6c46]                           dc.w $0002
[000b6c48]                           dc.w $0005
[000b6c4a]                           dc.w $0013
[000b6c4c]                           dc.w $0001
_27_EDIT_WINDOW:
[000b6c4e]                           dc.w $001a
[000b6c50]                           dc.w $ffff
[000b6c52]                           dc.w $ffff
[000b6c54]                           dc.w $0018
[000b6c56]                           dc.w $0001
[000b6c58]                           dc.w $0000
[000b6c5a] 000b61f6                  dc.l A_3DBUTTON22
[000b6c5e]                           dc.w $0002
[000b6c60]                           dc.w $0000
[000b6c62]                           dc.w $000a
[000b6c64]                           dc.w $0001
_28_EDIT_WINDOW:
[000b6c66]                           dc.w $001d
[000b6c68]                           dc.w $ffff
[000b6c6a]                           dc.w $ffff
[000b6c6c]                           dc.w $0018
[000b6c6e]                           dc.w $0001
[000b6c70]                           dc.w $0000
[000b6c72] 000b6156                  dc.l A_3DBUTTON17
[000b6c76]                           dc.w $0000
[000b6c78]                           dc.w $0005
[000b6c7a]                           dc.w $0002
[000b6c7c]                           dc.w $0001
_29_EDIT_WINDOW:
[000b6c7e]                           dc.w $001e
[000b6c80]                           dc.w $ffff
[000b6c82]                           dc.w $ffff
[000b6c84]                           dc.w $0018
[000b6c86]                           dc.w $0001
[000b6c88]                           dc.w $0000
[000b6c8a] 000b6136                  dc.l A_3DBUTTON16
[000b6c8e]                           dc.w $0015
[000b6c90]                           dc.w $0005
[000b6c92]                           dc.w $0002
[000b6c94]                           dc.w $0001
_30_EDIT_WINDOW:
[000b6c96]                           dc.w $001f
[000b6c98]                           dc.w $ffff
[000b6c9a]                           dc.w $ffff
[000b6c9c]                           dc.w $0018
[000b6c9e]                           dc.w $0001
[000b6ca0]                           dc.w $0000
[000b6ca2] 000b6116                  dc.l A_3DBUTTON15
[000b6ca6]                           dc.w $0017
[000b6ca8]                           dc.w $0005
[000b6caa]                           dc.w $0002
[000b6cac]                           dc.w $0001
_31_EDIT_WINDOW:
[000b6cae]                           dc.w $0020
[000b6cb0]                           dc.w $ffff
[000b6cb2]                           dc.w $ffff
[000b6cb4]                           dc.w $0018
[000b6cb6]                           dc.w $0001
[000b6cb8]                           dc.w $0000
[000b6cba] 000b60f6                  dc.l A_3DBUTTON14
[000b6cbe]                           dc.w $0017
[000b6cc0]                           dc.w $0004
[000b6cc2]                           dc.w $0002
[000b6cc4]                           dc.w $0001
_32_EDIT_WINDOW:
[000b6cc6]                           dc.w $0022
[000b6cc8]                           dc.w $0021
[000b6cca]                           dc.w $0021
[000b6ccc]                           dc.w $0018
[000b6cce]                           dc.w $0000
[000b6cd0]                           dc.w $0000
[000b6cd2] 000b61b6                  dc.l A_3DBUTTON20
[000b6cd6]                           dc.w $0017
[000b6cd8]                           dc.w $0002
[000b6cda]                           dc.w $0002
[000b6cdc]                           dc.w $0002
_33_EDIT_WINDOW:
[000b6cde]                           dc.w $0020
[000b6ce0]                           dc.w $ffff
[000b6ce2]                           dc.w $ffff
[000b6ce4]                           dc.w $0018
[000b6ce6]                           dc.w $0001
[000b6ce8]                           dc.w $0000
[000b6cea] 000b6196                  dc.l A_3DBUTTON19
[000b6cee]                           dc.w $0000
[000b6cf0]                           dc.w $0001
[000b6cf2]                           dc.w $0002
[000b6cf4]                           dc.w $0001
_34_EDIT_WINDOW:
[000b6cf6]                           dc.w $0023
[000b6cf8]                           dc.w $ffff
[000b6cfa]                           dc.w $ffff
[000b6cfc]                           dc.w $0018
[000b6cfe]                           dc.w $0001
[000b6d00]                           dc.w $0000
[000b6d02] 000b60d6                  dc.l A_3DBUTTON13
[000b6d06]                           dc.w $0017
[000b6d08]                           dc.w $0001
[000b6d0a]                           dc.w $0002
[000b6d0c]                           dc.w $0001
_35_EDIT_WINDOW:
[000b6d0e]                           dc.w $0024
[000b6d10]                           dc.w $ffff
[000b6d12]                           dc.w $ffff
[000b6d14]                           dc.w $0018
[000b6d16]                           dc.w $0001
[000b6d18]                           dc.w $0000
[000b6d1a] 000b5f96                  dc.l A_3DBUTTON03
[000b6d1e]                           dc.w $0017
[000b6d20]                           dc.w $0000
[000b6d22]                           dc.w $0002
[000b6d24]                           dc.w $0001
_36_EDIT_WINDOW:
[000b6d26]                           dc.w $0025
[000b6d28]                           dc.w $ffff
[000b6d2a]                           dc.w $ffff
[000b6d2c]                           dc.w $0018
[000b6d2e]                           dc.w $0001
[000b6d30]                           dc.w $0000
[000b6d32] 000b5ff6                  dc.l A_3DBUTTON06
[000b6d36]                           dc.w $0015
[000b6d38]                           dc.w $0000
[000b6d3a]                           dc.w $0002
[000b6d3c]                           dc.w $0001
_37_EDIT_WINDOW:
[000b6d3e]                           dc.w $0026
[000b6d40]                           dc.w $ffff
[000b6d42]                           dc.w $ffff
[000b6d44]                           dc.w $0018
[000b6d46]                           dc.w $0001
[000b6d48]                           dc.w $0000
[000b6d4a] 000b6016                  dc.l A_3DBUTTON07
[000b6d4e]                           dc.w $0013
[000b6d50]                           dc.w $0000
[000b6d52]                           dc.w $0002
[000b6d54]                           dc.w $0001
_38_EDIT_WINDOW:
[000b6d56]                           dc.w $0027
[000b6d58]                           dc.w $ffff
[000b6d5a]                           dc.w $ffff
[000b6d5c]                           dc.w $0018
[000b6d5e]                           dc.w $0001
[000b6d60]                           dc.w $0000
[000b6d62] 000b6036                  dc.l A_3DBUTTON08
[000b6d66]                           dc.w $000c
[000b6d68]                           dc.w $0000
[000b6d6a]                           dc.w $0007
[000b6d6c]                           dc.w $0001
_39_EDIT_WINDOW:
[000b6d6e]                           dc.w $0028
[000b6d70]                           dc.w $ffff
[000b6d72]                           dc.w $ffff
[000b6d74]                           dc.w $0018
[000b6d76]                           dc.w $0001
[000b6d78]                           dc.w $0000
[000b6d7a] 000b6056                  dc.l A_3DBUTTON09
[000b6d7e]                           dc.w $0004
[000b6d80]                           dc.w $0000
[000b6d82]                           dc.w $0008
[000b6d84]                           dc.w $0001
_40_EDIT_WINDOW:
[000b6d86]                           dc.w $0016
[000b6d88]                           dc.w $ffff
[000b6d8a]                           dc.w $ffff
[000b6d8c]                           dc.w $0018
[000b6d8e]                           dc.w $0001
[000b6d90]                           dc.w $0000
[000b6d92] 000b6236                  dc.l A_3DBUTTON24
[000b6d96]                           dc.w $0002
[000b6d98]                           dc.w $0000
[000b6d9a]                           dc.w $0002
[000b6d9c]                           dc.w $0001
_41_EDIT_WINDOW:
[000b6d9e]                           dc.w $0036
[000b6da0]                           dc.w $002a
[000b6da2]                           dc.w $0034
[000b6da4]                           dc.w $0018
[000b6da6]                           dc.w $0000
[000b6da8]                           dc.w $0000
[000b6daa] 000b67d6                  dc.l A_INNERFRAME08
[000b6dae]                           dc.w $001e
[000b6db0]                           dc.w $0006
[000b6db2]                           dc.w $000f
[000b6db4]                           dc.w $0008
_42_EDIT_WINDOW:
[000b6db6]                           dc.w $002c
[000b6db8]                           dc.w $ffff
[000b6dba]                           dc.w $ffff
[000b6dbc]                           dc.w $0018
[000b6dbe]                           dc.w $0001
[000b6dc0]                           dc.w $0001
[000b6dc2] 000b66d6                  dc.l A_CHECKBOX07
[000b6dc6]                           dc.w $0001
[000b6dc8]                           dc.w $0001
[000b6dca]                           dc.w $0008
[000b6dcc]                           dc.w $0001
_42aEDIT_WINDOW:
[000b6dce]                           dc.w $0000
[000b6dd0]                           dc.w $0000
[000b6dd2]                           dc.w $0000
[000b6dd4]                           dc.w $0000
[000b6dd6]                           dc.w $8000
[000b6dd8]                           dc.w $884c
[000b6dda]                           dc.w $0000
[000b6ddc]                           dc.w $0000
[000b6dde]                           dc.w $0000
[000b6de0]                           dc.w $0000
[000b6de2]                           dc.w $0000
[000b6de4]                           dc.w $0000
_44_EDIT_WINDOW:
[000b6de6]                           dc.w $002e
[000b6de8]                           dc.w $ffff
[000b6dea]                           dc.w $ffff
[000b6dec]                           dc.w $0018
[000b6dee]                           dc.w $0001
[000b6df0]                           dc.w $0001
[000b6df2] 000b6636                  dc.l A_CHECKBOX01
[000b6df6]                           dc.w $0001
[000b6df8]                           dc.w $0002
[000b6dfa]                           dc.w $0009
[000b6dfc]                           dc.w $0001
_44aEDIT_WINDOW:
[000b6dfe]                           dc.w $0000
[000b6e00]                           dc.w $0000
[000b6e02]                           dc.w $0000
[000b6e04]                           dc.w $0000
[000b6e06]                           dc.w $8000
[000b6e08]                           dc.w $8842
[000b6e0a]                           dc.w $0000
[000b6e0c]                           dc.w $0000
[000b6e0e]                           dc.w $0000
[000b6e10]                           dc.w $0000
[000b6e12]                           dc.w $0000
[000b6e14]                           dc.w $0000
_46_EDIT_WINDOW:
[000b6e16]                           dc.w $0030
[000b6e18]                           dc.w $ffff
[000b6e1a]                           dc.w $ffff
[000b6e1c]                           dc.w $0018
[000b6e1e]                           dc.w $0001
[000b6e20]                           dc.w $0001
[000b6e22] 000b6656                  dc.l A_CHECKBOX02
[000b6e26]                           dc.w $0001
[000b6e28]                           dc.w $0003
[000b6e2a]                           dc.w $0007
[000b6e2c]                           dc.w $0001
_46aEDIT_WINDOW:
[000b6e2e]                           dc.w $0000
[000b6e30]                           dc.w $0000
[000b6e32]                           dc.w $0000
[000b6e34]                           dc.w $0000
[000b6e36]                           dc.w $8000
[000b6e38]                           dc.w $8849
[000b6e3a]                           dc.w $0000
[000b6e3c]                           dc.w $0000
[000b6e3e]                           dc.w $0000
[000b6e40]                           dc.w $0000
[000b6e42]                           dc.w $0000
[000b6e44]                           dc.w $0000
_48_EDIT_WINDOW:
[000b6e46]                           dc.w $0032
[000b6e48]                           dc.w $ffff
[000b6e4a]                           dc.w $ffff
[000b6e4c]                           dc.w $0018
[000b6e4e]                           dc.w $0001
[000b6e50]                           dc.w $0001
[000b6e52] 000b6676                  dc.l A_CHECKBOX03
[000b6e56]                           dc.w $0001
[000b6e58]                           dc.w $0004
[000b6e5a]                           dc.w $000c
[000b6e5c]                           dc.w $0001
_48aEDIT_WINDOW:
[000b6e5e]                           dc.w $0000
[000b6e60]                           dc.w $0000
[000b6e62]                           dc.w $0000
[000b6e64]                           dc.w $0000
[000b6e66]                           dc.w $8000
[000b6e68]                           dc.w $8847
[000b6e6a]                           dc.w $0000
[000b6e6c]                           dc.w $0000
[000b6e6e]                           dc.w $0000
[000b6e70]                           dc.w $0000
[000b6e72]                           dc.w $0000
[000b6e74]                           dc.w $0000
_50_EDIT_WINDOW:
[000b6e76]                           dc.w $0034
[000b6e78]                           dc.w $ffff
[000b6e7a]                           dc.w $ffff
[000b6e7c]                           dc.w $0018
[000b6e7e]                           dc.w $0001
[000b6e80]                           dc.w $0001
[000b6e82] 000b6696                  dc.l A_CHECKBOX04
[000b6e86]                           dc.w $0001
[000b6e88]                           dc.w $0005
[000b6e8a]                           dc.w $000c
[000b6e8c]                           dc.w $0001
_50aEDIT_WINDOW:
[000b6e8e]                           dc.w $0000
[000b6e90]                           dc.w $0000
[000b6e92]                           dc.w $0000
[000b6e94]                           dc.w $0000
[000b6e96]                           dc.w $8000
[000b6e98]                           dc.w $884e
[000b6e9a]                           dc.w $0000
[000b6e9c]                           dc.w $0000
[000b6e9e]                           dc.w $0000
[000b6ea0]                           dc.w $0000
[000b6ea2]                           dc.w $0000
[000b6ea4]                           dc.w $0000
_52_EDIT_WINDOW:
[000b6ea6]                           dc.w $0029
[000b6ea8]                           dc.w $ffff
[000b6eaa]                           dc.w $ffff
[000b6eac]                           dc.w $0018
[000b6eae]                           dc.w $0001
[000b6eb0]                           dc.w $0001
[000b6eb2] 000b66b6                  dc.l A_CHECKBOX05
[000b6eb6]                           dc.w $0001
[000b6eb8]                           dc.w $0006
[000b6eba]                           dc.w $000d
[000b6ebc]                           dc.w $0001
_52aEDIT_WINDOW:
[000b6ebe]                           dc.w $0000
[000b6ec0]                           dc.w $0000
[000b6ec2]                           dc.w $0000
[000b6ec4]                           dc.w $0000
[000b6ec6]                           dc.w $8000
[000b6ec8]                           dc.w $8854
[000b6eca]                           dc.w $0000
[000b6ecc]                           dc.w $0000
[000b6ece]                           dc.w $0000
[000b6ed0]                           dc.w $0000
[000b6ed2]                           dc.w $0000
[000b6ed4]                           dc.w $0000
_54_EDIT_WINDOW:
[000b6ed6]                           dc.w $003d
[000b6ed8]                           dc.w $0037
[000b6eda]                           dc.w $003c
[000b6edc]                           dc.w $0018
[000b6ede]                           dc.w $0000
[000b6ee0]                           dc.w $0000
[000b6ee2] 000b6776                  dc.l A_INNERFRAME05
[000b6ee6]                           dc.w $0001
[000b6ee8]                           dc.w $000e
[000b6eea]                           dc.w $002c
[000b6eec]                           dc.w $0004
_55_EDIT_WINDOW:
[000b6eee]                           dc.w $0038
[000b6ef0]                           dc.w $ffff
[000b6ef2]                           dc.w $ffff
[000b6ef4]                           dc.w $001c
[000b6ef6]                           dc.w $0000
[000b6ef8]                           dc.w $0000
[000b6efa] 000b5a73                  dc.l TEXT_12
[000b6efe]                           dc.w $0001
[000b6f00]                           dc.w $0001
[000b6f02]                           dc.w $0005
[000b6f04]                           dc.w $0001
_56_EDIT_WINDOW:
[000b6f06]                           dc.w $003c
[000b6f08]                           dc.w $0039
[000b6f0a]                           dc.w $0039
[000b6f0c]                           dc.w $0018
[000b6f0e]                           dc.w $0040
[000b6f10]                           dc.w $0000
[000b6f12] 000b5f56                  dc.l A_3DBUTTON01
[000b6f16]                           dc.w $000a
[000b6f18]                           dc.w $0001
[000b6f1a]                           dc.w $0020
[000b6f1c]                           dc.w $0002
_57_EDIT_WINDOW:
[000b6f1e]                           dc.w $0038
[000b6f20]                           dc.w $003a
[000b6f22]                           dc.w $003b
[000b6f24]                           dc.w $0014
[000b6f26]                           dc.w $0040
[000b6f28]                           dc.w $0000
[000b6f2a]                           dc.w $00ff
[000b6f2c]                           dc.w $0101
[000b6f2e]                           dc.w $0000
[000b6f30]                           dc.w $0000
[000b6f32]                           dc.w $0020
[000b6f34]                           dc.w $0002
_58_EDIT_WINDOW:
[000b6f36]                           dc.w $003b
[000b6f38]                           dc.w $ffff
[000b6f3a]                           dc.w $ffff
[000b6f3c]                           dc.w $0018
[000b6f3e]                           dc.w $0008
[000b6f40]                           dc.w $0000
[000b6f42] 000b62f6                  dc.l A_BOXED06
[000b6f46]                           dc.w $0000
[000b6f48]                           dc.w $0000
[000b6f4a]                           dc.w $0020
[000b6f4c]                           dc.w $0001
_59_EDIT_WINDOW:
[000b6f4e]                           dc.w $0039
[000b6f50]                           dc.w $ffff
[000b6f52]                           dc.w $ffff
[000b6f54]                           dc.w $0018
[000b6f56]                           dc.w $0008
[000b6f58]                           dc.w $0000
[000b6f5a] 000b6316                  dc.l A_BOXED07
[000b6f5e]                           dc.w $0000
[000b6f60]                           dc.w $0001
[000b6f62]                           dc.w $0020
[000b6f64]                           dc.w $0001
_60_EDIT_WINDOW:
[000b6f66]                           dc.w $0036
[000b6f68]                           dc.w $ffff
[000b6f6a]                           dc.w $ffff
[000b6f6c]                           dc.w $001c
[000b6f6e]                           dc.w $0000
[000b6f70]                           dc.w $0000
[000b6f72] 000b5aa8                  dc.l TEXT_18
[000b6f76]                           dc.w $0001
[000b6f78]                           dc.w $0002
[000b6f7a]                           dc.w $0005
[000b6f7c]                           dc.w $0001
_61_EDIT_WINDOW:
[000b6f7e]                           dc.w $0045
[000b6f80]                           dc.w $003e
[000b6f82]                           dc.w $0040
[000b6f84]                           dc.w $0018
[000b6f86]                           dc.w $0040
[000b6f88]                           dc.w $0000
[000b6f8a] 000b6796                  dc.l A_INNERFRAME06
[000b6f8e]                           dc.w $0001
[000b6f90]                           dc.w $0012
[000b6f92]                           dc.w $002c
[000b6f94]                           dc.w $0004
_62_EDIT_WINDOW:
[000b6f96]                           dc.w $003f
[000b6f98]                           dc.w $ffff
[000b6f9a]                           dc.w $ffff
[000b6f9c]                           dc.w $001c
[000b6f9e]                           dc.w $0000
[000b6fa0]                           dc.w $0000
[000b6fa2] 000b5b8e                  dc.l TEXT_53
[000b6fa6]                           dc.w $0001
[000b6fa8]                           dc.w $0001
[000b6faa]                           dc.w $0006
[000b6fac]                           dc.w $0001
_63_EDIT_WINDOW:
[000b6fae]                           dc.w $0040
[000b6fb0]                           dc.w $ffff
[000b6fb2]                           dc.w $ffff
[000b6fb4]                           dc.w $001c
[000b6fb6]                           dc.w $0000
[000b6fb8]                           dc.w $0000
[000b6fba] 000b5b95                  dc.l TEXT_54
[000b6fbe]                           dc.w $0001
[000b6fc0]                           dc.w $0002
[000b6fc2]                           dc.w $0006
[000b6fc4]                           dc.w $0001
_64_EDIT_WINDOW:
[000b6fc6]                           dc.w $003d
[000b6fc8]                           dc.w $0041
[000b6fca]                           dc.w $0041
[000b6fcc]                           dc.w $0018
[000b6fce]                           dc.w $0000
[000b6fd0]                           dc.w $0000
[000b6fd2] 000b6216                  dc.l A_3DBUTTON23
[000b6fd6]                           dc.w $000a
[000b6fd8]                           dc.w $0001
[000b6fda]                           dc.w $0020
[000b6fdc]                           dc.w $0002
_65_EDIT_WINDOW:
[000b6fde]                           dc.w $0040
[000b6fe0]                           dc.w $0042
[000b6fe2]                           dc.w $0044
[000b6fe4]                           dc.w $0014
[000b6fe6]                           dc.w $0000
[000b6fe8]                           dc.w $0000
[000b6fea]                           dc.w $0000
[000b6fec]                           dc.w $1101
[000b6fee]                           dc.w $0000
[000b6ff0]                           dc.w $0000
[000b6ff2]                           dc.w $0020
[000b6ff4]                           dc.w $0002
_66_EDIT_WINDOW:
[000b6ff6]                           dc.w $0043
[000b6ff8]                           dc.w $ffff
[000b6ffa]                           dc.w $ffff
[000b6ffc]                           dc.w $0018
[000b6ffe]                           dc.w $0008
[000b7000]                           dc.w $0000
[000b7002] 000b6256                  dc.l A_BOXED01
[000b7006]                           dc.w $0000
[000b7008]                           dc.w $0000
[000b700a]                           dc.w $0020
[000b700c]                           dc.w $0001
_67_EDIT_WINDOW:
[000b700e]                           dc.w $0044
[000b7010]                           dc.w $ffff
[000b7012]                           dc.w $ffff
[000b7014]                           dc.w $0018
[000b7016]                           dc.w $0008
[000b7018]                           dc.w $0000
[000b701a] 000b62b6                  dc.l A_BOXED04
[000b701e]                           dc.w $0000
[000b7020]                           dc.w $0001
[000b7022]                           dc.w $0008
[000b7024]                           dc.w $0001
_68_EDIT_WINDOW:
[000b7026]                           dc.w $0041
[000b7028]                           dc.w $ffff
[000b702a]                           dc.w $ffff
[000b702c]                           dc.w $001c
[000b702e]                           dc.w $0000
[000b7030]                           dc.w $0000
[000b7032] 000b5b77                  dc.l TEXT_50
[000b7036]                           dc.w $0008
[000b7038]                           dc.w $0001
[000b703a]                           dc.w $0004
[000b703c]                           dc.w $0001
_69_EDIT_WINDOW:
[000b703e]                           dc.w $005c
[000b7040]                           dc.w $0046
[000b7042]                           dc.w $005a
[000b7044]                           dc.w $0018
[000b7046]                           dc.w $0000
[000b7048]                           dc.w $0000
[000b704a] 000b6756                  dc.l A_INNERFRAME04
[000b704e]                           dc.w $0001
[000b7050]                           dc.w $0016
[000b7052]                           dc.w $002c
[000b7054]                           dc.w $0007
_70_EDIT_WINDOW:
[000b7056]                           dc.w $0048
[000b7058]                           dc.w $ffff
[000b705a]                           dc.w $ffff
[000b705c]                           dc.w $001c
[000b705e]                           dc.w $0005
[000b7060]                           dc.w $0000
[000b7062] 000b5a79                  dc.l TEXT_13
[000b7066]                           dc.w $0001
[000b7068]                           dc.w $0001
[000b706a]                           dc.w $0005
[000b706c]                           dc.w $0001
_70aEDIT_WINDOW:
[000b706e] 0002365c                  dc.l edwi_tme
[000b7072]                           dc.w $0000
[000b7074]                           dc.w $0000
[000b7076]                           dc.w $8000
[000b7078]                           dc.w $0000
[000b707a]                           dc.w $0000
[000b707c]                           dc.w $0000
[000b707e]                           dc.w $0000
[000b7080]                           dc.w $0000
[000b7082]                           dc.w $0000
[000b7084]                           dc.w $0000
_72_EDIT_WINDOW:
[000b7086]                           dc.w $0054
[000b7088]                           dc.w $0049
[000b708a]                           dc.w $0049
[000b708c]                           dc.w $0018
[000b708e]                           dc.w $0040
[000b7090]                           dc.w $0000
[000b7092] 000b5f56                  dc.l A_3DBUTTON01
[000b7096]                           dc.w $000a
[000b7098]                           dc.w $0001
[000b709a]                           dc.w $0020
[000b709c]                           dc.w $0005
_73_EDIT_WINDOW:
[000b709e]                           dc.w $0048
[000b70a0]                           dc.w $004a
[000b70a2]                           dc.w $0052
[000b70a4]                           dc.w $0014
[000b70a6]                           dc.w $0040
[000b70a8]                           dc.w $0000
[000b70aa]                           dc.w $00ff
[000b70ac]                           dc.w $0101
[000b70ae]                           dc.w $0000
[000b70b0]                           dc.w $0000
[000b70b2]                           dc.w $0020
[000b70b4]                           dc.w $0005
_74_EDIT_WINDOW:
[000b70b6]                           dc.w $004c
[000b70b8]                           dc.w $ffff
[000b70ba]                           dc.w $ffff
[000b70bc]                           dc.w $0018
[000b70be]                           dc.w $1008
[000b70c0]                           dc.w $0010
[000b70c2] 000b6336                  dc.l A_BOXED08
[000b70c6]                           dc.w $0000
[000b70c8]                           dc.w $0000
[000b70ca]                           dc.w $0020
[000b70cc]                           dc.w $0001
_74aEDIT_WINDOW:
[000b70ce]                           dc.w $0000
[000b70d0]                           dc.w $0000
[000b70d2] 00023782                  dc.l edwi_acc
[000b70d6]                           dc.w $8000
[000b70d8]                           dc.w $0000
[000b70da]                           dc.w $0000
[000b70dc]                           dc.w $0000
[000b70de]                           dc.w $0000
[000b70e0]                           dc.w $0000
[000b70e2]                           dc.w $0000
[000b70e4]                           dc.w $0000
_76_EDIT_WINDOW:
[000b70e6]                           dc.w $004e
[000b70e8]                           dc.w $ffff
[000b70ea]                           dc.w $ffff
[000b70ec]                           dc.w $0018
[000b70ee]                           dc.w $1008
[000b70f0]                           dc.w $0000
[000b70f2] 000b6356                  dc.l A_BOXED09
[000b70f6]                           dc.w $0000
[000b70f8]                           dc.w $0001
[000b70fa]                           dc.w $0020
[000b70fc]                           dc.w $0001
_76aEDIT_WINDOW:
[000b70fe]                           dc.w $0000
[000b7100]                           dc.w $0000
[000b7102] 00023782                  dc.l edwi_acc
[000b7106]                           dc.w $8000
[000b7108]                           dc.w $0000
[000b710a]                           dc.w $0000
[000b710c]                           dc.w $0000
[000b710e]                           dc.w $0000
[000b7110]                           dc.w $0000
[000b7112]                           dc.w $0000
[000b7114]                           dc.w $0000
_78_EDIT_WINDOW:
[000b7116]                           dc.w $0050
[000b7118]                           dc.w $ffff
[000b711a]                           dc.w $ffff
[000b711c]                           dc.w $0018
[000b711e]                           dc.w $1008
[000b7120]                           dc.w $0000
[000b7122] 000b6376                  dc.l A_BOXED10
[000b7126]                           dc.w $0000
[000b7128]                           dc.w $0002
[000b712a]                           dc.w $0020
[000b712c]                           dc.w $0001
_78aEDIT_WINDOW:
[000b712e]                           dc.w $0000
[000b7130]                           dc.w $0000
[000b7132] 00023782                  dc.l edwi_acc
[000b7136]                           dc.w $8000
[000b7138]                           dc.w $0000
[000b713a]                           dc.w $0000
[000b713c]                           dc.w $0000
[000b713e]                           dc.w $0000
[000b7140]                           dc.w $0000
[000b7142]                           dc.w $0000
[000b7144]                           dc.w $0000
_80_EDIT_WINDOW:
[000b7146]                           dc.w $0052
[000b7148]                           dc.w $ffff
[000b714a]                           dc.w $ffff
[000b714c]                           dc.w $0018
[000b714e]                           dc.w $1008
[000b7150]                           dc.w $0000
[000b7152] 000b6396                  dc.l A_BOXED11
[000b7156]                           dc.w $0000
[000b7158]                           dc.w $0003
[000b715a]                           dc.w $0020
[000b715c]                           dc.w $0001
_80aEDIT_WINDOW:
[000b715e]                           dc.w $0000
[000b7160]                           dc.w $0000
[000b7162] 00023782                  dc.l edwi_acc
[000b7166]                           dc.w $8000
[000b7168]                           dc.w $0000
[000b716a]                           dc.w $0000
[000b716c]                           dc.w $0000
[000b716e]                           dc.w $0000
[000b7170]                           dc.w $0000
[000b7172]                           dc.w $0000
[000b7174]                           dc.w $0000
_82_EDIT_WINDOW:
[000b7176]                           dc.w $0049
[000b7178]                           dc.w $ffff
[000b717a]                           dc.w $ffff
[000b717c]                           dc.w $0018
[000b717e]                           dc.w $1008
[000b7180]                           dc.w $0000
[000b7182] 000b63b6                  dc.l A_BOXED12
[000b7186]                           dc.w $0000
[000b7188]                           dc.w $0004
[000b718a]                           dc.w $0020
[000b718c]                           dc.w $0001
_82aEDIT_WINDOW:
[000b718e]                           dc.w $0000
[000b7190]                           dc.w $0000
[000b7192] 00023782                  dc.l edwi_acc
[000b7196]                           dc.w $8000
[000b7198]                           dc.w $0000
[000b719a]                           dc.w $0000
[000b719c]                           dc.w $0000
[000b719e]                           dc.w $0000
[000b71a0]                           dc.w $0000
[000b71a2]                           dc.w $0000
[000b71a4]                           dc.w $0000
_84_EDIT_WINDOW:
[000b71a6]                           dc.w $0056
[000b71a8]                           dc.w $ffff
[000b71aa]                           dc.w $ffff
[000b71ac]                           dc.w $001c
[000b71ae]                           dc.w $0005
[000b71b0]                           dc.w $0000
[000b71b2] 000b5a55                  dc.l TEXT_09
[000b71b6]                           dc.w $0001
[000b71b8]                           dc.w $0002
[000b71ba]                           dc.w $0008
[000b71bc]                           dc.w $0001
_84aEDIT_WINDOW:
[000b71be] 00023698                  dc.l edwi_two
[000b71c2]                           dc.w $0000
[000b71c4]                           dc.w $0000
[000b71c6]                           dc.w $8000
[000b71c8]                           dc.w $0000
[000b71ca]                           dc.w $0000
[000b71cc]                           dc.w $0000
[000b71ce]                           dc.w $0000
[000b71d0]                           dc.w $0000
[000b71d2]                           dc.w $0000
[000b71d4]                           dc.w $0000
_86_EDIT_WINDOW:
[000b71d6]                           dc.w $0058
[000b71d8]                           dc.w $ffff
[000b71da]                           dc.w $ffff
[000b71dc]                           dc.w $001c
[000b71de]                           dc.w $0005
[000b71e0]                           dc.w $0000
[000b71e2] 000b5ab7                  dc.l TEXT_20
[000b71e6]                           dc.w $0001
[000b71e8]                           dc.w $0003
[000b71ea]                           dc.w $0005
[000b71ec]                           dc.w $0001
_86aEDIT_WINDOW:
[000b71ee] 00023698                  dc.l edwi_two
[000b71f2]                           dc.w $0000
[000b71f4]                           dc.w $0000
[000b71f6]                           dc.w $8000
[000b71f8]                           dc.w $0000
[000b71fa]                           dc.w $0000
[000b71fc]                           dc.w $0000
[000b71fe]                           dc.w $0000
[000b7200]                           dc.w $0000
[000b7202]                           dc.w $0000
[000b7204]                           dc.w $0000
_88_EDIT_WINDOW:
[000b7206]                           dc.w $005a
[000b7208]                           dc.w $ffff
[000b720a]                           dc.w $ffff
[000b720c]                           dc.w $001c
[000b720e]                           dc.w $0005
[000b7210]                           dc.w $0000
[000b7212] 000b5ac5                  dc.l TEXT_21
[000b7216]                           dc.w $0001
[000b7218]                           dc.w $0004
[000b721a]                           dc.w $0005
[000b721c]                           dc.w $0001
_88aEDIT_WINDOW:
[000b721e] 000236d4                  dc.l edwi_tic
[000b7222]                           dc.w $0000
[000b7224]                           dc.w $0000
[000b7226]                           dc.w $8000
[000b7228]                           dc.w $0000
[000b722a]                           dc.w $0000
[000b722c]                           dc.w $0000
[000b722e]                           dc.w $0000
[000b7230]                           dc.w $0000
[000b7232]                           dc.w $0000
[000b7234]                           dc.w $0000
_90_EDIT_WINDOW:
[000b7236]                           dc.w $0045
[000b7238]                           dc.w $ffff
[000b723a]                           dc.w $ffff
[000b723c]                           dc.w $001c
[000b723e]                           dc.w $0005
[000b7240]                           dc.w $0000
[000b7242] 000b5acb                  dc.l TEXT_22
[000b7246]                           dc.w $0001
[000b7248]                           dc.w $0005
[000b724a]                           dc.w $0005
[000b724c]                           dc.w $0001
_90aEDIT_WINDOW:
[000b724e] 00023710                  dc.l edwi_ref
[000b7252]                           dc.w $0000
[000b7254]                           dc.w $0000
[000b7256]                           dc.w $8000
[000b7258]                           dc.w $0000
[000b725a]                           dc.w $0000
[000b725c]                           dc.w $0000
[000b725e]                           dc.w $0000
[000b7260]                           dc.w $0000
[000b7262]                           dc.w $0000
[000b7264]                           dc.w $0000
_92_EDIT_WINDOW:
[000b7266]                           dc.w $0000
[000b7268]                           dc.w $005d
[000b726a]                           dc.w $00a5
[000b726c]                           dc.w $0018
[000b726e]                           dc.w $0000
[000b7270]                           dc.w $0000
[000b7272] 000b67b6                  dc.l A_INNERFRAME07
[000b7276]                           dc.w $0001
[000b7278]                           dc.w $001d
[000b727a]                           dc.w $002c
[000b727c]                           dc.w $0014
_93_EDIT_WINDOW:
[000b727e]                           dc.w $005f
[000b7280]                           dc.w $ffff
[000b7282]                           dc.w $ffff
[000b7284]                           dc.w $001c
[000b7286]                           dc.w $0005
[000b7288]                           dc.w $0000
[000b728a] 000b5a7f                  dc.l TEXT_14
[000b728e]                           dc.w $0001
[000b7290]                           dc.w $0001
[000b7292]                           dc.w $0005
[000b7294]                           dc.w $0001
_93aEDIT_WINDOW:
[000b7296] 00023710                  dc.l edwi_ref
[000b729a]                           dc.w $0000
[000b729c]                           dc.w $0000
[000b729e]                           dc.w $8000
[000b72a0]                           dc.w $0000
[000b72a2]                           dc.w $0000
[000b72a4]                           dc.w $0000
[000b72a6]                           dc.w $0000
[000b72a8]                           dc.w $0000
[000b72aa]                           dc.w $0000
[000b72ac]                           dc.w $0000
_95_EDIT_WINDOW:
[000b72ae]                           dc.w $0085
[000b72b0]                           dc.w $0060
[000b72b2]                           dc.w $0060
[000b72b4]                           dc.w $0018
[000b72b6]                           dc.w $0040
[000b72b8]                           dc.w $0000
[000b72ba] 000b5f56                  dc.l A_3DBUTTON01
[000b72be]                           dc.w $000a
[000b72c0]                           dc.w $0001
[000b72c2]                           dc.w $0020
[000b72c4]                           dc.w $0012
_96_EDIT_WINDOW:
[000b72c6]                           dc.w $005f
[000b72c8]                           dc.w $0061
[000b72ca]                           dc.w $0083
[000b72cc]                           dc.w $0014
[000b72ce]                           dc.w $0040
[000b72d0]                           dc.w $0000
[000b72d2]                           dc.w $00ff
[000b72d4]                           dc.w $0101
[000b72d6]                           dc.w $0000
[000b72d8]                           dc.w $0000
[000b72da]                           dc.w $0020
[000b72dc]                           dc.w $0012
_97_EDIT_WINDOW:
[000b72de]                           dc.w $0063
[000b72e0]                           dc.w $ffff
[000b72e2]                           dc.w $ffff
[000b72e4]                           dc.w $0018
[000b72e6]                           dc.w $1008
[000b72e8]                           dc.w $0000
[000b72ea] 000b6436                  dc.l A_BOXED16
[000b72ee]                           dc.w $0000
[000b72f0]                           dc.w $0000
[000b72f2]                           dc.w $0020
[000b72f4]                           dc.w $0001
_97aEDIT_WINDOW:
[000b72f6]                           dc.w $0000
[000b72f8]                           dc.w $0000
[000b72fa] 00023782                  dc.l edwi_acc
[000b72fe]                           dc.w $8000
[000b7300]                           dc.w $0000
[000b7302]                           dc.w $0000
[000b7304]                           dc.w $0000
[000b7306]                           dc.w $0000
[000b7308]                           dc.w $0000
[000b730a]                           dc.w $0000
[000b730c]                           dc.w $0000
_99_EDIT_WINDOW:
[000b730e]                           dc.w $0065
[000b7310]                           dc.w $ffff
[000b7312]                           dc.w $ffff
[000b7314]                           dc.w $0018
[000b7316]                           dc.w $1008
[000b7318]                           dc.w $0000
[000b731a] 000b6416                  dc.l A_BOXED15
[000b731e]                           dc.w $0000
[000b7320]                           dc.w $0001
[000b7322]                           dc.w $0020
[000b7324]                           dc.w $0001
_99aEDIT_WINDOW:
[000b7326]                           dc.w $0000
[000b7328]                           dc.w $0000
[000b732a] 00023782                  dc.l edwi_acc
[000b732e]                           dc.w $8000
[000b7330]                           dc.w $0000
[000b7332]                           dc.w $0000
[000b7334]                           dc.w $0000
[000b7336]                           dc.w $0000
[000b7338]                           dc.w $0000
[000b733a]                           dc.w $0000
[000b733c]                           dc.w $0000
_101_EDIT_WINDOW:
[000b733e]                           dc.w $0067
[000b7340]                           dc.w $ffff
[000b7342]                           dc.w $ffff
[000b7344]                           dc.w $0018
[000b7346]                           dc.w $1008
[000b7348]                           dc.w $0000
[000b734a] 000b63f6                  dc.l A_BOXED14
[000b734e]                           dc.w $0000
[000b7350]                           dc.w $0002
[000b7352]                           dc.w $0020
[000b7354]                           dc.w $0001
_101aEDIT_WINDOW:
[000b7356]                           dc.w $0000
[000b7358]                           dc.w $0000
[000b735a] 00023782                  dc.l edwi_acc
[000b735e]                           dc.w $8000
[000b7360]                           dc.w $0000
[000b7362]                           dc.w $0000
[000b7364]                           dc.w $0000
[000b7366]                           dc.w $0000
[000b7368]                           dc.w $0000
[000b736a]                           dc.w $0000
[000b736c]                           dc.w $0000
_103_EDIT_WINDOW:
[000b736e]                           dc.w $0069
[000b7370]                           dc.w $ffff
[000b7372]                           dc.w $ffff
[000b7374]                           dc.w $0018
[000b7376]                           dc.w $1008
[000b7378]                           dc.w $0000
[000b737a] 000b6456                  dc.l A_BOXED17
[000b737e]                           dc.w $0000
[000b7380]                           dc.w $0003
[000b7382]                           dc.w $0020
[000b7384]                           dc.w $0001
_103aEDIT_WINDOW:
[000b7386]                           dc.w $0000
[000b7388]                           dc.w $0000
[000b738a] 00023782                  dc.l edwi_acc
[000b738e]                           dc.w $8000
[000b7390]                           dc.w $0000
[000b7392]                           dc.w $0000
[000b7394]                           dc.w $0000
[000b7396]                           dc.w $0000
[000b7398]                           dc.w $0000
[000b739a]                           dc.w $0000
[000b739c]                           dc.w $0000
_105_EDIT_WINDOW:
[000b739e]                           dc.w $006b
[000b73a0]                           dc.w $ffff
[000b73a2]                           dc.w $ffff
[000b73a4]                           dc.w $0018
[000b73a6]                           dc.w $1008
[000b73a8]                           dc.w $0000
[000b73aa] 000b6476                  dc.l A_BOXED18
[000b73ae]                           dc.w $0000
[000b73b0]                           dc.w $0004
[000b73b2]                           dc.w $0020
[000b73b4]                           dc.w $0001
_105aEDIT_WINDOW:
[000b73b6]                           dc.w $0000
[000b73b8]                           dc.w $0000
[000b73ba] 00023782                  dc.l edwi_acc
[000b73be]                           dc.w $8000
[000b73c0]                           dc.w $0000
[000b73c2]                           dc.w $0000
[000b73c4]                           dc.w $0000
[000b73c6]                           dc.w $0000
[000b73c8]                           dc.w $0000
[000b73ca]                           dc.w $0000
[000b73cc]                           dc.w $0000
_107_EDIT_WINDOW:
[000b73ce]                           dc.w $006d
[000b73d0]                           dc.w $ffff
[000b73d2]                           dc.w $ffff
[000b73d4]                           dc.w $0018
[000b73d6]                           dc.w $1008
[000b73d8]                           dc.w $0000
[000b73da] 000b6496                  dc.l A_BOXED19
[000b73de]                           dc.w $0000
[000b73e0]                           dc.w $0005
[000b73e2]                           dc.w $0020
[000b73e4]                           dc.w $0001
_107aEDIT_WINDOW:
[000b73e6]                           dc.w $0000
[000b73e8]                           dc.w $0000
[000b73ea] 00023782                  dc.l edwi_acc
[000b73ee]                           dc.w $8000
[000b73f0]                           dc.w $0000
[000b73f2]                           dc.w $0000
[000b73f4]                           dc.w $0000
[000b73f6]                           dc.w $0000
[000b73f8]                           dc.w $0000
[000b73fa]                           dc.w $0000
[000b73fc]                           dc.w $0000
_109_EDIT_WINDOW:
[000b73fe]                           dc.w $006f
[000b7400]                           dc.w $ffff
[000b7402]                           dc.w $ffff
[000b7404]                           dc.w $0018
[000b7406]                           dc.w $1008
[000b7408]                           dc.w $0000
[000b740a] 000b64b6                  dc.l A_BOXED20
[000b740e]                           dc.w $0000
[000b7410]                           dc.w $0006
[000b7412]                           dc.w $0020
[000b7414]                           dc.w $0001
_109aEDIT_WINDOW:
[000b7416]                           dc.w $0000
[000b7418]                           dc.w $0000
[000b741a] 00023782                  dc.l edwi_acc
[000b741e]                           dc.w $8000
[000b7420]                           dc.w $0000
[000b7422]                           dc.w $0000
[000b7424]                           dc.w $0000
[000b7426]                           dc.w $0000
[000b7428]                           dc.w $0000
[000b742a]                           dc.w $0000
[000b742c]                           dc.w $0000
_111_EDIT_WINDOW:
[000b742e]                           dc.w $0071
[000b7430]                           dc.w $ffff
[000b7432]                           dc.w $ffff
[000b7434]                           dc.w $0018
[000b7436]                           dc.w $1008
[000b7438]                           dc.w $0000
[000b743a] 000b64d6                  dc.l A_BOXED21
[000b743e]                           dc.w $0000
[000b7440]                           dc.w $0007
[000b7442]                           dc.w $0020
[000b7444]                           dc.w $0001
_111aEDIT_WINDOW:
[000b7446]                           dc.w $0000
[000b7448]                           dc.w $0000
[000b744a] 00023782                  dc.l edwi_acc
[000b744e]                           dc.w $8000
[000b7450]                           dc.w $0000
[000b7452]                           dc.w $0000
[000b7454]                           dc.w $0000
[000b7456]                           dc.w $0000
[000b7458]                           dc.w $0000
[000b745a]                           dc.w $0000
[000b745c]                           dc.w $0000
_113_EDIT_WINDOW:
[000b745e]                           dc.w $0073
[000b7460]                           dc.w $ffff
[000b7462]                           dc.w $ffff
[000b7464]                           dc.w $0018
[000b7466]                           dc.w $1008
[000b7468]                           dc.w $0000
[000b746a] 000b64f6                  dc.l A_BOXED22
[000b746e]                           dc.w $0000
[000b7470]                           dc.w $0008
[000b7472]                           dc.w $0020
[000b7474]                           dc.w $0001
_113aEDIT_WINDOW:
[000b7476]                           dc.w $0000
[000b7478]                           dc.w $0000
[000b747a] 00023782                  dc.l edwi_acc
[000b747e]                           dc.w $8000
[000b7480]                           dc.w $0000
[000b7482]                           dc.w $0000
[000b7484]                           dc.w $0000
[000b7486]                           dc.w $0000
[000b7488]                           dc.w $0000
[000b748a]                           dc.w $0000
[000b748c]                           dc.w $0000
_115_EDIT_WINDOW:
[000b748e]                           dc.w $0075
[000b7490]                           dc.w $ffff
[000b7492]                           dc.w $ffff
[000b7494]                           dc.w $0018
[000b7496]                           dc.w $1008
[000b7498]                           dc.w $0000
[000b749a] 000b6516                  dc.l A_BOXED23
[000b749e]                           dc.w $0000
[000b74a0]                           dc.w $0009
[000b74a2]                           dc.w $0020
[000b74a4]                           dc.w $0001
_115aEDIT_WINDOW:
[000b74a6]                           dc.w $0000
[000b74a8]                           dc.w $0000
[000b74aa] 00023782                  dc.l edwi_acc
[000b74ae]                           dc.w $8000
[000b74b0]                           dc.w $0000
[000b74b2]                           dc.w $0000
[000b74b4]                           dc.w $0000
[000b74b6]                           dc.w $0000
[000b74b8]                           dc.w $0000
[000b74ba]                           dc.w $0000
[000b74bc]                           dc.w $0000
_117_EDIT_WINDOW:
[000b74be]                           dc.w $0077
[000b74c0]                           dc.w $ffff
[000b74c2]                           dc.w $ffff
[000b74c4]                           dc.w $0018
[000b74c6]                           dc.w $1008
[000b74c8]                           dc.w $0000
[000b74ca] 000b6536                  dc.l A_BOXED24
[000b74ce]                           dc.w $0000
[000b74d0]                           dc.w $000a
[000b74d2]                           dc.w $0020
[000b74d4]                           dc.w $0001
_117aEDIT_WINDOW:
[000b74d6]                           dc.w $0000
[000b74d8]                           dc.w $0000
[000b74da] 00023782                  dc.l edwi_acc
[000b74de]                           dc.w $8000
[000b74e0]                           dc.w $0000
[000b74e2]                           dc.w $0000
[000b74e4]                           dc.w $0000
[000b74e6]                           dc.w $0000
[000b74e8]                           dc.w $0000
[000b74ea]                           dc.w $0000
[000b74ec]                           dc.w $0000
_119_EDIT_WINDOW:
[000b74ee]                           dc.w $0079
[000b74f0]                           dc.w $ffff
[000b74f2]                           dc.w $ffff
[000b74f4]                           dc.w $0018
[000b74f6]                           dc.w $1008
[000b74f8]                           dc.w $0000
[000b74fa] 000b6556                  dc.l A_BOXED25
[000b74fe]                           dc.w $0000
[000b7500]                           dc.w $000b
[000b7502]                           dc.w $0020
[000b7504]                           dc.w $0001
_119aEDIT_WINDOW:
[000b7506]                           dc.w $0000
[000b7508]                           dc.w $0000
[000b750a] 00023782                  dc.l edwi_acc
[000b750e]                           dc.w $8000
[000b7510]                           dc.w $0000
[000b7512]                           dc.w $0000
[000b7514]                           dc.w $0000
[000b7516]                           dc.w $0000
[000b7518]                           dc.w $0000
[000b751a]                           dc.w $0000
[000b751c]                           dc.w $0000
_121_EDIT_WINDOW:
[000b751e]                           dc.w $007b
[000b7520]                           dc.w $ffff
[000b7522]                           dc.w $ffff
[000b7524]                           dc.w $0018
[000b7526]                           dc.w $1008
[000b7528]                           dc.w $0000
[000b752a] 000b6576                  dc.l A_BOXED26
[000b752e]                           dc.w $0000
[000b7530]                           dc.w $000c
[000b7532]                           dc.w $0020
[000b7534]                           dc.w $0001
_121aEDIT_WINDOW:
[000b7536]                           dc.w $0000
[000b7538]                           dc.w $0000
[000b753a] 00023782                  dc.l edwi_acc
[000b753e]                           dc.w $8000
[000b7540]                           dc.w $0000
[000b7542]                           dc.w $0000
[000b7544]                           dc.w $0000
[000b7546]                           dc.w $0000
[000b7548]                           dc.w $0000
[000b754a]                           dc.w $0000
[000b754c]                           dc.w $0000
_123_EDIT_WINDOW:
[000b754e]                           dc.w $007d
[000b7550]                           dc.w $ffff
[000b7552]                           dc.w $ffff
[000b7554]                           dc.w $0018
[000b7556]                           dc.w $1008
[000b7558]                           dc.w $0000
[000b755a] 000b6596                  dc.l A_BOXED27
[000b755e]                           dc.w $0000
[000b7560]                           dc.w $000d
[000b7562]                           dc.w $0020
[000b7564]                           dc.w $0001
_123aEDIT_WINDOW:
[000b7566]                           dc.w $0000
[000b7568]                           dc.w $0000
[000b756a] 00023782                  dc.l edwi_acc
[000b756e]                           dc.w $8000
[000b7570]                           dc.w $0000
[000b7572]                           dc.w $0000
[000b7574]                           dc.w $0000
[000b7576]                           dc.w $0000
[000b7578]                           dc.w $0000
[000b757a]                           dc.w $0000
[000b757c]                           dc.w $0000
_125_EDIT_WINDOW:
[000b757e]                           dc.w $007f
[000b7580]                           dc.w $ffff
[000b7582]                           dc.w $ffff
[000b7584]                           dc.w $0018
[000b7586]                           dc.w $1008
[000b7588]                           dc.w $0000
[000b758a] 000b65b6                  dc.l A_BOXED28
[000b758e]                           dc.w $0000
[000b7590]                           dc.w $000e
[000b7592]                           dc.w $0020
[000b7594]                           dc.w $0001
_125aEDIT_WINDOW:
[000b7596]                           dc.w $0000
[000b7598]                           dc.w $0000
[000b759a] 00023782                  dc.l edwi_acc
[000b759e]                           dc.w $8000
[000b75a0]                           dc.w $0000
[000b75a2]                           dc.w $0000
[000b75a4]                           dc.w $0000
[000b75a6]                           dc.w $0000
[000b75a8]                           dc.w $0000
[000b75aa]                           dc.w $0000
[000b75ac]                           dc.w $0000
_127_EDIT_WINDOW:
[000b75ae]                           dc.w $0081
[000b75b0]                           dc.w $ffff
[000b75b2]                           dc.w $ffff
[000b75b4]                           dc.w $0018
[000b75b6]                           dc.w $1008
[000b75b8]                           dc.w $0000
[000b75ba] 000b65d6                  dc.l A_BOXED29
[000b75be]                           dc.w $0000
[000b75c0]                           dc.w $000f
[000b75c2]                           dc.w $0020
[000b75c4]                           dc.w $0001
_127aEDIT_WINDOW:
[000b75c6]                           dc.w $0000
[000b75c8]                           dc.w $0000
[000b75ca] 00023782                  dc.l edwi_acc
[000b75ce]                           dc.w $8000
[000b75d0]                           dc.w $0000
[000b75d2]                           dc.w $0000
[000b75d4]                           dc.w $0000
[000b75d6]                           dc.w $0000
[000b75d8]                           dc.w $0000
[000b75da]                           dc.w $0000
[000b75dc]                           dc.w $0000
_129_EDIT_WINDOW:
[000b75de]                           dc.w $0083
[000b75e0]                           dc.w $ffff
[000b75e2]                           dc.w $ffff
[000b75e4]                           dc.w $0018
[000b75e6]                           dc.w $1008
[000b75e8]                           dc.w $0000
[000b75ea] 000b65f6                  dc.l A_BOXED30
[000b75ee]                           dc.w $0000
[000b75f0]                           dc.w $0010
[000b75f2]                           dc.w $0020
[000b75f4]                           dc.w $0001
_129aEDIT_WINDOW:
[000b75f6]                           dc.w $0000
[000b75f8]                           dc.w $0000
[000b75fa] 00023782                  dc.l edwi_acc
[000b75fe]                           dc.w $8000
[000b7600]                           dc.w $0000
[000b7602]                           dc.w $0000
[000b7604]                           dc.w $0000
[000b7606]                           dc.w $0000
[000b7608]                           dc.w $0000
[000b760a]                           dc.w $0000
[000b760c]                           dc.w $0000
_131_EDIT_WINDOW:
[000b760e]                           dc.w $0060
[000b7610]                           dc.w $ffff
[000b7612]                           dc.w $ffff
[000b7614]                           dc.w $0018
[000b7616]                           dc.w $1008
[000b7618]                           dc.w $0000
[000b761a] 000b6616                  dc.l A_BOXED31
[000b761e]                           dc.w $0000
[000b7620]                           dc.w $0011
[000b7622]                           dc.w $0020
[000b7624]                           dc.w $0001
_131aEDIT_WINDOW:
[000b7626]                           dc.w $0000
[000b7628]                           dc.w $0000
[000b762a] 00023782                  dc.l edwi_acc
[000b762e]                           dc.w $8000
[000b7630]                           dc.w $0000
[000b7632]                           dc.w $0000
[000b7634]                           dc.w $0000
[000b7636]                           dc.w $0000
[000b7638]                           dc.w $0000
[000b763a]                           dc.w $0000
[000b763c]                           dc.w $0000
_133_EDIT_WINDOW:
[000b763e]                           dc.w $0087
[000b7640]                           dc.w $ffff
[000b7642]                           dc.w $ffff
[000b7644]                           dc.w $001c
[000b7646]                           dc.w $0005
[000b7648]                           dc.w $0000
[000b764a] 000b5adc                  dc.l TEXT_25
[000b764e]                           dc.w $0001
[000b7650]                           dc.w $0002
[000b7652]                           dc.w $0007
[000b7654]                           dc.w $0001
_133aEDIT_WINDOW:
[000b7656] 00023710                  dc.l edwi_ref
[000b765a]                           dc.w $0000
[000b765c]                           dc.w $0000
[000b765e]                           dc.w $8000
[000b7660]                           dc.w $0000
[000b7662]                           dc.w $0000
[000b7664]                           dc.w $0000
[000b7666]                           dc.w $0000
[000b7668]                           dc.w $0000
[000b766a]                           dc.w $0000
[000b766c]                           dc.w $0000
_135_EDIT_WINDOW:
[000b766e]                           dc.w $0089
[000b7670]                           dc.w $ffff
[000b7672]                           dc.w $ffff
[000b7674]                           dc.w $001c
[000b7676]                           dc.w $0005
[000b7678]                           dc.w $0000
[000b767a] 000b5ad1                  dc.l TEXT_23
[000b767e]                           dc.w $0001
[000b7680]                           dc.w $0003
[000b7682]                           dc.w $0008
[000b7684]                           dc.w $0001
_135aEDIT_WINDOW:
[000b7686] 00023710                  dc.l edwi_ref
[000b768a]                           dc.w $0000
[000b768c]                           dc.w $0000
[000b768e]                           dc.w $8000
[000b7690]                           dc.w $0000
[000b7692]                           dc.w $0000
[000b7694]                           dc.w $0000
[000b7696]                           dc.w $0000
[000b7698]                           dc.w $0000
[000b769a]                           dc.w $0000
[000b769c]                           dc.w $0000
_137_EDIT_WINDOW:
[000b769e]                           dc.w $008b
[000b76a0]                           dc.w $ffff
[000b76a2]                           dc.w $ffff
[000b76a4]                           dc.w $001c
[000b76a6]                           dc.w $0005
[000b76a8]                           dc.w $0000
[000b76aa] 000b5ae4                  dc.l TEXT_26
[000b76ae]                           dc.w $0001
[000b76b0]                           dc.w $0004
[000b76b2]                           dc.w $0005
[000b76b4]                           dc.w $0001
_137aEDIT_WINDOW:
[000b76b6] 00023710                  dc.l edwi_ref
[000b76ba]                           dc.w $0000
[000b76bc]                           dc.w $0000
[000b76be]                           dc.w $8000
[000b76c0]                           dc.w $0000
[000b76c2]                           dc.w $0000
[000b76c4]                           dc.w $0000
[000b76c6]                           dc.w $0000
[000b76c8]                           dc.w $0000
[000b76ca]                           dc.w $0000
[000b76cc]                           dc.w $0000
_139_EDIT_WINDOW:
[000b76ce]                           dc.w $008d
[000b76d0]                           dc.w $ffff
[000b76d2]                           dc.w $ffff
[000b76d4]                           dc.w $001c
[000b76d6]                           dc.w $0005
[000b76d8]                           dc.w $0000
[000b76da] 000b5aea                  dc.l TEXT_27
[000b76de]                           dc.w $0001
[000b76e0]                           dc.w $0005
[000b76e2]                           dc.w $0005
[000b76e4]                           dc.w $0001
_139aEDIT_WINDOW:
[000b76e6] 00023710                  dc.l edwi_ref
[000b76ea]                           dc.w $0000
[000b76ec]                           dc.w $0000
[000b76ee]                           dc.w $8000
[000b76f0]                           dc.w $0000
[000b76f2]                           dc.w $0000
[000b76f4]                           dc.w $0000
[000b76f6]                           dc.w $0000
[000b76f8]                           dc.w $0000
[000b76fa]                           dc.w $0000
[000b76fc]                           dc.w $0000
_141_EDIT_WINDOW:
[000b76fe]                           dc.w $008f
[000b7700]                           dc.w $ffff
[000b7702]                           dc.w $ffff
[000b7704]                           dc.w $001c
[000b7706]                           dc.w $0005
[000b7708]                           dc.w $0000
[000b770a] 000b5af0                  dc.l TEXT_28
[000b770e]                           dc.w $0001
[000b7710]                           dc.w $0006
[000b7712]                           dc.w $0007
[000b7714]                           dc.w $0001
_141aEDIT_WINDOW:
[000b7716] 00023710                  dc.l edwi_ref
[000b771a]                           dc.w $0000
[000b771c]                           dc.w $0000
[000b771e]                           dc.w $8000
[000b7720]                           dc.w $0000
[000b7722]                           dc.w $0000
[000b7724]                           dc.w $0000
[000b7726]                           dc.w $0000
[000b7728]                           dc.w $0000
[000b772a]                           dc.w $0000
[000b772c]                           dc.w $0000
_143_EDIT_WINDOW:
[000b772e]                           dc.w $0091
[000b7730]                           dc.w $ffff
[000b7732]                           dc.w $ffff
[000b7734]                           dc.w $001c
[000b7736]                           dc.w $0005
[000b7738]                           dc.w $0000
[000b773a] 000b5af8                  dc.l TEXT_29
[000b773e]                           dc.w $0001
[000b7740]                           dc.w $0007
[000b7742]                           dc.w $0007
[000b7744]                           dc.w $0001
_143aEDIT_WINDOW:
[000b7746] 00023710                  dc.l edwi_ref
[000b774a]                           dc.w $0000
[000b774c]                           dc.w $0000
[000b774e]                           dc.w $8000
[000b7750]                           dc.w $0000
[000b7752]                           dc.w $0000
[000b7754]                           dc.w $0000
[000b7756]                           dc.w $0000
[000b7758]                           dc.w $0000
[000b775a]                           dc.w $0000
[000b775c]                           dc.w $0000
_145_EDIT_WINDOW:
[000b775e]                           dc.w $0093
[000b7760]                           dc.w $ffff
[000b7762]                           dc.w $ffff
[000b7764]                           dc.w $001c
[000b7766]                           dc.w $0005
[000b7768]                           dc.w $0000
[000b776a] 000b5b00                  dc.l TEXT_30
[000b776e]                           dc.w $0001
[000b7770]                           dc.w $0008
[000b7772]                           dc.w $0007
[000b7774]                           dc.w $0001
_145aEDIT_WINDOW:
[000b7776] 00023710                  dc.l edwi_ref
[000b777a]                           dc.w $0000
[000b777c]                           dc.w $0000
[000b777e]                           dc.w $8000
[000b7780]                           dc.w $0000
[000b7782]                           dc.w $0000
[000b7784]                           dc.w $0000
[000b7786]                           dc.w $0000
[000b7788]                           dc.w $0000
[000b778a]                           dc.w $0000
[000b778c]                           dc.w $0000
_147_EDIT_WINDOW:
[000b778e]                           dc.w $0095
[000b7790]                           dc.w $ffff
[000b7792]                           dc.w $ffff
[000b7794]                           dc.w $001c
[000b7796]                           dc.w $0005
[000b7798]                           dc.w $0000
[000b779a] 000b5b08                  dc.l TEXT_31
[000b779e]                           dc.w $0001
[000b77a0]                           dc.w $0009
[000b77a2]                           dc.w $0007
[000b77a4]                           dc.w $0001
_147aEDIT_WINDOW:
[000b77a6] 00023710                  dc.l edwi_ref
[000b77aa]                           dc.w $0000
[000b77ac]                           dc.w $0000
[000b77ae]                           dc.w $8000
[000b77b0]                           dc.w $0000
[000b77b2]                           dc.w $0000
[000b77b4]                           dc.w $0000
[000b77b6]                           dc.w $0000
[000b77b8]                           dc.w $0000
[000b77ba]                           dc.w $0000
[000b77bc]                           dc.w $0000
_149_EDIT_WINDOW:
[000b77be]                           dc.w $0097
[000b77c0]                           dc.w $ffff
[000b77c2]                           dc.w $ffff
[000b77c4]                           dc.w $001c
[000b77c6]                           dc.w $0005
[000b77c8]                           dc.w $0000
[000b77ca] 000b5b10                  dc.l TEXT_32
[000b77ce]                           dc.w $0001
[000b77d0]                           dc.w $000a
[000b77d2]                           dc.w $0007
[000b77d4]                           dc.w $0001
_149aEDIT_WINDOW:
[000b77d6] 00023710                  dc.l edwi_ref
[000b77da]                           dc.w $0000
[000b77dc]                           dc.w $0000
[000b77de]                           dc.w $8000
[000b77e0]                           dc.w $0000
[000b77e2]                           dc.w $0000
[000b77e4]                           dc.w $0000
[000b77e6]                           dc.w $0000
[000b77e8]                           dc.w $0000
[000b77ea]                           dc.w $0000
[000b77ec]                           dc.w $0000
_151_EDIT_WINDOW:
[000b77ee]                           dc.w $0099
[000b77f0]                           dc.w $ffff
[000b77f2]                           dc.w $ffff
[000b77f4]                           dc.w $001c
[000b77f6]                           dc.w $0005
[000b77f8]                           dc.w $0000
[000b77fa] 000b5b18                  dc.l TEXT_33
[000b77fe]                           dc.w $0001
[000b7800]                           dc.w $000b
[000b7802]                           dc.w $0008
[000b7804]                           dc.w $0001
_151aEDIT_WINDOW:
[000b7806] 00023710                  dc.l edwi_ref
[000b780a]                           dc.w $0000
[000b780c]                           dc.w $0000
[000b780e]                           dc.w $8000
[000b7810]                           dc.w $0000
[000b7812]                           dc.w $0000
[000b7814]                           dc.w $0000
[000b7816]                           dc.w $0000
[000b7818]                           dc.w $0000
[000b781a]                           dc.w $0000
[000b781c]                           dc.w $0000
_153_EDIT_WINDOW:
[000b781e]                           dc.w $009b
[000b7820]                           dc.w $ffff
[000b7822]                           dc.w $ffff
[000b7824]                           dc.w $001c
[000b7826]                           dc.w $0005
[000b7828]                           dc.w $0000
[000b782a] 000b5b21                  dc.l TEXT_34
[000b782e]                           dc.w $0001
[000b7830]                           dc.w $000c
[000b7832]                           dc.w $0008
[000b7834]                           dc.w $0001
_153aEDIT_WINDOW:
[000b7836] 00023710                  dc.l edwi_ref
[000b783a]                           dc.w $0000
[000b783c]                           dc.w $0000
[000b783e]                           dc.w $8000
[000b7840]                           dc.w $0000
[000b7842]                           dc.w $0000
[000b7844]                           dc.w $0000
[000b7846]                           dc.w $0000
[000b7848]                           dc.w $0000
[000b784a]                           dc.w $0000
[000b784c]                           dc.w $0000
_155_EDIT_WINDOW:
[000b784e]                           dc.w $009d
[000b7850]                           dc.w $ffff
[000b7852]                           dc.w $ffff
[000b7854]                           dc.w $001c
[000b7856]                           dc.w $0005
[000b7858]                           dc.w $0000
[000b785a] 000b5b2a                  dc.l TEXT_35
[000b785e]                           dc.w $0001
[000b7860]                           dc.w $000d
[000b7862]                           dc.w $0008
[000b7864]                           dc.w $0001
_155aEDIT_WINDOW:
[000b7866] 00023710                  dc.l edwi_ref
[000b786a]                           dc.w $0000
[000b786c]                           dc.w $0000
[000b786e]                           dc.w $8000
[000b7870]                           dc.w $0000
[000b7872]                           dc.w $0000
[000b7874]                           dc.w $0000
[000b7876]                           dc.w $0000
[000b7878]                           dc.w $0000
[000b787a]                           dc.w $0000
[000b787c]                           dc.w $0000
_157_EDIT_WINDOW:
[000b787e]                           dc.w $009f
[000b7880]                           dc.w $ffff
[000b7882]                           dc.w $ffff
[000b7884]                           dc.w $001c
[000b7886]                           dc.w $0005
[000b7888]                           dc.w $0000
[000b788a] 000b5b33                  dc.l TEXT_36
[000b788e]                           dc.w $0001
[000b7890]                           dc.w $000e
[000b7892]                           dc.w $0006
[000b7894]                           dc.w $0001
_157aEDIT_WINDOW:
[000b7896] 00023710                  dc.l edwi_ref
[000b789a]                           dc.w $0000
[000b789c]                           dc.w $0000
[000b789e]                           dc.w $8000
[000b78a0]                           dc.w $0000
[000b78a2]                           dc.w $0000
[000b78a4]                           dc.w $0000
[000b78a6]                           dc.w $0000
[000b78a8]                           dc.w $0000
[000b78aa]                           dc.w $0000
[000b78ac]                           dc.w $0000
_159_EDIT_WINDOW:
[000b78ae]                           dc.w $00a1
[000b78b0]                           dc.w $ffff
[000b78b2]                           dc.w $ffff
[000b78b4]                           dc.w $001c
[000b78b6]                           dc.w $0005
[000b78b8]                           dc.w $0000
[000b78ba] 000b5b3a                  dc.l TEXT_37
[000b78be]                           dc.w $0001
[000b78c0]                           dc.w $000f
[000b78c2]                           dc.w $0006
[000b78c4]                           dc.w $0001
_159aEDIT_WINDOW:
[000b78c6] 00023710                  dc.l edwi_ref
[000b78ca]                           dc.w $0000
[000b78cc]                           dc.w $0000
[000b78ce]                           dc.w $8000
[000b78d0]                           dc.w $0000
[000b78d2]                           dc.w $0000
[000b78d4]                           dc.w $0000
[000b78d6]                           dc.w $0000
[000b78d8]                           dc.w $0000
[000b78da]                           dc.w $0000
[000b78dc]                           dc.w $0000
_161_EDIT_WINDOW:
[000b78de]                           dc.w $00a3
[000b78e0]                           dc.w $ffff
[000b78e2]                           dc.w $ffff
[000b78e4]                           dc.w $001c
[000b78e6]                           dc.w $0005
[000b78e8]                           dc.w $0000
[000b78ea] 000b5b6e                  dc.l TEXT_49
[000b78ee]                           dc.w $0001
[000b78f0]                           dc.w $0010
[000b78f2]                           dc.w $0008
[000b78f4]                           dc.w $0001
_161aEDIT_WINDOW:
[000b78f6] 00023710                  dc.l edwi_ref
[000b78fa]                           dc.w $0000
[000b78fc]                           dc.w $0000
[000b78fe]                           dc.w $8000
[000b7900]                           dc.w $0000
[000b7902]                           dc.w $0000
[000b7904]                           dc.w $0000
[000b7906]                           dc.w $0000
[000b7908]                           dc.w $0000
[000b790a]                           dc.w $0000
[000b790c]                           dc.w $0000
_163_EDIT_WINDOW:
[000b790e]                           dc.w $00a5
[000b7910]                           dc.w $ffff
[000b7912]                           dc.w $ffff
[000b7914]                           dc.w $001c
[000b7916]                           dc.w $0005
[000b7918]                           dc.w $0000
[000b791a] 000b5b7c                  dc.l TEXT_51
[000b791e]                           dc.w $0001
[000b7920]                           dc.w $0011
[000b7922]                           dc.w $0008
[000b7924]                           dc.w $0001
_163aEDIT_WINDOW:
[000b7926] 00023710                  dc.l edwi_ref
[000b792a]                           dc.w $0000
[000b792c]                           dc.w $0000
[000b792e]                           dc.w $8000
[000b7930]                           dc.w $0000
[000b7932]                           dc.w $0000
[000b7934]                           dc.w $0000
[000b7936]                           dc.w $0000
[000b7938]                           dc.w $0000
[000b793a]                           dc.w $0000
[000b793c]                           dc.w $0000
_165_EDIT_WINDOW:
[000b793e]                           dc.w $005c
[000b7940]                           dc.w $ffff
[000b7942]                           dc.w $ffff
[000b7944]                           dc.w $001c
[000b7946]                           dc.w $0005
[000b7948]                           dc.w $0000
[000b794a] 000b5b85                  dc.l TEXT_52
[000b794e]                           dc.w $0001
[000b7950]                           dc.w $0012
[000b7952]                           dc.w $0008
[000b7954]                           dc.w $0001
_165aEDIT_WINDOW:
[000b7956] 00023710                  dc.l edwi_ref
[000b795a]                           dc.w $0000
[000b795c]                           dc.w $0000
[000b795e]                           dc.w $8020
[000b7960]                           dc.w $0000
[000b7962]                           dc.w $0000
[000b7964]                           dc.w $0000
[000b7966]                           dc.w $0000
[000b7968]                           dc.w $0000
[000b796a]                           dc.w $0000
[000b796c]                           dc.w $0000
WI_WINDOW:
[000b796e]                           dc.w $0000
[000b7970]                           dc.w $0000
[000b7972] 0002406a                  dc.l wi_service
[000b7976] 00023fbc                  dc.l wi_make
[000b797a] 00057428                  dc.l Awi_open
[000b797e] 00055e94                  dc.l Awi_init
[000b7982] 000b69c6                  dc.l EDIT_WINDOW
[000b7986]                           dc.w $0000
[000b7988]                           dc.w $0000
[000b798a]                           dc.w $0000
[000b798c]                           dc.w $0000
[000b798e]                           dc.w $ffff
[000b7990]                           dc.w $61ff
[000b7992]                           dc.w $0000
[000b7994]                           dc.w $0000
[000b7996]                           dc.w $0063
[000b7998]                           dc.w $0063
[000b799a]                           dc.w $0000
[000b799c]                           dc.w $0000
[000b799e]                           dc.w $0000
[000b79a0]                           dc.w $0000
[000b79a2]                           dc.w $0000
[000b79a4]                           dc.w $0000
[000b79a6]                           dc.w $0000
[000b79a8]                           dc.w $0000
[000b79aa]                           dc.w $ffff
[000b79ac]                           dc.w $ffff
[000b79ae]                           dc.w $ffff
[000b79b0]                           dc.w $ffff
[000b79b2]                           dc.w $0000
[000b79b4]                           dc.w $0000
[000b79b6]                           dc.w $f8f8
[000b79b8] 000b5a85                  dc.l TEXT_15
[000b79bc] 000b5a04                  dc.l TEXT_002
[000b79c0]                           dc.w $2710
[000b79c2]                           dc.w $0100
[000b79c4]                           dc.w $0000
[000b79c6]                           dc.w $ffff
[000b79c8] 000b69a0                  dc.l IC_WINDOW
[000b79cc]                           dc.w $0000
[000b79ce]                           dc.w $0000
[000b79d0] 0006b744                  dc.l Awi_keys
[000b79d4] 00051852                  dc.l Awi_obchange
[000b79d8] 00051c46                  dc.l Awi_redraw
[000b79dc] 000587a4                  dc.l Awi_topped
[000b79e0] 00058362                  dc.l Awi_closed
[000b79e4] 000587ec                  dc.l Awi_fulled
[000b79e8] 0005217c                  dc.l Awi_arrowed
[000b79ec] 000524b4                  dc.l Awi_hslid
[000b79f0] 0005255e                  dc.l Awi_vslid
[000b79f4] 00058bb0                  dc.l Awi_sized
[000b79f8] 00058d50                  dc.l Awi_moved
[000b79fc] 0005998a                  dc.l Awi_iconify
[000b7a00] 00059c6c                  dc.l Awi_uniconify
[000b7a04] 0005b5b6                  dc.l Awi_gemscript
[000b7a08] 000b59f1                  dc.l STGUIDE_01
[000b7a0c]                           dc.w $0000
[000b7a0e]                           dc.w $0000
[000b7a10]                           dc.w $0000
[000b7a12]                           dc.w $0000
[000b7a14]                           dc.w $0000
[000b7a16]                           dc.w $0000
[000b7a18]                           dc.w $0000
[000b7a1a]                           dc.w $0000
[000b7a1c]                           dc.w $0000
[000b7a1e]                           dc.w $0000
[000b7a20]                           dc.w $0000
[000b7a22]                           dc.w $0000
[000b7a24]                           dc.w $0000
[000b7a26]                           dc.b 'STGUIDE_01',0
[000b7a31]                           dc.b $00
[000b7a32]                           dc.w $0000
[000b7a34]                           dc.w $0000
[000b7a36]                           dc.w $0000
[000b7a38]                           dc.w $0000
[000b7a3a]                           dc.w $0000
[000b7a3c]                           dc.w $0000
[000b7a3e]                           dc.w $0000
[000b7a40]                           dc.w $0000
[000b7a42]                           dc.w $0000
[000b7a44]                           dc.w $0000
[000b7a46]                           dc.w $0000
[000b7a48]                           dc.w $0000
[000b7a4a]                           dc.w $0000
[000b7a4c]                           dc.w $0000
[000b7a4e]                           dc.w $0000
[000b7a50]                           dc.w $0000
[000b7a52]                           dc.w $0000
[000b7a54]                           dc.w $0000
[000b7a56]                           dc.w $0000
[000b7a58]                           dc.w $0000
[000b7a5a]                           dc.w $0000
[000b7a5c]                           dc.w $0000
[000b7a5e]                           dc.w $0000
[000b7a60]                           dc.w $0000
[000b7a62]                           dc.w $0000
[000b7a64]                           dc.w $0000
[000b7a66]                           dc.w $0000
[000b7a68]                           dc.b 'HELPFILE_01',0
[000b7a74]                           dc.w $0000
[000b7a76]                           dc.w $0000
[000b7a78]                           dc.w $0000
[000b7a7a]                           dc.w $0000
[000b7a7c]                           dc.w $0000
[000b7a7e]                           dc.w $0000
[000b7a80]                           dc.w $0000
[000b7a82]                           dc.w $0000
[000b7a84]                           dc.w $0000
[000b7a86]                           dc.w $0000
[000b7a88]                           dc.w $0000
[000b7a8a]                           dc.w $0000
[000b7a8c]                           dc.w $0000
[000b7a8e]                           dc.w $0000
[000b7a90]                           dc.w $0000
[000b7a92]                           dc.w $0000
[000b7a94]                           dc.w $2564
[000b7a96]                           dc.w $0000
