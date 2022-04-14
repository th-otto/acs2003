Avdi_getRGB:
[00043dee] 554f                      subq.w     #2,a7
[00043df0] 3e80                      move.w     d0,(a7)
[00043df2] 3017                      move.w     (a7),d0
[00043df4] 6b1c                      bmi.s      $00043E12
[00043df6] 0c57 0100                 cmpi.w     #$0100,(a7)
[00043dfa] 6c16                      bge.s      $00043E12
[00043dfc] 3217                      move.w     (a7),d1
[00043dfe] 3001                      move.w     d1,d0
[00043e00] d040                      add.w      d0,d0
[00043e02] d041                      add.w      d1,d0
[00043e04] d040                      add.w      d0,d0
[00043e06] 41f9 000d fd00            lea.l      vdi_color,a0
[00043e0c] d0c0                      adda.w     d0,a0
[00043e0e] 6006                      bra.s      $00043E16
[00043e10] 6004                      bra.s      $00043E16
[00043e12] 91c8                      suba.l     a0,a0
[00043e14] 4e71                      nop
[00043e16] 544f                      addq.w     #2,a7
[00043e18] 4e75                      rts
ACSInitLinea:
[00043e1a] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[00043e1e] a000                      ALINE      #$0000
[00043e20] 47f9 0010 f55e            lea.l      Linea,a3
[00043e26] 2688                      move.l     a0,(a3)
[00043e28] 41e8 fc72                 lea.l      -910(a0),a0
[00043e2c] 47f9 0010 f562            lea.l      Vdiesc,a3
[00043e32] 2688                      move.l     a0,(a3)
[00043e34] 47f9 0010 f566            lea.l      Fonts,a3
[00043e3a] 2689                      move.l     a1,(a3)
[00043e3c] 47f9 0010 f56a            lea.l      Linea_fu,a3
[00043e42] 268a                      move.l     a2,(a3)
[00043e44] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[00043e48] 4e75                      rts
mygemdos:
[00043e4a] 2078 04f2                 movea.l    ($000004F2).w,a0
[00043e4e] 2028 0028                 move.l     40(a0),d0
[00043e52] 0c68 0102 0002            cmpi.w     #$0102,2(a0)
[00043e58] 6c18                      bge.s      chg1
[00043e5a] 3028 001c                 move.w     28(a0),d0
[00043e5e] 41f8 602c                 lea.l      ($0000602C).w,a0
[00043e62] e248                      lsr.w      #1,d0
[00043e64] b07c 0004                 cmp.w      #$0004,d0
[00043e68] 6606                      bne.s      chg01
[00043e6a] 41f9 0000 873c            lea.l      $0000873C,a0
chg01:
[00043e70] 2008                      move.l     a0,d0
chg1:
[00043e72] 2040                      movea.l    d0,a0
[00043e74] 23d0 0010 f576            move.l     (a0),oldpd
[00043e7a] 23c8 0010 f57a            move.l     a0,_run
[00043e80] 20b9 000e 6dec            move.l     __bss,(a0)
[00043e86] 23ef 0002 0010 f56e       move.l     2(a7),oldret
[00043e8e] 2f7c 0004 3e9e 0002       move.l     #post,2(a7)
[00043e96] 2079 0010 f572            movea.l    oldvec,a0
[00043e9c] 4ed0                      jmp        (a0)
post:
[00043e9e] 2079 0010 f57a            movea.l    _run,a0
[00043ea4] 20b9 0010 f576            move.l     oldpd,(a0)
[00043eaa] 2079 0010 f56e            movea.l    oldret,a0
[00043eb0] 4ed0                      jmp        (a0)
unset:
[00043eb2] 21f9 0010 f57e 007c       move.l     sint7,($0000007C).w
[00043eba] 4e75                      rts
int7:
[00043ebc] 48e7 00c0                 movem.l    a0-a1,-(a7)
[00043ec0] 2279 0010 f57e            movea.l    sint7,a1
[00043ec6] 2079 0010 f57a            movea.l    _run,a0
[00043ecc] 20b9 0010 f576            move.l     oldpd,(a0)
[00043ed2] 4a78 059e                 tst.w      ($0000059E).w
[00043ed6] 6704                      beq.s      short
[00043ed8] 3f2f 000e                 move.w     14(a7),-(a7)
short:
[00043edc] 4879 0004 3ee6            pea.l      intret
[00043ee2] 40e7                      move.w     sr,-(a7)
[00043ee4] 4ed1                      jmp        (a1)
intret:
[00043ee6] 2079 0010 f57a            movea.l    _run,a0
[00043eec] 20b9 000e 6dec            move.l     __bss,(a0)
[00043ef2] 4cdf 0300                 movem.l    (a7)+,a0-a1
[00043ef6] 4e73                      rte
accgemdo:
[00043ef8] 4879 0004 3e4a            pea.l      mygemdos
[00043efe] 2f3c 0005 0021            move.l     #$00050021,-(a7)
[00043f04] 4e4d                      trap       #13
[00043f06] 508f                      addq.l     #8,a7
[00043f08] 23c0 0010 f572            move.l     d0,oldvec
[00043f0e] 4e75                      rts
oldgemdo:
[00043f10] 2f39 0010 f572            move.l     oldvec,-(a7)
[00043f16] 2f3c 0005 0021            move.l     #$00050021,-(a7)
[00043f1c] 4e4d                      trap       #13
[00043f1e] 508f                      addq.l     #8,a7
[00043f20] 4e75                      rts
