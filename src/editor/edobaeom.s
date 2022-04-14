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
[00032e40] 6f60                      ble.s      $00032EA2
[00032e42] 48c0                      ext.l      d0
[00032e44] 2200                      move.l     d0,d1
[00032e46] d281                      add.l      d1,d1
[00032e48] d280                      add.l      d0,d1
[00032e4a] e789                      lsl.l      #3,d1
[00032e4c] 246d 0014                 movea.l    20(a5),a2
[00032e50] 45f2 1818                 lea.l      24(a2,d1.l),a2
[00032e54] 0c6a 271c 0016            cmpi.w     #$271C,22(a2)
[00032e5a] 6646                      bne.s      $00032EA2
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
[00032ed0] 6f4c                      ble.s      $00032F1E
[00032ed2] 48c0                      ext.l      d0
[00032ed4] 2200                      move.l     d0,d1
[00032ed6] d281                      add.l      d1,d1
[00032ed8] d280                      add.l      d0,d1
[00032eda] e789                      lsl.l      #3,d1
[00032edc] 206c 0014                 movea.l    20(a4),a0
[00032ee0] 43f0 1818                 lea.l      24(a0,d1.l),a1
[00032ee4] 2e89                      move.l     a1,(a7)
[00032ee6] 0c69 2723 0016            cmpi.w     #$2723,22(a1)
[00032eec] 6630                      bne.s      $00032F1E
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
[00032f6c] 6728                      beq.s      $00032F96
[00032f6e] 41d7                      lea.l      (a7),a0
[00032f70] 4eb9 0008 3180            jsr        strupr
[00032f76] 41d7                      lea.l      (a7),a0
[00032f78] 4eb9 0003 325a            jsr        key_code
[00032f7e] 3940 002a                 move.w     d0,42(a4)
[00032f82] 4a40                      tst.w      d0
[00032f84] 6614                      bne.s      $00032F9A
[00032f86] 43d7                      lea.l      (a7),a1
[00032f88] 41f9 000c c87e            lea.l      ERR_KEYCODE,a0
[00032f8e] 4eb9 0006 b80c            jsr        alert_str
[00032f94] 6004                      bra.s      $00032F9A
[00032f96] 426c 002a                 clr.w      42(a4)
[00032f9a] 486c 0034                 pea.l      52(a4)
[00032f9e] 43f9 000c cd2c            lea.l      $000CCD2C,a1
[00032fa4] 7014                      moveq.l    #20,d0
[00032fa6] 204a                      movea.l    a2,a0
[00032fa8] 4eb9 0005 10fe            jsr        Aob_scanf
[00032fae] 584f                      addq.w     #4,a7
[00032fb0] 2014                      move.l     (a4),d0
[00032fb2] 670a                      beq.s      $00032FBE
[00032fb4] 2240                      movea.l    d0,a1
[00032fb6] 204b                      movea.l    a3,a0
[00032fb8] 4eb9 0001 7f52            jsr        objfree
[00032fbe] 43d7                      lea.l      (a7),a1
[00032fc0] 7003                      moveq.l    #3,d0
[00032fc2] 204a                      movea.l    a2,a0
[00032fc4] 4eb9 0005 11da            jsr        Aob_gettext
[00032fca] 1017                      move.b     (a7),d0
[00032fcc] 672a                      beq.s      $00032FF8
[00032fce] 204b                      movea.l    a3,a0
[00032fd0] 7000                      moveq.l    #0,d0
[00032fd2] 4eb9 0001 7fae            jsr        objmalloc
[00032fd8] 2c48                      movea.l    a0,a6
[00032fda] 2888                      move.l     a0,(a4)
[00032fdc] 200e                      move.l     a6,d0
[00032fde] 671a                      beq.s      $00032FFA
[00032fe0] 4879 000c cd2f            pea.l      $000CCD2F
[00032fe6] 486f 0004                 pea.l      4(a7)
[00032fea] 2248                      movea.l    a0,a1
[00032fec] 204b                      movea.l    a3,a0
[00032fee] 4eb9 0001 81c6            jsr        objname
[00032ff4] 504f                      addq.w     #8,a7
[00032ff6] 6002                      bra.s      $00032FFA
[00032ff8] 4294                      clr.l      (a4)
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
[000330fa] 6606                      bne.s      $00033102
[000330fc] 91c8                      suba.l     a0,a0
[000330fe] 6000 0146                 bra        $00033246
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
[00033246] 4fef 0024                 lea.l      36(a7),a7
[0003324a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003324e] 4e75                      rts
