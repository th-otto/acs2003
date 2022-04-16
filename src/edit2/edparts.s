omalloc:
[0002489c] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000248a0] 2600                      move.l     d0,d3
[000248a2] 95ca                      suba.l     a2,a2
[000248a4] 4a80                      tst.l      d0
[000248a6] 670c                      beq.s      omalloc_1
[000248a8] 4eb9 0004 c608            jsr        Ax_malloc
[000248ae] 2448                      movea.l    a0,a2
[000248b0] 200a                      move.l     a2,d0
[000248b2] 6716                      beq.s      omalloc_2
omalloc_1:
[000248b4] 7042                      moveq.l    #66,d0
[000248b6] 4eb9 0004 c608            jsr        Ax_malloc
[000248bc] 2648                      movea.l    a0,a3
[000248be] 200b                      move.l     a3,d0
[000248c0] 660c                      bne.s      omalloc_3
[000248c2] 204a                      movea.l    a2,a0
[000248c4] 4eb9 0004 c7c8            jsr        Ax_free
omalloc_2:
[000248ca] 91c8                      suba.l     a0,a0
[000248cc] 6022                      bra.s      omalloc_4
omalloc_3:
[000248ce] 7242                      moveq.l    #66,d1
[000248d0] 4240                      clr.w      d0
[000248d2] 204b                      movea.l    a3,a0
[000248d4] 4eb9 0008 36ea            jsr        memset
[000248da] 274a 0004                 move.l     a2,4(a3)
[000248de] 377c 0001 0036            move.w     #$0001,54(a3)
[000248e4] 4293                      clr.l      (a3)
[000248e6] 2743 000a                 move.l     d3,10(a3)
[000248ea] 2743 000e                 move.l     d3,14(a3)
[000248ee] 204b                      movea.l    a3,a0
omalloc_4:
[000248f0] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000248f4] 4e75                      rts

part_add:
[000248f6] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[000248fa] 4fef ffe8                 lea.l      -24(a7),a7
[000248fe] 2648                      movea.l    a0,a3
[00024900] 0c79 0028 000b b538       cmpi.w     #$0028,part_ucnt
[00024908] 6c00 03fa                 bge        part_add_1
[0002490c] 2279 000b b542            movea.l    parts_window,a1
[00024912] 2f69 0014 0014            move.l     20(a1),20(a7)
[00024918] 323c 0080                 move.w     #$0080,d1
[0002491c] 70ff                      moveq.l    #-1,d0
[0002491e] 206f 0014                 movea.l    20(a7),a0
[00024922] 4eb9 0005 0e62            jsr        Aob_findflag
[00024928] 3600                      move.w     d0,d3
[0002492a] 4a40                      tst.w      d0
[0002492c] 6b00 03d6                 bmi        part_add_1
[00024930] 48c0                      ext.l      d0
[00024932] 2200                      move.l     d0,d1
[00024934] d281                      add.l      d1,d1
[00024936] d280                      add.l      d0,d1
[00024938] e789                      lsl.l      #3,d1
[0002493a] 286f 0014                 movea.l    20(a7),a4
[0002493e] d9c1                      adda.l     d1,a4
[00024940] 362c 0002                 move.w     2(a4),d3
[00024944] 48c3                      ext.l      d3
[00024946] 2403                      move.l     d3,d2
[00024948] d482                      add.l      d2,d2
[0002494a] d483                      add.l      d3,d2
[0002494c] e78a                      lsl.l      #3,d2
[0002494e] 206f 0014                 movea.l    20(a7),a0
[00024952] d1c2                      adda.l     d2,a0
[00024954] 2f48 0010                 move.l     a0,16(a7)
[00024958] 41e8 0018                 lea.l      24(a0),a0
[0002495c] 2f48 000c                 move.l     a0,12(a7)
[00024960] 3028 0012                 move.w     18(a0),d0
[00024964] 3200                      move.w     d0,d1
[00024966] e749                      lsl.w      #3,d1
[00024968] 9240                      sub.w      d0,d1
[0002496a] e749                      lsl.w      #3,d1
[0002496c] 43f9 000b a776            lea.l      tree,a1
[00024972] d2c1                      adda.w     d1,a1
[00024974] 2f49 0008                 move.l     a1,8(a7)
[00024978] 337c 0018 000e            move.w     #$0018,14(a1)
[0002497e] 206b 0034                 movea.l    52(a3),a0
[00024982] 3368 0008 0010            move.w     8(a0),16(a1)
[00024988] 206b 0034                 movea.l    52(a3),a0
[0002498c] 3368 000a 0012            move.w     10(a0),18(a1)
[00024992] 206b 0034                 movea.l    52(a3),a0
[00024996] 3368 0010 0018            move.w     16(a0),24(a1)
[0002499c] 206b 0034                 movea.l    52(a3),a0
[000249a0] 3368 0012 001a            move.w     18(a0),26(a1)
[000249a6] 206b 0034                 movea.l    52(a3),a0
[000249aa] 3368 0014 001c            move.w     20(a0),28(a1)
[000249b0] 206b 0034                 movea.l    52(a3),a0
[000249b4] 3368 0016 001e            move.w     22(a0),30(a1)
[000249ba] 2a6b 0038                 movea.l    56(a3),a5
[000249be] 7020                      moveq.l    #32,d0
[000249c0] 6100 feda                 bsr        omalloc
[000249c4] 2e88                      move.l     a0,(a7)
[000249c6] 2008                      move.l     a0,d0
[000249c8] 6700 033a                 beq        part_add_1
[000249cc] 43f9 000b b582            lea.l      $000BB582,a1
[000249d2] 2f09                      move.l     a1,-(a7)
[000249d4] 41e8 0016                 lea.l      22(a0),a0
[000249d8] 224b                      movea.l    a3,a1
[000249da] 4eb9 0008 2f0c            jsr        strcpy
[000249e0] 225f                      movea.l    (a7)+,a1
[000249e2] 701f                      moveq.l    #31,d0
[000249e4] 4eb9 0008 2f96            jsr        strncat
[000249ea] 4eb9 0008 3180            jsr        strupr
[000249f0] 302d 0012                 move.w     18(a5),d0
[000249f4] e548                      lsl.w      #2,d0
[000249f6] 806d 0008                 or.w       8(a5),d0
[000249fa] 322d 001c                 move.w     28(a5),d1
[000249fe] e949                      lsl.w      #4,d1
[00024a00] 8041                      or.w       d1,d0
[00024a02] 2057                      movea.l    (a7),a0
[00024a04] 3140 0038                 move.w     d0,56(a0)
[00024a08] 2f68 0004 0004            move.l     4(a0),4(a7)
[00024a0e] 7000                      moveq.l    #0,d0
[00024a10] 6100 fe8a                 bsr        omalloc
[00024a14] 2448                      movea.l    a0,a2
[00024a16] 200a                      move.l     a2,d0
[00024a18] 6700 02ea                 beq        part_add_1
[00024a1c] 224b                      movea.l    a3,a1
[00024a1e] 41ea 0016                 lea.l      22(a2),a0
[00024a22] 4eb9 0008 2f0c            jsr        strcpy
[00024a28] 357c 0203 0038            move.w     #$0203,56(a2)
[00024a2e] 206f 0004                 movea.l    4(a7),a0
[00024a32] 208a                      move.l     a2,(a0)
[00024a34] 7000                      moveq.l    #0,d0
[00024a36] 6100 fe64                 bsr        omalloc
[00024a3a] 2448                      movea.l    a0,a2
[00024a3c] 200a                      move.l     a2,d0
[00024a3e] 6700 02c4                 beq        part_add_1
[00024a42] 2255                      movea.l    (a5),a1
[00024a44] 41ea 0016                 lea.l      22(a2),a0
[00024a48] 4eb9 0008 2f0c            jsr        strcpy
[00024a4e] 426a 0038                 clr.w      56(a2)
[00024a52] 206f 0004                 movea.l    4(a7),a0
[00024a56] 214a 0004                 move.l     a2,4(a0)
[00024a5a] 202d 0004                 move.l     4(a5),d0
[00024a5e] 672a                      beq.s      part_add_2
[00024a60] 2240                      movea.l    d0,a1
[00024a62] 1211                      move.b     (a1),d1
[00024a64] 6724                      beq.s      part_add_2
[00024a66] 7000                      moveq.l    #0,d0
[00024a68] 6100 fe32                 bsr        omalloc
[00024a6c] 2448                      movea.l    a0,a2
[00024a6e] 200a                      move.l     a2,d0
[00024a70] 6700 0292                 beq        part_add_1
[00024a74] 226d 0004                 movea.l    4(a5),a1
[00024a78] 41ea 0016                 lea.l      22(a2),a0
[00024a7c] 4eb9 0008 2f0c            jsr        strcpy
[00024a82] 357c 0204 0038            move.w     #$0204,56(a2)
[00024a88] 6002                      bra.s      part_add_3
part_add_2:
[00024a8a] 95ca                      suba.l     a2,a2
part_add_3:
[00024a8c] 206f 0004                 movea.l    4(a7),a0
[00024a90] 214a 0008                 move.l     a2,8(a0)
[00024a94] 302d 0008                 move.w     8(a5),d0
[00024a98] 5340                      subq.w     #1,d0
[00024a9a] 670c                      beq.s      part_add_4
[00024a9c] 5340                      subq.w     #1,d0
[00024a9e] 671c                      beq.s      part_add_5
[00024aa0] 5340                      subq.w     #1,d0
[00024aa2] 6754                      beq.s      part_add_6
[00024aa4] 6000 008e                 bra        part_add_7
part_add_4:
[00024aa8] 7000                      moveq.l    #0,d0
[00024aaa] 6100 fdf0                 bsr        omalloc
[00024aae] 2448                      movea.l    a0,a2
[00024ab0] 200a                      move.l     a2,d0
[00024ab2] 6700 0250                 beq        part_add_1
[00024ab6] 426a 0038                 clr.w      56(a2)
[00024aba] 606e                      bra.s      part_add_8
part_add_5:
[00024abc] 206d 000a                 movea.l    10(a5),a0
[00024ac0] 4eb9 0008 2f6c            jsr        strlen
[00024ac6] 2600                      move.l     d0,d3
[00024ac8] 5283                      addq.l     #1,d3
[00024aca] 2003                      move.l     d3,d0
[00024acc] 6100 fdce                 bsr        omalloc
[00024ad0] 2448                      movea.l    a0,a2
[00024ad2] 200a                      move.l     a2,d0
[00024ad4] 6700 022e                 beq        part_add_1
[00024ad8] 43f9 000b b585            lea.l      $000BB585,a1
[00024ade] 41ea 0016                 lea.l      22(a2),a0
[00024ae2] 4eb9 0008 2f0c            jsr        strcpy
[00024ae8] 226d 000a                 movea.l    10(a5),a1
[00024aec] 206a 0004                 movea.l    4(a2),a0
[00024af0] 4eb9 0008 2f0c            jsr        strcpy
[00024af6] 6032                      bra.s      part_add_8
part_add_6:
[00024af8] 202d 000e                 move.l     14(a5),d0
[00024afc] 6100 fd9e                 bsr        omalloc
[00024b00] 2448                      movea.l    a0,a2
[00024b02] 200a                      move.l     a2,d0
[00024b04] 6700 01fe                 beq        part_add_1
[00024b08] 43f9 000b b58d            lea.l      $000BB58D,a1
[00024b0e] 41ea 0016                 lea.l      22(a2),a0
[00024b12] 4eb9 0008 2f0c            jsr        strcpy
[00024b18] 202d 000e                 move.l     14(a5),d0
[00024b1c] 226d 000a                 movea.l    10(a5),a1
[00024b20] 206a 0004                 movea.l    4(a2),a0
[00024b24] 4eb9 0008 3500            jsr        memcpy
part_add_8:
[00024b2a] 206f 0004                 movea.l    4(a7),a0
[00024b2e] 214a 000c                 move.l     a2,12(a0)
[00024b32] 6008                      bra.s      part_add_9
part_add_7:
[00024b34] 206f 0004                 movea.l    4(a7),a0
[00024b38] 42a8 000c                 clr.l      12(a0)
part_add_9:
[00024b3c] 302d 0012                 move.w     18(a5),d0
[00024b40] 5340                      subq.w     #1,d0
[00024b42] 670c                      beq.s      part_add_10
[00024b44] 5340                      subq.w     #1,d0
[00024b46] 671c                      beq.s      part_add_11
[00024b48] 5340                      subq.w     #1,d0
[00024b4a] 6754                      beq.s      part_add_12
[00024b4c] 6000 008e                 bra        part_add_13
part_add_10:
[00024b50] 7000                      moveq.l    #0,d0
[00024b52] 6100 fd48                 bsr        omalloc
[00024b56] 2448                      movea.l    a0,a2
[00024b58] 200a                      move.l     a2,d0
[00024b5a] 6700 01a8                 beq        part_add_1
[00024b5e] 426a 0038                 clr.w      56(a2)
[00024b62] 606e                      bra.s      part_add_14
part_add_11:
[00024b64] 206d 0014                 movea.l    20(a5),a0
[00024b68] 4eb9 0008 2f6c            jsr        strlen
[00024b6e] 2600                      move.l     d0,d3
[00024b70] 5283                      addq.l     #1,d3
[00024b72] 2003                      move.l     d3,d0
[00024b74] 6100 fd26                 bsr        omalloc
[00024b78] 2448                      movea.l    a0,a2
[00024b7a] 200a                      move.l     a2,d0
[00024b7c] 6700 0186                 beq        part_add_1
[00024b80] 43f9 000b b585            lea.l      $000BB585,a1
[00024b86] 41ea 0016                 lea.l      22(a2),a0
[00024b8a] 4eb9 0008 2f0c            jsr        strcpy
[00024b90] 226d 0014                 movea.l    20(a5),a1
[00024b94] 206a 0004                 movea.l    4(a2),a0
[00024b98] 4eb9 0008 2f0c            jsr        strcpy
[00024b9e] 6032                      bra.s      part_add_14
part_add_12:
[00024ba0] 202d 0018                 move.l     24(a5),d0
[00024ba4] 6100 fcf6                 bsr        omalloc
[00024ba8] 2448                      movea.l    a0,a2
[00024baa] 200a                      move.l     a2,d0
[00024bac] 6700 0156                 beq        part_add_1
[00024bb0] 43f9 000b b58d            lea.l      $000BB58D,a1
[00024bb6] 41ea 0016                 lea.l      22(a2),a0
[00024bba] 4eb9 0008 2f0c            jsr        strcpy
[00024bc0] 202d 0018                 move.l     24(a5),d0
[00024bc4] 226d 0014                 movea.l    20(a5),a1
[00024bc8] 206a 0004                 movea.l    4(a2),a0
[00024bcc] 4eb9 0008 3500            jsr        memcpy
part_add_14:
[00024bd2] 206f 0004                 movea.l    4(a7),a0
[00024bd6] 214a 0010                 move.l     a2,16(a0)
[00024bda] 6008                      bra.s      part_add_15
part_add_13:
[00024bdc] 206f 0004                 movea.l    4(a7),a0
[00024be0] 42a8 0010                 clr.l      16(a0)
part_add_15:
[00024be4] 302d 001c                 move.w     28(a5),d0
[00024be8] 5340                      subq.w     #1,d0
[00024bea] 670c                      beq.s      part_add_16
[00024bec] 5340                      subq.w     #1,d0
[00024bee] 671c                      beq.s      part_add_17
[00024bf0] 5340                      subq.w     #1,d0
[00024bf2] 6754                      beq.s      part_add_18
[00024bf4] 6000 008e                 bra        part_add_19
part_add_16:
[00024bf8] 7000                      moveq.l    #0,d0
[00024bfa] 6100 fca0                 bsr        omalloc
[00024bfe] 2448                      movea.l    a0,a2
[00024c00] 200a                      move.l     a2,d0
[00024c02] 6700 0100                 beq        part_add_1
[00024c06] 426a 0038                 clr.w      56(a2)
[00024c0a] 606e                      bra.s      part_add_20
part_add_17:
[00024c0c] 206d 001e                 movea.l    30(a5),a0
[00024c10] 4eb9 0008 2f6c            jsr        strlen
[00024c16] 2600                      move.l     d0,d3
[00024c18] 5283                      addq.l     #1,d3
[00024c1a] 2003                      move.l     d3,d0
[00024c1c] 6100 fc7e                 bsr        omalloc
[00024c20] 2448                      movea.l    a0,a2
[00024c22] 200a                      move.l     a2,d0
[00024c24] 6700 00de                 beq        part_add_1
[00024c28] 43f9 000b b585            lea.l      $000BB585,a1
[00024c2e] 41ea 0016                 lea.l      22(a2),a0
[00024c32] 4eb9 0008 2f0c            jsr        strcpy
[00024c38] 226d 001e                 movea.l    30(a5),a1
[00024c3c] 206a 0004                 movea.l    4(a2),a0
[00024c40] 4eb9 0008 2f0c            jsr        strcpy
[00024c46] 6032                      bra.s      part_add_20
part_add_18:
[00024c48] 202d 0022                 move.l     34(a5),d0
[00024c4c] 6100 fc4e                 bsr        omalloc
[00024c50] 2448                      movea.l    a0,a2
[00024c52] 200a                      move.l     a2,d0
[00024c54] 6700 00ae                 beq        part_add_1
[00024c58] 43f9 000b b58d            lea.l      $000BB58D,a1
[00024c5e] 41ea 0016                 lea.l      22(a2),a0
[00024c62] 4eb9 0008 2f0c            jsr        strcpy
[00024c68] 202d 0022                 move.l     34(a5),d0
[00024c6c] 226d 001e                 movea.l    30(a5),a1
[00024c70] 206a 0004                 movea.l    4(a2),a0
[00024c74] 4eb9 0008 3500            jsr        memcpy
part_add_20:
[00024c7a] 206f 0004                 movea.l    4(a7),a0
[00024c7e] 214a 0014                 move.l     a2,20(a0)
[00024c82] 6008                      bra.s      part_add_21
part_add_19:
[00024c84] 206f 0004                 movea.l    4(a7),a0
[00024c88] 42a8 0014                 clr.l      20(a0)
part_add_21:
[00024c8c] 206d 0026                 movea.l    38(a5),a0
[00024c90] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00024c96] 4a40                      tst.w      d0
[00024c98] 663c                      bne.s      part_add_22
[00024c9a] 206d 0026                 movea.l    38(a5),a0
[00024c9e] 4eb9 0008 2f6c            jsr        strlen
[00024ca4] 5280                      addq.l     #1,d0
[00024ca6] 6100 fbf4                 bsr        omalloc
[00024caa] 2448                      movea.l    a0,a2
[00024cac] 200a                      move.l     a2,d0
[00024cae] 6754                      beq.s      part_add_1
[00024cb0] 43f9 000b b596            lea.l      $000BB596,a1
[00024cb6] 41ea 0016                 lea.l      22(a2),a0
[00024cba] 4eb9 0008 2f0c            jsr        strcpy
[00024cc0] 226d 0026                 movea.l    38(a5),a1
[00024cc4] 206a 0004                 movea.l    4(a2),a0
[00024cc8] 4eb9 0008 2f0c            jsr        strcpy
[00024cce] 357c 0400 0038            move.w     #$0400,56(a2)
[00024cd4] 6002                      bra.s      part_add_23
part_add_22:
[00024cd6] 95ca                      suba.l     a2,a2
part_add_23:
[00024cd8] 206f 0004                 movea.l    4(a7),a0
[00024cdc] 214a 0018                 move.l     a2,24(a0)
[00024ce0] 206d 002a                 movea.l    42(a5),a0
[00024ce4] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00024cea] 4a40                      tst.w      d0
[00024cec] 6642                      bne.s      part_add_24
[00024cee] 206d 002a                 movea.l    42(a5),a0
[00024cf2] 4eb9 0008 2f6c            jsr        strlen
[00024cf8] 5280                      addq.l     #1,d0
[00024cfa] 6100 fba0                 bsr        omalloc
[00024cfe] 2448                      movea.l    a0,a2
[00024d00] 200a                      move.l     a2,d0
[00024d02] 6606                      bne.s      part_add_25
part_add_1:
[00024d04] 70ff                      moveq.l    #-1,d0
[00024d06] 6000 0108                 bra        part_add_26
part_add_25:
[00024d0a] 43f9 000b b5a0            lea.l      $000BB5A0,a1
[00024d10] 41ea 0016                 lea.l      22(a2),a0
[00024d14] 4eb9 0008 2f0c            jsr        strcpy
[00024d1a] 226d 002a                 movea.l    42(a5),a1
[00024d1e] 206a 0004                 movea.l    4(a2),a0
[00024d22] 4eb9 0008 2f0c            jsr        strcpy
[00024d28] 357c 0400 0038            move.w     #$0400,56(a2)
[00024d2e] 6002                      bra.s      part_add_27
part_add_24:
[00024d30] 95ca                      suba.l     a2,a2
part_add_27:
[00024d32] 206f 0004                 movea.l    4(a7),a0
[00024d36] 214a 001c                 move.l     a2,28(a0)
[00024d3a] 226f 0008                 movea.l    8(a7),a1
[00024d3e] 2357 0014                 move.l     (a7),20(a1)
[00024d42] 246b 0030                 movea.l    48(a3),a2
[00024d46] 396a 0006 0006            move.w     6(a2),6(a4)
[00024d4c] 246b 0030                 movea.l    48(a3),a2
[00024d50] 302a 000a                 move.w     10(a2),d0
[00024d54] 807c 2000                 or.w       #$2000,d0
[00024d58] 3940 000a                 move.w     d0,10(a4)
[00024d5c] 246b 0030                 movea.l    48(a3),a2
[00024d60] 296a 000c 000c            move.l     12(a2),12(a4)
[00024d66] 246b 0030                 movea.l    48(a3),a2
[00024d6a] 302a 0010                 move.w     16(a2),d0
[00024d6e] 3940 0010                 move.w     d0,16(a4)
[00024d72] 246f 0010                 movea.l    16(a7),a2
[00024d76] 3540 0010                 move.w     d0,16(a2)
[00024d7a] 2a6b 0030                 movea.l    48(a3),a5
[00024d7e] 322d 0012                 move.w     18(a5),d1
[00024d82] 3941 0012                 move.w     d1,18(a4)
[00024d86] 3541 0012                 move.w     d1,18(a2)
[00024d8a] 2a6b 0030                 movea.l    48(a3),a5
[00024d8e] 302d 0014                 move.w     20(a5),d0
[00024d92] 3940 0014                 move.w     d0,20(a4)
[00024d96] 3540 0014                 move.w     d0,20(a2)
[00024d9a] 2a6b 0030                 movea.l    48(a3),a5
[00024d9e] 322d 0016                 move.w     22(a5),d1
[00024da2] 3941 0016                 move.w     d1,22(a4)
[00024da6] 3541 0016                 move.w     d1,22(a2)
[00024daa] 026c ff7f 0008            andi.w     #$FF7F,8(a4)
[00024db0] 0c6c 0018 0006            cmpi.w     #$0018,6(a4)
[00024db6] 6614                      bne.s      part_add_28
[00024db8] 246c 000c                 movea.l    12(a4),a2
[00024dbc] 202a 0008                 move.l     8(a2),d0
[00024dc0] 670a                      beq.s      part_add_28
[00024dc2] 2a40                      movea.l    d0,a5
[00024dc4] 204c                      movea.l    a4,a0
[00024dc6] 7001                      moveq.l    #1,d0
[00024dc8] 93c9                      suba.l     a1,a1
[00024dca] 4e95                      jsr        (a5)
part_add_28:
[00024dcc] 2279 000e 692a            movea.l    _globl,a1
[00024dd2] 4240                      clr.w      d0
[00024dd4] 204c                      movea.l    a4,a0
[00024dd6] 4eb9 0007 bbd8            jsr        mt_rsrc_obfix
[00024ddc] 2279 000e 692a            movea.l    _globl,a1
[00024de2] 4240                      clr.w      d0
[00024de4] 206f 0010                 movea.l    16(a7),a0
[00024de8] 4eb9 0007 bbd8            jsr        mt_rsrc_obfix
[00024dee] 277c 000b b53a 0040       move.l     #uocall,64(a3)
[00024df6] 3039 000b b538            move.w     part_ucnt,d0
[00024dfc] e548                      lsl.w      #2,d0
[00024dfe] 41f9 0010 c37c            lea.l      part_list,a0
[00024e04] 218b 0000                 move.l     a3,0(a0,d0.w)
[00024e08] 5279 000b b538            addq.w     #1,part_ucnt
[00024e0e] 4240                      clr.w      d0
part_add_26:
[00024e10] 4fef 0018                 lea.l      24(a7),a7
[00024e14] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00024e18] 4e75                      rts

part_get:
[00024e1a] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00024e1e] 2648                      movea.l    a0,a3
[00024e20] 76ff                      moveq.l    #-1,d3
[00024e22] d679 000b b538            add.w      part_ucnt,d3
[00024e28] 45f9 0010 c37c            lea.l      part_list,a2
[00024e2e] 6020                      bra.s      part_get_1
part_get_4:
[00024e30] 3003                      move.w     d3,d0
[00024e32] e548                      lsl.w      #2,d0
[00024e34] 2272 0000                 movea.l    0(a2,d0.w),a1
[00024e38] 204b                      movea.l    a3,a0
[00024e3a] 4eb9 0008 2eba            jsr        strcmp
[00024e40] 4a40                      tst.w      d0
[00024e42] 660a                      bne.s      part_get_2
[00024e44] 3003                      move.w     d3,d0
[00024e46] e548                      lsl.w      #2,d0
[00024e48] 2072 0000                 movea.l    0(a2,d0.w),a0
[00024e4c] 6008                      bra.s      part_get_3
part_get_2:
[00024e4e] 5343                      subq.w     #1,d3
part_get_1:
[00024e50] 4a43                      tst.w      d3
[00024e52] 6adc                      bpl.s      part_get_4
[00024e54] 91c8                      suba.l     a0,a0
part_get_3:
[00024e56] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00024e5a] 4e75                      rts

part_make:
[00024e5c] 48e7 003c                 movem.l    a2-a5,-(a7)
[00024e60] 4fef fefa                 lea.l      -262(a7),a7
[00024e64] 95ca                      suba.l     a2,a2
[00024e66] 41f9 000b 9e7a            lea.l      WI_PARTS,a0
[00024e6c] 4eb9 0005 7052            jsr        Awi_create
[00024e72] 2648                      movea.l    a0,a3
[00024e74] 23c8 000b b542            move.l     a0,parts_window
[00024e7a] 200b                      move.l     a3,d0
[00024e7c] 6768                      beq.s      part_make_1
[00024e7e] 204b                      movea.l    a3,a0
[00024e80] 4eb9 0002 699c            jsr        init_boxed
[00024e86] 204b                      movea.l    a3,a0
[00024e88] 4eb9 0002 b650            jsr        init_title
[00024e8e] 204b                      movea.l    a3,a0
[00024e90] 4eb9 0002 a1b0            jsr        init_3Dbutton
[00024e96] 204b                      movea.l    a3,a0
[00024e98] 4eb9 0002 a948            jsr        init_check
[00024e9e] 204b                      movea.l    a3,a0
[00024ea0] 4eb9 0002 7e26            jsr        init_cycle
[00024ea6] 204b                      movea.l    a3,a0
[00024ea8] 4eb9 0002 74ea            jsr        init_slider
[00024eae] 204b                      movea.l    a3,a0
[00024eb0] 4eb9 0002 aca6            jsr        init_ftext
[00024eb6] 204b                      movea.l    a3,a0
[00024eb8] 4eb9 0002 9584            jsr        init_inner
[00024ebe] 204b                      movea.l    a3,a0
[00024ec0] 4eb9 0002 7a84            jsr        init_picture
[00024ec6] 204b                      movea.l    a3,a0
[00024ec8] 4eb9 0002 7476            jsr        init_editor
[00024ece] 204b                      movea.l    a3,a0
[00024ed0] 4eb9 0002 8e50            jsr        init_pattern
[00024ed6] 204b                      movea.l    a3,a0
[00024ed8] 4eb9 0002 88fe            jsr        init_arrow
[00024ede] 204b                      movea.l    a3,a0
[00024ee0] 4eb9 0002 740e            jsr        init_select
part_make_1:
[00024ee6] 49ef 0006                 lea.l      6(a7),a4
[00024eea] 2279 0010 ee4e            movea.l    ACSblk,a1
[00024ef0] 43e9 009e                 lea.l      158(a1),a1
[00024ef4] 204c                      movea.l    a4,a0
[00024ef6] 4eb9 0008 2f0c            jsr        strcpy
[00024efc] 0c14 0043                 cmpi.b     #$43,(a4)
[00024f00] 6c18                      bge.s      part_make_2
[00024f02] 4eb9 0008 0bd2            jsr        Dgetdrv
[00024f08] 4eb9 0008 0c48            jsr        Dsetdrv
[00024f0e] c0bc 0000 0004            and.l      #$00000004,d0
[00024f14] 6704                      beq.s      part_make_2
[00024f16] 18bc 0043                 move.b     #$43,(a4)
part_make_2:
[00024f1a] 705c                      moveq.l    #92,d0
[00024f1c] 204c                      movea.l    a4,a0
[00024f1e] 4eb9 0008 2e9e            jsr        strrchr
[00024f24] 2a48                      movea.l    a0,a5
[00024f26] 200d                      move.l     a5,d0
[00024f28] 670a                      beq.s      part_make_3
[00024f2a] 102d 0001                 move.b     1(a5),d0
[00024f2e] 6704                      beq.s      part_make_3
[00024f30] 422d 0001                 clr.b      1(a5)
part_make_3:
[00024f34] 204c                      movea.l    a4,a0
[00024f36] 4eb9 0004 bfa2            jsr        Af_readdir
[00024f3c] 2a48                      movea.l    a0,a5
[00024f3e] 244d                      movea.l    a5,a2
[00024f40] 200a                      move.l     a2,d0
[00024f42] 6740                      beq.s      part_make_4
[00024f44] 6032                      bra.s      part_make_5
part_make_7:
[00024f46] 43f9 000b b5ab            lea.l      $000BB5AB,a1
[00024f4c] 2f09                      move.l     a1,-(a7)
[00024f4e] 2255                      movea.l    (a5),a1
[00024f50] 41ef 0004                 lea.l      4(a7),a0
[00024f54] 4eb9 0004 b758            jsr        Af_2ext
[00024f5a] 4eb9 0008 3180            jsr        strupr
[00024f60] 225f                      movea.l    (a7)+,a1
[00024f62] 4eb9 0008 2eba            jsr        strcmp
[00024f68] 4a40                      tst.w      d0
[00024f6a] 6608                      bne.s      part_make_6
[00024f6c] 2055                      movea.l    (a5),a0
[00024f6e] 4eb9 0007 1408            jsr        Ash_module
part_make_6:
[00024f74] 2a6d 0004                 movea.l    4(a5),a5
part_make_5:
[00024f78] 200d                      move.l     a5,d0
[00024f7a] 66ca                      bne.s      part_make_7
[00024f7c] 204a                      movea.l    a2,a0
[00024f7e] 4eb9 0004 c0a6            jsr        Af_freedir
part_make_4:
[00024f84] 204b                      movea.l    a3,a0
[00024f86] 4fef 0106                 lea.l      262(a7),a7
[00024f8a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00024f8e] 4e75                      rts

part_close:
[00024f90] 2f0a                      move.l     a2,-(a7)
[00024f92] 2448                      movea.l    a0,a2
[00024f94] 006a 0100 0056            ori.w      #$0100,86(a2)
[00024f9a] 4eb9 0005 8362            jsr        Awi_closed
[00024fa0] 026a feff 0056            andi.w     #$FEFF,86(a2)
[00024fa6] 245f                      movea.l    (a7)+,a2
[00024fa8] 4e75                      rts

part_init:
[00024faa] 2f0a                      move.l     a2,-(a7)
[00024fac] 2f0b                      move.l     a3,-(a7)
[00024fae] 2448                      movea.l    a0,a2
[00024fb0] 006a 0010 0056            ori.w      #$0010,86(a2)
[00024fb6] 43ea 0024                 lea.l      36(a2),a1
[00024fba] 266a 0086                 movea.l    134(a2),a3
[00024fbe] 4e93                      jsr        (a3)
[00024fc0] 4240                      clr.w      d0
[00024fc2] 265f                      movea.l    (a7)+,a3
[00024fc4] 245f                      movea.l    (a7)+,a2
[00024fc6] 4e75                      rts

part_service:
[00024fc8] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00024fcc] 2448                      movea.l    a0,a2
[00024fce] 3600                      move.w     d0,d3
[00024fd0] 2649                      movea.l    a1,a3
[00024fd2] b07c 0024                 cmp.w      #$0024,d0
[00024fd6] 6742                      beq.s      part_service_1
[00024fd8] 6e12                      bgt.s      part_service_2
[00024fda] 5340                      subq.w     #1,d0
[00024fdc] 6762                      beq.s      part_service_3
[00024fde] 5340                      subq.w     #1,d0
[00024fe0] 671c                      beq.s      part_service_4
[00024fe2] 907c 000a                 sub.w      #$000A,d0
[00024fe6] 6738                      beq.s      part_service_5
[00024fe8] 6000 0072                 bra.w      part_service_6
part_service_2:
[00024fec] 907c 0025                 sub.w      #$0025,d0
[00024ff0] 6722                      beq.s      part_service_7
[00024ff2] 907c 2303                 sub.w      #$2303,d0
[00024ff6] 672c                      beq.s      part_service_8
[00024ff8] 5340                      subq.w     #1,d0
[00024ffa] 6736                      beq.s      part_service_9
[00024ffc] 605e                      bra.s      part_service_6
part_service_4:
[00024ffe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00025004] 3028 023a                 move.w     570(a0),d0
[00025008] 6760                      beq.s      part_service_10
[0002500a] 204a                      movea.l    a2,a0
[0002500c] 4eb9 0005 85f2            jsr        Awi_delete
[00025012] 6056                      bra.s      part_service_10
part_service_7:
[00025014] 42ab 0002                 clr.l      2(a3)
[00025018] 6050                      bra.s      part_service_10
part_service_1:
[0002501a] 36bc 0001                 move.w     #$0001,(a3)
[0002501e] 604a                      bra.s      part_service_10
part_service_5:
[00025020] 4253                      clr.w      (a3)
[00025022] 6046                      bra.s      part_service_10
part_service_8:
[00025024] 0c79 0028 000b b538       cmpi.w     #$0028,part_ucnt
[0002502c] 6c3c                      bge.s      part_service_10
[0002502e] 268a                      move.l     a2,(a3)
[00025030] 6038                      bra.s      part_service_10
part_service_9:
[00025032] 204b                      movea.l    a3,a0
[00025034] 6100 f8c0                 bsr        part_add
[00025038] 006a 0020 0056            ori.w      #$0020,86(a2)
[0002503e] 602a                      bra.s      part_service_10
part_service_3:
[00025040] 302a 0058                 move.w     88(a2),d0
[00025044] 6b24                      bmi.s      part_service_10
[00025046] 4eb9 0005 5e8c            jsr        Awi_root
[0002504c] 2848                      movea.l    a0,a4
[0002504e] 43ea 0058                 lea.l      88(a2),a1
[00025052] 7065                      moveq.l    #101,d0
[00025054] 2a6c 0004                 movea.l    4(a4),a5
[00025058] 4e95                      jsr        (a5)
[0002505a] 600e                      bra.s      part_service_10
part_service_6:
[0002505c] 224b                      movea.l    a3,a1
[0002505e] 3003                      move.w     d3,d0
[00025060] 204a                      movea.l    a2,a0
[00025062] 4eb9 0005 9dd0            jsr        Awi_service
[00025068] 6002                      bra.s      part_service_11
part_service_10:
[0002506a] 7001                      moveq.l    #1,d0
part_service_11:
[0002506c] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00025070] 4e75                      rts

glue_parts:
[00025072] 2f0a                      move.l     a2,-(a7)
[00025074] 2f0b                      move.l     a3,-(a7)
[00025076] 514f                      subq.w     #8,a7
[00025078] 2448                      movea.l    a0,a2
[0002507a] 3039 0008 4802            move.w     gluepart,d0
[00025080] 6700 0094                 beq        glue_parts_1
[00025084] 322a 0020                 move.w     32(a2),d1
[00025088] 6f00 008c                 ble        glue_parts_1
[0002508c] 47f9 000b b542            lea.l      parts_window,a3
[00025092] 2013                      move.l     (a3),d0
[00025094] 6700 0080                 beq        glue_parts_1
[00025098] 2040                      movea.l    d0,a0
[0002509a] 3228 0020                 move.w     32(a0),d1
[0002509e] 6f76                      ble.s      glue_parts_1
[000250a0] 3428 0056                 move.w     86(a0),d2
[000250a4] c47c 0800                 and.w      #$0800,d2
[000250a8] 666c                      bne.s      glue_parts_1
[000250aa] 4eb9 0004 b086            jsr        Aev_mess
[000250b0] 302a 0034                 move.w     52(a2),d0
[000250b4] 2053                      movea.l    (a3),a0
[000250b6] 3228 0028                 move.w     40(a0),d1
[000250ba] 3f41 0004                 move.w     d1,4(a7)
[000250be] 9041                      sub.w      d1,d0
[000250c0] 3e80                      move.w     d0,(a7)
[000250c2] 41f9 0010 ee4e            lea.l      ACSblk,a0
[000250c8] 302a 0036                 move.w     54(a2),d0
[000250cc] 2250                      movea.l    (a0),a1
[000250ce] 9069 0006                 sub.w      6(a1),d0
[000250d2] 3f40 0002                 move.w     d0,2(a7)
[000250d6] 2453                      movea.l    (a3),a2
[000250d8] 222a 005e                 move.l     94(a2),d1
[000250dc] 6708                      beq.s      glue_parts_2
[000250de] 3429 0014                 move.w     20(a1),d2
[000250e2] 956f 0002                 sub.w      d2,2(a7)
glue_parts_2:
[000250e6] 2250                      movea.l    (a0),a1
[000250e8] 3017                      move.w     (a7),d0
[000250ea] b069 0008                 cmp.w      8(a1),d0
[000250ee] 6c04                      bge.s      glue_parts_3
[000250f0] 3ea9 0008                 move.w     8(a1),(a7)
glue_parts_3:
[000250f4] 2250                      movea.l    (a0),a1
[000250f6] 302f 0002                 move.w     2(a7),d0
[000250fa] b069 000a                 cmp.w      10(a1),d0
[000250fe] 6c06                      bge.s      glue_parts_4
[00025100] 3f69 000a 0002            move.w     10(a1),2(a7)
glue_parts_4:
[00025106] 2053                      movea.l    (a3),a0
[00025108] 3f68 002a 0006            move.w     42(a0),6(a7)
[0002510e] 43d7                      lea.l      (a7),a1
[00025110] 2468 008a                 movea.l    138(a0),a2
[00025114] 4e92                      jsr        (a2)
glue_parts_1:
[00025116] 504f                      addq.w     #8,a7
[00025118] 265f                      movea.l    (a7)+,a3
[0002511a] 245f                      movea.l    (a7)+,a2
[0002511c] 4e75                      rts

go_detail:
[0002511e] 48e7 003c                 movem.l    a2-a5,-(a7)
[00025122] 5d4f                      subq.w     #6,a7
[00025124] 2848                      movea.l    a0,a4
[00025126] 45ef 0002                 lea.l      2(a7),a2
[0002512a] 4292                      clr.l      (a2)
[0002512c] 42a7                      clr.l      -(a7)
[0002512e] 42a7                      clr.l      -(a7)
[00025130] 42a7                      clr.l      -(a7)
[00025132] 486f 000c                 pea.l      12(a7)
[00025136] 720a                      moveq.l    #10,d1
[00025138] 4240                      clr.w      d0
[0002513a] 4eb9 0007 f7ba            jsr        wind_get
[00025140] 4fef 0010                 lea.l      16(a7),a7
[00025144] 3017                      move.w     (a7),d0
[00025146] 4eb9 0005 5e68            jsr        Awi_wid
[0002514c] 2648                      movea.l    a0,a3
[0002514e] 200b                      move.l     a3,d0
[00025150] 6730                      beq.s      go_detail_1
[00025152] 224a                      movea.l    a2,a1
[00025154] 2a6b 0004                 movea.l    4(a3),a5
[00025158] 303c 03f7                 move.w     #$03F7,d0
[0002515c] 4e95                      jsr        (a5)
[0002515e] 2012                      move.l     (a2),d0
[00025160] 6720                      beq.s      go_detail_1
[00025162] b7c0                      cmpa.l     d0,a3
[00025164] 661c                      bne.s      go_detail_1
[00025166] 41f9 0010 ee4e            lea.l      ACSblk,a0
[0002516c] 2250                      movea.l    (a0),a1
[0002516e] 3029 0246                 move.w     582(a1),d0
[00025172] 670e                      beq.s      go_detail_1
[00025174] 2669 0240                 movea.l    576(a1),a3
[00025178] b7d2                      cmpa.l     (a2),a3
[0002517a] 6606                      bne.s      go_detail_1
[0002517c] 2352 0258                 move.l     (a2),600(a1)
[00025180] 4e94                      jsr        (a4)
go_detail_1:
[00025182] 5c4f                      addq.w     #6,a7
[00025184] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00025188] 4e75                      rts

go_spec_edit:
[0002518a] 41f9 0002 f856            lea.l      edob_specs,a0
[00025190] 6100 ff8c                 bsr.w      go_detail
[00025194] 4e75                      rts

go_flag_edit:
[00025196] 41f9 0002 f708            lea.l      edob_aflags,a0
[0002519c] 6100 ff80                 bsr.w      go_detail
[000251a0] 4e75                      rts

go_ref_edit:
[000251a2] 41f9 0002 f420            lea.l      edob_refs,a0
[000251a8] 6100 ff74                 bsr        go_detail
[000251ac] 4e75                      rts

go_pos_edit:
[000251ae] 41f9 0003 05bc            lea.l      edob_pos,a0
[000251b4] 6100 ff68                 bsr        go_detail
[000251b8] 4e75                      rts

	.data

BUBBLE_01:
[000b7a98]                           dc.b 'Dieser Button ruft den Flag-Editor auf.',0
BUBBLE_02:
[000b7ac0]                           dc.b 'Dieser Button ruft den Objekt-Editor auf.',0
BUBBLE_03:
[000b7aea]                           dc.b 'Dieser Button ruft den Referenz-Editor auf.',0
BUBBLE_04:
[000b7b16]                           dc.b 'Dieser Button ruft den Positions-Editor auf.',0
STGUIDE_01:
[000b7b43]                           dc.b 'Das Teile-Fenster',0
TEMPLATE_001:
[000b7b55]                           dc.b 'EDIT:____',0
TEXT_002:
[000b7b5f]                           dc.b $00
TEXT_02:
[000b7b60]                           dc.b ' Teilefenster ',0
TEXT_024:
[000b7b6f]                           dc.b 'abc',0
TEXT_030:
[000b7b73]                           dc.b 'TEXT',0
TEXT_038:
[000b7b78]                           dc.b 'STRING',0
TEXT_039:
[000b7b7f]                           dc.b 'BUTTON',0
TEXT_040:
[000b7b86]                           dc.b 'TITLE',0
TEXT_065:
[000b7b8c]                           dc.b 'ICON',0
TEXT_258:
[000b7b91]                           dc.b 'USERDEF',0
VALID_001:
[000b7b99]                           dc.b 'XXXX',0
DATAS_01:
[000b7b9e]                           dc.w $0000
[000b7ba0]                           dc.w $0000
[000b7ba2]                           dc.w $0208
[000b7ba4]                           dc.w $0001
[000b7ba6]                           dc.w $0000
[000b7ba8]                           dc.w $0003
[000b7baa]                           dc.w $8000
[000b7bac]                           dc.w $0006
[000b7bae]                           dc.w $c000
[000b7bb0]                           dc.w $0000
[000b7bb2]                           dc.w $0200
[000b7bb4]                           dc.w $0000
[000b7bb6]                           dc.w $0600
[000b7bb8]                           dc.w $07ff
[000b7bba]                           dc.w $fe00
[000b7bbc]                           dc.w $07ff
[000b7bbe]                           dc.w $fe00
[000b7bc0]                           dc.w $07ff
[000b7bc2]                           dc.w $fe00
[000b7bc4]                           dc.w $07ff
[000b7bc6]                           dc.w $ff00
[000b7bc8]                           dc.w $07ff
[000b7bca]                           dc.w $ff80
[000b7bcc]                           dc.w $07ff
[000b7bce]                           dc.w $fec0
[000b7bd0]                           dc.w $07ff
[000b7bd2]                           dc.w $fe60
[000b7bd4]                           dc.w $07ff
[000b7bd6]                           dc.w $fe30
[000b7bd8]                           dc.w $2fff
[000b7bda]                           dc.w $fe18
[000b7bdc]                           dc.w $7fff
[000b7bde]                           dc.w $fe0c
[000b7be0]                           dc.w $c000
[000b7be2]                           dc.w $c906
[000b7be4]                           dc.w $6200
[000b7be6]                           dc.w $920c
[000b7be8]                           dc.w $3101
[000b7bea]                           dc.w $f418
[000b7bec]                           dc.w $1886
[000b7bee]                           dc.w $ac04
[000b7bf0]                           dc.w $0c4d
[000b7bf2]                           dc.w $f404
[000b7bf4]                           dc.w $062a
[000b7bf6]                           dc.w $3804
[000b7bf8]                           dc.w $031f
[000b7bfa]                           dc.w $fc04
[000b7bfc]                           dc.w $018b
[000b7bfe]                           dc.w $e804
[000b7c00]                           dc.w $00c5
[000b7c02]                           dc.w $5404
[000b7c04]                           dc.w $0063
[000b7c06]                           dc.w $a804
[000b7c08]                           dc.w $0031
[000b7c0a]                           dc.w $fc04
[000b7c0c]                           dc.w $0018
[000b7c0e]                           dc.w $0c04
[000b7c10]                           dc.w $000c
[000b7c12]                           dc.w $1bf8
[000b7c14]                           dc.w $0006
[000b7c16]                           dc.w $3000
[000b7c18]                           dc.w $0003
[000b7c1a]                           dc.w $6000
[000b7c1c]                           dc.w $0001
[000b7c1e]                           dc.w $c000
[000b7c20]                           dc.w $0000
[000b7c22]                           dc.w $8000
[000b7c24]                           dc.w $0001
[000b7c26]                           dc.w $0000
[000b7c28]                           dc.w $0003
[000b7c2a]                           dc.w $8000
[000b7c2c]                           dc.w $0006
[000b7c2e]                           dc.w $c000
[000b7c30]                           dc.w $0000
[000b7c32]                           dc.w $0200
[000b7c34]                           dc.w $0000
[000b7c36]                           dc.w $0600
[000b7c38]                           dc.w $07ff
[000b7c3a]                           dc.w $fe00
[000b7c3c]                           dc.w $071d
[000b7c3e]                           dc.w $de00
[000b7c40]                           dc.w $06ed
[000b7c42]                           dc.w $be00
[000b7c44]                           dc.w $06ed
[000b7c46]                           dc.w $7f00
[000b7c48]                           dc.w $06ec
[000b7c4a]                           dc.w $7f80
[000b7c4c]                           dc.w $06ed
[000b7c4e]                           dc.w $bec0
[000b7c50]                           dc.w $071d
[000b7c52]                           dc.w $de60
[000b7c54]                           dc.w $07ff
[000b7c56]                           dc.w $fe30
[000b7c58]                           dc.w $2fff
[000b7c5a]                           dc.w $fe18
[000b7c5c]                           dc.w $7fff
[000b7c5e]                           dc.w $fe0c
[000b7c60]                           dc.w $c000
[000b7c62]                           dc.w $c906
[000b7c64]                           dc.w $6200
[000b7c66]                           dc.w $920c
[000b7c68]                           dc.w $3101
[000b7c6a]                           dc.w $f418
[000b7c6c]                           dc.w $1886
[000b7c6e]                           dc.w $ac04
[000b7c70]                           dc.w $0c4d
[000b7c72]                           dc.w $f404
[000b7c74]                           dc.w $062a
[000b7c76]                           dc.w $3804
[000b7c78]                           dc.w $031f
[000b7c7a]                           dc.w $fc04
[000b7c7c]                           dc.w $018b
[000b7c7e]                           dc.w $e804
[000b7c80]                           dc.w $00c5
[000b7c82]                           dc.w $5404
[000b7c84]                           dc.w $0063
[000b7c86]                           dc.w $a804
[000b7c88]                           dc.w $0031
[000b7c8a]                           dc.w $fc04
[000b7c8c]                           dc.w $0018
[000b7c8e]                           dc.w $0c04
[000b7c90]                           dc.w $000c
[000b7c92]                           dc.w $1bf8
[000b7c94]                           dc.w $0006
[000b7c96]                           dc.w $3000
[000b7c98]                           dc.w $0003
[000b7c9a]                           dc.w $6000
[000b7c9c]                           dc.w $0001
[000b7c9e]                           dc.w $c000
[000b7ca0]                           dc.w $0000
[000b7ca2]                           dc.w $8000
[000b7ca4]                           dc.w $0001
[000b7ca6]                           dc.w $0000
[000b7ca8]                           dc.w $0003
[000b7caa]                           dc.w $8000
[000b7cac]                           dc.w $0006
[000b7cae]                           dc.w $c000
[000b7cb0]                           dc.w $0000
[000b7cb2]                           dc.w $0200
[000b7cb4]                           dc.w $0000
[000b7cb6]                           dc.w $0600
[000b7cb8]                           dc.w $07ff
[000b7cba]                           dc.w $fe00
[000b7cbc]                           dc.w $071d
[000b7cbe]                           dc.w $de00
[000b7cc0]                           dc.w $06ed
[000b7cc2]                           dc.w $be00
[000b7cc4]                           dc.w $06ed
[000b7cc6]                           dc.w $7f00
[000b7cc8]                           dc.w $06ec
[000b7cca]                           dc.w $7f80
[000b7ccc]                           dc.w $06ed
[000b7cce]                           dc.w $bec0
[000b7cd0]                           dc.w $071d
[000b7cd2]                           dc.w $de60
[000b7cd4]                           dc.w $07ff
[000b7cd6]                           dc.w $fe30
[000b7cd8]                           dc.w $2fff
[000b7cda]                           dc.w $fe18
[000b7cdc]                           dc.w $7fff
[000b7cde]                           dc.w $fe0c
[000b7ce0]                           dc.w $c000
[000b7ce2]                           dc.w $c906
[000b7ce4]                           dc.w $6200
[000b7ce6]                           dc.w $920c
[000b7ce8]                           dc.w $3101
[000b7cea]                           dc.w $f418
[000b7cec]                           dc.w $1886
[000b7cee]                           dc.w $0ffc
[000b7cf0]                           dc.w $0c4d
[000b7cf2]                           dc.w $e7fc
[000b7cf4]                           dc.w $062a
[000b7cf6]                           dc.w $33fc
[000b7cf8]                           dc.w $031f
[000b7cfa]                           dc.w $fbfc
[000b7cfc]                           dc.w $0189
[000b7cfe]                           dc.w $e3fc
[000b7d00]                           dc.w $00c4
[000b7d02]                           dc.w $03fc
[000b7d04]                           dc.w $0063
[000b7d06]                           dc.w $03fc
[000b7d08]                           dc.w $0031
[000b7d0a]                           dc.w $fffc
[000b7d0c]                           dc.w $0018
[000b7d0e]                           dc.w $0ffc
[000b7d10]                           dc.w $000c
[000b7d12]                           dc.w $1bf8
[000b7d14]                           dc.w $0006
[000b7d16]                           dc.w $3000
[000b7d18]                           dc.w $0003
[000b7d1a]                           dc.w $6000
[000b7d1c]                           dc.w $0001
[000b7d1e]                           dc.w $c000
[000b7d20]                           dc.w $0000
[000b7d22]                           dc.w $8000
[000b7d24]                           dc.w $0000
[000b7d26]                           dc.w $0000
[000b7d28]                           dc.w $0001
[000b7d2a]                           dc.w $0000
[000b7d2c]                           dc.w $0002
[000b7d2e]                           dc.w $8000
[000b7d30]                           dc.w $1fff
[000b7d32]                           dc.w $fe00
[000b7d34]                           dc.w $1fff
[000b7d36]                           dc.w $fe00
[000b7d38]                           dc.w $1800
[000b7d3a]                           dc.w $0600
[000b7d3c]                           dc.w $1800
[000b7d3e]                           dc.w $0600
[000b7d40]                           dc.w $1800
[000b7d42]                           dc.w $0600
[000b7d44]                           dc.w $1800
[000b7d46]                           dc.w $0600
[000b7d48]                           dc.w $1800
[000b7d4a]                           dc.w $0700
[000b7d4c]                           dc.w $1800
[000b7d4e]                           dc.w $0680
[000b7d50]                           dc.w $1800
[000b7d52]                           dc.w $0640
[000b7d54]                           dc.w $1800
[000b7d56]                           dc.w $0620
[000b7d58]                           dc.w $1fff
[000b7d5a]                           dc.w $fe10
[000b7d5c]                           dc.w $3fff
[000b7d5e]                           dc.w $fe08
[000b7d60]                           dc.w $4000
[000b7d62]                           dc.w $c904
[000b7d64]                           dc.w $2200
[000b7d66]                           dc.w $9208
[000b7d68]                           dc.w $1101
[000b7d6a]                           dc.w $f410
[000b7d6c]                           dc.w $0886
[000b7d6e]                           dc.w $0c00
[000b7d70]                           dc.w $044d
[000b7d72]                           dc.w $e400
[000b7d74]                           dc.w $022a
[000b7d76]                           dc.w $3000
[000b7d78]                           dc.w $011f
[000b7d7a]                           dc.w $f800
[000b7d7c]                           dc.w $0089
[000b7d7e]                           dc.w $e000
[000b7d80]                           dc.w $0044
[000b7d82]                           dc.w $0000
[000b7d84]                           dc.w $0023
[000b7d86]                           dc.w $0000
[000b7d88]                           dc.w $0011
[000b7d8a]                           dc.w $fc00
[000b7d8c]                           dc.w $0008
[000b7d8e]                           dc.w $0800
[000b7d90]                           dc.w $0004
[000b7d92]                           dc.w $1000
[000b7d94]                           dc.w $0002
[000b7d96]                           dc.w $2000
[000b7d98]                           dc.w $0001
[000b7d9a]                           dc.w $4000
[000b7d9c]                           dc.w $0000
[000b7d9e]                           dc.w $8000
[000b7da0]                           dc.w $0000
[000b7da2]                           dc.w $0000
DATAS_02:
[000b7da4]                           dc.w $0001
[000b7da6]                           dc.w $0000
[000b7da8]                           dc.w $0003
[000b7daa]                           dc.w $8000
[000b7dac]                           dc.w $0007
[000b7dae]                           dc.w $c000
[000b7db0]                           dc.w $1fff
[000b7db2]                           dc.w $fe00
[000b7db4]                           dc.w $1fff
[000b7db6]                           dc.w $fe00
[000b7db8]                           dc.w $1fff
[000b7dba]                           dc.w $fe00
[000b7dbc]                           dc.w $1fff
[000b7dbe]                           dc.w $fe00
[000b7dc0]                           dc.w $1fff
[000b7dc2]                           dc.w $fe00
[000b7dc4]                           dc.w $1fff
[000b7dc6]                           dc.w $ff00
[000b7dc8]                           dc.w $1fff
[000b7dca]                           dc.w $ff80
[000b7dcc]                           dc.w $1fff
[000b7dce]                           dc.w $ffc0
[000b7dd0]                           dc.w $1fff
[000b7dd2]                           dc.w $ffe0
[000b7dd4]                           dc.w $1fff
[000b7dd6]                           dc.w $fff0
[000b7dd8]                           dc.w $3fff
[000b7dda]                           dc.w $fff8
[000b7ddc]                           dc.w $7fff
[000b7dde]                           dc.w $fffc
[000b7de0]                           dc.w $ffff
[000b7de2]                           dc.w $fffe
[000b7de4]                           dc.w $7fff
[000b7de6]                           dc.w $fffc
[000b7de8]                           dc.w $3fff
[000b7dea]                           dc.w $fff8
[000b7dec]                           dc.w $1fff
[000b7dee]                           dc.w $fffc
[000b7df0]                           dc.w $0fff
[000b7df2]                           dc.w $fffc
[000b7df4]                           dc.w $07ff
[000b7df6]                           dc.w $fffc
[000b7df8]                           dc.w $03ff
[000b7dfa]                           dc.w $fffc
[000b7dfc]                           dc.w $01ff
[000b7dfe]                           dc.w $fffc
[000b7e00]                           dc.w $00ff
[000b7e02]                           dc.w $fffc
[000b7e04]                           dc.w $007f
[000b7e06]                           dc.w $fffc
[000b7e08]                           dc.w $003f
[000b7e0a]                           dc.w $fffc
[000b7e0c]                           dc.w $001f
[000b7e0e]                           dc.w $fffc
[000b7e10]                           dc.w $000f
[000b7e12]                           dc.w $fbf8
[000b7e14]                           dc.w $0007
[000b7e16]                           dc.w $f000
[000b7e18]                           dc.w $0003
[000b7e1a]                           dc.w $e000
[000b7e1c]                           dc.w $0001
[000b7e1e]                           dc.w $c000
[000b7e20]                           dc.w $0000
[000b7e22]                           dc.w $8000
DATAS_03:
[000b7e24]                           dc.w $0000
[000b7e26]                           dc.w $0000
[000b7e28]                           dc.w $0208
[000b7e2a]                           dc.w $ffff
[000b7e2c]                           dc.w $ffff
[000b7e2e]                           dc.w $ffff
[000b7e30]                           dc.w $ffff
[000b7e32]                           dc.w $ffff
[000b7e34]                           dc.w $ffff
[000b7e36]                           dc.w $ffff
[000b7e38]                           dc.w $ffff
[000b7e3a]                           dc.w $ffff
[000b7e3c]                           dc.w $ffff
[000b7e3e]                           dc.w $ffff
[000b7e40]                           dc.w $ffff
[000b7e42]                           dc.w $ffff
[000b7e44]                           dc.w $ffff
[000b7e46]                           dc.w $fc00
[000b7e48]                           dc.w $007f
[000b7e4a]                           dc.w $fc00
[000b7e4c]                           dc.w $00ff
[000b7e4e]                           dc.w $fcff
[000b7e50]                           dc.w $ffff
[000b7e52]                           dc.w $fcff
[000b7e54]                           dc.w $ffff
[000b7e56]                           dc.w $fcff
[000b7e58]                           dc.w $ffff
[000b7e5a]                           dc.w $fcff
[000b7e5c]                           dc.w $ffff
[000b7e5e]                           dc.w $fcff
[000b7e60]                           dc.w $ffff
[000b7e62]                           dc.w $fcff
[000b7e64]                           dc.w $ffff
[000b7e66]                           dc.w $fcff
[000b7e68]                           dc.w $ffff
[000b7e6a]                           dc.w $fcff
[000b7e6c]                           dc.w $ffff
[000b7e6e]                           dc.w $fdff
[000b7e70]                           dc.w $ffff
[000b7e72]                           dc.w $ffff
[000b7e74]                           dc.w $ffff
[000b7e76]                           dc.w $ffff
[000b7e78]                           dc.w $ffff
[000b7e7a]                           dc.w $ffff
[000b7e7c]                           dc.w $ffff
[000b7e7e]                           dc.w $ffff
[000b7e80]                           dc.w $ffff
[000b7e82]                           dc.w $ffff
[000b7e84]                           dc.w $ffff
[000b7e86]                           dc.w $ffff
[000b7e88]                           dc.w $ffff
[000b7e8a]                           dc.w $ffff
[000b7e8c]                           dc.w $ffff
[000b7e8e]                           dc.w $faaa
[000b7e90]                           dc.w $aaaf
[000b7e92]                           dc.w $f888
[000b7e94]                           dc.w $888f
[000b7e96]                           dc.w $f800
[000b7e98]                           dc.w $000f
[000b7e9a]                           dc.w $ffff
[000b7e9c]                           dc.w $ffff
[000b7e9e]                           dc.w $ffff
[000b7ea0]                           dc.w $ffff
[000b7ea2]                           dc.w $ffff
[000b7ea4]                           dc.w $ffff
[000b7ea6]                           dc.w $ffff
[000b7ea8]                           dc.w $ffff
[000b7eaa]                           dc.w $ffff
[000b7eac]                           dc.w $ffff
[000b7eae]                           dc.w $ffff
[000b7eb0]                           dc.w $ffff
[000b7eb2]                           dc.w $ffff
[000b7eb4]                           dc.w $ffff
[000b7eb6]                           dc.w $ffff
[000b7eb8]                           dc.w $ffff
[000b7eba]                           dc.w $ffff
[000b7ebc]                           dc.w $ffff
[000b7ebe]                           dc.w $ffff
[000b7ec0]                           dc.w $ffff
[000b7ec2]                           dc.w $ffff
[000b7ec4]                           dc.w $ffff
[000b7ec6]                           dc.w $fc00
[000b7ec8]                           dc.w $007f
[000b7eca]                           dc.w $fc00
[000b7ecc]                           dc.w $00ff
[000b7ece]                           dc.w $fcff
[000b7ed0]                           dc.w $ffff
[000b7ed2]                           dc.w $fce3
[000b7ed4]                           dc.w $bbff
[000b7ed6]                           dc.w $fcdd
[000b7ed8]                           dc.w $b7ff
[000b7eda]                           dc.w $fcdd
[000b7edc]                           dc.w $afff
[000b7ede]                           dc.w $fcdd
[000b7ee0]                           dc.w $8fff
[000b7ee2]                           dc.w $fcdd
[000b7ee4]                           dc.w $b7ff
[000b7ee6]                           dc.w $fce3
[000b7ee8]                           dc.w $bbff
[000b7eea]                           dc.w $fcff
[000b7eec]                           dc.w $ffff
[000b7eee]                           dc.w $fdff
[000b7ef0]                           dc.w $ffff
[000b7ef2]                           dc.w $ffff
[000b7ef4]                           dc.w $ffff
[000b7ef6]                           dc.w $ffff
[000b7ef8]                           dc.w $ffff
[000b7efa]                           dc.w $ffff
[000b7efc]                           dc.w $ffff
[000b7efe]                           dc.w $ffff
[000b7f00]                           dc.w $ffff
[000b7f02]                           dc.w $ffff
[000b7f04]                           dc.w $ffff
[000b7f06]                           dc.w $ffff
[000b7f08]                           dc.w $ffff
[000b7f0a]                           dc.w $ffff
[000b7f0c]                           dc.w $ffff
[000b7f0e]                           dc.w $faaa
[000b7f10]                           dc.w $aaaf
[000b7f12]                           dc.w $f888
[000b7f14]                           dc.w $888f
[000b7f16]                           dc.w $f800
[000b7f18]                           dc.w $000f
[000b7f1a]                           dc.w $ffff
[000b7f1c]                           dc.w $ffff
[000b7f1e]                           dc.w $ffff
[000b7f20]                           dc.w $ffff
[000b7f22]                           dc.w $ffff
[000b7f24]                           dc.w $ffff
[000b7f26]                           dc.w $ffff
[000b7f28]                           dc.w $ffff
[000b7f2a]                           dc.w $ffff
[000b7f2c]                           dc.w $ffff
[000b7f2e]                           dc.w $ffff
[000b7f30]                           dc.w $ffff
[000b7f32]                           dc.w $ffff
[000b7f34]                           dc.w $ffff
[000b7f36]                           dc.w $ffff
[000b7f38]                           dc.w $ffff
[000b7f3a]                           dc.w $ffff
[000b7f3c]                           dc.w $ffff
[000b7f3e]                           dc.w $ffff
[000b7f40]                           dc.w $ffff
[000b7f42]                           dc.w $ffff
[000b7f44]                           dc.w $ffff
[000b7f46]                           dc.w $fc00
[000b7f48]                           dc.w $007f
[000b7f4a]                           dc.w $fc00
[000b7f4c]                           dc.w $00ff
[000b7f4e]                           dc.w $fcff
[000b7f50]                           dc.w $ffff
[000b7f52]                           dc.w $fce3
[000b7f54]                           dc.w $bbff
[000b7f56]                           dc.w $fcdd
[000b7f58]                           dc.w $b7ff
[000b7f5a]                           dc.w $fcdd
[000b7f5c]                           dc.w $afff
[000b7f5e]                           dc.w $fcdd
[000b7f60]                           dc.w $8fff
[000b7f62]                           dc.w $fcdd
[000b7f64]                           dc.w $b7ff
[000b7f66]                           dc.w $fce3
[000b7f68]                           dc.w $bbff
[000b7f6a]                           dc.w $fcff
[000b7f6c]                           dc.w $ffff
[000b7f6e]                           dc.w $fdff
[000b7f70]                           dc.w $ffff
[000b7f72]                           dc.w $ffff
[000b7f74]                           dc.w $ffff
[000b7f76]                           dc.w $ffff
[000b7f78]                           dc.w $ffff
[000b7f7a]                           dc.w $ffff
[000b7f7c]                           dc.w $ffff
[000b7f7e]                           dc.w $ffff
[000b7f80]                           dc.w $ffff
[000b7f82]                           dc.w $ffff
[000b7f84]                           dc.w $ffff
[000b7f86]                           dc.w $ffff
[000b7f88]                           dc.w $ffff
[000b7f8a]                           dc.w $ffff
[000b7f8c]                           dc.w $ffff
[000b7f8e]                           dc.w $faaa
[000b7f90]                           dc.w $aaaf
[000b7f92]                           dc.w $f888
[000b7f94]                           dc.w $888f
[000b7f96]                           dc.w $f800
[000b7f98]                           dc.w $000f
[000b7f9a]                           dc.w $ffff
[000b7f9c]                           dc.w $ffff
[000b7f9e]                           dc.w $ffff
[000b7fa0]                           dc.w $ffff
[000b7fa2]                           dc.w $ffff
[000b7fa4]                           dc.w $ffff
[000b7fa6]                           dc.w $ffff
[000b7fa8]                           dc.w $ffff
[000b7faa]                           dc.w $0000
[000b7fac]                           dc.w $0000
[000b7fae]                           dc.w $0000
[000b7fb0]                           dc.w $0000
[000b7fb2]                           dc.w $0000
[000b7fb4]                           dc.w $0000
[000b7fb6]                           dc.w $0800
[000b7fb8]                           dc.w $0000
[000b7fba]                           dc.w $1c00
[000b7fbc]                           dc.w $0000
[000b7fbe]                           dc.w $3e00
[000b7fc0]                           dc.w $0000
[000b7fc2]                           dc.w $0800
[000b7fc4]                           dc.w $0000
[000b7fc6]                           dc.w $0bff
[000b7fc8]                           dc.w $ffc0
[000b7fca]                           dc.w $0bff
[000b7fcc]                           dc.w $ffc0
[000b7fce]                           dc.w $0b00
[000b7fd0]                           dc.w $00c0
[000b7fd2]                           dc.w $0b00
[000b7fd4]                           dc.w $00c0
[000b7fd6]                           dc.w $0b00
[000b7fd8]                           dc.w $00c0
[000b7fda]                           dc.w $0b00
[000b7fdc]                           dc.w $00c0
[000b7fde]                           dc.w $0b00
[000b7fe0]                           dc.w $00c0
[000b7fe2]                           dc.w $0b00
[000b7fe4]                           dc.w $00c0
[000b7fe6]                           dc.w $0b00
[000b7fe8]                           dc.w $00c0
[000b7fea]                           dc.w $0b00
[000b7fec]                           dc.w $00c0
[000b7fee]                           dc.w $0bff
[000b7ff0]                           dc.w $ffc0
[000b7ff2]                           dc.w $0bff
[000b7ff4]                           dc.w $ffd0
[000b7ff6]                           dc.w $0800
[000b7ff8]                           dc.w $0018
[000b7ffa]                           dc.w $3fff
[000b7ffc]                           dc.w $fffc
[000b7ffe]                           dc.w $0800
[000b8000]                           dc.w $0018
[000b8002]                           dc.w $0800
[000b8004]                           dc.w $0010
[000b8006]                           dc.w $0000
[000b8008]                           dc.w $0000
[000b800a]                           dc.w $0fff
[000b800c]                           dc.w $fff8
[000b800e]                           dc.w $0aaa
[000b8010]                           dc.w $aaa8
[000b8012]                           dc.w $0888
[000b8014]                           dc.w $8888
[000b8016]                           dc.w $0800
[000b8018]                           dc.w $0008
[000b801a]                           dc.w $0fff
[000b801c]                           dc.w $fff8
[000b801e]                           dc.w $0000
[000b8020]                           dc.w $0000
[000b8022]                           dc.w $0000
[000b8024]                           dc.w $0000
[000b8026]                           dc.w $0000
[000b8028]                           dc.w $0000
DATAS_04:
[000b802a]                           dc.w $ffff
[000b802c]                           dc.w $ffff
[000b802e]                           dc.w $ffff
[000b8030]                           dc.w $ffff
[000b8032]                           dc.w $ffff
[000b8034]                           dc.w $ffff
[000b8036]                           dc.w $ffff
[000b8038]                           dc.w $ffff
[000b803a]                           dc.w $ffff
[000b803c]                           dc.w $ffff
[000b803e]                           dc.w $ffff
[000b8040]                           dc.w $ffff
[000b8042]                           dc.w $ffff
[000b8044]                           dc.w $ffff
[000b8046]                           dc.w $ffff
[000b8048]                           dc.w $ffff
[000b804a]                           dc.w $ffff
[000b804c]                           dc.w $ffff
[000b804e]                           dc.w $ffff
[000b8050]                           dc.w $ffff
[000b8052]                           dc.w $ffff
[000b8054]                           dc.w $ffff
[000b8056]                           dc.w $ffff
[000b8058]                           dc.w $ffff
[000b805a]                           dc.w $ffff
[000b805c]                           dc.w $ffff
[000b805e]                           dc.w $ffff
[000b8060]                           dc.w $ffff
[000b8062]                           dc.w $ffff
[000b8064]                           dc.w $ffff
[000b8066]                           dc.w $ffff
[000b8068]                           dc.w $ffff
[000b806a]                           dc.w $ffff
[000b806c]                           dc.w $ffff
[000b806e]                           dc.w $ffff
[000b8070]                           dc.w $ffff
[000b8072]                           dc.w $ffff
[000b8074]                           dc.w $ffff
[000b8076]                           dc.w $ffff
[000b8078]                           dc.w $ffff
[000b807a]                           dc.w $ffff
[000b807c]                           dc.w $ffff
[000b807e]                           dc.w $ffff
[000b8080]                           dc.w $ffff
[000b8082]                           dc.w $ffff
[000b8084]                           dc.w $ffff
[000b8086]                           dc.w $ffff
[000b8088]                           dc.w $ffff
[000b808a]                           dc.w $ffff
[000b808c]                           dc.w $ffff
[000b808e]                           dc.w $ffff
[000b8090]                           dc.w $ffff
[000b8092]                           dc.w $ffff
[000b8094]                           dc.w $ffff
[000b8096]                           dc.w $ffff
[000b8098]                           dc.w $ffff
[000b809a]                           dc.w $ffff
[000b809c]                           dc.w $ffff
[000b809e]                           dc.w $ffff
[000b80a0]                           dc.w $ffff
[000b80a2]                           dc.w $ffff
[000b80a4]                           dc.w $ffff
[000b80a6]                           dc.w $ffff
[000b80a8]                           dc.w $ffff
DATAS_05:
[000b80aa]                           dc.w $0000
[000b80ac]                           dc.w $0000
[000b80ae]                           dc.w $0208
[000b80b0]                           dc.w $ffff
[000b80b2]                           dc.w $ffff
[000b80b4]                           dc.w $ffff
[000b80b6]                           dc.w $ffff
[000b80b8]                           dc.w $ffff
[000b80ba]                           dc.w $ffff
[000b80bc]                           dc.w $e000
[000b80be]                           dc.w $03ff
[000b80c0]                           dc.w $e000
[000b80c2]                           dc.w $077f
[000b80c4]                           dc.w $e7ff
[000b80c6]                           dc.w $ffef
[000b80c8]                           dc.w $e7ff
[000b80ca]                           dc.w $ff3f
[000b80cc]                           dc.w $e7ff
[000b80ce]                           dc.w $fef7
[000b80d0]                           dc.w $e7ff
[000b80d2]                           dc.w $fcff
[000b80d4]                           dc.w $e7ff
[000b80d6]                           dc.w $f87f
[000b80d8]                           dc.w $e7ff
[000b80da]                           dc.w $f0ef
[000b80dc]                           dc.w $e7ff
[000b80de]                           dc.w $e1ff
[000b80e0]                           dc.w $e7ff
[000b80e2]                           dc.w $d3ff
[000b80e4]                           dc.w $efff
[000b80e6]                           dc.w $bfff
[000b80e8]                           dc.w $ffff
[000b80ea]                           dc.w $3fff
[000b80ec]                           dc.w $fffe
[000b80ee]                           dc.w $1fff
[000b80f0]                           dc.w $fffc
[000b80f2]                           dc.w $3fff
[000b80f4]                           dc.w $fff8
[000b80f6]                           dc.w $7fff
[000b80f8]                           dc.w $fff4
[000b80fa]                           dc.w $ffff
[000b80fc]                           dc.w $ffef
[000b80fe]                           dc.w $ffff
[000b8100]                           dc.w $ffcf
[000b8102]                           dc.w $ffff
[000b8104]                           dc.w $ff87
[000b8106]                           dc.w $ffff
[000b8108]                           dc.w $fb0f
[000b810a]                           dc.w $ffff
[000b810c]                           dc.w $fe1f
[000b810e]                           dc.w $ffff
[000b8110]                           dc.w $fd3f
[000b8112]                           dc.w $ffff
[000b8114]                           dc.w $ebff
[000b8116]                           dc.w $ffff
[000b8118]                           dc.w $fbef
[000b811a]                           dc.w $ffff
[000b811c]                           dc.w $ffff
[000b811e]                           dc.w $ffff
[000b8120]                           dc.w $f77f
[000b8122]                           dc.w $ffff
[000b8124]                           dc.w $ffff
[000b8126]                           dc.w $ffff
[000b8128]                           dc.w $ffff
[000b812a]                           dc.w $ffff
[000b812c]                           dc.w $ffff
[000b812e]                           dc.w $ffff
[000b8130]                           dc.w $ffff
[000b8132]                           dc.w $ffff
[000b8134]                           dc.w $ffff
[000b8136]                           dc.w $ffff
[000b8138]                           dc.w $ffff
[000b813a]                           dc.w $ffff
[000b813c]                           dc.w $e000
[000b813e]                           dc.w $03ff
[000b8140]                           dc.w $e000
[000b8142]                           dc.w $077f
[000b8144]                           dc.w $e7ff
[000b8146]                           dc.w $ffef
[000b8148]                           dc.w $e71d
[000b814a]                           dc.w $df3f
[000b814c]                           dc.w $e6ed
[000b814e]                           dc.w $be37
[000b8150]                           dc.w $e6ed
[000b8152]                           dc.w $7d3f
[000b8154]                           dc.w $e6ec
[000b8156]                           dc.w $7bff
[000b8158]                           dc.w $e6ed
[000b815a]                           dc.w $b3ef
[000b815c]                           dc.w $e71d
[000b815e]                           dc.w $e1ff
[000b8160]                           dc.w $e7ff
[000b8162]                           dc.w $c3ff
[000b8164]                           dc.w $efff
[000b8166]                           dc.w $87ff
[000b8168]                           dc.w $ffff
[000b816a]                           dc.w $4fff
[000b816c]                           dc.w $fffe
[000b816e]                           dc.w $ffff
[000b8170]                           dc.w $fffc
[000b8172]                           dc.w $ffff
[000b8174]                           dc.w $fff8
[000b8176]                           dc.w $7fff
[000b8178]                           dc.w $fff0
[000b817a]                           dc.w $ffff
[000b817c]                           dc.w $ffe1
[000b817e]                           dc.w $ffff
[000b8180]                           dc.w $ffd3
[000b8182]                           dc.w $ffff
[000b8184]                           dc.w $ffbf
[000b8186]                           dc.w $ffff
[000b8188]                           dc.w $fb3f
[000b818a]                           dc.w $ffff
[000b818c]                           dc.w $fe1f
[000b818e]                           dc.w $ffff
[000b8190]                           dc.w $fc3f
[000b8192]                           dc.w $ffff
[000b8194]                           dc.w $e87f
[000b8196]                           dc.w $ffff
[000b8198]                           dc.w $f8ef
[000b819a]                           dc.w $ffff
[000b819c]                           dc.w $ffff
[000b819e]                           dc.w $ffff
[000b81a0]                           dc.w $f77f
[000b81a2]                           dc.w $ffff
[000b81a4]                           dc.w $ffff
[000b81a6]                           dc.w $ffff
[000b81a8]                           dc.w $ffff
[000b81aa]                           dc.w $ffff
[000b81ac]                           dc.w $ffff
[000b81ae]                           dc.w $ffff
[000b81b0]                           dc.w $ffff
[000b81b2]                           dc.w $ffff
[000b81b4]                           dc.w $ffff
[000b81b6]                           dc.w $ffff
[000b81b8]                           dc.w $ffff
[000b81ba]                           dc.w $ffff
[000b81bc]                           dc.w $e000
[000b81be]                           dc.w $037f
[000b81c0]                           dc.w $e000
[000b81c2]                           dc.w $0777
[000b81c4]                           dc.w $e7ff
[000b81c6]                           dc.w $ffef
[000b81c8]                           dc.w $e71d
[000b81ca]                           dc.w $df3f
[000b81cc]                           dc.w $e6ed
[000b81ce]                           dc.w $be33
[000b81d0]                           dc.w $e6ed
[000b81d2]                           dc.w $7c3f
[000b81d4]                           dc.w $e6ec
[000b81d6]                           dc.w $787f
[000b81d8]                           dc.w $e6ed
[000b81da]                           dc.w $b4ef
[000b81dc]                           dc.w $e71d
[000b81de]                           dc.w $eff7
[000b81e0]                           dc.w $e7ff
[000b81e2]                           dc.w $cfff
[000b81e4]                           dc.w $efff
[000b81e6]                           dc.w $87ff
[000b81e8]                           dc.w $ffff
[000b81ea]                           dc.w $0fff
[000b81ec]                           dc.w $fffe
[000b81ee]                           dc.w $1fff
[000b81f0]                           dc.w $fffd
[000b81f2]                           dc.w $3fff
[000b81f4]                           dc.w $fffb
[000b81f6]                           dc.w $ffff
[000b81f8]                           dc.w $fff3
[000b81fa]                           dc.w $ffff
[000b81fc]                           dc.w $ffe1
[000b81fe]                           dc.w $ffff
[000b8200]                           dc.w $ffc3
[000b8202]                           dc.w $ffff
[000b8204]                           dc.w $f787
[000b8206]                           dc.w $ffff
[000b8208]                           dc.w $fb4f
[000b820a]                           dc.w $ffff
[000b820c]                           dc.w $feff
[000b820e]                           dc.w $ffff
[000b8210]                           dc.w $fcff
[000b8212]                           dc.w $ffff
[000b8214]                           dc.w $c87f
[000b8216]                           dc.w $ffff
[000b8218]                           dc.w $f8ef
[000b821a]                           dc.w $ffff
[000b821c]                           dc.w $fff7
[000b821e]                           dc.w $ffff
[000b8220]                           dc.w $f77f
[000b8222]                           dc.w $ffff
[000b8224]                           dc.w $ef7f
[000b8226]                           dc.w $ffff
[000b8228]                           dc.w $ffff
[000b822a]                           dc.w $ffff
[000b822c]                           dc.w $ffff
[000b822e]                           dc.w $ffff
[000b8230]                           dc.w $0000
[000b8232]                           dc.w $0000
[000b8234]                           dc.w $0000
[000b8236]                           dc.w $0000
[000b8238]                           dc.w $0000
[000b823a]                           dc.w $0000
[000b823c]                           dc.w $1fff
[000b823e]                           dc.w $fe00
[000b8240]                           dc.w $1fff
[000b8242]                           dc.w $fe00
[000b8244]                           dc.w $1800
[000b8246]                           dc.w $0600
[000b8248]                           dc.w $1800
[000b824a]                           dc.w $06c0
[000b824c]                           dc.w $1800
[000b824e]                           dc.w $0520
[000b8250]                           dc.w $1800
[000b8252]                           dc.w $0260
[000b8254]                           dc.w $1800
[000b8256]                           dc.w $04c0
[000b8258]                           dc.w $1800
[000b825a]                           dc.w $0980
[000b825c]                           dc.w $1800
[000b825e]                           dc.w $1300
[000b8260]                           dc.w $1800
[000b8262]                           dc.w $2600
[000b8264]                           dc.w $1fff
[000b8266]                           dc.w $4c00
[000b8268]                           dc.w $1ffe
[000b826a]                           dc.w $9800
[000b826c]                           dc.w $0001
[000b826e]                           dc.w $3000
[000b8270]                           dc.w $0002
[000b8272]                           dc.w $6000
[000b8274]                           dc.w $0004
[000b8276]                           dc.w $c000
[000b8278]                           dc.w $0009
[000b827a]                           dc.w $8000
[000b827c]                           dc.w $0013
[000b827e]                           dc.w $0000
[000b8280]                           dc.w $0026
[000b8282]                           dc.w $0000
[000b8284]                           dc.w $004c
[000b8286]                           dc.w $0000
[000b8288]                           dc.w $0098
[000b828a]                           dc.w $0000
[000b828c]                           dc.w $0130
[000b828e]                           dc.w $0000
[000b8290]                           dc.w $0260
[000b8292]                           dc.w $0000
[000b8294]                           dc.w $04c0
[000b8296]                           dc.w $0000
[000b8298]                           dc.w $0580
[000b829a]                           dc.w $0000
[000b829c]                           dc.w $0300
[000b829e]                           dc.w $0000
[000b82a0]                           dc.w $0000
[000b82a2]                           dc.w $0000
[000b82a4]                           dc.w $0000
[000b82a6]                           dc.w $0000
[000b82a8]                           dc.w $0000
[000b82aa]                           dc.w $0000
[000b82ac]                           dc.w $0000
[000b82ae]                           dc.w $0000
DATAS_06:
[000b82b0]                           dc.w $ffff
[000b82b2]                           dc.w $ffff
[000b82b4]                           dc.w $ffff
[000b82b6]                           dc.w $ffff
[000b82b8]                           dc.w $ffff
[000b82ba]                           dc.w $ffff
[000b82bc]                           dc.w $ffff
[000b82be]                           dc.w $ffff
[000b82c0]                           dc.w $ffff
[000b82c2]                           dc.w $ffff
[000b82c4]                           dc.w $ffff
[000b82c6]                           dc.w $ffff
[000b82c8]                           dc.w $ffff
[000b82ca]                           dc.w $ffff
[000b82cc]                           dc.w $ffff
[000b82ce]                           dc.w $ffff
[000b82d0]                           dc.w $ffff
[000b82d2]                           dc.w $ffff
[000b82d4]                           dc.w $ffff
[000b82d6]                           dc.w $ffff
[000b82d8]                           dc.w $ffff
[000b82da]                           dc.w $ffff
[000b82dc]                           dc.w $ffff
[000b82de]                           dc.w $ffff
[000b82e0]                           dc.w $ffff
[000b82e2]                           dc.w $ffff
[000b82e4]                           dc.w $ffff
[000b82e6]                           dc.w $ffff
[000b82e8]                           dc.w $ffff
[000b82ea]                           dc.w $ffff
[000b82ec]                           dc.w $ffff
[000b82ee]                           dc.w $ffff
[000b82f0]                           dc.w $ffff
[000b82f2]                           dc.w $ffff
[000b82f4]                           dc.w $ffff
[000b82f6]                           dc.w $ffff
[000b82f8]                           dc.w $ffff
[000b82fa]                           dc.w $ffff
[000b82fc]                           dc.w $ffff
[000b82fe]                           dc.w $ffff
[000b8300]                           dc.w $ffff
[000b8302]                           dc.w $ffff
[000b8304]                           dc.w $ffff
[000b8306]                           dc.w $ffff
[000b8308]                           dc.w $ffff
[000b830a]                           dc.w $ffff
[000b830c]                           dc.w $ffff
[000b830e]                           dc.w $ffff
[000b8310]                           dc.w $ffff
[000b8312]                           dc.w $ffff
[000b8314]                           dc.w $ffff
[000b8316]                           dc.w $ffff
[000b8318]                           dc.w $ffff
[000b831a]                           dc.w $ffff
[000b831c]                           dc.w $ffff
[000b831e]                           dc.w $ffff
[000b8320]                           dc.w $ffff
[000b8322]                           dc.w $ffff
[000b8324]                           dc.w $ffff
[000b8326]                           dc.w $ffff
[000b8328]                           dc.w $ffff
[000b832a]                           dc.w $ffff
[000b832c]                           dc.w $ffff
[000b832e]                           dc.w $ffff
DATAS_07:
[000b8330]                           dc.w $0000
[000b8332]                           dc.w $0000
[000b8334]                           dc.w $0208
[000b8336]                           dc.w $ffff
[000b8338]                           dc.w $ffff
[000b833a]                           dc.w $ffff
[000b833c]                           dc.w $ffff
[000b833e]                           dc.w $ffff
[000b8340]                           dc.w $ffff
[000b8342]                           dc.w $e000
[000b8344]                           dc.w $07ff
[000b8346]                           dc.w $c000
[000b8348]                           dc.w $0fff
[000b834a]                           dc.w $cfff
[000b834c]                           dc.w $ffff
[000b834e]                           dc.w $cfff
[000b8350]                           dc.w $ffff
[000b8352]                           dc.w $cfff
[000b8354]                           dc.w $f80f
[000b8356]                           dc.w $cfff
[000b8358]                           dc.w $f007
[000b835a]                           dc.w $cfff
[000b835c]                           dc.w $f007
[000b835e]                           dc.w $cfff
[000b8360]                           dc.w $e003
[000b8362]                           dc.w $cfff
[000b8364]                           dc.w $e183
[000b8366]                           dc.w $cfff
[000b8368]                           dc.w $f1c3
[000b836a]                           dc.w $dfff
[000b836c]                           dc.w $ffc3
[000b836e]                           dc.w $ffff
[000b8370]                           dc.w $ffc3
[000b8372]                           dc.w $ffff
[000b8374]                           dc.w $ff87
[000b8376]                           dc.w $ffff
[000b8378]                           dc.w $ff07
[000b837a]                           dc.w $ffff
[000b837c]                           dc.w $ff0f
[000b837e]                           dc.w $ffff
[000b8380]                           dc.w $fe1f
[000b8382]                           dc.w $ffff
[000b8384]                           dc.w $ee1f
[000b8386]                           dc.w $ffff
[000b8388]                           dc.w $ee1f
[000b838a]                           dc.w $ffff
[000b838c]                           dc.w $fe1f
[000b838e]                           dc.w $ffff
[000b8390]                           dc.w $fe1f
[000b8392]                           dc.w $ffff
[000b8394]                           dc.w $ff3f
[000b8396]                           dc.w $ffff
[000b8398]                           dc.w $ffff
[000b839a]                           dc.w $ffff
[000b839c]                           dc.w $fe3f
[000b839e]                           dc.w $ffff
[000b83a0]                           dc.w $fe1f
[000b83a2]                           dc.w $ffff
[000b83a4]                           dc.w $fe1f
[000b83a6]                           dc.w $ffff
[000b83a8]                           dc.w $ff3f
[000b83aa]                           dc.w $ffff
[000b83ac]                           dc.w $ffff
[000b83ae]                           dc.w $ffff
[000b83b0]                           dc.w $ffff
[000b83b2]                           dc.w $ffff
[000b83b4]                           dc.w $ffff
[000b83b6]                           dc.w $ffff
[000b83b8]                           dc.w $ffff
[000b83ba]                           dc.w $ffff
[000b83bc]                           dc.w $ffff
[000b83be]                           dc.w $ffff
[000b83c0]                           dc.w $ffff
[000b83c2]                           dc.w $e000
[000b83c4]                           dc.w $07ff
[000b83c6]                           dc.w $c000
[000b83c8]                           dc.w $0fff
[000b83ca]                           dc.w $cfff
[000b83cc]                           dc.w $ffff
[000b83ce]                           dc.w $ce3b
[000b83d0]                           dc.w $bfff
[000b83d2]                           dc.w $cddb
[000b83d4]                           dc.w $79ef
[000b83d6]                           dc.w $cdda
[000b83d8]                           dc.w $f7f7
[000b83da]                           dc.w $cdd8
[000b83dc]                           dc.w $fff7
[000b83de]                           dc.w $cddb
[000b83e0]                           dc.w $6e7b
[000b83e2]                           dc.w $ce3b
[000b83e4]                           dc.w $adbb
[000b83e6]                           dc.w $cfff
[000b83e8]                           dc.w $fdfb
[000b83ea]                           dc.w $dfff
[000b83ec]                           dc.w $fffb
[000b83ee]                           dc.w $ffff
[000b83f0]                           dc.w $fffb
[000b83f2]                           dc.w $ffff
[000b83f4]                           dc.w $fff7
[000b83f6]                           dc.w $ffff
[000b83f8]                           dc.w $fff7
[000b83fa]                           dc.w $ffff
[000b83fc]                           dc.w $ffef
[000b83fe]                           dc.w $ffff
[000b8400]                           dc.w $ffdf
[000b8402]                           dc.w $ffff
[000b8404]                           dc.w $efdf
[000b8406]                           dc.w $ffff
[000b8408]                           dc.w $efdf
[000b840a]                           dc.w $ffff
[000b840c]                           dc.w $ffdf
[000b840e]                           dc.w $ffff
[000b8410]                           dc.w $ffdf
[000b8412]                           dc.w $ffff
[000b8414]                           dc.w $ff3f
[000b8416]                           dc.w $ffff
[000b8418]                           dc.w $ffff
[000b841a]                           dc.w $ffff
[000b841c]                           dc.w $ffbf
[000b841e]                           dc.w $ffff
[000b8420]                           dc.w $ffdf
[000b8422]                           dc.w $ffff
[000b8424]                           dc.w $fedf
[000b8426]                           dc.w $ffff
[000b8428]                           dc.w $ff3f
[000b842a]                           dc.w $ffff
[000b842c]                           dc.w $ffff
[000b842e]                           dc.w $ffff
[000b8430]                           dc.w $ffff
[000b8432]                           dc.w $ffff
[000b8434]                           dc.w $ffff
[000b8436]                           dc.w $ffff
[000b8438]                           dc.w $ffff
[000b843a]                           dc.w $ffff
[000b843c]                           dc.w $ffff
[000b843e]                           dc.w $ffff
[000b8440]                           dc.w $ffff
[000b8442]                           dc.w $e000
[000b8444]                           dc.w $07ff
[000b8446]                           dc.w $c000
[000b8448]                           dc.w $0fff
[000b844a]                           dc.w $cfff
[000b844c]                           dc.w $ffff
[000b844e]                           dc.w $ce3b
[000b8450]                           dc.w $bfff
[000b8452]                           dc.w $cddb
[000b8454]                           dc.w $79ef
[000b8456]                           dc.w $cdda
[000b8458]                           dc.w $f7f7
[000b845a]                           dc.w $cdd8
[000b845c]                           dc.w $fff7
[000b845e]                           dc.w $cddb
[000b8460]                           dc.w $6e7b
[000b8462]                           dc.w $ce3b
[000b8464]                           dc.w $adbb
[000b8466]                           dc.w $cfff
[000b8468]                           dc.w $fdfb
[000b846a]                           dc.w $dfff
[000b846c]                           dc.w $fffb
[000b846e]                           dc.w $ffff
[000b8470]                           dc.w $fffb
[000b8472]                           dc.w $ffff
[000b8474]                           dc.w $fff7
[000b8476]                           dc.w $ffff
[000b8478]                           dc.w $fff7
[000b847a]                           dc.w $ffff
[000b847c]                           dc.w $ffef
[000b847e]                           dc.w $ffff
[000b8480]                           dc.w $ffdf
[000b8482]                           dc.w $ffff
[000b8484]                           dc.w $efdf
[000b8486]                           dc.w $ffff
[000b8488]                           dc.w $efdf
[000b848a]                           dc.w $ffff
[000b848c]                           dc.w $ffdf
[000b848e]                           dc.w $ffff
[000b8490]                           dc.w $ffdf
[000b8492]                           dc.w $ffff
[000b8494]                           dc.w $ff3f
[000b8496]                           dc.w $ffff
[000b8498]                           dc.w $ffff
[000b849a]                           dc.w $ffff
[000b849c]                           dc.w $ffbf
[000b849e]                           dc.w $ffff
[000b84a0]                           dc.w $ffdf
[000b84a2]                           dc.w $ffff
[000b84a4]                           dc.w $fedf
[000b84a6]                           dc.w $ffff
[000b84a8]                           dc.w $ff3f
[000b84aa]                           dc.w $ffff
[000b84ac]                           dc.w $ffff
[000b84ae]                           dc.w $ffff
[000b84b0]                           dc.w $ffff
[000b84b2]                           dc.w $ffff
[000b84b4]                           dc.w $ffff
[000b84b6]                           dc.w $0000
[000b84b8]                           dc.w $0000
[000b84ba]                           dc.w $0000
[000b84bc]                           dc.w $0000
[000b84be]                           dc.w $0000
[000b84c0]                           dc.w $0000
[000b84c2]                           dc.w $1fff
[000b84c4]                           dc.w $f800
[000b84c6]                           dc.w $3fff
[000b84c8]                           dc.w $fc00
[000b84ca]                           dc.w $3000
[000b84cc]                           dc.w $0c00
[000b84ce]                           dc.w $3000
[000b84d0]                           dc.w $0c00
[000b84d2]                           dc.w $3000
[000b84d4]                           dc.w $0810
[000b84d6]                           dc.w $3000
[000b84d8]                           dc.w $0018
[000b84da]                           dc.w $3000
[000b84dc]                           dc.w $0198
[000b84de]                           dc.w $3000
[000b84e0]                           dc.w $03cc
[000b84e2]                           dc.w $3000
[000b84e4]                           dc.w $064c
[000b84e6]                           dc.w $3000
[000b84e8]                           dc.w $0e0c
[000b84ea]                           dc.w $3fff
[000b84ec]                           dc.w $fc0c
[000b84ee]                           dc.w $1fff
[000b84f0]                           dc.w $f80c
[000b84f2]                           dc.w $0018
[000b84f4]                           dc.w $0018
[000b84f6]                           dc.w $003c
[000b84f8]                           dc.w $0018
[000b84fa]                           dc.w $007e
[000b84fc]                           dc.w $0030
[000b84fe]                           dc.w $00ff
[000b8500]                           dc.w $0060
[000b8502]                           dc.w $01db
[000b8504]                           dc.w $f060
[000b8506]                           dc.w $0399
[000b8508]                           dc.w $f060
[000b850a]                           dc.w $0718
[000b850c]                           dc.w $0160
[000b850e]                           dc.w $039e
[000b8510]                           dc.w $01e0
[000b8512]                           dc.w $019f
[000b8514]                           dc.w $80c0
[000b8516]                           dc.w $0019
[000b8518]                           dc.w $e000
[000b851a]                           dc.w $0038
[000b851c]                           dc.w $7040
[000b851e]                           dc.w $0070
[000b8520]                           dc.w $3060
[000b8522]                           dc.w $00e0
[000b8524]                           dc.w $31e0
[000b8526]                           dc.w $01c0
[000b8528]                           dc.w $30c0
[000b852a]                           dc.w $0180
[000b852c]                           dc.w $3000
[000b852e]                           dc.w $0000
[000b8530]                           dc.w $0000
[000b8532]                           dc.w $0000
[000b8534]                           dc.w $0000
DATAS_08:
[000b8536]                           dc.w $ffff
[000b8538]                           dc.w $ffff
[000b853a]                           dc.w $ffff
[000b853c]                           dc.w $ffff
[000b853e]                           dc.w $ffff
[000b8540]                           dc.w $ffff
[000b8542]                           dc.w $ffff
[000b8544]                           dc.w $ffff
[000b8546]                           dc.w $ffff
[000b8548]                           dc.w $ffff
[000b854a]                           dc.w $ffff
[000b854c]                           dc.w $ffff
[000b854e]                           dc.w $ffff
[000b8550]                           dc.w $ffff
[000b8552]                           dc.w $ffff
[000b8554]                           dc.w $ffff
[000b8556]                           dc.w $ffff
[000b8558]                           dc.w $ffff
[000b855a]                           dc.w $ffff
[000b855c]                           dc.w $ffff
[000b855e]                           dc.w $ffff
[000b8560]                           dc.w $ffff
[000b8562]                           dc.w $ffff
[000b8564]                           dc.w $ffff
[000b8566]                           dc.w $ffff
[000b8568]                           dc.w $ffff
[000b856a]                           dc.w $ffff
[000b856c]                           dc.w $ffff
[000b856e]                           dc.w $ffff
[000b8570]                           dc.w $ffff
[000b8572]                           dc.w $ffff
[000b8574]                           dc.w $ffff
[000b8576]                           dc.w $ffff
[000b8578]                           dc.w $ffff
[000b857a]                           dc.w $ffff
[000b857c]                           dc.w $ffff
[000b857e]                           dc.w $ffff
[000b8580]                           dc.w $ffff
[000b8582]                           dc.w $ffff
[000b8584]                           dc.w $ffff
[000b8586]                           dc.w $ffff
[000b8588]                           dc.w $ffff
[000b858a]                           dc.w $ffff
[000b858c]                           dc.w $ffff
[000b858e]                           dc.w $ffff
[000b8590]                           dc.w $ffff
[000b8592]                           dc.w $ffff
[000b8594]                           dc.w $ffff
[000b8596]                           dc.w $ffff
[000b8598]                           dc.w $ffff
[000b859a]                           dc.w $ffff
[000b859c]                           dc.w $ffff
[000b859e]                           dc.w $ffff
[000b85a0]                           dc.w $ffff
[000b85a2]                           dc.w $ffff
[000b85a4]                           dc.w $ffff
[000b85a6]                           dc.w $ffff
[000b85a8]                           dc.w $ffff
[000b85aa]                           dc.w $ffff
[000b85ac]                           dc.w $ffff
[000b85ae]                           dc.w $ffff
[000b85b0]                           dc.w $ffff
[000b85b2]                           dc.w $ffff
[000b85b4]                           dc.w $ffff
TEDINFO_015:
[000b85b6] 000b7b6f                  dc.l TEXT_024
[000b85ba] 000b7b55                  dc.l TEMPLATE_001
[000b85be] 000b7b99                  dc.l VALID_001
[000b85c2]                           dc.w $0003
[000b85c4]                           dc.w $0006
[000b85c6]                           dc.w $0002
[000b85c8]                           dc.w $1180
[000b85ca]                           dc.w $0000
[000b85cc]                           dc.w $ffff
[000b85ce]                           dc.w $0004
[000b85d0]                           dc.w $000a
TEDINFO_069:
[000b85d2] 000b7b73                  dc.l TEXT_030
[000b85d6] 000b7b5f                  dc.l TEXT_002
[000b85da] 000b7b5f                  dc.l TEXT_002
[000b85de]                           dc.w $0003
[000b85e0]                           dc.w $0006
[000b85e2]                           dc.w $0002
[000b85e4]                           dc.w $1180
[000b85e6]                           dc.w $0000
[000b85e8]                           dc.w $ffff
[000b85ea]                           dc.w $0005
[000b85ec]                           dc.w $0001
A_3DBUTTON01:
[000b85ee] 00064a22                  dc.l A_3Dbutton
[000b85f2]                           dc.w $21f1
[000b85f4]                           dc.w $01f8
[000b85f6] 000630f2                  dc.l Auo_string
[000b85fa]                           dc.w $0000
[000b85fc]                           dc.w $0000
[000b85fe]                           dc.w $0000
[000b8600]                           dc.w $0000
[000b8602]                           dc.w $0000
[000b8604]                           dc.w $0000
[000b8606]                           dc.w $0000
[000b8608]                           dc.w $0000
[000b860a]                           dc.w $0000
[000b860c]                           dc.w $0000
A_3DBUTTON03:
[000b860e] 00064a22                  dc.l A_3Dbutton
[000b8612]                           dc.w $21f1
[000b8614]                           dc.w $0178
[000b8616] 000630f2                  dc.l Auo_string
[000b861a]                           dc.w $0000
[000b861c]                           dc.w $0000
[000b861e]                           dc.w $0000
[000b8620]                           dc.w $0000
[000b8622]                           dc.w $0000
[000b8624]                           dc.w $0000
[000b8626]                           dc.w $0000
[000b8628]                           dc.w $0000
[000b862a]                           dc.w $0000
[000b862c]                           dc.w $0000
A_3DBUTTON05:
[000b862e] 00064a22                  dc.l A_3Dbutton
[000b8632]                           dc.w $a9e1
[000b8634]                           dc.w $0178
[000b8636] 000630f2                  dc.l Auo_string
[000b863a]                           dc.w $0000
[000b863c]                           dc.w $0000
[000b863e]                           dc.w $0000
[000b8640]                           dc.w $0000
[000b8642]                           dc.w $0000
[000b8644]                           dc.w $0000
[000b8646] 000b7a98                  dc.l BUBBLE_01
[000b864a]                           dc.w $0000
[000b864c]                           dc.w $0000
A_3DBUTTON06:
[000b864e] 00064a22                  dc.l A_3Dbutton
[000b8652]                           dc.w $a9e1
[000b8654]                           dc.w $0178
[000b8656] 000630f2                  dc.l Auo_string
[000b865a]                           dc.w $0000
[000b865c]                           dc.w $0000
[000b865e]                           dc.w $0000
[000b8660]                           dc.w $0000
[000b8662]                           dc.w $0000
[000b8664]                           dc.w $0000
[000b8666] 000b7ac0                  dc.l BUBBLE_02
[000b866a]                           dc.w $0000
[000b866c]                           dc.w $0000
A_3DBUTTON07:
[000b866e] 00064a22                  dc.l A_3Dbutton
[000b8672]                           dc.w $a9e1
[000b8674]                           dc.w $0178
[000b8676] 000630f2                  dc.l Auo_string
[000b867a]                           dc.w $0000
[000b867c]                           dc.w $0000
[000b867e]                           dc.w $0000
[000b8680]                           dc.w $0000
[000b8682]                           dc.w $0000
[000b8684]                           dc.w $0000
[000b8686] 000b7aea                  dc.l BUBBLE_03
[000b868a]                           dc.w $0000
[000b868c]                           dc.w $0000
A_3DBUTTON08:
[000b868e] 00064a22                  dc.l A_3Dbutton
[000b8692]                           dc.w $a9e1
[000b8694]                           dc.w $0178
[000b8696] 000630f2                  dc.l Auo_string
[000b869a]                           dc.w $0000
[000b869c]                           dc.w $0000
[000b869e]                           dc.w $0000
[000b86a0]                           dc.w $0000
[000b86a2]                           dc.w $0000
[000b86a4]                           dc.w $0000
[000b86a6] 000b7b16                  dc.l BUBBLE_04
[000b86aa]                           dc.w $0000
[000b86ac]                           dc.w $0000
_MSK_ICON_001:
[000b86ae]                           dc.w $00ff
[000b86b0]                           dc.w $ffff
[000b86b2]                           dc.w $fe00
[000b86b4]                           dc.w $00ff
[000b86b6]                           dc.w $ffff
[000b86b8]                           dc.w $fe00
[000b86ba]                           dc.w $00ff
[000b86bc]                           dc.w $ffff
[000b86be]                           dc.w $fe00
[000b86c0]                           dc.w $00ff
[000b86c2]                           dc.w $ffff
[000b86c4]                           dc.w $fe00
[000b86c6]                           dc.w $00ff
[000b86c8]                           dc.w $ffff
[000b86ca]                           dc.w $fe00
[000b86cc]                           dc.w $00ff
[000b86ce]                           dc.w $ffff
[000b86d0]                           dc.w $fe00
[000b86d2]                           dc.w $00ff
[000b86d4]                           dc.w $ffff
[000b86d6]                           dc.w $fe00
[000b86d8]                           dc.w $00ff
[000b86da]                           dc.w $ffff
[000b86dc]                           dc.w $fe00
[000b86de]                           dc.w $00ff
[000b86e0]                           dc.w $ffff
[000b86e2]                           dc.w $fe00
[000b86e4]                           dc.w $00ff
[000b86e6]                           dc.w $ffff
[000b86e8]                           dc.w $fe00
[000b86ea]                           dc.w $00ff
[000b86ec]                           dc.w $ffff
[000b86ee]                           dc.w $fe00
[000b86f0]                           dc.w $00ff
[000b86f2]                           dc.w $ffff
[000b86f4]                           dc.w $fe00
[000b86f6]                           dc.w $00ff
[000b86f8]                           dc.w $ffff
[000b86fa]                           dc.w $fe00
[000b86fc]                           dc.w $00ff
[000b86fe]                           dc.w $ffff
[000b8700]                           dc.w $fe00
[000b8702]                           dc.w $00ff
[000b8704]                           dc.w $ffff
[000b8706]                           dc.w $fe00
[000b8708]                           dc.w $0fff
[000b870a]                           dc.w $ffff
[000b870c]                           dc.w $fff0
[000b870e]                           dc.w $0fff
[000b8710]                           dc.w $ffff
[000b8712]                           dc.w $fff0
[000b8714]                           dc.w $0fff
[000b8716]                           dc.w $ffff
[000b8718]                           dc.w $fff0
[000b871a]                           dc.w $0fff
[000b871c]                           dc.w $ffff
[000b871e]                           dc.w $fff0
[000b8720]                           dc.w $0fff
[000b8722]                           dc.w $ffff
[000b8724]                           dc.w $fff0
[000b8726]                           dc.w $0fff
[000b8728]                           dc.w $ffff
[000b872a]                           dc.w $fff0
[000b872c]                           dc.w $0fff
[000b872e]                           dc.w $ffff
[000b8730]                           dc.w $fff0
[000b8732]                           dc.w $0fff
[000b8734]                           dc.w $ffff
[000b8736]                           dc.w $fff0
[000b8738]                           dc.w $0000
[000b873a]                           dc.w $0000
[000b873c]                           dc.w $0000
_DAT_ICON_001:
[000b873e]                           dc.w $00ff
[000b8740]                           dc.w $ffff
[000b8742]                           dc.w $fe00
[000b8744]                           dc.w $00c0
[000b8746]                           dc.w $0000
[000b8748]                           dc.w $0600
[000b874a]                           dc.w $00c0
[000b874c]                           dc.w $7fff
[000b874e]                           dc.w $8600
[000b8750]                           dc.w $00c0
[000b8752]                           dc.w $c000
[000b8754]                           dc.w $8600
[000b8756]                           dc.w $00c1
[000b8758]                           dc.w $4000
[000b875a]                           dc.w $8600
[000b875c]                           dc.w $00c3
[000b875e]                           dc.w $c000
[000b8760]                           dc.w $8600
[000b8762]                           dc.w $00c2
[000b8764]                           dc.w $0000
[000b8766]                           dc.w $8600
[000b8768]                           dc.w $00c2
[000b876a]                           dc.w $0000
[000b876c]                           dc.w $8600
[000b876e]                           dc.w $00c2
[000b8770]                           dc.w $0000
[000b8772]                           dc.w $8600
[000b8774]                           dc.w $00c2
[000b8776]                           dc.w $0000
[000b8778]                           dc.w $8600
[000b877a]                           dc.w $00c2
[000b877c]                           dc.w $0000
[000b877e]                           dc.w $8600
[000b8780]                           dc.w $00c2
[000b8782]                           dc.w $0000
[000b8784]                           dc.w $8600
[000b8786]                           dc.w $00c2
[000b8788]                           dc.w $0000
[000b878a]                           dc.w $8600
[000b878c]                           dc.w $00c2
[000b878e]                           dc.w $0000
[000b8790]                           dc.w $8600
[000b8792]                           dc.w $00c2
[000b8794]                           dc.w $0000
[000b8796]                           dc.w $8600
[000b8798]                           dc.w $0fc3
[000b879a]                           dc.w $ffff
[000b879c]                           dc.w $87f0
[000b879e]                           dc.w $0c00
[000b87a0]                           dc.w $0000
[000b87a2]                           dc.w $0030
[000b87a4]                           dc.w $0c1c
[000b87a6]                           dc.w $f9f9
[000b87a8]                           dc.w $8830
[000b87aa]                           dc.w $0c08
[000b87ac]                           dc.b 'Å',$09,'H0'
[000b87b0]                           dc.w $0c08
[000b87b2]                           dc.b 'Å',$09,'(0'
[000b87b6]                           dc.w $0c1c
[000b87b8]                           dc.w $f9f9
[000b87ba]                           dc.w $1830
[000b87bc]                           dc.w $0c00
[000b87be]                           dc.w $0000
[000b87c0]                           dc.w $0030
[000b87c2]                           dc.w $0fff
[000b87c4]                           dc.w $ffff
[000b87c6]                           dc.w $fff0
[000b87c8]                           dc.w $0000
[000b87ca]                           dc.w $0000
[000b87cc]                           dc.w $0000
ICON_001:
[000b87ce] 000b86ae                  dc.l _MSK_ICON_001
[000b87d2] 000b873e                  dc.l _DAT_ICON_001
[000b87d6] 000b7b8c                  dc.l TEXT_065
[000b87da]                           dc.w $1041
[000b87dc]                           dc.w $0014
[000b87de]                           dc.w $0006
[000b87e0]                           dc.w $0000
[000b87e2]                           dc.w $0000
[000b87e4]                           dc.w $0030
[000b87e6]                           dc.w $0018
[000b87e8]                           dc.w $0000
[000b87ea]                           dc.w $0018
[000b87ec]                           dc.w $0030
[000b87ee]                           dc.w $0008
[000b87f0]                           dc.w $0000
[000b87f2]                           dc.w $0000
_C4_I_FLAGS:
[000b87f4]                           dc.w $0004
[000b87f6] 000b8336                  dc.l $000b8336
[000b87fa] 000b8536                  dc.l DATAS_08
[000b87fe]                           dc.w $0000
[000b8800]                           dc.w $0000
[000b8802]                           dc.w $0000
[000b8804]                           dc.w $0000
[000b8806]                           dc.w $0000
[000b8808]                           dc.w $0000
_MSK_I_FLAGS:
[000b880a]                           dc.w $0000
[000b880c]                           dc.w $0000
[000b880e]                           dc.w $0000
[000b8810]                           dc.w $0000
[000b8812]                           dc.w $0000
[000b8814]                           dc.w $0000
[000b8816]                           dc.w $1fff
[000b8818]                           dc.w $f800
[000b881a]                           dc.w $3fff
[000b881c]                           dc.w $fc00
[000b881e]                           dc.w $3fff
[000b8820]                           dc.w $fc00
[000b8822]                           dc.w $3fff
[000b8824]                           dc.w $fc00
[000b8826]                           dc.w $3fff
[000b8828]                           dc.w $fdf0
[000b882a]                           dc.w $3fff
[000b882c]                           dc.w $fff8
[000b882e]                           dc.w $3fff
[000b8830]                           dc.w $fff8
[000b8832]                           dc.w $3fff
[000b8834]                           dc.w $fffc
[000b8836]                           dc.w $3fff
[000b8838]                           dc.w $fe7c
[000b883a]                           dc.w $3fff
[000b883c]                           dc.w $fe3c
[000b883e]                           dc.w $3fff
[000b8840]                           dc.w $fc3c
[000b8842]                           dc.w $1fff
[000b8844]                           dc.w $f83c
[000b8846]                           dc.w $0018
[000b8848]                           dc.w $0078
[000b884a]                           dc.w $003c
[000b884c]                           dc.w $00f8
[000b884e]                           dc.w $007e
[000b8850]                           dc.w $00f0
[000b8852]                           dc.w $00ff
[000b8854]                           dc.w $01e0
[000b8856]                           dc.w $01db
[000b8858]                           dc.w $e1e0
[000b885a]                           dc.w $0399
[000b885c]                           dc.w $e1e0
[000b885e]                           dc.w $0718
[000b8860]                           dc.w $01e0
[000b8862]                           dc.w $039e
[000b8864]                           dc.w $01e0
[000b8866]                           dc.w $019f
[000b8868]                           dc.w $80c0
[000b886a]                           dc.w $0019
[000b886c]                           dc.w $e000
[000b886e]                           dc.w $0038
[000b8870]                           dc.w $70c0
[000b8872]                           dc.w $0070
[000b8874]                           dc.w $31e0
[000b8876]                           dc.w $00e0
[000b8878]                           dc.w $31e0
[000b887a]                           dc.w $01c0
[000b887c]                           dc.w $30c0
[000b887e]                           dc.w $0180
[000b8880]                           dc.w $3000
[000b8882]                           dc.w $0000
[000b8884]                           dc.w $0000
[000b8886]                           dc.w $0000
[000b8888]                           dc.w $0000
_DAT_I_FLAGS:
[000b888a]                           dc.w $0000
[000b888c]                           dc.w $0000
[000b888e]                           dc.w $0000
[000b8890]                           dc.w $0000
[000b8892]                           dc.w $0000
[000b8894]                           dc.w $0000
[000b8896]                           dc.w $1fff
[000b8898]                           dc.w $f800
[000b889a]                           dc.w $3fff
[000b889c]                           dc.w $fc00
[000b889e]                           dc.w $3000
[000b88a0]                           dc.w $0c00
[000b88a2]                           dc.w $31c4
[000b88a4]                           dc.w $4c00
[000b88a6]                           dc.w $3224
[000b88a8]                           dc.w $89f0
[000b88aa]                           dc.w $3225
[000b88ac]                           dc.w $07f8
[000b88ae]                           dc.w $3227
[000b88b0]                           dc.w $0ff8
[000b88b2]                           dc.w $3224
[000b88b4]                           dc.w $8ffc
[000b88b6]                           dc.w $31c4
[000b88b8]                           dc.b 'N|0',0
[000b88bc]                           dc.w $0e3c
[000b88be]                           dc.w $3fff
[000b88c0]                           dc.w $f43c
[000b88c2]                           dc.w $1fff
[000b88c4]                           dc.w $f83c
[000b88c6]                           dc.w $0018
[000b88c8]                           dc.w $0078
[000b88ca]                           dc.w $003c
[000b88cc]                           dc.w $00f8
[000b88ce]                           dc.w $007e
[000b88d0]                           dc.w $00f0
[000b88d2]                           dc.w $00ff
[000b88d4]                           dc.w $01e0
[000b88d6]                           dc.w $01db
[000b88d8]                           dc.w $e1e0
[000b88da]                           dc.w $0399
[000b88dc]                           dc.w $e1e0
[000b88de]                           dc.w $0718
[000b88e0]                           dc.w $01e0
[000b88e2]                           dc.w $039e
[000b88e4]                           dc.w $01e0
[000b88e6]                           dc.w $019f
[000b88e8]                           dc.w $80c0
[000b88ea]                           dc.w $0019
[000b88ec]                           dc.w $e000
[000b88ee]                           dc.w $0038
[000b88f0]                           dc.w $70c0
[000b88f2]                           dc.w $0070
[000b88f4]                           dc.w $31e0
[000b88f6]                           dc.w $00e0
[000b88f8]                           dc.w $31e0
[000b88fa]                           dc.w $01c0
[000b88fc]                           dc.w $30c0
[000b88fe]                           dc.w $0180
[000b8900]                           dc.w $3000
[000b8902]                           dc.w $0000
[000b8904]                           dc.w $0000
[000b8906]                           dc.w $0000
[000b8908]                           dc.w $0000
I_FLAGS:
[000b890a] 000b880a                  dc.l _MSK_I_FLAGS
[000b890e] 000b888a                  dc.l _DAT_I_FLAGS
[000b8912] 000b7b5f                  dc.l TEXT_002
[000b8916]                           dc.w $1000
[000b8918]                           dc.w $0000
[000b891a]                           dc.w $0000
[000b891c]                           dc.w $0000
[000b891e]                           dc.w $0000
[000b8920]                           dc.w $0020
[000b8922]                           dc.w $0020
[000b8924]                           dc.w $0008
[000b8926]                           dc.w $0008
[000b8928]                           dc.w $0000
[000b892a]                           dc.w $0000
[000b892c] 000b87f4                  dc.l _C4_I_FLAGS
_C4_I_POS:
[000b8930]                           dc.w $0004
[000b8932] 000b7e2a                  dc.l $000b7e2a
[000b8936] 000b802a                  dc.l DATAS_04
[000b893a]                           dc.w $0000
[000b893c]                           dc.w $0000
[000b893e]                           dc.w $0000
[000b8940]                           dc.w $0000
[000b8942]                           dc.w $0000
[000b8944]                           dc.w $0000
_MSK_I_POS:
[000b8946]                           dc.w $0000
[000b8948]                           dc.w $0000
[000b894a]                           dc.w $0000
[000b894c]                           dc.w $0000
[000b894e]                           dc.w $0000
[000b8950]                           dc.w $0000
[000b8952]                           dc.w $0800
[000b8954]                           dc.w $0000
[000b8956]                           dc.w $1c00
[000b8958]                           dc.w $0000
[000b895a]                           dc.w $3e00
[000b895c]                           dc.w $0000
[000b895e]                           dc.w $0800
[000b8960]                           dc.w $0000
[000b8962]                           dc.w $0bff
[000b8964]                           dc.w $ffc0
[000b8966]                           dc.w $0bff
[000b8968]                           dc.w $ffc0
[000b896a]                           dc.w $0bff
[000b896c]                           dc.w $ffc0
[000b896e]                           dc.w $0bff
[000b8970]                           dc.w $ffc0
[000b8972]                           dc.w $0bff
[000b8974]                           dc.w $ffc0
[000b8976]                           dc.w $0bff
[000b8978]                           dc.w $ffc0
[000b897a]                           dc.w $0bff
[000b897c]                           dc.w $ffc0
[000b897e]                           dc.w $0bff
[000b8980]                           dc.w $ffc0
[000b8982]                           dc.w $0bff
[000b8984]                           dc.w $ffc0
[000b8986]                           dc.w $0bff
[000b8988]                           dc.w $ffc0
[000b898a]                           dc.w $0bff
[000b898c]                           dc.w $ffc0
[000b898e]                           dc.w $0bff
[000b8990]                           dc.w $ffd0
[000b8992]                           dc.w $0800
[000b8994]                           dc.w $0018
[000b8996]                           dc.w $3fff
[000b8998]                           dc.w $fffc
[000b899a]                           dc.w $0800
[000b899c]                           dc.w $0018
[000b899e]                           dc.w $0800
[000b89a0]                           dc.w $0010
[000b89a2]                           dc.w $0000
[000b89a4]                           dc.w $0000
[000b89a6]                           dc.w $0fff
[000b89a8]                           dc.w $fff8
[000b89aa]                           dc.w $0fff
[000b89ac]                           dc.w $fff8
[000b89ae]                           dc.w $0fff
[000b89b0]                           dc.w $fff8
[000b89b2]                           dc.w $0fff
[000b89b4]                           dc.w $fff8
[000b89b6]                           dc.w $0fff
[000b89b8]                           dc.w $fff8
[000b89ba]                           dc.w $0000
[000b89bc]                           dc.w $0000
[000b89be]                           dc.w $0000
[000b89c0]                           dc.w $0000
[000b89c2]                           dc.w $0000
[000b89c4]                           dc.w $0000
_DAT_I_POS:
[000b89c6]                           dc.w $0000
[000b89c8]                           dc.w $0000
[000b89ca]                           dc.w $0000
[000b89cc]                           dc.w $0000
[000b89ce]                           dc.w $0000
[000b89d0]                           dc.w $0000
[000b89d2]                           dc.w $0800
[000b89d4]                           dc.w $0000
[000b89d6]                           dc.w $1c00
[000b89d8]                           dc.w $0000
[000b89da]                           dc.w $3e00
[000b89dc]                           dc.w $0000
[000b89de]                           dc.w $0800
[000b89e0]                           dc.w $0000
[000b89e2]                           dc.w $0bff
[000b89e4]                           dc.w $ffc0
[000b89e6]                           dc.w $0bff
[000b89e8]                           dc.w $ffc0
[000b89ea]                           dc.w $0b00
[000b89ec]                           dc.w $00c0
[000b89ee]                           dc.w $0b1c
[000b89f0]                           dc.w $44c0
[000b89f2]                           dc.w $0b22
[000b89f4]                           dc.w $48c0
[000b89f6]                           dc.w $0b22
[000b89f8]                           dc.w $50c0
[000b89fa]                           dc.w $0b22
[000b89fc]                           dc.w $70c0
[000b89fe]                           dc.w $0b22
[000b8a00]                           dc.w $48c0
[000b8a02]                           dc.w $0b1c
[000b8a04]                           dc.w $44c0
[000b8a06]                           dc.w $0b00
[000b8a08]                           dc.w $00c0
[000b8a0a]                           dc.w $0bff
[000b8a0c]                           dc.w $ffc0
[000b8a0e]                           dc.w $0bff
[000b8a10]                           dc.w $ffd0
[000b8a12]                           dc.w $0800
[000b8a14]                           dc.w $0018
[000b8a16]                           dc.w $3fff
[000b8a18]                           dc.w $fffc
[000b8a1a]                           dc.w $0800
[000b8a1c]                           dc.w $0018
[000b8a1e]                           dc.w $0800
[000b8a20]                           dc.w $0010
[000b8a22]                           dc.w $0000
[000b8a24]                           dc.w $0000
[000b8a26]                           dc.w $0fff
[000b8a28]                           dc.w $fff8
[000b8a2a]                           dc.w $0aaa
[000b8a2c]                           dc.w $aaa8
[000b8a2e]                           dc.w $0888
[000b8a30]                           dc.w $8888
[000b8a32]                           dc.w $0800
[000b8a34]                           dc.w $0008
[000b8a36]                           dc.w $0fff
[000b8a38]                           dc.w $fff8
[000b8a3a]                           dc.w $0000
[000b8a3c]                           dc.w $0000
[000b8a3e]                           dc.w $0000
[000b8a40]                           dc.w $0000
[000b8a42]                           dc.w $0000
[000b8a44]                           dc.w $0000
I_POS:
[000b8a46] 000b8946                  dc.l _MSK_I_POS
[000b8a4a] 000b89c6                  dc.l _DAT_I_POS
[000b8a4e] 000b7b5f                  dc.l TEXT_002
[000b8a52]                           dc.w $1000
[000b8a54]                           dc.w $0000
[000b8a56]                           dc.w $0000
[000b8a58]                           dc.w $0000
[000b8a5a]                           dc.w $0000
[000b8a5c]                           dc.w $0020
[000b8a5e]                           dc.w $0020
[000b8a60]                           dc.w $0008
[000b8a62]                           dc.w $0010
[000b8a64]                           dc.w $0000
[000b8a66]                           dc.w $0000
[000b8a68] 000b8930                  dc.l _C4_I_POS
_C4_I_REF:
[000b8a6c]                           dc.w $0004
[000b8a6e] 000b7ba4                  dc.l $000b7ba4
[000b8a72] 000b7da4                  dc.l DATAS_02
[000b8a76]                           dc.w $0000
[000b8a78]                           dc.w $0000
[000b8a7a]                           dc.w $0000
[000b8a7c]                           dc.w $0000
[000b8a7e]                           dc.w $0000
[000b8a80]                           dc.w $0000
_MSK_I_REF:
[000b8a82]                           dc.w $0000
[000b8a84]                           dc.w $0000
[000b8a86]                           dc.w $0000
[000b8a88]                           dc.w $0000
[000b8a8a]                           dc.w $0000
[000b8a8c]                           dc.w $0000
[000b8a8e]                           dc.w $1fff
[000b8a90]                           dc.w $fe00
[000b8a92]                           dc.w $1fff
[000b8a94]                           dc.w $fe00
[000b8a96]                           dc.w $1fff
[000b8a98]                           dc.w $fe00
[000b8a9a]                           dc.w $1fff
[000b8a9c]                           dc.w $fe00
[000b8a9e]                           dc.w $1fff
[000b8aa0]                           dc.w $fe00
[000b8aa2]                           dc.w $1fff
[000b8aa4]                           dc.w $fe00
[000b8aa6]                           dc.w $1fff
[000b8aa8]                           dc.w $ff00
[000b8aaa]                           dc.w $1fff
[000b8aac]                           dc.w $ff80
[000b8aae]                           dc.w $1fff
[000b8ab0]                           dc.w $ffc0
[000b8ab2]                           dc.w $1fff
[000b8ab4]                           dc.w $ffe0
[000b8ab6]                           dc.w $1fff
[000b8ab8]                           dc.w $fff0
[000b8aba]                           dc.w $1fff
[000b8abc]                           dc.w $fff8
[000b8abe]                           dc.w $1fff
[000b8ac0]                           dc.w $fffc
[000b8ac2]                           dc.w $3fff
[000b8ac4]                           dc.w $fffc
[000b8ac6]                           dc.w $3fff
[000b8ac8]                           dc.w $fff8
[000b8aca]                           dc.w $1fff
[000b8acc]                           dc.w $fff0
[000b8ace]                           dc.w $0fff
[000b8ad0]                           dc.w $ffe0
[000b8ad2]                           dc.w $07ff
[000b8ad4]                           dc.w $fff8
[000b8ad6]                           dc.w $03ff
[000b8ad8]                           dc.w $fff8
[000b8ada]                           dc.w $01ff
[000b8adc]                           dc.w $fff8
[000b8ade]                           dc.w $00ff
[000b8ae0]                           dc.w $fff8
[000b8ae2]                           dc.w $007f
[000b8ae4]                           dc.w $fff8
[000b8ae6]                           dc.w $003f
[000b8ae8]                           dc.w $fff8
[000b8aea]                           dc.w $001f
[000b8aec]                           dc.w $fc00
[000b8aee]                           dc.w $000f
[000b8af0]                           dc.w $f800
[000b8af2]                           dc.w $0007
[000b8af4]                           dc.w $f000
[000b8af6]                           dc.w $0003
[000b8af8]                           dc.w $e000
[000b8afa]                           dc.w $0001
[000b8afc]                           dc.w $c000
[000b8afe]                           dc.w $0000
[000b8b00]                           dc.w $0000
_DAT_I_REF:
[000b8b02]                           dc.w $0000
[000b8b04]                           dc.w $0000
[000b8b06]                           dc.w $0000
[000b8b08]                           dc.w $0000
[000b8b0a]                           dc.w $0000
[000b8b0c]                           dc.w $0000
[000b8b0e]                           dc.w $1fff
[000b8b10]                           dc.w $fe00
[000b8b12]                           dc.w $1fff
[000b8b14]                           dc.w $fe00
[000b8b16]                           dc.w $1800
[000b8b18]                           dc.w $0600
[000b8b1a]                           dc.w $18e2
[000b8b1c]                           dc.w $2600
[000b8b1e]                           dc.w $1912
[000b8b20]                           dc.w $4600
[000b8b22]                           dc.w $1912
[000b8b24]                           dc.w $8600
[000b8b26]                           dc.w $1913
[000b8b28]                           dc.w $8700
[000b8b2a]                           dc.w $1912
[000b8b2c]                           dc.w $4680
[000b8b2e]                           dc.w $18e2
[000b8b30]                           dc.w $2640
[000b8b32]                           dc.w $1800
[000b8b34]                           dc.w $0620
[000b8b36]                           dc.w $1fff
[000b8b38]                           dc.w $fe10
[000b8b3a]                           dc.w $1fff
[000b8b3c]                           dc.w $fe08
[000b8b3e]                           dc.w $1800
[000b8b40]                           dc.w $c904
[000b8b42]                           dc.w $3200
[000b8b44]                           dc.w $920c
[000b8b46]                           dc.w $3101
[000b8b48]                           dc.w $f418
[000b8b4a]                           dc.w $1886
[000b8b4c]                           dc.w $ac30
[000b8b4e]                           dc.w $0c4d
[000b8b50]                           dc.w $f460
[000b8b52]                           dc.w $062a
[000b8b54]                           dc.w $3bf8
[000b8b56]                           dc.w $031f
[000b8b58]                           dc.w $fff8
[000b8b5a]                           dc.w $018b
[000b8b5c]                           dc.w $ebf8
[000b8b5e]                           dc.w $00c5
[000b8b60]                           dc.w $57f8
[000b8b62]                           dc.w $0063
[000b8b64]                           dc.w $abf8
[000b8b66]                           dc.w $0031
[000b8b68]                           dc.w $f7f8
[000b8b6a]                           dc.w $0018
[000b8b6c]                           dc.w $0c00
[000b8b6e]                           dc.w $000c
[000b8b70]                           dc.w $1800
[000b8b72]                           dc.w $0006
[000b8b74]                           dc.w $3000
[000b8b76]                           dc.w $0003
[000b8b78]                           dc.w $6000
[000b8b7a]                           dc.w $0001
[000b8b7c]                           dc.w $c000
[000b8b7e]                           dc.w $0000
[000b8b80]                           dc.w $0000
I_REF:
[000b8b82] 000b8a82                  dc.l _MSK_I_REF
[000b8b86] 000b8b02                  dc.l _DAT_I_REF
[000b8b8a] 000b7b5f                  dc.l TEXT_002
[000b8b8e]                           dc.w $1000
[000b8b90]                           dc.w $0000
[000b8b92]                           dc.w $0000
[000b8b94]                           dc.w $0000
[000b8b96]                           dc.w $0000
[000b8b98]                           dc.w $0020
[000b8b9a]                           dc.w $0020
[000b8b9c]                           dc.w $0008
[000b8b9e]                           dc.w $0008
[000b8ba0]                           dc.w $0000
[000b8ba2]                           dc.w $0000
[000b8ba4] 000b8a6c                  dc.l _C4_I_REF
_C4_I_SPEC:
[000b8ba8]                           dc.w $0004
[000b8baa] 000b80b0                  dc.l $000b80b0
[000b8bae] 000b82b0                  dc.l DATAS_06
[000b8bb2]                           dc.w $0000
[000b8bb4]                           dc.w $0000
[000b8bb6]                           dc.w $0000
[000b8bb8]                           dc.w $0000
[000b8bba]                           dc.w $0000
[000b8bbc]                           dc.w $0000
_MSK_I_SPEC:
[000b8bbe]                           dc.w $0000
[000b8bc0]                           dc.w $0000
[000b8bc2]                           dc.w $0000
[000b8bc4]                           dc.w $0000
[000b8bc6]                           dc.w $0000
[000b8bc8]                           dc.w $0000
[000b8bca]                           dc.w $1fff
[000b8bcc]                           dc.w $fe88
[000b8bce]                           dc.w $1fff
[000b8bd0]                           dc.w $fe90
[000b8bd2]                           dc.w $1fff
[000b8bd4]                           dc.w $fe80
[000b8bd6]                           dc.w $1fff
[000b8bd8]                           dc.w $fe00
[000b8bda]                           dc.w $1fff
[000b8bdc]                           dc.w $feec
[000b8bde]                           dc.w $1fff
[000b8be0]                           dc.w $ffe0
[000b8be2]                           dc.w $1fff
[000b8be4]                           dc.w $ffc0
[000b8be6]                           dc.w $1fff
[000b8be8]                           dc.w $ff90
[000b8bea]                           dc.w $1fff
[000b8bec]                           dc.w $ff08
[000b8bee]                           dc.w $1fff
[000b8bf0]                           dc.w $fe00
[000b8bf2]                           dc.w $1fff
[000b8bf4]                           dc.w $fc00
[000b8bf6]                           dc.w $1fff
[000b8bf8]                           dc.w $f800
[000b8bfa]                           dc.w $0000
[000b8bfc]                           dc.w $f000
[000b8bfe]                           dc.w $0001
[000b8c00]                           dc.w $e000
[000b8c02]                           dc.w $0003
[000b8c04]                           dc.w $c000
[000b8c06]                           dc.w $0007
[000b8c08]                           dc.w $8000
[000b8c0a]                           dc.w $000f
[000b8c0c]                           dc.w $0000
[000b8c0e]                           dc.w $001e
[000b8c10]                           dc.w $0000
[000b8c12]                           dc.w $043c
[000b8c14]                           dc.w $0000
[000b8c16]                           dc.w $0278
[000b8c18]                           dc.w $0000
[000b8c1a]                           dc.w $00f0
[000b8c1c]                           dc.w $0000
[000b8c1e]                           dc.w $11e0
[000b8c20]                           dc.w $0000
[000b8c22]                           dc.w $0bc0
[000b8c24]                           dc.w $0000
[000b8c26]                           dc.w $0380
[000b8c28]                           dc.w $0000
[000b8c2a]                           dc.w $0320
[000b8c2c]                           dc.w $0000
[000b8c2e]                           dc.w $0910
[000b8c30]                           dc.w $0000
[000b8c32]                           dc.w $1100
[000b8c34]                           dc.w $0000
[000b8c36]                           dc.w $0000
[000b8c38]                           dc.w $0000
[000b8c3a]                           dc.w $0000
[000b8c3c]                           dc.w $0000
_DAT_I_SPEC:
[000b8c3e]                           dc.w $0000
[000b8c40]                           dc.w $0000
[000b8c42]                           dc.w $0000
[000b8c44]                           dc.w $0000
[000b8c46]                           dc.w $0000
[000b8c48]                           dc.w $0000
[000b8c4a]                           dc.w $1fff
[000b8c4c]                           dc.w $fe00
[000b8c4e]                           dc.w $1fff
[000b8c50]                           dc.w $fe00
[000b8c52]                           dc.w $1800
[000b8c54]                           dc.w $0600
[000b8c56]                           dc.w $18e2
[000b8c58]                           dc.w $2600
[000b8c5a]                           dc.w $1912
[000b8c5c]                           dc.w $46e0
[000b8c5e]                           dc.w $1912
[000b8c60]                           dc.w $85e0
[000b8c62]                           dc.w $1913
[000b8c64]                           dc.w $8240
[000b8c66]                           dc.w $1912
[000b8c68]                           dc.w $4480
[000b8c6a]                           dc.w $18e2
[000b8c6c]                           dc.w $0900
[000b8c6e]                           dc.w $1800
[000b8c70]                           dc.w $1200
[000b8c72]                           dc.w $1fff
[000b8c74]                           dc.w $bc00
[000b8c76]                           dc.w $1fff
[000b8c78]                           dc.w $7800
[000b8c7a]                           dc.w $0000
[000b8c7c]                           dc.w $9000
[000b8c7e]                           dc.w $0001
[000b8c80]                           dc.w $2000
[000b8c82]                           dc.w $0002
[000b8c84]                           dc.w $4000
[000b8c86]                           dc.w $0004
[000b8c88]                           dc.w $8000
[000b8c8a]                           dc.w $000f
[000b8c8c]                           dc.w $0000
[000b8c8e]                           dc.w $001e
[000b8c90]                           dc.w $0000
[000b8c92]                           dc.w $0024
[000b8c94]                           dc.w $0000
[000b8c96]                           dc.w $0048
[000b8c98]                           dc.w $0000
[000b8c9a]                           dc.w $0090
[000b8c9c]                           dc.w $0000
[000b8c9e]                           dc.w $0120
[000b8ca0]                           dc.w $0000
[000b8ca2]                           dc.w $03c0
[000b8ca4]                           dc.w $0000
[000b8ca6]                           dc.w $0380
[000b8ca8]                           dc.w $0000
[000b8caa]                           dc.w $0300
[000b8cac]                           dc.w $0000
[000b8cae]                           dc.w $0000
[000b8cb0]                           dc.w $0000
[000b8cb2]                           dc.w $0000
[000b8cb4]                           dc.w $0000
[000b8cb6]                           dc.w $0000
[000b8cb8]                           dc.w $0000
[000b8cba]                           dc.w $0000
[000b8cbc]                           dc.w $0000
I_SPEC:
[000b8cbe] 000b8bbe                  dc.l _MSK_I_SPEC
[000b8cc2] 000b8c3e                  dc.l _DAT_I_SPEC
[000b8cc6] 000b7b5f                  dc.l TEXT_002
[000b8cca]                           dc.w $1000
[000b8ccc]                           dc.w $0000
[000b8cce]                           dc.w $0000
[000b8cd0]                           dc.w $0000
[000b8cd2]                           dc.w $0000
[000b8cd4]                           dc.w $0020
[000b8cd6]                           dc.w $0020
[000b8cd8]                           dc.w $0008
[000b8cda]                           dc.w $0008
[000b8cdc]                           dc.w $0000
[000b8cde]                           dc.w $0000
[000b8ce0] 000b8ba8                  dc.l _C4_I_SPEC
_IMG_IMAGE_001:
[000b8ce4]                           dc.w $07ff
[000b8ce6]                           dc.w $ffff
[000b8ce8]                           dc.w $ff80
[000b8cea]                           dc.w $0c00
[000b8cec]                           dc.w $0000
[000b8cee]                           dc.w $00c0
[000b8cf0]                           dc.w $183f
[000b8cf2]                           dc.w $f03f
[000b8cf4]                           dc.w $f060
[000b8cf6]                           dc.w $187f
[000b8cf8]                           dc.w $f860
[000b8cfa]                           dc.w $1860
[000b8cfc]                           dc.w $187f
[000b8cfe]                           dc.w $f860
[000b8d00]                           dc.w $1860
[000b8d02]                           dc.w $187f
[000b8d04]                           dc.w $f860
[000b8d06]                           dc.w $1860
[000b8d08]                           dc.w $187f
[000b8d0a]                           dc.w $f860
[000b8d0c]                           dc.w $1860
[000b8d0e]                           dc.w $187f
[000b8d10]                           dc.w $f860
[000b8d12]                           dc.w $1860
[000b8d14]                           dc.w $187f
[000b8d16]                           dc.w $f860
[000b8d18]                           dc.w $1860
[000b8d1a]                           dc.w $187f
[000b8d1c]                           dc.w $f860
[000b8d1e]                           dc.w $1860
[000b8d20]                           dc.w $187f
[000b8d22]                           dc.w $f860
[000b8d24]                           dc.w $1860
[000b8d26]                           dc.w $187f
[000b8d28]                           dc.w $f860
[000b8d2a]                           dc.w $1860
[000b8d2c]                           dc.w $187f
[000b8d2e]                           dc.w $f860
[000b8d30]                           dc.w $1860
[000b8d32]                           dc.w $187f
[000b8d34]                           dc.w $f860
[000b8d36]                           dc.w $1860
[000b8d38]                           dc.w $183f
[000b8d3a]                           dc.w $f03f
[000b8d3c]                           dc.w $f060
[000b8d3e]                           dc.w $0c00
[000b8d40]                           dc.w $0000
[000b8d42]                           dc.w $00c0
[000b8d44]                           dc.w $07ff
[000b8d46]                           dc.w $ffff
[000b8d48]                           dc.w $ff80
[000b8d4a]                           dc.w $0000
[000b8d4c]                           dc.w $0000
[000b8d4e]                           dc.w $0000
[000b8d50]                           dc.w $3f30
[000b8d52]                           dc.w $c787
[000b8d54]                           dc.w $8fe0
[000b8d56]                           dc.w $0c39
[000b8d58]                           dc.w $cccc
[000b8d5a]                           dc.w $cc00
[000b8d5c]                           dc.w $0c36
[000b8d5e]                           dc.w $cfcc
[000b8d60]                           dc.w $0f80
[000b8d62]                           dc.w $0c30
[000b8d64]                           dc.w $cccd
[000b8d66]                           dc.w $cc00
[000b8d68]                           dc.w $3f30
[000b8d6a]                           dc.w $ccc7
[000b8d6c]                           dc.w $cfe0
[000b8d6e]                           dc.w $0000
[000b8d70]                           dc.w $0000
[000b8d72]                           dc.w $0000
IMAGE_001:
[000b8d74] 000b8ce4                  dc.l _IMG_IMAGE_001
[000b8d78]                           dc.w $0006
[000b8d7a]                           dc.w $0018
[000b8d7c]                           dc.w $0000
[000b8d7e]                           dc.w $0000
[000b8d80]                           dc.w $0001
PARTS:
[000b8d82]                           dc.w $ffff
[000b8d84]                           dc.w $0001
[000b8d86]                           dc.w $00a5
[000b8d88]                           dc.w $0018
[000b8d8a]                           dc.w $0000
[000b8d8c]                           dc.w $0010
[000b8d8e] 000b85ee                  dc.l A_3DBUTTON01
[000b8d92]                           dc.w $0000
[000b8d94]                           dc.w $0000
[000b8d96]                           dc.w $003b
[000b8d98]                           dc.w $0014
_01_PARTS:
[000b8d9a]                           dc.w $0003
[000b8d9c]                           dc.w $ffff
[000b8d9e]                           dc.w $ffff
[000b8da0]                           dc.w $001a
[000b8da2]                           dc.w $2000
[000b8da4]                           dc.w $0000
[000b8da6] 000b7b7f                  dc.l TEXT_039
[000b8daa]                           dc.w $0800
[000b8dac]                           dc.w $0800
[000b8dae]                           dc.w $000a
[000b8db0]                           dc.w $0001
_01aPARTS:
[000b8db2]                           dc.w $0000
[000b8db4]                           dc.w $0000
[000b8db6]                           dc.w $0000
[000b8db8]                           dc.w $0000
[000b8dba]                           dc.w $8000
[000b8dbc]                           dc.w $0000
[000b8dbe] 000bb496                  dc.l part_palette
[000b8dc2]                           dc.w $0000
[000b8dc4]                           dc.w $0000
[000b8dc6]                           dc.w $0000
[000b8dc8]                           dc.w $2af8
_03_PARTS:
[000b8dca]                           dc.w $0005
[000b8dcc]                           dc.w $ffff
[000b8dce]                           dc.w $ffff
[000b8dd0]                           dc.w $001c
[000b8dd2]                           dc.w $2000
[000b8dd4]                           dc.w $0000
[000b8dd6] 000b7b78                  dc.l TEXT_038
[000b8dda]                           dc.w $000c
[000b8ddc]                           dc.w $0001
[000b8dde]                           dc.w $0008
[000b8de0]                           dc.w $0001
_03aPARTS:
[000b8de2]                           dc.w $0000
[000b8de4]                           dc.w $0000
[000b8de6]                           dc.w $0000
[000b8de8]                           dc.w $0000
[000b8dea]                           dc.w $8000
[000b8dec]                           dc.w $0000
[000b8dee] 000bb496                  dc.l part_palette
[000b8df2]                           dc.w $0000
[000b8df4]                           dc.w $0001
[000b8df6]                           dc.w $0000
[000b8df8]                           dc.w $2af8
_05_PARTS:
[000b8dfa]                           dc.w $0007
[000b8dfc]                           dc.w $ffff
[000b8dfe]                           dc.w $ffff
[000b8e00]                           dc.w $001d
[000b8e02]                           dc.w $2000
[000b8e04]                           dc.w $0000
[000b8e06] 000b85b6                  dc.l TEDINFO_015
[000b8e0a]                           dc.w $0014
[000b8e0c]                           dc.w $0001
[000b8e0e]                           dc.w $000a
[000b8e10]                           dc.w $0001
_05aPARTS:
[000b8e12]                           dc.w $0000
[000b8e14]                           dc.w $0000
[000b8e16]                           dc.w $0000
[000b8e18]                           dc.w $0000
[000b8e1a]                           dc.w $8000
[000b8e1c]                           dc.w $0000
[000b8e1e] 000bb496                  dc.l part_palette
[000b8e22]                           dc.w $0000
[000b8e24]                           dc.w $0002
[000b8e26]                           dc.w $0000
[000b8e28]                           dc.w $2af8
_07_PARTS:
[000b8e2a]                           dc.w $0009
[000b8e2c]                           dc.w $ffff
[000b8e2e]                           dc.w $ffff
[000b8e30]                           dc.w $001e
[000b8e32]                           dc.w $2000
[000b8e34]                           dc.w $0000
[000b8e36] 000b85b6                  dc.l TEDINFO_015
[000b8e3a]                           dc.w $001f
[000b8e3c]                           dc.w $0001
[000b8e3e]                           dc.w $000a
[000b8e40]                           dc.w $0001
_07aPARTS:
[000b8e42]                           dc.w $0000
[000b8e44]                           dc.w $0000
[000b8e46]                           dc.w $0000
[000b8e48]                           dc.w $0000
[000b8e4a]                           dc.w $8000
[000b8e4c]                           dc.w $0000
[000b8e4e] 000bb496                  dc.l part_palette
[000b8e52]                           dc.w $0000
[000b8e54]                           dc.w $0003
[000b8e56]                           dc.w $0000
[000b8e58]                           dc.w $2af8
_09_PARTS:
[000b8e5a]                           dc.w $000b
[000b8e5c]                           dc.w $ffff
[000b8e5e]                           dc.w $ffff
[000b8e60]                           dc.w $0019
[000b8e62]                           dc.w $2000
[000b8e64]                           dc.w $0000
[000b8e66]                           dc.w $00ff
[000b8e68]                           dc.w $1101
[000b8e6a]                           dc.w $002b
[000b8e6c]                           dc.w $0001
[000b8e6e]                           dc.w $000a
[000b8e70]                           dc.w $0001
_09aPARTS:
[000b8e72]                           dc.w $0000
[000b8e74]                           dc.w $0000
[000b8e76]                           dc.w $0000
[000b8e78]                           dc.w $0000
[000b8e7a]                           dc.w $8000
[000b8e7c]                           dc.w $0000
[000b8e7e] 000bb496                  dc.l part_palette
[000b8e82]                           dc.w $0000
[000b8e84]                           dc.w $0004
[000b8e86]                           dc.w $0000
[000b8e88]                           dc.w $2af8
_11_PARTS:
[000b8e8a]                           dc.w $000d
[000b8e8c]                           dc.w $ffff
[000b8e8e]                           dc.w $ffff
[000b8e90]                           dc.w $0014
[000b8e92]                           dc.w $2000
[000b8e94]                           dc.w $0000
[000b8e96]                           dc.w $00ff
[000b8e98]                           dc.w $1101
[000b8e9a]                           dc.w $0001
[000b8e9c]                           dc.w $0003
[000b8e9e]                           dc.w $000a
[000b8ea0]                           dc.w $0001
_11aPARTS:
[000b8ea2]                           dc.w $0000
[000b8ea4]                           dc.w $0000
[000b8ea6]                           dc.w $0000
[000b8ea8]                           dc.w $0000
[000b8eaa]                           dc.w $8000
[000b8eac]                           dc.w $0000
[000b8eae] 000bb496                  dc.l part_palette
[000b8eb2]                           dc.w $0000
[000b8eb4]                           dc.w $0005
[000b8eb6]                           dc.w $0000
[000b8eb8]                           dc.w $2af8
_13_PARTS:
[000b8eba]                           dc.w $000f
[000b8ebc]                           dc.w $ffff
[000b8ebe]                           dc.w $ffff
[000b8ec0]                           dc.w $0015
[000b8ec2]                           dc.w $2000
[000b8ec4]                           dc.w $0000
[000b8ec6] 000b85d2                  dc.l TEDINFO_069
[000b8eca]                           dc.w $000c
[000b8ecc]                           dc.w $0003
[000b8ece]                           dc.w $0004
[000b8ed0]                           dc.w $0001
_13aPARTS:
[000b8ed2]                           dc.w $0000
[000b8ed4]                           dc.w $0000
[000b8ed6]                           dc.w $0000
[000b8ed8]                           dc.w $0000
[000b8eda]                           dc.w $8000
[000b8edc]                           dc.w $0000
[000b8ede] 000bb496                  dc.l part_palette
[000b8ee2]                           dc.w $0000
[000b8ee4]                           dc.w $0006
[000b8ee6]                           dc.w $0000
[000b8ee8]                           dc.w $2af8
_15_PARTS:
[000b8eea]                           dc.w $0011
[000b8eec]                           dc.w $ffff
[000b8eee]                           dc.w $ffff
[000b8ef0]                           dc.w $001b
[000b8ef2]                           dc.w $2000
[000b8ef4]                           dc.w $0000
[000b8ef6]                           dc.w $43ff
[000b8ef8]                           dc.w $1101
[000b8efa]                           dc.w $0015
[000b8efc]                           dc.w $0003
[000b8efe]                           dc.w $0008
[000b8f00]                           dc.w $0001
_15aPARTS:
[000b8f02]                           dc.w $0000
[000b8f04]                           dc.w $0000
[000b8f06]                           dc.w $0000
[000b8f08]                           dc.w $0000
[000b8f0a]                           dc.w $8000
[000b8f0c]                           dc.w $0000
[000b8f0e] 000bb496                  dc.l part_palette
[000b8f12]                           dc.w $0000
[000b8f14]                           dc.w $0007
[000b8f16]                           dc.w $0000
[000b8f18]                           dc.w $2af8
_17_PARTS:
[000b8f1a]                           dc.w $0013
[000b8f1c]                           dc.w $ffff
[000b8f1e]                           dc.w $ffff
[000b8f20]                           dc.w $0016
[000b8f22]                           dc.w $2000
[000b8f24]                           dc.w $0000
[000b8f26] 000b85d2                  dc.l TEDINFO_069
[000b8f2a]                           dc.w $001f
[000b8f2c]                           dc.w $0003
[000b8f2e]                           dc.w $000a
[000b8f30]                           dc.w $0001
_17aPARTS:
[000b8f32]                           dc.w $0000
[000b8f34]                           dc.w $0000
[000b8f36]                           dc.w $0000
[000b8f38]                           dc.w $0000
[000b8f3a]                           dc.w $8000
[000b8f3c]                           dc.w $0000
[000b8f3e] 000bb496                  dc.l part_palette
[000b8f42]                           dc.w $0000
[000b8f44]                           dc.w $0008
[000b8f46]                           dc.w $0000
[000b8f48]                           dc.w $2af8
_19_PARTS:
[000b8f4a]                           dc.w $0015
[000b8f4c]                           dc.w $ffff
[000b8f4e]                           dc.w $ffff
[000b8f50]                           dc.w $001a
[000b8f52]                           dc.w $2000
[000b8f54]                           dc.w $0000
[000b8f56] 000b7b86                  dc.l TEXT_040
[000b8f5a]                           dc.w $002b
[000b8f5c]                           dc.w $0003
[000b8f5e]                           dc.w $000a
[000b8f60]                           dc.w $0001
_19aPARTS:
[000b8f62]                           dc.w $0000
[000b8f64]                           dc.w $0000
[000b8f66]                           dc.w $0000
[000b8f68]                           dc.w $0000
[000b8f6a]                           dc.w $8000
[000b8f6c]                           dc.w $0000
[000b8f6e] 000bb496                  dc.l part_palette
[000b8f72]                           dc.w $0000
[000b8f74]                           dc.w $0009
[000b8f76]                           dc.w $0000
[000b8f78]                           dc.w $2af8
_21_PARTS:
[000b8f7a]                           dc.w $0017
[000b8f7c]                           dc.w $ffff
[000b8f7e]                           dc.w $ffff
[000b8f80]                           dc.w $0017
[000b8f82]                           dc.w $2000
[000b8f84]                           dc.w $0000
[000b8f86] 000b8d74                  dc.l IMAGE_001
[000b8f8a]                           dc.w $0001
[000b8f8c]                           dc.w $0005
[000b8f8e]                           dc.w $0006
[000b8f90]                           dc.w $0002
_21aPARTS:
[000b8f92]                           dc.w $0000
[000b8f94]                           dc.w $0000
[000b8f96]                           dc.w $0000
[000b8f98]                           dc.w $0000
[000b8f9a]                           dc.w $8000
[000b8f9c]                           dc.w $0000
[000b8f9e] 000bb496                  dc.l part_palette
[000b8fa2]                           dc.w $0000
[000b8fa4]                           dc.w $000a
[000b8fa6]                           dc.w $0000
[000b8fa8]                           dc.w $2af8
_23_PARTS:
[000b8faa]                           dc.w $0019
[000b8fac]                           dc.w $ffff
[000b8fae]                           dc.w $ffff
[000b8fb0]                           dc.w $001f
[000b8fb2]                           dc.w $2000
[000b8fb4]                           dc.w $0000
[000b8fb6] 000b87ce                  dc.l ICON_001
[000b8fba]                           dc.w $000c
[000b8fbc]                           dc.w $0005
[000b8fbe]                           dc.w $0006
[000b8fc0]                           dc.w $0002
_23aPARTS:
[000b8fc2]                           dc.w $0000
[000b8fc4]                           dc.w $0000
[000b8fc6]                           dc.w $0000
[000b8fc8]                           dc.w $0000
[000b8fca]                           dc.w $8000
[000b8fcc]                           dc.w $0000
[000b8fce] 000bb496                  dc.l part_palette
[000b8fd2]                           dc.w $0000
[000b8fd4]                           dc.w $000b
[000b8fd6]                           dc.w $0000
[000b8fd8]                           dc.w $2af8
_25_PARTS:
[000b8fda]                           dc.w $001b
[000b8fdc]                           dc.w $ffff
[000b8fde]                           dc.w $ffff
[000b8fe0]                           dc.w $001a
[000b8fe2]                           dc.w $2000
[000b8fe4]                           dc.w $0000
[000b8fe6] 000b7b91                  dc.l TEXT_258
[000b8fea]                           dc.w $0015
[000b8fec]                           dc.w $0005
[000b8fee]                           dc.w $000a
[000b8ff0]                           dc.w $0002
_25aPARTS:
[000b8ff2]                           dc.w $0000
[000b8ff4]                           dc.w $0000
[000b8ff6]                           dc.w $0000
[000b8ff8]                           dc.w $0000
[000b8ffa]                           dc.w $8000
[000b8ffc]                           dc.w $0000
[000b8ffe] 000bb496                  dc.l part_palette
[000b9002]                           dc.w $0000
[000b9004]                           dc.w $000c
[000b9006]                           dc.w $0000
[000b9008]                           dc.w $2af8
_27_PARTS:
[000b900a]                           dc.w $001e
[000b900c]                           dc.w $001c
[000b900e]                           dc.w $001c
[000b9010]                           dc.w $0019
[000b9012]                           dc.w $0080
[000b9014]                           dc.w $0000
[000b9016]                           dc.w $0001
[000b9018]                           dc.w $1101
[000b901a]                           dc.w $0002
[000b901c]                           dc.w $0008
[000b901e]                           dc.w $0005
[000b9020]                           dc.w $0001
_28_PARTS:
[000b9022]                           dc.w $001b
[000b9024]                           dc.w $ffff
[000b9026]                           dc.w $ffff
[000b9028]                           dc.w $0019
[000b902a]                           dc.w $2000
[000b902c]                           dc.w $0000
[000b902e]                           dc.w $0000
[000b9030]                           dc.w $1101
[000b9032]                           dc.w $0000
[000b9034]                           dc.w $0000
[000b9036]                           dc.w $0002
[000b9038]                           dc.w $0001
_28aPARTS:
[000b903a]                           dc.w $0000
[000b903c]                           dc.w $0000
[000b903e]                           dc.w $0000
[000b9040]                           dc.w $0000
[000b9042]                           dc.w $8000
[000b9044]                           dc.w $0000
[000b9046] 000bb496                  dc.l part_palette
[000b904a]                           dc.w $0000
[000b904c]                           dc.w $000d
[000b904e]                           dc.w $0000
[000b9050]                           dc.w $2af8
_30_PARTS:
[000b9052]                           dc.w $0021
[000b9054]                           dc.w $001f
[000b9056]                           dc.w $001f
[000b9058]                           dc.w $0019
[000b905a]                           dc.w $0080
[000b905c]                           dc.w $0000
[000b905e]                           dc.w $0001
[000b9060]                           dc.w $1101
[000b9062]                           dc.w $0009
[000b9064]                           dc.w $0008
[000b9066]                           dc.w $0005
[000b9068]                           dc.w $0001
_31_PARTS:
[000b906a]                           dc.w $001e
[000b906c]                           dc.w $ffff
[000b906e]                           dc.w $ffff
[000b9070]                           dc.w $0019
[000b9072]                           dc.w $2000
[000b9074]                           dc.w $0000
[000b9076]                           dc.w $0000
[000b9078]                           dc.w $1101
[000b907a]                           dc.w $0000
[000b907c]                           dc.w $0000
[000b907e]                           dc.w $0002
[000b9080]                           dc.w $0001
_31aPARTS:
[000b9082]                           dc.w $0000
[000b9084]                           dc.w $0000
[000b9086]                           dc.w $0000
[000b9088]                           dc.w $0000
[000b908a]                           dc.w $8000
[000b908c]                           dc.w $0000
[000b908e] 000bb496                  dc.l part_palette
[000b9092]                           dc.w $0000
[000b9094]                           dc.w $000e
[000b9096]                           dc.w $0000
[000b9098]                           dc.w $2af8
_33_PARTS:
[000b909a]                           dc.w $0024
[000b909c]                           dc.w $0022
[000b909e]                           dc.w $0022
[000b90a0]                           dc.w $0019
[000b90a2]                           dc.w $0080
[000b90a4]                           dc.w $0000
[000b90a6]                           dc.w $0001
[000b90a8]                           dc.w $1101
[000b90aa]                           dc.w $0010
[000b90ac]                           dc.w $0008
[000b90ae]                           dc.w $0005
[000b90b0]                           dc.w $0001
_34_PARTS:
[000b90b2]                           dc.w $0021
[000b90b4]                           dc.w $ffff
[000b90b6]                           dc.w $ffff
[000b90b8]                           dc.w $0019
[000b90ba]                           dc.w $2000
[000b90bc]                           dc.w $0000
[000b90be]                           dc.w $0000
[000b90c0]                           dc.w $1101
[000b90c2]                           dc.w $0000
[000b90c4]                           dc.w $0000
[000b90c6]                           dc.w $0002
[000b90c8]                           dc.w $0001
_34aPARTS:
[000b90ca]                           dc.w $0000
[000b90cc]                           dc.w $0000
[000b90ce]                           dc.w $0000
[000b90d0]                           dc.w $0000
[000b90d2]                           dc.w $8000
[000b90d4]                           dc.w $0000
[000b90d6] 000bb496                  dc.l part_palette
[000b90da]                           dc.w $0000
[000b90dc]                           dc.w $000f
[000b90de]                           dc.w $0000
[000b90e0]                           dc.w $2af8
_36_PARTS:
[000b90e2]                           dc.w $0027
[000b90e4]                           dc.w $0025
[000b90e6]                           dc.w $0025
[000b90e8]                           dc.w $0019
[000b90ea]                           dc.w $0080
[000b90ec]                           dc.w $0000
[000b90ee]                           dc.w $0001
[000b90f0]                           dc.w $1101
[000b90f2]                           dc.w $0017
[000b90f4]                           dc.w $0008
[000b90f6]                           dc.w $0005
[000b90f8]                           dc.w $0001
_37_PARTS:
[000b90fa]                           dc.w $0024
[000b90fc]                           dc.w $ffff
[000b90fe]                           dc.w $ffff
[000b9100]                           dc.w $0019
[000b9102]                           dc.w $2000
[000b9104]                           dc.w $0000
[000b9106]                           dc.w $0000
[000b9108]                           dc.w $1101
[000b910a]                           dc.w $0000
[000b910c]                           dc.w $0000
[000b910e]                           dc.w $0002
[000b9110]                           dc.w $0001
_37aPARTS:
[000b9112]                           dc.w $0000
[000b9114]                           dc.w $0000
[000b9116]                           dc.w $0000
[000b9118]                           dc.w $0000
[000b911a]                           dc.w $8000
[000b911c]                           dc.w $0000
[000b911e] 000bb496                  dc.l part_palette
[000b9122]                           dc.w $0000
[000b9124]                           dc.w $0010
[000b9126]                           dc.w $0000
[000b9128]                           dc.w $2af8
_39_PARTS:
[000b912a]                           dc.w $002a
[000b912c]                           dc.w $0028
[000b912e]                           dc.w $0028
[000b9130]                           dc.w $0019
[000b9132]                           dc.w $0080
[000b9134]                           dc.w $0000
[000b9136]                           dc.w $0001
[000b9138]                           dc.w $1101
[000b913a]                           dc.w $001e
[000b913c]                           dc.w $0008
[000b913e]                           dc.w $0005
[000b9140]                           dc.w $0001
_40_PARTS:
[000b9142]                           dc.w $0027
[000b9144]                           dc.w $ffff
[000b9146]                           dc.w $ffff
[000b9148]                           dc.w $0019
[000b914a]                           dc.w $2000
[000b914c]                           dc.w $0000
[000b914e]                           dc.w $0000
[000b9150]                           dc.w $1101
[000b9152]                           dc.w $0000
[000b9154]                           dc.w $0000
[000b9156]                           dc.w $0002
[000b9158]                           dc.w $0001
_40aPARTS:
[000b915a]                           dc.w $0000
[000b915c]                           dc.w $0000
[000b915e]                           dc.w $0000
[000b9160]                           dc.w $0000
[000b9162]                           dc.w $8000
[000b9164]                           dc.w $0000
[000b9166] 000bb496                  dc.l part_palette
[000b916a]                           dc.w $0000
[000b916c]                           dc.w $0011
[000b916e]                           dc.w $0000
[000b9170]                           dc.w $2af8
_42_PARTS:
[000b9172]                           dc.w $002d
[000b9174]                           dc.w $002b
[000b9176]                           dc.w $002b
[000b9178]                           dc.w $0019
[000b917a]                           dc.w $0080
[000b917c]                           dc.w $0000
[000b917e]                           dc.w $0001
[000b9180]                           dc.w $1101
[000b9182]                           dc.w $0025
[000b9184]                           dc.w $0008
[000b9186]                           dc.w $0005
[000b9188]                           dc.w $0001
_43_PARTS:
[000b918a]                           dc.w $002a
[000b918c]                           dc.w $ffff
[000b918e]                           dc.w $ffff
[000b9190]                           dc.w $0019
[000b9192]                           dc.w $2000
[000b9194]                           dc.w $0000
[000b9196]                           dc.w $0000
[000b9198]                           dc.w $1101
[000b919a]                           dc.w $0000
[000b919c]                           dc.w $0000
[000b919e]                           dc.w $0002
[000b91a0]                           dc.w $0001
_43aPARTS:
[000b91a2]                           dc.w $0000
[000b91a4]                           dc.w $0000
[000b91a6]                           dc.w $0000
[000b91a8]                           dc.w $0000
[000b91aa]                           dc.w $8000
[000b91ac]                           dc.w $0000
[000b91ae] 000bb496                  dc.l part_palette
[000b91b2]                           dc.w $0000
[000b91b4]                           dc.w $0012
[000b91b6]                           dc.w $0000
[000b91b8]                           dc.w $2af8
_45_PARTS:
[000b91ba]                           dc.w $0030
[000b91bc]                           dc.w $002e
[000b91be]                           dc.w $002e
[000b91c0]                           dc.w $0019
[000b91c2]                           dc.w $0080
[000b91c4]                           dc.w $0000
[000b91c6]                           dc.w $0001
[000b91c8]                           dc.w $1101
[000b91ca]                           dc.w $002c
[000b91cc]                           dc.w $0008
[000b91ce]                           dc.w $0005
[000b91d0]                           dc.w $0001
_46_PARTS:
[000b91d2]                           dc.w $002d
[000b91d4]                           dc.w $ffff
[000b91d6]                           dc.w $ffff
[000b91d8]                           dc.w $0019
[000b91da]                           dc.w $2000
[000b91dc]                           dc.w $0000
[000b91de]                           dc.w $0000
[000b91e0]                           dc.w $1101
[000b91e2]                           dc.w $0000
[000b91e4]                           dc.w $0000
[000b91e6]                           dc.w $0002
[000b91e8]                           dc.w $0001
_46aPARTS:
[000b91ea]                           dc.w $0000
[000b91ec]                           dc.w $0000
[000b91ee]                           dc.w $0000
[000b91f0]                           dc.w $0000
[000b91f2]                           dc.w $8000
[000b91f4]                           dc.w $0000
[000b91f6] 000bb496                  dc.l part_palette
[000b91fa]                           dc.w $0000
[000b91fc]                           dc.w $0013
[000b91fe]                           dc.w $0000
[000b9200]                           dc.w $2af8
_48_PARTS:
[000b9202]                           dc.w $0033
[000b9204]                           dc.w $0031
[000b9206]                           dc.w $0031
[000b9208]                           dc.w $0019
[000b920a]                           dc.w $0080
[000b920c]                           dc.w $0000
[000b920e]                           dc.w $0001
[000b9210]                           dc.w $1101
[000b9212]                           dc.w $0002
[000b9214]                           dc.w $000a
[000b9216]                           dc.w $0005
[000b9218]                           dc.w $0001
_49_PARTS:
[000b921a]                           dc.w $0030
[000b921c]                           dc.w $ffff
[000b921e]                           dc.w $ffff
[000b9220]                           dc.w $0019
[000b9222]                           dc.w $2000
[000b9224]                           dc.w $0000
[000b9226]                           dc.w $0000
[000b9228]                           dc.w $1101
[000b922a]                           dc.w $0000
[000b922c]                           dc.w $0000
[000b922e]                           dc.w $0002
[000b9230]                           dc.w $0001
_49aPARTS:
[000b9232]                           dc.w $0000
[000b9234]                           dc.w $0000
[000b9236]                           dc.w $0000
[000b9238]                           dc.w $0000
[000b923a]                           dc.w $8000
[000b923c]                           dc.w $0000
[000b923e] 000bb496                  dc.l part_palette
[000b9242]                           dc.w $0000
[000b9244]                           dc.w $0014
[000b9246]                           dc.w $0000
[000b9248]                           dc.w $2af8
_51_PARTS:
[000b924a]                           dc.w $0036
[000b924c]                           dc.w $0034
[000b924e]                           dc.w $0034
[000b9250]                           dc.w $0019
[000b9252]                           dc.w $0080
[000b9254]                           dc.w $0000
[000b9256]                           dc.w $0001
[000b9258]                           dc.w $1101
[000b925a]                           dc.w $0009
[000b925c]                           dc.w $000a
[000b925e]                           dc.w $0005
[000b9260]                           dc.w $0001
_52_PARTS:
[000b9262]                           dc.w $0033
[000b9264]                           dc.w $ffff
[000b9266]                           dc.w $ffff
[000b9268]                           dc.w $0019
[000b926a]                           dc.w $2000
[000b926c]                           dc.w $0000
[000b926e]                           dc.w $0000
[000b9270]                           dc.w $1101
[000b9272]                           dc.w $0000
[000b9274]                           dc.w $0000
[000b9276]                           dc.w $0002
[000b9278]                           dc.w $0001
_52aPARTS:
[000b927a]                           dc.w $0000
[000b927c]                           dc.w $0000
[000b927e]                           dc.w $0000
[000b9280]                           dc.w $0000
[000b9282]                           dc.w $8000
[000b9284]                           dc.w $0000
[000b9286] 000bb496                  dc.l part_palette
[000b928a]                           dc.w $0000
[000b928c]                           dc.w $0015
[000b928e]                           dc.w $0000
[000b9290]                           dc.w $2af8
_54_PARTS:
[000b9292]                           dc.w $0039
[000b9294]                           dc.w $0037
[000b9296]                           dc.w $0037
[000b9298]                           dc.w $0019
[000b929a]                           dc.w $0080
[000b929c]                           dc.w $0000
[000b929e]                           dc.w $0001
[000b92a0]                           dc.w $1101
[000b92a2]                           dc.w $0010
[000b92a4]                           dc.w $000a
[000b92a6]                           dc.w $0005
[000b92a8]                           dc.w $0001
_55_PARTS:
[000b92aa]                           dc.w $0036
[000b92ac]                           dc.w $ffff
[000b92ae]                           dc.w $ffff
[000b92b0]                           dc.w $0019
[000b92b2]                           dc.w $2000
[000b92b4]                           dc.w $0000
[000b92b6]                           dc.w $0000
[000b92b8]                           dc.w $1101
[000b92ba]                           dc.w $0000
[000b92bc]                           dc.w $0000
[000b92be]                           dc.w $0002
[000b92c0]                           dc.w $0001
_55aPARTS:
[000b92c2]                           dc.w $0000
[000b92c4]                           dc.w $0000
[000b92c6]                           dc.w $0000
[000b92c8]                           dc.w $0000
[000b92ca]                           dc.w $8000
[000b92cc]                           dc.w $0000
[000b92ce] 000bb496                  dc.l part_palette
[000b92d2]                           dc.w $0000
[000b92d4]                           dc.w $0016
[000b92d6]                           dc.w $0000
[000b92d8]                           dc.w $2af8
_57_PARTS:
[000b92da]                           dc.w $003c
[000b92dc]                           dc.w $003a
[000b92de]                           dc.w $003a
[000b92e0]                           dc.w $0019
[000b92e2]                           dc.w $0080
[000b92e4]                           dc.w $0000
[000b92e6]                           dc.w $0001
[000b92e8]                           dc.w $1101
[000b92ea]                           dc.w $0017
[000b92ec]                           dc.w $000a
[000b92ee]                           dc.w $0005
[000b92f0]                           dc.w $0001
_58_PARTS:
[000b92f2]                           dc.w $0039
[000b92f4]                           dc.w $ffff
[000b92f6]                           dc.w $ffff
[000b92f8]                           dc.w $0019
[000b92fa]                           dc.w $2000
[000b92fc]                           dc.w $0000
[000b92fe]                           dc.w $0000
[000b9300]                           dc.w $1101
[000b9302]                           dc.w $0000
[000b9304]                           dc.w $0000
[000b9306]                           dc.w $0002
[000b9308]                           dc.w $0001
_58aPARTS:
[000b930a]                           dc.w $0000
[000b930c]                           dc.w $0000
[000b930e]                           dc.w $0000
[000b9310]                           dc.w $0000
[000b9312]                           dc.w $8000
[000b9314]                           dc.w $0000
[000b9316] 000bb496                  dc.l part_palette
[000b931a]                           dc.w $0000
[000b931c]                           dc.w $0017
[000b931e]                           dc.w $0000
[000b9320]                           dc.w $2af8
_60_PARTS:
[000b9322]                           dc.w $003f
[000b9324]                           dc.w $003d
[000b9326]                           dc.w $003d
[000b9328]                           dc.w $0019
[000b932a]                           dc.w $0080
[000b932c]                           dc.w $0000
[000b932e]                           dc.w $0001
[000b9330]                           dc.w $1101
[000b9332]                           dc.w $001e
[000b9334]                           dc.w $000a
[000b9336]                           dc.w $0005
[000b9338]                           dc.w $0001
_61_PARTS:
[000b933a]                           dc.w $003c
[000b933c]                           dc.w $ffff
[000b933e]                           dc.w $ffff
[000b9340]                           dc.w $0019
[000b9342]                           dc.w $2000
[000b9344]                           dc.w $0000
[000b9346]                           dc.w $0000
[000b9348]                           dc.w $1101
[000b934a]                           dc.w $0000
[000b934c]                           dc.w $0000
[000b934e]                           dc.w $0002
[000b9350]                           dc.w $0001
_61aPARTS:
[000b9352]                           dc.w $0000
[000b9354]                           dc.w $0000
[000b9356]                           dc.w $0000
[000b9358]                           dc.w $0000
[000b935a]                           dc.w $8000
[000b935c]                           dc.w $0000
[000b935e] 000bb496                  dc.l part_palette
[000b9362]                           dc.w $0000
[000b9364]                           dc.w $0018
[000b9366]                           dc.w $0000
[000b9368]                           dc.w $2af8
_63_PARTS:
[000b936a]                           dc.w $0042
[000b936c]                           dc.w $0040
[000b936e]                           dc.w $0040
[000b9370]                           dc.w $0019
[000b9372]                           dc.w $0080
[000b9374]                           dc.w $0000
[000b9376]                           dc.w $0001
[000b9378]                           dc.w $1101
[000b937a]                           dc.w $0025
[000b937c]                           dc.w $000a
[000b937e]                           dc.w $0005
[000b9380]                           dc.w $0001
_64_PARTS:
[000b9382]                           dc.w $003f
[000b9384]                           dc.w $ffff
[000b9386]                           dc.w $ffff
[000b9388]                           dc.w $0019
[000b938a]                           dc.w $2000
[000b938c]                           dc.w $0000
[000b938e]                           dc.w $0000
[000b9390]                           dc.w $1101
[000b9392]                           dc.w $0000
[000b9394]                           dc.w $0000
[000b9396]                           dc.w $0002
[000b9398]                           dc.w $0001
_64aPARTS:
[000b939a]                           dc.w $0000
[000b939c]                           dc.w $0000
[000b939e]                           dc.w $0000
[000b93a0]                           dc.w $0000
[000b93a2]                           dc.w $8000
[000b93a4]                           dc.w $0000
[000b93a6] 000bb496                  dc.l part_palette
[000b93aa]                           dc.w $0000
[000b93ac]                           dc.w $0019
[000b93ae]                           dc.w $0000
[000b93b0]                           dc.w $2af8
_66_PARTS:
[000b93b2]                           dc.w $0045
[000b93b4]                           dc.w $0043
[000b93b6]                           dc.w $0043
[000b93b8]                           dc.w $0019
[000b93ba]                           dc.w $0080
[000b93bc]                           dc.w $0000
[000b93be]                           dc.w $0001
[000b93c0]                           dc.w $1101
[000b93c2]                           dc.w $002c
[000b93c4]                           dc.w $000a
[000b93c6]                           dc.w $0005
[000b93c8]                           dc.w $0001
_67_PARTS:
[000b93ca]                           dc.w $0042
[000b93cc]                           dc.w $ffff
[000b93ce]                           dc.w $ffff
[000b93d0]                           dc.w $0019
[000b93d2]                           dc.w $2000
[000b93d4]                           dc.w $0000
[000b93d6]                           dc.w $0000
[000b93d8]                           dc.w $1101
[000b93da]                           dc.w $0000
[000b93dc]                           dc.w $0000
[000b93de]                           dc.w $0002
[000b93e0]                           dc.w $0001
_67aPARTS:
[000b93e2]                           dc.w $0000
[000b93e4]                           dc.w $0000
[000b93e6]                           dc.w $0000
[000b93e8]                           dc.w $0000
[000b93ea]                           dc.w $8000
[000b93ec]                           dc.w $0000
[000b93ee] 000bb496                  dc.l part_palette
[000b93f2]                           dc.w $0000
[000b93f4]                           dc.w $001a
[000b93f6]                           dc.w $0000
[000b93f8]                           dc.w $2af8
_69_PARTS:
[000b93fa]                           dc.w $0048
[000b93fc]                           dc.w $0046
[000b93fe]                           dc.w $0046
[000b9400]                           dc.w $0019
[000b9402]                           dc.w $0080
[000b9404]                           dc.w $0000
[000b9406]                           dc.w $0001
[000b9408]                           dc.w $1101
[000b940a]                           dc.w $0033
[000b940c]                           dc.w $000a
[000b940e]                           dc.w $0005
[000b9410]                           dc.w $0001
_70_PARTS:
[000b9412]                           dc.w $0045
[000b9414]                           dc.w $ffff
[000b9416]                           dc.w $ffff
[000b9418]                           dc.w $0019
[000b941a]                           dc.w $2000
[000b941c]                           dc.w $0000
[000b941e]                           dc.w $0000
[000b9420]                           dc.w $1101
[000b9422]                           dc.w $0000
[000b9424]                           dc.w $0000
[000b9426]                           dc.w $0002
[000b9428]                           dc.w $0001
_70aPARTS:
[000b942a]                           dc.w $0000
[000b942c]                           dc.w $0000
[000b942e]                           dc.w $0000
[000b9430]                           dc.w $0000
[000b9432]                           dc.w $8000
[000b9434]                           dc.w $0000
[000b9436] 000bb496                  dc.l part_palette
[000b943a]                           dc.w $0000
[000b943c]                           dc.w $001b
[000b943e]                           dc.w $0000
[000b9440]                           dc.w $2af8
_72_PARTS:
[000b9442]                           dc.w $004b
[000b9444]                           dc.w $0049
[000b9446]                           dc.w $0049
[000b9448]                           dc.w $0019
[000b944a]                           dc.w $0080
[000b944c]                           dc.w $0000
[000b944e]                           dc.w $0001
[000b9450]                           dc.w $1101
[000b9452]                           dc.w $0002
[000b9454]                           dc.w $000c
[000b9456]                           dc.w $0005
[000b9458]                           dc.w $0001
_73_PARTS:
[000b945a]                           dc.w $0048
[000b945c]                           dc.w $ffff
[000b945e]                           dc.w $ffff
[000b9460]                           dc.w $0019
[000b9462]                           dc.w $2000
[000b9464]                           dc.w $0000
[000b9466]                           dc.w $0000
[000b9468]                           dc.w $1101
[000b946a]                           dc.w $0000
[000b946c]                           dc.w $0000
[000b946e]                           dc.w $0002
[000b9470]                           dc.w $0001
_73aPARTS:
[000b9472]                           dc.w $0000
[000b9474]                           dc.w $0000
[000b9476]                           dc.w $0000
[000b9478]                           dc.w $0000
[000b947a]                           dc.w $8000
[000b947c]                           dc.w $0000
[000b947e] 000bb496                  dc.l part_palette
[000b9482]                           dc.w $0000
[000b9484]                           dc.w $001c
[000b9486]                           dc.w $0000
[000b9488]                           dc.w $2af8
_75_PARTS:
[000b948a]                           dc.w $004e
[000b948c]                           dc.w $004c
[000b948e]                           dc.w $004c
[000b9490]                           dc.w $0019
[000b9492]                           dc.w $0080
[000b9494]                           dc.w $0000
[000b9496]                           dc.w $0001
[000b9498]                           dc.w $1101
[000b949a]                           dc.w $0009
[000b949c]                           dc.w $000c
[000b949e]                           dc.w $0005
[000b94a0]                           dc.w $0001
_76_PARTS:
[000b94a2]                           dc.w $004b
[000b94a4]                           dc.w $ffff
[000b94a6]                           dc.w $ffff
[000b94a8]                           dc.w $0019
[000b94aa]                           dc.w $2000
[000b94ac]                           dc.w $0000
[000b94ae]                           dc.w $0000
[000b94b0]                           dc.w $1101
[000b94b2]                           dc.w $0000
[000b94b4]                           dc.w $0000
[000b94b6]                           dc.w $0002
[000b94b8]                           dc.w $0001
_76aPARTS:
[000b94ba]                           dc.w $0000
[000b94bc]                           dc.w $0000
[000b94be]                           dc.w $0000
[000b94c0]                           dc.w $0000
[000b94c2]                           dc.w $8000
[000b94c4]                           dc.w $0000
[000b94c6] 000bb496                  dc.l part_palette
[000b94ca]                           dc.w $0000
[000b94cc]                           dc.w $001d
[000b94ce]                           dc.w $0000
[000b94d0]                           dc.w $2af8
_78_PARTS:
[000b94d2]                           dc.w $0051
[000b94d4]                           dc.w $004f
[000b94d6]                           dc.w $004f
[000b94d8]                           dc.w $0019
[000b94da]                           dc.w $0080
[000b94dc]                           dc.w $0000
[000b94de]                           dc.w $0001
[000b94e0]                           dc.w $1101
[000b94e2]                           dc.w $0010
[000b94e4]                           dc.w $000c
[000b94e6]                           dc.w $0005
[000b94e8]                           dc.w $0001
_79_PARTS:
[000b94ea]                           dc.w $004e
[000b94ec]                           dc.w $ffff
[000b94ee]                           dc.w $ffff
[000b94f0]                           dc.w $0019
[000b94f2]                           dc.w $2000
[000b94f4]                           dc.w $0000
[000b94f6]                           dc.w $0000
[000b94f8]                           dc.w $1101
[000b94fa]                           dc.w $0000
[000b94fc]                           dc.w $0000
[000b94fe]                           dc.w $0002
[000b9500]                           dc.w $0001
_79aPARTS:
[000b9502]                           dc.w $0000
[000b9504]                           dc.w $0000
[000b9506]                           dc.w $0000
[000b9508]                           dc.w $0000
[000b950a]                           dc.w $8000
[000b950c]                           dc.w $0000
[000b950e] 000bb496                  dc.l part_palette
[000b9512]                           dc.w $0000
[000b9514]                           dc.w $001e
[000b9516]                           dc.w $0000
[000b9518]                           dc.w $2af8
_81_PARTS:
[000b951a]                           dc.w $0054
[000b951c]                           dc.w $0052
[000b951e]                           dc.w $0052
[000b9520]                           dc.w $0019
[000b9522]                           dc.w $0080
[000b9524]                           dc.w $0000
[000b9526]                           dc.w $0001
[000b9528]                           dc.w $1101
[000b952a]                           dc.w $0017
[000b952c]                           dc.w $000c
[000b952e]                           dc.w $0005
[000b9530]                           dc.w $0001
_82_PARTS:
[000b9532]                           dc.w $0051
[000b9534]                           dc.w $ffff
[000b9536]                           dc.w $ffff
[000b9538]                           dc.w $0019
[000b953a]                           dc.w $2000
[000b953c]                           dc.w $0000
[000b953e]                           dc.w $0000
[000b9540]                           dc.w $1101
[000b9542]                           dc.w $0000
[000b9544]                           dc.w $0000
[000b9546]                           dc.w $0002
[000b9548]                           dc.w $0001
_82aPARTS:
[000b954a]                           dc.w $0000
[000b954c]                           dc.w $0000
[000b954e]                           dc.w $0000
[000b9550]                           dc.w $0000
[000b9552]                           dc.w $8000
[000b9554]                           dc.w $0000
[000b9556] 000bb496                  dc.l part_palette
[000b955a]                           dc.w $0000
[000b955c]                           dc.w $001f
[000b955e]                           dc.w $0000
[000b9560]                           dc.w $2af8
_84_PARTS:
[000b9562]                           dc.w $0057
[000b9564]                           dc.w $0055
[000b9566]                           dc.w $0055
[000b9568]                           dc.w $0019
[000b956a]                           dc.w $0080
[000b956c]                           dc.w $0000
[000b956e]                           dc.w $0001
[000b9570]                           dc.w $1101
[000b9572]                           dc.w $001e
[000b9574]                           dc.w $000c
[000b9576]                           dc.w $0005
[000b9578]                           dc.w $0001
_85_PARTS:
[000b957a]                           dc.w $0054
[000b957c]                           dc.w $ffff
[000b957e]                           dc.w $ffff
[000b9580]                           dc.w $0019
[000b9582]                           dc.w $2000
[000b9584]                           dc.w $0000
[000b9586]                           dc.w $0000
[000b9588]                           dc.w $1101
[000b958a]                           dc.w $0000
[000b958c]                           dc.w $0000
[000b958e]                           dc.w $0002
[000b9590]                           dc.w $0001
_85aPARTS:
[000b9592]                           dc.w $0000
[000b9594]                           dc.w $0000
[000b9596]                           dc.w $0000
[000b9598]                           dc.w $0000
[000b959a]                           dc.w $8000
[000b959c]                           dc.w $0000
[000b959e] 000bb496                  dc.l part_palette
[000b95a2]                           dc.w $0000
[000b95a4]                           dc.w $0020
[000b95a6]                           dc.w $0000
[000b95a8]                           dc.w $2af8
_87_PARTS:
[000b95aa]                           dc.w $005a
[000b95ac]                           dc.w $0058
[000b95ae]                           dc.w $0058
[000b95b0]                           dc.w $0019
[000b95b2]                           dc.w $0080
[000b95b4]                           dc.w $0000
[000b95b6]                           dc.w $0001
[000b95b8]                           dc.w $1101
[000b95ba]                           dc.w $0025
[000b95bc]                           dc.w $000c
[000b95be]                           dc.w $0005
[000b95c0]                           dc.w $0001
_88_PARTS:
[000b95c2]                           dc.w $0057
[000b95c4]                           dc.w $ffff
[000b95c6]                           dc.w $ffff
[000b95c8]                           dc.w $0019
[000b95ca]                           dc.w $2000
[000b95cc]                           dc.w $0000
[000b95ce]                           dc.w $0000
[000b95d0]                           dc.w $1101
[000b95d2]                           dc.w $0000
[000b95d4]                           dc.w $0000
[000b95d6]                           dc.w $0002
[000b95d8]                           dc.w $0001
_88aPARTS:
[000b95da]                           dc.w $0000
[000b95dc]                           dc.w $0000
[000b95de]                           dc.w $0000
[000b95e0]                           dc.w $0000
[000b95e2]                           dc.w $8000
[000b95e4]                           dc.w $0000
[000b95e6] 000bb496                  dc.l part_palette
[000b95ea]                           dc.w $0000
[000b95ec]                           dc.w $0021
[000b95ee]                           dc.w $0000
[000b95f0]                           dc.w $2af8
_90_PARTS:
[000b95f2]                           dc.w $005d
[000b95f4]                           dc.w $005b
[000b95f6]                           dc.w $005b
[000b95f8]                           dc.w $0019
[000b95fa]                           dc.w $0080
[000b95fc]                           dc.w $0000
[000b95fe]                           dc.w $0001
[000b9600]                           dc.w $1101
[000b9602]                           dc.w $002c
[000b9604]                           dc.w $000c
[000b9606]                           dc.w $0005
[000b9608]                           dc.w $0001
_91_PARTS:
[000b960a]                           dc.w $005a
[000b960c]                           dc.w $ffff
[000b960e]                           dc.w $ffff
[000b9610]                           dc.w $0019
[000b9612]                           dc.w $2000
[000b9614]                           dc.w $0000
[000b9616]                           dc.w $0000
[000b9618]                           dc.w $1101
[000b961a]                           dc.w $0000
[000b961c]                           dc.w $0000
[000b961e]                           dc.w $0002
[000b9620]                           dc.w $0001
_91aPARTS:
[000b9622]                           dc.w $0000
[000b9624]                           dc.w $0000
[000b9626]                           dc.w $0000
[000b9628]                           dc.w $0000
[000b962a]                           dc.w $8000
[000b962c]                           dc.w $0000
[000b962e] 000bb496                  dc.l part_palette
[000b9632]                           dc.w $0000
[000b9634]                           dc.w $0022
[000b9636]                           dc.w $0000
[000b9638]                           dc.w $2af8
_93_PARTS:
[000b963a]                           dc.w $0060
[000b963c]                           dc.w $005e
[000b963e]                           dc.w $005e
[000b9640]                           dc.w $0019
[000b9642]                           dc.w $0080
[000b9644]                           dc.w $0000
[000b9646]                           dc.w $0001
[000b9648]                           dc.w $1101
[000b964a]                           dc.w $0033
[000b964c]                           dc.w $000c
[000b964e]                           dc.w $0005
[000b9650]                           dc.w $0001
_94_PARTS:
[000b9652]                           dc.w $005d
[000b9654]                           dc.w $ffff
[000b9656]                           dc.w $ffff
[000b9658]                           dc.w $0019
[000b965a]                           dc.w $2000
[000b965c]                           dc.w $0000
[000b965e]                           dc.w $0000
[000b9660]                           dc.w $1101
[000b9662]                           dc.w $0000
[000b9664]                           dc.w $0000
[000b9666]                           dc.w $0002
[000b9668]                           dc.w $0001
_94aPARTS:
[000b966a]                           dc.w $0000
[000b966c]                           dc.w $0000
[000b966e]                           dc.w $0000
[000b9670]                           dc.w $0000
[000b9672]                           dc.w $8000
[000b9674]                           dc.w $0000
[000b9676] 000bb496                  dc.l part_palette
[000b967a]                           dc.w $0000
[000b967c]                           dc.w $0023
[000b967e]                           dc.w $0000
[000b9680]                           dc.w $2af8
_96_PARTS:
[000b9682]                           dc.w $0063
[000b9684]                           dc.w $0061
[000b9686]                           dc.w $0061
[000b9688]                           dc.w $0019
[000b968a]                           dc.w $0080
[000b968c]                           dc.w $0000
[000b968e]                           dc.w $0001
[000b9690]                           dc.w $1101
[000b9692]                           dc.w $0002
[000b9694]                           dc.w $000e
[000b9696]                           dc.w $0005
[000b9698]                           dc.w $0001
_97_PARTS:
[000b969a]                           dc.w $0060
[000b969c]                           dc.w $ffff
[000b969e]                           dc.w $ffff
[000b96a0]                           dc.w $0019
[000b96a2]                           dc.w $2000
[000b96a4]                           dc.w $0000
[000b96a6]                           dc.w $0000
[000b96a8]                           dc.w $1101
[000b96aa]                           dc.w $0000
[000b96ac]                           dc.w $0000
[000b96ae]                           dc.w $0002
[000b96b0]                           dc.w $0001
_97aPARTS:
[000b96b2]                           dc.w $0000
[000b96b4]                           dc.w $0000
[000b96b6]                           dc.w $0000
[000b96b8]                           dc.w $0000
[000b96ba]                           dc.w $8000
[000b96bc]                           dc.w $0000
[000b96be] 000bb496                  dc.l part_palette
[000b96c2]                           dc.w $0000
[000b96c4]                           dc.w $0024
[000b96c6]                           dc.w $0000
[000b96c8]                           dc.w $2af8
_99_PARTS:
[000b96ca]                           dc.w $0066
[000b96cc]                           dc.w $0064
[000b96ce]                           dc.w $0064
[000b96d0]                           dc.w $0019
[000b96d2]                           dc.w $0080
[000b96d4]                           dc.w $0000
[000b96d6]                           dc.w $0001
[000b96d8]                           dc.w $1101
[000b96da]                           dc.w $0009
[000b96dc]                           dc.w $000e
[000b96de]                           dc.w $0005
[000b96e0]                           dc.w $0001
_100_PARTS:
[000b96e2]                           dc.w $0063
[000b96e4]                           dc.w $ffff
[000b96e6]                           dc.w $ffff
[000b96e8]                           dc.w $0019
[000b96ea]                           dc.w $2000
[000b96ec]                           dc.w $0000
[000b96ee]                           dc.w $0000
[000b96f0]                           dc.w $1101
[000b96f2]                           dc.w $0000
[000b96f4]                           dc.w $0000
[000b96f6]                           dc.w $0002
[000b96f8]                           dc.w $0001
_100aPARTS:
[000b96fa]                           dc.w $0000
[000b96fc]                           dc.w $0000
[000b96fe]                           dc.w $0000
[000b9700]                           dc.w $0000
[000b9702]                           dc.w $8000
[000b9704]                           dc.w $0000
[000b9706] 000bb496                  dc.l part_palette
[000b970a]                           dc.w $0000
[000b970c]                           dc.w $0025
[000b970e]                           dc.w $0000
[000b9710]                           dc.w $2af8
_102_PARTS:
[000b9712]                           dc.w $0069
[000b9714]                           dc.w $0067
[000b9716]                           dc.w $0067
[000b9718]                           dc.w $0019
[000b971a]                           dc.w $0080
[000b971c]                           dc.w $0000
[000b971e]                           dc.w $0001
[000b9720]                           dc.w $1101
[000b9722]                           dc.w $0010
[000b9724]                           dc.w $000e
[000b9726]                           dc.w $0005
[000b9728]                           dc.w $0001
_103_PARTS:
[000b972a]                           dc.w $0066
[000b972c]                           dc.w $ffff
[000b972e]                           dc.w $ffff
[000b9730]                           dc.w $0019
[000b9732]                           dc.w $2000
[000b9734]                           dc.w $0000
[000b9736]                           dc.w $0000
[000b9738]                           dc.w $1101
[000b973a]                           dc.w $0000
[000b973c]                           dc.w $0000
[000b973e]                           dc.w $0002
[000b9740]                           dc.w $0001
_103aPARTS:
[000b9742]                           dc.w $0000
[000b9744]                           dc.w $0000
[000b9746]                           dc.w $0000
[000b9748]                           dc.w $0000
[000b974a]                           dc.w $8000
[000b974c]                           dc.w $0000
[000b974e] 000bb496                  dc.l part_palette
[000b9752]                           dc.w $0000
[000b9754]                           dc.w $0026
[000b9756]                           dc.w $0000
[000b9758]                           dc.w $2af8
_105_PARTS:
[000b975a]                           dc.w $006c
[000b975c]                           dc.w $006a
[000b975e]                           dc.w $006a
[000b9760]                           dc.w $0019
[000b9762]                           dc.w $0080
[000b9764]                           dc.w $0000
[000b9766]                           dc.w $0001
[000b9768]                           dc.w $1101
[000b976a]                           dc.w $0017
[000b976c]                           dc.w $000e
[000b976e]                           dc.w $0005
[000b9770]                           dc.w $0001
_106_PARTS:
[000b9772]                           dc.w $0069
[000b9774]                           dc.w $ffff
[000b9776]                           dc.w $ffff
[000b9778]                           dc.w $0019
[000b977a]                           dc.w $2000
[000b977c]                           dc.w $0000
[000b977e]                           dc.w $0000
[000b9780]                           dc.w $1101
[000b9782]                           dc.w $0000
[000b9784]                           dc.w $0000
[000b9786]                           dc.w $0002
[000b9788]                           dc.w $0001
_106aPARTS:
[000b978a]                           dc.w $0000
[000b978c]                           dc.w $0000
[000b978e]                           dc.w $0000
[000b9790]                           dc.w $0000
[000b9792]                           dc.w $8000
[000b9794]                           dc.w $0000
[000b9796] 000bb496                  dc.l part_palette
[000b979a]                           dc.w $0000
[000b979c]                           dc.w $0027
[000b979e]                           dc.w $0000
[000b97a0]                           dc.w $2af8
_108_PARTS:
[000b97a2]                           dc.w $006f
[000b97a4]                           dc.w $006d
[000b97a6]                           dc.w $006d
[000b97a8]                           dc.w $0019
[000b97aa]                           dc.w $0080
[000b97ac]                           dc.w $0000
[000b97ae]                           dc.w $0001
[000b97b0]                           dc.w $1101
[000b97b2]                           dc.w $001e
[000b97b4]                           dc.w $000e
[000b97b6]                           dc.w $0005
[000b97b8]                           dc.w $0001
_109_PARTS:
[000b97ba]                           dc.w $006c
[000b97bc]                           dc.w $ffff
[000b97be]                           dc.w $ffff
[000b97c0]                           dc.w $0019
[000b97c2]                           dc.w $2000
[000b97c4]                           dc.w $0000
[000b97c6]                           dc.w $0000
[000b97c8]                           dc.w $1101
[000b97ca]                           dc.w $0000
[000b97cc]                           dc.w $0000
[000b97ce]                           dc.w $0002
[000b97d0]                           dc.w $0001
_109aPARTS:
[000b97d2]                           dc.w $0000
[000b97d4]                           dc.w $0000
[000b97d6]                           dc.w $0000
[000b97d8]                           dc.w $0000
[000b97da]                           dc.w $8000
[000b97dc]                           dc.w $0000
[000b97de] 000bb496                  dc.l part_palette
[000b97e2]                           dc.w $0000
[000b97e4]                           dc.w $0028
[000b97e6]                           dc.w $0000
[000b97e8]                           dc.w $2af8
_111_PARTS:
[000b97ea]                           dc.w $0072
[000b97ec]                           dc.w $0070
[000b97ee]                           dc.w $0070
[000b97f0]                           dc.w $0019
[000b97f2]                           dc.w $0080
[000b97f4]                           dc.w $0000
[000b97f6]                           dc.w $0001
[000b97f8]                           dc.w $1101
[000b97fa]                           dc.w $0025
[000b97fc]                           dc.w $000e
[000b97fe]                           dc.w $0005
[000b9800]                           dc.w $0001
_112_PARTS:
[000b9802]                           dc.w $006f
[000b9804]                           dc.w $ffff
[000b9806]                           dc.w $ffff
[000b9808]                           dc.w $0019
[000b980a]                           dc.w $2000
[000b980c]                           dc.w $0000
[000b980e]                           dc.w $0000
[000b9810]                           dc.w $1101
[000b9812]                           dc.w $0000
[000b9814]                           dc.w $0000
[000b9816]                           dc.w $0002
[000b9818]                           dc.w $0001
_112aPARTS:
[000b981a]                           dc.w $0000
[000b981c]                           dc.w $0000
[000b981e]                           dc.w $0000
[000b9820]                           dc.w $0000
[000b9822]                           dc.w $8000
[000b9824]                           dc.w $0000
[000b9826] 000bb496                  dc.l part_palette
[000b982a]                           dc.w $0000
[000b982c]                           dc.w $0029
[000b982e]                           dc.w $0000
[000b9830]                           dc.w $2af8
_114_PARTS:
[000b9832]                           dc.w $0075
[000b9834]                           dc.w $0073
[000b9836]                           dc.w $0073
[000b9838]                           dc.w $0019
[000b983a]                           dc.w $0080
[000b983c]                           dc.w $0000
[000b983e]                           dc.w $0001
[000b9840]                           dc.w $1101
[000b9842]                           dc.w $002c
[000b9844]                           dc.w $000e
[000b9846]                           dc.w $0005
[000b9848]                           dc.w $0001
_115_PARTS:
[000b984a]                           dc.w $0072
[000b984c]                           dc.w $ffff
[000b984e]                           dc.w $ffff
[000b9850]                           dc.w $0019
[000b9852]                           dc.w $2000
[000b9854]                           dc.w $0000
[000b9856]                           dc.w $0000
[000b9858]                           dc.w $1101
[000b985a]                           dc.w $0000
[000b985c]                           dc.w $0000
[000b985e]                           dc.w $0002
[000b9860]                           dc.w $0001
_115aPARTS:
[000b9862]                           dc.w $0000
[000b9864]                           dc.w $0000
[000b9866]                           dc.w $0000
[000b9868]                           dc.w $0000
[000b986a]                           dc.w $8000
[000b986c]                           dc.w $0000
[000b986e] 000bb496                  dc.l part_palette
[000b9872]                           dc.w $0000
[000b9874]                           dc.w $002a
[000b9876]                           dc.w $0000
[000b9878]                           dc.w $2af8
_117_PARTS:
[000b987a]                           dc.w $0078
[000b987c]                           dc.w $0076
[000b987e]                           dc.w $0076
[000b9880]                           dc.w $0019
[000b9882]                           dc.w $0080
[000b9884]                           dc.w $0000
[000b9886]                           dc.w $0001
[000b9888]                           dc.w $1101
[000b988a]                           dc.w $0033
[000b988c]                           dc.w $000e
[000b988e]                           dc.w $0005
[000b9890]                           dc.w $0001
_118_PARTS:
[000b9892]                           dc.w $0075
[000b9894]                           dc.w $ffff
[000b9896]                           dc.w $ffff
[000b9898]                           dc.w $0019
[000b989a]                           dc.w $2000
[000b989c]                           dc.w $0000
[000b989e]                           dc.w $0000
[000b98a0]                           dc.w $1101
[000b98a2]                           dc.w $0000
[000b98a4]                           dc.w $0000
[000b98a6]                           dc.w $0002
[000b98a8]                           dc.w $0001
_118aPARTS:
[000b98aa]                           dc.w $0000
[000b98ac]                           dc.w $0000
[000b98ae]                           dc.w $0000
[000b98b0]                           dc.w $0000
[000b98b2]                           dc.w $8000
[000b98b4]                           dc.w $0000
[000b98b6] 000bb496                  dc.l part_palette
[000b98ba]                           dc.w $0000
[000b98bc]                           dc.w $002b
[000b98be]                           dc.w $0000
[000b98c0]                           dc.w $2af8
_120_PARTS:
[000b98c2]                           dc.w $007b
[000b98c4]                           dc.w $0079
[000b98c6]                           dc.w $0079
[000b98c8]                           dc.w $0019
[000b98ca]                           dc.w $0080
[000b98cc]                           dc.w $0000
[000b98ce]                           dc.w $0001
[000b98d0]                           dc.w $1101
[000b98d2]                           dc.w $0002
[000b98d4]                           dc.w $0010
[000b98d6]                           dc.w $0005
[000b98d8]                           dc.w $0001
_121_PARTS:
[000b98da]                           dc.w $0078
[000b98dc]                           dc.w $ffff
[000b98de]                           dc.w $ffff
[000b98e0]                           dc.w $0019
[000b98e2]                           dc.w $2000
[000b98e4]                           dc.w $0000
[000b98e6]                           dc.w $0000
[000b98e8]                           dc.w $1101
[000b98ea]                           dc.w $0000
[000b98ec]                           dc.w $0000
[000b98ee]                           dc.w $0002
[000b98f0]                           dc.w $0001
_121aPARTS:
[000b98f2]                           dc.w $0000
[000b98f4]                           dc.w $0000
[000b98f6]                           dc.w $0000
[000b98f8]                           dc.w $0000
[000b98fa]                           dc.w $8000
[000b98fc]                           dc.w $0000
[000b98fe] 000bb496                  dc.l part_palette
[000b9902]                           dc.w $0000
[000b9904]                           dc.w $002c
[000b9906]                           dc.w $0000
[000b9908]                           dc.w $2af8
_123_PARTS:
[000b990a]                           dc.w $007e
[000b990c]                           dc.w $007c
[000b990e]                           dc.w $007c
[000b9910]                           dc.w $0019
[000b9912]                           dc.w $0080
[000b9914]                           dc.w $0000
[000b9916]                           dc.w $0001
[000b9918]                           dc.w $1101
[000b991a]                           dc.w $0009
[000b991c]                           dc.w $0010
[000b991e]                           dc.w $0005
[000b9920]                           dc.w $0001
_124_PARTS:
[000b9922]                           dc.w $007b
[000b9924]                           dc.w $ffff
[000b9926]                           dc.w $ffff
[000b9928]                           dc.w $0019
[000b992a]                           dc.w $2000
[000b992c]                           dc.w $0000
[000b992e]                           dc.w $0000
[000b9930]                           dc.w $1101
[000b9932]                           dc.w $0000
[000b9934]                           dc.w $0000
[000b9936]                           dc.w $0002
[000b9938]                           dc.w $0001
_124aPARTS:
[000b993a]                           dc.w $0000
[000b993c]                           dc.w $0000
[000b993e]                           dc.w $0000
[000b9940]                           dc.w $0000
[000b9942]                           dc.w $8000
[000b9944]                           dc.w $0000
[000b9946] 000bb496                  dc.l part_palette
[000b994a]                           dc.w $0000
[000b994c]                           dc.w $002d
[000b994e]                           dc.w $0000
[000b9950]                           dc.w $2af8
_126_PARTS:
[000b9952]                           dc.w $0081
[000b9954]                           dc.w $007f
[000b9956]                           dc.w $007f
[000b9958]                           dc.w $0019
[000b995a]                           dc.w $0080
[000b995c]                           dc.w $0000
[000b995e]                           dc.w $0001
[000b9960]                           dc.w $1101
[000b9962]                           dc.w $0010
[000b9964]                           dc.w $0010
[000b9966]                           dc.w $0005
[000b9968]                           dc.w $0001
_127_PARTS:
[000b996a]                           dc.w $007e
[000b996c]                           dc.w $ffff
[000b996e]                           dc.w $ffff
[000b9970]                           dc.w $0019
[000b9972]                           dc.w $2000
[000b9974]                           dc.w $0000
[000b9976]                           dc.w $0000
[000b9978]                           dc.w $1101
[000b997a]                           dc.w $0000
[000b997c]                           dc.w $0000
[000b997e]                           dc.w $0002
[000b9980]                           dc.w $0001
_127aPARTS:
[000b9982]                           dc.w $0000
[000b9984]                           dc.w $0000
[000b9986]                           dc.w $0000
[000b9988]                           dc.w $0000
[000b998a]                           dc.w $8000
[000b998c]                           dc.w $0000
[000b998e] 000bb496                  dc.l part_palette
[000b9992]                           dc.w $0000
[000b9994]                           dc.w $002e
[000b9996]                           dc.w $0000
[000b9998]                           dc.w $2af8
_129_PARTS:
[000b999a]                           dc.w $0084
[000b999c]                           dc.w $0082
[000b999e]                           dc.w $0082
[000b99a0]                           dc.w $0019
[000b99a2]                           dc.w $0080
[000b99a4]                           dc.w $0000
[000b99a6]                           dc.w $0001
[000b99a8]                           dc.w $1101
[000b99aa]                           dc.w $0017
[000b99ac]                           dc.w $0010
[000b99ae]                           dc.w $0005
[000b99b0]                           dc.w $0001
_130_PARTS:
[000b99b2]                           dc.w $0081
[000b99b4]                           dc.w $ffff
[000b99b6]                           dc.w $ffff
[000b99b8]                           dc.w $0019
[000b99ba]                           dc.w $2000
[000b99bc]                           dc.w $0000
[000b99be]                           dc.w $0000
[000b99c0]                           dc.w $1101
[000b99c2]                           dc.w $0000
[000b99c4]                           dc.w $0000
[000b99c6]                           dc.w $0002
[000b99c8]                           dc.w $0001
_130aPARTS:
[000b99ca]                           dc.w $0000
[000b99cc]                           dc.w $0000
[000b99ce]                           dc.w $0000
[000b99d0]                           dc.w $0000
[000b99d2]                           dc.w $8000
[000b99d4]                           dc.w $0000
[000b99d6] 000bb496                  dc.l part_palette
[000b99da]                           dc.w $0000
[000b99dc]                           dc.w $002f
[000b99de]                           dc.w $0000
[000b99e0]                           dc.w $2af8
_132_PARTS:
[000b99e2]                           dc.w $0087
[000b99e4]                           dc.w $0085
[000b99e6]                           dc.w $0085
[000b99e8]                           dc.w $0019
[000b99ea]                           dc.w $0080
[000b99ec]                           dc.w $0000
[000b99ee]                           dc.w $0001
[000b99f0]                           dc.w $1101
[000b99f2]                           dc.w $001e
[000b99f4]                           dc.w $0010
[000b99f6]                           dc.w $0005
[000b99f8]                           dc.w $0001
_133_PARTS:
[000b99fa]                           dc.w $0084
[000b99fc]                           dc.w $ffff
[000b99fe]                           dc.w $ffff
[000b9a00]                           dc.w $0019
[000b9a02]                           dc.w $2000
[000b9a04]                           dc.w $0000
[000b9a06]                           dc.w $0000
[000b9a08]                           dc.w $1101
[000b9a0a]                           dc.w $0000
[000b9a0c]                           dc.w $0000
[000b9a0e]                           dc.w $0002
[000b9a10]                           dc.w $0001
_133aPARTS:
[000b9a12]                           dc.w $0000
[000b9a14]                           dc.w $0000
[000b9a16]                           dc.w $0000
[000b9a18]                           dc.w $0000
[000b9a1a]                           dc.w $8000
[000b9a1c]                           dc.w $0000
[000b9a1e] 000bb496                  dc.l part_palette
[000b9a22]                           dc.w $0000
[000b9a24]                           dc.w $0030
[000b9a26]                           dc.w $0000
[000b9a28]                           dc.w $2af8
_135_PARTS:
[000b9a2a]                           dc.w $008a
[000b9a2c]                           dc.w $0088
[000b9a2e]                           dc.w $0088
[000b9a30]                           dc.w $0019
[000b9a32]                           dc.w $0080
[000b9a34]                           dc.w $0000
[000b9a36]                           dc.w $0001
[000b9a38]                           dc.w $1101
[000b9a3a]                           dc.w $0025
[000b9a3c]                           dc.w $0010
[000b9a3e]                           dc.w $0005
[000b9a40]                           dc.w $0001
_136_PARTS:
[000b9a42]                           dc.w $0087
[000b9a44]                           dc.w $ffff
[000b9a46]                           dc.w $ffff
[000b9a48]                           dc.w $0019
[000b9a4a]                           dc.w $2000
[000b9a4c]                           dc.w $0000
[000b9a4e]                           dc.w $0000
[000b9a50]                           dc.w $1101
[000b9a52]                           dc.w $0000
[000b9a54]                           dc.w $0000
[000b9a56]                           dc.w $0002
[000b9a58]                           dc.w $0001
_136aPARTS:
[000b9a5a]                           dc.w $0000
[000b9a5c]                           dc.w $0000
[000b9a5e]                           dc.w $0000
[000b9a60]                           dc.w $0000
[000b9a62]                           dc.w $8000
[000b9a64]                           dc.w $0000
[000b9a66] 000bb496                  dc.l part_palette
[000b9a6a]                           dc.w $0000
[000b9a6c]                           dc.w $0031
[000b9a6e]                           dc.w $0000
[000b9a70]                           dc.w $2af8
_138_PARTS:
[000b9a72]                           dc.w $008d
[000b9a74]                           dc.w $008b
[000b9a76]                           dc.w $008b
[000b9a78]                           dc.w $0019
[000b9a7a]                           dc.w $0080
[000b9a7c]                           dc.w $0000
[000b9a7e]                           dc.w $0001
[000b9a80]                           dc.w $1101
[000b9a82]                           dc.w $002c
[000b9a84]                           dc.w $0010
[000b9a86]                           dc.w $0005
[000b9a88]                           dc.w $0001
_139_PARTS:
[000b9a8a]                           dc.w $008a
[000b9a8c]                           dc.w $ffff
[000b9a8e]                           dc.w $ffff
[000b9a90]                           dc.w $0019
[000b9a92]                           dc.w $2000
[000b9a94]                           dc.w $0000
[000b9a96]                           dc.w $0000
[000b9a98]                           dc.w $1101
[000b9a9a]                           dc.w $0000
[000b9a9c]                           dc.w $0000
[000b9a9e]                           dc.w $0002
[000b9aa0]                           dc.w $0001
_139aPARTS:
[000b9aa2]                           dc.w $0000
[000b9aa4]                           dc.w $0000
[000b9aa6]                           dc.w $0000
[000b9aa8]                           dc.w $0000
[000b9aaa]                           dc.w $8000
[000b9aac]                           dc.w $0000
[000b9aae] 000bb496                  dc.l part_palette
[000b9ab2]                           dc.w $0000
[000b9ab4]                           dc.w $0032
[000b9ab6]                           dc.w $0000
[000b9ab8]                           dc.w $2af8
_141_PARTS:
[000b9aba]                           dc.w $0090
[000b9abc]                           dc.w $008e
[000b9abe]                           dc.w $008e
[000b9ac0]                           dc.w $0019
[000b9ac2]                           dc.w $0080
[000b9ac4]                           dc.w $0000
[000b9ac6]                           dc.w $0001
[000b9ac8]                           dc.w $1101
[000b9aca]                           dc.w $0033
[000b9acc]                           dc.w $0010
[000b9ace]                           dc.w $0005
[000b9ad0]                           dc.w $0001
_142_PARTS:
[000b9ad2]                           dc.w $008d
[000b9ad4]                           dc.w $ffff
[000b9ad6]                           dc.w $ffff
[000b9ad8]                           dc.w $0019
[000b9ada]                           dc.w $2000
[000b9adc]                           dc.w $0000
[000b9ade]                           dc.w $0000
[000b9ae0]                           dc.w $1101
[000b9ae2]                           dc.w $0000
[000b9ae4]                           dc.w $0000
[000b9ae6]                           dc.w $0002
[000b9ae8]                           dc.w $0001
_142aPARTS:
[000b9aea]                           dc.w $0000
[000b9aec]                           dc.w $0000
[000b9aee]                           dc.w $0000
[000b9af0]                           dc.w $0000
[000b9af2]                           dc.w $8000
[000b9af4]                           dc.w $0000
[000b9af6] 000bb496                  dc.l part_palette
[000b9afa]                           dc.w $0000
[000b9afc]                           dc.w $0033
[000b9afe]                           dc.w $0000
[000b9b00]                           dc.w $2af8
_144_PARTS:
[000b9b02]                           dc.w $0093
[000b9b04]                           dc.w $0091
[000b9b06]                           dc.w $0091
[000b9b08]                           dc.w $0019
[000b9b0a]                           dc.w $0080
[000b9b0c]                           dc.w $0000
[000b9b0e]                           dc.w $0001
[000b9b10]                           dc.w $1101
[000b9b12]                           dc.w $0002
[000b9b14]                           dc.w $0012
[000b9b16]                           dc.w $0005
[000b9b18]                           dc.w $0001
_145_PARTS:
[000b9b1a]                           dc.w $0090
[000b9b1c]                           dc.w $ffff
[000b9b1e]                           dc.w $ffff
[000b9b20]                           dc.w $0019
[000b9b22]                           dc.w $2000
[000b9b24]                           dc.w $0000
[000b9b26]                           dc.w $0000
[000b9b28]                           dc.w $1101
[000b9b2a]                           dc.w $0000
[000b9b2c]                           dc.w $0000
[000b9b2e]                           dc.w $0002
[000b9b30]                           dc.w $0001
_145aPARTS:
[000b9b32]                           dc.w $0000
[000b9b34]                           dc.w $0000
[000b9b36]                           dc.w $0000
[000b9b38]                           dc.w $0000
[000b9b3a]                           dc.w $8000
[000b9b3c]                           dc.w $0000
[000b9b3e] 000bb496                  dc.l part_palette
[000b9b42]                           dc.w $0000
[000b9b44]                           dc.w $0034
[000b9b46]                           dc.w $0000
[000b9b48]                           dc.w $2af8
_147_PARTS:
[000b9b4a]                           dc.w $0096
[000b9b4c]                           dc.w $0094
[000b9b4e]                           dc.w $0094
[000b9b50]                           dc.w $0019
[000b9b52]                           dc.w $0080
[000b9b54]                           dc.w $0000
[000b9b56]                           dc.w $0001
[000b9b58]                           dc.w $1101
[000b9b5a]                           dc.w $0009
[000b9b5c]                           dc.w $0012
[000b9b5e]                           dc.w $0005
[000b9b60]                           dc.w $0001
_148_PARTS:
[000b9b62]                           dc.w $0093
[000b9b64]                           dc.w $ffff
[000b9b66]                           dc.w $ffff
[000b9b68]                           dc.w $0019
[000b9b6a]                           dc.w $2000
[000b9b6c]                           dc.w $0000
[000b9b6e]                           dc.w $0000
[000b9b70]                           dc.w $1101
[000b9b72]                           dc.w $0000
[000b9b74]                           dc.w $0000
[000b9b76]                           dc.w $0002
[000b9b78]                           dc.w $0001
_148aPARTS:
[000b9b7a]                           dc.w $0000
[000b9b7c]                           dc.w $0000
[000b9b7e]                           dc.w $0000
[000b9b80]                           dc.w $0000
[000b9b82]                           dc.w $8000
[000b9b84]                           dc.w $0000
[000b9b86] 000bb496                  dc.l part_palette
[000b9b8a]                           dc.w $0000
[000b9b8c]                           dc.w $0035
[000b9b8e]                           dc.w $0000
[000b9b90]                           dc.w $2af8
_150_PARTS:
[000b9b92]                           dc.w $0099
[000b9b94]                           dc.w $0097
[000b9b96]                           dc.w $0097
[000b9b98]                           dc.w $0019
[000b9b9a]                           dc.w $0080
[000b9b9c]                           dc.w $0000
[000b9b9e]                           dc.w $0001
[000b9ba0]                           dc.w $1101
[000b9ba2]                           dc.w $0010
[000b9ba4]                           dc.w $0012
[000b9ba6]                           dc.w $0005
[000b9ba8]                           dc.w $0001
_151_PARTS:
[000b9baa]                           dc.w $0096
[000b9bac]                           dc.w $ffff
[000b9bae]                           dc.w $ffff
[000b9bb0]                           dc.w $0019
[000b9bb2]                           dc.w $2000
[000b9bb4]                           dc.w $0000
[000b9bb6]                           dc.w $0000
[000b9bb8]                           dc.w $1101
[000b9bba]                           dc.w $0000
[000b9bbc]                           dc.w $0000
[000b9bbe]                           dc.w $0002
[000b9bc0]                           dc.w $0001
_151aPARTS:
[000b9bc2]                           dc.w $0000
[000b9bc4]                           dc.w $0000
[000b9bc6]                           dc.w $0000
[000b9bc8]                           dc.w $0000
[000b9bca]                           dc.w $8000
[000b9bcc]                           dc.w $0000
[000b9bce] 000bb496                  dc.l part_palette
[000b9bd2]                           dc.w $0000
[000b9bd4]                           dc.w $0036
[000b9bd6]                           dc.w $0000
[000b9bd8]                           dc.w $2af8
_153_PARTS:
[000b9bda]                           dc.w $009c
[000b9bdc]                           dc.w $009a
[000b9bde]                           dc.w $009a
[000b9be0]                           dc.w $0019
[000b9be2]                           dc.w $0080
[000b9be4]                           dc.w $0000
[000b9be6]                           dc.w $0001
[000b9be8]                           dc.w $1101
[000b9bea]                           dc.w $0017
[000b9bec]                           dc.w $0012
[000b9bee]                           dc.w $0005
[000b9bf0]                           dc.w $0001
_154_PARTS:
[000b9bf2]                           dc.w $0099
[000b9bf4]                           dc.w $ffff
[000b9bf6]                           dc.w $ffff
[000b9bf8]                           dc.w $0019
[000b9bfa]                           dc.w $2000
[000b9bfc]                           dc.w $0000
[000b9bfe]                           dc.w $0000
[000b9c00]                           dc.w $1101
[000b9c02]                           dc.w $0000
[000b9c04]                           dc.w $0000
[000b9c06]                           dc.w $0002
[000b9c08]                           dc.w $0001
_154aPARTS:
[000b9c0a]                           dc.w $0000
[000b9c0c]                           dc.w $0000
[000b9c0e]                           dc.w $0000
[000b9c10]                           dc.w $0000
[000b9c12]                           dc.w $8000
[000b9c14]                           dc.w $0000
[000b9c16] 000bb496                  dc.l part_palette
[000b9c1a]                           dc.w $0000
[000b9c1c]                           dc.w $0037
[000b9c1e]                           dc.w $0000
[000b9c20]                           dc.w $2af8
_156_PARTS:
[000b9c22]                           dc.w $009f
[000b9c24]                           dc.w $009d
[000b9c26]                           dc.w $009d
[000b9c28]                           dc.w $0019
[000b9c2a]                           dc.w $0080
[000b9c2c]                           dc.w $0000
[000b9c2e]                           dc.w $0001
[000b9c30]                           dc.w $1101
[000b9c32]                           dc.w $001e
[000b9c34]                           dc.w $0012
[000b9c36]                           dc.w $0005
[000b9c38]                           dc.w $0001
_157_PARTS:
[000b9c3a]                           dc.w $009c
[000b9c3c]                           dc.w $ffff
[000b9c3e]                           dc.w $ffff
[000b9c40]                           dc.w $0019
[000b9c42]                           dc.w $2000
[000b9c44]                           dc.w $0000
[000b9c46]                           dc.w $0000
[000b9c48]                           dc.w $1101
[000b9c4a]                           dc.w $0000
[000b9c4c]                           dc.w $0000
[000b9c4e]                           dc.w $0002
[000b9c50]                           dc.w $0001
_157aPARTS:
[000b9c52]                           dc.w $0000
[000b9c54]                           dc.w $0000
[000b9c56]                           dc.w $0000
[000b9c58]                           dc.w $0000
[000b9c5a]                           dc.w $8000
[000b9c5c]                           dc.w $0000
[000b9c5e] 000bb496                  dc.l part_palette
[000b9c62]                           dc.w $0000
[000b9c64]                           dc.w $0038
[000b9c66]                           dc.w $0000
[000b9c68]                           dc.w $2af8
_159_PARTS:
[000b9c6a]                           dc.w $00a2
[000b9c6c]                           dc.w $00a0
[000b9c6e]                           dc.w $00a0
[000b9c70]                           dc.w $0019
[000b9c72]                           dc.w $0080
[000b9c74]                           dc.w $0000
[000b9c76]                           dc.w $0001
[000b9c78]                           dc.w $1101
[000b9c7a]                           dc.w $0025
[000b9c7c]                           dc.w $0012
[000b9c7e]                           dc.w $0005
[000b9c80]                           dc.w $0001
_160_PARTS:
[000b9c82]                           dc.w $009f
[000b9c84]                           dc.w $ffff
[000b9c86]                           dc.w $ffff
[000b9c88]                           dc.w $0019
[000b9c8a]                           dc.w $2000
[000b9c8c]                           dc.w $0000
[000b9c8e]                           dc.w $0000
[000b9c90]                           dc.w $1101
[000b9c92]                           dc.w $0000
[000b9c94]                           dc.w $0000
[000b9c96]                           dc.w $0002
[000b9c98]                           dc.w $0001
_160aPARTS:
[000b9c9a]                           dc.w $0000
[000b9c9c]                           dc.w $0000
[000b9c9e]                           dc.w $0000
[000b9ca0]                           dc.w $0000
[000b9ca2]                           dc.w $8000
[000b9ca4]                           dc.w $0000
[000b9ca6] 000bb496                  dc.l part_palette
[000b9caa]                           dc.w $0000
[000b9cac]                           dc.w $0039
[000b9cae]                           dc.w $0000
[000b9cb0]                           dc.w $2af8
_162_PARTS:
[000b9cb2]                           dc.w $00a5
[000b9cb4]                           dc.w $00a3
[000b9cb6]                           dc.w $00a3
[000b9cb8]                           dc.w $0019
[000b9cba]                           dc.w $0080
[000b9cbc]                           dc.w $0000
[000b9cbe]                           dc.w $0001
[000b9cc0]                           dc.w $1101
[000b9cc2]                           dc.w $002c
[000b9cc4]                           dc.w $0012
[000b9cc6]                           dc.w $0005
[000b9cc8]                           dc.w $0001
_163_PARTS:
[000b9cca]                           dc.w $00a2
[000b9ccc]                           dc.w $ffff
[000b9cce]                           dc.w $ffff
[000b9cd0]                           dc.w $0019
[000b9cd2]                           dc.w $2000
[000b9cd4]                           dc.w $0000
[000b9cd6]                           dc.w $0000
[000b9cd8]                           dc.w $1101
[000b9cda]                           dc.w $0000
[000b9cdc]                           dc.w $0000
[000b9cde]                           dc.w $0002
[000b9ce0]                           dc.w $0001
_163aPARTS:
[000b9ce2]                           dc.w $0000
[000b9ce4]                           dc.w $0000
[000b9ce6]                           dc.w $0000
[000b9ce8]                           dc.w $0000
[000b9cea]                           dc.w $8000
[000b9cec]                           dc.w $0000
[000b9cee] 000bb496                  dc.l part_palette
[000b9cf2]                           dc.w $0000
[000b9cf4]                           dc.w $003a
[000b9cf6]                           dc.w $0000
[000b9cf8]                           dc.w $2af8
_165_PARTS:
[000b9cfa]                           dc.w $0000
[000b9cfc]                           dc.w $00a6
[000b9cfe]                           dc.w $00a6
[000b9d00]                           dc.w $0019
[000b9d02]                           dc.w $0080
[000b9d04]                           dc.w $0000
[000b9d06]                           dc.w $0001
[000b9d08]                           dc.w $1101
[000b9d0a]                           dc.w $0033
[000b9d0c]                           dc.w $0012
[000b9d0e]                           dc.w $0005
[000b9d10]                           dc.w $0001
_166_PARTS:
[000b9d12]                           dc.w $00a5
[000b9d14]                           dc.w $ffff
[000b9d16]                           dc.w $ffff
[000b9d18]                           dc.w $0019
[000b9d1a]                           dc.w $2000
[000b9d1c]                           dc.w $0000
[000b9d1e]                           dc.w $0000
[000b9d20]                           dc.w $1101
[000b9d22]                           dc.w $0000
[000b9d24]                           dc.w $0000
[000b9d26]                           dc.w $0002
[000b9d28]                           dc.w $0001
_166aPARTS:
[000b9d2a]                           dc.w $0000
[000b9d2c]                           dc.w $0000
[000b9d2e]                           dc.w $0000
[000b9d30]                           dc.w $0000
[000b9d32]                           dc.w $8020
[000b9d34]                           dc.w $0000
[000b9d36] 000bb496                  dc.l part_palette
[000b9d3a]                           dc.w $0000
[000b9d3c]                           dc.w $003b
[000b9d3e]                           dc.w $0000
[000b9d40]                           dc.w $2af8
PARTS_TOOL:
[000b9d42]                           dc.w $ffff
[000b9d44]                           dc.w $0001
[000b9d46]                           dc.w $000a
[000b9d48]                           dc.w $0018
[000b9d4a]                           dc.w $0040
[000b9d4c]                           dc.w $0000
[000b9d4e] 000b860e                  dc.l A_3DBUTTON03
[000b9d52]                           dc.w $0000
[000b9d54]                           dc.w $0000
[000b9d56]                           dc.w $0014
[000b9d58]                           dc.w $2000
_01_PARTS_TOOL:
[000b9d5a]                           dc.w $0004
[000b9d5c]                           dc.w $0002
[000b9d5e]                           dc.w $0002
[000b9d60]                           dc.w $001f
[000b9d62]                           dc.w $0040
[000b9d64]                           dc.w $0000
[000b9d66] 000b8cbe                  dc.l I_SPEC
[000b9d6a]                           dc.w $0000
[000b9d6c]                           dc.w $0000
[000b9d6e]                           dc.w $0004
[000b9d70]                           dc.w $0002
_02_PARTS_TOOL:
[000b9d72]                           dc.w $0001
[000b9d74]                           dc.w $ffff
[000b9d76]                           dc.w $ffff
[000b9d78]                           dc.w $0018
[000b9d7a]                           dc.w $1005
[000b9d7c]                           dc.w $0000
[000b9d7e] 000b864e                  dc.l A_3DBUTTON06
[000b9d82]                           dc.w $0000
[000b9d84]                           dc.w $0000
[000b9d86]                           dc.w $2000
[000b9d88]                           dc.w $2000
_02aPARTS_TOOL:
[000b9d8a] 0002518a                  dc.l go_spec_edit
[000b9d8e]                           dc.w $0000
[000b9d90]                           dc.w $0000
[000b9d92]                           dc.w $8000
[000b9d94]                           dc.w $0000
[000b9d96]                           dc.w $0000
[000b9d98]                           dc.w $0000
[000b9d9a]                           dc.w $0000
[000b9d9c]                           dc.w $0000
[000b9d9e]                           dc.w $0000
[000b9da0]                           dc.w $0000
_04_PARTS_TOOL:
[000b9da2]                           dc.w $0007
[000b9da4]                           dc.w $0005
[000b9da6]                           dc.w $0005
[000b9da8]                           dc.w $001f
[000b9daa]                           dc.w $0040
[000b9dac]                           dc.w $0000
[000b9dae] 000b890a                  dc.l I_FLAGS
[000b9db2]                           dc.w $0004
[000b9db4]                           dc.w $0000
[000b9db6]                           dc.w $0004
[000b9db8]                           dc.w $0002
_05_PARTS_TOOL:
[000b9dba]                           dc.w $0004
[000b9dbc]                           dc.w $ffff
[000b9dbe]                           dc.w $ffff
[000b9dc0]                           dc.w $0018
[000b9dc2]                           dc.w $1005
[000b9dc4]                           dc.w $0000
[000b9dc6] 000b862e                  dc.l A_3DBUTTON05
[000b9dca]                           dc.w $0000
[000b9dcc]                           dc.w $0000
[000b9dce]                           dc.w $2000
[000b9dd0]                           dc.w $2000
_05aPARTS_TOOL:
[000b9dd2] 00025196                  dc.l go_flag_edit
[000b9dd6]                           dc.w $0000
[000b9dd8]                           dc.w $0000
[000b9dda]                           dc.w $8000
[000b9ddc]                           dc.w $0000
[000b9dde]                           dc.w $0000
[000b9de0]                           dc.w $0000
[000b9de2]                           dc.w $0000
[000b9de4]                           dc.w $0000
[000b9de6]                           dc.w $0000
[000b9de8]                           dc.w $0000
_07_PARTS_TOOL:
[000b9dea]                           dc.w $000a
[000b9dec]                           dc.w $0008
[000b9dee]                           dc.w $0008
[000b9df0]                           dc.w $001f
[000b9df2]                           dc.w $0040
[000b9df4]                           dc.w $0000
[000b9df6] 000b8b82                  dc.l I_REF
[000b9dfa]                           dc.w $0008
[000b9dfc]                           dc.w $0000
[000b9dfe]                           dc.w $0004
[000b9e00]                           dc.w $0002
_08_PARTS_TOOL:
[000b9e02]                           dc.w $0007
[000b9e04]                           dc.w $ffff
[000b9e06]                           dc.w $ffff
[000b9e08]                           dc.w $0018
[000b9e0a]                           dc.w $1005
[000b9e0c]                           dc.w $0000
[000b9e0e] 000b866e                  dc.l A_3DBUTTON07
[000b9e12]                           dc.w $0000
[000b9e14]                           dc.w $0000
[000b9e16]                           dc.w $2000
[000b9e18]                           dc.w $2000
_08aPARTS_TOOL:
[000b9e1a] 000251a2                  dc.l go_ref_edit
[000b9e1e]                           dc.w $0000
[000b9e20]                           dc.w $0000
[000b9e22]                           dc.w $8000
[000b9e24]                           dc.w $0000
[000b9e26]                           dc.w $0000
[000b9e28]                           dc.w $0000
[000b9e2a]                           dc.w $0000
[000b9e2c]                           dc.w $0000
[000b9e2e]                           dc.w $0000
[000b9e30]                           dc.w $0000
_10_PARTS_TOOL:
[000b9e32]                           dc.w $0000
[000b9e34]                           dc.w $000b
[000b9e36]                           dc.w $000b
[000b9e38]                           dc.w $001f
[000b9e3a]                           dc.w $0040
[000b9e3c]                           dc.w $0000
[000b9e3e] 000b8a46                  dc.l I_POS
[000b9e42]                           dc.w $000c
[000b9e44]                           dc.w $0000
[000b9e46]                           dc.w $0004
[000b9e48]                           dc.w $0002
_11_PARTS_TOOL:
[000b9e4a]                           dc.w $000a
[000b9e4c]                           dc.w $ffff
[000b9e4e]                           dc.w $ffff
[000b9e50]                           dc.w $0018
[000b9e52]                           dc.w $1005
[000b9e54]                           dc.w $0000
[000b9e56] 000b868e                  dc.l A_3DBUTTON08
[000b9e5a]                           dc.w $0000
[000b9e5c]                           dc.w $0000
[000b9e5e]                           dc.w $2000
[000b9e60]                           dc.w $2000
_11aPARTS_TOOL:
[000b9e62] 000251ae                  dc.l go_pos_edit
[000b9e66]                           dc.w $0000
[000b9e68]                           dc.w $0000
[000b9e6a]                           dc.w $8020
[000b9e6c]                           dc.w $0000
[000b9e6e]                           dc.w $0000
[000b9e70]                           dc.w $0000
[000b9e72]                           dc.w $0000
[000b9e74]                           dc.w $0000
[000b9e76]                           dc.w $0000
[000b9e78]                           dc.w $0000
WI_PARTS:
[000b9e7a]                           dc.w $0000
[000b9e7c]                           dc.w $0000
[000b9e7e] 00024fc8                  dc.l part_service
[000b9e82] 00024e5c                  dc.l part_make
[000b9e86] 00057428                  dc.l Awi_open
[000b9e8a] 00024faa                  dc.l part_init
[000b9e8e] 000b8d82                  dc.l PARTS
[000b9e92] 000b9d42                  dc.l PARTS_TOOL
[000b9e96]                           dc.w $0000
[000b9e98]                           dc.w $0000
[000b9e9a]                           dc.w $ffff
[000b9e9c]                           dc.w $6fed
[000b9e9e]                           dc.w $0004
[000b9ea0]                           dc.w $0002
[000b9ea2]                           dc.w $0014
[000b9ea4]                           dc.w $0014
[000b9ea6]                           dc.w $0000
[000b9ea8]                           dc.w $0000
[000b9eaa]                           dc.w $0000
[000b9eac]                           dc.w $0000
[000b9eae]                           dc.w $0000
[000b9eb0]                           dc.w $0000
[000b9eb2]                           dc.w $0000
[000b9eb4]                           dc.w $0000
[000b9eb6]                           dc.w $ffff
[000b9eb8]                           dc.w $ffff
[000b9eba]                           dc.w $ffff
[000b9ebc]                           dc.w $ffff
[000b9ebe]                           dc.w $0000
[000b9ec0]                           dc.w $0000
[000b9ec2]                           dc.w $fcf8
[000b9ec4] 000b7b60                  dc.l TEXT_02
[000b9ec8] 000b7b5f                  dc.l TEXT_002
[000b9ecc]                           dc.w $2710
[000b9ece]                           dc.w $010c
[000b9ed0]                           dc.w $0000
[000b9ed2]                           dc.w $ffff
[000b9ed4]                           dc.w $0000
[000b9ed6]                           dc.w $0000
[000b9ed8]                           dc.w $0000
[000b9eda]                           dc.w $0000
[000b9edc] 0006b77a                  dc.l Awi_nokey
[000b9ee0] 00051852                  dc.l Awi_obchange
[000b9ee4] 00051c46                  dc.l Awi_redraw
[000b9ee8] 000587a4                  dc.l Awi_topped
[000b9eec] 00024f90                  dc.l part_close
[000b9ef0] 000587ec                  dc.l Awi_fulled
[000b9ef4] 0005217c                  dc.l Awi_arrowed
[000b9ef8] 000524b4                  dc.l Awi_hslid
[000b9efc] 0005255e                  dc.l Awi_vslid
[000b9f00] 00058bb0                  dc.l Awi_sized
[000b9f04] 00058d50                  dc.l Awi_moved
[000b9f08] 0005998a                  dc.l Awi_iconify
[000b9f0c] 00059c6c                  dc.l Awi_uniconify
[000b9f10] 0005b5b6                  dc.l Awi_gemscript
[000b9f14] 000b7b43                  dc.l STGUIDE_01
[000b9f18]                           dc.w $0000
[000b9f1a]                           dc.w $0000
