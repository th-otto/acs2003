do3d:
[0002a8da] 2f0a                      move.l     a2,-(a7)
[0002a8dc] 2f0b                      move.l     a3,-(a7)
[0002a8de] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002a8e4] 2052                      movea.l    (a2),a0
[0002a8e6] 2268 025c                 movea.l    604(a0),a1
[0002a8ea] 2669 003c                 movea.l    60(a1),a3
[0002a8ee] 584b                      addq.w     #4,a3
[0002a8f0] 4293                      clr.l      (a3)
[0002a8f2] 7001                      moveq.l    #1,d0
[0002a8f4] 2052                      movea.l    (a2),a0
[0002a8f6] 3428 0260                 move.w     608(a0),d2
[0002a8fa] 48c2                      ext.l      d2
[0002a8fc] 2202                      move.l     d2,d1
[0002a8fe] d281                      add.l      d1,d1
[0002a900] d282                      add.l      d2,d1
[0002a902] e789                      lsl.l      #3,d1
[0002a904] 2268 025c                 movea.l    604(a0),a1
[0002a908] c071 180a                 and.w      10(a1,d1.l),d0
[0002a90c] 6706                      beq.s      $0002A914
[0002a90e] 0093 0000 0001            ori.l      #$00000001,(a3)
[0002a914] 72ff                      moveq.l    #-1,d1
[0002a916] 2052                      movea.l    (a2),a0
[0002a918] 3028 0260                 move.w     608(a0),d0
[0002a91c] 2068 0258                 movea.l    600(a0),a0
[0002a920] 2252                      movea.l    (a2),a1
[0002a922] 2669 0258                 movea.l    600(a1),a3
[0002a926] 226b 0066                 movea.l    102(a3),a1
[0002a92a] 4e91                      jsr        (a1)
[0002a92c] 72ff                      moveq.l    #-1,d1
[0002a92e] 7001                      moveq.l    #1,d0
[0002a930] 2052                      movea.l    (a2),a0
[0002a932] 2068 0258                 movea.l    600(a0),a0
[0002a936] 2252                      movea.l    (a2),a1
[0002a938] 2669 0258                 movea.l    600(a1),a3
[0002a93c] 226b 0066                 movea.l    102(a3),a1
[0002a940] 4e91                      jsr        (a1)
[0002a942] 265f                      movea.l    (a7)+,a3
[0002a944] 245f                      movea.l    (a7)+,a2
[0002a946] 4e75                      rts

; start editor\uecheck.c

init_check:
[0002a948] 2f0a                      move.l     a2,-(a7)
[0002a94a] 2f0b                      move.l     a3,-(a7)
[0002a94c] 2448                      movea.l    a0,a2
[0002a94e] 43f9 000c 33b0            lea.l      data,a1
[0002a954] 303c 2329                 move.w     #$2329,d0
[0002a958] 266a 0004                 movea.l    4(a2),a3
[0002a95c] 4e93                      jsr        (a3)
[0002a95e] 43f9 000c 3400            lea.l      raddata,a1
[0002a964] 303c 2329                 move.w     #$2329,d0
[0002a968] 204a                      movea.l    a2,a0
[0002a96a] 266a 0004                 movea.l    4(a2),a3
[0002a96e] 4e93                      jsr        (a3)
[0002a970] 265f                      movea.l    (a7)+,a3
[0002a972] 245f                      movea.l    (a7)+,a2
[0002a974] 4e75                      rts
minsize:
[0002a976] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0002a97a] 2649                      movea.l    a1,a3
[0002a97c] 2468 000c                 movea.l    12(a0),a2
[0002a980] 200a                      move.l     a2,d0
[0002a982] 671c                      beq.s      $0002A9A0
[0002a984] 1212                      move.b     (a2),d1
[0002a986] 6718                      beq.s      $0002A9A0
[0002a988] 204a                      movea.l    a2,a0
[0002a98a] 4eb9 0008 2f6c            jsr        strlen
[0002a990] 2600                      move.l     d0,d3
[0002a992] 5643                      addq.w     #3,d3
[0002a994] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a99a] c7e8 0012                 muls.w     18(a0),d3
[0002a99e] 600a                      bra.s      $0002A9AA
[0002a9a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a9a6] 3628 0014                 move.w     20(a0),d3
[0002a9aa] 3683                      move.w     d3,(a3)
[0002a9ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a9b2] 226f 0010                 movea.l    16(a7),a1
[0002a9b6] 32a8 0014                 move.w     20(a0),(a1)
[0002a9ba] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0002a9be] 4e75                      rts
object_tree:
[0002a9c0] 48e7 003e                 movem.l    a2-a6,-(a7)
[0002a9c4] 594f                      subq.w     #4,a7
[0002a9c6] 2a48                      movea.l    a0,a5
[0002a9c8] 2849                      movea.l    a1,a4
[0002a9ca] 41f9 000c 3134            lea.l      ED_CHECKBOX,a0
[0002a9d0] 4eb9 0004 f064            jsr        Aob_create
[0002a9d6] 2448                      movea.l    a0,a2
[0002a9d8] 200a                      move.l     a2,d0
[0002a9da] 6606                      bne.s      $0002A9E2
[0002a9dc] 91c8                      suba.l     a0,a0
[0002a9de] 6000 012e                 bra        $0002AB0E
[0002a9e2] 7008                      moveq.l    #8,d0
[0002a9e4] 224a                      movea.l    a2,a1
[0002a9e6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002a9ec] 2068 0258                 movea.l    600(a0),a0
[0002a9f0] 4eb9 0003 0b9a            jsr        oe_beself
[0002a9f6] 700d                      moveq.l    #13,d0
[0002a9f8] 224a                      movea.l    a2,a1
[0002a9fa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002aa00] 2068 0258                 movea.l    600(a0),a0
[0002aa04] 4eb9 0003 0b9a            jsr        oe_beself
[0002aa0a] 700f                      moveq.l    #15,d0
[0002aa0c] 224a                      movea.l    a2,a1
[0002aa0e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002aa14] 2068 0258                 movea.l    600(a0),a0
[0002aa18] 4eb9 0003 0b9a            jsr        oe_beself
[0002aa1e] 47ea 0030                 lea.l      48(a2),a3
[0002aa22] 7016                      moveq.l    #22,d0
[0002aa24] c06c 0008                 and.w      8(a4),d0
[0002aa28] 816b 0008                 or.w       d0,8(a3)
[0002aa2c] 703f                      moveq.l    #63,d0
[0002aa2e] c06c 000a                 and.w      10(a4),d0
[0002aa32] 816b 000a                 or.w       d0,10(a3)
[0002aa36] 286b 000c                 movea.l    12(a3),a4
[0002aa3a] 4857                      pea.l      (a7)
[0002aa3c] 43f9 000c 346c            lea.l      $000C346C,a1
[0002aa42] 2055                      movea.l    (a5),a0
[0002aa44] 4eb9 0008 1b26            jsr        sscanf
[0002aa4a] 584f                      addq.w     #4,a7
[0002aa4c] 2957 0004                 move.l     (a7),4(a4)
[0002aa50] 0c6d 0002 0008            cmpi.w     #$0002,8(a5)
[0002aa56] 6610                      bne.s      $0002AA68
[0002aa58] 226d 000a                 movea.l    10(a5),a1
[0002aa5c] 7008                      moveq.l    #8,d0
[0002aa5e] 204a                      movea.l    a2,a0
[0002aa60] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002aa66] 6020                      bra.s      $0002AA88
[0002aa68] 43f9 000c 3455            lea.l      $000C3455,a1
[0002aa6e] 7004                      moveq.l    #4,d0
[0002aa70] 204b                      movea.l    a3,a0
[0002aa72] 2c6c 0008                 movea.l    8(a4),a6
[0002aa76] 4e96                      jsr        (a6)
[0002aa78] 43f9 000c 3455            lea.l      $000C3455,a1
[0002aa7e] 7008                      moveq.l    #8,d0
[0002aa80] 204a                      movea.l    a2,a0
[0002aa82] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002aa88] 7001                      moveq.l    #1,d0
[0002aa8a] c097                      and.l      (a7),d0
[0002aa8c] 6708                      beq.s      $0002AA96
[0002aa8e] 006a 0001 00e2            ori.w      #$0001,226(a2)
[0002aa94] 6006                      bra.s      $0002AA9C
[0002aa96] 026a fffe 00e2            andi.w     #$FFFE,226(a2)
[0002aa9c] 206a 0144                 movea.l    324(a2),a0
[0002aaa0] 2968 000c 0018            move.l     12(a0),24(a4)
[0002aaa6] 206d 0026                 movea.l    38(a5),a0
[0002aaaa] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002aab0] 4a40                      tst.w      d0
[0002aab2] 6712                      beq.s      $0002AAC6
[0002aab4] 43f9 000c 3455            lea.l      $000C3455,a1
[0002aaba] 700d                      moveq.l    #13,d0
[0002aabc] 204a                      movea.l    a2,a0
[0002aabe] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002aac4] 600e                      bra.s      $0002AAD4
[0002aac6] 226d 0026                 movea.l    38(a5),a1
[0002aaca] 700d                      moveq.l    #13,d0
[0002aacc] 204a                      movea.l    a2,a0
[0002aace] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002aad4] 206a 0174                 movea.l    372(a2),a0
[0002aad8] 2968 000c 001c            move.l     12(a0),28(a4)
[0002aade] 206d 002a                 movea.l    42(a5),a0
[0002aae2] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002aae8] 4a40                      tst.w      d0
[0002aaea] 6712                      beq.s      $0002AAFE
[0002aaec] 43f9 000c 3455            lea.l      $000C3455,a1
[0002aaf2] 700f                      moveq.l    #15,d0
[0002aaf4] 204a                      movea.l    a2,a0
[0002aaf6] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002aafc] 600e                      bra.s      $0002AB0C
[0002aafe] 226d 002a                 movea.l    42(a5),a1
[0002ab02] 700f                      moveq.l    #15,d0
[0002ab04] 204a                      movea.l    a2,a0
[0002ab06] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002ab0c] 204a                      movea.l    a2,a0
[0002ab0e] 584f                      addq.w     #4,a7
[0002ab10] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[0002ab14] 4e75                      rts
test_it:
[0002ab16] 2f0a                      move.l     a2,-(a7)
[0002ab18] 2f0b                      move.l     a3,-(a7)
[0002ab1a] 2648                      movea.l    a0,a3
[0002ab1c] 2449                      movea.l    a1,a2
[0002ab1e] 22bc 0006 323e            move.l     #A_checkbox,(a1)
[0002ab24] 486a 0004                 pea.l      4(a2)
[0002ab28] 43f9 000c 346c            lea.l      $000C346C,a1
[0002ab2e] 2050                      movea.l    (a0),a0
[0002ab30] 4eb9 0008 1b26            jsr        sscanf
[0002ab36] 584f                      addq.w     #4,a7
[0002ab38] 257c 0006 30f2 0008       move.l     #Auo_string,8(a2)
[0002ab40] 0c6b 0002 0008            cmpi.w     #$0002,8(a3)
[0002ab46] 6608                      bne.s      $0002AB50
[0002ab48] 256b 000a 000c            move.l     10(a3),12(a2)
[0002ab4e] 6004                      bra.s      $0002AB54
[0002ab50] 42aa 000c                 clr.l      12(a2)
[0002ab54] 7000                      moveq.l    #0,d0
[0002ab56] 2540 0014                 move.l     d0,20(a2)
[0002ab5a] 2540 0010                 move.l     d0,16(a2)
[0002ab5e] 42aa 0018                 clr.l      24(a2)
[0002ab62] 42aa 001c                 clr.l      28(a2)
[0002ab66] 265f                      movea.l    (a7)+,a3
[0002ab68] 245f                      movea.l    (a7)+,a2
[0002ab6a] 4e75                      rts
abort:
[0002ab6c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ab72] 2268 0258                 movea.l    600(a0),a1
[0002ab76] 2069 0014                 movea.l    20(a1),a0
[0002ab7a] 2068 003c                 movea.l    60(a0),a0
[0002ab7e] 42a8 0018                 clr.l      24(a0)
[0002ab82] 42a8 001c                 clr.l      28(a0)
[0002ab86] 2079 000c 33f0            movea.l    $000C33F0,a0
[0002ab8c] 2050                      movea.l    (a0),a0
[0002ab8e] 4e90                      jsr        (a0)
[0002ab90] 4e75                      rts
ok:
[0002ab92] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0002ab96] 4fef ffce                 lea.l      -50(a7),a7
[0002ab9a] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002aba0] 2052                      movea.l    (a2),a0
[0002aba2] 2268 0258                 movea.l    600(a0),a1
[0002aba6] 2669 0014                 movea.l    20(a1),a3
[0002abaa] 2a6b 003c                 movea.l    60(a3),a5
[0002abae] 49f9 0010 c522            lea.l      parm,a4
[0002abb4] 2f2d 0004                 move.l     4(a5),-(a7)
[0002abb8] 43f9 000c 346c            lea.l      $000C346C,a1
[0002abbe] 204c                      movea.l    a4,a0
[0002abc0] 4eb9 0008 15ac            jsr        sprintf
[0002abc6] 584f                      addq.w     #4,a7
[0002abc8] 4bef 0004                 lea.l      4(a7),a5
[0002abcc] 2a8c                      move.l     a4,(a5)
[0002abce] 2b7c 000c 3461 0004       move.l     #$000C3461,4(a5)
[0002abd6] 43d7                      lea.l      (a7),a1
[0002abd8] 7003                      moveq.l    #3,d0
[0002abda] 41eb 00c0                 lea.l      192(a3),a0
[0002abde] 4eb9 0006 a068            jsr        Auo_boxed
[0002abe4] 2057                      movea.l    (a7),a0
[0002abe6] 1010                      move.b     (a0),d0
[0002abe8] 6724                      beq.s      $0002AC0E
[0002abea] 4eb9 0008 2f6c            jsr        strlen
[0002abf0] 5680                      addq.l     #3,d0
[0002abf2] 2052                      movea.l    (a2),a0
[0002abf4] 3228 0012                 move.w     18(a0),d1
[0002abf8] 48c1                      ext.l      d1
[0002abfa] 4eb9 0008 3c32            jsr        _ulmul
[0002ac00] 2600                      move.l     d0,d3
[0002ac02] 3b7c 0002 0008            move.w     #$0002,8(a5)
[0002ac08] 2b57 000a                 move.l     (a7),10(a5)
[0002ac0c] 600e                      bra.s      $0002AC1C
[0002ac0e] 2052                      movea.l    (a2),a0
[0002ac10] 3628 0014                 move.w     20(a0),d3
[0002ac14] 426d 0008                 clr.w      8(a5)
[0002ac18] 42ad 000a                 clr.l      10(a5)
[0002ac1c] 42ad 000e                 clr.l      14(a5)
[0002ac20] 4240                      clr.w      d0
[0002ac22] 3b40 001c                 move.w     d0,28(a5)
[0002ac26] 3b40 0012                 move.w     d0,18(a5)
[0002ac2a] 7200                      moveq.l    #0,d1
[0002ac2c] 2b41 001e                 move.l     d1,30(a5)
[0002ac30] 2b41 0014                 move.l     d1,20(a5)
[0002ac34] 7000                      moveq.l    #0,d0
[0002ac36] 2b40 0022                 move.l     d0,34(a5)
[0002ac3a] 2b40 0018                 move.l     d0,24(a5)
[0002ac3e] 43ed 0026                 lea.l      38(a5),a1
[0002ac42] 41eb 0138                 lea.l      312(a3),a0
[0002ac46] 7003                      moveq.l    #3,d0
[0002ac48] 4eb9 0006 a068            jsr        Auo_boxed
[0002ac4e] 206d 0026                 movea.l    38(a5),a0
[0002ac52] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002ac58] 4a40                      tst.w      d0
[0002ac5a] 6704                      beq.s      $0002AC60
[0002ac5c] 42ad 0026                 clr.l      38(a5)
[0002ac60] 43ed 002a                 lea.l      42(a5),a1
[0002ac64] 7003                      moveq.l    #3,d0
[0002ac66] 41eb 0168                 lea.l      360(a3),a0
[0002ac6a] 4eb9 0006 a068            jsr        Auo_boxed
[0002ac70] 206d 002a                 movea.l    42(a5),a0
[0002ac74] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002ac7a] 4a40                      tst.w      d0
[0002ac7c] 6704                      beq.s      $0002AC82
[0002ac7e] 42ad 002a                 clr.l      42(a5)
[0002ac82] 2052                      movea.l    (a2),a0
[0002ac84] 3228 0014                 move.w     20(a0),d1
[0002ac88] 3003                      move.w     d3,d0
[0002ac8a] 204d                      movea.l    a5,a0
[0002ac8c] 2279 000c 33f0            movea.l    $000C33F0,a1
[0002ac92] 2269 0004                 movea.l    4(a1),a1
[0002ac96] 4e91                      jsr        (a1)
[0002ac98] 6100 fed2                 bsr        abort
[0002ac9c] 4fef 0032                 lea.l      50(a7),a7
[0002aca0] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0002aca4] 4e75                      rts

	.data

BUBBLE_01:
[000c2d14]                           dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
[000c2d60]                           dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
[000c2dab]                           dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_04:
[000c2dfd]                           dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
BUBBLE_05:
[000c2e81]                           dc.b 'Hier wird die Beschriftung der Checkbox eingegeben.',0
BUBBLE_06:
[000c2eb5]                           dc.b 'Durch diese Checkbox kann die 3D-Darstellung ein- und ausgeschaltet werden. Das Ergebnis wird direkt an der Beispiel-Checkbox oben links dargestellt.',0
TEXT_005:
[000c2f4b]                           dc.b $4f
[000c2f4c]                           dc.w $4b00
TEXT_009:
[000c2f4e]                           dc.b 'Abbruch',0
TEXT_02:
[000c2f56]                           dc.b 'Text:',0
TEXT_05:
[000c2f5c]                           dc.b 'Sonstiges',0
TEXT_06:
[000c2f66]                           dc.b 'Text',0
TEXT_08:
[000c2f6b]                           dc.b '3D-Darstellung (sonst flach)',0
TEXT_09:
[000c2f88]                           dc.b 'BubbleGEM-Text',0
TEXT_16:
[000c2f97]                           dc.b 'Context-Popup',0
help_title:
[000c2fa5]                           dc.b 'Der Checkbox-/Radiobutton-Editor',0
title:
[000c2fc6]                           dc.b 'CHECKBUTTON -',0
A_3DBUTTON02:
[000c2fd4] 00064a22                  dc.l A_3Dbutton
[000c2fd8]                           dc.w $29f1
[000c2fda]                           dc.w $0178
[000c2fdc] 000630f2                  dc.l Auo_string
[000c2fe0]                           dc.w $0000
[000c2fe2]                           dc.w $0000
[000c2fe4]                           dc.w $0000
[000c2fe6]                           dc.w $0000
[000c2fe8]                           dc.w $0000
[000c2fea]                           dc.w $0000
[000c2fec]                           dc.w $0000
[000c2fee]                           dc.w $0000
[000c2ff0]                           dc.w $0000
[000c2ff2]                           dc.w $0000
A_3DBUTTON04:
[000c2ff4] 00064a22                  dc.l A_3Dbutton
[000c2ff8]                           dc.w $29c1
[000c2ffa]                           dc.w $0178
[000c2ffc] 000630f2                  dc.l Auo_string
[000c3000] 000c2f4b                  dc.l TEXT_005
[000c3004]                           dc.w $0000
[000c3006]                           dc.w $0000
[000c3008]                           dc.w $0000
[000c300a]                           dc.w $0000
[000c300c] 000c2d14                  dc.l BUBBLE_01
[000c3010]                           dc.w $0000
[000c3012]                           dc.w $0000
A_3DBUTTON05:
[000c3014] 00064a22                  dc.l A_3Dbutton
[000c3018]                           dc.w $21f1
[000c301a]                           dc.w $0178
[000c301c] 000630f2                  dc.l Auo_string
[000c3020]                           dc.w $0000
[000c3022]                           dc.w $0000
[000c3024]                           dc.w $0000
[000c3026]                           dc.w $0000
[000c3028]                           dc.w $0000
[000c302a]                           dc.w $0000
[000c302c]                           dc.w $0000
[000c302e]                           dc.w $0000
[000c3030]                           dc.w $0000
[000c3032]                           dc.w $0000
A_3DBUTTON06:
[000c3034] 00064a22                  dc.l A_3Dbutton
[000c3038]                           dc.w $29c1
[000c303a]                           dc.w $0178
[000c303c] 000630f2                  dc.l Auo_string
[000c3040] 000c2f4e                  dc.l TEXT_009
[000c3044]                           dc.w $0000
[000c3046]                           dc.w $0000
[000c3048]                           dc.w $0000
[000c304a]                           dc.w $0000
[000c304c] 000c2d60                  dc.l BUBBLE_02
[000c3050]                           dc.w $0000
[000c3052]                           dc.w $0000
A_BOXED02:
[000c3054] 0006afea                  dc.l A_boxed
[000c3058]                           dc.w $9000
[000c305a]                           dc.w $ff12
[000c305c] 0006a068                  dc.l Auo_boxed
[000c3060]                           dc.w $0000
[000c3062]                           dc.w $0000
[000c3064]                           dc.w $0000
[000c3066]                           dc.w $0000
[000c3068]                           dc.w $0000
[000c306a]                           dc.w $0000
[000c306c] 000c2e81                  dc.l BUBBLE_05
[000c3070]                           dc.w $0000
[000c3072]                           dc.w $0000
A_BOXED04:
[000c3074] 0006afea                  dc.l A_boxed
[000c3078]                           dc.w $9038
[000c307a]                           dc.w $ff12
[000c307c] 0006a068                  dc.l Auo_boxed
[000c3080]                           dc.w $0000
[000c3082]                           dc.w $0000
[000c3084]                           dc.w $0000
[000c3086]                           dc.w $0000
[000c3088]                           dc.w $0000
[000c308a]                           dc.w $0000
[000c308c] 000c2dab                  dc.l BUBBLE_03
[000c3090]                           dc.w $0000
[000c3092]                           dc.w $0000
A_BOXED05:
[000c3094] 0006afea                  dc.l A_boxed
[000c3098]                           dc.w $9038
[000c309a]                           dc.w $ff12
[000c309c] 0006a068                  dc.l Auo_boxed
[000c30a0]                           dc.w $0000
[000c30a2]                           dc.w $0000
[000c30a4]                           dc.w $0000
[000c30a6]                           dc.w $0000
[000c30a8]                           dc.w $0000
[000c30aa]                           dc.w $0000
[000c30ac] 000c2dfd                  dc.l BUBBLE_04
[000c30b0]                           dc.w $0000
[000c30b2]                           dc.w $0000
A_CHECKBOX01:
[000c30b4] 0006323e                  dc.l A_checkbox
[000c30b8]                           dc.w $0000
[000c30ba]                           dc.w $0001
[000c30bc] 000630f2                  dc.l Auo_string
[000c30c0] 000c2f6b                  dc.l TEXT_08
[000c30c4]                           dc.w $0000
[000c30c6]                           dc.w $0000
[000c30c8]                           dc.w $0000
[000c30ca]                           dc.w $0000
[000c30cc] 000c2eb5                  dc.l BUBBLE_06
[000c30d0]                           dc.w $0000
[000c30d2]                           dc.w $0000
A_CHECKBOX03:
[000c30d4] 0006323e                  dc.l A_checkbox
[000c30d8]                           dc.w $0000
[000c30da]                           dc.w $0001
[000c30dc] 000630f2                  dc.l Auo_string
[000c30e0] 000c2f66                  dc.l TEXT_06
[000c30e4]                           dc.w $0000
[000c30e6]                           dc.w $0000
[000c30e8]                           dc.w $0000
[000c30ea]                           dc.w $0000
[000c30ec]                           dc.w $0000
[000c30ee]                           dc.w $0000
[000c30f0]                           dc.w $0000
[000c30f2]                           dc.w $0000
A_INNERFRAME02:
[000c30f4] 00064256                  dc.l A_innerframe
[000c30f8]                           dc.w $1000
[000c30fa]                           dc.w $8f19
[000c30fc] 000630f2                  dc.l Auo_string
[000c3100] 000c2f56                  dc.l TEXT_02
[000c3104]                           dc.w $0000
[000c3106]                           dc.w $0000
[000c3108]                           dc.w $0000
[000c310a]                           dc.w $0000
[000c310c]                           dc.w $0000
[000c310e]                           dc.w $0000
[000c3110]                           dc.w $0000
[000c3112]                           dc.w $0000
A_INNERFRAME03:
[000c3114] 00064256                  dc.l A_innerframe
[000c3118]                           dc.w $1800
[000c311a]                           dc.w $8f19
[000c311c] 000630f2                  dc.l Auo_string
[000c3120] 000c2f5c                  dc.l TEXT_05
[000c3124]                           dc.w $0000
[000c3126]                           dc.w $0000
[000c3128]                           dc.w $0000
[000c312a]                           dc.w $0000
[000c312c]                           dc.w $0000
[000c312e]                           dc.w $0000
[000c3130]                           dc.w $0000
[000c3132]                           dc.w $0000
ED_CHECKBOX:
[000c3134]                           dc.w $ffff
[000c3136]                           dc.w $0001
[000c3138]                           dc.w $000b
[000c313a]                           dc.w $0018
[000c313c]                           dc.w $0040
[000c313e]                           dc.w $0010
[000c3140] 000c3014                  dc.l A_3DBUTTON05
[000c3144]                           dc.w $0000
[000c3146]                           dc.w $0000
[000c3148]                           dc.w $0028
[000c314a]                           dc.w $000c
_01_ED_CHECKBOX:
[000c314c]                           dc.w $0003
[000c314e]                           dc.w $0002
[000c3150]                           dc.w $0002
[000c3152]                           dc.w $0018
[000c3154]                           dc.w $0040
[000c3156]                           dc.w $0000
[000c3158] 000c2fd4                  dc.l A_3DBUTTON02
[000c315c]                           dc.w $0000
[000c315e]                           dc.w $0000
[000c3160]                           dc.w $0009
[000c3162]                           dc.w $0003
_02_ED_CHECKBOX:
[000c3164]                           dc.w $0001
[000c3166]                           dc.w $ffff
[000c3168]                           dc.w $ffff
[000c316a]                           dc.w $0018
[000c316c]                           dc.w $0000
[000c316e]                           dc.w $0000
[000c3170] 000c30d4                  dc.l A_CHECKBOX03
[000c3174]                           dc.w $0001
[000c3176]                           dc.w $0001
[000c3178]                           dc.w $0007
[000c317a]                           dc.w $0001
_03_ED_CHECKBOX:
[000c317c]                           dc.w $0005
[000c317e]                           dc.w $ffff
[000c3180]                           dc.w $ffff
[000c3182]                           dc.w $0018
[000c3184]                           dc.w $4007
[000c3186]                           dc.w $0000
[000c3188] 000c2ff4                  dc.l A_3DBUTTON04
[000c318c]                           dc.w $000d
[000c318e]                           dc.w $0001
[000c3190]                           dc.w $000c
[000c3192]                           dc.w $0002
_03aED_CHECKBOX:
[000c3194] 0002ab92                  dc.l ok
[000c3198]                           dc.w $0000
[000c319a]                           dc.w $0000
[000c319c]                           dc.w $8000
[000c319e]                           dc.w $884f
[000c31a0]                           dc.w $0000
[000c31a2]                           dc.w $0000
[000c31a4]                           dc.w $0000
[000c31a6]                           dc.w $0000
[000c31a8]                           dc.w $0000
[000c31aa]                           dc.w $0000
_05_ED_CHECKBOX:
[000c31ac]                           dc.w $0007
[000c31ae]                           dc.w $ffff
[000c31b0]                           dc.w $ffff
[000c31b2]                           dc.w $0018
[000c31b4]                           dc.w $4005
[000c31b6]                           dc.w $0000
[000c31b8] 000c3034                  dc.l A_3DBUTTON06
[000c31bc]                           dc.w $001b
[000c31be]                           dc.w $0001
[000c31c0]                           dc.w $000c
[000c31c2]                           dc.w $0002
_05aED_CHECKBOX:
[000c31c4] 0002ab6c                  dc.l abort
[000c31c8]                           dc.w $0000
[000c31ca]                           dc.w $0000
[000c31cc]                           dc.w $8000
[000c31ce]                           dc.w $8841
[000c31d0]                           dc.w $0000
[000c31d2]                           dc.w $0000
[000c31d4]                           dc.w $0000
[000c31d6]                           dc.w $0000
[000c31d8]                           dc.w $0000
[000c31da]                           dc.w $0000
_07_ED_CHECKBOX:
[000c31dc]                           dc.w $0009
[000c31de]                           dc.w $0008
[000c31e0]                           dc.w $0008
[000c31e2]                           dc.w $0018
[000c31e4]                           dc.w $0040
[000c31e6]                           dc.w $0000
[000c31e8] 000c30f4                  dc.l A_INNERFRAME02
[000c31ec]                           dc.w $0001
[000c31ee]                           dc.w $0003
[000c31f0]                           dc.w $0026
[000c31f2]                           dc.w $0003
_08_ED_CHECKBOX:
[000c31f4]                           dc.w $0007
[000c31f6]                           dc.w $ffff
[000c31f8]                           dc.w $ffff
[000c31fa]                           dc.w $0018
[000c31fc]                           dc.w $0008
[000c31fe]                           dc.w $0010
[000c3200] 000c3054                  dc.l A_BOXED02
[000c3204]                           dc.w $0001
[000c3206]                           dc.w $0001
[000c3208]                           dc.w $0024
[000c320a]                           dc.w $0001
_09_ED_CHECKBOX:
[000c320c]                           dc.w $000b
[000c320e]                           dc.w $ffff
[000c3210]                           dc.w $ffff
[000c3212]                           dc.w $0018
[000c3214]                           dc.w $0041
[000c3216]                           dc.w $0001
[000c3218] 000c30b4                  dc.l A_CHECKBOX01
[000c321c]                           dc.w $0002
[000c321e]                           dc.w $0006
[000c3220]                           dc.w $001f
[000c3222]                           dc.w $0001
_09aED_CHECKBOX:
[000c3224] 0002a8da                  dc.l do3d
[000c3228]                           dc.w $0000
[000c322a]                           dc.w $0000
[000c322c]                           dc.w $8000
[000c322e]                           dc.w $8844
[000c3230]                           dc.w $0000
[000c3232]                           dc.w $0000
[000c3234]                           dc.w $0000
[000c3236]                           dc.w $0000
[000c3238]                           dc.w $0000
[000c323a]                           dc.w $0000
_11_ED_CHECKBOX:
[000c323c]                           dc.w $0000
[000c323e]                           dc.w $000c
[000c3240]                           dc.w $000f
[000c3242]                           dc.w $0018
[000c3244]                           dc.w $0040
[000c3246]                           dc.w $0000
[000c3248] 000c3114                  dc.l A_INNERFRAME03
[000c324c]                           dc.w $0001
[000c324e]                           dc.w $0007
[000c3250]                           dc.w $0026
[000c3252]                           dc.w $0005
_12_ED_CHECKBOX:
[000c3254]                           dc.w $000d
[000c3256]                           dc.w $ffff
[000c3258]                           dc.w $ffff
[000c325a]                           dc.w $001c
[000c325c]                           dc.w $0000
[000c325e]                           dc.w $0000
[000c3260] 000c2f88                  dc.l TEXT_09
[000c3264]                           dc.w $0001
[000c3266]                           dc.w $0001
[000c3268]                           dc.w $000e
[000c326a]                           dc.w $0001
_13_ED_CHECKBOX:
[000c326c]                           dc.w $000e
[000c326e]                           dc.w $ffff
[000c3270]                           dc.w $ffff
[000c3272]                           dc.w $0018
[000c3274]                           dc.w $0008
[000c3276]                           dc.w $0010
[000c3278] 000c3074                  dc.l A_BOXED04
[000c327c]                           dc.w $0010
[000c327e]                           dc.w $0001
[000c3280]                           dc.w $0015
[000c3282]                           dc.w $0001
_14_ED_CHECKBOX:
[000c3284]                           dc.w $000f
[000c3286]                           dc.w $ffff
[000c3288]                           dc.w $ffff
[000c328a]                           dc.w $001c
[000c328c]                           dc.w $0000
[000c328e]                           dc.w $0000
[000c3290] 000c2f97                  dc.l TEXT_16
[000c3294]                           dc.w $0001
[000c3296]                           dc.w $0003
[000c3298]                           dc.w $000d
[000c329a]                           dc.w $0001
_15_ED_CHECKBOX:
[000c329c]                           dc.w $000b
[000c329e]                           dc.w $ffff
[000c32a0]                           dc.w $ffff
[000c32a2]                           dc.w $0018
[000c32a4]                           dc.w $0028
[000c32a6]                           dc.w $0010
[000c32a8] 000c3094                  dc.l A_BOXED05
[000c32ac]                           dc.w $0010
[000c32ae]                           dc.w $0003
[000c32b0]                           dc.w $0015
[000c32b2]                           dc.w $0001
aucheck:
[000c32b4] 0006323e                  dc.l A_checkbox
[000c32b8]                           dc.w $0000
[000c32ba]                           dc.w $0001
[000c32bc] 000630f2                  dc.l Auo_string
[000c32c0] 000c3450                  dc.l $000c3450
[000c32c4]                           dc.w $0000
[000c32c6]                           dc.w $0000
[000c32c8]                           dc.w $0000
[000c32ca]                           dc.w $0000
[000c32cc]                           dc.w $0000
[000c32ce]                           dc.w $0000
[000c32d0]                           dc.w $0000
[000c32d2]                           dc.w $0000
auradio:
[000c32d4] 0006323e                  dc.l A_checkbox
[000c32d8]                           dc.w $0000
[000c32da]                           dc.w $0001
[000c32dc] 000630f2                  dc.l Auo_string
[000c32e0] 000c3456                  dc.l $000c3456
[000c32e4]                           dc.w $0000
[000c32e6]                           dc.w $0000
[000c32e8]                           dc.w $0000
[000c32ea]                           dc.w $0000
[000c32ec]                           dc.w $0000
[000c32ee]                           dc.w $0000
[000c32f0]                           dc.w $0000
[000c32f2]                           dc.w $0000
visual:
[000c32f4]                           dc.w $ffff
[000c32f6]                           dc.w $ffff
[000c32f8]                           dc.w $ffff
[000c32fa]                           dc.w $0018
[000c32fc]                           dc.w $2001
[000c32fe]                           dc.w $0010
[000c3300] 000c32b4                  dc.l aucheck
[000c3304]                           dc.w $0000
[000c3306]                           dc.w $0000
[000c3308]                           dc.w $0008
[000c330a]                           dc.w $0001
logical:
[000c330c]                           dc.w $ffff
[000c330e]                           dc.w $ffff
[000c3310]                           dc.w $ffff
[000c3312]                           dc.w $0018
[000c3314]                           dc.w $0001
[000c3316]                           dc.w $0000
[000c3318] 000c32b4                  dc.l aucheck
[000c331c]                           dc.w $0000
[000c331e]                           dc.w $0000
[000c3320]                           dc.w $0008
[000c3322]                           dc.w $0001
radvisual:
[000c3324]                           dc.w $ffff
[000c3326]                           dc.w $ffff
[000c3328]                           dc.w $ffff
[000c332a]                           dc.w $0018
[000c332c]                           dc.w $2011
[000c332e]                           dc.w $0010
[000c3330] 000c32d4                  dc.l auradio
[000c3334]                           dc.w $0000
[000c3336]                           dc.w $0000
[000c3338]                           dc.w $0008
[000c333a]                           dc.w $0001
radlogical:
[000c333c]                           dc.w $ffff
[000c333e]                           dc.w $ffff
[000c3340]                           dc.w $ffff
[000c3342]                           dc.w $0018
[000c3344]                           dc.w $0011
[000c3346]                           dc.w $0000
[000c3348] 000c32d4                  dc.l auradio
[000c334c]                           dc.w $0000
[000c334e]                           dc.w $0000
[000c3350]                           dc.w $0008
[000c3352]                           dc.w $0001
aud:
[000c3354] 000c345c                  dc.l $000c345c
[000c3358] 000c3461                  dc.l $000c3461
[000c335c]                           dc.w $0002
[000c335e] 000c3450                  dc.l $000c3450
[000c3362]                           dc.w $0000
[000c3364]                           dc.w $0000
[000c3366]                           dc.w $0000
[000c3368]                           dc.w $0000
[000c336a]                           dc.w $0000
[000c336c]                           dc.w $0000
[000c336e]                           dc.w $0000
[000c3370]                           dc.w $0000
[000c3372]                           dc.w $0000
[000c3374]                           dc.w $0000
[000c3376]                           dc.w $0000
[000c3378]                           dc.w $0000
[000c337a]                           dc.w $0000
[000c337c]                           dc.w $0000
[000c337e]                           dc.w $0000
[000c3380]                           dc.w $0000
radaud:
[000c3382] 000c345c                  dc.l $000c345c
[000c3386] 000c3461                  dc.l $000c3461
[000c338a]                           dc.w $0002
[000c338c] 000c3456                  dc.l $000c3456
[000c3390]                           dc.w $0000
[000c3392]                           dc.w $0000
[000c3394]                           dc.w $0000
[000c3396]                           dc.w $0000
[000c3398]                           dc.w $0000
[000c339a]                           dc.w $0000
[000c339c]                           dc.w $0000
[000c339e]                           dc.w $0000
[000c33a0]                           dc.w $0000
[000c33a2]                           dc.w $0000
[000c33a4]                           dc.w $0000
[000c33a6]                           dc.w $0000
[000c33a8]                           dc.w $0000
[000c33aa]                           dc.w $0000
[000c33ac]                           dc.w $0000
[000c33ae]                           dc.w $0000
data:
[000c33b0]                           dc.b 'A_checkbox',0
[000c33bb]                           dc.b $00
[000c33bc]                           dc.w $0000
[000c33be]                           dc.w $0000
[000c33c0]                           dc.w $0000
[000c33c2]                           dc.w $0000
[000c33c4]                           dc.w $0000
[000c33c6]                           dc.w $0000
[000c33c8]                           dc.w $0000
[000c33ca]                           dc.w $0000
[000c33cc]                           dc.w $0000
[000c33ce]                           dc.w $0000
[000c33d0] 0002a9c0                  dc.l object_tree
[000c33d4] 0002ab16                  dc.l test_it
[000c33d8] 0002ab92                  dc.l ok
[000c33dc] 0004f20a                  dc.l Aob_delete
[000c33e0] 000c32f4                  dc.l visual
[000c33e4] 000c330c                  dc.l logical
[000c33e8] 000c3354                  dc.l aud
[000c33ec] 0002a976                  dc.l minsize
[000c33f0]                           dc.w $0000
[000c33f2]                           dc.w $0000
[000c33f4] 000c2fc6                  dc.l title
[000c33f8] 000c2fa5                  dc.l help_title
[000c33fc]                           dc.w $0000
[000c33fe]                           dc.w $0000
raddata:
[000c3400]                           dc.b 'A_checkbox',0
[000c340b]                           dc.b $00
[000c340c]                           dc.w $0000
[000c340e]                           dc.w $0000
[000c3410]                           dc.w $0000
[000c3412]                           dc.w $0000
[000c3414]                           dc.w $0000
[000c3416]                           dc.w $0000
[000c3418]                           dc.w $0000
[000c341a]                           dc.w $0000
[000c341c]                           dc.w $0000
[000c341e]                           dc.w $0000
[000c3420] 0002a9c0                  dc.l object_tree
[000c3424] 0002ab16                  dc.l test_it
[000c3428] 0002ab92                  dc.l ok
[000c342c] 0004f20a                  dc.l Aob_delete
[000c3430] 000c3324                  dc.l radvisual
[000c3434] 000c333c                  dc.l radlogical
[000c3438] 000c3382                  dc.l radaud
[000c343c] 0002a976                  dc.l minsize
[000c3440]                           dc.w $0000
[000c3442]                           dc.w $0000
[000c3444] 000c2fc6                  dc.l title
[000c3448] 000c2fa5                  dc.l help_title
[000c344c]                           dc.w $0000
[000c344e]                           dc.w $0000
[000c3450]                           dc.b 'Check',0
[000c3456]                           dc.b 'Radio',0
[000c345c]                           dc.b '0x1L',0
[000c3461]                           dc.b 'Auo_string',0
[000c346c]                           dc.b '0x%lxL',0
[000c3473]                           dc.b $00
