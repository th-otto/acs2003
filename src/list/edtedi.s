add_tedinfo:
[00036574] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00036578] 514f                      subq.w     #8,a7
[0003657a] 2448                      movea.l    a0,a2
[0003657c] 2f49 0004                 move.l     a1,4(a7)
[00036580] 006a 0001 0006            ori.w      #$0001,6(a2)
[00036586] 206a 0028                 movea.l    40(a2),a0
[0003658a] 2ea8 0004                 move.l     4(a0),(a7)
[0003658e] 2a69 0004                 movea.l    4(a1),a5
[00036592] 7006                      moveq.l    #6,d0
[00036594] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003659a] c069 0266                 and.w      614(a1),d0
[0003659e] 5d40                      subq.w     #6,d0
[000365a0] 6700 009e                 beq        add_tedinfo_1
[000365a4] 2628 000e                 move.l     14(a0),d3
[000365a8] e48b                      lsr.l      #2,d3
[000365aa] 4244                      clr.w      d4
[000365ac] 6000 008c                 bra        add_tedinfo_2
add_tedinfo_5:
[000365b0] 3004                      move.w     d4,d0
[000365b2] 48c0                      ext.l      d0
[000365b4] e588                      lsl.l      #2,d0
[000365b6] 2057                      movea.l    (a7),a0
[000365b8] 2870 0800                 movea.l    0(a0,d0.l),a4
[000365bc] 266c 0004                 movea.l    4(a4),a3
[000365c0] 322b 000c                 move.w     12(a3),d1
[000365c4] b26d 000c                 cmp.w      12(a5),d1
[000365c8] 666e                      bne.s      add_tedinfo_3
[000365ca] 342b 0010                 move.w     16(a3),d2
[000365ce] b46d 0010                 cmp.w      16(a5),d2
[000365d2] 6664                      bne.s      add_tedinfo_3
[000365d4] 302b 0012                 move.w     18(a3),d0
[000365d8] b06d 0012                 cmp.w      18(a5),d0
[000365dc] 665a                      bne.s      add_tedinfo_3
[000365de] 322b 0016                 move.w     22(a3),d1
[000365e2] b26d 0016                 cmp.w      22(a5),d1
[000365e6] 6650                      bne.s      add_tedinfo_3
[000365e8] 2255                      movea.l    (a5),a1
[000365ea] 2269 0004                 movea.l    4(a1),a1
[000365ee] 2053                      movea.l    (a3),a0
[000365f0] 2068 0004                 movea.l    4(a0),a0
[000365f4] 4eb9 0008 2eba            jsr        strcmp
[000365fa] 4a40                      tst.w      d0
[000365fc] 663a                      bne.s      add_tedinfo_3
[000365fe] 206d 0004                 movea.l    4(a5),a0
[00036602] 2268 0004                 movea.l    4(a0),a1
[00036606] 206b 0004                 movea.l    4(a3),a0
[0003660a] 2068 0004                 movea.l    4(a0),a0
[0003660e] 4eb9 0008 2eba            jsr        strcmp
[00036614] 4a40                      tst.w      d0
[00036616] 6620                      bne.s      add_tedinfo_3
[00036618] 206d 0008                 movea.l    8(a5),a0
[0003661c] 2268 0004                 movea.l    4(a0),a1
[00036620] 206b 0008                 movea.l    8(a3),a0
[00036624] 2068 0004                 movea.l    4(a0),a0
[00036628] 4eb9 0008 2eba            jsr        strcmp
[0003662e] 4a40                      tst.w      d0
[00036630] 6606                      bne.s      add_tedinfo_3
[00036632] 526c 0036                 addq.w     #1,54(a4)
[00036636] 6044                      bra.s      add_tedinfo_4
add_tedinfo_3:
[00036638] 5244                      addq.w     #1,d4
add_tedinfo_2:
[0003663a] b644                      cmp.w      d4,d3
[0003663c] 6e00 ff72                 bgt        add_tedinfo_5
add_tedinfo_1:
[00036640] 226f 0004                 movea.l    4(a7),a1
[00036644] 204a                      movea.l    a2,a0
[00036646] 4eb9 0003 6750            jsr        copy_tedi
[0003664c] 2848                      movea.l    a0,a4
[0003664e] 200c                      move.l     a4,d0
[00036650] 6604                      bne.s      add_tedinfo_6
[00036652] 91c8                      suba.l     a0,a0
[00036654] 6028                      bra.s      add_tedinfo_7
add_tedinfo_6:
[00036656] 2f39 000c f0e0            move.l     $000CF0E0,-(a7)
[0003665c] 206f 0008                 movea.l    8(a7),a0
[00036660] 4868 0016                 pea.l      22(a0)
[00036664] 224c                      movea.l    a4,a1
[00036666] 204a                      movea.l    a2,a0
[00036668] 4eb9 0001 81c6            jsr        objname
[0003666e] 504f                      addq.w     #8,a7
[00036670] 224c                      movea.l    a4,a1
[00036672] 206a 0028                 movea.l    40(a2),a0
[00036676] 4eb9 0003 33b4            jsr        add_entry
add_tedinfo_4:
[0003667c] 204c                      movea.l    a4,a0
add_tedinfo_7:
[0003667e] 504f                      addq.w     #8,a7
[00036680] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00036684] 4e75                      rts

del_tedinfo:
[00036686] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003668a] 2448                      movea.l    a0,a2
[0003668c] 2649                      movea.l    a1,a3
[0003668e] 006a 0001 0006            ori.w      #$0001,6(a2)
[00036694] 536b 0036                 subq.w     #1,54(a3)
[00036698] 302b 0036                 move.w     54(a3),d0
[0003669c] 6e3a                      bgt.s      del_tedinfo_1
[0003669e] 286b 0004                 movea.l    4(a3),a4
[000366a2] 2254                      movea.l    (a4),a1
[000366a4] 4eb9 0003 6108            jsr        del_string
[000366aa] 226c 0004                 movea.l    4(a4),a1
[000366ae] 204a                      movea.l    a2,a0
[000366b0] 4eb9 0003 6108            jsr        del_string
[000366b6] 226c 0008                 movea.l    8(a4),a1
[000366ba] 204a                      movea.l    a2,a0
[000366bc] 4eb9 0003 6108            jsr        del_string
[000366c2] 224b                      movea.l    a3,a1
[000366c4] 206a 0028                 movea.l    40(a2),a0
[000366c8] 4eb9 0003 3420            jsr        del_entry
[000366ce] 224b                      movea.l    a3,a1
[000366d0] 204a                      movea.l    a2,a0
[000366d2] 4eb9 0001 7f52            jsr        objfree
del_tedinfo_1:
[000366d8] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000366dc] 4e75                      rts

dup_tedinfo:
[000366de] 48e7 003c                 movem.l    a2-a5,-(a7)
[000366e2] 2848                      movea.l    a0,a4
[000366e4] 2449                      movea.l    a1,a2
[000366e6] 47f9 000c f0fa            lea.l      my_ted,a3
[000366ec] 701c                      moveq.l    #28,d0
[000366ee] 224a                      movea.l    a2,a1
[000366f0] 204b                      movea.l    a3,a0
[000366f2] 4eb9 0008 3500            jsr        memcpy
[000366f8] 2252                      movea.l    (a2),a1
[000366fa] 204c                      movea.l    a4,a0
[000366fc] 4eb9 0003 615c            jsr        dup_string
[00036702] 2a48                      movea.l    a0,a5
[00036704] 536d 0036                 subq.w     #1,54(a5)
[00036708] 2688                      move.l     a0,(a3)
[0003670a] 226a 0004                 movea.l    4(a2),a1
[0003670e] 204c                      movea.l    a4,a0
[00036710] 4eb9 0003 615c            jsr        dup_string
[00036716] 2a48                      movea.l    a0,a5
[00036718] 536d 0036                 subq.w     #1,54(a5)
[0003671c] 2748 0004                 move.l     a0,4(a3)
[00036720] 226a 0008                 movea.l    8(a2),a1
[00036724] 204c                      movea.l    a4,a0
[00036726] 4eb9 0003 615c            jsr        dup_string
[0003672c] 2a48                      movea.l    a0,a5
[0003672e] 536d 0036                 subq.w     #1,54(a5)
[00036732] 2748 0008                 move.l     a0,8(a3)
[00036736] 701c                      moveq.l    #28,d0
[00036738] 2740 0026                 move.l     d0,38(a3)
[0003673c] 2740 002a                 move.l     d0,42(a3)
[00036740] 43eb 001c                 lea.l      28(a3),a1
[00036744] 204c                      movea.l    a4,a0
[00036746] 6100 fe2c                 bsr        add_tedinfo
[0003674a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003674e] 4e75                      rts

copy_tedi:
[00036750] 48e7 003c                 movem.l    a2-a5,-(a7)
[00036754] 2448                      movea.l    a0,a2
[00036756] 2849                      movea.l    a1,a4
[00036758] 701c                      moveq.l    #28,d0
[0003675a] 4eb9 0001 7fae            jsr        objmalloc
[00036760] 2648                      movea.l    a0,a3
[00036762] 200b                      move.l     a3,d0
[00036764] 6604                      bne.s      copy_tedi_1
[00036766] 91c8                      suba.l     a0,a0
[00036768] 604a                      bra.s      copy_tedi_2
copy_tedi_1:
[0003676a] 286c 0004                 movea.l    4(a4),a4
[0003676e] 2a6b 0004                 movea.l    4(a3),a5
[00036772] 701c                      moveq.l    #28,d0
[00036774] 224c                      movea.l    a4,a1
[00036776] 204d                      movea.l    a5,a0
[00036778] 4eb9 0008 3500            jsr        memcpy
[0003677e] 277c 0000 001c 000e       move.l     #$0000001C,14(a3)
[00036786] 2254                      movea.l    (a4),a1
[00036788] 204a                      movea.l    a2,a0
[0003678a] 4eb9 0003 5f3e            jsr        add_string
[00036790] 2a88                      move.l     a0,(a5)
[00036792] 226c 0004                 movea.l    4(a4),a1
[00036796] 204a                      movea.l    a2,a0
[00036798] 4eb9 0003 5f3e            jsr        add_string
[0003679e] 2b48 0004                 move.l     a0,4(a5)
[000367a2] 226c 0008                 movea.l    8(a4),a1
[000367a6] 204a                      movea.l    a2,a0
[000367a8] 4eb9 0003 5f3e            jsr        add_string
[000367ae] 2b48 0008                 move.l     a0,8(a5)
[000367b2] 204b                      movea.l    a3,a0
copy_tedi_2:
[000367b4] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000367b8] 4e75                      rts

new_work:
[000367ba] 303c 271b                 move.w     #$271B,d0
[000367be] 2279 000b 39f2            movea.l    $000B39F2,a1
[000367c4] 4eb9 0003 3dd6            jsr        work_icon
[000367ca] 4e75                      rts

	.data

list_tedi:
[000cf0d0]                           dc.w $0000
[000cf0d2]                           dc.w $0000
[000cf0d4]                           dc.w $0000
[000cf0d6]                           dc.w $0000
[000cf0d8] 000b3998                  dc.l WI_TEDI
[000cf0dc] 000cd10f                  dc.l te_list
[000cf0e0] 000cd11f                  dc.l te_name
[000cf0e4]                           dc.w $271b
[000cf0e6]                           dc.w $0000
[000cf0e8]                           dc.w $0000
[000cf0ea] 00036750                  dc.l copy_tedi
[000cf0ee] 00036686                  dc.l del_tedinfo
[000cf0f2] 000367ba                  dc.l new_work
[000cf0f6]                           dc.w $0000
[000cf0f8]                           dc.w $0000
my_ted:
[000cf0fa]                           dc.w $0000
[000cf0fc]                           dc.w $0000
[000cf0fe]                           dc.w $0000
[000cf100]                           dc.w $0000
[000cf102]                           dc.w $0000
[000cf104]                           dc.w $0000
[000cf106]                           dc.w $0000
[000cf108]                           dc.w $0000
[000cf10a]                           dc.w $0000
[000cf10c]                           dc.w $0000
[000cf10e]                           dc.w $0000
[000cf110]                           dc.w $0000
[000cf112]                           dc.w $0000
[000cf114]                           dc.w $0000
free_tedi:
[000cf116]                           dc.w $0000
[000cf118]                           dc.w $0000
[000cf11a] 000cf0fa                  dc.l my_ted
[000cf11e]                           dc.w $0000
[000cf120]                           dc.w $0000
[000cf122]                           dc.w $001c
[000cf124]                           dc.w $0000
[000cf126]                           dc.w $001c
[000cf128]                           dc.w $0000
[000cf12a]                           dc.w $0000
[000cf12c]                           dc.b 'TEDINFO_01',0
[000cf137]                           dc.b $00
[000cf138]                           dc.w $0000
[000cf13a]                           dc.w $0000
[000cf13c]                           dc.w $0000
[000cf13e]                           dc.w $0000
[000cf140]                           dc.w $0000
[000cf142]                           dc.w $0000
[000cf144]                           dc.w $0000
[000cf146]                           dc.w $0000
[000cf148]                           dc.w $0000
[000cf14a]                           dc.w $0000
[000cf14c]                           dc.w $0001
[000cf14e]                           dc.w $0000
[000cf150]                           dc.w $0000
[000cf152]                           dc.w $0000
[000cf154]                           dc.w $0000
[000cf156]                           dc.w $0000
