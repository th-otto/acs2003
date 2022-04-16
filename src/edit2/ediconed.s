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
[0001e094] 6b2a                      bmi.s      edic_backcol_1
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
edic_backcol_1:
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
[0001e0f8] 6b2c                      bmi.s      edic_frontcol_1
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
edic_frontcol_1:
[0001e126] 245f                      movea.l    (a7)+,a2
[0001e128] 261f                      move.l     (a7)+,d3
[0001e12a] 4e75                      rts

getFgColor:
[0001e12c] 5d4f                      subq.w     #6,a7
[0001e12e] 41d7                      lea.l      (a7),a0
[0001e130] 4242                      clr.w      d2
[0001e132] 3200                      move.w     d0,d1
[0001e134] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001e13a] 3029 0010                 move.w     16(a1),d0
[0001e13e] 4eb9 0007 5406            jsr        vq_color
[0001e144] 0c57 01f4                 cmpi.w     #$01F4,(a7)
[0001e148] 6c14                      bge.s      getFgColor_1
[0001e14a] 0c6f 0190 0002            cmpi.w     #$0190,2(a7)
[0001e150] 6c0c                      bge.s      getFgColor_1
[0001e152] 0c6f 0258 0004            cmpi.w     #$0258,4(a7)
[0001e158] 6c04                      bge.s      getFgColor_1
[0001e15a] 4240                      clr.w      d0
[0001e15c] 6002                      bra.s      getFgColor_2
getFgColor_1:
[0001e15e] 7001                      moveq.l    #1,d0
getFgColor_2:
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
[0001e17c] 660e                      bne.s      ito_cicon_1
[0001e17e] 2f0a                      move.l     a2,-(a7)
[0001e180] 204b                      movea.l    a3,a0
[0001e182] 4eb9 0001 6766            jsr        to_cicon
[0001e188] 584f                      addq.w     #4,a7
[0001e18a] 6048                      bra.s      ito_cicon_2
ito_cicon_1:
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
[0001e1ba] 6604                      bne.s      ito_cicon_3
[0001e1bc] 91c8                      suba.l     a0,a0
[0001e1be] 6014                      bra.s      ito_cicon_2
ito_cicon_3:
[0001e1c0] 2004                      move.l     d4,d0
[0001e1c2] 43eb 0006                 lea.l      6(a3),a1
[0001e1c6] 41ec 0006                 lea.l      6(a4),a0
[0001e1ca] 4eb9 0008 3500            jsr        memcpy
[0001e1d0] 41ec 0006                 lea.l      6(a4),a0
ito_cicon_2:
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
[0001e1fc] 670c                      beq.s      mfdb_dm_1
[0001e1fe] 7201                      moveq.l    #1,d1
[0001e200] 3341 000a                 move.w     d1,10(a1)
[0001e204] 3141 000a                 move.w     d1,10(a0)
[0001e208] 600a                      bra.s      mfdb_dm_2
mfdb_dm_1:
[0001e20a] 4240                      clr.w      d0
[0001e20c] 3340 000a                 move.w     d0,10(a1)
[0001e210] 3140 000a                 move.w     d0,10(a0)
mfdb_dm_2:
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
[0001e276] 6626                      bne.s      mfdb_dm_3
[0001e278] 316b 001c 000c            move.w     28(a3),12(a0)
[0001e27e] 202c 0022                 move.l     34(a4),d0
[0001e282] 6712                      beq.s      mfdb_dm_4
[0001e284] 7201                      moveq.l    #1,d1
[0001e286] c26a 000a                 and.w      10(a2),d1
[0001e28a] 670a                      beq.s      mfdb_dm_4
[0001e28c] 22ac 0026                 move.l     38(a4),(a1)
[0001e290] 20ac 0022                 move.l     34(a4),(a0)
[0001e294] 6008                      bra.s      mfdb_dm_3
mfdb_dm_4:
[0001e296] 22ac 001e                 move.l     30(a4),(a1)
[0001e29a] 20ac 001a                 move.l     26(a4),(a0)
mfdb_dm_3:
[0001e29e] 302c 002e                 move.w     46(a4),d0
[0001e2a2] 2679 0010 ee4e            movea.l    ACSblk,a3
[0001e2a8] b06b 001c                 cmp.w      28(a3),d0
[0001e2ac] 6626                      bne.s      mfdb_dm_5
[0001e2ae] 316b 001c 000c            move.w     28(a3),12(a0)
[0001e2b4] 202c 0038                 move.l     56(a4),d0
[0001e2b8] 6712                      beq.s      mfdb_dm_6
[0001e2ba] 7201                      moveq.l    #1,d1
[0001e2bc] c26a 000a                 and.w      10(a2),d1
[0001e2c0] 670a                      beq.s      mfdb_dm_6
[0001e2c2] 22ac 003c                 move.l     60(a4),(a1)
[0001e2c6] 20ac 0038                 move.l     56(a4),(a0)
[0001e2ca] 6008                      bra.s      mfdb_dm_5
mfdb_dm_6:
[0001e2cc] 22ac 0034                 move.l     52(a4),(a1)
[0001e2d0] 20ac 0030                 move.l     48(a4),(a0)
mfdb_dm_5:
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
[0001e314] 6606                      bne.s      from_cicon_1
[0001e316] 91c8                      suba.l     a0,a0
[0001e318] 6000 009e                 bra        from_cicon_2
from_cicon_1:
[0001e31c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e322] b868 001c                 cmp.w      28(a0),d4
[0001e326] 660e                      bne.s      from_cicon_3
[0001e328] 2268 023c                 movea.l    572(a0),a1
[0001e32c] 3029 000e                 move.w     14(a1),d0
[0001e330] c07c 0800                 and.w      #$0800,d0
[0001e334] 670e                      beq.s      from_cicon_4
from_cicon_3:
[0001e336] 2005                      move.l     d5,d0
[0001e338] 224d                      movea.l    a5,a1
[0001e33a] 204b                      movea.l    a3,a0
[0001e33c] 4eb9 0008 3500            jsr        memcpy
[0001e342] 6072                      bra.s      from_cicon_5
from_cicon_4:
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
from_cicon_5:
[0001e3b6] 204b                      movea.l    a3,a0
from_cicon_2:
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
[0001e3ea] 661e                      bne.s      edic_link_1
[0001e3ec] 43ea 002e                 lea.l      46(a2),a1
[0001e3f0] 236a 0030 0002            move.l     48(a2),2(a1)
[0001e3f6] 236a 0034 0006            move.l     52(a2),6(a1)
[0001e3fc] 236a 0038 000a            move.l     56(a2),10(a1)
[0001e402] 236a 003c 000e            move.l     60(a2),14(a1)
[0001e408] 602c                      bra.s      edic_link_2
edic_link_1:
[0001e40a] 2679 0010 ee4e            movea.l    ACSblk,a3
[0001e410] 302b 001c                 move.w     28(a3),d0
[0001e414] b06a 0018                 cmp.w      24(a2),d0
[0001e418] 661c                      bne.s      edic_link_2
[0001e41a] 43ea 0018                 lea.l      24(a2),a1
[0001e41e] 236a 001a 0002            move.l     26(a2),2(a1)
[0001e424] 236a 001e 0006            move.l     30(a2),6(a1)
[0001e42a] 236a 0022 000a            move.l     34(a2),10(a1)
[0001e430] 236a 0026 000e            move.l     38(a2),14(a1)
edic_link_2:
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
[0001e544] 6618                      bne.s      edic_black_1
[0001e546] 72ff                      moveq.l    #-1,d1
[0001e548] 43f9 000a e92e            lea.l      COLOR,a1
[0001e54e] 2068 0258                 movea.l    600(a0),a0
[0001e552] 70ff                      moveq.l    #-1,d0
[0001e554] 4eb9 0004 e84a            jsr        Ame_popup
[0001e55a] 3600                      move.w     d0,d3
[0001e55c] 6026                      bra.s      edic_black_2
edic_black_1:
[0001e55e] 302b 002e                 move.w     46(a3),d0
[0001e562] 2052                      movea.l    (a2),a0
[0001e564] b068 001c                 cmp.w      28(a0),d0
[0001e568] 6618                      bne.s      edic_black_3
[0001e56a] 72ff                      moveq.l    #-1,d1
[0001e56c] 43f9 000a eac6            lea.l      COLOR256,a1
[0001e572] 2068 0258                 movea.l    600(a0),a0
[0001e576] 70ff                      moveq.l    #-1,d0
[0001e578] 4eb9 0004 e84a            jsr        Ame_popup
[0001e57e] 3600                      move.w     d0,d3
[0001e580] 6002                      bra.s      edic_black_2
edic_black_3:
[0001e582] 7602                      moveq.l    #2,d3
edic_black_2:
[0001e584] 4a43                      tst.w      d3
[0001e586] 6f16                      ble.s      edic_black_4
[0001e588] 5343                      subq.w     #1,d3
[0001e58a] 3743 0044                 move.w     d3,68(a3)
[0001e58e] 4a43                      tst.w      d3
[0001e590] 6f06                      ble.s      edic_black_5
[0001e592] 6100 ff2a                 bsr        edic_black0
[0001e596] 6006                      bra.s      edic_black_4
edic_black_5:
[0001e598] 4eb9 0001 e5a4            jsr        edic_white
edic_black_4:
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
[0001e69c] 6614                      bne.s      do_plane_1
[0001e69e] 3003                      move.w     d3,d0
[0001e6a0] 48c0                      ext.l      d0
[0001e6a2] 4eb9 0008 3cac            jsr        _lmul
[0001e6a8] 4eb9 0004 c608            jsr        Ax_malloc
[0001e6ae] 2448                      movea.l    a0,a2
[0001e6b0] 601c                      bra.s      do_plane_2
do_plane_1:
[0001e6b2] 3003                      move.w     d3,d0
[0001e6b4] 48c0                      ext.l      d0
[0001e6b6] 2204                      move.l     d4,d1
[0001e6b8] 4eb9 0008 3cac            jsr        _lmul
[0001e6be] 5c80                      addq.l     #6,d0
[0001e6c0] 4eb9 0004 c608            jsr        Ax_malloc
[0001e6c6] 2448                      movea.l    a0,a2
[0001e6c8] 200a                      move.l     a2,d0
[0001e6ca] 6702                      beq.s      do_plane_2
[0001e6cc] 5c4a                      addq.w     #6,a2
do_plane_2:
[0001e6ce] 200a                      move.l     a2,d0
[0001e6d0] 6700 0198                 beq        do_plane_3
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
[0001e6fe] 6600 010c                 bne        do_plane_4
[0001e702] 3028 001c                 move.w     28(a0),d0
[0001e706] 3b40 000c                 move.w     d0,12(a5)
[0001e70a] 3740 000c                 move.w     d0,12(a3)
[0001e70e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001e714] 2268 023c                 movea.l    572(a0),a1
[0001e718] 3229 000e                 move.w     14(a1),d1
[0001e71c] c27c 0800                 and.w      #$0800,d1
[0001e720] 6700 00cc                 beq        do_plane_5
[0001e724] 322d 0006                 move.w     6(a5),d1
[0001e728] 302d 0004                 move.w     4(a5),d0
[0001e72c] 4eb9 0005 4b6e            jsr        Abp_create
[0001e732] 2848                      movea.l    a0,a4
[0001e734] 200c                      move.l     a4,d0
[0001e736] 6714                      beq.s      do_plane_6
[0001e738] 322b 0006                 move.w     6(a3),d1
[0001e73c] 302b 0004                 move.w     4(a3),d0
[0001e740] 4eb9 0005 4b6e            jsr        Abp_create
[0001e746] 2c48                      movea.l    a0,a6
[0001e748] 200e                      move.l     a6,d0
[0001e74a] 662c                      bne.s      do_plane_7
do_plane_6:
[0001e74c] 200c                      move.l     a4,d0
[0001e74e] 6708                      beq.s      do_plane_8
[0001e750] 204c                      movea.l    a4,a0
[0001e752] 4eb9 0005 4c04            jsr        Abp_delete
do_plane_8:
[0001e758] b67c 0001                 cmp.w      #$0001,d3
[0001e75c] 660c                      bne.s      do_plane_9
[0001e75e] 2053                      movea.l    (a3),a0
[0001e760] 4eb9 0004 c7c8            jsr        Ax_free
[0001e766] 6000 0102                 bra        do_plane_3
do_plane_9:
[0001e76a] 2053                      movea.l    (a3),a0
[0001e76c] 5d48                      subq.w     #6,a0
[0001e76e] 4eb9 0004 c7c8            jsr        Ax_free
[0001e774] 6000 00f4                 bra        do_plane_3
do_plane_7:
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
[0001e7ec] 6054                      bra.s      do_plane_10
do_plane_5:
[0001e7ee] 2f0b                      move.l     a3,-(a7)
[0001e7f0] 224d                      movea.l    a5,a1
[0001e7f2] 206f 0028                 movea.l    40(a7),a0
[0001e7f6] 7203                      moveq.l    #3,d1
[0001e7f8] 2879 0010 ee4e            movea.l    ACSblk,a4
[0001e7fe] 302c 0010                 move.w     16(a4),d0
[0001e802] 4eb9 0007 489e            jsr        vro_cpyfm
[0001e808] 584f                      addq.w     #4,a7
[0001e80a] 6036                      bra.s      do_plane_10
do_plane_4:
[0001e80c] 7001                      moveq.l    #1,d0
[0001e80e] 3b40 000c                 move.w     d0,12(a5)
[0001e812] 3740 000c                 move.w     d0,12(a3)
[0001e816] 7aff                      moveq.l    #-1,d5
[0001e818] da43                      add.w      d3,d5
[0001e81a] 6022                      bra.s      do_plane_11
[0001e81c] 2f0b                      move.l     a3,-(a7)
do_plane_12:
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
do_plane_11:
[0001e83e] 4a45                      tst.w      d5
[0001e840] 6ada                      bpl.s      do_plane_12
do_plane_10:
[0001e842] b67c 0001                 cmp.w      #$0001,d3
[0001e846] 660e                      bne.s      do_plane_13
[0001e848] 206f 0028                 movea.l    40(a7),a0
[0001e84c] 2050                      movea.l    (a0),a0
[0001e84e] 4eb9 0004 c6c8            jsr        Ax_ifree
[0001e854] 600e                      bra.s      do_plane_14
do_plane_13:
[0001e856] 206f 0028                 movea.l    40(a7),a0
[0001e85a] 2050                      movea.l    (a0),a0
[0001e85c] 5d48                      subq.w     #6,a0
[0001e85e] 4eb9 0004 c6c8            jsr        Ax_ifree
do_plane_14:
[0001e864] 206f 0028                 movea.l    40(a7),a0
[0001e868] 208a                      move.l     a2,(a0)
do_plane_3:
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
[0001e916] 6c0c                      bge.s      edic_resize_1
[0001e918] 74ff                      moveq.l    #-1,d2
[0001e91a] d443                      add.w      d3,d2
[0001e91c] 3f42 000c                 move.w     d2,12(a7)
[0001e920] 3f42 0004                 move.w     d2,4(a7)
edic_resize_1:
[0001e924] b86c 0018                 cmp.w      24(a4),d4
[0001e928] 6c0c                      bge.s      edic_resize_2
[0001e92a] 70ff                      moveq.l    #-1,d0
[0001e92c] d044                      add.w      d4,d0
[0001e92e] 3f40 000e                 move.w     d0,14(a7)
[0001e932] 3f40 0006                 move.w     d0,6(a7)
edic_resize_2:
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
[0001e978] 6f5e                      ble.s      edic_resize_3
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
[0001e9aa] 672c                      beq.s      edic_resize_3
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
edic_resize_3:
[0001e9d8] 302b 002e                 move.w     46(a3),d0
[0001e9dc] 6f5e                      ble.s      edic_resize_4
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
[0001ea0e] 672c                      beq.s      edic_resize_4
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
edic_resize_4:
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
[0001ea7c] 6f06                      ble.s      edic_check_1
[0001ea7e] 357c 00c0 0016            move.w     #$00C0,22(a2)
edic_check_1:
[0001ea84] 0c6a 00c0 0018            cmpi.w     #$00C0,24(a2)
[0001ea8a] 6f06                      ble.s      edic_check_2
[0001ea8c] 357c 00c0 0018            move.w     #$00C0,24(a2)
edic_check_2:
[0001ea92] 700f                      moveq.l    #15,d0
[0001ea94] d06a 0016                 add.w      22(a2),d0
[0001ea98] c07c fff0                 and.w      #$FFF0,d0
[0001ea9c] 3540 0016                 move.w     d0,22(a2)
[0001eaa0] 302a 0018                 move.w     24(a2),d0
[0001eaa4] 6100 fbce                 bsr        snap
[0001eaa8] 3540 0018                 move.w     d0,24(a2)
[0001eaac] 0c6a 00c0 001e            cmpi.w     #$00C0,30(a2)
[0001eab2] 6f06                      ble.s      edic_check_3
[0001eab4] 357c 00c0 001e            move.w     #$00C0,30(a2)
edic_check_3:
[0001eaba] 0c6a 00c0 0020            cmpi.w     #$00C0,32(a2)
[0001eac0] 6f06                      ble.s      edic_check_4
[0001eac2] 357c 00c0 0020            move.w     #$00C0,32(a2)
edic_check_4:
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
[0001eaec] 6f04                      ble.s      edic_check_5
[0001eaee] 916a 000e                 sub.w      d0,14(a2)
edic_check_5:
[0001eaf2] 7006                      moveq.l    #6,d0
[0001eaf4] d06a 0010                 add.w      16(a2),d0
[0001eaf8] 906a 0018                 sub.w      24(a2),d0
[0001eafc] 4a40                      tst.w      d0
[0001eafe] 6f04                      ble.s      edic_check_6
[0001eb00] 916a 0010                 sub.w      d0,16(a2)
edic_check_6:
[0001eb04] 302a 0012                 move.w     18(a2),d0
[0001eb08] d06a 0016                 add.w      22(a2),d0
[0001eb0c] d07c ff40                 add.w      #$FF40,d0
[0001eb10] 4a40                      tst.w      d0
[0001eb12] 6f04                      ble.s      edic_check_7
[0001eb14] 916a 0012                 sub.w      d0,18(a2)
edic_check_7:
[0001eb18] 302a 0014                 move.w     20(a2),d0
[0001eb1c] d06a 0018                 add.w      24(a2),d0
[0001eb20] d07c ff40                 add.w      #$FF40,d0
[0001eb24] 4a40                      tst.w      d0
[0001eb26] 6f04                      ble.s      edic_check_8
[0001eb28] 916a 0014                 sub.w      d0,20(a2)
edic_check_8:
[0001eb2c] 302a 001a                 move.w     26(a2),d0
[0001eb30] d06a 001e                 add.w      30(a2),d0
[0001eb34] d07c ff40                 add.w      #$FF40,d0
[0001eb38] 4a40                      tst.w      d0
[0001eb3a] 6f04                      ble.s      edic_check_9
[0001eb3c] 916a 001a                 sub.w      d0,26(a2)
edic_check_9:
[0001eb40] 302a 001c                 move.w     28(a2),d0
[0001eb44] d06a 0020                 add.w      32(a2),d0
[0001eb48] d07c ff40                 add.w      #$FF40,d0
[0001eb4c] 4a40                      tst.w      d0
[0001eb4e] 6f04                      ble.s      edic_check_10
[0001eb50] 916a 001c                 sub.w      d0,28(a2)
edic_check_10:
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
[0001ecb2] 6700 0214                 beq        edic_direct_1
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
[0001eda6] 6600 0118                 bne        edic_direct_2
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
edic_direct_2:
[0001eec0] 204a                      movea.l    a2,a0
[0001eec2] 4eb9 0005 85f2            jsr        Awi_delete
edic_direct_1:
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
[0001ef40] 6716                      beq.s      edit_shift_1
[0001ef42] 322f 003a                 move.w     58(a7),d1
[0001ef46] 302f 0038                 move.w     56(a7),d0
[0001ef4a] 4eb9 0005 4b6e            jsr        Abp_create
[0001ef50] 2648                      movea.l    a0,a3
[0001ef52] 200b                      move.l     a3,d0
[0001ef54] 6700 01f0                 beq        edit_shift_2
edit_shift_1:
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
[0001efae] 670e                      beq.s      edit_shift_3
[0001efb0] 5341                      subq.w     #1,d1
[0001efb2] 671c                      beq.s      edit_shift_4
[0001efb4] 5341                      subq.w     #1,d1
[0001efb6] 672c                      beq.s      edit_shift_5
[0001efb8] 5341                      subq.w     #1,d1
[0001efba] 673e                      beq.s      edit_shift_6
[0001efbc] 6050                      bra.s      edit_shift_7
edit_shift_3:
[0001efbe] 5252                      addq.w     #1,(a2)
[0001efc0] 536a 000c                 subq.w     #1,12(a2)
[0001efc4] 302f 0004                 move.w     4(a7),d0
[0001efc8] 3f40 0008                 move.w     d0,8(a7)
[0001efcc] 3e80                      move.w     d0,(a7)
[0001efce] 603e                      bra.s      edit_shift_7
edit_shift_4:
[0001efd0] 536a 0004                 subq.w     #1,4(a2)
[0001efd4] 526a 0008                 addq.w     #1,8(a2)
[0001efd8] 3017                      move.w     (a7),d0
[0001efda] 3f40 000c                 move.w     d0,12(a7)
[0001efde] 3f40 0004                 move.w     d0,4(a7)
[0001efe2] 602a                      bra.s      edit_shift_7
edit_shift_5:
[0001efe4] 526a 0002                 addq.w     #1,2(a2)
[0001efe8] 536a 000e                 subq.w     #1,14(a2)
[0001efec] 302f 0006                 move.w     6(a7),d0
[0001eff0] 3f40 000a                 move.w     d0,10(a7)
[0001eff4] 3f40 0002                 move.w     d0,2(a7)
[0001eff8] 6014                      bra.s      edit_shift_7
edit_shift_6:
[0001effa] 536a 0006                 subq.w     #1,6(a2)
[0001effe] 526a 000a                 addq.w     #1,10(a2)
[0001f002] 302f 0002                 move.w     2(a7),d0
[0001f006] 3f40 000e                 move.w     d0,14(a7)
[0001f00a] 3f40 0006                 move.w     d0,6(a7)
edit_shift_7:
[0001f00e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f014] 2268 023c                 movea.l    572(a0),a1
[0001f018] 3029 000e                 move.w     14(a1),d0
[0001f01c] c07c 0800                 and.w      #$0800,d0
[0001f020] 676e                      beq.s      edit_shift_8
[0001f022] 3228 001c                 move.w     28(a0),d1
[0001f026] b26f 0040                 cmp.w      64(a7),d1
[0001f02a] 6664                      bne.s      edit_shift_8
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
[0001f08e] 603e                      bra.s      edit_shift_9
edit_shift_8:
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
edit_shift_9:
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
[0001f11e] 6708                      beq.s      edit_shift_10
[0001f120] 204b                      movea.l    a3,a0
[0001f122] 4eb9 0005 4c04            jsr        Abp_delete
edit_shift_10:
[0001f128] 72ff                      moveq.l    #-1,d1
[0001f12a] 701b                      moveq.l    #27,d0
[0001f12c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f132] 2068 0258                 movea.l    600(a0),a0
[0001f136] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001f13c] 2469 0258                 movea.l    600(a1),a2
[0001f140] 226a 0066                 movea.l    102(a2),a1
[0001f144] 4e91                      jsr        (a1)
edit_shift_2:
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
[0001f1a0] 6626                      bne.s      control_1
[0001f1a2] 3428 01c0                 move.w     448(a0),d2
[0001f1a6] b451                      cmp.w      (a1),d2
[0001f1a8] 661e                      bne.s      control_1
[0001f1aa] 3428 01c2                 move.w     450(a0),d2
[0001f1ae] b469 0002                 cmp.w      2(a1),d2
[0001f1b2] 6614                      bne.s      control_1
[0001f1b4] 3428 01c4                 move.w     452(a0),d2
[0001f1b8] b469 0004                 cmp.w      4(a1),d2
[0001f1bc] 660a                      bne.s      control_1
[0001f1be] 3428 01c6                 move.w     454(a0),d2
[0001f1c2] b469 0006                 cmp.w      6(a1),d2
[0001f1c6] 6720                      beq.s      control_2
control_1:
[0001f1c8] 0268 ff7f 01b8            andi.w     #$FF7F,440(a0)
[0001f1ce] 3151 01c0                 move.w     (a1),448(a0)
[0001f1d2] 3169 0002 01c2            move.w     2(a1),450(a0)
[0001f1d8] 3169 0004 01c4            move.w     4(a1),452(a0)
[0001f1de] 3169 0006 01c6            move.w     6(a1),454(a0)
[0001f1e4] 4240                      clr.w      d0
[0001f1e6] 4e75                      rts
control_2:

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
[0001f206] 6f0a                      ble.s      x1f1e8_1
[0001f208] 3429 0004                 move.w     4(a1),d2
[0001f20c] e642                      asr.w      #3,d2
[0001f20e] b042                      cmp.w      d2,d0
[0001f210] 6e10                      bgt.s      x1f1e8_2
x1f1e8_1:
[0001f212] b27c 0008                 cmp.w      #$0008,d1
[0001f216] 6f0e                      ble.s      x1f1e8_3
[0001f218] 3029 0006                 move.w     6(a1),d0
[0001f21c] e640                      asr.w      #3,d0
[0001f21e] b240                      cmp.w      d0,d1
[0001f220] 6f04                      ble.s      x1f1e8_3
x1f1e8_2:
[0001f222] 7001                      moveq.l    #1,d0
[0001f224] 4e75                      rts
x1f1e8_3:

[0001f226] 7002                      moveq.l    #2,d0
[0001f228] 4e75                      rts

edic_control:
[0001f22a] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0001f22e] 4fef ffc8                 lea.l      -56(a7),a7
[0001f232] 41f9 000b 0e44            lea.l      $000B0E44,a0
[0001f238] 43ef 0020                 lea.l      32(a7),a1
[0001f23c] 700f                      moveq.l    #15,d0
[0001f23e] 12d8                      move.b     (a0)+,(a1)+
edic_control_1:
[0001f240] 51c8 fffc                 dbf        d0,edic_control_1
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
[0001f26c] 670a                      beq.s      edic_control_2
[0001f26e] 4eb9 0002 08aa            jsr        edic_edit
[0001f274] 6000 05de                 bra        edic_control_3
edic_control_2:
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
[0001f2fe] 6774                      beq.s      edic_control_4
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
[0001f370] 6000 04cc                 bra        edic_control_5
edic_control_4:
[0001f374] 3aaa 001a                 move.w     26(a2),(a5)
[0001f378] 3b6a 001c 0002            move.w     28(a2),2(a5)
[0001f37e] 3b6a 001e 0004            move.w     30(a2),4(a5)
[0001f384] 3b6a 0020 0006            move.w     32(a2),6(a5)
[0001f38a] 3205                      move.w     d5,d1
[0001f38c] 3006                      move.w     d6,d0
[0001f38e] 204d                      movea.l    a5,a0
[0001f390] 4eb9 0006 b7a6            jsr        Aob_within
[0001f396] 4a40                      tst.w      d0
[0001f398] 6700 00e2                 beq        edic_control_6
[0001f39c] 3205                      move.w     d5,d1
[0001f39e] 3006                      move.w     d6,d0
[0001f3a0] 224d                      movea.l    a5,a1
[0001f3a2] 204c                      movea.l    a4,a0
[0001f3a4] 6100 fdf2                 bsr        control
[0001f3a8] 5340                      subq.w     #1,d0
[0001f3aa] 6766                      beq.s      edic_control_7
[0001f3ac] 5340                      subq.w     #1,d0
[0001f3ae] 6704                      beq.s      edic_control_8
[0001f3b0] 6000 048c                 bra        edic_control_5
edic_control_8:
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
[0001f3ea] 6700 0452                 beq        edic_control_5
[0001f3ee] 302f 0036                 move.w     54(a7),d0
[0001f3f2] 6100 f280                 bsr        snap
[0001f3f6] 3540 001e                 move.w     d0,30(a2)
[0001f3fa] 3940 01c4                 move.w     d0,452(a4)
[0001f3fe] 302f 0034                 move.w     52(a7),d0
[0001f402] 6100 f270                 bsr        snap
[0001f406] 3540 0020                 move.w     d0,32(a2)
[0001f40a] 3940 01c6                 move.w     d0,454(a4)
[0001f40e] 6000 042e                 bra        edic_control_5
edic_control_7:
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
[0001f478] 6000 03c4                 bra        edic_control_5
edic_control_6:
[0001f47c] 3aaa 0012                 move.w     18(a2),(a5)
[0001f480] 3b6a 0014 0002            move.w     20(a2),2(a5)
[0001f486] 3b6a 0016 0004            move.w     22(a2),4(a5)
[0001f48c] 3b6a 0018 0006            move.w     24(a2),6(a5)
[0001f492] 3205                      move.w     d5,d1
[0001f494] 3006                      move.w     d6,d0
[0001f496] 204d                      movea.l    a5,a0
[0001f498] 4eb9 0006 b7a6            jsr        Aob_within
[0001f49e] 4a40                      tst.w      d0
[0001f4a0] 6700 038c                 beq        edic_control_9
[0001f4a4] 3205                      move.w     d5,d1
[0001f4a6] 3006                      move.w     d6,d0
[0001f4a8] 224d                      movea.l    a5,a1
[0001f4aa] 204c                      movea.l    a4,a0
[0001f4ac] 6100 fcea                 bsr        control
[0001f4b0] 5340                      subq.w     #1,d0
[0001f4b2] 6700 007c                 beq.w      edic_control_10
[0001f4b6] 5340                      subq.w     #1,d0
[0001f4b8] 6704                      beq.s      edic_control_11
[0001f4ba] 6000 0382                 bra        edic_control_5
edic_control_11:
[0001f4be] 3003                      move.w     d3,d0
[0001f4c0] 906a 0012                 sub.w      18(a2),d0
[0001f4c4] d07c ff40                 add.w      #$FF40,d0
[0001f4c8] 4a40                      tst.w      d0
[0001f4ca] 6f02                      ble.s      edic_control_12
[0001f4cc] 9640                      sub.w      d0,d3
edic_control_12:
[0001f4ce] 3004                      move.w     d4,d0
[0001f4d0] 906a 0014                 sub.w      20(a2),d0
[0001f4d4] d07c ff40                 add.w      #$FF40,d0
[0001f4d8] 4a40                      tst.w      d0
[0001f4da] 6f02                      ble.s      edic_control_13
[0001f4dc] 9840                      sub.w      d0,d4
edic_control_13:
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
[0001f516] 6700 0326                 beq        edic_control_5
[0001f51a] 322f 0034                 move.w     52(a7),d1
[0001f51e] 302f 0036                 move.w     54(a7),d0
[0001f522] 2053                      movea.l    (a3),a0
[0001f524] 2068 0258                 movea.l    600(a0),a0
[0001f528] 6100 f346                 bsr        edic_resize
[0001f52c] 6000 0310                 bra        edic_control_5
edic_control_10:
[0001f530] 2053                      movea.l    (a3),a0
[0001f532] 0c68 0002 02ca            cmpi.w     #$0002,714(a0)
[0001f538] 6600 028c                 bne        edic_control_14
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
[0001f562] 6700 02f0                 beq        edic_control_3
[0001f566] 2253                      movea.l    (a3),a1
[0001f568] 2069 023c                 movea.l    572(a1),a0
[0001f56c] 3228 000e                 move.w     14(a0),d1
[0001f570] c27c 0800                 and.w      #$0800,d1
[0001f574] 664a                      bne.s      edic_control_15
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
edic_control_15:
[0001f5c0] 7e0f                      moveq.l    #15,d7
[0001f5c2] de45                      add.w      d5,d7
[0001f5c4] ce7c fff0                 and.w      #$FFF0,d7
[0001f5c8] cfc6                      muls.w     d6,d7
[0001f5ca] 48c7                      ext.l      d7
[0001f5cc] e687                      asr.l      #3,d7
[0001f5ce] 2053                      movea.l    (a3),a0
[0001f5d0] 3028 001c                 move.w     28(a0),d0
[0001f5d4] 5340                      subq.w     #1,d0
[0001f5d6] 6700 00de                 beq        edic_control_16
[0001f5da] 5740                      subq.w     #3,d0
[0001f5dc] 6700 0084                 beq        edic_control_17
[0001f5e0] 5940                      subq.w     #4,d0
[0001f5e2] 6704                      beq.s      edic_control_18
[0001f5e4] 6000 00e4                 bra        edic_control_19
edic_control_18:
[0001f5e8] 0c6d 0008 002e            cmpi.w     #$0008,46(a5)
[0001f5ee] 6640                      bne.s      edic_control_20
[0001f5f0] e98f                      lsl.l      #4,d7
[0001f5f2] 7001                      moveq.l    #1,d0
[0001f5f4] 2053                      movea.l    (a3),a0
[0001f5f6] 2268 025c                 movea.l    604(a0),a1
[0001f5fa] c069 018a                 and.w      394(a1),d0
[0001f5fe] 671a                      beq.s      edic_control_21
[0001f600] 222d 0038                 move.l     56(a5),d1
[0001f604] 6714                      beq.s      edic_control_21
[0001f606] 2241                      movea.l    d1,a1
[0001f608] 206f 0014                 movea.l    20(a7),a0
[0001f60c] 2050                      movea.l    (a0),a0
[0001f60e] 2007                      move.l     d7,d0
[0001f610] 4eb9 0008 3500            jsr        memcpy
[0001f616] 6000 00c0                 bra        edic_control_22
edic_control_21:
[0001f61a] 2007                      move.l     d7,d0
[0001f61c] 226d 0030                 movea.l    48(a5),a1
[0001f620] 206f 0014                 movea.l    20(a7),a0
[0001f624] 2050                      movea.l    (a0),a0
[0001f626] 4eb9 0008 3500            jsr        memcpy
[0001f62c] 6000 00aa                 bra        edic_control_22
edic_control_20:
[0001f630] 2053                      movea.l    (a3),a0
[0001f632] 2268 023c                 movea.l    572(a0),a1
[0001f636] 3029 000e                 move.w     14(a1),d0
[0001f63a] c07c 0800                 and.w      #$0800,d0
[0001f63e] 6600 0076                 bne.w      edic_control_16
[0001f642] 2f2f 0014                 move.l     20(a7),-(a7)
edic_control_25:
[0001f646] 43ef 0004                 lea.l      4(a7),a1
[0001f64a] 41ef 0024                 lea.l      36(a7),a0
[0001f64e] 7203                      moveq.l    #3,d1
[0001f650] 2c53                      movea.l    (a3),a6
[0001f652] 302e 0010                 move.w     16(a6),d0
[0001f656] 4eb9 0007 489e            jsr        vro_cpyfm
[0001f65c] 584f                      addq.w     #4,a7
[0001f65e] 6000 0078                 bra.w      edic_control_22
edic_control_17:
[0001f662] 0c6d 0004 0018            cmpi.w     #$0004,24(a5)
[0001f668] 663c                      bne.s      edic_control_23
[0001f66a] e58f                      lsl.l      #2,d7
[0001f66c] 7001                      moveq.l    #1,d0
[0001f66e] 2053                      movea.l    (a3),a0
[0001f670] 2268 025c                 movea.l    604(a0),a1
[0001f674] c069 018a                 and.w      394(a1),d0
[0001f678] 6718                      beq.s      edic_control_24
[0001f67a] 222d 0022                 move.l     34(a5),d1
[0001f67e] 6712                      beq.s      edic_control_24
[0001f680] 2241                      movea.l    d1,a1
[0001f682] 2c6f 0014                 movea.l    20(a7),a6
[0001f686] 2056                      movea.l    (a6),a0
[0001f688] 2007                      move.l     d7,d0
[0001f68a] 4eb9 0008 3500            jsr        memcpy
[0001f690] 6046                      bra.s      edic_control_22
edic_control_24:
[0001f692] 2007                      move.l     d7,d0
[0001f694] 226d 001a                 movea.l    26(a5),a1
[0001f698] 206f 0014                 movea.l    20(a7),a0
[0001f69c] 2050                      movea.l    (a0),a0
[0001f69e] 4eb9 0008 3500            jsr        memcpy
[0001f6a4] 6032                      bra.s      edic_control_22
edic_control_23:
[0001f6a6] 2053                      movea.l    (a3),a0
[0001f6a8] 2268 023c                 movea.l    572(a0),a1
[0001f6ac] 3029 000e                 move.w     14(a1),d0
[0001f6b0] c07c 0800                 and.w      #$0800,d0
[0001f6b4] 678c                      beq.s      edic_control_25
edic_control_16:
[0001f6b6] 2007                      move.l     d7,d0
[0001f6b8] 226d 0010                 movea.l    16(a5),a1
[0001f6bc] 206f 0014                 movea.l    20(a7),a0
[0001f6c0] 2050                      movea.l    (a0),a0
[0001f6c2] 4eb9 0008 3500            jsr        memcpy
[0001f6c8] 600e                      bra.s      edic_control_22
edic_control_19:
[0001f6ca] 206f 0014                 movea.l    20(a7),a0
[0001f6ce] 4eb9 0005 4c04            jsr        Abp_delete
[0001f6d4] 6000 017e                 bra        edic_control_3
edic_control_22:
[0001f6d8] 2053                      movea.l    (a3),a0
[0001f6da] 2268 023c                 movea.l    572(a0),a1
[0001f6de] 3029 000e                 move.w     14(a1),d0
[0001f6e2] c07c 0800                 and.w      #$0800,d0
[0001f6e6] 6618                      bne.s      edic_control_26
[0001f6e8] 2a6f 0014                 movea.l    20(a7),a5
[0001f6ec] 426d 000a                 clr.w      10(a5)
[0001f6f0] 224d                      movea.l    a5,a1
[0001f6f2] 204d                      movea.l    a5,a0
[0001f6f4] 2c53                      movea.l    (a3),a6
[0001f6f6] 302e 0010                 move.w     16(a6),d0
[0001f6fa] 4eb9 0007 4978            jsr        vr_trnfm
edic_control_26:
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
[0001f7c4] 6078                      bra.s      edic_control_5
edic_control_14:
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
[0001f82c] 6010                      bra.s      edic_control_5
edic_control_9:
[0001f82e] 303c 0080                 move.w     #$0080,d0
[0001f832] c06c 01b8                 and.w      440(a4),d0
[0001f836] 661c                      bne.s      edic_control_3
[0001f838] 006c 0080 01b8            ori.w      #$0080,440(a4)
edic_control_5:
[0001f83e] 72ff                      moveq.l    #-1,d1
[0001f840] 700e                      moveq.l    #14,d0
[0001f842] 2053                      movea.l    (a3),a0
[0001f844] 2068 0258                 movea.l    600(a0),a0
[0001f848] 2253                      movea.l    (a3),a1
[0001f84a] 2469 0258                 movea.l    600(a1),a2
[0001f84e] 226a 0066                 movea.l    102(a2),a1
[0001f852] 4e91                      jsr        (a1)
edic_control_3:
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
[0001f872] 6602                      bne.s      edic_nextcol_1
[0001f874] 7010                      moveq.l    #16,d0
edic_nextcol_1:
[0001f876] 322a 002e                 move.w     46(a2),d1
[0001f87a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f880] b268 001c                 cmp.w      28(a0),d1
[0001f884] 6604                      bne.s      edic_nextcol_2
[0001f886] 303c 0100                 move.w     #$0100,d0
edic_nextcol_2:
[0001f88a] 206a 000c                 movea.l    12(a2),a0
[0001f88e] 3228 02b4                 move.w     692(a0),d1
[0001f892] 5141                      subq.w     #8,d1
[0001f894] 670a                      beq.s      edic_nextcol_3
[0001f896] 5341                      subq.w     #1,d1
[0001f898] 673c                      beq.s      edic_nextcol_4
[0001f89a] 5341                      subq.w     #1,d1
[0001f89c] 6732                      beq.s      edic_nextcol_5
[0001f89e] 603e                      bra.s      edic_nextcol_6
edic_nextcol_3:
[0001f8a0] 526a 0044                 addq.w     #1,68(a2)
[0001f8a4] b06a 0044                 cmp.w      68(a2),d0
[0001f8a8] 6f1a                      ble.s      edic_nextcol_7
[0001f8aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001f8b0] 2068 023c                 movea.l    572(a0),a0
[0001f8b4] 41e8 003e                 lea.l      62(a0),a0
[0001f8b8] 4eb9 0004 ee3c            jsr        Amo_new
[0001f8be] 6100 ebfe                 bsr        edic_black0
edic_nextcol_8:
[0001f8c2] 601a                      bra.s      edic_nextcol_6
edic_nextcol_7:
[0001f8c4] 357c ffff 0044            move.w     #$FFFF,68(a2)
[0001f8ca] 6100 ed1a                 bsr        edic_invisible
[0001f8ce] 600e                      bra.s      edic_nextcol_6
edic_nextcol_5:
[0001f8d0] 6100 ecd2                 bsr        edic_white
[0001f8d4] 6008                      bra.s      edic_nextcol_6
edic_nextcol_4:
[0001f8d6] 357c 0001 0044            move.w     #$0001,68(a2)
[0001f8dc] 60e0                      bra.s      edic_nextcol_8
edic_nextcol_6:
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
[0001f948] 670c                      beq.s      edic_set_1
[0001f94a] 206f 004c                 movea.l    76(a7),a0
[0001f94e] 6100 ff0e                 bsr        edic_nextcol
[0001f952] 6000 03c2                 bra        edic_set_2
edic_set_1:
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
[0001f984] 6716                      beq.s      edic_set_3
[0001f986] 322f 0036                 move.w     54(a7),d1
[0001f98a] 302f 0034                 move.w     52(a7),d0
[0001f98e] 4eb9 0005 4b6e            jsr        Abp_create
[0001f994] 2f48 0018                 move.l     a0,24(a7)
[0001f998] 6700 037c                 beq        edic_set_2
edic_set_3:
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
edic_set_22:
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
[0001fa06] 6606                      bne.s      edic_set_4
[0001fa08] b641                      cmp.w      d1,d3
[0001fa0a] 6700 02be                 beq        edic_set_5
edic_set_4:
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
[0001fa4e] 6612                      bne.s      edic_set_6
[0001fa50] 7001                      moveq.l    #1,d0
[0001fa52] 3f40 0006                 move.w     d0,6(a7)
[0001fa56] 3f40 0004                 move.w     d0,4(a7)
[0001fa5a] 3f40 0002                 move.w     d0,2(a7)
[0001fa5e] 3e80                      move.w     d0,(a7)
[0001fa60] 6026                      bra.s      edic_set_7
edic_set_6:
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
edic_set_7:
[0001fa88] 302f 005e                 move.w     94(a7),d0
[0001fa8c] 6b00 026e                 bmi        edic_set_8
[0001fa90] 322f 005c                 move.w     92(a7),d1
[0001fa94] 6b00 0266                 bmi        edic_set_8
[0001fa98] b06b 0016                 cmp.w      22(a3),d0
[0001fa9c] 6c00 025e                 bge        edic_set_8
[0001faa0] b26b 0018                 cmp.w      24(a3),d1
[0001faa4] 6c00 0256                 bge        edic_set_8
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
[0001fada] 6a06                      bpl.s      edic_set_9
[0001fadc] 9157                      sub.w      d0,(a7)
[0001fade] 426f 0008                 clr.w      8(a7)
edic_set_9:
[0001fae2] 302f 000a                 move.w     10(a7),d0
[0001fae6] 6a08                      bpl.s      edic_set_10
[0001fae8] 916f 0002                 sub.w      d0,2(a7)
[0001faec] 426f 000a                 clr.w      10(a7)
edic_set_10:
[0001faf0] 302f 000c                 move.w     12(a7),d0
[0001faf4] b06b 0016                 cmp.w      22(a3),d0
[0001faf8] 6d14                      blt.s      edic_set_11
[0001fafa] 906b 0016                 sub.w      22(a3),d0
[0001fafe] 5240                      addq.w     #1,d0
[0001fb00] 916f 0004                 sub.w      d0,4(a7)
[0001fb04] 70ff                      moveq.l    #-1,d0
[0001fb06] d06b 0016                 add.w      22(a3),d0
[0001fb0a] 3f40 000c                 move.w     d0,12(a7)
edic_set_11:
[0001fb0e] 302f 000e                 move.w     14(a7),d0
[0001fb12] b06b 0018                 cmp.w      24(a3),d0
[0001fb16] 6d14                      blt.s      edic_set_12
[0001fb18] 906b 0018                 sub.w      24(a3),d0
[0001fb1c] 5240                      addq.w     #1,d0
[0001fb1e] 916f 0006                 sub.w      d0,6(a7)
[0001fb22] 70ff                      moveq.l    #-1,d0
[0001fb24] d06b 0018                 add.w      24(a3),d0
[0001fb28] 3f40 000e                 move.w     d0,14(a7)
edic_set_12:
[0001fb2c] 2054                      movea.l    (a4),a0
[0001fb2e] 2268 023c                 movea.l    572(a0),a1
[0001fb32] 3029 000e                 move.w     14(a1),d0
[0001fb36] c07c 0800                 and.w      #$0800,d0
[0001fb3a] 6700 00dc                 beq        edic_set_13
[0001fb3e] 3228 001c                 move.w     28(a0),d1
[0001fb42] b26f 003c                 cmp.w      60(a7),d1
[0001fb46] 6600 00d0                 bne        edic_set_13
[0001fb4a] 41ef 0030                 lea.l      48(a7),a0
[0001fb4e] 2254                      movea.l    (a4),a1
[0001fb50] 3029 0010                 move.w     16(a1),d0
[0001fb54] 226f 0018                 movea.l    24(a7),a1
[0001fb58] 4eb9 0007 4978            jsr        vr_trnfm
[0001fb5e] 206f 0060                 movea.l    96(a7),a0
[0001fb62] 3028 0044                 move.w     68(a0),d0
[0001fb66] 6b3a                      bmi.s      edic_set_14
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
[0001fba0] 605e                      bra.s      edic_set_15
edic_set_14:
[0001fba2] 206f 0018                 movea.l    24(a7),a0
[0001fba6] 0c68 0001 000c            cmpi.w     #$0001,12(a0)
[0001fbac] 661a                      bne.s      edic_set_16
[0001fbae] 2f08                      move.l     a0,-(a7)
[0001fbb0] 224d                      movea.l    a5,a1
[0001fbb2] 41ef 0004                 lea.l      4(a7),a0
[0001fbb6] 4241                      clr.w      d1
[0001fbb8] 2454                      movea.l    (a4),a2
[0001fbba] 302a 0010                 move.w     16(a2),d0
[0001fbbe] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fbc4] 584f                      addq.w     #4,a7
[0001fbc6] 601e                      bra.s      edic_set_17
edic_set_16:
[0001fbc8] 486f 0010                 pea.l      16(a7)
[0001fbcc] 2f2f 001c                 move.l     28(a7),-(a7)
[0001fbd0] 224d                      movea.l    a5,a1
[0001fbd2] 41ef 0008                 lea.l      8(a7),a0
[0001fbd6] 7201                      moveq.l    #1,d1
[0001fbd8] 2454                      movea.l    (a4),a2
[0001fbda] 302a 0010                 move.w     16(a2),d0
[0001fbde] 4eb9 0007 4902            jsr        vrt_cpyfm
[0001fbe4] 504f                      addq.w     #8,a7
edic_set_17:
[0001fbe6] 486f 001c                 pea.l      28(a7)
[0001fbea] 224d                      movea.l    a5,a1
[0001fbec] 41ef 0004                 lea.l      4(a7),a0
[0001fbf0] 4241                      clr.w      d1
[0001fbf2] 2454                      movea.l    (a4),a2
[0001fbf4] 302a 0010                 move.w     16(a2),d0
[0001fbf8] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fbfe] 584f                      addq.w     #4,a7
edic_set_15:
[0001fc00] 43ef 0030                 lea.l      48(a7),a1
[0001fc04] 206f 0018                 movea.l    24(a7),a0
[0001fc08] 2454                      movea.l    (a4),a2
[0001fc0a] 302a 0010                 move.w     16(a2),d0
[0001fc0e] 4eb9 0007 4978            jsr        vr_trnfm
[0001fc14] 6000 00a2                 bra        edic_set_18
edic_set_13:
[0001fc18] 206f 0060                 movea.l    96(a7),a0
[0001fc1c] 3028 0044                 move.w     68(a0),d0
[0001fc20] 6b3a                      bmi.s      edic_set_19
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
[0001fc5a] 605c                      bra.s      edic_set_18
edic_set_19:
[0001fc5c] 0c6f 0001 003c            cmpi.w     #$0001,60(a7)
[0001fc62] 661c                      bne.s      edic_set_20
[0001fc64] 486f 0030                 pea.l      48(a7)
[0001fc68] 224d                      movea.l    a5,a1
[0001fc6a] 41ef 0004                 lea.l      4(a7),a0
[0001fc6e] 4241                      clr.w      d1
[0001fc70] 2454                      movea.l    (a4),a2
[0001fc72] 302a 0010                 move.w     16(a2),d0
[0001fc76] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fc7c] 584f                      addq.w     #4,a7
[0001fc7e] 601e                      bra.s      edic_set_21
edic_set_20:
[0001fc80] 486f 0010                 pea.l      16(a7)
[0001fc84] 486f 0034                 pea.l      52(a7)
[0001fc88] 224d                      movea.l    a5,a1
[0001fc8a] 41ef 0008                 lea.l      8(a7),a0
[0001fc8e] 7201                      moveq.l    #1,d1
[0001fc90] 2454                      movea.l    (a4),a2
[0001fc92] 302a 0010                 move.w     16(a2),d0
[0001fc96] 4eb9 0007 4902            jsr        vrt_cpyfm
[0001fc9c] 504f                      addq.w     #8,a7
edic_set_21:
[0001fc9e] 486f 001c                 pea.l      28(a7)
[0001fca2] 224d                      movea.l    a5,a1
[0001fca4] 41ef 0004                 lea.l      4(a7),a0
[0001fca8] 4241                      clr.w      d1
[0001fcaa] 2454                      movea.l    (a4),a2
[0001fcac] 302a 0010                 move.w     16(a2),d0
[0001fcb0] 4eb9 0007 489e            jsr        vro_cpyfm
[0001fcb6] 584f                      addq.w     #4,a7
edic_set_18:
[0001fcb8] 43ef 0050                 lea.l      80(a7),a1
[0001fcbc] 206f 004c                 movea.l    76(a7),a0
[0001fcc0] 246f 004c                 movea.l    76(a7),a2
[0001fcc4] 246a 006a                 movea.l    106(a2),a2
[0001fcc8] 4e92                      jsr        (a2)
edic_set_5:
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
[0001fcf8] 6600 fcda                 bne        edic_set_22
edic_set_8:
[0001fcfc] 2054                      movea.l    (a4),a0
[0001fcfe] 2268 023c                 movea.l    572(a0),a1
[0001fd02] 3029 000e                 move.w     14(a1),d0
[0001fd06] c07c 0800                 and.w      #$0800,d0
[0001fd0a] 670a                      beq.s      edic_set_2
[0001fd0c] 206f 0018                 movea.l    24(a7),a0
[0001fd10] 4eb9 0005 4c04            jsr        Abp_delete
edic_set_2:
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
[0001fd9e] 6700 0166                 beq        edic_newplane_1
[0001fda2] 2204                      move.l     d4,d1
[0001fda4] 303c 00ff                 move.w     #$00FF,d0
[0001fda8] 4eb9 0008 36ea            jsr        memset
[0001fdae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001fdb4] 3028 001c                 move.w     28(a0),d0
[0001fdb8] 5940                      subq.w     #4,d0
[0001fdba] 670a                      beq.s      edic_newplane_2
[0001fdbc] 5940                      subq.w     #4,d0
[0001fdbe] 6700 008a                 beq        edic_newplane_3
[0001fdc2] 6000 0106                 bra        edic_newplane_4
edic_newplane_2:
[0001fdc6] 2a04                      move.l     d4,d5
[0001fdc8] e58d                      lsl.l      #2,d5
[0001fdca] 5c85                      addq.l     #6,d5
[0001fdcc] 2005                      move.l     d5,d0
[0001fdce] 4eb9 0004 c608            jsr        Ax_malloc
[0001fdd4] 2448                      movea.l    a0,a2
[0001fdd6] 200a                      move.l     a2,d0
[0001fdd8] 6700 0112                 beq        edic_newplane_5
[0001fddc] 2205                      move.l     d5,d1
[0001fdde] 4240                      clr.w      d0
[0001fde0] 4eb9 0008 36ea            jsr        memset
[0001fde6] 377c 0004 0018            move.w     #$0004,24(a3)
[0001fdec] 4a43                      tst.w      d3
[0001fdee] 6730                      beq.s      edic_newplane_6
[0001fdf0] 202b 001a                 move.l     26(a3),d0
[0001fdf4] 672a                      beq.s      edic_newplane_6
[0001fdf6] 222b 0022                 move.l     34(a3),d1
[0001fdfa] 670a                      beq.s      edic_newplane_7
[0001fdfc] 2041                      movea.l    d1,a0
[0001fdfe] 5d48                      subq.w     #6,a0
[0001fe00] 4eb9 0004 c7c8            jsr        Ax_free
edic_newplane_7:
[0001fe06] 206b 0026                 movea.l    38(a3),a0
[0001fe0a] 4eb9 0004 c7c8            jsr        Ax_free
[0001fe10] 41ea 0006                 lea.l      6(a2),a0
[0001fe14] 2748 0022                 move.l     a0,34(a3)
[0001fe18] 2757 0026                 move.l     (a7),38(a3)
[0001fe1c] 6000 00ce                 bra        edic_newplane_5
edic_newplane_6:
[0001fe20] 202b 001a                 move.l     26(a3),d0
[0001fe24] 670a                      beq.s      edic_newplane_8
[0001fe26] 2040                      movea.l    d0,a0
[0001fe28] 5d48                      subq.w     #6,a0
[0001fe2a] 4eb9 0004 c7c8            jsr        Ax_free
edic_newplane_8:
[0001fe30] 206b 001e                 movea.l    30(a3),a0
[0001fe34] 4eb9 0004 c7c8            jsr        Ax_free
[0001fe3a] 41ea 0006                 lea.l      6(a2),a0
[0001fe3e] 2748 001a                 move.l     a0,26(a3)
[0001fe42] 2757 001e                 move.l     (a7),30(a3)
[0001fe46] 6000 00a4                 bra        edic_newplane_5
edic_newplane_3:
[0001fe4a] 2a04                      move.l     d4,d5
[0001fe4c] e78d                      lsl.l      #3,d5
[0001fe4e] 5c85                      addq.l     #6,d5
[0001fe50] 2005                      move.l     d5,d0
[0001fe52] 4eb9 0004 c608            jsr        Ax_malloc
[0001fe58] 2448                      movea.l    a0,a2
[0001fe5a] 200a                      move.l     a2,d0
[0001fe5c] 6700 008e                 beq        edic_newplane_5
[0001fe60] 2205                      move.l     d5,d1
[0001fe62] 4240                      clr.w      d0
[0001fe64] 4eb9 0008 36ea            jsr        memset
[0001fe6a] 377c 0008 002e            move.w     #$0008,46(a3)
[0001fe70] 4a43                      tst.w      d3
[0001fe72] 672e                      beq.s      edic_newplane_9
[0001fe74] 202b 0030                 move.l     48(a3),d0
[0001fe78] 6728                      beq.s      edic_newplane_9
[0001fe7a] 222b 0038                 move.l     56(a3),d1
[0001fe7e] 670a                      beq.s      edic_newplane_10
[0001fe80] 2041                      movea.l    d1,a0
[0001fe82] 5d48                      subq.w     #6,a0
[0001fe84] 4eb9 0004 c7c8            jsr        Ax_free
edic_newplane_10:
[0001fe8a] 206b 003c                 movea.l    60(a3),a0
[0001fe8e] 4eb9 0004 c7c8            jsr        Ax_free
[0001fe94] 41ea 0006                 lea.l      6(a2),a0
[0001fe98] 2748 0038                 move.l     a0,56(a3)
[0001fe9c] 2757 003c                 move.l     (a7),60(a3)
[0001fea0] 604a                      bra.s      edic_newplane_5
edic_newplane_9:
[0001fea2] 202b 0030                 move.l     48(a3),d0
[0001fea6] 670a                      beq.s      edic_newplane_11
[0001fea8] 2040                      movea.l    d0,a0
[0001feaa] 5d48                      subq.w     #6,a0
[0001feac] 4eb9 0004 c7c8            jsr        Ax_free
edic_newplane_11:
[0001feb2] 206b 0034                 movea.l    52(a3),a0
[0001feb6] 4eb9 0004 c7c8            jsr        Ax_free
[0001febc] 41ea 0006                 lea.l      6(a2),a0
[0001fec0] 2748 0030                 move.l     a0,48(a3)
[0001fec4] 2757 0034                 move.l     (a7),52(a3)
[0001fec8] 6022                      bra.s      edic_newplane_5
edic_newplane_4:
[0001feca] 2a04                      move.l     d4,d5
[0001fecc] 2005                      move.l     d5,d0
[0001fece] 4eb9 0004 c608            jsr        Ax_malloc
[0001fed4] 2448                      movea.l    a0,a2
[0001fed6] 200a                      move.l     a2,d0
[0001fed8] 6712                      beq.s      edic_newplane_5
[0001feda] 2205                      move.l     d5,d1
[0001fedc] 4240                      clr.w      d0
[0001fede] 4eb9 0008 36ea            jsr        memset
[0001fee4] 274a 0010                 move.l     a2,16(a3)
[0001fee8] 2757 0014                 move.l     (a7),20(a3)
edic_newplane_5:
[0001feec] 206f 0004                 movea.l    4(a7),a0
[0001fef0] 6100 e4d0                 bsr        edic_link
[0001fef4] 72ff                      moveq.l    #-1,d1
[0001fef6] 700e                      moveq.l    #14,d0
[0001fef8] 206f 0004                 movea.l    4(a7),a0
[0001fefc] 226f 0004                 movea.l    4(a7),a1
[0001ff00] 2269 0066                 movea.l    102(a1),a1
[0001ff04] 4e91                      jsr        (a1)
edic_newplane_1:
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
[0001ff2e] 6700 03da                 beq        edic_acc_1
[0001ff32] 206f 002c                 movea.l    44(a7),a0
[0001ff36] 2f68 0014 0008            move.l     20(a0),8(a7)
[0001ff3c] 4eb9 0004 7e1e            jsr        Adr_start
[0001ff42] 4eb9 0004 7e2a            jsr        Adr_next
[0001ff48] 3600                      move.w     d0,d3
[0001ff4a] 6b00 03be                 bmi        edic_acc_1
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
[0001ff6e] 6600 039a                 bne        edic_acc_1
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
[0001ff9e] 6712                      beq.s      edic_acc_2
[0001ffa0] 41f9 000a d7e6            lea.l      A_NOSTD,a0
[0001ffa6] 7001                      moveq.l    #1,d0
[0001ffa8] 4eb9 0005 a600            jsr        Awi_alert
[0001ffae] 6000 035a                 bra        edic_acc_1
edic_acc_2:
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
[0001ffe8] 6700 0320                 beq        edic_acc_1
[0001ffec] 2206                      move.l     d6,d1
[0001ffee] 303c 00ff                 move.w     #$00FF,d0
[0001fff2] 4eb9 0008 36ea            jsr        memset
[0001fff8] 322d 0006                 move.w     6(a5),d1
[0001fffc] 302d 0004                 move.w     4(a5),d0
[00020000] 4eb9 0005 4b6e            jsr        Abp_create
[00020006] 2e88                      move.l     a0,(a7)
[00020008] 660e                      bne.s      edic_acc_3
[0002000a] 206f 0010                 movea.l    16(a7),a0
[0002000e] 4eb9 0004 c7c8            jsr        Ax_free
[00020014] 6000 02f4                 bra        edic_acc_1
edic_acc_3:
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
[00020070] 6616                      bne.s      edic_acc_4
[00020072] 206f 0010                 movea.l    16(a7),a0
[00020076] 4eb9 0004 c7c8            jsr        Ax_free
[0002007c] 2057                      movea.l    (a7),a0
[0002007e] 4eb9 0005 4c04            jsr        Abp_delete
[00020084] 6000 0284                 bra        edic_acc_1
edic_acc_4:
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
[000200c2] 6f0c                      ble.s      edic_acc_5
[000200c4] 70ff                      moveq.l    #-1,d0
[000200c6] d045                      add.w      d5,d0
[000200c8] 3940 000c                 move.w     d0,12(a4)
[000200cc] 3940 0004                 move.w     d0,4(a4)
edic_acc_5:
[000200d0] 302d 0006                 move.w     6(a5),d0
[000200d4] 206f 000c                 movea.l    12(a7),a0
[000200d8] b068 0018                 cmp.w      24(a0),d0
[000200dc] 6c0c                      bge.s      edic_acc_6
[000200de] 72ff                      moveq.l    #-1,d1
[000200e0] d240                      add.w      d0,d1
[000200e2] 3941 000e                 move.w     d1,14(a4)
[000200e6] 3941 0006                 move.w     d1,6(a4)
edic_acc_6:
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
[00020120] 6760                      beq.s      edic_acc_7
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
[0002014e] 660c                      bne.s      edic_acc_8
[00020150] 204b                      movea.l    a3,a0
[00020152] 4eb9 0005 4c04            jsr        Abp_delete
[00020158] 6000 01b0                 bra        edic_acc_1
edic_acc_8:
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
edic_acc_7:
[00020182] 2079 0010 ee4e            movea.l    ACSblk,a0
[00020188] 3028 001c                 move.w     28(a0),d0
[0002018c] 5940                      subq.w     #4,d0
[0002018e] 670a                      beq.s      edic_acc_9
[00020190] 5940                      subq.w     #4,d0
[00020192] 6700 0092                 beq        edic_acc_10
[00020196] 6000 0116                 bra        edic_acc_11
edic_acc_9:
[0002019a] 2e06                      move.l     d6,d7
[0002019c] e58f                      lsl.l      #2,d7
[0002019e] 5c87                      addq.l     #6,d7
[000201a0] 2007                      move.l     d7,d0
[000201a2] 4eb9 0004 c608            jsr        Ax_malloc
[000201a8] 2848                      movea.l    a0,a4
[000201aa] 200c                      move.l     a4,d0
[000201ac] 6700 0124                 beq        edic_acc_12
[000201b0] 2007                      move.l     d7,d0
[000201b2] 2253                      movea.l    (a3),a1
[000201b4] 41ec 0006                 lea.l      6(a4),a0
[000201b8] 4eb9 0008 3500            jsr        memcpy
[000201be] 357c 0004 0018            move.w     #$0004,24(a2)
[000201c4] 4a44                      tst.w      d4
[000201c6] 6732                      beq.s      edic_acc_13
[000201c8] 202a 001a                 move.l     26(a2),d0
[000201cc] 672c                      beq.s      edic_acc_13
[000201ce] 222a 0022                 move.l     34(a2),d1
[000201d2] 670a                      beq.s      edic_acc_14
[000201d4] 2041                      movea.l    d1,a0
[000201d6] 5d48                      subq.w     #6,a0
[000201d8] 4eb9 0004 c7c8            jsr        Ax_free
edic_acc_14:
[000201de] 206a 0026                 movea.l    38(a2),a0
[000201e2] 4eb9 0004 c7c8            jsr        Ax_free
[000201e8] 41ec 0006                 lea.l      6(a4),a0
[000201ec] 2548 0022                 move.l     a0,34(a2)
[000201f0] 256f 0010 0026            move.l     16(a7),38(a2)
[000201f6] 6000 00da                 bra        edic_acc_12
edic_acc_13:
[000201fa] 202a 001a                 move.l     26(a2),d0
[000201fe] 670a                      beq.s      edic_acc_15
[00020200] 2040                      movea.l    d0,a0
[00020202] 5d48                      subq.w     #6,a0
[00020204] 4eb9 0004 c7c8            jsr        Ax_free
edic_acc_15:
[0002020a] 206a 001e                 movea.l    30(a2),a0
[0002020e] 4eb9 0004 c7c8            jsr        Ax_free
[00020214] 41ec 0006                 lea.l      6(a4),a0
[00020218] 2548 001a                 move.l     a0,26(a2)
[0002021c] 256f 0010 001e            move.l     16(a7),30(a2)
[00020222] 6000 00ae                 bra        edic_acc_12
edic_acc_10:
[00020226] 2e06                      move.l     d6,d7
[00020228] e78f                      lsl.l      #3,d7
[0002022a] 5c87                      addq.l     #6,d7
[0002022c] 2007                      move.l     d7,d0
[0002022e] 4eb9 0004 c608            jsr        Ax_malloc
[00020234] 2848                      movea.l    a0,a4
[00020236] 200c                      move.l     a4,d0
[00020238] 6700 0098                 beq        edic_acc_12
[0002023c] 2253                      movea.l    (a3),a1
[0002023e] 41ec 0006                 lea.l      6(a4),a0
[00020242] 2007                      move.l     d7,d0
[00020244] 4eb9 0008 3500            jsr        memcpy
[0002024a] 357c 0008 002e            move.w     #$0008,46(a2)
[00020250] 4a44                      tst.w      d4
[00020252] 6730                      beq.s      edic_acc_16
[00020254] 202a 0030                 move.l     48(a2),d0
[00020258] 672a                      beq.s      edic_acc_16
[0002025a] 222a 0038                 move.l     56(a2),d1
[0002025e] 670a                      beq.s      edic_acc_17
[00020260] 2041                      movea.l    d1,a0
[00020262] 5d48                      subq.w     #6,a0
[00020264] 4eb9 0004 c7c8            jsr        Ax_free
edic_acc_17:
[0002026a] 206a 003c                 movea.l    60(a2),a0
[0002026e] 4eb9 0004 c7c8            jsr        Ax_free
[00020274] 41ec 0006                 lea.l      6(a4),a0
[00020278] 2548 0038                 move.l     a0,56(a2)
[0002027c] 256f 0010 003c            move.l     16(a7),60(a2)
[00020282] 604e                      bra.s      edic_acc_12
edic_acc_16:
[00020284] 202a 0030                 move.l     48(a2),d0
[00020288] 670a                      beq.s      edic_acc_18
[0002028a] 2040                      movea.l    d0,a0
[0002028c] 5d48                      subq.w     #6,a0
[0002028e] 4eb9 0004 c7c8            jsr        Ax_free
edic_acc_18:
[00020294] 206a 0034                 movea.l    52(a2),a0
[00020298] 4eb9 0004 c7c8            jsr        Ax_free
[0002029e] 41ec 0006                 lea.l      6(a4),a0
[000202a2] 2548 0030                 move.l     a0,48(a2)
[000202a6] 256f 0010 0034            move.l     16(a7),52(a2)
[000202ac] 6024                      bra.s      edic_acc_12
edic_acc_11:
[000202ae] 2e06                      move.l     d6,d7
[000202b0] 2007                      move.l     d7,d0
[000202b2] 4eb9 0004 c608            jsr        Ax_malloc
[000202b8] 2848                      movea.l    a0,a4
[000202ba] 200c                      move.l     a4,d0
[000202bc] 6714                      beq.s      edic_acc_12
[000202be] 2253                      movea.l    (a3),a1
[000202c0] 2007                      move.l     d7,d0
[000202c2] 4eb9 0008 3500            jsr        memcpy
[000202c8] 254c 0010                 move.l     a4,16(a2)
[000202cc] 256f 0010 0014            move.l     16(a7),20(a2)
edic_acc_12:
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
edic_acc_1:
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
[00020340] 664c                      bne.s      edic_delplane_1
[00020342] 4a43                      tst.w      d3
[00020344] 6626                      bne.s      edic_delplane_2
[00020346] 222b 001a                 move.l     26(a3),d1
[0002034a] 670a                      beq.s      edic_delplane_3
[0002034c] 2041                      movea.l    d1,a0
[0002034e] 5d48                      subq.w     #6,a0
[00020350] 4eb9 0004 c7c8            jsr        Ax_free
edic_delplane_3:
[00020356] 206b 001e                 movea.l    30(a3),a0
[0002035a] 4eb9 0004 c7c8            jsr        Ax_free
[00020360] 42ab 001a                 clr.l      26(a3)
[00020364] 42ab 001e                 clr.l      30(a3)
[00020368] 426b 0018                 clr.w      24(a3)
edic_delplane_2:
[0002036c] 202b 0022                 move.l     34(a3),d0
[00020370] 670a                      beq.s      edic_delplane_4
[00020372] 2040                      movea.l    d0,a0
[00020374] 5d48                      subq.w     #6,a0
[00020376] 4eb9 0004 c7c8            jsr        Ax_free
edic_delplane_4:
[0002037c] 206b 0026                 movea.l    38(a3),a0
[00020380] 4eb9 0004 c7c8            jsr        Ax_free
[00020386] 42ab 0022                 clr.l      34(a3)
[0002038a] 42ab 0026                 clr.l      38(a3)
edic_delplane_1:
[0002038e] 302b 002e                 move.w     46(a3),d0
[00020392] 2079 0010 ee4e            movea.l    ACSblk,a0
[00020398] b068 001c                 cmp.w      28(a0),d0
[0002039c] 664c                      bne.s      edic_delplane_5
[0002039e] 4a43                      tst.w      d3
[000203a0] 6626                      bne.s      edic_delplane_6
[000203a2] 222b 0030                 move.l     48(a3),d1
[000203a6] 670a                      beq.s      edic_delplane_7
[000203a8] 2041                      movea.l    d1,a0
[000203aa] 5d48                      subq.w     #6,a0
[000203ac] 4eb9 0004 c7c8            jsr        Ax_free
edic_delplane_7:
[000203b2] 206b 0034                 movea.l    52(a3),a0
[000203b6] 4eb9 0004 c7c8            jsr        Ax_free
[000203bc] 42ab 0030                 clr.l      48(a3)
[000203c0] 42ab 0034                 clr.l      52(a3)
[000203c4] 426b 002e                 clr.w      46(a3)
edic_delplane_6:
[000203c8] 202b 0038                 move.l     56(a3),d0
[000203cc] 670a                      beq.s      edic_delplane_8
[000203ce] 2040                      movea.l    d0,a0
[000203d0] 5d48                      subq.w     #6,a0
[000203d2] 4eb9 0004 c7c8            jsr        Ax_free
edic_delplane_8:
[000203d8] 206b 003c                 movea.l    60(a3),a0
[000203dc] 4eb9 0004 c7c8            jsr        Ax_free
[000203e2] 42ab 0038                 clr.l      56(a3)
[000203e6] 42ab 003c                 clr.l      60(a3)
edic_delplane_5:
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
[00020410] 6068                      bra.s      zooming_1
[00020412] 341a                      move.w     (a2)+,d2
zooming_8:
[00020414] 3600                      move.w     d0,d3
[00020416] 2049                      movea.l    a1,a0
[00020418] 780f                      moveq.l    #15,d4
[0002041a] 6054                      bra.s      zooming_2
[0002041c] 4a43                      tst.w      d3
zooming_7:
[0002041e] 6b20                      bmi.s      zooming_3
[00020420] 7c54                      moveq.l    #84,d6
[00020422] 1146 0060                 move.b     d6,96(a0)
[00020426] 1146 0040                 move.b     d6,64(a0)
[0002042a] 1146 0020                 move.b     d6,32(a0)
[0002042e] 1086                      move.b     d6,(a0)
[00020430] 7caa                      moveq.l    #-86,d6
[00020432] 1146 0050                 move.b     d6,80(a0)
[00020436] 1146 0030                 move.b     d6,48(a0)
[0002043a] 1146 0010                 move.b     d6,16(a0)
[0002043e] 6024                      bra.s      zooming_4
zooming_3:
[00020440] 4a42                      tst.w      d2
[00020442] 6b04                      bmi.s      zooming_5
[00020444] 4205                      clr.b      d5
[00020446] 6002                      bra.s      zooming_6
zooming_5:
[00020448] 7afe                      moveq.l    #-2,d5
zooming_6:
[0002044a] 1145 0060                 move.b     d5,96(a0)
[0002044e] 1145 0050                 move.b     d5,80(a0)
[00020452] 1145 0040                 move.b     d5,64(a0)
[00020456] 1145 0030                 move.b     d5,48(a0)
[0002045a] 1145 0020                 move.b     d5,32(a0)
[0002045e] 1145 0010                 move.b     d5,16(a0)
[00020462] 1085                      move.b     d5,(a0)
zooming_4:
[00020464] 4228 0070                 clr.b      112(a0)
[00020468] 5248                      addq.w     #1,a0
[0002046a] d442                      add.w      d2,d2
[0002046c] d643                      add.w      d3,d3
[0002046e] 5344                      subq.w     #1,d4
zooming_2:
[00020470] 4a44                      tst.w      d4
[00020472] 6aa8                      bpl.s      zooming_7
[00020474] 43e9 0080                 lea.l      128(a1),a1
[00020478] 5341                      subq.w     #1,d1
zooming_1:
[0002047a] 4a41                      tst.w      d1
[0002047c] 6a94                      bpl.s      zooming_8
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
[000204b6] 6606                      bne.s      edic_bitmap_1
[000204b8] 322f 0016                 move.w     22(a7),d1
[000204bc] 6736                      beq.s      edic_bitmap_2
edic_bitmap_1:
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
edic_bitmap_2:
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
[000205f0] 663e                      bne.s      edic_bitmap_3
[000205f2] 3f40 009e                 move.w     d0,158(a7)
[000205f6] 3f40 0076                 move.w     d0,118(a7)
[000205fa] 3f40 008a                 move.w     d0,138(a7)
[000205fe] 3f40 004e                 move.w     d0,78(a7)
[00020602] 3540 000c                 move.w     d0,12(a2)
[00020606] 2228 0022                 move.l     34(a0),d1
[0002060a] 6718                      beq.s      edic_bitmap_4
[0002060c] 7401                      moveq.l    #1,d2
[0002060e] 226f 0038                 movea.l    56(a7),a1
[00020612] c469 000a                 and.w      10(a1),d2
[00020616] 670c                      beq.s      edic_bitmap_4
[00020618] 2f68 0026 003e            move.l     38(a0),62(a7)
[0002061e] 2f41 0092                 move.l     d1,146(a7)
[00020622] 600c                      bra.s      edic_bitmap_3
edic_bitmap_4:
[00020624] 2f68 001e 003e            move.l     30(a0),62(a7)
[0002062a] 2f68 001a 0092            move.l     26(a0),146(a7)
edic_bitmap_3:
[00020630] 2255                      movea.l    (a5),a1
[00020632] 3029 001c                 move.w     28(a1),d0
[00020636] b068 002e                 cmp.w      46(a0),d0
[0002063a] 663e                      bne.s      edic_bitmap_5
[0002063c] 3f40 009e                 move.w     d0,158(a7)
[00020640] 3f40 0076                 move.w     d0,118(a7)
[00020644] 3f40 008a                 move.w     d0,138(a7)
[00020648] 3f40 004e                 move.w     d0,78(a7)
[0002064c] 3540 000c                 move.w     d0,12(a2)
[00020650] 2228 0038                 move.l     56(a0),d1
[00020654] 6718                      beq.s      edic_bitmap_6
[00020656] 7401                      moveq.l    #1,d2
[00020658] 226f 0038                 movea.l    56(a7),a1
[0002065c] c469 000a                 and.w      10(a1),d2
[00020660] 670c                      beq.s      edic_bitmap_6
[00020662] 2f68 003c 003e            move.l     60(a0),62(a7)
[00020668] 2f41 0092                 move.l     d1,146(a7)
[0002066c] 600c                      bra.s      edic_bitmap_5
edic_bitmap_6:
[0002066e] 2f68 0034 003e            move.l     52(a0),62(a7)
[00020674] 2f68 0030 0092            move.l     48(a0),146(a7)
edic_bitmap_5:
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
[000206f4] 6000 0184                 bra        edic_bitmap_7
[000206f8] 396c 0002 0006            move.w     2(a4),6(a4)
edic_bitmap_17:
[000206fe] 7007                      moveq.l    #7,d0
[00020700] d06f 003c                 add.w      60(a7),d0
[00020704] b06f 0012                 cmp.w      18(a7),d0
[00020708] 6d00 0166                 blt        edic_bitmap_8
[0002070c] 322f 003c                 move.w     60(a7),d1
[00020710] b26f 0016                 cmp.w      22(a7),d1
[00020714] 6e00 015a                 bgt        edic_bitmap_8
[00020718] 206f 00da                 movea.l    218(a7),a0
[0002071c] 3e28 000a                 move.w     10(a0),d7
[00020720] 4254                      clr.w      (a4)
[00020722] 4244                      clr.w      d4
[00020724] 6000 0144                 bra        edic_bitmap_9
[00020728] 303c 0080                 move.w     #$0080,d0
edic_bitmap_16:
[0002072c] d047                      add.w      d7,d0
[0002072e] b06f 0010                 cmp.w      16(a7),d0
[00020732] 6d00 012c                 blt        edic_bitmap_10
[00020736] be6f 0014                 cmp.w      20(a7),d7
[0002073a] 6e00 0124                 bgt        edic_bitmap_10
[0002073e] 3214                      move.w     (a4),d1
[00020740] d26c 000c                 add.w      12(a4),d1
[00020744] 3941 0004                 move.w     d1,4(a4)
[00020748] 2055                      movea.l    (a5),a0
[0002074a] 2268 023c                 movea.l    572(a0),a1
[0002074e] 3429 000e                 move.w     14(a1),d2
[00020752] c47c 0800                 and.w      #$0800,d2
[00020756] 6748                      beq.s      edic_bitmap_11
[00020758] 3028 001c                 move.w     28(a0),d0
[0002075c] b06f 0076                 cmp.w      118(a7),d0
[00020760] 663e                      bne.s      edic_bitmap_11
[00020762] 7a00                      moveq.l    #0,d5
[00020764] 602e                      bra.s      edic_bitmap_12
[00020766] 3006                      move.w     d6,d0
edic_bitmap_13:
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
edic_bitmap_12:
[00020794] 302f 009e                 move.w     158(a7),d0
[00020798] 48c0                      ext.l      d0
[0002079a] ba80                      cmp.l      d0,d5
[0002079c] 6dc8                      blt.s      edic_bitmap_13
[0002079e] 602e                      bra.s      edic_bitmap_14
edic_bitmap_11:
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
edic_bitmap_14:
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
[00020828] 671c                      beq.s      edic_bitmap_15
[0002082a] 4857                      pea.l      (a7)
[0002082c] 4868 026a                 pea.l      618(a0)
[00020830] 224a                      movea.l    a2,a1
[00020832] 204b                      movea.l    a3,a0
[00020834] 2c55                      movea.l    (a5),a6
[00020836] 302e 0010                 move.w     16(a6),d0
[0002083a] 7201                      moveq.l    #1,d1
[0002083c] 4eb9 0007 4902            jsr        vrt_cpyfm
[00020842] 504f                      addq.w     #8,a7
[00020844] 601a                      bra.s      edic_bitmap_10
edic_bitmap_15:
[00020846] 2055                      movea.l    (a5),a0
[00020848] 4868 026a                 pea.l      618(a0)
[0002084c] 224a                      movea.l    a2,a1
[0002084e] 204b                      movea.l    a3,a0
[00020850] 7203                      moveq.l    #3,d1
[00020852] 2c55                      movea.l    (a5),a6
[00020854] 302e 0010                 move.w     16(a6),d0
[00020858] 4eb9 0007 489e            jsr        vro_cpyfm
[0002085e] 584f                      addq.w     #4,a7
edic_bitmap_10:
[00020860] de7c 0080                 add.w      #$0080,d7
[00020864] 0654 0010                 addi.w     #$0010,(a4)
[00020868] 5244                      addq.w     #1,d4
edic_bitmap_9:
[0002086a] b644                      cmp.w      d4,d3
[0002086c] 6e00 feba                 bgt        edic_bitmap_16
edic_bitmap_8:
[00020870] 506f 003c                 addq.w     #8,60(a7)
[00020874] 526c 0002                 addq.w     #1,2(a4)
[00020878] 5246                      addq.w     #1,d6
edic_bitmap_7:
[0002087a] 206f 00a6                 movea.l    166(a7),a0
[0002087e] bc68 0018                 cmp.w      24(a0),d6
[00020882] 6d00 fe74                 blt        edic_bitmap_17
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
[00020964] 6c08                      bge.s      edic_edit_1
[00020966] 3b6e 0014 0014            move.w     20(a6),20(a5)
[0002096c] 6004                      bra.s      edic_edit_2
edic_edit_1:
[0002096e] 3b43 0014                 move.w     d3,20(a5)
edic_edit_2:
[00020972] b86e 0016                 cmp.w      22(a6),d4
[00020976] 6c08                      bge.s      edic_edit_3
[00020978] 3b6e 0016 0016            move.w     22(a6),22(a5)
[0002097e] 6004                      bra.s      edic_edit_4
edic_edit_3:
[00020980] 3b44 0016                 move.w     d4,22(a5)
edic_edit_4:
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
[000209ac] 6c02                      bge.s      edic_edit_5
[000209ae] 6010                      bra.s      edic_edit_6
edic_edit_5:
[000209b0] 2052                      movea.l    (a2),a0
[000209b2] 3028 0004                 move.w     4(a0),d0
[000209b6] d040                      add.w      d0,d0
[000209b8] 226b 0014                 movea.l    20(a3),a1
[000209bc] d069 0014                 add.w      20(a1),d0
edic_edit_6:
[000209c0] 3740 0028                 move.w     d0,40(a3)
[000209c4] 2052                      movea.l    (a2),a0
[000209c6] 3228 000e                 move.w     14(a0),d1
[000209ca] 3428 0006                 move.w     6(a0),d2
[000209ce] e54a                      lsl.w      #2,d2
[000209d0] 226b 0014                 movea.l    20(a3),a1
[000209d4] d469 0016                 add.w      22(a1),d2
[000209d8] b242                      cmp.w      d2,d1
[000209da] 6c02                      bge.s      edic_edit_7
[000209dc] 6010                      bra.s      edic_edit_8
edic_edit_7:
[000209de] 2052                      movea.l    (a2),a0
[000209e0] 3228 0006                 move.w     6(a0),d1
[000209e4] e549                      lsl.w      #2,d1
[000209e6] 226b 0014                 movea.l    20(a3),a1
[000209ea] d269 0016                 add.w      22(a1),d1
edic_edit_8:
[000209ee] 3741 002a                 move.w     d1,42(a3)
[000209f2] 302b 0022                 move.w     34(a3),d0
[000209f6] c07c 0100                 and.w      #$0100,d0
[000209fa] 670a                      beq.s      edic_edit_9
[000209fc] 342b 0022                 move.w     34(a3),d2
[00020a00] c47c 0800                 and.w      #$0800,d2
[00020a04] 6624                      bne.s      edic_edit_10
edic_edit_9:
[00020a06] 006b 0100 0056            ori.w      #$0100,86(a3)
[00020a0c] 204b                      movea.l    a3,a0
[00020a0e] 4eb9 0005 8362            jsr        Awi_closed
[00020a14] 006b 0fe0 0022            ori.w      #$0FE0,34(a3)
[00020a1a] 204b                      movea.l    a3,a0
[00020a1c] 4eb9 0005 7428            jsr        Awi_open
[00020a22] 026b feff 0056            andi.w     #$FEFF,86(a3)
[00020a28] 6008                      bra.s      edic_edit_11
edic_edit_10:
[00020a2a] 204b                      movea.l    a3,a0
[00020a2c] 4eb9 0001 6012            jsr        view_grow
edic_edit_11:
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
[00020afc] 6c04                      bge.s      edic_struct_1
[00020afe] c67c f1ff                 and.w      #$F1FF,d3
edic_struct_1:
[00020b02] 2052                      movea.l    (a2),a0
[00020b04] 302f 0006                 move.w     6(a7),d0
[00020b08] b068 000e                 cmp.w      14(a0),d0
[00020b0c] 6c04                      bge.s      edic_struct_2
[00020b0e] c67c fe3f                 and.w      #$FE3F,d3
edic_struct_2:
[00020b12] 3003                      move.w     d3,d0
[00020b14] c07c 0900                 and.w      #$0900,d0
[00020b18] 6604                      bne.s      edic_struct_3
[00020b1a] c67c ffdf                 and.w      #$FFDF,d3
edic_struct_3:
[00020b1e] b66b 0022                 cmp.w      34(a3),d3
[00020b22] 6722                      beq.s      edic_struct_4
[00020b24] 3743 0022                 move.w     d3,34(a3)
[00020b28] 006b 0100 0056            ori.w      #$0100,86(a3)
[00020b2e] 204b                      movea.l    a3,a0
[00020b30] 4eb9 0005 8362            jsr        Awi_closed
[00020b36] 204b                      movea.l    a3,a0
[00020b38] 4eb9 0005 7428            jsr        Awi_open
[00020b3e] 026b feff 0056            andi.w     #$FEFF,86(a3)
[00020b44] 6008                      bra.s      edic_struct_5
edic_struct_4:
[00020b46] 204b                      movea.l    a3,a0
[00020b48] 4eb9 0001 607e            jsr        view_shrink
edic_struct_5:
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
[00020b9a] 673c                      beq.s      acc_icon_1
[00020b9c] 2f4b 004e                 move.l     a3,78(a7)
[00020ba0] 3f7c 0008 003c            move.w     #$0008,60(a7)
[00020ba6] 224c                      movea.l    a4,a1
[00020ba8] 2040                      movea.l    d0,a0
[00020baa] 7008                      moveq.l    #8,d0
[00020bac] 6100 d72c                 bsr        from_cicon
[00020bb0] 2f48 003e                 move.l     a0,62(a7)
[00020bb4] 2f6a 0034 0042            move.l     52(a2),66(a7)
[00020bba] 202a 0038                 move.l     56(a2),d0
[00020bbe] 6714                      beq.s      acc_icon_2
[00020bc0] 224c                      movea.l    a4,a1
[00020bc2] 2040                      movea.l    d0,a0
[00020bc4] 7008                      moveq.l    #8,d0
[00020bc6] 6100 d712                 bsr        from_cicon
[00020bca] 2f48 0046                 move.l     a0,70(a7)
[00020bce] 2f6a 003c 004a            move.l     60(a2),74(a7)
acc_icon_2:
[00020bd4] 47ef 003c                 lea.l      60(a7),a3
acc_icon_1:
[00020bd8] 202a 001a                 move.l     26(a2),d0
[00020bdc] 673c                      beq.s      acc_icon_3
[00020bde] 2f4b 0038                 move.l     a3,56(a7)
[00020be2] 3f7c 0004 0026            move.w     #$0004,38(a7)
[00020be8] 224c                      movea.l    a4,a1
[00020bea] 2040                      movea.l    d0,a0
[00020bec] 7004                      moveq.l    #4,d0
[00020bee] 6100 d6ea                 bsr        from_cicon
[00020bf2] 2f48 0028                 move.l     a0,40(a7)
[00020bf6] 2f6a 001e 002c            move.l     30(a2),44(a7)
[00020bfc] 202a 0022                 move.l     34(a2),d0
[00020c00] 6714                      beq.s      acc_icon_4
[00020c02] 224c                      movea.l    a4,a1
[00020c04] 2040                      movea.l    d0,a0
[00020c06] 7004                      moveq.l    #4,d0
[00020c08] 6100 d6d0                 bsr        from_cicon
[00020c0c] 2f48 0030                 move.l     a0,48(a7)
[00020c10] 2f6a 0026 0034            move.l     38(a2),52(a7)
acc_icon_4:
[00020c16] 47ef 0026                 lea.l      38(a7),a3
acc_icon_3:
[00020c1a] 2f4b 0022                 move.l     a3,34(a7)
[00020c1e] 43d7                      lea.l      (a7),a1
[00020c20] 206f 0052                 movea.l    82(a7),a0
[00020c24] 4eb9 0003 490a            jsr        dup_icon
[00020c2a] 2648                      movea.l    a0,a3
[00020c2c] 200b                      move.l     a3,d0
[00020c2e] 673e                      beq.s      acc_icon_5
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
acc_icon_5:
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
[00020d0c] 670c                      beq.s      ic_make_1
[00020d0e] 204c                      movea.l    a4,a0
[00020d10] 4eb9 0005 6bea            jsr        Awi_show
[00020d16] 6000 00ce                 bra        ic_make_2
ic_make_1:
[00020d1a] 7048                      moveq.l    #72,d0
[00020d1c] 4eb9 0004 c608            jsr        Ax_malloc
[00020d22] 2448                      movea.l    a0,a2
[00020d24] 200a                      move.l     a2,d0
[00020d26] 6700 00ba                 beq        ic_make_3
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
[00020d58] 6754                      beq.s      ic_make_4
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
[00020da4] 6612                      bne.s      ic_make_5
[00020da6] 204c                      movea.l    a4,a0
[00020da8] 4eb9 0004 c7c8            jsr        Ax_free
ic_make_4:
[00020dae] 204a                      movea.l    a2,a0
[00020db0] 4eb9 0004 c7c8            jsr        Ax_free
[00020db6] 602a                      bra.s      ic_make_3
ic_make_5:
[00020db8] 206a 000c                 movea.l    12(a2),a0
[00020dbc] 4eb9 0004 fbdc            jsr        Aob_fix
[00020dc2] 274c 0012                 move.l     a4,18(a3)
[00020dc6] 204c                      movea.l    a4,a0
[00020dc8] 4eb9 0002 0e68            jsr        set_icon
[00020dce] 204c                      movea.l    a4,a0
[00020dd0] 226c 000c                 movea.l    12(a4),a1
[00020dd4] 4e91                      jsr        (a1)
[00020dd6] 4a40                      tst.w      d0
[00020dd8] 670c                      beq.s      ic_make_2
[00020dda] 204c                      movea.l    a4,a0
[00020ddc] 4eb9 0002 1074            jsr        term
ic_make_3:
[00020de2] 91c8                      suba.l     a0,a0
[00020de4] 6002                      bra.s      ic_make_6
ic_make_2:
[00020de6] 204c                      movea.l    a4,a0
ic_make_6:
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
[00020dfe] 6708                      beq.s      ic_service_1
[00020e00] 907c 270e                 sub.w      #$270E,d0
[00020e04] 6712                      beq.s      ic_service_2
[00020e06] 601e                      bra.s      ic_service_3
ic_service_1:
[00020e08] 204a                      movea.l    a2,a0
[00020e0a] 6100 fd4a                 bsr        acc_icon
[00020e0e] 204a                      movea.l    a2,a0
[00020e10] 4eb9 0002 1074            jsr        term
[00020e16] 601c                      bra.s      ic_service_4
ic_service_2:
[00020e18] 226b 0004                 movea.l    4(a3),a1
[00020e1c] 204a                      movea.l    a2,a0
[00020e1e] 4eb9 0001 60ea            jsr        new_name
[00020e24] 600e                      bra.s      ic_service_4
ic_service_3:
[00020e26] 224c                      movea.l    a4,a1
[00020e28] 3003                      move.w     d3,d0
[00020e2a] 204a                      movea.l    a2,a0
[00020e2c] 4eb9 0005 9dd0            jsr        Awi_service
[00020e32] 6002                      bra.s      ic_service_5
ic_service_4:
[00020e34] 7001                      moveq.l    #1,d0
ic_service_5:
[00020e36] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00020e3a] 4e75                      rts

unfix_alloc:
[00020e3c] 2f0a                      move.l     a2,-(a7)
[00020e3e] 2f0b                      move.l     a3,-(a7)
[00020e40] 2448                      movea.l    a0,a2
[00020e42] 2650                      movea.l    (a0),a3
[00020e44] 200b                      move.l     a3,d0
[00020e46] 671a                      beq.s      unfix_alloc_1
[00020e48] 202b 000e                 move.l     14(a3),d0
[00020e4c] 4eb9 0004 c608            jsr        Ax_malloc
[00020e52] 2488                      move.l     a0,(a2)
[00020e54] 202b 000e                 move.l     14(a3),d0
[00020e58] 226b 0004                 movea.l    4(a3),a1
[00020e5c] 4eb9 0008 3500            jsr        memcpy
unfix_alloc_1:
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
[00020ee2] 6f4a                      ble.s      set_icon_1
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
[00020f0a] 6722                      beq.s      set_icon_1
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
set_icon_1:
[00020f2e] 302b 002e                 move.w     46(a3),d0
[00020f32] 6f4a                      ble.s      set_icon_2
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
[00020f5a] 6722                      beq.s      set_icon_2
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
set_icon_2:
[00020f7e] 2003                      move.l     d3,d0
[00020f80] 4eb9 0004 c608            jsr        Ax_malloc
[00020f86] 2748 0014                 move.l     a0,20(a3)
[00020f8a] 670e                      beq.s      set_icon_3
[00020f8c] 2003                      move.l     d3,d0
[00020f8e] 2216                      move.l     (a6),d1
[00020f90] 43f6 1800                 lea.l      0(a6,d1.l),a1
[00020f94] 4eb9 0008 3500            jsr        memcpy
set_icon_3:
[00020f9a] 2003                      move.l     d3,d0
[00020f9c] 4eb9 0004 c608            jsr        Ax_malloc
[00020fa2] 2748 0010                 move.l     a0,16(a3)
[00020fa6] 6710                      beq.s      set_icon_4
[00020fa8] 2003                      move.l     d3,d0
[00020faa] 222e 0004                 move.l     4(a6),d1
[00020fae] 43f6 1800                 lea.l      0(a6,d1.l),a1
[00020fb2] 4eb9 0008 3500            jsr        memcpy
set_icon_4:
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
[0002109e] 660c                      bne.s      term_1
[000210a0] 206b 000c                 movea.l    12(a3),a0
[000210a4] 4eb9 0004 f20a            jsr        Aob_delete
[000210aa] 600a                      bra.s      term_2
term_1:
[000210ac] 206b 0008                 movea.l    8(a3),a0
[000210b0] 4eb9 0004 f20a            jsr        Aob_delete
term_2:
[000210b6] 302a 0056                 move.w     86(a2),d0
[000210ba] c07c 0800                 and.w      #$0800,d0
[000210be] 6716                      beq.s      term_3
[000210c0] 43ea 002c                 lea.l      44(a2),a1
[000210c4] 206b 0004                 movea.l    4(a3),a0
[000210c8] 41e8 003a                 lea.l      58(a0),a0
[000210cc] 7008                      moveq.l    #8,d0
[000210ce] 4eb9 0008 3500            jsr        memcpy
[000210d4] 6014                      bra.s      term_4
term_3:
[000210d6] 7008                      moveq.l    #8,d0
[000210d8] 43ea 0024                 lea.l      36(a2),a1
[000210dc] 206b 0004                 movea.l    4(a3),a0
[000210e0] 41e8 003a                 lea.l      58(a0),a0
[000210e4] 4eb9 0008 3500            jsr        memcpy
term_4:
[000210ea] 206b 0010                 movea.l    16(a3),a0
[000210ee] 4eb9 0004 c7c8            jsr        Ax_free
[000210f4] 206b 0014                 movea.l    20(a3),a0
[000210f8] 4eb9 0004 c7c8            jsr        Ax_free
[000210fe] 202b 001a                 move.l     26(a3),d0
[00021102] 670a                      beq.s      term_5
[00021104] 2040                      movea.l    d0,a0
[00021106] 5d48                      subq.w     #6,a0
[00021108] 4eb9 0004 c7c8            jsr        Ax_free
term_5:
[0002110e] 206b 001e                 movea.l    30(a3),a0
[00021112] 4eb9 0004 c7c8            jsr        Ax_free
[00021118] 202b 0022                 move.l     34(a3),d0
[0002111c] 670a                      beq.s      term_6
[0002111e] 2040                      movea.l    d0,a0
[00021120] 5d48                      subq.w     #6,a0
[00021122] 4eb9 0004 c7c8            jsr        Ax_free
term_6:
[00021128] 206b 0026                 movea.l    38(a3),a0
[0002112c] 4eb9 0004 c7c8            jsr        Ax_free
[00021132] 202b 0030                 move.l     48(a3),d0
[00021136] 670a                      beq.s      term_7
[00021138] 2040                      movea.l    d0,a0
[0002113a] 5d48                      subq.w     #6,a0
[0002113c] 4eb9 0004 c7c8            jsr        Ax_free
term_7:
[00021142] 206b 0034                 movea.l    52(a3),a0
[00021146] 4eb9 0004 c7c8            jsr        Ax_free
[0002114c] 202b 0038                 move.l     56(a3),d0
[00021150] 670a                      beq.s      term_8
[00021152] 2040                      movea.l    d0,a0
[00021154] 5d48                      subq.w     #6,a0
[00021156] 4eb9 0004 c7c8            jsr        Ax_free
term_8:
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
[0002118c] 6608                      bne.s      piccolor_1
[0002118e] 76ff                      moveq.l    #-1,d3
[00021190] d66a 0004                 add.w      4(a2),d3
[00021194] 6004                      bra.s      piccolor_2
piccolor_1:
[00021196] 362a 001c                 move.w     28(a2),d3
piccolor_2:
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
[00021252] 6710                      beq.s      piccolor_3
[00021254] 7201                      moveq.l    #1,d1
[00021256] 2054                      movea.l    (a4),a0
[00021258] 3028 0010                 move.w     16(a0),d0
[0002125c] 4eb9 0007 31c0            jsr        vsl_color
[00021262] 600e                      bra.s      piccolor_4
piccolor_3:
[00021264] 4241                      clr.w      d1
[00021266] 2054                      movea.l    (a4),a0
[00021268] 3028 0010                 move.w     16(a0),d0
[0002126c] 4eb9 0007 31c0            jsr        vsl_color
piccolor_4:
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
[00021372] 6b1e                      bmi.s      IcnCol_1
[00021374] 7201                      moveq.l    #1,d1
[00021376] 2054                      movea.l    (a4),a0
[00021378] 3028 0010                 move.w     16(a0),d0
[0002137c] 4eb9 0007 3660            jsr        vsf_interior
[00021382] 3203                      move.w     d3,d1
[00021384] 2054                      movea.l    (a4),a0
[00021386] 3028 0010                 move.w     16(a0),d0
[0002138a] 4eb9 0007 3708            jsr        vsf_color
[00021390] 602a                      bra.s      IcnCol_2
IcnCol_1:
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
IcnCol_2:
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

	.data

A_NOSTD:
[000ad7e6]                           dc.b '[1][ Die Grafik liegt nicht im | Standard-Format vor, eine | öbernahme ist unmîglich! ][ Abbruch ]',0
BUBBLE_01:
[000ad849]                           dc.b 'Die énderungen werden verworfen.',0
BUBBLE_02:
[000ad86a]                           dc.b 'Die énderungen werden Åbernommen.',0
BUBBLE_03:
[000ad88c]                           dc.b 'Hier kann der Text unter dem Icon eingegeben werden.',0
BUBBLE_04:
[000ad8c1]                           dc.b 'Hier kann das Zeichen (z.B. Laufwerksbuchstabe) fÅr das Icon angegeben werden.',0
BUBBLE_05:
[000ad910]                           dc.b 'Die Ausmaûe des Icons kînnen hier direkt editiert werden.',0
BUBBLE_06:
[000ad94a]                           dc.b 'Hier kann das Icon entworfen und verÑndert werden.',0
BUBBLE_07:
[000ad97d]                           dc.b 'öber diesen Button wechseln Sie wieder in die Icon-Ansicht.',0
BUBBLE_08:
[000ad9b9]                           dc.b 'Die Ausmaûe eines Icons fÅr den Desktop werden eingestellt.',0
TEXT_002:
[000ad9f5]                           dc.b $00
TEXT_003:
[000ad9f6]                           dc.w $4f4b
[000ad9f8]                           dc.w $0041
[000ad9fa]                           dc.b 'bbruch',0
TEXT_01:
[000ada01]                           dc.b 'THINN',0
TEXT_019:
[000ada07]                           dc.b 'Struktur',0
TEXT_02:
[000ada10]                           dc.b 'FAT',0
TEXT_03:
[000ada14]                           dc.b 'neues Muster',0
TEXT_04:
[000ada21]                           dc.b 'Pinsel:',0
TEXT_05:
[000ada29]                           dc.b 'StÑrke:',0
TEXT_06:
[000ada31]                           dc.b 'Schiebe:',0
TEXT_07:
[000ada3a]                           dc.b 'lîschen',0
TEXT_08:
[000ada42]                           dc.b 'ICON1212312121212122',0
TEXT_09:
[000ada57]                           dc.b 'hinten:',0
TEXT_10:
[000ada5f]                           dc.b 'vorne:',0
TEXT_11:
[000ada66]                           dc.w $593a
[000ada68]                           dc.w $0057
[000ada6a]                           dc.w $3a00
TEXT_13:
[000ada6c]                           dc.w $483a
[000ada6e]                           dc.w $0043
[000ada70]                           dc.b 'har:',0
TEXT_15:
[000ada75]                           dc.b 'Icon:',0
TEXT_16:
[000ada7b]                           dc.b 'Text:',0
TEXT_17:
[000ada81]                           dc.b ' Ikonen-Editor ',0
TEXT_18:
[000ada91]                           dc.b 'Farbe:',0
TEXT_19:
[000ada98]                           dc.b 'Edit...',0
TEXT_20:
[000adaa0]                           dc.b 'leeren',0
TEXT_21:
[000adaa7]                           dc.b 'Ausmaûe...',0
TEXT_22:
[000adab2]                           dc.w $583a
[000adab4]                           dc.w $0004
[000adab6]                           dc.b ' Deskicon',0
TEXT_24:
[000adac0]                           dc.b ' Ausmaûe ',0
TEXT_25:
[000adaca]                           dc.b 'ICONS',0
TEXT_27:
[000adad0]                           dc.b 'Ein/Aus',0
DATAS_01:
[000adad8]                           dc.w $0000
[000adada]                           dc.w $0000
[000adadc]                           dc.w $02d8
[000adade]                           dc.w $0000
[000adae0]                           dc.w $0000
[000adae2]                           dc.w $0000
[000adae4]                           dc.w $0000
[000adae6]                           dc.w $0000
[000adae8]                           dc.w $0000
[000adaea]                           dc.w $0000
[000adaec]                           dc.w $0000
[000adaee]                           dc.w $0000
[000adaf0]                           dc.w $007f
[000adaf2]                           dc.w $c003
[000adaf4]                           dc.w $fe00
[000adaf6]                           dc.w $007f
[000adaf8]                           dc.w $c003
[000adafa]                           dc.w $c200
[000adafc]                           dc.w $007f
[000adafe]                           dc.w $c003
[000adb00]                           dc.w $d200
[000adb02]                           dc.w $007f
[000adb04]                           dc.w $c003
[000adb06]                           dc.w $8200
[000adb08]                           dc.w $007f
[000adb0a]                           dc.w $c002
[000adb0c]                           dc.w $2200
[000adb0e]                           dc.w $007f
[000adb10]                           dc.w $c002
[000adb12]                           dc.w $0200
[000adb14]                           dc.w $007f
[000adb16]                           dc.w $c002
[000adb18]                           dc.w $0200
[000adb1a]                           dc.w $007f
[000adb1c]                           dc.w $c003
[000adb1e]                           dc.w $fe00
[000adb20]                           dc.w $0000
[000adb22]                           dc.w $0000
[000adb24]                           dc.w $0000
[000adb26]                           dc.w $03ff
[000adb28]                           dc.w $f81f
[000adb2a]                           dc.w $ffc0
[000adb2c]                           dc.w $0000
[000adb2e]                           dc.w $0000
[000adb30]                           dc.w $0000
[000adb32]                           dc.w $0000
[000adb34]                           dc.w $0000
[000adb36]                           dc.w $0000
[000adb38]                           dc.w $0000
[000adb3a]                           dc.w $0000
[000adb3c]                           dc.w $0000
[000adb3e]                           dc.w $0000
[000adb40]                           dc.w $0000
[000adb42]                           dc.w $0000
[000adb44]                           dc.w $0007
[000adb46]                           dc.w $8001
[000adb48]                           dc.w $fc00
[000adb4a]                           dc.w $000f
[000adb4c]                           dc.w $0001
[000adb4e]                           dc.w $fc00
[000adb50]                           dc.w $001e
[000adb52]                           dc.w $0001
[000adb54]                           dc.w $fc00
[000adb56]                           dc.w $001e
[000adb58]                           dc.w $0001
[000adb5a]                           dc.w $fc00
[000adb5c]                           dc.w $003c
[000adb5e]                           dc.w $0001
[000adb60]                           dc.w $fc00
[000adb62]                           dc.w $003c
[000adb64]                           dc.w $0001
[000adb66]                           dc.w $fc00
[000adb68]                           dc.w $003c
[000adb6a]                           dc.w $0001
[000adb6c]                           dc.w $fc00
[000adb6e]                           dc.w $0000
[000adb70]                           dc.w $0000
[000adb72]                           dc.w $0000
[000adb74]                           dc.w $03ff
[000adb76]                           dc.w $f81f
[000adb78]                           dc.w $ffc0
[000adb7a]                           dc.w $0000
[000adb7c]                           dc.w $0000
[000adb7e]                           dc.w $0000
[000adb80]                           dc.w $0000
[000adb82]                           dc.w $0000
[000adb84]                           dc.w $0000
[000adb86]                           dc.w $0000
[000adb88]                           dc.w $0000
[000adb8a]                           dc.w $0000
[000adb8c]                           dc.w $0000
[000adb8e]                           dc.w $0000
[000adb90]                           dc.w $0000
[000adb92]                           dc.w $0000
[000adb94]                           dc.w $0000
[000adb96]                           dc.w $0000
[000adb98]                           dc.w $0000
[000adb9a]                           dc.w $0000
[000adb9c]                           dc.w $0000
[000adb9e]                           dc.w $0000
[000adba0]                           dc.w $0000
[000adba2]                           dc.w $0000
[000adba4]                           dc.w $007f
[000adba6]                           dc.w $c003
[000adba8]                           dc.w $fe00
[000adbaa]                           dc.w $007f
[000adbac]                           dc.w $c002
[000adbae]                           dc.w $c200
[000adbb0]                           dc.w $006e
[000adbb2]                           dc.w $c003
[000adbb4]                           dc.w $d200
[000adbb6]                           dc.w $0064
[000adbb8]                           dc.w $c003
[000adbba]                           dc.w $8200
[000adbbc]                           dc.w $0071
[000adbbe]                           dc.w $c002
[000adbc0]                           dc.w $2200
[000adbc2]                           dc.w $0064
[000adbc4]                           dc.w $c002
[000adbc6]                           dc.w $1e00
[000adbc8]                           dc.w $006e
[000adbca]                           dc.w $c003
[000adbcc]                           dc.w $fe00
[000adbce]                           dc.w $007f
[000adbd0]                           dc.w $c003
[000adbd2]                           dc.w $fe00
[000adbd4]                           dc.w $0000
[000adbd6]                           dc.w $0000
[000adbd8]                           dc.w $0000
[000adbda]                           dc.w $03ff
[000adbdc]                           dc.w $f81f
[000adbde]                           dc.w $ffc0
[000adbe0]                           dc.w $0000
[000adbe2]                           dc.w $0000
[000adbe4]                           dc.w $0000
[000adbe6]                           dc.w $0000
[000adbe8]                           dc.w $0000
[000adbea]                           dc.w $0000
[000adbec]                           dc.w $0000
[000adbee]                           dc.w $0000
[000adbf0]                           dc.w $0000
[000adbf2]                           dc.w $0000
[000adbf4]                           dc.w $0000
[000adbf6]                           dc.w $0000
[000adbf8]                           dc.w $0001
[000adbfa]                           dc.w $c001
[000adbfc]                           dc.w $fc00
[000adbfe]                           dc.w $0003
[000adc00]                           dc.w $8001
[000adc02]                           dc.w $3c00
[000adc04]                           dc.w $0007
[000adc06]                           dc.w $0001
[000adc08]                           dc.w $1c00
[000adc0a]                           dc.w $0007
[000adc0c]                           dc.w $0001
[000adc0e]                           dc.w $8c00
[000adc10]                           dc.w $000e
[000adc12]                           dc.w $0001
[000adc14]                           dc.w $c400
[000adc16]                           dc.w $000e
[000adc18]                           dc.w $0001
[000adc1a]                           dc.w $e400
[000adc1c]                           dc.w $000e
[000adc1e]                           dc.w $0001
[000adc20]                           dc.w $fc00
[000adc22]                           dc.w $0000
[000adc24]                           dc.w $0000
[000adc26]                           dc.w $0000
[000adc28]                           dc.w $03ff
[000adc2a]                           dc.w $f81f
[000adc2c]                           dc.w $ffc0
[000adc2e]                           dc.w $0000
[000adc30]                           dc.w $0000
[000adc32]                           dc.w $0000
[000adc34]                           dc.w $0000
[000adc36]                           dc.w $0000
[000adc38]                           dc.w $0000
[000adc3a]                           dc.w $0000
[000adc3c]                           dc.w $0000
[000adc3e]                           dc.w $0000
[000adc40]                           dc.w $0000
[000adc42]                           dc.w $0000
[000adc44]                           dc.w $0000
[000adc46]                           dc.w $0000
[000adc48]                           dc.w $0000
[000adc4a]                           dc.w $0000
[000adc4c]                           dc.w $0000
[000adc4e]                           dc.w $0000
[000adc50]                           dc.w $0000
[000adc52]                           dc.w $0000
[000adc54]                           dc.w $0000
[000adc56]                           dc.w $0000
[000adc58]                           dc.w $007f
[000adc5a]                           dc.w $c003
[000adc5c]                           dc.w $fe00
[000adc5e]                           dc.w $007f
[000adc60]                           dc.w $c002
[000adc62]                           dc.w $0200
[000adc64]                           dc.w $006e
[000adc66]                           dc.w $c002
[000adc68]                           dc.w $0200
[000adc6a]                           dc.w $0064
[000adc6c]                           dc.w $c002
[000adc6e]                           dc.w $0200
[000adc70]                           dc.w $0060
[000adc72]                           dc.w $c002
[000adc74]                           dc.w $0200
[000adc76]                           dc.w $0064
[000adc78]                           dc.w $c002
[000adc7a]                           dc.w $0200
[000adc7c]                           dc.w $006e
[000adc7e]                           dc.w $c002
[000adc80]                           dc.w $0200
[000adc82]                           dc.w $007f
[000adc84]                           dc.w $c003
[000adc86]                           dc.w $fe00
[000adc88]                           dc.w $0000
[000adc8a]                           dc.w $0000
[000adc8c]                           dc.w $0000
[000adc8e]                           dc.w $03ff
[000adc90]                           dc.w $f81f
[000adc92]                           dc.w $ffc0
[000adc94]                           dc.w $0000
[000adc96]                           dc.w $0000
[000adc98]                           dc.w $0000
[000adc9a]                           dc.w $0000
[000adc9c]                           dc.w $0000
[000adc9e]                           dc.w $0000
[000adca0]                           dc.w $0000
[000adca2]                           dc.w $0000
[000adca4]                           dc.w $0000
[000adca6]                           dc.w $0000
[000adca8]                           dc.w $0000
[000adcaa]                           dc.w $0000
[000adcac]                           dc.w $0000
[000adcae]                           dc.w $6001
[000adcb0]                           dc.w $fc00
[000adcb2]                           dc.w $0000
[000adcb4]                           dc.w $c001
[000adcb6]                           dc.w $fc00
[000adcb8]                           dc.w $0001
[000adcba]                           dc.w $8001
[000adcbc]                           dc.w $fc00
[000adcbe]                           dc.w $0001
[000adcc0]                           dc.w $8001
[000adcc2]                           dc.w $fc00
[000adcc4]                           dc.w $0003
[000adcc6]                           dc.w $0001
[000adcc8]                           dc.w $fc00
[000adcca]                           dc.w $0003
[000adccc]                           dc.w $0001
[000adcce]                           dc.w $fc00
[000adcd0]                           dc.w $0003
[000adcd2]                           dc.w $0001
[000adcd4]                           dc.w $fc00
[000adcd6]                           dc.w $0000
[000adcd8]                           dc.w $0000
[000adcda]                           dc.w $0000
[000adcdc]                           dc.w $03ff
[000adcde]                           dc.w $f81f
[000adce0]                           dc.w $ffc0
[000adce2]                           dc.w $0000
[000adce4]                           dc.w $0000
[000adce6]                           dc.w $0000
[000adce8]                           dc.w $0000
[000adcea]                           dc.w $0000
[000adcec]                           dc.w $0000
[000adcee]                           dc.w $0000
[000adcf0]                           dc.w $0000
[000adcf2]                           dc.w $0000
[000adcf4]                           dc.w $0000
[000adcf6]                           dc.w $0000
[000adcf8]                           dc.w $0000
[000adcfa]                           dc.w $0000
[000adcfc]                           dc.w $0000
[000adcfe]                           dc.w $0000
[000add00]                           dc.w $0000
[000add02]                           dc.w $0000
[000add04]                           dc.w $0000
[000add06]                           dc.w $0000
[000add08]                           dc.w $0000
[000add0a]                           dc.w $0000
[000add0c]                           dc.w $007f
[000add0e]                           dc.w $c003
[000add10]                           dc.w $fe00
[000add12]                           dc.w $0040
[000add14]                           dc.w $4002
[000add16]                           dc.w $0200
[000add18]                           dc.w $0051
[000add1a]                           dc.w $4002
[000add1c]                           dc.w $0200
[000add1e]                           dc.w $004a
[000add20]                           dc.w $4002
[000add22]                           dc.w $0200
[000add24]                           dc.w $0044
[000add26]                           dc.w $4002
[000add28]                           dc.w $0200
[000add2a]                           dc.w $004a
[000add2c]                           dc.w $4002
[000add2e]                           dc.w $0200
[000add30]                           dc.w $0051
[000add32]                           dc.w $4002
[000add34]                           dc.w $3e00
[000add36]                           dc.w $0040
[000add38]                           dc.w $4003
[000add3a]                           dc.w $fe00
[000add3c]                           dc.w $0000
[000add3e]                           dc.w $0400
[000add40]                           dc.w $0020
[000add42]                           dc.w $0000
[000add44]                           dc.w $0400
[000add46]                           dc.w $0020
[000add48]                           dc.w $07ff
[000add4a]                           dc.w $fc3f
[000add4c]                           dc.w $ffe0
[000add4e]                           dc.w $0000
[000add50]                           dc.w $0000
[000add52]                           dc.w $0000
[000add54]                           dc.w $0000
[000add56]                           dc.w $0000
[000add58]                           dc.w $0000
[000add5a]                           dc.w $0000
[000add5c]                           dc.w $0003
[000add5e]                           dc.w $fe00
[000add60]                           dc.w $0004
[000add62]                           dc.w $0002
[000add64]                           dc.w $0200
[000add66]                           dc.w $0008
[000add68]                           dc.w $0002
[000add6a]                           dc.w $0200
[000add6c]                           dc.w $0010
[000add6e]                           dc.w $0002
[000add70]                           dc.w $4200
[000add72]                           dc.w $0010
[000add74]                           dc.w $0002
[000add76]                           dc.w $2200
[000add78]                           dc.w $0020
[000add7a]                           dc.w $0002
[000add7c]                           dc.w $1200
[000add7e]                           dc.w $0020
[000add80]                           dc.w $0002
[000add82]                           dc.w $0200
[000add84]                           dc.w $0020
[000add86]                           dc.w $0002
[000add88]                           dc.w $0200
[000add8a]                           dc.w $0000
[000add8c]                           dc.w $0400
[000add8e]                           dc.w $0020
[000add90]                           dc.w $0000
[000add92]                           dc.w $0400
[000add94]                           dc.w $0020
[000add96]                           dc.w $07ff
[000add98]                           dc.w $fc3f
[000add9a]                           dc.w $ffe0
[000add9c]                           dc.w $0000
[000add9e]                           dc.w $0000
[000adda0]                           dc.w $0000
[000adda2]                           dc.w $0000
[000adda4]                           dc.w $0000
[000adda6]                           dc.w $0000
[000adda8]                           dc.w $0000
[000addaa]                           dc.w $0000
[000addac]                           dc.w $0000
DATAS_02:
[000addae]                           dc.w $0000
[000addb0]                           dc.w $0000
[000addb2]                           dc.w $0000
[000addb4]                           dc.w $0000
[000addb6]                           dc.w $0000
[000addb8]                           dc.w $0000
[000addba]                           dc.w $0000
[000addbc]                           dc.w $0000
[000addbe]                           dc.w $0000
[000addc0]                           dc.w $007f
[000addc2]                           dc.w $c003
[000addc4]                           dc.w $fe00
[000addc6]                           dc.w $007f
[000addc8]                           dc.w $c003
[000addca]                           dc.w $fe00
[000addcc]                           dc.w $007f
[000addce]                           dc.w $c003
[000addd0]                           dc.w $fe00
[000addd2]                           dc.w $007f
[000addd4]                           dc.w $c003
[000addd6]                           dc.w $fe00
[000addd8]                           dc.w $007f
[000addda]                           dc.w $c003
[000adddc]                           dc.w $fe00
[000addde]                           dc.w $007f
[000adde0]                           dc.w $c003
[000adde2]                           dc.w $fe00
[000adde4]                           dc.w $007f
[000adde6]                           dc.w $c003
[000adde8]                           dc.w $fe00
[000addea]                           dc.w $007f
[000addec]                           dc.w $c003
[000addee]                           dc.w $fe00
[000addf0]                           dc.w $07ff
[000addf2]                           dc.w $fc3f
[000addf4]                           dc.w $ffe0
[000addf6]                           dc.w $07ff
[000addf8]                           dc.w $fc3f
[000addfa]                           dc.w $ffe0
[000addfc]                           dc.w $07ff
[000addfe]                           dc.w $fc3f
[000ade00]                           dc.w $ffe0
[000ade02]                           dc.w $0000
[000ade04]                           dc.w $0000
[000ade06]                           dc.w $0000
[000ade08]                           dc.w $0000
[000ade0a]                           dc.w $0000
[000ade0c]                           dc.w $0000
[000ade0e]                           dc.w $0000
[000ade10]                           dc.w $0003
[000ade12]                           dc.w $fe00
[000ade14]                           dc.w $0007
[000ade16]                           dc.w $e003
[000ade18]                           dc.w $fe00
[000ade1a]                           dc.w $000f
[000ade1c]                           dc.w $c003
[000ade1e]                           dc.w $fe00
[000ade20]                           dc.w $001f
[000ade22]                           dc.w $8003
[000ade24]                           dc.w $fe00
[000ade26]                           dc.w $001f
[000ade28]                           dc.w $8003
[000ade2a]                           dc.w $fe00
[000ade2c]                           dc.w $003f
[000ade2e]                           dc.w $0003
[000ade30]                           dc.w $fe00
[000ade32]                           dc.w $003f
[000ade34]                           dc.w $0003
[000ade36]                           dc.w $fe00
[000ade38]                           dc.w $003f
[000ade3a]                           dc.w $0003
[000ade3c]                           dc.w $fe00
[000ade3e]                           dc.w $07ff
[000ade40]                           dc.w $fc3f
[000ade42]                           dc.w $ffe0
[000ade44]                           dc.w $07ff
[000ade46]                           dc.w $fc3f
[000ade48]                           dc.w $ffe0
[000ade4a]                           dc.w $07ff
[000ade4c]                           dc.w $fc3f
[000ade4e]                           dc.w $ffe0
[000ade50]                           dc.w $0000
[000ade52]                           dc.w $0000
[000ade54]                           dc.w $0000
[000ade56]                           dc.w $0000
[000ade58]                           dc.w $0000
[000ade5a]                           dc.w $0000
[000ade5c]                           dc.w $0000
[000ade5e]                           dc.w $0000
[000ade60]                           dc.w $0000
DATAS_03:
[000ade62]                           dc.w $0000
[000ade64]                           dc.w $0000
[000ade66]                           dc.w $02d8
[000ade68]                           dc.w $0000
[000ade6a]                           dc.w $0000
[000ade6c]                           dc.w $0000
[000ade6e]                           dc.w $0000
[000ade70]                           dc.w $0000
[000ade72]                           dc.w $0000
[000ade74]                           dc.w $0000
[000ade76]                           dc.w $0000
[000ade78]                           dc.w $0000
[000ade7a]                           dc.w $007f
[000ade7c]                           dc.w $c003
[000ade7e]                           dc.w $fe00
[000ade80]                           dc.w $007f
[000ade82]                           dc.w $c003
[000ade84]                           dc.w $c200
[000ade86]                           dc.w $007f
[000ade88]                           dc.w $c003
[000ade8a]                           dc.w $d200
[000ade8c]                           dc.w $007f
[000ade8e]                           dc.w $c003
[000ade90]                           dc.w $8200
[000ade92]                           dc.w $007f
[000ade94]                           dc.w $c002
[000ade96]                           dc.w $2200
[000ade98]                           dc.w $007f
[000ade9a]                           dc.w $c002
[000ade9c]                           dc.w $0200
[000ade9e]                           dc.w $007f
[000adea0]                           dc.w $c002
[000adea2]                           dc.w $0200
[000adea4]                           dc.w $007f
[000adea6]                           dc.w $c003
[000adea8]                           dc.w $fe00
[000adeaa]                           dc.w $0000
[000adeac]                           dc.w $0000
[000adeae]                           dc.w $0000
[000adeb0]                           dc.w $03ff
[000adeb2]                           dc.w $f81f
[000adeb4]                           dc.w $ffc0
[000adeb6]                           dc.w $0000
[000adeb8]                           dc.w $0000
[000adeba]                           dc.w $0000
[000adebc]                           dc.w $0000
[000adebe]                           dc.w $0000
[000adec0]                           dc.w $0000
[000adec2]                           dc.w $0000
[000adec4]                           dc.w $0000
[000adec6]                           dc.w $0000
[000adec8]                           dc.w $0000
[000adeca]                           dc.w $0000
[000adecc]                           dc.w $0000
[000adece]                           dc.w $0007
[000aded0]                           dc.w $8001
[000aded2]                           dc.w $fc00
[000aded4]                           dc.w $000f
[000aded6]                           dc.w $0001
[000aded8]                           dc.w $fc00
[000adeda]                           dc.w $001e
[000adedc]                           dc.w $0001
[000adede]                           dc.w $fc00
[000adee0]                           dc.w $001e
[000adee2]                           dc.w $0001
[000adee4]                           dc.w $fc00
[000adee6]                           dc.w $003c
[000adee8]                           dc.w $0001
[000adeea]                           dc.w $fc00
[000adeec]                           dc.w $003c
[000adeee]                           dc.w $0001
[000adef0]                           dc.w $fc00
[000adef2]                           dc.w $003c
[000adef4]                           dc.w $0001
[000adef6]                           dc.w $fc00
[000adef8]                           dc.w $0000
[000adefa]                           dc.w $0000
[000adefc]                           dc.w $0000
[000adefe]                           dc.w $03ff
[000adf00]                           dc.w $f81f
[000adf02]                           dc.w $ffc0
[000adf04]                           dc.w $0000
[000adf06]                           dc.w $0000
[000adf08]                           dc.w $0000
[000adf0a]                           dc.w $0000
[000adf0c]                           dc.w $0000
[000adf0e]                           dc.w $0000
[000adf10]                           dc.w $0000
[000adf12]                           dc.w $0000
[000adf14]                           dc.w $0000
[000adf16]                           dc.w $0000
[000adf18]                           dc.w $0000
[000adf1a]                           dc.w $0000
[000adf1c]                           dc.w $0000
[000adf1e]                           dc.w $0000
[000adf20]                           dc.w $0000
[000adf22]                           dc.w $0000
[000adf24]                           dc.w $0000
[000adf26]                           dc.w $0000
[000adf28]                           dc.w $0000
[000adf2a]                           dc.w $0000
[000adf2c]                           dc.w $0000
[000adf2e]                           dc.w $007f
[000adf30]                           dc.w $c003
[000adf32]                           dc.w $fe00
[000adf34]                           dc.w $007f
[000adf36]                           dc.w $c002
[000adf38]                           dc.w $c200
[000adf3a]                           dc.w $006e
[000adf3c]                           dc.w $c003
[000adf3e]                           dc.w $d200
[000adf40]                           dc.w $0064
[000adf42]                           dc.w $c003
[000adf44]                           dc.w $8200
[000adf46]                           dc.w $0071
[000adf48]                           dc.w $c002
[000adf4a]                           dc.w $2200
[000adf4c]                           dc.w $0064
[000adf4e]                           dc.w $c002
[000adf50]                           dc.w $1e00
[000adf52]                           dc.w $006e
[000adf54]                           dc.w $c003
[000adf56]                           dc.w $fe00
[000adf58]                           dc.w $007f
[000adf5a]                           dc.w $c003
[000adf5c]                           dc.w $fe00
[000adf5e]                           dc.w $0000
[000adf60]                           dc.w $0000
[000adf62]                           dc.w $0000
[000adf64]                           dc.w $03ff
[000adf66]                           dc.w $f81f
[000adf68]                           dc.w $ffc0
[000adf6a]                           dc.w $0000
[000adf6c]                           dc.w $0000
[000adf6e]                           dc.w $0000
[000adf70]                           dc.w $0000
[000adf72]                           dc.w $0000
[000adf74]                           dc.w $0000
[000adf76]                           dc.w $0000
[000adf78]                           dc.w $0000
[000adf7a]                           dc.w $0000
[000adf7c]                           dc.w $0000
[000adf7e]                           dc.w $0000
[000adf80]                           dc.w $0000
[000adf82]                           dc.w $0001
[000adf84]                           dc.w $c001
[000adf86]                           dc.w $fc00
[000adf88]                           dc.w $0003
[000adf8a]                           dc.w $8001
[000adf8c]                           dc.w $3c00
[000adf8e]                           dc.w $0007
[000adf90]                           dc.w $0001
[000adf92]                           dc.w $1c00
[000adf94]                           dc.w $0007
[000adf96]                           dc.w $0001
[000adf98]                           dc.w $8c00
[000adf9a]                           dc.w $000e
[000adf9c]                           dc.w $0001
[000adf9e]                           dc.w $c400
[000adfa0]                           dc.w $000e
[000adfa2]                           dc.w $0001
[000adfa4]                           dc.w $e400
[000adfa6]                           dc.w $000e
[000adfa8]                           dc.w $0001
[000adfaa]                           dc.w $fc00
[000adfac]                           dc.w $0000
[000adfae]                           dc.w $0000
[000adfb0]                           dc.w $0000
[000adfb2]                           dc.w $03ff
[000adfb4]                           dc.w $f81f
[000adfb6]                           dc.w $ffc0
[000adfb8]                           dc.w $0000
[000adfba]                           dc.w $0000
[000adfbc]                           dc.w $0000
[000adfbe]                           dc.w $0000
[000adfc0]                           dc.w $0000
[000adfc2]                           dc.w $0000
[000adfc4]                           dc.w $0000
[000adfc6]                           dc.w $0000
[000adfc8]                           dc.w $0000
[000adfca]                           dc.w $0000
[000adfcc]                           dc.w $0000
[000adfce]                           dc.w $0000
[000adfd0]                           dc.w $0000
[000adfd2]                           dc.w $0000
[000adfd4]                           dc.w $0000
[000adfd6]                           dc.w $0000
[000adfd8]                           dc.w $0000
[000adfda]                           dc.w $0000
[000adfdc]                           dc.w $0000
[000adfde]                           dc.w $0000
[000adfe0]                           dc.w $0000
[000adfe2]                           dc.w $007f
[000adfe4]                           dc.w $c003
[000adfe6]                           dc.w $fe00
[000adfe8]                           dc.w $007f
[000adfea]                           dc.w $c002
[000adfec]                           dc.w $0200
[000adfee]                           dc.w $006e
[000adff0]                           dc.w $c002
[000adff2]                           dc.w $0200
[000adff4]                           dc.w $0064
[000adff6]                           dc.w $c002
[000adff8]                           dc.w $0200
[000adffa]                           dc.w $0060
[000adffc]                           dc.w $c002
[000adffe]                           dc.w $0200
[000ae000]                           dc.w $0064
[000ae002]                           dc.w $c002
[000ae004]                           dc.w $0200
[000ae006]                           dc.w $006e
[000ae008]                           dc.w $c002
[000ae00a]                           dc.w $0200
[000ae00c]                           dc.w $007f
[000ae00e]                           dc.w $c003
[000ae010]                           dc.w $fe00
[000ae012]                           dc.w $0000
[000ae014]                           dc.w $0000
[000ae016]                           dc.w $0000
[000ae018]                           dc.w $03ff
[000ae01a]                           dc.w $f81f
[000ae01c]                           dc.w $ffc0
[000ae01e]                           dc.w $0000
[000ae020]                           dc.w $0000
[000ae022]                           dc.w $0000
[000ae024]                           dc.w $0000
[000ae026]                           dc.w $0000
[000ae028]                           dc.w $0000
[000ae02a]                           dc.w $0000
[000ae02c]                           dc.w $0000
[000ae02e]                           dc.w $0000
[000ae030]                           dc.w $0000
[000ae032]                           dc.w $0000
[000ae034]                           dc.w $0000
[000ae036]                           dc.w $0000
[000ae038]                           dc.w $6001
[000ae03a]                           dc.w $fc00
[000ae03c]                           dc.w $0000
[000ae03e]                           dc.w $c001
[000ae040]                           dc.w $fc00
[000ae042]                           dc.w $0001
[000ae044]                           dc.w $8001
[000ae046]                           dc.w $fc00
[000ae048]                           dc.w $0001
[000ae04a]                           dc.w $8001
[000ae04c]                           dc.w $fc00
[000ae04e]                           dc.w $0003
[000ae050]                           dc.w $0001
[000ae052]                           dc.w $fc00
[000ae054]                           dc.w $0003
[000ae056]                           dc.w $0001
[000ae058]                           dc.w $fc00
[000ae05a]                           dc.w $0003
[000ae05c]                           dc.w $0001
[000ae05e]                           dc.w $fc00
[000ae060]                           dc.w $0000
[000ae062]                           dc.w $0000
[000ae064]                           dc.w $0000
[000ae066]                           dc.w $03ff
[000ae068]                           dc.w $f81f
[000ae06a]                           dc.w $ffc0
[000ae06c]                           dc.w $0000
[000ae06e]                           dc.w $0000
[000ae070]                           dc.w $0000
[000ae072]                           dc.w $0000
[000ae074]                           dc.w $0000
[000ae076]                           dc.w $0000
[000ae078]                           dc.w $0000
[000ae07a]                           dc.w $0000
[000ae07c]                           dc.w $0000
[000ae07e]                           dc.w $0000
[000ae080]                           dc.w $0000
[000ae082]                           dc.w $0000
[000ae084]                           dc.w $0000
[000ae086]                           dc.w $0000
[000ae088]                           dc.w $0000
[000ae08a]                           dc.w $0000
[000ae08c]                           dc.w $0000
[000ae08e]                           dc.w $0000
[000ae090]                           dc.w $0000
[000ae092]                           dc.w $0000
[000ae094]                           dc.w $0000
[000ae096]                           dc.w $007f
[000ae098]                           dc.w $c003
[000ae09a]                           dc.w $fe00
[000ae09c]                           dc.w $0040
[000ae09e]                           dc.w $4002
[000ae0a0]                           dc.w $0200
[000ae0a2]                           dc.w $0051
[000ae0a4]                           dc.w $4002
[000ae0a6]                           dc.w $0200
[000ae0a8]                           dc.w $004a
[000ae0aa]                           dc.w $4002
[000ae0ac]                           dc.w $0200
[000ae0ae]                           dc.w $0044
[000ae0b0]                           dc.w $4002
[000ae0b2]                           dc.w $0200
[000ae0b4]                           dc.w $004a
[000ae0b6]                           dc.w $4002
[000ae0b8]                           dc.w $0200
[000ae0ba]                           dc.w $0051
[000ae0bc]                           dc.w $4002
[000ae0be]                           dc.w $3e00
[000ae0c0]                           dc.w $0040
[000ae0c2]                           dc.w $4003
[000ae0c4]                           dc.w $fe00
[000ae0c6]                           dc.w $0000
[000ae0c8]                           dc.w $0400
[000ae0ca]                           dc.w $0020
[000ae0cc]                           dc.w $0000
[000ae0ce]                           dc.w $0400
[000ae0d0]                           dc.w $0020
[000ae0d2]                           dc.w $07ff
[000ae0d4]                           dc.w $fc3f
[000ae0d6]                           dc.w $ffe0
[000ae0d8]                           dc.w $0000
[000ae0da]                           dc.w $0000
[000ae0dc]                           dc.w $0000
[000ae0de]                           dc.w $0000
[000ae0e0]                           dc.w $0000
[000ae0e2]                           dc.w $0000
[000ae0e4]                           dc.w $0000
[000ae0e6]                           dc.w $0003
[000ae0e8]                           dc.w $fe00
[000ae0ea]                           dc.w $0004
[000ae0ec]                           dc.w $0002
[000ae0ee]                           dc.w $0200
[000ae0f0]                           dc.w $0008
[000ae0f2]                           dc.w $0002
[000ae0f4]                           dc.w $0200
[000ae0f6]                           dc.w $0010
[000ae0f8]                           dc.w $0002
[000ae0fa]                           dc.w $4200
[000ae0fc]                           dc.w $0010
[000ae0fe]                           dc.w $0002
[000ae100]                           dc.w $2200
[000ae102]                           dc.w $0020
[000ae104]                           dc.w $0002
[000ae106]                           dc.w $1200
[000ae108]                           dc.w $0020
[000ae10a]                           dc.w $0002
[000ae10c]                           dc.w $0200
[000ae10e]                           dc.w $0020
[000ae110]                           dc.w $0002
[000ae112]                           dc.w $0200
[000ae114]                           dc.w $0000
[000ae116]                           dc.w $0400
[000ae118]                           dc.w $0020
[000ae11a]                           dc.w $0000
[000ae11c]                           dc.w $0400
[000ae11e]                           dc.w $0020
[000ae120]                           dc.w $07ff
[000ae122]                           dc.w $fc3f
[000ae124]                           dc.w $ffe0
[000ae126]                           dc.w $0000
[000ae128]                           dc.w $0000
[000ae12a]                           dc.w $0000
[000ae12c]                           dc.w $0000
[000ae12e]                           dc.w $0000
[000ae130]                           dc.w $0000
[000ae132]                           dc.w $0000
[000ae134]                           dc.w $0000
[000ae136]                           dc.w $0000
DATAS_04:
[000ae138]                           dc.w $0000
[000ae13a]                           dc.w $0000
[000ae13c]                           dc.w $0000
[000ae13e]                           dc.w $0000
[000ae140]                           dc.w $0000
[000ae142]                           dc.w $0000
[000ae144]                           dc.w $0000
[000ae146]                           dc.w $0000
[000ae148]                           dc.w $0000
[000ae14a]                           dc.w $007f
[000ae14c]                           dc.w $c003
[000ae14e]                           dc.w $fe00
[000ae150]                           dc.w $007f
[000ae152]                           dc.w $c003
[000ae154]                           dc.w $fe00
[000ae156]                           dc.w $007f
[000ae158]                           dc.w $c003
[000ae15a]                           dc.w $fe00
[000ae15c]                           dc.w $007f
[000ae15e]                           dc.w $c003
[000ae160]                           dc.w $fe00
[000ae162]                           dc.w $007f
[000ae164]                           dc.w $c003
[000ae166]                           dc.w $fe00
[000ae168]                           dc.w $007f
[000ae16a]                           dc.w $c003
[000ae16c]                           dc.w $fe00
[000ae16e]                           dc.w $007f
[000ae170]                           dc.w $c003
[000ae172]                           dc.w $fe00
[000ae174]                           dc.w $007f
[000ae176]                           dc.w $c003
[000ae178]                           dc.w $fe00
[000ae17a]                           dc.w $07ff
[000ae17c]                           dc.w $fc3f
[000ae17e]                           dc.w $ffe0
[000ae180]                           dc.w $07ff
[000ae182]                           dc.w $fc3f
[000ae184]                           dc.w $ffe0
[000ae186]                           dc.w $07ff
[000ae188]                           dc.w $fc3f
[000ae18a]                           dc.w $ffe0
[000ae18c]                           dc.w $0000
[000ae18e]                           dc.w $0000
[000ae190]                           dc.w $0000
[000ae192]                           dc.w $0000
[000ae194]                           dc.w $0000
[000ae196]                           dc.w $0000
[000ae198]                           dc.w $0000
[000ae19a]                           dc.w $0003
[000ae19c]                           dc.w $fe00
[000ae19e]                           dc.w $0007
[000ae1a0]                           dc.w $e003
[000ae1a2]                           dc.w $fe00
[000ae1a4]                           dc.w $000f
[000ae1a6]                           dc.w $c003
[000ae1a8]                           dc.w $fe00
[000ae1aa]                           dc.w $001f
[000ae1ac]                           dc.w $8003
[000ae1ae]                           dc.w $fe00
[000ae1b0]                           dc.w $001f
[000ae1b2]                           dc.w $8003
[000ae1b4]                           dc.w $fe00
[000ae1b6]                           dc.w $003f
[000ae1b8]                           dc.w $0003
[000ae1ba]                           dc.w $fe00
[000ae1bc]                           dc.w $003f
[000ae1be]                           dc.w $0003
[000ae1c0]                           dc.w $fe00
[000ae1c2]                           dc.w $003f
[000ae1c4]                           dc.w $0003
[000ae1c6]                           dc.w $fe00
[000ae1c8]                           dc.w $07ff
[000ae1ca]                           dc.w $fc3f
[000ae1cc]                           dc.w $ffe0
[000ae1ce]                           dc.w $07ff
[000ae1d0]                           dc.w $fc3f
[000ae1d2]                           dc.w $ffe0
[000ae1d4]                           dc.w $07ff
[000ae1d6]                           dc.w $fc3f
[000ae1d8]                           dc.w $ffe0
[000ae1da]                           dc.w $0000
[000ae1dc]                           dc.w $0000
[000ae1de]                           dc.w $0000
[000ae1e0]                           dc.w $0000
[000ae1e2]                           dc.w $0000
[000ae1e4]                           dc.w $0000
[000ae1e6]                           dc.w $0000
[000ae1e8]                           dc.w $0000
[000ae1ea]                           dc.w $0000
TEDINFO_01:
[000ae1ec] 000ada01                  dc.l TEXT_01
[000ae1f0] 000ad9f5                  dc.l TEXT_002
[000ae1f4] 000ad9f5                  dc.l TEXT_002
[000ae1f8]                           dc.w $0005
[000ae1fa]                           dc.w $0006
[000ae1fc]                           dc.w $0002
[000ae1fe]                           dc.w $1180
[000ae200]                           dc.w $0000
[000ae202]                           dc.w $ffff
[000ae204]                           dc.w $0006
[000ae206]                           dc.w $0001
TEDINFO_02:
[000ae208] 000ada10                  dc.l TEXT_02
[000ae20c] 000ad9f5                  dc.l TEXT_002
[000ae210] 000ad9f5                  dc.l TEXT_002
[000ae214]                           dc.w $0005
[000ae216]                           dc.w $0006
[000ae218]                           dc.w $0002
[000ae21a]                           dc.w $1180
[000ae21c]                           dc.w $0000
[000ae21e]                           dc.w $ffff
[000ae220]                           dc.w $0004
[000ae222]                           dc.w $0001
A_3DBUTTON01:
[000ae224] 00064a22                  dc.l A_3Dbutton
[000ae228]                           dc.w $29f1
[000ae22a]                           dc.w $0178
[000ae22c] 000630f2                  dc.l Auo_string
[000ae230]                           dc.w $0000
[000ae232]                           dc.w $0000
[000ae234]                           dc.w $0000
[000ae236]                           dc.w $0000
[000ae238]                           dc.w $0000
[000ae23a]                           dc.w $0000
[000ae23c]                           dc.w $0000
[000ae23e]                           dc.w $0000
[000ae240]                           dc.w $0000
[000ae242]                           dc.w $0000
A_3DBUTTON02:
[000ae244] 00064a22                  dc.l A_3Dbutton
[000ae248]                           dc.w $29c1
[000ae24a]                           dc.w $0178
[000ae24c] 000630f2                  dc.l Auo_string
[000ae250] 000ada98                  dc.l TEXT_19
[000ae254]                           dc.w $0000
[000ae256]                           dc.w $0000
[000ae258]                           dc.w $0000
[000ae25a]                           dc.w $0000
[000ae25c] 000ad94a                  dc.l BUBBLE_06
[000ae260]                           dc.w $0000
[000ae262]                           dc.w $0000
A_3DBUTTON03:
[000ae264] 00064a22                  dc.l A_3Dbutton
[000ae268]                           dc.w $29f1
[000ae26a]                           dc.w $0178
[000ae26c] 000630f2                  dc.l Auo_string
[000ae270] 000adaa0                  dc.l TEXT_20
[000ae274]                           dc.w $0000
[000ae276]                           dc.w $0000
[000ae278]                           dc.w $0000
[000ae27a]                           dc.w $0000
[000ae27c]                           dc.w $0000
[000ae27e]                           dc.w $0000
[000ae280]                           dc.w $0000
[000ae282]                           dc.w $0000
A_3DBUTTON04:
[000ae284] 00064a22                  dc.l A_3Dbutton
[000ae288]                           dc.w $2011
[000ae28a]                           dc.w $9178
[000ae28c] 000630f2                  dc.l Auo_string
[000ae290]                           dc.w $0000
[000ae292]                           dc.w $0000
[000ae294]                           dc.w $0000
[000ae296]                           dc.w $0000
[000ae298]                           dc.w $0000
[000ae29a]                           dc.w $0000
[000ae29c]                           dc.w $0000
[000ae29e]                           dc.w $0000
[000ae2a0]                           dc.w $0000
[000ae2a2]                           dc.w $0000
A_3DBUTTON05:
[000ae2a4] 00064a22                  dc.l A_3Dbutton
[000ae2a8]                           dc.w $29c1
[000ae2aa]                           dc.w $0178
[000ae2ac] 000630f2                  dc.l Auo_string
[000ae2b0] 000adab5                  dc.l TEXT_23
[000ae2b4]                           dc.w $0000
[000ae2b6]                           dc.w $0000
[000ae2b8]                           dc.w $0000
[000ae2ba]                           dc.w $0000
[000ae2bc] 000ad9b9                  dc.l BUBBLE_08
[000ae2c0]                           dc.w $0000
[000ae2c2]                           dc.w $0000
A_3DBUTTON06:
[000ae2c4] 00064a22                  dc.l A_3Dbutton
[000ae2c8]                           dc.w $29f1
[000ae2ca]                           dc.w $0178
[000ae2cc] 000630f2                  dc.l Auo_string
[000ae2d0] 000ada3a                  dc.l TEXT_07
[000ae2d4]                           dc.w $0000
[000ae2d6]                           dc.w $0000
[000ae2d8]                           dc.w $0000
[000ae2da]                           dc.w $0000
[000ae2dc]                           dc.w $0000
[000ae2de]                           dc.w $0000
[000ae2e0]                           dc.w $0000
[000ae2e2]                           dc.w $0000
A_3DBUTTON07:
[000ae2e4] 00064a22                  dc.l A_3Dbutton
[000ae2e8]                           dc.w $29c1
[000ae2ea]                           dc.w $0178
[000ae2ec] 000630f2                  dc.l Auo_string
[000ae2f0] 000ada07                  dc.l TEXT_019
[000ae2f4]                           dc.w $0000
[000ae2f6]                           dc.w $0000
[000ae2f8]                           dc.w $0000
[000ae2fa]                           dc.w $0000
[000ae2fc] 000ad97d                  dc.l BUBBLE_07
[000ae300]                           dc.w $0000
[000ae302]                           dc.w $0000
A_3DBUTTON08:
[000ae304] 00064a22                  dc.l A_3Dbutton
[000ae308]                           dc.w $29f1
[000ae30a]                           dc.w $01f8
[000ae30c] 000630f2                  dc.l Auo_string
[000ae310]                           dc.w $0000
[000ae312]                           dc.w $0000
[000ae314]                           dc.w $0000
[000ae316]                           dc.w $0000
[000ae318]                           dc.w $0000
[000ae31a]                           dc.w $0000
[000ae31c]                           dc.w $0000
[000ae31e]                           dc.w $0000
[000ae320]                           dc.w $0000
[000ae322]                           dc.w $0000
A_3DBUTTON10:
[000ae324] 00064a22                  dc.l A_3Dbutton
[000ae328]                           dc.w $29c1
[000ae32a]                           dc.w $0178
[000ae32c] 000630f2                  dc.l Auo_string
[000ae330] 000adaa7                  dc.l TEXT_21
[000ae334]                           dc.w $0000
[000ae336]                           dc.w $0000
[000ae338]                           dc.w $0000
[000ae33a]                           dc.w $0000
[000ae33c] 000ad910                  dc.l BUBBLE_05
[000ae340]                           dc.w $0000
[000ae342]                           dc.w $0000
A_3DBUTTON11:
[000ae344] 00064a22                  dc.l A_3Dbutton
[000ae348]                           dc.w $a021
[000ae34a]                           dc.w $91f8
[000ae34c] 000630f2                  dc.l Auo_string
[000ae350]                           dc.w $0000
[000ae352]                           dc.w $0000
[000ae354]                           dc.w $0000
[000ae356]                           dc.w $0000
[000ae358]                           dc.w $0000
[000ae35a]                           dc.w $0000
[000ae35c]                           dc.w $0000
[000ae35e]                           dc.w $0000
[000ae360]                           dc.w $0000
[000ae362]                           dc.w $0000
A_3DBUTTON12:
[000ae364] 00064a22                  dc.l A_3Dbutton
[000ae368]                           dc.w $29f1
[000ae36a]                           dc.w $0178
[000ae36c] 000630f2                  dc.l Auo_string
[000ae370] 000ada14                  dc.l TEXT_03
[000ae374]                           dc.w $0000
[000ae376]                           dc.w $0000
[000ae378]                           dc.w $0000
[000ae37a]                           dc.w $0000
[000ae37c]                           dc.w $0000
[000ae37e]                           dc.w $0000
[000ae380]                           dc.w $0000
[000ae382]                           dc.w $0000
A_3DBUTTON13:
[000ae384] 00064a22                  dc.l A_3Dbutton
[000ae388]                           dc.w $2022
[000ae38a]                           dc.w $91a8
[000ae38c] 000630f2                  dc.l Auo_string
[000ae390]                           dc.w $0000
[000ae392]                           dc.w $0000
[000ae394]                           dc.w $0000
[000ae396]                           dc.w $0000
[000ae398]                           dc.w $0000
[000ae39a]                           dc.w $0000
[000ae39c]                           dc.w $0000
[000ae39e]                           dc.w $0000
[000ae3a0]                           dc.w $0000
[000ae3a2]                           dc.w $0000
A_3DBUTTON14:
[000ae3a4] 00064a22                  dc.l A_3Dbutton
[000ae3a8]                           dc.w $29f1
[000ae3aa]                           dc.w $0178
[000ae3ac] 000630f2                  dc.l Auo_string
[000ae3b0] 000adad0                  dc.l TEXT_27
[000ae3b4]                           dc.w $0000
[000ae3b6]                           dc.w $0000
[000ae3b8]                           dc.w $0000
[000ae3ba]                           dc.w $0000
[000ae3bc]                           dc.w $0000
[000ae3be]                           dc.w $0000
[000ae3c0]                           dc.w $0000
[000ae3c2]                           dc.w $0000
A_3DBUTTON15:
[000ae3c4] 00064a22                  dc.l A_3Dbutton
[000ae3c8]                           dc.w $29c1
[000ae3ca]                           dc.w $0178
[000ae3cc] 000630f2                  dc.l Auo_string
[000ae3d0] 000ad9f6                  dc.l TEXT_003
[000ae3d4]                           dc.w $0000
[000ae3d6]                           dc.w $0000
[000ae3d8]                           dc.w $0000
[000ae3da]                           dc.w $0000
[000ae3dc] 000ad86a                  dc.l BUBBLE_02
[000ae3e0]                           dc.w $0000
[000ae3e2]                           dc.w $0000
A_3DBUTTON16:
[000ae3e4] 00064a22                  dc.l A_3Dbutton
[000ae3e8]                           dc.w $21f1
[000ae3ea]                           dc.w $0178
[000ae3ec] 000630f2                  dc.l Auo_string
[000ae3f0]                           dc.w $0000
[000ae3f2]                           dc.w $0000
[000ae3f4]                           dc.w $0000
[000ae3f6]                           dc.w $0000
[000ae3f8]                           dc.w $0000
[000ae3fa]                           dc.w $0000
[000ae3fc]                           dc.w $0000
[000ae3fe]                           dc.w $0000
[000ae400]                           dc.w $0000
[000ae402]                           dc.w $0000
A_3DBUTTON18:
[000ae404] 00064a22                  dc.l A_3Dbutton
[000ae408]                           dc.w $29c1
[000ae40a]                           dc.w $0178
[000ae40c] 000630f2                  dc.l Auo_string
[000ae410] 000ad9f9                  dc.l TEXT_004
[000ae414]                           dc.w $0000
[000ae416]                           dc.w $0000
[000ae418]                           dc.w $0000
[000ae41a]                           dc.w $0000
[000ae41c] 000ad849                  dc.l BUBBLE_01
[000ae420]                           dc.w $0000
[000ae422]                           dc.w $0000
A_3DBUTTON27:
[000ae424] 00064a22                  dc.l A_3Dbutton
[000ae428]                           dc.w $09f1
[000ae42a]                           dc.w $0178
[000ae42c] 000630f2                  dc.l Auo_string
[000ae430]                           dc.w $0000
[000ae432]                           dc.w $0000
[000ae434]                           dc.w $0000
[000ae436]                           dc.w $0000
[000ae438]                           dc.w $0000
[000ae43a]                           dc.w $0000
[000ae43c]                           dc.w $0000
[000ae43e]                           dc.w $0000
[000ae440]                           dc.w $0000
[000ae442]                           dc.w $0000
A_ARROWS02:
[000ae444] 00065c72                  dc.l A_arrows
[000ae448]                           dc.w $1301
[000ae44a]                           dc.w $0001
[000ae44c]                           dc.w $0000
[000ae44e]                           dc.w $0000
[000ae450]                           dc.w $0000
[000ae452]                           dc.w $0000
[000ae454]                           dc.w $0000
[000ae456]                           dc.w $0000
[000ae458]                           dc.w $0000
[000ae45a]                           dc.w $0000
[000ae45c]                           dc.w $0000
[000ae45e]                           dc.w $0000
[000ae460]                           dc.w $0000
[000ae462]                           dc.w $0000
A_ARROWS03:
[000ae464] 00065c72                  dc.l A_arrows
[000ae468]                           dc.w $0001
[000ae46a]                           dc.w $0001
[000ae46c]                           dc.w $0000
[000ae46e]                           dc.w $0000
[000ae470]                           dc.w $0000
[000ae472]                           dc.w $0000
[000ae474]                           dc.w $0000
[000ae476]                           dc.w $0000
[000ae478]                           dc.w $0000
[000ae47a]                           dc.w $0000
[000ae47c]                           dc.w $0000
[000ae47e]                           dc.w $0000
[000ae480]                           dc.w $0000
[000ae482]                           dc.w $0000
A_BOXED02:
[000ae484] 0006afea                  dc.l A_boxed
[000ae488]                           dc.w $9038
[000ae48a]                           dc.w $0112
[000ae48c] 0006a068                  dc.l Auo_boxed
[000ae490]                           dc.w $0000
[000ae492]                           dc.w $0000
[000ae494]                           dc.w $0000
[000ae496]                           dc.w $0000
[000ae498]                           dc.w $0000
[000ae49a]                           dc.w $0000
[000ae49c] 000ad8c1                  dc.l BUBBLE_04
[000ae4a0]                           dc.w $0000
[000ae4a2]                           dc.w $0000
A_BOXED03:
[000ae4a4] 0006afea                  dc.l A_boxed
[000ae4a8]                           dc.w $9070
[000ae4aa]                           dc.w $0512
[000ae4ac] 0006a068                  dc.l Auo_boxed
[000ae4b0]                           dc.w $0000
[000ae4b2]                           dc.w $0000
[000ae4b4]                           dc.w $0000
[000ae4b6]                           dc.w $0000
[000ae4b8]                           dc.w $0000
[000ae4ba]                           dc.w $0000
[000ae4bc]                           dc.w $0000
[000ae4be]                           dc.w $0000
[000ae4c0]                           dc.w $0000
[000ae4c2]                           dc.w $0000
A_BOXED05:
[000ae4c4] 0006afea                  dc.l A_boxed
[000ae4c8]                           dc.w $9038
[000ae4ca]                           dc.w $1412
[000ae4cc] 0006a068                  dc.l Auo_boxed
[000ae4d0]                           dc.w $0000
[000ae4d2]                           dc.w $0000
[000ae4d4]                           dc.w $0000
[000ae4d6]                           dc.w $0000
[000ae4d8]                           dc.w $0000
[000ae4da]                           dc.w $0000
[000ae4dc] 000ad88c                  dc.l BUBBLE_03
[000ae4e0]                           dc.w $0000
[000ae4e2]                           dc.w $0000
A_BOXED06:
[000ae4e4] 0006afea                  dc.l A_boxed
[000ae4e8]                           dc.w $9078
[000ae4ea]                           dc.w $0512
[000ae4ec] 0006a068                  dc.l Auo_boxed
[000ae4f0]                           dc.w $0000
[000ae4f2]                           dc.w $0000
[000ae4f4]                           dc.w $0000
[000ae4f6]                           dc.w $0000
[000ae4f8]                           dc.w $0000
[000ae4fa]                           dc.w $0000
[000ae4fc]                           dc.w $0000
[000ae4fe]                           dc.w $0000
[000ae500]                           dc.w $0000
[000ae502]                           dc.w $0000
A_INNERFRAME02:
[000ae504] 00064256                  dc.l A_innerframe
[000ae508]                           dc.w $1000
[000ae50a]                           dc.w $8f19
[000ae50c] 000630f2                  dc.l Auo_string
[000ae510] 000ada91                  dc.l TEXT_18
[000ae514]                           dc.w $0000
[000ae516]                           dc.w $0000
[000ae518]                           dc.w $0000
[000ae51a]                           dc.w $0000
[000ae51c]                           dc.w $0000
[000ae51e]                           dc.w $0000
[000ae520]                           dc.w $0000
[000ae522]                           dc.w $0000
A_INNERFRAME03:
[000ae524] 00064256                  dc.l A_innerframe
[000ae528]                           dc.w $1000
[000ae52a]                           dc.w $8f19
[000ae52c] 000630f2                  dc.l Auo_string
[000ae530]                           dc.w $0000
[000ae532]                           dc.w $0000
[000ae534]                           dc.w $0000
[000ae536]                           dc.w $0000
[000ae538]                           dc.w $0000
[000ae53a]                           dc.w $0000
[000ae53c]                           dc.w $0000
[000ae53e]                           dc.w $0000
[000ae540]                           dc.w $0000
[000ae542]                           dc.w $0000
A_INNERFRAME04:
[000ae544] 00064256                  dc.l A_innerframe
[000ae548]                           dc.w $1000
[000ae54a]                           dc.w $8f19
[000ae54c] 000630f2                  dc.l Auo_string
[000ae550] 000ada75                  dc.l TEXT_15
[000ae554]                           dc.w $0000
[000ae556]                           dc.w $0000
[000ae558]                           dc.w $0000
[000ae55a]                           dc.w $0000
[000ae55c]                           dc.w $0000
[000ae55e]                           dc.w $0000
[000ae560]                           dc.w $0000
[000ae562]                           dc.w $0000
A_INNERFRAME05:
[000ae564] 00064256                  dc.l A_innerframe
[000ae568]                           dc.w $1000
[000ae56a]                           dc.w $8f19
[000ae56c] 000630f2                  dc.l Auo_string
[000ae570] 000ada21                  dc.l TEXT_04
[000ae574]                           dc.w $0000
[000ae576]                           dc.w $0000
[000ae578]                           dc.w $0000
[000ae57a]                           dc.w $0000
[000ae57c]                           dc.w $0000
[000ae57e]                           dc.w $0000
[000ae580]                           dc.w $0000
[000ae582]                           dc.w $0000
A_INNERFRAME06:
[000ae584] 00064256                  dc.l A_innerframe
[000ae588]                           dc.w $1000
[000ae58a]                           dc.w $8f19
[000ae58c] 000630f2                  dc.l Auo_string
[000ae590] 000ada29                  dc.l TEXT_05
[000ae594]                           dc.w $0000
[000ae596]                           dc.w $0000
[000ae598]                           dc.w $0000
[000ae59a]                           dc.w $0000
[000ae59c]                           dc.w $0000
[000ae59e]                           dc.w $0000
[000ae5a0]                           dc.w $0000
[000ae5a2]                           dc.w $0000
A_INNERFRAME07:
[000ae5a4] 00064256                  dc.l A_innerframe
[000ae5a8]                           dc.w $1000
[000ae5aa]                           dc.w $8f19
[000ae5ac] 000630f2                  dc.l Auo_string
[000ae5b0] 000ada31                  dc.l TEXT_06
[000ae5b4]                           dc.w $0000
[000ae5b6]                           dc.w $0000
[000ae5b8]                           dc.w $0000
[000ae5ba]                           dc.w $0000
[000ae5bc]                           dc.w $0000
[000ae5be]                           dc.w $0000
[000ae5c0]                           dc.w $0000
[000ae5c2]                           dc.w $0000
EDIC_BITMAP01:
[000ae5c4] 00020484                  dc.l edic_bitmap
[000ae5c8]                           dc.w $0000
[000ae5ca]                           dc.w $0000
[000ae5cc]                           dc.w $0000
[000ae5ce]                           dc.w $0000
[000ae5d0]                           dc.w $0000
[000ae5d2]                           dc.w $0000
[000ae5d4]                           dc.w $0000
[000ae5d6]                           dc.w $0000
[000ae5d8]                           dc.w $0000
[000ae5da]                           dc.w $0000
[000ae5dc]                           dc.w $0000
[000ae5de]                           dc.w $0000
[000ae5e0]                           dc.w $0000
[000ae5e2]                           dc.w $0000
ICNCOL01:
[000ae5e4] 000212f2                  dc.l IcnCol
[000ae5e8]                           dc.w $0000
[000ae5ea]                           dc.w $0000
[000ae5ec]                           dc.w $0000
[000ae5ee]                           dc.w $0000
[000ae5f0]                           dc.w $0000
[000ae5f2]                           dc.w $0000
[000ae5f4]                           dc.w $0000
[000ae5f6]                           dc.w $0000
[000ae5f8]                           dc.w $0000
[000ae5fa]                           dc.w $0000
[000ae5fc]                           dc.w $0000
[000ae5fe]                           dc.w $0000
[000ae600]                           dc.w $0000
[000ae602]                           dc.w $0000
PICCOLOR01:
[000ae604] 0002117c                  dc.l piccolor
[000ae608]                           dc.w $0000
[000ae60a]                           dc.w $0000
[000ae60c]                           dc.w $0000
[000ae60e]                           dc.w $0000
[000ae610]                           dc.w $0000
[000ae612]                           dc.w $0000
[000ae614]                           dc.w $0000
[000ae616]                           dc.w $0000
[000ae618]                           dc.w $0000
[000ae61a]                           dc.w $0000
[000ae61c]                           dc.w $0000
[000ae61e]                           dc.w $0000
[000ae620]                           dc.w $0000
[000ae622]                           dc.w $0000
USER_001:
[000ae624] 0002ccba                  dc.l user_control
[000ae628]                           dc.w $0000
[000ae62a]                           dc.w $0000
[000ae62c]                           dc.w $0000
[000ae62e]                           dc.w $0000
[000ae630]                           dc.w $0000
[000ae632]                           dc.w $0000
[000ae634]                           dc.w $0000
[000ae636]                           dc.w $0000
[000ae638]                           dc.w $0000
[000ae63a]                           dc.w $0000
[000ae63c]                           dc.w $0000
[000ae63e]                           dc.w $0000
[000ae640]                           dc.w $0000
[000ae642]                           dc.w $0000
_MSK_ICON_001:
[000ae644]                           dc.w $00ff
[000ae646]                           dc.w $ffff
[000ae648]                           dc.w $fe00
[000ae64a]                           dc.w $00ff
[000ae64c]                           dc.w $ffff
[000ae64e]                           dc.w $fe00
[000ae650]                           dc.w $00ff
[000ae652]                           dc.w $ffff
[000ae654]                           dc.w $fe00
[000ae656]                           dc.w $00ff
[000ae658]                           dc.w $ffff
[000ae65a]                           dc.w $fe00
[000ae65c]                           dc.w $00ff
[000ae65e]                           dc.w $ffff
[000ae660]                           dc.w $fe00
[000ae662]                           dc.w $00ff
[000ae664]                           dc.w $ffff
[000ae666]                           dc.w $fe00
[000ae668]                           dc.w $00ff
[000ae66a]                           dc.w $ffff
[000ae66c]                           dc.w $fe00
[000ae66e]                           dc.w $00ff
[000ae670]                           dc.w $ffff
[000ae672]                           dc.w $fe00
[000ae674]                           dc.w $00ff
[000ae676]                           dc.w $ffff
[000ae678]                           dc.w $fe00
[000ae67a]                           dc.w $00ff
[000ae67c]                           dc.w $ffff
[000ae67e]                           dc.w $fe00
[000ae680]                           dc.w $00ff
[000ae682]                           dc.w $ffff
[000ae684]                           dc.w $fe00
[000ae686]                           dc.w $00ff
[000ae688]                           dc.w $ffff
[000ae68a]                           dc.w $fe00
[000ae68c]                           dc.w $00ff
[000ae68e]                           dc.w $ffff
[000ae690]                           dc.w $fe00
[000ae692]                           dc.w $00ff
[000ae694]                           dc.w $ffff
[000ae696]                           dc.w $fe00
[000ae698]                           dc.w $00ff
[000ae69a]                           dc.w $ffff
[000ae69c]                           dc.w $fe00
[000ae69e]                           dc.w $0fff
[000ae6a0]                           dc.w $ffff
[000ae6a2]                           dc.w $fff0
[000ae6a4]                           dc.w $0fff
[000ae6a6]                           dc.w $ffff
[000ae6a8]                           dc.w $fff0
[000ae6aa]                           dc.w $0fff
[000ae6ac]                           dc.w $ffff
[000ae6ae]                           dc.w $fff0
[000ae6b0]                           dc.w $0fff
[000ae6b2]                           dc.w $ffff
[000ae6b4]                           dc.w $fff0
[000ae6b6]                           dc.w $0fff
[000ae6b8]                           dc.w $ffff
[000ae6ba]                           dc.w $fff0
[000ae6bc]                           dc.w $0fff
[000ae6be]                           dc.w $ffff
[000ae6c0]                           dc.w $fff0
[000ae6c2]                           dc.w $0fff
[000ae6c4]                           dc.w $ffff
[000ae6c6]                           dc.w $fff0
[000ae6c8]                           dc.w $0fff
[000ae6ca]                           dc.w $ffff
[000ae6cc]                           dc.w $fff0
[000ae6ce]                           dc.w $0000
[000ae6d0]                           dc.w $0000
[000ae6d2]                           dc.w $0000
_DAT_ICON_001:
[000ae6d4]                           dc.w $00ff
[000ae6d6]                           dc.w $ffff
[000ae6d8]                           dc.w $fe00
[000ae6da]                           dc.w $00c0
[000ae6dc]                           dc.w $0000
[000ae6de]                           dc.w $0600
[000ae6e0]                           dc.w $00c0
[000ae6e2]                           dc.w $7fff
[000ae6e4]                           dc.w $0600
[000ae6e6]                           dc.w $00c0
[000ae6e8]                           dc.w $8000
[000ae6ea]                           dc.w $8600
[000ae6ec]                           dc.w $00c1
[000ae6ee]                           dc.w $0000
[000ae6f0]                           dc.w $8600
[000ae6f2]                           dc.w $00c2
[000ae6f4]                           dc.w $0000
[000ae6f6]                           dc.w $8600
[000ae6f8]                           dc.w $00c2
[000ae6fa]                           dc.w $0000
[000ae6fc]                           dc.w $8600
[000ae6fe]                           dc.w $00c2
[000ae700]                           dc.w $0000
[000ae702]                           dc.w $8600
[000ae704]                           dc.w $00c2
[000ae706]                           dc.w $0000
[000ae708]                           dc.w $8600
[000ae70a]                           dc.w $00c2
[000ae70c]                           dc.w $0000
[000ae70e]                           dc.w $8600
[000ae710]                           dc.w $00c2
[000ae712]                           dc.w $0000
[000ae714]                           dc.w $8600
[000ae716]                           dc.w $00c2
[000ae718]                           dc.w $0000
[000ae71a]                           dc.w $8600
[000ae71c]                           dc.w $00c2
[000ae71e]                           dc.w $0000
[000ae720]                           dc.w $8600
[000ae722]                           dc.w $00c2
[000ae724]                           dc.w $0000
[000ae726]                           dc.w $8600
[000ae728]                           dc.w $00c2
[000ae72a]                           dc.w $0000
[000ae72c]                           dc.w $8600
[000ae72e]                           dc.w $0fc3
[000ae730]                           dc.w $ffff
[000ae732]                           dc.w $87f0
[000ae734]                           dc.w $0c00
[000ae736]                           dc.w $0000
[000ae738]                           dc.w $0030
[000ae73a]                           dc.w $0c1c
[000ae73c]                           dc.w $f9f9
[000ae73e]                           dc.w $8830
[000ae740]                           dc.w $0c08
[000ae742]                           dc.b 'Å',$09,'H0'
[000ae746]                           dc.w $0c08
[000ae748]                           dc.b 'Å',$09,'(0'
[000ae74c]                           dc.w $0c1c
[000ae74e]                           dc.w $f9f9
[000ae750]                           dc.w $1830
[000ae752]                           dc.w $0c00
[000ae754]                           dc.w $0000
[000ae756]                           dc.w $0030
[000ae758]                           dc.w $0fff
[000ae75a]                           dc.w $ffff
[000ae75c]                           dc.w $fff0
[000ae75e]                           dc.w $0000
[000ae760]                           dc.w $0000
[000ae762]                           dc.w $0000
ICON_001:
[000ae764] 000ae644                  dc.l _MSK_ICON_001
[000ae768] 000ae6d4                  dc.l _DAT_ICON_001
[000ae76c] 000ada42                  dc.l TEXT_08
[000ae770]                           dc.w $1041
[000ae772]                           dc.w $0014
[000ae774]                           dc.w $0006
[000ae776]                           dc.w $0000
[000ae778]                           dc.w $0000
[000ae77a]                           dc.w $0030
[000ae77c]                           dc.w $0018
[000ae77e]                           dc.w $0000
[000ae780]                           dc.w $0018
[000ae782]                           dc.w $0030
[000ae784]                           dc.w $0008
[000ae786]                           dc.w $0000
[000ae788]                           dc.w $0000
_C4_IC_ICON:
[000ae78a]                           dc.w $0004
[000ae78c] 000ade68                  dc.l $000ade68
[000ae790] 000ae138                  dc.l DATAS_04
[000ae794]                           dc.w $0000
[000ae796]                           dc.w $0000
[000ae798]                           dc.w $0000
[000ae79a]                           dc.w $0000
[000ae79c]                           dc.w $0000
[000ae79e]                           dc.w $0000
_MSK_IC_ICON:
[000ae7a0]                           dc.w $0000
[000ae7a2]                           dc.w $0000
[000ae7a4]                           dc.w $0000
[000ae7a6]                           dc.w $0000
[000ae7a8]                           dc.w $0000
[000ae7aa]                           dc.w $0000
[000ae7ac]                           dc.w $0000
[000ae7ae]                           dc.w $0000
[000ae7b0]                           dc.w $0000
[000ae7b2]                           dc.w $007f
[000ae7b4]                           dc.w $c003
[000ae7b6]                           dc.w $fe00
[000ae7b8]                           dc.w $007f
[000ae7ba]                           dc.w $c003
[000ae7bc]                           dc.w $fe00
[000ae7be]                           dc.w $007f
[000ae7c0]                           dc.w $c003
[000ae7c2]                           dc.w $fe00
[000ae7c4]                           dc.w $007f
[000ae7c6]                           dc.w $c003
[000ae7c8]                           dc.w $fe00
[000ae7ca]                           dc.w $007f
[000ae7cc]                           dc.w $c003
[000ae7ce]                           dc.w $fe00
[000ae7d0]                           dc.w $007f
[000ae7d2]                           dc.w $c003
[000ae7d4]                           dc.w $fe00
[000ae7d6]                           dc.w $007f
[000ae7d8]                           dc.w $c003
[000ae7da]                           dc.w $fe00
[000ae7dc]                           dc.w $007f
[000ae7de]                           dc.w $c003
[000ae7e0]                           dc.w $fe00
[000ae7e2]                           dc.w $07ff
[000ae7e4]                           dc.w $fc3f
[000ae7e6]                           dc.w $ffe0
[000ae7e8]                           dc.w $07ff
[000ae7ea]                           dc.w $fc3f
[000ae7ec]                           dc.w $ffe0
[000ae7ee]                           dc.w $07ff
[000ae7f0]                           dc.w $fc3f
[000ae7f2]                           dc.w $ffe0
[000ae7f4]                           dc.w $0000
[000ae7f6]                           dc.w $0000
[000ae7f8]                           dc.w $0000
[000ae7fa]                           dc.w $0000
[000ae7fc]                           dc.w $0000
[000ae7fe]                           dc.w $0000
[000ae800]                           dc.w $007f
[000ae802]                           dc.w $c003
[000ae804]                           dc.w $fe00
[000ae806]                           dc.w $007f
[000ae808]                           dc.w $c003
[000ae80a]                           dc.w $fe00
[000ae80c]                           dc.w $007f
[000ae80e]                           dc.w $c003
[000ae810]                           dc.w $fe00
[000ae812]                           dc.w $007f
[000ae814]                           dc.w $c003
[000ae816]                           dc.w $fe00
[000ae818]                           dc.w $007f
[000ae81a]                           dc.w $c003
[000ae81c]                           dc.w $fe00
[000ae81e]                           dc.w $007f
[000ae820]                           dc.w $c003
[000ae822]                           dc.w $fe00
[000ae824]                           dc.w $007f
[000ae826]                           dc.w $c003
[000ae828]                           dc.w $fe00
[000ae82a]                           dc.w $007f
[000ae82c]                           dc.w $c003
[000ae82e]                           dc.w $fe00
[000ae830]                           dc.w $07ff
[000ae832]                           dc.w $fc3f
[000ae834]                           dc.w $ffe0
[000ae836]                           dc.w $07ff
[000ae838]                           dc.w $fc3f
[000ae83a]                           dc.w $ffe0
[000ae83c]                           dc.w $07ff
[000ae83e]                           dc.w $fc3f
[000ae840]                           dc.w $ffe0
[000ae842]                           dc.w $0000
[000ae844]                           dc.w $0000
[000ae846]                           dc.w $0000
[000ae848]                           dc.w $0000
[000ae84a]                           dc.w $0000
[000ae84c]                           dc.w $0000
[000ae84e]                           dc.w $0000
[000ae850]                           dc.w $0000
[000ae852]                           dc.w $0000
_DAT_IC_ICON:
[000ae854]                           dc.w $0000
[000ae856]                           dc.w $0000
[000ae858]                           dc.w $0000
[000ae85a]                           dc.w $0000
[000ae85c]                           dc.w $0000
[000ae85e]                           dc.w $0000
[000ae860]                           dc.w $0000
[000ae862]                           dc.w $0000
[000ae864]                           dc.w $0000
[000ae866]                           dc.w $007f
[000ae868]                           dc.w $c003
[000ae86a]                           dc.w $fe00
[000ae86c]                           dc.w $0040
[000ae86e]                           dc.w $4003
[000ae870]                           dc.w $fe00
[000ae872]                           dc.w $0051
[000ae874]                           dc.w $4003
[000ae876]                           dc.w $0600
[000ae878]                           dc.w $005b
[000ae87a]                           dc.w $4003
[000ae87c]                           dc.w $0600
[000ae87e]                           dc.w $005f
[000ae880]                           dc.w $4003
[000ae882]                           dc.w $0600
[000ae884]                           dc.w $005b
[000ae886]                           dc.w $4003
[000ae888]                           dc.w $0600
[000ae88a]                           dc.w $0051
[000ae88c]                           dc.w $4003
[000ae88e]                           dc.w $0600
[000ae890]                           dc.w $0040
[000ae892]                           dc.w $4003
[000ae894]                           dc.w $fe00
[000ae896]                           dc.w $07ff
[000ae898]                           dc.w $fc3f
[000ae89a]                           dc.w $ffe0
[000ae89c]                           dc.w $0400
[000ae89e]                           dc.w $0420
[000ae8a0]                           dc.w $0020
[000ae8a2]                           dc.w $07ff
[000ae8a4]                           dc.w $fc3f
[000ae8a6]                           dc.w $ffe0
[000ae8a8]                           dc.w $0000
[000ae8aa]                           dc.w $0000
[000ae8ac]                           dc.w $0000
[000ae8ae]                           dc.w $0000
[000ae8b0]                           dc.w $0000
[000ae8b2]                           dc.w $0000
[000ae8b4]                           dc.w $007f
[000ae8b6]                           dc.w $c003
[000ae8b8]                           dc.w $fe00
[000ae8ba]                           dc.w $0040
[000ae8bc]                           dc.w $4002
[000ae8be]                           dc.w $0200
[000ae8c0]                           dc.w $005f
[000ae8c2]                           dc.w $4002
[000ae8c4]                           dc.w $c200
[000ae8c6]                           dc.w $0051
[000ae8c8]                           dc.w $4002
[000ae8ca]                           dc.w $e200
[000ae8cc]                           dc.w $0051
[000ae8ce]                           dc.w $4002
[000ae8d0]                           dc.w $7200
[000ae8d2]                           dc.w $0051
[000ae8d4]                           dc.w $4002
[000ae8d6]                           dc.w $3a00
[000ae8d8]                           dc.w $005f
[000ae8da]                           dc.w $4002
[000ae8dc]                           dc.w $1a00
[000ae8de]                           dc.w $0040
[000ae8e0]                           dc.w $4002
[000ae8e2]                           dc.w $0200
[000ae8e4]                           dc.w $07ff
[000ae8e6]                           dc.w $fc3f
[000ae8e8]                           dc.w $ffe0
[000ae8ea]                           dc.w $0400
[000ae8ec]                           dc.w $0420
[000ae8ee]                           dc.w $0020
[000ae8f0]                           dc.w $07ff
[000ae8f2]                           dc.w $fc3f
[000ae8f4]                           dc.w $ffe0
[000ae8f6]                           dc.w $0000
[000ae8f8]                           dc.w $0000
[000ae8fa]                           dc.w $0000
[000ae8fc]                           dc.w $0000
[000ae8fe]                           dc.w $0000
[000ae900]                           dc.w $0000
[000ae902]                           dc.w $0000
[000ae904]                           dc.w $0000
[000ae906]                           dc.w $0000
IC_ICON:
[000ae908] 000ae7a0                  dc.l _MSK_IC_ICON
[000ae90c] 000ae854                  dc.l _DAT_IC_ICON
[000ae910] 000adaca                  dc.l TEXT_25
[000ae914]                           dc.w $1000
[000ae916]                           dc.w $0000
[000ae918]                           dc.w $0000
[000ae91a]                           dc.w $000c
[000ae91c]                           dc.w $0000
[000ae91e]                           dc.w $0030
[000ae920]                           dc.w $001e
[000ae922]                           dc.w $0000
[000ae924]                           dc.w $0020
[000ae926]                           dc.w $0048
[000ae928]                           dc.w $0008
[000ae92a] 000ae78a                  dc.l _C4_IC_ICON
COLOR:
[000ae92e]                           dc.w $ffff
[000ae930]                           dc.w $0001
[000ae932]                           dc.w $0010
[000ae934]                           dc.w $0014
[000ae936]                           dc.w $0000
[000ae938]                           dc.w $0020
[000ae93a]                           dc.w $00ff
[000ae93c]                           dc.w $1100
[000ae93e]                           dc.w $0000
[000ae940]                           dc.w $0000
[000ae942]                           dc.w $0010
[000ae944]                           dc.w $0004
_01_COLOR:
[000ae946]                           dc.w $0002
[000ae948]                           dc.w $ffff
[000ae94a]                           dc.w $ffff
[000ae94c]                           dc.w $0018
[000ae94e]                           dc.w $0001
[000ae950]                           dc.w $0000
[000ae952] 000ae604                  dc.l PICCOLOR01
[000ae956]                           dc.w $0000
[000ae958]                           dc.w $0000
[000ae95a]                           dc.w $0004
[000ae95c]                           dc.w $0001
_02_COLOR:
[000ae95e]                           dc.w $0003
[000ae960]                           dc.w $ffff
[000ae962]                           dc.w $ffff
[000ae964]                           dc.w $0018
[000ae966]                           dc.w $0001
[000ae968]                           dc.w $0000
[000ae96a] 000ae604                  dc.l PICCOLOR01
[000ae96e]                           dc.w $0004
[000ae970]                           dc.w $0000
[000ae972]                           dc.w $0004
[000ae974]                           dc.w $0001
_03_COLOR:
[000ae976]                           dc.w $0004
[000ae978]                           dc.w $ffff
[000ae97a]                           dc.w $ffff
[000ae97c]                           dc.w $0018
[000ae97e]                           dc.w $0001
[000ae980]                           dc.w $0000
[000ae982] 000ae604                  dc.l PICCOLOR01
[000ae986]                           dc.w $0008
[000ae988]                           dc.w $0000
[000ae98a]                           dc.w $0004
[000ae98c]                           dc.w $0001
_04_COLOR:
[000ae98e]                           dc.w $0005
[000ae990]                           dc.w $ffff
[000ae992]                           dc.w $ffff
[000ae994]                           dc.w $0018
[000ae996]                           dc.w $0001
[000ae998]                           dc.w $0000
[000ae99a] 000ae604                  dc.l PICCOLOR01
[000ae99e]                           dc.w $000c
[000ae9a0]                           dc.w $0000
[000ae9a2]                           dc.w $0004
[000ae9a4]                           dc.w $0001
_05_COLOR:
[000ae9a6]                           dc.w $0006
[000ae9a8]                           dc.w $ffff
[000ae9aa]                           dc.w $ffff
[000ae9ac]                           dc.w $0018
[000ae9ae]                           dc.w $0001
[000ae9b0]                           dc.w $0000
[000ae9b2] 000ae604                  dc.l PICCOLOR01
[000ae9b6]                           dc.w $0000
[000ae9b8]                           dc.w $0001
[000ae9ba]                           dc.w $0004
[000ae9bc]                           dc.w $0001
_06_COLOR:
[000ae9be]                           dc.w $0007
[000ae9c0]                           dc.w $ffff
[000ae9c2]                           dc.w $ffff
[000ae9c4]                           dc.w $0018
[000ae9c6]                           dc.w $0001
[000ae9c8]                           dc.w $0000
[000ae9ca] 000ae604                  dc.l PICCOLOR01
[000ae9ce]                           dc.w $0004
[000ae9d0]                           dc.w $0001
[000ae9d2]                           dc.w $0004
[000ae9d4]                           dc.w $0001
_07_COLOR:
[000ae9d6]                           dc.w $0008
[000ae9d8]                           dc.w $ffff
[000ae9da]                           dc.w $ffff
[000ae9dc]                           dc.w $0018
[000ae9de]                           dc.w $0001
[000ae9e0]                           dc.w $0000
[000ae9e2] 000ae604                  dc.l PICCOLOR01
[000ae9e6]                           dc.w $0008
[000ae9e8]                           dc.w $0001
[000ae9ea]                           dc.w $0004
[000ae9ec]                           dc.w $0001
_08_COLOR:
[000ae9ee]                           dc.w $0009
[000ae9f0]                           dc.w $ffff
[000ae9f2]                           dc.w $ffff
[000ae9f4]                           dc.w $0018
[000ae9f6]                           dc.w $0001
[000ae9f8]                           dc.w $0000
[000ae9fa] 000ae604                  dc.l PICCOLOR01
[000ae9fe]                           dc.w $000c
[000aea00]                           dc.w $0001
[000aea02]                           dc.w $0004
[000aea04]                           dc.w $0001
_09_COLOR:
[000aea06]                           dc.w $000a
[000aea08]                           dc.w $ffff
[000aea0a]                           dc.w $ffff
[000aea0c]                           dc.w $0018
[000aea0e]                           dc.w $0001
[000aea10]                           dc.w $0000
[000aea12] 000ae604                  dc.l PICCOLOR01
[000aea16]                           dc.w $0000
[000aea18]                           dc.w $0002
[000aea1a]                           dc.w $0004
[000aea1c]                           dc.w $0001
_10_COLOR:
[000aea1e]                           dc.w $000b
[000aea20]                           dc.w $ffff
[000aea22]                           dc.w $ffff
[000aea24]                           dc.w $0018
[000aea26]                           dc.w $0001
[000aea28]                           dc.w $0000
[000aea2a] 000ae604                  dc.l PICCOLOR01
[000aea2e]                           dc.w $0004
[000aea30]                           dc.w $0002
[000aea32]                           dc.w $0004
[000aea34]                           dc.w $0001
_11_COLOR:
[000aea36]                           dc.w $000c
[000aea38]                           dc.w $ffff
[000aea3a]                           dc.w $ffff
[000aea3c]                           dc.w $0018
[000aea3e]                           dc.w $0001
[000aea40]                           dc.w $0000
[000aea42] 000ae604                  dc.l PICCOLOR01
[000aea46]                           dc.w $0008
[000aea48]                           dc.w $0002
[000aea4a]                           dc.w $0004
[000aea4c]                           dc.w $0001
_12_COLOR:
[000aea4e]                           dc.w $000d
[000aea50]                           dc.w $ffff
[000aea52]                           dc.w $ffff
[000aea54]                           dc.w $0018
[000aea56]                           dc.w $0001
[000aea58]                           dc.w $0000
[000aea5a] 000ae604                  dc.l PICCOLOR01
[000aea5e]                           dc.w $000c
[000aea60]                           dc.w $0002
[000aea62]                           dc.w $0004
[000aea64]                           dc.w $0001
_13_COLOR:
[000aea66]                           dc.w $000e
[000aea68]                           dc.w $ffff
[000aea6a]                           dc.w $ffff
[000aea6c]                           dc.w $0018
[000aea6e]                           dc.w $0001
[000aea70]                           dc.w $0000
[000aea72] 000ae604                  dc.l PICCOLOR01
[000aea76]                           dc.w $0000
[000aea78]                           dc.w $0003
[000aea7a]                           dc.w $0004
[000aea7c]                           dc.w $0001
_14_COLOR:
[000aea7e]                           dc.w $000f
[000aea80]                           dc.w $ffff
[000aea82]                           dc.w $ffff
[000aea84]                           dc.w $0018
[000aea86]                           dc.w $0001
[000aea88]                           dc.w $0000
[000aea8a] 000ae604                  dc.l PICCOLOR01
[000aea8e]                           dc.w $0004
[000aea90]                           dc.w $0003
[000aea92]                           dc.w $0004
[000aea94]                           dc.w $0001
_15_COLOR:
[000aea96]                           dc.w $0010
[000aea98]                           dc.w $ffff
[000aea9a]                           dc.w $ffff
[000aea9c]                           dc.w $0018
[000aea9e]                           dc.w $0001
[000aeaa0]                           dc.w $0000
[000aeaa2] 000ae604                  dc.l PICCOLOR01
[000aeaa6]                           dc.w $0008
[000aeaa8]                           dc.w $0003
[000aeaaa]                           dc.w $0004
[000aeaac]                           dc.w $0001
_16_COLOR:
[000aeaae]                           dc.w $0000
[000aeab0]                           dc.w $ffff
[000aeab2]                           dc.w $ffff
[000aeab4]                           dc.w $0018
[000aeab6]                           dc.w $0021
[000aeab8]                           dc.w $0000
[000aeaba] 000ae604                  dc.l PICCOLOR01
[000aeabe]                           dc.w $000c
[000aeac0]                           dc.w $0003
[000aeac2]                           dc.w $0004
[000aeac4]                           dc.w $0001
COLOR256:
[000aeac6]                           dc.w $ffff
[000aeac8]                           dc.w $0001
[000aeaca]                           dc.w $0100
[000aeacc]                           dc.w $0014
[000aeace]                           dc.w $0000
[000aead0]                           dc.w $0020
[000aead2]                           dc.w $00ff
[000aead4]                           dc.w $1100
[000aead6]                           dc.w $0000
[000aead8]                           dc.w $0000
[000aeada]                           dc.w $0020
[000aeadc]                           dc.w $0010
_01_COLOR256:
[000aeade]                           dc.w $0002
[000aeae0]                           dc.w $ffff
[000aeae2]                           dc.w $ffff
[000aeae4]                           dc.w $0018
[000aeae6]                           dc.w $0001
[000aeae8]                           dc.w $0000
[000aeaea] 000ae604                  dc.l PICCOLOR01
[000aeaee]                           dc.w $0000
[000aeaf0]                           dc.w $0000
[000aeaf2]                           dc.w $0002
[000aeaf4]                           dc.w $0001
_02_COLOR256:
[000aeaf6]                           dc.w $0003
[000aeaf8]                           dc.w $ffff
[000aeafa]                           dc.w $ffff
[000aeafc]                           dc.w $0018
[000aeafe]                           dc.w $0001
[000aeb00]                           dc.w $0000
[000aeb02] 000ae604                  dc.l PICCOLOR01
[000aeb06]                           dc.w $0002
[000aeb08]                           dc.w $0000
[000aeb0a]                           dc.w $0002
[000aeb0c]                           dc.w $0001
_03_COLOR256:
[000aeb0e]                           dc.w $0004
[000aeb10]                           dc.w $ffff
[000aeb12]                           dc.w $ffff
[000aeb14]                           dc.w $0018
[000aeb16]                           dc.w $0001
[000aeb18]                           dc.w $0000
[000aeb1a] 000ae604                  dc.l PICCOLOR01
[000aeb1e]                           dc.w $0004
[000aeb20]                           dc.w $0000
[000aeb22]                           dc.w $0002
[000aeb24]                           dc.w $0001
_04_COLOR256:
[000aeb26]                           dc.w $0005
[000aeb28]                           dc.w $ffff
[000aeb2a]                           dc.w $ffff
[000aeb2c]                           dc.w $0018
[000aeb2e]                           dc.w $0001
[000aeb30]                           dc.w $0000
[000aeb32] 000ae604                  dc.l PICCOLOR01
[000aeb36]                           dc.w $0006
[000aeb38]                           dc.w $0000
[000aeb3a]                           dc.w $0002
[000aeb3c]                           dc.w $0001
_05_COLOR256:
[000aeb3e]                           dc.w $0006
[000aeb40]                           dc.w $ffff
[000aeb42]                           dc.w $ffff
[000aeb44]                           dc.w $0018
[000aeb46]                           dc.w $0001
[000aeb48]                           dc.w $0000
[000aeb4a] 000ae604                  dc.l PICCOLOR01
[000aeb4e]                           dc.w $0008
[000aeb50]                           dc.w $0000
[000aeb52]                           dc.w $0002
[000aeb54]                           dc.w $0001
_06_COLOR256:
[000aeb56]                           dc.w $0007
[000aeb58]                           dc.w $ffff
[000aeb5a]                           dc.w $ffff
[000aeb5c]                           dc.w $0018
[000aeb5e]                           dc.w $0001
[000aeb60]                           dc.w $0000
[000aeb62] 000ae604                  dc.l PICCOLOR01
[000aeb66]                           dc.w $000a
[000aeb68]                           dc.w $0000
[000aeb6a]                           dc.w $0002
[000aeb6c]                           dc.w $0001
_07_COLOR256:
[000aeb6e]                           dc.w $0008
[000aeb70]                           dc.w $ffff
[000aeb72]                           dc.w $ffff
[000aeb74]                           dc.w $0018
[000aeb76]                           dc.w $0001
[000aeb78]                           dc.w $0000
[000aeb7a] 000ae604                  dc.l PICCOLOR01
[000aeb7e]                           dc.w $000c
[000aeb80]                           dc.w $0000
[000aeb82]                           dc.w $0002
[000aeb84]                           dc.w $0001
_08_COLOR256:
[000aeb86]                           dc.w $0009
[000aeb88]                           dc.w $ffff
[000aeb8a]                           dc.w $ffff
[000aeb8c]                           dc.w $0018
[000aeb8e]                           dc.w $0001
[000aeb90]                           dc.w $0000
[000aeb92] 000ae604                  dc.l PICCOLOR01
[000aeb96]                           dc.w $000e
[000aeb98]                           dc.w $0000
[000aeb9a]                           dc.w $0002
[000aeb9c]                           dc.w $0001
_09_COLOR256:
[000aeb9e]                           dc.w $000a
[000aeba0]                           dc.w $ffff
[000aeba2]                           dc.w $ffff
[000aeba4]                           dc.w $0018
[000aeba6]                           dc.w $0001
[000aeba8]                           dc.w $0000
[000aebaa] 000ae604                  dc.l PICCOLOR01
[000aebae]                           dc.w $0010
[000aebb0]                           dc.w $0000
[000aebb2]                           dc.w $0002
[000aebb4]                           dc.w $0001
_10_COLOR256:
[000aebb6]                           dc.w $000b
[000aebb8]                           dc.w $ffff
[000aebba]                           dc.w $ffff
[000aebbc]                           dc.w $0018
[000aebbe]                           dc.w $0001
[000aebc0]                           dc.w $0000
[000aebc2] 000ae604                  dc.l PICCOLOR01
[000aebc6]                           dc.w $0012
[000aebc8]                           dc.w $0000
[000aebca]                           dc.w $0002
[000aebcc]                           dc.w $0001
_11_COLOR256:
[000aebce]                           dc.w $000c
[000aebd0]                           dc.w $ffff
[000aebd2]                           dc.w $ffff
[000aebd4]                           dc.w $0018
[000aebd6]                           dc.w $0001
[000aebd8]                           dc.w $0000
[000aebda] 000ae604                  dc.l PICCOLOR01
[000aebde]                           dc.w $0014
[000aebe0]                           dc.w $0000
[000aebe2]                           dc.w $0002
[000aebe4]                           dc.w $0001
_12_COLOR256:
[000aebe6]                           dc.w $000d
[000aebe8]                           dc.w $ffff
[000aebea]                           dc.w $ffff
[000aebec]                           dc.w $0018
[000aebee]                           dc.w $0001
[000aebf0]                           dc.w $0000
[000aebf2] 000ae604                  dc.l PICCOLOR01
[000aebf6]                           dc.w $0016
[000aebf8]                           dc.w $0000
[000aebfa]                           dc.w $0002
[000aebfc]                           dc.w $0001
_13_COLOR256:
[000aebfe]                           dc.w $000e
[000aec00]                           dc.w $ffff
[000aec02]                           dc.w $ffff
[000aec04]                           dc.w $0018
[000aec06]                           dc.w $0001
[000aec08]                           dc.w $0000
[000aec0a] 000ae604                  dc.l PICCOLOR01
[000aec0e]                           dc.w $0018
[000aec10]                           dc.w $0000
[000aec12]                           dc.w $0002
[000aec14]                           dc.w $0001
_14_COLOR256:
[000aec16]                           dc.w $000f
[000aec18]                           dc.w $ffff
[000aec1a]                           dc.w $ffff
[000aec1c]                           dc.w $0018
[000aec1e]                           dc.w $0001
[000aec20]                           dc.w $0000
[000aec22] 000ae604                  dc.l PICCOLOR01
[000aec26]                           dc.w $001a
[000aec28]                           dc.w $0000
[000aec2a]                           dc.w $0002
[000aec2c]                           dc.w $0001
_15_COLOR256:
[000aec2e]                           dc.w $0010
[000aec30]                           dc.w $ffff
[000aec32]                           dc.w $ffff
[000aec34]                           dc.w $0018
[000aec36]                           dc.w $0001
[000aec38]                           dc.w $0000
[000aec3a] 000ae604                  dc.l PICCOLOR01
[000aec3e]                           dc.w $001c
[000aec40]                           dc.w $0000
[000aec42]                           dc.w $0002
[000aec44]                           dc.w $0001
_16_COLOR256:
[000aec46]                           dc.w $0011
[000aec48]                           dc.w $ffff
[000aec4a]                           dc.w $ffff
[000aec4c]                           dc.w $0018
[000aec4e]                           dc.w $0001
[000aec50]                           dc.w $0000
[000aec52] 000ae604                  dc.l PICCOLOR01
[000aec56]                           dc.w $001e
[000aec58]                           dc.w $0000
[000aec5a]                           dc.w $0002
[000aec5c]                           dc.w $0001
_17_COLOR256:
[000aec5e]                           dc.w $0012
[000aec60]                           dc.w $ffff
[000aec62]                           dc.w $ffff
[000aec64]                           dc.w $0018
[000aec66]                           dc.w $0001
[000aec68]                           dc.w $0000
[000aec6a] 000ae604                  dc.l PICCOLOR01
[000aec6e]                           dc.w $0000
[000aec70]                           dc.w $0001
[000aec72]                           dc.w $0002
[000aec74]                           dc.w $0001
_18_COLOR256:
[000aec76]                           dc.w $0013
[000aec78]                           dc.w $ffff
[000aec7a]                           dc.w $ffff
[000aec7c]                           dc.w $0018
[000aec7e]                           dc.w $0001
[000aec80]                           dc.w $0000
[000aec82] 000ae604                  dc.l PICCOLOR01
[000aec86]                           dc.w $0002
[000aec88]                           dc.w $0001
[000aec8a]                           dc.w $0002
[000aec8c]                           dc.w $0001
_19_COLOR256:
[000aec8e]                           dc.w $0014
[000aec90]                           dc.w $ffff
[000aec92]                           dc.w $ffff
[000aec94]                           dc.w $0018
[000aec96]                           dc.w $0001
[000aec98]                           dc.w $0000
[000aec9a] 000ae604                  dc.l PICCOLOR01
[000aec9e]                           dc.w $0004
[000aeca0]                           dc.w $0001
[000aeca2]                           dc.w $0002
[000aeca4]                           dc.w $0001
_20_COLOR256:
[000aeca6]                           dc.w $0015
[000aeca8]                           dc.w $ffff
[000aecaa]                           dc.w $ffff
[000aecac]                           dc.w $0018
[000aecae]                           dc.w $0001
[000aecb0]                           dc.w $0000
[000aecb2] 000ae604                  dc.l PICCOLOR01
[000aecb6]                           dc.w $0006
[000aecb8]                           dc.w $0001
[000aecba]                           dc.w $0002
[000aecbc]                           dc.w $0001
_21_COLOR256:
[000aecbe]                           dc.w $0016
[000aecc0]                           dc.w $ffff
[000aecc2]                           dc.w $ffff
[000aecc4]                           dc.w $0018
[000aecc6]                           dc.w $0001
[000aecc8]                           dc.w $0000
[000aecca] 000ae604                  dc.l PICCOLOR01
[000aecce]                           dc.w $0008
[000aecd0]                           dc.w $0001
[000aecd2]                           dc.w $0002
[000aecd4]                           dc.w $0001
_22_COLOR256:
[000aecd6]                           dc.w $0017
[000aecd8]                           dc.w $ffff
[000aecda]                           dc.w $ffff
[000aecdc]                           dc.w $0018
[000aecde]                           dc.w $0001
[000aece0]                           dc.w $0000
[000aece2] 000ae604                  dc.l PICCOLOR01
[000aece6]                           dc.w $000a
[000aece8]                           dc.w $0001
[000aecea]                           dc.w $0002
[000aecec]                           dc.w $0001
_23_COLOR256:
[000aecee]                           dc.w $0018
[000aecf0]                           dc.w $ffff
[000aecf2]                           dc.w $ffff
[000aecf4]                           dc.w $0018
[000aecf6]                           dc.w $0001
[000aecf8]                           dc.w $0000
[000aecfa] 000ae604                  dc.l PICCOLOR01
[000aecfe]                           dc.w $000c
[000aed00]                           dc.w $0001
[000aed02]                           dc.w $0002
[000aed04]                           dc.w $0001
_24_COLOR256:
[000aed06]                           dc.w $0019
[000aed08]                           dc.w $ffff
[000aed0a]                           dc.w $ffff
[000aed0c]                           dc.w $0018
[000aed0e]                           dc.w $0001
[000aed10]                           dc.w $0000
[000aed12] 000ae604                  dc.l PICCOLOR01
[000aed16]                           dc.w $000e
[000aed18]                           dc.w $0001
[000aed1a]                           dc.w $0002
[000aed1c]                           dc.w $0001
_25_COLOR256:
[000aed1e]                           dc.w $001a
[000aed20]                           dc.w $ffff
[000aed22]                           dc.w $ffff
[000aed24]                           dc.w $0018
[000aed26]                           dc.w $0001
[000aed28]                           dc.w $0000
[000aed2a] 000ae604                  dc.l PICCOLOR01
[000aed2e]                           dc.w $0010
[000aed30]                           dc.w $0001
[000aed32]                           dc.w $0002
[000aed34]                           dc.w $0001
_26_COLOR256:
[000aed36]                           dc.w $001b
[000aed38]                           dc.w $ffff
[000aed3a]                           dc.w $ffff
[000aed3c]                           dc.w $0018
[000aed3e]                           dc.w $0001
[000aed40]                           dc.w $0000
[000aed42] 000ae604                  dc.l PICCOLOR01
[000aed46]                           dc.w $0012
[000aed48]                           dc.w $0001
[000aed4a]                           dc.w $0002
[000aed4c]                           dc.w $0001
_27_COLOR256:
[000aed4e]                           dc.w $001c
[000aed50]                           dc.w $ffff
[000aed52]                           dc.w $ffff
[000aed54]                           dc.w $0018
[000aed56]                           dc.w $0001
[000aed58]                           dc.w $0000
[000aed5a] 000ae604                  dc.l PICCOLOR01
[000aed5e]                           dc.w $0014
[000aed60]                           dc.w $0001
[000aed62]                           dc.w $0002
[000aed64]                           dc.w $0001
_28_COLOR256:
[000aed66]                           dc.w $001d
[000aed68]                           dc.w $ffff
[000aed6a]                           dc.w $ffff
[000aed6c]                           dc.w $0018
[000aed6e]                           dc.w $0001
[000aed70]                           dc.w $0000
[000aed72] 000ae604                  dc.l PICCOLOR01
[000aed76]                           dc.w $0016
[000aed78]                           dc.w $0001
[000aed7a]                           dc.w $0002
[000aed7c]                           dc.w $0001
_29_COLOR256:
[000aed7e]                           dc.w $001e
[000aed80]                           dc.w $ffff
[000aed82]                           dc.w $ffff
[000aed84]                           dc.w $0018
[000aed86]                           dc.w $0001
[000aed88]                           dc.w $0000
[000aed8a] 000ae604                  dc.l PICCOLOR01
[000aed8e]                           dc.w $0018
[000aed90]                           dc.w $0001
[000aed92]                           dc.w $0002
[000aed94]                           dc.w $0001
_30_COLOR256:
[000aed96]                           dc.w $001f
[000aed98]                           dc.w $ffff
[000aed9a]                           dc.w $ffff
[000aed9c]                           dc.w $0018
[000aed9e]                           dc.w $0001
[000aeda0]                           dc.w $0000
[000aeda2] 000ae604                  dc.l PICCOLOR01
[000aeda6]                           dc.w $001a
[000aeda8]                           dc.w $0001
[000aedaa]                           dc.w $0002
[000aedac]                           dc.w $0001
_31_COLOR256:
[000aedae]                           dc.w $0020
[000aedb0]                           dc.w $ffff
[000aedb2]                           dc.w $ffff
[000aedb4]                           dc.w $0018
[000aedb6]                           dc.w $0001
[000aedb8]                           dc.w $0000
[000aedba] 000ae604                  dc.l PICCOLOR01
[000aedbe]                           dc.w $001c
[000aedc0]                           dc.w $0001
[000aedc2]                           dc.w $0002
[000aedc4]                           dc.w $0001
_32_COLOR256:
[000aedc6]                           dc.w $0021
[000aedc8]                           dc.w $ffff
[000aedca]                           dc.w $ffff
[000aedcc]                           dc.w $0018
[000aedce]                           dc.w $0001
[000aedd0]                           dc.w $0000
[000aedd2] 000ae604                  dc.l PICCOLOR01
[000aedd6]                           dc.w $001e
[000aedd8]                           dc.w $0001
[000aedda]                           dc.w $0002
[000aeddc]                           dc.w $0001
_33_COLOR256:
[000aedde]                           dc.w $0022
[000aede0]                           dc.w $ffff
[000aede2]                           dc.w $ffff
[000aede4]                           dc.w $0018
[000aede6]                           dc.w $0001
[000aede8]                           dc.w $0000
[000aedea] 000ae604                  dc.l PICCOLOR01
[000aedee]                           dc.w $0000
[000aedf0]                           dc.w $0002
[000aedf2]                           dc.w $0002
[000aedf4]                           dc.w $0001
_34_COLOR256:
[000aedf6]                           dc.w $0023
[000aedf8]                           dc.w $ffff
[000aedfa]                           dc.w $ffff
[000aedfc]                           dc.w $0018
[000aedfe]                           dc.w $0001
[000aee00]                           dc.w $0000
[000aee02] 000ae604                  dc.l PICCOLOR01
[000aee06]                           dc.w $0002
[000aee08]                           dc.w $0002
[000aee0a]                           dc.w $0002
[000aee0c]                           dc.w $0001
_35_COLOR256:
[000aee0e]                           dc.w $0024
[000aee10]                           dc.w $ffff
[000aee12]                           dc.w $ffff
[000aee14]                           dc.w $0018
[000aee16]                           dc.w $0001
[000aee18]                           dc.w $0000
[000aee1a] 000ae604                  dc.l PICCOLOR01
[000aee1e]                           dc.w $0004
[000aee20]                           dc.w $0002
[000aee22]                           dc.w $0002
[000aee24]                           dc.w $0001
_36_COLOR256:
[000aee26]                           dc.w $0025
[000aee28]                           dc.w $ffff
[000aee2a]                           dc.w $ffff
[000aee2c]                           dc.w $0018
[000aee2e]                           dc.w $0001
[000aee30]                           dc.w $0000
[000aee32] 000ae604                  dc.l PICCOLOR01
[000aee36]                           dc.w $0006
[000aee38]                           dc.w $0002
[000aee3a]                           dc.w $0002
[000aee3c]                           dc.w $0001
_37_COLOR256:
[000aee3e]                           dc.w $0026
[000aee40]                           dc.w $ffff
[000aee42]                           dc.w $ffff
[000aee44]                           dc.w $0018
[000aee46]                           dc.w $0001
[000aee48]                           dc.w $0000
[000aee4a] 000ae604                  dc.l PICCOLOR01
[000aee4e]                           dc.w $0008
[000aee50]                           dc.w $0002
[000aee52]                           dc.w $0002
[000aee54]                           dc.w $0001
_38_COLOR256:
[000aee56]                           dc.w $0027
[000aee58]                           dc.w $ffff
[000aee5a]                           dc.w $ffff
[000aee5c]                           dc.w $0018
[000aee5e]                           dc.w $0001
[000aee60]                           dc.w $0000
[000aee62] 000ae604                  dc.l PICCOLOR01
[000aee66]                           dc.w $000a
[000aee68]                           dc.w $0002
[000aee6a]                           dc.w $0002
[000aee6c]                           dc.w $0001
_39_COLOR256:
[000aee6e]                           dc.w $0028
[000aee70]                           dc.w $ffff
[000aee72]                           dc.w $ffff
[000aee74]                           dc.w $0018
[000aee76]                           dc.w $0001
[000aee78]                           dc.w $0000
[000aee7a] 000ae604                  dc.l PICCOLOR01
[000aee7e]                           dc.w $000c
[000aee80]                           dc.w $0002
[000aee82]                           dc.w $0002
[000aee84]                           dc.w $0001
_40_COLOR256:
[000aee86]                           dc.w $0029
[000aee88]                           dc.w $ffff
[000aee8a]                           dc.w $ffff
[000aee8c]                           dc.w $0018
[000aee8e]                           dc.w $0001
[000aee90]                           dc.w $0000
[000aee92] 000ae604                  dc.l PICCOLOR01
[000aee96]                           dc.w $000e
[000aee98]                           dc.w $0002
[000aee9a]                           dc.w $0002
[000aee9c]                           dc.w $0001
_41_COLOR256:
[000aee9e]                           dc.w $002a
[000aeea0]                           dc.w $ffff
[000aeea2]                           dc.w $ffff
[000aeea4]                           dc.w $0018
[000aeea6]                           dc.w $0001
[000aeea8]                           dc.w $0000
[000aeeaa] 000ae604                  dc.l PICCOLOR01
[000aeeae]                           dc.w $0010
[000aeeb0]                           dc.w $0002
[000aeeb2]                           dc.w $0002
[000aeeb4]                           dc.w $0001
_42_COLOR256:
[000aeeb6]                           dc.w $002b
[000aeeb8]                           dc.w $ffff
[000aeeba]                           dc.w $ffff
[000aeebc]                           dc.w $0018
[000aeebe]                           dc.w $0001
[000aeec0]                           dc.w $0000
[000aeec2] 000ae604                  dc.l PICCOLOR01
[000aeec6]                           dc.w $0012
[000aeec8]                           dc.w $0002
[000aeeca]                           dc.w $0002
[000aeecc]                           dc.w $0001
_43_COLOR256:
[000aeece]                           dc.w $002c
[000aeed0]                           dc.w $ffff
[000aeed2]                           dc.w $ffff
[000aeed4]                           dc.w $0018
[000aeed6]                           dc.w $0001
[000aeed8]                           dc.w $0000
[000aeeda] 000ae604                  dc.l PICCOLOR01
[000aeede]                           dc.w $0014
[000aeee0]                           dc.w $0002
[000aeee2]                           dc.w $0002
[000aeee4]                           dc.w $0001
_44_COLOR256:
[000aeee6]                           dc.w $002d
[000aeee8]                           dc.w $ffff
[000aeeea]                           dc.w $ffff
[000aeeec]                           dc.w $0018
[000aeeee]                           dc.w $0001
[000aeef0]                           dc.w $0000
[000aeef2] 000ae604                  dc.l PICCOLOR01
[000aeef6]                           dc.w $0016
[000aeef8]                           dc.w $0002
[000aeefa]                           dc.w $0002
[000aeefc]                           dc.w $0001
_45_COLOR256:
[000aeefe]                           dc.w $002e
[000aef00]                           dc.w $ffff
[000aef02]                           dc.w $ffff
[000aef04]                           dc.w $0018
[000aef06]                           dc.w $0001
[000aef08]                           dc.w $0000
[000aef0a] 000ae604                  dc.l PICCOLOR01
[000aef0e]                           dc.w $0018
[000aef10]                           dc.w $0002
[000aef12]                           dc.w $0002
[000aef14]                           dc.w $0001
_46_COLOR256:
[000aef16]                           dc.w $002f
[000aef18]                           dc.w $ffff
[000aef1a]                           dc.w $ffff
[000aef1c]                           dc.w $0018
[000aef1e]                           dc.w $0001
[000aef20]                           dc.w $0000
[000aef22] 000ae604                  dc.l PICCOLOR01
[000aef26]                           dc.w $001a
[000aef28]                           dc.w $0002
[000aef2a]                           dc.w $0002
[000aef2c]                           dc.w $0001
_47_COLOR256:
[000aef2e]                           dc.w $0030
[000aef30]                           dc.w $ffff
[000aef32]                           dc.w $ffff
[000aef34]                           dc.w $0018
[000aef36]                           dc.w $0001
[000aef38]                           dc.w $0000
[000aef3a] 000ae604                  dc.l PICCOLOR01
[000aef3e]                           dc.w $001c
[000aef40]                           dc.w $0002
[000aef42]                           dc.w $0002
[000aef44]                           dc.w $0001
_48_COLOR256:
[000aef46]                           dc.w $0031
[000aef48]                           dc.w $ffff
[000aef4a]                           dc.w $ffff
[000aef4c]                           dc.w $0018
[000aef4e]                           dc.w $0001
[000aef50]                           dc.w $0000
[000aef52] 000ae604                  dc.l PICCOLOR01
[000aef56]                           dc.w $001e
[000aef58]                           dc.w $0002
[000aef5a]                           dc.w $0002
[000aef5c]                           dc.w $0001
_49_COLOR256:
[000aef5e]                           dc.w $0032
[000aef60]                           dc.w $ffff
[000aef62]                           dc.w $ffff
[000aef64]                           dc.w $0018
[000aef66]                           dc.w $0001
[000aef68]                           dc.w $0000
[000aef6a] 000ae604                  dc.l PICCOLOR01
[000aef6e]                           dc.w $0000
[000aef70]                           dc.w $0003
[000aef72]                           dc.w $0002
[000aef74]                           dc.w $0001
_50_COLOR256:
[000aef76]                           dc.w $0033
[000aef78]                           dc.w $ffff
[000aef7a]                           dc.w $ffff
[000aef7c]                           dc.w $0018
[000aef7e]                           dc.w $0001
[000aef80]                           dc.w $0000
[000aef82] 000ae604                  dc.l PICCOLOR01
[000aef86]                           dc.w $0002
[000aef88]                           dc.w $0003
[000aef8a]                           dc.w $0002
[000aef8c]                           dc.w $0001
_51_COLOR256:
[000aef8e]                           dc.w $0034
[000aef90]                           dc.w $ffff
[000aef92]                           dc.w $ffff
[000aef94]                           dc.w $0018
[000aef96]                           dc.w $0001
[000aef98]                           dc.w $0000
[000aef9a] 000ae604                  dc.l PICCOLOR01
[000aef9e]                           dc.w $0004
[000aefa0]                           dc.w $0003
[000aefa2]                           dc.w $0002
[000aefa4]                           dc.w $0001
_52_COLOR256:
[000aefa6]                           dc.w $0035
[000aefa8]                           dc.w $ffff
[000aefaa]                           dc.w $ffff
[000aefac]                           dc.w $0018
[000aefae]                           dc.w $0001
[000aefb0]                           dc.w $0000
[000aefb2] 000ae604                  dc.l PICCOLOR01
[000aefb6]                           dc.w $0006
[000aefb8]                           dc.w $0003
[000aefba]                           dc.w $0002
[000aefbc]                           dc.w $0001
_53_COLOR256:
[000aefbe]                           dc.w $0036
[000aefc0]                           dc.w $ffff
[000aefc2]                           dc.w $ffff
[000aefc4]                           dc.w $0018
[000aefc6]                           dc.w $0001
[000aefc8]                           dc.w $0000
[000aefca] 000ae604                  dc.l PICCOLOR01
[000aefce]                           dc.w $0008
[000aefd0]                           dc.w $0003
[000aefd2]                           dc.w $0002
[000aefd4]                           dc.w $0001
_54_COLOR256:
[000aefd6]                           dc.w $0037
[000aefd8]                           dc.w $ffff
[000aefda]                           dc.w $ffff
[000aefdc]                           dc.w $0018
[000aefde]                           dc.w $0001
[000aefe0]                           dc.w $0000
[000aefe2] 000ae604                  dc.l PICCOLOR01
[000aefe6]                           dc.w $000a
[000aefe8]                           dc.w $0003
[000aefea]                           dc.w $0002
[000aefec]                           dc.w $0001
_55_COLOR256:
[000aefee]                           dc.w $0038
[000aeff0]                           dc.w $ffff
[000aeff2]                           dc.w $ffff
[000aeff4]                           dc.w $0018
[000aeff6]                           dc.w $0001
[000aeff8]                           dc.w $0000
[000aeffa] 000ae604                  dc.l PICCOLOR01
[000aeffe]                           dc.w $000c
[000af000]                           dc.w $0003
[000af002]                           dc.w $0002
[000af004]                           dc.w $0001
_56_COLOR256:
[000af006]                           dc.w $0039
[000af008]                           dc.w $ffff
[000af00a]                           dc.w $ffff
[000af00c]                           dc.w $0018
[000af00e]                           dc.w $0001
[000af010]                           dc.w $0000
[000af012] 000ae604                  dc.l PICCOLOR01
[000af016]                           dc.w $000e
[000af018]                           dc.w $0003
[000af01a]                           dc.w $0002
[000af01c]                           dc.w $0001
_57_COLOR256:
[000af01e]                           dc.w $003a
[000af020]                           dc.w $ffff
[000af022]                           dc.w $ffff
[000af024]                           dc.w $0018
[000af026]                           dc.w $0001
[000af028]                           dc.w $0000
[000af02a] 000ae604                  dc.l PICCOLOR01
[000af02e]                           dc.w $0010
[000af030]                           dc.w $0003
[000af032]                           dc.w $0002
[000af034]                           dc.w $0001
_58_COLOR256:
[000af036]                           dc.w $003b
[000af038]                           dc.w $ffff
[000af03a]                           dc.w $ffff
[000af03c]                           dc.w $0018
[000af03e]                           dc.w $0001
[000af040]                           dc.w $0000
[000af042] 000ae604                  dc.l PICCOLOR01
[000af046]                           dc.w $0012
[000af048]                           dc.w $0003
[000af04a]                           dc.w $0002
[000af04c]                           dc.w $0001
_59_COLOR256:
[000af04e]                           dc.w $003c
[000af050]                           dc.w $ffff
[000af052]                           dc.w $ffff
[000af054]                           dc.w $0018
[000af056]                           dc.w $0001
[000af058]                           dc.w $0000
[000af05a] 000ae604                  dc.l PICCOLOR01
[000af05e]                           dc.w $0014
[000af060]                           dc.w $0003
[000af062]                           dc.w $0002
[000af064]                           dc.w $0001
_60_COLOR256:
[000af066]                           dc.w $003d
[000af068]                           dc.w $ffff
[000af06a]                           dc.w $ffff
[000af06c]                           dc.w $0018
[000af06e]                           dc.w $0001
[000af070]                           dc.w $0000
[000af072] 000ae604                  dc.l PICCOLOR01
[000af076]                           dc.w $0016
[000af078]                           dc.w $0003
[000af07a]                           dc.w $0002
[000af07c]                           dc.w $0001
_61_COLOR256:
[000af07e]                           dc.w $003e
[000af080]                           dc.w $ffff
[000af082]                           dc.w $ffff
[000af084]                           dc.w $0018
[000af086]                           dc.w $0001
[000af088]                           dc.w $0000
[000af08a] 000ae604                  dc.l PICCOLOR01
[000af08e]                           dc.w $0018
[000af090]                           dc.w $0003
[000af092]                           dc.w $0002
[000af094]                           dc.w $0001
_62_COLOR256:
[000af096]                           dc.w $003f
[000af098]                           dc.w $ffff
[000af09a]                           dc.w $ffff
[000af09c]                           dc.w $0018
[000af09e]                           dc.w $0001
[000af0a0]                           dc.w $0000
[000af0a2] 000ae604                  dc.l PICCOLOR01
[000af0a6]                           dc.w $001a
[000af0a8]                           dc.w $0003
[000af0aa]                           dc.w $0002
[000af0ac]                           dc.w $0001
_63_COLOR256:
[000af0ae]                           dc.w $0040
[000af0b0]                           dc.w $ffff
[000af0b2]                           dc.w $ffff
[000af0b4]                           dc.w $0018
[000af0b6]                           dc.w $0001
[000af0b8]                           dc.w $0000
[000af0ba] 000ae604                  dc.l PICCOLOR01
[000af0be]                           dc.w $001c
[000af0c0]                           dc.w $0003
[000af0c2]                           dc.w $0002
[000af0c4]                           dc.w $0001
_64_COLOR256:
[000af0c6]                           dc.w $0041
[000af0c8]                           dc.w $ffff
[000af0ca]                           dc.w $ffff
[000af0cc]                           dc.w $0018
[000af0ce]                           dc.w $0001
[000af0d0]                           dc.w $0000
[000af0d2] 000ae604                  dc.l PICCOLOR01
[000af0d6]                           dc.w $001e
[000af0d8]                           dc.w $0003
[000af0da]                           dc.w $0002
[000af0dc]                           dc.w $0001
_65_COLOR256:
[000af0de]                           dc.w $0042
[000af0e0]                           dc.w $ffff
[000af0e2]                           dc.w $ffff
[000af0e4]                           dc.w $0018
[000af0e6]                           dc.w $0001
[000af0e8]                           dc.w $0000
[000af0ea] 000ae604                  dc.l PICCOLOR01
[000af0ee]                           dc.w $0000
[000af0f0]                           dc.w $0004
[000af0f2]                           dc.w $0002
[000af0f4]                           dc.w $0001
_66_COLOR256:
[000af0f6]                           dc.w $0043
[000af0f8]                           dc.w $ffff
[000af0fa]                           dc.w $ffff
[000af0fc]                           dc.w $0018
[000af0fe]                           dc.w $0001
[000af100]                           dc.w $0000
[000af102] 000ae604                  dc.l PICCOLOR01
[000af106]                           dc.w $0002
[000af108]                           dc.w $0004
[000af10a]                           dc.w $0002
[000af10c]                           dc.w $0001
_67_COLOR256:
[000af10e]                           dc.w $0044
[000af110]                           dc.w $ffff
[000af112]                           dc.w $ffff
[000af114]                           dc.w $0018
[000af116]                           dc.w $0001
[000af118]                           dc.w $0000
[000af11a] 000ae604                  dc.l PICCOLOR01
[000af11e]                           dc.w $0004
[000af120]                           dc.w $0004
[000af122]                           dc.w $0002
[000af124]                           dc.w $0001
_68_COLOR256:
[000af126]                           dc.w $0045
[000af128]                           dc.w $ffff
[000af12a]                           dc.w $ffff
[000af12c]                           dc.w $0018
[000af12e]                           dc.w $0001
[000af130]                           dc.w $0000
[000af132] 000ae604                  dc.l PICCOLOR01
[000af136]                           dc.w $0006
[000af138]                           dc.w $0004
[000af13a]                           dc.w $0002
[000af13c]                           dc.w $0001
_69_COLOR256:
[000af13e]                           dc.w $0046
[000af140]                           dc.w $ffff
[000af142]                           dc.w $ffff
[000af144]                           dc.w $0018
[000af146]                           dc.w $0001
[000af148]                           dc.w $0000
[000af14a] 000ae604                  dc.l PICCOLOR01
[000af14e]                           dc.w $0008
[000af150]                           dc.w $0004
[000af152]                           dc.w $0002
[000af154]                           dc.w $0001
_70_COLOR256:
[000af156]                           dc.w $0047
[000af158]                           dc.w $ffff
[000af15a]                           dc.w $ffff
[000af15c]                           dc.w $0018
[000af15e]                           dc.w $0001
[000af160]                           dc.w $0000
[000af162] 000ae604                  dc.l PICCOLOR01
[000af166]                           dc.w $000a
[000af168]                           dc.w $0004
[000af16a]                           dc.w $0002
[000af16c]                           dc.w $0001
_71_COLOR256:
[000af16e]                           dc.w $0048
[000af170]                           dc.w $ffff
[000af172]                           dc.w $ffff
[000af174]                           dc.w $0018
[000af176]                           dc.w $0001
[000af178]                           dc.w $0000
[000af17a] 000ae604                  dc.l PICCOLOR01
[000af17e]                           dc.w $000c
[000af180]                           dc.w $0004
[000af182]                           dc.w $0002
[000af184]                           dc.w $0001
_72_COLOR256:
[000af186]                           dc.w $0049
[000af188]                           dc.w $ffff
[000af18a]                           dc.w $ffff
[000af18c]                           dc.w $0018
[000af18e]                           dc.w $0001
[000af190]                           dc.w $0000
[000af192] 000ae604                  dc.l PICCOLOR01
[000af196]                           dc.w $000e
[000af198]                           dc.w $0004
[000af19a]                           dc.w $0002
[000af19c]                           dc.w $0001
_73_COLOR256:
[000af19e]                           dc.w $004a
[000af1a0]                           dc.w $ffff
[000af1a2]                           dc.w $ffff
[000af1a4]                           dc.w $0018
[000af1a6]                           dc.w $0001
[000af1a8]                           dc.w $0000
[000af1aa] 000ae604                  dc.l PICCOLOR01
[000af1ae]                           dc.w $0010
[000af1b0]                           dc.w $0004
[000af1b2]                           dc.w $0002
[000af1b4]                           dc.w $0001
_74_COLOR256:
[000af1b6]                           dc.w $004b
[000af1b8]                           dc.w $ffff
[000af1ba]                           dc.w $ffff
[000af1bc]                           dc.w $0018
[000af1be]                           dc.w $0001
[000af1c0]                           dc.w $0000
[000af1c2] 000ae604                  dc.l PICCOLOR01
[000af1c6]                           dc.w $0012
[000af1c8]                           dc.w $0004
[000af1ca]                           dc.w $0002
[000af1cc]                           dc.w $0001
_75_COLOR256:
[000af1ce]                           dc.w $004c
[000af1d0]                           dc.w $ffff
[000af1d2]                           dc.w $ffff
[000af1d4]                           dc.w $0018
[000af1d6]                           dc.w $0001
[000af1d8]                           dc.w $0000
[000af1da] 000ae604                  dc.l PICCOLOR01
[000af1de]                           dc.w $0014
[000af1e0]                           dc.w $0004
[000af1e2]                           dc.w $0002
[000af1e4]                           dc.w $0001
_76_COLOR256:
[000af1e6]                           dc.w $004d
[000af1e8]                           dc.w $ffff
[000af1ea]                           dc.w $ffff
[000af1ec]                           dc.w $0018
[000af1ee]                           dc.w $0001
[000af1f0]                           dc.w $0000
[000af1f2] 000ae604                  dc.l PICCOLOR01
[000af1f6]                           dc.w $0016
[000af1f8]                           dc.w $0004
[000af1fa]                           dc.w $0002
[000af1fc]                           dc.w $0001
_77_COLOR256:
[000af1fe]                           dc.w $004e
[000af200]                           dc.w $ffff
[000af202]                           dc.w $ffff
[000af204]                           dc.w $0018
[000af206]                           dc.w $0001
[000af208]                           dc.w $0000
[000af20a] 000ae604                  dc.l PICCOLOR01
[000af20e]                           dc.w $0018
[000af210]                           dc.w $0004
[000af212]                           dc.w $0002
[000af214]                           dc.w $0001
_78_COLOR256:
[000af216]                           dc.w $004f
[000af218]                           dc.w $ffff
[000af21a]                           dc.w $ffff
[000af21c]                           dc.w $0018
[000af21e]                           dc.w $0001
[000af220]                           dc.w $0000
[000af222] 000ae604                  dc.l PICCOLOR01
[000af226]                           dc.w $001a
[000af228]                           dc.w $0004
[000af22a]                           dc.w $0002
[000af22c]                           dc.w $0001
_79_COLOR256:
[000af22e]                           dc.w $0050
[000af230]                           dc.w $ffff
[000af232]                           dc.w $ffff
[000af234]                           dc.w $0018
[000af236]                           dc.w $0001
[000af238]                           dc.w $0000
[000af23a] 000ae604                  dc.l PICCOLOR01
[000af23e]                           dc.w $001c
[000af240]                           dc.w $0004
[000af242]                           dc.w $0002
[000af244]                           dc.w $0001
_80_COLOR256:
[000af246]                           dc.w $0051
[000af248]                           dc.w $ffff
[000af24a]                           dc.w $ffff
[000af24c]                           dc.w $0018
[000af24e]                           dc.w $0001
[000af250]                           dc.w $0000
[000af252] 000ae604                  dc.l PICCOLOR01
[000af256]                           dc.w $001e
[000af258]                           dc.w $0004
[000af25a]                           dc.w $0002
[000af25c]                           dc.w $0001
_81_COLOR256:
[000af25e]                           dc.w $0052
[000af260]                           dc.w $ffff
[000af262]                           dc.w $ffff
[000af264]                           dc.w $0018
[000af266]                           dc.w $0001
[000af268]                           dc.w $0000
[000af26a] 000ae604                  dc.l PICCOLOR01
[000af26e]                           dc.w $0000
[000af270]                           dc.w $0005
[000af272]                           dc.w $0002
[000af274]                           dc.w $0001
_82_COLOR256:
[000af276]                           dc.w $0053
[000af278]                           dc.w $ffff
[000af27a]                           dc.w $ffff
[000af27c]                           dc.w $0018
[000af27e]                           dc.w $0001
[000af280]                           dc.w $0000
[000af282] 000ae604                  dc.l PICCOLOR01
[000af286]                           dc.w $0002
[000af288]                           dc.w $0005
[000af28a]                           dc.w $0002
[000af28c]                           dc.w $0001
_83_COLOR256:
[000af28e]                           dc.w $0054
[000af290]                           dc.w $ffff
[000af292]                           dc.w $ffff
[000af294]                           dc.w $0018
[000af296]                           dc.w $0001
[000af298]                           dc.w $0000
[000af29a] 000ae604                  dc.l PICCOLOR01
[000af29e]                           dc.w $0004
[000af2a0]                           dc.w $0005
[000af2a2]                           dc.w $0002
[000af2a4]                           dc.w $0001
_84_COLOR256:
[000af2a6]                           dc.w $0055
[000af2a8]                           dc.w $ffff
[000af2aa]                           dc.w $ffff
[000af2ac]                           dc.w $0018
[000af2ae]                           dc.w $0001
[000af2b0]                           dc.w $0000
[000af2b2] 000ae604                  dc.l PICCOLOR01
[000af2b6]                           dc.w $0006
[000af2b8]                           dc.w $0005
[000af2ba]                           dc.w $0002
[000af2bc]                           dc.w $0001
_85_COLOR256:
[000af2be]                           dc.w $0056
[000af2c0]                           dc.w $ffff
[000af2c2]                           dc.w $ffff
[000af2c4]                           dc.w $0018
[000af2c6]                           dc.w $0001
[000af2c8]                           dc.w $0000
[000af2ca] 000ae604                  dc.l PICCOLOR01
[000af2ce]                           dc.w $0008
[000af2d0]                           dc.w $0005
[000af2d2]                           dc.w $0002
[000af2d4]                           dc.w $0001
_86_COLOR256:
[000af2d6]                           dc.w $0057
[000af2d8]                           dc.w $ffff
[000af2da]                           dc.w $ffff
[000af2dc]                           dc.w $0018
[000af2de]                           dc.w $0001
[000af2e0]                           dc.w $0000
[000af2e2] 000ae604                  dc.l PICCOLOR01
[000af2e6]                           dc.w $000a
[000af2e8]                           dc.w $0005
[000af2ea]                           dc.w $0002
[000af2ec]                           dc.w $0001
_87_COLOR256:
[000af2ee]                           dc.w $0058
[000af2f0]                           dc.w $ffff
[000af2f2]                           dc.w $ffff
[000af2f4]                           dc.w $0018
[000af2f6]                           dc.w $0001
[000af2f8]                           dc.w $0000
[000af2fa] 000ae604                  dc.l PICCOLOR01
[000af2fe]                           dc.w $000c
[000af300]                           dc.w $0005
[000af302]                           dc.w $0002
[000af304]                           dc.w $0001
_88_COLOR256:
[000af306]                           dc.w $0059
[000af308]                           dc.w $ffff
[000af30a]                           dc.w $ffff
[000af30c]                           dc.w $0018
[000af30e]                           dc.w $0001
[000af310]                           dc.w $0000
[000af312] 000ae604                  dc.l PICCOLOR01
[000af316]                           dc.w $000e
[000af318]                           dc.w $0005
[000af31a]                           dc.w $0002
[000af31c]                           dc.w $0001
_89_COLOR256:
[000af31e]                           dc.w $005a
[000af320]                           dc.w $ffff
[000af322]                           dc.w $ffff
[000af324]                           dc.w $0018
[000af326]                           dc.w $0001
[000af328]                           dc.w $0000
[000af32a] 000ae604                  dc.l PICCOLOR01
[000af32e]                           dc.w $0010
[000af330]                           dc.w $0005
[000af332]                           dc.w $0002
[000af334]                           dc.w $0001
_90_COLOR256:
[000af336]                           dc.w $005b
[000af338]                           dc.w $ffff
[000af33a]                           dc.w $ffff
[000af33c]                           dc.w $0018
[000af33e]                           dc.w $0001
[000af340]                           dc.w $0000
[000af342] 000ae604                  dc.l PICCOLOR01
[000af346]                           dc.w $0012
[000af348]                           dc.w $0005
[000af34a]                           dc.w $0002
[000af34c]                           dc.w $0001
_91_COLOR256:
[000af34e]                           dc.w $005c
[000af350]                           dc.w $ffff
[000af352]                           dc.w $ffff
[000af354]                           dc.w $0018
[000af356]                           dc.w $0001
[000af358]                           dc.w $0000
[000af35a] 000ae604                  dc.l PICCOLOR01
[000af35e]                           dc.w $0014
[000af360]                           dc.w $0005
[000af362]                           dc.w $0002
[000af364]                           dc.w $0001
_92_COLOR256:
[000af366]                           dc.w $005d
[000af368]                           dc.w $ffff
[000af36a]                           dc.w $ffff
[000af36c]                           dc.w $0018
[000af36e]                           dc.w $0001
[000af370]                           dc.w $0000
[000af372] 000ae604                  dc.l PICCOLOR01
[000af376]                           dc.w $0016
[000af378]                           dc.w $0005
[000af37a]                           dc.w $0002
[000af37c]                           dc.w $0001
_93_COLOR256:
[000af37e]                           dc.w $005e
[000af380]                           dc.w $ffff
[000af382]                           dc.w $ffff
[000af384]                           dc.w $0018
[000af386]                           dc.w $0001
[000af388]                           dc.w $0000
[000af38a] 000ae604                  dc.l PICCOLOR01
[000af38e]                           dc.w $0018
[000af390]                           dc.w $0005
[000af392]                           dc.w $0002
[000af394]                           dc.w $0001
_94_COLOR256:
[000af396]                           dc.w $005f
[000af398]                           dc.w $ffff
[000af39a]                           dc.w $ffff
[000af39c]                           dc.w $0018
[000af39e]                           dc.w $0001
[000af3a0]                           dc.w $0000
[000af3a2] 000ae604                  dc.l PICCOLOR01
[000af3a6]                           dc.w $001a
[000af3a8]                           dc.w $0005
[000af3aa]                           dc.w $0002
[000af3ac]                           dc.w $0001
_95_COLOR256:
[000af3ae]                           dc.w $0060
[000af3b0]                           dc.w $ffff
[000af3b2]                           dc.w $ffff
[000af3b4]                           dc.w $0018
[000af3b6]                           dc.w $0001
[000af3b8]                           dc.w $0000
[000af3ba] 000ae604                  dc.l PICCOLOR01
[000af3be]                           dc.w $001c
[000af3c0]                           dc.w $0005
[000af3c2]                           dc.w $0002
[000af3c4]                           dc.w $0001
_96_COLOR256:
[000af3c6]                           dc.w $0061
[000af3c8]                           dc.w $ffff
[000af3ca]                           dc.w $ffff
[000af3cc]                           dc.w $0018
[000af3ce]                           dc.w $0001
[000af3d0]                           dc.w $0000
[000af3d2] 000ae604                  dc.l PICCOLOR01
[000af3d6]                           dc.w $001e
[000af3d8]                           dc.w $0005
[000af3da]                           dc.w $0002
[000af3dc]                           dc.w $0001
_97_COLOR256:
[000af3de]                           dc.w $0062
[000af3e0]                           dc.w $ffff
[000af3e2]                           dc.w $ffff
[000af3e4]                           dc.w $0018
[000af3e6]                           dc.w $0001
[000af3e8]                           dc.w $0000
[000af3ea] 000ae604                  dc.l PICCOLOR01
[000af3ee]                           dc.w $0000
[000af3f0]                           dc.w $0006
[000af3f2]                           dc.w $0002
[000af3f4]                           dc.w $0001
_98_COLOR256:
[000af3f6]                           dc.w $0063
[000af3f8]                           dc.w $ffff
[000af3fa]                           dc.w $ffff
[000af3fc]                           dc.w $0018
[000af3fe]                           dc.w $0001
[000af400]                           dc.w $0000
[000af402] 000ae604                  dc.l PICCOLOR01
[000af406]                           dc.w $0002
[000af408]                           dc.w $0006
[000af40a]                           dc.w $0002
[000af40c]                           dc.w $0001
_99_COLOR256:
[000af40e]                           dc.w $0064
[000af410]                           dc.w $ffff
[000af412]                           dc.w $ffff
[000af414]                           dc.w $0018
[000af416]                           dc.w $0001
[000af418]                           dc.w $0000
[000af41a] 000ae604                  dc.l PICCOLOR01
[000af41e]                           dc.w $0004
[000af420]                           dc.w $0006
[000af422]                           dc.w $0002
[000af424]                           dc.w $0001
_100_COLOR256:
[000af426]                           dc.w $0065
[000af428]                           dc.w $ffff
[000af42a]                           dc.w $ffff
[000af42c]                           dc.w $0018
[000af42e]                           dc.w $0001
[000af430]                           dc.w $0000
[000af432] 000ae604                  dc.l PICCOLOR01
[000af436]                           dc.w $0006
[000af438]                           dc.w $0006
[000af43a]                           dc.w $0002
[000af43c]                           dc.w $0001
_101_COLOR256:
[000af43e]                           dc.w $0066
[000af440]                           dc.w $ffff
[000af442]                           dc.w $ffff
[000af444]                           dc.w $0018
[000af446]                           dc.w $0001
[000af448]                           dc.w $0000
[000af44a] 000ae604                  dc.l PICCOLOR01
[000af44e]                           dc.w $0008
[000af450]                           dc.w $0006
[000af452]                           dc.w $0002
[000af454]                           dc.w $0001
_102_COLOR256:
[000af456]                           dc.w $0067
[000af458]                           dc.w $ffff
[000af45a]                           dc.w $ffff
[000af45c]                           dc.w $0018
[000af45e]                           dc.w $0001
[000af460]                           dc.w $0000
[000af462] 000ae604                  dc.l PICCOLOR01
[000af466]                           dc.w $000a
[000af468]                           dc.w $0006
[000af46a]                           dc.w $0002
[000af46c]                           dc.w $0001
_103_COLOR256:
[000af46e]                           dc.w $0068
[000af470]                           dc.w $ffff
[000af472]                           dc.w $ffff
[000af474]                           dc.w $0018
[000af476]                           dc.w $0001
[000af478]                           dc.w $0000
[000af47a] 000ae604                  dc.l PICCOLOR01
[000af47e]                           dc.w $000c
[000af480]                           dc.w $0006
[000af482]                           dc.w $0002
[000af484]                           dc.w $0001
_104_COLOR256:
[000af486]                           dc.w $0069
[000af488]                           dc.w $ffff
[000af48a]                           dc.w $ffff
[000af48c]                           dc.w $0018
[000af48e]                           dc.w $0001
[000af490]                           dc.w $0000
[000af492] 000ae604                  dc.l PICCOLOR01
[000af496]                           dc.w $000e
[000af498]                           dc.w $0006
[000af49a]                           dc.w $0002
[000af49c]                           dc.w $0001
_105_COLOR256:
[000af49e]                           dc.w $006a
[000af4a0]                           dc.w $ffff
[000af4a2]                           dc.w $ffff
[000af4a4]                           dc.w $0018
[000af4a6]                           dc.w $0001
[000af4a8]                           dc.w $0000
[000af4aa] 000ae604                  dc.l PICCOLOR01
[000af4ae]                           dc.w $0010
[000af4b0]                           dc.w $0006
[000af4b2]                           dc.w $0002
[000af4b4]                           dc.w $0001
_106_COLOR256:
[000af4b6]                           dc.w $006b
[000af4b8]                           dc.w $ffff
[000af4ba]                           dc.w $ffff
[000af4bc]                           dc.w $0018
[000af4be]                           dc.w $0001
[000af4c0]                           dc.w $0000
[000af4c2] 000ae604                  dc.l PICCOLOR01
[000af4c6]                           dc.w $0012
[000af4c8]                           dc.w $0006
[000af4ca]                           dc.w $0002
[000af4cc]                           dc.w $0001
_107_COLOR256:
[000af4ce]                           dc.w $006c
[000af4d0]                           dc.w $ffff
[000af4d2]                           dc.w $ffff
[000af4d4]                           dc.w $0018
[000af4d6]                           dc.w $0001
[000af4d8]                           dc.w $0000
[000af4da] 000ae604                  dc.l PICCOLOR01
[000af4de]                           dc.w $0014
[000af4e0]                           dc.w $0006
[000af4e2]                           dc.w $0002
[000af4e4]                           dc.w $0001
_108_COLOR256:
[000af4e6]                           dc.w $006d
[000af4e8]                           dc.w $ffff
[000af4ea]                           dc.w $ffff
[000af4ec]                           dc.w $0018
[000af4ee]                           dc.w $0001
[000af4f0]                           dc.w $0000
[000af4f2] 000ae604                  dc.l PICCOLOR01
[000af4f6]                           dc.w $0016
[000af4f8]                           dc.w $0006
[000af4fa]                           dc.w $0002
[000af4fc]                           dc.w $0001
_109_COLOR256:
[000af4fe]                           dc.w $006e
[000af500]                           dc.w $ffff
[000af502]                           dc.w $ffff
[000af504]                           dc.w $0018
[000af506]                           dc.w $0001
[000af508]                           dc.w $0000
[000af50a] 000ae604                  dc.l PICCOLOR01
[000af50e]                           dc.w $0018
[000af510]                           dc.w $0006
[000af512]                           dc.w $0002
[000af514]                           dc.w $0001
_110_COLOR256:
[000af516]                           dc.w $006f
[000af518]                           dc.w $ffff
[000af51a]                           dc.w $ffff
[000af51c]                           dc.w $0018
[000af51e]                           dc.w $0001
[000af520]                           dc.w $0000
[000af522] 000ae604                  dc.l PICCOLOR01
[000af526]                           dc.w $001a
[000af528]                           dc.w $0006
[000af52a]                           dc.w $0002
[000af52c]                           dc.w $0001
_111_COLOR256:
[000af52e]                           dc.w $0070
[000af530]                           dc.w $ffff
[000af532]                           dc.w $ffff
[000af534]                           dc.w $0018
[000af536]                           dc.w $0001
[000af538]                           dc.w $0000
[000af53a] 000ae604                  dc.l PICCOLOR01
[000af53e]                           dc.w $001c
[000af540]                           dc.w $0006
[000af542]                           dc.w $0002
[000af544]                           dc.w $0001
_112_COLOR256:
[000af546]                           dc.w $0071
[000af548]                           dc.w $ffff
[000af54a]                           dc.w $ffff
[000af54c]                           dc.w $0018
[000af54e]                           dc.w $0001
[000af550]                           dc.w $0000
[000af552] 000ae604                  dc.l PICCOLOR01
[000af556]                           dc.w $001e
[000af558]                           dc.w $0006
[000af55a]                           dc.w $0002
[000af55c]                           dc.w $0001
_113_COLOR256:
[000af55e]                           dc.w $0072
[000af560]                           dc.w $ffff
[000af562]                           dc.w $ffff
[000af564]                           dc.w $0018
[000af566]                           dc.w $0001
[000af568]                           dc.w $0000
[000af56a] 000ae604                  dc.l PICCOLOR01
[000af56e]                           dc.w $0000
[000af570]                           dc.w $0007
[000af572]                           dc.w $0002
[000af574]                           dc.w $0001
_114_COLOR256:
[000af576]                           dc.w $0073
[000af578]                           dc.w $ffff
[000af57a]                           dc.w $ffff
[000af57c]                           dc.w $0018
[000af57e]                           dc.w $0001
[000af580]                           dc.w $0000
[000af582] 000ae604                  dc.l PICCOLOR01
[000af586]                           dc.w $0002
[000af588]                           dc.w $0007
[000af58a]                           dc.w $0002
[000af58c]                           dc.w $0001
_115_COLOR256:
[000af58e]                           dc.w $0074
[000af590]                           dc.w $ffff
[000af592]                           dc.w $ffff
[000af594]                           dc.w $0018
[000af596]                           dc.w $0001
[000af598]                           dc.w $0000
[000af59a] 000ae604                  dc.l PICCOLOR01
[000af59e]                           dc.w $0004
[000af5a0]                           dc.w $0007
[000af5a2]                           dc.w $0002
[000af5a4]                           dc.w $0001
_116_COLOR256:
[000af5a6]                           dc.w $0075
[000af5a8]                           dc.w $ffff
[000af5aa]                           dc.w $ffff
[000af5ac]                           dc.w $0018
[000af5ae]                           dc.w $0001
[000af5b0]                           dc.w $0000
[000af5b2] 000ae604                  dc.l PICCOLOR01
[000af5b6]                           dc.w $0006
[000af5b8]                           dc.w $0007
[000af5ba]                           dc.w $0002
[000af5bc]                           dc.w $0001
_117_COLOR256:
[000af5be]                           dc.w $0076
[000af5c0]                           dc.w $ffff
[000af5c2]                           dc.w $ffff
[000af5c4]                           dc.w $0018
[000af5c6]                           dc.w $0001
[000af5c8]                           dc.w $0000
[000af5ca] 000ae604                  dc.l PICCOLOR01
[000af5ce]                           dc.w $0008
[000af5d0]                           dc.w $0007
[000af5d2]                           dc.w $0002
[000af5d4]                           dc.w $0001
_118_COLOR256:
[000af5d6]                           dc.w $0077
[000af5d8]                           dc.w $ffff
[000af5da]                           dc.w $ffff
[000af5dc]                           dc.w $0018
[000af5de]                           dc.w $0001
[000af5e0]                           dc.w $0000
[000af5e2] 000ae604                  dc.l PICCOLOR01
[000af5e6]                           dc.w $000a
[000af5e8]                           dc.w $0007
[000af5ea]                           dc.w $0002
[000af5ec]                           dc.w $0001
_119_COLOR256:
[000af5ee]                           dc.w $0078
[000af5f0]                           dc.w $ffff
[000af5f2]                           dc.w $ffff
[000af5f4]                           dc.w $0018
[000af5f6]                           dc.w $0001
[000af5f8]                           dc.w $0000
[000af5fa] 000ae604                  dc.l PICCOLOR01
[000af5fe]                           dc.w $000c
[000af600]                           dc.w $0007
[000af602]                           dc.w $0002
[000af604]                           dc.w $0001
_120_COLOR256:
[000af606]                           dc.w $0079
[000af608]                           dc.w $ffff
[000af60a]                           dc.w $ffff
[000af60c]                           dc.w $0018
[000af60e]                           dc.w $0001
[000af610]                           dc.w $0000
[000af612] 000ae604                  dc.l PICCOLOR01
[000af616]                           dc.w $000e
[000af618]                           dc.w $0007
[000af61a]                           dc.w $0002
[000af61c]                           dc.w $0001
_121_COLOR256:
[000af61e]                           dc.w $007a
[000af620]                           dc.w $ffff
[000af622]                           dc.w $ffff
[000af624]                           dc.w $0018
[000af626]                           dc.w $0001
[000af628]                           dc.w $0000
[000af62a] 000ae604                  dc.l PICCOLOR01
[000af62e]                           dc.w $0010
[000af630]                           dc.w $0007
[000af632]                           dc.w $0002
[000af634]                           dc.w $0001
_122_COLOR256:
[000af636]                           dc.w $007b
[000af638]                           dc.w $ffff
[000af63a]                           dc.w $ffff
[000af63c]                           dc.w $0018
[000af63e]                           dc.w $0001
[000af640]                           dc.w $0000
[000af642] 000ae604                  dc.l PICCOLOR01
[000af646]                           dc.w $0012
[000af648]                           dc.w $0007
[000af64a]                           dc.w $0002
[000af64c]                           dc.w $0001
_123_COLOR256:
[000af64e]                           dc.w $007c
[000af650]                           dc.w $ffff
[000af652]                           dc.w $ffff
[000af654]                           dc.w $0018
[000af656]                           dc.w $0001
[000af658]                           dc.w $0000
[000af65a] 000ae604                  dc.l PICCOLOR01
[000af65e]                           dc.w $0014
[000af660]                           dc.w $0007
[000af662]                           dc.w $0002
[000af664]                           dc.w $0001
_124_COLOR256:
[000af666]                           dc.w $007d
[000af668]                           dc.w $ffff
[000af66a]                           dc.w $ffff
[000af66c]                           dc.w $0018
[000af66e]                           dc.w $0001
[000af670]                           dc.w $0000
[000af672] 000ae604                  dc.l PICCOLOR01
[000af676]                           dc.w $0016
[000af678]                           dc.w $0007
[000af67a]                           dc.w $0002
[000af67c]                           dc.w $0001
_125_COLOR256:
[000af67e]                           dc.w $007e
[000af680]                           dc.w $ffff
[000af682]                           dc.w $ffff
[000af684]                           dc.w $0018
[000af686]                           dc.w $0001
[000af688]                           dc.w $0000
[000af68a] 000ae604                  dc.l PICCOLOR01
[000af68e]                           dc.w $0018
[000af690]                           dc.w $0007
[000af692]                           dc.w $0002
[000af694]                           dc.w $0001
_126_COLOR256:
[000af696]                           dc.w $007f
[000af698]                           dc.w $ffff
[000af69a]                           dc.w $ffff
[000af69c]                           dc.w $0018
[000af69e]                           dc.w $0001
[000af6a0]                           dc.w $0000
[000af6a2] 000ae604                  dc.l PICCOLOR01
[000af6a6]                           dc.w $001a
[000af6a8]                           dc.w $0007
[000af6aa]                           dc.w $0002
[000af6ac]                           dc.w $0001
_127_COLOR256:
[000af6ae]                           dc.w $0080
[000af6b0]                           dc.w $ffff
[000af6b2]                           dc.w $ffff
[000af6b4]                           dc.w $0018
[000af6b6]                           dc.w $0001
[000af6b8]                           dc.w $0000
[000af6ba] 000ae604                  dc.l PICCOLOR01
[000af6be]                           dc.w $001c
[000af6c0]                           dc.w $0007
[000af6c2]                           dc.w $0002
[000af6c4]                           dc.w $0001
_128_COLOR256:
[000af6c6]                           dc.w $0081
[000af6c8]                           dc.w $ffff
[000af6ca]                           dc.w $ffff
[000af6cc]                           dc.w $0018
[000af6ce]                           dc.w $0001
[000af6d0]                           dc.w $0000
[000af6d2] 000ae604                  dc.l PICCOLOR01
[000af6d6]                           dc.w $001e
[000af6d8]                           dc.w $0007
[000af6da]                           dc.w $0002
[000af6dc]                           dc.w $0001
_129_COLOR256:
[000af6de]                           dc.w $0082
[000af6e0]                           dc.w $ffff
[000af6e2]                           dc.w $ffff
[000af6e4]                           dc.w $0018
[000af6e6]                           dc.w $0001
[000af6e8]                           dc.w $0000
[000af6ea] 000ae604                  dc.l PICCOLOR01
[000af6ee]                           dc.w $0000
[000af6f0]                           dc.w $0008
[000af6f2]                           dc.w $0002
[000af6f4]                           dc.w $0001
_130_COLOR256:
[000af6f6]                           dc.w $0083
[000af6f8]                           dc.w $ffff
[000af6fa]                           dc.w $ffff
[000af6fc]                           dc.w $0018
[000af6fe]                           dc.w $0001
[000af700]                           dc.w $0000
[000af702] 000ae604                  dc.l PICCOLOR01
[000af706]                           dc.w $0002
[000af708]                           dc.w $0008
[000af70a]                           dc.w $0002
[000af70c]                           dc.w $0001
_131_COLOR256:
[000af70e]                           dc.w $0084
[000af710]                           dc.w $ffff
[000af712]                           dc.w $ffff
[000af714]                           dc.w $0018
[000af716]                           dc.w $0001
[000af718]                           dc.w $0000
[000af71a] 000ae604                  dc.l PICCOLOR01
[000af71e]                           dc.w $0004
[000af720]                           dc.w $0008
[000af722]                           dc.w $0002
[000af724]                           dc.w $0001
_132_COLOR256:
[000af726]                           dc.w $0085
[000af728]                           dc.w $ffff
[000af72a]                           dc.w $ffff
[000af72c]                           dc.w $0018
[000af72e]                           dc.w $0001
[000af730]                           dc.w $0000
[000af732] 000ae604                  dc.l PICCOLOR01
[000af736]                           dc.w $0006
[000af738]                           dc.w $0008
[000af73a]                           dc.w $0002
[000af73c]                           dc.w $0001
_133_COLOR256:
[000af73e]                           dc.w $0086
[000af740]                           dc.w $ffff
[000af742]                           dc.w $ffff
[000af744]                           dc.w $0018
[000af746]                           dc.w $0001
[000af748]                           dc.w $0000
[000af74a] 000ae604                  dc.l PICCOLOR01
[000af74e]                           dc.w $0008
[000af750]                           dc.w $0008
[000af752]                           dc.w $0002
[000af754]                           dc.w $0001
_134_COLOR256:
[000af756]                           dc.w $0087
[000af758]                           dc.w $ffff
[000af75a]                           dc.w $ffff
[000af75c]                           dc.w $0018
[000af75e]                           dc.w $0001
[000af760]                           dc.w $0000
[000af762] 000ae604                  dc.l PICCOLOR01
[000af766]                           dc.w $000a
[000af768]                           dc.w $0008
[000af76a]                           dc.w $0002
[000af76c]                           dc.w $0001
_135_COLOR256:
[000af76e]                           dc.w $0088
[000af770]                           dc.w $ffff
[000af772]                           dc.w $ffff
[000af774]                           dc.w $0018
[000af776]                           dc.w $0001
[000af778]                           dc.w $0000
[000af77a] 000ae604                  dc.l PICCOLOR01
[000af77e]                           dc.w $000c
[000af780]                           dc.w $0008
[000af782]                           dc.w $0002
[000af784]                           dc.w $0001
_136_COLOR256:
[000af786]                           dc.w $0089
[000af788]                           dc.w $ffff
[000af78a]                           dc.w $ffff
[000af78c]                           dc.w $0018
[000af78e]                           dc.w $0001
[000af790]                           dc.w $0000
[000af792] 000ae604                  dc.l PICCOLOR01
[000af796]                           dc.w $000e
[000af798]                           dc.w $0008
[000af79a]                           dc.w $0002
[000af79c]                           dc.w $0001
_137_COLOR256:
[000af79e]                           dc.w $008a
[000af7a0]                           dc.w $ffff
[000af7a2]                           dc.w $ffff
[000af7a4]                           dc.w $0018
[000af7a6]                           dc.w $0001
[000af7a8]                           dc.w $0000
[000af7aa] 000ae604                  dc.l PICCOLOR01
[000af7ae]                           dc.w $0010
[000af7b0]                           dc.w $0008
[000af7b2]                           dc.w $0002
[000af7b4]                           dc.w $0001
_138_COLOR256:
[000af7b6]                           dc.w $008b
[000af7b8]                           dc.w $ffff
[000af7ba]                           dc.w $ffff
[000af7bc]                           dc.w $0018
[000af7be]                           dc.w $0001
[000af7c0]                           dc.w $0000
[000af7c2] 000ae604                  dc.l PICCOLOR01
[000af7c6]                           dc.w $0012
[000af7c8]                           dc.w $0008
[000af7ca]                           dc.w $0002
[000af7cc]                           dc.w $0001
_139_COLOR256:
[000af7ce]                           dc.w $008c
[000af7d0]                           dc.w $ffff
[000af7d2]                           dc.w $ffff
[000af7d4]                           dc.w $0018
[000af7d6]                           dc.w $0001
[000af7d8]                           dc.w $0000
[000af7da] 000ae604                  dc.l PICCOLOR01
[000af7de]                           dc.w $0014
[000af7e0]                           dc.w $0008
[000af7e2]                           dc.w $0002
[000af7e4]                           dc.w $0001
_140_COLOR256:
[000af7e6]                           dc.w $008d
[000af7e8]                           dc.w $ffff
[000af7ea]                           dc.w $ffff
[000af7ec]                           dc.w $0018
[000af7ee]                           dc.w $0001
[000af7f0]                           dc.w $0000
[000af7f2] 000ae604                  dc.l PICCOLOR01
[000af7f6]                           dc.w $0016
[000af7f8]                           dc.w $0008
[000af7fa]                           dc.w $0002
[000af7fc]                           dc.w $0001
_141_COLOR256:
[000af7fe]                           dc.w $008e
[000af800]                           dc.w $ffff
[000af802]                           dc.w $ffff
[000af804]                           dc.w $0018
[000af806]                           dc.w $0001
[000af808]                           dc.w $0000
[000af80a] 000ae604                  dc.l PICCOLOR01
[000af80e]                           dc.w $0018
[000af810]                           dc.w $0008
[000af812]                           dc.w $0002
[000af814]                           dc.w $0001
_142_COLOR256:
[000af816]                           dc.w $008f
[000af818]                           dc.w $ffff
[000af81a]                           dc.w $ffff
[000af81c]                           dc.w $0018
[000af81e]                           dc.w $0001
[000af820]                           dc.w $0000
[000af822] 000ae604                  dc.l PICCOLOR01
[000af826]                           dc.w $001a
[000af828]                           dc.w $0008
[000af82a]                           dc.w $0002
[000af82c]                           dc.w $0001
_143_COLOR256:
[000af82e]                           dc.w $0090
[000af830]                           dc.w $ffff
[000af832]                           dc.w $ffff
[000af834]                           dc.w $0018
[000af836]                           dc.w $0001
[000af838]                           dc.w $0000
[000af83a] 000ae604                  dc.l PICCOLOR01
[000af83e]                           dc.w $001c
[000af840]                           dc.w $0008
[000af842]                           dc.w $0002
[000af844]                           dc.w $0001
_144_COLOR256:
[000af846]                           dc.w $0091
[000af848]                           dc.w $ffff
[000af84a]                           dc.w $ffff
[000af84c]                           dc.w $0018
[000af84e]                           dc.w $0001
[000af850]                           dc.w $0000
[000af852] 000ae604                  dc.l PICCOLOR01
[000af856]                           dc.w $001e
[000af858]                           dc.w $0008
[000af85a]                           dc.w $0002
[000af85c]                           dc.w $0001
_145_COLOR256:
[000af85e]                           dc.w $0092
[000af860]                           dc.w $ffff
[000af862]                           dc.w $ffff
[000af864]                           dc.w $0018
[000af866]                           dc.w $0001
[000af868]                           dc.w $0000
[000af86a] 000ae604                  dc.l PICCOLOR01
[000af86e]                           dc.w $0000
[000af870]                           dc.w $0009
[000af872]                           dc.w $0002
[000af874]                           dc.w $0001
_146_COLOR256:
[000af876]                           dc.w $0093
[000af878]                           dc.w $ffff
[000af87a]                           dc.w $ffff
[000af87c]                           dc.w $0018
[000af87e]                           dc.w $0001
[000af880]                           dc.w $0000
[000af882] 000ae604                  dc.l PICCOLOR01
[000af886]                           dc.w $0002
[000af888]                           dc.w $0009
[000af88a]                           dc.w $0002
[000af88c]                           dc.w $0001
_147_COLOR256:
[000af88e]                           dc.w $0094
[000af890]                           dc.w $ffff
[000af892]                           dc.w $ffff
[000af894]                           dc.w $0018
[000af896]                           dc.w $0001
[000af898]                           dc.w $0000
[000af89a] 000ae604                  dc.l PICCOLOR01
[000af89e]                           dc.w $0004
[000af8a0]                           dc.w $0009
[000af8a2]                           dc.w $0002
[000af8a4]                           dc.w $0001
_148_COLOR256:
[000af8a6]                           dc.w $0095
[000af8a8]                           dc.w $ffff
[000af8aa]                           dc.w $ffff
[000af8ac]                           dc.w $0018
[000af8ae]                           dc.w $0001
[000af8b0]                           dc.w $0000
[000af8b2] 000ae604                  dc.l PICCOLOR01
[000af8b6]                           dc.w $0006
[000af8b8]                           dc.w $0009
[000af8ba]                           dc.w $0002
[000af8bc]                           dc.w $0001
_149_COLOR256:
[000af8be]                           dc.w $0096
[000af8c0]                           dc.w $ffff
[000af8c2]                           dc.w $ffff
[000af8c4]                           dc.w $0018
[000af8c6]                           dc.w $0001
[000af8c8]                           dc.w $0000
[000af8ca] 000ae604                  dc.l PICCOLOR01
[000af8ce]                           dc.w $0008
[000af8d0]                           dc.w $0009
[000af8d2]                           dc.w $0002
[000af8d4]                           dc.w $0001
_150_COLOR256:
[000af8d6]                           dc.w $0097
[000af8d8]                           dc.w $ffff
[000af8da]                           dc.w $ffff
[000af8dc]                           dc.w $0018
[000af8de]                           dc.w $0001
[000af8e0]                           dc.w $0000
[000af8e2] 000ae604                  dc.l PICCOLOR01
[000af8e6]                           dc.w $000a
[000af8e8]                           dc.w $0009
[000af8ea]                           dc.w $0002
[000af8ec]                           dc.w $0001
_151_COLOR256:
[000af8ee]                           dc.w $0098
[000af8f0]                           dc.w $ffff
[000af8f2]                           dc.w $ffff
[000af8f4]                           dc.w $0018
[000af8f6]                           dc.w $0001
[000af8f8]                           dc.w $0000
[000af8fa] 000ae604                  dc.l PICCOLOR01
[000af8fe]                           dc.w $000c
[000af900]                           dc.w $0009
[000af902]                           dc.w $0002
[000af904]                           dc.w $0001
_152_COLOR256:
[000af906]                           dc.w $0099
[000af908]                           dc.w $ffff
[000af90a]                           dc.w $ffff
[000af90c]                           dc.w $0018
[000af90e]                           dc.w $0001
[000af910]                           dc.w $0000
[000af912] 000ae604                  dc.l PICCOLOR01
[000af916]                           dc.w $000e
[000af918]                           dc.w $0009
[000af91a]                           dc.w $0002
[000af91c]                           dc.w $0001
_153_COLOR256:
[000af91e]                           dc.w $009a
[000af920]                           dc.w $ffff
[000af922]                           dc.w $ffff
[000af924]                           dc.w $0018
[000af926]                           dc.w $0001
[000af928]                           dc.w $0000
[000af92a] 000ae604                  dc.l PICCOLOR01
[000af92e]                           dc.w $0010
[000af930]                           dc.w $0009
[000af932]                           dc.w $0002
[000af934]                           dc.w $0001
_154_COLOR256:
[000af936]                           dc.w $009b
[000af938]                           dc.w $ffff
[000af93a]                           dc.w $ffff
[000af93c]                           dc.w $0018
[000af93e]                           dc.w $0001
[000af940]                           dc.w $0000
[000af942] 000ae604                  dc.l PICCOLOR01
[000af946]                           dc.w $0012
[000af948]                           dc.w $0009
[000af94a]                           dc.w $0002
[000af94c]                           dc.w $0001
_155_COLOR256:
[000af94e]                           dc.w $009c
[000af950]                           dc.w $ffff
[000af952]                           dc.w $ffff
[000af954]                           dc.w $0018
[000af956]                           dc.w $0001
[000af958]                           dc.w $0000
[000af95a] 000ae604                  dc.l PICCOLOR01
[000af95e]                           dc.w $0014
[000af960]                           dc.w $0009
[000af962]                           dc.w $0002
[000af964]                           dc.w $0001
_156_COLOR256:
[000af966]                           dc.w $009d
[000af968]                           dc.w $ffff
[000af96a]                           dc.w $ffff
[000af96c]                           dc.w $0018
[000af96e]                           dc.w $0001
[000af970]                           dc.w $0000
[000af972] 000ae604                  dc.l PICCOLOR01
[000af976]                           dc.w $0016
[000af978]                           dc.w $0009
[000af97a]                           dc.w $0002
[000af97c]                           dc.w $0001
_157_COLOR256:
[000af97e]                           dc.w $009e
[000af980]                           dc.w $ffff
[000af982]                           dc.w $ffff
[000af984]                           dc.w $0018
[000af986]                           dc.w $0001
[000af988]                           dc.w $0000
[000af98a] 000ae604                  dc.l PICCOLOR01
[000af98e]                           dc.w $0018
[000af990]                           dc.w $0009
[000af992]                           dc.w $0002
[000af994]                           dc.w $0001
_158_COLOR256:
[000af996]                           dc.w $009f
[000af998]                           dc.w $ffff
[000af99a]                           dc.w $ffff
[000af99c]                           dc.w $0018
[000af99e]                           dc.w $0001
[000af9a0]                           dc.w $0000
[000af9a2] 000ae604                  dc.l PICCOLOR01
[000af9a6]                           dc.w $001a
[000af9a8]                           dc.w $0009
[000af9aa]                           dc.w $0002
[000af9ac]                           dc.w $0001
_159_COLOR256:
[000af9ae]                           dc.w $00a0
[000af9b0]                           dc.w $ffff
[000af9b2]                           dc.w $ffff
[000af9b4]                           dc.w $0018
[000af9b6]                           dc.w $0001
[000af9b8]                           dc.w $0000
[000af9ba] 000ae604                  dc.l PICCOLOR01
[000af9be]                           dc.w $001c
[000af9c0]                           dc.w $0009
[000af9c2]                           dc.w $0002
[000af9c4]                           dc.w $0001
_160_COLOR256:
[000af9c6]                           dc.w $00a1
[000af9c8]                           dc.w $ffff
[000af9ca]                           dc.w $ffff
[000af9cc]                           dc.w $0018
[000af9ce]                           dc.w $0001
[000af9d0]                           dc.w $0000
[000af9d2] 000ae604                  dc.l PICCOLOR01
[000af9d6]                           dc.w $001e
[000af9d8]                           dc.w $0009
[000af9da]                           dc.w $0002
[000af9dc]                           dc.w $0001
_161_COLOR256:
[000af9de]                           dc.w $00a2
[000af9e0]                           dc.w $ffff
[000af9e2]                           dc.w $ffff
[000af9e4]                           dc.w $0018
[000af9e6]                           dc.w $0001
[000af9e8]                           dc.w $0000
[000af9ea] 000ae604                  dc.l PICCOLOR01
[000af9ee]                           dc.w $0000
[000af9f0]                           dc.w $000a
[000af9f2]                           dc.w $0002
[000af9f4]                           dc.w $0001
_162_COLOR256:
[000af9f6]                           dc.w $00a3
[000af9f8]                           dc.w $ffff
[000af9fa]                           dc.w $ffff
[000af9fc]                           dc.w $0018
[000af9fe]                           dc.w $0001
[000afa00]                           dc.w $0000
[000afa02] 000ae604                  dc.l PICCOLOR01
[000afa06]                           dc.w $0002
[000afa08]                           dc.w $000a
[000afa0a]                           dc.w $0002
[000afa0c]                           dc.w $0001
_163_COLOR256:
[000afa0e]                           dc.w $00a4
[000afa10]                           dc.w $ffff
[000afa12]                           dc.w $ffff
[000afa14]                           dc.w $0018
[000afa16]                           dc.w $0001
[000afa18]                           dc.w $0000
[000afa1a] 000ae604                  dc.l PICCOLOR01
[000afa1e]                           dc.w $0004
[000afa20]                           dc.w $000a
[000afa22]                           dc.w $0002
[000afa24]                           dc.w $0001
_164_COLOR256:
[000afa26]                           dc.w $00a5
[000afa28]                           dc.w $ffff
[000afa2a]                           dc.w $ffff
[000afa2c]                           dc.w $0018
[000afa2e]                           dc.w $0001
[000afa30]                           dc.w $0000
[000afa32] 000ae604                  dc.l PICCOLOR01
[000afa36]                           dc.w $0006
[000afa38]                           dc.w $000a
[000afa3a]                           dc.w $0002
[000afa3c]                           dc.w $0001
_165_COLOR256:
[000afa3e]                           dc.w $00a6
[000afa40]                           dc.w $ffff
[000afa42]                           dc.w $ffff
[000afa44]                           dc.w $0018
[000afa46]                           dc.w $0001
[000afa48]                           dc.w $0000
[000afa4a] 000ae604                  dc.l PICCOLOR01
[000afa4e]                           dc.w $0008
[000afa50]                           dc.w $000a
[000afa52]                           dc.w $0002
[000afa54]                           dc.w $0001
_166_COLOR256:
[000afa56]                           dc.w $00a7
[000afa58]                           dc.w $ffff
[000afa5a]                           dc.w $ffff
[000afa5c]                           dc.w $0018
[000afa5e]                           dc.w $0001
[000afa60]                           dc.w $0000
[000afa62] 000ae604                  dc.l PICCOLOR01
[000afa66]                           dc.w $000a
[000afa68]                           dc.w $000a
[000afa6a]                           dc.w $0002
[000afa6c]                           dc.w $0001
_167_COLOR256:
[000afa6e]                           dc.w $00a8
[000afa70]                           dc.w $ffff
[000afa72]                           dc.w $ffff
[000afa74]                           dc.w $0018
[000afa76]                           dc.w $0001
[000afa78]                           dc.w $0000
[000afa7a] 000ae604                  dc.l PICCOLOR01
[000afa7e]                           dc.w $000c
[000afa80]                           dc.w $000a
[000afa82]                           dc.w $0002
[000afa84]                           dc.w $0001
_168_COLOR256:
[000afa86]                           dc.w $00a9
[000afa88]                           dc.w $ffff
[000afa8a]                           dc.w $ffff
[000afa8c]                           dc.w $0018
[000afa8e]                           dc.w $0001
[000afa90]                           dc.w $0000
[000afa92] 000ae604                  dc.l PICCOLOR01
[000afa96]                           dc.w $000e
[000afa98]                           dc.w $000a
[000afa9a]                           dc.w $0002
[000afa9c]                           dc.w $0001
_169_COLOR256:
[000afa9e]                           dc.w $00aa
[000afaa0]                           dc.w $ffff
[000afaa2]                           dc.w $ffff
[000afaa4]                           dc.w $0018
[000afaa6]                           dc.w $0001
[000afaa8]                           dc.w $0000
[000afaaa] 000ae604                  dc.l PICCOLOR01
[000afaae]                           dc.w $0010
[000afab0]                           dc.w $000a
[000afab2]                           dc.w $0002
[000afab4]                           dc.w $0001
_170_COLOR256:
[000afab6]                           dc.w $00ab
[000afab8]                           dc.w $ffff
[000afaba]                           dc.w $ffff
[000afabc]                           dc.w $0018
[000afabe]                           dc.w $0001
[000afac0]                           dc.w $0000
[000afac2] 000ae604                  dc.l PICCOLOR01
[000afac6]                           dc.w $0012
[000afac8]                           dc.w $000a
[000afaca]                           dc.w $0002
[000afacc]                           dc.w $0001
_171_COLOR256:
[000aface]                           dc.w $00ac
[000afad0]                           dc.w $ffff
[000afad2]                           dc.w $ffff
[000afad4]                           dc.w $0018
[000afad6]                           dc.w $0001
[000afad8]                           dc.w $0000
[000afada] 000ae604                  dc.l PICCOLOR01
[000afade]                           dc.w $0014
[000afae0]                           dc.w $000a
[000afae2]                           dc.w $0002
[000afae4]                           dc.w $0001
_172_COLOR256:
[000afae6]                           dc.w $00ad
[000afae8]                           dc.w $ffff
[000afaea]                           dc.w $ffff
[000afaec]                           dc.w $0018
[000afaee]                           dc.w $0001
[000afaf0]                           dc.w $0000
[000afaf2] 000ae604                  dc.l PICCOLOR01
[000afaf6]                           dc.w $0016
[000afaf8]                           dc.w $000a
[000afafa]                           dc.w $0002
[000afafc]                           dc.w $0001
_173_COLOR256:
[000afafe]                           dc.w $00ae
[000afb00]                           dc.w $ffff
[000afb02]                           dc.w $ffff
[000afb04]                           dc.w $0018
[000afb06]                           dc.w $0001
[000afb08]                           dc.w $0000
[000afb0a] 000ae604                  dc.l PICCOLOR01
[000afb0e]                           dc.w $0018
[000afb10]                           dc.w $000a
[000afb12]                           dc.w $0002
[000afb14]                           dc.w $0001
_174_COLOR256:
[000afb16]                           dc.w $00af
[000afb18]                           dc.w $ffff
[000afb1a]                           dc.w $ffff
[000afb1c]                           dc.w $0018
[000afb1e]                           dc.w $0001
[000afb20]                           dc.w $0000
[000afb22] 000ae604                  dc.l PICCOLOR01
[000afb26]                           dc.w $001a
[000afb28]                           dc.w $000a
[000afb2a]                           dc.w $0002
[000afb2c]                           dc.w $0001
_175_COLOR256:
[000afb2e]                           dc.w $00b0
[000afb30]                           dc.w $ffff
[000afb32]                           dc.w $ffff
[000afb34]                           dc.w $0018
[000afb36]                           dc.w $0001
[000afb38]                           dc.w $0000
[000afb3a] 000ae604                  dc.l PICCOLOR01
[000afb3e]                           dc.w $001c
[000afb40]                           dc.w $000a
[000afb42]                           dc.w $0002
[000afb44]                           dc.w $0001
_176_COLOR256:
[000afb46]                           dc.w $00b1
[000afb48]                           dc.w $ffff
[000afb4a]                           dc.w $ffff
[000afb4c]                           dc.w $0018
[000afb4e]                           dc.w $0001
[000afb50]                           dc.w $0000
[000afb52] 000ae604                  dc.l PICCOLOR01
[000afb56]                           dc.w $001e
[000afb58]                           dc.w $000a
[000afb5a]                           dc.w $0002
[000afb5c]                           dc.w $0001
_177_COLOR256:
[000afb5e]                           dc.w $00b2
[000afb60]                           dc.w $ffff
[000afb62]                           dc.w $ffff
[000afb64]                           dc.w $0018
[000afb66]                           dc.w $0001
[000afb68]                           dc.w $0000
[000afb6a] 000ae604                  dc.l PICCOLOR01
[000afb6e]                           dc.w $0000
[000afb70]                           dc.w $000b
[000afb72]                           dc.w $0002
[000afb74]                           dc.w $0001
_178_COLOR256:
[000afb76]                           dc.w $00b3
[000afb78]                           dc.w $ffff
[000afb7a]                           dc.w $ffff
[000afb7c]                           dc.w $0018
[000afb7e]                           dc.w $0001
[000afb80]                           dc.w $0000
[000afb82] 000ae604                  dc.l PICCOLOR01
[000afb86]                           dc.w $0002
[000afb88]                           dc.w $000b
[000afb8a]                           dc.w $0002
[000afb8c]                           dc.w $0001
_179_COLOR256:
[000afb8e]                           dc.w $00b4
[000afb90]                           dc.w $ffff
[000afb92]                           dc.w $ffff
[000afb94]                           dc.w $0018
[000afb96]                           dc.w $0001
[000afb98]                           dc.w $0000
[000afb9a] 000ae604                  dc.l PICCOLOR01
[000afb9e]                           dc.w $0004
[000afba0]                           dc.w $000b
[000afba2]                           dc.w $0002
[000afba4]                           dc.w $0001
_180_COLOR256:
[000afba6]                           dc.w $00b5
[000afba8]                           dc.w $ffff
[000afbaa]                           dc.w $ffff
[000afbac]                           dc.w $0018
[000afbae]                           dc.w $0001
[000afbb0]                           dc.w $0000
[000afbb2] 000ae604                  dc.l PICCOLOR01
[000afbb6]                           dc.w $0006
[000afbb8]                           dc.w $000b
[000afbba]                           dc.w $0002
[000afbbc]                           dc.w $0001
_181_COLOR256:
[000afbbe]                           dc.w $00b6
[000afbc0]                           dc.w $ffff
[000afbc2]                           dc.w $ffff
[000afbc4]                           dc.w $0018
[000afbc6]                           dc.w $0001
[000afbc8]                           dc.w $0000
[000afbca] 000ae604                  dc.l PICCOLOR01
[000afbce]                           dc.w $0008
[000afbd0]                           dc.w $000b
[000afbd2]                           dc.w $0002
[000afbd4]                           dc.w $0001
_182_COLOR256:
[000afbd6]                           dc.w $00b7
[000afbd8]                           dc.w $ffff
[000afbda]                           dc.w $ffff
[000afbdc]                           dc.w $0018
[000afbde]                           dc.w $0001
[000afbe0]                           dc.w $0000
[000afbe2] 000ae604                  dc.l PICCOLOR01
[000afbe6]                           dc.w $000a
[000afbe8]                           dc.w $000b
[000afbea]                           dc.w $0002
[000afbec]                           dc.w $0001
_183_COLOR256:
[000afbee]                           dc.w $00b8
[000afbf0]                           dc.w $ffff
[000afbf2]                           dc.w $ffff
[000afbf4]                           dc.w $0018
[000afbf6]                           dc.w $0001
[000afbf8]                           dc.w $0000
[000afbfa] 000ae604                  dc.l PICCOLOR01
[000afbfe]                           dc.w $000c
[000afc00]                           dc.w $000b
[000afc02]                           dc.w $0002
[000afc04]                           dc.w $0001
_184_COLOR256:
[000afc06]                           dc.w $00b9
[000afc08]                           dc.w $ffff
[000afc0a]                           dc.w $ffff
[000afc0c]                           dc.w $0018
[000afc0e]                           dc.w $0001
[000afc10]                           dc.w $0000
[000afc12] 000ae604                  dc.l PICCOLOR01
[000afc16]                           dc.w $000e
[000afc18]                           dc.w $000b
[000afc1a]                           dc.w $0002
[000afc1c]                           dc.w $0001
_185_COLOR256:
[000afc1e]                           dc.w $00ba
[000afc20]                           dc.w $ffff
[000afc22]                           dc.w $ffff
[000afc24]                           dc.w $0018
[000afc26]                           dc.w $0001
[000afc28]                           dc.w $0000
[000afc2a] 000ae604                  dc.l PICCOLOR01
[000afc2e]                           dc.w $0010
[000afc30]                           dc.w $000b
[000afc32]                           dc.w $0002
[000afc34]                           dc.w $0001
_186_COLOR256:
[000afc36]                           dc.w $00bb
[000afc38]                           dc.w $ffff
[000afc3a]                           dc.w $ffff
[000afc3c]                           dc.w $0018
[000afc3e]                           dc.w $0001
[000afc40]                           dc.w $0000
[000afc42] 000ae604                  dc.l PICCOLOR01
[000afc46]                           dc.w $0012
[000afc48]                           dc.w $000b
[000afc4a]                           dc.w $0002
[000afc4c]                           dc.w $0001
_187_COLOR256:
[000afc4e]                           dc.w $00bc
[000afc50]                           dc.w $ffff
[000afc52]                           dc.w $ffff
[000afc54]                           dc.w $0018
[000afc56]                           dc.w $0001
[000afc58]                           dc.w $0000
[000afc5a] 000ae604                  dc.l PICCOLOR01
[000afc5e]                           dc.w $0014
[000afc60]                           dc.w $000b
[000afc62]                           dc.w $0002
[000afc64]                           dc.w $0001
_188_COLOR256:
[000afc66]                           dc.w $00bd
[000afc68]                           dc.w $ffff
[000afc6a]                           dc.w $ffff
[000afc6c]                           dc.w $0018
[000afc6e]                           dc.w $0001
[000afc70]                           dc.w $0000
[000afc72] 000ae604                  dc.l PICCOLOR01
[000afc76]                           dc.w $0016
[000afc78]                           dc.w $000b
[000afc7a]                           dc.w $0002
[000afc7c]                           dc.w $0001
_189_COLOR256:
[000afc7e]                           dc.w $00be
[000afc80]                           dc.w $ffff
[000afc82]                           dc.w $ffff
[000afc84]                           dc.w $0018
[000afc86]                           dc.w $0001
[000afc88]                           dc.w $0000
[000afc8a] 000ae604                  dc.l PICCOLOR01
[000afc8e]                           dc.w $0018
[000afc90]                           dc.w $000b
[000afc92]                           dc.w $0002
[000afc94]                           dc.w $0001
_190_COLOR256:
[000afc96]                           dc.w $00bf
[000afc98]                           dc.w $ffff
[000afc9a]                           dc.w $ffff
[000afc9c]                           dc.w $0018
[000afc9e]                           dc.w $0001
[000afca0]                           dc.w $0000
[000afca2] 000ae604                  dc.l PICCOLOR01
[000afca6]                           dc.w $001a
[000afca8]                           dc.w $000b
[000afcaa]                           dc.w $0002
[000afcac]                           dc.w $0001
_191_COLOR256:
[000afcae]                           dc.w $00c0
[000afcb0]                           dc.w $ffff
[000afcb2]                           dc.w $ffff
[000afcb4]                           dc.w $0018
[000afcb6]                           dc.w $0001
[000afcb8]                           dc.w $0000
[000afcba] 000ae604                  dc.l PICCOLOR01
[000afcbe]                           dc.w $001c
[000afcc0]                           dc.w $000b
[000afcc2]                           dc.w $0002
[000afcc4]                           dc.w $0001
_192_COLOR256:
[000afcc6]                           dc.w $00c1
[000afcc8]                           dc.w $ffff
[000afcca]                           dc.w $ffff
[000afccc]                           dc.w $0018
[000afcce]                           dc.w $0001
[000afcd0]                           dc.w $0000
[000afcd2] 000ae604                  dc.l PICCOLOR01
[000afcd6]                           dc.w $001e
[000afcd8]                           dc.w $000b
[000afcda]                           dc.w $0002
[000afcdc]                           dc.w $0001
_193_COLOR256:
[000afcde]                           dc.w $00c2
[000afce0]                           dc.w $ffff
[000afce2]                           dc.w $ffff
[000afce4]                           dc.w $0018
[000afce6]                           dc.w $0001
[000afce8]                           dc.w $0000
[000afcea] 000ae604                  dc.l PICCOLOR01
[000afcee]                           dc.w $0000
[000afcf0]                           dc.w $000c
[000afcf2]                           dc.w $0002
[000afcf4]                           dc.w $0001
_194_COLOR256:
[000afcf6]                           dc.w $00c3
[000afcf8]                           dc.w $ffff
[000afcfa]                           dc.w $ffff
[000afcfc]                           dc.w $0018
[000afcfe]                           dc.w $0001
[000afd00]                           dc.w $0000
[000afd02] 000ae604                  dc.l PICCOLOR01
[000afd06]                           dc.w $0002
[000afd08]                           dc.w $000c
[000afd0a]                           dc.w $0002
[000afd0c]                           dc.w $0001
_195_COLOR256:
[000afd0e]                           dc.w $00c4
[000afd10]                           dc.w $ffff
[000afd12]                           dc.w $ffff
[000afd14]                           dc.w $0018
[000afd16]                           dc.w $0001
[000afd18]                           dc.w $0000
[000afd1a] 000ae604                  dc.l PICCOLOR01
[000afd1e]                           dc.w $0004
[000afd20]                           dc.w $000c
[000afd22]                           dc.w $0002
[000afd24]                           dc.w $0001
_196_COLOR256:
[000afd26]                           dc.w $00c5
[000afd28]                           dc.w $ffff
[000afd2a]                           dc.w $ffff
[000afd2c]                           dc.w $0018
[000afd2e]                           dc.w $0001
[000afd30]                           dc.w $0000
[000afd32] 000ae604                  dc.l PICCOLOR01
[000afd36]                           dc.w $0006
[000afd38]                           dc.w $000c
[000afd3a]                           dc.w $0002
[000afd3c]                           dc.w $0001
_197_COLOR256:
[000afd3e]                           dc.w $00c6
[000afd40]                           dc.w $ffff
[000afd42]                           dc.w $ffff
[000afd44]                           dc.w $0018
[000afd46]                           dc.w $0001
[000afd48]                           dc.w $0000
[000afd4a] 000ae604                  dc.l PICCOLOR01
[000afd4e]                           dc.w $0008
[000afd50]                           dc.w $000c
[000afd52]                           dc.w $0002
[000afd54]                           dc.w $0001
_198_COLOR256:
[000afd56]                           dc.w $00c7
[000afd58]                           dc.w $ffff
[000afd5a]                           dc.w $ffff
[000afd5c]                           dc.w $0018
[000afd5e]                           dc.w $0001
[000afd60]                           dc.w $0000
[000afd62] 000ae604                  dc.l PICCOLOR01
[000afd66]                           dc.w $000a
[000afd68]                           dc.w $000c
[000afd6a]                           dc.w $0002
[000afd6c]                           dc.w $0001
_199_COLOR256:
[000afd6e]                           dc.w $00c8
[000afd70]                           dc.w $ffff
[000afd72]                           dc.w $ffff
[000afd74]                           dc.w $0018
[000afd76]                           dc.w $0001
[000afd78]                           dc.w $0000
[000afd7a] 000ae604                  dc.l PICCOLOR01
[000afd7e]                           dc.w $000c
[000afd80]                           dc.w $000c
[000afd82]                           dc.w $0002
[000afd84]                           dc.w $0001
_200_COLOR256:
[000afd86]                           dc.w $00c9
[000afd88]                           dc.w $ffff
[000afd8a]                           dc.w $ffff
[000afd8c]                           dc.w $0018
[000afd8e]                           dc.w $0001
[000afd90]                           dc.w $0000
[000afd92] 000ae604                  dc.l PICCOLOR01
[000afd96]                           dc.w $000e
[000afd98]                           dc.w $000c
[000afd9a]                           dc.w $0002
[000afd9c]                           dc.w $0001
_201_COLOR256:
[000afd9e]                           dc.w $00ca
[000afda0]                           dc.w $ffff
[000afda2]                           dc.w $ffff
[000afda4]                           dc.w $0018
[000afda6]                           dc.w $0001
[000afda8]                           dc.w $0000
[000afdaa] 000ae604                  dc.l PICCOLOR01
[000afdae]                           dc.w $0010
[000afdb0]                           dc.w $000c
[000afdb2]                           dc.w $0002
[000afdb4]                           dc.w $0001
_202_COLOR256:
[000afdb6]                           dc.w $00cb
[000afdb8]                           dc.w $ffff
[000afdba]                           dc.w $ffff
[000afdbc]                           dc.w $0018
[000afdbe]                           dc.w $0001
[000afdc0]                           dc.w $0000
[000afdc2] 000ae604                  dc.l PICCOLOR01
[000afdc6]                           dc.w $0012
[000afdc8]                           dc.w $000c
[000afdca]                           dc.w $0002
[000afdcc]                           dc.w $0001
_203_COLOR256:
[000afdce]                           dc.w $00cc
[000afdd0]                           dc.w $ffff
[000afdd2]                           dc.w $ffff
[000afdd4]                           dc.w $0018
[000afdd6]                           dc.w $0001
[000afdd8]                           dc.w $0000
[000afdda] 000ae604                  dc.l PICCOLOR01
[000afdde]                           dc.w $0014
[000afde0]                           dc.w $000c
[000afde2]                           dc.w $0002
[000afde4]                           dc.w $0001
_204_COLOR256:
[000afde6]                           dc.w $00cd
[000afde8]                           dc.w $ffff
[000afdea]                           dc.w $ffff
[000afdec]                           dc.w $0018
[000afdee]                           dc.w $0001
[000afdf0]                           dc.w $0000
[000afdf2] 000ae604                  dc.l PICCOLOR01
[000afdf6]                           dc.w $0016
[000afdf8]                           dc.w $000c
[000afdfa]                           dc.w $0002
[000afdfc]                           dc.w $0001
_205_COLOR256:
[000afdfe]                           dc.w $00ce
[000afe00]                           dc.w $ffff
[000afe02]                           dc.w $ffff
[000afe04]                           dc.w $0018
[000afe06]                           dc.w $0001
[000afe08]                           dc.w $0000
[000afe0a] 000ae604                  dc.l PICCOLOR01
[000afe0e]                           dc.w $0018
[000afe10]                           dc.w $000c
[000afe12]                           dc.w $0002
[000afe14]                           dc.w $0001
_206_COLOR256:
[000afe16]                           dc.w $00cf
[000afe18]                           dc.w $ffff
[000afe1a]                           dc.w $ffff
[000afe1c]                           dc.w $0018
[000afe1e]                           dc.w $0001
[000afe20]                           dc.w $0000
[000afe22] 000ae604                  dc.l PICCOLOR01
[000afe26]                           dc.w $001a
[000afe28]                           dc.w $000c
[000afe2a]                           dc.w $0002
[000afe2c]                           dc.w $0001
_207_COLOR256:
[000afe2e]                           dc.w $00d0
[000afe30]                           dc.w $ffff
[000afe32]                           dc.w $ffff
[000afe34]                           dc.w $0018
[000afe36]                           dc.w $0001
[000afe38]                           dc.w $0000
[000afe3a] 000ae604                  dc.l PICCOLOR01
[000afe3e]                           dc.w $001c
[000afe40]                           dc.w $000c
[000afe42]                           dc.w $0002
[000afe44]                           dc.w $0001
_208_COLOR256:
[000afe46]                           dc.w $00d1
[000afe48]                           dc.w $ffff
[000afe4a]                           dc.w $ffff
[000afe4c]                           dc.w $0018
[000afe4e]                           dc.w $0001
[000afe50]                           dc.w $0000
[000afe52] 000ae604                  dc.l PICCOLOR01
[000afe56]                           dc.w $001e
[000afe58]                           dc.w $000c
[000afe5a]                           dc.w $0002
[000afe5c]                           dc.w $0001
_209_COLOR256:
[000afe5e]                           dc.w $00d2
[000afe60]                           dc.w $ffff
[000afe62]                           dc.w $ffff
[000afe64]                           dc.w $0018
[000afe66]                           dc.w $0001
[000afe68]                           dc.w $0000
[000afe6a] 000ae604                  dc.l PICCOLOR01
[000afe6e]                           dc.w $0000
[000afe70]                           dc.w $000d
[000afe72]                           dc.w $0002
[000afe74]                           dc.w $0001
_210_COLOR256:
[000afe76]                           dc.w $00d3
[000afe78]                           dc.w $ffff
[000afe7a]                           dc.w $ffff
[000afe7c]                           dc.w $0018
[000afe7e]                           dc.w $0001
[000afe80]                           dc.w $0000
[000afe82] 000ae604                  dc.l PICCOLOR01
[000afe86]                           dc.w $0002
[000afe88]                           dc.w $000d
[000afe8a]                           dc.w $0002
[000afe8c]                           dc.w $0001
_211_COLOR256:
[000afe8e]                           dc.w $00d4
[000afe90]                           dc.w $ffff
[000afe92]                           dc.w $ffff
[000afe94]                           dc.w $0018
[000afe96]                           dc.w $0001
[000afe98]                           dc.w $0000
[000afe9a] 000ae604                  dc.l PICCOLOR01
[000afe9e]                           dc.w $0004
[000afea0]                           dc.w $000d
[000afea2]                           dc.w $0002
[000afea4]                           dc.w $0001
_212_COLOR256:
[000afea6]                           dc.w $00d5
[000afea8]                           dc.w $ffff
[000afeaa]                           dc.w $ffff
[000afeac]                           dc.w $0018
[000afeae]                           dc.w $0001
[000afeb0]                           dc.w $0000
[000afeb2] 000ae604                  dc.l PICCOLOR01
[000afeb6]                           dc.w $0006
[000afeb8]                           dc.w $000d
[000afeba]                           dc.w $0002
[000afebc]                           dc.w $0001
_213_COLOR256:
[000afebe]                           dc.w $00d6
[000afec0]                           dc.w $ffff
[000afec2]                           dc.w $ffff
[000afec4]                           dc.w $0018
[000afec6]                           dc.w $0001
[000afec8]                           dc.w $0000
[000afeca] 000ae604                  dc.l PICCOLOR01
[000afece]                           dc.w $0008
[000afed0]                           dc.w $000d
[000afed2]                           dc.w $0002
[000afed4]                           dc.w $0001
_214_COLOR256:
[000afed6]                           dc.w $00d7
[000afed8]                           dc.w $ffff
[000afeda]                           dc.w $ffff
[000afedc]                           dc.w $0018
[000afede]                           dc.w $0001
[000afee0]                           dc.w $0000
[000afee2] 000ae604                  dc.l PICCOLOR01
[000afee6]                           dc.w $000a
[000afee8]                           dc.w $000d
[000afeea]                           dc.w $0002
[000afeec]                           dc.w $0001
_215_COLOR256:
[000afeee]                           dc.w $00d8
[000afef0]                           dc.w $ffff
[000afef2]                           dc.w $ffff
[000afef4]                           dc.w $0018
[000afef6]                           dc.w $0001
[000afef8]                           dc.w $0000
[000afefa] 000ae604                  dc.l PICCOLOR01
[000afefe]                           dc.w $000c
[000aff00]                           dc.w $000d
[000aff02]                           dc.w $0002
[000aff04]                           dc.w $0001
_216_COLOR256:
[000aff06]                           dc.w $00d9
[000aff08]                           dc.w $ffff
[000aff0a]                           dc.w $ffff
[000aff0c]                           dc.w $0018
[000aff0e]                           dc.w $0001
[000aff10]                           dc.w $0000
[000aff12] 000ae604                  dc.l PICCOLOR01
[000aff16]                           dc.w $000e
[000aff18]                           dc.w $000d
[000aff1a]                           dc.w $0002
[000aff1c]                           dc.w $0001
_217_COLOR256:
[000aff1e]                           dc.w $00da
[000aff20]                           dc.w $ffff
[000aff22]                           dc.w $ffff
[000aff24]                           dc.w $0018
[000aff26]                           dc.w $0001
[000aff28]                           dc.w $0000
[000aff2a] 000ae604                  dc.l PICCOLOR01
[000aff2e]                           dc.w $0010
[000aff30]                           dc.w $000d
[000aff32]                           dc.w $0002
[000aff34]                           dc.w $0001
_218_COLOR256:
[000aff36]                           dc.w $00db
[000aff38]                           dc.w $ffff
[000aff3a]                           dc.w $ffff
[000aff3c]                           dc.w $0018
[000aff3e]                           dc.w $0001
[000aff40]                           dc.w $0000
[000aff42] 000ae604                  dc.l PICCOLOR01
[000aff46]                           dc.w $0012
[000aff48]                           dc.w $000d
[000aff4a]                           dc.w $0002
[000aff4c]                           dc.w $0001
_219_COLOR256:
[000aff4e]                           dc.w $00dc
[000aff50]                           dc.w $ffff
[000aff52]                           dc.w $ffff
[000aff54]                           dc.w $0018
[000aff56]                           dc.w $0001
[000aff58]                           dc.w $0000
[000aff5a] 000ae604                  dc.l PICCOLOR01
[000aff5e]                           dc.w $0014
[000aff60]                           dc.w $000d
[000aff62]                           dc.w $0002
[000aff64]                           dc.w $0001
_220_COLOR256:
[000aff66]                           dc.w $00dd
[000aff68]                           dc.w $ffff
[000aff6a]                           dc.w $ffff
[000aff6c]                           dc.w $0018
[000aff6e]                           dc.w $0001
[000aff70]                           dc.w $0000
[000aff72] 000ae604                  dc.l PICCOLOR01
[000aff76]                           dc.w $0016
[000aff78]                           dc.w $000d
[000aff7a]                           dc.w $0002
[000aff7c]                           dc.w $0001
_221_COLOR256:
[000aff7e]                           dc.w $00de
[000aff80]                           dc.w $ffff
[000aff82]                           dc.w $ffff
[000aff84]                           dc.w $0018
[000aff86]                           dc.w $0001
[000aff88]                           dc.w $0000
[000aff8a] 000ae604                  dc.l PICCOLOR01
[000aff8e]                           dc.w $0018
[000aff90]                           dc.w $000d
[000aff92]                           dc.w $0002
[000aff94]                           dc.w $0001
_222_COLOR256:
[000aff96]                           dc.w $00df
[000aff98]                           dc.w $ffff
[000aff9a]                           dc.w $ffff
[000aff9c]                           dc.w $0018
[000aff9e]                           dc.w $0001
[000affa0]                           dc.w $0000
[000affa2] 000ae604                  dc.l PICCOLOR01
[000affa6]                           dc.w $001a
[000affa8]                           dc.w $000d
[000affaa]                           dc.w $0002
[000affac]                           dc.w $0001
_223_COLOR256:
[000affae]                           dc.w $00e0
[000affb0]                           dc.w $ffff
[000affb2]                           dc.w $ffff
[000affb4]                           dc.w $0018
[000affb6]                           dc.w $0001
[000affb8]                           dc.w $0000
[000affba] 000ae604                  dc.l PICCOLOR01
[000affbe]                           dc.w $001c
[000affc0]                           dc.w $000d
[000affc2]                           dc.w $0002
[000affc4]                           dc.w $0001
_224_COLOR256:
[000affc6]                           dc.w $00e1
[000affc8]                           dc.w $ffff
[000affca]                           dc.w $ffff
[000affcc]                           dc.w $0018
[000affce]                           dc.w $0001
[000affd0]                           dc.w $0000
[000affd2] 000ae604                  dc.l PICCOLOR01
[000affd6]                           dc.w $001e
[000affd8]                           dc.w $000d
[000affda]                           dc.w $0002
[000affdc]                           dc.w $0001
_225_COLOR256:
[000affde]                           dc.w $00e2
[000affe0]                           dc.w $ffff
[000affe2]                           dc.w $ffff
[000affe4]                           dc.w $0018
[000affe6]                           dc.w $0001
[000affe8]                           dc.w $0000
[000affea] 000ae604                  dc.l PICCOLOR01
[000affee]                           dc.w $0000
[000afff0]                           dc.w $000e
[000afff2]                           dc.w $0002
[000afff4]                           dc.w $0001
_226_COLOR256:
[000afff6]                           dc.w $00e3
[000afff8]                           dc.w $ffff
[000afffa]                           dc.w $ffff
[000afffc]                           dc.w $0018
[000afffe]                           dc.w $0001
[000b0000]                           dc.w $0000
[000b0002] 000ae604                  dc.l PICCOLOR01
[000b0006]                           dc.w $0002
[000b0008]                           dc.w $000e
[000b000a]                           dc.w $0002
[000b000c]                           dc.w $0001
_227_COLOR256:
[000b000e]                           dc.w $00e4
[000b0010]                           dc.w $ffff
[000b0012]                           dc.w $ffff
[000b0014]                           dc.w $0018
[000b0016]                           dc.w $0001
[000b0018]                           dc.w $0000
[000b001a] 000ae604                  dc.l PICCOLOR01
[000b001e]                           dc.w $0004
[000b0020]                           dc.w $000e
[000b0022]                           dc.w $0002
[000b0024]                           dc.w $0001
_228_COLOR256:
[000b0026]                           dc.w $00e5
[000b0028]                           dc.w $ffff
[000b002a]                           dc.w $ffff
[000b002c]                           dc.w $0018
[000b002e]                           dc.w $0001
[000b0030]                           dc.w $0000
[000b0032] 000ae604                  dc.l PICCOLOR01
[000b0036]                           dc.w $0006
[000b0038]                           dc.w $000e
[000b003a]                           dc.w $0002
[000b003c]                           dc.w $0001
_229_COLOR256:
[000b003e]                           dc.w $00e6
[000b0040]                           dc.w $ffff
[000b0042]                           dc.w $ffff
[000b0044]                           dc.w $0018
[000b0046]                           dc.w $0001
[000b0048]                           dc.w $0000
[000b004a] 000ae604                  dc.l PICCOLOR01
[000b004e]                           dc.w $0008
[000b0050]                           dc.w $000e
[000b0052]                           dc.w $0002
[000b0054]                           dc.w $0001
_230_COLOR256:
[000b0056]                           dc.w $00e7
[000b0058]                           dc.w $ffff
[000b005a]                           dc.w $ffff
[000b005c]                           dc.w $0018
[000b005e]                           dc.w $0001
[000b0060]                           dc.w $0000
[000b0062] 000ae604                  dc.l PICCOLOR01
[000b0066]                           dc.w $000a
[000b0068]                           dc.w $000e
[000b006a]                           dc.w $0002
[000b006c]                           dc.w $0001
_231_COLOR256:
[000b006e]                           dc.w $00e8
[000b0070]                           dc.w $ffff
[000b0072]                           dc.w $ffff
[000b0074]                           dc.w $0018
[000b0076]                           dc.w $0001
[000b0078]                           dc.w $0000
[000b007a] 000ae604                  dc.l PICCOLOR01
[000b007e]                           dc.w $000c
[000b0080]                           dc.w $000e
[000b0082]                           dc.w $0002
[000b0084]                           dc.w $0001
_232_COLOR256:
[000b0086]                           dc.w $00e9
[000b0088]                           dc.w $ffff
[000b008a]                           dc.w $ffff
[000b008c]                           dc.w $0018
[000b008e]                           dc.w $0001
[000b0090]                           dc.w $0000
[000b0092] 000ae604                  dc.l PICCOLOR01
[000b0096]                           dc.w $000e
[000b0098]                           dc.w $000e
[000b009a]                           dc.w $0002
[000b009c]                           dc.w $0001
_233_COLOR256:
[000b009e]                           dc.w $00ea
[000b00a0]                           dc.w $ffff
[000b00a2]                           dc.w $ffff
[000b00a4]                           dc.w $0018
[000b00a6]                           dc.w $0001
[000b00a8]                           dc.w $0000
[000b00aa] 000ae604                  dc.l PICCOLOR01
[000b00ae]                           dc.w $0010
[000b00b0]                           dc.w $000e
[000b00b2]                           dc.w $0002
[000b00b4]                           dc.w $0001
_234_COLOR256:
[000b00b6]                           dc.w $00eb
[000b00b8]                           dc.w $ffff
[000b00ba]                           dc.w $ffff
[000b00bc]                           dc.w $0018
[000b00be]                           dc.w $0001
[000b00c0]                           dc.w $0000
[000b00c2] 000ae604                  dc.l PICCOLOR01
[000b00c6]                           dc.w $0012
[000b00c8]                           dc.w $000e
[000b00ca]                           dc.w $0002
[000b00cc]                           dc.w $0001
_235_COLOR256:
[000b00ce]                           dc.w $00ec
[000b00d0]                           dc.w $ffff
[000b00d2]                           dc.w $ffff
[000b00d4]                           dc.w $0018
[000b00d6]                           dc.w $0001
[000b00d8]                           dc.w $0000
[000b00da] 000ae604                  dc.l PICCOLOR01
[000b00de]                           dc.w $0014
[000b00e0]                           dc.w $000e
[000b00e2]                           dc.w $0002
[000b00e4]                           dc.w $0001
_236_COLOR256:
[000b00e6]                           dc.w $00ed
[000b00e8]                           dc.w $ffff
[000b00ea]                           dc.w $ffff
[000b00ec]                           dc.w $0018
[000b00ee]                           dc.w $0001
[000b00f0]                           dc.w $0000
[000b00f2] 000ae604                  dc.l PICCOLOR01
[000b00f6]                           dc.w $0016
[000b00f8]                           dc.w $000e
[000b00fa]                           dc.w $0002
[000b00fc]                           dc.w $0001
_237_COLOR256:
[000b00fe]                           dc.w $00ee
[000b0100]                           dc.w $ffff
[000b0102]                           dc.w $ffff
[000b0104]                           dc.w $0018
[000b0106]                           dc.w $0001
[000b0108]                           dc.w $0000
[000b010a] 000ae604                  dc.l PICCOLOR01
[000b010e]                           dc.w $0018
[000b0110]                           dc.w $000e
[000b0112]                           dc.w $0002
[000b0114]                           dc.w $0001
_238_COLOR256:
[000b0116]                           dc.w $00ef
[000b0118]                           dc.w $ffff
[000b011a]                           dc.w $ffff
[000b011c]                           dc.w $0018
[000b011e]                           dc.w $0001
[000b0120]                           dc.w $0000
[000b0122] 000ae604                  dc.l PICCOLOR01
[000b0126]                           dc.w $001a
[000b0128]                           dc.w $000e
[000b012a]                           dc.w $0002
[000b012c]                           dc.w $0001
_239_COLOR256:
[000b012e]                           dc.w $00f0
[000b0130]                           dc.w $ffff
[000b0132]                           dc.w $ffff
[000b0134]                           dc.w $0018
[000b0136]                           dc.w $0001
[000b0138]                           dc.w $0000
[000b013a] 000ae604                  dc.l PICCOLOR01
[000b013e]                           dc.w $001c
[000b0140]                           dc.w $000e
[000b0142]                           dc.w $0002
[000b0144]                           dc.w $0001
_240_COLOR256:
[000b0146]                           dc.w $00f1
[000b0148]                           dc.w $ffff
[000b014a]                           dc.w $ffff
[000b014c]                           dc.w $0018
[000b014e]                           dc.w $0001
[000b0150]                           dc.w $0000
[000b0152] 000ae604                  dc.l PICCOLOR01
[000b0156]                           dc.w $001e
[000b0158]                           dc.w $000e
[000b015a]                           dc.w $0002
[000b015c]                           dc.w $0001
_241_COLOR256:
[000b015e]                           dc.w $00f2
[000b0160]                           dc.w $ffff
[000b0162]                           dc.w $ffff
[000b0164]                           dc.w $0018
[000b0166]                           dc.w $0001
[000b0168]                           dc.w $0000
[000b016a] 000ae604                  dc.l PICCOLOR01
[000b016e]                           dc.w $0000
[000b0170]                           dc.w $000f
[000b0172]                           dc.w $0002
[000b0174]                           dc.w $0001
_242_COLOR256:
[000b0176]                           dc.w $00f3
[000b0178]                           dc.w $ffff
[000b017a]                           dc.w $ffff
[000b017c]                           dc.w $0018
[000b017e]                           dc.w $0001
[000b0180]                           dc.w $0000
[000b0182] 000ae604                  dc.l PICCOLOR01
[000b0186]                           dc.w $0002
[000b0188]                           dc.w $000f
[000b018a]                           dc.w $0002
[000b018c]                           dc.w $0001
_243_COLOR256:
[000b018e]                           dc.w $00f4
[000b0190]                           dc.w $ffff
[000b0192]                           dc.w $ffff
[000b0194]                           dc.w $0018
[000b0196]                           dc.w $0001
[000b0198]                           dc.w $0000
[000b019a] 000ae604                  dc.l PICCOLOR01
[000b019e]                           dc.w $0004
[000b01a0]                           dc.w $000f
[000b01a2]                           dc.w $0002
[000b01a4]                           dc.w $0001
_244_COLOR256:
[000b01a6]                           dc.w $00f5
[000b01a8]                           dc.w $ffff
[000b01aa]                           dc.w $ffff
[000b01ac]                           dc.w $0018
[000b01ae]                           dc.w $0001
[000b01b0]                           dc.w $0000
[000b01b2] 000ae604                  dc.l PICCOLOR01
[000b01b6]                           dc.w $0006
[000b01b8]                           dc.w $000f
[000b01ba]                           dc.w $0002
[000b01bc]                           dc.w $0001
_245_COLOR256:
[000b01be]                           dc.w $00f6
[000b01c0]                           dc.w $ffff
[000b01c2]                           dc.w $ffff
[000b01c4]                           dc.w $0018
[000b01c6]                           dc.w $0001
[000b01c8]                           dc.w $0000
[000b01ca] 000ae604                  dc.l PICCOLOR01
[000b01ce]                           dc.w $0008
[000b01d0]                           dc.w $000f
[000b01d2]                           dc.w $0002
[000b01d4]                           dc.w $0001
_246_COLOR256:
[000b01d6]                           dc.w $00f7
[000b01d8]                           dc.w $ffff
[000b01da]                           dc.w $ffff
[000b01dc]                           dc.w $0018
[000b01de]                           dc.w $0001
[000b01e0]                           dc.w $0000
[000b01e2] 000ae604                  dc.l PICCOLOR01
[000b01e6]                           dc.w $000a
[000b01e8]                           dc.w $000f
[000b01ea]                           dc.w $0002
[000b01ec]                           dc.w $0001
_247_COLOR256:
[000b01ee]                           dc.w $00f8
[000b01f0]                           dc.w $ffff
[000b01f2]                           dc.w $ffff
[000b01f4]                           dc.w $0018
[000b01f6]                           dc.w $0001
[000b01f8]                           dc.w $0000
[000b01fa] 000ae604                  dc.l PICCOLOR01
[000b01fe]                           dc.w $000c
[000b0200]                           dc.w $000f
[000b0202]                           dc.w $0002
[000b0204]                           dc.w $0001
_248_COLOR256:
[000b0206]                           dc.w $00f9
[000b0208]                           dc.w $ffff
[000b020a]                           dc.w $ffff
[000b020c]                           dc.w $0018
[000b020e]                           dc.w $0001
[000b0210]                           dc.w $0000
[000b0212] 000ae604                  dc.l PICCOLOR01
[000b0216]                           dc.w $000e
[000b0218]                           dc.w $000f
[000b021a]                           dc.w $0002
[000b021c]                           dc.w $0001
_249_COLOR256:
[000b021e]                           dc.w $00fa
[000b0220]                           dc.w $ffff
[000b0222]                           dc.w $ffff
[000b0224]                           dc.w $0018
[000b0226]                           dc.w $0001
[000b0228]                           dc.w $0000
[000b022a] 000ae604                  dc.l PICCOLOR01
[000b022e]                           dc.w $0010
[000b0230]                           dc.w $000f
[000b0232]                           dc.w $0002
[000b0234]                           dc.w $0001
_250_COLOR256:
[000b0236]                           dc.w $00fb
[000b0238]                           dc.w $ffff
[000b023a]                           dc.w $ffff
[000b023c]                           dc.w $0018
[000b023e]                           dc.w $0001
[000b0240]                           dc.w $0000
[000b0242] 000ae604                  dc.l PICCOLOR01
[000b0246]                           dc.w $0012
[000b0248]                           dc.w $000f
[000b024a]                           dc.w $0002
[000b024c]                           dc.w $0001
_251_COLOR256:
[000b024e]                           dc.w $00fc
[000b0250]                           dc.w $ffff
[000b0252]                           dc.w $ffff
[000b0254]                           dc.w $0018
[000b0256]                           dc.w $0001
[000b0258]                           dc.w $0000
[000b025a] 000ae604                  dc.l PICCOLOR01
[000b025e]                           dc.w $0014
[000b0260]                           dc.w $000f
[000b0262]                           dc.w $0002
[000b0264]                           dc.w $0001
_252_COLOR256:
[000b0266]                           dc.w $00fd
[000b0268]                           dc.w $ffff
[000b026a]                           dc.w $ffff
[000b026c]                           dc.w $0018
[000b026e]                           dc.w $0001
[000b0270]                           dc.w $0000
[000b0272] 000ae604                  dc.l PICCOLOR01
[000b0276]                           dc.w $0016
[000b0278]                           dc.w $000f
[000b027a]                           dc.w $0002
[000b027c]                           dc.w $0001
_253_COLOR256:
[000b027e]                           dc.w $00fe
[000b0280]                           dc.w $ffff
[000b0282]                           dc.w $ffff
[000b0284]                           dc.w $0018
[000b0286]                           dc.w $0001
[000b0288]                           dc.w $0000
[000b028a] 000ae604                  dc.l PICCOLOR01
[000b028e]                           dc.w $0018
[000b0290]                           dc.w $000f
[000b0292]                           dc.w $0002
[000b0294]                           dc.w $0001
_254_COLOR256:
[000b0296]                           dc.w $00ff
[000b0298]                           dc.w $ffff
[000b029a]                           dc.w $ffff
[000b029c]                           dc.w $0018
[000b029e]                           dc.w $0001
[000b02a0]                           dc.w $0000
[000b02a2] 000ae604                  dc.l PICCOLOR01
[000b02a6]                           dc.w $001a
[000b02a8]                           dc.w $000f
[000b02aa]                           dc.w $0002
[000b02ac]                           dc.w $0001
_255_COLOR256:
[000b02ae]                           dc.w $0100
[000b02b0]                           dc.w $ffff
[000b02b2]                           dc.w $ffff
[000b02b4]                           dc.w $0018
[000b02b6]                           dc.w $0001
[000b02b8]                           dc.w $0000
[000b02ba] 000ae604                  dc.l PICCOLOR01
[000b02be]                           dc.w $001c
[000b02c0]                           dc.w $000f
[000b02c2]                           dc.w $0002
[000b02c4]                           dc.w $0001
_256_COLOR256:
[000b02c6]                           dc.w $0000
[000b02c8]                           dc.w $ffff
[000b02ca]                           dc.w $ffff
[000b02cc]                           dc.w $0018
[000b02ce]                           dc.w $0021
[000b02d0]                           dc.w $0000
[000b02d2] 000ae604                  dc.l PICCOLOR01
[000b02d6]                           dc.w $001e
[000b02d8]                           dc.w $000f
[000b02da]                           dc.w $0002
[000b02dc]                           dc.w $0001
EDIT_ICON:
[000b02de]                           dc.w $ffff
[000b02e0]                           dc.w $0001
[000b02e2]                           dc.w $002b
[000b02e4]                           dc.w $0018
[000b02e6]                           dc.w $0040
[000b02e8]                           dc.w $0010
[000b02ea] 000ae3e4                  dc.l A_3DBUTTON16
[000b02ee]                           dc.w $0000
[000b02f0]                           dc.w $0000
[000b02f2]                           dc.w $0038
[000b02f4]                           dc.w $0011
_01_EDIT_ICON:
[000b02f6]                           dc.w $000e
[000b02f8]                           dc.w $0002
[000b02fa]                           dc.w $000a
[000b02fc]                           dc.w $0018
[000b02fe]                           dc.w $0040
[000b0300]                           dc.w $0000
[000b0302] 000ae504                  dc.l A_INNERFRAME02
[000b0306]                           dc.w $001b
[000b0308]                           dc.w $0000
[000b030a]                           dc.w $001d
[000b030c]                           dc.w $0005
_02_EDIT_ICON:
[000b030e]                           dc.w $0004
[000b0310]                           dc.w $0003
[000b0312]                           dc.w $0003
[000b0314]                           dc.w $001c
[000b0316]                           dc.w $0040
[000b0318]                           dc.w $0000
[000b031a] 000ada5f                  dc.l TEXT_10
[000b031e]                           dc.w $0001
[000b0320]                           dc.w $0001
[000b0322]                           dc.w $0006
[000b0324]                           dc.w $0001
_03_EDIT_ICON:
[000b0326]                           dc.w $0002
[000b0328]                           dc.w $ffff
[000b032a]                           dc.w $ffff
[000b032c]                           dc.w $0018
[000b032e]                           dc.w $0040
[000b0330]                           dc.w $0000
[000b0332] 000ae444                  dc.l A_ARROWS02
[000b0336]                           dc.w $0000
[000b0338]                           dc.w $0000
[000b033a]                           dc.w $0001
[000b033c]                           dc.w $0001
_04_EDIT_ICON:
[000b033e]                           dc.w $0008
[000b0340]                           dc.w $0006
[000b0342]                           dc.w $0007
[000b0344]                           dc.w $0014
[000b0346]                           dc.w $0040
[000b0348]                           dc.w $0020
[000b034a]                           dc.w $00ff
[000b034c]                           dc.w $1101
[000b034e]                           dc.w $0009
[000b0350]                           dc.w $0001
[000b0352]                           dc.w $0012
[000b0354]                           dc.w $0001
_04aEDIT_ICON:
[000b0356] 0001e0c6                  dc.l edic_frontcol
[000b035a]                           dc.w $0000
[000b035c]                           dc.w $0000
[000b035e]                           dc.w $8000
[000b0360]                           dc.w $8856
[000b0362]                           dc.w $0000
[000b0364]                           dc.w $0000
[000b0366]                           dc.w $0000
[000b0368]                           dc.w $0000
[000b036a]                           dc.w $0000
[000b036c]                           dc.w $0000
_06_EDIT_ICON:
[000b036e]                           dc.w $0007
[000b0370]                           dc.w $ffff
[000b0372]                           dc.w $ffff
[000b0374]                           dc.w $0014
[000b0376]                           dc.w $0000
[000b0378]                           dc.w $0000
[000b037a]                           dc.w $0001
[000b037c]                           dc.w $1171
[000b037e]                           dc.w $0010
[000b0380]                           dc.w $0000
[000b0382]                           dc.w $0002
[000b0384]                           dc.w $0001
_07_EDIT_ICON:
[000b0386]                           dc.w $0004
[000b0388]                           dc.w $ffff
[000b038a]                           dc.w $ffff
[000b038c]                           dc.w $0018
[000b038e]                           dc.w $0000
[000b0390]                           dc.w $0000
[000b0392] 000ae424                  dc.l A_3DBUTTON27
[000b0396]                           dc.w $0000
[000b0398]                           dc.w $0000
[000b039a]                           dc.w $0010
[000b039c]                           dc.w $0001
_08_EDIT_ICON:
[000b039e]                           dc.w $000a
[000b03a0]                           dc.w $0009
[000b03a2]                           dc.w $0009
[000b03a4]                           dc.w $001c
[000b03a6]                           dc.w $0040
[000b03a8]                           dc.w $0000
[000b03aa] 000ada57                  dc.l TEXT_09
[000b03ae]                           dc.w $0001
[000b03b0]                           dc.w $0003
[000b03b2]                           dc.w $0007
[000b03b4]                           dc.w $0001
_09_EDIT_ICON:
[000b03b6]                           dc.w $0008
[000b03b8]                           dc.w $ffff
[000b03ba]                           dc.w $ffff
[000b03bc]                           dc.w $0018
[000b03be]                           dc.w $0040
[000b03c0]                           dc.w $0000
[000b03c2] 000ae444                  dc.l A_ARROWS02
[000b03c6]                           dc.w $0000
[000b03c8]                           dc.w $0000
[000b03ca]                           dc.w $0001
[000b03cc]                           dc.w $0001
_10_EDIT_ICON:
[000b03ce]                           dc.w $0001
[000b03d0]                           dc.w $000c
[000b03d2]                           dc.w $000d
[000b03d4]                           dc.w $0014
[000b03d6]                           dc.w $0040
[000b03d8]                           dc.w $0020
[000b03da]                           dc.w $00ff
[000b03dc]                           dc.w $1101
[000b03de]                           dc.w $0009
[000b03e0]                           dc.w $0003
[000b03e2]                           dc.w $0012
[000b03e4]                           dc.w $0001
_10aEDIT_ICON:
[000b03e6] 0001e064                  dc.l edic_backcol
[000b03ea]                           dc.w $0000
[000b03ec]                           dc.w $0000
[000b03ee]                           dc.w $8000
[000b03f0]                           dc.w $8848
[000b03f2]                           dc.w $0000
[000b03f4]                           dc.w $0000
[000b03f6]                           dc.w $0000
[000b03f8]                           dc.w $0000
[000b03fa]                           dc.w $0000
[000b03fc]                           dc.w $0000
_12_EDIT_ICON:
[000b03fe]                           dc.w $000d
[000b0400]                           dc.w $ffff
[000b0402]                           dc.w $ffff
[000b0404]                           dc.w $0014
[000b0406]                           dc.w $0000
[000b0408]                           dc.w $0000
[000b040a]                           dc.w $0001
[000b040c]                           dc.w $1171
[000b040e]                           dc.w $0010
[000b0410]                           dc.w $0000
[000b0412]                           dc.w $0002
[000b0414]                           dc.w $0001
_13_EDIT_ICON:
[000b0416]                           dc.w $000a
[000b0418]                           dc.w $ffff
[000b041a]                           dc.w $ffff
[000b041c]                           dc.w $0018
[000b041e]                           dc.w $0000
[000b0420]                           dc.w $0000
[000b0422] 000ae424                  dc.l A_3DBUTTON27
[000b0426]                           dc.w $0000
[000b0428]                           dc.w $0000
[000b042a]                           dc.w $0010
[000b042c]                           dc.w $0001
_14_EDIT_ICON:
[000b042e]                           dc.w $0015
[000b0430]                           dc.w $0010
[000b0432]                           dc.w $0010
[000b0434]                           dc.w $0018
[000b0436]                           dc.w $1000
[000b0438]                           dc.w $0010
[000b043a] 000ae384                  dc.l A_3DBUTTON13
[000b043e]                           dc.w $0002
[000b0440]                           dc.w $0001
[000b0442]                           dc.w $0018
[000b0444]                           dc.w $000c
_14aEDIT_ICON:
[000b0446]                           dc.w $0000
[000b0448]                           dc.w $0000
[000b044a] 0001ff0e                  dc.l edic_acc
[000b044e]                           dc.w $8000
[000b0450]                           dc.w $0000
[000b0452]                           dc.w $0000
[000b0454]                           dc.w $0000
[000b0456]                           dc.w $0000
[000b0458]                           dc.w $0000
[000b045a]                           dc.w $0000
[000b045c]                           dc.w $0000
_16_EDIT_ICON:
[000b045e]                           dc.w $000e
[000b0460]                           dc.w $0012
[000b0462]                           dc.w $0013
[000b0464]                           dc.w $001f
[000b0466]                           dc.w $0040
[000b0468]                           dc.w $0000
[000b046a] 000ae764                  dc.l ICON_001
[000b046e]                           dc.w $0000
[000b0470]                           dc.w $0000
[000b0472]                           dc.w $0018
[000b0474]                           dc.w $000c
_16aEDIT_ICON:
[000b0476] 0001f22a                  dc.l edic_control
[000b047a]                           dc.w $0000
[000b047c]                           dc.w $0000
[000b047e]                           dc.w $8000
[000b0480]                           dc.w $0000
[000b0482]                           dc.w $0000
[000b0484]                           dc.w $0000
[000b0486]                           dc.w $0000
[000b0488]                           dc.w $0000
[000b048a]                           dc.w $0000
[000b048c]                           dc.w $0000
_18_EDIT_ICON:
[000b048e]                           dc.w $0013
[000b0490]                           dc.w $ffff
[000b0492]                           dc.w $ffff
[000b0494]                           dc.w $0018
[000b0496]                           dc.w $0080
[000b0498]                           dc.w $0011
[000b049a] 000ae624                  dc.l USER_001
[000b049e]                           dc.w $0003
[000b04a0]                           dc.w $0001
[000b04a2]                           dc.w $0008
[000b04a4]                           dc.w $0003
_19_EDIT_ICON:
[000b04a6]                           dc.w $0010
[000b04a8]                           dc.w $ffff
[000b04aa]                           dc.w $ffff
[000b04ac]                           dc.w $0019
[000b04ae]                           dc.w $2000
[000b04b0]                           dc.w $0000
[000b04b2]                           dc.w $00ff
[000b04b4]                           dc.w $1101
[000b04b6]                           dc.w $0000
[000b04b8]                           dc.w $0000
[000b04ba]                           dc.w $0004
[000b04bc]                           dc.w $0001
_19aEDIT_ICON:
[000b04be]                           dc.w $0000
[000b04c0]                           dc.w $0000
[000b04c2]                           dc.w $0000
[000b04c4]                           dc.w $0000
[000b04c6]                           dc.w $8000
[000b04c8]                           dc.w $0000
[000b04ca]                           dc.w $0000
[000b04cc]                           dc.w $0000
[000b04ce]                           dc.w $0000
[000b04d0]                           dc.w $0000
[000b04d2]                           dc.w $0000
[000b04d4]                           dc.w $000a
_21_EDIT_ICON:
[000b04d6]                           dc.w $001c
[000b04d8]                           dc.w $0016
[000b04da]                           dc.w $0018
[000b04dc]                           dc.w $0018
[000b04de]                           dc.w $0040
[000b04e0]                           dc.w $0000
[000b04e2] 000ae524                  dc.l A_INNERFRAME03
[000b04e6]                           dc.w $001b
[000b04e8]                           dc.w $0005
[000b04ea]                           dc.w $001d
[000b04ec]                           dc.w $0004
_22_EDIT_ICON:
[000b04ee]                           dc.w $0017
[000b04f0]                           dc.w $ffff
[000b04f2]                           dc.w $ffff
[000b04f4]                           dc.w $001c
[000b04f6]                           dc.w $0040
[000b04f8]                           dc.w $0000
[000b04fa] 000ada7b                  dc.l TEXT_16
[000b04fe]                           dc.w $0001
[000b0500]                           dc.w $0001
[000b0502]                           dc.w $0005
[000b0504]                           dc.w $0001
_23_EDIT_ICON:
[000b0506]                           dc.w $0018
[000b0508]                           dc.w $ffff
[000b050a]                           dc.w $ffff
[000b050c]                           dc.w $001c
[000b050e]                           dc.w $0040
[000b0510]                           dc.w $0000
[000b0512] 000ada6f                  dc.l TEXT_14
[000b0516]                           dc.w $0001
[000b0518]                           dc.w $0002
[000b051a]                           dc.w $0005
[000b051c]                           dc.w $0001
_24_EDIT_ICON:
[000b051e]                           dc.w $0015
[000b0520]                           dc.w $0019
[000b0522]                           dc.w $0019
[000b0524]                           dc.w $0018
[000b0526]                           dc.w $0040
[000b0528]                           dc.w $0000
[000b052a] 000ae284                  dc.l A_3DBUTTON04
[000b052e]                           dc.w $0007
[000b0530]                           dc.w $0001
[000b0532]                           dc.w $0014
[000b0534]                           dc.w $0002
_25_EDIT_ICON:
[000b0536]                           dc.w $0018
[000b0538]                           dc.w $001a
[000b053a]                           dc.w $001b
[000b053c]                           dc.w $0014
[000b053e]                           dc.w $0040
[000b0540]                           dc.w $0000
[000b0542]                           dc.w $00ff
[000b0544]                           dc.w $0101
[000b0546]                           dc.w $0000
[000b0548]                           dc.w $0000
[000b054a]                           dc.w $0014
[000b054c]                           dc.w $0002
_26_EDIT_ICON:
[000b054e]                           dc.w $001b
[000b0550]                           dc.w $ffff
[000b0552]                           dc.w $ffff
[000b0554]                           dc.w $0018
[000b0556]                           dc.w $0008
[000b0558]                           dc.w $0000
[000b055a] 000ae4c4                  dc.l A_BOXED05
[000b055e]                           dc.w $0000
[000b0560]                           dc.w $0000
[000b0562]                           dc.w $0014
[000b0564]                           dc.w $0001
_27_EDIT_ICON:
[000b0566]                           dc.w $0019
[000b0568]                           dc.w $ffff
[000b056a]                           dc.w $ffff
[000b056c]                           dc.w $0018
[000b056e]                           dc.w $0008
[000b0570]                           dc.w $0000
[000b0572] 000ae484                  dc.l A_BOXED02
[000b0576]                           dc.w $0000
[000b0578]                           dc.w $0001
[000b057a]                           dc.w $0001
[000b057c]                           dc.w $0001
_28_EDIT_ICON:
[000b057e]                           dc.w $0025
[000b0580]                           dc.w $001d
[000b0582]                           dc.w $0023
[000b0584]                           dc.w $0018
[000b0586]                           dc.w $0040
[000b0588]                           dc.w $0000
[000b058a] 000ae544                  dc.l A_INNERFRAME04
[000b058e]                           dc.w $001b
[000b0590]                           dc.w $0009
[000b0592]                           dc.w $001d
[000b0594]                           dc.w $0005
_29_EDIT_ICON:
[000b0596]                           dc.w $001f
[000b0598]                           dc.w $ffff
[000b059a]                           dc.w $ffff
[000b059c]                           dc.w $0018
[000b059e]                           dc.w $0005
[000b05a0]                           dc.w $0010
[000b05a2] 000ae264                  dc.l A_3DBUTTON03
[000b05a6]                           dc.w $0001
[000b05a8]                           dc.w $0001
[000b05aa]                           dc.w $000d
[000b05ac]                           dc.w $0001
_29aEDIT_ICON:
[000b05ae] 0001fd54                  dc.l edic_newplane
[000b05b2]                           dc.w $0000
[000b05b4]                           dc.w $0000
[000b05b6]                           dc.w $8000
[000b05b8]                           dc.w $884c
[000b05ba]                           dc.w $0000
[000b05bc]                           dc.w $0000
[000b05be]                           dc.w $0000
[000b05c0]                           dc.w $0000
[000b05c2]                           dc.w $0000
[000b05c4]                           dc.w $0000
_31_EDIT_ICON:
[000b05c6]                           dc.w $0021
[000b05c8]                           dc.w $ffff
[000b05ca]                           dc.w $ffff
[000b05cc]                           dc.w $0018
[000b05ce]                           dc.w $0005
[000b05d0]                           dc.w $0010
[000b05d2] 000ae3a4                  dc.l A_3DBUTTON14
[000b05d6]                           dc.w $0001
[000b05d8]                           dc.w $0003
[000b05da]                           dc.w $000d
[000b05dc]                           dc.w $0001
_31aEDIT_ICON:
[000b05de] 0001eece                  dc.l edic_select
[000b05e2]                           dc.w $0000
[000b05e4]                           dc.w $0000
[000b05e6]                           dc.w $8000
[000b05e8]                           dc.w $884b
[000b05ea]                           dc.w $0000
[000b05ec]                           dc.w $0000
[000b05ee]                           dc.w $0000
[000b05f0]                           dc.w $0000
[000b05f2]                           dc.w $0000
[000b05f4]                           dc.w $0000
_33_EDIT_ICON:
[000b05f6]                           dc.w $0023
[000b05f8]                           dc.w $ffff
[000b05fa]                           dc.w $ffff
[000b05fc]                           dc.w $0018
[000b05fe]                           dc.w $0005
[000b0600]                           dc.w $0010
[000b0602] 000ae2c4                  dc.l A_3DBUTTON06
[000b0606]                           dc.w $000f
[000b0608]                           dc.w $0001
[000b060a]                           dc.w $000d
[000b060c]                           dc.w $0001
_33aEDIT_ICON:
[000b060e] 00020314                  dc.l edic_delplane
[000b0612]                           dc.w $0000
[000b0614]                           dc.w $0000
[000b0616]                           dc.w $8000
[000b0618]                           dc.w $8853
[000b061a]                           dc.w $0000
[000b061c]                           dc.w $0000
[000b061e]                           dc.w $0000
[000b0620]                           dc.w $0000
[000b0622]                           dc.w $0000
[000b0624]                           dc.w $0000
_35_EDIT_ICON:
[000b0626]                           dc.w $001c
[000b0628]                           dc.w $ffff
[000b062a]                           dc.w $ffff
[000b062c]                           dc.w $0018
[000b062e]                           dc.w $0005
[000b0630]                           dc.w $0000
[000b0632] 000ae364                  dc.l A_3DBUTTON12
[000b0636]                           dc.w $000f
[000b0638]                           dc.w $0003
[000b063a]                           dc.w $000d
[000b063c]                           dc.w $0001
_35aEDIT_ICON:
[000b063e] 0001e62e                  dc.l edic_nextpattern
[000b0642]                           dc.w $0000
[000b0644]                           dc.w $0000
[000b0646]                           dc.w $8000
[000b0648]                           dc.w $0000
[000b064a]                           dc.w $0000
[000b064c]                           dc.w $0000
[000b064e]                           dc.w $0000
[000b0650]                           dc.w $0000
[000b0652]                           dc.w $0000
[000b0654]                           dc.w $0000
_37_EDIT_ICON:
[000b0656]                           dc.w $0027
[000b0658]                           dc.w $ffff
[000b065a]                           dc.w $ffff
[000b065c]                           dc.w $0018
[000b065e]                           dc.w $0005
[000b0660]                           dc.w $0010
[000b0662] 000ae244                  dc.l A_3DBUTTON02
[000b0666]                           dc.w $0001
[000b0668]                           dc.w $000e
[000b066a]                           dc.w $000c
[000b066c]                           dc.w $0002
_37aEDIT_ICON:
[000b066e] 000208aa                  dc.l edic_edit
[000b0672]                           dc.w $0000
[000b0674]                           dc.w $0000
[000b0676]                           dc.w $8000
[000b0678]                           dc.w $8845
[000b067a]                           dc.w $0000
[000b067c]                           dc.w $0000
[000b067e]                           dc.w $0000
[000b0680]                           dc.w $0000
[000b0682]                           dc.w $0000
[000b0684]                           dc.w $0000
_39_EDIT_ICON:
[000b0686]                           dc.w $0029
[000b0688]                           dc.w $ffff
[000b068a]                           dc.w $ffff
[000b068c]                           dc.w $0018
[000b068e]                           dc.w $0005
[000b0690]                           dc.w $0010
[000b0692] 000ae324                  dc.l A_3DBUTTON10
[000b0696]                           dc.w $000f
[000b0698]                           dc.w $000e
[000b069a]                           dc.w $000c
[000b069c]                           dc.w $0002
_39aEDIT_ICON:
[000b069e] 0001ec9c                  dc.l edic_direct
[000b06a2]                           dc.w $0000
[000b06a4]                           dc.w $0000
[000b06a6]                           dc.w $8000
[000b06a8]                           dc.w $8855
[000b06aa]                           dc.w $0000
[000b06ac]                           dc.w $0000
[000b06ae]                           dc.w $0000
[000b06b0]                           dc.w $0000
[000b06b2]                           dc.w $0000
[000b06b4]                           dc.w $0000
_41_EDIT_ICON:
[000b06b6]                           dc.w $002b
[000b06b8]                           dc.w $ffff
[000b06ba]                           dc.w $ffff
[000b06bc]                           dc.w $0018
[000b06be]                           dc.w $4007
[000b06c0]                           dc.w $0010
[000b06c2] 000ae3c4                  dc.l A_3DBUTTON15
[000b06c6]                           dc.w $001d
[000b06c8]                           dc.w $000e
[000b06ca]                           dc.w $000c
[000b06cc]                           dc.w $0002
_41aEDIT_ICON:
[000b06ce] 0001fd32                  dc.l edic_ok
[000b06d2]                           dc.w $0000
[000b06d4]                           dc.w $0000
[000b06d6]                           dc.w $8000
[000b06d8]                           dc.w $884f
[000b06da]                           dc.w $0000
[000b06dc]                           dc.w $0000
[000b06de]                           dc.w $0000
[000b06e0]                           dc.w $0000
[000b06e2]                           dc.w $0000
[000b06e4]                           dc.w $0000
_43_EDIT_ICON:
[000b06e6]                           dc.w $0000
[000b06e8]                           dc.w $ffff
[000b06ea]                           dc.w $ffff
[000b06ec]                           dc.w $0018
[000b06ee]                           dc.w $4005
[000b06f0]                           dc.w $0010
[000b06f2] 000ae404                  dc.l A_3DBUTTON18
[000b06f6]                           dc.w $002b
[000b06f8]                           dc.w $000e
[000b06fa]                           dc.w $000c
[000b06fc]                           dc.w $0002
_43aEDIT_ICON:
[000b06fe] 0001fd20                  dc.l edic_abort
[000b0702]                           dc.w $0000
[000b0704]                           dc.w $0000
[000b0706]                           dc.w $8020
[000b0708]                           dc.w $8841
[000b070a]                           dc.w $0000
[000b070c]                           dc.w $0000
[000b070e]                           dc.w $0000
[000b0710]                           dc.w $0000
[000b0712]                           dc.w $0000
[000b0714]                           dc.w $0000
EDIT_ICON2:
[000b0716]                           dc.w $ffff
[000b0718]                           dc.w $0001
[000b071a]                           dc.w $001a
[000b071c]                           dc.w $0018
[000b071e]                           dc.w $0040
[000b0720]                           dc.w $0010
[000b0722] 000ae224                  dc.l A_3DBUTTON01
[000b0726]                           dc.w $0000
[000b0728]                           dc.w $0000
[000b072a]                           dc.w $0032
[000b072c]                           dc.w $0009
_01_EDIT_ICON2:
[000b072e]                           dc.w $0003
[000b0730]                           dc.w $0002
[000b0732]                           dc.w $0002
[000b0734]                           dc.w $0018
[000b0736]                           dc.w $0000
[000b0738]                           dc.w $0010
[000b073a] 000ae3e4                  dc.l A_3DBUTTON16
[000b073e]                           dc.w $0000
[000b0740]                           dc.w $0000
[000b0742]                           dc.w $0006
[000b0744]                           dc.w $0003
_02_EDIT_ICON2:
[000b0746]                           dc.w $0001
[000b0748]                           dc.w $ffff
[000b074a]                           dc.w $ffff
[000b074c]                           dc.w $0018
[000b074e]                           dc.w $0040
[000b0750]                           dc.w $0000
[000b0752] 000ae5e4                  dc.l ICNCOL01
[000b0756]                           dc.w $0002
[000b0758]                           dc.w $0001
[000b075a]                           dc.w $0002
[000b075c]                           dc.w $0001
_03_EDIT_ICON2:
[000b075e]                           dc.w $000a
[000b0760]                           dc.w $0004
[000b0762]                           dc.w $0008
[000b0764]                           dc.w $0018
[000b0766]                           dc.w $0040
[000b0768]                           dc.w $0000
[000b076a] 000ae564                  dc.l A_INNERFRAME05
[000b076e]                           dc.w $0006
[000b0770]                           dc.w $0000
[000b0772]                           dc.w $000a
[000b0774]                           dc.w $0003
_04_EDIT_ICON2:
[000b0776]                           dc.w $0006
[000b0778]                           dc.w $ffff
[000b077a]                           dc.w $ffff
[000b077c]                           dc.w $0014
[000b077e]                           dc.w $0005
[000b0780]                           dc.w $0000
[000b0782]                           dc.w $0001
[000b0784]                           dc.w $1170
[000b0786]                           dc.w $0001
[000b0788]                           dc.w $0001
[000b078a]                           dc.w $0002
[000b078c]                           dc.w $0001
_04aEDIT_ICON2:
[000b078e] 0001e5a4                  dc.l edic_white
[000b0792]                           dc.w $0000
[000b0794]                           dc.w $0000
[000b0796]                           dc.w $8000
[000b0798]                           dc.w $0057
[000b079a]                           dc.w $0000
[000b079c]                           dc.w $0000
[000b079e]                           dc.w $0000
[000b07a0]                           dc.w $0000
[000b07a2]                           dc.w $0000
[000b07a4]                           dc.w $0000
_06_EDIT_ICON2:
[000b07a6]                           dc.w $0008
[000b07a8]                           dc.w $ffff
[000b07aa]                           dc.w $ffff
[000b07ac]                           dc.w $0014
[000b07ae]                           dc.w $0005
[000b07b0]                           dc.w $0000
[000b07b2]                           dc.w $0001
[000b07b4]                           dc.w $0171
[000b07b6]                           dc.w $0004
[000b07b8]                           dc.w $0001
[000b07ba]                           dc.w $0002
[000b07bc]                           dc.w $0001
_06aEDIT_ICON2:
[000b07be] 0001e52a                  dc.l edic_black
[000b07c2]                           dc.w $0000
[000b07c4]                           dc.w $0000
[000b07c6]                           dc.w $8000
[000b07c8]                           dc.w $0053
[000b07ca]                           dc.w $0000
[000b07cc]                           dc.w $0000
[000b07ce]                           dc.w $0000
[000b07d0]                           dc.w $0000
[000b07d2]                           dc.w $0000
[000b07d4]                           dc.w $0000
_08_EDIT_ICON2:
[000b07d6]                           dc.w $0003
[000b07d8]                           dc.w $ffff
[000b07da]                           dc.w $ffff
[000b07dc]                           dc.w $0014
[000b07de]                           dc.w $0005
[000b07e0]                           dc.w $0000
[000b07e2]                           dc.w $0001
[000b07e4]                           dc.w $1141
[000b07e6]                           dc.w $0007
[000b07e8]                           dc.w $0001
[000b07ea]                           dc.w $0002
[000b07ec]                           dc.w $0001
_08aEDIT_ICON2:
[000b07ee] 0001e5e6                  dc.l edic_invisible
[000b07f2]                           dc.w $0000
[000b07f4]                           dc.w $0000
[000b07f6]                           dc.w $8000
[000b07f8]                           dc.w $0054
[000b07fa]                           dc.w $0000
[000b07fc]                           dc.w $0000
[000b07fe]                           dc.w $0000
[000b0800]                           dc.w $0000
[000b0802]                           dc.w $0000
[000b0804]                           dc.w $0000
_10_EDIT_ICON2:
[000b0806]                           dc.w $000f
[000b0808]                           dc.w $000b
[000b080a]                           dc.w $000d
[000b080c]                           dc.w $0018
[000b080e]                           dc.w $0040
[000b0810]                           dc.w $0000
[000b0812] 000ae584                  dc.l A_INNERFRAME06
[000b0816]                           dc.w $0010
[000b0818]                           dc.w $0000
[000b081a]                           dc.w $000a
[000b081c]                           dc.w $0003
_11_EDIT_ICON2:
[000b081e]                           dc.w $000d
[000b0820]                           dc.w $ffff
[000b0822]                           dc.w $ffff
[000b0824]                           dc.w $0015
[000b0826]                           dc.w $0005
[000b0828]                           dc.w $0000
[000b082a] 000ae1ec                  dc.l TEDINFO_01
[000b082e]                           dc.w $0001
[000b0830]                           dc.w $0001
[000b0832]                           dc.w $0005
[000b0834]                           dc.w $0001
_11aEDIT_ICON2:
[000b0836] 0001e44e                  dc.l edic_thin
[000b083a]                           dc.w $0000
[000b083c]                           dc.w $0000
[000b083e]                           dc.w $8000
[000b0840]                           dc.w $0044
[000b0842]                           dc.w $0000
[000b0844]                           dc.w $0000
[000b0846]                           dc.w $0000
[000b0848]                           dc.w $0000
[000b084a]                           dc.w $0000
[000b084c]                           dc.w $0000
_13_EDIT_ICON2:
[000b084e]                           dc.w $000a
[000b0850]                           dc.w $ffff
[000b0852]                           dc.w $ffff
[000b0854]                           dc.w $0015
[000b0856]                           dc.w $0005
[000b0858]                           dc.w $0000
[000b085a] 000ae208                  dc.l TEDINFO_02
[000b085e]                           dc.w $0005
[000b0860]                           dc.w $0001
[000b0862]                           dc.w $0004
[000b0864]                           dc.w $0001
_13aEDIT_ICON2:
[000b0866] 0001e486                  dc.l edic_thick
[000b086a]                           dc.w $0000
[000b086c]                           dc.w $0000
[000b086e]                           dc.w $8000
[000b0870]                           dc.w $0046
[000b0872]                           dc.w $0000
[000b0874]                           dc.w $0000
[000b0876]                           dc.w $0000
[000b0878]                           dc.w $0000
[000b087a]                           dc.w $0000
[000b087c]                           dc.w $0000
_15_EDIT_ICON2:
[000b087e]                           dc.w $0018
[000b0880]                           dc.w $0010
[000b0882]                           dc.w $0016
[000b0884]                           dc.w $0018
[000b0886]                           dc.w $0040
[000b0888]                           dc.w $0000
[000b088a] 000ae5a4                  dc.l A_INNERFRAME07
[000b088e]                           dc.w $001a
[000b0890]                           dc.w $0000
[000b0892]                           dc.w $000a
[000b0894]                           dc.w $0003
_16_EDIT_ICON2:
[000b0896]                           dc.w $0012
[000b0898]                           dc.w $ffff
[000b089a]                           dc.w $ffff
[000b089c]                           dc.w $001b
[000b089e]                           dc.w $0005
[000b08a0]                           dc.w $0000
[000b08a2]                           dc.w $0400
[000b08a4]                           dc.w $1101
[000b08a6]                           dc.w $0001
[000b08a8]                           dc.w $0001
[000b08aa]                           dc.w $0002
[000b08ac]                           dc.w $0001
_16aEDIT_ICON2:
[000b08ae] 0001f186                  dc.l edic_left
[000b08b2]                           dc.w $0000
[000b08b4]                           dc.w $0000
[000b08b6]                           dc.w $8000
[000b08b8]                           dc.w $8004
[000b08ba]                           dc.w $0000
[000b08bc]                           dc.w $0000
[000b08be]                           dc.w $0000
[000b08c0]                           dc.w $0000
[000b08c2]                           dc.w $0000
[000b08c4]                           dc.w $0000
_18_EDIT_ICON2:
[000b08c6]                           dc.w $0014
[000b08c8]                           dc.w $ffff
[000b08ca]                           dc.w $ffff
[000b08cc]                           dc.w $001b
[000b08ce]                           dc.w $0005
[000b08d0]                           dc.w $0000
[000b08d2]                           dc.w $0100
[000b08d4]                           dc.w $1101
[000b08d6]                           dc.w $0003
[000b08d8]                           dc.w $0001
[000b08da]                           dc.w $0002
[000b08dc]                           dc.w $0001
_18aEDIT_ICON2:
[000b08de] 0001f150                  dc.l edic_up
[000b08e2]                           dc.w $0000
[000b08e4]                           dc.w $0000
[000b08e6]                           dc.w $8000
[000b08e8]                           dc.w $8001
[000b08ea]                           dc.w $0000
[000b08ec]                           dc.w $0000
[000b08ee]                           dc.w $0000
[000b08f0]                           dc.w $0000
[000b08f2]                           dc.w $0000
[000b08f4]                           dc.w $0000
_20_EDIT_ICON2:
[000b08f6]                           dc.w $0016
[000b08f8]                           dc.w $ffff
[000b08fa]                           dc.w $ffff
[000b08fc]                           dc.w $001b
[000b08fe]                           dc.w $0005
[000b0900]                           dc.w $0000
[000b0902]                           dc.w $0200
[000b0904]                           dc.w $1101
[000b0906]                           dc.w $0005
[000b0908]                           dc.w $0001
[000b090a]                           dc.w $0002
[000b090c]                           dc.w $0001
_20aEDIT_ICON2:
[000b090e] 0001f162                  dc.l edic_down
[000b0912]                           dc.w $0000
[000b0914]                           dc.w $0000
[000b0916]                           dc.w $8000
[000b0918]                           dc.w $8002
[000b091a]                           dc.w $0000
[000b091c]                           dc.w $0000
[000b091e]                           dc.w $0000
[000b0920]                           dc.w $0000
[000b0922]                           dc.w $0000
[000b0924]                           dc.w $0000
_22_EDIT_ICON2:
[000b0926]                           dc.w $000f
[000b0928]                           dc.w $ffff
[000b092a]                           dc.w $ffff
[000b092c]                           dc.w $001b
[000b092e]                           dc.w $0005
[000b0930]                           dc.w $0000
[000b0932]                           dc.w $0300
[000b0934]                           dc.w $1101
[000b0936]                           dc.w $0007
[000b0938]                           dc.w $0001
[000b093a]                           dc.w $0002
[000b093c]                           dc.w $0001
_22aEDIT_ICON2:
[000b093e] 0001f174                  dc.l edic_right
[000b0942]                           dc.w $0000
[000b0944]                           dc.w $0000
[000b0946]                           dc.w $8000
[000b0948]                           dc.w $8003
[000b094a]                           dc.w $0000
[000b094c]                           dc.w $0000
[000b094e]                           dc.w $0000
[000b0950]                           dc.w $0000
[000b0952]                           dc.w $0000
[000b0954]                           dc.w $0000
_24_EDIT_ICON2:
[000b0956]                           dc.w $001a
[000b0958]                           dc.w $ffff
[000b095a]                           dc.w $ffff
[000b095c]                           dc.w $0018
[000b095e]                           dc.w $0007
[000b0960]                           dc.w $0010
[000b0962] 000ae2e4                  dc.l A_3DBUTTON07
[000b0966]                           dc.w $0025
[000b0968]                           dc.w $0001
[000b096a]                           dc.w $000c
[000b096c]                           dc.w $0002
_24aEDIT_ICON2:
[000b096e] 00020a3a                  dc.l edic_struct
[000b0972]                           dc.w $0000
[000b0974]                           dc.w $0000
[000b0976]                           dc.w $8000
[000b0978]                           dc.w $8853
[000b097a]                           dc.w $0000
[000b097c]                           dc.w $0000
[000b097e]                           dc.w $0000
[000b0980]                           dc.w $0000
[000b0982]                           dc.w $0000
[000b0984]                           dc.w $0000
_26_EDIT_ICON2:
[000b0986]                           dc.w $0000
[000b0988]                           dc.w $001b
[000b098a]                           dc.w $001b
[000b098c]                           dc.w $0018
[000b098e]                           dc.w $0000
[000b0990]                           dc.w $0010
[000b0992] 000ae344                  dc.l A_3DBUTTON11
[000b0996]                           dc.w $0002
[000b0998]                           dc.w $0004
[000b099a]                           dc.w $000e
[000b099c]                           dc.w $0004
_27_EDIT_ICON2:
[000b099e]                           dc.w $001a
[000b09a0]                           dc.w $ffff
[000b09a2]                           dc.w $ffff
[000b09a4]                           dc.w $0018
[000b09a6]                           dc.w $0040
[000b09a8]                           dc.w $0000
[000b09aa] 000ae5c4                  dc.l EDIC_BITMAP01
[000b09ae]                           dc.w $0000
[000b09b0]                           dc.w $0000
[000b09b2]                           dc.w $000e
[000b09b4]                           dc.w $0004
_27aEDIT_ICON2:
[000b09b6] 0001f8e2                  dc.l edic_set
[000b09ba]                           dc.w $0000
[000b09bc]                           dc.w $0000
[000b09be]                           dc.w $8020
[000b09c0]                           dc.w $0000
[000b09c2]                           dc.w $0000
[000b09c4]                           dc.w $0000
[000b09c6]                           dc.w $0000
[000b09c8]                           dc.w $0000
[000b09ca]                           dc.w $0008
[000b09cc]                           dc.w $0000
IC_POS:
[000b09ce]                           dc.w $ffff
[000b09d0]                           dc.w $0001
[000b09d2]                           dc.w $0001
[000b09d4]                           dc.w $0019
[000b09d6]                           dc.w $0000
[000b09d8]                           dc.w $0000
[000b09da]                           dc.w $00ff
[000b09dc]                           dc.w $1141
[000b09de]                           dc.w $0000
[000b09e0]                           dc.w $0000
[000b09e2]                           dc.w $0028
[000b09e4]                           dc.w $0009
_01_IC_POS:
[000b09e6]                           dc.w $0000
[000b09e8]                           dc.w $0002
[000b09ea]                           dc.w $001f
[000b09ec]                           dc.w $0018
[000b09ee]                           dc.w $0040
[000b09f0]                           dc.w $0510
[000b09f2] 000ae304                  dc.l A_3DBUTTON08
[000b09f6]                           dc.w $0000
[000b09f8]                           dc.w $0000
[000b09fa]                           dc.w $0028
[000b09fc]                           dc.w $0009
_02_IC_POS:
[000b09fe]                           dc.w $0003
[000b0a00]                           dc.w $ffff
[000b0a02]                           dc.w $ffff
[000b0a04]                           dc.w $001c
[000b0a06]                           dc.w $0040
[000b0a08]                           dc.w $0000
[000b0a0a] 000adab2                  dc.l TEXT_22
[000b0a0e]                           dc.w $0008
[000b0a10]                           dc.w $0001
[000b0a12]                           dc.w $0002
[000b0a14]                           dc.w $0001
_03_IC_POS:
[000b0a16]                           dc.w $0004
[000b0a18]                           dc.w $ffff
[000b0a1a]                           dc.w $ffff
[000b0a1c]                           dc.w $0018
[000b0a1e]                           dc.w $0040
[000b0a20]                           dc.w $0000
[000b0a22] 000ae464                  dc.l A_ARROWS03
[000b0a26]                           dc.w $000b
[000b0a28]                           dc.w $0001
[000b0a2a]                           dc.w $0001
[000b0a2c]                           dc.w $0001
_04_IC_POS:
[000b0a2e]                           dc.w $0005
[000b0a30]                           dc.w $ffff
[000b0a32]                           dc.w $ffff
[000b0a34]                           dc.w $001c
[000b0a36]                           dc.w $0040
[000b0a38]                           dc.w $0000
[000b0a3a] 000ada66                  dc.l TEXT_11
[000b0a3e]                           dc.w $000d
[000b0a40]                           dc.w $0001
[000b0a42]                           dc.w $0002
[000b0a44]                           dc.w $0001
_05_IC_POS:
[000b0a46]                           dc.w $0006
[000b0a48]                           dc.w $ffff
[000b0a4a]                           dc.w $ffff
[000b0a4c]                           dc.w $0018
[000b0a4e]                           dc.w $0040
[000b0a50]                           dc.w $0000
[000b0a52] 000ae464                  dc.l A_ARROWS03
[000b0a56]                           dc.w $0010
[000b0a58]                           dc.w $0001
[000b0a5a]                           dc.w $0001
[000b0a5c]                           dc.w $0001
_06_IC_POS:
[000b0a5e]                           dc.w $0007
[000b0a60]                           dc.w $ffff
[000b0a62]                           dc.w $ffff
[000b0a64]                           dc.w $001c
[000b0a66]                           dc.w $0040
[000b0a68]                           dc.w $0000
[000b0a6a] 000ada69                  dc.l TEXT_12
[000b0a6e]                           dc.w $0012
[000b0a70]                           dc.w $0001
[000b0a72]                           dc.w $0002
[000b0a74]                           dc.w $0001
_07_IC_POS:
[000b0a76]                           dc.w $0008
[000b0a78]                           dc.w $ffff
[000b0a7a]                           dc.w $ffff
[000b0a7c]                           dc.w $0018
[000b0a7e]                           dc.w $0040
[000b0a80]                           dc.w $0000
[000b0a82] 000ae464                  dc.l A_ARROWS03
[000b0a86]                           dc.w $0015
[000b0a88]                           dc.w $0001
[000b0a8a]                           dc.w $0001
[000b0a8c]                           dc.w $0001
_08_IC_POS:
[000b0a8e]                           dc.w $0009
[000b0a90]                           dc.w $ffff
[000b0a92]                           dc.w $ffff
[000b0a94]                           dc.w $001c
[000b0a96]                           dc.w $0040
[000b0a98]                           dc.w $0000
[000b0a9a] 000ada6c                  dc.l TEXT_13
[000b0a9e]                           dc.w $0017
[000b0aa0]                           dc.w $0001
[000b0aa2]                           dc.w $0002
[000b0aa4]                           dc.w $0001
_09_IC_POS:
[000b0aa6]                           dc.w $000a
[000b0aa8]                           dc.w $ffff
[000b0aaa]                           dc.w $ffff
[000b0aac]                           dc.w $001c
[000b0aae]                           dc.w $0000
[000b0ab0]                           dc.w $0000
[000b0ab2] 000ada6f                  dc.l TEXT_14
[000b0ab6]                           dc.w $0001
[000b0ab8]                           dc.w $0002
[000b0aba]                           dc.w $0005
[000b0abc]                           dc.w $0001
_10_IC_POS:
[000b0abe]                           dc.w $0019
[000b0ac0]                           dc.w $000b
[000b0ac2]                           dc.w $000b
[000b0ac4]                           dc.w $0018
[000b0ac6]                           dc.w $0040
[000b0ac8]                           dc.w $0000
[000b0aca] 000ae284                  dc.l A_3DBUTTON04
[000b0ace]                           dc.w $0007
[000b0ad0]                           dc.w $0002
[000b0ad2]                           dc.w $0013
[000b0ad4]                           dc.w $0003
_11_IC_POS:
[000b0ad6]                           dc.w $000a
[000b0ad8]                           dc.w $000c
[000b0ada]                           dc.w $0018
[000b0adc]                           dc.w $0014
[000b0ade]                           dc.w $0040
[000b0ae0]                           dc.w $0000
[000b0ae2]                           dc.w $00ff
[000b0ae4]                           dc.w $0101
[000b0ae6]                           dc.w $0000
[000b0ae8]                           dc.w $0000
[000b0aea]                           dc.w $0013
[000b0aec]                           dc.w $0003
_12_IC_POS:
[000b0aee]                           dc.w $000d
[000b0af0]                           dc.w $ffff
[000b0af2]                           dc.w $ffff
[000b0af4]                           dc.w $0018
[000b0af6]                           dc.w $0008
[000b0af8]                           dc.w $0000
[000b0afa] 000ae4a4                  dc.l A_BOXED03
[000b0afe]                           dc.w $0000
[000b0b00]                           dc.w $0000
[000b0b02]                           dc.w $0004
[000b0b04]                           dc.w $0001
_13_IC_POS:
[000b0b06]                           dc.w $000e
[000b0b08]                           dc.w $ffff
[000b0b0a]                           dc.w $ffff
[000b0b0c]                           dc.w $0018
[000b0b0e]                           dc.w $0040
[000b0b10]                           dc.w $0000
[000b0b12] 000ae464                  dc.l A_ARROWS03
[000b0b16]                           dc.w $0004
[000b0b18]                           dc.w $0000
[000b0b1a]                           dc.w $0001
[000b0b1c]                           dc.w $0003
_14_IC_POS:
[000b0b1e]                           dc.w $000f
[000b0b20]                           dc.w $ffff
[000b0b22]                           dc.w $ffff
[000b0b24]                           dc.w $0018
[000b0b26]                           dc.w $0008
[000b0b28]                           dc.w $0000
[000b0b2a] 000ae4a4                  dc.l A_BOXED03
[000b0b2e]                           dc.w $0005
[000b0b30]                           dc.w $0000
[000b0b32]                           dc.w $0004
[000b0b34]                           dc.w $0001
_15_IC_POS:
[000b0b36]                           dc.w $0010
[000b0b38]                           dc.w $ffff
[000b0b3a]                           dc.w $ffff
[000b0b3c]                           dc.w $0018
[000b0b3e]                           dc.w $0040
[000b0b40]                           dc.w $0000
[000b0b42] 000ae464                  dc.l A_ARROWS03
[000b0b46]                           dc.w $0009
[000b0b48]                           dc.w $0000
[000b0b4a]                           dc.w $0001
[000b0b4c]                           dc.w $0003
_16_IC_POS:
[000b0b4e]                           dc.w $0011
[000b0b50]                           dc.w $ffff
[000b0b52]                           dc.w $ffff
[000b0b54]                           dc.w $0018
[000b0b56]                           dc.w $0040
[000b0b58]                           dc.w $0000
[000b0b5a] 000ae464                  dc.l A_ARROWS03
[000b0b5e]                           dc.w $000e
[000b0b60]                           dc.w $0000
[000b0b62]                           dc.w $0001
[000b0b64]                           dc.w $0003
_17_IC_POS:
[000b0b66]                           dc.w $0012
[000b0b68]                           dc.w $ffff
[000b0b6a]                           dc.w $ffff
[000b0b6c]                           dc.w $0018
[000b0b6e]                           dc.w $0008
[000b0b70]                           dc.w $0000
[000b0b72] 000ae4a4                  dc.l A_BOXED03
[000b0b76]                           dc.w $0000
[000b0b78]                           dc.w $0001
[000b0b7a]                           dc.w $0004
[000b0b7c]                           dc.w $0001
_18_IC_POS:
[000b0b7e]                           dc.w $0013
[000b0b80]                           dc.w $ffff
[000b0b82]                           dc.w $ffff
[000b0b84]                           dc.w $0018
[000b0b86]                           dc.w $0008
[000b0b88]                           dc.w $0000
[000b0b8a] 000ae4a4                  dc.l A_BOXED03
[000b0b8e]                           dc.w $0005
[000b0b90]                           dc.w $0001
[000b0b92]                           dc.w $0004
[000b0b94]                           dc.w $0001
_19_IC_POS:
[000b0b96]                           dc.w $0014
[000b0b98]                           dc.w $ffff
[000b0b9a]                           dc.w $ffff
[000b0b9c]                           dc.w $0018
[000b0b9e]                           dc.w $0008
[000b0ba0]                           dc.w $0000
[000b0ba2] 000ae4a4                  dc.l A_BOXED03
[000b0ba6]                           dc.w $000a
[000b0ba8]                           dc.w $0001
[000b0baa]                           dc.w $0004
[000b0bac]                           dc.w $0001
_20_IC_POS:
[000b0bae]                           dc.w $0015
[000b0bb0]                           dc.w $ffff
[000b0bb2]                           dc.w $ffff
[000b0bb4]                           dc.w $0018
[000b0bb6]                           dc.w $0008
[000b0bb8]                           dc.w $0000
[000b0bba] 000ae4a4                  dc.l A_BOXED03
[000b0bbe]                           dc.w $000f
[000b0bc0]                           dc.w $0001
[000b0bc2]                           dc.w $0004
[000b0bc4]                           dc.w $0001
_21_IC_POS:
[000b0bc6]                           dc.w $0016
[000b0bc8]                           dc.w $ffff
[000b0bca]                           dc.w $ffff
[000b0bcc]                           dc.w $0018
[000b0bce]                           dc.w $0008
[000b0bd0]                           dc.w $0000
[000b0bd2] 000ae4e4                  dc.l A_BOXED06
[000b0bd6]                           dc.w $0000
[000b0bd8]                           dc.w $0002
[000b0bda]                           dc.w $0004
[000b0bdc]                           dc.w $0001
_22_IC_POS:
[000b0bde]                           dc.w $0017
[000b0be0]                           dc.w $ffff
[000b0be2]                           dc.w $ffff
[000b0be4]                           dc.w $0018
[000b0be6]                           dc.w $0008
[000b0be8]                           dc.w $0000
[000b0bea] 000ae4e4                  dc.l A_BOXED06
[000b0bee]                           dc.w $0005
[000b0bf0]                           dc.w $0002
[000b0bf2]                           dc.w $0004
[000b0bf4]                           dc.w $0001
_23_IC_POS:
[000b0bf6]                           dc.w $0018
[000b0bf8]                           dc.w $ffff
[000b0bfa]                           dc.w $ffff
[000b0bfc]                           dc.w $0018
[000b0bfe]                           dc.w $0008
[000b0c00]                           dc.w $0000
[000b0c02] 000ae4a4                  dc.l A_BOXED03
[000b0c06]                           dc.w $000a
[000b0c08]                           dc.w $0002
[000b0c0a]                           dc.w $0004
[000b0c0c]                           dc.w $0001
_24_IC_POS:
[000b0c0e]                           dc.w $000b
[000b0c10]                           dc.w $ffff
[000b0c12]                           dc.w $ffff
[000b0c14]                           dc.w $0018
[000b0c16]                           dc.w $0008
[000b0c18]                           dc.w $0000
[000b0c1a] 000ae4a4                  dc.l A_BOXED03
[000b0c1e]                           dc.w $000f
[000b0c20]                           dc.w $0002
[000b0c22]                           dc.w $0004
[000b0c24]                           dc.w $0001
_25_IC_POS:
[000b0c26]                           dc.w $001a
[000b0c28]                           dc.w $ffff
[000b0c2a]                           dc.w $ffff
[000b0c2c]                           dc.w $001c
[000b0c2e]                           dc.w $0000
[000b0c30]                           dc.w $0000
[000b0c32] 000ada75                  dc.l TEXT_15
[000b0c36]                           dc.w $0001
[000b0c38]                           dc.w $0003
[000b0c3a]                           dc.w $0005
[000b0c3c]                           dc.w $0001
_26_IC_POS:
[000b0c3e]                           dc.w $001c
[000b0c40]                           dc.w $ffff
[000b0c42]                           dc.w $ffff
[000b0c44]                           dc.w $0018
[000b0c46]                           dc.w $0005
[000b0c48]                           dc.w $0010
[000b0c4a] 000ae2a4                  dc.l A_3DBUTTON05
[000b0c4e]                           dc.w $001b
[000b0c50]                           dc.w $0003
[000b0c52]                           dc.w $000c
[000b0c54]                           dc.w $0002
_26aIC_POS:
[000b0c56] 0001eba0                  dc.l edic_deskicon
[000b0c5a]                           dc.w $0000
[000b0c5c]                           dc.w $0000
[000b0c5e]                           dc.w $8000
[000b0c60]                           dc.w $8844
[000b0c62]                           dc.w $0000
[000b0c64]                           dc.w $0000
[000b0c66]                           dc.w $0000
[000b0c68]                           dc.w $0000
[000b0c6a]                           dc.w $0000
[000b0c6c]                           dc.w $0000
_28_IC_POS:
[000b0c6e]                           dc.w $001d
[000b0c70]                           dc.w $ffff
[000b0c72]                           dc.w $ffff
[000b0c74]                           dc.w $001c
[000b0c76]                           dc.w $0000
[000b0c78]                           dc.w $0000
[000b0c7a] 000ada7b                  dc.l TEXT_16
[000b0c7e]                           dc.w $0001
[000b0c80]                           dc.w $0004
[000b0c82]                           dc.w $0005
[000b0c84]                           dc.w $0001
_29_IC_POS:
[000b0c86]                           dc.w $001f
[000b0c88]                           dc.w $ffff
[000b0c8a]                           dc.w $ffff
[000b0c8c]                           dc.w $0018
[000b0c8e]                           dc.w $4007
[000b0c90]                           dc.w $0010
[000b0c92] 000ae3c4                  dc.l A_3DBUTTON15
[000b0c96]                           dc.w $0007
[000b0c98]                           dc.w $0006
[000b0c9a]                           dc.w $000c
[000b0c9c]                           dc.w $0002
_29aIC_POS:
[000b0c9e]                           dc.w $0000
[000b0ca0]                           dc.w $0000
[000b0ca2]                           dc.w $0000
[000b0ca4]                           dc.w $0000
[000b0ca6]                           dc.w $8000
[000b0ca8]                           dc.w $884f
[000b0caa]                           dc.w $0000
[000b0cac]                           dc.w $0000
[000b0cae]                           dc.w $0000
[000b0cb0]                           dc.w $0000
[000b0cb2]                           dc.w $0000
[000b0cb4]                           dc.w $0000
_31_IC_POS:
[000b0cb6]                           dc.w $0001
[000b0cb8]                           dc.w $ffff
[000b0cba]                           dc.w $ffff
[000b0cbc]                           dc.w $0018
[000b0cbe]                           dc.w $4005
[000b0cc0]                           dc.w $0010
[000b0cc2] 000ae404                  dc.l A_3DBUTTON18
[000b0cc6]                           dc.w $0015
[000b0cc8]                           dc.w $0006
[000b0cca]                           dc.w $000c
[000b0ccc]                           dc.w $0002
_31aIC_POS:
[000b0cce]                           dc.w $0000
[000b0cd0]                           dc.w $0000
[000b0cd2]                           dc.w $0000
[000b0cd4]                           dc.w $0000
[000b0cd6]                           dc.w $8020
[000b0cd8]                           dc.w $8841
[000b0cda]                           dc.w $0000
[000b0cdc]                           dc.w $0000
[000b0cde]                           dc.w $0000
[000b0ce0]                           dc.w $0000
[000b0ce2]                           dc.w $0000
[000b0ce4]                           dc.w $0000
WI_ICON:
[000b0ce6]                           dc.w $0000
[000b0ce8]                           dc.w $0000
[000b0cea] 00020df0                  dc.l ic_service
[000b0cee] 00020cfa                  dc.l ic_make
[000b0cf2] 00057428                  dc.l Awi_open
[000b0cf6] 00055e94                  dc.l Awi_init
[000b0cfa] 000b02de                  dc.l EDIT_ICON
[000b0cfe]                           dc.w $0000
[000b0d00]                           dc.w $0000
[000b0d02]                           dc.w $0000
[000b0d04]                           dc.w $0000
[000b0d06]                           dc.w $ffff
[000b0d08]                           dc.w $601f
[000b0d0a]                           dc.w $0000
[000b0d0c]                           dc.w $0000
[000b0d0e]                           dc.w $0063
[000b0d10]                           dc.w $0063
[000b0d12]                           dc.w $0000
[000b0d14]                           dc.w $0000
[000b0d16]                           dc.w $0000
[000b0d18]                           dc.w $0000
[000b0d1a]                           dc.w $0000
[000b0d1c]                           dc.w $0000
[000b0d1e]                           dc.w $0000
[000b0d20]                           dc.w $0000
[000b0d22]                           dc.w $ffff
[000b0d24]                           dc.w $ffff
[000b0d26]                           dc.w $ffff
[000b0d28]                           dc.w $ffff
[000b0d2a]                           dc.w $0000
[000b0d2c]                           dc.w $0000
[000b0d2e]                           dc.w $fcf8
[000b0d30] 000ada81                  dc.l TEXT_17
[000b0d34] 000ad9f5                  dc.l TEXT_002
[000b0d38]                           dc.w $2710
[000b0d3a]                           dc.w $0100
[000b0d3c]                           dc.w $0000
[000b0d3e]                           dc.w $ffff
[000b0d40] 000ae908                  dc.l IC_ICON
[000b0d44]                           dc.w $0000
[000b0d46]                           dc.w $0000
[000b0d48] 00020ca0                  dc.l ic_keys
[000b0d4c] 00051852                  dc.l Awi_obchange
[000b0d50] 00051c46                  dc.l Awi_redraw
[000b0d54] 000587a4                  dc.l Awi_topped
[000b0d58] 00058362                  dc.l Awi_closed
[000b0d5c] 000587ec                  dc.l Awi_fulled
[000b0d60] 0005217c                  dc.l Awi_arrowed
[000b0d64] 000524b4                  dc.l Awi_hslid
[000b0d68] 0005255e                  dc.l Awi_vslid
[000b0d6c] 00058bb0                  dc.l Awi_sized
[000b0d70] 00058d50                  dc.l Awi_moved
[000b0d74] 0005998a                  dc.l Awi_iconify
[000b0d78] 00059c6c                  dc.l Awi_uniconify
[000b0d7c] 0005b5b6                  dc.l Awi_gemscript
[000b0d80]                           dc.w $0000
[000b0d82]                           dc.w $0000
[000b0d84]                           dc.w $0000
[000b0d86]                           dc.w $0000
WI_POS:
[000b0d88]                           dc.w $0000
[000b0d8a]                           dc.w $0000
[000b0d8c] 00059dd0                  dc.l Awi_service
[000b0d90] 00056c16                  dc.l Awi_selfcreate
[000b0d94] 00057428                  dc.l Awi_open
[000b0d98] 00055e94                  dc.l Awi_init
[000b0d9c] 000b09ce                  dc.l IC_POS
[000b0da0]                           dc.w $0000
[000b0da2]                           dc.w $0000
[000b0da4]                           dc.w $0000
[000b0da6]                           dc.w $0000
[000b0da8]                           dc.w $ffff
[000b0daa]                           dc.w $200b
[000b0dac]                           dc.w $0000
[000b0dae]                           dc.w $0000
[000b0db0]                           dc.w $0078
[000b0db2]                           dc.w $0032
[000b0db4]                           dc.w $0000
[000b0db6]                           dc.w $0000
[000b0db8]                           dc.w $0000
[000b0dba]                           dc.w $0000
[000b0dbc]                           dc.w $0000
[000b0dbe]                           dc.w $0000
[000b0dc0]                           dc.w $0000
[000b0dc2]                           dc.w $0000
[000b0dc4]                           dc.w $ffff
[000b0dc6]                           dc.w $ffff
[000b0dc8]                           dc.w $ffff
[000b0dca]                           dc.w $ffff
[000b0dcc]                           dc.w $0000
[000b0dce]                           dc.w $0000
[000b0dd0]                           dc.w $f8f8
[000b0dd2] 000adac0                  dc.l TEXT_24
[000b0dd6] 000ad9f5                  dc.l TEXT_002
[000b0dda]                           dc.w $2710
[000b0ddc]                           dc.w $0000
[000b0dde]                           dc.w $0000
[000b0de0]                           dc.w $ffff
[000b0de2]                           dc.w $0000
[000b0de4]                           dc.w $0000
[000b0de6]                           dc.w $0000
[000b0de8]                           dc.w $0000
[000b0dea] 0006b744                  dc.l Awi_keys
[000b0dee] 00051852                  dc.l Awi_obchange
[000b0df2] 00051c46                  dc.l Awi_redraw
[000b0df6] 000587a4                  dc.l Awi_topped
[000b0dfa] 00058362                  dc.l Awi_closed
[000b0dfe] 000587ec                  dc.l Awi_fulled
[000b0e02] 0005217c                  dc.l Awi_arrowed
[000b0e06] 000524b4                  dc.l Awi_hslid
[000b0e0a] 0005255e                  dc.l Awi_vslid
[000b0e0e] 00058bb0                  dc.l Awi_sized
[000b0e12] 00058d50                  dc.l Awi_moved
[000b0e16] 0005998a                  dc.l Awi_iconify
[000b0e1a] 00059c6c                  dc.l Awi_uniconify
[000b0e1e] 0005b5b6                  dc.l Awi_gemscript
[000b0e22]                           dc.w $0000
[000b0e24]                           dc.w $0000
[000b0e26]                           dc.w $0000
[000b0e28]                           dc.w $0000
plane_brush:
[000b0e2a]                           dc.w $ffff
[000b0e2c]                           dc.w $ffff
[000b0e2e]                           dc.w $ffff
brush:
[000b0e30] 000b0e2a                  dc.l plane_brush
[000b0e34]                           dc.w $0010
[000b0e36]                           dc.w $0003
[000b0e38]                           dc.w $0001
[000b0e3a]                           dc.w $0000
[000b0e3c]                           dc.w $0001
[000b0e3e]                           dc.w $0000
[000b0e40]                           dc.w $0000
[000b0e42]                           dc.w $0000
[000b0e44]                           dc.w $0000
[000b0e46]                           dc.w $0000
[000b0e48]                           dc.w $0000
[000b0e4a]                           dc.w $0000
[000b0e4c]                           dc.w $0000
[000b0e4e]                           dc.w $0000
[000b0e50]                           dc.w $0000
[000b0e52]                           dc.w $0000
[000b0e54]                           dc.w $0001
[000b0e56]                           dc.w $0000
[000b0e58]                           dc.w $0000
[000b0e5a]                           dc.w $0000
[000b0e5c]                           dc.w $0001
[000b0e5e]                           dc.w $0000
[000b0e60]                           dc.w $2000
[000b0e62]                           dc.w $2564
[000b0e64]                           dc.w $0030
[000b0e66]                           dc.w $0033
[000b0e68]                           dc.w $3200
[000b0e6a]                           dc.w $3732
[000b0e6c]                           dc.w $0038
[000b0e6e]                           dc.w $0000
