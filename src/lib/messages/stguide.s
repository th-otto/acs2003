Aev_InitSTGuide:
[0006217e] 7001                      moveq.l    #1,d0
[00062180] 4e75                      rts

Aev_ExitSTGuide:
[00062182] 2039 000e 1b9c            move.l     help_string,d0
[00062188] 670c                      beq.s      Aev_ExitSTGuide_1
[0006218a] 2079 000e 1b9c            movea.l    help_string,a0
[00062190] 4eb9 0004 c9da            jsr        Ax_glfree
Aev_ExitSTGuide_1:
[00062196] 42b9 000e 1b9c            clr.l      help_string
[0006219c] 42b9 000e 1ba0            clr.l      help_meldung
[000621a2] 7001                      moveq.l    #1,d0
[000621a4] 4e75                      rts

CheckSTGuide:
[000621a6] 594f                      subq.w     #4,a7
[000621a8] 2e88                      move.l     a0,(a7)
[000621aa] 2057                      movea.l    (a7),a0
[000621ac] b1f9 000e 1ba0            cmpa.l     help_meldung,a0
[000621b2] 6606                      bne.s      CheckSTGuide_1
[000621b4] 42b9 000e 1ba0            clr.l      help_meldung
CheckSTGuide_1:
[000621ba] 584f                      addq.w     #4,a7
[000621bc] 4e75                      rts

SendMeldung:
[000621be] 2f0a                      move.l     a2,-(a7)
[000621c0] 2039 000e 1ba0            move.l     help_meldung,d0
[000621c6] 671e                      beq.s      SendMeldung_1
[000621c8] 93c9                      suba.l     a1,a1
[000621ca] 303c 0192                 move.w     #$0192,d0
[000621ce] 2079 000e 1ba0            movea.l    help_meldung,a0
[000621d4] 2479 000e 1ba0            movea.l    help_meldung,a2
[000621da] 246a 0004                 movea.l    4(a2),a2
[000621de] 4e92                      jsr        (a2)
[000621e0] 42b9 000e 1ba0            clr.l      help_meldung
SendMeldung_1:
[000621e6] 245f                      movea.l    (a7)+,a2
[000621e8] 4e75                      rts

Aev_STGuideHelp:
[000621ea] 4fef fff2                 lea.l      -14(a7),a7
[000621ee] 2f48 000a                 move.l     a0,10(a7)
[000621f2] 2f49 0006                 move.l     a1,6(a7)
[000621f6] 206f 000a                 movea.l    10(a7),a0
[000621fa] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00062200] 4a40                      tst.w      d0
[00062202] 6714                      beq.s      Aev_STGuideHelp_1
[00062204] 206f 0006                 movea.l    6(a7),a0
[00062208] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0006220e] 4a40                      tst.w      d0
[00062210] 6706                      beq.s      Aev_STGuideHelp_1
[00062212] 4240                      clr.w      d0
[00062214] 6000 0124                 bra        Aev_STGuideHelp_2
Aev_STGuideHelp_1:
[00062218] 2279 000e 692a            movea.l    _globl,a1
[0006221e] 41f9 000e 1ba4            lea.l      $000E1BA4,a0
[00062224] 4eb9 0007 8b56            jsr        mt_appl_find
[0006222a] 3f40 0004                 move.w     d0,4(a7)
[0006222e] 302f 0004                 move.w     4(a7),d0
[00062232] 6a16                      bpl.s      Aev_STGuideHelp_3
[00062234] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006223a] 3028 0238                 move.w     568(a0),d0
[0006223e] 660a                      bne.s      Aev_STGuideHelp_3
[00062240] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062246] 3010                      move.w     (a0),d0
[00062248] 4e71                      nop
Aev_STGuideHelp_3:
[0006224a] 2039 000e 1b9c            move.l     help_string,d0
[00062250] 670c                      beq.s      Aev_STGuideHelp_4
[00062252] 2079 000e 1b9c            movea.l    help_string,a0
[00062258] 4eb9 0004 c9da            jsr        Ax_glfree
Aev_STGuideHelp_4:
[0006225e] 6100 ff5e                 bsr        SendMeldung
[00062262] 202f 000a                 move.l     10(a7),d0
[00062266] 6708                      beq.s      Aev_STGuideHelp_5
[00062268] 206f 000a                 movea.l    10(a7),a0
[0006226c] 1010                      move.b     (a0),d0
[0006226e] 661a                      bne.s      Aev_STGuideHelp_6
Aev_STGuideHelp_5:
[00062270] 2f2f 0012                 move.l     18(a7),-(a7)
[00062274] 226f 000a                 movea.l    10(a7),a1
[00062278] 41f9 000e 1bad            lea.l      $000E1BAD,a0
[0006227e] 4eb9 0006 24f6            jsr        Aev_AcHelp
[00062284] 584f                      addq.w     #4,a7
[00062286] 6000 00b2                 bra        Aev_STGuideHelp_2
Aev_STGuideHelp_6:
[0006228a] 206f 000a                 movea.l    10(a7),a0
[0006228e] 4eb9 0008 2f6c            jsr        strlen
[00062294] 2f00                      move.l     d0,-(a7)
[00062296] 206f 000a                 movea.l    10(a7),a0
[0006229a] 4eb9 0008 2f6c            jsr        strlen
[000622a0] d09f                      add.l      (a7)+,d0
[000622a2] d0bc 0000 000a            add.l      #$0000000A,d0
[000622a8] 2e80                      move.l     d0,(a7)
[000622aa] 2017                      move.l     (a7),d0
[000622ac] 4eb9 0004 c608            jsr        Ax_malloc
[000622b2] 23c8 000e 1b9c            move.l     a0,help_string
[000622b8] 2039 000e 1b9c            move.l     help_string,d0
[000622be] 6604                      bne.s      Aev_STGuideHelp_7
[000622c0] 4240                      clr.w      d0
[000622c2] 6076                      bra.s      Aev_STGuideHelp_2
Aev_STGuideHelp_7:
[000622c4] 43f9 000e 1bba            lea.l      $000E1BBA,a1
[000622ca] 2f09                      move.l     a1,-(a7)
[000622cc] 43f9 000e 1bb6            lea.l      $000E1BB6,a1
[000622d2] 2079 000e 1b9c            movea.l    help_string,a0
[000622d8] 4eb9 0008 2f0c            jsr        strcpy
[000622de] 226f 000e                 movea.l    14(a7),a1
[000622e2] 4eb9 0008 2e42            jsr        strcat
[000622e8] 4eb9 0004 663c            jsr        Ast_alltrim
[000622ee] 225f                      movea.l    (a7)+,a1
[000622f0] 4eb9 0008 2e42            jsr        strcat
[000622f6] 202f 0006                 move.l     6(a7),d0
[000622fa] 672a                      beq.s      Aev_STGuideHelp_8
[000622fc] 206f 0006                 movea.l    6(a7),a0
[00062300] 1010                      move.b     (a0),d0
[00062302] 6722                      beq.s      Aev_STGuideHelp_8
[00062304] 43f9 000e 1bbf            lea.l      $000E1BBF,a1
[0006230a] 2079 000e 1b9c            movea.l    help_string,a0
[00062310] 4eb9 0008 2e42            jsr        strcat
[00062316] 226f 0006                 movea.l    6(a7),a1
[0006231a] 4eb9 0008 2e42            jsr        strcat
[00062320] 4eb9 0004 663c            jsr        Ast_alltrim
Aev_STGuideHelp_8:
[00062326] 72ff                      moveq.l    #-1,d1
[00062328] 93c9                      suba.l     a1,a1
[0006232a] 2079 000e 1b9c            movea.l    help_string,a0
[00062330] 302f 0004                 move.w     4(a7),d0
[00062334] 4eb9 0005 fd30            jsr        Aev_VaStart
Aev_STGuideHelp_2:
[0006233a] 4fef 000e                 lea.l      14(a7),a7
[0006233e] 4e75                      rts

	.data

help_string:
[000e1b9c]                           dc.w $0000
[000e1b9e]                           dc.w $0000
help_meldung:
[000e1ba0]                           dc.w $0000
[000e1ba2]                           dc.w $0000
[000e1ba4]                           dc.b 'ST-GUIDE',0
[000e1bad]                           dc.b 'ST-GUIDE',0
[000e1bb6]                           dc.b '*:\',0
[000e1bba]                           dc.b '.REF',0
[000e1bbf]                           dc.b $20
[000e1bc0]                           dc.w $0000
