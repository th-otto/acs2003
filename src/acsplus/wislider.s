A_wislider:
[00037828] 70f6                      moveq.l    #-10,d0
[0003782a] 206f 0004                 movea.l    4(a7),a0
[0003782e] c068 0008                 and.w      8(a0),d0
[00037832] 4e75                      rts

Auo_wislider_13:
Auo_wislider:
[00037834] 48e7 1c38                 movem.l    d3-d5/a2-a4,-(a7)
[00037838] 594f                      subq.w     #4,a7
[0003783a] 2849                      movea.l    a1,a4
[0003783c] 2ea8 000c                 move.l     12(a0),(a7)
[00037840] 2057                      movea.l    (a7),a0
[00037842] 2668 000c                 movea.l    12(a0),a3
[00037846] 3200                      move.w     d0,d1
[00037848] b27c 000f                 cmp.w      #$000F,d1
[0003784c] 6700 02b2                 beq        Auo_wislider_1
[00037850] 6e30                      bgt.s      Auo_wislider_2
[00037852] b27c 000e                 cmp.w      #$000E,d1
[00037856] 6200 02b4                 bhi        Auo_wislider_3
[0003785a] d241                      add.w      d1,d1
[0003785c] 323b 1006                 move.w     $00037864(pc,d1.w),d1
[00037860] 4efb 1002                 jmp        $00037864(pc,d1.w)
J25:
[00037864] 02a8                      dc.w $02a8   ; Auo_wislider_3-J25
[00037866] 008a                      dc.w $008a   ; Auo_wislider_4-J25
[00037868] 00b8                      dc.w $00b8   ; Auo_wislider_5-J25
[0003786a] 02a8                      dc.w $02a8   ; Auo_wislider_3-J25
[0003786c] 02a8                      dc.w $02a8   ; Auo_wislider_3-J25
[0003786e] 00fc                      dc.w $00fc   ; Auo_wislider_6-J25
[00037870] 00fc                      dc.w $00fc   ; Auo_wislider_6-J25
[00037872] 02a8                      dc.w $02a8   ; Auo_wislider_3-J25
[00037874] 02a8                      dc.w $02a8   ; Auo_wislider_3-J25
[00037876] 00c4                      dc.w $00c4   ; Auo_wislider_7-J25
Auo_wislider_18:
[00037878] 026e                      dc.w $026e   ; Auo_wislider_8-J25
[0003787a] 0278                      dc.w $0278   ; Auo_wislider_9-J25
[0003787c] 0282                      dc.w $0282   ; Auo_wislider_10-J25
[0003787e] 028c                      dc.w $028c   ; Auo_wislider_11-J25
[00037880] 0296                      dc.w $0296   ; Auo_wislider_12-J25
Auo_wislider_2:
[00037882] b27c                      dc.w $b27c   ; Auo_wislider_13-J25
[00037884] 0066                      dc.w $0066   ; Auo_wislider_14-J25
[00037886] 6700                      dc.w $6700   ; Auo_wislider_15-J25
[00037888] 0238                      dc.w $0238   ; Auo_wislider_16-J25
[0003788a] 6e2e                      dc.w $6e2e   ; Auo_wislider_17-J25
[0003788c] b27c                      dc.w $b27c   ; Auo_wislider_13-J25
[0003788e] 0014                      dc.w $0014   ; Auo_wislider_18-J25
[00037890] 6700 027e                 beq        Auo_wislider_19
[00037894] 6e12                      bgt.s      Auo_wislider_20
[00037896] 927c 0011                 sub.w      #$0011,d1
[0003789a] 6700 0230                 beq        Auo_wislider_21
[0003789e] 5541                      subq.w     #2,d1
[000378a0] 6700 026e                 beq        Auo_wislider_19
[000378a4] 6000 0266                 bra        Auo_wislider_3
Auo_wislider_20:
[000378a8] 927c 0064                 sub.w      #$0064,d1
[000378ac] 6700 0208                 beq        Auo_wislider_22
[000378b0] 5341                      subq.w     #1,d1
[000378b2] 6700 0206                 beq        Auo_wislider_23
[000378b6] 6000 0254                 bra        Auo_wislider_3
[000378ba] 927c 0067                 sub.w      #$0067,d1
[000378be] 6700 01ea                 beq        Auo_wislider_24
[000378c2] 5541                      subq.w     #2,d1
[000378c4] 670e                      beq.s      Auo_wislider_25
[000378c6] 5341                      subq.w     #1,d1
[000378c8] 6768                      beq.s      Auo_wislider_26
Auo_wislider_14:
[000378ca] 5341                      subq.w     #1,d1
[000378cc] 6700 01f8                 beq        Auo_wislider_27
[000378d0] 6000 023a                 bra        Auo_wislider_3
Auo_wislider_25:
[000378d4] 202b 0014                 move.l     20(a3),d0
[000378d8] 6700 0236                 beq        Auo_wislider_19
[000378dc] 202b 0008                 move.l     8(a3),d0
[000378e0] 206b 0018                 movea.l    24(a3),a0
[000378e4] 226b 0014                 movea.l    20(a3),a1
[000378e8] 4e91                      jsr        (a1)
[000378ea] 6000 0224                 bra        Auo_wislider_19
Auo_wislider_4:
[000378ee] 701c                      moveq.l    #28,d0
[000378f0] 4eb9 0004 c608            jsr        Ax_malloc
[000378f6] 2648                      movea.l    a0,a3
[000378f8] 200b                      move.l     a3,d0
[000378fa] 6718                      beq.s      Auo_wislider_28
[000378fc] 43f9 000c f1ae            lea.l      proto,a1
[00037902] 701c                      moveq.l    #28,d0
[00037904] 4eb9 0008 3500            jsr        memcpy
[0003790a] 2057                      movea.l    (a7),a0
[0003790c] 214b 000c                 move.l     a3,12(a0)
[00037910] 6000 01fe                 bra        Auo_wislider_19
Auo_wislider_28:
[00037914] 38bc ffff                 move.w     #$FFFF,(a4)
[00037918] 6000 01f6                 bra        Auo_wislider_19
Auo_wislider_5:
[0003791c] 204b                      movea.l    a3,a0
[0003791e] 4eb9 0004 c7c8            jsr        Ax_free
[00037924] 6000 01ea                 bra        Auo_wislider_19
Auo_wislider_7:
[00037928] 204c                      movea.l    a4,a0
[0003792a] 2750 0010                 move.l     (a0),16(a3)
[0003792e] 6000 01e0                 bra        Auo_wislider_19
Auo_wislider_26:
[00037932] 3614                      move.w     (a4),d3
[00037934] 2813                      move.l     (a3),d4
[00037936] 98ab 0004                 sub.l      4(a3),d4
[0003793a] 4a84                      tst.l      d4
[0003793c] 6f00 01bc                 ble        Auo_wislider_12
[00037940] 3003                      move.w     d3,d0
[00037942] 48c0                      ext.l      d0
[00037944] 2204                      move.l     d4,d1
[00037946] 4eb9 0008 3cac            jsr        _lmul
[0003794c] 223c 0000 03e8            move.l     #$000003E8,d1
[00037952] 4eb9 0008 3cf6            jsr        _ldiv
[00037958] 2740 0008                 move.l     d0,8(a3)
[0003795c] 6000 01b2                 bra        Auo_wislider_19
Auo_wislider_6:
[00037960] 202b 0008                 move.l     8(a3),d0
[00037964] 6a04                      bpl.s      Auo_wislider_29
[00037966] 42ab 0008                 clr.l      8(a3)
Auo_wislider_29:
[0003796a] 2013                      move.l     (a3),d0
[0003796c] 90ab 0004                 sub.l      4(a3),d0
[00037970] b0ab 0008                 cmp.l      8(a3),d0
[00037974] 6c04                      bge.s      Auo_wislider_30
[00037976] 2740 0008                 move.l     d0,8(a3)
Auo_wislider_30:
[0003797a] 246b 0010                 movea.l    16(a3),a2
[0003797e] 3a2a 0020                 move.w     32(a2),d5
[00037982] 7001                      moveq.l    #1,d0
[00037984] 2057                      movea.l    (a7),a0
[00037986] c0a8 0004                 and.l      4(a0),d0
[0003798a] 6700 0090                 beq        Auo_wislider_31
[0003798e] 2813                      move.l     (a3),d4
[00037990] 98ab 0004                 sub.l      4(a3),d4
[00037994] 4a84                      tst.l      d4
[00037996] 6f1c                      ble.s      Auo_wislider_32
[00037998] 222b 0008                 move.l     8(a3),d1
[0003799c] 2001                      move.l     d1,d0
[0003799e] eb88                      lsl.l      #5,d0
[000379a0] 9081                      sub.l      d1,d0
[000379a2] e588                      lsl.l      #2,d0
[000379a4] d081                      add.l      d1,d0
[000379a6] e788                      lsl.l      #3,d0
[000379a8] 2204                      move.l     d4,d1
[000379aa] 4eb9 0008 3cf6            jsr        _ldiv
[000379b0] 2600                      move.l     d0,d3
[000379b2] 6002                      bra.s      Auo_wislider_33
Auo_wislider_32:
[000379b4] 4243                      clr.w      d3
Auo_wislider_33:
[000379b6] b66a 003e                 cmp.w      62(a2),d3
[000379ba] 671c                      beq.s      Auo_wislider_34
[000379bc] 3543 003e                 move.w     d3,62(a2)
[000379c0] 4a45                      tst.w      d5
[000379c2] 6f14                      ble.s      Auo_wislider_34
[000379c4] 4267                      clr.w      -(a7)
[000379c6] 4267                      clr.w      -(a7)
[000379c8] 4267                      clr.w      -(a7)
[000379ca] 3f03                      move.w     d3,-(a7)
[000379cc] 7209                      moveq.l    #9,d1
[000379ce] 3005                      move.w     d5,d0
[000379d0] 4eb9 0007 f926            jsr        wind_set
[000379d6] 504f                      addq.w     #8,a7
Auo_wislider_34:
[000379d8] 222b 0004                 move.l     4(a3),d1
[000379dc] 2001                      move.l     d1,d0
[000379de] eb88                      lsl.l      #5,d0
[000379e0] 9081                      sub.l      d1,d0
[000379e2] e588                      lsl.l      #2,d0
[000379e4] d081                      add.l      d1,d0
[000379e6] e788                      lsl.l      #3,d0
[000379e8] 2213                      move.l     (a3),d1
[000379ea] 4eb9 0008 3cf6            jsr        _ldiv
[000379f0] 2600                      move.l     d0,d3
[000379f2] b66a 0042                 cmp.w      66(a2),d3
[000379f6] 6700 0118                 beq        Auo_wislider_19
[000379fa] 3543 0042                 move.w     d3,66(a2)
[000379fe] 4a45                      tst.w      d5
[00037a00] 6f00 010e                 ble        Auo_wislider_19
[00037a04] 4267                      clr.w      -(a7)
[00037a06] 4267                      clr.w      -(a7)
[00037a08] 4267                      clr.w      -(a7)
[00037a0a] 3f03                      move.w     d3,-(a7)
[00037a0c] 7210                      moveq.l    #16,d1
[00037a0e] 3005                      move.w     d5,d0
[00037a10] 4eb9 0007 f926            jsr        wind_set
[00037a16] 504f                      addq.w     #8,a7
[00037a18] 6000 00f6                 bra        Auo_wislider_19
Auo_wislider_31:
[00037a1c] 222b 0004                 move.l     4(a3),d1
[00037a20] 2001                      move.l     d1,d0
[00037a22] eb88                      lsl.l      #5,d0
[00037a24] 9081                      sub.l      d1,d0
[00037a26] e588                      lsl.l      #2,d0
[00037a28] d081                      add.l      d1,d0
[00037a2a] e788                      lsl.l      #3,d0
[00037a2c] 2213                      move.l     (a3),d1
[00037a2e] 4eb9 0008 3cf6            jsr        _ldiv
[00037a34] 2600                      move.l     d0,d3
[00037a36] b66a 0040                 cmp.w      64(a2),d3
[00037a3a] 671c                      beq.s      Auo_wislider_35
[00037a3c] 3543 0040                 move.w     d3,64(a2)
[00037a40] 4a45                      tst.w      d5
[00037a42] 6f14                      ble.s      Auo_wislider_35
[00037a44] 4267                      clr.w      -(a7)
[00037a46] 4267                      clr.w      -(a7)
[00037a48] 4267                      clr.w      -(a7)
[00037a4a] 3f03                      move.w     d3,-(a7)
[00037a4c] 720f                      moveq.l    #15,d1
[00037a4e] 3005                      move.w     d5,d0
[00037a50] 4eb9 0007 f926            jsr        wind_set
[00037a56] 504f                      addq.w     #8,a7
Auo_wislider_35:
[00037a58] 2813                      move.l     (a3),d4
[00037a5a] 98ab 0004                 sub.l      4(a3),d4
[00037a5e] 4a84                      tst.l      d4
[00037a60] 6f1c                      ble.s      Auo_wislider_36
[00037a62] 222b 0008                 move.l     8(a3),d1
[00037a66] 2001                      move.l     d1,d0
[00037a68] eb88                      lsl.l      #5,d0
[00037a6a] 9081                      sub.l      d1,d0
[00037a6c] e588                      lsl.l      #2,d0
[00037a6e] d081                      add.l      d1,d0
[00037a70] e788                      lsl.l      #3,d0
[00037a72] 2204                      move.l     d4,d1
[00037a74] 4eb9 0008 3cf6            jsr        _ldiv
[00037a7a] 2600                      move.l     d0,d3
[00037a7c] 6002                      bra.s      Auo_wislider_37
Auo_wislider_36:
[00037a7e] 4243                      clr.w      d3
Auo_wislider_37:
[00037a80] b66a 003c                 cmp.w      60(a2),d3
[00037a84] 6700 008a                 beq        Auo_wislider_19
[00037a88] 3543 003c                 move.w     d3,60(a2)
[00037a8c] 4a45                      tst.w      d5
[00037a8e] 6f00 0080                 ble        Auo_wislider_19
[00037a92] 4267                      clr.w      -(a7)
[00037a94] 4267                      clr.w      -(a7)
[00037a96] 4267                      clr.w      -(a7)
[00037a98] 3f03                      move.w     d3,-(a7)
[00037a9a] 7208                      moveq.l    #8,d1
Auo_wislider_16:
[00037a9c] 3005                      move.w     d5,d0
[00037a9e] 4eb9 0007 f926            jsr        wind_set
[00037aa4] 504f                      addq.w     #8,a7
[00037aa6] 6000 0068                 bra.w      Auo_wislider_19
Auo_wislider_24:
[00037aaa] 2754 0014                 move.l     (a4),20(a3)
[00037aae] 276c 0004 0018            move.l     4(a4),24(a3)
[00037ab4] 605a                      bra.s      Auo_wislider_19
Auo_wislider_22:
[00037ab6] 2694                      move.l     (a4),(a3)
[00037ab8] 6056                      bra.s      Auo_wislider_19
Auo_wislider_23:
[00037aba] 2754 0004                 move.l     (a4),4(a3)
[00037abe] 6050                      bra.s      Auo_wislider_19
[00037ac0] 2754 000c                 move.l     (a4),12(a3)
[00037ac4] 604a                      bra.s      Auo_wislider_19
Auo_wislider_27:
[00037ac6] 28ab 0008                 move.l     8(a3),(a4)
[00037aca] 6044                      bra.s      Auo_wislider_19
Auo_wislider_21:
[00037acc] 2754 0008                 move.l     (a4),8(a3)
[00037ad0] 603e                      bra.s      Auo_wislider_19
Auo_wislider_8:
[00037ad2] 202b 000c                 move.l     12(a3),d0
[00037ad6] d1ab 0008                 add.l      d0,8(a3)
[00037ada] 6034                      bra.s      Auo_wislider_19
Auo_wislider_9:
[00037adc] 202b 000c                 move.l     12(a3),d0
[00037ae0] 91ab 0008                 sub.l      d0,8(a3)
[00037ae4] 602a                      bra.s      Auo_wislider_19
Auo_wislider_10:
[00037ae6] 202b 0004                 move.l     4(a3),d0
[00037aea] d1ab 0008                 add.l      d0,8(a3)
[00037aee] 6020                      bra.s      Auo_wislider_19
Auo_wislider_11:
[00037af0] 202b 0004                 move.l     4(a3),d0
[00037af4] 91ab 0008                 sub.l      d0,8(a3)
[00037af8] 6016                      bra.s      Auo_wislider_19
Auo_wislider_12:
[00037afa] 42ab 0008                 clr.l      8(a3)
[00037afe] 6010                      bra.s      Auo_wislider_19
Auo_wislider_1:
[00037b00] 2013                      move.l     (a3),d0
[00037b02] 90ab 0004                 sub.l      4(a3),d0
[00037b06] 2740 0008                 move.l     d0,8(a3)
[00037b0a] 6004                      bra.s      Auo_wislider_19
Auo_wislider_3:
[00037b0c] 4240                      clr.w      d0
[00037b0e] 6002                      bra.s      Auo_wislider_38
Auo_wislider_19:
[00037b10] 7001                      moveq.l    #1,d0
Auo_wislider_38:
[00037b12] 584f                      addq.w     #4,a7
[00037b14] 4cdf 1c38                 movem.l    (a7)+,d3-d5/a2-a4
[00037b18] 4e75                      rts
Auo_wislider_15:
Auo_wislider_17:

	.data

proto:
[000cf1ae]                           dc.w $0000
[000cf1b0]                           dc.w $0064
[000cf1b2]                           dc.w $0000
[000cf1b4]                           dc.w $000a
[000cf1b6]                           dc.w $0000
[000cf1b8]                           dc.w $0014
[000cf1ba]                           dc.w $0000
[000cf1bc]                           dc.w $0001
[000cf1be]                           dc.w $0000
[000cf1c0]                           dc.w $0000
[000cf1c2]                           dc.w $0000
[000cf1c4]                           dc.w $0000
[000cf1c6]                           dc.w $0000
[000cf1c8]                           dc.w $0000
