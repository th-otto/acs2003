
	.globl Adate_getMonth
Adate_getMonth:
[0006cd86] 4fef fff6                 lea.l      -10(a7),a7
[0006cd8a] 2f48 0006                 move.l     a0,6(a7)
[0006cd8e] 2f49 0002                 move.l     a1,2(a7)
[0006cd92] 4257                      clr.w      (a7)
[0006cd94] 7003                      moveq.l    #3,d0
[0006cd96] 43f9 000e 20fc            lea.l      $000E20FC,a1
[0006cd9c] 206f 0006                 movea.l    6(a7),a0
[0006cda0] 4eb9 0004 684c            jsr        Ast_incmp
[0006cda6] 4a40                      tst.w      d0
[0006cda8] 6604                      bne.s      Adate_getMonth_1
[0006cdaa] 3ebc 0001                 move.w     #$0001,(a7)
Adate_getMonth_1:
[0006cdae] 7003                      moveq.l    #3,d0
[0006cdb0] 43f9 000e 2100            lea.l      $000E2100,a1
[0006cdb6] 206f 0006                 movea.l    6(a7),a0
[0006cdba] 4eb9 0004 684c            jsr        Ast_incmp
[0006cdc0] 4a40                      tst.w      d0
[0006cdc2] 6604                      bne.s      Adate_getMonth_2
[0006cdc4] 3ebc 0002                 move.w     #$0002,(a7)
Adate_getMonth_2:
[0006cdc8] 7003                      moveq.l    #3,d0
[0006cdca] 43f9 000e 2104            lea.l      $000E2104,a1
[0006cdd0] 206f 0006                 movea.l    6(a7),a0
[0006cdd4] 4eb9 0004 684c            jsr        Ast_incmp
[0006cdda] 4a40                      tst.w      d0
[0006cddc] 6604                      bne.s      Adate_getMonth_3
[0006cdde] 3ebc 0003                 move.w     #$0003,(a7)
Adate_getMonth_3:
[0006cde2] 7003                      moveq.l    #3,d0
[0006cde4] 43f9 000e 2108            lea.l      $000E2108,a1
[0006cdea] 206f 0006                 movea.l    6(a7),a0
[0006cdee] 4eb9 0004 684c            jsr        Ast_incmp
[0006cdf4] 4a40                      tst.w      d0
[0006cdf6] 6604                      bne.s      Adate_getMonth_4
[0006cdf8] 3ebc 0004                 move.w     #$0004,(a7)
Adate_getMonth_4:
[0006cdfc] 7003                      moveq.l    #3,d0
[0006cdfe] 43f9 000e 210c            lea.l      $000E210C,a1
[0006ce04] 206f 0006                 movea.l    6(a7),a0
[0006ce08] 4eb9 0004 684c            jsr        Ast_incmp
[0006ce0e] 4a40                      tst.w      d0
[0006ce10] 6604                      bne.s      Adate_getMonth_5
[0006ce12] 3ebc 0005                 move.w     #$0005,(a7)
Adate_getMonth_5:
[0006ce16] 7003                      moveq.l    #3,d0
[0006ce18] 43f9 000e 2110            lea.l      $000E2110,a1
[0006ce1e] 206f 0006                 movea.l    6(a7),a0
[0006ce22] 4eb9 0004 684c            jsr        Ast_incmp
[0006ce28] 4a40                      tst.w      d0
[0006ce2a] 6604                      bne.s      Adate_getMonth_6
[0006ce2c] 3ebc 0006                 move.w     #$0006,(a7)
Adate_getMonth_6:
[0006ce30] 7003                      moveq.l    #3,d0
[0006ce32] 43f9 000e 2114            lea.l      $000E2114,a1
[0006ce38] 206f 0006                 movea.l    6(a7),a0
[0006ce3c] 4eb9 0004 684c            jsr        Ast_incmp
[0006ce42] 4a40                      tst.w      d0
[0006ce44] 6604                      bne.s      Adate_getMonth_7
[0006ce46] 3ebc 0007                 move.w     #$0007,(a7)
Adate_getMonth_7:
[0006ce4a] 7003                      moveq.l    #3,d0
[0006ce4c] 43f9 000e 2118            lea.l      $000E2118,a1
[0006ce52] 206f 0006                 movea.l    6(a7),a0
[0006ce56] 4eb9 0004 684c            jsr        Ast_incmp
[0006ce5c] 4a40                      tst.w      d0
[0006ce5e] 6604                      bne.s      Adate_getMonth_8
[0006ce60] 3ebc 0008                 move.w     #$0008,(a7)
Adate_getMonth_8:
[0006ce64] 7003                      moveq.l    #3,d0
[0006ce66] 43f9 000e 211c            lea.l      $000E211C,a1
[0006ce6c] 206f 0006                 movea.l    6(a7),a0
[0006ce70] 4eb9 0004 684c            jsr        Ast_incmp
[0006ce76] 4a40                      tst.w      d0
[0006ce78] 6604                      bne.s      Adate_getMonth_9
[0006ce7a] 3ebc 0009                 move.w     #$0009,(a7)
Adate_getMonth_9:
[0006ce7e] 7003                      moveq.l    #3,d0
[0006ce80] 43f9 000e 2120            lea.l      $000E2120,a1
[0006ce86] 206f 0006                 movea.l    6(a7),a0
[0006ce8a] 4eb9 0004 684c            jsr        Ast_incmp
[0006ce90] 4a40                      tst.w      d0
[0006ce92] 6604                      bne.s      Adate_getMonth_10
[0006ce94] 3ebc 000a                 move.w     #$000A,(a7)
Adate_getMonth_10:
[0006ce98] 7003                      moveq.l    #3,d0
[0006ce9a] 43f9 000e 2124            lea.l      $000E2124,a1
[0006cea0] 206f 0006                 movea.l    6(a7),a0
[0006cea4] 4eb9 0004 684c            jsr        Ast_incmp
[0006ceaa] 4a40                      tst.w      d0
[0006ceac] 6604                      bne.s      Adate_getMonth_11
[0006ceae] 3ebc 000b                 move.w     #$000B,(a7)
Adate_getMonth_11:
[0006ceb2] 7003                      moveq.l    #3,d0
[0006ceb4] 43f9 000e 2128            lea.l      $000E2128,a1
[0006ceba] 206f 0006                 movea.l    6(a7),a0
[0006cebe] 4eb9 0004 684c            jsr        Ast_incmp
[0006cec4] 4a40                      tst.w      d0
[0006cec6] 6604                      bne.s      Adate_getMonth_12
[0006cec8] 3ebc 000c                 move.w     #$000C,(a7)
Adate_getMonth_12:
[0006cecc] 202f 0002                 move.l     2(a7),d0
[0006ced0] 6714                      beq.s      Adate_getMonth_13
[0006ced2] 3f17                      move.w     (a7),-(a7)
[0006ced4] 43f9 000e 212c            lea.l      $000E212C,a1
[0006ceda] 206f 0004                 movea.l    4(a7),a0
[0006cede] 4eb9 0008 15ac            jsr        sprintf
[0006cee4] 544f                      addq.w     #2,a7
Adate_getMonth_13:
[0006cee6] 3017                      move.w     (a7),d0
[0006cee8] 4fef 000a                 lea.l      10(a7),a7
[0006ceec] 4e75                      rts

	.data

[000e20fc]                           dc.b 'JAN',0
[000e2100]                           dc.b 'FEB',0
[000e2104]                           dc.b 'MAR',0
[000e2108]                           dc.b 'APR',0
[000e210c]                           dc.b 'MAY',0
[000e2110]                           dc.b 'JUN',0
[000e2114]                           dc.b 'JUL',0
[000e2118]                           dc.b 'AUG',0
[000e211c]                           dc.b 'SEP',0
[000e2120]                           dc.b 'OCT',0
[000e2124]                           dc.b 'NOV',0
[000e2128]                           dc.b 'DEC',0
[000e212c]                           dc.b '%02i',0
[000e2131]                           dc.b $00
