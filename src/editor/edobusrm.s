edus_ok:
[00030cd4] 48e7 003e                 movem.l    a2-a6,-(a7)
[00030cd8] 4fef ffdc                 lea.l      -36(a7),a7
[00030cdc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00030ce2] 2268 0258                 movea.l    600(a0),a1
[00030ce6] 2451                      movea.l    (a1),a2
[00030ce8] 2669 0014                 movea.l    20(a1),a3
[00030cec] 206a 0004                 movea.l    4(a2),a0
[00030cf0] 2868 0004                 movea.l    4(a0),a4
[00030cf4] 322a 000a                 move.w     10(a2),d1
[00030cf8] 48c1                      ext.l      d1
[00030cfa] 2001                      move.l     d1,d0
[00030cfc] e788                      lsl.l      #3,d0
[00030cfe] 9081                      sub.l      d1,d0
[00030d00] e788                      lsl.l      #3,d0
[00030d02] d9c0                      adda.l     d0,a4
[00030d04] 2eac 0014                 move.l     20(a4),(a7)
[00030d08] 4def 0004                 lea.l      4(a7),a6
[00030d0c] 224e                      movea.l    a6,a1
[00030d0e] 7003                      moveq.l    #3,d0
[00030d10] 41eb 0168                 lea.l      360(a3),a0
[00030d14] 4eb9 0006 a068            jsr        Auo_boxed
[00030d1a] 43ee 0004                 lea.l      4(a6),a1
[00030d1e] 7003                      moveq.l    #3,d0
[00030d20] 41eb 0198                 lea.l      408(a3),a0
[00030d24] 4eb9 0006 a068            jsr        Auo_boxed
[00030d2a] 2056                      movea.l    (a6),a0
[00030d2c] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00030d32] 4a40                      tst.w      d0
[00030d34] 660e                      bne.s      $00030D44
[00030d36] 206e 0004                 movea.l    4(a6),a0
[00030d3a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00030d40] 4a40                      tst.w      d0
[00030d42] 6712                      beq.s      $00030D56
[00030d44] 41f9 000c 91d8            lea.l      ERR_MUST,a0
[00030d4a] 7001                      moveq.l    #1,d0
[00030d4c] 4eb9 0005 a600            jsr        Awi_alert
[00030d52] 6000 0082                 bra        $00030DD6
[00030d56] 43ee 0008                 lea.l      8(a6),a1
[00030d5a] 7003                      moveq.l    #3,d0
[00030d5c] 41eb 01c8                 lea.l      456(a3),a0
[00030d60] 4eb9 0006 a068            jsr        Auo_boxed
[00030d66] 43ee 000c                 lea.l      12(a6),a1
[00030d6a] 7003                      moveq.l    #3,d0
[00030d6c] 41eb 01f8                 lea.l      504(a3),a0
[00030d70] 4eb9 0006 a068            jsr        Auo_boxed
[00030d76] 43ee 0010                 lea.l      16(a6),a1
[00030d7a] 7003                      moveq.l    #3,d0
[00030d7c] 41eb 0228                 lea.l      552(a3),a0
[00030d80] 4eb9 0006 a068            jsr        Auo_boxed
[00030d86] 43ee 0014                 lea.l      20(a6),a1
[00030d8a] 7003                      moveq.l    #3,d0
[00030d8c] 41eb 0258                 lea.l      600(a3),a0
[00030d90] 4eb9 0006 a068            jsr        Auo_boxed
[00030d96] 43ee 0018                 lea.l      24(a6),a1
[00030d9a] 7003                      moveq.l    #3,d0
[00030d9c] 41eb 0288                 lea.l      648(a3),a0
[00030da0] 4eb9 0006 a068            jsr        Auo_boxed
[00030da6] 43ee 001c                 lea.l      28(a6),a1
[00030daa] 7003                      moveq.l    #3,d0
[00030dac] 41eb 02a0                 lea.l      672(a3),a0
[00030db0] 4eb9 0006 a068            jsr        Auo_boxed
[00030db6] 4856                      pea.l      (a6)
[00030db8] 226f 0004                 movea.l    4(a7),a1
[00030dbc] 2052                      movea.l    (a2),a0
[00030dbe] 4eb9 0003 52de            jsr        change_user
[00030dc4] 584f                      addq.w     #4,a7
[00030dc6] 2a48                      movea.l    a0,a5
[00030dc8] 200d                      move.l     a5,d0
[00030dca] 6704                      beq.s      $00030DD0
[00030dcc] 2940 0014                 move.l     d0,20(a4)
[00030dd0] 4eb9 0002 f27c            jsr        ed_abort
[00030dd6] 4fef 0024                 lea.l      36(a7),a7
[00030dda] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[00030dde] 4e75                      rts
edus_list:
[00030de0] 2f0a                      move.l     a2,-(a7)
[00030de2] 2f0b                      move.l     a3,-(a7)
[00030de4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00030dea] 2468 0258                 movea.l    600(a0),a2
[00030dee] 2052                      movea.l    (a2),a0
[00030df0] 006a 0004 0054            ori.w      #$0004,84(a2)
[00030df6] 47f9 000c eefc            lea.l      list_reference,a3
[00030dfc] 2690                      move.l     (a0),(a3)
[00030dfe] 2250                      movea.l    (a0),a1
[00030e00] 2769 003c 0004            move.l     60(a1),4(a3)
[00030e06] 204b                      movea.l    a3,a0
[00030e08] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00030e0e] 4e91                      jsr        (a1)
[00030e10] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[00030e16] 265f                      movea.l    (a7)+,a3
[00030e18] 245f                      movea.l    (a7)+,a2
[00030e1a] 4e75                      rts
accept:
[00030e1c] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00030e20] 594f                      subq.w     #4,a7
[00030e22] 3800                      move.w     d0,d4
[00030e24] 2079 0010 ee4e            movea.l    ACSblk,a0
[00030e2a] 2668 0258                 movea.l    600(a0),a3
[00030e2e] 286b 0014                 movea.l    20(a3),a4
[00030e32] 2a68 0240                 movea.l    576(a0),a5
[00030e36] 4268 0248                 clr.w      584(a0)
[00030e3a] 4eb9 0004 7e2a            jsr        Adr_next
[00030e40] 3600                      move.w     d0,d3
[00030e42] 6f74                      ble.s      $00030EB8
[00030e44] 48c0                      ext.l      d0
[00030e46] 2200                      move.l     d0,d1
[00030e48] d281                      add.l      d1,d1
[00030e4a] d280                      add.l      d0,d1
[00030e4c] e789                      lsl.l      #3,d1
[00030e4e] 246d 0014                 movea.l    20(a5),a2
[00030e52] 45f2 1818                 lea.l      24(a2,d1.l),a2
[00030e56] 0c6a 271c 0016            cmpi.w     #$271C,22(a2)
[00030e5c] 6714                      beq.s      $00030E72
[00030e5e] 4a44                      tst.w      d4
[00030e60] 6756                      beq.s      $00030EB8
[00030e62] 0c6a 2724 0016            cmpi.w     #$2724,22(a2)
[00030e68] 6708                      beq.s      $00030E72
[00030e6a] 0c6a 271a 0016            cmpi.w     #$271A,22(a2)
[00030e70] 6646                      bne.s      $00030EB8
[00030e72] 2eaa 000c                 move.l     12(a2),(a7)
[00030e76] 4eb9 0005 1388            jsr        Awi_diaend
[00030e7c] 2257                      movea.l    (a7),a1
[00030e7e] 43e9 0016                 lea.l      22(a1),a1
[00030e82] 2079 0010 ee4e            movea.l    ACSblk,a0
[00030e88] 3028 0260                 move.w     608(a0),d0
[00030e8c] 204c                      movea.l    a4,a0
[00030e8e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00030e94] 72ff                      moveq.l    #-1,d1
[00030e96] 2079 0010 ee4e            movea.l    ACSblk,a0
[00030e9c] 3028 0260                 move.w     608(a0),d0
[00030ea0] 226b 0066                 movea.l    102(a3),a1
[00030ea4] 204b                      movea.l    a3,a0
[00030ea6] 4e91                      jsr        (a1)
[00030ea8] 4eb9 0005 147c            jsr        Awi_diastart
[00030eae] 3003                      move.w     d3,d0
[00030eb0] 204d                      movea.l    a5,a0
[00030eb2] 4eb9 0004 7f76            jsr        Adr_del
[00030eb8] 584f                      addq.w     #4,a7
[00030eba] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00030ebe] 4e75                      rts
edus_ref:
[00030ec0] 4240                      clr.w      d0
[00030ec2] 6100 ff58                 bsr        accept
[00030ec6] 4e75                      rts
edus_ptr:
[00030ec8] 7001                      moveq.l    #1,d0
[00030eca] 6100 ff50                 bsr        accept
[00030ece] 4e75                      rts
set_user:
[00030ed0] 48e7 003c                 movem.l    a2-a5,-(a7)
[00030ed4] 4fef fefe                 lea.l      -258(a7),a7
[00030ed8] 2848                      movea.l    a0,a4
[00030eda] 4bf9 000c 96ac            lea.l      sm,a5
[00030ee0] 41ed fcb8                 lea.l      -840(a5),a0
[00030ee4] 4eb9 0004 f064            jsr        Aob_create
[00030eea] 2448                      movea.l    a0,a2
[00030eec] 200a                      move.l     a2,d0
[00030eee] 6606                      bne.s      $00030EF6
[00030ef0] 91c8                      suba.l     a0,a0
[00030ef2] 6000 0162                 bra        $00031056
[00030ef6] 286c 0014                 movea.l    20(a4),a4
[00030efa] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00030f00] 700f                      moveq.l    #15,d0
[00030f02] 224a                      movea.l    a2,a1
[00030f04] 2053                      movea.l    (a3),a0
[00030f06] 2068 0258                 movea.l    600(a0),a0
[00030f0a] 4eb9 0003 0b9a            jsr        oe_beself
[00030f10] 7011                      moveq.l    #17,d0
[00030f12] 224a                      movea.l    a2,a1
[00030f14] 2053                      movea.l    (a3),a0
[00030f16] 2068 0258                 movea.l    600(a0),a0
[00030f1a] 4eb9 0003 0b9a            jsr        oe_beself
[00030f20] 7013                      moveq.l    #19,d0
[00030f22] 224a                      movea.l    a2,a1
[00030f24] 2053                      movea.l    (a3),a0
[00030f26] 2068 0258                 movea.l    600(a0),a0
[00030f2a] 4eb9 0003 0b9a            jsr        oe_beself
[00030f30] 7015                      moveq.l    #21,d0
[00030f32] 224a                      movea.l    a2,a1
[00030f34] 2053                      movea.l    (a3),a0
[00030f36] 2068 0258                 movea.l    600(a0),a0
[00030f3a] 4eb9 0003 0b9a            jsr        oe_beself
[00030f40] 7017                      moveq.l    #23,d0
[00030f42] 224a                      movea.l    a2,a1
[00030f44] 2053                      movea.l    (a3),a0
[00030f46] 2068 0258                 movea.l    600(a0),a0
[00030f4a] 4eb9 0003 0b9a            jsr        oe_beself
[00030f50] 7019                      moveq.l    #25,d0
[00030f52] 224a                      movea.l    a2,a1
[00030f54] 2053                      movea.l    (a3),a0
[00030f56] 2068 0258                 movea.l    600(a0),a0
[00030f5a] 4eb9 0003 0b9a            jsr        oe_beself
[00030f60] 701b                      moveq.l    #27,d0
[00030f62] 224a                      movea.l    a2,a1
[00030f64] 2053                      movea.l    (a3),a0
[00030f66] 2068 0258                 movea.l    600(a0),a0
[00030f6a] 4eb9 0003 0b9a            jsr        oe_beself
[00030f70] 701c                      moveq.l    #28,d0
[00030f72] 224a                      movea.l    a2,a1
[00030f74] 2053                      movea.l    (a3),a0
[00030f76] 2068 0258                 movea.l    600(a0),a0
[00030f7a] 4eb9 0003 0b9a            jsr        oe_beself
[00030f80] 266c 0004                 movea.l    4(a4),a3
[00030f84] 43d7                      lea.l      (a7),a1
[00030f86] 2053                      movea.l    (a3),a0
[00030f88] 4eb9 0001 591a            jsr        set_ref
[00030f8e] 43d7                      lea.l      (a7),a1
[00030f90] 7004                      moveq.l    #4,d0
[00030f92] 41ea 0168                 lea.l      360(a2),a0
[00030f96] 4eb9 0006 a068            jsr        Auo_boxed
[00030f9c] 43d7                      lea.l      (a7),a1
[00030f9e] 206b 0004                 movea.l    4(a3),a0
[00030fa2] 4eb9 0001 591a            jsr        set_ref
[00030fa8] 43d7                      lea.l      (a7),a1
[00030faa] 7004                      moveq.l    #4,d0
[00030fac] 41ea 0198                 lea.l      408(a2),a0
[00030fb0] 4eb9 0006 a068            jsr        Auo_boxed
[00030fb6] 43d7                      lea.l      (a7),a1
[00030fb8] 206b 0008                 movea.l    8(a3),a0
[00030fbc] 4eb9 0001 591a            jsr        set_ref
[00030fc2] 43d7                      lea.l      (a7),a1
[00030fc4] 7004                      moveq.l    #4,d0
[00030fc6] 41ea 01c8                 lea.l      456(a2),a0
[00030fca] 4eb9 0006 a068            jsr        Auo_boxed
[00030fd0] 43d7                      lea.l      (a7),a1
[00030fd2] 206b 000c                 movea.l    12(a3),a0
[00030fd6] 4eb9 0001 591a            jsr        set_ref
[00030fdc] 43d7                      lea.l      (a7),a1
[00030fde] 7004                      moveq.l    #4,d0
[00030fe0] 41ea 01f8                 lea.l      504(a2),a0
[00030fe4] 4eb9 0006 a068            jsr        Auo_boxed
[00030fea] 43d7                      lea.l      (a7),a1
[00030fec] 206b 0010                 movea.l    16(a3),a0
[00030ff0] 4eb9 0001 591a            jsr        set_ref
[00030ff6] 43d7                      lea.l      (a7),a1
[00030ff8] 7004                      moveq.l    #4,d0
[00030ffa] 41ea 0228                 lea.l      552(a2),a0
[00030ffe] 4eb9 0006 a068            jsr        Auo_boxed
[00031004] 43d7                      lea.l      (a7),a1
[00031006] 206b 0014                 movea.l    20(a3),a0
[0003100a] 4eb9 0001 591a            jsr        set_ref
[00031010] 43d7                      lea.l      (a7),a1
[00031012] 7004                      moveq.l    #4,d0
[00031014] 41ea 0258                 lea.l      600(a2),a0
[00031018] 4eb9 0006 a068            jsr        Auo_boxed
[0003101e] 43d7                      lea.l      (a7),a1
[00031020] 206b 0018                 movea.l    24(a3),a0
[00031024] 4eb9 0001 5942            jsr        set_val
[0003102a] 43d7                      lea.l      (a7),a1
[0003102c] 7004                      moveq.l    #4,d0
[0003102e] 41ea 0288                 lea.l      648(a2),a0
[00031032] 4eb9 0006 a068            jsr        Auo_boxed
[00031038] 43d7                      lea.l      (a7),a1
[0003103a] 206b 001c                 movea.l    28(a3),a0
[0003103e] 4eb9 0001 5942            jsr        set_val
[00031044] 43d7                      lea.l      (a7),a1
[00031046] 7004                      moveq.l    #4,d0
[00031048] 41ea 02a0                 lea.l      672(a2),a0
[0003104c] 4eb9 0006 a068            jsr        Auo_boxed
[00031052] 2a8a                      move.l     a2,(a5)
[00031054] 204d                      movea.l    a5,a0
[00031056] 4fef 0102                 lea.l      258(a7),a7
[0003105a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003105e] 4e75                      rts
