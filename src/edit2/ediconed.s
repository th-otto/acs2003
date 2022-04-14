edic_backcol:
[0001e064] 3f03                      move.w     d3,-(a7)
[0001e066] 2f0a                      move.l     a2,-(a7)
[0001e068] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e06e] 2268 025c                 movea.l    604(a0),a1
[0001e072] 2469 018c                 movea.l    396(a1),a2
[0001e076] 45ea 000c                 lea.l      12(a2),a2
[0001e07a] 700c                      moveq.l    #12,d0
[0001e07c] 3f00                      move.w     d0,-(a7)
[0001e07e] 740d                      moveq.l    #13,d2
[0001e080] 720a                      moveq.l    #10,d1
[0001e082] 3012                      move.w     (a2),d0
[0001e084] e040                      asr.w      #8,d0
[0001e086] c07c 000f                 and.w      #$000F,d0
[0001e08a] 4eb9 0003 0bde            jsr        oe_colsel
[0001e090] 544f                      addq.w     #2,a7
[0001e092] 3600                      move.w     d0,d3
[0001e094] 6b2a                      bmi.s      $0001E0C0
[0001e096] 3212                      move.w     (a2),d1
[0001e098] c27c f0ff                 and.w      #$F0FF,d1
[0001e09c] e148                      lsl.w      #8,d0
[0001e09e] 8240                      or.w       d0,d1
[0001e0a0] 3481                      move.w     d1,(a2)
[0001e0a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e0a8] 2068 0258                 movea.l    600(a0),a0
[0001e0ac] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e0b2] 2469 0258                 movea.l    600(a1),a2
[0001e0b6] 226a 0066                 movea.l    102(a2),a1
[0001e0ba] 700e                      moveq.l    #14,d0
[0001e0bc] 72ff                      moveq.l    #-1,d1
[0001e0be] 4e91                      jsr        (a1)
[0001e0c0] 245f                      movea.l    (a7)+,a2
[0001e0c2] 361f                      move.w     (a7)+,d3
[0001e0c4] 4e75                      rts
edic_frontcol:
[0001e0c6] 2f03                      move.l     d3,-(a7)
[0001e0c8] 2f0a                      move.l     a2,-(a7)
[0001e0ca] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e0d0] 2268 025c                 movea.l    604(a0),a1
[0001e0d4] 2469 018c                 movea.l    396(a1),a2
[0001e0d8] 45ea 000c                 lea.l      12(a2),a2
[0001e0dc] 7006                      moveq.l    #6,d0
[0001e0de] 3f00                      move.w     d0,-(a7)
[0001e0e0] 7407                      moveq.l    #7,d2
[0001e0e2] 7204                      moveq.l    #4,d1
[0001e0e4] 3012                      move.w     (a2),d0
[0001e0e6] 760c                      moveq.l    #12,d3
[0001e0e8] e660                      asr.w      d3,d0
[0001e0ea] c07c 000f                 and.w      #$000F,d0
[0001e0ee] 4eb9 0003 0bde            jsr        oe_colsel
[0001e0f4] 544f                      addq.w     #2,a7
[0001e0f6] 3600                      move.w     d0,d3
[0001e0f8] 6b2c                      bmi.s      $0001E126
[0001e0fa] 3212                      move.w     (a2),d1
[0001e0fc] c27c 0fff                 and.w      #$0FFF,d1
[0001e100] 740c                      moveq.l    #12,d2
[0001e102] e568                      lsl.w      d2,d0
[0001e104] 8240                      or.w       d0,d1
[0001e106] 3481                      move.w     d1,(a2)
[0001e108] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e10e] 2068 0258                 movea.l    600(a0),a0
[0001e112] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e118] 2469 0258                 movea.l    600(a1),a2
[0001e11c] 226a 0066                 movea.l    102(a2),a1
[0001e120] 700e                      moveq.l    #14,d0
[0001e122] 72ff                      moveq.l    #-1,d1
[0001e124] 4e91                      jsr        (a1)
[0001e126] 245f                      movea.l    (a7)+,a2
[0001e128] 261f                      move.l     (a7)+,d3
[0001e12a] 4e75                      rts

; start edit2\ediconed.c

getFgColor:
[0001e12c] 5d4f                      subq.w     #6,a7
[0001e12e] 41d7                      lea.l      (a7),a0
[0001e130] 4242                      clr.w      d2
[0001e132] 3200                      move.w     d0,d1
[0001e134] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e13a] 3029 0010                 move.w     16(a1),d0
[0001e13e] 4eb9 0007 5406            jsr        vq_color
[0001e144] 0c57 01f4                 cmpi.w     #$01F4,(a7)
[0001e148] 6c14                      bge.s      $0001E15E
[0001e14a] 0c6f 0190 0002            cmpi.w     #$0190,2(a7)
[0001e150] 6c0c                      bge.s      $0001E15E
[0001e152] 0c6f 0258 0004            cmpi.w     #$0258,4(a7)
[0001e158] 6c04                      bge.s      $0001E15E
[0001e15a] 4240                      clr.w      d0
[0001e15c] 6002                      bra.s      $0001E160
[0001e15e] 7001                      moveq.l    #1,d0
[0001e160] 5c4f                      addq.w     #6,a7
[0001e162] 4e75                      rts
ito_cicon:
[0001e164] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[0001e168] 2648                      movea.l    a0,a3
[0001e16a] 2849                      movea.l    a1,a4
[0001e16c] 246f 0018                 movea.l    24(a7),a2
[0001e170] 3600                      move.w     d0,d3
[0001e172] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e178] b068 001c                 cmp.w      28(a0),d0
[0001e17c] 660e                      bne.s      $0001E18C
[0001e17e] 2f0a                      move.l     a2,-(a7)
[0001e180] 204b                      movea.l    a3,a0
[0001e182] 4eb9 0001 6766            jsr        to_cicon
[0001e188] 584f                      addq.w     #4,a7
[0001e18a] 6048                      bra.s      $0001E1D4
[0001e18c] 780f                      moveq.l    #15,d4
[0001e18e] d86a 0016                 add.w      22(a2),d4
[0001e192] c87c fff0                 and.w      #$FFF0,d4
[0001e196] c9ea 0018                 muls.w     24(a2),d4
[0001e19a] e644                      asr.w      #3,d4
[0001e19c] 48c4                      ext.l      d4
[0001e19e] 2004                      move.l     d4,d0
[0001e1a0] 3203                      move.w     d3,d1
[0001e1a2] 48c1                      ext.l      d1
[0001e1a4] 4eb9 0008 3cac            jsr        _lmul
[0001e1aa] 2800                      move.l     d0,d4
[0001e1ac] 7006                      moveq.l    #6,d0
[0001e1ae] d084                      add.l      d4,d0
[0001e1b0] 4eb9 0004 c608            jsr        Ax_malloc
[0001e1b6] 2848                      movea.l    a0,a4
[0001e1b8] 200c                      move.l     a4,d0
[0001e1ba] 6604                      bne.s      $0001E1C0
[0001e1bc] 91c8                      suba.l     a0,a0
[0001e1be] 6014                      bra.s      $0001E1D4
[0001e1c0] 2004                      move.l     d4,d0
[0001e1c2] 43eb 0006                 lea.l      6(a3),a1
[0001e1c6] 41ec 0006                 lea.l      6(a4),a0
[0001e1ca] 4eb9 0008 3500            jsr        memcpy
[0001e1d0] 41ec 0006                 lea.l      6(a4),a0
[0001e1d4] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[0001e1d8] 4e75                      rts
mfdb_dm:
[0001e1da] 48e7 003c                 movem.l    a2-a5,-(a7)
[0001e1de] 286f 0014                 movea.l    20(a7),a4
[0001e1e2] 246f 0018                 movea.l    24(a7),a2
[0001e1e6] 266a 000c                 movea.l    12(a2),a3
[0001e1ea] 2a79 0010 ee4e            movea.l    ACSblk,a5
[0001e1f0] 2a6d 023c                 movea.l    572(a5),a5
[0001e1f4] 302d 000e                 move.w     14(a5),d0
[0001e1f8] c07c 0800                 and.w      #$0800,d0
[0001e1fc] 670c                      beq.s      $0001E20A
[0001e1fe] 7201                      moveq.l    #1,d1
[0001e200] 3341 000a                 move.w     d1,10(a1)
[0001e204] 3141 000a                 move.w     d1,10(a0)
[0001e208] 600a                      bra.s      $0001E214
[0001e20a] 4240                      clr.w      d0
[0001e20c] 3340 000a                 move.w     d0,10(a1)
[0001e210] 3140 000a                 move.w     d0,10(a0)
[0001e214] 302b 0016                 move.w     22(a3),d0
[0001e218] 3340 0004                 move.w     d0,4(a1)
[0001e21c] 3140 0004                 move.w     d0,4(a0)
[0001e220] 322b 0018                 move.w     24(a3),d1
[0001e224] 3341 0006                 move.w     d1,6(a1)
[0001e228] 3141 0006                 move.w     d1,6(a0)
[0001e22c] 3029 0004                 move.w     4(a1),d0
[0001e230] e840                      asr.w      #4,d0
[0001e232] 3340 0008                 move.w     d0,8(a1)
[0001e236] 3140 0008                 move.w     d0,8(a0)
[0001e23a] 4241                      clr.w      d1
[0001e23c] 3341 0012                 move.w     d1,18(a1)
[0001e240] 3341 0010                 move.w     d1,16(a1)
[0001e244] 3341 000e                 move.w     d1,14(a1)
[0001e248] 3141 0012                 move.w     d1,18(a0)
[0001e24c] 3141 0010                 move.w     d1,16(a0)
[0001e250] 3141 000e                 move.w     d1,14(a0)
[0001e254] 337c 0001 000c            move.w     #$0001,12(a1)
[0001e25a] 20ac 0010                 move.l     16(a4),(a0)
[0001e25e] 22ac 0014                 move.l     20(a4),(a1)
[0001e262] 317c 0001 000c            move.w     #$0001,12(a0)
[0001e268] 302c 0018                 move.w     24(a4),d0
[0001e26c] 2679 0010 ee4e            movea.l    ACSblk,a3
[0001e272] b06b 001c                 cmp.w      28(a3),d0
[0001e276] 6626                      bne.s      $0001E29E
[0001e278] 316b 001c 000c            move.w     28(a3),12(a0)
[0001e27e] 202c 0022                 move.l     34(a4),d0
[0001e282] 6712                      beq.s      $0001E296
[0001e284] 7201                      moveq.l    #1,d1
[0001e286] c26a 000a                 and.w      10(a2),d1
[0001e28a] 670a                      beq.s      $0001E296
[0001e28c] 22ac 0026                 move.l     38(a4),(a1)
[0001e290] 20ac 0022                 move.l     34(a4),(a0)
[0001e294] 6008                      bra.s      $0001E29E
[0001e296] 22ac 001e                 move.l     30(a4),(a1)
[0001e29a] 20ac 001a                 move.l     26(a4),(a0)
[0001e29e] 302c 002e                 move.w     46(a4),d0
[0001e2a2] 2679 0010 ee4e            movea.l    ACSblk,a3
[0001e2a8] b06b 001c                 cmp.w      28(a3),d0
[0001e2ac] 6626                      bne.s      $0001E2D4
[0001e2ae] 316b 001c 000c            move.w     28(a3),12(a0)
[0001e2b4] 202c 0038                 move.l     56(a4),d0
[0001e2b8] 6712                      beq.s      $0001E2CC
[0001e2ba] 7201                      moveq.l    #1,d1
[0001e2bc] c26a 000a                 and.w      10(a2),d1
[0001e2c0] 670a                      beq.s      $0001E2CC
[0001e2c2] 22ac 003c                 move.l     60(a4),(a1)
[0001e2c6] 20ac 0038                 move.l     56(a4),(a0)
[0001e2ca] 6008                      bra.s      $0001E2D4
[0001e2cc] 22ac 0034                 move.l     52(a4),(a1)
[0001e2d0] 20ac 0030                 move.l     48(a4),(a0)
[0001e2d4] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0001e2d8] 4e75                      rts
from_cicon:
[0001e2da] 48e7 1c36                 movem.l    d3-d5/a2-a3/a5-a6,-(a7)
[0001e2de] 4fef ffd8                 lea.l      -40(a7),a7
[0001e2e2] 2a48                      movea.l    a0,a5
[0001e2e4] 2449                      movea.l    a1,a2
[0001e2e6] 3800                      move.w     d0,d4
[0001e2e8] 760f                      moveq.l    #15,d3
[0001e2ea] d66a 0016                 add.w      22(a2),d3
[0001e2ee] c67c fff0                 and.w      #$FFF0,d3
[0001e2f2] 3a03                      move.w     d3,d5
[0001e2f4] cbea 0018                 muls.w     24(a2),d5
[0001e2f8] e645                      asr.w      #3,d5
[0001e2fa] 48c5                      ext.l      d5
[0001e2fc] 2005                      move.l     d5,d0
[0001e2fe] 3204                      move.w     d4,d1
[0001e300] 48c1                      ext.l      d1
[0001e302] 4eb9 0008 3cac            jsr        _lmul
[0001e308] 2a00                      move.l     d0,d5
[0001e30a] 4eb9 0004 c608            jsr        Ax_malloc
[0001e310] 2648                      movea.l    a0,a3
[0001e312] 200b                      move.l     a3,d0
[0001e314] 6606                      bne.s      $0001E31C
[0001e316] 91c8                      suba.l     a0,a0
[0001e318] 6000 009e                 bra        $0001E3B8
[0001e31c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e322] b868 001c                 cmp.w      28(a0),d4
[0001e326] 660e                      bne.s      $0001E336
[0001e328] 2268 023c                 movea.l    572(a0),a1
[0001e32c] 3029 000e                 move.w     14(a1),d0
[0001e330] c07c 0800                 and.w      #$0800,d0
[0001e334] 670e                      beq.s      $0001E344
[0001e336] 2005                      move.l     d5,d0
[0001e338] 224d                      movea.l    a5,a1
[0001e33a] 204b                      movea.l    a3,a0
[0001e33c] 4eb9 0008 3500            jsr        memcpy
[0001e342] 6072                      bra.s      $0001E3B6
[0001e344] 4def 0014                 lea.l      20(a7),a6
[0001e348] 3d7c 0001 000a            move.w     #$0001,10(a6)
[0001e34e] 426f 000a                 clr.w      10(a7)
[0001e352] 3f43 0004                 move.w     d3,4(a7)
[0001e356] 3d43 0004                 move.w     d3,4(a6)
[0001e35a] 302a 0018                 move.w     24(a2),d0
[0001e35e] 3f40 0006                 move.w     d0,6(a7)
[0001e362] 3d40 0006                 move.w     d0,6(a6)
[0001e366] 3203                      move.w     d3,d1
[0001e368] e841                      asr.w      #4,d1
[0001e36a] 3f41 0008                 move.w     d1,8(a7)
[0001e36e] 3d41 0008                 move.w     d1,8(a6)
[0001e372] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e378] 3028 001c                 move.w     28(a0),d0
[0001e37c] 3f40 000c                 move.w     d0,12(a7)
[0001e380] 3d40 000c                 move.w     d0,12(a6)
[0001e384] 4241                      clr.w      d1
[0001e386] 3f41 0012                 move.w     d1,18(a7)
[0001e38a] 3f41 0010                 move.w     d1,16(a7)
[0001e38e] 3f41 000e                 move.w     d1,14(a7)
[0001e392] 3d41 0012                 move.w     d1,18(a6)
[0001e396] 3d41 0010                 move.w     d1,16(a6)
[0001e39a] 3d41 000e                 move.w     d1,14(a6)
[0001e39e] 2e8d                      move.l     a5,(a7)
[0001e3a0] 2c8b                      move.l     a3,(a6)
[0001e3a2] 224e                      movea.l    a6,a1
[0001e3a4] 41d7                      lea.l      (a7),a0
[0001e3a6] 2479 0010 ee4e            movea.l    ACSblk,a2
[0001e3ac] 302a 0010                 move.w     16(a2),d0
[0001e3b0] 4eb9 0007 4978            jsr        vr_trnfm
[0001e3b6] 204b                      movea.l    a3,a0
[0001e3b8] 4fef 0028                 lea.l      40(a7),a7
[0001e3bc] 4cdf 6c38                 movem.l    (a7)+,d3-d5/a2-a3/a5-a6
[0001e3c0] 4e75                      rts
edic_link:
[0001e3c2] 2f0a                      move.l     a2,-(a7)
[0001e3c4] 2f0b                      move.l     a3,-(a7)
[0001e3c6] 2450                      movea.l    (a0),a2
[0001e3c8] 206a 0008                 movea.l    8(a2),a0
[0001e3cc] 2068 018c                 movea.l    396(a0),a0
[0001e3d0] 20aa 0014                 move.l     20(a2),(a0)
[0001e3d4] 216a 0010 0004            move.l     16(a2),4(a0)
[0001e3da] 93c9                      suba.l     a1,a1
[0001e3dc] 2679 0010 ee4e            movea.l    ACSblk,a3
[0001e3e2] 302b 001c                 move.w     28(a3),d0
[0001e3e6] b06a 002e                 cmp.w      46(a2),d0
[0001e3ea] 661e                      bne.s      $0001E40A
[0001e3ec] 43ea 002e                 lea.l      46(a2),a1
[0001e3f0] 236a 0030 0002            move.l     48(a2),2(a1)
[0001e3f6] 236a 0034 0006            move.l     52(a2),6(a1)
[0001e3fc] 236a 0038 000a            move.l     56(a2),10(a1)
[0001e402] 236a 003c 000e            move.l     60(a2),14(a1)
[0001e408] 602c                      bra.s      $0001E436
[0001e40a] 2679 0010 ee4e            movea.l    ACSblk,a3
[0001e410] 302b 001c                 move.w     28(a3),d0
[0001e414] b06a 0018                 cmp.w      24(a2),d0
[0001e418] 661c                      bne.s      $0001E436
[0001e41a] 43ea 0018                 lea.l      24(a2),a1
[0001e41e] 236a 001a 0002            move.l     26(a2),2(a1)
[0001e424] 236a 001e 0006            move.l     30(a2),6(a1)
[0001e42a] 236a 0022 000a            move.l     34(a2),10(a1)
[0001e430] 236a 0026 000e            move.l     38(a2),14(a1)
[0001e436] 2149 0022                 move.l     a1,34(a0)
[0001e43a] 206a 0008                 movea.l    8(a2),a0
[0001e43e] 41e8 0180                 lea.l      384(a0),a0
[0001e442] 4eb9 0004 fd76            jsr        Aob_icon
[0001e448] 265f                      movea.l    (a7)+,a3
[0001e44a] 245f                      movea.l    (a7)+,a2
[0001e44c] 4e75                      rts
edic_thin:
[0001e44e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e454] 2068 025c                 movea.l    604(a0),a0
[0001e458] 41e8 0030                 lea.l      48(a0),a0
[0001e45c] 7008                      moveq.l    #8,d0
[0001e45e] 3140 0016                 move.w     d0,22(a0)
[0001e462] 3140 0014                 move.w     d0,20(a0)
[0001e466] 72ff                      moveq.l    #-1,d1
[0001e468] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e46e] 2068 0258                 movea.l    600(a0),a0
[0001e472] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e478] 2269 0258                 movea.l    600(a1),a1
[0001e47c] 2269 0066                 movea.l    102(a1),a1
[0001e480] 7001                      moveq.l    #1,d0
[0001e482] 4e91                      jsr        (a1)
[0001e484] 4e75                      rts
edic_thick:
[0001e486] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e48c] 2068 025c                 movea.l    604(a0),a0
[0001e490] 41e8 0030                 lea.l      48(a0),a0
[0001e494] 7018                      moveq.l    #24,d0
[0001e496] 3140 0016                 move.w     d0,22(a0)
[0001e49a] 3140 0014                 move.w     d0,20(a0)
[0001e49e] 72ff                      moveq.l    #-1,d1
[0001e4a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e4a6] 2068 0258                 movea.l    600(a0),a0
[0001e4aa] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e4b0] 2269 0258                 movea.l    600(a1),a1
[0001e4b4] 2269 0066                 movea.l    102(a1),a1
[0001e4b8] 7001                      moveq.l    #1,d0
[0001e4ba] 4e91                      jsr        (a1)
[0001e4bc] 4e75                      rts
edic_black0:
[0001e4be] 2f0a                      move.l     a2,-(a7)
[0001e4c0] 2f0b                      move.l     a3,-(a7)
[0001e4c2] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0001e4c8] 2052                      movea.l    (a2),a0
[0001e4ca] 2068 025c                 movea.l    604(a0),a0
[0001e4ce] 2252                      movea.l    (a2),a1
[0001e4d0] 2269 0258                 movea.l    600(a1),a1
[0001e4d4] 2651                      movea.l    (a1),a3
[0001e4d6] 317c 0008 02b4            move.w     #$0008,692(a0)
[0001e4dc] 302b 0044                 move.w     68(a3),d0
[0001e4e0] 2252                      movea.l    (a2),a1
[0001e4e2] 2269 023c                 movea.l    572(a1),a1
[0001e4e6] 2269 006a                 movea.l    106(a1),a1
[0001e4ea] 3340 0008                 move.w     d0,8(a1)
[0001e4ee] 48c0                      ext.l      d0
[0001e4f0] 2268 003c                 movea.l    60(a0),a1
[0001e4f4] 2340 0004                 move.l     d0,4(a1)
[0001e4f8] 302b 0044                 move.w     68(a3),d0
[0001e4fc] 6100 fc2e                 bsr        getFgColor
[0001e500] 2052                      movea.l    (a2),a0
[0001e502] 2268 023c                 movea.l    572(a0),a1
[0001e506] 2069 006a                 movea.l    106(a1),a0
[0001e50a] 3140 0006                 move.w     d0,6(a0)
[0001e50e] 72ff                      moveq.l    #-1,d1
[0001e510] 2052                      movea.l    (a2),a0
[0001e512] 2068 0258                 movea.l    600(a0),a0
[0001e516] 2252                      movea.l    (a2),a1
[0001e518] 2669 0258                 movea.l    600(a1),a3
[0001e51c] 226b 0066                 movea.l    102(a3),a1
[0001e520] 7001                      moveq.l    #1,d0
[0001e522] 4e91                      jsr        (a1)
[0001e524] 265f                      movea.l    (a7)+,a3
[0001e526] 245f                      movea.l    (a7)+,a2
[0001e528] 4e75                      rts
edic_black:
[0001e52a] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0001e52e] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0001e534] 2052                      movea.l    (a2),a0
[0001e536] 2268 0258                 movea.l    600(a0),a1
[0001e53a] 2651                      movea.l    (a1),a3
[0001e53c] 302b 0018                 move.w     24(a3),d0
[0001e540] b068 001c                 cmp.w      28(a0),d0
[0001e544] 6618                      bne.s      $0001E55E
[0001e546] 72ff                      moveq.l    #-1,d1
[0001e548] 43f9 000a e92e            lea.l      COLOR,a1
[0001e54e] 2068 0258                 movea.l    600(a0),a0
[0001e552] 70ff                      moveq.l    #-1,d0
[0001e554] 4eb9 0004 e84a            jsr        Ame_popup
[0001e55a] 3600                      move.w     d0,d3
[0001e55c] 6026                      bra.s      $0001E584
[0001e55e] 302b 002e                 move.w     46(a3),d0
[0001e562] 2052                      movea.l    (a2),a0
[0001e564] b068 001c                 cmp.w      28(a0),d0
[0001e568] 6618                      bne.s      $0001E582
[0001e56a] 72ff                      moveq.l    #-1,d1
[0001e56c] 43f9 000a eac6            lea.l      COLOR256,a1
[0001e572] 2068 0258                 movea.l    600(a0),a0
[0001e576] 70ff                      moveq.l    #-1,d0
[0001e578] 4eb9 0004 e84a            jsr        Ame_popup
[0001e57e] 3600                      move.w     d0,d3
[0001e580] 6002                      bra.s      $0001E584
[0001e582] 7602                      moveq.l    #2,d3
[0001e584] 4a43                      tst.w      d3
[0001e586] 6f16                      ble.s      $0001E59E
[0001e588] 5343                      subq.w     #1,d3
[0001e58a] 3743 0044                 move.w     d3,68(a3)
[0001e58e] 4a43                      tst.w      d3
[0001e590] 6f06                      ble.s      $0001E598
[0001e592] 6100 ff2a                 bsr        edic_black0
[0001e596] 6006                      bra.s      $0001E59E
[0001e598] 4eb9 0001 e5a4            jsr        edic_white
[0001e59e] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0001e5a2] 4e75                      rts
edic_white:
[0001e5a4] 2f0a                      move.l     a2,-(a7)
[0001e5a6] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0001e5ac] 2052                      movea.l    (a2),a0
[0001e5ae] 2068 025c                 movea.l    604(a0),a0
[0001e5b2] 2252                      movea.l    (a2),a1
[0001e5b4] 2269 0258                 movea.l    600(a1),a1
[0001e5b8] 2251                      movea.l    (a1),a1
[0001e5ba] 4269 0044                 clr.w      68(a1)
[0001e5be] 317c 0009 02b4            move.w     #$0009,692(a0)
[0001e5c4] 2268 003c                 movea.l    60(a0),a1
[0001e5c8] 42a9 0004                 clr.l      4(a1)
[0001e5cc] 72ff                      moveq.l    #-1,d1
[0001e5ce] 7001                      moveq.l    #1,d0
[0001e5d0] 2052                      movea.l    (a2),a0
[0001e5d2] 2068 0258                 movea.l    600(a0),a0
[0001e5d6] 2252                      movea.l    (a2),a1
[0001e5d8] 2269 0258                 movea.l    600(a1),a1
[0001e5dc] 2269 0066                 movea.l    102(a1),a1
[0001e5e0] 4e91                      jsr        (a1)
[0001e5e2] 245f                      movea.l    (a7)+,a2
[0001e5e4] 4e75                      rts
edic_invisible:
[0001e5e6] 2f0a                      move.l     a2,-(a7)
[0001e5e8] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0001e5ee] 2052                      movea.l    (a2),a0
[0001e5f0] 2068 025c                 movea.l    604(a0),a0
[0001e5f4] 2252                      movea.l    (a2),a1
[0001e5f6] 2269 0258                 movea.l    600(a1),a1
[0001e5fa] 2251                      movea.l    (a1),a1
[0001e5fc] 337c ffff 0044            move.w     #$FFFF,68(a1)
[0001e602] 317c 000a 02b4            move.w     #$000A,692(a0)
[0001e608] 2268 003c                 movea.l    60(a0),a1
[0001e60c] 237c ffff ffff 0004       move.l     #$FFFFFFFF,4(a1)
[0001e614] 72ff                      moveq.l    #-1,d1
[0001e616] 7001                      moveq.l    #1,d0
[0001e618] 2052                      movea.l    (a2),a0
[0001e61a] 2068 0258                 movea.l    600(a0),a0
[0001e61e] 2252                      movea.l    (a2),a1
[0001e620] 2269 0258                 movea.l    600(a1),a1
[0001e624] 2269 0066                 movea.l    102(a1),a1
[0001e628] 4e91                      jsr        (a1)
[0001e62a] 245f                      movea.l    (a7)+,a2
[0001e62c] 4e75                      rts
edic_nextpattern:
[0001e62e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e634] 2268 025c                 movea.l    604(a0),a1
[0001e638] 2069 015c                 movea.l    348(a1),a0
[0001e63c] 5848                      addq.w     #4,a0
[0001e63e] 3028 0002                 move.w     2(a0),d0
[0001e642] d07c 0010                 add.w      #$0010,d0
[0001e646] c07c 0070                 and.w      #$0070,d0
[0001e64a] 0268 ff8f 0002            andi.w     #$FF8F,2(a0)
[0001e650] 8168 0002                 or.w       d0,2(a0)
[0001e654] 72ff                      moveq.l    #-1,d1
[0001e656] 700e                      moveq.l    #14,d0
[0001e658] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e65e] 2068 0258                 movea.l    600(a0),a0
[0001e662] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e668] 2269 0258                 movea.l    600(a1),a1
[0001e66c] 2269 0066                 movea.l    102(a1),a1
[0001e670] 4e91                      jsr        (a1)
[0001e672] 4e75                      rts
snap:
[0001e674] 72ff                      moveq.l    #-1,d1
[0001e676] d279 0008 4808            add.w      imagesnap,d1
[0001e67c] e241                      asr.w      #1,d1
[0001e67e] d240                      add.w      d0,d1
[0001e680] 3439 0008 4808            move.w     imagesnap,d2
[0001e686] 4442                      neg.w      d2
[0001e688] c242                      and.w      d2,d1
[0001e68a] 3001                      move.w     d1,d0
[0001e68c] 4e75                      rts
do_plane:
[0001e68e] 48e7 1c3e                 movem.l    d3-d5/a2-a6,-(a7)
[0001e692] 2a48                      movea.l    a0,a5
[0001e694] 2649                      movea.l    a1,a3
[0001e696] 3600                      move.w     d0,d3
[0001e698] 2801                      move.l     d1,d4
[0001e69a] 5340                      subq.w     #1,d0
[0001e69c] 6614                      bne.s      $0001E6B2
[0001e69e] 3003                      move.w     d3,d0
[0001e6a0] 48c0                      ext.l      d0
[0001e6a2] 4eb9 0008 3cac            jsr        _lmul
[0001e6a8] 4eb9 0004 c608            jsr        Ax_malloc
[0001e6ae] 2448                      movea.l    a0,a2
[0001e6b0] 601c                      bra.s      $0001E6CE
[0001e6b2] 3003                      move.w     d3,d0
[0001e6b4] 48c0                      ext.l      d0
[0001e6b6] 2204                      move.l     d4,d1
[0001e6b8] 4eb9 0008 3cac            jsr        _lmul
[0001e6be] 5c80                      addq.l     #6,d0
[0001e6c0] 4eb9 0004 c608            jsr        Ax_malloc
[0001e6c6] 2448                      movea.l    a0,a2
[0001e6c8] 200a                      move.l     a2,d0
[0001e6ca] 6702                      beq.s      $0001E6CE
[0001e6cc] 5c4a                      addq.w     #6,a2
[0001e6ce] 200a                      move.l     a2,d0
[0001e6d0] 6700 0198                 beq        $0001E86A
[0001e6d4] 2680                      move.l     d0,(a3)
[0001e6d6] 206f 0028                 movea.l    40(a7),a0
[0001e6da] 2a90                      move.l     (a0),(a5)
[0001e6dc] 3003                      move.w     d3,d0
[0001e6de] 48c0                      ext.l      d0
[0001e6e0] 2204                      move.l     d4,d1
[0001e6e2] 4eb9 0008 3cac            jsr        _lmul
[0001e6e8] 2200                      move.l     d0,d1
[0001e6ea] 204a                      movea.l    a2,a0
[0001e6ec] 4240                      clr.w      d0
[0001e6ee] 4eb9 0008 36ea            jsr        memset
[0001e6f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e6fa] b668 001c                 cmp.w      28(a0),d3
[0001e6fe] 6600 010c                 bne        $0001E80C
[0001e702] 3028 001c                 move.w     28(a0),d0
[0001e706] 3b40 000c                 move.w     d0,12(a5)
[0001e70a] 3740 000c                 move.w     d0,12(a3)
[0001e70e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e714] 2268 023c                 movea.l    572(a0),a1
[0001e718] 3229 000e                 move.w     14(a1),d1
[0001e71c] c27c 0800                 and.w      #$0800,d1
[0001e720] 6700 00cc                 beq        $0001E7EE
[0001e724] 322d 0006                 move.w     6(a5),d1
[0001e728] 302d 0004                 move.w     4(a5),d0
[0001e72c] 4eb9 0005 4b6e            jsr        Abp_create
[0001e732] 2848                      movea.l    a0,a4
[0001e734] 200c                      move.l     a4,d0
[0001e736] 6714                      beq.s      $0001E74C
[0001e738] 322b 0006                 move.w     6(a3),d1
[0001e73c] 302b 0004                 move.w     4(a3),d0
[0001e740] 4eb9 0005 4b6e            jsr        Abp_create
[0001e746] 2c48                      movea.l    a0,a6
[0001e748] 200e                      move.l     a6,d0
[0001e74a] 662c                      bne.s      $0001E778
[0001e74c] 200c                      move.l     a4,d0
[0001e74e] 6708                      beq.s      $0001E758
[0001e750] 204c                      movea.l    a4,a0
[0001e752] 4eb9 0005 4c04            jsr        Abp_delete
[0001e758] b67c 0001                 cmp.w      #$0001,d3
[0001e75c] 660c                      bne.s      $0001E76A
[0001e75e] 2053                      movea.l    (a3),a0
[0001e760] 4eb9 0004 c7c8            jsr        Ax_free
[0001e766] 6000 0102                 bra        $0001E86A
[0001e76a] 2053                      movea.l    (a3),a0
[0001e76c] 5d48                      subq.w     #6,a0
[0001e76e] 4eb9 0004 c7c8            jsr        Ax_free
[0001e774] 6000 00f4                 bra        $0001E86A
[0001e778] 7001                      moveq.l    #1,d0
[0001e77a] 3740 000a                 move.w     d0,10(a3)
[0001e77e] 3b40 000a                 move.w     d0,10(a5)
[0001e782] 4241                      clr.w      d1
[0001e784] 3d41 000a                 move.w     d1,10(a6)
[0001e788] 3941 000a                 move.w     d1,10(a4)
[0001e78c] 224c                      movea.l    a4,a1
[0001e78e] 204d                      movea.l    a5,a0
[0001e790] 2f09                      move.l     a1,-(a7)
[0001e792] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e798] 3029 0010                 move.w     16(a1),d0
[0001e79c] 225f                      movea.l    (a7)+,a1
[0001e79e] 4eb9 0007 4978            jsr        vr_trnfm
[0001e7a4] 2f0e                      move.l     a6,-(a7)
[0001e7a6] 224c                      movea.l    a4,a1
[0001e7a8] 206f 0028                 movea.l    40(a7),a0
[0001e7ac] 7203                      moveq.l    #3,d1
[0001e7ae] 2f09                      move.l     a1,-(a7)
[0001e7b0] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e7b6] 3029 0010                 move.w     16(a1),d0
[0001e7ba] 225f                      movea.l    (a7)+,a1
[0001e7bc] 4eb9 0007 489e            jsr        vro_cpyfm
[0001e7c2] 584f                      addq.w     #4,a7
[0001e7c4] 224b                      movea.l    a3,a1
[0001e7c6] 204e                      movea.l    a6,a0
[0001e7c8] 2f09                      move.l     a1,-(a7)
[0001e7ca] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e7d0] 3029 0010                 move.w     16(a1),d0
[0001e7d4] 225f                      movea.l    (a7)+,a1
[0001e7d6] 4eb9 0007 4978            jsr        vr_trnfm
[0001e7dc] 204e                      movea.l    a6,a0
[0001e7de] 4eb9 0005 4c04            jsr        Abp_delete
[0001e7e4] 204c                      movea.l    a4,a0
[0001e7e6] 4eb9 0005 4c04            jsr        Abp_delete
[0001e7ec] 6054                      bra.s      $0001E842
[0001e7ee] 2f0b                      move.l     a3,-(a7)
[0001e7f0] 224d                      movea.l    a5,a1
[0001e7f2] 206f 0028                 movea.l    40(a7),a0
[0001e7f6] 7203                      moveq.l    #3,d1
[0001e7f8] 2879 0010 ee4e            movea.l    ACSblk,a4
[0001e7fe] 302c 0010                 move.w     16(a4),d0
[0001e802] 4eb9 0007 489e            jsr        vro_cpyfm
[0001e808] 584f                      addq.w     #4,a7
[0001e80a] 6036                      bra.s      $0001E842
[0001e80c] 7001                      moveq.l    #1,d0
[0001e80e] 3b40 000c                 move.w     d0,12(a5)
[0001e812] 3740 000c                 move.w     d0,12(a3)
[0001e816] 7aff                      moveq.l    #-1,d5
[0001e818] da43                      add.w      d3,d5
[0001e81a] 6022                      bra.s      $0001E83E
[0001e81c] 2f0b                      move.l     a3,-(a7)
[0001e81e] 224d                      movea.l    a5,a1
[0001e820] 206f 0028                 movea.l    40(a7),a0
[0001e824] 7203                      moveq.l    #3,d1
[0001e826] 2879 0010 ee4e            movea.l    ACSblk,a4
[0001e82c] 302c 0010                 move.w     16(a4),d0
[0001e830] 4eb9 0007 489e            jsr        vro_cpyfm
[0001e836] 584f                      addq.w     #4,a7
[0001e838] d993                      add.l      d4,(a3)
[0001e83a] d995                      add.l      d4,(a5)
[0001e83c] 5345                      subq.w     #1,d5
[0001e83e] 4a45                      tst.w      d5
[0001e840] 6ada                      bpl.s      $0001E81C
[0001e842] b67c 0001                 cmp.w      #$0001,d3
[0001e846] 660e                      bne.s      $0001E856
[0001e848] 206f 0028                 movea.l    40(a7),a0
[0001e84c] 2050                      movea.l    (a0),a0
[0001e84e] 4eb9 0004 c6c8            jsr        Ax_ifree
[0001e854] 600e                      bra.s      $0001E864
[0001e856] 206f 0028                 movea.l    40(a7),a0
[0001e85a] 2050                      movea.l    (a0),a0
[0001e85c] 5d48                      subq.w     #6,a0
[0001e85e] 4eb9 0004 c6c8            jsr        Ax_ifree
[0001e864] 206f 0028                 movea.l    40(a7),a0
[0001e868] 208a                      move.l     a2,(a0)
[0001e86a] 4cdf 7c38                 movem.l    (a7)+,d3-d5/a2-a6
[0001e86e] 4e75                      rts
edic_resize:
[0001e870] 48e7 1c1e                 movem.l    d3-d5/a3-a6,-(a7)
[0001e874] 4fef ffc4                 lea.l      -60(a7),a7
[0001e878] 2f48 0038                 move.l     a0,56(a7)
[0001e87c] 3600                      move.w     d0,d3
[0001e87e] 3801                      move.w     d1,d4
[0001e880] 2650                      movea.l    (a0),a3
[0001e882] 226b 0008                 movea.l    8(a3),a1
[0001e886] 2869 018c                 movea.l    396(a1),a4
[0001e88a] 740f                      moveq.l    #15,d2
[0001e88c] d440                      add.w      d0,d2
[0001e88e] c47c fff0                 and.w      #$FFF0,d2
[0001e892] 3602                      move.w     d2,d3
[0001e894] 4bef 0010                 lea.l      16(a7),a5
[0001e898] 426d 000a                 clr.w      10(a5)
[0001e89c] 3b43 0004                 move.w     d3,4(a5)
[0001e8a0] 3b44 0006                 move.w     d4,6(a5)
[0001e8a4] 3003                      move.w     d3,d0
[0001e8a6] e840                      asr.w      #4,d0
[0001e8a8] 3b40 0008                 move.w     d0,8(a5)
[0001e8ac] 4def 0024                 lea.l      36(a7),a6
[0001e8b0] 3d7c 0001 000a            move.w     #$0001,10(a6)
[0001e8b6] 3d6c 0018 0006            move.w     24(a4),6(a6)
[0001e8bc] 3d6c 0016 0004            move.w     22(a4),4(a6)
[0001e8c2] 302e 0004                 move.w     4(a6),d0
[0001e8c6] e840                      asr.w      #4,d0
[0001e8c8] 3d40 0008                 move.w     d0,8(a6)
[0001e8cc] 4241                      clr.w      d1
[0001e8ce] 3d41 0012                 move.w     d1,18(a6)
[0001e8d2] 3d41 0010                 move.w     d1,16(a6)
[0001e8d6] 3d41 000e                 move.w     d1,14(a6)
[0001e8da] 3b41 0012                 move.w     d1,18(a5)
[0001e8de] 3b41 0010                 move.w     d1,16(a5)
[0001e8e2] 3b41 000e                 move.w     d1,14(a5)
[0001e8e6] 4240                      clr.w      d0
[0001e8e8] 3f40 000a                 move.w     d0,10(a7)
[0001e8ec] 3f40 0008                 move.w     d0,8(a7)
[0001e8f0] 3f40 0002                 move.w     d0,2(a7)
[0001e8f4] 3e80                      move.w     d0,(a7)
[0001e8f6] 74ff                      moveq.l    #-1,d2
[0001e8f8] d46c 0016                 add.w      22(a4),d2
[0001e8fc] 3f42 000c                 move.w     d2,12(a7)
[0001e900] 3f42 0004                 move.w     d2,4(a7)
[0001e904] 70ff                      moveq.l    #-1,d0
[0001e906] d06c 0018                 add.w      24(a4),d0
[0001e90a] 3f40 000e                 move.w     d0,14(a7)
[0001e90e] 3f40 0006                 move.w     d0,6(a7)
[0001e912] b66c 0016                 cmp.w      22(a4),d3
[0001e916] 6c0c                      bge.s      $0001E924
[0001e918] 74ff                      moveq.l    #-1,d2
[0001e91a] d443                      add.w      d3,d2
[0001e91c] 3f42 000c                 move.w     d2,12(a7)
[0001e920] 3f42 0004                 move.w     d2,4(a7)
[0001e924] b86c 0018                 cmp.w      24(a4),d4
[0001e928] 6c0c                      bge.s      $0001E936
[0001e92a] 70ff                      moveq.l    #-1,d0
[0001e92c] d044                      add.w      d4,d0
[0001e92e] 3f40 000e                 move.w     d0,14(a7)
[0001e932] 3f40 0006                 move.w     d0,6(a7)
[0001e936] 3003                      move.w     d3,d0
[0001e938] 48c0                      ext.l      d0
[0001e93a] 3204                      move.w     d4,d1
[0001e93c] 48c1                      ext.l      d1
[0001e93e] 4eb9 0008 3cac            jsr        _lmul
[0001e944] 2a00                      move.l     d0,d5
[0001e946] e685                      asr.l      #3,d5
[0001e948] 486b 0010                 pea.l      16(a3)
[0001e94c] 486f 0004                 pea.l      4(a7)
[0001e950] 2205                      move.l     d5,d1
[0001e952] 7001                      moveq.l    #1,d0
[0001e954] 224d                      movea.l    a5,a1
[0001e956] 204e                      movea.l    a6,a0
[0001e958] 6100 fd34                 bsr        do_plane
[0001e95c] 504f                      addq.w     #8,a7
[0001e95e] 486b 0014                 pea.l      20(a3)
[0001e962] 486f 0004                 pea.l      4(a7)
[0001e966] 2205                      move.l     d5,d1
[0001e968] 7001                      moveq.l    #1,d0
[0001e96a] 224d                      movea.l    a5,a1
[0001e96c] 204e                      movea.l    a6,a0
[0001e96e] 6100 fd1e                 bsr        do_plane
[0001e972] 504f                      addq.w     #8,a7
[0001e974] 302b 0018                 move.w     24(a3),d0
[0001e978] 6f5e                      ble.s      $0001E9D8
[0001e97a] 486b 001a                 pea.l      26(a3)
[0001e97e] 486f 0004                 pea.l      4(a7)
[0001e982] 2205                      move.l     d5,d1
[0001e984] 224d                      movea.l    a5,a1
[0001e986] 204e                      movea.l    a6,a0
[0001e988] 7004                      moveq.l    #4,d0
[0001e98a] 6100 fd02                 bsr        do_plane
[0001e98e] 504f                      addq.w     #8,a7
[0001e990] 486b 001e                 pea.l      30(a3)
[0001e994] 486f 0004                 pea.l      4(a7)
[0001e998] 2205                      move.l     d5,d1
[0001e99a] 7001                      moveq.l    #1,d0
[0001e99c] 224d                      movea.l    a5,a1
[0001e99e] 204e                      movea.l    a6,a0
[0001e9a0] 6100 fcec                 bsr        do_plane
[0001e9a4] 504f                      addq.w     #8,a7
[0001e9a6] 202b 0022                 move.l     34(a3),d0
[0001e9aa] 672c                      beq.s      $0001E9D8
[0001e9ac] 486b 0022                 pea.l      34(a3)
[0001e9b0] 486f 0004                 pea.l      4(a7)
[0001e9b4] 2205                      move.l     d5,d1
[0001e9b6] 224d                      movea.l    a5,a1
[0001e9b8] 204e                      movea.l    a6,a0
[0001e9ba] 7004                      moveq.l    #4,d0
[0001e9bc] 6100 fcd0                 bsr        do_plane
[0001e9c0] 504f                      addq.w     #8,a7
[0001e9c2] 486b 0026                 pea.l      38(a3)
[0001e9c6] 486f 0004                 pea.l      4(a7)
[0001e9ca] 2205                      move.l     d5,d1
[0001e9cc] 7001                      moveq.l    #1,d0
[0001e9ce] 224d                      movea.l    a5,a1
[0001e9d0] 204e                      movea.l    a6,a0
[0001e9d2] 6100 fcba                 bsr        do_plane
[0001e9d6] 504f                      addq.w     #8,a7
[0001e9d8] 302b 002e                 move.w     46(a3),d0
[0001e9dc] 6f5e                      ble.s      $0001EA3C
[0001e9de] 486b 0030                 pea.l      48(a3)
[0001e9e2] 486f 0004                 pea.l      4(a7)
[0001e9e6] 2205                      move.l     d5,d1
[0001e9e8] 224d                      movea.l    a5,a1
[0001e9ea] 204e                      movea.l    a6,a0
[0001e9ec] 7008                      moveq.l    #8,d0
[0001e9ee] 6100 fc9e                 bsr        do_plane
[0001e9f2] 504f                      addq.w     #8,a7
[0001e9f4] 486b 0034                 pea.l      52(a3)
[0001e9f8] 486f 0004                 pea.l      4(a7)
[0001e9fc] 2205                      move.l     d5,d1
[0001e9fe] 7001                      moveq.l    #1,d0
[0001ea00] 224d                      movea.l    a5,a1
[0001ea02] 204e                      movea.l    a6,a0
[0001ea04] 6100 fc88                 bsr        do_plane
[0001ea08] 504f                      addq.w     #8,a7
[0001ea0a] 202b 0038                 move.l     56(a3),d0
[0001ea0e] 672c                      beq.s      $0001EA3C
[0001ea10] 486b 0038                 pea.l      56(a3)
[0001ea14] 486f 0004                 pea.l      4(a7)
[0001ea18] 2205                      move.l     d5,d1
[0001ea1a] 224d                      movea.l    a5,a1
[0001ea1c] 204e                      movea.l    a6,a0
[0001ea1e] 7008                      moveq.l    #8,d0
[0001ea20] 6100 fc6c                 bsr        do_plane
[0001ea24] 504f                      addq.w     #8,a7
[0001ea26] 486b 003c                 pea.l      60(a3)
[0001ea2a] 486f 0004                 pea.l      4(a7)
[0001ea2e] 2205                      move.l     d5,d1
[0001ea30] 7001                      moveq.l    #1,d0
[0001ea32] 224d                      movea.l    a5,a1
[0001ea34] 204e                      movea.l    a6,a0
[0001ea36] 6100 fc56                 bsr        do_plane
[0001ea3a] 504f                      addq.w     #8,a7
[0001ea3c] 3003                      move.w     d3,d0
[0001ea3e] 6100 fc34                 bsr        snap
[0001ea42] 3940 0016                 move.w     d0,22(a4)
[0001ea46] 206b 0008                 movea.l    8(a3),a0
[0001ea4a] 3140 01c4                 move.w     d0,452(a0)
[0001ea4e] 3004                      move.w     d4,d0
[0001ea50] 6100 fc22                 bsr        snap
[0001ea54] 3940 0018                 move.w     d0,24(a4)
[0001ea58] 206b 0008                 movea.l    8(a3),a0
[0001ea5c] 3140 01c6                 move.w     d0,454(a0)
[0001ea60] 206f 0038                 movea.l    56(a7),a0
[0001ea64] 6100 f95c                 bsr        edic_link
[0001ea68] 4fef 003c                 lea.l      60(a7),a7
[0001ea6c] 4cdf 7838                 movem.l    (a7)+,d3-d5/a3-a6
[0001ea70] 4e75                      rts
edic_check:
[0001ea72] 2f0a                      move.l     a2,-(a7)
[0001ea74] 2448                      movea.l    a0,a2
[0001ea76] 0c6a 00c0 0016            cmpi.w     #$00C0,22(a2)
[0001ea7c] 6f06                      ble.s      $0001EA84
[0001ea7e] 357c 00c0 0016            move.w     #$00C0,22(a2)
[0001ea84] 0c6a 00c0 0018            cmpi.w     #$00C0,24(a2)
[0001ea8a] 6f06                      ble.s      $0001EA92
[0001ea8c] 357c 00c0 0018            move.w     #$00C0,24(a2)
[0001ea92] 700f                      moveq.l    #15,d0
[0001ea94] d06a 0016                 add.w      22(a2),d0
[0001ea98] c07c fff0                 and.w      #$FFF0,d0
[0001ea9c] 3540 0016                 move.w     d0,22(a2)
[0001eaa0] 302a 0018                 move.w     24(a2),d0
[0001eaa4] 6100 fbce                 bsr        snap
[0001eaa8] 3540 0018                 move.w     d0,24(a2)
[0001eaac] 0c6a 00c0 001e            cmpi.w     #$00C0,30(a2)
[0001eab2] 6f06                      ble.s      $0001EABA
[0001eab4] 357c 00c0 001e            move.w     #$00C0,30(a2)
[0001eaba] 0c6a 00c0 0020            cmpi.w     #$00C0,32(a2)
[0001eac0] 6f06                      ble.s      $0001EAC8
[0001eac2] 357c 00c0 0020            move.w     #$00C0,32(a2)
[0001eac8] 302a 001e                 move.w     30(a2),d0
[0001eacc] 6100 fba6                 bsr        snap
[0001ead0] 3540 001e                 move.w     d0,30(a2)
[0001ead4] 302a 0020                 move.w     32(a2),d0
[0001ead8] 6100 fb9a                 bsr        snap
[0001eadc] 3540 0020                 move.w     d0,32(a2)
[0001eae0] 7006                      moveq.l    #6,d0
[0001eae2] d06a 000e                 add.w      14(a2),d0
[0001eae6] 906a 0016                 sub.w      22(a2),d0
[0001eaea] 4a40                      tst.w      d0
[0001eaec] 6f04                      ble.s      $0001EAF2
[0001eaee] 916a 000e                 sub.w      d0,14(a2)
[0001eaf2] 7006                      moveq.l    #6,d0
[0001eaf4] d06a 0010                 add.w      16(a2),d0
[0001eaf8] 906a 0018                 sub.w      24(a2),d0
[0001eafc] 4a40                      tst.w      d0
[0001eafe] 6f04                      ble.s      $0001EB04
[0001eb00] 916a 0010                 sub.w      d0,16(a2)
[0001eb04] 302a 0012                 move.w     18(a2),d0
[0001eb08] d06a 0016                 add.w      22(a2),d0
[0001eb0c] d07c ff40                 add.w      #$FF40,d0
[0001eb10] 4a40                      tst.w      d0
[0001eb12] 6f04                      ble.s      $0001EB18
[0001eb14] 916a 0012                 sub.w      d0,18(a2)
[0001eb18] 302a 0014                 move.w     20(a2),d0
[0001eb1c] d06a 0018                 add.w      24(a2),d0
[0001eb20] d07c ff40                 add.w      #$FF40,d0
[0001eb24] 4a40                      tst.w      d0
[0001eb26] 6f04                      ble.s      $0001EB2C
[0001eb28] 916a 0014                 sub.w      d0,20(a2)
[0001eb2c] 302a 001a                 move.w     26(a2),d0
[0001eb30] d06a 001e                 add.w      30(a2),d0
[0001eb34] d07c ff40                 add.w      #$FF40,d0
[0001eb38] 4a40                      tst.w      d0
[0001eb3a] 6f04                      ble.s      $0001EB40
[0001eb3c] 916a 001a                 sub.w      d0,26(a2)
[0001eb40] 302a 001c                 move.w     28(a2),d0
[0001eb44] d06a 0020                 add.w      32(a2),d0
[0001eb48] d07c ff40                 add.w      #$FF40,d0
[0001eb4c] 4a40                      tst.w      d0
[0001eb4e] 6f04                      ble.s      $0001EB54
[0001eb50] 916a 001c                 sub.w      d0,28(a2)
[0001eb54] 302a 000e                 move.w     14(a2),d0
[0001eb58] 6100 fb1a                 bsr        snap
[0001eb5c] 3540 000e                 move.w     d0,14(a2)
[0001eb60] 302a 0010                 move.w     16(a2),d0
[0001eb64] 6100 fb0e                 bsr        snap
[0001eb68] 3540 0010                 move.w     d0,16(a2)
[0001eb6c] 302a 0012                 move.w     18(a2),d0
[0001eb70] 6100 fb02                 bsr        snap
[0001eb74] 3540 0012                 move.w     d0,18(a2)
[0001eb78] 302a 0014                 move.w     20(a2),d0
[0001eb7c] 6100 faf6                 bsr        snap
[0001eb80] 3540 0014                 move.w     d0,20(a2)
[0001eb84] 302a 001a                 move.w     26(a2),d0
[0001eb88] 6100 faea                 bsr        snap
[0001eb8c] 3540 001a                 move.w     d0,26(a2)
[0001eb90] 302a 001c                 move.w     28(a2),d0
[0001eb94] 6100 fade                 bsr        snap
[0001eb98] 3540 001c                 move.w     d0,28(a2)
[0001eb9c] 245f                      movea.l    (a7)+,a2
[0001eb9e] 4e75                      rts
edic_deskicon:
[0001eba0] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001eba4] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0001ebaa] 2052                      movea.l    (a2),a0
[0001ebac] 2268 0258                 movea.l    600(a0),a1
[0001ebb0] 2051                      movea.l    (a1),a0
[0001ebb2] 2268 0014                 movea.l    20(a0),a1
[0001ebb6] 2669 018c                 movea.l    396(a1),a3
[0001ebba] 2052                      movea.l    (a2),a0
[0001ebbc] 2868 025c                 movea.l    604(a0),a4
[0001ebc0] 4eb9 0005 1388            jsr        Awi_diaend
[0001ebc6] 7048                      moveq.l    #72,d0
[0001ebc8] 906b 0016                 sub.w      22(a3),d0
[0001ebcc] e240                      asr.w      #1,d0
[0001ebce] 3f00                      move.w     d0,-(a7)
[0001ebd0] 43f9 000b 0e62            lea.l      $000B0E62,a1
[0001ebd6] 204c                      movea.l    a4,a0
[0001ebd8] 7011                      moveq.l    #17,d0
[0001ebda] 4eb9 0005 0f94            jsr        Aob_printf
[0001ebe0] 544f                      addq.w     #2,a7
[0001ebe2] 72ff                      moveq.l    #-1,d1
[0001ebe4] 7011                      moveq.l    #17,d0
[0001ebe6] 2052                      movea.l    (a2),a0
[0001ebe8] 2068 0258                 movea.l    600(a0),a0
[0001ebec] 2252                      movea.l    (a2),a1
[0001ebee] 2669 0258                 movea.l    600(a1),a3
[0001ebf2] 226b 0066                 movea.l    102(a3),a1
[0001ebf6] 4e91                      jsr        (a1)
[0001ebf8] 43f9 000b 0e65            lea.l      $000B0E65,a1
[0001ebfe] 7015                      moveq.l    #21,d0
[0001ec00] 204c                      movea.l    a4,a0
[0001ec02] 4eb9 0005 0f94            jsr        Aob_printf
[0001ec08] 72ff                      moveq.l    #-1,d1
[0001ec0a] 7015                      moveq.l    #21,d0
[0001ec0c] 2052                      movea.l    (a2),a0
[0001ec0e] 2068 0258                 movea.l    600(a0),a0
[0001ec12] 2252                      movea.l    (a2),a1
[0001ec14] 2669 0258                 movea.l    600(a1),a3
[0001ec18] 226b 0066                 movea.l    102(a3),a1
[0001ec1c] 4e91                      jsr        (a1)
[0001ec1e] 43f9 000b 0e67            lea.l      $000B0E67,a1
[0001ec24] 7016                      moveq.l    #22,d0
[0001ec26] 204c                      movea.l    a4,a0
[0001ec28] 4eb9 0005 0f94            jsr        Aob_printf
[0001ec2e] 72ff                      moveq.l    #-1,d1
[0001ec30] 7016                      moveq.l    #22,d0
[0001ec32] 2052                      movea.l    (a2),a0
[0001ec34] 2068 0258                 movea.l    600(a0),a0
[0001ec38] 2252                      movea.l    (a2),a1
[0001ec3a] 2669 0258                 movea.l    600(a1),a3
[0001ec3e] 226b 0066                 movea.l    102(a3),a1
[0001ec42] 4e91                      jsr        (a1)
[0001ec44] 43f9 000b 0e6a            lea.l      $000B0E6A,a1
[0001ec4a] 7017                      moveq.l    #23,d0
[0001ec4c] 204c                      movea.l    a4,a0
[0001ec4e] 4eb9 0005 0f94            jsr        Aob_printf
[0001ec54] 72ff                      moveq.l    #-1,d1
[0001ec56] 7017                      moveq.l    #23,d0
[0001ec58] 2052                      movea.l    (a2),a0
[0001ec5a] 2068 0258                 movea.l    600(a0),a0
[0001ec5e] 2252                      movea.l    (a2),a1
[0001ec60] 2669 0258                 movea.l    600(a1),a3
[0001ec64] 226b 0066                 movea.l    102(a3),a1
[0001ec68] 4e91                      jsr        (a1)
[0001ec6a] 43f9 000b 0e6d            lea.l      $000B0E6D,a1
[0001ec70] 7018                      moveq.l    #24,d0
[0001ec72] 204c                      movea.l    a4,a0
[0001ec74] 4eb9 0005 0f94            jsr        Aob_printf
[0001ec7a] 72ff                      moveq.l    #-1,d1
[0001ec7c] 7018                      moveq.l    #24,d0
[0001ec7e] 2052                      movea.l    (a2),a0
[0001ec80] 2068 0258                 movea.l    600(a0),a0
[0001ec84] 2252                      movea.l    (a2),a1
[0001ec86] 2669 0258                 movea.l    600(a1),a3
[0001ec8a] 226b 0066                 movea.l    102(a3),a1
[0001ec8e] 4e91                      jsr        (a1)
[0001ec90] 4eb9 0005 147c            jsr        Awi_diastart
[0001ec96] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001ec9a] 4e75                      rts
edic_direct:
[0001ec9c] 48e7 1e3c                 movem.l    d3-d6/a2-a5,-(a7)
[0001eca0] 41f9 000b 0d88            lea.l      WI_POS,a0
[0001eca6] 2279 000b 0d90            movea.l    $000B0D90,a1
[0001ecac] 4e91                      jsr        (a1)
[0001ecae] 2448                      movea.l    a0,a2
[0001ecb0] 200a                      move.l     a2,d0
[0001ecb2] 6700 0214                 beq        $0001EEC8
[0001ecb6] 47f9 0010 ee4e            lea.l      ACSblk,a3
[0001ecbc] 2053                      movea.l    (a3),a0
[0001ecbe] 24a8 0258                 move.l     600(a0),(a2)
[0001ecc2] 2053                      movea.l    (a3),a0
[0001ecc4] 2268 025c                 movea.l    604(a0),a1
[0001ecc8] 2869 018c                 movea.l    396(a1),a4
[0001eccc] 4bf9 000b 0e62            lea.l      $000B0E62,a5
[0001ecd2] 3f2c 000e                 move.w     14(a4),-(a7)
[0001ecd6] 224d                      movea.l    a5,a1
[0001ecd8] 700c                      moveq.l    #12,d0
[0001ecda] 206a 0014                 movea.l    20(a2),a0
[0001ecde] 4eb9 0005 0f94            jsr        Aob_printf
[0001ece4] 544f                      addq.w     #2,a7
[0001ece6] 3f2c 0010                 move.w     16(a4),-(a7)
[0001ecea] 224d                      movea.l    a5,a1
[0001ecec] 700e                      moveq.l    #14,d0
[0001ecee] 206a 0014                 movea.l    20(a2),a0
[0001ecf2] 4eb9 0005 0f94            jsr        Aob_printf
[0001ecf8] 544f                      addq.w     #2,a7
[0001ecfa] 3f2c 0012                 move.w     18(a4),-(a7)
[0001ecfe] 224d                      movea.l    a5,a1
[0001ed00] 7011                      moveq.l    #17,d0
[0001ed02] 206a 0014                 movea.l    20(a2),a0
[0001ed06] 4eb9 0005 0f94            jsr        Aob_printf
[0001ed0c] 544f                      addq.w     #2,a7
[0001ed0e] 3f2c 0014                 move.w     20(a4),-(a7)
[0001ed12] 224d                      movea.l    a5,a1
[0001ed14] 7012                      moveq.l    #18,d0
[0001ed16] 206a 0014                 movea.l    20(a2),a0
[0001ed1a] 4eb9 0005 0f94            jsr        Aob_printf
[0001ed20] 544f                      addq.w     #2,a7
[0001ed22] 3f2c 0016                 move.w     22(a4),-(a7)
[0001ed26] 224d                      movea.l    a5,a1
[0001ed28] 7013                      moveq.l    #19,d0
[0001ed2a] 206a 0014                 movea.l    20(a2),a0
[0001ed2e] 4eb9 0005 0f94            jsr        Aob_printf
[0001ed34] 544f                      addq.w     #2,a7
[0001ed36] 3f2c 0018                 move.w     24(a4),-(a7)
[0001ed3a] 224d                      movea.l    a5,a1
[0001ed3c] 7014                      moveq.l    #20,d0
[0001ed3e] 206a 0014                 movea.l    20(a2),a0
[0001ed42] 4eb9 0005 0f94            jsr        Aob_printf
[0001ed48] 544f                      addq.w     #2,a7
[0001ed4a] 3f2c 001a                 move.w     26(a4),-(a7)
[0001ed4e] 224d                      movea.l    a5,a1
[0001ed50] 7015                      moveq.l    #21,d0
[0001ed52] 206a 0014                 movea.l    20(a2),a0
[0001ed56] 4eb9 0005 0f94            jsr        Aob_printf
[0001ed5c] 544f                      addq.w     #2,a7
[0001ed5e] 3f2c 001c                 move.w     28(a4),-(a7)
[0001ed62] 224d                      movea.l    a5,a1
[0001ed64] 7016                      moveq.l    #22,d0
[0001ed66] 206a 0014                 movea.l    20(a2),a0
[0001ed6a] 4eb9 0005 0f94            jsr        Aob_printf
[0001ed70] 544f                      addq.w     #2,a7
[0001ed72] 3f2c 001e                 move.w     30(a4),-(a7)
[0001ed76] 224d                      movea.l    a5,a1
[0001ed78] 7017                      moveq.l    #23,d0
[0001ed7a] 206a 0014                 movea.l    20(a2),a0
[0001ed7e] 4eb9 0005 0f94            jsr        Aob_printf
[0001ed84] 544f                      addq.w     #2,a7
[0001ed86] 3f2c 0020                 move.w     32(a4),-(a7)
[0001ed8a] 224d                      movea.l    a5,a1
[0001ed8c] 7018                      moveq.l    #24,d0
[0001ed8e] 206a 0014                 movea.l    20(a2),a0
[0001ed92] 4eb9 0005 0f94            jsr        Aob_printf
[0001ed98] 544f                      addq.w     #2,a7
[0001ed9a] 204a                      movea.l    a2,a0
[0001ed9c] 4eb9 0005 9df4            jsr        Awi_dialog
[0001eda2] b07c 001d                 cmp.w      #$001D,d0
[0001eda6] 6600 0118                 bne        $0001EEC0
[0001edaa] 362c 0016                 move.w     22(a4),d3
[0001edae] 382c 0018                 move.w     24(a4),d4
[0001edb2] 486c 000e                 pea.l      14(a4)
[0001edb6] 224d                      movea.l    a5,a1
[0001edb8] 700c                      moveq.l    #12,d0
[0001edba] 206a 0014                 movea.l    20(a2),a0
[0001edbe] 4eb9 0005 10fe            jsr        Aob_scanf
[0001edc4] 584f                      addq.w     #4,a7
[0001edc6] 486c 0010                 pea.l      16(a4)
[0001edca] 224d                      movea.l    a5,a1
[0001edcc] 700e                      moveq.l    #14,d0
[0001edce] 206a 0014                 movea.l    20(a2),a0
[0001edd2] 4eb9 0005 10fe            jsr        Aob_scanf
[0001edd8] 584f                      addq.w     #4,a7
[0001edda] 486c 0012                 pea.l      18(a4)
[0001edde] 224d                      movea.l    a5,a1
[0001ede0] 7011                      moveq.l    #17,d0
[0001ede2] 206a 0014                 movea.l    20(a2),a0
[0001ede6] 4eb9 0005 10fe            jsr        Aob_scanf
[0001edec] 584f                      addq.w     #4,a7
[0001edee] 486c 0014                 pea.l      20(a4)
[0001edf2] 224d                      movea.l    a5,a1
[0001edf4] 7012                      moveq.l    #18,d0
[0001edf6] 206a 0014                 movea.l    20(a2),a0
[0001edfa] 4eb9 0005 10fe            jsr        Aob_scanf
[0001ee00] 584f                      addq.w     #4,a7
[0001ee02] 486c 0016                 pea.l      22(a4)
[0001ee06] 224d                      movea.l    a5,a1
[0001ee08] 7013                      moveq.l    #19,d0
[0001ee0a] 206a 0014                 movea.l    20(a2),a0
[0001ee0e] 4eb9 0005 10fe            jsr        Aob_scanf
[0001ee14] 584f                      addq.w     #4,a7
[0001ee16] 486c 0018                 pea.l      24(a4)
[0001ee1a] 224d                      movea.l    a5,a1
[0001ee1c] 7014                      moveq.l    #20,d0
[0001ee1e] 206a 0014                 movea.l    20(a2),a0
[0001ee22] 4eb9 0005 10fe            jsr        Aob_scanf
[0001ee28] 584f                      addq.w     #4,a7
[0001ee2a] 486c 001a                 pea.l      26(a4)
[0001ee2e] 224d                      movea.l    a5,a1
[0001ee30] 7015                      moveq.l    #21,d0
[0001ee32] 206a 0014                 movea.l    20(a2),a0
[0001ee36] 4eb9 0005 10fe            jsr        Aob_scanf
[0001ee3c] 584f                      addq.w     #4,a7
[0001ee3e] 486c 001c                 pea.l      28(a4)
[0001ee42] 224d                      movea.l    a5,a1
[0001ee44] 7016                      moveq.l    #22,d0
[0001ee46] 206a 0014                 movea.l    20(a2),a0
[0001ee4a] 4eb9 0005 10fe            jsr        Aob_scanf
[0001ee50] 584f                      addq.w     #4,a7
[0001ee52] 486c 001e                 pea.l      30(a4)
[0001ee56] 224d                      movea.l    a5,a1
[0001ee58] 7017                      moveq.l    #23,d0
[0001ee5a] 206a 0014                 movea.l    20(a2),a0
[0001ee5e] 4eb9 0005 10fe            jsr        Aob_scanf
[0001ee64] 584f                      addq.w     #4,a7
[0001ee66] 486c 0020                 pea.l      32(a4)
[0001ee6a] 224d                      movea.l    a5,a1
[0001ee6c] 7018                      moveq.l    #24,d0
[0001ee6e] 206a 0014                 movea.l    20(a2),a0
[0001ee72] 4eb9 0005 10fe            jsr        Aob_scanf
[0001ee78] 584f                      addq.w     #4,a7
[0001ee7a] 204c                      movea.l    a4,a0
[0001ee7c] 6100 fbf4                 bsr        edic_check
[0001ee80] 3a2c 0016                 move.w     22(a4),d5
[0001ee84] 3c2c 0018                 move.w     24(a4),d6
[0001ee88] 3943 0016                 move.w     d3,22(a4)
[0001ee8c] 3944 0018                 move.w     d4,24(a4)
[0001ee90] 3206                      move.w     d6,d1
[0001ee92] 3005                      move.w     d5,d0
[0001ee94] 2053                      movea.l    (a3),a0
[0001ee96] 2068 0258                 movea.l    600(a0),a0
[0001ee9a] 6100 f9d4                 bsr        edic_resize
[0001ee9e] 2053                      movea.l    (a3),a0
[0001eea0] 2268 025c                 movea.l    604(a0),a1
[0001eea4] 0069 0080 01b8            ori.w      #$0080,440(a1)
[0001eeaa] 72ff                      moveq.l    #-1,d1
[0001eeac] 700e                      moveq.l    #14,d0
[0001eeae] 2053                      movea.l    (a3),a0
[0001eeb0] 2068 0258                 movea.l    600(a0),a0
[0001eeb4] 2253                      movea.l    (a3),a1
[0001eeb6] 2869 0258                 movea.l    600(a1),a4
[0001eeba] 226c 0066                 movea.l    102(a4),a1
[0001eebe] 4e91                      jsr        (a1)
[0001eec0] 204a                      movea.l    a2,a0
[0001eec2] 4eb9 0005 85f2            jsr        Awi_delete
[0001eec8] 4cdf 3c78                 movem.l    (a7)+,d3-d6/a2-a5
[0001eecc] 4e75                      rts
edic_select:
[0001eece] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001eed4] 2268 025c                 movea.l    604(a0),a1
[0001eed8] 0a69 0001 018a            eori.w     #$0001,394(a1)
[0001eede] 72ff                      moveq.l    #-1,d1
[0001eee0] 700e                      moveq.l    #14,d0
[0001eee2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001eee8] 2068 0258                 movea.l    600(a0),a0
[0001eeec] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001eef2] 2269 0258                 movea.l    600(a1),a1
[0001eef6] 2269 0066                 movea.l    102(a1),a1
[0001eefa] 4e91                      jsr        (a1)
[0001eefc] 4e75                      rts
edit_shift:
[0001eefe] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001ef02] 4fef ffb0                 lea.l      -80(a7),a7
[0001ef06] 3600                      move.w     d0,d3
[0001ef08] 2650                      movea.l    (a0),a3
[0001ef0a] 206b 0008                 movea.l    8(a3),a0
[0001ef0e] 41e8 0180                 lea.l      384(a0),a0
[0001ef12] 2f48 004c                 move.l     a0,76(a7)
[0001ef16] 2f68 000c 0048            move.l     12(a0),72(a7)
[0001ef1c] 2f08                      move.l     a0,-(a7)
[0001ef1e] 2f0b                      move.l     a3,-(a7)
[0001ef20] 43ef 0028                 lea.l      40(a7),a1
[0001ef24] 41ef 003c                 lea.l      60(a7),a0
[0001ef28] 6100 f2b0                 bsr        mfdb_dm
[0001ef2c] 504f                      addq.w     #8,a7
[0001ef2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001ef34] 2268 023c                 movea.l    572(a0),a1
[0001ef38] 3029 000e                 move.w     14(a1),d0
[0001ef3c] c07c 0800                 and.w      #$0800,d0
[0001ef40] 6716                      beq.s      $0001EF58
[0001ef42] 322f 003a                 move.w     58(a7),d1
[0001ef46] 302f 0038                 move.w     56(a7),d0
[0001ef4a] 4eb9 0005 4b6e            jsr        Abp_create
[0001ef50] 2648                      movea.l    a0,a3
[0001ef52] 200b                      move.l     a3,d0
[0001ef54] 6700 01f0                 beq        $0001F146
[0001ef58] 45ef 0010                 lea.l      16(a7),a2
[0001ef5c] 4240                      clr.w      d0
[0001ef5e] 3f40 000a                 move.w     d0,10(a7)
[0001ef62] 3f40 0008                 move.w     d0,8(a7)
[0001ef66] 3f40 0002                 move.w     d0,2(a7)
[0001ef6a] 3e80                      move.w     d0,(a7)
[0001ef6c] 3540 000a                 move.w     d0,10(a2)
[0001ef70] 3540 0008                 move.w     d0,8(a2)
[0001ef74] 3540 0002                 move.w     d0,2(a2)
[0001ef78] 3480                      move.w     d0,(a2)
[0001ef7a] 72ff                      moveq.l    #-1,d1
[0001ef7c] 206f 0048                 movea.l    72(a7),a0
[0001ef80] d268 0016                 add.w      22(a0),d1
[0001ef84] 3f41 000c                 move.w     d1,12(a7)
[0001ef88] 3f41 0004                 move.w     d1,4(a7)
[0001ef8c] 3541 000c                 move.w     d1,12(a2)
[0001ef90] 3541 0004                 move.w     d1,4(a2)
[0001ef94] 70ff                      moveq.l    #-1,d0
[0001ef96] d068 0018                 add.w      24(a0),d0
[0001ef9a] 3f40 000e                 move.w     d0,14(a7)
[0001ef9e] 3f40 0006                 move.w     d0,6(a7)
[0001efa2] 3540 000e                 move.w     d0,14(a2)
[0001efa6] 3540 0006                 move.w     d0,6(a2)
[0001efaa] 3203                      move.w     d3,d1
[0001efac] 4a41                      tst.w      d1
[0001efae] 670e                      beq.s      $0001EFBE
[0001efb0] 5341                      subq.w     #1,d1
[0001efb2] 671c                      beq.s      $0001EFD0
[0001efb4] 5341                      subq.w     #1,d1
[0001efb6] 672c                      beq.s      $0001EFE4
[0001efb8] 5341                      subq.w     #1,d1
[0001efba] 673e                      beq.s      $0001EFFA
[0001efbc] 6050                      bra.s      $0001F00E
[0001efbe] 5252                      addq.w     #1,(a2)
[0001efc0] 536a 000c                 subq.w     #1,12(a2)
[0001efc4] 302f 0004                 move.w     4(a7),d0
[0001efc8] 3f40 0008                 move.w     d0,8(a7)
[0001efcc] 3e80                      move.w     d0,(a7)
[0001efce] 603e                      bra.s      $0001F00E
[0001efd0] 536a 0004                 subq.w     #1,4(a2)
[0001efd4] 526a 0008                 addq.w     #1,8(a2)
[0001efd8] 3017                      move.w     (a7),d0
[0001efda] 3f40 000c                 move.w     d0,12(a7)
[0001efde] 3f40 0004                 move.w     d0,4(a7)
[0001efe2] 602a                      bra.s      $0001F00E
[0001efe4] 526a 0002                 addq.w     #1,2(a2)
[0001efe8] 536a 000e                 subq.w     #1,14(a2)
[0001efec] 302f 0006                 move.w     6(a7),d0
[0001eff0] 3f40 000a                 move.w     d0,10(a7)
[0001eff4] 3f40 0002                 move.w     d0,2(a7)
[0001eff8] 6014                      bra.s      $0001F00E
[0001effa] 536a 0006                 subq.w     #1,6(a2)
[0001effe] 526a 000a                 addq.w     #1,10(a2)
[0001f002] 302f 0002                 move.w     2(a7),d0
[0001f006] 3f40 000e                 move.w     d0,14(a7)
[0001f00a] 3f40 0006                 move.w     d0,6(a7)
[0001f00e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f014] 2268 023c                 movea.l    572(a0),a1
[0001f018] 3029 000e                 move.w     14(a1),d0
[0001f01c] c07c 0800                 and.w      #$0800,d0
[0001f020] 676e                      beq.s      $0001F090
[0001f022] 3228 001c                 move.w     28(a0),d1
[0001f026] b26f 0040                 cmp.w      64(a7),d1
[0001f02a] 6664                      bne.s      $0001F090
[0001f02c] 41ef 0034                 lea.l      52(a7),a0
[0001f030] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001f036] 3029 0010                 move.w     16(a1),d0
[0001f03a] 224b                      movea.l    a3,a1
[0001f03c] 4eb9 0007 4978            jsr        vr_trnfm
[0001f042] 2f0b                      move.l     a3,-(a7)
[0001f044] 224b                      movea.l    a3,a1
[0001f046] 204a                      movea.l    a2,a0
[0001f048] 7203                      moveq.l    #3,d1
[0001f04a] 2879 0010 ee4e            movea.l    ACSblk,a4
[0001f050] 302c 0010                 move.w     16(a4),d0
[0001f054] 4eb9 0007 489e            jsr        vro_cpyfm
[0001f05a] 584f                      addq.w     #4,a7
[0001f05c] 2f0b                      move.l     a3,-(a7)
[0001f05e] 224b                      movea.l    a3,a1
[0001f060] 41ef 0004                 lea.l      4(a7),a0
[0001f064] 4241                      clr.w      d1
[0001f066] 2879 0010 ee4e            movea.l    ACSblk,a4
[0001f06c] 302c 0010                 move.w     16(a4),d0
[0001f070] 4eb9 0007 489e            jsr        vro_cpyfm
[0001f076] 584f                      addq.w     #4,a7
[0001f078] 43ef 0034                 lea.l      52(a7),a1
[0001f07c] 204b                      movea.l    a3,a0
[0001f07e] 2879 0010 ee4e            movea.l    ACSblk,a4
[0001f084] 302c 0010                 move.w     16(a4),d0
[0001f088] 4eb9 0007 4978            jsr        vr_trnfm
[0001f08e] 603e                      bra.s      $0001F0CE
[0001f090] 486f 0034                 pea.l      52(a7)
[0001f094] 43ef 0038                 lea.l      56(a7),a1
[0001f098] 204a                      movea.l    a2,a0
[0001f09a] 7203                      moveq.l    #3,d1
[0001f09c] 2879 0010 ee4e            movea.l    ACSblk,a4
[0001f0a2] 302c 0010                 move.w     16(a4),d0
[0001f0a6] 4eb9 0007 489e            jsr        vro_cpyfm
[0001f0ac] 584f                      addq.w     #4,a7
[0001f0ae] 486f 0034                 pea.l      52(a7)
[0001f0b2] 43ef 0038                 lea.l      56(a7),a1
[0001f0b6] 41ef 0004                 lea.l      4(a7),a0
[0001f0ba] 4241                      clr.w      d1
[0001f0bc] 2879 0010 ee4e            movea.l    ACSblk,a4
[0001f0c2] 302c 0010                 move.w     16(a4),d0
[0001f0c6] 4eb9 0007 489e            jsr        vro_cpyfm
[0001f0cc] 584f                      addq.w     #4,a7
[0001f0ce] 486f 0020                 pea.l      32(a7)
[0001f0d2] 43ef 0024                 lea.l      36(a7),a1
[0001f0d6] 204a                      movea.l    a2,a0
[0001f0d8] 7203                      moveq.l    #3,d1
[0001f0da] 2879 0010 ee4e            movea.l    ACSblk,a4
[0001f0e0] 302c 0010                 move.w     16(a4),d0
[0001f0e4] 4eb9 0007 489e            jsr        vro_cpyfm
[0001f0ea] 584f                      addq.w     #4,a7
[0001f0ec] 486f 0020                 pea.l      32(a7)
[0001f0f0] 43ef 0024                 lea.l      36(a7),a1
[0001f0f4] 41ef 0004                 lea.l      4(a7),a0
[0001f0f8] 4241                      clr.w      d1
[0001f0fa] 2479 0010 ee4e            movea.l    ACSblk,a2
[0001f100] 302a 0010                 move.w     16(a2),d0
[0001f104] 4eb9 0007 489e            jsr        vro_cpyfm
[0001f10a] 584f                      addq.w     #4,a7
[0001f10c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f112] 2268 023c                 movea.l    572(a0),a1
[0001f116] 3029 000e                 move.w     14(a1),d0
[0001f11a] c07c 0800                 and.w      #$0800,d0
[0001f11e] 6708                      beq.s      $0001F128
[0001f120] 204b                      movea.l    a3,a0
[0001f122] 4eb9 0005 4c04            jsr        Abp_delete
[0001f128] 72ff                      moveq.l    #-1,d1
[0001f12a] 701b                      moveq.l    #27,d0
[0001f12c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f132] 2068 0258                 movea.l    600(a0),a0
[0001f136] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001f13c] 2469 0258                 movea.l    600(a1),a2
[0001f140] 226a 0066                 movea.l    102(a2),a1
[0001f144] 4e91                      jsr        (a1)
[0001f146] 4fef 0050                 lea.l      80(a7),a7
[0001f14a] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001f14e] 4e75                      rts
edic_up:
[0001f150] 7002                      moveq.l    #2,d0
[0001f152] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f158] 2068 0258                 movea.l    600(a0),a0
[0001f15c] 6100 fda0                 bsr        edit_shift
[0001f160] 4e75                      rts
edic_down:
[0001f162] 7003                      moveq.l    #3,d0
[0001f164] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f16a] 2068 0258                 movea.l    600(a0),a0
[0001f16e] 6100 fd8e                 bsr        edit_shift
[0001f172] 4e75                      rts
edic_right:
[0001f174] 7001                      moveq.l    #1,d0
[0001f176] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f17c] 2068 0258                 movea.l    600(a0),a0
[0001f180] 6100 fd7c                 bsr        edit_shift
[0001f184] 4e75                      rts
edic_left:
[0001f186] 4240                      clr.w      d0
[0001f188] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f18e] 2068 0258                 movea.l    600(a0),a0
[0001f192] 6100 fd6a                 bsr        edit_shift
[0001f196] 4e75                      rts
control:
[0001f198] 343c 0080                 move.w     #$0080,d2
[0001f19c] c468 01b8                 and.w      440(a0),d2
[0001f1a0] 6626                      bne.s      $0001F1C8
[0001f1a2] 3428 01c0                 move.w     448(a0),d2
[0001f1a6] b451                      cmp.w      (a1),d2
[0001f1a8] 661e                      bne.s      $0001F1C8
[0001f1aa] 3428 01c2                 move.w     450(a0),d2
[0001f1ae] b469 0002                 cmp.w      2(a1),d2
[0001f1b2] 6614                      bne.s      $0001F1C8
[0001f1b4] 3428 01c4                 move.w     452(a0),d2
[0001f1b8] b469 0004                 cmp.w      4(a1),d2
[0001f1bc] 660a                      bne.s      $0001F1C8
[0001f1be] 3428 01c6                 move.w     454(a0),d2
[0001f1c2] b469 0006                 cmp.w      6(a1),d2
[0001f1c6] 6720                      beq.s      $0001F1E8
[0001f1c8] 0268 ff7f 01b8            andi.w     #$FF7F,440(a0)
[0001f1ce] 3151 01c0                 move.w     (a1),448(a0)
[0001f1d2] 3169 0002 01c2            move.w     2(a1),450(a0)
[0001f1d8] 3169 0004 01c4            move.w     4(a1),452(a0)
[0001f1de] 3169 0006 01c6            move.w     6(a1),454(a0)
[0001f1e4] 4240                      clr.w      d0
[0001f1e6] 4e75                      rts
[0001f1e8] 3411                      move.w     (a1),d2
[0001f1ea] d469 0004                 add.w      4(a1),d2
[0001f1ee] 5342                      subq.w     #1,d2
[0001f1f0] 9440                      sub.w      d0,d2
[0001f1f2] 3002                      move.w     d2,d0
[0001f1f4] 3429 0002                 move.w     2(a1),d2
[0001f1f8] d469 0006                 add.w      6(a1),d2
[0001f1fc] 5342                      subq.w     #1,d2
[0001f1fe] 9441                      sub.w      d1,d2
[0001f200] 3202                      move.w     d2,d1
[0001f202] b07c 0008                 cmp.w      #$0008,d0
[0001f206] 6f0a                      ble.s      $0001F212
[0001f208] 3429 0004                 move.w     4(a1),d2
[0001f20c] e642                      asr.w      #3,d2
[0001f20e] b042                      cmp.w      d2,d0
[0001f210] 6e10                      bgt.s      $0001F222
[0001f212] b27c 0008                 cmp.w      #$0008,d1
[0001f216] 6f0e                      ble.s      $0001F226
[0001f218] 3029 0006                 move.w     6(a1),d0
[0001f21c] e640                      asr.w      #3,d0
[0001f21e] b240                      cmp.w      d0,d1
[0001f220] 6f04                      ble.s      $0001F226
[0001f222] 7001                      moveq.l    #1,d0
[0001f224] 4e75                      rts
[0001f226] 7002                      moveq.l    #2,d0
[0001f228] 4e75                      rts
edic_control:
[0001f22a] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0001f22e] 4fef ffc8                 lea.l      -56(a7),a7
[0001f232] 41f9 000b 0e44            lea.l      $000B0E44,a0
[0001f238] 43ef 0020                 lea.l      32(a7),a1
[0001f23c] 700f                      moveq.l    #15,d0
[0001f23e] 12d8                      move.b     (a0)+,(a1)+
[0001f240] 51c8 fffc                 dbf        d0,$0001F23E
[0001f244] 47f9 0010 ee4e            lea.l      ACSblk,a3
[0001f24a] 2053                      movea.l    (a3),a0
[0001f24c] 2468 0258                 movea.l    600(a0),a2
[0001f250] 286a 0014                 movea.l    20(a2),a4
[0001f254] 3e28 0260                 move.w     608(a0),d7
[0001f258] 3207                      move.w     d7,d1
[0001f25a] 48c1                      ext.l      d1
[0001f25c] 2001                      move.l     d1,d0
[0001f25e] d080                      add.l      d0,d0
[0001f260] d081                      add.l      d1,d0
[0001f262] e788                      lsl.l      #3,d0
[0001f264] 3434 080a                 move.w     10(a4,d0.l),d2
[0001f268] c47c 4000                 and.w      #$4000,d2
[0001f26c] 670a                      beq.s      $0001F278
[0001f26e] 4eb9 0002 08aa            jsr        edic_edit
[0001f274] 6000 05de                 bra        $0001F854
[0001f278] 2053                      movea.l    (a3),a0
[0001f27a] 3c28 0262                 move.w     610(a0),d6
[0001f27e] 3a28 0264                 move.w     612(a0),d5
[0001f282] 2f39 000e 692a            move.l     _globl,-(a7)
[0001f288] 486f 0034                 pea.l      52(a7)
[0001f28c] 43ef 003a                 lea.l      58(a7),a1
[0001f290] 3007                      move.w     d7,d0
[0001f292] 204c                      movea.l    a4,a0
[0001f294] 4eb9 0007 9d14            jsr        mt_objc_offset
[0001f29a] 504f                      addq.w     #8,a7
[0001f29c] 302a 0034                 move.w     52(a2),d0
[0001f2a0] d16f 0032                 add.w      d0,50(a7)
[0001f2a4] 322a 0036                 move.w     54(a2),d1
[0001f2a8] d36f 0030                 add.w      d1,48(a7)
[0001f2ac] 3007                      move.w     d7,d0
[0001f2ae] 48c0                      ext.l      d0
[0001f2b0] 2400                      move.l     d0,d2
[0001f2b2] d482                      add.l      d2,d2
[0001f2b4] d480                      add.l      d0,d2
[0001f2b6] e78a                      lsl.l      #3,d2
[0001f2b8] 3634 2814                 move.w     20(a4,d2.l),d3
[0001f2bc] 3834 2816                 move.w     22(a4,d2.l),d4
[0001f2c0] 9c6f 0032                 sub.w      50(a7),d6
[0001f2c4] 9a6f 0030                 sub.w      48(a7),d5
[0001f2c8] 2474 280c                 movea.l    12(a4,d2.l),a2
[0001f2cc] 4bef 0018                 lea.l      24(a7),a5
[0001f2d0] 302a 000e                 move.w     14(a2),d0
[0001f2d4] d06a 0012                 add.w      18(a2),d0
[0001f2d8] 3a80                      move.w     d0,(a5)
[0001f2da] 322a 0010                 move.w     16(a2),d1
[0001f2de] d26a 0014                 add.w      20(a2),d1
[0001f2e2] 3b41 0002                 move.w     d1,2(a5)
[0001f2e6] 7406                      moveq.l    #6,d2
[0001f2e8] 3b42 0006                 move.w     d2,6(a5)
[0001f2ec] 3b42 0004                 move.w     d2,4(a5)
[0001f2f0] 204d                      movea.l    a5,a0
[0001f2f2] 3006                      move.w     d6,d0
[0001f2f4] 3205                      move.w     d5,d1
[0001f2f6] 4eb9 0006 b7a6            jsr        Aob_within
[0001f2fc] 4a40                      tst.w      d0
[0001f2fe] 6774                      beq.s      $0001F374
[0001f300] 2f39 000e 692a            move.l     _globl,-(a7)
[0001f306] 3f2a 0018                 move.w     24(a2),-(a7)
[0001f30a] 3f2a 0016                 move.w     22(a2),-(a7)
[0001f30e] 302f 0038                 move.w     56(a7),d0
[0001f312] d06a 0014                 add.w      20(a2),d0
[0001f316] 3f00                      move.w     d0,-(a7)
[0001f318] 322f 003c                 move.w     60(a7),d1
[0001f31c] d26a 0012                 add.w      18(a2),d1
[0001f320] 3f01                      move.w     d1,-(a7)
[0001f322] 342f 003c                 move.w     60(a7),d2
[0001f326] d46d 0002                 add.w      2(a5),d2
[0001f32a] 3f02                      move.w     d2,-(a7)
[0001f32c] 43ef 0042                 lea.l      66(a7),a1
[0001f330] 41ef 0044                 lea.l      68(a7),a0
[0001f334] 342f 0040                 move.w     64(a7),d2
[0001f338] d455                      add.w      (a5),d2
[0001f33a] 7006                      moveq.l    #6,d0
[0001f33c] 3200                      move.w     d0,d1
[0001f33e] 4eb9 0007 a6ce            jsr        mt_graf_dragbox
[0001f344] 4fef 000e                 lea.l      14(a7),a7
[0001f348] 302f 0036                 move.w     54(a7),d0
[0001f34c] 906f 0032                 sub.w      50(a7),d0
[0001f350] 906a 0012                 sub.w      18(a2),d0
[0001f354] 6100 f31e                 bsr        snap
[0001f358] 3540 000e                 move.w     d0,14(a2)
[0001f35c] 302f 0034                 move.w     52(a7),d0
[0001f360] 906f 0030                 sub.w      48(a7),d0
[0001f364] 906a 0014                 sub.w      20(a2),d0
[0001f368] 6100 f30a                 bsr        snap
[0001f36c] 3540 0010                 move.w     d0,16(a2)
[0001f370] 6000 04cc                 bra        $0001F83E
[0001f374] 3aaa 001a                 move.w     26(a2),(a5)
[0001f378] 3b6a 001c 0002            move.w     28(a2),2(a5)
[0001f37e] 3b6a 001e 0004            move.w     30(a2),4(a5)
[0001f384] 3b6a 0020 0006            move.w     32(a2),6(a5)
[0001f38a] 3205                      move.w     d5,d1
[0001f38c] 3006                      move.w     d6,d0
[0001f38e] 204d                      movea.l    a5,a0
[0001f390] 4eb9 0006 b7a6            jsr        Aob_within
[0001f396] 4a40                      tst.w      d0
[0001f398] 6700 00e2                 beq        $0001F47C
[0001f39c] 3205                      move.w     d5,d1
[0001f39e] 3006                      move.w     d6,d0
[0001f3a0] 224d                      movea.l    a5,a1
[0001f3a2] 204c                      movea.l    a4,a0
[0001f3a4] 6100 fdf2                 bsr        control
[0001f3a8] 5340                      subq.w     #1,d0
[0001f3aa] 6766                      beq.s      $0001F412
[0001f3ac] 5340                      subq.w     #1,d0
[0001f3ae] 6704                      beq.s      $0001F3B4
[0001f3b0] 6000 048c                 bra        $0001F83E
[0001f3b4] 3004                      move.w     d4,d0
[0001f3b6] 906a 001c                 sub.w      28(a2),d0
[0001f3ba] 3f00                      move.w     d0,-(a7)
[0001f3bc] 3203                      move.w     d3,d1
[0001f3be] 926a 001a                 sub.w      26(a2),d1
[0001f3c2] 3f01                      move.w     d1,-(a7)
[0001f3c4] 7408                      moveq.l    #8,d2
[0001f3c6] 3f02                      move.w     d2,-(a7)
[0001f3c8] 43ef 003a                 lea.l      58(a7),a1
[0001f3cc] 41ef 003c                 lea.l      60(a7),a0
[0001f3d0] 322f 0036                 move.w     54(a7),d1
[0001f3d4] d26a 001c                 add.w      28(a2),d1
[0001f3d8] 302f 0038                 move.w     56(a7),d0
[0001f3dc] d06a 001a                 add.w      26(a2),d0
[0001f3e0] 4eb9 0001 596a            jsr        A_rubberbox
[0001f3e6] 5c4f                      addq.w     #6,a7
[0001f3e8] 4a40                      tst.w      d0
[0001f3ea] 6700 0452                 beq        $0001F83E
[0001f3ee] 302f 0036                 move.w     54(a7),d0
[0001f3f2] 6100 f280                 bsr        snap
[0001f3f6] 3540 001e                 move.w     d0,30(a2)
[0001f3fa] 3940 01c4                 move.w     d0,452(a4)
[0001f3fe] 302f 0034                 move.w     52(a7),d0
[0001f402] 6100 f270                 bsr        snap
[0001f406] 3540 0020                 move.w     d0,32(a2)
[0001f40a] 3940 01c6                 move.w     d0,454(a4)
[0001f40e] 6000 042e                 bra        $0001F83E
[0001f412] 2f39 000e 692a            move.l     _globl,-(a7)
[0001f418] 3f04                      move.w     d4,-(a7)
[0001f41a] 3f03                      move.w     d3,-(a7)
[0001f41c] 3f2f 0038                 move.w     56(a7),-(a7)
[0001f420] 3f2f 003c                 move.w     60(a7),-(a7)
[0001f424] 302f 003c                 move.w     60(a7),d0
[0001f428] d06a 001c                 add.w      28(a2),d0
[0001f42c] 3f00                      move.w     d0,-(a7)
[0001f42e] 43ef 0042                 lea.l      66(a7),a1
[0001f432] 41ef 0044                 lea.l      68(a7),a0
[0001f436] 342f 0040                 move.w     64(a7),d2
[0001f43a] d46a 001a                 add.w      26(a2),d2
[0001f43e] 322a 0020                 move.w     32(a2),d1
[0001f442] 302a 001e                 move.w     30(a2),d0
[0001f446] 4eb9 0007 a6ce            jsr        mt_graf_dragbox
[0001f44c] 4fef 000e                 lea.l      14(a7),a7
[0001f450] 302f 0036                 move.w     54(a7),d0
[0001f454] 906f 0032                 sub.w      50(a7),d0
[0001f458] 6100 f21a                 bsr        snap
[0001f45c] 3540 001a                 move.w     d0,26(a2)
[0001f460] 3940 01c0                 move.w     d0,448(a4)
[0001f464] 302f 0034                 move.w     52(a7),d0
[0001f468] 906f 0030                 sub.w      48(a7),d0
[0001f46c] 6100 f206                 bsr        snap
[0001f470] 3540 001c                 move.w     d0,28(a2)
[0001f474] 3940 01c2                 move.w     d0,450(a4)
[0001f478] 6000 03c4                 bra        $0001F83E
[0001f47c] 3aaa 0012                 move.w     18(a2),(a5)
[0001f480] 3b6a 0014 0002            move.w     20(a2),2(a5)
[0001f486] 3b6a 0016 0004            move.w     22(a2),4(a5)
[0001f48c] 3b6a 0018 0006            move.w     24(a2),6(a5)
[0001f492] 3205                      move.w     d5,d1
[0001f494] 3006                      move.w     d6,d0
[0001f496] 204d                      movea.l    a5,a0
[0001f498] 4eb9 0006 b7a6            jsr        Aob_within
[0001f49e] 4a40                      tst.w      d0
[0001f4a0] 6700 038c                 beq        $0001F82E
[0001f4a4] 3205                      move.w     d5,d1
[0001f4a6] 3006                      move.w     d6,d0
[0001f4a8] 224d                      movea.l    a5,a1
[0001f4aa] 204c                      movea.l    a4,a0
[0001f4ac] 6100 fcea                 bsr        control
[0001f4b0] 5340                      subq.w     #1,d0
[0001f4b2] 6700 007c                 beq.w      $0001F530
[0001f4b6] 5340                      subq.w     #1,d0
[0001f4b8] 6704                      beq.s      $0001F4BE
[0001f4ba] 6000 0382                 bra        $0001F83E
[0001f4be] 3003                      move.w     d3,d0
[0001f4c0] 906a 0012                 sub.w      18(a2),d0
[0001f4c4] d07c ff40                 add.w      #$FF40,d0
[0001f4c8] 4a40                      tst.w      d0
[0001f4ca] 6f02                      ble.s      $0001F4CE
[0001f4cc] 9640                      sub.w      d0,d3
[0001f4ce] 3004                      move.w     d4,d0
[0001f4d0] 906a 0014                 sub.w      20(a2),d0
[0001f4d4] d07c ff40                 add.w      #$FF40,d0
[0001f4d8] 4a40                      tst.w      d0
[0001f4da] 6f02                      ble.s      $0001F4DE
[0001f4dc] 9840                      sub.w      d0,d4
[0001f4de] 3004                      move.w     d4,d0
[0001f4e0] 906a 0014                 sub.w      20(a2),d0
[0001f4e4] 3f00                      move.w     d0,-(a7)
[0001f4e6] 3203                      move.w     d3,d1
[0001f4e8] 926a 0012                 sub.w      18(a2),d1
[0001f4ec] 3f01                      move.w     d1,-(a7)
[0001f4ee] 7408                      moveq.l    #8,d2
[0001f4f0] 3f02                      move.w     d2,-(a7)
[0001f4f2] 43ef 003a                 lea.l      58(a7),a1
[0001f4f6] 41ef 003c                 lea.l      60(a7),a0
[0001f4fa] 322f 0036                 move.w     54(a7),d1
[0001f4fe] d26a 0014                 add.w      20(a2),d1
[0001f502] 302f 0038                 move.w     56(a7),d0
[0001f506] d06a 0012                 add.w      18(a2),d0
[0001f50a] 7410                      moveq.l    #16,d2
[0001f50c] 4eb9 0001 596a            jsr        A_rubberbox
[0001f512] 5c4f                      addq.w     #6,a7
[0001f514] 4a40                      tst.w      d0
[0001f516] 6700 0326                 beq        $0001F83E
[0001f51a] 322f 0034                 move.w     52(a7),d1
[0001f51e] 302f 0036                 move.w     54(a7),d0
[0001f522] 2053                      movea.l    (a3),a0
[0001f524] 2068 0258                 movea.l    600(a0),a0
[0001f528] 6100 f346                 bsr        edic_resize
[0001f52c] 6000 0310                 bra        $0001F83E
[0001f530] 2053                      movea.l    (a3),a0
[0001f532] 0c68 0002 02ca            cmpi.w     #$0002,714(a0)
[0001f538] 6600 028c                 bne        $0001F7C6
[0001f53c] 2268 0258                 movea.l    600(a0),a1
[0001f540] 2a51                      movea.l    (a1),a5
[0001f542] 206d 0008                 movea.l    8(a5),a0
[0001f546] 2468 018c                 movea.l    396(a0),a2
[0001f54a] 3a2a 0016                 move.w     22(a2),d5
[0001f54e] 3c2a 0018                 move.w     24(a2),d6
[0001f552] 3206                      move.w     d6,d1
[0001f554] 3005                      move.w     d5,d0
[0001f556] 4eb9 0005 4b6e            jsr        Abp_create
[0001f55c] 2f48 0014                 move.l     a0,20(a7)
[0001f560] 2008                      move.l     a0,d0
[0001f562] 6700 02f0                 beq        $0001F854
[0001f566] 2253                      movea.l    (a3),a1
[0001f568] 2069 023c                 movea.l    572(a1),a0
[0001f56c] 3228 000e                 move.w     14(a0),d1
[0001f570] c27c 0800                 and.w      #$0800,d1
[0001f574] 664a                      bne.s      $0001F5C0
[0001f576] 2ead 0010                 move.l     16(a5),(a7)
[0001f57a] 3f45 0004                 move.w     d5,4(a7)
[0001f57e] 740f                      moveq.l    #15,d2
[0001f580] d445                      add.w      d5,d2
[0001f582] c47c fff0                 and.w      #$FFF0,d2
[0001f586] e842                      asr.w      #4,d2
[0001f588] 3f42 0008                 move.w     d2,8(a7)
[0001f58c] 3f46 0006                 move.w     d6,6(a7)
[0001f590] 3f7c 0001 000c            move.w     #$0001,12(a7)
[0001f596] 4247                      clr.w      d7
[0001f598] 3f47 0012                 move.w     d7,18(a7)
[0001f59c] 3f47 0010                 move.w     d7,16(a7)
[0001f5a0] 3f47 000e                 move.w     d7,14(a7)
[0001f5a4] 3f47 000a                 move.w     d7,10(a7)
[0001f5a8] 70ff                      moveq.l    #-1,d0
[0001f5aa] d045                      add.w      d5,d0
[0001f5ac] 3f40 002c                 move.w     d0,44(a7)
[0001f5b0] 3f40 0024                 move.w     d0,36(a7)
[0001f5b4] 72ff                      moveq.l    #-1,d1
[0001f5b6] d246                      add.w      d6,d1
[0001f5b8] 3f41 002e                 move.w     d1,46(a7)
[0001f5bc] 3f41 0026                 move.w     d1,38(a7)
[0001f5c0] 7e0f                      moveq.l    #15,d7
[0001f5c2] de45                      add.w      d5,d7
[0001f5c4] ce7c fff0                 and.w      #$FFF0,d7
[0001f5c8] cfc6                      muls.w     d6,d7
[0001f5ca] 48c7                      ext.l      d7
[0001f5cc] e687                      asr.l      #3,d7
[0001f5ce] 2053                      movea.l    (a3),a0
[0001f5d0] 3028 001c                 move.w     28(a0),d0
[0001f5d4] 5340                      subq.w     #1,d0
[0001f5d6] 6700 00de                 beq        $0001F6B6
[0001f5da] 5740                      subq.w     #3,d0
[0001f5dc] 6700 0084                 beq        $0001F662
[0001f5e0] 5940                      subq.w     #4,d0
[0001f5e2] 6704                      beq.s      $0001F5E8
[0001f5e4] 6000 00e4                 bra        $0001F6CA
[0001f5e8] 0c6d 0008 002e            cmpi.w     #$0008,46(a5)
[0001f5ee] 6640                      bne.s      $0001F630
[0001f5f0] e98f                      lsl.l      #4,d7
[0001f5f2] 7001                      moveq.l    #1,d0
[0001f5f4] 2053                      movea.l    (a3),a0
[0001f5f6] 2268 025c                 movea.l    604(a0),a1
[0001f5fa] c069 018a                 and.w      394(a1),d0
[0001f5fe] 671a                      beq.s      $0001F61A
[0001f600] 222d 0038                 move.l     56(a5),d1
[0001f604] 6714                      beq.s      $0001F61A
[0001f606] 2241                      movea.l    d1,a1
[0001f608] 206f 0014                 movea.l    20(a7),a0
[0001f60c] 2050                      movea.l    (a0),a0
[0001f60e] 2007                      move.l     d7,d0
[0001f610] 4eb9 0008 3500            jsr        memcpy
[0001f616] 6000 00c0                 bra        $0001F6D8
[0001f61a] 2007                      move.l     d7,d0
[0001f61c] 226d 0030                 movea.l    48(a5),a1
[0001f620] 206f 0014                 movea.l    20(a7),a0
[0001f624] 2050                      movea.l    (a0),a0
[0001f626] 4eb9 0008 3500            jsr        memcpy
[0001f62c] 6000 00aa                 bra        $0001F6D8
[0001f630] 2053                      movea.l    (a3),a0
[0001f632] 2268 023c                 movea.l    572(a0),a1
[0001f636] 3029 000e                 move.w     14(a1),d0
[0001f63a] c07c 0800                 and.w      #$0800,d0
[0001f63e] 6600 0076                 bne.w      $0001F6B6
[0001f642] 2f2f 0014                 move.l     20(a7),-(a7)
[0001f646] 43ef 0004                 lea.l      4(a7),a1
[0001f64a] 41ef 0024                 lea.l      36(a7),a0
[0001f64e] 7203                      moveq.l    #3,d1
[0001f650] 2c53                      movea.l    (a3),a6
[0001f652] 302e 0010                 move.w     16(a6),d0
[0001f656] 4eb9 0007 489e            jsr        vro_cpyfm
[0001f65c] 584f                      addq.w     #4,a7
[0001f65e] 6000 0078                 bra.w      $0001F6D8
[0001f662] 0c6d 0004 0018            cmpi.w     #$0004,24(a5)
[0001f668] 663c                      bne.s      $0001F6A6
[0001f66a] e58f                      lsl.l      #2,d7
[0001f66c] 7001                      moveq.l    #1,d0
[0001f66e] 2053                      movea.l    (a3),a0
[0001f670] 2268 025c                 movea.l    604(a0),a1
[0001f674] c069 018a                 and.w      394(a1),d0
[0001f678] 6718                      beq.s      $0001F692
[0001f67a] 222d 0022                 move.l     34(a5),d1
[0001f67e] 6712                      beq.s      $0001F692
[0001f680] 2241                      movea.l    d1,a1
[0001f682] 2c6f 0014                 movea.l    20(a7),a6
[0001f686] 2056                      movea.l    (a6),a0
[0001f688] 2007                      move.l     d7,d0
[0001f68a] 4eb9 0008 3500            jsr        memcpy
[0001f690] 6046                      bra.s      $0001F6D8
[0001f692] 2007                      move.l     d7,d0
[0001f694] 226d 001a                 movea.l    26(a5),a1
[0001f698] 206f 0014                 movea.l    20(a7),a0
[0001f69c] 2050                      movea.l    (a0),a0
[0001f69e] 4eb9 0008 3500            jsr        memcpy
[0001f6a4] 6032                      bra.s      $0001F6D8
[0001f6a6] 2053                      movea.l    (a3),a0
[0001f6a8] 2268 023c                 movea.l    572(a0),a1
[0001f6ac] 3029 000e                 move.w     14(a1),d0
[0001f6b0] c07c 0800                 and.w      #$0800,d0
[0001f6b4] 678c                      beq.s      $0001F642
[0001f6b6] 2007                      move.l     d7,d0
[0001f6b8] 226d 0010                 movea.l    16(a5),a1
[0001f6bc] 206f 0014                 movea.l    20(a7),a0
[0001f6c0] 2050                      movea.l    (a0),a0
[0001f6c2] 4eb9 0008 3500            jsr        memcpy
[0001f6c8] 600e                      bra.s      $0001F6D8
[0001f6ca] 206f 0014                 movea.l    20(a7),a0
[0001f6ce] 4eb9 0005 4c04            jsr        Abp_delete
[0001f6d4] 6000 017e                 bra        $0001F854
[0001f6d8] 2053                      movea.l    (a3),a0
[0001f6da] 2268 023c                 movea.l    572(a0),a1
[0001f6de] 3029 000e                 move.w     14(a1),d0
[0001f6e2] c07c 0800                 and.w      #$0800,d0
[0001f6e6] 6618                      bne.s      $0001F700
[0001f6e8] 2a6f 0014                 movea.l    20(a7),a5
[0001f6ec] 426d 000a                 clr.w      10(a5)
[0001f6f0] 224d                      movea.l    a5,a1
[0001f6f2] 204d                      movea.l    a5,a0
[0001f6f4] 2c53                      movea.l    (a3),a6
[0001f6f6] 302e 0010                 move.w     16(a6),d0
[0001f6fa] 4eb9 0007 4978            jsr        vr_trnfm
[0001f700] 206f 0014                 movea.l    20(a7),a0
[0001f704] 317c 0001 000a            move.w     #$0001,10(a0)
[0001f70a] 2253                      movea.l    (a3),a1
[0001f70c] 2a69 025c                 movea.l    604(a1),a5
[0001f710] 026d ff7f 01d0            andi.w     #$FF7F,464(a5)
[0001f716] 2253                      movea.l    (a3),a1
[0001f718] 2a69 025c                 movea.l    604(a1),a5
[0001f71c] 302d 0190                 move.w     400(a5),d0
[0001f720] d06a 0012                 add.w      18(a2),d0
[0001f724] 3b40 01d8                 move.w     d0,472(a5)
[0001f728] 2253                      movea.l    (a3),a1
[0001f72a] 2a69 025c                 movea.l    604(a1),a5
[0001f72e] 322d 0192                 move.w     402(a5),d1
[0001f732] d26a 0014                 add.w      20(a2),d1
[0001f736] 3b41 01da                 move.w     d1,474(a5)
[0001f73a] 2253                      movea.l    (a3),a1
[0001f73c] 2a69 025c                 movea.l    604(a1),a5
[0001f740] 3b45 01dc                 move.w     d5,476(a5)
[0001f744] 2253                      movea.l    (a3),a1
[0001f746] 2a69 025c                 movea.l    604(a1),a5
[0001f74a] 3b46 01de                 move.w     d6,478(a5)
[0001f74e] 2253                      movea.l    (a3),a1
[0001f750] 2a69 025c                 movea.l    604(a1),a5
[0001f754] 2b48 01ec                 move.l     a0,492(a5)
[0001f758] 7013                      moveq.l    #19,d0
[0001f75a] 2253                      movea.l    (a3),a1
[0001f75c] 2069 0258                 movea.l    600(a1),a0
[0001f760] 4eb9 0004 7e6a            jsr        Adr_add
[0001f766] 2053                      movea.l    (a3),a0
[0001f768] 3228 0264                 move.w     612(a0),d1
[0001f76c] 3028 0262                 move.w     610(a0),d0
[0001f770] 4eb9 0004 9140            jsr        Adr_drag
[0001f776] 7013                      moveq.l    #19,d0
[0001f778] 2053                      movea.l    (a3),a0
[0001f77a] 2068 0258                 movea.l    600(a0),a0
[0001f77e] 4eb9 0004 7f76            jsr        Adr_del
[0001f784] 206f 0014                 movea.l    20(a7),a0
[0001f788] 4eb9 0005 4c04            jsr        Abp_delete
[0001f78e] 2053                      movea.l    (a3),a0
[0001f790] 2268 025c                 movea.l    604(a0),a1
[0001f794] 0069 0080 01d0            ori.w      #$0080,464(a1)
[0001f79a] 4240                      clr.w      d0
[0001f79c] 2053                      movea.l    (a3),a0
[0001f79e] 2268 025c                 movea.l    604(a0),a1
[0001f7a2] 3340 01de                 move.w     d0,478(a1)
[0001f7a6] 2053                      movea.l    (a3),a0
[0001f7a8] 2268 025c                 movea.l    604(a0),a1
[0001f7ac] 3340 01dc                 move.w     d0,476(a1)
[0001f7b0] 2053                      movea.l    (a3),a0
[0001f7b2] 2268 025c                 movea.l    604(a0),a1
[0001f7b6] 3340 01da                 move.w     d0,474(a1)
[0001f7ba] 2053                      movea.l    (a3),a0
[0001f7bc] 2268 025c                 movea.l    604(a0),a1
[0001f7c0] 3340 01d8                 move.w     d0,472(a1)
[0001f7c4] 6078                      bra.s      $0001F83E
[0001f7c6] 2f39 000e 692a            move.l     _globl,-(a7)
[0001f7cc] 3f04                      move.w     d4,-(a7)
[0001f7ce] 3f03                      move.w     d3,-(a7)
[0001f7d0] 3f2f 0038                 move.w     56(a7),-(a7)
[0001f7d4] 3f2f 003c                 move.w     60(a7),-(a7)
[0001f7d8] 302f 003c                 move.w     60(a7),d0
[0001f7dc] d06a 0014                 add.w      20(a2),d0
[0001f7e0] 3f00                      move.w     d0,-(a7)
[0001f7e2] 43ef 0042                 lea.l      66(a7),a1
[0001f7e6] 41ef 0044                 lea.l      68(a7),a0
[0001f7ea] 342f 0040                 move.w     64(a7),d2
[0001f7ee] d46a 0012                 add.w      18(a2),d2
[0001f7f2] 322a 0018                 move.w     24(a2),d1
[0001f7f6] 302a 0016                 move.w     22(a2),d0
[0001f7fa] 4eb9 0007 a6ce            jsr        mt_graf_dragbox
[0001f800] 4fef 000e                 lea.l      14(a7),a7
[0001f804] 302f 0036                 move.w     54(a7),d0
[0001f808] 906f 0032                 sub.w      50(a7),d0
[0001f80c] 6100 ee66                 bsr        snap
[0001f810] 3540 0012                 move.w     d0,18(a2)
[0001f814] 3940 01c0                 move.w     d0,448(a4)
[0001f818] 302f 0034                 move.w     52(a7),d0
[0001f81c] 906f 0030                 sub.w      48(a7),d0
[0001f820] 6100 ee52                 bsr        snap
[0001f824] 3540 0014                 move.w     d0,20(a2)
[0001f828] 3940 01c2                 move.w     d0,450(a4)
[0001f82c] 6010                      bra.s      $0001F83E
[0001f82e] 303c 0080                 move.w     #$0080,d0
[0001f832] c06c 01b8                 and.w      440(a4),d0
[0001f836] 661c                      bne.s      $0001F854
[0001f838] 006c 0080 01b8            ori.w      #$0080,440(a4)
[0001f83e] 72ff                      moveq.l    #-1,d1
[0001f840] 700e                      moveq.l    #14,d0
[0001f842] 2053                      movea.l    (a3),a0
[0001f844] 2068 0258                 movea.l    600(a0),a0
[0001f848] 2253                      movea.l    (a3),a1
[0001f84a] 2469 0258                 movea.l    600(a1),a2
[0001f84e] 226a 0066                 movea.l    102(a2),a1
[0001f852] 4e91                      jsr        (a1)
[0001f854] 4fef 0038                 lea.l      56(a7),a7
[0001f858] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0001f85c] 4e75                      rts
edic_nextcol:
[0001f85e] 2f0a                      move.l     a2,-(a7)
[0001f860] 2450                      movea.l    (a0),a2
[0001f862] 7002                      moveq.l    #2,d0
[0001f864] 322a 0018                 move.w     24(a2),d1
[0001f868] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f86e] b268 001c                 cmp.w      28(a0),d1
[0001f872] 6602                      bne.s      $0001F876
[0001f874] 7010                      moveq.l    #16,d0
[0001f876] 322a 002e                 move.w     46(a2),d1
[0001f87a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f880] b268 001c                 cmp.w      28(a0),d1
[0001f884] 6604                      bne.s      $0001F88A
[0001f886] 303c 0100                 move.w     #$0100,d0
[0001f88a] 206a 000c                 movea.l    12(a2),a0
[0001f88e] 3228 02b4                 move.w     692(a0),d1
[0001f892] 5141                      subq.w     #8,d1
[0001f894] 670a                      beq.s      $0001F8A0
[0001f896] 5341                      subq.w     #1,d1
[0001f898] 673c                      beq.s      $0001F8D6
[0001f89a] 5341                      subq.w     #1,d1
[0001f89c] 6732                      beq.s      $0001F8D0
[0001f89e] 603e                      bra.s      $0001F8DE
[0001f8a0] 526a 0044                 addq.w     #1,68(a2)
[0001f8a4] b06a 0044                 cmp.w      68(a2),d0
[0001f8a8] 6f1a                      ble.s      $0001F8C4
[0001f8aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f8b0] 2068 023c                 movea.l    572(a0),a0
[0001f8b4] 41e8 003e                 lea.l      62(a0),a0
[0001f8b8] 4eb9 0004 ee3c            jsr        Amo_new
[0001f8be] 6100 ebfe                 bsr        edic_black0
[0001f8c2] 601a                      bra.s      $0001F8DE
[0001f8c4] 357c ffff 0044            move.w     #$FFFF,68(a2)
[0001f8ca] 6100 ed1a                 bsr        edic_invisible
[0001f8ce] 600e                      bra.s      $0001F8DE
[0001f8d0] 6100 ecd2                 bsr        edic_white
[0001f8d4] 6008                      bra.s      $0001F8DE
[0001f8d6] 357c 0001 0044            move.w     #$0001,68(a2)
[0001f8dc] 60e0                      bra.s      $0001F8BE
[0001f8de] 245f                      movea.l    (a7)+,a2
[0001f8e0] 4e75                      rts
edic_set:
[0001f8e2] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0001f8e6] 4fef ff9c                 lea.l      -100(a7),a7
[0001f8ea] 4bf9 000b 0e30            lea.l      brush,a5
[0001f8f0] 41ed 0024                 lea.l      36(a5),a0
[0001f8f4] 43ef 0014                 lea.l      20(a7),a1
[0001f8f8] 12d8                      move.b     (a0)+,(a1)+
[0001f8fa] 12d8                      move.b     (a0)+,(a1)+
[0001f8fc] 12d8                      move.b     (a0)+,(a1)+
[0001f8fe] 12d8                      move.b     (a0)+,(a1)+
[0001f900] 41ed 0028                 lea.l      40(a5),a0
[0001f904] 43ef 0010                 lea.l      16(a7),a1
[0001f908] 12d8                      move.b     (a0)+,(a1)+
[0001f90a] 12d8                      move.b     (a0)+,(a1)+
[0001f90c] 12d8                      move.b     (a0)+,(a1)+
[0001f90e] 12d8                      move.b     (a0)+,(a1)+
[0001f910] 49f9 0010 ee4e            lea.l      ACSblk,a4
[0001f916] 2054                      movea.l    (a4),a0
[0001f918] 2f68 0258 004c            move.l     600(a0),76(a7)
[0001f91e] 226f 004c                 movea.l    76(a7),a1
[0001f922] 2f51 0060                 move.l     (a1),96(a7)
[0001f926] 2f69 0014 0044            move.l     20(a1),68(a7)
[0001f92c] 3628 0260                 move.w     608(a0),d3
[0001f930] 3203                      move.w     d3,d1
[0001f932] 48c1                      ext.l      d1
[0001f934] 2001                      move.l     d1,d0
[0001f936] d080                      add.l      d0,d0
[0001f938] d081                      add.l      d1,d0
[0001f93a] e788                      lsl.l      #3,d0
[0001f93c] 226f 0044                 movea.l    68(a7),a1
[0001f940] 3431 080a                 move.w     10(a1,d0.l),d2
[0001f944] c47c 4000                 and.w      #$4000,d2
[0001f948] 670c                      beq.s      $0001F956
[0001f94a] 206f 004c                 movea.l    76(a7),a0
[0001f94e] 6100 ff0e                 bsr        edic_nextcol
[0001f952] 6000 03c2                 bra        $0001FD16
[0001f956] 206f 0060                 movea.l    96(a7),a0
[0001f95a] 2268 0008                 movea.l    8(a0),a1
[0001f95e] 2669 018c                 movea.l    396(a1),a3
[0001f962] 4869 0180                 pea.l      384(a1)
[0001f966] 2f08                      move.l     a0,-(a7)
[0001f968] 43ef 0024                 lea.l      36(a7),a1
[0001f96c] 41ef 0038                 lea.l      56(a7),a0
[0001f970] 6100 e868                 bsr        mfdb_dm
[0001f974] 504f                      addq.w     #8,a7
[0001f976] 2054                      movea.l    (a4),a0
[0001f978] 2268 023c                 movea.l    572(a0),a1
[0001f97c] 3029 000e                 move.w     14(a1),d0
[0001f980] c07c 0800                 and.w      #$0800,d0
[0001f984] 6716                      beq.s      $0001F99C
[0001f986] 322f 0036                 move.w     54(a7),d1
[0001f98a] 302f 0034                 move.w     52(a7),d0
[0001f98e] 4eb9 0005 4b6e            jsr        Abp_create
[0001f994] 2f48 0018                 move.l     a0,24(a7)
[0001f998] 6700 037c                 beq        $0001FD16
[0001f99c] 206f 0060                 movea.l    96(a7),a0
[0001f9a0] 3f68 0044 0014            move.w     68(a0),20(a7)
[0001f9a6] 2254                      movea.l    (a4),a1
[0001f9a8] 3f69 0262 005e            move.w     610(a1),94(a7)
[0001f9ae] 3f69 0264 005c            move.w     612(a1),92(a7)
[0001f9b4] 2f39 000e 692a            move.l     _globl,-(a7)
[0001f9ba] 486f 005c                 pea.l      92(a7)
[0001f9be] 43ef 0062                 lea.l      98(a7),a1
[0001f9c2] 3003                      move.w     d3,d0
[0001f9c4] 206f 004c                 movea.l    76(a7),a0
[0001f9c8] 4eb9 0007 9d14            jsr        mt_objc_offset
[0001f9ce] 504f                      addq.w     #8,a7
[0001f9d0] 76ff                      moveq.l    #-1,d3
[0001f9d2] 3803                      move.w     d3,d4
[0001f9d4] 302f 005e                 move.w     94(a7),d0
[0001f9d8] 206f 004c                 movea.l    76(a7),a0
[0001f9dc] 9068 0034                 sub.w      52(a0),d0
[0001f9e0] 906f 005a                 sub.w      90(a7),d0
[0001f9e4] 48c0                      ext.l      d0
[0001f9e6] 81fc 0008                 divs.w     #$0008,d0
[0001f9ea] 3f40 005e                 move.w     d0,94(a7)
[0001f9ee] 322f 005c                 move.w     92(a7),d1
[0001f9f2] 9268 0036                 sub.w      54(a0),d1
[0001f9f6] 926f 0058                 sub.w      88(a7),d1
[0001f9fa] 48c1                      ext.l      d1
[0001f9fc] 83fc 0008                 divs.w     #$0008,d1
[0001fa00] 3f41 005c                 move.w     d1,92(a7)
[0001fa04] b840                      cmp.w      d0,d4
[0001fa06] 6606                      bne.s      $0001FA0E
[0001fa08] b641                      cmp.w      d1,d3
[0001fa0a] 6700 02be                 beq        $0001FCCA
[0001fa0e] 302f 005e                 move.w     94(a7),d0
[0001fa12] e748                      lsl.w      #3,d0
[0001fa14] 206f 004c                 movea.l    76(a7),a0
[0001fa18] d068 0034                 add.w      52(a0),d0
[0001fa1c] d06f 005a                 add.w      90(a7),d0
[0001fa20] 3f40 0050                 move.w     d0,80(a7)
[0001fa24] 322f 005c                 move.w     92(a7),d1
[0001fa28] e749                      lsl.w      #3,d1
[0001fa2a] d268 0036                 add.w      54(a0),d1
[0001fa2e] d26f 0058                 add.w      88(a7),d1
[0001fa32] 3f41 0052                 move.w     d1,82(a7)
[0001fa36] 7408                      moveq.l    #8,d2
[0001fa38] 3f42 0056                 move.w     d2,86(a7)
[0001fa3c] 3f42 0054                 move.w     d2,84(a7)
[0001fa40] 226f 0060                 movea.l    96(a7),a1
[0001fa44] 2069 000c                 movea.l    12(a1),a0
[0001fa48] 0c68 0008 0044            cmpi.w     #$0008,68(a0)
[0001fa4e] 6612                      bne.s      $0001FA62
[0001fa50] 7001                      moveq.l    #1,d0
[0001fa52] 3f40 0006                 move.w     d0,6(a7)
[0001fa56] 3f40 0004                 move.w     d0,4(a7)
[0001fa5a] 3f40 0002                 move.w     d0,2(a7)
[0001fa5e] 3e80                      move.w     d0,(a7)
[0001fa60] 6026                      bra.s      $0001FA88
[0001fa62] 4240                      clr.w      d0
[0001fa64] 3f40 0002                 move.w     d0,2(a7)
[0001fa68] 3e80                      move.w     d0,(a7)
[0001fa6a] 7202                      moveq.l    #2,d1
[0001fa6c] 3f41 0006                 move.w     d1,6(a7)
[0001fa70] 3f41 0004                 move.w     d1,4(a7)
[0001fa74] 516f 0050                 subq.w     #8,80(a7)
[0001fa78] 516f 0052                 subq.w     #8,82(a7)
[0001fa7c] 066f 0010 0054            addi.w     #$0010,84(a7)
[0001fa82] 066f 0010 0056            addi.w     #$0010,86(a7)
[0001fa88] 302f 005e                 move.w     94(a7),d0
[0001fa8c] 6b00 026e                 bmi        $0001FCFC
[0001fa90] 322f 005c                 move.w     92(a7),d1
[0001fa94] 6b00 0266                 bmi        $0001FCFC
[0001fa98] b06b 0016                 cmp.w      22(a3),d0
[0001fa9c] 6c00 025e                 bge        $0001FCFC
[0001faa0] b26b 0018                 cmp.w      24(a3),d1
[0001faa4] 6c00 0256                 bge        $0001FCFC
[0001faa8] d057                      add.w      (a7),d0
[0001faaa] 5340                      subq.w     #1,d0
[0001faac] 3f40 0008                 move.w     d0,8(a7)
[0001fab0] d26f 0002                 add.w      2(a7),d1
[0001fab4] 5341                      subq.w     #1,d1
[0001fab6] 3f41 000a                 move.w     d1,10(a7)
[0001faba] 302f 005e                 move.w     94(a7),d0
[0001fabe] d06f 0004                 add.w      4(a7),d0
[0001fac2] 5340                      subq.w     #1,d0
[0001fac4] 3f40 000c                 move.w     d0,12(a7)
[0001fac8] 322f 005c                 move.w     92(a7),d1
[0001facc] d26f 0006                 add.w      6(a7),d1
[0001fad0] 5341                      subq.w     #1,d1
[0001fad2] 3f41 000e                 move.w     d1,14(a7)
[0001fad6] 302f 0008                 move.w     8(a7),d0
[0001fada] 6a06                      bpl.s      $0001FAE2
[0001fadc] 9157                      sub.w      d0,(a7)
[0001fade] 426f 0008                 clr.w      8(a7)
[0001fae2] 302f 000a                 move.w     10(a7),d0
[0001fae6] 6a08                      bpl.s      $0001FAF0
[0001fae8] 916f 0002                 sub.w      d0,2(a7)
[0001faec] 426f 000a                 clr.w      10(a7)
[0001faf0] 302f 000c                 move.w     12(a7),d0
[0001faf4] b06b 0016                 cmp.w      22(a3),d0
[0001faf8] 6d14                      blt.s      $0001FB0E
[0001fafa] 906b 0016                 sub.w      22(a3),d0
[0001fafe] 5240                      addq.w     #1,d0
[0001fb00] 916f 0004                 sub.w      d0,4(a7)
[0001fb04] 70ff                      moveq.l    #-1,d0
[0001fb06] d06b 0016                 add.w      22(a3),d0
[0001fb0a] 3f40 000c                 move.w     d0,12(a7)
[0001fb0e] 302f 000e                 move.w     14(a7),d0
[0001fb12] b06b 0018                 cmp.w      24(a3),d0
[0001fb16] 6d14                      blt.s      $0001FB2C
[0001fb18] 906b 0018                 sub.w      24(a3),d0
[0001fb1c] 5240                      addq.w     #1,d0
[0001fb1e] 916f 0006                 sub.w      d0,6(a7)
[0001fb22] 70ff                      moveq.l    #-1,d0
[0001fb24] d06b 0018                 add.w      24(a3),d0
[0001fb28] 3f40 000e                 move.w     d0,14(a7)
[0001fb2c] 2054                      movea.l    (a4),a0
[0001fb2e] 2268 023c                 movea.l    572(a0),a1
[0001fb32] 3029 000e                 move.w     14(a1),d0
[0001fb36] c07c 0800                 and.w      #$0800,d0
[0001fb3a] 6700 00dc                 beq        $0001FC18
[0001fb3e] 3228 001c                 move.w     28(a0),d1
[0001fb42] b26f 003c                 cmp.w      60(a7),d1
[0001fb46] 6600 00d0                 bne        $0001FC18
[0001fb4a] 41ef 0030                 lea.l      48(a7),a0
[0001fb4e] 2254                      movea.l    (a4),a1
[0001fb50] 3029 0010                 move.w     16(a1),d0
[0001fb54] 226f 0018                 movea.l    24(a7),a1
[0001fb58] 4eb9 0007 4978            jsr        vr_trnfm
[0001fb5e] 206f 0060                 movea.l    96(a7),a0
[0001fb62] 3028 0044                 move.w     68(a0),d0
[0001fb66] 6b3a                      bmi.s      $0001FBA2
[0001fb68] 486f 0014                 pea.l      20(a7)
[0001fb6c] 2f2f 001c                 move.l     28(a7),-(a7)
[0001fb70] 224d                      movea.l    a5,a1
[0001fb72] 41ef 0008                 lea.l      8(a7),a0
[0001fb76] 7201                      moveq.l    #1,d1
[0001fb78] 2454                      movea.l    (a4),a2
[0001fb7a] 302a 0010                 move.w     16(a2),d0
[0001fb7e] 4eb9 0007 4902            jsr        vrt_cpyfm
[0001fb84] 504f                      addq.w     #8,a7
[0001fb86] 486f 001c                 pea.l      28(a7)
[0001fb8a] 224d                      movea.l    a5,a1
[0001fb8c] 41ef 0004                 lea.l      4(a7),a0
[0001fb90] 720f                      moveq.l    #15,d1
[0001fb92] 2454                      movea.l    (a4),a2
[0001fb94] 302a 0010                 move.w     16(a2),d0
[0001fb98] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fb9e] 584f                      addq.w     #4,a7
[0001fba0] 605e                      bra.s      $0001FC00
[0001fba2] 206f 0018                 movea.l    24(a7),a0
[0001fba6] 0c68 0001 000c            cmpi.w     #$0001,12(a0)
[0001fbac] 661a                      bne.s      $0001FBC8
[0001fbae] 2f08                      move.l     a0,-(a7)
[0001fbb0] 224d                      movea.l    a5,a1
[0001fbb2] 41ef 0004                 lea.l      4(a7),a0
[0001fbb6] 4241                      clr.w      d1
[0001fbb8] 2454                      movea.l    (a4),a2
[0001fbba] 302a 0010                 move.w     16(a2),d0
[0001fbbe] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fbc4] 584f                      addq.w     #4,a7
[0001fbc6] 601e                      bra.s      $0001FBE6
[0001fbc8] 486f 0010                 pea.l      16(a7)
[0001fbcc] 2f2f 001c                 move.l     28(a7),-(a7)
[0001fbd0] 224d                      movea.l    a5,a1
[0001fbd2] 41ef 0008                 lea.l      8(a7),a0
[0001fbd6] 7201                      moveq.l    #1,d1
[0001fbd8] 2454                      movea.l    (a4),a2
[0001fbda] 302a 0010                 move.w     16(a2),d0
[0001fbde] 4eb9 0007 4902            jsr        vrt_cpyfm
[0001fbe4] 504f                      addq.w     #8,a7
[0001fbe6] 486f 001c                 pea.l      28(a7)
[0001fbea] 224d                      movea.l    a5,a1
[0001fbec] 41ef 0004                 lea.l      4(a7),a0
[0001fbf0] 4241                      clr.w      d1
[0001fbf2] 2454                      movea.l    (a4),a2
[0001fbf4] 302a 0010                 move.w     16(a2),d0
[0001fbf8] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fbfe] 584f                      addq.w     #4,a7
[0001fc00] 43ef 0030                 lea.l      48(a7),a1
[0001fc04] 206f 0018                 movea.l    24(a7),a0
[0001fc08] 2454                      movea.l    (a4),a2
[0001fc0a] 302a 0010                 move.w     16(a2),d0
[0001fc0e] 4eb9 0007 4978            jsr        vr_trnfm
[0001fc14] 6000 00a2                 bra        $0001FCB8
[0001fc18] 206f 0060                 movea.l    96(a7),a0
[0001fc1c] 3028 0044                 move.w     68(a0),d0
[0001fc20] 6b3a                      bmi.s      $0001FC5C
[0001fc22] 486f 0014                 pea.l      20(a7)
[0001fc26] 486f 0034                 pea.l      52(a7)
[0001fc2a] 224d                      movea.l    a5,a1
[0001fc2c] 41ef 0008                 lea.l      8(a7),a0
[0001fc30] 7201                      moveq.l    #1,d1
[0001fc32] 2454                      movea.l    (a4),a2
[0001fc34] 302a 0010                 move.w     16(a2),d0
[0001fc38] 4eb9 0007 4902            jsr        vrt_cpyfm
[0001fc3e] 504f                      addq.w     #8,a7
[0001fc40] 486f 001c                 pea.l      28(a7)
[0001fc44] 224d                      movea.l    a5,a1
[0001fc46] 41ef 0004                 lea.l      4(a7),a0
[0001fc4a] 720f                      moveq.l    #15,d1
[0001fc4c] 2454                      movea.l    (a4),a2
[0001fc4e] 302a 0010                 move.w     16(a2),d0
[0001fc52] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fc58] 584f                      addq.w     #4,a7
[0001fc5a] 605c                      bra.s      $0001FCB8
[0001fc5c] 0c6f 0001 003c            cmpi.w     #$0001,60(a7)
[0001fc62] 661c                      bne.s      $0001FC80
[0001fc64] 486f 0030                 pea.l      48(a7)
[0001fc68] 224d                      movea.l    a5,a1
[0001fc6a] 41ef 0004                 lea.l      4(a7),a0
[0001fc6e] 4241                      clr.w      d1
[0001fc70] 2454                      movea.l    (a4),a2
[0001fc72] 302a 0010                 move.w     16(a2),d0
[0001fc76] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fc7c] 584f                      addq.w     #4,a7
[0001fc7e] 601e                      bra.s      $0001FC9E
[0001fc80] 486f 0010                 pea.l      16(a7)
[0001fc84] 486f 0034                 pea.l      52(a7)
[0001fc88] 224d                      movea.l    a5,a1
[0001fc8a] 41ef 0008                 lea.l      8(a7),a0
[0001fc8e] 7201                      moveq.l    #1,d1
[0001fc90] 2454                      movea.l    (a4),a2
[0001fc92] 302a 0010                 move.w     16(a2),d0
[0001fc96] 4eb9 0007 4902            jsr        vrt_cpyfm
[0001fc9c] 504f                      addq.w     #8,a7
[0001fc9e] 486f 001c                 pea.l      28(a7)
[0001fca2] 224d                      movea.l    a5,a1
[0001fca4] 41ef 0004                 lea.l      4(a7),a0
[0001fca8] 4241                      clr.w      d1
[0001fcaa] 2454                      movea.l    (a4),a2
[0001fcac] 302a 0010                 move.w     16(a2),d0
[0001fcb0] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fcb6] 584f                      addq.w     #4,a7
[0001fcb8] 43ef 0050                 lea.l      80(a7),a1
[0001fcbc] 206f 004c                 movea.l    76(a7),a0
[0001fcc0] 246f 004c                 movea.l    76(a7),a2
[0001fcc4] 246a 006a                 movea.l    106(a2),a2
[0001fcc8] 4e92                      jsr        (a2)
[0001fcca] 382f 005e                 move.w     94(a7),d4
[0001fcce] 362f 005c                 move.w     92(a7),d3
[0001fcd2] 2f39 000e 692a            move.l     _globl,-(a7)
[0001fcd8] 486f 004c                 pea.l      76(a7)
[0001fcdc] 486f 0052                 pea.l      82(a7)
[0001fce0] 43ef 0068                 lea.l      104(a7),a1
[0001fce4] 41ef 006a                 lea.l      106(a7),a0
[0001fce8] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0001fcee] 4fef 000c                 lea.l      12(a7),a7
[0001fcf2] 7001                      moveq.l    #1,d0
[0001fcf4] c06f 004a                 and.w      74(a7),d0
[0001fcf8] 6600 fcda                 bne        $0001F9D4
[0001fcfc] 2054                      movea.l    (a4),a0
[0001fcfe] 2268 023c                 movea.l    572(a0),a1
[0001fd02] 3029 000e                 move.w     14(a1),d0
[0001fd06] c07c 0800                 and.w      #$0800,d0
[0001fd0a] 670a                      beq.s      $0001FD16
[0001fd0c] 206f 0018                 movea.l    24(a7),a0
[0001fd10] 4eb9 0005 4c04            jsr        Abp_delete
[0001fd16] 4fef 0064                 lea.l      100(a7),a7
[0001fd1a] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0001fd1e] 4e75                      rts
edic_abort:
[0001fd20] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001fd26] 2068 0258                 movea.l    600(a0),a0
[0001fd2a] 4eb9 0002 1074            jsr        term
[0001fd30] 4e75                      rts
edic_ok:
[0001fd32] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001fd38] 2068 0258                 movea.l    600(a0),a0
[0001fd3c] 4eb9 0002 0b56            jsr        acc_icon
[0001fd42] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001fd48] 2068 0258                 movea.l    600(a0),a0
[0001fd4c] 4eb9 0002 1074            jsr        term
[0001fd52] 4e75                      rts
edic_newplane:
[0001fd54] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[0001fd58] 514f                      subq.w     #8,a7
[0001fd5a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001fd60] 2f68 0258 0004            move.l     600(a0),4(a7)
[0001fd66] 226f 0004                 movea.l    4(a7),a1
[0001fd6a] 2651                      movea.l    (a1),a3
[0001fd6c] 206b 0008                 movea.l    8(a3),a0
[0001fd70] 41e8 0180                 lea.l      384(a0),a0
[0001fd74] 2268 000c                 movea.l    12(a0),a1
[0001fd78] 7601                      moveq.l    #1,d3
[0001fd7a] c668 000a                 and.w      10(a0),d3
[0001fd7e] 700f                      moveq.l    #15,d0
[0001fd80] d069 0016                 add.w      22(a1),d0
[0001fd84] c07c fff0                 and.w      #$FFF0,d0
[0001fd88] 3800                      move.w     d0,d4
[0001fd8a] e644                      asr.w      #3,d4
[0001fd8c] c9e9 0018                 muls.w     24(a1),d4
[0001fd90] 48c4                      ext.l      d4
[0001fd92] 2004                      move.l     d4,d0
[0001fd94] 4eb9 0004 c608            jsr        Ax_malloc
[0001fd9a] 2e88                      move.l     a0,(a7)
[0001fd9c] 2008                      move.l     a0,d0
[0001fd9e] 6700 0166                 beq        $0001FF06
[0001fda2] 2204                      move.l     d4,d1
[0001fda4] 303c 00ff                 move.w     #$00FF,d0
[0001fda8] 4eb9 0008 36ea            jsr        memset
[0001fdae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001fdb4] 3028 001c                 move.w     28(a0),d0
[0001fdb8] 5940                      subq.w     #4,d0
[0001fdba] 670a                      beq.s      $0001FDC6
[0001fdbc] 5940                      subq.w     #4,d0
[0001fdbe] 6700 008a                 beq        $0001FE4A
[0001fdc2] 6000 0106                 bra        $0001FECA
[0001fdc6] 2a04                      move.l     d4,d5
[0001fdc8] e58d                      lsl.l      #2,d5
[0001fdca] 5c85                      addq.l     #6,d5
[0001fdcc] 2005                      move.l     d5,d0
[0001fdce] 4eb9 0004 c608            jsr        Ax_malloc
[0001fdd4] 2448                      movea.l    a0,a2
[0001fdd6] 200a                      move.l     a2,d0
[0001fdd8] 6700 0112                 beq        $0001FEEC
[0001fddc] 2205                      move.l     d5,d1
[0001fdde] 4240                      clr.w      d0
[0001fde0] 4eb9 0008 36ea            jsr        memset
[0001fde6] 377c 0004 0018            move.w     #$0004,24(a3)
[0001fdec] 4a43                      tst.w      d3
[0001fdee] 6730                      beq.s      $0001FE20
[0001fdf0] 202b 001a                 move.l     26(a3),d0
[0001fdf4] 672a                      beq.s      $0001FE20
[0001fdf6] 222b 0022                 move.l     34(a3),d1
[0001fdfa] 670a                      beq.s      $0001FE06
[0001fdfc] 2041                      movea.l    d1,a0
[0001fdfe] 5d48                      subq.w     #6,a0
[0001fe00] 4eb9 0004 c7c8            jsr        Ax_free
[0001fe06] 206b 0026                 movea.l    38(a3),a0
[0001fe0a] 4eb9 0004 c7c8            jsr        Ax_free
[0001fe10] 41ea 0006                 lea.l      6(a2),a0
[0001fe14] 2748 0022                 move.l     a0,34(a3)
[0001fe18] 2757 0026                 move.l     (a7),38(a3)
[0001fe1c] 6000 00ce                 bra        $0001FEEC
[0001fe20] 202b 001a                 move.l     26(a3),d0
[0001fe24] 670a                      beq.s      $0001FE30
[0001fe26] 2040                      movea.l    d0,a0
[0001fe28] 5d48                      subq.w     #6,a0
[0001fe2a] 4eb9 0004 c7c8            jsr        Ax_free
[0001fe30] 206b 001e                 movea.l    30(a3),a0
[0001fe34] 4eb9 0004 c7c8            jsr        Ax_free
[0001fe3a] 41ea 0006                 lea.l      6(a2),a0
[0001fe3e] 2748 001a                 move.l     a0,26(a3)
[0001fe42] 2757 001e                 move.l     (a7),30(a3)
[0001fe46] 6000 00a4                 bra        $0001FEEC
[0001fe4a] 2a04                      move.l     d4,d5
[0001fe4c] e78d                      lsl.l      #3,d5
[0001fe4e] 5c85                      addq.l     #6,d5
[0001fe50] 2005                      move.l     d5,d0
[0001fe52] 4eb9 0004 c608            jsr        Ax_malloc
[0001fe58] 2448                      movea.l    a0,a2
[0001fe5a] 200a                      move.l     a2,d0
[0001fe5c] 6700 008e                 beq        $0001FEEC
[0001fe60] 2205                      move.l     d5,d1
[0001fe62] 4240                      clr.w      d0
[0001fe64] 4eb9 0008 36ea            jsr        memset
[0001fe6a] 377c 0008 002e            move.w     #$0008,46(a3)
[0001fe70] 4a43                      tst.w      d3
[0001fe72] 672e                      beq.s      $0001FEA2
[0001fe74] 202b 0030                 move.l     48(a3),d0
[0001fe78] 6728                      beq.s      $0001FEA2
[0001fe7a] 222b 0038                 move.l     56(a3),d1
[0001fe7e] 670a                      beq.s      $0001FE8A
[0001fe80] 2041                      movea.l    d1,a0
[0001fe82] 5d48                      subq.w     #6,a0
[0001fe84] 4eb9 0004 c7c8            jsr        Ax_free
[0001fe8a] 206b 003c                 movea.l    60(a3),a0
[0001fe8e] 4eb9 0004 c7c8            jsr        Ax_free
[0001fe94] 41ea 0006                 lea.l      6(a2),a0
[0001fe98] 2748 0038                 move.l     a0,56(a3)
[0001fe9c] 2757 003c                 move.l     (a7),60(a3)
[0001fea0] 604a                      bra.s      $0001FEEC
[0001fea2] 202b 0030                 move.l     48(a3),d0
[0001fea6] 670a                      beq.s      $0001FEB2
[0001fea8] 2040                      movea.l    d0,a0
[0001feaa] 5d48                      subq.w     #6,a0
[0001feac] 4eb9 0004 c7c8            jsr        Ax_free
[0001feb2] 206b 0034                 movea.l    52(a3),a0
[0001feb6] 4eb9 0004 c7c8            jsr        Ax_free
[0001febc] 41ea 0006                 lea.l      6(a2),a0
[0001fec0] 2748 0030                 move.l     a0,48(a3)
[0001fec4] 2757 0034                 move.l     (a7),52(a3)
[0001fec8] 6022                      bra.s      $0001FEEC
[0001feca] 2a04                      move.l     d4,d5
[0001fecc] 2005                      move.l     d5,d0
[0001fece] 4eb9 0004 c608            jsr        Ax_malloc
[0001fed4] 2448                      movea.l    a0,a2
[0001fed6] 200a                      move.l     a2,d0
[0001fed8] 6712                      beq.s      $0001FEEC
[0001feda] 2205                      move.l     d5,d1
[0001fedc] 4240                      clr.w      d0
[0001fede] 4eb9 0008 36ea            jsr        memset
[0001fee4] 274a 0010                 move.l     a2,16(a3)
[0001fee8] 2757 0014                 move.l     (a7),20(a3)
[0001feec] 206f 0004                 movea.l    4(a7),a0
[0001fef0] 6100 e4d0                 bsr        edic_link
[0001fef4] 72ff                      moveq.l    #-1,d1
[0001fef6] 700e                      moveq.l    #14,d0
[0001fef8] 206f 0004                 movea.l    4(a7),a0
[0001fefc] 226f 0004                 movea.l    4(a7),a1
[0001ff00] 2269 0066                 movea.l    102(a1),a1
[0001ff04] 4e91                      jsr        (a1)
[0001ff06] 504f                      addq.w     #8,a7
[0001ff08] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[0001ff0c] 4e75                      rts
edic_acc:
[0001ff0e] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0001ff12] 4fef ffd0                 lea.l      -48(a7),a7
[0001ff16] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001ff1c] 2268 0240                 movea.l    576(a0),a1
[0001ff20] 2f49 0028                 move.l     a1,40(a7)
[0001ff24] 2068 0258                 movea.l    600(a0),a0
[0001ff28] 2f48 002c                 move.l     a0,44(a7)
[0001ff2c] b1c9                      cmpa.l     a1,a0
[0001ff2e] 6700 03da                 beq        $0002030A
[0001ff32] 206f 002c                 movea.l    44(a7),a0
[0001ff36] 2f68 0014 0008            move.l     20(a0),8(a7)
[0001ff3c] 4eb9 0004 7e1e            jsr        Adr_start
[0001ff42] 4eb9 0004 7e2a            jsr        Adr_next
[0001ff48] 3600                      move.w     d0,d3
[0001ff4a] 6b00 03be                 bmi        $0002030A
[0001ff4e] 48c0                      ext.l      d0
[0001ff50] 2200                      move.l     d0,d1
[0001ff52] d281                      add.l      d1,d1
[0001ff54] d280                      add.l      d0,d1
[0001ff56] e789                      lsl.l      #3,d1
[0001ff58] 206f 0028                 movea.l    40(a7),a0
[0001ff5c] 2268 0014                 movea.l    20(a0),a1
[0001ff60] 41f1 1818                 lea.l      24(a1,d1.l),a0
[0001ff64] 2f48 0024                 move.l     a0,36(a7)
[0001ff68] 0c68 000a 0016            cmpi.w     #$000A,22(a0)
[0001ff6e] 6600 039a                 bne        $0002030A
[0001ff72] 226f 002c                 movea.l    44(a7),a1
[0001ff76] 2451                      movea.l    (a1),a2
[0001ff78] 206a 0008                 movea.l    8(a2),a0
[0001ff7c] 41e8 0180                 lea.l      384(a0),a0
[0001ff80] 2f48 0004                 move.l     a0,4(a7)
[0001ff84] 2f68 000c 000c            move.l     12(a0),12(a7)
[0001ff8a] 7801                      moveq.l    #1,d4
[0001ff8c] c868 000a                 and.w      10(a0),d4
[0001ff90] 226f 0024                 movea.l    36(a7),a1
[0001ff94] 2a69 000c                 movea.l    12(a1),a5
[0001ff98] 0c6d 0001 000a            cmpi.w     #$0001,10(a5)
[0001ff9e] 6712                      beq.s      $0001FFB2
[0001ffa0] 41f9 000a d7e6            lea.l      A_NOSTD,a0
[0001ffa6] 7001                      moveq.l    #1,d0
[0001ffa8] 4eb9 0005 a600            jsr        Awi_alert
[0001ffae] 6000 035a                 bra        $0002030A
[0001ffb2] 3a2d 0004                 move.w     4(a5),d5
[0001ffb6] 700f                      moveq.l    #15,d0
[0001ffb8] d06d 0004                 add.w      4(a5),d0
[0001ffbc] c07c fff0                 and.w      #$FFF0,d0
[0001ffc0] 3b40 0004                 move.w     d0,4(a5)
[0001ffc4] 7e0f                      moveq.l    #15,d7
[0001ffc6] 206f 000c                 movea.l    12(a7),a0
[0001ffca] de68 0016                 add.w      22(a0),d7
[0001ffce] ce7c fff0                 and.w      #$FFF0,d7
[0001ffd2] 3c07                      move.w     d7,d6
[0001ffd4] e646                      asr.w      #3,d6
[0001ffd6] cde8 0018                 muls.w     24(a0),d6
[0001ffda] 48c6                      ext.l      d6
[0001ffdc] 2006                      move.l     d6,d0
[0001ffde] 4eb9 0004 c608            jsr        Ax_malloc
[0001ffe4] 2f48 0010                 move.l     a0,16(a7)
[0001ffe8] 6700 0320                 beq        $0002030A
[0001ffec] 2206                      move.l     d6,d1
[0001ffee] 303c 00ff                 move.w     #$00FF,d0
[0001fff2] 4eb9 0008 36ea            jsr        memset
[0001fff8] 322d 0006                 move.w     6(a5),d1
[0001fffc] 302d 0004                 move.w     4(a5),d0
[00020000] 4eb9 0005 4b6e            jsr        Abp_create
[00020006] 2e88                      move.l     a0,(a7)
[00020008] 660e                      bne.s      $00020018
[0002000a] 206f 0010                 movea.l    16(a7),a0
[0002000e] 4eb9 0004 c7c8            jsr        Ax_free
[00020014] 6000 02f4                 bra        $0002030A
[00020018] 49ef 0014                 lea.l      20(a7),a4
[0002001c] 4240                      clr.w      d0
[0002001e] 3940 000a                 move.w     d0,10(a4)
[00020022] 3940 0008                 move.w     d0,8(a4)
[00020026] 3940 0002                 move.w     d0,2(a4)
[0002002a] 3880                      move.w     d0,(a4)
[0002002c] 72ff                      moveq.l    #-1,d1
[0002002e] d26d 0004                 add.w      4(a5),d1
[00020032] 3941 000c                 move.w     d1,12(a4)
[00020036] 3941 0004                 move.w     d1,4(a4)
[0002003a] 70ff                      moveq.l    #-1,d0
[0002003c] d06d 0006                 add.w      6(a5),d0
[00020040] 3940 000e                 move.w     d0,14(a4)
[00020044] 3940 0006                 move.w     d0,6(a4)
[00020048] 2257                      movea.l    (a7),a1
[0002004a] 204d                      movea.l    a5,a0
[0002004c] 2679 0010 ee4e            movea.l    ACSblk,a3
[00020052] 302b 0010                 move.w     16(a3),d0
[00020056] 4eb9 0007 4978            jsr        vr_trnfm
[0002005c] 206f 000c                 movea.l    12(a7),a0
[00020060] 3228 0018                 move.w     24(a0),d1
[00020064] 3007                      move.w     d7,d0
[00020066] 4eb9 0005 4b6e            jsr        Abp_create
[0002006c] 2648                      movea.l    a0,a3
[0002006e] 200b                      move.l     a3,d0
[00020070] 6616                      bne.s      $00020088
[00020072] 206f 0010                 movea.l    16(a7),a0
[00020076] 4eb9 0004 c7c8            jsr        Ax_free
[0002007c] 2057                      movea.l    (a7),a0
[0002007e] 4eb9 0005 4c04            jsr        Abp_delete
[00020084] 6000 0284                 bra        $0002030A
[00020088] 70ff                      moveq.l    #-1,d0
[0002008a] d047                      add.w      d7,d0
[0002008c] 3940 000c                 move.w     d0,12(a4)
[00020090] 3940 0004                 move.w     d0,4(a4)
[00020094] 72ff                      moveq.l    #-1,d1
[00020096] 206f 000c                 movea.l    12(a7),a0
[0002009a] d268 0018                 add.w      24(a0),d1
[0002009e] 3941 000e                 move.w     d1,14(a4)
[000200a2] 3941 0006                 move.w     d1,6(a4)
[000200a6] 2f0b                      move.l     a3,-(a7)
[000200a8] 224b                      movea.l    a3,a1
[000200aa] 204c                      movea.l    a4,a0
[000200ac] 2c79 0010 ee4e            movea.l    ACSblk,a6
[000200b2] 302e 0010                 move.w     16(a6),d0
[000200b6] 4241                      clr.w      d1
[000200b8] 4eb9 0007 489e            jsr        vro_cpyfm
[000200be] 584f                      addq.w     #4,a7
[000200c0] be45                      cmp.w      d5,d7
[000200c2] 6f0c                      ble.s      $000200D0
[000200c4] 70ff                      moveq.l    #-1,d0
[000200c6] d045                      add.w      d5,d0
[000200c8] 3940 000c                 move.w     d0,12(a4)
[000200cc] 3940 0004                 move.w     d0,4(a4)
[000200d0] 302d 0006                 move.w     6(a5),d0
[000200d4] 206f 000c                 movea.l    12(a7),a0
[000200d8] b068 0018                 cmp.w      24(a0),d0
[000200dc] 6c0c                      bge.s      $000200EA
[000200de] 72ff                      moveq.l    #-1,d1
[000200e0] d240                      add.w      d0,d1
[000200e2] 3941 000e                 move.w     d1,14(a4)
[000200e6] 3941 0006                 move.w     d1,6(a4)
[000200ea] 2f0b                      move.l     a3,-(a7)
[000200ec] 226f 0004                 movea.l    4(a7),a1
[000200f0] 204c                      movea.l    a4,a0
[000200f2] 7203                      moveq.l    #3,d1
[000200f4] 2a79 0010 ee4e            movea.l    ACSblk,a5
[000200fa] 302d 0010                 move.w     16(a5),d0
[000200fe] 4eb9 0007 489e            jsr        vro_cpyfm
[00020104] 584f                      addq.w     #4,a7
[00020106] 2057                      movea.l    (a7),a0
[00020108] 4eb9 0005 4c04            jsr        Abp_delete
[0002010e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00020114] 2268 023c                 movea.l    572(a0),a1
[00020118] 3029 000e                 move.w     14(a1),d0
[0002011c] c07c 0800                 and.w      #$0800,d0
[00020120] 6760                      beq.s      $00020182
[00020122] 72ff                      moveq.l    #-1,d1
[00020124] d247                      add.w      d7,d1
[00020126] 3941 000c                 move.w     d1,12(a4)
[0002012a] 3941 0004                 move.w     d1,4(a4)
[0002012e] 74ff                      moveq.l    #-1,d2
[00020130] 2a6f 000c                 movea.l    12(a7),a5
[00020134] d46d 0018                 add.w      24(a5),d2
[00020138] 3942 000e                 move.w     d2,14(a4)
[0002013c] 3942 0006                 move.w     d2,6(a4)
[00020140] 322d 0018                 move.w     24(a5),d1
[00020144] 3007                      move.w     d7,d0
[00020146] 4eb9 0005 4b6e            jsr        Abp_create
[0002014c] 2e88                      move.l     a0,(a7)
[0002014e] 660c                      bne.s      $0002015C
[00020150] 204b                      movea.l    a3,a0
[00020152] 4eb9 0005 4c04            jsr        Abp_delete
[00020158] 6000 01b0                 bra        $0002030A
[0002015c] 2057                      movea.l    (a7),a0
[0002015e] 317c 0001 000a            move.w     #$0001,10(a0)
[00020164] 2248                      movea.l    a0,a1
[00020166] 2879 0010 ee4e            movea.l    ACSblk,a4
[0002016c] 302c 0010                 move.w     16(a4),d0
[00020170] 204b                      movea.l    a3,a0
[00020172] 4eb9 0007 4978            jsr        vr_trnfm
[00020178] 204b                      movea.l    a3,a0
[0002017a] 4eb9 0005 4c04            jsr        Abp_delete
[00020180] 2657                      movea.l    (a7),a3
[00020182] 2079 0010 ee4e            movea.l    ACSblk,a0
[00020188] 3028 001c                 move.w     28(a0),d0
[0002018c] 5940                      subq.w     #4,d0
[0002018e] 670a                      beq.s      $0002019A
[00020190] 5940                      subq.w     #4,d0
[00020192] 6700 0092                 beq        $00020226
[00020196] 6000 0116                 bra        $000202AE
[0002019a] 2e06                      move.l     d6,d7
[0002019c] e58f                      lsl.l      #2,d7
[0002019e] 5c87                      addq.l     #6,d7
[000201a0] 2007                      move.l     d7,d0
[000201a2] 4eb9 0004 c608            jsr        Ax_malloc
[000201a8] 2848                      movea.l    a0,a4
[000201aa] 200c                      move.l     a4,d0
[000201ac] 6700 0124                 beq        $000202D2
[000201b0] 2007                      move.l     d7,d0
[000201b2] 2253                      movea.l    (a3),a1
[000201b4] 41ec 0006                 lea.l      6(a4),a0
[000201b8] 4eb9 0008 3500            jsr        memcpy
[000201be] 357c 0004 0018            move.w     #$0004,24(a2)
[000201c4] 4a44                      tst.w      d4
[000201c6] 6732                      beq.s      $000201FA
[000201c8] 202a 001a                 move.l     26(a2),d0
[000201cc] 672c                      beq.s      $000201FA
[000201ce] 222a 0022                 move.l     34(a2),d1
[000201d2] 670a                      beq.s      $000201DE
[000201d4] 2041                      movea.l    d1,a0
[000201d6] 5d48                      subq.w     #6,a0
[000201d8] 4eb9 0004 c7c8            jsr        Ax_free
[000201de] 206a 0026                 movea.l    38(a2),a0
[000201e2] 4eb9 0004 c7c8            jsr        Ax_free
[000201e8] 41ec 0006                 lea.l      6(a4),a0
[000201ec] 2548 0022                 move.l     a0,34(a2)
[000201f0] 256f 0010 0026            move.l     16(a7),38(a2)
[000201f6] 6000 00da                 bra        $000202D2
[000201fa] 202a 001a                 move.l     26(a2),d0
[000201fe] 670a                      beq.s      $0002020A
[00020200] 2040                      movea.l    d0,a0
[00020202] 5d48                      subq.w     #6,a0
[00020204] 4eb9 0004 c7c8            jsr        Ax_free
[0002020a] 206a 001e                 movea.l    30(a2),a0
[0002020e] 4eb9 0004 c7c8            jsr        Ax_free
[00020214] 41ec 0006                 lea.l      6(a4),a0
[00020218] 2548 001a                 move.l     a0,26(a2)
[0002021c] 256f 0010 001e            move.l     16(a7),30(a2)
[00020222] 6000 00ae                 bra        $000202D2
[00020226] 2e06                      move.l     d6,d7
[00020228] e78f                      lsl.l      #3,d7
[0002022a] 5c87                      addq.l     #6,d7
[0002022c] 2007                      move.l     d7,d0
[0002022e] 4eb9 0004 c608            jsr        Ax_malloc
[00020234] 2848                      movea.l    a0,a4
[00020236] 200c                      move.l     a4,d0
[00020238] 6700 0098                 beq        $000202D2
[0002023c] 2253                      movea.l    (a3),a1
[0002023e] 41ec 0006                 lea.l      6(a4),a0
[00020242] 2007                      move.l     d7,d0
[00020244] 4eb9 0008 3500            jsr        memcpy
[0002024a] 357c 0008 002e            move.w     #$0008,46(a2)
[00020250] 4a44                      tst.w      d4
[00020252] 6730                      beq.s      $00020284
[00020254] 202a 0030                 move.l     48(a2),d0
[00020258] 672a                      beq.s      $00020284
[0002025a] 222a 0038                 move.l     56(a2),d1
[0002025e] 670a                      beq.s      $0002026A
[00020260] 2041                      movea.l    d1,a0
[00020262] 5d48                      subq.w     #6,a0
[00020264] 4eb9 0004 c7c8            jsr        Ax_free
[0002026a] 206a 003c                 movea.l    60(a2),a0
[0002026e] 4eb9 0004 c7c8            jsr        Ax_free
[00020274] 41ec 0006                 lea.l      6(a4),a0
[00020278] 2548 0038                 move.l     a0,56(a2)
[0002027c] 256f 0010 003c            move.l     16(a7),60(a2)
[00020282] 604e                      bra.s      $000202D2
[00020284] 202a 0030                 move.l     48(a2),d0
[00020288] 670a                      beq.s      $00020294
[0002028a] 2040                      movea.l    d0,a0
[0002028c] 5d48                      subq.w     #6,a0
[0002028e] 4eb9 0004 c7c8            jsr        Ax_free
[00020294] 206a 0034                 movea.l    52(a2),a0
[00020298] 4eb9 0004 c7c8            jsr        Ax_free
[0002029e] 41ec 0006                 lea.l      6(a4),a0
[000202a2] 2548 0030                 move.l     a0,48(a2)
[000202a6] 256f 0010 0034            move.l     16(a7),52(a2)
[000202ac] 6024                      bra.s      $000202D2
[000202ae] 2e06                      move.l     d6,d7
[000202b0] 2007                      move.l     d7,d0
[000202b2] 4eb9 0004 c608            jsr        Ax_malloc
[000202b8] 2848                      movea.l    a0,a4
[000202ba] 200c                      move.l     a4,d0
[000202bc] 6714                      beq.s      $000202D2
[000202be] 2253                      movea.l    (a3),a1
[000202c0] 2007                      move.l     d7,d0
[000202c2] 4eb9 0008 3500            jsr        memcpy
[000202c8] 254c 0010                 move.l     a4,16(a2)
[000202cc] 256f 0010 0014            move.l     16(a7),20(a2)
[000202d2] 206f 002c                 movea.l    44(a7),a0
[000202d6] 6100 e0ea                 bsr        edic_link
[000202da] 204b                      movea.l    a3,a0
[000202dc] 4eb9 0005 4c04            jsr        Abp_delete
[000202e2] 206f 0008                 movea.l    8(a7),a0
[000202e6] 0068 0080 01b8            ori.w      #$0080,440(a0)
[000202ec] 72ff                      moveq.l    #-1,d1
[000202ee] 700e                      moveq.l    #14,d0
[000202f0] 226f 002c                 movea.l    44(a7),a1
[000202f4] 2269 0066                 movea.l    102(a1),a1
[000202f8] 206f 002c                 movea.l    44(a7),a0
[000202fc] 4e91                      jsr        (a1)
[000202fe] 3003                      move.w     d3,d0
[00020300] 206f 0028                 movea.l    40(a7),a0
[00020304] 4eb9 0004 7f76            jsr        Adr_del
[0002030a] 4fef 0030                 lea.l      48(a7),a7
[0002030e] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[00020312] 4e75                      rts
edic_delplane:
[00020314] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00020318] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002031e] 2468 0258                 movea.l    600(a0),a2
[00020322] 2652                      movea.l    (a2),a3
[00020324] 206b 0008                 movea.l    8(a3),a0
[00020328] 41e8 0180                 lea.l      384(a0),a0
[0002032c] 7601                      moveq.l    #1,d3
[0002032e] c668 000a                 and.w      10(a0),d3
[00020332] 302b 0018                 move.w     24(a3),d0
[00020336] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002033c] b069 001c                 cmp.w      28(a1),d0
[00020340] 664c                      bne.s      $0002038E
[00020342] 4a43                      tst.w      d3
[00020344] 6626                      bne.s      $0002036C
[00020346] 222b 001a                 move.l     26(a3),d1
[0002034a] 670a                      beq.s      $00020356
[0002034c] 2041                      movea.l    d1,a0
[0002034e] 5d48                      subq.w     #6,a0
[00020350] 4eb9 0004 c7c8            jsr        Ax_free
[00020356] 206b 001e                 movea.l    30(a3),a0
[0002035a] 4eb9 0004 c7c8            jsr        Ax_free
[00020360] 42ab 001a                 clr.l      26(a3)
[00020364] 42ab 001e                 clr.l      30(a3)
[00020368] 426b 0018                 clr.w      24(a3)
[0002036c] 202b 0022                 move.l     34(a3),d0
[00020370] 670a                      beq.s      $0002037C
[00020372] 2040                      movea.l    d0,a0
[00020374] 5d48                      subq.w     #6,a0
[00020376] 4eb9 0004 c7c8            jsr        Ax_free
[0002037c] 206b 0026                 movea.l    38(a3),a0
[00020380] 4eb9 0004 c7c8            jsr        Ax_free
[00020386] 42ab 0022                 clr.l      34(a3)
[0002038a] 42ab 0026                 clr.l      38(a3)
[0002038e] 302b 002e                 move.w     46(a3),d0
[00020392] 2079 0010 ee4e            movea.l    ACSblk,a0
[00020398] b068 001c                 cmp.w      28(a0),d0
[0002039c] 664c                      bne.s      $000203EA
[0002039e] 4a43                      tst.w      d3
[000203a0] 6626                      bne.s      $000203C8
[000203a2] 222b 0030                 move.l     48(a3),d1
[000203a6] 670a                      beq.s      $000203B2
[000203a8] 2041                      movea.l    d1,a0
[000203aa] 5d48                      subq.w     #6,a0
[000203ac] 4eb9 0004 c7c8            jsr        Ax_free
[000203b2] 206b 0034                 movea.l    52(a3),a0
[000203b6] 4eb9 0004 c7c8            jsr        Ax_free
[000203bc] 42ab 0030                 clr.l      48(a3)
[000203c0] 42ab 0034                 clr.l      52(a3)
[000203c4] 426b 002e                 clr.w      46(a3)
[000203c8] 202b 0038                 move.l     56(a3),d0
[000203cc] 670a                      beq.s      $000203D8
[000203ce] 2040                      movea.l    d0,a0
[000203d0] 5d48                      subq.w     #6,a0
[000203d2] 4eb9 0004 c7c8            jsr        Ax_free
[000203d8] 206b 003c                 movea.l    60(a3),a0
[000203dc] 4eb9 0004 c7c8            jsr        Ax_free
[000203e2] 42ab 0038                 clr.l      56(a3)
[000203e6] 42ab 003c                 clr.l      60(a3)
[000203ea] 204a                      movea.l    a2,a0
[000203ec] 6100 dfd4                 bsr        edic_link
[000203f0] 72ff                      moveq.l    #-1,d1
[000203f2] 700e                      moveq.l    #14,d0
[000203f4] 204a                      movea.l    a2,a0
[000203f6] 226a 0066                 movea.l    102(a2),a1
[000203fa] 4e91                      jsr        (a1)
[000203fc] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00020400] 4e75                      rts
zooming:
[00020402] 48e7 1e20                 movem.l    d3-d6/a2,-(a7)
[00020406] 2450                      movea.l    (a0),a2
[00020408] 2251                      movea.l    (a1),a1
[0002040a] 72ff                      moveq.l    #-1,d1
[0002040c] d268 000c                 add.w      12(a0),d1
[00020410] 6068                      bra.s      $0002047A
[00020412] 341a                      move.w     (a2)+,d2
[00020414] 3600                      move.w     d0,d3
[00020416] 2049                      movea.l    a1,a0
[00020418] 780f                      moveq.l    #15,d4
[0002041a] 6054                      bra.s      $00020470
[0002041c] 4a43                      tst.w      d3
[0002041e] 6b20                      bmi.s      $00020440
[00020420] 7c54                      moveq.l    #84,d6
[00020422] 1146 0060                 move.b     d6,96(a0)
[00020426] 1146 0040                 move.b     d6,64(a0)
[0002042a] 1146 0020                 move.b     d6,32(a0)
[0002042e] 1086                      move.b     d6,(a0)
[00020430] 7caa                      moveq.l    #-86,d6
[00020432] 1146 0050                 move.b     d6,80(a0)
[00020436] 1146 0030                 move.b     d6,48(a0)
[0002043a] 1146 0010                 move.b     d6,16(a0)
[0002043e] 6024                      bra.s      $00020464
[00020440] 4a42                      tst.w      d2
[00020442] 6b04                      bmi.s      $00020448
[00020444] 4205                      clr.b      d5
[00020446] 6002                      bra.s      $0002044A
[00020448] 7afe                      moveq.l    #-2,d5
[0002044a] 1145 0060                 move.b     d5,96(a0)
[0002044e] 1145 0050                 move.b     d5,80(a0)
[00020452] 1145 0040                 move.b     d5,64(a0)
[00020456] 1145 0030                 move.b     d5,48(a0)
[0002045a] 1145 0020                 move.b     d5,32(a0)
[0002045e] 1145 0010                 move.b     d5,16(a0)
[00020462] 1085                      move.b     d5,(a0)
[00020464] 4228 0070                 clr.b      112(a0)
[00020468] 5248                      addq.w     #1,a0
[0002046a] d442                      add.w      d2,d2
[0002046c] d643                      add.w      d3,d3
[0002046e] 5344                      subq.w     #1,d4
[00020470] 4a44                      tst.w      d4
[00020472] 6aa8                      bpl.s      $0002041C
[00020474] 43e9 0080                 lea.l      128(a1),a1
[00020478] 5341                      subq.w     #1,d1
[0002047a] 4a41                      tst.w      d1
[0002047c] 6a94                      bpl.s      $00020412
[0002047e] 4cdf 0478                 movem.l    (a7)+,d3-d6/a2
[00020482] 4e75                      rts
edic_bitmap:
[00020484] 48e7 3f3e                 movem.l    d2-d7/a2-a6,-(a7)
[00020488] 4fef ff56                 lea.l      -170(a7),a7
[0002048c] 41f9 000b 0e5c            lea.l      $000B0E5C,a0
[00020492] 43d7                      lea.l      (a7),a1
[00020494] 12d8                      move.b     (a0)+,(a1)+
[00020496] 12d8                      move.b     (a0)+,(a1)+
[00020498] 12d8                      move.b     (a0)+,(a1)+
[0002049a] 12d8                      move.b     (a0)+,(a1)+
[0002049c] 206f 00da                 movea.l    218(a7),a0
[000204a0] 3f68 0016 0014            move.w     22(a0),20(a7)
[000204a6] 3f68 0018 0016            move.w     24(a0),22(a7)
[000204ac] 4bf9 0010 ee4e            lea.l      ACSblk,a5
[000204b2] 302f 0014                 move.w     20(a7),d0
[000204b6] 6606                      bne.s      $000204BE
[000204b8] 322f 0016                 move.w     22(a7),d1
[000204bc] 6736                      beq.s      $000204F4
[000204be] 206f 00da                 movea.l    218(a7),a0
[000204c2] 3f68 0012 0010            move.w     18(a0),16(a7)
[000204c8] 3f68 0014 0012            move.w     20(a0),18(a7)
[000204ce] 70ff                      moveq.l    #-1,d0
[000204d0] d06f 0010                 add.w      16(a7),d0
[000204d4] d16f 0014                 add.w      d0,20(a7)
[000204d8] 70ff                      moveq.l    #-1,d0
[000204da] d06f 0012                 add.w      18(a7),d0
[000204de] d16f 0016                 add.w      d0,22(a7)
[000204e2] 41ef 0010                 lea.l      16(a7),a0
[000204e6] 7201                      moveq.l    #1,d1
[000204e8] 2255                      movea.l    (a5),a1
[000204ea] 3029 0010                 move.w     16(a1),d0
[000204ee] 4eb9 0007 2230            jsr        vs_clip
[000204f4] 206f 00da                 movea.l    218(a7),a0
[000204f8] 2068 001a                 movea.l    26(a0),a0
[000204fc] 2050                      movea.l    (a0),a0
[000204fe] 2268 0008                 movea.l    8(a0),a1
[00020502] 43e9 0180                 lea.l      384(a1),a1
[00020506] 2f49 0038                 move.l     a1,56(a7)
[0002050a] 2f69 000c 00a6            move.l     12(a1),166(a7)
[00020510] 226f 00a6                 movea.l    166(a7),a1
[00020514] 3629 0016                 move.w     22(a1),d3
[00020518] e843                      asr.w      #4,d3
[0002051a] 45ef 0056                 lea.l      86(a7),a2
[0002051e] 24bc 0010 937c            move.l     #zoomplane,(a2)
[00020524] 426a 000a                 clr.w      10(a2)
[00020528] 2f7c 0010 ab7c 0042       move.l     #zoom2plane,66(a7)
[00020530] 3f7c 0001 004c            move.w     #$0001,76(a7)
[00020536] 303c 0080                 move.w     #$0080,d0
[0002053a] 3f40 0046                 move.w     d0,70(a7)
[0002053e] 3540 0004                 move.w     d0,4(a2)
[00020542] 7208                      moveq.l    #8,d1
[00020544] 3f41 0048                 move.w     d1,72(a7)
[00020548] 3541 0006                 move.w     d1,6(a2)
[0002054c] 3f41 004a                 move.w     d1,74(a7)
[00020550] 3541 0008                 move.w     d1,8(a2)
[00020554] 4240                      clr.w      d0
[00020556] 3540 0012                 move.w     d0,18(a2)
[0002055a] 3540 0010                 move.w     d0,16(a2)
[0002055e] 3540 000e                 move.w     d0,14(a2)
[00020562] 3f40 0054                 move.w     d0,84(a7)
[00020566] 3f40 0052                 move.w     d0,82(a7)
[0002056a] 3f40 0050                 move.w     d0,80(a7)
[0002056e] 2f7c 0010 934c 007e       move.l     #toplane,126(a7)
[00020576] 426f 0088                 clr.w      136(a7)
[0002057a] 43f9 0010 931c            lea.l      to2plane,a1
[00020580] 2f49 006a                 move.l     a1,106(a7)
[00020584] 2f49 0004                 move.l     a1,4(a7)
[00020588] 3f7c 0001 0074            move.w     #$0001,116(a7)
[0002058e] 7210                      moveq.l    #16,d1
[00020590] 3f41 006e                 move.w     d1,110(a7)
[00020594] 3f41 0082                 move.w     d1,130(a7)
[00020598] 7401                      moveq.l    #1,d2
[0002059a] 3f42 0070                 move.w     d2,112(a7)
[0002059e] 3f42 0084                 move.w     d2,132(a7)
[000205a2] 3f42 0072                 move.w     d2,114(a7)
[000205a6] 3f42 0086                 move.w     d2,134(a7)
[000205aa] 4241                      clr.w      d1
[000205ac] 3f41 0090                 move.w     d1,144(a7)
[000205b0] 3f41 008e                 move.w     d1,142(a7)
[000205b4] 3f41 008c                 move.w     d1,140(a7)
[000205b8] 3f41 007c                 move.w     d1,124(a7)
[000205bc] 3f41 007a                 move.w     d1,122(a7)
[000205c0] 3f41 0078                 move.w     d1,120(a7)
[000205c4] 2f68 0014 003e            move.l     20(a0),62(a7)
[000205ca] 7401                      moveq.l    #1,d2
[000205cc] 3f42 009e                 move.w     d2,158(a7)
[000205d0] 3f42 0076                 move.w     d2,118(a7)
[000205d4] 3f42 008a                 move.w     d2,138(a7)
[000205d8] 3f42 004e                 move.w     d2,78(a7)
[000205dc] 3542 000c                 move.w     d2,12(a2)
[000205e0] 2f68 0010 0092            move.l     16(a0),146(a7)
[000205e6] 2255                      movea.l    (a5),a1
[000205e8] 3029 001c                 move.w     28(a1),d0
[000205ec] b068 0018                 cmp.w      24(a0),d0
[000205f0] 663e                      bne.s      $00020630
[000205f2] 3f40 009e                 move.w     d0,158(a7)
[000205f6] 3f40 0076                 move.w     d0,118(a7)
[000205fa] 3f40 008a                 move.w     d0,138(a7)
[000205fe] 3f40 004e                 move.w     d0,78(a7)
[00020602] 3540 000c                 move.w     d0,12(a2)
[00020606] 2228 0022                 move.l     34(a0),d1
[0002060a] 6718                      beq.s      $00020624
[0002060c] 7401                      moveq.l    #1,d2
[0002060e] 226f 0038                 movea.l    56(a7),a1
[00020612] c469 000a                 and.w      10(a1),d2
[00020616] 670c                      beq.s      $00020624
[00020618] 2f68 0026 003e            move.l     38(a0),62(a7)
[0002061e] 2f41 0092                 move.l     d1,146(a7)
[00020622] 600c                      bra.s      $00020630
[00020624] 2f68 001e 003e            move.l     30(a0),62(a7)
[0002062a] 2f68 001a 0092            move.l     26(a0),146(a7)
[00020630] 2255                      movea.l    (a5),a1
[00020632] 3029 001c                 move.w     28(a1),d0
[00020636] b068 002e                 cmp.w      46(a0),d0
[0002063a] 663e                      bne.s      $0002067A
[0002063c] 3f40 009e                 move.w     d0,158(a7)
[00020640] 3f40 0076                 move.w     d0,118(a7)
[00020644] 3f40 008a                 move.w     d0,138(a7)
[00020648] 3f40 004e                 move.w     d0,78(a7)
[0002064c] 3540 000c                 move.w     d0,12(a2)
[00020650] 2228 0038                 move.l     56(a0),d1
[00020654] 6718                      beq.s      $0002066E
[00020656] 7401                      moveq.l    #1,d2
[00020658] 226f 0038                 movea.l    56(a7),a1
[0002065c] c469 000a                 and.w      10(a1),d2
[00020660] 670c                      beq.s      $0002066E
[00020662] 2f68 003c 003e            move.l     60(a0),62(a7)
[00020668] 2f41 0092                 move.l     d1,146(a7)
[0002066c] 600c                      bra.s      $0002067A
[0002066e] 2f68 0034 003e            move.l     52(a0),62(a7)
[00020674] 2f68 0030 0092            move.l     48(a0),146(a7)
[0002067a] 2f6f 0092 0008            move.l     146(a7),8(a7)
[00020680] 426f 009c                 clr.w      156(a7)
[00020684] 206f 00a6                 movea.l    166(a7),a0
[00020688] 3f68 0016 0096            move.w     22(a0),150(a7)
[0002068e] 3f43 009a                 move.w     d3,154(a7)
[00020692] 3f68 0018 0098            move.w     24(a0),152(a7)
[00020698] 4240                      clr.w      d0
[0002069a] 3f40 00a4                 move.w     d0,164(a7)
[0002069e] 3f40 00a2                 move.w     d0,162(a7)
[000206a2] 3f40 00a0                 move.w     d0,160(a7)
[000206a6] 322f 009a                 move.w     154(a7),d1
[000206aa] c3ef 0098                 muls.w     152(a7),d1
[000206ae] 48c1                      ext.l      d1
[000206b0] 2f41 000c                 move.l     d1,12(a7)
[000206b4] 49ef 0028                 lea.l      40(a7),a4
[000206b8] 4240                      clr.w      d0
[000206ba] 3940 000e                 move.w     d0,14(a4)
[000206be] 3940 000a                 move.w     d0,10(a4)
[000206c2] 3940 0008                 move.w     d0,8(a4)
[000206c6] 3940 0002                 move.w     d0,2(a4)
[000206ca] 397c 000f 000c            move.w     #$000F,12(a4)
[000206d0] 47ef 0018                 lea.l      24(a7),a3
[000206d4] 4240                      clr.w      d0
[000206d6] 3740 0002                 move.w     d0,2(a3)
[000206da] 3680                      move.w     d0,(a3)
[000206dc] 377c 007f 0004            move.w     #$007F,4(a3)
[000206e2] 377c 0007 0006            move.w     #$0007,6(a3)
[000206e8] 206f 00da                 movea.l    218(a7),a0
[000206ec] 3f68 000c 003c            move.w     12(a0),60(a7)
[000206f2] 4246                      clr.w      d6
[000206f4] 6000 0184                 bra        $0002087A
[000206f8] 396c 0002 0006            move.w     2(a4),6(a4)
[000206fe] 7007                      moveq.l    #7,d0
[00020700] d06f 003c                 add.w      60(a7),d0
[00020704] b06f 0012                 cmp.w      18(a7),d0
[00020708] 6d00 0166                 blt        $00020870
[0002070c] 322f 003c                 move.w     60(a7),d1
[00020710] b26f 0016                 cmp.w      22(a7),d1
[00020714] 6e00 015a                 bgt        $00020870
[00020718] 206f 00da                 movea.l    218(a7),a0
[0002071c] 3e28 000a                 move.w     10(a0),d7
[00020720] 4254                      clr.w      (a4)
[00020722] 4244                      clr.w      d4
[00020724] 6000 0144                 bra        $0002086A
[00020728] 303c 0080                 move.w     #$0080,d0
[0002072c] d047                      add.w      d7,d0
[0002072e] b06f 0010                 cmp.w      16(a7),d0
[00020732] 6d00 012c                 blt        $00020860
[00020736] be6f 0014                 cmp.w      20(a7),d7
[0002073a] 6e00 0124                 bgt        $00020860
[0002073e] 3214                      move.w     (a4),d1
[00020740] d26c 000c                 add.w      12(a4),d1
[00020744] 3941 0004                 move.w     d1,4(a4)
[00020748] 2055                      movea.l    (a5),a0
[0002074a] 2268 023c                 movea.l    572(a0),a1
[0002074e] 3429 000e                 move.w     14(a1),d2
[00020752] c47c 0800                 and.w      #$0800,d2
[00020756] 6748                      beq.s      $000207A0
[00020758] 3028 001c                 move.w     28(a0),d0
[0002075c] b06f 0076                 cmp.w      118(a7),d0
[00020760] 663e                      bne.s      $000207A0
[00020762] 7a00                      moveq.l    #0,d5
[00020764] 602e                      bra.s      $00020794
[00020766] 3006                      move.w     d6,d0
[00020768] c1c3                      muls.w     d3,d0
[0002076a] d044                      add.w      d4,d0
[0002076c] 48c0                      ext.l      d0
[0002076e] 2f00                      move.l     d0,-(a7)
[00020770] 2005                      move.l     d5,d0
[00020772] 222f 0010                 move.l     16(a7),d1
[00020776] 4eb9 0008 3cac            jsr        _lmul
[0002077c] d09f                      add.l      (a7)+,d0
[0002077e] d080                      add.l      d0,d0
[00020780] 206f 0008                 movea.l    8(a7),a0
[00020784] 2205                      move.l     d5,d1
[00020786] d281                      add.l      d1,d1
[00020788] 226f 0004                 movea.l    4(a7),a1
[0002078c] 33b0 0800 1800            move.w     0(a0,d0.l),0(a1,d1.l)
[00020792] 5285                      addq.l     #1,d5
[00020794] 302f 009e                 move.w     158(a7),d0
[00020798] 48c0                      ext.l      d0
[0002079a] ba80                      cmp.l      d0,d5
[0002079c] 6dc8                      blt.s      $00020766
[0002079e] 602e                      bra.s      $000207CE
[000207a0] 486f 007e                 pea.l      126(a7)
[000207a4] 43ef 0096                 lea.l      150(a7),a1
[000207a8] 204c                      movea.l    a4,a0
[000207aa] 7203                      moveq.l    #3,d1
[000207ac] 2c55                      movea.l    (a5),a6
[000207ae] 302e 0010                 move.w     16(a6),d0
[000207b2] 4eb9 0007 489e            jsr        vro_cpyfm
[000207b8] 584f                      addq.w     #4,a7
[000207ba] 43ef 006a                 lea.l      106(a7),a1
[000207be] 41ef 007e                 lea.l      126(a7),a0
[000207c2] 2c55                      movea.l    (a5),a6
[000207c4] 302e 0010                 move.w     16(a6),d0
[000207c8] 4eb9 0007 4978            jsr        vr_trnfm
[000207ce] 3206                      move.w     d6,d1
[000207d0] c3c3                      muls.w     d3,d1
[000207d2] d244                      add.w      d4,d1
[000207d4] 48c1                      ext.l      d1
[000207d6] d281                      add.l      d1,d1
[000207d8] 206f 003e                 movea.l    62(a7),a0
[000207dc] 3030 1800                 move.w     0(a0,d1.l),d0
[000207e0] 43ef 0042                 lea.l      66(a7),a1
[000207e4] 41ef 006a                 lea.l      106(a7),a0
[000207e8] 6100 fc18                 bsr        zooming
[000207ec] 224a                      movea.l    a2,a1
[000207ee] 41ef 0042                 lea.l      66(a7),a0
[000207f2] 2c55                      movea.l    (a5),a6
[000207f4] 302e 0010                 move.w     16(a6),d0
[000207f8] 4eb9 0007 4978            jsr        vr_trnfm
[000207fe] 3747 0008                 move.w     d7,8(a3)
[00020802] 376f 003c 000a            move.w     60(a7),10(a3)
[00020808] 3007                      move.w     d7,d0
[0002080a] d06b 0004                 add.w      4(a3),d0
[0002080e] 3740 000c                 move.w     d0,12(a3)
[00020812] 322f 003c                 move.w     60(a7),d1
[00020816] d26b 0006                 add.w      6(a3),d1
[0002081a] 3741 000e                 move.w     d1,14(a3)
[0002081e] 2055                      movea.l    (a5),a0
[00020820] 3028 001c                 move.w     28(a0),d0
[00020824] b06a 000c                 cmp.w      12(a2),d0
[00020828] 671c                      beq.s      $00020846
[0002082a] 4857                      pea.l      (a7)
[0002082c] 4868 026a                 pea.l      618(a0)
[00020830] 224a                      movea.l    a2,a1
[00020832] 204b                      movea.l    a3,a0
[00020834] 2c55                      movea.l    (a5),a6
[00020836] 302e 0010                 move.w     16(a6),d0
[0002083a] 7201                      moveq.l    #1,d1
[0002083c] 4eb9 0007 4902            jsr        vrt_cpyfm
[00020842] 504f                      addq.w     #8,a7
[00020844] 601a                      bra.s      $00020860
[00020846] 2055                      movea.l    (a5),a0
[00020848] 4868 026a                 pea.l      618(a0)
[0002084c] 224a                      movea.l    a2,a1
[0002084e] 204b                      movea.l    a3,a0
[00020850] 7203                      moveq.l    #3,d1
[00020852] 2c55                      movea.l    (a5),a6
[00020854] 302e 0010                 move.w     16(a6),d0
[00020858] 4eb9 0007 489e            jsr        vro_cpyfm
[0002085e] 584f                      addq.w     #4,a7
[00020860] de7c 0080                 add.w      #$0080,d7
[00020864] 0654 0010                 addi.w     #$0010,(a4)
[00020868] 5244                      addq.w     #1,d4
[0002086a] b644                      cmp.w      d4,d3
[0002086c] 6e00 feba                 bgt        $00020728
[00020870] 506f 003c                 addq.w     #8,60(a7)
[00020874] 526c 0002                 addq.w     #1,2(a4)
[00020878] 5246                      addq.w     #1,d6
[0002087a] 206f 00a6                 movea.l    166(a7),a0
[0002087e] bc68 0018                 cmp.w      24(a0),d6
[00020882] 6d00 fe74                 blt        $000206F8
[00020886] 41ef 0010                 lea.l      16(a7),a0
[0002088a] 4241                      clr.w      d1
[0002088c] 2255                      movea.l    (a5),a1
[0002088e] 3029 0010                 move.w     16(a1),d0
[00020892] 4eb9 0007 2230            jsr        vs_clip
[00020898] 206f 00da                 movea.l    218(a7),a0
[0002089c] 3028 0008                 move.w     8(a0),d0
[000208a0] 4fef 00aa                 lea.l      170(a7),a7
[000208a4] 4cdf 7cfc                 movem.l    (a7)+,d2-d7/a2-a6
[000208a8] 4e75                      rts
edic_edit:
[000208aa] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[000208ae] 594f                      subq.w     #4,a7
[000208b0] 45f9 0010 ee4e            lea.l      ACSblk,a2
[000208b6] 2052                      movea.l    (a2),a0
[000208b8] 2668 0258                 movea.l    600(a0),a3
[000208bc] 3228 0260                 move.w     608(a0),d1
[000208c0] 48c1                      ext.l      d1
[000208c2] 2001                      move.l     d1,d0
[000208c4] d080                      add.l      d0,d0
[000208c6] d081                      add.l      d1,d0
[000208c8] e788                      lsl.l      #3,d0
[000208ca] 2268 025c                 movea.l    604(a0),a1
[000208ce] 0271 fffe 080a            andi.w     #$FFFE,10(a1,d0.l)
[000208d4] 2853                      movea.l    (a3),a4
[000208d6] 4eb9 0005 1388            jsr        Awi_diaend
[000208dc] 377c ffff 001c            move.w     #$FFFF,28(a3)
[000208e2] 2a6c 000c                 movea.l    12(a4),a5
[000208e6] 274d 0014                 move.l     a5,20(a3)
[000208ea] 2c6c 0008                 movea.l    8(a4),a6
[000208ee] 2eae 018c                 move.l     396(a6),(a7)
[000208f2] 2057                      movea.l    (a7),a0
[000208f4] 3628 0016                 move.w     22(a0),d3
[000208f8] e74b                      lsl.w      #3,d3
[000208fa] 3828 0018                 move.w     24(a0),d4
[000208fe] e74c                      lsl.w      #3,d4
[00020900] 226d 0294                 movea.l    660(a5),a1
[00020904] 234b 0004                 move.l     a3,4(a1)
[00020908] 3b43 029c                 move.w     d3,668(a5)
[0002090c] 3b43 0284                 move.w     d3,644(a5)
[00020910] 3b44 029e                 move.w     d4,670(a5)
[00020914] 3b44 0286                 move.w     d4,646(a5)
[00020918] 3b7c 0008 02b4            move.w     #$0008,692(a5)
[0002091e] 7001                      moveq.l    #1,d0
[00020920] 3940 0044                 move.w     d0,68(a4)
[00020924] 2252                      movea.l    (a2),a1
[00020926] 2069 023c                 movea.l    572(a1),a0
[0002092a] 2268 006a                 movea.l    106(a0),a1
[0002092e] 3340 0008                 move.w     d0,8(a1)
[00020932] 7001                      moveq.l    #1,d0
[00020934] 6100 d7f6                 bsr        getFgColor
[00020938] 2052                      movea.l    (a2),a0
[0002093a] 2268 023c                 movea.l    572(a0),a1
[0002093e] 2869 006a                 movea.l    106(a1),a4
[00020942] 3940 0006                 move.w     d0,6(a4)
[00020946] 2052                      movea.l    (a2),a0
[00020948] 3228 0012                 move.w     18(a0),d1
[0002094c] d241                      add.w      d1,d1
[0002094e] d26d 0280                 add.w      640(a5),d1
[00020952] d641                      add.w      d1,d3
[00020954] 3428 0014                 move.w     20(a0),d2
[00020958] d442                      add.w      d2,d2
[0002095a] d46d 0282                 add.w      642(a5),d2
[0002095e] d842                      add.w      d2,d4
[00020960] b66e 0014                 cmp.w      20(a6),d3
[00020964] 6c08                      bge.s      $0002096E
[00020966] 3b6e 0014 0014            move.w     20(a6),20(a5)
[0002096c] 6004                      bra.s      $00020972
[0002096e] 3b43 0014                 move.w     d3,20(a5)
[00020972] b86e 0016                 cmp.w      22(a6),d4
[00020976] 6c08                      bge.s      $00020980
[00020978] 3b6e 0016 0016            move.w     22(a6),22(a5)
[0002097e] 6004                      bra.s      $00020984
[00020980] 3b44 0016                 move.w     d4,22(a5)
[00020984] 7008                      moveq.l    #8,d0
[00020986] 3b40 0046                 move.w     d0,70(a5)
[0002098a] 3b40 0044                 move.w     d0,68(a5)
[0002098e] 277c 0006 b77a 0062       move.l     #Awi_nokey,98(a3)
[00020996] 2052                      movea.l    (a2),a0
[00020998] 3028 000c                 move.w     12(a0),d0
[0002099c] 3228 0004                 move.w     4(a0),d1
[000209a0] d241                      add.w      d1,d1
[000209a2] 226b 0014                 movea.l    20(a3),a1
[000209a6] d269 0014                 add.w      20(a1),d1
[000209aa] b041                      cmp.w      d1,d0
[000209ac] 6c02                      bge.s      $000209B0
[000209ae] 6010                      bra.s      $000209C0
[000209b0] 2052                      movea.l    (a2),a0
[000209b2] 3028 0004                 move.w     4(a0),d0
[000209b6] d040                      add.w      d0,d0
[000209b8] 226b 0014                 movea.l    20(a3),a1
[000209bc] d069 0014                 add.w      20(a1),d0
[000209c0] 3740 0028                 move.w     d0,40(a3)
[000209c4] 2052                      movea.l    (a2),a0
[000209c6] 3228 000e                 move.w     14(a0),d1
[000209ca] 3428 0006                 move.w     6(a0),d2
[000209ce] e54a                      lsl.w      #2,d2
[000209d0] 226b 0014                 movea.l    20(a3),a1
[000209d4] d469 0016                 add.w      22(a1),d2
[000209d8] b242                      cmp.w      d2,d1
[000209da] 6c02                      bge.s      $000209DE
[000209dc] 6010                      bra.s      $000209EE
[000209de] 2052                      movea.l    (a2),a0
[000209e0] 3228 0006                 move.w     6(a0),d1
[000209e4] e549                      lsl.w      #2,d1
[000209e6] 226b 0014                 movea.l    20(a3),a1
[000209ea] d269 0016                 add.w      22(a1),d1
[000209ee] 3741 002a                 move.w     d1,42(a3)
[000209f2] 302b 0022                 move.w     34(a3),d0
[000209f6] c07c 0100                 and.w      #$0100,d0
[000209fa] 670a                      beq.s      $00020A06
[000209fc] 342b 0022                 move.w     34(a3),d2
[00020a00] c47c 0800                 and.w      #$0800,d2
[00020a04] 6624                      bne.s      $00020A2A
[00020a06] 006b 0100 0056            ori.w      #$0100,86(a3)
[00020a0c] 204b                      movea.l    a3,a0
[00020a0e] 4eb9 0005 8362            jsr        Awi_closed
[00020a14] 006b 0fe0 0022            ori.w      #$0FE0,34(a3)
[00020a1a] 204b                      movea.l    a3,a0
[00020a1c] 4eb9 0005 7428            jsr        Awi_open
[00020a22] 026b feff 0056            andi.w     #$FEFF,86(a3)
[00020a28] 6008                      bra.s      $00020A32
[00020a2a] 204b                      movea.l    a3,a0
[00020a2c] 4eb9 0001 6012            jsr        view_grow
[00020a32] 584f                      addq.w     #4,a7
[00020a34] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[00020a38] 4e75                      rts
edic_struct:
[00020a3a] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00020a3e] 514f                      subq.w     #8,a7
[00020a40] 4243                      clr.w      d3
[00020a42] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00020a48] 2052                      movea.l    (a2),a0
[00020a4a] 3228 0260                 move.w     608(a0),d1
[00020a4e] 48c1                      ext.l      d1
[00020a50] 2001                      move.l     d1,d0
[00020a52] d080                      add.l      d0,d0
[00020a54] d081                      add.l      d1,d0
[00020a56] e788                      lsl.l      #3,d0
[00020a58] 2268 025c                 movea.l    604(a0),a1
[00020a5c] 0271 fffe 080a            andi.w     #$FFFE,10(a1,d0.l)
[00020a62] 2052                      movea.l    (a2),a0
[00020a64] 2668 0258                 movea.l    600(a0),a3
[00020a68] 2853                      movea.l    (a3),a4
[00020a6a] 4eb9 0005 1388            jsr        Awi_diaend
[00020a70] 377c 001a 001c            move.w     #$001A,28(a3)
[00020a76] 277c 0002 0ca0 0062       move.l     #ic_keys,98(a3)
[00020a7e] 276c 0008 0014            move.l     8(a4),20(a3)
[00020a84] 2052                      movea.l    (a2),a0
[00020a86] 3028 0004                 move.w     4(a0),d0
[00020a8a] d040                      add.w      d0,d0
[00020a8c] 226b 0014                 movea.l    20(a3),a1
[00020a90] d069 0014                 add.w      20(a1),d0
[00020a94] 3740 0028                 move.w     d0,40(a3)
[00020a98] 2052                      movea.l    (a2),a0
[00020a9a] 3228 0006                 move.w     6(a0),d1
[00020a9e] e549                      lsl.w      #2,d1
[00020aa0] 226b 0014                 movea.l    20(a3),a1
[00020aa4] d269 0016                 add.w      22(a1),d1
[00020aa8] 3741 002a                 move.w     d1,42(a3)
[00020aac] 2f39 000e 692a            move.l     _globl,-(a7)
[00020ab2] 486f 000a                 pea.l      10(a7)
[00020ab6] 486f 000c                 pea.l      12(a7)
[00020aba] 206b 0014                 movea.l    20(a3),a0
[00020abe] 3f28 0016                 move.w     22(a0),-(a7)
[00020ac2] 3f28 0014                 move.w     20(a0),-(a7)
[00020ac6] 3f28 0012                 move.w     18(a0),-(a7)
[00020aca] 43ef 0014                 lea.l      20(a7),a1
[00020ace] 41ef 0012                 lea.l      18(a7),a0
[00020ad2] 286b 0014                 movea.l    20(a3),a4
[00020ad6] 342c 0010                 move.w     16(a4),d2
[00020ada] 322b 0022                 move.w     34(a3),d1
[00020ade] c27c f01f                 and.w      #$F01F,d1
[00020ae2] 4240                      clr.w      d0
[00020ae4] 4eb9 0007 b8da            jsr        mt_wind_calc
[00020aea] 4fef 0012                 lea.l      18(a7),a7
[00020aee] 362b 0022                 move.w     34(a3),d3
[00020af2] 2052                      movea.l    (a2),a0
[00020af4] 302f 0004                 move.w     4(a7),d0
[00020af8] b068 000c                 cmp.w      12(a0),d0
[00020afc] 6c04                      bge.s      $00020B02
[00020afe] c67c f1ff                 and.w      #$F1FF,d3
[00020b02] 2052                      movea.l    (a2),a0
[00020b04] 302f 0006                 move.w     6(a7),d0
[00020b08] b068 000e                 cmp.w      14(a0),d0
[00020b0c] 6c04                      bge.s      $00020B12
[00020b0e] c67c fe3f                 and.w      #$FE3F,d3
[00020b12] 3003                      move.w     d3,d0
[00020b14] c07c 0900                 and.w      #$0900,d0
[00020b18] 6604                      bne.s      $00020B1E
[00020b1a] c67c ffdf                 and.w      #$FFDF,d3
[00020b1e] b66b 0022                 cmp.w      34(a3),d3
[00020b22] 6722                      beq.s      $00020B46
[00020b24] 3743 0022                 move.w     d3,34(a3)
[00020b28] 006b 0100 0056            ori.w      #$0100,86(a3)
[00020b2e] 204b                      movea.l    a3,a0
[00020b30] 4eb9 0005 8362            jsr        Awi_closed
[00020b36] 204b                      movea.l    a3,a0
[00020b38] 4eb9 0005 7428            jsr        Awi_open
[00020b3e] 026b feff 0056            andi.w     #$FEFF,86(a3)
[00020b44] 6008                      bra.s      $00020B4E
[00020b46] 204b                      movea.l    a3,a0
[00020b48] 4eb9 0001 607e            jsr        view_shrink
[00020b4e] 504f                      addq.w     #8,a7
[00020b50] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00020b54] 4e75                      rts
acc_icon:
[00020b56] 48e7 0038                 movem.l    a2-a4,-(a7)
[00020b5a] 4fef ffa6                 lea.l      -90(a7),a7
[00020b5e] 2450                      movea.l    (a0),a2
[00020b60] 2f52 0052                 move.l     (a2),82(a7)
[00020b64] 206a 0008                 movea.l    8(a2),a0
[00020b68] 2868 018c                 movea.l    396(a0),a4
[00020b6c] 7022                      moveq.l    #34,d0
[00020b6e] 224c                      movea.l    a4,a1
[00020b70] 41d7                      lea.l      (a7),a0
[00020b72] 4eb9 0008 3500            jsr        memcpy
[00020b78] 7216                      moveq.l    #22,d1
[00020b7a] 4240                      clr.w      d0
[00020b7c] 41ef 0026                 lea.l      38(a7),a0
[00020b80] 4eb9 0008 36ea            jsr        memset
[00020b86] 7216                      moveq.l    #22,d1
[00020b88] 4240                      clr.w      d0
[00020b8a] 41ef 003c                 lea.l      60(a7),a0
[00020b8e] 4eb9 0008 36ea            jsr        memset
[00020b94] 97cb                      suba.l     a3,a3
[00020b96] 202a 0030                 move.l     48(a2),d0
[00020b9a] 673c                      beq.s      $00020BD8
[00020b9c] 2f4b 004e                 move.l     a3,78(a7)
[00020ba0] 3f7c 0008 003c            move.w     #$0008,60(a7)
[00020ba6] 224c                      movea.l    a4,a1
[00020ba8] 2040                      movea.l    d0,a0
[00020baa] 7008                      moveq.l    #8,d0
[00020bac] 6100 d72c                 bsr        from_cicon
[00020bb0] 2f48 003e                 move.l     a0,62(a7)
[00020bb4] 2f6a 0034 0042            move.l     52(a2),66(a7)
[00020bba] 202a 0038                 move.l     56(a2),d0
[00020bbe] 6714                      beq.s      $00020BD4
[00020bc0] 224c                      movea.l    a4,a1
[00020bc2] 2040                      movea.l    d0,a0
[00020bc4] 7008                      moveq.l    #8,d0
[00020bc6] 6100 d712                 bsr        from_cicon
[00020bca] 2f48 0046                 move.l     a0,70(a7)
[00020bce] 2f6a 003c 004a            move.l     60(a2),74(a7)
[00020bd4] 47ef 003c                 lea.l      60(a7),a3
[00020bd8] 202a 001a                 move.l     26(a2),d0
[00020bdc] 673c                      beq.s      $00020C1A
[00020bde] 2f4b 0038                 move.l     a3,56(a7)
[00020be2] 3f7c 0004 0026            move.w     #$0004,38(a7)
[00020be8] 224c                      movea.l    a4,a1
[00020bea] 2040                      movea.l    d0,a0
[00020bec] 7004                      moveq.l    #4,d0
[00020bee] 6100 d6ea                 bsr        from_cicon
[00020bf2] 2f48 0028                 move.l     a0,40(a7)
[00020bf6] 2f6a 001e 002c            move.l     30(a2),44(a7)
[00020bfc] 202a 0022                 move.l     34(a2),d0
[00020c00] 6714                      beq.s      $00020C16
[00020c02] 224c                      movea.l    a4,a1
[00020c04] 2040                      movea.l    d0,a0
[00020c06] 7004                      moveq.l    #4,d0
[00020c08] 6100 d6d0                 bsr        from_cicon
[00020c0c] 2f48 0030                 move.l     a0,48(a7)
[00020c10] 2f6a 0026 0034            move.l     38(a2),52(a7)
[00020c16] 47ef 0026                 lea.l      38(a7),a3
[00020c1a] 2f4b 0022                 move.l     a3,34(a7)
[00020c1e] 43d7                      lea.l      (a7),a1
[00020c20] 206f 0052                 movea.l    82(a7),a0
[00020c24] 4eb9 0003 490a            jsr        dup_icon
[00020c2a] 2648                      movea.l    a0,a3
[00020c2c] 200b                      move.l     a3,d0
[00020c2e] 673e                      beq.s      $00020C6E
[00020c30] 206a 0004                 movea.l    4(a2),a0
[00020c34] 2f68 0004 0056            move.l     4(a0),86(a7)
[00020c3a] 216b 0004 0004            move.l     4(a3),4(a0)
[00020c40] 276f 0056 0004            move.l     86(a7),4(a3)
[00020c46] 202b 000e                 move.l     14(a3),d0
[00020c4a] 2768 000e 000e            move.l     14(a0),14(a3)
[00020c50] 2140 000e                 move.l     d0,14(a0)
[00020c54] 202b 000a                 move.l     10(a3),d0
[00020c58] 2768 000a 000a            move.l     10(a0),10(a3)
[00020c5e] 2140 000a                 move.l     d0,10(a0)
[00020c62] 224b                      movea.l    a3,a1
[00020c64] 206f 0052                 movea.l    82(a7),a0
[00020c68] 4eb9 0003 4b40            jsr        del_icon
[00020c6e] 206f 0028                 movea.l    40(a7),a0
[00020c72] 4eb9 0004 c6c8            jsr        Ax_ifree
[00020c78] 206f 0030                 movea.l    48(a7),a0
[00020c7c] 4eb9 0004 c6c8            jsr        Ax_ifree
[00020c82] 206f 003e                 movea.l    62(a7),a0
[00020c86] 4eb9 0004 c6c8            jsr        Ax_ifree
[00020c8c] 206f 0046                 movea.l    70(a7),a0
[00020c90] 4eb9 0004 c6c8            jsr        Ax_ifree
[00020c96] 4fef 005a                 lea.l      90(a7),a7
[00020c9a] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00020c9e] 4e75                      rts
ic_keys:
[00020ca0] 48e7 0038                 movem.l    a2-a4,-(a7)
[00020ca4] 594f                      subq.w     #4,a7
[00020ca6] 2448                      movea.l    a0,a2
[00020ca8] 4eb9 0006 b744            jsr        Awi_keys
[00020cae] 2052                      movea.l    (a2),a0
[00020cb0] 2268 0008                 movea.l    8(a0),a1
[00020cb4] 2669 018c                 movea.l    396(a1),a3
[00020cb8] 49eb 000c                 lea.l      12(a3),a4
[00020cbc] 43d7                      lea.l      (a7),a1
[00020cbe] 7003                      moveq.l    #3,d0
[00020cc0] 206a 0014                 movea.l    20(a2),a0
[00020cc4] 41e8 0288                 lea.l      648(a0),a0
[00020cc8] 4eb9 0006 a068            jsr        Auo_boxed
[00020cce] 2057                      movea.l    (a7),a0
[00020cd0] 1950 0001                 move.b     (a0),1(a4)
[00020cd4] 226b 0008                 movea.l    8(a3),a1
[00020cd8] 701a                      moveq.l    #26,d0
[00020cda] 206a 0014                 movea.l    20(a2),a0
[00020cde] 4eb9 0005 11da            jsr        Aob_gettext
[00020ce4] 72ff                      moveq.l    #-1,d1
[00020ce6] 7010                      moveq.l    #16,d0
[00020ce8] 204a                      movea.l    a2,a0
[00020cea] 226a 0066                 movea.l    102(a2),a1
[00020cee] 4e91                      jsr        (a1)
[00020cf0] 70ff                      moveq.l    #-1,d0
[00020cf2] 584f                      addq.w     #4,a7
[00020cf4] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00020cf8] 4e75                      rts
ic_make:
[00020cfa] 48e7 0038                 movem.l    a2-a4,-(a7)
[00020cfe] 594f                      subq.w     #4,a7
[00020d00] 2e88                      move.l     a0,(a7)
[00020d02] 2668 0004                 movea.l    4(a0),a3
[00020d06] 286b 0012                 movea.l    18(a3),a4
[00020d0a] 200c                      move.l     a4,d0
[00020d0c] 670c                      beq.s      $00020D1A
[00020d0e] 204c                      movea.l    a4,a0
[00020d10] 4eb9 0005 6bea            jsr        Awi_show
[00020d16] 6000 00ce                 bra        $00020DE6
[00020d1a] 7048                      moveq.l    #72,d0
[00020d1c] 4eb9 0004 c608            jsr        Ax_malloc
[00020d22] 2448                      movea.l    a0,a2
[00020d24] 200a                      move.l     a2,d0
[00020d26] 6700 00ba                 beq        $00020DE2
[00020d2a] 2257                      movea.l    (a7),a1
[00020d2c] 2091                      move.l     (a1),(a0)
[00020d2e] 2569 0004 0004            move.l     4(a1),4(a2)
[00020d34] 41eb 0016                 lea.l      22(a3),a0
[00020d38] 23c8 000b 0d34            move.l     a0,$000B0D34
[00020d3e] 2279 000b 0d40            movea.l    $000B0D40,a1
[00020d44] 2348 0008                 move.l     a0,8(a1)
[00020d48] 41f9 000b 0ce6            lea.l      WI_ICON,a0
[00020d4e] 4eb9 0005 7052            jsr        Awi_create
[00020d54] 2848                      movea.l    a0,a4
[00020d56] 200c                      move.l     a4,d0
[00020d58] 6754                      beq.s      $00020DAE
[00020d5a] 2257                      movea.l    (a7),a1
[00020d5c] 2051                      movea.l    (a1),a0
[00020d5e] 4868 0168                 pea.l      360(a0)
[00020d62] 43eb 003a                 lea.l      58(a3),a1
[00020d66] 204c                      movea.l    a4,a0
[00020d68] 4eb9 0001 6372            jsr        wi_pos
[00020d6e] 584f                      addq.w     #4,a7
[00020d70] 4240                      clr.w      d0
[00020d72] 206c 0014                 movea.l    20(a4),a0
[00020d76] 3140 01de                 move.w     d0,478(a0)
[00020d7a] 206c 0014                 movea.l    20(a4),a0
[00020d7e] 3140 01dc                 move.w     d0,476(a0)
[00020d82] 206c 0014                 movea.l    20(a4),a0
[00020d86] 0068 0080 01d0            ori.w      #$0080,464(a0)
[00020d8c] 288a                      move.l     a2,(a4)
[00020d8e] 256c 0014 0008            move.l     20(a4),8(a2)
[00020d94] 41f9 000b 0716            lea.l      EDIT_ICON2,a0
[00020d9a] 4eb9 0004 f064            jsr        Aob_create
[00020da0] 2548 000c                 move.l     a0,12(a2)
[00020da4] 6612                      bne.s      $00020DB8
[00020da6] 204c                      movea.l    a4,a0
[00020da8] 4eb9 0004 c7c8            jsr        Ax_free
[00020dae] 204a                      movea.l    a2,a0
[00020db0] 4eb9 0004 c7c8            jsr        Ax_free
[00020db6] 602a                      bra.s      $00020DE2
[00020db8] 206a 000c                 movea.l    12(a2),a0
[00020dbc] 4eb9 0004 fbdc            jsr        Aob_fix
[00020dc2] 274c 0012                 move.l     a4,18(a3)
[00020dc6] 204c                      movea.l    a4,a0
[00020dc8] 4eb9 0002 0e68            jsr        set_icon
[00020dce] 204c                      movea.l    a4,a0
[00020dd0] 226c 000c                 movea.l    12(a4),a1
[00020dd4] 4e91                      jsr        (a1)
[00020dd6] 4a40                      tst.w      d0
[00020dd8] 670c                      beq.s      $00020DE6
[00020dda] 204c                      movea.l    a4,a0
[00020ddc] 4eb9 0002 1074            jsr        term
[00020de2] 91c8                      suba.l     a0,a0
[00020de4] 6002                      bra.s      $00020DE8
[00020de6] 204c                      movea.l    a4,a0
[00020de8] 584f                      addq.w     #4,a7
[00020dea] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00020dee] 4e75                      rts
ic_service:
[00020df0] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00020df4] 2448                      movea.l    a0,a2
[00020df6] 3600                      move.w     d0,d3
[00020df8] 2849                      movea.l    a1,a4
[00020dfa] 2650                      movea.l    (a0),a3
[00020dfc] 5540                      subq.w     #2,d0
[00020dfe] 6708                      beq.s      $00020E08
[00020e00] 907c 270e                 sub.w      #$270E,d0
[00020e04] 6712                      beq.s      $00020E18
[00020e06] 601e                      bra.s      $00020E26
[00020e08] 204a                      movea.l    a2,a0
[00020e0a] 6100 fd4a                 bsr        acc_icon
[00020e0e] 204a                      movea.l    a2,a0
[00020e10] 4eb9 0002 1074            jsr        term
[00020e16] 601c                      bra.s      $00020E34
[00020e18] 226b 0004                 movea.l    4(a3),a1
[00020e1c] 204a                      movea.l    a2,a0
[00020e1e] 4eb9 0001 60ea            jsr        new_name
[00020e24] 600e                      bra.s      $00020E34
[00020e26] 224c                      movea.l    a4,a1
[00020e28] 3003                      move.w     d3,d0
[00020e2a] 204a                      movea.l    a2,a0
[00020e2c] 4eb9 0005 9dd0            jsr        Awi_service
[00020e32] 6002                      bra.s      $00020E36
[00020e34] 7001                      moveq.l    #1,d0
[00020e36] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00020e3a] 4e75                      rts
unfix_alloc:
[00020e3c] 2f0a                      move.l     a2,-(a7)
[00020e3e] 2f0b                      move.l     a3,-(a7)
[00020e40] 2448                      movea.l    a0,a2
[00020e42] 2650                      movea.l    (a0),a3
[00020e44] 200b                      move.l     a3,d0
[00020e46] 671a                      beq.s      $00020E62
[00020e48] 202b 000e                 move.l     14(a3),d0
[00020e4c] 4eb9 0004 c608            jsr        Ax_malloc
[00020e52] 2488                      move.l     a0,(a2)
[00020e54] 202b 000e                 move.l     14(a3),d0
[00020e58] 226b 0004                 movea.l    4(a3),a1
[00020e5c] 4eb9 0008 3500            jsr        memcpy
[00020e62] 265f                      movea.l    (a7)+,a3
[00020e64] 245f                      movea.l    (a7)+,a2
[00020e66] 4e75                      rts
set_icon:
[00020e68] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[00020e6c] 4fef fff6                 lea.l      -10(a7),a7
[00020e70] 2448                      movea.l    a0,a2
[00020e72] 43f9 000b 0e60            lea.l      $000B0E60,a1
[00020e78] 41ef 0004                 lea.l      4(a7),a0
[00020e7c] 10d9                      move.b     (a1)+,(a0)+
[00020e7e] 10d9                      move.b     (a1)+,(a0)+
[00020e80] 2652                      movea.l    (a2),a3
[00020e82] 2eab 0008                 move.l     8(a3),(a7)
[00020e86] 2057                      movea.l    (a7),a0
[00020e88] 2a68 018c                 movea.l    396(a0),a5
[00020e8c] 2f6d 0008 0006            move.l     8(a5),6(a7)
[00020e92] 226b 0004                 movea.l    4(a3),a1
[00020e96] 2c69 0004                 movea.l    4(a1),a6
[00020e9a] 7022                      moveq.l    #34,d0
[00020e9c] 204d                      movea.l    a5,a0
[00020e9e] 224e                      movea.l    a6,a1
[00020ea0] 4eb9 0008 3500            jsr        memcpy
[00020ea6] 2b6f 0006 0008            move.l     6(a7),8(a5)
[00020eac] 7016                      moveq.l    #22,d0
[00020eae] 43ee 0026                 lea.l      38(a6),a1
[00020eb2] 41eb 0018                 lea.l      24(a3),a0
[00020eb6] 4eb9 0008 3500            jsr        memcpy
[00020ebc] 7016                      moveq.l    #22,d0
[00020ebe] 43ee 003c                 lea.l      60(a6),a1
[00020ec2] 41eb 002e                 lea.l      46(a3),a0
[00020ec6] 4eb9 0008 3500            jsr        memcpy
[00020ecc] 760f                      moveq.l    #15,d3
[00020ece] d66d 0016                 add.w      22(a5),d3
[00020ed2] c67c fff0                 and.w      #$FFF0,d3
[00020ed6] c7ed 0018                 muls.w     24(a5),d3
[00020eda] e643                      asr.w      #3,d3
[00020edc] 48c3                      ext.l      d3
[00020ede] 302b 0018                 move.w     24(a3),d0
[00020ee2] 6f4a                      ble.s      $00020F2E
[00020ee4] 41eb 001e                 lea.l      30(a3),a0
[00020ee8] 6100 ff52                 bsr        unfix_alloc
[00020eec] 286b 001a                 movea.l    26(a3),a4
[00020ef0] 2f0d                      move.l     a5,-(a7)
[00020ef2] 7004                      moveq.l    #4,d0
[00020ef4] 226b 001e                 movea.l    30(a3),a1
[00020ef8] 206c 0004                 movea.l    4(a4),a0
[00020efc] 6100 d266                 bsr        ito_cicon
[00020f00] 584f                      addq.w     #4,a7
[00020f02] 2748 001a                 move.l     a0,26(a3)
[00020f06] 202b 0022                 move.l     34(a3),d0
[00020f0a] 6722                      beq.s      $00020F2E
[00020f0c] 41eb 0026                 lea.l      38(a3),a0
[00020f10] 6100 ff2a                 bsr        unfix_alloc
[00020f14] 286b 0022                 movea.l    34(a3),a4
[00020f18] 2f0d                      move.l     a5,-(a7)
[00020f1a] 7004                      moveq.l    #4,d0
[00020f1c] 226b 0026                 movea.l    38(a3),a1
[00020f20] 206c 0004                 movea.l    4(a4),a0
[00020f24] 6100 d23e                 bsr        ito_cicon
[00020f28] 584f                      addq.w     #4,a7
[00020f2a] 2748 0022                 move.l     a0,34(a3)
[00020f2e] 302b 002e                 move.w     46(a3),d0
[00020f32] 6f4a                      ble.s      $00020F7E
[00020f34] 41eb 0034                 lea.l      52(a3),a0
[00020f38] 6100 ff02                 bsr        unfix_alloc
[00020f3c] 286b 0030                 movea.l    48(a3),a4
[00020f40] 2f0d                      move.l     a5,-(a7)
[00020f42] 7008                      moveq.l    #8,d0
[00020f44] 226b 0034                 movea.l    52(a3),a1
[00020f48] 206c 0004                 movea.l    4(a4),a0
[00020f4c] 6100 d216                 bsr        ito_cicon
[00020f50] 584f                      addq.w     #4,a7
[00020f52] 2748 0030                 move.l     a0,48(a3)
[00020f56] 202b 0038                 move.l     56(a3),d0
[00020f5a] 6722                      beq.s      $00020F7E
[00020f5c] 41eb 003c                 lea.l      60(a3),a0
[00020f60] 6100 feda                 bsr        unfix_alloc
[00020f64] 286b 0038                 movea.l    56(a3),a4
[00020f68] 2f0d                      move.l     a5,-(a7)
[00020f6a] 7008                      moveq.l    #8,d0
[00020f6c] 226b 003c                 movea.l    60(a3),a1
[00020f70] 206c 0004                 movea.l    4(a4),a0
[00020f74] 6100 d1ee                 bsr        ito_cicon
[00020f78] 584f                      addq.w     #4,a7
[00020f7a] 2748 0038                 move.l     a0,56(a3)
[00020f7e] 2003                      move.l     d3,d0
[00020f80] 4eb9 0004 c608            jsr        Ax_malloc
[00020f86] 2748 0014                 move.l     a0,20(a3)
[00020f8a] 670e                      beq.s      $00020F9A
[00020f8c] 2003                      move.l     d3,d0
[00020f8e] 2216                      move.l     (a6),d1
[00020f90] 43f6 1800                 lea.l      0(a6,d1.l),a1
[00020f94] 4eb9 0008 3500            jsr        memcpy
[00020f9a] 2003                      move.l     d3,d0
[00020f9c] 4eb9 0004 c608            jsr        Ax_malloc
[00020fa2] 2748 0010                 move.l     a0,16(a3)
[00020fa6] 6710                      beq.s      $00020FB8
[00020fa8] 2003                      move.l     d3,d0
[00020faa] 222e 0004                 move.l     4(a6),d1
[00020fae] 43f6 1800                 lea.l      0(a6,d1.l),a1
[00020fb2] 4eb9 0008 3500            jsr        memcpy
[00020fb8] 204a                      movea.l    a2,a0
[00020fba] 6100 d406                 bsr        edic_link
[00020fbe] 286e 0008                 movea.l    8(a6),a4
[00020fc2] 226c 0004                 movea.l    4(a4),a1
[00020fc6] 7004                      moveq.l    #4,d0
[00020fc8] 2057                      movea.l    (a7),a0
[00020fca] 41e8 0270                 lea.l      624(a0),a0
[00020fce] 4eb9 0006 a068            jsr        Auo_boxed
[00020fd4] 226c 0004                 movea.l    4(a4),a1
[00020fd8] 206f 0006                 movea.l    6(a7),a0
[00020fdc] 4eb9 0008 2f0c            jsr        strcpy
[00020fe2] 1f6d 000d 0004            move.b     13(a5),4(a7)
[00020fe8] 43ef 0004                 lea.l      4(a7),a1
[00020fec] 7004                      moveq.l    #4,d0
[00020fee] 2057                      movea.l    (a7),a0
[00020ff0] 41e8 0288                 lea.l      648(a0),a0
[00020ff4] 4eb9 0006 a068            jsr        Auo_boxed
[00020ffa] 362d 000c                 move.w     12(a5),d3
[00020ffe] 700c                      moveq.l    #12,d0
[00021000] e063                      asr.w      d0,d3
[00021002] c67c 000f                 and.w      #$000F,d3
[00021006] 49f9 000c a6d0            lea.l      colour_text,a4
[0002100c] 3003                      move.w     d3,d0
[0002100e] 48c0                      ext.l      d0
[00021010] e588                      lsl.l      #2,d0
[00021012] 2274 0800                 movea.l    0(a4,d0.l),a1
[00021016] 206a 0014                 movea.l    20(a2),a0
[0002101a] 7007                      moveq.l    #7,d0
[0002101c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00021022] 206a 0014                 movea.l    20(a2),a0
[00021026] 3003                      move.w     d3,d0
[00021028] 0268 fff0 009e            andi.w     #$FFF0,158(a0)
[0002102e] c07c 000f                 and.w      #$000F,d0
[00021032] 8168 009e                 or.w       d0,158(a0)
[00021036] 362d 000c                 move.w     12(a5),d3
[0002103a] e043                      asr.w      #8,d3
[0002103c] c67c 000f                 and.w      #$000F,d3
[00021040] 3003                      move.w     d3,d0
[00021042] 48c0                      ext.l      d0
[00021044] e588                      lsl.l      #2,d0
[00021046] 2274 0800                 movea.l    0(a4,d0.l),a1
[0002104a] 206a 0014                 movea.l    20(a2),a0
[0002104e] 700d                      moveq.l    #13,d0
[00021050] 4eb9 0005 0fd8            jsr        Aob_puttext
[00021056] 206a 0014                 movea.l    20(a2),a0
[0002105a] 3003                      move.w     d3,d0
[0002105c] 0268 fff0 012e            andi.w     #$FFF0,302(a0)
[00021062] c07c 000f                 and.w      #$000F,d0
[00021066] 8168 012e                 or.w       d0,302(a0)
[0002106a] 4fef 000a                 lea.l      10(a7),a7
[0002106e] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[00021072] 4e75                      rts
term:
[00021074] 2f0a                      move.l     a2,-(a7)
[00021076] 2f0b                      move.l     a3,-(a7)
[00021078] 2448                      movea.l    a0,a2
[0002107a] 006a 0100 0056            ori.w      #$0100,86(a2)
[00021080] 2650                      movea.l    (a0),a3
[00021082] 226b 0008                 movea.l    8(a3),a1
[00021086] 2069 018c                 movea.l    396(a1),a0
[0002108a] 42a8 0022                 clr.l      34(a0)
[0002108e] 206b 0004                 movea.l    4(a3),a0
[00021092] 42a8 0012                 clr.l      18(a0)
[00021096] 206a 0014                 movea.l    20(a2),a0
[0002109a] b1eb 0008                 cmpa.l     8(a3),a0
[0002109e] 660c                      bne.s      $000210AC
[000210a0] 206b 000c                 movea.l    12(a3),a0
[000210a4] 4eb9 0004 f20a            jsr        Aob_delete
[000210aa] 600a                      bra.s      $000210B6
[000210ac] 206b 0008                 movea.l    8(a3),a0
[000210b0] 4eb9 0004 f20a            jsr        Aob_delete
[000210b6] 302a 0056                 move.w     86(a2),d0
[000210ba] c07c 0800                 and.w      #$0800,d0
[000210be] 6716                      beq.s      $000210D6
[000210c0] 43ea 002c                 lea.l      44(a2),a1
[000210c4] 206b 0004                 movea.l    4(a3),a0
[000210c8] 41e8 003a                 lea.l      58(a0),a0
[000210cc] 7008                      moveq.l    #8,d0
[000210ce] 4eb9 0008 3500            jsr        memcpy
[000210d4] 6014                      bra.s      $000210EA
[000210d6] 7008                      moveq.l    #8,d0
[000210d8] 43ea 0024                 lea.l      36(a2),a1
[000210dc] 206b 0004                 movea.l    4(a3),a0
[000210e0] 41e8 003a                 lea.l      58(a0),a0
[000210e4] 4eb9 0008 3500            jsr        memcpy
[000210ea] 206b 0010                 movea.l    16(a3),a0
[000210ee] 4eb9 0004 c7c8            jsr        Ax_free
[000210f4] 206b 0014                 movea.l    20(a3),a0
[000210f8] 4eb9 0004 c7c8            jsr        Ax_free
[000210fe] 202b 001a                 move.l     26(a3),d0
[00021102] 670a                      beq.s      $0002110E
[00021104] 2040                      movea.l    d0,a0
[00021106] 5d48                      subq.w     #6,a0
[00021108] 4eb9 0004 c7c8            jsr        Ax_free
[0002110e] 206b 001e                 movea.l    30(a3),a0
[00021112] 4eb9 0004 c7c8            jsr        Ax_free
[00021118] 202b 0022                 move.l     34(a3),d0
[0002111c] 670a                      beq.s      $00021128
[0002111e] 2040                      movea.l    d0,a0
[00021120] 5d48                      subq.w     #6,a0
[00021122] 4eb9 0004 c7c8            jsr        Ax_free
[00021128] 206b 0026                 movea.l    38(a3),a0
[0002112c] 4eb9 0004 c7c8            jsr        Ax_free
[00021132] 202b 0030                 move.l     48(a3),d0
[00021136] 670a                      beq.s      $00021142
[00021138] 2040                      movea.l    d0,a0
[0002113a] 5d48                      subq.w     #6,a0
[0002113c] 4eb9 0004 c7c8            jsr        Ax_free
[00021142] 206b 0034                 movea.l    52(a3),a0
[00021146] 4eb9 0004 c7c8            jsr        Ax_free
[0002114c] 202b 0038                 move.l     56(a3),d0
[00021150] 670a                      beq.s      $0002115C
[00021152] 2040                      movea.l    d0,a0
[00021154] 5d48                      subq.w     #6,a0
[00021156] 4eb9 0004 c7c8            jsr        Ax_free
[0002115c] 206b 003c                 movea.l    60(a3),a0
[00021160] 4eb9 0004 c7c8            jsr        Ax_free
[00021166] 204b                      movea.l    a3,a0
[00021168] 4eb9 0004 c7c8            jsr        Ax_free
[0002116e] 204a                      movea.l    a2,a0
[00021170] 4eb9 0005 85f2            jsr        Awi_delete
[00021176] 265f                      movea.l    (a7)+,a3
[00021178] 245f                      movea.l    (a7)+,a2
[0002117a] 4e75                      rts
piccolor:
[0002117c] 48e7 3028                 movem.l    d2-d3/a2/a4,-(a7)
[00021180] 4fef ffec                 lea.l      -20(a7),a7
[00021184] 246f 0028                 movea.l    40(a7),a2
[00021188] 202a 001a                 move.l     26(a2),d0
[0002118c] 6608                      bne.s      $00021196
[0002118e] 76ff                      moveq.l    #-1,d3
[00021190] d66a 0004                 add.w      4(a2),d3
[00021194] 6004                      bra.s      $0002119A
[00021196] 362a 001c                 move.w     28(a2),d3
[0002119a] 3f6a 0016 0004            move.w     22(a2),4(a7)
[000211a0] 3f6a 0018 0006            move.w     24(a2),6(a7)
[000211a6] 3eaa 0012                 move.w     18(a2),(a7)
[000211aa] 3f6a 0014 0002            move.w     20(a2),2(a7)
[000211b0] 70ff                      moveq.l    #-1,d0
[000211b2] d057                      add.w      (a7),d0
[000211b4] d16f 0004                 add.w      d0,4(a7)
[000211b8] 70ff                      moveq.l    #-1,d0
[000211ba] d06f 0002                 add.w      2(a7),d0
[000211be] d16f 0006                 add.w      d0,6(a7)
[000211c2] 49f9 0010 ee4e            lea.l      ACSblk,a4
[000211c8] 41d7                      lea.l      (a7),a0
[000211ca] 7201                      moveq.l    #1,d1
[000211cc] 2254                      movea.l    (a4),a1
[000211ce] 3029 0010                 move.w     16(a1),d0
[000211d2] 4eb9 0007 2230            jsr        vs_clip
[000211d8] 7001                      moveq.l    #1,d0
[000211da] d06a 000a                 add.w      10(a2),d0
[000211de] 3e80                      move.w     d0,(a7)
[000211e0] 7201                      moveq.l    #1,d1
[000211e2] d26a 000c                 add.w      12(a2),d1
[000211e6] 3f41 0002                 move.w     d1,2(a7)
[000211ea] 342a 000a                 move.w     10(a2),d2
[000211ee] d46a 000e                 add.w      14(a2),d2
[000211f2] 5542                      subq.w     #2,d2
[000211f4] 3f42 0004                 move.w     d2,4(a7)
[000211f8] 302a 000c                 move.w     12(a2),d0
[000211fc] d06a 0010                 add.w      16(a2),d0
[00021200] 5540                      subq.w     #2,d0
[00021202] 3f40 0006                 move.w     d0,6(a7)
[00021206] 2054                      movea.l    (a4),a0
[00021208] 3028 0010                 move.w     16(a0),d0
[0002120c] 7201                      moveq.l    #1,d1
[0002120e] 4eb9 0007 3070            jsr        vswr_mode
[00021214] 7201                      moveq.l    #1,d1
[00021216] 2054                      movea.l    (a4),a0
[00021218] 3028 0010                 move.w     16(a0),d0
[0002121c] 4eb9 0007 3660            jsr        vsf_interior
[00021222] 7201                      moveq.l    #1,d1
[00021224] 2054                      movea.l    (a4),a0
[00021226] 3028 0010                 move.w     16(a0),d0
[0002122a] 4eb9 0007 375c            jsr        vsf_perimeter
[00021230] 3203                      move.w     d3,d1
[00021232] 2054                      movea.l    (a4),a0
[00021234] 3028 0010                 move.w     16(a0),d0
[00021238] 4eb9 0007 3708            jsr        vsf_color
[0002123e] 41d7                      lea.l      (a7),a0
[00021240] 2254                      movea.l    (a4),a1
[00021242] 3029 0010                 move.w     16(a1),d0
[00021246] 4eb9 0007 282e            jsr        v_bar
[0002124c] 7001                      moveq.l    #1,d0
[0002124e] c06a 0008                 and.w      8(a2),d0
[00021252] 6710                      beq.s      $00021264
[00021254] 7201                      moveq.l    #1,d1
[00021256] 2054                      movea.l    (a4),a0
[00021258] 3028 0010                 move.w     16(a0),d0
[0002125c] 4eb9 0007 31c0            jsr        vsl_color
[00021262] 600e                      bra.s      $00021272
[00021264] 4241                      clr.w      d1
[00021266] 2054                      movea.l    (a4),a0
[00021268] 3028 0010                 move.w     16(a0),d0
[0002126c] 4eb9 0007 31c0            jsr        vsl_color
[00021272] 5357                      subq.w     #1,(a7)
[00021274] 536f 0002                 subq.w     #1,2(a7)
[00021278] 526f 0004                 addq.w     #1,4(a7)
[0002127c] 526f 0006                 addq.w     #1,6(a7)
[00021280] 3f57 0010                 move.w     (a7),16(a7)
[00021284] 3f6f 0002 0012            move.w     2(a7),18(a7)
[0002128a] 3f57 000c                 move.w     (a7),12(a7)
[0002128e] 3f6f 0006 000e            move.w     6(a7),14(a7)
[00021294] 3f6f 0004 0008            move.w     4(a7),8(a7)
[0002129a] 3f6f 0006 000a            move.w     6(a7),10(a7)
[000212a0] 3f6f 0002 0006            move.w     2(a7),6(a7)
[000212a6] 7201                      moveq.l    #1,d1
[000212a8] 2054                      movea.l    (a4),a0
[000212aa] 3028 0010                 move.w     16(a0),d0
[000212ae] 4eb9 0007 316a            jsr        vsl_width
[000212b4] 4242                      clr.w      d2
[000212b6] 4241                      clr.w      d1
[000212b8] 2054                      movea.l    (a4),a0
[000212ba] 3028 0010                 move.w     16(a0),d0
[000212be] 4eb9 0007 3214            jsr        vsl_ends
[000212c4] 41d7                      lea.l      (a7),a0
[000212c6] 7205                      moveq.l    #5,d1
[000212c8] 2254                      movea.l    (a4),a1
[000212ca] 3029 0010                 move.w     16(a1),d0
[000212ce] 4eb9 0007 22e0            jsr        v_pline
[000212d4] 41d7                      lea.l      (a7),a0
[000212d6] 4241                      clr.w      d1
[000212d8] 2254                      movea.l    (a4),a1
[000212da] 3029 0010                 move.w     16(a1),d0
[000212de] 4eb9 0007 2230            jsr        vs_clip
[000212e4] 302a 0008                 move.w     8(a2),d0
[000212e8] 4fef 0014                 lea.l      20(a7),a7
[000212ec] 4cdf 140c                 movem.l    (a7)+,d2-d3/a2/a4
[000212f0] 4e75                      rts
IcnCol:
[000212f2] 48e7 3028                 movem.l    d2-d3/a2/a4,-(a7)
[000212f6] 4fef ffec                 lea.l      -20(a7),a7
[000212fa] 246f 0028                 movea.l    40(a7),a2
[000212fe] 362a 001c                 move.w     28(a2),d3
[00021302] 3eaa 0012                 move.w     18(a2),(a7)
[00021306] 3f6a 0014 0002            move.w     20(a2),2(a7)
[0002130c] 302a 0016                 move.w     22(a2),d0
[00021310] d057                      add.w      (a7),d0
[00021312] 5340                      subq.w     #1,d0
[00021314] 3f40 0004                 move.w     d0,4(a7)
[00021318] 322a 0018                 move.w     24(a2),d1
[0002131c] d26f 0002                 add.w      2(a7),d1
[00021320] 5341                      subq.w     #1,d1
[00021322] 3f41 0006                 move.w     d1,6(a7)
[00021326] 49f9 0010 ee4e            lea.l      ACSblk,a4
[0002132c] 41d7                      lea.l      (a7),a0
[0002132e] 7201                      moveq.l    #1,d1
[00021330] 2254                      movea.l    (a4),a1
[00021332] 3029 0010                 move.w     16(a1),d0
[00021336] 4eb9 0007 2230            jsr        vs_clip
[0002133c] 3eaa 000a                 move.w     10(a2),(a7)
[00021340] 3f6a 000c 0002            move.w     12(a2),2(a7)
[00021346] 302a 000a                 move.w     10(a2),d0
[0002134a] d06a 000e                 add.w      14(a2),d0
[0002134e] 5340                      subq.w     #1,d0
[00021350] 3f40 0004                 move.w     d0,4(a7)
[00021354] 322a 000c                 move.w     12(a2),d1
[00021358] d26a 0010                 add.w      16(a2),d1
[0002135c] 5341                      subq.w     #1,d1
[0002135e] 3f41 0006                 move.w     d1,6(a7)
[00021362] 2054                      movea.l    (a4),a0
[00021364] 3028 0010                 move.w     16(a0),d0
[00021368] 7201                      moveq.l    #1,d1
[0002136a] 4eb9 0007 3070            jsr        vswr_mode
[00021370] 4a43                      tst.w      d3
[00021372] 6b1e                      bmi.s      $00021392
[00021374] 7201                      moveq.l    #1,d1
[00021376] 2054                      movea.l    (a4),a0
[00021378] 3028 0010                 move.w     16(a0),d0
[0002137c] 4eb9 0007 3660            jsr        vsf_interior
[00021382] 3203                      move.w     d3,d1
[00021384] 2054                      movea.l    (a4),a0
[00021386] 3028 0010                 move.w     16(a0),d0
[0002138a] 4eb9 0007 3708            jsr        vsf_color
[00021390] 602a                      bra.s      $000213BC
[00021392] 7202                      moveq.l    #2,d1
[00021394] 2054                      movea.l    (a4),a0
[00021396] 3028 0010                 move.w     16(a0),d0
[0002139a] 4eb9 0007 3660            jsr        vsf_interior
[000213a0] 7204                      moveq.l    #4,d1
[000213a2] 2054                      movea.l    (a4),a0
[000213a4] 3028 0010                 move.w     16(a0),d0
[000213a8] 4eb9 0007 36b4            jsr        vsf_style
[000213ae] 7201                      moveq.l    #1,d1
[000213b0] 2054                      movea.l    (a4),a0
[000213b2] 3028 0010                 move.w     16(a0),d0
[000213b6] 4eb9 0007 3708            jsr        vsf_color
[000213bc] 7201                      moveq.l    #1,d1
[000213be] 2054                      movea.l    (a4),a0
[000213c0] 3028 0010                 move.w     16(a0),d0
[000213c4] 4eb9 0007 375c            jsr        vsf_perimeter
[000213ca] 41d7                      lea.l      (a7),a0
[000213cc] 2254                      movea.l    (a4),a1
[000213ce] 3029 0010                 move.w     16(a1),d0
[000213d2] 4eb9 0007 282e            jsr        v_bar
[000213d8] 41d7                      lea.l      (a7),a0
[000213da] 4241                      clr.w      d1
[000213dc] 2254                      movea.l    (a4),a1
[000213de] 3029 0010                 move.w     16(a1),d0
[000213e2] 4eb9 0007 2230            jsr        vs_clip
[000213e8] 4240                      clr.w      d0
[000213ea] 4fef 0014                 lea.l      20(a7),a7
[000213ee] 4cdf 140c                 movem.l    (a7)+,d2-d3/a2/a4
[000213f2] 4e75                      rts
