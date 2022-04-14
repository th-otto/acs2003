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
