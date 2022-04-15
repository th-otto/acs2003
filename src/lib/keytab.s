Akt_getKeyTab:
[0005c8fe] 2039 000e 146a            move.l     kt,d0
[0005c904] 662a                      bne.s      $0005C930
[0005c906] 41f9 000e 146a            lea.l      kt,a0
[0005c90c] 203c 4b45 5954            move.l     #$4B455954,d0
[0005c912] 4eb9 0008 0ec4            jsr        Ash_getcookie
[0005c918] 4a40                      tst.w      d0
[0005c91a] 670e                      beq.s      $0005C92A
[0005c91c] 2079 000e 146a            movea.l    kt,a0
[0005c922] 0c90 4b45 5954            cmpi.l     #$4B455954,(a0)
[0005c928] 6706                      beq.s      $0005C930
[0005c92a] 42b9 000e 146a            clr.l      kt
[0005c930] 2079 000e 146a            movea.l    kt,a0
[0005c936] 4e75                      rts
Akt_getExpMinNr:
[0005c938] 594f                      subq.w     #4,a7
[0005c93a] 6100 ffc2                 bsr.w      Akt_getKeyTab
[0005c93e] 2e88                      move.l     a0,(a7)
[0005c940] 2017                      move.l     (a7),d0
[0005c942] 6716                      beq.s      $0005C95A
[0005c944] 2057                      movea.l    (a7),a0
[0005c946] 7068                      moveq.l    #104,d0
[0005c948] b0a8 0004                 cmp.l      4(a0),d0
[0005c94c] 6e0c                      bgt.s      $0005C95A
[0005c94e] 2057                      movea.l    (a7),a0
[0005c950] 2068 0068                 movea.l    104(a0),a0
[0005c954] 4e90                      jsr        (a0)
[0005c956] 6006                      bra.s      $0005C95E
[0005c958] 6004                      bra.s      $0005C95E
[0005c95a] 4240                      clr.w      d0
[0005c95c] 4e71                      nop
[0005c95e] 584f                      addq.w     #4,a7
[0005c960] 4e75                      rts
Akt_getExpMaxNr:
[0005c962] 594f                      subq.w     #4,a7
[0005c964] 6100 ff98                 bsr.w      Akt_getKeyTab
[0005c968] 2e88                      move.l     a0,(a7)
[0005c96a] 2017                      move.l     (a7),d0
[0005c96c] 670c                      beq.s      $0005C97A
[0005c96e] 2057                      movea.l    (a7),a0
[0005c970] 2068 0008                 movea.l    8(a0),a0
[0005c974] 4e90                      jsr        (a0)
[0005c976] 6006                      bra.s      $0005C97E
[0005c978] 6004                      bra.s      $0005C97E
[0005c97a] 70ff                      moveq.l    #-1,d0
[0005c97c] 4e71                      nop
[0005c97e] 584f                      addq.w     #4,a7
[0005c980] 4e75                      rts
Akt_getImpMinNr:
[0005c982] 594f                      subq.w     #4,a7
[0005c984] 6100 ff78                 bsr        Akt_getKeyTab
[0005c988] 2e88                      move.l     a0,(a7)
[0005c98a] 2017                      move.l     (a7),d0
[0005c98c] 6716                      beq.s      $0005C9A4
[0005c98e] 2057                      movea.l    (a7),a0
[0005c990] 7068                      moveq.l    #104,d0
[0005c992] b0a8 0004                 cmp.l      4(a0),d0
[0005c996] 6e0c                      bgt.s      $0005C9A4
[0005c998] 2057                      movea.l    (a7),a0
[0005c99a] 2068 006c                 movea.l    108(a0),a0
[0005c99e] 4e90                      jsr        (a0)
[0005c9a0] 6006                      bra.s      $0005C9A8
[0005c9a2] 6004                      bra.s      $0005C9A8
[0005c9a4] 4240                      clr.w      d0
[0005c9a6] 4e71                      nop
[0005c9a8] 584f                      addq.w     #4,a7
[0005c9aa] 4e75                      rts
Akt_getImpMaxNr:
[0005c9ac] 594f                      subq.w     #4,a7
[0005c9ae] 6100 ff4e                 bsr        Akt_getKeyTab
[0005c9b2] 2e88                      move.l     a0,(a7)
[0005c9b4] 2017                      move.l     (a7),d0
[0005c9b6] 670c                      beq.s      $0005C9C4
[0005c9b8] 2057                      movea.l    (a7),a0
[0005c9ba] 2068 0018                 movea.l    24(a0),a0
[0005c9be] 4e90                      jsr        (a0)
[0005c9c0] 6006                      bra.s      $0005C9C8
[0005c9c2] 6004                      bra.s      $0005C9C8
[0005c9c4] 70ff                      moveq.l    #-1,d0
[0005c9c6] 4e71                      nop
[0005c9c8] 584f                      addq.w     #4,a7
[0005c9ca] 4e75                      rts
Akt_getExpNameFromNr:
[0005c9cc] 5d4f                      subq.w     #6,a7
[0005c9ce] 3f40 0004                 move.w     d0,4(a7)
[0005c9d2] 6100 ff2a                 bsr        Akt_getKeyTab
[0005c9d6] 2e88                      move.l     a0,(a7)
[0005c9d8] 2017                      move.l     (a7),d0
[0005c9da] 6738                      beq.s      $0005CA14
[0005c9dc] 2057                      movea.l    (a7),a0
[0005c9de] 7038                      moveq.l    #56,d0
[0005c9e0] b0a8 0004                 cmp.l      4(a0),d0
[0005c9e4] 6e16                      bgt.s      $0005C9FC
[0005c9e6] 3f2f 0004                 move.w     4(a7),-(a7)
[0005c9ea] 206f 0002                 movea.l    2(a7),a0
[0005c9ee] 2068 0030                 movea.l    48(a0),a0
[0005c9f2] 4e90                      jsr        (a0)
[0005c9f4] 544f                      addq.w     #2,a7
[0005c9f6] 2040                      movea.l    d0,a0
[0005c9f8] 601e                      bra.s      $0005CA18
[0005c9fa] 6016                      bra.s      $0005CA12
[0005c9fc] 3f2f 0004                 move.w     4(a7),-(a7)
[0005ca00] 302f 0006                 move.w     6(a7),d0
[0005ca04] 206f 0002                 movea.l    2(a7),a0
[0005ca08] 2068 000c                 movea.l    12(a0),a0
[0005ca0c] 4e90                      jsr        (a0)
[0005ca0e] 544f                      addq.w     #2,a7
[0005ca10] 6006                      bra.s      $0005CA18
[0005ca12] 6004                      bra.s      $0005CA18
[0005ca14] 91c8                      suba.l     a0,a0
[0005ca16] 4e71                      nop
[0005ca18] 5c4f                      addq.w     #6,a7
[0005ca1a] 4e75                      rts
Akt_getImpNameFromNr:
[0005ca1c] 5d4f                      subq.w     #6,a7
[0005ca1e] 3f40 0004                 move.w     d0,4(a7)
[0005ca22] 6100 feda                 bsr        Akt_getKeyTab
[0005ca26] 2e88                      move.l     a0,(a7)
[0005ca28] 2017                      move.l     (a7),d0
[0005ca2a] 6738                      beq.s      $0005CA64
[0005ca2c] 2057                      movea.l    (a7),a0
[0005ca2e] 7038                      moveq.l    #56,d0
[0005ca30] b0a8 0004                 cmp.l      4(a0),d0
[0005ca34] 6e16                      bgt.s      $0005CA4C
[0005ca36] 3f2f 0004                 move.w     4(a7),-(a7)
[0005ca3a] 206f 0002                 movea.l    2(a7),a0
[0005ca3e] 2068 0034                 movea.l    52(a0),a0
[0005ca42] 4e90                      jsr        (a0)
[0005ca44] 544f                      addq.w     #2,a7
[0005ca46] 2040                      movea.l    d0,a0
[0005ca48] 601e                      bra.s      $0005CA68
[0005ca4a] 6016                      bra.s      $0005CA62
[0005ca4c] 3f2f 0004                 move.w     4(a7),-(a7)
[0005ca50] 302f 0006                 move.w     6(a7),d0
[0005ca54] 206f 0002                 movea.l    2(a7),a0
[0005ca58] 2068 001c                 movea.l    28(a0),a0
[0005ca5c] 4e90                      jsr        (a0)
[0005ca5e] 544f                      addq.w     #2,a7
[0005ca60] 6006                      bra.s      $0005CA68
[0005ca62] 6004                      bra.s      $0005CA68
[0005ca64] 91c8                      suba.l     a0,a0
[0005ca66] 4e71                      nop
[0005ca68] 5c4f                      addq.w     #6,a7
[0005ca6a] 4e75                      rts
Akt_getExpShortNameFromNr:
[0005ca6c] 5d4f                      subq.w     #6,a7
[0005ca6e] 3f40 0004                 move.w     d0,4(a7)
[0005ca72] 6100 fe8a                 bsr        Akt_getKeyTab
[0005ca76] 2e88                      move.l     a0,(a7)
[0005ca78] 2017                      move.l     (a7),d0
[0005ca7a] 6720                      beq.s      $0005CA9C
[0005ca7c] 2057                      movea.l    (a7),a0
[0005ca7e] 7040                      moveq.l    #64,d0
[0005ca80] b0a8 0004                 cmp.l      4(a0),d0
[0005ca84] 6e16                      bgt.s      $0005CA9C
[0005ca86] 3f2f 0004                 move.w     4(a7),-(a7)
[0005ca8a] 206f 0002                 movea.l    2(a7),a0
[0005ca8e] 2068 0038                 movea.l    56(a0),a0
[0005ca92] 4e90                      jsr        (a0)
[0005ca94] 544f                      addq.w     #2,a7
[0005ca96] 2040                      movea.l    d0,a0
[0005ca98] 6006                      bra.s      $0005CAA0
[0005ca9a] 6004                      bra.s      $0005CAA0
[0005ca9c] 91c8                      suba.l     a0,a0
[0005ca9e] 4e71                      nop
[0005caa0] 5c4f                      addq.w     #6,a7
[0005caa2] 4e75                      rts
Akt_getImpShortNameFromNr:
[0005caa4] 5d4f                      subq.w     #6,a7
[0005caa6] 3f40 0004                 move.w     d0,4(a7)
[0005caaa] 6100 fe52                 bsr        Akt_getKeyTab
[0005caae] 2e88                      move.l     a0,(a7)
[0005cab0] 2017                      move.l     (a7),d0
[0005cab2] 6720                      beq.s      $0005CAD4
[0005cab4] 2057                      movea.l    (a7),a0
[0005cab6] 7040                      moveq.l    #64,d0
[0005cab8] b0a8 0004                 cmp.l      4(a0),d0
[0005cabc] 6e16                      bgt.s      $0005CAD4
[0005cabe] 3f2f 0004                 move.w     4(a7),-(a7)
[0005cac2] 206f 0002                 movea.l    2(a7),a0
[0005cac6] 2068 003c                 movea.l    60(a0),a0
[0005caca] 4e90                      jsr        (a0)
[0005cacc] 544f                      addq.w     #2,a7
[0005cace] 2040                      movea.l    d0,a0
[0005cad0] 6006                      bra.s      $0005CAD8
[0005cad2] 6004                      bra.s      $0005CAD8
[0005cad4] 91c8                      suba.l     a0,a0
[0005cad6] 4e71                      nop
[0005cad8] 5c4f                      addq.w     #6,a7
[0005cada] 4e75                      rts
Akt_getRelease:
[0005cadc] 594f                      subq.w     #4,a7
[0005cade] 6100 fe1e                 bsr        Akt_getKeyTab
[0005cae2] 2e88                      move.l     a0,(a7)
[0005cae4] 2017                      move.l     (a7),d0
[0005cae6] 6716                      beq.s      $0005CAFE
[0005cae8] 2057                      movea.l    (a7),a0
[0005caea] 704c                      moveq.l    #76,d0
[0005caec] b0a8 0004                 cmp.l      4(a0),d0
[0005caf0] 6e0c                      bgt.s      $0005CAFE
[0005caf2] 2057                      movea.l    (a7),a0
[0005caf4] 2068 0040                 movea.l    64(a0),a0
[0005caf8] 4e90                      jsr        (a0)
[0005cafa] 6006                      bra.s      $0005CB02
[0005cafc] 6004                      bra.s      $0005CB02
[0005cafe] 70ff                      moveq.l    #-1,d0
[0005cb00] 4e71                      nop
[0005cb02] 584f                      addq.w     #4,a7
[0005cb04] 4e75                      rts
Akt_getExpNrFromId:
[0005cb06] 5d4f                      subq.w     #6,a7
[0005cb08] 3f40 0004                 move.w     d0,4(a7)
[0005cb0c] 6100 fdf0                 bsr        Akt_getKeyTab
[0005cb10] 2e88                      move.l     a0,(a7)
[0005cb12] 2017                      move.l     (a7),d0
[0005cb14] 6714                      beq.s      $0005CB2A
[0005cb16] 3f2f 0004                 move.w     4(a7),-(a7)
[0005cb1a] 206f 0002                 movea.l    2(a7),a0
[0005cb1e] 2068 0010                 movea.l    16(a0),a0
[0005cb22] 4e90                      jsr        (a0)
[0005cb24] 544f                      addq.w     #2,a7
[0005cb26] 6006                      bra.s      $0005CB2E
[0005cb28] 6004                      bra.s      $0005CB2E
[0005cb2a] 70ff                      moveq.l    #-1,d0
[0005cb2c] 4e71                      nop
[0005cb2e] 5c4f                      addq.w     #6,a7
[0005cb30] 4e75                      rts
Akt_getImpNrFromId:
[0005cb32] 5d4f                      subq.w     #6,a7
[0005cb34] 3f40 0004                 move.w     d0,4(a7)
[0005cb38] 6100 fdc4                 bsr        Akt_getKeyTab
[0005cb3c] 2e88                      move.l     a0,(a7)
[0005cb3e] 2017                      move.l     (a7),d0
[0005cb40] 6714                      beq.s      $0005CB56
[0005cb42] 3f2f 0004                 move.w     4(a7),-(a7)
[0005cb46] 206f 0002                 movea.l    2(a7),a0
[0005cb4a] 2068 0020                 movea.l    32(a0),a0
[0005cb4e] 4e90                      jsr        (a0)
[0005cb50] 544f                      addq.w     #2,a7
[0005cb52] 6006                      bra.s      $0005CB5A
[0005cb54] 6004                      bra.s      $0005CB5A
[0005cb56] 70ff                      moveq.l    #-1,d0
[0005cb58] 4e71                      nop
[0005cb5a] 5c4f                      addq.w     #6,a7
[0005cb5c] 4e75                      rts
Akt_getExpIdFromNr:
[0005cb5e] 5d4f                      subq.w     #6,a7
[0005cb60] 3f40 0004                 move.w     d0,4(a7)
[0005cb64] 6100 fd98                 bsr        Akt_getKeyTab
[0005cb68] 2e88                      move.l     a0,(a7)
[0005cb6a] 2017                      move.l     (a7),d0
[0005cb6c] 671e                      beq.s      $0005CB8C
[0005cb6e] 2057                      movea.l    (a7),a0
[0005cb70] 704c                      moveq.l    #76,d0
[0005cb72] b0a8 0004                 cmp.l      4(a0),d0
[0005cb76] 6e14                      bgt.s      $0005CB8C
[0005cb78] 3f2f 0004                 move.w     4(a7),-(a7)
[0005cb7c] 206f 0002                 movea.l    2(a7),a0
[0005cb80] 2068 0044                 movea.l    68(a0),a0
[0005cb84] 4e90                      jsr        (a0)
[0005cb86] 544f                      addq.w     #2,a7
[0005cb88] 6006                      bra.s      $0005CB90
[0005cb8a] 6004                      bra.s      $0005CB90
[0005cb8c] 70ff                      moveq.l    #-1,d0
[0005cb8e] 4e71                      nop
[0005cb90] 5c4f                      addq.w     #6,a7
[0005cb92] 4e75                      rts
Akt_getImpIdFromNr:
[0005cb94] 5d4f                      subq.w     #6,a7
[0005cb96] 3f40 0004                 move.w     d0,4(a7)
[0005cb9a] 6100 fd62                 bsr        Akt_getKeyTab
[0005cb9e] 2e88                      move.l     a0,(a7)
[0005cba0] 2017                      move.l     (a7),d0
[0005cba2] 671e                      beq.s      $0005CBC2
[0005cba4] 2057                      movea.l    (a7),a0
[0005cba6] 704c                      moveq.l    #76,d0
[0005cba8] b0a8 0004                 cmp.l      4(a0),d0
[0005cbac] 6e14                      bgt.s      $0005CBC2
[0005cbae] 3f2f 0004                 move.w     4(a7),-(a7)
[0005cbb2] 206f 0002                 movea.l    2(a7),a0
[0005cbb6] 2068 0048                 movea.l    72(a0),a0
[0005cbba] 4e90                      jsr        (a0)
[0005cbbc] 544f                      addq.w     #2,a7
[0005cbbe] 6006                      bra.s      $0005CBC6
[0005cbc0] 6004                      bra.s      $0005CBC6
[0005cbc2] 70ff                      moveq.l    #-1,d0
[0005cbc4] 4e71                      nop
[0005cbc6] 5c4f                      addq.w     #6,a7
[0005cbc8] 4e75                      rts
Akt_getExpNrFromName:
[0005cbca] 514f                      subq.w     #8,a7
[0005cbcc] 2f48 0004                 move.l     a0,4(a7)
[0005cbd0] 6100 fd2c                 bsr        Akt_getKeyTab
[0005cbd4] 2e88                      move.l     a0,(a7)
[0005cbd6] 2017                      move.l     (a7),d0
[0005cbd8] 671e                      beq.s      $0005CBF8
[0005cbda] 2057                      movea.l    (a7),a0
[0005cbdc] 7054                      moveq.l    #84,d0
[0005cbde] b0a8 0004                 cmp.l      4(a0),d0
[0005cbe2] 6e14                      bgt.s      $0005CBF8
[0005cbe4] 2f2f 0004                 move.l     4(a7),-(a7)
[0005cbe8] 206f 0004                 movea.l    4(a7),a0
[0005cbec] 2068 004c                 movea.l    76(a0),a0
[0005cbf0] 4e90                      jsr        (a0)
[0005cbf2] 584f                      addq.w     #4,a7
[0005cbf4] 6006                      bra.s      $0005CBFC
[0005cbf6] 6004                      bra.s      $0005CBFC
[0005cbf8] 4240                      clr.w      d0
[0005cbfa] 4e71                      nop
[0005cbfc] 504f                      addq.w     #8,a7
[0005cbfe] 4e75                      rts
Akt_getImpNrFromName:
[0005cc00] 514f                      subq.w     #8,a7
[0005cc02] 2f48 0004                 move.l     a0,4(a7)
[0005cc06] 6100 fcf6                 bsr        Akt_getKeyTab
[0005cc0a] 2e88                      move.l     a0,(a7)
[0005cc0c] 2017                      move.l     (a7),d0
[0005cc0e] 671e                      beq.s      $0005CC2E
[0005cc10] 2057                      movea.l    (a7),a0
[0005cc12] 7054                      moveq.l    #84,d0
[0005cc14] b0a8 0004                 cmp.l      4(a0),d0
[0005cc18] 6e14                      bgt.s      $0005CC2E
[0005cc1a] 2f2f 0004                 move.l     4(a7),-(a7)
[0005cc1e] 206f 0004                 movea.l    4(a7),a0
[0005cc22] 2068 0050                 movea.l    80(a0),a0
[0005cc26] 4e90                      jsr        (a0)
[0005cc28] 584f                      addq.w     #4,a7
[0005cc2a] 6006                      bra.s      $0005CC32
[0005cc2c] 6004                      bra.s      $0005CC32
[0005cc2e] 4240                      clr.w      d0
[0005cc30] 4e71                      nop
[0005cc32] 504f                      addq.w     #8,a7
[0005cc34] 4e75                      rts
Akt_getEuro:
[0005cc36] 514f                      subq.w     #8,a7
[0005cc38] 6100 fcc4                 bsr        Akt_getKeyTab
[0005cc3c] 2f48 0004                 move.l     a0,4(a7)
[0005cc40] 202f 0004                 move.l     4(a7),d0
[0005cc44] 671a                      beq.s      $0005CC60
[0005cc46] 206f 0004                 movea.l    4(a7),a0
[0005cc4a] 7058                      moveq.l    #88,d0
[0005cc4c] b0a8 0004                 cmp.l      4(a0),d0
[0005cc50] 6e0e                      bgt.s      $0005CC60
[0005cc52] 206f 0004                 movea.l    4(a7),a0
[0005cc56] 2068 0054                 movea.l    84(a0),a0
[0005cc5a] 4e90                      jsr        (a0)
[0005cc5c] 6022                      bra.s      $0005CC80
[0005cc5e] 6020                      bra.s      $0005CC80
[0005cc60] 41d7                      lea.l      (a7),a0
[0005cc62] 203c 4555 524f            move.l     #$4555524F,d0
[0005cc68] 4eb9 0008 0ec4            jsr        Ash_getcookie
[0005cc6e] 4a40                      tst.w      d0
[0005cc70] 6706                      beq.s      $0005CC78
[0005cc72] 2017                      move.l     (a7),d0
[0005cc74] 600a                      bra.s      $0005CC80
[0005cc76] 6008                      bra.s      $0005CC80
[0005cc78] 203c 0000 02ec            move.l     #$000002EC,d0
[0005cc7e] 4e71                      nop
[0005cc80] 504f                      addq.w     #8,a7
[0005cc82] 4e75                      rts
Akt_CharAtari2X:
[0005cc84] 514f                      subq.w     #8,a7
[0005cc86] 3f40 0006                 move.w     d0,6(a7)
[0005cc8a] 1f41 0004                 move.b     d1,4(a7)
[0005cc8e] 6100 fc6e                 bsr        Akt_getKeyTab
[0005cc92] 2e88                      move.l     a0,(a7)
[0005cc94] 2017                      move.l     (a7),d0
[0005cc96] 6718                      beq.s      $0005CCB0
[0005cc98] 1f2f 0004                 move.b     4(a7),-(a7)
[0005cc9c] 3f2f 0008                 move.w     8(a7),-(a7)
[0005cca0] 206f 0004                 movea.l    4(a7),a0
[0005cca4] 2068 0014                 movea.l    20(a0),a0
[0005cca8] 4e90                      jsr        (a0)
[0005ccaa] 584f                      addq.w     #4,a7
[0005ccac] 6008                      bra.s      $0005CCB6
[0005ccae] 6006                      bra.s      $0005CCB6
[0005ccb0] 102f 0004                 move.b     4(a7),d0
[0005ccb4] 4e71                      nop
[0005ccb6] 504f                      addq.w     #8,a7
[0005ccb8] 4e75                      rts
Akt_CharX2Atari:
[0005ccba] 514f                      subq.w     #8,a7
[0005ccbc] 3f40 0006                 move.w     d0,6(a7)
[0005ccc0] 1f41 0004                 move.b     d1,4(a7)
[0005ccc4] 6100 fc38                 bsr        Akt_getKeyTab
[0005ccc8] 2e88                      move.l     a0,(a7)
[0005ccca] 2017                      move.l     (a7),d0
[0005cccc] 6718                      beq.s      $0005CCE6
[0005ccce] 1f2f 0004                 move.b     4(a7),-(a7)
[0005ccd2] 3f2f 0008                 move.w     8(a7),-(a7)
[0005ccd6] 206f 0004                 movea.l    4(a7),a0
[0005ccda] 2068 0024                 movea.l    36(a0),a0
[0005ccde] 4e90                      jsr        (a0)
[0005cce0] 584f                      addq.w     #4,a7
[0005cce2] 6008                      bra.s      $0005CCEC
[0005cce4] 6006                      bra.s      $0005CCEC
[0005cce6] 102f 0004                 move.b     4(a7),d0
[0005ccea] 4e71                      nop
[0005ccec] 504f                      addq.w     #8,a7
[0005ccee] 4e75                      rts
Akt_BlockAtari2X:
[0005ccf0] 4fef ffe6                 lea.l      -26(a7),a7
[0005ccf4] 2f48 000e                 move.l     a0,14(a7)
[0005ccf8] 3f40 000c                 move.w     d0,12(a7)
[0005ccfc] 2f49 0008                 move.l     a1,8(a7)
[0005cd00] 2f41 0004                 move.l     d1,4(a7)
[0005cd04] 6100 fbf8                 bsr        Akt_getKeyTab
[0005cd08] 2e88                      move.l     a0,(a7)
[0005cd0a] 202f 0008                 move.l     8(a7),d0
[0005cd0e] 671c                      beq.s      $0005CD2C
[0005cd10] 206f 000e                 movea.l    14(a7),a0
[0005cd14] b1ef 0008                 cmpa.l     8(a7),a0
[0005cd18] 6712                      beq.s      $0005CD2C
[0005cd1a] 202f 0004                 move.l     4(a7),d0
[0005cd1e] 226f 0008                 movea.l    8(a7),a1
[0005cd22] 206f 000e                 movea.l    14(a7),a0
[0005cd26] 4eb9 0008 3500            jsr        memcpy
[0005cd2c] 2017                      move.l     (a7),d0
[0005cd2e] 6760                      beq.s      $0005CD90
[0005cd30] 2057                      movea.l    (a7),a0
[0005cd32] 7030                      moveq.l    #48,d0
[0005cd34] b0a8 0004                 cmp.l      4(a0),d0
[0005cd38] 6e1c                      bgt.s      $0005CD56
[0005cd3a] 2f2f 000e                 move.l     14(a7),-(a7)
[0005cd3e] 2f2f 0008                 move.l     8(a7),-(a7)
[0005cd42] 3f2f 0014                 move.w     20(a7),-(a7)
[0005cd46] 206f 000a                 movea.l    10(a7),a0
[0005cd4a] 2068 0028                 movea.l    40(a0),a0
[0005cd4e] 4e90                      jsr        (a0)
[0005cd50] 4fef 000a                 lea.l      10(a7),a7
[0005cd54] 603a                      bra.s      $0005CD90
[0005cd56] 2f6f 000e 0016            move.l     14(a7),22(a7)
[0005cd5c] 42af 0012                 clr.l      18(a7)
[0005cd60] 6024                      bra.s      $0005CD86
[0005cd62] 206f 0016                 movea.l    22(a7),a0
[0005cd66] 1f10                      move.b     (a0),-(a7)
[0005cd68] 3f2f 000e                 move.w     14(a7),-(a7)
[0005cd6c] 206f 0004                 movea.l    4(a7),a0
[0005cd70] 2068 0014                 movea.l    20(a0),a0
[0005cd74] 4e90                      jsr        (a0)
[0005cd76] 584f                      addq.w     #4,a7
[0005cd78] 206f 0016                 movea.l    22(a7),a0
[0005cd7c] 1080                      move.b     d0,(a0)
[0005cd7e] 52af 0012                 addq.l     #1,18(a7)
[0005cd82] 52af 0016                 addq.l     #1,22(a7)
[0005cd86] 202f 0012                 move.l     18(a7),d0
[0005cd8a] b0af 0004                 cmp.l      4(a7),d0
[0005cd8e] 6dd2                      blt.s      $0005CD62
[0005cd90] 206f 000e                 movea.l    14(a7),a0
[0005cd94] 4fef 001a                 lea.l      26(a7),a7
[0005cd98] 4e75                      rts
Akt_BlockX2Atari:
[0005cd9a] 4fef ffe6                 lea.l      -26(a7),a7
[0005cd9e] 2f48 000e                 move.l     a0,14(a7)
[0005cda2] 3f40 000c                 move.w     d0,12(a7)
[0005cda6] 2f49 0008                 move.l     a1,8(a7)
[0005cdaa] 2f41 0004                 move.l     d1,4(a7)
[0005cdae] 6100 fb4e                 bsr        Akt_getKeyTab
[0005cdb2] 2e88                      move.l     a0,(a7)
[0005cdb4] 202f 0008                 move.l     8(a7),d0
[0005cdb8] 671c                      beq.s      $0005CDD6
[0005cdba] 206f 000e                 movea.l    14(a7),a0
[0005cdbe] b1ef 0008                 cmpa.l     8(a7),a0
[0005cdc2] 6712                      beq.s      $0005CDD6
[0005cdc4] 202f 0004                 move.l     4(a7),d0
[0005cdc8] 226f 0008                 movea.l    8(a7),a1
[0005cdcc] 206f 000e                 movea.l    14(a7),a0
[0005cdd0] 4eb9 0008 3500            jsr        memcpy
[0005cdd6] 2017                      move.l     (a7),d0
[0005cdd8] 6760                      beq.s      $0005CE3A
[0005cdda] 2057                      movea.l    (a7),a0
[0005cddc] 7030                      moveq.l    #48,d0
[0005cdde] b0a8 0004                 cmp.l      4(a0),d0
[0005cde2] 6e1c                      bgt.s      $0005CE00
[0005cde4] 2f2f 000e                 move.l     14(a7),-(a7)
[0005cde8] 2f2f 0008                 move.l     8(a7),-(a7)
[0005cdec] 3f2f 0014                 move.w     20(a7),-(a7)
[0005cdf0] 206f 000a                 movea.l    10(a7),a0
[0005cdf4] 2068 002c                 movea.l    44(a0),a0
[0005cdf8] 4e90                      jsr        (a0)
[0005cdfa] 4fef 000a                 lea.l      10(a7),a7
[0005cdfe] 603a                      bra.s      $0005CE3A
[0005ce00] 2f6f 000e 0016            move.l     14(a7),22(a7)
[0005ce06] 42af 0012                 clr.l      18(a7)
[0005ce0a] 6024                      bra.s      $0005CE30
[0005ce0c] 206f 0016                 movea.l    22(a7),a0
[0005ce10] 1f10                      move.b     (a0),-(a7)
[0005ce12] 3f2f 000e                 move.w     14(a7),-(a7)
[0005ce16] 206f 0004                 movea.l    4(a7),a0
[0005ce1a] 2068 0024                 movea.l    36(a0),a0
[0005ce1e] 4e90                      jsr        (a0)
[0005ce20] 584f                      addq.w     #4,a7
[0005ce22] 206f 0016                 movea.l    22(a7),a0
[0005ce26] 1080                      move.b     d0,(a0)
[0005ce28] 52af 0012                 addq.l     #1,18(a7)
[0005ce2c] 52af 0016                 addq.l     #1,22(a7)
[0005ce30] 202f 0012                 move.l     18(a7),d0
[0005ce34] b0af 0004                 cmp.l      4(a7),d0
[0005ce38] 6dd2                      blt.s      $0005CE0C
[0005ce3a] 206f 000e                 movea.l    14(a7),a0
[0005ce3e] 4fef 001a                 lea.l      26(a7),a7
[0005ce42] 4e75                      rts
Akt_StringAtari2X:
[0005ce44] 4fef fff6                 lea.l      -10(a7),a7
[0005ce48] 2f48 0006                 move.l     a0,6(a7)
[0005ce4c] 3f40 0004                 move.w     d0,4(a7)
[0005ce50] 2e89                      move.l     a1,(a7)
[0005ce52] 2057                      movea.l    (a7),a0
[0005ce54] 4eb9 0008 2f6c            jsr        strlen
[0005ce5a] 2200                      move.l     d0,d1
[0005ce5c] 5281                      addq.l     #1,d1
[0005ce5e] 2257                      movea.l    (a7),a1
[0005ce60] 302f 0004                 move.w     4(a7),d0
[0005ce64] 206f 0006                 movea.l    6(a7),a0
[0005ce68] 6100 fe86                 bsr        Akt_BlockAtari2X
[0005ce6c] 4fef 000a                 lea.l      10(a7),a7
[0005ce70] 4e75                      rts
Akt_StringX2Atari:
[0005ce72] 4fef fff6                 lea.l      -10(a7),a7
[0005ce76] 2f48 0006                 move.l     a0,6(a7)
[0005ce7a] 3f40 0004                 move.w     d0,4(a7)
[0005ce7e] 2e89                      move.l     a1,(a7)
[0005ce80] 2057                      movea.l    (a7),a0
[0005ce82] 4eb9 0008 2f6c            jsr        strlen
[0005ce88] 2200                      move.l     d0,d1
[0005ce8a] 5281                      addq.l     #1,d1
[0005ce8c] 2257                      movea.l    (a7),a1
[0005ce8e] 302f 0004                 move.w     4(a7),d0
[0005ce92] 206f 0006                 movea.l    6(a7),a0
[0005ce96] 6100 ff02                 bsr        Akt_BlockX2Atari
[0005ce9a] 4fef 000a                 lea.l      10(a7),a7
[0005ce9e] 4e75                      rts
Akt_CharX2Unicode:
[0005cea0] 514f                      subq.w     #8,a7
[0005cea2] 3f40 0006                 move.w     d0,6(a7)
[0005cea6] 1f41 0004                 move.b     d1,4(a7)
[0005ceaa] 6100 fa52                 bsr        Akt_getKeyTab
[0005ceae] 2e88                      move.l     a0,(a7)
[0005ceb0] 2017                      move.l     (a7),d0
[0005ceb2] 6722                      beq.s      $0005CED6
[0005ceb4] 2057                      movea.l    (a7),a0
[0005ceb6] 7060                      moveq.l    #96,d0
[0005ceb8] b0a8 0004                 cmp.l      4(a0),d0
[0005cebc] 6e18                      bgt.s      $0005CED6
[0005cebe] 1f2f 0004                 move.b     4(a7),-(a7)
[0005cec2] 3f2f 0008                 move.w     8(a7),-(a7)
[0005cec6] 206f 0004                 movea.l    4(a7),a0
[0005ceca] 2068 0058                 movea.l    88(a0),a0
[0005cece] 4e90                      jsr        (a0)
[0005ced0] 584f                      addq.w     #4,a7
[0005ced2] 600a                      bra.s      $0005CEDE
[0005ced4] 6008                      bra.s      $0005CEDE
[0005ced6] 102f 0004                 move.b     4(a7),d0
[0005ceda] 4880                      ext.w      d0
[0005cedc] 4e71                      nop
[0005cede] 504f                      addq.w     #8,a7
[0005cee0] 4e75                      rts
Akt_CharUnicode2X:
[0005cee2] 514f                      subq.w     #8,a7
[0005cee4] 3f40 0006                 move.w     d0,6(a7)
[0005cee8] 3f41 0004                 move.w     d1,4(a7)
[0005ceec] 6100 fa10                 bsr        Akt_getKeyTab
[0005cef0] 2e88                      move.l     a0,(a7)
[0005cef2] 2017                      move.l     (a7),d0
[0005cef4] 6722                      beq.s      $0005CF18
[0005cef6] 2057                      movea.l    (a7),a0
[0005cef8] 7060                      moveq.l    #96,d0
[0005cefa] b0a8 0004                 cmp.l      4(a0),d0
[0005cefe] 6e18                      bgt.s      $0005CF18
[0005cf00] 3f2f 0004                 move.w     4(a7),-(a7)
[0005cf04] 3f2f 0008                 move.w     8(a7),-(a7)
[0005cf08] 206f 0004                 movea.l    4(a7),a0
[0005cf0c] 2068 005c                 movea.l    92(a0),a0
[0005cf10] 4e90                      jsr        (a0)
[0005cf12] 584f                      addq.w     #4,a7
[0005cf14] 600a                      bra.s      $0005CF20
[0005cf16] 6008                      bra.s      $0005CF20
[0005cf18] 70ff                      moveq.l    #-1,d0
[0005cf1a] c02f 0005                 and.b      5(a7),d0
[0005cf1e] 4e71                      nop
[0005cf20] 504f                      addq.w     #8,a7
[0005cf22] 4e75                      rts
Akt_BlockX2Unicode:
[0005cf24] 4fef ffee                 lea.l      -18(a7),a7
[0005cf28] 2f48 000e                 move.l     a0,14(a7)
[0005cf2c] 3f40 000c                 move.w     d0,12(a7)
[0005cf30] 2f49 0008                 move.l     a1,8(a7)
[0005cf34] 2f41 0004                 move.l     d1,4(a7)
[0005cf38] 6100 f9c4                 bsr        Akt_getKeyTab
[0005cf3c] 2e88                      move.l     a0,(a7)
[0005cf3e] 2017                      move.l     (a7),d0
[0005cf40] 6740                      beq.s      $0005CF82
[0005cf42] 2057                      movea.l    (a7),a0
[0005cf44] 7060                      moveq.l    #96,d0
[0005cf46] b0a8 0004                 cmp.l      4(a0),d0
[0005cf4a] 6e20                      bgt.s      $0005CF6C
[0005cf4c] 2f2f 0004                 move.l     4(a7),-(a7)
[0005cf50] 2f2f 000c                 move.l     12(a7),-(a7)
[0005cf54] 3f2f 0014                 move.w     20(a7),-(a7)
[0005cf58] 2f2f 0018                 move.l     24(a7),-(a7)
[0005cf5c] 206f 000e                 movea.l    14(a7),a0
[0005cf60] 2068 0060                 movea.l    96(a0),a0
[0005cf64] 4e90                      jsr        (a0)
[0005cf66] 4fef 000e                 lea.l      14(a7),a7
[0005cf6a] 6016                      bra.s      $0005CF82
[0005cf6c] 222f 0004                 move.l     4(a7),d1
[0005cf70] d281                      add.l      d1,d1
[0005cf72] 4240                      clr.w      d0
[0005cf74] 206f 000e                 movea.l    14(a7),a0
[0005cf78] 4eb9 0008 36ea            jsr        memset
[0005cf7e] 91c8                      suba.l     a0,a0
[0005cf80] 6004                      bra.s      $0005CF86
[0005cf82] 206f 000e                 movea.l    14(a7),a0
[0005cf86] 4fef 0012                 lea.l      18(a7),a7
[0005cf8a] 4e75                      rts
Akt_BlockUnicode2X:
[0005cf8c] 4fef ffee                 lea.l      -18(a7),a7
[0005cf90] 2f48 000e                 move.l     a0,14(a7)
[0005cf94] 3f40 000c                 move.w     d0,12(a7)
[0005cf98] 2f49 0008                 move.l     a1,8(a7)
[0005cf9c] 2f41 0004                 move.l     d1,4(a7)
[0005cfa0] 6100 f95c                 bsr        Akt_getKeyTab
[0005cfa4] 2e88                      move.l     a0,(a7)
[0005cfa6] 2017                      move.l     (a7),d0
[0005cfa8] 672e                      beq.s      $0005CFD8
[0005cfaa] 2057                      movea.l    (a7),a0
[0005cfac] 7060                      moveq.l    #96,d0
[0005cfae] b0a8 0004                 cmp.l      4(a0),d0
[0005cfb2] 6e20                      bgt.s      $0005CFD4
[0005cfb4] 2f2f 0004                 move.l     4(a7),-(a7)
[0005cfb8] 2f2f 000c                 move.l     12(a7),-(a7)
[0005cfbc] 3f2f 0014                 move.w     20(a7),-(a7)
[0005cfc0] 2f2f 0018                 move.l     24(a7),-(a7)
[0005cfc4] 206f 000e                 movea.l    14(a7),a0
[0005cfc8] 2068 0064                 movea.l    100(a0),a0
[0005cfcc] 4e90                      jsr        (a0)
[0005cfce] 4fef 000e                 lea.l      14(a7),a7
[0005cfd2] 6004                      bra.s      $0005CFD8
[0005cfd4] 91c8                      suba.l     a0,a0
[0005cfd6] 6004                      bra.s      $0005CFDC
[0005cfd8] 206f 000e                 movea.l    14(a7),a0
[0005cfdc] 4fef 0012                 lea.l      18(a7),a7
[0005cfe0] 4e75                      rts
Akt_StringX2Unicode:
[0005cfe2] 4fef fff6                 lea.l      -10(a7),a7
[0005cfe6] 2f48 0006                 move.l     a0,6(a7)
[0005cfea] 3f40 0004                 move.w     d0,4(a7)
[0005cfee] 2e89                      move.l     a1,(a7)
[0005cff0] 2057                      movea.l    (a7),a0
[0005cff2] 4eb9 0008 2f6c            jsr        strlen
[0005cff8] 2200                      move.l     d0,d1
[0005cffa] 5281                      addq.l     #1,d1
[0005cffc] 2257                      movea.l    (a7),a1
[0005cffe] 302f 0004                 move.w     4(a7),d0
[0005d002] 206f 0006                 movea.l    6(a7),a0
[0005d006] 6100 ff1c                 bsr        Akt_BlockX2Unicode
[0005d00a] 4fef 000a                 lea.l      10(a7),a7
[0005d00e] 4e75                      rts
Akt_BlockXUtf2Unicode:
[0005d010] 4fef ffee                 lea.l      -18(a7),a7
[0005d014] 2f48 000e                 move.l     a0,14(a7)
[0005d018] 2f49 000a                 move.l     a1,10(a7)
[0005d01c] 3f40 0008                 move.w     d0,8(a7)
[0005d020] 2f41 0004                 move.l     d1,4(a7)
[0005d024] 6100 f8d8                 bsr        Akt_getKeyTab
[0005d028] 2e88                      move.l     a0,(a7)
[0005d02a] 2017                      move.l     (a7),d0
[0005d02c] 6732                      beq.s      $0005D060
[0005d02e] 2057                      movea.l    (a7),a0
[0005d030] 7068                      moveq.l    #104,d0
[0005d032] b0a8 0004                 cmp.l      4(a0),d0
[0005d036] 6e24                      bgt.s      $0005D05C
[0005d038] 2f2f 0004                 move.l     4(a7),-(a7)
[0005d03c] 2f2f 001a                 move.l     26(a7),-(a7)
[0005d040] 3f2f 0010                 move.w     16(a7),-(a7)
[0005d044] 2f2f 0014                 move.l     20(a7),-(a7)
[0005d048] 2f2f 001c                 move.l     28(a7),-(a7)
[0005d04c] 206f 0012                 movea.l    18(a7),a0
[0005d050] 2068 0078                 movea.l    120(a0),a0
[0005d054] 4e90                      jsr        (a0)
[0005d056] 4fef 0012                 lea.l      18(a7),a7
[0005d05a] 6004                      bra.s      $0005D060
[0005d05c] 91c8                      suba.l     a0,a0
[0005d05e] 6004                      bra.s      $0005D064
[0005d060] 206f 000e                 movea.l    14(a7),a0
[0005d064] 4fef 0012                 lea.l      18(a7),a7
[0005d068] 4e75                      rts
Akt_BlockUnicode2XUtf:
[0005d06a] 4fef ffee                 lea.l      -18(a7),a7
[0005d06e] 2f48 000e                 move.l     a0,14(a7)
[0005d072] 2f49 000a                 move.l     a1,10(a7)
[0005d076] 3f40 0008                 move.w     d0,8(a7)
[0005d07a] 2f41 0004                 move.l     d1,4(a7)
[0005d07e] 6100 f87e                 bsr        Akt_getKeyTab
[0005d082] 2e88                      move.l     a0,(a7)
[0005d084] 2017                      move.l     (a7),d0
[0005d086] 6732                      beq.s      $0005D0BA
[0005d088] 2057                      movea.l    (a7),a0
[0005d08a] 7068                      moveq.l    #104,d0
[0005d08c] b0a8 0004                 cmp.l      4(a0),d0
[0005d090] 6e28                      bgt.s      $0005D0BA
[0005d092] 2f2f 0004                 move.l     4(a7),-(a7)
[0005d096] 2f2f 001a                 move.l     26(a7),-(a7)
[0005d09a] 3f2f 0010                 move.w     16(a7),-(a7)
[0005d09e] 2f2f 0014                 move.l     20(a7),-(a7)
[0005d0a2] 2f2f 001c                 move.l     28(a7),-(a7)
[0005d0a6] 206f 0012                 movea.l    18(a7),a0
[0005d0aa] 2068 007c                 movea.l    124(a0),a0
[0005d0ae] 4e90                      jsr        (a0)
[0005d0b0] 4fef 0012                 lea.l      18(a7),a7
[0005d0b4] 206f 000e                 movea.l    14(a7),a0
[0005d0b8] 6002                      bra.s      $0005D0BC
[0005d0ba] 91c8                      suba.l     a0,a0
[0005d0bc] 4fef 0012                 lea.l      18(a7),a7
[0005d0c0] 4e75                      rts
Akt_BlockXUtf2U2XUtf:
[0005d0c2] 4fef ffec                 lea.l      -20(a7),a7
[0005d0c6] 2f48 0010                 move.l     a0,16(a7)
[0005d0ca] 2f49 000c                 move.l     a1,12(a7)
[0005d0ce] 3f40 000a                 move.w     d0,10(a7)
[0005d0d2] 2f41 0006                 move.l     d1,6(a7)
[0005d0d6] 3f42 0004                 move.w     d2,4(a7)
[0005d0da] 6100 f822                 bsr        Akt_getKeyTab
[0005d0de] 2e88                      move.l     a0,(a7)
[0005d0e0] 2017                      move.l     (a7),d0
[0005d0e2] 674a                      beq.s      $0005D12E
[0005d0e4] 2057                      movea.l    (a7),a0
[0005d0e6] 0ca8 0000 0084 0004       cmpi.l     #$00000084,4(a0)
[0005d0ee] 6d2e                      blt.s      $0005D11E
[0005d0f0] 3f2f 0004                 move.w     4(a7),-(a7)
[0005d0f4] 2f2f 0008                 move.l     8(a7),-(a7)
[0005d0f8] 2f2f 001e                 move.l     30(a7),-(a7)
[0005d0fc] 3f2f 0014                 move.w     20(a7),-(a7)
[0005d100] 2f2f 0018                 move.l     24(a7),-(a7)
[0005d104] 2f2f 0020                 move.l     32(a7),-(a7)
[0005d108] 206f 0014                 movea.l    20(a7),a0
[0005d10c] 2068 0080                 movea.l    128(a0),a0
[0005d110] 4e90                      jsr        (a0)
[0005d112] 4fef 0014                 lea.l      20(a7),a7
[0005d116] 206f 0010                 movea.l    16(a7),a0
[0005d11a] 6014                      bra.s      $0005D130
[0005d11c] 6010                      bra.s      $0005D12E
[0005d11e] 202f 000c                 move.l     12(a7),d0
[0005d122] 670a                      beq.s      $0005D12E
[0005d124] 206f 000c                 movea.l    12(a7),a0
[0005d128] 20bc ffff ffff            move.l     #$FFFFFFFF,(a0)
[0005d12e] 91c8                      suba.l     a0,a0
[0005d130] 4fef 0014                 lea.l      20(a7),a7
[0005d134] 4e75                      rts
Akt_BlockXUtf2XUtf:
[0005d136] 4fef ffec                 lea.l      -20(a7),a7
[0005d13a] 2f48 0010                 move.l     a0,16(a7)
[0005d13e] 2f49 000c                 move.l     a1,12(a7)
[0005d142] 3f40 000a                 move.w     d0,10(a7)
[0005d146] 2f41 0006                 move.l     d1,6(a7)
[0005d14a] 3f42 0004                 move.w     d2,4(a7)
[0005d14e] 6100 f7ae                 bsr        Akt_getKeyTab
[0005d152] 2e88                      move.l     a0,(a7)
[0005d154] 2017                      move.l     (a7),d0
[0005d156] 674a                      beq.s      $0005D1A2
[0005d158] 2057                      movea.l    (a7),a0
[0005d15a] 0ca8 0000 0088 0004       cmpi.l     #$00000088,4(a0)
[0005d162] 6d2e                      blt.s      $0005D192
[0005d164] 3f2f 0004                 move.w     4(a7),-(a7)
[0005d168] 2f2f 0008                 move.l     8(a7),-(a7)
[0005d16c] 2f2f 001e                 move.l     30(a7),-(a7)
[0005d170] 3f2f 0014                 move.w     20(a7),-(a7)
[0005d174] 2f2f 0018                 move.l     24(a7),-(a7)
[0005d178] 2f2f 0020                 move.l     32(a7),-(a7)
[0005d17c] 206f 0014                 movea.l    20(a7),a0
[0005d180] 2068 0084                 movea.l    132(a0),a0
[0005d184] 4e90                      jsr        (a0)
[0005d186] 4fef 0014                 lea.l      20(a7),a7
[0005d18a] 206f 0010                 movea.l    16(a7),a0
[0005d18e] 6014                      bra.s      $0005D1A4
[0005d190] 6010                      bra.s      $0005D1A2
[0005d192] 202f 000c                 move.l     12(a7),d0
[0005d196] 670a                      beq.s      $0005D1A2
[0005d198] 206f 000c                 movea.l    12(a7),a0
[0005d19c] 20bc ffff ffff            move.l     #$FFFFFFFF,(a0)
[0005d1a2] 91c8                      suba.l     a0,a0
[0005d1a4] 4fef 0014                 lea.l      20(a7),a7
[0005d1a8] 4e75                      rts
Akt_StringXUtf2Unicode:
[0005d1aa] 4fef fff6                 lea.l      -10(a7),a7
[0005d1ae] 2f48 0006                 move.l     a0,6(a7)
[0005d1b2] 2f49 0002                 move.l     a1,2(a7)
[0005d1b6] 3e80                      move.w     d0,(a7)
[0005d1b8] 2f2f 000e                 move.l     14(a7),-(a7)
[0005d1bc] 206f 0012                 movea.l    18(a7),a0
[0005d1c0] 4eb9 0008 2f6c            jsr        strlen
[0005d1c6] 2200                      move.l     d0,d1
[0005d1c8] 5281                      addq.l     #1,d1
[0005d1ca] 302f 0004                 move.w     4(a7),d0
[0005d1ce] 226f 0006                 movea.l    6(a7),a1
[0005d1d2] 206f 000a                 movea.l    10(a7),a0
[0005d1d6] 6100 fe38                 bsr        Akt_BlockXUtf2Unicode
[0005d1da] 584f                      addq.w     #4,a7
[0005d1dc] 4fef 000a                 lea.l      10(a7),a7
[0005d1e0] 4e75                      rts
Akt_StringXUtf2U2XUtf:
[0005d1e2] 4fef fff4                 lea.l      -12(a7),a7
[0005d1e6] 2f48 0008                 move.l     a0,8(a7)
[0005d1ea] 2f49 0004                 move.l     a1,4(a7)
[0005d1ee] 3f40 0002                 move.w     d0,2(a7)
[0005d1f2] 3e81                      move.w     d1,(a7)
[0005d1f4] 2f2f 0010                 move.l     16(a7),-(a7)
[0005d1f8] 206f 0014                 movea.l    20(a7),a0
[0005d1fc] 4eb9 0008 2f6c            jsr        strlen
[0005d202] 2200                      move.l     d0,d1
[0005d204] 5281                      addq.l     #1,d1
[0005d206] 302f 0006                 move.w     6(a7),d0
[0005d20a] 226f 0008                 movea.l    8(a7),a1
[0005d20e] 206f 000c                 movea.l    12(a7),a0
[0005d212] 342f 0004                 move.w     4(a7),d2
[0005d216] 6100 feaa                 bsr        Akt_BlockXUtf2U2XUtf
[0005d21a] 584f                      addq.w     #4,a7
[0005d21c] 4fef 000c                 lea.l      12(a7),a7
[0005d220] 4e75                      rts
Akt_StringXUtf2XUtf:
[0005d222] 4fef fff4                 lea.l      -12(a7),a7
[0005d226] 2f48 0008                 move.l     a0,8(a7)
[0005d22a] 2f49 0004                 move.l     a1,4(a7)
[0005d22e] 3f40 0002                 move.w     d0,2(a7)
[0005d232] 3e81                      move.w     d1,(a7)
[0005d234] 2f2f 0010                 move.l     16(a7),-(a7)
[0005d238] 206f 0014                 movea.l    20(a7),a0
[0005d23c] 4eb9 0008 2f6c            jsr        strlen
[0005d242] 2200                      move.l     d0,d1
[0005d244] 5281                      addq.l     #1,d1
[0005d246] 302f 0006                 move.w     6(a7),d0
[0005d24a] 226f 0008                 movea.l    8(a7),a1
[0005d24e] 206f 000c                 movea.l    12(a7),a0
[0005d252] 342f 0004                 move.w     4(a7),d2
[0005d256] 6100 fede                 bsr        Akt_BlockXUtf2XUtf
[0005d25a] 584f                      addq.w     #4,a7
[0005d25c] 4fef 000c                 lea.l      12(a7),a7
[0005d260] 4e75                      rts
Akt_popExpName:
[0005d262] 4fef ffee                 lea.l      -18(a7),a7
[0005d266] 2f48 000e                 move.l     a0,14(a7)
[0005d26a] 6100 f6f6                 bsr        Akt_getExpMaxNr
[0005d26e] 5240                      addq.w     #1,d0
[0005d270] 3f40 000a                 move.w     d0,10(a7)
[0005d274] 322f 000a                 move.w     10(a7),d1
[0005d278] 3001                      move.w     d1,d0
[0005d27a] e548                      lsl.w      #2,d0
[0005d27c] d041                      add.w      d1,d0
[0005d27e] e748                      lsl.w      #3,d0
[0005d280] 5240                      addq.w     #1,d0
[0005d282] 48c0                      ext.l      d0
[0005d284] 4eb9 0004 c608            jsr        Ax_malloc
[0005d28a] 2f48 0004                 move.l     a0,4(a7)
[0005d28e] 202f 0004                 move.l     4(a7),d0
[0005d292] 6606                      bne.s      $0005D29A
[0005d294] 91c8                      suba.l     a0,a0
[0005d296] 6000 00ae                 bra        $0005D346
[0005d29a] 206f 0004                 movea.l    4(a7),a0
[0005d29e] 4210                      clr.b      (a0)
[0005d2a0] 4240                      clr.w      d0
[0005d2a2] 3f40 000c                 move.w     d0,12(a7)
[0005d2a6] 3f40 0008                 move.w     d0,8(a7)
[0005d2aa] 6078                      bra.s      $0005D324
[0005d2ac] 302f 000c                 move.w     12(a7),d0
[0005d2b0] 6100 f71a                 bsr        Akt_getExpNameFromNr
[0005d2b4] 2e88                      move.l     a0,(a7)
[0005d2b6] 43f9 000e 146e            lea.l      $000E146E,a1
[0005d2bc] 206f 0004                 movea.l    4(a7),a0
[0005d2c0] 4eb9 0008 2e42            jsr        strcat
[0005d2c6] 2257                      movea.l    (a7),a1
[0005d2c8] 206f 0004                 movea.l    4(a7),a0
[0005d2cc] 4eb9 0008 2e42            jsr        strcat
[0005d2d2] 302f 000c                 move.w     12(a7),d0
[0005d2d6] b06f 000a                 cmp.w      10(a7),d0
[0005d2da] 6c12                      bge.s      $0005D2EE
[0005d2dc] 43f9 000e 1470            lea.l      $000E1470,a1
[0005d2e2] 206f 0004                 movea.l    4(a7),a0
[0005d2e6] 4eb9 0008 2e42            jsr        strcat
[0005d2ec] 6010                      bra.s      $0005D2FE
[0005d2ee] 43f9 000e 1473            lea.l      $000E1473,a1
[0005d2f4] 206f 0004                 movea.l    4(a7),a0
[0005d2f8] 4eb9 0008 2e42            jsr        strcat
[0005d2fe] 302f 0008                 move.w     8(a7),d0
[0005d302] 48c0                      ext.l      d0
[0005d304] 2f00                      move.l     d0,-(a7)
[0005d306] 206f 0004                 movea.l    4(a7),a0
[0005d30a] 4eb9 0008 2f6c            jsr        strlen
[0005d310] b09f                      cmp.l      (a7)+,d0
[0005d312] 630c                      bls.s      $0005D320
[0005d314] 2057                      movea.l    (a7),a0
[0005d316] 4eb9 0008 2f6c            jsr        strlen
[0005d31c] 3f40 0008                 move.w     d0,8(a7)
[0005d320] 526f 000c                 addq.w     #1,12(a7)
[0005d324] 302f 000c                 move.w     12(a7),d0
[0005d328] b06f 000a                 cmp.w      10(a7),d0
[0005d32c] 6d00 ff7e                 blt        $0005D2AC
[0005d330] 202f 000e                 move.l     14(a7),d0
[0005d334] 670c                      beq.s      $0005D342
[0005d336] 7002                      moveq.l    #2,d0
[0005d338] d06f 0008                 add.w      8(a7),d0
[0005d33c] 206f 000e                 movea.l    14(a7),a0
[0005d340] 3080                      move.w     d0,(a0)
[0005d342] 206f 0004                 movea.l    4(a7),a0
[0005d346] 4fef 0012                 lea.l      18(a7),a7
[0005d34a] 4e75                      rts
Akt_popImpName:
[0005d34c] 4fef ffee                 lea.l      -18(a7),a7
[0005d350] 2f48 000e                 move.l     a0,14(a7)
[0005d354] 6100 f656                 bsr        Akt_getImpMaxNr
[0005d358] 5240                      addq.w     #1,d0
[0005d35a] 3f40 000a                 move.w     d0,10(a7)
[0005d35e] 322f 000a                 move.w     10(a7),d1
[0005d362] 3001                      move.w     d1,d0
[0005d364] e548                      lsl.w      #2,d0
[0005d366] d041                      add.w      d1,d0
[0005d368] e748                      lsl.w      #3,d0
[0005d36a] 5240                      addq.w     #1,d0
[0005d36c] 48c0                      ext.l      d0
[0005d36e] 4eb9 0004 c608            jsr        Ax_malloc
[0005d374] 2f48 0004                 move.l     a0,4(a7)
[0005d378] 202f 0004                 move.l     4(a7),d0
[0005d37c] 6606                      bne.s      $0005D384
[0005d37e] 91c8                      suba.l     a0,a0
[0005d380] 6000 00ae                 bra        $0005D430
[0005d384] 206f 0004                 movea.l    4(a7),a0
[0005d388] 4210                      clr.b      (a0)
[0005d38a] 4240                      clr.w      d0
[0005d38c] 3f40 000c                 move.w     d0,12(a7)
[0005d390] 3f40 0008                 move.w     d0,8(a7)
[0005d394] 6078                      bra.s      $0005D40E
[0005d396] 302f 000c                 move.w     12(a7),d0
[0005d39a] 6100 f680                 bsr        Akt_getImpNameFromNr
[0005d39e] 2e88                      move.l     a0,(a7)
[0005d3a0] 43f9 000e 1475            lea.l      $000E1475,a1
[0005d3a6] 206f 0004                 movea.l    4(a7),a0
[0005d3aa] 4eb9 0008 2e42            jsr        strcat
[0005d3b0] 2257                      movea.l    (a7),a1
[0005d3b2] 206f 0004                 movea.l    4(a7),a0
[0005d3b6] 4eb9 0008 2e42            jsr        strcat
[0005d3bc] 302f 000c                 move.w     12(a7),d0
[0005d3c0] b06f 000a                 cmp.w      10(a7),d0
[0005d3c4] 6c12                      bge.s      $0005D3D8
[0005d3c6] 43f9 000e 1477            lea.l      $000E1477,a1
[0005d3cc] 206f 0004                 movea.l    4(a7),a0
[0005d3d0] 4eb9 0008 2e42            jsr        strcat
[0005d3d6] 6010                      bra.s      $0005D3E8
[0005d3d8] 43f9 000e 147a            lea.l      $000E147A,a1
[0005d3de] 206f 0004                 movea.l    4(a7),a0
[0005d3e2] 4eb9 0008 2e42            jsr        strcat
[0005d3e8] 302f 0008                 move.w     8(a7),d0
[0005d3ec] 48c0                      ext.l      d0
[0005d3ee] 2f00                      move.l     d0,-(a7)
[0005d3f0] 206f 0004                 movea.l    4(a7),a0
[0005d3f4] 4eb9 0008 2f6c            jsr        strlen
[0005d3fa] b09f                      cmp.l      (a7)+,d0
[0005d3fc] 630c                      bls.s      $0005D40A
[0005d3fe] 2057                      movea.l    (a7),a0
[0005d400] 4eb9 0008 2f6c            jsr        strlen
[0005d406] 3f40 0008                 move.w     d0,8(a7)
[0005d40a] 526f 000c                 addq.w     #1,12(a7)
[0005d40e] 302f 000c                 move.w     12(a7),d0
[0005d412] b06f 000a                 cmp.w      10(a7),d0
[0005d416] 6d00 ff7e                 blt        $0005D396
[0005d41a] 202f 000e                 move.l     14(a7),d0
[0005d41e] 670c                      beq.s      $0005D42C
[0005d420] 7002                      moveq.l    #2,d0
[0005d422] d06f 0008                 add.w      8(a7),d0
[0005d426] 206f 000e                 movea.l    14(a7),a0
[0005d42a] 3080                      move.w     d0,(a0)
[0005d42c] 206f 0004                 movea.l    4(a7),a0
[0005d430] 4fef 0012                 lea.l      18(a7),a7
[0005d434] 4e75                      rts
Akt_chooseExpNr:
[0005d436] 4fef ffe8                 lea.l      -24(a7),a7
[0005d43a] 2f48 0014                 move.l     a0,20(a7)
[0005d43e] 3f40 0012                 move.w     d0,18(a7)
[0005d442] 3f41 0010                 move.w     d1,16(a7)
[0005d446] 3ebc ffff                 move.w     #$FFFF,(a7)
[0005d44a] 41ef 0002                 lea.l      2(a7),a0
[0005d44e] 6100 fe12                 bsr        Akt_popExpName
[0005d452] 2f48 000c                 move.l     a0,12(a7)
[0005d456] 202f 000c                 move.l     12(a7),d0
[0005d45a] 6604                      bne.s      $0005D460
[0005d45c] 70ff                      moveq.l    #-1,d0
[0005d45e] 6068                      bra.s      $0005D4C8
[0005d460] 4879 000e 147c            pea.l      $000E147C
[0005d466] 342f 0014                 move.w     20(a7),d2
[0005d46a] 322f 0016                 move.w     22(a7),d1
[0005d46e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005d474] 3028 0016                 move.w     22(a0),d0
[0005d478] c1ef 0006                 muls.w     6(a7),d0
[0005d47c] 226f 0010                 movea.l    16(a7),a1
[0005d480] 206f 0018                 movea.l    24(a7),a0
[0005d484] 4eb9 0006 7b6c            jsr        Ame_strpopup
[0005d48a] 584f                      addq.w     #4,a7
[0005d48c] 2f48 0008                 move.l     a0,8(a7)
[0005d490] 202f 0008                 move.l     8(a7),d0
[0005d494] 6730                      beq.s      $0005D4C6
[0005d496] 707c                      moveq.l    #124,d0
[0005d498] 206f 0008                 movea.l    8(a7),a0
[0005d49c] 4eb9 0008 2e8a            jsr        strchr
[0005d4a2] 2f48 0004                 move.l     a0,4(a7)
[0005d4a6] 202f 0004                 move.l     4(a7),d0
[0005d4aa] 6706                      beq.s      $0005D4B2
[0005d4ac] 206f 0004                 movea.l    4(a7),a0
[0005d4b0] 4210                      clr.b      (a0)
[0005d4b2] 206f 0008                 movea.l    8(a7),a0
[0005d4b6] 4eb9 0004 663c            jsr        Ast_alltrim
[0005d4bc] 206f 0008                 movea.l    8(a7),a0
[0005d4c0] 6100 f708                 bsr        Akt_getExpNrFromName
[0005d4c4] 3e80                      move.w     d0,(a7)
[0005d4c6] 3017                      move.w     (a7),d0
[0005d4c8] 4fef 0018                 lea.l      24(a7),a7
[0005d4cc] 4e75                      rts
Akt_chooseImpNr:
[0005d4ce] 4fef ffe8                 lea.l      -24(a7),a7
[0005d4d2] 2f48 0014                 move.l     a0,20(a7)
[0005d4d6] 3f40 0012                 move.w     d0,18(a7)
[0005d4da] 3f41 0010                 move.w     d1,16(a7)
[0005d4de] 3ebc ffff                 move.w     #$FFFF,(a7)
[0005d4e2] 41ef 0002                 lea.l      2(a7),a0
[0005d4e6] 6100 fe64                 bsr        Akt_popImpName
[0005d4ea] 2f48 000c                 move.l     a0,12(a7)
[0005d4ee] 202f 000c                 move.l     12(a7),d0
[0005d4f2] 6604                      bne.s      $0005D4F8
[0005d4f4] 70ff                      moveq.l    #-1,d0
[0005d4f6] 6068                      bra.s      $0005D560
[0005d4f8] 4879 000e 147d            pea.l      $000E147D
[0005d4fe] 342f 0014                 move.w     20(a7),d2
[0005d502] 322f 0016                 move.w     22(a7),d1
[0005d506] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005d50c] 3028 0016                 move.w     22(a0),d0
[0005d510] c1ef 0006                 muls.w     6(a7),d0
[0005d514] 226f 0010                 movea.l    16(a7),a1
[0005d518] 206f 0018                 movea.l    24(a7),a0
[0005d51c] 4eb9 0006 7b6c            jsr        Ame_strpopup
[0005d522] 584f                      addq.w     #4,a7
[0005d524] 2f48 0008                 move.l     a0,8(a7)
[0005d528] 202f 0008                 move.l     8(a7),d0
[0005d52c] 6730                      beq.s      $0005D55E
[0005d52e] 707c                      moveq.l    #124,d0
[0005d530] 206f 0008                 movea.l    8(a7),a0
[0005d534] 4eb9 0008 2e8a            jsr        strchr
[0005d53a] 2f48 0004                 move.l     a0,4(a7)
[0005d53e] 202f 0004                 move.l     4(a7),d0
[0005d542] 6706                      beq.s      $0005D54A
[0005d544] 206f 0004                 movea.l    4(a7),a0
[0005d548] 4210                      clr.b      (a0)
[0005d54a] 206f 0008                 movea.l    8(a7),a0
[0005d54e] 4eb9 0004 663c            jsr        Ast_alltrim
[0005d554] 206f 0008                 movea.l    8(a7),a0
[0005d558] 6100 f6a6                 bsr        Akt_getImpNrFromName
[0005d55c] 3e80                      move.w     d0,(a7)
[0005d55e] 3017                      move.w     (a7),d0
[0005d560] 4fef 0018                 lea.l      24(a7),a7
[0005d564] 4e75                      rts

	.data

kt:
[000e146a]                           dc.w $0000
[000e146c]                           dc.w $0000
[000e146e]                           dc.w $2000
[000e1470]                           dc.w $207c
[000e1472]                           dc.w $0020
[000e1474]                           dc.w $0020
[000e1476]                           dc.w $0020
[000e1478]                           dc.w $7c00
[000e147a]                           dc.w $2000
[000e147c]                           dc.w $0000
