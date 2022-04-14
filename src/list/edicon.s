add_icon:
[00034754] 48e7 003c                 movem.l    a2-a5,-(a7)
[00034758] 2448                      movea.l    a0,a2
[0003475a] 2849                      movea.l    a1,a4
[0003475c] 266a 002c                 movea.l    44(a2),a3
[00034760] 006a 0001 0006            ori.w      #$0001,6(a2)
[00034766] 3039 0008 480c            move.w     refimages,d0
[0003476c] 6728                      beq.s      $00034796
[0003476e] 7206                      moveq.l    #6,d1
[00034770] 2279 0010 ee4e            movea.l    ACSblk,a1
[00034776] c269 0266                 and.w      614(a1),d1
[0003477a] 5d41                      subq.w     #6,d1
[0003477c] 6718                      beq.s      $00034796
[0003477e] 43ec 0016                 lea.l      22(a4),a1
[00034782] 204b                      movea.l    a3,a0
[00034784] 4eb9 0003 337c            jsr        find_entry
[0003478a] b9c8                      cmpa.l     a0,a4
[0003478c] 6608                      bne.s      $00034796
[0003478e] 526c 0036                 addq.w     #1,54(a4)
[00034792] 204c                      movea.l    a4,a0
[00034794] 6044                      bra.s      $000347DA
[00034796] 7004                      moveq.l    #4,d0
[00034798] 204b                      movea.l    a3,a0
[0003479a] 4eb9 0001 8028            jsr        objextent
[000347a0] 4a40                      tst.w      d0
[000347a2] 6610                      bne.s      $000347B4
[000347a4] 224c                      movea.l    a4,a1
[000347a6] 204a                      movea.l    a2,a0
[000347a8] 4eb9 0003 47e0            jsr        copy_icon
[000347ae] 2a48                      movea.l    a0,a5
[000347b0] 200d                      move.l     a5,d0
[000347b2] 6604                      bne.s      $000347B8
[000347b4] 91c8                      suba.l     a0,a0
[000347b6] 6022                      bra.s      $000347DA
[000347b8] 2f39 000c e342            move.l     $000CE342,-(a7)
[000347be] 486c 0016                 pea.l      22(a4)
[000347c2] 224d                      movea.l    a5,a1
[000347c4] 204a                      movea.l    a2,a0
[000347c6] 4eb9 0001 81c6            jsr        objname
[000347cc] 504f                      addq.w     #8,a7
[000347ce] 224d                      movea.l    a5,a1
[000347d0] 204b                      movea.l    a3,a0
[000347d2] 4eb9 0003 33b4            jsr        add_entry
[000347d8] 204d                      movea.l    a5,a0
[000347da] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000347de] 4e75                      rts
copy_icon:
[000347e0] 48e7 003e                 movem.l    a2-a6,-(a7)
[000347e4] 2648                      movea.l    a0,a3
[000347e6] 2449                      movea.l    a1,a2
[000347e8] 202a 000e                 move.l     14(a2),d0
[000347ec] 4eb9 0001 7fae            jsr        objmalloc
[000347f2] 2848                      movea.l    a0,a4
[000347f4] 200c                      move.l     a4,d0
[000347f6] 6606                      bne.s      $000347FE
[000347f8] 91c8                      suba.l     a0,a0
[000347fa] 6000 0108                 bra        $00034904
[000347fe] 296a 000e 000e            move.l     14(a2),14(a4)
[00034804] 2a6a 0004                 movea.l    4(a2),a5
[00034808] 2c6c 0004                 movea.l    4(a4),a6
[0003480c] 202a 000e                 move.l     14(a2),d0
[00034810] 224d                      movea.l    a5,a1
[00034812] 204e                      movea.l    a6,a0
[00034814] 4eb9 0008 3500            jsr        memcpy
[0003481a] 226d 0008                 movea.l    8(a5),a1
[0003481e] 204b                      movea.l    a3,a0
[00034820] 4eb9 0003 5f3e            jsr        add_string
[00034826] 2d48 0008                 move.l     a0,8(a6)
[0003482a] 42ae 0022                 clr.l      34(a6)
[0003482e] 42ae 0028                 clr.l      40(a6)
[00034832] 42ae 002c                 clr.l      44(a6)
[00034836] 42ae 0030                 clr.l      48(a6)
[0003483a] 42ae 0034                 clr.l      52(a6)
[0003483e] 3d6d 0026 0026            move.w     38(a5),38(a6)
[00034844] 42ae 0038                 clr.l      56(a6)
[00034848] 42ae 003e                 clr.l      62(a6)
[0003484c] 42ae 0042                 clr.l      66(a6)
[00034850] 42ae 0046                 clr.l      70(a6)
[00034854] 42ae 004a                 clr.l      74(a6)
[00034858] 3d6d 003c 003c            move.w     60(a5),60(a6)
[0003485e] 42ae 004e                 clr.l      78(a6)
[00034862] 202d 0028                 move.l     40(a5),d0
[00034866] 670e                      beq.s      $00034876
[00034868] 2240                      movea.l    d0,a1
[0003486a] 204b                      movea.l    a3,a0
[0003486c] 4eb9 0003 42d4            jsr        add_data
[00034872] 2d48 0028                 move.l     a0,40(a6)
[00034876] 202d 002c                 move.l     44(a5),d0
[0003487a] 670e                      beq.s      $0003488A
[0003487c] 2240                      movea.l    d0,a1
[0003487e] 204b                      movea.l    a3,a0
[00034880] 4eb9 0003 42d4            jsr        add_data
[00034886] 2d48 002c                 move.l     a0,44(a6)
[0003488a] 202d 0030                 move.l     48(a5),d0
[0003488e] 670e                      beq.s      $0003489E
[00034890] 2240                      movea.l    d0,a1
[00034892] 204b                      movea.l    a3,a0
[00034894] 4eb9 0003 42d4            jsr        add_data
[0003489a] 2d48 0030                 move.l     a0,48(a6)
[0003489e] 202d 0034                 move.l     52(a5),d0
[000348a2] 670e                      beq.s      $000348B2
[000348a4] 2240                      movea.l    d0,a1
[000348a6] 204b                      movea.l    a3,a0
[000348a8] 4eb9 0003 42d4            jsr        add_data
[000348ae] 2d48 0034                 move.l     a0,52(a6)
[000348b2] 202d 003e                 move.l     62(a5),d0
[000348b6] 670e                      beq.s      $000348C6
[000348b8] 2240                      movea.l    d0,a1
[000348ba] 204b                      movea.l    a3,a0
[000348bc] 4eb9 0003 42d4            jsr        add_data
[000348c2] 2d48 003e                 move.l     a0,62(a6)
[000348c6] 202d 0042                 move.l     66(a5),d0
[000348ca] 670e                      beq.s      $000348DA
[000348cc] 2240                      movea.l    d0,a1
[000348ce] 204b                      movea.l    a3,a0
[000348d0] 4eb9 0003 42d4            jsr        add_data
[000348d6] 2d48 0042                 move.l     a0,66(a6)
[000348da] 202d 0046                 move.l     70(a5),d0
[000348de] 670e                      beq.s      $000348EE
[000348e0] 2240                      movea.l    d0,a1
[000348e2] 204b                      movea.l    a3,a0
[000348e4] 4eb9 0003 42d4            jsr        add_data
[000348ea] 2d48 0046                 move.l     a0,70(a6)
[000348ee] 202d 004a                 move.l     74(a5),d0
[000348f2] 670e                      beq.s      $00034902
[000348f4] 2240                      movea.l    d0,a1
[000348f6] 204b                      movea.l    a3,a0
[000348f8] 4eb9 0003 42d4            jsr        add_data
[000348fe] 2d48 004a                 move.l     a0,74(a6)
[00034902] 204c                      movea.l    a4,a0
[00034904] 4cdf 7c00                 movem.l    (a7)+,a2-a6
[00034908] 4e75                      rts
dup_icon:
[0003490a] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003490e] 514f                      subq.w     #8,a7
[00034910] 2f48 0004                 move.l     a0,4(a7)
[00034914] 2e89                      move.l     a1,(a7)
[00034916] 47f9 000c e35c            lea.l      my_icon,a3
[0003491c] 7026                      moveq.l    #38,d0
[0003491e] 2257                      movea.l    (a7),a1
[00034920] 204b                      movea.l    a3,a0
[00034922] 4eb9 0008 3500            jsr        memcpy
[00034928] 2057                      movea.l    (a7),a0
[0003492a] 2268 0008                 movea.l    8(a0),a1
[0003492e] 206f 0004                 movea.l    4(a7),a0
[00034932] 4eb9 0003 615c            jsr        dup_string
[00034938] 5368 0036                 subq.w     #1,54(a0)
[0003493c] 2748 0008                 move.l     a0,8(a3)
[00034940] 2257                      movea.l    (a7),a1
[00034942] 3629 0016                 move.w     22(a1),d3
[00034946] e643                      asr.w      #3,d3
[00034948] c7e9 0018                 muls.w     24(a1),d3
[0003494c] 48c3                      ext.l      d3
[0003494e] 2003                      move.l     d3,d0
[00034950] d080                      add.l      d0,d0
[00034952] d0bc 0000 0052            add.l      #$00000052,d0
[00034958] 2740 005c                 move.l     d0,92(a3)
[0003495c] 2740 0060                 move.l     d0,96(a3)
[00034960] 42ab 0022                 clr.l      34(a3)
[00034964] 42ab 0028                 clr.l      40(a3)
[00034968] 42ab 002c                 clr.l      44(a3)
[0003496c] 42ab 0030                 clr.l      48(a3)
[00034970] 42ab 0034                 clr.l      52(a3)
[00034974] 426b 0026                 clr.w      38(a3)
[00034978] 42ab 0038                 clr.l      56(a3)
[0003497c] 42ab 003e                 clr.l      62(a3)
[00034980] 42ab 0042                 clr.l      66(a3)
[00034984] 42ab 0046                 clr.l      70(a3)
[00034988] 42ab 004a                 clr.l      74(a3)
[0003498c] 426b 003c                 clr.w      60(a3)
[00034990] 42ab 004e                 clr.l      78(a3)
[00034994] 2a69 0022                 movea.l    34(a1),a5
[00034998] 200d                      move.l     a5,d0
[0003499a] 6700 0150                 beq        $00034AEC
[0003499e] 0c55 0004                 cmpi.w     #$0004,(a5)
[000349a2] 6600 00a0                 bne        $00034A44
[000349a6] 377c 0004 0026            move.w     #$0004,38(a3)
[000349ac] 286d 0002                 movea.l    2(a5),a4
[000349b0] 200c                      move.l     a4,d0
[000349b2] 6724                      beq.s      $000349D8
[000349b4] 2003                      move.l     d3,d0
[000349b6] e588                      lsl.l      #2,d0
[000349b8] 5c80                      addq.l     #6,d0
[000349ba] 43ec fffa                 lea.l      -6(a4),a1
[000349be] 206f 0004                 movea.l    4(a7),a0
[000349c2] 4eb9 0003 4390            jsr        dup_data
[000349c8] 2448                      movea.l    a0,a2
[000349ca] 2748 0028                 move.l     a0,40(a3)
[000349ce] 536a 0036                 subq.w     #1,54(a2)
[000349d2] 286a 0004                 movea.l    4(a2),a4
[000349d6] 4254                      clr.w      (a4)
[000349d8] 202d 0006                 move.l     6(a5),d0
[000349dc] 6718                      beq.s      $000349F6
[000349de] 2240                      movea.l    d0,a1
[000349e0] 206f 0004                 movea.l    4(a7),a0
[000349e4] 2003                      move.l     d3,d0
[000349e6] 4eb9 0003 4390            jsr        dup_data
[000349ec] 2448                      movea.l    a0,a2
[000349ee] 2748 002c                 move.l     a0,44(a3)
[000349f2] 536a 0036                 subq.w     #1,54(a2)
[000349f6] 286d 000a                 movea.l    10(a5),a4
[000349fa] 200c                      move.l     a4,d0
[000349fc] 6724                      beq.s      $00034A22
[000349fe] 2003                      move.l     d3,d0
[00034a00] e588                      lsl.l      #2,d0
[00034a02] 5c80                      addq.l     #6,d0
[00034a04] 43ec fffa                 lea.l      -6(a4),a1
[00034a08] 206f 0004                 movea.l    4(a7),a0
[00034a0c] 4eb9 0003 4390            jsr        dup_data
[00034a12] 2448                      movea.l    a0,a2
[00034a14] 2748 0030                 move.l     a0,48(a3)
[00034a18] 536a 0036                 subq.w     #1,54(a2)
[00034a1c] 286a 0004                 movea.l    4(a2),a4
[00034a20] 4254                      clr.w      (a4)
[00034a22] 202d 000e                 move.l     14(a5),d0
[00034a26] 6718                      beq.s      $00034A40
[00034a28] 2240                      movea.l    d0,a1
[00034a2a] 206f 0004                 movea.l    4(a7),a0
[00034a2e] 2003                      move.l     d3,d0
[00034a30] 4eb9 0003 4390            jsr        dup_data
[00034a36] 2448                      movea.l    a0,a2
[00034a38] 2748 0034                 move.l     a0,52(a3)
[00034a3c] 536a 0036                 subq.w     #1,54(a2)
[00034a40] 2a6d 0012                 movea.l    18(a5),a5
[00034a44] 200d                      move.l     a5,d0
[00034a46] 6700 00a4                 beq        $00034AEC
[00034a4a] 0c55 0008                 cmpi.w     #$0008,(a5)
[00034a4e] 6600 009c                 bne        $00034AEC
[00034a52] 377c 0008 003c            move.w     #$0008,60(a3)
[00034a58] 286d 0002                 movea.l    2(a5),a4
[00034a5c] 220c                      move.l     a4,d1
[00034a5e] 6724                      beq.s      $00034A84
[00034a60] 2003                      move.l     d3,d0
[00034a62] e788                      lsl.l      #3,d0
[00034a64] 5c80                      addq.l     #6,d0
[00034a66] 43ec fffa                 lea.l      -6(a4),a1
[00034a6a] 206f 0004                 movea.l    4(a7),a0
[00034a6e] 4eb9 0003 4390            jsr        dup_data
[00034a74] 2448                      movea.l    a0,a2
[00034a76] 2748 003e                 move.l     a0,62(a3)
[00034a7a] 536a 0036                 subq.w     #1,54(a2)
[00034a7e] 286a 0004                 movea.l    4(a2),a4
[00034a82] 4254                      clr.w      (a4)
[00034a84] 202d 0006                 move.l     6(a5),d0
[00034a88] 6718                      beq.s      $00034AA2
[00034a8a] 2240                      movea.l    d0,a1
[00034a8c] 206f 0004                 movea.l    4(a7),a0
[00034a90] 2003                      move.l     d3,d0
[00034a92] 4eb9 0003 4390            jsr        dup_data
[00034a98] 2448                      movea.l    a0,a2
[00034a9a] 2748 0042                 move.l     a0,66(a3)
[00034a9e] 536a 0036                 subq.w     #1,54(a2)
[00034aa2] 286d 000a                 movea.l    10(a5),a4
[00034aa6] 200c                      move.l     a4,d0
[00034aa8] 6724                      beq.s      $00034ACE
[00034aaa] 2003                      move.l     d3,d0
[00034aac] e788                      lsl.l      #3,d0
[00034aae] 5c80                      addq.l     #6,d0
[00034ab0] 43ec fffa                 lea.l      -6(a4),a1
[00034ab4] 206f 0004                 movea.l    4(a7),a0
[00034ab8] 4eb9 0003 4390            jsr        dup_data
[00034abe] 2448                      movea.l    a0,a2
[00034ac0] 2748 0046                 move.l     a0,70(a3)
[00034ac4] 536a 0036                 subq.w     #1,54(a2)
[00034ac8] 286a 0004                 movea.l    4(a2),a4
[00034acc] 4254                      clr.w      (a4)
[00034ace] 202d 000e                 move.l     14(a5),d0
[00034ad2] 6718                      beq.s      $00034AEC
[00034ad4] 2240                      movea.l    d0,a1
[00034ad6] 206f 0004                 movea.l    4(a7),a0
[00034ada] 2003                      move.l     d3,d0
[00034adc] 4eb9 0003 4390            jsr        dup_data
[00034ae2] 2448                      movea.l    a0,a2
[00034ae4] 2748 004a                 move.l     a0,74(a3)
[00034ae8] 536a 0036                 subq.w     #1,54(a2)
[00034aec] 43eb 0052                 lea.l      82(a3),a1
[00034af0] 206f 0004                 movea.l    4(a7),a0
[00034af4] 6100 fc5e                 bsr        add_icon
[00034af8] 2448                      movea.l    a0,a2
[00034afa] 200a                      move.l     a2,d0
[00034afc] 6604                      bne.s      $00034B02
[00034afe] 91c8                      suba.l     a0,a0
[00034b00] 6036                      bra.s      $00034B38
[00034b02] 286a 0004                 movea.l    4(a2),a4
[00034b06] 2003                      move.l     d3,d0
[00034b08] 2057                      movea.l    (a7),a0
[00034b0a] 2250                      movea.l    (a0),a1
[00034b0c] 41ec 0052                 lea.l      82(a4),a0
[00034b10] 4eb9 0008 3500            jsr        memcpy
[00034b16] 2003                      move.l     d3,d0
[00034b18] 2057                      movea.l    (a7),a0
[00034b1a] 2268 0004                 movea.l    4(a0),a1
[00034b1e] 41f4 3852                 lea.l      82(a4,d3.l),a0
[00034b22] 4eb9 0008 3500            jsr        memcpy
[00034b28] 28bc 0000 0052            move.l     #$00000052,(a4)
[00034b2e] 7052                      moveq.l    #82,d0
[00034b30] d083                      add.l      d3,d0
[00034b32] 2940 0004                 move.l     d0,4(a4)
[00034b36] 204a                      movea.l    a2,a0
[00034b38] 504f                      addq.w     #8,a7
[00034b3a] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00034b3e] 4e75                      rts
del_icon:
[00034b40] 48e7 0038                 movem.l    a2-a4,-(a7)
[00034b44] 2848                      movea.l    a0,a4
[00034b46] 2449                      movea.l    a1,a2
[00034b48] 536a 0036                 subq.w     #1,54(a2)
[00034b4c] 302a 0036                 move.w     54(a2),d0
[00034b50] 6e00 00b0                 bgt        $00034C02
[00034b54] 206a 0012                 movea.l    18(a2),a0
[00034b58] 2208                      move.l     a0,d1
[00034b5a] 4e71                      nop
[00034b5c] 266a 0004                 movea.l    4(a2),a3
[00034b60] 226b 0008                 movea.l    8(a3),a1
[00034b64] 204c                      movea.l    a4,a0
[00034b66] 4eb9 0003 6108            jsr        del_string
[00034b6c] 202b 0028                 move.l     40(a3),d0
[00034b70] 670a                      beq.s      $00034B7C
[00034b72] 2240                      movea.l    d0,a1
[00034b74] 204c                      movea.l    a4,a0
[00034b76] 4eb9 0003 43b6            jsr        del_data
[00034b7c] 202b 002c                 move.l     44(a3),d0
[00034b80] 670a                      beq.s      $00034B8C
[00034b82] 2240                      movea.l    d0,a1
[00034b84] 204c                      movea.l    a4,a0
[00034b86] 4eb9 0003 43b6            jsr        del_data
[00034b8c] 202b 0030                 move.l     48(a3),d0
[00034b90] 670a                      beq.s      $00034B9C
[00034b92] 2240                      movea.l    d0,a1
[00034b94] 204c                      movea.l    a4,a0
[00034b96] 4eb9 0003 43b6            jsr        del_data
[00034b9c] 202b 0034                 move.l     52(a3),d0
[00034ba0] 670a                      beq.s      $00034BAC
[00034ba2] 2240                      movea.l    d0,a1
[00034ba4] 204c                      movea.l    a4,a0
[00034ba6] 4eb9 0003 43b6            jsr        del_data
[00034bac] 202b 003e                 move.l     62(a3),d0
[00034bb0] 670a                      beq.s      $00034BBC
[00034bb2] 2240                      movea.l    d0,a1
[00034bb4] 204c                      movea.l    a4,a0
[00034bb6] 4eb9 0003 43b6            jsr        del_data
[00034bbc] 202b 0042                 move.l     66(a3),d0
[00034bc0] 670a                      beq.s      $00034BCC
[00034bc2] 2240                      movea.l    d0,a1
[00034bc4] 204c                      movea.l    a4,a0
[00034bc6] 4eb9 0003 43b6            jsr        del_data
[00034bcc] 202b 0046                 move.l     70(a3),d0
[00034bd0] 670a                      beq.s      $00034BDC
[00034bd2] 2240                      movea.l    d0,a1
[00034bd4] 204c                      movea.l    a4,a0
[00034bd6] 4eb9 0003 43b6            jsr        del_data
[00034bdc] 202b 004a                 move.l     74(a3),d0
[00034be0] 670a                      beq.s      $00034BEC
[00034be2] 2240                      movea.l    d0,a1
[00034be4] 204c                      movea.l    a4,a0
[00034be6] 4eb9 0003 43b6            jsr        del_data
[00034bec] 224a                      movea.l    a2,a1
[00034bee] 206c 002c                 movea.l    44(a4),a0
[00034bf2] 4eb9 0003 3420            jsr        del_entry
[00034bf8] 224a                      movea.l    a2,a1
[00034bfa] 204c                      movea.l    a4,a0
[00034bfc] 4eb9 0001 7f52            jsr        objfree
[00034c02] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00034c06] 4e75                      rts
new_work:
[00034c08] 303c 2720                 move.w     #$2720,d0
[00034c0c] 2279 000b 0d40            movea.l    $000B0D40,a1
[00034c12] 4eb9 0003 3dd6            jsr        work_icon
[00034c18] 4e75                      rts
