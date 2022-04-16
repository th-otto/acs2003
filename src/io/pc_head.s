out_acs:
[00019622] 3028 0006                 move.w     6(a0),d0
[00019626] c07c 8000                 and.w      #0x8000,d0
[0001962a] 660c                      bne.s      out_acs_1
[0001962c] 41f9 000a 53e8            lea.l      $000A53E8,a0
[00019632] 4eb9 0001 8374            jsr        save_string
out_acs_1:
[00019638] 4e75                      rts

out_list:
[0001963a] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0001963e] 2448                      movea.l    a0,a2
[00019640] 2649                      movea.l    a1,a3
[00019642] 286f 001c                 movea.l    28(a7),a4
[00019646] 262a 000e                 move.l     14(a2),d3
[0001964a] e48b                      lsr.l      #2,d3
[0001964c] 4a43                      tst.w      d3
[0001964e] 6f00 007c                 ble.w      out_list_1
[00019652] 41ea 0016                 lea.l      22(a2),a0
[00019656] 4eb9 0001 9d78            jsr        info_list
[0001965c] 246a 0004                 movea.l    4(a2),a2
[00019660] 204b                      movea.l    a3,a0
[00019662] 4eb9 0001 8374            jsr        save_string
[00019668] 4244                      clr.w      d4
[0001966a] 4bf9 0010 7f66            lea.l      iostring,a5
[00019670] 6056                      bra.s      out_list_2
[00019672] 3004                      move.w     d4,d0
out_list_4:
[00019674] 48c0                      ext.l      d0
[00019676] e588                      lsl.l      #2,d0
[00019678] 2672 0800                 movea.l    0(a2,d0.l),a3
[0001967c] 43f9 000a 5408            lea.l      $000A5408,a1
[00019682] 41eb 0016                 lea.l      22(a3),a0
[00019686] 7004                      moveq.l    #4,d0
[00019688] 4eb9 0008 2fb8            jsr        strncmp
[0001968e] 4a40                      tst.w      d0
[00019690] 6734                      beq.s      out_list_3
[00019692] 302b 0038                 move.w     56(a3),d0
[00019696] c07c 0500                 and.w      #0x0500,d0
[0001969a] b07c 0100                 cmp.w      #0x0100,d0
[0001969e] 6626                      bne.s      out_list_3
[000196a0] 41eb 0016                 lea.l      22(a3),a0
[000196a4] 4eb9 0001 9dd0            jsr        info_obj
[000196aa] 2f2b 000a                 move.l     10(a3),-(a7)
[000196ae] 486b 0016                 pea.l      22(a3)
[000196b2] 224c                      movea.l    a4,a1
[000196b4] 204d                      movea.l    a5,a0
[000196b6] 4eb9 0008 15ac            jsr        sprintf
[000196bc] 504f                      addq.w     #8,a7
[000196be] 204d                      movea.l    a5,a0
[000196c0] 4eb9 0001 8374            jsr        save_string
out_list_3:
[000196c6] 5244                      addq.w     #1,d4
out_list_2:
[000196c8] b644                      cmp.w      d4,d3
[000196ca] 6ea6                      bgt.s      out_list_4
out_list_1:
[000196cc] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[000196d0] 4e75                      rts

out_obj:
[000196d2] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[000196d6] 2448                      movea.l    a0,a2
[000196d8] 2a49                      movea.l    a1,a5
[000196da] 262a 000e                 move.l     14(a2),d3
[000196de] e48b                      lsr.l      #2,d3
[000196e0] 4a43                      tst.w      d3
[000196e2] 6f00 00e4                 ble        out_obj_1
[000196e6] 41ea 0016                 lea.l      22(a2),a0
[000196ea] 4eb9 0001 9d78            jsr        info_list
[000196f0] 246a 0004                 movea.l    4(a2),a2
[000196f4] 204d                      movea.l    a5,a0
[000196f6] 4eb9 0001 8374            jsr        save_string
[000196fc] 4244                      clr.w      d4
[000196fe] 47f9 000a 53e8            lea.l      $000A53E8,a3
[00019704] 49f9 0010 7f66            lea.l      iostring,a4
[0001970a] 6000 00b6                 bra        out_obj_2
[0001970e] 3004                      move.w     d4,d0
out_obj_9:
[00019710] 48c0                      ext.l      d0
[00019712] e588                      lsl.l      #2,d0
[00019714] 2a72 0800                 movea.l    0(a2,d0.l),a5
[00019718] 322d 0038                 move.w     56(a5),d1
[0001971c] c27c 0500                 and.w      #0x0500,d1
[00019720] b27c 0100                 cmp.w      #0x0100,d1
[00019724] 6600 009a                 bne        out_obj_3
[00019728] 41ed 0016                 lea.l      22(a5),a0
[0001972c] 4eb9 0001 9dd0            jsr        info_obj
[00019732] 486d 0016                 pea.l      22(a5)
[00019736] 43eb 0025                 lea.l      37(a3),a1
[0001973a] 204c                      movea.l    a4,a0
[0001973c] 4eb9 0008 15ac            jsr        sprintf
[00019742] 584f                      addq.w     #4,a7
[00019744] 204c                      movea.l    a4,a0
[00019746] 4eb9 0001 8374            jsr        save_string
[0001974c] 202d 000e                 move.l     14(a5),d0
[00019750] 7238                      moveq.l    #56,d1
[00019752] 4eb9 0008 3c5a            jsr        _uldiv
[00019758] 2a00                      move.l     d0,d5
[0001975a] 2a6d 0004                 movea.l    4(a5),a5
[0001975e] 4246                      clr.w      d6
[00019760] 3e06                      move.w     d6,d7
[00019762] 6058                      bra.s      out_obj_4
[00019764] 2015                      move.l     (a5),d0
out_obj_8:
[00019766] 671e                      beq.s      out_obj_5
[00019768] 3f06                      move.w     d6,-(a7)
[0001976a] 2040                      movea.l    d0,a0
[0001976c] 4868 0016                 pea.l      22(a0)
[00019770] 43eb 003b                 lea.l      59(a3),a1
[00019774] 204c                      movea.l    a4,a0
[00019776] 4eb9 0008 15ac            jsr        sprintf
[0001977c] 5c4f                      addq.w     #6,a7
[0001977e] 204c                      movea.l    a4,a0
[00019780] 4eb9 0001 8374            jsr        save_string
out_obj_5:
[00019786] 202d 0020                 move.l     32(a5),d0
[0001978a] 6628                      bne.s      out_obj_6
[0001978c] 222d 0024                 move.l     36(a5),d1
[00019790] 6622                      bne.s      out_obj_6
[00019792] 242d 002c                 move.l     44(a5),d2
[00019796] 661c                      bne.s      out_obj_6
[00019798] 202d 0030                 move.l     48(a5),d0
[0001979c] 6616                      bne.s      out_obj_6
[0001979e] 222d 0004                 move.l     4(a5),d1
[000197a2] 6610                      bne.s      out_obj_6
[000197a4] 342d 002a                 move.w     42(a5),d2
[000197a8] 660a                      bne.s      out_obj_6
[000197aa] 302d 0034                 move.w     52(a5),d0
[000197ae] 6604                      bne.s      out_obj_6
[000197b0] 5246                      addq.w     #1,d6
[000197b2] 6002                      bra.s      out_obj_7
out_obj_6:
[000197b4] 5446                      addq.w     #2,d6
out_obj_7:
[000197b6] 4bed 0038                 lea.l      56(a5),a5
[000197ba] 5247                      addq.w     #1,d7
out_obj_4:
[000197bc] ba47                      cmp.w      d7,d5
[000197be] 6ea4                      bgt.s      out_obj_8
out_obj_3:
[000197c0] 5244                      addq.w     #1,d4
out_obj_2:
[000197c2] b644                      cmp.w      d4,d3
[000197c4] 6e00 ff48                 bgt        out_obj_9
out_obj_1:
[000197c8] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[000197cc] 4e75                      rts

out_declproto:
[000197ce] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[000197d2] 2648                      movea.l    a0,a3
[000197d4] 246b 003c                 movea.l    60(a3),a2
[000197d8] 262a 000e                 move.l     14(a2),d3
[000197dc] e48b                      lsr.l      #2,d3
[000197de] 4a43                      tst.w      d3
[000197e0] 6f00 0294                 ble        out_declproto_1
[000197e4] 206b 003c                 movea.l    60(a3),a0
[000197e8] 41e8 0016                 lea.l      22(a0),a0
[000197ec] 4eb9 0001 9d78            jsr        info_list
[000197f2] 246a 0004                 movea.l    4(a2),a2
[000197f6] 47f9 000a 53e8            lea.l      $000A53E8,a3
[000197fc] 41eb 0051                 lea.l      81(a3),a0
[00019800] 4eb9 0001 8374            jsr        save_string
[00019806] 4244                      clr.w      d4
[00019808] 4bf9 0010 7f66            lea.l      iostring,a5
[0001980e] 6000 0256                 bra        out_declproto_2
[00019812] 3004                      move.w     d4,d0
out_declproto_27:
[00019814] 48c0                      ext.l      d0
[00019816] e588                      lsl.l      #2,d0
[00019818] 2872 0800                 movea.l    0(a2,d0.l),a4
[0001981c] 3a2c 0038                 move.w     56(a4),d5
[00019820] 3205                      move.w     d5,d1
[00019822] c27c 0200                 and.w      #$0200,d1
[00019826] 660e                      bne.s      out_declproto_3
[00019828] 3405                      move.w     d5,d2
[0001982a] c47c 0500                 and.w      #$0500,d2
[0001982e] b47c 0100                 cmp.w      #$0100,d2
[00019832] 6600 0230                 bne        out_declproto_4
out_declproto_3:
[00019836] 41ec 0016                 lea.l      22(a4),a0
[0001983a] 4eb9 0001 9dd0            jsr        info_obj
[00019840] 3005                      move.w     d5,d0
[00019842] c07c 00ff                 and.w      #$00FF,d0
[00019846] b07c 0025                 cmp.w      #$0025,d0
[0001984a] 6200 01f6                 bhi        out_declproto_5
[0001984e] d040                      add.w      d0,d0
[00019850] 303b 0006                 move.w     $00019858(pc,d0.w),d0
[00019854] 4efb 0002                 jmp        $00019858(pc,d0.w)
J4:
[00019858] 0154                      dc.w $0154   ; out_declproto_6-J4
[0001985a] 004c                      dc.w $004c   ; out_declproto_7-J4
[0001985c] 004c                      dc.w $004c   ; out_declproto_7-J4
[0001985e] 0062                      dc.w $0062   ; out_declproto_8-J4
[00019860] 0078                      dc.w $0078   ; out_declproto_9-J4
[00019862] 01ea                      dc.w $01ea   ; out_declproto_5-J4
[00019864] 008e                      dc.w $008e   ; out_declproto_10-J4
[00019866] 00a4                      dc.w $00a4   ; out_declproto_11-J4
[00019868] 008e                      dc.w $008e   ; out_declproto_10-J4
[0001986a] 00ba                      dc.w $00ba   ; out_declproto_12-J4
[0001986c] 00d0                      dc.w $00d0   ; out_declproto_13-J4
[0001986e] 00e6                      dc.w $00e6   ; out_declproto_14-J4
[00019870] 00fc                      dc.w $00fc   ; out_declproto_15-J4
[00019872] 01ea                      dc.w $01ea   ; out_declproto_5-J4
[00019874] 00fc                      dc.w $00fc   ; out_declproto_15-J4
[00019876] 0112                      dc.w $0112   ; out_declproto_16-J4
[00019878] 0128                      dc.w $0128   ; out_declproto_17-J4
[0001987a] 0128                      dc.w $0128   ; out_declproto_17-J4
[0001987c] 00e6                      dc.w $00e6   ; out_declproto_14-J4
[0001987e] 00e6                      dc.w $00e6   ; out_declproto_14-J4
[00019880] 00fc                      dc.w $00fc   ; out_declproto_15-J4
[00019882] 013e                      dc.w $013e   ; out_declproto_18-J4
[00019884] 015a                      dc.w $015a   ; out_declproto_19-J4
[00019886] 008e                      dc.w $008e   ; out_declproto_10-J4
[00019888] 0170                      dc.w $0170   ; out_declproto_20-J4
[0001988a] 0186                      dc.w $0186   ; out_declproto_21-J4
[0001988c] 0186                      dc.w $0186   ; out_declproto_21-J4
[0001988e] 004c                      dc.w $004c   ; out_declproto_7-J4
[00019890] 004c                      dc.w $004c   ; out_declproto_7-J4
[00019892] 004c                      dc.w $004c   ; out_declproto_7-J4
[00019894] 019a                      dc.w $019a   ; out_declproto_22-J4
[00019896] 019a                      dc.w $019a   ; out_declproto_22-J4
[00019898] 004c                      dc.w $004c   ; out_declproto_7-J4
[0001989a] 01c2                      dc.w $01c2   ; out_declproto_23-J4
[0001989c] 01ae                      dc.w $01ae   ; out_declproto_24-J4
[0001989e] 004c                      dc.w $004c   ; out_declproto_7-J4
[000198a0] 01c2                      dc.w $01c2   ; out_declproto_23-J4
[000198a2] 01d6                      dc.w $01d6   ; out_declproto_25-J4
out_declproto_7:
[000198a4] 486c 0016                 pea.l      22(a4)
[000198a8] 43eb 0073                 lea.l      115(a3),a1
[000198ac] 204d                      movea.l    a5,a0
[000198ae] 4eb9 0008 15ac            jsr        sprintf
[000198b4] 584f                      addq.w     #4,a7
[000198b6] 6000 01a4                 bra        out_declproto_26
out_declproto_8:
[000198ba] 486c 0016                 pea.l      22(a4)
[000198be] 43eb 008d                 lea.l      141(a3),a1
[000198c2] 204d                      movea.l    a5,a0
[000198c4] 4eb9 0008 15ac            jsr        sprintf
[000198ca] 584f                      addq.w     #4,a7
[000198cc] 6000 018e                 bra        out_declproto_26
out_declproto_9:
[000198d0] 486c 0016                 pea.l      22(a4)
[000198d4] 43eb 00b5                 lea.l      181(a3),a1
[000198d8] 204d                      movea.l    a5,a0
[000198da] 4eb9 0008 15ac            jsr        sprintf
[000198e0] 584f                      addq.w     #4,a7
[000198e2] 6000 0178                 bra        out_declproto_26
out_declproto_10:
[000198e6] 486c 0016                 pea.l      22(a4)
[000198ea] 43eb 00f3                 lea.l      243(a3),a1
[000198ee] 204d                      movea.l    a5,a0
[000198f0] 4eb9 0008 15ac            jsr        sprintf
[000198f6] 584f                      addq.w     #4,a7
[000198f8] 6000 0162                 bra        out_declproto_26
out_declproto_11:
[000198fc] 486c 0016                 pea.l      22(a4)
[00019900] 43eb 0117                 lea.l      279(a3),a1
[00019904] 204d                      movea.l    a5,a0
[00019906] 4eb9 0008 15ac            jsr        sprintf
[0001990c] 584f                      addq.w     #4,a7
[0001990e] 6000 014c                 bra        out_declproto_26
out_declproto_12:
[00019912] 486c 0016                 pea.l      22(a4)
[00019916] 43eb 013b                 lea.l      315(a3),a1
[0001991a] 204d                      movea.l    a5,a0
[0001991c] 4eb9 0008 15ac            jsr        sprintf
[00019922] 584f                      addq.w     #4,a7
[00019924] 6000 0136                 bra        out_declproto_26
out_declproto_13:
[00019928] 486c 0016                 pea.l      22(a4)
[0001992c] 43eb 0178                 lea.l      376(a3),a1
[00019930] 204d                      movea.l    a5,a0
[00019932] 4eb9 0008 15ac            jsr        sprintf
[00019938] 584f                      addq.w     #4,a7
[0001993a] 6000 0120                 bra        out_declproto_26
out_declproto_14:
[0001993e] 486c 0016                 pea.l      22(a4)
[00019942] 43eb 01b4                 lea.l      436(a3),a1
[00019946] 204d                      movea.l    a5,a0
[00019948] 4eb9 0008 15ac            jsr        sprintf
[0001994e] 584f                      addq.w     #4,a7
[00019950] 6000 010a                 bra        out_declproto_26
out_declproto_15:
[00019954] 486c 0016                 pea.l      22(a4)
[00019958] 43eb 01e4                 lea.l      484(a3),a1
[0001995c] 204d                      movea.l    a5,a0
[0001995e] 4eb9 0008 15ac            jsr        sprintf
[00019964] 584f                      addq.w     #4,a7
[00019966] 6000 00f4                 bra        out_declproto_26
out_declproto_16:
[0001996a] 486c 0016                 pea.l      22(a4)
[0001996e] 43eb 0207                 lea.l      519(a3),a1
[00019972] 204d                      movea.l    a5,a0
[00019974] 4eb9 0008 15ac            jsr        sprintf
[0001997a] 584f                      addq.w     #4,a7
[0001997c] 6000 00de                 bra        out_declproto_26
out_declproto_17:
[00019980] 486c 0016                 pea.l      22(a4)
[00019984] 43eb 0243                 lea.l      579(a3),a1
[00019988] 204d                      movea.l    a5,a0
[0001998a] 4eb9 0008 15ac            jsr        sprintf
[00019990] 584f                      addq.w     #4,a7
[00019992] 6000 00c8                 bra        out_declproto_26
out_declproto_18:
[00019996] 486c 0016                 pea.l      22(a4)
[0001999a] 43eb 0271                 lea.l      625(a3),a1
[0001999e] 204d                      movea.l    a5,a0
[000199a0] 4eb9 0008 15ac            jsr        sprintf
[000199a6] 584f                      addq.w     #4,a7
[000199a8] 6000 00b2                 bra        out_declproto_26
out_declproto_6:
[000199ac] 4215                      clr.b      (a5)
[000199ae] 6000 00ac                 bra        out_declproto_26
out_declproto_19:
[000199b2] 486c 0016                 pea.l      22(a4)
[000199b6] 43eb 02af                 lea.l      687(a3),a1
[000199ba] 204d                      movea.l    a5,a0
[000199bc] 4eb9 0008 15ac            jsr        sprintf
[000199c2] 584f                      addq.w     #4,a7
[000199c4] 6000 0096                 bra        out_declproto_26
out_declproto_20:
[000199c8] 486c 0016                 pea.l      22(a4)
[000199cc] 43eb 02de                 lea.l      734(a3),a1
[000199d0] 204d                      movea.l    a5,a0
[000199d2] 4eb9 0008 15ac            jsr        sprintf
[000199d8] 584f                      addq.w     #4,a7
[000199da] 6000 0080                 bra        out_declproto_26
out_declproto_21:
[000199de] 486c 0016                 pea.l      22(a4)
[000199e2] 43eb 032f                 lea.l      815(a3),a1
[000199e6] 204d                      movea.l    a5,a0
[000199e8] 4eb9 0008 15ac            jsr        sprintf
[000199ee] 584f                      addq.w     #4,a7
[000199f0] 606a                      bra.s      out_declproto_26
out_declproto_22:
[000199f2] 486c 0016                 pea.l      22(a4)
[000199f6] 43eb 034a                 lea.l      842(a3),a1
[000199fa] 204d                      movea.l    a5,a0
[000199fc] 4eb9 0008 15ac            jsr        sprintf
[00019a02] 584f                      addq.w     #4,a7
[00019a04] 6056                      bra.s      out_declproto_26
out_declproto_24:
[00019a06] 486c 0016                 pea.l      22(a4)
[00019a0a] 43eb 036f                 lea.l      879(a3),a1
[00019a0e] 204d                      movea.l    a5,a0
[00019a10] 4eb9 0008 15ac            jsr        sprintf
[00019a16] 584f                      addq.w     #4,a7
[00019a18] 6042                      bra.s      out_declproto_26
out_declproto_23:
[00019a1a] 486c 0016                 pea.l      22(a4)
[00019a1e] 43eb 03a2                 lea.l      930(a3),a1
[00019a22] 204d                      movea.l    a5,a0
[00019a24] 4eb9 0008 15ac            jsr        sprintf
[00019a2a] 584f                      addq.w     #4,a7
[00019a2c] 602e                      bra.s      out_declproto_26
out_declproto_25:
[00019a2e] 486c 0016                 pea.l      22(a4)
[00019a32] 43eb 03d1                 lea.l      977(a3),a1
[00019a36] 204d                      movea.l    a5,a0
[00019a38] 4eb9 0008 15ac            jsr        sprintf
[00019a3e] 584f                      addq.w     #4,a7
[00019a40] 601a                      bra.s      out_declproto_26
out_declproto_5:
[00019a42] 3005                      move.w     d5,d0
[00019a44] c07c 00ff                 and.w      #$00FF,d0
[00019a48] 3f00                      move.w     d0,-(a7)
[00019a4a] 486c 0016                 pea.l      22(a4)
[00019a4e] 43eb 0413                 lea.l      1043(a3),a1
[00019a52] 204d                      movea.l    a5,a0
[00019a54] 4eb9 0008 15ac            jsr        sprintf
[00019a5a] 5c4f                      addq.w     #6,a7
out_declproto_26:
[00019a5c] 204d                      movea.l    a5,a0
[00019a5e] 4eb9 0001 8374            jsr        save_string
out_declproto_4:
[00019a64] 5244                      addq.w     #1,d4
out_declproto_2:
[00019a66] b644                      cmp.w      d4,d3
[00019a68] 6e00 fda8                 bgt        out_declproto_27
[00019a6c] 41eb 001b                 lea.l      27(a3),a0
[00019a70] 4eb9 0001 8374            jsr        save_string
out_declproto_1:
[00019a76] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[00019a7a] 4e75                      rts

pc_header:
[00019a7c] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[00019a80] 4fef ff78                 lea.l      -136(a7),a7
[00019a84] 2448                      movea.l    a0,a2
[00019a86] 705c                      moveq.l    #92,d0
[00019a88] 206a 0008                 movea.l    8(a2),a0
[00019a8c] 4eb9 0008 2e9e            jsr        strrchr
[00019a92] 5248                      addq.w     #1,a0
[00019a94] 2e88                      move.l     a0,(a7)
[00019a96] 49ef 0004                 lea.l      4(a7),a4
[00019a9a] 226a 0008                 movea.l    8(a2),a1
[00019a9e] 204c                      movea.l    a4,a0
[00019aa0] 4eb9 0008 2f0c            jsr        strcpy
[00019aa6] 702e                      moveq.l    #46,d0
[00019aa8] 204c                      movea.l    a4,a0
[00019aaa] 4eb9 0008 2e9e            jsr        strrchr
[00019ab0] 2648                      movea.l    a0,a3
[00019ab2] 4bf9 000a 53e8            lea.l      $000A53E8,a5
[00019ab8] 200b                      move.l     a3,d0
[00019aba] 670e                      beq.s      pc_header_1
[00019abc] 43ed 0429                 lea.l      1065(a5),a1
[00019ac0] 204b                      movea.l    a3,a0
[00019ac2] 4eb9 0008 2f0c            jsr        strcpy
[00019ac8] 600c                      bra.s      pc_header_2
pc_header_1:
[00019aca] 43ed 0429                 lea.l      1065(a5),a1
[00019ace] 204c                      movea.l    a4,a0
[00019ad0] 4eb9 0008 2e42            jsr        strcat
pc_header_2:
[00019ad6] 4240                      clr.w      d0
[00019ad8] 204c                      movea.l    a4,a0
[00019ada] 4eb9 0008 0c8e            jsr        Fcreate
[00019ae0] 2600                      move.l     d0,d3
[00019ae2] 4a43                      tst.w      d3
[00019ae4] 6a14                      bpl.s      pc_header_3
[00019ae6] 2057                      movea.l    (a7),a0
[00019ae8] 7009                      moveq.l    #9,d0
[00019aea] 2279 0010 ee4e            movea.l    ACSblk,a1
[00019af0] 2269 03d6                 movea.l    982(a1),a1
[00019af4] 4e91                      jsr        (a1)
[00019af6] 6000 012e                 bra        pc_header_4
pc_header_3:
[00019afa] 204c                      movea.l    a4,a0
[00019afc] 4eb9 0001 9c30            jsr        info_start
[00019b02] 41ed 042c                 lea.l      1068(a5),a0
[00019b06] 4eb9 0001 9d14            jsr        info_title
[00019b0c] 3003                      move.w     d3,d0
[00019b0e] 4eb9 0001 82bc            jsr        set_handle
[00019b14] 4eb9 0008 108e            jsr        setjmp
[00019b1a] 4a40                      tst.w      d0
[00019b1c] 6714                      beq.s      pc_header_5
[00019b1e] 91c8                      suba.l     a0,a0
[00019b20] 700a                      moveq.l    #10,d0
[00019b22] 2279 0010 ee4e            movea.l    ACSblk,a1
[00019b28] 2269 03d6                 movea.l    982(a1),a1
[00019b2c] 4e91                      jsr        (a1)
[00019b2e] 6000 00e8                 bra        pc_header_6
pc_header_5:
[00019b32] 91c8                      suba.l     a0,a0
[00019b34] 4eb9 0008 12ca            jsr        time
[00019b3a] 2f40 0084                 move.l     d0,132(a7)
[00019b3e] 47f9 0010 7f66            lea.l      iostring,a3
[00019b44] 2f2a 0008                 move.l     8(a2),-(a7)
[00019b48] 41ef 0088                 lea.l      136(a7),a0
[00019b4c] 4eb9 0008 124a            jsr        ctime
[00019b52] 2f08                      move.l     a0,-(a7)
[00019b54] 43f9 000a 4afe            lea.l      pc_welcome,a1
[00019b5a] 204b                      movea.l    a3,a0
[00019b5c] 4eb9 0008 15ac            jsr        sprintf
[00019b62] 504f                      addq.w     #8,a7
[00019b64] 204b                      movea.l    a3,a0
[00019b66] 4eb9 0001 8374            jsr        save_string
[00019b6c] 41ed 043a                 lea.l      1082(a5),a0
[00019b70] 4eb9 0001 8374            jsr        save_string
[00019b76] 486d 047f                 pea.l      1151(a5)
[00019b7a] 43ed 0464                 lea.l      1124(a5),a1
[00019b7e] 206a 0024                 movea.l    36(a2),a0
[00019b82] 6100 fab6                 bsr        out_list
[00019b86] 584f                      addq.w     #4,a7
[00019b88] 486d 047f                 pea.l      1151(a5)
[00019b8c] 43ed 0497                 lea.l      1175(a5),a1
[00019b90] 206a 0034                 movea.l    52(a2),a0
[00019b94] 6100 faa4                 bsr        out_list
[00019b98] 584f                      addq.w     #4,a7
[00019b9a] 486d 04c5                 pea.l      1221(a5)
[00019b9e] 43ed 04af                 lea.l      1199(a5),a1
[00019ba2] 206a 002c                 movea.l    44(a2),a0
[00019ba6] 6100 fa92                 bsr        out_list
[00019baa] 584f                      addq.w     #4,a7
[00019bac] 486d 04f2                 pea.l      1266(a5)
[00019bb0] 43ed 04db                 lea.l      1243(a5),a1
[00019bb4] 206a 0030                 movea.l    48(a2),a0
[00019bb8] 6100 fa80                 bsr        out_list
[00019bbc] 584f                      addq.w     #4,a7
[00019bbe] 43ed 0506                 lea.l      1286(a5),a1
[00019bc2] 206a 001c                 movea.l    28(a2),a0
[00019bc6] 6100 fb0a                 bsr        out_obj
[00019bca] 43ed 0521                 lea.l      1313(a5),a1
[00019bce] 206a 0020                 movea.l    32(a2),a0
[00019bd2] 6100 fafe                 bsr        out_obj
[00019bd6] 43ed 053d                 lea.l      1341(a5),a1
[00019bda] 206a 0018                 movea.l    24(a2),a0
[00019bde] 6100 faf2                 bsr        out_obj
[00019be2] 486d 0572                 pea.l      1394(a5)
[00019be6] 43ed 055a                 lea.l      1370(a5),a1
[00019bea] 206a 0014                 movea.l    20(a2),a0
[00019bee] 6100 fa4a                 bsr        out_list
[00019bf2] 584f                      addq.w     #4,a7
[00019bf4] 486d 05a2                 pea.l      1442(a5)
[00019bf8] 43ed 0587                 lea.l      1415(a5),a1
[00019bfc] 206a 0040                 movea.l    64(a2),a0
[00019c00] 6100 fa38                 bsr        out_list
[00019c04] 584f                      addq.w     #4,a7
[00019c06] 204a                      movea.l    a2,a0
[00019c08] 6100 fa18                 bsr        out_acs
[00019c0c] 204a                      movea.l    a2,a0
[00019c0e] 6100 fbbe                 bsr        out_declproto
[00019c12] 4eb9 0001 8388            jsr        close_buf
pc_header_6:
[00019c18] 4eb9 0001 9cf4            jsr        info_end
[00019c1e] 3003                      move.w     d3,d0
[00019c20] 4eb9 0008 0c7e            jsr        Fclose
pc_header_4:
[00019c26] 4fef 0088                 lea.l      136(a7),a7
[00019c2a] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00019c2e] 4e75                      rts

