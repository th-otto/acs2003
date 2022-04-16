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
[00030d34] 660e                      bne.s      edus_ok_1
[00030d36] 206e 0004                 movea.l    4(a6),a0
[00030d3a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00030d40] 4a40                      tst.w      d0
[00030d42] 6712                      beq.s      edus_ok_2
edus_ok_1:
[00030d44] 41f9 000c 91d8            lea.l      ERR_MUST,a0
[00030d4a] 7001                      moveq.l    #1,d0
[00030d4c] 4eb9 0005 a600            jsr        Awi_alert
[00030d52] 6000 0082                 bra        edus_ok_3
edus_ok_2:
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
[00030dca] 6704                      beq.s      edus_ok_4
[00030dcc] 2940 0014                 move.l     d0,20(a4)
edus_ok_4:
[00030dd0] 4eb9 0002 f27c            jsr        ed_abort
edus_ok_3:
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
[00030e42] 6f74                      ble.s      accept_1
[00030e44] 48c0                      ext.l      d0
[00030e46] 2200                      move.l     d0,d1
[00030e48] d281                      add.l      d1,d1
[00030e4a] d280                      add.l      d0,d1
[00030e4c] e789                      lsl.l      #3,d1
[00030e4e] 246d 0014                 movea.l    20(a5),a2
[00030e52] 45f2 1818                 lea.l      24(a2,d1.l),a2
[00030e56] 0c6a 271c 0016            cmpi.w     #$271C,22(a2)
[00030e5c] 6714                      beq.s      accept_2
[00030e5e] 4a44                      tst.w      d4
[00030e60] 6756                      beq.s      accept_1
[00030e62] 0c6a 2724 0016            cmpi.w     #$2724,22(a2)
[00030e68] 6708                      beq.s      accept_2
[00030e6a] 0c6a 271a 0016            cmpi.w     #$271A,22(a2)
[00030e70] 6646                      bne.s      accept_1
accept_2:
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
accept_1:
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
[00030eee] 6606                      bne.s      set_user_1
[00030ef0] 91c8                      suba.l     a0,a0
[00030ef2] 6000 0162                 bra        set_user_2
set_user_1:
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
set_user_2:
[00031056] 4fef 0102                 lea.l      258(a7),a7
[0003105a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003105e] 4e75                      rts

	.data

ERR_MUST:
[000c91d8]                           dc.b '[3][ | Es mÅssen Werte | eingegeben werden ][ OK ]',0
TEXT_003:
[000c920b]                           dc.b $4f
[000c920c]                           dc.w $4b00
TEXT_004:
[000c920e]                           dc.b 'Abbruch',0
TEXT_01:
[000c9216]                           dc.b 'Code:',0
TEXT_02:
[000c921c]                           dc.b 'Parm:',0
TEXT_03:
[000c9222]                           dc.b 'Serv:',0
TEXT_04:
[000c9228]                           dc.b 'Ptr1:',0
TEXT_05:
[000c922e]                           dc.b 'Ptr2:',0
TEXT_06:
[000c9234]                           dc.b 'Ptr3:',0
TEXT_07:
[000c923a]                           dc.b 'Bubb:',0
TEXT_08:
[000c9240]                           dc.b 'CMen:',0
help_title:
[000c9246]                           dc.b 'Der USERDEF-Editor',0
title:
[000c9259]                           dc.b ' USERBLK -',0
A_3DBUTTON02:
[000c9264] 00064a22                  dc.l A_3Dbutton
[000c9268]                           dc.w $21f1
[000c926a]                           dc.w $01f8
[000c926c] 000630f2                  dc.l Auo_string
[000c9270]                           dc.w $0000
[000c9272]                           dc.w $0000
[000c9274]                           dc.w $0000
[000c9276]                           dc.w $0000
[000c9278]                           dc.w $0000
[000c927a]                           dc.w $0000
[000c927c]                           dc.w $0000
[000c927e]                           dc.w $0000
[000c9280]                           dc.w $0000
[000c9282]                           dc.w $0000
A_3DBUTTON03:
[000c9284] 00064a22                  dc.l A_3Dbutton
[000c9288]                           dc.w $29c1
[000c928a]                           dc.w $0178
[000c928c] 000630f2                  dc.l Auo_string
[000c9290] 000c920e                  dc.l TEXT_004
[000c9294]                           dc.w $0000
[000c9296]                           dc.w $0000
[000c9298]                           dc.w $0000
[000c929a]                           dc.w $0000
[000c929c]                           dc.w $0000
[000c929e]                           dc.w $0000
[000c92a0]                           dc.w $0000
[000c92a2]                           dc.w $0000
A_3DBUTTON04:
[000c92a4] 00064a22                  dc.l A_3Dbutton
[000c92a8]                           dc.w $29c1
[000c92aa]                           dc.w $0178
[000c92ac] 000630f2                  dc.l Auo_string
[000c92b0] 000c920b                  dc.l TEXT_003
[000c92b4]                           dc.w $0000
[000c92b6]                           dc.w $0000
[000c92b8]                           dc.w $0000
[000c92ba]                           dc.w $0000
[000c92bc]                           dc.w $0000
[000c92be]                           dc.w $0000
[000c92c0]                           dc.w $0000
[000c92c2]                           dc.w $0000
A_3DBUTTON05:
[000c92c4] 00064a22                  dc.l A_3Dbutton
[000c92c8]                           dc.w $2011
[000c92ca]                           dc.w $9178
[000c92cc] 000630f2                  dc.l Auo_string
[000c92d0]                           dc.w $0000
[000c92d2]                           dc.w $0000
[000c92d4]                           dc.w $0000
[000c92d6]                           dc.w $0000
[000c92d8]                           dc.w $0000
[000c92da]                           dc.w $0000
[000c92dc]                           dc.w $0000
[000c92de]                           dc.w $0000
[000c92e0]                           dc.w $0000
[000c92e2]                           dc.w $0000
A_BOXED01:
[000c92e4] 0006afea                  dc.l A_boxed
[000c92e8]                           dc.w $9038
[000c92ea]                           dc.w $1f12
[000c92ec] 0006a068                  dc.l Auo_boxed
[000c92f0]                           dc.w $0000
[000c92f2]                           dc.w $0000
[000c92f4]                           dc.w $0000
[000c92f6]                           dc.w $0000
[000c92f8]                           dc.w $0000
[000c92fa]                           dc.w $0000
[000c92fc]                           dc.w $0000
[000c92fe]                           dc.w $0000
[000c9300]                           dc.w $0000
[000c9302]                           dc.w $0000
A_BOXED02:
[000c9304] 0006afea                  dc.l A_boxed
[000c9308]                           dc.w $9038
[000c930a]                           dc.w $ff12
[000c930c] 0006a068                  dc.l Auo_boxed
[000c9310]                           dc.w $0000
[000c9312]                           dc.w $0000
[000c9314]                           dc.w $0000
[000c9316]                           dc.w $0000
[000c9318]                           dc.w $0000
[000c931a]                           dc.w $0000
[000c931c]                           dc.w $0000
[000c931e]                           dc.w $0000
[000c9320]                           dc.w $0000
[000c9322]                           dc.w $0000
A_BOXED03:
[000c9324] 0006afea                  dc.l A_boxed
[000c9328]                           dc.w $9038
[000c932a]                           dc.w $ff12
[000c932c] 0006a068                  dc.l Auo_boxed
[000c9330]                           dc.w $0000
[000c9332]                           dc.w $0000
[000c9334]                           dc.w $0000
[000c9336]                           dc.w $0000
[000c9338]                           dc.w $0000
[000c933a]                           dc.w $0000
[000c933c]                           dc.w $0000
[000c933e]                           dc.w $0000
[000c9340]                           dc.w $0000
[000c9342]                           dc.w $0000
A_INNERFRAME02:
[000c9344] 00064256                  dc.l A_innerframe
[000c9348]                           dc.w $1000
[000c934a]                           dc.w $8f19
[000c934c] 000630f2                  dc.l Auo_string
[000c9350]                           dc.w $0000
[000c9352]                           dc.w $0000
[000c9354]                           dc.w $0000
[000c9356]                           dc.w $0000
[000c9358]                           dc.w $0000
[000c935a]                           dc.w $0000
[000c935c]                           dc.w $0000
[000c935e]                           dc.w $0000
[000c9360]                           dc.w $0000
[000c9362]                           dc.w $0000
ED_USER:
[000c9364]                           dc.w $ffff
[000c9366]                           dc.w $0001
[000c9368]                           dc.w $0021
[000c936a]                           dc.w $0018
[000c936c]                           dc.w $0040
[000c936e]                           dc.w $0010
[000c9370] 000c9264                  dc.l A_3DBUTTON02
[000c9374]                           dc.w $0000
[000c9376]                           dc.w $0000
[000c9378]                           dc.w $002a
[000c937a]                           dc.w $000d
_01_ED_USER:
[000c937c]                           dc.w $001f
[000c937e]                           dc.w $0002
[000c9380]                           dc.w $001e
[000c9382]                           dc.w $0018
[000c9384]                           dc.w $0040
[000c9386]                           dc.w $0000
[000c9388] 000c9344                  dc.l A_INNERFRAME02
[000c938c]                           dc.w $0001
[000c938e]                           dc.w $0000
[000c9390]                           dc.w $0028
[000c9392]                           dc.w $000a
_02_ED_USER:
[000c9394]                           dc.w $0004
[000c9396]                           dc.w $ffff
[000c9398]                           dc.w $ffff
[000c939a]                           dc.w $001c
[000c939c]                           dc.w $0005
[000c939e]                           dc.w $0000
[000c93a0] 000c9216                  dc.l TEXT_01
[000c93a4]                           dc.w $0001
[000c93a6]                           dc.w $0001
[000c93a8]                           dc.w $0005
[000c93aa]                           dc.w $0001
_02aED_USER:
[000c93ac] 00030de0                  dc.l edus_list
[000c93b0]                           dc.w $0000
[000c93b2]                           dc.w $0000
[000c93b4]                           dc.w $8000
[000c93b6]                           dc.w $0000
[000c93b8]                           dc.w $0000
[000c93ba]                           dc.w $0000
[000c93bc]                           dc.w $0000
[000c93be]                           dc.w $0000
[000c93c0]                           dc.w $0000
[000c93c2]                           dc.w $0000
_04_ED_USER:
[000c93c4]                           dc.w $0006
[000c93c6]                           dc.w $ffff
[000c93c8]                           dc.w $ffff
[000c93ca]                           dc.w $001c
[000c93cc]                           dc.w $0005
[000c93ce]                           dc.w $0000
[000c93d0] 000c921c                  dc.l TEXT_02
[000c93d4]                           dc.w $0001
[000c93d6]                           dc.w $0002
[000c93d8]                           dc.w $0005
[000c93da]                           dc.w $0001
_04aED_USER:
[000c93dc] 00030de0                  dc.l edus_list
[000c93e0]                           dc.w $0000
[000c93e2]                           dc.w $0000
[000c93e4]                           dc.w $8000
[000c93e6]                           dc.w $0000
[000c93e8]                           dc.w $0000
[000c93ea]                           dc.w $0000
[000c93ec]                           dc.w $0000
[000c93ee]                           dc.w $0000
[000c93f0]                           dc.w $0000
[000c93f2]                           dc.w $0000
_06_ED_USER:
[000c93f4]                           dc.w $0008
[000c93f6]                           dc.w $ffff
[000c93f8]                           dc.w $ffff
[000c93fa]                           dc.w $001c
[000c93fc]                           dc.w $0005
[000c93fe]                           dc.w $0000
[000c9400] 000c9222                  dc.l TEXT_03
[000c9404]                           dc.w $0001
[000c9406]                           dc.w $0003
[000c9408]                           dc.w $0005
[000c940a]                           dc.w $0001
_06aED_USER:
[000c940c] 00030de0                  dc.l edus_list
[000c9410]                           dc.w $0000
[000c9412]                           dc.w $0000
[000c9414]                           dc.w $8000
[000c9416]                           dc.w $0000
[000c9418]                           dc.w $0000
[000c941a]                           dc.w $0000
[000c941c]                           dc.w $0000
[000c941e]                           dc.w $0000
[000c9420]                           dc.w $0000
[000c9422]                           dc.w $0000
_08_ED_USER:
[000c9424]                           dc.w $000a
[000c9426]                           dc.w $ffff
[000c9428]                           dc.w $ffff
[000c942a]                           dc.w $001c
[000c942c]                           dc.w $0005
[000c942e]                           dc.w $0000
[000c9430] 000c9228                  dc.l TEXT_04
[000c9434]                           dc.w $0001
[000c9436]                           dc.w $0004
[000c9438]                           dc.w $0005
[000c943a]                           dc.w $0001
_08aED_USER:
[000c943c] 00030de0                  dc.l edus_list
[000c9440]                           dc.w $0000
[000c9442]                           dc.w $0000
[000c9444]                           dc.w $8000
[000c9446]                           dc.w $0000
[000c9448]                           dc.w $0000
[000c944a]                           dc.w $0000
[000c944c]                           dc.w $0000
[000c944e]                           dc.w $0000
[000c9450]                           dc.w $0000
[000c9452]                           dc.w $0000
_10_ED_USER:
[000c9454]                           dc.w $000c
[000c9456]                           dc.w $ffff
[000c9458]                           dc.w $ffff
[000c945a]                           dc.w $001c
[000c945c]                           dc.w $0005
[000c945e]                           dc.w $0000
[000c9460] 000c922e                  dc.l TEXT_05
[000c9464]                           dc.w $0001
[000c9466]                           dc.w $0005
[000c9468]                           dc.w $0005
[000c946a]                           dc.w $0001
_10aED_USER:
[000c946c] 00030de0                  dc.l edus_list
[000c9470]                           dc.w $0000
[000c9472]                           dc.w $0000
[000c9474]                           dc.w $8000
[000c9476]                           dc.w $0000
[000c9478]                           dc.w $0000
[000c947a]                           dc.w $0000
[000c947c]                           dc.w $0000
[000c947e]                           dc.w $0000
[000c9480]                           dc.w $0000
[000c9482]                           dc.w $0000
_12_ED_USER:
[000c9484]                           dc.w $000e
[000c9486]                           dc.w $ffff
[000c9488]                           dc.w $ffff
[000c948a]                           dc.w $001c
[000c948c]                           dc.w $0005
[000c948e]                           dc.w $0000
[000c9490] 000c9234                  dc.l TEXT_06
[000c9494]                           dc.w $0001
[000c9496]                           dc.w $0006
[000c9498]                           dc.w $0005
[000c949a]                           dc.w $0001
_12aED_USER:
[000c949c] 00030de0                  dc.l edus_list
[000c94a0]                           dc.w $0000
[000c94a2]                           dc.w $0000
[000c94a4]                           dc.w $8000
[000c94a6]                           dc.w $0000
[000c94a8]                           dc.w $0000
[000c94aa]                           dc.w $0000
[000c94ac]                           dc.w $0000
[000c94ae]                           dc.w $0000
[000c94b0]                           dc.w $0000
[000c94b2]                           dc.w $0000
_14_ED_USER:
[000c94b4]                           dc.w $001d
[000c94b6]                           dc.w $000f
[000c94b8]                           dc.w $001c
[000c94ba]                           dc.w $0018
[000c94bc]                           dc.w $0040
[000c94be]                           dc.w $0000
[000c94c0] 000c92c4                  dc.l A_3DBUTTON05
[000c94c4]                           dc.w $0007
[000c94c6]                           dc.w $0001
[000c94c8]                           dc.w $001f
[000c94ca]                           dc.w $0008
_15_ED_USER:
[000c94cc]                           dc.w $0011
[000c94ce]                           dc.w $ffff
[000c94d0]                           dc.w $ffff
[000c94d2]                           dc.w $0018
[000c94d4]                           dc.w $0008
[000c94d6]                           dc.w $0000
[000c94d8] 000c92e4                  dc.l A_BOXED01
[000c94dc]                           dc.w $0000
[000c94de]                           dc.w $0000
[000c94e0]                           dc.w $001f
[000c94e2]                           dc.w $0001
_15aED_USER:
[000c94e4]                           dc.w $0000
[000c94e6]                           dc.w $0000
[000c94e8] 00030ec0                  dc.l edus_ref
[000c94ec]                           dc.w $8000
[000c94ee]                           dc.w $0000
[000c94f0]                           dc.w $0000
[000c94f2]                           dc.w $0000
[000c94f4]                           dc.w $0000
[000c94f6]                           dc.w $0000
[000c94f8]                           dc.w $0000
[000c94fa]                           dc.w $0000
_17_ED_USER:
[000c94fc]                           dc.w $0013
[000c94fe]                           dc.w $ffff
[000c9500]                           dc.w $ffff
[000c9502]                           dc.w $0018
[000c9504]                           dc.w $0008
[000c9506]                           dc.w $0000
[000c9508] 000c92e4                  dc.l A_BOXED01
[000c950c]                           dc.w $0000
[000c950e]                           dc.w $0001
[000c9510]                           dc.w $001f
[000c9512]                           dc.w $0001
_17aED_USER:
[000c9514]                           dc.w $0000
[000c9516]                           dc.w $0000
[000c9518] 00030ec0                  dc.l edus_ref
[000c951c]                           dc.w $8000
[000c951e]                           dc.w $0000
[000c9520]                           dc.w $0000
[000c9522]                           dc.w $0000
[000c9524]                           dc.w $0000
[000c9526]                           dc.w $0000
[000c9528]                           dc.w $0000
[000c952a]                           dc.w $0000
_19_ED_USER:
[000c952c]                           dc.w $0015
[000c952e]                           dc.w $ffff
[000c9530]                           dc.w $ffff
[000c9532]                           dc.w $0018
[000c9534]                           dc.w $0008
[000c9536]                           dc.w $0000
[000c9538] 000c92e4                  dc.l A_BOXED01
[000c953c]                           dc.w $0000
[000c953e]                           dc.w $0002
[000c9540]                           dc.w $001f
[000c9542]                           dc.w $0001
_19aED_USER:
[000c9544]                           dc.w $0000
[000c9546]                           dc.w $0000
[000c9548] 00030ec0                  dc.l edus_ref
[000c954c]                           dc.w $8000
[000c954e]                           dc.w $0000
[000c9550]                           dc.w $0000
[000c9552]                           dc.w $0000
[000c9554]                           dc.w $0000
[000c9556]                           dc.w $0000
[000c9558]                           dc.w $0000
[000c955a]                           dc.w $0000
_21_ED_USER:
[000c955c]                           dc.w $0017
[000c955e]                           dc.w $ffff
[000c9560]                           dc.w $ffff
[000c9562]                           dc.w $0018
[000c9564]                           dc.w $0008
[000c9566]                           dc.w $0000
[000c9568] 000c92e4                  dc.l A_BOXED01
[000c956c]                           dc.w $0000
[000c956e]                           dc.w $0003
[000c9570]                           dc.w $001f
[000c9572]                           dc.w $0001
_21aED_USER:
[000c9574]                           dc.w $0000
[000c9576]                           dc.w $0000
[000c9578] 00030ec8                  dc.l edus_ptr
[000c957c]                           dc.w $8000
[000c957e]                           dc.w $0000
[000c9580]                           dc.w $0000
[000c9582]                           dc.w $0000
[000c9584]                           dc.w $0000
[000c9586]                           dc.w $0000
[000c9588]                           dc.w $0000
[000c958a]                           dc.w $0000
_23_ED_USER:
[000c958c]                           dc.w $0019
[000c958e]                           dc.w $ffff
[000c9590]                           dc.w $ffff
[000c9592]                           dc.w $0018
[000c9594]                           dc.w $0008
[000c9596]                           dc.w $0000
[000c9598] 000c92e4                  dc.l A_BOXED01
[000c959c]                           dc.w $0000
[000c959e]                           dc.w $0004
[000c95a0]                           dc.w $001f
[000c95a2]                           dc.w $0001
_23aED_USER:
[000c95a4]                           dc.w $0000
[000c95a6]                           dc.w $0000
[000c95a8] 00030ec8                  dc.l edus_ptr
[000c95ac]                           dc.w $8000
[000c95ae]                           dc.w $0000
[000c95b0]                           dc.w $0000
[000c95b2]                           dc.w $0000
[000c95b4]                           dc.w $0000
[000c95b6]                           dc.w $0000
[000c95b8]                           dc.w $0000
[000c95ba]                           dc.w $0000
_25_ED_USER:
[000c95bc]                           dc.w $001b
[000c95be]                           dc.w $ffff
[000c95c0]                           dc.w $ffff
[000c95c2]                           dc.w $0018
[000c95c4]                           dc.w $0008
[000c95c6]                           dc.w $0000
[000c95c8] 000c92e4                  dc.l A_BOXED01
[000c95cc]                           dc.w $0000
[000c95ce]                           dc.w $0005
[000c95d0]                           dc.w $001f
[000c95d2]                           dc.w $0001
_25aED_USER:
[000c95d4]                           dc.w $0000
[000c95d6]                           dc.w $0000
[000c95d8] 00030ec8                  dc.l edus_ptr
[000c95dc]                           dc.w $8000
[000c95de]                           dc.w $0000
[000c95e0]                           dc.w $0000
[000c95e2]                           dc.w $0000
[000c95e4]                           dc.w $0000
[000c95e6]                           dc.w $0000
[000c95e8]                           dc.w $0000
[000c95ea]                           dc.w $0000
_27_ED_USER:
[000c95ec]                           dc.w $001c
[000c95ee]                           dc.w $ffff
[000c95f0]                           dc.w $ffff
[000c95f2]                           dc.w $0018
[000c95f4]                           dc.w $0008
[000c95f6]                           dc.w $0000
[000c95f8] 000c9304                  dc.l A_BOXED02
[000c95fc]                           dc.w $0000
[000c95fe]                           dc.w $0006
[000c9600]                           dc.w $001f
[000c9602]                           dc.w $0001
_28_ED_USER:
[000c9604]                           dc.w $000e
[000c9606]                           dc.w $ffff
[000c9608]                           dc.w $ffff
[000c960a]                           dc.w $0018
[000c960c]                           dc.w $0008
[000c960e]                           dc.w $0000
[000c9610] 000c9324                  dc.l A_BOXED03
[000c9614]                           dc.w $0000
[000c9616]                           dc.w $0007
[000c9618]                           dc.w $001f
[000c961a]                           dc.w $0001
_29_ED_USER:
[000c961c]                           dc.w $001e
[000c961e]                           dc.w $ffff
[000c9620]                           dc.w $ffff
[000c9622]                           dc.w $001c
[000c9624]                           dc.w $0000
[000c9626]                           dc.w $0000
[000c9628] 000c923a                  dc.l TEXT_07
[000c962c]                           dc.w $0001
[000c962e]                           dc.w $0007
[000c9630]                           dc.w $0005
[000c9632]                           dc.w $0001
_30_ED_USER:
[000c9634]                           dc.w $0001
[000c9636]                           dc.w $ffff
[000c9638]                           dc.w $ffff
[000c963a]                           dc.w $001c
[000c963c]                           dc.w $0000
[000c963e]                           dc.w $0000
[000c9640] 000c9240                  dc.l TEXT_08
[000c9644]                           dc.w $0001
[000c9646]                           dc.w $0008
[000c9648]                           dc.w $0005
[000c964a]                           dc.w $0001
_31_ED_USER:
[000c964c]                           dc.w $0021
[000c964e]                           dc.w $ffff
[000c9650]                           dc.w $ffff
[000c9652]                           dc.w $0018
[000c9654]                           dc.w $4007
[000c9656]                           dc.w $0010
[000c9658] 000c92a4                  dc.l A_3DBUTTON04
[000c965c]                           dc.w $0008
[000c965e]                           dc.w $000a
[000c9660]                           dc.w $000c
[000c9662]                           dc.w $0002
_31aED_USER:
[000c9664] 00030cd4                  dc.l edus_ok
[000c9668]                           dc.w $0000
[000c966a]                           dc.w $0000
[000c966c]                           dc.w $8000
[000c966e]                           dc.w $884f
[000c9670]                           dc.w $0000
[000c9672]                           dc.w $0000
[000c9674]                           dc.w $0000
[000c9676]                           dc.w $0000
[000c9678]                           dc.w $0000
[000c967a]                           dc.w $0000
_33_ED_USER:
[000c967c]                           dc.w $0000
[000c967e]                           dc.w $ffff
[000c9680]                           dc.w $ffff
[000c9682]                           dc.w $0018
[000c9684]                           dc.w $4005
[000c9686]                           dc.w $0010
[000c9688] 000c9284                  dc.l A_3DBUTTON03
[000c968c]                           dc.w $0016
[000c968e]                           dc.w $000a
[000c9690]                           dc.w $000c
[000c9692]                           dc.w $0002
_33aED_USER:
[000c9694] 0002f27c                  dc.l ed_abort
[000c9698]                           dc.w $0000
[000c969a]                           dc.w $0000
[000c969c]                           dc.w $8020
[000c969e]                           dc.w $8841
[000c96a0]                           dc.w $0000
[000c96a2]                           dc.w $0000
[000c96a4]                           dc.w $0000
[000c96a6]                           dc.w $0000
[000c96a8]                           dc.w $0000
[000c96aa]                           dc.w $0000
sm:
[000c96ac]                           dc.w $0000
[000c96ae]                           dc.w $0000
[000c96b0] 00030cd4                  dc.l edus_ok
[000c96b4] 0004f20a                  dc.l Aob_delete
[000c96b8] 000c9259                  dc.l title
[000c96bc] 000c9246                  dc.l help_title
[000c96c0]                           dc.w $0000
[000c96c2]                           dc.w $0000
