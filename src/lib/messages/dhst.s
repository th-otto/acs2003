Aev_InitDHST:
[00060262] 7001                      moveq.l    #1,d0
[00060264] 4e75                      rts
Aev_ExitDHST:
[00060266] 7001                      moveq.l    #1,d0
[00060268] 4e75                      rts
freeDhstInfo:
[0006026a] 2f0a                      move.l     a2,-(a7)
[0006026c] 594f                      subq.w     #4,a7
[0006026e] 2e88                      move.l     a0,(a7)
[00060270] 2057                      movea.l    (a7),a0
[00060272] 2010                      move.l     (a0),d0
[00060274] 6720                      beq.s      $00060296
[00060276] 4879 0007 0f86            pea.l      Alu_ptrCmp
[0006027c] 206f 0004                 movea.l    4(a7),a0
[00060280] 2250                      movea.l    (a0),a1
[00060282] 2079 000e 147e            movea.l    globProtData,a0
[00060288] 2479 000e 147e            movea.l    globProtData,a2
[0006028e] 246a 0018                 movea.l    24(a2),a2
[00060292] 4e92                      jsr        (a2)
[00060294] 584f                      addq.w     #4,a7
[00060296] 2057                      movea.l    (a7),a0
[00060298] 2028 0004                 move.l     4(a0),d0
[0006029c] 6722                      beq.s      $000602C0
[0006029e] 4879 0007 0f86            pea.l      Alu_ptrCmp
[000602a4] 206f 0004                 movea.l    4(a7),a0
[000602a8] 2268 0004                 movea.l    4(a0),a1
[000602ac] 2079 000e 147e            movea.l    globProtData,a0
[000602b2] 2479 000e 147e            movea.l    globProtData,a2
[000602b8] 246a 0018                 movea.l    24(a2),a2
[000602bc] 4e92                      jsr        (a2)
[000602be] 584f                      addq.w     #4,a7
[000602c0] 2057                      movea.l    (a7),a0
[000602c2] 2028 0008                 move.l     8(a0),d0
[000602c6] 6722                      beq.s      $000602EA
[000602c8] 4879 0007 0f86            pea.l      Alu_ptrCmp
[000602ce] 206f 0004                 movea.l    4(a7),a0
[000602d2] 2268 0008                 movea.l    8(a0),a1
[000602d6] 2079 000e 147e            movea.l    globProtData,a0
[000602dc] 2479 000e 147e            movea.l    globProtData,a2
[000602e2] 246a 0018                 movea.l    24(a2),a2
[000602e6] 4e92                      jsr        (a2)
[000602e8] 584f                      addq.w     #4,a7
[000602ea] 2057                      movea.l    (a7),a0
[000602ec] 2028 000c                 move.l     12(a0),d0
[000602f0] 6722                      beq.s      $00060314
[000602f2] 4879 0007 0f86            pea.l      Alu_ptrCmp
[000602f8] 206f 0004                 movea.l    4(a7),a0
[000602fc] 2268 000c                 movea.l    12(a0),a1
[00060300] 2079 000e 147e            movea.l    globProtData,a0
[00060306] 2479 000e 147e            movea.l    globProtData,a2
[0006030c] 246a 0018                 movea.l    24(a2),a2
[00060310] 4e92                      jsr        (a2)
[00060312] 584f                      addq.w     #4,a7
[00060314] 4879 0007 0f86            pea.l      Alu_ptrCmp
[0006031a] 226f 0004                 movea.l    4(a7),a1
[0006031e] 2079 000e 147e            movea.l    globProtData,a0
[00060324] 2479 000e 147e            movea.l    globProtData,a2
[0006032a] 246a 0018                 movea.l    24(a2),a2
[0006032e] 4e92                      jsr        (a2)
[00060330] 584f                      addq.w     #4,a7
[00060332] 584f                      addq.w     #4,a7
[00060334] 245f                      movea.l    (a7)+,a2
[00060336] 4e75                      rts
Aev_GetDhstAdd:
[00060338] 7001                      moveq.l    #1,d0
[0006033a] 4e75                      rts
Aev_GetDhstAck:
[0006033c] 2f0a                      move.l     a2,-(a7)
[0006033e] 4fef ffca                 lea.l      -54(a7),a7
[00060342] 2f48 0032                 move.l     a0,50(a7)
[00060346] 3f7c dadd 0008            move.w     #$DADD,8(a7)
[0006034c] 206f 0032                 movea.l    50(a7),a0
[00060350] 2f50 0004                 move.l     (a0),4(a7)
[00060354] 206f 0004                 movea.l    4(a7),a0
[00060358] 2ea8 0006                 move.l     6(a0),(a7)
[0006035c] 2057                      movea.l    (a7),a0
[0006035e] 6100 ff0a                 bsr        freeDhstInfo
[00060362] 206f 0004                 movea.l    4(a7),a0
[00060366] 3f68 0002 000e            move.w     2(a0),14(a7)
[0006036c] 3f7c 0003 0010            move.w     #$0003,16(a7)
[00060372] 41ef 0008                 lea.l      8(a7),a0
[00060376] 2f48 0012                 move.l     a0,18(a7)
[0006037a] 42af 0016                 clr.l      22(a7)
[0006037e] 42af 001a                 clr.l      26(a7)
[00060382] 206f 0004                 movea.l    4(a7),a0
[00060386] 5c48                      addq.w     #6,a0
[00060388] 2f48 001e                 move.l     a0,30(a7)
[0006038c] 206f 0004                 movea.l    4(a7),a0
[00060390] 5048                      addq.w     #8,a0
[00060392] 2f48 0022                 move.l     a0,34(a7)
[00060396] 42af 0026                 clr.l      38(a7)
[0006039a] 42af 002a                 clr.l      42(a7)
[0006039e] 42af 002e                 clr.l      46(a7)
[000603a2] 4879 0005 d87e            pea.l      Aev_CmpMsgInList
[000603a8] 43ef 0012                 lea.l      18(a7),a1
[000603ac] 2079 000d fba6            movea.l    SentMsg,a0
[000603b2] 2479 000d fba6            movea.l    SentMsg,a2
[000603b8] 246a 0020                 movea.l    32(a2),a2
[000603bc] 4e92                      jsr        (a2)
[000603be] 584f                      addq.w     #4,a7
[000603c0] 2f48 000a                 move.l     a0,10(a7)
[000603c4] 202f 000a                 move.l     10(a7),d0
[000603c8] 671e                      beq.s      $000603E8
[000603ca] 4879 0007 0f86            pea.l      Alu_ptrCmp
[000603d0] 226f 000e                 movea.l    14(a7),a1
[000603d4] 2079 000d fba6            movea.l    SentMsg,a0
[000603da] 2479 000d fba6            movea.l    SentMsg,a2
[000603e0] 246a 0020                 movea.l    32(a2),a2
[000603e4] 4e92                      jsr        (a2)
[000603e6] 584f                      addq.w     #4,a7
[000603e8] 7001                      moveq.l    #1,d0
[000603ea] 4fef 0036                 lea.l      54(a7),a7
[000603ee] 245f                      movea.l    (a7)+,a2
[000603f0] 4e75                      rts
Aev_DhstAdd:
[000603f2] 2f0a                      move.l     a2,-(a7)
[000603f4] 4fef ffde                 lea.l      -34(a7),a7
[000603f8] 2f48 001e                 move.l     a0,30(a7)
[000603fc] 2f49 001a                 move.l     a1,26(a7)
[00060400] 41d7                      lea.l      (a7),a0
[00060402] 203c 4448 5354            move.l     #$44485354,d0
[00060408] 4eb9 0008 0ec4            jsr        Ash_getc
[0006040e] 4a40                      tst.w      d0
[00060410] 670c                      beq.s      $0006041E
[00060412] 70ff                      moveq.l    #-1,d0
[00060414] c06f 0002                 and.w      2(a7),d0
[00060418] 3f40 0014                 move.w     d0,20(a7)
[0006041c] 6a06                      bpl.s      $00060424
[0006041e] 4240                      clr.w      d0
[00060420] 6000 0144                 bra        $00060566
[00060424] 7010                      moveq.l    #16,d0
[00060426] 4eb9 0004 c95e            jsr        Ax_glmalloc
[0006042c] 2f48 0016                 move.l     a0,22(a7)
[00060430] 202f 0016                 move.l     22(a7),d0
[00060434] 6606                      bne.s      $0006043C
[00060436] 4240                      clr.w      d0
[00060438] 6000 012c                 bra        $00060566
[0006043c] 7204                      moveq.l    #4,d1
[0006043e] 4240                      clr.w      d0
[00060440] 206f 0016                 movea.l    22(a7),a0
[00060444] 4eb9 0008 36ea            jsr        memset
[0006044a] 226f 0016                 movea.l    22(a7),a1
[0006044e] 2079 000e 147e            movea.l    globProtData,a0
[00060454] 2479 000e 147e            movea.l    globProtData,a2
[0006045a] 246a 000c                 movea.l    12(a2),a2
[0006045e] 4e92                      jsr        (a2)
[00060460] 7001                      moveq.l    #1,d0
[00060462] 2079 0010 ee4e            movea.l    ACSblk,a0
[00060468] 2068 04e6                 movea.l    1254(a0),a0
[0006046c] 4eb9 0004 744e            jsr        Ast_copy
[00060472] 4eb9 0004 663c            jsr        Ast_alltrim
[00060478] 226f 0016                 movea.l    22(a7),a1
[0006047c] 2288                      move.l     a0,(a1)
[0006047e] 7001                      moveq.l    #1,d0
[00060480] 2079 0010 ee4e            movea.l    ACSblk,a0
[00060486] 41e8 001e                 lea.l      30(a0),a0
[0006048a] 4eb9 0004 744e            jsr        Ast_copy
[00060490] 4eb9 0004 663c            jsr        Ast_alltrim
[00060496] 226f 0016                 movea.l    22(a7),a1
[0006049a] 2348 0004                 move.l     a0,4(a1)
[0006049e] 7001                      moveq.l    #1,d0
[000604a0] 206f 001e                 movea.l    30(a7),a0
[000604a4] 4eb9 0004 744e            jsr        Ast_copy
[000604aa] 226f 0016                 movea.l    22(a7),a1
[000604ae] 2348 0008                 move.l     a0,8(a1)
[000604b2] 7001                      moveq.l    #1,d0
[000604b4] 206f 001a                 movea.l    26(a7),a0
[000604b8] 4eb9 0004 744e            jsr        Ast_copy
[000604be] 226f 0016                 movea.l    22(a7),a1
[000604c2] 2348 000c                 move.l     a0,12(a1)
[000604c6] 206f 0016                 movea.l    22(a7),a0
[000604ca] 2250                      movea.l    (a0),a1
[000604cc] 2079 000e 147e            movea.l    globProtData,a0
[000604d2] 2479 000e 147e            movea.l    globProtData,a2
[000604d8] 246a 000c                 movea.l    12(a2),a2
[000604dc] 4e92                      jsr        (a2)
[000604de] 206f 0016                 movea.l    22(a7),a0
[000604e2] 2268 0004                 movea.l    4(a0),a1
[000604e6] 2079 000e 147e            movea.l    globProtData,a0
[000604ec] 2479 000e 147e            movea.l    globProtData,a2
[000604f2] 246a 000c                 movea.l    12(a2),a2
[000604f6] 4e92                      jsr        (a2)
[000604f8] 206f 0016                 movea.l    22(a7),a0
[000604fc] 2268 0008                 movea.l    8(a0),a1
[00060500] 2079 000e 147e            movea.l    globProtData,a0
[00060506] 2479 000e 147e            movea.l    globProtData,a2
[0006050c] 246a 000c                 movea.l    12(a2),a2
[00060510] 4e92                      jsr        (a2)
[00060512] 206f 0016                 movea.l    22(a7),a0
[00060516] 2268 000c                 movea.l    12(a0),a1
[0006051a] 2079 000e 147e            movea.l    globProtData,a0
[00060520] 2479 000e 147e            movea.l    globProtData,a2
[00060526] 246a 000c                 movea.l    12(a2),a2
[0006052a] 4e92                      jsr        (a2)
[0006052c] 3f7c dadd 0004            move.w     #$DADD,4(a7)
[00060532] 2079 0010 ee4e            movea.l    ACSblk,a0
[00060538] 3f50 0006                 move.w     (a0),6(a7)
[0006053c] 426f 0008                 clr.w      8(a7)
[00060540] 426f 000e                 clr.w      14(a7)
[00060544] 426f 0010                 clr.w      16(a7)
[00060548] 426f 0012                 clr.w      18(a7)
[0006054c] 2f6f 0016 000a            move.l     22(a7),10(a7)
[00060552] 74ff                      moveq.l    #-1,d2
[00060554] 93c9                      suba.l     a1,a1
[00060556] 41ef 0004                 lea.l      4(a7),a0
[0006055a] 7203                      moveq.l    #3,d1
[0006055c] 302f 0014                 move.w     20(a7),d0
[00060560] 4eb9 0005 d902            jsr        Aev_SendMsg
[00060566] 4fef 0022                 lea.l      34(a7),a7
[0006056a] 245f                      movea.l    (a7)+,a2
[0006056c] 4e75                      rts
Aev_DhstSaved:
[0006056e] 4fef fff6                 lea.l      -10(a7),a7
[00060572] 2f48 0006                 move.l     a0,6(a7)
[00060576] 206f 0006                 movea.l    6(a7),a0
[0006057a] 4eb9 0008 2f6c            jsr        strlen
[00060580] 4eb9 0004 c608            jsr        Ax_malloc
[00060586] 2f48 0002                 move.l     a0,2(a7)
[0006058a] 202f 0002                 move.l     2(a7),d0
[0006058e] 6604                      bne.s      $00060594
[00060590] 4240                      clr.w      d0
[00060592] 6024                      bra.s      $000605B8
[00060594] 226f 0006                 movea.l    6(a7),a1
[00060598] 206f 0002                 movea.l    2(a7),a0
[0006059c] 4eb9 0004 b706            jsr        Af_2fullname
[000605a2] 226f 0006                 movea.l    6(a7),a1
[000605a6] 6100 fe4a                 bsr        Aev_DhstAdd
[000605aa] 3e80                      move.w     d0,(a7)
[000605ac] 206f 0002                 movea.l    2(a7),a0
[000605b0] 4eb9 0004 c7c8            jsr        Ax_free
[000605b6] 3017                      move.w     (a7),d0
[000605b8] 4fef 000a                 lea.l      10(a7),a7
[000605bc] 4e75                      rts
