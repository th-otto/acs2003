dotted_xline:
[00047518] 4fef fff2                 lea.l      -14(a7),a7
[0004751c] 3f40 000c                 move.w     d0,12(a7)
[00047520] 3f41 000a                 move.w     d1,10(a7)
[00047524] 3f42 0008                 move.w     d2,8(a7)
[00047528] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004752e] 302f 0008                 move.w     8(a7),d0
[00047532] b068 000a                 cmp.w      10(a0),d0
[00047536] 6e04                      bgt.s      dotted_xline_1
[00047538] 6000 00a6                 bra        dotted_xline_2
dotted_xline_1:
[0004753c] 7001                      moveq.l    #1,d0
[0004753e] c06f 0008                 and.w      8(a7),d0
[00047542] 6728                      beq.s      dotted_xline_3
[00047544] 0c79 aaaa 0011 158e       cmpi.w     #$AAAA,pattern
[0004754c] 671c                      beq.s      dotted_xline_4
[0004754e] 33fc aaaa 0011 158e       move.w     #$AAAA,pattern
[00047556] 323c aaaa                 move.w     #$AAAA,d1
[0004755a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047560] 3028 0010                 move.w     16(a0),d0
[00047564] 4eb9 0007 3118            jsr        vsl_udsty
dotted_xline_4:
[0004756a] 6026                      bra.s      dotted_xline_5
dotted_xline_3:
[0004756c] 0c79 5555 0011 158e       cmpi.w     #$5555,pattern
[00047574] 671c                      beq.s      dotted_xline_5
[00047576] 33fc 5555 0011 158e       move.w     #$5555,pattern
[0004757e] 323c 5555                 move.w     #$5555,d1
[00047582] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047588] 3028 0010                 move.w     16(a0),d0
[0004758c] 4eb9 0007 3118            jsr        vsl_udsty
dotted_xline_5:
[00047592] 3eaf 000c                 move.w     12(a7),(a7)
[00047596] 3f6f 000a 0004            move.w     10(a7),4(a7)
[0004759c] 302f 0008                 move.w     8(a7),d0
[000475a0] 3f40 0006                 move.w     d0,6(a7)
[000475a4] 3f40 0002                 move.w     d0,2(a7)
[000475a8] 7207                      moveq.l    #7,d1
[000475aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[000475b0] 3028 0010                 move.w     16(a0),d0
[000475b4] 4eb9 0007 30c4            jsr        vsl_type
[000475ba] 7201                      moveq.l    #1,d1
[000475bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000475c2] 3028 0010                 move.w     16(a0),d0
[000475c6] 4eb9 0007 316a            jsr        vsl_width
[000475cc] 41d7                      lea.l      (a7),a0
[000475ce] 7202                      moveq.l    #2,d1
[000475d0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000475d6] 3029 0010                 move.w     16(a1),d0
[000475da] 4eb9 0007 22e0            jsr        v_pline
dotted_xline_2:
[000475e0] 4fef 000e                 lea.l      14(a7),a7
[000475e4] 4e75                      rts

dotted_yline:
[000475e6] 4fef fff2                 lea.l      -14(a7),a7
[000475ea] 3f40 000c                 move.w     d0,12(a7)
[000475ee] 3f41 000a                 move.w     d1,10(a7)
[000475f2] 3f42 0008                 move.w     d2,8(a7)
[000475f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000475fc] 302f 0008                 move.w     8(a7),d0
[00047600] b068 0008                 cmp.w      8(a0),d0
[00047604] 6e04                      bgt.s      dotted_yline_1
[00047606] 6000 00ae                 bra        dotted_yline_2
dotted_yline_1:
[0004760a] 302f 000c                 move.w     12(a7),d0
[0004760e] 322f 0008                 move.w     8(a7),d1
[00047612] b340                      eor.w      d1,d0
[00047614] c07c 0001                 and.w      #$0001,d0
[00047618] 6728                      beq.s      dotted_yline_3
[0004761a] 0c79 aaaa 0011 158e       cmpi.w     #$AAAA,pattern
[00047622] 671c                      beq.s      dotted_yline_4
[00047624] 33fc aaaa 0011 158e       move.w     #$AAAA,pattern
[0004762c] 323c aaaa                 move.w     #$AAAA,d1
[00047630] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047636] 3028 0010                 move.w     16(a0),d0
[0004763a] 4eb9 0007 3118            jsr        vsl_udsty
dotted_yline_4:
[00047640] 6026                      bra.s      dotted_yline_5
dotted_yline_3:
[00047642] 0c79 5555 0011 158e       cmpi.w     #$5555,pattern
[0004764a] 671c                      beq.s      dotted_yline_5
[0004764c] 33fc 5555 0011 158e       move.w     #$5555,pattern
[00047654] 323c 5555                 move.w     #$5555,d1
[00047658] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004765e] 3028 0010                 move.w     16(a0),d0
[00047662] 4eb9 0007 3118            jsr        vsl_udsty
dotted_yline_5:
[00047668] 3f6f 000c 0002            move.w     12(a7),2(a7)
[0004766e] 3f6f 000a 0006            move.w     10(a7),6(a7)
[00047674] 302f 0008                 move.w     8(a7),d0
[00047678] 3f40 0004                 move.w     d0,4(a7)
[0004767c] 3e80                      move.w     d0,(a7)
[0004767e] 7207                      moveq.l    #7,d1
[00047680] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047686] 3028 0010                 move.w     16(a0),d0
[0004768a] 4eb9 0007 30c4            jsr        vsl_type
[00047690] 7201                      moveq.l    #1,d1
[00047692] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047698] 3028 0010                 move.w     16(a0),d0
[0004769c] 4eb9 0007 316a            jsr        vsl_width
[000476a2] 41d7                      lea.l      (a7),a0
[000476a4] 7202                      moveq.l    #2,d1
[000476a6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000476ac] 3029 0010                 move.w     16(a1),d0
[000476b0] 4eb9 0007 22e0            jsr        v_pline
dotted_yline_2:
[000476b6] 4fef 000e                 lea.l      14(a7),a7
[000476ba] 4e75                      rts

xline2:
[000476bc] 4fef fff2                 lea.l      -14(a7),a7
[000476c0] 3f40 000c                 move.w     d0,12(a7)
[000476c4] 3f41 000a                 move.w     d1,10(a7)
[000476c8] 3f42 0008                 move.w     d2,8(a7)
[000476cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000476d2] 302f 0008                 move.w     8(a7),d0
[000476d6] b068 000a                 cmp.w      10(a0),d0
[000476da] 6e04                      bgt.s      xline2_1
[000476dc] 6000 00a6                 bra        xline2_2
xline2_1:
[000476e0] 7001                      moveq.l    #1,d0
[000476e2] c06f 0008                 and.w      8(a7),d0
[000476e6] 6728                      beq.s      xline2_3
[000476e8] 0c79 5555 0011 158e       cmpi.w     #$5555,pattern
[000476f0] 671c                      beq.s      xline2_4
[000476f2] 33fc 5555 0011 158e       move.w     #$5555,pattern
[000476fa] 323c 5555                 move.w     #$5555,d1
[000476fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047704] 3028 0010                 move.w     16(a0),d0
[00047708] 4eb9 0007 3118            jsr        vsl_udsty
xline2_4:
[0004770e] 6026                      bra.s      xline2_5
xline2_3:
[00047710] 0c79 aaaa 0011 158e       cmpi.w     #$AAAA,pattern
[00047718] 671c                      beq.s      xline2_5
[0004771a] 33fc aaaa 0011 158e       move.w     #$AAAA,pattern
[00047722] 323c aaaa                 move.w     #$AAAA,d1
[00047726] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004772c] 3028 0010                 move.w     16(a0),d0
[00047730] 4eb9 0007 3118            jsr        vsl_udsty
xline2_5:
[00047736] 3eaf 000c                 move.w     12(a7),(a7)
[0004773a] 3f6f 000a 0004            move.w     10(a7),4(a7)
[00047740] 302f 0008                 move.w     8(a7),d0
[00047744] 3f40 0006                 move.w     d0,6(a7)
[00047748] 3f40 0002                 move.w     d0,2(a7)
[0004774c] 7207                      moveq.l    #7,d1
[0004774e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047754] 3028 0010                 move.w     16(a0),d0
[00047758] 4eb9 0007 30c4            jsr        vsl_type
[0004775e] 7201                      moveq.l    #1,d1
[00047760] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047766] 3028 0010                 move.w     16(a0),d0
[0004776a] 4eb9 0007 316a            jsr        vsl_width
[00047770] 41d7                      lea.l      (a7),a0
[00047772] 7202                      moveq.l    #2,d1
[00047774] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004777a] 3029 0010                 move.w     16(a1),d0
[0004777e] 4eb9 0007 22e0            jsr        v_pline
xline2_2:
[00047784] 4fef 000e                 lea.l      14(a7),a7
[00047788] 4e75                      rts

yline2:
[0004778a] 4fef fff2                 lea.l      -14(a7),a7
[0004778e] 3f40 000c                 move.w     d0,12(a7)
[00047792] 3f41 000a                 move.w     d1,10(a7)
[00047796] 3f42 0008                 move.w     d2,8(a7)
[0004779a] 2079 0010 ee4e            movea.l    ACSblk,a0
[000477a0] 302f 0008                 move.w     8(a7),d0
[000477a4] b068 0008                 cmp.w      8(a0),d0
[000477a8] 6e04                      bgt.s      yline2_1
[000477aa] 6000 00ae                 bra        yline2_2
yline2_1:
[000477ae] 302f 000c                 move.w     12(a7),d0
[000477b2] 322f 0008                 move.w     8(a7),d1
[000477b6] b340                      eor.w      d1,d0
[000477b8] c07c 0001                 and.w      #$0001,d0
[000477bc] 6728                      beq.s      yline2_3
[000477be] 0c79 5555 0011 158e       cmpi.w     #$5555,pattern
[000477c6] 671c                      beq.s      yline2_4
[000477c8] 33fc 5555 0011 158e       move.w     #$5555,pattern
[000477d0] 323c 5555                 move.w     #$5555,d1
[000477d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000477da] 3028 0010                 move.w     16(a0),d0
[000477de] 4eb9 0007 3118            jsr        vsl_udsty
yline2_4:
[000477e4] 6026                      bra.s      yline2_5
yline2_3:
[000477e6] 0c79 aaaa 0011 158e       cmpi.w     #$AAAA,pattern
[000477ee] 671c                      beq.s      yline2_5
[000477f0] 33fc aaaa 0011 158e       move.w     #$AAAA,pattern
[000477f8] 323c aaaa                 move.w     #$AAAA,d1
[000477fc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047802] 3028 0010                 move.w     16(a0),d0
[00047806] 4eb9 0007 3118            jsr        vsl_udsty
yline2_5:
[0004780c] 3f6f 000c 0002            move.w     12(a7),2(a7)
[00047812] 3f6f 000a 0006            move.w     10(a7),6(a7)
[00047818] 302f 0008                 move.w     8(a7),d0
[0004781c] 3f40 0004                 move.w     d0,4(a7)
[00047820] 3e80                      move.w     d0,(a7)
[00047822] 7207                      moveq.l    #7,d1
[00047824] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004782a] 3028 0010                 move.w     16(a0),d0
[0004782e] 4eb9 0007 30c4            jsr        vsl_type
[00047834] 7201                      moveq.l    #1,d1
[00047836] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004783c] 3028 0010                 move.w     16(a0),d0
[00047840] 4eb9 0007 316a            jsr        vsl_width
[00047846] 41d7                      lea.l      (a7),a0
[00047848] 7202                      moveq.l    #2,d1
[0004784a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00047850] 3029 0010                 move.w     16(a1),d0
[00047854] 4eb9 0007 22e0            jsr        v_pline
yline2_2:
[0004785a] 4fef 000e                 lea.l      14(a7),a7
[0004785e] 4e75                      rts

drag_set:
[00047860] 4fef ffee                 lea.l      -18(a7),a7
[00047864] 426f 0010                 clr.w      16(a7)
[00047868] 6000 0254                 bra        drag_set_1
[0004786c] 0c6f 0200 0010            cmpi.w     #$0200,16(a7)
drag_set_9:
[00047872] 6d04                      blt.s      drag_set_2
[00047874] 6000 025a                 bra        drag_set_3
drag_set_2:
[00047878] 302f 0010                 move.w     16(a7),d0
[0004787c] 48c0                      ext.l      d0
[0004787e] d080                      add.l      d0,d0
[00047880] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047886] 2068 0254                 movea.l    596(a0),a0
[0004788a] 3f70 0800 000c            move.w     0(a0,d0.l),12(a7)
[00047890] 302f 000c                 move.w     12(a7),d0
[00047894] c07c 1000                 and.w      #$1000,d0
[00047898] 6718                      beq.s      drag_set_4
[0004789a] 2079 0010 ee4e            movea.l    ACSblk,a0
[000478a0] 2068 0240                 movea.l    576(a0),a0
[000478a4] 2f68 0018 0004            move.l     24(a0),4(a7)
[000478aa] 026f 0fff 000c            andi.w     #$0FFF,12(a7)
[000478b0] 6010                      bra.s      drag_set_5
drag_set_4:
[000478b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000478b8] 2068 0240                 movea.l    576(a0),a0
[000478bc] 2f68 0014 0004            move.l     20(a0),4(a7)
drag_set_5:
[000478c2] 2f39 000e 692a            move.l     _globl,-(a7)
[000478c8] 486f 000c                 pea.l      12(a7)
[000478cc] 43ef 0012                 lea.l      18(a7),a1
[000478d0] 302f 0014                 move.w     20(a7),d0
[000478d4] 206f 000c                 movea.l    12(a7),a0
[000478d8] 4eb9 0007 9d14            jsr        mt_objc_offset
[000478de] 504f                      addq.w     #8,a7
[000478e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000478e6] 2068 0240                 movea.l    576(a0),a0
[000478ea] 3028 0034                 move.w     52(a0),d0
[000478ee] d16f 000a                 add.w      d0,10(a7)
[000478f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000478f8] 2068 0240                 movea.l    576(a0),a0
[000478fc] 3028 0036                 move.w     54(a0),d0
[00047900] d16f 0008                 add.w      d0,8(a7)
[00047904] 322f 000c                 move.w     12(a7),d1
[00047908] 48c1                      ext.l      d1
[0004790a] 2001                      move.l     d1,d0
[0004790c] d080                      add.l      d0,d0
[0004790e] d081                      add.l      d1,d0
[00047910] e788                      lsl.l      #3,d0
[00047912] 206f 0004                 movea.l    4(a7),a0
[00047916] 3030 0806                 move.w     6(a0,d0.l),d0
[0004791a] c07c 00ff                 and.w      #$00FF,d0
[0004791e] 3f40 000e                 move.w     d0,14(a7)
[00047922] 0c6f 001f 000e            cmpi.w     #$001F,14(a7)
[00047928] 670a                      beq.s      drag_set_6
[0004792a] 0c6f 0021 000e            cmpi.w     #$0021,14(a7)
[00047930] 6600 00fc                 bne        drag_set_7
drag_set_6:
[00047934] 322f 000c                 move.w     12(a7),d1
[00047938] 48c1                      ext.l      d1
[0004793a] 2001                      move.l     d1,d0
[0004793c] d080                      add.l      d0,d0
[0004793e] d081                      add.l      d1,d0
[00047940] e788                      lsl.l      #3,d0
[00047942] 206f 0004                 movea.l    4(a7),a0
[00047946] 2eb0 080c                 move.l     12(a0,d0.l),(a7)
[0004794a] 302f 000a                 move.w     10(a7),d0
[0004794e] 2057                      movea.l    (a7),a0
[00047950] d068 001a                 add.w      26(a0),d0
[00047954] 322f 0010                 move.w     16(a7),d1
[00047958] e949                      lsl.w      #4,d1
[0004795a] 41f9 0011 1590            lea.l      drags,a0
[00047960] 3180 1000                 move.w     d0,0(a0,d1.w)
[00047964] 302f 000a                 move.w     10(a7),d0
[00047968] 2057                      movea.l    (a7),a0
[0004796a] d068 0012                 add.w      18(a0),d0
[0004796e] 322f 0010                 move.w     16(a7),d1
[00047972] e949                      lsl.w      #4,d1
[00047974] 41f9 0011 1590            lea.l      drags,a0
[0004797a] 3180 1004                 move.w     d0,4(a0,d1.w)
[0004797e] 302f 000a                 move.w     10(a7),d0
[00047982] 2057                      movea.l    (a7),a0
[00047984] d068 0012                 add.w      18(a0),d0
[00047988] 2057                      movea.l    (a7),a0
[0004798a] d068 0016                 add.w      22(a0),d0
[0004798e] 5340                      subq.w     #1,d0
[00047990] 322f 0010                 move.w     16(a7),d1
[00047994] e949                      lsl.w      #4,d1
[00047996] 41f9 0011 1590            lea.l      drags,a0
[0004799c] 3180 1008                 move.w     d0,8(a0,d1.w)
[000479a0] 302f 000a                 move.w     10(a7),d0
[000479a4] 2057                      movea.l    (a7),a0
[000479a6] d068 001a                 add.w      26(a0),d0
[000479aa] 2057                      movea.l    (a7),a0
[000479ac] d068 001e                 add.w      30(a0),d0
[000479b0] 5340                      subq.w     #1,d0
[000479b2] 322f 0010                 move.w     16(a7),d1
[000479b6] e949                      lsl.w      #4,d1
[000479b8] 41f9 0011 1590            lea.l      drags,a0
[000479be] 3180 100c                 move.w     d0,12(a0,d1.w)
[000479c2] 302f 0008                 move.w     8(a7),d0
[000479c6] 2057                      movea.l    (a7),a0
[000479c8] d068 0014                 add.w      20(a0),d0
[000479cc] 322f 0010                 move.w     16(a7),d1
[000479d0] e949                      lsl.w      #4,d1
[000479d2] 41f9 0011 1590            lea.l      drags,a0
[000479d8] 3180 1002                 move.w     d0,2(a0,d1.w)
[000479dc] 302f 0008                 move.w     8(a7),d0
[000479e0] 2057                      movea.l    (a7),a0
[000479e2] d068 001c                 add.w      28(a0),d0
[000479e6] 322f 0010                 move.w     16(a7),d1
[000479ea] e949                      lsl.w      #4,d1
[000479ec] 41f9 0011 1590            lea.l      drags,a0
[000479f2] 3180 1006                 move.w     d0,6(a0,d1.w)
[000479f6] 302f 0008                 move.w     8(a7),d0
[000479fa] 2057                      movea.l    (a7),a0
[000479fc] d068 001c                 add.w      28(a0),d0
[00047a00] 2057                      movea.l    (a7),a0
[00047a02] d068 0020                 add.w      32(a0),d0
[00047a06] 5340                      subq.w     #1,d0
[00047a08] 322f 0010                 move.w     16(a7),d1
[00047a0c] e949                      lsl.w      #4,d1
[00047a0e] 41f9 0011 1590            lea.l      drags,a0
[00047a14] 3180 100a                 move.w     d0,10(a0,d1.w)
[00047a18] 302f 0010                 move.w     16(a7),d0
[00047a1c] e948                      lsl.w      #4,d0
[00047a1e] 41f9 0011 1590            lea.l      drags,a0
[00047a24] 31bc 0001 000e            move.w     #$0001,14(a0,d0.w)
[00047a2a] 6000 008e                 bra        drag_set_8
drag_set_7:
[00047a2e] 302f 0010                 move.w     16(a7),d0
[00047a32] e948                      lsl.w      #4,d0
[00047a34] 41f9 0011 1590            lea.l      drags,a0
[00047a3a] 31af 000a 0000            move.w     10(a7),0(a0,d0.w)
[00047a40] 302f 0010                 move.w     16(a7),d0
[00047a44] e948                      lsl.w      #4,d0
[00047a46] 41f9 0011 1590            lea.l      drags,a0
[00047a4c] 31af 0008 0002            move.w     8(a7),2(a0,d0.w)
[00047a52] 302f 000a                 move.w     10(a7),d0
[00047a56] 342f 000c                 move.w     12(a7),d2
[00047a5a] 48c2                      ext.l      d2
[00047a5c] 2202                      move.l     d2,d1
[00047a5e] d281                      add.l      d1,d1
[00047a60] d282                      add.l      d2,d1
[00047a62] e789                      lsl.l      #3,d1
[00047a64] 206f 0004                 movea.l    4(a7),a0
[00047a68] d070 1814                 add.w      20(a0,d1.l),d0
[00047a6c] 5340                      subq.w     #1,d0
[00047a6e] 322f 0010                 move.w     16(a7),d1
[00047a72] e949                      lsl.w      #4,d1
[00047a74] 41f9 0011 1590            lea.l      drags,a0
[00047a7a] 3180 1004                 move.w     d0,4(a0,d1.w)
[00047a7e] 302f 0008                 move.w     8(a7),d0
[00047a82] 342f 000c                 move.w     12(a7),d2
[00047a86] 48c2                      ext.l      d2
[00047a88] 2202                      move.l     d2,d1
[00047a8a] d281                      add.l      d1,d1
[00047a8c] d282                      add.l      d2,d1
[00047a8e] e789                      lsl.l      #3,d1
[00047a90] 206f 0004                 movea.l    4(a7),a0
[00047a94] d070 1816                 add.w      22(a0,d1.l),d0
[00047a98] 5340                      subq.w     #1,d0
[00047a9a] 322f 0010                 move.w     16(a7),d1
[00047a9e] e949                      lsl.w      #4,d1
[00047aa0] 41f9 0011 1590            lea.l      drags,a0
[00047aa6] 3180 1006                 move.w     d0,6(a0,d1.w)
[00047aaa] 302f 0010                 move.w     16(a7),d0
[00047aae] e948                      lsl.w      #4,d0
[00047ab0] 41f9 0011 1590            lea.l      drags,a0
[00047ab6] 4270 000e                 clr.w      14(a0,d0.w)
drag_set_8:
[00047aba] 526f 0010                 addq.w     #1,16(a7)
drag_set_1:
[00047abe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047ac4] 302f 0010                 move.w     16(a7),d0
[00047ac8] b068 0246                 cmp.w      582(a0),d0
[00047acc] 6d00 fd9e                 blt        drag_set_9
drag_set_3:
[00047ad0] 4fef 0012                 lea.l      18(a7),a7
[00047ad4] 4e75                      rts

drag_draw:
[00047ad6] 4fef ffe4                 lea.l      -28(a7),a7
[00047ada] 3f40 001a                 move.w     d0,26(a7)
[00047ade] 3f41 0018                 move.w     d1,24(a7)
[00047ae2] 7203                      moveq.l    #3,d1
[00047ae4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047aea] 3028 0010                 move.w     16(a0),d0
[00047aee] 4eb9 0007 3070            jsr        vswr_mode
[00047af4] 4242                      clr.w      d2
[00047af6] 4241                      clr.w      d1
[00047af8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047afe] 3028 0010                 move.w     16(a0),d0
[00047b02] 4eb9 0007 3214            jsr        vsl_ends
[00047b08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047b0e] 3ea8 0008                 move.w     8(a0),(a7)
[00047b12] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047b18] 3f68 000a 0002            move.w     10(a0),2(a7)
[00047b1e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047b24] 3028 0008                 move.w     8(a0),d0
[00047b28] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047b2e] d068 000c                 add.w      12(a0),d0
[00047b32] 5340                      subq.w     #1,d0
[00047b34] 3f40 0004                 move.w     d0,4(a7)
[00047b38] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047b3e] 3028 000a                 move.w     10(a0),d0
[00047b42] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047b48] d068 000e                 add.w      14(a0),d0
[00047b4c] 5340                      subq.w     #1,d0
[00047b4e] 3f40 0006                 move.w     d0,6(a7)
[00047b52] 41d7                      lea.l      (a7),a0
[00047b54] 7201                      moveq.l    #1,d1
[00047b56] 2279 0010 ee4e            movea.l    ACSblk,a1
[00047b5c] 3029 0010                 move.w     16(a1),d0
[00047b60] 4eb9 0007 2230            jsr        vs_clip
[00047b66] 2279 000e 692a            movea.l    _globl,a1
[00047b6c] 91c8                      suba.l     a0,a0
[00047b6e] 303c 0100                 move.w     #$0100,d0
[00047b72] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00047b78] 4240                      clr.w      d0
[00047b7a] 3f40 0016                 move.w     d0,22(a7)
[00047b7e] 33c0 0011 158e            move.w     d0,pattern
[00047b84] 6000 0254                 bra        drag_draw_1
[00047b88] 0c6f 0200 0016            cmpi.w     #$0200,22(a7)
drag_draw_9:
[00047b8e] 6d04                      blt.s      drag_draw_2
[00047b90] 6000 025a                 bra        drag_draw_3
drag_draw_2:
[00047b94] 302f 0016                 move.w     22(a7),d0
[00047b98] e948                      lsl.w      #4,d0
[00047b9a] 41f9 0011 1590            lea.l      drags,a0
[00047ba0] 0c70 0001 000e            cmpi.w     #$0001,14(a0,d0.w)
[00047ba6] 6600 016e                 bne        drag_draw_4
[00047baa] 302f 001a                 move.w     26(a7),d0
[00047bae] 322f 0016                 move.w     22(a7),d1
[00047bb2] e949                      lsl.w      #4,d1
[00047bb4] 41f9 0011 1590            lea.l      drags,a0
[00047bba] d070 1000                 add.w      0(a0,d1.w),d0
[00047bbe] 3f40 0014                 move.w     d0,20(a7)
[00047bc2] 302f 001a                 move.w     26(a7),d0
[00047bc6] 322f 0016                 move.w     22(a7),d1
[00047bca] e949                      lsl.w      #4,d1
[00047bcc] 41f9 0011 1590            lea.l      drags,a0
[00047bd2] d070 1004                 add.w      4(a0,d1.w),d0
[00047bd6] 3f40 0010                 move.w     d0,16(a7)
[00047bda] 302f 001a                 move.w     26(a7),d0
[00047bde] 322f 0016                 move.w     22(a7),d1
[00047be2] e949                      lsl.w      #4,d1
[00047be4] 41f9 0011 1590            lea.l      drags,a0
[00047bea] d070 1008                 add.w      8(a0,d1.w),d0
[00047bee] 3f40 000c                 move.w     d0,12(a7)
[00047bf2] 302f 001a                 move.w     26(a7),d0
[00047bf6] 322f 0016                 move.w     22(a7),d1
[00047bfa] e949                      lsl.w      #4,d1
[00047bfc] 41f9 0011 1590            lea.l      drags,a0
[00047c02] d070 100c                 add.w      12(a0,d1.w),d0
[00047c06] 3f40 0008                 move.w     d0,8(a7)
[00047c0a] 302f 0018                 move.w     24(a7),d0
[00047c0e] 322f 0016                 move.w     22(a7),d1
[00047c12] e949                      lsl.w      #4,d1
[00047c14] 41f9 0011 1590            lea.l      drags,a0
[00047c1a] d070 1002                 add.w      2(a0,d1.w),d0
[00047c1e] 3f40 0012                 move.w     d0,18(a7)
[00047c22] 302f 0018                 move.w     24(a7),d0
[00047c26] 322f 0016                 move.w     22(a7),d1
[00047c2a] e949                      lsl.w      #4,d1
[00047c2c] 41f9 0011 1590            lea.l      drags,a0
[00047c32] d070 1006                 add.w      6(a0,d1.w),d0
[00047c36] 3f40 000e                 move.w     d0,14(a7)
[00047c3a] 302f 0018                 move.w     24(a7),d0
[00047c3e] 322f 0016                 move.w     22(a7),d1
[00047c42] e949                      lsl.w      #4,d1
[00047c44] 41f9 0011 1590            lea.l      drags,a0
[00047c4a] d070 100a                 add.w      10(a0,d1.w),d0
[00047c4e] 3f40 000a                 move.w     d0,10(a7)
[00047c52] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047c58] 302f 0012                 move.w     18(a7),d0
[00047c5c] b068 000a                 cmp.w      10(a0),d0
[00047c60] 6c10                      bge.s      drag_draw_5
[00047c62] 70fe                      moveq.l    #-2,d0
[00047c64] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047c6a] d068 000a                 add.w      10(a0),d0
[00047c6e] 3f40 0012                 move.w     d0,18(a7)
drag_draw_5:
[00047c72] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047c78] 302f 000e                 move.w     14(a7),d0
[00047c7c] b068 000a                 cmp.w      10(a0),d0
[00047c80] 6c10                      bge.s      drag_draw_6
[00047c82] 70fe                      moveq.l    #-2,d0
[00047c84] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047c8a] d068 000a                 add.w      10(a0),d0
[00047c8e] 3f40 000e                 move.w     d0,14(a7)
drag_draw_6:
[00047c92] 342f 0012                 move.w     18(a7),d2
[00047c96] 322f 000c                 move.w     12(a7),d1
[00047c9a] 302f 0010                 move.w     16(a7),d0
[00047c9e] 6100 f878                 bsr        dotted_xline
[00047ca2] 342f 000e                 move.w     14(a7),d2
[00047ca6] 322f 0010                 move.w     16(a7),d1
[00047caa] 302f 0014                 move.w     20(a7),d0
[00047cae] 6100 f868                 bsr        dotted_xline
[00047cb2] 342f 000e                 move.w     14(a7),d2
[00047cb6] 322f 0008                 move.w     8(a7),d1
[00047cba] 302f 000c                 move.w     12(a7),d0
[00047cbe] 6100 f858                 bsr        dotted_xline
[00047cc2] 342f 000a                 move.w     10(a7),d2
[00047cc6] 322f 0008                 move.w     8(a7),d1
[00047cca] 302f 0014                 move.w     20(a7),d0
[00047cce] 6100 f848                 bsr        dotted_xline
[00047cd2] 342f 0014                 move.w     20(a7),d2
[00047cd6] 322f 000a                 move.w     10(a7),d1
[00047cda] 302f 000e                 move.w     14(a7),d0
[00047cde] 6100 f906                 bsr        dotted_yline
[00047ce2] 342f 0010                 move.w     16(a7),d2
[00047ce6] 322f 000e                 move.w     14(a7),d1
[00047cea] 302f 0012                 move.w     18(a7),d0
[00047cee] 6100 f8f6                 bsr        dotted_yline
[00047cf2] 342f 000c                 move.w     12(a7),d2
[00047cf6] 322f 000e                 move.w     14(a7),d1
[00047cfa] 302f 0012                 move.w     18(a7),d0
[00047cfe] 6100 f8e6                 bsr        dotted_yline
[00047d02] 342f 0008                 move.w     8(a7),d2
[00047d06] 322f 000a                 move.w     10(a7),d1
[00047d0a] 302f 000e                 move.w     14(a7),d0
[00047d0e] 6100 f8d6                 bsr        dotted_yline
[00047d12] 6000 00c2                 bra        drag_draw_7
drag_draw_4:
[00047d16] 302f 001a                 move.w     26(a7),d0
[00047d1a] 322f 0016                 move.w     22(a7),d1
[00047d1e] e949                      lsl.w      #4,d1
[00047d20] 41f9 0011 1590            lea.l      drags,a0
[00047d26] d070 1000                 add.w      0(a0,d1.w),d0
[00047d2a] 3f40 0014                 move.w     d0,20(a7)
[00047d2e] 302f 001a                 move.w     26(a7),d0
[00047d32] 322f 0016                 move.w     22(a7),d1
[00047d36] e949                      lsl.w      #4,d1
[00047d38] 41f9 0011 1590            lea.l      drags,a0
[00047d3e] d070 1004                 add.w      4(a0,d1.w),d0
[00047d42] 3f40 0010                 move.w     d0,16(a7)
[00047d46] 302f 0018                 move.w     24(a7),d0
[00047d4a] 322f 0016                 move.w     22(a7),d1
[00047d4e] e949                      lsl.w      #4,d1
[00047d50] 41f9 0011 1590            lea.l      drags,a0
[00047d56] d070 1002                 add.w      2(a0,d1.w),d0
[00047d5a] 3f40 0012                 move.w     d0,18(a7)
[00047d5e] 302f 0018                 move.w     24(a7),d0
[00047d62] 322f 0016                 move.w     22(a7),d1
[00047d66] e949                      lsl.w      #4,d1
[00047d68] 41f9 0011 1590            lea.l      drags,a0
[00047d6e] d070 1006                 add.w      6(a0,d1.w),d0
[00047d72] 3f40 000e                 move.w     d0,14(a7)
[00047d76] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047d7c] 302f 0012                 move.w     18(a7),d0
[00047d80] b068 000a                 cmp.w      10(a0),d0
[00047d84] 6c10                      bge.s      drag_draw_8
[00047d86] 70fe                      moveq.l    #-2,d0
[00047d88] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047d8e] d068 000a                 add.w      10(a0),d0
[00047d92] 3f40 0012                 move.w     d0,18(a7)
drag_draw_8:
[00047d96] 342f 0012                 move.w     18(a7),d2
[00047d9a] 322f 0010                 move.w     16(a7),d1
[00047d9e] 302f 0014                 move.w     20(a7),d0
[00047da2] 6100 f774                 bsr        dotted_xline
[00047da6] 342f 000e                 move.w     14(a7),d2
[00047daa] 322f 0010                 move.w     16(a7),d1
[00047dae] 302f 0014                 move.w     20(a7),d0
[00047db2] 6100 f764                 bsr        dotted_xline
[00047db6] 342f 0014                 move.w     20(a7),d2
[00047dba] 322f 000e                 move.w     14(a7),d1
[00047dbe] 302f 0012                 move.w     18(a7),d0
[00047dc2] 6100 f822                 bsr        dotted_yline
[00047dc6] 342f 0010                 move.w     16(a7),d2
[00047dca] 322f 000e                 move.w     14(a7),d1
[00047dce] 302f 0012                 move.w     18(a7),d0
[00047dd2] 6100 f812                 bsr        dotted_yline
drag_draw_7:
[00047dd6] 526f 0016                 addq.w     #1,22(a7)
drag_draw_1:
[00047dda] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047de0] 302f 0016                 move.w     22(a7),d0
[00047de4] b068 0246                 cmp.w      582(a0),d0
[00047de8] 6d00 fd9e                 blt        drag_draw_9
drag_draw_3:
[00047dec] 2279 000e 692a            movea.l    _globl,a1
[00047df2] 91c8                      suba.l     a0,a0
[00047df4] 303c 0101                 move.w     #$0101,d0
[00047df8] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00047dfe] 41d7                      lea.l      (a7),a0
[00047e00] 4241                      clr.w      d1
[00047e02] 2279 0010 ee4e            movea.l    ACSblk,a1
[00047e08] 3029 0010                 move.w     16(a1),d0
[00047e0c] 4eb9 0007 2230            jsr        vs_clip
[00047e12] 4279 0011 158e            clr.w      pattern
[00047e18] 4fef 001c                 lea.l      28(a7),a7
[00047e1c] 4e75                      rts

Adr_start:
[00047e1e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047e24] 4268 0248                 clr.w      584(a0)
[00047e28] 4e75                      rts

Adr_next:
[00047e2a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047e30] 3028 0248                 move.w     584(a0),d0
[00047e34] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047e3a] b068 0246                 cmp.w      582(a0),d0
[00047e3e] 6d06                      blt.s      Adr_next_1
[00047e40] 70ff                      moveq.l    #-1,d0
[00047e42] 4e75                      rts
Adr_next_1:

[00047e44] 4e75                      rts

[00047e46] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047e4c] 3028 0248                 move.w     584(a0),d0
[00047e50] 5268 0248                 addq.w     #1,584(a0)
[00047e54] 48c0                      ext.l      d0
[00047e56] d080                      add.l      d0,d0
[00047e58] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047e5e] 2068 0254                 movea.l    596(a0),a0
[00047e62] 3030 0800                 move.w     0(a0,d0.l),d0
[00047e66] 4e71                      nop
[00047e68] 4e75                      rts

Adr_add:
[00047e6a] 2f0a                      move.l     a2,-(a7)
[00047e6c] 4fef fff2                 lea.l      -14(a7),a7
[00047e70] 2f48 000a                 move.l     a0,10(a7)
[00047e74] 3f40 0008                 move.w     d0,8(a7)
[00047e78] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047e7e] 2068 0240                 movea.l    576(a0),a0
[00047e82] b1ef 000a                 cmpa.l     10(a7),a0
[00047e86] 6712                      beq.s      Adr_add_1
[00047e88] 4eb9 0004 810e            jsr        Adr_unselect
[00047e8e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047e94] 216f 000a 0240            move.l     10(a7),576(a0)
Adr_add_1:
[00047e9a] 302f 0008                 move.w     8(a7),d0
[00047e9e] c07c 1000                 and.w      #$1000,d0
[00047ea2] 670a                      beq.s      Adr_add_2
[00047ea4] 206f 000a                 movea.l    10(a7),a0
[00047ea8] 2ea8 0018                 move.l     24(a0),(a7)
[00047eac] 6008                      bra.s      Adr_add_3
Adr_add_2:
[00047eae] 206f 000a                 movea.l    10(a7),a0
[00047eb2] 2ea8 0014                 move.l     20(a0),(a7)
Adr_add_3:
[00047eb6] 426f 0004                 clr.w      4(a7)
[00047eba] 6024                      bra.s      Adr_add_4
[00047ebc] 302f 0004                 move.w     4(a7),d0
Adr_add_7:
[00047ec0] 48c0                      ext.l      d0
[00047ec2] d080                      add.l      d0,d0
[00047ec4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047eca] 2068 0254                 movea.l    596(a0),a0
[00047ece] 3030 0800                 move.w     0(a0,d0.l),d0
[00047ed2] b06f 0008                 cmp.w      8(a7),d0
[00047ed6] 6604                      bne.s      Adr_add_5
[00047ed8] 6000 0094                 bra        Adr_add_6
Adr_add_5:
[00047edc] 526f 0004                 addq.w     #1,4(a7)
Adr_add_4:
[00047ee0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047ee6] 302f 0004                 move.w     4(a7),d0
[00047eea] b068 0246                 cmp.w      582(a0),d0
[00047eee] 6dcc                      blt.s      Adr_add_7
[00047ef0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047ef6] 3028 0246                 move.w     582(a0),d0
[00047efa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047f00] b068 0244                 cmp.w      580(a0),d0
[00047f04] 6c68                      bge.s      Adr_add_6
[00047f06] 7201                      moveq.l    #1,d1
[00047f08] 342f 0008                 move.w     8(a7),d2
[00047f0c] c47c 0fff                 and.w      #$0FFF,d2
[00047f10] 48c2                      ext.l      d2
[00047f12] 2002                      move.l     d2,d0
[00047f14] d080                      add.l      d0,d0
[00047f16] d082                      add.l      d2,d0
[00047f18] e788                      lsl.l      #3,d0
[00047f1a] 2057                      movea.l    (a7),a0
[00047f1c] 8270 080a                 or.w       10(a0,d0.l),d1
[00047f20] 302f 0008                 move.w     8(a7),d0
[00047f24] 206f 000a                 movea.l    10(a7),a0
[00047f28] 226f 000a                 movea.l    10(a7),a1
[00047f2c] 2269 0066                 movea.l    102(a1),a1
[00047f30] 4e91                      jsr        (a1)
[00047f32] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047f38] 3028 0246                 move.w     582(a0),d0
[00047f3c] 5268 0246                 addq.w     #1,582(a0)
[00047f40] 48c0                      ext.l      d0
[00047f42] d080                      add.l      d0,d0
[00047f44] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047f4a] 2068 0254                 movea.l    596(a0),a0
[00047f4e] 31af 0008 0800            move.w     8(a7),0(a0,d0.l)
[00047f54] 3f6f 0008 0006            move.w     8(a7),6(a7)
[00047f5a] 43ef 0006                 lea.l      6(a7),a1
[00047f5e] 7005                      moveq.l    #5,d0
[00047f60] 206f 000a                 movea.l    10(a7),a0
[00047f64] 246f 000a                 movea.l    10(a7),a2
[00047f68] 246a 0004                 movea.l    4(a2),a2
[00047f6c] 4e92                      jsr        (a2)
Adr_add_6:
[00047f6e] 4fef 000e                 lea.l      14(a7),a7
[00047f72] 245f                      movea.l    (a7)+,a2
[00047f74] 4e75                      rts

Adr_del:
[00047f76] 2f0a                      move.l     a2,-(a7)
[00047f78] 4fef ffea                 lea.l      -22(a7),a7
[00047f7c] 2f48 0012                 move.l     a0,18(a7)
[00047f80] 3f40 0010                 move.w     d0,16(a7)
[00047f84] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047f8a] 2068 0240                 movea.l    576(a0),a0
[00047f8e] b1ef 0012                 cmpa.l     18(a7),a0
[00047f92] 6704                      beq.s      Adr_del_1
[00047f94] 6000 0170                 bra        Adr_del_2
Adr_del_1:
[00047f98] 302f 0010                 move.w     16(a7),d0
[00047f9c] c07c 1000                 and.w      #$1000,d0
[00047fa0] 670c                      beq.s      Adr_del_3
[00047fa2] 206f 0012                 movea.l    18(a7),a0
[00047fa6] 2f68 0018 0004            move.l     24(a0),4(a7)
[00047fac] 600a                      bra.s      Adr_del_4
Adr_del_3:
[00047fae] 206f 0012                 movea.l    18(a7),a0
[00047fb2] 2f68 0014 0004            move.l     20(a0),4(a7)
Adr_del_4:
[00047fb8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047fbe] 3f68 0246 000c            move.w     582(a0),12(a7)
[00047fc4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00047fca] 2f68 0254 0008            move.l     596(a0),8(a7)
[00047fd0] 6000 0116                 bra        Adr_del_5
[00047fd4] 206f 0008                 movea.l    8(a7),a0
Adr_del_10:
[00047fd8] 3010                      move.w     (a0),d0
[00047fda] b06f 0010                 cmp.w      16(a7),d0
[00047fde] 6600 0100                 bne        Adr_del_6
[00047fe2] 342f 0010                 move.w     16(a7),d2
[00047fe6] c47c 0fff                 and.w      #$0FFF,d2
[00047fea] 48c2                      ext.l      d2
[00047fec] 2002                      move.l     d2,d0
[00047fee] d080                      add.l      d0,d0
[00047ff0] d082                      add.l      d2,d0
[00047ff2] e788                      lsl.l      #3,d0
[00047ff4] 206f 0004                 movea.l    4(a7),a0
[00047ff8] 3230 080a                 move.w     10(a0,d0.l),d1
[00047ffc] c27c fffe                 and.w      #$FFFE,d1
[00048000] 302f 0010                 move.w     16(a7),d0
[00048004] 206f 0012                 movea.l    18(a7),a0
[00048008] 226f 0012                 movea.l    18(a7),a1
[0004800c] 2269 0066                 movea.l    102(a1),a1
[00048010] 4e91                      jsr        (a1)
[00048012] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048018] 3028 0246                 move.w     582(a0),d0
[0004801c] 906f 000c                 sub.w      12(a7),d0
[00048020] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048026] b068 0248                 cmp.w      584(a0),d0
[0004802a] 6c0a                      bge.s      Adr_del_7
[0004802c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048032] 5368 0248                 subq.w     #1,584(a0)
Adr_del_7:
[00048036] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004803c] 5368 0246                 subq.w     #1,582(a0)
[00048040] 302f 000c                 move.w     12(a7),d0
[00048044] e948                      lsl.w      #4,d0
[00048046] 41f9 0011 1590            lea.l      drags,a0
[0004804c] d0c0                      adda.w     d0,a0
[0004804e] 2e88                      move.l     a0,(a7)
[00048050] 536f 000c                 subq.w     #1,12(a7)
[00048054] 6068                      bra.s      Adr_del_8
[00048056] 2057                      movea.l    (a7),a0
Adr_del_9:
[00048058] 2257                      movea.l    (a7),a1
[0004805a] 32a8 0010                 move.w     16(a0),(a1)
[0004805e] 2057                      movea.l    (a7),a0
[00048060] 2257                      movea.l    (a7),a1
[00048062] 3368 0012 0002            move.w     18(a0),2(a1)
[00048068] 2057                      movea.l    (a7),a0
[0004806a] 2257                      movea.l    (a7),a1
[0004806c] 3368 0014 0004            move.w     20(a0),4(a1)
[00048072] 2057                      movea.l    (a7),a0
[00048074] 2257                      movea.l    (a7),a1
[00048076] 3368 0016 0006            move.w     22(a0),6(a1)
[0004807c] 2057                      movea.l    (a7),a0
[0004807e] 2257                      movea.l    (a7),a1
[00048080] 3368 0018 0008            move.w     24(a0),8(a1)
[00048086] 2057                      movea.l    (a7),a0
[00048088] 2257                      movea.l    (a7),a1
[0004808a] 3368 001a 000a            move.w     26(a0),10(a1)
[00048090] 2057                      movea.l    (a7),a0
[00048092] 2257                      movea.l    (a7),a1
[00048094] 3368 001c 000c            move.w     28(a0),12(a1)
[0004809a] 2057                      movea.l    (a7),a0
[0004809c] 2257                      movea.l    (a7),a1
[0004809e] 3368 001e 000e            move.w     30(a0),14(a1)
[000480a4] 206f 0008                 movea.l    8(a7),a0
[000480a8] 226f 0008                 movea.l    8(a7),a1
[000480ac] 32a8 0002                 move.w     2(a0),(a1)
[000480b0] 536f 000c                 subq.w     #1,12(a7)
[000480b4] 0497 0000 0010            subi.l     #$00000010,(a7)
[000480ba] 54af 0008                 addq.l     #2,8(a7)
Adr_del_8:
[000480be] 302f 000c                 move.w     12(a7),d0
[000480c2] 6e92                      bgt.s      Adr_del_9
[000480c4] 3f6f 0010 000e            move.w     16(a7),14(a7)
[000480ca] 43ef 000e                 lea.l      14(a7),a1
[000480ce] 7006                      moveq.l    #6,d0
[000480d0] 206f 0012                 movea.l    18(a7),a0
[000480d4] 246f 0012                 movea.l    18(a7),a2
[000480d8] 246a 0004                 movea.l    4(a2),a2
[000480dc] 4e92                      jsr        (a2)
[000480de] 6026                      bra.s      Adr_del_2
Adr_del_6:
[000480e0] 536f 000c                 subq.w     #1,12(a7)
[000480e4] 54af 0008                 addq.l     #2,8(a7)
Adr_del_5:
[000480e8] 302f 000c                 move.w     12(a7),d0
[000480ec] 6e00 fee6                 bgt        Adr_del_10
[000480f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000480f6] 3028 0246                 move.w     582(a0),d0
[000480fa] 660a                      bne.s      Adr_del_2
[000480fc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048102] 42a8 0240                 clr.l      576(a0)
Adr_del_2:
[00048106] 4fef 0016                 lea.l      22(a7),a7
[0004810a] 245f                      movea.l    (a7)+,a2
[0004810c] 4e75                      rts

Adr_unselect:
[0004810e] 2f0a                      move.l     a2,-(a7)
[00048110] 514f                      subq.w     #8,a7
[00048112] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048118] 3028 0246                 move.w     582(a0),d0
[0004811c] 6e04                      bgt.s      Adr_unselect_1
[0004811e] 6000 00ce                 bra        Adr_unselect_2
Adr_unselect_1:
[00048122] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048128] 2f68 0240 0004            move.l     576(a0),4(a7)
[0004812e] 426f 0002                 clr.w      2(a7)
[00048132] 6000 0082                 bra        Adr_unselect_3
[00048136] 302f 0002                 move.w     2(a7),d0
Adr_unselect_6:
[0004813a] 48c0                      ext.l      d0
[0004813c] d080                      add.l      d0,d0
[0004813e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048144] 2068 0254                 movea.l    596(a0),a0
[00048148] 3eb0 0800                 move.w     0(a0,d0.l),(a7)
[0004814c] 3017                      move.w     (a7),d0
[0004814e] c07c 1000                 and.w      #$1000,d0
[00048152] 6732                      beq.s      Adr_unselect_4
[00048154] 3417                      move.w     (a7),d2
[00048156] c47c 0fff                 and.w      #$0FFF,d2
[0004815a] 48c2                      ext.l      d2
[0004815c] 2002                      move.l     d2,d0
[0004815e] d080                      add.l      d0,d0
[00048160] d082                      add.l      d2,d0
[00048162] e788                      lsl.l      #3,d0
[00048164] 206f 0004                 movea.l    4(a7),a0
[00048168] 2068 0018                 movea.l    24(a0),a0
[0004816c] 3230 080a                 move.w     10(a0,d0.l),d1
[00048170] c27c fffe                 and.w      #$FFFE,d1
[00048174] 3017                      move.w     (a7),d0
[00048176] 206f 0004                 movea.l    4(a7),a0
[0004817a] 226f 0004                 movea.l    4(a7),a1
[0004817e] 2269 0066                 movea.l    102(a1),a1
[00048182] 4e91                      jsr        (a1)
[00048184] 602c                      bra.s      Adr_unselect_5
Adr_unselect_4:
[00048186] 3417                      move.w     (a7),d2
[00048188] 48c2                      ext.l      d2
[0004818a] 2002                      move.l     d2,d0
[0004818c] d080                      add.l      d0,d0
[0004818e] d082                      add.l      d2,d0
[00048190] e788                      lsl.l      #3,d0
[00048192] 206f 0004                 movea.l    4(a7),a0
[00048196] 2068 0014                 movea.l    20(a0),a0
[0004819a] 3230 080a                 move.w     10(a0,d0.l),d1
[0004819e] c27c fffe                 and.w      #$FFFE,d1
[000481a2] 3017                      move.w     (a7),d0
[000481a4] 206f 0004                 movea.l    4(a7),a0
[000481a8] 226f 0004                 movea.l    4(a7),a1
[000481ac] 2269 0066                 movea.l    102(a1),a1
[000481b0] 4e91                      jsr        (a1)
Adr_unselect_5:
[000481b2] 526f 0002                 addq.w     #1,2(a7)
Adr_unselect_3:
[000481b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000481bc] 302f 0002                 move.w     2(a7),d0
[000481c0] b068 0246                 cmp.w      582(a0),d0
[000481c4] 6d00 ff70                 blt        Adr_unselect_6
[000481c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000481ce] 4268 0246                 clr.w      582(a0)
[000481d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000481d8] 42a8 0240                 clr.l      576(a0)
[000481dc] 93c9                      suba.l     a1,a1
[000481de] 7006                      moveq.l    #6,d0
[000481e0] 206f 0004                 movea.l    4(a7),a0
[000481e4] 246f 0004                 movea.l    4(a7),a2
[000481e8] 246a 0004                 movea.l    4(a2),a2
[000481ec] 4e92                      jsr        (a2)
Adr_unselect_2:
[000481ee] 504f                      addq.w     #8,a7
[000481f0] 245f                      movea.l    (a7)+,a2
[000481f2] 4e75                      rts

rect_find:
[000481f4] 4fef ffd6                 lea.l      -42(a7),a7
[000481f8] 2f48 0026                 move.l     a0,38(a7)
[000481fc] 2f49 0022                 move.l     a1,34(a7)
[00048200] 3f40 0020                 move.w     d0,32(a7)
[00048204] 3f41 001e                 move.w     d1,30(a7)
[00048208] 3f42 001c                 move.w     d2,28(a7)
[0004820c] 322f 0020                 move.w     32(a7),d1
[00048210] 48c1                      ext.l      d1
[00048212] 2001                      move.l     d1,d0
[00048214] d080                      add.l      d0,d0
[00048216] d081                      add.l      d1,d0
[00048218] e788                      lsl.l      #3,d0
[0004821a] 206f 0022                 movea.l    34(a7),a0
[0004821e] 3f70 0802 0016            move.w     2(a0,d0.l),22(a7)
[00048224] 6a04                      bpl.s      rect_find_1
[00048226] 6000 02d0                 bra        rect_find_2
rect_find_1:
[0004822a] 6000 02c0                 bra        rect_find_3
[0004822e] 322f 0016                 move.w     22(a7),d1
rect_find_20:
[00048232] 48c1                      ext.l      d1
[00048234] 2001                      move.l     d1,d0
[00048236] d080                      add.l      d0,d0
[00048238] d081                      add.l      d1,d0
[0004823a] e788                      lsl.l      #3,d0
[0004823c] 206f 0022                 movea.l    34(a7),a0
[00048240] d1c0                      adda.l     d0,a0
[00048242] 2f48 0018                 move.l     a0,24(a7)
[00048246] 302f 001e                 move.w     30(a7),d0
[0004824a] 206f 0018                 movea.l    24(a7),a0
[0004824e] d068 0010                 add.w      16(a0),d0
[00048252] 3f40 0014                 move.w     d0,20(a7)
[00048256] 206f 0018                 movea.l    24(a7),a0
[0004825a] d068 0014                 add.w      20(a0),d0
[0004825e] 5340                      subq.w     #1,d0
[00048260] 3f40 0012                 move.w     d0,18(a7)
[00048264] 302f 001c                 move.w     28(a7),d0
[00048268] 206f 0018                 movea.l    24(a7),a0
[0004826c] d068 0012                 add.w      18(a0),d0
[00048270] 3f40 0010                 move.w     d0,16(a7)
[00048274] 206f 0018                 movea.l    24(a7),a0
[00048278] d068 0016                 add.w      22(a0),d0
[0004827c] 5340                      subq.w     #1,d0
[0004827e] 3f40 000e                 move.w     d0,14(a7)
[00048282] 206f 0018                 movea.l    24(a7),a0
[00048286] 3028 0006                 move.w     6(a0),d0
[0004828a] c07c 00ff                 and.w      #$00FF,d0
[0004828e] 3f40 000c                 move.w     d0,12(a7)
[00048292] b07c 001f                 cmp.w      #$001F,d0
[00048296] 670a                      beq.s      rect_find_4
[00048298] 0c6f 0021 000c            cmpi.w     #$0021,12(a7)
[0004829e] 6600 0084                 bne        rect_find_5
rect_find_4:
[000482a2] 206f 0018                 movea.l    24(a7),a0
[000482a6] 2ea8 000c                 move.l     12(a0),(a7)
[000482aa] 2057                      movea.l    (a7),a0
[000482ac] 3028 0012                 move.w     18(a0),d0
[000482b0] d16f 0014                 add.w      d0,20(a7)
[000482b4] 302f 0014                 move.w     20(a7),d0
[000482b8] 2057                      movea.l    (a7),a0
[000482ba] d068 0016                 add.w      22(a0),d0
[000482be] 5340                      subq.w     #1,d0
[000482c0] 3f40 0012                 move.w     d0,18(a7)
[000482c4] 2057                      movea.l    (a7),a0
[000482c6] 3028 0014                 move.w     20(a0),d0
[000482ca] d16f 0010                 add.w      d0,16(a7)
[000482ce] 302f 0010                 move.w     16(a7),d0
[000482d2] 2057                      movea.l    (a7),a0
[000482d4] d068 0018                 add.w      24(a0),d0
[000482d8] 5340                      subq.w     #1,d0
[000482da] 3f40 000e                 move.w     d0,14(a7)
[000482de] 302f 001e                 move.w     30(a7),d0
[000482e2] 206f 0018                 movea.l    24(a7),a0
[000482e6] d068 0010                 add.w      16(a0),d0
[000482ea] 2057                      movea.l    (a7),a0
[000482ec] d068 001a                 add.w      26(a0),d0
[000482f0] 3f40 000a                 move.w     d0,10(a7)
[000482f4] 2057                      movea.l    (a7),a0
[000482f6] d068 001e                 add.w      30(a0),d0
[000482fa] 5340                      subq.w     #1,d0
[000482fc] 3f40 0008                 move.w     d0,8(a7)
[00048300] 302f 001c                 move.w     28(a7),d0
[00048304] 206f 0018                 movea.l    24(a7),a0
[00048308] d068 0012                 add.w      18(a0),d0
[0004830c] 2057                      movea.l    (a7),a0
[0004830e] d068 001c                 add.w      28(a0),d0
[00048312] 3f40 0006                 move.w     d0,6(a7)
[00048316] 2057                      movea.l    (a7),a0
[00048318] d068 0020                 add.w      32(a0),d0
[0004831c] 5340                      subq.w     #1,d0
[0004831e] 3f40 0004                 move.w     d0,4(a7)
[00048322] 6012                      bra.s      rect_find_6
rect_find_5:
[00048324] 70ff                      moveq.l    #-1,d0
[00048326] 3f40 0004                 move.w     d0,4(a7)
[0004832a] 3f40 0006                 move.w     d0,6(a7)
[0004832e] 3f40 0008                 move.w     d0,8(a7)
[00048332] 3f40 000a                 move.w     d0,10(a7)
rect_find_6:
[00048336] 206f 002e                 movea.l    46(a7),a0
[0004833a] 302f 000e                 move.w     14(a7),d0
[0004833e] b068 0002                 cmp.w      2(a0),d0
[00048342] 6d3e                      blt.s      rect_find_7
[00048344] 206f 002e                 movea.l    46(a7),a0
[00048348] 3028 0002                 move.w     2(a0),d0
[0004834c] 206f 002e                 movea.l    46(a7),a0
[00048350] d068 0006                 add.w      6(a0),d0
[00048354] 5340                      subq.w     #1,d0
[00048356] 322f 0010                 move.w     16(a7),d1
[0004835a] b240                      cmp.w      d0,d1
[0004835c] 6e24                      bgt.s      rect_find_7
[0004835e] 206f 002e                 movea.l    46(a7),a0
[00048362] 302f 0012                 move.w     18(a7),d0
[00048366] b050                      cmp.w      (a0),d0
[00048368] 6d18                      blt.s      rect_find_7
[0004836a] 206f 002e                 movea.l    46(a7),a0
[0004836e] 3010                      move.w     (a0),d0
[00048370] 206f 002e                 movea.l    46(a7),a0
[00048374] d068 0004                 add.w      4(a0),d0
[00048378] 5340                      subq.w     #1,d0
[0004837a] 322f 0014                 move.w     20(a7),d1
[0004837e] b240                      cmp.w      d0,d1
[00048380] 6f50                      ble.s      rect_find_8
rect_find_7:
[00048382] 206f 002e                 movea.l    46(a7),a0
[00048386] 302f 0004                 move.w     4(a7),d0
[0004838a] b068 0002                 cmp.w      2(a0),d0
[0004838e] 6d00 009a                 blt        rect_find_9
[00048392] 206f 002e                 movea.l    46(a7),a0
[00048396] 3028 0002                 move.w     2(a0),d0
[0004839a] 206f 002e                 movea.l    46(a7),a0
[0004839e] d068 0006                 add.w      6(a0),d0
[000483a2] 5340                      subq.w     #1,d0
[000483a4] 322f 0006                 move.w     6(a7),d1
[000483a8] b240                      cmp.w      d0,d1
[000483aa] 6e00 007e                 bgt.w      rect_find_9
[000483ae] 206f 002e                 movea.l    46(a7),a0
[000483b2] 302f 0008                 move.w     8(a7),d0
[000483b6] b050                      cmp.w      (a0),d0
[000483b8] 6d70                      blt.s      rect_find_9
[000483ba] 206f 002e                 movea.l    46(a7),a0
[000483be] 3010                      move.w     (a0),d0
[000483c0] 206f 002e                 movea.l    46(a7),a0
[000483c4] d068 0004                 add.w      4(a0),d0
[000483c8] 5340                      subq.w     #1,d0
[000483ca] 322f 000a                 move.w     10(a7),d1
[000483ce] b240                      cmp.w      d0,d1
[000483d0] 6e58                      bgt.s      rect_find_9
rect_find_8:
[000483d2] 206f 0018                 movea.l    24(a7),a0
[000483d6] 3028 0008                 move.w     8(a0),d0
[000483da] c07c 2000                 and.w      #$2000,d0
[000483de] 6746                      beq.s      rect_find_10
[000483e0] 303c 0080                 move.w     #$0080,d0
[000483e4] 206f 0018                 movea.l    24(a7),a0
[000483e8] c068 0008                 and.w      8(a0),d0
[000483ec] 6638                      bne.s      rect_find_10
[000483ee] 7008                      moveq.l    #8,d0
[000483f0] 206f 0018                 movea.l    24(a7),a0
[000483f4] c068 000a                 and.w      10(a0),d0
[000483f8] 662c                      bne.s      rect_find_10
[000483fa] 206f 0026                 movea.l    38(a7),a0
[000483fe] 226f 0022                 movea.l    34(a7),a1
[00048402] b3e8 0014                 cmpa.l     20(a0),a1
[00048406] 660e                      bne.s      rect_find_11
[00048408] 302f 0016                 move.w     22(a7),d0
[0004840c] 206f 0026                 movea.l    38(a7),a0
[00048410] 6100 fa58                 bsr        Adr_add
[00048414] 6010                      bra.s      rect_find_10
rect_find_11:
[00048416] 302f 0016                 move.w     22(a7),d0
[0004841a] 807c 1000                 or.w       #$1000,d0
[0004841e] 206f 0026                 movea.l    38(a7),a0
[00048422] 6100 fa46                 bsr        Adr_add
rect_find_10:
[00048426] 6000 008c                 bra        rect_find_12
rect_find_9:
[0004842a] 7001                      moveq.l    #1,d0
[0004842c] 342f 0016                 move.w     22(a7),d2
[00048430] 48c2                      ext.l      d2
[00048432] 2202                      move.l     d2,d1
[00048434] d281                      add.l      d1,d1
[00048436] d282                      add.l      d2,d1
[00048438] e789                      lsl.l      #3,d1
[0004843a] 206f 0022                 movea.l    34(a7),a0
[0004843e] c070 180a                 and.w      10(a0,d1.l),d0
[00048442] 6602                      bne.s      rect_find_13
[00048444] 606e                      bra.s      rect_find_12
rect_find_13:
[00048446] 206f 0032                 movea.l    50(a7),a0
[0004844a] 2028 0014                 move.l     20(a0),d0
[0004844e] 6738                      beq.s      rect_find_14
[00048450] 426f 000c                 clr.w      12(a7)
[00048454] 6024                      bra.s      rect_find_15
[00048456] 302f 000c                 move.w     12(a7),d0
rect_find_17:
[0004845a] 48c0                      ext.l      d0
[0004845c] d080                      add.l      d0,d0
[0004845e] 206f 0032                 movea.l    50(a7),a0
[00048462] 2068 0014                 movea.l    20(a0),a0
[00048466] 3030 0800                 move.w     0(a0,d0.l),d0
[0004846a] c07c 0fff                 and.w      #$0FFF,d0
[0004846e] b06f 0016                 cmp.w      22(a7),d0
[00048472] 6602                      bne.s      rect_find_16
[00048474] 603e                      bra.s      rect_find_12
rect_find_16:
[00048476] 526f 000c                 addq.w     #1,12(a7)
rect_find_15:
[0004847a] 206f 0032                 movea.l    50(a7),a0
[0004847e] 302f 000c                 move.w     12(a7),d0
[00048482] b068 0006                 cmp.w      6(a0),d0
[00048486] 6dce                      blt.s      rect_find_17
rect_find_14:
[00048488] 206f 0026                 movea.l    38(a7),a0
[0004848c] 226f 0022                 movea.l    34(a7),a1
[00048490] b3e8 0014                 cmpa.l     20(a0),a1
[00048494] 660e                      bne.s      rect_find_18
[00048496] 302f 0016                 move.w     22(a7),d0
[0004849a] 206f 0026                 movea.l    38(a7),a0
[0004849e] 6100 fad6                 bsr        Adr_del
[000484a2] 6010                      bra.s      rect_find_12
rect_find_18:
[000484a4] 302f 0016                 move.w     22(a7),d0
[000484a8] 807c 1000                 or.w       #$1000,d0
[000484ac] 206f 0026                 movea.l    38(a7),a0
[000484b0] 6100 fac4                 bsr        Adr_del
rect_find_12:
[000484b4] 303c 0080                 move.w     #$0080,d0
[000484b8] 206f 0018                 movea.l    24(a7),a0
[000484bc] c068 0008                 and.w      8(a0),d0
[000484c0] 6622                      bne.s      rect_find_19
[000484c2] 2f2f 0032                 move.l     50(a7),-(a7)
[000484c6] 2f2f 0032                 move.l     50(a7),-(a7)
[000484ca] 342f 0018                 move.w     24(a7),d2
[000484ce] 322f 001c                 move.w     28(a7),d1
[000484d2] 302f 001e                 move.w     30(a7),d0
[000484d6] 226f 002a                 movea.l    42(a7),a1
[000484da] 206f 002e                 movea.l    46(a7),a0
[000484de] 6100 fd14                 bsr        rect_find
[000484e2] 504f                      addq.w     #8,a7
rect_find_19:
[000484e4] 206f 0018                 movea.l    24(a7),a0
[000484e8] 3f50 0016                 move.w     (a0),22(a7)
rect_find_3:
[000484ec] 302f 0016                 move.w     22(a7),d0
[000484f0] b06f 0020                 cmp.w      32(a7),d0
[000484f4] 6600 fd38                 bne        rect_find_20
rect_find_2:
[000484f8] 4fef 002a                 lea.l      42(a7),a7
[000484fc] 4e75                      rts

Adr_box:
[000484fe] 2f0a                      move.l     a2,-(a7)
[00048500] 4fef ffac                 lea.l      -84(a7),a7
[00048504] 3f40 0052                 move.w     d0,82(a7)
[00048508] 3f41 0050                 move.w     d1,80(a7)
[0004850c] 426f 0032                 clr.w      50(a7)
[00048510] 2079 000e 692a            movea.l    _globl,a0
[00048516] 322f 0050                 move.w     80(a7),d1
[0004851a] 302f 0052                 move.w     82(a7),d0
[0004851e] 4eb9 0007 b81c            jsr        mt_wind_find
[00048524] 4eb9 0005 5e68            jsr        Awi_wid
[0004852a] 2f48 002a                 move.l     a0,42(a7)
[0004852e] 6604                      bne.s      Adr_box_1
[00048530] 6000 089c                 bra        Adr_box_2
Adr_box_1:
[00048534] 7003                      moveq.l    #3,d0
[00048536] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004853c] c068 0266                 and.w      614(a0),d0
[00048540] 660e                      bne.s      Adr_box_3
[00048542] 6100 fbca                 bsr        Adr_unselect
[00048546] 42af 0014                 clr.l      20(a7)
[0004854a] 426f 0036                 clr.w      54(a7)
[0004854e] 606c                      bra.s      Adr_box_4
Adr_box_3:
[00048550] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048556] 3028 0244                 move.w     580(a0),d0
[0004855a] 48c0                      ext.l      d0
[0004855c] d080                      add.l      d0,d0
[0004855e] 4eb9 0004 c608            jsr        Ax_malloc
[00048564] 2f48 0014                 move.l     a0,20(a7)
[00048568] 6604                      bne.s      Adr_box_5
[0004856a] 6000 0862                 bra        Adr_box_2
Adr_box_5:
[0004856e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048574] 3228 0244                 move.w     580(a0),d1
[00048578] 48c1                      ext.l      d1
[0004857a] d281                      add.l      d1,d1
[0004857c] 4240                      clr.w      d0
[0004857e] 206f 0014                 movea.l    20(a7),a0
[00048582] 4eb9 0008 36ea            jsr        memset
[00048588] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004858e] 3028 0246                 move.w     582(a0),d0
[00048592] 48c0                      ext.l      d0
[00048594] d080                      add.l      d0,d0
[00048596] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004859c] 2268 0254                 movea.l    596(a0),a1
[000485a0] 206f 0014                 movea.l    20(a7),a0
[000485a4] 4eb9 0008 3500            jsr        memcpy
[000485aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[000485b0] 3028 0246                 move.w     582(a0),d0
[000485b4] 3f40 0006                 move.w     d0,6(a7)
[000485b8] 3f40 0036                 move.w     d0,54(a7)
Adr_box_4:
[000485bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000485c2] 216f 002a 0240            move.l     42(a7),576(a0)
[000485c8] 206f 002a                 movea.l    42(a7),a0
[000485cc] 3f68 0034 0038            move.w     52(a0),56(a7)
[000485d2] 206f 002a                 movea.l    42(a7),a0
[000485d6] 3f68 0036 003a            move.w     54(a0),58(a7)
[000485dc] 206f 002a                 movea.l    42(a7),a0
[000485e0] 3f68 0038 003c            move.w     56(a0),60(a7)
[000485e6] 206f 002a                 movea.l    42(a7),a0
[000485ea] 3f68 003a 003e            move.w     58(a0),62(a7)
[000485f0] 206f 002a                 movea.l    42(a7),a0
[000485f4] 2028 0018                 move.l     24(a0),d0
[000485f8] 670e                      beq.s      Adr_box_6
[000485fa] 206f 002a                 movea.l    42(a7),a0
[000485fe] 302f 0050                 move.w     80(a7),d0
[00048602] b068 0036                 cmp.w      54(a0),d0
[00048606] 6d06                      blt.s      Adr_box_7
Adr_box_6:
[00048608] 426f 0034                 clr.w      52(a7)
[0004860c] 6024                      bra.s      Adr_box_8
Adr_box_7:
[0004860e] 3f7c 0001 0034            move.w     #$0001,52(a7)
[00048614] 206f 002a                 movea.l    42(a7),a0
[00048618] 2068 0018                 movea.l    24(a0),a0
[0004861c] 3028 0012                 move.w     18(a0),d0
[00048620] d16f 003a                 add.w      d0,58(a7)
[00048624] 206f 002a                 movea.l    42(a7),a0
[00048628] 2068 0018                 movea.l    24(a0),a0
[0004862c] 3f68 0016 003e            move.w     22(a0),62(a7)
Adr_box_8:
[00048632] 302f 0052                 move.w     82(a7),d0
[00048636] 3f40 0020                 move.w     d0,32(a7)
[0004863a] 3f40 0024                 move.w     d0,36(a7)
[0004863e] 3f40 0048                 move.w     d0,72(a7)
[00048642] 3f40 0040                 move.w     d0,64(a7)
[00048646] 302f 0050                 move.w     80(a7),d0
[0004864a] 3f40 001e                 move.w     d0,30(a7)
[0004864e] 3f40 0022                 move.w     d0,34(a7)
[00048652] 3f40 004a                 move.w     d0,74(a7)
[00048656] 3f40 0042                 move.w     d0,66(a7)
[0004865a] 4240                      clr.w      d0
[0004865c] 3f40 004e                 move.w     d0,78(a7)
[00048660] 3f40 0046                 move.w     d0,70(a7)
[00048664] 3f40 004c                 move.w     d0,76(a7)
[00048668] 3f40 0044                 move.w     d0,68(a7)
[0004866c] 93c9                      suba.l     a1,a1
[0004866e] 7014                      moveq.l    #20,d0
[00048670] 206f 002a                 movea.l    42(a7),a0
[00048674] 246f 002a                 movea.l    42(a7),a2
[00048678] 246a 0004                 movea.l    4(a2),a2
[0004867c] 4e92                      jsr        (a2)
[0004867e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048684] 2068 023c                 movea.l    572(a0),a0
[00048688] 41e8 0044                 lea.l      68(a0),a0
[0004868c] 4eb9 0004 ee3c            jsr        Amo_new
[00048692] 7003                      moveq.l    #3,d0
[00048694] 4eb9 0005 ae7e            jsr        Awi_update
[0004869a] 4eb9 0004 ef40            jsr        Amo_hide
Adr_box_40:
[000486a0] 7203                      moveq.l    #3,d1
[000486a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000486a8] 3028 0010                 move.w     16(a0),d0
[000486ac] 4eb9 0007 3070            jsr        vswr_mode
[000486b2] 342f 004a                 move.w     74(a7),d2
[000486b6] 322f 0048                 move.w     72(a7),d1
[000486ba] d26f 004c                 add.w      76(a7),d1
[000486be] 5341                      subq.w     #1,d1
[000486c0] 3f41 0028                 move.w     d1,40(a7)
[000486c4] 302f 0048                 move.w     72(a7),d0
[000486c8] 6100 ee4e                 bsr        dotted_xline
[000486cc] 302f 0048                 move.w     72(a7),d0
[000486d0] b06f 0028                 cmp.w      40(a7),d0
[000486d4] 671a                      beq.s      Adr_box_9
[000486d6] 342f 004a                 move.w     74(a7),d2
[000486da] d46f 004e                 add.w      78(a7),d2
[000486de] 5342                      subq.w     #1,d2
[000486e0] 3f42 0026                 move.w     d2,38(a7)
[000486e4] 322f 0028                 move.w     40(a7),d1
[000486e8] 302f 0048                 move.w     72(a7),d0
[000486ec] 6100 ee2a                 bsr        dotted_xline
Adr_box_9:
[000486f0] 342f 0048                 move.w     72(a7),d2
[000486f4] 322f 0026                 move.w     38(a7),d1
[000486f8] 302f 004a                 move.w     74(a7),d0
[000486fc] 6100 eee8                 bsr        dotted_yline
[00048700] 302f 004a                 move.w     74(a7),d0
[00048704] b06f 0026                 cmp.w      38(a7),d0
[00048708] 6710                      beq.s      Adr_box_10
[0004870a] 342f 0028                 move.w     40(a7),d2
[0004870e] 322f 0026                 move.w     38(a7),d1
[00048712] 302f 004a                 move.w     74(a7),d0
[00048716] 6100 eece                 bsr        dotted_yline
Adr_box_10:
[0004871a] 4eb9 0004 ef66            jsr        Amo_show
[00048720] 486f 0018                 pea.l      24(a7)
Adr_box_12:
[00048724] 43ef 001e                 lea.l      30(a7),a1
[00048728] 41ef 0020                 lea.l      32(a7),a0
[0004872c] 2479 0010 ee4e            movea.l    ACSblk,a2
[00048732] 302a 0010                 move.w     16(a2),d0
[00048736] 4eb9 0007 517a            jsr        vq_mouse
[0004873c] 584f                      addq.w     #4,a7
[0004873e] 302f 0032                 move.w     50(a7),d0
[00048742] 661a                      bne.s      Adr_box_11
[00048744] 302f 001c                 move.w     28(a7),d0
[00048748] 6714                      beq.s      Adr_box_11
[0004874a] 302f 001a                 move.w     26(a7),d0
[0004874e] b06f 0020                 cmp.w      32(a7),d0
[00048752] 660a                      bne.s      Adr_box_11
[00048754] 302f 0018                 move.w     24(a7),d0
[00048758] b06f 001e                 cmp.w      30(a7),d0
[0004875c] 67c2                      beq.s      Adr_box_12
Adr_box_11:
[0004875e] 4eb9 0004 ef40            jsr        Amo_hide
[00048764] 7203                      moveq.l    #3,d1
[00048766] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004876c] 3028 0010                 move.w     16(a0),d0
[00048770] 4eb9 0007 3070            jsr        vswr_mode
[00048776] 342f 004a                 move.w     74(a7),d2
[0004877a] 322f 0028                 move.w     40(a7),d1
[0004877e] 302f 0048                 move.w     72(a7),d0
[00048782] 6100 ed94                 bsr        dotted_xline
[00048786] 302f 0048                 move.w     72(a7),d0
[0004878a] b06f 0028                 cmp.w      40(a7),d0
[0004878e] 6716                      beq.s      Adr_box_13
[00048790] 342f 004a                 move.w     74(a7),d2
[00048794] d46f 004e                 add.w      78(a7),d2
[00048798] 5342                      subq.w     #1,d2
[0004879a] 322f 0028                 move.w     40(a7),d1
[0004879e] 302f 0048                 move.w     72(a7),d0
[000487a2] 6100 ed74                 bsr        dotted_xline
Adr_box_13:
[000487a6] 342f 0048                 move.w     72(a7),d2
[000487aa] 322f 0026                 move.w     38(a7),d1
[000487ae] 302f 004a                 move.w     74(a7),d0
[000487b2] 6100 ee32                 bsr        dotted_yline
[000487b6] 302f 004a                 move.w     74(a7),d0
[000487ba] b06f 0026                 cmp.w      38(a7),d0
[000487be] 6710                      beq.s      Adr_box_14
[000487c0] 342f 0028                 move.w     40(a7),d2
[000487c4] 322f 0026                 move.w     38(a7),d1
[000487c8] 302f 004a                 move.w     74(a7),d0
[000487cc] 6100 ee18                 bsr        dotted_yline
Adr_box_14:
[000487d0] 4eb9 0004 ef66            jsr        Amo_show
[000487d6] 302f 001c                 move.w     28(a7),d0
[000487da] 6700 05ac                 beq        Adr_box_15
[000487de] 302f 001a                 move.w     26(a7),d0
[000487e2] 3f40 0020                 move.w     d0,32(a7)
[000487e6] 322f 0024                 move.w     36(a7),d1
[000487ea] b240                      cmp.w      d0,d1
[000487ec] 6c06                      bge.s      Adr_box_16
[000487ee] 302f 0024                 move.w     36(a7),d0
[000487f2] 6008                      bra.s      Adr_box_17
Adr_box_16:
[000487f4] 302f 001a                 move.w     26(a7),d0
[000487f8] 3f40 0020                 move.w     d0,32(a7)
Adr_box_17:
[000487fc] 3f40 0040                 move.w     d0,64(a7)
[00048800] 302f 0018                 move.w     24(a7),d0
[00048804] 3f40 001e                 move.w     d0,30(a7)
[00048808] 322f 0022                 move.w     34(a7),d1
[0004880c] b240                      cmp.w      d0,d1
[0004880e] 6c06                      bge.s      Adr_box_18
[00048810] 302f 0022                 move.w     34(a7),d0
[00048814] 6008                      bra.s      Adr_box_19
Adr_box_18:
[00048816] 302f 0018                 move.w     24(a7),d0
[0004881a] 3f40 001e                 move.w     d0,30(a7)
Adr_box_19:
[0004881e] 3f40 0042                 move.w     d0,66(a7)
[00048822] 302f 0020                 move.w     32(a7),d0
[00048826] 906f 0024                 sub.w      36(a7),d0
[0004882a] 3f40 0044                 move.w     d0,68(a7)
[0004882e] 6a0a                      bpl.s      Adr_box_20
[00048830] 302f 0044                 move.w     68(a7),d0
[00048834] 4440                      neg.w      d0
[00048836] 3f40 0044                 move.w     d0,68(a7)
Adr_box_20:
[0004883a] 526f 0044                 addq.w     #1,68(a7)
[0004883e] 302f 001e                 move.w     30(a7),d0
[00048842] 906f 0022                 sub.w      34(a7),d0
[00048846] 3f40 0046                 move.w     d0,70(a7)
[0004884a] 6a0a                      bpl.s      Adr_box_21
[0004884c] 302f 0046                 move.w     70(a7),d0
[00048850] 4440                      neg.w      d0
[00048852] 3f40 0046                 move.w     d0,70(a7)
Adr_box_21:
[00048856] 526f 0046                 addq.w     #1,70(a7)
[0004885a] 426f 0032                 clr.w      50(a7)
[0004885e] 302f 0034                 move.w     52(a7),d0
[00048862] 6600 0450                 bne        Adr_box_22
[00048866] 206f 002a                 movea.l    42(a7),a0
[0004886a] 3f68 0034 002e            move.w     52(a0),46(a7)
[00048870] 206f 002a                 movea.l    42(a7),a0
[00048874] 3028 003c                 move.w     60(a0),d0
[00048878] 6f00 0114                 ble        Adr_box_23
[0004887c] 302f 0020                 move.w     32(a7),d0
[00048880] b06f 002e                 cmp.w      46(a7),d0
[00048884] 6c00 0108                 bge        Adr_box_23
[00048888] 206f 002a                 movea.l    42(a7),a0
[0004888c] 3028 0022                 move.w     34(a0),d0
[00048890] c07c 0a00                 and.w      #$0A00,d0
[00048894] 6700 00f8                 beq        Adr_box_23
[00048898] 206f 002a                 movea.l    42(a7),a0
[0004889c] 2068 0014                 movea.l    20(a0),a0
[000488a0] 3f68 0010 0030            move.w     16(a0),48(a7)
[000488a6] 322f 002e                 move.w     46(a7),d1
[000488aa] 926f 0020                 sub.w      32(a7),d1
[000488ae] 5241                      addq.w     #1,d1
[000488b0] 48c1                      ext.l      d1
[000488b2] 2001                      move.l     d1,d0
[000488b4] eb88                      lsl.l      #5,d0
[000488b6] 9081                      sub.l      d1,d0
[000488b8] e588                      lsl.l      #2,d0
[000488ba] d081                      add.l      d1,d0
[000488bc] e788                      lsl.l      #3,d0
[000488be] 206f 002a                 movea.l    42(a7),a0
[000488c2] 3228 0040                 move.w     64(a0),d1
[000488c6] 48c1                      ext.l      d1
[000488c8] 4eb9 0008 3cf6            jsr        _ldiv
[000488ce] 206f 002a                 movea.l    42(a7),a0
[000488d2] 3228 003c                 move.w     60(a0),d1
[000488d6] 9240                      sub.w      d0,d1
[000488d8] 5341                      subq.w     #1,d1
[000488da] 6c04                      bge.s      Adr_box_24
[000488dc] 7001                      moveq.l    #1,d0
[000488de] 6034                      bra.s      Adr_box_25
Adr_box_24:
[000488e0] 322f 002e                 move.w     46(a7),d1
[000488e4] 926f 0020                 sub.w      32(a7),d1
[000488e8] 5241                      addq.w     #1,d1
[000488ea] 48c1                      ext.l      d1
[000488ec] 2001                      move.l     d1,d0
[000488ee] eb88                      lsl.l      #5,d0
[000488f0] 9081                      sub.l      d1,d0
[000488f2] e588                      lsl.l      #2,d0
[000488f4] d081                      add.l      d1,d0
[000488f6] e788                      lsl.l      #3,d0
[000488f8] 206f 002a                 movea.l    42(a7),a0
[000488fc] 3228 0040                 move.w     64(a0),d1
[00048900] 48c1                      ext.l      d1
[00048902] 4eb9 0008 3cf6            jsr        _ldiv
[00048908] 206f 002a                 movea.l    42(a7),a0
[0004890c] 3f00                      move.w     d0,-(a7)
[0004890e] 3028 003c                 move.w     60(a0),d0
[00048912] 905f                      sub.w      (a7)+,d0
Adr_box_25:
[00048914] 3f40 0028                 move.w     d0,40(a7)
[00048918] 206f 002a                 movea.l    42(a7),a0
[0004891c] 3028 003c                 move.w     60(a0),d0
[00048920] 906f 0028                 sub.w      40(a7),d0
[00048924] 206f 002a                 movea.l    42(a7),a0
[00048928] 3228 0048                 move.w     72(a0),d1
[0004892c] 4641                      not.w      d1
[0004892e] c27c 00ff                 and.w      #$00FF,d1
[00048932] 5241                      addq.w     #1,d1
[00048934] b041                      cmp.w      d1,d0
[00048936] 6c14                      bge.s      Adr_box_26
[00048938] 7201                      moveq.l    #1,d1
[0004893a] 7006                      moveq.l    #6,d0
[0004893c] 206f 002a                 movea.l    42(a7),a0
[00048940] 226f 002a                 movea.l    42(a7),a1
[00048944] 2269 007a                 movea.l    122(a1),a1
[00048948] 4e91                      jsr        (a1)
[0004894a] 6012                      bra.s      Adr_box_27
Adr_box_26:
[0004894c] 302f 0028                 move.w     40(a7),d0
[00048950] 206f 002a                 movea.l    42(a7),a0
[00048954] 226f 002a                 movea.l    42(a7),a1
[00048958] 2269 007e                 movea.l    126(a1),a1
[0004895c] 4e91                      jsr        (a1)
Adr_box_27:
[0004895e] 302f 0030                 move.w     48(a7),d0
[00048962] 4440                      neg.w      d0
[00048964] 206f 002a                 movea.l    42(a7),a0
[00048968] 2068 0014                 movea.l    20(a0),a0
[0004896c] d068 0010                 add.w      16(a0),d0
[00048970] 3f40 0026                 move.w     d0,38(a7)
[00048974] d16f 0044                 add.w      d0,68(a7)
[00048978] 302f 0026                 move.w     38(a7),d0
[0004897c] 916f 0040                 sub.w      d0,64(a7)
[00048980] 302f 0026                 move.w     38(a7),d0
[00048984] d16f 0024                 add.w      d0,36(a7)
[00048988] 3f7c 0001 0032            move.w     #$0001,50(a7)
Adr_box_23:
[0004898e] 206f 002a                 movea.l    42(a7),a0
[00048992] 3f68 0036 002e            move.w     54(a0),46(a7)
[00048998] 206f 002a                 movea.l    42(a7),a0
[0004899c] 3028 003e                 move.w     62(a0),d0
[000489a0] 6f00 0116                 ble        Adr_box_28
[000489a4] 302f 001e                 move.w     30(a7),d0
[000489a8] b06f 002e                 cmp.w      46(a7),d0
[000489ac] 6c00 010a                 bge        Adr_box_28
[000489b0] 206f 002a                 movea.l    42(a7),a0
[000489b4] 3028 0022                 move.w     34(a0),d0
[000489b8] c07c 0140                 and.w      #$0140,d0
[000489bc] 6700 00fa                 beq        Adr_box_28
[000489c0] 206f 002a                 movea.l    42(a7),a0
[000489c4] 2068 0014                 movea.l    20(a0),a0
[000489c8] 3f68 0012 0030            move.w     18(a0),48(a7)
[000489ce] 322f 002e                 move.w     46(a7),d1
[000489d2] 926f 001e                 sub.w      30(a7),d1
[000489d6] 5241                      addq.w     #1,d1
[000489d8] 48c1                      ext.l      d1
[000489da] 2001                      move.l     d1,d0
[000489dc] eb88                      lsl.l      #5,d0
[000489de] 9081                      sub.l      d1,d0
[000489e0] e588                      lsl.l      #2,d0
[000489e2] d081                      add.l      d1,d0
[000489e4] e788                      lsl.l      #3,d0
[000489e6] 206f 002a                 movea.l    42(a7),a0
[000489ea] 3228 0042                 move.w     66(a0),d1
[000489ee] 48c1                      ext.l      d1
[000489f0] 4eb9 0008 3cf6            jsr        _ldiv
[000489f6] 206f 002a                 movea.l    42(a7),a0
[000489fa] 3228 003e                 move.w     62(a0),d1
[000489fe] 9240                      sub.w      d0,d1
[00048a00] 5341                      subq.w     #1,d1
[00048a02] 6c04                      bge.s      Adr_box_29
[00048a04] 7001                      moveq.l    #1,d0
[00048a06] 6034                      bra.s      Adr_box_30
Adr_box_29:
[00048a08] 322f 002e                 move.w     46(a7),d1
[00048a0c] 926f 001e                 sub.w      30(a7),d1
[00048a10] 5241                      addq.w     #1,d1
[00048a12] 48c1                      ext.l      d1
[00048a14] 2001                      move.l     d1,d0
[00048a16] eb88                      lsl.l      #5,d0
[00048a18] 9081                      sub.l      d1,d0
[00048a1a] e588                      lsl.l      #2,d0
[00048a1c] d081                      add.l      d1,d0
[00048a1e] e788                      lsl.l      #3,d0
[00048a20] 206f 002a                 movea.l    42(a7),a0
[00048a24] 3228 0042                 move.w     66(a0),d1
[00048a28] 48c1                      ext.l      d1
[00048a2a] 4eb9 0008 3cf6            jsr        _ldiv
[00048a30] 206f 002a                 movea.l    42(a7),a0
[00048a34] 3f00                      move.w     d0,-(a7)
[00048a36] 3028 003e                 move.w     62(a0),d0
[00048a3a] 905f                      sub.w      (a7)+,d0
Adr_box_30:
[00048a3c] 3f40 0028                 move.w     d0,40(a7)
[00048a40] 206f 002a                 movea.l    42(a7),a0
[00048a44] 3028 003e                 move.w     62(a0),d0
[00048a48] 906f 0028                 sub.w      40(a7),d0
[00048a4c] 206f 002a                 movea.l    42(a7),a0
[00048a50] 3228 0048                 move.w     72(a0),d1
[00048a54] 4641                      not.w      d1
[00048a56] e041                      asr.w      #8,d1
[00048a58] c27c 00ff                 and.w      #$00FF,d1
[00048a5c] 5241                      addq.w     #1,d1
[00048a5e] b041                      cmp.w      d1,d0
[00048a60] 6c14                      bge.s      Adr_box_31
[00048a62] 7201                      moveq.l    #1,d1
[00048a64] 7002                      moveq.l    #2,d0
[00048a66] 206f 002a                 movea.l    42(a7),a0
[00048a6a] 226f 002a                 movea.l    42(a7),a1
[00048a6e] 2269 007a                 movea.l    122(a1),a1
[00048a72] 4e91                      jsr        (a1)
[00048a74] 6012                      bra.s      Adr_box_32
Adr_box_31:
[00048a76] 302f 0028                 move.w     40(a7),d0
[00048a7a] 206f 002a                 movea.l    42(a7),a0
[00048a7e] 226f 002a                 movea.l    42(a7),a1
[00048a82] 2269 0082                 movea.l    130(a1),a1
[00048a86] 4e91                      jsr        (a1)
Adr_box_32:
[00048a88] 302f 0030                 move.w     48(a7),d0
[00048a8c] 4440                      neg.w      d0
[00048a8e] 206f 002a                 movea.l    42(a7),a0
[00048a92] 2068 0014                 movea.l    20(a0),a0
[00048a96] d068 0012                 add.w      18(a0),d0
[00048a9a] 3f40 0026                 move.w     d0,38(a7)
[00048a9e] d16f 0046                 add.w      d0,70(a7)
[00048aa2] 302f 0026                 move.w     38(a7),d0
[00048aa6] 916f 0042                 sub.w      d0,66(a7)
[00048aaa] 302f 0026                 move.w     38(a7),d0
[00048aae] d16f 0022                 add.w      d0,34(a7)
[00048ab2] 3f7c 0001 0032            move.w     #$0001,50(a7)
Adr_box_28:
[00048ab8] 206f 002a                 movea.l    42(a7),a0
[00048abc] 3028 0034                 move.w     52(a0),d0
[00048ac0] 206f 002a                 movea.l    42(a7),a0
[00048ac4] d068 0038                 add.w      56(a0),d0
[00048ac8] 5340                      subq.w     #1,d0
[00048aca] 3f40 002e                 move.w     d0,46(a7)
[00048ace] 206f 002a                 movea.l    42(a7),a0
[00048ad2] 0c68 03e8 003c            cmpi.w     #$03E8,60(a0)
[00048ad8] 6c00 00dc                 bge        Adr_box_33
[00048adc] 302f 002e                 move.w     46(a7),d0
[00048ae0] b06f 0020                 cmp.w      32(a7),d0
[00048ae4] 6c00 00d0                 bge        Adr_box_33
[00048ae8] 206f 002a                 movea.l    42(a7),a0
[00048aec] 3028 0022                 move.w     34(a0),d0
[00048af0] c07c 0c00                 and.w      #$0C00,d0
[00048af4] 6700 00c0                 beq        Adr_box_33
[00048af8] 206f 002a                 movea.l    42(a7),a0
[00048afc] 2068 0014                 movea.l    20(a0),a0
[00048b00] 3f68 0010 0030            move.w     16(a0),48(a7)
[00048b06] 322f 0020                 move.w     32(a7),d1
[00048b0a] 926f 002e                 sub.w      46(a7),d1
[00048b0e] 5241                      addq.w     #1,d1
[00048b10] 48c1                      ext.l      d1
[00048b12] 2001                      move.l     d1,d0
[00048b14] eb88                      lsl.l      #5,d0
[00048b16] 9081                      sub.l      d1,d0
[00048b18] e588                      lsl.l      #2,d0
[00048b1a] d081                      add.l      d1,d0
[00048b1c] e788                      lsl.l      #3,d0
[00048b1e] 206f 002a                 movea.l    42(a7),a0
[00048b22] 3228 0040                 move.w     64(a0),d1
[00048b26] 48c1                      ext.l      d1
[00048b28] 4eb9 0008 3cf6            jsr        _ldiv
[00048b2e] 206f 002a                 movea.l    42(a7),a0
[00048b32] d068 003c                 add.w      60(a0),d0
[00048b36] b07c 03e8                 cmp.w      #$03E8,d0
[00048b3a] 6f06                      ble.s      Adr_box_34
[00048b3c] 303c 03e8                 move.w     #$03E8,d0
[00048b40] 6030                      bra.s      Adr_box_35
Adr_box_34:
[00048b42] 322f 0020                 move.w     32(a7),d1
[00048b46] 926f 002e                 sub.w      46(a7),d1
[00048b4a] 5241                      addq.w     #1,d1
[00048b4c] 48c1                      ext.l      d1
[00048b4e] 2001                      move.l     d1,d0
[00048b50] eb88                      lsl.l      #5,d0
[00048b52] 9081                      sub.l      d1,d0
[00048b54] e588                      lsl.l      #2,d0
[00048b56] d081                      add.l      d1,d0
[00048b58] e788                      lsl.l      #3,d0
[00048b5a] 206f 002a                 movea.l    42(a7),a0
[00048b5e] 3228 0040                 move.w     64(a0),d1
[00048b62] 48c1                      ext.l      d1
[00048b64] 4eb9 0008 3cf6            jsr        _ldiv
[00048b6a] 206f 002a                 movea.l    42(a7),a0
[00048b6e] d068 003c                 add.w      60(a0),d0
Adr_box_35:
[00048b72] 3f40 0028                 move.w     d0,40(a7)
[00048b76] 302f 0028                 move.w     40(a7),d0
[00048b7a] 206f 002a                 movea.l    42(a7),a0
[00048b7e] 226f 002a                 movea.l    42(a7),a1
[00048b82] 2269 007e                 movea.l    126(a1),a1
[00048b86] 4e91                      jsr        (a1)
[00048b88] 302f 0030                 move.w     48(a7),d0
[00048b8c] 206f 002a                 movea.l    42(a7),a0
[00048b90] 2068 0014                 movea.l    20(a0),a0
[00048b94] 9068 0010                 sub.w      16(a0),d0
[00048b98] 3f40 0026                 move.w     d0,38(a7)
[00048b9c] 916f 0040                 sub.w      d0,64(a7)
[00048ba0] 302f 0026                 move.w     38(a7),d0
[00048ba4] d16f 0044                 add.w      d0,68(a7)
[00048ba8] 302f 0026                 move.w     38(a7),d0
[00048bac] 916f 0024                 sub.w      d0,36(a7)
[00048bb0] 3f7c 0001 0032            move.w     #$0001,50(a7)
Adr_box_33:
[00048bb6] 206f 002a                 movea.l    42(a7),a0
[00048bba] 3028 0036                 move.w     54(a0),d0
[00048bbe] 206f 002a                 movea.l    42(a7),a0
[00048bc2] d068 003a                 add.w      58(a0),d0
[00048bc6] 5340                      subq.w     #1,d0
[00048bc8] 3f40 002e                 move.w     d0,46(a7)
[00048bcc] 206f 002a                 movea.l    42(a7),a0
[00048bd0] 0c68 03e8 003e            cmpi.w     #$03E8,62(a0)
[00048bd6] 6c00 00dc                 bge        Adr_box_22
[00048bda] 302f 002e                 move.w     46(a7),d0
[00048bde] b06f 001e                 cmp.w      30(a7),d0
[00048be2] 6c00 00d0                 bge        Adr_box_22
[00048be6] 206f 002a                 movea.l    42(a7),a0
[00048bea] 3028 0022                 move.w     34(a0),d0
[00048bee] c07c 0180                 and.w      #$0180,d0
[00048bf2] 6700 00c0                 beq        Adr_box_22
[00048bf6] 206f 002a                 movea.l    42(a7),a0
[00048bfa] 2068 0014                 movea.l    20(a0),a0
[00048bfe] 3f68 0012 0030            move.w     18(a0),48(a7)
[00048c04] 322f 001e                 move.w     30(a7),d1
[00048c08] 926f 002e                 sub.w      46(a7),d1
[00048c0c] 5241                      addq.w     #1,d1
[00048c0e] 48c1                      ext.l      d1
[00048c10] 2001                      move.l     d1,d0
[00048c12] eb88                      lsl.l      #5,d0
[00048c14] 9081                      sub.l      d1,d0
[00048c16] e588                      lsl.l      #2,d0
[00048c18] d081                      add.l      d1,d0
[00048c1a] e788                      lsl.l      #3,d0
[00048c1c] 206f 002a                 movea.l    42(a7),a0
[00048c20] 3228 0042                 move.w     66(a0),d1
[00048c24] 48c1                      ext.l      d1
[00048c26] 4eb9 0008 3cf6            jsr        _ldiv
[00048c2c] 206f 002a                 movea.l    42(a7),a0
[00048c30] d068 003e                 add.w      62(a0),d0
[00048c34] b07c 03e8                 cmp.w      #$03E8,d0
[00048c38] 6f06                      ble.s      Adr_box_36
[00048c3a] 303c 03e8                 move.w     #$03E8,d0
[00048c3e] 6030                      bra.s      Adr_box_37
Adr_box_36:
[00048c40] 322f 001e                 move.w     30(a7),d1
[00048c44] 926f 002e                 sub.w      46(a7),d1
[00048c48] 5241                      addq.w     #1,d1
[00048c4a] 48c1                      ext.l      d1
[00048c4c] 2001                      move.l     d1,d0
[00048c4e] eb88                      lsl.l      #5,d0
[00048c50] 9081                      sub.l      d1,d0
[00048c52] e588                      lsl.l      #2,d0
[00048c54] d081                      add.l      d1,d0
[00048c56] e788                      lsl.l      #3,d0
[00048c58] 206f 002a                 movea.l    42(a7),a0
[00048c5c] 3228 0042                 move.w     66(a0),d1
[00048c60] 48c1                      ext.l      d1
[00048c62] 4eb9 0008 3cf6            jsr        _ldiv
[00048c68] 206f 002a                 movea.l    42(a7),a0
[00048c6c] d068 003e                 add.w      62(a0),d0
Adr_box_37:
[00048c70] 3f40 0028                 move.w     d0,40(a7)
[00048c74] 302f 0028                 move.w     40(a7),d0
[00048c78] 206f 002a                 movea.l    42(a7),a0
[00048c7c] 226f 002a                 movea.l    42(a7),a1
[00048c80] 2269 0082                 movea.l    130(a1),a1
[00048c84] 4e91                      jsr        (a1)
[00048c86] 302f 0030                 move.w     48(a7),d0
[00048c8a] 206f 002a                 movea.l    42(a7),a0
[00048c8e] 2068 0014                 movea.l    20(a0),a0
[00048c92] 9068 0012                 sub.w      18(a0),d0
[00048c96] 3f40 0026                 move.w     d0,38(a7)
[00048c9a] 916f 0042                 sub.w      d0,66(a7)
[00048c9e] 302f 0026                 move.w     38(a7),d0
[00048ca2] d16f 0046                 add.w      d0,70(a7)
[00048ca6] 302f 0026                 move.w     38(a7),d0
[00048caa] 916f 0022                 sub.w      d0,34(a7)
[00048cae] 3f7c 0001 0032            move.w     #$0001,50(a7)
Adr_box_22:
[00048cb4] 3f6f 0040 0048            move.w     64(a7),72(a7)
[00048cba] 3f6f 0042 004a            move.w     66(a7),74(a7)
[00048cc0] 3f6f 0044 004c            move.w     68(a7),76(a7)
[00048cc6] 3f6f 0046 004e            move.w     70(a7),78(a7)
[00048ccc] 43ef 0038                 lea.l      56(a7),a1
[00048cd0] 41ef 0048                 lea.l      72(a7),a0
[00048cd4] 4eb9 0006 c662            jsr        intersect
[00048cda] 302f 0034                 move.w     52(a7),d0
[00048cde] 6738                      beq.s      Adr_box_38
[00048ce0] 4857                      pea.l      (a7)
[00048ce2] 486f 0044                 pea.l      68(a7)
[00048ce6] 206f 0032                 movea.l    50(a7),a0
[00048cea] 3428 0036                 move.w     54(a0),d2
[00048cee] 206f 0032                 movea.l    50(a7),a0
[00048cf2] 2068 0018                 movea.l    24(a0),a0
[00048cf6] d468 0012                 add.w      18(a0),d2
[00048cfa] 206f 0032                 movea.l    50(a7),a0
[00048cfe] 3228 0034                 move.w     52(a0),d1
[00048d02] 4240                      clr.w      d0
[00048d04] 206f 0032                 movea.l    50(a7),a0
[00048d08] 2268 0018                 movea.l    24(a0),a1
[00048d0c] 206f 0032                 movea.l    50(a7),a0
[00048d10] 6100 f4e2                 bsr        rect_find
[00048d14] 504f                      addq.w     #8,a7
[00048d16] 6042                      bra.s      Adr_box_39
Adr_box_38:
[00048d18] 4857                      pea.l      (a7)
[00048d1a] 486f 0044                 pea.l      68(a7)
[00048d1e] 206f 0032                 movea.l    50(a7),a0
[00048d22] 3428 0036                 move.w     54(a0),d2
[00048d26] 206f 0032                 movea.l    50(a7),a0
[00048d2a] 2068 0014                 movea.l    20(a0),a0
[00048d2e] d468 0012                 add.w      18(a0),d2
[00048d32] 206f 0032                 movea.l    50(a7),a0
[00048d36] 3228 0034                 move.w     52(a0),d1
[00048d3a] 206f 0032                 movea.l    50(a7),a0
[00048d3e] 2068 0014                 movea.l    20(a0),a0
[00048d42] d268 0010                 add.w      16(a0),d1
[00048d46] 4240                      clr.w      d0
[00048d48] 206f 0032                 movea.l    50(a7),a0
[00048d4c] 2268 0014                 movea.l    20(a0),a1
[00048d50] 206f 0032                 movea.l    50(a7),a0
[00048d54] 6100 f49e                 bsr        rect_find
[00048d58] 504f                      addq.w     #8,a7
Adr_box_39:
[00048d5a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048d60] 302f 0036                 move.w     54(a7),d0
[00048d64] b068 0246                 cmp.w      582(a0),d0
[00048d68] 671e                      beq.s      Adr_box_15
[00048d6a] 93c9                      suba.l     a1,a1
[00048d6c] 7015                      moveq.l    #21,d0
[00048d6e] 206f 002a                 movea.l    42(a7),a0
[00048d72] 246f 002a                 movea.l    42(a7),a2
[00048d76] 246a 0004                 movea.l    4(a2),a2
[00048d7a] 4e92                      jsr        (a2)
[00048d7c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048d82] 3f68 0246 0036            move.w     582(a0),54(a7)
Adr_box_15:
[00048d88] 302f 001c                 move.w     28(a7),d0
[00048d8c] 6600 f90c                 bne        Adr_box_40
[00048d90] 7002                      moveq.l    #2,d0
[00048d92] 4eb9 0005 ae7e            jsr        Awi_update
[00048d98] 93c9                      suba.l     a1,a1
[00048d9a] 7016                      moveq.l    #22,d0
[00048d9c] 206f 002a                 movea.l    42(a7),a0
[00048da0] 246f 002a                 movea.l    42(a7),a2
[00048da4] 246a 0004                 movea.l    4(a2),a2
[00048da8] 4e92                      jsr        (a2)
[00048daa] 202f 0014                 move.l     20(a7),d0
[00048dae] 670a                      beq.s      Adr_box_41
[00048db0] 206f 0014                 movea.l    20(a7),a0
[00048db4] 4eb9 0004 c6c8            jsr        Ax_ifree
Adr_box_41:
[00048dba] 2079 0010 ee4e            movea.l    ACSblk,a0
[00048dc0] 2068 023c                 movea.l    572(a0),a0
[00048dc4] 41e8 0038                 lea.l      56(a0),a0
[00048dc8] 4eb9 0004 ee3c            jsr        Amo_new
Adr_box_2:
[00048dce] 4fef 0054                 lea.l      84(a7),a7
[00048dd2] 245f                      movea.l    (a7)+,a2
[00048dd4] 4e75                      rts

Adr_find0:
[00048dd6] 4fef ffd2                 lea.l      -46(a7),a7
[00048dda] 2f48 002a                 move.l     a0,42(a7)
[00048dde] 3f40 0028                 move.w     d0,40(a7)
[00048de2] 3f41 0026                 move.w     d1,38(a7)
[00048de6] 3f42 0024                 move.w     d2,36(a7)
[00048dea] 322f 0028                 move.w     40(a7),d1
[00048dee] 48c1                      ext.l      d1
[00048df0] 2001                      move.l     d1,d0
[00048df2] d080                      add.l      d0,d0
[00048df4] d081                      add.l      d1,d0
[00048df6] e788                      lsl.l      #3,d0
[00048df8] 206f 002a                 movea.l    42(a7),a0
[00048dfc] d1c0                      adda.l     d0,a0
[00048dfe] 2f48 0014                 move.l     a0,20(a7)
[00048e02] 303c 0080                 move.w     #$0080,d0
[00048e06] 206f 0014                 movea.l    20(a7),a0
[00048e0a] c068 0008                 and.w      8(a0),d0
[00048e0e] 6706                      beq.s      Adr_find0_1
[00048e10] 70ff                      moveq.l    #-1,d0
[00048e12] 6000 01ba                 bra        Adr_find0_2
Adr_find0_1:
[00048e16] 7008                      moveq.l    #8,d0
[00048e18] 206f 0014                 movea.l    20(a7),a0
[00048e1c] c068 000a                 and.w      10(a0),d0
[00048e20] 6706                      beq.s      Adr_find0_3
[00048e22] 70ff                      moveq.l    #-1,d0
[00048e24] 6000 01a8                 bra        Adr_find0_2
Adr_find0_3:
[00048e28] 206f 0014                 movea.l    20(a7),a0
[00048e2c] 3028 0006                 move.w     6(a0),d0
[00048e30] c07c 00ff                 and.w      #$00FF,d0
[00048e34] 3f40 001c                 move.w     d0,28(a7)
[00048e38] b07c 001f                 cmp.w      #$001F,d0
[00048e3c] 670a                      beq.s      Adr_find0_4
[00048e3e] 0c6f 0021 001c            cmpi.w     #$0021,28(a7)
[00048e44] 6600 00a6                 bne        Adr_find0_5
Adr_find0_4:
[00048e48] 206f 0014                 movea.l    20(a7),a0
[00048e4c] 2ea8 000c                 move.l     12(a0),(a7)
[00048e50] 206f 0014                 movea.l    20(a7),a0
[00048e54] 3028 0010                 move.w     16(a0),d0
[00048e58] 2057                      movea.l    (a7),a0
[00048e5a] d068 0012                 add.w      18(a0),d0
[00048e5e] 3f40 000c                 move.w     d0,12(a7)
[00048e62] 206f 0014                 movea.l    20(a7),a0
[00048e66] 3028 0012                 move.w     18(a0),d0
[00048e6a] 2057                      movea.l    (a7),a0
[00048e6c] d068 0014                 add.w      20(a0),d0
[00048e70] 3f40 000e                 move.w     d0,14(a7)
[00048e74] 2057                      movea.l    (a7),a0
[00048e76] 3f68 0016 0010            move.w     22(a0),16(a7)
[00048e7c] 2057                      movea.l    (a7),a0
[00048e7e] 3f68 0018 0012            move.w     24(a0),18(a7)
[00048e84] 206f 0014                 movea.l    20(a7),a0
[00048e88] 3028 0010                 move.w     16(a0),d0
[00048e8c] 2057                      movea.l    (a7),a0
[00048e8e] d068 001a                 add.w      26(a0),d0
[00048e92] 3f40 0004                 move.w     d0,4(a7)
[00048e96] 206f 0014                 movea.l    20(a7),a0
[00048e9a] 3028 0012                 move.w     18(a0),d0
[00048e9e] 2057                      movea.l    (a7),a0
[00048ea0] d068 001c                 add.w      28(a0),d0
[00048ea4] 3f40 0006                 move.w     d0,6(a7)
[00048ea8] 2057                      movea.l    (a7),a0
[00048eaa] 3f68 001e 0008            move.w     30(a0),8(a7)
[00048eb0] 2057                      movea.l    (a7),a0
[00048eb2] 3f68 0020 000a            move.w     32(a0),10(a7)
[00048eb8] 322f 0032                 move.w     50(a7),d1
[00048ebc] 302f 0024                 move.w     36(a7),d0
[00048ec0] 41ef 000c                 lea.l      12(a7),a0
[00048ec4] 4eb9 0006 b7a6            jsr        Aob_within
[00048eca] 4a40                      tst.w      d0
[00048ecc] 661c                      bne.s      Adr_find0_6
[00048ece] 322f 0032                 move.w     50(a7),d1
[00048ed2] 302f 0024                 move.w     36(a7),d0
[00048ed6] 41ef 0004                 lea.l      4(a7),a0
[00048eda] 4eb9 0006 b7a6            jsr        Aob_within
[00048ee0] 4a40                      tst.w      d0
[00048ee2] 6606                      bne.s      Adr_find0_6
[00048ee4] 70ff                      moveq.l    #-1,d0
[00048ee6] 6000 00e6                 bra        Adr_find0_2
Adr_find0_6:
[00048eea] 6044                      bra.s      Adr_find0_7
Adr_find0_5:
[00048eec] 206f 0014                 movea.l    20(a7),a0
[00048ef0] 3f68 0010 000c            move.w     16(a0),12(a7)
[00048ef6] 206f 0014                 movea.l    20(a7),a0
[00048efa] 3f68 0012 000e            move.w     18(a0),14(a7)
[00048f00] 206f 0014                 movea.l    20(a7),a0
[00048f04] 3f68 0014 0010            move.w     20(a0),16(a7)
[00048f0a] 206f 0014                 movea.l    20(a7),a0
[00048f0e] 3f68 0016 0012            move.w     22(a0),18(a7)
[00048f14] 322f 0032                 move.w     50(a7),d1
[00048f18] 302f 0024                 move.w     36(a7),d0
[00048f1c] 41ef 000c                 lea.l      12(a7),a0
[00048f20] 4eb9 0006 b7a6            jsr        Aob_within
[00048f26] 4a40                      tst.w      d0
[00048f28] 6606                      bne.s      Adr_find0_7
[00048f2a] 70ff                      moveq.l    #-1,d0
[00048f2c] 6000 00a0                 bra        Adr_find0_2
Adr_find0_7:
[00048f30] 206f 0014                 movea.l    20(a7),a0
[00048f34] 3f68 0002 001e            move.w     2(a0),30(a7)
[00048f3a] 302f 001e                 move.w     30(a7),d0
[00048f3e] 6b00 008a                 bmi        Adr_find0_8
[00048f42] 302f 0026                 move.w     38(a7),d0
[00048f46] 6f00 0082                 ble        Adr_find0_8
[00048f4a] 302f 0024                 move.w     36(a7),d0
[00048f4e] 206f 0014                 movea.l    20(a7),a0
[00048f52] 9068 0010                 sub.w      16(a0),d0
[00048f56] 3f40 0022                 move.w     d0,34(a7)
[00048f5a] 302f 0032                 move.w     50(a7),d0
[00048f5e] 206f 0014                 movea.l    20(a7),a0
[00048f62] 9068 0012                 sub.w      18(a0),d0
[00048f66] 3f40 0020                 move.w     d0,32(a7)
[00048f6a] 3f7c ffff 0018            move.w     #$FFFF,24(a7)
[00048f70] 3f2f 0020                 move.w     32(a7),-(a7)
Adr_find0_10:
[00048f74] 342f 0024                 move.w     36(a7),d2
[00048f78] 72ff                      moveq.l    #-1,d1
[00048f7a] d26f 0028                 add.w      40(a7),d1
[00048f7e] 302f 0020                 move.w     32(a7),d0
[00048f82] 206f 002c                 movea.l    44(a7),a0
[00048f86] 6100 fe4e                 bsr        Adr_find0
[00048f8a] 544f                      addq.w     #2,a7
[00048f8c] 3f40 001a                 move.w     d0,26(a7)
[00048f90] 302f 001a                 move.w     26(a7),d0
[00048f94] 6b06                      bmi.s      Adr_find0_9
[00048f96] 3f6f 001a 0018            move.w     26(a7),24(a7)
Adr_find0_9:
[00048f9c] 322f 001e                 move.w     30(a7),d1
[00048fa0] 48c1                      ext.l      d1
[00048fa2] 2001                      move.l     d1,d0
[00048fa4] d080                      add.l      d0,d0
[00048fa6] d081                      add.l      d1,d0
[00048fa8] e788                      lsl.l      #3,d0
[00048faa] 206f 002a                 movea.l    42(a7),a0
[00048fae] 3f70 0800 001e            move.w     0(a0,d0.l),30(a7)
[00048fb4] 302f 001e                 move.w     30(a7),d0
[00048fb8] b06f 0028                 cmp.w      40(a7),d0
[00048fbc] 66b2                      bne.s      Adr_find0_10
[00048fbe] 302f 0018                 move.w     24(a7),d0
[00048fc2] 6b06                      bmi.s      Adr_find0_8
[00048fc4] 302f 0018                 move.w     24(a7),d0
[00048fc8] 6004                      bra.s      Adr_find0_2
Adr_find0_8:
[00048fca] 302f 0028                 move.w     40(a7),d0
Adr_find0_2:
[00048fce] 4fef 002e                 lea.l      46(a7),a7
[00048fd2] 4e75                      rts

Adr_find:
[00048fd4] 4fef fff0                 lea.l      -16(a7),a7
[00048fd8] 2f48 000c                 move.l     a0,12(a7)
[00048fdc] 3f40 000a                 move.w     d0,10(a7)
[00048fe0] 3f41 0008                 move.w     d1,8(a7)
[00048fe4] 3f42 0006                 move.w     d2,6(a7)
[00048fe8] 302f 000a                 move.w     10(a7),d0
[00048fec] 661c                      bne.s      Adr_find_1
[00048fee] 3f2f 0014                 move.w     20(a7),-(a7)
[00048ff2] 342f 0008                 move.w     8(a7),d2
[00048ff6] 322f 000a                 move.w     10(a7),d1
[00048ffa] 4240                      clr.w      d0
[00048ffc] 206f 000e                 movea.l    14(a7),a0
[00049000] 6100 fdd4                 bsr        Adr_find0
[00049004] 544f                      addq.w     #2,a7
[00049006] 6056                      bra.s      Adr_find_2
[00049008] 6054                      bra.s      Adr_find_2
Adr_find_1:
[0004900a] 302f 000a                 move.w     10(a7),d0
[0004900e] 206f 000c                 movea.l    12(a7),a0
[00049012] 4eb9 0005 0f3a            jsr        Aob_up
[00049018] 3e80                      move.w     d0,(a7)
[0004901a] 2f39 000e 692a            move.l     _globl,-(a7)
[00049020] 486f 0006                 pea.l      6(a7)
[00049024] 43ef 000c                 lea.l      12(a7),a1
[00049028] 302f 0008                 move.w     8(a7),d0
[0004902c] 206f 0014                 movea.l    20(a7),a0
[00049030] 4eb9 0007 9d14            jsr        mt_objc_offset
[00049036] 504f                      addq.w     #8,a7
[00049038] 302f 0014                 move.w     20(a7),d0
[0004903c] 906f 0002                 sub.w      2(a7),d0
[00049040] 3f00                      move.w     d0,-(a7)
[00049042] 342f 0008                 move.w     8(a7),d2
[00049046] 946f 0006                 sub.w      6(a7),d2
[0004904a] 322f 000a                 move.w     10(a7),d1
[0004904e] 302f 000c                 move.w     12(a7),d0
[00049052] 206f 000e                 movea.l    14(a7),a0
[00049056] 6100 fd7e                 bsr        Adr_find0
[0004905a] 544f                      addq.w     #2,a7
[0004905c] 4e71                      nop
Adr_find_2:
[0004905e] 4fef 0010                 lea.l      16(a7),a7
[00049062] 4e75                      rts

addDD2Popup:
[00049064] 4fef fff4                 lea.l      -12(a7),a7
[00049068] 2f48 0008                 move.l     a0,8(a7)
[0004906c] 2f49 0004                 move.l     a1,4(a7)
[00049070] 7002                      moveq.l    #2,d0
[00049072] 206f 0004                 movea.l    4(a7),a0
[00049076] c0a8 0002                 and.l      2(a0),d0
[0004907a] 6764                      beq.s      addDD2Popup_1
[0004907c] 206f 0004                 movea.l    4(a7),a0
[00049080] 2068 0008                 movea.l    8(a0),a0
[00049084] 4eb9 0008 2f6c            jsr        strlen
[0004908a] 2e80                      move.l     d0,(a7)
[0004908c] 2017                      move.l     (a7),d0
[0004908e] 6f50                      ble.s      addDD2Popup_1
[00049090] 206f 0008                 movea.l    8(a7),a0
[00049094] 2050                      movea.l    (a0),a0
[00049096] 4eb9 0008 2f6c            jsr        strlen
[0004909c] d097                      add.l      (a7),d0
[0004909e] b0bc 0000 0100            cmp.l      #$00000100,d0
[000490a4] 643a                      bcc.s      addDD2Popup_1
[000490a6] 206f 0004                 movea.l    4(a7),a0
[000490aa] 2268 0008                 movea.l    8(a0),a1
[000490ae] 206f 0008                 movea.l    8(a7),a0
[000490b2] 2050                      movea.l    (a0),a0
[000490b4] 4eb9 0008 2e42            jsr        strcat
[000490ba] 43f9 000e 071a            lea.l      $000E071A,a1
[000490c0] 206f 0008                 movea.l    8(a7),a0
[000490c4] 2050                      movea.l    (a0),a0
[000490c6] 4eb9 0008 2e42            jsr        strcat
[000490cc] 206f 0008                 movea.l    8(a7),a0
[000490d0] 2028 0004                 move.l     4(a0),d0
[000490d4] b097                      cmp.l      (a7),d0
[000490d6] 6c08                      bge.s      addDD2Popup_1
[000490d8] 206f 0008                 movea.l    8(a7),a0
[000490dc] 2157 0004                 move.l     (a7),4(a0)
addDD2Popup_1:
[000490e0] 4fef 000c                 lea.l      12(a7),a7
[000490e4] 4e75                      rts

DDCmpName:
[000490e6] 514f                      subq.w     #8,a7
[000490e8] 2f48 0004                 move.l     a0,4(a7)
[000490ec] 2e89                      move.l     a1,(a7)
[000490ee] 2057                      movea.l    (a7),a0
[000490f0] 2068 0008                 movea.l    8(a0),a0
[000490f4] 4eb9 0008 2f6c            jsr        strlen
[000490fa] 2f00                      move.l     d0,-(a7)
[000490fc] 206f 0008                 movea.l    8(a7),a0
[00049100] 4eb9 0008 2f6c            jsr        strlen
[00049106] b09f                      cmp.l      (a7)+,d0
[00049108] 640c                      bcc.s      DDCmpName_1
[0004910a] 206f 0004                 movea.l    4(a7),a0
[0004910e] 4eb9 0008 2f6c            jsr        strlen
[00049114] 600c                      bra.s      DDCmpName_2
DDCmpName_1:
[00049116] 2057                      movea.l    (a7),a0
[00049118] 2068 0008                 movea.l    8(a0),a0
[0004911c] 4eb9 0008 2f6c            jsr        strlen
DDCmpName_2:
[00049122] 2057                      movea.l    (a7),a0
[00049124] 2268 0008                 movea.l    8(a0),a1
[00049128] 206f 0004                 movea.l    4(a7),a0
[0004912c] 4eb9 0008 2fb8            jsr        strncmp
[00049132] 4a40                      tst.w      d0
[00049134] 6604                      bne.s      DDCmpName_3
[00049136] 7001                      moveq.l    #1,d0
[00049138] 6002                      bra.s      DDCmpName_4
DDCmpName_3:
[0004913a] 4240                      clr.w      d0
DDCmpName_4:
[0004913c] 504f                      addq.w     #8,a7
[0004913e] 4e75                      rts

Adr_drag:
[00049140] 3f03                      move.w     d3,-(a7)
[00049142] 2f0a                      move.l     a2,-(a7)
[00049144] 4fef fdde                 lea.l      -546(a7),a7
[00049148] 3f40 0184                 move.w     d0,388(a7)
[0004914c] 3f41 0182                 move.w     d1,386(a7)
[00049150] 41f9 000e 05f6            lea.l      $000E05F6,a0
[00049156] 43ef 007e                 lea.l      126(a7),a1
[0004915a] 303c 00ff                 move.w     #$00FF,d0
[0004915e] 12d8                      move.b     (a0)+,(a1)+
Adr_drag_1:
[00049160] 51c8 fffc                 dbf        d0,Adr_drag_1
[00049164] 42af 0032                 clr.l      50(a7)
[00049168] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004916e] 3028 0246                 move.w     582(a0),d0
[00049172] 6e04                      bgt.s      Adr_drag_2
[00049174] 6000 1178                 bra        Adr_drag_3
Adr_drag_2:
[00049178] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004917e] 2f68 0240 002e            move.l     576(a0),46(a7)
[00049184] 3ebc 0001                 move.w     #$0001,(a7)
[00049188] 3f7c 0001 0002            move.w     #$0001,2(a7)
[0004918e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049194] 3f68 0008 0004            move.w     8(a0),4(a7)
[0004919a] 2079 0010 ee4e            movea.l    ACSblk,a0
[000491a0] 3028 0008                 move.w     8(a0),d0
[000491a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000491aa] d068 000c                 add.w      12(a0),d0
[000491ae] 5340                      subq.w     #1,d0
[000491b0] 3f40 0006                 move.w     d0,6(a7)
[000491b4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000491ba] 3f68 000a 0008            move.w     10(a0),8(a7)
[000491c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000491c6] 3028 000a                 move.w     10(a0),d0
[000491ca] 2079 0010 ee4e            movea.l    ACSblk,a0
[000491d0] d068 000c                 add.w      12(a0),d0
[000491d4] 5340                      subq.w     #1,d0
[000491d6] 3f40 000a                 move.w     d0,10(a7)
[000491da] 7003                      moveq.l    #3,d0
[000491dc] 3f40 000c                 move.w     d0,12(a7)
[000491e0] 3f40 000e                 move.w     d0,14(a7)
[000491e4] 3f40 0010                 move.w     d0,16(a7)
[000491e8] 3f40 0012                 move.w     d0,18(a7)
[000491ec] 3f40 0014                 move.w     d0,20(a7)
[000491f0] 3f40 0016                 move.w     d0,22(a7)
[000491f4] 3f40 0018                 move.w     d0,24(a7)
[000491f8] 3f40 001a                 move.w     d0,26(a7)
[000491fc] 43d7                      lea.l      (a7),a1
[000491fe] 7012                      moveq.l    #18,d0
[00049200] 206f 002e                 movea.l    46(a7),a0
[00049204] 246f 002e                 movea.l    46(a7),a2
[00049208] 246a 0004                 movea.l    4(a2),a2
[0004920c] 4e92                      jsr        (a2)
[0004920e] 6100 e650                 bsr        drag_set
[00049212] 42af 002a                 clr.l      42(a7)
[00049216] 302f 0184                 move.w     388(a7),d0
[0004921a] 48c0                      ext.l      d0
[0004921c] 81d7                      divs.w     (a7),d0
[0004921e] 4840                      swap       d0
[00049220] 3f40 0020                 move.w     d0,32(a7)
[00049224] 302f 0182                 move.w     386(a7),d0
[00049228] 48c0                      ext.l      d0
[0004922a] 81ef 0002                 divs.w     2(a7),d0
[0004922e] 4840                      swap       d0
[00049230] 3f40 001e                 move.w     d0,30(a7)
[00049234] 3f6f 0184 005c            move.w     388(a7),92(a7)
[0004923a] 3f6f 0182 005a            move.w     386(a7),90(a7)
[00049240] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049246] 3f68 0266 004a            move.w     614(a0),74(a7)
[0004924c] 7003                      moveq.l    #3,d0
[0004924e] c06f 004a                 and.w      74(a7),d0
[00049252] 6706                      beq.s      Adr_drag_4
[00049254] 006f 0003 004a            ori.w      #$0003,74(a7)
Adr_drag_4:
[0004925a] e0ef 004a                 asr.w      74(a7)
[0004925e] 302f 004a                 move.w     74(a7),d0
[00049262] d040                      add.w      d0,d0
[00049264] 3f77 000c 001c            move.w     12(a7,d0.w),28(a7)
[0004926a] 322f 001c                 move.w     28(a7),d1
[0004926e] 48c1                      ext.l      d1
[00049270] 2001                      move.l     d1,d0
[00049272] d080                      add.l      d0,d0
[00049274] d081                      add.l      d1,d0
[00049276] d080                      add.l      d0,d0
[00049278] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004927e] 2068 023c                 movea.l    572(a0),a0
[00049282] 41f0 0838                 lea.l      56(a0,d0.l),a0
[00049286] 4eb9 0004 ee3c            jsr        Amo_new
[0004928c] 3f7c ffff 0046            move.w     #$FFFF,70(a7)
[00049292] 302f 005c                 move.w     92(a7),d0
Adr_drag_39:
[00049296] 906f 0184                 sub.w      388(a7),d0
[0004929a] 3f40 0054                 move.w     d0,84(a7)
[0004929e] 302f 005a                 move.w     90(a7),d0
[000492a2] 906f 0182                 sub.w      386(a7),d0
[000492a6] 3f40 0052                 move.w     d0,82(a7)
[000492aa] 322f 0052                 move.w     82(a7),d1
[000492ae] 302f 0054                 move.w     84(a7),d0
[000492b2] 6100 e822                 bsr        drag_draw
[000492b6] 3f6f 005c 0058            move.w     92(a7),88(a7)
Adr_drag_12:
[000492bc] 3f6f 005a 0056            move.w     90(a7),86(a7)
[000492c2] 2f39 000e 692a            move.l     _globl,-(a7)
[000492c8] 486f 0054                 pea.l      84(a7)
[000492cc] 486f 0046                 pea.l      70(a7)
[000492d0] 43ef 0066                 lea.l      102(a7),a1
[000492d4] 41ef 0068                 lea.l      104(a7),a0
[000492d8] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[000492de] 4fef 000c                 lea.l      12(a7),a7
[000492e2] 3f6f 0050 004a            move.w     80(a7),74(a7)
[000492e8] 7003                      moveq.l    #3,d0
[000492ea] c06f 004a                 and.w      74(a7),d0
[000492ee] 6706                      beq.s      Adr_drag_5
[000492f0] 006f 0003 004a            ori.w      #$0003,74(a7)
Adr_drag_5:
[000492f6] e0ef 004a                 asr.w      74(a7)
[000492fa] 302f 004a                 move.w     74(a7),d0
[000492fe] d040                      add.w      d0,d0
[00049300] 322f 001c                 move.w     28(a7),d1
[00049304] b277 000c                 cmp.w      12(a7,d0.w),d1
[00049308] 672e                      beq.s      Adr_drag_6
[0004930a] 302f 004a                 move.w     74(a7),d0
[0004930e] d040                      add.w      d0,d0
[00049310] 3f77 000c 001c            move.w     12(a7,d0.w),28(a7)
[00049316] 322f 001c                 move.w     28(a7),d1
[0004931a] 48c1                      ext.l      d1
[0004931c] 2001                      move.l     d1,d0
[0004931e] d080                      add.l      d0,d0
[00049320] d081                      add.l      d1,d0
[00049322] d080                      add.l      d0,d0
[00049324] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004932a] 2068 023c                 movea.l    572(a0),a0
[0004932e] 41f0 0838                 lea.l      56(a0,d0.l),a0
[00049332] 4eb9 0004 ee3c            jsr        Amo_new
Adr_drag_6:
[00049338] 3017                      move.w     (a7),d0
[0004933a] e240                      asr.w      #1,d0
[0004933c] d16f 005c                 add.w      d0,92(a7)
[00049340] 302f 0002                 move.w     2(a7),d0
[00049344] e240                      asr.w      #1,d0
[00049346] d16f 005a                 add.w      d0,90(a7)
[0004934a] 302f 005c                 move.w     92(a7),d0
[0004934e] b06f 0004                 cmp.w      4(a7),d0
[00049352] 6c06                      bge.s      Adr_drag_7
[00049354] 3f6f 0004 005c            move.w     4(a7),92(a7)
Adr_drag_7:
[0004935a] 302f 005c                 move.w     92(a7),d0
[0004935e] b06f 0006                 cmp.w      6(a7),d0
[00049362] 6f06                      ble.s      Adr_drag_8
[00049364] 3f6f 0006 005c            move.w     6(a7),92(a7)
Adr_drag_8:
[0004936a] 302f 005a                 move.w     90(a7),d0
[0004936e] b06f 0008                 cmp.w      8(a7),d0
[00049372] 6c06                      bge.s      Adr_drag_9
[00049374] 3f6f 0008 005a            move.w     8(a7),90(a7)
Adr_drag_9:
[0004937a] 302f 005a                 move.w     90(a7),d0
[0004937e] b06f 000a                 cmp.w      10(a7),d0
[00049382] 6f06                      ble.s      Adr_drag_10
[00049384] 3f6f 000a 005a            move.w     10(a7),90(a7)
Adr_drag_10:
[0004938a] 302f 005c                 move.w     92(a7),d0
[0004938e] 906f 0020                 sub.w      32(a7),d0
[00049392] 48c0                      ext.l      d0
[00049394] 81d7                      divs.w     (a7),d0
[00049396] 4840                      swap       d0
[00049398] 916f 005c                 sub.w      d0,92(a7)
[0004939c] 302f 005a                 move.w     90(a7),d0
[000493a0] 906f 001e                 sub.w      30(a7),d0
[000493a4] 48c0                      ext.l      d0
[000493a6] 81ef 0002                 divs.w     2(a7),d0
[000493aa] 4840                      swap       d0
[000493ac] 916f 005a                 sub.w      d0,90(a7)
[000493b0] 302f 003e                 move.w     62(a7),d0
[000493b4] 6716                      beq.s      Adr_drag_11
[000493b6] 302f 0058                 move.w     88(a7),d0
[000493ba] b06f 005c                 cmp.w      92(a7),d0
[000493be] 660c                      bne.s      Adr_drag_11
[000493c0] 302f 0056                 move.w     86(a7),d0
[000493c4] b06f 005a                 cmp.w      90(a7),d0
[000493c8] 6700 feec                 beq        Adr_drag_12
Adr_drag_11:
[000493cc] 322f 0052                 move.w     82(a7),d1
[000493d0] 302f 0054                 move.w     84(a7),d0
[000493d4] 6100 e700                 bsr        drag_draw
[000493d8] 2079 000e 692a            movea.l    _globl,a0
[000493de] 322f 005a                 move.w     90(a7),d1
[000493e2] 302f 005c                 move.w     92(a7),d0
[000493e6] 4eb9 0007 b81c            jsr        mt_wind_find
[000493ec] 3f40 0044                 move.w     d0,68(a7)
[000493f0] 302f 0044                 move.w     68(a7),d0
[000493f4] 4eb9 0005 5e68            jsr        Awi_wid
[000493fa] 2f48 002e                 move.l     a0,46(a7)
[000493fe] 202f 002e                 move.l     46(a7),d0
[00049402] 6604                      bne.s      Adr_drag_13
[00049404] 7001                      moveq.l    #1,d0
[00049406] 6002                      bra.s      Adr_drag_14
Adr_drag_13:
[00049408] 4240                      clr.w      d0
Adr_drag_14:
[0004940a] 3f40 0042                 move.w     d0,66(a7)
[0004940e] 202f 002e                 move.l     46(a7),d0
[00049412] 6700 018c                 beq        Adr_drag_15
[00049416] 206f 002e                 movea.l    46(a7),a0
[0004941a] 2028 0014                 move.l     20(a0),d0
[0004941e] 660c                      bne.s      Adr_drag_16
[00049420] 206f 002e                 movea.l    46(a7),a0
[00049424] 2028 0018                 move.l     24(a0),d0
[00049428] 6700 0176                 beq        Adr_drag_15
Adr_drag_16:
[0004942c] 302f 005a                 move.w     90(a7),d0
[00049430] 206f 002e                 movea.l    46(a7),a0
[00049434] 9068 0036                 sub.w      54(a0),d0
[00049438] 3f00                      move.w     d0,-(a7)
[0004943a] 342f 005e                 move.w     94(a7),d2
[0004943e] 206f 0030                 movea.l    48(a7),a0
[00049442] 9468 0034                 sub.w      52(a0),d2
[00049446] 7208                      moveq.l    #8,d1
[00049448] 4240                      clr.w      d0
[0004944a] 206f 0030                 movea.l    48(a7),a0
[0004944e] 2068 0014                 movea.l    20(a0),a0
[00049452] 6100 fb80                 bsr        Adr_find
[00049456] 544f                      addq.w     #2,a7
[00049458] 3f40 0048                 move.w     d0,72(a7)
[0004945c] 302f 0048                 move.w     72(a7),d0
[00049460] 6a46                      bpl.s      Adr_drag_17
[00049462] 206f 002e                 movea.l    46(a7),a0
[00049466] 2028 0018                 move.l     24(a0),d0
[0004946a] 673c                      beq.s      Adr_drag_17
[0004946c] 302f 005a                 move.w     90(a7),d0
[00049470] 206f 002e                 movea.l    46(a7),a0
[00049474] 9068 0036                 sub.w      54(a0),d0
[00049478] 3f00                      move.w     d0,-(a7)
[0004947a] 342f 005e                 move.w     94(a7),d2
[0004947e] 206f 0030                 movea.l    48(a7),a0
[00049482] 9468 0034                 sub.w      52(a0),d2
[00049486] 7208                      moveq.l    #8,d1
[00049488] 4240                      clr.w      d0
[0004948a] 206f 0030                 movea.l    48(a7),a0
[0004948e] 2068 0018                 movea.l    24(a0),a0
[00049492] 6100 fb40                 bsr        Adr_find
[00049496] 544f                      addq.w     #2,a7
[00049498] 3f40 0048                 move.w     d0,72(a7)
[0004949c] 302f 0048                 move.w     72(a7),d0
[000494a0] 6b06                      bmi.s      Adr_drag_17
[000494a2] 006f 1000 0048            ori.w      #$1000,72(a7)
Adr_drag_17:
[000494a8] 6000 00ec                 bra        Adr_drag_18
[000494ac] 206f 002e                 movea.l    46(a7),a0
Adr_drag_27:
[000494b0] b1ef 002a                 cmpa.l     42(a7),a0
[000494b4] 660e                      bne.s      Adr_drag_19
[000494b6] 302f 0048                 move.w     72(a7),d0
[000494ba] b06f 0046                 cmp.w      70(a7),d0
[000494be] 6604                      bne.s      Adr_drag_19
[000494c0] 6000 00dc                 bra        Adr_drag_20
Adr_drag_19:
[000494c4] 302f 0048                 move.w     72(a7),d0
[000494c8] c07c 1000                 and.w      #$1000,d0
[000494cc] 6722                      beq.s      Adr_drag_21
[000494ce] 322f 0048                 move.w     72(a7),d1
[000494d2] c27c 0fff                 and.w      #$0FFF,d1
[000494d6] 48c1                      ext.l      d1
[000494d8] 2001                      move.l     d1,d0
[000494da] d080                      add.l      d0,d0
[000494dc] d081                      add.l      d1,d0
[000494de] e788                      lsl.l      #3,d0
[000494e0] 206f 002e                 movea.l    46(a7),a0
[000494e4] 2068 0018                 movea.l    24(a0),a0
[000494e8] d1c0                      adda.l     d0,a0
[000494ea] 2f48 0026                 move.l     a0,38(a7)
[000494ee] 601c                      bra.s      Adr_drag_22
Adr_drag_21:
[000494f0] 322f 0048                 move.w     72(a7),d1
[000494f4] 48c1                      ext.l      d1
[000494f6] 2001                      move.l     d1,d0
[000494f8] d080                      add.l      d0,d0
[000494fa] d081                      add.l      d1,d0
[000494fc] e788                      lsl.l      #3,d0
[000494fe] 206f 002e                 movea.l    46(a7),a0
[00049502] 2068 0014                 movea.l    20(a0),a0
[00049506] d1c0                      adda.l     d0,a0
[00049508] 2f48 0026                 move.l     a0,38(a7)
Adr_drag_22:
[0004950c] 206f 0026                 movea.l    38(a7),a0
[00049510] 3028 0008                 move.w     8(a0),d0
[00049514] c07c 1000                 and.w      #$1000,d0
[00049518] 6618                      bne.s      Adr_drag_23
[0004951a] 206f 0026                 movea.l    38(a7),a0
[0004951e] 0c28 0018 0007            cmpi.b     #$18,7(a0)
[00049524] 660e                      bne.s      Adr_drag_24
[00049526] 7008                      moveq.l    #8,d0
[00049528] 206f 0026                 movea.l    38(a7),a0
[0004952c] c068 0008                 and.w      8(a0),d0
[00049530] 6702                      beq.s      Adr_drag_24
Adr_drag_23:
[00049532] 606a                      bra.s      Adr_drag_20
Adr_drag_24:
[00049534] 206f 0026                 movea.l    38(a7),a0
[00049538] 3028 0008                 move.w     8(a0),d0
[0004953c] c07c 2000                 and.w      #$2000,d0
[00049540] 6714                      beq.s      Adr_drag_25
[00049542] 7001                      moveq.l    #1,d0
[00049544] 206f 0026                 movea.l    38(a7),a0
[00049548] c068 000a                 and.w      10(a0),d0
[0004954c] 6708                      beq.s      Adr_drag_25
[0004954e] 3f7c ffff 0048            move.w     #$FFFF,72(a7)
[00049554] 6048                      bra.s      Adr_drag_20
Adr_drag_25:
[00049556] 302f 0048                 move.w     72(a7),d0
[0004955a] c07c 1000                 and.w      #$1000,d0
[0004955e] 6720                      beq.s      Adr_drag_26
[00049560] 302f 0048                 move.w     72(a7),d0
[00049564] c07c 0fff                 and.w      #$0FFF,d0
[00049568] 206f 002e                 movea.l    46(a7),a0
[0004956c] 2068 0018                 movea.l    24(a0),a0
[00049570] 4eb9 0005 0f3a            jsr        Aob_up
[00049576] 807c 1000                 or.w       #$1000,d0
[0004957a] 3f40 0048                 move.w     d0,72(a7)
[0004957e] 6016                      bra.s      Adr_drag_18
Adr_drag_26:
[00049580] 302f 0048                 move.w     72(a7),d0
[00049584] 206f 002e                 movea.l    46(a7),a0
[00049588] 2068 0014                 movea.l    20(a0),a0
[0004958c] 4eb9 0005 0f3a            jsr        Aob_up
[00049592] 3f40 0048                 move.w     d0,72(a7)
Adr_drag_18:
[00049596] 302f 0048                 move.w     72(a7),d0
[0004959a] 6a00 ff10                 bpl        Adr_drag_27
Adr_drag_20:
[0004959e] 6006                      bra.s      Adr_drag_28
Adr_drag_15:
[000495a0] 3f7c ffff 0048            move.w     #$FFFF,72(a7)
Adr_drag_28:
[000495a6] 302f 0048                 move.w     72(a7),d0
[000495aa] b06f 0046                 cmp.w      70(a7),d0
[000495ae] 660c                      bne.s      Adr_drag_29
[000495b0] 206f 002e                 movea.l    46(a7),a0
[000495b4] b1ef 002a                 cmpa.l     42(a7),a0
[000495b8] 6700 015a                 beq        Adr_drag_30
Adr_drag_29:
[000495bc] 302f 0046                 move.w     70(a7),d0
[000495c0] 6b74                      bmi.s      Adr_drag_31
[000495c2] 302f 0046                 move.w     70(a7),d0
[000495c6] c07c 1000                 and.w      #$1000,d0
[000495ca] 6722                      beq.s      Adr_drag_32
[000495cc] 322f 0046                 move.w     70(a7),d1
[000495d0] c27c 0fff                 and.w      #$0FFF,d1
[000495d4] 48c1                      ext.l      d1
[000495d6] 2001                      move.l     d1,d0
[000495d8] d080                      add.l      d0,d0
[000495da] d081                      add.l      d1,d0
[000495dc] e788                      lsl.l      #3,d0
[000495de] 206f 002a                 movea.l    42(a7),a0
[000495e2] 2068 0018                 movea.l    24(a0),a0
[000495e6] d1c0                      adda.l     d0,a0
[000495e8] 2f48 0026                 move.l     a0,38(a7)
[000495ec] 601c                      bra.s      Adr_drag_33
Adr_drag_32:
[000495ee] 322f 0046                 move.w     70(a7),d1
[000495f2] 48c1                      ext.l      d1
[000495f4] 2001                      move.l     d1,d0
[000495f6] d080                      add.l      d0,d0
[000495f8] d081                      add.l      d1,d0
[000495fa] e788                      lsl.l      #3,d0
[000495fc] 206f 002a                 movea.l    42(a7),a0
[00049600] 2068 0014                 movea.l    20(a0),a0
[00049604] d1c0                      adda.l     d0,a0
[00049606] 2f48 0026                 move.l     a0,38(a7)
Adr_drag_33:
[0004960a] 206f 0026                 movea.l    38(a7),a0
[0004960e] 3028 0008                 move.w     8(a0),d0
[00049612] c07c 0800                 and.w      #$0800,d0
[00049616] 661e                      bne.s      Adr_drag_31
[00049618] 206f 0026                 movea.l    38(a7),a0
[0004961c] 3228 000a                 move.w     10(a0),d1
[00049620] c27c fffe                 and.w      #$FFFE,d1
[00049624] 302f 0046                 move.w     70(a7),d0
[00049628] 206f 002a                 movea.l    42(a7),a0
[0004962c] 226f 002a                 movea.l    42(a7),a1
[00049630] 2269 0066                 movea.l    102(a1),a1
[00049634] 4e91                      jsr        (a1)
Adr_drag_31:
[00049636] 3f7c ffff 0046            move.w     #$FFFF,70(a7)
[0004963c] 302f 0048                 move.w     72(a7),d0
[00049640] 6b00 00d2                 bmi        Adr_drag_30
[00049644] 302f 0048                 move.w     72(a7),d0
[00049648] c07c 1000                 and.w      #$1000,d0
[0004964c] 6722                      beq.s      Adr_drag_34
[0004964e] 322f 0048                 move.w     72(a7),d1
[00049652] c27c 0fff                 and.w      #$0FFF,d1
[00049656] 48c1                      ext.l      d1
[00049658] 2001                      move.l     d1,d0
[0004965a] d080                      add.l      d0,d0
[0004965c] d081                      add.l      d1,d0
[0004965e] e788                      lsl.l      #3,d0
[00049660] 206f 002e                 movea.l    46(a7),a0
[00049664] 2068 0018                 movea.l    24(a0),a0
[00049668] d1c0                      adda.l     d0,a0
[0004966a] 2f48 0026                 move.l     a0,38(a7)
[0004966e] 601c                      bra.s      Adr_drag_35
Adr_drag_34:
[00049670] 322f 0048                 move.w     72(a7),d1
[00049674] 48c1                      ext.l      d1
[00049676] 2001                      move.l     d1,d0
[00049678] d080                      add.l      d0,d0
[0004967a] d081                      add.l      d1,d0
[0004967c] e788                      lsl.l      #3,d0
[0004967e] 206f 002e                 movea.l    46(a7),a0
[00049682] 2068 0014                 movea.l    20(a0),a0
[00049686] d1c0                      adda.l     d0,a0
[00049688] 2f48 0026                 move.l     a0,38(a7)
Adr_drag_35:
[0004968c] 206f 0026                 movea.l    38(a7),a0
[00049690] 3028 0008                 move.w     8(a0),d0
[00049694] c07c 2000                 and.w      #$2000,d0
[00049698] 6714                      beq.s      Adr_drag_36
[0004969a] 7001                      moveq.l    #1,d0
[0004969c] 206f 0026                 movea.l    38(a7),a0
[000496a0] c068 000a                 and.w      10(a0),d0
[000496a4] 6708                      beq.s      Adr_drag_36
[000496a6] 3f7c ffff 0048            move.w     #$FFFF,72(a7)
[000496ac] 605a                      bra.s      Adr_drag_37
Adr_drag_36:
[000496ae] 206f 0026                 movea.l    38(a7),a0
[000496b2] 3028 0008                 move.w     8(a0),d0
[000496b6] c07c 0800                 and.w      #$0800,d0
[000496ba] 664c                      bne.s      Adr_drag_37
[000496bc] 3f6f 0048 003a            move.w     72(a7),58(a7)
[000496c2] 3f7c 0001 003c            move.w     #$0001,60(a7)
[000496c8] 43ef 003a                 lea.l      58(a7),a1
[000496cc] 7009                      moveq.l    #9,d0
[000496ce] 206f 002e                 movea.l    46(a7),a0
[000496d2] 246f 002e                 movea.l    46(a7),a2
[000496d6] 246a 0004                 movea.l    4(a2),a2
[000496da] 4e92                      jsr        (a2)
[000496dc] 0c6f 0001 003c            cmpi.w     #$0001,60(a7)
[000496e2] 661e                      bne.s      Adr_drag_38
[000496e4] 7201                      moveq.l    #1,d1
[000496e6] 206f 0026                 movea.l    38(a7),a0
[000496ea] 8268 000a                 or.w       10(a0),d1
[000496ee] 302f 0048                 move.w     72(a7),d0
[000496f2] 206f 002e                 movea.l    46(a7),a0
[000496f6] 226f 002e                 movea.l    46(a7),a1
[000496fa] 2269 0066                 movea.l    102(a1),a1
[000496fe] 4e91                      jsr        (a1)
[00049700] 6006                      bra.s      Adr_drag_37
Adr_drag_38:
[00049702] 3f7c ffff 0048            move.w     #$FFFF,72(a7)
Adr_drag_37:
[00049708] 2f6f 002e 002a            move.l     46(a7),42(a7)
[0004970e] 3f6f 0048 0046            move.w     72(a7),70(a7)
Adr_drag_30:
[00049714] 302f 003e                 move.w     62(a7),d0
[00049718] 6600 fb78                 bne        Adr_drag_39
[0004971c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049722] 2068 023c                 movea.l    572(a0),a0
[00049726] 41e8 0038                 lea.l      56(a0),a0
[0004972a] 4eb9 0004 ee3c            jsr        Amo_new
[00049730] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049736] 317c 0001 024a            move.w     #$0001,586(a0)
[0004973c] 302f 0046                 move.w     70(a7),d0
[00049740] 6b00 02a8                 bmi        Adr_drag_40
[00049744] 302f 0046                 move.w     70(a7),d0
[00049748] c07c 1000                 and.w      #$1000,d0
[0004974c] 670c                      beq.s      Adr_drag_41
[0004974e] 206f 002a                 movea.l    42(a7),a0
[00049752] 2f68 0018 0022            move.l     24(a0),34(a7)
[00049758] 600a                      bra.s      Adr_drag_42
Adr_drag_41:
[0004975a] 206f 002a                 movea.l    42(a7),a0
[0004975e] 2f68 0014 0022            move.l     20(a0),34(a7)
Adr_drag_42:
[00049764] 322f 0046                 move.w     70(a7),d1
[00049768] c27c 0fff                 and.w      #$0FFF,d1
[0004976c] 48c1                      ext.l      d1
[0004976e] 2001                      move.l     d1,d0
[00049770] d080                      add.l      d0,d0
[00049772] d081                      add.l      d1,d0
[00049774] e788                      lsl.l      #3,d0
[00049776] 206f 0022                 movea.l    34(a7),a0
[0004977a] 41f0 0818                 lea.l      24(a0,d0.l),a0
[0004977e] 2f48 0076                 move.l     a0,118(a7)
[00049782] 206f 0076                 movea.l    118(a7),a0
[00049786] 3028 0008                 move.w     8(a0),d0
[0004978a] c07c 8000                 and.w      #$8000,d0
[0004978e] 6700 00ba                 beq        Adr_drag_43
[00049792] 206f 0076                 movea.l    118(a7),a0
[00049796] 2028 0004                 move.l     4(a0),d0
[0004979a] 6700 00ae                 beq        Adr_drag_43
[0004979e] 2079 0010 ee4e            movea.l    ACSblk,a0
[000497a4] 316f 0184 024c            move.w     388(a7),588(a0)
[000497aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[000497b0] 316f 0182 024e            move.w     386(a7),590(a0)
[000497b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000497bc] 316f 0054 0250            move.w     84(a7),592(a0)
[000497c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000497c8] 316f 0052 0252            move.w     82(a7),594(a0)
[000497ce] 41ef 005e                 lea.l      94(a7),a0
[000497d2] 4eb9 0006 bf9e            jsr        Act_save
[000497d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000497de] 316f 005c 0262            move.w     92(a7),610(a0)
[000497e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000497ea] 316f 005a 0264            move.w     90(a7),612(a0)
[000497f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000497f6] 316f 0050 0266            move.w     80(a7),614(a0)
[000497fc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049802] 216f 002a 0258            move.l     42(a7),600(a0)
[00049808] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004980e] 216f 0022 025c            move.l     34(a7),604(a0)
[00049814] 302f 0046                 move.w     70(a7),d0
[00049818] c07c 0fff                 and.w      #$0FFF,d0
[0004981c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049822] 3140 0260                 move.w     d0,608(a0)
[00049826] 4eb9 0004 eec0            jsr        Amo_busy
[0004982c] 206f 0076                 movea.l    118(a7),a0
[00049830] 2068 0004                 movea.l    4(a0),a0
[00049834] 4e90                      jsr        (a0)
[00049836] 4eb9 0004 ef0c            jsr        Amo_unbusy
[0004983c] 41ef 005e                 lea.l      94(a7),a0
[00049840] 4eb9 0006 c00a            jsr        Act_restore
[00049846] 6000 0100                 bra        Adr_drag_44
Adr_drag_43:
[0004984a] 322f 0046                 move.w     70(a7),d1
[0004984e] c27c 0fff                 and.w      #$0FFF,d1
[00049852] 48c1                      ext.l      d1
[00049854] 2001                      move.l     d1,d0
[00049856] d080                      add.l      d0,d0
[00049858] d081                      add.l      d1,d0
[0004985a] e788                      lsl.l      #3,d0
[0004985c] 206f 0022                 movea.l    34(a7),a0
[00049860] 2f70 080c 0032            move.l     12(a0,d0.l),50(a7)
[00049866] 206f 0032                 movea.l    50(a7),a0
[0004986a] 2028 0008                 move.l     8(a0),d0
[0004986e] 6700 00d4                 beq        Adr_drag_45
[00049872] 6100 e5aa                 bsr        Adr_start
[00049876] 6100 e5b2                 bsr        Adr_next
[0004987a] 3f40 0048                 move.w     d0,72(a7)
[0004987e] 6f00 00be                 ble        Adr_drag_46
[00049882] 302f 0048                 move.w     72(a7),d0
[00049886] c07c 1000                 and.w      #$1000,d0
[0004988a] 672a                      beq.s      Adr_drag_47
[0004988c] 322f 0048                 move.w     72(a7),d1
[00049890] c27c 0fff                 and.w      #$0FFF,d1
[00049894] 48c1                      ext.l      d1
[00049896] 2001                      move.l     d1,d0
[00049898] d080                      add.l      d0,d0
[0004989a] d081                      add.l      d1,d0
[0004989c] e788                      lsl.l      #3,d0
[0004989e] 2079 0010 ee4e            movea.l    ACSblk,a0
[000498a4] 2068 0240                 movea.l    576(a0),a0
[000498a8] 2068 0018                 movea.l    24(a0),a0
[000498ac] 41f0 0818                 lea.l      24(a0,d0.l),a0
[000498b0] 2f48 0076                 move.l     a0,118(a7)
[000498b4] 6024                      bra.s      Adr_drag_48
Adr_drag_47:
[000498b6] 322f 0048                 move.w     72(a7),d1
[000498ba] 48c1                      ext.l      d1
[000498bc] 2001                      move.l     d1,d0
[000498be] d080                      add.l      d0,d0
[000498c0] d081                      add.l      d1,d0
[000498c2] e788                      lsl.l      #3,d0
[000498c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000498ca] 2068 0240                 movea.l    576(a0),a0
[000498ce] 2068 0014                 movea.l    20(a0),a0
[000498d2] 41f0 0818                 lea.l      24(a0,d0.l),a0
[000498d6] 2f48 0076                 move.l     a0,118(a7)
Adr_drag_48:
[000498da] 206f 0076                 movea.l    118(a7),a0
[000498de] 3028 0016                 move.w     22(a0),d0
[000498e2] 907c 000b                 sub.w      #$000B,d0
[000498e6] 670e                      beq.s      Adr_drag_49
[000498e8] 907c 0009                 sub.w      #$0009,d0
[000498ec] 6708                      beq.s      Adr_drag_49
[000498ee] 907c 000b                 sub.w      #$000B,d0
[000498f2] 6702                      beq.s      Adr_drag_49
[000498f4] 6042                      bra.s      Adr_drag_50
Adr_drag_49:
[000498f6] 206f 0076                 movea.l    118(a7),a0
[000498fa] 2028 000c                 move.l     12(a0),d0
[000498fe] 6732                      beq.s      Adr_drag_51
[00049900] 206f 0076                 movea.l    118(a7),a0
[00049904] 2268 000c                 movea.l    12(a0),a1
[00049908] 303c 02c1                 move.w     #$02C1,d0
[0004990c] 342f 0046                 move.w     70(a7),d2
[00049910] c47c 0fff                 and.w      #$0FFF,d2
[00049914] 48c2                      ext.l      d2
[00049916] 2202                      move.l     d2,d1
[00049918] d281                      add.l      d1,d1
[0004991a] d282                      add.l      d2,d1
[0004991c] e789                      lsl.l      #3,d1
[0004991e] 206f 0022                 movea.l    34(a7),a0
[00049922] d1c1                      adda.l     d1,a0
[00049924] 246f 0032                 movea.l    50(a7),a2
[00049928] 246a 0008                 movea.l    8(a2),a2
[0004992c] 4e92                      jsr        (a2)
[0004992e] 4a40                      tst.w      d0
[00049930] 6604                      bne.s      Adr_drag_52
Adr_drag_51:
[00049932] 42af 0032                 clr.l      50(a7)
Adr_drag_52:
[00049936] 6004                      bra.s      Adr_drag_53
Adr_drag_50:
[00049938] 42af 0032                 clr.l      50(a7)
Adr_drag_53:
[0004993c] 6004                      bra.s      Adr_drag_54
Adr_drag_46:
[0004993e] 42af 0032                 clr.l      50(a7)
Adr_drag_54:
[00049942] 6004                      bra.s      Adr_drag_44
Adr_drag_45:
[00049944] 42af 0032                 clr.l      50(a7)
Adr_drag_44:
[00049948] 206f 002a                 movea.l    42(a7),a0
[0004994c] 226f 0022                 movea.l    34(a7),a1
[00049950] b3e8 0014                 cmpa.l     20(a0),a1
[00049954] 670e                      beq.s      Adr_drag_55
[00049956] 206f 002a                 movea.l    42(a7),a0
[0004995a] 226f 0022                 movea.l    34(a7),a1
[0004995e] b3e8 0018                 cmpa.l     24(a0),a1
[00049962] 6650                      bne.s      Adr_drag_56
Adr_drag_55:
[00049964] 322f 0046                 move.w     70(a7),d1
[00049968] c27c 0fff                 and.w      #$0FFF,d1
[0004996c] 48c1                      ext.l      d1
[0004996e] 2001                      move.l     d1,d0
[00049970] d080                      add.l      d0,d0
[00049972] d081                      add.l      d1,d0
[00049974] e788                      lsl.l      #3,d0
[00049976] 206f 0022                 movea.l    34(a7),a0
[0004997a] 3030 0808                 move.w     8(a0,d0.l),d0
[0004997e] c07c 0800                 and.w      #$0800,d0
[00049982] 6630                      bne.s      Adr_drag_56
[00049984] 342f 0046                 move.w     70(a7),d2
[00049988] c47c 0fff                 and.w      #$0FFF,d2
[0004998c] 48c2                      ext.l      d2
[0004998e] 2002                      move.l     d2,d0
[00049990] d080                      add.l      d0,d0
[00049992] d082                      add.l      d2,d0
[00049994] e788                      lsl.l      #3,d0
[00049996] 206f 0022                 movea.l    34(a7),a0
[0004999a] 3230 080a                 move.w     10(a0,d0.l),d1
[0004999e] c27c fffe                 and.w      #$FFFE,d1
[000499a2] 302f 0046                 move.w     70(a7),d0
[000499a6] 206f 002a                 movea.l    42(a7),a0
[000499aa] 226f 002a                 movea.l    42(a7),a1
[000499ae] 2269 0066                 movea.l    102(a1),a1
[000499b2] 4e91                      jsr        (a1)
Adr_drag_56:
[000499b4] 202f 0032                 move.l     50(a7),d0
[000499b8] 6726                      beq.s      Adr_drag_57
[000499ba] 93c9                      suba.l     a1,a1
[000499bc] 7005                      moveq.l    #5,d0
[000499be] 342f 0046                 move.w     70(a7),d2
[000499c2] c47c 0fff                 and.w      #$0FFF,d2
[000499c6] 48c2                      ext.l      d2
[000499c8] 2202                      move.l     d2,d1
[000499ca] d281                      add.l      d1,d1
[000499cc] d282                      add.l      d2,d1
[000499ce] e789                      lsl.l      #3,d1
[000499d0] 206f 0022                 movea.l    34(a7),a0
[000499d4] d1c1                      adda.l     d1,a0
[000499d6] 246f 0032                 movea.l    50(a7),a2
[000499da] 246a 0008                 movea.l    8(a2),a2
[000499de] 4e92                      jsr        (a2)
Adr_drag_57:
[000499e0] 4eb9 0005 0c80            jsr        Aev_release
[000499e6] 6000 07ec                 bra        Adr_drag_58
Adr_drag_40:
[000499ea] 302f 0042                 move.w     66(a7),d0
[000499ee] 6700 07e4                 beq        Adr_drag_58
[000499f2] 3f7c ffff 0040            move.w     #$FFFF,64(a7)
[000499f8] 2f39 000e 692a            move.l     _globl,-(a7)
[000499fe] 42a7                      clr.l      -(a7)
[00049a00] 42a7                      clr.l      -(a7)
[00049a02] 93c9                      suba.l     a1,a1
[00049a04] 41ef 0058                 lea.l      88(a7),a0
[00049a08] 700b                      moveq.l    #11,d0
[00049a0a] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[00049a10] 4fef 000c                 lea.l      12(a7),a7
[00049a14] 4a40                      tst.w      d0
[00049a16] 672c                      beq.s      Adr_drag_59
[00049a18] 7010                      moveq.l    #16,d0
[00049a1a] c06f 004c                 and.w      76(a7),d0
[00049a1e] 6724                      beq.s      Adr_drag_59
[00049a20] 42a7                      clr.l      -(a7)
[00049a22] 42a7                      clr.l      -(a7)
[00049a24] 42a7                      clr.l      -(a7)
[00049a26] 486f 004c                 pea.l      76(a7)
[00049a2a] 7214                      moveq.l    #20,d1
[00049a2c] 302f 0054                 move.w     84(a7),d0
[00049a30] 4eb9 0007 f7ba            jsr        wind_get
[00049a36] 4fef 0010                 lea.l      16(a7),a7
[00049a3a] 4a40                      tst.w      d0
[00049a3c] 6606                      bne.s      Adr_drag_59
[00049a3e] 3f7c ffff 0040            move.w     #$FFFF,64(a7)
Adr_drag_59:
[00049a44] 302f 0040                 move.w     64(a7),d0
[00049a48] 6a00 00c2                 bpl        Adr_drag_60
[00049a4c] 426f 004e                 clr.w      78(a7)
[00049a50] 426f 004c                 clr.w      76(a7)
[00049a54] 422f 007e                 clr.b      126(a7)
[00049a58] 41ef 007e                 lea.l      126(a7),a0
[00049a5c] 2f48 0186                 move.l     a0,390(a7)
[00049a60] 42af 018a                 clr.l      394(a7)
[00049a64] 487a f5fe                 pea.l      addDD2Popup(pc)
[00049a68] 42a7                      clr.l      -(a7)
[00049a6a] 43ef 018e                 lea.l      398(a7),a1
[00049a6e] 2079 000d fbaa            movea.l    ListOfApps,a0
[00049a74] 2479 000d fbaa            movea.l    ListOfApps,a2
[00049a7a] 246a 0040                 movea.l    64(a2),a2
[00049a7e] 4e92                      jsr        (a2)
[00049a80] 504f                      addq.w     #8,a7
[00049a82] 3f6f 018c 004c            move.w     396(a7),76(a7)
[00049a88] 41ef 007e                 lea.l      126(a7),a0
[00049a8c] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00049a92] 4a40                      tst.w      d0
[00049a94] 6676                      bne.s      Adr_drag_60
[00049a96] 41ef 007e                 lea.l      126(a7),a0
[00049a9a] 4eb9 0008 2f6c            jsr        strlen
[00049aa0] 4237 007d                 clr.b      125(a7,d0.w)
[00049aa4] 41ef 007e                 lea.l      126(a7),a0
[00049aa8] 2f48 007a                 move.l     a0,122(a7)
[00049aac] 2f2f 007a                 move.l     122(a7),-(a7)
[00049ab0] 74ff                      moveq.l    #-1,d2
[00049ab2] 72ff                      moveq.l    #-1,d1
[00049ab4] 7003                      moveq.l    #3,d0
[00049ab6] d06f 0050                 add.w      80(a7),d0
[00049aba] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049ac0] c1e8 0012                 muls.w     18(a0),d0
[00049ac4] 43ef 0082                 lea.l      130(a7),a1
[00049ac8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049ace] 2068 0258                 movea.l    600(a0),a0
[00049ad2] 4eb9 0006 7b6c            jsr        Ame_strpopup
[00049ad8] 584f                      addq.w     #4,a7
[00049ada] 2f48 007a                 move.l     a0,122(a7)
[00049ade] 202f 007a                 move.l     122(a7),d0
[00049ae2] 6728                      beq.s      Adr_drag_60
[00049ae4] 487a f600                 pea.l      DDCmpName(pc)
[00049ae8] 226f 007e                 movea.l    126(a7),a1
[00049aec] 2079 000d fbaa            movea.l    ListOfApps,a0
[00049af2] 2479 000d fbaa            movea.l    ListOfApps,a2
[00049af8] 246a 0020                 movea.l    32(a2),a2
[00049afc] 4e92                      jsr        (a2)
[00049afe] 584f                      addq.w     #4,a7
[00049b00] 2f48 017e                 move.l     a0,382(a7)
[00049b04] 206f 017e                 movea.l    382(a7),a0
[00049b08] 3f50 0040                 move.w     (a0),64(a7)
Adr_drag_60:
[00049b0c] 302f 0040                 move.w     64(a7),d0
[00049b10] 6b00 06a2                 bmi        Adr_drag_61
[00049b14] 41f9 000e 06f6            lea.l      $000E06F6,a0
[00049b1a] 43ef 0212                 lea.l      530(a7),a1
[00049b1e] 700f                      moveq.l    #15,d0
[00049b20] 12d8                      move.b     (a0)+,(a1)+
Adr_drag_62:
[00049b22] 51c8 fffc                 dbf        d0,Adr_drag_62
[00049b26] 42af 020a                 clr.l      522(a7)
[00049b2a] 41f9 000e 0706            lea.l      $000E0706,a0
[00049b30] 43ef 01f4                 lea.l      500(a7),a1
[00049b34] 7013                      moveq.l    #19,d0
[00049b36] 12d8                      move.b     (a0)+,(a1)+
Adr_drag_63:
[00049b38] 51c8 fffc                 dbf        d0,Adr_drag_63
[00049b3c] 42af 01be                 clr.l      446(a7)
[00049b40] 42af 01ba                 clr.l      442(a7)
[00049b44] 4eb9 0008 0bd2            jsr        Dgetdrv
[00049b4a] 4eb9 0008 0c48            jsr        Dsetdrv
[00049b50] c0bc 0010 0000            and.l      #$00100000,d0
[00049b56] 6700 031a                 beq        Adr_drag_64
[00049b5a] 43ef 0186                 lea.l      390(a7),a1
[00049b5e] 41f9 000e 071c            lea.l      $000E071C,a0
[00049b64] 4240                      clr.w      d0
[00049b66] 4eb9 0008 0d74            jsr        Fxattr
[00049b6c] 4a80                      tst.l      d0
[00049b6e] 6600 0302                 bne        Adr_drag_64
[00049b72] 522f 0206                 addq.b     #1,518(a7)
Adr_drag_68:
[00049b76] 0c2f 005a 0206            cmpi.b     #$5A,518(a7)
[00049b7c] 6f16                      ble.s      Adr_drag_65
[00049b7e] 522f 0205                 addq.b     #1,517(a7)
[00049b82] 0c2f 005a 0205            cmpi.b     #$5A,517(a7)
[00049b88] 6f04                      ble.s      Adr_drag_66
[00049b8a] 601e                      bra.s      Adr_drag_67
[00049b8c] 6006                      bra.s      Adr_drag_65
Adr_drag_66:
[00049b8e] 1f7c 0041 0206            move.b     #$41,518(a7)
Adr_drag_65:
[00049b94] 7002                      moveq.l    #2,d0
[00049b96] 41ef 01f4                 lea.l      500(a7),a0
[00049b9a] 4eb9 0008 0c8e            jsr        Fcreate
[00049ba0] 2f40 01ca                 move.l     d0,458(a7)
[00049ba4] 202f 01ca                 move.l     458(a7),d0
[00049ba8] 6bc8                      bmi.s      Adr_drag_68
Adr_drag_67:
[00049baa] 202f 01ca                 move.l     458(a7),d0
[00049bae] 6b00 02be                 bmi        Adr_drag_69
[00049bb2] 4240                      clr.w      d0
[00049bb4] 4eb9 0005 ae7e            jsr        Awi_update
[00049bba] 3f7c 003f 0212            move.w     #$003F,530(a7)
[00049bc0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049bc6] 3f50 0214                 move.w     (a0),532(a7)
[00049bca] 3f6f 0044 0218            move.w     68(a7),536(a7)
[00049bd0] 3f6f 005c 021a            move.w     92(a7),538(a7)
[00049bd6] 3f6f 005a 021c            move.w     90(a7),540(a7)
[00049bdc] 3f6f 0050 021e            move.w     80(a7),542(a7)
[00049be2] 102f 0205                 move.b     517(a7),d0
[00049be6] 4880                      ext.w      d0
[00049be8] e148                      lsl.w      #8,d0
[00049bea] 122f 0206                 move.b     518(a7),d1
[00049bee] 4881                      ext.w      d1
[00049bf0] 8041                      or.w       d1,d0
[00049bf2] 3f40 0220                 move.w     d0,544(a7)
[00049bf6] 2279 000e 692a            movea.l    _globl,a1
[00049bfc] 41ef 0212                 lea.l      530(a7),a0
[00049c00] 7210                      moveq.l    #16,d1
[00049c02] 302f 0040                 move.w     64(a7),d0
[00049c06] 4eb9 0007 8ae8            jsr        mt_appl_write
[00049c0c] 4a40                      tst.w      d0
[00049c0e] 6700 024c                 beq        Adr_drag_70
[00049c12] 7001                      moveq.l    #1,d0
[00049c14] 122f 01cd                 move.b     461(a7),d1
[00049c18] e3a8                      lsl.l      d1,d0
[00049c1a] 2f40 01c6                 move.l     d0,454(a7)
[00049c1e] 42a7                      clr.l      -(a7)
[00049c20] 93c9                      suba.l     a1,a1
[00049c22] 41ef 01ca                 lea.l      458(a7),a0
[00049c26] 303c 0bb8                 move.w     #$0BB8,d0
[00049c2a] 4eb9 0008 0d14            jsr        Fselect
[00049c30] 584f                      addq.w     #4,a7
[00049c32] 4a40                      tst.w      d0
[00049c34] 6700 0226                 beq        Adr_drag_70
[00049c38] 202f 01c6                 move.l     454(a7),d0
[00049c3c] 6700 021e                 beq        Adr_drag_70
[00049c40] 41ef 0208                 lea.l      520(a7),a0
[00049c44] 7201                      moveq.l    #1,d1
[00049c46] 302f 01cc                 move.w     460(a7),d0
[00049c4a] 4eb9 0008 0cd2            jsr        Fread
[00049c50] 7201                      moveq.l    #1,d1
[00049c52] b280                      cmp.l      d0,d1
[00049c54] 6600 0206                 bne        Adr_drag_70
[00049c58] 102f 0208                 move.b     520(a7),d0
[00049c5c] 6600 01fe                 bne        Adr_drag_70
[00049c60] 41ef 01d2                 lea.l      466(a7),a0
[00049c64] 7220                      moveq.l    #32,d1
[00049c66] 302f 01cc                 move.w     460(a7),d0
[00049c6a] 4eb9 0008 0cd2            jsr        Fread
[00049c70] 7220                      moveq.l    #32,d1
[00049c72] b280                      cmp.l      d0,d1
[00049c74] 6600 01e6                 bne        Adr_drag_70
[00049c78] 207c 0000 0001            movea.l    #$00000001,a0
[00049c7e] 700d                      moveq.l    #13,d0
[00049c80] 4eb9 0008 0e00            jsr        Psignal
[00049c86] 2f40 01c2                 move.l     d0,450(a7)
[00049c8a] 6100 e192                 bsr        Adr_start
[00049c8e] 6100 e19a                 bsr        Adr_next
[00049c92] 3f40 0048                 move.w     d0,72(a7)
[00049c96] 6f00 01b8                 ble        Adr_drag_71
[00049c9a] 302f 0048                 move.w     72(a7),d0
[00049c9e] c07c 1000                 and.w      #$1000,d0
[00049ca2] 672a                      beq.s      Adr_drag_72
[00049ca4] 322f 0048                 move.w     72(a7),d1
[00049ca8] c27c 0fff                 and.w      #$0FFF,d1
[00049cac] 48c1                      ext.l      d1
[00049cae] 2001                      move.l     d1,d0
[00049cb0] d080                      add.l      d0,d0
[00049cb2] d081                      add.l      d1,d0
[00049cb4] e788                      lsl.l      #3,d0
[00049cb6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049cbc] 2068 0240                 movea.l    576(a0),a0
[00049cc0] 2068 0018                 movea.l    24(a0),a0
[00049cc4] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00049cc8] 2f48 0076                 move.l     a0,118(a7)
[00049ccc] 6024                      bra.s      Adr_drag_73
Adr_drag_72:
[00049cce] 322f 0048                 move.w     72(a7),d1
[00049cd2] 48c1                      ext.l      d1
[00049cd4] 2001                      move.l     d1,d0
[00049cd6] d080                      add.l      d0,d0
[00049cd8] d081                      add.l      d1,d0
[00049cda] e788                      lsl.l      #3,d0
[00049cdc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049ce2] 2068 0240                 movea.l    576(a0),a0
[00049ce6] 2068 0014                 movea.l    20(a0),a0
[00049cea] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00049cee] 2f48 0076                 move.l     a0,118(a7)
Adr_drag_73:
[00049cf2] 206f 0076                 movea.l    118(a7),a0
[00049cf6] 3028 0016                 move.w     22(a0),d0
[00049cfa] 907c 000b                 sub.w      #$000B,d0
[00049cfe] 670e                      beq.s      Adr_drag_74
[00049d00] 907c 0009                 sub.w      #$0009,d0
[00049d04] 671a                      beq.s      Adr_drag_75
[00049d06] 907c 000b                 sub.w      #$000B,d0
[00049d0a] 6702                      beq.s      Adr_drag_74
[00049d0c] 6024                      bra.s      Adr_drag_76
Adr_drag_74:
[00049d0e] 43f9 000e 0724            lea.l      $000E0724,a1
[00049d14] 41ef 01d2                 lea.l      466(a7),a0
[00049d18] 4eb9 0008 2f0c            jsr        strcpy
[00049d1e] 6034                      bra.s      Adr_drag_77
Adr_drag_75:
[00049d20] 43f9 000e 072f            lea.l      $000E072F,a1
[00049d26] 41ef 01d2                 lea.l      466(a7),a0
[00049d2a] 4eb9 0008 2f0c            jsr        strcpy
[00049d30] 6022                      bra.s      Adr_drag_77
Adr_drag_76:
[00049d32] 206f 01c2                 movea.l    450(a7),a0
[00049d36] 700d                      moveq.l    #13,d0
[00049d38] 4eb9 0008 0e00            jsr        Psignal
[00049d3e] 302f 01cc                 move.w     460(a7),d0
[00049d42] 4eb9 0008 0c7e            jsr        Fclose
[00049d48] 7001                      moveq.l    #1,d0
[00049d4a] 4eb9 0005 ae7e            jsr        Awi_update
[00049d50] 6000 0120                 bra        Adr_drag_64
Adr_drag_77:
[00049d54] 3f7c 000a 020e            move.w     #$000A,526(a7)
[00049d5a] 206f 0076                 movea.l    118(a7),a0
[00049d5e] 2068 000c                 movea.l    12(a0),a0
[00049d62] 4eb9 0008 2f6c            jsr        strlen
[00049d68] 2f40 01ce                 move.l     d0,462(a7)
[00049d6c] 202f 01ce                 move.l     462(a7),d0
[00049d70] 7218                      moveq.l    #24,d1
[00049d72] e2a0                      asr.l      d1,d0
[00049d74] c03c ffff                 and.b      #$FF,d0
[00049d78] 1f40 01d6                 move.b     d0,470(a7)
[00049d7c] 202f 01ce                 move.l     462(a7),d0
[00049d80] 7210                      moveq.l    #16,d1
[00049d82] e2a0                      asr.l      d1,d0
[00049d84] c03c ffff                 and.b      #$FF,d0
[00049d88] 1f40 01d7                 move.b     d0,471(a7)
[00049d8c] 202f 01ce                 move.l     462(a7),d0
[00049d90] e080                      asr.l      #8,d0
[00049d92] c03c ffff                 and.b      #$FF,d0
[00049d96] 1f40 01d8                 move.b     d0,472(a7)
[00049d9a] 70ff                      moveq.l    #-1,d0
[00049d9c] c02f 01d1                 and.b      465(a7),d0
[00049da0] 1f40 01d9                 move.b     d0,473(a7)
[00049da4] 41ef 020e                 lea.l      526(a7),a0
[00049da8] 7202                      moveq.l    #2,d1
[00049daa] 302f 01cc                 move.w     460(a7),d0
[00049dae] 4eb9 0008 0d5e            jsr        Fwrite
[00049db4] 7202                      moveq.l    #2,d1
[00049db6] b280                      cmp.l      d0,d1
[00049db8] 6600 0096                 bne        Adr_drag_71
[00049dbc] 41ef 01d2                 lea.l      466(a7),a0
[00049dc0] 720a                      moveq.l    #10,d1
[00049dc2] 302f 01cc                 move.w     460(a7),d0
[00049dc6] 4eb9 0008 0d5e            jsr        Fwrite
[00049dcc] 720a                      moveq.l    #10,d1
[00049dce] b280                      cmp.l      d0,d1
[00049dd0] 6600 007e                 bne.w      Adr_drag_71
[00049dd4] 2079 000e 692a            movea.l    _globl,a0
[00049dda] 700a                      moveq.l    #10,d0
[00049ddc] 4eb9 0007 91d4            jsr        mt_evnt_timer
[00049de2] 4a40                      tst.w      d0
[00049de4] 676a                      beq.s      Adr_drag_71
[00049de6] 41ef 0208                 lea.l      520(a7),a0
[00049dea] 7201                      moveq.l    #1,d1
[00049dec] 302f 01cc                 move.w     460(a7),d0
[00049df0] 4eb9 0008 0cd2            jsr        Fread
[00049df6] 7201                      moveq.l    #1,d1
[00049df8] b280                      cmp.l      d0,d1
[00049dfa] 6654                      bne.s      Adr_drag_71
[00049dfc] 102f 0208                 move.b     520(a7),d0
[00049e00] 664e                      bne.s      Adr_drag_71
[00049e02] 206f 0076                 movea.l    118(a7),a0
[00049e06] 2068 000c                 movea.l    12(a0),a0
[00049e0a] 2f08                      move.l     a0,-(a7)
[00049e0c] 206f 007a                 movea.l    122(a7),a0
[00049e10] 2068 000c                 movea.l    12(a0),a0
[00049e14] 4eb9 0008 2f6c            jsr        strlen
[00049e1a] 2200                      move.l     d0,d1
[00049e1c] 302f 01d0                 move.w     464(a7),d0
[00049e20] 205f                      movea.l    (a7)+,a0
[00049e22] 4eb9 0008 0d5e            jsr        Fwrite
[00049e28] 222f 01ce                 move.l     462(a7),d1
[00049e2c] b280                      cmp.l      d0,d1
[00049e2e] 6720                      beq.s      Adr_drag_71
[00049e30] 206f 01c2                 movea.l    450(a7),a0
[00049e34] 700d                      moveq.l    #13,d0
[00049e36] 4eb9 0008 0e00            jsr        Psignal
[00049e3c] 302f 01cc                 move.w     460(a7),d0
[00049e40] 4eb9 0008 0c7e            jsr        Fclose
[00049e46] 7001                      moveq.l    #1,d0
[00049e48] 4eb9 0005 ae7e            jsr        Awi_update
[00049e4e] 6022                      bra.s      Adr_drag_64
Adr_drag_71:
[00049e50] 206f 01c2                 movea.l    450(a7),a0
[00049e54] 700d                      moveq.l    #13,d0
[00049e56] 4eb9 0008 0e00            jsr        Psignal
Adr_drag_70:
[00049e5c] 7001                      moveq.l    #1,d0
[00049e5e] 4eb9 0005 ae7e            jsr        Awi_update
[00049e64] 302f 01cc                 move.w     460(a7),d0
[00049e68] 4eb9 0008 0c7e            jsr        Fclose
Adr_drag_69:
[00049e6e] 6000 0342                 bra        Adr_drag_78
Adr_drag_64:
[00049e72] 6100 dfaa                 bsr        Adr_start
[00049e76] 6100 dfb2                 bsr        Adr_next
[00049e7a] 3f40 0048                 move.w     d0,72(a7)
[00049e7e] 6f00 0332                 ble        Adr_drag_78
[00049e82] 302f 0048                 move.w     72(a7),d0
[00049e86] c07c 1000                 and.w      #$1000,d0
[00049e8a] 672a                      beq.s      Adr_drag_79
[00049e8c] 322f 0048                 move.w     72(a7),d1
[00049e90] c27c 0fff                 and.w      #$0FFF,d1
[00049e94] 48c1                      ext.l      d1
[00049e96] 2001                      move.l     d1,d0
[00049e98] d080                      add.l      d0,d0
[00049e9a] d081                      add.l      d1,d0
[00049e9c] e788                      lsl.l      #3,d0
[00049e9e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049ea4] 2068 0240                 movea.l    576(a0),a0
[00049ea8] 2068 0018                 movea.l    24(a0),a0
[00049eac] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00049eb0] 2f48 0076                 move.l     a0,118(a7)
[00049eb4] 6024                      bra.s      Adr_drag_80
Adr_drag_79:
[00049eb6] 322f 0048                 move.w     72(a7),d1
[00049eba] 48c1                      ext.l      d1
[00049ebc] 2001                      move.l     d1,d0
[00049ebe] d080                      add.l      d0,d0
[00049ec0] d081                      add.l      d1,d0
[00049ec2] e788                      lsl.l      #3,d0
[00049ec4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00049eca] 2068 0240                 movea.l    576(a0),a0
[00049ece] 2068 0014                 movea.l    20(a0),a0
[00049ed2] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00049ed6] 2f48 0076                 move.l     a0,118(a7)
Adr_drag_80:
[00049eda] 206f 0076                 movea.l    118(a7),a0
[00049ede] 3028 0016                 move.w     22(a0),d0
[00049ee2] 907c 000a                 sub.w      #$000A,d0
[00049ee6] 6700 014c                 beq        Adr_drag_81
[00049eea] 5340                      subq.w     #1,d0
[00049eec] 6710                      beq.s      Adr_drag_82
[00049eee] 907c 0009                 sub.w      #$0009,d0
[00049ef2] 670a                      beq.s      Adr_drag_82
[00049ef4] 907c 000b                 sub.w      #$000B,d0
[00049ef8] 6704                      beq.s      Adr_drag_82
[00049efa] 6000 02ac                 bra        Adr_drag_83
Adr_drag_82:
[00049efe] 206f 0076                 movea.l    118(a7),a0
[00049f02] 2068 000c                 movea.l    12(a0),a0
[00049f06] 4eb9 0008 2f6c            jsr        strlen
[00049f0c] 5280                      addq.l     #1,d0
[00049f0e] 4eb9 0004 c95e            jsr        Ax_glmalloc
[00049f14] 2f48 020a                 move.l     a0,522(a7)
[00049f18] 202f 020a                 move.l     522(a7),d0
[00049f1c] 6700 0112                 beq        Adr_drag_84
[00049f20] 206f 0076                 movea.l    118(a7),a0
[00049f24] 2268 000c                 movea.l    12(a0),a1
[00049f28] 206f 020a                 movea.l    522(a7),a0
[00049f2c] 4eb9 0008 2f0c            jsr        strcpy
[00049f32] 7210                      moveq.l    #16,d1
[00049f34] 4240                      clr.w      d0
[00049f36] 41ef 0212                 lea.l      530(a7),a0
[00049f3a] 4eb9 0008 36ea            jsr        memset
[00049f40] 3f7c 0501 0212            move.w     #$0501,530(a7)
[00049f46] 202f 020a                 move.l     522(a7),d0
[00049f4a] 7210                      moveq.l    #16,d1
[00049f4c] e2a0                      asr.l      d1,d0
[00049f4e] 3f40 021a                 move.w     d0,538(a7)
[00049f52] 3f6f 020c 021c            move.w     524(a7),540(a7)
[00049f58] 4240                      clr.w      d0
[00049f5a] 4eb9 0005 ae7e            jsr        Awi_update
[00049f60] 4eb9 0004 b086            jsr        Aev_mess
[00049f66] 2279 000e 692a            movea.l    _globl,a1
[00049f6c] 41ef 0212                 lea.l      530(a7),a0
[00049f70] 7210                      moveq.l    #16,d1
[00049f72] 302f 0040                 move.w     64(a7),d0
[00049f76] 4eb9 0007 8ae8            jsr        mt_appl_write
[00049f7c] 7210                      moveq.l    #16,d1
[00049f7e] 4240                      clr.w      d0
[00049f80] 41ef 0212                 lea.l      530(a7),a0
[00049f84] 4eb9 0008 36ea            jsr        memset
[00049f8a] 2f39 000e 692a            move.l     _globl,-(a7)
[00049f90] 486f 0212                 pea.l      530(a7)
[00049f94] 486f 0216                 pea.l      534(a7)
[00049f98] 486f 021a                 pea.l      538(a7)
[00049f9c] 486f 021e                 pea.l      542(a7)
[00049fa0] 486f 0222                 pea.l      546(a7)
[00049fa4] 4878 07d0                 pea.l      ($000007D0).w
[00049fa8] 4267                      clr.w      -(a7)
[00049faa] 4267                      clr.w      -(a7)
[00049fac] 4267                      clr.w      -(a7)
[00049fae] 4267                      clr.w      -(a7)
[00049fb0] 4267                      clr.w      -(a7)
[00049fb2] 4267                      clr.w      -(a7)
[00049fb4] 4267                      clr.w      -(a7)
[00049fb6] 4267                      clr.w      -(a7)
[00049fb8] 4267                      clr.w      -(a7)
[00049fba] 4267                      clr.w      -(a7)
[00049fbc] 4267                      clr.w      -(a7)
[00049fbe] 43ef 0240                 lea.l      576(a7),a1
[00049fc2] 41ef 0244                 lea.l      580(a7),a0
[00049fc6] 4242                      clr.w      d2
[00049fc8] 4241                      clr.w      d1
[00049fca] 7030                      moveq.l    #48,d0
[00049fcc] 4eb9 0007 9240            jsr        mt_evnt_multi
[00049fd2] 4fef 0032                 lea.l      50(a7),a7
[00049fd6] 3f40 0210                 move.w     d0,528(a7)
[00049fda] 7010                      moveq.l    #16,d0
[00049fdc] c06f 0210                 and.w      528(a7),d0
[00049fe0] 673c                      beq.s      Adr_drag_85
[00049fe2] 0c6f 0500 0212            cmpi.w     #$0500,530(a7)
[00049fe8] 671c                      beq.s      Adr_drag_86
[00049fea] 2279 000e 692a            movea.l    _globl,a1
[00049ff0] 41ef 0212                 lea.l      530(a7),a0
[00049ff4] 7210                      moveq.l    #16,d1
[00049ff6] 2479 0010 ee4e            movea.l    ACSblk,a2
[00049ffc] 3012                      move.w     (a2),d0
[00049ffe] 4eb9 0007 8ae8            jsr        mt_appl_write
[0004a004] 6018                      bra.s      Adr_drag_85
Adr_drag_86:
[0004a006] 302f 0218                 move.w     536(a7),d0
[0004a00a] 6712                      beq.s      Adr_drag_85
[0004a00c] 302f 0048                 move.w     72(a7),d0
[0004a010] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a016] 2068 0240                 movea.l    576(a0),a0
[0004a01a] 6100 df5a                 bsr        Adr_del
Adr_drag_85:
[0004a01e] 7001                      moveq.l    #1,d0
[0004a020] 4eb9 0005 ae7e            jsr        Awi_update
[0004a026] 206f 020a                 movea.l    522(a7),a0
[0004a02a] 4eb9 0004 c9da            jsr        Ax_glfree
Adr_drag_84:
[0004a030] 6000 0176                 bra        Adr_drag_83
Adr_drag_81:
[0004a034] 486f 01ce                 pea.l      462(a7)
[0004a038] 43ef 01c2                 lea.l      450(a7),a1
[0004a03c] 206f 007a                 movea.l    122(a7),a0
[0004a040] 2068 000c                 movea.l    12(a0),a0
[0004a044] 4eb9 0005 4d96            jsr        Abp_mfdb2img
[0004a04a] 584f                      addq.w     #4,a7
[0004a04c] 4a40                      tst.w      d0
[0004a04e] 6600 0156                 bne        Adr_drag_87
[0004a052] 206f 01be                 movea.l    446(a7),a0
[0004a056] 3028 0002                 move.w     2(a0),d0
[0004a05a] d040                      add.w      d0,d0
[0004a05c] 48c0                      ext.l      d0
[0004a05e] d1af 01ce                 add.l      d0,462(a7)
[0004a062] 202f 01ce                 move.l     462(a7),d0
[0004a066] 4eb9 0004 c95e            jsr        Ax_glmalloc
[0004a06c] 2f48 01ba                 move.l     a0,442(a7)
[0004a070] 6700 012a                 beq        Adr_drag_88
[0004a074] 202f 01ce                 move.l     462(a7),d0
[0004a078] 226f 01be                 movea.l    446(a7),a1
[0004a07c] 206f 01ba                 movea.l    442(a7),a0
[0004a080] 4eb9 0008 3500            jsr        memcpy
[0004a086] 7210                      moveq.l    #16,d1
[0004a088] 4240                      clr.w      d0
[0004a08a] 41ef 0212                 lea.l      530(a7),a0
[0004a08e] 4eb9 0008 36ea            jsr        memset
[0004a094] 3f7c 0504 0212            move.w     #$0504,530(a7)
[0004a09a] 3f7c 0001 0218            move.w     #$0001,536(a7)
[0004a0a0] 202f 01ba                 move.l     442(a7),d0
[0004a0a4] 7210                      moveq.l    #16,d1
[0004a0a6] e2a0                      asr.l      d1,d0
[0004a0a8] 3f40 021a                 move.w     d0,538(a7)
[0004a0ac] 3f6f 01bc 021c            move.w     444(a7),540(a7)
[0004a0b2] 202f 01ce                 move.l     462(a7),d0
[0004a0b6] 7210                      moveq.l    #16,d1
[0004a0b8] e2a0                      asr.l      d1,d0
[0004a0ba] 3f40 021e                 move.w     d0,542(a7)
[0004a0be] 3f6f 01d0 0220            move.w     464(a7),544(a7)
[0004a0c4] 4240                      clr.w      d0
[0004a0c6] 4eb9 0005 ae7e            jsr        Awi_update
[0004a0cc] 4eb9 0004 b086            jsr        Aev_mess
[0004a0d2] 2279 000e 692a            movea.l    _globl,a1
[0004a0d8] 41ef 0212                 lea.l      530(a7),a0
[0004a0dc] 7210                      moveq.l    #16,d1
[0004a0de] 302f 0040                 move.w     64(a7),d0
[0004a0e2] 4eb9 0007 8ae8            jsr        mt_appl_write
[0004a0e8] 7210                      moveq.l    #16,d1
[0004a0ea] 4240                      clr.w      d0
[0004a0ec] 41ef 0212                 lea.l      530(a7),a0
[0004a0f0] 4eb9 0008 36ea            jsr        memset
[0004a0f6] 2f39 000e 692a            move.l     _globl,-(a7)
[0004a0fc] 486f 0212                 pea.l      530(a7)
[0004a100] 486f 0216                 pea.l      534(a7)
[0004a104] 486f 021a                 pea.l      538(a7)
[0004a108] 486f 021e                 pea.l      542(a7)
[0004a10c] 486f 0222                 pea.l      546(a7)
[0004a110] 4878 0bb8                 pea.l      ($00000BB8).w
[0004a114] 4267                      clr.w      -(a7)
[0004a116] 4267                      clr.w      -(a7)
[0004a118] 4267                      clr.w      -(a7)
[0004a11a] 4267                      clr.w      -(a7)
[0004a11c] 4267                      clr.w      -(a7)
[0004a11e] 4267                      clr.w      -(a7)
[0004a120] 4267                      clr.w      -(a7)
[0004a122] 4267                      clr.w      -(a7)
[0004a124] 4267                      clr.w      -(a7)
[0004a126] 4267                      clr.w      -(a7)
[0004a128] 4267                      clr.w      -(a7)
[0004a12a] 43ef 0240                 lea.l      576(a7),a1
[0004a12e] 41ef 0244                 lea.l      580(a7),a0
[0004a132] 4242                      clr.w      d2
[0004a134] 4241                      clr.w      d1
[0004a136] 7030                      moveq.l    #48,d0
[0004a138] 4eb9 0007 9240            jsr        mt_evnt_multi
[0004a13e] 4fef 0032                 lea.l      50(a7),a7
[0004a142] 3f40 0210                 move.w     d0,528(a7)
[0004a146] 7010                      moveq.l    #16,d0
[0004a148] c06f 0210                 and.w      528(a7),d0
[0004a14c] 673c                      beq.s      Adr_drag_89
[0004a14e] 0c6f 0500 0212            cmpi.w     #$0500,530(a7)
[0004a154] 671c                      beq.s      Adr_drag_90
[0004a156] 2279 000e 692a            movea.l    _globl,a1
[0004a15c] 41ef 0212                 lea.l      530(a7),a0
[0004a160] 7210                      moveq.l    #16,d1
[0004a162] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004a168] 3012                      move.w     (a2),d0
[0004a16a] 4eb9 0007 8ae8            jsr        mt_appl_write
[0004a170] 6018                      bra.s      Adr_drag_89
Adr_drag_90:
[0004a172] 302f 0218                 move.w     536(a7),d0
[0004a176] 6712                      beq.s      Adr_drag_89
[0004a178] 302f 0048                 move.w     72(a7),d0
[0004a17c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a182] 2068 0240                 movea.l    576(a0),a0
[0004a186] 6100 ddee                 bsr        Adr_del
Adr_drag_89:
[0004a18a] 7001                      moveq.l    #1,d0
[0004a18c] 4eb9 0005 ae7e            jsr        Awi_update
[0004a192] 206f 01ba                 movea.l    442(a7),a0
[0004a196] 4eb9 0004 c9da            jsr        Ax_glfree
Adr_drag_88:
[0004a19c] 206f 01be                 movea.l    446(a7),a0
[0004a1a0] 4eb9 0004 c7c8            jsr        Ax_free
Adr_drag_87:
[0004a1a6] 4e71                      nop
Adr_drag_83:
[0004a1a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a1ae] 4268 024a                 clr.w      586(a0)
Adr_drag_78:
[0004a1b2] 6020                      bra.s      Adr_drag_58
Adr_drag_61:
[0004a1b4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a1ba] 2f68 0240 002e            move.l     576(a0),46(a7)
[0004a1c0] 43ef 0044                 lea.l      68(a7),a1
[0004a1c4] 7013                      moveq.l    #19,d0
[0004a1c6] 206f 002e                 movea.l    46(a7),a0
[0004a1ca] 246f 002e                 movea.l    46(a7),a2
[0004a1ce] 246a 0004                 movea.l    4(a2),a2
[0004a1d2] 4e92                      jsr        (a2)
Adr_drag_58:
[0004a1d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a1da] 3028 024a                 move.w     586(a0),d0
[0004a1de] 6604                      bne.s      Adr_drag_91
[0004a1e0] 6000 010c                 bra        Adr_drag_3
Adr_drag_91:
[0004a1e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a1ea] 3028 0246                 move.w     582(a0),d0
[0004a1ee] 6604                      bne.s      Adr_drag_92
[0004a1f0] 6000 00fc                 bra        Adr_drag_3
Adr_drag_92:
[0004a1f4] 7002                      moveq.l    #2,d0
[0004a1f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a1fc] 2068 023c                 movea.l    572(a0),a0
[0004a200] c068 000e                 and.w      14(a0),d0
[0004a204] 6700 00e8                 beq        Adr_drag_3
[0004a208] 302f 0054                 move.w     84(a7),d0
[0004a20c] 6f06                      ble.s      Adr_drag_93
[0004a20e] 302f 0054                 move.w     84(a7),d0
[0004a212] 6006                      bra.s      Adr_drag_94
Adr_drag_93:
[0004a214] 302f 0054                 move.w     84(a7),d0
[0004a218] 4440                      neg.w      d0
Adr_drag_94:
[0004a21a] 3f00                      move.w     d0,-(a7)
[0004a21c] 302f 0054                 move.w     84(a7),d0
[0004a220] 6f06                      ble.s      Adr_drag_95
[0004a222] 302f 0054                 move.w     84(a7),d0
[0004a226] 6006                      bra.s      Adr_drag_96
Adr_drag_95:
[0004a228] 302f 0054                 move.w     84(a7),d0
[0004a22c] 4440                      neg.w      d0
Adr_drag_96:
[0004a22e] d05f                      add.w      (a7)+,d0
[0004a230] ea40                      asr.w      #5,d0
[0004a232] 3f40 0038                 move.w     d0,56(a7)
[0004a236] 426f 0036                 clr.w      54(a7)
[0004a23a] 6014                      bra.s      Adr_drag_97
[0004a23c] 302f 0038                 move.w     56(a7),d0
Adr_drag_98:
[0004a240] e240                      asr.w      #1,d0
[0004a242] d06f 0038                 add.w      56(a7),d0
[0004a246] e440                      asr.w      #2,d0
[0004a248] 3f40 0038                 move.w     d0,56(a7)
[0004a24c] 526f 0036                 addq.w     #1,54(a7)
Adr_drag_97:
[0004a250] 302f 0038                 move.w     56(a7),d0
[0004a254] 66e6                      bne.s      Adr_drag_98
[0004a256] 302f 0036                 move.w     54(a7),d0
[0004a25a] 6712                      beq.s      Adr_drag_99
[0004a25c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a262] 0c68 0008 0246            cmpi.w     #$0008,582(a0)
[0004a268] 6f04                      ble.s      Adr_drag_99
[0004a26a] 536f 0036                 subq.w     #1,54(a7)
Adr_drag_99:
[0004a26e] 302f 0036                 move.w     54(a7),d0
[0004a272] 6712                      beq.s      Adr_drag_100
[0004a274] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004a27a] 0c68 0014 0246            cmpi.w     #$0014,582(a0)
[0004a280] 6f04                      ble.s      Adr_drag_100
[0004a282] 536f 0036                 subq.w     #1,54(a7)
Adr_drag_100:
[0004a286] 426f 004c                 clr.w      76(a7)
[0004a28a] 6056                      bra.s      Adr_drag_101
[0004a28c] 4240                      clr.w      d0
Adr_drag_104:
[0004a28e] 3f40 005a                 move.w     d0,90(a7)
[0004a292] 3f40 005c                 move.w     d0,92(a7)
[0004a296] 7001                      moveq.l    #1,d0
[0004a298] 122f 0037                 move.b     55(a7),d1
[0004a29c] e368                      lsl.w      d1,d0
[0004a29e] 3f40 004e                 move.w     d0,78(a7)
[0004a2a2] 6038                      bra.s      Adr_drag_102
[0004a2a4] 302f 0054                 move.w     84(a7),d0
Adr_drag_103:
[0004a2a8] d16f 005c                 add.w      d0,92(a7)
[0004a2ac] 302f 0052                 move.w     82(a7),d0
[0004a2b0] d16f 005a                 add.w      d0,90(a7)
[0004a2b4] 322f 0052                 move.w     82(a7),d1
[0004a2b8] 302f 005a                 move.w     90(a7),d0
[0004a2bc] 142f 0037                 move.b     55(a7),d2
[0004a2c0] e460                      asr.w      d2,d0
[0004a2c2] 9240                      sub.w      d0,d1
[0004a2c4] 302f 0054                 move.w     84(a7),d0
[0004a2c8] 342f 005c                 move.w     92(a7),d2
[0004a2cc] 162f 0037                 move.b     55(a7),d3
[0004a2d0] e662                      asr.w      d3,d2
[0004a2d2] 9042                      sub.w      d2,d0
[0004a2d4] 6100 d800                 bsr        drag_draw
[0004a2d8] 536f 004e                 subq.w     #1,78(a7)
Adr_drag_102:
[0004a2dc] 302f 004e                 move.w     78(a7),d0
[0004a2e0] 6ec2                      bgt.s      Adr_drag_103
Adr_drag_101:
[0004a2e2] 302f 004c                 move.w     76(a7),d0
[0004a2e6] 526f 004c                 addq.w     #1,76(a7)
[0004a2ea] 5540                      subq.w     #2,d0
[0004a2ec] 6d9e                      blt.s      Adr_drag_104
Adr_drag_3:
[0004a2ee] 4fef 0222                 lea.l      546(a7),a7
[0004a2f2] 245f                      movea.l    (a7)+,a2
[0004a2f4] 361f                      move.w     (a7)+,d3
[0004a2f6] 4e75                      rts

	.data

[000e0706]                           dc.b 'U:\PIPE\DRAGDROP.AA',0
[000e071a]                           dc.w $7c00
[000e071c]                           dc.b 'U:\PIPE',0
[000e0724]                           dc.b '.TXT    ',0
[000e072d]                           dc.b $00
[000e072e]                           dc.b 0
[000e072f]                           dc.b 'ARGS    ',0
[000e0738]                           dc.w $0000
