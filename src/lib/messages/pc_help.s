Aev_ExitPCHelp:
[00062354] 2039 000e 1bc2            move.l     help_string,d0
[0006235a] 670c                      beq.s      Aev_ExitPCHelp_1
[0006235c] 2079 000e 1bc2            movea.l    help_string,a0
[00062362] 4eb9 0004 c9da            jsr        Ax_glfree
Aev_ExitPCHelp_1:
[00062368] 42b9 000e 1bc2            clr.l      help_string
[0006236e] 42b9 000e 1bc8            clr.l      help_meldung
[00062374] 7001                      moveq.l    #1,d0
[00062376] 4e75                      rts

FindPCHelp:
[00062378] 5d4f                      subq.w     #6,a7
[0006237a] 2f48 0002                 move.l     a0,2(a7)
[0006237e] 202f 0002                 move.l     2(a7),d0
[00062382] 6734                      beq.s      FindPCHelp_1
[00062384] 206f 0002                 movea.l    2(a7),a0
[00062388] 1010                      move.b     (a0),d0
[0006238a] 672c                      beq.s      FindPCHelp_1
[0006238c] 2279 000e 692a            movea.l    _globl,a1
[00062392] 206f 0002                 movea.l    2(a7),a0
[00062396] 4eb9 0007 8b56            jsr        mt_appl_find
[0006239c] 3e80                      move.w     d0,(a7)
[0006239e] 7008                      moveq.l    #8,d0
[000623a0] 226f 0002                 movea.l    2(a7),a1
[000623a4] 41f9 000e 1bcc            lea.l      help_name,a0
[000623aa] 4eb9 0008 2fd6            jsr        strncpy
[000623b0] 4239 000e 1bd5            clr.b      $000E1BD5
[000623b6] 6004                      bra.s      FindPCHelp_2
FindPCHelp_1:
[000623b8] 3ebc ffff                 move.w     #$FFFF,(a7)
FindPCHelp_2:
[000623bc] 3017                      move.w     (a7),d0
[000623be] 6a2e                      bpl.s      FindPCHelp_3
[000623c0] 2279 000e 692a            movea.l    _globl,a1
[000623c6] 41f9 000e 1bd6            lea.l      $000E1BD6,a0
[000623cc] 4eb9 0007 8b56            jsr        mt_appl_find
[000623d2] 3e80                      move.w     d0,(a7)
[000623d4] 7008                      moveq.l    #8,d0
[000623d6] 43f9 000e 1bdf            lea.l      $000E1BDF,a1
[000623dc] 41f9 000e 1bcc            lea.l      help_name,a0
[000623e2] 4eb9 0008 2fd6            jsr        strncpy
[000623e8] 4239 000e 1bd5            clr.b      $000E1BD5
FindPCHelp_3:
[000623ee] 3017                      move.w     (a7),d0
[000623f0] 6a2e                      bpl.s      FindPCHelp_4
[000623f2] 2279 000e 692a            movea.l    _globl,a1
[000623f8] 41f9 000e 1be8            lea.l      $000E1BE8,a0
[000623fe] 4eb9 0007 8b56            jsr        mt_appl_find
[00062404] 3e80                      move.w     d0,(a7)
[00062406] 7008                      moveq.l    #8,d0
[00062408] 43f9 000e 1bf1            lea.l      $000E1BF1,a1
[0006240e] 41f9 000e 1bcc            lea.l      help_name,a0
[00062414] 4eb9 0008 2fd6            jsr        strncpy
[0006241a] 4239 000e 1bd5            clr.b      $000E1BD5
FindPCHelp_4:
[00062420] 3017                      move.w     (a7),d0
[00062422] 6a06                      bpl.s      FindPCHelp_5
[00062424] 4239 000e 1bcc            clr.b      help_name
FindPCHelp_5:
[0006242a] 3017                      move.w     (a7),d0
[0006242c] 5c4f                      addq.w     #6,a7
[0006242e] 4e75                      rts

CheckPcHelp:
[00062430] 594f                      subq.w     #4,a7
[00062432] 2e88                      move.l     a0,(a7)
[00062434] 2057                      movea.l    (a7),a0
[00062436] b1f9 000e 1bc8            cmpa.l     help_meldung,a0
[0006243c] 6606                      bne.s      CheckPcHelp_1
[0006243e] 42b9 000e 1bc8            clr.l      help_meldung
CheckPcHelp_1:
[00062444] 584f                      addq.w     #4,a7
[00062446] 4e75                      rts

SendMeldung:
[00062448] 2f0a                      move.l     a2,-(a7)
[0006244a] 554f                      subq.w     #2,a7
[0006244c] 3e80                      move.w     d0,(a7)
[0006244e] 2039 000e 1bc8            move.l     help_meldung,d0
[00062454] 672c                      beq.s      SendMeldung_1
[00062456] 3017                      move.w     (a7),d0
[00062458] 6606                      bne.s      SendMeldung_2
[0006245a] 4279 000e 1bc6            clr.w      help_version
SendMeldung_2:
[00062460] 43f9 000e 1bc6            lea.l      help_version,a1
[00062466] 303c 0192                 move.w     #$0192,d0
[0006246a] 2079 000e 1bc8            movea.l    help_meldung,a0
[00062470] 2479 000e 1bc8            movea.l    help_meldung,a2
[00062476] 246a 0004                 movea.l    4(a2),a2
[0006247a] 4e92                      jsr        (a2)
[0006247c] 42b9 000e 1bc8            clr.l      help_meldung
SendMeldung_1:
[00062482] 544f                      addq.w     #2,a7
[00062484] 245f                      movea.l    (a7)+,a2
[00062486] 4e75                      rts

Aev_GetAcReply:
[00062488] 514f                      subq.w     #8,a7
[0006248a] 2f48 0004                 move.l     a0,4(a7)
[0006248e] 206f 0004                 movea.l    4(a7),a0
[00062492] 2e90                      move.l     (a0),(a7)
[00062494] 2057                      movea.l    (a7),a0
[00062496] 3028 0004                 move.w     4(a0),d0
[0006249a] 6f54                      ble.s      Aev_GetAcReply_1
[0006249c] 2057                      movea.l    (a7),a0
[0006249e] 2f08                      move.l     a0,-(a7)
[000624a0] 2279 000e 692a            movea.l    _globl,a1
[000624a6] 41f9 000e 1bcc            lea.l      help_name,a0
[000624ac] 4eb9 0007 8b56            jsr        mt_appl_find
[000624b2] 205f                      movea.l    (a7)+,a0
[000624b4] b068 0002                 cmp.w      2(a0),d0
[000624b8] 6636                      bne.s      Aev_GetAcReply_1
[000624ba] 2057                      movea.l    (a7),a0
[000624bc] 33e8 0004 000e 1bc6       move.w     4(a0),help_version
[000624c4] 7001                      moveq.l    #1,d0
[000624c6] 6100 ff80                 bsr.w      SendMeldung
[000624ca] 2039 000e 1bc2            move.l     help_string,d0
[000624d0] 670c                      beq.s      Aev_GetAcReply_2
[000624d2] 2079 000e 1bc2            movea.l    help_string,a0
[000624d8] 4eb9 0004 c9da            jsr        Ax_glfree
Aev_GetAcReply_2:
[000624de] 42b9 000e 1bc2            clr.l      help_string
[000624e4] 4239 000e 1bcc            clr.b      help_name
[000624ea] 7001                      moveq.l    #1,d0
[000624ec] 6004                      bra.s      Aev_GetAcReply_3
[000624ee] 4e71                      nop
Aev_GetAcReply_1:
[000624f0] 4240                      clr.w      d0
Aev_GetAcReply_3:
[000624f2] 504f                      addq.w     #8,a7
[000624f4] 4e75                      rts

Aev_AcHelp:
[000624f6] 4fef ffe6                 lea.l      -26(a7),a7
[000624fa] 2f48 0016                 move.l     a0,22(a7)
[000624fe] 2f49 0012                 move.l     a1,18(a7)
[00062502] 206f 0016                 movea.l    22(a7),a0
[00062506] 6100 fe70                 bsr        FindPCHelp
[0006250a] 3f40 0010                 move.w     d0,16(a7)
[0006250e] 302f 0010                 move.w     16(a7),d0
[00062512] 6b00 00a0                 bmi        Aev_AcHelp_1
[00062516] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006251c] 302f 0010                 move.w     16(a7),d0
[00062520] b050                      cmp.w      (a0),d0
[00062522] 6700 0090                 beq        Aev_AcHelp_1
[00062526] 4240                      clr.w      d0
[00062528] 6100 ff1e                 bsr        SendMeldung
[0006252c] 2039 000e 1bc2            move.l     help_string,d0
[00062532] 670c                      beq.s      Aev_AcHelp_2
[00062534] 2079 000e 1bc2            movea.l    help_string,a0
[0006253a] 4eb9 0004 c9da            jsr        Ax_glfree
Aev_AcHelp_2:
[00062540] 7001                      moveq.l    #1,d0
[00062542] 206f 0012                 movea.l    18(a7),a0
[00062546] 4eb9 0004 744e            jsr        Ast_copy
[0006254c] 23c8 000e 1bc2            move.l     a0,help_string
[00062552] 2079 000e 1bc2            movea.l    help_string,a0
[00062558] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006255e] 4a40                      tst.w      d0
[00062560] 6704                      beq.s      Aev_AcHelp_3
[00062562] 4240                      clr.w      d0
[00062564] 6050                      bra.s      Aev_AcHelp_4
Aev_AcHelp_3:
[00062566] 3ebc 0401                 move.w     #$0401,(a7)
[0006256a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062570] 3f50 0002                 move.w     (a0),2(a7)
[00062574] 426f 0004                 clr.w      4(a7)
[00062578] 426f 000a                 clr.w      10(a7)
[0006257c] 426f 000c                 clr.w      12(a7)
[00062580] 426f 000e                 clr.w      14(a7)
[00062584] 2f79 000e 1bc2 0006       move.l     help_string,6(a7)
[0006258c] 23ef 001e 000e 1bc8       move.l     30(a7),help_meldung
[00062594] 2279 000e 692a            movea.l    _globl,a1
[0006259a] 41d7                      lea.l      (a7),a0
[0006259c] 7210                      moveq.l    #16,d1
[0006259e] 302f 0010                 move.w     16(a7),d0
[000625a2] 4eb9 0007 8ae8            jsr        mt_appl_write
[000625a8] 4a40                      tst.w      d0
[000625aa] 6704                      beq.s      Aev_AcHelp_5
[000625ac] 7001                      moveq.l    #1,d0
[000625ae] 6002                      bra.s      Aev_AcHelp_6
Aev_AcHelp_5:
[000625b0] 4240                      clr.w      d0
Aev_AcHelp_6:
[000625b2] 6002                      bra.s      Aev_AcHelp_4
Aev_AcHelp_1:
[000625b4] 4240                      clr.w      d0
Aev_AcHelp_4:
[000625b6] 4fef 001a                 lea.l      26(a7),a7
[000625ba] 4e75                      rts

	.data

help_string:
[000e1bc2]                           dc.w $0000
[000e1bc4]                           dc.w $0000
help_version:
[000e1bc6]                           dc.w $0000
help_meldung:
[000e1bc8]                           dc.w $0000
[000e1bca]                           dc.w $0000
help_name:
[000e1bcc]                           dc.w $0000
[000e1bce]                           dc.w $0000
[000e1bd0]                           dc.w $0000
[000e1bd2]                           dc.w $0000
[000e1bd4]                           dc.w $0000
[000e1bd6]                           dc.b 'PC_HELP ',0
[000e1bdf]                           dc.b 'PC_HELP ',0
[000e1be8]                           dc.b 'ST-GUIDE',0
[000e1bf1]                           dc.b 'ST-GUIDE',0
