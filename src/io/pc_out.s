info_start:
[00019c30] 48e7 0038                 movem.l    a2-a4,-(a7)
[00019c34] 2848                      movea.l    a0,a4
[00019c36] 4eb9 0004 b086            jsr        Aev_mess
[00019c3c] 45f9 0010 8378            lea.l      work,a2
[00019c42] 47f9 0010 836c            lea.l      info_xywh,a3
[00019c48] 41f9 000a 7e8a            lea.l      OUTPUT_INFO,a0
[00019c4e] 4eb9 0004 f064            jsr        Aob_create
[00019c54] 2488                      move.l     a0,(a2)
[00019c56] 2008                      move.l     a0,d0
[00019c58] 6700 0094                 beq        $00019CEE
[00019c5c] 4eb9 0004 fbdc            jsr        Aob_fix
[00019c62] 2f39 000e 692a            move.l     _globl,-(a7)
[00019c68] 486b 0006                 pea.l      6(a3)
[00019c6c] 486b 0004                 pea.l      4(a3)
[00019c70] 486b 0002                 pea.l      2(a3)
[00019c74] 224b                      movea.l    a3,a1
[00019c76] 2052                      movea.l    (a2),a0
[00019c78] 4eb9 0007 a218            jsr        mt_form_center
[00019c7e] 4fef 0010                 lea.l      16(a7),a7
[00019c82] 5353                      subq.w     #1,(a3)
[00019c84] 536b 0002                 subq.w     #1,2(a3)
[00019c88] 546b 0004                 addq.w     #2,4(a3)
[00019c8c] 546b 0006                 addq.w     #2,6(a3)
[00019c90] 204b                      movea.l    a3,a0
[00019c92] 4eb9 0005 009c            jsr        Aob_save
[00019c98] 2748 0008                 move.l     a0,8(a3)
[00019c9c] 701f                      moveq.l    #31,d0
[00019c9e] 224c                      movea.l    a4,a1
[00019ca0] 2052                      movea.l    (a2),a0
[00019ca2] 2068 00cc                 movea.l    204(a0),a0
[00019ca6] 2050                      movea.l    (a0),a0
[00019ca8] 4eb9 0008 2fd6            jsr        strncpy
[00019cae] 2052                      movea.l    (a2),a0
[00019cb0] 2268 009c                 movea.l    156(a0),a1
[00019cb4] 2851                      movea.l    (a1),a4
[00019cb6] 4214                      clr.b      (a4)
[00019cb8] 2052                      movea.l    (a2),a0
[00019cba] 2268 00fc                 movea.l    252(a0),a1
[00019cbe] 2851                      movea.l    (a1),a4
[00019cc0] 4214                      clr.b      (a4)
[00019cc2] 2052                      movea.l    (a2),a0
[00019cc4] 2268 012c                 movea.l    300(a0),a1
[00019cc8] 2851                      movea.l    (a1),a4
[00019cca] 4214                      clr.b      (a4)
[00019ccc] 3f2b 0006                 move.w     6(a3),-(a7)
[00019cd0] 3f2b 0004                 move.w     4(a3),-(a7)
[00019cd4] 3f2b 0002                 move.w     2(a3),-(a7)
[00019cd8] 2279 000e 692a            movea.l    _globl,a1
[00019cde] 3413                      move.w     (a3),d2
[00019ce0] 720a                      moveq.l    #10,d1
[00019ce2] 4240                      clr.w      d0
[00019ce4] 2052                      movea.l    (a2),a0
[00019ce6] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00019cec] 5c4f                      addq.w     #6,a7
[00019cee] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00019cf2] 4e75                      rts
info_end:
[00019cf4] 2079 0010 8378            movea.l    work,a0
[00019cfa] 4eb9 0004 f20a            jsr        Aob_delete
[00019d00] 43f9 0010 836c            lea.l      info_xywh,a1
[00019d06] 2079 0010 8374            movea.l    info_bp,a0
[00019d0c] 4eb9 0005 021e            jsr        Aob_restore
[00019d12] 4e75                      rts
info_title:
[00019d14] 2f0a                      move.l     a2,-(a7)
[00019d16] 2f0b                      move.l     a3,-(a7)
[00019d18] 2448                      movea.l    a0,a2
[00019d1a] 47f9 0010 836c            lea.l      info_xywh,a3
[00019d20] 202b 000c                 move.l     12(a3),d0
[00019d24] 674c                      beq.s      $00019D72
[00019d26] 224a                      movea.l    a2,a1
[00019d28] 2040                      movea.l    d0,a0
[00019d2a] 2068 009c                 movea.l    156(a0),a0
[00019d2e] 2050                      movea.l    (a0),a0
[00019d30] 4eb9 0008 2f0c            jsr        strcpy
[00019d36] 3f2b 0006                 move.w     6(a3),-(a7)
[00019d3a] 3f2b 0004                 move.w     4(a3),-(a7)
[00019d3e] 3f2b 0002                 move.w     2(a3),-(a7)
[00019d42] 2279 000e 692a            movea.l    _globl,a1
[00019d48] 3413                      move.w     (a3),d2
[00019d4a] 7201                      moveq.l    #1,d1
[00019d4c] 7006                      moveq.l    #6,d0
[00019d4e] 206b 000c                 movea.l    12(a3),a0
[00019d52] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00019d58] 5c4f                      addq.w     #6,a7
[00019d5a] 41f9 000a 59c8            lea.l      $000A59C8,a0
[00019d60] 4eb9 0001 9d78            jsr        info_list
[00019d66] 41f9 000a 59c8            lea.l      $000A59C8,a0
[00019d6c] 4eb9 0001 9dd0            jsr        info_obj
[00019d72] 265f                      movea.l    (a7)+,a3
[00019d74] 245f                      movea.l    (a7)+,a2
[00019d76] 4e75                      rts
info_list:
[00019d78] 2f0a                      move.l     a2,-(a7)
[00019d7a] 2f0b                      move.l     a3,-(a7)
[00019d7c] 2448                      movea.l    a0,a2
[00019d7e] 47f9 0010 836c            lea.l      info_xywh,a3
[00019d84] 202b 000c                 move.l     12(a3),d0
[00019d88] 6740                      beq.s      $00019DCA
[00019d8a] 224a                      movea.l    a2,a1
[00019d8c] 2040                      movea.l    d0,a0
[00019d8e] 2068 00fc                 movea.l    252(a0),a0
[00019d92] 2050                      movea.l    (a0),a0
[00019d94] 4eb9 0008 2f0c            jsr        strcpy
[00019d9a] 3f2b 0006                 move.w     6(a3),-(a7)
[00019d9e] 3f2b 0004                 move.w     4(a3),-(a7)
[00019da2] 3f2b 0002                 move.w     2(a3),-(a7)
[00019da6] 2279 000e 692a            movea.l    _globl,a1
[00019dac] 3413                      move.w     (a3),d2
[00019dae] 7201                      moveq.l    #1,d1
[00019db0] 700a                      moveq.l    #10,d0
[00019db2] 206b 000c                 movea.l    12(a3),a0
[00019db6] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00019dbc] 5c4f                      addq.w     #6,a7
[00019dbe] 41f9 000a 59c8            lea.l      $000A59C8,a0
[00019dc4] 4eb9 0001 9dd0            jsr        info_obj
[00019dca] 265f                      movea.l    (a7)+,a3
[00019dcc] 245f                      movea.l    (a7)+,a2
[00019dce] 4e75                      rts
info_obj:
[00019dd0] 2f0a                      move.l     a2,-(a7)
[00019dd2] 2f0b                      move.l     a3,-(a7)
[00019dd4] 2448                      movea.l    a0,a2
[00019dd6] 47f9 0010 836c            lea.l      info_xywh,a3
[00019ddc] 202b 000c                 move.l     12(a3),d0
[00019de0] 6734                      beq.s      $00019E16
[00019de2] 224a                      movea.l    a2,a1
[00019de4] 2040                      movea.l    d0,a0
[00019de6] 2068 012c                 movea.l    300(a0),a0
[00019dea] 2050                      movea.l    (a0),a0
[00019dec] 4eb9 0008 2f0c            jsr        strcpy
[00019df2] 3f2b 0006                 move.w     6(a3),-(a7)
[00019df6] 3f2b 0004                 move.w     4(a3),-(a7)
[00019dfa] 3f2b 0002                 move.w     2(a3),-(a7)
[00019dfe] 2279 000e 692a            movea.l    _globl,a1
[00019e04] 3413                      move.w     (a3),d2
[00019e06] 7201                      moveq.l    #1,d1
[00019e08] 700c                      moveq.l    #12,d0
[00019e0a] 206b 000c                 movea.l    12(a3),a0
[00019e0e] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00019e14] 5c4f                      addq.w     #6,a7
[00019e16] 265f                      movea.l    (a7)+,a3
[00019e18] 245f                      movea.l    (a7)+,a2
[00019e1a] 4e75                      rts
out_label:
[00019e1c] 48e7 0038                 movem.l    a2-a4,-(a7)
[00019e20] 2448                      movea.l    a0,a2
[00019e22] 2849                      movea.l    a1,a4
[00019e24] 200a                      move.l     a2,d0
[00019e26] 6724                      beq.s      $00019E4C
[00019e28] 47f9 0010 7f66            lea.l      iostring,a3
[00019e2e] 486a 0016                 pea.l      22(a2)
[00019e32] 43f9 000a 59c9            lea.l      $000A59C9,a1
[00019e38] 204b                      movea.l    a3,a0
[00019e3a] 4eb9 0008 15ac            jsr        sprintf
[00019e40] 584f                      addq.w     #4,a7
[00019e42] 204b                      movea.l    a3,a0
[00019e44] 4eb9 0001 8374            jsr        save_string
[00019e4a] 6008                      bra.s      $00019E54
[00019e4c] 204c                      movea.l    a4,a0
[00019e4e] 4eb9 0001 8374            jsr        save_string
[00019e54] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00019e58] 4e75                      rts
out_label2:
[00019e5a] 48e7 0038                 movem.l    a2-a4,-(a7)
[00019e5e] 2448                      movea.l    a0,a2
[00019e60] 2849                      movea.l    a1,a4
[00019e62] 200a                      move.l     a2,d0
[00019e64] 6724                      beq.s      $00019E8A
[00019e66] 47f9 0010 7f66            lea.l      iostring,a3
[00019e6c] 486a 0016                 pea.l      22(a2)
[00019e70] 43f9 000a 59cf            lea.l      $000A59CF,a1
[00019e76] 204b                      movea.l    a3,a0
[00019e78] 4eb9 0008 15ac            jsr        sprintf
[00019e7e] 584f                      addq.w     #4,a7
[00019e80] 204b                      movea.l    a3,a0
[00019e82] 4eb9 0001 8374            jsr        save_string
[00019e88] 6008                      bra.s      $00019E92
[00019e8a] 204c                      movea.l    a4,a0
[00019e8c] 4eb9 0001 8374            jsr        save_string
[00019e92] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00019e96] 4e75                      rts
out_label3:
[00019e98] 48e7 0038                 movem.l    a2-a4,-(a7)
[00019e9c] 2448                      movea.l    a0,a2
[00019e9e] 2849                      movea.l    a1,a4
[00019ea0] 200a                      move.l     a2,d0
[00019ea2] 6724                      beq.s      $00019EC8
[00019ea4] 47f9 0010 7f66            lea.l      iostring,a3
[00019eaa] 486a 0016                 pea.l      22(a2)
[00019eae] 43f9 000a 59d6            lea.l      $000A59D6,a1
[00019eb4] 204b                      movea.l    a3,a0
[00019eb6] 4eb9 0008 15ac            jsr        sprintf
[00019ebc] 584f                      addq.w     #4,a7
[00019ebe] 204b                      movea.l    a3,a0
[00019ec0] 4eb9 0001 8374            jsr        save_string
[00019ec6] 6008                      bra.s      $00019ED0
[00019ec8] 204c                      movea.l    a4,a0
[00019eca] 4eb9 0001 8374            jsr        save_string
[00019ed0] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00019ed4] 4e75                      rts
out_acs:
[00019ed6] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[00019eda] 4fef ffdc                 lea.l      -36(a7),a7
[00019ede] 2448                      movea.l    a0,a2
[00019ee0] 302a 0006                 move.w     6(a2),d0
[00019ee4] c07c 8000                 and.w      #$8000,d0
[00019ee8] 6600 03d2                 bne        $0001A2BC
[00019eec] 47f9 000a 59c8            lea.l      $000A59C8,a3
[00019ef2] 41eb 0018                 lea.l      24(a3),a0
[00019ef6] 4eb9 0001 8374            jsr        save_string
[00019efc] 41eb 002e                 lea.l      46(a3),a0
[00019f00] 4eb9 0001 8374            jsr        save_string
[00019f06] 49f9 0010 7f66            lea.l      iostring,a4
[00019f0c] 486a 005c                 pea.l      92(a2)
[00019f10] 7040                      moveq.l    #64,d0
[00019f12] 806a 005a                 or.w       90(a2),d0
[00019f16] 3f00                      move.w     d0,-(a7)
[00019f18] 3f2a 0058                 move.w     88(a2),-(a7)
[00019f1c] 3f2a 0056                 move.w     86(a2),-(a7)
[00019f20] 3f3c 012c                 move.w     #$012C,-(a7)
[00019f24] 486b 0064                 pea.l      100(a3)
[00019f28] 43eb 0035                 lea.l      53(a3),a1
[00019f2c] 204c                      movea.l    a4,a0
[00019f2e] 4eb9 0008 15ac            jsr        sprintf
[00019f34] 4fef 0010                 lea.l      16(a7),a7
[00019f38] 204c                      movea.l    a4,a0
[00019f3a] 4eb9 0001 8374            jsr        save_string
[00019f40] 43eb 006c                 lea.l      108(a3),a1
[00019f44] 206a 007c                 movea.l    124(a2),a0
[00019f48] 6100 ff10                 bsr        out_label2
[00019f4c] 41eb 0076                 lea.l      118(a3),a0
[00019f50] 4eb9 0001 8374            jsr        save_string
[00019f56] 43eb 0079                 lea.l      121(a3),a1
[00019f5a] 206a 0080                 movea.l    128(a2),a0
[00019f5e] 6100 fefa                 bsr        out_label2
[00019f62] 41eb 007e                 lea.l      126(a3),a0
[00019f66] 4eb9 0001 8374            jsr        save_string
[00019f6c] 4bea 0084                 lea.l      132(a2),a5
[00019f70] 4243                      clr.w      d3
[00019f72] 6048                      bra.s      $00019FBC
[00019f74] 4a43                      tst.w      d3
[00019f76] 670a                      beq.s      $00019F82
[00019f78] 41eb 0087                 lea.l      135(a3),a0
[00019f7c] 4eb9 0001 8374            jsr        save_string
[00019f82] 0c55 00ff                 cmpi.w     #$00FF,(a5)
[00019f86] 6712                      beq.s      $00019F9A
[00019f88] 3f15                      move.w     (a5),-(a7)
[00019f8a] 43eb 008b                 lea.l      139(a3),a1
[00019f8e] 204c                      movea.l    a4,a0
[00019f90] 4eb9 0008 15ac            jsr        sprintf
[00019f96] 544f                      addq.w     #2,a7
[00019f98] 6016                      bra.s      $00019FB0
[00019f9a] 206d 0002                 movea.l    2(a5),a0
[00019f9e] 4868 0016                 pea.l      22(a0)
[00019fa2] 43eb 009a                 lea.l      154(a3),a1
[00019fa6] 204c                      movea.l    a4,a0
[00019fa8] 4eb9 0008 15ac            jsr        sprintf
[00019fae] 584f                      addq.w     #4,a7
[00019fb0] 204c                      movea.l    a4,a0
[00019fb2] 4eb9 0001 8374            jsr        save_string
[00019fb8] 5c4d                      addq.w     #6,a5
[00019fba] 5243                      addq.w     #1,d3
[00019fbc] b67c 0020                 cmp.w      #$0020,d3
[00019fc0] 6db2                      blt.s      $00019F74
[00019fc2] 41eb 00a8                 lea.l      168(a3),a0
[00019fc6] 4eb9 0001 8374            jsr        save_string
[00019fcc] 4243                      clr.w      d3
[00019fce] 6000 008e                 bra        $0001A05E
[00019fd2] 3f03                      move.w     d3,-(a7)
[00019fd4] 43eb 00b1                 lea.l      177(a3),a1
[00019fd8] 41ef 0002                 lea.l      2(a7),a0
[00019fdc] 4eb9 0008 15ac            jsr        sprintf
[00019fe2] 544f                      addq.w     #2,a7
[00019fe4] 43d7                      lea.l      (a7),a1
[00019fe6] 206a 0034                 movea.l    52(a2),a0
[00019fea] 4eb9 0003 337c            jsr        find_entry
[00019ff0] 2c48                      movea.l    a0,a6
[00019ff2] 200e                      move.l     a6,d0
[00019ff4] 6632                      bne.s      $0001A028
[00019ff6] 43d7                      lea.l      (a7),a1
[00019ff8] 206a 0024                 movea.l    36(a2),a0
[00019ffc] 4eb9 0003 337c            jsr        find_entry
[0001a002] 2c48                      movea.l    a0,a6
[0001a004] 200e                      move.l     a6,d0
[0001a006] 6620                      bne.s      $0001A028
[0001a008] 3003                      move.w     d3,d0
[0001a00a] 48c0                      ext.l      d0
[0001a00c] e588                      lsl.l      #2,d0
[0001a00e] 43f9 0008 af02            lea.l      mlmess,a1
[0001a014] 2f31 0800                 move.l     0(a1,d0.l),-(a7)
[0001a018] 43eb 00bb                 lea.l      187(a3),a1
[0001a01c] 204c                      movea.l    a4,a0
[0001a01e] 4eb9 0008 15ac            jsr        sprintf
[0001a024] 584f                      addq.w     #4,a7
[0001a026] 6012                      bra.s      $0001A03A
[0001a028] 2f2e 0004                 move.l     4(a6),-(a7)
[0001a02c] 43eb 00bb                 lea.l      187(a3),a1
[0001a030] 204c                      movea.l    a4,a0
[0001a032] 4eb9 0008 15ac            jsr        sprintf
[0001a038] 584f                      addq.w     #4,a7
[0001a03a] 204c                      movea.l    a4,a0
[0001a03c] 4eb9 0001 8374            jsr        save_string
[0001a042] b67c 0021                 cmp.w      #$0021,d3
[0001a046] 6c0a                      bge.s      $0001A052
[0001a048] 41eb 00c2                 lea.l      194(a3),a0
[0001a04c] 4eb9 0001 8374            jsr        save_string
[0001a052] 41eb 0032                 lea.l      50(a3),a0
[0001a056] 4eb9 0001 8374            jsr        save_string
[0001a05c] 5243                      addq.w     #1,d3
[0001a05e] b67c 0022                 cmp.w      #$0022,d3
[0001a062] 6d00 ff6e                 blt        $00019FD2
[0001a066] 41eb 00c4                 lea.l      196(a3),a0
[0001a06a] 4eb9 0001 8374            jsr        save_string
[0001a070] 41eb 00ca                 lea.l      202(a3),a0
[0001a074] 4eb9 0001 8374            jsr        save_string
[0001a07a] 41eb 00e3                 lea.l      227(a3),a0
[0001a07e] 4eb9 0001 8374            jsr        save_string
[0001a084] 41eb 00ec                 lea.l      236(a3),a0
[0001a088] 4eb9 0001 8374            jsr        save_string
[0001a08e] 224b                      movea.l    a3,a1
[0001a090] 206a 0214                 movea.l    532(a2),a0
[0001a094] 6100 fd86                 bsr        out_label
[0001a098] 41eb 00ef                 lea.l      239(a3),a0
[0001a09c] 4eb9 0001 8374            jsr        save_string
[0001a0a2] 43eb 00f4                 lea.l      244(a3),a1
[0001a0a6] 206a 0218                 movea.l    536(a2),a0
[0001a0aa] 6100 fd70                 bsr        out_label
[0001a0ae] 41eb 00f7                 lea.l      247(a3),a0
[0001a0b2] 4eb9 0001 8374            jsr        save_string
[0001a0b8] 43eb 0079                 lea.l      121(a3),a1
[0001a0bc] 206a 021c                 movea.l    540(a2),a0
[0001a0c0] 6100 fd5a                 bsr        out_label
[0001a0c4] 41eb 0076                 lea.l      118(a3),a0
[0001a0c8] 4eb9 0001 8374            jsr        save_string
[0001a0ce] 302a 0220                 move.w     544(a2),d0
[0001a0d2] 6706                      beq.s      $0001A0DA
[0001a0d4] 41eb 00fb                 lea.l      251(a3),a0
[0001a0d8] 6004                      bra.s      $0001A0DE
[0001a0da] 41eb 0102                 lea.l      258(a3),a0
[0001a0de] 4eb9 0001 8374            jsr        save_string
[0001a0e4] 302a 0222                 move.w     546(a2),d0
[0001a0e8] 6706                      beq.s      $0001A0F0
[0001a0ea] 41eb 00fb                 lea.l      251(a3),a0
[0001a0ee] 6004                      bra.s      $0001A0F4
[0001a0f0] 41eb 0102                 lea.l      258(a3),a0
[0001a0f4] 4eb9 0001 8374            jsr        save_string
[0001a0fa] 0c6a 0004 0224            cmpi.w     #$0004,548(a2)
[0001a100] 6f14                      ble.s      $0001A116
[0001a102] 3f2a 0224                 move.w     548(a2),-(a7)
[0001a106] 43eb 010a                 lea.l      266(a3),a1
[0001a10a] 204c                      movea.l    a4,a0
[0001a10c] 4eb9 0008 15ac            jsr        sprintf
[0001a112] 544f                      addq.w     #2,a7
[0001a114] 600c                      bra.s      $0001A122
[0001a116] 43eb 0113                 lea.l      275(a3),a1
[0001a11a] 204c                      movea.l    a4,a0
[0001a11c] 4eb9 0008 2f0c            jsr        strcpy
[0001a122] 204c                      movea.l    a4,a0
[0001a124] 4eb9 0001 8374            jsr        save_string
[0001a12a] 41eb 00c0                 lea.l      192(a3),a0
[0001a12e] 4eb9 0001 8374            jsr        save_string
[0001a134] 43eb 006d                 lea.l      109(a3),a1
[0001a138] 206a 0226                 movea.l    550(a2),a0
[0001a13c] 6100 fcde                 bsr        out_label
[0001a140] 41eb 005d                 lea.l      93(a3),a0
[0001a144] 4eb9 0001 8374            jsr        save_string
[0001a14a] 43eb 0079                 lea.l      121(a3),a1
[0001a14e] 206a 022a                 movea.l    554(a2),a0
[0001a152] 6100 fcc8                 bsr        out_label
[0001a156] 41eb 0076                 lea.l      118(a3),a0
[0001a15a] 4eb9 0001 8374            jsr        save_string
[0001a160] 43eb 0079                 lea.l      121(a3),a1
[0001a164] 206a 022e                 movea.l    558(a2),a0
[0001a168] 6100 fcb2                 bsr        out_label
[0001a16c] 41eb 0076                 lea.l      118(a3),a0
[0001a170] 4eb9 0001 8374            jsr        save_string
[0001a176] 43eb 0079                 lea.l      121(a3),a1
[0001a17a] 206a 0232                 movea.l    562(a2),a0
[0001a17e] 6100 fc9c                 bsr        out_label
[0001a182] 41eb 0076                 lea.l      118(a3),a0
[0001a186] 4eb9 0001 8374            jsr        save_string
[0001a18c] 43eb 0079                 lea.l      121(a3),a1
[0001a190] 206a 0236                 movea.l    566(a2),a0
[0001a194] 6100 fc86                 bsr        out_label
[0001a198] 41eb 0076                 lea.l      118(a3),a0
[0001a19c] 4eb9 0001 8374            jsr        save_string
[0001a1a2] 43eb 0079                 lea.l      121(a3),a1
[0001a1a6] 206a 023a                 movea.l    570(a2),a0
[0001a1aa] 6100 fc70                 bsr        out_label
[0001a1ae] 41eb 011b                 lea.l      283(a3),a0
[0001a1b2] 4eb9 0001 8374            jsr        save_string
[0001a1b8] 43eb 0079                 lea.l      121(a3),a1
[0001a1bc] 206a 023e                 movea.l    574(a2),a0
[0001a1c0] 6100 fc5a                 bsr        out_label
[0001a1c4] 41eb 0076                 lea.l      118(a3),a0
[0001a1c8] 4eb9 0001 8374            jsr        save_string
[0001a1ce] 43eb 0079                 lea.l      121(a3),a1
[0001a1d2] 206a 0242                 movea.l    578(a2),a0
[0001a1d6] 6100 fc44                 bsr        out_label
[0001a1da] 41eb 0076                 lea.l      118(a3),a0
[0001a1de] 4eb9 0001 8374            jsr        save_string
[0001a1e4] 43eb 0079                 lea.l      121(a3),a1
[0001a1e8] 206a 0246                 movea.l    582(a2),a0
[0001a1ec] 6100 fc2e                 bsr        out_label
[0001a1f0] 41eb 0076                 lea.l      118(a3),a0
[0001a1f4] 4eb9 0001 8374            jsr        save_string
[0001a1fa] 43eb 0079                 lea.l      121(a3),a1
[0001a1fe] 206a 024a                 movea.l    586(a2),a0
[0001a202] 6100 fc18                 bsr        out_label
[0001a206] 41eb 0076                 lea.l      118(a3),a0
[0001a20a] 4eb9 0001 8374            jsr        save_string
[0001a210] 43eb 0079                 lea.l      121(a3),a1
[0001a214] 206a 024e                 movea.l    590(a2),a0
[0001a218] 6100 fc02                 bsr        out_label
[0001a21c] 41eb 0076                 lea.l      118(a3),a0
[0001a220] 4eb9 0001 8374            jsr        save_string
[0001a226] 3f2a 0252                 move.w     594(a2),-(a7)
[0001a22a] 43eb 0122                 lea.l      290(a3),a1
[0001a22e] 204c                      movea.l    a4,a0
[0001a230] 4eb9 0008 15ac            jsr        sprintf
[0001a236] 544f                      addq.w     #2,a7
[0001a238] 204c                      movea.l    a4,a0
[0001a23a] 4eb9 0001 8374            jsr        save_string
[0001a240] 302a 0254                 move.w     596(a2),d0
[0001a244] 6f20                      ble.s      $0001A266
[0001a246] 3200                      move.w     d0,d1
[0001a248] d241                      add.w      d1,d1
[0001a24a] d240                      add.w      d0,d1
[0001a24c] 41f9 000a 599e            lea.l      xacc_types,a0
[0001a252] 4870 1000                 pea.l      0(a0,d1.w)
[0001a256] 43eb 0127                 lea.l      295(a3),a1
[0001a25a] 204c                      movea.l    a4,a0
[0001a25c] 4eb9 0008 15ac            jsr        sprintf
[0001a262] 584f                      addq.w     #4,a7
[0001a264] 600c                      bra.s      $0001A272
[0001a266] 43eb 012e                 lea.l      302(a3),a1
[0001a26a] 204c                      movea.l    a4,a0
[0001a26c] 4eb9 0008 2f0c            jsr        strcpy
[0001a272] 204c                      movea.l    a4,a0
[0001a274] 4eb9 0001 8374            jsr        save_string
[0001a27a] 43eb 0079                 lea.l      121(a3),a1
[0001a27e] 206a 0256                 movea.l    598(a2),a0
[0001a282] 6100 fb98                 bsr        out_label
[0001a286] 41eb 0076                 lea.l      118(a3),a0
[0001a28a] 4eb9 0001 8374            jsr        save_string
[0001a290] 43eb 0079                 lea.l      121(a3),a1
[0001a294] 206a 025a                 movea.l    602(a2),a0
[0001a298] 6100 fb82                 bsr        out_label
[0001a29c] 41eb 0076                 lea.l      118(a3),a0
[0001a2a0] 4eb9 0001 8374            jsr        save_string
[0001a2a6] 43eb 0132                 lea.l      306(a3),a1
[0001a2aa] 206a 025e                 movea.l    606(a2),a0
[0001a2ae] 6100 fb6c                 bsr        out_label
[0001a2b2] 41eb 013a                 lea.l      314(a3),a0
[0001a2b6] 4eb9 0001 8374            jsr        save_string
[0001a2bc] 4fef 0024                 lea.l      36(a7),a7
[0001a2c0] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[0001a2c4] 4e75                      rts
out_cicon:
[0001a2c6] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0001a2ca] 2648                      movea.l    a0,a3
[0001a2cc] 2449                      movea.l    a1,a2
[0001a2ce] 3600                      move.w     d0,d3
[0001a2d0] 49f9 000a 59c8            lea.l      $000A59C8,a4
[0001a2d6] 4bf9 0010 7f66            lea.l      iostring,a5
[0001a2dc] 3f12                      move.w     (a2),-(a7)
[0001a2de] 2f0b                      move.l     a3,-(a7)
[0001a2e0] 3f12                      move.w     (a2),-(a7)
[0001a2e2] 43ec 0142                 lea.l      322(a4),a1
[0001a2e6] 204d                      movea.l    a5,a0
[0001a2e8] 4eb9 0008 15ac            jsr        sprintf
[0001a2ee] 504f                      addq.w     #8,a7
[0001a2f0] 204d                      movea.l    a5,a0
[0001a2f2] 4eb9 0001 8374            jsr        save_string
[0001a2f8] 43ec 0079                 lea.l      121(a4),a1
[0001a2fc] 206a 0002                 movea.l    2(a2),a0
[0001a300] 6100 fb96                 bsr        out_label3
[0001a304] 41ec 005e                 lea.l      94(a4),a0
[0001a308] 4eb9 0001 8374            jsr        save_string
[0001a30e] 43ec 0079                 lea.l      121(a4),a1
[0001a312] 206a 0006                 movea.l    6(a2),a0
[0001a316] 6100 fb04                 bsr        out_label
[0001a31a] 41ec 005e                 lea.l      94(a4),a0
[0001a31e] 4eb9 0001 8374            jsr        save_string
[0001a324] 43ec 0079                 lea.l      121(a4),a1
[0001a328] 206a 000a                 movea.l    10(a2),a0
[0001a32c] 6100 fb6a                 bsr        out_label3
[0001a330] 41ec 005e                 lea.l      94(a4),a0
[0001a334] 4eb9 0001 8374            jsr        save_string
[0001a33a] 43ec 0079                 lea.l      121(a4),a1
[0001a33e] 206a 000e                 movea.l    14(a2),a0
[0001a342] 6100 fad8                 bsr        out_label
[0001a346] 4a43                      tst.w      d3
[0001a348] 671c                      beq.s      $0001A366
[0001a34a] 2f0b                      move.l     a3,-(a7)
[0001a34c] 3f03                      move.w     d3,-(a7)
[0001a34e] 43ec 0167                 lea.l      359(a4),a1
[0001a352] 204d                      movea.l    a5,a0
[0001a354] 4eb9 0008 15ac            jsr        sprintf
[0001a35a] 5c4f                      addq.w     #6,a7
[0001a35c] 204d                      movea.l    a5,a0
[0001a35e] 4eb9 0001 8374            jsr        save_string
[0001a364] 600a                      bra.s      $0001A370
[0001a366] 41ec 017a                 lea.l      378(a4),a0
[0001a36a] 4eb9 0001 8374            jsr        save_string
[0001a370] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0001a374] 4e75                      rts
out_icon:
[0001a376] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0001a37a] 514f                      subq.w     #8,a7
[0001a37c] 2f48 0004                 move.l     a0,4(a7)
[0001a380] 2628 000e                 move.l     14(a0),d3
[0001a384] e48b                      lsr.l      #2,d3
[0001a386] 4a43                      tst.w      d3
[0001a388] 6f00 01fc                 ble        $0001A586
[0001a38c] 41e8 0016                 lea.l      22(a0),a0
[0001a390] 6100 f9e6                 bsr        info_list
[0001a394] 206f 0004                 movea.l    4(a7),a0
[0001a398] 2ea8 0004                 move.l     4(a0),(a7)
[0001a39c] 47f9 000a 59c8            lea.l      $000A59C8,a3
[0001a3a2] 41eb 0188                 lea.l      392(a3),a0
[0001a3a6] 4eb9 0001 8374            jsr        save_string
[0001a3ac] 4244                      clr.w      d4
[0001a3ae] 45f9 0010 7f66            lea.l      iostring,a2
[0001a3b4] 6000 01ca                 bra        $0001A580
[0001a3b8] 3004                      move.w     d4,d0
[0001a3ba] 48c0                      ext.l      d0
[0001a3bc] e588                      lsl.l      #2,d0
[0001a3be] 2057                      movea.l    (a7),a0
[0001a3c0] 2870 0800                 movea.l    0(a0,d0.l),a4
[0001a3c4] 41ec 0016                 lea.l      22(a4),a0
[0001a3c8] 6100 fa06                 bsr        info_obj
[0001a3cc] 2a6c 0004                 movea.l    4(a4),a5
[0001a3d0] 2c6c 0004                 movea.l    4(a4),a6
[0001a3d4] 4245                      clr.w      d5
[0001a3d6] 302e 003c                 move.w     60(a6),d0
[0001a3da] 6710                      beq.s      $0001A3EC
[0001a3dc] 43ee 003c                 lea.l      60(a6),a1
[0001a3e0] 41ec 0016                 lea.l      22(a4),a0
[0001a3e4] 3005                      move.w     d5,d0
[0001a3e6] 6100 fede                 bsr        out_cicon
[0001a3ea] 7a08                      moveq.l    #8,d5
[0001a3ec] 302e 0026                 move.w     38(a6),d0
[0001a3f0] 6710                      beq.s      $0001A402
[0001a3f2] 43ee 0026                 lea.l      38(a6),a1
[0001a3f6] 41ec 0016                 lea.l      22(a4),a0
[0001a3fa] 3005                      move.w     d5,d0
[0001a3fc] 6100 fec8                 bsr        out_cicon
[0001a400] 7a04                      moveq.l    #4,d5
[0001a402] 7c0f                      moveq.l    #15,d6
[0001a404] dc6d 0016                 add.w      22(a5),d6
[0001a408] e846                      asr.w      #4,d6
[0001a40a] cded 0018                 muls.w     24(a5),d6
[0001a40e] 5346                      subq.w     #1,d6
[0001a410] 2015                      move.l     (a5),d0
[0001a412] 4df5 0800                 lea.l      0(a5,d0.l),a6
[0001a416] 486c 0016                 pea.l      22(a4)
[0001a41a] 43eb 019e                 lea.l      414(a3),a1
[0001a41e] 204a                      movea.l    a2,a0
[0001a420] 4eb9 0008 15ac            jsr        sprintf
[0001a426] 584f                      addq.w     #4,a7
[0001a428] 204a                      movea.l    a2,a0
[0001a42a] 4eb9 0001 8374            jsr        save_string
[0001a430] 4247                      clr.w      d7
[0001a432] 602c                      bra.s      $0001A460
[0001a434] 3f1e                      move.w     (a6)+,-(a7)
[0001a436] 43eb 01bf                 lea.l      447(a3),a1
[0001a43a] 204a                      movea.l    a2,a0
[0001a43c] 4eb9 0008 15ac            jsr        sprintf
[0001a442] 544f                      addq.w     #2,a7
[0001a444] 204a                      movea.l    a2,a0
[0001a446] 4eb9 0001 8374            jsr        save_string
[0001a44c] 7007                      moveq.l    #7,d0
[0001a44e] c047                      and.w      d7,d0
[0001a450] 5f40                      subq.w     #7,d0
[0001a452] 660a                      bne.s      $0001A45E
[0001a454] 41eb 005f                 lea.l      95(a3),a0
[0001a458] 4eb9 0001 8374            jsr        save_string
[0001a45e] 5247                      addq.w     #1,d7
[0001a460] bc47                      cmp.w      d7,d6
[0001a462] 6ed0                      bgt.s      $0001A434
[0001a464] 486c 0016                 pea.l      22(a4)
[0001a468] 3f1e                      move.w     (a6)+,-(a7)
[0001a46a] 43eb 01c7                 lea.l      455(a3),a1
[0001a46e] 204a                      movea.l    a2,a0
[0001a470] 4eb9 0008 15ac            jsr        sprintf
[0001a476] 5c4f                      addq.w     #6,a7
[0001a478] 204a                      movea.l    a2,a0
[0001a47a] 4eb9 0001 8374            jsr        save_string
[0001a480] 4247                      clr.w      d7
[0001a482] 602c                      bra.s      $0001A4B0
[0001a484] 3f1e                      move.w     (a6)+,-(a7)
[0001a486] 43eb 01bf                 lea.l      447(a3),a1
[0001a48a] 204a                      movea.l    a2,a0
[0001a48c] 4eb9 0008 15ac            jsr        sprintf
[0001a492] 544f                      addq.w     #2,a7
[0001a494] 204a                      movea.l    a2,a0
[0001a496] 4eb9 0001 8374            jsr        save_string
[0001a49c] 7007                      moveq.l    #7,d0
[0001a49e] c047                      and.w      d7,d0
[0001a4a0] 5f40                      subq.w     #7,d0
[0001a4a2] 660a                      bne.s      $0001A4AE
[0001a4a4] 41eb 005f                 lea.l      95(a3),a0
[0001a4a8] 4eb9 0001 8374            jsr        save_string
[0001a4ae] 5247                      addq.w     #1,d7
[0001a4b0] bc47                      cmp.w      d7,d6
[0001a4b2] 6ed0                      bgt.s      $0001A484
[0001a4b4] 3f1e                      move.w     (a6)+,-(a7)
[0001a4b6] 43eb 01f1                 lea.l      497(a3),a1
[0001a4ba] 204a                      movea.l    a2,a0
[0001a4bc] 4eb9 0008 15ac            jsr        sprintf
[0001a4c2] 544f                      addq.w     #2,a7
[0001a4c4] 204a                      movea.l    a2,a0
[0001a4c6] 4eb9 0001 8374            jsr        save_string
[0001a4cc] 302c 0038                 move.w     56(a4),d0
[0001a4d0] c07c 0500                 and.w      #$0500,d0
[0001a4d4] b07c 0100                 cmp.w      #$0100,d0
[0001a4d8] 660c                      bne.s      $0001A4E6
[0001a4da] 41eb 01fb                 lea.l      507(a3),a0
[0001a4de] 4eb9 0001 8374            jsr        save_string
[0001a4e4] 600a                      bra.s      $0001A4F0
[0001a4e6] 41eb 0203                 lea.l      515(a3),a0
[0001a4ea] 4eb9 0001 8374            jsr        save_string
[0001a4f0] 3f2d 0020                 move.w     32(a5),-(a7)
[0001a4f4] 3f2d 001e                 move.w     30(a5),-(a7)
[0001a4f8] 3f2d 001c                 move.w     28(a5),-(a7)
[0001a4fc] 3f2d 001a                 move.w     26(a5),-(a7)
[0001a500] 3f2d 0018                 move.w     24(a5),-(a7)
[0001a504] 3f2d 0016                 move.w     22(a5),-(a7)
[0001a508] 3f2d 0014                 move.w     20(a5),-(a7)
[0001a50c] 3f2d 0012                 move.w     18(a5),-(a7)
[0001a510] 3f2d 0010                 move.w     16(a5),-(a7)
[0001a514] 3f2d 000e                 move.w     14(a5),-(a7)
[0001a518] 3f2d 000c                 move.w     12(a5),-(a7)
[0001a51c] 206d 0008                 movea.l    8(a5),a0
[0001a520] 4868 0016                 pea.l      22(a0)
[0001a524] 486c 0016                 pea.l      22(a4)
[0001a528] 486c 0016                 pea.l      22(a4)
[0001a52c] 486c 0016                 pea.l      22(a4)
[0001a530] 43eb 020b                 lea.l      523(a3),a1
[0001a534] 204a                      movea.l    a2,a0
[0001a536] 4eb9 0008 15ac            jsr        sprintf
[0001a53c] 4fef 0026                 lea.l      38(a7),a7
[0001a540] 204a                      movea.l    a2,a0
[0001a542] 4eb9 0001 8374            jsr        save_string
[0001a548] 4a45                      tst.w      d5
[0001a54a] 671e                      beq.s      $0001A56A
[0001a54c] 486c 0016                 pea.l      22(a4)
[0001a550] 3f05                      move.w     d5,-(a7)
[0001a552] 43eb 0275                 lea.l      629(a3),a1
[0001a556] 204a                      movea.l    a2,a0
[0001a558] 4eb9 0008 15ac            jsr        sprintf
[0001a55e] 5c4f                      addq.w     #6,a7
[0001a560] 204a                      movea.l    a2,a0
[0001a562] 4eb9 0001 8374            jsr        save_string
[0001a568] 600a                      bra.s      $0001A574
[0001a56a] 41eb 0079                 lea.l      121(a3),a0
[0001a56e] 4eb9 0001 8374            jsr        save_string
[0001a574] 41eb 027f                 lea.l      639(a3),a0
[0001a578] 4eb9 0001 8374            jsr        save_string
[0001a57e] 5244                      addq.w     #1,d4
[0001a580] b644                      cmp.w      d4,d3
[0001a582] 6e00 fe34                 bgt        $0001A3B8
[0001a586] 504f                      addq.w     #8,a7
[0001a588] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0001a58c] 4e75                      rts
out_mouse:
[0001a58e] 48e7 1c3e                 movem.l    d3-d5/a2-a6,-(a7)
[0001a592] 2448                      movea.l    a0,a2
[0001a594] 262a 000e                 move.l     14(a2),d3
[0001a598] e48b                      lsr.l      #2,d3
[0001a59a] 4a43                      tst.w      d3
[0001a59c] 6f00 0132                 ble        $0001A6D0
[0001a5a0] 41ea 0016                 lea.l      22(a2),a0
[0001a5a4] 6100 f7d2                 bsr        info_list
[0001a5a8] 246a 0004                 movea.l    4(a2),a2
[0001a5ac] 47f9 000a 59c8            lea.l      $000A59C8,a3
[0001a5b2] 41eb 0286                 lea.l      646(a3),a0
[0001a5b6] 4eb9 0001 8374            jsr        save_string
[0001a5bc] 4244                      clr.w      d4
[0001a5be] 4bf9 0010 7f66            lea.l      iostring,a5
[0001a5c4] 6000 0104                 bra        $0001A6CA
[0001a5c8] 3004                      move.w     d4,d0
[0001a5ca] 48c0                      ext.l      d0
[0001a5cc] e588                      lsl.l      #2,d0
[0001a5ce] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001a5d2] 41ec 0016                 lea.l      22(a4),a0
[0001a5d6] 6100 f7f8                 bsr        info_obj
[0001a5da] 2c6c 0004                 movea.l    4(a4),a6
[0001a5de] 302c 0038                 move.w     56(a4),d0
[0001a5e2] c07c 0500                 and.w      #$0500,d0
[0001a5e6] b07c 0100                 cmp.w      #$0100,d0
[0001a5ea] 660c                      bne.s      $0001A5F8
[0001a5ec] 41eb 01fb                 lea.l      507(a3),a0
[0001a5f0] 4eb9 0001 8374            jsr        save_string
[0001a5f6] 600a                      bra.s      $0001A602
[0001a5f8] 41eb 0203                 lea.l      515(a3),a0
[0001a5fc] 4eb9 0001 8374            jsr        save_string
[0001a602] 3f2e 0008                 move.w     8(a6),-(a7)
[0001a606] 3f2e 0006                 move.w     6(a6),-(a7)
[0001a60a] 3f2e 0004                 move.w     4(a6),-(a7)
[0001a60e] 3f2e 0002                 move.w     2(a6),-(a7)
[0001a612] 3f16                      move.w     (a6),-(a7)
[0001a614] 486c 0016                 pea.l      22(a4)
[0001a618] 43eb 02a1                 lea.l      673(a3),a1
[0001a61c] 204d                      movea.l    a5,a0
[0001a61e] 4eb9 0008 15ac            jsr        sprintf
[0001a624] 4fef 000e                 lea.l      14(a7),a7
[0001a628] 204d                      movea.l    a5,a0
[0001a62a] 4eb9 0001 8374            jsr        save_string
[0001a630] 4dee 000a                 lea.l      10(a6),a6
[0001a634] 7a0f                      moveq.l    #15,d5
[0001a636] 602a                      bra.s      $0001A662
[0001a638] 3f1e                      move.w     (a6)+,-(a7)
[0001a63a] 43eb 01bf                 lea.l      447(a3),a1
[0001a63e] 204d                      movea.l    a5,a0
[0001a640] 4eb9 0008 15ac            jsr        sprintf
[0001a646] 544f                      addq.w     #2,a7
[0001a648] 204d                      movea.l    a5,a0
[0001a64a] 4eb9 0001 8374            jsr        save_string
[0001a650] ba7c 0008                 cmp.w      #$0008,d5
[0001a654] 660a                      bne.s      $0001A660
[0001a656] 41eb 02d4                 lea.l      724(a3),a0
[0001a65a] 4eb9 0001 8374            jsr        save_string
[0001a660] 5345                      subq.w     #1,d5
[0001a662] 4a45                      tst.w      d5
[0001a664] 6ed2                      bgt.s      $0001A638
[0001a666] 3f1e                      move.w     (a6)+,-(a7)
[0001a668] 43eb 02db                 lea.l      731(a3),a1
[0001a66c] 204d                      movea.l    a5,a0
[0001a66e] 4eb9 0008 15ac            jsr        sprintf
[0001a674] 544f                      addq.w     #2,a7
[0001a676] 204d                      movea.l    a5,a0
[0001a678] 4eb9 0001 8374            jsr        save_string
[0001a67e] 7a0f                      moveq.l    #15,d5
[0001a680] 602a                      bra.s      $0001A6AC
[0001a682] 3f1e                      move.w     (a6)+,-(a7)
[0001a684] 43eb 01bf                 lea.l      447(a3),a1
[0001a688] 204d                      movea.l    a5,a0
[0001a68a] 4eb9 0008 15ac            jsr        sprintf
[0001a690] 544f                      addq.w     #2,a7
[0001a692] 204d                      movea.l    a5,a0
[0001a694] 4eb9 0001 8374            jsr        save_string
[0001a69a] ba7c 0008                 cmp.w      #$0008,d5
[0001a69e] 660a                      bne.s      $0001A6AA
[0001a6a0] 41eb 02d4                 lea.l      724(a3),a0
[0001a6a4] 4eb9 0001 8374            jsr        save_string
[0001a6aa] 5345                      subq.w     #1,d5
[0001a6ac] 4a45                      tst.w      d5
[0001a6ae] 6ed2                      bgt.s      $0001A682
[0001a6b0] 3f1e                      move.w     (a6)+,-(a7)
[0001a6b2] 43eb 02f4                 lea.l      756(a3),a1
[0001a6b6] 204d                      movea.l    a5,a0
[0001a6b8] 4eb9 0008 15ac            jsr        sprintf
[0001a6be] 544f                      addq.w     #2,a7
[0001a6c0] 204d                      movea.l    a5,a0
[0001a6c2] 4eb9 0001 8374            jsr        save_string
[0001a6c8] 5244                      addq.w     #1,d4
[0001a6ca] b644                      cmp.w      d4,d3
[0001a6cc] 6e00 fefa                 bgt        $0001A5C8
[0001a6d0] 4cdf 7c38                 movem.l    (a7)+,d3-d5/a2-a6
[0001a6d4] 4e75                      rts
out_image:
[0001a6d6] 48e7 1e3e                 movem.l    d3-d6/a2-a6,-(a7)
[0001a6da] 514f                      subq.w     #8,a7
[0001a6dc] 2f48 0004                 move.l     a0,4(a7)
[0001a6e0] 2628 000e                 move.l     14(a0),d3
[0001a6e4] e48b                      lsr.l      #2,d3
[0001a6e6] 4a43                      tst.w      d3
[0001a6e8] 6f00 011e                 ble        $0001A808
[0001a6ec] 41e8 0016                 lea.l      22(a0),a0
[0001a6f0] 6100 f686                 bsr        info_list
[0001a6f4] 206f 0004                 movea.l    4(a7),a0
[0001a6f8] 2ea8 0004                 move.l     4(a0),(a7)
[0001a6fc] 47f9 000a 59c8            lea.l      $000A59C8,a3
[0001a702] 41eb 030c                 lea.l      780(a3),a0
[0001a706] 4eb9 0001 8374            jsr        save_string
[0001a70c] 4244                      clr.w      d4
[0001a70e] 45f9 0010 7f66            lea.l      iostring,a2
[0001a714] 6000 00ec                 bra        $0001A802
[0001a718] 3004                      move.w     d4,d0
[0001a71a] 48c0                      ext.l      d0
[0001a71c] e588                      lsl.l      #2,d0
[0001a71e] 2057                      movea.l    (a7),a0
[0001a720] 2870 0800                 movea.l    0(a0,d0.l),a4
[0001a724] 41ec 0016                 lea.l      22(a4),a0
[0001a728] 6100 f6a6                 bsr        info_obj
[0001a72c] 2a6c 0004                 movea.l    4(a4),a5
[0001a730] 3a2d 0004                 move.w     4(a5),d5
[0001a734] e245                      asr.w      #1,d5
[0001a736] cbed 0006                 muls.w     6(a5),d5
[0001a73a] 5345                      subq.w     #1,d5
[0001a73c] 2015                      move.l     (a5),d0
[0001a73e] 4df5 0800                 lea.l      0(a5,d0.l),a6
[0001a742] 486c 0016                 pea.l      22(a4)
[0001a746] 43eb 0323                 lea.l      803(a3),a1
[0001a74a] 204a                      movea.l    a2,a0
[0001a74c] 4eb9 0008 15ac            jsr        sprintf
[0001a752] 584f                      addq.w     #4,a7
[0001a754] 204a                      movea.l    a2,a0
[0001a756] 4eb9 0001 8374            jsr        save_string
[0001a75c] 4246                      clr.w      d6
[0001a75e] 602c                      bra.s      $0001A78C
[0001a760] 3f1e                      move.w     (a6)+,-(a7)
[0001a762] 43eb 01bf                 lea.l      447(a3),a1
[0001a766] 204a                      movea.l    a2,a0
[0001a768] 4eb9 0008 15ac            jsr        sprintf
[0001a76e] 544f                      addq.w     #2,a7
[0001a770] 204a                      movea.l    a2,a0
[0001a772] 4eb9 0001 8374            jsr        save_string
[0001a778] 7007                      moveq.l    #7,d0
[0001a77a] c046                      and.w      d6,d0
[0001a77c] 5f40                      subq.w     #7,d0
[0001a77e] 660a                      bne.s      $0001A78A
[0001a780] 41eb 005f                 lea.l      95(a3),a0
[0001a784] 4eb9 0001 8374            jsr        save_string
[0001a78a] 5246                      addq.w     #1,d6
[0001a78c] ba46                      cmp.w      d6,d5
[0001a78e] 6ed0                      bgt.s      $0001A760
[0001a790] 3f1e                      move.w     (a6)+,-(a7)
[0001a792] 43eb 0346                 lea.l      838(a3),a1
[0001a796] 204a                      movea.l    a2,a0
[0001a798] 4eb9 0008 15ac            jsr        sprintf
[0001a79e] 544f                      addq.w     #2,a7
[0001a7a0] 204a                      movea.l    a2,a0
[0001a7a2] 4eb9 0001 8374            jsr        save_string
[0001a7a8] 302c 0038                 move.w     56(a4),d0
[0001a7ac] c07c 0500                 and.w      #$0500,d0
[0001a7b0] b07c 0100                 cmp.w      #$0100,d0
[0001a7b4] 660c                      bne.s      $0001A7C2
[0001a7b6] 41eb 01fb                 lea.l      507(a3),a0
[0001a7ba] 4eb9 0001 8374            jsr        save_string
[0001a7c0] 600a                      bra.s      $0001A7CC
[0001a7c2] 41eb 0203                 lea.l      515(a3),a0
[0001a7c6] 4eb9 0001 8374            jsr        save_string
[0001a7cc] 3f2d 000c                 move.w     12(a5),-(a7)
[0001a7d0] 3f2d 000a                 move.w     10(a5),-(a7)
[0001a7d4] 3f2d 0008                 move.w     8(a5),-(a7)
[0001a7d8] 3f2d 0006                 move.w     6(a5),-(a7)
[0001a7dc] 3f2d 0004                 move.w     4(a5),-(a7)
[0001a7e0] 486c 0016                 pea.l      22(a4)
[0001a7e4] 486c 0016                 pea.l      22(a4)
[0001a7e8] 43eb 0353                 lea.l      851(a3),a1
[0001a7ec] 204a                      movea.l    a2,a0
[0001a7ee] 4eb9 0008 15ac            jsr        sprintf
[0001a7f4] 4fef 0012                 lea.l      18(a7),a7
[0001a7f8] 204a                      movea.l    a2,a0
[0001a7fa] 4eb9 0001 8374            jsr        save_string
[0001a800] 5244                      addq.w     #1,d4
[0001a802] b644                      cmp.w      d4,d3
[0001a804] 6e00 ff12                 bgt        $0001A718
[0001a808] 504f                      addq.w     #8,a7
[0001a80a] 4cdf 7c78                 movem.l    (a7)+,d3-d6/a2-a6
[0001a80e] 4e75                      rts
out_obj:
[0001a810] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0001a814] 4fef ffc0                 lea.l      -64(a7),a7
[0001a818] 2f48 003c                 move.l     a0,60(a7)
[0001a81c] 2f49 0038                 move.l     a1,56(a7)
[0001a820] 45f9 0010 837e            lea.l      $0010837E,a2
[0001a826] 2628 000e                 move.l     14(a0),d3
[0001a82a] e48b                      lsr.l      #2,d3
[0001a82c] 4a43                      tst.w      d3
[0001a82e] 6f00 0390                 ble        $0001ABC0
[0001a832] 41e8 0016                 lea.l      22(a0),a0
[0001a836] 6100 f540                 bsr        info_list
[0001a83a] 206f 0038                 movea.l    56(a7),a0
[0001a83e] 4eb9 0001 8374            jsr        save_string
[0001a844] 33fc ffff 0010 837c       move.w     #$FFFF,mapX
[0001a84c] 206f 003c                 movea.l    60(a7),a0
[0001a850] 2f68 0004 0034            move.l     4(a0),52(a7)
[0001a856] 4244                      clr.w      d4
[0001a858] 4df9 000a 59c8            lea.l      $000A59C8,a6
[0001a85e] 47f9 0010 7f66            lea.l      iostring,a3
[0001a864] 49ef 0018                 lea.l      24(a7),a4
[0001a868] 6000 0350                 bra        $0001ABBA
[0001a86c] 3004                      move.w     d4,d0
[0001a86e] 48c0                      ext.l      d0
[0001a870] e588                      lsl.l      #2,d0
[0001a872] 206f 0034                 movea.l    52(a7),a0
[0001a876] 2f70 0800 0030            move.l     0(a0,d0.l),48(a7)
[0001a87c] 206f 0030                 movea.l    48(a7),a0
[0001a880] 41e8 0016                 lea.l      22(a0),a0
[0001a884] 6100 f54a                 bsr        info_obj
[0001a888] 206f 0030                 movea.l    48(a7),a0
[0001a88c] 2028 000e                 move.l     14(a0),d0
[0001a890] 7238                      moveq.l    #56,d1
[0001a892] 4eb9 0008 3c5a            jsr        _uldiv
[0001a898] 2a00                      move.l     d0,d5
[0001a89a] 206f 0030                 movea.l    48(a7),a0
[0001a89e] 2a68 0004                 movea.l    4(a0),a5
[0001a8a2] 4246                      clr.w      d6
[0001a8a4] 3486                      move.w     d6,(a2)
[0001a8a6] 4247                      clr.w      d7
[0001a8a8] 6000 0076                 bra.w      $0001A920
[0001a8ac] 206f 0030                 movea.l    48(a7),a0
[0001a8b0] 3028 0038                 move.w     56(a0),d0
[0001a8b4] c07c 0500                 and.w      #$0500,d0
[0001a8b8] b07c 0100                 cmp.w      #$0100,d0
[0001a8bc] 6722                      beq.s      $0001A8E0
[0001a8be] 2215                      move.l     (a5),d1
[0001a8c0] 671e                      beq.s      $0001A8E0
[0001a8c2] 3f06                      move.w     d6,-(a7)
[0001a8c4] 2241                      movea.l    d1,a1
[0001a8c6] 4869 0016                 pea.l      22(a1)
[0001a8ca] 43ee 038b                 lea.l      907(a6),a1
[0001a8ce] 204b                      movea.l    a3,a0
[0001a8d0] 4eb9 0008 15ac            jsr        sprintf
[0001a8d6] 5c4f                      addq.w     #6,a7
[0001a8d8] 204b                      movea.l    a3,a0
[0001a8da] 4eb9 0001 8374            jsr        save_string
[0001a8e0] 202d 0020                 move.l     32(a5),d0
[0001a8e4] 6628                      bne.s      $0001A90E
[0001a8e6] 222d 0024                 move.l     36(a5),d1
[0001a8ea] 6622                      bne.s      $0001A90E
[0001a8ec] 242d 002c                 move.l     44(a5),d2
[0001a8f0] 661c                      bne.s      $0001A90E
[0001a8f2] 202d 0030                 move.l     48(a5),d0
[0001a8f6] 6616                      bne.s      $0001A90E
[0001a8f8] 222d 0004                 move.l     4(a5),d1
[0001a8fc] 6610                      bne.s      $0001A90E
[0001a8fe] 342d 002a                 move.w     42(a5),d2
[0001a902] 660a                      bne.s      $0001A90E
[0001a904] 302d 0034                 move.w     52(a5),d0
[0001a908] 6604                      bne.s      $0001A90E
[0001a90a] 5246                      addq.w     #1,d6
[0001a90c] 6002                      bra.s      $0001A910
[0001a90e] 5446                      addq.w     #2,d6
[0001a910] 4bed 0038                 lea.l      56(a5),a5
[0001a914] 5247                      addq.w     #1,d7
[0001a916] 3007                      move.w     d7,d0
[0001a918] 48c0                      ext.l      d0
[0001a91a] d080                      add.l      d0,d0
[0001a91c] 3586 0800                 move.w     d6,0(a2,d0.l)
[0001a920] ba47                      cmp.w      d7,d5
[0001a922] 6e00 ff88                 bgt.w      $0001A8AC
[0001a926] 206f 0030                 movea.l    48(a7),a0
[0001a92a] 2a68 0004                 movea.l    4(a0),a5
[0001a92e] 4247                      clr.w      d7
[0001a930] 6000 0276                 bra        $0001ABA8
[0001a934] 7018                      moveq.l    #24,d0
[0001a936] 43ed 0008                 lea.l      8(a5),a1
[0001a93a] 204c                      movea.l    a4,a0
[0001a93c] 4eb9 0008 3500            jsr        memcpy
[0001a942] 7018                      moveq.l    #24,d0
[0001a944] 43ed 0020                 lea.l      32(a5),a1
[0001a948] 41d7                      lea.l      (a7),a0
[0001a94a] 4eb9 0008 3500            jsr        memcpy
[0001a950] 3014                      move.w     (a4),d0
[0001a952] 48c0                      ext.l      d0
[0001a954] d080                      add.l      d0,d0
[0001a956] 38b2 0800                 move.w     0(a2,d0.l),(a4)
[0001a95a] 302c 0002                 move.w     2(a4),d0
[0001a95e] 48c0                      ext.l      d0
[0001a960] d080                      add.l      d0,d0
[0001a962] 3972 0800 0002            move.w     0(a2,d0.l),2(a4)
[0001a968] 302c 0004                 move.w     4(a4),d0
[0001a96c] 48c0                      ext.l      d0
[0001a96e] d080                      add.l      d0,d0
[0001a970] 3972 0800 0004            move.w     0(a2,d0.l),4(a4)
[0001a976] 70ff                      moveq.l    #-1,d0
[0001a978] d045                      add.w      d5,d0
[0001a97a] be40                      cmp.w      d0,d7
[0001a97c] 6622                      bne.s      $0001A9A0
[0001a97e] 3207                      move.w     d7,d1
[0001a980] 48c1                      ext.l      d1
[0001a982] d281                      add.l      d1,d1
[0001a984] 3432 1802                 move.w     2(a2,d1.l),d2
[0001a988] 7c02                      moveq.l    #2,d6
[0001a98a] dc72 1800                 add.w      0(a2,d1.l),d6
[0001a98e] b446                      cmp.w      d6,d2
[0001a990] 6608                      bne.s      $0001A99A
[0001a992] 006f 0020 0008            ori.w      #$0020,8(a7)
[0001a998] 6006                      bra.s      $0001A9A0
[0001a99a] 006c 0020 0008            ori.w      #$0020,8(a4)
[0001a9a0] 4a47                      tst.w      d7
[0001a9a2] 6640                      bne.s      $0001A9E4
[0001a9a4] 206f 0030                 movea.l    48(a7),a0
[0001a9a8] 3028 0038                 move.w     56(a0),d0
[0001a9ac] c07c 0500                 and.w      #$0500,d0
[0001a9b0] b07c 0100                 cmp.w      #$0100,d0
[0001a9b4] 660c                      bne.s      $0001A9C2
[0001a9b6] 41ee 01fb                 lea.l      507(a6),a0
[0001a9ba] 4eb9 0001 8374            jsr        save_string
[0001a9c0] 600a                      bra.s      $0001A9CC
[0001a9c2] 41ee 0203                 lea.l      515(a6),a0
[0001a9c6] 4eb9 0001 8374            jsr        save_string
[0001a9cc] 206f 0030                 movea.l    48(a7),a0
[0001a9d0] 4868 0016                 pea.l      22(a0)
[0001a9d4] 43ee 03a1                 lea.l      929(a6),a1
[0001a9d8] 204b                      movea.l    a3,a0
[0001a9da] 4eb9 0008 15ac            jsr        sprintf
[0001a9e0] 584f                      addq.w     #4,a7
[0001a9e2] 6020                      bra.s      $0001AA04
[0001a9e4] 206f 0030                 movea.l    48(a7),a0
[0001a9e8] 4868 0016                 pea.l      22(a0)
[0001a9ec] 3007                      move.w     d7,d0
[0001a9ee] 48c0                      ext.l      d0
[0001a9f0] d080                      add.l      d0,d0
[0001a9f2] 3f32 0800                 move.w     0(a2,d0.l),-(a7)
[0001a9f6] 43ee 03b3                 lea.l      947(a6),a1
[0001a9fa] 204b                      movea.l    a3,a0
[0001a9fc] 4eb9 0008 15ac            jsr        sprintf
[0001aa02] 5c4f                      addq.w     #6,a7
[0001aa04] 204b                      movea.l    a3,a0
[0001aa06] 4eb9 0001 8374            jsr        save_string
[0001aa0c] 3f2c 000a                 move.w     10(a4),-(a7)
[0001aa10] 3f2c 0008                 move.w     8(a4),-(a7)
[0001aa14] 3f2c 0006                 move.w     6(a4),-(a7)
[0001aa18] 3f2c 0004                 move.w     4(a4),-(a7)
[0001aa1c] 3f2c 0002                 move.w     2(a4),-(a7)
[0001aa20] 3f14                      move.w     (a4),-(a7)
[0001aa22] 43ee 03ce                 lea.l      974(a6),a1
[0001aa26] 204b                      movea.l    a3,a0
[0001aa28] 4eb9 0008 15ac            jsr        sprintf
[0001aa2e] 4fef 000c                 lea.l      12(a7),a7
[0001aa32] 204b                      movea.l    a3,a0
[0001aa34] 4eb9 0001 8374            jsr        save_string
[0001aa3a] 0c2c 0014 0007            cmpi.b     #$14,7(a4)
[0001aa40] 6710                      beq.s      $0001AA52
[0001aa42] 0c2c 0019 0007            cmpi.b     #$19,7(a4)
[0001aa48] 6708                      beq.s      $0001AA52
[0001aa4a] 0c2c 001b 0007            cmpi.b     #$1B,7(a4)
[0001aa50] 6614                      bne.s      $0001AA66
[0001aa52] 2f2c 000c                 move.l     12(a4),-(a7)
[0001aa56] 43ee 03f4                 lea.l      1012(a6),a1
[0001aa5a] 204b                      movea.l    a3,a0
[0001aa5c] 4eb9 0008 15ac            jsr        sprintf
[0001aa62] 584f                      addq.w     #4,a7
[0001aa64] 6046                      bra.s      $0001AAAC
[0001aa66] 0c2c 0020 0007            cmpi.b     #$20,7(a4)
[0001aa6c] 6710                      beq.s      $0001AA7E
[0001aa6e] 0c2c 001c 0007            cmpi.b     #$1C,7(a4)
[0001aa74] 6708                      beq.s      $0001AA7E
[0001aa76] 0c2c 001a 0007            cmpi.b     #$1A,7(a4)
[0001aa7c] 6618                      bne.s      $0001AA96
[0001aa7e] 206c 000c                 movea.l    12(a4),a0
[0001aa82] 4868 0016                 pea.l      22(a0)
[0001aa86] 43ee 0402                 lea.l      1026(a6),a1
[0001aa8a] 204b                      movea.l    a3,a0
[0001aa8c] 4eb9 0008 15ac            jsr        sprintf
[0001aa92] 584f                      addq.w     #4,a7
[0001aa94] 6016                      bra.s      $0001AAAC
[0001aa96] 206c 000c                 movea.l    12(a4),a0
[0001aa9a] 4868 0016                 pea.l      22(a0)
[0001aa9e] 43ee 040f                 lea.l      1039(a6),a1
[0001aaa2] 204b                      movea.l    a3,a0
[0001aaa4] 4eb9 0008 15ac            jsr        sprintf
[0001aaaa] 584f                      addq.w     #4,a7
[0001aaac] 204b                      movea.l    a3,a0
[0001aaae] 4eb9 0001 8374            jsr        save_string
[0001aab4] 3f2c 0016                 move.w     22(a4),-(a7)
[0001aab8] 3f2c 0014                 move.w     20(a4),-(a7)
[0001aabc] 3f2c 0012                 move.w     18(a4),-(a7)
[0001aac0] 3f2c 0010                 move.w     16(a4),-(a7)
[0001aac4] 43ee 041d                 lea.l      1053(a6),a1
[0001aac8] 204b                      movea.l    a3,a0
[0001aaca] 4eb9 0008 15ac            jsr        sprintf
[0001aad0] 504f                      addq.w     #8,a7
[0001aad2] 204b                      movea.l    a3,a0
[0001aad4] 4eb9 0001 8374            jsr        save_string
[0001aada] 3007                      move.w     d7,d0
[0001aadc] 48c0                      ext.l      d0
[0001aade] d080                      add.l      d0,d0
[0001aae0] 3232 0802                 move.w     2(a2,d0.l),d1
[0001aae4] 7402                      moveq.l    #2,d2
[0001aae6] d472 0800                 add.w      0(a2,d0.l),d2
[0001aaea] b242                      cmp.w      d2,d1
[0001aaec] 6600 00b4                 bne        $0001ABA2
[0001aaf0] 206f 0030                 movea.l    48(a7),a0
[0001aaf4] 4868 0016                 pea.l      22(a0)
[0001aaf8] 3f32 0800                 move.w     0(a2,d0.l),-(a7)
[0001aafc] 43ee 0438                 lea.l      1080(a6),a1
[0001ab00] 204b                      movea.l    a3,a0
[0001ab02] 4eb9 0008 15ac            jsr        sprintf
[0001ab08] 5c4f                      addq.w     #6,a7
[0001ab0a] 204b                      movea.l    a3,a0
[0001ab0c] 4eb9 0001 8374            jsr        save_string
[0001ab12] 43ee 0457                 lea.l      1111(a6),a1
[0001ab16] 2057                      movea.l    (a7),a0
[0001ab18] 6100 f302                 bsr        out_label
[0001ab1c] 41ee 0076                 lea.l      118(a6),a0
[0001ab20] 4eb9 0001 8374            jsr        save_string
[0001ab26] 43ee 0457                 lea.l      1111(a6),a1
[0001ab2a] 206f 0004                 movea.l    4(a7),a0
[0001ab2e] 6100 f2ec                 bsr        out_label
[0001ab32] 3f2f 000a                 move.w     10(a7),-(a7)
[0001ab36] 3f2f 000a                 move.w     10(a7),-(a7)
[0001ab3a] 43ee 03e5                 lea.l      997(a6),a1
[0001ab3e] 204b                      movea.l    a3,a0
[0001ab40] 4eb9 0008 15ac            jsr        sprintf
[0001ab46] 584f                      addq.w     #4,a7
[0001ab48] 204b                      movea.l    a3,a0
[0001ab4a] 4eb9 0001 8374            jsr        save_string
[0001ab50] 43ee 045f                 lea.l      1119(a6),a1
[0001ab54] 206f 000c                 movea.l    12(a7),a0
[0001ab58] 6100 f2c2                 bsr        out_label
[0001ab5c] 41ee 0076                 lea.l      118(a6),a0
[0001ab60] 4eb9 0001 8374            jsr        save_string
[0001ab66] 43ee 045f                 lea.l      1119(a6),a1
[0001ab6a] 206f 0010                 movea.l    16(a7),a0
[0001ab6e] 6100 f2ac                 bsr        out_label
[0001ab72] 3f2f 0014                 move.w     20(a7),-(a7)
[0001ab76] 43ee 03eb                 lea.l      1003(a6),a1
[0001ab7a] 204b                      movea.l    a3,a0
[0001ab7c] 4eb9 0008 15ac            jsr        sprintf
[0001ab82] 544f                      addq.w     #2,a7
[0001ab84] 204b                      movea.l    a3,a0
[0001ab86] 4eb9 0001 8374            jsr        save_string
[0001ab8c] 43ee 0468                 lea.l      1128(a6),a1
[0001ab90] 206d 0004                 movea.l    4(a5),a0
[0001ab94] 6100 f286                 bsr        out_label
[0001ab98] 41ee 00c5                 lea.l      197(a6),a0
[0001ab9c] 4eb9 0001 8374            jsr        save_string
[0001aba2] 4bed 0038                 lea.l      56(a5),a5
[0001aba6] 5247                      addq.w     #1,d7
[0001aba8] ba47                      cmp.w      d7,d5
[0001abaa] 6e00 fd88                 bgt        $0001A934
[0001abae] 41ee 0032                 lea.l      50(a6),a0
[0001abb2] 4eb9 0001 8374            jsr        save_string
[0001abb8] 5244                      addq.w     #1,d4
[0001abba] b644                      cmp.w      d4,d3
[0001abbc] 6e00 fcae                 bgt        $0001A86C
[0001abc0] 4fef 0040                 lea.l      64(a7),a7
[0001abc4] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0001abc8] 4e75                      rts
out_data:
[0001abca] 48e7 1e3c                 movem.l    d3-d6/a2-a5,-(a7)
[0001abce] 2448                      movea.l    a0,a2
[0001abd0] 262a 000e                 move.l     14(a2),d3
[0001abd4] e48b                      lsr.l      #2,d3
[0001abd6] 4a43                      tst.w      d3
[0001abd8] 6f00 00e2                 ble        $0001ACBC
[0001abdc] 41ea 0016                 lea.l      22(a2),a0
[0001abe0] 6100 f196                 bsr        info_list
[0001abe4] 246a 0004                 movea.l    4(a2),a2
[0001abe8] 47f9 000a 59c8            lea.l      $000A59C8,a3
[0001abee] 41eb 046f                 lea.l      1135(a3),a0
[0001abf2] 4eb9 0001 8374            jsr        save_string
[0001abf8] 4244                      clr.w      d4
[0001abfa] 49f9 0010 7f66            lea.l      iostring,a4
[0001ac00] 6000 00b4                 bra        $0001ACB6
[0001ac04] 3004                      move.w     d4,d0
[0001ac06] 48c0                      ext.l      d0
[0001ac08] e588                      lsl.l      #2,d0
[0001ac0a] 2a72 0800                 movea.l    0(a2,d0.l),a5
[0001ac0e] 41ed 0016                 lea.l      22(a5),a0
[0001ac12] 6100 f1bc                 bsr        info_obj
[0001ac16] 7aff                      moveq.l    #-1,d5
[0001ac18] daad 000e                 add.l      14(a5),d5
[0001ac1c] e285                      asr.l      #1,d5
[0001ac1e] 4a85                      tst.l      d5
[0001ac20] 6f00 0092                 ble        $0001ACB4
[0001ac24] 302d 0038                 move.w     56(a5),d0
[0001ac28] c07c 0500                 and.w      #$0500,d0
[0001ac2c] b07c 0100                 cmp.w      #$0100,d0
[0001ac30] 660c                      bne.s      $0001AC3E
[0001ac32] 41eb 01fb                 lea.l      507(a3),a0
[0001ac36] 4eb9 0001 8374            jsr        save_string
[0001ac3c] 600a                      bra.s      $0001AC48
[0001ac3e] 41eb 0203                 lea.l      515(a3),a0
[0001ac42] 4eb9 0001 8374            jsr        save_string
[0001ac48] 486d 0016                 pea.l      22(a5)
[0001ac4c] 43eb 0485                 lea.l      1157(a3),a1
[0001ac50] 204c                      movea.l    a4,a0
[0001ac52] 4eb9 0008 15ac            jsr        sprintf
[0001ac58] 584f                      addq.w     #4,a7
[0001ac5a] 204c                      movea.l    a4,a0
[0001ac5c] 4eb9 0001 8374            jsr        save_string
[0001ac62] 2a6d 0004                 movea.l    4(a5),a5
[0001ac66] 7c00                      moveq.l    #0,d6
[0001ac68] 602e                      bra.s      $0001AC98
[0001ac6a] 3f1d                      move.w     (a5)+,-(a7)
[0001ac6c] 43eb 01bf                 lea.l      447(a3),a1
[0001ac70] 204c                      movea.l    a4,a0
[0001ac72] 4eb9 0008 15ac            jsr        sprintf
[0001ac78] 544f                      addq.w     #2,a7
[0001ac7a] 204c                      movea.l    a4,a0
[0001ac7c] 4eb9 0001 8374            jsr        save_string
[0001ac82] 7007                      moveq.l    #7,d0
[0001ac84] c086                      and.l      d6,d0
[0001ac86] 7207                      moveq.l    #7,d1
[0001ac88] b280                      cmp.l      d0,d1
[0001ac8a] 660a                      bne.s      $0001AC96
[0001ac8c] 41eb 0499                 lea.l      1177(a3),a0
[0001ac90] 4eb9 0001 8374            jsr        save_string
[0001ac96] 5286                      addq.l     #1,d6
[0001ac98] ba86                      cmp.l      d6,d5
[0001ac9a] 6ece                      bgt.s      $0001AC6A
[0001ac9c] 3f1d                      move.w     (a5)+,-(a7)
[0001ac9e] 43eb 049f                 lea.l      1183(a3),a1
[0001aca2] 204c                      movea.l    a4,a0
[0001aca4] 4eb9 0008 15ac            jsr        sprintf
[0001acaa] 544f                      addq.w     #2,a7
[0001acac] 204c                      movea.l    a4,a0
[0001acae] 4eb9 0001 8374            jsr        save_string
[0001acb4] 5244                      addq.w     #1,d4
[0001acb6] b644                      cmp.w      d4,d3
[0001acb8] 6e00 ff4a                 bgt        $0001AC04
[0001acbc] 4cdf 3c78                 movem.l    (a7)+,d3-d6/a2-a5
[0001acc0] 4e75                      rts
out_string:
[0001acc2] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[0001acc6] 594f                      subq.w     #4,a7
[0001acc8] 2448                      movea.l    a0,a2
[0001acca] 2649                      movea.l    a1,a3
[0001accc] 262a 000e                 move.l     14(a2),d3
[0001acd0] e48b                      lsr.l      #2,d3
[0001acd2] 4a43                      tst.w      d3
[0001acd4] 6f00 0192                 ble        $0001AE68
[0001acd8] 41ea 0016                 lea.l      22(a2),a0
[0001acdc] 6100 f09a                 bsr        info_list
[0001ace0] 246a 0004                 movea.l    4(a2),a2
[0001ace4] 204b                      movea.l    a3,a0
[0001ace6] 4eb9 0001 8374            jsr        save_string
[0001acec] 422f 0001                 clr.b      1(a7)
[0001acf0] 4244                      clr.w      d4
[0001acf2] 49f9 000a 59c8            lea.l      $000A59C8,a4
[0001acf8] 4bf9 0010 7f66            lea.l      iostring,a5
[0001acfe] 6000 0162                 bra        $0001AE62
[0001ad02] 3004                      move.w     d4,d0
[0001ad04] 48c0                      ext.l      d0
[0001ad06] e588                      lsl.l      #2,d0
[0001ad08] 2c72 0800                 movea.l    0(a2,d0.l),a6
[0001ad0c] 43ec 04ae                 lea.l      1198(a4),a1
[0001ad10] 41ee 0016                 lea.l      22(a6),a0
[0001ad14] 7004                      moveq.l    #4,d0
[0001ad16] 4eb9 0008 2fb8            jsr        strncmp
[0001ad1c] 4a40                      tst.w      d0
[0001ad1e] 6700 0140                 beq        $0001AE60
[0001ad22] 41ee 0016                 lea.l      22(a6),a0
[0001ad26] 6100 f0a8                 bsr        info_obj
[0001ad2a] 302e 0038                 move.w     56(a6),d0
[0001ad2e] c07c 0500                 and.w      #$0500,d0
[0001ad32] b07c 0100                 cmp.w      #$0100,d0
[0001ad36] 660c                      bne.s      $0001AD44
[0001ad38] 41ec 01fb                 lea.l      507(a4),a0
[0001ad3c] 4eb9 0001 8374            jsr        save_string
[0001ad42] 600a                      bra.s      $0001AD4E
[0001ad44] 41ec 0203                 lea.l      515(a4),a0
[0001ad48] 4eb9 0001 8374            jsr        save_string
[0001ad4e] 486e 0016                 pea.l      22(a6)
[0001ad52] 43ec 04b3                 lea.l      1203(a4),a1
[0001ad56] 204d                      movea.l    a5,a0
[0001ad58] 4eb9 0008 15ac            jsr        sprintf
[0001ad5e] 584f                      addq.w     #4,a7
[0001ad60] 204d                      movea.l    a5,a0
[0001ad62] 4eb9 0001 8374            jsr        save_string
[0001ad68] 2c6e 0004                 movea.l    4(a6),a6
[0001ad6c] 6000 00e2                 bra        $0001AE50
[0001ad70] 1016                      move.b     (a6),d0
[0001ad72] 4880                      ext.w      d0
[0001ad74] b07c 000b                 cmp.w      #$000B,d0
[0001ad78] 6762                      beq.s      $0001ADDC
[0001ad7a] 6e16                      bgt.s      $0001AD92
[0001ad7c] 5f40                      subq.w     #7,d0
[0001ad7e] 6700 0078                 beq.w      $0001ADF8
[0001ad82] 5340                      subq.w     #1,d0
[0001ad84] 6764                      beq.s      $0001ADEA
[0001ad86] 5340                      subq.w     #1,d0
[0001ad88] 6744                      beq.s      $0001ADCE
[0001ad8a] 5340                      subq.w     #1,d0
[0001ad8c] 6720                      beq.s      $0001ADAE
[0001ad8e] 6000 00a0                 bra        $0001AE30
[0001ad92] 907c 000c                 sub.w      #$000C,d0
[0001ad96] 676e                      beq.s      $0001AE06
[0001ad98] 5340                      subq.w     #1,d0
[0001ad9a] 6722                      beq.s      $0001ADBE
[0001ad9c] 907c 0015                 sub.w      #$0015,d0
[0001ada0] 6772                      beq.s      $0001AE14
[0001ada2] 907c 003a                 sub.w      #$003A,d0
[0001ada6] 6700 007a                 beq.w      $0001AE22
[0001adaa] 6000 0084                 bra        $0001AE30
[0001adae] 43ec 04c5                 lea.l      1221(a4),a1
[0001adb2] 41d7                      lea.l      (a7),a0
[0001adb4] 4eb9 0008 2f0c            jsr        strcpy
[0001adba] 6000 008a                 bra        $0001AE46
[0001adbe] 43ec 04c8                 lea.l      1224(a4),a1
[0001adc2] 41d7                      lea.l      (a7),a0
[0001adc4] 4eb9 0008 2f0c            jsr        strcpy
[0001adca] 6000 007a                 bra.w      $0001AE46
[0001adce] 43ec 04cb                 lea.l      1227(a4),a1
[0001add2] 41d7                      lea.l      (a7),a0
[0001add4] 4eb9 0008 2f0c            jsr        strcpy
[0001adda] 606a                      bra.s      $0001AE46
[0001addc] 43ec 04ce                 lea.l      1230(a4),a1
[0001ade0] 41d7                      lea.l      (a7),a0
[0001ade2] 4eb9 0008 2f0c            jsr        strcpy
[0001ade8] 605c                      bra.s      $0001AE46
[0001adea] 43ec 04d1                 lea.l      1233(a4),a1
[0001adee] 41d7                      lea.l      (a7),a0
[0001adf0] 4eb9 0008 2f0c            jsr        strcpy
[0001adf6] 604e                      bra.s      $0001AE46
[0001adf8] 43ec 04d4                 lea.l      1236(a4),a1
[0001adfc] 41d7                      lea.l      (a7),a0
[0001adfe] 4eb9 0008 2f0c            jsr        strcpy
[0001ae04] 6040                      bra.s      $0001AE46
[0001ae06] 43ec 04d7                 lea.l      1239(a4),a1
[0001ae0a] 41d7                      lea.l      (a7),a0
[0001ae0c] 4eb9 0008 2f0c            jsr        strcpy
[0001ae12] 6032                      bra.s      $0001AE46
[0001ae14] 43ec 04da                 lea.l      1242(a4),a1
[0001ae18] 41d7                      lea.l      (a7),a0
[0001ae1a] 4eb9 0008 2f0c            jsr        strcpy
[0001ae20] 6024                      bra.s      $0001AE46
[0001ae22] 43ec 04dd                 lea.l      1245(a4),a1
[0001ae26] 41d7                      lea.l      (a7),a0
[0001ae28] 4eb9 0008 2f0c            jsr        strcpy
[0001ae2e] 6016                      bra.s      $0001AE46
[0001ae30] 1016                      move.b     (a6),d0
[0001ae32] 4880                      ext.w      d0
[0001ae34] 3f00                      move.w     d0,-(a7)
[0001ae36] 43ec 04e0                 lea.l      1248(a4),a1
[0001ae3a] 41ef 0002                 lea.l      2(a7),a0
[0001ae3e] 4eb9 0008 15ac            jsr        sprintf
[0001ae44] 544f                      addq.w     #2,a7
[0001ae46] 41d7                      lea.l      (a7),a0
[0001ae48] 4eb9 0001 8374            jsr        save_string
[0001ae4e] 524e                      addq.w     #1,a6
[0001ae50] 1016                      move.b     (a6),d0
[0001ae52] 6600 ff1c                 bne        $0001AD70
[0001ae56] 41ec 04e3                 lea.l      1251(a4),a0
[0001ae5a] 4eb9 0001 8374            jsr        save_string
[0001ae60] 5244                      addq.w     #1,d4
[0001ae62] b644                      cmp.w      d4,d3
[0001ae64] 6e00 fe9c                 bgt        $0001AD02
[0001ae68] 584f                      addq.w     #4,a7
[0001ae6a] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[0001ae6e] 4e75                      rts
out_tedi:
[0001ae70] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0001ae74] 2448                      movea.l    a0,a2
[0001ae76] 262a 000e                 move.l     14(a2),d3
[0001ae7a] e48b                      lsr.l      #2,d3
[0001ae7c] 4a43                      tst.w      d3
[0001ae7e] 6f00 009a                 ble        $0001AF1A
[0001ae82] 41ea 0016                 lea.l      22(a2),a0
[0001ae86] 6100 eef0                 bsr        info_list
[0001ae8a] 246a 0004                 movea.l    4(a2),a2
[0001ae8e] 41f9 000a 5eb0            lea.l      $000A5EB0,a0
[0001ae94] 4eb9 0001 8374            jsr        save_string
[0001ae9a] 4244                      clr.w      d4
[0001ae9c] 4bf9 0010 7f66            lea.l      iostring,a5
[0001aea2] 6072                      bra.s      $0001AF16
[0001aea4] 3004                      move.w     d4,d0
[0001aea6] 48c0                      ext.l      d0
[0001aea8] e588                      lsl.l      #2,d0
[0001aeaa] 2672 0800                 movea.l    0(a2,d0.l),a3
[0001aeae] 41eb 0016                 lea.l      22(a3),a0
[0001aeb2] 6100 ef1c                 bsr        info_obj
[0001aeb6] 286b 0004                 movea.l    4(a3),a4
[0001aeba] 206c 0004                 movea.l    4(a4),a0
[0001aebe] 2f28 000e                 move.l     14(a0),-(a7)
[0001aec2] 2254                      movea.l    (a4),a1
[0001aec4] 2f29 000e                 move.l     14(a1),-(a7)
[0001aec8] 3f2c 0016                 move.w     22(a4),-(a7)
[0001aecc] 3f2c 0014                 move.w     20(a4),-(a7)
[0001aed0] 3f2c 0012                 move.w     18(a4),-(a7)
[0001aed4] 3f2c 0010                 move.w     16(a4),-(a7)
[0001aed8] 3f2c 000e                 move.w     14(a4),-(a7)
[0001aedc] 3f2c 000c                 move.w     12(a4),-(a7)
[0001aee0] 206c 0008                 movea.l    8(a4),a0
[0001aee4] 4868 0016                 pea.l      22(a0)
[0001aee8] 226c 0004                 movea.l    4(a4),a1
[0001aeec] 4869 0016                 pea.l      22(a1)
[0001aef0] 2054                      movea.l    (a4),a0
[0001aef2] 4868 0016                 pea.l      22(a0)
[0001aef6] 486b 0016                 pea.l      22(a3)
[0001aefa] 43f9 000a 5ec9            lea.l      $000A5EC9,a1
[0001af00] 204d                      movea.l    a5,a0
[0001af02] 4eb9 0008 15ac            jsr        sprintf
[0001af08] 4fef 0024                 lea.l      36(a7),a7
[0001af0c] 204d                      movea.l    a5,a0
[0001af0e] 4eb9 0001 8374            jsr        save_string
[0001af14] 5244                      addq.w     #1,d4
[0001af16] b644                      cmp.w      d4,d3
[0001af18] 6e8a                      bgt.s      $0001AEA4
[0001af1a] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0001af1e] 4e75                      rts
out_user:
[0001af20] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[0001af24] 2448                      movea.l    a0,a2
[0001af26] 262a 000e                 move.l     14(a2),d3
[0001af2a] e48b                      lsr.l      #2,d3
[0001af2c] 4a43                      tst.w      d3
[0001af2e] 6f00 0102                 ble        $0001B032
[0001af32] 41ea 0016                 lea.l      22(a2),a0
[0001af36] 6100 ee40                 bsr        info_list
[0001af3a] 246a 0004                 movea.l    4(a2),a2
[0001af3e] 47f9 000a 59c8            lea.l      $000A59C8,a3
[0001af44] 41eb 054b                 lea.l      1355(a3),a0
[0001af48] 4eb9 0001 8374            jsr        save_string
[0001af4e] 4244                      clr.w      d4
[0001af50] 4df9 0010 7f66            lea.l      iostring,a6
[0001af56] 6000 00d4                 bra        $0001B02C
[0001af5a] 3004                      move.w     d4,d0
[0001af5c] 48c0                      ext.l      d0
[0001af5e] e588                      lsl.l      #2,d0
[0001af60] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001af64] 41ec 0016                 lea.l      22(a4),a0
[0001af68] 6100 ee66                 bsr        info_obj
[0001af6c] 2a6c 0004                 movea.l    4(a4),a5
[0001af70] 2055                      movea.l    (a5),a0
[0001af72] 4868 0016                 pea.l      22(a0)
[0001af76] 486c 0016                 pea.l      22(a4)
[0001af7a] 43eb 0564                 lea.l      1380(a3),a1
[0001af7e] 204e                      movea.l    a6,a0
[0001af80] 4eb9 0008 15ac            jsr        sprintf
[0001af86] 504f                      addq.w     #8,a7
[0001af88] 204e                      movea.l    a6,a0
[0001af8a] 4eb9 0001 8374            jsr        save_string
[0001af90] 43eb 0582                 lea.l      1410(a3),a1
[0001af94] 206d 0004                 movea.l    4(a5),a0
[0001af98] 6100 ee82                 bsr        out_label
[0001af9c] 41eb 0076                 lea.l      118(a3),a0
[0001afa0] 4eb9 0001 8374            jsr        save_string
[0001afa6] 43eb 0079                 lea.l      121(a3),a1
[0001afaa] 206d 0008                 movea.l    8(a5),a0
[0001afae] 6100 ee6c                 bsr        out_label
[0001afb2] 41eb 0076                 lea.l      118(a3),a0
[0001afb6] 4eb9 0001 8374            jsr        save_string
[0001afbc] 43eb 0079                 lea.l      121(a3),a1
[0001afc0] 206d 000c                 movea.l    12(a5),a0
[0001afc4] 6100 ee56                 bsr        out_label
[0001afc8] 41eb 0076                 lea.l      118(a3),a0
[0001afcc] 4eb9 0001 8374            jsr        save_string
[0001afd2] 43eb 0079                 lea.l      121(a3),a1
[0001afd6] 206d 0010                 movea.l    16(a5),a0
[0001afda] 6100 ee40                 bsr        out_label
[0001afde] 41eb 0076                 lea.l      118(a3),a0
[0001afe2] 4eb9 0001 8374            jsr        save_string
[0001afe8] 43eb 0079                 lea.l      121(a3),a1
[0001afec] 206d 0014                 movea.l    20(a5),a0
[0001aff0] 6100 ee2a                 bsr        out_label
[0001aff4] 41eb 0076                 lea.l      118(a3),a0
[0001aff8] 4eb9 0001 8374            jsr        save_string
[0001affe] 43eb 0079                 lea.l      121(a3),a1
[0001b002] 206d 0018                 movea.l    24(a5),a0
[0001b006] 6100 ee14                 bsr        out_label
[0001b00a] 41eb 0076                 lea.l      118(a3),a0
[0001b00e] 4eb9 0001 8374            jsr        save_string
[0001b014] 43eb 0079                 lea.l      121(a3),a1
[0001b018] 206d 001c                 movea.l    28(a5),a0
[0001b01c] 6100 edfe                 bsr        out_label
[0001b020] 41eb 00c5                 lea.l      197(a3),a0
[0001b024] 4eb9 0001 8374            jsr        save_string
[0001b02a] 5244                      addq.w     #1,d4
[0001b02c] b644                      cmp.w      d4,d3
[0001b02e] 6e00 ff2a                 bgt        $0001AF5A
[0001b032] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[0001b036] 4e75                      rts
out_window:
[0001b038] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[0001b03c] 2448                      movea.l    a0,a2
[0001b03e] 262a 000e                 move.l     14(a2),d3
[0001b042] e48b                      lsr.l      #2,d3
[0001b044] 4a43                      tst.w      d3
[0001b046] 6f00 0320                 ble        $0001B368
[0001b04a] 41ea 0016                 lea.l      22(a2),a0
[0001b04e] 6100 ed28                 bsr        info_list
[0001b052] 246a 0004                 movea.l    4(a2),a2
[0001b056] 47f9 000a 59c8            lea.l      $000A59C8,a3
[0001b05c] 41eb 0585                 lea.l      1413(a3),a0
[0001b060] 4eb9 0001 8374            jsr        save_string
[0001b066] 4244                      clr.w      d4
[0001b068] 4df9 0010 7f66            lea.l      iostring,a6
[0001b06e] 6000 02f2                 bra        $0001B362
[0001b072] 3004                      move.w     d4,d0
[0001b074] 48c0                      ext.l      d0
[0001b076] e588                      lsl.l      #2,d0
[0001b078] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001b07c] 41ec 0016                 lea.l      22(a4),a0
[0001b080] 6100 ed4e                 bsr        info_obj
[0001b084] 2a6c 0004                 movea.l    4(a4),a5
[0001b088] 486c 0016                 pea.l      22(a4)
[0001b08c] 43eb 059d                 lea.l      1437(a3),a1
[0001b090] 204e                      movea.l    a6,a0
[0001b092] 4eb9 0008 15ac            jsr        sprintf
[0001b098] 584f                      addq.w     #4,a7
[0001b09a] 204e                      movea.l    a6,a0
[0001b09c] 4eb9 0001 8374            jsr        save_string
[0001b0a2] 43eb 0079                 lea.l      121(a3),a1
[0001b0a6] 2055                      movea.l    (a5),a0
[0001b0a8] 6100 ed72                 bsr        out_label
[0001b0ac] 41eb 005e                 lea.l      94(a3),a0
[0001b0b0] 4eb9 0001 8374            jsr        save_string
[0001b0b6] 43eb 05b5                 lea.l      1461(a3),a1
[0001b0ba] 206d 0004                 movea.l    4(a5),a0
[0001b0be] 6100 ed5c                 bsr        out_label
[0001b0c2] 41eb 005e                 lea.l      94(a3),a0
[0001b0c6] 4eb9 0001 8374            jsr        save_string
[0001b0cc] 43eb 05c1                 lea.l      1473(a3),a1
[0001b0d0] 206d 0008                 movea.l    8(a5),a0
[0001b0d4] 6100 ed46                 bsr        out_label
[0001b0d8] 41eb 005e                 lea.l      94(a3),a0
[0001b0dc] 4eb9 0001 8374            jsr        save_string
[0001b0e2] 43eb 05d0                 lea.l      1488(a3),a1
[0001b0e6] 206d 000c                 movea.l    12(a5),a0
[0001b0ea] 6100 ed30                 bsr        out_label
[0001b0ee] 41eb 005e                 lea.l      94(a3),a0
[0001b0f2] 4eb9 0001 8374            jsr        save_string
[0001b0f8] 43eb 05d9                 lea.l      1497(a3),a1
[0001b0fc] 206d 0010                 movea.l    16(a5),a0
[0001b100] 6100 ed1a                 bsr        out_label
[0001b104] 41eb 005e                 lea.l      94(a3),a0
[0001b108] 4eb9 0001 8374            jsr        save_string
[0001b10e] 43eb 0079                 lea.l      121(a3),a1
[0001b112] 206d 0014                 movea.l    20(a5),a0
[0001b116] 6100 ed42                 bsr        out_label2
[0001b11a] 41eb 0076                 lea.l      118(a3),a0
[0001b11e] 4eb9 0001 8374            jsr        save_string
[0001b124] 43eb 0079                 lea.l      121(a3),a1
[0001b128] 206d 0018                 movea.l    24(a5),a0
[0001b12c] 6100 ed2c                 bsr        out_label2
[0001b130] 41eb 05e2                 lea.l      1506(a3),a0
[0001b134] 4eb9 0001 8374            jsr        save_string
[0001b13a] 3f2d 002a                 move.w     42(a5),-(a7)
[0001b13e] 3f2d 0028                 move.w     40(a5),-(a7)
[0001b142] 3f2d 0026                 move.w     38(a5),-(a7)
[0001b146] 3f2d 0024                 move.w     36(a5),-(a7)
[0001b14a] 3f2d 0022                 move.w     34(a5),-(a7)
[0001b14e] 43eb 05f2                 lea.l      1522(a3),a1
[0001b152] 204e                      movea.l    a6,a0
[0001b154] 4eb9 0008 15ac            jsr        sprintf
[0001b15a] 4fef 000a                 lea.l      10(a7),a7
[0001b15e] 204e                      movea.l    a6,a0
[0001b160] 4eb9 0001 8374            jsr        save_string
[0001b166] 41eb 0612                 lea.l      1554(a3),a0
[0001b16a] 4eb9 0001 8374            jsr        save_string
[0001b170] 3f2d 0048                 move.w     72(a5),-(a7)
[0001b174] 43eb 064a                 lea.l      1610(a3),a1
[0001b178] 204e                      movea.l    a6,a0
[0001b17a] 4eb9 0008 15ac            jsr        sprintf
[0001b180] 544f                      addq.w     #2,a7
[0001b182] 204e                      movea.l    a6,a0
[0001b184] 4eb9 0001 8374            jsr        save_string
[0001b18a] 43eb 0079                 lea.l      121(a3),a1
[0001b18e] 206d 004a                 movea.l    74(a5),a0
[0001b192] 6100 ec88                 bsr        out_label
[0001b196] 41eb 005e                 lea.l      94(a3),a0
[0001b19a] 4eb9 0001 8374            jsr        save_string
[0001b1a0] 43eb 0079                 lea.l      121(a3),a1
[0001b1a4] 206d 004e                 movea.l    78(a5),a0
[0001b1a8] 6100 ec72                 bsr        out_label
[0001b1ac] 41eb 005e                 lea.l      94(a3),a0
[0001b1b0] 4eb9 0001 8374            jsr        save_string
[0001b1b6] 3f2d 0054                 move.w     84(a5),-(a7)
[0001b1ba] 3f2d 0052                 move.w     82(a5),-(a7)
[0001b1be] 43eb 0654                 lea.l      1620(a3),a1
[0001b1c2] 204e                      movea.l    a6,a0
[0001b1c4] 4eb9 0008 15ac            jsr        sprintf
[0001b1ca] 584f                      addq.w     #4,a7
[0001b1cc] 204e                      movea.l    a6,a0
[0001b1ce] 4eb9 0001 8374            jsr        save_string
[0001b1d4] 43eb 0079                 lea.l      121(a3),a1
[0001b1d8] 206d 005a                 movea.l    90(a5),a0
[0001b1dc] 6100 ec7c                 bsr        out_label2
[0001b1e0] 41eb 005e                 lea.l      94(a3),a0
[0001b1e4] 4eb9 0001 8374            jsr        save_string
[0001b1ea] 43eb 0079                 lea.l      121(a3),a1
[0001b1ee] 206d 005e                 movea.l    94(a5),a0
[0001b1f2] 6100 ec66                 bsr        out_label2
[0001b1f6] 41eb 005e                 lea.l      94(a3),a0
[0001b1fa] 4eb9 0001 8374            jsr        save_string
[0001b200] 43eb 066a                 lea.l      1642(a3),a1
[0001b204] 206d 0062                 movea.l    98(a5),a0
[0001b208] 6100 ec12                 bsr        out_label
[0001b20c] 41eb 005e                 lea.l      94(a3),a0
[0001b210] 4eb9 0001 8374            jsr        save_string
[0001b216] 43eb 0673                 lea.l      1651(a3),a1
[0001b21a] 206d 0066                 movea.l    102(a5),a0
[0001b21e] 6100 ebfc                 bsr        out_label
[0001b222] 41eb 005e                 lea.l      94(a3),a0
[0001b226] 4eb9 0001 8374            jsr        save_string
[0001b22c] 43eb 0680                 lea.l      1664(a3),a1
[0001b230] 206d 006a                 movea.l    106(a5),a0
[0001b234] 6100 ebe6                 bsr        out_label
[0001b238] 41eb 005e                 lea.l      94(a3),a0
[0001b23c] 4eb9 0001 8374            jsr        save_string
[0001b242] 43eb 068b                 lea.l      1675(a3),a1
[0001b246] 206d 006e                 movea.l    110(a5),a0
[0001b24a] 6100 ebd0                 bsr        out_label
[0001b24e] 41eb 005e                 lea.l      94(a3),a0
[0001b252] 4eb9 0001 8374            jsr        save_string
[0001b258] 43eb 0696                 lea.l      1686(a3),a1
[0001b25c] 206d 0072                 movea.l    114(a5),a0
[0001b260] 6100 ebba                 bsr        out_label
[0001b264] 41eb 005e                 lea.l      94(a3),a0
[0001b268] 4eb9 0001 8374            jsr        save_string
[0001b26e] 43eb 06a1                 lea.l      1697(a3),a1
[0001b272] 206d 0076                 movea.l    118(a5),a0
[0001b276] 6100 eba4                 bsr        out_label
[0001b27a] 41eb 005e                 lea.l      94(a3),a0
[0001b27e] 4eb9 0001 8374            jsr        save_string
[0001b284] 43eb 06ac                 lea.l      1708(a3),a1
[0001b288] 206d 007a                 movea.l    122(a5),a0
[0001b28c] 6100 eb8e                 bsr        out_label
[0001b290] 41eb 005e                 lea.l      94(a3),a0
[0001b294] 4eb9 0001 8374            jsr        save_string
[0001b29a] 43eb 06b8                 lea.l      1720(a3),a1
[0001b29e] 206d 007e                 movea.l    126(a5),a0
[0001b2a2] 6100 eb78                 bsr        out_label
[0001b2a6] 41eb 005e                 lea.l      94(a3),a0
[0001b2aa] 4eb9 0001 8374            jsr        save_string
[0001b2b0] 43eb 06c2                 lea.l      1730(a3),a1
[0001b2b4] 206d 0082                 movea.l    130(a5),a0
[0001b2b8] 6100 eb62                 bsr        out_label
[0001b2bc] 41eb 005e                 lea.l      94(a3),a0
[0001b2c0] 4eb9 0001 8374            jsr        save_string
[0001b2c6] 43eb 06cc                 lea.l      1740(a3),a1
[0001b2ca] 206d 0086                 movea.l    134(a5),a0
[0001b2ce] 6100 eb4c                 bsr        out_label
[0001b2d2] 41eb 005e                 lea.l      94(a3),a0
[0001b2d6] 4eb9 0001 8374            jsr        save_string
[0001b2dc] 43eb 06d6                 lea.l      1750(a3),a1
[0001b2e0] 206d 008a                 movea.l    138(a5),a0
[0001b2e4] 6100 eb36                 bsr        out_label
[0001b2e8] 41eb 005e                 lea.l      94(a3),a0
[0001b2ec] 4eb9 0001 8374            jsr        save_string
[0001b2f2] 43eb 06e0                 lea.l      1760(a3),a1
[0001b2f6] 206d 008e                 movea.l    142(a5),a0
[0001b2fa] 6100 eb20                 bsr        out_label
[0001b2fe] 41eb 005e                 lea.l      94(a3),a0
[0001b302] 4eb9 0001 8374            jsr        save_string
[0001b308] 43eb 06ec                 lea.l      1772(a3),a1
[0001b30c] 206d 0092                 movea.l    146(a5),a0
[0001b310] 6100 eb0a                 bsr        out_label
[0001b314] 41eb 005e                 lea.l      94(a3),a0
[0001b318] 4eb9 0001 8374            jsr        save_string
[0001b31e] 43eb 06fa                 lea.l      1786(a3),a1
[0001b322] 206d 0096                 movea.l    150(a5),a0
[0001b326] 6100 eaf4                 bsr        out_label
[0001b32a] 41eb 005e                 lea.l      94(a3),a0
[0001b32e] 4eb9 0001 8374            jsr        save_string
[0001b334] 43eb 0079                 lea.l      121(a3),a1
[0001b338] 206d 009a                 movea.l    154(a5),a0
[0001b33c] 6100 eade                 bsr        out_label
[0001b340] 41eb 005e                 lea.l      94(a3),a0
[0001b344] 4eb9 0001 8374            jsr        save_string
[0001b34a] 43eb 0079                 lea.l      121(a3),a1
[0001b34e] 206d 009e                 movea.l    158(a5),a0
[0001b352] 6100 eac8                 bsr        out_label
[0001b356] 41eb 0708                 lea.l      1800(a3),a0
[0001b35a] 4eb9 0001 8374            jsr        save_string
[0001b360] 5244                      addq.w     #1,d4
[0001b362] b644                      cmp.w      d4,d3
[0001b364] 6e00 fd0c                 bgt        $0001B072
[0001b368] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[0001b36c] 4e75                      rts
out_refs:
[0001b36e] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[0001b372] 2068 003c                 movea.l    60(a0),a0
[0001b376] 2628 000e                 move.l     14(a0),d3
[0001b37a] e48b                      lsr.l      #2,d3
[0001b37c] 4a43                      tst.w      d3
[0001b37e] 6f00 0082                 ble        $0001B402
[0001b382] 2468 0004                 movea.l    4(a0),a2
[0001b386] 47f9 000a 59c8            lea.l      $000A59C8,a3
[0001b38c] 41eb 0714                 lea.l      1812(a3),a0
[0001b390] 4eb9 0001 8374            jsr        save_string
[0001b396] 4244                      clr.w      d4
[0001b398] 4bf9 0010 7f66            lea.l      iostring,a5
[0001b39e] 605e                      bra.s      $0001B3FE
[0001b3a0] 3004                      move.w     d4,d0
[0001b3a2] 48c0                      ext.l      d0
[0001b3a4] e588                      lsl.l      #2,d0
[0001b3a6] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001b3aa] 41ec 0016                 lea.l      22(a4),a0
[0001b3ae] 6100 ea20                 bsr        info_obj
[0001b3b2] 3a2c 0038                 move.w     56(a4),d5
[0001b3b6] 202c 000e                 move.l     14(a4),d0
[0001b3ba] 6f0c                      ble.s      $0001B3C8
[0001b3bc] 206c 0004                 movea.l    4(a4),a0
[0001b3c0] 4eb9 0001 8374            jsr        save_string
[0001b3c6] 602a                      bra.s      $0001B3F2
[0001b3c8] 3005                      move.w     d5,d0
[0001b3ca] c07c 00ff                 and.w      #$00FF,d0
[0001b3ce] 6722                      beq.s      $0001B3F2
[0001b3d0] 3205                      move.w     d5,d1
[0001b3d2] c27c 0200                 and.w      #$0200,d1
[0001b3d6] 661a                      bne.s      $0001B3F2
[0001b3d8] 486c 0016                 pea.l      22(a4)
[0001b3dc] 43eb 0734                 lea.l      1844(a3),a1
[0001b3e0] 204d                      movea.l    a5,a0
[0001b3e2] 4eb9 0008 15ac            jsr        sprintf
[0001b3e8] 584f                      addq.w     #4,a7
[0001b3ea] 204d                      movea.l    a5,a0
[0001b3ec] 4eb9 0001 8374            jsr        save_string
[0001b3f2] 41eb 0032                 lea.l      50(a3),a0
[0001b3f6] 4eb9 0001 8374            jsr        save_string
[0001b3fc] 5244                      addq.w     #1,d4
[0001b3fe] b644                      cmp.w      d4,d3
[0001b400] 6e9e                      bgt.s      $0001B3A0
[0001b402] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[0001b406] 4e75                      rts
out_declproto:
[0001b408] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[0001b40c] 2648                      movea.l    a0,a3
[0001b40e] 246b 003c                 movea.l    60(a3),a2
[0001b412] 262a 000e                 move.l     14(a2),d3
[0001b416] e48b                      lsr.l      #2,d3
[0001b418] 4a43                      tst.w      d3
[0001b41a] 6f00 028a                 ble        $0001B6A6
[0001b41e] 206b 003c                 movea.l    60(a3),a0
[0001b422] 41e8 0016                 lea.l      22(a0),a0
[0001b426] 6100 e950                 bsr        info_list
[0001b42a] 246a 0004                 movea.l    4(a2),a2
[0001b42e] 47f9 000a 59c8            lea.l      $000A59C8,a3
[0001b434] 41eb 0759                 lea.l      1881(a3),a0
[0001b438] 4eb9 0001 8374            jsr        save_string
[0001b43e] 4244                      clr.w      d4
[0001b440] 4bf9 0010 7f66            lea.l      iostring,a5
[0001b446] 6000 024e                 bra        $0001B696
[0001b44a] 3004                      move.w     d4,d0
[0001b44c] 48c0                      ext.l      d0
[0001b44e] e588                      lsl.l      #2,d0
[0001b450] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001b454] 3a2c 0038                 move.w     56(a4),d5
[0001b458] 3205                      move.w     d5,d1
[0001b45a] c27c 0700                 and.w      #$0700,d1
[0001b45e] 6708                      beq.s      $0001B468
[0001b460] b27c 0500                 cmp.w      #$0500,d1
[0001b464] 6600 022e                 bne        $0001B694
[0001b468] 41ec 0016                 lea.l      22(a4),a0
[0001b46c] 6100 e962                 bsr        info_obj
[0001b470] 3005                      move.w     d5,d0
[0001b472] c07c 00ff                 and.w      #$00FF,d0
[0001b476] b07c 0025                 cmp.w      #$0025,d0
[0001b47a] 6200 01f6                 bhi        $0001B672
[0001b47e] d040                      add.w      d0,d0
[0001b480] 303b 0006                 move.w     $0001B488(pc,d0.w),d0
[0001b484] 4efb 0002                 jmp        $0001B488(pc,d0.w)
J5:
[0001b488] 0154                      dc.w $0154   ; $0001b5dc-$0001b488
[0001b48a] 004c                      dc.w $004c   ; $0001b4d4-$0001b488
[0001b48c] 004c                      dc.w $004c   ; $0001b4d4-$0001b488
[0001b48e] 0062                      dc.w $0062   ; $0001b4ea-$0001b488
[0001b490] 0078                      dc.w $0078   ; $0001b500-$0001b488
[0001b492] 01ea                      dc.w $01ea   ; $0001b672-$0001b488
[0001b494] 008e                      dc.w $008e   ; $0001b516-$0001b488
[0001b496] 00a4                      dc.w $00a4   ; $0001b52c-$0001b488
[0001b498] 008e                      dc.w $008e   ; $0001b516-$0001b488
[0001b49a] 00ba                      dc.w $00ba   ; $0001b542-$0001b488
[0001b49c] 00d0                      dc.w $00d0   ; $0001b558-$0001b488
[0001b49e] 00e6                      dc.w $00e6   ; $0001b56e-$0001b488
[0001b4a0] 00fc                      dc.w $00fc   ; $0001b584-$0001b488
[0001b4a2] 01ea                      dc.w $01ea   ; $0001b672-$0001b488
[0001b4a4] 00fc                      dc.w $00fc   ; $0001b584-$0001b488
[0001b4a6] 0112                      dc.w $0112   ; $0001b59a-$0001b488
[0001b4a8] 0128                      dc.w $0128   ; $0001b5b0-$0001b488
[0001b4aa] 0128                      dc.w $0128   ; $0001b5b0-$0001b488
[0001b4ac] 00e6                      dc.w $00e6   ; $0001b56e-$0001b488
[0001b4ae] 00e6                      dc.w $00e6   ; $0001b56e-$0001b488
[0001b4b0] 00fc                      dc.w $00fc   ; $0001b584-$0001b488
[0001b4b2] 013e                      dc.w $013e   ; $0001b5c6-$0001b488
[0001b4b4] 015a                      dc.w $015a   ; $0001b5e2-$0001b488
[0001b4b6] 008e                      dc.w $008e   ; $0001b516-$0001b488
[0001b4b8] 0170                      dc.w $0170   ; $0001b5f8-$0001b488
[0001b4ba] 0186                      dc.w $0186   ; $0001b60e-$0001b488
[0001b4bc] 0186                      dc.w $0186   ; $0001b60e-$0001b488
[0001b4be] 004c                      dc.w $004c   ; $0001b4d4-$0001b488
[0001b4c0] 004c                      dc.w $004c   ; $0001b4d4-$0001b488
[0001b4c2] 004c                      dc.w $004c   ; $0001b4d4-$0001b488
[0001b4c4] 019a                      dc.w $019a   ; $0001b622-$0001b488
[0001b4c6] 019a                      dc.w $019a   ; $0001b622-$0001b488
[0001b4c8] 004c                      dc.w $004c   ; $0001b4d4-$0001b488
[0001b4ca] 01c2                      dc.w $01c2   ; $0001b64a-$0001b488
[0001b4cc] 01ae                      dc.w $01ae   ; $0001b636-$0001b488
[0001b4ce] 004c                      dc.w $004c   ; $0001b4d4-$0001b488
[0001b4d0] 01c2                      dc.w $01c2   ; $0001b64a-$0001b488
[0001b4d2] 01d6                      dc.w $01d6   ; $0001b65e-$0001b488
[0001b4d4] 486c 0016                 pea.l      22(a4)
[0001b4d8] 43eb 077b                 lea.l      1915(a3),a1
[0001b4dc] 204d                      movea.l    a5,a0
[0001b4de] 4eb9 0008 15ac            jsr        sprintf
[0001b4e4] 584f                      addq.w     #4,a7
[0001b4e6] 6000 01a4                 bra        $0001B68C
[0001b4ea] 486c 0016                 pea.l      22(a4)
[0001b4ee] 43eb 0795                 lea.l      1941(a3),a1
[0001b4f2] 204d                      movea.l    a5,a0
[0001b4f4] 4eb9 0008 15ac            jsr        sprintf
[0001b4fa] 584f                      addq.w     #4,a7
[0001b4fc] 6000 018e                 bra        $0001B68C
[0001b500] 486c 0016                 pea.l      22(a4)
[0001b504] 43eb 07bd                 lea.l      1981(a3),a1
[0001b508] 204d                      movea.l    a5,a0
[0001b50a] 4eb9 0008 15ac            jsr        sprintf
[0001b510] 584f                      addq.w     #4,a7
[0001b512] 6000 0178                 bra        $0001B68C
[0001b516] 486c 0016                 pea.l      22(a4)
[0001b51a] 43eb 07fb                 lea.l      2043(a3),a1
[0001b51e] 204d                      movea.l    a5,a0
[0001b520] 4eb9 0008 15ac            jsr        sprintf
[0001b526] 584f                      addq.w     #4,a7
[0001b528] 6000 0162                 bra        $0001B68C
[0001b52c] 486c 0016                 pea.l      22(a4)
[0001b530] 43eb 081f                 lea.l      2079(a3),a1
[0001b534] 204d                      movea.l    a5,a0
[0001b536] 4eb9 0008 15ac            jsr        sprintf
[0001b53c] 584f                      addq.w     #4,a7
[0001b53e] 6000 014c                 bra        $0001B68C
[0001b542] 486c 0016                 pea.l      22(a4)
[0001b546] 43eb 0843                 lea.l      2115(a3),a1
[0001b54a] 204d                      movea.l    a5,a0
[0001b54c] 4eb9 0008 15ac            jsr        sprintf
[0001b552] 584f                      addq.w     #4,a7
[0001b554] 6000 0136                 bra        $0001B68C
[0001b558] 486c 0016                 pea.l      22(a4)
[0001b55c] 43eb 0880                 lea.l      2176(a3),a1
[0001b560] 204d                      movea.l    a5,a0
[0001b562] 4eb9 0008 15ac            jsr        sprintf
[0001b568] 584f                      addq.w     #4,a7
[0001b56a] 6000 0120                 bra        $0001B68C
[0001b56e] 486c 0016                 pea.l      22(a4)
[0001b572] 43eb 08bc                 lea.l      2236(a3),a1
[0001b576] 204d                      movea.l    a5,a0
[0001b578] 4eb9 0008 15ac            jsr        sprintf
[0001b57e] 584f                      addq.w     #4,a7
[0001b580] 6000 010a                 bra        $0001B68C
[0001b584] 486c 0016                 pea.l      22(a4)
[0001b588] 43eb 08ec                 lea.l      2284(a3),a1
[0001b58c] 204d                      movea.l    a5,a0
[0001b58e] 4eb9 0008 15ac            jsr        sprintf
[0001b594] 584f                      addq.w     #4,a7
[0001b596] 6000 00f4                 bra        $0001B68C
[0001b59a] 486c 0016                 pea.l      22(a4)
[0001b59e] 43eb 090f                 lea.l      2319(a3),a1
[0001b5a2] 204d                      movea.l    a5,a0
[0001b5a4] 4eb9 0008 15ac            jsr        sprintf
[0001b5aa] 584f                      addq.w     #4,a7
[0001b5ac] 6000 00de                 bra        $0001B68C
[0001b5b0] 486c 0016                 pea.l      22(a4)
[0001b5b4] 43eb 094b                 lea.l      2379(a3),a1
[0001b5b8] 204d                      movea.l    a5,a0
[0001b5ba] 4eb9 0008 15ac            jsr        sprintf
[0001b5c0] 584f                      addq.w     #4,a7
[0001b5c2] 6000 00c8                 bra        $0001B68C
[0001b5c6] 486c 0016                 pea.l      22(a4)
[0001b5ca] 43eb 0979                 lea.l      2425(a3),a1
[0001b5ce] 204d                      movea.l    a5,a0
[0001b5d0] 4eb9 0008 15ac            jsr        sprintf
[0001b5d6] 584f                      addq.w     #4,a7
[0001b5d8] 6000 00b2                 bra        $0001B68C
[0001b5dc] 4215                      clr.b      (a5)
[0001b5de] 6000 00ac                 bra        $0001B68C
[0001b5e2] 486c 0016                 pea.l      22(a4)
[0001b5e6] 43eb 09b7                 lea.l      2487(a3),a1
[0001b5ea] 204d                      movea.l    a5,a0
[0001b5ec] 4eb9 0008 15ac            jsr        sprintf
[0001b5f2] 584f                      addq.w     #4,a7
[0001b5f4] 6000 0096                 bra        $0001B68C
[0001b5f8] 486c 0016                 pea.l      22(a4)
[0001b5fc] 43eb 09e6                 lea.l      2534(a3),a1
[0001b600] 204d                      movea.l    a5,a0
[0001b602] 4eb9 0008 15ac            jsr        sprintf
[0001b608] 584f                      addq.w     #4,a7
[0001b60a] 6000 0080                 bra        $0001B68C
[0001b60e] 486c 0016                 pea.l      22(a4)
[0001b612] 43eb 0a38                 lea.l      2616(a3),a1
[0001b616] 204d                      movea.l    a5,a0
[0001b618] 4eb9 0008 15ac            jsr        sprintf
[0001b61e] 584f                      addq.w     #4,a7
[0001b620] 606a                      bra.s      $0001B68C
[0001b622] 486c 0016                 pea.l      22(a4)
[0001b626] 43eb 0a53                 lea.l      2643(a3),a1
[0001b62a] 204d                      movea.l    a5,a0
[0001b62c] 4eb9 0008 15ac            jsr        sprintf
[0001b632] 584f                      addq.w     #4,a7
[0001b634] 6056                      bra.s      $0001B68C
[0001b636] 486c 0016                 pea.l      22(a4)
[0001b63a] 43eb 0a78                 lea.l      2680(a3),a1
[0001b63e] 204d                      movea.l    a5,a0
[0001b640] 4eb9 0008 15ac            jsr        sprintf
[0001b646] 584f                      addq.w     #4,a7
[0001b648] 6042                      bra.s      $0001B68C
[0001b64a] 486c 0016                 pea.l      22(a4)
[0001b64e] 43eb 0aab                 lea.l      2731(a3),a1
[0001b652] 204d                      movea.l    a5,a0
[0001b654] 4eb9 0008 15ac            jsr        sprintf
[0001b65a] 584f                      addq.w     #4,a7
[0001b65c] 602e                      bra.s      $0001B68C
[0001b65e] 486c 0016                 pea.l      22(a4)
[0001b662] 43eb 0ada                 lea.l      2778(a3),a1
[0001b666] 204d                      movea.l    a5,a0
[0001b668] 4eb9 0008 15ac            jsr        sprintf
[0001b66e] 584f                      addq.w     #4,a7
[0001b670] 601a                      bra.s      $0001B68C
[0001b672] 3005                      move.w     d5,d0
[0001b674] c07c 00ff                 and.w      #$00FF,d0
[0001b678] 3f00                      move.w     d0,-(a7)
[0001b67a] 486c 0016                 pea.l      22(a4)
[0001b67e] 43eb 0b1c                 lea.l      2844(a3),a1
[0001b682] 204d                      movea.l    a5,a0
[0001b684] 4eb9 0008 15ac            jsr        sprintf
[0001b68a] 5c4f                      addq.w     #6,a7
[0001b68c] 204d                      movea.l    a5,a0
[0001b68e] 4eb9 0001 8374            jsr        save_string
[0001b694] 5244                      addq.w     #1,d4
[0001b696] b644                      cmp.w      d4,d3
[0001b698] 6e00 fdb0                 bgt        $0001B44A
[0001b69c] 41eb 0199                 lea.l      409(a3),a0
[0001b6a0] 4eb9 0001 8374            jsr        save_string
[0001b6a6] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[0001b6aa] 4e75                      rts
pc_output:
[0001b6ac] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0001b6b0] 4fef ff78                 lea.l      -136(a7),a7
[0001b6b4] 2448                      movea.l    a0,a2
[0001b6b6] 705c                      moveq.l    #92,d0
[0001b6b8] 206a 0008                 movea.l    8(a2),a0
[0001b6bc] 4eb9 0008 2e9e            jsr        strrchr
[0001b6c2] 5248                      addq.w     #1,a0
[0001b6c4] 2e88                      move.l     a0,(a7)
[0001b6c6] 49ef 0004                 lea.l      4(a7),a4
[0001b6ca] 226a 0008                 movea.l    8(a2),a1
[0001b6ce] 204c                      movea.l    a4,a0
[0001b6d0] 4eb9 0008 2f0c            jsr        strcpy
[0001b6d6] 702e                      moveq.l    #46,d0
[0001b6d8] 204c                      movea.l    a4,a0
[0001b6da] 4eb9 0008 2e9e            jsr        strrchr
[0001b6e0] 2648                      movea.l    a0,a3
[0001b6e2] 4bf9 000a 59c8            lea.l      $000A59C8,a5
[0001b6e8] 43ed 0b32                 lea.l      2866(a5),a1
[0001b6ec] 204b                      movea.l    a3,a0
[0001b6ee] 4eb9 0008 2f0c            jsr        strcpy
[0001b6f4] 4240                      clr.w      d0
[0001b6f6] 204c                      movea.l    a4,a0
[0001b6f8] 4eb9 0008 0c8e            jsr        Fcreate
[0001b6fe] 2600                      move.l     d0,d3
[0001b700] 4a43                      tst.w      d3
[0001b702] 6a14                      bpl.s      $0001B718
[0001b704] 2057                      movea.l    (a7),a0
[0001b706] 7009                      moveq.l    #9,d0
[0001b708] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001b70e] 2269 03d6                 movea.l    982(a1),a1
[0001b712] 4e91                      jsr        (a1)
[0001b714] 6000 013a                 bra        $0001B850
[0001b718] 204c                      movea.l    a4,a0
[0001b71a] 6100 e514                 bsr        info_start
[0001b71e] 41ed 0b36                 lea.l      2870(a5),a0
[0001b722] 6100 e5f0                 bsr        info_title
[0001b726] 3003                      move.w     d3,d0
[0001b728] 4eb9 0001 82bc            jsr        set_handle
[0001b72e] 4eb9 0008 108e            jsr        setjmp
[0001b734] 4a40                      tst.w      d0
[0001b736] 6714                      beq.s      $0001B74C
[0001b738] 91c8                      suba.l     a0,a0
[0001b73a] 700a                      moveq.l    #10,d0
[0001b73c] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001b742] 2269 03d6                 movea.l    982(a1),a1
[0001b746] 4e91                      jsr        (a1)
[0001b748] 6000 00fa                 bra        $0001B844
[0001b74c] 91c8                      suba.l     a0,a0
[0001b74e] 4eb9 0008 12ca            jsr        time
[0001b754] 2f40 0084                 move.l     d0,132(a7)
[0001b758] 47f9 0010 7f66            lea.l      iostring,a3
[0001b75e] 2f2a 0008                 move.l     8(a2),-(a7)
[0001b762] 41ef 0088                 lea.l      136(a7),a0
[0001b766] 4eb9 0008 124a            jsr        ctime
[0001b76c] 2f08                      move.l     a0,-(a7)
[0001b76e] 43f9 000a 4afe            lea.l      pc_welcome,a1
[0001b774] 204b                      movea.l    a3,a0
[0001b776] 4eb9 0008 15ac            jsr        sprintf
[0001b77c] 504f                      addq.w     #8,a7
[0001b77e] 204b                      movea.l    a3,a0
[0001b780] 4eb9 0001 8374            jsr        save_string
[0001b786] 41ed 0b42                 lea.l      2882(a5),a0
[0001b78a] 4eb9 0001 8374            jsr        save_string
[0001b790] 7001                      moveq.l    #1,d0
[0001b792] d06a 01f4                 add.w      500(a2),d0
[0001b796] 3f00                      move.w     d0,-(a7)
[0001b798] 43ed 0b5b                 lea.l      2907(a5),a1
[0001b79c] 204b                      movea.l    a3,a0
[0001b79e] 4eb9 0008 15ac            jsr        sprintf
[0001b7a4] 544f                      addq.w     #2,a7
[0001b7a6] 204b                      movea.l    a3,a0
[0001b7a8] 4eb9 0001 8374            jsr        save_string
[0001b7ae] 204a                      movea.l    a2,a0
[0001b7b0] 6100 fc56                 bsr        out_declproto
[0001b7b4] 43ed 0b70                 lea.l      2928(a5),a1
[0001b7b8] 206a 0024                 movea.l    36(a2),a0
[0001b7bc] 6100 f504                 bsr        out_string
[0001b7c0] 43ed 0b8c                 lea.l      2956(a5),a1
[0001b7c4] 206a 0034                 movea.l    52(a2),a0
[0001b7c8] 6100 f4f8                 bsr        out_string
[0001b7cc] 206a 0044                 movea.l    68(a2),a0
[0001b7d0] 6100 f3f8                 bsr        out_data
[0001b7d4] 206a 0028                 movea.l    40(a2),a0
[0001b7d8] 6100 f696                 bsr        out_tedi
[0001b7dc] 206a 0038                 movea.l    56(a2),a0
[0001b7e0] 6100 f73e                 bsr        out_user
[0001b7e4] 206a 002c                 movea.l    44(a2),a0
[0001b7e8] 6100 eb8c                 bsr        out_icon
[0001b7ec] 206a 0030                 movea.l    48(a2),a0
[0001b7f0] 6100 eee4                 bsr        out_image
[0001b7f4] 43ed 0ba4                 lea.l      2980(a5),a1
[0001b7f8] 206a 001c                 movea.l    28(a2),a0
[0001b7fc] 6100 f012                 bsr        out_obj
[0001b800] 43ed 0bbf                 lea.l      3007(a5),a1
[0001b804] 206a 0020                 movea.l    32(a2),a0
[0001b808] 6100 f006                 bsr        out_obj
[0001b80c] 43ed 0bdb                 lea.l      3035(a5),a1
[0001b810] 206a 0018                 movea.l    24(a2),a0
[0001b814] 6100 effa                 bsr        out_obj
[0001b818] 206a 0014                 movea.l    20(a2),a0
[0001b81c] 6100 f81a                 bsr        out_window
[0001b820] 206a 0040                 movea.l    64(a2),a0
[0001b824] 6100 ed68                 bsr        out_mouse
[0001b828] 204a                      movea.l    a2,a0
[0001b82a] 6100 e6aa                 bsr        out_acs
[0001b82e] 302a 0006                 move.w     6(a2),d0
[0001b832] c07c 2000                 and.w      #$2000,d0
[0001b836] 6706                      beq.s      $0001B83E
[0001b838] 204a                      movea.l    a2,a0
[0001b83a] 6100 fb32                 bsr        out_refs
[0001b83e] 4eb9 0001 8388            jsr        close_buf
[0001b844] 6100 e4ae                 bsr        info_end
[0001b848] 3003                      move.w     d3,d0
[0001b84a] 4eb9 0008 0c7e            jsr        Fclose
[0001b850] 4fef 0088                 lea.l      136(a7),a7
[0001b854] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0001b858] 4e75                      rts
