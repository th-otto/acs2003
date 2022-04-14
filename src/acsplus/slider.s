dr_3dbut:
[000367cc] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[000367d0] 4fef fff4                 lea.l      -12(a7),a7
[000367d4] 2648                      movea.l    a0,a3
[000367d6] 3600                      move.w     d0,d3
[000367d8] 45f9 0010 ee4e            lea.l      ACSblk,a2
[000367de] 2052                      movea.l    (a2),a0
[000367e0] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[000367e6] 6d30                      blt.s      $00036818
[000367e8] 4a43                      tst.w      d3
[000367ea] 670e                      beq.s      $000367FA
[000367ec] 7208                      moveq.l    #8,d1
[000367ee] 3028 0010                 move.w     16(a0),d0
[000367f2] 4eb9 0007 3708            jsr        vsf_color
[000367f8] 600e                      bra.s      $00036808
[000367fa] 7209                      moveq.l    #9,d1
[000367fc] 2052                      movea.l    (a2),a0
[000367fe] 3028 0010                 move.w     16(a0),d0
[00036802] 4eb9 0007 3708            jsr        vsf_color
[00036808] 7201                      moveq.l    #1,d1
[0003680a] 2052                      movea.l    (a2),a0
[0003680c] 3028 0010                 move.w     16(a0),d0
[00036810] 4eb9 0007 3660            jsr        vsf_interior
[00036816] 6022                      bra.s      $0003683A
[00036818] 4a43                      tst.w      d3
[0003681a] 6710                      beq.s      $0003682C
[0003681c] 4241                      clr.w      d1
[0003681e] 2052                      movea.l    (a2),a0
[00036820] 3028 0010                 move.w     16(a0),d0
[00036824] 4eb9 0007 3708            jsr        vsf_color
[0003682a] 600e                      bra.s      $0003683A
[0003682c] 7201                      moveq.l    #1,d1
[0003682e] 2052                      movea.l    (a2),a0
[00036830] 3028 0010                 move.w     16(a0),d0
[00036834] 4eb9 0007 3708            jsr        vsf_color
[0003683a] 204b                      movea.l    a3,a0
[0003683c] 2252                      movea.l    (a2),a1
[0003683e] 3029 0010                 move.w     16(a1),d0
[00036842] 4eb9 0007 282e            jsr        v_bar
[00036848] 3013                      move.w     (a3),d0
[0003684a] 3f40 0004                 move.w     d0,4(a7)
[0003684e] 3e80                      move.w     d0,(a7)
[00036850] 3f6b 0006 0002            move.w     6(a3),2(a7)
[00036856] 302b 0002                 move.w     2(a3),d0
[0003685a] 3f40 000a                 move.w     d0,10(a7)
[0003685e] 3f40 0006                 move.w     d0,6(a7)
[00036862] 3f6b 0004 0008            move.w     4(a3),8(a7)
[00036868] 7201                      moveq.l    #1,d1
[0003686a] 2052                      movea.l    (a2),a0
[0003686c] 3028 0010                 move.w     16(a0),d0
[00036870] 4eb9 0007 31c0            jsr        vsl_color
[00036876] 41d7                      lea.l      (a7),a0
[00036878] 7203                      moveq.l    #3,d1
[0003687a] 2252                      movea.l    (a2),a1
[0003687c] 3029 0010                 move.w     16(a1),d0
[00036880] 4eb9 0007 22e0            jsr        v_pline
[00036886] 3f6b 0004 0004            move.w     4(a3),4(a7)
[0003688c] 3f6b 0006 0006            move.w     6(a3),6(a7)
[00036892] 41d7                      lea.l      (a7),a0
[00036894] 7203                      moveq.l    #3,d1
[00036896] 2252                      movea.l    (a2),a1
[00036898] 3029 0010                 move.w     16(a1),d0
[0003689c] 4eb9 0007 22e0            jsr        v_pline
[000368a2] 4a43                      tst.w      d3
[000368a4] 6778                      beq.s      $0003691E
[000368a6] 7001                      moveq.l    #1,d0
[000368a8] d053                      add.w      (a3),d0
[000368aa] 3f40 0004                 move.w     d0,4(a7)
[000368ae] 7201                      moveq.l    #1,d1
[000368b0] d26b 0002                 add.w      2(a3),d1
[000368b4] 3f41 0006                 move.w     d1,6(a7)
[000368b8] 5257                      addq.w     #1,(a7)
[000368ba] 536f 0002                 subq.w     #1,2(a7)
[000368be] 536f 0008                 subq.w     #1,8(a7)
[000368c2] 526f 000a                 addq.w     #1,10(a7)
[000368c6] 2052                      movea.l    (a2),a0
[000368c8] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[000368ce] 6d1c                      blt.s      $000368EC
[000368d0] 3028 0010                 move.w     16(a0),d0
[000368d4] 4241                      clr.w      d1
[000368d6] 4eb9 0007 31c0            jsr        vsl_color
[000368dc] 41d7                      lea.l      (a7),a0
[000368de] 7203                      moveq.l    #3,d1
[000368e0] 2252                      movea.l    (a2),a1
[000368e2] 3029 0010                 move.w     16(a1),d0
[000368e6] 4eb9 0007 22e0            jsr        v_pline
[000368ec] 70ff                      moveq.l    #-1,d0
[000368ee] d06b 0004                 add.w      4(a3),d0
[000368f2] 3f40 0004                 move.w     d0,4(a7)
[000368f6] 72ff                      moveq.l    #-1,d1
[000368f8] d26b 0006                 add.w      6(a3),d1
[000368fc] 3f41 0006                 move.w     d1,6(a7)
[00036900] 2052                      movea.l    (a2),a0
[00036902] 3028 0010                 move.w     16(a0),d0
[00036906] 7209                      moveq.l    #9,d1
[00036908] 4eb9 0007 31c0            jsr        vsl_color
[0003690e] 41d7                      lea.l      (a7),a0
[00036910] 7203                      moveq.l    #3,d1
[00036912] 2252                      movea.l    (a2),a1
[00036914] 3029 0010                 move.w     16(a1),d0
[00036918] 4eb9 0007 22e0            jsr        v_pline
[0003691e] 4fef 000c                 lea.l      12(a7),a7
[00036922] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00036926] 4e75                      rts
A_slider:
[00036928] 48e7 3f3e                 movem.l    d2-d7/a2-a6,-(a7)
[0003692c] 4fef ffe0                 lea.l      -32(a7),a7
[00036930] 246f 0050                 movea.l    80(a7),a2
[00036934] 322a 0004                 move.w     4(a2),d1
[00036938] 48c1                      ext.l      d1
[0003693a] 2001                      move.l     d1,d0
[0003693c] d080                      add.l      d0,d0
[0003693e] d081                      add.l      d1,d0
[00036940] e788                      lsl.l      #3,d0
[00036942] 2052                      movea.l    (a2),a0
[00036944] d1c0                      adda.l     d0,a0
[00036946] 2f48 001c                 move.l     a0,28(a7)
[0003694a] 2f68 000c 0018            move.l     12(a0),24(a7)
[00036950] 226f 0018                 movea.l    24(a7),a1
[00036954] 2a69 000c                 movea.l    12(a1),a5
[00036958] 7001                      moveq.l    #1,d0
[0003695a] c06d 0026                 and.w      38(a5),d0
[0003695e] 6614                      bne.s      $00036974
[00036960] 3228 0014                 move.w     20(a0),d1
[00036964] b26d 0046                 cmp.w      70(a5),d1
[00036968] 660a                      bne.s      $00036974
[0003696a] 3028 0016                 move.w     22(a0),d0
[0003696e] b06d 0048                 cmp.w      72(a5),d0
[00036972] 670a                      beq.s      $0003697E
[00036974] 206f 001c                 movea.l    28(a7),a0
[00036978] 4eb9 0003 70e6            jsr        sl_calc
[0003697e] 7002                      moveq.l    #2,d0
[00036980] c06d 0026                 and.w      38(a5),d0
[00036984] 6604                      bne.s      $0003698A
[00036986] 7601                      moveq.l    #1,d3
[00036988] 6002                      bra.s      $0003698C
[0003698a] 4243                      clr.w      d3
[0003698c] 7001                      moveq.l    #1,d0
[0003698e] 206f 0018                 movea.l    24(a7),a0
[00036992] c0a8 0004                 and.l      4(a0),d0
[00036996] 6604                      bne.s      $0003699C
[00036998] 7801                      moveq.l    #1,d4
[0003699a] 6002                      bra.s      $0003699E
[0003699c] 4244                      clr.w      d4
[0003699e] 4df9 0010 ee4e            lea.l      ACSblk,a6
[000369a4] 7002                      moveq.l    #2,d0
[000369a6] 206f 0018                 movea.l    24(a7),a0
[000369aa] c0a8 0004                 and.l      4(a0),d0
[000369ae] 7202                      moveq.l    #2,d1
[000369b0] b280                      cmp.l      d0,d1
[000369b2] 6614                      bne.s      $000369C8
[000369b4] 2256                      movea.l    (a6),a1
[000369b6] 2069 023c                 movea.l    572(a1),a0
[000369ba] 3428 000e                 move.w     14(a0),d2
[000369be] c47c 0100                 and.w      #$0100,d2
[000369c2] 6604                      bne.s      $000369C8
[000369c4] 7a01                      moveq.l    #1,d5
[000369c6] 6002                      bra.s      $000369CA
[000369c8] 4245                      clr.w      d5
[000369ca] 47ef 0004                 lea.l      4(a7),a3
[000369ce] 376a 0016 0004            move.w     22(a2),4(a3)
[000369d4] 376a 0018 0006            move.w     24(a2),6(a3)
[000369da] 302b 0004                 move.w     4(a3),d0
[000369de] 6606                      bne.s      $000369E6
[000369e0] 322b 0006                 move.w     6(a3),d1
[000369e4] 672c                      beq.s      $00036A12
[000369e6] 36aa 0012                 move.w     18(a2),(a3)
[000369ea] 376a 0014 0002            move.w     20(a2),2(a3)
[000369f0] 70ff                      moveq.l    #-1,d0
[000369f2] d053                      add.w      (a3),d0
[000369f4] d16b 0004                 add.w      d0,4(a3)
[000369f8] 70ff                      moveq.l    #-1,d0
[000369fa] d06b 0002                 add.w      2(a3),d0
[000369fe] d16b 0006                 add.w      d0,6(a3)
[00036a02] 204b                      movea.l    a3,a0
[00036a04] 7201                      moveq.l    #1,d1
[00036a06] 2256                      movea.l    (a6),a1
[00036a08] 3029 0010                 move.w     16(a1),d0
[00036a0c] 4eb9 0007 2230            jsr        vs_clip
[00036a12] 2056                      movea.l    (a6),a0
[00036a14] 3228 0290                 move.w     656(a0),d1
[00036a18] 3028 0010                 move.w     16(a0),d0
[00036a1c] 4eb9 0007 34e6            jsr        vst_font
[00036a22] 7201                      moveq.l    #1,d1
[00036a24] 2056                      movea.l    (a6),a0
[00036a26] 3028 0010                 move.w     16(a0),d0
[00036a2a] 4eb9 0007 353a            jsr        vst_color
[00036a30] 4241                      clr.w      d1
[00036a32] 2056                      movea.l    (a6),a0
[00036a34] 3028 0010                 move.w     16(a0),d0
[00036a38] 4eb9 0007 3492            jsr        vst_rotation
[00036a3e] 49ef 0002                 lea.l      2(a7),a4
[00036a42] 224c                      movea.l    a4,a1
[00036a44] 204c                      movea.l    a4,a0
[00036a46] 7405                      moveq.l    #5,d2
[00036a48] 4241                      clr.w      d1
[00036a4a] 2f09                      move.l     a1,-(a7)
[00036a4c] 2256                      movea.l    (a6),a1
[00036a4e] 3029 0010                 move.w     16(a1),d0
[00036a52] 225f                      movea.l    (a7)+,a1
[00036a54] 4eb9 0007 35e2            jsr        vst_alignment
[00036a5a] 4854                      pea.l      (a4)
[00036a5c] 4854                      pea.l      (a4)
[00036a5e] 224c                      movea.l    a4,a1
[00036a60] 204c                      movea.l    a4,a0
[00036a62] 2f09                      move.l     a1,-(a7)
[00036a64] 2256                      movea.l    (a6),a1
[00036a66] 3229 0292                 move.w     658(a1),d1
[00036a6a] 3029 0010                 move.w     16(a1),d0
[00036a6e] 225f                      movea.l    (a7)+,a1
[00036a70] 4eb9 0007 3370            jsr        vst_height
[00036a76] 504f                      addq.w     #8,a7
[00036a78] 7201                      moveq.l    #1,d1
[00036a7a] 2056                      movea.l    (a6),a0
[00036a7c] 3028 0010                 move.w     16(a0),d0
[00036a80] 4eb9 0007 316a            jsr        vsl_width
[00036a86] 49ef 000c                 lea.l      12(a7),a4
[00036a8a] 4a44                      tst.w      d4
[00036a8c] 6730                      beq.s      $00036ABE
[00036a8e] 2056                      movea.l    (a6),a0
[00036a90] 3c28 0012                 move.w     18(a0),d6
[00036a94] dc46                      add.w      d6,d6
[00036a96] 302a 0010                 move.w     16(a2),d0
[00036a9a] 9068 0014                 sub.w      20(a0),d0
[00036a9e] e240                      asr.w      #1,d0
[00036aa0] d06a 000c                 add.w      12(a2),d0
[00036aa4] 3e80                      move.w     d0,(a7)
[00036aa6] 322a 000c                 move.w     12(a2),d1
[00036aaa] 3941 0002                 move.w     d1,2(a4)
[00036aae] 3941 0006                 move.w     d1,6(a4)
[00036ab2] 74ff                      moveq.l    #-1,d2
[00036ab4] d46a 0010                 add.w      16(a2),d2
[00036ab8] d56c 0006                 add.w      d2,6(a4)
[00036abc] 602a                      bra.s      $00036AE8
[00036abe] 2056                      movea.l    (a6),a0
[00036ac0] 3c28 0014                 move.w     20(a0),d6
[00036ac4] 302a 000e                 move.w     14(a2),d0
[00036ac8] 9068 0012                 sub.w      18(a0),d0
[00036acc] e240                      asr.w      #1,d0
[00036ace] d06a 000a                 add.w      10(a2),d0
[00036ad2] 3e80                      move.w     d0,(a7)
[00036ad4] 322a 000a                 move.w     10(a2),d1
[00036ad8] 3881                      move.w     d1,(a4)
[00036ada] 3941 0004                 move.w     d1,4(a4)
[00036ade] 74ff                      moveq.l    #-1,d2
[00036ae0] d46a 000e                 add.w      14(a2),d2
[00036ae4] d56c 0004                 add.w      d2,4(a4)
[00036ae8] 7201                      moveq.l    #1,d1
[00036aea] 2056                      movea.l    (a6),a0
[00036aec] 3028 0010                 move.w     16(a0),d0
[00036af0] 4eb9 0007 30c4            jsr        vsl_type
[00036af6] 4a43                      tst.w      d3
[00036af8] 660a                      bne.s      $00036B04
[00036afa] 7004                      moveq.l    #4,d0
[00036afc] c06d 0026                 and.w      38(a5),d0
[00036b00] 6700 00fa                 beq        $00036BFC
[00036b04] 4a44                      tst.w      d4
[00036b06] 6710                      beq.s      $00036B18
[00036b08] 302a 000a                 move.w     10(a2),d0
[00036b0c] 3880                      move.w     d0,(a4)
[00036b0e] 3940 0004                 move.w     d0,4(a4)
[00036b12] dd6c 0004                 add.w      d6,4(a4)
[00036b16] 6010                      bra.s      $00036B28
[00036b18] 302a 000c                 move.w     12(a2),d0
[00036b1c] 3940 0002                 move.w     d0,2(a4)
[00036b20] 3940 0006                 move.w     d0,6(a4)
[00036b24] dd6c 0006                 add.w      d6,6(a4)
[00036b28] 7201                      moveq.l    #1,d1
[00036b2a] 2056                      movea.l    (a6),a0
[00036b2c] 3028 0010                 move.w     16(a0),d0
[00036b30] 4eb9 0007 3070            jsr        vswr_mode
[00036b36] 7201                      moveq.l    #1,d1
[00036b38] 2056                      movea.l    (a6),a0
[00036b3a] 3028 0010                 move.w     16(a0),d0
[00036b3e] 4eb9 0007 375c            jsr        vsf_perimeter
[00036b44] 4241                      clr.w      d1
[00036b46] 2056                      movea.l    (a6),a0
[00036b48] 3028 0010                 move.w     16(a0),d0
[00036b4c] 4eb9 0007 3660            jsr        vsf_interior
[00036b52] 7201                      moveq.l    #1,d1
[00036b54] 2056                      movea.l    (a6),a0
[00036b56] 3028 0010                 move.w     16(a0),d0
[00036b5a] 4eb9 0007 3708            jsr        vsf_color
[00036b60] 4a45                      tst.w      d5
[00036b62] 671c                      beq.s      $00036B80
[00036b64] 202d 0008                 move.l     8(a5),d0
[00036b68] 670c                      beq.s      $00036B76
[00036b6a] 7208                      moveq.l    #8,d1
[00036b6c] c26a 0008                 and.w      8(a2),d1
[00036b70] 6604                      bne.s      $00036B76
[00036b72] 7001                      moveq.l    #1,d0
[00036b74] 6002                      bra.s      $00036B78
[00036b76] 4240                      clr.w      d0
[00036b78] 204c                      movea.l    a4,a0
[00036b7a] 6100 fc50                 bsr        dr_3dbut
[00036b7e] 600e                      bra.s      $00036B8E
[00036b80] 204c                      movea.l    a4,a0
[00036b82] 2256                      movea.l    (a6),a1
[00036b84] 3029 0010                 move.w     16(a1),d0
[00036b88] 4eb9 0007 282e            jsr        v_bar
[00036b8e] 7202                      moveq.l    #2,d1
[00036b90] 2056                      movea.l    (a6),a0
[00036b92] 3028 0010                 move.w     16(a0),d0
[00036b96] 4eb9 0007 3070            jsr        vswr_mode
[00036b9c] 202d 0008                 move.l     8(a5),d0
[00036ba0] 6610                      bne.s      $00036BB2
[00036ba2] 7202                      moveq.l    #2,d1
[00036ba4] 2056                      movea.l    (a6),a0
[00036ba6] 3028 0010                 move.w     16(a0),d0
[00036baa] 4eb9 0007 358e            jsr        vst_effects
[00036bb0] 600e                      bra.s      $00036BC0
[00036bb2] 4241                      clr.w      d1
[00036bb4] 2056                      movea.l    (a6),a0
[00036bb6] 3028 0010                 move.w     16(a0),d0
[00036bba] 4eb9 0007 358e            jsr        vst_effects
[00036bc0] 4a44                      tst.w      d4
[00036bc2] 6720                      beq.s      $00036BE4
[00036bc4] 41f9 000c f1a2            lea.l      $000CF1A2,a0
[00036bca] 3417                      move.w     (a7),d2
[00036bcc] 2256                      movea.l    (a6),a1
[00036bce] 3229 0012                 move.w     18(a1),d1
[00036bd2] e241                      asr.w      #1,d1
[00036bd4] d254                      add.w      (a4),d1
[00036bd6] 5241                      addq.w     #1,d1
[00036bd8] 3029 0010                 move.w     16(a1),d0
[00036bdc] 4eb9 0007 24b0            jsr        v_gtext
[00036be2] 6018                      bra.s      $00036BFC
[00036be4] 41f9 000c f1a4            lea.l      $000CF1A4,a0
[00036bea] 342c 0002                 move.w     2(a4),d2
[00036bee] 3217                      move.w     (a7),d1
[00036bf0] 2256                      movea.l    (a6),a1
[00036bf2] 3029 0010                 move.w     16(a1),d0
[00036bf6] 4eb9 0007 24b0            jsr        v_gtext
[00036bfc] 4a43                      tst.w      d3
[00036bfe] 660a                      bne.s      $00036C0A
[00036c00] 7008                      moveq.l    #8,d0
[00036c02] c06d 0026                 and.w      38(a5),d0
[00036c06] 6700 0110                 beq        $00036D18
[00036c0a] 4a44                      tst.w      d4
[00036c0c] 6714                      beq.s      $00036C22
[00036c0e] 302a 000a                 move.w     10(a2),d0
[00036c12] d06a 000e                 add.w      14(a2),d0
[00036c16] 5340                      subq.w     #1,d0
[00036c18] 3880                      move.w     d0,(a4)
[00036c1a] 3940 0004                 move.w     d0,4(a4)
[00036c1e] 9d54                      sub.w      d6,(a4)
[00036c20] 6016                      bra.s      $00036C38
[00036c22] 302a 000c                 move.w     12(a2),d0
[00036c26] d06a 0010                 add.w      16(a2),d0
[00036c2a] 5340                      subq.w     #1,d0
[00036c2c] 3940 0002                 move.w     d0,2(a4)
[00036c30] 3940 0006                 move.w     d0,6(a4)
[00036c34] 9d6c 0002                 sub.w      d6,2(a4)
[00036c38] 7201                      moveq.l    #1,d1
[00036c3a] 2056                      movea.l    (a6),a0
[00036c3c] 3028 0010                 move.w     16(a0),d0
[00036c40] 4eb9 0007 3070            jsr        vswr_mode
[00036c46] 7201                      moveq.l    #1,d1
[00036c48] 2056                      movea.l    (a6),a0
[00036c4a] 3028 0010                 move.w     16(a0),d0
[00036c4e] 4eb9 0007 375c            jsr        vsf_perimeter
[00036c54] 4241                      clr.w      d1
[00036c56] 2056                      movea.l    (a6),a0
[00036c58] 3028 0010                 move.w     16(a0),d0
[00036c5c] 4eb9 0007 3660            jsr        vsf_interior
[00036c62] 7201                      moveq.l    #1,d1
[00036c64] 2056                      movea.l    (a6),a0
[00036c66] 3028 0010                 move.w     16(a0),d0
[00036c6a] 4eb9 0007 3708            jsr        vsf_color
[00036c70] 4a45                      tst.w      d5
[00036c72] 6722                      beq.s      $00036C96
[00036c74] 202d 0008                 move.l     8(a5),d0
[00036c78] d0ad 0004                 add.l      4(a5),d0
[00036c7c] b095                      cmp.l      (a5),d0
[00036c7e] 670c                      beq.s      $00036C8C
[00036c80] 7208                      moveq.l    #8,d1
[00036c82] c26a 0008                 and.w      8(a2),d1
[00036c86] 6604                      bne.s      $00036C8C
[00036c88] 7001                      moveq.l    #1,d0
[00036c8a] 6002                      bra.s      $00036C8E
[00036c8c] 4240                      clr.w      d0
[00036c8e] 204c                      movea.l    a4,a0
[00036c90] 6100 fb3a                 bsr        dr_3dbut
[00036c94] 600e                      bra.s      $00036CA4
[00036c96] 204c                      movea.l    a4,a0
[00036c98] 2256                      movea.l    (a6),a1
[00036c9a] 3029 0010                 move.w     16(a1),d0
[00036c9e] 4eb9 0007 282e            jsr        v_bar
[00036ca4] 7202                      moveq.l    #2,d1
[00036ca6] 2056                      movea.l    (a6),a0
[00036ca8] 3028 0010                 move.w     16(a0),d0
[00036cac] 4eb9 0007 3070            jsr        vswr_mode
[00036cb2] 202d 0008                 move.l     8(a5),d0
[00036cb6] d0ad 0004                 add.l      4(a5),d0
[00036cba] b095                      cmp.l      (a5),d0
[00036cbc] 6610                      bne.s      $00036CCE
[00036cbe] 7202                      moveq.l    #2,d1
[00036cc0] 2056                      movea.l    (a6),a0
[00036cc2] 3028 0010                 move.w     16(a0),d0
[00036cc6] 4eb9 0007 358e            jsr        vst_effects
[00036ccc] 600e                      bra.s      $00036CDC
[00036cce] 4241                      clr.w      d1
[00036cd0] 2056                      movea.l    (a6),a0
[00036cd2] 3028 0010                 move.w     16(a0),d0
[00036cd6] 4eb9 0007 358e            jsr        vst_effects
[00036cdc] 4a44                      tst.w      d4
[00036cde] 6720                      beq.s      $00036D00
[00036ce0] 41f9 000c f1a6            lea.l      $000CF1A6,a0
[00036ce6] 3417                      move.w     (a7),d2
[00036ce8] 2256                      movea.l    (a6),a1
[00036cea] 3229 0012                 move.w     18(a1),d1
[00036cee] e241                      asr.w      #1,d1
[00036cf0] d254                      add.w      (a4),d1
[00036cf2] 5241                      addq.w     #1,d1
[00036cf4] 3029 0010                 move.w     16(a1),d0
[00036cf8] 4eb9 0007 24b0            jsr        v_gtext
[00036cfe] 6018                      bra.s      $00036D18
[00036d00] 41f9 000c f1a8            lea.l      $000CF1A8,a0
[00036d06] 342c 0002                 move.w     2(a4),d2
[00036d0a] 3217                      move.w     (a7),d1
[00036d0c] 2256                      movea.l    (a6),a1
[00036d0e] 3029 0010                 move.w     16(a1),d0
[00036d12] 4eb9 0007 24b0            jsr        v_gtext
[00036d18] 7201                      moveq.l    #1,d1
[00036d1a] 2056                      movea.l    (a6),a0
[00036d1c] 3028 0010                 move.w     16(a0),d0
[00036d20] 4eb9 0007 3070            jsr        vswr_mode
[00036d26] 7201                      moveq.l    #1,d1
[00036d28] 2056                      movea.l    (a6),a0
[00036d2a] 3028 0010                 move.w     16(a0),d0
[00036d2e] 4eb9 0007 375c            jsr        vsf_perimeter
[00036d34] 7202                      moveq.l    #2,d1
[00036d36] 2056                      movea.l    (a6),a0
[00036d38] 3028 0010                 move.w     16(a0),d0
[00036d3c] 4eb9 0007 3660            jsr        vsf_interior
[00036d42] 7201                      moveq.l    #1,d1
[00036d44] 2056                      movea.l    (a6),a0
[00036d46] 3028 0010                 move.w     16(a0),d0
[00036d4a] 4eb9 0007 36b4            jsr        vsf_style
[00036d50] 7201                      moveq.l    #1,d1
[00036d52] 2056                      movea.l    (a6),a0
[00036d54] 3028 0010                 move.w     16(a0),d0
[00036d58] 4eb9 0007 3708            jsr        vsf_color
[00036d5e] 7004                      moveq.l    #4,d0
[00036d60] 206f 0018                 movea.l    24(a7),a0
[00036d64] c0a8 0004                 and.l      4(a0),d0
[00036d68] 6600 00b0                 bne        $00036E1A
[00036d6c] 322d 0028                 move.w     40(a5),d1
[00036d70] 6700 00a8                 beq        $00036E1A
[00036d74] 4a43                      tst.w      d3
[00036d76] 660a                      bne.s      $00036D82
[00036d78] 7410                      moveq.l    #16,d2
[00036d7a] c46d 0026                 and.w      38(a5),d2
[00036d7e] 6700 009a                 beq        $00036E1A
[00036d82] 4a44                      tst.w      d4
[00036d84] 6716                      beq.s      $00036D9C
[00036d86] 3e2a 000a                 move.w     10(a2),d7
[00036d8a] de46                      add.w      d6,d7
[00036d8c] 3887                      move.w     d7,(a4)
[00036d8e] 3947 0004                 move.w     d7,4(a4)
[00036d92] 302d 0028                 move.w     40(a5),d0
[00036d96] d16c 0004                 add.w      d0,4(a4)
[00036d9a] 6016                      bra.s      $00036DB2
[00036d9c] 3e2a 000c                 move.w     12(a2),d7
[00036da0] de46                      add.w      d6,d7
[00036da2] 3947 0002                 move.w     d7,2(a4)
[00036da6] 3947 0006                 move.w     d7,6(a4)
[00036daa] 302d 0028                 move.w     40(a5),d0
[00036dae] d16c 0006                 add.w      d0,6(a4)
[00036db2] de6d 002e                 add.w      46(a5),d7
[00036db6] 4a43                      tst.w      d3
[00036db8] 664e                      bne.s      $00036E08
[00036dba] 4a44                      tst.w      d4
[00036dbc] 672a                      beq.s      $00036DE8
[00036dbe] be6b 0004                 cmp.w      4(a3),d7
[00036dc2] 6e56                      bgt.s      $00036E1A
[00036dc4] be53                      cmp.w      (a3),d7
[00036dc6] 6f02                      ble.s      $00036DCA
[00036dc8] 3687                      move.w     d7,(a3)
[00036dca] 204b                      movea.l    a3,a0
[00036dcc] 7201                      moveq.l    #1,d1
[00036dce] 2256                      movea.l    (a6),a1
[00036dd0] 3029 0010                 move.w     16(a1),d0
[00036dd4] 4eb9 0007 2230            jsr        vs_clip
[00036dda] 4a45                      tst.w      d5
[00036ddc] 672e                      beq.s      $00036E0C
[00036dde] 4240                      clr.w      d0
[00036de0] 204c                      movea.l    a4,a0
[00036de2] 6100 f9e8                 bsr        dr_3dbut
[00036de6] 6032                      bra.s      $00036E1A
[00036de8] be6b 0006                 cmp.w      6(a3),d7
[00036dec] 6e2c                      bgt.s      $00036E1A
[00036dee] be6b 0002                 cmp.w      2(a3),d7
[00036df2] 6f04                      ble.s      $00036DF8
[00036df4] 3747 0002                 move.w     d7,2(a3)
[00036df8] 204b                      movea.l    a3,a0
[00036dfa] 7201                      moveq.l    #1,d1
[00036dfc] 2256                      movea.l    (a6),a1
[00036dfe] 3029 0010                 move.w     16(a1),d0
[00036e02] 4eb9 0007 2230            jsr        vs_clip
[00036e08] 4a45                      tst.w      d5
[00036e0a] 66d2                      bne.s      $00036DDE
[00036e0c] 204c                      movea.l    a4,a0
[00036e0e] 2256                      movea.l    (a6),a1
[00036e10] 3029 0010                 move.w     16(a1),d0
[00036e14] 4eb9 0007 282e            jsr        v_bar
[00036e1a] 7004                      moveq.l    #4,d0
[00036e1c] 206f 0018                 movea.l    24(a7),a0
[00036e20] c0a8 0004                 and.l      4(a0),d0
[00036e24] 6600 00bc                 bne        $00036EE2
[00036e28] 322d 002c                 move.w     44(a5),d1
[00036e2c] 6700 00b4                 beq        $00036EE2
[00036e30] 4a43                      tst.w      d3
[00036e32] 660a                      bne.s      $00036E3E
[00036e34] 7420                      moveq.l    #32,d2
[00036e36] c46d 0026                 and.w      38(a5),d2
[00036e3a] 6700 00a6                 beq        $00036EE2
[00036e3e] 4a44                      tst.w      d4
[00036e40] 671a                      beq.s      $00036E5C
[00036e42] 3e2a 000a                 move.w     10(a2),d7
[00036e46] de6a 000e                 add.w      14(a2),d7
[00036e4a] 9e46                      sub.w      d6,d7
[00036e4c] 5347                      subq.w     #1,d7
[00036e4e] 3887                      move.w     d7,(a4)
[00036e50] 3947 0004                 move.w     d7,4(a4)
[00036e54] 302d 002c                 move.w     44(a5),d0
[00036e58] 9154                      sub.w      d0,(a4)
[00036e5a] 601c                      bra.s      $00036E78
[00036e5c] 3e2a 000c                 move.w     12(a2),d7
[00036e60] de6a 0010                 add.w      16(a2),d7
[00036e64] 9e46                      sub.w      d6,d7
[00036e66] 5347                      subq.w     #1,d7
[00036e68] 3947 0002                 move.w     d7,2(a4)
[00036e6c] 3947 0006                 move.w     d7,6(a4)
[00036e70] 302d 002c                 move.w     44(a5),d0
[00036e74] 916c 0002                 sub.w      d0,2(a4)
[00036e78] 9e6d 0030                 sub.w      48(a5),d7
[00036e7c] 4a43                      tst.w      d3
[00036e7e] 6650                      bne.s      $00036ED0
[00036e80] 4a44                      tst.w      d4
[00036e82] 672c                      beq.s      $00036EB0
[00036e84] be53                      cmp.w      (a3),d7
[00036e86] 6d5a                      blt.s      $00036EE2
[00036e88] be6b 0004                 cmp.w      4(a3),d7
[00036e8c] 6c04                      bge.s      $00036E92
[00036e8e] 3747 0004                 move.w     d7,4(a3)
[00036e92] 204b                      movea.l    a3,a0
[00036e94] 7201                      moveq.l    #1,d1
[00036e96] 2256                      movea.l    (a6),a1
[00036e98] 3029 0010                 move.w     16(a1),d0
[00036e9c] 4eb9 0007 2230            jsr        vs_clip
[00036ea2] 4a45                      tst.w      d5
[00036ea4] 672e                      beq.s      $00036ED4
[00036ea6] 4240                      clr.w      d0
[00036ea8] 204c                      movea.l    a4,a0
[00036eaa] 6100 f920                 bsr        dr_3dbut
[00036eae] 6032                      bra.s      $00036EE2
[00036eb0] be6b 0002                 cmp.w      2(a3),d7
[00036eb4] 6d2c                      blt.s      $00036EE2
[00036eb6] be6b 0006                 cmp.w      6(a3),d7
[00036eba] 6c04                      bge.s      $00036EC0
[00036ebc] 3747 0006                 move.w     d7,6(a3)
[00036ec0] 204b                      movea.l    a3,a0
[00036ec2] 7201                      moveq.l    #1,d1
[00036ec4] 2256                      movea.l    (a6),a1
[00036ec6] 3029 0010                 move.w     16(a1),d0
[00036eca] 4eb9 0007 2230            jsr        vs_clip
[00036ed0] 4a45                      tst.w      d5
[00036ed2] 66d2                      bne.s      $00036EA6
[00036ed4] 204c                      movea.l    a4,a0
[00036ed6] 2256                      movea.l    (a6),a1
[00036ed8] 3029 0010                 move.w     16(a1),d0
[00036edc] 4eb9 0007 282e            jsr        v_bar
[00036ee2] 7004                      moveq.l    #4,d0
[00036ee4] 206f 0018                 movea.l    24(a7),a0
[00036ee8] c0a8 0004                 and.l      4(a0),d0
[00036eec] 6600 013a                 bne        $00037028
[00036ef0] 4a44                      tst.w      d4
[00036ef2] 671c                      beq.s      $00036F10
[00036ef4] 322a 000a                 move.w     10(a2),d1
[00036ef8] d246                      add.w      d6,d1
[00036efa] d26d 0028                 add.w      40(a5),d1
[00036efe] 3881                      move.w     d1,(a4)
[00036f00] 3941 0004                 move.w     d1,4(a4)
[00036f04] 74ff                      moveq.l    #-1,d2
[00036f06] d46d 002a                 add.w      42(a5),d2
[00036f0a] d56c 0004                 add.w      d2,4(a4)
[00036f0e] 601c                      bra.s      $00036F2C
[00036f10] 302a 000c                 move.w     12(a2),d0
[00036f14] d046                      add.w      d6,d0
[00036f16] d06d 0028                 add.w      40(a5),d0
[00036f1a] 3940 0002                 move.w     d0,2(a4)
[00036f1e] 3940 0006                 move.w     d0,6(a4)
[00036f22] 72ff                      moveq.l    #-1,d1
[00036f24] d26d 002a                 add.w      42(a5),d1
[00036f28] d36c 0006                 add.w      d1,6(a4)
[00036f2c] 7201                      moveq.l    #1,d1
[00036f2e] 2056                      movea.l    (a6),a0
[00036f30] 3028 0010                 move.w     16(a0),d0
[00036f34] 4eb9 0007 375c            jsr        vsf_perimeter
[00036f3a] 4241                      clr.w      d1
[00036f3c] 2056                      movea.l    (a6),a0
[00036f3e] 3028 0010                 move.w     16(a0),d0
[00036f42] 4eb9 0007 3660            jsr        vsf_interior
[00036f48] 7201                      moveq.l    #1,d1
[00036f4a] 2056                      movea.l    (a6),a0
[00036f4c] 3028 0010                 move.w     16(a0),d0
[00036f50] 4eb9 0007 3708            jsr        vsf_color
[00036f56] 4a45                      tst.w      d5
[00036f58] 671e                      beq.s      $00036F78
[00036f5a] 7008                      moveq.l    #8,d0
[00036f5c] c06a 0008                 and.w      8(a2),d0
[00036f60] 660c                      bne.s      $00036F6E
[00036f62] 222d 0004                 move.l     4(a5),d1
[00036f66] b295                      cmp.l      (a5),d1
[00036f68] 6704                      beq.s      $00036F6E
[00036f6a] 7001                      moveq.l    #1,d0
[00036f6c] 6002                      bra.s      $00036F70
[00036f6e] 4240                      clr.w      d0
[00036f70] 204c                      movea.l    a4,a0
[00036f72] 6100 f858                 bsr        dr_3dbut
[00036f76] 600e                      bra.s      $00036F86
[00036f78] 204c                      movea.l    a4,a0
[00036f7a] 2256                      movea.l    (a6),a1
[00036f7c] 3029 0010                 move.w     16(a1),d0
[00036f80] 4eb9 0007 282e            jsr        v_bar
[00036f86] 102d 0012                 move.b     18(a5),d0
[00036f8a] 6700 009c                 beq        $00037028
[00036f8e] 7202                      moveq.l    #2,d1
[00036f90] 2056                      movea.l    (a6),a0
[00036f92] 3028 0010                 move.w     16(a0),d0
[00036f96] 4eb9 0007 3070            jsr        vswr_mode
[00036f9c] 4241                      clr.w      d1
[00036f9e] 2056                      movea.l    (a6),a0
[00036fa0] 3028 0010                 move.w     16(a0),d0
[00036fa4] 4eb9 0007 358e            jsr        vst_effects
[00036faa] 4a44                      tst.w      d4
[00036fac] 6738                      beq.s      $00036FE6
[00036fae] 41ed 0012                 lea.l      18(a5),a0
[00036fb2] 4eb9 0008 2f6c            jsr        strlen
[00036fb8] 2056                      movea.l    (a6),a0
[00036fba] 3228 0012                 move.w     18(a0),d1
[00036fbe] 48c1                      ext.l      d1
[00036fc0] 4eb9 0008 3c32            jsr        _ulmul
[00036fc6] 3e2d 002a                 move.w     42(a5),d7
[00036fca] 9e40                      sub.w      d0,d7
[00036fcc] e247                      asr.w      #1,d7
[00036fce] 41ed 0012                 lea.l      18(a5),a0
[00036fd2] 3417                      move.w     (a7),d2
[00036fd4] 3214                      move.w     (a4),d1
[00036fd6] d247                      add.w      d7,d1
[00036fd8] 2256                      movea.l    (a6),a1
[00036fda] 3029 0010                 move.w     16(a1),d0
[00036fde] 4eb9 0007 24b0            jsr        v_gtext
[00036fe4] 6042                      bra.s      $00037028
[00036fe6] 41ed 0012                 lea.l      18(a5),a0
[00036fea] 4eb9 0008 2f6c            jsr        strlen
[00036ff0] 2056                      movea.l    (a6),a0
[00036ff2] 3228 0012                 move.w     18(a0),d1
[00036ff6] 48c1                      ext.l      d1
[00036ff8] 4eb9 0008 3c32            jsr        _ulmul
[00036ffe] 3e2a 000e                 move.w     14(a2),d7
[00037002] 9e40                      sub.w      d0,d7
[00037004] e247                      asr.w      #1,d7
[00037006] 41ed 0012                 lea.l      18(a5),a0
[0003700a] 342d 002a                 move.w     42(a5),d2
[0003700e] 2256                      movea.l    (a6),a1
[00037010] 9469 0014                 sub.w      20(a1),d2
[00037014] e242                      asr.w      #1,d2
[00037016] d46c 0002                 add.w      2(a4),d2
[0003701a] 3214                      move.w     (a4),d1
[0003701c] d247                      add.w      d7,d1
[0003701e] 3029 0010                 move.w     16(a1),d0
[00037022] 4eb9 0007 24b0            jsr        v_gtext
[00037028] 4a43                      tst.w      d3
[0003702a] 6700 009a                 beq        $000370C6
[0003702e] 7020                      moveq.l    #32,d0
[00037030] 206f 001c                 movea.l    28(a7),a0
[00037034] c068 000a                 and.w      10(a0),d0
[00037038] 6700 008c                 beq        $000370C6
[0003703c] 7201                      moveq.l    #1,d1
[0003703e] d26a 000a                 add.w      10(a2),d1
[00037042] 3881                      move.w     d1,(a4)
[00037044] 7401                      moveq.l    #1,d2
[00037046] d46a 000c                 add.w      12(a2),d2
[0003704a] 3942 000a                 move.w     d2,10(a4)
[0003704e] 362a 000c                 move.w     12(a2),d3
[00037052] d66a 0010                 add.w      16(a2),d3
[00037056] 3943 0002                 move.w     d3,2(a4)
[0003705a] 3943 0006                 move.w     d3,6(a4)
[0003705e] 382a 000a                 move.w     10(a2),d4
[00037062] d86a 000e                 add.w      14(a2),d4
[00037066] 3944 0004                 move.w     d4,4(a4)
[0003706a] 3944 0008                 move.w     d4,8(a4)
[0003706e] 2256                      movea.l    (a6),a1
[00037070] 3029 0010                 move.w     16(a1),d0
[00037074] 7201                      moveq.l    #1,d1
[00037076] 4eb9 0007 3070            jsr        vswr_mode
[0003707c] 7201                      moveq.l    #1,d1
[0003707e] 2056                      movea.l    (a6),a0
[00037080] 3028 0010                 move.w     16(a0),d0
[00037084] 4eb9 0007 31c0            jsr        vsl_color
[0003708a] 4242                      clr.w      d2
[0003708c] 4241                      clr.w      d1
[0003708e] 2056                      movea.l    (a6),a0
[00037090] 3028 0010                 move.w     16(a0),d0
[00037094] 4eb9 0007 3214            jsr        vsl_ends
[0003709a] 7201                      moveq.l    #1,d1
[0003709c] 2056                      movea.l    (a6),a0
[0003709e] 3028 0010                 move.w     16(a0),d0
[000370a2] 4eb9 0007 316a            jsr        vsl_width
[000370a8] 7201                      moveq.l    #1,d1
[000370aa] 2056                      movea.l    (a6),a0
[000370ac] 3028 0010                 move.w     16(a0),d0
[000370b0] 4eb9 0007 30c4            jsr        vsl_type
[000370b6] 204c                      movea.l    a4,a0
[000370b8] 7203                      moveq.l    #3,d1
[000370ba] 2256                      movea.l    (a6),a1
[000370bc] 3029 0010                 move.w     16(a1),d0
[000370c0] 4eb9 0007 22e0            jsr        v_pline
[000370c6] 204b                      movea.l    a3,a0
[000370c8] 4241                      clr.w      d1
[000370ca] 2256                      movea.l    (a6),a1
[000370cc] 3029 0010                 move.w     16(a1),d0
[000370d0] 4eb9 0007 2230            jsr        vs_clip
[000370d6] 70f6                      moveq.l    #-10,d0
[000370d8] c06a 0008                 and.w      8(a2),d0
[000370dc] 4fef 0020                 lea.l      32(a7),a7
[000370e0] 4cdf 7cfc                 movem.l    (a7)+,d2-d7/a2-a6
[000370e4] 4e75                      rts
sl_calc:
[000370e6] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[000370ea] 2448                      movea.l    a0,a2
[000370ec] 206a 000c                 movea.l    12(a2),a0
[000370f0] 2668 000c                 movea.l    12(a0),a3
[000370f4] 43f9 0010 ee4e            lea.l      ACSblk,a1
[000370fa] 7001                      moveq.l    #1,d0
[000370fc] c0a8 0004                 and.l      4(a0),d0
[00037100] 6716                      beq.s      $00037118
[00037102] 2051                      movea.l    (a1),a0
[00037104] 3628 0014                 move.w     20(a0),d3
[00037108] 382a 0016                 move.w     22(a2),d4
[0003710c] 3228 0014                 move.w     20(a0),d1
[00037110] d241                      add.w      d1,d1
[00037112] 9841                      sub.w      d1,d4
[00037114] 3a04                      move.w     d4,d5
[00037116] 6018                      bra.s      $00037130
[00037118] 2051                      movea.l    (a1),a0
[0003711a] 3628 0012                 move.w     18(a0),d3
[0003711e] c7eb 0010                 muls.w     16(a3),d3
[00037122] 382a 0014                 move.w     20(a2),d4
[00037126] 3028 0012                 move.w     18(a0),d0
[0003712a] e548                      lsl.w      #2,d0
[0003712c] 9840                      sub.w      d0,d4
[0003712e] 3a04                      move.w     d4,d5
[00037130] 202b 0004                 move.l     4(a3),d0
[00037134] 3204                      move.w     d4,d1
[00037136] 48c1                      ext.l      d1
[00037138] 4eb9 0008 3cac            jsr        _lmul
[0003713e] 2213                      move.l     (a3),d1
[00037140] 4eb9 0008 3cf6            jsr        _ldiv
[00037146] 3740 002a                 move.w     d0,42(a3)
[0003714a] b640                      cmp.w      d0,d3
[0003714c] 6f0c                      ble.s      $0003715A
[0003714e] 3a04                      move.w     d4,d5
[00037150] da40                      add.w      d0,d5
[00037152] 9a43                      sub.w      d3,d5
[00037154] 5345                      subq.w     #1,d5
[00037156] 3743 002a                 move.w     d3,42(a3)
[0003715a] 202b 0008                 move.l     8(a3),d0
[0003715e] 3205                      move.w     d5,d1
[00037160] 48c1                      ext.l      d1
[00037162] 4eb9 0008 3cac            jsr        _lmul
[00037168] 2213                      move.l     (a3),d1
[0003716a] e281                      asr.l      #1,d1
[0003716c] d081                      add.l      d1,d0
[0003716e] 2213                      move.l     (a3),d1
[00037170] 4eb9 0008 3cf6            jsr        _ldiv
[00037176] 3740 0028                 move.w     d0,40(a3)
[0003717a] 3204                      move.w     d4,d1
[0003717c] 926b 002a                 sub.w      42(a3),d1
[00037180] 9240                      sub.w      d0,d1
[00037182] 3741 002c                 move.w     d1,44(a3)
[00037186] 4a41                      tst.w      d1
[00037188] 6b0c                      bmi.s      $00037196
[0003718a] 202b 0008                 move.l     8(a3),d0
[0003718e] d0ab 0004                 add.l      4(a3),d0
[00037192] b093                      cmp.l      (a3),d0
[00037194] 660c                      bne.s      $000371A2
[00037196] 302b 002c                 move.w     44(a3),d0
[0003719a] d16b 0028                 add.w      d0,40(a3)
[0003719e] 426b 002c                 clr.w      44(a3)
[000371a2] 376a 0014 0046            move.w     20(a2),70(a3)
[000371a8] 376a 0016 0048            move.w     22(a2),72(a3)
[000371ae] 026b fffe 0026            andi.w     #$FFFE,38(a3)
[000371b4] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[000371b8] 4e75                      rts
Auo_slider:
[000371ba] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[000371be] 594f                      subq.w     #4,a7
[000371c0] 2e88                      move.l     a0,(a7)
[000371c2] 2849                      movea.l    a1,a4
[000371c4] 2468 000c                 movea.l    12(a0),a2
[000371c8] 266a 000c                 movea.l    12(a2),a3
[000371cc] 3200                      move.w     d0,d1
[000371ce] b27c 000f                 cmp.w      #$000F,d1
[000371d2] 6700 02ec                 beq        $000374C0
[000371d6] 6e30                      bgt.s      $00037208
[000371d8] b27c 000e                 cmp.w      #$000E,d1
[000371dc] 6200 032e                 bhi        $0003750C
[000371e0] d241                      add.w      d1,d1
[000371e2] 323b 1006                 move.w     $000371EA(pc,d1.w),d1
[000371e6] 4efb 1002                 jmp        $000371EA(pc,d1.w)
J23:
[000371ea] 0322                      dc.w $0322   ; $0003750c-$000371ea
[000371ec] 007a                      dc.w $007a   ; $00037264-$000371ea
[000371ee] 00a6                      dc.w $00a6   ; $00037290-$000371ea
[000371f0] 00cc                      dc.w $00cc   ; $000372b6-$000371ea
[000371f2] 00b2                      dc.w $00b2   ; $0003729c-$000371ea
[000371f4] 0108                      dc.w $0108   ; $000372f2-$000371ea
[000371f6] 0102                      dc.w $0102   ; $000372ec-$000371ea
[000371f8] 0322                      dc.w $0322   ; $0003750c-$000371ea
[000371fa] 0322                      dc.w $0322   ; $0003750c-$000371ea
[000371fc] 00d6                      dc.w $00d6   ; $000372c0-$000371ea
[000371fe] 023c                      dc.w $023c   ; $00037426-$000371ea
[00037200] 0262                      dc.w $0262   ; $0003744c-$000371ea
[00037202] 0288                      dc.w $0288   ; $00037472-$000371ea
[00037204] 02ae                      dc.w $02ae   ; $00037498-$000371ea
[00037206] 02d0                      dc.w $02d0   ; $000374ba-$000371ea
[00037208] b27c                      dc.w $b27c   ; $00032466-$000371ea
[0003720a] 0065 6700                 ori.w      #$6700,-(a5)
[0003720e] 01f8 6e30                 bset       d0,($00006E30).w
[00037212] b27c 0013                 cmp.w      #$0013,d1
[00037216] 6700 02f8                 beq        $00037510
[0003721a] 6e12                      bgt.s      $0003722E
[0003721c] 927c 0011                 sub.w      #$0011,d1
[00037220] 6700 01fc                 beq        $0003741E
[00037224] 5341                      subq.w     #1,d1
[00037226] 6700 00ae                 beq        $000372D6
[0003722a] 6000 02e0                 bra        $0003750C
[0003722e] 927c 0014                 sub.w      #$0014,d1
[00037232] 6700 02dc                 beq        $00037510
[00037236] 927c 0050                 sub.w      #$0050,d1
[0003723a] 6700 01c4                 beq        $00037400
[0003723e] 6000 02cc                 bra        $0003750C
[00037242] 927c 0066                 sub.w      #$0066,d1
[00037246] b27c 0005                 cmp.w      #$0005,d1
[0003724a] 6200 02c0                 bhi        $0003750C
[0003724e] d241                      add.w      d1,d1
[00037250] 323b 1006                 move.w     $00037258(pc,d1.w),d1
[00037254] 4efb 1002                 jmp        $00037258(pc,d1.w)
J24:
[00037258] 01be                      dc.w $01be   ; $00037416-$00037258
[0003725a] 0192                      dc.w $0192   ; $000373ea-$00037258
[0003725c] 01b6                      dc.w $01b6   ; $0003740e-$00037258
[0003725e] 0274                      dc.w $0274   ; $000374cc-$00037258
[00037260] 02b4                      dc.w $02b4   ; $0003750c-$00037258
[00037262] 01a0                      dc.w $01a0   ; $000373f8-$00037258
[00037264] 704a                      dc.w $704a   ; $0003e2a2-$00037258
[00037266] 4eb9 0004 c608            jsr        Ax_malloc
[0003726c] 2648                      movea.l    a0,a3
[0003726e] 200b                      move.l     a3,d0
[00037270] 6716                      beq.s      $00037288
[00037272] 43f9 000c f158            lea.l      proto,a1
[00037278] 704a                      moveq.l    #74,d0
[0003727a] 4eb9 0008 3500            jsr        memcpy
[00037280] 254b 000c                 move.l     a3,12(a2)
[00037284] 6000 028a                 bra        $00037510
[00037288] 38bc ffff                 move.w     #$FFFF,(a4)
[0003728c] 6000 0282                 bra        $00037510
[00037290] 204b                      movea.l    a3,a0
[00037292] 4eb9 0004 c7c8            jsr        Ax_free
[00037298] 6000 0276                 bra        $00037510
[0003729c] 700b                      moveq.l    #11,d0
[0003729e] 224c                      movea.l    a4,a1
[000372a0] 41eb 0012                 lea.l      18(a3),a0
[000372a4] 4eb9 0008 2fd6            jsr        strncpy
[000372aa] 302b 0010                 move.w     16(a3),d0
[000372ae] 4233 0012                 clr.b      18(a3,d0.w)
[000372b2] 6000 025c                 bra        $00037510
[000372b6] 41eb 0012                 lea.l      18(a3),a0
[000372ba] 2888                      move.l     a0,(a4)
[000372bc] 6000 0252                 bra        $00037510
[000372c0] 2a4c                      movea.l    a4,a5
[000372c2] 2755 003c                 move.l     (a5),60(a3)
[000372c6] 276d 0004 0040            move.l     4(a5),64(a3)
[000372cc] 376d 0008 0044            move.w     8(a5),68(a3)
[000372d2] 6000 023c                 bra        $00037510
[000372d6] 2a4c                      movea.l    a4,a5
[000372d8] 2aab 003c                 move.l     60(a3),(a5)
[000372dc] 2b6b 0040 0004            move.l     64(a3),4(a5)
[000372e2] 3b6b 0044 0008            move.w     68(a3),8(a5)
[000372e8] 6000 0226                 bra        $00037510
[000372ec] 006b 0040 0026            ori.w      #$0040,38(a3)
[000372f2] 246b 003c                 movea.l    60(a3),a2
[000372f6] 200a                      move.l     a2,d0
[000372f8] 6700 0216                 beq        $00037510
[000372fc] 222b 0008                 move.l     8(a3),d1
[00037300] 6a04                      bpl.s      $00037306
[00037302] 42ab 0008                 clr.l      8(a3)
[00037306] 2613                      move.l     (a3),d3
[00037308] 96ab 0004                 sub.l      4(a3),d3
[0003730c] b6ab 0008                 cmp.l      8(a3),d3
[00037310] 6c04                      bge.s      $00037316
[00037312] 2743 0008                 move.l     d3,8(a3)
[00037316] 2057                      movea.l    (a7),a0
[00037318] 6100 fdcc                 bsr        sl_calc
[0003731c] 202b 0034                 move.l     52(a3),d0
[00037320] 6604                      bne.s      $00037326
[00037322] 7201                      moveq.l    #1,d1
[00037324] 6002                      bra.s      $00037328
[00037326] 4241                      clr.w      d1
[00037328] 3f01                      move.w     d1,-(a7)
[0003732a] 202b 0008                 move.l     8(a3),d0
[0003732e] 6604                      bne.s      $00037334
[00037330] 7401                      moveq.l    #1,d2
[00037332] 6002                      bra.s      $00037336
[00037334] 4242                      clr.w      d2
[00037336] 301f                      move.w     (a7)+,d0
[00037338] b540                      eor.w      d2,d0
[0003733a] 6706                      beq.s      $00037342
[0003733c] 006b 0004 0026            ori.w      #$0004,38(a3)
[00037342] 202b 0034                 move.l     52(a3),d0
[00037346] b0ab 0038                 cmp.l      56(a3),d0
[0003734a] 6604                      bne.s      $00037350
[0003734c] 7201                      moveq.l    #1,d1
[0003734e] 6002                      bra.s      $00037352
[00037350] 4241                      clr.w      d1
[00037352] 3f01                      move.w     d1,-(a7)
[00037354] b6ab 0008                 cmp.l      8(a3),d3
[00037358] 6604                      bne.s      $0003735E
[0003735a] 7001                      moveq.l    #1,d0
[0003735c] 6002                      bra.s      $00037360
[0003735e] 4240                      clr.w      d0
[00037360] 321f                      move.w     (a7)+,d1
[00037362] b141                      eor.w      d0,d1
[00037364] 6706                      beq.s      $0003736C
[00037366] 006b 0008 0026            ori.w      #$0008,38(a3)
[0003736c] 302b 002e                 move.w     46(a3),d0
[00037370] b06b 0028                 cmp.w      40(a3),d0
[00037374] 6c06                      bge.s      $0003737C
[00037376] 006b 0010 0026            ori.w      #$0010,38(a3)
[0003737c] 302b 0030                 move.w     48(a3),d0
[00037380] b06b 002c                 cmp.w      44(a3),d0
[00037384] 6c06                      bge.s      $0003738C
[00037386] 006b 0020 0026            ori.w      #$0020,38(a3)
[0003738c] 302b 0032                 move.w     50(a3),d0
[00037390] b06b 002a                 cmp.w      42(a3),d0
[00037394] 6706                      beq.s      $0003739C
[00037396] 006b 0080 0026            ori.w      #$0080,38(a3)
[0003739c] 302b 0026                 move.w     38(a3),d0
[000373a0] c07c 00fc                 and.w      #$00FC,d0
[000373a4] 6700 016a                 beq        $00037510
[000373a8] 7240                      moveq.l    #64,d1
[000373aa] c26b 0026                 and.w      38(a3),d1
[000373ae] 6606                      bne.s      $000373B6
[000373b0] 006b 0002 0026            ori.w      #$0002,38(a3)
[000373b6] 72ff                      moveq.l    #-1,d1
[000373b8] 302b 0044                 move.w     68(a3),d0
[000373bc] 204a                      movea.l    a2,a0
[000373be] 226a 0066                 movea.l    102(a2),a1
[000373c2] 4e91                      jsr        (a1)
[000373c4] 376b 0028 002e            move.w     40(a3),46(a3)
[000373ca] 376b 002c 0030            move.w     44(a3),48(a3)
[000373d0] 276b 0008 0034            move.l     8(a3),52(a3)
[000373d6] 376b 002a 0032            move.w     42(a3),50(a3)
[000373dc] 2743 0038                 move.l     d3,56(a3)
[000373e0] 026b ff01 0026            andi.w     #$FF01,38(a3)
[000373e6] 6000 0128                 bra        $00037510
[000373ea] 2754 001e                 move.l     (a4),30(a3)
[000373ee] 276c 0004 0022            move.l     4(a4),34(a3)
[000373f4] 6000 011a                 bra        $00037510
[000373f8] 28ab 0008                 move.l     8(a3),(a4)
[000373fc] 6000 0112                 bra        $00037510
[00037400] 2694                      move.l     (a4),(a3)
[00037402] 6000 010c                 bra        $00037510
[00037406] 2754 0004                 move.l     (a4),4(a3)
[0003740a] 6000 0104                 bra        $00037510
[0003740e] 3754 0010                 move.w     (a4),16(a3)
[00037412] 6000 00fc                 bra        $00037510
[00037416] 2754 000c                 move.l     (a4),12(a3)
[0003741a] 6000 00f4                 bra        $00037510
[0003741e] 2754 0008                 move.l     (a4),8(a3)
[00037422] 6000 00ec                 bra        $00037510
[00037426] 200c                      move.l     a4,d0
[00037428] 660c                      bne.s      $00037436
[0003742a] 222b 000c                 move.l     12(a3),d1
[0003742e] d3ab 0008                 add.l      d1,8(a3)
[00037432] 6000 00dc                 bra        $00037510
[00037436] 202b 000c                 move.l     12(a3),d0
[0003743a] 3214                      move.w     (a4),d1
[0003743c] 48c1                      ext.l      d1
[0003743e] 4eb9 0008 3cac            jsr        _lmul
[00037444] d1ab 0008                 add.l      d0,8(a3)
[00037448] 6000 00c6                 bra        $00037510
[0003744c] 200c                      move.l     a4,d0
[0003744e] 660c                      bne.s      $0003745C
[00037450] 222b 000c                 move.l     12(a3),d1
[00037454] 93ab 0008                 sub.l      d1,8(a3)
[00037458] 6000 00b6                 bra        $00037510
[0003745c] 202b 000c                 move.l     12(a3),d0
[00037460] 3214                      move.w     (a4),d1
[00037462] 48c1                      ext.l      d1
[00037464] 4eb9 0008 3cac            jsr        _lmul
[0003746a] 91ab 0008                 sub.l      d0,8(a3)
[0003746e] 6000 00a0                 bra        $00037510
[00037472] 200c                      move.l     a4,d0
[00037474] 660c                      bne.s      $00037482
[00037476] 222b 0004                 move.l     4(a3),d1
[0003747a] d3ab 0008                 add.l      d1,8(a3)
[0003747e] 6000 0090                 bra        $00037510
[00037482] 202b 0004                 move.l     4(a3),d0
[00037486] 3214                      move.w     (a4),d1
[00037488] 48c1                      ext.l      d1
[0003748a] 4eb9 0008 3cac            jsr        _lmul
[00037490] d1ab 0008                 add.l      d0,8(a3)
[00037494] 6000 007a                 bra.w      $00037510
[00037498] 200c                      move.l     a4,d0
[0003749a] 660a                      bne.s      $000374A6
[0003749c] 222b 0004                 move.l     4(a3),d1
[000374a0] 93ab 0008                 sub.l      d1,8(a3)
[000374a4] 606a                      bra.s      $00037510
[000374a6] 202b 0004                 move.l     4(a3),d0
[000374aa] 3214                      move.w     (a4),d1
[000374ac] 48c1                      ext.l      d1
[000374ae] 4eb9 0008 3cac            jsr        _lmul
[000374b4] 91ab 0008                 sub.l      d0,8(a3)
[000374b8] 6056                      bra.s      $00037510
[000374ba] 42ab 0008                 clr.l      8(a3)
[000374be] 6050                      bra.s      $00037510
[000374c0] 2013                      move.l     (a3),d0
[000374c2] 90ab 0004                 sub.l      4(a3),d0
[000374c6] 2740 0008                 move.l     d0,8(a3)
[000374ca] 6044                      bra.s      $00037510
[000374cc] 202b 001e                 move.l     30(a3),d0
[000374d0] 673e                      beq.s      $00037510
[000374d2] 222b 0008                 move.l     8(a3),d1
[000374d6] 6a04                      bpl.s      $000374DC
[000374d8] 42ab 0008                 clr.l      8(a3)
[000374dc] 2613                      move.l     (a3),d3
[000374de] 96ab 0004                 sub.l      4(a3),d3
[000374e2] b6ab 0008                 cmp.l      8(a3),d3
[000374e6] 6c04                      bge.s      $000374EC
[000374e8] 2743 0008                 move.l     d3,8(a3)
[000374ec] 202b 0008                 move.l     8(a3),d0
[000374f0] 206b 0022                 movea.l    34(a3),a0
[000374f4] 226b 001e                 movea.l    30(a3),a1
[000374f8] 4e91                      jsr        (a1)
[000374fa] 2248                      movea.l    a0,a1
[000374fc] 41eb 0012                 lea.l      18(a3),a0
[00037500] 700b                      moveq.l    #11,d0
[00037502] 4eb9 0008 2fd6            jsr        strncpy
[00037508] 6000 fda0                 bra        $000372AA
[0003750c] 4240                      clr.w      d0
[0003750e] 6002                      bra.s      $00037512
[00037510] 7001                      moveq.l    #1,d0
[00037512] 584f                      addq.w     #4,a7
[00037514] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00037518] 4e75                      rts
printval:
[0003751a] 2f03                      move.l     d3,-(a7)
[0003751c] 2f0a                      move.l     a2,-(a7)
[0003751e] 2600                      move.l     d0,d3
[00037520] 45f9 0010 c832            lea.l      text,a2
[00037526] 2f03                      move.l     d3,-(a7)
[00037528] 43f9 000c f1aa            lea.l      $000CF1AA,a1
[0003752e] 204a                      movea.l    a2,a0
[00037530] 4eb9 0008 15ac            jsr        sprintf
[00037536] 584f                      addq.w     #4,a7
[00037538] 204a                      movea.l    a2,a0
[0003753a] 245f                      movea.l    (a7)+,a2
[0003753c] 261f                      move.l     (a7)+,d3
[0003753e] 4e75                      rts
sl_bar:
[00037540] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[00037544] 3a00                      move.w     d0,d5
[00037546] 2268 000c                 movea.l    12(a0),a1
[0003754a] 2469 000c                 movea.l    12(a1),a2
[0003754e] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00037554] 7001                      moveq.l    #1,d0
[00037556] c0a9 0004                 and.l      4(a1),d0
[0003755a] 6714                      beq.s      $00037570
[0003755c] 2253                      movea.l    (a3),a1
[0003755e] 3629 0014                 move.w     20(a1),d3
[00037562] 3828 0016                 move.w     22(a0),d4
[00037566] 3229 0014                 move.w     20(a1),d1
[0003756a] d241                      add.w      d1,d1
[0003756c] 9841                      sub.w      d1,d4
[0003756e] 6016                      bra.s      $00037586
[00037570] 2253                      movea.l    (a3),a1
[00037572] 3629 0012                 move.w     18(a1),d3
[00037576] c7ea 0010                 muls.w     16(a2),d3
[0003757a] 3828 0014                 move.w     20(a0),d4
[0003757e] 3029 0012                 move.w     18(a1),d0
[00037582] e548                      lsl.w      #2,d0
[00037584] 9840                      sub.w      d0,d4
[00037586] 202a 0004                 move.l     4(a2),d0
[0003758a] 3204                      move.w     d4,d1
[0003758c] 48c1                      ext.l      d1
[0003758e] 4eb9 0008 3cac            jsr        _lmul
[00037594] 2212                      move.l     (a2),d1
[00037596] 4eb9 0008 3cf6            jsr        _ldiv
[0003759c] b640                      cmp.w      d0,d3
[0003759e] 6f06                      ble.s      $000375A6
[000375a0] 3200                      move.w     d0,d1
[000375a2] 9243                      sub.w      d3,d1
[000375a4] d841                      add.w      d1,d4
[000375a6] 4a45                      tst.w      d5
[000375a8] 6a02                      bpl.s      $000375AC
[000375aa] 4245                      clr.w      d5
[000375ac] b845                      cmp.w      d5,d4
[000375ae] 6c02                      bge.s      $000375B2
[000375b0] 3a04                      move.w     d4,d5
[000375b2] 2012                      move.l     (a2),d0
[000375b4] 3205                      move.w     d5,d1
[000375b6] 48c1                      ext.l      d1
[000375b8] 4eb9 0008 3cac            jsr        _lmul
[000375be] 3204                      move.w     d4,d1
[000375c0] e241                      asr.w      #1,d1
[000375c2] 48c1                      ext.l      d1
[000375c4] d081                      add.l      d1,d0
[000375c6] 3204                      move.w     d4,d1
[000375c8] 48c1                      ext.l      d1
[000375ca] 4eb9 0008 3cf6            jsr        _ldiv
[000375d0] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[000375d4] 4e75                      rts
Aus_slider:
[000375d6] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[000375da] 4fef ffe6                 lea.l      -26(a7),a7
[000375de] 2079 0010 ee4e            movea.l    ACSblk,a0
[000375e4] 3228 0260                 move.w     608(a0),d1
[000375e8] 48c1                      ext.l      d1
[000375ea] 2001                      move.l     d1,d0
[000375ec] d080                      add.l      d0,d0
[000375ee] d081                      add.l      d1,d0
[000375f0] e788                      lsl.l      #3,d0
[000375f2] 2668 025c                 movea.l    604(a0),a3
[000375f6] d7c0                      adda.l     d0,a3
[000375f8] 2f68 0258 0010            move.l     600(a0),16(a7)
[000375fe] 2f4b 0014                 move.l     a3,20(a7)
[00037602] 2268 0258                 movea.l    600(a0),a1
[00037606] 2069 0018                 movea.l    24(a1),a0
[0003760a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00037610] b1e9 025c                 cmpa.l     604(a1),a0
[00037614] 660e                      bne.s      $00037624
[00037616] 343c 1000                 move.w     #$1000,d2
[0003761a] 8469 0260                 or.w       608(a1),d2
[0003761e] 3f42 0018                 move.w     d2,24(a7)
[00037622] 600c                      bra.s      $00037630
[00037624] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003762a] 3f68 0260 0018            move.w     608(a0),24(a7)
[00037630] 43ef 0010                 lea.l      16(a7),a1
[00037634] 7009                      moveq.l    #9,d0
[00037636] 204b                      movea.l    a3,a0
[00037638] 6100 fb80                 bsr        Auo_slider
[0003763c] 2f6b 000c 000c            move.l     12(a3),12(a7)
[00037642] 206f 000c                 movea.l    12(a7),a0
[00037646] 2a68 000c                 movea.l    12(a0),a5
[0003764a] 7001                      moveq.l    #1,d0
[0003764c] c06d 0026                 and.w      38(a5),d0
[00037650] 6706                      beq.s      $00037658
[00037652] 204b                      movea.l    a3,a0
[00037654] 6100 fa90                 bsr        sl_calc
[00037658] 4def 0008                 lea.l      8(a7),a6
[0003765c] 49ef 000a                 lea.l      10(a7),a4
[00037660] 2f39 000e 692a            move.l     _globl,-(a7)
[00037666] 4856                      pea.l      (a6)
[00037668] 224c                      movea.l    a4,a1
[0003766a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00037670] 3028 0260                 move.w     608(a0),d0
[00037674] 2068 025c                 movea.l    604(a0),a0
[00037678] 4eb9 0007 9d14            jsr        mt_objc_offset
[0003767e] 504f                      addq.w     #8,a7
[00037680] 7001                      moveq.l    #1,d0
[00037682] 206f 000c                 movea.l    12(a7),a0
[00037686] c0a8 0004                 and.l      4(a0),d0
[0003768a] 6704                      beq.s      $00037690
[0003768c] 7601                      moveq.l    #1,d3
[0003768e] 6002                      bra.s      $00037692
[00037690] 4243                      clr.w      d3
[00037692] 4a43                      tst.w      d3
[00037694] 671e                      beq.s      $000376B4
[00037696] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003769c] 3028 0014                 move.w     20(a0),d0
[000376a0] 2268 0258                 movea.l    600(a0),a1
[000376a4] 3829 0036                 move.w     54(a1),d4
[000376a8] d856                      add.w      (a6),d4
[000376aa] 3228 0264                 move.w     612(a0),d1
[000376ae] 9244                      sub.w      d4,d1
[000376b0] 3881                      move.w     d1,(a4)
[000376b2] 601e                      bra.s      $000376D2
[000376b4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000376ba] 3028 0012                 move.w     18(a0),d0
[000376be] d040                      add.w      d0,d0
[000376c0] 2268 0258                 movea.l    600(a0),a1
[000376c4] 3829 0034                 move.w     52(a1),d4
[000376c8] d854                      add.w      (a4),d4
[000376ca] 3228 0262                 move.w     610(a0),d1
[000376ce] 9244                      sub.w      d4,d1
[000376d0] 3881                      move.w     d1,(a4)
[000376d2] 7a01                      moveq.l    #1,d5
[000376d4] 3214                      move.w     (a4),d1
[000376d6] 6b00 0146                 bmi        $0003781E
[000376da] 45ef 0006                 lea.l      6(a7),a2
[000376de] 9154                      sub.w      d0,(a4)
[000376e0] 6a16                      bpl.s      $000376F8
[000376e2] 322b 000a                 move.w     10(a3),d1
[000376e6] c27c 4000                 and.w      #$4000,d1
[000376ea] 6706                      beq.s      $000376F2
[000376ec] 7c0e                      moveq.l    #14,d6
[000376ee] 6000 00da                 bra        $000377CA
[000376f2] 7c0b                      moveq.l    #11,d6
[000376f4] 6000 00da                 bra        $000377D0
[000376f8] 322d 0028                 move.w     40(a5),d1
[000376fc] 9354                      sub.w      d1,(a4)
[000376fe] 6a14                      bpl.s      $00037714
[00037700] 7404                      moveq.l    #4,d2
[00037702] 206f 000c                 movea.l    12(a7),a0
[00037706] c4a8 0004                 and.l      4(a0),d2
[0003770a] 6600 0112                 bne        $0003781E
[0003770e] 7c0d                      moveq.l    #13,d6
[00037710] 6000 00be                 bra        $000377D0
[00037714] 322d 002a                 move.w     42(a5),d1
[00037718] 9354                      sub.w      d1,(a4)
[0003771a] 6a00 008a                 bpl        $000377A6
[0003771e] 3414                      move.w     (a4),d2
[00037720] d441                      add.w      d1,d2
[00037722] d440                      add.w      d0,d2
[00037724] d842                      add.w      d2,d4
[00037726] 4a43                      tst.w      d3
[00037728] 670c                      beq.s      $00037736
[0003772a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00037730] 38a8 0264                 move.w     612(a0),(a4)
[00037734] 600a                      bra.s      $00037740
[00037736] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003773c] 38a8 0262                 move.w     610(a0),(a4)
[00037740] 3014                      move.w     (a4),d0
[00037742] 9044                      sub.w      d4,d0
[00037744] 204b                      movea.l    a3,a0
[00037746] 6100 fdf8                 bsr        sl_bar
[0003774a] 2e80                      move.l     d0,(a7)
[0003774c] b0ad 0008                 cmp.l      8(a5),d0
[00037750] 671e                      beq.s      $00037770
[00037752] 43d7                      lea.l      (a7),a1
[00037754] 204b                      movea.l    a3,a0
[00037756] 7011                      moveq.l    #17,d0
[00037758] 6100 fa60                 bsr        Auo_slider
[0003775c] 93c9                      suba.l     a1,a1
[0003775e] 7069                      moveq.l    #105,d0
[00037760] 204b                      movea.l    a3,a0
[00037762] 6100 fa56                 bsr        Auo_slider
[00037766] 93c9                      suba.l     a1,a1
[00037768] 7005                      moveq.l    #5,d0
[0003776a] 204b                      movea.l    a3,a0
[0003776c] 6100 fa4c                 bsr        Auo_slider
[00037770] 3e14                      move.w     (a4),d7
[00037772] 2f39 000e 692a            move.l     _globl,-(a7)
[00037778] 486f 0008                 pea.l      8(a7)
[0003777c] 4852                      pea.l      (a2)
[0003777e] 224e                      movea.l    a6,a1
[00037780] 204c                      movea.l    a4,a0
[00037782] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00037788] 4fef 000c                 lea.l      12(a7),a7
[0003778c] 4a43                      tst.w      d3
[0003778e] 6702                      beq.s      $00037792
[00037790] 3896                      move.w     (a6),(a4)
[00037792] be54                      cmp.w      (a4),d7
[00037794] 6606                      bne.s      $0003779C
[00037796] 7001                      moveq.l    #1,d0
[00037798] c052                      and.w      (a2),d0
[0003779a] 66d4                      bne.s      $00037770
[0003779c] 7001                      moveq.l    #1,d0
[0003779e] c052                      and.w      (a2),d0
[000377a0] 669e                      bne.s      $00037740
[000377a2] 6000 007a                 bra.w      $0003781E
[000377a6] 302d 002c                 move.w     44(a5),d0
[000377aa] 9154                      sub.w      d0,(a4)
[000377ac] 6a10                      bpl.s      $000377BE
[000377ae] 7204                      moveq.l    #4,d1
[000377b0] 206f 000c                 movea.l    12(a7),a0
[000377b4] c2a8 0004                 and.l      4(a0),d1
[000377b8] 6664                      bne.s      $0003781E
[000377ba] 7c0c                      moveq.l    #12,d6
[000377bc] 6012                      bra.s      $000377D0
[000377be] 302b 000a                 move.w     10(a3),d0
[000377c2] c07c 4000                 and.w      #$4000,d0
[000377c6] 6706                      beq.s      $000377CE
[000377c8] 7c0f                      moveq.l    #15,d6
[000377ca] 4245                      clr.w      d5
[000377cc] 6002                      bra.s      $000377D0
[000377ce] 7c0a                      moveq.l    #10,d6
[000377d0] 2ead 0008                 move.l     8(a5),(a7)
[000377d4] 93c9                      suba.l     a1,a1
[000377d6] 3006                      move.w     d6,d0
[000377d8] 204b                      movea.l    a3,a0
[000377da] 6100 f9de                 bsr        Auo_slider
[000377de] 2017                      move.l     (a7),d0
[000377e0] b0ad 0008                 cmp.l      8(a5),d0
[000377e4] 670a                      beq.s      $000377F0
[000377e6] 93c9                      suba.l     a1,a1
[000377e8] 204b                      movea.l    a3,a0
[000377ea] 7069                      moveq.l    #105,d0
[000377ec] 6100 f9cc                 bsr        Auo_slider
[000377f0] 93c9                      suba.l     a1,a1
[000377f2] 7005                      moveq.l    #5,d0
[000377f4] 204b                      movea.l    a3,a0
[000377f6] 6100 f9c2                 bsr        Auo_slider
[000377fa] 4a45                      tst.w      d5
[000377fc] 6720                      beq.s      $0003781E
[000377fe] 2f39 000e 692a            move.l     _globl,-(a7)
[00037804] 486f 0008                 pea.l      8(a7)
[00037808] 4852                      pea.l      (a2)
[0003780a] 224e                      movea.l    a6,a1
[0003780c] 204c                      movea.l    a4,a0
[0003780e] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00037814] 4fef 000c                 lea.l      12(a7),a7
[00037818] 7001                      moveq.l    #1,d0
[0003781a] c052                      and.w      (a2),d0
[0003781c] 66b2                      bne.s      $000377D0
[0003781e] 4fef 001a                 lea.l      26(a7),a7
[00037822] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[00037826] 4e75                      rts
