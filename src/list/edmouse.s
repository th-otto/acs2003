add_mouse:
[000358c2] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[000358c6] 2448                      movea.l    a0,a2
[000358c8] 2c49                      movea.l    a1,a6
[000358ca] 006a 0001 0006            ori.w      #$0001,6(a2)
[000358d0] 266a 0040                 movea.l    64(a2),a3
[000358d4] 286b 0004                 movea.l    4(a3),a4
[000358d8] 262b 000e                 move.l     14(a3),d3
[000358dc] e48b                      lsr.l      #2,d3
[000358de] 4244                      clr.w      d4
[000358e0] 601e                      bra.s      $00035900
[000358e2] 2a5c                      movea.l    (a4)+,a5
[000358e4] 704a                      moveq.l    #74,d0
[000358e6] 226e 0004                 movea.l    4(a6),a1
[000358ea] 206d 0004                 movea.l    4(a5),a0
[000358ee] 4eb9 0008 34ea            jsr        memcmp
[000358f4] 4a40                      tst.w      d0
[000358f6] 6606                      bne.s      $000358FE
[000358f8] 526d 0036                 addq.w     #1,54(a5)
[000358fc] 6048                      bra.s      $00035946
[000358fe] 5244                      addq.w     #1,d4
[00035900] b644                      cmp.w      d4,d3
[00035902] 6ede                      bgt.s      $000358E2
[00035904] 7038                      moveq.l    #56,d0
[00035906] 204b                      movea.l    a3,a0
[00035908] 4eb9 0001 8028            jsr        objextent
[0003590e] 4a40                      tst.w      d0
[00035910] 6610                      bne.s      $00035922
[00035912] 224e                      movea.l    a6,a1
[00035914] 204a                      movea.l    a2,a0
[00035916] 4eb9 0003 594e            jsr        copy_mouse
[0003591c] 2a48                      movea.l    a0,a5
[0003591e] 200d                      move.l     a5,d0
[00035920] 6604                      bne.s      $00035926
[00035922] 91c8                      suba.l     a0,a0
[00035924] 6022                      bra.s      $00035948
[00035926] 2f39 000c ecf8            move.l     $000CECF8,-(a7)
[0003592c] 486e 0016                 pea.l      22(a6)
[00035930] 224d                      movea.l    a5,a1
[00035932] 204a                      movea.l    a2,a0
[00035934] 4eb9 0001 81c6            jsr        objname
[0003593a] 504f                      addq.w     #8,a7
[0003593c] 224d                      movea.l    a5,a1
[0003593e] 204b                      movea.l    a3,a0
[00035940] 4eb9 0003 33b4            jsr        add_entry
[00035946] 204d                      movea.l    a5,a0
[00035948] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[0003594c] 4e75                      rts
copy_mouse:
[0003594e] 2f0a                      move.l     a2,-(a7)
[00035950] 2f0b                      move.l     a3,-(a7)
[00035952] 2648                      movea.l    a0,a3
[00035954] 2449                      movea.l    a1,a2
[00035956] 202a 000e                 move.l     14(a2),d0
[0003595a] 4eb9 0001 7fae            jsr        objmalloc
[00035960] 2648                      movea.l    a0,a3
[00035962] 200b                      move.l     a3,d0
[00035964] 6604                      bne.s      $0003596A
[00035966] 91c8                      suba.l     a0,a0
[00035968] 601a                      bra.s      $00035984
[0003596a] 276a 000e 000e            move.l     14(a2),14(a3)
[00035970] 202a 000e                 move.l     14(a2),d0
[00035974] 226a 0004                 movea.l    4(a2),a1
[00035978] 206b 0004                 movea.l    4(a3),a0
[0003597c] 4eb9 0008 3500            jsr        memcpy
[00035982] 204b                      movea.l    a3,a0
[00035984] 265f                      movea.l    (a7)+,a3
[00035986] 245f                      movea.l    (a7)+,a2
[00035988] 4e75                      rts
del_mouse:
[0003598a] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003598e] 2848                      movea.l    a0,a4
[00035990] 2449                      movea.l    a1,a2
[00035992] 536a 0036                 subq.w     #1,54(a2)
[00035996] 302a 0036                 move.w     54(a2),d0
[0003599a] 6e2a                      bgt.s      $000359C6
[0003599c] 266a 0012                 movea.l    18(a2),a3
[000359a0] 220b                      move.l     a3,d1
[000359a2] 670c                      beq.s      $000359B0
[000359a4] 2a6b 0004                 movea.l    4(a3),a5
[000359a8] 204b                      movea.l    a3,a0
[000359aa] 7002                      moveq.l    #2,d0
[000359ac] 93c9                      suba.l     a1,a1
[000359ae] 4e95                      jsr        (a5)
[000359b0] 224a                      movea.l    a2,a1
[000359b2] 206c 0040                 movea.l    64(a4),a0
[000359b6] 4eb9 0003 3420            jsr        del_entry
[000359bc] 224a                      movea.l    a2,a1
[000359be] 204c                      movea.l    a4,a0
[000359c0] 4eb9 0001 7f52            jsr        objfree
[000359c6] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000359ca] 4e75                      rts
new_work:
[000359cc] 303c 2722                 move.w     #$2722,d0
[000359d0] 2279 000b 28e2            movea.l    $000B28E2,a1
[000359d6] 4eb9 0003 3dd6            jsr        work_icon
[000359dc] 4e75                      rts

	.data

mouse_obj:
[000cec5c]                           dc.w $0007
[000cec5e]                           dc.w $0007
[000cec60]                           dc.w $0001
[000cec62]                           dc.w $0000
[000cec64]                           dc.w $0001
[000cec66]                           dc.w $0100
[000cec68]                           dc.w $0100
[000cec6a]                           dc.w $0100
[000cec6c]                           dc.w $0100
[000cec6e]                           dc.w $0100
[000cec70]                           dc.w $0100
[000cec72]                           dc.w $0380
[000cec74]                           dc.w $fffe
[000cec76]                           dc.w $0380
[000cec78]                           dc.w $0100
[000cec7a]                           dc.w $0100
[000cec7c]                           dc.w $0100
[000cec7e]                           dc.w $0100
[000cec80]                           dc.w $0100
[000cec82]                           dc.w $0100
[000cec84]                           dc.w $0000
[000cec86]                           dc.w $0100
[000cec88]                           dc.w $0100
[000cec8a]                           dc.w $0100
[000cec8c]                           dc.w $0100
[000cec8e]                           dc.w $0100
[000cec90]                           dc.w $0100
[000cec92]                           dc.w $0280
[000cec94]                           dc.w $fc7e
[000cec96]                           dc.w $0280
[000cec98]                           dc.w $0100
[000cec9a]                           dc.w $0100
[000cec9c]                           dc.w $0100
[000cec9e]                           dc.w $0100
[000ceca0]                           dc.w $0100
[000ceca2]                           dc.w $0100
[000ceca4]                           dc.w $0000
protomouse:
[000ceca6]                           dc.w $0000
[000ceca8]                           dc.w $0000
[000cecaa] 000cec5c                  dc.l mouse_obj
[000cecae]                           dc.w $0000
[000cecb0]                           dc.w $0000
[000cecb2]                           dc.w $004a
[000cecb4]                           dc.w $0000
[000cecb6]                           dc.w $004a
[000cecb8]                           dc.w $0000
[000cecba]                           dc.w $0000
[000cecbc]                           dc.b 'MOUSE_01',0
[000cecc5]                           dc.b $00
[000cecc6]                           dc.w $0000
[000cecc8]                           dc.w $0000
[000cecca]                           dc.w $0000
[000ceccc]                           dc.w $0000
[000cecce]                           dc.w $0000
[000cecd0]                           dc.w $0000
[000cecd2]                           dc.w $0000
[000cecd4]                           dc.w $0000
[000cecd6]                           dc.w $0000
[000cecd8]                           dc.w $0000
[000cecda]                           dc.w $0000
[000cecdc]                           dc.w $0001
[000cecde]                           dc.w $0000
[000cece0]                           dc.w $0000
[000cece2]                           dc.w $0000
[000cece4]                           dc.w $0000
[000cece6]                           dc.w $0000
list_mouse:
[000cece8]                           dc.w $0000
[000cecea]                           dc.w $0000
[000cecec]                           dc.w $0000
[000cecee]                           dc.w $0000
[000cecf0] 000b2888                  dc.l WI_MOUSE
[000cecf4] 000cd05d                  dc.l mf_list
[000cecf8] 000cd070                  dc.l mf_name
[000cecfc]                           dc.w $2722
[000cecfe] 000ceca6                  dc.l protomouse
[000ced02] 0003594e                  dc.l copy_mouse
[000ced06] 0003598a                  dc.l del_mouse
[000ced0a] 000359cc                  dc.l new_work
[000ced0e]                           dc.w $0000
[000ced10]                           dc.w $0000
