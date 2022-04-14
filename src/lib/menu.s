call_click:
[0004d0e0] 4fef ffee                 lea.l      -18(a7),a7
[0004d0e4] 2f48 000e                 move.l     a0,14(a7)
[0004d0e8] 2f49 000a                 move.l     a1,10(a7)
[0004d0ec] 3f40 0008                 move.w     d0,8(a7)
[0004d0f0] 322f 0008                 move.w     8(a7),d1
[0004d0f4] 48c1                      ext.l      d1
[0004d0f6] 2001                      move.l     d1,d0
[0004d0f8] d080                      add.l      d0,d0
[0004d0fa] d081                      add.l      d1,d0
[0004d0fc] e788                      lsl.l      #3,d0
[0004d0fe] 206f 000a                 movea.l    10(a7),a0
[0004d102] d1c0                      adda.l     d0,a0
[0004d104] 2e88                      move.l     a0,(a7)
[0004d106] 7020                      moveq.l    #32,d0
[0004d108] 2057                      movea.l    (a7),a0
[0004d10a] c068 0008                 and.w      8(a0),d0
[0004d10e] 660a                      bne.s      $0004D11A
[0004d110] 7008                      moveq.l    #8,d0
[0004d112] 2057                      movea.l    (a7),a0
[0004d114] c068 000a                 and.w      10(a0),d0
[0004d118] 6702                      beq.s      $0004D11C
[0004d11a] 604c                      bra.s      $0004D168
[0004d11c] 2057                      movea.l    (a7),a0
[0004d11e] 41e8 0018                 lea.l      24(a0),a0
[0004d122] 2f48 0004                 move.l     a0,4(a7)
[0004d126] 206f 0004                 movea.l    4(a7),a0
[0004d12a] 3028 0008                 move.w     8(a0),d0
[0004d12e] c07c 8000                 and.w      #$8000,d0
[0004d132] 6734                      beq.s      $0004D168
[0004d134] 206f 0004                 movea.l    4(a7),a0
[0004d138] 2010                      move.l     (a0),d0
[0004d13a] 672c                      beq.s      $0004D168
[0004d13c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d142] 216f 000e 0258            move.l     14(a7),600(a0)
[0004d148] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d14e] 216f 000a 025c            move.l     10(a7),604(a0)
[0004d154] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d15a] 316f 0008 0260            move.w     8(a7),608(a0)
[0004d160] 206f 0004                 movea.l    4(a7),a0
[0004d164] 2050                      movea.l    (a0),a0
[0004d166] 4e90                      jsr        (a0)
[0004d168] 4fef 0012                 lea.l      18(a7),a7
[0004d16c] 4e75                      rts
Ame_titmenu:
[0004d16e] 4fef fff6                 lea.l      -10(a7),a7
[0004d172] 2f48 0006                 move.l     a0,6(a7)
[0004d176] 3f40 0004                 move.w     d0,4(a7)
[0004d17a] 206f 0006                 movea.l    6(a7),a0
[0004d17e] 3428 0002                 move.w     2(a0),d2
[0004d182] 48c2                      ext.l      d2
[0004d184] 2202                      move.l     d2,d1
[0004d186] d281                      add.l      d1,d1
[0004d188] d282                      add.l      d2,d1
[0004d18a] e789                      lsl.l      #3,d1
[0004d18c] 206f 0006                 movea.l    6(a7),a0
[0004d190] 3230 1802                 move.w     2(a0,d1.l),d1
[0004d194] 48c1                      ext.l      d1
[0004d196] 2001                      move.l     d1,d0
[0004d198] d080                      add.l      d0,d0
[0004d19a] d081                      add.l      d1,d0
[0004d19c] e788                      lsl.l      #3,d0
[0004d19e] 206f 0006                 movea.l    6(a7),a0
[0004d1a2] 3f70 0802 0002            move.w     2(a0,d0.l),2(a7)
[0004d1a8] 206f 0006                 movea.l    6(a7),a0
[0004d1ac] 3228 0004                 move.w     4(a0),d1
[0004d1b0] 48c1                      ext.l      d1
[0004d1b2] 2001                      move.l     d1,d0
[0004d1b4] d080                      add.l      d0,d0
[0004d1b6] d081                      add.l      d1,d0
[0004d1b8] e788                      lsl.l      #3,d0
[0004d1ba] 206f 0006                 movea.l    6(a7),a0
[0004d1be] 3eb0 0802                 move.w     2(a0,d0.l),(a7)
[0004d1c2] 602c                      bra.s      $0004D1F0
[0004d1c4] 322f 0002                 move.w     2(a7),d1
[0004d1c8] 48c1                      ext.l      d1
[0004d1ca] 2001                      move.l     d1,d0
[0004d1cc] d080                      add.l      d0,d0
[0004d1ce] d081                      add.l      d1,d0
[0004d1d0] e788                      lsl.l      #3,d0
[0004d1d2] 206f 0006                 movea.l    6(a7),a0
[0004d1d6] 3f70 0800 0002            move.w     0(a0,d0.l),2(a7)
[0004d1dc] 3217                      move.w     (a7),d1
[0004d1de] 48c1                      ext.l      d1
[0004d1e0] 2001                      move.l     d1,d0
[0004d1e2] d080                      add.l      d0,d0
[0004d1e4] d081                      add.l      d1,d0
[0004d1e6] e788                      lsl.l      #3,d0
[0004d1e8] 206f 0006                 movea.l    6(a7),a0
[0004d1ec] 3eb0 0800                 move.w     0(a0,d0.l),(a7)
[0004d1f0] 302f 0004                 move.w     4(a7),d0
[0004d1f4] b06f 0002                 cmp.w      2(a7),d0
[0004d1f8] 66ca                      bne.s      $0004D1C4
[0004d1fa] 3017                      move.w     (a7),d0
[0004d1fc] 4fef 000a                 lea.l      10(a7),a7
[0004d200] 4e75                      rts
Ame_tnormal:
[0004d202] 2f0a                      move.l     a2,-(a7)
[0004d204] 4fef ffec                 lea.l      -20(a7),a7
[0004d208] 2f48 0010                 move.l     a0,16(a7)
[0004d20c] 2f49 000c                 move.l     a1,12(a7)
[0004d210] 3f40 000a                 move.w     d0,10(a7)
[0004d214] 3f41 0008                 move.w     d1,8(a7)
[0004d218] 206f 0010                 movea.l    16(a7),a0
[0004d21c] 2068 005e                 movea.l    94(a0),a0
[0004d220] b1ef 000c                 cmpa.l     12(a7),a0
[0004d224] 6702                      beq.s      $0004D228
[0004d226] 604e                      bra.s      $0004D276
[0004d228] 302f 000a                 move.w     10(a7),d0
[0004d22c] 226f 000c                 movea.l    12(a7),a1
[0004d230] 41d7                      lea.l      (a7),a0
[0004d232] 4eb9 0004 fe06            jsr        Aob_offset
[0004d238] 322f 000a                 move.w     10(a7),d1
[0004d23c] 48c1                      ext.l      d1
[0004d23e] 2001                      move.l     d1,d0
[0004d240] d080                      add.l      d0,d0
[0004d242] d081                      add.l      d1,d0
[0004d244] e788                      lsl.l      #3,d0
[0004d246] d1af 000c                 add.l      d0,12(a7)
[0004d24a] 302f 0008                 move.w     8(a7),d0
[0004d24e] 670c                      beq.s      $0004D25C
[0004d250] 206f 000c                 movea.l    12(a7),a0
[0004d254] 0068 0001 000a            ori.w      #$0001,10(a0)
[0004d25a] 600a                      bra.s      $0004D266
[0004d25c] 206f 000c                 movea.l    12(a7),a0
[0004d260] 0268 fffe 000a            andi.w     #$FFFE,10(a0)
[0004d266] 43d7                      lea.l      (a7),a1
[0004d268] 206f 0010                 movea.l    16(a7),a0
[0004d26c] 246f 0010                 movea.l    16(a7),a2
[0004d270] 246a 006a                 movea.l    106(a2),a2
[0004d274] 4e92                      jsr        (a2)
[0004d276] 4fef 0014                 lea.l      20(a7),a7
[0004d27a] 245f                      movea.l    (a7)+,a2
[0004d27c] 4e75                      rts
Ame_menu:
[0004d27e] 2f0a                      move.l     a2,-(a7)
[0004d280] 4fef ffca                 lea.l      -54(a7),a7
[0004d284] 2f48 0032                 move.l     a0,50(a7)
[0004d288] 2f49 002e                 move.l     a1,46(a7)
[0004d28c] 3f40 002c                 move.w     d0,44(a7)
[0004d290] 41f9 000e 0c40            lea.l      $000E0C40,a0
[0004d296] 43ef 0018                 lea.l      24(a7),a1
[0004d29a] 22d8                      move.l     (a0)+,(a1)+
[0004d29c] 22d8                      move.l     (a0)+,(a1)+
[0004d29e] 302f 002c                 move.w     44(a7),d0
[0004d2a2] 206f 002e                 movea.l    46(a7),a0
[0004d2a6] 6100 fec6                 bsr        Ame_titmenu
[0004d2aa] 3f40 0012                 move.w     d0,18(a7)
[0004d2ae] 7201                      moveq.l    #1,d1
[0004d2b0] 302f 002c                 move.w     44(a7),d0
[0004d2b4] 226f 002e                 movea.l    46(a7),a1
[0004d2b8] 206f 0032                 movea.l    50(a7),a0
[0004d2bc] 6100 ff44                 bsr        Ame_tnormal
[0004d2c0] 2f39 000e 692a            move.l     _globl,-(a7)
[0004d2c6] 486f 0004                 pea.l      4(a7)
[0004d2ca] 486f 0010                 pea.l      16(a7)
[0004d2ce] 43ef 0016                 lea.l      22(a7),a1
[0004d2d2] 41ef 0018                 lea.l      24(a7),a0
[0004d2d6] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0004d2dc] 4fef 000c                 lea.l      12(a7),a7
[0004d2e0] 7001                      moveq.l    #1,d0
[0004d2e2] 322f 0008                 move.w     8(a7),d1
[0004d2e6] b340                      eor.w      d1,d0
[0004d2e8] c07c 0001                 and.w      #$0001,d0
[0004d2ec] 3f40 0008                 move.w     d0,8(a7)
[0004d2f0] 43ef 002c                 lea.l      44(a7),a1
[0004d2f4] 701f                      moveq.l    #31,d0
[0004d2f6] 206f 0032                 movea.l    50(a7),a0
[0004d2fa] 246f 0032                 movea.l    50(a7),a2
[0004d2fe] 246a 0004                 movea.l    4(a2),a2
[0004d302] 4e92                      jsr        (a2)
[0004d304] 6000 0546                 bra        $0004D84C
[0004d308] 3f7c ffff 0014            move.w     #$FFFF,20(a7)
[0004d30e] 426f 0010                 clr.w      16(a7)
[0004d312] 322f 0012                 move.w     18(a7),d1
[0004d316] 48c1                      ext.l      d1
[0004d318] 2001                      move.l     d1,d0
[0004d31a] d080                      add.l      d0,d0
[0004d31c] d081                      add.l      d1,d0
[0004d31e] e788                      lsl.l      #3,d0
[0004d320] 206f 002e                 movea.l    46(a7),a0
[0004d324] 3f70 0810 0006            move.w     16(a0,d0.l),6(a7)
[0004d32a] 322f 0012                 move.w     18(a7),d1
[0004d32e] 48c1                      ext.l      d1
[0004d330] 2001                      move.l     d1,d0
[0004d332] d080                      add.l      d0,d0
[0004d334] d081                      add.l      d1,d0
[0004d336] e788                      lsl.l      #3,d0
[0004d338] 206f 002e                 movea.l    46(a7),a0
[0004d33c] 3f70 0812 0004            move.w     18(a0,d0.l),4(a7)
[0004d342] 302f 0012                 move.w     18(a7),d0
[0004d346] 226f 002e                 movea.l    46(a7),a1
[0004d34a] 41ef 0020                 lea.l      32(a7),a0
[0004d34e] 4eb9 0004 fe06            jsr        Aob_offset
[0004d354] 302f 0020                 move.w     32(a7),d0
[0004d358] 6a1e                      bpl.s      $0004D378
[0004d35a] 302f 0020                 move.w     32(a7),d0
[0004d35e] 342f 0012                 move.w     18(a7),d2
[0004d362] 48c2                      ext.l      d2
[0004d364] 2202                      move.l     d2,d1
[0004d366] d281                      add.l      d1,d1
[0004d368] d282                      add.l      d2,d1
[0004d36a] e789                      lsl.l      #3,d1
[0004d36c] 206f 002e                 movea.l    46(a7),a0
[0004d370] 9170 1810                 sub.w      d0,16(a0,d1.l)
[0004d374] 426f 0020                 clr.w      32(a7)
[0004d378] 302f 0022                 move.w     34(a7),d0
[0004d37c] 6a1e                      bpl.s      $0004D39C
[0004d37e] 302f 0022                 move.w     34(a7),d0
[0004d382] 342f 0012                 move.w     18(a7),d2
[0004d386] 48c2                      ext.l      d2
[0004d388] 2202                      move.l     d2,d1
[0004d38a] d281                      add.l      d1,d1
[0004d38c] d282                      add.l      d2,d1
[0004d38e] e789                      lsl.l      #3,d1
[0004d390] 206f 002e                 movea.l    46(a7),a0
[0004d394] 9170 1812                 sub.w      d0,18(a0,d1.l)
[0004d398] 426f 0022                 clr.w      34(a7)
[0004d39c] 302f 0020                 move.w     32(a7),d0
[0004d3a0] d06f 0024                 add.w      36(a7),d0
[0004d3a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d3aa] 9068 0008                 sub.w      8(a0),d0
[0004d3ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d3b4] 9068 000c                 sub.w      12(a0),d0
[0004d3b8] 3f40 0002                 move.w     d0,2(a7)
[0004d3bc] 302f 0002                 move.w     2(a7),d0
[0004d3c0] 6f22                      ble.s      $0004D3E4
[0004d3c2] 302f 0002                 move.w     2(a7),d0
[0004d3c6] 342f 0012                 move.w     18(a7),d2
[0004d3ca] 48c2                      ext.l      d2
[0004d3cc] 2202                      move.l     d2,d1
[0004d3ce] d281                      add.l      d1,d1
[0004d3d0] d282                      add.l      d2,d1
[0004d3d2] e789                      lsl.l      #3,d1
[0004d3d4] 206f 002e                 movea.l    46(a7),a0
[0004d3d8] 9170 1810                 sub.w      d0,16(a0,d1.l)
[0004d3dc] 302f 0002                 move.w     2(a7),d0
[0004d3e0] 916f 0020                 sub.w      d0,32(a7)
[0004d3e4] 302f 0022                 move.w     34(a7),d0
[0004d3e8] d06f 0026                 add.w      38(a7),d0
[0004d3ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d3f2] 9068 000a                 sub.w      10(a0),d0
[0004d3f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d3fc] 9068 000e                 sub.w      14(a0),d0
[0004d400] 3f40 0002                 move.w     d0,2(a7)
[0004d404] 302f 0002                 move.w     2(a7),d0
[0004d408] 6f22                      ble.s      $0004D42C
[0004d40a] 302f 0002                 move.w     2(a7),d0
[0004d40e] 342f 0012                 move.w     18(a7),d2
[0004d412] 48c2                      ext.l      d2
[0004d414] 2202                      move.l     d2,d1
[0004d416] d281                      add.l      d1,d1
[0004d418] d282                      add.l      d2,d1
[0004d41a] e789                      lsl.l      #3,d1
[0004d41c] 206f 002e                 movea.l    46(a7),a0
[0004d420] 9170 1812                 sub.w      d0,18(a0,d1.l)
[0004d424] 302f 0002                 move.w     2(a7),d0
[0004d428] 916f 0022                 sub.w      d0,34(a7)
[0004d42c] 41ef 0020                 lea.l      32(a7),a0
[0004d430] 4eb9 0005 009c            jsr        Aob_save
[0004d436] 2f48 0028                 move.l     a0,40(a7)
[0004d43a] 3f2f 0026                 move.w     38(a7),-(a7)
[0004d43e] 3f2f 0026                 move.w     38(a7),-(a7)
[0004d442] 3f2f 0026                 move.w     38(a7),-(a7)
[0004d446] 2279 000e 692a            movea.l    _globl,a1
[0004d44c] 342f 0026                 move.w     38(a7),d2
[0004d450] 7206                      moveq.l    #6,d1
[0004d452] 302f 0018                 move.w     24(a7),d0
[0004d456] 206f 0034                 movea.l    52(a7),a0
[0004d45a] 4eb9 0007 9c0c            jsr        mt_objc_draw
[0004d460] 5c4f                      addq.w     #6,a7
[0004d462] 6000 03e4                 bra        $0004D848
[0004d466] 7003                      moveq.l    #3,d0
[0004d468] 4eb9 0005 ae7e            jsr        Awi_update
[0004d46e] 2f39 000e 692a            move.l     _globl,-(a7)
[0004d474] 486f 0004                 pea.l      4(a7)
[0004d478] 486f 0008                 pea.l      8(a7)
[0004d47c] 486f 000c                 pea.l      12(a7)
[0004d480] 486f 0010                 pea.l      16(a7)
[0004d484] 486f 001e                 pea.l      30(a7)
[0004d488] 42a7                      clr.l      -(a7)
[0004d48a] 4267                      clr.w      -(a7)
[0004d48c] 4267                      clr.w      -(a7)
[0004d48e] 4267                      clr.w      -(a7)
[0004d490] 4267                      clr.w      -(a7)
[0004d492] 4267                      clr.w      -(a7)
[0004d494] 7001                      moveq.l    #1,d0
[0004d496] 3f00                      move.w     d0,-(a7)
[0004d498] 7001                      moveq.l    #1,d0
[0004d49a] 3f00                      move.w     d0,-(a7)
[0004d49c] 3f2f 0034                 move.w     52(a7),-(a7)
[0004d4a0] 3f2f 0038                 move.w     56(a7),-(a7)
[0004d4a4] 7001                      moveq.l    #1,d0
[0004d4a6] 3f00                      move.w     d0,-(a7)
[0004d4a8] 3f2f 0038                 move.w     56(a7),-(a7)
[0004d4ac] 43ef 003e                 lea.l      62(a7),a1
[0004d4b0] 91c8                      suba.l     a0,a0
[0004d4b2] 7401                      moveq.l    #1,d2
[0004d4b4] 7201                      moveq.l    #1,d1
[0004d4b6] 7006                      moveq.l    #6,d0 MU_BUTTON | MU_M1
[0004d4b8] 4eb9 0007 9240            jsr        mt_evnt_multi
[0004d4be] 4fef 0032                 lea.l      50(a7),a7
[0004d4c2] 3f40 000e                 move.w     d0,14(a7)
[0004d4c6] 7002                      moveq.l    #2,d0
[0004d4c8] 4eb9 0005 ae7e            jsr        Awi_update
[0004d4ce] 3f2f 000a                 move.w     10(a7),-(a7)
[0004d4d2] 342f 000e                 move.w     14(a7),d2
[0004d4d6] 7201                      moveq.l    #1,d1
[0004d4d8] 302f 0014                 move.w     20(a7),d0
[0004d4dc] 206f 0030                 movea.l    48(a7),a0
[0004d4e0] 4eb9 0004 8fd4            jsr        Adr_find
[0004d4e6] 544f                      addq.w     #2,a7
[0004d4e8] 3f40 0016                 move.w     d0,22(a7)
[0004d4ec] 302f 0016                 move.w     22(a7),d0
[0004d4f0] b06f 0012                 cmp.w      18(a7),d0
[0004d4f4] 6606                      bne.s      $0004D4FC
[0004d4f6] 3f7c ffff 0016            move.w     #$FFFF,22(a7)
[0004d4fc] 302f 0016                 move.w     22(a7),d0
[0004d500] b06f 0014                 cmp.w      20(a7),d0
[0004d504] 6700 014a                 beq        $0004D650
[0004d508] 2279 000e 692a            movea.l    _globl,a1
[0004d50e] 91c8                      suba.l     a0,a0
[0004d510] 303c 0100                 move.w     #$0100,d0
[0004d514] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004d51a] 302f 0010                 move.w     16(a7),d0
[0004d51e] 6762                      beq.s      $0004D582
[0004d520] 322f 0014                 move.w     20(a7),d1
[0004d524] 48c1                      ext.l      d1
[0004d526] 2001                      move.l     d1,d0
[0004d528] d080                      add.l      d0,d0
[0004d52a] d081                      add.l      d1,d0
[0004d52c] e788                      lsl.l      #3,d0
[0004d52e] 206f 002e                 movea.l    46(a7),a0
[0004d532] 0070 0001 080a            ori.w      #$0001,10(a0,d0.l)
[0004d538] 7001                      moveq.l    #1,d0
[0004d53a] 3f00                      move.w     d0,-(a7)
[0004d53c] 322f 0016                 move.w     22(a7),d1
[0004d540] 48c1                      ext.l      d1
[0004d542] 2001                      move.l     d1,d0
[0004d544] d080                      add.l      d0,d0
[0004d546] d081                      add.l      d1,d0
[0004d548] e788                      lsl.l      #3,d0
[0004d54a] 206f 0030                 movea.l    48(a7),a0
[0004d54e] 3030 080a                 move.w     10(a0,d0.l),d0
[0004d552] c07c fffe                 and.w      #$FFFE,d0
[0004d556] 3f00                      move.w     d0,-(a7)
[0004d558] 3f2f 0022                 move.w     34(a7),-(a7)
[0004d55c] 3f2f 0022                 move.w     34(a7),-(a7)
[0004d560] 3f2f 0022                 move.w     34(a7),-(a7)
[0004d564] 2279 000e 692a            movea.l    _globl,a1
[0004d56a] 342f 0022                 move.w     34(a7),d2
[0004d56e] 4241                      clr.w      d1
[0004d570] 302f 001e                 move.w     30(a7),d0
[0004d574] 206f 0038                 movea.l    56(a7),a0
[0004d578] 4eb9 0007 9f2c            jsr        mt_objc_change
[0004d57e] 4fef 000a                 lea.l      10(a7),a7
[0004d582] 302f 0016                 move.w     22(a7),d0
[0004d586] 6b00 00ac                 bmi        $0004D634
[0004d58a] 7008                      moveq.l    #8,d0
[0004d58c] 342f 0016                 move.w     22(a7),d2
[0004d590] 48c2                      ext.l      d2
[0004d592] 2202                      move.l     d2,d1
[0004d594] d281                      add.l      d1,d1
[0004d596] d282                      add.l      d2,d1
[0004d598] e789                      lsl.l      #3,d1
[0004d59a] 206f 002e                 movea.l    46(a7),a0
[0004d59e] c070 180a                 and.w      10(a0,d1.l),d0
[0004d5a2] 6600 0090                 bne        $0004D634
[0004d5a6] 302f 0016                 move.w     22(a7),d0
[0004d5aa] 226f 002e                 movea.l    46(a7),a1
[0004d5ae] 41ef 0018                 lea.l      24(a7),a0
[0004d5b2] 4eb9 0004 fe06            jsr        Aob_offset
[0004d5b8] 7001                      moveq.l    #1,d0
[0004d5ba] 3f00                      move.w     d0,-(a7)
[0004d5bc] 7001                      moveq.l    #1,d0
[0004d5be] 342f 0018                 move.w     24(a7),d2
[0004d5c2] 48c2                      ext.l      d2
[0004d5c4] 2202                      move.l     d2,d1
[0004d5c6] d281                      add.l      d1,d1
[0004d5c8] d282                      add.l      d2,d1
[0004d5ca] e789                      lsl.l      #3,d1
[0004d5cc] 206f 0030                 movea.l    48(a7),a0
[0004d5d0] 8070 180a                 or.w       10(a0,d1.l),d0
[0004d5d4] 3f00                      move.w     d0,-(a7)
[0004d5d6] 3f2f 0022                 move.w     34(a7),-(a7)
[0004d5da] 3f2f 0022                 move.w     34(a7),-(a7)
[0004d5de] 3f2f 0022                 move.w     34(a7),-(a7)
[0004d5e2] 2279 000e 692a            movea.l    _globl,a1
[0004d5e8] 342f 0022                 move.w     34(a7),d2
[0004d5ec] 4241                      clr.w      d1
[0004d5ee] 302f 0020                 move.w     32(a7),d0
[0004d5f2] 206f 0038                 movea.l    56(a7),a0
[0004d5f6] 4eb9 0007 9f2c            jsr        mt_objc_change
[0004d5fc] 4fef 000a                 lea.l      10(a7),a7
[0004d600] 322f 0016                 move.w     22(a7),d1
[0004d604] 48c1                      ext.l      d1
[0004d606] 2001                      move.l     d1,d0
[0004d608] d080                      add.l      d0,d0
[0004d60a] d081                      add.l      d1,d0
[0004d60c] e788                      lsl.l      #3,d0
[0004d60e] 206f 002e                 movea.l    46(a7),a0
[0004d612] 0270 fffe 080a            andi.w     #$FFFE,10(a0,d0.l)
[0004d618] 3f7c 0001 0010            move.w     #$0001,16(a7)
[0004d61e] 43ef 0016                 lea.l      22(a7),a1
[0004d622] 7020                      moveq.l    #32,d0
[0004d624] 206f 0032                 movea.l    50(a7),a0
[0004d628] 246f 0032                 movea.l    50(a7),a2
[0004d62c] 246a 0004                 movea.l    4(a2),a2
[0004d630] 4e92                      jsr        (a2)
[0004d632] 6004                      bra.s      $0004D638
[0004d634] 426f 0010                 clr.w      16(a7)
[0004d638] 2279 000e 692a            movea.l    _globl,a1
[0004d63e] 91c8                      suba.l     a0,a0
[0004d640] 303c 0101                 move.w     #$0101,d0
[0004d644] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004d64a] 3f6f 0016 0014            move.w     22(a7),20(a7)
[0004d650] 302f 0016                 move.w     22(a7),d0
[0004d654] 6a00 0114                 bpl        $0004D76A
[0004d658] 3f2f 000a                 move.w     10(a7),-(a7)
[0004d65c] 342f 000e                 move.w     14(a7),d2
[0004d660] 7208                      moveq.l    #8,d1
[0004d662] 206f 0030                 movea.l    48(a7),a0
[0004d666] 3028 0002                 move.w     2(a0),d0
[0004d66a] 206f 0030                 movea.l    48(a7),a0
[0004d66e] 4eb9 0004 8fd4            jsr        Adr_find
[0004d674] 544f                      addq.w     #2,a7
[0004d676] 3f40 0016                 move.w     d0,22(a7)
[0004d67a] 302f 0016                 move.w     22(a7),d0
[0004d67e] 6b00 00ea                 bmi        $0004D76A
[0004d682] 2f39 000e 692a            move.l     _globl,-(a7)
[0004d688] 486f 0004                 pea.l      4(a7)
[0004d68c] 486f 0010                 pea.l      16(a7)
[0004d690] 43ef 0016                 lea.l      22(a7),a1
[0004d694] 41ef 0018                 lea.l      24(a7),a0
[0004d698] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0004d69e] 4fef 000c                 lea.l      12(a7),a7
[0004d6a2] 7001                      moveq.l    #1,d0
[0004d6a4] 322f 0008                 move.w     8(a7),d1
[0004d6a8] b340                      eor.w      d1,d0
[0004d6aa] c07c 0001                 and.w      #$0001,d0
[0004d6ae] 3f40 0008                 move.w     d0,8(a7)
[0004d6b2] 302f 0016                 move.w     22(a7),d0
[0004d6b6] b06f 002c                 cmp.w      44(a7),d0
[0004d6ba] 6700 00ae                 beq        $0004D76A
[0004d6be] 322f 0016                 move.w     22(a7),d1
[0004d6c2] 48c1                      ext.l      d1
[0004d6c4] 2001                      move.l     d1,d0
[0004d6c6] d080                      add.l      d0,d0
[0004d6c8] d081                      add.l      d1,d0
[0004d6ca] e788                      lsl.l      #3,d0
[0004d6cc] 206f 002e                 movea.l    46(a7),a0
[0004d6d0] 0c30 0020 0807            cmpi.b     #$20,7(a0,d0.l)
[0004d6d6] 6600 0092                 bne        $0004D76A
[0004d6da] 43ef 0020                 lea.l      32(a7),a1
[0004d6de] 206f 0028                 movea.l    40(a7),a0
[0004d6e2] 4eb9 0005 021e            jsr        Aob_restore
[0004d6e8] 322f 0012                 move.w     18(a7),d1
[0004d6ec] 48c1                      ext.l      d1
[0004d6ee] 2001                      move.l     d1,d0
[0004d6f0] d080                      add.l      d0,d0
[0004d6f2] d081                      add.l      d1,d0
[0004d6f4] e788                      lsl.l      #3,d0
[0004d6f6] 206f 002e                 movea.l    46(a7),a0
[0004d6fa] 31af 0006 0810            move.w     6(a7),16(a0,d0.l)
[0004d700] 322f 0012                 move.w     18(a7),d1
[0004d704] 48c1                      ext.l      d1
[0004d706] 2001                      move.l     d1,d0
[0004d708] d080                      add.l      d0,d0
[0004d70a] d081                      add.l      d1,d0
[0004d70c] e788                      lsl.l      #3,d0
[0004d70e] 206f 002e                 movea.l    46(a7),a0
[0004d712] 31af 0004 0812            move.w     4(a7),18(a0,d0.l)
[0004d718] 4241                      clr.w      d1
[0004d71a] 302f 002c                 move.w     44(a7),d0
[0004d71e] 226f 002e                 movea.l    46(a7),a1
[0004d722] 206f 0032                 movea.l    50(a7),a0
[0004d726] 6100 fada                 bsr        Ame_tnormal
[0004d72a] 3f6f 0016 002c            move.w     22(a7),44(a7)
[0004d730] 302f 002c                 move.w     44(a7),d0
[0004d734] 206f 002e                 movea.l    46(a7),a0
[0004d738] 6100 fa34                 bsr        Ame_titmenu
[0004d73c] 3f40 0012                 move.w     d0,18(a7)
[0004d740] 7201                      moveq.l    #1,d1
[0004d742] 302f 002c                 move.w     44(a7),d0
[0004d746] 226f 002e                 movea.l    46(a7),a1
[0004d74a] 206f 0032                 movea.l    50(a7),a0
[0004d74e] 6100 fab2                 bsr        Ame_tnormal
[0004d752] 43ef 002c                 lea.l      44(a7),a1
[0004d756] 7020                      moveq.l    #32,d0
[0004d758] 206f 0032                 movea.l    50(a7),a0
[0004d75c] 246f 0032                 movea.l    50(a7),a2
[0004d760] 246a 0004                 movea.l    4(a2),a2
[0004d764] 4e92                      jsr        (a2)
[0004d766] 6000 00e4                 bra        $0004D84C
[0004d76a] 302f 0016                 move.w     22(a7),d0
[0004d76e] b06f 002c                 cmp.w      44(a7),d0
[0004d772] 6700 00d4                 beq        $0004D848
[0004d776] 7002                      moveq.l    #2,d0
[0004d778] c06f 000e                 and.w      14(a7),d0
[0004d77c] 6700 00ca                 beq        $0004D848
[0004d780] 43ef 0020                 lea.l      32(a7),a1
[0004d784] 206f 0028                 movea.l    40(a7),a0
[0004d788] 4eb9 0005 021e            jsr        Aob_restore
[0004d78e] 322f 0012                 move.w     18(a7),d1
[0004d792] 48c1                      ext.l      d1
[0004d794] 2001                      move.l     d1,d0
[0004d796] d080                      add.l      d0,d0
[0004d798] d081                      add.l      d1,d0
[0004d79a] e788                      lsl.l      #3,d0
[0004d79c] 206f 002e                 movea.l    46(a7),a0
[0004d7a0] 31af 0006 0810            move.w     6(a7),16(a0,d0.l)
[0004d7a6] 322f 0012                 move.w     18(a7),d1
[0004d7aa] 48c1                      ext.l      d1
[0004d7ac] 2001                      move.l     d1,d0
[0004d7ae] d080                      add.l      d0,d0
[0004d7b0] d081                      add.l      d1,d0
[0004d7b2] e788                      lsl.l      #3,d0
[0004d7b4] 206f 002e                 movea.l    46(a7),a0
[0004d7b8] 31af 0004 0812            move.w     4(a7),18(a0,d0.l)
[0004d7be] 4eb9 0005 0c80            jsr        Aev_release
[0004d7c4] 302f 0016                 move.w     22(a7),d0
[0004d7c8] 6f58                      ble.s      $0004D822
[0004d7ca] 206f 002e                 movea.l    46(a7),a0
[0004d7ce] 302f 0016                 move.w     22(a7),d0
[0004d7d2] b068 0002                 cmp.w      2(a0),d0
[0004d7d6] 674a                      beq.s      $0004D822
[0004d7d8] 206f 002e                 movea.l    46(a7),a0
[0004d7dc] 302f 0016                 move.w     22(a7),d0
[0004d7e0] b068 0004                 cmp.w      4(a0),d0
[0004d7e4] 673c                      beq.s      $0004D822
[0004d7e6] 206f 002e                 movea.l    46(a7),a0
[0004d7ea] 3228 0002                 move.w     2(a0),d1
[0004d7ee] 48c1                      ext.l      d1
[0004d7f0] 2001                      move.l     d1,d0
[0004d7f2] d080                      add.l      d0,d0
[0004d7f4] d081                      add.l      d1,d0
[0004d7f6] e788                      lsl.l      #3,d0
[0004d7f8] 206f 002e                 movea.l    46(a7),a0
[0004d7fc] 322f 0016                 move.w     22(a7),d1
[0004d800] b270 0802                 cmp.w      2(a0,d0.l),d1
[0004d804] 671c                      beq.s      $0004D822
[0004d806] 4eb9 0004 eec0            jsr        Amo_busy
[0004d80c] 302f 0016                 move.w     22(a7),d0
[0004d810] 226f 002e                 movea.l    46(a7),a1
[0004d814] 206f 0032                 movea.l    50(a7),a0
[0004d818] 6100 f8c6                 bsr        call_click
[0004d81c] 4eb9 0004 ef0c            jsr        Amo_unbusy
[0004d822] 4241                      clr.w      d1
[0004d824] 302f 002c                 move.w     44(a7),d0
[0004d828] 226f 002e                 movea.l    46(a7),a1
[0004d82c] 206f 0032                 movea.l    50(a7),a0
[0004d830] 6100 f9d0                 bsr        Ame_tnormal
[0004d834] 93c9                      suba.l     a1,a1
[0004d836] 7021                      moveq.l    #33,d0
[0004d838] 206f 0032                 movea.l    50(a7),a0
[0004d83c] 246f 0032                 movea.l    50(a7),a2
[0004d840] 246a 0004                 movea.l    4(a2),a2
[0004d844] 4e92                      jsr        (a2)
[0004d846] 6008                      bra.s      $0004D850
[0004d848] 6000 fc1c                 bra        $0004D466
[0004d84c] 6000 faba                 bra        $0004D308
[0004d850] 4fef 0036                 lea.l      54(a7),a7
[0004d854] 245f                      movea.l    (a7)+,a2
[0004d856] 4e75                      rts
Ame_submenu:
[0004d858] 2f03                      move.l     d3,-(a7)
[0004d85a] 2f0a                      move.l     a2,-(a7)
[0004d85c] 4fef ffb4                 lea.l      -76(a7),a7
[0004d860] 2f48 0048                 move.l     a0,72(a7)
[0004d864] 3f40 0046                 move.w     d0,70(a7)
[0004d868] 41f9 000e 0c48            lea.l      $000E0C48,a0
[0004d86e] 43ef 0032                 lea.l      50(a7),a1
[0004d872] 22d8                      move.l     (a0)+,(a1)+
[0004d874] 22d8                      move.l     (a0)+,(a1)+
[0004d876] 3f7c 0001 0006            move.w     #$0001,6(a7)
[0004d87c] 3f7c ffff 0026            move.w     #$FFFF,38(a7)
[0004d882] 426f 001c                 clr.w      28(a7)
[0004d886] 322f 0046                 move.w     70(a7),d1
[0004d88a] 48c1                      ext.l      d1
[0004d88c] 2001                      move.l     d1,d0
[0004d88e] d080                      add.l      d0,d0
[0004d890] d081                      add.l      d1,d0
[0004d892] e788                      lsl.l      #3,d0
[0004d894] 206f 0048                 movea.l    72(a7),a0
[0004d898] 3f70 0802 0028            move.w     2(a0,d0.l),40(a7)
[0004d89e] 302f 0028                 move.w     40(a7),d0
[0004d8a2] 6b00 00a2                 bmi        $0004D946
[0004d8a6] 6018                      bra.s      $0004D8C0
[0004d8a8] 322f 0028                 move.w     40(a7),d1
[0004d8ac] 48c1                      ext.l      d1
[0004d8ae] 2001                      move.l     d1,d0
[0004d8b0] d080                      add.l      d0,d0
[0004d8b2] d081                      add.l      d1,d0
[0004d8b4] e788                      lsl.l      #3,d0
[0004d8b6] 206f 0048                 movea.l    72(a7),a0
[0004d8ba] 3f70 0800 0028            move.w     0(a0,d0.l),40(a7)
[0004d8c0] 302f 0028                 move.w     40(a7),d0
[0004d8c4] b06f 0046                 cmp.w      70(a7),d0
[0004d8c8] 671a                      beq.s      $0004D8E4
[0004d8ca] 7004                      moveq.l    #4,d0
[0004d8cc] 342f 0028                 move.w     40(a7),d2
[0004d8d0] 48c2                      ext.l      d2
[0004d8d2] 2202                      move.l     d2,d1
[0004d8d4] d281                      add.l      d1,d1
[0004d8d6] d282                      add.l      d2,d1
[0004d8d8] e789                      lsl.l      #3,d1
[0004d8da] 206f 0048                 movea.l    72(a7),a0
[0004d8de] c070 180a                 and.w      10(a0,d1.l),d0
[0004d8e2] 67c4                      beq.s      $0004D8A8
[0004d8e4] 302f 0028                 move.w     40(a7),d0
[0004d8e8] b06f 0046                 cmp.w      70(a7),d0
[0004d8ec] 6758                      beq.s      $0004D946
[0004d8ee] 322f 0028                 move.w     40(a7),d1
[0004d8f2] 48c1                      ext.l      d1
[0004d8f4] 2001                      move.l     d1,d0
[0004d8f6] d080                      add.l      d0,d0
[0004d8f8] d081                      add.l      d1,d0
[0004d8fa] e788                      lsl.l      #3,d0
[0004d8fc] 206f 0048                 movea.l    72(a7),a0
[0004d900] 3030 0810                 move.w     16(a0,d0.l),d0
[0004d904] 342f 0046                 move.w     70(a7),d2
[0004d908] 48c2                      ext.l      d2
[0004d90a] 2202                      move.l     d2,d1
[0004d90c] d281                      add.l      d1,d1
[0004d90e] d282                      add.l      d2,d1
[0004d910] e789                      lsl.l      #3,d1
[0004d912] 206f 0048                 movea.l    72(a7),a0
[0004d916] 9170 1810                 sub.w      d0,16(a0,d1.l)
[0004d91a] 322f 0028                 move.w     40(a7),d1
[0004d91e] 48c1                      ext.l      d1
[0004d920] 2001                      move.l     d1,d0
[0004d922] d080                      add.l      d0,d0
[0004d924] d081                      add.l      d1,d0
[0004d926] e788                      lsl.l      #3,d0
[0004d928] 206f 0048                 movea.l    72(a7),a0
[0004d92c] 3030 0812                 move.w     18(a0,d0.l),d0
[0004d930] 342f 0046                 move.w     70(a7),d2
[0004d934] 48c2                      ext.l      d2
[0004d936] 2202                      move.l     d2,d1
[0004d938] d281                      add.l      d1,d1
[0004d93a] d282                      add.l      d2,d1
[0004d93c] e789                      lsl.l      #3,d1
[0004d93e] 206f 0048                 movea.l    72(a7),a0
[0004d942] 9170 1812                 sub.w      d0,18(a0,d1.l)
[0004d946] 302f 0046                 move.w     70(a7),d0
[0004d94a] 226f 0048                 movea.l    72(a7),a1
[0004d94e] 41ef 003a                 lea.l      58(a7),a0
[0004d952] 4eb9 0004 fe06            jsr        Aob_offset
[0004d958] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d95e] 302f 003a                 move.w     58(a7),d0
[0004d962] b068 0008                 cmp.w      8(a0),d0
[0004d966] 6c2a                      bge.s      $0004D992
[0004d968] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d96e] 322f 0046                 move.w     70(a7),d1
[0004d972] 48c1                      ext.l      d1
[0004d974] 2001                      move.l     d1,d0
[0004d976] d080                      add.l      d0,d0
[0004d978] d081                      add.l      d1,d0
[0004d97a] e788                      lsl.l      #3,d0
[0004d97c] 226f 0048                 movea.l    72(a7),a1
[0004d980] 33a8 0008 0810            move.w     8(a0),16(a1,d0.l)
[0004d986] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d98c] 3f68 0008 003a            move.w     8(a0),58(a7)
[0004d992] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d998] 302f 003c                 move.w     60(a7),d0
[0004d99c] b068 000a                 cmp.w      10(a0),d0
[0004d9a0] 6c2a                      bge.s      $0004D9CC
[0004d9a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d9a8] 322f 0046                 move.w     70(a7),d1
[0004d9ac] 48c1                      ext.l      d1
[0004d9ae] 2001                      move.l     d1,d0
[0004d9b0] d080                      add.l      d0,d0
[0004d9b2] d081                      add.l      d1,d0
[0004d9b4] e788                      lsl.l      #3,d0
[0004d9b6] 226f 0048                 movea.l    72(a7),a1
[0004d9ba] 33a8 000a 0812            move.w     10(a0),18(a1,d0.l)
[0004d9c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d9c6] 3f68 000a 003c            move.w     10(a0),60(a7)
[0004d9cc] 302f 003a                 move.w     58(a7),d0
[0004d9d0] d06f 003e                 add.w      62(a7),d0
[0004d9d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d9da] 9068 0008                 sub.w      8(a0),d0
[0004d9de] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004d9e4] 9068 000c                 sub.w      12(a0),d0
[0004d9e8] 3f40 0004                 move.w     d0,4(a7)
[0004d9ec] 302f 0004                 move.w     4(a7),d0
[0004d9f0] 6f22                      ble.s      $0004DA14
[0004d9f2] 302f 0004                 move.w     4(a7),d0
[0004d9f6] 342f 0046                 move.w     70(a7),d2
[0004d9fa] 48c2                      ext.l      d2
[0004d9fc] 2202                      move.l     d2,d1
[0004d9fe] d281                      add.l      d1,d1
[0004da00] d282                      add.l      d2,d1
[0004da02] e789                      lsl.l      #3,d1
[0004da04] 206f 0048                 movea.l    72(a7),a0
[0004da08] 9170 1810                 sub.w      d0,16(a0,d1.l)
[0004da0c] 302f 0004                 move.w     4(a7),d0
[0004da10] 916f 003a                 sub.w      d0,58(a7)
[0004da14] 302f 003c                 move.w     60(a7),d0
[0004da18] d06f 0040                 add.w      64(a7),d0
[0004da1c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004da22] 9068 000a                 sub.w      10(a0),d0
[0004da26] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004da2c] 9068 000e                 sub.w      14(a0),d0
[0004da30] 3f40 0004                 move.w     d0,4(a7)
[0004da34] 302f 0004                 move.w     4(a7),d0
[0004da38] 6f22                      ble.s      $0004DA5C
[0004da3a] 302f 0004                 move.w     4(a7),d0
[0004da3e] 342f 0046                 move.w     70(a7),d2
[0004da42] 48c2                      ext.l      d2
[0004da44] 2202                      move.l     d2,d1
[0004da46] d281                      add.l      d1,d1
[0004da48] d282                      add.l      d2,d1
[0004da4a] e789                      lsl.l      #3,d1
[0004da4c] 206f 0048                 movea.l    72(a7),a0
[0004da50] 9170 1812                 sub.w      d0,18(a0,d1.l)
[0004da54] 302f 0004                 move.w     4(a7),d0
[0004da58] 916f 003c                 sub.w      d0,60(a7)
[0004da5c] 41ef 003a                 lea.l      58(a7),a0
[0004da60] 4eb9 0005 009c            jsr        Aob_save
[0004da66] 2f48 0042                 move.l     a0,66(a7)
[0004da6a] 4eb9 0004 ef40            jsr        Amo_hide
[0004da70] 3f2f 0040                 move.w     64(a7),-(a7)
[0004da74] 3f2f 0040                 move.w     64(a7),-(a7)
[0004da78] 3f2f 0040                 move.w     64(a7),-(a7)
[0004da7c] 2279 000e 692a            movea.l    _globl,a1
[0004da82] 342f 0040                 move.w     64(a7),d2
[0004da86] 7206                      moveq.l    #6,d1
[0004da88] 302f 004c                 move.w     76(a7),d0
[0004da8c] 206f 004e                 movea.l    78(a7),a0
[0004da90] 4eb9 0007 9c0c            jsr        mt_objc_draw
[0004da96] 5c4f                      addq.w     #6,a7
[0004da98] 4eb9 0004 ef66            jsr        Amo_show
[0004da9e] 2f39 000e 692a            move.l     _globl,-(a7)
[0004daa4] 486f 0006                 pea.l      6(a7)
[0004daa8] 486f 001a                 pea.l      26(a7)
[0004daac] 43ef 0022                 lea.l      34(a7),a1
[0004dab0] 41ef 0024                 lea.l      36(a7),a0
[0004dab4] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0004daba] 4fef 000c                 lea.l      12(a7),a7
[0004dabe] 526f 0018                 addq.w     #1,24(a7)
[0004dac2] 7001                      moveq.l    #1,d0
[0004dac4] c06f 0012                 and.w      18(a7),d0
[0004dac8] 6708                      beq.s      $0004DAD2
[0004daca] 3f7c 0001 0010            move.w     #$0001,16(a7)
[0004dad0] 6004                      bra.s      $0004DAD6
[0004dad2] 426f 0010                 clr.w      16(a7)
[0004dad6] 6000 0d4e                 bra        $0004E826
[0004dada] 7003                      moveq.l    #3,d0
[0004dadc] 4eb9 0005 ae7e            jsr        Awi_update
[0004dae2] 2f39 000e 692a            move.l     _globl,-(a7)
[0004dae8] 486f 0006                 pea.l      6(a7)
[0004daec] 486f 001c                 pea.l      28(a7)
[0004daf0] 486f 001e                 pea.l      30(a7)
[0004daf4] 486f 0012                 pea.l      18(a7)
[0004daf8] 486f 002a                 pea.l      42(a7)
[0004dafc] 42a7                      clr.l      -(a7)
[0004dafe] 4267                      clr.w      -(a7)
[0004db00] 4267                      clr.w      -(a7)
[0004db02] 4267                      clr.w      -(a7)
[0004db04] 4267                      clr.w      -(a7)
[0004db06] 4267                      clr.w      -(a7)
[0004db08] 7001                      moveq.l    #1,d0
[0004db0a] 3f00                      move.w     d0,-(a7)
[0004db0c] 7001                      moveq.l    #1,d0
[0004db0e] 3f00                      move.w     d0,-(a7)
[0004db10] 3f2f 0040                 move.w     64(a7),-(a7)
[0004db14] 3f2f 0044                 move.w     68(a7),-(a7)
[0004db18] 7001                      moveq.l    #1,d0
[0004db1a] 3f00                      move.w     d0,-(a7)
[0004db1c] 3f2f 0040                 move.w     64(a7),-(a7)
[0004db20] 43ef 004a                 lea.l      74(a7),a1
[0004db24] 91c8                      suba.l     a0,a0
[0004db26] 7401                      moveq.l    #1,d2
[0004db28] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004db2e] 322a 02d0                 move.w     720(a2),d1
[0004db32] 7007                      moveq.l    #7,d0 MU_BUTTON | MU_KEYBD | MU_M1
[0004db34] 4eb9 0007 9240            jsr        mt_evnt_multi
[0004db3a] 4fef 0032                 lea.l      50(a7),a7
[0004db3e] 3f40 001a                 move.w     d0,26(a7)
[0004db42] 7002                      moveq.l    #2,d0
[0004db44] 4eb9 0005 ae7e            jsr        Awi_update
[0004db4a] 7001                      moveq.l    #1,d0
[0004db4c] c06f 001a                 and.w      26(a7),d0
[0004db50] 6700 0902                 beq        $0004E454
[0004db54] 322f 0012                 move.w     18(a7),d1
[0004db58] 302f 0014                 move.w     20(a7),d0
[0004db5c] 4eb9 0004 4284            jsr        nkc_gemks2n
[0004db62] 3f40 0014                 move.w     d0,20(a7)
[0004db66] 3f7c fffe 0028            move.w     #$FFFE,40(a7)
[0004db6c] 302f 0014                 move.w     20(a7),d0
[0004db70] c07c 8000                 and.w      #$8000,d0
[0004db74] 6700 08de                 beq        $0004E454
[0004db78] 102f 0015                 move.b     21(a7),d0
[0004db7c] 4880                      ext.w      d0
[0004db7e] b07c 001b                 cmp.w      #$001B,d0
[0004db82] 6200 08b0                 bhi        $0004E434
[0004db86] d040                      add.w      d0,d0
[0004db88] 303b 0006                 move.w     $0004DB90(pc,d0.w),d0
[0004db8c] 4efb 0002                 jmp        $0004DB90(pc,d0.w)
J35:
[0004db90] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004db92] 0240                      dc.w $0240   ; $0004ddd0-$0004db90
[0004db94] 0240                      dc.w $0240   ; $0004ddd0-$0004db90
[0004db96] 0240                      dc.w $0240   ; $0004ddd0-$0004db90
[0004db98] 0240                      dc.w $0240   ; $0004ddd0-$0004db90
[0004db9a] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004db9c] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004db9e] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dba0] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dba2] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dba4] 004c                      dc.w $004c   ; $0004dbdc-$0004db90
[0004dba6] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dba8] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbaa] 004c                      dc.w $004c   ; $0004dbdc-$0004db90
[0004dbac] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbae] 01ce                      dc.w $01ce   ; $0004dd5e-$0004db90
[0004dbb0] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbb2] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbb4] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbb6] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbb8] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbba] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbbc] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbbe] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbc0] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbc2] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbc4] 08a4                      dc.w $08a4   ; $0004e434-$0004db90
[0004dbc6] 0038                      dc.w $0038   ; $0004dbc8-$0004db90
[0004dbc8] 3f7c ffff 0028            move.w     #$FFFF,40(a7)
[0004dbce] 3f7c ffff 0022            move.w     #$FFFF,34(a7)
[0004dbd4] 426f 0006                 clr.w      6(a7)
[0004dbd8] 6000 087a                 bra        $0004E454
[0004dbdc] 302f 0026                 move.w     38(a7),d0
[0004dbe0] 6b00 0178                 bmi        $0004DD5A
[0004dbe4] 302f 001c                 move.w     28(a7),d0
[0004dbe8] 6700 0160                 beq        $0004DD4A
[0004dbec] 322f 0026                 move.w     38(a7),d1
[0004dbf0] 48c1                      ext.l      d1
[0004dbf2] 2001                      move.l     d1,d0
[0004dbf4] d080                      add.l      d0,d0
[0004dbf6] d081                      add.l      d1,d0
[0004dbf8] e788                      lsl.l      #3,d0
[0004dbfa] 206f 0048                 movea.l    72(a7),a0
[0004dbfe] 3030 0802                 move.w     2(a0,d0.l),d0
[0004dc02] 6f00 0146                 ble        $0004DD4A
[0004dc06] 322f 0026                 move.w     38(a7),d1
[0004dc0a] 48c1                      ext.l      d1
[0004dc0c] 2001                      move.l     d1,d0
[0004dc0e] d080                      add.l      d0,d0
[0004dc10] d081                      add.l      d1,d0
[0004dc12] e788                      lsl.l      #3,d0
[0004dc14] 206f 0048                 movea.l    72(a7),a0
[0004dc18] 3f70 0802 0024            move.w     2(a0,d0.l),36(a7)
[0004dc1e] 302f 0024                 move.w     36(a7),d0
[0004dc22] 6b00 0124                 bmi        $0004DD48
[0004dc26] 322f 0026                 move.w     38(a7),d1
[0004dc2a] 48c1                      ext.l      d1
[0004dc2c] 2001                      move.l     d1,d0
[0004dc2e] d080                      add.l      d0,d0
[0004dc30] d081                      add.l      d1,d0
[0004dc32] e788                      lsl.l      #3,d0
[0004dc34] 206f 0048                 movea.l    72(a7),a0
[0004dc38] 322f 0024                 move.w     36(a7),d1
[0004dc3c] b270 0804                 cmp.w      4(a0,d0.l),d1
[0004dc40] 6600 0106                 bne        $0004DD48
[0004dc44] 7001                      moveq.l    #1,d0
[0004dc46] d06f 0034                 add.w      52(a7),d0
[0004dc4a] 3f00                      move.w     d0,-(a7)
[0004dc4c] 342f 0034                 move.w     52(a7),d2
[0004dc50] d46f 0038                 add.w      56(a7),d2
[0004dc54] 5542                      subq.w     #2,d2
[0004dc56] 7201                      moveq.l    #1,d1
[0004dc58] 302f 0048                 move.w     72(a7),d0
[0004dc5c] 206f 004a                 movea.l    74(a7),a0
[0004dc60] 4eb9 0004 8fd4            jsr        Adr_find
[0004dc66] 544f                      addq.w     #2,a7
[0004dc68] 322f 0026                 move.w     38(a7),d1
[0004dc6c] b240                      cmp.w      d0,d1
[0004dc6e] 6600 00d8                 bne        $0004DD48
[0004dc72] 322f 0024                 move.w     36(a7),d1
[0004dc76] 48c1                      ext.l      d1
[0004dc78] 2001                      move.l     d1,d0
[0004dc7a] d080                      add.l      d0,d0
[0004dc7c] d081                      add.l      d1,d0
[0004dc7e] e788                      lsl.l      #3,d0
[0004dc80] 206f 0048                 movea.l    72(a7),a0
[0004dc84] 0270 ff7f 0808            andi.w     #$FF7F,8(a0,d0.l)
[0004dc8a] 322f 0026                 move.w     38(a7),d1
[0004dc8e] 48c1                      ext.l      d1
[0004dc90] 2001                      move.l     d1,d0
[0004dc92] d080                      add.l      d0,d0
[0004dc94] d081                      add.l      d1,d0
[0004dc96] e788                      lsl.l      #3,d0
[0004dc98] 206f 0048                 movea.l    72(a7),a0
[0004dc9c] 3030 0814                 move.w     20(a0,d0.l),d0
[0004dca0] e240                      asr.w      #1,d0
[0004dca2] 342f 0024                 move.w     36(a7),d2
[0004dca6] 48c2                      ext.l      d2
[0004dca8] 2202                      move.l     d2,d1
[0004dcaa] d281                      add.l      d1,d1
[0004dcac] d282                      add.l      d2,d1
[0004dcae] e789                      lsl.l      #3,d1
[0004dcb0] 206f 0048                 movea.l    72(a7),a0
[0004dcb4] 3180 1810                 move.w     d0,16(a0,d1.l)
[0004dcb8] 322f 0024                 move.w     36(a7),d1
[0004dcbc] 48c1                      ext.l      d1
[0004dcbe] 2001                      move.l     d1,d0
[0004dcc0] d080                      add.l      d0,d0
[0004dcc2] d081                      add.l      d1,d0
[0004dcc4] e788                      lsl.l      #3,d0
[0004dcc6] 206f 0048                 movea.l    72(a7),a0
[0004dcca] 4270 0812                 clr.w      18(a0,d0.l)
[0004dcce] 302f 0024                 move.w     36(a7),d0
[0004dcd2] 206f 0048                 movea.l    72(a7),a0
[0004dcd6] 6100 fb80                 bsr        Ame_submenu
[0004dcda] 3f40 0022                 move.w     d0,34(a7)
[0004dcde] 322f 0024                 move.w     36(a7),d1
[0004dce2] 48c1                      ext.l      d1
[0004dce4] 2001                      move.l     d1,d0
[0004dce6] d080                      add.l      d0,d0
[0004dce8] d081                      add.l      d1,d0
[0004dcea] e788                      lsl.l      #3,d0
[0004dcec] 206f 0048                 movea.l    72(a7),a0
[0004dcf0] 0070 0080 0808            ori.w      #$0080,8(a0,d0.l)
[0004dcf6] 302f 0022                 move.w     34(a7),d0
[0004dcfa] 6b20                      bmi.s      $0004DD1C
[0004dcfc] 302f 0046                 move.w     70(a7),d0
[0004dd00] b06f 0022                 cmp.w      34(a7),d0
[0004dd04] 6722                      beq.s      $0004DD28
[0004dd06] 302f 0022                 move.w     34(a7),d0
[0004dd0a] 206f 0048                 movea.l    72(a7),a0
[0004dd0e] 4eb9 0005 0f3a            jsr        Aob_up
[0004dd14] 322f 0046                 move.w     70(a7),d1
[0004dd18] b240                      cmp.w      d0,d1
[0004dd1a] 670c                      beq.s      $0004DD28
[0004dd1c] 426f 0006                 clr.w      6(a7)
[0004dd20] 3f7c fffe 0028            move.w     #$FFFE,40(a7)
[0004dd26] 6020                      bra.s      $0004DD48
[0004dd28] 43ef 0022                 lea.l      34(a7),a1
[0004dd2c] 7018                      moveq.l    #24,d0
[0004dd2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004dd34] 2068 0258                 movea.l    600(a0),a0
[0004dd38] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004dd3e] 246a 0258                 movea.l    600(a2),a2
[0004dd42] 246a 0004                 movea.l    4(a2),a2
[0004dd46] 4e92                      jsr        (a2)
[0004dd48] 6010                      bra.s      $0004DD5A
[0004dd4a] 3f6f 0026 0022            move.w     38(a7),34(a7)
[0004dd50] 426f 0006                 clr.w      6(a7)
[0004dd54] 3f7c fffe 0028            move.w     #$FFFE,40(a7)
[0004dd5a] 6000 06f8                 bra        $0004E454
[0004dd5e] 302f 0046                 move.w     70(a7),d0
[0004dd62] 675e                      beq.s      $0004DDC2
[0004dd64] 322f 0046                 move.w     70(a7),d1
[0004dd68] 48c1                      ext.l      d1
[0004dd6a] 2001                      move.l     d1,d0
[0004dd6c] d080                      add.l      d0,d0
[0004dd6e] d081                      add.l      d1,d0
[0004dd70] e788                      lsl.l      #3,d0
[0004dd72] 206f 0048                 movea.l    72(a7),a0
[0004dd76] 3030 0800                 move.w     0(a0,d0.l),d0
[0004dd7a] 6f46                      ble.s      $0004DDC2
[0004dd7c] 322f 0046                 move.w     70(a7),d1
[0004dd80] 48c1                      ext.l      d1
[0004dd82] 2001                      move.l     d1,d0
[0004dd84] d080                      add.l      d0,d0
[0004dd86] d081                      add.l      d1,d0
[0004dd88] e788                      lsl.l      #3,d0
[0004dd8a] 206f 0048                 movea.l    72(a7),a0
[0004dd8e] 3030 0800                 move.w     0(a0,d0.l),d0
[0004dd92] 3f40 0020                 move.w     d0,32(a7)
[0004dd96] 3f40 0022                 move.w     d0,34(a7)
[0004dd9a] 302f 0020                 move.w     32(a7),d0
[0004dd9e] 226f 0048                 movea.l    72(a7),a1
[0004dda2] 41ef 0032                 lea.l      50(a7),a0
[0004dda6] 4eb9 0004 fe06            jsr        Aob_offset
[0004ddac] 7001                      moveq.l    #1,d0
[0004ddae] d06f 0032                 add.w      50(a7),d0
[0004ddb2] 3f40 0018                 move.w     d0,24(a7)
[0004ddb6] 7001                      moveq.l    #1,d0
[0004ddb8] d06f 0034                 add.w      52(a7),d0
[0004ddbc] 3f40 0016                 move.w     d0,22(a7)
[0004ddc0] 6006                      bra.s      $0004DDC8
[0004ddc2] 3f7c ffff 0022            move.w     #$FFFF,34(a7)
[0004ddc8] 426f 0006                 clr.w      6(a7)
[0004ddcc] 6000 0686                 bra        $0004E454
[0004ddd0] 302f 0026                 move.w     38(a7),d0
[0004ddd4] 6a00 024e                 bpl        $0004E024
[0004ddd8] 0c2f 0003 0015            cmpi.b     #$03,21(a7)
[0004ddde] 6708                      beq.s      $0004DDE8
[0004dde0] 0c2f 0002 0015            cmpi.b     #$02,21(a7)
[0004dde6] 660c                      bne.s      $0004DDF4
[0004dde8] 303c 7fff                 move.w     #$7FFF,d0
[0004ddec] 3f40 000c                 move.w     d0,12(a7)
[0004ddf0] 3f40 000e                 move.w     d0,14(a7)
[0004ddf4] 0c2f 0004 0015            cmpi.b     #$04,21(a7)
[0004ddfa] 6708                      beq.s      $0004DE04
[0004ddfc] 0c2f 0001 0015            cmpi.b     #$01,21(a7)
[0004de02] 660a                      bne.s      $0004DE0E
[0004de04] 4240                      clr.w      d0
[0004de06] 3f40 000c                 move.w     d0,12(a7)
[0004de0a] 3f40 000e                 move.w     d0,14(a7)
[0004de0e] 3f6f 0046 0002            move.w     70(a7),2(a7)
[0004de14] 6018                      bra.s      $0004DE2E
[0004de16] 322f 0002                 move.w     2(a7),d1
[0004de1a] 48c1                      ext.l      d1
[0004de1c] 2001                      move.l     d1,d0
[0004de1e] d080                      add.l      d0,d0
[0004de20] d081                      add.l      d1,d0
[0004de22] e788                      lsl.l      #3,d0
[0004de24] 206f 0048                 movea.l    72(a7),a0
[0004de28] 3f70 0802 0002            move.w     2(a0,d0.l),2(a7)
[0004de2e] 322f 0002                 move.w     2(a7),d1
[0004de32] 48c1                      ext.l      d1
[0004de34] 2001                      move.l     d1,d0
[0004de36] d080                      add.l      d0,d0
[0004de38] d081                      add.l      d1,d0
[0004de3a] e788                      lsl.l      #3,d0
[0004de3c] 206f 0048                 movea.l    72(a7),a0
[0004de40] 3030 0802                 move.w     2(a0,d0.l),d0
[0004de44] 6b2e                      bmi.s      $0004DE74
[0004de46] 303c 0080                 move.w     #$0080,d0
[0004de4a] 362f 0002                 move.w     2(a7),d3
[0004de4e] 48c3                      ext.l      d3
[0004de50] 2403                      move.l     d3,d2
[0004de52] d482                      add.l      d2,d2
[0004de54] d483                      add.l      d3,d2
[0004de56] e78a                      lsl.l      #3,d2
[0004de58] 206f 0048                 movea.l    72(a7),a0
[0004de5c] 3430 2802                 move.w     2(a0,d2.l),d2
[0004de60] 48c2                      ext.l      d2
[0004de62] 2202                      move.l     d2,d1
[0004de64] d281                      add.l      d1,d1
[0004de66] d282                      add.l      d2,d1
[0004de68] e789                      lsl.l      #3,d1
[0004de6a] 206f 0048                 movea.l    72(a7),a0
[0004de6e] c070 1808                 and.w      8(a0,d1.l),d0
[0004de72] 67a2                      beq.s      $0004DE16
[0004de74] 302f 0002                 move.w     2(a7),d0
[0004de78] 206f 0048                 movea.l    72(a7),a0
[0004de7c] 4eb9 0005 0f3a            jsr        Aob_up
[0004de82] 3f40 0020                 move.w     d0,32(a7)
[0004de86] 3f7c fffe 0028            move.w     #$FFFE,40(a7)
[0004de8c] 6000 0186                 bra        $0004E014
[0004de90] 102f 0015                 move.b     21(a7),d0
[0004de94] 4880                      ext.w      d0
[0004de96] 5340                      subq.w     #1,d0
[0004de98] 6700 00bc                 beq        $0004DF56
[0004de9c] 5340                      subq.w     #1,d0
[0004de9e] 670e                      beq.s      $0004DEAE
[0004dea0] 5340                      subq.w     #1,d0
[0004dea2] 670a                      beq.s      $0004DEAE
[0004dea4] 5340                      subq.w     #1,d0
[0004dea6] 6700 00ae                 beq        $0004DF56
[0004deaa] 6000 0150                 bra        $0004DFFC
[0004deae] 7008                      moveq.l    #8,d0
[0004deb0] 342f 0002                 move.w     2(a7),d2
[0004deb4] 48c2                      ext.l      d2
[0004deb6] 2202                      move.l     d2,d1
[0004deb8] d281                      add.l      d1,d1
[0004deba] d282                      add.l      d2,d1
[0004debc] e789                      lsl.l      #3,d1
[0004debe] 206f 0048                 movea.l    72(a7),a0
[0004dec2] c070 180a                 and.w      10(a0,d1.l),d0
[0004dec6] 6600 008a                 bne        $0004DF52
[0004deca] 7041                      moveq.l    #65,d0
[0004decc] 342f 0002                 move.w     2(a7),d2
[0004ded0] 48c2                      ext.l      d2
[0004ded2] 2202                      move.l     d2,d1
[0004ded4] d281                      add.l      d1,d1
[0004ded6] d282                      add.l      d2,d1
[0004ded8] e789                      lsl.l      #3,d1
[0004deda] 206f 0048                 movea.l    72(a7),a0
[0004dede] c070 1808                 and.w      8(a0,d1.l),d0
[0004dee2] 676e                      beq.s      $0004DF52
[0004dee4] 322f 0002                 move.w     2(a7),d1
[0004dee8] 48c1                      ext.l      d1
[0004deea] 2001                      move.l     d1,d0
[0004deec] d080                      add.l      d0,d0
[0004deee] d081                      add.l      d1,d0
[0004def0] e788                      lsl.l      #3,d0
[0004def2] 206f 0048                 movea.l    72(a7),a0
[0004def6] 3030 0812                 move.w     18(a0,d0.l),d0
[0004defa] b06f 000c                 cmp.w      12(a7),d0
[0004defe] 6c52                      bge.s      $0004DF52
[0004df00] 322f 0002                 move.w     2(a7),d1
[0004df04] 48c1                      ext.l      d1
[0004df06] 2001                      move.l     d1,d0
[0004df08] d080                      add.l      d0,d0
[0004df0a] d081                      add.l      d1,d0
[0004df0c] e788                      lsl.l      #3,d0
[0004df0e] 206f 0048                 movea.l    72(a7),a0
[0004df12] 3030 0810                 move.w     16(a0,d0.l),d0
[0004df16] b06f 000e                 cmp.w      14(a7),d0
[0004df1a] 6c36                      bge.s      $0004DF52
[0004df1c] 322f 0002                 move.w     2(a7),d1
[0004df20] 48c1                      ext.l      d1
[0004df22] 2001                      move.l     d1,d0
[0004df24] d080                      add.l      d0,d0
[0004df26] d081                      add.l      d1,d0
[0004df28] e788                      lsl.l      #3,d0
[0004df2a] 206f 0048                 movea.l    72(a7),a0
[0004df2e] 3f70 0812 000c            move.w     18(a0,d0.l),12(a7)
[0004df34] 322f 0002                 move.w     2(a7),d1
[0004df38] 48c1                      ext.l      d1
[0004df3a] 2001                      move.l     d1,d0
[0004df3c] d080                      add.l      d0,d0
[0004df3e] d081                      add.l      d1,d0
[0004df40] e788                      lsl.l      #3,d0
[0004df42] 206f 0048                 movea.l    72(a7),a0
[0004df46] 3f70 0810 000e            move.w     16(a0,d0.l),14(a7)
[0004df4c] 3f6f 0002 0028            move.w     2(a7),40(a7)
[0004df52] 6000 00a8                 bra        $0004DFFC
[0004df56] 7008                      moveq.l    #8,d0
[0004df58] 342f 0002                 move.w     2(a7),d2
[0004df5c] 48c2                      ext.l      d2
[0004df5e] 2202                      move.l     d2,d1
[0004df60] d281                      add.l      d1,d1
[0004df62] d282                      add.l      d2,d1
[0004df64] e789                      lsl.l      #3,d1
[0004df66] 206f 0048                 movea.l    72(a7),a0
[0004df6a] c070 180a                 and.w      10(a0,d1.l),d0
[0004df6e] 6600 008a                 bne        $0004DFFA
[0004df72] 7041                      moveq.l    #65,d0
[0004df74] 342f 0002                 move.w     2(a7),d2
[0004df78] 48c2                      ext.l      d2
[0004df7a] 2202                      move.l     d2,d1
[0004df7c] d281                      add.l      d1,d1
[0004df7e] d282                      add.l      d2,d1
[0004df80] e789                      lsl.l      #3,d1
[0004df82] 206f 0048                 movea.l    72(a7),a0
[0004df86] c070 1808                 and.w      8(a0,d1.l),d0
[0004df8a] 676e                      beq.s      $0004DFFA
[0004df8c] 322f 0002                 move.w     2(a7),d1
[0004df90] 48c1                      ext.l      d1
[0004df92] 2001                      move.l     d1,d0
[0004df94] d080                      add.l      d0,d0
[0004df96] d081                      add.l      d1,d0
[0004df98] e788                      lsl.l      #3,d0
[0004df9a] 206f 0048                 movea.l    72(a7),a0
[0004df9e] 3030 0812                 move.w     18(a0,d0.l),d0
[0004dfa2] b06f 000c                 cmp.w      12(a7),d0
[0004dfa6] 6d52                      blt.s      $0004DFFA
[0004dfa8] 322f 0002                 move.w     2(a7),d1
[0004dfac] 48c1                      ext.l      d1
[0004dfae] 2001                      move.l     d1,d0
[0004dfb0] d080                      add.l      d0,d0
[0004dfb2] d081                      add.l      d1,d0
[0004dfb4] e788                      lsl.l      #3,d0
[0004dfb6] 206f 0048                 movea.l    72(a7),a0
[0004dfba] 3030 0810                 move.w     16(a0,d0.l),d0
[0004dfbe] b06f 000e                 cmp.w      14(a7),d0
[0004dfc2] 6d36                      blt.s      $0004DFFA
[0004dfc4] 322f 0002                 move.w     2(a7),d1
[0004dfc8] 48c1                      ext.l      d1
[0004dfca] 2001                      move.l     d1,d0
[0004dfcc] d080                      add.l      d0,d0
[0004dfce] d081                      add.l      d1,d0
[0004dfd0] e788                      lsl.l      #3,d0
[0004dfd2] 206f 0048                 movea.l    72(a7),a0
[0004dfd6] 3f70 0812 000c            move.w     18(a0,d0.l),12(a7)
[0004dfdc] 322f 0002                 move.w     2(a7),d1
[0004dfe0] 48c1                      ext.l      d1
[0004dfe2] 2001                      move.l     d1,d0
[0004dfe4] d080                      add.l      d0,d0
[0004dfe6] d081                      add.l      d1,d0
[0004dfe8] e788                      lsl.l      #3,d0
[0004dfea] 206f 0048                 movea.l    72(a7),a0
[0004dfee] 3f70 0810 000e            move.w     16(a0,d0.l),14(a7)
[0004dff4] 3f6f 0002 0028            move.w     2(a7),40(a7)
[0004dffa] 4e71                      nop
[0004dffc] 322f 0002                 move.w     2(a7),d1
[0004e000] 48c1                      ext.l      d1
[0004e002] 2001                      move.l     d1,d0
[0004e004] d080                      add.l      d0,d0
[0004e006] d081                      add.l      d1,d0
[0004e008] e788                      lsl.l      #3,d0
[0004e00a] 206f 0048                 movea.l    72(a7),a0
[0004e00e] 3f70 0800 0002            move.w     0(a0,d0.l),2(a7)
[0004e014] 302f 0002                 move.w     2(a7),d0
[0004e018] b06f 0020                 cmp.w      32(a7),d0
[0004e01c] 6600 fe72                 bne        $0004DE90
[0004e020] 6000 0410                 bra        $0004E432
[0004e024] 303c 7fff                 move.w     #$7FFF,d0
[0004e028] 3f40 000c                 move.w     d0,12(a7)
[0004e02c] 3f40 000e                 move.w     d0,14(a7)
[0004e030] 302f 0026                 move.w     38(a7),d0
[0004e034] 206f 0048                 movea.l    72(a7),a0
[0004e038] 4eb9 0005 0f3a            jsr        Aob_up
[0004e03e] 3f40 0020                 move.w     d0,32(a7)
[0004e042] 322f 0026                 move.w     38(a7),d1
[0004e046] 48c1                      ext.l      d1
[0004e048] 2001                      move.l     d1,d0
[0004e04a] d080                      add.l      d0,d0
[0004e04c] d081                      add.l      d1,d0
[0004e04e] e788                      lsl.l      #3,d0
[0004e050] 206f 0048                 movea.l    72(a7),a0
[0004e054] 3030 0800                 move.w     0(a0,d0.l),d0
[0004e058] b06f 0020                 cmp.w      32(a7),d0
[0004e05c] 661a                      bne.s      $0004E078
[0004e05e] 322f 0020                 move.w     32(a7),d1
[0004e062] 48c1                      ext.l      d1
[0004e064] 2001                      move.l     d1,d0
[0004e066] d080                      add.l      d0,d0
[0004e068] d081                      add.l      d1,d0
[0004e06a] e788                      lsl.l      #3,d0
[0004e06c] 206f 0048                 movea.l    72(a7),a0
[0004e070] 3f70 0802 0002            move.w     2(a0,d0.l),2(a7)
[0004e076] 6018                      bra.s      $0004E090
[0004e078] 322f 0026                 move.w     38(a7),d1
[0004e07c] 48c1                      ext.l      d1
[0004e07e] 2001                      move.l     d1,d0
[0004e080] d080                      add.l      d0,d0
[0004e082] d081                      add.l      d1,d0
[0004e084] e788                      lsl.l      #3,d0
[0004e086] 206f 0048                 movea.l    72(a7),a0
[0004e08a] 3f70 0800 0002            move.w     0(a0,d0.l),2(a7)
[0004e090] 3f7c fffe 0028            move.w     #$FFFE,40(a7)
[0004e096] 6000 038e                 bra        $0004E426
[0004e09a] 322f 0002                 move.w     2(a7),d1
[0004e09e] 48c1                      ext.l      d1
[0004e0a0] 2001                      move.l     d1,d0
[0004e0a2] d080                      add.l      d0,d0
[0004e0a4] d081                      add.l      d1,d0
[0004e0a6] e788                      lsl.l      #3,d0
[0004e0a8] 206f 0048                 movea.l    72(a7),a0
[0004e0ac] 3030 0810                 move.w     16(a0,d0.l),d0
[0004e0b0] 342f 0026                 move.w     38(a7),d2
[0004e0b4] 48c2                      ext.l      d2
[0004e0b6] 2202                      move.l     d2,d1
[0004e0b8] d281                      add.l      d1,d1
[0004e0ba] d282                      add.l      d2,d1
[0004e0bc] e789                      lsl.l      #3,d1
[0004e0be] 206f 0048                 movea.l    72(a7),a0
[0004e0c2] 9070 1810                 sub.w      16(a0,d1.l),d0
[0004e0c6] 3f40 000a                 move.w     d0,10(a7)
[0004e0ca] 302f 000a                 move.w     10(a7),d0
[0004e0ce] 6a0a                      bpl.s      $0004E0DA
[0004e0d0] 302f 000a                 move.w     10(a7),d0
[0004e0d4] 4440                      neg.w      d0
[0004e0d6] 3f40 000a                 move.w     d0,10(a7)
[0004e0da] 322f 0002                 move.w     2(a7),d1
[0004e0de] 48c1                      ext.l      d1
[0004e0e0] 2001                      move.l     d1,d0
[0004e0e2] d080                      add.l      d0,d0
[0004e0e4] d081                      add.l      d1,d0
[0004e0e6] e788                      lsl.l      #3,d0
[0004e0e8] 206f 0048                 movea.l    72(a7),a0
[0004e0ec] 3030 0812                 move.w     18(a0,d0.l),d0
[0004e0f0] 342f 0026                 move.w     38(a7),d2
[0004e0f4] 48c2                      ext.l      d2
[0004e0f6] 2202                      move.l     d2,d1
[0004e0f8] d281                      add.l      d1,d1
[0004e0fa] d282                      add.l      d2,d1
[0004e0fc] e789                      lsl.l      #3,d1
[0004e0fe] 206f 0048                 movea.l    72(a7),a0
[0004e102] 9070 1812                 sub.w      18(a0,d1.l),d0
[0004e106] 3f40 0008                 move.w     d0,8(a7)
[0004e10a] 302f 0008                 move.w     8(a7),d0
[0004e10e] 6a0a                      bpl.s      $0004E11A
[0004e110] 302f 0008                 move.w     8(a7),d0
[0004e114] 4440                      neg.w      d0
[0004e116] 3f40 0008                 move.w     d0,8(a7)
[0004e11a] 7008                      moveq.l    #8,d0
[0004e11c] 342f 0002                 move.w     2(a7),d2
[0004e120] 48c2                      ext.l      d2
[0004e122] 2202                      move.l     d2,d1
[0004e124] d281                      add.l      d1,d1
[0004e126] d282                      add.l      d2,d1
[0004e128] e789                      lsl.l      #3,d1
[0004e12a] 206f 0048                 movea.l    72(a7),a0
[0004e12e] c070 180a                 and.w      10(a0,d1.l),d0
[0004e132] 6600 02a4                 bne        $0004E3D8
[0004e136] 7041                      moveq.l    #65,d0
[0004e138] 342f 0002                 move.w     2(a7),d2
[0004e13c] 48c2                      ext.l      d2
[0004e13e] 2202                      move.l     d2,d1
[0004e140] d281                      add.l      d1,d1
[0004e142] d282                      add.l      d2,d1
[0004e144] e789                      lsl.l      #3,d1
[0004e146] 206f 0048                 movea.l    72(a7),a0
[0004e14a] c070 1808                 and.w      8(a0,d1.l),d0
[0004e14e] 6700 0288                 beq        $0004E3D8
[0004e152] 102f 0015                 move.b     21(a7),d0
[0004e156] 4880                      ext.w      d0
[0004e158] 5340                      subq.w     #1,d0
[0004e15a] 6700 01e4                 beq        $0004E340
[0004e15e] 5340                      subq.w     #1,d0
[0004e160] 6700 00aa                 beq        $0004E20C
[0004e164] 5340                      subq.w     #1,d0
[0004e166] 670a                      beq.s      $0004E172
[0004e168] 5340                      subq.w     #1,d0
[0004e16a] 6700 013a                 beq        $0004E2A6
[0004e16e] 6000 0268                 bra        $0004E3D8
[0004e172] 322f 0002                 move.w     2(a7),d1
[0004e176] 48c1                      ext.l      d1
[0004e178] 2001                      move.l     d1,d0
[0004e17a] d080                      add.l      d0,d0
[0004e17c] d081                      add.l      d1,d0
[0004e17e] e788                      lsl.l      #3,d0
[0004e180] 206f 0048                 movea.l    72(a7),a0
[0004e184] 3030 0810                 move.w     16(a0,d0.l),d0
[0004e188] 342f 0026                 move.w     38(a7),d2
[0004e18c] 48c2                      ext.l      d2
[0004e18e] 2202                      move.l     d2,d1
[0004e190] d281                      add.l      d1,d1
[0004e192] d282                      add.l      d2,d1
[0004e194] e789                      lsl.l      #3,d1
[0004e196] 206f 0048                 movea.l    72(a7),a0
[0004e19a] b070 1810                 cmp.w      16(a0,d1.l),d0
[0004e19e] 6f68                      ble.s      $0004E208
[0004e1a0] 302f 000c                 move.w     12(a7),d0
[0004e1a4] 6610                      bne.s      $0004E1B6
[0004e1a6] 302f 0008                 move.w     8(a7),d0
[0004e1aa] 660a                      bne.s      $0004E1B6
[0004e1ac] 302f 000a                 move.w     10(a7),d0
[0004e1b0] b06f 000e                 cmp.w      14(a7),d0
[0004e1b4] 6d40                      blt.s      $0004E1F6
[0004e1b6] 302f 0008                 move.w     8(a7),d0
[0004e1ba] 6606                      bne.s      $0004E1C2
[0004e1bc] 302f 000c                 move.w     12(a7),d0
[0004e1c0] 6634                      bne.s      $0004E1F6
[0004e1c2] 302f 000c                 move.w     12(a7),d0
[0004e1c6] 6714                      beq.s      $0004E1DC
[0004e1c8] 302f 000a                 move.w     10(a7),d0
[0004e1cc] b06f 000e                 cmp.w      14(a7),d0
[0004e1d0] 6c0a                      bge.s      $0004E1DC
[0004e1d2] 302f 0008                 move.w     8(a7),d0
[0004e1d6] b06f 000c                 cmp.w      12(a7),d0
[0004e1da] 6f1a                      ble.s      $0004E1F6
[0004e1dc] 302f 000c                 move.w     12(a7),d0
[0004e1e0] 6726                      beq.s      $0004E208
[0004e1e2] 302f 000a                 move.w     10(a7),d0
[0004e1e6] b06f 000e                 cmp.w      14(a7),d0
[0004e1ea] 6e1c                      bgt.s      $0004E208
[0004e1ec] 302f 0008                 move.w     8(a7),d0
[0004e1f0] b06f 000c                 cmp.w      12(a7),d0
[0004e1f4] 6c12                      bge.s      $0004E208
[0004e1f6] 3f6f 0008 000c            move.w     8(a7),12(a7)
[0004e1fc] 3f6f 000a 000e            move.w     10(a7),14(a7)
[0004e202] 3f6f 0002 0028            move.w     2(a7),40(a7)
[0004e208] 6000 01ce                 bra        $0004E3D8
[0004e20c] 322f 0002                 move.w     2(a7),d1
[0004e210] 48c1                      ext.l      d1
[0004e212] 2001                      move.l     d1,d0
[0004e214] d080                      add.l      d0,d0
[0004e216] d081                      add.l      d1,d0
[0004e218] e788                      lsl.l      #3,d0
[0004e21a] 206f 0048                 movea.l    72(a7),a0
[0004e21e] 3030 0812                 move.w     18(a0,d0.l),d0
[0004e222] 342f 0026                 move.w     38(a7),d2
[0004e226] 48c2                      ext.l      d2
[0004e228] 2202                      move.l     d2,d1
[0004e22a] d281                      add.l      d1,d1
[0004e22c] d282                      add.l      d2,d1
[0004e22e] e789                      lsl.l      #3,d1
[0004e230] 206f 0048                 movea.l    72(a7),a0
[0004e234] b070 1812                 cmp.w      18(a0,d1.l),d0
[0004e238] 6f68                      ble.s      $0004E2A2
[0004e23a] 302f 000e                 move.w     14(a7),d0
[0004e23e] 6610                      bne.s      $0004E250
[0004e240] 302f 0008                 move.w     8(a7),d0
[0004e244] 660a                      bne.s      $0004E250
[0004e246] 302f 0008                 move.w     8(a7),d0
[0004e24a] b06f 000c                 cmp.w      12(a7),d0
[0004e24e] 6d40                      blt.s      $0004E290
[0004e250] 302f 000e                 move.w     14(a7),d0
[0004e254] 6706                      beq.s      $0004E25C
[0004e256] 302f 000a                 move.w     10(a7),d0
[0004e25a] 6734                      beq.s      $0004E290
[0004e25c] 302f 000e                 move.w     14(a7),d0
[0004e260] 6714                      beq.s      $0004E276
[0004e262] 302f 0008                 move.w     8(a7),d0
[0004e266] b06f 000c                 cmp.w      12(a7),d0
[0004e26a] 6c0a                      bge.s      $0004E276
[0004e26c] 302f 000a                 move.w     10(a7),d0
[0004e270] b06f 000e                 cmp.w      14(a7),d0
[0004e274] 6f1a                      ble.s      $0004E290
[0004e276] 302f 000e                 move.w     14(a7),d0
[0004e27a] 6726                      beq.s      $0004E2A2
[0004e27c] 302f 0008                 move.w     8(a7),d0
[0004e280] b06f 000c                 cmp.w      12(a7),d0
[0004e284] 6e1c                      bgt.s      $0004E2A2
[0004e286] 302f 000a                 move.w     10(a7),d0
[0004e28a] b06f 000e                 cmp.w      14(a7),d0
[0004e28e] 6c12                      bge.s      $0004E2A2
[0004e290] 3f6f 0008 000c            move.w     8(a7),12(a7)
[0004e296] 3f6f 000a 000e            move.w     10(a7),14(a7)
[0004e29c] 3f6f 0002 0028            move.w     2(a7),40(a7)
[0004e2a2] 6000 0134                 bra        $0004E3D8
[0004e2a6] 322f 0002                 move.w     2(a7),d1
[0004e2aa] 48c1                      ext.l      d1
[0004e2ac] 2001                      move.l     d1,d0
[0004e2ae] d080                      add.l      d0,d0
[0004e2b0] d081                      add.l      d1,d0
[0004e2b2] e788                      lsl.l      #3,d0
[0004e2b4] 206f 0048                 movea.l    72(a7),a0
[0004e2b8] 3030 0810                 move.w     16(a0,d0.l),d0
[0004e2bc] 342f 0026                 move.w     38(a7),d2
[0004e2c0] 48c2                      ext.l      d2
[0004e2c2] 2202                      move.l     d2,d1
[0004e2c4] d281                      add.l      d1,d1
[0004e2c6] d282                      add.l      d2,d1
[0004e2c8] e789                      lsl.l      #3,d1
[0004e2ca] 206f 0048                 movea.l    72(a7),a0
[0004e2ce] b070 1810                 cmp.w      16(a0,d1.l),d0
[0004e2d2] 6c68                      bge.s      $0004E33C
[0004e2d4] 302f 000c                 move.w     12(a7),d0
[0004e2d8] 6610                      bne.s      $0004E2EA
[0004e2da] 302f 0008                 move.w     8(a7),d0
[0004e2de] 660a                      bne.s      $0004E2EA
[0004e2e0] 302f 000a                 move.w     10(a7),d0
[0004e2e4] b06f 000e                 cmp.w      14(a7),d0
[0004e2e8] 6d40                      blt.s      $0004E32A
[0004e2ea] 302f 000c                 move.w     12(a7),d0
[0004e2ee] 6706                      beq.s      $0004E2F6
[0004e2f0] 302f 0008                 move.w     8(a7),d0
[0004e2f4] 6734                      beq.s      $0004E32A
[0004e2f6] 302f 000c                 move.w     12(a7),d0
[0004e2fa] 6714                      beq.s      $0004E310
[0004e2fc] 302f 000a                 move.w     10(a7),d0
[0004e300] b06f 000e                 cmp.w      14(a7),d0
[0004e304] 6c0a                      bge.s      $0004E310
[0004e306] 302f 0008                 move.w     8(a7),d0
[0004e30a] b06f 000c                 cmp.w      12(a7),d0
[0004e30e] 6f1a                      ble.s      $0004E32A
[0004e310] 302f 000c                 move.w     12(a7),d0
[0004e314] 6726                      beq.s      $0004E33C
[0004e316] 302f 000a                 move.w     10(a7),d0
[0004e31a] b06f 000e                 cmp.w      14(a7),d0
[0004e31e] 6e1c                      bgt.s      $0004E33C
[0004e320] 302f 0008                 move.w     8(a7),d0
[0004e324] b06f 000c                 cmp.w      12(a7),d0
[0004e328] 6c12                      bge.s      $0004E33C
[0004e32a] 3f6f 0008 000c            move.w     8(a7),12(a7)
[0004e330] 3f6f 000a 000e            move.w     10(a7),14(a7)
[0004e336] 3f6f 0002 0028            move.w     2(a7),40(a7)
[0004e33c] 6000 009a                 bra        $0004E3D8
[0004e340] 322f 0002                 move.w     2(a7),d1
[0004e344] 48c1                      ext.l      d1
[0004e346] 2001                      move.l     d1,d0
[0004e348] d080                      add.l      d0,d0
[0004e34a] d081                      add.l      d1,d0
[0004e34c] e788                      lsl.l      #3,d0
[0004e34e] 206f 0048                 movea.l    72(a7),a0
[0004e352] 3030 0812                 move.w     18(a0,d0.l),d0
[0004e356] 342f 0026                 move.w     38(a7),d2
[0004e35a] 48c2                      ext.l      d2
[0004e35c] 2202                      move.l     d2,d1
[0004e35e] d281                      add.l      d1,d1
[0004e360] d282                      add.l      d2,d1
[0004e362] e789                      lsl.l      #3,d1
[0004e364] 206f 0048                 movea.l    72(a7),a0
[0004e368] b070 1812                 cmp.w      18(a0,d1.l),d0
[0004e36c] 6c68                      bge.s      $0004E3D6
[0004e36e] 302f 000e                 move.w     14(a7),d0
[0004e372] 6610                      bne.s      $0004E384
[0004e374] 302f 000a                 move.w     10(a7),d0
[0004e378] 660a                      bne.s      $0004E384
[0004e37a] 302f 0008                 move.w     8(a7),d0
[0004e37e] b06f 000c                 cmp.w      12(a7),d0
[0004e382] 6d40                      blt.s      $0004E3C4
[0004e384] 302f 000e                 move.w     14(a7),d0
[0004e388] 6706                      beq.s      $0004E390
[0004e38a] 302f 000a                 move.w     10(a7),d0
[0004e38e] 6734                      beq.s      $0004E3C4
[0004e390] 302f 000e                 move.w     14(a7),d0
[0004e394] 6714                      beq.s      $0004E3AA
[0004e396] 302f 0008                 move.w     8(a7),d0
[0004e39a] b06f 000c                 cmp.w      12(a7),d0
[0004e39e] 6c0a                      bge.s      $0004E3AA
[0004e3a0] 302f 000a                 move.w     10(a7),d0
[0004e3a4] b06f 000e                 cmp.w      14(a7),d0
[0004e3a8] 6f1a                      ble.s      $0004E3C4
[0004e3aa] 302f 000e                 move.w     14(a7),d0
[0004e3ae] 6726                      beq.s      $0004E3D6
[0004e3b0] 302f 0008                 move.w     8(a7),d0
[0004e3b4] b06f 000c                 cmp.w      12(a7),d0
[0004e3b8] 6e1c                      bgt.s      $0004E3D6
[0004e3ba] 302f 000a                 move.w     10(a7),d0
[0004e3be] b06f 000e                 cmp.w      14(a7),d0
[0004e3c2] 6c12                      bge.s      $0004E3D6
[0004e3c4] 3f6f 0008 000c            move.w     8(a7),12(a7)
[0004e3ca] 3f6f 000a 000e            move.w     10(a7),14(a7)
[0004e3d0] 3f6f 0002 0028            move.w     2(a7),40(a7)
[0004e3d6] 4e71                      nop
[0004e3d8] 322f 0002                 move.w     2(a7),d1
[0004e3dc] 48c1                      ext.l      d1
[0004e3de] 2001                      move.l     d1,d0
[0004e3e0] d080                      add.l      d0,d0
[0004e3e2] d081                      add.l      d1,d0
[0004e3e4] e788                      lsl.l      #3,d0
[0004e3e6] 206f 0048                 movea.l    72(a7),a0
[0004e3ea] 3030 0800                 move.w     0(a0,d0.l),d0
[0004e3ee] b06f 0020                 cmp.w      32(a7),d0
[0004e3f2] 661a                      bne.s      $0004E40E
[0004e3f4] 322f 0020                 move.w     32(a7),d1
[0004e3f8] 48c1                      ext.l      d1
[0004e3fa] 2001                      move.l     d1,d0
[0004e3fc] d080                      add.l      d0,d0
[0004e3fe] d081                      add.l      d1,d0
[0004e400] e788                      lsl.l      #3,d0
[0004e402] 206f 0048                 movea.l    72(a7),a0
[0004e406] 3f70 0802 0002            move.w     2(a0,d0.l),2(a7)
[0004e40c] 6018                      bra.s      $0004E426
[0004e40e] 322f 0002                 move.w     2(a7),d1
[0004e412] 48c1                      ext.l      d1
[0004e414] 2001                      move.l     d1,d0
[0004e416] d080                      add.l      d0,d0
[0004e418] d081                      add.l      d1,d0
[0004e41a] e788                      lsl.l      #3,d0
[0004e41c] 206f 0048                 movea.l    72(a7),a0
[0004e420] 3f70 0800 0002            move.w     0(a0,d0.l),2(a7)
[0004e426] 302f 0002                 move.w     2(a7),d0
[0004e42a] b06f 0026                 cmp.w      38(a7),d0
[0004e42e] 6600 fc6a                 bne        $0004E09A
[0004e432] 6020                      bra.s      $0004E454
[0004e434] 322f 0014                 move.w     20(a7),d1
[0004e438] 302f 0012                 move.w     18(a7),d0
[0004e43c] 206f 0048                 movea.l    72(a7),a0
[0004e440] 4eb9 0005 0ce8            jsr        Aob_key
[0004e446] 3f40 0022                 move.w     d0,34(a7)
[0004e44a] 302f 0022                 move.w     34(a7),d0
[0004e44e] 6f04                      ble.s      $0004E454
[0004e450] 426f 0006                 clr.w      6(a7)
[0004e454] 7004                      moveq.l    #4,d0
[0004e456] c06f 001a                 and.w      26(a7),d0
[0004e45a] 671e                      beq.s      $0004E47A
[0004e45c] 3f2f 0016                 move.w     22(a7),-(a7)
[0004e460] 342f 001a                 move.w     26(a7),d2
[0004e464] 7208                      moveq.l    #8,d1
[0004e466] 302f 0048                 move.w     72(a7),d0
[0004e46a] 206f 004a                 movea.l    74(a7),a0
[0004e46e] 4eb9 0004 8fd4            jsr        Adr_find
[0004e474] 544f                      addq.w     #2,a7
[0004e476] 3f40 0028                 move.w     d0,40(a7)
[0004e47a] 302f 0028                 move.w     40(a7),d0
[0004e47e] b06f 0026                 cmp.w      38(a7),d0
[0004e482] 6700 0182                 beq        $0004E606
[0004e486] 0c6f fffe 0028            cmpi.w     #$FFFE,40(a7)
[0004e48c] 6700 0178                 beq        $0004E606
[0004e490] 302f 001c                 move.w     28(a7),d0
[0004e494] 676e                      beq.s      $0004E504
[0004e496] 322f 0026                 move.w     38(a7),d1
[0004e49a] 48c1                      ext.l      d1
[0004e49c] 2001                      move.l     d1,d0
[0004e49e] d080                      add.l      d0,d0
[0004e4a0] d081                      add.l      d1,d0
[0004e4a2] e788                      lsl.l      #3,d0
[0004e4a4] 206f 0048                 movea.l    72(a7),a0
[0004e4a8] 0070 0001 080a            ori.w      #$0001,10(a0,d0.l)
[0004e4ae] 4eb9 0004 ef40            jsr        Amo_hide
[0004e4b4] 7001                      moveq.l    #1,d0
[0004e4b6] 3f00                      move.w     d0,-(a7)
[0004e4b8] 322f 0028                 move.w     40(a7),d1
[0004e4bc] 48c1                      ext.l      d1
[0004e4be] 2001                      move.l     d1,d0
[0004e4c0] d080                      add.l      d0,d0
[0004e4c2] d081                      add.l      d1,d0
[0004e4c4] e788                      lsl.l      #3,d0
[0004e4c6] 206f 004a                 movea.l    74(a7),a0
[0004e4ca] 3030 080a                 move.w     10(a0,d0.l),d0
[0004e4ce] c07c fffe                 and.w      #$FFFE,d0
[0004e4d2] 3f00                      move.w     d0,-(a7)
[0004e4d4] 3f2f 003c                 move.w     60(a7),-(a7)
[0004e4d8] 3f2f 003c                 move.w     60(a7),-(a7)
[0004e4dc] 3f2f 003c                 move.w     60(a7),-(a7)
[0004e4e0] 2279 000e 692a            movea.l    _globl,a1
[0004e4e6] 342f 003c                 move.w     60(a7),d2
[0004e4ea] 4241                      clr.w      d1
[0004e4ec] 302f 0030                 move.w     48(a7),d0
[0004e4f0] 206f 0052                 movea.l    82(a7),a0
[0004e4f4] 4eb9 0007 9f2c            jsr        mt_objc_change
[0004e4fa] 4fef 000a                 lea.l      10(a7),a7
[0004e4fe] 4eb9 0004 ef66            jsr        Amo_show
[0004e504] 302f 0028                 move.w     40(a7),d0
[0004e508] 6b00 00cc                 bmi        $0004E5D6
[0004e50c] 302f 0028                 move.w     40(a7),d0
[0004e510] b06f 0046                 cmp.w      70(a7),d0
[0004e514] 6700 00c0                 beq        $0004E5D6
[0004e518] 7008                      moveq.l    #8,d0
[0004e51a] 342f 0028                 move.w     40(a7),d2
[0004e51e] 48c2                      ext.l      d2
[0004e520] 2202                      move.l     d2,d1
[0004e522] d281                      add.l      d1,d1
[0004e524] d282                      add.l      d2,d1
[0004e526] e789                      lsl.l      #3,d1
[0004e528] 206f 0048                 movea.l    72(a7),a0
[0004e52c] c070 180a                 and.w      10(a0,d1.l),d0
[0004e530] 6600 00a4                 bne        $0004E5D6
[0004e534] 7041                      moveq.l    #65,d0
[0004e536] 342f 0028                 move.w     40(a7),d2
[0004e53a] 48c2                      ext.l      d2
[0004e53c] 2202                      move.l     d2,d1
[0004e53e] d281                      add.l      d1,d1
[0004e540] d282                      add.l      d2,d1
[0004e542] e789                      lsl.l      #3,d1
[0004e544] 206f 0048                 movea.l    72(a7),a0
[0004e548] c070 1808                 and.w      8(a0,d1.l),d0
[0004e54c] 6700 0088                 beq        $0004E5D6
[0004e550] 302f 0028                 move.w     40(a7),d0
[0004e554] 226f 0048                 movea.l    72(a7),a1
[0004e558] 41ef 0032                 lea.l      50(a7),a0
[0004e55c] 4eb9 0004 fe06            jsr        Aob_offset
[0004e562] 4eb9 0004 ef40            jsr        Amo_hide
[0004e568] 7001                      moveq.l    #1,d0
[0004e56a] 3f00                      move.w     d0,-(a7)
[0004e56c] 7001                      moveq.l    #1,d0
[0004e56e] 342f 002a                 move.w     42(a7),d2
[0004e572] 48c2                      ext.l      d2
[0004e574] 2202                      move.l     d2,d1
[0004e576] d281                      add.l      d1,d1
[0004e578] d282                      add.l      d2,d1
[0004e57a] e789                      lsl.l      #3,d1
[0004e57c] 206f 004a                 movea.l    74(a7),a0
[0004e580] 8070 180a                 or.w       10(a0,d1.l),d0
[0004e584] 3f00                      move.w     d0,-(a7)
[0004e586] 3f2f 003c                 move.w     60(a7),-(a7)
[0004e58a] 3f2f 003c                 move.w     60(a7),-(a7)
[0004e58e] 3f2f 003c                 move.w     60(a7),-(a7)
[0004e592] 2279 000e 692a            movea.l    _globl,a1
[0004e598] 342f 003c                 move.w     60(a7),d2
[0004e59c] 4241                      clr.w      d1
[0004e59e] 302f 0032                 move.w     50(a7),d0
[0004e5a2] 206f 0052                 movea.l    82(a7),a0
[0004e5a6] 4eb9 0007 9f2c            jsr        mt_objc_change
[0004e5ac] 4fef 000a                 lea.l      10(a7),a7
[0004e5b0] 4eb9 0004 ef66            jsr        Amo_show
[0004e5b6] 322f 0028                 move.w     40(a7),d1
[0004e5ba] 48c1                      ext.l      d1
[0004e5bc] 2001                      move.l     d1,d0
[0004e5be] d080                      add.l      d0,d0
[0004e5c0] d081                      add.l      d1,d0
[0004e5c2] e788                      lsl.l      #3,d0
[0004e5c4] 206f 0048                 movea.l    72(a7),a0
[0004e5c8] 0270 fffe 080a            andi.w     #$FFFE,10(a0,d0.l)
[0004e5ce] 3f7c 0001 001c            move.w     #$0001,28(a7)
[0004e5d4] 600a                      bra.s      $0004E5E0
[0004e5d6] 3f7c ffff 0028            move.w     #$FFFF,40(a7)
[0004e5dc] 426f 001c                 clr.w      28(a7)
[0004e5e0] 3f6f 0028 0026            move.w     40(a7),38(a7)
[0004e5e6] 43ef 0026                 lea.l      38(a7),a1
[0004e5ea] 7018                      moveq.l    #24,d0
[0004e5ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004e5f2] 2068 0258                 movea.l    600(a0),a0
[0004e5f6] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004e5fc] 246a 0258                 movea.l    600(a2),a2
[0004e600] 246a 0004                 movea.l    4(a2),a2
[0004e604] 4e92                      jsr        (a2)
[0004e606] 302f 001c                 move.w     28(a7),d0
[0004e60a] 6700 0154                 beq        $0004E760
[0004e60e] 322f 0028                 move.w     40(a7),d1
[0004e612] 48c1                      ext.l      d1
[0004e614] 2001                      move.l     d1,d0
[0004e616] d080                      add.l      d0,d0
[0004e618] d081                      add.l      d1,d0
[0004e61a] e788                      lsl.l      #3,d0
[0004e61c] 206f 0048                 movea.l    72(a7),a0
[0004e620] 3030 0802                 move.w     2(a0,d0.l),d0
[0004e624] 6f00 013a                 ble        $0004E760
[0004e628] 322f 0028                 move.w     40(a7),d1
[0004e62c] 48c1                      ext.l      d1
[0004e62e] 2001                      move.l     d1,d0
[0004e630] d080                      add.l      d0,d0
[0004e632] d081                      add.l      d1,d0
[0004e634] e788                      lsl.l      #3,d0
[0004e636] 206f 0048                 movea.l    72(a7),a0
[0004e63a] 3030 0814                 move.w     20(a0,d0.l),d0
[0004e63e] e240                      asr.w      #1,d0
[0004e640] 3e80                      move.w     d0,(a7)
[0004e642] 322f 0028                 move.w     40(a7),d1
[0004e646] 48c1                      ext.l      d1
[0004e648] 2001                      move.l     d1,d0
[0004e64a] d080                      add.l      d0,d0
[0004e64c] d081                      add.l      d1,d0
[0004e64e] e788                      lsl.l      #3,d0
[0004e650] 206f 0048                 movea.l    72(a7),a0
[0004e654] 3f70 0802 0024            move.w     2(a0,d0.l),36(a7)
[0004e65a] 302f 0024                 move.w     36(a7),d0
[0004e65e] 6b00 0100                 bmi        $0004E760
[0004e662] 322f 0028                 move.w     40(a7),d1
[0004e666] 48c1                      ext.l      d1
[0004e668] 2001                      move.l     d1,d0
[0004e66a] d080                      add.l      d0,d0
[0004e66c] d081                      add.l      d1,d0
[0004e66e] e788                      lsl.l      #3,d0
[0004e670] 206f 0048                 movea.l    72(a7),a0
[0004e674] 322f 0024                 move.w     36(a7),d1
[0004e678] b270 0804                 cmp.w      4(a0,d0.l),d1
[0004e67c] 6600 00e2                 bne        $0004E760
[0004e680] 3f2f 0016                 move.w     22(a7),-(a7)
[0004e684] 342f 001a                 move.w     26(a7),d2
[0004e688] 946f 0002                 sub.w      2(a7),d2
[0004e68c] 7201                      moveq.l    #1,d1
[0004e68e] 302f 0048                 move.w     72(a7),d0
[0004e692] 206f 004a                 movea.l    74(a7),a0
[0004e696] 4eb9 0004 8fd4            jsr        Adr_find
[0004e69c] 544f                      addq.w     #2,a7
[0004e69e] 322f 0028                 move.w     40(a7),d1
[0004e6a2] b240                      cmp.w      d0,d1
[0004e6a4] 6600 00ba                 bne        $0004E760
[0004e6a8] 322f 0024                 move.w     36(a7),d1
[0004e6ac] 48c1                      ext.l      d1
[0004e6ae] 2001                      move.l     d1,d0
[0004e6b0] d080                      add.l      d0,d0
[0004e6b2] d081                      add.l      d1,d0
[0004e6b4] e788                      lsl.l      #3,d0
[0004e6b6] 206f 0048                 movea.l    72(a7),a0
[0004e6ba] 0270 ff7f 0808            andi.w     #$FF7F,8(a0,d0.l)
[0004e6c0] 322f 0024                 move.w     36(a7),d1
[0004e6c4] 48c1                      ext.l      d1
[0004e6c6] 2001                      move.l     d1,d0
[0004e6c8] d080                      add.l      d0,d0
[0004e6ca] d081                      add.l      d1,d0
[0004e6cc] e788                      lsl.l      #3,d0
[0004e6ce] 206f 0048                 movea.l    72(a7),a0
[0004e6d2] 3197 0810                 move.w     (a7),16(a0,d0.l)
[0004e6d6] 322f 0024                 move.w     36(a7),d1
[0004e6da] 48c1                      ext.l      d1
[0004e6dc] 2001                      move.l     d1,d0
[0004e6de] d080                      add.l      d0,d0
[0004e6e0] d081                      add.l      d1,d0
[0004e6e2] e788                      lsl.l      #3,d0
[0004e6e4] 206f 0048                 movea.l    72(a7),a0
[0004e6e8] 4270 0812                 clr.w      18(a0,d0.l)
[0004e6ec] 302f 0024                 move.w     36(a7),d0
[0004e6f0] 206f 0048                 movea.l    72(a7),a0
[0004e6f4] 6100 f162                 bsr        Ame_submenu
[0004e6f8] 3f40 0022                 move.w     d0,34(a7)
[0004e6fc] 322f 0024                 move.w     36(a7),d1
[0004e700] 48c1                      ext.l      d1
[0004e702] 2001                      move.l     d1,d0
[0004e704] d080                      add.l      d0,d0
[0004e706] d081                      add.l      d1,d0
[0004e708] e788                      lsl.l      #3,d0
[0004e70a] 206f 0048                 movea.l    72(a7),a0
[0004e70e] 0070 0080 0808            ori.w      #$0080,8(a0,d0.l)
[0004e714] 302f 0022                 move.w     34(a7),d0
[0004e718] 6b20                      bmi.s      $0004E73A
[0004e71a] 302f 0046                 move.w     70(a7),d0
[0004e71e] b06f 0022                 cmp.w      34(a7),d0
[0004e722] 671c                      beq.s      $0004E740
[0004e724] 302f 0022                 move.w     34(a7),d0
[0004e728] 206f 0048                 movea.l    72(a7),a0
[0004e72c] 4eb9 0005 0f3a            jsr        Aob_up
[0004e732] 322f 0046                 move.w     70(a7),d1
[0004e736] b240                      cmp.w      d0,d1
[0004e738] 6706                      beq.s      $0004E740
[0004e73a] 426f 0006                 clr.w      6(a7)
[0004e73e] 6020                      bra.s      $0004E760
[0004e740] 43ef 0022                 lea.l      34(a7),a1
[0004e744] 7018                      moveq.l    #24,d0
[0004e746] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004e74c] 2068 0258                 movea.l    600(a0),a0
[0004e750] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004e756] 246a 0258                 movea.l    600(a2),a2
[0004e75a] 246a 0004                 movea.l    4(a2),a2
[0004e75e] 4e92                      jsr        (a2)
[0004e760] 302f 0046                 move.w     70(a7),d0
[0004e764] 226f 0048                 movea.l    72(a7),a1
[0004e768] 41ef 002a                 lea.l      42(a7),a0
[0004e76c] 4eb9 0004 fe06            jsr        Aob_offset
[0004e772] 0c6f ffff 0028            cmpi.w     #$FFFF,40(a7)
[0004e778] 6600 009a                 bne        $0004E814
[0004e77c] 322f 0016                 move.w     22(a7),d1
[0004e780] 302f 0018                 move.w     24(a7),d0
[0004e784] 41ef 002a                 lea.l      42(a7),a0
[0004e788] 4eb9 0006 b7a6            jsr        Aob_within
[0004e78e] 4a40                      tst.w      d0
[0004e790] 6600 0082                 bne        $0004E814
[0004e794] 322f 0046                 move.w     70(a7),d1
[0004e798] 48c1                      ext.l      d1
[0004e79a] 2001                      move.l     d1,d0
[0004e79c] d080                      add.l      d0,d0
[0004e79e] d081                      add.l      d1,d0
[0004e7a0] e788                      lsl.l      #3,d0
[0004e7a2] 206f 0048                 movea.l    72(a7),a0
[0004e7a6] 3f70 0800 0020            move.w     0(a0,d0.l),32(a7)
[0004e7ac] 6050                      bra.s      $0004E7FE
[0004e7ae] 302f 0020                 move.w     32(a7),d0
[0004e7b2] 206f 0048                 movea.l    72(a7),a0
[0004e7b6] 4eb9 0005 0f3a            jsr        Aob_up
[0004e7bc] 3f40 001e                 move.w     d0,30(a7)
[0004e7c0] 3f2f 0016                 move.w     22(a7),-(a7)
[0004e7c4] 342f 001a                 move.w     26(a7),d2
[0004e7c8] 7201                      moveq.l    #1,d1
[0004e7ca] 302f 0020                 move.w     32(a7),d0
[0004e7ce] 206f 004a                 movea.l    74(a7),a0
[0004e7d2] 4eb9 0004 8fd4            jsr        Adr_find
[0004e7d8] 544f                      addq.w     #2,a7
[0004e7da] 3f40 0022                 move.w     d0,34(a7)
[0004e7de] 302f 0022                 move.w     34(a7),d0
[0004e7e2] 6b02                      bmi.s      $0004E7E6
[0004e7e4] 601e                      bra.s      $0004E804
[0004e7e6] 322f 001e                 move.w     30(a7),d1
[0004e7ea] 48c1                      ext.l      d1
[0004e7ec] 2001                      move.l     d1,d0
[0004e7ee] d080                      add.l      d0,d0
[0004e7f0] d081                      add.l      d1,d0
[0004e7f2] e788                      lsl.l      #3,d0
[0004e7f4] 206f 0048                 movea.l    72(a7),a0
[0004e7f8] 3f70 0800 0020            move.w     0(a0,d0.l),32(a7)
[0004e7fe] 302f 0020                 move.w     32(a7),d0
[0004e802] 6aaa                      bpl.s      $0004E7AE
[0004e804] 302f 0020                 move.w     32(a7),d0
[0004e808] 6f0a                      ble.s      $0004E814
[0004e80a] 302f 0022                 move.w     34(a7),d0
[0004e80e] 6b04                      bmi.s      $0004E814
[0004e810] 426f 0006                 clr.w      6(a7)
[0004e814] 7002                      moveq.l    #2,d0
[0004e816] c06f 001a                 and.w      26(a7),d0
[0004e81a] 670a                      beq.s      $0004E826
[0004e81c] 3f6f 0028 0022            move.w     40(a7),34(a7)
[0004e822] 426f 0006                 clr.w      6(a7)
[0004e826] 302f 0006                 move.w     6(a7),d0
[0004e82a] 6600 f2ae                 bne        $0004DADA
[0004e82e] 43ef 003a                 lea.l      58(a7),a1
[0004e832] 206f 0042                 movea.l    66(a7),a0
[0004e836] 4eb9 0005 021e            jsr        Aob_restore
[0004e83c] 302f 0022                 move.w     34(a7),d0
[0004e840] 4fef 004c                 lea.l      76(a7),a7
[0004e844] 245f                      movea.l    (a7)+,a2
[0004e846] 261f                      move.l     (a7)+,d3
[0004e848] 4e75                      rts
Ame_popup:
[0004e84a] 2f0a                      move.l     a2,-(a7)
[0004e84c] 4fef ffd8                 lea.l      -40(a7),a7
[0004e850] 2f48 0024                 move.l     a0,36(a7)
[0004e854] 2f49 0020                 move.l     a1,32(a7)
[0004e858] 3f40 001e                 move.w     d0,30(a7)
[0004e85c] 3f41 001c                 move.w     d1,28(a7)
[0004e860] 41d7                      lea.l      (a7),a0
[0004e862] 4eb9 0006 bf9e            jsr        Act_save
[0004e868] 206f 0020                 movea.l    32(a7),a0
[0004e86c] 4eb9 0004 fbdc            jsr        Aob_fix
[0004e872] 302f 001e                 move.w     30(a7),d0
[0004e876] 6a46                      bpl.s      $0004E8BE
[0004e878] 302f 001c                 move.w     28(a7),d0
[0004e87c] 6a40                      bpl.s      $0004E8BE
[0004e87e] 2f39 000e 692a            move.l     _globl,-(a7)
[0004e884] 486f 001c                 pea.l      28(a7)
[0004e888] 486f 0020                 pea.l      32(a7)
[0004e88c] 43ef 0028                 lea.l      40(a7),a1
[0004e890] 41ef 002a                 lea.l      42(a7),a0
[0004e894] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0004e89a] 4fef 000c                 lea.l      12(a7),a7
[0004e89e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004e8a4] 3028 0012                 move.w     18(a0),d0
[0004e8a8] e240                      asr.w      #1,d0
[0004e8aa] 916f 001e                 sub.w      d0,30(a7)
[0004e8ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004e8b4] 3028 0014                 move.w     20(a0),d0
[0004e8b8] e240                      asr.w      #1,d0
[0004e8ba] 916f 001c                 sub.w      d0,28(a7)
[0004e8be] 206f 0020                 movea.l    32(a7),a0
[0004e8c2] 316f 001e 0010            move.w     30(a7),16(a0)
[0004e8c8] 206f 0020                 movea.l    32(a7),a0
[0004e8cc] 316f 001c 0012            move.w     28(a7),18(a0)
[0004e8d2] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004e8d8] 43e9 0260                 lea.l      608(a1),a1
[0004e8dc] 7017                      moveq.l    #23,d0
[0004e8de] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004e8e4] 2068 0258                 movea.l    600(a0),a0
[0004e8e8] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004e8ee] 246a 0258                 movea.l    600(a2),a2
[0004e8f2] 246a 0004                 movea.l    4(a2),a2
[0004e8f6] 4e92                      jsr        (a2)
[0004e8f8] 4240                      clr.w      d0
[0004e8fa] 206f 0020                 movea.l    32(a7),a0
[0004e8fe] 6100 ef58                 bsr        Ame_submenu
[0004e902] 3f40 001a                 move.w     d0,26(a7)
[0004e906] 93c9                      suba.l     a1,a1
[0004e908] 7019                      moveq.l    #25,d0
[0004e90a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004e910] 2068 0258                 movea.l    600(a0),a0
[0004e914] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004e91a] 246a 0258                 movea.l    600(a2),a2
[0004e91e] 246a 0004                 movea.l    4(a2),a2
[0004e922] 4e92                      jsr        (a2)
[0004e924] 4eb9 0005 0c80            jsr        Aev_release
[0004e92a] 302f 001a                 move.w     26(a7),d0
[0004e92e] 6f1c                      ble.s      $0004E94C
[0004e930] 4eb9 0004 eec0            jsr        Amo_busy
[0004e936] 302f 001a                 move.w     26(a7),d0
[0004e93a] 226f 0020                 movea.l    32(a7),a1
[0004e93e] 206f 0024                 movea.l    36(a7),a0
[0004e942] 6100 e79c                 bsr        call_click
[0004e946] 4eb9 0004 ef0c            jsr        Amo_unbusy
[0004e94c] 302f 001a                 move.w     26(a7),d0
[0004e950] 6606                      bne.s      $0004E958
[0004e952] 3f7c ffff 001a            move.w     #$FFFF,26(a7)
[0004e958] 41d7                      lea.l      (a7),a0
[0004e95a] 4eb9 0006 c00a            jsr        Act_restore
[0004e960] 302f 001a                 move.w     26(a7),d0
[0004e964] 4fef 0028                 lea.l      40(a7),a7
[0004e968] 245f                      movea.l    (a7)+,a2
[0004e96a] 4e75                      rts
Ame_root:
[0004e96c] 4fef fff4                 lea.l      -12(a7),a7
[0004e970] 3f40 000a                 move.w     d0,10(a7)
[0004e974] 3f41 0008                 move.w     d1,8(a7)
[0004e978] 4eb9 0005 5e8c            jsr        Awi_root
[0004e97e] 2f48 0004                 move.l     a0,4(a7)
[0004e982] 206f 0004                 movea.l    4(a7),a0
[0004e986] 2ea8 005e                 move.l     94(a0),(a7)
[0004e98a] 4eb9 0004 eec0            jsr        Amo_busy
[0004e990] 0c6f 0003 000a            cmpi.w     #$0003,10(a7)
[0004e996] 660e                      bne.s      $0004E9A6
[0004e998] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004e99e] 2068 029c                 movea.l    668(a0),a0
[0004e9a2] 4e90                      jsr        (a0)
[0004e9a4] 600e                      bra.s      $0004E9B4
[0004e9a6] 302f 0008                 move.w     8(a7),d0
[0004e9aa] 2257                      movea.l    (a7),a1
[0004e9ac] 206f 0004                 movea.l    4(a7),a0
[0004e9b0] 6100 e72e                 bsr        call_click
[0004e9b4] 4eb9 0004 ef0c            jsr        Amo_unbusy
[0004e9ba] 2279 000e 692a            movea.l    _globl,a1
[0004e9c0] 7201                      moveq.l    #1,d1
[0004e9c2] 302f 000a                 move.w     10(a7),d0
[0004e9c6] 2057                      movea.l    (a7),a0
[0004e9c8] 4eb9 0007 9772            jsr        mt_menu_tnormal
[0004e9ce] 4fef 000c                 lea.l      12(a7),a7
[0004e9d2] 4e75                      rts
Ame_drop:
[0004e9d4] 4fef ffe8                 lea.l      -24(a7),a7
[0004e9d8] 2f48 0014                 move.l     a0,20(a7)
[0004e9dc] 3f40 0012                 move.w     d0,18(a7)
[0004e9e0] 3f41 0010                 move.w     d1,16(a7)
[0004e9e4] 206f 0014                 movea.l    20(a7),a0
[0004e9e8] 2ea8 005e                 move.l     94(a0),(a7)
[0004e9ec] 6604                      bne.s      $0004E9F2
[0004e9ee] 6000 00a6                 bra        $0004EA96
[0004e9f2] 2057                      movea.l    (a7),a0
[0004e9f4] 3f68 0010 0008            move.w     16(a0),8(a7)
[0004e9fa] 2057                      movea.l    (a7),a0
[0004e9fc] 3f68 0012 000a            move.w     18(a0),10(a7)
[0004ea02] 2057                      movea.l    (a7),a0
[0004ea04] 3028 0014                 move.w     20(a0),d0
[0004ea08] 206f 0014                 movea.l    20(a7),a0
[0004ea0c] b068 0038                 cmp.w      56(a0),d0
[0004ea10] 6c08                      bge.s      $0004EA1A
[0004ea12] 2057                      movea.l    (a7),a0
[0004ea14] 3028 0014                 move.w     20(a0),d0
[0004ea18] 6008                      bra.s      $0004EA22
[0004ea1a] 206f 0014                 movea.l    20(a7),a0
[0004ea1e] 3028 0038                 move.w     56(a0),d0
[0004ea22] 3f40 000c                 move.w     d0,12(a7)
[0004ea26] 2057                      movea.l    (a7),a0
[0004ea28] 3f68 0016 000e            move.w     22(a0),14(a7)
[0004ea2e] 322f 0010                 move.w     16(a7),d1
[0004ea32] 302f 0012                 move.w     18(a7),d0
[0004ea36] 41ef 0008                 lea.l      8(a7),a0
[0004ea3a] 4eb9 0006 b7a6            jsr        Aob_within
[0004ea40] 4a40                      tst.w      d0
[0004ea42] 6602                      bne.s      $0004EA46
[0004ea44] 6050                      bra.s      $0004EA96
[0004ea46] 2057                      movea.l    (a7),a0
[0004ea48] 3228 0002                 move.w     2(a0),d1
[0004ea4c] 48c1                      ext.l      d1
[0004ea4e] 2001                      move.l     d1,d0
[0004ea50] d080                      add.l      d0,d0
[0004ea52] d081                      add.l      d1,d0
[0004ea54] e788                      lsl.l      #3,d0
[0004ea56] 2057                      movea.l    (a7),a0
[0004ea58] 3f70 0802 0004            move.w     2(a0,d0.l),4(a7)
[0004ea5e] 3f2f 0010                 move.w     16(a7),-(a7)
[0004ea62] 342f 0014                 move.w     20(a7),d2
[0004ea66] 7201                      moveq.l    #1,d1
[0004ea68] 302f 0006                 move.w     6(a7),d0
[0004ea6c] 206f 0002                 movea.l    2(a7),a0
[0004ea70] 4eb9 0004 8fd4            jsr        Adr_find
[0004ea76] 544f                      addq.w     #2,a7
[0004ea78] 3f40 0006                 move.w     d0,6(a7)
[0004ea7c] 302f 0006                 move.w     6(a7),d0
[0004ea80] b06f 0004                 cmp.w      4(a7),d0
[0004ea84] 6e02                      bgt.s      $0004EA88
[0004ea86] 600e                      bra.s      $0004EA96
[0004ea88] 302f 0006                 move.w     6(a7),d0
[0004ea8c] 2257                      movea.l    (a7),a1
[0004ea8e] 206f 0014                 movea.l    20(a7),a0
[0004ea92] 6100 e7ea                 bsr        Ame_menu
[0004ea96] 4fef 0018                 lea.l      24(a7),a7
[0004ea9a] 4e75                      rts
Ame_key:
[0004ea9c] 4fef ffe8                 lea.l      -24(a7),a7
[0004eaa0] 2f48 0014                 move.l     a0,20(a7)
[0004eaa4] 3f40 0012                 move.w     d0,18(a7)
[0004eaa8] 3f41 0010                 move.w     d1,16(a7)
[0004eaac] 206f 0014                 movea.l    20(a7),a0
[0004eab0] 2ea8 005e                 move.l     94(a0),(a7)
[0004eab4] 6606                      bne.s      $0004EABC
[0004eab6] 70ff                      moveq.l    #-1,d0
[0004eab8] 6000 0164                 bra        $0004EC1E
[0004eabc] 322f 0010                 move.w     16(a7),d1
[0004eac0] 302f 0012                 move.w     18(a7),d0
[0004eac4] 2057                      movea.l    (a7),a0
[0004eac6] 4eb9 0005 0ce8            jsr        Aob_key
[0004eacc] 3f40 000e                 move.w     d0,14(a7)
[0004ead0] 302f 000e                 move.w     14(a7),d0
[0004ead4] 6a06                      bpl.s      $0004EADC
[0004ead6] 70ff                      moveq.l    #-1,d0
[0004ead8] 6000 0144                 bra        $0004EC1E
[0004eadc] 2057                      movea.l    (a7),a0
[0004eade] 3228 0002                 move.w     2(a0),d1
[0004eae2] 48c1                      ext.l      d1
[0004eae4] 2001                      move.l     d1,d0
[0004eae6] d080                      add.l      d0,d0
[0004eae8] d081                      add.l      d1,d0
[0004eaea] e788                      lsl.l      #3,d0
[0004eaec] 2057                      movea.l    (a7),a0
[0004eaee] 3f70 0802 000c            move.w     2(a0,d0.l),12(a7)
[0004eaf4] 322f 000c                 move.w     12(a7),d1
[0004eaf8] 48c1                      ext.l      d1
[0004eafa] 2001                      move.l     d1,d0
[0004eafc] d080                      add.l      d0,d0
[0004eafe] d081                      add.l      d1,d0
[0004eb00] e788                      lsl.l      #3,d0
[0004eb02] 2057                      movea.l    (a7),a0
[0004eb04] 3f70 0802 000a            move.w     2(a0,d0.l),10(a7)
[0004eb0a] 2057                      movea.l    (a7),a0
[0004eb0c] 3228 0004                 move.w     4(a0),d1
[0004eb10] 48c1                      ext.l      d1
[0004eb12] 2001                      move.l     d1,d0
[0004eb14] d080                      add.l      d0,d0
[0004eb16] d081                      add.l      d1,d0
[0004eb18] e788                      lsl.l      #3,d0
[0004eb1a] 2057                      movea.l    (a7),a0
[0004eb1c] 3f70 0802 0008            move.w     2(a0,d0.l),8(a7)
[0004eb22] 3f6f 000e 0004            move.w     14(a7),4(a7)
[0004eb28] 3f6f 0004 0006            move.w     4(a7),6(a7)
[0004eb2e] 302f 0006                 move.w     6(a7),d0
[0004eb32] 2057                      movea.l    (a7),a0
[0004eb34] 4eb9 0005 0f3a            jsr        Aob_up
[0004eb3a] 3f40 0004                 move.w     d0,4(a7)
[0004eb3e] 302f 0004                 move.w     4(a7),d0
[0004eb42] 6a06                      bpl.s      $0004EB4A
[0004eb44] 70ff                      moveq.l    #-1,d0
[0004eb46] 6000 00d6                 bra        $0004EC1E
[0004eb4a] 2057                      movea.l    (a7),a0
[0004eb4c] 302f 0004                 move.w     4(a7),d0
[0004eb50] b068 0004                 cmp.w      4(a0),d0
[0004eb54] 66d2                      bne.s      $0004EB28
[0004eb56] 603c                      bra.s      $0004EB94
[0004eb58] 322f 000a                 move.w     10(a7),d1
[0004eb5c] 48c1                      ext.l      d1
[0004eb5e] 2001                      move.l     d1,d0
[0004eb60] d080                      add.l      d0,d0
[0004eb62] d081                      add.l      d1,d0
[0004eb64] e788                      lsl.l      #3,d0
[0004eb66] 2057                      movea.l    (a7),a0
[0004eb68] 3f70 0800 000a            move.w     0(a0,d0.l),10(a7)
[0004eb6e] 322f 0008                 move.w     8(a7),d1
[0004eb72] 48c1                      ext.l      d1
[0004eb74] 2001                      move.l     d1,d0
[0004eb76] d080                      add.l      d0,d0
[0004eb78] d081                      add.l      d1,d0
[0004eb7a] e788                      lsl.l      #3,d0
[0004eb7c] 2057                      movea.l    (a7),a0
[0004eb7e] 3f70 0800 0008            move.w     0(a0,d0.l),8(a7)
[0004eb84] 302f 000a                 move.w     10(a7),d0
[0004eb88] b06f 000c                 cmp.w      12(a7),d0
[0004eb8c] 6606                      bne.s      $0004EB94
[0004eb8e] 70ff                      moveq.l    #-1,d0
[0004eb90] 6000 008c                 bra        $0004EC1E
[0004eb94] 302f 0008                 move.w     8(a7),d0
[0004eb98] b06f 0006                 cmp.w      6(a7),d0
[0004eb9c] 66ba                      bne.s      $0004EB58
[0004eb9e] 4eb9 0004 eec0            jsr        Amo_busy
[0004eba4] 206f 0014                 movea.l    20(a7),a0
[0004eba8] 3028 0020                 move.w     32(a0),d0
[0004ebac] 6638                      bne.s      $0004EBE6
[0004ebae] 2279 000e 692a            movea.l    _globl,a1
[0004ebb4] 4241                      clr.w      d1
[0004ebb6] 302f 000a                 move.w     10(a7),d0
[0004ebba] 2057                      movea.l    (a7),a0
[0004ebbc] 4eb9 0007 9772            jsr        mt_menu_tnormal
[0004ebc2] 302f 000e                 move.w     14(a7),d0
[0004ebc6] 2257                      movea.l    (a7),a1
[0004ebc8] 206f 0014                 movea.l    20(a7),a0
[0004ebcc] 6100 e512                 bsr        call_click
[0004ebd0] 2279 000e 692a            movea.l    _globl,a1
[0004ebd6] 7201                      moveq.l    #1,d1
[0004ebd8] 302f 000a                 move.w     10(a7),d0
[0004ebdc] 2057                      movea.l    (a7),a0
[0004ebde] 4eb9 0007 9772            jsr        mt_menu_tnormal
[0004ebe4] 602e                      bra.s      $0004EC14
[0004ebe6] 7201                      moveq.l    #1,d1
[0004ebe8] 302f 000a                 move.w     10(a7),d0
[0004ebec] 2257                      movea.l    (a7),a1
[0004ebee] 206f 0014                 movea.l    20(a7),a0
[0004ebf2] 6100 e60e                 bsr        Ame_tnormal
[0004ebf6] 302f 000e                 move.w     14(a7),d0
[0004ebfa] 2257                      movea.l    (a7),a1
[0004ebfc] 206f 0014                 movea.l    20(a7),a0
[0004ec00] 6100 e4de                 bsr        call_click
[0004ec04] 4241                      clr.w      d1
[0004ec06] 302f 000a                 move.w     10(a7),d0
[0004ec0a] 2257                      movea.l    (a7),a1
[0004ec0c] 206f 0014                 movea.l    20(a7),a0
[0004ec10] 6100 e5f0                 bsr        Ame_tnormal
[0004ec14] 4eb9 0004 ef0c            jsr        Amo_unbusy
[0004ec1a] 302f 000e                 move.w     14(a7),d0
[0004ec1e] 4fef 0018                 lea.l      24(a7),a7
[0004ec22] 4e75                      rts
Ame_namefix:
[0004ec24] 4fef ffe4                 lea.l      -28(a7),a7
[0004ec28] 2f48 0018                 move.l     a0,24(a7)
[0004ec2c] 426f 0008                 clr.w      8(a7)
[0004ec30] 206f 0018                 movea.l    24(a7),a0
[0004ec34] 3f68 0002 0014            move.w     2(a0),20(a7)
[0004ec3a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ec40] 322f 0014                 move.w     20(a7),d1
[0004ec44] 48c1                      ext.l      d1
[0004ec46] 2001                      move.l     d1,d0
[0004ec48] d080                      add.l      d0,d0
[0004ec4a] d081                      add.l      d1,d0
[0004ec4c] e788                      lsl.l      #3,d0
[0004ec4e] 226f 0018                 movea.l    24(a7),a1
[0004ec52] 33a8 000c 0814            move.w     12(a0),20(a1,d0.l)
[0004ec58] 322f 0014                 move.w     20(a7),d1
[0004ec5c] 48c1                      ext.l      d1
[0004ec5e] 2001                      move.l     d1,d0
[0004ec60] d080                      add.l      d0,d0
[0004ec62] d081                      add.l      d1,d0
[0004ec64] e788                      lsl.l      #3,d0
[0004ec66] 206f 0018                 movea.l    24(a7),a0
[0004ec6a] 3f70 0802 0014            move.w     2(a0,d0.l),20(a7)
[0004ec70] 322f 0014                 move.w     20(a7),d1
[0004ec74] 48c1                      ext.l      d1
[0004ec76] 2001                      move.l     d1,d0
[0004ec78] d080                      add.l      d0,d0
[0004ec7a] d081                      add.l      d1,d0
[0004ec7c] e788                      lsl.l      #3,d0
[0004ec7e] 206f 0018                 movea.l    24(a7),a0
[0004ec82] 3f70 0802 0016            move.w     2(a0,d0.l),22(a7)
[0004ec88] 206f 0018                 movea.l    24(a7),a0
[0004ec8c] 3f68 0004 0012            move.w     4(a0),18(a7)
[0004ec92] 322f 0012                 move.w     18(a7),d1
[0004ec96] 48c1                      ext.l      d1
[0004ec98] 2001                      move.l     d1,d0
[0004ec9a] d080                      add.l      d0,d0
[0004ec9c] d081                      add.l      d1,d0
[0004ec9e] e788                      lsl.l      #3,d0
[0004eca0] 206f 0018                 movea.l    24(a7),a0
[0004eca4] 3f70 0802 0012            move.w     2(a0,d0.l),18(a7)
[0004ecaa] 322f 0016                 move.w     22(a7),d1
[0004ecae] 48c1                      ext.l      d1
[0004ecb0] 2001                      move.l     d1,d0
[0004ecb2] d080                      add.l      d0,d0
[0004ecb4] d081                      add.l      d1,d0
[0004ecb6] e788                      lsl.l      #3,d0
[0004ecb8] 206f 0018                 movea.l    24(a7),a0
[0004ecbc] 3f70 0810 000e            move.w     16(a0,d0.l),14(a7)
[0004ecc2] 322f 0012                 move.w     18(a7),d1
[0004ecc6] 48c1                      ext.l      d1
[0004ecc8] 2001                      move.l     d1,d0
[0004ecca] d080                      add.l      d0,d0
[0004eccc] d081                      add.l      d1,d0
[0004ecce] e788                      lsl.l      #3,d0
[0004ecd0] 206f 0018                 movea.l    24(a7),a0
[0004ecd4] 3f70 0810 000c            move.w     16(a0,d0.l),12(a7)
[0004ecda] 6000 0112                 bra        $0004EDEE
[0004ecde] 322f 0016                 move.w     22(a7),d1
[0004ece2] 48c1                      ext.l      d1
[0004ece4] 2001                      move.l     d1,d0
[0004ece6] d080                      add.l      d0,d0
[0004ece8] d081                      add.l      d1,d0
[0004ecea] e788                      lsl.l      #3,d0
[0004ecec] 206f 0018                 movea.l    24(a7),a0
[0004ecf0] 2070 080c                 movea.l    12(a0,d0.l),a0
[0004ecf4] 2f48 0004                 move.l     a0,4(a7)
[0004ecf8] 4eb9 0008 2f6c            jsr        strlen
[0004ecfe] 3f40 000a                 move.w     d0,10(a7)
[0004ed02] 302f 000a                 move.w     10(a7),d0
[0004ed06] 206f 0004                 movea.l    4(a7),a0
[0004ed0a] 41f0 00ff                 lea.l      -1(a0,d0.w),a0
[0004ed0e] 2e88                      move.l     a0,(a7)
[0004ed10] 6006                      bra.s      $0004ED18
[0004ed12] 536f 000a                 subq.w     #1,10(a7)
[0004ed16] 5397                      subq.l     #1,(a7)
[0004ed18] 302f 000a                 move.w     10(a7),d0
[0004ed1c] 6f08                      ble.s      $0004ED26
[0004ed1e] 2057                      movea.l    (a7),a0
[0004ed20] 0c10 0020                 cmpi.b     #$20,(a0)
[0004ed24] 67ec                      beq.s      $0004ED12
[0004ed26] 6008                      bra.s      $0004ED30
[0004ed28] 536f 000a                 subq.w     #1,10(a7)
[0004ed2c] 52af 0004                 addq.l     #1,4(a7)
[0004ed30] 302f 000a                 move.w     10(a7),d0
[0004ed34] 6f0a                      ble.s      $0004ED40
[0004ed36] 206f 0004                 movea.l    4(a7),a0
[0004ed3a] 0c10 0020                 cmpi.b     #$20,(a0)
[0004ed3e] 67e8                      beq.s      $0004ED28
[0004ed40] 7002                      moveq.l    #2,d0
[0004ed42] d06f 000a                 add.w      10(a7),d0
[0004ed46] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004ed4c] c1e8 0012                 muls.w     18(a0),d0
[0004ed50] 342f 0016                 move.w     22(a7),d2
[0004ed54] 48c2                      ext.l      d2
[0004ed56] 2202                      move.l     d2,d1
[0004ed58] d281                      add.l      d1,d1
[0004ed5a] d282                      add.l      d2,d1
[0004ed5c] e789                      lsl.l      #3,d1
[0004ed5e] 206f 0018                 movea.l    24(a7),a0
[0004ed62] 3180 1814                 move.w     d0,20(a0,d1.l)
[0004ed66] 3f40 0010                 move.w     d0,16(a7)
[0004ed6a] 302f 0010                 move.w     16(a7),d0
[0004ed6e] d16f 0008                 add.w      d0,8(a7)
[0004ed72] 322f 0016                 move.w     22(a7),d1
[0004ed76] 48c1                      ext.l      d1
[0004ed78] 2001                      move.l     d1,d0
[0004ed7a] d080                      add.l      d0,d0
[0004ed7c] d081                      add.l      d1,d0
[0004ed7e] e788                      lsl.l      #3,d0
[0004ed80] 206f 0018                 movea.l    24(a7),a0
[0004ed84] 31af 000e 0810            move.w     14(a7),16(a0,d0.l)
[0004ed8a] 322f 0012                 move.w     18(a7),d1
[0004ed8e] 48c1                      ext.l      d1
[0004ed90] 2001                      move.l     d1,d0
[0004ed92] d080                      add.l      d0,d0
[0004ed94] d081                      add.l      d1,d0
[0004ed96] e788                      lsl.l      #3,d0
[0004ed98] 206f 0018                 movea.l    24(a7),a0
[0004ed9c] 31af 000c 0810            move.w     12(a7),16(a0,d0.l)
[0004eda2] 302f 0010                 move.w     16(a7),d0
[0004eda6] d16f 000e                 add.w      d0,14(a7)
[0004edaa] 302f 0010                 move.w     16(a7),d0
[0004edae] d16f 000c                 add.w      d0,12(a7)
[0004edb2] 322f 0016                 move.w     22(a7),d1
[0004edb6] 48c1                      ext.l      d1
[0004edb8] 2001                      move.l     d1,d0
[0004edba] d080                      add.l      d0,d0
[0004edbc] d081                      add.l      d1,d0
[0004edbe] e788                      lsl.l      #3,d0
[0004edc0] 206f 0018                 movea.l    24(a7),a0
[0004edc4] 3f70 0800 0016            move.w     0(a0,d0.l),22(a7)
[0004edca] 302f 0016                 move.w     22(a7),d0
[0004edce] b06f 0014                 cmp.w      20(a7),d0
[0004edd2] 6602                      bne.s      $0004EDD6
[0004edd4] 601c                      bra.s      $0004EDF2
[0004edd6] 322f 0012                 move.w     18(a7),d1
[0004edda] 48c1                      ext.l      d1
[0004eddc] 2001                      move.l     d1,d0
[0004edde] d080                      add.l      d0,d0
[0004ede0] d081                      add.l      d1,d0
[0004ede2] e788                      lsl.l      #3,d0
[0004ede4] 206f 0018                 movea.l    24(a7),a0
[0004ede8] 3f70 0800 0012            move.w     0(a0,d0.l),18(a7)
[0004edee] 6000 feee                 bra        $0004ECDE
[0004edf2] 322f 0014                 move.w     20(a7),d1
[0004edf6] 48c1                      ext.l      d1
[0004edf8] 2001                      move.l     d1,d0
[0004edfa] d080                      add.l      d0,d0
[0004edfc] d081                      add.l      d1,d0
[0004edfe] e788                      lsl.l      #3,d0
[0004ee00] 206f 0018                 movea.l    24(a7),a0
[0004ee04] 31af 0008 0814            move.w     8(a7),20(a0,d0.l)
[0004ee0a] 4fef 001c                 lea.l      28(a7),a7
[0004ee0e] 4e75                      rts
