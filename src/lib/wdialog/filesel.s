fsmesshndler:
[0006ceee] 2f02                      move.l     d2,-(a7)
[0006cef0] 206f 0008                 movea.l    8(a7),a0
[0006cef4] 4eb9 0005 d5e6            jsr        Aev_message
[0006cefa] 241f                      move.l     (a7)+,d2
[0006cefc] 4e75                      rts

Af_select:
[0006cefe] 4fef ffaa                 lea.l      -86(a7),a7
[0006cf02] 2f48 0052                 move.l     a0,82(a7)
[0006cf06] 2f49 004e                 move.l     a1,78(a7)
[0006cf0a] 4eb9 0004 a2f8            jsr        Aev_unhidepointer
[0006cf10] 41d7                      lea.l      (a7),a0
[0006cf12] 4eb9 0004 efa2            jsr        Amo_restart
[0006cf18] 3f40 0006                 move.w     d0,6(a7)
[0006cf1c] 2039 000e 2882            move.l     multi_cook,d0
[0006cf22] 661c                      bne.s      Af_select_1
[0006cf24] 41f9 000e 2882            lea.l      multi_cook,a0
[0006cf2a] 203c 4653 454c            move.l     #$4653454C,d0
[0006cf30] 4eb9 0008 0ec4            jsr        Ash_getc
[0006cf36] 4a40                      tst.w      d0
[0006cf38] 6606                      bne.s      Af_select_1
[0006cf3a] 42b9 000e 2882            clr.l      multi_cook
Af_select_1:
[0006cf40] 2039 000e 288e            move.l     bkhndler,d0
[0006cf46] 661c                      bne.s      Af_select_2
[0006cf48] 41f9 000e 288e            lea.l      bkhndler,a0
[0006cf4e] 203c 4842 4653            move.l     #$48424653,d0
[0006cf54] 4eb9 0008 0ec4            jsr        Ash_getc
[0006cf5a] 4a40                      tst.w      d0
[0006cf5c] 6606                      bne.s      Af_select_2
[0006cf5e] 42b9 000e 288e            clr.l      bkhndler
Af_select_2:
[0006cf64] 705c                      moveq.l    #92,d0
[0006cf66] 206f 004e                 movea.l    78(a7),a0
[0006cf6a] 4eb9 0008 2e9e            jsr        strrchr
[0006cf70] 2f48 004a                 move.l     a0,74(a7)
[0006cf74] 206f 004e                 movea.l    78(a7),a0
[0006cf78] 1010                      move.b     (a0),d0
[0006cf7a] 6706                      beq.s      Af_select_3
[0006cf7c] 202f 004a                 move.l     74(a7),d0
[0006cf80] 6624                      bne.s      Af_select_4
Af_select_3:
[0006cf82] 42a7                      clr.l      -(a7)
[0006cf84] 42a7                      clr.l      -(a7)
[0006cf86] 93c9                      suba.l     a1,a1
[0006cf88] 70ff                      moveq.l    #-1,d0
[0006cf8a] 206f 0056                 movea.l    86(a7),a0
[0006cf8e] 4eb9 0004 b7bc            jsr        Af_buildname
[0006cf94] 504f                      addq.w     #8,a7
[0006cf96] 705c                      moveq.l    #92,d0
[0006cf98] 206f 004e                 movea.l    78(a7),a0
[0006cf9c] 4eb9 0008 2e9e            jsr        strrchr
[0006cfa2] 2f48 004a                 move.l     a0,74(a7)
Af_select_4:
[0006cfa6] 226f 004a                 movea.l    74(a7),a1
[0006cfaa] 41ef 0008                 lea.l      8(a7),a0
[0006cfae] 4eb9 0004 b706            jsr        Af_2fullname
[0006cfb4] 0c2f 002a 0008            cmpi.b     #$2A,8(a7)
[0006cfba] 6604                      bne.s      Af_select_5
[0006cfbc] 422f 0008                 clr.b      8(a7)
Af_select_5:
[0006cfc0] 7002                      moveq.l    #2,d0
[0006cfc2] 43f9 000e 2b54            lea.l      $000E2B54,a1
[0006cfc8] 206f 005a                 movea.l    90(a7),a0
[0006cfcc] 4eb9 0004 684c            jsr        Ast_incmp
[0006cfd2] 4a40                      tst.w      d0
[0006cfd4] 6714                      beq.s      Af_select_6
[0006cfd6] 43f9 000e 2b57            lea.l      $000E2B57,a1
[0006cfdc] 206f 004a                 movea.l    74(a7),a0
[0006cfe0] 5248                      addq.w     #1,a0
[0006cfe2] 4eb9 0008 2f0c            jsr        strcpy
[0006cfe8] 6008                      bra.s      Af_select_7
Af_select_6:
[0006cfea] 206f 004a                 movea.l    74(a7),a0
[0006cfee] 4228 0001                 clr.b      1(a0)
Af_select_7:
[0006cff2] 226f 005a                 movea.l    90(a7),a1
[0006cff6] 206f 004a                 movea.l    74(a7),a0
[0006cffa] 4eb9 0008 2e42            jsr        strcat
[0006d000] 2039 000e 288e            move.l     bkhndler,d0
[0006d006] 672c                      beq.s      Af_select_8
[0006d008] 2f39 000e 692a            move.l     _globl,-(a7)
[0006d00e] 487a fede                 pea.l      fsmesshndler(pc)
[0006d012] 2f2f 005a                 move.l     90(a7),-(a7)
[0006d016] 486f 0050                 pea.l      80(a7)
[0006d01a] 43ef 0018                 lea.l      24(a7),a1
[0006d01e] 206f 005e                 movea.l    94(a7),a0
[0006d022] 4eb9 0007 af8e            jsr        mt_fsel_boxinput
[0006d028] 4fef 0010                 lea.l      16(a7),a7
[0006d02c] 3f40 0042                 move.w     d0,66(a7)
[0006d030] 6000 00aa                 bra        Af_select_9
Af_select_8:
[0006d034] 7001                      moveq.l    #1,d0
[0006d036] 4eb9 0005 ae7e            jsr        Awi_update
[0006d03c] 2039 000e 2882            move.l     multi_cook,d0
[0006d042] 670e                      beq.s      Af_select_10
[0006d044] 2079 000e 2882            movea.l    multi_cook,a0
[0006d04a] 0c68 0200 0004            cmpi.w     #$0200,4(a0)
[0006d050] 6408                      bcc.s      Af_select_11
Af_select_10:
[0006d052] 7003                      moveq.l    #3,d0
[0006d054] 4eb9 0005 ae7e            jsr        Awi_update
Af_select_11:
[0006d05a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006d060] 2068 0280                 movea.l    640(a0),a0
[0006d064] 0c50 0140                 cmpi.w     #$0140,(a0)
[0006d068] 6c08                      bge.s      Af_select_12
[0006d06a] 2039 000e 2882            move.l     multi_cook,d0
[0006d070] 6726                      beq.s      Af_select_13
Af_select_12:
[0006d072] 2f39 000e 692a            move.l     _globl,-(a7)
[0006d078] 2f2f 0056                 move.l     86(a7),-(a7)
[0006d07c] 486f 004c                 pea.l      76(a7)
[0006d080] 43ef 0014                 lea.l      20(a7),a1
[0006d084] 206f 005a                 movea.l    90(a7),a0
[0006d088] 4eb9 0007 aee0            jsr        mt_fsel_exinput
[0006d08e] 4fef 000c                 lea.l      12(a7),a7
[0006d092] 3f40 0042                 move.w     d0,66(a7)
[0006d096] 601e                      bra.s      Af_select_14
Af_select_13:
[0006d098] 2f39 000e 692a            move.l     _globl,-(a7)
[0006d09e] 486f 0048                 pea.l      72(a7)
[0006d0a2] 43ef 0010                 lea.l      16(a7),a1
[0006d0a6] 206f 0056                 movea.l    86(a7),a0
[0006d0aa] 4eb9 0007 ae72            jsr        mt_fsel_input
[0006d0b0] 504f                      addq.w     #8,a7
[0006d0b2] 3f40 0042                 move.w     d0,66(a7)
Af_select_14:
[0006d0b6] 2039 000e 2882            move.l     multi_cook,d0
[0006d0bc] 670e                      beq.s      Af_select_15
[0006d0be] 2079 000e 2882            movea.l    multi_cook,a0
[0006d0c4] 0c68 0200 0004            cmpi.w     #$0200,4(a0)
[0006d0ca] 6408                      bcc.s      Af_select_16
Af_select_15:
[0006d0cc] 7002                      moveq.l    #2,d0
[0006d0ce] 4eb9 0005 ae7e            jsr        Awi_update
Af_select_16:
[0006d0d4] 4240                      clr.w      d0
[0006d0d6] 4eb9 0005 ae7e            jsr        Awi_update
Af_select_9:
[0006d0dc] 302f 0042                 move.w     66(a7),d0
[0006d0e0] 6700 009a                 beq        Af_select_17
[0006d0e4] 302f 0044                 move.w     68(a7),d0
[0006d0e8] 6700 0092                 beq        Af_select_17
[0006d0ec] 206f 004e                 movea.l    78(a7),a0
[0006d0f0] 0c28 003a 0001            cmpi.b     #$3A,1(a0)
[0006d0f6] 6600 0084                 bne        Af_select_17
[0006d0fa] 102f 0008                 move.b     8(a7),d0
[0006d0fe] 6754                      beq.s      Af_select_18
[0006d100] 41ef 0008                 lea.l      8(a7),a0
[0006d104] 4eb9 0008 2f6c            jsr        strlen
[0006d10a] 7209                      moveq.l    #9,d1
[0006d10c] b280                      cmp.l      d0,d1
[0006d10e] 6616                      bne.s      Af_select_19
[0006d110] 0c2f 002e 0010            cmpi.b     #$2E,16(a7)
[0006d116] 660e                      bne.s      Af_select_19
[0006d118] 226f 005a                 movea.l    90(a7),a1
[0006d11c] 41ef 0008                 lea.l      8(a7),a0
[0006d120] 4eb9 0008 2e42            jsr        strcat
Af_select_19:
[0006d126] 702e                      moveq.l    #46,d0
[0006d128] 41ef 0008                 lea.l      8(a7),a0
[0006d12c] 4eb9 0008 2e8a            jsr        strchr
[0006d132] 2008                      move.l     a0,d0
[0006d134] 661e                      bne.s      Af_select_18
[0006d136] 43f9 000e 2b5a            lea.l      $000E2B5A,a1
[0006d13c] 41ef 0008                 lea.l      8(a7),a0
[0006d140] 4eb9 0008 2e42            jsr        strcat
[0006d146] 226f 005a                 movea.l    90(a7),a1
[0006d14a] 41ef 0008                 lea.l      8(a7),a0
[0006d14e] 4eb9 0008 2e42            jsr        strcat
Af_select_18:
[0006d154] 705c                      moveq.l    #92,d0
[0006d156] 206f 004e                 movea.l    78(a7),a0
[0006d15a] 4eb9 0008 2e9e            jsr        strrchr
[0006d160] 2f48 004a                 move.l     a0,74(a7)
[0006d164] 43ef 0008                 lea.l      8(a7),a1
[0006d168] 206f 004a                 movea.l    74(a7),a0
[0006d16c] 5248                      addq.w     #1,a0
[0006d16e] 4eb9 0008 2f0c            jsr        strcpy
[0006d174] 2f6f 004e 0046            move.l     78(a7),70(a7)
[0006d17a] 6004                      bra.s      Af_select_20
Af_select_17:
[0006d17c] 42af 0046                 clr.l      70(a7)
Af_select_20:
[0006d180] 41d7                      lea.l      (a7),a0
[0006d182] 302f 0006                 move.w     6(a7),d0
[0006d186] 4eb9 0004 f002            jsr        Amo_return
[0006d18c] 4eb9 0004 b086            jsr        Aev_mess
[0006d192] 206f 0046                 movea.l    70(a7),a0
[0006d196] 4fef 0056                 lea.l      86(a7),a7
[0006d19a] 4e75                      rts

free_multidata:
[0006d19c] 554f                      subq.w     #2,a7
[0006d19e] 4257                      clr.w      (a7)
[0006d1a0] 602a                      bra.s      free_multidata_1
[0006d1a2] 3017                      move.w     (a7),d0
free_multidata_3:
[0006d1a4] 48c0                      ext.l      d0
[0006d1a6] e588                      lsl.l      #2,d0
[0006d1a8] 2079 000e 2886            movea.l    multi_files,a0
[0006d1ae] 2030 0800                 move.l     0(a0,d0.l),d0
[0006d1b2] 6716                      beq.s      free_multidata_2
[0006d1b4] 3017                      move.w     (a7),d0
[0006d1b6] 48c0                      ext.l      d0
[0006d1b8] e588                      lsl.l      #2,d0
[0006d1ba] 2079 000e 2886            movea.l    multi_files,a0
[0006d1c0] 2070 0800                 movea.l    0(a0,d0.l),a0
[0006d1c4] 4eb9 0004 c9da            jsr        Ax_glfree
free_multidata_2:
[0006d1ca] 5257                      addq.w     #1,(a7)
free_multidata_1:
[0006d1cc] 3017                      move.w     (a7),d0
[0006d1ce] b079 000e 288a            cmp.w      multi_count,d0
[0006d1d4] 6dcc                      blt.s      free_multidata_3
[0006d1d6] 2079 000e 2886            movea.l    multi_files,a0
[0006d1dc] 4eb9 0004 c9da            jsr        Ax_glfree
[0006d1e2] 42b9 000e 2886            clr.l      multi_files
[0006d1e8] 42b9 0011 45b0            clr.l      multi_pathend
[0006d1ee] 4240                      clr.w      d0
[0006d1f0] 33c0 000e 288a            move.w     d0,multi_count
[0006d1f6] 33c0 000e 288c            move.w     d0,multi_idx
[0006d1fc] 4239 0011 4530            clr.b      multi_opath
[0006d202] 544f                      addq.w     #2,a7
[0006d204] 4e75                      rts

Af_first_fsel:
[0006d206] 4fef fff0                 lea.l      -16(a7),a7
[0006d20a] 2f48 000c                 move.l     a0,12(a7)
[0006d20e] 2f49 0008                 move.l     a1,8(a7)
[0006d212] 4279 000e 288c            clr.w      multi_idx
[0006d218] 2039 000e 2882            move.l     multi_cook,d0
[0006d21e] 6612                      bne.s      Af_first_fsel_1
[0006d220] 41f9 000e 2882            lea.l      multi_cook,a0
[0006d226] 203c 4653 454c            move.l     #$4653454C,d0
[0006d22c] 4eb9 0008 0ec4            jsr        Ash_getc
Af_first_fsel_1:
[0006d232] 2039 000e 2882            move.l     multi_cook,d0
[0006d238] 6700 00b8                 beq        Af_first_fsel_2
[0006d23c] 2039 000e 2886            move.l     multi_files,d0
[0006d242] 6704                      beq.s      Af_first_fsel_3
[0006d244] 6100 ff56                 bsr        free_multidata
Af_first_fsel_3:
[0006d248] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006d24e] 0c68 0001 03e4            cmpi.w     #$0001,996(a0)
[0006d254] 6c04                      bge.s      Af_first_fsel_4
[0006d256] 7001                      moveq.l    #1,d0
[0006d258] 600a                      bra.s      Af_first_fsel_5
Af_first_fsel_4:
[0006d25a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006d260] 3028 03e4                 move.w     996(a0),d0
Af_first_fsel_5:
[0006d264] 3f40 0002                 move.w     d0,2(a7)
[0006d268] 302f 0002                 move.w     2(a7),d0
[0006d26c] 48c0                      ext.l      d0
[0006d26e] e588                      lsl.l      #2,d0
[0006d270] 4eb9 0004 c95e            jsr        Ax_glmalloc
[0006d276] 23c8 000e 2886            move.l     a0,multi_files
[0006d27c] 2039 000e 2886            move.l     multi_files,d0
[0006d282] 676e                      beq.s      Af_first_fsel_2
[0006d284] 322f 0002                 move.w     2(a7),d1
[0006d288] 48c1                      ext.l      d1
[0006d28a] e589                      lsl.l      #2,d1
[0006d28c] 4240                      clr.w      d0
[0006d28e] 2079 000e 2886            movea.l    multi_files,a0
[0006d294] 4eb9 0008 36ea            jsr        memset
[0006d29a] 33ef 0002 000e 288a       move.w     2(a7),multi_count
[0006d2a2] 4257                      clr.w      (a7)
[0006d2a4] 6044                      bra.s      Af_first_fsel_6
[0006d2a6] 7024                      moveq.l    #36,d0
Af_first_fsel_8:
[0006d2a8] 4eb9 0004 c95e            jsr        Ax_glmalloc
[0006d2ae] 3017                      move.w     (a7),d0
[0006d2b0] 48c0                      ext.l      d0
[0006d2b2] e588                      lsl.l      #2,d0
[0006d2b4] 2279 000e 2886            movea.l    multi_files,a1
[0006d2ba] 2388 0800                 move.l     a0,0(a1,d0.l)
[0006d2be] 3017                      move.w     (a7),d0
[0006d2c0] 48c0                      ext.l      d0
[0006d2c2] e588                      lsl.l      #2,d0
[0006d2c4] 2079 000e 2886            movea.l    multi_files,a0
[0006d2ca] 2030 0800                 move.l     0(a0,d0.l),d0
[0006d2ce] 6606                      bne.s      Af_first_fsel_7
[0006d2d0] 6100 feca                 bsr        free_multidata
[0006d2d4] 601c                      bra.s      Af_first_fsel_2
Af_first_fsel_7:
[0006d2d6] 3017                      move.w     (a7),d0
[0006d2d8] 48c0                      ext.l      d0
[0006d2da] e588                      lsl.l      #2,d0
[0006d2dc] 2079 000e 2886            movea.l    multi_files,a0
[0006d2e2] 2070 0800                 movea.l    0(a0,d0.l),a0
[0006d2e6] 4210                      clr.b      (a0)
[0006d2e8] 5257                      addq.w     #1,(a7)
Af_first_fsel_6:
[0006d2ea] 3017                      move.w     (a7),d0
[0006d2ec] b06f 0002                 cmp.w      2(a7),d0
[0006d2f0] 6db4                      blt.s      Af_first_fsel_8
Af_first_fsel_2:
[0006d2f2] 2039 000e 2882            move.l     multi_cook,d0
[0006d2f8] 6750                      beq.s      Af_first_fsel_9
[0006d2fa] 2039 000e 2886            move.l     multi_files,d0
[0006d300] 6728                      beq.s      Af_first_fsel_10
[0006d302] 2079 000e 2882            movea.l    multi_cook,a0
[0006d308] 317c 0001 0016            move.w     #$0001,22(a0)
[0006d30e] 2079 000e 2882            movea.l    multi_cook,a0
[0006d314] 316f 0002 001e            move.w     2(a7),30(a0)
[0006d31a] 2079 000e 2882            movea.l    multi_cook,a0
[0006d320] 2179 000e 2886 0020       move.l     multi_files,32(a0)
[0006d328] 6020                      bra.s      Af_first_fsel_9
Af_first_fsel_10:
[0006d32a] 4240                      clr.w      d0
[0006d32c] 2079 000e 2882            movea.l    multi_cook,a0
[0006d332] 3140 001e                 move.w     d0,30(a0)
[0006d336] 2079 000e 2882            movea.l    multi_cook,a0
[0006d33c] 3140 0016                 move.w     d0,22(a0)
[0006d340] 2079 000e 2882            movea.l    multi_cook,a0
[0006d346] 42a8 0020                 clr.l      32(a0)
Af_first_fsel_9:
[0006d34a] 2f2f 0014                 move.l     20(a7),-(a7)
[0006d34e] 226f 000c                 movea.l    12(a7),a1
[0006d352] 206f 0010                 movea.l    16(a7),a0
[0006d356] 6100 fba6                 bsr        Af_select
[0006d35a] 584f                      addq.w     #4,a7
[0006d35c] 2f48 0004                 move.l     a0,4(a7)
[0006d360] 202f 0004                 move.l     4(a7),d0
[0006d364] 6700 00e0                 beq        Af_first_fsel_11
[0006d368] 226f 0004                 movea.l    4(a7),a1
[0006d36c] 41f9 0011 4530            lea.l      multi_opath,a0
[0006d372] 4eb9 0008 2f0c            jsr        strcpy
[0006d378] 2039 000e 2882            move.l     multi_cook,d0
[0006d37e] 6700 00c6                 beq        Af_first_fsel_11
[0006d382] 2039 000e 2886            move.l     multi_files,d0
[0006d388] 6700 00bc                 beq        Af_first_fsel_11
[0006d38c] 2079 000e 2886            movea.l    multi_files,a0
[0006d392] 2050                      movea.l    (a0),a0
[0006d394] 1010                      move.b     (a0),d0
[0006d396] 6700 00ae                 beq        Af_first_fsel_11
[0006d39a] 41f9 0011 4530            lea.l      multi_opath,a0
[0006d3a0] 4eb9 0008 2f6c            jsr        strlen
[0006d3a6] 41f9 0011 4530            lea.l      multi_opath,a0
[0006d3ac] d0c0                      adda.w     d0,a0
[0006d3ae] 23c8 0011 45b0            move.l     a0,multi_pathend
[0006d3b4] 705c                      moveq.l    #92,d0
[0006d3b6] 41f9 0011 4530            lea.l      multi_opath,a0
[0006d3bc] 4eb9 0008 2e9e            jsr        strrchr
[0006d3c2] 2f48 0004                 move.l     a0,4(a7)
[0006d3c6] 202f 0004                 move.l     4(a7),d0
[0006d3ca] 674c                      beq.s      Af_first_fsel_12
[0006d3cc] 206f 0004                 movea.l    4(a7),a0
[0006d3d0] 1028 0001                 move.b     1(a0),d0
[0006d3d4] 6636                      bne.s      Af_first_fsel_13
[0006d3d6] 206f 0004                 movea.l    4(a7),a0
[0006d3da] 0c10 003a                 cmpi.b     #$3A,(a0)
[0006d3de] 672a                      beq.s      Af_first_fsel_14
[0006d3e0] 206f 0004                 movea.l    4(a7),a0
[0006d3e4] 4210                      clr.b      (a0)
[0006d3e6] 705c                      moveq.l    #92,d0
[0006d3e8] 41f9 0011 4530            lea.l      multi_opath,a0
[0006d3ee] 4eb9 0008 2e9e            jsr        strrchr
[0006d3f4] 2f48 0004                 move.l     a0,4(a7)
[0006d3f8] 202f 0004                 move.l     4(a7),d0
[0006d3fc] 670c                      beq.s      Af_first_fsel_14
[0006d3fe] 206f 0004                 movea.l    4(a7),a0
[0006d402] 5248                      addq.w     #1,a0
[0006d404] 23c8 0011 45b0            move.l     a0,multi_pathend
Af_first_fsel_14:
[0006d40a] 600c                      bra.s      Af_first_fsel_12
Af_first_fsel_13:
[0006d40c] 206f 0004                 movea.l    4(a7),a0
[0006d410] 5248                      addq.w     #1,a0
[0006d412] 23c8 0011 45b0            move.l     a0,multi_pathend
Af_first_fsel_12:
[0006d418] 3039 000e 288c            move.w     multi_idx,d0
[0006d41e] 48c0                      ext.l      d0
[0006d420] e588                      lsl.l      #2,d0
[0006d422] 2079 000e 2886            movea.l    multi_files,a0
[0006d428] 2270 0800                 movea.l    0(a0,d0.l),a1
[0006d42c] 2079 0011 45b0            movea.l    multi_pathend,a0
[0006d432] 4eb9 0008 2f0c            jsr        strcpy
[0006d438] 2f7c 0011 4530 0004       move.l     #multi_opath,4(a7)
[0006d440] 5279 000e 288c            addq.w     #1,multi_idx
Af_first_fsel_11:
[0006d446] 206f 0004                 movea.l    4(a7),a0
[0006d44a] 4fef 0010                 lea.l      16(a7),a7
[0006d44e] 4e75                      rts

Af_next_fsel:
[0006d450] 594f                      subq.w     #4,a7
[0006d452] 4297                      clr.l      (a7)
[0006d454] 2039 000e 2886            move.l     multi_files,d0
[0006d45a] 6772                      beq.s      Af_next_fsel_1
[0006d45c] 3039 000e 288c            move.w     multi_idx,d0
[0006d462] b079 000e 288a            cmp.w      multi_count,d0
[0006d468] 6c64                      bge.s      Af_next_fsel_1
[0006d46a] 1039 0011 4530            move.b     multi_opath,d0
[0006d470] 675c                      beq.s      Af_next_fsel_1
[0006d472] 2079 000e 2882            movea.l    multi_cook,a0
[0006d478] 3039 000e 288c            move.w     multi_idx,d0
[0006d47e] b068 001e                 cmp.w      30(a0),d0
[0006d482] 6c18                      bge.s      Af_next_fsel_2
[0006d484] 3039 000e 288c            move.w     multi_idx,d0
[0006d48a] 48c0                      ext.l      d0
[0006d48c] e588                      lsl.l      #2,d0
[0006d48e] 2079 000e 2886            movea.l    multi_files,a0
[0006d494] 2070 0800                 movea.l    0(a0,d0.l),a0
[0006d498] 1010                      move.b     (a0),d0
[0006d49a] 6606                      bne.s      Af_next_fsel_3
Af_next_fsel_2:
[0006d49c] 6100 fcfe                 bsr        free_multidata
[0006d4a0] 602c                      bra.s      Af_next_fsel_1
Af_next_fsel_3:
[0006d4a2] 3039 000e 288c            move.w     multi_idx,d0
[0006d4a8] 48c0                      ext.l      d0
[0006d4aa] e588                      lsl.l      #2,d0
[0006d4ac] 2079 000e 2886            movea.l    multi_files,a0
[0006d4b2] 2270 0800                 movea.l    0(a0,d0.l),a1
[0006d4b6] 2079 0011 45b0            movea.l    multi_pathend,a0
[0006d4bc] 4eb9 0008 2f0c            jsr        strcpy
[0006d4c2] 2ebc 0011 4530            move.l     #multi_opath,(a7)
[0006d4c8] 5279 000e 288c            addq.w     #1,multi_idx
Af_next_fsel_1:
[0006d4ce] 2057                      movea.l    (a7),a0
[0006d4d0] 584f                      addq.w     #4,a7
[0006d4d2] 4e75                      rts

Ash_fileSetIcon:
[0006d4d4] 5d4f                      subq.w     #6,a7
[0006d4d6] 2f48 0002                 move.l     a0,2(a7)
[0006d4da] 3e80                      move.w     d0,(a7)
[0006d4dc] 23ef 0002 000e 283a       move.l     2(a7),$000E283A
[0006d4e4] 2039 000e 283a            move.l     $000E283A,d0
[0006d4ea] 660a                      bne.s      Ash_fileSetIcon_1
[0006d4ec] 0279 fffc 000e 2834       andi.w     #$FFFC,$000E2834
[0006d4f4] 601e                      bra.s      Ash_fileSetIcon_2
Ash_fileSetIcon_1:
[0006d4f6] 0079 0001 000e 2834       ori.w      #$0001,$000E2834
[0006d4fe] 3017                      move.w     (a7),d0
[0006d500] 670a                      beq.s      Ash_fileSetIcon_3
[0006d502] 0079 0002 000e 2834       ori.w      #$0002,$000E2834
[0006d50a] 6008                      bra.s      Ash_fileSetIcon_2
Ash_fileSetIcon_3:
[0006d50c] 0279 fffd 000e 2834       andi.w     #$FFFD,$000E2834
Ash_fileSetIcon_2:
[0006d514] 5c4f                      addq.w     #6,a7
[0006d516] 4e75                      rts

Ash_fileselect:
[0006d518] 2f0a                      move.l     a2,-(a7)
[0006d51a] 4fef ffe6                 lea.l      -26(a7),a7
[0006d51e] 2f48 0016                 move.l     a0,22(a7)
[0006d522] 3f40 0014                 move.w     d0,20(a7)
[0006d526] 3f41 0012                 move.w     d1,18(a7)
[0006d52a] 2f49 000e                 move.l     a1,14(a7)
[0006d52e] 3f42 000c                 move.w     d2,12(a7)
[0006d532] 42af 0004                 clr.l      4(a7)
[0006d536] 4297                      clr.l      (a7)
[0006d538] 4eb9 0006 dca0            jsr        hasFslx
[0006d53e] 4a40                      tst.w      d0
[0006d540] 6606                      bne.s      Ash_fileselect_1
[0006d542] 91c8                      suba.l     a0,a0
[0006d544] 6000 0262                 bra        Ash_fileselect_2
Ash_fileselect_1:
[0006d548] 703e                      moveq.l    #62,d0
[0006d54a] 4eb9 0004 c608            jsr        Ax_malloc
[0006d550] 2f48 0008                 move.l     a0,8(a7)
[0006d554] 202f 0008                 move.l     8(a7),d0
[0006d558] 6606                      bne.s      Ash_fileselect_3
[0006d55a] 91c8                      suba.l     a0,a0
[0006d55c] 6000 024a                 bra        Ash_fileselect_2
Ash_fileselect_3:
[0006d560] 723e                      moveq.l    #62,d1
[0006d562] 4240                      clr.w      d0
[0006d564] 206f 0008                 movea.l    8(a7),a0
[0006d568] 4eb9 0008 36ea            jsr        memset
[0006d56e] 206f 0008                 movea.l    8(a7),a0
[0006d572] 20af 0016                 move.l     22(a7),(a0)
[0006d576] 206f 0008                 movea.l    8(a7),a0
[0006d57a] 316f 0014 0004            move.w     20(a7),4(a0)
[0006d580] 206f 0008                 movea.l    8(a7),a0
[0006d584] 316f 0012 0006            move.w     18(a7),6(a0)
[0006d58a] 206f 0008                 movea.l    8(a7),a0
[0006d58e] 216f 000e 000c            move.l     14(a7),12(a0)
[0006d594] 206f 0008                 movea.l    8(a7),a0
[0006d598] 317c 0080 0010            move.w     #$0080,16(a0)
[0006d59e] 206f 0008                 movea.l    8(a7),a0
[0006d5a2] 216f 0022 0012            move.l     34(a7),18(a0)
[0006d5a8] 206f 0008                 movea.l    8(a7),a0
[0006d5ac] 317c 0080 0016            move.w     #$0080,22(a0)
[0006d5b2] 206f 0008                 movea.l    8(a7),a0
[0006d5b6] 216f 0026 0018            move.l     38(a7),24(a0)
[0006d5bc] 206f 0008                 movea.l    8(a7),a0
[0006d5c0] 216f 002a 001c            move.l     42(a7),28(a0)
[0006d5c6] 206f 0008                 movea.l    8(a7),a0
[0006d5ca] 216f 002e 0020            move.l     46(a7),32(a0)
[0006d5d0] 206f 0008                 movea.l    8(a7),a0
[0006d5d4] 316f 000c 0024            move.w     12(a7),36(a0)
[0006d5da] 206f 0008                 movea.l    8(a7),a0
[0006d5de] 316f 0032 0026            move.w     50(a7),38(a0)
[0006d5e4] 206f 0008                 movea.l    8(a7),a0
[0006d5e8] 216f 0034 0032            move.l     52(a7),50(a0)
[0006d5ee] 206f 0008                 movea.l    8(a7),a0
[0006d5f2] 2279 000e 27e8            movea.l    $000E27E8,a1
[0006d5f8] 4e91                      jsr        (a1)
[0006d5fa] 2f48 0004                 move.l     a0,4(a7)
[0006d5fe] 202f 0004                 move.l     4(a7),d0
[0006d602] 6600 00fa                 bne        Ash_fileselect_4
[0006d606] 202f 0034                 move.l     52(a7),d0
[0006d60a] 6600 00b8                 bne        Ash_fileselect_5
[0006d60e] 206f 0008                 movea.l    8(a7),a0
[0006d612] 4eb9 0006 de2c            jsr        fslxCreate
[0006d618] 4a40                      tst.w      d0
[0006d61a] 6700 00a8                 beq        Ash_fileselect_5
[0006d61e] 2f39 000e 692a            move.l     _globl,-(a7)
[0006d624] 206f 000c                 movea.l    12(a7),a0
[0006d628] 4868 0018                 pea.l      24(a0)
[0006d62c] 206f 0010                 movea.l    16(a7),a0
[0006d630] 4868 0030                 pea.l      48(a0)
[0006d634] 206f 0014                 movea.l    20(a7),a0
[0006d638] 4868 002e                 pea.l      46(a0)
[0006d63c] 206f 0018                 movea.l    24(a7),a0
[0006d640] 4868 0024                 pea.l      36(a0)
[0006d644] 206f 001c                 movea.l    28(a7),a0
[0006d648] 2f28 0020                 move.l     32(a0),-(a7)
[0006d64c] 206f 0020                 movea.l    32(a7),a0
[0006d650] 2f28 001c                 move.l     28(a0),-(a7)
[0006d654] 206f 0024                 movea.l    36(a7),a0
[0006d658] 2f28 0018                 move.l     24(a0),-(a7)
[0006d65c] 206f 0028                 movea.l    40(a7),a0
[0006d660] 2f28 0012                 move.l     18(a0),-(a7)
[0006d664] 206f 002c                 movea.l    44(a7),a0
[0006d668] 3428 0026                 move.w     38(a0),d2
[0006d66c] 206f 002c                 movea.l    44(a7),a0
[0006d670] 3228 0016                 move.w     22(a0),d1
[0006d674] 206f 002c                 movea.l    44(a7),a0
[0006d678] 3028 0010                 move.w     16(a0),d0
[0006d67c] 206f 002c                 movea.l    44(a7),a0
[0006d680] 2268 000c                 movea.l    12(a0),a1
[0006d684] 206f 002c                 movea.l    44(a7),a0
[0006d688] 2050                      movea.l    (a0),a0
[0006d68a] 4eb9 0007 b250            jsr        mt_fslx_do
[0006d690] 4fef 0024                 lea.l      36(a7),a7
[0006d694] 226f 0008                 movea.l    8(a7),a1
[0006d698] 2348 0028                 move.l     a0,40(a1)
[0006d69c] 206f 0008                 movea.l    8(a7),a0
[0006d6a0] 4eb9 0006 dcfe            jsr        fslxMakeListe
[0006d6a6] 226f 0008                 movea.l    8(a7),a1
[0006d6aa] 2348 003a                 move.l     a0,58(a1)
[0006d6ae] 2e88                      move.l     a0,(a7)
[0006d6b0] 2279 000e 692a            movea.l    _globl,a1
[0006d6b6] 206f 0008                 movea.l    8(a7),a0
[0006d6ba] 2068 0028                 movea.l    40(a0),a0
[0006d6be] 4eb9 0007 b0f2            jsr        mt_fslx_close
Ash_fileselect_5:
[0006d6c4] 206f 0008                 movea.l    8(a7),a0
[0006d6c8] 2068 0018                 movea.l    24(a0),a0
[0006d6cc] 4eb9 0004 c7c8            jsr        Ax_free
[0006d6d2] 206f 0008                 movea.l    8(a7),a0
[0006d6d6] 2068 0012                 movea.l    18(a0),a0
[0006d6da] 4eb9 0004 c7c8            jsr        Ax_free
[0006d6e0] 206f 0008                 movea.l    8(a7),a0
[0006d6e4] 2068 000c                 movea.l    12(a0),a0
[0006d6e8] 4eb9 0004 c7c8            jsr        Ax_free
[0006d6ee] 703e                      moveq.l    #62,d0
[0006d6f0] 206f 0008                 movea.l    8(a7),a0
[0006d6f4] 4eb9 0004 cc28            jsr        Ax_recycle
[0006d6fa] 6000 00aa                 bra        Ash_fileselect_6
Ash_fileselect_4:
[0006d6fe] 202f 0034                 move.l     52(a7),d0
[0006d702] 6604                      bne.s      Ash_fileselect_7
[0006d704] 7001                      moveq.l    #1,d0
[0006d706] 6002                      bra.s      Ash_fileselect_8
Ash_fileselect_7:
[0006d708] 4240                      clr.w      d0
Ash_fileselect_8:
[0006d70a] 206f 0008                 movea.l    8(a7),a0
[0006d70e] 3140 002c                 move.w     d0,44(a0)
[0006d712] 206f 0008                 movea.l    8(a7),a0
[0006d716] 3028 002c                 move.w     44(a0),d0
[0006d71a] 675c                      beq.s      Ash_fileselect_9
[0006d71c] 206f 0004                 movea.l    4(a7),a0
[0006d720] 4eb9 0005 9df4            jsr        Awi_dialog
[0006d726] 206f 0008                 movea.l    8(a7),a0
[0006d72a] 2ea8 003a                 move.l     58(a0),(a7)
[0006d72e] 93c9                      suba.l     a1,a1
[0006d730] 7002                      moveq.l    #2,d0
[0006d732] 206f 0004                 movea.l    4(a7),a0
[0006d736] 246f 0004                 movea.l    4(a7),a2
[0006d73a] 246a 0004                 movea.l    4(a2),a2
[0006d73e] 4e92                      jsr        (a2)
[0006d740] 206f 0008                 movea.l    8(a7),a0
[0006d744] 2068 0018                 movea.l    24(a0),a0
[0006d748] 4eb9 0004 c7c8            jsr        Ax_free
[0006d74e] 206f 0008                 movea.l    8(a7),a0
[0006d752] 2068 0012                 movea.l    18(a0),a0
[0006d756] 4eb9 0004 c7c8            jsr        Ax_free
[0006d75c] 206f 0008                 movea.l    8(a7),a0
[0006d760] 2068 000c                 movea.l    12(a0),a0
[0006d764] 4eb9 0004 c7c8            jsr        Ax_free
[0006d76a] 703e                      moveq.l    #62,d0
[0006d76c] 206f 0008                 movea.l    8(a7),a0
[0006d770] 4eb9 0004 cc28            jsr        Ax_recycle
[0006d776] 602e                      bra.s      Ash_fileselect_6
Ash_fileselect_9:
[0006d778] 206f 0004                 movea.l    4(a7),a0
[0006d77c] 226f 0004                 movea.l    4(a7),a1
[0006d780] 2269 000c                 movea.l    12(a1),a1
[0006d784] 4e91                      jsr        (a1)
[0006d786] 4a40                      tst.w      d0
[0006d788] 660a                      bne.s      Ash_fileselect_10
[0006d78a] 4eb9 0007 0c0a            jsr        Alu_create
[0006d790] 2e88                      move.l     a0,(a7)
[0006d792] 6012                      bra.s      Ash_fileselect_6
Ash_fileselect_10:
[0006d794] 93c9                      suba.l     a1,a1
[0006d796] 7002                      moveq.l    #2,d0
[0006d798] 206f 0004                 movea.l    4(a7),a0
[0006d79c] 246f 0004                 movea.l    4(a7),a2
[0006d7a0] 246a 0004                 movea.l    4(a2),a2
[0006d7a4] 4e92                      jsr        (a2)
Ash_fileselect_6:
[0006d7a6] 2057                      movea.l    (a7),a0
Ash_fileselect_2:
[0006d7a8] 4fef 001a                 lea.l      26(a7),a7
[0006d7ac] 245f                      movea.l    (a7)+,a2
[0006d7ae] 4e75                      rts

ConvertExt4Use:
[0006d7b0] 4fef fee0                 lea.l      -288(a7),a7
[0006d7b4] 2f48 011c                 move.l     a0,284(a7)
[0006d7b8] 2f49 0118                 move.l     a1,280(a7)
[0006d7bc] 1f40 0116                 move.b     d0,278(a7)
[0006d7c0] 3f41 0114                 move.w     d1,276(a7)
[0006d7c4] 3f42 0112                 move.w     d2,274(a7)
[0006d7c8] 426f 0100                 clr.w      256(a7)
[0006d7cc] 206f 0118                 movea.l    280(a7),a0
[0006d7d0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006d7d6] 4a40                      tst.w      d0
[0006d7d8] 6754                      beq.s      ConvertExt4Use_1
[0006d7da] 302f 0114                 move.w     276(a7),d0
[0006d7de] 661a                      bne.s      ConvertExt4Use_2
[0006d7e0] 206f 011c                 movea.l    284(a7),a0
[0006d7e4] 10bc 002a                 move.b     #$2A,(a0)
[0006d7e8] 206f 011c                 movea.l    284(a7),a0
[0006d7ec] 4228 0001                 clr.b      1(a0)
[0006d7f0] 206f 011c                 movea.l    284(a7),a0
[0006d7f4] 4228 0002                 clr.b      2(a0)
[0006d7f8] 602c                      bra.s      ConvertExt4Use_3
ConvertExt4Use_2:
[0006d7fa] 206f 011c                 movea.l    284(a7),a0
[0006d7fe] 10bc 002a                 move.b     #$2A,(a0)
[0006d802] 206f 011c                 movea.l    284(a7),a0
[0006d806] 117c 002e 0001            move.b     #$2E,1(a0)
[0006d80c] 206f 011c                 movea.l    284(a7),a0
[0006d810] 117c 002a 0002            move.b     #$2A,2(a0)
[0006d816] 206f 011c                 movea.l    284(a7),a0
[0006d81a] 4228 0003                 clr.b      3(a0)
[0006d81e] 206f 011c                 movea.l    284(a7),a0
[0006d822] 4228 0004                 clr.b      4(a0)
ConvertExt4Use_3:
[0006d826] 206f 011c                 movea.l    284(a7),a0
[0006d82a] 6000 01dc                 bra        ConvertExt4Use_4
ConvertExt4Use_1:
[0006d82e] 206f 011c                 movea.l    284(a7),a0
[0006d832] 4210                      clr.b      (a0)
[0006d834] 2f6f 0118 010a            move.l     280(a7),266(a7)
[0006d83a] 206f 011c                 movea.l    284(a7),a0
[0006d83e] 2f48 0106                 move.l     a0,262(a7)
[0006d842] 2f48 010e                 move.l     a0,270(a7)
[0006d846] 6000 012e                 bra        ConvertExt4Use_5
[0006d84a] 702c                      moveq.l    #44,d0
ConvertExt4Use_24:
[0006d84c] 206f 010a                 movea.l    266(a7),a0
[0006d850] 4eb9 0008 2e8a            jsr        strchr
[0006d856] 2f48 0102                 move.l     a0,258(a7)
[0006d85a] 202f 0102                 move.l     258(a7),d0
[0006d85e] 6706                      beq.s      ConvertExt4Use_6
[0006d860] 206f 0102                 movea.l    258(a7),a0
[0006d864] 4210                      clr.b      (a0)
ConvertExt4Use_6:
[0006d866] 302f 0114                 move.w     276(a7),d0
[0006d86a] 6710                      beq.s      ConvertExt4Use_7
[0006d86c] 702e                      moveq.l    #46,d0
[0006d86e] 206f 010a                 movea.l    266(a7),a0
[0006d872] 4eb9 0008 2e8a            jsr        strchr
[0006d878] 2008                      move.l     a0,d0
[0006d87a] 6618                      bne.s      ConvertExt4Use_8
ConvertExt4Use_7:
[0006d87c] 2f2f 010a                 move.l     266(a7),-(a7)
[0006d880] 43f9 000e 2b5c            lea.l      $000E2B5C,a1
[0006d886] 41ef 0004                 lea.l      4(a7),a0
[0006d88a] 4eb9 0008 15ac            jsr        sprintf
[0006d890] 584f                      addq.w     #4,a7
[0006d892] 600c                      bra.s      ConvertExt4Use_9
ConvertExt4Use_8:
[0006d894] 226f 010a                 movea.l    266(a7),a1
[0006d898] 41d7                      lea.l      (a7),a0
[0006d89a] 4eb9 0008 2f0c            jsr        strcpy
ConvertExt4Use_9:
[0006d8a0] 302f 0112                 move.w     274(a7),d0
[0006d8a4] 6610                      bne.s      ConvertExt4Use_10
[0006d8a6] 43d7                      lea.l      (a7),a1
[0006d8a8] 206f 010e                 movea.l    270(a7),a0
[0006d8ac] 4eb9 0004 691e            jsr        Ast_istr
[0006d8b2] 2008                      move.l     a0,d0
[0006d8b4] 6626                      bne.s      ConvertExt4Use_11
ConvertExt4Use_10:
[0006d8b6] 43d7                      lea.l      (a7),a1
[0006d8b8] 206f 0106                 movea.l    262(a7),a0
[0006d8bc] 4eb9 0008 2f0c            jsr        strcpy
[0006d8c2] 43f9 000e 2b61            lea.l      $000E2B61,a1
[0006d8c8] 206f 010a                 movea.l    266(a7),a0
[0006d8cc] 4eb9 0004 665a            jsr        Ast_cmp
[0006d8d2] 4a40                      tst.w      d0
[0006d8d4] 6606                      bne.s      ConvertExt4Use_11
[0006d8d6] 3f7c 0001 0100            move.w     #$0001,256(a7)
ConvertExt4Use_11:
[0006d8dc] 6004                      bra.s      ConvertExt4Use_12
[0006d8de] 52af 0106                 addq.l     #1,262(a7)
ConvertExt4Use_13:
ConvertExt4Use_12:
[0006d8e2] 206f 0106                 movea.l    262(a7),a0
[0006d8e6] 1010                      move.b     (a0),d0
[0006d8e8] 66f4                      bne.s      ConvertExt4Use_13
[0006d8ea] 206f 0106                 movea.l    262(a7),a0
[0006d8ee] 0c28 002c ffff            cmpi.b     #$2C,-1(a0)
[0006d8f4] 6604                      bne.s      ConvertExt4Use_14
[0006d8f6] 53af 0106                 subq.l     #1,262(a7)
ConvertExt4Use_14:
[0006d8fa] 202f 0102                 move.l     258(a7),d0
[0006d8fe] 6714                      beq.s      ConvertExt4Use_15
[0006d900] 206f 0106                 movea.l    262(a7),a0
[0006d904] 52af 0106                 addq.l     #1,262(a7)
[0006d908] 10bc 002c                 move.b     #$2C,(a0)
[0006d90c] 206f 0106                 movea.l    262(a7),a0
[0006d910] 4210                      clr.b      (a0)
[0006d912] 6018                      bra.s      ConvertExt4Use_16
ConvertExt4Use_15:
[0006d914] 206f 0106                 movea.l    262(a7),a0
[0006d918] 52af 0106                 addq.l     #1,262(a7)
[0006d91c] 10af 0116                 move.b     278(a7),(a0)
[0006d920] 102f 0116                 move.b     278(a7),d0
[0006d924] 6606                      bne.s      ConvertExt4Use_16
[0006d926] 2f6f 0106 010e            move.l     262(a7),270(a7)
ConvertExt4Use_16:
[0006d92c] 202f 0102                 move.l     258(a7),d0
[0006d930] 6710                      beq.s      ConvertExt4Use_17
[0006d932] 206f 0102                 movea.l    258(a7),a0
[0006d936] 10bc 002c                 move.b     #$2C,(a0)
[0006d93a] 2f6f 0102 010a            move.l     258(a7),266(a7)
[0006d940] 600e                      bra.s      ConvertExt4Use_18
ConvertExt4Use_17:
[0006d942] 6004                      bra.s      ConvertExt4Use_19
[0006d944] 52af 010a                 addq.l     #1,266(a7)
ConvertExt4Use_20:
ConvertExt4Use_19:
[0006d948] 206f 010a                 movea.l    266(a7),a0
[0006d94c] 1010                      move.b     (a0),d0
[0006d94e] 66f4                      bne.s      ConvertExt4Use_20
ConvertExt4Use_18:
[0006d950] 302f 0124                 move.w     292(a7),d0
[0006d954] 671c                      beq.s      ConvertExt4Use_21
[0006d956] 6004                      bra.s      ConvertExt4Use_22
[0006d958] 52af 010a                 addq.l     #1,266(a7)
ConvertExt4Use_23:
ConvertExt4Use_22:
[0006d95c] 206f 010a                 movea.l    266(a7),a0
[0006d960] 1010                      move.b     (a0),d0
[0006d962] 66f4                      bne.s      ConvertExt4Use_23
[0006d964] 206f 010a                 movea.l    266(a7),a0
[0006d968] 1028 0001                 move.b     1(a0),d0
[0006d96c] 66ea                      bne.s      ConvertExt4Use_23
[0006d96e] 53af 010a                 subq.l     #1,266(a7)
ConvertExt4Use_21:
[0006d972] 52af 010a                 addq.l     #1,266(a7)
ConvertExt4Use_5:
[0006d976] 206f 010a                 movea.l    266(a7),a0
[0006d97a] 1010                      move.b     (a0),d0
[0006d97c] 6600 fecc                 bne        ConvertExt4Use_24
[0006d980] 206f 010a                 movea.l    266(a7),a0
[0006d984] 1028 0001                 move.b     1(a0),d0
[0006d988] 6600 fec0                 bne        ConvertExt4Use_24
[0006d98c] 206f 0106                 movea.l    262(a7),a0
[0006d990] 0c28 002c ffff            cmpi.b     #$2C,-1(a0)
[0006d996] 660a                      bne.s      ConvertExt4Use_25
[0006d998] 53af 0106                 subq.l     #1,262(a7)
[0006d99c] 206f 0106                 movea.l    262(a7),a0
[0006d9a0] 4210                      clr.b      (a0)
ConvertExt4Use_25:
[0006d9a2] 302f 0100                 move.w     256(a7),d0
[0006d9a6] 6648                      bne.s      ConvertExt4Use_26
[0006d9a8] 302f 0114                 move.w     276(a7),d0
[0006d9ac] 670e                      beq.s      ConvertExt4Use_27
[0006d9ae] 206f 011c                 movea.l    284(a7),a0
[0006d9b2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006d9b8] 4a40                      tst.w      d0
[0006d9ba] 6734                      beq.s      ConvertExt4Use_26
ConvertExt4Use_27:
[0006d9bc] 206f 0106                 movea.l    262(a7),a0
[0006d9c0] 52af 0106                 addq.l     #1,262(a7)
[0006d9c4] 10bc 002a                 move.b     #$2A,(a0)
[0006d9c8] 302f 0114                 move.w     276(a7),d0
[0006d9cc] 6718                      beq.s      ConvertExt4Use_28
[0006d9ce] 206f 0106                 movea.l    262(a7),a0
[0006d9d2] 52af 0106                 addq.l     #1,262(a7)
[0006d9d6] 10bc 002e                 move.b     #$2E,(a0)
[0006d9da] 206f 0106                 movea.l    262(a7),a0
[0006d9de] 52af 0106                 addq.l     #1,262(a7)
[0006d9e2] 10bc 002a                 move.b     #$2A,(a0)
ConvertExt4Use_28:
[0006d9e6] 206f 0106                 movea.l    262(a7),a0
[0006d9ea] 52af 0106                 addq.l     #1,262(a7)
[0006d9ee] 4210                      clr.b      (a0)
ConvertExt4Use_26:
[0006d9f0] 206f 0106                 movea.l    262(a7),a0
[0006d9f4] 52af 0106                 addq.l     #1,262(a7)
[0006d9f8] 4210                      clr.b      (a0)
[0006d9fa] 206f 0106                 movea.l    262(a7),a0
[0006d9fe] 52af 0106                 addq.l     #1,262(a7)
[0006da02] 4210                      clr.b      (a0)
[0006da04] 206f 011c                 movea.l    284(a7),a0
ConvertExt4Use_4:
[0006da08] 4fef 0120                 lea.l      288(a7),a7
[0006da0c] 4e75                      rts

ConvertExt2MagiC:
[0006da0e] 514f                      subq.w     #8,a7
[0006da10] 2f48 0004                 move.l     a0,4(a7)
[0006da14] 2e89                      move.l     a1,(a7)
[0006da16] 4267                      clr.w      -(a7)
[0006da18] 7401                      moveq.l    #1,d2
[0006da1a] 4241                      clr.w      d1
[0006da1c] 4200                      clr.b      d0
[0006da1e] 226f 0002                 movea.l    2(a7),a1
[0006da22] 206f 0006                 movea.l    6(a7),a0
[0006da26] 6100 fd88                 bsr        ConvertExt4Use
[0006da2a] 544f                      addq.w     #2,a7
[0006da2c] 504f                      addq.w     #8,a7
[0006da2e] 4e75                      rts

ConvertExt2TOS:
[0006da30] 4fef fff4                 lea.l      -12(a7),a7
[0006da34] 2f48 0008                 move.l     a0,8(a7)
[0006da38] 2f49 0004                 move.l     a1,4(a7)
[0006da3c] 3f7c 0001 0002            move.w     #$0001,2(a7)
[0006da42] 4257                      clr.w      (a7)
[0006da44] 3f2f 0002                 move.w     2(a7),-(a7)
[0006da48] 342f 0002                 move.w     2(a7),d2
[0006da4c] 7201                      moveq.l    #1,d1
[0006da4e] 702c                      moveq.l    #44,d0
[0006da50] 226f 0006                 movea.l    6(a7),a1
[0006da54] 206f 000a                 movea.l    10(a7),a0
[0006da58] 6100 fd56                 bsr        ConvertExt4Use
[0006da5c] 544f                      addq.w     #2,a7
[0006da5e] 4fef 000c                 lea.l      12(a7),a7
[0006da62] 4e75                      rts

SingleSelect:
[0006da64] 2f0a                      move.l     a2,-(a7)
[0006da66] 4fef ff74                 lea.l      -140(a7),a7
[0006da6a] 2f48 0088                 move.l     a0,136(a7)
[0006da6e] 2f49 0084                 move.l     a1,132(a7)
[0006da72] 4eb9 0007 0c0a            jsr        Alu_create
[0006da78] 2f48 0080                 move.l     a0,128(a7)
[0006da7c] 202f 0080                 move.l     128(a7),d0
[0006da80] 6746                      beq.s      SingleSelect_1
[0006da82] 226f 0094                 movea.l    148(a7),a1
[0006da86] 41d7                      lea.l      (a7),a0
[0006da88] 6100 ffa6                 bsr.w      ConvertExt2TOS
[0006da8c] 4857                      pea.l      (a7)
[0006da8e] 226f 0088                 movea.l    136(a7),a1
[0006da92] 206f 008c                 movea.l    140(a7),a0
[0006da96] 6100 f466                 bsr        Af_select
[0006da9a] 584f                      addq.w     #4,a7
[0006da9c] 2008                      move.l     a0,d0
[0006da9e] 6728                      beq.s      SingleSelect_1
[0006daa0] 206f 0084                 movea.l    132(a7),a0
[0006daa4] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006daaa] 4a40                      tst.w      d0
[0006daac] 661a                      bne.s      SingleSelect_1
[0006daae] 206f 0084                 movea.l    132(a7),a0
[0006dab2] 4eb9 0004 643c            jsr        Ast_create
[0006dab8] 2248                      movea.l    a0,a1
[0006daba] 206f 0080                 movea.l    128(a7),a0
[0006dabe] 246f 0080                 movea.l    128(a7),a2
[0006dac2] 246a 000c                 movea.l    12(a2),a2
[0006dac6] 4e92                      jsr        (a2)
SingleSelect_1:
[0006dac8] 206f 0080                 movea.l    128(a7),a0
[0006dacc] 4fef 008c                 lea.l      140(a7),a7
[0006dad0] 245f                      movea.l    (a7)+,a2
[0006dad2] 4e75                      rts

MultiSelect:
[0006dad4] 2f0a                      move.l     a2,-(a7)
[0006dad6] 4fef ff70                 lea.l      -144(a7),a7
[0006dada] 2f48 008c                 move.l     a0,140(a7)
[0006dade] 2f49 0088                 move.l     a1,136(a7)
[0006dae2] 4eb9 0007 0c0a            jsr        Alu_create
[0006dae8] 2f48 0084                 move.l     a0,132(a7)
[0006daec] 202f 0084                 move.l     132(a7),d0
[0006daf0] 6756                      beq.s      MultiSelect_1
[0006daf2] 226f 0098                 movea.l    152(a7),a1
[0006daf6] 41d7                      lea.l      (a7),a0
[0006daf8] 6100 ff36                 bsr        ConvertExt2TOS
[0006dafc] 4857                      pea.l      (a7)
[0006dafe] 226f 008c                 movea.l    140(a7),a1
[0006db02] 206f 0090                 movea.l    144(a7),a0
[0006db06] 6100 f6fe                 bsr        Af_first_fsel
[0006db0a] 584f                      addq.w     #4,a7
[0006db0c] 2f48 0080                 move.l     a0,128(a7)
[0006db10] 6030                      bra.s      MultiSelect_2
[0006db12] 206f 0080                 movea.l    128(a7),a0
MultiSelect_4:
[0006db16] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006db1c] 4a40                      tst.w      d0
[0006db1e] 661a                      bne.s      MultiSelect_3
[0006db20] 206f 0080                 movea.l    128(a7),a0
[0006db24] 4eb9 0004 643c            jsr        Ast_create
[0006db2a] 2248                      movea.l    a0,a1
[0006db2c] 206f 0084                 movea.l    132(a7),a0
[0006db30] 246f 0084                 movea.l    132(a7),a2
[0006db34] 246a 000c                 movea.l    12(a2),a2
[0006db38] 4e92                      jsr        (a2)
MultiSelect_3:
[0006db3a] 6100 f914                 bsr        Af_next_fsel
[0006db3e] 2f48 0080                 move.l     a0,128(a7)
MultiSelect_2:
[0006db42] 202f 0080                 move.l     128(a7),d0
[0006db46] 66ca                      bne.s      MultiSelect_4
MultiSelect_1:
[0006db48] 206f 0084                 movea.l    132(a7),a0
[0006db4c] 4fef 0090                 lea.l      144(a7),a7
[0006db50] 245f                      movea.l    (a7)+,a2
[0006db52] 4e75                      rts

MagiCSelect:
[0006db54] 4fef fe6c                 lea.l      -404(a7),a7
[0006db58] 2f48 0190                 move.l     a0,400(a7)
[0006db5c] 2f49 018c                 move.l     a1,396(a7)
[0006db60] 3f40 018a                 move.w     d0,394(a7)
[0006db64] 3f41 0188                 move.w     d1,392(a7)
[0006db68] 42af 0184                 clr.l      388(a7)
[0006db6c] 43f9 000e 2b63            lea.l      $000E2B63,a1
[0006db72] 41ef 0104                 lea.l      260(a7),a0
[0006db76] 4eb9 0008 2f0c            jsr        strcpy
[0006db7c] 206f 018c                 movea.l    396(a7),a0
[0006db80] 4eb9 0004 b548            jsr        Af_2drv
[0006db86] d12f 0104                 add.b      d0,260(a7)
[0006db8a] 226f 018c                 movea.l    396(a7),a1
[0006db8e] 41ef 0106                 lea.l      262(a7),a0
[0006db92] 4eb9 0004 b586            jsr        Af_2path
[0006db98] 226f 018c                 movea.l    396(a7),a1
[0006db9c] 41ef 0084                 lea.l      132(a7),a0
[0006dba0] 4eb9 0004 b706            jsr        Af_2fullname
[0006dba6] 43f9 000e 2b66            lea.l      $000E2B66,a1
[0006dbac] 41ef 0084                 lea.l      132(a7),a0
[0006dbb0] 4eb9 0004 66ea            jsr        Ast_icmp
[0006dbb6] 4a40                      tst.w      d0
[0006dbb8] 6604                      bne.s      MagiCSelect_1
[0006dbba] 422f 0084                 clr.b      132(a7)
MagiCSelect_1:
[0006dbbe] 226f 0198                 movea.l    408(a7),a1
[0006dbc2] 41ef 0004                 lea.l      4(a7),a0
[0006dbc6] 6100 fe46                 bsr        ConvertExt2MagiC
[0006dbca] 2e88                      move.l     a0,(a7)
[0006dbcc] 2f2f 019c                 move.l     412(a7),-(a7)
[0006dbd0] 302f 018c                 move.w     396(a7),d0
[0006dbd4] 6704                      beq.s      MagiCSelect_2
[0006dbd6] 7008                      moveq.l    #8,d0
[0006dbd8] 6002                      bra.s      MagiCSelect_3
MagiCSelect_2:
[0006dbda] 4240                      clr.w      d0
MagiCSelect_3:
[0006dbdc] 3f00                      move.w     d0,-(a7)
[0006dbde] 42a7                      clr.l      -(a7)
[0006dbe0] 42a7                      clr.l      -(a7)
[0006dbe2] 2f2f 000e                 move.l     14(a7),-(a7)
[0006dbe6] 486f 0096                 pea.l      150(a7)
[0006dbea] 0c6f ffff 01a0            cmpi.w     #$FFFF,416(a7)
[0006dbf0] 6d0e                      blt.s      MagiCSelect_4
[0006dbf2] 0c6f 0004 01a0            cmpi.w     #$0004,416(a7)
[0006dbf8] 6c06                      bge.s      MagiCSelect_4
[0006dbfa] 342f 01a0                 move.w     416(a7),d2
[0006dbfe] 6002                      bra.s      MagiCSelect_5
MagiCSelect_4:
[0006dc00] 4242                      clr.w      d2
MagiCSelect_5:
[0006dc02] 43ef 011a                 lea.l      282(a7),a1
[0006dc06] 72ff                      moveq.l    #-1,d1
[0006dc08] 70ff                      moveq.l    #-1,d0
[0006dc0a] 206f 01a6                 movea.l    422(a7),a0
[0006dc0e] 6100 f908                 bsr        Ash_fileselect
[0006dc12] 4fef 0016                 lea.l      22(a7),a7
[0006dc16] 2f48 0184                 move.l     a0,388(a7)
[0006dc1a] 206f 0184                 movea.l    388(a7),a0
[0006dc1e] 4fef 0194                 lea.l      404(a7),a7
[0006dc22] 4e75                      rts

Af_fileselect:
[0006dc24] 4fef fff0                 lea.l      -16(a7),a7
[0006dc28] 2f48 000c                 move.l     a0,12(a7)
[0006dc2c] 2f49 0008                 move.l     a1,8(a7)
[0006dc30] 3f40 0006                 move.w     d0,6(a7)
[0006dc34] 3f41 0004                 move.w     d1,4(a7)
[0006dc38] 4297                      clr.l      (a7)
[0006dc3a] 4eb9 0006 dca0            jsr        hasFslx
[0006dc40] 4a40                      tst.w      d0
[0006dc42] 6720                      beq.s      Af_fileselect_1
[0006dc44] 2f2f 0018                 move.l     24(a7),-(a7)
[0006dc48] 2f2f 0018                 move.l     24(a7),-(a7)
[0006dc4c] 322f 000c                 move.w     12(a7),d1
[0006dc50] 302f 000e                 move.w     14(a7),d0
[0006dc54] 226f 0010                 movea.l    16(a7),a1
[0006dc58] 206f 0014                 movea.l    20(a7),a0
[0006dc5c] 6100 fef6                 bsr        MagiCSelect
[0006dc60] 504f                      addq.w     #8,a7
[0006dc62] 2e88                      move.l     a0,(a7)
Af_fileselect_1:
[0006dc64] 2017                      move.l     (a7),d0
[0006dc66] 6630                      bne.s      Af_fileselect_2
[0006dc68] 302f 0004                 move.w     4(a7),d0
[0006dc6c] 6716                      beq.s      Af_fileselect_3
[0006dc6e] 2f2f 0014                 move.l     20(a7),-(a7)
[0006dc72] 226f 000c                 movea.l    12(a7),a1
[0006dc76] 206f 0010                 movea.l    16(a7),a0
[0006dc7a] 6100 fe58                 bsr        MultiSelect
[0006dc7e] 584f                      addq.w     #4,a7
[0006dc80] 2e88                      move.l     a0,(a7)
[0006dc82] 6014                      bra.s      Af_fileselect_2
Af_fileselect_3:
[0006dc84] 2f2f 0014                 move.l     20(a7),-(a7)
[0006dc88] 226f 000c                 movea.l    12(a7),a1
[0006dc8c] 206f 0010                 movea.l    16(a7),a0
[0006dc90] 6100 fdd2                 bsr        SingleSelect
[0006dc94] 584f                      addq.w     #4,a7
[0006dc96] 2e88                      move.l     a0,(a7)
Af_fileselect_2:
[0006dc98] 2057                      movea.l    (a7),a0
[0006dc9a] 4fef 0010                 lea.l      16(a7),a7
[0006dc9e] 4e75                      rts

hasFslx:
[0006dca0] 514f                      subq.w     #8,a7
[0006dca2] 3039 000e 2892            move.w     vorhanden,d0
[0006dca8] 6a42                      bpl.s      hasFslx_1
[0006dcaa] 2f39 000e 692a            move.l     _globl,-(a7)
[0006dcb0] 486f 0004                 pea.l      4(a7)
[0006dcb4] 486f 000a                 pea.l      10(a7)
[0006dcb8] 43ef 0010                 lea.l      16(a7),a1
[0006dcbc] 41ef 0012                 lea.l      18(a7),a0
[0006dcc0] 7007                      moveq.l    #7,d0
[0006dcc2] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[0006dcc8] 4fef 000c                 lea.l      12(a7),a7
[0006dccc] 4a40                      tst.w      d0
[0006dcce] 6716                      beq.s      hasFslx_2
[0006dcd0] 7008                      moveq.l    #8,d0
[0006dcd2] c06f 0006                 and.w      6(a7),d0
[0006dcd6] 6704                      beq.s      hasFslx_3
[0006dcd8] 7001                      moveq.l    #1,d0
[0006dcda] 6002                      bra.s      hasFslx_4
hasFslx_3:
[0006dcdc] 4240                      clr.w      d0
hasFslx_4:
[0006dcde] 33c0 000e 2892            move.w     d0,vorhanden
[0006dce4] 6006                      bra.s      hasFslx_1
hasFslx_2:
[0006dce6] 4279 000e 2892            clr.w      vorhanden
hasFslx_1:
[0006dcec] 3039 000e 2892            move.w     vorhanden,d0
[0006dcf2] 6704                      beq.s      hasFslx_5
[0006dcf4] 7001                      moveq.l    #1,d0
[0006dcf6] 6002                      bra.s      hasFslx_6
hasFslx_5:
[0006dcf8] 4240                      clr.w      d0
hasFslx_6:
[0006dcfa] 504f                      addq.w     #8,a7
[0006dcfc] 4e75                      rts

fslxMakeListe:
[0006dcfe] 2f0a                      move.l     a2,-(a7)
[0006dd00] 4fef ffee                 lea.l      -18(a7),a7
[0006dd04] 2f48 000e                 move.l     a0,14(a7)
[0006dd08] 206f 000e                 movea.l    14(a7),a0
[0006dd0c] 2028 003a                 move.l     58(a0),d0
[0006dd10] 670c                      beq.s      fslxMakeListe_1
[0006dd12] 206f 000e                 movea.l    14(a7),a0
[0006dd16] 2068 003a                 movea.l    58(a0),a0
[0006dd1a] 6000 0108                 bra        fslxMakeListe_2
fslxMakeListe_1:
[0006dd1e] 4eb9 0007 0c0a            jsr        Alu_create
[0006dd24] 2f48 000a                 move.l     a0,10(a7)
[0006dd28] 226f 000e                 movea.l    14(a7),a1
[0006dd2c] 2348 003a                 move.l     a0,58(a1)
[0006dd30] 202f 000a                 move.l     10(a7),d0
[0006dd34] 6700 00ea                 beq        fslxMakeListe_3
[0006dd38] 206f 000e                 movea.l    14(a7),a0
[0006dd3c] 3028 002e                 move.w     46(a0),d0
[0006dd40] 6700 00de                 beq        fslxMakeListe_3
[0006dd44] 426f 0008                 clr.w      8(a7)
[0006dd48] 6000 00ce                 bra        fslxMakeListe_4
[0006dd4c] 206f 000e                 movea.l    14(a7),a0
fslxMakeListe_10:
[0006dd50] 2068 0012                 movea.l    18(a0),a0
[0006dd54] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006dd5a] 4a40                      tst.w      d0
[0006dd5c] 6600 0082                 bne        fslxMakeListe_5
[0006dd60] 206f 000e                 movea.l    14(a7),a0
[0006dd64] 2068 000c                 movea.l    12(a0),a0
[0006dd68] 4eb9 0008 2f6c            jsr        strlen
[0006dd6e] 2f00                      move.l     d0,-(a7)
[0006dd70] 206f 0012                 movea.l    18(a7),a0
[0006dd74] 2068 0012                 movea.l    18(a0),a0
[0006dd78] 4eb9 0008 2f6c            jsr        strlen
[0006dd7e] d09f                      add.l      (a7)+,d0
[0006dd80] 2f40 0004                 move.l     d0,4(a7)
[0006dd84] 7002                      moveq.l    #2,d0
[0006dd86] d0af 0004                 add.l      4(a7),d0
[0006dd8a] 4eb9 0004 c608            jsr        Ax_malloc
[0006dd90] 2e88                      move.l     a0,(a7)
[0006dd92] 2017                      move.l     (a7),d0
[0006dd94] 660e                      bne.s      fslxMakeListe_6
[0006dd96] 206f 000a                 movea.l    10(a7),a0
[0006dd9a] 4eb9 0007 0c5e            jsr        Alu_delete
[0006dda0] 6000 007e                 bra.w      fslxMakeListe_3
fslxMakeListe_6:
[0006dda4] 206f 000e                 movea.l    14(a7),a0
[0006dda8] 2268 000c                 movea.l    12(a0),a1
[0006ddac] 2057                      movea.l    (a7),a0
[0006ddae] 4eb9 0008 2f0c            jsr        strcpy
[0006ddb4] 206f 000e                 movea.l    14(a7),a0
[0006ddb8] 2268 0012                 movea.l    18(a0),a1
[0006ddbc] 2057                      movea.l    (a7),a0
[0006ddbe] 4eb9 0008 2e42            jsr        strcat
[0006ddc4] 2057                      movea.l    (a7),a0
[0006ddc6] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006ddcc] 4a40                      tst.w      d0
[0006ddce] 6610                      bne.s      fslxMakeListe_5
[0006ddd0] 2257                      movea.l    (a7),a1
[0006ddd2] 206f 000a                 movea.l    10(a7),a0
[0006ddd6] 246f 000a                 movea.l    10(a7),a2
[0006ddda] 246a 000c                 movea.l    12(a2),a2
[0006ddde] 4e92                      jsr        (a2)
fslxMakeListe_5:
[0006dde0] 206f 000e                 movea.l    14(a7),a0
[0006dde4] 0c68 0001 0030            cmpi.w     #$0001,48(a0)
[0006ddea] 6d22                      blt.s      fslxMakeListe_7
[0006ddec] 2f39 000e 692a            move.l     _globl,-(a7)
[0006ddf2] 206f 0012                 movea.l    18(a7),a0
[0006ddf6] 2268 0012                 movea.l    18(a0),a1
[0006ddfa] 206f 0012                 movea.l    18(a7),a0
[0006ddfe] 2068 0028                 movea.l    40(a0),a0
[0006de02] 4eb9 0007 b14c            jsr        mt_fslx_getnxtfile
[0006de08] 584f                      addq.w     #4,a7
[0006de0a] 4a40                      tst.w      d0
[0006de0c] 6604                      bne.s      fslxMakeListe_8
fslxMakeListe_7:
[0006de0e] 7001                      moveq.l    #1,d0
[0006de10] 6002                      bra.s      fslxMakeListe_9
fslxMakeListe_8:
[0006de12] 4240                      clr.w      d0
fslxMakeListe_9:
[0006de14] 3f40 0008                 move.w     d0,8(a7)
fslxMakeListe_4:
[0006de18] 302f 0008                 move.w     8(a7),d0
[0006de1c] 6700 ff2e                 beq        fslxMakeListe_10
fslxMakeListe_3:
[0006de20] 206f 000a                 movea.l    10(a7),a0
fslxMakeListe_2:
[0006de24] 4fef 0012                 lea.l      18(a7),a7
[0006de28] 245f                      movea.l    (a7)+,a2
[0006de2a] 4e75                      rts

fslxCreate:
[0006de2c] 594f                      subq.w     #4,a7
[0006de2e] 2e88                      move.l     a0,(a7)
[0006de30] 2f39 000e 692a            move.l     _globl,-(a7)
[0006de36] 206f 0004                 movea.l    4(a7),a0
[0006de3a] 3f28 0026                 move.w     38(a0),-(a7)
[0006de3e] 206f 0006                 movea.l    6(a7),a0
[0006de42] 3f28 0024                 move.w     36(a0),-(a7)
[0006de46] 206f 0008                 movea.l    8(a7),a0
[0006de4a] 2f28 0020                 move.l     32(a0),-(a7)
[0006de4e] 206f 000c                 movea.l    12(a7),a0
[0006de52] 2f28 001c                 move.l     28(a0),-(a7)
[0006de56] 206f 0010                 movea.l    16(a7),a0
[0006de5a] 2f28 0018                 move.l     24(a0),-(a7)
[0006de5e] 206f 0014                 movea.l    20(a7),a0
[0006de62] 3f28 0016                 move.w     22(a0),-(a7)
[0006de66] 206f 0016                 movea.l    22(a7),a0
[0006de6a] 2f28 0012                 move.l     18(a0),-(a7)
[0006de6e] 206f 001a                 movea.l    26(a7),a0
[0006de72] 2f28 000c                 move.l     12(a0),-(a7)
[0006de76] 206f 001e                 movea.l    30(a7),a0
[0006de7a] 3428 0010                 move.w     16(a0),d2
[0006de7e] 206f 001e                 movea.l    30(a7),a0
[0006de82] 2268 0008                 movea.l    8(a0),a1
[0006de86] 206f 001e                 movea.l    30(a7),a0
[0006de8a] 3228 0006                 move.w     6(a0),d1
[0006de8e] 206f 001e                 movea.l    30(a7),a0
[0006de92] 3028 0004                 move.w     4(a0),d0
[0006de96] 206f 001e                 movea.l    30(a7),a0
[0006de9a] 2050                      movea.l    (a0),a0
[0006de9c] 4eb9 0007 b03c            jsr        mt_fslx_open
[0006dea2] 4fef 001e                 lea.l      30(a7),a7
[0006dea6] 2257                      movea.l    (a7),a1
[0006dea8] 2348 0028                 move.l     a0,40(a1)
[0006deac] 2057                      movea.l    (a7),a0
[0006deae] 2028 0028                 move.l     40(a0),d0
[0006deb2] 6704                      beq.s      fslxCreate_1
[0006deb4] 7001                      moveq.l    #1,d0
[0006deb6] 6002                      bra.s      fslxCreate_2
fslxCreate_1:
[0006deb8] 4240                      clr.w      d0
fslxCreate_2:
[0006deba] 584f                      addq.w     #4,a7
[0006debc] 4e75                      rts

fslxClose:
[0006debe] 2f0a                      move.l     a2,-(a7)
[0006dec0] 594f                      subq.w     #4,a7
[0006dec2] 2e88                      move.l     a0,(a7)
[0006dec4] 2057                      movea.l    (a7),a0
[0006dec6] 6100 fe36                 bsr        fslxMakeListe
[0006deca] 2057                      movea.l    (a7),a0
[0006decc] 2028 0028                 move.l     40(a0),d0
[0006ded0] 6732                      beq.s      fslxClose_1
[0006ded2] 2279 000e 692a            movea.l    _globl,a1
[0006ded8] 2057                      movea.l    (a7),a0
[0006deda] 2068 0028                 movea.l    40(a0),a0
[0006dede] 4eb9 0007 b0f2            jsr        mt_fslx_close
[0006dee4] 2057                      movea.l    (a7),a0
[0006dee6] 2028 0036                 move.l     54(a0),d0
[0006deea] 670c                      beq.s      fslxClose_2
[0006deec] 2057                      movea.l    (a7),a0
[0006deee] 2068 0036                 movea.l    54(a0),a0
[0006def2] 4eb9 0005 8362            jsr        Awi_closed
fslxClose_2:
[0006def8] 2057                      movea.l    (a7),a0
[0006defa] 42a8 0036                 clr.l      54(a0)
[0006defe] 2057                      movea.l    (a7),a0
[0006df00] 42a8 0028                 clr.l      40(a0)
fslxClose_1:
[0006df04] 2057                      movea.l    (a7),a0
[0006df06] 2028 0032                 move.l     50(a0),d0
[0006df0a] 6734                      beq.s      fslxClose_3
[0006df0c] 2057                      movea.l    (a7),a0
[0006df0e] 2268 003a                 movea.l    58(a0),a1
[0006df12] 7030                      moveq.l    #48,d0
[0006df14] 2057                      movea.l    (a7),a0
[0006df16] 2068 0032                 movea.l    50(a0),a0
[0006df1a] 2457                      movea.l    (a7),a2
[0006df1c] 246a 0032                 movea.l    50(a2),a2
[0006df20] 246a 0004                 movea.l    4(a2),a2
[0006df24] 4e92                      jsr        (a2)
[0006df26] 2057                      movea.l    (a7),a0
[0006df28] 2028 003a                 move.l     58(a0),d0
[0006df2c] 6712                      beq.s      fslxClose_3
[0006df2e] 2057                      movea.l    (a7),a0
[0006df30] 2068 003a                 movea.l    58(a0),a0
[0006df34] 4eb9 0007 0c5e            jsr        Alu_delete
[0006df3a] 2057                      movea.l    (a7),a0
[0006df3c] 42a8 003a                 clr.l      58(a0)
fslxClose_3:
[0006df40] 7001                      moveq.l    #1,d0
[0006df42] 584f                      addq.w     #4,a7
[0006df44] 245f                      movea.l    (a7)+,a2
[0006df46] 4e75                      rts

fslxMessage:
[0006df48] 4fef fff4                 lea.l      -12(a7),a7
[0006df4c] 2f48 0008                 move.l     a0,8(a7)
[0006df50] 2f49 0004                 move.l     a1,4(a7)
[0006df54] 206f 0008                 movea.l    8(a7),a0
[0006df58] 2068 0008                 movea.l    8(a0),a0
[0006df5c] 226f 0004                 movea.l    4(a7),a1
[0006df60] 3350 0026                 move.w     (a0),38(a1)
[0006df64] 7010                      moveq.l    #16,d0
[0006df66] 4eb9 0005 ae7e            jsr        Awi_update
[0006df6c] 2f39 000e 692a            move.l     _globl,-(a7)
[0006df72] 206f 000c                 movea.l    12(a7),a0
[0006df76] 4868 0018                 pea.l      24(a0)
[0006df7a] 206f 0010                 movea.l    16(a7),a0
[0006df7e] 4868 0024                 pea.l      36(a0)
[0006df82] 486f 000c                 pea.l      12(a7)
[0006df86] 206f 0018                 movea.l    24(a7),a0
[0006df8a] 4868 002e                 pea.l      46(a0)
[0006df8e] 206f 001c                 movea.l    28(a7),a0
[0006df92] 2f28 0012                 move.l     18(a0),-(a7)
[0006df96] 206f 0020                 movea.l    32(a7),a0
[0006df9a] 2f28 000c                 move.l     12(a0),-(a7)
[0006df9e] 226f 0020                 movea.l    32(a7),a1
[0006dfa2] 206f 0024                 movea.l    36(a7),a0
[0006dfa6] 2068 0028                 movea.l    40(a0),a0
[0006dfaa] 4eb9 0007 b1ac            jsr        mt_fslx_evnt
[0006dfb0] 4fef 001c                 lea.l      28(a7),a7
[0006dfb4] 3f40 0002                 move.w     d0,2(a7)
[0006dfb8] 7020                      moveq.l    #32,d0
[0006dfba] 4eb9 0005 ae7e            jsr        Awi_update
[0006dfc0] 302f 0002                 move.w     2(a7),d0
[0006dfc4] 6610                      bne.s      fslxMessage_1
[0006dfc6] 206f 0008                 movea.l    8(a7),a0
[0006dfca] 3157 0030                 move.w     (a7),48(a0)
[0006dfce] 206f 0008                 movea.l    8(a7),a0
[0006dfd2] 6100 feea                 bsr        fslxClose
fslxMessage_1:
[0006dfd6] 302f 0002                 move.w     2(a7),d0
[0006dfda] 4fef 000c                 lea.l      12(a7),a7
[0006dfde] 4e75                      rts

FileCreate:
[0006dfe0] 4fef ffe4                 lea.l      -28(a7),a7
[0006dfe4] 2f48 0018                 move.l     a0,24(a7)
[0006dfe8] 2f6f 0018 0014            move.l     24(a7),20(a7)
[0006dfee] 42af 0010                 clr.l      16(a7)
[0006dff2] 202f 0018                 move.l     24(a7),d0
[0006dff6] 6606                      bne.s      FileCreate_1
[0006dff8] 91c8                      suba.l     a0,a0
[0006dffa] 6000 01f2                 bra        FileCreate_2
FileCreate_1:
[0006dffe] 206f 0014                 movea.l    20(a7),a0
[0006e002] 2f68 000c 0008            move.l     12(a0),8(a7)
[0006e008] 206f 0014                 movea.l    20(a7),a0
[0006e00c] 317c 0080 0010            move.w     #$0080,16(a0)
[0006e012] 206f 0014                 movea.l    20(a7),a0
[0006e016] 3028 0010                 move.w     16(a0),d0
[0006e01a] 48c0                      ext.l      d0
[0006e01c] 4eb9 0004 c608            jsr        Ax_malloc
[0006e022] 226f 0014                 movea.l    20(a7),a1
[0006e026] 2348 000c                 move.l     a0,12(a1)
[0006e02a] 206f 0014                 movea.l    20(a7),a0
[0006e02e] 2028 000c                 move.l     12(a0),d0
[0006e032] 6606                      bne.s      FileCreate_3
[0006e034] 91c8                      suba.l     a0,a0
[0006e036] 6000 01b6                 bra        FileCreate_2
FileCreate_3:
[0006e03a] 226f 0008                 movea.l    8(a7),a1
[0006e03e] 206f 0014                 movea.l    20(a7),a0
[0006e042] 2068 000c                 movea.l    12(a0),a0
[0006e046] 4eb9 0008 2f0c            jsr        strcpy
[0006e04c] 206f 0014                 movea.l    20(a7),a0
[0006e050] 2f68 0012 0008            move.l     18(a0),8(a7)
[0006e056] 206f 0014                 movea.l    20(a7),a0
[0006e05a] 317c 0080 0016            move.w     #$0080,22(a0)
[0006e060] 206f 0014                 movea.l    20(a7),a0
[0006e064] 3028 0016                 move.w     22(a0),d0
[0006e068] 48c0                      ext.l      d0
[0006e06a] 4eb9 0004 c608            jsr        Ax_malloc
[0006e070] 226f 0014                 movea.l    20(a7),a1
[0006e074] 2348 0012                 move.l     a0,18(a1)
[0006e078] 206f 0014                 movea.l    20(a7),a0
[0006e07c] 2028 0012                 move.l     18(a0),d0
[0006e080] 6614                      bne.s      FileCreate_4
[0006e082] 206f 0014                 movea.l    20(a7),a0
[0006e086] 2068 000c                 movea.l    12(a0),a0
[0006e08a] 4eb9 0004 c7c8            jsr        Ax_free
[0006e090] 91c8                      suba.l     a0,a0
[0006e092] 6000 015a                 bra        FileCreate_2
FileCreate_4:
[0006e096] 226f 0008                 movea.l    8(a7),a1
[0006e09a] 206f 0014                 movea.l    20(a7),a0
[0006e09e] 2068 0012                 movea.l    18(a0),a0
[0006e0a2] 4eb9 0008 2f0c            jsr        strcpy
[0006e0a8] 206f 0014                 movea.l    20(a7),a0
[0006e0ac] 2068 0018                 movea.l    24(a0),a0
[0006e0b0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006e0b6] 4a40                      tst.w      d0
[0006e0b8] 6636                      bne.s      FileCreate_5
[0006e0ba] 2ebc 0000 0002            move.l     #$00000002,(a7)
[0006e0c0] 206f 0014                 movea.l    20(a7),a0
[0006e0c4] 2f68 0018 0008            move.l     24(a0),8(a7)
[0006e0ca] 6006                      bra.s      FileCreate_6
[0006e0cc] 5297                      addq.l     #1,(a7)
FileCreate_7:
[0006e0ce] 52af 0008                 addq.l     #1,8(a7)
FileCreate_6:
[0006e0d2] 206f 0008                 movea.l    8(a7),a0
[0006e0d6] 1010                      move.b     (a0),d0
[0006e0d8] 66f2                      bne.s      FileCreate_7
[0006e0da] 206f 0008                 movea.l    8(a7),a0
[0006e0de] 1028 0001                 move.b     1(a0),d0
[0006e0e2] 66e8                      bne.s      FileCreate_7
[0006e0e4] 206f 0014                 movea.l    20(a7),a0
[0006e0e8] 2f68 0018 0008            move.l     24(a0),8(a7)
[0006e0ee] 600e                      bra.s      FileCreate_8
FileCreate_5:
[0006e0f0] 2ebc 0000 0003            move.l     #$00000003,(a7)
[0006e0f6] 2f7c 000e 2b68 0008       move.l     #$000E2B68,8(a7)
FileCreate_8:
[0006e0fe] 2017                      move.l     (a7),d0
[0006e100] 4eb9 0004 c608            jsr        Ax_malloc
[0006e106] 226f 0014                 movea.l    20(a7),a1
[0006e10a] 2348 0018                 move.l     a0,24(a1)
[0006e10e] 206f 0014                 movea.l    20(a7),a0
[0006e112] 2028 0018                 move.l     24(a0),d0
[0006e116] 6622                      bne.s      FileCreate_9
[0006e118] 206f 0014                 movea.l    20(a7),a0
[0006e11c] 2068 0012                 movea.l    18(a0),a0
[0006e120] 4eb9 0004 c7c8            jsr        Ax_free
[0006e126] 206f 0014                 movea.l    20(a7),a0
[0006e12a] 2068 000c                 movea.l    12(a0),a0
[0006e12e] 4eb9 0004 c7c8            jsr        Ax_free
[0006e134] 91c8                      suba.l     a0,a0
[0006e136] 6000 00b6                 bra        FileCreate_2
FileCreate_9:
[0006e13a] 206f 0014                 movea.l    20(a7),a0
[0006e13e] 2f68 0018 0004            move.l     24(a0),4(a7)
[0006e144] 6012                      bra.s      FileCreate_10
[0006e146] 206f 0008                 movea.l    8(a7),a0
FileCreate_11:
[0006e14a] 226f 0004                 movea.l    4(a7),a1
[0006e14e] 1290                      move.b     (a0),(a1)
[0006e150] 52af 0008                 addq.l     #1,8(a7)
[0006e154] 52af 0004                 addq.l     #1,4(a7)
FileCreate_10:
[0006e158] 206f 0008                 movea.l    8(a7),a0
[0006e15c] 1010                      move.b     (a0),d0
[0006e15e] 66e6                      bne.s      FileCreate_11
[0006e160] 206f 0008                 movea.l    8(a7),a0
[0006e164] 1028 0001                 move.b     1(a0),d0
[0006e168] 66dc                      bne.s      FileCreate_11
[0006e16a] 206f 0004                 movea.l    4(a7),a0
[0006e16e] 4210                      clr.b      (a0)
[0006e170] 206f 0004                 movea.l    4(a7),a0
[0006e174] 4228 0001                 clr.b      1(a0)
[0006e178] 41f9 000e 27e0            lea.l      WI_FILESEL,a0
[0006e17e] 4eb9 0005 7052            jsr        Awi_create
[0006e184] 2f48 0010                 move.l     a0,16(a7)
[0006e188] 202f 0010                 move.l     16(a7),d0
[0006e18c] 6604                      bne.s      FileCreate_12
[0006e18e] 91c8                      suba.l     a0,a0
[0006e190] 605c                      bra.s      FileCreate_2
FileCreate_12:
[0006e192] 206f 0014                 movea.l    20(a7),a0
[0006e196] 2050                      movea.l    (a0),a0
[0006e198] 4eb9 0004 643c            jsr        Ast_create
[0006e19e] 2f48 000c                 move.l     a0,12(a7)
[0006e1a2] 202f 000c                 move.l     12(a7),d0
[0006e1a6] 6718                      beq.s      FileCreate_13
[0006e1a8] 206f 0010                 movea.l    16(a7),a0
[0006e1ac] 2068 004a                 movea.l    74(a0),a0
[0006e1b0] 4eb9 0004 649c            jsr        Ast_delete
[0006e1b6] 206f 0010                 movea.l    16(a7),a0
[0006e1ba] 216f 000c 004a            move.l     12(a7),74(a0)
FileCreate_13:
[0006e1c0] 206f 0014                 movea.l    20(a7),a0
[0006e1c4] 42a8 0028                 clr.l      40(a0)
[0006e1c8] 206f 0010                 movea.l    16(a7),a0
[0006e1cc] 41e8 0020                 lea.l      32(a0),a0
[0006e1d0] 226f 0014                 movea.l    20(a7),a1
[0006e1d4] 2348 0008                 move.l     a0,8(a1)
[0006e1d8] 206f 0010                 movea.l    16(a7),a0
[0006e1dc] 20af 0014                 move.l     20(a7),(a0)
[0006e1e0] 206f 0014                 movea.l    20(a7),a0
[0006e1e4] 216f 0010 0036            move.l     16(a7),54(a0)
[0006e1ea] 206f 0010                 movea.l    16(a7),a0
FileCreate_2:
[0006e1ee] 4fef 001c                 lea.l      28(a7),a7
[0006e1f2] 4e75                      rts

FileService:
[0006e1f4] 4fef fff6                 lea.l      -10(a7),a7
[0006e1f8] 2f48 0006                 move.l     a0,6(a7)
[0006e1fc] 3f40 0004                 move.w     d0,4(a7)
[0006e200] 206f 0006                 movea.l    6(a7),a0
[0006e204] 2e90                      move.l     (a0),(a7)
[0006e206] 302f 0004                 move.w     4(a7),d0
[0006e20a] 5540                      subq.w     #2,d0
[0006e20c] 6704                      beq.s      FileService_1
[0006e20e] 6000 007e                 bra.w      FileService_2
FileService_1:
[0006e212] 206f 0006                 movea.l    6(a7),a0
[0006e216] 3028 0056                 move.w     86(a0),d0
[0006e21a] c07c 0200                 and.w      #$0200,d0
[0006e21e] 666a                      bne.s      FileService_3
[0006e220] 206f 0006                 movea.l    6(a7),a0
[0006e224] 0068 0200 0056            ori.w      #$0200,86(a0)
[0006e22a] 206f 0006                 movea.l    6(a7),a0
[0006e22e] 4eb9 0005 85f2            jsr        Awi_delete
[0006e234] 2057                      movea.l    (a7),a0
[0006e236] 42a8 0036                 clr.l      54(a0)
[0006e23a] 2057                      movea.l    (a7),a0
[0006e23c] 6100 fc80                 bsr        fslxClose
[0006e240] 2057                      movea.l    (a7),a0
[0006e242] 3028 002c                 move.w     44(a0),d0
[0006e246] 6642                      bne.s      FileService_3
[0006e248] 2057                      movea.l    (a7),a0
[0006e24a] 2028 003a                 move.l     58(a0),d0
[0006e24e] 670c                      beq.s      FileService_4
[0006e250] 2057                      movea.l    (a7),a0
[0006e252] 2068 003a                 movea.l    58(a0),a0
[0006e256] 4eb9 0007 0c5e            jsr        Alu_delete
FileService_4:
[0006e25c] 2057                      movea.l    (a7),a0
[0006e25e] 2068 0018                 movea.l    24(a0),a0
[0006e262] 4eb9 0004 c7c8            jsr        Ax_free
[0006e268] 2057                      movea.l    (a7),a0
[0006e26a] 2068 0012                 movea.l    18(a0),a0
[0006e26e] 4eb9 0004 c7c8            jsr        Ax_free
[0006e274] 2057                      movea.l    (a7),a0
[0006e276] 2068 000c                 movea.l    12(a0),a0
[0006e27a] 4eb9 0004 c7c8            jsr        Ax_free
[0006e280] 703e                      moveq.l    #62,d0
[0006e282] 2057                      movea.l    (a7),a0
[0006e284] 4eb9 0004 cc28            jsr        Ax_recycle
FileService_3:
[0006e28a] 7001                      moveq.l    #1,d0
[0006e28c] 6002                      bra.s      FileService_5
FileService_2:
[0006e28e] 4240                      clr.w      d0
FileService_5:
[0006e290] 4fef 000a                 lea.l      10(a7),a7
[0006e294] 4e75                      rts

FileOpen:
[0006e296] 514f                      subq.w     #8,a7
[0006e298] 2f48 0004                 move.l     a0,4(a7)
[0006e29c] 206f 0004                 movea.l    4(a7),a0
[0006e2a0] 2e90                      move.l     (a0),(a7)
[0006e2a2] 2057                      movea.l    (a7),a0
[0006e2a4] 6100 fb86                 bsr        fslxCreate
[0006e2a8] 4a40                      tst.w      d0
[0006e2aa] 6700 00b6                 beq        FileOpen_1
[0006e2ae] 206f 0004                 movea.l    4(a7),a0
[0006e2b2] 4868 002a                 pea.l      42(a0)
[0006e2b6] 206f 0008                 movea.l    8(a7),a0
[0006e2ba] 4868 0028                 pea.l      40(a0)
[0006e2be] 206f 000c                 movea.l    12(a7),a0
[0006e2c2] 4868 0026                 pea.l      38(a0)
[0006e2c6] 206f 0010                 movea.l    16(a7),a0
[0006e2ca] 4868 0024                 pea.l      36(a0)
[0006e2ce] 7205                      moveq.l    #5,d1
[0006e2d0] 206f 0014                 movea.l    20(a7),a0
[0006e2d4] 3028 0020                 move.w     32(a0),d0
[0006e2d8] 4eb9 0007 f7ba            jsr        wind_get
[0006e2de] 4fef 0010                 lea.l      16(a7),a7
[0006e2e2] 206f 0004                 movea.l    4(a7),a0
[0006e2e6] 4868 003a                 pea.l      58(a0)
[0006e2ea] 206f 0008                 movea.l    8(a7),a0
[0006e2ee] 4868 0038                 pea.l      56(a0)
[0006e2f2] 206f 000c                 movea.l    12(a7),a0
[0006e2f6] 4868 0036                 pea.l      54(a0)
[0006e2fa] 206f 0010                 movea.l    16(a7),a0
[0006e2fe] 4868 0034                 pea.l      52(a0)
[0006e302] 7204                      moveq.l    #4,d1
[0006e304] 206f 0014                 movea.l    20(a7),a0
[0006e308] 3028 0020                 move.w     32(a0),d0
[0006e30c] 4eb9 0007 f7ba            jsr        wind_get
[0006e312] 4fef 0010                 lea.l      16(a7),a7
[0006e316] 206f 0004                 movea.l    4(a7),a0
[0006e31a] 2068 0014                 movea.l    20(a0),a0
[0006e31e] 4268 0010                 clr.w      16(a0)
[0006e322] 206f 0004                 movea.l    4(a7),a0
[0006e326] 2068 0014                 movea.l    20(a0),a0
[0006e32a] 4268 0012                 clr.w      18(a0)
[0006e32e] 206f 0004                 movea.l    4(a7),a0
[0006e332] 226f 0004                 movea.l    4(a7),a1
[0006e336] 2269 0014                 movea.l    20(a1),a1
[0006e33a] 3368 0038 0014            move.w     56(a0),20(a1)
[0006e340] 206f 0004                 movea.l    4(a7),a0
[0006e344] 226f 0004                 movea.l    4(a7),a1
[0006e348] 2269 0014                 movea.l    20(a1),a1
[0006e34c] 3368 003a 0016            move.w     58(a0),22(a1)
[0006e352] 206f 0004                 movea.l    4(a7),a0
[0006e356] 4eb9 0005 789e            jsr        Awi_register
[0006e35c] 4240                      clr.w      d0
[0006e35e] 6006                      bra.s      FileOpen_2
[0006e360] 6004                      bra.s      FileOpen_2
FileOpen_1:
[0006e362] 70ff                      moveq.l    #-1,d0
[0006e364] 4e71                      nop
FileOpen_2:
[0006e366] 504f                      addq.w     #8,a7
[0006e368] 4e75                      rts

FileClosed:
[0006e36a] 4fef ffb8                 lea.l      -72(a7),a7
[0006e36e] 2f48 0044                 move.l     a0,68(a7)
[0006e372] 206f 0044                 movea.l    68(a7),a0
[0006e376] 2f50 0040                 move.l     (a0),64(a7)
[0006e37a] 41f9 000e 2894            lea.l      $000E2894,a0
[0006e380] 43d7                      lea.l      (a7),a1
[0006e382] 700f                      moveq.l    #15,d0
[0006e384] 22d8                      move.l     (a0)+,(a1)+
FileClosed_1:
[0006e386] 51c8 fffc                 dbf        d0,FileClosed_1
[0006e38a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e390] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e396] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e39c] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e3a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e3a8] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e3ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e3b4] 3028 02ce                 move.w     718(a0),d0
[0006e3b8] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e3be] 3f40 0008                 move.w     d0,8(a7)
[0006e3c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e3c8] 3028 02ce                 move.w     718(a0),d0
[0006e3cc] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e3d2] 3f40 000a                 move.w     d0,10(a7)
[0006e3d6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e3dc] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e3e2] 43d7                      lea.l      (a7),a1
[0006e3e4] 206f 0040                 movea.l    64(a7),a0
[0006e3e8] 6100 fb5e                 bsr        fslxMessage
[0006e3ec] 4fef 0048                 lea.l      72(a7),a7
[0006e3f0] 4e75                      rts

FileRedraw:
[0006e3f2] 4fef ffb4                 lea.l      -76(a7),a7
[0006e3f6] 2f48 0048                 move.l     a0,72(a7)
[0006e3fa] 2f49 0044                 move.l     a1,68(a7)
[0006e3fe] 206f 0048                 movea.l    72(a7),a0
[0006e402] 2f50 0040                 move.l     (a0),64(a7)
[0006e406] 41f9 000e 28d4            lea.l      $000E28D4,a0
[0006e40c] 43d7                      lea.l      (a7),a1
[0006e40e] 700f                      moveq.l    #15,d0
[0006e410] 22d8                      move.l     (a0)+,(a1)+
FileRedraw_1:
[0006e412] 51c8 fffc                 dbf        d0,FileRedraw_1
[0006e416] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e41c] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e422] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e428] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e42e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e434] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e43a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e440] 3028 02ce                 move.w     718(a0),d0
[0006e444] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e44a] 3f40 0008                 move.w     d0,8(a7)
[0006e44e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e454] 3028 02ce                 move.w     718(a0),d0
[0006e458] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e45e] 3f40 000a                 move.w     d0,10(a7)
[0006e462] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e468] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e46e] 206f 0044                 movea.l    68(a7),a0
[0006e472] 3f50 0028                 move.w     (a0),40(a7)
[0006e476] 206f 0044                 movea.l    68(a7),a0
[0006e47a] 3f68 0002 002a            move.w     2(a0),42(a7)
[0006e480] 206f 0044                 movea.l    68(a7),a0
[0006e484] 3f68 0004 002c            move.w     4(a0),44(a7)
[0006e48a] 206f 0044                 movea.l    68(a7),a0
[0006e48e] 3f68 0006 002e            move.w     6(a0),46(a7)
[0006e494] 43d7                      lea.l      (a7),a1
[0006e496] 206f 0040                 movea.l    64(a7),a0
[0006e49a] 6100 faac                 bsr        fslxMessage
[0006e49e] 4fef 004c                 lea.l      76(a7),a7
[0006e4a2] 4e75                      rts

FileArrowed:
[0006e4a4] 4fef ffb6                 lea.l      -74(a7),a7
[0006e4a8] 2f48 0046                 move.l     a0,70(a7)
[0006e4ac] 3f40 0044                 move.w     d0,68(a7)
[0006e4b0] 206f 0046                 movea.l    70(a7),a0
[0006e4b4] 2f50 0040                 move.l     (a0),64(a7)
[0006e4b8] 41f9 000e 2914            lea.l      $000E2914,a0
[0006e4be] 43d7                      lea.l      (a7),a1
[0006e4c0] 700f                      moveq.l    #15,d0
[0006e4c2] 22d8                      move.l     (a0)+,(a1)+
FileArrowed_1:
[0006e4c4] 51c8 fffc                 dbf        d0,FileArrowed_1
[0006e4c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e4ce] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e4d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e4da] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e4e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e4e6] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e4ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e4f2] 3028 02ce                 move.w     718(a0),d0
[0006e4f6] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e4fc] 3f40 0008                 move.w     d0,8(a7)
[0006e500] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e506] 3028 02ce                 move.w     718(a0),d0
[0006e50a] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e510] 3f40 000a                 move.w     d0,10(a7)
[0006e514] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e51a] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e520] 3f6f 0044 0028            move.w     68(a7),40(a7)
[0006e526] 43d7                      lea.l      (a7),a1
[0006e528] 206f 0040                 movea.l    64(a7),a0
[0006e52c] 6100 fa1a                 bsr        fslxMessage
[0006e530] 4fef 004a                 lea.l      74(a7),a7
[0006e534] 4e75                      rts

FileChange:
[0006e536] 2f0a                      move.l     a2,-(a7)
[0006e538] 594f                      subq.w     #4,a7
[0006e53a] 2e88                      move.l     a0,(a7)
[0006e53c] 2257                      movea.l    (a7),a1
[0006e53e] 43e9 0034                 lea.l      52(a1),a1
[0006e542] 2057                      movea.l    (a7),a0
[0006e544] 2457                      movea.l    (a7),a2
[0006e546] 246a 006a                 movea.l    106(a2),a2
[0006e54a] 4e92                      jsr        (a2)
[0006e54c] 584f                      addq.w     #4,a7
[0006e54e] 245f                      movea.l    (a7)+,a2
[0006e550] 4e75                      rts

FileFulled:
[0006e552] 4fef ffb8                 lea.l      -72(a7),a7
[0006e556] 2f48 0044                 move.l     a0,68(a7)
[0006e55a] 206f 0044                 movea.l    68(a7),a0
[0006e55e] 2f50 0040                 move.l     (a0),64(a7)
[0006e562] 41f9 000e 2954            lea.l      $000E2954,a0
[0006e568] 43d7                      lea.l      (a7),a1
[0006e56a] 700f                      moveq.l    #15,d0
[0006e56c] 22d8                      move.l     (a0)+,(a1)+
FileFulled_1:
[0006e56e] 51c8 fffc                 dbf        d0,FileFulled_1
[0006e572] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e578] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e57e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e584] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e58a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e590] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e596] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e59c] 3028 02ce                 move.w     718(a0),d0
[0006e5a0] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e5a6] 3f40 0008                 move.w     d0,8(a7)
[0006e5aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e5b0] 3028 02ce                 move.w     718(a0),d0
[0006e5b4] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e5ba] 3f40 000a                 move.w     d0,10(a7)
[0006e5be] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e5c4] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e5ca] 43d7                      lea.l      (a7),a1
[0006e5cc] 206f 0040                 movea.l    64(a7),a0
[0006e5d0] 6100 f976                 bsr        fslxMessage
[0006e5d4] 4fef 0048                 lea.l      72(a7),a7
[0006e5d8] 4e75                      rts

FileInit:
[0006e5da] 4240                      clr.w      d0
[0006e5dc] 4e75                      rts

FileHSlide:
[0006e5de] 4fef ffb6                 lea.l      -74(a7),a7
[0006e5e2] 2f48 0046                 move.l     a0,70(a7)
[0006e5e6] 3f40 0044                 move.w     d0,68(a7)
[0006e5ea] 206f 0046                 movea.l    70(a7),a0
[0006e5ee] 2f50 0040                 move.l     (a0),64(a7)
[0006e5f2] 41f9 000e 2994            lea.l      $000E2994,a0
[0006e5f8] 43d7                      lea.l      (a7),a1
[0006e5fa] 700f                      moveq.l    #15,d0
[0006e5fc] 22d8                      move.l     (a0)+,(a1)+
FileHSlide_1:
[0006e5fe] 51c8 fffc                 dbf        d0,FileHSlide_1
[0006e602] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e608] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e60e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e614] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e61a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e620] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e626] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e62c] 3028 02ce                 move.w     718(a0),d0
[0006e630] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e636] 3f40 0008                 move.w     d0,8(a7)
[0006e63a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e640] 3028 02ce                 move.w     718(a0),d0
[0006e644] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e64a] 3f40 000a                 move.w     d0,10(a7)
[0006e64e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e654] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e65a] 3f6f 0044 0028            move.w     68(a7),40(a7)
[0006e660] 43d7                      lea.l      (a7),a1
[0006e662] 206f 0040                 movea.l    64(a7),a0
[0006e666] 6100 f8e0                 bsr        fslxMessage
[0006e66a] 4fef 004a                 lea.l      74(a7),a7
[0006e66e] 4e75                      rts

FileVSlide:
[0006e670] 4fef ffb6                 lea.l      -74(a7),a7
[0006e674] 2f48 0046                 move.l     a0,70(a7)
[0006e678] 3f40 0044                 move.w     d0,68(a7)
[0006e67c] 206f 0046                 movea.l    70(a7),a0
[0006e680] 2f50 0040                 move.l     (a0),64(a7)
[0006e684] 41f9 000e 29d4            lea.l      $000E29D4,a0
[0006e68a] 43d7                      lea.l      (a7),a1
[0006e68c] 700f                      moveq.l    #15,d0
[0006e68e] 22d8                      move.l     (a0)+,(a1)+
FileVSlide_1:
[0006e690] 51c8 fffc                 dbf        d0,FileVSlide_1
[0006e694] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e69a] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e6a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e6a6] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e6ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e6b2] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e6b8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e6be] 3028 02ce                 move.w     718(a0),d0
[0006e6c2] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e6c8] 3f40 0008                 move.w     d0,8(a7)
[0006e6cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e6d2] 3028 02ce                 move.w     718(a0),d0
[0006e6d6] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e6dc] 3f40 000a                 move.w     d0,10(a7)
[0006e6e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e6e6] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e6ec] 3f6f 0044 0028            move.w     68(a7),40(a7)
[0006e6f2] 43d7                      lea.l      (a7),a1
[0006e6f4] 206f 0040                 movea.l    64(a7),a0
[0006e6f8] 6100 f84e                 bsr        fslxMessage
[0006e6fc] 4fef 004a                 lea.l      74(a7),a7
[0006e700] 4e75                      rts

FileKeys:
[0006e702] 4fef ffb6                 lea.l      -74(a7),a7
[0006e706] 2f48 0046                 move.l     a0,70(a7)
[0006e70a] 3f41 0044                 move.w     d1,68(a7)
[0006e70e] 206f 0046                 movea.l    70(a7),a0
[0006e712] 2f50 0040                 move.l     (a0),64(a7)
[0006e716] 41f9 000e 2a14            lea.l      $000E2A14,a0
[0006e71c] 43d7                      lea.l      (a7),a1
[0006e71e] 700f                      moveq.l    #15,d0
[0006e720] 22d8                      move.l     (a0)+,(a1)+
FileKeys_1:
[0006e722] 51c8 fffc                 dbf        d0,FileKeys_1
[0006e726] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e72c] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e732] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e738] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e73e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e744] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e74a] 302f 0044                 move.w     68(a7),d0
[0006e74e] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e754] 3f40 0008                 move.w     d0,8(a7)
[0006e758] 302f 0044                 move.w     68(a7),d0
[0006e75c] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e762] 3f40 000a                 move.w     d0,10(a7)
[0006e766] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e76c] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e772] 43d7                      lea.l      (a7),a1
[0006e774] 206f 0040                 movea.l    64(a7),a0
[0006e778] 6100 f7ce                 bsr        fslxMessage
[0006e77c] 4240                      clr.w      d0
[0006e77e] 4fef 004a                 lea.l      74(a7),a7
[0006e782] 4e75                      rts

FileTopped:
[0006e784] 4fef ffb8                 lea.l      -72(a7),a7
[0006e788] 2f48 0044                 move.l     a0,68(a7)
[0006e78c] 206f 0044                 movea.l    68(a7),a0
[0006e790] 2f50 0040                 move.l     (a0),64(a7)
[0006e794] 41f9 000e 2a54            lea.l      $000E2A54,a0
[0006e79a] 43d7                      lea.l      (a7),a1
[0006e79c] 700f                      moveq.l    #15,d0
[0006e79e] 22d8                      move.l     (a0)+,(a1)+
FileTopped_1:
[0006e7a0] 51c8 fffc                 dbf        d0,FileTopped_1
[0006e7a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e7aa] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e7b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e7b6] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e7bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e7c2] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e7c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e7ce] 3028 02ce                 move.w     718(a0),d0
[0006e7d2] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e7d8] 3f40 0008                 move.w     d0,8(a7)
[0006e7dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e7e2] 3028 02ce                 move.w     718(a0),d0
[0006e7e6] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e7ec] 3f40 000a                 move.w     d0,10(a7)
[0006e7f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e7f6] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e7fc] 43d7                      lea.l      (a7),a1
[0006e7fe] 206f 0040                 movea.l    64(a7),a0
[0006e802] 6100 f744                 bsr        fslxMessage
[0006e806] 4fef 0048                 lea.l      72(a7),a7
[0006e80a] 4e75                      rts

FileMoved:
[0006e80c] 4fef ffb4                 lea.l      -76(a7),a7
[0006e810] 2f48 0048                 move.l     a0,72(a7)
[0006e814] 2f49 0044                 move.l     a1,68(a7)
[0006e818] 206f 0048                 movea.l    72(a7),a0
[0006e81c] 2f50 0040                 move.l     (a0),64(a7)
[0006e820] 41f9 000e 2a94            lea.l      $000E2A94,a0
[0006e826] 43d7                      lea.l      (a7),a1
[0006e828] 700f                      moveq.l    #15,d0
[0006e82a] 22d8                      move.l     (a0)+,(a1)+
FileMoved_1:
[0006e82c] 51c8 fffc                 dbf        d0,FileMoved_1
[0006e830] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e836] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e83c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e842] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e848] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e84e] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e854] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e85a] 3028 02ce                 move.w     718(a0),d0
[0006e85e] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e864] 3f40 0008                 move.w     d0,8(a7)
[0006e868] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e86e] 3028 02ce                 move.w     718(a0),d0
[0006e872] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e878] 3f40 000a                 move.w     d0,10(a7)
[0006e87c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e882] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e888] 206f 0044                 movea.l    68(a7),a0
[0006e88c] 3f50 0028                 move.w     (a0),40(a7)
[0006e890] 206f 0044                 movea.l    68(a7),a0
[0006e894] 3f68 0002 002a            move.w     2(a0),42(a7)
[0006e89a] 206f 0044                 movea.l    68(a7),a0
[0006e89e] 3f68 0004 002c            move.w     4(a0),44(a7)
[0006e8a4] 206f 0044                 movea.l    68(a7),a0
[0006e8a8] 3f68 0006 002e            move.w     6(a0),46(a7)
[0006e8ae] 43d7                      lea.l      (a7),a1
[0006e8b0] 206f 0040                 movea.l    64(a7),a0
[0006e8b4] 6100 f692                 bsr        fslxMessage
[0006e8b8] 206f 0048                 movea.l    72(a7),a0
[0006e8bc] 4868 002a                 pea.l      42(a0)
[0006e8c0] 206f 004c                 movea.l    76(a7),a0
[0006e8c4] 4868 0028                 pea.l      40(a0)
[0006e8c8] 206f 0050                 movea.l    80(a7),a0
[0006e8cc] 4868 0026                 pea.l      38(a0)
[0006e8d0] 206f 0054                 movea.l    84(a7),a0
[0006e8d4] 4868 0024                 pea.l      36(a0)
[0006e8d8] 7205                      moveq.l    #5,d1
[0006e8da] 206f 0058                 movea.l    88(a7),a0
[0006e8de] 3028 0020                 move.w     32(a0),d0
[0006e8e2] 4eb9 0007 f7ba            jsr        wind_get
[0006e8e8] 4fef 0010                 lea.l      16(a7),a7
[0006e8ec] 206f 0048                 movea.l    72(a7),a0
[0006e8f0] 4868 003a                 pea.l      58(a0)
[0006e8f4] 206f 004c                 movea.l    76(a7),a0
[0006e8f8] 4868 0038                 pea.l      56(a0)
[0006e8fc] 206f 0050                 movea.l    80(a7),a0
[0006e900] 4868 0036                 pea.l      54(a0)
[0006e904] 206f 0054                 movea.l    84(a7),a0
[0006e908] 4868 0034                 pea.l      52(a0)
[0006e90c] 7204                      moveq.l    #4,d1
[0006e90e] 206f 0058                 movea.l    88(a7),a0
[0006e912] 3028 0020                 move.w     32(a0),d0
[0006e916] 4eb9 0007 f7ba            jsr        wind_get
[0006e91c] 4fef 0010                 lea.l      16(a7),a7
[0006e920] 206f 0048                 movea.l    72(a7),a0
[0006e924] 226f 0048                 movea.l    72(a7),a1
[0006e928] 2269 0014                 movea.l    20(a1),a1
[0006e92c] 3368 0038 0014            move.w     56(a0),20(a1)
[0006e932] 206f 0048                 movea.l    72(a7),a0
[0006e936] 226f 0048                 movea.l    72(a7),a1
[0006e93a] 2269 0014                 movea.l    20(a1),a1
[0006e93e] 3368 003a 0016            move.w     58(a0),22(a1)
[0006e944] 4fef 004c                 lea.l      76(a7),a7
[0006e948] 4e75                      rts

FileSized:
[0006e94a] 4fef ffb4                 lea.l      -76(a7),a7
[0006e94e] 2f48 0048                 move.l     a0,72(a7)
[0006e952] 2f49 0044                 move.l     a1,68(a7)
[0006e956] 206f 0048                 movea.l    72(a7),a0
[0006e95a] 2f50 0040                 move.l     (a0),64(a7)
[0006e95e] 41f9 000e 2ad4            lea.l      $000E2AD4,a0
[0006e964] 43d7                      lea.l      (a7),a1
[0006e966] 700f                      moveq.l    #15,d0
[0006e968] 22d8                      move.l     (a0)+,(a1)+
FileSized_1:
[0006e96a] 51c8 fffc                 dbf        d0,FileSized_1
[0006e96e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e974] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006e97a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e980] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006e986] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e98c] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006e992] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e998] 3028 02ce                 move.w     718(a0),d0
[0006e99c] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006e9a2] 3f40 0008                 move.w     d0,8(a7)
[0006e9a6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e9ac] 3028 02ce                 move.w     718(a0),d0
[0006e9b0] 4eb9 0004 4330            jsr        nkc_n2gem
[0006e9b6] 3f40 000a                 move.w     d0,10(a7)
[0006e9ba] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006e9c0] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006e9c6] 206f 0044                 movea.l    68(a7),a0
[0006e9ca] 3f50 0028                 move.w     (a0),40(a7)
[0006e9ce] 206f 0044                 movea.l    68(a7),a0
[0006e9d2] 3f68 0002 002a            move.w     2(a0),42(a7)
[0006e9d8] 206f 0044                 movea.l    68(a7),a0
[0006e9dc] 3f68 0004 002c            move.w     4(a0),44(a7)
[0006e9e2] 206f 0044                 movea.l    68(a7),a0
[0006e9e6] 3f68 0006 002e            move.w     6(a0),46(a7)
[0006e9ec] 43d7                      lea.l      (a7),a1
[0006e9ee] 206f 0040                 movea.l    64(a7),a0
[0006e9f2] 6100 f554                 bsr        fslxMessage
[0006e9f6] 206f 0048                 movea.l    72(a7),a0
[0006e9fa] 4868 002a                 pea.l      42(a0)
[0006e9fe] 206f 004c                 movea.l    76(a7),a0
[0006ea02] 4868 0028                 pea.l      40(a0)
[0006ea06] 206f 0050                 movea.l    80(a7),a0
[0006ea0a] 4868 0026                 pea.l      38(a0)
[0006ea0e] 206f 0054                 movea.l    84(a7),a0
[0006ea12] 4868 0024                 pea.l      36(a0)
[0006ea16] 7205                      moveq.l    #5,d1
[0006ea18] 206f 0058                 movea.l    88(a7),a0
[0006ea1c] 3028 0020                 move.w     32(a0),d0
[0006ea20] 4eb9 0007 f7ba            jsr        wind_get
[0006ea26] 4fef 0010                 lea.l      16(a7),a7
[0006ea2a] 206f 0048                 movea.l    72(a7),a0
[0006ea2e] 4868 003a                 pea.l      58(a0)
[0006ea32] 206f 004c                 movea.l    76(a7),a0
[0006ea36] 4868 0038                 pea.l      56(a0)
[0006ea3a] 206f 0050                 movea.l    80(a7),a0
[0006ea3e] 4868 0036                 pea.l      54(a0)
[0006ea42] 206f 0054                 movea.l    84(a7),a0
[0006ea46] 4868 0034                 pea.l      52(a0)
[0006ea4a] 7204                      moveq.l    #4,d1
[0006ea4c] 206f 0058                 movea.l    88(a7),a0
[0006ea50] 3028 0020                 move.w     32(a0),d0
[0006ea54] 4eb9 0007 f7ba            jsr        wind_get
[0006ea5a] 4fef 0010                 lea.l      16(a7),a7
[0006ea5e] 206f 0048                 movea.l    72(a7),a0
[0006ea62] 226f 0048                 movea.l    72(a7),a1
[0006ea66] 2269 0014                 movea.l    20(a1),a1
[0006ea6a] 3368 0038 0014            move.w     56(a0),20(a1)
[0006ea70] 206f 0048                 movea.l    72(a7),a0
[0006ea74] 226f 0048                 movea.l    72(a7),a1
[0006ea78] 2269 0014                 movea.l    20(a1),a1
[0006ea7c] 3368 003a 0016            move.w     58(a0),22(a1)
[0006ea82] 4fef 004c                 lea.l      76(a7),a7
[0006ea86] 4e75                      rts

FileIconify:
[0006ea88] 5d4f                      subq.w     #6,a7
[0006ea8a] 2f48 0002                 move.l     a0,2(a7)
[0006ea8e] 3e80                      move.w     d0,(a7)
[0006ea90] 3017                      move.w     (a7),d0
[0006ea92] 206f 0002                 movea.l    2(a7),a0
[0006ea96] 4eb9 0005 998a            jsr        Awi_iconify
[0006ea9c] 5c4f                      addq.w     #6,a7
[0006ea9e] 4e75                      rts

FileUniconify:
[0006eaa0] 594f                      subq.w     #4,a7
[0006eaa2] 2e88                      move.l     a0,(a7)
[0006eaa4] 2057                      movea.l    (a7),a0
[0006eaa6] 4eb9 0005 9c6c            jsr        Awi_uniconify
[0006eaac] 584f                      addq.w     #4,a7
[0006eaae] 4e75                      rts

FileGEMScript:
[0006eab0] 4fef fff6                 lea.l      -10(a7),a7
[0006eab4] 2f48 0006                 move.l     a0,6(a7)
[0006eab8] 3f40 0004                 move.w     d0,4(a7)
[0006eabc] 2e89                      move.l     a1,(a7)
[0006eabe] 2f2f 000e                 move.l     14(a7),-(a7)
[0006eac2] 226f 0004                 movea.l    4(a7),a1
[0006eac6] 302f 0008                 move.w     8(a7),d0
[0006eaca] 206f 000a                 movea.l    10(a7),a0
[0006eace] 4eb9 0005 b5b6            jsr        Awi_gemscript
[0006ead4] 584f                      addq.w     #4,a7
[0006ead6] 4fef 000a                 lea.l      10(a7),a7
[0006eada] 4e75                      rts

FileClicked:
[0006eadc] 4fef ffbc                 lea.l      -68(a7),a7
[0006eae0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006eae6] 2068 0258                 movea.l    600(a0),a0
[0006eaea] 2f50 0040                 move.l     (a0),64(a7)
[0006eaee] 41f9 000e 2b14            lea.l      $000E2B14,a0
[0006eaf4] 43d7                      lea.l      (a7),a1
[0006eaf6] 700f                      moveq.l    #15,d0
[0006eaf8] 22d8                      move.l     (a0)+,(a1)+
FileClicked_1:
[0006eafa] 51c8 fffc                 dbf        d0,FileClicked_1
[0006eafe] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006eb04] 3f68 0262 0002            move.w     610(a0),2(a7)
[0006eb0a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006eb10] 3f68 0264 0004            move.w     612(a0),4(a7)
[0006eb16] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006eb1c] 3f68 02ca 0006            move.w     714(a0),6(a7)
[0006eb22] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006eb28] 3028 02ce                 move.w     718(a0),d0
[0006eb2c] 4eb9 0004 435a            jsr        nkc_n2kstate
[0006eb32] 3f40 0008                 move.w     d0,8(a7)
[0006eb36] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006eb3c] 3028 02ce                 move.w     718(a0),d0
[0006eb40] 4eb9 0004 4330            jsr        nkc_n2gem
[0006eb46] 3f40 000a                 move.w     d0,10(a7)
[0006eb4a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006eb50] 3f68 02cc 000c            move.w     716(a0),12(a7)
[0006eb56] 43d7                      lea.l      (a7),a1
[0006eb58] 206f 0040                 movea.l    64(a7),a0
[0006eb5c] 6100 f3ea                 bsr        fslxMessage
[0006eb60] 4fef 0044                 lea.l      68(a7),a7
[0006eb64] 4e75                      rts

	.data

TEXT_01:
[000e2132]                           dc.w $0000
TEXT_04:
[000e2134]                           dc.b 'Selector',0
[000e213d]                           dc.b $00
DATAS_03:
[000e213e]                           dc.w $0000
[000e2140]                           dc.w $0000
[000e2142]                           dc.w $0488
[000e2144]                           dc.w $0fff
[000e2146]                           dc.w $ffff
[000e2148]                           dc.w $fff0
[000e214a]                           dc.w $0800
[000e214c]                           dc.w $0000
[000e214e]                           dc.w $0010
[000e2150]                           dc.w $0bff
[000e2152]                           dc.w $ffff
[000e2154]                           dc.w $ffd0
[000e2156]                           dc.w $0a00
[000e2158]                           dc.w $0000
[000e215a]                           dc.w $0050
[000e215c]                           dc.w $0aff
[000e215e]                           dc.w $ffff
[000e2160]                           dc.w $ff50
[000e2162]                           dc.w $0a00
[000e2164]                           dc.w $0000
[000e2166]                           dc.w $0050
[000e2168]                           dc.w $0bff
[000e216a]                           dc.w $ffff
[000e216c]                           dc.w $ffd0
[000e216e]                           dc.w $0a00
[000e2170]                           dc.w $0000
[000e2172]                           dc.w $0050
[000e2174]                           dc.w $0aff
[000e2176]                           dc.w $ffff
[000e2178]                           dc.w $ff50
[000e217a]                           dc.w $0aff
[000e217c]                           dc.w $ffff
[000e217e]                           dc.w $ff50
[000e2180]                           dc.w $0aff
[000e2182]                           dc.w $ffff
[000e2184]                           dc.w $ff50
[000e2186]                           dc.w $0aff
[000e2188]                           dc.w $ffff
[000e218a]                           dc.w $ff50
[000e218c]                           dc.w $0aff
[000e218e]                           dc.w $ffff
[000e2190]                           dc.w $ff50
[000e2192]                           dc.w $0aff
[000e2194]                           dc.w $ffff
[000e2196]                           dc.w $ff50
[000e2198]                           dc.w $0aff
[000e219a]                           dc.w $ffff
[000e219c]                           dc.w $ff50
[000e219e]                           dc.w $0aff
[000e21a0]                           dc.w $ffff
[000e21a2]                           dc.w $ff50
[000e21a4]                           dc.w $0a00
[000e21a6]                           dc.w $0000
[000e21a8]                           dc.w $0050
[000e21aa]                           dc.w $0bff
[000e21ac]                           dc.w $ffff
[000e21ae]                           dc.w $ffd0
[000e21b0]                           dc.w $0bff
[000e21b2]                           dc.w $fff0
[000e21b4]                           dc.w $2050
[000e21b6]                           dc.w $0bff
[000e21b8]                           dc.w $fff7
[000e21ba]                           dc.w $af50
[000e21bc]                           dc.w $0bff
[000e21be]                           dc.w $fff0
[000e21c0]                           dc.w $2050
[000e21c2]                           dc.w $0bff
[000e21c4]                           dc.w $ffff
[000e21c6]                           dc.w $ffd0
[000e21c8]                           dc.w $0800
[000e21ca]                           dc.w $0000
[000e21cc]                           dc.w $0010
[000e21ce]                           dc.w $0fff
[000e21d0]                           dc.w $ffff
[000e21d2]                           dc.w $fff0
[000e21d4]                           dc.w $0fff
[000e21d6]                           dc.w $ffff
[000e21d8]                           dc.w $fff0
[000e21da]                           dc.w $0800
[000e21dc]                           dc.w $0000
[000e21de]                           dc.w $0010
[000e21e0]                           dc.w $0bff
[000e21e2]                           dc.w $ffff
[000e21e4]                           dc.w $ffd0
[000e21e6]                           dc.w $0a00
[000e21e8]                           dc.w $0000
[000e21ea]                           dc.w $0050
[000e21ec]                           dc.w $0aff
[000e21ee]                           dc.w $ffff
[000e21f0]                           dc.w $ff50
[000e21f2]                           dc.w $0a00
[000e21f4]                           dc.w $0000
[000e21f6]                           dc.w $0050
[000e21f8]                           dc.w $0bff
[000e21fa]                           dc.w $ffff
[000e21fc]                           dc.w $ffd0
[000e21fe]                           dc.w $0a00
[000e2200]                           dc.w $0000
[000e2202]                           dc.w $0050
[000e2204]                           dc.w $0aff
[000e2206]                           dc.w $ffff
[000e2208]                           dc.w $ff50
[000e220a]                           dc.w $0aff
[000e220c]                           dc.w $ffff
[000e220e]                           dc.w $ff50
[000e2210]                           dc.w $0aff
[000e2212]                           dc.w $ffff
[000e2214]                           dc.w $ff50
[000e2216]                           dc.w $0aff
[000e2218]                           dc.w $ffff
[000e221a]                           dc.w $ff50
[000e221c]                           dc.w $0aff
[000e221e]                           dc.w $ffff
[000e2220]                           dc.w $ff50
[000e2222]                           dc.w $0aff
[000e2224]                           dc.w $ffff
[000e2226]                           dc.w $ff50
[000e2228]                           dc.w $0aff
[000e222a]                           dc.w $ffff
[000e222c]                           dc.w $ff50
[000e222e]                           dc.w $0aff
[000e2230]                           dc.w $ffff
[000e2232]                           dc.w $ff50
[000e2234]                           dc.w $0a00
[000e2236]                           dc.w $0000
[000e2238]                           dc.w $0050
[000e223a]                           dc.w $0bff
[000e223c]                           dc.w $ffff
[000e223e]                           dc.w $ffd0
[000e2240]                           dc.w $0bff
[000e2242]                           dc.w $fff0
[000e2244]                           dc.w $2050
[000e2246]                           dc.w $0bff
[000e2248]                           dc.w $fff7
[000e224a]                           dc.w $af50
[000e224c]                           dc.w $0bff
[000e224e]                           dc.w $fff0
[000e2250]                           dc.w $2050
[000e2252]                           dc.w $0bff
[000e2254]                           dc.w $ffff
[000e2256]                           dc.w $ffd0
[000e2258]                           dc.w $0800
[000e225a]                           dc.w $0000
[000e225c]                           dc.w $0010
[000e225e]                           dc.w $0fff
[000e2260]                           dc.w $ffff
[000e2262]                           dc.w $fff0
[000e2264]                           dc.w $0fff
[000e2266]                           dc.w $ffff
[000e2268]                           dc.w $fff0
[000e226a]                           dc.w $0800
[000e226c]                           dc.w $0000
[000e226e]                           dc.w $0010
[000e2270]                           dc.w $0bff
[000e2272]                           dc.w $ffff
[000e2274]                           dc.w $ffd0
[000e2276]                           dc.w $0a00
[000e2278]                           dc.w $0000
[000e227a]                           dc.w $0050
[000e227c]                           dc.w $0aff
[000e227e]                           dc.w $ffff
[000e2280]                           dc.w $ff50
[000e2282]                           dc.w $0a00
[000e2284]                           dc.w $0000
[000e2286]                           dc.w $0050
[000e2288]                           dc.w $0bff
[000e228a]                           dc.w $ffff
[000e228c]                           dc.w $ffd0
[000e228e]                           dc.w $0a00
[000e2290]                           dc.w $0000
[000e2292]                           dc.w $0050
[000e2294]                           dc.w $0aff
[000e2296]                           dc.w $ffff
[000e2298]                           dc.w $ff50
[000e229a]                           dc.w $0aff
[000e229c]                           dc.w $ffff
[000e229e]                           dc.w $ff50
[000e22a0]                           dc.w $0aff
[000e22a2]                           dc.w $ffff
[000e22a4]                           dc.w $ff50
[000e22a6]                           dc.w $0aff
[000e22a8]                           dc.w $ffff
[000e22aa]                           dc.w $ff50
[000e22ac]                           dc.w $0aff
[000e22ae]                           dc.w $ffff
[000e22b0]                           dc.w $ff50
[000e22b2]                           dc.w $0aff
[000e22b4]                           dc.w $ffff
[000e22b6]                           dc.w $ff50
[000e22b8]                           dc.w $0aff
[000e22ba]                           dc.w $ffff
[000e22bc]                           dc.w $ff50
[000e22be]                           dc.w $0aff
[000e22c0]                           dc.w $ffff
[000e22c2]                           dc.w $ff50
[000e22c4]                           dc.w $0a00
[000e22c6]                           dc.w $0000
[000e22c8]                           dc.w $0050
[000e22ca]                           dc.w $0bff
[000e22cc]                           dc.w $ffff
[000e22ce]                           dc.w $ffd0
[000e22d0]                           dc.w $0bff
[000e22d2]                           dc.w $fff0
[000e22d4]                           dc.w $2050
[000e22d6]                           dc.w $0bff
[000e22d8]                           dc.w $fff7
[000e22da]                           dc.w $af50
[000e22dc]                           dc.w $0bff
[000e22de]                           dc.w $fff0
[000e22e0]                           dc.w $2050
[000e22e2]                           dc.w $0bff
[000e22e4]                           dc.w $ffff
[000e22e6]                           dc.w $ffd0
[000e22e8]                           dc.w $0800
[000e22ea]                           dc.w $0000
[000e22ec]                           dc.w $0010
[000e22ee]                           dc.w $0fff
[000e22f0]                           dc.w $ffff
[000e22f2]                           dc.w $fff0
[000e22f4]                           dc.w $0fff
[000e22f6]                           dc.w $ffff
[000e22f8]                           dc.w $fff0
[000e22fa]                           dc.w $0800
[000e22fc]                           dc.w $0000
[000e22fe]                           dc.w $0010
[000e2300]                           dc.w $0800
[000e2302]                           dc.w $0000
[000e2304]                           dc.w $0030
[000e2306]                           dc.w $09ff
[000e2308]                           dc.w $ffff
[000e230a]                           dc.w $ffb0
[000e230c]                           dc.w $096d
[000e230e]                           dc.w $b000
[000e2310]                           dc.w $0030
[000e2312]                           dc.w $0900
[000e2314]                           dc.w $0000
[000e2316]                           dc.w $0030
[000e2318]                           dc.w $0800
[000e231a]                           dc.w $0000
[000e231c]                           dc.w $0030
[000e231e]                           dc.w $09ff
[000e2320]                           dc.w $ffff
[000e2322]                           dc.w $ffb0
[000e2324]                           dc.w $0900
[000e2326]                           dc.w $0000
[000e2328]                           dc.w $0030
[000e232a]                           dc.w $097f
[000e232c]                           dc.w $f9c6
[000e232e]                           dc.w $de30
[000e2330]                           dc.w $0900
[000e2332]                           dc.w $0000
[000e2334]                           dc.w $0030
[000e2336]                           dc.w $097f
[000e2338]                           dc.w $e1c6
[000e233a]                           dc.w $de30
[000e233c]                           dc.w $0900
[000e233e]                           dc.w $0000
[000e2340]                           dc.w $0030
[000e2342]                           dc.w $097f
[000e2344]                           dc.w $f186
[000e2346]                           dc.w $de30
[000e2348]                           dc.w $0900
[000e234a]                           dc.w $0000
[000e234c]                           dc.w $0030
[000e234e]                           dc.w $0900
[000e2350]                           dc.w $0000
[000e2352]                           dc.w $0030
[000e2354]                           dc.w $0900
[000e2356]                           dc.w $0000
[000e2358]                           dc.w $0030
[000e235a]                           dc.w $0800
[000e235c]                           dc.w $0000
[000e235e]                           dc.w $0030
[000e2360]                           dc.w $0800
[000e2362]                           dc.w $0000
[000e2364]                           dc.w $0030
[000e2366]                           dc.w $0800
[000e2368]                           dc.w $0003
[000e236a]                           dc.w $46b0
[000e236c]                           dc.w $0800
[000e236e]                           dc.w $0007
[000e2370]                           dc.w $cfb0
[000e2372]                           dc.w $0800
[000e2374]                           dc.w $0000
[000e2376]                           dc.w $0030
[000e2378]                           dc.w $0bff
[000e237a]                           dc.w $ffff
[000e237c]                           dc.w $fff0
[000e237e]                           dc.w $0fff
[000e2380]                           dc.w $ffff
[000e2382]                           dc.w $fff0
[000e2384]                           dc.w $0fff
[000e2386]                           dc.w $ffff
[000e2388]                           dc.w $fff0
[000e238a]                           dc.w $0800
[000e238c]                           dc.w $0000
[000e238e]                           dc.w $0010
[000e2390]                           dc.w $0800
[000e2392]                           dc.w $0000
[000e2394]                           dc.w $0010
[000e2396]                           dc.w $0800
[000e2398]                           dc.w $0000
[000e239a]                           dc.w $0010
[000e239c]                           dc.w $086d
[000e239e]                           dc.w $b000
[000e23a0]                           dc.w $0010
[000e23a2]                           dc.w $0800
[000e23a4]                           dc.w $0000
[000e23a6]                           dc.w $0010
[000e23a8]                           dc.w $0800
[000e23aa]                           dc.w $0000
[000e23ac]                           dc.w $0010
[000e23ae]                           dc.w $0800
[000e23b0]                           dc.w $0000
[000e23b2]                           dc.w $0010
[000e23b4]                           dc.w $0800
[000e23b6]                           dc.w $0000
[000e23b8]                           dc.w $0010
[000e23ba]                           dc.w $087f
[000e23bc]                           dc.w $f9c6
[000e23be]                           dc.w $de10
[000e23c0]                           dc.w $0800
[000e23c2]                           dc.w $0000
[000e23c4]                           dc.w $0010
[000e23c6]                           dc.w $087f
[000e23c8]                           dc.w $e1c6
[000e23ca]                           dc.w $de10
[000e23cc]                           dc.w $0800
[000e23ce]                           dc.w $0000
[000e23d0]                           dc.w $0010
[000e23d2]                           dc.w $087f
[000e23d4]                           dc.w $f186
[000e23d6]                           dc.w $de10
[000e23d8]                           dc.w $0800
[000e23da]                           dc.w $0000
[000e23dc]                           dc.w $0010
[000e23de]                           dc.w $0800
[000e23e0]                           dc.w $0000
[000e23e2]                           dc.w $0010
[000e23e4]                           dc.w $0800
[000e23e6]                           dc.w $0000
[000e23e8]                           dc.w $0010
[000e23ea]                           dc.w $0800
[000e23ec]                           dc.w $0000
[000e23ee]                           dc.w $0010
[000e23f0]                           dc.w $0800
[000e23f2]                           dc.w $0000
[000e23f4]                           dc.w $0010
[000e23f6]                           dc.w $0800
[000e23f8]                           dc.w $0003
[000e23fa]                           dc.w $0610
[000e23fc]                           dc.w $0800
[000e23fe]                           dc.w $0000
[000e2400]                           dc.w $0010
[000e2402]                           dc.w $0800
[000e2404]                           dc.w $0000
[000e2406]                           dc.w $0010
[000e2408]                           dc.w $0800
[000e240a]                           dc.w $0000
[000e240c]                           dc.w $0010
[000e240e]                           dc.w $0fff
[000e2410]                           dc.w $ffff
[000e2412]                           dc.w $fff0
[000e2414]                           dc.w $0fff
[000e2416]                           dc.w $ffff
[000e2418]                           dc.w $fff0
[000e241a]                           dc.w $0800
[000e241c]                           dc.w $0000
[000e241e]                           dc.w $0010
[000e2420]                           dc.w $0800
[000e2422]                           dc.w $0000
[000e2424]                           dc.w $0010
[000e2426]                           dc.w $0800
[000e2428]                           dc.w $0000
[000e242a]                           dc.w $0010
[000e242c]                           dc.w $086d
[000e242e]                           dc.w $b000
[000e2430]                           dc.w $0010
[000e2432]                           dc.w $0800
[000e2434]                           dc.w $0000
[000e2436]                           dc.w $0010
[000e2438]                           dc.w $0800
[000e243a]                           dc.w $0000
[000e243c]                           dc.w $0010
[000e243e]                           dc.w $0800
[000e2440]                           dc.w $0000
[000e2442]                           dc.w $0010
[000e2444]                           dc.w $0800
[000e2446]                           dc.w $0000
[000e2448]                           dc.w $0010
[000e244a]                           dc.w $087f
[000e244c]                           dc.w $f9c6
[000e244e]                           dc.w $de10
[000e2450]                           dc.w $0800
[000e2452]                           dc.w $0000
[000e2454]                           dc.w $0010
[000e2456]                           dc.w $087f
[000e2458]                           dc.w $e1c6
[000e245a]                           dc.w $de10
[000e245c]                           dc.w $0800
[000e245e]                           dc.w $0000
[000e2460]                           dc.w $0010
[000e2462]                           dc.w $087f
[000e2464]                           dc.w $f186
[000e2466]                           dc.w $de10
[000e2468]                           dc.w $0800
[000e246a]                           dc.w $0000
[000e246c]                           dc.w $0010
[000e246e]                           dc.w $0800
[000e2470]                           dc.w $0000
[000e2472]                           dc.w $0010
[000e2474]                           dc.w $0800
[000e2476]                           dc.w $0000
[000e2478]                           dc.w $0010
[000e247a]                           dc.w $0800
[000e247c]                           dc.w $0000
[000e247e]                           dc.w $0010
[000e2480]                           dc.w $0800
[000e2482]                           dc.w $0000
[000e2484]                           dc.w $0010
[000e2486]                           dc.w $0800
[000e2488]                           dc.w $0003
[000e248a]                           dc.w $0610
[000e248c]                           dc.w $0800
[000e248e]                           dc.w $0000
[000e2490]                           dc.w $0010
[000e2492]                           dc.w $0800
[000e2494]                           dc.w $0000
[000e2496]                           dc.w $0010
[000e2498]                           dc.w $0800
[000e249a]                           dc.w $0000
[000e249c]                           dc.w $0010
[000e249e]                           dc.w $0fff
[000e24a0]                           dc.w $ffff
[000e24a2]                           dc.w $fff0
[000e24a4]                           dc.w $0fff
[000e24a6]                           dc.w $ffff
[000e24a8]                           dc.w $fff0
[000e24aa]                           dc.w $0800
[000e24ac]                           dc.w $0000
[000e24ae]                           dc.w $0010
[000e24b0]                           dc.w $0800
[000e24b2]                           dc.w $0000
[000e24b4]                           dc.w $0010
[000e24b6]                           dc.w $0800
[000e24b8]                           dc.w $0000
[000e24ba]                           dc.w $0010
[000e24bc]                           dc.w $086d
[000e24be]                           dc.w $b000
[000e24c0]                           dc.w $0010
[000e24c2]                           dc.w $0800
[000e24c4]                           dc.w $0000
[000e24c6]                           dc.w $0010
[000e24c8]                           dc.w $0800
[000e24ca]                           dc.w $0000
[000e24cc]                           dc.w $0010
[000e24ce]                           dc.w $0800
[000e24d0]                           dc.w $0000
[000e24d2]                           dc.w $0010
[000e24d4]                           dc.w $0800
[000e24d6]                           dc.w $0000
[000e24d8]                           dc.w $0010
[000e24da]                           dc.w $087f
[000e24dc]                           dc.w $f9c6
[000e24de]                           dc.w $de10
[000e24e0]                           dc.w $0800
[000e24e2]                           dc.w $0000
[000e24e4]                           dc.w $0010
[000e24e6]                           dc.w $087f
[000e24e8]                           dc.w $e1c6
[000e24ea]                           dc.w $de10
[000e24ec]                           dc.w $0800
[000e24ee]                           dc.w $0000
[000e24f0]                           dc.w $0010
[000e24f2]                           dc.w $087f
[000e24f4]                           dc.w $f186
[000e24f6]                           dc.w $de10
[000e24f8]                           dc.w $0800
[000e24fa]                           dc.w $0000
[000e24fc]                           dc.w $0010
[000e24fe]                           dc.w $0800
[000e2500]                           dc.w $0000
[000e2502]                           dc.w $0010
[000e2504]                           dc.w $0800
[000e2506]                           dc.w $0000
[000e2508]                           dc.w $0010
[000e250a]                           dc.w $0800
[000e250c]                           dc.w $0000
[000e250e]                           dc.w $0010
[000e2510]                           dc.w $0800
[000e2512]                           dc.w $0000
[000e2514]                           dc.w $0010
[000e2516]                           dc.w $0800
[000e2518]                           dc.w $0003
[000e251a]                           dc.w $0610
[000e251c]                           dc.w $0800
[000e251e]                           dc.w $0000
[000e2520]                           dc.w $0010
[000e2522]                           dc.w $0800
[000e2524]                           dc.w $0000
[000e2526]                           dc.w $0010
[000e2528]                           dc.w $0800
[000e252a]                           dc.w $0000
[000e252c]                           dc.w $0010
[000e252e]                           dc.w $0fff
[000e2530]                           dc.w $ffff
[000e2532]                           dc.w $fff0
[000e2534]                           dc.w $0fff
[000e2536]                           dc.w $ffff
[000e2538]                           dc.w $fff0
[000e253a]                           dc.w $0800
[000e253c]                           dc.w $0000
[000e253e]                           dc.w $0010
[000e2540]                           dc.w $0800
[000e2542]                           dc.w $0000
[000e2544]                           dc.w $0010
[000e2546]                           dc.w $0800
[000e2548]                           dc.w $0000
[000e254a]                           dc.w $0010
[000e254c]                           dc.w $086d
[000e254e]                           dc.w $b000
[000e2550]                           dc.w $0010
[000e2552]                           dc.w $0800
[000e2554]                           dc.w $0000
[000e2556]                           dc.w $0010
[000e2558]                           dc.w $0800
[000e255a]                           dc.w $0000
[000e255c]                           dc.w $0010
[000e255e]                           dc.w $0800
[000e2560]                           dc.w $0000
[000e2562]                           dc.w $0010
[000e2564]                           dc.w $0800
[000e2566]                           dc.w $0000
[000e2568]                           dc.w $0010
[000e256a]                           dc.w $087f
[000e256c]                           dc.w $f9c6
[000e256e]                           dc.w $de10
[000e2570]                           dc.w $0800
[000e2572]                           dc.w $0000
[000e2574]                           dc.w $0010
[000e2576]                           dc.w $087f
[000e2578]                           dc.w $e1c6
[000e257a]                           dc.w $de10
[000e257c]                           dc.w $0800
[000e257e]                           dc.w $0000
[000e2580]                           dc.w $0010
[000e2582]                           dc.w $087f
[000e2584]                           dc.w $f186
[000e2586]                           dc.w $de10
[000e2588]                           dc.w $0800
[000e258a]                           dc.w $0000
[000e258c]                           dc.w $0010
[000e258e]                           dc.w $0800
[000e2590]                           dc.w $0000
[000e2592]                           dc.w $0010
[000e2594]                           dc.w $0800
[000e2596]                           dc.w $0000
[000e2598]                           dc.w $0010
[000e259a]                           dc.w $0800
[000e259c]                           dc.w $0000
[000e259e]                           dc.w $0010
[000e25a0]                           dc.w $0800
[000e25a2]                           dc.w $0000
[000e25a4]                           dc.w $0010
[000e25a6]                           dc.w $0800
[000e25a8]                           dc.w $0003
[000e25aa]                           dc.w $0610
[000e25ac]                           dc.w $0800
[000e25ae]                           dc.w $0000
[000e25b0]                           dc.w $0010
[000e25b2]                           dc.w $0800
[000e25b4]                           dc.w $0000
[000e25b6]                           dc.w $0010
[000e25b8]                           dc.w $0800
[000e25ba]                           dc.w $0000
[000e25bc]                           dc.w $0010
[000e25be]                           dc.w $0fff
[000e25c0]                           dc.w $ffff
[000e25c2]                           dc.w $fff0
DATAS_04:
[000e25c4]                           dc.w $0fff
[000e25c6]                           dc.w $ffff
[000e25c8]                           dc.w $fff0
[000e25ca]                           dc.w $0fff
[000e25cc]                           dc.w $ffff
[000e25ce]                           dc.w $fff0
[000e25d0]                           dc.w $0fff
[000e25d2]                           dc.w $ffff
[000e25d4]                           dc.w $fff0
[000e25d6]                           dc.w $0fff
[000e25d8]                           dc.w $ffff
[000e25da]                           dc.w $fff0
[000e25dc]                           dc.w $0fff
[000e25de]                           dc.w $ffff
[000e25e0]                           dc.w $fff0
[000e25e2]                           dc.w $0fff
[000e25e4]                           dc.w $ffff
[000e25e6]                           dc.w $fff0
[000e25e8]                           dc.w $0fff
[000e25ea]                           dc.w $ffff
[000e25ec]                           dc.w $fff0
[000e25ee]                           dc.w $0fff
[000e25f0]                           dc.w $ffff
[000e25f2]                           dc.w $fff0
[000e25f4]                           dc.w $0fff
[000e25f6]                           dc.w $ffff
[000e25f8]                           dc.w $fff0
[000e25fa]                           dc.w $0fff
[000e25fc]                           dc.w $ffff
[000e25fe]                           dc.w $fff0
[000e2600]                           dc.w $0fff
[000e2602]                           dc.w $ffff
[000e2604]                           dc.w $fff0
[000e2606]                           dc.w $0fff
[000e2608]                           dc.w $ffff
[000e260a]                           dc.w $fff0
[000e260c]                           dc.w $0fff
[000e260e]                           dc.w $ffff
[000e2610]                           dc.w $fff0
[000e2612]                           dc.w $0fff
[000e2614]                           dc.w $ffff
[000e2616]                           dc.w $fff0
[000e2618]                           dc.w $0fff
[000e261a]                           dc.w $ffff
[000e261c]                           dc.w $fff0
[000e261e]                           dc.w $0fff
[000e2620]                           dc.w $ffff
[000e2622]                           dc.w $fff0
[000e2624]                           dc.w $0fff
[000e2626]                           dc.w $ffff
[000e2628]                           dc.w $fff0
[000e262a]                           dc.w $0fff
[000e262c]                           dc.w $ffff
[000e262e]                           dc.w $fff0
[000e2630]                           dc.w $0fff
[000e2632]                           dc.w $ffff
[000e2634]                           dc.w $fff0
[000e2636]                           dc.w $0fff
[000e2638]                           dc.w $ffff
[000e263a]                           dc.w $fff0
[000e263c]                           dc.w $0fff
[000e263e]                           dc.w $ffff
[000e2640]                           dc.w $fff0
[000e2642]                           dc.w $0fff
[000e2644]                           dc.w $ffff
[000e2646]                           dc.w $fff0
[000e2648]                           dc.w $0fff
[000e264a]                           dc.w $ffff
[000e264c]                           dc.w $fff0
[000e264e]                           dc.w $0fff
[000e2650]                           dc.w $ffff
[000e2652]                           dc.w $fff0
_C8_IC_FILESEL:
[000e2654]                           dc.w $0008
[000e2656] 000e2144                  dc.l $000e2144
[000e265a] 000e25c4                  dc.l DATAS_04
[000e265e]                           dc.w $0000
[000e2660]                           dc.w $0000
[000e2662]                           dc.w $0000
[000e2664]                           dc.w $0000
[000e2666]                           dc.w $0000
[000e2668]                           dc.w $0000
_MSK_IC_FILESEL:
[000e266a]                           dc.w $0fff
[000e266c]                           dc.w $ffff
[000e266e]                           dc.w $ffe0
[000e2670]                           dc.w $0fff
[000e2672]                           dc.w $ffff
[000e2674]                           dc.w $fff0
[000e2676]                           dc.w $0fff
[000e2678]                           dc.w $ffff
[000e267a]                           dc.w $fff0
[000e267c]                           dc.w $0fff
[000e267e]                           dc.w $ffff
[000e2680]                           dc.w $fff0
[000e2682]                           dc.w $0fff
[000e2684]                           dc.w $ffff
[000e2686]                           dc.w $fff0
[000e2688]                           dc.w $0fff
[000e268a]                           dc.w $ffff
[000e268c]                           dc.w $fff0
[000e268e]                           dc.w $0fff
[000e2690]                           dc.w $ffff
[000e2692]                           dc.w $fff0
[000e2694]                           dc.w $0fff
[000e2696]                           dc.w $ffff
[000e2698]                           dc.w $fff0
[000e269a]                           dc.w $0fff
[000e269c]                           dc.w $ffff
[000e269e]                           dc.w $fff0
[000e26a0]                           dc.w $0fff
[000e26a2]                           dc.w $ffff
[000e26a4]                           dc.w $fff0
[000e26a6]                           dc.w $0fff
[000e26a8]                           dc.w $ffff
[000e26aa]                           dc.w $fff0
[000e26ac]                           dc.w $0fff
[000e26ae]                           dc.w $ffff
[000e26b0]                           dc.w $fff0
[000e26b2]                           dc.w $0fff
[000e26b4]                           dc.w $ffff
[000e26b6]                           dc.w $fff0
[000e26b8]                           dc.w $0fff
[000e26ba]                           dc.w $ffff
[000e26bc]                           dc.w $fff0
[000e26be]                           dc.w $0fff
[000e26c0]                           dc.w $ffff
[000e26c2]                           dc.w $fff0
[000e26c4]                           dc.w $0fff
[000e26c6]                           dc.w $ffff
[000e26c8]                           dc.w $fff0
[000e26ca]                           dc.w $0fff
[000e26cc]                           dc.w $ffff
[000e26ce]                           dc.w $fff0
[000e26d0]                           dc.w $0fff
[000e26d2]                           dc.w $ffff
[000e26d4]                           dc.w $fff0
[000e26d6]                           dc.w $0fff
[000e26d8]                           dc.w $ffff
[000e26da]                           dc.w $fff0
[000e26dc]                           dc.w $0fff
[000e26de]                           dc.w $ffff
[000e26e0]                           dc.w $fff0
[000e26e2]                           dc.w $0fff
[000e26e4]                           dc.w $ffff
[000e26e6]                           dc.w $fff0
[000e26e8]                           dc.w $0fff
[000e26ea]                           dc.w $ffff
[000e26ec]                           dc.w $fff0
[000e26ee]                           dc.w $0fff
[000e26f0]                           dc.w $ffff
[000e26f2]                           dc.w $fff0
[000e26f4]                           dc.w $07ff
[000e26f6]                           dc.w $ffff
[000e26f8]                           dc.w $fff0
_DAT_IC_FILESEL:
[000e26fa]                           dc.w $0fff
[000e26fc]                           dc.w $ffff
[000e26fe]                           dc.w $ffe0
[000e2700]                           dc.w $0800
[000e2702]                           dc.w $0000
[000e2704]                           dc.w $0030
[000e2706]                           dc.w $0bff
[000e2708]                           dc.w $ffff
[000e270a]                           dc.w $ffb0
[000e270c]                           dc.w $0adb
[000e270e]                           dc.w $0000
[000e2710]                           dc.w $00b0
[000e2712]                           dc.w $0bff
[000e2714]                           dc.w $ffff
[000e2716]                           dc.w $ffb0
[000e2718]                           dc.w $0800
[000e271a]                           dc.w $0000
[000e271c]                           dc.w $0030
[000e271e]                           dc.w $0bff
[000e2720]                           dc.w $ffff
[000e2722]                           dc.w $ffb0
[000e2724]                           dc.w $0a00
[000e2726]                           dc.w $0000
[000e2728]                           dc.w $00b0
[000e272a]                           dc.w $0aff
[000e272c]                           dc.w $f386
[000e272e]                           dc.w $deb0
[000e2730]                           dc.w $0a00
[000e2732]                           dc.w $0000
[000e2734]                           dc.w $00b0
[000e2736]                           dc.w $0aff
[000e2738]                           dc.w $c386
[000e273a]                           dc.w $deb0
[000e273c]                           dc.w $0a00
[000e273e]                           dc.w $0000
[000e2740]                           dc.w $00b0
[000e2742]                           dc.w $0aff
[000e2744]                           dc.w $e306
[000e2746]                           dc.w $deb0
[000e2748]                           dc.w $0a00
[000e274a]                           dc.w $0000
[000e274c]                           dc.w $00b0
[000e274e]                           dc.w $0af7
[000e2750]                           dc.w $8386
[000e2752]                           dc.w $deb0
[000e2754]                           dc.w $0a00
[000e2756]                           dc.w $0000
[000e2758]                           dc.w $00b0
[000e275a]                           dc.w $0bff
[000e275c]                           dc.w $ffff
[000e275e]                           dc.w $ffb0
[000e2760]                           dc.w $0800
[000e2762]                           dc.w $0000
[000e2764]                           dc.w $0030
[000e2766]                           dc.w $0800
[000e2768]                           dc.w $000f
[000e276a]                           dc.w $dfb0
[000e276c]                           dc.w $0800
[000e276e]                           dc.w $000b
[000e2770]                           dc.w $56b0
[000e2772]                           dc.w $0800
[000e2774]                           dc.w $000f
[000e2776]                           dc.w $dfb0
[000e2778]                           dc.w $0800
[000e277a]                           dc.w $0000
[000e277c]                           dc.w $0030
[000e277e]                           dc.w $0fff
[000e2780]                           dc.w $ffff
[000e2782]                           dc.w $fff0
[000e2784]                           dc.w $07ff
[000e2786]                           dc.w $ffff
[000e2788]                           dc.w $fff0
IC_FILESEL:
[000e278a] 000e266a                  dc.l _MSK_IC_FILESEL
[000e278e] 000e26fa                  dc.l _DAT_IC_FILESEL
[000e2792] 000e2134                  dc.l TEXT_04
[000e2796]                           dc.w $1000
[000e2798]                           dc.w $0000
[000e279a]                           dc.w $0000
[000e279c]                           dc.w $0000
[000e279e]                           dc.w $0000
[000e27a0]                           dc.w $0030
[000e27a2]                           dc.w $0018
[000e27a4]                           dc.w $0000
[000e27a6]                           dc.w $0018
[000e27a8]                           dc.w $0030
[000e27aa]                           dc.w $0008
[000e27ac] 000e2654                  dc.l _C8_IC_FILESEL
OB_FILESEL:
[000e27b0]                           dc.w $ffff
[000e27b2]                           dc.w $ffff
[000e27b4]                           dc.w $ffff
[000e27b6]                           dc.w $0014
[000e27b8]                           dc.w $0040
[000e27ba]                           dc.w $0000
[000e27bc]                           dc.w $0002
[000e27be]                           dc.w $1100
[000e27c0]                           dc.w $0000
[000e27c2]                           dc.w $0000
[000e27c4]                           dc.w $0028
[000e27c6]                           dc.w $0017
_00aOB_FILESEL:
[000e27c8] 0006eadc                  dc.l FileClicked
[000e27cc]                           dc.w $0000
[000e27ce]                           dc.w $0000
[000e27d0]                           dc.w $8020
[000e27d2]                           dc.w $0000
[000e27d4]                           dc.w $0000
[000e27d6]                           dc.w $0000
[000e27d8]                           dc.w $0000
[000e27da]                           dc.w $0000
[000e27dc]                           dc.w $0000
[000e27de]                           dc.w $0000
WI_FILESEL:
[000e27e0]                           dc.w $0000
[000e27e2]                           dc.w $0000
[000e27e4] 0006e1f4                  dc.l FileService
[000e27e8] 0006dfe0                  dc.l FileCreate
[000e27ec] 0006e296                  dc.l FileOpen
[000e27f0] 0006e5da                  dc.l FileInit
[000e27f4] 000e27b0                  dc.l OB_FILESEL
[000e27f8]                           dc.w $0000
[000e27fa]                           dc.w $0000
[000e27fc]                           dc.w $0000
[000e27fe]                           dc.w $0000
[000e2800]                           dc.w $ffff
[000e2802]                           dc.w $2009
[000e2804]                           dc.w $0000
[000e2806]                           dc.w $0000
[000e2808]                           dc.w $0078
[000e280a]                           dc.w $0032
[000e280c]                           dc.w $0000
[000e280e]                           dc.w $0000
[000e2810]                           dc.w $0000
[000e2812]                           dc.w $0000
[000e2814]                           dc.w $0000
[000e2816]                           dc.w $0000
[000e2818]                           dc.w $0000
[000e281a]                           dc.w $0000
[000e281c]                           dc.w $ffff
[000e281e]                           dc.w $ffff
[000e2820]                           dc.w $ffff
[000e2822]                           dc.w $ffff
[000e2824]                           dc.w $0000
[000e2826]                           dc.w $0000
[000e2828]                           dc.w $f8f8
[000e282a] 000e2132                  dc.l TEXT_01
[000e282e] 000e2133                  dc.l TEXT_02
[000e2832]                           dc.w $0000
[000e2834]                           dc.w $0000
[000e2836]                           dc.w $0000
[000e2838]                           dc.w $ffff
[000e283a] 000e278a                  dc.l IC_FILESEL
[000e283e]                           dc.w $0000
[000e2840]                           dc.w $0000
[000e2842] 0006e702                  dc.l FileKeys
[000e2846] 0006e536                  dc.l FileChange
[000e284a] 0006e3f2                  dc.l FileRedraw
[000e284e] 0006e784                  dc.l FileTopped
[000e2852] 0006e36a                  dc.l FileClosed
[000e2856] 0006e552                  dc.l FileFulled
[000e285a] 0006e4a4                  dc.l FileArrowed
[000e285e] 0006e5de                  dc.l FileHSlide
[000e2862] 0006e670                  dc.l FileVSlide
[000e2866] 0006e94a                  dc.l FileSized
[000e286a] 0006e80c                  dc.l FileMoved
[000e286e] 0006ea88                  dc.l FileIconify
[000e2872] 0006eaa0                  dc.l FileUniconify
[000e2876] 0006eab0                  dc.l FileGEMScript
[000e287a]                           dc.w $0000
[000e287c]                           dc.w $0000
[000e287e]                           dc.w $0000
[000e2880]                           dc.w $0000
multi_cook:
[000e2882]                           dc.w $0000
[000e2884]                           dc.w $0000
multi_files:
[000e2886]                           dc.w $0000
[000e2888]                           dc.w $0000
multi_count:
[000e288a]                           dc.w $0000
multi_idx:
[000e288c]                           dc.w $0000
bkhndler:
[000e288e]                           dc.w $0000
[000e2890]                           dc.w $0000
vorhanden:
[000e2892]                           dc.w $ffff
[000e2894]                           dc.w $0010
[000e2896]                           dc.w $0000
[000e2898]                           dc.w $0000
[000e289a]                           dc.w $0000
[000e289c]                           dc.w $0000
[000e289e]                           dc.w $0000
[000e28a0]                           dc.w $0000
[000e28a2]                           dc.w $0000
[000e28a4]                           dc.w $0000
[000e28a6]                           dc.w $0000
[000e28a8]                           dc.w $0000
[000e28aa]                           dc.w $0000
[000e28ac]                           dc.w $0000
[000e28ae]                           dc.w $0000
[000e28b0]                           dc.w $0000
[000e28b2]                           dc.w $0000
[000e28b4]                           dc.w $0016
[000e28b6]                           dc.w $0001
[000e28b8]                           dc.w $0000
[000e28ba]                           dc.w $0000
[000e28bc]                           dc.w $0000
[000e28be]                           dc.w $0000
[000e28c0]                           dc.w $0000
[000e28c2]                           dc.w $0000
[000e28c4]                           dc.w $0000
[000e28c6]                           dc.w $0000
[000e28c8]                           dc.w $0000
[000e28ca]                           dc.w $0000
[000e28cc]                           dc.w $0000
[000e28ce]                           dc.w $0000
[000e28d0]                           dc.w $0000
[000e28d2]                           dc.w $0000
[000e28d4]                           dc.w $0010
[000e28d6]                           dc.w $0000
[000e28d8]                           dc.w $0000
[000e28da]                           dc.w $0000
[000e28dc]                           dc.w $0000
[000e28de]                           dc.w $0000
[000e28e0]                           dc.w $0000
[000e28e2]                           dc.w $0000
[000e28e4]                           dc.w $0000
[000e28e6]                           dc.w $0000
[000e28e8]                           dc.w $0000
[000e28ea]                           dc.w $0000
[000e28ec]                           dc.w $0000
[000e28ee]                           dc.w $0000
[000e28f0]                           dc.w $0000
[000e28f2]                           dc.w $0000
[000e28f4]                           dc.w $0014
[000e28f6]                           dc.w $0001
[000e28f8]                           dc.w $0000
[000e28fa]                           dc.w $0000
[000e28fc]                           dc.w $0000
[000e28fe]                           dc.w $0000
[000e2900]                           dc.w $0000
[000e2902]                           dc.w $0000
[000e2904]                           dc.w $0000
[000e2906]                           dc.w $0000
[000e2908]                           dc.w $0000
[000e290a]                           dc.w $0000
[000e290c]                           dc.w $0000
[000e290e]                           dc.w $0000
[000e2910]                           dc.w $0000
[000e2912]                           dc.w $0000
[000e2914]                           dc.w $0010
[000e2916]                           dc.w $0000
[000e2918]                           dc.w $0000
[000e291a]                           dc.w $0000
[000e291c]                           dc.w $0000
[000e291e]                           dc.w $0000
[000e2920]                           dc.w $0000
[000e2922]                           dc.w $0000
[000e2924]                           dc.w $0000
[000e2926]                           dc.w $0000
[000e2928]                           dc.w $0000
[000e292a]                           dc.w $0000
[000e292c]                           dc.w $0000
[000e292e]                           dc.w $0000
[000e2930]                           dc.w $0000
[000e2932]                           dc.w $0000
[000e2934]                           dc.w $0018
[000e2936]                           dc.w $0001
[000e2938]                           dc.w $0000
[000e293a]                           dc.w $0000
[000e293c]                           dc.w $0000
[000e293e]                           dc.w $0000
[000e2940]                           dc.w $0000
[000e2942]                           dc.w $0000
[000e2944]                           dc.w $0000
[000e2946]                           dc.w $0000
[000e2948]                           dc.w $0000
[000e294a]                           dc.w $0000
[000e294c]                           dc.w $0000
[000e294e]                           dc.w $0000
[000e2950]                           dc.w $0000
[000e2952]                           dc.w $0000
[000e2954]                           dc.w $0010
[000e2956]                           dc.w $0000
[000e2958]                           dc.w $0000
[000e295a]                           dc.w $0000
[000e295c]                           dc.w $0000
[000e295e]                           dc.w $0000
[000e2960]                           dc.w $0000
[000e2962]                           dc.w $0000
[000e2964]                           dc.w $0000
[000e2966]                           dc.w $0000
[000e2968]                           dc.w $0000
[000e296a]                           dc.w $0000
[000e296c]                           dc.w $0000
[000e296e]                           dc.w $0000
[000e2970]                           dc.w $0000
[000e2972]                           dc.w $0000
[000e2974]                           dc.w $0017
[000e2976]                           dc.w $0001
[000e2978]                           dc.w $0000
[000e297a]                           dc.w $0000
[000e297c]                           dc.w $0000
[000e297e]                           dc.w $0000
[000e2980]                           dc.w $0000
[000e2982]                           dc.w $0000
[000e2984]                           dc.w $0000
[000e2986]                           dc.w $0000
[000e2988]                           dc.w $0000
[000e298a]                           dc.w $0000
[000e298c]                           dc.w $0000
[000e298e]                           dc.w $0000
[000e2990]                           dc.w $0000
[000e2992]                           dc.w $0000
[000e2994]                           dc.w $0010
[000e2996]                           dc.w $0000
[000e2998]                           dc.w $0000
[000e299a]                           dc.w $0000
[000e299c]                           dc.w $0000
[000e299e]                           dc.w $0000
[000e29a0]                           dc.w $0000
[000e29a2]                           dc.w $0000
[000e29a4]                           dc.w $0000
[000e29a6]                           dc.w $0000
[000e29a8]                           dc.w $0000
[000e29aa]                           dc.w $0000
[000e29ac]                           dc.w $0000
[000e29ae]                           dc.w $0000
[000e29b0]                           dc.w $0000
[000e29b2]                           dc.w $0000
[000e29b4]                           dc.w $0019
[000e29b6]                           dc.w $0001
[000e29b8]                           dc.w $0000
[000e29ba]                           dc.w $0000
[000e29bc]                           dc.w $0000
[000e29be]                           dc.w $0000
[000e29c0]                           dc.w $0000
[000e29c2]                           dc.w $0000
[000e29c4]                           dc.w $0000
[000e29c6]                           dc.w $0000
[000e29c8]                           dc.w $0000
[000e29ca]                           dc.w $0000
[000e29cc]                           dc.w $0000
[000e29ce]                           dc.w $0000
[000e29d0]                           dc.w $0000
[000e29d2]                           dc.w $0000
[000e29d4]                           dc.w $0010
[000e29d6]                           dc.w $0000
[000e29d8]                           dc.w $0000
[000e29da]                           dc.w $0000
[000e29dc]                           dc.w $0000
[000e29de]                           dc.w $0000
[000e29e0]                           dc.w $0000
[000e29e2]                           dc.w $0000
[000e29e4]                           dc.w $0000
[000e29e6]                           dc.w $0000
[000e29e8]                           dc.w $0000
[000e29ea]                           dc.w $0000
[000e29ec]                           dc.w $0000
[000e29ee]                           dc.w $0000
[000e29f0]                           dc.w $0000
[000e29f2]                           dc.w $0000
[000e29f4]                           dc.w $001a
[000e29f6]                           dc.w $0001
[000e29f8]                           dc.w $0000
[000e29fa]                           dc.w $0000
[000e29fc]                           dc.w $0000
[000e29fe]                           dc.w $0000
[000e2a00]                           dc.w $0000
[000e2a02]                           dc.w $0000
[000e2a04]                           dc.w $0000
[000e2a06]                           dc.w $0000
[000e2a08]                           dc.w $0000
[000e2a0a]                           dc.w $0000
[000e2a0c]                           dc.w $0000
[000e2a0e]                           dc.w $0000
[000e2a10]                           dc.w $0000
[000e2a12]                           dc.w $0000
[000e2a14]                           dc.w $0001
[000e2a16]                           dc.w $0000
[000e2a18]                           dc.w $0000
[000e2a1a]                           dc.w $0000
[000e2a1c]                           dc.w $0000
[000e2a1e]                           dc.w $0000
[000e2a20]                           dc.w $0000
[000e2a22]                           dc.w $0000
[000e2a24]                           dc.w $0000
[000e2a26]                           dc.w $0000
[000e2a28]                           dc.w $0000
[000e2a2a]                           dc.w $0000
[000e2a2c]                           dc.w $0000
[000e2a2e]                           dc.w $0000
[000e2a30]                           dc.w $0000
[000e2a32]                           dc.w $0000
[000e2a34]                           dc.w $0000
[000e2a36]                           dc.w $0000
[000e2a38]                           dc.w $0000
[000e2a3a]                           dc.w $0000
[000e2a3c]                           dc.w $0000
[000e2a3e]                           dc.w $0000
[000e2a40]                           dc.w $0000
[000e2a42]                           dc.w $0000
[000e2a44]                           dc.w $0000
[000e2a46]                           dc.w $0000
[000e2a48]                           dc.w $0000
[000e2a4a]                           dc.w $0000
[000e2a4c]                           dc.w $0000
[000e2a4e]                           dc.w $0000
[000e2a50]                           dc.w $0000
[000e2a52]                           dc.w $0000
[000e2a54]                           dc.w $0010
[000e2a56]                           dc.w $0000
[000e2a58]                           dc.w $0000
[000e2a5a]                           dc.w $0000
[000e2a5c]                           dc.w $0000
[000e2a5e]                           dc.w $0000
[000e2a60]                           dc.w $0000
[000e2a62]                           dc.w $0000
[000e2a64]                           dc.w $0000
[000e2a66]                           dc.w $0000
[000e2a68]                           dc.w $0000
[000e2a6a]                           dc.w $0000
[000e2a6c]                           dc.w $0000
[000e2a6e]                           dc.w $0000
[000e2a70]                           dc.w $0000
[000e2a72]                           dc.w $0000
[000e2a74]                           dc.w $0015
[000e2a76]                           dc.w $0001
[000e2a78]                           dc.w $0000
[000e2a7a]                           dc.w $0000
[000e2a7c]                           dc.w $0000
[000e2a7e]                           dc.w $0000
[000e2a80]                           dc.w $0000
[000e2a82]                           dc.w $0000
[000e2a84]                           dc.w $0000
[000e2a86]                           dc.w $0000
[000e2a88]                           dc.w $0000
[000e2a8a]                           dc.w $0000
[000e2a8c]                           dc.w $0000
[000e2a8e]                           dc.w $0000
[000e2a90]                           dc.w $0000
[000e2a92]                           dc.w $0000
[000e2a94]                           dc.w $0010
[000e2a96]                           dc.w $0000
[000e2a98]                           dc.w $0000
[000e2a9a]                           dc.w $0000
[000e2a9c]                           dc.w $0000
[000e2a9e]                           dc.w $0000
[000e2aa0]                           dc.w $0000
[000e2aa2]                           dc.w $0000
[000e2aa4]                           dc.w $0000
[000e2aa6]                           dc.w $0000
[000e2aa8]                           dc.w $0000
[000e2aaa]                           dc.w $0000
[000e2aac]                           dc.w $0000
[000e2aae]                           dc.w $0000
[000e2ab0]                           dc.w $0000
[000e2ab2]                           dc.w $0000
[000e2ab4]                           dc.w $001c
[000e2ab6]                           dc.w $0001
[000e2ab8]                           dc.w $0000
[000e2aba]                           dc.w $0000
[000e2abc]                           dc.w $0000
[000e2abe]                           dc.w $0000
[000e2ac0]                           dc.w $0000
[000e2ac2]                           dc.w $0000
[000e2ac4]                           dc.w $0000
[000e2ac6]                           dc.w $0000
[000e2ac8]                           dc.w $0000
[000e2aca]                           dc.w $0000
[000e2acc]                           dc.w $0000
[000e2ace]                           dc.w $0000
[000e2ad0]                           dc.w $0000
[000e2ad2]                           dc.w $0000
[000e2ad4]                           dc.w $0010
[000e2ad6]                           dc.w $0000
[000e2ad8]                           dc.w $0000
[000e2ada]                           dc.w $0000
[000e2adc]                           dc.w $0000
[000e2ade]                           dc.w $0000
[000e2ae0]                           dc.w $0000
[000e2ae2]                           dc.w $0000
[000e2ae4]                           dc.w $0000
[000e2ae6]                           dc.w $0000
[000e2ae8]                           dc.w $0000
[000e2aea]                           dc.w $0000
[000e2aec]                           dc.w $0000
[000e2aee]                           dc.w $0000
[000e2af0]                           dc.w $0000
[000e2af2]                           dc.w $0000
[000e2af4]                           dc.w $001b
[000e2af6]                           dc.w $0001
[000e2af8]                           dc.w $0000
[000e2afa]                           dc.w $0000
[000e2afc]                           dc.w $0000
[000e2afe]                           dc.w $0000
[000e2b00]                           dc.w $0000
[000e2b02]                           dc.w $0000
[000e2b04]                           dc.w $0000
[000e2b06]                           dc.w $0000
[000e2b08]                           dc.w $0000
[000e2b0a]                           dc.w $0000
[000e2b0c]                           dc.w $0000
[000e2b0e]                           dc.w $0000
[000e2b10]                           dc.w $0000
[000e2b12]                           dc.w $0000
[000e2b14]                           dc.w $0002
[000e2b16]                           dc.w $0000
[000e2b18]                           dc.w $0000
[000e2b1a]                           dc.w $0000
[000e2b1c]                           dc.w $0000
[000e2b1e]                           dc.w $0000
[000e2b20]                           dc.w $0000
[000e2b22]                           dc.w $0000
[000e2b24]                           dc.w $0000
[000e2b26]                           dc.w $0000
[000e2b28]                           dc.w $0000
[000e2b2a]                           dc.w $0000
[000e2b2c]                           dc.w $0000
[000e2b2e]                           dc.w $0000
[000e2b30]                           dc.w $0000
[000e2b32]                           dc.w $0000
[000e2b34]                           dc.w $0000
[000e2b36]                           dc.w $0000
[000e2b38]                           dc.w $0000
[000e2b3a]                           dc.w $0000
[000e2b3c]                           dc.w $0000
[000e2b3e]                           dc.w $0000
[000e2b40]                           dc.w $0000
[000e2b42]                           dc.w $0000
[000e2b44]                           dc.w $0000
[000e2b46]                           dc.w $0000
[000e2b48]                           dc.w $0000
[000e2b4a]                           dc.w $0000
[000e2b4c]                           dc.w $0000
[000e2b4e]                           dc.w $0000
[000e2b50]                           dc.w $0000
[000e2b52]                           dc.w $0000
[000e2b54]                           dc.w $2a2e
[000e2b56]                           dc.w $002a
[000e2b58]                           dc.w $2e00
[000e2b5a]                           dc.w $2e00
[000e2b5c]                           dc.b '*.%s',0
[000e2b61]                           dc.b $2a
[000e2b62]                           dc.w $0041
[000e2b64]                           dc.w $3a00
[000e2b66]                           dc.w $2a00
[000e2b68]                           dc.w $2a00
[000e2b6a]                           dc.w $0000
