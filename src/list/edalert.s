del_alert:
[00033faa] 48e7 003c                 movem.l    a2-a5,-(a7)
[00033fae] 2448                      movea.l    a0,a2
[00033fb0] 2649                      movea.l    a1,a3
[00033fb2] 006a 0001 0006            ori.w      #$0001,6(a2)
[00033fb8] 536b 0036                 subq.w     #1,54(a3)
[00033fbc] 302b 0036                 move.w     54(a3),d0
[00033fc0] 6e36                      bgt.s      del_alert_1
[00033fc2] 286b 0012                 movea.l    18(a3),a4
[00033fc6] 220c                      move.l     a4,d1
[00033fc8] 670c                      beq.s      del_alert_2
[00033fca] 2a6c 0004                 movea.l    4(a4),a5
[00033fce] 204c                      movea.l    a4,a0
[00033fd0] 7002                      moveq.l    #2,d0
[00033fd2] 93c9                      suba.l     a1,a1
[00033fd4] 4e95                      jsr        (a5)
del_alert_2:
[00033fd6] 224b                      movea.l    a3,a1
[00033fd8] 206a 0024                 movea.l    36(a2),a0
[00033fdc] 4eb9 0003 3420            jsr        del_entry
[00033fe2] 224b                      movea.l    a3,a1
[00033fe4] 204a                      movea.l    a2,a0
[00033fe6] 4eb9 0001 7f52            jsr        objfree
[00033fec] 224b                      movea.l    a3,a1
[00033fee] 7003                      moveq.l    #3,d0
[00033ff0] 204a                      movea.l    a2,a0
[00033ff2] 4eb9 0003 403c            jsr        serv_alert
del_alert_1:
[00033ff8] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00033ffc] 4e75                      rts

copy_alert:
[00033ffe] 48e7 0038                 movem.l    a2-a4,-(a7)
[00034002] 2448                      movea.l    a0,a2
[00034004] 2649                      movea.l    a1,a3
[00034006] 006a 0001 0006            ori.w      #$0001,6(a2)
[0003400c] 202b 000a                 move.l     10(a3),d0
[00034010] 4eb9 0001 7fae            jsr        objmalloc
[00034016] 2848                      movea.l    a0,a4
[00034018] 200c                      move.l     a4,d0
[0003401a] 6604                      bne.s      copy_alert_1
[0003401c] 91c8                      suba.l     a0,a0
[0003401e] 6016                      bra.s      copy_alert_2
copy_alert_1:
[00034020] 226b 0004                 movea.l    4(a3),a1
[00034024] 206c 0004                 movea.l    4(a4),a0
[00034028] 4eb9 0008 2f0c            jsr        strcpy
[0003402e] 296b 000e 000e            move.l     14(a3),14(a4)
[00034034] 204c                      movea.l    a4,a0
copy_alert_2:
[00034036] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003403a] 4e75                      rts

serv_alert:
[0003403c] 48e7 1e1e                 movem.l    d3-d6/a3-a6,-(a7)
[00034040] 4fef ff92                 lea.l      -110(a7),a7
[00034044] 2648                      movea.l    a0,a3
[00034046] 2f49 006a                 move.l     a1,106(a7)
[0003404a] 41f9 000c de2c            lea.l      $000CDE2C,a0
[00034050] 43ef 0028                 lea.l      40(a7),a1
[00034054] 720f                      moveq.l    #15,d1
[00034056] 22d8                      move.l     (a0)+,(a1)+
serv_alert_1:
[00034058] 51c9 fffc                 dbf        d1,serv_alert_1
[0003405c] 32d8                      move.w     (a0)+,(a1)+
[0003405e] 3200                      move.w     d0,d1
[00034060] 5341                      subq.w     #1,d1
[00034062] 6710                      beq.s      serv_alert_2
[00034064] 5341                      subq.w     #1,d1
[00034066] 6700 008e                 beq        serv_alert_3
[0003406a] 5341                      subq.w     #1,d1
[0003406c] 6700 01bc                 beq        serv_alert_4
[00034070] 6000 0240                 bra        serv_alert_5
serv_alert_2:
[00034074] 4243                      clr.w      d3
[00034076] 6074                      bra.s      serv_alert_6
[00034078] 206f 006a                 movea.l    106(a7),a0
serv_alert_7:
[0003407c] 2f68 0004 002c            move.l     4(a0),44(a7)
[00034082] 2028 000a                 move.l     10(a0),d0
[00034086] 2f40 0032                 move.l     d0,50(a7)
[0003408a] 2f40 0036                 move.l     d0,54(a7)
[0003408e] 43ef 0028                 lea.l      40(a7),a1
[00034092] 204b                      movea.l    a3,a0
[00034094] 6100 ff68                 bsr        copy_alert
[00034098] 2848                      movea.l    a0,a4
[0003409a] 200c                      move.l     a4,d0
[0003409c] 6700 0214                 beq        serv_alert_5
[000340a0] 3f03                      move.w     d3,-(a7)
[000340a2] 226f 006c                 movea.l    108(a7),a1
[000340a6] 4869 0016                 pea.l      22(a1)
[000340aa] 43f9 000c de6e            lea.l      $000CDE6E,a1
[000340b0] 41ec 0016                 lea.l      22(a4),a0
[000340b4] 4eb9 0008 15ac            jsr        sprintf
[000340ba] 5c4f                      addq.w     #6,a7
[000340bc] 42a7                      clr.l      -(a7)
[000340be] 486c 0016                 pea.l      22(a4)
[000340c2] 224c                      movea.l    a4,a1
[000340c4] 204b                      movea.l    a3,a0
[000340c6] 4eb9 0001 81c6            jsr        objname
[000340cc] 504f                      addq.w     #8,a7
[000340ce] 224c                      movea.l    a4,a1
[000340d0] 3003                      move.w     d3,d0
[000340d2] 48c0                      ext.l      d0
[000340d4] e588                      lsl.l      #2,d0
[000340d6] 41f3 0800                 lea.l      0(a3,d0.l),a0
[000340da] 2068 0202                 movea.l    514(a0),a0
[000340de] 4eb9 0003 33b4            jsr        add_entry
[000340e4] 5240                      addq.w     #1,d0
[000340e6] 6700 01ca                 beq        serv_alert_5
[000340ea] 5243                      addq.w     #1,d3
serv_alert_6:
[000340ec] b67c 0003                 cmp.w      #$0003,d3
[000340f0] 6d86                      blt.s      serv_alert_7
[000340f2] 6000 01c2                 bra        serv_alert_8
serv_alert_3:
[000340f6] 206b 0024                 movea.l    36(a3),a0
[000340fa] 2828 000e                 move.l     14(a0),d4
[000340fe] e48c                      lsr.l      #2,d4
[00034100] 226b 0202                 movea.l    514(a3),a1
[00034104] 2a29 000e                 move.l     14(a1),d5
[00034108] e48d                      lsr.l      #2,d5
[0003410a] 2c49                      movea.l    a1,a6
[0003410c] 2f6e 0004 0024            move.l     4(a6),36(a7)
[00034112] 2f68 0004 0020            move.l     4(a0),32(a7)
[00034118] 4245                      clr.w      d5
[0003411a] 6014                      bra.s      serv_alert_9
[0003411c] 3005                      move.w     d5,d0
serv_alert_10:
[0003411e] 48c0                      ext.l      d0
[00034120] e588                      lsl.l      #2,d0
[00034122] 206f 0020                 movea.l    32(a7),a0
[00034126] 2270 0800                 movea.l    0(a0,d0.l),a1
[0003412a] 4229 0033                 clr.b      51(a1)
[0003412e] 5245                      addq.w     #1,d5
serv_alert_9:
[00034130] b845                      cmp.w      d5,d4
[00034132] 6ee8                      bgt.s      serv_alert_10
[00034134] 4246                      clr.w      d6
[00034136] 6000 0072                 bra.w      serv_alert_11
[0003413a] 4217                      clr.b      (a7)
serv_alert_19:
[0003413c] 701c                      moveq.l    #28,d0
[0003413e] 3206                      move.w     d6,d1
[00034140] 48c1                      ext.l      d1
[00034142] e589                      lsl.l      #2,d1
[00034144] 206f 0024                 movea.l    36(a7),a0
[00034148] 2270 1800                 movea.l    0(a0,d1.l),a1
[0003414c] 43e9 0016                 lea.l      22(a1),a1
[00034150] 41d7                      lea.l      (a7),a0
[00034152] 4eb9 0008 2f96            jsr        strncat
[00034158] 2a48                      movea.l    a0,a5
[0003415a] 7001                      moveq.l    #1,d0
serv_alert_14:
[0003415c] 41d7                      lea.l      (a7),a0
[0003415e] 4eb9 0008 2e8a            jsr        strchr
[00034164] 2a48                      movea.l    a0,a5
[00034166] 200d                      move.l     a5,d0
[00034168] 670a                      beq.s      serv_alert_12
[0003416a] 0c2d 0001 0002            cmpi.b     #$01,2(a5)
[00034170] 6602                      bne.s      serv_alert_12
[00034172] 4210                      clr.b      (a0)
serv_alert_12:
[00034174] 200d                      move.l     a5,d0
[00034176] 6704                      beq.s      serv_alert_13
[00034178] 1215                      move.b     (a5),d1
[0003417a] 66de                      bne.s      serv_alert_14
serv_alert_13:
[0003417c] 4243                      clr.w      d3
[0003417e] 6020                      bra.s      serv_alert_15
[00034180] 43d7                      lea.l      (a7),a1
serv_alert_17:
[00034182] 3003                      move.w     d3,d0
[00034184] 48c0                      ext.l      d0
[00034186] e588                      lsl.l      #2,d0
[00034188] 206f 0020                 movea.l    32(a7),a0
[0003418c] 2070 0800                 movea.l    0(a0,d0.l),a0
[00034190] 41e8 0016                 lea.l      22(a0),a0
[00034194] 4eb9 0008 2eba            jsr        strcmp
[0003419a] 4a40                      tst.w      d0
[0003419c] 6706                      beq.s      serv_alert_16
[0003419e] 5243                      addq.w     #1,d3
serv_alert_15:
[000341a0] b843                      cmp.w      d3,d4
[000341a2] 6edc                      bgt.s      serv_alert_17
serv_alert_16:
[000341a4] b843                      cmp.w      d3,d4
[000341a6] 6708                      beq.s      serv_alert_18
[000341a8] 5246                      addq.w     #1,d6
serv_alert_11:
[000341aa] ba46                      cmp.w      d6,d5
[000341ac] 6e00 ff8c                 bgt.w      serv_alert_19
serv_alert_18:
[000341b0] ba46                      cmp.w      d6,d5
[000341b2] 6f00 0102                 ble        serv_alert_8
[000341b6] 4243                      clr.w      d3
[000341b8] 6066                      bra.s      serv_alert_20
[000341ba] 3003                      move.w     d3,d0
serv_alert_21:
[000341bc] 48c0                      ext.l      d0
[000341be] e588                      lsl.l      #2,d0
[000341c0] 41f3 0800                 lea.l      0(a3,d0.l),a0
[000341c4] 2c68 0202                 movea.l    514(a0),a6
[000341c8] 2f6e 0004 0024            move.l     4(a6),36(a7)
[000341ce] 3206                      move.w     d6,d1
[000341d0] 48c1                      ext.l      d1
[000341d2] e589                      lsl.l      #2,d1
[000341d4] 226f 0024                 movea.l    36(a7),a1
[000341d8] 2a71 1800                 movea.l    0(a1,d1.l),a5
[000341dc] 3f03                      move.w     d3,-(a7)
[000341de] 206f 006c                 movea.l    108(a7),a0
[000341e2] 4868 0016                 pea.l      22(a0)
[000341e6] 43f9 000c de6e            lea.l      $000CDE6E,a1
[000341ec] 41ed 0016                 lea.l      22(a5),a0
[000341f0] 4eb9 0008 15ac            jsr        sprintf
[000341f6] 5c4f                      addq.w     #6,a7
[000341f8] 42a7                      clr.l      -(a7)
[000341fa] 486d 0016                 pea.l      22(a5)
[000341fe] 224d                      movea.l    a5,a1
[00034200] 204b                      movea.l    a3,a0
[00034202] 4eb9 0001 81c6            jsr        objname
[00034208] 504f                      addq.w     #8,a7
[0003420a] 224d                      movea.l    a5,a1
[0003420c] 204e                      movea.l    a6,a0
[0003420e] 4eb9 0003 3420            jsr        del_entry
[00034214] 224d                      movea.l    a5,a1
[00034216] 204e                      movea.l    a6,a0
[00034218] 4eb9 0003 33b4            jsr        add_entry
[0003421e] 5243                      addq.w     #1,d3
serv_alert_20:
[00034220] b67c 0003                 cmp.w      #$0003,d3
[00034224] 6d94                      blt.s      serv_alert_21
[00034226] 6000 008e                 bra        serv_alert_8
serv_alert_4:
[0003422a] 4243                      clr.w      d3
[0003422c] 6000 007a                 bra.w      serv_alert_22
[00034230] 3003                      move.w     d3,d0
serv_alert_27:
[00034232] 48c0                      ext.l      d0
[00034234] e588                      lsl.l      #2,d0
[00034236] 41f3 0800                 lea.l      0(a3,d0.l),a0
[0003423a] 2268 0202                 movea.l    514(a0),a1
[0003423e] 2a29 000e                 move.l     14(a1),d5
[00034242] e48d                      lsr.l      #2,d5
[00034244] 2c49                      movea.l    a1,a6
[00034246] 2f6e 0004 0024            move.l     4(a6),36(a7)
[0003424c] 3f03                      move.w     d3,-(a7)
[0003424e] 2a6f 006c                 movea.l    108(a7),a5
[00034252] 486d 0016                 pea.l      22(a5)
[00034256] 43f9 000c de6e            lea.l      $000CDE6E,a1
[0003425c] 41ef 0006                 lea.l      6(a7),a0
[00034260] 4eb9 0008 15ac            jsr        sprintf
[00034266] 5c4f                      addq.w     #6,a7
[00034268] 4246                      clr.w      d6
[0003426a] 6036                      bra.s      serv_alert_23
[0003426c] 3006                      move.w     d6,d0
serv_alert_26:
[0003426e] 48c0                      ext.l      d0
[00034270] e588                      lsl.l      #2,d0
[00034272] 206f 0024                 movea.l    36(a7),a0
[00034276] 2870 0800                 movea.l    0(a0,d0.l),a4
[0003427a] 43ec 0016                 lea.l      22(a4),a1
[0003427e] 41d7                      lea.l      (a7),a0
[00034280] 4eb9 0008 2eba            jsr        strcmp
[00034286] 4a40                      tst.w      d0
[00034288] 6616                      bne.s      serv_alert_24
[0003428a] 224c                      movea.l    a4,a1
[0003428c] 204e                      movea.l    a6,a0
[0003428e] 4eb9 0003 3420            jsr        del_entry
[00034294] 224c                      movea.l    a4,a1
[00034296] 204b                      movea.l    a3,a0
[00034298] 4eb9 0001 7f52            jsr        objfree
[0003429e] 6006                      bra.s      serv_alert_25
serv_alert_24:
[000342a0] 5246                      addq.w     #1,d6
serv_alert_23:
[000342a2] ba46                      cmp.w      d6,d5
[000342a4] 6ec6                      bgt.s      serv_alert_26
serv_alert_25:
[000342a6] 5243                      addq.w     #1,d3
serv_alert_22:
[000342a8] b67c 0003                 cmp.w      #$0003,d3
[000342ac] 6d00 ff82                 blt.w      serv_alert_27
[000342b0] 6004                      bra.s      serv_alert_8
serv_alert_5:
[000342b2] 4240                      clr.w      d0
[000342b4] 6002                      bra.s      serv_alert_28
serv_alert_8:
[000342b6] 7001                      moveq.l    #1,d0
serv_alert_28:
[000342b8] 4fef 006e                 lea.l      110(a7),a7
[000342bc] 4cdf 7878                 movem.l    (a7)+,d3-d6/a3-a6
[000342c0] 4e75                      rts

new_work:
[000342c2] 303c 271e                 move.w     #$271E,d0
[000342c6] 2279 000a d794            movea.l    $000AD794,a1
[000342cc] 4eb9 0003 3dd6            jsr        work_icon
[000342d2] 4e75                      rts

	.data

dither:
[000cdd38] 00064a22                  dc.l A_3Dbutton
[000cdd3c]                           dc.w $0000
[000cdd3e]                           dc.w $0078
[000cdd40] 000630f2                  dc.l Auo_string
[000cdd44]                           dc.w $0000
[000cdd46]                           dc.w $0000
[000cdd48]                           dc.w $0000
[000cdd4a]                           dc.w $0000
[000cdd4c]                           dc.w $0000
[000cdd4e]                           dc.w $0000
[000cdd50]                           dc.w $0000
[000cdd52]                           dc.w $0000
[000cdd54]                           dc.w $0000
[000cdd56]                           dc.w $0000
inner:
[000cdd58]                           dc.w $ffff
[000cdd5a]                           dc.w $ffff
[000cdd5c]                           dc.w $ffff
[000cdd5e]                           dc.w $0018
[000cdd60]                           dc.w $1800
[000cdd62]                           dc.w $0000
[000cdd64] 000cdd38                  dc.l dither
[000cdd68]                           dc.w $0000
[000cdd6a]                           dc.w $0000
[000cdd6c]                           dc.w $0064
[000cdd6e]                           dc.w $0064
pra00:
[000cdd70]                           dc.w $0000
[000cdd72]                           dc.w $0000
[000cdd74]                           dc.w $0000
[000cdd76]                           dc.w $0000
[000cdd78]                           dc.w $8000
[000cdd7a]                           dc.w $0000
[000cdd7c]                           dc.w $0000
[000cdd7e]                           dc.w $0000
[000cdd80]                           dc.w $0000
[000cdd82]                           dc.w $0000
[000cdd84]                           dc.w $0000
[000cdd86]                           dc.w $0000
proto:
[000cdd88]                           dc.w $0000
[000cdd8a]                           dc.w $ffff
[000cdd8c]                           dc.w $ffff
[000cdd8e]                           dc.w $001f
[000cdd90]                           dc.w $2005
[000cdd92]                           dc.w $0000
[000cdd94]                           dc.w $0000
[000cdd96]                           dc.w $0000
[000cdd98]                           dc.w $0008
[000cdd9a]                           dc.w $0008
[000cdd9c]                           dc.w $0048
[000cdd9e]                           dc.w $0028
pra02:
[000cdda0]                           dc.w $0000
[000cdda2]                           dc.w $0000
[000cdda4]                           dc.w $0000
[000cdda6]                           dc.w $0000
[000cdda8]                           dc.w $8000
[000cddaa]                           dc.w $0000
[000cddac]                           dc.w $0000
[000cddae]                           dc.w $0000
[000cddb0]                           dc.w $0000
[000cddb2]                           dc.w $0000
[000cddb4]                           dc.w $0000
[000cddb6]                           dc.w $0000
[000cddb8]                           dc.b '%li',0
[000cddbc]                           dc.w $2569
[000cddbe]                           dc.w $0000
protoalert:
[000cddc0]                           dc.w $0000
[000cddc2]                           dc.w $0000
[000cddc4] 000cce46                  dc.l proto_alert
[000cddc8]                           dc.w $0000
[000cddca]                           dc.w $0000
[000cddcc]                           dc.w $0014
[000cddce]                           dc.w $0000
[000cddd0]                           dc.w $0014
[000cddd2]                           dc.w $0000
[000cddd4]                           dc.w $0000
[000cddd6]                           dc.b 'ALERTBOX_01',0
[000cdde2]                           dc.w $0000
[000cdde4]                           dc.w $0000
[000cdde6]                           dc.w $0000
[000cdde8]                           dc.w $0000
[000cddea]                           dc.w $0000
[000cddec]                           dc.w $0000
[000cddee]                           dc.w $0000
[000cddf0]                           dc.w $0000
[000cddf2]                           dc.w $0000
[000cddf4]                           dc.w $0000
[000cddf6]                           dc.w $0001
[000cddf8]                           dc.w $0000
[000cddfa]                           dc.w $0000
[000cddfc]                           dc.w $0000
[000cddfe]                           dc.w $0000
[000cde00]                           dc.w $0000
list_alert:
[000cde02]                           dc.w $0000
[000cde04]                           dc.w $0000
[000cde06]                           dc.w $0000
[000cde08]                           dc.w $0000
[000cde0a] 000ad73a                  dc.l WI_ALERT
[000cde0e] 000ccfda                  dc.l al_list
[000cde12] 000ccfeb                  dc.l al_name
[000cde16]                           dc.w $271e
[000cde18] 000cddc0                  dc.l protoalert
[000cde1c] 00033ffe                  dc.l copy_alert
[000cde20] 00033faa                  dc.l del_alert
[000cde24] 000342c2                  dc.l new_work
[000cde28] 0003403c                  dc.l serv_alert
[000cde2c]                           dc.w $0000
[000cde2e]                           dc.w $0000
[000cde30]                           dc.w $0000
[000cde32]                           dc.w $0000
[000cde34]                           dc.w $0000
[000cde36]                           dc.w $0000
[000cde38]                           dc.w $0000
[000cde3a]                           dc.w $0000
[000cde3c]                           dc.w $0000
[000cde3e]                           dc.w $0000
[000cde40]                           dc.w $0000
[000cde42]                           dc.b '                               ',0
[000cde62]                           dc.w $0001
[000cde64]                           dc.w $0000
[000cde66]                           dc.w $0000
[000cde68]                           dc.w $0000
[000cde6a]                           dc.w $0000
[000cde6c]                           dc.w $0000
[000cde6e]                           dc.b '%.28s'
[000cde73]                           dc.b $01
[000cde74]                           dc.w $2564
[000cde76]                           dc.w $0100

