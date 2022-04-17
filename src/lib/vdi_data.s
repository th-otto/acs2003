	.globl Avdi_getRGB
Avdi_getRGB:
[00043dee] 554f                      subq.w     #2,a7
[00043df0] 3e80                      move.w     d0,(a7)
[00043df2] 3017                      move.w     (a7),d0
[00043df4] 6b1c                      bmi.s      Avdi_getRGB_1
[00043df6] 0c57 0100                 cmpi.w     #$0100,(a7)
[00043dfa] 6c16                      bge.s      Avdi_getRGB_1
[00043dfc] 3217                      move.w     (a7),d1
[00043dfe] 3001                      move.w     d1,d0
[00043e00] d040                      add.w      d0,d0
[00043e02] d041                      add.w      d1,d0
[00043e04] d040                      add.w      d0,d0
[00043e06] 41f9 000d fd00            lea.l      vdi_color,a0
[00043e0c] d0c0                      adda.w     d0,a0
[00043e0e] 6006                      bra.s      Avdi_getRGB_2
[00043e10] 6004                      bra.s      Avdi_getRGB_2
Avdi_getRGB_1:
[00043e12] 91c8                      suba.l     a0,a0
[00043e14] 4e71                      nop
Avdi_getRGB_2:
[00043e16] 544f                      addq.w     #2,a7
[00043e18] 4e75                      rts

	.globl ACSInitL
ACSInitL:
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

	.globl accgemdos
accgemdos:
[00043ef8] 4879 0004 3e4a            pea.l      mygemdos
[00043efe] 2f3c 0005 0021            move.l     #$00050021,-(a7)
[00043f04] 4e4d                      trap       #13
[00043f06] 508f                      addq.l     #8,a7
[00043f08] 23c0 0010 f572            move.l     d0,oldvec
[00043f0e] 4e75                      rts

	.globl oldgemdos
oldgemdos:
[00043f10] 2f39 0010 f572            move.l     oldvec,-(a7)
[00043f16] 2f3c 0005 0021            move.l     #$00050021,-(a7)
[00043f1c] 4e4d                      trap       #13
[00043f1e] 508f                      addq.l     #8,a7
[00043f20] 4e75                      rts

	.data

vdi_color:
[000dfd00]                           dc.w $03e8
[000dfd02]                           dc.w $03e8
[000dfd04]                           dc.w $03e8
[000dfd06]                           dc.w $0000
[000dfd08]                           dc.w $0000
[000dfd0a]                           dc.w $0000
[000dfd0c]                           dc.w $03b5
[000dfd0e]                           dc.w $0000
[000dfd10]                           dc.w $0000
[000dfd12]                           dc.w $0000
[000dfd14]                           dc.w $0386
[000dfd16]                           dc.w $0000
[000dfd18]                           dc.w $0000
[000dfd1a]                           dc.w $0000
[000dfd1c]                           dc.w $03b5
[000dfd1e]                           dc.w $0066
[000dfd20]                           dc.w $031c
[000dfd22]                           dc.w $02dd
[000dfd24]                           dc.w $03e8
[000dfd26]                           dc.w $03e8
[000dfd28]                           dc.w $0000
[000dfd2a]                           dc.w $0386
[000dfd2c]                           dc.w $00c8
[000dfd2e]                           dc.w $0258
[000dfd30]                           dc.w $0353
[000dfd32]                           dc.w $0353
[000dfd34]                           dc.w $0353
[000dfd36]                           dc.w $01f6
[000dfd38]                           dc.w $01f6
[000dfd3a]                           dc.w $01f6
[000dfd3c]                           dc.w $01f6
[000dfd3e]                           dc.w $0000
[000dfd40]                           dc.w $0000
[000dfd42]                           dc.w $0000
[000dfd44]                           dc.w $01f6
[000dfd46]                           dc.w $0000
[000dfd48]                           dc.w $0000
[000dfd4a]                           dc.w $0000
[000dfd4c]                           dc.w $01f6
[000dfd4e]                           dc.w $0000
[000dfd50]                           dc.w $01f6
[000dfd52]                           dc.w $01f6
[000dfd54]                           dc.w $02ca
[000dfd56]                           dc.w $027b
[000dfd58]                           dc.w $00e0
[000dfd5a]                           dc.w $01f6
[000dfd5c]                           dc.w $0000
[000dfd5e]                           dc.w $01f6
[000dfd60]                           dc.w $0000
[000dfd62]                           dc.w $0000
[000dfd64]                           dc.w $00c8
[000dfd66]                           dc.w $0000
[000dfd68]                           dc.w $0000
[000dfd6a]                           dc.w $0190
[000dfd6c]                           dc.w $0000
[000dfd6e]                           dc.w $0000
[000dfd70]                           dc.w $0258
[000dfd72]                           dc.w $0000
[000dfd74]                           dc.w $0000
[000dfd76]                           dc.w $0320
[000dfd78]                           dc.w $0000
[000dfd7a]                           dc.w $0000
[000dfd7c]                           dc.w $03e8
[000dfd7e]                           dc.w $0000
[000dfd80]                           dc.w $00c8
[000dfd82]                           dc.w $0000
[000dfd84]                           dc.w $0000
[000dfd86]                           dc.w $00c8
[000dfd88]                           dc.w $00c8
[000dfd8a]                           dc.w $0000
[000dfd8c]                           dc.w $00c8
[000dfd8e]                           dc.w $0190
[000dfd90]                           dc.w $0000
[000dfd92]                           dc.w $00c8
[000dfd94]                           dc.w $0258
[000dfd96]                           dc.w $0000
[000dfd98]                           dc.w $00c8
[000dfd9a]                           dc.w $0320
[000dfd9c]                           dc.w $0000
[000dfd9e]                           dc.w $00c8
[000dfda0]                           dc.w $03e8
[000dfda2]                           dc.w $0000
[000dfda4]                           dc.w $0190
[000dfda6]                           dc.w $0000
[000dfda8]                           dc.w $0000
[000dfdaa]                           dc.w $0190
[000dfdac]                           dc.w $00c8
[000dfdae]                           dc.w $0000
[000dfdb0]                           dc.w $0190
[000dfdb2]                           dc.w $0190
[000dfdb4]                           dc.w $0000
[000dfdb6]                           dc.w $0190
[000dfdb8]                           dc.w $0258
[000dfdba]                           dc.w $0000
[000dfdbc]                           dc.w $0190
[000dfdbe]                           dc.w $0320
[000dfdc0]                           dc.w $0000
[000dfdc2]                           dc.w $0190
[000dfdc4]                           dc.w $03e8
[000dfdc6]                           dc.w $0000
[000dfdc8]                           dc.w $0258
[000dfdca]                           dc.w $0000
[000dfdcc]                           dc.w $0000
[000dfdce]                           dc.w $0258
[000dfdd0]                           dc.w $00c8
[000dfdd2]                           dc.w $0000
[000dfdd4]                           dc.w $0258
[000dfdd6]                           dc.w $0190
[000dfdd8]                           dc.w $0000
[000dfdda]                           dc.w $0258
[000dfddc]                           dc.w $0258
[000dfdde]                           dc.w $0000
[000dfde0]                           dc.w $0258
[000dfde2]                           dc.w $0320
[000dfde4]                           dc.w $0000
[000dfde6]                           dc.w $0258
[000dfde8]                           dc.w $03e8
[000dfdea]                           dc.w $0000
[000dfdec]                           dc.w $0320
[000dfdee]                           dc.w $0000
[000dfdf0]                           dc.w $0000
[000dfdf2]                           dc.w $0320
[000dfdf4]                           dc.w $00c8
[000dfdf6]                           dc.w $0000
[000dfdf8]                           dc.w $0320
[000dfdfa]                           dc.w $0190
[000dfdfc]                           dc.w $0000
[000dfdfe]                           dc.w $0320
[000dfe00]                           dc.w $0258
[000dfe02]                           dc.w $0000
[000dfe04]                           dc.w $0320
[000dfe06]                           dc.w $0320
[000dfe08]                           dc.w $0000
[000dfe0a]                           dc.w $0320
[000dfe0c]                           dc.w $03e8
[000dfe0e]                           dc.w $0000
[000dfe10]                           dc.w $03e8
[000dfe12]                           dc.w $0000
[000dfe14]                           dc.w $0000
[000dfe16]                           dc.w $03e8
[000dfe18]                           dc.w $00c8
[000dfe1a]                           dc.w $0000
[000dfe1c]                           dc.w $03e8
[000dfe1e]                           dc.w $0190
[000dfe20]                           dc.w $0000
[000dfe22]                           dc.w $03e8
[000dfe24]                           dc.w $0258
[000dfe26]                           dc.w $0000
[000dfe28]                           dc.w $03e8
[000dfe2a]                           dc.w $0320
[000dfe2c]                           dc.w $0000
[000dfe2e]                           dc.w $03e8
[000dfe30]                           dc.w $03e8
[000dfe32]                           dc.w $00c8
[000dfe34]                           dc.w $0000
[000dfe36]                           dc.w $0000
[000dfe38]                           dc.w $00c8
[000dfe3a]                           dc.w $0000
[000dfe3c]                           dc.w $00c8
[000dfe3e]                           dc.w $00c8
[000dfe40]                           dc.w $0000
[000dfe42]                           dc.w $0190
[000dfe44]                           dc.w $00c8
[000dfe46]                           dc.w $0000
[000dfe48]                           dc.w $0258
[000dfe4a]                           dc.w $00c8
[000dfe4c]                           dc.w $0000
[000dfe4e]                           dc.w $0320
[000dfe50]                           dc.w $00c8
[000dfe52]                           dc.w $0000
[000dfe54]                           dc.w $03e8
[000dfe56]                           dc.w $00c8
[000dfe58]                           dc.w $00c8
[000dfe5a]                           dc.w $0000
[000dfe5c]                           dc.w $00c8
[000dfe5e]                           dc.w $00c8
[000dfe60]                           dc.w $00c8
[000dfe62]                           dc.w $00c8
[000dfe64]                           dc.w $00c8
[000dfe66]                           dc.w $0190
[000dfe68]                           dc.w $0000
[000dfe6a]                           dc.w $0000
[000dfe6c]                           dc.w $02f1
[000dfe6e]                           dc.w $00c8
[000dfe70]                           dc.w $00c8
[000dfe72]                           dc.w $0320
[000dfe74]                           dc.w $00c8
[000dfe76]                           dc.w $00c8
[000dfe78]                           dc.w $03e8
[000dfe7a]                           dc.w $00c8
[000dfe7c]                           dc.w $0190
[000dfe7e]                           dc.w $0000
[000dfe80]                           dc.w $00c8
[000dfe82]                           dc.w $0190
[000dfe84]                           dc.w $00c8
[000dfe86]                           dc.w $00c8
[000dfe88]                           dc.w $0190
[000dfe8a]                           dc.w $0190
[000dfe8c]                           dc.w $00c8
[000dfe8e]                           dc.w $0190
[000dfe90]                           dc.w $0258
[000dfe92]                           dc.w $00c8
[000dfe94]                           dc.w $0190
[000dfe96]                           dc.w $0320
[000dfe98]                           dc.w $00c8
[000dfe9a]                           dc.w $0190
[000dfe9c]                           dc.w $03e8
[000dfe9e]                           dc.w $00c8
[000dfea0]                           dc.w $0258
[000dfea2]                           dc.w $0000
[000dfea4]                           dc.w $00c8
[000dfea6]                           dc.w $0258
[000dfea8]                           dc.w $00c8
[000dfeaa]                           dc.w $00c8
[000dfeac]                           dc.w $0258
[000dfeae]                           dc.w $0190
[000dfeb0]                           dc.w $00c8
[000dfeb2]                           dc.w $0258
[000dfeb4]                           dc.w $0258
[000dfeb6]                           dc.w $00c8
[000dfeb8]                           dc.w $0258
[000dfeba]                           dc.w $0320
[000dfebc]                           dc.w $00c8
[000dfebe]                           dc.w $0258
[000dfec0]                           dc.w $03e8
[000dfec2]                           dc.w $00c8
[000dfec4]                           dc.w $0320
[000dfec6]                           dc.w $0000
[000dfec8]                           dc.w $00c8
[000dfeca]                           dc.w $0320
[000dfecc]                           dc.w $00c8
[000dfece]                           dc.w $00c8
[000dfed0]                           dc.w $0320
[000dfed2]                           dc.w $0190
[000dfed4]                           dc.w $00c8
[000dfed6]                           dc.w $0320
[000dfed8]                           dc.w $0258
[000dfeda]                           dc.w $00c8
[000dfedc]                           dc.w $0320
[000dfede]                           dc.w $0320
[000dfee0]                           dc.w $00c8
[000dfee2]                           dc.w $0320
[000dfee4]                           dc.w $03e8
[000dfee6]                           dc.w $00c8
[000dfee8]                           dc.w $03e8
[000dfeea]                           dc.w $0000
[000dfeec]                           dc.w $00c8
[000dfeee]                           dc.w $03e8
[000dfef0]                           dc.w $00c8
[000dfef2]                           dc.w $00c8
[000dfef4]                           dc.w $03e8
[000dfef6]                           dc.w $0190
[000dfef8]                           dc.w $00c8
[000dfefa]                           dc.w $03e8
[000dfefc]                           dc.w $0258
[000dfefe]                           dc.w $00c8
[000dff00]                           dc.w $03e8
[000dff02]                           dc.w $0320
[000dff04]                           dc.w $00c8
[000dff06]                           dc.w $03e8
[000dff08]                           dc.w $03e8
[000dff0a]                           dc.w $0190
[000dff0c]                           dc.w $0000
[000dff0e]                           dc.w $0000
[000dff10]                           dc.w $0190
[000dff12]                           dc.w $0000
[000dff14]                           dc.w $00c8
[000dff16]                           dc.w $0190
[000dff18]                           dc.w $0000
[000dff1a]                           dc.w $0190
[000dff1c]                           dc.w $0190
[000dff1e]                           dc.w $0000
[000dff20]                           dc.w $0258
[000dff22]                           dc.w $0190
[000dff24]                           dc.w $0000
[000dff26]                           dc.w $0320
[000dff28]                           dc.w $0190
[000dff2a]                           dc.w $0000
[000dff2c]                           dc.w $03e8
[000dff2e]                           dc.w $0190
[000dff30]                           dc.w $00c8
[000dff32]                           dc.w $0000
[000dff34]                           dc.w $0190
[000dff36]                           dc.w $00c8
[000dff38]                           dc.w $00c8
[000dff3a]                           dc.w $0190
[000dff3c]                           dc.w $00c8
[000dff3e]                           dc.w $0190
[000dff40]                           dc.w $0190
[000dff42]                           dc.w $00c8
[000dff44]                           dc.w $0258
[000dff46]                           dc.w $0190
[000dff48]                           dc.w $00c8
[000dff4a]                           dc.w $0320
[000dff4c]                           dc.w $0190
[000dff4e]                           dc.w $00c8
[000dff50]                           dc.w $03e8
[000dff52]                           dc.w $0190
[000dff54]                           dc.w $0190
[000dff56]                           dc.w $0000
[000dff58]                           dc.w $0190
[000dff5a]                           dc.w $0190
[000dff5c]                           dc.w $00c8
[000dff5e]                           dc.w $0190
[000dff60]                           dc.w $0190
[000dff62]                           dc.w $0190
[000dff64]                           dc.w $0190
[000dff66]                           dc.w $0190
[000dff68]                           dc.w $0258
[000dff6a]                           dc.w $0190
[000dff6c]                           dc.w $0190
[000dff6e]                           dc.w $0320
[000dff70]                           dc.w $0190
[000dff72]                           dc.w $0190
[000dff74]                           dc.w $03e8
[000dff76]                           dc.w $0190
[000dff78]                           dc.w $0258
[000dff7a]                           dc.w $0000
[000dff7c]                           dc.w $0190
[000dff7e]                           dc.w $0258
[000dff80]                           dc.w $00c8
[000dff82]                           dc.w $0190
[000dff84]                           dc.w $0258
[000dff86]                           dc.w $0190
[000dff88]                           dc.w $0190
[000dff8a]                           dc.w $0258
[000dff8c]                           dc.w $0258
[000dff8e]                           dc.w $0190
[000dff90]                           dc.w $0258
[000dff92]                           dc.w $0320
[000dff94]                           dc.w $0190
[000dff96]                           dc.w $0258
[000dff98]                           dc.w $03e8
[000dff9a]                           dc.w $0190
[000dff9c]                           dc.w $0320
[000dff9e]                           dc.w $0000
[000dffa0]                           dc.w $0190
[000dffa2]                           dc.w $0320
[000dffa4]                           dc.w $00c8
[000dffa6]                           dc.w $0190
[000dffa8]                           dc.w $0320
[000dffaa]                           dc.w $0190
[000dffac]                           dc.w $0190
[000dffae]                           dc.w $0320
[000dffb0]                           dc.w $0258
[000dffb2]                           dc.w $0190
[000dffb4]                           dc.w $0320
[000dffb6]                           dc.w $0320
[000dffb8]                           dc.w $0190
[000dffba]                           dc.w $0320
[000dffbc]                           dc.w $03e8
[000dffbe]                           dc.w $0190
[000dffc0]                           dc.w $03e8
[000dffc2]                           dc.w $0000
[000dffc4]                           dc.w $0190
[000dffc6]                           dc.w $03e8
[000dffc8]                           dc.w $00c8
[000dffca]                           dc.w $0190
[000dffcc]                           dc.w $03e8
[000dffce]                           dc.w $0190
[000dffd0]                           dc.w $0190
[000dffd2]                           dc.w $03e8
[000dffd4]                           dc.w $0258
[000dffd6]                           dc.w $0190
[000dffd8]                           dc.w $03e8
[000dffda]                           dc.w $0320
[000dffdc]                           dc.w $0190
[000dffde]                           dc.w $03e8
[000dffe0]                           dc.w $03e8
[000dffe2]                           dc.w $0258
[000dffe4]                           dc.w $0000
[000dffe6]                           dc.w $0000
[000dffe8]                           dc.w $0258
[000dffea]                           dc.w $0000
[000dffec]                           dc.w $00c8
[000dffee]                           dc.w $0258
[000dfff0]                           dc.w $0000
[000dfff2]                           dc.w $0190
[000dfff4]                           dc.w $0258
[000dfff6]                           dc.w $0000
[000dfff8]                           dc.w $0258
[000dfffa]                           dc.w $0258
[000dfffc]                           dc.w $0000
[000dfffe]                           dc.w $0320
[000e0000]                           dc.w $0258
[000e0002]                           dc.w $0000
[000e0004]                           dc.w $03e8
[000e0006]                           dc.w $0258
[000e0008]                           dc.w $00c8
[000e000a]                           dc.w $0000
[000e000c]                           dc.w $0258
[000e000e]                           dc.w $00c8
[000e0010]                           dc.w $00c8
[000e0012]                           dc.w $0258
[000e0014]                           dc.w $00c8
[000e0016]                           dc.w $0190
[000e0018]                           dc.w $0258
[000e001a]                           dc.w $00c8
[000e001c]                           dc.w $0258
[000e001e]                           dc.w $0258
[000e0020]                           dc.w $00c8
[000e0022]                           dc.w $0320
[000e0024]                           dc.w $0258
[000e0026]                           dc.w $00c8
[000e0028]                           dc.w $03e8
[000e002a]                           dc.w $0258
[000e002c]                           dc.w $0190
[000e002e]                           dc.w $0000
[000e0030]                           dc.w $0258
[000e0032]                           dc.w $0190
[000e0034]                           dc.w $00c8
[000e0036]                           dc.w $0258
[000e0038]                           dc.w $0190
[000e003a]                           dc.w $0190
[000e003c]                           dc.w $0258
[000e003e]                           dc.w $0190
[000e0040]                           dc.w $0258
[000e0042]                           dc.w $0258
[000e0044]                           dc.w $0190
[000e0046]                           dc.w $0320
[000e0048]                           dc.w $0258
[000e004a]                           dc.w $0190
[000e004c]                           dc.w $03e8
[000e004e]                           dc.w $0258
[000e0050]                           dc.w $0258
[000e0052]                           dc.w $0000
[000e0054]                           dc.w $0258
[000e0056]                           dc.w $0258
[000e0058]                           dc.w $00c8
[000e005a]                           dc.w $0258
[000e005c]                           dc.w $0258
[000e005e]                           dc.w $0190
[000e0060]                           dc.w $0258
[000e0062]                           dc.w $0258
[000e0064]                           dc.w $0258
[000e0066]                           dc.w $0258
[000e0068]                           dc.w $0258
[000e006a]                           dc.w $0320
[000e006c]                           dc.w $0258
[000e006e]                           dc.w $0258
[000e0070]                           dc.w $03e8
[000e0072]                           dc.w $0258
[000e0074]                           dc.w $0320
[000e0076]                           dc.w $0000
[000e0078]                           dc.w $0258
[000e007a]                           dc.w $0320
[000e007c]                           dc.w $00c8
[000e007e]                           dc.w $0258
[000e0080]                           dc.w $0320
[000e0082]                           dc.w $0190
[000e0084]                           dc.w $0258
[000e0086]                           dc.w $0320
[000e0088]                           dc.w $0258
[000e008a]                           dc.w $0258
[000e008c]                           dc.w $0320
[000e008e]                           dc.w $0320
[000e0090]                           dc.w $0258
[000e0092]                           dc.w $0320
[000e0094]                           dc.w $03e8
[000e0096]                           dc.w $0258
[000e0098]                           dc.w $03e8
[000e009a]                           dc.w $0000
[000e009c]                           dc.w $0258
[000e009e]                           dc.w $03e8
[000e00a0]                           dc.w $00c8
[000e00a2]                           dc.w $0258
[000e00a4]                           dc.w $03e8
[000e00a6]                           dc.w $0190
[000e00a8]                           dc.w $0258
[000e00aa]                           dc.w $03e8
[000e00ac]                           dc.w $0258
[000e00ae]                           dc.w $0258
[000e00b0]                           dc.w $03e8
[000e00b2]                           dc.w $0320
[000e00b4]                           dc.w $0258
[000e00b6]                           dc.w $03e8
[000e00b8]                           dc.w $03e8
[000e00ba]                           dc.w $0320
[000e00bc]                           dc.w $0000
[000e00be]                           dc.w $0000
[000e00c0]                           dc.w $0320
[000e00c2]                           dc.w $0000
[000e00c4]                           dc.w $00c8
[000e00c6]                           dc.w $0320
[000e00c8]                           dc.w $0000
[000e00ca]                           dc.w $0190
[000e00cc]                           dc.w $0320
[000e00ce]                           dc.w $0000
[000e00d0]                           dc.w $0258
[000e00d2]                           dc.w $0320
[000e00d4]                           dc.w $0000
[000e00d6]                           dc.w $0320
[000e00d8]                           dc.w $0320
[000e00da]                           dc.w $0000
[000e00dc]                           dc.w $03e8
[000e00de]                           dc.w $0320
[000e00e0]                           dc.w $00c8
[000e00e2]                           dc.w $0000
[000e00e4]                           dc.w $0320
[000e00e6]                           dc.w $00c8
[000e00e8]                           dc.w $00c8
[000e00ea]                           dc.w $0320
[000e00ec]                           dc.w $00c8
[000e00ee]                           dc.w $0190
[000e00f0]                           dc.w $0320
[000e00f2]                           dc.w $00c8
[000e00f4]                           dc.w $0258
[000e00f6]                           dc.w $0320
[000e00f8]                           dc.w $00c8
[000e00fa]                           dc.w $0320
[000e00fc]                           dc.w $0320
[000e00fe]                           dc.w $00c8
[000e0100]                           dc.w $03e8
[000e0102]                           dc.w $0320
[000e0104]                           dc.w $0190
[000e0106]                           dc.w $0000
[000e0108]                           dc.w $0320
[000e010a]                           dc.w $0190
[000e010c]                           dc.w $00c8
[000e010e]                           dc.w $0320
[000e0110]                           dc.w $0190
[000e0112]                           dc.w $0190
[000e0114]                           dc.w $0320
[000e0116]                           dc.w $0190
[000e0118]                           dc.w $0258
[000e011a]                           dc.w $0320
[000e011c]                           dc.w $0190
[000e011e]                           dc.w $0320
[000e0120]                           dc.w $0320
[000e0122]                           dc.w $0190
[000e0124]                           dc.w $03e8
[000e0126]                           dc.w $0320
[000e0128]                           dc.w $0258
[000e012a]                           dc.w $0000
[000e012c]                           dc.w $0320
[000e012e]                           dc.w $0258
[000e0130]                           dc.w $00c8
[000e0132]                           dc.w $0320
[000e0134]                           dc.w $0258
[000e0136]                           dc.w $0190
[000e0138]                           dc.w $0320
[000e013a]                           dc.w $0258
[000e013c]                           dc.w $0258
[000e013e]                           dc.w $0320
[000e0140]                           dc.w $0258
[000e0142]                           dc.w $0320
[000e0144]                           dc.w $0320
[000e0146]                           dc.w $0258
[000e0148]                           dc.w $03e8
[000e014a]                           dc.w $0320
[000e014c]                           dc.w $0320
[000e014e]                           dc.w $0000
[000e0150]                           dc.w $0320
[000e0152]                           dc.w $0320
[000e0154]                           dc.w $00c8
[000e0156]                           dc.w $0320
[000e0158]                           dc.w $0320
[000e015a]                           dc.w $0190
[000e015c]                           dc.w $0320
[000e015e]                           dc.w $0320
[000e0160]                           dc.w $0258
[000e0162]                           dc.w $0320
[000e0164]                           dc.w $0320
[000e0166]                           dc.w $0320
[000e0168]                           dc.w $0320
[000e016a]                           dc.w $0320
[000e016c]                           dc.w $03e8
[000e016e]                           dc.w $0320
[000e0170]                           dc.w $03e8
[000e0172]                           dc.w $0000
[000e0174]                           dc.w $0320
[000e0176]                           dc.w $03e8
[000e0178]                           dc.w $00c8
[000e017a]                           dc.w $0320
[000e017c]                           dc.w $03e8
[000e017e]                           dc.w $0190
[000e0180]                           dc.w $0320
[000e0182]                           dc.w $03e8
[000e0184]                           dc.w $0258
[000e0186]                           dc.w $0320
[000e0188]                           dc.w $03e8
[000e018a]                           dc.w $0320
[000e018c]                           dc.w $0320
[000e018e]                           dc.w $03e8
[000e0190]                           dc.w $03e8
[000e0192]                           dc.w $03e8
[000e0194]                           dc.w $0000
[000e0196]                           dc.w $0000
[000e0198]                           dc.w $03e8
[000e019a]                           dc.w $0000
[000e019c]                           dc.w $00c8
[000e019e]                           dc.w $03e8
[000e01a0]                           dc.w $0000
[000e01a2]                           dc.w $0190
[000e01a4]                           dc.w $03e8
[000e01a6]                           dc.w $0000
[000e01a8]                           dc.w $0258
[000e01aa]                           dc.w $03e8
[000e01ac]                           dc.w $0000
[000e01ae]                           dc.w $0320
[000e01b0]                           dc.w $03e8
[000e01b2]                           dc.w $0000
[000e01b4]                           dc.w $03e8
[000e01b6]                           dc.w $03e8
[000e01b8]                           dc.w $00c8
[000e01ba]                           dc.w $0000
[000e01bc]                           dc.w $03e8
[000e01be]                           dc.w $00c8
[000e01c0]                           dc.w $00c8
[000e01c2]                           dc.w $03e8
[000e01c4]                           dc.w $00c8
[000e01c6]                           dc.w $0190
[000e01c8]                           dc.w $03e8
[000e01ca]                           dc.w $00c8
[000e01cc]                           dc.w $0258
[000e01ce]                           dc.w $03e8
[000e01d0]                           dc.w $00c8
[000e01d2]                           dc.w $0320
[000e01d4]                           dc.w $03e8
[000e01d6]                           dc.w $00c8
[000e01d8]                           dc.w $03e8
[000e01da]                           dc.w $03e8
[000e01dc]                           dc.w $0190
[000e01de]                           dc.w $0000
[000e01e0]                           dc.w $03e8
[000e01e2]                           dc.w $0190
[000e01e4]                           dc.w $00c8
[000e01e6]                           dc.w $03e8
[000e01e8]                           dc.w $0190
[000e01ea]                           dc.w $0190
[000e01ec]                           dc.w $03e8
[000e01ee]                           dc.w $0190
[000e01f0]                           dc.w $0258
[000e01f2]                           dc.w $03e8
[000e01f4]                           dc.w $0190
[000e01f6]                           dc.w $0320
[000e01f8]                           dc.w $03e8
[000e01fa]                           dc.w $0190
[000e01fc]                           dc.w $03e8
[000e01fe]                           dc.w $03e8
[000e0200]                           dc.w $0258
[000e0202]                           dc.w $0000
[000e0204]                           dc.w $03e8
[000e0206]                           dc.w $0258
[000e0208]                           dc.w $00c8
[000e020a]                           dc.w $03e8
[000e020c]                           dc.w $0258
[000e020e]                           dc.w $0190
[000e0210]                           dc.w $03e8
[000e0212]                           dc.w $0258
[000e0214]                           dc.w $0258
[000e0216]                           dc.w $03e8
[000e0218]                           dc.w $0258
[000e021a]                           dc.w $0320
[000e021c]                           dc.w $03e8
[000e021e]                           dc.w $0258
[000e0220]                           dc.w $03e8
[000e0222]                           dc.w $03e8
[000e0224]                           dc.w $0320
[000e0226]                           dc.w $0000
[000e0228]                           dc.w $03e8
[000e022a]                           dc.w $0320
[000e022c]                           dc.w $00c8
[000e022e]                           dc.w $03e8
[000e0230]                           dc.w $0320
[000e0232]                           dc.w $0190
[000e0234]                           dc.w $03e8
[000e0236]                           dc.w $0320
[000e0238]                           dc.w $0258
[000e023a]                           dc.w $03e8
[000e023c]                           dc.w $0320
[000e023e]                           dc.w $0320
[000e0240]                           dc.w $03e8
[000e0242]                           dc.w $0320
[000e0244]                           dc.w $03e8
[000e0246]                           dc.w $03e8
[000e0248]                           dc.w $03e8
[000e024a]                           dc.w $0000
[000e024c]                           dc.w $03e8
[000e024e]                           dc.w $03e8
[000e0250]                           dc.w $00c8
[000e0252]                           dc.w $03e8
[000e0254]                           dc.w $03e8
[000e0256]                           dc.w $0190
[000e0258]                           dc.w $03e8
[000e025a]                           dc.w $03e8
[000e025c]                           dc.w $0258
[000e025e]                           dc.w $03e8
[000e0260]                           dc.w $03e8
[000e0262]                           dc.w $0320
[000e0264]                           dc.w $03b5
[000e0266]                           dc.w $0000
[000e0268]                           dc.w $0000
[000e026a]                           dc.w $0386
[000e026c]                           dc.w $0000
[000e026e]                           dc.w $0000
[000e0270]                           dc.w $02f1
[000e0272]                           dc.w $0000
[000e0274]                           dc.w $0000
[000e0276]                           dc.w $02be
[000e0278]                           dc.w $0000
[000e027a]                           dc.w $0000
[000e027c]                           dc.w $01f6
[000e027e]                           dc.w $0000
[000e0280]                           dc.w $0000
[000e0282]                           dc.w $012e
[000e0284]                           dc.w $0000
[000e0286]                           dc.w $0000
[000e0288]                           dc.w $0066
[000e028a]                           dc.w $0000
[000e028c]                           dc.w $0000
[000e028e]                           dc.w $0000
[000e0290]                           dc.w $03b5
[000e0292]                           dc.w $0000
[000e0294]                           dc.w $0000
[000e0296]                           dc.w $0386
[000e0298]                           dc.w $0000
[000e029a]                           dc.w $0000
[000e029c]                           dc.w $02f1
[000e029e]                           dc.w $0000
[000e02a0]                           dc.w $0000
[000e02a2]                           dc.w $02be
[000e02a4]                           dc.w $0000
[000e02a6]                           dc.w $0000
[000e02a8]                           dc.w $01f6
[000e02aa]                           dc.w $0000
[000e02ac]                           dc.w $0000
[000e02ae]                           dc.w $012e
[000e02b0]                           dc.w $0000
[000e02b2]                           dc.w $0000
[000e02b4]                           dc.w $0066
[000e02b6]                           dc.w $0000
[000e02b8]                           dc.w $0000
[000e02ba]                           dc.w $0000
[000e02bc]                           dc.w $0066
[000e02be]                           dc.w $0000
[000e02c0]                           dc.w $0000
[000e02c2]                           dc.w $012e
[000e02c4]                           dc.w $0000
[000e02c6]                           dc.w $0000
[000e02c8]                           dc.w $01f6
[000e02ca]                           dc.w $0000
[000e02cc]                           dc.w $0000
[000e02ce]                           dc.w $02be
[000e02d0]                           dc.w $00c8
[000e02d2]                           dc.w $00c8
[000e02d4]                           dc.w $0258
[000e02d6]                           dc.w $0000
[000e02d8]                           dc.w $0000
[000e02da]                           dc.w $0386
[000e02dc]                           dc.w $03b5
[000e02de]                           dc.w $03b5
[000e02e0]                           dc.w $03b5
[000e02e2]                           dc.w $0386
[000e02e4]                           dc.w $0386
[000e02e6]                           dc.w $0386
[000e02e8]                           dc.w $02f1
[000e02ea]                           dc.w $02f1
[000e02ec]                           dc.w $02f1
[000e02ee]                           dc.w $02be
[000e02f0]                           dc.w $02be
[000e02f2]                           dc.w $02be
[000e02f4]                           dc.w $012e
[000e02f6]                           dc.w $012e
[000e02f8]                           dc.w $012e
[000e02fa]                           dc.w $0066
[000e02fc]                           dc.w $0066
[000e02fe]                           dc.w $0066
