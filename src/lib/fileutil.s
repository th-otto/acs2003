Af_cfgfile:
[0004b496] 594f                      subq.w     #4,a7
[0004b498] 2e88                      move.l     a0,(a7)
[0004b49a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b4a0] 41e8 02d6                 lea.l      726(a0),a0
[0004b4a4] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0004b4aa] 4a40                      tst.w      d0
[0004b4ac] 6616                      bne.s      $0004B4C4
[0004b4ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b4b4] 41e8 02d6                 lea.l      726(a0),a0
[0004b4b8] 4eb9 0004 b8fa            jsr        Af_length
[0004b4be] 72ff                      moveq.l    #-1,d1
[0004b4c0] b280                      cmp.l      d0,d1
[0004b4c2] 6f44                      ble.s      $0004B508
[0004b4c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004b4ca] 1028 0356                 move.b     854(a0),d0
[0004b4ce] 6620                      bne.s      $0004B4F0
[0004b4d0] 43f9 000e 083c            lea.l      $000E083C,a1
[0004b4d6] 41f9 0011 3590            lea.l      scrap,a0
[0004b4dc] 4eb9 0008 2f0c            jsr        strcpy
[0004b4e2] 4eb9 0008 0bd2            jsr        Dgetdrv
[0004b4e8] d139 0011 3590            add.b      d0,scrap
[0004b4ee] 6016                      bra.s      $0004B506
[0004b4f0] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004b4f6] 43e9 0356                 lea.l      854(a1),a1
[0004b4fa] 41f9 0011 3590            lea.l      scrap,a0
[0004b500] 4eb9 0008 2f0c            jsr        strcpy
[0004b506] 6016                      bra.s      $0004B51E
[0004b508] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004b50e] 43e9 02d6                 lea.l      726(a1),a1
[0004b512] 41f9 0011 3590            lea.l      scrap,a0
[0004b518] 4eb9 0008 2f0c            jsr        strcpy
[0004b51e] 2257                      movea.l    (a7),a1
[0004b520] 41f9 0011 3590            lea.l      scrap,a0
[0004b526] 4eb9 0008 2e42            jsr        strcat
[0004b52c] 43f9 000e 0840            lea.l      $000E0840,a1
[0004b532] 41f9 0011 3590            lea.l      scrap,a0
[0004b538] 4eb9 0008 2e42            jsr        strcat
[0004b53e] 41f9 0011 3590            lea.l      scrap,a0
[0004b544] 584f                      addq.w     #4,a7
[0004b546] 4e75                      rts
Af_2drv:
[0004b548] 594f                      subq.w     #4,a7
[0004b54a] 2e88                      move.l     a0,(a7)
[0004b54c] 2057                      movea.l    (a7),a0
[0004b54e] 0c28 003a 0001            cmpi.b     #$3A,1(a0)
[0004b554] 6624                      bne.s      $0004B57A
[0004b556] 2057                      movea.l    (a7),a0
[0004b558] 1010                      move.b     (a0),d0
[0004b55a] 4880                      ext.w      d0
[0004b55c] 4eb9 0008 37bc            jsr        isalpha
[0004b562] 4a40                      tst.w      d0
[0004b564] 6714                      beq.s      $0004B57A
[0004b566] 2057                      movea.l    (a7),a0
[0004b568] 1010                      move.b     (a0),d0
[0004b56a] 4880                      ext.w      d0
[0004b56c] 4eb9 0008 3824            jsr        toupper
[0004b572] d07c ffbf                 add.w      #$FFBF,d0
[0004b576] 600a                      bra.s      $0004B582
[0004b578] 6008                      bra.s      $0004B582
[0004b57a] 4eb9 0008 0bd2            jsr        Dgetdrv
[0004b580] 4e71                      nop
[0004b582] 584f                      addq.w     #4,a7
[0004b584] 4e75                      rts
Af_2path:
[0004b586] 4fef fff0                 lea.l      -16(a7),a7
[0004b58a] 2f48 000c                 move.l     a0,12(a7)
[0004b58e] 2f49 0008                 move.l     a1,8(a7)
[0004b592] 705c                      moveq.l    #92,d0
[0004b594] 206f 0008                 movea.l    8(a7),a0
[0004b598] 4eb9 0008 2e8a            jsr        strchr
[0004b59e] 2f48 0004                 move.l     a0,4(a7)
[0004b5a2] 202f 0004                 move.l     4(a7),d0
[0004b5a6] 6638                      bne.s      $0004B5E0
[0004b5a8] 4240                      clr.w      d0
[0004b5aa] 206f 000c                 movea.l    12(a7),a0
[0004b5ae] 4eb9 0008 0be0            jsr        Dgetpath
[0004b5b4] 206f 000c                 movea.l    12(a7),a0
[0004b5b8] 4eb9 0008 2f6c            jsr        strlen
[0004b5be] 5380                      subq.l     #1,d0
[0004b5c0] 206f 000c                 movea.l    12(a7),a0
[0004b5c4] 0c30 005c 0800            cmpi.b     #$5C,0(a0,d0.l)
[0004b5ca] 6710                      beq.s      $0004B5DC
[0004b5cc] 43f9 000e 0845            lea.l      $000E0845,a1
[0004b5d2] 206f 000c                 movea.l    12(a7),a0
[0004b5d6] 4eb9 0008 2e42            jsr        strcat
[0004b5dc] 6000 0086                 bra        $0004B664
[0004b5e0] 206f 0008                 movea.l    8(a7),a0
[0004b5e4] 1010                      move.b     (a0),d0
[0004b5e6] 4880                      ext.w      d0
[0004b5e8] 4eb9 0008 381a            jsr        isascii
[0004b5ee] 4a40                      tst.w      d0
[0004b5f0] 671e                      beq.s      $0004B610
[0004b5f2] 206f 0008                 movea.l    8(a7),a0
[0004b5f6] 1010                      move.b     (a0),d0
[0004b5f8] 4880                      ext.w      d0
[0004b5fa] 4eb9 0008 37aa            jsr        isalnum
[0004b600] 4a40                      tst.w      d0
[0004b602] 670c                      beq.s      $0004B610
[0004b604] 206f 0008                 movea.l    8(a7),a0
[0004b608] 0c28 003a 0001            cmpi.b     #$3A,1(a0)
[0004b60e] 6706                      beq.s      $0004B616
[0004b610] 2f6f 0008 0004            move.l     8(a7),4(a7)
[0004b616] 7002                      moveq.l    #2,d0
[0004b618] 43f9 000e 0847            lea.l      $000E0847,a1
[0004b61e] 206f 0008                 movea.l    8(a7),a0
[0004b622] 4eb9 0004 6798            jsr        Ast_ncmp
[0004b628] 4a40                      tst.w      d0
[0004b62a] 660e                      bne.s      $0004B63A
[0004b62c] 4240                      clr.w      d0
[0004b62e] 206f 000c                 movea.l    12(a7),a0
[0004b632] 4eb9 0008 0be0            jsr        Dgetpath
[0004b638] 6006                      bra.s      $0004B640
[0004b63a] 206f 000c                 movea.l    12(a7),a0
[0004b63e] 4210                      clr.b      (a0)
[0004b640] 705c                      moveq.l    #92,d0
[0004b642] 206f 0008                 movea.l    8(a7),a0
[0004b646] 4eb9 0008 2e9e            jsr        strrchr
[0004b64c] 2e88                      move.l     a0,(a7)
[0004b64e] 2017                      move.l     (a7),d0
[0004b650] 90af 0004                 sub.l      4(a7),d0
[0004b654] 5280                      addq.l     #1,d0
[0004b656] 226f 0004                 movea.l    4(a7),a1
[0004b65a] 206f 000c                 movea.l    12(a7),a0
[0004b65e] 4eb9 0008 2f96            jsr        strncat
[0004b664] 206f 000c                 movea.l    12(a7),a0
[0004b668] 4fef 0010                 lea.l      16(a7),a7
[0004b66c] 4e75                      rts
Af_2name:
[0004b66e] 4fef fff0                 lea.l      -16(a7),a7
[0004b672] 2f48 000c                 move.l     a0,12(a7)
[0004b676] 2f49 0008                 move.l     a1,8(a7)
[0004b67a] 705c                      moveq.l    #92,d0
[0004b67c] 206f 0008                 movea.l    8(a7),a0
[0004b680] 4eb9 0008 2e9e            jsr        strrchr
[0004b686] 2f48 0004                 move.l     a0,4(a7)
[0004b68a] 202f 0004                 move.l     4(a7),d0
[0004b68e] 6624                      bne.s      $0004B6B4
[0004b690] 703a                      moveq.l    #58,d0
[0004b692] 206f 0008                 movea.l    8(a7),a0
[0004b696] 4eb9 0008 2e9e            jsr        strrchr
[0004b69c] 2f48 0004                 move.l     a0,4(a7)
[0004b6a0] 202f 0004                 move.l     4(a7),d0
[0004b6a4] 6608                      bne.s      $0004B6AE
[0004b6a6] 2f6f 0008 0004            move.l     8(a7),4(a7)
[0004b6ac] 6004                      bra.s      $0004B6B2
[0004b6ae] 52af 0004                 addq.l     #1,4(a7)
[0004b6b2] 6004                      bra.s      $0004B6B8
[0004b6b4] 52af 0004                 addq.l     #1,4(a7)
[0004b6b8] 702e                      moveq.l    #46,d0
[0004b6ba] 206f 0004                 movea.l    4(a7),a0
[0004b6be] 4eb9 0008 2e9e            jsr        strrchr
[0004b6c4] 2e88                      move.l     a0,(a7)
[0004b6c6] 2017                      move.l     (a7),d0
[0004b6c8] 6610                      bne.s      $0004B6DA
[0004b6ca] 226f 0004                 movea.l    4(a7),a1
[0004b6ce] 206f 000c                 movea.l    12(a7),a0
[0004b6d2] 4eb9 0008 2f0c            jsr        strcpy
[0004b6d8] 6022                      bra.s      $0004B6FC
[0004b6da] 2017                      move.l     (a7),d0
[0004b6dc] 90af 0004                 sub.l      4(a7),d0
[0004b6e0] 226f 0004                 movea.l    4(a7),a1
[0004b6e4] 206f 000c                 movea.l    12(a7),a0
[0004b6e8] 4eb9 0008 2fd6            jsr        strncpy
[0004b6ee] 2057                      movea.l    (a7),a0
[0004b6f0] 91ef 0004                 suba.l     4(a7),a0
[0004b6f4] 226f 000c                 movea.l    12(a7),a1
[0004b6f8] 4231 8800                 clr.b      0(a1,a0.l)
[0004b6fc] 206f 000c                 movea.l    12(a7),a0
[0004b700] 4fef 0010                 lea.l      16(a7),a7
[0004b704] 4e75                      rts
Af_2fullname:
[0004b706] 4fef fff4                 lea.l      -12(a7),a7
[0004b70a] 2f48 0008                 move.l     a0,8(a7)
[0004b70e] 2f49 0004                 move.l     a1,4(a7)
[0004b712] 705c                      moveq.l    #92,d0
[0004b714] 206f 0004                 movea.l    4(a7),a0
[0004b718] 4eb9 0008 2e9e            jsr        strrchr
[0004b71e] 2e88                      move.l     a0,(a7)
[0004b720] 2017                      move.l     (a7),d0
[0004b722] 661c                      bne.s      $0004B740
[0004b724] 703a                      moveq.l    #58,d0
[0004b726] 206f 0004                 movea.l    4(a7),a0
[0004b72a] 4eb9 0008 2e9e            jsr        strrchr
[0004b730] 2e88                      move.l     a0,(a7)
[0004b732] 2017                      move.l     (a7),d0
[0004b734] 6606                      bne.s      $0004B73C
[0004b736] 2eaf 0004                 move.l     4(a7),(a7)
[0004b73a] 6002                      bra.s      $0004B73E
[0004b73c] 5297                      addq.l     #1,(a7)
[0004b73e] 6002                      bra.s      $0004B742
[0004b740] 5297                      addq.l     #1,(a7)
[0004b742] 2257                      movea.l    (a7),a1
[0004b744] 206f 0008                 movea.l    8(a7),a0
[0004b748] 4eb9 0008 2f0c            jsr        strcpy
[0004b74e] 206f 0008                 movea.l    8(a7),a0
[0004b752] 4fef 000c                 lea.l      12(a7),a7
[0004b756] 4e75                      rts
Af_2ext:
[0004b758] 4fef fff0                 lea.l      -16(a7),a7
[0004b75c] 2f48 000c                 move.l     a0,12(a7)
[0004b760] 2f49 0008                 move.l     a1,8(a7)
[0004b764] 705c                      moveq.l    #92,d0
[0004b766] 206f 0008                 movea.l    8(a7),a0
[0004b76a] 4eb9 0008 2e9e            jsr        strrchr
[0004b770] 2e88                      move.l     a0,(a7)
[0004b772] 702e                      moveq.l    #46,d0
[0004b774] 206f 0008                 movea.l    8(a7),a0
[0004b778] 4eb9 0008 2e9e            jsr        strrchr
[0004b77e] 2f48 0004                 move.l     a0,4(a7)
[0004b782] 202f 0004                 move.l     4(a7),d0
[0004b786] 6708                      beq.s      $0004B790
[0004b788] 2057                      movea.l    (a7),a0
[0004b78a] b1ef 0004                 cmpa.l     4(a7),a0
[0004b78e] 6312                      bls.s      $0004B7A2
[0004b790] 43f9 000e 084a            lea.l      $000E084A,a1
[0004b796] 206f 000c                 movea.l    12(a7),a0
[0004b79a] 4eb9 0008 2f0c            jsr        strcpy
[0004b7a0] 6010                      bra.s      $0004B7B2
[0004b7a2] 226f 0004                 movea.l    4(a7),a1
[0004b7a6] 5249                      addq.w     #1,a1
[0004b7a8] 206f 000c                 movea.l    12(a7),a0
[0004b7ac] 4eb9 0008 2f0c            jsr        strcpy
[0004b7b2] 206f 000c                 movea.l    12(a7),a0
[0004b7b6] 4fef 0010                 lea.l      16(a7),a7
[0004b7ba] 4e75                      rts
Af_buildname:
[0004b7bc] 4fef fff2                 lea.l      -14(a7),a7
[0004b7c0] 2f48 000a                 move.l     a0,10(a7)
[0004b7c4] 3f40 0008                 move.w     d0,8(a7)
[0004b7c8] 2f49 0004                 move.l     a1,4(a7)
[0004b7cc] 2ebc 0000 0003            move.l     #$00000003,(a7)
[0004b7d2] 43f9 000e 084b            lea.l      $000E084B,a1
[0004b7d8] 206f 000a                 movea.l    10(a7),a0
[0004b7dc] 4eb9 0008 2f0c            jsr        strcpy
[0004b7e2] 302f 0008                 move.w     8(a7),d0
[0004b7e6] 6b0c                      bmi.s      $0004B7F4
[0004b7e8] 102f 0009                 move.b     9(a7),d0
[0004b7ec] 206f 000a                 movea.l    10(a7),a0
[0004b7f0] d110                      add.b      d0,(a0)
[0004b7f2] 600c                      bra.s      $0004B800
[0004b7f4] 4eb9 0008 0bd2            jsr        Dgetdrv
[0004b7fa] 206f 000a                 movea.l    10(a7),a0
[0004b7fe] d110                      add.b      d0,(a0)
[0004b800] 202f 0004                 move.l     4(a7),d0
[0004b804] 6708                      beq.s      $0004B80E
[0004b806] 206f 0004                 movea.l    4(a7),a0
[0004b80a] 1010                      move.b     (a0),d0
[0004b80c] 6632                      bne.s      $0004B840
[0004b80e] 206f 000a                 movea.l    10(a7),a0
[0004b812] 1010                      move.b     (a0),d0
[0004b814] 4880                      ext.w      d0
[0004b816] d07c ffc0                 add.w      #$FFC0,d0
[0004b81a] 206f 000a                 movea.l    10(a7),a0
[0004b81e] 5448                      addq.w     #2,a0
[0004b820] 4eb9 0008 0be0            jsr        Dgetpath
[0004b826] 43f9 000e 084f            lea.l      $000E084F,a1
[0004b82c] 206f 000a                 movea.l    10(a7),a0
[0004b830] 4eb9 0008 2e42            jsr        strcat
[0004b836] 4eb9 0008 2f6c            jsr        strlen
[0004b83c] 2e80                      move.l     d0,(a7)
[0004b83e] 6054                      bra.s      $0004B894
[0004b840] 206f 0004                 movea.l    4(a7),a0
[0004b844] 0c10 005c                 cmpi.b     #$5C,(a0)
[0004b848] 6608                      bne.s      $0004B852
[0004b84a] 226f 0004                 movea.l    4(a7),a1
[0004b84e] 5249                      addq.w     #1,a1
[0004b850] 6004                      bra.s      $0004B856
[0004b852] 226f 0004                 movea.l    4(a7),a1
[0004b856] 2017                      move.l     (a7),d0
[0004b858] 206f 000a                 movea.l    10(a7),a0
[0004b85c] d1c0                      adda.l     d0,a0
[0004b85e] 4eb9 0008 2f0c            jsr        strcpy
[0004b864] 206f 000a                 movea.l    10(a7),a0
[0004b868] 4eb9 0008 2f6c            jsr        strlen
[0004b86e] 2e80                      move.l     d0,(a7)
[0004b870] 2017                      move.l     (a7),d0
[0004b872] 206f 000a                 movea.l    10(a7),a0
[0004b876] 0c30 005c 08ff            cmpi.b     #$5C,-1(a0,d0.l)
[0004b87c] 6716                      beq.s      $0004B894
[0004b87e] 43f9 000e 0851            lea.l      $000E0851,a1
[0004b884] 2017                      move.l     (a7),d0
[0004b886] 206f 000a                 movea.l    10(a7),a0
[0004b88a] d1c0                      adda.l     d0,a0
[0004b88c] 4eb9 0008 2f0c            jsr        strcpy
[0004b892] 5297                      addq.l     #1,(a7)
[0004b894] 202f 0012                 move.l     18(a7),d0
[0004b898] 6756                      beq.s      $0004B8F0
[0004b89a] 226f 0012                 movea.l    18(a7),a1
[0004b89e] 206f 000a                 movea.l    10(a7),a0
[0004b8a2] 4eb9 0008 2e42            jsr        strcat
[0004b8a8] 202f 0016                 move.l     22(a7),d0
[0004b8ac] 6742                      beq.s      $0004B8F0
[0004b8ae] 206f 000a                 movea.l    10(a7),a0
[0004b8b2] 4eb9 0008 2f6c            jsr        strlen
[0004b8b8] 2e80                      move.l     d0,(a7)
[0004b8ba] 2017                      move.l     (a7),d0
[0004b8bc] 206f 000a                 movea.l    10(a7),a0
[0004b8c0] 0c30 002e 08ff            cmpi.b     #$2E,-1(a0,d0.l)
[0004b8c6] 6716                      beq.s      $0004B8DE
[0004b8c8] 43f9 000e 0853            lea.l      $000E0853,a1
[0004b8ce] 2017                      move.l     (a7),d0
[0004b8d0] 206f 000a                 movea.l    10(a7),a0
[0004b8d4] d1c0                      adda.l     d0,a0
[0004b8d6] 4eb9 0008 2f0c            jsr        strcpy
[0004b8dc] 5297                      addq.l     #1,(a7)
[0004b8de] 226f 0016                 movea.l    22(a7),a1
[0004b8e2] 2017                      move.l     (a7),d0
[0004b8e4] 206f 000a                 movea.l    10(a7),a0
[0004b8e8] d1c0                      adda.l     d0,a0
[0004b8ea] 4eb9 0008 2f0c            jsr        strcpy
[0004b8f0] 206f 000a                 movea.l    10(a7),a0
[0004b8f4] 4fef 000e                 lea.l      14(a7),a7
[0004b8f8] 4e75                      rts
Af_length:
[0004b8fa] 4fef ffec                 lea.l      -20(a7),a7
[0004b8fe] 2f48 0010                 move.l     a0,16(a7)
[0004b902] 2ebc ffff fffe            move.l     #$FFFFFFFE,(a7)
[0004b908] 202f 0010                 move.l     16(a7),d0
[0004b90c] 6708                      beq.s      $0004B916
[0004b90e] 206f 0010                 movea.l    16(a7),a0
[0004b912] 1010                      move.b     (a0),d0
[0004b914] 6606                      bne.s      $0004B91C
[0004b916] 70fe                      moveq.l    #-2,d0
[0004b918] 6000 011e                 bra        $0004BA38
[0004b91c] 206f 0010                 movea.l    16(a7),a0
[0004b920] 1028 0001                 move.b     1(a0),d0
[0004b924] 6610                      bne.s      $0004B936
[0004b926] 206f 0010                 movea.l    16(a7),a0
[0004b92a] 0c10 005c                 cmpi.b     #$5C,(a0)
[0004b92e] 6606                      bne.s      $0004B936
[0004b930] 70ff                      moveq.l    #-1,d0
[0004b932] 6000 0104                 bra        $0004BA38
[0004b936] 206f 0010                 movea.l    16(a7),a0
[0004b93a] 1010                      move.b     (a0),d0
[0004b93c] 4880                      ext.w      d0
[0004b93e] 4eb9 0008 381a            jsr        isascii
[0004b944] 4a40                      tst.w      d0
[0004b946] 6750                      beq.s      $0004B998
[0004b948] 206f 0010                 movea.l    16(a7),a0
[0004b94c] 1010                      move.b     (a0),d0
[0004b94e] 4880                      ext.w      d0
[0004b950] 4eb9 0008 37bc            jsr        isalpha
[0004b956] 4a40                      tst.w      d0
[0004b958] 673e                      beq.s      $0004B998
[0004b95a] 43f9 000e 0855            lea.l      $000E0855,a1
[0004b960] 206f 0010                 movea.l    16(a7),a0
[0004b964] 5248                      addq.w     #1,a0
[0004b966] 4eb9 0004 665a            jsr        Ast_cmp
[0004b96c] 4a40                      tst.w      d0
[0004b96e] 6628                      bne.s      $0004B998
[0004b970] 4eb9 0008 0bd2            jsr        Dgetdrv
[0004b976] 4eb9 0008 0c48            jsr        Dsetdrv
[0004b97c] 7201                      moveq.l    #1,d1
[0004b97e] 74bf                      moveq.l    #-65,d2
[0004b980] 206f 0010                 movea.l    16(a7),a0
[0004b984] d410                      add.b      (a0),d2
[0004b986] e5a9                      lsl.l      d2,d1
[0004b988] c081                      and.l      d1,d0
[0004b98a] 6706                      beq.s      $0004B992
[0004b98c] 70ff                      moveq.l    #-1,d0
[0004b98e] 6000 00a8                 bra        $0004BA38
[0004b992] 70fe                      moveq.l    #-2,d0
[0004b994] 6000 00a2                 bra        $0004BA38
[0004b998] 4eb9 0004 eec0            jsr        Amo_busy
[0004b99e] 705c                      moveq.l    #92,d0
[0004b9a0] 206f 0010                 movea.l    16(a7),a0
[0004b9a4] 4eb9 0008 2e9e            jsr        strrchr
[0004b9aa] 2f48 0008                 move.l     a0,8(a7)
[0004b9ae] 202f 0008                 move.l     8(a7),d0
[0004b9b2] 6712                      beq.s      $0004B9C6
[0004b9b4] 206f 0008                 movea.l    8(a7),a0
[0004b9b8] 1028 0001                 move.b     1(a0),d0
[0004b9bc] 6608                      bne.s      $0004B9C6
[0004b9be] 206f 0008                 movea.l    8(a7),a0
[0004b9c2] 4210                      clr.b      (a0)
[0004b9c4] 6004                      bra.s      $0004B9CA
[0004b9c6] 42af 0008                 clr.l      8(a7)
[0004b9ca] 4241                      clr.w      d1
[0004b9cc] 4240                      clr.w      d0
[0004b9ce] 206f 0010                 movea.l    16(a7),a0
[0004b9d2] 4eb9 0008 0c68            jsr        Fattrib
[0004b9d8] 2f40 000c                 move.l     d0,12(a7)
[0004b9dc] 202f 000c                 move.l     12(a7),d0
[0004b9e0] 6b40                      bmi.s      $0004BA22
[0004b9e2] 7010                      moveq.l    #16,d0
[0004b9e4] c06f 000e                 and.w      14(a7),d0
[0004b9e8] 6708                      beq.s      $0004B9F2
[0004b9ea] 2ebc ffff ffff            move.l     #$FFFFFFFF,(a7)
[0004b9f0] 6030                      bra.s      $0004BA22
[0004b9f2] 4240                      clr.w      d0
[0004b9f4] 206f 0010                 movea.l    16(a7),a0
[0004b9f8] 4eb9 0008 0cc0            jsr        Fopen
[0004b9fe] 2f40 0004                 move.l     d0,4(a7)
[0004ba02] 202f 0004                 move.l     4(a7),d0
[0004ba06] 6f1a                      ble.s      $0004BA22
[0004ba08] 7402                      moveq.l    #2,d2
[0004ba0a] 322f 0006                 move.w     6(a7),d1
[0004ba0e] 7000                      moveq.l    #0,d0
[0004ba10] 4eb9 0008 0cfe            jsr        Fseek
[0004ba16] 2e80                      move.l     d0,(a7)
[0004ba18] 302f 0006                 move.w     6(a7),d0
[0004ba1c] 4eb9 0008 0c7e            jsr        Fclose
[0004ba22] 4eb9 0004 ef0c            jsr        Amo_unbusy
[0004ba28] 202f 0008                 move.l     8(a7),d0
[0004ba2c] 6708                      beq.s      $0004BA36
[0004ba2e] 206f 0008                 movea.l    8(a7),a0
[0004ba32] 10bc 005c                 move.b     #$5C,(a0)
[0004ba36] 2017                      move.l     (a7),d0
[0004ba38] 4fef 0014                 lea.l      20(a7),a7
[0004ba3c] 4e75                      rts
Af_readdirOld:
[0004ba3e] 4fef ffbe                 lea.l      -66(a7),a7
[0004ba42] 2f48 003e                 move.l     a0,62(a7)
[0004ba46] 206f 003e                 movea.l    62(a7),a0
[0004ba4a] 4eb9 0008 2f6c            jsr        strlen
[0004ba50] 2f40 0008                 move.l     d0,8(a7)
[0004ba54] 202f 0008                 move.l     8(a7),d0
[0004ba58] 206f 003e                 movea.l    62(a7),a0
[0004ba5c] 0c30 005c 08ff            cmpi.b     #$5C,-1(a0,d0.l)
[0004ba62] 6612                      bne.s      $0004BA76
[0004ba64] 43f9 000e 0858            lea.l      $000E0858,a1
[0004ba6a] 206f 003e                 movea.l    62(a7),a0
[0004ba6e] 4eb9 0008 2e42            jsr        strcat
[0004ba74] 6010                      bra.s      $0004BA86
[0004ba76] 43f9 000e 085c            lea.l      $000E085C,a1
[0004ba7c] 206f 003e                 movea.l    62(a7),a0
[0004ba80] 4eb9 0008 2e42            jsr        strcat
[0004ba86] 4eb9 0008 0cb0            jsr        Fgetdta
[0004ba8c] 2f48 003a                 move.l     a0,58(a7)
[0004ba90] 41ef 000e                 lea.l      14(a7),a0
[0004ba94] 4eb9 0008 0d2e            jsr        Fsetdta
[0004ba9a] 7000                      moveq.l    #0,d0
[0004ba9c] 2e80                      move.l     d0,(a7)
[0004ba9e] 2f40 0004                 move.l     d0,4(a7)
[0004baa2] 7011                      moveq.l    #17,d0
[0004baa4] 206f 003e                 movea.l    62(a7),a0
[0004baa8] 4eb9 0008 0d3e            jsr        Fsfirst
[0004baae] 3f40 000c                 move.w     d0,12(a7)
[0004bab2] 6000 0148                 bra        $0004BBFC
[0004bab6] 43f9 000e 0861            lea.l      $000E0861,a1
[0004babc] 41ef 002c                 lea.l      44(a7),a0
[0004bac0] 4eb9 0004 665a            jsr        Ast_cmp
[0004bac6] 4a40                      tst.w      d0
[0004bac8] 6700 0128                 beq        $0004BBF2
[0004bacc] 43f9 000e 0863            lea.l      $000E0863,a1
[0004bad2] 41ef 002c                 lea.l      44(a7),a0
[0004bad6] 4eb9 0004 665a            jsr        Ast_cmp
[0004badc] 4a40                      tst.w      d0
[0004bade] 6700 0112                 beq        $0004BBF2
[0004bae2] 202f 0004                 move.l     4(a7),d0
[0004bae6] 6624                      bne.s      $0004BB0C
[0004bae8] 703c                      moveq.l    #60,d0
[0004baea] 4eb9 0004 c608            jsr        Ax_malloc
[0004baf0] 2e88                      move.l     a0,(a7)
[0004baf2] 2017                      move.l     (a7),d0
[0004baf4] 6604                      bne.s      $0004BAFA
[0004baf6] 6000 010c                 bra        $0004BC04
[0004bafa] 723c                      moveq.l    #60,d1
[0004bafc] 4240                      clr.w      d0
[0004bafe] 2057                      movea.l    (a7),a0
[0004bb00] 4eb9 0008 36ea            jsr        memset
[0004bb06] 2f57 0004                 move.l     (a7),4(a7)
[0004bb0a] 602c                      bra.s      $0004BB38
[0004bb0c] 703c                      moveq.l    #60,d0
[0004bb0e] 4eb9 0004 c608            jsr        Ax_malloc
[0004bb14] 2257                      movea.l    (a7),a1
[0004bb16] 2348 0004                 move.l     a0,4(a1)
[0004bb1a] 2057                      movea.l    (a7),a0
[0004bb1c] 2028 0004                 move.l     4(a0),d0
[0004bb20] 6604                      bne.s      $0004BB26
[0004bb22] 6000 00e0                 bra        $0004BC04
[0004bb26] 2057                      movea.l    (a7),a0
[0004bb28] 2ea8 0004                 move.l     4(a0),(a7)
[0004bb2c] 723c                      moveq.l    #60,d1
[0004bb2e] 4240                      clr.w      d0
[0004bb30] 2057                      movea.l    (a7),a0
[0004bb32] 4eb9 0008 36ea            jsr        memset
[0004bb38] 7014                      moveq.l    #20,d0
[0004bb3a] d0af 0008                 add.l      8(a7),d0
[0004bb3e] 4eb9 0004 c608            jsr        Ax_malloc
[0004bb44] 2257                      movea.l    (a7),a1
[0004bb46] 2288                      move.l     a0,(a1)
[0004bb48] 2057                      movea.l    (a7),a0
[0004bb4a] 2010                      move.l     (a0),d0
[0004bb4c] 6604                      bne.s      $0004BB52
[0004bb4e] 6000 00b4                 bra        $0004BC04
[0004bb52] 2057                      movea.l    (a7),a0
[0004bb54] 2050                      movea.l    (a0),a0
[0004bb56] 4210                      clr.b      (a0)
[0004bb58] 226f 003e                 movea.l    62(a7),a1
[0004bb5c] 2057                      movea.l    (a7),a0
[0004bb5e] 2050                      movea.l    (a0),a0
[0004bb60] 4eb9 0008 2f0c            jsr        strcpy
[0004bb66] 2057                      movea.l    (a7),a0
[0004bb68] 2050                      movea.l    (a0),a0
[0004bb6a] 4eb9 0008 2f6c            jsr        strlen
[0004bb70] 5780                      subq.l     #3,d0
[0004bb72] 2057                      movea.l    (a7),a0
[0004bb74] 2050                      movea.l    (a0),a0
[0004bb76] 4230 0800                 clr.b      0(a0,d0.l)
[0004bb7a] 43ef 002c                 lea.l      44(a7),a1
[0004bb7e] 2057                      movea.l    (a7),a0
[0004bb80] 2050                      movea.l    (a0),a0
[0004bb82] 4eb9 0008 2e42            jsr        strcat
[0004bb88] 7010                      moveq.l    #16,d0
[0004bb8a] c02f 0023                 and.b      35(a7),d0
[0004bb8e] 6710                      beq.s      $0004BBA0
[0004bb90] 43f9 000e 0866            lea.l      $000E0866,a1
[0004bb96] 2057                      movea.l    (a7),a0
[0004bb98] 2050                      movea.l    (a0),a0
[0004bb9a] 4eb9 0008 2e42            jsr        strcat
[0004bba0] 102f 0023                 move.b     35(a7),d0
[0004bba4] 4880                      ext.w      d0
[0004bba6] 2057                      movea.l    (a7),a0
[0004bba8] 3140 0030                 move.w     d0,48(a0)
[0004bbac] 2057                      movea.l    (a7),a0
[0004bbae] 316f 0024 0024            move.w     36(a7),36(a0)
[0004bbb4] 2057                      movea.l    (a7),a0
[0004bbb6] 316f 0024 0028            move.w     36(a7),40(a0)
[0004bbbc] 2057                      movea.l    (a7),a0
[0004bbbe] 316f 0024 002c            move.w     36(a7),44(a0)
[0004bbc4] 2057                      movea.l    (a7),a0
[0004bbc6] 316f 0026 0026            move.w     38(a7),38(a0)
[0004bbcc] 2057                      movea.l    (a7),a0
[0004bbce] 316f 0026 002a            move.w     38(a7),42(a0)
[0004bbd4] 2057                      movea.l    (a7),a0
[0004bbd6] 316f 0026 002e            move.w     38(a7),46(a0)
[0004bbdc] 206f 003e                 movea.l    62(a7),a0
[0004bbe0] 6100 f966                 bsr        Af_2drv
[0004bbe4] 2057                      movea.l    (a7),a0
[0004bbe6] 3140 000e                 move.w     d0,14(a0)
[0004bbea] 2057                      movea.l    (a7),a0
[0004bbec] 216f 0028 0018            move.l     40(a7),24(a0)
[0004bbf2] 4eb9 0008 0d50            jsr        Fsnext
[0004bbf8] 3f40 000c                 move.w     d0,12(a7)
[0004bbfc] 302f 000c                 move.w     12(a7),d0
[0004bc00] 6700 feb4                 beq        $0004BAB6
[0004bc04] 206f 003a                 movea.l    58(a7),a0
[0004bc08] 4eb9 0008 0d2e            jsr        Fsetdta
[0004bc0e] 302f 000c                 move.w     12(a7),d0
[0004bc12] 6612                      bne.s      $0004BC26
[0004bc14] 206f 0004                 movea.l    4(a7),a0
[0004bc18] 4eb9 0004 c0a6            jsr        Af_freedir
[0004bc1e] 7000                      moveq.l    #0,d0
[0004bc20] 2e80                      move.l     d0,(a7)
[0004bc22] 2f40 0004                 move.l     d0,4(a7)
[0004bc26] 206f 0004                 movea.l    4(a7),a0
[0004bc2a] 4fef 0042                 lea.l      66(a7),a7
[0004bc2e] 4e75                      rts
Af_readdirNew:
[0004bc30] 4fef ffa8                 lea.l      -88(a7),a7
[0004bc34] 2f48 0054                 move.l     a0,84(a7)
[0004bc38] 426f 0040                 clr.w      64(a7)
[0004bc3c] 206f 0054                 movea.l    84(a7),a0
[0004bc40] 4eb9 0008 2f6c            jsr        strlen
[0004bc46] 2f40 004c                 move.l     d0,76(a7)
[0004bc4a] 70ff                      moveq.l    #-1,d0
[0004bc4c] 206f 0054                 movea.l    84(a7),a0
[0004bc50] 4eb9 0008 0c04            jsr        Dpathcon
[0004bc56] 2f40 0050                 move.l     d0,80(a7)
[0004bc5a] 70e0                      moveq.l    #-32,d0
[0004bc5c] b0af 0050                 cmp.l      80(a7),d0
[0004bc60] 6732                      beq.s      $0004BC94
[0004bc62] 7002                      moveq.l    #2,d0
[0004bc64] b0af 0050                 cmp.l      80(a7),d0
[0004bc68] 6e2a                      bgt.s      $0004BC94
[0004bc6a] 7002                      moveq.l    #2,d0
[0004bc6c] 206f 0054                 movea.l    84(a7),a0
[0004bc70] 4eb9 0008 0c04            jsr        Dpathcon
[0004bc76] 2f40 0050                 move.l     d0,80(a7)
[0004bc7a] 70e0                      moveq.l    #-32,d0
[0004bc7c] b0af 0050                 cmp.l      80(a7),d0
[0004bc80] 6708                      beq.s      $0004BC8A
[0004bc82] 701e                      moveq.l    #30,d0
[0004bc84] d06f 0052                 add.w      82(a7),d0
[0004bc88] 6004                      bra.s      $0004BC8E
[0004bc8a] 303c 0096                 move.w     #$0096,d0
[0004bc8e] 3f40 0042                 move.w     d0,66(a7)
[0004bc92] 6006                      bra.s      $0004BC9A
[0004bc94] 3f7c 0096 0042            move.w     #$0096,66(a7)
[0004bc9a] 302f 0042                 move.w     66(a7),d0
[0004bc9e] 48c0                      ext.l      d0
[0004bca0] 4eb9 0004 c608            jsr        Ax_malloc
[0004bca6] 2f48 0034                 move.l     a0,52(a7)
[0004bcaa] 202f 0034                 move.l     52(a7),d0
[0004bcae] 6606                      bne.s      $0004BCB6
[0004bcb0] 91c8                      suba.l     a0,a0
[0004bcb2] 6000 02e8                 bra        $0004BF9C
[0004bcb6] 206f 0034                 movea.l    52(a7),a0
[0004bcba] 4210                      clr.b      (a0)
[0004bcbc] 4240                      clr.w      d0
[0004bcbe] 206f 0054                 movea.l    84(a7),a0
[0004bcc2] 4eb9 0008 0bf2            jsr        Dopendir
[0004bcc8] 2f40 0048                 move.l     d0,72(a7)
[0004bccc] 202f 0048                 move.l     72(a7),d0
[0004bcd0] c0bc ff00 0000            and.l      #$FF000000,d0
[0004bcd6] b0bc ff00 0000            cmp.l      #$FF000000,d0
[0004bcdc] 6718                      beq.s      $0004BCF6
[0004bcde] 70de                      moveq.l    #-34,d0
[0004bce0] b0af 0048                 cmp.l      72(a7),d0
[0004bce4] 6710                      beq.s      $0004BCF6
[0004bce6] 70dc                      moveq.l    #-36,d0
[0004bce8] b0af 0048                 cmp.l      72(a7),d0
[0004bcec] 6708                      beq.s      $0004BCF6
[0004bcee] 70d9                      moveq.l    #-39,d0
[0004bcf0] b0af 0048                 cmp.l      72(a7),d0
[0004bcf4] 6616                      bne.s      $0004BD0C
[0004bcf6] 202f 0048                 move.l     72(a7),d0
[0004bcfa] 6b0a                      bmi.s      $0004BD06
[0004bcfc] 202f 0048                 move.l     72(a7),d0
[0004bd00] 4eb9 0008 0bb2            jsr        Dclosedi
[0004bd06] 91c8                      suba.l     a0,a0
[0004bd08] 6000 0292                 bra        $0004BF9C
[0004bd0c] 7000                      moveq.l    #0,d0
[0004bd0e] 2f40 0038                 move.l     d0,56(a7)
[0004bd12] 2f40 003c                 move.l     d0,60(a7)
[0004bd16] 486f 0044                 pea.l      68(a7)
[0004bd1a] 43ef 0004                 lea.l      4(a7),a1
[0004bd1e] 206f 0038                 movea.l    56(a7),a0
[0004bd22] 222f 004c                 move.l     76(a7),d1
[0004bd26] 302f 0046                 move.w     70(a7),d0
[0004bd2a] 4eb9 0008 0c2c            jsr        Dxreaddi
[0004bd30] 584f                      addq.w     #4,a7
[0004bd32] 2f40 0050                 move.l     d0,80(a7)
[0004bd36] 70e0                      moveq.l    #-32,d0
[0004bd38] b0af 0050                 cmp.l      80(a7),d0
[0004bd3c] 665c                      bne.s      $0004BD9A
[0004bd3e] 206f 0034                 movea.l    52(a7),a0
[0004bd42] 222f 0048                 move.l     72(a7),d1
[0004bd46] 302f 0042                 move.w     66(a7),d0
[0004bd4a] 4eb9 0008 0c16            jsr        Dreaddir
[0004bd50] 2f40 0050                 move.l     d0,80(a7)
[0004bd54] 6016                      bra.s      $0004BD6C
[0004bd56] 206f 0034                 movea.l    52(a7),a0
[0004bd5a] 222f 0048                 move.l     72(a7),d1
[0004bd5e] 302f 0042                 move.w     66(a7),d0
[0004bd62] 4eb9 0008 0c16            jsr        Dreaddir
[0004bd68] 2f40 0050                 move.l     d0,80(a7)
[0004bd6c] 70c0                      moveq.l    #-64,d0
[0004bd6e] b0af 0050                 cmp.l      80(a7),d0
[0004bd72] 67e2                      beq.s      $0004BD56
[0004bd74] 202f 0050                 move.l     80(a7),d0
[0004bd78] 6a16                      bpl.s      $0004BD90
[0004bd7a] 70cf                      moveq.l    #-49,d0
[0004bd7c] b0af 0050                 cmp.l      80(a7),d0
[0004bd80] 6704                      beq.s      $0004BD86
[0004bd82] 7001                      moveq.l    #1,d0
[0004bd84] 6002                      bra.s      $0004BD88
[0004bd86] 4240                      clr.w      d0
[0004bd88] 3f40 0040                 move.w     d0,64(a7)
[0004bd8c] 6000 01dc                 bra        $0004BF6A
[0004bd90] 2f7c ffff ffe0 0044       move.l     #$FFFFFFE0,68(a7)
[0004bd98] 6046                      bra.s      $0004BDE0
[0004bd9a] 6020                      bra.s      $0004BDBC
[0004bd9c] 486f 0044                 pea.l      68(a7)
[0004bda0] 43ef 0004                 lea.l      4(a7),a1
[0004bda4] 206f 0038                 movea.l    56(a7),a0
[0004bda8] 222f 004c                 move.l     76(a7),d1
[0004bdac] 302f 0046                 move.w     70(a7),d0
[0004bdb0] 4eb9 0008 0c2c            jsr        Dxreaddi
[0004bdb6] 584f                      addq.w     #4,a7
[0004bdb8] 2f40 0050                 move.l     d0,80(a7)
[0004bdbc] 70c0                      moveq.l    #-64,d0
[0004bdbe] b0af 0050                 cmp.l      80(a7),d0
[0004bdc2] 67d8                      beq.s      $0004BD9C
[0004bdc4] 202f 0050                 move.l     80(a7),d0
[0004bdc8] 6a16                      bpl.s      $0004BDE0
[0004bdca] 70cf                      moveq.l    #-49,d0
[0004bdcc] b0af 0050                 cmp.l      80(a7),d0
[0004bdd0] 6704                      beq.s      $0004BDD6
[0004bdd2] 7001                      moveq.l    #1,d0
[0004bdd4] 6002                      bra.s      $0004BDD8
[0004bdd6] 4240                      clr.w      d0
[0004bdd8] 3f40 0040                 move.w     d0,64(a7)
[0004bddc] 6000 018c                 bra        $0004BF6A
[0004bde0] 43f9 000e 0868            lea.l      $000E0868,a1
[0004bde6] 206f 0034                 movea.l    52(a7),a0
[0004bdea] 5848                      addq.w     #4,a0
[0004bdec] 4eb9 0004 665a            jsr        Ast_cmp
[0004bdf2] 4a40                      tst.w      d0
[0004bdf4] 6618                      bne.s      $0004BE0E
[0004bdf6] 43f9 000e 086a            lea.l      $000E086A,a1
[0004bdfc] 206f 0034                 movea.l    52(a7),a0
[0004be00] 5848                      addq.w     #4,a0
[0004be02] 4eb9 0004 665a            jsr        Ast_cmp
[0004be08] 4a40                      tst.w      d0
[0004be0a] 6700 015a                 beq        $0004BF66
[0004be0e] 202f 003c                 move.l     60(a7),d0
[0004be12] 663c                      bne.s      $0004BE50
[0004be14] 703c                      moveq.l    #60,d0
[0004be16] 4eb9 0004 c608            jsr        Ax_malloc
[0004be1c] 2f48 0038                 move.l     a0,56(a7)
[0004be20] 202f 0038                 move.l     56(a7),d0
[0004be24] 6604                      bne.s      $0004BE2A
[0004be26] 7001                      moveq.l    #1,d0
[0004be28] 6002                      bra.s      $0004BE2C
[0004be2a] 4240                      clr.w      d0
[0004be2c] 3f40 0040                 move.w     d0,64(a7)
[0004be30] 302f 0040                 move.w     64(a7),d0
[0004be34] 6704                      beq.s      $0004BE3A
[0004be36] 6000 0132                 bra        $0004BF6A
[0004be3a] 723c                      moveq.l    #60,d1
[0004be3c] 4240                      clr.w      d0
[0004be3e] 206f 0038                 movea.l    56(a7),a0
[0004be42] 4eb9 0008 36ea            jsr        memset
[0004be48] 2f6f 0038 003c            move.l     56(a7),60(a7)
[0004be4e] 6046                      bra.s      $0004BE96
[0004be50] 703c                      moveq.l    #60,d0
[0004be52] 4eb9 0004 c608            jsr        Ax_malloc
[0004be58] 226f 0038                 movea.l    56(a7),a1
[0004be5c] 2348 0004                 move.l     a0,4(a1)
[0004be60] 206f 0038                 movea.l    56(a7),a0
[0004be64] 2028 0004                 move.l     4(a0),d0
[0004be68] 6604                      bne.s      $0004BE6E
[0004be6a] 7001                      moveq.l    #1,d0
[0004be6c] 6002                      bra.s      $0004BE70
[0004be6e] 4240                      clr.w      d0
[0004be70] 3f40 0040                 move.w     d0,64(a7)
[0004be74] 302f 0040                 move.w     64(a7),d0
[0004be78] 6704                      beq.s      $0004BE7E
[0004be7a] 6000 00ee                 bra        $0004BF6A
[0004be7e] 206f 0038                 movea.l    56(a7),a0
[0004be82] 2f68 0004 0038            move.l     4(a0),56(a7)
[0004be88] 723c                      moveq.l    #60,d1
[0004be8a] 4240                      clr.w      d0
[0004be8c] 206f 0038                 movea.l    56(a7),a0
[0004be90] 4eb9 0008 36ea            jsr        memset
[0004be96] 302f 0042                 move.w     66(a7),d0
[0004be9a] 48c0                      ext.l      d0
[0004be9c] d0af 004c                 add.l      76(a7),d0
[0004bea0] 5280                      addq.l     #1,d0
[0004bea2] 4eb9 0004 c608            jsr        Ax_malloc
[0004bea8] 226f 0038                 movea.l    56(a7),a1
[0004beac] 2288                      move.l     a0,(a1)
[0004beae] 206f 0038                 movea.l    56(a7),a0
[0004beb2] 2010                      move.l     (a0),d0
[0004beb4] 6604                      bne.s      $0004BEBA
[0004beb6] 6000 00b2                 bra        $0004BF6A
[0004beba] 206f 0038                 movea.l    56(a7),a0
[0004bebe] 2050                      movea.l    (a0),a0
[0004bec0] 4210                      clr.b      (a0)
[0004bec2] 226f 0054                 movea.l    84(a7),a1
[0004bec6] 206f 0038                 movea.l    56(a7),a0
[0004beca] 2050                      movea.l    (a0),a0
[0004becc] 4eb9 0008 2f0c            jsr        strcpy
[0004bed2] 43f9 000e 086d            lea.l      $000E086D,a1
[0004bed8] 206f 0038                 movea.l    56(a7),a0
[0004bedc] 2050                      movea.l    (a0),a0
[0004bede] 4eb9 0008 2e42            jsr        strcat
[0004bee4] 226f 0034                 movea.l    52(a7),a1
[0004bee8] 5849                      addq.w     #4,a1
[0004beea] 206f 0038                 movea.l    56(a7),a0
[0004beee] 2050                      movea.l    (a0),a0
[0004bef0] 4eb9 0008 2e42            jsr        strcat
[0004bef6] 70e0                      moveq.l    #-32,d0
[0004bef8] b0af 0044                 cmp.l      68(a7),d0
[0004befc] 6632                      bne.s      $0004BF30
[0004befe] 226f 0038                 movea.l    56(a7),a1
[0004bf02] 5049                      addq.w     #8,a1
[0004bf04] 206f 0038                 movea.l    56(a7),a0
[0004bf08] 2050                      movea.l    (a0),a0
[0004bf0a] 4240                      clr.w      d0
[0004bf0c] 4eb9 0008 0d74            jsr        Fxattr
[0004bf12] 2f40 0044                 move.l     d0,68(a7)
[0004bf16] 70e0                      moveq.l    #-32,d0
[0004bf18] b0af 0044                 cmp.l      68(a7),d0
[0004bf1c] 6610                      bne.s      $0004BF2E
[0004bf1e] 7234                      moveq.l    #52,d1
[0004bf20] 4240                      clr.w      d0
[0004bf22] 206f 0038                 movea.l    56(a7),a0
[0004bf26] 5048                      addq.w     #8,a0
[0004bf28] 4eb9 0008 36ea            jsr        memset
[0004bf2e] 6010                      bra.s      $0004BF40
[0004bf30] 7034                      moveq.l    #52,d0
[0004bf32] 43d7                      lea.l      (a7),a1
[0004bf34] 206f 0038                 movea.l    56(a7),a0
[0004bf38] 5048                      addq.w     #8,a0
[0004bf3a] 4eb9 0008 3500            jsr        memcpy
[0004bf40] 70e0                      moveq.l    #-32,d0
[0004bf42] b0af 0044                 cmp.l      68(a7),d0
[0004bf46] 671e                      beq.s      $0004BF66
[0004bf48] 7010                      moveq.l    #16,d0
[0004bf4a] 206f 0038                 movea.l    56(a7),a0
[0004bf4e] c068 0030                 and.w      48(a0),d0
[0004bf52] 6712                      beq.s      $0004BF66
[0004bf54] 43f9 000e 086f            lea.l      $000E086F,a1
[0004bf5a] 206f 0038                 movea.l    56(a7),a0
[0004bf5e] 2050                      movea.l    (a0),a0
[0004bf60] 4eb9 0008 2e42            jsr        strcat
[0004bf66] 6000 fdae                 bra        $0004BD16
[0004bf6a] 206f 0034                 movea.l    52(a7),a0
[0004bf6e] 4eb9 0004 c7c8            jsr        Ax_free
[0004bf74] 202f 0048                 move.l     72(a7),d0
[0004bf78] 4eb9 0008 0bb2            jsr        Dclosedi
[0004bf7e] 302f 0040                 move.w     64(a7),d0
[0004bf82] 6714                      beq.s      $0004BF98
[0004bf84] 206f 003c                 movea.l    60(a7),a0
[0004bf88] 4eb9 0004 c0a6            jsr        Af_freedir
[0004bf8e] 7000                      moveq.l    #0,d0
[0004bf90] 2f40 0038                 move.l     d0,56(a7)
[0004bf94] 2f40 003c                 move.l     d0,60(a7)
[0004bf98] 206f 003c                 movea.l    60(a7),a0
[0004bf9c] 4fef 0058                 lea.l      88(a7),a7
[0004bfa0] 4e75                      rts
Af_readdir:
[0004bfa2] 4fef ffe6                 lea.l      -26(a7),a7
[0004bfa6] 2f48 0016                 move.l     a0,22(a7)
[0004bfaa] 206f 0016                 movea.l    22(a7),a0
[0004bfae] 4eb9 0008 2f6c            jsr        strlen
[0004bfb4] 2f40 0008                 move.l     d0,8(a7)
[0004bfb8] 7014                      moveq.l    #20,d0
[0004bfba] d0af 0008                 add.l      8(a7),d0
[0004bfbe] 4eb9 0004 c608            jsr        Ax_malloc
[0004bfc4] 2f48 0004                 move.l     a0,4(a7)
[0004bfc8] 202f 0004                 move.l     4(a7),d0
[0004bfcc] 6606                      bne.s      $0004BFD4
[0004bfce] 91c8                      suba.l     a0,a0
[0004bfd0] 6000 00ce                 bra        $0004C0A0
[0004bfd4] 226f 0016                 movea.l    22(a7),a1
[0004bfd8] 206f 0004                 movea.l    4(a7),a0
[0004bfdc] 4eb9 0008 2f0c            jsr        strcpy
[0004bfe2] 705c                      moveq.l    #92,d0
[0004bfe4] 206f 0004                 movea.l    4(a7),a0
[0004bfe8] 4eb9 0008 2e9e            jsr        strrchr
[0004bfee] 2e88                      move.l     a0,(a7)
[0004bff0] 2017                      move.l     (a7),d0
[0004bff2] 670c                      beq.s      $0004C000
[0004bff4] 2057                      movea.l    (a7),a0
[0004bff6] 1028 0001                 move.b     1(a0),d0
[0004bffa] 6604                      bne.s      $0004C000
[0004bffc] 2057                      movea.l    (a7),a0
[0004bffe] 4210                      clr.b      (a0)
[0004c000] 206f 0004                 movea.l    4(a7),a0
[0004c004] 4eb9 0008 2f6c            jsr        strlen
[0004c00a] 7202                      moveq.l    #2,d1
[0004c00c] b280                      cmp.l      d0,d1
[0004c00e] 661c                      bne.s      $0004C02C
[0004c010] 206f 0004                 movea.l    4(a7),a0
[0004c014] 0c28 003a 0001            cmpi.b     #$3A,1(a0)
[0004c01a] 6610                      bne.s      $0004C02C
[0004c01c] 43f9 000e 0871            lea.l      $000E0871,a1
[0004c022] 206f 0004                 movea.l    4(a7),a0
[0004c026] 4eb9 0008 2e42            jsr        strcat
[0004c02c] 4eb9 0008 0bd2            jsr        Dgetdrv
[0004c032] 3f40 0010                 move.w     d0,16(a7)
[0004c036] 206f 0016                 movea.l    22(a7),a0
[0004c03a] 6100 f50c                 bsr        Af_2drv
[0004c03e] 4eb9 0008 0c48            jsr        Dsetdrv
[0004c044] 4240                      clr.w      d0
[0004c046] 41f9 000e 0873            lea.l      $000E0873,a0
[0004c04c] 4eb9 0008 0bf2            jsr        Dopendir
[0004c052] 2f40 000c                 move.l     d0,12(a7)
[0004c056] 302f 0010                 move.w     16(a7),d0
[0004c05a] 4eb9 0008 0c48            jsr        Dsetdrv
[0004c060] 70e0                      moveq.l    #-32,d0
[0004c062] b0af 000c                 cmp.l      12(a7),d0
[0004c066] 660e                      bne.s      $0004C076
[0004c068] 206f 0004                 movea.l    4(a7),a0
[0004c06c] 6100 f9d0                 bsr        Af_readdirOld
[0004c070] 2f48 0012                 move.l     a0,18(a7)
[0004c074] 601c                      bra.s      $0004C092
[0004c076] 202f 000c                 move.l     12(a7),d0
[0004c07a] 6f0a                      ble.s      $0004C086
[0004c07c] 202f 000c                 move.l     12(a7),d0
[0004c080] 4eb9 0008 0bb2            jsr        Dclosedi
[0004c086] 206f 0004                 movea.l    4(a7),a0
[0004c08a] 6100 fba4                 bsr        Af_readdirNew
[0004c08e] 2f48 0012                 move.l     a0,18(a7)
[0004c092] 206f 0004                 movea.l    4(a7),a0
[0004c096] 4eb9 0004 c7c8            jsr        Ax_free
[0004c09c] 206f 0012                 movea.l    18(a7),a0
[0004c0a0] 4fef 001a                 lea.l      26(a7),a7
[0004c0a4] 4e75                      rts
Af_freedir:
[0004c0a6] 514f                      subq.w     #8,a7
[0004c0a8] 2f48 0004                 move.l     a0,4(a7)
[0004c0ac] 6026                      bra.s      $0004C0D4
[0004c0ae] 2eaf 0004                 move.l     4(a7),(a7)
[0004c0b2] 206f 0004                 movea.l    4(a7),a0
[0004c0b6] 2f68 0004 0004            move.l     4(a0),4(a7)
[0004c0bc] 2057                      movea.l    (a7),a0
[0004c0be] 2010                      move.l     (a0),d0
[0004c0c0] 670a                      beq.s      $0004C0CC
[0004c0c2] 2057                      movea.l    (a7),a0
[0004c0c4] 2050                      movea.l    (a0),a0
[0004c0c6] 4eb9 0004 649c            jsr        Ast_delete
[0004c0cc] 2057                      movea.l    (a7),a0
[0004c0ce] 4eb9 0004 c7c8            jsr        Ax_free
[0004c0d4] 202f 0004                 move.l     4(a7),d0
[0004c0d8] 66d4                      bne.s      $0004C0AE
[0004c0da] 504f                      addq.w     #8,a7
[0004c0dc] 4e75                      rts
Af_first:
[0004c0de] 514f                      subq.w     #8,a7
[0004c0e0] 2f48 0004                 move.l     a0,4(a7)
[0004c0e4] 2e89                      move.l     a1,(a7)
[0004c0e6] 2039 000e 082c            move.l     DateiListe,d0
[0004c0ec] 6718                      beq.s      $0004C106
[0004c0ee] 2079 000e 082c            movea.l    DateiListe,a0
[0004c0f4] 6100 ffb0                 bsr.w      Af_freedir
[0004c0f8] 7000                      moveq.l    #0,d0
[0004c0fa] 23c0 000e 0830            move.l     d0,AktDatei
[0004c100] 23c0 000e 082c            move.l     d0,DateiListe
[0004c106] 206f 0004                 movea.l    4(a7),a0
[0004c10a] 6100 fe96                 bsr        Af_readdir
[0004c10e] 23c8 000e 082c            move.l     a0,DateiListe
[0004c114] 2039 000e 082c            move.l     DateiListe,d0
[0004c11a] 6604                      bne.s      $0004C120
[0004c11c] 91c8                      suba.l     a0,a0
[0004c11e] 6008                      bra.s      $0004C128
[0004c120] 2057                      movea.l    (a7),a0
[0004c122] 4eb9 0004 c12c            jsr        Af_next
[0004c128] 504f                      addq.w     #8,a7
[0004c12a] 4e75                      rts
Af_next:
[0004c12c] 594f                      subq.w     #4,a7
[0004c12e] 2e88                      move.l     a0,(a7)
[0004c130] 2039 000e 082c            move.l     DateiListe,d0
[0004c136] 6604                      bne.s      $0004C13C
[0004c138] 91c8                      suba.l     a0,a0
[0004c13a] 6066                      bra.s      $0004C1A2
[0004c13c] 2039 000e 0830            move.l     AktDatei,d0
[0004c142] 660c                      bne.s      $0004C150
[0004c144] 23f9 000e 082c 000e 0830  move.l     DateiListe,AktDatei
[0004c14e] 600e                      bra.s      $0004C15E
[0004c150] 2079 000e 0830            movea.l    AktDatei,a0
[0004c156] 23e8 0004 000e 0830       move.l     4(a0),AktDatei
[0004c15e] 2039 000e 0830            move.l     AktDatei,d0
[0004c164] 661a                      bne.s      $0004C180
[0004c166] 2079 000e 082c            movea.l    DateiListe,a0
[0004c16c] 6100 ff38                 bsr        Af_freedir
[0004c170] 7000                      moveq.l    #0,d0
[0004c172] 23c0 000e 0830            move.l     d0,AktDatei
[0004c178] 23c0 000e 082c            move.l     d0,DateiListe
[0004c17e] 6020                      bra.s      $0004C1A0
[0004c180] 2017                      move.l     (a7),d0
[0004c182] 6712                      beq.s      $0004C196
[0004c184] 7034                      moveq.l    #52,d0
[0004c186] 2279 000e 0830            movea.l    AktDatei,a1
[0004c18c] 5049                      addq.w     #8,a1
[0004c18e] 2057                      movea.l    (a7),a0
[0004c190] 4eb9 0008 3500            jsr        memcpy
[0004c196] 2079 000e 0830            movea.l    AktDatei,a0
[0004c19c] 2050                      movea.l    (a0),a0
[0004c19e] 6002                      bra.s      $0004C1A2
[0004c1a0] 91c8                      suba.l     a0,a0
[0004c1a2] 584f                      addq.w     #4,a7
[0004c1a4] 4e75                      rts
Af_quote:
[0004c1a6] 4fef ffee                 lea.l      -18(a7),a7
[0004c1aa] 2f48 000e                 move.l     a0,14(a7)
[0004c1ae] 2f49 000a                 move.l     a1,10(a7)
[0004c1b2] 206f 000e                 movea.l    14(a7),a0
[0004c1b6] b1ef 000a                 cmpa.l     10(a7),a0
[0004c1ba] 670e                      beq.s      $0004C1CA
[0004c1bc] 226f 000a                 movea.l    10(a7),a1
[0004c1c0] 206f 000e                 movea.l    14(a7),a0
[0004c1c4] 4eb9 0008 2f0c            jsr        strcpy
[0004c1ca] 206f 000e                 movea.l    14(a7),a0
[0004c1ce] 4eb9 0004 663c            jsr        Ast_alltrim
[0004c1d4] 43f9 000e 0875            lea.l      $000E0875,a1
[0004c1da] 206f 000e                 movea.l    14(a7),a0
[0004c1de] 4eb9 0008 2ff0            jsr        strpbrk
[0004c1e4] 2008                      move.l     a0,d0
[0004c1e6] 6700 00b6                 beq        $0004C29E
[0004c1ea] 4257                      clr.w      (a7)
[0004c1ec] 2f6f 000e 0006            move.l     14(a7),6(a7)
[0004c1f2] 6014                      bra.s      $0004C208
[0004c1f4] 206f 0006                 movea.l    6(a7),a0
[0004c1f8] 1010                      move.b     (a0),d0
[0004c1fa] b039 000e 087b            cmp.b      $000E087B,d0
[0004c200] 6602                      bne.s      $0004C204
[0004c202] 5257                      addq.w     #1,(a7)
[0004c204] 52af 0006                 addq.l     #1,6(a7)
[0004c208] 206f 0006                 movea.l    6(a7),a0
[0004c20c] 1010                      move.b     (a0),d0
[0004c20e] 66e4                      bne.s      $0004C1F4
[0004c210] 206f 000e                 movea.l    14(a7),a0
[0004c214] 4eb9 0008 2f6c            jsr        strlen
[0004c21a] 206f 000e                 movea.l    14(a7),a0
[0004c21e] d1c0                      adda.l     d0,a0
[0004c220] 2f48 0006                 move.l     a0,6(a7)
[0004c224] 3017                      move.w     (a7),d0
[0004c226] 206f 0006                 movea.l    6(a7),a0
[0004c22a] 41f0 0001                 lea.l      1(a0,d0.w),a0
[0004c22e] 2f48 0002                 move.l     a0,2(a7)
[0004c232] 602e                      bra.s      $0004C262
[0004c234] 206f 0006                 movea.l    6(a7),a0
[0004c238] 1010                      move.b     (a0),d0
[0004c23a] b039 000e 087e            cmp.b      $000E087E,d0
[0004c240] 660e                      bne.s      $0004C250
[0004c242] 206f 0006                 movea.l    6(a7),a0
[0004c246] 226f 0002                 movea.l    2(a7),a1
[0004c24a] 1290                      move.b     (a0),(a1)
[0004c24c] 53af 0002                 subq.l     #1,2(a7)
[0004c250] 206f 0006                 movea.l    6(a7),a0
[0004c254] 226f 0002                 movea.l    2(a7),a1
[0004c258] 1290                      move.b     (a0),(a1)
[0004c25a] 53af 0006                 subq.l     #1,6(a7)
[0004c25e] 53af 0002                 subq.l     #1,2(a7)
[0004c262] 206f 0006                 movea.l    6(a7),a0
[0004c266] b1ef 000e                 cmpa.l     14(a7),a0
[0004c26a] 64c8                      bcc.s      $0004C234
[0004c26c] 206f 000e                 movea.l    14(a7),a0
[0004c270] 10b9 000e 0881            move.b     $000E0881,(a0)
[0004c276] 206f 000e                 movea.l    14(a7),a0
[0004c27a] 4eb9 0008 2f6c            jsr        strlen
[0004c280] 206f 000e                 movea.l    14(a7),a0
[0004c284] d1c0                      adda.l     d0,a0
[0004c286] 2f48 0002                 move.l     a0,2(a7)
[0004c28a] 206f 0002                 movea.l    2(a7),a0
[0004c28e] 52af 0002                 addq.l     #1,2(a7)
[0004c292] 10b9 000e 0884            move.b     $000E0884,(a0)
[0004c298] 206f 0002                 movea.l    2(a7),a0
[0004c29c] 4210                      clr.b      (a0)
[0004c29e] 206f 000e                 movea.l    14(a7),a0
[0004c2a2] 4fef 0012                 lea.l      18(a7),a7
[0004c2a6] 4e75                      rts
Af_unquote:
[0004c2a8] 4fef ffee                 lea.l      -18(a7),a7
[0004c2ac] 2f48 000e                 move.l     a0,14(a7)
[0004c2b0] 2f49 000a                 move.l     a1,10(a7)
[0004c2b4] 206f 000e                 movea.l    14(a7),a0
[0004c2b8] b1ef 000a                 cmpa.l     10(a7),a0
[0004c2bc] 670e                      beq.s      $0004C2CC
[0004c2be] 226f 000a                 movea.l    10(a7),a1
[0004c2c2] 206f 000e                 movea.l    14(a7),a0
[0004c2c6] 4eb9 0008 2f0c            jsr        strcpy
[0004c2cc] 206f 000e                 movea.l    14(a7),a0
[0004c2d0] 4eb9 0004 663c            jsr        Ast_alltrim
[0004c2d6] 206f 000e                 movea.l    14(a7),a0
[0004c2da] 1e90                      move.b     (a0),(a7)
[0004c2dc] 1017                      move.b     (a7),d0
[0004c2de] 4880                      ext.w      d0
[0004c2e0] 41f9 000e 0887            lea.l      $000E0887,a0
[0004c2e6] 4eb9 0008 2e8a            jsr        strchr
[0004c2ec] 2008                      move.l     a0,d0
[0004c2ee] 676c                      beq.s      $0004C35C
[0004c2f0] 206f 000e                 movea.l    14(a7),a0
[0004c2f4] 4eb9 0008 2f6c            jsr        strlen
[0004c2fa] 5380                      subq.l     #1,d0
[0004c2fc] 206f 000e                 movea.l    14(a7),a0
[0004c300] 1217                      move.b     (a7),d1
[0004c302] b230 0800                 cmp.b      0(a0,d0.l),d1
[0004c306] 6654                      bne.s      $0004C35C
[0004c308] 2f6f 000e 0002            move.l     14(a7),2(a7)
[0004c30e] 206f 000e                 movea.l    14(a7),a0
[0004c312] 5248                      addq.w     #1,a0
[0004c314] 2f48 0006                 move.l     a0,6(a7)
[0004c318] 6034                      bra.s      $0004C34E
[0004c31a] 206f 0006                 movea.l    6(a7),a0
[0004c31e] 1010                      move.b     (a0),d0
[0004c320] b017                      cmp.b      (a7),d0
[0004c322] 6618                      bne.s      $0004C33C
[0004c324] 206f 0006                 movea.l    6(a7),a0
[0004c328] 1010                      move.b     (a0),d0
[0004c32a] 206f 0006                 movea.l    6(a7),a0
[0004c32e] b028 0001                 cmp.b      1(a0),d0
[0004c332] 6606                      bne.s      $0004C33A
[0004c334] 52af 0006                 addq.l     #1,6(a7)
[0004c338] 6002                      bra.s      $0004C33C
[0004c33a] 601a                      bra.s      $0004C356
[0004c33c] 206f 0006                 movea.l    6(a7),a0
[0004c340] 226f 0002                 movea.l    2(a7),a1
[0004c344] 1290                      move.b     (a0),(a1)
[0004c346] 52af 0006                 addq.l     #1,6(a7)
[0004c34a] 52af 0002                 addq.l     #1,2(a7)
[0004c34e] 206f 0006                 movea.l    6(a7),a0
[0004c352] 1010                      move.b     (a0),d0
[0004c354] 66c4                      bne.s      $0004C31A
[0004c356] 206f 0002                 movea.l    2(a7),a0
[0004c35a] 4210                      clr.b      (a0)
[0004c35c] 206f 000e                 movea.l    14(a7),a0
[0004c360] 4fef 0012                 lea.l      18(a7),a7
[0004c364] 4e75                      rts
Af_parseCmdLine:
[0004c366] 2f0a                      move.l     a2,-(a7)
[0004c368] 4fef ff64                 lea.l      -156(a7),a7
[0004c36c] 2f48 0096                 move.l     a0,150(a7)
[0004c370] 4eb9 0007 0c0a            jsr        Alu_create
[0004c376] 2e88                      move.l     a0,(a7)
[0004c378] 2017                      move.l     (a7),d0
[0004c37a] 6606                      bne.s      $0004C382
[0004c37c] 91c8                      suba.l     a0,a0
[0004c37e] 6000 0136                 bra        $0004C4B6
[0004c382] 206f 0096                 movea.l    150(a7),a0
[0004c386] 4eb9 0004 643c            jsr        Ast_create
[0004c38c] 2f48 0004                 move.l     a0,4(a7)
[0004c390] 202f 0004                 move.l     4(a7),d0
[0004c394] 6606                      bne.s      $0004C39C
[0004c396] 91c8                      suba.l     a0,a0
[0004c398] 6000 011c                 bra        $0004C4B6
[0004c39c] 2f6f 0004 0092            move.l     4(a7),146(a7)
[0004c3a2] 6000 00f6                 bra        $0004C49A
[0004c3a6] 206f 0092                 movea.l    146(a7),a0
[0004c3aa] 4eb9 0004 663c            jsr        Ast_alltrim
[0004c3b0] 206f 0092                 movea.l    146(a7),a0
[0004c3b4] 1f50 0088                 move.b     (a0),136(a7)
[0004c3b8] 102f 0088                 move.b     136(a7),d0
[0004c3bc] 4880                      ext.w      d0
[0004c3be] 41f9 000e 088a            lea.l      $000E088A,a0
[0004c3c4] 4eb9 0008 2e8a            jsr        strchr
[0004c3ca] 2008                      move.l     a0,d0
[0004c3cc] 6752                      beq.s      $0004C420
[0004c3ce] 52af 0092                 addq.l     #1,146(a7)
[0004c3d2] 41ef 0008                 lea.l      8(a7),a0
[0004c3d6] 2f48 008e                 move.l     a0,142(a7)
[0004c3da] 6034                      bra.s      $0004C410
[0004c3dc] 206f 0092                 movea.l    146(a7),a0
[0004c3e0] 1010                      move.b     (a0),d0
[0004c3e2] b02f 0088                 cmp.b      136(a7),d0
[0004c3e6] 6616                      bne.s      $0004C3FE
[0004c3e8] 52af 0092                 addq.l     #1,146(a7)
[0004c3ec] 206f 0092                 movea.l    146(a7),a0
[0004c3f0] 1028 ffff                 move.b     -1(a0),d0
[0004c3f4] 206f 0092                 movea.l    146(a7),a0
[0004c3f8] b010                      cmp.b      (a0),d0
[0004c3fa] 6702                      beq.s      $0004C3FE
[0004c3fc] 601a                      bra.s      $0004C418
[0004c3fe] 206f 0092                 movea.l    146(a7),a0
[0004c402] 226f 008e                 movea.l    142(a7),a1
[0004c406] 1290                      move.b     (a0),(a1)
[0004c408] 52af 0092                 addq.l     #1,146(a7)
[0004c40c] 52af 008e                 addq.l     #1,142(a7)
[0004c410] 206f 0092                 movea.l    146(a7),a0
[0004c414] 1010                      move.b     (a0),d0
[0004c416] 66c4                      bne.s      $0004C3DC
[0004c418] 206f 008e                 movea.l    142(a7),a0
[0004c41c] 4210                      clr.b      (a0)
[0004c41e] 6058                      bra.s      $0004C478
[0004c420] 43f9 000e 088d            lea.l      $000E088D,a1
[0004c426] 206f 0092                 movea.l    146(a7),a0
[0004c42a] 4eb9 0008 2ff0            jsr        strpbrk
[0004c430] 2f48 008e                 move.l     a0,142(a7)
[0004c434] 202f 008e                 move.l     142(a7),d0
[0004c438] 672c                      beq.s      $0004C466
[0004c43a] 206f 008e                 movea.l    142(a7),a0
[0004c43e] 1f50 009a                 move.b     (a0),154(a7)
[0004c442] 206f 008e                 movea.l    142(a7),a0
[0004c446] 4210                      clr.b      (a0)
[0004c448] 226f 0092                 movea.l    146(a7),a1
[0004c44c] 41ef 0008                 lea.l      8(a7),a0
[0004c450] 4eb9 0008 2f0c            jsr        strcpy
[0004c456] 2f6f 008e 0092            move.l     142(a7),146(a7)
[0004c45c] 206f 0092                 movea.l    146(a7),a0
[0004c460] 10af 009a                 move.b     154(a7),(a0)
[0004c464] 6012                      bra.s      $0004C478
[0004c466] 226f 0092                 movea.l    146(a7),a1
[0004c46a] 41ef 0008                 lea.l      8(a7),a0
[0004c46e] 4eb9 0008 2f0c            jsr        strcpy
[0004c474] 42af 0092                 clr.l      146(a7)
[0004c478] 41ef 0008                 lea.l      8(a7),a0
[0004c47c] 4eb9 0004 643c            jsr        Ast_create
[0004c482] 2f48 008a                 move.l     a0,138(a7)
[0004c486] 202f 008a                 move.l     138(a7),d0
[0004c48a] 670e                      beq.s      $0004C49A
[0004c48c] 226f 008a                 movea.l    138(a7),a1
[0004c490] 2057                      movea.l    (a7),a0
[0004c492] 2457                      movea.l    (a7),a2
[0004c494] 246a 000c                 movea.l    12(a2),a2
[0004c498] 4e92                      jsr        (a2)
[0004c49a] 206f 0092                 movea.l    146(a7),a0
[0004c49e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0004c4a4] 4a40                      tst.w      d0
[0004c4a6] 6700 fefe                 beq        $0004C3A6
[0004c4aa] 206f 0004                 movea.l    4(a7),a0
[0004c4ae] 4eb9 0004 649c            jsr        Ast_delete
[0004c4b4] 2057                      movea.l    (a7),a0
[0004c4b6] 4fef 009c                 lea.l      156(a7),a7
[0004c4ba] 245f                      movea.l    (a7)+,a2
[0004c4bc] 4e75                      rts
