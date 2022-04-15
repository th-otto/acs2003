char_x:
[0002d888] 4a40                      tst.w      d0
[0002d88a] 6a08                      bpl.s      $0002D894
[0002d88c] 3200                      move.w     d0,d1
[0002d88e] e149                      lsl.w      #8,d1
[0002d890] 3001                      move.w     d1,d0
[0002d892] 4e75                      rts
[0002d894] 41f9 0010 ee4e            lea.l      ACSblk,a0
[0002d89a] 3239 0008 4806            move.w     snapping,d1
[0002d8a0] 6714                      beq.s      $0002D8B6
[0002d8a2] 2250                      movea.l    (a0),a1
[0002d8a4] 3429 0012                 move.w     18(a1),d2
[0002d8a8] e242                      asr.w      #1,d2
[0002d8aa] d440                      add.w      d0,d2
[0002d8ac] 48c2                      ext.l      d2
[0002d8ae] 85e9 0012                 divs.w     18(a1),d2
[0002d8b2] 3002                      move.w     d2,d0
[0002d8b4] 4e75                      rts
[0002d8b6] 3200                      move.w     d0,d1
[0002d8b8] 48c1                      ext.l      d1
[0002d8ba] 2250                      movea.l    (a0),a1
[0002d8bc] 83e9 0012                 divs.w     18(a1),d1
[0002d8c0] 3400                      move.w     d0,d2
[0002d8c2] 48c2                      ext.l      d2
[0002d8c4] 85e9 0012                 divs.w     18(a1),d2
[0002d8c8] 4842                      swap       d2
[0002d8ca] e14a                      lsl.w      #8,d2
[0002d8cc] 8242                      or.w       d2,d1
[0002d8ce] 3001                      move.w     d1,d0
[0002d8d0] 4e75                      rts
char_y:
[0002d8d2] 4a40                      tst.w      d0
[0002d8d4] 6a08                      bpl.s      $0002D8DE
[0002d8d6] 3200                      move.w     d0,d1
[0002d8d8] e149                      lsl.w      #8,d1
[0002d8da] 3001                      move.w     d1,d0
[0002d8dc] 4e75                      rts
[0002d8de] 41f9 0010 ee4e            lea.l      ACSblk,a0
[0002d8e4] 3239 0008 4806            move.w     snapping,d1
[0002d8ea] 6714                      beq.s      $0002D900
[0002d8ec] 2250                      movea.l    (a0),a1
[0002d8ee] 3429 0014                 move.w     20(a1),d2
[0002d8f2] e242                      asr.w      #1,d2
[0002d8f4] d440                      add.w      d0,d2
[0002d8f6] 48c2                      ext.l      d2
[0002d8f8] 85e9 0014                 divs.w     20(a1),d2
[0002d8fc] 3002                      move.w     d2,d0
[0002d8fe] 4e75                      rts
[0002d900] 3200                      move.w     d0,d1
[0002d902] 48c1                      ext.l      d1
[0002d904] 2250                      movea.l    (a0),a1
[0002d906] 83e9 0014                 divs.w     20(a1),d1
[0002d90a] 3400                      move.w     d0,d2
[0002d90c] 48c2                      ext.l      d2
[0002d90e] 85e9 0014                 divs.w     20(a1),d2
[0002d912] 4842                      swap       d2
[0002d914] e14a                      lsl.w      #8,d2
[0002d916] 8242                      or.w       d2,d1
[0002d918] 3001                      move.w     d1,d0
[0002d91a] 4e75                      rts
pixel_x:
[0002d91c] 3200                      move.w     d0,d1
[0002d91e] e041                      asr.w      #8,d1
[0002d920] c27c 00ff                 and.w      #$00FF,d1
[0002d924] b27c 007f                 cmp.w      #$007F,d1
[0002d928] 6f04                      ble.s      $0002D92E
[0002d92a] 927c 0100                 sub.w      #$0100,d1
[0002d92e] 3400                      move.w     d0,d2
[0002d930] c47c 00ff                 and.w      #$00FF,d2
[0002d934] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002d93a] c5e8 0012                 muls.w     18(a0),d2
[0002d93e] d441                      add.w      d1,d2
[0002d940] 3002                      move.w     d2,d0
[0002d942] 4e75                      rts
pixel_y:
[0002d944] 3200                      move.w     d0,d1
[0002d946] e041                      asr.w      #8,d1
[0002d948] c27c 00ff                 and.w      #$00FF,d1
[0002d94c] b27c 007f                 cmp.w      #$007F,d1
[0002d950] 6f04                      ble.s      $0002D956
[0002d952] 927c 0100                 sub.w      #$0100,d1
[0002d956] 3400                      move.w     d0,d2
[0002d958] c47c 00ff                 and.w      #$00FF,d2
[0002d95c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002d962] c5e8 0014                 muls.w     20(a0),d2
[0002d966] d441                      add.w      d1,d2
[0002d968] 3002                      move.w     d2,d0
[0002d96a] 4e75                      rts
del_obentry:
[0002d96c] 48e7 1e3c                 movem.l    d3-d6/a2-a5,-(a7)
[0002d970] 594f                      subq.w     #4,a7
[0002d972] 2e88                      move.l     a0,(a7)
[0002d974] 3600                      move.w     d0,d3
[0002d976] 3c01                      move.w     d1,d6
[0002d978] 2668 0014                 movea.l    20(a0),a3
[0002d97c] 2050                      movea.l    (a0),a0
[0002d97e] 2850                      movea.l    (a0),a4
[0002d980] 2a68 0004                 movea.l    4(a0),a5
[0002d984] 78fe                      moveq.l    #-2,d4
[0002d986] d840                      add.w      d0,d4
[0002d988] 48c4                      ext.l      d4
[0002d98a] 89fc 0003                 divs.w     #$0003,d4
[0002d98e] 246d 0004                 movea.l    4(a5),a2
[0002d992] b068 0018                 cmp.w      24(a0),d0
[0002d996] 664e                      bne.s      $0002D9E6
[0002d998] 3204                      move.w     d4,d1
[0002d99a] 48c1                      ext.l      d1
[0002d99c] 2401                      move.l     d1,d2
[0002d99e] e78a                      lsl.l      #3,d2
[0002d9a0] 9481                      sub.l      d1,d2
[0002d9a2] e78a                      lsl.l      #3,d2
[0002d9a4] 3a32 280a                 move.w     10(a2,d2.l),d5
[0002d9a8] 4a45                      tst.w      d5
[0002d9aa] 6b00 00a2                 bmi        $0002DA4E
[0002d9ae] ba72 280c                 cmp.w      12(a2,d2.l),d5
[0002d9b2] 6600 009a                 bne        $0002DA4E
[0002d9b6] 3205                      move.w     d5,d1
[0002d9b8] 48c1                      ext.l      d1
[0002d9ba] 2001                      move.l     d1,d0
[0002d9bc] e788                      lsl.l      #3,d0
[0002d9be] 9081                      sub.l      d1,d0
[0002d9c0] e788                      lsl.l      #3,d0
[0002d9c2] 35b2 2818 0818            move.w     24(a2,d2.l),24(a2,d0.l)
[0002d9c8] 35b2 281a 081a            move.w     26(a2,d2.l),26(a2,d0.l)
[0002d9ce] 43f2 2800                 lea.l      0(a2,d2.l),a1
[0002d9d2] 204c                      movea.l    a4,a0
[0002d9d4] 4eb9 0002 d214            jsr        del_ob
[0002d9da] 3004                      move.w     d4,d0
[0002d9dc] 204a                      movea.l    a2,a0
[0002d9de] 4eb9 0002 d556            jsr        unlink_ob
[0002d9e4] 6068                      bra.s      $0002DA4E
[0002d9e6] 4a46                      tst.w      d6
[0002d9e8] 6724                      beq.s      $0002DA0E
[0002d9ea] 3204                      move.w     d4,d1
[0002d9ec] 48c1                      ext.l      d1
[0002d9ee] 2001                      move.l     d1,d0
[0002d9f0] e788                      lsl.l      #3,d0
[0002d9f2] 9081                      sub.l      d1,d0
[0002d9f4] e788                      lsl.l      #3,d0
[0002d9f6] 43f2 0800                 lea.l      0(a2,d0.l),a1
[0002d9fa] 204c                      movea.l    a4,a0
[0002d9fc] 4eb9 0002 d214            jsr        del_ob
[0002da02] 3004                      move.w     d4,d0
[0002da04] 204a                      movea.l    a2,a0
[0002da06] 4eb9 0002 d556            jsr        unlink_ob
[0002da0c] 6022                      bra.s      $0002DA30
[0002da0e] 3004                      move.w     d4,d0
[0002da10] 224d                      movea.l    a5,a1
[0002da12] 204c                      movea.l    a4,a0
[0002da14] 4eb9 0002 d304            jsr        delsub_ob
[0002da1a] 70ff                      moveq.l    #-1,d0
[0002da1c] 3403                      move.w     d3,d2
[0002da1e] 48c2                      ext.l      d2
[0002da20] 2202                      move.l     d2,d1
[0002da22] d281                      add.l      d1,d1
[0002da24] d282                      add.l      d2,d1
[0002da26] e789                      lsl.l      #3,d1
[0002da28] 3780 1804                 move.w     d0,4(a3,d1.l)
[0002da2c] 3780 1802                 move.w     d0,2(a3,d1.l)
[0002da30] 3203                      move.w     d3,d1
[0002da32] 48c1                      ext.l      d1
[0002da34] 2001                      move.l     d1,d0
[0002da36] d080                      add.l      d0,d0
[0002da38] d081                      add.l      d1,d0
[0002da3a] e788                      lsl.l      #3,d0
[0002da3c] 0073 0080 08f0            ori.w      #$0080,-16(a3,d0.l)
[0002da42] 70ff                      moveq.l    #-1,d0
[0002da44] d043                      add.w      d3,d0
[0002da46] 2057                      movea.l    (a7),a0
[0002da48] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002da4e] 584f                      addq.w     #4,a7
[0002da50] 4cdf 3c78                 movem.l    (a7)+,d3-d6/a2-a5
[0002da54] 4e75                      rts
ed_delete:
[0002da56] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[0002da5a] 594f                      subq.w     #4,a7
[0002da5c] 2448                      movea.l    a0,a2
[0002da5e] 2650                      movea.l    (a0),a3
[0002da60] 0c6b 0001 0008            cmpi.w     #$0001,8(a3)
[0002da66] 6600 00ba                 bne        $0002DB22
[0002da6a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002da70] b1e9 0240                 cmpa.l     576(a1),a0
[0002da74] 6600 00ac                 bne        $0002DB22
[0002da78] 2f39 000e 692a            move.l     _globl,-(a7)
[0002da7e] 486f 0006                 pea.l      6(a7)
[0002da82] 486f 0008                 pea.l      8(a7)
[0002da86] 43ef 000c                 lea.l      12(a7),a1
[0002da8a] 41ef 000c                 lea.l      12(a7),a0
[0002da8e] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0002da94] 4fef 000c                 lea.l      12(a7),a7
[0002da98] 026f 0004 0002            andi.w     #$0004,2(a7)
[0002da9e] 4243                      clr.w      d3
[0002daa0] 4eb9 0004 7e1e            jsr        Adr_start
[0002daa6] 6042                      bra.s      $0002DAEA
[0002daa8] 3204                      move.w     d4,d1
[0002daaa] 48c1                      ext.l      d1
[0002daac] 2001                      move.l     d1,d0
[0002daae] d080                      add.l      d0,d0
[0002dab0] d081                      add.l      d1,d0
[0002dab2] e788                      lsl.l      #3,d0
[0002dab4] 286a 0014                 movea.l    20(a2),a4
[0002dab8] 49f4 0818                 lea.l      24(a4,d0.l),a4
[0002dabc] 0c6c 2af8 0016            cmpi.w     #$2AF8,22(a4)
[0002dac2] 6626                      bne.s      $0002DAEA
[0002dac4] 204a                      movea.l    a2,a0
[0002dac6] 3004                      move.w     d4,d0
[0002dac8] 4eb9 0004 7f76            jsr        Adr_del
[0002dace] b86b 0018                 cmp.w      24(a3),d4
[0002dad2] 6602                      bne.s      $0002DAD6
[0002dad4] 7601                      moveq.l    #1,d3
[0002dad6] 302f 0002                 move.w     2(a7),d0
[0002dada] 6704                      beq.s      $0002DAE0
[0002dadc] 7201                      moveq.l    #1,d1
[0002dade] 6002                      bra.s      $0002DAE2
[0002dae0] 4241                      clr.w      d1
[0002dae2] 3004                      move.w     d4,d0
[0002dae4] 204a                      movea.l    a2,a0
[0002dae6] 6100 fe84                 bsr        del_obentry
[0002daea] 4eb9 0004 7e2a            jsr        Adr_next
[0002daf0] 3800                      move.w     d0,d4
[0002daf2] 6ab4                      bpl.s      $0002DAA8
[0002daf4] 206b 0004                 movea.l    4(a3),a0
[0002daf8] 4eb9 0002 d4ee            jsr        pack_ob
[0002dafe] 204a                      movea.l    a2,a0
[0002db00] 226a 0010                 movea.l    16(a2),a1
[0002db04] 4e91                      jsr        (a1)
[0002db06] 4a43                      tst.w      d3
[0002db08] 6712                      beq.s      $0002DB1C
[0002db0a] 006a 0010 0056            ori.w      #$0010,86(a2)
[0002db10] 43ea 0024                 lea.l      36(a2),a1
[0002db14] 204a                      movea.l    a2,a0
[0002db16] 286a 0086                 movea.l    134(a2),a4
[0002db1a] 4e94                      jsr        (a4)
[0002db1c] 377c ffff 000a            move.w     #$FFFF,10(a3)
[0002db22] 584f                      addq.w     #4,a7
[0002db24] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[0002db28] 4e75                      rts
ed_dragged:
[0002db2a] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0002db2e] 4fef fff4                 lea.l      -12(a7),a7
[0002db32] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002db38] 3028 0250                 move.w     592(a0),d0
[0002db3c] 6608                      bne.s      $0002DB46
[0002db3e] 3228 0252                 move.w     594(a0),d1
[0002db42] 6700 019e                 beq        $0002DCE2
[0002db46] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002db4c] 2668 0240                 movea.l    576(a0),a3
[0002db50] 2868 0258                 movea.l    600(a0),a4
[0002db54] 45ef 000a                 lea.l      10(a7),a2
[0002db58] 2f39 000e 692a            move.l     _globl,-(a7)
[0002db5e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002db64] 4868 0266                 pea.l      614(a0)
[0002db68] 4852                      pea.l      (a2)
[0002db6a] 224a                      movea.l    a2,a1
[0002db6c] 204a                      movea.l    a2,a0
[0002db6e] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0002db74] 4fef 000c                 lea.l      12(a7),a7
[0002db78] 7001                      moveq.l    #1,d0
[0002db7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002db80] c068 0266                 and.w      614(a0),d0
[0002db84] 6706                      beq.s      $0002DB8C
[0002db86] 0068 0002 0266            ori.w      #$0002,614(a0)
[0002db8c] b9cb                      cmpa.l     a3,a4
[0002db8e] 670c                      beq.s      $0002DB9C
[0002db90] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002db96] 0068 0004 0266            ori.w      #$0004,614(a0)
[0002db9c] 7006                      moveq.l    #6,d0
[0002db9e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002dba4] c068 0266                 and.w      614(a0),d0
[0002dba8] 3480                      move.w     d0,(a2)
[0002dbaa] b9cb                      cmpa.l     a3,a4
[0002dbac] 660e                      bne.s      $0002DBBC
[0002dbae] 5540                      subq.w     #2,d0
[0002dbb0] 670a                      beq.s      $0002DBBC
[0002dbb2] 0c52 0006                 cmpi.w     #$0006,(a2)
[0002dbb6] 6704                      beq.s      $0002DBBC
[0002dbb8] 7801                      moveq.l    #1,d4
[0002dbba] 6002                      bra.s      $0002DBBE
[0002dbbc] 4244                      clr.w      d4
[0002dbbe] 4a44                      tst.w      d4
[0002dbc0] 6770                      beq.s      $0002DC32
[0002dbc2] 2454                      movea.l    (a4),a2
[0002dbc4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002dbca] 4268 0248                 clr.w      584(a0)
[0002dbce] 6058                      bra.s      $0002DC28
[0002dbd0] 3203                      move.w     d3,d1
[0002dbd2] 48c1                      ext.l      d1
[0002dbd4] 2001                      move.l     d1,d0
[0002dbd6] d080                      add.l      d0,d0
[0002dbd8] d081                      add.l      d1,d0
[0002dbda] e788                      lsl.l      #3,d0
[0002dbdc] 2a6b 0014                 movea.l    20(a3),a5
[0002dbe0] 4bf5 0818                 lea.l      24(a5,d0.l),a5
[0002dbe4] 0c6d 2af8 0016            cmpi.w     #$2AF8,22(a5)
[0002dbea] 663c                      bne.s      $0002DC28
[0002dbec] b66a 0018                 cmp.w      24(a2),d3
[0002dbf0] 672c                      beq.s      $0002DC1E
[0002dbf2] 206c 0014                 movea.l    20(a4),a0
[0002dbf6] 0070 0080 08f0            ori.w      #$0080,-16(a0,d0.l)
[0002dbfc] 206c 0014                 movea.l    20(a4),a0
[0002dc00] 0070 0080 0808            ori.w      #$0080,8(a0,d0.l)
[0002dc06] 206c 0014                 movea.l    20(a4),a0
[0002dc0a] 0270 fffe 080a            andi.w     #$FFFE,10(a0,d0.l)
[0002dc10] 70ff                      moveq.l    #-1,d0
[0002dc12] d043                      add.w      d3,d0
[0002dc14] 204c                      movea.l    a4,a0
[0002dc16] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002dc1c] 600a                      bra.s      $0002DC28
[0002dc1e] 3003                      move.w     d3,d0
[0002dc20] 204b                      movea.l    a3,a0
[0002dc22] 4eb9 0004 7f76            jsr        Adr_del
[0002dc28] 4eb9 0004 7e2a            jsr        Adr_next
[0002dc2e] 3600                      move.w     d0,d3
[0002dc30] 6a9e                      bpl.s      $0002DBD0
[0002dc32] 4257                      clr.w      (a7)
[0002dc34] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002dc3a] 4268 0248                 clr.w      584(a0)
[0002dc3e] 602a                      bra.s      $0002DC6A
[0002dc40] 3203                      move.w     d3,d1
[0002dc42] 48c1                      ext.l      d1
[0002dc44] 2001                      move.l     d1,d0
[0002dc46] d080                      add.l      d0,d0
[0002dc48] d081                      add.l      d1,d0
[0002dc4a] e788                      lsl.l      #3,d0
[0002dc4c] 2a6b 0014                 movea.l    20(a3),a5
[0002dc50] 4bf5 0818                 lea.l      24(a5,d0.l),a5
[0002dc54] 0c6d 2af8 0016            cmpi.w     #$2AF8,22(a5)
[0002dc5a] 660e                      bne.s      $0002DC6A
[0002dc5c] 43d7                      lea.l      (a7),a1
[0002dc5e] 204c                      movea.l    a4,a0
[0002dc60] 3003                      move.w     d3,d0
[0002dc62] 3204                      move.w     d4,d1
[0002dc64] 4eb9 0002 e10e            jsr        new_ob
[0002dc6a] 4eb9 0004 7e2a            jsr        Adr_next
[0002dc70] 3600                      move.w     d0,d3
[0002dc72] 6acc                      bpl.s      $0002DC40
[0002dc74] 3217                      move.w     (a7),d1
[0002dc76] 6f6a                      ble.s      $0002DCE2
[0002dc78] 204c                      movea.l    a4,a0
[0002dc7a] 226c 0010                 movea.l    16(a4),a1
[0002dc7e] 4e91                      jsr        (a1)
[0002dc80] 0c57 0005                 cmpi.w     #$0005,(a7)
[0002dc84] 6d0c                      blt.s      $0002DC92
[0002dc86] 4240                      clr.w      d0
[0002dc88] 204c                      movea.l    a4,a0
[0002dc8a] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002dc90] 6050                      bra.s      $0002DCE2
[0002dc92] 3817                      move.w     (a7),d4
[0002dc94] 6048                      bra.s      $0002DCDE
[0002dc96] 3004                      move.w     d4,d0
[0002dc98] d040                      add.w      d0,d0
[0002dc9a] 3637 0000                 move.w     0(a7,d0.w),d3
[0002dc9e] 3203                      move.w     d3,d1
[0002dca0] 48c1                      ext.l      d1
[0002dca2] 2401                      move.l     d1,d2
[0002dca4] d482                      add.l      d2,d2
[0002dca6] d481                      add.l      d1,d2
[0002dca8] e78a                      lsl.l      #3,d2
[0002dcaa] 206c 0014                 movea.l    20(a4),a0
[0002dcae] 3230 280a                 move.w     10(a0,d2.l),d1
[0002dcb2] 226c 0066                 movea.l    102(a4),a1
[0002dcb6] 204c                      movea.l    a4,a0
[0002dcb8] 3003                      move.w     d3,d0
[0002dcba] 4e91                      jsr        (a1)
[0002dcbc] 5243                      addq.w     #1,d3
[0002dcbe] 3403                      move.w     d3,d2
[0002dcc0] 48c2                      ext.l      d2
[0002dcc2] 2002                      move.l     d2,d0
[0002dcc4] d080                      add.l      d0,d0
[0002dcc6] d082                      add.l      d2,d0
[0002dcc8] e788                      lsl.l      #3,d0
[0002dcca] 206c 0014                 movea.l    20(a4),a0
[0002dcce] 3230 080a                 move.w     10(a0,d0.l),d1
[0002dcd2] 226c 0066                 movea.l    102(a4),a1
[0002dcd6] 204c                      movea.l    a4,a0
[0002dcd8] 3003                      move.w     d3,d0
[0002dcda] 4e91                      jsr        (a1)
[0002dcdc] 5344                      subq.w     #1,d4
[0002dcde] 4a44                      tst.w      d4
[0002dce0] 6eb4                      bgt.s      $0002DC96
[0002dce2] 4fef 000c                 lea.l      12(a7),a7
[0002dce6] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0002dcea] 4e75                      rts
ob_find:
[0002dcec] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[0002dcf0] 514f                      subq.w     #8,a7
[0002dcf2] 2448                      movea.l    a0,a2
[0002dcf4] 3600                      move.w     d0,d3
[0002dcf6] 2849                      movea.l    a1,a4
[0002dcf8] 48c0                      ext.l      d0
[0002dcfa] 2200                      move.l     d0,d1
[0002dcfc] d281                      add.l      d1,d1
[0002dcfe] d280                      add.l      d0,d1
[0002dd00] e789                      lsl.l      #3,d1
[0002dd02] 266a 0014                 movea.l    20(a2),a3
[0002dd06] d7c1                      adda.l     d1,a3
[0002dd08] 342b 0012                 move.w     18(a3),d2
[0002dd0c] 322c 0002                 move.w     2(a4),d1
[0002dd10] d26c 0006                 add.w      6(a4),d1
[0002dd14] b441                      cmp.w      d1,d2
[0002dd16] 6c00 00b0                 bge        $0002DDC8
[0002dd1a] d46b 0016                 add.w      22(a3),d2
[0002dd1e] b46c 0002                 cmp.w      2(a4),d2
[0002dd22] 6f00 00a4                 ble        $0002DDC8
[0002dd26] 302b 0010                 move.w     16(a3),d0
[0002dd2a] 3211                      move.w     (a1),d1
[0002dd2c] d26c 0004                 add.w      4(a4),d1
[0002dd30] b041                      cmp.w      d1,d0
[0002dd32] 6c00 0094                 bge        $0002DDC8
[0002dd36] d06b 0014                 add.w      20(a3),d0
[0002dd3a] b051                      cmp.w      (a1),d0
[0002dd3c] 6f00 008a                 ble        $0002DDC8
[0002dd40] 342b 0012                 move.w     18(a3),d2
[0002dd44] b46c 0002                 cmp.w      2(a4),d2
[0002dd48] 6d30                      blt.s      $0002DD7A
[0002dd4a] 322b 0010                 move.w     16(a3),d1
[0002dd4e] b251                      cmp.w      (a1),d1
[0002dd50] 6d28                      blt.s      $0002DD7A
[0002dd52] d46b 0016                 add.w      22(a3),d2
[0002dd56] 302c 0002                 move.w     2(a4),d0
[0002dd5a] d06c 0006                 add.w      6(a4),d0
[0002dd5e] b440                      cmp.w      d0,d2
[0002dd60] 6e18                      bgt.s      $0002DD7A
[0002dd62] d26b 0014                 add.w      20(a3),d1
[0002dd66] 3411                      move.w     (a1),d2
[0002dd68] d46c 0004                 add.w      4(a4),d2
[0002dd6c] b242                      cmp.w      d2,d1
[0002dd6e] 6e0a                      bgt.s      $0002DD7A
[0002dd70] 3003                      move.w     d3,d0
[0002dd72] 4eb9 0002 e540            jsr        ob_addselect
[0002dd78] 604e                      bra.s      $0002DDC8
[0002dd7a] 382b 0002                 move.w     2(a3),d4
[0002dd7e] 4a44                      tst.w      d4
[0002dd80] 6b46                      bmi.s      $0002DDC8
[0002dd82] 3014                      move.w     (a4),d0
[0002dd84] 906b 0010                 sub.w      16(a3),d0
[0002dd88] 3e80                      move.w     d0,(a7)
[0002dd8a] 322c 0002                 move.w     2(a4),d1
[0002dd8e] 926b 0012                 sub.w      18(a3),d1
[0002dd92] 3f41 0002                 move.w     d1,2(a7)
[0002dd96] 3f6c 0004 0004            move.w     4(a4),4(a7)
[0002dd9c] 3f6c 0006 0006            move.w     6(a4),6(a7)
[0002dda2] 6020                      bra.s      $0002DDC4
[0002dda4] 43d7                      lea.l      (a7),a1
[0002dda6] 5244                      addq.w     #1,d4
[0002dda8] 3004                      move.w     d4,d0
[0002ddaa] 204a                      movea.l    a2,a0
[0002ddac] 6100 ff3e                 bsr        ob_find
[0002ddb0] 3204                      move.w     d4,d1
[0002ddb2] 48c1                      ext.l      d1
[0002ddb4] 2001                      move.l     d1,d0
[0002ddb6] d080                      add.l      d0,d0
[0002ddb8] d081                      add.l      d1,d0
[0002ddba] e788                      lsl.l      #3,d0
[0002ddbc] 206a 0014                 movea.l    20(a2),a0
[0002ddc0] 3830 0800                 move.w     0(a0,d0.l),d4
[0002ddc4] b644                      cmp.w      d4,d3
[0002ddc6] 66dc                      bne.s      $0002DDA4
[0002ddc8] 504f                      addq.w     #8,a7
[0002ddca] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[0002ddce] 4e75                      rts
draw_box:
[0002ddd0] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0002ddd4] 514f                      subq.w     #8,a7
[0002ddd6] 2448                      movea.l    a0,a2
[0002ddd8] 266a 0014                 movea.l    20(a2),a3
[0002dddc] 49f9 0010 ee4e            lea.l      ACSblk,a4
[0002dde2] 7003                      moveq.l    #3,d0
[0002dde4] 2054                      movea.l    (a4),a0
[0002dde6] c068 0266                 and.w      614(a0),d0
[0002ddea] 6606                      bne.s      $0002DDF2
[0002ddec] 4eb9 0004 810e            jsr        Adr_unselect
[0002ddf2] 2054                      movea.l    (a4),a0
[0002ddf4] 2068 023c                 movea.l    572(a0),a0
[0002ddf8] 41e8 0044                 lea.l      68(a0),a0
[0002ddfc] 4eb9 0004 ee3c            jsr        Amo_new
[0002de02] 2054                      movea.l    (a4),a0
[0002de04] 3ea8 0262                 move.w     610(a0),(a7)
[0002de08] 3f68 0264 0002            move.w     612(a0),2(a7)
[0002de0e] 7003                      moveq.l    #3,d0
[0002de10] 4eb9 0005 ae7e            jsr        Awi_update
[0002de16] 2f39 000e 692a            move.l     _globl,-(a7)
[0002de1c] 3f3c f060                 move.w     #$F060,-(a7)
[0002de20] 43ef 000c                 lea.l      12(a7),a1
[0002de24] 41ef 000a                 lea.l      10(a7),a0
[0002de28] 343c f060                 move.w     #$F060,d2
[0002de2c] 2a54                      movea.l    (a4),a5
[0002de2e] 322d 0264                 move.w     612(a5),d1
[0002de32] 302d 0262                 move.w     610(a5),d0
[0002de36] 4eb9 0007 a5be            jsr        mt_graf_rubbox
[0002de3c] 5c4f                      addq.w     #6,a7
[0002de3e] 302f 0004                 move.w     4(a7),d0
[0002de42] 6a0c                      bpl.s      $0002DE50
[0002de44] d157                      add.w      d0,(a7)
[0002de46] 302f 0004                 move.w     4(a7),d0
[0002de4a] 4440                      neg.w      d0
[0002de4c] 3f40 0004                 move.w     d0,4(a7)
[0002de50] 302f 0006                 move.w     6(a7),d0
[0002de54] 6a0e                      bpl.s      $0002DE64
[0002de56] d16f 0002                 add.w      d0,2(a7)
[0002de5a] 302f 0006                 move.w     6(a7),d0
[0002de5e] 4440                      neg.w      d0
[0002de60] 3f40 0006                 move.w     d0,6(a7)
[0002de64] 7002                      moveq.l    #2,d0
[0002de66] 4eb9 0005 ae7e            jsr        Awi_update
[0002de6c] 7602                      moveq.l    #2,d3
[0002de6e] 2054                      movea.l    (a4),a0
[0002de70] 214a 0240                 move.l     a2,576(a0)
[0002de74] 302a 0034                 move.w     52(a2),d0
[0002de78] d06b 0010                 add.w      16(a3),d0
[0002de7c] d043                      add.w      d3,d0
[0002de7e] 9157                      sub.w      d0,(a7)
[0002de80] 322a 0036                 move.w     54(a2),d1
[0002de84] d26b 0012                 add.w      18(a3),d1
[0002de88] d243                      add.w      d3,d1
[0002de8a] 936f 0002                 sub.w      d1,2(a7)
[0002de8e] 586f 0004                 addq.w     #4,4(a7)
[0002de92] 586f 0006                 addq.w     #4,6(a7)
[0002de96] 43d7                      lea.l      (a7),a1
[0002de98] 204a                      movea.l    a2,a0
[0002de9a] 3003                      move.w     d3,d0
[0002de9c] 6100 fe4e                 bsr        ob_find
[0002dea0] 2054                      movea.l    (a4),a0
[0002dea2] 2068 023c                 movea.l    572(a0),a0
[0002dea6] 41e8 0038                 lea.l      56(a0),a0
[0002deaa] 4eb9 0004 ee3c            jsr        Amo_new
[0002deb0] 504f                      addq.w     #8,a7
[0002deb2] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0002deb6] 4e75                      rts
ed_edit:
[0002deb8] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[0002debc] 594f                      subq.w     #4,a7
[0002debe] 4bf9 0010 ee4e            lea.l      ACSblk,a5
[0002dec4] 2055                      movea.l    (a5),a0
[0002dec6] 2468 0258                 movea.l    600(a0),a2
[0002deca] 286a 0014                 movea.l    20(a2),a4
[0002dece] 3628 0262                 move.w     610(a0),d3
[0002ded2] 3828 0264                 move.w     612(a0),d4
[0002ded6] 3a28 0266                 move.w     614(a0),d5
[0002deda] 2652                      movea.l    (a2),a3
[0002dedc] 3c28 0260                 move.w     608(a0),d6
[0002dee0] 3e06                      move.w     d6,d7
[0002dee2] 3207                      move.w     d7,d1
[0002dee4] 48c1                      ext.l      d1
[0002dee6] 2001                      move.l     d1,d0
[0002dee8] d080                      add.l      d0,d0
[0002deea] d081                      add.l      d1,d0
[0002deec] e788                      lsl.l      #3,d0
[0002deee] 3434 080a                 move.w     10(a4,d0.l),d2
[0002def2] c47c 1000                 and.w      #$1000,d2
[0002def6] 6702                      beq.s      $0002DEFA
[0002def8] 3c07                      move.w     d7,d6
[0002defa] be6b 0018                 cmp.w      24(a3),d7
[0002defe] 6710                      beq.s      $0002DF10
[0002df00] 3007                      move.w     d7,d0
[0002df02] 204c                      movea.l    a4,a0
[0002df04] 4eb9 0005 0f3a            jsr        Aob_up
[0002df0a] 3e00                      move.w     d0,d7
[0002df0c] 4a40                      tst.w      d0
[0002df0e] 6ad2                      bpl.s      $0002DEE2
[0002df10] 7004                      moveq.l    #4,d0
[0002df12] c045                      and.w      d5,d0
[0002df14] 6712                      beq.s      $0002DF28
[0002df16] bc6b 0018                 cmp.w      24(a3),d6
[0002df1a] 670c                      beq.s      $0002DF28
[0002df1c] 204c                      movea.l    a4,a0
[0002df1e] 3006                      move.w     d6,d0
[0002df20] 4eb9 0005 0f3a            jsr        Aob_up
[0002df26] 3c00                      move.w     d0,d6
[0002df28] 2055                      movea.l    (a5),a0
[0002df2a] 3228 0260                 move.w     608(a0),d1
[0002df2e] 48c1                      ext.l      d1
[0002df30] 2001                      move.l     d1,d0
[0002df32] d080                      add.l      d0,d0
[0002df34] d081                      add.l      d1,d0
[0002df36] e788                      lsl.l      #3,d0
[0002df38] 3434 080a                 move.w     10(a4,d0.l),d2
[0002df3c] c47c 4000                 and.w      #$4000,d2
[0002df40] 670e                      beq.s      $0002DF50
[0002df42] 3146 0260                 move.w     d6,608(a0)
[0002df46] 4eb9 0002 f9e0            jsr        open_it
[0002df4c] 6000 00b2                 bra        $0002E000
[0002df50] 7008                      moveq.l    #8,d0
[0002df52] c045                      and.w      d5,d0
[0002df54] 670a                      beq.s      $0002DF60
[0002df56] 204a                      movea.l    a2,a0
[0002df58] 6100 fe76                 bsr        draw_box
[0002df5c] 6000 00a2                 bra        $0002E000
[0002df60] 7001                      moveq.l    #1,d0
[0002df62] 3406                      move.w     d6,d2
[0002df64] 48c2                      ext.l      d2
[0002df66] 2202                      move.l     d2,d1
[0002df68] d281                      add.l      d1,d1
[0002df6a] d282                      add.l      d2,d1
[0002df6c] e789                      lsl.l      #3,d1
[0002df6e] c074 180a                 and.w      10(a4,d1.l),d0
[0002df72] 6718                      beq.s      $0002DF8C
[0002df74] 7e03                      moveq.l    #3,d7
[0002df76] ce45                      and.w      d5,d7
[0002df78] 676a                      beq.s      $0002DFE4
[0002df7a] 204a                      movea.l    a2,a0
[0002df7c] 3006                      move.w     d6,d0
[0002df7e] 4eb9 0004 7f76            jsr        Adr_del
[0002df84] 4eb9 0005 0c80            jsr        Aev_release
[0002df8a] 6074                      bra.s      $0002E000
[0002df8c] 7003                      moveq.l    #3,d0
[0002df8e] c045                      and.w      d5,d0
[0002df90] 6606                      bne.s      $0002DF98
[0002df92] 4eb9 0004 810e            jsr        Adr_unselect
[0002df98] 3006                      move.w     d6,d0
[0002df9a] 204a                      movea.l    a2,a0
[0002df9c] 4eb9 0002 e540            jsr        ob_addselect
[0002dfa2] 7e02                      moveq.l    #2,d7
[0002dfa4] 4bef 0002                 lea.l      2(a7),a5
[0002dfa8] 47f9 000e 692a            lea.l      _globl,a3
[0002dfae] 5347                      subq.w     #1,d7
[0002dfb0] 2053                      movea.l    (a3),a0
[0002dfb2] 700a                      moveq.l    #10,d0
[0002dfb4] 4eb9 0007 91d4            jsr        mt_evnt_timer
[0002dfba] 2f13                      move.l     (a3),-(a7)
[0002dfbc] 486f 0004                 pea.l      4(a7)
[0002dfc0] 4855                      pea.l      (a5)
[0002dfc2] 43ef 000c                 lea.l      12(a7),a1
[0002dfc6] 41ef 000c                 lea.l      12(a7),a0
[0002dfca] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0002dfd0] 4fef 000c                 lea.l      12(a7),a7
[0002dfd4] 7001                      moveq.l    #1,d0
[0002dfd6] c055                      and.w      (a5),d0
[0002dfd8] 5340                      subq.w     #1,d0
[0002dfda] 6604                      bne.s      $0002DFE0
[0002dfdc] 4a47                      tst.w      d7
[0002dfde] 6ec4                      bgt.s      $0002DFA4
[0002dfe0] 4a47                      tst.w      d7
[0002dfe2] 6e1c                      bgt.s      $0002E000
[0002dfe4] 3404                      move.w     d4,d2
[0002dfe6] 3203                      move.w     d3,d1
[0002dfe8] 3006                      move.w     d6,d0
[0002dfea] 204a                      movea.l    a2,a0
[0002dfec] 4eb9 0002 f04e            jsr        sizing
[0002dff2] 4a40                      tst.w      d0
[0002dff4] 670a                      beq.s      $0002E000
[0002dff6] 3204                      move.w     d4,d1
[0002dff8] 3003                      move.w     d3,d0
[0002dffa] 4eb9 0004 9140            jsr        Adr_drag
[0002e000] 584f                      addq.w     #4,a7
[0002e002] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[0002e006] 4e75                      rts
find_parent:
[0002e008] 48e7 003e                 movem.l    a2-a6,-(a7)
[0002e00c] 4fef fff4                 lea.l      -12(a7),a7
[0002e010] 2448                      movea.l    a0,a2
[0002e012] 2c49                      movea.l    a1,a6
[0002e014] 286f 0024                 movea.l    36(a7),a4
[0002e018] 2a6f 0028                 movea.l    40(a7),a5
[0002e01c] 2f50 0008                 move.l     (a0),8(a7)
[0002e020] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002e026] 2669 0240                 movea.l    576(a1),a3
[0002e02a] 2f39 000e 692a            move.l     _globl,-(a7)
[0002e030] 486f 0004                 pea.l      4(a7)
[0002e034] 43ef 000a                 lea.l      10(a7),a1
[0002e038] 206b 0014                 movea.l    20(a3),a0
[0002e03c] 4eb9 0007 9d14            jsr        mt_objc_offset
[0002e042] 504f                      addq.w     #8,a7
[0002e044] 302f 0002                 move.w     2(a7),d0
[0002e048] d06b 0034                 add.w      52(a3),d0
[0002e04c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e052] d068 0250                 add.w      592(a0),d0
[0002e056] 906a 0034                 sub.w      52(a2),d0
[0002e05a] 3880                      move.w     d0,(a4)
[0002e05c] 3217                      move.w     (a7),d1
[0002e05e] d26b 0036                 add.w      54(a3),d1
[0002e062] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e068] d268 0252                 add.w      594(a0),d1
[0002e06c] 926a 0036                 sub.w      54(a2),d1
[0002e070] 3a81                      move.w     d1,(a5)
[0002e072] 3f01                      move.w     d1,-(a7)
[0002e074] 3414                      move.w     (a4),d2
[0002e076] 206f 000a                 movea.l    10(a7),a0
[0002e07a] 3028 0018                 move.w     24(a0),d0
[0002e07e] 206a 0014                 movea.l    20(a2),a0
[0002e082] 7264                      moveq.l    #100,d1
[0002e084] 4eb9 0004 8fd4            jsr        Adr_find
[0002e08a] 544f                      addq.w     #2,a7
[0002e08c] 3c80                      move.w     d0,(a6)
[0002e08e] 47ef 0004                 lea.l      4(a7),a3
[0002e092] 3016                      move.w     (a6),d0
[0002e094] 6a4a                      bpl.s      $0002E0E0
[0002e096] 2f39 000e 692a            move.l     _globl,-(a7)
[0002e09c] 4853                      pea.l      (a3)
[0002e09e] 43ef 000e                 lea.l      14(a7),a1
[0002e0a2] 206f 0010                 movea.l    16(a7),a0
[0002e0a6] 3028 0018                 move.w     24(a0),d0
[0002e0aa] 206a 0014                 movea.l    20(a2),a0
[0002e0ae] 4eb9 0007 9d14            jsr        mt_objc_offset
[0002e0b4] 504f                      addq.w     #8,a7
[0002e0b6] 3014                      move.w     (a4),d0
[0002e0b8] b06f 0006                 cmp.w      6(a7),d0
[0002e0bc] 6c04                      bge.s      $0002E0C2
[0002e0be] 4254                      clr.w      (a4)
[0002e0c0] 6006                      bra.s      $0002E0C8
[0002e0c2] 302f 0006                 move.w     6(a7),d0
[0002e0c6] 9154                      sub.w      d0,(a4)
[0002e0c8] 3015                      move.w     (a5),d0
[0002e0ca] b053                      cmp.w      (a3),d0
[0002e0cc] 6c04                      bge.s      $0002E0D2
[0002e0ce] 4255                      clr.w      (a5)
[0002e0d0] 6004                      bra.s      $0002E0D6
[0002e0d2] 3013                      move.w     (a3),d0
[0002e0d4] 9155                      sub.w      d0,(a5)
[0002e0d6] 206f 0008                 movea.l    8(a7),a0
[0002e0da] 3ca8 0018                 move.w     24(a0),(a6)
[0002e0de] 6024                      bra.s      $0002E104
[0002e0e0] 2f39 000e 692a            move.l     _globl,-(a7)
[0002e0e6] 4853                      pea.l      (a3)
[0002e0e8] 43ef 000e                 lea.l      14(a7),a1
[0002e0ec] 3016                      move.w     (a6),d0
[0002e0ee] 206a 0014                 movea.l    20(a2),a0
[0002e0f2] 4eb9 0007 9d14            jsr        mt_objc_offset
[0002e0f8] 504f                      addq.w     #8,a7
[0002e0fa] 302f 0006                 move.w     6(a7),d0
[0002e0fe] 9154                      sub.w      d0,(a4)
[0002e100] 3013                      move.w     (a3),d0
[0002e102] 9155                      sub.w      d0,(a5)
[0002e104] 4fef 000c                 lea.l      12(a7),a7
[0002e108] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[0002e10c] 4e75                      rts
new_ob:
[0002e10e] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[0002e112] 4fef ffe6                 lea.l      -26(a7),a7
[0002e116] 2848                      movea.l    a0,a4
[0002e118] 3c00                      move.w     d0,d6
[0002e11a] 3801                      move.w     d1,d4
[0002e11c] 2f49 0016                 move.l     a1,22(a7)
[0002e120] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e126] 2f68 0240 0012            move.l     576(a0),18(a7)
[0002e12c] 48c0                      ext.l      d0
[0002e12e] 2400                      move.l     d0,d2
[0002e130] d482                      add.l      d2,d2
[0002e132] d480                      add.l      d0,d2
[0002e134] e78a                      lsl.l      #3,d2
[0002e136] 226f 0012                 movea.l    18(a7),a1
[0002e13a] 2069 0014                 movea.l    20(a1),a0
[0002e13e] 41f0 2818                 lea.l      24(a0,d2.l),a0
[0002e142] 2f68 000c 0004            move.l     12(a0),4(a7)
[0002e148] 3a28 0012                 move.w     18(a0),d5
[0002e14c] 2054                      movea.l    (a4),a0
[0002e14e] 3228 0018                 move.w     24(a0),d1
[0002e152] 6b00 027c                 bmi        $0002E3D0
[0002e156] 2e90                      move.l     (a0),(a7)
[0002e158] 2257                      movea.l    (a7),a1
[0002e15a] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002e160] 2468 0004                 movea.l    4(a0),a2
[0002e164] 2a6c 0014                 movea.l    20(a4),a5
[0002e168] 47ef 0008                 lea.l      8(a7),a3
[0002e16c] 486f 000e                 pea.l      14(a7)
[0002e170] 486f 0014                 pea.l      20(a7)
[0002e174] 224b                      movea.l    a3,a1
[0002e176] 3006                      move.w     d6,d0
[0002e178] 204c                      movea.l    a4,a0
[0002e17a] 6100 fe8c                 bsr        find_parent
[0002e17e] 504f                      addq.w     #8,a7
[0002e180] 3613                      move.w     (a3),d3
[0002e182] 3203                      move.w     d3,d1
[0002e184] 48c1                      ext.l      d1
[0002e186] 2001                      move.l     d1,d0
[0002e188] d080                      add.l      d0,d0
[0002e18a] d081                      add.l      d1,d0
[0002e18c] e788                      lsl.l      #3,d0
[0002e18e] 3435 080a                 move.w     10(a5,d0.l),d2
[0002e192] c47c 1000                 and.w      #$1000,d2
[0002e196] 6734                      beq.s      $0002E1CC
[0002e198] 4a44                      tst.w      d4
[0002e19a] 6700 0234                 beq        $0002E3D0
[0002e19e] 3206                      move.w     d6,d1
[0002e1a0] 48c1                      ext.l      d1
[0002e1a2] 2001                      move.l     d1,d0
[0002e1a4] d080                      add.l      d0,d0
[0002e1a6] d081                      add.l      d1,d0
[0002e1a8] e788                      lsl.l      #3,d0
[0002e1aa] 0275 ff7f 0808            andi.w     #$FF7F,8(a5,d0.l)
[0002e1b0] 0075 0001 080a            ori.w      #$0001,10(a5,d0.l)
[0002e1b6] 0275 ff7f 08f0            andi.w     #$FF7F,-16(a5,d0.l)
[0002e1bc] 70ff                      moveq.l    #-1,d0
[0002e1be] d046                      add.w      d6,d0
[0002e1c0] 204c                      movea.l    a4,a0
[0002e1c2] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002e1c8] 6000 0206                 bra        $0002E3D0
[0002e1cc] 3003                      move.w     d3,d0
[0002e1ce] 206c 0014                 movea.l    20(a4),a0
[0002e1d2] 4eb9 0005 0f3a            jsr        Aob_up
[0002e1d8] 3600                      move.w     d0,d3
[0002e1da] 4a40                      tst.w      d0
[0002e1dc] 6aa4                      bpl.s      $0002E182
[0002e1de] 72fe                      moveq.l    #-2,d1
[0002e1e0] d253                      add.w      (a3),d1
[0002e1e2] 48c1                      ext.l      d1
[0002e1e4] 83fc 0003                 divs.w     #$0003,d1
[0002e1e8] 3681                      move.w     d1,(a3)
[0002e1ea] 4a44                      tst.w      d4
[0002e1ec] 661e                      bne.s      $0002E20C
[0002e1ee] b5ef 0004                 cmpa.l     4(a7),a2
[0002e1f2] 6618                      bne.s      $0002E20C
[0002e1f4] ba41                      cmp.w      d1,d5
[0002e1f6] 6614                      bne.s      $0002E20C
[0002e1f8] 41f9 000c 49bd            lea.l      WARN_SAME,a0
[0002e1fe] 7001                      moveq.l    #1,d0
[0002e200] 4eb9 0005 a600            jsr        Awi_alert
[0002e206] 5340                      subq.w     #1,d0
[0002e208] 6700 01c6                 beq        $0002E3D0
[0002e20c] 3006                      move.w     d6,d0
[0002e20e] 206f 0012                 movea.l    18(a7),a0
[0002e212] 4eb9 0004 7f76            jsr        Adr_del
[0002e218] 4a44                      tst.w      d4
[0002e21a] 6718                      beq.s      $0002E234
[0002e21c] 76fe                      moveq.l    #-2,d3
[0002e21e] d646                      add.w      d6,d3
[0002e220] 48c3                      ext.l      d3
[0002e222] 87fc 0003                 divs.w     #$0003,d3
[0002e226] 3003                      move.w     d3,d0
[0002e228] 206a 0004                 movea.l    4(a2),a0
[0002e22c] 4eb9 0002 d368            jsr        free_ob
[0002e232] 6016                      bra.s      $0002E24A
[0002e234] 2f2f 0004                 move.l     4(a7),-(a7)
[0002e238] 3005                      move.w     d5,d0
[0002e23a] 224a                      movea.l    a2,a1
[0002e23c] 206f 0004                 movea.l    4(a7),a0
[0002e240] 4eb9 0002 d0dc            jsr        copysub_ob
[0002e246] 584f                      addq.w     #4,a7
[0002e248] 3600                      move.w     d0,d3
[0002e24a] 2a6a 0004                 movea.l    4(a2),a5
[0002e24e] 3203                      move.w     d3,d1
[0002e250] 48c1                      ext.l      d1
[0002e252] 2001                      move.l     d1,d0
[0002e254] e788                      lsl.l      #3,d0
[0002e256] 9081                      sub.l      d1,d0
[0002e258] e788                      lsl.l      #3,d0
[0002e25a] 3b93 0808                 move.w     (a3),8(a5,d0.l)
[0002e25e] 3813                      move.w     (a3),d4
[0002e260] 48c4                      ext.l      d4
[0002e262] 2404                      move.l     d4,d2
[0002e264] e78a                      lsl.l      #3,d2
[0002e266] 9484                      sub.l      d4,d2
[0002e268] e78a                      lsl.l      #3,d2
[0002e26a] 3835 280c                 move.w     12(a5,d2.l),d4
[0002e26e] 4a44                      tst.w      d4
[0002e270] 6b12                      bmi.s      $0002E284
[0002e272] 3c04                      move.w     d4,d6
[0002e274] 48c6                      ext.l      d6
[0002e276] 2a06                      move.l     d6,d5
[0002e278] e78d                      lsl.l      #3,d5
[0002e27a] 9a86                      sub.l      d6,d5
[0002e27c] e78d                      lsl.l      #3,d5
[0002e27e] 3b83 5808                 move.w     d3,8(a5,d5.l)
[0002e282] 6010                      bra.s      $0002E294
[0002e284] 3213                      move.w     (a3),d1
[0002e286] 48c1                      ext.l      d1
[0002e288] 2001                      move.l     d1,d0
[0002e28a] e788                      lsl.l      #3,d0
[0002e28c] 9081                      sub.l      d1,d0
[0002e28e] e788                      lsl.l      #3,d0
[0002e290] 3b83 080a                 move.w     d3,10(a5,d0.l)
[0002e294] 3213                      move.w     (a3),d1
[0002e296] 48c1                      ext.l      d1
[0002e298] 2001                      move.l     d1,d0
[0002e29a] e788                      lsl.l      #3,d0
[0002e29c] 9081                      sub.l      d1,d0
[0002e29e] e788                      lsl.l      #3,d0
[0002e2a0] 3b83 080c                 move.w     d3,12(a5,d0.l)
[0002e2a4] 382f 0010                 move.w     16(a7),d4
[0002e2a8] 3a2f 000e                 move.w     14(a7),d5
[0002e2ac] 3403                      move.w     d3,d2
[0002e2ae] 48c2                      ext.l      d2
[0002e2b0] 2202                      move.l     d2,d1
[0002e2b2] e789                      lsl.l      #3,d1
[0002e2b4] 9282                      sub.l      d2,d1
[0002e2b6] e789                      lsl.l      #3,d1
[0002e2b8] 3035 181c                 move.w     28(a5,d1.l),d0
[0002e2bc] 6100 f65e                 bsr        pixel_x
[0002e2c0] 3c00                      move.w     d0,d6
[0002e2c2] 3403                      move.w     d3,d2
[0002e2c4] 48c2                      ext.l      d2
[0002e2c6] 2202                      move.l     d2,d1
[0002e2c8] e789                      lsl.l      #3,d1
[0002e2ca] 9282                      sub.l      d2,d1
[0002e2cc] e789                      lsl.l      #3,d1
[0002e2ce] 3035 181e                 move.w     30(a5,d1.l),d0
[0002e2d2] 6100 f670                 bsr        pixel_y
[0002e2d6] 3f40 000c                 move.w     d0,12(a7)
[0002e2da] 3413                      move.w     (a3),d2
[0002e2dc] 48c2                      ext.l      d2
[0002e2de] 2202                      move.l     d2,d1
[0002e2e0] e789                      lsl.l      #3,d1
[0002e2e2] 9282                      sub.l      d2,d1
[0002e2e4] e789                      lsl.l      #3,d1
[0002e2e6] 3035 181c                 move.w     28(a5,d1.l),d0
[0002e2ea] 6100 f630                 bsr        pixel_x
[0002e2ee] 3e00                      move.w     d0,d7
[0002e2f0] 3413                      move.w     (a3),d2
[0002e2f2] 48c2                      ext.l      d2
[0002e2f4] 2202                      move.l     d2,d1
[0002e2f6] e789                      lsl.l      #3,d1
[0002e2f8] 9282                      sub.l      d2,d1
[0002e2fa] e789                      lsl.l      #3,d1
[0002e2fc] 3035 181e                 move.w     30(a5,d1.l),d0
[0002e300] 6100 f642                 bsr        pixel_y
[0002e304] 3f40 000a                 move.w     d0,10(a7)
[0002e308] 3204                      move.w     d4,d1
[0002e30a] d246                      add.w      d6,d1
[0002e30c] be41                      cmp.w      d1,d7
[0002e30e] 6c32                      bge.s      $0002E342
[0002e310] 3807                      move.w     d7,d4
[0002e312] 9846                      sub.w      d6,d4
[0002e314] 4a44                      tst.w      d4
[0002e316] 6a2a                      bpl.s      $0002E342
[0002e318] 4244                      clr.w      d4
[0002e31a] 41f9 000c 4a18            lea.l      WARN_XSHRINK,a0
[0002e320] 7001                      moveq.l    #1,d0
[0002e322] 4eb9 0005 a600            jsr        Awi_alert
[0002e328] 5340                      subq.w     #1,d0
[0002e32a] 6616                      bne.s      $0002E342
[0002e32c] 3007                      move.w     d7,d0
[0002e32e] 6100 f558                 bsr        char_x
[0002e332] 3403                      move.w     d3,d2
[0002e334] 48c2                      ext.l      d2
[0002e336] 2202                      move.l     d2,d1
[0002e338] e789                      lsl.l      #3,d1
[0002e33a] 9282                      sub.l      d2,d1
[0002e33c] e789                      lsl.l      #3,d1
[0002e33e] 3b80 181c                 move.w     d0,28(a5,d1.l)
[0002e342] 3005                      move.w     d5,d0
[0002e344] d06f 000c                 add.w      12(a7),d0
[0002e348] b06f 000a                 cmp.w      10(a7),d0
[0002e34c] 6f38                      ble.s      $0002E386
[0002e34e] 3a2f 000a                 move.w     10(a7),d5
[0002e352] 9a6f 000c                 sub.w      12(a7),d5
[0002e356] 4a45                      tst.w      d5
[0002e358] 6a2c                      bpl.s      $0002E386
[0002e35a] 4245                      clr.w      d5
[0002e35c] 41f9 000c 4a6f            lea.l      WARN_YSHRINK,a0
[0002e362] 7001                      moveq.l    #1,d0
[0002e364] 4eb9 0005 a600            jsr        Awi_alert
[0002e36a] 5340                      subq.w     #1,d0
[0002e36c] 6618                      bne.s      $0002E386
[0002e36e] 302f 000a                 move.w     10(a7),d0
[0002e372] 6100 f55e                 bsr        char_y
[0002e376] 3403                      move.w     d3,d2
[0002e378] 48c2                      ext.l      d2
[0002e37a] 2202                      move.l     d2,d1
[0002e37c] e789                      lsl.l      #3,d1
[0002e37e] 9282                      sub.l      d2,d1
[0002e380] e789                      lsl.l      #3,d1
[0002e382] 3b80 181e                 move.w     d0,30(a5,d1.l)
[0002e386] 3004                      move.w     d4,d0
[0002e388] 6100 f4fe                 bsr        char_x
[0002e38c] 3403                      move.w     d3,d2
[0002e38e] 48c2                      ext.l      d2
[0002e390] 2202                      move.l     d2,d1
[0002e392] e789                      lsl.l      #3,d1
[0002e394] 9282                      sub.l      d2,d1
[0002e396] e789                      lsl.l      #3,d1
[0002e398] 3b80 1818                 move.w     d0,24(a5,d1.l)
[0002e39c] 3005                      move.w     d5,d0
[0002e39e] 6100 f532                 bsr        char_y
[0002e3a2] 3403                      move.w     d3,d2
[0002e3a4] 48c2                      ext.l      d2
[0002e3a6] 2202                      move.l     d2,d1
[0002e3a8] e789                      lsl.l      #3,d1
[0002e3aa] 9282                      sub.l      d2,d1
[0002e3ac] e789                      lsl.l      #3,d1
[0002e3ae] 3b80 181a                 move.w     d0,26(a5,d1.l)
[0002e3b2] 206f 0016                 movea.l    22(a7),a0
[0002e3b6] 5250                      addq.w     #1,(a0)
[0002e3b8] 0c50 0005                 cmpi.w     #$0005,(a0)
[0002e3bc] 6c12                      bge.s      $0002E3D0
[0002e3be] 3003                      move.w     d3,d0
[0002e3c0] d040                      add.w      d0,d0
[0002e3c2] d043                      add.w      d3,d0
[0002e3c4] 5240                      addq.w     #1,d0
[0002e3c6] 3810                      move.w     (a0),d4
[0002e3c8] 48c4                      ext.l      d4
[0002e3ca] d884                      add.l      d4,d4
[0002e3cc] 3180 4800                 move.w     d0,0(a0,d4.l)
[0002e3d0] 4fef 001a                 lea.l      26(a7),a7
[0002e3d4] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[0002e3d8] 4e75                      rts
min_size:
[0002e3da] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002e3de] 4fef fff0                 lea.l      -16(a7),a7
[0002e3e2] 2f48 000c                 move.l     a0,12(a7)
[0002e3e6] 266f 0020                 movea.l    32(a7),a3
[0002e3ea] 286f 0024                 movea.l    36(a7),a4
[0002e3ee] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e3f4] 36a8 0012                 move.w     18(a0),(a3)
[0002e3f8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e3fe] 38a8 0014                 move.w     20(a0),(a4)
[0002e402] 2ea9 000c                 move.l     12(a1),(a7)
[0002e406] 1029 0007                 move.b     7(a1),d0
[0002e40a] 4880                      ext.w      d0
[0002e40c] 907c 0015                 sub.w      #$0015,d0
[0002e410] b07c 000c                 cmp.w      #$000C,d0
[0002e414] 6200 0104                 bhi        $0002E51A
[0002e418] d040                      add.w      d0,d0
[0002e41a] 303b 0006                 move.w     $0002E422(pc,d0.w),d0
[0002e41e] 4efb 0002                 jmp        $0002E422(pc,d0.w)
J21:
[0002e422] 001a                      dc.w $001a   ; $0002e43c-$0002e422
[0002e424] 001a                      dc.w $001a   ; $0002e43c-$0002e422
[0002e426] 0050                      dc.w $0050   ; $0002e472-$0002e422
[0002e428] 006e                      dc.w $006e   ; $0002e490-$0002e422
[0002e42a] 00f8                      dc.w $00f8   ; $0002e51a-$0002e422
[0002e42c] 00a6                      dc.w $00a6   ; $0002e4c8-$0002e422
[0002e42e] 00f8                      dc.w $00f8   ; $0002e51a-$0002e422
[0002e430] 00a6                      dc.w $00a6   ; $0002e4c8-$0002e422
[0002e432] 0034                      dc.w $0034   ; $0002e456-$0002e422
[0002e434] 0034                      dc.w $0034   ; $0002e456-$0002e422
[0002e436] 00bc                      dc.w $00bc   ; $0002e4de-$0002e422
[0002e438] 00a6                      dc.w $00a6   ; $0002e4c8-$0002e422
[0002e43a] 00bc                      dc.w $00bc   ; $0002e4de-$0002e422
[0002e43c] 2057                      movea.l    (a7),a0
[0002e43e] 2050                      movea.l    (a0),a0
[0002e440] 4eb9 0008 2f6c            jsr        strlen
[0002e446] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e44c] c1e8 0012                 muls.w     18(a0),d0
[0002e450] 3680                      move.w     d0,(a3)
[0002e452] 6000 00c6                 bra        $0002E51A
[0002e456] 2057                      movea.l    (a7),a0
[0002e458] 2068 0004                 movea.l    4(a0),a0
[0002e45c] 4eb9 0008 2f6c            jsr        strlen
[0002e462] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e468] c1e8 0012                 muls.w     18(a0),d0
[0002e46c] 3680                      move.w     d0,(a3)
[0002e46e] 6000 00aa                 bra        $0002E51A
[0002e472] 2057                      movea.l    (a7),a0
[0002e474] 3028 0004                 move.w     4(a0),d0
[0002e478] e748                      lsl.w      #3,d0
[0002e47a] d068 0008                 add.w      8(a0),d0
[0002e47e] 3680                      move.w     d0,(a3)
[0002e480] 2057                      movea.l    (a7),a0
[0002e482] 3228 0006                 move.w     6(a0),d1
[0002e486] d268 000a                 add.w      10(a0),d1
[0002e48a] 3881                      move.w     d1,(a4)
[0002e48c] 6000 008c                 bra        $0002E51A
[0002e490] 206f 000c                 movea.l    12(a7),a0
[0002e494] 2268 0014                 movea.l    20(a0),a1
[0002e498] 2f69 0004 0004            move.l     4(a1),4(a7)
[0002e49e] 206f 0004                 movea.l    4(a7),a0
[0002e4a2] 2050                      movea.l    (a0),a0
[0002e4a4] 41e8 0016                 lea.l      22(a0),a0
[0002e4a8] 4eb9 0002 4e1a            jsr        part_get
[0002e4ae] 2f48 0008                 move.l     a0,8(a7)
[0002e4b2] 2008                      move.l     a0,d0
[0002e4b4] 6764                      beq.s      $0002E51A
[0002e4b6] 2f0c                      move.l     a4,-(a7)
[0002e4b8] 224b                      movea.l    a3,a1
[0002e4ba] 2468 003c                 movea.l    60(a0),a2
[0002e4be] 206f 0004                 movea.l    4(a7),a0
[0002e4c2] 4e92                      jsr        (a2)
[0002e4c4] 584f                      addq.w     #4,a7
[0002e4c6] 6052                      bra.s      $0002E51A
[0002e4c8] 2057                      movea.l    (a7),a0
[0002e4ca] 4eb9 0008 2f6c            jsr        strlen
[0002e4d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e4d6] c1e8 0012                 muls.w     18(a0),d0
[0002e4da] 3680                      move.w     d0,(a3)
[0002e4dc] 603c                      bra.s      $0002E51A
[0002e4de] 2057                      movea.l    (a7),a0
[0002e4e0] 3028 001a                 move.w     26(a0),d0
[0002e4e4] d068 001e                 add.w      30(a0),d0
[0002e4e8] 3228 0012                 move.w     18(a0),d1
[0002e4ec] d268 0016                 add.w      22(a0),d1
[0002e4f0] b240                      cmp.w      d0,d1
[0002e4f2] 6c04                      bge.s      $0002E4F8
[0002e4f4] 3400                      move.w     d0,d2
[0002e4f6] 6002                      bra.s      $0002E4FA
[0002e4f8] 3401                      move.w     d1,d2
[0002e4fa] 3682                      move.w     d2,(a3)
[0002e4fc] 2057                      movea.l    (a7),a0
[0002e4fe] 3028 001c                 move.w     28(a0),d0
[0002e502] d068 0020                 add.w      32(a0),d0
[0002e506] 3228 0014                 move.w     20(a0),d1
[0002e50a] d268 0018                 add.w      24(a0),d1
[0002e50e] b240                      cmp.w      d0,d1
[0002e510] 6c04                      bge.s      $0002E516
[0002e512] 3400                      move.w     d0,d2
[0002e514] 6002                      bra.s      $0002E518
[0002e516] 3401                      move.w     d1,d2
[0002e518] 3882                      move.w     d2,(a4)
[0002e51a] 3013                      move.w     (a3),d0
[0002e51c] 6e0a                      bgt.s      $0002E528
[0002e51e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e524] 36a8 0012                 move.w     18(a0),(a3)
[0002e528] 3014                      move.w     (a4),d0
[0002e52a] 6e0a                      bgt.s      $0002E536
[0002e52c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e532] 38a8 0014                 move.w     20(a0),(a4)
[0002e536] 4fef 0010                 lea.l      16(a7),a7
[0002e53a] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002e53e] 4e75                      rts
ob_addselect:
[0002e540] 48e7 1c38                 movem.l    d3-d5/a2-a4,-(a7)
[0002e544] 2448                      movea.l    a0,a2
[0002e546] 3600                      move.w     d0,d3
[0002e548] 266a 0014                 movea.l    20(a2),a3
[0002e54c] 49f9 0010 ee4e            lea.l      ACSblk,a4
[0002e552] 2054                      movea.l    (a4),a0
[0002e554] 3028 0246                 move.w     582(a0),d0
[0002e558] 6f00 00b8                 ble        $0002E612
[0002e55c] 3803                      move.w     d3,d4
[0002e55e] 3004                      move.w     d4,d0
[0002e560] 204b                      movea.l    a3,a0
[0002e562] 4eb9 0005 0f3a            jsr        Aob_up
[0002e568] 3800                      move.w     d0,d4
[0002e56a] 4a40                      tst.w      d0
[0002e56c] 6f1c                      ble.s      $0002E58A
[0002e56e] 7201                      moveq.l    #1,d1
[0002e570] 48c0                      ext.l      d0
[0002e572] 2400                      move.l     d0,d2
[0002e574] d482                      add.l      d2,d2
[0002e576] d480                      add.l      d0,d2
[0002e578] e78a                      lsl.l      #3,d2
[0002e57a] c273 280a                 and.w      10(a3,d2.l),d1
[0002e57e] 67de                      beq.s      $0002E55E
[0002e580] 204a                      movea.l    a2,a0
[0002e582] 3004                      move.w     d4,d0
[0002e584] 4eb9 0004 7f76            jsr        Adr_del
[0002e58a] 7801                      moveq.l    #1,d4
[0002e58c] 3203                      move.w     d3,d1
[0002e58e] 48c1                      ext.l      d1
[0002e590] 2001                      move.l     d1,d0
[0002e592] d080                      add.l      d0,d0
[0002e594] d081                      add.l      d1,d0
[0002e596] e788                      lsl.l      #3,d0
[0002e598] d873 0802                 add.w      2(a3,d0.l),d4
[0002e59c] 4a44                      tst.w      d4
[0002e59e] 6f00 0072                 ble.w      $0002E612
[0002e5a2] 606a                      bra.s      $0002E60E
[0002e5a4] 7001                      moveq.l    #1,d0
[0002e5a6] 3404                      move.w     d4,d2
[0002e5a8] 48c2                      ext.l      d2
[0002e5aa] 2202                      move.l     d2,d1
[0002e5ac] d281                      add.l      d1,d1
[0002e5ae] d282                      add.l      d2,d1
[0002e5b0] e789                      lsl.l      #3,d1
[0002e5b2] c073 180a                 and.w      10(a3,d1.l),d0
[0002e5b6] 6712                      beq.s      $0002E5CA
[0002e5b8] 204a                      movea.l    a2,a0
[0002e5ba] 3004                      move.w     d4,d0
[0002e5bc] 4eb9 0004 7f76            jsr        Adr_del
[0002e5c2] 2054                      movea.l    (a4),a0
[0002e5c4] 3028 0246                 move.w     582(a0),d0
[0002e5c8] 6748                      beq.s      $0002E612
[0002e5ca] 7a01                      moveq.l    #1,d5
[0002e5cc] 3204                      move.w     d4,d1
[0002e5ce] 48c1                      ext.l      d1
[0002e5d0] 2001                      move.l     d1,d0
[0002e5d2] d080                      add.l      d0,d0
[0002e5d4] d081                      add.l      d1,d0
[0002e5d6] e788                      lsl.l      #3,d0
[0002e5d8] da73 0802                 add.w      2(a3,d0.l),d5
[0002e5dc] ba7c 0001                 cmp.w      #$0001,d5
[0002e5e0] 6c2a                      bge.s      $0002E60C
[0002e5e2] 6002                      bra.s      $0002E5E6
[0002e5e4] 3805                      move.w     d5,d4
[0002e5e6] 3204                      move.w     d4,d1
[0002e5e8] 48c1                      ext.l      d1
[0002e5ea] 2001                      move.l     d1,d0
[0002e5ec] d080                      add.l      d0,d0
[0002e5ee] d081                      add.l      d1,d0
[0002e5f0] e788                      lsl.l      #3,d0
[0002e5f2] 3a33 0800                 move.w     0(a3,d0.l),d5
[0002e5f6] b645                      cmp.w      d5,d3
[0002e5f8] 6712                      beq.s      $0002E60C
[0002e5fa] 3005                      move.w     d5,d0
[0002e5fc] 48c0                      ext.l      d0
[0002e5fe] 2400                      move.l     d0,d2
[0002e600] d482                      add.l      d2,d2
[0002e602] d480                      add.l      d0,d2
[0002e604] e78a                      lsl.l      #3,d2
[0002e606] b873 2804                 cmp.w      4(a3,d2.l),d4
[0002e60a] 67d8                      beq.s      $0002E5E4
[0002e60c] 3805                      move.w     d5,d4
[0002e60e] b644                      cmp.w      d4,d3
[0002e610] 6692                      bne.s      $0002E5A4
[0002e612] 3003                      move.w     d3,d0
[0002e614] 204a                      movea.l    a2,a0
[0002e616] 4eb9 0004 7e6a            jsr        Adr_add
[0002e61c] 2052                      movea.l    (a2),a0
[0002e61e] 70fe                      moveq.l    #-2,d0
[0002e620] d043                      add.w      d3,d0
[0002e622] 48c0                      ext.l      d0
[0002e624] 81fc 0003                 divs.w     #$0003,d0
[0002e628] 3140 000a                 move.w     d0,10(a0)
[0002e62c] 4cdf 1c38                 movem.l    (a7)+,d3-d5/a2-a4
[0002e630] 4e75                      rts
edob_next:
[0002e632] 48e7 1c38                 movem.l    d3-d5/a2-a4,-(a7)
[0002e636] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002e63c] 2052                      movea.l    (a2),a0
[0002e63e] 2268 0258                 movea.l    600(a0),a1
[0002e642] 2651                      movea.l    (a1),a3
[0002e644] 362b 000a                 move.w     10(a3),d3
[0002e648] 4a43                      tst.w      d3
[0002e64a] 6b00 00ee                 bmi        $0002E73A
[0002e64e] 302b 0018                 move.w     24(a3),d0
[0002e652] 6b00 00e6                 bmi        $0002E73A
[0002e656] 78fe                      moveq.l    #-2,d4
[0002e658] d840                      add.w      d0,d4
[0002e65a] 48c4                      ext.l      d4
[0002e65c] 89fc 0003                 divs.w     #$0003,d4
[0002e660] 206b 0004                 movea.l    4(a3),a0
[0002e664] 2868 0004                 movea.l    4(a0),a4
[0002e668] 2252                      movea.l    (a2),a1
[0002e66a] 0c69 0001 0246            cmpi.w     #$0001,582(a1)
[0002e670] 6600 00aa                 bne        $0002E71C
[0002e674] 2069 0240                 movea.l    576(a1),a0
[0002e678] b1e9 0258                 cmpa.l     600(a1),a0
[0002e67c] 6600 009e                 bne        $0002E71C
[0002e680] 3203                      move.w     d3,d1
[0002e682] 48c1                      ext.l      d1
[0002e684] 2001                      move.l     d1,d0
[0002e686] e788                      lsl.l      #3,d0
[0002e688] 9081                      sub.l      d1,d0
[0002e68a] e788                      lsl.l      #3,d0
[0002e68c] 3434 0812                 move.w     18(a4,d0.l),d2
[0002e690] c47c 1000                 and.w      #$1000,d2
[0002e694] 661a                      bne.s      $0002E6B0
[0002e696] b843                      cmp.w      d3,d4
[0002e698] 671a                      beq.s      $0002E6B4
[0002e69a] 303c 0080                 move.w     #$0080,d0
[0002e69e] 3403                      move.w     d3,d2
[0002e6a0] 48c2                      ext.l      d2
[0002e6a2] 2202                      move.l     d2,d1
[0002e6a4] e789                      lsl.l      #3,d1
[0002e6a6] 9282                      sub.l      d2,d1
[0002e6a8] e789                      lsl.l      #3,d1
[0002e6aa] c074 1810                 and.w      16(a4,d1.l),d0
[0002e6ae] 6704                      beq.s      $0002E6B4
[0002e6b0] 7aff                      moveq.l    #-1,d5
[0002e6b2] 6010                      bra.s      $0002E6C4
[0002e6b4] 3203                      move.w     d3,d1
[0002e6b6] 48c1                      ext.l      d1
[0002e6b8] 2001                      move.l     d1,d0
[0002e6ba] e788                      lsl.l      #3,d0
[0002e6bc] 9081                      sub.l      d1,d0
[0002e6be] e788                      lsl.l      #3,d0
[0002e6c0] 3a34 080a                 move.w     10(a4,d0.l),d5
[0002e6c4] 4a45                      tst.w      d5
[0002e6c6] 6a2e                      bpl.s      $0002E6F6
[0002e6c8] 6028                      bra.s      $0002E6F2
[0002e6ca] 3203                      move.w     d3,d1
[0002e6cc] 48c1                      ext.l      d1
[0002e6ce] 2001                      move.l     d1,d0
[0002e6d0] e788                      lsl.l      #3,d0
[0002e6d2] 9081                      sub.l      d1,d0
[0002e6d4] e788                      lsl.l      #3,d0
[0002e6d6] 3a34 0808                 move.w     8(a4,d0.l),d5
[0002e6da] 4a45                      tst.w      d5
[0002e6dc] 6b18                      bmi.s      $0002E6F6
[0002e6de] 3005                      move.w     d5,d0
[0002e6e0] 48c0                      ext.l      d0
[0002e6e2] 2400                      move.l     d0,d2
[0002e6e4] e78a                      lsl.l      #3,d2
[0002e6e6] 9480                      sub.l      d0,d2
[0002e6e8] e78a                      lsl.l      #3,d2
[0002e6ea] b674 280c                 cmp.w      12(a4,d2.l),d3
[0002e6ee] 6606                      bne.s      $0002E6F6
[0002e6f0] 3605                      move.w     d5,d3
[0002e6f2] b843                      cmp.w      d3,d4
[0002e6f4] 66d4                      bne.s      $0002E6CA
[0002e6f6] 4a45                      tst.w      d5
[0002e6f8] 6a04                      bpl.s      $0002E6FE
[0002e6fa] 3604                      move.w     d4,d3
[0002e6fc] 6002                      bra.s      $0002E700
[0002e6fe] 3605                      move.w     d5,d3
[0002e700] b843                      cmp.w      d3,d4
[0002e702] 6718                      beq.s      $0002E71C
[0002e704] 303c 0080                 move.w     #$0080,d0
[0002e708] 3403                      move.w     d3,d2
[0002e70a] 48c2                      ext.l      d2
[0002e70c] 2202                      move.l     d2,d1
[0002e70e] e789                      lsl.l      #3,d1
[0002e710] 9282                      sub.l      d2,d1
[0002e712] e789                      lsl.l      #3,d1
[0002e714] c074 1810                 and.w      16(a4,d1.l),d0
[0002e718] 6600 ff66                 bne        $0002E680
[0002e71c] 3743 000a                 move.w     d3,10(a3)
[0002e720] 4eb9 0004 810e            jsr        Adr_unselect
[0002e726] 3003                      move.w     d3,d0
[0002e728] d040                      add.w      d0,d0
[0002e72a] d043                      add.w      d3,d0
[0002e72c] 5440                      addq.w     #2,d0
[0002e72e] 2052                      movea.l    (a2),a0
[0002e730] 2068 0258                 movea.l    600(a0),a0
[0002e734] 4eb9 0004 7e6a            jsr        Adr_add
[0002e73a] 4cdf 1c38                 movem.l    (a7)+,d3-d5/a2-a4
[0002e73e] 4e75                      rts
rubberbox:
[0002e740] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0002e744] 4fef ffaa                 lea.l      -86(a7),a7
[0002e748] 3f40 0054                 move.w     d0,84(a7)
[0002e74c] 3a01                      move.w     d1,d5
[0002e74e] 3c02                      move.w     d2,d6
[0002e750] 2649                      movea.l    a1,a3
[0002e752] 246f 0082                 movea.l    130(a7),a2
[0002e756] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002e75c] 3229 0012                 move.w     18(a1),d1
[0002e760] e241                      asr.w      #1,d1
[0002e762] 3f41 0038                 move.w     d1,56(a7)
[0002e766] 3429 0014                 move.w     20(a1),d2
[0002e76a] e242                      asr.w      #1,d2
[0002e76c] 3f42 0036                 move.w     d2,54(a7)
[0002e770] 2f50 0008                 move.l     (a0),8(a7)
[0002e774] 2868 0014                 movea.l    20(a0),a4
[0002e778] 41f9 000a 7d22            lea.l      INFO_OB_WH,a0
[0002e77e] 4eb9 0004 f064            jsr        Aob_create
[0002e784] 2a48                      movea.l    a0,a5
[0002e786] 200d                      move.l     a5,d0
[0002e788] 6700 00b4                 beq        $0002E83E
[0002e78c] 4eb9 0004 fbdc            jsr        Aob_fix
[0002e792] 3005                      move.w     d5,d0
[0002e794] 906d 0014                 sub.w      20(a5),d0
[0002e798] 3b40 0010                 move.w     d0,16(a5)
[0002e79c] 3206                      move.w     d6,d1
[0002e79e] 926d 0016                 sub.w      22(a5),d1
[0002e7a2] 3b41 0012                 move.w     d1,18(a5)
[0002e7a6] 302d 0010                 move.w     16(a5),d0
[0002e7aa] 6b04                      bmi.s      $0002E7B0
[0002e7ac] 4a41                      tst.w      d1
[0002e7ae] 6a0e                      bpl.s      $0002E7BE
[0002e7b0] 204d                      movea.l    a5,a0
[0002e7b2] 4eb9 0004 f20a            jsr        Aob_delete
[0002e7b8] 9bcd                      suba.l     a5,a5
[0002e7ba] 6000 0082                 bra        $0002E83E
[0002e7be] 322d 0016                 move.w     22(a5),d1
[0002e7c2] 302d 0014                 move.w     20(a5),d0
[0002e7c6] 4eb9 0005 4b6e            jsr        Abp_create
[0002e7cc] 2f48 0018                 move.l     a0,24(a7)
[0002e7d0] 676c                      beq.s      $0002E83E
[0002e7d2] 302d 0010                 move.w     16(a5),d0
[0002e7d6] 3f40 001c                 move.w     d0,28(a7)
[0002e7da] 72ff                      moveq.l    #-1,d1
[0002e7dc] d26d 0014                 add.w      20(a5),d1
[0002e7e0] 3f41 0028                 move.w     d1,40(a7)
[0002e7e4] d041                      add.w      d1,d0
[0002e7e6] 3f40 0020                 move.w     d0,32(a7)
[0002e7ea] 322d 0012                 move.w     18(a5),d1
[0002e7ee] 3f41 001e                 move.w     d1,30(a7)
[0002e7f2] 70ff                      moveq.l    #-1,d0
[0002e7f4] d06d 0016                 add.w      22(a5),d0
[0002e7f8] 3f40 002a                 move.w     d0,42(a7)
[0002e7fc] d240                      add.w      d0,d1
[0002e7fe] 3f41 0022                 move.w     d1,34(a7)
[0002e802] 4240                      clr.w      d0
[0002e804] 3f40 0026                 move.w     d0,38(a7)
[0002e808] 3f40 0024                 move.w     d0,36(a7)
[0002e80c] 4eb9 0004 ef40            jsr        Amo_hide
[0002e812] 2f2f 0018                 move.l     24(a7),-(a7)
[0002e816] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002e81c] 43e9 026a                 lea.l      618(a1),a1
[0002e820] 41ef 0020                 lea.l      32(a7),a0
[0002e824] 7203                      moveq.l    #3,d1
[0002e826] 2c79 0010 ee4e            movea.l    ACSblk,a6
[0002e82c] 302e 0010                 move.w     16(a6),d0
[0002e830] 4eb9 0007 489e            jsr        vro_cpyfm
[0002e836] 584f                      addq.w     #4,a7
[0002e838] 4eb9 0004 ef66            jsr        Amo_show
[0002e83e] 206f 0008                 movea.l    8(a7),a0
[0002e842] 2268 0004                 movea.l    4(a0),a1
[0002e846] 2f69 0004 0004            move.l     4(a1),4(a7)
[0002e84c] 72fe                      moveq.l    #-2,d1
[0002e84e] d26f 0054                 add.w      84(a7),d1
[0002e852] 48c1                      ext.l      d1
[0002e854] 83fc 0003                 divs.w     #$0003,d1
[0002e858] 48c1                      ext.l      d1
[0002e85a] 2001                      move.l     d1,d0
[0002e85c] e788                      lsl.l      #3,d0
[0002e85e] 9081                      sub.l      d1,d0
[0002e860] e788                      lsl.l      #3,d0
[0002e862] 2c6f 0004                 movea.l    4(a7),a6
[0002e866] ddc0                      adda.l     d0,a6
[0002e868] 2e8e                      move.l     a6,(a7)
[0002e86a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e870] 2068 023c                 movea.l    572(a0),a0
[0002e874] 41e8 0044                 lea.l      68(a0),a0
[0002e878] 4eb9 0004 ee3c            jsr        Amo_new
[0002e87e] 486f 0050                 pea.l      80(a7)
[0002e882] 486f 0056                 pea.l      86(a7)
[0002e886] 322f 005c                 move.w     92(a7),d1
[0002e88a] 48c1                      ext.l      d1
[0002e88c] 2001                      move.l     d1,d0
[0002e88e] d080                      add.l      d0,d0
[0002e890] d081                      add.l      d1,d0
[0002e892] e788                      lsl.l      #3,d0
[0002e894] 43f4 08e8                 lea.l      -24(a4,d0.l),a1
[0002e898] 206f 0008                 movea.l    8(a7),a0
[0002e89c] 6100 fb3c                 bsr        min_size
[0002e8a0] 504f                      addq.w     #8,a7
[0002e8a2] 322f 0054                 move.w     84(a7),d1
[0002e8a6] 48c1                      ext.l      d1
[0002e8a8] 2001                      move.l     d1,d0
[0002e8aa] d080                      add.l      d0,d0
[0002e8ac] d081                      add.l      d1,d0
[0002e8ae] e788                      lsl.l      #3,d0
[0002e8b0] 3634 0802                 move.w     2(a4,d0.l),d3
[0002e8b4] 4a43                      tst.w      d3
[0002e8b6] 6f00 01d4                 ble        $0002EA8C
[0002e8ba] 7440                      moveq.l    #64,d2
[0002e8bc] c474 080a                 and.w      10(a4,d0.l),d2
[0002e8c0] 6600 01ca                 bne        $0002EA8C
[0002e8c4] 3203                      move.w     d3,d1
[0002e8c6] 48c1                      ext.l      d1
[0002e8c8] 2001                      move.l     d1,d0
[0002e8ca] d080                      add.l      d0,d0
[0002e8cc] d081                      add.l      d1,d0
[0002e8ce] e788                      lsl.l      #3,d0
[0002e8d0] 3434 080a                 move.w     10(a4,d0.l),d2
[0002e8d4] c47c 0300                 and.w      #$0300,d2
[0002e8d8] 4a42                      tst.w      d2
[0002e8da] 6718                      beq.s      $0002E8F4
[0002e8dc] 947c 0100                 sub.w      #$0100,d2
[0002e8e0] 6700 0084                 beq        $0002E966
[0002e8e4] 947c 0100                 sub.w      #$0100,d2
[0002e8e8] 6722                      beq.s      $0002E90C
[0002e8ea] 947c 0100                 sub.w      #$0100,d2
[0002e8ee] 6752                      beq.s      $0002E942
[0002e8f0] 6000 00a0                 bra        $0002E992
[0002e8f4] 3203                      move.w     d3,d1
[0002e8f6] 48c1                      ext.l      d1
[0002e8f8] 2001                      move.l     d1,d0
[0002e8fa] d080                      add.l      d0,d0
[0002e8fc] d081                      add.l      d1,d0
[0002e8fe] e788                      lsl.l      #3,d0
[0002e900] 3834 0810                 move.w     16(a4,d0.l),d4
[0002e904] d874 0814                 add.w      20(a4,d0.l),d4
[0002e908] 6000 0088                 bra        $0002E992
[0002e90c] 322f 0054                 move.w     84(a7),d1
[0002e910] 48c1                      ext.l      d1
[0002e912] 2001                      move.l     d1,d0
[0002e914] d080                      add.l      d0,d0
[0002e916] d081                      add.l      d1,d0
[0002e918] e788                      lsl.l      #3,d0
[0002e91a] 3834 0814                 move.w     20(a4,d0.l),d4
[0002e91e] 3003                      move.w     d3,d0
[0002e920] 48c0                      ext.l      d0
[0002e922] 2400                      move.l     d0,d2
[0002e924] d482                      add.l      d2,d2
[0002e926] d480                      add.l      d0,d2
[0002e928] e78a                      lsl.l      #3,d2
[0002e92a] 9874 2810                 sub.w      16(a4,d2.l),d4
[0002e92e] 3234 2810                 move.w     16(a4,d2.l),d1
[0002e932] d274 2814                 add.w      20(a4,d2.l),d1
[0002e936] 3f41 004a                 move.w     d1,74(a7)
[0002e93a] b841                      cmp.w      d1,d4
[0002e93c] 6c54                      bge.s      $0002E992
[0002e93e] 3801                      move.w     d1,d4
[0002e940] 6050                      bra.s      $0002E992
[0002e942] 322f 0054                 move.w     84(a7),d1
[0002e946] 48c1                      ext.l      d1
[0002e948] 2001                      move.l     d1,d0
[0002e94a] d080                      add.l      d0,d0
[0002e94c] d081                      add.l      d1,d0
[0002e94e] e788                      lsl.l      #3,d0
[0002e950] 3834 0814                 move.w     20(a4,d0.l),d4
[0002e954] 3003                      move.w     d3,d0
[0002e956] 48c0                      ext.l      d0
[0002e958] 2400                      move.l     d0,d2
[0002e95a] d482                      add.l      d2,d2
[0002e95c] d480                      add.l      d0,d2
[0002e95e] e78a                      lsl.l      #3,d2
[0002e960] 9874 2810                 sub.w      16(a4,d2.l),d4
[0002e964] 602c                      bra.s      $0002E992
[0002e966] 322f 0054                 move.w     84(a7),d1
[0002e96a] 48c1                      ext.l      d1
[0002e96c] 2001                      move.l     d1,d0
[0002e96e] d080                      add.l      d0,d0
[0002e970] d081                      add.l      d1,d0
[0002e972] e788                      lsl.l      #3,d0
[0002e974] 3834 0814                 move.w     20(a4,d0.l),d4
[0002e978] 3003                      move.w     d3,d0
[0002e97a] 48c0                      ext.l      d0
[0002e97c] 2400                      move.l     d0,d2
[0002e97e] d482                      add.l      d2,d2
[0002e980] d480                      add.l      d0,d2
[0002e982] e78a                      lsl.l      #3,d2
[0002e984] 9874 2814                 sub.w      20(a4,d2.l),d4
[0002e988] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002e98e] d868 0012                 add.w      18(a0),d4
[0002e992] b86f 0052                 cmp.w      82(a7),d4
[0002e996] 6f04                      ble.s      $0002E99C
[0002e998] 3f44 0052                 move.w     d4,82(a7)
[0002e99c] 3203                      move.w     d3,d1
[0002e99e] 48c1                      ext.l      d1
[0002e9a0] 2001                      move.l     d1,d0
[0002e9a2] d080                      add.l      d0,d0
[0002e9a4] d081                      add.l      d1,d0
[0002e9a6] e788                      lsl.l      #3,d0
[0002e9a8] 3434 080a                 move.w     10(a4,d0.l),d2
[0002e9ac] c47c 0c00                 and.w      #$0C00,d2
[0002e9b0] 4a42                      tst.w      d2
[0002e9b2] 6718                      beq.s      $0002E9CC
[0002e9b4] 947c 0400                 sub.w      #$0400,d2
[0002e9b8] 6700 0084                 beq        $0002EA3E
[0002e9bc] 947c 0400                 sub.w      #$0400,d2
[0002e9c0] 6722                      beq.s      $0002E9E4
[0002e9c2] 947c 0400                 sub.w      #$0400,d2
[0002e9c6] 6752                      beq.s      $0002EA1A
[0002e9c8] 6000 00a0                 bra        $0002EA6A
[0002e9cc] 3203                      move.w     d3,d1
[0002e9ce] 48c1                      ext.l      d1
[0002e9d0] 2001                      move.l     d1,d0
[0002e9d2] d080                      add.l      d0,d0
[0002e9d4] d081                      add.l      d1,d0
[0002e9d6] e788                      lsl.l      #3,d0
[0002e9d8] 3e34 0812                 move.w     18(a4,d0.l),d7
[0002e9dc] de74 0816                 add.w      22(a4,d0.l),d7
[0002e9e0] 6000 0088                 bra        $0002EA6A
[0002e9e4] 322f 0054                 move.w     84(a7),d1
[0002e9e8] 48c1                      ext.l      d1
[0002e9ea] 2001                      move.l     d1,d0
[0002e9ec] d080                      add.l      d0,d0
[0002e9ee] d081                      add.l      d1,d0
[0002e9f0] e788                      lsl.l      #3,d0
[0002e9f2] 3e34 0816                 move.w     22(a4,d0.l),d7
[0002e9f6] 3003                      move.w     d3,d0
[0002e9f8] 48c0                      ext.l      d0
[0002e9fa] 2400                      move.l     d0,d2
[0002e9fc] d482                      add.l      d2,d2
[0002e9fe] d480                      add.l      d0,d2
[0002ea00] e78a                      lsl.l      #3,d2
[0002ea02] 9e74 2812                 sub.w      18(a4,d2.l),d7
[0002ea06] 3234 2812                 move.w     18(a4,d2.l),d1
[0002ea0a] d274 2816                 add.w      22(a4,d2.l),d1
[0002ea0e] 3f41 004a                 move.w     d1,74(a7)
[0002ea12] be41                      cmp.w      d1,d7
[0002ea14] 6c54                      bge.s      $0002EA6A
[0002ea16] 3e01                      move.w     d1,d7
[0002ea18] 6050                      bra.s      $0002EA6A
[0002ea1a] 322f 0054                 move.w     84(a7),d1
[0002ea1e] 48c1                      ext.l      d1
[0002ea20] 2001                      move.l     d1,d0
[0002ea22] d080                      add.l      d0,d0
[0002ea24] d081                      add.l      d1,d0
[0002ea26] e788                      lsl.l      #3,d0
[0002ea28] 3e34 0816                 move.w     22(a4,d0.l),d7
[0002ea2c] 3003                      move.w     d3,d0
[0002ea2e] 48c0                      ext.l      d0
[0002ea30] 2400                      move.l     d0,d2
[0002ea32] d482                      add.l      d2,d2
[0002ea34] d480                      add.l      d0,d2
[0002ea36] e78a                      lsl.l      #3,d2
[0002ea38] 9e74 2812                 sub.w      18(a4,d2.l),d7
[0002ea3c] 602c                      bra.s      $0002EA6A
[0002ea3e] 322f 0054                 move.w     84(a7),d1
[0002ea42] 48c1                      ext.l      d1
[0002ea44] 2001                      move.l     d1,d0
[0002ea46] d080                      add.l      d0,d0
[0002ea48] d081                      add.l      d1,d0
[0002ea4a] e788                      lsl.l      #3,d0
[0002ea4c] 3e34 0816                 move.w     22(a4,d0.l),d7
[0002ea50] 3003                      move.w     d3,d0
[0002ea52] 48c0                      ext.l      d0
[0002ea54] 2400                      move.l     d0,d2
[0002ea56] d482                      add.l      d2,d2
[0002ea58] d480                      add.l      d0,d2
[0002ea5a] e78a                      lsl.l      #3,d2
[0002ea5c] 9e74 2816                 sub.w      22(a4,d2.l),d7
[0002ea60] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ea66] de68 0014                 add.w      20(a0),d7
[0002ea6a] be6f 0050                 cmp.w      80(a7),d7
[0002ea6e] 6f04                      ble.s      $0002EA74
[0002ea70] 3f47 0050                 move.w     d7,80(a7)
[0002ea74] 3203                      move.w     d3,d1
[0002ea76] 48c1                      ext.l      d1
[0002ea78] 2001                      move.l     d1,d0
[0002ea7a] d080                      add.l      d0,d0
[0002ea7c] d081                      add.l      d1,d0
[0002ea7e] e788                      lsl.l      #3,d0
[0002ea80] 3634 0818                 move.w     24(a4,d0.l),d3
[0002ea84] b66f 0054                 cmp.w      84(a7),d3
[0002ea88] 6600 fe3a                 bne        $0002E8C4
[0002ea8c] db6f 0052                 add.w      d5,82(a7)
[0002ea90] dd6f 0050                 add.w      d6,80(a7)
[0002ea94] 4240                      clr.w      d0
[0002ea96] 3f40 002e                 move.w     d0,46(a7)
[0002ea9a] 3f40 002c                 move.w     d0,44(a7)
[0002ea9e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002eaa4] 3228 0008                 move.w     8(a0),d1
[0002eaa8] d268 000c                 add.w      12(a0),d1
[0002eaac] 3f41 0030                 move.w     d1,48(a7)
[0002eab0] 3028 000a                 move.w     10(a0),d0
[0002eab4] d068 000e                 add.w      14(a0),d0
[0002eab8] 3f40 0032                 move.w     d0,50(a7)
[0002eabc] 41ef 002c                 lea.l      44(a7),a0
[0002eac0] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002eac6] 3029 0010                 move.w     16(a1),d0
[0002eaca] 7201                      moveq.l    #1,d1
[0002eacc] 4eb9 0007 2230            jsr        vs_clip
[0002ead2] 206f 0008                 movea.l    8(a7),a0
[0002ead6] 302f 0054                 move.w     84(a7),d0
[0002eada] b068 0018                 cmp.w      24(a0),d0
[0002eade] 6752                      beq.s      $0002EB32
[0002eae0] 204c                      movea.l    a4,a0
[0002eae2] 4eb9 0005 0f3a            jsr        Aob_up
[0002eae8] 3f40 0034                 move.w     d0,52(a7)
[0002eaec] 342f 0054                 move.w     84(a7),d2
[0002eaf0] 48c2                      ext.l      d2
[0002eaf2] 2202                      move.l     d2,d1
[0002eaf4] d281                      add.l      d1,d1
[0002eaf6] d282                      add.l      d2,d1
[0002eaf8] e789                      lsl.l      #3,d1
[0002eafa] 3f74 1810 0048            move.w     16(a4,d1.l),72(a7)
[0002eb00] 3f74 1812 0046            move.w     18(a4,d1.l),70(a7)
[0002eb06] 3005                      move.w     d5,d0
[0002eb08] 322f 0034                 move.w     52(a7),d1
[0002eb0c] 48c1                      ext.l      d1
[0002eb0e] 2401                      move.l     d1,d2
[0002eb10] d482                      add.l      d2,d2
[0002eb12] d481                      add.l      d1,d2
[0002eb14] e78a                      lsl.l      #3,d2
[0002eb16] d074 2814                 add.w      20(a4,d2.l),d0
[0002eb1a] 906f 0048                 sub.w      72(a7),d0
[0002eb1e] 3f40 004e                 move.w     d0,78(a7)
[0002eb22] 3006                      move.w     d6,d0
[0002eb24] d074 2816                 add.w      22(a4,d2.l),d0
[0002eb28] 906f 0046                 sub.w      70(a7),d0
[0002eb2c] 3f40 004c                 move.w     d0,76(a7)
[0002eb30] 600c                      bra.s      $0002EB3E
[0002eb32] 303c 7530                 move.w     #$7530,d0
[0002eb36] 3f40 004c                 move.w     d0,76(a7)
[0002eb3a] 3f40 004e                 move.w     d0,78(a7)
[0002eb3e] 2f39 000e 692a            move.l     _globl,-(a7)
[0002eb44] 486f 0046                 pea.l      70(a7)
[0002eb48] 486f 004c                 pea.l      76(a7)
[0002eb4c] 43ef 0046                 lea.l      70(a7),a1
[0002eb50] 41ef 0048                 lea.l      72(a7),a0
[0002eb54] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0002eb5a] 4fef 000c                 lea.l      12(a7),a7
[0002eb5e] 3039 0008 4806            move.w     snapping,d0
[0002eb64] 673a                      beq.s      $0002EBA0
[0002eb66] 322f 003c                 move.w     60(a7),d1
[0002eb6a] 9245                      sub.w      d5,d1
[0002eb6c] d26f 0038                 add.w      56(a7),d1
[0002eb70] 48c1                      ext.l      d1
[0002eb72] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002eb78] 83e8 0012                 divs.w     18(a0),d1
[0002eb7c] c3e8 0012                 muls.w     18(a0),d1
[0002eb80] d245                      add.w      d5,d1
[0002eb82] 3f41 003c                 move.w     d1,60(a7)
[0002eb86] 342f 003a                 move.w     58(a7),d2
[0002eb8a] 9446                      sub.w      d6,d2
[0002eb8c] d46f 0036                 add.w      54(a7),d2
[0002eb90] 48c2                      ext.l      d2
[0002eb92] 85e8 0014                 divs.w     20(a0),d2
[0002eb96] c5e8 0014                 muls.w     20(a0),d2
[0002eb9a] d446                      add.w      d6,d2
[0002eb9c] 3f42 003a                 move.w     d2,58(a7)
[0002eba0] 36af 003c                 move.w     60(a7),(a3)
[0002eba4] 34af 003a                 move.w     58(a7),(a2)
[0002eba8] 7004                      moveq.l    #4,d0
[0002ebaa] c06f 0042                 and.w      66(a7),d0
[0002ebae] 6600 0110                 bne        $0002ECC0
[0002ebb2] 3213                      move.w     (a3),d1
[0002ebb4] b26f 004e                 cmp.w      78(a7),d1
[0002ebb8] 6f04                      ble.s      $0002EBBE
[0002ebba] 36af 004e                 move.w     78(a7),(a3)
[0002ebbe] 3012                      move.w     (a2),d0
[0002ebc0] b06f 004c                 cmp.w      76(a7),d0
[0002ebc4] 6f04                      ble.s      $0002EBCA
[0002ebc6] 34af 004c                 move.w     76(a7),(a2)
[0002ebca] 3013                      move.w     (a3),d0
[0002ebcc] b06f 0052                 cmp.w      82(a7),d0
[0002ebd0] 6c04                      bge.s      $0002EBD6
[0002ebd2] 36af 0052                 move.w     82(a7),(a3)
[0002ebd6] 3012                      move.w     (a2),d0
[0002ebd8] b06f 0050                 cmp.w      80(a7),d0
[0002ebdc] 6c04                      bge.s      $0002EBE2
[0002ebde] 34af 0050                 move.w     80(a7),(a2)
[0002ebe2] 206f 0008                 movea.l    8(a7),a0
[0002ebe6] 302f 0054                 move.w     84(a7),d0
[0002ebea] b068 0018                 cmp.w      24(a0),d0
[0002ebee] 6700 00f8                 beq        $0002ECE8
[0002ebf2] 342f 0034                 move.w     52(a7),d2
[0002ebf6] 48c2                      ext.l      d2
[0002ebf8] 2202                      move.l     d2,d1
[0002ebfa] d281                      add.l      d1,d1
[0002ebfc] d282                      add.l      d2,d1
[0002ebfe] e789                      lsl.l      #3,d1
[0002ec00] 3634 1802                 move.w     2(a4,d1.l),d3
[0002ec04] b66f 0054                 cmp.w      84(a7),d3
[0002ec08] 6700 009c                 beq        $0002ECA6
[0002ec0c] 3203                      move.w     d3,d1
[0002ec0e] 48c1                      ext.l      d1
[0002ec10] 2001                      move.l     d1,d0
[0002ec12] d080                      add.l      d0,d0
[0002ec14] d081                      add.l      d1,d0
[0002ec16] e788                      lsl.l      #3,d0
[0002ec18] 3834 0810                 move.w     16(a4,d0.l),d4
[0002ec1c] d874 0814                 add.w      20(a4,d0.l),d4
[0002ec20] 3e34 0812                 move.w     18(a4,d0.l),d7
[0002ec24] de74 0816                 add.w      22(a4,d0.l),d7
[0002ec28] b86f 0048                 cmp.w      72(a7),d4
[0002ec2c] 6f00 0078                 ble.w      $0002ECA6
[0002ec30] be6f 0046                 cmp.w      70(a7),d7
[0002ec34] 6f00 0070                 ble.w      $0002ECA6
[0002ec38] 3805                      move.w     d5,d4
[0002ec3a] 986f 0048                 sub.w      72(a7),d4
[0002ec3e] d874 0810                 add.w      16(a4,d0.l),d4
[0002ec42] 3e06                      move.w     d6,d7
[0002ec44] 9e6f 0046                 sub.w      70(a7),d7
[0002ec48] de74 0812                 add.w      18(a4,d0.l),d7
[0002ec4c] b853                      cmp.w      (a3),d4
[0002ec4e] 6c34                      bge.s      $0002EC84
[0002ec50] bc47                      cmp.w      d7,d6
[0002ec52] 6c24                      bge.s      $0002EC78
[0002ec54] be52                      cmp.w      (a2),d7
[0002ec56] 6c2c                      bge.s      $0002EC84
[0002ec58] be6f 0050                 cmp.w      80(a7),d7
[0002ec5c] 6d26                      blt.s      $0002EC84
[0002ec5e] 342f 003c                 move.w     60(a7),d2
[0002ec62] 9444                      sub.w      d4,d2
[0002ec64] 306f 003a                 movea.w    58(a7),a0
[0002ec68] 90c7                      suba.w     d7,a0
[0002ec6a] b448                      cmp.w      a0,d2
[0002ec6c] 6c06                      bge.s      $0002EC74
[0002ec6e] b86f 0052                 cmp.w      82(a7),d4
[0002ec72] 6c10                      bge.s      $0002EC84
[0002ec74] 3487                      move.w     d7,(a2)
[0002ec76] 600c                      bra.s      $0002EC84
[0002ec78] b853                      cmp.w      (a3),d4
[0002ec7a] 6c08                      bge.s      $0002EC84
[0002ec7c] b86f 0052                 cmp.w      82(a7),d4
[0002ec80] 6d02                      blt.s      $0002EC84
[0002ec82] 3684                      move.w     d4,(a3)
[0002ec84] be52                      cmp.w      (a2),d7
[0002ec86] 6c1e                      bge.s      $0002ECA6
[0002ec88] ba44                      cmp.w      d4,d5
[0002ec8a] 6c0e                      bge.s      $0002EC9A
[0002ec8c] b853                      cmp.w      (a3),d4
[0002ec8e] 6c16                      bge.s      $0002ECA6
[0002ec90] b86f 0052                 cmp.w      82(a7),d4
[0002ec94] 6d10                      blt.s      $0002ECA6
[0002ec96] 3684                      move.w     d4,(a3)
[0002ec98] 600c                      bra.s      $0002ECA6
[0002ec9a] be52                      cmp.w      (a2),d7
[0002ec9c] 6c08                      bge.s      $0002ECA6
[0002ec9e] be6f 0050                 cmp.w      80(a7),d7
[0002eca2] 6d02                      blt.s      $0002ECA6
[0002eca4] 3487                      move.w     d7,(a2)
[0002eca6] 3203                      move.w     d3,d1
[0002eca8] 48c1                      ext.l      d1
[0002ecaa] 2001                      move.l     d1,d0
[0002ecac] d080                      add.l      d0,d0
[0002ecae] d081                      add.l      d1,d0
[0002ecb0] e788                      lsl.l      #3,d0
[0002ecb2] 3634 0818                 move.w     24(a4,d0.l),d3
[0002ecb6] b66f 0034                 cmp.w      52(a7),d3
[0002ecba] 6600 ff48                 bne        $0002EC04
[0002ecbe] 6028                      bra.s      $0002ECE8
[0002ecc0] 3013                      move.w     (a3),d0
[0002ecc2] 3205                      move.w     d5,d1
[0002ecc4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ecca] d268 0012                 add.w      18(a0),d1
[0002ecce] b041                      cmp.w      d1,d0
[0002ecd0] 6c02                      bge.s      $0002ECD4
[0002ecd2] 3681                      move.w     d1,(a3)
[0002ecd4] 3012                      move.w     (a2),d0
[0002ecd6] 3206                      move.w     d6,d1
[0002ecd8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ecde] d268 0014                 add.w      20(a0),d1
[0002ece2] b041                      cmp.w      d1,d0
[0002ece4] 6c02                      bge.s      $0002ECE8
[0002ece6] 3481                      move.w     d1,(a2)
[0002ece8] 5353                      subq.w     #1,(a3)
[0002ecea] 5352                      subq.w     #1,(a2)
[0002ecec] 7001                      moveq.l    #1,d0
[0002ecee] c06f 0044                 and.w      68(a7),d0
[0002ecf2] 670a                      beq.s      $0002ECFE
[0002ecf4] 7202                      moveq.l    #2,d1
[0002ecf6] c26f 0044                 and.w      68(a7),d1
[0002ecfa] 6700 0114                 beq        $0002EE10
[0002ecfe] 41ef 002c                 lea.l      44(a7),a0
[0002ed02] 4241                      clr.w      d1
[0002ed04] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002ed0a] 3029 0010                 move.w     16(a1),d0
[0002ed0e] 4eb9 0007 2230            jsr        vs_clip
[0002ed14] 9b53                      sub.w      d5,(a3)
[0002ed16] 9d52                      sub.w      d6,(a2)
[0002ed18] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ed1e] 2068 023c                 movea.l    572(a0),a0
[0002ed22] 41e8 0038                 lea.l      56(a0),a0
[0002ed26] 4eb9 0004 ee3c            jsr        Amo_new
[0002ed2c] 200d                      move.l     a5,d0
[0002ed2e] 6700 00c6                 beq        $0002EDF6
[0002ed32] 222f 0018                 move.l     24(a7),d1
[0002ed36] 6778                      beq.s      $0002EDB0
[0002ed38] 342d 0010                 move.w     16(a5),d2
[0002ed3c] 3f42 0024                 move.w     d2,36(a7)
[0002ed40] 70ff                      moveq.l    #-1,d0
[0002ed42] d06d 0014                 add.w      20(a5),d0
[0002ed46] 3f40 0020                 move.w     d0,32(a7)
[0002ed4a] d440                      add.w      d0,d2
[0002ed4c] 3f42 0028                 move.w     d2,40(a7)
[0002ed50] 302d 0012                 move.w     18(a5),d0
[0002ed54] 3f40 0026                 move.w     d0,38(a7)
[0002ed58] 74ff                      moveq.l    #-1,d2
[0002ed5a] d46d 0016                 add.w      22(a5),d2
[0002ed5e] 3f42 0022                 move.w     d2,34(a7)
[0002ed62] d042                      add.w      d2,d0
[0002ed64] 3f40 002a                 move.w     d0,42(a7)
[0002ed68] 4242                      clr.w      d2
[0002ed6a] 3f42 001e                 move.w     d2,30(a7)
[0002ed6e] 3f42 001c                 move.w     d2,28(a7)
[0002ed72] 4eb9 0004 ef40            jsr        Amo_hide
[0002ed78] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ed7e] 4868 026a                 pea.l      618(a0)
[0002ed82] 226f 001c                 movea.l    28(a7),a1
[0002ed86] 41ef 0020                 lea.l      32(a7),a0
[0002ed8a] 7203                      moveq.l    #3,d1
[0002ed8c] 2c79 0010 ee4e            movea.l    ACSblk,a6
[0002ed92] 302e 0010                 move.w     16(a6),d0
[0002ed96] 4eb9 0007 489e            jsr        vro_cpyfm
[0002ed9c] 584f                      addq.w     #4,a7
[0002ed9e] 4eb9 0004 ef66            jsr        Amo_show
[0002eda4] 206f 0018                 movea.l    24(a7),a0
[0002eda8] 4eb9 0005 4c04            jsr        Abp_delete
[0002edae] 603e                      bra.s      $0002EDEE
[0002edb0] 302d 0012                 move.w     18(a5),d0
[0002edb4] d06d 0016                 add.w      22(a5),d0
[0002edb8] 5340                      subq.w     #1,d0
[0002edba] 3f00                      move.w     d0,-(a7)
[0002edbc] 322d 0010                 move.w     16(a5),d1
[0002edc0] d26d 0014                 add.w      20(a5),d1
[0002edc4] 5341                      subq.w     #1,d1
[0002edc6] 3f01                      move.w     d1,-(a7)
[0002edc8] 3f2d 0012                 move.w     18(a5),-(a7)
[0002edcc] 3f2d 0010                 move.w     16(a5),-(a7)
[0002edd0] 3f00                      move.w     d0,-(a7)
[0002edd2] 3f01                      move.w     d1,-(a7)
[0002edd4] 2079 000e 692a            movea.l    _globl,a0
[0002edda] 342d 0012                 move.w     18(a5),d2
[0002edde] 322d 0010                 move.w     16(a5),d1
[0002ede2] 7003                      moveq.l    #3,d0
[0002ede4] 4eb9 0007 a0b4            jsr        mt_form_dial
[0002edea] 4fef 000c                 lea.l      12(a7),a7
[0002edee] 204d                      movea.l    a5,a0
[0002edf0] 4eb9 0004 f20a            jsr        Aob_delete
[0002edf6] 4eb9 0005 0c80            jsr        Aev_release
[0002edfc] 7002                      moveq.l    #2,d0
[0002edfe] c06f 0044                 and.w      68(a7),d0
[0002ee02] 6706                      beq.s      $0002EE0A
[0002ee04] 4240                      clr.w      d0
[0002ee06] 6000 023c                 bra        $0002F044
[0002ee0a] 7001                      moveq.l    #1,d0
[0002ee0c] 6000 0236                 bra        $0002F044
[0002ee10] 2279 000e 692a            movea.l    _globl,a1
[0002ee16] 91c8                      suba.l     a0,a0
[0002ee18] 303c 0100                 move.w     #$0100,d0
[0002ee1c] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0002ee22] 7203                      moveq.l    #3,d1
[0002ee24] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ee2a] 3028 0010                 move.w     16(a0),d0
[0002ee2e] 4eb9 0007 3070            jsr        vswr_mode
[0002ee34] 7201                      moveq.l    #1,d1
[0002ee36] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ee3c] 3028 0010                 move.w     16(a0),d0
[0002ee40] 4eb9 0007 31c0            jsr        vsl_color
[0002ee46] 3406                      move.w     d6,d2
[0002ee48] 3213                      move.w     (a3),d1
[0002ee4a] 3005                      move.w     d5,d0
[0002ee4c] 4eb9 0004 7518            jsr        dotted_xline
[0002ee52] 3412                      move.w     (a2),d2
[0002ee54] 3213                      move.w     (a3),d1
[0002ee56] 3005                      move.w     d5,d0
[0002ee58] 4eb9 0004 7518            jsr        dotted_xline
[0002ee5e] 3405                      move.w     d5,d2
[0002ee60] 3212                      move.w     (a2),d1
[0002ee62] 3006                      move.w     d6,d0
[0002ee64] 4eb9 0004 75e6            jsr        dotted_yline
[0002ee6a] 3413                      move.w     (a3),d2
[0002ee6c] 3212                      move.w     (a2),d1
[0002ee6e] 3006                      move.w     d6,d0
[0002ee70] 4eb9 0004 75e6            jsr        dotted_yline
[0002ee76] 200d                      move.l     a5,d0
[0002ee78] 6700 00a8                 beq        $0002EF22
[0002ee7c] 3212                      move.w     (a2),d1
[0002ee7e] 9246                      sub.w      d6,d1
[0002ee80] 5241                      addq.w     #1,d1
[0002ee82] 48c1                      ext.l      d1
[0002ee84] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ee8a] 83e8 0014                 divs.w     20(a0),d1
[0002ee8e] 3f01                      move.w     d1,-(a7)
[0002ee90] 3413                      move.w     (a3),d2
[0002ee92] 9445                      sub.w      d5,d2
[0002ee94] 5242                      addq.w     #1,d2
[0002ee96] 48c2                      ext.l      d2
[0002ee98] 85e8 0012                 divs.w     18(a0),d2
[0002ee9c] 3f02                      move.w     d2,-(a7)
[0002ee9e] 43f9 000c 91c8            lea.l      $000C91C8,a1
[0002eea4] 41ef 0010                 lea.l      16(a7),a0
[0002eea8] 4eb9 0008 15ac            jsr        sprintf
[0002eeae] 584f                      addq.w     #4,a7
[0002eeb0] 43ef 000c                 lea.l      12(a7),a1
[0002eeb4] 7001                      moveq.l    #1,d0
[0002eeb6] 204d                      movea.l    a5,a0
[0002eeb8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002eebe] 3012                      move.w     (a2),d0
[0002eec0] 9046                      sub.w      d6,d0
[0002eec2] 5240                      addq.w     #1,d0
[0002eec4] 3f00                      move.w     d0,-(a7)
[0002eec6] 3213                      move.w     (a3),d1
[0002eec8] 9245                      sub.w      d5,d1
[0002eeca] 5241                      addq.w     #1,d1
[0002eecc] 3f01                      move.w     d1,-(a7)
[0002eece] 43f9 000c 91c8            lea.l      $000C91C8,a1
[0002eed4] 41ef 0010                 lea.l      16(a7),a0
[0002eed8] 4eb9 0008 15ac            jsr        sprintf
[0002eede] 584f                      addq.w     #4,a7
[0002eee0] 43ef 000c                 lea.l      12(a7),a1
[0002eee4] 7002                      moveq.l    #2,d0
[0002eee6] 204d                      movea.l    a5,a0
[0002eee8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002eeee] 302d 0012                 move.w     18(a5),d0
[0002eef2] d06d 0016                 add.w      22(a5),d0
[0002eef6] 5340                      subq.w     #1,d0
[0002eef8] 3f00                      move.w     d0,-(a7)
[0002eefa] 322d 0010                 move.w     16(a5),d1
[0002eefe] d26d 0014                 add.w      20(a5),d1
[0002ef02] 5341                      subq.w     #1,d1
[0002ef04] 3f01                      move.w     d1,-(a7)
[0002ef06] 3f2d 0012                 move.w     18(a5),-(a7)
[0002ef0a] 2279 000e 692a            movea.l    _globl,a1
[0002ef10] 342d 0010                 move.w     16(a5),d2
[0002ef14] 204d                      movea.l    a5,a0
[0002ef16] 4240                      clr.w      d0
[0002ef18] 7202                      moveq.l    #2,d1
[0002ef1a] 4eb9 0007 9c0c            jsr        mt_objc_draw
[0002ef20] 5c4f                      addq.w     #6,a7
[0002ef22] 2279 000e 692a            movea.l    _globl,a1
[0002ef28] 91c8                      suba.l     a0,a0
[0002ef2a] 303c 0101                 move.w     #$0101,d0
[0002ef2e] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0002ef34] 2f39 000e 692a            move.l     _globl,-(a7)
[0002ef3a] 486f 0046                 pea.l      70(a7)
[0002ef3e] 486f 004c                 pea.l      76(a7)
[0002ef42] 43ef 004a                 lea.l      74(a7),a1
[0002ef46] 41ef 004c                 lea.l      76(a7),a0
[0002ef4a] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0002ef50] 4fef 000c                 lea.l      12(a7),a7
[0002ef54] 7001                      moveq.l    #1,d0
[0002ef56] c06f 0044                 and.w      68(a7),d0
[0002ef5a] 6760                      beq.s      $0002EFBC
[0002ef5c] 7202                      moveq.l    #2,d1
[0002ef5e] c26f 0044                 and.w      68(a7),d1
[0002ef62] 6658                      bne.s      $0002EFBC
[0002ef64] 3439 0008 4806            move.w     snapping,d2
[0002ef6a] 673a                      beq.s      $0002EFA6
[0002ef6c] 306f 0040                 movea.w    64(a7),a0
[0002ef70] 90ef 003c                 suba.w     60(a7),a0
[0002ef74] b0ef 0038                 cmpa.w     56(a7),a0
[0002ef78] 6e42                      bgt.s      $0002EFBC
[0002ef7a] 326f 003c                 movea.w    60(a7),a1
[0002ef7e] 92ef 0040                 suba.w     64(a7),a1
[0002ef82] b2ef 0038                 cmpa.w     56(a7),a1
[0002ef86] 6e34                      bgt.s      $0002EFBC
[0002ef88] 3c6f 003e                 movea.w    62(a7),a6
[0002ef8c] 9cef 003a                 suba.w     58(a7),a6
[0002ef90] bcef 0036                 cmpa.w     54(a7),a6
[0002ef94] 6e26                      bgt.s      $0002EFBC
[0002ef96] 302f 003a                 move.w     58(a7),d0
[0002ef9a] 906f 003e                 sub.w      62(a7),d0
[0002ef9e] b06f 0036                 cmp.w      54(a7),d0
[0002efa2] 6f90                      ble.s      $0002EF34
[0002efa4] 6016                      bra.s      $0002EFBC
[0002efa6] 302f 0040                 move.w     64(a7),d0
[0002efaa] b06f 003c                 cmp.w      60(a7),d0
[0002efae] 660c                      bne.s      $0002EFBC
[0002efb0] 322f 003e                 move.w     62(a7),d1
[0002efb4] b26f 003a                 cmp.w      58(a7),d1
[0002efb8] 6700 ff7a                 beq        $0002EF34
[0002efbc] 2279 000e 692a            movea.l    _globl,a1
[0002efc2] 91c8                      suba.l     a0,a0
[0002efc4] 303c 0100                 move.w     #$0100,d0
[0002efc8] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0002efce] 7203                      moveq.l    #3,d1
[0002efd0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002efd6] 3028 0010                 move.w     16(a0),d0
[0002efda] 4eb9 0007 3070            jsr        vswr_mode
[0002efe0] 7201                      moveq.l    #1,d1
[0002efe2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002efe8] 3028 0010                 move.w     16(a0),d0
[0002efec] 4eb9 0007 31c0            jsr        vsl_color
[0002eff2] 3406                      move.w     d6,d2
[0002eff4] 3213                      move.w     (a3),d1
[0002eff6] 3005                      move.w     d5,d0
[0002eff8] 4eb9 0004 7518            jsr        dotted_xline
[0002effe] 3412                      move.w     (a2),d2
[0002f000] 3213                      move.w     (a3),d1
[0002f002] 3005                      move.w     d5,d0
[0002f004] 4eb9 0004 7518            jsr        dotted_xline
[0002f00a] 3405                      move.w     d5,d2
[0002f00c] 3212                      move.w     (a2),d1
[0002f00e] 3006                      move.w     d6,d0
[0002f010] 4eb9 0004 75e6            jsr        dotted_yline
[0002f016] 3413                      move.w     (a3),d2
[0002f018] 3212                      move.w     (a2),d1
[0002f01a] 3006                      move.w     d6,d0
[0002f01c] 4eb9 0004 75e6            jsr        dotted_yline
[0002f022] 2279 000e 692a            movea.l    _globl,a1
[0002f028] 91c8                      suba.l     a0,a0
[0002f02a] 303c 0101                 move.w     #$0101,d0
[0002f02e] 4eb9 0007 abe4            jsr        mt_graf_mouse
[0002f034] 3f6f 0040 003c            move.w     64(a7),60(a7)
[0002f03a] 3f6f 003e 003a            move.w     62(a7),58(a7)
[0002f040] 6000 fb1c                 bra        $0002EB5E
[0002f044] 4fef 0056                 lea.l      86(a7),a7
[0002f048] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0002f04c] 4e75                      rts
sizing:
[0002f04e] 48e7 1f3e                 movem.l    d3-d7/a2-a6,-(a7)
[0002f052] 4fef ffec                 lea.l      -20(a7),a7
[0002f056] 2448                      movea.l    a0,a2
[0002f058] 3600                      move.w     d0,d3
[0002f05a] 3c01                      move.w     d1,d6
[0002f05c] 3a02                      move.w     d2,d5
[0002f05e] 266a 0014                 movea.l    20(a2),a3
[0002f062] 2f39 000e 692a            move.l     _globl,-(a7)
[0002f068] 486f 0014                 pea.l      20(a7)
[0002f06c] 43ef 001a                 lea.l      26(a7),a1
[0002f070] 204b                      movea.l    a3,a0
[0002f072] 4eb9 0007 9d14            jsr        mt_objc_offset
[0002f078] 504f                      addq.w     #8,a7
[0002f07a] 3203                      move.w     d3,d1
[0002f07c] 48c1                      ext.l      d1
[0002f07e] 2001                      move.l     d1,d0
[0002f080] d080                      add.l      d0,d0
[0002f082] d081                      add.l      d1,d0
[0002f084] e788                      lsl.l      #3,d0
[0002f086] 3833 0814                 move.w     20(a3,d0.l),d4
[0002f08a] 3e33 0816                 move.w     22(a3,d0.l),d7
[0002f08e] 49ef 000e                 lea.l      14(a7),a4
[0002f092] 302a 0034                 move.w     52(a2),d0
[0002f096] d06f 0012                 add.w      18(a7),d0
[0002f09a] d044                      add.w      d4,d0
[0002f09c] 9046                      sub.w      d6,d0
[0002f09e] 3880                      move.w     d0,(a4)
[0002f0a0] 4bef 000c                 lea.l      12(a7),a5
[0002f0a4] 302a 0036                 move.w     54(a2),d0
[0002f0a8] d06f 0010                 add.w      16(a7),d0
[0002f0ac] d047                      add.w      d7,d0
[0002f0ae] 9045                      sub.w      d5,d0
[0002f0b0] 3a80                      move.w     d0,(a5)
[0002f0b2] 0c54 0008                 cmpi.w     #$0008,(a4)
[0002f0b6] 6f0a                      ble.s      $0002F0C2
[0002f0b8] 3204                      move.w     d4,d1
[0002f0ba] e641                      asr.w      #3,d1
[0002f0bc] 3414                      move.w     (a4),d2
[0002f0be] b441                      cmp.w      d1,d2
[0002f0c0] 6e10                      bgt.s      $0002F0D2
[0002f0c2] 0c55 0008                 cmpi.w     #$0008,(a5)
[0002f0c6] 6f10                      ble.s      $0002F0D8
[0002f0c8] 3007                      move.w     d7,d0
[0002f0ca] e640                      asr.w      #3,d0
[0002f0cc] 3215                      move.w     (a5),d1
[0002f0ce] b240                      cmp.w      d0,d1
[0002f0d0] 6f06                      ble.s      $0002F0D8
[0002f0d2] 70ff                      moveq.l    #-1,d0
[0002f0d4] 6000 0164                 bra        $0002F23A
[0002f0d8] 4855                      pea.l      (a5)
[0002f0da] 224c                      movea.l    a4,a1
[0002f0dc] 342a 0036                 move.w     54(a2),d2
[0002f0e0] d46f 0014                 add.w      20(a7),d2
[0002f0e4] 322a 0034                 move.w     52(a2),d1
[0002f0e8] d26f 0016                 add.w      22(a7),d1
[0002f0ec] 3003                      move.w     d3,d0
[0002f0ee] 204a                      movea.l    a2,a0
[0002f0f0] 6100 f64e                 bsr        rubberbox
[0002f0f4] 584f                      addq.w     #4,a7
[0002f0f6] 4a40                      tst.w      d0
[0002f0f8] 6700 013e                 beq        $0002F238
[0002f0fc] 2f52 0008                 move.l     (a2),8(a7)
[0002f100] 206f 0008                 movea.l    8(a7),a0
[0002f104] 2250                      movea.l    (a0),a1
[0002f106] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002f10c] 2f68 0004 0004            move.l     4(a0),4(a7)
[0002f112] 226f 0004                 movea.l    4(a7),a1
[0002f116] 2ea9 0004                 move.l     4(a1),(a7)
[0002f11a] 7afe                      moveq.l    #-2,d5
[0002f11c] da43                      add.w      d3,d5
[0002f11e] 48c5                      ext.l      d5
[0002f120] 8bfc 0003                 divs.w     #$0003,d5
[0002f124] 3c14                      move.w     (a4),d6
[0002f126] 9c44                      sub.w      d4,d6
[0002f128] 3015                      move.w     (a5),d0
[0002f12a] 9047                      sub.w      d7,d0
[0002f12c] 3e00                      move.w     d0,d7
[0002f12e] 3407                      move.w     d7,d2
[0002f130] 3206                      move.w     d6,d1
[0002f132] 2057                      movea.l    (a7),a0
[0002f134] 3005                      move.w     d5,d0
[0002f136] 224b                      movea.l    a3,a1
[0002f138] 4eb9 0002 d834            jsr        resize_ob
[0002f13e] 3039 0008 4806            move.w     snapping,d0
[0002f144] 671a                      beq.s      $0002F160
[0002f146] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f14c] 3228 0012                 move.w     18(a0),d1
[0002f150] e241                      asr.w      #1,d1
[0002f152] 5341                      subq.w     #1,d1
[0002f154] d354                      add.w      d1,(a4)
[0002f156] 3428 0014                 move.w     20(a0),d2
[0002f15a] e242                      asr.w      #1,d2
[0002f15c] 5342                      subq.w     #1,d2
[0002f15e] d555                      add.w      d2,(a5)
[0002f160] 3014                      move.w     (a4),d0
[0002f162] 6100 e724                 bsr        char_x
[0002f166] 3880                      move.w     d0,(a4)
[0002f168] 3015                      move.w     (a5),d0
[0002f16a] 6100 e766                 bsr        char_y
[0002f16e] 3a80                      move.w     d0,(a5)
[0002f170] 3405                      move.w     d5,d2
[0002f172] 48c2                      ext.l      d2
[0002f174] 2202                      move.l     d2,d1
[0002f176] e789                      lsl.l      #3,d1
[0002f178] 9282                      sub.l      d2,d1
[0002f17a] e789                      lsl.l      #3,d1
[0002f17c] 2057                      movea.l    (a7),a0
[0002f17e] 3194 181c                 move.w     (a4),28(a0,d1.l)
[0002f182] 3195 181e                 move.w     (a5),30(a0,d1.l)
[0002f186] 4a45                      tst.w      d5
[0002f188] 6628                      bne.s      $0002F1B2
[0002f18a] 226a 0010                 movea.l    16(a2),a1
[0002f18e] 204a                      movea.l    a2,a0
[0002f190] 4e91                      jsr        (a1)
[0002f192] 006a 0010 0056            ori.w      #$0010,86(a2)
[0002f198] 43ea 0024                 lea.l      36(a2),a1
[0002f19c] 204a                      movea.l    a2,a0
[0002f19e] 2c6a 0086                 movea.l    134(a2),a6
[0002f1a2] 4e96                      jsr        (a6)
[0002f1a4] 3003                      move.w     d3,d0
[0002f1a6] 204a                      movea.l    a2,a0
[0002f1a8] 4eb9 0004 7e6a            jsr        Adr_add
[0002f1ae] 6000 0088                 bra        $0002F238
[0002f1b2] 3003                      move.w     d3,d0
[0002f1b4] 204a                      movea.l    a2,a0
[0002f1b6] 4eb9 0002 f244            jsr        undraw
[0002f1bc] 3203                      move.w     d3,d1
[0002f1be] 48c1                      ext.l      d1
[0002f1c0] 2001                      move.l     d1,d0
[0002f1c2] d080                      add.l      d0,d0
[0002f1c4] d081                      add.l      d1,d0
[0002f1c6] e788                      lsl.l      #3,d0
[0002f1c8] 206a 0014                 movea.l    20(a2),a0
[0002f1cc] 0270 ff7f 08f0            andi.w     #$FF7F,-16(a0,d0.l)
[0002f1d2] 206a 0014                 movea.l    20(a2),a0
[0002f1d6] 0270 ff7f 0808            andi.w     #$FF7F,8(a0,d0.l)
[0002f1dc] 3014                      move.w     (a4),d0
[0002f1de] 6100 e73c                 bsr        pixel_x
[0002f1e2] 3403                      move.w     d3,d2
[0002f1e4] 48c2                      ext.l      d2
[0002f1e6] 2202                      move.l     d2,d1
[0002f1e8] d281                      add.l      d1,d1
[0002f1ea] d282                      add.l      d2,d1
[0002f1ec] e789                      lsl.l      #3,d1
[0002f1ee] 3780 18fc                 move.w     d0,-4(a3,d1.l)
[0002f1f2] 3780 1814                 move.w     d0,20(a3,d1.l)
[0002f1f6] 3015                      move.w     (a5),d0
[0002f1f8] 6100 e74a                 bsr        pixel_y
[0002f1fc] 3403                      move.w     d3,d2
[0002f1fe] 48c2                      ext.l      d2
[0002f200] 2202                      move.l     d2,d1
[0002f202] d281                      add.l      d1,d1
[0002f204] d282                      add.l      d2,d1
[0002f206] e789                      lsl.l      #3,d1
[0002f208] 3780 18fe                 move.w     d0,-2(a3,d1.l)
[0002f20c] 3780 1816                 move.w     d0,22(a3,d1.l)
[0002f210] 70ff                      moveq.l    #-1,d0
[0002f212] d043                      add.w      d3,d0
[0002f214] 204a                      movea.l    a2,a0
[0002f216] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002f21c] 7201                      moveq.l    #1,d1
[0002f21e] 3403                      move.w     d3,d2
[0002f220] 48c2                      ext.l      d2
[0002f222] 2002                      move.l     d2,d0
[0002f224] d080                      add.l      d0,d0
[0002f226] d082                      add.l      d2,d0
[0002f228] e788                      lsl.l      #3,d0
[0002f22a] 8273 080a                 or.w       10(a3,d0.l),d1
[0002f22e] 204a                      movea.l    a2,a0
[0002f230] 226a 0066                 movea.l    102(a2),a1
[0002f234] 3003                      move.w     d3,d0
[0002f236] 4e91                      jsr        (a1)
[0002f238] 4240                      clr.w      d0
[0002f23a] 4fef 0014                 lea.l      20(a7),a7
[0002f23e] 4cdf 7cf8                 movem.l    (a7)+,d3-d7/a2-a6
[0002f242] 4e75                      rts
undraw:
[0002f244] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0002f248] 2448                      movea.l    a0,a2
[0002f24a] 3600                      move.w     d0,d3
[0002f24c] 266a 0014                 movea.l    20(a2),a3
[0002f250] 48c0                      ext.l      d0
[0002f252] 2200                      move.l     d0,d1
[0002f254] d281                      add.l      d1,d1
[0002f256] d280                      add.l      d0,d1
[0002f258] e789                      lsl.l      #3,d1
[0002f25a] 0073 0080 1808            ori.w      #$0080,8(a3,d1.l)
[0002f260] 0273 fffe 180a            andi.w     #$FFFE,10(a3,d1.l)
[0002f266] 0073 0080 18f0            ori.w      #$0080,-16(a3,d1.l)
[0002f26c] 70ff                      moveq.l    #-1,d0
[0002f26e] d043                      add.w      d3,d0
[0002f270] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002f276] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0002f27a] 4e75                      rts

	.data

WARN_SAME:
[000c49bd]                           dc.b '[2][| Das Objekt soll auf sich| selbst kopiert werden!| Operation abbrechen?][ JA | NEIN ]',0
WARN_XSHRINK:
[000c4a18]                           dc.b '[2][| Kindobjekt ist breiter | als das Elternobjekt.| Kind verkleinern ?][ JA | NEIN ]',0
WARN_YSHRINK:
[000c4a6f]                           dc.b '[2][| Kindobjekt ist hîher| als das Elternobjekt. | Kind verkleinern ?][ JA | NEIN ]',0
STGUIDE_01:
[000c4ac4]                           dc.b 'Der Objektbaum-Editor',0
STGUIDE_02:
[000c4ada]                           dc.b 'Der MenÅ-Editor',0
STGUIDE_03:
[000c4aea]                           dc.b 'Der Popup-Editor',0
STGUIDE_04:
[000c4afb]                           dc.b 'Eingabe der Objekt-Position',0
