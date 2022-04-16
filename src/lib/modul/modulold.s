noop:
[000715ea] 4e75                      rts

Aus_create23x:
[000715ec] 2f0a                      move.l     a2,-(a7)
[000715ee] 2f0b                      move.l     a3,-(a7)
[000715f0] 2648                      movea.l    a0,a3
[000715f2] 7020                      moveq.l    #32,d0
[000715f4] 4eb9 0004 c608            jsr        Ax_malloc
[000715fa] 2448                      movea.l    a0,a2
[000715fc] 200a                      move.l     a2,d0
[000715fe] 6604                      bne.s      Aus_create23x_1
[00071600] 91c8                      suba.l     a0,a0
[00071602] 6022                      bra.s      Aus_create23x_2
Aus_create23x_1:
[00071604] 7018                      moveq.l    #24,d0
[00071606] 224b                      movea.l    a3,a1
[00071608] 204a                      movea.l    a2,a0
[0007160a] 4eb9 0008 3500            jsr        memcpy
[00071610] 41f9 000e 4998            lea.l      $000E4998,a0
[00071616] 4eb9 0004 643c            jsr        Ast_create
[0007161c] 2548 001c                 move.l     a0,28(a2)
[00071620] 2548 0018                 move.l     a0,24(a2)
[00071624] 204a                      movea.l    a2,a0
Aus_create23x_2:
[00071626] 265f                      movea.l    (a7)+,a3
[00071628] 245f                      movea.l    (a7)+,a2
[0007162a] 4e75                      rts

Aob_create23x:
[0007162c] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[00071630] 554f                      subq.w     #2,a7
[00071632] 2848                      movea.l    a0,a4
[00071634] 7600                      moveq.l    #0,d3
[00071636] 2448                      movea.l    a0,a2
[00071638] d6bc 0000 0018            add.l      #$00000018,d3
Aob_create23x_1:
[0007163e] 7020                      moveq.l    #32,d0
[00071640] 204a                      movea.l    a2,a0
[00071642] 45ea 0018                 lea.l      24(a2),a2
[00071646] c068 0008                 and.w      8(a0),d0
[0007164a] 67ec                      beq.s      Aob_create23x_1
[0007164c] 2003                      move.l     d3,d0
[0007164e] 4eb9 0004 c608            jsr        Ax_malloc
[00071654] 2648                      movea.l    a0,a3
[00071656] 200b                      move.l     a3,d0
[00071658] 6700 00d2                 beq        Aob_create23x_2
[0007165c] 224c                      movea.l    a4,a1
[0007165e] 2003                      move.l     d3,d0
[00071660] 4eb9 0008 3500            jsr        memcpy
[00071666] 4257                      clr.w      (a7)
[00071668] 244b                      movea.l    a3,a2
[0007166a] 2a4a                      movea.l    a2,a5
[0007166c] 302a 0008                 move.w     8(a2),d0
Aob_create23x_12:
[00071670] c07c 8000                 and.w      #$8000,d0
[00071674] 6600 00ba                 bne        Aob_create23x_3
[00071678] 322a 000a                 move.w     10(a2),d1
[0007167c] c27c 2000                 and.w      #$2000,d1
[00071680] 6600 00ae                 bne        Aob_create23x_3
[00071684] 142a 0007                 move.b     7(a2),d2
[00071688] 4882                      ext.w      d2
[0007168a] 947c 0015                 sub.w      #$0015,d2
[0007168e] b47c 000c                 cmp.w      #$000C,d2
[00071692] 6200 0094                 bhi        Aob_create23x_4
[00071696] d442                      add.w      d2,d2
[00071698] 343b 2006                 move.w     $000716A0(pc,d2.w),d2
[0007169c] 4efb 2002                 jmp        $000716A0(pc,d2.w)
J60:
[000716a0] 001a                      dc.w $001a   ; Aob_create23x_5-J60
[000716a2] 001a                      dc.w $001a   ; Aob_create23x_5-J60
[000716a4] 0054                      dc.w $0054   ; Aob_create23x_6-J60
[000716a6] 002c                      dc.w $002c   ; Aob_create23x_7-J60
[000716a8] 0088                      dc.w $0088   ; Aob_create23x_4-J60
[000716aa] 0078                      dc.w $0078   ; Aob_create23x_8-J60
[000716ac] 0088                      dc.w $0088   ; Aob_create23x_4-J60
[000716ae] 0078                      dc.w $0078   ; Aob_create23x_8-J60
[000716b0] 001a                      dc.w $001a   ; Aob_create23x_5-J60
[000716b2] 001a                      dc.w $001a   ; Aob_create23x_5-J60
[000716b4] 0066                      dc.w $0066   ; Aob_create23x_9-J60
[000716b6] 0078                      dc.w $0078   ; Aob_create23x_8-J60
[000716b8] 0066                      dc.w $0066   ; Aob_create23x_9-J60
Aob_create23x_5:
[000716ba] 206a 000c                 movea.l    12(a2),a0
[000716be] 4eb9 0004 fa88            jsr        Ate_create
[000716c4] 2a48                      movea.l    a0,a5
[000716c6] 2548 000c                 move.l     a0,12(a2)
[000716ca] 605c                      bra.s      Aob_create23x_4
Aob_create23x_7:
[000716cc] 206a 000c                 movea.l    12(a2),a0
[000716d0] 6100 ff1a                 bsr        Aus_create23x
[000716d4] 2848                      movea.l    a0,a4
[000716d6] 2a4c                      movea.l    a4,a5
[000716d8] 254d 000c                 move.l     a5,12(a2)
[000716dc] 202c 0008                 move.l     8(a4),d0
[000716e0] 670a                      beq.s      Aob_create23x_10
[000716e2] 43d7                      lea.l      (a7),a1
[000716e4] 2c40                      movea.l    d0,a6
[000716e6] 204a                      movea.l    a2,a0
[000716e8] 7001                      moveq.l    #1,d0
[000716ea] 4e96                      jsr        (a6)
Aob_create23x_10:
[000716ec] 0c57 ffff                 cmpi.w     #$FFFF,(a7)
[000716f0] 6636                      bne.s      Aob_create23x_4
[000716f2] 6038                      bra.s      Aob_create23x_2
Aob_create23x_6:
[000716f4] 206a 000c                 movea.l    12(a2),a0
[000716f8] 4eb9 0004 fa4c            jsr        Aim_create
[000716fe] 2a48                      movea.l    a0,a5
[00071700] 2548 000c                 move.l     a0,12(a2)
[00071704] 6022                      bra.s      Aob_create23x_4
Aob_create23x_9:
[00071706] 206a 000c                 movea.l    12(a2),a0
[0007170a] 4eb9 0004 f606            jsr        Aic_create
[00071710] 2a48                      movea.l    a0,a5
[00071712] 2548 000c                 move.l     a0,12(a2)
[00071716] 6010                      bra.s      Aob_create23x_4
Aob_create23x_8:
[00071718] 206a 000c                 movea.l    12(a2),a0
[0007171c] 4eb9 0004 643c            jsr        Ast_create
[00071722] 2a48                      movea.l    a0,a5
[00071724] 2548 000c                 move.l     a0,12(a2)
Aob_create23x_4:
[00071728] 200d                      move.l     a5,d0
[0007172a] 6604                      bne.s      Aob_create23x_3
Aob_create23x_2:
[0007172c] 91c8                      suba.l     a0,a0
[0007172e] 6012                      bra.s      Aob_create23x_11
Aob_create23x_3:
[00071730] 7020                      moveq.l    #32,d0
[00071732] 204a                      movea.l    a2,a0
[00071734] 45ea 0018                 lea.l      24(a2),a2
[00071738] c068 0008                 and.w      8(a0),d0
[0007173c] 6700 ff2e                 beq        Aob_create23x_12
[00071740] 204b                      movea.l    a3,a0
Aob_create23x_11:
[00071742] 544f                      addq.w     #2,a7
[00071744] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[00071748] 4e75                      rts

Awi_create23x:
[0007174a] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[0007174e] 2648                      movea.l    a0,a3
[00071750] 203c 0000 00a2            move.l     #$000000A2,d0
[00071756] 4eb9 0004 c608            jsr        Ax_malloc
[0007175c] 2448                      movea.l    a0,a2
[0007175e] 203c 0000 008e            move.l     #$0000008E,d0
[00071764] 224b                      movea.l    a3,a1
[00071766] 4eb9 0008 3500            jsr        memcpy
[0007176c] 257c 0005 998a 008e       move.l     #Awi_iconify,142(a2)
[00071774] 257c 0005 9c6c 0092       move.l     #Awi_uniconify,146(a2)
[0007177c] 257c 0005 b5b6 0096       move.l     #Awi_gemscript,150(a2)
[00071784] 41f9 000e 4998            lea.l      $000E4998,a0
[0007178a] 4eb9 0004 643c            jsr        Ast_create
[00071790] 2548 009e                 move.l     a0,158(a2)
[00071794] 2548 009a                 move.l     a0,154(a2)
[00071798] 202a 0014                 move.l     20(a2),d0
[0007179c] 6716                      beq.s      Awi_create23x_1
[0007179e] 2040                      movea.l    d0,a0
[000717a0] 6100 fe8a                 bsr        Aob_create23x
[000717a4] 2548 0014                 move.l     a0,20(a2)
[000717a8] 2008                      move.l     a0,d0
[000717aa] 6700 007a                 beq.w      Awi_create23x_2
[000717ae] 4eb9 0004 fbdc            jsr        Aob_fix
Awi_create23x_1:
[000717b4] 202a 0018                 move.l     24(a2),d0
[000717b8] 6714                      beq.s      Awi_create23x_3
[000717ba] 2040                      movea.l    d0,a0
[000717bc] 6100 fe6e                 bsr        Aob_create23x
[000717c0] 2548 0018                 move.l     a0,24(a2)
[000717c4] 2008                      move.l     a0,d0
[000717c6] 6754                      beq.s      Awi_create23x_4
[000717c8] 4eb9 0004 fbdc            jsr        Aob_fix
Awi_create23x_3:
[000717ce] 202a 005e                 move.l     94(a2),d0
[000717d2] 671e                      beq.s      Awi_create23x_5
[000717d4] 2040                      movea.l    d0,a0
[000717d6] 6100 fe54                 bsr        Aob_create23x
[000717da] 2548 005e                 move.l     a0,94(a2)
[000717de] 2008                      move.l     a0,d0
[000717e0] 6730                      beq.s      Awi_create23x_6
[000717e2] 4eb9 0004 fbdc            jsr        Aob_fix
[000717e8] 206a 005e                 movea.l    94(a2),a0
[000717ec] 4eb9 0004 ec24            jsr        Ame_namefix
Awi_create23x_5:
[000717f2] 202a 005a                 move.l     90(a2),d0
[000717f6] 673a                      beq.s      Awi_create23x_7
[000717f8] 2040                      movea.l    d0,a0
[000717fa] 4eb9 0004 f606            jsr        Aic_create
[00071800] 2548 005a                 move.l     a0,90(a2)
[00071804] 2008                      move.l     a0,d0
[00071806] 662a                      bne.s      Awi_create23x_7
[00071808] 206a 005e                 movea.l    94(a2),a0
[0007180c] 4eb9 0004 f20a            jsr        Aob_delete
Awi_create23x_6:
[00071812] 206a 0018                 movea.l    24(a2),a0
[00071816] 4eb9 0004 f20a            jsr        Aob_delete
Awi_create23x_4:
[0007181c] 206a 0014                 movea.l    20(a2),a0
[00071820] 4eb9 0004 f20a            jsr        Aob_delete
Awi_create23x_2:
[00071826] 204a                      movea.l    a2,a0
[00071828] 4eb9 0004 c7c8            jsr        Ax_free
[0007182e] 6000 00f0                 bra        Awi_create23x_8
Awi_create23x_7:
[00071832] 204a                      movea.l    a2,a0
[00071834] 4eb9 0005 180a            jsr        Awi_uoself
[0007183a] 202a 004a                 move.l     74(a2),d0
[0007183e] 670c                      beq.s      Awi_create23x_9
[00071840] 2040                      movea.l    d0,a0
[00071842] 4eb9 0004 643c            jsr        Ast_create
[00071848] 2548 004a                 move.l     a0,74(a2)
Awi_create23x_9:
[0007184c] 202a 004e                 move.l     78(a2),d0
[00071850] 670c                      beq.s      Awi_create23x_10
[00071852] 2040                      movea.l    d0,a0
[00071854] 4eb9 0004 643c            jsr        Ast_create
[0007185a] 2548 004e                 move.l     a0,78(a2)
Awi_create23x_10:
[0007185e] 357c 0004 0056            move.w     #$0004,86(a2)
[00071864] 357c ffff 0058            move.w     #$FFFF,88(a2)
[0007186a] 357c ffff 001c            move.w     #$FFFF,28(a2)
[00071870] 426a 0052                 clr.w      82(a2)
[00071874] 4243                      clr.w      d3
[00071876] 47f9 0011 3f26            lea.l      _ACSv_winds,a3
[0007187c] 4bf9 000e 0d26            lea.l      Aroot_wi,a5
[00071882] 49f9 0010 ee4e            lea.l      ACSblk,a4
[00071888] 6000 007a                 bra.w      Awi_create23x_11
[0007188c] 3003                      move.w     d3,d0
Awi_create23x_16:
[0007188e] e548                      lsl.w      #2,d0
[00071890] 2233 0000                 move.l     0(a3,d0.w),d1
[00071894] 666c                      bne.s      Awi_create23x_12
[00071896] b679 0011 452a            cmp.w      _Wmax_wi,d3
[0007189c] 6f06                      ble.s      Awi_create23x_13
[0007189e] 33c3 0011 452a            move.w     d3,_Wmax_wi
Awi_create23x_13:
[000718a4] 3003                      move.w     d3,d0
[000718a6] e548                      lsl.w      #2,d0
[000718a8] 278a 0000                 move.l     a2,0(a3,d0.w)
[000718ac] 2215                      move.l     (a5),d1
[000718ae] 6716                      beq.s      Awi_create23x_14
[000718b0] 7401                      moveq.l    #1,d2
[000718b2] c46a 0054                 and.w      84(a2),d2
[000718b6] 670e                      beq.s      Awi_create23x_14
[000718b8] 224a                      movea.l    a2,a1
[000718ba] 2041                      movea.l    d1,a0
[000718bc] 2c41                      movea.l    d1,a6
[000718be] 2c6e 0004                 movea.l    4(a6),a6
[000718c2] 7064                      moveq.l    #100,d0
[000718c4] 4e96                      jsr        (a6)
Awi_create23x_14:
[000718c6] 302a 0024                 move.w     36(a2),d0
[000718ca] 2054                      movea.l    (a4),a0
[000718cc] c1e8 0012                 muls.w     18(a0),d0
[000718d0] 3540 0024                 move.w     d0,36(a2)
[000718d4] 322a 0026                 move.w     38(a2),d1
[000718d8] 2054                      movea.l    (a4),a0
[000718da] c3e8 0014                 muls.w     20(a0),d1
[000718de] 3541 0026                 move.w     d1,38(a2)
[000718e2] 302a 0028                 move.w     40(a2),d0
[000718e6] 2054                      movea.l    (a4),a0
[000718e8] c1e8 0012                 muls.w     18(a0),d0
[000718ec] 3540 0028                 move.w     d0,40(a2)
[000718f0] 322a 002a                 move.w     42(a2),d1
[000718f4] 2054                      movea.l    (a4),a0
[000718f6] c3e8 0014                 muls.w     20(a0),d1
[000718fa] 3541 002a                 move.w     d1,42(a2)
[000718fe] 204a                      movea.l    a2,a0
[00071900] 6020                      bra.s      Awi_create23x_15
Awi_create23x_12:
[00071902] 5243                      addq.w     #1,d3
Awi_create23x_11:
[00071904] b67c 0100                 cmp.w      #$0100,d3
[00071908] 6d00 ff82                 blt.w      Awi_create23x_16
[0007190c] 2279 000e 692a            movea.l    _globl,a1
[00071912] 41f9 000d 670e            lea.l      _A_ERR_WISLOT,a0
[00071918] 7001                      moveq.l    #1,d0
[0007191a] 4eb9 0007 a146            jsr        mt_form_alert
Awi_create23x_8:
[00071920] 91c8                      suba.l     a0,a0
Awi_create23x_15:
[00071922] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[00071926] 4e75                      rts

Awi_arrowed23x:
[00071928] 7201                      moveq.l    #1,d1
[0007192a] 4eb9 0005 217c            jsr        Awi_arrowed
[00071930] 4e75                      rts

Af_first230:
[00071932] 93c9                      suba.l     a1,a1
[00071934] 4eb9 0004 c0de            jsr        Af_first
[0007193a] 4e75                      rts

Af_next230:
[0007193c] 91c8                      suba.l     a0,a0
[0007193e] 4eb9 0004 c12c            jsr        Af_next
[00071944] 4e75                      rts

