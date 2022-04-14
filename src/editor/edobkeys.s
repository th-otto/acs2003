comp:
[00033250] 2251                      movea.l    (a1),a1
[00033252] 4eb9 0008 2eba            jsr        strcmp
[00033258] 4e75                      rts
key_code:
[0003325a] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0003325e] 2448                      movea.l    a0,a2
[00033260] 4243                      clr.w      d3
[00033262] 534a                      subq.w     #1,a2
[00033264] 524a                      addq.w     #1,a2
[00033266] 0c12 0007                 cmpi.b     #$07,(a2)
[0003326a] 6606                      bne.s      $00033272
[0003326c] 867c 8800                 or.w       #$8800,d3
[00033270] 60f2                      bra.s      $00033264
[00033272] 0c12 0001                 cmpi.b     #$01,(a2)
[00033276] 6606                      bne.s      $0003327E
[00033278] 867c 0300                 or.w       #$0300,d3
[0003327c] 60e6                      bra.s      $00033264
[0003327e] 0c12 005e                 cmpi.b     #$5E,(a2)
[00033282] 6606                      bne.s      $0003328A
[00033284] 867c 8400                 or.w       #$8400,d3
[00033288] 60da                      bra.s      $00033264
[0003328a] 487a ffc4                 pea.l      comp(pc)
[0003328e] 7206                      moveq.l    #6,d1
[00033290] 701a                      moveq.l    #26,d0
[00033292] 43f9 000c cd3a            lea.l      nktab,a1
[00033298] 204a                      movea.l    a2,a0
[0003329a] 4eb9 0008 10a4            jsr        bsearch
[000332a0] 584f                      addq.w     #4,a7
[000332a2] 2648                      movea.l    a0,a3
[000332a4] 200b                      move.l     a3,d0
[000332a6] 661e                      bne.s      $000332C6
[000332a8] 0c12 0020                 cmpi.b     #$20,(a2)
[000332ac] 6514                      bcs.s      $000332C2
[000332ae] 102a 0001                 move.b     1(a2),d0
[000332b2] 6706                      beq.s      $000332BA
[000332b4] b03c 0020                 cmp.b      #$20,d0
[000332b8] 6608                      bne.s      $000332C2
[000332ba] 4240                      clr.w      d0
[000332bc] 1012                      move.b     (a2),d0
[000332be] 8043                      or.w       d3,d0
[000332c0] 600e                      bra.s      $000332D0
[000332c2] 4240                      clr.w      d0
[000332c4] 600a                      bra.s      $000332D0
[000332c6] 3003                      move.w     d3,d0
[000332c8] 806b 0004                 or.w       4(a3),d0
[000332cc] 807c 8000                 or.w       #$8000,d0
[000332d0] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000332d4] 4e75                      rts
key_string:
[000332d6] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[000332da] 3600                      move.w     d0,d3
[000332dc] 45f9 0010 c60e            lea.l      string,a2
[000332e2] 4212                      clr.b      (a2)
[000332e4] 3003                      move.w     d3,d0
[000332e6] c07c 0300                 and.w      #$0300,d0
[000332ea] 670e                      beq.s      $000332FA
[000332ec] 43f9 000c ce3f            lea.l      $000CCE3F,a1
[000332f2] 204a                      movea.l    a2,a0
[000332f4] 4eb9 0008 2e42            jsr        strcat
[000332fa] 3003                      move.w     d3,d0
[000332fc] c07c 0400                 and.w      #$0400,d0
[00033300] 670e                      beq.s      $00033310
[00033302] 43f9 000c ce41            lea.l      $000CCE41,a1
[00033308] 204a                      movea.l    a2,a0
[0003330a] 4eb9 0008 2e42            jsr        strcat
[00033310] 3003                      move.w     d3,d0
[00033312] c07c 0800                 and.w      #$0800,d0
[00033316] 670e                      beq.s      $00033326
[00033318] 43f9 000c ce43            lea.l      $000CCE43,a1
[0003331e] 204a                      movea.l    a2,a0
[00033320] 4eb9 0008 2e42            jsr        strcat
[00033326] 204a                      movea.l    a2,a0
[00033328] 4eb9 0008 2f6c            jsr        strlen
[0003332e] 2800                      move.l     d0,d4
[00033330] 4245                      clr.w      d5
[00033332] 47f9 000c cd3a            lea.l      nktab,a3
[00033338] 601e                      bra.s      $00033358
[0003333a] 3005                      move.w     d5,d0
[0003333c] d040                      add.w      d0,d0
[0003333e] d045                      add.w      d5,d0
[00033340] d040                      add.w      d0,d0
[00033342] b633 0005                 cmp.b      5(a3,d0.w),d3
[00033346] 660e                      bne.s      $00033356
[00033348] 2273 0000                 movea.l    0(a3,d0.w),a1
[0003334c] 204a                      movea.l    a2,a0
[0003334e] 4eb9 0008 2e42            jsr        strcat
[00033354] 6020                      bra.s      $00033376
[00033356] 5245                      addq.w     #1,d5
[00033358] ba7c 001a                 cmp.w      #$001A,d5
[0003335c] 6ddc                      blt.s      $0003333A
[0003335e] 303c 00ff                 move.w     #$00FF,d0
[00033362] c043                      and.w      d3,d0
[00033364] b07c 0020                 cmp.w      #$0020,d0
[00033368] 6d06                      blt.s      $00033370
[0003336a] 1583 4000                 move.b     d3,0(a2,d4.w)
[0003336e] 5244                      addq.w     #1,d4
[00033370] 4232 4000                 clr.b      0(a2,d4.w)
[00033374] 204a                      movea.l    a2,a0
[00033376] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[0003337a] 4e75                      rts
