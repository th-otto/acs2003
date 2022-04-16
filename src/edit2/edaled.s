
edal_try:
[0001da2a] 4fef ff00                 lea.l      -256(a7),a7
[0001da2e] 43d7                      lea.l      (a7),a1
[0001da30] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001da36] 2068 0258                 movea.l    600(a0),a0
[0001da3a] 4eb9 0001 daee            jsr        get_alert
[0001da40] 7004                      moveq.l    #4,d0
[0001da42] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001da48] c068 0266                 and.w      614(a0),d0
[0001da4c] 6712                      beq.s      edal_try_1
[0001da4e] 2279 000e 692a            movea.l    _globl,a1
[0001da54] 41d7                      lea.l      (a7),a0
[0001da56] 7001                      moveq.l    #1,d0
[0001da58] 4eb9 0007 a146            jsr        mt_form_alert
[0001da5e] 600a                      bra.s      edal_try_2
edal_try_1:
[0001da60] 41d7                      lea.l      (a7),a0
[0001da62] 7001                      moveq.l    #1,d0
[0001da64] 4eb9 0005 a600            jsr        Awi_alert
edal_try_2:
[0001da6a] 4fef 0100                 lea.l      256(a7),a7
[0001da6e] 4e75                      rts

edal_newim:
[0001da70] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0001da74] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001da7a] 2468 0258                 movea.l    600(a0),a2
[0001da7e] 47f9 000a d4fa            lea.l      NEW_IMAGE,a3
[0001da84] 72ff                      moveq.l    #-1,d1
[0001da86] 70ff                      moveq.l    #-1,d0
[0001da88] 224b                      movea.l    a3,a1
[0001da8a] 204a                      movea.l    a2,a0
[0001da8c] 4eb9 0004 e84a            jsr        Ame_popup
[0001da92] 3600                      move.w     d0,d3
[0001da94] 6b1e                      bmi.s      edal_newim_1
[0001da96] 48c0                      ext.l      d0
[0001da98] 2200                      move.l     d0,d1
[0001da9a] d281                      add.l      d1,d1
[0001da9c] d280                      add.l      d0,d1
[0001da9e] e789                      lsl.l      #3,d1
[0001daa0] 206a 0014                 movea.l    20(a2),a0
[0001daa4] 2173 180c 003c            move.l     12(a3,d1.l),60(a0)
[0001daaa] 204a                      movea.l    a2,a0
[0001daac] 7002                      moveq.l    #2,d0
[0001daae] 4eb9 0005 1b80            jsr        Awi_obredraw
edal_newim_1:
[0001dab4] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0001dab8] 4e75                      rts

edal_ok:
[0001daba] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001dac0] 2068 0258                 movea.l    600(a0),a0
[0001dac4] 4eb9 0001 dcb4            jsr        acc_alert
[0001daca] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001dad0] 2068 0258                 movea.l    600(a0),a0
[0001dad4] 4eb9 0001 e00a            jsr        term
[0001dada] 4e75                      rts

edal_abort:
[0001dadc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001dae2] 2068 0258                 movea.l    600(a0),a0
[0001dae6] 4eb9 0001 e00a            jsr        term
[0001daec] 4e75                      rts

get_alert:
[0001daee] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001daf2] 594f                      subq.w     #4,a7
[0001daf4] 2849                      movea.l    a1,a4
[0001daf6] 2468 0014                 movea.l    20(a0),a2
[0001dafa] 47f9 000a d7dc            lea.l      $000AD7DC,a3
[0001db00] 224b                      movea.l    a3,a1
[0001db02] 204c                      movea.l    a4,a0
[0001db04] 4eb9 0008 2f0c            jsr        strcpy
[0001db0a] 41f9 000a d346            lea.l      IM_NONE,a0
[0001db10] 226a 003c                 movea.l    60(a2),a1
[0001db14] b3c8                      cmpa.l     a0,a1
[0001db16] 6606                      bne.s      get_alert_1
[0001db18] 197c 0030 0001            move.b     #$30,1(a4)
get_alert_1:
[0001db1e] 226a 003c                 movea.l    60(a2),a1
[0001db22] b3fc 000a d2b8            cmpa.l     #IM_EXCLAM,a1
[0001db28] 6606                      bne.s      get_alert_2
[0001db2a] 197c 0031 0001            move.b     #$31,1(a4)
get_alert_2:
[0001db30] 226a 003c                 movea.l    60(a2),a1
[0001db34] b3fc 000a d3d4            cmpa.l     #IM_QUEST,a1
[0001db3a] 6606                      bne.s      get_alert_3
[0001db3c] 197c 0032 0001            move.b     #$32,1(a4)
get_alert_3:
[0001db42] 226a 003c                 movea.l    60(a2),a1
[0001db46] b3fc 000a d462            cmpa.l     #IM_STOP,a1
[0001db4c] 6606                      bne.s      get_alert_4
[0001db4e] 197c 0033 0001            move.b     #$33,1(a4)
get_alert_4:
[0001db54] 226a 003c                 movea.l    60(a2),a1
[0001db58] b3fc 000a d4ec            cmpa.l     #IM_TIME,a1
[0001db5e] 6606                      bne.s      get_alert_5
[0001db60] 197c 0034 0001            move.b     #$34,1(a4)
get_alert_5:
[0001db66] 584c                      addq.w     #4,a4
[0001db68] 43d7                      lea.l      (a7),a1
[0001db6a] 7003                      moveq.l    #3,d0
[0001db6c] 41ea 0060                 lea.l      96(a2),a0
[0001db70] 4eb9 0006 a068            jsr        Auo_boxed
[0001db76] 2057                      movea.l    (a7),a0
[0001db78] 1010                      move.b     (a0),d0
[0001db7a] 670a                      beq.s      get_alert_6
[0001db7c] 2248                      movea.l    a0,a1
[0001db7e] 204c                      movea.l    a4,a0
[0001db80] 4eb9 0008 2e42            jsr        strcat
get_alert_6:
[0001db86] 43d7                      lea.l      (a7),a1
[0001db88] 7003                      moveq.l    #3,d0
[0001db8a] 41ea 0078                 lea.l      120(a2),a0
[0001db8e] 4eb9 0006 a068            jsr        Auo_boxed
[0001db94] 2057                      movea.l    (a7),a0
[0001db96] 1010                      move.b     (a0),d0
[0001db98] 6714                      beq.s      get_alert_7
[0001db9a] 43eb 0005                 lea.l      5(a3),a1
[0001db9e] 204c                      movea.l    a4,a0
[0001dba0] 4eb9 0008 2e42            jsr        strcat
[0001dba6] 2257                      movea.l    (a7),a1
[0001dba8] 4eb9 0008 2e42            jsr        strcat
get_alert_7:
[0001dbae] 43d7                      lea.l      (a7),a1
[0001dbb0] 7003                      moveq.l    #3,d0
[0001dbb2] 41ea 0090                 lea.l      144(a2),a0
[0001dbb6] 4eb9 0006 a068            jsr        Auo_boxed
[0001dbbc] 2057                      movea.l    (a7),a0
[0001dbbe] 1010                      move.b     (a0),d0
[0001dbc0] 6714                      beq.s      get_alert_8
[0001dbc2] 43eb 0005                 lea.l      5(a3),a1
[0001dbc6] 204c                      movea.l    a4,a0
[0001dbc8] 4eb9 0008 2e42            jsr        strcat
[0001dbce] 2257                      movea.l    (a7),a1
[0001dbd0] 4eb9 0008 2e42            jsr        strcat
get_alert_8:
[0001dbd6] 43d7                      lea.l      (a7),a1
[0001dbd8] 7003                      moveq.l    #3,d0
[0001dbda] 41ea 00a8                 lea.l      168(a2),a0
[0001dbde] 4eb9 0006 a068            jsr        Auo_boxed
[0001dbe4] 2057                      movea.l    (a7),a0
[0001dbe6] 1010                      move.b     (a0),d0
[0001dbe8] 6714                      beq.s      get_alert_9
[0001dbea] 43eb 0005                 lea.l      5(a3),a1
[0001dbee] 204c                      movea.l    a4,a0
[0001dbf0] 4eb9 0008 2e42            jsr        strcat
[0001dbf6] 2257                      movea.l    (a7),a1
[0001dbf8] 4eb9 0008 2e42            jsr        strcat
get_alert_9:
[0001dbfe] 43d7                      lea.l      (a7),a1
[0001dc00] 7003                      moveq.l    #3,d0
[0001dc02] 41ea 00c0                 lea.l      192(a2),a0
[0001dc06] 4eb9 0006 a068            jsr        Auo_boxed
[0001dc0c] 2057                      movea.l    (a7),a0
[0001dc0e] 1010                      move.b     (a0),d0
[0001dc10] 6714                      beq.s      get_alert_10
[0001dc12] 43eb 0005                 lea.l      5(a3),a1
[0001dc16] 204c                      movea.l    a4,a0
[0001dc18] 4eb9 0008 2e42            jsr        strcat
[0001dc1e] 2257                      movea.l    (a7),a1
[0001dc20] 4eb9 0008 2e42            jsr        strcat
get_alert_10:
[0001dc26] 43eb 0002                 lea.l      2(a3),a1
[0001dc2a] 204c                      movea.l    a4,a0
[0001dc2c] 4eb9 0008 2e42            jsr        strcat
[0001dc32] 43d7                      lea.l      (a7),a1
[0001dc34] 7003                      moveq.l    #3,d0
[0001dc36] 41ea 00d8                 lea.l      216(a2),a0
[0001dc3a] 4eb9 0006 a068            jsr        Auo_boxed
[0001dc40] 2057                      movea.l    (a7),a0
[0001dc42] 1010                      move.b     (a0),d0
[0001dc44] 670a                      beq.s      get_alert_11
[0001dc46] 2248                      movea.l    a0,a1
[0001dc48] 204c                      movea.l    a4,a0
[0001dc4a] 4eb9 0008 2e42            jsr        strcat
get_alert_11:
[0001dc50] 43d7                      lea.l      (a7),a1
[0001dc52] 7003                      moveq.l    #3,d0
[0001dc54] 41ea 00f0                 lea.l      240(a2),a0
[0001dc58] 4eb9 0006 a068            jsr        Auo_boxed
[0001dc5e] 2057                      movea.l    (a7),a0
[0001dc60] 1010                      move.b     (a0),d0
[0001dc62] 6714                      beq.s      get_alert_12
[0001dc64] 43eb 0005                 lea.l      5(a3),a1
[0001dc68] 204c                      movea.l    a4,a0
[0001dc6a] 4eb9 0008 2e42            jsr        strcat
[0001dc70] 2257                      movea.l    (a7),a1
[0001dc72] 4eb9 0008 2e42            jsr        strcat
get_alert_12:
[0001dc78] 43d7                      lea.l      (a7),a1
[0001dc7a] 7003                      moveq.l    #3,d0
[0001dc7c] 41ea 0108                 lea.l      264(a2),a0
[0001dc80] 4eb9 0006 a068            jsr        Auo_boxed
[0001dc86] 2057                      movea.l    (a7),a0
[0001dc88] 1010                      move.b     (a0),d0
[0001dc8a] 6714                      beq.s      get_alert_13
[0001dc8c] 43eb 0005                 lea.l      5(a3),a1
[0001dc90] 204c                      movea.l    a4,a0
[0001dc92] 4eb9 0008 2e42            jsr        strcat
[0001dc98] 2257                      movea.l    (a7),a1
[0001dc9a] 4eb9 0008 2e42            jsr        strcat
get_alert_13:
[0001dca0] 43eb 0007                 lea.l      7(a3),a1
[0001dca4] 204c                      movea.l    a4,a0
[0001dca6] 4eb9 0008 2e42            jsr        strcat
[0001dcac] 584f                      addq.w     #4,a7
[0001dcae] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001dcb2] 4e75                      rts

acc_alert:
[0001dcb4] 48e7 1028                 movem.l    d3/a2/a4,-(a7)
[0001dcb8] 4fef ff00                 lea.l      -256(a7),a7
[0001dcbc] 2848                      movea.l    a0,a4
[0001dcbe] 2450                      movea.l    (a0),a2
[0001dcc0] 2252                      movea.l    (a2),a1
[0001dcc2] 0069 0001 0006            ori.w      #$0001,6(a1)
[0001dcc8] 43d7                      lea.l      (a7),a1
[0001dcca] 6100 fe22                 bsr        get_alert
[0001dcce] 41d7                      lea.l      (a7),a0
[0001dcd0] 4eb9 0008 2f6c            jsr        strlen
[0001dcd6] 2600                      move.l     d0,d3
[0001dcd8] 5283                      addq.l     #1,d3
[0001dcda] 2003                      move.l     d3,d0
[0001dcdc] 4eb9 0004 c608            jsr        Ax_malloc
[0001dce2] 2848                      movea.l    a0,a4
[0001dce4] 200c                      move.l     a4,d0
[0001dce6] 672e                      beq.s      acc_alert_1
[0001dce8] 43d7                      lea.l      (a7),a1
[0001dcea] 4eb9 0008 2f0c            jsr        strcpy
[0001dcf0] 206a 0004                 movea.l    4(a2),a0
[0001dcf4] 2068 0004                 movea.l    4(a0),a0
[0001dcf8] 4eb9 0004 c7c8            jsr        Ax_free
[0001dcfe] 206a 0004                 movea.l    4(a2),a0
[0001dd02] 214c 0004                 move.l     a4,4(a0)
[0001dd06] 206a 0004                 movea.l    4(a2),a0
[0001dd0a] 2143 000a                 move.l     d3,10(a0)
[0001dd0e] 206a 0004                 movea.l    4(a2),a0
[0001dd12] 2143 000e                 move.l     d3,14(a0)
acc_alert_1:
[0001dd16] 4fef 0100                 lea.l      256(a7),a7
[0001dd1a] 4cdf 1408                 movem.l    (a7)+,d3/a2/a4
[0001dd1e] 4e75                      rts

al_make:
[0001dd20] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001dd24] 594f                      subq.w     #4,a7
[0001dd26] 2448                      movea.l    a0,a2
[0001dd28] 266a 0004                 movea.l    4(a2),a3
[0001dd2c] 286b 0012                 movea.l    18(a3),a4
[0001dd30] 200c                      move.l     a4,d0
[0001dd32] 670a                      beq.s      al_make_1
[0001dd34] 204c                      movea.l    a4,a0
[0001dd36] 4eb9 0005 6bea            jsr        Awi_show
[0001dd3c] 6074                      bra.s      al_make_2
al_make_1:
[0001dd3e] 7008                      moveq.l    #8,d0
[0001dd40] 4eb9 0004 c608            jsr        Ax_malloc
[0001dd46] 2e88                      move.l     a0,(a7)
[0001dd48] 6764                      beq.s      al_make_3
[0001dd4a] 7008                      moveq.l    #8,d0
[0001dd4c] 224a                      movea.l    a2,a1
[0001dd4e] 4eb9 0008 3500            jsr        memcpy
[0001dd54] 41eb 0016                 lea.l      22(a3),a0
[0001dd58] 23c8 000a d788            move.l     a0,$000AD788
[0001dd5e] 2279 000a d794            movea.l    $000AD794,a1
[0001dd64] 2348 0008                 move.l     a0,8(a1)
[0001dd68] 41f9 000a d73a            lea.l      WI_ALERT,a0
[0001dd6e] 4eb9 0005 7052            jsr        Awi_create
[0001dd74] 2848                      movea.l    a0,a4
[0001dd76] 200c                      move.l     a4,d0
[0001dd78] 6734                      beq.s      al_make_3
[0001dd7a] 2252                      movea.l    (a2),a1
[0001dd7c] 4869 0168                 pea.l      360(a1)
[0001dd80] 43eb 003a                 lea.l      58(a3),a1
[0001dd84] 4eb9 0001 6372            jsr        wi_pos
[0001dd8a] 584f                      addq.w     #4,a7
[0001dd8c] 2897                      move.l     (a7),(a4)
[0001dd8e] 274c 0012                 move.l     a4,18(a3)
[0001dd92] 204c                      movea.l    a4,a0
[0001dd94] 4eb9 0001 de40            jsr        set_alert
[0001dd9a] 204c                      movea.l    a4,a0
[0001dd9c] 226c 000c                 movea.l    12(a4),a1
[0001dda0] 4e91                      jsr        (a1)
[0001dda2] 4a40                      tst.w      d0
[0001dda4] 670c                      beq.s      al_make_2
[0001dda6] 204c                      movea.l    a4,a0
[0001dda8] 4eb9 0001 e00a            jsr        term
al_make_3:
[0001ddae] 91c8                      suba.l     a0,a0
[0001ddb0] 6002                      bra.s      al_make_4
al_make_2:
[0001ddb2] 204c                      movea.l    a4,a0
al_make_4:
[0001ddb4] 584f                      addq.w     #4,a7
[0001ddb6] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001ddba] 4e75                      rts

al_service:
[0001ddbc] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001ddc0] 2448                      movea.l    a0,a2
[0001ddc2] 3600                      move.w     d0,d3
[0001ddc4] 2849                      movea.l    a1,a4
[0001ddc6] 2650                      movea.l    (a0),a3
[0001ddc8] 5540                      subq.w     #2,d0
[0001ddca] 6708                      beq.s      al_service_1
[0001ddcc] 907c 270e                 sub.w      #$270E,d0
[0001ddd0] 6712                      beq.s      al_service_2
[0001ddd2] 601e                      bra.s      al_service_3
al_service_1:
[0001ddd4] 204a                      movea.l    a2,a0
[0001ddd6] 6100 fedc                 bsr        acc_alert
[0001ddda] 204a                      movea.l    a2,a0
[0001dddc] 4eb9 0001 e00a            jsr        term
[0001dde2] 601c                      bra.s      al_service_4
al_service_2:
[0001dde4] 226b 0004                 movea.l    4(a3),a1
[0001dde8] 204a                      movea.l    a2,a0
[0001ddea] 4eb9 0001 60ea            jsr        new_name
[0001ddf0] 600e                      bra.s      al_service_4
al_service_3:
[0001ddf2] 224c                      movea.l    a4,a1
[0001ddf4] 3003                      move.w     d3,d0
[0001ddf6] 204a                      movea.l    a2,a0
[0001ddf8] 4eb9 0005 9dd0            jsr        Awi_service
[0001ddfe] 6002                      bra.s      al_service_5
al_service_4:
[0001de00] 7001                      moveq.l    #1,d0
al_service_5:
[0001de02] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001de06] 4e75                      rts

find_brk:
[0001de08] 5348                      subq.w     #1,a0
find_brk_2:
[0001de0a] 5248                      addq.w     #1,a0
[0001de0c] 1010                      move.b     (a0),d0
[0001de0e] 670c                      beq.s      find_brk_1
[0001de10] b03c 007c                 cmp.b      #$7C,d0
[0001de14] 6706                      beq.s      find_brk_1
[0001de16] b03c 005d                 cmp.b      #$5D,d0
[0001de1a] 66ee                      bne.s      find_brk_2
find_brk_1:
[0001de1c] 1010                      move.b     (a0),d0
[0001de1e] 670e                      beq.s      find_brk_3
[0001de20] b03c 005d                 cmp.b      #$5D,d0
[0001de24] 6608                      bne.s      find_brk_3
[0001de26] 0c28 005b ffff            cmpi.b     #$5B,-1(a0)
[0001de2c] 67dc                      beq.s      find_brk_2
find_brk_3:
[0001de2e] 0c10 007c                 cmpi.b     #$7C,(a0)
[0001de32] 6604                      bne.s      find_brk_4
[0001de34] 7001                      moveq.l    #1,d0
[0001de36] 6002                      bra.s      find_brk_5
find_brk_4:
[0001de38] 4240                      clr.w      d0
find_brk_5:
[0001de3a] 3280                      move.w     d0,(a1)
[0001de3c] 4210                      clr.b      (a0)
[0001de3e] 4e75                      rts

set_alert:
[0001de40] 48e7 003c                 movem.l    a2-a5,-(a7)
[0001de44] 4fef fefe                 lea.l      -258(a7),a7
[0001de48] 2848                      movea.l    a0,a4
[0001de4a] 2650                      movea.l    (a0),a3
[0001de4c] 246c 0014                 movea.l    20(a4),a2
[0001de50] 226b 0004                 movea.l    4(a3),a1
[0001de54] 2269 0004                 movea.l    4(a1),a1
[0001de58] 41ef 0002                 lea.l      2(a7),a0
[0001de5c] 4eb9 0008 2f0c            jsr        strcpy
[0001de62] 41f9 000a d346            lea.l      IM_NONE,a0
[0001de68] 102f 0003                 move.b     3(a7),d0
[0001de6c] 4880                      ext.w      d0
[0001de6e] 907c 0030                 sub.w      #$0030,d0
[0001de72] b07c 0004                 cmp.w      #$0004,d0
[0001de76] 6240                      bhi.s      set_alert_1
[0001de78] d040                      add.w      d0,d0
[0001de7a] 303b 0006                 move.w     $0001DE82(pc,d0.w),d0
[0001de7e] 4efb 0002                 jmp        $0001DE82(pc,d0.w)
J8:
[0001de82] 000a                      dc.w $000a   ; set_alert_2-J8
[0001de84] 0010                      dc.w $0010   ; set_alert_3-J8
[0001de86] 001a                      dc.w $001a   ; set_alert_4-J8
[0001de88] 0024                      dc.w $0024   ; set_alert_5-J8
[0001de8a] 002e                      dc.w $002e   ; set_alert_6-J8
set_alert_2:
[0001de8c] 2548 003c                 move.l     a0,60(a2)
[0001de90] 6026                      bra.s      set_alert_1
set_alert_3:
[0001de92] 257c 000a d2b8 003c       move.l     #IM_EXCLAM,60(a2)
[0001de9a] 601c                      bra.s      set_alert_1
set_alert_4:
[0001de9c] 257c 000a d3d4 003c       move.l     #IM_QUEST,60(a2)
[0001dea4] 6012                      bra.s      set_alert_1
set_alert_5:
[0001dea6] 257c 000a d462 003c       move.l     #IM_STOP,60(a2)
[0001deae] 6008                      bra.s      set_alert_1
set_alert_6:
[0001deb0] 257c 000a d4ec 003c       move.l     #IM_TIME,60(a2)
set_alert_1:
[0001deb8] 7004                      moveq.l    #4,d0
[0001deba] 224a                      movea.l    a2,a1
[0001debc] 204c                      movea.l    a4,a0
[0001debe] 4eb9 0003 0b9a            jsr        oe_beself
[0001dec4] 7005                      moveq.l    #5,d0
[0001dec6] 224a                      movea.l    a2,a1
[0001dec8] 204c                      movea.l    a4,a0
[0001deca] 4eb9 0003 0b9a            jsr        oe_beself
[0001ded0] 7006                      moveq.l    #6,d0
[0001ded2] 224a                      movea.l    a2,a1
[0001ded4] 204c                      movea.l    a4,a0
[0001ded6] 4eb9 0003 0b9a            jsr        oe_beself
[0001dedc] 7007                      moveq.l    #7,d0
[0001dede] 224a                      movea.l    a2,a1
[0001dee0] 204c                      movea.l    a4,a0
[0001dee2] 4eb9 0003 0b9a            jsr        oe_beself
[0001dee8] 7008                      moveq.l    #8,d0
[0001deea] 224a                      movea.l    a2,a1
[0001deec] 204c                      movea.l    a4,a0
[0001deee] 4eb9 0003 0b9a            jsr        oe_beself
[0001def4] 7009                      moveq.l    #9,d0
[0001def6] 224a                      movea.l    a2,a1
[0001def8] 204c                      movea.l    a4,a0
[0001defa] 4eb9 0003 0b9a            jsr        oe_beself
[0001df00] 700a                      moveq.l    #10,d0
[0001df02] 224a                      movea.l    a2,a1
[0001df04] 204c                      movea.l    a4,a0
[0001df06] 4eb9 0003 0b9a            jsr        oe_beself
[0001df0c] 700b                      moveq.l    #11,d0
[0001df0e] 224a                      movea.l    a2,a1
[0001df10] 204c                      movea.l    a4,a0
[0001df12] 4eb9 0003 0b9a            jsr        oe_beself
[0001df18] 47ef 0006                 lea.l      6(a7),a3
[0001df1c] 43d7                      lea.l      (a7),a1
[0001df1e] 204b                      movea.l    a3,a0
[0001df20] 6100 fee6                 bsr        find_brk
[0001df24] 2a48                      movea.l    a0,a5
[0001df26] 224b                      movea.l    a3,a1
[0001df28] 7004                      moveq.l    #4,d0
[0001df2a] 204a                      movea.l    a2,a0
[0001df2c] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001df32] 3017                      move.w     (a7),d0
[0001df34] 6774                      beq.s      set_alert_7
[0001df36] 47ed 0001                 lea.l      1(a5),a3
[0001df3a] 43d7                      lea.l      (a7),a1
[0001df3c] 204b                      movea.l    a3,a0
[0001df3e] 6100 fec8                 bsr        find_brk
[0001df42] 2a48                      movea.l    a0,a5
[0001df44] 224b                      movea.l    a3,a1
[0001df46] 7005                      moveq.l    #5,d0
[0001df48] 204a                      movea.l    a2,a0
[0001df4a] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001df50] 3017                      move.w     (a7),d0
[0001df52] 6756                      beq.s      set_alert_7
[0001df54] 47ed 0001                 lea.l      1(a5),a3
[0001df58] 43d7                      lea.l      (a7),a1
[0001df5a] 204b                      movea.l    a3,a0
[0001df5c] 6100 feaa                 bsr        find_brk
[0001df60] 2a48                      movea.l    a0,a5
[0001df62] 224b                      movea.l    a3,a1
[0001df64] 7006                      moveq.l    #6,d0
[0001df66] 204a                      movea.l    a2,a0
[0001df68] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001df6e] 3017                      move.w     (a7),d0
[0001df70] 6738                      beq.s      set_alert_7
[0001df72] 47ed 0001                 lea.l      1(a5),a3
[0001df76] 43d7                      lea.l      (a7),a1
[0001df78] 204b                      movea.l    a3,a0
[0001df7a] 6100 fe8c                 bsr        find_brk
[0001df7e] 2a48                      movea.l    a0,a5
[0001df80] 224b                      movea.l    a3,a1
[0001df82] 7007                      moveq.l    #7,d0
[0001df84] 204a                      movea.l    a2,a0
[0001df86] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001df8c] 3017                      move.w     (a7),d0
[0001df8e] 671a                      beq.s      set_alert_7
[0001df90] 47ed 0001                 lea.l      1(a5),a3
[0001df94] 43d7                      lea.l      (a7),a1
[0001df96] 204b                      movea.l    a3,a0
[0001df98] 6100 fe6e                 bsr        find_brk
[0001df9c] 2a48                      movea.l    a0,a5
[0001df9e] 224b                      movea.l    a3,a1
[0001dfa0] 7008                      moveq.l    #8,d0
[0001dfa2] 204a                      movea.l    a2,a0
[0001dfa4] 4eb9 0005 0fd8            jsr        Aob_puttext
set_alert_7:
[0001dfaa] 47ed 0002                 lea.l      2(a5),a3
[0001dfae] 43d7                      lea.l      (a7),a1
[0001dfb0] 204b                      movea.l    a3,a0
[0001dfb2] 6100 fe54                 bsr        find_brk
[0001dfb6] 2a48                      movea.l    a0,a5
[0001dfb8] 224b                      movea.l    a3,a1
[0001dfba] 7009                      moveq.l    #9,d0
[0001dfbc] 204a                      movea.l    a2,a0
[0001dfbe] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001dfc4] 3017                      move.w     (a7),d0
[0001dfc6] 6738                      beq.s      set_alert_8
[0001dfc8] 47ed 0001                 lea.l      1(a5),a3
[0001dfcc] 43d7                      lea.l      (a7),a1
[0001dfce] 204b                      movea.l    a3,a0
[0001dfd0] 6100 fe36                 bsr        find_brk
[0001dfd4] 2a48                      movea.l    a0,a5
[0001dfd6] 224b                      movea.l    a3,a1
[0001dfd8] 700a                      moveq.l    #10,d0
[0001dfda] 204a                      movea.l    a2,a0
[0001dfdc] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001dfe2] 3017                      move.w     (a7),d0
[0001dfe4] 671a                      beq.s      set_alert_8
[0001dfe6] 47ed 0001                 lea.l      1(a5),a3
[0001dfea] 43d7                      lea.l      (a7),a1
[0001dfec] 204b                      movea.l    a3,a0
[0001dfee] 6100 fe18                 bsr        find_brk
[0001dff2] 2a48                      movea.l    a0,a5
[0001dff4] 224b                      movea.l    a3,a1
[0001dff6] 700b                      moveq.l    #11,d0
[0001dff8] 204a                      movea.l    a2,a0
[0001dffa] 4eb9 0005 0fd8            jsr        Aob_puttext
set_alert_8:
[0001e000] 4fef 0102                 lea.l      258(a7),a7
[0001e004] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0001e008] 4e75                      rts

term:
[0001e00a] 2f0a                      move.l     a2,-(a7)
[0001e00c] 2f0b                      move.l     a3,-(a7)
[0001e00e] 2448                      movea.l    a0,a2
[0001e010] 2650                      movea.l    (a0),a3
[0001e012] 226b 0004                 movea.l    4(a3),a1
[0001e016] 42a9 0012                 clr.l      18(a1)
[0001e01a] 302a 0056                 move.w     86(a2),d0
[0001e01e] c07c 0800                 and.w      #$0800,d0
[0001e022] 6716                      beq.s      term_1
[0001e024] 43ea 002c                 lea.l      44(a2),a1
[0001e028] 206b 0004                 movea.l    4(a3),a0
[0001e02c] 41e8 003a                 lea.l      58(a0),a0
[0001e030] 7008                      moveq.l    #8,d0
[0001e032] 4eb9 0008 3500            jsr        memcpy
[0001e038] 6014                      bra.s      term_2
term_1:
[0001e03a] 7008                      moveq.l    #8,d0
[0001e03c] 43ea 0024                 lea.l      36(a2),a1
[0001e040] 206b 0004                 movea.l    4(a3),a0
[0001e044] 41e8 003a                 lea.l      58(a0),a0
[0001e048] 4eb9 0008 3500            jsr        memcpy
term_2:
[0001e04e] 204b                      movea.l    a3,a0
[0001e050] 4eb9 0004 c7c8            jsr        Ax_free
[0001e056] 204a                      movea.l    a2,a0
[0001e058] 4eb9 0005 85f2            jsr        Awi_delete
[0001e05e] 265f                      movea.l    (a7)+,a3
[0001e060] 245f                      movea.l    (a7)+,a2
[0001e062] 4e75                      rts

	.data

BUBBLE_01:
[000acb86]                           dc.b 'Die énderungen werden Åbernommen.',0
BUBBLE_02:
[000acba8]                           dc.b 'Die énderungen werden verworfen.',0
BUBBLE_03:
[000acbc9]                           dc.b 'Hier kann die Alertbox getestet werden.',0
TEXT_001:
[000acbf1]                           dc.b 'Abbruch',0
TEXT_002:
[000acbf9]                           dc.b $00
TEXT_003:
[000acbfa]                           dc.w $4f4b
[000acbfc]                           dc.w $0050
[000acbfe]                           dc.b 'robe',0
TEXT_01:
[000acc03]                           dc.b ' Alertbox-Editor ',0
TEXT_08:
[000acc15]                           dc.b 'ALERT-BOX',0
[000acc1f]                           dc.b $00
DATAS_05:
[000acc20]                           dc.w $0000
[000acc22]                           dc.w $0000
[000acc24]                           dc.w $02f0
[000acc26]                           dc.w $0000
[000acc28]                           dc.w $0000
[000acc2a]                           dc.w $0000
[000acc2c]                           dc.w $7fff
[000acc2e]                           dc.w $ffff
[000acc30]                           dc.w $fffe
[000acc32]                           dc.w $4000
[000acc34]                           dc.w $0000
[000acc36]                           dc.w $0002
[000acc38]                           dc.w $5fff
[000acc3a]                           dc.w $ffff
[000acc3c]                           dc.w $fffa
[000acc3e]                           dc.w $5fff
[000acc40]                           dc.w $ffff
[000acc42]                           dc.w $fffa
[000acc44]                           dc.w $5fff
[000acc46]                           dc.w $ffff
[000acc48]                           dc.w $fffa
[000acc4a]                           dc.w $5fff
[000acc4c]                           dc.w $ffff
[000acc4e]                           dc.w $fffa
[000acc50]                           dc.w $5fff
[000acc52]                           dc.w $ffff
[000acc54]                           dc.w $fffa
[000acc56]                           dc.w $5fff
[000acc58]                           dc.w $ffff
[000acc5a]                           dc.w $fffa
[000acc5c]                           dc.w $5fff
[000acc5e]                           dc.w $ffff
[000acc60]                           dc.w $fffa
[000acc62]                           dc.w $5fff
[000acc64]                           dc.w $ffff
[000acc66]                           dc.w $fffa
[000acc68]                           dc.w $5fff
[000acc6a]                           dc.w $ffff
[000acc6c]                           dc.w $fffa
[000acc6e]                           dc.w $5fff
[000acc70]                           dc.w $ffff
[000acc72]                           dc.w $fffa
[000acc74]                           dc.w $5fff
[000acc76]                           dc.w $ffff
[000acc78]                           dc.w $fffa
[000acc7a]                           dc.w $5fff
[000acc7c]                           dc.w $ffff
[000acc7e]                           dc.w $fffa
[000acc80]                           dc.w $5fff
[000acc82]                           dc.w $ffff
[000acc84]                           dc.w $fffa
[000acc86]                           dc.w $5fff
[000acc88]                           dc.w $ffff
[000acc8a]                           dc.w $fffa
[000acc8c]                           dc.w $5fff
[000acc8e]                           dc.w $ffff
[000acc90]                           dc.w $fffa
[000acc92]                           dc.w $5fff
[000acc94]                           dc.w $ffff
[000acc96]                           dc.w $fffa
[000acc98]                           dc.w $5fff
[000acc9a]                           dc.w $ffff
[000acc9c]                           dc.w $fffa
[000acc9e]                           dc.w $5fc0
[000acca0]                           dc.w $01e0
[000acca2]                           dc.w $00fa
[000acca4]                           dc.w $5fdf
[000acca6]                           dc.w $fdef
[000acca8]                           dc.w $fefa
[000accaa]                           dc.w $5fdf
[000accac]                           dc.w $fdef
[000accae]                           dc.w $fefa
[000accb0]                           dc.w $5fdf
[000accb2]                           dc.w $fdef
[000accb4]                           dc.w $fefa
[000accb6]                           dc.w $5fc0
[000accb8]                           dc.w $01e0
[000accba]                           dc.w $00fa
[000accbc]                           dc.w $5fff
[000accbe]                           dc.w $ffff
[000accc0]                           dc.w $fffa
[000accc2]                           dc.w $5fff
[000accc4]                           dc.w $ffff
[000accc6]                           dc.w $fffa
[000accc8]                           dc.w $5fff
[000accca]                           dc.w $ffff
[000acccc]                           dc.w $fffa
[000accce]                           dc.w $4000
[000accd0]                           dc.w $0000
[000accd2]                           dc.w $0002
[000accd4]                           dc.w $7fff
[000accd6]                           dc.w $ffff
[000accd8]                           dc.w $fffe
[000accda]                           dc.w $0000
[000accdc]                           dc.w $0000
[000accde]                           dc.w $0000
[000acce0]                           dc.w $0000
[000acce2]                           dc.w $0000
[000acce4]                           dc.w $0000
[000acce6]                           dc.w $7fff
[000acce8]                           dc.w $ffff
[000accea]                           dc.w $fffe
[000accec]                           dc.w $4000
[000accee]                           dc.w $0000
[000accf0]                           dc.w $0002
[000accf2]                           dc.w $5fff
[000accf4]                           dc.w $ffff
[000accf6]                           dc.w $fffa
[000accf8]                           dc.w $5fff
[000accfa]                           dc.w $ffff
[000accfc]                           dc.w $fffa
[000accfe]                           dc.w $5fff
[000acd00]                           dc.w $ffff
[000acd02]                           dc.w $fffa
[000acd04]                           dc.w $5f3f
[000acd06]                           dc.w $ffff
[000acd08]                           dc.w $fffa
[000acd0a]                           dc.w $5e1f
[000acd0c]                           dc.w $ffff
[000acd0e]                           dc.w $fffa
[000acd10]                           dc.w $5e1f
[000acd12]                           dc.w $ffff
[000acd14]                           dc.w $fffa
[000acd16]                           dc.w $5e1f
[000acd18]                           dc.w $ffff
[000acd1a]                           dc.w $fffa
[000acd1c]                           dc.w $5e1f
[000acd1e]                           dc.w $ffff
[000acd20]                           dc.w $fffa
[000acd22]                           dc.w $5e1f
[000acd24]                           dc.w $ffff
[000acd26]                           dc.w $fffa
[000acd28]                           dc.w $5f3f
[000acd2a]                           dc.w $ffff
[000acd2c]                           dc.w $fffa
[000acd2e]                           dc.w $5fff
[000acd30]                           dc.w $ffff
[000acd32]                           dc.w $fffa
[000acd34]                           dc.w $5f3f
[000acd36]                           dc.w $ffff
[000acd38]                           dc.w $fffa
[000acd3a]                           dc.w $5e1f
[000acd3c]                           dc.w $ffff
[000acd3e]                           dc.w $fffa
[000acd40]                           dc.w $5e1f
[000acd42]                           dc.w $ffff
[000acd44]                           dc.w $fffa
[000acd46]                           dc.w $5f3f
[000acd48]                           dc.w $ffff
[000acd4a]                           dc.w $fffa
[000acd4c]                           dc.w $5fff
[000acd4e]                           dc.w $ffff
[000acd50]                           dc.w $fffa
[000acd52]                           dc.w $5fff
[000acd54]                           dc.w $ffff
[000acd56]                           dc.w $fffa
[000acd58]                           dc.w $5fc0
[000acd5a]                           dc.w $01e0
[000acd5c]                           dc.w $00fa
[000acd5e]                           dc.w $5fdf
[000acd60]                           dc.w $fdef
[000acd62]                           dc.w $fefa
[000acd64]                           dc.w $5fdf
[000acd66]                           dc.w $fdef
[000acd68]                           dc.w $fefa
[000acd6a]                           dc.w $5fdf
[000acd6c]                           dc.w $fdef
[000acd6e]                           dc.w $fefa
[000acd70]                           dc.w $5fc0
[000acd72]                           dc.w $01e0
[000acd74]                           dc.w $00fa
[000acd76]                           dc.w $5fff
[000acd78]                           dc.w $ffff
[000acd7a]                           dc.w $fffa
[000acd7c]                           dc.w $5fff
[000acd7e]                           dc.w $ffff
[000acd80]                           dc.w $fffa
[000acd82]                           dc.w $5fff
[000acd84]                           dc.w $ffff
[000acd86]                           dc.w $fffa
[000acd88]                           dc.w $4000
[000acd8a]                           dc.w $0000
[000acd8c]                           dc.w $0002
[000acd8e]                           dc.w $7fff
[000acd90]                           dc.w $ffff
[000acd92]                           dc.w $fffe
[000acd94]                           dc.w $0000
[000acd96]                           dc.w $0000
[000acd98]                           dc.w $0000
[000acd9a]                           dc.w $0000
[000acd9c]                           dc.w $0000
[000acd9e]                           dc.w $0000
[000acda0]                           dc.w $7fff
[000acda2]                           dc.w $ffff
[000acda4]                           dc.w $fffe
[000acda6]                           dc.w $4000
[000acda8]                           dc.w $0000
[000acdaa]                           dc.w $0002
[000acdac]                           dc.w $5fff
[000acdae]                           dc.w $ffff
[000acdb0]                           dc.w $fffa
[000acdb2]                           dc.w $5fff
[000acdb4]                           dc.w $ffff
[000acdb6]                           dc.w $fffa
[000acdb8]                           dc.w $5fff
[000acdba]                           dc.w $ffff
[000acdbc]                           dc.w $fffa
[000acdbe]                           dc.w $5f3f
[000acdc0]                           dc.w $ffff
[000acdc2]                           dc.w $fffa
[000acdc4]                           dc.w $5e1f
[000acdc6]                           dc.w $ffff
[000acdc8]                           dc.w $fffa
[000acdca]                           dc.w $5e1f
[000acdcc]                           dc.w $ffff
[000acdce]                           dc.w $fffa
[000acdd0]                           dc.w $5e1f
[000acdd2]                           dc.w $ffff
[000acdd4]                           dc.w $fffa
[000acdd6]                           dc.w $5e1f
[000acdd8]                           dc.w $ffff
[000acdda]                           dc.w $fffa
[000acddc]                           dc.w $5e1f
[000acdde]                           dc.w $ffff
[000acde0]                           dc.w $fffa
[000acde2]                           dc.w $5f3f
[000acde4]                           dc.w $ffff
[000acde6]                           dc.w $fffa
[000acde8]                           dc.w $5fff
[000acdea]                           dc.w $ffff
[000acdec]                           dc.w $fffa
[000acdee]                           dc.w $5f3f
[000acdf0]                           dc.w $ffff
[000acdf2]                           dc.w $fffa
[000acdf4]                           dc.w $5e1f
[000acdf6]                           dc.w $ffff
[000acdf8]                           dc.w $fffa
[000acdfa]                           dc.w $5e1f
[000acdfc]                           dc.w $ffff
[000acdfe]                           dc.w $fffa
[000ace00]                           dc.w $5f3f
[000ace02]                           dc.w $ffff
[000ace04]                           dc.w $fffa
[000ace06]                           dc.w $5fff
[000ace08]                           dc.w $ffff
[000ace0a]                           dc.w $fffa
[000ace0c]                           dc.w $5fff
[000ace0e]                           dc.w $ffff
[000ace10]                           dc.w $fffa
[000ace12]                           dc.w $5fc0
[000ace14]                           dc.w $01e0
[000ace16]                           dc.w $00fa
[000ace18]                           dc.w $5fdf
[000ace1a]                           dc.w $fdef
[000ace1c]                           dc.w $fefa
[000ace1e]                           dc.w $5fdf
[000ace20]                           dc.w $fdef
[000ace22]                           dc.w $fefa
[000ace24]                           dc.w $5fdf
[000ace26]                           dc.w $fdef
[000ace28]                           dc.w $fefa
[000ace2a]                           dc.w $5fc0
[000ace2c]                           dc.w $01e0
[000ace2e]                           dc.w $00fa
[000ace30]                           dc.w $5fff
[000ace32]                           dc.w $ffff
[000ace34]                           dc.w $fffa
[000ace36]                           dc.w $5fff
[000ace38]                           dc.w $ffff
[000ace3a]                           dc.w $fffa
[000ace3c]                           dc.w $5fff
[000ace3e]                           dc.w $ffff
[000ace40]                           dc.w $fffa
[000ace42]                           dc.w $4000
[000ace44]                           dc.w $0000
[000ace46]                           dc.w $0002
[000ace48]                           dc.w $7fff
[000ace4a]                           dc.w $ffff
[000ace4c]                           dc.w $fffe
[000ace4e]                           dc.w $0000
[000ace50]                           dc.w $0000
[000ace52]                           dc.w $0000
[000ace54]                           dc.w $0000
[000ace56]                           dc.w $0000
[000ace58]                           dc.w $0000
[000ace5a]                           dc.w $7fff
[000ace5c]                           dc.w $ffff
[000ace5e]                           dc.w $fffe
[000ace60]                           dc.w $4000
[000ace62]                           dc.w $0000
[000ace64]                           dc.w $0006
[000ace66]                           dc.w $4000
[000ace68]                           dc.w $0000
[000ace6a]                           dc.w $0006
[000ace6c]                           dc.w $4000
[000ace6e]                           dc.w $0000
[000ace70]                           dc.w $0006
[000ace72]                           dc.w $4000
[000ace74]                           dc.w $0000
[000ace76]                           dc.w $0006
[000ace78]                           dc.w $4000
[000ace7a]                           dc.w $0000
[000ace7c]                           dc.w $0006
[000ace7e]                           dc.w $4000
[000ace80]                           dc.w $f3cf
[000ace82]                           dc.w $cfc6
[000ace84]                           dc.w $4000
[000ace86]                           dc.w $0000
[000ace88]                           dc.w $0006
[000ace8a]                           dc.w $4000
[000ace8c]                           dc.w $0000
[000ace8e]                           dc.w $0006
[000ace90]                           dc.w $4000
[000ace92]                           dc.w $fcfc
[000ace94]                           dc.w $e706
[000ace96]                           dc.w $4000
[000ace98]                           dc.w $0000
[000ace9a]                           dc.w $0006
[000ace9c]                           dc.w $4000
[000ace9e]                           dc.w $0000
[000acea0]                           dc.w $0006
[000acea2]                           dc.w $4000
[000acea4]                           dc.w $f3f3
[000acea6]                           dc.w $f386
[000acea8]                           dc.w $4000
[000aceaa]                           dc.w $0000
[000aceac]                           dc.w $0006
[000aceae]                           dc.w $4000
[000aceb0]                           dc.w $0000
[000aceb2]                           dc.w $0006
[000aceb4]                           dc.w $4000
[000aceb6]                           dc.w $fcfc
[000aceb8]                           dc.w $f006
[000aceba]                           dc.w $4000
[000acebc]                           dc.w $0000
[000acebe]                           dc.w $0006
[000acec0]                           dc.w $4000
[000acec2]                           dc.w $0000
[000acec4]                           dc.w $0006
[000acec6]                           dc.w $4000
[000acec8]                           dc.w $0000
[000aceca]                           dc.w $0006
[000acecc]                           dc.w $4000
[000acece]                           dc.w $0200
[000aced0]                           dc.w $0106
[000aced2]                           dc.w $4000
[000aced4]                           dc.w $0200
[000aced6]                           dc.w $0106
[000aced8]                           dc.w $4007
[000aceda]                           dc.w $f203
[000acedc]                           dc.w $f906
[000acede]                           dc.w $4000
[000acee0]                           dc.w $0200
[000acee2]                           dc.w $0106
[000acee4]                           dc.w $403f
[000acee6]                           dc.w $fe1f
[000acee8]                           dc.w $ff06
[000aceea]                           dc.w $4000
[000aceec]                           dc.w $0000
[000aceee]                           dc.w $0006
[000acef0]                           dc.w $4000
[000acef2]                           dc.w $0000
[000acef4]                           dc.w $0006
[000acef6]                           dc.w $4000
[000acef8]                           dc.w $0000
[000acefa]                           dc.w $0006
[000acefc]                           dc.w $7fff
[000acefe]                           dc.w $ffff
[000acf00]                           dc.w $fffe
[000acf02]                           dc.w $7fff
[000acf04]                           dc.w $ffff
[000acf06]                           dc.w $fffe
[000acf08]                           dc.w $0000
[000acf0a]                           dc.w $0000
[000acf0c]                           dc.w $0000
DATAS_06:
[000acf0e]                           dc.w $0000
[000acf10]                           dc.w $0000
[000acf12]                           dc.w $0000
[000acf14]                           dc.w $7fff
[000acf16]                           dc.w $ffff
[000acf18]                           dc.w $fffe
[000acf1a]                           dc.w $7fff
[000acf1c]                           dc.w $ffff
[000acf1e]                           dc.w $fffe
[000acf20]                           dc.w $7fff
[000acf22]                           dc.w $ffff
[000acf24]                           dc.w $fffe
[000acf26]                           dc.w $7fff
[000acf28]                           dc.w $ffff
[000acf2a]                           dc.w $fffe
[000acf2c]                           dc.w $7fff
[000acf2e]                           dc.w $ffff
[000acf30]                           dc.w $fffe
[000acf32]                           dc.w $7fff
[000acf34]                           dc.w $ffff
[000acf36]                           dc.w $fffe
[000acf38]                           dc.w $7fff
[000acf3a]                           dc.w $ffff
[000acf3c]                           dc.w $fffe
[000acf3e]                           dc.w $7fff
[000acf40]                           dc.w $ffff
[000acf42]                           dc.w $fffe
[000acf44]                           dc.w $7fff
[000acf46]                           dc.w $ffff
[000acf48]                           dc.w $fffe
[000acf4a]                           dc.w $7fff
[000acf4c]                           dc.w $ffff
[000acf4e]                           dc.w $fffe
[000acf50]                           dc.w $7fff
[000acf52]                           dc.w $ffff
[000acf54]                           dc.w $fffe
[000acf56]                           dc.w $7fff
[000acf58]                           dc.w $ffff
[000acf5a]                           dc.w $fffe
[000acf5c]                           dc.w $7fff
[000acf5e]                           dc.w $ffff
[000acf60]                           dc.w $fffe
[000acf62]                           dc.w $7fff
[000acf64]                           dc.w $ffff
[000acf66]                           dc.w $fffe
[000acf68]                           dc.w $7fff
[000acf6a]                           dc.w $ffff
[000acf6c]                           dc.w $fffe
[000acf6e]                           dc.w $7fff
[000acf70]                           dc.w $ffff
[000acf72]                           dc.w $fffe
[000acf74]                           dc.w $7fff
[000acf76]                           dc.w $ffff
[000acf78]                           dc.w $fffe
[000acf7a]                           dc.w $7fff
[000acf7c]                           dc.w $ffff
[000acf7e]                           dc.w $fffe
[000acf80]                           dc.w $7fff
[000acf82]                           dc.w $ffff
[000acf84]                           dc.w $fffe
[000acf86]                           dc.w $7fff
[000acf88]                           dc.w $ffff
[000acf8a]                           dc.w $fffe
[000acf8c]                           dc.w $7fff
[000acf8e]                           dc.w $ffff
[000acf90]                           dc.w $fffe
[000acf92]                           dc.w $7fff
[000acf94]                           dc.w $ffff
[000acf96]                           dc.w $fffe
[000acf98]                           dc.w $7fff
[000acf9a]                           dc.w $ffff
[000acf9c]                           dc.w $fffe
[000acf9e]                           dc.w $7fff
[000acfa0]                           dc.w $ffff
[000acfa2]                           dc.w $fffe
[000acfa4]                           dc.w $7fff
[000acfa6]                           dc.w $ffff
[000acfa8]                           dc.w $fffe
[000acfaa]                           dc.w $7fff
[000acfac]                           dc.w $ffff
[000acfae]                           dc.w $fffe
[000acfb0]                           dc.w $7fff
[000acfb2]                           dc.w $ffff
[000acfb4]                           dc.w $fffe
[000acfb6]                           dc.w $7fff
[000acfb8]                           dc.w $ffff
[000acfba]                           dc.w $fffe
[000acfbc]                           dc.w $7fff
[000acfbe]                           dc.w $ffff
[000acfc0]                           dc.w $fffe
[000acfc2]                           dc.w $0000
[000acfc4]                           dc.w $0000
[000acfc6]                           dc.w $0000
A_3DBUTTON01:
[000acfc8] 00064a22                  dc.l A_3Dbutton
[000acfcc]                           dc.w $29c1
[000acfce]                           dc.w $0178
[000acfd0] 000630f2                  dc.l Auo_string
[000acfd4] 000acbfd                  dc.l TEXT_004
[000acfd8]                           dc.w $0000
[000acfda]                           dc.w $0000
[000acfdc]                           dc.w $0000
[000acfde]                           dc.w $0000
[000acfe0] 000acbc9                  dc.l BUBBLE_03
[000acfe4]                           dc.w $0000
[000acfe6]                           dc.w $0000
A_3DBUTTON02:
[000acfe8] 00064a22                  dc.l A_3Dbutton
[000acfec]                           dc.w $29f1
[000acfee]                           dc.w $0178
[000acff0] 000630f2                  dc.l Auo_string
[000acff4]                           dc.w $0000
[000acff6]                           dc.w $0000
[000acff8]                           dc.w $0000
[000acffa]                           dc.w $0000
[000acffc]                           dc.w $0000
[000acffe]                           dc.w $0000
[000ad000]                           dc.w $0000
[000ad002]                           dc.w $0000
[000ad004]                           dc.w $0000
[000ad006]                           dc.w $0000
A_3DBUTTON04:
[000ad008] 00064a22                  dc.l A_3Dbutton
[000ad00c]                           dc.w $29c1
[000ad00e]                           dc.w $0178
[000ad010] 000630f2                  dc.l Auo_string
[000ad014] 000acbfa                  dc.l TEXT_003
[000ad018]                           dc.w $0000
[000ad01a]                           dc.w $0000
[000ad01c]                           dc.w $0000
[000ad01e]                           dc.w $0000
[000ad020] 000acb86                  dc.l BUBBLE_01
[000ad024]                           dc.w $0000
[000ad026]                           dc.w $0000
A_3DBUTTON05:
[000ad028] 00064a22                  dc.l A_3Dbutton
[000ad02c]                           dc.w $29c1
[000ad02e]                           dc.w $0178
[000ad030] 000630f2                  dc.l Auo_string
[000ad034] 000acbf1                  dc.l TEXT_001
[000ad038]                           dc.w $0000
[000ad03a]                           dc.w $0000
[000ad03c]                           dc.w $0000
[000ad03e]                           dc.w $0000
[000ad040] 000acba8                  dc.l BUBBLE_02
[000ad044]                           dc.w $0000
[000ad046]                           dc.w $0000
A_BOXED01:
[000ad048] 0006afea                  dc.l A_boxed
[000ad04c]                           dc.w $9038
[000ad04e]                           dc.w $1e12
[000ad050] 0006a068                  dc.l Auo_boxed
[000ad054]                           dc.w $0000
[000ad056]                           dc.w $0000
[000ad058]                           dc.w $0000
[000ad05a]                           dc.w $0000
[000ad05c]                           dc.w $0000
[000ad05e]                           dc.w $0000
[000ad060]                           dc.w $0000
[000ad062]                           dc.w $0000
[000ad064]                           dc.w $0000
[000ad066]                           dc.w $0000
A_BOXED03:
[000ad068] 0006afea                  dc.l A_boxed
[000ad06c]                           dc.w $1138
[000ad06e]                           dc.w $0a12
[000ad070] 0006a068                  dc.l Auo_boxed
[000ad074]                           dc.w $0000
[000ad076]                           dc.w $0000
[000ad078]                           dc.w $0000
[000ad07a]                           dc.w $0000
[000ad07c]                           dc.w $0000
[000ad07e]                           dc.w $0000
[000ad080]                           dc.w $0000
[000ad082]                           dc.w $0000
[000ad084]                           dc.w $0000
[000ad086]                           dc.w $0000
_C4_IC_ALERT:
[000ad088]                           dc.w $0004
[000ad08a] 000acc26                  dc.l $000acc26
[000ad08e] 000acf0e                  dc.l DATAS_06
[000ad092]                           dc.w $0000
[000ad094]                           dc.w $0000
[000ad096]                           dc.w $0000
[000ad098]                           dc.w $0000
[000ad09a]                           dc.w $0000
[000ad09c]                           dc.w $0000
_MSK_IC_ALERT:
[000ad09e]                           dc.w $0000
[000ad0a0]                           dc.w $0000
[000ad0a2]                           dc.w $0000
[000ad0a4]                           dc.w $7fff
[000ad0a6]                           dc.w $ffff
[000ad0a8]                           dc.w $fffe
[000ad0aa]                           dc.w $7fff
[000ad0ac]                           dc.w $ffff
[000ad0ae]                           dc.w $fffe
[000ad0b0]                           dc.w $7fff
[000ad0b2]                           dc.w $ffff
[000ad0b4]                           dc.w $fffe
[000ad0b6]                           dc.w $7fff
[000ad0b8]                           dc.w $ffff
[000ad0ba]                           dc.w $fffe
[000ad0bc]                           dc.w $7fff
[000ad0be]                           dc.w $ffff
[000ad0c0]                           dc.w $fffe
[000ad0c2]                           dc.w $7fff
[000ad0c4]                           dc.w $ffff
[000ad0c6]                           dc.w $fffe
[000ad0c8]                           dc.w $7fff
[000ad0ca]                           dc.w $ffff
[000ad0cc]                           dc.w $fffe
[000ad0ce]                           dc.w $7fff
[000ad0d0]                           dc.w $ffff
[000ad0d2]                           dc.w $fffe
[000ad0d4]                           dc.w $7fff
[000ad0d6]                           dc.w $ffff
[000ad0d8]                           dc.w $fffe
[000ad0da]                           dc.w $7fff
[000ad0dc]                           dc.w $ffff
[000ad0de]                           dc.w $fffe
[000ad0e0]                           dc.w $7fff
[000ad0e2]                           dc.w $ffff
[000ad0e4]                           dc.w $fffe
[000ad0e6]                           dc.w $7fff
[000ad0e8]                           dc.w $ffff
[000ad0ea]                           dc.w $fffe
[000ad0ec]                           dc.w $7fff
[000ad0ee]                           dc.w $ffff
[000ad0f0]                           dc.w $fffe
[000ad0f2]                           dc.w $7fff
[000ad0f4]                           dc.w $ffff
[000ad0f6]                           dc.w $fffe
[000ad0f8]                           dc.w $7fff
[000ad0fa]                           dc.w $ffff
[000ad0fc]                           dc.w $fffe
[000ad0fe]                           dc.w $7fff
[000ad100]                           dc.w $ffff
[000ad102]                           dc.w $fffe
[000ad104]                           dc.w $7fff
[000ad106]                           dc.w $ffff
[000ad108]                           dc.w $fffe
[000ad10a]                           dc.w $7fff
[000ad10c]                           dc.w $ffff
[000ad10e]                           dc.w $fffe
[000ad110]                           dc.w $7fff
[000ad112]                           dc.w $ffff
[000ad114]                           dc.w $fffe
[000ad116]                           dc.w $7fff
[000ad118]                           dc.w $ffff
[000ad11a]                           dc.w $fffe
[000ad11c]                           dc.w $7fff
[000ad11e]                           dc.w $ffff
[000ad120]                           dc.w $fffe
[000ad122]                           dc.w $7fff
[000ad124]                           dc.w $ffff
[000ad126]                           dc.w $fffe
[000ad128]                           dc.w $7fff
[000ad12a]                           dc.w $ffff
[000ad12c]                           dc.w $fffe
[000ad12e]                           dc.w $7fff
[000ad130]                           dc.w $ffff
[000ad132]                           dc.w $fffe
[000ad134]                           dc.w $7fff
[000ad136]                           dc.w $ffff
[000ad138]                           dc.w $fffe
[000ad13a]                           dc.w $7fff
[000ad13c]                           dc.w $ffff
[000ad13e]                           dc.w $fffe
[000ad140]                           dc.w $7fff
[000ad142]                           dc.w $ffff
[000ad144]                           dc.w $fffe
[000ad146]                           dc.w $7fff
[000ad148]                           dc.w $ffff
[000ad14a]                           dc.w $fffe
[000ad14c]                           dc.w $7fff
[000ad14e]                           dc.w $ffff
[000ad150]                           dc.w $fffe
[000ad152]                           dc.w $0000
[000ad154]                           dc.w $0000
[000ad156]                           dc.w $0000
_DAT_IC_ALERT:
[000ad158]                           dc.w $0000
[000ad15a]                           dc.w $0000
[000ad15c]                           dc.w $0000
[000ad15e]                           dc.w $7fff
[000ad160]                           dc.w $ffff
[000ad162]                           dc.w $fffe
[000ad164]                           dc.w $4000
[000ad166]                           dc.w $0000
[000ad168]                           dc.w $0002
[000ad16a]                           dc.w $5fff
[000ad16c]                           dc.w $ffff
[000ad16e]                           dc.w $fffa
[000ad170]                           dc.w $5fff
[000ad172]                           dc.w $ffff
[000ad174]                           dc.w $fffa
[000ad176]                           dc.w $5800
[000ad178]                           dc.w $0000
[000ad17a]                           dc.w $001a
[000ad17c]                           dc.w $58c0
[000ad17e]                           dc.w $0000
[000ad180]                           dc.w $001a
[000ad182]                           dc.w $59e0
[000ad184]                           dc.w $f3cf
[000ad186]                           dc.w $cfda
[000ad188]                           dc.w $59e0
[000ad18a]                           dc.w $0000
[000ad18c]                           dc.w $001a
[000ad18e]                           dc.w $59e0
[000ad190]                           dc.w $0000
[000ad192]                           dc.w $001a
[000ad194]                           dc.w $59e0
[000ad196]                           dc.w $fcfc
[000ad198]                           dc.w $e71a
[000ad19a]                           dc.w $59e0
[000ad19c]                           dc.w $0000
[000ad19e]                           dc.w $001a
[000ad1a0]                           dc.w $58c0
[000ad1a2]                           dc.w $0000
[000ad1a4]                           dc.w $001a
[000ad1a6]                           dc.w $5800
[000ad1a8]                           dc.w $f3f3
[000ad1aa]                           dc.w $f39a
[000ad1ac]                           dc.w $58c0
[000ad1ae]                           dc.w $0000
[000ad1b0]                           dc.w $001a
[000ad1b2]                           dc.w $59e0
[000ad1b4]                           dc.w $0000
[000ad1b6]                           dc.w $001a
[000ad1b8]                           dc.w $59e0
[000ad1ba]                           dc.w $fcfc
[000ad1bc]                           dc.w $f01a
[000ad1be]                           dc.w $58c0
[000ad1c0]                           dc.w $0000
[000ad1c2]                           dc.w $001a
[000ad1c4]                           dc.w $5800
[000ad1c6]                           dc.w $0000
[000ad1c8]                           dc.w $001a
[000ad1ca]                           dc.w $5800
[000ad1cc]                           dc.w $0000
[000ad1ce]                           dc.w $001a
[000ad1d0]                           dc.w $583f
[000ad1d2]                           dc.w $fe1f
[000ad1d4]                           dc.w $ff1a
[000ad1d6]                           dc.w $5820
[000ad1d8]                           dc.w $0210
[000ad1da]                           dc.w $011a
[000ad1dc]                           dc.w $5827
[000ad1de]                           dc.w $f213
[000ad1e0]                           dc.w $f91a
[000ad1e2]                           dc.w $5820
[000ad1e4]                           dc.w $0210
[000ad1e6]                           dc.w $011a
[000ad1e8]                           dc.w $583f
[000ad1ea]                           dc.w $fe1f
[000ad1ec]                           dc.w $ff1a
[000ad1ee]                           dc.w $5800
[000ad1f0]                           dc.w $0000
[000ad1f2]                           dc.w $001a
[000ad1f4]                           dc.w $5fff
[000ad1f6]                           dc.w $ffff
[000ad1f8]                           dc.w $fffa
[000ad1fa]                           dc.w $5fff
[000ad1fc]                           dc.w $ffff
[000ad1fe]                           dc.w $fffa
[000ad200]                           dc.w $4000
[000ad202]                           dc.w $0000
[000ad204]                           dc.w $0002
[000ad206]                           dc.w $7fff
[000ad208]                           dc.w $ffff
[000ad20a]                           dc.w $fffe
[000ad20c]                           dc.w $0000
[000ad20e]                           dc.w $0000
[000ad210]                           dc.w $0000
IC_ALERT:
[000ad212] 000ad09e                  dc.l _MSK_IC_ALERT
[000ad216] 000ad158                  dc.l _DAT_IC_ALERT
[000ad21a] 000acc15                  dc.l TEXT_08
[000ad21e]                           dc.w $1000
[000ad220]                           dc.w $0000
[000ad222]                           dc.w $0000
[000ad224]                           dc.w $000c
[000ad226]                           dc.w $0000
[000ad228]                           dc.w $0030
[000ad22a]                           dc.w $001f
[000ad22c]                           dc.w $0000
[000ad22e]                           dc.w $0020
[000ad230]                           dc.w $0048
[000ad232]                           dc.w $0008
[000ad234] 000ad088                  dc.l _C4_IC_ALERT
_IMG_IM_EXCLAM:
[000ad238]                           dc.w $0003
[000ad23a]                           dc.w $c000
[000ad23c]                           dc.w $0006
[000ad23e]                           dc.w $6000
[000ad240]                           dc.w $000d
[000ad242]                           dc.w $b000
[000ad244]                           dc.w $001b
[000ad246]                           dc.w $d800
[000ad248]                           dc.w $0037
[000ad24a]                           dc.w $ec00
[000ad24c]                           dc.w $006f
[000ad24e]                           dc.w $f600
[000ad250]                           dc.w $00df
[000ad252]                           dc.w $fb00
[000ad254]                           dc.w $01bc
[000ad256]                           dc.w $3d80
[000ad258]                           dc.w $037c
[000ad25a]                           dc.w $3ec0
[000ad25c]                           dc.w $06fc
[000ad25e]                           dc.w $3f60
[000ad260]                           dc.w $0dfc
[000ad262]                           dc.w $3fb0
[000ad264]                           dc.w $1bfc
[000ad266]                           dc.w $3fd8
[000ad268]                           dc.w $37fc
[000ad26a]                           dc.w $3fec
[000ad26c]                           dc.w $6ffc
[000ad26e]                           dc.w $3ff6
[000ad270]                           dc.w $dffc
[000ad272]                           dc.w $3ffb
[000ad274]                           dc.w $bffc
[000ad276]                           dc.w $3ffd
[000ad278]                           dc.w $bffc
[000ad27a]                           dc.w $3ffd
[000ad27c]                           dc.w $dffc
[000ad27e]                           dc.w $3ffb
[000ad280]                           dc.w $6ffc
[000ad282]                           dc.w $3ff6
[000ad284]                           dc.w $37fc
[000ad286]                           dc.w $3fec
[000ad288]                           dc.w $1bff
[000ad28a]                           dc.w $ffd8
[000ad28c]                           dc.w $0dff
[000ad28e]                           dc.w $ffb0
[000ad290]                           dc.w $06fc
[000ad292]                           dc.w $3f60
[000ad294]                           dc.w $037c
[000ad296]                           dc.w $3ec0
[000ad298]                           dc.w $01bc
[000ad29a]                           dc.w $3d80
[000ad29c]                           dc.w $00dc
[000ad29e]                           dc.w $3b00
[000ad2a0]                           dc.w $006f
[000ad2a2]                           dc.w $f600
[000ad2a4]                           dc.w $0037
[000ad2a6]                           dc.w $ec00
[000ad2a8]                           dc.w $001b
[000ad2aa]                           dc.w $d800
[000ad2ac]                           dc.w $000d
[000ad2ae]                           dc.w $b000
[000ad2b0]                           dc.w $0006
[000ad2b2]                           dc.w $6000
[000ad2b4]                           dc.w $0003
[000ad2b6]                           dc.w $c000
IM_EXCLAM:
[000ad2b8] 000ad238                  dc.l _IMG_IM_EXCLAM
[000ad2bc]                           dc.w $0004
[000ad2be]                           dc.w $0020
[000ad2c0]                           dc.w $0000
[000ad2c2]                           dc.w $0000
[000ad2c4]                           dc.w $0001
_IMG_IM_NONE:
[000ad2c6]                           dc.w $9249
[000ad2c8]                           dc.w $2492
[000ad2ca]                           dc.w $0000
[000ad2cc]                           dc.w $0000
[000ad2ce]                           dc.w $0000
[000ad2d0]                           dc.w $0000
[000ad2d2]                           dc.w $8000
[000ad2d4]                           dc.w $0002
[000ad2d6]                           dc.w $0000
[000ad2d8]                           dc.w $0000
[000ad2da]                           dc.w $0000
[000ad2dc]                           dc.w $0000
[000ad2de]                           dc.w $8000
[000ad2e0]                           dc.w $0002
[000ad2e2]                           dc.w $0000
[000ad2e4]                           dc.w $0000
[000ad2e6]                           dc.w $0000
[000ad2e8]                           dc.w $0000
[000ad2ea]                           dc.w $8000
[000ad2ec]                           dc.w $0002
[000ad2ee]                           dc.w $0000
[000ad2f0]                           dc.w $0000
[000ad2f2]                           dc.w $0000
[000ad2f4]                           dc.w $0000
[000ad2f6]                           dc.w $8000
[000ad2f8]                           dc.w $0002
[000ad2fa]                           dc.w $0000
[000ad2fc]                           dc.w $0000
[000ad2fe]                           dc.w $0000
[000ad300]                           dc.w $0000
[000ad302]                           dc.w $8000
[000ad304]                           dc.w $0002
[000ad306]                           dc.w $0000
[000ad308]                           dc.w $0000
[000ad30a]                           dc.w $0000
[000ad30c]                           dc.w $0000
[000ad30e]                           dc.w $8000
[000ad310]                           dc.w $0002
[000ad312]                           dc.w $0000
[000ad314]                           dc.w $0000
[000ad316]                           dc.w $0000
[000ad318]                           dc.w $0000
[000ad31a]                           dc.w $8000
[000ad31c]                           dc.w $0002
[000ad31e]                           dc.w $0000
[000ad320]                           dc.w $0000
[000ad322]                           dc.w $0000
[000ad324]                           dc.w $0000
[000ad326]                           dc.w $8000
[000ad328]                           dc.w $0002
[000ad32a]                           dc.w $0000
[000ad32c]                           dc.w $0000
[000ad32e]                           dc.w $0000
[000ad330]                           dc.w $0000
[000ad332]                           dc.w $8000
[000ad334]                           dc.w $0002
[000ad336]                           dc.w $0000
[000ad338]                           dc.w $0000
[000ad33a]                           dc.w $0000
[000ad33c]                           dc.w $0000
[000ad33e]                           dc.w $9249
[000ad340]                           dc.w $2492
[000ad342]                           dc.w $0000
[000ad344]                           dc.w $0000
IM_NONE:
[000ad346] 000ad2c6                  dc.l _IMG_IM_NONE
[000ad34a]                           dc.w $0004
[000ad34c]                           dc.w $0020
[000ad34e]                           dc.w $0000
[000ad350]                           dc.w $0000
[000ad352]                           dc.w $0001
_IMG_IM_QUEST:
[000ad354]                           dc.w $3fff
[000ad356]                           dc.w $fffc
[000ad358]                           dc.w $c000
[000ad35a]                           dc.w $0003
[000ad35c]                           dc.w $9fff
[000ad35e]                           dc.w $fff9
[000ad360]                           dc.w $bfff
[000ad362]                           dc.w $fffd
[000ad364]                           dc.w $dff8
[000ad366]                           dc.w $3ffb
[000ad368]                           dc.w $5fe0
[000ad36a]                           dc.w $0ffa
[000ad36c]                           dc.w $6fc0
[000ad36e]                           dc.w $07f6
[000ad370]                           dc.w $2f83
[000ad372]                           dc.w $83f4
[000ad374]                           dc.w $3787
[000ad376]                           dc.w $c3ec
[000ad378]                           dc.w $1787
[000ad37a]                           dc.w $c3e8
[000ad37c]                           dc.w $1bff
[000ad37e]                           dc.w $83d8
[000ad380]                           dc.w $0bff
[000ad382]                           dc.w $07d0
[000ad384]                           dc.w $0dfe
[000ad386]                           dc.w $0fb0
[000ad388]                           dc.w $05fc
[000ad38a]                           dc.w $1fa0
[000ad38c]                           dc.w $06fc
[000ad38e]                           dc.w $3f60
[000ad390]                           dc.w $02fc
[000ad392]                           dc.w $3f40
[000ad394]                           dc.w $037c
[000ad396]                           dc.w $3ec0
[000ad398]                           dc.w $017c
[000ad39a]                           dc.w $3e80
[000ad39c]                           dc.w $01bf
[000ad39e]                           dc.w $fd80
[000ad3a0]                           dc.w $00bf
[000ad3a2]                           dc.w $fd00
[000ad3a4]                           dc.w $00dc
[000ad3a6]                           dc.w $3b00
[000ad3a8]                           dc.w $005c
[000ad3aa]                           dc.w $3a00
[000ad3ac]                           dc.w $006c
[000ad3ae]                           dc.w $3600
[000ad3b0]                           dc.w $002f
[000ad3b2]                           dc.w $f400
[000ad3b4]                           dc.w $0037
[000ad3b6]                           dc.w $ec00
[000ad3b8]                           dc.w $0017
[000ad3ba]                           dc.w $e800
[000ad3bc]                           dc.w $001b
[000ad3be]                           dc.w $d800
[000ad3c0]                           dc.w $000b
[000ad3c2]                           dc.w $d000
[000ad3c4]                           dc.w $000d
[000ad3c6]                           dc.w $b000
[000ad3c8]                           dc.w $0005
[000ad3ca]                           dc.w $a000
[000ad3cc]                           dc.w $0006
[000ad3ce]                           dc.w $6000
[000ad3d0]                           dc.w $0003
[000ad3d2]                           dc.w $c000
IM_QUEST:
[000ad3d4] 000ad354                  dc.l _IMG_IM_QUEST
[000ad3d8]                           dc.w $0004
[000ad3da]                           dc.w $0020
[000ad3dc]                           dc.w $0000
[000ad3de]                           dc.w $0000
[000ad3e0]                           dc.w $0001
_IMG_IM_STOP:
[000ad3e2]                           dc.w $007f
[000ad3e4]                           dc.w $fe00
[000ad3e6]                           dc.w $00c0
[000ad3e8]                           dc.w $0300
[000ad3ea]                           dc.w $01bf
[000ad3ec]                           dc.w $fd80
[000ad3ee]                           dc.w $037f
[000ad3f0]                           dc.w $fec0
[000ad3f2]                           dc.w $06ff
[000ad3f4]                           dc.w $ff60
[000ad3f6]                           dc.w $0dff
[000ad3f8]                           dc.w $ffb0
[000ad3fa]                           dc.w $1bff
[000ad3fc]                           dc.w $ffd8
[000ad3fe]                           dc.w $37ff
[000ad400]                           dc.w $ffec
[000ad402]                           dc.w $6fff
[000ad404]                           dc.w $fff6
[000ad406]                           dc.w $dfff
[000ad408]                           dc.w $fffb
[000ad40a]                           dc.w $b181
[000ad40c]                           dc.w $860d
[000ad40e]                           dc.w $a081
[000ad410]                           dc.w $0205
[000ad412]                           dc.w $a4e7
[000ad414]                           dc.w $3265
[000ad416]                           dc.w $a7e7
[000ad418]                           dc.w $3265
[000ad41a]                           dc.w $a3e7
[000ad41c]                           dc.w $3265
[000ad41e]                           dc.w $b1e7
[000ad420]                           dc.w $3205
[000ad422]                           dc.w $b8e7
[000ad424]                           dc.w $320d
[000ad426]                           dc.w $bce7
[000ad428]                           dc.w $327d
[000ad42a]                           dc.w $a4e7
[000ad42c]                           dc.w $327d
[000ad42e]                           dc.w $a0e7
[000ad430]                           dc.w $027d
[000ad432]                           dc.w $b1e7
[000ad434]                           dc.w $867d
[000ad436]                           dc.w $bfff
[000ad438]                           dc.w $fffd
[000ad43a]                           dc.w $dfff
[000ad43c]                           dc.w $fffb
[000ad43e]                           dc.w $6fff
[000ad440]                           dc.w $fff6
[000ad442]                           dc.w $37ff
[000ad444]                           dc.w $ffec
[000ad446]                           dc.w $1bff
[000ad448]                           dc.w $ffd8
[000ad44a]                           dc.w $0dff
[000ad44c]                           dc.w $ffb0
[000ad44e]                           dc.w $06ff
[000ad450]                           dc.w $ff60
[000ad452]                           dc.w $037f
[000ad454]                           dc.w $fec0
[000ad456]                           dc.w $01bf
[000ad458]                           dc.w $fd80
[000ad45a]                           dc.w $00c0
[000ad45c]                           dc.w $0300
[000ad45e]                           dc.w $007f
[000ad460]                           dc.w $fe00
IM_STOP:
[000ad462] 000ad3e2                  dc.l _IMG_IM_STOP
[000ad466]                           dc.w $0004
[000ad468]                           dc.w $0020
[000ad46a]                           dc.w $0000
[000ad46c]                           dc.w $0000
[000ad46e]                           dc.w $0001
_IMG_IM_TIME:
[000ad470]                           dc.w $0000
[000ad472]                           dc.w $0000
[000ad474]                           dc.w $000f
[000ad476]                           dc.w $e000
[000ad478]                           dc.w $0070
[000ad47a]                           dc.w $1c00
[000ad47c]                           dc.w $0080
[000ad47e]                           dc.w $0200
[000ad480]                           dc.w $0301
[000ad482]                           dc.w $e180
[000ad484]                           dc.w $0601
[000ad486]                           dc.w $f8c0
[000ad488]                           dc.w $0c01
[000ad48a]                           dc.w $fc60
[000ad48c]                           dc.w $0801
[000ad48e]                           dc.w $fe20
[000ad490]                           dc.w $1181
[000ad492]                           dc.w $ff10
[000ad494]                           dc.w $23c1
[000ad496]                           dc.w $ff88
[000ad498]                           dc.w $27e1
[000ad49a]                           dc.w $ffc8
[000ad49c]                           dc.w $27f1
[000ad49e]                           dc.w $ffc8
[000ad4a0]                           dc.w $4ff9
[000ad4a2]                           dc.w $ffe4
[000ad4a4]                           dc.w $4ffd
[000ad4a6]                           dc.w $ffe4
[000ad4a8]                           dc.w $4fff
[000ad4aa]                           dc.w $ffe4
[000ad4ac]                           dc.w $4fff
[000ad4ae]                           dc.w $ffe4
[000ad4b0]                           dc.w $4fff
[000ad4b2]                           dc.w $ffe4
[000ad4b4]                           dc.w $4fff
[000ad4b6]                           dc.w $ffe4
[000ad4b8]                           dc.w $4fff
[000ad4ba]                           dc.w $ffe4
[000ad4bc]                           dc.w $27ff
[000ad4be]                           dc.w $ffc8
[000ad4c0]                           dc.w $27ff
[000ad4c2]                           dc.w $ffc8
[000ad4c4]                           dc.w $23ff
[000ad4c6]                           dc.w $ff88
[000ad4c8]                           dc.w $11ff
[000ad4ca]                           dc.w $ff10
[000ad4cc]                           dc.w $08ff
[000ad4ce]                           dc.w $fe20
[000ad4d0]                           dc.w $0c7f
[000ad4d2]                           dc.w $fc60
[000ad4d4]                           dc.w $063f
[000ad4d6]                           dc.w $f8c0
[000ad4d8]                           dc.w $030f
[000ad4da]                           dc.w $e180
[000ad4dc]                           dc.w $0080
[000ad4de]                           dc.w $0200
[000ad4e0]                           dc.w $0070
[000ad4e2]                           dc.w $1c00
[000ad4e4]                           dc.w $000f
[000ad4e6]                           dc.w $e000
[000ad4e8]                           dc.w $0000
[000ad4ea]                           dc.w $0000
IM_TIME:
[000ad4ec] 000ad470                  dc.l _IMG_IM_TIME
[000ad4f0]                           dc.w $0004
[000ad4f2]                           dc.w $001f
[000ad4f4]                           dc.w $0000
[000ad4f6]                           dc.w $0000
[000ad4f8]                           dc.w $0001
NEW_IMAGE:
[000ad4fa]                           dc.w $ffff
[000ad4fc]                           dc.w $0001
[000ad4fe]                           dc.w $0005
[000ad500]                           dc.w $0014
[000ad502]                           dc.w $0000
[000ad504]                           dc.w $0020
[000ad506]                           dc.w $00ff
[000ad508]                           dc.w $1100
[000ad50a]                           dc.w $0000
[000ad50c]                           dc.w $0000
[000ad50e]                           dc.w $0014
[000ad510]                           dc.w $0002
_01_NEW_IMAGE:
[000ad512]                           dc.w $0002
[000ad514]                           dc.w $ffff
[000ad516]                           dc.w $ffff
[000ad518]                           dc.w $0017
[000ad51a]                           dc.w $0001
[000ad51c]                           dc.w $0000
[000ad51e] 000ad346                  dc.l IM_NONE
[000ad522]                           dc.w $0000
[000ad524]                           dc.w $0000
[000ad526]                           dc.w $0004
[000ad528]                           dc.w $0002
_02_NEW_IMAGE:
[000ad52a]                           dc.w $0003
[000ad52c]                           dc.w $ffff
[000ad52e]                           dc.w $ffff
[000ad530]                           dc.w $0017
[000ad532]                           dc.w $0001
[000ad534]                           dc.w $2000
[000ad536] 000ad2b8                  dc.l IM_EXCLAM
[000ad53a]                           dc.w $0004
[000ad53c]                           dc.w $0000
[000ad53e]                           dc.w $0004
[000ad540]                           dc.w $0002
_03_NEW_IMAGE:
[000ad542]                           dc.w $0004
[000ad544]                           dc.w $ffff
[000ad546]                           dc.w $ffff
[000ad548]                           dc.w $0017
[000ad54a]                           dc.w $0001
[000ad54c]                           dc.w $2000
[000ad54e] 000ad3d4                  dc.l IM_QUEST
[000ad552]                           dc.w $0008
[000ad554]                           dc.w $0000
[000ad556]                           dc.w $0004
[000ad558]                           dc.w $0002
_04_NEW_IMAGE:
[000ad55a]                           dc.w $0005
[000ad55c]                           dc.w $ffff
[000ad55e]                           dc.w $ffff
[000ad560]                           dc.w $0017
[000ad562]                           dc.w $0001
[000ad564]                           dc.w $2000
[000ad566] 000ad462                  dc.l IM_STOP
[000ad56a]                           dc.w $000c
[000ad56c]                           dc.w $0000
[000ad56e]                           dc.w $0004
[000ad570]                           dc.w $0002
_05_NEW_IMAGE:
[000ad572]                           dc.w $0000
[000ad574]                           dc.w $ffff
[000ad576]                           dc.w $ffff
[000ad578]                           dc.w $0017
[000ad57a]                           dc.w $0021
[000ad57c]                           dc.w $2000
[000ad57e] 000ad4ec                  dc.l IM_TIME
[000ad582]                           dc.w $0010
[000ad584]                           dc.w $0000
[000ad586]                           dc.w $0004
[000ad588]                           dc.w $0002
EDIT_ALERT:
[000ad58a]                           dc.w $ffff
[000ad58c]                           dc.w $0001
[000ad58e]                           dc.w $0010
[000ad590]                           dc.w $0018
[000ad592]                           dc.w $0040
[000ad594]                           dc.w $0010
[000ad596] 000acfe8                  dc.l A_3DBUTTON02
[000ad59a]                           dc.w $0000
[000ad59c]                           dc.w $0000
[000ad59e]                           dc.w $002e
[000ad5a0]                           dc.w $000e
_01_EDIT_ALERT:
[000ad5a2]                           dc.w $000c
[000ad5a4]                           dc.w $0002
[000ad5a6]                           dc.w $000b
[000ad5a8]                           dc.w $0014
[000ad5aa]                           dc.w $0000
[000ad5ac]                           dc.w $0010
[000ad5ae]                           dc.w $0002
[000ad5b0]                           dc.w $1101
[000ad5b2]                           dc.w $0002
[000ad5b4]                           dc.w $0001
[000ad5b6]                           dc.w $002a
[000ad5b8]                           dc.w $0009
_02_EDIT_ALERT:
[000ad5ba]                           dc.w $0004
[000ad5bc]                           dc.w $ffff
[000ad5be]                           dc.w $ffff
[000ad5c0]                           dc.w $0017
[000ad5c2]                           dc.w $0040
[000ad5c4]                           dc.w $2000
[000ad5c6] 000ad3d4                  dc.l IM_QUEST
[000ad5ca]                           dc.w $0002
[000ad5cc]                           dc.w $0001
[000ad5ce]                           dc.w $0004
[000ad5d0]                           dc.w $0002
_02aEDIT_ALERT:
[000ad5d2] 0001da70                  dc.l edal_newim
[000ad5d6]                           dc.w $0000
[000ad5d8]                           dc.w $0000
[000ad5da]                           dc.w $8000
[000ad5dc]                           dc.w $0000
[000ad5de]                           dc.w $0000
[000ad5e0]                           dc.w $0000
[000ad5e2]                           dc.w $0000
[000ad5e4]                           dc.w $0000
[000ad5e6]                           dc.w $0000
[000ad5e8]                           dc.w $0000
_04_EDIT_ALERT:
[000ad5ea]                           dc.w $0005
[000ad5ec]                           dc.w $ffff
[000ad5ee]                           dc.w $ffff
[000ad5f0]                           dc.w $0018
[000ad5f2]                           dc.w $0008
[000ad5f4]                           dc.w $0000
[000ad5f6] 000ad048                  dc.l A_BOXED01
[000ad5fa]                           dc.w $0009
[000ad5fc]                           dc.w $0001
[000ad5fe]                           dc.w $001e
[000ad600]                           dc.w $0001
_05_EDIT_ALERT:
[000ad602]                           dc.w $0006
[000ad604]                           dc.w $ffff
[000ad606]                           dc.w $ffff
[000ad608]                           dc.w $0018
[000ad60a]                           dc.w $0008
[000ad60c]                           dc.w $0000
[000ad60e] 000ad048                  dc.l A_BOXED01
[000ad612]                           dc.w $0009
[000ad614]                           dc.w $0002
[000ad616]                           dc.w $001e
[000ad618]                           dc.w $0001
_06_EDIT_ALERT:
[000ad61a]                           dc.w $0007
[000ad61c]                           dc.w $ffff
[000ad61e]                           dc.w $ffff
[000ad620]                           dc.w $0018
[000ad622]                           dc.w $0008
[000ad624]                           dc.w $0000
[000ad626] 000ad048                  dc.l A_BOXED01
[000ad62a]                           dc.w $0009
[000ad62c]                           dc.w $0003
[000ad62e]                           dc.w $001e
[000ad630]                           dc.w $0001
_07_EDIT_ALERT:
[000ad632]                           dc.w $0008
[000ad634]                           dc.w $ffff
[000ad636]                           dc.w $ffff
[000ad638]                           dc.w $0018
[000ad63a]                           dc.w $0008
[000ad63c]                           dc.w $0000
[000ad63e] 000ad048                  dc.l A_BOXED01
[000ad642]                           dc.w $0009
[000ad644]                           dc.w $0004
[000ad646]                           dc.w $001e
[000ad648]                           dc.w $0001
_08_EDIT_ALERT:
[000ad64a]                           dc.w $0009
[000ad64c]                           dc.w $ffff
[000ad64e]                           dc.w $ffff
[000ad650]                           dc.w $0018
[000ad652]                           dc.w $0008
[000ad654]                           dc.w $0000
[000ad656] 000ad048                  dc.l A_BOXED01
[000ad65a]                           dc.w $0009
[000ad65c]                           dc.w $0005
[000ad65e]                           dc.w $001e
[000ad660]                           dc.w $0001
_09_EDIT_ALERT:
[000ad662]                           dc.w $000a
[000ad664]                           dc.w $ffff
[000ad666]                           dc.w $ffff
[000ad668]                           dc.w $0018
[000ad66a]                           dc.w $0008
[000ad66c]                           dc.w $0010
[000ad66e] 000ad068                  dc.l A_BOXED03
[000ad672]                           dc.w $0003
[000ad674]                           dc.w $0007
[000ad676]                           dc.w $000a
[000ad678]                           dc.w $0001
_10_EDIT_ALERT:
[000ad67a]                           dc.w $000b
[000ad67c]                           dc.w $ffff
[000ad67e]                           dc.w $ffff
[000ad680]                           dc.w $0018
[000ad682]                           dc.w $0008
[000ad684]                           dc.w $0010
[000ad686] 000ad068                  dc.l A_BOXED03
[000ad68a]                           dc.w $0010
[000ad68c]                           dc.w $0007
[000ad68e]                           dc.w $000a
[000ad690]                           dc.w $0001
_11_EDIT_ALERT:
[000ad692]                           dc.w $0001
[000ad694]                           dc.w $ffff
[000ad696]                           dc.w $ffff
[000ad698]                           dc.w $0018
[000ad69a]                           dc.w $0008
[000ad69c]                           dc.w $0010
[000ad69e] 000ad068                  dc.l A_BOXED03
[000ad6a2]                           dc.w $001d
[000ad6a4]                           dc.w $0007
[000ad6a6]                           dc.w $000a
[000ad6a8]                           dc.w $0001
_12_EDIT_ALERT:
[000ad6aa]                           dc.w $000e
[000ad6ac]                           dc.w $ffff
[000ad6ae]                           dc.w $ffff
[000ad6b0]                           dc.w $0018
[000ad6b2]                           dc.w $4007
[000ad6b4]                           dc.w $0010
[000ad6b6] 000ad008                  dc.l A_3DBUTTON04
[000ad6ba]                           dc.w $0003
[000ad6bc]                           dc.w $000b
[000ad6be]                           dc.w $000c
[000ad6c0]                           dc.w $0002
_12aEDIT_ALERT:
[000ad6c2] 0001daba                  dc.l edal_ok
[000ad6c6]                           dc.w $0000
[000ad6c8]                           dc.w $0000
[000ad6ca]                           dc.w $8000
[000ad6cc]                           dc.w $884f
[000ad6ce]                           dc.w $0000
[000ad6d0]                           dc.w $0000
[000ad6d2]                           dc.w $0000
[000ad6d4]                           dc.w $0000
[000ad6d6]                           dc.w $0000
[000ad6d8]                           dc.w $0000
_14_EDIT_ALERT:
[000ad6da]                           dc.w $0010
[000ad6dc]                           dc.w $ffff
[000ad6de]                           dc.w $ffff
[000ad6e0]                           dc.w $0018
[000ad6e2]                           dc.w $4005
[000ad6e4]                           dc.w $0010
[000ad6e6] 000ad028                  dc.l A_3DBUTTON05
[000ad6ea]                           dc.w $0011
[000ad6ec]                           dc.w $000b
[000ad6ee]                           dc.w $000c
[000ad6f0]                           dc.w $0002
_14aEDIT_ALERT:
[000ad6f2] 0001dadc                  dc.l edal_abort
[000ad6f6]                           dc.w $0000
[000ad6f8]                           dc.w $0000
[000ad6fa]                           dc.w $8000
[000ad6fc]                           dc.w $8841
[000ad6fe]                           dc.w $0000
[000ad700]                           dc.w $0000
[000ad702]                           dc.w $0000
[000ad704]                           dc.w $0000
[000ad706]                           dc.w $0000
[000ad708]                           dc.w $0000
_16_EDIT_ALERT:
[000ad70a]                           dc.w $0000
[000ad70c]                           dc.w $ffff
[000ad70e]                           dc.w $ffff
[000ad710]                           dc.w $0018
[000ad712]                           dc.w $4005
[000ad714]                           dc.w $0010
[000ad716] 000acfc8                  dc.l A_3DBUTTON01
[000ad71a]                           dc.w $001f
[000ad71c]                           dc.w $000b
[000ad71e]                           dc.w $000c
[000ad720]                           dc.w $0002
_16aEDIT_ALERT:
[000ad722] 0001da2a                  dc.l edal_try
[000ad726]                           dc.w $0000
[000ad728]                           dc.w $0000
[000ad72a]                           dc.w $8020
[000ad72c]                           dc.w $8850
[000ad72e]                           dc.w $0000
[000ad730]                           dc.w $0000
[000ad732]                           dc.w $0000
[000ad734]                           dc.w $0000
[000ad736]                           dc.w $0000
[000ad738]                           dc.w $0000
WI_ALERT:
[000ad73a]                           dc.w $0000
[000ad73c]                           dc.w $0000
[000ad73e] 0001ddbc                  dc.l al_service
[000ad742] 0001dd20                  dc.l al_make
[000ad746] 00057428                  dc.l Awi_open
[000ad74a] 00055e94                  dc.l Awi_init
[000ad74e] 000ad58a                  dc.l EDIT_ALERT
[000ad752]                           dc.w $0000
[000ad754]                           dc.w $0000
[000ad756]                           dc.w $0000
[000ad758]                           dc.w $0000
[000ad75a]                           dc.w $ffff
[000ad75c]                           dc.w $601f
[000ad75e]                           dc.w $0000
[000ad760]                           dc.w $0000
[000ad762]                           dc.w $0063
[000ad764]                           dc.w $0063
[000ad766]                           dc.w $0000
[000ad768]                           dc.w $0000
[000ad76a]                           dc.w $0000
[000ad76c]                           dc.w $0000
[000ad76e]                           dc.w $0000
[000ad770]                           dc.w $0000
[000ad772]                           dc.w $0000
[000ad774]                           dc.w $0000
[000ad776]                           dc.w $ffff
[000ad778]                           dc.w $ffff
[000ad77a]                           dc.w $ffff
[000ad77c]                           dc.w $ffff
[000ad77e]                           dc.w $0000
[000ad780]                           dc.w $0000
[000ad782]                           dc.w $fcf8
[000ad784] 000acc03                  dc.l TEXT_01
[000ad788] 000acbf9                  dc.l TEXT_002
[000ad78c]                           dc.w $2710
[000ad78e]                           dc.w $0100
[000ad790]                           dc.w $0000
[000ad792]                           dc.w $ffff
[000ad794] 000ad212                  dc.l IC_ALERT
[000ad798]                           dc.w $0000
[000ad79a]                           dc.w $0000
[000ad79c] 0006b744                  dc.l Awi_keys
[000ad7a0] 00051852                  dc.l Awi_obchange
[000ad7a4] 00051c46                  dc.l Awi_redraw
[000ad7a8] 000587a4                  dc.l Awi_topped
[000ad7ac] 00058362                  dc.l Awi_closed
[000ad7b0] 000587ec                  dc.l Awi_fulled
[000ad7b4] 0005217c                  dc.l Awi_arrowed
[000ad7b8] 000524b4                  dc.l Awi_hslid
[000ad7bc] 0005255e                  dc.l Awi_vslid
[000ad7c0] 00058bb0                  dc.l Awi_sized
[000ad7c4] 00058d50                  dc.l Awi_moved
[000ad7c8] 0005998a                  dc.l Awi_iconify
[000ad7cc] 00059c6c                  dc.l Awi_uniconify
[000ad7d0] 0005b5b6                  dc.l Awi_gemscript
[000ad7d4]                           dc.w $0000
[000ad7d6]                           dc.w $0000
[000ad7d8]                           dc.w $0000
[000ad7da]                           dc.w $0000
[000ad7dc]                           dc.b '[0][',0
[000ad7e1]                           dc.b $7c
[000ad7e2]                           dc.w $005d
[000ad7e4]                           dc.w $0000

