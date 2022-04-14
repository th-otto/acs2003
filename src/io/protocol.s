prot_texte:
[0001690e] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[00016912] 554f                      subq.w     #2,a7
[00016914] 2448                      movea.l    a0,a2
[00016916] 2649                      movea.l    a1,a3
[00016918] 262a 000e                 move.l     14(a2),d3
[0001691c] e48b                      lsr.l      #2,d3
[0001691e] 4a43                      tst.w      d3
[00016920] 6f00 00bc                 ble        $000169DE
[00016924] 41ea 0016                 lea.l      22(a2),a0
[00016928] 4eb9 0001 9d78            jsr        info_list
[0001692e] 246a 0004                 movea.l    4(a2),a2
[00016932] 204b                      movea.l    a3,a0
[00016934] 4eb9 0001 8374            jsr        save_string
[0001693a] 422f 0001                 clr.b      1(a7)
[0001693e] 4244                      clr.w      d4
[00016940] 49f9 000a 4704            lea.l      $000A4704,a4
[00016946] 6000 0086                 bra        $000169CE
[0001694a] 3004                      move.w     d4,d0
[0001694c] 48c0                      ext.l      d0
[0001694e] e588                      lsl.l      #2,d0
[00016950] 2c72 0800                 movea.l    0(a2,d0.l),a6
[00016954] 41ee 0016                 lea.l      22(a6),a0
[00016958] 4eb9 0001 9dd0            jsr        info_obj
[0001695e] 486e 0016                 pea.l      22(a6)
[00016962] 224c                      movea.l    a4,a1
[00016964] 41f9 0010 7f66            lea.l      iostring,a0
[0001696a] 4eb9 0008 15ac            jsr        sprintf
[00016970] 584f                      addq.w     #4,a7
[00016972] 41f9 0010 7f66            lea.l      iostring,a0
[00016978] 4eb9 0001 8374            jsr        save_string
[0001697e] 2c6e 0004                 movea.l    4(a6),a6
[00016982] 6024                      bra.s      $000169A8
[00016984] 1e95                      move.b     (a5),(a7)
[00016986] 4215                      clr.b      (a5)
[00016988] 204e                      movea.l    a6,a0
[0001698a] 4eb9 0001 8374            jsr        save_string
[00016990] 41ec 0008                 lea.l      8(a4),a0
[00016994] 4eb9 0001 8374            jsr        save_string
[0001699a] 41d7                      lea.l      (a7),a0
[0001699c] 4eb9 0001 8374            jsr        save_string
[000169a2] 1a97                      move.b     (a7),(a5)
[000169a4] 4ded 0001                 lea.l      1(a5),a6
[000169a8] 43ec 0007                 lea.l      7(a4),a1
[000169ac] 204e                      movea.l    a6,a0
[000169ae] 4eb9 0008 2ff0            jsr        strpbrk
[000169b4] 2a48                      movea.l    a0,a5
[000169b6] 200d                      move.l     a5,d0
[000169b8] 66ca                      bne.s      $00016984
[000169ba] 204e                      movea.l    a6,a0
[000169bc] 4eb9 0001 8374            jsr        save_string
[000169c2] 41ec 000a                 lea.l      10(a4),a0
[000169c6] 4eb9 0001 8374            jsr        save_string
[000169cc] 5244                      addq.w     #1,d4
[000169ce] b644                      cmp.w      d4,d3
[000169d0] 6e00 ff78                 bgt        $0001694A
[000169d4] 41ec 000e                 lea.l      14(a4),a0
[000169d8] 4eb9 0001 8374            jsr        save_string
[000169de] 544f                      addq.w     #2,a7
[000169e0] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[000169e4] 4e75                      rts
prot_clickdrag:
[000169e6] 48e7 1e3e                 movem.l    d3-d6/a2-a6,-(a7)
[000169ea] 4fef fee8                 lea.l      -280(a7),a7
[000169ee] 2f48 0114                 move.l     a0,276(a7)
[000169f2] 2628 000e                 move.l     14(a0),d3
[000169f6] e48b                      lsr.l      #2,d3
[000169f8] 4a43                      tst.w      d3
[000169fa] 6f00 01d2                 ble        $00016BCE
[000169fe] 41e8 0016                 lea.l      22(a0),a0
[00016a02] 4eb9 0001 9d78            jsr        info_list
[00016a08] 206f 0114                 movea.l    276(a7),a0
[00016a0c] 41e8 0016                 lea.l      22(a0),a0
[00016a10] 4eb9 0001 8374            jsr        save_string
[00016a16] 41f9 000a 4717            lea.l      $000A4717,a0
[00016a1c] 4eb9 0001 8374            jsr        save_string
[00016a22] 206f 0114                 movea.l    276(a7),a0
[00016a26] 2f68 0004 0110            move.l     4(a0),272(a7)
[00016a2c] 4244                      clr.w      d4
[00016a2e] 6000 018c                 bra        $00016BBC
[00016a32] 3004                      move.w     d4,d0
[00016a34] 48c0                      ext.l      d0
[00016a36] e588                      lsl.l      #2,d0
[00016a38] 206f 0110                 movea.l    272(a7),a0
[00016a3c] 2c70 0800                 movea.l    0(a0,d0.l),a6
[00016a40] 41ee 0016                 lea.l      22(a6),a0
[00016a44] 4eb9 0001 9dd0            jsr        info_obj
[00016a4a] 4217                      clr.b      (a7)
[00016a4c] 302e 0038                 move.w     56(a6),d0
[00016a50] c07c 0100                 and.w      #$0100,d0
[00016a54] 670e                      beq.s      $00016A64
[00016a56] 43f9 000a 4732            lea.l      $000A4732,a1
[00016a5c] 41d7                      lea.l      (a7),a0
[00016a5e] 4eb9 0008 2e42            jsr        strcat
[00016a64] 302e 0038                 move.w     56(a6),d0
[00016a68] c07c 0200                 and.w      #$0200,d0
[00016a6c] 670e                      beq.s      $00016A7C
[00016a6e] 43f9 000a 4738            lea.l      $000A4738,a1
[00016a74] 41d7                      lea.l      (a7),a0
[00016a76] 4eb9 0008 2e42            jsr        strcat
[00016a7c] 302e 0038                 move.w     56(a6),d0
[00016a80] c07c 0400                 and.w      #$0400,d0
[00016a84] 671a                      beq.s      $00016AA0
[00016a86] 322e 0038                 move.w     56(a6),d1
[00016a8a] c27c 0100                 and.w      #$0100,d1
[00016a8e] 6710                      beq.s      $00016AA0
[00016a90] 43f9 000a 4740            lea.l      $000A4740,a1
[00016a96] 41d7                      lea.l      (a7),a0
[00016a98] 4eb9 0008 2e42            jsr        strcat
[00016a9e] 600e                      bra.s      $00016AAE
[00016aa0] 43f9 000a 4746            lea.l      $000A4746,a1
[00016aa6] 41d7                      lea.l      (a7),a0
[00016aa8] 4eb9 0008 2e42            jsr        strcat
[00016aae] 4857                      pea.l      (a7)
[00016ab0] 3f2e 0036                 move.w     54(a6),-(a7)
[00016ab4] 486e 0016                 pea.l      22(a6)
[00016ab8] 43f9 000a 474d            lea.l      $000A474D,a1
[00016abe] 41f9 0010 7f66            lea.l      iostring,a0
[00016ac4] 4eb9 0008 15ac            jsr        sprintf
[00016aca] 4fef 000a                 lea.l      10(a7),a7
[00016ace] 41f9 0010 7f66            lea.l      iostring,a0
[00016ad4] 4eb9 0001 8374            jsr        save_string
[00016ada] 202e 000e                 move.l     14(a6),d0
[00016ade] 7238                      moveq.l    #56,d1
[00016ae0] 4eb9 0008 3c5a            jsr        _uldiv
[00016ae6] 2a00                      move.l     d0,d5
[00016ae8] 2c6e 0004                 movea.l    4(a6),a6
[00016aec] 4246                      clr.w      d6
[00016aee] 6000 00b8                 bra        $00016BA8
[00016af2] 47f9 000a 470a            lea.l      $000A470A,a3
[00016af8] 284b                      movea.l    a3,a4
[00016afa] 244c                      movea.l    a4,a2
[00016afc] 422f 0100                 clr.b      256(a7)
[00016b00] 2016                      move.l     (a6),d0
[00016b02] 6706                      beq.s      $00016B0A
[00016b04] 2440                      movea.l    d0,a2
[00016b06] 45ea 0016                 lea.l      22(a2),a2
[00016b0a] 202e 0020                 move.l     32(a6),d0
[00016b0e] 6706                      beq.s      $00016B16
[00016b10] 2840                      movea.l    d0,a4
[00016b12] 49ec 0016                 lea.l      22(a4),a4
[00016b16] 202e 0024                 move.l     36(a6),d0
[00016b1a] 6706                      beq.s      $00016B22
[00016b1c] 2640                      movea.l    d0,a3
[00016b1e] 47eb 0016                 lea.l      22(a3),a3
[00016b22] 302e 002a                 move.w     42(a6),d0
[00016b26] 673c                      beq.s      $00016B64
[00016b28] 4eb9 0003 32d6            jsr        key_string
[00016b2e] 2a48                      movea.l    a0,a5
[00016b30] 224d                      movea.l    a5,a1
[00016b32] 41ef 0100                 lea.l      256(a7),a0
[00016b36] 4eb9 0008 2f0c            jsr        strcpy
[00016b3c] 2a48                      movea.l    a0,a5
[00016b3e] 6020                      bra.s      $00016B60
[00016b40] 0c15 0007                 cmpi.b     #$07,(a5)
[00016b44] 6604                      bne.s      $00016B4A
[00016b46] 1abc 0061                 move.b     #$61,(a5)
[00016b4a] 0c15 005e                 cmpi.b     #$5E,(a5)
[00016b4e] 6604                      bne.s      $00016B54
[00016b50] 1abc 0063                 move.b     #$63,(a5)
[00016b54] 0c15 0001                 cmpi.b     #$01,(a5)
[00016b58] 6604                      bne.s      $00016B5E
[00016b5a] 1abc 0073                 move.b     #$73,(a5)
[00016b5e] 524d                      addq.w     #1,a5
[00016b60] 1015                      move.b     (a5),d0
[00016b62] 66dc                      bne.s      $00016B40
[00016b64] 1012                      move.b     (a2),d0
[00016b66] 660e                      bne.s      $00016B76
[00016b68] 122f 0100                 move.b     256(a7),d1
[00016b6c] 6608                      bne.s      $00016B76
[00016b6e] 1414                      move.b     (a4),d2
[00016b70] 6604                      bne.s      $00016B76
[00016b72] 1013                      move.b     (a3),d0
[00016b74] 672c                      beq.s      $00016BA2
[00016b76] 2f0a                      move.l     a2,-(a7)
[00016b78] 2f0b                      move.l     a3,-(a7)
[00016b7a] 2f0c                      move.l     a4,-(a7)
[00016b7c] 486f 010c                 pea.l      268(a7)
[00016b80] 43f9 000a 4822            lea.l      $000A4822,a1
[00016b86] 41f9 0010 7f66            lea.l      iostring,a0
[00016b8c] 4eb9 0008 15ac            jsr        sprintf
[00016b92] 4fef 0010                 lea.l      16(a7),a7
[00016b96] 41f9 0010 7f66            lea.l      iostring,a0
[00016b9c] 4eb9 0001 8374            jsr        save_string
[00016ba2] 4dee 0038                 lea.l      56(a6),a6
[00016ba6] 5246                      addq.w     #1,d6
[00016ba8] ba46                      cmp.w      d6,d5
[00016baa] 6e00 ff46                 bgt        $00016AF2
[00016bae] 41f9 000a 470f            lea.l      $000A470F,a0
[00016bb4] 4eb9 0001 8374            jsr        save_string
[00016bba] 5244                      addq.w     #1,d4
[00016bbc] b644                      cmp.w      d4,d3
[00016bbe] 6e00 fe72                 bgt        $00016A32
[00016bc2] 41f9 000a 4712            lea.l      $000A4712,a0
[00016bc8] 4eb9 0001 8374            jsr        save_string
[00016bce] 4fef 0118                 lea.l      280(a7),a7
[00016bd2] 4cdf 7c78                 movem.l    (a7)+,d3-d6/a2-a6
[00016bd6] 4e75                      rts
prot_labellist:
[00016bd8] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[00016bdc] 2648                      movea.l    a0,a3
[00016bde] 45f9 000a 4704            lea.l      $000A4704,a2
[00016be4] 41ea 0137                 lea.l      311(a2),a0
[00016be8] 4eb9 0001 9d78            jsr        info_list
[00016bee] 41ea 0137                 lea.l      311(a2),a0
[00016bf2] 4eb9 0001 9dd0            jsr        info_obj
[00016bf8] 41ea 013b                 lea.l      315(a2),a0
[00016bfc] 4eb9 0001 8374            jsr        save_string
[00016c02] 7600                      moveq.l    #0,d3
[00016c04] 2803                      move.l     d3,d4
[00016c06] 266b 0010                 movea.l    16(a3),a3
[00016c0a] 49f9 0010 7f66            lea.l      iostring,a4
[00016c10] 6048                      bra.s      $00016C5A
[00016c12] 7001                      moveq.l    #1,d0
[00016c14] c084                      and.l      d4,d0
[00016c16] 670c                      beq.s      $00016C24
[00016c18] 41ea 0032                 lea.l      50(a2),a0
[00016c1c] 4eb9 0001 8374            jsr        save_string
[00016c22] 600a                      bra.s      $00016C2E
[00016c24] 41ea 000b                 lea.l      11(a2),a0
[00016c28] 4eb9 0001 8374            jsr        save_string
[00016c2e] 2f2b 000e                 move.l     14(a3),-(a7)
[00016c32] 3f2b 0036                 move.w     54(a3),-(a7)
[00016c36] 486b 0016                 pea.l      22(a3)
[00016c3a] 43ea 0216                 lea.l      534(a2),a1
[00016c3e] 204c                      movea.l    a4,a0
[00016c40] 4eb9 0008 15ac            jsr        sprintf
[00016c46] 4fef 000a                 lea.l      10(a7),a7
[00016c4a] 204c                      movea.l    a4,a0
[00016c4c] 4eb9 0001 8374            jsr        save_string
[00016c52] d6ab 000e                 add.l      14(a3),d3
[00016c56] 5284                      addq.l     #1,d4
[00016c58] 2653                      movea.l    (a3),a3
[00016c5a] 200b                      move.l     a3,d0
[00016c5c] 66b4                      bne.s      $00016C12
[00016c5e] 41ea 0226                 lea.l      550(a2),a0
[00016c62] 4eb9 0001 8374            jsr        save_string
[00016c68] 2f03                      move.l     d3,-(a7)
[00016c6a] 2f04                      move.l     d4,-(a7)
[00016c6c] 43ea 0282                 lea.l      642(a2),a1
[00016c70] 204c                      movea.l    a4,a0
[00016c72] 4eb9 0008 15ac            jsr        sprintf
[00016c78] 504f                      addq.w     #8,a7
[00016c7a] 204c                      movea.l    a4,a0
[00016c7c] 4eb9 0001 8374            jsr        save_string
[00016c82] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[00016c86] 4e75                      rts
protocol:
[00016c88] 48e7 102c                 movem.l    d3/a2/a4-a5,-(a7)
[00016c8c] 4fef ff7c                 lea.l      -132(a7),a7
[00016c90] 2448                      movea.l    a0,a2
[00016c92] 226a 0008                 movea.l    8(a2),a1
[00016c96] 41d7                      lea.l      (a7),a0
[00016c98] 4eb9 0008 2f0c            jsr        strcpy
[00016c9e] 702e                      moveq.l    #46,d0
[00016ca0] 41d7                      lea.l      (a7),a0
[00016ca2] 4eb9 0008 2e9e            jsr        strrchr
[00016ca8] 2a48                      movea.l    a0,a5
[00016caa] 49f9 000a 4704            lea.l      $000A4704,a4
[00016cb0] 43ec 02b1                 lea.l      689(a4),a1
[00016cb4] 204d                      movea.l    a5,a0
[00016cb6] 4eb9 0008 2f0c            jsr        strcpy
[00016cbc] 4240                      clr.w      d0
[00016cbe] 41d7                      lea.l      (a7),a0
[00016cc0] 4eb9 0008 0c8e            jsr        Fcreate
[00016cc6] 2600                      move.l     d0,d3
[00016cc8] 4a80                      tst.l      d0
[00016cca] 6a20                      bpl.s      $00016CEC
[00016ccc] 206a 0008                 movea.l    8(a2),a0
[00016cd0] 705c                      moveq.l    #92,d0
[00016cd2] 4eb9 0008 2e9e            jsr        strrchr
[00016cd8] 5248                      addq.w     #1,a0
[00016cda] 7009                      moveq.l    #9,d0
[00016cdc] 2279 0010 ee4e            movea.l    ACSblk,a1
[00016ce2] 2269 03d6                 movea.l    982(a1),a1
[00016ce6] 4e91                      jsr        (a1)
[00016ce8] 6000 00be                 bra        $00016DA8
[00016cec] 4215                      clr.b      (a5)
[00016cee] 41d7                      lea.l      (a7),a0
[00016cf0] 4eb9 0001 9c30            jsr        info_start
[00016cf6] 41ec 02b6                 lea.l      694(a4),a0
[00016cfa] 4eb9 0001 9d14            jsr        info_title
[00016d00] 3003                      move.w     d3,d0
[00016d02] 4eb9 0001 82bc            jsr        set_handle
[00016d08] 4eb9 0008 108e            jsr        setjmp
[00016d0e] 4a40                      tst.w      d0
[00016d10] 6712                      beq.s      $00016D24
[00016d12] 91c8                      suba.l     a0,a0
[00016d14] 700a                      moveq.l    #10,d0
[00016d16] 2279 0010 ee4e            movea.l    ACSblk,a1
[00016d1c] 2269 03d6                 movea.l    982(a1),a1
[00016d20] 4e91                      jsr        (a1)
[00016d22] 6076                      bra.s      $00016D9A
[00016d24] 91c8                      suba.l     a0,a0
[00016d26] 4eb9 0008 12ca            jsr        time
[00016d2c] 2f40 0080                 move.l     d0,128(a7)
[00016d30] 4bf9 0010 7f66            lea.l      iostring,a5
[00016d36] 2f2a 0008                 move.l     8(a2),-(a7)
[00016d3a] 41ef 0084                 lea.l      132(a7),a0
[00016d3e] 4eb9 0008 124a            jsr        ctime
[00016d44] 2f08                      move.l     a0,-(a7)
[00016d46] 43f9 000a 4afe            lea.l      pc_welcome,a1
[00016d4c] 204d                      movea.l    a5,a0
[00016d4e] 4eb9 0008 15ac            jsr        sprintf
[00016d54] 504f                      addq.w     #8,a7
[00016d56] 204d                      movea.l    a5,a0
[00016d58] 4eb9 0001 8374            jsr        save_string
[00016d5e] 206a 001c                 movea.l    28(a2),a0
[00016d62] 6100 fc82                 bsr        prot_clickdrag
[00016d66] 206a 0020                 movea.l    32(a2),a0
[00016d6a] 6100 fc7a                 bsr        prot_clickdrag
[00016d6e] 206a 0018                 movea.l    24(a2),a0
[00016d72] 6100 fc72                 bsr        prot_clickdrag
[00016d76] 43ec 02c0                 lea.l      704(a4),a1
[00016d7a] 206a 0034                 movea.l    52(a2),a0
[00016d7e] 6100 fb8e                 bsr        prot_texte
[00016d82] 43ec 02d5                 lea.l      725(a4),a1
[00016d86] 206a 0024                 movea.l    36(a2),a0
[00016d8a] 6100 fb82                 bsr        prot_texte
[00016d8e] 204a                      movea.l    a2,a0
[00016d90] 6100 fe46                 bsr        prot_labellist
[00016d94] 4eb9 0001 8388            jsr        close_buf
[00016d9a] 4eb9 0001 9cf4            jsr        info_end
[00016da0] 3003                      move.w     d3,d0
[00016da2] 4eb9 0008 0c7e            jsr        Fclose
[00016da8] 4fef 0084                 lea.l      132(a7),a7
[00016dac] 4cdf 3408                 movem.l    (a7)+,d3/a2/a4-a5
[00016db0] 4e75                      rts
