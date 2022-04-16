p_string:
[0001b85a] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001b85e] 514f                      subq.w     #8,a7
[0001b860] 2648                      movea.l    a0,a3
[0001b862] 1600                      move.b     d0,d3
[0001b864] 43f9 000a 65c0            lea.l      $000A65C0,a1
[0001b86a] 41d7                      lea.l      (a7),a0
[0001b86c] 10d9                      move.b     (a1)+,(a0)+
[0001b86e] 10d9                      move.b     (a1)+,(a0)+
[0001b870] 10d9                      move.b     (a1)+,(a0)+
[0001b872] 10d9                      move.b     (a1)+,(a0)+
[0001b874] 45f9 000a 65e4            lea.l      $000A65E4,a2
[0001b87a] 204a                      movea.l    a2,a0
[0001b87c] 4eb9 0001 8374            jsr        save_string
[0001b882] 49ef 0004                 lea.l      4(a7),a4
[0001b886] 6000 009c                 bra        p_string_1
p_string_6:
[0001b88a] 1013                      move.b     (a3),d0
[0001b88c] 4880                      ext.w      d0
[0001b88e] 5f40                      subq.w     #7,d0
[0001b890] b07c 0020                 cmp.w      #$0020,d0
[0001b894] 6270                      bhi.s      p_string_2
[0001b896] d040                      add.w      d0,d0
[0001b898] 303b 0006                 move.w     $0001B8A0(pc,d0.w),d0
[0001b89c] 4efb 0002                 jmp        $0001B8A0(pc,d0.w)
J6:
[0001b8a0] 0042                      dc.w $0042   ; p_string_3-J6
[0001b8a2] 0042                      dc.w $0042   ; p_string_3-J6
[0001b8a4] 0042                      dc.w $0042   ; p_string_3-J6
[0001b8a6] 0042                      dc.w $0042   ; p_string_3-J6
[0001b8a8] 0042                      dc.w $0042   ; p_string_3-J6
[0001b8aa] 0042                      dc.w $0042   ; p_string_3-J6
[0001b8ac] 0042                      dc.w $0042   ; p_string_3-J6
[0001b8ae] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8b0] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8b2] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8b4] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8b6] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8b8] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8ba] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8bc] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8be] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8c0] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8c2] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8c4] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8c6] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8c8] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8ca] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8cc] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8ce] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8d0] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8d2] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8d4] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8d6] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8d8] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8da] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8dc] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8de] 0066                      dc.w $0066   ; p_string_2-J6
[0001b8e0] 0058                      dc.w $0058   ; p_string_4-J6
p_string_3:
[0001b8e2] 1013                      move.b     (a3),d0
[0001b8e4] 4880                      ext.w      d0
[0001b8e6] 3f00                      move.w     d0,-(a7)
[0001b8e8] 43ea 0002                 lea.l      2(a2),a1
[0001b8ec] 204c                      movea.l    a4,a0
[0001b8ee] 4eb9 0008 15ac            jsr        sprintf
[0001b8f4] 544f                      addq.w     #2,a7
[0001b8f6] 6022                      bra.s      p_string_5
p_string_4:
[0001b8f8] 43ea 0008                 lea.l      8(a2),a1
[0001b8fc] 204c                      movea.l    a4,a0
[0001b8fe] 4eb9 0008 2f0c            jsr        strcpy
[0001b904] 6014                      bra.s      p_string_5
p_string_2:
[0001b906] 1013                      move.b     (a3),d0
[0001b908] 4880                      ext.w      d0
[0001b90a] 3f00                      move.w     d0,-(a7)
[0001b90c] 43ea 000b                 lea.l      11(a2),a1
[0001b910] 204c                      movea.l    a4,a0
[0001b912] 4eb9 0008 15ac            jsr        sprintf
[0001b918] 544f                      addq.w     #2,a7
p_string_5:
[0001b91a] 204c                      movea.l    a4,a0
[0001b91c] 4eb9 0001 8374            jsr        save_string
[0001b922] 524b                      addq.w     #1,a3
p_string_1:
[0001b924] 1013                      move.b     (a3),d0
[0001b926] 6600 ff62                 bne        p_string_6
[0001b92a] 41ea 000e                 lea.l      14(a2),a0
[0001b92e] 4eb9 0001 8374            jsr        save_string
[0001b934] 1e83                      move.b     d3,(a7)
[0001b936] 41d7                      lea.l      (a7),a0
[0001b938] 4eb9 0001 8374            jsr        save_string
[0001b93e] 504f                      addq.w     #8,a7
[0001b940] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001b944] 4e75                      rts

out_label:
[0001b946] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001b94a] 2448                      movea.l    a0,a2
[0001b94c] 2849                      movea.l    a1,a4
[0001b94e] 200a                      move.l     a2,d0
[0001b950] 6724                      beq.s      out_label_1
[0001b952] 47f9 0010 7f66            lea.l      iostring,a3
[0001b958] 486a 0016                 pea.l      22(a2)
[0001b95c] 43f9 000a 65f6            lea.l      $000A65F6,a1
[0001b962] 204b                      movea.l    a3,a0
[0001b964] 4eb9 0008 15ac            jsr        sprintf
[0001b96a] 584f                      addq.w     #4,a7
[0001b96c] 204b                      movea.l    a3,a0
[0001b96e] 4eb9 0001 8374            jsr        save_string
[0001b974] 6008                      bra.s      out_label_2
out_label_1:
[0001b976] 204c                      movea.l    a4,a0
[0001b978] 4eb9 0001 8374            jsr        save_string
out_label_2:
[0001b97e] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001b982] 4e75                      rts

out_label2:
[0001b984] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001b988] 2448                      movea.l    a0,a2
[0001b98a] 2849                      movea.l    a1,a4
[0001b98c] 200a                      move.l     a2,d0
[0001b98e] 6724                      beq.s      out_label2_1
[0001b990] 47f9 0010 7f66            lea.l      iostring,a3
[0001b996] 486a 0016                 pea.l      22(a2)
[0001b99a] 43f9 000a 65f9            lea.l      $000A65F9,a1
[0001b9a0] 204b                      movea.l    a3,a0
[0001b9a2] 4eb9 0008 15ac            jsr        sprintf
[0001b9a8] 584f                      addq.w     #4,a7
[0001b9aa] 204b                      movea.l    a3,a0
[0001b9ac] 4eb9 0001 8374            jsr        save_string
[0001b9b2] 6008                      bra.s      out_label2_2
out_label2_1:
[0001b9b4] 204c                      movea.l    a4,a0
[0001b9b6] 4eb9 0001 8374            jsr        save_string
out_label2_2:
[0001b9bc] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001b9c0] 4e75                      rts

out_label3:
[0001b9c2] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001b9c6] 2448                      movea.l    a0,a2
[0001b9c8] 2849                      movea.l    a1,a4
[0001b9ca] 200a                      move.l     a2,d0
[0001b9cc] 6724                      beq.s      out_label3_1
[0001b9ce] 47f9 0010 7f66            lea.l      iostring,a3
[0001b9d4] 486a 0016                 pea.l      22(a2)
[0001b9d8] 43f9 000a 65fd            lea.l      $000A65FD,a1
[0001b9de] 204b                      movea.l    a3,a0
[0001b9e0] 4eb9 0008 15ac            jsr        sprintf
[0001b9e6] 584f                      addq.w     #4,a7
[0001b9e8] 204b                      movea.l    a3,a0
[0001b9ea] 4eb9 0001 8374            jsr        save_string
[0001b9f0] 6008                      bra.s      out_label3_2
out_label3_1:
[0001b9f2] 204c                      movea.l    a4,a0
[0001b9f4] 4eb9 0001 8374            jsr        save_string
out_label3_2:
[0001b9fa] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001b9fe] 4e75                      rts

out_refs:
[0001ba00] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[0001ba04] 2068 003c                 movea.l    60(a0),a0
[0001ba08] 2628 000e                 move.l     14(a0),d3
[0001ba0c] e48b                      lsr.l      #2,d3
[0001ba0e] 4a43                      tst.w      d3
[0001ba10] 6f00 0080                 ble        out_refs_1
[0001ba14] 2468 0004                 movea.l    4(a0),a2
[0001ba18] 47f9 000a 65e4            lea.l      $000A65E4,a3
[0001ba1e] 41eb 0023                 lea.l      35(a3),a0
[0001ba22] 4eb9 0001 8374            jsr        save_string
[0001ba28] 4244                      clr.w      d4
[0001ba2a] 4bf9 0010 7f66            lea.l      iostring,a5
[0001ba30] 605c                      bra.s      out_refs_2
out_refs_6:
[0001ba32] 3004                      move.w     d4,d0
[0001ba34] 48c0                      ext.l      d0
[0001ba36] e588                      lsl.l      #2,d0
[0001ba38] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001ba3c] 41ec 0016                 lea.l      22(a4),a0
[0001ba40] 4eb9 0001 9dd0            jsr        info_obj
[0001ba46] 3a2c 0038                 move.w     56(a4),d5
[0001ba4a] 202c 000e                 move.l     14(a4),d0
[0001ba4e] 670c                      beq.s      out_refs_3
[0001ba50] 206c 0004                 movea.l    4(a4),a0
[0001ba54] 4eb9 0001 8374            jsr        save_string
[0001ba5a] 6026                      bra.s      out_refs_4
out_refs_3:
[0001ba5c] 4a05                      tst.b      d5
[0001ba5e] 672c                      beq.s      out_refs_5
[0001ba60] 3005                      move.w     d5,d0
[0001ba62] c07c 0200                 and.w      #$0200,d0
[0001ba66] 6624                      bne.s      out_refs_5
[0001ba68] 486c 0016                 pea.l      22(a4)
[0001ba6c] 43eb 0051                 lea.l      81(a3),a1
[0001ba70] 204d                      movea.l    a5,a0
[0001ba72] 4eb9 0008 15ac            jsr        sprintf
[0001ba78] 584f                      addq.w     #4,a7
[0001ba7a] 204d                      movea.l    a5,a0
[0001ba7c] 4eb9 0001 8374            jsr        save_string
out_refs_4:
[0001ba82] 41eb 004e                 lea.l      78(a3),a0
[0001ba86] 4eb9 0001 8374            jsr        save_string
out_refs_5:
[0001ba8c] 5244                      addq.w     #1,d4
out_refs_2:
[0001ba8e] b644                      cmp.w      d4,d3
[0001ba90] 6ea0                      bgt.s      out_refs_6
out_refs_1:
[0001ba92] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[0001ba96] 4e75                      rts

out_declproto:
[0001ba98] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[0001ba9c] 2648                      movea.l    a0,a3
[0001ba9e] 246b 003c                 movea.l    60(a3),a2
[0001baa2] 262a 000e                 move.l     14(a2),d3
[0001baa6] e48b                      lsr.l      #2,d3
[0001baa8] 4a43                      tst.w      d3
[0001baaa] 6f00 01ee                 ble        out_declproto_1
[0001baae] 206b 003c                 movea.l    60(a3),a0
[0001bab2] 41e8 0016                 lea.l      22(a0),a0
[0001bab6] 4eb9 0001 9d78            jsr        info_list
[0001babc] 246a 0004                 movea.l    4(a2),a2
[0001bac0] 47f9 000a 65e4            lea.l      $000A65E4,a3
[0001bac6] 41eb 0076                 lea.l      118(a3),a0
[0001baca] 4eb9 0001 8374            jsr        save_string
[0001bad0] 4244                      clr.w      d4
[0001bad2] 4bf9 0010 7f66            lea.l      iostring,a5
[0001bad8] 6000 01b0                 bra        out_declproto_2
out_declproto_21:
[0001badc] 3004                      move.w     d4,d0
[0001bade] 48c0                      ext.l      d0
[0001bae0] e588                      lsl.l      #2,d0
[0001bae2] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001bae6] 3a2c 0038                 move.w     56(a4),d5
[0001baea] 3205                      move.w     d5,d1
[0001baec] c27c 0700                 and.w      #$0700,d1
[0001baf0] 6708                      beq.s      out_declproto_3
[0001baf2] b27c 0500                 cmp.w      #$0500,d1
[0001baf6] 6600 0190                 bne        out_declproto_4
out_declproto_3:
[0001bafa] 41ec 0016                 lea.l      22(a4),a0
[0001bafe] 4eb9 0001 9dd0            jsr        info_obj
[0001bb04] 3005                      move.w     d5,d0
[0001bb06] c07c 00ff                 and.w      #$00FF,d0
[0001bb0a] b07c 0018                 cmp.w      #$0018,d0
[0001bb0e] 6200 0156                 bhi        out_declproto_5
[0001bb12] d040                      add.w      d0,d0
[0001bb14] 303b 0006                 move.w     $0001BB1C(pc,d0.w),d0
[0001bb18] 4efb 0002                 jmp        $0001BB1C(pc,d0.w)
J7:
[0001bb1c] 011e                      dc.w $011e   ; out_declproto_6-J7
[0001bb1e] 0032                      dc.w $0032   ; out_declproto_7-J7
[0001bb20] 0032                      dc.w $0032   ; out_declproto_7-J7
[0001bb22] 0048                      dc.w $0048   ; out_declproto_8-J7
[0001bb24] 005e                      dc.w $005e   ; out_declproto_9-J7
[0001bb26] 014a                      dc.w $014a   ; out_declproto_5-J7
[0001bb28] 0074                      dc.w $0074   ; out_declproto_10-J7
[0001bb2a] 008a                      dc.w $008a   ; out_declproto_11-J7
[0001bb2c] 0074                      dc.w $0074   ; out_declproto_10-J7
[0001bb2e] 00a0                      dc.w $00a0   ; out_declproto_12-J7
[0001bb30] 00b6                      dc.w $00b6   ; out_declproto_13-J7
[0001bb32] 00cc                      dc.w $00cc   ; out_declproto_14-J7
[0001bb34] 00e2                      dc.w $00e2   ; out_declproto_15-J7
[0001bb36] 014a                      dc.w $014a   ; out_declproto_5-J7
[0001bb38] 00e2                      dc.w $00e2   ; out_declproto_15-J7
[0001bb3a] 00f6                      dc.w $00f6   ; out_declproto_16-J7
[0001bb3c] 00f6                      dc.w $00f6   ; out_declproto_16-J7
[0001bb3e] 00f6                      dc.w $00f6   ; out_declproto_16-J7
[0001bb40] 00cc                      dc.w $00cc   ; out_declproto_14-J7
[0001bb42] 00cc                      dc.w $00cc   ; out_declproto_14-J7
[0001bb44] 00e2                      dc.w $00e2   ; out_declproto_15-J7
[0001bb46] 010a                      dc.w $010a   ; out_declproto_17-J7
[0001bb48] 0122                      dc.w $0122   ; out_declproto_18-J7
[0001bb4a] 0074                      dc.w $0074   ; out_declproto_10-J7
[0001bb4c] 0136                      dc.w $0136   ; out_declproto_19-J7
out_declproto_7:
[0001bb4e] 486c 0016                 pea.l      22(a4)
[0001bb52] 43eb 0098                 lea.l      152(a3),a1
[0001bb56] 204d                      movea.l    a5,a0
[0001bb58] 4eb9 0008 15ac            jsr        sprintf
[0001bb5e] 584f                      addq.w     #4,a7
[0001bb60] 6000 011e                 bra        out_declproto_20
out_declproto_8:
[0001bb64] 486c 0016                 pea.l      22(a4)
[0001bb68] 43eb 00a8                 lea.l      168(a3),a1
[0001bb6c] 204d                      movea.l    a5,a0
[0001bb6e] 4eb9 0008 15ac            jsr        sprintf
[0001bb74] 584f                      addq.w     #4,a7
[0001bb76] 6000 0108                 bra        out_declproto_20
out_declproto_9:
[0001bb7a] 486c 0016                 pea.l      22(a4)
[0001bb7e] 43eb 00ec                 lea.l      236(a3),a1
[0001bb82] 204d                      movea.l    a5,a0
[0001bb84] 4eb9 0008 15ac            jsr        sprintf
[0001bb8a] 584f                      addq.w     #4,a7
[0001bb8c] 6000 00f2                 bra        out_declproto_20
out_declproto_10:
[0001bb90] 486c 0016                 pea.l      22(a4)
[0001bb94] 43eb 013c                 lea.l      316(a3),a1
[0001bb98] 204d                      movea.l    a5,a0
[0001bb9a] 4eb9 0008 15ac            jsr        sprintf
[0001bba0] 584f                      addq.w     #4,a7
[0001bba2] 6000 00dc                 bra        out_declproto_20
out_declproto_11:
[0001bba6] 486c 0016                 pea.l      22(a4)
[0001bbaa] 43eb 0167                 lea.l      359(a3),a1
[0001bbae] 204d                      movea.l    a5,a0
[0001bbb0] 4eb9 0008 15ac            jsr        sprintf
[0001bbb6] 584f                      addq.w     #4,a7
[0001bbb8] 6000 00c6                 bra        out_declproto_20
out_declproto_12:
[0001bbbc] 486c 0016                 pea.l      22(a4)
[0001bbc0] 43eb 0194                 lea.l      404(a3),a1
[0001bbc4] 204d                      movea.l    a5,a0
[0001bbc6] 4eb9 0008 15ac            jsr        sprintf
[0001bbcc] 584f                      addq.w     #4,a7
[0001bbce] 6000 00b0                 bra        out_declproto_20
out_declproto_13:
[0001bbd2] 486c 0016                 pea.l      22(a4)
[0001bbd6] 43eb 01d5                 lea.l      469(a3),a1
[0001bbda] 204d                      movea.l    a5,a0
[0001bbdc] 4eb9 0008 15ac            jsr        sprintf
[0001bbe2] 584f                      addq.w     #4,a7
[0001bbe4] 6000 009a                 bra        out_declproto_20
out_declproto_14:
[0001bbe8] 486c 0016                 pea.l      22(a4)
[0001bbec] 43eb 020d                 lea.l      525(a3),a1
[0001bbf0] 204d                      movea.l    a5,a0
[0001bbf2] 4eb9 0008 15ac            jsr        sprintf
[0001bbf8] 584f                      addq.w     #4,a7
[0001bbfa] 6000 0084                 bra        out_declproto_20
out_declproto_15:
[0001bbfe] 486c 0016                 pea.l      22(a4)
[0001bc02] 43eb 023f                 lea.l      575(a3),a1
[0001bc06] 204d                      movea.l    a5,a0
[0001bc08] 4eb9 0008 15ac            jsr        sprintf
[0001bc0e] 584f                      addq.w     #4,a7
[0001bc10] 606e                      bra.s      out_declproto_20
out_declproto_16:
[0001bc12] 486c 0016                 pea.l      22(a4)
[0001bc16] 43eb 0261                 lea.l      609(a3),a1
[0001bc1a] 204d                      movea.l    a5,a0
[0001bc1c] 4eb9 0008 15ac            jsr        sprintf
[0001bc22] 584f                      addq.w     #4,a7
[0001bc24] 605a                      bra.s      out_declproto_20
out_declproto_17:
[0001bc26] 486c 0016                 pea.l      22(a4)
[0001bc2a] 43eb 0291                 lea.l      657(a3),a1
[0001bc2e] 204d                      movea.l    a5,a0
[0001bc30] 4eb9 0008 15ac            jsr        sprintf
[0001bc36] 584f                      addq.w     #4,a7
[0001bc38] 6046                      bra.s      out_declproto_20
out_declproto_6:
[0001bc3a] 4215                      clr.b      (a5)
[0001bc3c] 6042                      bra.s      out_declproto_20
out_declproto_18:
[0001bc3e] 486c 0016                 pea.l      22(a4)
[0001bc42] 43eb 02dc                 lea.l      732(a3),a1
[0001bc46] 204d                      movea.l    a5,a0
[0001bc48] 4eb9 0008 15ac            jsr        sprintf
[0001bc4e] 584f                      addq.w     #4,a7
[0001bc50] 602e                      bra.s      out_declproto_20
out_declproto_19:
[0001bc52] 486c 0016                 pea.l      22(a4)
[0001bc56] 43eb 0315                 lea.l      789(a3),a1
[0001bc5a] 204d                      movea.l    a5,a0
[0001bc5c] 4eb9 0008 15ac            jsr        sprintf
[0001bc62] 584f                      addq.w     #4,a7
[0001bc64] 601a                      bra.s      out_declproto_20
out_declproto_5:
[0001bc66] 3005                      move.w     d5,d0
[0001bc68] c07c 00ff                 and.w      #$00FF,d0
[0001bc6c] 3f00                      move.w     d0,-(a7)
[0001bc6e] 486c 0016                 pea.l      22(a4)
[0001bc72] 43eb 0375                 lea.l      885(a3),a1
[0001bc76] 204d                      movea.l    a5,a0
[0001bc78] 4eb9 0008 15ac            jsr        sprintf
[0001bc7e] 5c4f                      addq.w     #6,a7
out_declproto_20:
[0001bc80] 204d                      movea.l    a5,a0
[0001bc82] 4eb9 0001 8374            jsr        save_string
out_declproto_4:
[0001bc88] 5244                      addq.w     #1,d4
out_declproto_2:
[0001bc8a] b644                      cmp.w      d4,d3
[0001bc8c] 6e00 fe4e                 bgt        out_declproto_21
[0001bc90] 41eb 004c                 lea.l      76(a3),a0
[0001bc94] 4eb9 0001 8374            jsr        save_string
out_declproto_1:
[0001bc9a] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[0001bc9e] 4e75                      rts

out_acs:
[0001bca0] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[0001bca4] 4fef ffbc                 lea.l      -68(a7),a7
[0001bca8] 2448                      movea.l    a0,a2
[0001bcaa] 43f9 000a 65c4            lea.l      $000A65C4,a1
[0001bcb0] 41d7                      lea.l      (a7),a0
[0001bcb2] 701f                      moveq.l    #31,d0
out_acs_1:
[0001bcb4] 10d9                      move.b     (a1)+,(a0)+
[0001bcb6] 51c8 fffc                 dbf        d0,out_acs_1
[0001bcba] 302a 0006                 move.w     6(a2),d0
[0001bcbe] c07c 8000                 and.w      #$8000,d0
[0001bcc2] 6600 0372                 bne        out_acs_2
[0001bcc6] 47f9 000a 65e4            lea.l      $000A65E4,a3
[0001bccc] 41eb 038b                 lea.l      907(a3),a0
[0001bcd0] 4eb9 0001 8374            jsr        save_string
[0001bcd6] 49f9 0010 7f66            lea.l      iostring,a4
[0001bcdc] 3f2a 005a                 move.w     90(a2),-(a7)
[0001bce0] 3f2a 0058                 move.w     88(a2),-(a7)
[0001bce4] 3f2a 0056                 move.w     86(a2),-(a7)
[0001bce8] 3f3c 012c                 move.w     #$012C,-(a7)
[0001bcec] 486b 03f5                 pea.l      1013(a3)
[0001bcf0] 43eb 03a9                 lea.l      937(a3),a1
[0001bcf4] 204c                      movea.l    a4,a0
[0001bcf6] 4eb9 0008 15ac            jsr        sprintf
[0001bcfc] 4fef 000c                 lea.l      12(a7),a7
[0001bd00] 204c                      movea.l    a4,a0
[0001bd02] 4eb9 0001 8374            jsr        save_string
[0001bd08] 4bea 005c                 lea.l      92(a2),a5
[0001bd0c] 701f                      moveq.l    #31,d0
[0001bd0e] 224d                      movea.l    a5,a1
[0001bd10] 41d7                      lea.l      (a7),a0
[0001bd12] 4eb9 0008 2fd6            jsr        strncpy
[0001bd18] 422f 001f                 clr.b      31(a7)
[0001bd1c] 703b                      moveq.l    #59,d0
[0001bd1e] 41d7                      lea.l      (a7),a0
[0001bd20] 6100 fb38                 bsr        p_string
[0001bd24] 41eb 03fd                 lea.l      1021(a3),a0
[0001bd28] 4eb9 0001 8374            jsr        save_string
[0001bd2e] 43eb 0406                 lea.l      1030(a3),a1
[0001bd32] 206a 007c                 movea.l    124(a2),a0
[0001bd36] 6100 fc4c                 bsr        out_label2
[0001bd3a] 41eb 040a                 lea.l      1034(a3),a0
[0001bd3e] 4eb9 0001 8374            jsr        save_string
[0001bd44] 43eb 0406                 lea.l      1030(a3),a1
[0001bd48] 206a 0080                 movea.l    128(a2),a0
[0001bd4c] 6100 fc36                 bsr        out_label2
[0001bd50] 41eb 0412                 lea.l      1042(a3),a0
[0001bd54] 4eb9 0001 8374            jsr        save_string
[0001bd5a] 4bea 0084                 lea.l      132(a2),a5
[0001bd5e] 4243                      clr.w      d3
[0001bd60] 6048                      bra.s      out_acs_3
out_acs_7:
[0001bd62] 4a43                      tst.w      d3
[0001bd64] 670a                      beq.s      out_acs_4
[0001bd66] 41eb 0422                 lea.l      1058(a3),a0
[0001bd6a] 4eb9 0001 8374            jsr        save_string
out_acs_4:
[0001bd70] 0c55 00ff                 cmpi.w     #$00FF,(a5)
[0001bd74] 6618                      bne.s      out_acs_5
[0001bd76] 206d 0002                 movea.l    2(a5),a0
[0001bd7a] 4868 0016                 pea.l      22(a0)
[0001bd7e] 43eb 0426                 lea.l      1062(a3),a1
[0001bd82] 204c                      movea.l    a4,a0
[0001bd84] 4eb9 0008 15ac            jsr        sprintf
[0001bd8a] 584f                      addq.w     #4,a7
[0001bd8c] 6010                      bra.s      out_acs_6
out_acs_5:
[0001bd8e] 3f15                      move.w     (a5),-(a7)
[0001bd90] 43eb 0442                 lea.l      1090(a3),a1
[0001bd94] 204c                      movea.l    a4,a0
[0001bd96] 4eb9 0008 15ac            jsr        sprintf
[0001bd9c] 544f                      addq.w     #2,a7
out_acs_6:
[0001bd9e] 204c                      movea.l    a4,a0
[0001bda0] 4eb9 0001 8374            jsr        save_string
[0001bda6] 5c4d                      addq.w     #6,a5
[0001bda8] 5243                      addq.w     #1,d3
out_acs_3:
[0001bdaa] b67c 0020                 cmp.w      #$0020,d3
[0001bdae] 6db2                      blt.s      out_acs_7
[0001bdb0] 41eb 045e                 lea.l      1118(a3),a0
[0001bdb4] 4eb9 0001 8374            jsr        save_string
[0001bdba] 4243                      clr.w      d3
[0001bdbc] 4bef 0020                 lea.l      32(a7),a5
[0001bdc0] 606e                      bra.s      out_acs_8
out_acs_13:
[0001bdc2] 41eb 0472                 lea.l      1138(a3),a0
[0001bdc6] 4eb9 0001 8374            jsr        save_string
[0001bdcc] b67c 0021                 cmp.w      #$0021,d3
[0001bdd0] 6c04                      bge.s      out_acs_9
[0001bdd2] 782c                      moveq.l    #44,d4
[0001bdd4] 6002                      bra.s      out_acs_10
out_acs_9:
[0001bdd6] 4204                      clr.b      d4
out_acs_10:
[0001bdd8] 3f03                      move.w     d3,-(a7)
[0001bdda] 43eb 0477                 lea.l      1143(a3),a1
[0001bdde] 204d                      movea.l    a5,a0
[0001bde0] 4eb9 0008 15ac            jsr        sprintf
[0001bde6] 544f                      addq.w     #2,a7
[0001bde8] 224d                      movea.l    a5,a1
[0001bdea] 206a 0034                 movea.l    52(a2),a0
[0001bdee] 4eb9 0003 337c            jsr        find_entry
[0001bdf4] 2c48                      movea.l    a0,a6
[0001bdf6] 200e                      move.l     a6,d0
[0001bdf8] 662a                      bne.s      out_acs_11
[0001bdfa] 224d                      movea.l    a5,a1
[0001bdfc] 206a 0024                 movea.l    36(a2),a0
[0001be00] 4eb9 0003 337c            jsr        find_entry
[0001be06] 2c48                      movea.l    a0,a6
[0001be08] 200e                      move.l     a6,d0
[0001be0a] 6618                      bne.s      out_acs_11
[0001be0c] 1004                      move.b     d4,d0
[0001be0e] 3203                      move.w     d3,d1
[0001be10] 48c1                      ext.l      d1
[0001be12] e589                      lsl.l      #2,d1
[0001be14] 43f9 0008 af02            lea.l      mlmess,a1
[0001be1a] 2071 1800                 movea.l    0(a1,d1.l),a0
[0001be1e] 6100 fa3a                 bsr        p_string
[0001be22] 600a                      bra.s      out_acs_12
out_acs_11:
[0001be24] 1004                      move.b     d4,d0
[0001be26] 206e 0004                 movea.l    4(a6),a0
[0001be2a] 6100 fa2e                 bsr        p_string
out_acs_12:
[0001be2e] 5243                      addq.w     #1,d3
out_acs_8:
[0001be30] b67c 0022                 cmp.w      #$0022,d3
[0001be34] 6d8c                      blt.s      out_acs_13
[0001be36] 41eb 0481                 lea.l      1153(a3),a0
[0001be3a] 4eb9 0001 8374            jsr        save_string
[0001be40] 41eb 048e                 lea.l      1166(a3),a0
[0001be44] 4eb9 0001 8374            jsr        save_string
[0001be4a] 41eb 04b0                 lea.l      1200(a3),a0
[0001be4e] 4eb9 0001 8374            jsr        save_string
[0001be54] 43eb 0001                 lea.l      1(a3),a1
[0001be58] 206a 0214                 movea.l    532(a2),a0
[0001be5c] 6100 fae8                 bsr        out_label
[0001be60] 41eb 04cc                 lea.l      1228(a3),a0
[0001be64] 4eb9 0001 8374            jsr        save_string
[0001be6a] 43eb 04da                 lea.l      1242(a3),a1
[0001be6e] 206a 0218                 movea.l    536(a2),a0
[0001be72] 6100 fad2                 bsr        out_label
[0001be76] 41eb 04dd                 lea.l      1245(a3),a0
[0001be7a] 4eb9 0001 8374            jsr        save_string
[0001be80] 43eb 0406                 lea.l      1030(a3),a1
[0001be84] 206a 021c                 movea.l    540(a2),a0
[0001be88] 6100 fabc                 bsr        out_label
[0001be8c] 41eb 04ee                 lea.l      1262(a3),a0
[0001be90] 4eb9 0001 8374            jsr        save_string
[0001be96] 302a 0220                 move.w     544(a2),d0
[0001be9a] 6706                      beq.s      out_acs_14
[0001be9c] 41eb 0504                 lea.l      1284(a3),a0
[0001bea0] 6004                      bra.s      out_acs_15
out_acs_14:
[0001bea2] 41eb 0509                 lea.l      1289(a3),a0
out_acs_15:
[0001bea6] 4eb9 0001 8374            jsr        save_string
[0001beac] 41eb 050f                 lea.l      1295(a3),a0
[0001beb0] 4eb9 0001 8374            jsr        save_string
[0001beb6] 302a 0222                 move.w     546(a2),d0
[0001beba] 6706                      beq.s      out_acs_16
[0001bebc] 41eb 0504                 lea.l      1284(a3),a0
[0001bec0] 6004                      bra.s      out_acs_17
out_acs_16:
[0001bec2] 41eb 0509                 lea.l      1289(a3),a0
out_acs_17:
[0001bec6] 4eb9 0001 8374            jsr        save_string
[0001becc] 41eb 0521                 lea.l      1313(a3),a0
[0001bed0] 4eb9 0001 8374            jsr        save_string
[0001bed6] 3f2a 0224                 move.w     548(a2),-(a7)
[0001beda] 43eb 0535                 lea.l      1333(a3),a1
[0001bede] 204c                      movea.l    a4,a0
[0001bee0] 4eb9 0008 15ac            jsr        sprintf
[0001bee6] 544f                      addq.w     #2,a7
[0001bee8] 204c                      movea.l    a4,a0
[0001beea] 4eb9 0001 8374            jsr        save_string
[0001bef0] 41eb 0542                 lea.l      1346(a3),a0
[0001bef4] 4eb9 0001 8374            jsr        save_string
[0001befa] 43eb 054e                 lea.l      1358(a3),a1
[0001befe] 206a 0226                 movea.l    550(a2),a0
[0001bf02] 6100 fa42                 bsr        out_label
[0001bf06] 41eb 0557                 lea.l      1367(a3),a0
[0001bf0a] 4eb9 0001 8374            jsr        save_string
[0001bf10] 43eb 0406                 lea.l      1030(a3),a1
[0001bf14] 206a 022a                 movea.l    554(a2),a0
[0001bf18] 6100 fa2c                 bsr        out_label
[0001bf1c] 41eb 0564                 lea.l      1380(a3),a0
[0001bf20] 4eb9 0001 8374            jsr        save_string
[0001bf26] 43eb 0406                 lea.l      1030(a3),a1
[0001bf2a] 206a 022e                 movea.l    558(a2),a0
[0001bf2e] 6100 fa16                 bsr        out_label
[0001bf32] 41eb 0573                 lea.l      1395(a3),a0
[0001bf36] 4eb9 0001 8374            jsr        save_string
[0001bf3c] 43eb 0406                 lea.l      1030(a3),a1
[0001bf40] 206a 0232                 movea.l    562(a2),a0
[0001bf44] 6100 fa00                 bsr        out_label
[0001bf48] 41eb 0580                 lea.l      1408(a3),a0
[0001bf4c] 4eb9 0001 8374            jsr        save_string
[0001bf52] 43eb 0406                 lea.l      1030(a3),a1
[0001bf56] 206a 0236                 movea.l    566(a2),a0
[0001bf5a] 6100 f9ea                 bsr        out_label
[0001bf5e] 41eb 0592                 lea.l      1426(a3),a0
[0001bf62] 4eb9 0001 8374            jsr        save_string
[0001bf68] 43eb 0406                 lea.l      1030(a3),a1
[0001bf6c] 206a 023a                 movea.l    570(a2),a0
[0001bf70] 6100 f9d4                 bsr        out_label
[0001bf74] 41eb 05a0                 lea.l      1440(a3),a0
[0001bf78] 4eb9 0001 8374            jsr        save_string
[0001bf7e] 43eb 0406                 lea.l      1030(a3),a1
[0001bf82] 206a 023e                 movea.l    574(a2),a0
[0001bf86] 6100 f9be                 bsr        out_label
[0001bf8a] 41eb 05ad                 lea.l      1453(a3),a0
[0001bf8e] 4eb9 0001 8374            jsr        save_string
[0001bf94] 43eb 0406                 lea.l      1030(a3),a1
[0001bf98] 206a 0242                 movea.l    578(a2),a0
[0001bf9c] 6100 f9a8                 bsr        out_label
[0001bfa0] 41eb 05b8                 lea.l      1464(a3),a0
[0001bfa4] 4eb9 0001 8374            jsr        save_string
[0001bfaa] 43eb 0406                 lea.l      1030(a3),a1
[0001bfae] 206a 0246                 movea.l    582(a2),a0
[0001bfb2] 6100 f992                 bsr        out_label
[0001bfb6] 41eb 05c9                 lea.l      1481(a3),a0
[0001bfba] 4eb9 0001 8374            jsr        save_string
[0001bfc0] 43eb 0406                 lea.l      1030(a3),a1
[0001bfc4] 206a 024a                 movea.l    586(a2),a0
[0001bfc8] 6100 f97c                 bsr        out_label
[0001bfcc] 41eb 05d6                 lea.l      1494(a3),a0
[0001bfd0] 4eb9 0001 8374            jsr        save_string
[0001bfd6] 43eb 0406                 lea.l      1030(a3),a1
[0001bfda] 206a 024e                 movea.l    590(a2),a0
[0001bfde] 6100 f966                 bsr        out_label
[0001bfe2] 41eb 05e3                 lea.l      1507(a3),a0
[0001bfe6] 4eb9 0001 8374            jsr        save_string
[0001bfec] 3f2a 0252                 move.w     594(a2),-(a7)
[0001bff0] 43eb 05f4                 lea.l      1524(a3),a1
[0001bff4] 204c                      movea.l    a4,a0
[0001bff6] 4eb9 0008 15ac            jsr        sprintf
[0001bffc] 544f                      addq.w     #2,a7
[0001bffe] 204c                      movea.l    a4,a0
[0001c000] 4eb9 0001 8374            jsr        save_string
[0001c006] 3f2a 0254                 move.w     596(a2),-(a7)
[0001c00a] 43eb 0603                 lea.l      1539(a3),a1
[0001c00e] 204c                      movea.l    a4,a0
[0001c010] 4eb9 0008 15ac            jsr        sprintf
[0001c016] 544f                      addq.w     #2,a7
[0001c018] 204c                      movea.l    a4,a0
[0001c01a] 4eb9 0001 8374            jsr        save_string
[0001c020] 43eb 0406                 lea.l      1030(a3),a1
[0001c024] 206a 0256                 movea.l    598(a2),a0
[0001c028] 6100 f91c                 bsr        out_label
[0001c02c] 41eb 0486                 lea.l      1158(a3),a0
[0001c030] 4eb9 0001 8374            jsr        save_string
out_acs_2:
[0001c036] 4fef 0044                 lea.l      68(a7),a7
[0001c03a] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[0001c03e] 4e75                      rts

out_cicon:
[0001c040] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0001c044] 2648                      movea.l    a0,a3
[0001c046] 2449                      movea.l    a1,a2
[0001c048] 3600                      move.w     d0,d3
[0001c04a] 49f9 000a 65e4            lea.l      $000A65E4,a4
[0001c050] 4bf9 0010 7f66            lea.l      iostring,a5
[0001c056] 3f12                      move.w     (a2),-(a7)
[0001c058] 2f0b                      move.l     a3,-(a7)
[0001c05a] 3f12                      move.w     (a2),-(a7)
[0001c05c] 43ec 0616                 lea.l      1558(a4),a1
[0001c060] 204d                      movea.l    a5,a0
[0001c062] 4eb9 0008 15ac            jsr        sprintf
[0001c068] 504f                      addq.w     #8,a7
[0001c06a] 204d                      movea.l    a5,a0
[0001c06c] 4eb9 0001 8374            jsr        save_string
[0001c072] 43ec 0406                 lea.l      1030(a4),a1
[0001c076] 206a 0002                 movea.l    2(a2),a0
[0001c07a] 6100 f946                 bsr        out_label3
[0001c07e] 41ec 064e                 lea.l      1614(a4),a0
[0001c082] 4eb9 0001 8374            jsr        save_string
[0001c088] 43ec 0406                 lea.l      1030(a4),a1
[0001c08c] 206a 0006                 movea.l    6(a2),a0
[0001c090] 6100 f8f2                 bsr        out_label2
[0001c094] 41ec 065e                 lea.l      1630(a4),a0
[0001c098] 4eb9 0001 8374            jsr        save_string
[0001c09e] 43ec 0406                 lea.l      1030(a4),a1
[0001c0a2] 206a 000a                 movea.l    10(a2),a0
[0001c0a6] 6100 f91a                 bsr        out_label3
[0001c0aa] 41ec 066e                 lea.l      1646(a4),a0
[0001c0ae] 4eb9 0001 8374            jsr        save_string
[0001c0b4] 43ec 0406                 lea.l      1030(a4),a1
[0001c0b8] 206a 000e                 movea.l    14(a2),a0
[0001c0bc] 6100 f8c6                 bsr        out_label2
[0001c0c0] 4a43                      tst.w      d3
[0001c0c2] 671c                      beq.s      out_cicon_1
[0001c0c4] 2f0b                      move.l     a3,-(a7)
[0001c0c6] 3f03                      move.w     d3,-(a7)
[0001c0c8] 43ec 067e                 lea.l      1662(a4),a1
[0001c0cc] 204d                      movea.l    a5,a0
[0001c0ce] 4eb9 0008 15ac            jsr        sprintf
[0001c0d4] 5c4f                      addq.w     #6,a7
[0001c0d6] 204d                      movea.l    a5,a0
[0001c0d8] 4eb9 0001 8374            jsr        save_string
[0001c0de] 600a                      bra.s      out_cicon_2
out_cicon_1:
[0001c0e0] 41ec 069b                 lea.l      1691(a4),a0
[0001c0e4] 4eb9 0001 8374            jsr        save_string
out_cicon_2:
[0001c0ea] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0001c0ee] 4e75                      rts

out_icon:
[0001c0f0] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0001c0f4] 514f                      subq.w     #8,a7
[0001c0f6] 2f48 0004                 move.l     a0,4(a7)
[0001c0fa] 2628 000e                 move.l     14(a0),d3
[0001c0fe] e48b                      lsr.l      #2,d3
[0001c100] 4a43                      tst.w      d3
[0001c102] 6f00 01e0                 ble        out_icon_1
[0001c106] 41e8 0016                 lea.l      22(a0),a0
[0001c10a] 4eb9 0001 9d78            jsr        info_list
[0001c110] 206f 0004                 movea.l    4(a7),a0
[0001c114] 2ea8 0004                 move.l     4(a0),(a7)
[0001c118] 47f9 000a 65e4            lea.l      $000A65E4,a3
[0001c11e] 41eb 06b2                 lea.l      1714(a3),a0
[0001c122] 4eb9 0001 8374            jsr        save_string
[0001c128] 4244                      clr.w      d4
[0001c12a] 45f9 0010 7f66            lea.l      iostring,a2
[0001c130] 6000 01ac                 bra        out_icon_2
out_icon_13:
[0001c134] 3004                      move.w     d4,d0
[0001c136] 48c0                      ext.l      d0
[0001c138] e588                      lsl.l      #2,d0
[0001c13a] 2057                      movea.l    (a7),a0
[0001c13c] 2870 0800                 movea.l    0(a0,d0.l),a4
[0001c140] 41ec 0016                 lea.l      22(a4),a0
[0001c144] 4eb9 0001 9dd0            jsr        info_obj
[0001c14a] 2a6c 0004                 movea.l    4(a4),a5
[0001c14e] 2c6c 0004                 movea.l    4(a4),a6
[0001c152] 4245                      clr.w      d5
[0001c154] 302e 003c                 move.w     60(a6),d0
[0001c158] 6710                      beq.s      out_icon_3
[0001c15a] 43ee 003c                 lea.l      60(a6),a1
[0001c15e] 41ec 0016                 lea.l      22(a4),a0
[0001c162] 3005                      move.w     d5,d0
[0001c164] 6100 feda                 bsr        out_cicon
[0001c168] 7a08                      moveq.l    #8,d5
out_icon_3:
[0001c16a] 302e 0026                 move.w     38(a6),d0
[0001c16e] 6710                      beq.s      out_icon_4
[0001c170] 43ee 0026                 lea.l      38(a6),a1
[0001c174] 41ec 0016                 lea.l      22(a4),a0
[0001c178] 3005                      move.w     d5,d0
[0001c17a] 6100 fec4                 bsr        out_cicon
[0001c17e] 7a04                      moveq.l    #4,d5
out_icon_4:
[0001c180] 7c0f                      moveq.l    #15,d6
[0001c182] dc6d 0016                 add.w      22(a5),d6
[0001c186] e846                      asr.w      #4,d6
[0001c188] cded 0018                 muls.w     24(a5),d6
[0001c18c] 5346                      subq.w     #1,d6
[0001c18e] 2015                      move.l     (a5),d0
[0001c190] 4df5 0800                 lea.l      0(a5,d0.l),a6
[0001c194] 3f06                      move.w     d6,-(a7)
[0001c196] 486c 0016                 pea.l      22(a4)
[0001c19a] 43eb 06c8                 lea.l      1736(a3),a1
[0001c19e] 204a                      movea.l    a2,a0
[0001c1a0] 4eb9 0008 15ac            jsr        sprintf
[0001c1a6] 5c4f                      addq.w     #6,a7
[0001c1a8] 204a                      movea.l    a2,a0
[0001c1aa] 4eb9 0001 8374            jsr        save_string
[0001c1b0] 4247                      clr.w      d7
[0001c1b2] 602c                      bra.s      out_icon_5
out_icon_7:
[0001c1b4] 3f1e                      move.w     (a6)+,-(a7)
[0001c1b6] 43eb 06f3                 lea.l      1779(a3),a1
[0001c1ba] 204a                      movea.l    a2,a0
[0001c1bc] 4eb9 0008 15ac            jsr        sprintf
[0001c1c2] 544f                      addq.w     #2,a7
[0001c1c4] 204a                      movea.l    a2,a0
[0001c1c6] 4eb9 0001 8374            jsr        save_string
[0001c1cc] 7007                      moveq.l    #7,d0
[0001c1ce] c047                      and.w      d7,d0
[0001c1d0] 5f40                      subq.w     #7,d0
[0001c1d2] 660a                      bne.s      out_icon_6
[0001c1d4] 41eb 04ab                 lea.l      1195(a3),a0
[0001c1d8] 4eb9 0001 8374            jsr        save_string
out_icon_6:
[0001c1de] 5247                      addq.w     #1,d7
out_icon_5:
[0001c1e0] bc47                      cmp.w      d7,d6
[0001c1e2] 6ed0                      bgt.s      out_icon_7
[0001c1e4] 3f06                      move.w     d6,-(a7)
[0001c1e6] 486c 0016                 pea.l      22(a4)
[0001c1ea] 3f1e                      move.w     (a6)+,-(a7)
[0001c1ec] 43eb 06fb                 lea.l      1787(a3),a1
[0001c1f0] 204a                      movea.l    a2,a0
[0001c1f2] 4eb9 0008 15ac            jsr        sprintf
[0001c1f8] 504f                      addq.w     #8,a7
[0001c1fa] 204a                      movea.l    a2,a0
[0001c1fc] 4eb9 0001 8374            jsr        save_string
[0001c202] 4247                      clr.w      d7
[0001c204] 602c                      bra.s      out_icon_8
out_icon_10:
[0001c206] 3f1e                      move.w     (a6)+,-(a7)
[0001c208] 43eb 06f3                 lea.l      1779(a3),a1
[0001c20c] 204a                      movea.l    a2,a0
[0001c20e] 4eb9 0008 15ac            jsr        sprintf
[0001c214] 544f                      addq.w     #2,a7
[0001c216] 204a                      movea.l    a2,a0
[0001c218] 4eb9 0001 8374            jsr        save_string
[0001c21e] 7007                      moveq.l    #7,d0
[0001c220] c047                      and.w      d7,d0
[0001c222] 5f40                      subq.w     #7,d0
[0001c224] 660a                      bne.s      out_icon_9
[0001c226] 41eb 04ab                 lea.l      1195(a3),a0
[0001c22a] 4eb9 0001 8374            jsr        save_string
out_icon_9:
[0001c230] 5247                      addq.w     #1,d7
out_icon_8:
[0001c232] bc47                      cmp.w      d7,d6
[0001c234] 6ed0                      bgt.s      out_icon_10
[0001c236] 3f1e                      move.w     (a6)+,-(a7)
[0001c238] 43eb 0732                 lea.l      1842(a3),a1
[0001c23c] 204a                      movea.l    a2,a0
[0001c23e] 4eb9 0008 15ac            jsr        sprintf
[0001c244] 544f                      addq.w     #2,a7
[0001c246] 204a                      movea.l    a2,a0
[0001c248] 4eb9 0001 8374            jsr        save_string
[0001c24e] 3f2d 0020                 move.w     32(a5),-(a7)
[0001c252] 3f2d 001e                 move.w     30(a5),-(a7)
[0001c256] 3f2d 001c                 move.w     28(a5),-(a7)
[0001c25a] 3f2d 001a                 move.w     26(a5),-(a7)
[0001c25e] 3f2d 0018                 move.w     24(a5),-(a7)
[0001c262] 3f2d 0016                 move.w     22(a5),-(a7)
[0001c266] 3f2d 0014                 move.w     20(a5),-(a7)
[0001c26a] 3f2d 0012                 move.w     18(a5),-(a7)
[0001c26e] 3f2d 0010                 move.w     16(a5),-(a7)
[0001c272] 3f2d 000e                 move.w     14(a5),-(a7)
[0001c276] 3f2d 000c                 move.w     12(a5),-(a7)
[0001c27a] 206d 0008                 movea.l    8(a5),a0
[0001c27e] 4868 0016                 pea.l      22(a0)
[0001c282] 486c 0016                 pea.l      22(a4)
[0001c286] 486c 0016                 pea.l      22(a4)
[0001c28a] 486c 0016                 pea.l      22(a4)
[0001c28e] 43eb 073f                 lea.l      1855(a3),a1
[0001c292] 204a                      movea.l    a2,a0
[0001c294] 4eb9 0008 15ac            jsr        sprintf
[0001c29a] 4fef 0026                 lea.l      38(a7),a7
[0001c29e] 204a                      movea.l    a2,a0
[0001c2a0] 4eb9 0001 8374            jsr        save_string
[0001c2a6] 4a45                      tst.w      d5
[0001c2a8] 671e                      beq.s      out_icon_11
[0001c2aa] 486c 0016                 pea.l      22(a4)
[0001c2ae] 3f05                      move.w     d5,-(a7)
[0001c2b0] 43eb 0866                 lea.l      2150(a3),a1
[0001c2b4] 204a                      movea.l    a2,a0
[0001c2b6] 4eb9 0008 15ac            jsr        sprintf
[0001c2bc] 5c4f                      addq.w     #6,a7
[0001c2be] 204a                      movea.l    a2,a0
[0001c2c0] 4eb9 0001 8374            jsr        save_string
[0001c2c6] 600a                      bra.s      out_icon_12
out_icon_11:
[0001c2c8] 41eb 0406                 lea.l      1030(a3),a0
[0001c2cc] 4eb9 0001 8374            jsr        save_string
out_icon_12:
[0001c2d2] 41eb 0870                 lea.l      2160(a3),a0
[0001c2d6] 4eb9 0001 8374            jsr        save_string
[0001c2dc] 5244                      addq.w     #1,d4
out_icon_2:
[0001c2de] b644                      cmp.w      d4,d3
[0001c2e0] 6e00 fe52                 bgt        out_icon_13
out_icon_1:
[0001c2e4] 504f                      addq.w     #8,a7
[0001c2e6] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0001c2ea] 4e75                      rts

out_mouse:
[0001c2ec] 48e7 1c3e                 movem.l    d3-d5/a2-a6,-(a7)
[0001c2f0] 2448                      movea.l    a0,a2
[0001c2f2] 262a 000e                 move.l     14(a2),d3
[0001c2f6] e48b                      lsr.l      #2,d3
[0001c2f8] 4a43                      tst.w      d3
[0001c2fa] 6f00 0112                 ble        out_mouse_1
[0001c2fe] 41ea 0016                 lea.l      22(a2),a0
[0001c302] 4eb9 0001 9d78            jsr        info_list
[0001c308] 246a 0004                 movea.l    4(a2),a2
[0001c30c] 47f9 000a 65e4            lea.l      $000A65E4,a3
[0001c312] 41eb 087a                 lea.l      2170(a3),a0
[0001c316] 4eb9 0001 8374            jsr        save_string
[0001c31c] 4244                      clr.w      d4
[0001c31e] 4bf9 0010 7f66            lea.l      iostring,a5
[0001c324] 6000 00e2                 bra        out_mouse_2
out_mouse_9:
[0001c328] 3004                      move.w     d4,d0
[0001c32a] 48c0                      ext.l      d0
[0001c32c] e588                      lsl.l      #2,d0
[0001c32e] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001c332] 41ec 0016                 lea.l      22(a4),a0
[0001c336] 4eb9 0001 9dd0            jsr        info_obj
[0001c33c] 2c6c 0004                 movea.l    4(a4),a6
[0001c340] 3f2e 0008                 move.w     8(a6),-(a7)
[0001c344] 3f2e 0006                 move.w     6(a6),-(a7)
[0001c348] 3f2e 0004                 move.w     4(a6),-(a7)
[0001c34c] 3f2e 0002                 move.w     2(a6),-(a7)
[0001c350] 3f16                      move.w     (a6),-(a7)
[0001c352] 486c 0016                 pea.l      22(a4)
[0001c356] 43eb 0891                 lea.l      2193(a3),a1
[0001c35a] 204d                      movea.l    a5,a0
[0001c35c] 4eb9 0008 15ac            jsr        sprintf
[0001c362] 4fef 000e                 lea.l      14(a7),a7
[0001c366] 204d                      movea.l    a5,a0
[0001c368] 4eb9 0001 8374            jsr        save_string
[0001c36e] 4dee 000a                 lea.l      10(a6),a6
[0001c372] 7a0f                      moveq.l    #15,d5
[0001c374] 602a                      bra.s      out_mouse_3
out_mouse_5:
[0001c376] 3f1e                      move.w     (a6)+,-(a7)
[0001c378] 43eb 0901                 lea.l      2305(a3),a1
[0001c37c] 204d                      movea.l    a5,a0
[0001c37e] 4eb9 0008 15ac            jsr        sprintf
[0001c384] 544f                      addq.w     #2,a7
[0001c386] 204d                      movea.l    a5,a0
[0001c388] 4eb9 0001 8374            jsr        save_string
[0001c38e] ba7c 0008                 cmp.w      #$0008,d5
[0001c392] 660a                      bne.s      out_mouse_4
[0001c394] 41eb 08fb                 lea.l      2299(a3),a0
[0001c398] 4eb9 0001 8374            jsr        save_string
out_mouse_4:
[0001c39e] 5345                      subq.w     #1,d5
out_mouse_3:
[0001c3a0] 4a45                      tst.w      d5
[0001c3a2] 6ed2                      bgt.s      out_mouse_5
[0001c3a4] 3f1e                      move.w     (a6)+,-(a7)
[0001c3a6] 43eb 0906                 lea.l      2310(a3),a1
[0001c3aa] 204d                      movea.l    a5,a0
[0001c3ac] 4eb9 0008 15ac            jsr        sprintf
[0001c3b2] 544f                      addq.w     #2,a7
[0001c3b4] 204d                      movea.l    a5,a0
[0001c3b6] 4eb9 0001 8374            jsr        save_string
[0001c3bc] 7a0f                      moveq.l    #15,d5
[0001c3be] 602a                      bra.s      out_mouse_6
out_mouse_8:
[0001c3c0] 3f1e                      move.w     (a6)+,-(a7)
[0001c3c2] 43eb 0901                 lea.l      2305(a3),a1
[0001c3c6] 204d                      movea.l    a5,a0
[0001c3c8] 4eb9 0008 15ac            jsr        sprintf
[0001c3ce] 544f                      addq.w     #2,a7
[0001c3d0] 204d                      movea.l    a5,a0
[0001c3d2] 4eb9 0001 8374            jsr        save_string
[0001c3d8] ba7c 0008                 cmp.w      #$0008,d5
[0001c3dc] 660a                      bne.s      out_mouse_7
[0001c3de] 41eb 08fb                 lea.l      2299(a3),a0
[0001c3e2] 4eb9 0001 8374            jsr        save_string
out_mouse_7:
[0001c3e8] 5345                      subq.w     #1,d5
out_mouse_6:
[0001c3ea] 4a45                      tst.w      d5
[0001c3ec] 6ed2                      bgt.s      out_mouse_8
[0001c3ee] 3f1e                      move.w     (a6)+,-(a7)
[0001c3f0] 43eb 0925                 lea.l      2341(a3),a1
[0001c3f4] 204d                      movea.l    a5,a0
[0001c3f6] 4eb9 0008 15ac            jsr        sprintf
[0001c3fc] 544f                      addq.w     #2,a7
[0001c3fe] 204d                      movea.l    a5,a0
[0001c400] 4eb9 0001 8374            jsr        save_string
[0001c406] 5244                      addq.w     #1,d4
out_mouse_2:
[0001c408] b644                      cmp.w      d4,d3
[0001c40a] 6e00 ff1c                 bgt        out_mouse_9
out_mouse_1:
[0001c40e] 4cdf 7c38                 movem.l    (a7)+,d3-d5/a2-a6
[0001c412] 4e75                      rts

out_image:
[0001c414] 48e7 1e3e                 movem.l    d3-d6/a2-a6,-(a7)
[0001c418] 514f                      subq.w     #8,a7
[0001c41a] 2f48 0004                 move.l     a0,4(a7)
[0001c41e] 2628 000e                 move.l     14(a0),d3
[0001c422] e48b                      lsr.l      #2,d3
[0001c424] 4a43                      tst.w      d3
[0001c426] 6f00 0100                 ble        out_image_1
[0001c42a] 41e8 0016                 lea.l      22(a0),a0
[0001c42e] 4eb9 0001 9d78            jsr        info_list
[0001c434] 206f 0004                 movea.l    4(a7),a0
[0001c438] 2ea8 0004                 move.l     4(a0),(a7)
[0001c43c] 47f9 000a 65e4            lea.l      $000A65E4,a3
[0001c442] 41eb 0936                 lea.l      2358(a3),a0
[0001c446] 4eb9 0001 8374            jsr        save_string
[0001c44c] 4244                      clr.w      d4
[0001c44e] 45f9 0010 7f66            lea.l      iostring,a2
[0001c454] 6000 00cc                 bra        out_image_2
out_image_6:
[0001c458] 3004                      move.w     d4,d0
[0001c45a] 48c0                      ext.l      d0
[0001c45c] e588                      lsl.l      #2,d0
[0001c45e] 2057                      movea.l    (a7),a0
[0001c460] 2870 0800                 movea.l    0(a0,d0.l),a4
[0001c464] 41ec 0016                 lea.l      22(a4),a0
[0001c468] 4eb9 0001 9dd0            jsr        info_obj
[0001c46e] 2a6c 0004                 movea.l    4(a4),a5
[0001c472] 3a2d 0004                 move.w     4(a5),d5
[0001c476] e245                      asr.w      #1,d5
[0001c478] cbed 0006                 muls.w     6(a5),d5
[0001c47c] 5345                      subq.w     #1,d5
[0001c47e] 2015                      move.l     (a5),d0
[0001c480] 4df5 0800                 lea.l      0(a5,d0.l),a6
[0001c484] 3f05                      move.w     d5,-(a7)
[0001c486] 486c 0016                 pea.l      22(a4)
[0001c48a] 43eb 094d                 lea.l      2381(a3),a1
[0001c48e] 204a                      movea.l    a2,a0
[0001c490] 4eb9 0008 15ac            jsr        sprintf
[0001c496] 5c4f                      addq.w     #6,a7
[0001c498] 204a                      movea.l    a2,a0
[0001c49a] 4eb9 0001 8374            jsr        save_string
[0001c4a0] 4246                      clr.w      d6
[0001c4a2] 602c                      bra.s      out_image_3
out_image_5:
[0001c4a4] 3f1e                      move.w     (a6)+,-(a7)
[0001c4a6] 43eb 06f3                 lea.l      1779(a3),a1
[0001c4aa] 204a                      movea.l    a2,a0
[0001c4ac] 4eb9 0008 15ac            jsr        sprintf
[0001c4b2] 544f                      addq.w     #2,a7
[0001c4b4] 204a                      movea.l    a2,a0
[0001c4b6] 4eb9 0001 8374            jsr        save_string
[0001c4bc] 7007                      moveq.l    #7,d0
[0001c4be] c046                      and.w      d6,d0
[0001c4c0] 5f40                      subq.w     #7,d0
[0001c4c2] 660a                      bne.s      out_image_4
[0001c4c4] 41eb 08fb                 lea.l      2299(a3),a0
[0001c4c8] 4eb9 0001 8374            jsr        save_string
out_image_4:
[0001c4ce] 5246                      addq.w     #1,d6
out_image_3:
[0001c4d0] ba46                      cmp.w      d6,d5
[0001c4d2] 6ed0                      bgt.s      out_image_5
[0001c4d4] 3f1e                      move.w     (a6)+,-(a7)
[0001c4d6] 43eb 0979                 lea.l      2425(a3),a1
[0001c4da] 204a                      movea.l    a2,a0
[0001c4dc] 4eb9 0008 15ac            jsr        sprintf
[0001c4e2] 544f                      addq.w     #2,a7
[0001c4e4] 204a                      movea.l    a2,a0
[0001c4e6] 4eb9 0001 8374            jsr        save_string
[0001c4ec] 3f2d 000c                 move.w     12(a5),-(a7)
[0001c4f0] 3f2d 000a                 move.w     10(a5),-(a7)
[0001c4f4] 3f2d 0008                 move.w     8(a5),-(a7)
[0001c4f8] 3f2d 0006                 move.w     6(a5),-(a7)
[0001c4fc] 3f2d 0004                 move.w     4(a5),-(a7)
[0001c500] 486c 0016                 pea.l      22(a4)
[0001c504] 486c 0016                 pea.l      22(a4)
[0001c508] 43eb 0988                 lea.l      2440(a3),a1
[0001c50c] 204a                      movea.l    a2,a0
[0001c50e] 4eb9 0008 15ac            jsr        sprintf
[0001c514] 4fef 0012                 lea.l      18(a7),a7
[0001c518] 204a                      movea.l    a2,a0
[0001c51a] 4eb9 0001 8374            jsr        save_string
[0001c520] 5244                      addq.w     #1,d4
out_image_2:
[0001c522] b644                      cmp.w      d4,d3
[0001c524] 6e00 ff32                 bgt        out_image_6
out_image_1:
[0001c528] 504f                      addq.w     #8,a7
[0001c52a] 4cdf 7c78                 movem.l    (a7)+,d3-d6/a2-a6
[0001c52e] 4e75                      rts

out_obj:
[0001c530] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0001c534] 4fef ffbc                 lea.l      -68(a7),a7
[0001c538] 2f48 0040                 move.l     a0,64(a7)
[0001c53c] 2f49 003c                 move.l     a1,60(a7)
[0001c540] 45f9 0010 8b4e            lea.l      $00108B4E,a2
[0001c546] 2628 000e                 move.l     14(a0),d3
[0001c54a] e48b                      lsr.l      #2,d3
[0001c54c] 4a43                      tst.w      d3
[0001c54e] 6f00 0382                 ble        out_obj_1
[0001c552] 41e8 0016                 lea.l      22(a0),a0
[0001c556] 4eb9 0001 9d78            jsr        info_list
[0001c55c] 206f 003c                 movea.l    60(a7),a0
[0001c560] 4eb9 0001 8374            jsr        save_string
[0001c566] 33fc ffff 0010 8b4c       move.w     #$FFFF,mapX
[0001c56e] 206f 0040                 movea.l    64(a7),a0
[0001c572] 2f68 0004 0038            move.l     4(a0),56(a7)
[0001c578] 4244                      clr.w      d4
[0001c57a] 4df9 000a 65e4            lea.l      $000A65E4,a6
[0001c580] 47f9 0010 7f66            lea.l      iostring,a3
[0001c586] 49ef 001c                 lea.l      28(a7),a4
[0001c58a] 6000 0340                 bra        out_obj_2
out_obj_23:
[0001c58e] 3004                      move.w     d4,d0
[0001c590] 48c0                      ext.l      d0
[0001c592] e588                      lsl.l      #2,d0
[0001c594] 206f 0038                 movea.l    56(a7),a0
[0001c598] 2f70 0800 0034            move.l     0(a0,d0.l),52(a7)
[0001c59e] 206f 0034                 movea.l    52(a7),a0
[0001c5a2] 41e8 0016                 lea.l      22(a0),a0
[0001c5a6] 4eb9 0001 9dd0            jsr        info_obj
[0001c5ac] 206f 0034                 movea.l    52(a7),a0
[0001c5b0] 2028 000e                 move.l     14(a0),d0
[0001c5b4] 7238                      moveq.l    #56,d1
[0001c5b6] 4eb9 0008 3c5a            jsr        _uldiv
[0001c5bc] 2a00                      move.l     d0,d5
[0001c5be] 206f 0034                 movea.l    52(a7),a0
[0001c5c2] 2a68 0004                 movea.l    4(a0),a5
[0001c5c6] 4246                      clr.w      d6
[0001c5c8] 3486                      move.w     d6,(a2)
[0001c5ca] 4247                      clr.w      d7
[0001c5cc] 6062                      bra.s      out_obj_3
out_obj_7:
[0001c5ce] 2015                      move.l     (a5),d0
[0001c5d0] 671e                      beq.s      out_obj_4
[0001c5d2] 3f06                      move.w     d6,-(a7)
[0001c5d4] 2040                      movea.l    d0,a0
[0001c5d6] 4868 0016                 pea.l      22(a0)
[0001c5da] 43ee 09f9                 lea.l      2553(a6),a1
[0001c5de] 204b                      movea.l    a3,a0
[0001c5e0] 4eb9 0008 15ac            jsr        sprintf
[0001c5e6] 5c4f                      addq.w     #6,a7
[0001c5e8] 204b                      movea.l    a3,a0
[0001c5ea] 4eb9 0001 8374            jsr        save_string
out_obj_4:
[0001c5f0] 202d 0020                 move.l     32(a5),d0
[0001c5f4] 6628                      bne.s      out_obj_5
[0001c5f6] 222d 0024                 move.l     36(a5),d1
[0001c5fa] 6622                      bne.s      out_obj_5
[0001c5fc] 242d 002c                 move.l     44(a5),d2
[0001c600] 661c                      bne.s      out_obj_5
[0001c602] 202d 0030                 move.l     48(a5),d0
[0001c606] 6616                      bne.s      out_obj_5
[0001c608] 222d 0004                 move.l     4(a5),d1
[0001c60c] 6610                      bne.s      out_obj_5
[0001c60e] 342d 002a                 move.w     42(a5),d2
[0001c612] 660a                      bne.s      out_obj_5
[0001c614] 302d 0034                 move.w     52(a5),d0
[0001c618] 6604                      bne.s      out_obj_5
[0001c61a] 5246                      addq.w     #1,d6
[0001c61c] 6002                      bra.s      out_obj_6
out_obj_5:
[0001c61e] 5446                      addq.w     #2,d6
out_obj_6:
[0001c620] 4bed 0038                 lea.l      56(a5),a5
[0001c624] 5247                      addq.w     #1,d7
[0001c626] 3007                      move.w     d7,d0
[0001c628] 48c0                      ext.l      d0
[0001c62a] d080                      add.l      d0,d0
[0001c62c] 3586 0800                 move.w     d6,0(a2,d0.l)
out_obj_3:
[0001c630] ba47                      cmp.w      d7,d5
[0001c632] 6e9a                      bgt.s      out_obj_7
[0001c634] 70ff                      moveq.l    #-1,d0
[0001c636] d046                      add.w      d6,d0
[0001c638] 3f00                      move.w     d0,-(a7)
[0001c63a] 206f 0036                 movea.l    54(a7),a0
[0001c63e] 4868 0016                 pea.l      22(a0)
[0001c642] 43ee 0a04                 lea.l      2564(a6),a1
[0001c646] 204b                      movea.l    a3,a0
[0001c648] 4eb9 0008 15ac            jsr        sprintf
[0001c64e] 5c4f                      addq.w     #6,a7
[0001c650] 204b                      movea.l    a3,a0
[0001c652] 4eb9 0001 8374            jsr        save_string
[0001c658] 206f 0034                 movea.l    52(a7),a0
[0001c65c] 2a68 0004                 movea.l    4(a0),a5
[0001c660] 4247                      clr.w      d7
[0001c662] 6000 0256                 bra        out_obj_8
out_obj_22:
[0001c666] 7018                      moveq.l    #24,d0
[0001c668] 43ed 0008                 lea.l      8(a5),a1
[0001c66c] 204c                      movea.l    a4,a0
[0001c66e] 4eb9 0008 3500            jsr        memcpy
[0001c674] 7018                      moveq.l    #24,d0
[0001c676] 43ed 0020                 lea.l      32(a5),a1
[0001c67a] 41ef 0004                 lea.l      4(a7),a0
[0001c67e] 4eb9 0008 3500            jsr        memcpy
[0001c684] 3014                      move.w     (a4),d0
[0001c686] 48c0                      ext.l      d0
[0001c688] d080                      add.l      d0,d0
[0001c68a] 38b2 0800                 move.w     0(a2,d0.l),(a4)
[0001c68e] 302c 0002                 move.w     2(a4),d0
[0001c692] 48c0                      ext.l      d0
[0001c694] d080                      add.l      d0,d0
[0001c696] 3972 0800 0002            move.w     0(a2,d0.l),2(a4)
[0001c69c] 302c 0004                 move.w     4(a4),d0
[0001c6a0] 48c0                      ext.l      d0
[0001c6a2] d080                      add.l      d0,d0
[0001c6a4] 3972 0800 0004            move.w     0(a2,d0.l),4(a4)
[0001c6aa] 70ff                      moveq.l    #-1,d0
[0001c6ac] d045                      add.w      d5,d0
[0001c6ae] be40                      cmp.w      d0,d7
[0001c6b0] 6622                      bne.s      out_obj_9
[0001c6b2] 3207                      move.w     d7,d1
[0001c6b4] 48c1                      ext.l      d1
[0001c6b6] d281                      add.l      d1,d1
[0001c6b8] 3432 1802                 move.w     2(a2,d1.l),d2
[0001c6bc] 7c02                      moveq.l    #2,d6
[0001c6be] dc72 1800                 add.w      0(a2,d1.l),d6
[0001c6c2] b446                      cmp.w      d6,d2
[0001c6c4] 6608                      bne.s      out_obj_10
[0001c6c6] 006f 0020 000c            ori.w      #$0020,12(a7)
[0001c6cc] 6006                      bra.s      out_obj_9
out_obj_10:
[0001c6ce] 006c 0020 0008            ori.w      #$0020,8(a4)
out_obj_9:
[0001c6d4] 3f2c 000a                 move.w     10(a4),-(a7)
[0001c6d8] 3f2c 0008                 move.w     8(a4),-(a7)
[0001c6dc] 3f2c 0006                 move.w     6(a4),-(a7)
[0001c6e0] 3f2c 0004                 move.w     4(a4),-(a7)
[0001c6e4] 3f2c 0002                 move.w     2(a4),-(a7)
[0001c6e8] 3f14                      move.w     (a4),-(a7)
[0001c6ea] 43ee 0a30                 lea.l      2608(a6),a1
[0001c6ee] 204b                      movea.l    a3,a0
[0001c6f0] 4eb9 0008 15ac            jsr        sprintf
[0001c6f6] 4fef 000c                 lea.l      12(a7),a7
[0001c6fa] 204b                      movea.l    a3,a0
[0001c6fc] 4eb9 0001 8374            jsr        save_string
[0001c702] 0c2c 0014 0007            cmpi.b     #$14,7(a4)
[0001c708] 6710                      beq.s      out_obj_11
[0001c70a] 0c2c 0019 0007            cmpi.b     #$19,7(a4)
[0001c710] 6708                      beq.s      out_obj_11
[0001c712] 0c2c 001b 0007            cmpi.b     #$1B,7(a4)
[0001c718] 6614                      bne.s      out_obj_12
out_obj_11:
[0001c71a] 2f2c 000c                 move.l     12(a4),-(a7)
[0001c71e] 43ee 0a91                 lea.l      2705(a6),a1
[0001c722] 204b                      movea.l    a3,a0
[0001c724] 4eb9 0008 15ac            jsr        sprintf
[0001c72a] 584f                      addq.w     #4,a7
[0001c72c] 6016                      bra.s      out_obj_13
out_obj_12:
[0001c72e] 206c 000c                 movea.l    12(a4),a0
[0001c732] 4868 0016                 pea.l      22(a0)
[0001c736] 43ee 0aab                 lea.l      2731(a6),a1
[0001c73a] 204b                      movea.l    a3,a0
[0001c73c] 4eb9 0008 15ac            jsr        sprintf
[0001c742] 584f                      addq.w     #4,a7
out_obj_13:
[0001c744] 204b                      movea.l    a3,a0
[0001c746] 4eb9 0001 8374            jsr        save_string
[0001c74c] 3f2c 0016                 move.w     22(a4),-(a7)
[0001c750] 3f2c 0014                 move.w     20(a4),-(a7)
[0001c754] 3f2c 0012                 move.w     18(a4),-(a7)
[0001c758] 3f2c 0010                 move.w     16(a4),-(a7)
[0001c75c] 43ee 0ac8                 lea.l      2760(a6),a1
[0001c760] 204b                      movea.l    a3,a0
[0001c762] 4eb9 0008 15ac            jsr        sprintf
[0001c768] 504f                      addq.w     #8,a7
[0001c76a] 204b                      movea.l    a3,a0
[0001c76c] 4eb9 0001 8374            jsr        save_string
[0001c772] 7020                      moveq.l    #32,d0
[0001c774] c06c 0008                 and.w      8(a4),d0
[0001c778] 670c                      beq.s      out_obj_14
[0001c77a] 41ee 0984                 lea.l      2436(a6),a0
[0001c77e] 4eb9 0001 8374            jsr        save_string
[0001c784] 600a                      bra.s      out_obj_15
out_obj_14:
[0001c786] 41ee 0afe                 lea.l      2814(a6),a0
[0001c78a] 4eb9 0001 8374            jsr        save_string
out_obj_15:
[0001c790] 3007                      move.w     d7,d0
[0001c792] 48c0                      ext.l      d0
[0001c794] d080                      add.l      d0,d0
[0001c796] 3232 0802                 move.w     2(a2,d0.l),d1
[0001c79a] 7402                      moveq.l    #2,d2
[0001c79c] d472 0800                 add.w      0(a2,d0.l),d2
[0001c7a0] b242                      cmp.w      d2,d1
[0001c7a2] 6600 0110                 bne        out_obj_16
[0001c7a6] 2c2d 0004                 move.l     4(a5),d6
[0001c7aa] 670a                      beq.s      out_obj_17
[0001c7ac] 2046                      movea.l    d6,a0
[0001c7ae] 41e8 0016                 lea.l      22(a0),a0
[0001c7b2] 2e88                      move.l     a0,(a7)
[0001c7b4] 6006                      bra.s      out_obj_18
out_obj_17:
[0001c7b6] 2ebc 000a 65f4            move.l     #$000A65F4,(a7)
out_obj_18:
[0001c7bc] 206f 0034                 movea.l    52(a7),a0
[0001c7c0] 4868 0016                 pea.l      22(a0)
[0001c7c4] 3007                      move.w     d7,d0
[0001c7c6] 48c0                      ext.l      d0
[0001c7c8] d080                      add.l      d0,d0
[0001c7ca] 3f32 0800                 move.w     0(a2,d0.l),-(a7)
[0001c7ce] 43ee 0b04                 lea.l      2820(a6),a1
[0001c7d2] 204b                      movea.l    a3,a0
[0001c7d4] 4eb9 0008 15ac            jsr        sprintf
[0001c7da] 5c4f                      addq.w     #6,a7
[0001c7dc] 204b                      movea.l    a3,a0
[0001c7de] 4eb9 0001 8374            jsr        save_string
[0001c7e4] 202f 0004                 move.l     4(a7),d0
[0001c7e8] 6720                      beq.s      out_obj_19
[0001c7ea] 41ee 0b0c                 lea.l      2828(a6),a0
[0001c7ee] 4eb9 0001 8374            jsr        save_string
[0001c7f4] 43ee 0406                 lea.l      1030(a6),a1
[0001c7f8] 206f 0004                 movea.l    4(a7),a0
[0001c7fc] 6100 f148                 bsr        out_label
[0001c800] 41ee 0b14                 lea.l      2836(a6),a0
[0001c804] 4eb9 0001 8374            jsr        save_string
out_obj_19:
[0001c80a] 202f 0008                 move.l     8(a7),d0
[0001c80e] 6720                      beq.s      out_obj_20
[0001c810] 41ee 0b17                 lea.l      2839(a6),a0
[0001c814] 4eb9 0001 8374            jsr        save_string
[0001c81a] 43ee 0406                 lea.l      1030(a6),a1
[0001c81e] 206f 0008                 movea.l    8(a7),a0
[0001c822] 6100 f122                 bsr        out_label
[0001c826] 41ee 0b14                 lea.l      2836(a6),a0
[0001c82a] 4eb9 0001 8374            jsr        save_string
out_obj_20:
[0001c830] 3f2f 000e                 move.w     14(a7),-(a7)
[0001c834] 3f2f 000e                 move.w     14(a7),-(a7)
[0001c838] 43ee 0b1e                 lea.l      2846(a6),a1
[0001c83c] 204b                      movea.l    a3,a0
[0001c83e] 4eb9 0008 15ac            jsr        sprintf
[0001c844] 584f                      addq.w     #4,a7
[0001c846] 204b                      movea.l    a3,a0
[0001c848] 4eb9 0001 8374            jsr        save_string
[0001c84e] 41ee 0b3b                 lea.l      2875(a6),a0
[0001c852] 4eb9 0001 8374            jsr        save_string
[0001c858] 43ee 0406                 lea.l      1030(a6),a1
[0001c85c] 206f 0010                 movea.l    16(a7),a0
[0001c860] 6100 f122                 bsr        out_label2
[0001c864] 41ee 0b44                 lea.l      2884(a6),a0
[0001c868] 4eb9 0001 8374            jsr        save_string
[0001c86e] 43ee 0406                 lea.l      1030(a6),a1
[0001c872] 206f 0014                 movea.l    20(a7),a0
[0001c876] 6100 f10c                 bsr        out_label2
[0001c87a] 2f17                      move.l     (a7),-(a7)
[0001c87c] 3f2f 001c                 move.w     28(a7),-(a7)
[0001c880] 43ee 0b4e                 lea.l      2894(a6),a1
[0001c884] 204b                      movea.l    a3,a0
[0001c886] 4eb9 0008 15ac            jsr        sprintf
[0001c88c] 5c4f                      addq.w     #6,a7
[0001c88e] 204b                      movea.l    a3,a0
[0001c890] 4eb9 0001 8374            jsr        save_string
[0001c896] 7020                      moveq.l    #32,d0
[0001c898] c06f 000c                 and.w      12(a7),d0
[0001c89c] 670c                      beq.s      out_obj_21
[0001c89e] 41ee 0984                 lea.l      2436(a6),a0
[0001c8a2] 4eb9 0001 8374            jsr        save_string
[0001c8a8] 600a                      bra.s      out_obj_16
out_obj_21:
[0001c8aa] 41ee 0afe                 lea.l      2814(a6),a0
[0001c8ae] 4eb9 0001 8374            jsr        save_string
out_obj_16:
[0001c8b4] 4bed 0038                 lea.l      56(a5),a5
[0001c8b8] 5247                      addq.w     #1,d7
out_obj_8:
[0001c8ba] ba47                      cmp.w      d7,d5
[0001c8bc] 6e00 fda8                 bgt        out_obj_22
[0001c8c0] 41ee 0208                 lea.l      520(a6),a0
[0001c8c4] 4eb9 0001 8374            jsr        save_string
[0001c8ca] 5244                      addq.w     #1,d4
out_obj_2:
[0001c8cc] b644                      cmp.w      d4,d3
[0001c8ce] 6e00 fcbe                 bgt        out_obj_23
out_obj_1:
[0001c8d2] 4fef 0044                 lea.l      68(a7),a7
[0001c8d6] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0001c8da] 4e75                      rts

out_string:
[0001c8dc] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0001c8e0] 2448                      movea.l    a0,a2
[0001c8e2] 2649                      movea.l    a1,a3
[0001c8e4] 262a 000e                 move.l     14(a2),d3
[0001c8e8] e48b                      lsr.l      #2,d3
[0001c8ea] 4a43                      tst.w      d3
[0001c8ec] 6f00 007e                 ble.w      out_string_1
[0001c8f0] 41ea 0016                 lea.l      22(a2),a0
[0001c8f4] 4eb9 0001 9d78            jsr        info_list
[0001c8fa] 246a 0004                 movea.l    4(a2),a2
[0001c8fe] 204b                      movea.l    a3,a0
[0001c900] 4eb9 0001 8374            jsr        save_string
[0001c906] 4244                      clr.w      d4
[0001c908] 49f9 000a 65e4            lea.l      $000A65E4,a4
[0001c90e] 4bf9 0010 7f66            lea.l      iostring,a5
out_string_4:
[0001c914] 6052                      bra.s      out_string_2
[0001c916] 3004                      move.w     d4,d0
[0001c918] 48c0                      ext.l      d0
[0001c91a] e588                      lsl.l      #2,d0
[0001c91c] 2672 0800                 movea.l    0(a2,d0.l),a3
[0001c920] 43ec 0b6d                 lea.l      2925(a4),a1
[0001c924] 41eb 0016                 lea.l      22(a3),a0
[0001c928] 7004                      moveq.l    #4,d0
[0001c92a] 4eb9 0008 2fb8            jsr        strncmp
[0001c930] 4a40                      tst.w      d0
[0001c932] 6732                      beq.s      out_string_3
[0001c934] 41eb 0016                 lea.l      22(a3),a0
[0001c938] 4eb9 0001 9dd0            jsr        info_obj
[0001c93e] 2f2b 000e                 move.l     14(a3),-(a7)
[0001c942] 486b 0016                 pea.l      22(a3)
[0001c946] 43ec 0b72                 lea.l      2930(a4),a1
[0001c94a] 204d                      movea.l    a5,a0
[0001c94c] 4eb9 0008 15ac            jsr        sprintf
[0001c952] 504f                      addq.w     #8,a7
[0001c954] 204d                      movea.l    a5,a0
[0001c956] 4eb9 0001 8374            jsr        save_string
[0001c95c] 703b                      moveq.l    #59,d0
[0001c95e] 206b 0004                 movea.l    4(a3),a0
[0001c962] 6100 eef6                 bsr        p_string
out_string_3:
[0001c966] 5244                      addq.w     #1,d4
out_string_2:
[0001c968] b644                      cmp.w      d4,d3
[0001c96a] 6eaa                      bgt.s      out_string_4
out_string_1:
[0001c96c] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0001c970] 4e75                      rts

out_tedi:
[0001c972] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0001c976] 2448                      movea.l    a0,a2
[0001c978] 262a 000e                 move.l     14(a2),d3
[0001c97c] e48b                      lsr.l      #2,d3
[0001c97e] 4a43                      tst.w      d3
[0001c980] 6f00 0096                 ble        out_tedi_1
[0001c984] 41ea 0016                 lea.l      22(a2),a0
[0001c988] 4eb9 0001 9d78            jsr        info_list
[0001c98e] 246a 0004                 movea.l    4(a2),a2
[0001c992] 41f9 000a 717b            lea.l      $000A717B,a0
[0001c998] 4eb9 0001 8374            jsr        save_string
[0001c99e] 4244                      clr.w      d4
[0001c9a0] 4bf9 0010 7f66            lea.l      iostring,a5
[0001c9a6] 606c                      bra.s      out_tedi_2
out_tedi_3:
[0001c9a8] 3004                      move.w     d4,d0
[0001c9aa] 48c0                      ext.l      d0
[0001c9ac] e588                      lsl.l      #2,d0
[0001c9ae] 2672 0800                 movea.l    0(a2,d0.l),a3
[0001c9b2] 41eb 0016                 lea.l      22(a3),a0
[0001c9b6] 4eb9 0001 9dd0            jsr        info_obj
[0001c9bc] 286b 0004                 movea.l    4(a3),a4
[0001c9c0] 206c 0004                 movea.l    4(a4),a0
[0001c9c4] 2f28 000e                 move.l     14(a0),-(a7)
[0001c9c8] 2254                      movea.l    (a4),a1
[0001c9ca] 2f29 000e                 move.l     14(a1),-(a7)
[0001c9ce] 3f2c 0016                 move.w     22(a4),-(a7)
[0001c9d2] 3f2c 0012                 move.w     18(a4),-(a7)
[0001c9d6] 3f2c 0010                 move.w     16(a4),-(a7)
[0001c9da] 3f2c 000c                 move.w     12(a4),-(a7)
[0001c9de] 206c 0008                 movea.l    8(a4),a0
[0001c9e2] 4868 0016                 pea.l      22(a0)
[0001c9e6] 226c 0004                 movea.l    4(a4),a1
[0001c9ea] 4869 0016                 pea.l      22(a1)
[0001c9ee] 2054                      movea.l    (a4),a0
[0001c9f0] 4868 0016                 pea.l      22(a0)
[0001c9f4] 486b 0016                 pea.l      22(a3)
[0001c9f8] 43f9 000a 7194            lea.l      $000A7194,a1
[0001c9fe] 204d                      movea.l    a5,a0
[0001ca00] 4eb9 0008 15ac            jsr        sprintf
[0001ca06] 4fef 0020                 lea.l      32(a7),a7
[0001ca0a] 204d                      movea.l    a5,a0
[0001ca0c] 4eb9 0001 8374            jsr        save_string
[0001ca12] 5244                      addq.w     #1,d4
out_tedi_2:
[0001ca14] b644                      cmp.w      d4,d3
[0001ca16] 6e90                      bgt.s      out_tedi_3
out_tedi_1:
[0001ca18] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0001ca1c] 4e75                      rts

out_user:
[0001ca1e] 48e7 181e                 movem.l    d3-d4/a3-a6,-(a7)
[0001ca22] 4fef ffe8                 lea.l      -24(a7),a7
[0001ca26] 2f48 0014                 move.l     a0,20(a7)
[0001ca2a] 2628 000e                 move.l     14(a0),d3
[0001ca2e] e48b                      lsr.l      #2,d3
[0001ca30] 4a43                      tst.w      d3
[0001ca32] 6f00 015c                 ble        out_user_1
[0001ca36] 41e8 0016                 lea.l      22(a0),a0
[0001ca3a] 4eb9 0001 9d78            jsr        info_list
[0001ca40] 206f 0014                 movea.l    20(a7),a0
[0001ca44] 2f68 0004 0010            move.l     4(a0),16(a7)
[0001ca4a] 47f9 000a 65e4            lea.l      $000A65E4,a3
[0001ca50] 41eb 0c5b                 lea.l      3163(a3),a0
[0001ca54] 4eb9 0001 8374            jsr        save_string
[0001ca5a] 4244                      clr.w      d4
[0001ca5c] 4bf9 0010 7f66            lea.l      iostring,a5
[0001ca62] 6000 0126                 bra        out_user_2
out_user_5:
[0001ca66] 3004                      move.w     d4,d0
[0001ca68] 48c0                      ext.l      d0
[0001ca6a] e588                      lsl.l      #2,d0
[0001ca6c] 206f 0010                 movea.l    16(a7),a0
[0001ca70] 2c70 0800                 movea.l    0(a0,d0.l),a6
[0001ca74] 41ee 0016                 lea.l      22(a6),a0
[0001ca78] 4eb9 0001 9dd0            jsr        info_obj
[0001ca7e] 286e 0004                 movea.l    4(a6),a4
[0001ca82] 2054                      movea.l    (a4),a0
[0001ca84] 4868 0016                 pea.l      22(a0)
[0001ca88] 486e 0016                 pea.l      22(a6)
[0001ca8c] 43eb 0c74                 lea.l      3188(a3),a1
[0001ca90] 204d                      movea.l    a5,a0
[0001ca92] 4eb9 0008 15ac            jsr        sprintf
[0001ca98] 504f                      addq.w     #8,a7
[0001ca9a] 204d                      movea.l    a5,a0
[0001ca9c] 4eb9 0001 8374            jsr        save_string
[0001caa2] 2c6c 0004                 movea.l    4(a4),a6
[0001caa6] 4dee 0016                 lea.l      22(a6),a6
[0001caaa] 0c16 0030                 cmpi.b     #$30,(a6)
[0001caae] 6632                      bne.s      out_user_3
[0001cab0] 0c2e 0078 0001            cmpi.b     #$78,1(a6)
[0001cab6] 662a                      bne.s      out_user_3
[0001cab8] 43ee 0002                 lea.l      2(a6),a1
[0001cabc] 41d7                      lea.l      (a7),a0
[0001cabe] 4eb9 0008 2f0c            jsr        strcpy
[0001cac4] 41d7                      lea.l      (a7),a0
[0001cac6] 4eb9 0008 2f6c            jsr        strlen
[0001cacc] 4237 00ff                 clr.b      -1(a7,d0.w)
[0001cad0] 4857                      pea.l      (a7)
[0001cad2] 43eb 0c9b                 lea.l      3227(a3),a1
[0001cad6] 204d                      movea.l    a5,a0
[0001cad8] 4eb9 0008 15ac            jsr        sprintf
[0001cade] 584f                      addq.w     #4,a7
[0001cae0] 6010                      bra.s      out_user_4
out_user_3:
[0001cae2] 2f0e                      move.l     a6,-(a7)
[0001cae4] 43eb 0015                 lea.l      21(a3),a1
[0001cae8] 204d                      movea.l    a5,a0
[0001caea] 4eb9 0008 15ac            jsr        sprintf
[0001caf0] 584f                      addq.w     #4,a7
out_user_4:
[0001caf2] 204d                      movea.l    a5,a0
[0001caf4] 4eb9 0001 8374            jsr        save_string
[0001cafa] 41eb 0c9f                 lea.l      3231(a3),a0
[0001cafe] 4eb9 0001 8374            jsr        save_string
[0001cb04] 43eb 0406                 lea.l      1030(a3),a1
[0001cb08] 206c 0008                 movea.l    8(a4),a0
[0001cb0c] 6100 ee38                 bsr        out_label
[0001cb10] 41eb 0cab                 lea.l      3243(a3),a0
[0001cb14] 4eb9 0001 8374            jsr        save_string
[0001cb1a] 43eb 0406                 lea.l      1030(a3),a1
[0001cb1e] 206c 000c                 movea.l    12(a4),a0
[0001cb22] 6100 ee60                 bsr        out_label2
[0001cb26] 41eb 0cb7                 lea.l      3255(a3),a0
[0001cb2a] 4eb9 0001 8374            jsr        save_string
[0001cb30] 43eb 0406                 lea.l      1030(a3),a1
[0001cb34] 206c 0010                 movea.l    16(a4),a0
[0001cb38] 6100 ee4a                 bsr        out_label2
[0001cb3c] 41eb 0cc3                 lea.l      3267(a3),a0
[0001cb40] 4eb9 0001 8374            jsr        save_string
[0001cb46] 43eb 0406                 lea.l      1030(a3),a1
[0001cb4a] 206c 0014                 movea.l    20(a4),a0
[0001cb4e] 6100 ee34                 bsr        out_label2
[0001cb52] 41eb 0ccf                 lea.l      3279(a3),a0
[0001cb56] 4eb9 0001 8374            jsr        save_string
[0001cb5c] 43eb 0406                 lea.l      1030(a3),a1
[0001cb60] 206c 0018                 movea.l    24(a4),a0
[0001cb64] 6100 ee1e                 bsr        out_label2
[0001cb68] 41eb 0cda                 lea.l      3290(a3),a0
[0001cb6c] 4eb9 0001 8374            jsr        save_string
[0001cb72] 43eb 0406                 lea.l      1030(a3),a1
[0001cb76] 206c 001c                 movea.l    28(a4),a0
[0001cb7a] 6100 ee08                 bsr        out_label2
[0001cb7e] 41eb 0208                 lea.l      520(a3),a0
[0001cb82] 4eb9 0001 8374            jsr        save_string
[0001cb88] 5244                      addq.w     #1,d4
out_user_2:
[0001cb8a] b644                      cmp.w      d4,d3
[0001cb8c] 6e00 fed8                 bgt        out_user_5
out_user_1:
[0001cb90] 4fef 0018                 lea.l      24(a7),a7
[0001cb94] 4cdf 7818                 movem.l    (a7)+,d3-d4/a3-a6
[0001cb98] 4e75                      rts

out_data:
[0001cb9a] 48e7 1e3c                 movem.l    d3-d6/a2-a5,-(a7)
[0001cb9e] 2448                      movea.l    a0,a2
[0001cba0] 262a 000e                 move.l     14(a2),d3
[0001cba4] e48b                      lsr.l      #2,d3
[0001cba6] 4a43                      tst.w      d3
[0001cba8] 6f00 00c2                 ble        out_data_1
[0001cbac] 41ea 0016                 lea.l      22(a2),a0
[0001cbb0] 4eb9 0001 9d78            jsr        info_list
[0001cbb6] 246a 0004                 movea.l    4(a2),a2
[0001cbba] 47f9 000a 65e4            lea.l      $000A65E4,a3
[0001cbc0] 41eb 0ce6                 lea.l      3302(a3),a0
[0001cbc4] 4eb9 0001 8374            jsr        save_string
[0001cbca] 4244                      clr.w      d4
[0001cbcc] 49f9 0010 7f66            lea.l      iostring,a4
[0001cbd2] 6000 0092                 bra        out_data_2
out_data_7:
[0001cbd6] 3004                      move.w     d4,d0
[0001cbd8] 48c0                      ext.l      d0
[0001cbda] e588                      lsl.l      #2,d0
[0001cbdc] 2a72 0800                 movea.l    0(a2,d0.l),a5
[0001cbe0] 41ed 0016                 lea.l      22(a5),a0
[0001cbe4] 4eb9 0001 9dd0            jsr        info_obj
[0001cbea] 7aff                      moveq.l    #-1,d5
[0001cbec] daad 000e                 add.l      14(a5),d5
[0001cbf0] e285                      asr.l      #1,d5
[0001cbf2] 4a85                      tst.l      d5
[0001cbf4] 6f6e                      ble.s      out_data_3
[0001cbf6] 2f05                      move.l     d5,-(a7)
[0001cbf8] 486d 0016                 pea.l      22(a5)
[0001cbfc] 43eb 0cfc                 lea.l      3324(a3),a1
[0001cc00] 204c                      movea.l    a4,a0
[0001cc02] 4eb9 0008 15ac            jsr        sprintf
[0001cc08] 504f                      addq.w     #8,a7
[0001cc0a] 204c                      movea.l    a4,a0
[0001cc0c] 4eb9 0001 8374            jsr        save_string
[0001cc12] 2a6d 0004                 movea.l    4(a5),a5
[0001cc16] 7c00                      moveq.l    #0,d6
[0001cc18] 602e                      bra.s      out_data_4
out_data_6:
[0001cc1a] 3f1d                      move.w     (a5)+,-(a7)
[0001cc1c] 43eb 06f3                 lea.l      1779(a3),a1
[0001cc20] 204c                      movea.l    a4,a0
[0001cc22] 4eb9 0008 15ac            jsr        sprintf
[0001cc28] 544f                      addq.w     #2,a7
[0001cc2a] 204c                      movea.l    a4,a0
[0001cc2c] 4eb9 0001 8374            jsr        save_string
[0001cc32] 7007                      moveq.l    #7,d0
[0001cc34] c086                      and.l      d6,d0
[0001cc36] 7207                      moveq.l    #7,d1
[0001cc38] b280                      cmp.l      d0,d1
[0001cc3a] 660a                      bne.s      out_data_5
[0001cc3c] 41eb 08fb                 lea.l      2299(a3),a0
[0001cc40] 4eb9 0001 8374            jsr        save_string
out_data_5:
[0001cc46] 5286                      addq.l     #1,d6
out_data_4:
[0001cc48] ba86                      cmp.l      d6,d5
[0001cc4a] 6ece                      bgt.s      out_data_6
[0001cc4c] 3f1d                      move.w     (a5)+,-(a7)
[0001cc4e] 43eb 0732                 lea.l      1842(a3),a1
[0001cc52] 204c                      movea.l    a4,a0
[0001cc54] 4eb9 0008 15ac            jsr        sprintf
[0001cc5a] 544f                      addq.w     #2,a7
[0001cc5c] 204c                      movea.l    a4,a0
[0001cc5e] 4eb9 0001 8374            jsr        save_string
out_data_3:
[0001cc64] 5244                      addq.w     #1,d4
out_data_2:
[0001cc66] b644                      cmp.w      d4,d3
[0001cc68] 6e00 ff6c                 bgt        out_data_7
out_data_1:
[0001cc6c] 4cdf 3c78                 movem.l    (a7)+,d3-d6/a2-a5
[0001cc70] 4e75                      rts

out_window:
[0001cc72] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[0001cc76] 2448                      movea.l    a0,a2
[0001cc78] 262a 000e                 move.l     14(a2),d3
[0001cc7c] e48b                      lsr.l      #2,d3
[0001cc7e] 4a43                      tst.w      d3
[0001cc80] 6f00 02ca                 ble        out_window_1
[0001cc84] 41ea 0016                 lea.l      22(a2),a0
[0001cc88] 4eb9 0001 9d78            jsr        info_list
[0001cc8e] 246a 0004                 movea.l    4(a2),a2
[0001cc92] 47f9 000a 65e4            lea.l      $000A65E4,a3
[0001cc98] 41eb 0d22                 lea.l      3362(a3),a0
[0001cc9c] 4eb9 0001 8374            jsr        save_string
[0001cca2] 4244                      clr.w      d4
[0001cca4] 4df9 0010 7f66            lea.l      iostring,a6
[0001ccaa] 6000 029a                 bra        out_window_2
out_window_3:
[0001ccae] 3004                      move.w     d4,d0
[0001ccb0] 48c0                      ext.l      d0
[0001ccb2] e588                      lsl.l      #2,d0
[0001ccb4] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001ccb8] 41ec 0016                 lea.l      22(a4),a0
[0001ccbc] 4eb9 0001 9dd0            jsr        info_obj
[0001ccc2] 2a6c 0004                 movea.l    4(a4),a5
[0001ccc6] 486c 0016                 pea.l      22(a4)
[0001ccca] 43eb 0d3a                 lea.l      3386(a3),a1
[0001ccce] 204e                      movea.l    a6,a0
[0001ccd0] 4eb9 0008 15ac            jsr        sprintf
[0001ccd6] 584f                      addq.w     #4,a7
[0001ccd8] 204e                      movea.l    a6,a0
[0001ccda] 4eb9 0001 8374            jsr        save_string
[0001cce0] 41eb 0d4f                 lea.l      3407(a3),a0
[0001cce4] 4eb9 0001 8374            jsr        save_string
[0001ccea] 43eb 0406                 lea.l      1030(a3),a1
[0001ccee] 2055                      movea.l    (a5),a0
[0001ccf0] 6100 ec92                 bsr        out_label2
[0001ccf4] 41eb 0d58                 lea.l      3416(a3),a0
[0001ccf8] 4eb9 0001 8374            jsr        save_string
[0001ccfe] 43eb 0d67                 lea.l      3431(a3),a1
[0001cd02] 206d 0004                 movea.l    4(a5),a0
[0001cd06] 6100 ec3e                 bsr        out_label
[0001cd0a] 41eb 0d73                 lea.l      3443(a3),a0
[0001cd0e] 4eb9 0001 8374            jsr        save_string
[0001cd14] 43eb 0d81                 lea.l      3457(a3),a1
[0001cd18] 206d 0008                 movea.l    8(a5),a0
[0001cd1c] 6100 ec28                 bsr        out_label
[0001cd20] 41eb 0d90                 lea.l      3472(a3),a0
[0001cd24] 4eb9 0001 8374            jsr        save_string
[0001cd2a] 43eb 0d9c                 lea.l      3484(a3),a1
[0001cd2e] 206d 000c                 movea.l    12(a5),a0
[0001cd32] 6100 ec12                 bsr        out_label
[0001cd36] 41eb 0da5                 lea.l      3493(a3),a0
[0001cd3a] 4eb9 0001 8374            jsr        save_string
[0001cd40] 43eb 0db1                 lea.l      3505(a3),a1
[0001cd44] 206d 0010                 movea.l    16(a5),a0
[0001cd48] 6100 ebfc                 bsr        out_label
[0001cd4c] 41eb 0dba                 lea.l      3514(a3),a0
[0001cd50] 4eb9 0001 8374            jsr        save_string
[0001cd56] 43eb 0406                 lea.l      1030(a3),a1
[0001cd5a] 206d 0014                 movea.l    20(a5),a0
[0001cd5e] 6100 ec24                 bsr        out_label2
[0001cd62] 41eb 0dc6                 lea.l      3526(a3),a0
[0001cd66] 4eb9 0001 8374            jsr        save_string
[0001cd6c] 43eb 0406                 lea.l      1030(a3),a1
[0001cd70] 206d 0018                 movea.l    24(a5),a0
[0001cd74] 6100 ec0e                 bsr        out_label2
[0001cd78] 41eb 0dd5                 lea.l      3541(a3),a0
[0001cd7c] 4eb9 0001 8374            jsr        save_string
[0001cd82] 3f2d 002a                 move.w     42(a5),-(a7)
[0001cd86] 3f2d 0028                 move.w     40(a5),-(a7)
[0001cd8a] 3f2d 0026                 move.w     38(a5),-(a7)
[0001cd8e] 3f2d 0024                 move.w     36(a5),-(a7)
[0001cd92] 3f2d 0022                 move.w     34(a5),-(a7)
[0001cd96] 43eb 0dfe                 lea.l      3582(a3),a1
[0001cd9a] 204e                      movea.l    a6,a0
[0001cd9c] 4eb9 0008 15ac            jsr        sprintf
[0001cda2] 4fef 000a                 lea.l      10(a7),a7
[0001cda6] 204e                      movea.l    a6,a0
[0001cda8] 4eb9 0001 8374            jsr        save_string
[0001cdae] 41eb 0e3c                 lea.l      3644(a3),a0
[0001cdb2] 4eb9 0001 8374            jsr        save_string
[0001cdb8] 3f2d 0048                 move.w     72(a5),-(a7)
[0001cdbc] 43eb 0e69                 lea.l      3689(a3),a1
[0001cdc0] 204e                      movea.l    a6,a0
[0001cdc2] 4eb9 0008 15ac            jsr        sprintf
[0001cdc8] 544f                      addq.w     #2,a7
[0001cdca] 204e                      movea.l    a6,a0
[0001cdcc] 4eb9 0001 8374            jsr        save_string
[0001cdd2] 41eb 0e7f                 lea.l      3711(a3),a0
[0001cdd6] 4eb9 0001 8374            jsr        save_string
[0001cddc] 43eb 0406                 lea.l      1030(a3),a1
[0001cde0] 206d 004a                 movea.l    74(a5),a0
[0001cde4] 6100 eb9e                 bsr        out_label2
[0001cde8] 41eb 0e8a                 lea.l      3722(a3),a0
[0001cdec] 4eb9 0001 8374            jsr        save_string
[0001cdf2] 43eb 0406                 lea.l      1030(a3),a1
[0001cdf6] 206d 004e                 movea.l    78(a5),a0
[0001cdfa] 6100 eb88                 bsr        out_label2
[0001cdfe] 3f2d 0054                 move.w     84(a5),-(a7)
[0001ce02] 3f2d 0052                 move.w     82(a5),-(a7)
[0001ce06] 43eb 0e93                 lea.l      3731(a3),a1
[0001ce0a] 204e                      movea.l    a6,a0
[0001ce0c] 4eb9 0008 15ac            jsr        sprintf
[0001ce12] 584f                      addq.w     #4,a7
[0001ce14] 204e                      movea.l    a6,a0
[0001ce16] 4eb9 0001 8374            jsr        save_string
[0001ce1c] 41eb 0ebe                 lea.l      3774(a3),a0
[0001ce20] 4eb9 0001 8374            jsr        save_string
[0001ce26] 43eb 0406                 lea.l      1030(a3),a1
[0001ce2a] 206d 005a                 movea.l    90(a5),a0
[0001ce2e] 6100 eb54                 bsr        out_label2
[0001ce32] 41eb 0ecd                 lea.l      3789(a3),a0
[0001ce36] 4eb9 0001 8374            jsr        save_string
[0001ce3c] 43eb 0406                 lea.l      1030(a3),a1
[0001ce40] 206d 005e                 movea.l    94(a5),a0
[0001ce44] 6100 eb3e                 bsr        out_label2
[0001ce48] 41eb 0ed9                 lea.l      3801(a3),a0
[0001ce4c] 4eb9 0001 8374            jsr        save_string
[0001ce52] 43eb 0ee5                 lea.l      3813(a3),a1
[0001ce56] 206d 0062                 movea.l    98(a5),a0
[0001ce5a] 6100 eaea                 bsr        out_label
[0001ce5e] 41eb 0eee                 lea.l      3822(a3),a0
[0001ce62] 4eb9 0001 8374            jsr        save_string
[0001ce68] 43eb 0efe                 lea.l      3838(a3),a1
[0001ce6c] 206d 0066                 movea.l    102(a5),a0
[0001ce70] 6100 ead4                 bsr        out_label
[0001ce74] 41eb 0f0b                 lea.l      3851(a3),a0
[0001ce78] 4eb9 0001 8374            jsr        save_string
[0001ce7e] 43eb 0f19                 lea.l      3865(a3),a1
[0001ce82] 206d 006a                 movea.l    106(a5),a0
[0001ce86] 6100 eabe                 bsr        out_label
[0001ce8a] 41eb 0f24                 lea.l      3876(a3),a0
[0001ce8e] 4eb9 0001 8374            jsr        save_string
[0001ce94] 43eb 0f32                 lea.l      3890(a3),a1
[0001ce98] 206d 006e                 movea.l    110(a5),a0
[0001ce9c] 6100 eaa8                 bsr        out_label
[0001cea0] 41eb 0f3d                 lea.l      3901(a3),a0
[0001cea4] 4eb9 0001 8374            jsr        save_string
[0001ceaa] 43eb 0f4b                 lea.l      3915(a3),a1
[0001ceae] 206d 0072                 movea.l    114(a5),a0
[0001ceb2] 6100 ea92                 bsr        out_label
[0001ceb6] 41eb 0f56                 lea.l      3926(a3),a0
[0001ceba] 4eb9 0001 8374            jsr        save_string
[0001cec0] 43eb 0f64                 lea.l      3940(a3),a1
[0001cec4] 206d 0076                 movea.l    118(a5),a0
[0001cec8] 6100 ea7c                 bsr        out_label
[0001cecc] 41eb 0f6f                 lea.l      3951(a3),a0
[0001ced0] 4eb9 0001 8374            jsr        save_string
[0001ced6] 43eb 0f7e                 lea.l      3966(a3),a1
[0001ceda] 206d 007a                 movea.l    122(a5),a0
[0001cede] 6100 ea66                 bsr        out_label
[0001cee2] 41eb 0f8a                 lea.l      3978(a3),a0
[0001cee6] 4eb9 0001 8374            jsr        save_string
[0001ceec] 43eb 0f97                 lea.l      3991(a3),a1
[0001cef0] 206d 007e                 movea.l    126(a5),a0
[0001cef4] 6100 ea50                 bsr        out_label
[0001cef8] 41eb 0fa1                 lea.l      4001(a3),a0
[0001cefc] 4eb9 0001 8374            jsr        save_string
[0001cf02] 43eb 0fae                 lea.l      4014(a3),a1
[0001cf06] 206d 0082                 movea.l    130(a5),a0
[0001cf0a] 6100 ea3a                 bsr        out_label
[0001cf0e] 41eb 0fb8                 lea.l      4024(a3),a0
[0001cf12] 4eb9 0001 8374            jsr        save_string
[0001cf18] 43eb 0fc5                 lea.l      4037(a3),a1
[0001cf1c] 206d 0086                 movea.l    134(a5),a0
[0001cf20] 6100 ea24                 bsr        out_label
[0001cf24] 41eb 0fcf                 lea.l      4047(a3),a0
[0001cf28] 4eb9 0001 8374            jsr        save_string
[0001cf2e] 43eb 0fdc                 lea.l      4060(a3),a1
[0001cf32] 206d 008a                 movea.l    138(a5),a0
[0001cf36] 6100 ea0e                 bsr        out_label
[0001cf3a] 41eb 0870                 lea.l      2160(a3),a0
[0001cf3e] 4eb9 0001 8374            jsr        save_string
[0001cf44] 5244                      addq.w     #1,d4
out_window_2:
[0001cf46] b644                      cmp.w      d4,d3
[0001cf48] 6e00 fd64                 bgt        out_window_3
out_window_1:
[0001cf4c] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[0001cf50] 4e75                      rts

pp_output:
[0001cf52] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0001cf56] 4fef ff78                 lea.l      -136(a7),a7
[0001cf5a] 2448                      movea.l    a0,a2
[0001cf5c] 705c                      moveq.l    #92,d0
[0001cf5e] 206a 0008                 movea.l    8(a2),a0
[0001cf62] 4eb9 0008 2e9e            jsr        strrchr
[0001cf68] 5248                      addq.w     #1,a0
[0001cf6a] 2e88                      move.l     a0,(a7)
[0001cf6c] 49ef 0004                 lea.l      4(a7),a4
[0001cf70] 226a 0008                 movea.l    8(a2),a1
[0001cf74] 204c                      movea.l    a4,a0
[0001cf76] 4eb9 0008 2f0c            jsr        strcpy
[0001cf7c] 702e                      moveq.l    #46,d0
[0001cf7e] 204c                      movea.l    a4,a0
[0001cf80] 4eb9 0008 2e9e            jsr        strrchr
[0001cf86] 2648                      movea.l    a0,a3
[0001cf88] 4bf9 000a 65e4            lea.l      $000A65E4,a5
[0001cf8e] 43ed 0fe6                 lea.l      4070(a5),a1
[0001cf92] 204b                      movea.l    a3,a0
[0001cf94] 4eb9 0008 2f0c            jsr        strcpy
[0001cf9a] 4240                      clr.w      d0
[0001cf9c] 204c                      movea.l    a4,a0
[0001cf9e] 4eb9 0008 0c8e            jsr        Fcreate
[0001cfa4] 2600                      move.l     d0,d3
[0001cfa6] 4a43                      tst.w      d3
[0001cfa8] 6a14                      bpl.s      pp_output_1
[0001cfaa] 2057                      movea.l    (a7),a0
[0001cfac] 7009                      moveq.l    #9,d0
[0001cfae] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001cfb4] 2269 03d6                 movea.l    982(a1),a1
[0001cfb8] 4e91                      jsr        (a1)
[0001cfba] 6000 0160                 bra        pp_output_2
pp_output_1:
[0001cfbe] 204c                      movea.l    a4,a0
[0001cfc0] 4eb9 0001 9c30            jsr        info_start
[0001cfc6] 41ed 0fe9                 lea.l      4073(a5),a0
[0001cfca] 4eb9 0001 9d14            jsr        info_title
[0001cfd0] 3003                      move.w     d3,d0
[0001cfd2] 4eb9 0001 82bc            jsr        set_handle
[0001cfd8] 4eb9 0008 108e            jsr        setjmp
[0001cfde] 4a40                      tst.w      d0
[0001cfe0] 6714                      beq.s      pp_output_3
[0001cfe2] 91c8                      suba.l     a0,a0
[0001cfe4] 700a                      moveq.l    #10,d0
[0001cfe6] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001cfec] 2269 03d6                 movea.l    982(a1),a1
[0001cff0] 4e91                      jsr        (a1)
[0001cff2] 6000 011a                 bra        pp_output_4
pp_output_3:
[0001cff6] 91c8                      suba.l     a0,a0
[0001cff8] 4eb9 0008 12ca            jsr        time
[0001cffe] 2f40 0084                 move.l     d0,132(a7)
[0001d002] 4213                      clr.b      (a3)
[0001d004] 47f9 0010 7f66            lea.l      iostring,a3
[0001d00a] 2f2a 0008                 move.l     8(a2),-(a7)
[0001d00e] 41ef 0088                 lea.l      136(a7),a0
[0001d012] 4eb9 0008 124a            jsr        ctime
[0001d018] 2f08                      move.l     a0,-(a7)
[0001d01a] 43f9 000a 4d44            lea.l      pp_welcome,a1
[0001d020] 204b                      movea.l    a3,a0
[0001d022] 4eb9 0008 15ac            jsr        sprintf
[0001d028] 504f                      addq.w     #8,a7
[0001d02a] 204b                      movea.l    a3,a0
[0001d02c] 4eb9 0001 8374            jsr        save_string
[0001d032] 41ed 0ffa                 lea.l      4090(a5),a0
[0001d036] 4eb9 0001 8374            jsr        save_string
[0001d03c] 41ed 101e                 lea.l      4126(a5),a0
[0001d040] 4eb9 0001 8374            jsr        save_string
[0001d046] 7001                      moveq.l    #1,d0
[0001d048] d06a 01f4                 add.w      500(a2),d0
[0001d04c] 3f00                      move.w     d0,-(a7)
[0001d04e] 43ed 1036                 lea.l      4150(a5),a1
[0001d052] 204b                      movea.l    a3,a0
[0001d054] 4eb9 0008 15ac            jsr        sprintf
[0001d05a] 544f                      addq.w     #2,a7
[0001d05c] 204b                      movea.l    a3,a0
[0001d05e] 4eb9 0001 8374            jsr        save_string
[0001d064] 302a 0006                 move.w     6(a2),d0
[0001d068] c07c 2000                 and.w      #$2000,d0
[0001d06c] 6706                      beq.s      pp_output_5
[0001d06e] 204a                      movea.l    a2,a0
[0001d070] 6100 ea26                 bsr        out_declproto
pp_output_5:
[0001d074] 41ed 104f                 lea.l      4175(a5),a0
[0001d078] 4eb9 0001 8374            jsr        save_string
[0001d07e] 43ed 1057                 lea.l      4183(a5),a1
[0001d082] 206a 0024                 movea.l    36(a2),a0
[0001d086] 6100 f854                 bsr        out_string
[0001d08a] 43ed 106f                 lea.l      4207(a5),a1
[0001d08e] 206a 0034                 movea.l    52(a2),a0
[0001d092] 6100 f848                 bsr        out_string
[0001d096] 206a 0044                 movea.l    68(a2),a0
[0001d09a] 6100 fafe                 bsr        out_data
[0001d09e] 206a 0028                 movea.l    40(a2),a0
[0001d0a2] 6100 f8ce                 bsr        out_tedi
[0001d0a6] 206a 0038                 movea.l    56(a2),a0
[0001d0aa] 6100 f972                 bsr        out_user
[0001d0ae] 206a 002c                 movea.l    44(a2),a0
[0001d0b2] 6100 f03c                 bsr        out_icon
[0001d0b6] 206a 0030                 movea.l    48(a2),a0
[0001d0ba] 6100 f358                 bsr        out_image
[0001d0be] 43ed 1083                 lea.l      4227(a5),a1
[0001d0c2] 206a 001c                 movea.l    28(a2),a0
[0001d0c6] 6100 f468                 bsr        out_obj
[0001d0ca] 43ed 109a                 lea.l      4250(a5),a1
[0001d0ce] 206a 0020                 movea.l    32(a2),a0
[0001d0d2] 6100 f45c                 bsr        out_obj
[0001d0d6] 43ed 10b2                 lea.l      4274(a5),a1
[0001d0da] 206a 0018                 movea.l    24(a2),a0
[0001d0de] 6100 f450                 bsr        out_obj
[0001d0e2] 206a 0014                 movea.l    20(a2),a0
[0001d0e6] 6100 fb8a                 bsr        out_window
[0001d0ea] 206a 0040                 movea.l    64(a2),a0
[0001d0ee] 6100 f1fc                 bsr        out_mouse
[0001d0f2] 204a                      movea.l    a2,a0
[0001d0f4] 6100 ebaa                 bsr        out_acs
[0001d0f8] 302a 0006                 move.w     6(a2),d0
[0001d0fc] c07c 2000                 and.w      #$2000,d0
[0001d100] 6706                      beq.s      pp_output_6
[0001d102] 204a                      movea.l    a2,a0
[0001d104] 6100 e8fa                 bsr        out_refs
pp_output_6:
[0001d108] 4eb9 0001 8388            jsr        close_buf
pp_output_4:
[0001d10e] 4eb9 0001 9cf4            jsr        info_end
[0001d114] 3003                      move.w     d3,d0
[0001d116] 4eb9 0008 0c7e            jsr        Fclose
pp_output_2:
[0001d11c] 4fef 0088                 lea.l      136(a7),a7
[0001d120] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0001d124] 4e75                      rts

	.data

[000a65c0]                           dc.b ';',$0d,$0a,0
[000a65c4]                           dc.b '                                '',0
[000a65e6]                           dc.b ''#%i'',0
[000a65ec]                           dc.w $2727
[000a65ee]                           dc.w $0025
[000a65f0]                           dc.w $6300
[000a65f2]                           dc.b ''#0',0
[000a65f6]                           dc.w $2573
[000a65f8]                           dc.w $0040
[000a65fa]                           dc.w $2573
[000a65fc]                           dc.w $0040
[000a65fe]                           dc.b '%-12s[3]',0
[000a6607]                           dc.b $0d,$0a,'IMPLEMENTATION',$0d,$0a,$0d,$0a,'(*',$09,'Pascal Routines',$09,'*)',$0d,$0a,$0d,$0a,0
[000a6635]                           dc.b '(* '%s' Not yet defined by user *)',$0d,$0a,0
[000a665a]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'Pascal Prototypes',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a667c]                           dc.b 'Procedure %s;',$0d,$0a,0
[000a668c]                           dc.b 'Function %s( dummy1, dummy2: Pointer; pb: PARMBLKPtr ) : Integer;',$0d,$0a,0
[000a66d0]                           dc.b 'Function %s( entry: ACSOBJECTPtr; task: Integer; in_out: Pointer ) : Boolean;',$0d,$0a,0
[000a6720]                           dc.b 'Function %s( wi: AwindowPtr ) : Integer;',$0d,$0a,0
[000a674b]                           dc.b 'Function %s( para: Pointer ) : AwindowPtr;',$0d,$0a,0
[000a6778]                           dc.b 'Function %s( wi: AwindowPtr; kstate, key: Integer ) : Integer;',$0d,$0a,0
[000a67b9]                           dc.b 'Procedure %s( wi: AwindowPtr; obnr, state: Integer );',$0d,$0a,0
[000a67f1]                           dc.b 'Procedure %s( wi: AwindowPtr; area: AxywhPtr );',$0d,$0a,0
[000a6823]                           dc.b 'Procedure %s( wi: AwindowPtr );',$0d,$0a,0
[000a6845]                           dc.b 'Procedure %s( wi: AwindowPtr; pos: Integer );',$0d,$0a,0
[000a6875]                           dc.b 'Function %s( wi: AwindowPtr; task: Integer; in_out: Pointer ) : Boolean;',$0d,$0a,0
[000a68c0]                           dc.b 'Function %s( wi: AwindowPtr; all: Integer ) : Integer;',$0d,$0a,0
[000a68f9]                           dc.b 'Function %s( wi: AwindowPtr; anz: Integer; cmd: Pointer; antwort: A_GSAntwortPtr ) : Integer;',$0d,$0a,0
[000a6959]                           dc.b '(* %s Type %d ?? *)',$0d,$0a,0
[000a696f]                           dc.b $0d,$0a,$0d,$0a,'ACSdescr: Adescr = ',$0d,$0a,$09,'(',$0d,$0a,0
[000a698d]                           dc.b $09,$09,'magic: '%s'#0; version: %d; dx: %2d; dy: %2d; flags: $%04x;',$0d,$0a,' ',$09,$09,'acc_reg: ',0
[000a69d9]                           dc.b 'ACS3.00',0
[000a69e1]                           dc.b $09,$09,'root: ',0
[000a69ea]                           dc.b 'NIL',0
[000a69ee]                           dc.b '; acc: ',0
[000a69f6]                           dc.b ';',$0d,$0a,$09,$09,'mouse: (',$0d,$0a,0
[000a6a06]                           dc.b ',',$0d,$0a,0
[000a6a0a]                           dc.b $09,$09,$09,'(number: 255; form: @%s)',0
[000a6a26]                           dc.b $09,$09,$09,'(number: %3d; form: NIL)',0
[000a6a42]                           dc.b $0d,$0a,$09,$09,');',$0d,$0a,$09,$09,'mess: (',$0d,$0a,0
[000a6a56]                           dc.b $09,$09,$09,$09,0
[000a6a5b]                           dc.b 'ACS(%02d)',0
[000a6a65]                           dc.b $0d,$0a,$09,$09,')',$0d,$0a,$09,');',$0d,$0a,0
[000a6a72]                           dc.b $0d,$0a,$0d,$0a,'ACSconfig: Aconfig = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a6a94]                           dc.b 'CfgInfo: (',$0d,$0a,$09,$09,$09,'dateiname: '',0
[000a6ab0]                           dc.b ''; comment: '',0
[000a6abe]                           dc.w $253b
[000a6ac0]                           dc.w $0027
[000a6ac2]                           dc.b '; env_praefix: ',0
[000a6ad2]                           dc.b '; ',$0d,$0a,$09,$09,$09,'casesensitiv: ',0
[000a6ae8]                           dc.b 'TRUE',0
[000a6aed]                           dc.b 'FALSE',0
[000a6af3]                           dc.b '; file_sensitiv: ',0
[000a6b05]                           dc.b ';',$0d,$0a,$09,$09,$09,'file_buffer: ',0
[000a6b19]                           dc.b '%i',$0d,$0a,$09,$09,');',$0d,$0a,$09,$09,0
[000a6b26]                           dc.b 'BaseName: '',0
[000a6b32]                           dc.b 'PUR_DESK',0
[000a6b3b]                           dc.b ''; ACSterm: ',0
[000a6b48]                           dc.b '; ACSaboutme: ',0
[000a6b57]                           dc.b '; ACSclose: ',0
[000a6b64]                           dc.b ';',$0d,$0a,$09,$09,'ACSmessage: ',0
[000a6b76]                           dc.b '; ACSmproto: ',0
[000a6b84]                           dc.b '; ACStimer: ',0
[000a6b91]                           dc.b '; ACSkey: ',0
[000a6b9c]                           dc.b ';',$0d,$0a,$09,$09,'ACSbutton: ',0
[000a6bad]                           dc.b '; ACSmouse: ',0
[000a6bba]                           dc.b '; ACSwikey: ',0
[000a6bc7]                           dc.b ';',$0d,$0a,$09,$09,'init_prot: ',0
[000a6bd8]                           dc.b '%i; XAccType: ',0
[000a6be7]                           dc.b '%i; ACSGEMScript: ',0
[000a6bfa]                           dc.b '_C%d_%-s: CICON = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'num_planes: %d;',$0d,$0a,$09,$09,'col_data: ',0
[000a6c32]                           dc.b ';',$0d,$0a,$09,$09,'col_mask: ',0
[000a6c42]                           dc.b ';',$0d,$0a,$09,$09,'sel_data: ',0
[000a6c52]                           dc.b ';',$0d,$0a,$09,$09,'sel_mask: ',0
[000a6c62]                           dc.b ';',$0d,$0a,$09,$09,'next_res: @_C%d_%-s);',$0d,$0a,0
[000a6c7f]                           dc.b ';',$0d,$0a,$09,$09,'next_res: NIL);',$0d,$0a,0
[000a6c96]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'ICONS',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a6cac]                           dc.b '_MSK_%-s: array [0..%d] of WORD = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a6cd7]                           dc.b '$%04x, ',0
[000a6cdf]                           dc.b '$%04x',$0d,$0a,$09,');',$0d,$0a,'_DAT_%-s: array [0..%d] of WORD = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a6d16]                           dc.b '$%04x',$0d,$0a,$09,');',$0d,$0a,0
[000a6d23]                           dc.b '%-s: CICONBLK = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'monoblk: ',$0d,$0a,$09,$09,'(',$0d,$0a,$09,$09,$09,'ib_pmask: @_MSK_%s; ib_pdata: @_DAT_%s; ib_ptext: @%s;',$0d,$0a,$09,$09,$09,'ib_char: $%04x; ib_xchar: %2d; ib_ychar: %2d;',$0d,$0a,$09,$09,$09,'ib_xicon: %2d; ib_yicon: %2d; ib_wicon: %2d; ib_hicon: %2d;',$0d,$0a,$09,$09,$09,'ib_xtext: %2d; ib_ytext: %2d; ib_wtext: %2d; ib_htext: %2d',$0d,$0a,$09,$09,');',$0d,$0a,$09,$09,'mainlist: ',0
[000a6e4a]                           dc.b '@_C%d_%-s',0
[000a6e54]                           dc.b $0d,$0a,$09,');',$0d,$0a,$0d,$0a,0
[000a6e5e]                           dc.b $0d,$0a,'(*',$09,$09,'MOUSEFORMS',$09,$09,'*)',$0d,$0a,0
[000a6e75]                           dc.b '%-s: MFORM = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'mf_xhot: %2d; mf_yhot: %2d; mf_nplanes: %2d; mf_fg: %2d; mf_bg: %2d;',$0d,$0a,$09,$09,'mf_mask:',$0d,$0a,$09,$09,'(',$0d,$0a,$09,$09,$09,0
[000a6ee5]                           dc.b '%d, ',0
[000a6eea]                           dc.b '%d',$0d,$0a,$09,$09,');',$0d,$0a,$09,$09,'mf_data:',$0d,$0a,$09,$09,'(',$0d,$0a,$09,$09,$09,0
[000a6f09]                           dc.b '%d',$0d,$0a,$09,$09,')',$0d,$0a,$09,');',$0d,$0a,$0d,$0a,0
[000a6f1a]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'IMAGES',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a6f31]                           dc.b '_IMG_%-s: array [0..%d] of WORD = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,$09,0
[000a6f5d]                           dc.b '$%04x',$0d,$0a,$09,$09,');',$0d,$0a,$09,0
[000a6f6c]                           dc.b '%-s: BITBLK = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'bi_pdata: @_IMG_%s;',$0d,$0a,$09,$09,'bi_wb: %2d; bi_hl: %2d; bi_x: %2d; bi_y: %2d; bi_color: %d',$0d,$0a,$09,');',$0d,$0a,$0d,$0a,0
[000a6fdd]                           dc.b '%s = %d;',$0d,$0a,0
[000a6fe8]                           dc.b '%s : Array [0 ..%d] of ACSOBJECT = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a7014]                           dc.b '(aes: (ob_next: %2d; ob_head: %2d; ob_tail: %2d; ob_type: %2d; ob_flags: $%04x; ob_state: $%04x;',0
[000a7075]                           dc.b 'ob_spec: (index: $%08lx);',0
[000a708f]                           dc.b 'ob_spec: (free_string: @%s);',0
[000a70ac]                           dc.b 'ob_x: %2d; ob_y: %2d; ob_width: %2d; ob_height: %2d))',0
[000a70e2]                           dc.b ',',$0d,$0a,$09,$09,0
[000a70e8]                           dc.b '(acs: (',0
[000a70f0]                           dc.b 'click: ',0
[000a70f8]                           dc.w $3b20
[000a70fa]                           dc.w $0064
[000a70fc]                           dc.b 'rag: ',0
[000a7102]                           dc.b 'ob_flags: $%04x; key: $%04x;',0
[000a711f]                           dc.b 'userp1: ',0
[000a7128]                           dc.b ';userp2: ',0
[000a7132]                           dc.b '; mo_index: %d; aob_type: %s))',0
[000a7151]                           dc.b 'ACS(',0
[000a7156]                           dc.b '%s: packed array [1..%ld] of char = ',0
[000a717b]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'TEDINFOS',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a7194]                           dc.b '%s: TEDINFO = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'te_ptext: @%s; te_ptmplt: @%s; te_pvalid: @%s;',$0d,$0a,$09,$09,'te_font: %d; te_just: %d; te_color: $%04x; te_thickness: %d; te_txtlen: %ld; te_tmplen: %ld',$0d,$0a,$09,');',$0d,$0a,0
[000a723f]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'AUSERBLK',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a7258]                           dc.b '%s: AUSERBLK = (ub_code: %s; ub_parm: ',0
[000a727f]                           dc.b '$%s',0
[000a7283]                           dc.b '; ub_serv: ',0
[000a728f]                           dc.b '; ub_ptr1: ',0
[000a729b]                           dc.b '; ub_ptr2: ',0
[000a72a7]                           dc.b '; ub_ptr3: ',0
[000a72b3]                           dc.b '; bubble: ',0
[000a72be]                           dc.b '; context: ',0
[000a72ca]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'DATAS',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a72e0]                           dc.b '%-s: array [0..%ld] of WORD =',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a7306]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'WINDOWS',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a731e]                           dc.b '%s: Awindow = ',$0d,$0a,$09,'(',$0d,$0a,0
[000a7333]                           dc.b $09,$09,'user: ',0
[000a733c]                           dc.b ';',$0d,$0a,$09,$09,'service: ',0
[000a734b]                           dc.b 'Awi_service',0
[000a7357]                           dc.b ';',$0d,$0a,$09,$09,'create: ',0
[000a7365]                           dc.b 'Awi_selfcreate',0
[000a7374]                           dc.b ';',$0d,$0a,$09,$09,'open: ',0
[000a7380]                           dc.b 'Awi_open',0
[000a7389]                           dc.b ';',$0d,$0a,$09,$09,'init: ',0
[000a7395]                           dc.b 'Awi_init',0
[000a739e]                           dc.b ';',$0d,$0a,$09,$09,'work: ',0
[000a73aa]                           dc.b ';',$0d,$0a,$09,$09,'toolbar: ',0
[000a73b9]                           dc.b ';',$0d,$0a,$09,$09,'ob_edit: -1; ob_col: -1; wi_id: -1;',0
[000a73e2]                           dc.b $0d,$0a,$09,$09,'wi_kind: $%04x; wi_act: (x: %2i; y: %2i; w: %2i; h: %2i);',0
[000a7420]                           dc.b $0d,$0a,$09,$09,'wi_slider: (x: -1; y: -1; w: -1; h: -1);',0
[000a744d]                           dc.b $0d,$0a,$09,$09,'snap_mask: $%04x;',0
[000a7463]                           dc.b $0d,$0a,$09,$09,'name: ',0
[000a746e]                           dc.b '; info: ',0
[000a7477]                           dc.b ';',$0d,$0a,$09,$09,'ob_len: $%04x; kind: $%04x; icon : -1',0
[000a74a2]                           dc.b ';',$0d,$0a,$09,$09,'iconblk: ',0
[000a74b1]                           dc.b ';',$0d,$0a,$09,$09,'menu: ',0
[000a74bd]                           dc.b ';',$0d,$0a,$09,$09,'keys: ',0
[000a74c9]                           dc.b 'Awi_keys',0
[000a74d2]                           dc.b ';',$0d,$0a,$09,$09,'obchange: ',0
[000a74e2]                           dc.b 'Awi_obchange',0
[000a74ef]                           dc.b ';',$0d,$0a,$09,$09,'redraw: ',0
[000a74fd]                           dc.b 'Awi_redraw',0
[000a7508]                           dc.b ';',$0d,$0a,$09,$09,'topped: ',0
[000a7516]                           dc.b 'Awi_topped',0
[000a7521]                           dc.b ';',$0d,$0a,$09,$09,'closed: ',0
[000a752f]                           dc.b 'Awi_closed',0
[000a753a]                           dc.b ';',$0d,$0a,$09,$09,'fulled: ',0
[000a7548]                           dc.b 'Awi_fulled',0
[000a7553]                           dc.b ';',$0d,$0a,$09,$09,'arrowed: ',0
[000a7562]                           dc.b 'Awi_arrowed',0
[000a756e]                           dc.b ';',$0d,$0a,$09,$09,'hslid: ',0
[000a757b]                           dc.b 'Awi_hslid',0
[000a7585]                           dc.b ';',$0d,$0a,$09,$09,'vslid: ',0
[000a7592]                           dc.b 'Awi_vslid',0
[000a759c]                           dc.b ';',$0d,$0a,$09,$09,'sized: ',0
[000a75a9]                           dc.b 'Awi_sized',0
[000a75b3]                           dc.b ';',$0d,$0a,$09,$09,'moved: ',0
[000a75c0]                           dc.b 'Awi_moved',0
[000a75ca]                           dc.w $2e49
[000a75cc]                           dc.w $0050
[000a75ce]                           dc.b 'ure PASCAL Code',0
[000a75de]                           dc.b $0d,$0a,'(*',$09,$09,'Platform & GUI-Language',$09,$09,'*)',$0d,$0a,0
[000a7602]                           dc.b '(*$DEFINE ACS_ATARI*)',$0d,$0a,0
[000a761a]                           dc.b '(*$DEFINE ACS_LANG%d*)',$0d,$0a,0
[000a7633]                           dc.b 'Const',$0d,$0a,0
[000a763b]                           dc.b $0d,$0a,'(*',$09,$09,'ALERT BOXES',$09,$09,'*)',$0d,$0a,0
[000a7653]                           dc.b $0d,$0a,'(*',$09,$09,'STRINGS',$09,$09,'*)',$0d,$0a,0
[000a7667]                           dc.b $0d,$0a,'(*',$09,$09,'MENU TREES',$09,$09,'*)',$0d,$0a,0
[000a767e]                           dc.b $0d,$0a,'(*',$09,$09,'POPUP TREES',$09,$09,'*)',$0d,$0a,0
[000a7696]                           dc.b $0d,$0a,'(*',$09,$09,'OBJECT TREES',$09,$09,'*)',$0d,$0a,0
[000a76af]                           dc.b $00
