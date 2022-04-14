editref_abort:
[0001bb22] 2079 0010 1f12            movea.l    ACSblk,a0
[0001bb28] 2068 0258                 movea.l    600(a0),a0
[0001bb2c] 4eb9 0001 be7c            jsr        $0001BE7C
[0001bb32] 4e75                      rts
editref_ok:
[0001bb34] 2079 0010 1f12            movea.l    ACSblk,a0
[0001bb3a] 2068 0258                 movea.l    600(a0),a0
[0001bb3e] 4eb9 0001 bb56            jsr        $0001BB56
[0001bb44] 2079 0010 1f12            movea.l    ACSblk,a0
[0001bb4a] 2068 0258                 movea.l    600(a0),a0
[0001bb4e] 4eb9 0001 be7c            jsr        $0001BE7C
[0001bb54] 4e75                      rts
acc_eref:
[0001bb56] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001bb5a] 4fef fff4                 lea.l      -12(a7),a7
[0001bb5e] 2250                      movea.l    (a0),a1
[0001bb60] 2451                      movea.l    (a1),a2
[0001bb62] 006a 0001 0006            ori.w      #$0001,6(a2)
[0001bb68] 2468 0014                 movea.l    20(a0),a2
[0001bb6c] 45ea 0150                 lea.l      336(a2),a2
[0001bb70] 2f4a 0004                 move.l     a2,4(a7)
[0001bb74] 2669 0004                 movea.l    4(a1),a3
[0001bb78] 302b 0038                 move.w     56(a3),d0
[0001bb7c] 3200                      move.w     d0,d1
[0001bb7e] c27c fd00                 and.w      #$FD00,d1
[0001bb82] 343c 00ff                 move.w     #$00FF,d2
[0001bb86] c46a 000e                 and.w      14(a2),d2
[0001bb8a] 8242                      or.w       d2,d1
[0001bb8c] 3741 0038                 move.w     d1,56(a3)
[0001bb90] 7001                      moveq.l    #1,d0
[0001bb92] 2468 0014                 movea.l    20(a0),a2
[0001bb96] c06a 0052                 and.w      82(a2),d0
[0001bb9a] 6706                      beq.s      $0001BBA2
[0001bb9c] 006b 0200 0038            ori.w      #$0200,56(a3)
[0001bba2] 2469 0008                 movea.l    8(a1),a2
[0001bba6] 200a                      move.l     a2,d0
[0001bba8] 6700 007c                 beq.w      $0001BC26
[0001bbac] 43ef 0008                 lea.l      8(a7),a1
[0001bbb0] 204a                      movea.l    a2,a0
[0001bbb2] 286a 0004                 movea.l    4(a2),a4
[0001bbb6] 303c 00cf                 move.w     #$00CF,d0
[0001bbba] 4e94                      jsr        (a4)
[0001bbbc] 202f 0008                 move.l     8(a7),d0
[0001bbc0] 6f4c                      ble.s      $0001BC0E
[0001bbc2] 7001                      moveq.l    #1,d0
[0001bbc4] d0af 0008                 add.l      8(a7),d0
[0001bbc8] 4eb9 0004 7cc8            jsr        Ax_malloc
[0001bbce] 2e88                      move.l     a0,(a7)
[0001bbd0] 2008                      move.l     a0,d0
[0001bbd2] 6752                      beq.s      $0001BC26
[0001bbd4] 206b 0004                 movea.l    4(a3),a0
[0001bbd8] 4eb9 0004 7d6c            jsr        $00047D6C
[0001bbde] 2257                      movea.l    (a7),a1
[0001bbe0] 303c 00ce                 move.w     #$00CE,d0
[0001bbe4] 204a                      movea.l    a2,a0
[0001bbe6] 286a 0004                 movea.l    4(a2),a4
[0001bbea] 4e94                      jsr        (a4)
[0001bbec] 2757 0004                 move.l     (a7),4(a3)
[0001bbf0] 7001                      moveq.l    #1,d0
[0001bbf2] d0af 0008                 add.l      8(a7),d0
[0001bbf6] 2740 000e                 move.l     d0,14(a3)
[0001bbfa] 2740 000a                 move.l     d0,10(a3)
[0001bbfe] 93c9                      suba.l     a1,a1
[0001bc00] 204a                      movea.l    a2,a0
[0001bc02] 286a 0004                 movea.l    4(a2),a4
[0001bc06] 303c 00d3                 move.w     #$00D3,d0
[0001bc0a] 4e94                      jsr        (a4)
[0001bc0c] 6018                      bra.s      $0001BC26
[0001bc0e] 206b 0004                 movea.l    4(a3),a0
[0001bc12] 4eb9 0004 7d6c            jsr        $00047D6C
[0001bc18] 42ab 0004                 clr.l      4(a3)
[0001bc1c] 7000                      moveq.l    #0,d0
[0001bc1e] 2740 000e                 move.l     d0,14(a3)
[0001bc22] 2740 000a                 move.l     d0,10(a3)
[0001bc26] 4fef 000c                 lea.l      12(a7),a7
[0001bc2a] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001bc2e] 4e75                      rts
rf_make:
[0001bc30] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001bc34] 594f                      subq.w     #4,a7
[0001bc36] 2e88                      move.l     a0,(a7)
[0001bc38] 2668 0004                 movea.l    4(a0),a3
[0001bc3c] 286b 0012                 movea.l    18(a3),a4
[0001bc40] 200c                      move.l     a4,d0
[0001bc42] 670c                      beq.s      $0001BC50
[0001bc44] 204c                      movea.l    a4,a0
[0001bc46] 4eb9 0004 f0ca            jsr        $0004F0CA
[0001bc4c] 6000 00a6                 bra        $0001BCF4
[0001bc50] 700c                      moveq.l    #12,d0
[0001bc52] 4eb9 0004 7cc8            jsr        Ax_malloc
[0001bc58] 2448                      movea.l    a0,a2
[0001bc5a] 200a                      move.l     a2,d0
[0001bc5c] 6700 0092                 beq        $0001BCF0
[0001bc60] 2257                      movea.l    (a7),a1
[0001bc62] 2091                      move.l     (a1),(a0)
[0001bc64] 2569 0004 0004            move.l     4(a1),4(a2)
[0001bc6a] 42aa 0008                 clr.l      8(a2)
[0001bc6e] 41eb 0016                 lea.l      22(a3),a0
[0001bc72] 23c8 0009 ea8c            move.l     a0,$0009EA8C
[0001bc78] 2279 0009 ea98            movea.l    $0009EA98,a1
[0001bc7e] 2348 0008                 move.l     a0,8(a1)
[0001bc82] 41f9 0009 ea3e            lea.l      $0009EA3E,a0
[0001bc88] 4eb9 0004 f41a            jsr        $0004F41A
[0001bc8e] 2848                      movea.l    a0,a4
[0001bc90] 200c                      move.l     a4,d0
[0001bc92] 660a                      bne.s      $0001BC9E
[0001bc94] 204a                      movea.l    a2,a0
[0001bc96] 4eb9 0004 7e26            jsr        $00047E26
[0001bc9c] 6052                      bra.s      $0001BCF0
[0001bc9e] 2057                      movea.l    (a7),a0
[0001bca0] 2250                      movea.l    (a0),a1
[0001bca2] 4869 0168                 pea.l      360(a1)
[0001bca6] 43eb 003a                 lea.l      58(a3),a1
[0001bcaa] 204c                      movea.l    a4,a0
[0001bcac] 4eb9 0001 47a8            jsr        $000147A8
[0001bcb2] 584f                      addq.w     #4,a7
[0001bcb4] 288a                      move.l     a2,(a4)
[0001bcb6] 274c 0012                 move.l     a4,18(a3)
[0001bcba] 204c                      movea.l    a4,a0
[0001bcbc] 4eb9 0001 be1e            jsr        $0001BE1E
[0001bcc2] 202b 000e                 move.l     14(a3),d0
[0001bcc6] 6f14                      ble.s      $0001BCDC
[0001bcc8] 322b 0038                 move.w     56(a3),d1
[0001bccc] c27c 0200                 and.w      #$0200,d1
[0001bcd0] 660a                      bne.s      $0001BCDC
[0001bcd2] 204c                      movea.l    a4,a0
[0001bcd4] 4eb9 0001 bf18            jsr        $0001BF18
[0001bcda] 6018                      bra.s      $0001BCF4
[0001bcdc] 204c                      movea.l    a4,a0
[0001bcde] 226c 000c                 movea.l    12(a4),a1
[0001bce2] 4e91                      jsr        (a1)
[0001bce4] 4a40                      tst.w      d0
[0001bce6] 670c                      beq.s      $0001BCF4
[0001bce8] 204c                      movea.l    a4,a0
[0001bcea] 4eb9 0001 be7c            jsr        $0001BE7C
[0001bcf0] 91c8                      suba.l     a0,a0
[0001bcf2] 6002                      bra.s      $0001BCF6
[0001bcf4] 204c                      movea.l    a4,a0
[0001bcf6] 584f                      addq.w     #4,a7
[0001bcf8] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001bcfc] 4e75                      rts
rf_service:
[0001bcfe] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001bd02] 2448                      movea.l    a0,a2
[0001bd04] 3600                      move.w     d0,d3
[0001bd06] 2849                      movea.l    a1,a4
[0001bd08] 2650                      movea.l    (a0),a3
[0001bd0a] 5540                      subq.w     #2,d0
[0001bd0c] 6712                      beq.s      $0001BD20
[0001bd0e] 907c 00cf                 sub.w      #$00CF,d0
[0001bd12] 6712                      beq.s      $0001BD26
[0001bd14] 5340                      subq.w     #1,d0
[0001bd16] 6708                      beq.s      $0001BD20
[0001bd18] 907c 263e                 sub.w      #$263E,d0
[0001bd1c] 6712                      beq.s      $0001BD30
[0001bd1e] 601e                      bra.s      $0001BD3E
[0001bd20] 204a                      movea.l    a2,a0
[0001bd22] 6100 fe32                 bsr        $0001BB56
[0001bd26] 204a                      movea.l    a2,a0
[0001bd28] 4eb9 0001 be7c            jsr        $0001BE7C
[0001bd2e] 601c                      bra.s      $0001BD4C
[0001bd30] 226b 0004                 movea.l    4(a3),a1
[0001bd34] 204a                      movea.l    a2,a0
[0001bd36] 4eb9 0001 45a2            jsr        $000145A2
[0001bd3c] 600e                      bra.s      $0001BD4C
[0001bd3e] 224c                      movea.l    a4,a1
[0001bd40] 3003                      move.w     d3,d0
[0001bd42] 204a                      movea.l    a2,a0
[0001bd44] 4eb9 0005 1276            jsr        $00051276
[0001bd4a] 6002                      bra.s      $0001BD4E
[0001bd4c] 7001                      moveq.l    #1,d0
[0001bd4e] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001bd52] 4e75                      rts
set_type:
[0001bd54] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001bd58] 4fef ffce                 lea.l      -50(a7),a7
[0001bd5c] 2848                      movea.l    a0,a4
[0001bd5e] 2449                      movea.l    a1,a2
[0001bd60] 3600                      move.w     d0,d3
[0001bd62] 43d7                      lea.l      (a7),a1
[0001bd64] 204a                      movea.l    a2,a0
[0001bd66] 4eb9 0004 b154            jsr        $0004B154
[0001bd6c] 47d7                      lea.l      (a7),a3
[0001bd6e] 6002                      bra.s      $0001BD72
[0001bd70] 524b                      addq.w     #1,a3
[0001bd72] 0c13 0020                 cmpi.b     #$20,(a3)
[0001bd76] 67f8                      beq.s      $0001BD70
[0001bd78] 224b                      movea.l    a3,a1
[0001bd7a] 700d                      moveq.l    #13,d0
[0001bd7c] 204c                      movea.l    a4,a0
[0001bd7e] 4eb9 0004 afe0            jsr        $0004AFE0
[0001bd84] 49ec 0150                 lea.l      336(a4),a4
[0001bd88] 3203                      move.w     d3,d1
[0001bd8a] 48c1                      ext.l      d1
[0001bd8c] 2001                      move.l     d1,d0
[0001bd8e] d080                      add.l      d0,d0
[0001bd90] d081                      add.l      d1,d0
[0001bd92] e788                      lsl.l      #3,d0
[0001bd94] 41f2 0818                 lea.l      24(a2,d0.l),a0
[0001bd98] 2968 000c 000c            move.l     12(a0),12(a4)
[0001bd9e] 4fef 0032                 lea.l      50(a7),a7
[0001bda2] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001bda6] 4e75                      rts
editref_choose:
[0001bda8] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0001bdac] 45f9 0009 dd36            lea.l      $0009DD36,a2
[0001bdb2] 47f9 0010 1f12            lea.l      ACSblk,a3
[0001bdb8] 72ff                      moveq.l    #-1,d1
[0001bdba] 70ff                      moveq.l    #-1,d0
[0001bdbc] 224a                      movea.l    a2,a1
[0001bdbe] 2053                      movea.l    (a3),a0
[0001bdc0] 2068 0258                 movea.l    600(a0),a0
[0001bdc4] 4eb9 0004 948a            jsr        $0004948A
[0001bdca] 3600                      move.w     d0,d3
[0001bdcc] 4a40                      tst.w      d0
[0001bdce] 6b48                      bmi.s      $0001BE18
[0001bdd0] 48c0                      ext.l      d0
[0001bdd2] 2200                      move.l     d0,d1
[0001bdd4] d281                      add.l      d1,d1
[0001bdd6] d280                      add.l      d0,d1
[0001bdd8] e789                      lsl.l      #3,d1
[0001bdda] 41f2 1818                 lea.l      24(a2,d1.l),a0
[0001bdde] b67c 0001                 cmp.w      #$0001,d3
[0001bde2] 6710                      beq.s      $0001BDF4
[0001bde4] 3428 0008                 move.w     8(a0),d2
[0001bde8] c47c 8000                 and.w      #$8000,d2
[0001bdec] 672a                      beq.s      $0001BE18
[0001bdee] 3228 000e                 move.w     14(a0),d1
[0001bdf2] 6724                      beq.s      $0001BE18
[0001bdf4] 3003                      move.w     d3,d0
[0001bdf6] 224a                      movea.l    a2,a1
[0001bdf8] 2053                      movea.l    (a3),a0
[0001bdfa] 2068 025c                 movea.l    604(a0),a0
[0001bdfe] 6100 ff54                 bsr        $0001BD54
[0001be02] 72ff                      moveq.l    #-1,d1
[0001be04] 700d                      moveq.l    #13,d0
[0001be06] 2053                      movea.l    (a3),a0
[0001be08] 2068 0258                 movea.l    600(a0),a0
[0001be0c] 2253                      movea.l    (a3),a1
[0001be0e] 2469 0258                 movea.l    600(a1),a2
[0001be12] 226a 0066                 movea.l    102(a2),a1
[0001be16] 4e91                      jsr        (a1)
[0001be18] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0001be1c] 4e75                      rts
set_eref:
[0001be1e] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0001be22] 2448                      movea.l    a0,a2
[0001be24] 2650                      movea.l    (a0),a3
[0001be26] 226b 0004                 movea.l    4(a3),a1
[0001be2a] 3629 0038                 move.w     56(a1),d3
[0001be2e] c67c 00ff                 and.w      #$00FF,d3
[0001be32] 4a43                      tst.w      d3
[0001be34] 6b08                      bmi.s      $0001BE3E
[0001be36] b679 0009 eb2c            cmp.w      $0009EB2C,d3
[0001be3c] 6d02                      blt.s      $0001BE40
[0001be3e] 4243                      clr.w      d3
[0001be40] 3203                      move.w     d3,d1
[0001be42] d241                      add.w      d1,d1
[0001be44] 41f9 0009 eae0            lea.l      $0009EAE0,a0
[0001be4a] 3030 1000                 move.w     0(a0,d1.w),d0
[0001be4e] 43f9 0009 dd36            lea.l      $0009DD36,a1
[0001be54] 206a 0014                 movea.l    20(a2),a0
[0001be58] 6100 fefa                 bsr        $0001BD54
[0001be5c] 206a 0014                 movea.l    20(a2),a0
[0001be60] 41e8 0048                 lea.l      72(a0),a0
[0001be64] 226b 0004                 movea.l    4(a3),a1
[0001be68] 3029 0038                 move.w     56(a1),d0
[0001be6c] c07c 0200                 and.w      #$0200,d0
[0001be70] 4eb9 0001 3f6e            jsr        $00013F6E
[0001be76] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0001be7a] 4e75                      rts
term:
[0001be7c] 48e7 003c                 movem.l    a2-a5,-(a7)
[0001be80] 2448                      movea.l    a0,a2
[0001be82] 302a 0056                 move.w     86(a2),d0
[0001be86] c07c 0200                 and.w      #$0200,d0
[0001be8a] 6600 0086                 bne        $0001BF12
[0001be8e] 006a 0300 0056            ori.w      #$0300,86(a2)
[0001be94] 2650                      movea.l    (a0),a3
[0001be96] 286b 0008                 movea.l    8(a3),a4
[0001be9a] 200c                      move.l     a4,d0
[0001be9c] 6728                      beq.s      $0001BEC6
[0001be9e] 93c9                      suba.l     a1,a1
[0001bea0] 2a6c 0004                 movea.l    4(a4),a5
[0001bea4] 204c                      movea.l    a4,a0
[0001bea6] 303c 00d3                 move.w     #$00D3,d0
[0001beaa] 4e95                      jsr        (a5)
[0001beac] 93c9                      suba.l     a1,a1
[0001beae] 303c 00d0                 move.w     #$00D0,d0
[0001beb2] 204c                      movea.l    a4,a0
[0001beb4] 2a6c 0004                 movea.l    4(a4),a5
[0001beb8] 4e95                      jsr        (a5)
[0001beba] 93c9                      suba.l     a1,a1
[0001bebc] 7002                      moveq.l    #2,d0
[0001bebe] 204c                      movea.l    a4,a0
[0001bec0] 2a6c 0004                 movea.l    4(a4),a5
[0001bec4] 4e95                      jsr        (a5)
[0001bec6] 206b 0004                 movea.l    4(a3),a0
[0001beca] 42a8 0012                 clr.l      18(a0)
[0001bece] 302a 0056                 move.w     86(a2),d0
[0001bed2] c07c 0800                 and.w      #$0800,d0
[0001bed6] 6716                      beq.s      $0001BEEE
[0001bed8] 43ea 002c                 lea.l      44(a2),a1
[0001bedc] 206b 0004                 movea.l    4(a3),a0
[0001bee0] 41e8 003a                 lea.l      58(a0),a0
[0001bee4] 7008                      moveq.l    #8,d0
[0001bee6] 4eb9 0007 6f44            jsr        $00076F44
[0001beec] 6014                      bra.s      $0001BF02
[0001beee] 7008                      moveq.l    #8,d0
[0001bef0] 43ea 0024                 lea.l      36(a2),a1
[0001bef4] 206b 0004                 movea.l    4(a3),a0
[0001bef8] 41e8 003a                 lea.l      58(a0),a0
[0001befc] 4eb9 0007 6f44            jsr        $00076F44
[0001bf02] 204b                      movea.l    a3,a0
[0001bf04] 4eb9 0004 7e26            jsr        $00047E26
[0001bf0a] 204a                      movea.l    a2,a0
[0001bf0c] 4eb9 0005 0330            jsr        $00050330
[0001bf12] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0001bf16] 4e75                      rts
ref_edit:
[0001bf18] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[0001bf1c] 4fef fbb4                 lea.l      -1100(a7),a7
[0001bf20] 2f48 0448                 move.l     a0,1096(a7)
[0001bf24] 2450                      movea.l    (a0),a2
[0001bf26] 266a 0008                 movea.l    8(a2),a3
[0001bf2a] 200b                      move.l     a3,d0
[0001bf2c] 6600 017c                 bne        $0001C0AA
[0001bf30] 286a 0004                 movea.l    4(a2),a4
[0001bf34] 43ec 0016                 lea.l      22(a4),a1
[0001bf38] 2f49 0440                 move.l     a1,1088(a7)
[0001bf3c] 2279 000c 70be            movea.l    $000C70BE,a1
[0001bf42] 91c8                      suba.l     a0,a0
[0001bf44] 4e91                      jsr        (a1)
[0001bf46] 2648                      movea.l    a0,a3
[0001bf48] 2548 0008                 move.l     a0,8(a2)
[0001bf4c] 226f 0448                 movea.l    1096(a7),a1
[0001bf50] 303c 00d0                 move.w     #$00D0,d0
[0001bf54] 2a6b 0004                 movea.l    4(a3),a5
[0001bf58] 204b                      movea.l    a3,a0
[0001bf5a] 4e95                      jsr        (a5)
[0001bf5c] 4bef 0400                 lea.l      1024(a7),a5
[0001bf60] 43f9 000a 070b            lea.l      $000A070B,a1
[0001bf66] 2f09                      move.l     a1,-(a7)
[0001bf68] 43f9 000a 0709            lea.l      $000A0709,a1
[0001bf6e] 204d                      movea.l    a5,a0
[0001bf70] 4eb9 0007 6950            jsr        $00076950
[0001bf76] 226f 0444                 movea.l    1092(a7),a1
[0001bf7a] 4eb9 0007 6886            jsr        $00076886
[0001bf80] 225f                      movea.l    (a7)+,a1
[0001bf82] 4eb9 0007 6886            jsr        $00076886
[0001bf88] 224d                      movea.l    a5,a1
[0001bf8a] 303c 00cb                 move.w     #$00CB,d0
[0001bf8e] 204b                      movea.l    a3,a0
[0001bf90] 2c6b 0004                 movea.l    4(a3),a6
[0001bf94] 4e96                      jsr        (a6)
[0001bf96] 43f9 000a 070b            lea.l      $000A070B,a1
[0001bf9c] 2f09                      move.l     a1,-(a7)
[0001bf9e] 43f9 000a 0713            lea.l      $000A0713,a1
[0001bfa4] 204d                      movea.l    a5,a0
[0001bfa6] 4eb9 0007 6950            jsr        $00076950
[0001bfac] 226f 0444                 movea.l    1092(a7),a1
[0001bfb0] 4eb9 0007 6886            jsr        $00076886
[0001bfb6] 225f                      movea.l    (a7)+,a1
[0001bfb8] 4eb9 0007 6886            jsr        $00076886
[0001bfbe] 224d                      movea.l    a5,a1
[0001bfc0] 303c 00cc                 move.w     #$00CC,d0
[0001bfc4] 204b                      movea.l    a3,a0
[0001bfc6] 2c6b 0004                 movea.l    4(a3),a6
[0001bfca] 4e96                      jsr        (a6)
[0001bfcc] 226f 0440                 movea.l    1088(a7),a1
[0001bfd0] 303c 00d5                 move.w     #$00D5,d0
[0001bfd4] 204b                      movea.l    a3,a0
[0001bfd6] 2a6b 0004                 movea.l    4(a3),a5
[0001bfda] 4e95                      jsr        (a5)
[0001bfdc] 43f9 000a 0717            lea.l      $000A0717,a1
[0001bfe2] 303c 00c9                 move.w     #$00C9,d0
[0001bfe6] 204b                      movea.l    a3,a0
[0001bfe8] 2a6b 0004                 movea.l    4(a3),a5
[0001bfec] 4e95                      jsr        (a5)
[0001bfee] 202c 000e                 move.l     14(a4),d0
[0001bff2] 6f14                      ble.s      $0001C008
[0001bff4] 226c 0004                 movea.l    4(a4),a1
[0001bff8] 204b                      movea.l    a3,a0
[0001bffa] 2a6b 0004                 movea.l    4(a3),a5
[0001bffe] 303c 00cd                 move.w     #$00CD,d0
[0001c002] 4e95                      jsr        (a5)
[0001c004] 6000 0088                 bra        $0001C08E
[0001c008] 2052                      movea.l    (a2),a0
[0001c00a] 3028 020e                 move.w     526(a0),d0
[0001c00e] 4a40                      tst.w      d0
[0001c010] 6706                      beq.s      $0001C018
[0001c012] 5340                      subq.w     #1,d0
[0001c014] 672a                      beq.s      $0001C040
[0001c016] 602e                      bra.s      $0001C046
[0001c018] 302c 0038                 move.w     56(a4),d0
[0001c01c] c07c 0500                 and.w      #$0500,d0
[0001c020] b07c 0100                 cmp.w      #$0100,d0
[0001c024] 6712                      beq.s      $0001C038
[0001c026] 43f9 000a 0719            lea.l      $000A0719,a1
[0001c02c] 204b                      movea.l    a3,a0
[0001c02e] 246b 0004                 movea.l    4(a3),a2
[0001c032] 303c 00cd                 move.w     #$00CD,d0
[0001c036] 4e92                      jsr        (a2)
[0001c038] 4bf9 0009 ebbe            lea.l      $0009EBBE,a5
[0001c03e] 6006                      bra.s      $0001C046
[0001c040] 4bf9 0009 eb2e            lea.l      $0009EB2E,a5
[0001c046] 2079 0010 1f12            movea.l    ACSblk,a0
[0001c04c] 2268 025c                 movea.l    604(a0),a1
[0001c050] 43e9 0150                 lea.l      336(a1),a1
[0001c054] 2f49 0444                 move.l     a1,1092(a7)
[0001c058] 3629 000e                 move.w     14(a1),d3
[0001c05c] 486c 0016                 pea.l      22(a4)
[0001c060] 486c 0016                 pea.l      22(a4)
[0001c064] 486c 0016                 pea.l      22(a4)
[0001c068] 3003                      move.w     d3,d0
[0001c06a] 48c0                      ext.l      d0
[0001c06c] e588                      lsl.l      #2,d0
[0001c06e] 2275 0800                 movea.l    0(a5,d0.l),a1
[0001c072] 41ef 000c                 lea.l      12(a7),a0
[0001c076] 4eb9 0007 5680            jsr        $00075680
[0001c07c] 4fef 000c                 lea.l      12(a7),a7
[0001c080] 43d7                      lea.l      (a7),a1
[0001c082] 303c 00cd                 move.w     #$00CD,d0
[0001c086] 204b                      movea.l    a3,a0
[0001c088] 246b 0004                 movea.l    4(a3),a2
[0001c08c] 4e92                      jsr        (a2)
[0001c08e] 93c9                      suba.l     a1,a1
[0001c090] 303c 00d4                 move.w     #$00D4,d0
[0001c094] 204b                      movea.l    a3,a0
[0001c096] 246b 0004                 movea.l    4(a3),a2
[0001c09a] 4e92                      jsr        (a2)
[0001c09c] 93c9                      suba.l     a1,a1
[0001c09e] 303c 00d3                 move.w     #$00D3,d0
[0001c0a2] 204b                      movea.l    a3,a0
[0001c0a4] 246b 0004                 movea.l    4(a3),a2
[0001c0a8] 4e92                      jsr        (a2)
[0001c0aa] 204b                      movea.l    a3,a0
[0001c0ac] 4eb9 0004 f0ca            jsr        $0004F0CA
[0001c0b2] 4fef 044c                 lea.l      1100(a7),a7
[0001c0b6] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[0001c0ba] 4e75                      rts
editref_edit:
[0001c0bc] 2079 0010 1f12            movea.l    ACSblk,a0
[0001c0c2] 2068 0258                 movea.l    600(a0),a0
[0001c0c6] 6100 fe50                 bsr        $0001BF18
[0001c0ca] 4e75                      rts
