Aev_GetMnSelected:
[0005e62e] 594f                      subq.w     #4,a7
[0005e630] 2e88                      move.l     a0,(a7)
[0005e632] 2057                      movea.l    (a7),a0
[0005e634] 2050                      movea.l    (a0),a0
[0005e636] 3228 0008                 move.w     8(a0),d1
[0005e63a] 2057                      movea.l    (a7),a0
[0005e63c] 2050                      movea.l    (a0),a0
[0005e63e] 3028 0006                 move.w     6(a0),d0
[0005e642] 4eb9 0004 e96c            jsr        Ame_root
[0005e648] 7001                      moveq.l    #1,d0
[0005e64a] 584f                      addq.w     #4,a7
[0005e64c] 4e75                      rts

Aev_GetWmRedraw:
[0005e64e] 2f0a                      move.l     a2,-(a7)
[0005e650] 594f                      subq.w     #4,a7
[0005e652] 2e88                      move.l     a0,(a7)
[0005e654] 2257                      movea.l    (a7),a1
[0005e656] 5849                      addq.w     #4,a1
[0005e658] 2057                      movea.l    (a7),a0
[0005e65a] 2068 000c                 movea.l    12(a0),a0
[0005e65e] 2457                      movea.l    (a7),a2
[0005e660] 246a 000c                 movea.l    12(a2),a2
[0005e664] 246a 006a                 movea.l    106(a2),a2
[0005e668] 4e92                      jsr        (a2)
[0005e66a] 7001                      moveq.l    #1,d0
[0005e66c] 584f                      addq.w     #4,a7
[0005e66e] 245f                      movea.l    (a7)+,a2
[0005e670] 4e75                      rts

Aev_GetWmTopped:
[0005e672] 594f                      subq.w     #4,a7
[0005e674] 2e88                      move.l     a0,(a7)
[0005e676] 2057                      movea.l    (a7),a0
[0005e678] 2068 000c                 movea.l    12(a0),a0
[0005e67c] 3028 0054                 move.w     84(a0),d0
[0005e680] c07c 0100                 and.w      #$0100,d0
[0005e684] 675e                      beq.s      Aev_GetWmTopped_1
[0005e686] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e68c] 2068 0280                 movea.l    640(a0),a0
[0005e690] 0c50 0400                 cmpi.w     #$0400,(a0)
[0005e694] 6c4e                      bge.s      Aev_GetWmTopped_1
[0005e696] 0c79 0300 0010 f55c       cmpi.w     #$0300,_ACSv_magix
[0005e69e] 6c44                      bge.s      Aev_GetWmTopped_1
[0005e6a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e6a6] 3228 0264                 move.w     612(a0),d1
[0005e6aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e6b0] 3028 0262                 move.w     610(a0),d0
[0005e6b4] 2057                      movea.l    (a7),a0
[0005e6b6] 2068 000c                 movea.l    12(a0),a0
[0005e6ba] 41e8 0034                 lea.l      52(a0),a0
[0005e6be] 4eb9 0006 b7a6            jsr        Aob_within
[0005e6c4] 4a40                      tst.w      d0
[0005e6c6] 671c                      beq.s      Aev_GetWmTopped_1
[0005e6c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e6ce] 3228 02cc                 move.w     716(a0),d1
[0005e6d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005e6d8] 3028 02ca                 move.w     714(a0),d0
[0005e6dc] 4eb9 0004 ab64            jsr        evbutton
[0005e6e2] 6012                      bra.s      Aev_GetWmTopped_2
Aev_GetWmTopped_1:
[0005e6e4] 2057                      movea.l    (a7),a0
[0005e6e6] 2068 000c                 movea.l    12(a0),a0
[0005e6ea] 2257                      movea.l    (a7),a1
[0005e6ec] 2269 000c                 movea.l    12(a1),a1
[0005e6f0] 2269 006e                 movea.l    110(a1),a1
[0005e6f4] 4e91                      jsr        (a1)
Aev_GetWmTopped_2:
[0005e6f6] 7001                      moveq.l    #1,d0
[0005e6f8] 584f                      addq.w     #4,a7
[0005e6fa] 4e75                      rts

Aev_GetWmClosed:
[0005e6fc] 2f0a                      move.l     a2,-(a7)
[0005e6fe] 4fef fff4                 lea.l      -12(a7),a7
[0005e702] 2f48 0008                 move.l     a0,8(a7)
[0005e706] 4eb9 0005 7b82            jsr        Awi_modal
[0005e70c] 2f48 0004                 move.l     a0,4(a7)
[0005e710] 206f 0008                 movea.l    8(a7),a0
[0005e714] 2ea8 000c                 move.l     12(a0),(a7)
[0005e718] 202f 0004                 move.l     4(a7),d0
[0005e71c] 6708                      beq.s      Aev_GetWmClosed_1
[0005e71e] 206f 0004                 movea.l    4(a7),a0
[0005e722] b1d7                      cmpa.l     (a7),a0
[0005e724] 663c                      bne.s      Aev_GetWmClosed_2
Aev_GetWmClosed_1:
[0005e726] 4eb9 0005 5e8c            jsr        Awi_root
[0005e72c] 2257                      movea.l    (a7),a1
[0005e72e] b3c8                      cmpa.l     a0,a1
[0005e730] 6716                      beq.s      Aev_GetWmClosed_3
[0005e732] 7001                      moveq.l    #1,d0
[0005e734] 2057                      movea.l    (a7),a0
[0005e736] c068 0054                 and.w      84(a0),d0
[0005e73a] 660c                      bne.s      Aev_GetWmClosed_3
[0005e73c] 2057                      movea.l    (a7),a0
[0005e73e] 3028 0056                 move.w     86(a0),d0
[0005e742] c07c 0400                 and.w      #$0400,d0
[0005e746] 670c                      beq.s      Aev_GetWmClosed_4
Aev_GetWmClosed_3:
[0005e748] 2057                      movea.l    (a7),a0
[0005e74a] 2257                      movea.l    (a7),a1
[0005e74c] 2269 0072                 movea.l    114(a1),a1
[0005e750] 4e91                      jsr        (a1)
[0005e752] 600e                      bra.s      Aev_GetWmClosed_2
Aev_GetWmClosed_4:
[0005e754] 93c9                      suba.l     a1,a1
[0005e756] 7002                      moveq.l    #2,d0
[0005e758] 2057                      movea.l    (a7),a0
[0005e75a] 2457                      movea.l    (a7),a2
[0005e75c] 246a 0004                 movea.l    4(a2),a2
[0005e760] 4e92                      jsr        (a2)
Aev_GetWmClosed_2:
[0005e762] 7001                      moveq.l    #1,d0
[0005e764] 4fef 000c                 lea.l      12(a7),a7
[0005e768] 245f                      movea.l    (a7)+,a2
[0005e76a] 4e75                      rts

Aev_GetWmFulled:
[0005e76c] 594f                      subq.w     #4,a7
[0005e76e] 2e88                      move.l     a0,(a7)
[0005e770] 2057                      movea.l    (a7),a0
[0005e772] 2068 000c                 movea.l    12(a0),a0
[0005e776] 2257                      movea.l    (a7),a1
[0005e778] 2269 000c                 movea.l    12(a1),a1
[0005e77c] 2269 0076                 movea.l    118(a1),a1
[0005e780] 4e91                      jsr        (a1)
[0005e782] 7001                      moveq.l    #1,d0
[0005e784] 584f                      addq.w     #4,a7
[0005e786] 4e75                      rts

Aev_GetWmArrowed:
[0005e788] 514f                      subq.w     #8,a7
[0005e78a] 2f48 0004                 move.l     a0,4(a7)
[0005e78e] 206f 0004                 movea.l    4(a7),a0
[0005e792] 2e90                      move.l     (a0),(a7)
[0005e794] 2057                      movea.l    (a7),a0
[0005e796] 3028 000a                 move.w     10(a0),d0
[0005e79a] 6b20                      bmi.s      Aev_GetWmArrowed_1
[0005e79c] 7201                      moveq.l    #1,d1
[0005e79e] 2057                      movea.l    (a7),a0
[0005e7a0] 3028 0008                 move.w     8(a0),d0
[0005e7a4] 206f 0004                 movea.l    4(a7),a0
[0005e7a8] 2068 000c                 movea.l    12(a0),a0
[0005e7ac] 226f 0004                 movea.l    4(a7),a1
[0005e7b0] 2269 000c                 movea.l    12(a1),a1
[0005e7b4] 2269 007a                 movea.l    122(a1),a1
[0005e7b8] 4e91                      jsr        (a1)
[0005e7ba] 6050                      bra.s      Aev_GetWmArrowed_2
Aev_GetWmArrowed_1:
[0005e7bc] 2057                      movea.l    (a7),a0
[0005e7be] 3228 000a                 move.w     10(a0),d1
[0005e7c2] 4441                      neg.w      d1
[0005e7c4] 2057                      movea.l    (a7),a0
[0005e7c6] 3028 0008                 move.w     8(a0),d0
[0005e7ca] 206f 0004                 movea.l    4(a7),a0
[0005e7ce] 2068 000c                 movea.l    12(a0),a0
[0005e7d2] 226f 0004                 movea.l    4(a7),a1
[0005e7d6] 2269 000c                 movea.l    12(a1),a1
[0005e7da] 2269 007a                 movea.l    122(a1),a1
[0005e7de] 4e91                      jsr        (a1)
[0005e7e0] 2057                      movea.l    (a7),a0
[0005e7e2] 3028 000e                 move.w     14(a0),d0
[0005e7e6] 6a24                      bpl.s      Aev_GetWmArrowed_2
[0005e7e8] 2057                      movea.l    (a7),a0
[0005e7ea] 3228 000e                 move.w     14(a0),d1
[0005e7ee] 4441                      neg.w      d1
[0005e7f0] 2057                      movea.l    (a7),a0
[0005e7f2] 3028 000c                 move.w     12(a0),d0
[0005e7f6] 206f 0004                 movea.l    4(a7),a0
[0005e7fa] 2068 000c                 movea.l    12(a0),a0
[0005e7fe] 226f 0004                 movea.l    4(a7),a1
[0005e802] 2269 000c                 movea.l    12(a1),a1
[0005e806] 2269 007a                 movea.l    122(a1),a1
[0005e80a] 4e91                      jsr        (a1)
Aev_GetWmArrowed_2:
[0005e80c] 7001                      moveq.l    #1,d0
[0005e80e] 504f                      addq.w     #8,a7
[0005e810] 4e75                      rts

Aev_GetWmMouseWheel:
[0005e812] 4fef ffd8                 lea.l      -40(a7),a7
[0005e816] 2f48 0024                 move.l     a0,36(a7)
[0005e81a] 206f 0024                 movea.l    36(a7),a0
[0005e81e] 2f50 0020                 move.l     (a0),32(a7)
[0005e822] 7220                      moveq.l    #32,d1
[0005e824] 4240                      clr.w      d0
[0005e826] 41d7                      lea.l      (a7),a0
[0005e828] 4eb9 0008 36ea            jsr        memset
[0005e82e] 206f 0020                 movea.l    32(a7),a0
[0005e832] 3ea8 0008                 move.w     8(a0),(a7)
[0005e836] 206f 0020                 movea.l    32(a7),a0
[0005e83a] 3228 000c                 move.w     12(a0),d1
[0005e83e] 206f 0020                 movea.l    32(a7),a0
[0005e842] 3028 000a                 move.w     10(a0),d0
[0005e846] 43d7                      lea.l      (a7),a1
[0005e848] 206f 0024                 movea.l    36(a7),a0
[0005e84c] 2068 000c                 movea.l    12(a0),a0
[0005e850] 4eb9 0005 2606            jsr        Awi_wheeled
[0005e856] 4fef 0028                 lea.l      40(a7),a7
[0005e85a] 4e75                      rts

Aev_GetWmHSlid:
[0005e85c] 594f                      subq.w     #4,a7
[0005e85e] 2e88                      move.l     a0,(a7)
[0005e860] 2057                      movea.l    (a7),a0
[0005e862] 2050                      movea.l    (a0),a0
[0005e864] 3028 0008                 move.w     8(a0),d0
[0005e868] 2057                      movea.l    (a7),a0
[0005e86a] 2068 000c                 movea.l    12(a0),a0
[0005e86e] 2257                      movea.l    (a7),a1
[0005e870] 2269 000c                 movea.l    12(a1),a1
[0005e874] 2269 007e                 movea.l    126(a1),a1
[0005e878] 4e91                      jsr        (a1)
[0005e87a] 7001                      moveq.l    #1,d0
[0005e87c] 584f                      addq.w     #4,a7
[0005e87e] 4e75                      rts

Aev_GetWmVSlid:
[0005e880] 594f                      subq.w     #4,a7
[0005e882] 2e88                      move.l     a0,(a7)
[0005e884] 2057                      movea.l    (a7),a0
[0005e886] 2050                      movea.l    (a0),a0
[0005e888] 3028 0008                 move.w     8(a0),d0
[0005e88c] 2057                      movea.l    (a7),a0
[0005e88e] 2068 000c                 movea.l    12(a0),a0
[0005e892] 2257                      movea.l    (a7),a1
[0005e894] 2269 000c                 movea.l    12(a1),a1
[0005e898] 2269 0082                 movea.l    130(a1),a1
[0005e89c] 4e91                      jsr        (a1)
[0005e89e] 7001                      moveq.l    #1,d0
[0005e8a0] 584f                      addq.w     #4,a7
[0005e8a2] 4e75                      rts

Aev_GetWmSized:
[0005e8a4] 2f0a                      move.l     a2,-(a7)
[0005e8a6] 594f                      subq.w     #4,a7
[0005e8a8] 2e88                      move.l     a0,(a7)
[0005e8aa] 2257                      movea.l    (a7),a1
[0005e8ac] 5849                      addq.w     #4,a1
[0005e8ae] 2057                      movea.l    (a7),a0
[0005e8b0] 2068 000c                 movea.l    12(a0),a0
[0005e8b4] 2457                      movea.l    (a7),a2
[0005e8b6] 246a 000c                 movea.l    12(a2),a2
[0005e8ba] 246a 0086                 movea.l    134(a2),a2
[0005e8be] 4e92                      jsr        (a2)
[0005e8c0] 7001                      moveq.l    #1,d0
[0005e8c2] 584f                      addq.w     #4,a7
[0005e8c4] 245f                      movea.l    (a7)+,a2
[0005e8c6] 4e75                      rts

Aev_GetWmMoved:
[0005e8c8] 2f0a                      move.l     a2,-(a7)
[0005e8ca] 594f                      subq.w     #4,a7
[0005e8cc] 2e88                      move.l     a0,(a7)
[0005e8ce] 2257                      movea.l    (a7),a1
[0005e8d0] 5849                      addq.w     #4,a1
[0005e8d2] 2057                      movea.l    (a7),a0
[0005e8d4] 2068 000c                 movea.l    12(a0),a0
[0005e8d8] 2457                      movea.l    (a7),a2
[0005e8da] 246a 000c                 movea.l    12(a2),a2
[0005e8de] 246a 008a                 movea.l    138(a2),a2
[0005e8e2] 4e92                      jsr        (a2)
[0005e8e4] 7001                      moveq.l    #1,d0
[0005e8e6] 584f                      addq.w     #4,a7
[0005e8e8] 245f                      movea.l    (a7)+,a2
[0005e8ea] 4e75                      rts

Aev_GetWmBottomed:
[0005e8ec] 594f                      subq.w     #4,a7
[0005e8ee] 2e88                      move.l     a0,(a7)
[0005e8f0] 2057                      movea.l    (a7),a0
[0005e8f2] 2068 000c                 movea.l    12(a0),a0
[0005e8f6] 4eb9 0005 7b44            jsr        Awi_backdrop
[0005e8fc] 7001                      moveq.l    #1,d0
[0005e8fe] 584f                      addq.w     #4,a7
[0005e900] 4e75                      rts

Aev_GetWmOnTop:
[0005e902] 594f                      subq.w     #4,a7
[0005e904] 2e88                      move.l     a0,(a7)
[0005e906] 3039 0010 f55c            move.w     _ACSv_magix,d0
[0005e90c] 6f12                      ble.s      Aev_GetWmOnTop_1
[0005e90e] 0c79 0200 0010 f55c       cmpi.w     #$0200,_ACSv_magix
[0005e916] 6c08                      bge.s      Aev_GetWmOnTop_1
[0005e918] 2057                      movea.l    (a7),a0
[0005e91a] 6100 ffd0                 bsr.w      Aev_GetWmBottomed
[0005e91e] 600c                      bra.s      Aev_GetWmOnTop_2
Aev_GetWmOnTop_1:
[0005e920] 2057                      movea.l    (a7),a0
[0005e922] 2068 000c                 movea.l    12(a0),a0
[0005e926] 4eb9 0005 5c72            jsr        Awi_setontop
Aev_GetWmOnTop_2:
[0005e92c] 7001                      moveq.l    #1,d0
[0005e92e] 584f                      addq.w     #4,a7
[0005e930] 4e75                      rts

Aev_GetWmUnTopped:
[0005e932] 7001                      moveq.l    #1,d0
[0005e934] 4e75                      rts

Aev_GetWmToolbar:
[0005e936] 7001                      moveq.l    #1,d0
[0005e938] 4e75                      rts

Aev_GetWmShaded:
[0005e93a] 2f0a                      move.l     a2,-(a7)
[0005e93c] 594f                      subq.w     #4,a7
[0005e93e] 2e88                      move.l     a0,(a7)
[0005e940] 2057                      movea.l    (a7),a0
[0005e942] 2068 000c                 movea.l    12(a0),a0
[0005e946] 0068 2000 0056            ori.w      #$2000,86(a0)
[0005e94c] 93c9                      suba.l     a1,a1
[0005e94e] 7022                      moveq.l    #34,d0
[0005e950] 2057                      movea.l    (a7),a0
[0005e952] 2068 000c                 movea.l    12(a0),a0
[0005e956] 2457                      movea.l    (a7),a2
[0005e958] 246a 000c                 movea.l    12(a2),a2
[0005e95c] 246a 0004                 movea.l    4(a2),a2
[0005e960] 4e92                      jsr        (a2)
[0005e962] 7001                      moveq.l    #1,d0
[0005e964] 584f                      addq.w     #4,a7
[0005e966] 245f                      movea.l    (a7)+,a2
[0005e968] 4e75                      rts

Aev_GetWmUnshaded:
[0005e96a] 2f0a                      move.l     a2,-(a7)
[0005e96c] 514f                      subq.w     #8,a7
[0005e96e] 2f48 0004                 move.l     a0,4(a7)
[0005e972] 206f 0004                 movea.l    4(a7),a0
[0005e976] 2ea8 000c                 move.l     12(a0),(a7)
[0005e97a] 93c9                      suba.l     a1,a1
[0005e97c] 7023                      moveq.l    #35,d0
[0005e97e] 2057                      movea.l    (a7),a0
[0005e980] 2457                      movea.l    (a7),a2
[0005e982] 246a 0004                 movea.l    4(a2),a2
[0005e986] 4e92                      jsr        (a2)
[0005e988] 2057                      movea.l    (a7),a0
[0005e98a] 0268 dfff 0056            andi.w     #$DFFF,86(a0)
[0005e990] 2057                      movea.l    (a7),a0
[0005e992] 41e8 0024                 lea.l      36(a0),a0
[0005e996] 2257                      movea.l    (a7),a1
[0005e998] 3229 0020                 move.w     32(a1),d1
[0005e99c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005e9a2] 3011                      move.w     (a1),d0
[0005e9a4] 4eb9 0005 eb60            jsr        Aev_WmRedraw
[0005e9aa] 7001                      moveq.l    #1,d0
[0005e9ac] 504f                      addq.w     #8,a7
[0005e9ae] 245f                      movea.l    (a7)+,a2
[0005e9b0] 4e75                      rts

Aev_GetWmIconify:
[0005e9b2] 594f                      subq.w     #4,a7
[0005e9b4] 2e88                      move.l     a0,(a7)
[0005e9b6] 4240                      clr.w      d0
[0005e9b8] 2057                      movea.l    (a7),a0
[0005e9ba] 2068 000c                 movea.l    12(a0),a0
[0005e9be] 2257                      movea.l    (a7),a1
[0005e9c0] 2269 000c                 movea.l    12(a1),a1
[0005e9c4] 2269 008e                 movea.l    142(a1),a1
[0005e9c8] 4e91                      jsr        (a1)
[0005e9ca] 7001                      moveq.l    #1,d0
[0005e9cc] 584f                      addq.w     #4,a7
[0005e9ce] 4e75                      rts

Aev_GetWmAllIconify:
[0005e9d0] 594f                      subq.w     #4,a7
[0005e9d2] 2e88                      move.l     a0,(a7)
[0005e9d4] 7001                      moveq.l    #1,d0
[0005e9d6] 2057                      movea.l    (a7),a0
[0005e9d8] 2068 000c                 movea.l    12(a0),a0
[0005e9dc] 2257                      movea.l    (a7),a1
[0005e9de] 2269 000c                 movea.l    12(a1),a1
[0005e9e2] 2269 008e                 movea.l    142(a1),a1
[0005e9e6] 4e91                      jsr        (a1)
[0005e9e8] 7001                      moveq.l    #1,d0
[0005e9ea] 584f                      addq.w     #4,a7
[0005e9ec] 4e75                      rts

Aev_GetWmUnIconify:
[0005e9ee] 594f                      subq.w     #4,a7
[0005e9f0] 2e88                      move.l     a0,(a7)
[0005e9f2] 2057                      movea.l    (a7),a0
[0005e9f4] 2068 000c                 movea.l    12(a0),a0
[0005e9f8] 2257                      movea.l    (a7),a1
[0005e9fa] 2269 000c                 movea.l    12(a1),a1
[0005e9fe] 2269 0092                 movea.l    146(a1),a1
[0005ea02] 4e91                      jsr        (a1)
[0005ea04] 7001                      moveq.l    #1,d0
[0005ea06] 584f                      addq.w     #4,a7
[0005ea08] 4e75                      rts

Aev_GetApTerm:
[0005ea0a] 4eb9 0004 a30e            jsr        Aev_quit
[0005ea10] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ea16] 317c 0001 027e            move.w     #$0001,638(a0)
[0005ea1c] 7001                      moveq.l    #1,d0
[0005ea1e] 4e75                      rts

Aev_GetScChanged:
[0005ea20] 91c8                      suba.l     a0,a0
[0005ea22] 701c                      moveq.l    #28,d0
[0005ea24] 4eb9 0005 6a20            jsr        Awi_sendall
[0005ea2a] 7001                      moveq.l    #1,d0
[0005ea2c] 4e75                      rts

Aev_GetFntChanged:
[0005ea2e] 4fef ff8e                 lea.l      -114(a7),a7
[0005ea32] 4241                      clr.w      d1
[0005ea34] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ea3a] 3028 0010                 move.w     16(a0),d0
[0005ea3e] 4eb9 0007 21de            jsr        vst_unload_fonts
[0005ea44] 41d7                      lea.l      (a7),a0
[0005ea46] 4241                      clr.w      d1
[0005ea48] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005ea4e] 3029 0010                 move.w     16(a1),d0
[0005ea52] 4eb9 0007 5360            jsr        vq_extnd
[0005ea58] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ea5e] 316f 0014 0284            move.w     20(a7),644(a0)
[0005ea64] 4241                      clr.w      d1
[0005ea66] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ea6c] 3028 0010                 move.w     16(a0),d0
[0005ea70] 4eb9 0007 218a            jsr        vst_load_fonts
[0005ea76] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ea7c] d168 0284                 add.w      d0,644(a0)
[0005ea80] 91c8                      suba.l     a0,a0
[0005ea82] 7032                      moveq.l    #50,d0
[0005ea84] 4eb9 0005 6a20            jsr        Awi_sendall
[0005ea8a] 7001                      moveq.l    #1,d0
[0005ea8c] 4fef 0072                 lea.l      114(a7),a7
[0005ea90] 4e75                      rts

Aev_GetPrnChanged:
[0005ea92] 594f                      subq.w     #4,a7
[0005ea94] 2e88                      move.l     a0,(a7)
[0005ea96] 2057                      movea.l    (a7),a0
[0005ea98] 2050                      movea.l    (a0),a0
[0005ea9a] 5c48                      addq.w     #6,a0
[0005ea9c] 7033                      moveq.l    #51,d0
[0005ea9e] 4eb9 0005 6a20            jsr        Awi_sendall
[0005eaa4] 7001                      moveq.l    #1,d0
[0005eaa6] 584f                      addq.w     #4,a7
[0005eaa8] 4e75                      rts

Aev_GetColorsChanged:
[0005eaaa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005eab0] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[0005eab6] 6e18                      bgt.s      Aev_GetColorsChanged_1
[0005eab8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005eabe] 5048                      addq.w     #8,a0
[0005eac0] 72ff                      moveq.l    #-1,d1
[0005eac2] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005eac8] 3011                      move.w     (a1),d0
[0005eaca] 4eb9 0005 eb60            jsr        Aev_WmRedraw
Aev_GetColorsChanged_1:
[0005ead0] 7001                      moveq.l    #1,d0
[0005ead2] 4e75                      rts

Aev_GetAcClose:
[0005ead4] 594f                      subq.w     #4,a7
[0005ead6] 4eb9 0005 5e8c            jsr        Awi_root
[0005eadc] 2e88                      move.l     a0,(a7)
[0005eade] 2017                      move.l     (a7),d0
[0005eae0] 6604                      bne.s      Aev_GetAcClose_1
[0005eae2] 4240                      clr.w      d0
[0005eae4] 605a                      bra.s      Aev_GetAcClose_2
Aev_GetAcClose_1:
[0005eae6] 4eb9 0005 5de4            jsr        Awi_invalid
[0005eaec] 4eb9 0004 a2f8            jsr        Aev_unhidepointer
[0005eaf2] 91c8                      suba.l     a0,a0
[0005eaf4] 7001                      moveq.l    #1,d0
[0005eaf6] 4eb9 0005 6a20            jsr        Awi_sendall
[0005eafc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005eb02] 3028 0238                 move.w     568(a0),d0
[0005eb06] 6636                      bne.s      Aev_GetAcClose_3
[0005eb08] 2079 000d fbaa            movea.l    ListOfApps,a0
[0005eb0e] 2279 000d fbaa            movea.l    ListOfApps,a1
[0005eb14] 2269 0008                 movea.l    8(a1),a1
[0005eb18] 4e91                      jsr        (a1)
[0005eb1a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005eb20] 3028 0236                 move.w     566(a0),d0
[0005eb24] 6618                      bne.s      Aev_GetAcClose_3
[0005eb26] 72ff                      moveq.l    #-1,d1
[0005eb28] 91c8                      suba.l     a0,a0
[0005eb2a] 4240                      clr.w      d0
[0005eb2c] 4eb9 0005 f56e            jsr        Aev_AccID
[0005eb32] 72ff                      moveq.l    #-1,d1
[0005eb34] 91c8                      suba.l     a0,a0
[0005eb36] 4240                      clr.w      d0
[0005eb38] 4eb9 0005 fc0e            jsr        Aev_AvProtokoll
Aev_GetAcClose_3:
[0005eb3e] 7001                      moveq.l    #1,d0
Aev_GetAcClose_2:
[0005eb40] 584f                      addq.w     #4,a7
[0005eb42] 4e75                      rts

Aev_GetAcOpen:
[0005eb44] 594f                      subq.w     #4,a7
[0005eb46] 4eb9 0005 5e8c            jsr        Awi_root
[0005eb4c] 2e88                      move.l     a0,(a7)
[0005eb4e] 2017                      move.l     (a7),d0
[0005eb50] 6708                      beq.s      Aev_GetAcOpen_1
[0005eb52] 2057                      movea.l    (a7),a0
[0005eb54] 4eb9 0005 6bea            jsr        Awi_show
Aev_GetAcOpen_1:
[0005eb5a] 7001                      moveq.l    #1,d0
[0005eb5c] 584f                      addq.w     #4,a7
[0005eb5e] 4e75                      rts

Aev_WmRedraw:
[0005eb60] 4fef ffe6                 lea.l      -26(a7),a7
[0005eb64] 3f40 0018                 move.w     d0,24(a7)
[0005eb68] 3f41 0016                 move.w     d1,22(a7)
[0005eb6c] 2f48 0012                 move.l     a0,18(a7)
[0005eb70] 3ebc 0014                 move.w     #$0014,(a7)
[0005eb74] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005eb7a] 3f50 0002                 move.w     (a0),2(a7)
[0005eb7e] 426f 0004                 clr.w      4(a7)
[0005eb82] 302f 0016                 move.w     22(a7),d0
[0005eb86] 6a04                      bpl.s      Aev_WmRedraw_1
[0005eb88] 4240                      clr.w      d0
[0005eb8a] 6004                      bra.s      Aev_WmRedraw_2
Aev_WmRedraw_1:
[0005eb8c] 302f 0016                 move.w     22(a7),d0
Aev_WmRedraw_2:
[0005eb90] 3f40 0006                 move.w     d0,6(a7)
[0005eb94] 206f 0012                 movea.l    18(a7),a0
[0005eb98] 3f50 0008                 move.w     (a0),8(a7)
[0005eb9c] 206f 0012                 movea.l    18(a7),a0
[0005eba0] 3f68 0002 000a            move.w     2(a0),10(a7)
[0005eba6] 206f 0012                 movea.l    18(a7),a0
[0005ebaa] 3f68 0004 000c            move.w     4(a0),12(a7)
[0005ebb0] 206f 0012                 movea.l    18(a7),a0
[0005ebb4] 3f68 0006 000e            move.w     6(a0),14(a7)
[0005ebba] 2279 000e 692a            movea.l    _globl,a1
[0005ebc0] 41d7                      lea.l      (a7),a0
[0005ebc2] 7210                      moveq.l    #16,d1
[0005ebc4] 302f 0018                 move.w     24(a7),d0
[0005ebc8] 4eb9 0007 8ae8            jsr        mt_appl_write
[0005ebce] 3f40 0010                 move.w     d0,16(a7)
[0005ebd2] 302f 0016                 move.w     22(a7),d0
[0005ebd6] 6a4e                      bpl.s      Aev_WmRedraw_3
[0005ebd8] 206f 0012                 movea.l    18(a7),a0
[0005ebdc] 3f28 0006                 move.w     6(a0),-(a7)
[0005ebe0] 206f 0014                 movea.l    20(a7),a0
[0005ebe4] 3f28 0004                 move.w     4(a0),-(a7)
[0005ebe8] 206f 0016                 movea.l    22(a7),a0
[0005ebec] 3f28 0002                 move.w     2(a0),-(a7)
[0005ebf0] 206f 0018                 movea.l    24(a7),a0
[0005ebf4] 3f10                      move.w     (a0),-(a7)
[0005ebf6] 206f 001a                 movea.l    26(a7),a0
[0005ebfa] 3f28 0006                 move.w     6(a0),-(a7)
[0005ebfe] 206f 001c                 movea.l    28(a7),a0
[0005ec02] 3f28 0004                 move.w     4(a0),-(a7)
[0005ec06] 2079 000e 692a            movea.l    _globl,a0
[0005ec0c] 226f 001e                 movea.l    30(a7),a1
[0005ec10] 3429 0002                 move.w     2(a1),d2
[0005ec14] 226f 001e                 movea.l    30(a7),a1
[0005ec18] 3211                      move.w     (a1),d1
[0005ec1a] 7003                      moveq.l    #3,d0
[0005ec1c] 4eb9 0007 a0b4            jsr        mt_form_dial
[0005ec22] 4fef 000c                 lea.l      12(a7),a7
Aev_WmRedraw_3:
[0005ec26] 302f 0010                 move.w     16(a7),d0
[0005ec2a] 6704                      beq.s      Aev_WmRedraw_4
[0005ec2c] 7001                      moveq.l    #1,d0
[0005ec2e] 6002                      bra.s      Aev_WmRedraw_5
Aev_WmRedraw_4:
[0005ec30] 4240                      clr.w      d0
Aev_WmRedraw_5:
[0005ec32] 4fef 001a                 lea.l      26(a7),a7
[0005ec36] 4e75                      rts

