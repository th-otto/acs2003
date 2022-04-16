copy_ob:
[0002cf48] 48e7 003e                 movem.l    a2-a6,-(a7)
[0002cf4c] 594f                      subq.w     #4,a7
[0002cf4e] 2648                      movea.l    a0,a3
[0002cf50] 2a49                      movea.l    a1,a5
[0002cf52] 286f 001c                 movea.l    28(a7),a4
[0002cf56] 45f9 000c 91bc            lea.l      $000C91BC,a2
[0002cf5c] 006b 0001 0006            ori.w      #$0001,6(a3)
[0002cf62] 7038                      moveq.l    #56,d0
[0002cf64] 2049                      movea.l    a1,a0
[0002cf66] 224c                      movea.l    a4,a1
[0002cf68] 4eb9 0008 3500            jsr        memcpy
[0002cf6e] 3039 0008 480a            move.w     copyindex,d0
[0002cf74] 676a                      beq.s      copy_ob_1
[0002cf76] 2214                      move.l     (a4),d1
[0002cf78] 6766                      beq.s      copy_ob_1
[0002cf7a] 204b                      movea.l    a3,a0
[0002cf7c] 7000                      moveq.l    #0,d0
[0002cf7e] 4eb9 0001 7fae            jsr        objmalloc
[0002cf84] 2c48                      movea.l    a0,a6
[0002cf86] 2a88                      move.l     a0,(a5)
[0002cf88] 200e                      move.l     a6,d0
[0002cf8a] 6756                      beq.s      copy_ob_2
[0002cf8c] 2254                      movea.l    (a4),a1
[0002cf8e] 43e9 0016                 lea.l      22(a1),a1
[0002cf92] 41ee 0016                 lea.l      22(a6),a0
[0002cf96] 4eb9 0008 2f0c            jsr        strcpy
[0002cf9c] 4857                      pea.l      (a7)
[0002cf9e] 224e                      movea.l    a6,a1
[0002cfa0] 204b                      movea.l    a3,a0
[0002cfa2] 4eb9 0001 80f2            jsr        uniquename
[0002cfa8] 584f                      addq.w     #4,a7
[0002cfaa] 5240                      addq.w     #1,d0
[0002cfac] 661e                      bne.s      copy_ob_3
[0002cfae] 2f0a                      move.l     a2,-(a7)
[0002cfb0] 224e                      movea.l    a6,a1
[0002cfb2] 204b                      movea.l    a3,a0
[0002cfb4] 4eb9 0001 6252            jsr        new2label
[0002cfba] 584f                      addq.w     #4,a7
[0002cfbc] 4a40                      tst.w      d0
[0002cfbe] 660c                      bne.s      copy_ob_3
[0002cfc0] 224e                      movea.l    a6,a1
[0002cfc2] 204b                      movea.l    a3,a0
[0002cfc4] 4eb9 0001 7f52            jsr        objfree
[0002cfca] 6014                      bra.s      copy_ob_1
copy_ob_3:
[0002cfcc] 2f0a                      move.l     a2,-(a7)
[0002cfce] 486e 0016                 pea.l      22(a6)
[0002cfd2] 224e                      movea.l    a6,a1
[0002cfd4] 204b                      movea.l    a3,a0
[0002cfd6] 4eb9 0001 81c6            jsr        objname
[0002cfdc] 504f                      addq.w     #8,a7
[0002cfde] 6002                      bra.s      copy_ob_2
copy_ob_1:
[0002cfe0] 4295                      clr.l      (a5)
copy_ob_2:
[0002cfe2] 202c 0004                 move.l     4(a4),d0
[0002cfe6] 670e                      beq.s      copy_ob_4
[0002cfe8] 2240                      movea.l    d0,a1
[0002cfea] 204b                      movea.l    a3,a0
[0002cfec] 4eb9 0003 5c26            jsr        add_ref
[0002cff2] 2b48 0004                 move.l     a0,4(a5)
copy_ob_4:
[0002cff6] 202c 0020                 move.l     32(a4),d0
[0002cffa] 670e                      beq.s      copy_ob_5
[0002cffc] 2240                      movea.l    d0,a1
[0002cffe] 204b                      movea.l    a3,a0
[0002d000] 4eb9 0003 5c26            jsr        add_ref
[0002d006] 2b48 0020                 move.l     a0,32(a5)
copy_ob_5:
[0002d00a] 202c 0024                 move.l     36(a4),d0
[0002d00e] 670e                      beq.s      copy_ob_6
[0002d010] 2240                      movea.l    d0,a1
[0002d012] 204b                      movea.l    a3,a0
[0002d014] 4eb9 0003 5c26            jsr        add_ref
[0002d01a] 2b48 0024                 move.l     a0,36(a5)
copy_ob_6:
[0002d01e] 202c 002c                 move.l     44(a4),d0
[0002d022] 670e                      beq.s      copy_ob_7
[0002d024] 2240                      movea.l    d0,a1
[0002d026] 204b                      movea.l    a3,a0
[0002d028] 4eb9 0003 5c26            jsr        add_ref
[0002d02e] 2b48 002c                 move.l     a0,44(a5)
copy_ob_7:
[0002d032] 202c 0030                 move.l     48(a4),d0
[0002d036] 670e                      beq.s      copy_ob_8
[0002d038] 2240                      movea.l    d0,a1
[0002d03a] 204b                      movea.l    a3,a0
[0002d03c] 4eb9 0003 5c26            jsr        add_ref
[0002d042] 2b48 0030                 move.l     a0,48(a5)
copy_ob_8:
[0002d046] 102c 000f                 move.b     15(a4),d0
[0002d04a] 4880                      ext.w      d0
[0002d04c] 907c 0015                 sub.w      #$0015,d0
[0002d050] b07c 000c                 cmp.w      #$000C,d0
[0002d054] 6200 007e                 bhi.w      copy_ob_9
[0002d058] d040                      add.w      d0,d0
[0002d05a] 303b 0006                 move.w     $0002D062(pc,d0.w),d0
[0002d05e] 4efb 0002                 jmp        $0002D062(pc,d0.w)
J19:
[0002d062] 001a                      dc.w $001a   ; copy_ob_10-J19
[0002d064] 001a                      dc.w $001a   ; copy_ob_10-J19
[0002d066] 002c                      dc.w $002c   ; copy_ob_11-J19
[0002d068] 003e                      dc.w $003e   ; copy_ob_12-J19
[0002d06a] 0072                      dc.w $0072   ; copy_ob_9-J19
[0002d06c] 0050                      dc.w $0050   ; copy_ob_13-J19
[0002d06e] 0072                      dc.w $0072   ; copy_ob_9-J19
[0002d070] 0050                      dc.w $0050   ; copy_ob_13-J19
[0002d072] 001a                      dc.w $001a   ; copy_ob_10-J19
[0002d074] 001a                      dc.w $001a   ; copy_ob_10-J19
[0002d076] 0062                      dc.w $0062   ; copy_ob_14-J19
[0002d078] 0050                      dc.w $0050   ; copy_ob_13-J19
[0002d07a] 0062                      dc.w $0062   ; copy_ob_14-J19
copy_ob_10:
[0002d07c] 226c 0014                 movea.l    20(a4),a1
[0002d080] 204b                      movea.l    a3,a0
[0002d082] 4eb9 0003 6574            jsr        add_tedinfo
[0002d088] 2b48 0014                 move.l     a0,20(a5)
[0002d08c] 6046                      bra.s      copy_ob_9
copy_ob_11:
[0002d08e] 226c 0014                 movea.l    20(a4),a1
[0002d092] 204b                      movea.l    a3,a0
[0002d094] 4eb9 0003 4c1a            jsr        add_image
[0002d09a] 2b48 0014                 move.l     a0,20(a5)
[0002d09e] 6034                      bra.s      copy_ob_9
copy_ob_12:
[0002d0a0] 226c 0014                 movea.l    20(a4),a1
[0002d0a4] 204b                      movea.l    a3,a0
[0002d0a6] 4eb9 0003 4f2c            jsr        add_user
[0002d0ac] 2b48 0014                 move.l     a0,20(a5)
[0002d0b0] 6022                      bra.s      copy_ob_9
copy_ob_13:
[0002d0b2] 226c 0014                 movea.l    20(a4),a1
[0002d0b6] 204b                      movea.l    a3,a0
[0002d0b8] 4eb9 0003 5f3e            jsr        add_string
[0002d0be] 2b48 0014                 move.l     a0,20(a5)
[0002d0c2] 6010                      bra.s      copy_ob_9
copy_ob_14:
[0002d0c4] 226c 0014                 movea.l    20(a4),a1
[0002d0c8] 204b                      movea.l    a3,a0
[0002d0ca] 4eb9 0003 4754            jsr        add_icon
[0002d0d0] 2b48 0014                 move.l     a0,20(a5)
copy_ob_9:
[0002d0d4] 584f                      addq.w     #4,a7
[0002d0d6] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[0002d0da] 4e75                      rts

copysub_ob:
[0002d0dc] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0002d0e0] 554f                      subq.w     #2,a7
[0002d0e2] 2c48                      movea.l    a0,a6
[0002d0e4] 2449                      movea.l    a1,a2
[0002d0e6] 286f 002e                 movea.l    46(a7),a4
[0002d0ea] 3e80                      move.w     d0,(a7)
[0002d0ec] 2049                      movea.l    a1,a0
[0002d0ee] 7038                      moveq.l    #56,d0
[0002d0f0] 4eb9 0001 8028            jsr        objextent
[0002d0f6] 4a40                      tst.w      d0
[0002d0f8] 6600 00a2                 bne        copysub_ob_1
[0002d0fc] 202a 000e                 move.l     14(a2),d0
[0002d100] 7238                      moveq.l    #56,d1
[0002d102] 4eb9 0008 3c5a            jsr        _uldiv
[0002d108] 2600                      move.l     d0,d3
[0002d10a] 06aa 0000 0038 000e       addi.l     #$00000038,14(a2)
[0002d112] 266a 0004                 movea.l    4(a2),a3
[0002d116] 2a6c 0004                 movea.l    4(a4),a5
[0002d11a] 3217                      move.w     (a7),d1
[0002d11c] 48c1                      ext.l      d1
[0002d11e] 2001                      move.l     d1,d0
[0002d120] e788                      lsl.l      #3,d0
[0002d122] 9081                      sub.l      d1,d0
[0002d124] e788                      lsl.l      #3,d0
[0002d126] 4875 0800                 pea.l      0(a5,d0.l)
[0002d12a] 3003                      move.w     d3,d0
[0002d12c] 48c0                      ext.l      d0
[0002d12e] 2400                      move.l     d0,d2
[0002d130] e78a                      lsl.l      #3,d2
[0002d132] 9480                      sub.l      d0,d2
[0002d134] e78a                      lsl.l      #3,d2
[0002d136] 43f3 2800                 lea.l      0(a3,d2.l),a1
[0002d13a] 204e                      movea.l    a6,a0
[0002d13c] 6100 fe0a                 bsr        copy_ob
[0002d140] 584f                      addq.w     #4,a7
[0002d142] 3217                      move.w     (a7),d1
[0002d144] 48c1                      ext.l      d1
[0002d146] 2001                      move.l     d1,d0
[0002d148] e788                      lsl.l      #3,d0
[0002d14a] 9081                      sub.l      d1,d0
[0002d14c] e788                      lsl.l      #3,d0
[0002d14e] 3a35 080a                 move.w     10(a5,d0.l),d5
[0002d152] 4a45                      tst.w      d5
[0002d154] 6b00 009e                 bmi        copysub_ob_2
[0002d158] 2f0c                      move.l     a4,-(a7)
[0002d15a] 224a                      movea.l    a2,a1
[0002d15c] 204e                      movea.l    a6,a0
[0002d15e] 3005                      move.w     d5,d0
[0002d160] 6100 ff7a                 bsr        copysub_ob
[0002d164] 584f                      addq.w     #4,a7
[0002d166] 3c00                      move.w     d0,d6
[0002d168] 4a40                      tst.w      d0
[0002d16a] 6b30                      bmi.s      copysub_ob_1
[0002d16c] 3e06                      move.w     d6,d7
[0002d16e] 266a 0004                 movea.l    4(a2),a3
[0002d172] 2a6c 0004                 movea.l    4(a4),a5
[0002d176] 6042                      bra.s      copysub_ob_3
copysub_ob_6:
[0002d178] 3205                      move.w     d5,d1
[0002d17a] 48c1                      ext.l      d1
[0002d17c] 2001                      move.l     d1,d0
[0002d17e] e788                      lsl.l      #3,d0
[0002d180] 9081                      sub.l      d1,d0
[0002d182] e788                      lsl.l      #3,d0
[0002d184] 3a35 0808                 move.w     8(a5,d0.l),d5
[0002d188] 2f0c                      move.l     a4,-(a7)
[0002d18a] 3005                      move.w     d5,d0
[0002d18c] 224a                      movea.l    a2,a1
[0002d18e] 204e                      movea.l    a6,a0
[0002d190] 6100 ff4a                 bsr        copysub_ob
[0002d194] 584f                      addq.w     #4,a7
[0002d196] 3800                      move.w     d0,d4
[0002d198] 4a40                      tst.w      d0
[0002d19a] 6a04                      bpl.s      copysub_ob_4
copysub_ob_1:
[0002d19c] 70ff                      moveq.l    #-1,d0
[0002d19e] 606c                      bra.s      copysub_ob_5
copysub_ob_4:
[0002d1a0] 2a6c 0004                 movea.l    4(a4),a5
[0002d1a4] 266a 0004                 movea.l    4(a2),a3
[0002d1a8] 3207                      move.w     d7,d1
[0002d1aa] 48c1                      ext.l      d1
[0002d1ac] 2001                      move.l     d1,d0
[0002d1ae] e788                      lsl.l      #3,d0
[0002d1b0] 9081                      sub.l      d1,d0
[0002d1b2] e788                      lsl.l      #3,d0
[0002d1b4] 3784 0808                 move.w     d4,8(a3,d0.l)
[0002d1b8] 3e04                      move.w     d4,d7
copysub_ob_3:
[0002d1ba] 3205                      move.w     d5,d1
[0002d1bc] 48c1                      ext.l      d1
[0002d1be] 2001                      move.l     d1,d0
[0002d1c0] e788                      lsl.l      #3,d0
[0002d1c2] 9081                      sub.l      d1,d0
[0002d1c4] e788                      lsl.l      #3,d0
[0002d1c6] 3417                      move.w     (a7),d2
[0002d1c8] b475 0808                 cmp.w      8(a5,d0.l),d2
[0002d1cc] 66aa                      bne.s      copysub_ob_6
[0002d1ce] 3a07                      move.w     d7,d5
[0002d1d0] 48c5                      ext.l      d5
[0002d1d2] 2805                      move.l     d5,d4
[0002d1d4] e78c                      lsl.l      #3,d4
[0002d1d6] 9885                      sub.l      d5,d4
[0002d1d8] e78c                      lsl.l      #3,d4
[0002d1da] 3783 4808                 move.w     d3,8(a3,d4.l)
[0002d1de] 3203                      move.w     d3,d1
[0002d1e0] 48c1                      ext.l      d1
[0002d1e2] 2001                      move.l     d1,d0
[0002d1e4] e788                      lsl.l      #3,d0
[0002d1e6] 9081                      sub.l      d1,d0
[0002d1e8] e788                      lsl.l      #3,d0
[0002d1ea] 3786 080a                 move.w     d6,10(a3,d0.l)
[0002d1ee] 3787 080c                 move.w     d7,12(a3,d0.l)
[0002d1f2] 6016                      bra.s      copysub_ob_7
copysub_ob_2:
[0002d1f4] 70ff                      moveq.l    #-1,d0
[0002d1f6] 3403                      move.w     d3,d2
[0002d1f8] 48c2                      ext.l      d2
[0002d1fa] 2202                      move.l     d2,d1
[0002d1fc] e789                      lsl.l      #3,d1
[0002d1fe] 9282                      sub.l      d2,d1
[0002d200] e789                      lsl.l      #3,d1
[0002d202] 3780 180c                 move.w     d0,12(a3,d1.l)
[0002d206] 3780 180a                 move.w     d0,10(a3,d1.l)
copysub_ob_7:
[0002d20a] 3003                      move.w     d3,d0
copysub_ob_5:
[0002d20c] 544f                      addq.w     #2,a7
[0002d20e] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0002d212] 4e75                      rts

del_ob:
[0002d214] 2f0a                      move.l     a2,-(a7)
[0002d216] 2f0b                      move.l     a3,-(a7)
[0002d218] 2448                      movea.l    a0,a2
[0002d21a] 2649                      movea.l    a1,a3
[0002d21c] 2011                      move.l     (a1),d0
[0002d21e] 6708                      beq.s      del_ob_1
[0002d220] 2240                      movea.l    d0,a1
[0002d222] 4eb9 0001 7f52            jsr        objfree
del_ob_1:
[0002d228] 202b 0004                 move.l     4(a3),d0
[0002d22c] 670a                      beq.s      del_ob_2
[0002d22e] 2240                      movea.l    d0,a1
[0002d230] 204a                      movea.l    a2,a0
[0002d232] 4eb9 0003 5dae            jsr        del_ref
del_ob_2:
[0002d238] 202b 0020                 move.l     32(a3),d0
[0002d23c] 670a                      beq.s      del_ob_3
[0002d23e] 2240                      movea.l    d0,a1
[0002d240] 204a                      movea.l    a2,a0
[0002d242] 4eb9 0003 5dae            jsr        del_ref
del_ob_3:
[0002d248] 202b 0024                 move.l     36(a3),d0
[0002d24c] 670a                      beq.s      del_ob_4
[0002d24e] 2240                      movea.l    d0,a1
[0002d250] 204a                      movea.l    a2,a0
[0002d252] 4eb9 0003 5dae            jsr        del_ref
del_ob_4:
[0002d258] 202b 002c                 move.l     44(a3),d0
[0002d25c] 670a                      beq.s      del_ob_5
[0002d25e] 2240                      movea.l    d0,a1
[0002d260] 204a                      movea.l    a2,a0
[0002d262] 4eb9 0003 5dae            jsr        del_ref
del_ob_5:
[0002d268] 202b 0030                 move.l     48(a3),d0
[0002d26c] 670a                      beq.s      del_ob_6
[0002d26e] 2240                      movea.l    d0,a1
[0002d270] 204a                      movea.l    a2,a0
[0002d272] 4eb9 0003 5dae            jsr        del_ref
del_ob_6:
[0002d278] 504b                      addq.w     #8,a3
[0002d27a] 102b 0007                 move.b     7(a3),d0
[0002d27e] 4880                      ext.w      d0
[0002d280] 907c 0015                 sub.w      #$0015,d0
[0002d284] b07c 000c                 cmp.w      #$000C,d0
[0002d288] 6268                      bhi.s      del_ob_7
[0002d28a] d040                      add.w      d0,d0
[0002d28c] 303b 0006                 move.w     $0002D294(pc,d0.w),d0
[0002d290] 4efb 0002                 jmp        $0002D294(pc,d0.w)
J20:
[0002d294] 001a                      dc.w $001a   ; del_ob_8-J20
[0002d296] 001a                      dc.w $001a   ; del_ob_8-J20
[0002d298] 0028                      dc.w $0028   ; del_ob_9-J20
[0002d29a] 0036                      dc.w $0036   ; del_ob_10-J20
[0002d29c] 005e                      dc.w $005e   ; del_ob_7-J20
[0002d29e] 0044                      dc.w $0044   ; del_ob_11-J20
[0002d2a0] 005e                      dc.w $005e   ; del_ob_7-J20
[0002d2a2] 0044                      dc.w $0044   ; del_ob_11-J20
[0002d2a4] 001a                      dc.w $001a   ; del_ob_8-J20
[0002d2a6] 001a                      dc.w $001a   ; del_ob_8-J20
[0002d2a8] 0052                      dc.w $0052   ; del_ob_12-J20
[0002d2aa] 0044                      dc.w $0044   ; del_ob_11-J20
[0002d2ac] 0052                      dc.w $0052   ; del_ob_12-J20
del_ob_8:
[0002d2ae] 226b 000c                 movea.l    12(a3),a1
[0002d2b2] 204a                      movea.l    a2,a0
[0002d2b4] 4eb9 0003 6686            jsr        del_tedinfo
[0002d2ba] 6036                      bra.s      del_ob_7
del_ob_9:
[0002d2bc] 226b 000c                 movea.l    12(a3),a1
[0002d2c0] 204a                      movea.l    a2,a0
[0002d2c2] 4eb9 0003 4d5a            jsr        del_image
[0002d2c8] 6028                      bra.s      del_ob_7
del_ob_10:
[0002d2ca] 226b 000c                 movea.l    12(a3),a1
[0002d2ce] 204a                      movea.l    a2,a0
[0002d2d0] 4eb9 0003 5084            jsr        del_user
[0002d2d6] 601a                      bra.s      del_ob_7
del_ob_11:
[0002d2d8] 226b 000c                 movea.l    12(a3),a1
[0002d2dc] 204a                      movea.l    a2,a0
[0002d2de] 4eb9 0003 6108            jsr        del_string
[0002d2e4] 600c                      bra.s      del_ob_7
del_ob_12:
[0002d2e6] 226b 000c                 movea.l    12(a3),a1
[0002d2ea] 204a                      movea.l    a2,a0
[0002d2ec] 4eb9 0003 4b40            jsr        del_icon
del_ob_7:
[0002d2f2] 377c ffff 0006            move.w     #$FFFF,6(a3)
[0002d2f8] 006a 0001 0006            ori.w      #$0001,6(a2)
[0002d2fe] 265f                      movea.l    (a7)+,a3
[0002d300] 245f                      movea.l    (a7)+,a2
[0002d302] 4e75                      rts

delsub_ob:
[0002d304] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[0002d308] 2848                      movea.l    a0,a4
[0002d30a] 2449                      movea.l    a1,a2
[0002d30c] 3600                      move.w     d0,d3
[0002d30e] 266a 0004                 movea.l    4(a2),a3
[0002d312] 48c0                      ext.l      d0
[0002d314] 2200                      move.l     d0,d1
[0002d316] e789                      lsl.l      #3,d1
[0002d318] 9280                      sub.l      d0,d1
[0002d31a] e789                      lsl.l      #3,d1
[0002d31c] 3833 180a                 move.w     10(a3,d1.l),d4
[0002d320] 4a44                      tst.w      d4
[0002d322] 6b1e                      bmi.s      delsub_ob_1
delsub_ob_2:
[0002d324] 3004                      move.w     d4,d0
[0002d326] 224a                      movea.l    a2,a1
[0002d328] 204c                      movea.l    a4,a0
[0002d32a] 6100 ffd8                 bsr.w      delsub_ob
[0002d32e] 3204                      move.w     d4,d1
[0002d330] 48c1                      ext.l      d1
[0002d332] 2001                      move.l     d1,d0
[0002d334] e788                      lsl.l      #3,d0
[0002d336] 9081                      sub.l      d1,d0
[0002d338] e788                      lsl.l      #3,d0
[0002d33a] 3833 0808                 move.w     8(a3,d0.l),d4
[0002d33e] b644                      cmp.w      d4,d3
[0002d340] 66e2                      bne.s      delsub_ob_2
delsub_ob_1:
[0002d342] 3203                      move.w     d3,d1
[0002d344] 48c1                      ext.l      d1
[0002d346] 2001                      move.l     d1,d0
[0002d348] e788                      lsl.l      #3,d0
[0002d34a] 9081                      sub.l      d1,d0
[0002d34c] e788                      lsl.l      #3,d0
[0002d34e] 43f3 0800                 lea.l      0(a3,d0.l),a1
[0002d352] 204c                      movea.l    a4,a0
[0002d354] 6100 febe                 bsr        del_ob
[0002d358] 3003                      move.w     d3,d0
[0002d35a] 204b                      movea.l    a3,a0
[0002d35c] 4eb9 0002 d556            jsr        unlink_ob
[0002d362] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[0002d366] 4e75                      rts

free_ob:
[0002d368] 48e7 1e20                 movem.l    d3-d6/a2,-(a7)
[0002d36c] 2448                      movea.l    a0,a2
[0002d36e] 3600                      move.w     d0,d3
[0002d370] 4a40                      tst.w      d0
[0002d372] 6700 00a2                 beq        free_ob_1
[0002d376] 3c00                      move.w     d0,d6
[0002d378] 3406                      move.w     d6,d2
[0002d37a] 48c2                      ext.l      d2
[0002d37c] 2202                      move.l     d2,d1
[0002d37e] e789                      lsl.l      #3,d1
[0002d380] 9282                      sub.l      d2,d1
[0002d382] e789                      lsl.l      #3,d1
[0002d384] 3832 1808                 move.w     8(a2,d1.l),d4
[0002d388] 3a04                      move.w     d4,d5
[0002d38a] 6012                      bra.s      free_ob_2
free_ob_3:
[0002d38c] 3c04                      move.w     d4,d6
[0002d38e] 3206                      move.w     d6,d1
[0002d390] 48c1                      ext.l      d1
[0002d392] 2001                      move.l     d1,d0
[0002d394] e788                      lsl.l      #3,d0
[0002d396] 9081                      sub.l      d1,d0
[0002d398] e788                      lsl.l      #3,d0
[0002d39a] 3832 0808                 move.w     8(a2,d0.l),d4
free_ob_2:
[0002d39e] 3204                      move.w     d4,d1
[0002d3a0] 48c1                      ext.l      d1
[0002d3a2] 2001                      move.l     d1,d0
[0002d3a4] e788                      lsl.l      #3,d0
[0002d3a6] 9081                      sub.l      d1,d0
[0002d3a8] e788                      lsl.l      #3,d0
[0002d3aa] bc72 080c                 cmp.w      12(a2,d0.l),d6
[0002d3ae] 66dc                      bne.s      free_ob_3
[0002d3b0] 3c32 080a                 move.w     10(a2,d0.l),d6
[0002d3b4] b646                      cmp.w      d6,d3
[0002d3b6] 6632                      bne.s      free_ob_4
[0002d3b8] b845                      cmp.w      d5,d4
[0002d3ba] 660c                      bne.s      free_ob_5
[0002d3bc] 74ff                      moveq.l    #-1,d2
[0002d3be] 3582 080c                 move.w     d2,12(a2,d0.l)
[0002d3c2] 3582 080a                 move.w     d2,10(a2,d0.l)
[0002d3c6] 604e                      bra.s      free_ob_1
free_ob_5:
[0002d3c8] 3204                      move.w     d4,d1
[0002d3ca] 48c1                      ext.l      d1
[0002d3cc] 2001                      move.l     d1,d0
[0002d3ce] e788                      lsl.l      #3,d0
[0002d3d0] 9081                      sub.l      d1,d0
[0002d3d2] e788                      lsl.l      #3,d0
[0002d3d4] 3585 080a                 move.w     d5,10(a2,d0.l)
[0002d3d8] 603c                      bra.s      free_ob_1
free_ob_6:
[0002d3da] 3206                      move.w     d6,d1
[0002d3dc] 48c1                      ext.l      d1
[0002d3de] 2001                      move.l     d1,d0
[0002d3e0] e788                      lsl.l      #3,d0
[0002d3e2] 9081                      sub.l      d1,d0
[0002d3e4] e788                      lsl.l      #3,d0
[0002d3e6] 3c32 0808                 move.w     8(a2,d0.l),d6
free_ob_4:
[0002d3ea] 3206                      move.w     d6,d1
[0002d3ec] 48c1                      ext.l      d1
[0002d3ee] 2001                      move.l     d1,d0
[0002d3f0] e788                      lsl.l      #3,d0
[0002d3f2] 9081                      sub.l      d1,d0
[0002d3f4] e788                      lsl.l      #3,d0
[0002d3f6] b672 0808                 cmp.w      8(a2,d0.l),d3
[0002d3fa] 66de                      bne.s      free_ob_6
[0002d3fc] 3585 0808                 move.w     d5,8(a2,d0.l)
[0002d400] 3a04                      move.w     d4,d5
[0002d402] 48c5                      ext.l      d5
[0002d404] 2405                      move.l     d5,d2
[0002d406] e78a                      lsl.l      #3,d2
[0002d408] 9485                      sub.l      d5,d2
[0002d40a] e78a                      lsl.l      #3,d2
[0002d40c] b672 280c                 cmp.w      12(a2,d2.l),d3
[0002d410] 6604                      bne.s      free_ob_1
[0002d412] 3586 280c                 move.w     d6,12(a2,d2.l)
free_ob_1:
[0002d416] 4cdf 0478                 movem.l    (a7)+,d3-d6/a2
[0002d41a] 4e75                      rts

moveto_ob:
[0002d41c] 48e7 1e20                 movem.l    d3-d6/a2,-(a7)
[0002d420] 2448                      movea.l    a0,a2
[0002d422] 3800                      move.w     d0,d4
[0002d424] 3601                      move.w     d1,d3
[0002d426] b240                      cmp.w      d0,d1
[0002d428] 6700 00be                 beq        moveto_ob_1
[0002d42c] 48c0                      ext.l      d0
[0002d42e] 2400                      move.l     d0,d2
[0002d430] e78a                      lsl.l      #3,d2
[0002d432] 9480                      sub.l      d0,d2
[0002d434] e78a                      lsl.l      #3,d2
[0002d436] 43f2 2800                 lea.l      0(a2,d2.l),a1
[0002d43a] 3403                      move.w     d3,d2
[0002d43c] 48c2                      ext.l      d2
[0002d43e] 2202                      move.l     d2,d1
[0002d440] e789                      lsl.l      #3,d1
[0002d442] 9282                      sub.l      d2,d1
[0002d444] e789                      lsl.l      #3,d1
[0002d446] 41f2 1800                 lea.l      0(a2,d1.l),a0
[0002d44a] 7038                      moveq.l    #56,d0
[0002d44c] 4eb9 0008 3500            jsr        memcpy
[0002d452] 3204                      move.w     d4,d1
[0002d454] 48c1                      ext.l      d1
[0002d456] 2001                      move.l     d1,d0
[0002d458] e788                      lsl.l      #3,d0
[0002d45a] 9081                      sub.l      d1,d0
[0002d45c] e788                      lsl.l      #3,d0
[0002d45e] 3c32 080c                 move.w     12(a2,d0.l),d6
[0002d462] 4a46                      tst.w      d6
[0002d464] 6b10                      bmi.s      moveto_ob_2
[0002d466] 3006                      move.w     d6,d0
[0002d468] 48c0                      ext.l      d0
[0002d46a] 2400                      move.l     d0,d2
[0002d46c] e78a                      lsl.l      #3,d2
[0002d46e] 9480                      sub.l      d0,d2
[0002d470] e78a                      lsl.l      #3,d2
[0002d472] 3583 2808                 move.w     d3,8(a2,d2.l)
moveto_ob_2:
[0002d476] 3c04                      move.w     d4,d6
[0002d478] 6002                      bra.s      moveto_ob_3
moveto_ob_4:
[0002d47a] 3c05                      move.w     d5,d6
moveto_ob_3:
[0002d47c] 3206                      move.w     d6,d1
[0002d47e] 48c1                      ext.l      d1
[0002d480] 2001                      move.l     d1,d0
[0002d482] e788                      lsl.l      #3,d0
[0002d484] 9081                      sub.l      d1,d0
[0002d486] e788                      lsl.l      #3,d0
[0002d488] 3a32 0808                 move.w     8(a2,d0.l),d5
[0002d48c] 3005                      move.w     d5,d0
[0002d48e] 48c0                      ext.l      d0
[0002d490] 2400                      move.l     d0,d2
[0002d492] e78a                      lsl.l      #3,d2
[0002d494] 9480                      sub.l      d0,d2
[0002d496] e78a                      lsl.l      #3,d2
[0002d498] bc72 280c                 cmp.w      12(a2,d2.l),d6
[0002d49c] 66dc                      bne.s      moveto_ob_4
[0002d49e] b872 280c                 cmp.w      12(a2,d2.l),d4
[0002d4a2] 6604                      bne.s      moveto_ob_5
[0002d4a4] 3583 280c                 move.w     d3,12(a2,d2.l)
moveto_ob_5:
[0002d4a8] 3205                      move.w     d5,d1
[0002d4aa] 48c1                      ext.l      d1
[0002d4ac] 2001                      move.l     d1,d0
[0002d4ae] e788                      lsl.l      #3,d0
[0002d4b0] 9081                      sub.l      d1,d0
[0002d4b2] e788                      lsl.l      #3,d0
[0002d4b4] 3c32 080a                 move.w     10(a2,d0.l),d6
[0002d4b8] b846                      cmp.w      d6,d4
[0002d4ba] 6616                      bne.s      moveto_ob_6
[0002d4bc] 3583 080a                 move.w     d3,10(a2,d0.l)
[0002d4c0] 6026                      bra.s      moveto_ob_1
moveto_ob_7:
[0002d4c2] 3206                      move.w     d6,d1
[0002d4c4] 48c1                      ext.l      d1
[0002d4c6] 2001                      move.l     d1,d0
[0002d4c8] e788                      lsl.l      #3,d0
[0002d4ca] 9081                      sub.l      d1,d0
[0002d4cc] e788                      lsl.l      #3,d0
[0002d4ce] 3c32 0808                 move.w     8(a2,d0.l),d6
moveto_ob_6:
[0002d4d2] 3206                      move.w     d6,d1
[0002d4d4] 48c1                      ext.l      d1
[0002d4d6] 2001                      move.l     d1,d0
[0002d4d8] e788                      lsl.l      #3,d0
[0002d4da] 9081                      sub.l      d1,d0
[0002d4dc] e788                      lsl.l      #3,d0
[0002d4de] b872 0808                 cmp.w      8(a2,d0.l),d4
[0002d4e2] 66de                      bne.s      moveto_ob_7
[0002d4e4] 3583 0808                 move.w     d3,8(a2,d0.l)
moveto_ob_1:
[0002d4e8] 4cdf 0478                 movem.l    (a7)+,d3-d6/a2
[0002d4ec] 4e75                      rts

pack_ob:
[0002d4ee] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[0002d4f2] 2448                      movea.l    a0,a2
[0002d4f4] 266a 0004                 movea.l    4(a2),a3
[0002d4f8] 202a 000e                 move.l     14(a2),d0
[0002d4fc] 7238                      moveq.l    #56,d1
[0002d4fe] 4eb9 0008 3c5a            jsr        _uldiv
[0002d504] 2600                      move.l     d0,d3
[0002d506] 4244                      clr.w      d4
[0002d508] 6042                      bra.s      pack_ob_1
pack_ob_5:
[0002d50a] 3204                      move.w     d4,d1
[0002d50c] 48c1                      ext.l      d1
[0002d50e] 2001                      move.l     d1,d0
[0002d510] e788                      lsl.l      #3,d0
[0002d512] 9081                      sub.l      d1,d0
[0002d514] e788                      lsl.l      #3,d0
[0002d516] 0c73 ffff 080e            cmpi.w     #$FFFF,14(a3,d0.l)
[0002d51c] 662c                      bne.s      pack_ob_2
pack_ob_4:
[0002d51e] 5343                      subq.w     #1,d3
[0002d520] 04aa 0000 0038 000e       subi.l     #$00000038,14(a2)
[0002d528] b644                      cmp.w      d4,d3
[0002d52a] 6f24                      ble.s      pack_ob_3
[0002d52c] 3203                      move.w     d3,d1
[0002d52e] 48c1                      ext.l      d1
[0002d530] 2001                      move.l     d1,d0
[0002d532] e788                      lsl.l      #3,d0
[0002d534] 9081                      sub.l      d1,d0
[0002d536] e788                      lsl.l      #3,d0
[0002d538] 0c73 ffff 080e            cmpi.w     #$FFFF,14(a3,d0.l)
[0002d53e] 67de                      beq.s      pack_ob_4
[0002d540] 204b                      movea.l    a3,a0
[0002d542] 3003                      move.w     d3,d0
[0002d544] 3204                      move.w     d4,d1
[0002d546] 6100 fed4                 bsr        moveto_ob
pack_ob_2:
[0002d54a] 5244                      addq.w     #1,d4
pack_ob_1:
[0002d54c] b644                      cmp.w      d4,d3
[0002d54e] 6eba                      bgt.s      pack_ob_5
pack_ob_3:
[0002d550] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[0002d554] 4e75                      rts

unlink_ob:
[0002d556] 48e7 1f20                 movem.l    d3-d7/a2,-(a7)
[0002d55a] 2448                      movea.l    a0,a2
[0002d55c] 3600                      move.w     d0,d3
[0002d55e] 48c0                      ext.l      d0
[0002d560] 2200                      move.l     d0,d1
[0002d562] e789                      lsl.l      #3,d1
[0002d564] 9280                      sub.l      d0,d1
[0002d566] e789                      lsl.l      #3,d1
[0002d568] 3832 180a                 move.w     10(a2,d1.l),d4
[0002d56c] 4a43                      tst.w      d3
[0002d56e] 6660                      bne.s      unlink_ob_1
[0002d570] 4a44                      tst.w      d4
[0002d572] 6f00 0142                 ble        unlink_ob_2
[0002d576] b86a 000c                 cmp.w      12(a2),d4
[0002d57a] 6600 013a                 bne        unlink_ob_2
[0002d57e] 3204                      move.w     d4,d1
[0002d580] 48c1                      ext.l      d1
[0002d582] 2401                      move.l     d1,d2
[0002d584] e78a                      lsl.l      #3,d2
[0002d586] 9481                      sub.l      d1,d2
[0002d588] e78a                      lsl.l      #3,d2
[0002d58a] 43f2 2800                 lea.l      0(a2,d2.l),a1
[0002d58e] 7038                      moveq.l    #56,d0
[0002d590] 4eb9 0008 3500            jsr        memcpy
[0002d596] 3204                      move.w     d4,d1
[0002d598] 48c1                      ext.l      d1
[0002d59a] 2001                      move.l     d1,d0
[0002d59c] e788                      lsl.l      #3,d0
[0002d59e] 9081                      sub.l      d1,d0
[0002d5a0] e788                      lsl.l      #3,d0
[0002d5a2] 35bc ffff 080e            move.w     #$FFFF,14(a2,d0.l)
[0002d5a8] 357c ffff 0008            move.w     #$FFFF,8(a2)
[0002d5ae] 426a 0018                 clr.w      24(a2)
[0002d5b2] 426a 001a                 clr.w      26(a2)
[0002d5b6] 342a 000c                 move.w     12(a2),d2
[0002d5ba] 6f00 00fa                 ble        unlink_ob_2
[0002d5be] 48c2                      ext.l      d2
[0002d5c0] 2002                      move.l     d2,d0
[0002d5c2] e788                      lsl.l      #3,d0
[0002d5c4] 9082                      sub.l      d2,d0
[0002d5c6] e788                      lsl.l      #3,d0
[0002d5c8] 4272 0808                 clr.w      8(a2,d0.l)
[0002d5cc] 6000 00e8                 bra        unlink_ob_2
unlink_ob_1:
[0002d5d0] 4a44                      tst.w      d4
[0002d5d2] 6a0c                      bpl.s      unlink_ob_3
[0002d5d4] 3003                      move.w     d3,d0
[0002d5d6] 204a                      movea.l    a2,a0
[0002d5d8] 6100 fd8e                 bsr        free_ob
[0002d5dc] 6000 00d8                 bra        unlink_ob_2
unlink_ob_3:
[0002d5e0] 3203                      move.w     d3,d1
[0002d5e2] 48c1                      ext.l      d1
[0002d5e4] 2001                      move.l     d1,d0
[0002d5e6] e788                      lsl.l      #3,d0
[0002d5e8] 9081                      sub.l      d1,d0
[0002d5ea] e788                      lsl.l      #3,d0
[0002d5ec] 3c32 0818                 move.w     24(a2,d0.l),d6
[0002d5f0] 3e32 081a                 move.w     26(a2,d0.l),d7
[0002d5f4] 3a04                      move.w     d4,d5
unlink_ob_4:
[0002d5f6] 3205                      move.w     d5,d1
[0002d5f8] 48c1                      ext.l      d1
[0002d5fa] 2001                      move.l     d1,d0
[0002d5fc] e788                      lsl.l      #3,d0
[0002d5fe] 9081                      sub.l      d1,d0
[0002d600] e788                      lsl.l      #3,d0
[0002d602] dd72 0818                 add.w      d6,24(a2,d0.l)
[0002d606] df72 081a                 add.w      d7,26(a2,d0.l)
[0002d60a] 3a32 0808                 move.w     8(a2,d0.l),d5
[0002d60e] b645                      cmp.w      d5,d3
[0002d610] 66e4                      bne.s      unlink_ob_4
[0002d612] 3e03                      move.w     d3,d7
[0002d614] 3207                      move.w     d7,d1
[0002d616] 48c1                      ext.l      d1
[0002d618] 2001                      move.l     d1,d0
[0002d61a] e788                      lsl.l      #3,d0
[0002d61c] 9081                      sub.l      d1,d0
[0002d61e] e788                      lsl.l      #3,d0
[0002d620] 3c32 0808                 move.w     8(a2,d0.l),d6
[0002d624] 3a06                      move.w     d6,d5
[0002d626] 6012                      bra.s      unlink_ob_5
unlink_ob_6:
[0002d628] 3e06                      move.w     d6,d7
[0002d62a] 3207                      move.w     d7,d1
[0002d62c] 48c1                      ext.l      d1
[0002d62e] 2001                      move.l     d1,d0
[0002d630] e788                      lsl.l      #3,d0
[0002d632] 9081                      sub.l      d1,d0
[0002d634] e788                      lsl.l      #3,d0
[0002d636] 3c32 0808                 move.w     8(a2,d0.l),d6
unlink_ob_5:
[0002d63a] 3206                      move.w     d6,d1
[0002d63c] 48c1                      ext.l      d1
[0002d63e] 2001                      move.l     d1,d0
[0002d640] e788                      lsl.l      #3,d0
[0002d642] 9081                      sub.l      d1,d0
[0002d644] e788                      lsl.l      #3,d0
[0002d646] be72 080c                 cmp.w      12(a2,d0.l),d7
[0002d64a] 66dc                      bne.s      unlink_ob_6
[0002d64c] 3e32 080a                 move.w     10(a2,d0.l),d7
[0002d650] b647                      cmp.w      d7,d3
[0002d652] 6616                      bne.s      unlink_ob_7
[0002d654] 3584 080a                 move.w     d4,10(a2,d0.l)
[0002d658] 6026                      bra.s      unlink_ob_8
unlink_ob_9:
[0002d65a] 3207                      move.w     d7,d1
[0002d65c] 48c1                      ext.l      d1
[0002d65e] 2001                      move.l     d1,d0
[0002d660] e788                      lsl.l      #3,d0
[0002d662] 9081                      sub.l      d1,d0
[0002d664] e788                      lsl.l      #3,d0
[0002d666] 3e32 0808                 move.w     8(a2,d0.l),d7
unlink_ob_7:
[0002d66a] 3207                      move.w     d7,d1
[0002d66c] 48c1                      ext.l      d1
[0002d66e] 2001                      move.l     d1,d0
[0002d670] e788                      lsl.l      #3,d0
[0002d672] 9081                      sub.l      d1,d0
[0002d674] e788                      lsl.l      #3,d0
[0002d676] b672 0808                 cmp.w      8(a2,d0.l),d3
[0002d67a] 66de                      bne.s      unlink_ob_9
[0002d67c] 3584 0808                 move.w     d4,8(a2,d0.l)
unlink_ob_8:
[0002d680] 3203                      move.w     d3,d1
[0002d682] 48c1                      ext.l      d1
[0002d684] 2001                      move.l     d1,d0
[0002d686] e788                      lsl.l      #3,d0
[0002d688] 9081                      sub.l      d1,d0
[0002d68a] e788                      lsl.l      #3,d0
[0002d68c] 3e32 080c                 move.w     12(a2,d0.l),d7
[0002d690] 3807                      move.w     d7,d4
[0002d692] 48c4                      ext.l      d4
[0002d694] 2404                      move.l     d4,d2
[0002d696] e78a                      lsl.l      #3,d2
[0002d698] 9484                      sub.l      d4,d2
[0002d69a] e78a                      lsl.l      #3,d2
[0002d69c] 3585 2808                 move.w     d5,8(a2,d2.l)
[0002d6a0] bc45                      cmp.w      d5,d6
[0002d6a2] 6612                      bne.s      unlink_ob_2
[0002d6a4] 3e06                      move.w     d6,d7
[0002d6a6] 48c7                      ext.l      d7
[0002d6a8] 2a07                      move.l     d7,d5
[0002d6aa] e78d                      lsl.l      #3,d5
[0002d6ac] 9a87                      sub.l      d7,d5
[0002d6ae] e78d                      lsl.l      #3,d5
[0002d6b0] 35b2 080c 580c            move.w     12(a2,d0.l),12(a2,d5.l)
unlink_ob_2:
[0002d6b6] 4cdf 04f8                 movem.l    (a7)+,d3-d7/a2
[0002d6ba] 4e75                      rts

rob:
[0002d6bc] 48e7 1e3e                 movem.l    d3-d6/a2-a6,-(a7)
[0002d6c0] 2448                      movea.l    a0,a2
[0002d6c2] 3600                      move.w     d0,d3
[0002d6c4] 3801                      move.w     d1,d4
[0002d6c6] 3c02                      move.w     d2,d6
[0002d6c8] 2849                      movea.l    a1,a4
[0002d6ca] 48c0                      ext.l      d0
[0002d6cc] 2200                      move.l     d0,d1
[0002d6ce] e789                      lsl.l      #3,d1
[0002d6d0] 9280                      sub.l      d0,d1
[0002d6d2] e789                      lsl.l      #3,d1
[0002d6d4] 47f2 1800                 lea.l      0(a2,d1.l),a3
[0002d6d8] 342b 0012                 move.w     18(a3),d2
[0002d6dc] c47c 0f00                 and.w      #$0F00,d2
[0002d6e0] 6700 014c                 beq        rob_1
[0002d6e4] 3a03                      move.w     d3,d5
[0002d6e6] da45                      add.w      d5,d5
[0002d6e8] da43                      add.w      d3,d5
[0002d6ea] 5245                      addq.w     #1,d5
[0002d6ec] 3005                      move.w     d5,d0
[0002d6ee] 48c0                      ext.l      d0
[0002d6f0] 2200                      move.l     d0,d1
[0002d6f2] d281                      add.l      d1,d1
[0002d6f4] d280                      add.l      d0,d1
[0002d6f6] e789                      lsl.l      #3,d1
[0002d6f8] 4bf4 1800                 lea.l      0(a4,d1.l),a5
[0002d6fc] 4ded 0018                 lea.l      24(a5),a6
[0002d700] 342b 0012                 move.w     18(a3),d2
[0002d704] c47c 0200                 and.w      #$0200,d2
[0002d708] 674c                      beq.s      rob_2
[0002d70a] 302b 0018                 move.w     24(a3),d0
[0002d70e] 4eb9 0002 d91c            jsr        pixel_x
[0002d714] d044                      add.w      d4,d0
[0002d716] 4eb9 0002 d888            jsr        char_x
[0002d71c] 3a00                      move.w     d0,d5
[0002d71e] 3740 0018                 move.w     d0,24(a3)
[0002d722] 3005                      move.w     d5,d0
[0002d724] 4eb9 0002 d91c            jsr        pixel_x
[0002d72a] 3b40 0010                 move.w     d0,16(a5)
[0002d72e] 3d40 0010                 move.w     d0,16(a6)
[0002d732] 322b 0012                 move.w     18(a3),d1
[0002d736] c27c 0100                 and.w      #$0100,d1
[0002d73a] 664c                      bne.s      rob_3
[0002d73c] 302b 001c                 move.w     28(a3),d0
[0002d740] 4eb9 0002 d91c            jsr        pixel_x
[0002d746] 9044                      sub.w      d4,d0
[0002d748] 4eb9 0002 d888            jsr        char_x
[0002d74e] 3a00                      move.w     d0,d5
[0002d750] 3740 001c                 move.w     d0,28(a3)
[0002d754] 6022                      bra.s      rob_4
rob_2:
[0002d756] 302b 0012                 move.w     18(a3),d0
[0002d75a] c07c 0100                 and.w      #$0100,d0
[0002d75e] 6728                      beq.s      rob_3
[0002d760] 302b 001c                 move.w     28(a3),d0
[0002d764] 4eb9 0002 d91c            jsr        pixel_x
[0002d76a] d044                      add.w      d4,d0
[0002d76c] 4eb9 0002 d888            jsr        char_x
[0002d772] 3a00                      move.w     d0,d5
[0002d774] 3740 001c                 move.w     d0,28(a3)
rob_4:
[0002d778] 3005                      move.w     d5,d0
[0002d77a] 4eb9 0002 d91c            jsr        pixel_x
[0002d780] 3b40 0014                 move.w     d0,20(a5)
[0002d784] 3d40 0014                 move.w     d0,20(a6)
rob_3:
[0002d788] 302b 0012                 move.w     18(a3),d0
[0002d78c] c07c 0800                 and.w      #$0800,d0
[0002d790] 674c                      beq.s      rob_5
[0002d792] 302b 001a                 move.w     26(a3),d0
[0002d796] 4eb9 0002 d944            jsr        pixel_y
[0002d79c] d046                      add.w      d6,d0
[0002d79e] 4eb9 0002 d8d2            jsr        char_y
[0002d7a4] 3a00                      move.w     d0,d5
[0002d7a6] 3740 001a                 move.w     d0,26(a3)
[0002d7aa] 3005                      move.w     d5,d0
[0002d7ac] 4eb9 0002 d944            jsr        pixel_y
[0002d7b2] 3b40 0012                 move.w     d0,18(a5)
[0002d7b6] 3d40 0012                 move.w     d0,18(a6)
[0002d7ba] 322b 0012                 move.w     18(a3),d1
[0002d7be] c27c 0400                 and.w      #$0400,d1
[0002d7c2] 664c                      bne.s      rob_6
[0002d7c4] 302b 001e                 move.w     30(a3),d0
[0002d7c8] 4eb9 0002 d944            jsr        pixel_y
[0002d7ce] 9046                      sub.w      d6,d0
[0002d7d0] 4eb9 0002 d8d2            jsr        char_y
[0002d7d6] 3a00                      move.w     d0,d5
[0002d7d8] 3740 001e                 move.w     d0,30(a3)
[0002d7dc] 6022                      bra.s      rob_7
rob_5:
[0002d7de] 302b 0012                 move.w     18(a3),d0
[0002d7e2] c07c 0400                 and.w      #$0400,d0
[0002d7e6] 6728                      beq.s      rob_6
[0002d7e8] 302b 001e                 move.w     30(a3),d0
[0002d7ec] 4eb9 0002 d944            jsr        pixel_y
[0002d7f2] d046                      add.w      d6,d0
[0002d7f4] 4eb9 0002 d8d2            jsr        char_y
[0002d7fa] 3a00                      move.w     d0,d5
[0002d7fc] 3740 001e                 move.w     d0,30(a3)
rob_7:
[0002d800] 3005                      move.w     d5,d0
[0002d802] 4eb9 0002 d944            jsr        pixel_y
[0002d808] 3b40 0016                 move.w     d0,22(a5)
[0002d80c] 3d40 0016                 move.w     d0,22(a6)
rob_6:
[0002d810] 302b 0012                 move.w     18(a3),d0
[0002d814] c07c 0f00                 and.w      #$0F00,d0
[0002d818] b07c 0f00                 cmp.w      #$0F00,d0
[0002d81c] 6710                      beq.s      rob_1
[0002d81e] 224c                      movea.l    a4,a1
[0002d820] 3406                      move.w     d6,d2
[0002d822] 3204                      move.w     d4,d1
[0002d824] 204a                      movea.l    a2,a0
[0002d826] 3003                      move.w     d3,d0
[0002d828] 4eb9 0002 d834            jsr        resize_ob
rob_1:
[0002d82e] 4cdf 7c78                 movem.l    (a7)+,d3-d6/a2-a6
[0002d832] 4e75                      rts

resize_ob:
[0002d834] 48e7 1e30                 movem.l    d3-d6/a2-a3,-(a7)
[0002d838] 2448                      movea.l    a0,a2
[0002d83a] 3600                      move.w     d0,d3
[0002d83c] 3a01                      move.w     d1,d5
[0002d83e] 3c02                      move.w     d2,d6
[0002d840] 2649                      movea.l    a1,a3
[0002d842] 3203                      move.w     d3,d1
[0002d844] 48c1                      ext.l      d1
[0002d846] 2001                      move.l     d1,d0
[0002d848] e788                      lsl.l      #3,d0
[0002d84a] 9081                      sub.l      d1,d0
[0002d84c] e788                      lsl.l      #3,d0
[0002d84e] 3832 080a                 move.w     10(a2,d0.l),d4
[0002d852] 4a44                      tst.w      d4
[0002d854] 6b2c                      bmi.s      resize_ob_1
[0002d856] 4a45                      tst.w      d5
[0002d858] 6624                      bne.s      resize_ob_2
[0002d85a] 4a42                      tst.w      d2
[0002d85c] 6724                      beq.s      resize_ob_1
[0002d85e] 601e                      bra.s      resize_ob_2
resize_ob_3:
[0002d860] 224b                      movea.l    a3,a1
[0002d862] 3406                      move.w     d6,d2
[0002d864] 3205                      move.w     d5,d1
[0002d866] 3004                      move.w     d4,d0
[0002d868] 204a                      movea.l    a2,a0
[0002d86a] 6100 fe50                 bsr        rob
[0002d86e] 3204                      move.w     d4,d1
[0002d870] 48c1                      ext.l      d1
[0002d872] 2001                      move.l     d1,d0
[0002d874] e788                      lsl.l      #3,d0
[0002d876] 9081                      sub.l      d1,d0
[0002d878] e788                      lsl.l      #3,d0
[0002d87a] 3832 0808                 move.w     8(a2,d0.l),d4
resize_ob_2:
[0002d87e] b644                      cmp.w      d4,d3
[0002d880] 66de                      bne.s      resize_ob_3
resize_ob_1:
[0002d882] 4cdf 0c78                 movem.l    (a7)+,d3-d6/a2-a3
[0002d886] 4e75                      rts

