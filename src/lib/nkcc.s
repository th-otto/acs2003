nkc_gemks2n:
[00044284] 594f                      subq.w     #4,a7
[00044286] 3f40 0002                 move.w     d0,2(a7)
[0004428a] 3e81                      move.w     d1,(a7)
[0004428c] 302f 0002                 move.w     2(a7),d0
[00044290] c07c 00ff                 and.w      #$00FF,d0
[00044294] 48c0                      ext.l      d0
[00044296] 322f 0002                 move.w     2(a7),d1
[0004429a] 48c1                      ext.l      d1
[0004429c] c2bc 0000 ff00            and.l      #$0000FF00,d1
[000442a2] e189                      lsl.l      #8,d1
[000442a4] 8081                      or.l       d1,d0
[000442a6] 3217                      move.w     (a7),d1
[000442a8] c27c 00ff                 and.w      #$00FF,d1
[000442ac] 48c1                      ext.l      d1
[000442ae] 7418                      moveq.l    #24,d2
[000442b0] e5a9                      lsl.l      d2,d1
[000442b2] 8081                      or.l       d1,d0
[000442b4] 4eb9 0004 3f94            jsr        nkc_tos2
[000442ba] c07c bfff                 and.w      #$BFFF,d0
[000442be] 584f                      addq.w     #4,a7
[000442c0] 4e75                      rts

nkc_gem2n:
[000442c2] 554f                      subq.w     #2,a7
[000442c4] 3e80                      move.w     d0,(a7)
[000442c6] 4eb9 0004 4374            jsr        nkc_kstate
[000442cc] 3217                      move.w     (a7),d1
[000442ce] 6100 ffb4                 bsr.w      nkc_gemks2n
[000442d2] 544f                      addq.w     #2,a7
[000442d4] 4e75                      rts

nkc_n2gemks:
[000442d6] 4fef fff2                 lea.l      -14(a7),a7
[000442da] 3f40 000c                 move.w     d0,12(a7)
[000442de] 2f48 0008                 move.l     a0,8(a7)
[000442e2] 2f49 0004                 move.l     a1,4(a7)
[000442e6] 302f 000c                 move.w     12(a7),d0
[000442ea] 4eb9 0004 4108            jsr        nkc_n2to
[000442f0] 2e80                      move.l     d0,(a7)
[000442f2] 202f 0004                 move.l     4(a7),d0
[000442f6] 671a                      beq.s      nkc_n2gemks_1
[000442f8] 302f 0002                 move.w     2(a7),d0
[000442fc] c07c 00ff                 and.w      #$00FF,d0
[00044300] 2217                      move.l     (a7),d1
[00044302] c2bc 00ff 0000            and.l      #$00FF0000,d1
[00044308] e081                      asr.l      #8,d1
[0004430a] 8041                      or.w       d1,d0
[0004430c] 206f 0004                 movea.l    4(a7),a0
[00044310] 3080                      move.w     d0,(a0)
nkc_n2gemks_1:
[00044312] 202f 0008                 move.l     8(a7),d0
[00044316] 6712                      beq.s      nkc_n2gemks_2
[00044318] 2017                      move.l     (a7),d0
[0004431a] c0bc ff00 0000            and.l      #$FF000000,d0
[00044320] 7218                      moveq.l    #24,d1
[00044322] e2a8                      lsr.l      d1,d0
[00044324] 206f 0008                 movea.l    8(a7),a0
[00044328] 3080                      move.w     d0,(a0)
nkc_n2gemks_2:
[0004432a] 4fef 000e                 lea.l      14(a7),a7
[0004432e] 4e75                      rts

nkc_n2gem:
[00044330] 5d4f                      subq.w     #6,a7
[00044332] 3f40 0004                 move.w     d0,4(a7)
[00044336] 302f 0004                 move.w     4(a7),d0
[0004433a] 4eb9 0004 4108            jsr        nkc_n2to
[00044340] 2e80                      move.l     d0,(a7)
[00044342] 302f 0002                 move.w     2(a7),d0
[00044346] c07c 00ff                 and.w      #$00FF,d0
[0004434a] 2217                      move.l     (a7),d1
[0004434c] c2bc 00ff 0000            and.l      #$00FF0000,d1
[00044352] e081                      asr.l      #8,d1
[00044354] 8041                      or.w       d1,d0
[00044356] 5c4f                      addq.w     #6,a7
[00044358] 4e75                      rts

nkc_n2kstate:
[0004435a] 554f                      subq.w     #2,a7
[0004435c] 3e80                      move.w     d0,(a7)
[0004435e] 3017                      move.w     (a7),d0
[00044360] 4eb9 0004 4108            jsr        nkc_n2to
[00044366] c0bc ff00 0000            and.l      #$FF000000,d0
[0004436c] 7218                      moveq.l    #24,d1
[0004436e] e2a8                      lsr.l      d1,d0
[00044370] 544f                      addq.w     #2,a7
[00044372] 4e75                      rts

nkc_kstate:
[00044374] 594f                      subq.w     #4,a7
[00044376] 2039 000e 056e            move.l     pshift,d0
[0004437c] 6628                      bne.s      nkc_kstate_1
[0004437e] 4eb9 0008 0fc0            jsr        Ash_getO
[00044384] 2e88                      move.l     a0,(a7)
[00044386] 2057                      movea.l    (a7),a0
[00044388] 0c68 0100 0002            cmpi.w     #$0100,2(a0)
[0004438e] 670c                      beq.s      nkc_kstate_2
[00044390] 2057                      movea.l    (a7),a0
[00044392] 23e8 0024 000e 056e       move.l     36(a0),pshift
[0004439a] 600a                      bra.s      nkc_kstate_1
nkc_kstate_2:
[0004439c] 23fc 0000 0e1b 000e 056e  move.l     #$00000E1B,pshift
nkc_kstate_1:
[000443a6] 701f                      moveq.l    #31,d0
[000443a8] 2079 000e 056e            movea.l    pshift,a0
[000443ae] c068 0002                 and.w      2(a0),d0
[000443b2] e148                      lsl.w      #8,d0
[000443b4] 584f                      addq.w     #4,a7
[000443b6] 4e75                      rts

nkc_cmp:
[000443b8] 4fef fff6                 lea.l      -10(a7),a7
[000443bc] 3f40 0008                 move.w     d0,8(a7)
[000443c0] 3f41 0006                 move.w     d1,6(a7)
[000443c4] 302f 0008                 move.w     8(a7),d0
[000443c8] 322f 0006                 move.w     6(a7),d1
[000443cc] b340                      eor.w      d1,d0
[000443ce] 3f40 0004                 move.w     d0,4(a7)
[000443d2] 70ff                      moveq.l    #-1,d0
[000443d4] c02f 0009                 and.b      9(a7),d0
[000443d8] 1f40 0001                 move.b     d0,1(a7)
[000443dc] 70ff                      moveq.l    #-1,d0
[000443de] c02f 0007                 and.b      7(a7),d0
[000443e2] 1e80                      move.b     d0,(a7)
[000443e4] 302f 0004                 move.w     4(a7),d0
[000443e8] 660a                      bne.s      nkc_cmp_1
[000443ea] 7001                      moveq.l    #1,d0
[000443ec] 6000 017a                 bra        nkc_cmp_2
[000443f0] 6000 0166                 bra        nkc_cmp_3
nkc_cmp_1:
[000443f4] 302f 0004                 move.w     4(a7),d0
[000443f8] c07c 8000                 and.w      #$8000,d0
[000443fc] 6700 00b6                 beq        nkc_cmp_4
[00044400] 302f 0004                 move.w     4(a7),d0
[00044404] c07c 0c00                 and.w      #$0C00,d0
[00044408] 6706                      beq.s      nkc_cmp_5
[0004440a] 4240                      clr.w      d0
[0004440c] 6000 015a                 bra        nkc_cmp_2
nkc_cmp_5:
[00044410] 0c2f 0020 0001            cmpi.b     #$20,1(a7)
[00044416] 6d4a                      blt.s      nkc_cmp_6
[00044418] 302f 0008                 move.w     8(a7),d0
[0004441c] 6604                      bne.s      nkc_cmp_7
[0004441e] 7001                      moveq.l    #1,d0
[00044420] 6002                      bra.s      nkc_cmp_8
nkc_cmp_7:
[00044422] 4240                      clr.w      d0
nkc_cmp_8:
[00044424] c07c 4000                 and.w      #$4000,d0
[00044428] 6710                      beq.s      nkc_cmp_9
[0004442a] 302f 0004                 move.w     4(a7),d0
[0004442e] c07c 2000                 and.w      #$2000,d0
[00044432] 6706                      beq.s      nkc_cmp_9
[00044434] 4240                      clr.w      d0
[00044436] 6000 0130                 bra        nkc_cmp_2
nkc_cmp_9:
[0004443a] 102f 0001                 move.b     1(a7),d0
[0004443e] b017                      cmp.b      (a7),d0
[00044440] 6706                      beq.s      nkc_cmp_10
[00044442] 4240                      clr.w      d0
[00044444] 6000 0122                 bra        nkc_cmp_2
nkc_cmp_10:
[00044448] 302f 0006                 move.w     6(a7),d0
[0004444c] 6604                      bne.s      nkc_cmp_11
[0004444e] 7001                      moveq.l    #1,d0
[00044450] 6002                      bra.s      nkc_cmp_12
nkc_cmp_11:
[00044452] 4240                      clr.w      d0
nkc_cmp_12:
[00044454] c07c 4000                 and.w      #$4000,d0
[00044458] 6706                      beq.s      nkc_cmp_13
[0004445a] 7001                      moveq.l    #1,d0
[0004445c] 6000 010a                 bra        nkc_cmp_2
nkc_cmp_13:
[00044460] 600e                      bra.s      nkc_cmp_14
nkc_cmp_6:
[00044462] 102f 0001                 move.b     1(a7),d0
[00044466] b017                      cmp.b      (a7),d0
[00044468] 6706                      beq.s      nkc_cmp_14
[0004446a] 4240                      clr.w      d0
[0004446c] 6000 00fa                 bra        nkc_cmp_2
nkc_cmp_14:
[00044470] 302f 0004                 move.w     4(a7),d0
[00044474] 6604                      bne.s      nkc_cmp_15
[00044476] 7001                      moveq.l    #1,d0
[00044478] 6002                      bra.s      nkc_cmp_16
nkc_cmp_15:
[0004447a] 4240                      clr.w      d0
nkc_cmp_16:
[0004447c] c07c 0300                 and.w      #$0300,d0
[00044480] 6706                      beq.s      nkc_cmp_17
[00044482] 7001                      moveq.l    #1,d0
[00044484] 6000 00e2                 bra        nkc_cmp_2
nkc_cmp_17:
[00044488] 302f 0008                 move.w     8(a7),d0
[0004448c] c07c 0300                 and.w      #$0300,d0
[00044490] b07c 0300                 cmp.w      #$0300,d0
[00044494] 6706                      beq.s      nkc_cmp_18
[00044496] 4240                      clr.w      d0
[00044498] 6000 00ce                 bra        nkc_cmp_2
nkc_cmp_18:
[0004449c] 302f 0006                 move.w     6(a7),d0
[000444a0] c07c 0300                 and.w      #$0300,d0
[000444a4] 6704                      beq.s      nkc_cmp_19
[000444a6] 7001                      moveq.l    #1,d0
[000444a8] 6002                      bra.s      nkc_cmp_20
nkc_cmp_19:
[000444aa] 4240                      clr.w      d0
nkc_cmp_20:
[000444ac] 6000 00ba                 bra        nkc_cmp_2
[000444b0] 6000 00a6                 bra        nkc_cmp_3
nkc_cmp_4:
[000444b4] 302f 0008                 move.w     8(a7),d0
[000444b8] 6604                      bne.s      nkc_cmp_21
[000444ba] 7001                      moveq.l    #1,d0
[000444bc] 6002                      bra.s      nkc_cmp_22
nkc_cmp_21:
[000444be] 4240                      clr.w      d0
nkc_cmp_22:
[000444c0] c07c 4000                 and.w      #$4000,d0
[000444c4] 6710                      beq.s      nkc_cmp_23
[000444c6] 302f 0004                 move.w     4(a7),d0
[000444ca] c07c 2000                 and.w      #$2000,d0
[000444ce] 6706                      beq.s      nkc_cmp_23
[000444d0] 4240                      clr.w      d0
[000444d2] 6000 0094                 bra        nkc_cmp_2
nkc_cmp_23:
[000444d6] 302f 0008                 move.w     8(a7),d0
[000444da] 4eb9 0004 4264            jsr        nkc_toup
[000444e0] 1f40 0002                 move.b     d0,2(a7)
[000444e4] 102f 0001                 move.b     1(a7),d0
[000444e8] b017                      cmp.b      (a7),d0
[000444ea] 672e                      beq.s      nkc_cmp_24
[000444ec] 302f 0008                 move.w     8(a7),d0
[000444f0] c07c 1000                 and.w      #$1000,d0
[000444f4] 6720                      beq.s      nkc_cmp_25
[000444f6] 302f 0006                 move.w     6(a7),d0
[000444fa] 4eb9 0004 4264            jsr        nkc_toup
[00044500] c03c ffff                 and.b      #$FF,d0
[00044504] 122f 0002                 move.b     2(a7),d1
[00044508] b200                      cmp.b      d0,d1
[0004450a] 6604                      bne.s      nkc_cmp_26
[0004450c] 7001                      moveq.l    #1,d0
[0004450e] 6002                      bra.s      nkc_cmp_27
nkc_cmp_26:
[00044510] 4240                      clr.w      d0
nkc_cmp_27:
[00044512] 6054                      bra.s      nkc_cmp_2
[00044514] 6004                      bra.s      nkc_cmp_24
nkc_cmp_25:
[00044516] 4240                      clr.w      d0
[00044518] 604e                      bra.s      nkc_cmp_2
nkc_cmp_24:
[0004451a] 302f 0006                 move.w     6(a7),d0
[0004451e] 6604                      bne.s      nkc_cmp_28
[00044520] 7001                      moveq.l    #1,d0
[00044522] 6002                      bra.s      nkc_cmp_29
nkc_cmp_28:
[00044524] 4240                      clr.w      d0
nkc_cmp_29:
[00044526] c07c 4000                 and.w      #$4000,d0
[0004452a] 6704                      beq.s      nkc_cmp_30
[0004452c] 7001                      moveq.l    #1,d0
[0004452e] 6038                      bra.s      nkc_cmp_2
nkc_cmp_30:
[00044530] 302f 0004                 move.w     4(a7),d0
[00044534] 6604                      bne.s      nkc_cmp_31
[00044536] 7001                      moveq.l    #1,d0
[00044538] 6002                      bra.s      nkc_cmp_32
nkc_cmp_31:
[0004453a] 4240                      clr.w      d0
nkc_cmp_32:
[0004453c] c07c 0300                 and.w      #$0300,d0
[00044540] 6704                      beq.s      nkc_cmp_33
[00044542] 7001                      moveq.l    #1,d0
[00044544] 6022                      bra.s      nkc_cmp_2
nkc_cmp_33:
[00044546] 302f 0008                 move.w     8(a7),d0
[0004454a] c07c 0300                 and.w      #$0300,d0
[0004454e] b07c 0300                 cmp.w      #$0300,d0
[00044552] 6704                      beq.s      nkc_cmp_3
[00044554] 4240                      clr.w      d0
[00044556] 6010                      bra.s      nkc_cmp_2
nkc_cmp_3:
[00044558] 302f 0006                 move.w     6(a7),d0
[0004455c] c07c 0300                 and.w      #$0300,d0
[00044560] 6704                      beq.s      nkc_cmp_34
[00044562] 7001                      moveq.l    #1,d0
[00044564] 6002                      bra.s      nkc_cmp_2
nkc_cmp_34:
[00044566] 4240                      clr.w      d0
nkc_cmp_2:
[00044568] 4fef 000a                 lea.l      10(a7),a7
[0004456c] 4e75                      rts

nkc_exit:
[0004456e] 4240                      clr.w      d0
[00044570] 4e75                      rts

