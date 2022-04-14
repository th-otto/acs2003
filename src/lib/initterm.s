_ACSmessage:
[0004096e] 4e75                      rts
_ACSclose:
[00040970] 4eb9 0004 63f4            jsr        $000463F4
[00040976] 2079 0010 1f12            movea.l    ACSblk,a0
[0004097c] 3028 0236                 move.w     566(a0),d0
[00040980] 6606                      bne.s      $00040988
[00040982] 3228 027e                 move.w     638(a0),d1
[00040986] 6708                      beq.s      $00040990
[00040988] 4eb9 0004 640a            jsr        $0004640A
[0004098e] 4e75                      rts
[00040990] 91c8                      suba.l     a0,a0
[00040992] 7002                      moveq.l    #2,d0
[00040994] 4eb9 0004 ef62            jsr        $0004EF62
[0004099a] 4e75                      rts
_ACSaboutme:
[0004099c] 48e7 0038                 movem.l    a2-a4,-(a7)
[000409a0] 47f9 000d 2cad            lea.l      $000D2CAD,a3
[000409a6] 41eb fe5f                 lea.l      -417(a3),a0
[000409aa] 226b fe67                 movea.l    -409(a3),a1
[000409ae] 4e91                      jsr        (a1)
[000409b0] 2448                      movea.l    a0,a2
[000409b2] 200a                      move.l     a2,d0
[000409b4] 6700 0094                 beq        $00040A4A
[000409b8] 43eb ffe6                 lea.l      -26(a3),a1
[000409bc] 206a 0014                 movea.l    20(a2),a0
[000409c0] 7007                      moveq.l    #7,d0
[000409c2] 4eb9 0004 afe0            jsr        $0004AFE0
[000409c8] 1013                      move.b     (a3),d0
[000409ca] 6658                      bne.s      $00040A24
[000409cc] 49eb fff4                 lea.l      -12(a3),a4
[000409d0] 102c 0004                 move.b     4(a4),d0
[000409d4] 4880                      ext.w      d0
[000409d6] 4eb9 0007 723a            jsr        $0007723A
[000409dc] 4a40                      tst.w      d0
[000409de] 6704                      beq.s      $000409E4
[000409e0] 7030                      moveq.l    #48,d0
[000409e2] 6004                      bra.s      $000409E8
[000409e4] 102c 0004                 move.b     4(a4),d0
[000409e8] 1680                      move.b     d0,(a3)
[000409ea] 176c 0005 0001            move.b     5(a4),1(a3)
[000409f0] 177c 002e 0002            move.b     #$2E,2(a3)
[000409f6] 43eb 0003                 lea.l      3(a3),a1
[000409fa] 204c                      movea.l    a4,a0
[000409fc] 4eb9 0005 fe4a            jsr        $0005FE4A
[00040a02] 177c 002e 0005            move.b     #$2E,5(a3)
[00040a08] 176c 0007 0006            move.b     7(a4),6(a3)
[00040a0e] 176c 0008 0007            move.b     8(a4),7(a3)
[00040a14] 176c 0009 0008            move.b     9(a4),8(a3)
[00040a1a] 176c 000a 0009            move.b     10(a4),9(a3)
[00040a20] 422b 000a                 clr.b      10(a3)
[00040a24] 4853                      pea.l      (a3)
[00040a26] 43f9 000d 2cb8            lea.l      $000D2CB8,a1
[00040a2c] 7006                      moveq.l    #6,d0
[00040a2e] 206a 0014                 movea.l    20(a2),a0
[00040a32] 4eb9 0004 afac            jsr        $0004AFAC
[00040a38] 584f                      addq.w     #4,a7
[00040a3a] 204a                      movea.l    a2,a0
[00040a3c] 4eb9 0005 1292            jsr        $00051292
[00040a42] 204a                      movea.l    a2,a0
[00040a44] 4eb9 0005 0330            jsr        $00050330
[00040a4a] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00040a4e] 4e75                      rts
dummy:
[00040a50] 4e75                      rts
ok:
[00040a52] 4240                      clr.w      d0
[00040a54] 4e75                      rts
[00040a56] 23c8 0010 261c            move.l     a0,$0010261C
[00040a5c] 4e75                      rts

[00042a18[00040a5e] 2f0a                      move.l     a2,-(a7)
[00040a60] 2f0b                      move.l     a3,-(a7)
[00040a62] 45f9 0010 1f12            lea.l      ACSblk,a2
[00040a68] 2652                      movea.l    (a2),a3
[00040a6a] 3740 0286                 move.w     d0,646(a3)
[00040a6e] 2652                      movea.l    (a2),a3
[00040a70] 2748 0288                 move.l     a0,648(a3)
[00040a74] 2652                      movea.l    (a2),a3
[00040a76] 2749 028c                 move.l     a1,652(a3)
[00040a7a] 4eb9 0004 0cc6            jsr        $00040CC6
[00040a80] 4a40                      tst.w      d0
[00040a82] 6610                      bne.s      $00040A94
[00040a84] 4eb9 0004 6e18            jsr        $00046E18
[00040a8a] 4eb9 0004 0e30            jsr        $00040E30
[00040a90] 4240                      clr.w      d0
[00040a92] 6008                      bra.s      $00040A9C
[00040a94] 4eb9 0004 0e30            jsr        $00040E30
[00040a9a] 70ff                      moveq.l    #-1,d0
[00040a9c] 265f                      movea.l    (a7)+,a3
[00040a9e] 245f                      movea.l    (a7)+,a2
[00040aa0] 4e75                      rts
get_acsblk:
[00040aa2] 2f0a                      move.l     a2,-(a7)
[00040aa4] 2f0b                      move.l     a3,-(a7)
[00040aa6] 45f9 0010 1f12            lea.l      ACSblk,a2
[00040aac] 24bc 0010 1f16            move.l     #$00101F16,(a2)
[00040ab2] 223c 0000 0506            move.l     #$00000506,d1
[00040ab8] 4240                      clr.w      d0
[00040aba] 2052                      movea.l    (a2),a0
[00040abc] 4eb9 0007 712e            jsr        $0007712E
[00040ac2] 2052                      movea.l    (a2),a0
[00040ac4] 42a8 04ea                 clr.l      1258(a0)
[00040ac8] 43f9 000d 2cbf            lea.l      $000D2CBF,a1
[00040ace] 2052                      movea.l    (a2),a0
[00040ad0] 41e8 021e                 lea.l      542(a0),a0
[00040ad4] 4eb9 0007 6950            jsr        $00076950
[00040ada] 2052                      movea.l    (a2),a0
[00040adc] 217c 0000 01f4 0232       move.l     #$000001F4,562(a0)
[00040ae4] 2052                      movea.l    (a2),a0
[00040ae6] 317c 0001 0236            move.w     #$0001,566(a0)
[00040aec] 2052                      movea.l    (a2),a0
[00040aee] 4268 0238                 clr.w      568(a0)
[00040af2] 2052                      movea.l    (a2),a0
[00040af4] 4268 023a                 clr.w      570(a0)
[00040af8] 2052                      movea.l    (a2),a0
[00040afa] 217c 0009 be14 023c       move.l     #$0009BE14,572(a0)
[00040b02] 2052                      movea.l    (a2),a0
[00040b04] 2268 023c                 movea.l    572(a0),a1
[00040b08] 0069 0040 000e            ori.w      #$0040,14(a1)
[00040b0e] 2052                      movea.l    (a2),a0
[00040b10] 4268 027e                 clr.w      638(a0)
[00040b14] 2052                      movea.l    (a2),a0
[00040b16] 217c 0010 7b18 0280       move.l     #$00107B18,640(a0)
[00040b1e] 2052                      movea.l    (a2),a0
[00040b20] 317c 0100 0244            move.w     #$0100,580(a0)
[00040b26] 2052                      movea.l    (a2),a0
[00040b28] 217c 0010 241c 0254       move.l     #$0010241C,596(a0)
[00040b30] 2052                      movea.l    (a2),a0
[00040b32] 4268 0286                 clr.w      646(a0)
[00040b36] 2052                      movea.l    (a2),a0
[00040b38] 42a8 0288                 clr.l      648(a0)
[00040b3c] 2052                      movea.l    (a2),a0
[00040b3e] 42a8 028c                 clr.l      652(a0)
[00040b42] 2052                      movea.l    (a2),a0
[00040b44] 217c 0005 26c2 03d6       move.l     #$000526C2,982(a0)
[00040b4c] 41f9 0009 bf94            lea.l      $0009BF94,a0
[00040b52] 2028 0016                 move.l     22(a0),d0
[00040b56] 6704                      beq.s      $00040B5C
[00040b58] 2240                      movea.l    d0,a1
[00040b5a] 6004                      bra.s      $00040B60
[00040b5c] 43fa fef2                 lea.l      $00040A50(pc),a1
[00040b60] 2652                      movea.l    (a2),a3
[00040b62] 2749 0298                 move.l     a1,664(a3)
[00040b66] 2028 001a                 move.l     26(a0),d0
[00040b6a] 6704                      beq.s      $00040B70
[00040b6c] 2640                      movea.l    d0,a3
[00040b6e] 6004                      bra.s      $00040B74
[00040b70] 47fa fe2a                 lea.l      $0004099C(pc),a3
[00040b74] 2252                      movea.l    (a2),a1
[00040b76] 234b 029c                 move.l     a3,668(a1)
[00040b7a] 2028 001e                 move.l     30(a0),d0
[00040b7e] 6704                      beq.s      $00040B84
[00040b80] 2240                      movea.l    d0,a1
[00040b82] 6004                      bra.s      $00040B88
[00040b84] 43fa fdea                 lea.l      $00040970(pc),a1
[00040b88] 2652                      movea.l    (a2),a3
[00040b8a] 2749 02a0                 move.l     a1,672(a3)
[00040b8e] 2028 0022                 move.l     34(a0),d0
[00040b92] 6704                      beq.s      $00040B98
[00040b94] 2640                      movea.l    d0,a3
[00040b96] 6004                      bra.s      $00040B9C
[00040b98] 47fa fdd4                 lea.l      $0004096E(pc),a3
[00040b9c] 2252                      movea.l    (a2),a1
[00040b9e] 234b 02a4                 move.l     a3,676(a1)
[00040ba2] 2028 0026                 move.l     38(a0),d0
[00040ba6] 6704                      beq.s      $00040BAC
[00040ba8] 2240                      movea.l    d0,a1
[00040baa] 6004                      bra.s      $00040BB0
[00040bac] 43fa fea2                 lea.l      $00040A50(pc),a1
[00040bb0] 2652                      movea.l    (a2),a3
[00040bb2] 2749 02a8                 move.l     a1,680(a3)
[00040bb6] 2028 002a                 move.l     42(a0),d0
[00040bba] 6704                      beq.s      $00040BC0
[00040bbc] 2640                      movea.l    d0,a3
[00040bbe] 6004                      bra.s      $00040BC4
[00040bc0] 47fa fe8e                 lea.l      $00040A50(pc),a3
[00040bc4] 2252                      movea.l    (a2),a1
[00040bc6] 234b 02ac                 move.l     a3,684(a1)
[00040bca] 2028 0046                 move.l     70(a0),d0
[00040bce] 6704                      beq.s      $00040BD4
[00040bd0] 2240                      movea.l    d0,a1
[00040bd2] 6004                      bra.s      $00040BD8
[00040bd4] 43fa fe7c                 lea.l      $00040A52(pc),a1
[00040bd8] 2652                      movea.l    (a2),a3
[00040bda] 2749 02b0                 move.l     a1,688(a3)
[00040bde] 2652                      movea.l    (a2),a3
[00040be0] 377c 00c1 02b4            move.w     #$00C1,692(a3)
[00040be6] 2028 002e                 move.l     46(a0),d0
[00040bea] 6704                      beq.s      $00040BF0
[00040bec] 2240                      movea.l    d0,a1
[00040bee] 6004                      bra.s      $00040BF4
[00040bf0] 43fa fe5e                 lea.l      $00040A50(pc),a1
[00040bf4] 2652                      movea.l    (a2),a3
[00040bf6] 2749 02b6                 move.l     a1,694(a3)
[00040bfa] 2028 003a                 move.l     58(a0),d0
[00040bfe] 6704                      beq.s      $00040C04
[00040c00] 2640                      movea.l    d0,a3
[00040c02] 6004                      bra.s      $00040C08
[00040c04] 47fa fe4a                 lea.l      $00040A50(pc),a3
[00040c08] 2252                      movea.l    (a2),a1
[00040c0a] 234b 02c2                 move.l     a3,706(a1)
[00040c0e] 2028 0032                 move.l     50(a0),d0
[00040c12] 6704                      beq.s      $00040C18
[00040c14] 2240                      movea.l    d0,a1
[00040c16] 6004                      bra.s      $00040C1C
[00040c18] 43fa fe36                 lea.l      $00040A50(pc),a1
[00040c1c] 2652                      movea.l    (a2),a3
[00040c1e] 2749 02ba                 move.l     a1,698(a3)
[00040c22] 2028 0036                 move.l     54(a0),d0
[00040c26] 6704                      beq.s      $00040C2C
[00040c28] 2640                      movea.l    d0,a3
[00040c2a] 6004                      bra.s      $00040C30
[00040c2c] 47fa fe22                 lea.l      $00040A50(pc),a3
[00040c30] 2252                      movea.l    (a2),a1
[00040c32] 234b 02be                 move.l     a3,702(a1)
[00040c36] 2028 0042                 move.l     66(a0),d0
[00040c3a] 6704                      beq.s      $00040C40
[00040c3c] 2240                      movea.l    d0,a1
[00040c3e] 6006                      bra.s      $00040C46
[00040c40] 43f9 0005 779e            lea.l      $0005779E,a1
[00040c46] 2652                      movea.l    (a2),a3
[00040c48] 2749 04ee                 move.l     a1,1262(a3)
[00040c4c] 2052                      movea.l    (a2),a0
[00040c4e] 317c 0102 02d0            move.w     #$0102,720(a0)
[00040c54] 2052                      movea.l    (a2),a0
[00040c56] 4268 02c8                 clr.w      712(a0)
[00040c5a] 2052                      movea.l    (a2),a0
[00040c5c] 317c 0003 02c6            move.w     #$0003,710(a0)
[00040c62] 2052                      movea.l    (a2),a0
[00040c64] 217c 0004 0a56 02d2       move.l     #$00040A56,722(a0)
[00040c6c] 2052                      movea.l    (a2),a0
[00040c6e] 42a8 03e0                 clr.l      992(a0)
[00040c72] 2052                      movea.l    (a2),a0
[00040c74] 317c 0014 03e4            move.w     #$0014,996(a0)
[00040c7a] 43f9 000d 2cd3            lea.l      $000D2CD3,a1
[00040c80] 2052                      movea.l    (a2),a0
[00040c82] 41e8 03e6                 lea.l      998(a0),a0
[00040c86] 4eb9 0007 6950            jsr        $00076950
[00040c8c] 2052                      movea.l    (a2),a0
[00040c8e] 42a8 026a                 clr.l      618(a0)
[00040c92] 2052                      movea.l    (a2),a0
[00040c94] 4228 04f2                 clr.b      1266(a0)
[00040c98] 2052                      movea.l    (a2),a0
[00040c9a] 317c 0001 04fc            move.w     #$0001,1276(a0)
[00040ca0] 2052                      movea.l    (a2),a0
[00040ca2] 265f                      movea.l    (a7)+,a3
[00040ca4] 245f                      movea.l    (a7)+,a2
[00040ca6] 4e75                      rts

main:
[00040ca8] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00040cac] 3600                      move.w     d0,d3
[00040cae] 2648                      movea.l    a0,a3
[00040cb0] 2449                      movea.l    a1,a2
[00040cb2] 6100 fdee                 bsr        $00040AA2
[00040cb6] 224a                      movea.l    a2,a1
[00040cb8] 204b                      movea.l    a3,a0
[00040cba] 3003                      move.w     d3,d0
[00040cbc] 6100 fda0                 bsr        $00040A5E
[00040cc0] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00040cc4] 4e75                      rts
