out_string:
[0001d126] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0001d12a] 2448                      movea.l    a0,a2
[0001d12c] 262a 000e                 move.l     14(a2),d3
[0001d130] e48b                      lsr.l      #2,d3
[0001d132] 4a43                      tst.w      d3
[0001d134] 6f00 007c                 ble.w      out_string_1
[0001d138] 41ea 0016                 lea.l      22(a2),a0
[0001d13c] 4eb9 0001 9d78            jsr        info_list
[0001d142] 246a 0004                 movea.l    4(a2),a2
[0001d146] 4244                      clr.w      d4
[0001d148] 49f9 000a 76b0            lea.l      $000A76B0,a4
[0001d14e] 4bf9 0010 7f66            lea.l      iostring,a5
[0001d154] 6058                      bra.s      out_string_2
[0001d156] 3004                      move.w     d4,d0
out_string_4:
[0001d158] 48c0                      ext.l      d0
[0001d15a] e588                      lsl.l      #2,d0
[0001d15c] 2672 0800                 movea.l    0(a2,d0.l),a3
[0001d160] 43ec 0017                 lea.l      23(a4),a1
[0001d164] 41eb 0016                 lea.l      22(a3),a0
[0001d168] 7004                      moveq.l    #4,d0
[0001d16a] 4eb9 0008 2fb8            jsr        strncmp
[0001d170] 4a40                      tst.w      d0
[0001d172] 6738                      beq.s      out_string_3
[0001d174] 41eb 0016                 lea.l      22(a3),a0
[0001d178] 4eb9 0001 9dd0            jsr        info_obj
[0001d17e] 486b 0016                 pea.l      22(a3)
[0001d182] 43ec 001c                 lea.l      28(a4),a1
[0001d186] 204d                      movea.l    a5,a0
[0001d188] 4eb9 0008 15ac            jsr        sprintf
[0001d18e] 584f                      addq.w     #4,a7
[0001d190] 204d                      movea.l    a5,a0
[0001d192] 4eb9 0001 8374            jsr        save_string
[0001d198] 206b 0004                 movea.l    4(a3),a0
[0001d19c] 4eb9 0001 8374            jsr        save_string
[0001d1a2] 41ec 0021                 lea.l      33(a4),a0
[0001d1a6] 4eb9 0001 8374            jsr        save_string
out_string_3:
[0001d1ac] 5244                      addq.w     #1,d4
out_string_2:
[0001d1ae] b644                      cmp.w      d4,d3
[0001d1b0] 6ea4                      bgt.s      out_string_4
out_string_1:
[0001d1b2] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0001d1b6] 4e75                      rts

str_output:
[0001d1b8] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0001d1bc] 4fef fdfc                 lea.l      -516(a7),a7
[0001d1c0] 2448                      movea.l    a0,a2
[0001d1c2] 705c                      moveq.l    #92,d0
[0001d1c4] 206a 0008                 movea.l    8(a2),a0
[0001d1c8] 4eb9 0008 2e9e            jsr        strrchr
[0001d1ce] 2648                      movea.l    a0,a3
[0001d1d0] 524b                      addq.w     #1,a3
[0001d1d2] 49ef 0100                 lea.l      256(a7),a4
[0001d1d6] 226a 0008                 movea.l    8(a2),a1
[0001d1da] 204c                      movea.l    a4,a0
[0001d1dc] 4eb9 0008 2f0c            jsr        strcpy
[0001d1e2] 702e                      moveq.l    #46,d0
[0001d1e4] 204c                      movea.l    a4,a0
[0001d1e6] 4eb9 0008 2e9e            jsr        strrchr
[0001d1ec] 2a48                      movea.l    a0,a5
[0001d1ee] 43f9 000a 76d5            lea.l      $000A76D5,a1
[0001d1f4] 4eb9 0008 2f0c            jsr        strcpy
[0001d1fa] 102a 01f5                 move.b     501(a2),d0
[0001d1fe] d12d 0003                 add.b      d0,3(a5)
[0001d202] 4240                      clr.w      d0
[0001d204] 204c                      movea.l    a4,a0
[0001d206] 4eb9 0008 0c8e            jsr        Fcreate
[0001d20c] 2600                      move.l     d0,d3
[0001d20e] 4a43                      tst.w      d3
[0001d210] 6a14                      bpl.s      str_output_1
[0001d212] 204b                      movea.l    a3,a0
[0001d214] 7009                      moveq.l    #9,d0
[0001d216] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001d21c] 2269 03d6                 movea.l    982(a1),a1
[0001d220] 4e91                      jsr        (a1)
[0001d222] 6000 00f0                 bra        str_output_2
str_output_1:
[0001d226] 204c                      movea.l    a4,a0
[0001d228] 4eb9 0001 9c30            jsr        info_start
[0001d22e] 41f9 000a 76da            lea.l      $000A76DA,a0
[0001d234] 4eb9 0001 9d14            jsr        info_title
[0001d23a] 3003                      move.w     d3,d0
[0001d23c] 4eb9 0001 82bc            jsr        set_handle
[0001d242] 4eb9 0008 108e            jsr        setjmp
[0001d248] 4a40                      tst.w      d0
[0001d24a] 6722                      beq.s      str_output_3
[0001d24c] 91c8                      suba.l     a0,a0
[0001d24e] 700a                      moveq.l    #10,d0
[0001d250] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001d256] 2269 03d6                 movea.l    982(a1),a1
[0001d25a] 4e91                      jsr        (a1)
[0001d25c] 3003                      move.w     d3,d0
[0001d25e] 4eb9 0008 0c7e            jsr        Fclose
[0001d264] 4eb9 0001 9cf4            jsr        info_end
[0001d26a] 6000 00a8                 bra        str_output_2
str_output_3:
[0001d26e] 91c8                      suba.l     a0,a0
[0001d270] 4eb9 0008 12ca            jsr        time
[0001d276] 2f40 0200                 move.l     d0,512(a7)
[0001d27a] 4bf9 0010 7f66            lea.l      iostring,a5
[0001d280] 2f2a 0008                 move.l     8(a2),-(a7)
[0001d284] 41ef 0204                 lea.l      516(a7),a0
[0001d288] 4eb9 0008 124a            jsr        ctime
[0001d28e] 2f08                      move.l     a0,-(a7)
[0001d290] 43f9 000a 4f8a            lea.l      str_welcome,a1
[0001d296] 204d                      movea.l    a5,a0
[0001d298] 4eb9 0008 15ac            jsr        sprintf
[0001d29e] 504f                      addq.w     #8,a7
[0001d2a0] 204d                      movea.l    a5,a0
[0001d2a2] 4eb9 0001 8374            jsr        save_string
[0001d2a8] 226a 0008                 movea.l    8(a2),a1
[0001d2ac] 41d7                      lea.l      (a7),a0
[0001d2ae] 4eb9 0004 74c0            jsr        Ast_reverse
[0001d2b4] 4868 0004                 pea.l      4(a0)
[0001d2b8] 43f9 000a 76e8            lea.l      $000A76E8,a1
[0001d2be] 204d                      movea.l    a5,a0
[0001d2c0] 4eb9 0008 15ac            jsr        sprintf
[0001d2c6] 584f                      addq.w     #4,a7
[0001d2c8] 204d                      movea.l    a5,a0
[0001d2ca] 4eb9 0001 8374            jsr        save_string
[0001d2d0] 7001                      moveq.l    #1,d0
[0001d2d2] d06a 01f4                 add.w      500(a2),d0
[0001d2d6] 3f00                      move.w     d0,-(a7)
[0001d2d8] 43f9 000a 76ef            lea.l      $000A76EF,a1
[0001d2de] 204d                      movea.l    a5,a0
[0001d2e0] 4eb9 0008 15ac            jsr        sprintf
[0001d2e6] 544f                      addq.w     #2,a7
[0001d2e8] 204d                      movea.l    a5,a0
[0001d2ea] 4eb9 0001 8374            jsr        save_string
[0001d2f0] 206a 0024                 movea.l    36(a2),a0
[0001d2f4] 6100 fe30                 bsr        out_string
[0001d2f8] 206a 0034                 movea.l    52(a2),a0
[0001d2fc] 6100 fe28                 bsr        out_string
[0001d300] 4eb9 0001 8388            jsr        close_buf
[0001d306] 4eb9 0001 9cf4            jsr        info_end
[0001d30c] 3003                      move.w     d3,d0
[0001d30e] 4eb9 0008 0c7e            jsr        Fclose
str_output_2:
[0001d314] 4fef 0204                 lea.l      516(a7),a7
[0001d318] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0001d31c] 4e75                      rts

	.data

[000a76b0]                           dc.b '%-12s',0
[000a76b6]                           dc.b '&%-12s',0
[000a76bd]                           dc.b '&%-12s[3]',0
[000a76c7]                           dc.b 'ACS(',0
[000a76cc]                           dc.b '%s=#',0
[000a76d1]                           dc.b '#',$0d,$0a,0
[000a76d5]                           dc.b '.ST0',0
[000a76da]                           dc.b 'String-Export',0
[000a76e8]                           dc.b '[%s]',$0d,$0a,0
[000a76ef]                           dc.b 'GUI-LANGUAGE=ACS_LANG%d',$0d,$0a,0
[000a7709]                           dc.b $00
