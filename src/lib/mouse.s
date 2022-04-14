INmouse:
[0004ee10] 3039 000e 0c50            move.w     init,d0
[0004ee16] 5279 000e 0c50            addq.w     #1,init
[0004ee1c] 4a40                      tst.w      d0
[0004ee1e] 6704                      beq.s      $0004EE24
[0004ee20] 4240                      clr.w      d0
[0004ee22] 4e75                      rts
[0004ee24] 4279 0011 36c8            clr.w      hide
[0004ee2a] 4eb9 0004 ee96            jsr        Amo_point
[0004ee30] 4240                      clr.w      d0
[0004ee32] 4e75                      rts
TRmouse:
[0004ee34] 4eb9 0004 ee96            jsr        Amo_point
[0004ee3a] 4e75                      rts
Amo_new:
[0004ee3c] 2f0a                      move.l     a2,-(a7)
[0004ee3e] 594f                      subq.w     #4,a7
[0004ee40] 2e88                      move.l     a0,(a7)
[0004ee42] 2057                      movea.l    (a7),a0
[0004ee44] 3039 000e 0c52            move.w     prevmouse,d0
[0004ee4a] b050                      cmp.w      (a0),d0
[0004ee4c] 6610                      bne.s      $0004EE5E
[0004ee4e] 2057                      movea.l    (a7),a0
[0004ee50] 2279 000e 0c54            movea.l    $000E0C54,a1
[0004ee56] b3e8 0002                 cmpa.l     2(a0),a1
[0004ee5a] 6602                      bne.s      $0004EE5E
[0004ee5c] 6032                      bra.s      $0004EE90
[0004ee5e] 2057                      movea.l    (a7),a0
[0004ee60] 33d0 000e 0c52            move.w     (a0),prevmouse
[0004ee66] 2057                      movea.l    (a7),a0
[0004ee68] 23e8 0002 000e 0c54       move.l     2(a0),$000E0C54
[0004ee70] 3039 0011 36c8            move.w     hide,d0
[0004ee76] 6702                      beq.s      $0004EE7A
[0004ee78] 6016                      bra.s      $0004EE90
[0004ee7a] 2279 000e 692a            movea.l    _globl,a1
[0004ee80] 2057                      movea.l    (a7),a0
[0004ee82] 2068 0002                 movea.l    2(a0),a0
[0004ee86] 2457                      movea.l    (a7),a2
[0004ee88] 3012                      move.w     (a2),d0
[0004ee8a] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004ee90] 584f                      addq.w     #4,a7
[0004ee92] 245f                      movea.l    (a7)+,a2
[0004ee94] 4e75                      rts
Amo_point:
[0004ee96] 4279 0011 36ca            clr.w      busy
[0004ee9c] 6006                      bra.s      $0004EEA4
[0004ee9e] 4eb9 0004 ef66            jsr        Amo_show
[0004eea4] 3039 0011 36c8            move.w     hide,d0
[0004eeaa] 66f2                      bne.s      $0004EE9E
[0004eeac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004eeb2] 2068 023c                 movea.l    572(a0),a0
[0004eeb6] 41e8 0038                 lea.l      56(a0),a0
[0004eeba] 6100 ff80                 bsr.w      Amo_new
[0004eebe] 4e75                      rts
Amo_busy:
[0004eec0] 2f0a                      move.l     a2,-(a7)
[0004eec2] 594f                      subq.w     #4,a7
[0004eec4] 3039 0011 36ca            move.w     busy,d0
[0004eeca] 5279 0011 36ca            addq.w     #1,busy
[0004eed0] 4a40                      tst.w      d0
[0004eed2] 6702                      beq.s      $0004EED6
[0004eed4] 6030                      bra.s      $0004EF06
[0004eed6] 3039 0011 36c8            move.w     hide,d0
[0004eedc] 6702                      beq.s      $0004EEE0
[0004eede] 6026                      bra.s      $0004EF06
[0004eee0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004eee6] 2068 023c                 movea.l    572(a0),a0
[0004eeea] 41e8 003e                 lea.l      62(a0),a0
[0004eeee] 2e88                      move.l     a0,(a7)
[0004eef0] 2279 000e 692a            movea.l    _globl,a1
[0004eef6] 2057                      movea.l    (a7),a0
[0004eef8] 2068 0002                 movea.l    2(a0),a0
[0004eefc] 2457                      movea.l    (a7),a2
[0004eefe] 3012                      move.w     (a2),d0
[0004ef00] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004ef06] 584f                      addq.w     #4,a7
[0004ef08] 245f                      movea.l    (a7)+,a2
[0004ef0a] 4e75                      rts
Amo_unbusy:
[0004ef0c] 5379 0011 36ca            subq.w     #1,busy
[0004ef12] 6f02                      ble.s      $0004EF16
[0004ef14] 4e75                      rts
[0004ef16] 4279 0011 36ca            clr.w      busy
[0004ef1c] 3039 0011 36c8            move.w     hide,d0
[0004ef22] 6702                      beq.s      $0004EF26
[0004ef24] 4e75                      rts
[0004ef26] 2279 000e 692a            movea.l    _globl,a1
[0004ef2c] 2079 000e 0c54            movea.l    $000E0C54,a0
[0004ef32] 3039 000e 0c52            move.w     prevmouse,d0
[0004ef38] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004ef3e] 4e75                      rts
Amo_hide:
[0004ef40] 3039 0011 36c8            move.w     hide,d0
[0004ef46] 5279 0011 36c8            addq.w     #1,hide
[0004ef4c] 4a40                      tst.w      d0
[0004ef4e] 6702                      beq.s      $0004EF52
[0004ef50] 4e75                      rts
[0004ef52] 2279 000e 692a            movea.l    _globl,a1
[0004ef58] 91c8                      suba.l     a0,a0
[0004ef5a] 303c 0100                 move.w     #$0100,d0
[0004ef5e] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004ef64] 4e75                      rts
Amo_show:
[0004ef66] 5379 0011 36c8            subq.w     #1,hide
[0004ef6c] 6f02                      ble.s      $0004EF70
[0004ef6e] 4e75                      rts
[0004ef70] 4279 0011 36c8            clr.w      hide
[0004ef76] 2279 000e 692a            movea.l    _globl,a1
[0004ef7c] 91c8                      suba.l     a0,a0
[0004ef7e] 303c 0101                 move.w     #$0101,d0
[0004ef82] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004ef88] 2279 000e 692a            movea.l    _globl,a1
[0004ef8e] 2079 000e 0c54            movea.l    $000E0C54,a0
[0004ef94] 3039 000e 0c52            move.w     prevmouse,d0
[0004ef9a] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004efa0] 4e75                      rts
Amo_restart:
[0004efa2] 2f0a                      move.l     a2,-(a7)
[0004efa4] 4fef fff6                 lea.l      -10(a7),a7
[0004efa8] 2f48 0006                 move.l     a0,6(a7)
[0004efac] 3f79 0011 36ca 0004       move.w     busy,4(a7)
[0004efb4] 4279 0011 36ca            clr.w      busy
[0004efba] 206f 0006                 movea.l    6(a7),a0
[0004efbe] 30b9 000e 0c52            move.w     prevmouse,(a0)
[0004efc4] 206f 0006                 movea.l    6(a7),a0
[0004efc8] 2179 000e 0c54 0002       move.l     $000E0C54,2(a0)
[0004efd0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004efd6] 2068 023c                 movea.l    572(a0),a0
[0004efda] 41e8 0038                 lea.l      56(a0),a0
[0004efde] 2e88                      move.l     a0,(a7)
[0004efe0] 2279 000e 692a            movea.l    _globl,a1
[0004efe6] 2057                      movea.l    (a7),a0
[0004efe8] 2068 0002                 movea.l    2(a0),a0
[0004efec] 2457                      movea.l    (a7),a2
[0004efee] 3012                      move.w     (a2),d0
[0004eff0] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004eff6] 302f 0004                 move.w     4(a7),d0
[0004effa] 4fef 000a                 lea.l      10(a7),a7
[0004effe] 245f                      movea.l    (a7)+,a2
[0004f000] 4e75                      rts
Amo_return:
[0004f002] 2f0a                      move.l     a2,-(a7)
[0004f004] 5d4f                      subq.w     #6,a7
[0004f006] 3f40 0004                 move.w     d0,4(a7)
[0004f00a] 2e88                      move.l     a0,(a7)
[0004f00c] 33ef 0004 0011 36ca       move.w     4(a7),busy
[0004f014] 2057                      movea.l    (a7),a0
[0004f016] 33d0 000e 0c52            move.w     (a0),prevmouse
[0004f01c] 2057                      movea.l    (a7),a0
[0004f01e] 23e8 0002 000e 0c54       move.l     2(a0),$000E0C54
[0004f026] 3039 0011 36c8            move.w     hide,d0
[0004f02c] 6702                      beq.s      $0004F030
[0004f02e] 602e                      bra.s      $0004F05E
[0004f030] 3039 0011 36ca            move.w     busy,d0
[0004f036] 6710                      beq.s      $0004F048
[0004f038] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004f03e] 2068 023c                 movea.l    572(a0),a0
[0004f042] 41e8 003e                 lea.l      62(a0),a0
[0004f046] 2e88                      move.l     a0,(a7)
[0004f048] 2279 000e 692a            movea.l    _globl,a1
[0004f04e] 2057                      movea.l    (a7),a0
[0004f050] 2068 0002                 movea.l    2(a0),a0
[0004f054] 2457                      movea.l    (a7),a2
[0004f056] 3012                      move.w     (a2),d0
[0004f058] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0004f05e] 5c4f                      addq.w     #6,a7
[0004f060] 245f                      movea.l    (a7)+,a2
[0004f062] 4e75                      rts
