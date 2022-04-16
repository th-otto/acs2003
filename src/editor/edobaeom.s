edao_pal:
[00032df0] 2f0a                      move.l     a2,-(a7)
[00032df2] 2f0b                      move.l     a3,-(a7)
[00032df4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00032dfa] 2468 0258                 movea.l    600(a0),a2
[00032dfe] 006a 0004 0054            ori.w      #$0004,84(a2)
[00032e04] 2652                      movea.l    (a2),a3
[00032e06] 2053                      movea.l    (a3),a0
[00032e08] 2279 0008 7504            movea.l    $00087504,a1
[00032e0e] 4e91                      jsr        (a1)
[00032e10] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[00032e16] 265f                      movea.l    (a7)+,a3
[00032e18] 245f                      movea.l    (a7)+,a2
[00032e1a] 4e75                      rts

edao_call:
[00032e1c] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00032e20] 594f                      subq.w     #4,a7
[00032e22] 2079 0010 ee4e            movea.l    ACSblk,a0
[00032e28] 2668 0258                 movea.l    600(a0),a3
[00032e2c] 286b 0014                 movea.l    20(a3),a4
[00032e30] 2a68 0240                 movea.l    576(a0),a5
[00032e34] 4268 0248                 clr.w      584(a0)
[00032e38] 4eb9 0004 7e2a            jsr        Adr_next
[00032e3e] 3600                      move.w     d0,d3
[00032e40] 6f60                      ble.s      edao_call_1
[00032e42] 48c0                      ext.l      d0
[00032e44] 2200                      move.l     d0,d1
[00032e46] d281                      add.l      d1,d1
[00032e48] d280                      add.l      d0,d1
[00032e4a] e789                      lsl.l      #3,d1
[00032e4c] 246d 0014                 movea.l    20(a5),a2
[00032e50] 45f2 1818                 lea.l      24(a2,d1.l),a2
[00032e54] 0c6a 271c 0016            cmpi.w     #$271C,22(a2)
[00032e5a] 6646                      bne.s      edao_call_1
[00032e5c] 2eaa 000c                 move.l     12(a2),(a7)
[00032e60] 4eb9 0005 1388            jsr        Awi_diaend
[00032e66] 2257                      movea.l    (a7),a1
[00032e68] 43e9 0016                 lea.l      22(a1),a1
[00032e6c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00032e72] 3028 0260                 move.w     608(a0),d0
[00032e76] 204c                      movea.l    a4,a0
[00032e78] 4eb9 0005 0fd8            jsr        Aob_puttext
[00032e7e] 72ff                      moveq.l    #-1,d1
[00032e80] 2079 0010 ee4e            movea.l    ACSblk,a0
[00032e86] 3028 0260                 move.w     608(a0),d0
[00032e8a] 226b 0066                 movea.l    102(a3),a1
[00032e8e] 204b                      movea.l    a3,a0
[00032e90] 4e91                      jsr        (a1)
[00032e92] 4eb9 0005 147c            jsr        Awi_diastart
[00032e98] 3003                      move.w     d3,d0
[00032e9a] 204d                      movea.l    a5,a0
[00032e9c] 4eb9 0004 7f76            jsr        Adr_del
edao_call_1:
[00032ea2] 584f                      addq.w     #4,a7
[00032ea4] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00032ea8] 4e75                      rts

edao_dragkey:
[00032eaa] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00032eae] 594f                      subq.w     #4,a7
[00032eb0] 41f9 0010 ee4e            lea.l      ACSblk,a0
[00032eb6] 2250                      movea.l    (a0),a1
[00032eb8] 2469 0258                 movea.l    600(a1),a2
[00032ebc] 266a 0014                 movea.l    20(a2),a3
[00032ec0] 2869 0240                 movea.l    576(a1),a4
[00032ec4] 4269 0248                 clr.w      584(a1)
[00032ec8] 4eb9 0004 7e2a            jsr        Adr_next
[00032ece] 3600                      move.w     d0,d3
[00032ed0] 6f4c                      ble.s      edao_dragkey_1
[00032ed2] 48c0                      ext.l      d0
[00032ed4] 2200                      move.l     d0,d1
[00032ed6] d281                      add.l      d1,d1
[00032ed8] d280                      add.l      d0,d1
[00032eda] e789                      lsl.l      #3,d1
[00032edc] 206c 0014                 movea.l    20(a4),a0
[00032ee0] 43f0 1818                 lea.l      24(a0,d1.l),a1
[00032ee4] 2e89                      move.l     a1,(a7)
[00032ee6] 0c69 2723 0016            cmpi.w     #$2723,22(a1)
[00032eec] 6630                      bne.s      edao_dragkey_1
[00032eee] 204c                      movea.l    a4,a0
[00032ef0] 3003                      move.w     d3,d0
[00032ef2] 4eb9 0004 7f76            jsr        Adr_del
[00032ef8] 2057                      movea.l    (a7),a0
[00032efa] 3f28 0012                 move.w     18(a0),-(a7)
[00032efe] 43f9 000c cd2c            lea.l      $000CCD2C,a1
[00032f04] 7014                      moveq.l    #20,d0
[00032f06] 204b                      movea.l    a3,a0
[00032f08] 4eb9 0005 0f94            jsr        Aob_printf
[00032f0e] 544f                      addq.w     #2,a7
[00032f10] 322b 01ea                 move.w     490(a3),d1
[00032f14] 7014                      moveq.l    #20,d0
[00032f16] 204a                      movea.l    a2,a0
[00032f18] 226a 0066                 movea.l    102(a2),a1
[00032f1c] 4e91                      jsr        (a1)
edao_dragkey_1:
[00032f1e] 584f                      addq.w     #4,a7
[00032f20] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00032f24] 4e75                      rts

edao_ok:
[00032f26] 48e7 003e                 movem.l    a2-a6,-(a7)
[00032f2a] 4fef ffdc                 lea.l      -36(a7),a7
[00032f2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00032f34] 2268 0258                 movea.l    600(a0),a1
[00032f38] 2a51                      movea.l    (a1),a5
[00032f3a] 2469 0014                 movea.l    20(a1),a2
[00032f3e] 2655                      movea.l    (a5),a3
[00032f40] 006b 0001 0006            ori.w      #$0001,6(a3)
[00032f46] 206d 0004                 movea.l    4(a5),a0
[00032f4a] 2868 0004                 movea.l    4(a0),a4
[00032f4e] 322d 000a                 move.w     10(a5),d1
[00032f52] 48c1                      ext.l      d1
[00032f54] 2001                      move.l     d1,d0
[00032f56] e788                      lsl.l      #3,d0
[00032f58] 9081                      sub.l      d1,d0
[00032f5a] e788                      lsl.l      #3,d0
[00032f5c] d9c0                      adda.l     d0,a4
[00032f5e] 43d7                      lea.l      (a7),a1
[00032f60] 204a                      movea.l    a2,a0
[00032f62] 7013                      moveq.l    #19,d0
[00032f64] 4eb9 0005 11da            jsr        Aob_gettext
[00032f6a] 1017                      move.b     (a7),d0
[00032f6c] 6728                      beq.s      edao_ok_1
[00032f6e] 41d7                      lea.l      (a7),a0
[00032f70] 4eb9 0008 3180            jsr        strupr
[00032f76] 41d7                      lea.l      (a7),a0
[00032f78] 4eb9 0003 325a            jsr        key_code
[00032f7e] 3940 002a                 move.w     d0,42(a4)
[00032f82] 4a40                      tst.w      d0
[00032f84] 6614                      bne.s      edao_ok_2
[00032f86] 43d7                      lea.l      (a7),a1
[00032f88] 41f9 000c c87e            lea.l      ERR_KEYCODE,a0
[00032f8e] 4eb9 0006 b80c            jsr        alert_str
[00032f94] 6004                      bra.s      edao_ok_2
edao_ok_1:
[00032f96] 426c 002a                 clr.w      42(a4)
edao_ok_2:
[00032f9a] 486c 0034                 pea.l      52(a4)
[00032f9e] 43f9 000c cd2c            lea.l      $000CCD2C,a1
[00032fa4] 7014                      moveq.l    #20,d0
[00032fa6] 204a                      movea.l    a2,a0
[00032fa8] 4eb9 0005 10fe            jsr        Aob_scanf
[00032fae] 584f                      addq.w     #4,a7
[00032fb0] 2014                      move.l     (a4),d0
[00032fb2] 670a                      beq.s      edao_ok_3
[00032fb4] 2240                      movea.l    d0,a1
[00032fb6] 204b                      movea.l    a3,a0
[00032fb8] 4eb9 0001 7f52            jsr        objfree
edao_ok_3:
[00032fbe] 43d7                      lea.l      (a7),a1
[00032fc0] 7003                      moveq.l    #3,d0
[00032fc2] 204a                      movea.l    a2,a0
[00032fc4] 4eb9 0005 11da            jsr        Aob_gettext
[00032fca] 1017                      move.b     (a7),d0
[00032fcc] 672a                      beq.s      edao_ok_4
[00032fce] 204b                      movea.l    a3,a0
[00032fd0] 7000                      moveq.l    #0,d0
[00032fd2] 4eb9 0001 7fae            jsr        objmalloc
[00032fd8] 2c48                      movea.l    a0,a6
[00032fda] 2888                      move.l     a0,(a4)
[00032fdc] 200e                      move.l     a6,d0
[00032fde] 671a                      beq.s      edao_ok_5
[00032fe0] 4879 000c cd2f            pea.l      $000CCD2F
[00032fe6] 486f 0004                 pea.l      4(a7)
[00032fea] 2248                      movea.l    a0,a1
[00032fec] 204b                      movea.l    a3,a0
[00032fee] 4eb9 0001 81c6            jsr        objname
[00032ff4] 504f                      addq.w     #8,a7
[00032ff6] 6002                      bra.s      edao_ok_5
edao_ok_4:
[00032ff8] 4294                      clr.l      (a4)
edao_ok_5:
[00032ffa] 43d7                      lea.l      (a7),a1
[00032ffc] 7012                      moveq.l    #18,d0
[00032ffe] 204a                      movea.l    a2,a0
[00033000] 4eb9 0005 11da            jsr        Aob_gettext
[00033006] 4857                      pea.l      (a7)
[00033008] 4240                      clr.w      d0
[0003300a] 43ec 0004                 lea.l      4(a4),a1
[0003300e] 204b                      movea.l    a3,a0
[00033010] 4eb9 0001 58c6            jsr        mod_ref
[00033016] 584f                      addq.w     #4,a7
[00033018] 43d7                      lea.l      (a7),a1
[0003301a] 700c                      moveq.l    #12,d0
[0003301c] 204a                      movea.l    a2,a0
[0003301e] 4eb9 0005 11da            jsr        Aob_gettext
[00033024] 4857                      pea.l      (a7)
[00033026] 7001                      moveq.l    #1,d0
[00033028] 43ec 0020                 lea.l      32(a4),a1
[0003302c] 204b                      movea.l    a3,a0
[0003302e] 4eb9 0001 58c6            jsr        mod_ref
[00033034] 584f                      addq.w     #4,a7
[00033036] 43d7                      lea.l      (a7),a1
[00033038] 700e                      moveq.l    #14,d0
[0003303a] 204a                      movea.l    a2,a0
[0003303c] 4eb9 0005 11da            jsr        Aob_gettext
[00033042] 4857                      pea.l      (a7)
[00033044] 7002                      moveq.l    #2,d0
[00033046] 43ec 0024                 lea.l      36(a4),a1
[0003304a] 204b                      movea.l    a3,a0
[0003304c] 4eb9 0001 58c6            jsr        mod_ref
[00033052] 584f                      addq.w     #4,a7
[00033054] 43d7                      lea.l      (a7),a1
[00033056] 7010                      moveq.l    #16,d0
[00033058] 204a                      movea.l    a2,a0
[0003305a] 4eb9 0005 11da            jsr        Aob_gettext
[00033060] 4857                      pea.l      (a7)
[00033062] 4240                      clr.w      d0
[00033064] 43ec 002c                 lea.l      44(a4),a1
[00033068] 204b                      movea.l    a3,a0
[0003306a] 4eb9 0001 58c6            jsr        mod_ref
[00033070] 584f                      addq.w     #4,a7
[00033072] 43d7                      lea.l      (a7),a1
[00033074] 7011                      moveq.l    #17,d0
[00033076] 204a                      movea.l    a2,a0
[00033078] 4eb9 0005 11da            jsr        Aob_gettext
[0003307e] 4857                      pea.l      (a7)
[00033080] 4240                      clr.w      d0
[00033082] 43ec 0030                 lea.l      48(a4),a1
[00033086] 204b                      movea.l    a3,a0
[00033088] 4eb9 0001 58c6            jsr        mod_ref
[0003308e] 584f                      addq.w     #4,a7
[00033090] 4eb9 0002 f27c            jsr        ed_abort
[00033096] 4fef 0024                 lea.l      36(a7),a7
[0003309a] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[0003309e] 4e75                      rts

edao_list:
[000330a0] 2f0a                      move.l     a2,-(a7)
[000330a2] 2f0b                      move.l     a3,-(a7)
[000330a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000330aa] 2468 0258                 movea.l    600(a0),a2
[000330ae] 2052                      movea.l    (a2),a0
[000330b0] 006a 0004 0054            ori.w      #$0004,84(a2)
[000330b6] 47f9 000c eefc            lea.l      list_reference,a3
[000330bc] 2690                      move.l     (a0),(a3)
[000330be] 2250                      movea.l    (a0),a1
[000330c0] 2769 003c 0004            move.l     60(a1),4(a3)
[000330c6] 204b                      movea.l    a3,a0
[000330c8] 2279 000c dc9e            movea.l    $000CDC9E,a1
[000330ce] 4e91                      jsr        (a1)
[000330d0] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[000330d6] 265f                      movea.l    (a7)+,a3
[000330d8] 245f                      movea.l    (a7)+,a2
[000330da] 4e75                      rts

set_aeo:
[000330dc] 48e7 003c                 movem.l    a2-a5,-(a7)
[000330e0] 4fef ffdc                 lea.l      -36(a7),a7
[000330e4] 2848                      movea.l    a0,a4
[000330e6] 4bf9 000c cd14            lea.l      sm,a5
[000330ec] 41ed fd30                 lea.l      -720(a5),a0
[000330f0] 4eb9 0004 f064            jsr        Aob_create
[000330f6] 2448                      movea.l    a0,a2
[000330f8] 200a                      move.l     a2,d0
[000330fa] 6606                      bne.s      set_aeo_1
[000330fc] 91c8                      suba.l     a0,a0
[000330fe] 6000 0146                 bra        set_aeo_2
set_aeo_1:
[00033102] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00033108] 7003                      moveq.l    #3,d0
[0003310a] 224a                      movea.l    a2,a1
[0003310c] 2053                      movea.l    (a3),a0
[0003310e] 2068 0258                 movea.l    600(a0),a0
[00033112] 4eb9 0003 0b9a            jsr        oe_beself
[00033118] 7012                      moveq.l    #18,d0
[0003311a] 224a                      movea.l    a2,a1
[0003311c] 2053                      movea.l    (a3),a0
[0003311e] 2068 0258                 movea.l    600(a0),a0
[00033122] 4eb9 0003 0b9a            jsr        oe_beself
[00033128] 700c                      moveq.l    #12,d0
[0003312a] 224a                      movea.l    a2,a1
[0003312c] 2053                      movea.l    (a3),a0
[0003312e] 2068 0258                 movea.l    600(a0),a0
[00033132] 4eb9 0003 0b9a            jsr        oe_beself
[00033138] 700e                      moveq.l    #14,d0
[0003313a] 224a                      movea.l    a2,a1
[0003313c] 2053                      movea.l    (a3),a0
[0003313e] 2068 0258                 movea.l    600(a0),a0
[00033142] 4eb9 0003 0b9a            jsr        oe_beself
[00033148] 7010                      moveq.l    #16,d0
[0003314a] 224a                      movea.l    a2,a1
[0003314c] 2053                      movea.l    (a3),a0
[0003314e] 2068 0258                 movea.l    600(a0),a0
[00033152] 4eb9 0003 0b9a            jsr        oe_beself
[00033158] 7011                      moveq.l    #17,d0
[0003315a] 224a                      movea.l    a2,a1
[0003315c] 2053                      movea.l    (a3),a0
[0003315e] 2068 0258                 movea.l    600(a0),a0
[00033162] 4eb9 0003 0b9a            jsr        oe_beself
[00033168] 7013                      moveq.l    #19,d0
[0003316a] 224a                      movea.l    a2,a1
[0003316c] 2053                      movea.l    (a3),a0
[0003316e] 2068 0258                 movea.l    600(a0),a0
[00033172] 4eb9 0003 0b9a            jsr        oe_beself
[00033178] 7014                      moveq.l    #20,d0
[0003317a] 224a                      movea.l    a2,a1
[0003317c] 2053                      movea.l    (a3),a0
[0003317e] 2068 0258                 movea.l    600(a0),a0
[00033182] 4eb9 0003 0b9a            jsr        oe_beself
[00033188] 43d7                      lea.l      (a7),a1
[0003318a] 2054                      movea.l    (a4),a0
[0003318c] 4eb9 0001 591a            jsr        set_ref
[00033192] 43d7                      lea.l      (a7),a1
[00033194] 7003                      moveq.l    #3,d0
[00033196] 204a                      movea.l    a2,a0
[00033198] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003319e] 43d7                      lea.l      (a7),a1
[000331a0] 206c 0004                 movea.l    4(a4),a0
[000331a4] 4eb9 0001 591a            jsr        set_ref
[000331aa] 43d7                      lea.l      (a7),a1
[000331ac] 7012                      moveq.l    #18,d0
[000331ae] 204a                      movea.l    a2,a0
[000331b0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000331b6] 43d7                      lea.l      (a7),a1
[000331b8] 206c 0020                 movea.l    32(a4),a0
[000331bc] 4eb9 0001 591a            jsr        set_ref
[000331c2] 43d7                      lea.l      (a7),a1
[000331c4] 700c                      moveq.l    #12,d0
[000331c6] 204a                      movea.l    a2,a0
[000331c8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000331ce] 43d7                      lea.l      (a7),a1
[000331d0] 206c 0024                 movea.l    36(a4),a0
[000331d4] 4eb9 0001 591a            jsr        set_ref
[000331da] 43d7                      lea.l      (a7),a1
[000331dc] 700e                      moveq.l    #14,d0
[000331de] 204a                      movea.l    a2,a0
[000331e0] 4eb9 0005 0fd8            jsr        Aob_puttext
[000331e6] 43d7                      lea.l      (a7),a1
[000331e8] 206c 002c                 movea.l    44(a4),a0
[000331ec] 4eb9 0001 591a            jsr        set_ref
[000331f2] 43d7                      lea.l      (a7),a1
[000331f4] 7010                      moveq.l    #16,d0
[000331f6] 204a                      movea.l    a2,a0
[000331f8] 4eb9 0005 0fd8            jsr        Aob_puttext
[000331fe] 43d7                      lea.l      (a7),a1
[00033200] 206c 0030                 movea.l    48(a4),a0
[00033204] 4eb9 0001 591a            jsr        set_ref
[0003320a] 43d7                      lea.l      (a7),a1
[0003320c] 7011                      moveq.l    #17,d0
[0003320e] 204a                      movea.l    a2,a0
[00033210] 4eb9 0005 0fd8            jsr        Aob_puttext
[00033216] 302c 002a                 move.w     42(a4),d0
[0003321a] 4eb9 0003 32d6            jsr        key_string
[00033220] 2248                      movea.l    a0,a1
[00033222] 7013                      moveq.l    #19,d0
[00033224] 204a                      movea.l    a2,a0
[00033226] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003322c] 3f2c 0034                 move.w     52(a4),-(a7)
[00033230] 43f9 000c cd2c            lea.l      $000CCD2C,a1
[00033236] 7014                      moveq.l    #20,d0
[00033238] 204a                      movea.l    a2,a0
[0003323a] 4eb9 0005 0f94            jsr        Aob_printf
[00033240] 544f                      addq.w     #2,a7
[00033242] 2a8a                      move.l     a2,(a5)
[00033244] 204d                      movea.l    a5,a0
set_aeo_2:
[00033246] 4fef 0024                 lea.l      36(a7),a7
[0003324a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003324e] 4e75                      rts

	.data

ERR_KEYCODE:
[000cc87e]                           dc.b '[3][ | Unbekannter oder| falscher Tastencode | '%s'][ OK ]',0
TEXT_001:
[000cc8b9]                           dc.b 'Abbruch',0
TEXT_003:
[000cc8c1]                           dc.b $4f
[000cc8c2]                           dc.w $4b00
TEXT_01:
[000cc8c4]                           dc.b 'Index:',0
TEXT_02:
[000cc8cb]                           dc.b 'Click:',0
TEXT_03:
[000cc8d2]                           dc.b 'Drag:',0
TEXT_04:
[000cc8d8]                           dc.b 'UserP1:',0
TEXT_05:
[000cc8e0]                           dc.b 'UserP2:',0
TEXT_06:
[000cc8e8]                           dc.b ' Typ:',0
TEXT_08:
[000cc8ee]                           dc.b 'Key:',0
TEXT_09:
[000cc8f3]                           dc.b $00
TEXT_136:
[000cc8f4]                           dc.b ' Mausindex:',0
help_title:
[000cc900]                           dc.b 'Der AOBJECT-Editor',0
title:
[000cc913]                           dc.b ' ERWEITERTE WERTE -',0
[000cc927]                           dc.b $00
[000cc928] 000cc8ee                  dc.l TEXT_08
[000cc92c] 000cc8f3                  dc.l TEXT_09
[000cc930] 000cc8f3                  dc.l TEXT_09
[000cc934]                           dc.w $0003
[000cc936]                           dc.w $0006
[000cc938]                           dc.w $0001
[000cc93a]                           dc.w $1100
[000cc93c]                           dc.w $0000
[000cc93e]                           dc.w $0000
[000cc940]                           dc.w $0005
[000cc942]                           dc.w $0001
A_3DBUTTON01:
[000cc944] 00064a22                  dc.l A_3Dbutton
[000cc948]                           dc.w $29c1
[000cc94a]                           dc.w $0178
[000cc94c] 000630f2                  dc.l Auo_string
[000cc950] 000cc8c1                  dc.l TEXT_003
[000cc954]                           dc.w $0000
[000cc956]                           dc.w $0000
[000cc958]                           dc.w $0000
[000cc95a]                           dc.w $0000
[000cc95c]                           dc.w $0000
[000cc95e]                           dc.w $0000
[000cc960]                           dc.w $0000
[000cc962]                           dc.w $0000
A_3DBUTTON02:
[000cc964] 00064a22                  dc.l A_3Dbutton
[000cc968]                           dc.w $21f1
[000cc96a]                           dc.w $0178
[000cc96c] 000630f2                  dc.l Auo_string
[000cc970]                           dc.w $0000
[000cc972]                           dc.w $0000
[000cc974]                           dc.w $0000
[000cc976]                           dc.w $0000
[000cc978]                           dc.w $0000
[000cc97a]                           dc.w $0000
[000cc97c]                           dc.w $0000
[000cc97e]                           dc.w $0000
[000cc980]                           dc.w $0000
[000cc982]                           dc.w $0000
A_3DBUTTON03:
[000cc984] 00064a22                  dc.l A_3Dbutton
[000cc988]                           dc.w $2011
[000cc98a]                           dc.w $9178
[000cc98c] 000630f2                  dc.l Auo_string
[000cc990]                           dc.w $0000
[000cc992]                           dc.w $0000
[000cc994]                           dc.w $0000
[000cc996]                           dc.w $0000
[000cc998]                           dc.w $0000
[000cc99a]                           dc.w $0000
[000cc99c]                           dc.w $0000
[000cc99e]                           dc.w $0000
[000cc9a0]                           dc.w $0000
[000cc9a2]                           dc.w $0000
A_3DBUTTON04:
[000cc9a4] 00064a22                  dc.l A_3Dbutton
[000cc9a8]                           dc.w $29c1
[000cc9aa]                           dc.w $0178
[000cc9ac] 000630f2                  dc.l Auo_string
[000cc9b0] 000cc8b9                  dc.l TEXT_001
[000cc9b4]                           dc.w $0000
[000cc9b6]                           dc.w $0000
[000cc9b8]                           dc.w $0000
[000cc9ba]                           dc.w $0000
[000cc9bc]                           dc.w $0000
[000cc9be]                           dc.w $0000
[000cc9c0]                           dc.w $0000
[000cc9c2]                           dc.w $0000
A_BOXED01:
[000cc9c4] 0006afea                  dc.l A_boxed
[000cc9c8]                           dc.w $9000
[000cc9ca]                           dc.w $2012
[000cc9cc] 0006a068                  dc.l Auo_boxed
[000cc9d0]                           dc.w $0000
[000cc9d2]                           dc.w $0000
[000cc9d4]                           dc.w $0000
[000cc9d6]                           dc.w $0000
[000cc9d8]                           dc.w $0000
[000cc9da]                           dc.w $0000
[000cc9dc]                           dc.w $0000
[000cc9de]                           dc.w $0000
[000cc9e0]                           dc.w $0000
[000cc9e2]                           dc.w $0000
A_BOXED02:
[000cc9e4] 0006afea                  dc.l A_boxed
[000cc9e8]                           dc.w $9070
[000cc9ea]                           dc.w $0212
[000cc9ec] 0006a068                  dc.l Auo_boxed
[000cc9f0]                           dc.w $0000
[000cc9f2]                           dc.w $0000
[000cc9f4]                           dc.w $0000
[000cc9f6]                           dc.w $0000
[000cc9f8]                           dc.w $0000
[000cc9fa]                           dc.w $0000
[000cc9fc]                           dc.w $0000
[000cc9fe]                           dc.w $0000
[000cca00]                           dc.w $0000
[000cca02]                           dc.w $0000
A_BOXED03:
[000cca04] 0006afea                  dc.l A_boxed
[000cca08]                           dc.w $9038
[000cca0a]                           dc.w $2012
[000cca0c] 0006a068                  dc.l Auo_boxed
[000cca10]                           dc.w $0000
[000cca12]                           dc.w $0000
[000cca14]                           dc.w $0000
[000cca16]                           dc.w $0000
[000cca18]                           dc.w $0000
[000cca1a]                           dc.w $0000
[000cca1c]                           dc.w $0000
[000cca1e]                           dc.w $0000
[000cca20]                           dc.w $0000
[000cca22]                           dc.w $0000
A_INNERFRAME01:
[000cca24] 00064256                  dc.l A_innerframe
[000cca28]                           dc.w $1000
[000cca2a]                           dc.w $8f19
[000cca2c] 000630f2                  dc.l Auo_string
[000cca30]                           dc.w $0000
[000cca32]                           dc.w $0000
[000cca34]                           dc.w $0000
[000cca36]                           dc.w $0000
[000cca38]                           dc.w $0000
[000cca3a]                           dc.w $0000
[000cca3c]                           dc.w $0000
[000cca3e]                           dc.w $0000
[000cca40]                           dc.w $0000
[000cca42]                           dc.w $0000
ED_AEO:
[000cca44]                           dc.w $ffff
[000cca46]                           dc.w $0001
[000cca48]                           dc.w $001c
[000cca4a]                           dc.w $0018
[000cca4c]                           dc.w $0040
[000cca4e]                           dc.w $0010
[000cca50] 000cc964                  dc.l A_3DBUTTON02
[000cca54]                           dc.w $0000
[000cca56]                           dc.w $0000
[000cca58]                           dc.w $002c
[000cca5a]                           dc.w $000f
_01_ED_AEO:
[000cca5c]                           dc.w $0004
[000cca5e]                           dc.w $0002
[000cca60]                           dc.w $0003
[000cca62]                           dc.w $0018
[000cca64]                           dc.w $0040
[000cca66]                           dc.w $0000
[000cca68] 000cca24                  dc.l A_INNERFRAME01
[000cca6c]                           dc.w $0001
[000cca6e]                           dc.w $0000
[000cca70]                           dc.w $002a
[000cca72]                           dc.w $0003
_02_ED_AEO:
[000cca74]                           dc.w $0003
[000cca76]                           dc.w $ffff
[000cca78]                           dc.w $ffff
[000cca7a]                           dc.w $001c
[000cca7c]                           dc.w $0000
[000cca7e]                           dc.w $0000
[000cca80] 000cc8c4                  dc.l TEXT_01
[000cca84]                           dc.w $0002
[000cca86]                           dc.w $0001
[000cca88]                           dc.w $0006
[000cca8a]                           dc.w $0001
_03_ED_AEO:
[000cca8c]                           dc.w $0001
[000cca8e]                           dc.w $ffff
[000cca90]                           dc.w $ffff
[000cca92]                           dc.w $0018
[000cca94]                           dc.w $0008
[000cca96]                           dc.w $0010
[000cca98] 000cca04                  dc.l A_BOXED03
[000cca9c]                           dc.w $0009
[000cca9e]                           dc.w $0001
[000ccaa0]                           dc.w $0020
[000ccaa2]                           dc.w $0001
_04_ED_AEO:
[000ccaa4]                           dc.w $001a
[000ccaa6]                           dc.w $0005
[000ccaa8]                           dc.w $0018
[000ccaaa]                           dc.w $0018
[000ccaac]                           dc.w $0040
[000ccaae]                           dc.w $0000
[000ccab0] 000cca24                  dc.l A_INNERFRAME01
[000ccab4]                           dc.w $0001
[000ccab6]                           dc.w $0003
[000ccab8]                           dc.w $002a
[000ccaba]                           dc.w $0009
_05_ED_AEO:
[000ccabc]                           dc.w $0006
[000ccabe]                           dc.w $ffff
[000ccac0]                           dc.w $ffff
[000ccac2]                           dc.w $001c
[000ccac4]                           dc.w $0000
[000ccac6]                           dc.w $0000
[000ccac8] 000cc8d8                  dc.l TEXT_04
[000ccacc]                           dc.w $0001
[000ccace]                           dc.w $0003
[000ccad0]                           dc.w $0007
[000ccad2]                           dc.w $0001
_06_ED_AEO:
[000ccad4]                           dc.w $0007
[000ccad6]                           dc.w $ffff
[000ccad8]                           dc.w $ffff
[000ccada]                           dc.w $001c
[000ccadc]                           dc.w $0000
[000ccade]                           dc.w $0000
[000ccae0] 000cc8e0                  dc.l TEXT_05
[000ccae4]                           dc.w $0001
[000ccae6]                           dc.w $0004
[000ccae8]                           dc.w $0007
[000ccaea]                           dc.w $0001
_07_ED_AEO:
[000ccaec]                           dc.w $0009
[000ccaee]                           dc.w $ffff
[000ccaf0]                           dc.w $ffff
[000ccaf2]                           dc.w $001c
[000ccaf4]                           dc.w $0005
[000ccaf6]                           dc.w $0000
[000ccaf8] 000cc8cb                  dc.l TEXT_02
[000ccafc]                           dc.w $0002
[000ccafe]                           dc.w $0001
[000ccb00]                           dc.w $0006
[000ccb02]                           dc.w $0001
_07aED_AEO:
[000ccb04] 000330a0                  dc.l edao_list
[000ccb08]                           dc.w $0000
[000ccb0a]                           dc.w $0000
[000ccb0c]                           dc.w $8000
[000ccb0e]                           dc.w $0000
[000ccb10]                           dc.w $0000
[000ccb12]                           dc.w $0000
[000ccb14]                           dc.w $0000
[000ccb16]                           dc.w $0000
[000ccb18]                           dc.w $0000
[000ccb1a]                           dc.w $0000
_09_ED_AEO:
[000ccb1c]                           dc.w $000b
[000ccb1e]                           dc.w $ffff
[000ccb20]                           dc.w $ffff
[000ccb22]                           dc.w $001c
[000ccb24]                           dc.w $0005
[000ccb26]                           dc.w $0000
[000ccb28] 000cc8d2                  dc.l TEXT_03
[000ccb2c]                           dc.w $0003
[000ccb2e]                           dc.w $0002
[000ccb30]                           dc.w $0005
[000ccb32]                           dc.w $0001
_09aED_AEO:
[000ccb34] 000330a0                  dc.l edao_list
[000ccb38]                           dc.w $0000
[000ccb3a]                           dc.w $0000
[000ccb3c]                           dc.w $8000
[000ccb3e]                           dc.w $0000
[000ccb40]                           dc.w $0000
[000ccb42]                           dc.w $0000
[000ccb44]                           dc.w $0000
[000ccb46]                           dc.w $0000
[000ccb48]                           dc.w $0000
[000ccb4a]                           dc.w $0000
_11_ED_AEO:
[000ccb4c]                           dc.w $0013
[000ccb4e]                           dc.w $000c
[000ccb50]                           dc.w $0012
[000ccb52]                           dc.w $0018
[000ccb54]                           dc.w $0040
[000ccb56]                           dc.w $0000
[000ccb58] 000cc984                  dc.l A_3DBUTTON03
[000ccb5c]                           dc.w $0009
[000ccb5e]                           dc.w $0001
[000ccb60]                           dc.w $0020
[000ccb62]                           dc.w $0005
_12_ED_AEO:
[000ccb64]                           dc.w $000e
[000ccb66]                           dc.w $ffff
[000ccb68]                           dc.w $ffff
[000ccb6a]                           dc.w $0018
[000ccb6c]                           dc.w $1008
[000ccb6e]                           dc.w $0000
[000ccb70] 000cca04                  dc.l A_BOXED03
[000ccb74]                           dc.w $0000
[000ccb76]                           dc.w $0000
[000ccb78]                           dc.w $0020
[000ccb7a]                           dc.w $0001
_12aED_AEO:
[000ccb7c]                           dc.w $0000
[000ccb7e]                           dc.w $0000
[000ccb80] 00032e1c                  dc.l edao_call
[000ccb84]                           dc.w $8000
[000ccb86]                           dc.w $0000
[000ccb88]                           dc.w $0000
[000ccb8a]                           dc.w $0000
[000ccb8c]                           dc.w $0000
[000ccb8e]                           dc.w $0000
[000ccb90]                           dc.w $0000
[000ccb92]                           dc.w $0000
_14_ED_AEO:
[000ccb94]                           dc.w $0010
[000ccb96]                           dc.w $ffff
[000ccb98]                           dc.w $ffff
[000ccb9a]                           dc.w $0018
[000ccb9c]                           dc.w $1008
[000ccb9e]                           dc.w $0000
[000ccba0] 000cca04                  dc.l A_BOXED03
[000ccba4]                           dc.w $0000
[000ccba6]                           dc.w $0001
[000ccba8]                           dc.w $0020
[000ccbaa]                           dc.w $0001
_14aED_AEO:
[000ccbac]                           dc.w $0000
[000ccbae]                           dc.w $0000
[000ccbb0] 00032e1c                  dc.l edao_call
[000ccbb4]                           dc.w $8000
[000ccbb6]                           dc.w $0000
[000ccbb8]                           dc.w $0000
[000ccbba]                           dc.w $0000
[000ccbbc]                           dc.w $0000
[000ccbbe]                           dc.w $0000
[000ccbc0]                           dc.w $0000
[000ccbc2]                           dc.w $0000
_16_ED_AEO:
[000ccbc4]                           dc.w $0011
[000ccbc6]                           dc.w $ffff
[000ccbc8]                           dc.w $ffff
[000ccbca]                           dc.w $0018
[000ccbcc]                           dc.w $0008
[000ccbce]                           dc.w $0000
[000ccbd0] 000cca04                  dc.l A_BOXED03
[000ccbd4]                           dc.w $0000
[000ccbd6]                           dc.w $0002
[000ccbd8]                           dc.w $0020
[000ccbda]                           dc.w $0001
_17_ED_AEO:
[000ccbdc]                           dc.w $0012
[000ccbde]                           dc.w $ffff
[000ccbe0]                           dc.w $ffff
[000ccbe2]                           dc.w $0018
[000ccbe4]                           dc.w $0008
[000ccbe6]                           dc.w $0000
[000ccbe8] 000cca04                  dc.l A_BOXED03
[000ccbec]                           dc.w $0000
[000ccbee]                           dc.w $0003
[000ccbf0]                           dc.w $0020
[000ccbf2]                           dc.w $0001
_18_ED_AEO:
[000ccbf4]                           dc.w $000b
[000ccbf6]                           dc.w $ffff
[000ccbf8]                           dc.w $ffff
[000ccbfa]                           dc.w $0018
[000ccbfc]                           dc.w $0008
[000ccbfe]                           dc.w $0000
[000ccc00] 000cca04                  dc.l A_BOXED03
[000ccc04]                           dc.w $0000
[000ccc06]                           dc.w $0004
[000ccc08]                           dc.w $0020
[000ccc0a]                           dc.w $0001
_19_ED_AEO:
[000ccc0c]                           dc.w $0014
[000ccc0e]                           dc.w $ffff
[000ccc10]                           dc.w $ffff
[000ccc12]                           dc.w $0018
[000ccc14]                           dc.w $0008
[000ccc16]                           dc.w $0010
[000ccc18] 000cc9c4                  dc.l A_BOXED01
[000ccc1c]                           dc.w $0009
[000ccc1e]                           dc.w $0007
[000ccc20]                           dc.w $000a
[000ccc22]                           dc.w $0001
_20_ED_AEO:
[000ccc24]                           dc.w $0016
[000ccc26]                           dc.w $ffff
[000ccc28]                           dc.w $ffff
[000ccc2a]                           dc.w $0018
[000ccc2c]                           dc.w $1008
[000ccc2e]                           dc.w $0010
[000ccc30] 000cc9e4                  dc.l A_BOXED02
[000ccc34]                           dc.w $0025
[000ccc36]                           dc.w $0007
[000ccc38]                           dc.w $0002
[000ccc3a]                           dc.w $0001
_20aED_AEO:
[000ccc3c]                           dc.w $0000
[000ccc3e]                           dc.w $0000
[000ccc40] 00032eaa                  dc.l edao_dragkey
[000ccc44]                           dc.w $8000
[000ccc46]                           dc.w $0000
[000ccc48]                           dc.w $0000
[000ccc4a]                           dc.w $0000
[000ccc4c]                           dc.w $0000
[000ccc4e]                           dc.w $0000
[000ccc50]                           dc.w $0000
[000ccc52]                           dc.w $0000
_22_ED_AEO:
[000ccc54]                           dc.w $0017
[000ccc56]                           dc.w $ffff
[000ccc58]                           dc.w $ffff
[000ccc5a]                           dc.w $0015
[000ccc5c]                           dc.w $0000
[000ccc5e]                           dc.w $0000
[000ccc60] 000cc928                  dc.l TEDINFO_01
[000ccc64]                           dc.w $0002
[000ccc66]                           dc.w $0007
[000ccc68]                           dc.w $0006
[000ccc6a]                           dc.w $0001
_23_ED_AEO:
[000ccc6c]                           dc.w $0018
[000ccc6e]                           dc.w $ffff
[000ccc70]                           dc.w $ffff
[000ccc72]                           dc.w $001c
[000ccc74]                           dc.w $0000
[000ccc76]                           dc.w $0000
[000ccc78] 000cc8e8                  dc.l TEXT_06
[000ccc7c]                           dc.w $0003
[000ccc7e]                           dc.w $0005
[000ccc80]                           dc.w $0005
[000ccc82]                           dc.w $0001
_24_ED_AEO:
[000ccc84]                           dc.w $0004
[000ccc86]                           dc.w $ffff
[000ccc88]                           dc.w $ffff
[000ccc8a]                           dc.w $001c
[000ccc8c]                           dc.w $0005
[000ccc8e]                           dc.w $0000
[000ccc90] 000cc8f4                  dc.l TEXT_136
[000ccc94]                           dc.w $0019
[000ccc96]                           dc.w $0007
[000ccc98]                           dc.w $000b
[000ccc9a]                           dc.w $0001
_24aED_AEO:
[000ccc9c] 00032df0                  dc.l edao_pal
[000ccca0]                           dc.w $0000
[000ccca2]                           dc.w $0000
[000ccca4]                           dc.w $8000
[000ccca6]                           dc.w $0000
[000ccca8]                           dc.w $0000
[000cccaa]                           dc.w $0000
[000cccac]                           dc.w $0000
[000cccae]                           dc.w $0000
[000cccb0]                           dc.w $0000
[000cccb2]                           dc.w $0000
_26_ED_AEO:
[000cccb4]                           dc.w $001c
[000cccb6]                           dc.w $ffff
[000cccb8]                           dc.w $ffff
[000cccba]                           dc.w $0018
[000cccbc]                           dc.w $4007
[000cccbe]                           dc.w $0010
[000cccc0] 000cc944                  dc.l A_3DBUTTON01
[000cccc4]                           dc.w $0009
[000cccc6]                           dc.w $000c
[000cccc8]                           dc.w $000c
[000cccca]                           dc.w $0002
_26aED_AEO:
[000ccccc] 00032f26                  dc.l edao_ok
[000cccd0]                           dc.w $0000
[000cccd2]                           dc.w $0000
[000cccd4]                           dc.w $8000
[000cccd6]                           dc.w $884f
[000cccd8]                           dc.w $0000
[000cccda]                           dc.w $0000
[000cccdc]                           dc.w $0000
[000cccde]                           dc.w $0000
[000ccce0]                           dc.w $0000
[000ccce2]                           dc.w $0000
_28_ED_AEO:
[000ccce4]                           dc.w $0000
[000ccce6]                           dc.w $ffff
[000ccce8]                           dc.w $ffff
[000cccea]                           dc.w $0018
[000cccec]                           dc.w $4005
[000cccee]                           dc.w $0010
[000cccf0] 000cc9a4                  dc.l A_3DBUTTON04
[000cccf4]                           dc.w $0017
[000cccf6]                           dc.w $000c
[000cccf8]                           dc.w $000c
[000cccfa]                           dc.w $0002
_28aED_AEO:
[000cccfc] 0002f27c                  dc.l ed_abort
[000ccd00]                           dc.w $0000
[000ccd02]                           dc.w $0000
[000ccd04]                           dc.w $8020
[000ccd06]                           dc.w $8841
[000ccd08]                           dc.w $0000
[000ccd0a]                           dc.w $0000
[000ccd0c]                           dc.w $0000
[000ccd0e]                           dc.w $0000
[000ccd10]                           dc.w $0000
[000ccd12]                           dc.w $0000
sm:
[000ccd14]                           dc.w $0000
[000ccd16]                           dc.w $0000
[000ccd18] 00032f26                  dc.l edao_ok
[000ccd1c] 0004f20a                  dc.l Aob_delete
[000ccd20] 000cc913                  dc.l title
[000ccd24] 000cc900                  dc.l help_title
[000ccd28]                           dc.w $0000
[000ccd2a]                           dc.w $0000
[000ccd2c]                           dc.b '%d',0
[000ccd2f]                           dc.b 'INDEX NAME',0
