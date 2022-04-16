copy_pup:
[00035b30] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[00035b34] 2648                      movea.l    a0,a3
[00035b36] 2449                      movea.l    a1,a2
[00035b38] 202a 000e                 move.l     14(a2),d0
[00035b3c] 4eb9 0001 7fae            jsr        objmalloc
[00035b42] 2848                      movea.l    a0,a4
[00035b44] 200c                      move.l     a4,d0
[00035b46] 6604                      bne.s      copy_pup_1
[00035b48] 91c8                      suba.l     a0,a0
[00035b4a] 6046                      bra.s      copy_pup_2
copy_pup_1:
[00035b4c] 202a 000e                 move.l     14(a2),d0
[00035b50] 7238                      moveq.l    #56,d1
[00035b52] 4eb9 0008 3c5a            jsr        _uldiv
[00035b58] 2600                      move.l     d0,d3
[00035b5a] 2a6a 0004                 movea.l    4(a2),a5
[00035b5e] 2c6c 0004                 movea.l    4(a4),a6
[00035b62] 4244                      clr.w      d4
[00035b64] 6020                      bra.s      copy_pup_3
copy_pup_4:
[00035b66] 3204                      move.w     d4,d1
[00035b68] 48c1                      ext.l      d1
[00035b6a] 2001                      move.l     d1,d0
[00035b6c] e788                      lsl.l      #3,d0
[00035b6e] 9081                      sub.l      d1,d0
[00035b70] e788                      lsl.l      #3,d0
[00035b72] 4875 0800                 pea.l      0(a5,d0.l)
[00035b76] 43f6 0800                 lea.l      0(a6,d0.l),a1
[00035b7a] 204b                      movea.l    a3,a0
[00035b7c] 4eb9 0002 cf48            jsr        copy_ob
[00035b82] 584f                      addq.w     #4,a7
[00035b84] 5244                      addq.w     #1,d4
copy_pup_3:
[00035b86] b644                      cmp.w      d4,d3
[00035b88] 6edc                      bgt.s      copy_pup_4
[00035b8a] 296a 000e 000e            move.l     14(a2),14(a4)
[00035b90] 204c                      movea.l    a4,a0
copy_pup_2:
[00035b92] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[00035b96] 4e75                      rts

del_pup:
[00035b98] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00035b9c] 2448                      movea.l    a0,a2
[00035b9e] 2649                      movea.l    a1,a3
[00035ba0] 006a 0001 0006            ori.w      #$0001,6(a2)
[00035ba6] 536b 0036                 subq.w     #1,54(a3)
[00035baa] 302b 0036                 move.w     54(a3),d0
[00035bae] 6e5e                      bgt.s      del_pup_1
[00035bb0] 286b 0012                 movea.l    18(a3),a4
[00035bb4] 220c                      move.l     a4,d1
[00035bb6] 670c                      beq.s      del_pup_2
[00035bb8] 2a6c 0004                 movea.l    4(a4),a5
[00035bbc] 204c                      movea.l    a4,a0
[00035bbe] 7002                      moveq.l    #2,d0
[00035bc0] 93c9                      suba.l     a1,a1
[00035bc2] 4e95                      jsr        (a5)
del_pup_2:
[00035bc4] 202b 000e                 move.l     14(a3),d0
[00035bc8] 7238                      moveq.l    #56,d1
[00035bca] 4eb9 0008 3c5a            jsr        _uldiv
[00035bd0] 2600                      move.l     d0,d3
[00035bd2] 286b 0004                 movea.l    4(a3),a4
[00035bd6] 4244                      clr.w      d4
[00035bd8] 601a                      bra.s      del_pup_3
del_pup_4:
[00035bda] 3204                      move.w     d4,d1
[00035bdc] 48c1                      ext.l      d1
[00035bde] 2001                      move.l     d1,d0
[00035be0] e788                      lsl.l      #3,d0
[00035be2] 9081                      sub.l      d1,d0
[00035be4] e788                      lsl.l      #3,d0
[00035be6] 43f4 0800                 lea.l      0(a4,d0.l),a1
[00035bea] 204a                      movea.l    a2,a0
[00035bec] 4eb9 0002 d214            jsr        del_ob
[00035bf2] 5244                      addq.w     #1,d4
del_pup_3:
[00035bf4] b644                      cmp.w      d4,d3
[00035bf6] 6ee2                      bgt.s      del_pup_4
[00035bf8] 224b                      movea.l    a3,a1
[00035bfa] 206a 0020                 movea.l    32(a2),a0
[00035bfe] 4eb9 0003 3420            jsr        del_entry
[00035c04] 224b                      movea.l    a3,a1
[00035c06] 204a                      movea.l    a2,a0
[00035c08] 4eb9 0001 7f52            jsr        objfree
del_pup_1:
[00035c0e] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00035c12] 4e75                      rts

new_work:
[00035c14] 303c 2712                 move.w     #$2712,d0
[00035c18] 2279 000c 8ed8            movea.l    $000C8ED8,a1
[00035c1e] 4eb9 0003 3dd6            jsr        work_icon
[00035c24] 4e75                      rts

	.data

protopup:
[000cedb6]                           dc.w $0000
[000cedb8]                           dc.w $0000
[000cedba]                           dc.w $0000
[000cedbc]                           dc.w $0000
[000cedbe]                           dc.w $ffff
[000cedc0]                           dc.w $ffff
[000cedc2]                           dc.w $ffff
[000cedc4]                           dc.w $0014
[000cedc6]                           dc.w $0000
[000cedc8]                           dc.w $0020
[000cedca]                           dc.w $00ff
[000cedcc]                           dc.w $1100
[000cedce]                           dc.w $0000
[000cedd0]                           dc.w $0000
[000cedd2]                           dc.w $000c
[000cedd4]                           dc.w $0006
[000cedd6]                           dc.w $0000
[000cedd8]                           dc.w $0000
[000cedda]                           dc.w $0000
[000ceddc]                           dc.w $0000
[000cedde]                           dc.w $8000
[000cede0]                           dc.w $0000
[000cede2]                           dc.w $0000
[000cede4]                           dc.w $0000
[000cede6]                           dc.w $0000
[000cede8]                           dc.w $0000
[000cedea]                           dc.w $0000
[000cedec]                           dc.w $0000
protopopup:
[000cedee]                           dc.w $0000
[000cedf0]                           dc.w $0000
[000cedf2] 000cedb6                  dc.l protopup
[000cedf6]                           dc.w $0000
[000cedf8]                           dc.w $0000
[000cedfa]                           dc.w $0038
[000cedfc]                           dc.w $0000
[000cedfe]                           dc.w $0038
[000cee00]                           dc.w $0000
[000cee02]                           dc.w $0000
[000cee04]                           dc.b 'POPUP_01',0
[000cee0d]                           dc.b $00
[000cee0e]                           dc.w $0000
[000cee10]                           dc.w $0000
[000cee12]                           dc.w $0000
[000cee14]                           dc.w $0000
[000cee16]                           dc.w $0000
[000cee18]                           dc.w $0000
[000cee1a]                           dc.w $0000
[000cee1c]                           dc.w $0000
[000cee1e]                           dc.w $0000
[000cee20]                           dc.w $0000
[000cee22]                           dc.w $0000
[000cee24]                           dc.w $0001
[000cee26]                           dc.w $0000
[000cee28]                           dc.w $0000
[000cee2a]                           dc.w $0000
[000cee2c]                           dc.w $0000
[000cee2e]                           dc.w $0000
list_popup:
[000cee30]                           dc.w $0000
[000cee32]                           dc.w $0000
[000cee34]                           dc.w $0000
[000cee36]                           dc.w $0000
[000cee38] 000c8e7e                  dc.l WI_POPUP
[000cee3c] 000cd0bd                  dc.l pu_list
[000cee40] 000cd0cb                  dc.l pu_name
[000cee44]                           dc.w $2712
[000cee46] 000cedee                  dc.l protopopup
[000cee4a] 00035b30                  dc.l copy_pup
[000cee4e] 00035b98                  dc.l del_pup
[000cee52] 00035c14                  dc.l new_work
[000cee56]                           dc.w $0000
[000cee58]                           dc.w $0000
