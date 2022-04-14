A_pattern:
[000659ea] 2f02                      move.l     d2,-(a7)
[000659ec] 4fef fff2                 lea.l      -14(a7),a7
[000659f0] 206f 0016                 movea.l    22(a7),a0
[000659f4] 3028 0016                 move.w     22(a0),d0
[000659f8] 660a                      bne.s      $00065A04
[000659fa] 206f 0016                 movea.l    22(a7),a0
[000659fe] 3028 0018                 move.w     24(a0),d0
[00065a02] 6758                      beq.s      $00065A5C
[00065a04] 206f 0016                 movea.l    22(a7),a0
[00065a08] 3f68 0012 0006            move.w     18(a0),6(a7)
[00065a0e] 206f 0016                 movea.l    22(a7),a0
[00065a12] 3f68 0014 0008            move.w     20(a0),8(a7)
[00065a18] 206f 0016                 movea.l    22(a7),a0
[00065a1c] 3028 0012                 move.w     18(a0),d0
[00065a20] 206f 0016                 movea.l    22(a7),a0
[00065a24] d068 0016                 add.w      22(a0),d0
[00065a28] 5340                      subq.w     #1,d0
[00065a2a] 3f40 000a                 move.w     d0,10(a7)
[00065a2e] 206f 0016                 movea.l    22(a7),a0
[00065a32] 3028 0014                 move.w     20(a0),d0
[00065a36] 206f 0016                 movea.l    22(a7),a0
[00065a3a] d068 0018                 add.w      24(a0),d0
[00065a3e] 5340                      subq.w     #1,d0
[00065a40] 3f40 000c                 move.w     d0,12(a7)
[00065a44] 41ef 0006                 lea.l      6(a7),a0
[00065a48] 7201                      moveq.l    #1,d1
[00065a4a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065a50] 3029 0010                 move.w     16(a1),d0
[00065a54] 4eb9 0007 2230            jsr        vs_clip
[00065a5a] 6016                      bra.s      $00065A72
[00065a5c] 41ef 0006                 lea.l      6(a7),a0
[00065a60] 4241                      clr.w      d1
[00065a62] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065a68] 3029 0010                 move.w     16(a1),d0
[00065a6c] 4eb9 0007 2230            jsr        vs_clip
[00065a72] 206f 0016                 movea.l    22(a7),a0
[00065a76] 3f68 000a 0006            move.w     10(a0),6(a7)
[00065a7c] 206f 0016                 movea.l    22(a7),a0
[00065a80] 3f68 000c 0008            move.w     12(a0),8(a7)
[00065a86] 302f 0006                 move.w     6(a7),d0
[00065a8a] 206f 0016                 movea.l    22(a7),a0
[00065a8e] d068 000e                 add.w      14(a0),d0
[00065a92] 5340                      subq.w     #1,d0
[00065a94] 3f40 000a                 move.w     d0,10(a7)
[00065a98] 302f 0008                 move.w     8(a7),d0
[00065a9c] 206f 0016                 movea.l    22(a7),a0
[00065aa0] d068 0010                 add.w      16(a0),d0
[00065aa4] 5340                      subq.w     #1,d0
[00065aa6] 3f40 000c                 move.w     d0,12(a7)
[00065aaa] 206f 0016                 movea.l    22(a7),a0
[00065aae] 2ea8 001a                 move.l     26(a0),(a7)
[00065ab2] 206f 0016                 movea.l    22(a7),a0
[00065ab6] 3028 0006                 move.w     6(a0),d0
[00065aba] 206f 0016                 movea.l    22(a7),a0
[00065abe] 3228 0008                 move.w     8(a0),d1
[00065ac2] b340                      eor.w      d1,d0
[00065ac4] 3f40 0004                 move.w     d0,4(a7)
[00065ac8] 302f 0004                 move.w     4(a7),d0
[00065acc] 6600 010c                 bne        $00065BDA
[00065ad0] 7201                      moveq.l    #1,d1
[00065ad2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065ad8] 3028 0010                 move.w     16(a0),d0
[00065adc] 4eb9 0007 3070            jsr        vswr_mode
[00065ae2] 3017                      move.w     (a7),d0
[00065ae4] e148                      lsl.w      #8,d0
[00065ae6] e040                      asr.w      #8,d0
[00065ae8] c07c 00c0                 and.w      #$00C0,d0
[00065aec] 4a40                      tst.w      d0
[00065aee] 6708                      beq.s      $00065AF8
[00065af0] 907c 0040                 sub.w      #$0040,d0
[00065af4] 6730                      beq.s      $00065B26
[00065af6] 605c                      bra.s      $00065B54
[00065af8] 7203                      moveq.l    #3,d1
[00065afa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065b00] 3028 0010                 move.w     16(a0),d0
[00065b04] 4eb9 0007 3660            jsr        vsf_interior
[00065b0a] 3217                      move.w     (a7),d1
[00065b0c] e149                      lsl.w      #8,d1
[00065b0e] e041                      asr.w      #8,d1
[00065b10] c27c 001f                 and.w      #$001F,d1
[00065b14] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065b1a] 3028 0010                 move.w     16(a0),d0
[00065b1e] 4eb9 0007 36b4            jsr        vsf_style
[00065b24] 6068                      bra.s      $00065B8E
[00065b26] 7202                      moveq.l    #2,d1
[00065b28] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065b2e] 3028 0010                 move.w     16(a0),d0
[00065b32] 4eb9 0007 3660            jsr        vsf_interior
[00065b38] 3217                      move.w     (a7),d1
[00065b3a] e149                      lsl.w      #8,d1
[00065b3c] e041                      asr.w      #8,d1
[00065b3e] c27c 001f                 and.w      #$001F,d1
[00065b42] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065b48] 3028 0010                 move.w     16(a0),d0
[00065b4c] 4eb9 0007 36b4            jsr        vsf_style
[00065b52] 603a                      bra.s      $00065B8E
[00065b54] 7204                      moveq.l    #4,d1
[00065b56] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065b5c] 3028 0010                 move.w     16(a0),d0
[00065b60] 4eb9 0007 3660            jsr        vsf_interior
[00065b66] 7201                      moveq.l    #1,d1
[00065b68] 3017                      move.w     (a7),d0
[00065b6a] e148                      lsl.w      #8,d0
[00065b6c] e040                      asr.w      #8,d0
[00065b6e] c07c 001f                 and.w      #$001F,d0
[00065b72] e548                      lsl.w      #2,d0
[00065b74] 41f9 000e 1d06            lea.l      up,a0
[00065b7a] 2070 0000                 movea.l    0(a0,d0.w),a0
[00065b7e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065b84] 3029 0010                 move.w     16(a1),d0
[00065b88] 4eb9 0007 380e            jsr        vsf_udpat
[00065b8e] 720f                      moveq.l    #15,d1
[00065b90] c26f 0002                 and.w      2(a7),d1
[00065b94] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065b9a] 3028 0010                 move.w     16(a0),d0
[00065b9e] 4eb9 0007 3708            jsr        vsf_color
[00065ba4] 3017                      move.w     (a7),d0
[00065ba6] e148                      lsl.w      #8,d0
[00065ba8] e040                      asr.w      #8,d0
[00065baa] c07c 0020                 and.w      #$0020,d0
[00065bae] 6704                      beq.s      $00065BB4
[00065bb0] 7201                      moveq.l    #1,d1
[00065bb2] 6002                      bra.s      $00065BB6
[00065bb4] 4241                      clr.w      d1
[00065bb6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065bbc] 3028 0010                 move.w     16(a0),d0
[00065bc0] 4eb9 0007 375c            jsr        vsf_perimeter
[00065bc6] 41ef 0006                 lea.l      6(a7),a0
[00065bca] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065bd0] 3029 0010                 move.w     16(a1),d0
[00065bd4] 4eb9 0007 282e            jsr        v_bar
[00065bda] 7001                      moveq.l    #1,d0
[00065bdc] c06f 0004                 and.w      4(a7),d0
[00065be0] 660c                      bne.s      $00065BEE
[00065be2] 7001                      moveq.l    #1,d0
[00065be4] 206f 0016                 movea.l    22(a7),a0
[00065be8] c068 0008                 and.w      8(a0),d0
[00065bec] 675c                      beq.s      $00065C4A
[00065bee] 7203                      moveq.l    #3,d1
[00065bf0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065bf6] 3028 0010                 move.w     16(a0),d0
[00065bfa] 4eb9 0007 3070            jsr        vswr_mode
[00065c00] 7201                      moveq.l    #1,d1
[00065c02] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065c08] 3028 0010                 move.w     16(a0),d0
[00065c0c] 4eb9 0007 3660            jsr        vsf_interior
[00065c12] 7201                      moveq.l    #1,d1
[00065c14] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065c1a] 3028 0010                 move.w     16(a0),d0
[00065c1e] 4eb9 0007 3708            jsr        vsf_color
[00065c24] 4241                      clr.w      d1
[00065c26] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065c2c] 3028 0010                 move.w     16(a0),d0
[00065c30] 4eb9 0007 375c            jsr        vsf_perimeter
[00065c36] 41ef 0006                 lea.l      6(a7),a0
[00065c3a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065c40] 3029 0010                 move.w     16(a1),d0
[00065c44] 4eb9 0007 282e            jsr        v_bar
[00065c4a] 41ef 0006                 lea.l      6(a7),a0
[00065c4e] 4241                      clr.w      d1
[00065c50] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065c56] 3029 0010                 move.w     16(a1),d0
[00065c5a] 4eb9 0007 2230            jsr        vs_clip
[00065c60] 70fe                      moveq.l    #-2,d0
[00065c62] 206f 0016                 movea.l    22(a7),a0
[00065c66] c068 0008                 and.w      8(a0),d0
[00065c6a] 4fef 000e                 lea.l      14(a7),a7
[00065c6e] 241f                      move.l     (a7)+,d2
[00065c70] 4e75                      rts
A_arrows:
[00065c72] 2f02                      move.l     d2,-(a7)
[00065c74] 4fef ffe8                 lea.l      -24(a7),a7
[00065c78] 206f 0020                 movea.l    32(a7),a0
[00065c7c] 3028 0016                 move.w     22(a0),d0
[00065c80] 660a                      bne.s      $00065C8C
[00065c82] 206f 0020                 movea.l    32(a7),a0
[00065c86] 3028 0018                 move.w     24(a0),d0
[00065c8a] 6758                      beq.s      $00065CE4
[00065c8c] 206f 0020                 movea.l    32(a7),a0
[00065c90] 3f68 0012 0010            move.w     18(a0),16(a7)
[00065c96] 206f 0020                 movea.l    32(a7),a0
[00065c9a] 3f68 0014 0012            move.w     20(a0),18(a7)
[00065ca0] 206f 0020                 movea.l    32(a7),a0
[00065ca4] 3028 0012                 move.w     18(a0),d0
[00065ca8] 206f 0020                 movea.l    32(a7),a0
[00065cac] d068 0016                 add.w      22(a0),d0
[00065cb0] 5340                      subq.w     #1,d0
[00065cb2] 3f40 0014                 move.w     d0,20(a7)
[00065cb6] 206f 0020                 movea.l    32(a7),a0
[00065cba] 3028 0014                 move.w     20(a0),d0
[00065cbe] 206f 0020                 movea.l    32(a7),a0
[00065cc2] d068 0018                 add.w      24(a0),d0
[00065cc6] 5340                      subq.w     #1,d0
[00065cc8] 3f40 0016                 move.w     d0,22(a7)
[00065ccc] 41ef 0010                 lea.l      16(a7),a0
[00065cd0] 7201                      moveq.l    #1,d1
[00065cd2] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065cd8] 3029 0010                 move.w     16(a1),d0
[00065cdc] 4eb9 0007 2230            jsr        vs_clip
[00065ce2] 6016                      bra.s      $00065CFA
[00065ce4] 41ef 0010                 lea.l      16(a7),a0
[00065ce8] 4241                      clr.w      d1
[00065cea] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065cf0] 3029 0010                 move.w     16(a1),d0
[00065cf4] 4eb9 0007 2230            jsr        vs_clip
[00065cfa] 206f 0020                 movea.l    32(a7),a0
[00065cfe] 41e8 001a                 lea.l      26(a0),a0
[00065d02] 2f48 000a                 move.l     a0,10(a7)
[00065d06] 206f 000a                 movea.l    10(a7),a0
[00065d0a] 2010                      move.l     (a0),d0
[00065d0c] 7213                      moveq.l    #19,d1
[00065d0e] e2a0                      asr.l      d1,d0
[00065d10] c0bc 0000 0001            and.l      #$00000001,d0
[00065d16] 6706                      beq.s      $00065D1E
[00065d18] 3ebc 0001                 move.w     #$0001,(a7)
[00065d1c] 6002                      bra.s      $00065D20
[00065d1e] 4257                      clr.w      (a7)
[00065d20] 206f 0020                 movea.l    32(a7),a0
[00065d24] 3028 0006                 move.w     6(a0),d0
[00065d28] 206f 0020                 movea.l    32(a7),a0
[00065d2c] b068 0008                 cmp.w      8(a0),d0
[00065d30] 6600 0380                 bne        $000660B2
[00065d34] 7201                      moveq.l    #1,d1
[00065d36] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065d3c] 3028 0010                 move.w     16(a0),d0
[00065d40] 4eb9 0007 3070            jsr        vswr_mode
[00065d46] 206f 0020                 movea.l    32(a7),a0
[00065d4a] 3028 000e                 move.w     14(a0),d0
[00065d4e] e240                      asr.w      #1,d0
[00065d50] 3f40 0006                 move.w     d0,6(a7)
[00065d54] 206f 0020                 movea.l    32(a7),a0
[00065d58] 3028 0010                 move.w     16(a0),d0
[00065d5c] e240                      asr.w      #1,d0
[00065d5e] 3f40 0008                 move.w     d0,8(a7)
[00065d62] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065d68] 3028 0012                 move.w     18(a0),d0
[00065d6c] e240                      asr.w      #1,d0
[00065d6e] 3f40 0002                 move.w     d0,2(a7)
[00065d72] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065d78] 3028 0014                 move.w     20(a0),d0
[00065d7c] e240                      asr.w      #1,d0
[00065d7e] 3f40 0004                 move.w     d0,4(a7)
[00065d82] 206f 0020                 movea.l    32(a7),a0
[00065d86] 3028 000a                 move.w     10(a0),d0
[00065d8a] 3f40 0014                 move.w     d0,20(a7)
[00065d8e] 3f40 0010                 move.w     d0,16(a7)
[00065d92] 206f 0020                 movea.l    32(a7),a0
[00065d96] 3028 000c                 move.w     12(a0),d0
[00065d9a] 3f40 0016                 move.w     d0,22(a7)
[00065d9e] 3f40 0012                 move.w     d0,18(a7)
[00065da2] 206f 000a                 movea.l    10(a7),a0
[00065da6] 2010                      move.l     (a0),d0
[00065da8] 7218                      moveq.l    #24,d1
[00065daa] e2a0                      asr.l      d1,d0
[00065dac] c07c 0007                 and.w      #$0007,d0
[00065db0] b07c 0007                 cmp.w      #$0007,d0
[00065db4] 6200 00b6                 bhi        $00065E6C
[00065db8] d040                      add.w      d0,d0
[00065dba] 303b 0006                 move.w     $00065DC2(pc,d0.w),d0
[00065dbe] 4efb 0002                 jmp        $00065DC2(pc,d0.w)
J49:
[00065dc2] 0010                      dc.w $0010   ; $00065dd2-$00065dc2
[00065dc4] 0022                      dc.w $0022   ; $00065de4-$00065dc2
[00065dc6] 0032                      dc.w $0032   ; $00065df4-$00065dc2
[00065dc8] 0042                      dc.w $0042   ; $00065e04-$00065dc2
[00065dca] 005a                      dc.w $005a   ; $00065e1c-$00065dc2
[00065dcc] 006c                      dc.w $006c   ; $00065e2e-$00065dc2
[00065dce] 007e                      dc.w $007e   ; $00065e40-$00065dc2
[00065dd0] 0090                      dc.w $0090   ; $00065e52-$00065dc2
[00065dd2] 302f 0006                 move.w     6(a7),d0
[00065dd6] d16f 0010                 add.w      d0,16(a7)
[00065dda] 3017                      move.w     (a7),d0
[00065ddc] d16f 0012                 add.w      d0,18(a7)
[00065de0] 6000 008a                 bra        $00065E6C
[00065de4] 3017                      move.w     (a7),d0
[00065de6] d16f 0010                 add.w      d0,16(a7)
[00065dea] 3017                      move.w     (a7),d0
[00065dec] d16f 0012                 add.w      d0,18(a7)
[00065df0] 6000 007a                 bra.w      $00065E6C
[00065df4] 3017                      move.w     (a7),d0
[00065df6] d16f 0010                 add.w      d0,16(a7)
[00065dfa] 302f 0008                 move.w     8(a7),d0
[00065dfe] d16f 0012                 add.w      d0,18(a7)
[00065e02] 6068                      bra.s      $00065E6C
[00065e04] 3017                      move.w     (a7),d0
[00065e06] d16f 0010                 add.w      d0,16(a7)
[00065e0a] 70ff                      moveq.l    #-1,d0
[00065e0c] 206f 0020                 movea.l    32(a7),a0
[00065e10] d068 0010                 add.w      16(a0),d0
[00065e14] 9057                      sub.w      (a7),d0
[00065e16] d16f 0012                 add.w      d0,18(a7)
[00065e1a] 6050                      bra.s      $00065E6C
[00065e1c] 302f 0004                 move.w     4(a7),d0
[00065e20] d16f 0012                 add.w      d0,18(a7)
[00065e24] 302f 0006                 move.w     6(a7),d0
[00065e28] d16f 0010                 add.w      d0,16(a7)
[00065e2c] 603e                      bra.s      $00065E6C
[00065e2e] 302f 0002                 move.w     2(a7),d0
[00065e32] d16f 0010                 add.w      d0,16(a7)
[00065e36] 302f 0004                 move.w     4(a7),d0
[00065e3a] d16f 0012                 add.w      d0,18(a7)
[00065e3e] 602c                      bra.s      $00065E6C
[00065e40] 302f 0002                 move.w     2(a7),d0
[00065e44] d16f 0010                 add.w      d0,16(a7)
[00065e48] 302f 0008                 move.w     8(a7),d0
[00065e4c] d16f 0012                 add.w      d0,18(a7)
[00065e50] 601a                      bra.s      $00065E6C
[00065e52] 302f 0002                 move.w     2(a7),d0
[00065e56] d16f 0010                 add.w      d0,16(a7)
[00065e5a] 206f 0020                 movea.l    32(a7),a0
[00065e5e] 3028 0010                 move.w     16(a0),d0
[00065e62] 906f 0004                 sub.w      4(a7),d0
[00065e66] d16f 0012                 add.w      d0,18(a7)
[00065e6a] 4e71                      nop
[00065e6c] 206f 000a                 movea.l    10(a7),a0
[00065e70] 2010                      move.l     (a0),d0
[00065e72] 721c                      moveq.l    #28,d1
[00065e74] e2a0                      asr.l      d1,d0
[00065e76] c07c 0007                 and.w      #$0007,d0
[00065e7a] b07c 0007                 cmp.w      #$0007,d0
[00065e7e] 6200 0100                 bhi        $00065F80
[00065e82] d040                      add.w      d0,d0
[00065e84] 303b 0006                 move.w     $00065E8C(pc,d0.w),d0
[00065e88] 4efb 0002                 jmp        $00065E8C(pc,d0.w)
J50:
[00065e8c] 0010                      dc.w $0010   ; $00065e9c-$00065e8c
[00065e8e] 002c                      dc.w $002c   ; $00065eb8-$00065e8c
[00065e90] 0050                      dc.w $0050   ; $00065edc-$00065e8c
[00065e92] 006c                      dc.w $006c   ; $00065ef8-$00065e8c
[00065e94] 0084                      dc.w $0084   ; $00065f10-$00065e8c
[00065e96] 009e                      dc.w $009e   ; $00065f2a-$00065e8c
[00065e98] 00c0                      dc.w $00c0   ; $00065f4c-$00065e8c
[00065e9a] 00da                      dc.w $00da   ; $00065f66-$00065e8c
[00065e9c] 302f 0006                 move.w     6(a7),d0
[00065ea0] d16f 0014                 add.w      d0,20(a7)
[00065ea4] 70ff                      moveq.l    #-1,d0
[00065ea6] 206f 0020                 movea.l    32(a7),a0
[00065eaa] d068 0010                 add.w      16(a0),d0
[00065eae] 9057                      sub.w      (a7),d0
[00065eb0] d16f 0016                 add.w      d0,22(a7)
[00065eb4] 6000 00ca                 bra        $00065F80
[00065eb8] 70ff                      moveq.l    #-1,d0
[00065eba] 206f 0020                 movea.l    32(a7),a0
[00065ebe] d068 000e                 add.w      14(a0),d0
[00065ec2] 9057                      sub.w      (a7),d0
[00065ec4] d16f 0014                 add.w      d0,20(a7)
[00065ec8] 70ff                      moveq.l    #-1,d0
[00065eca] 206f 0020                 movea.l    32(a7),a0
[00065ece] d068 0010                 add.w      16(a0),d0
[00065ed2] 9057                      sub.w      (a7),d0
[00065ed4] d16f 0016                 add.w      d0,22(a7)
[00065ed8] 6000 00a6                 bra        $00065F80
[00065edc] 70ff                      moveq.l    #-1,d0
[00065ede] 206f 0020                 movea.l    32(a7),a0
[00065ee2] d068 000e                 add.w      14(a0),d0
[00065ee6] 9057                      sub.w      (a7),d0
[00065ee8] d16f 0014                 add.w      d0,20(a7)
[00065eec] 302f 0008                 move.w     8(a7),d0
[00065ef0] d16f 0016                 add.w      d0,22(a7)
[00065ef4] 6000 008a                 bra        $00065F80
[00065ef8] 70ff                      moveq.l    #-1,d0
[00065efa] 206f 0020                 movea.l    32(a7),a0
[00065efe] d068 000e                 add.w      14(a0),d0
[00065f02] 9057                      sub.w      (a7),d0
[00065f04] d16f 0014                 add.w      d0,20(a7)
[00065f08] 3017                      move.w     (a7),d0
[00065f0a] d16f 0016                 add.w      d0,22(a7)
[00065f0e] 6070                      bra.s      $00065F80
[00065f10] 302f 0006                 move.w     6(a7),d0
[00065f14] d16f 0014                 add.w      d0,20(a7)
[00065f18] 206f 0020                 movea.l    32(a7),a0
[00065f1c] 3028 0010                 move.w     16(a0),d0
[00065f20] 906f 0004                 sub.w      4(a7),d0
[00065f24] d16f 0016                 add.w      d0,22(a7)
[00065f28] 6056                      bra.s      $00065F80
[00065f2a] 206f 0020                 movea.l    32(a7),a0
[00065f2e] 3028 000e                 move.w     14(a0),d0
[00065f32] 906f 0002                 sub.w      2(a7),d0
[00065f36] d16f 0014                 add.w      d0,20(a7)
[00065f3a] 206f 0020                 movea.l    32(a7),a0
[00065f3e] 3028 0010                 move.w     16(a0),d0
[00065f42] 906f 0004                 sub.w      4(a7),d0
[00065f46] d16f 0016                 add.w      d0,22(a7)
[00065f4a] 6034                      bra.s      $00065F80
[00065f4c] 206f 0020                 movea.l    32(a7),a0
[00065f50] 3028 000e                 move.w     14(a0),d0
[00065f54] 906f 0002                 sub.w      2(a7),d0
[00065f58] d16f 0014                 add.w      d0,20(a7)
[00065f5c] 302f 0008                 move.w     8(a7),d0
[00065f60] d16f 0016                 add.w      d0,22(a7)
[00065f64] 601a                      bra.s      $00065F80
[00065f66] 206f 0020                 movea.l    32(a7),a0
[00065f6a] 3028 000e                 move.w     14(a0),d0
[00065f6e] 906f 0002                 sub.w      2(a7),d0
[00065f72] d16f 0014                 add.w      d0,20(a7)
[00065f76] 302f 0004                 move.w     4(a7),d0
[00065f7a] d16f 0016                 add.w      d0,22(a7)
[00065f7e] 4e71                      nop
[00065f80] 3017                      move.w     (a7),d0
[00065f82] 6714                      beq.s      $00065F98
[00065f84] 7203                      moveq.l    #3,d1
[00065f86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065f8c] 3028 0010                 move.w     16(a0),d0
[00065f90] 4eb9 0007 316a            jsr        vsl_width
[00065f96] 6012                      bra.s      $00065FAA
[00065f98] 7201                      moveq.l    #1,d1
[00065f9a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065fa0] 3028 0010                 move.w     16(a0),d0
[00065fa4] 4eb9 0007 316a            jsr        vsl_width
[00065faa] 206f 000a                 movea.l    10(a7),a0
[00065fae] 2010                      move.l     (a0),d0
[00065fb0] 7210                      moveq.l    #16,d1
[00065fb2] e2a0                      asr.l      d1,d0
[00065fb4] c07c 0007                 and.w      #$0007,d0
[00065fb8] 3f40 000e                 move.w     d0,14(a7)
[00065fbc] 0c6f 0007 000e            cmpi.w     #$0007,14(a7)
[00065fc2] 6614                      bne.s      $00065FD8
[00065fc4] 323c 5555                 move.w     #$5555,d1
[00065fc8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065fce] 3028 0010                 move.w     16(a0),d0
[00065fd2] 4eb9 0007 3118            jsr        vsl_udsty
[00065fd8] 322f 000e                 move.w     14(a7),d1
[00065fdc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065fe2] 3028 0010                 move.w     16(a0),d0
[00065fe6] 4eb9 0007 30c4            jsr        vsl_type
[00065fec] 206f 000a                 movea.l    10(a7),a0
[00065ff0] 2410                      move.l     (a0),d2
[00065ff2] 7016                      moveq.l    #22,d0
[00065ff4] e0a2                      asr.l      d0,d2
[00065ff6] c47c 0003                 and.w      #$0003,d2
[00065ffa] 206f 000a                 movea.l    10(a7),a0
[00065ffe] 2210                      move.l     (a0),d1
[00066000] 7014                      moveq.l    #20,d0
[00066002] e0a1                      asr.l      d0,d1
[00066004] c27c 0003                 and.w      #$0003,d1
[00066008] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006600e] 3028 0010                 move.w     16(a0),d0
[00066012] 4eb9 0007 3214            jsr        vsl_ends
[00066018] 206f 000a                 movea.l    10(a7),a0
[0006601c] 2010                      move.l     (a0),d0
[0006601e] c0bc 8000 0000            and.l      #$80000000,d0
[00066024] 675c                      beq.s      $00066082
[00066026] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006602c] 2068 023c                 movea.l    572(a0),a0
[00066030] 3028 000e                 move.w     14(a0),d0
[00066034] c07c 0100                 and.w      #$0100,d0
[00066038] 6648                      bne.s      $00066082
[0006603a] 526f 0010                 addq.w     #1,16(a7)
[0006603e] 526f 0014                 addq.w     #1,20(a7)
[00066042] 526f 0012                 addq.w     #1,18(a7)
[00066046] 526f 0016                 addq.w     #1,22(a7)
[0006604a] 4241                      clr.w      d1
[0006604c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066052] 3028 0010                 move.w     16(a0),d0
[00066056] 4eb9 0007 31c0            jsr        vsl_color
[0006605c] 41ef 0010                 lea.l      16(a7),a0
[00066060] 7202                      moveq.l    #2,d1
[00066062] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066068] 3029 0010                 move.w     16(a1),d0
[0006606c] 4eb9 0007 22e0            jsr        v_pline
[00066072] 536f 0010                 subq.w     #1,16(a7)
[00066076] 536f 0014                 subq.w     #1,20(a7)
[0006607a] 536f 0012                 subq.w     #1,18(a7)
[0006607e] 536f 0016                 subq.w     #1,22(a7)
[00066082] 720f                      moveq.l    #15,d1
[00066084] 206f 000a                 movea.l    10(a7),a0
[00066088] c268 0002                 and.w      2(a0),d1
[0006608c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066092] 3028 0010                 move.w     16(a0),d0
[00066096] 4eb9 0007 31c0            jsr        vsl_color
[0006609c] 41ef 0010                 lea.l      16(a7),a0
[000660a0] 7202                      moveq.l    #2,d1
[000660a2] 2279 0010 ee4e            movea.l    ACSblk,a1
[000660a8] 3029 0010                 move.w     16(a1),d0
[000660ac] 4eb9 0007 22e0            jsr        v_pline
[000660b2] 7001                      moveq.l    #1,d0
[000660b4] 206f 0020                 movea.l    32(a7),a0
[000660b8] c068 0006                 and.w      6(a0),d0
[000660bc] 660e                      bne.s      $000660CC
[000660be] 7001                      moveq.l    #1,d0
[000660c0] 206f 0020                 movea.l    32(a7),a0
[000660c4] c068 0008                 and.w      8(a0),d0
[000660c8] 6700 00bc                 beq        $00066186
[000660cc] 7001                      moveq.l    #1,d0
[000660ce] 206f 0020                 movea.l    32(a7),a0
[000660d2] d068 0012                 add.w      18(a0),d0
[000660d6] 3f40 0010                 move.w     d0,16(a7)
[000660da] 7001                      moveq.l    #1,d0
[000660dc] 206f 0020                 movea.l    32(a7),a0
[000660e0] d068 0014                 add.w      20(a0),d0
[000660e4] 3f40 0012                 move.w     d0,18(a7)
[000660e8] 206f 0020                 movea.l    32(a7),a0
[000660ec] 3028 0012                 move.w     18(a0),d0
[000660f0] 206f 0020                 movea.l    32(a7),a0
[000660f4] d068 0016                 add.w      22(a0),d0
[000660f8] 5540                      subq.w     #2,d0
[000660fa] 3f40 0014                 move.w     d0,20(a7)
[000660fe] 206f 0020                 movea.l    32(a7),a0
[00066102] 3028 0014                 move.w     20(a0),d0
[00066106] 206f 0020                 movea.l    32(a7),a0
[0006610a] d068 0018                 add.w      24(a0),d0
[0006610e] 5540                      subq.w     #2,d0
[00066110] 3f40 0016                 move.w     d0,22(a7)
[00066114] 41ef 0010                 lea.l      16(a7),a0
[00066118] 7201                      moveq.l    #1,d1
[0006611a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066120] 3029 0010                 move.w     16(a1),d0
[00066124] 4eb9 0007 2230            jsr        vs_clip
[0006612a] 7203                      moveq.l    #3,d1
[0006612c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066132] 3028 0010                 move.w     16(a0),d0
[00066136] 4eb9 0007 3070            jsr        vswr_mode
[0006613c] 7201                      moveq.l    #1,d1
[0006613e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066144] 3028 0010                 move.w     16(a0),d0
[00066148] 4eb9 0007 3660            jsr        vsf_interior
[0006614e] 7201                      moveq.l    #1,d1
[00066150] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066156] 3028 0010                 move.w     16(a0),d0
[0006615a] 4eb9 0007 3708            jsr        vsf_color
[00066160] 4241                      clr.w      d1
[00066162] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066168] 3028 0010                 move.w     16(a0),d0
[0006616c] 4eb9 0007 375c            jsr        vsf_perimeter
[00066172] 41ef 0010                 lea.l      16(a7),a0
[00066176] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006617c] 3029 0010                 move.w     16(a1),d0
[00066180] 4eb9 0007 282e            jsr        v_bar
[00066186] 4242                      clr.w      d2
[00066188] 4241                      clr.w      d1
[0006618a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066190] 3028 0010                 move.w     16(a0),d0
[00066194] 4eb9 0007 3214            jsr        vsl_ends
[0006619a] 41ef 0010                 lea.l      16(a7),a0
[0006619e] 4241                      clr.w      d1
[000661a0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000661a6] 3029 0010                 move.w     16(a1),d0
[000661aa] 4eb9 0007 2230            jsr        vs_clip
[000661b0] 3017                      move.w     (a7),d0
[000661b2] 6f0e                      ble.s      $000661C2
[000661b4] 70fe                      moveq.l    #-2,d0
[000661b6] 206f 0020                 movea.l    32(a7),a0
[000661ba] c068 0008                 and.w      8(a0),d0
[000661be] 600e                      bra.s      $000661CE
[000661c0] 600c                      bra.s      $000661CE
[000661c2] 70f6                      moveq.l    #-10,d0
[000661c4] 206f 0020                 movea.l    32(a7),a0
[000661c8] c068 0008                 and.w      8(a0),d0
[000661cc] 4e71                      nop
[000661ce] 4fef 0018                 lea.l      24(a7),a7
[000661d2] 241f                      move.l     (a7)+,d2
[000661d4] 4e75                      rts
A_select:
[000661d6] 2f02                      move.l     d2,-(a7)
[000661d8] 4fef ffe2                 lea.l      -30(a7),a7
[000661dc] 206f 0026                 movea.l    38(a7),a0
[000661e0] 3028 0016                 move.w     22(a0),d0
[000661e4] 660a                      bne.s      $000661F0
[000661e6] 206f 0026                 movea.l    38(a7),a0
[000661ea] 3028 0018                 move.w     24(a0),d0
[000661ee] 6758                      beq.s      $00066248
[000661f0] 206f 0026                 movea.l    38(a7),a0
[000661f4] 3f68 0012 0016            move.w     18(a0),22(a7)
[000661fa] 206f 0026                 movea.l    38(a7),a0
[000661fe] 3f68 0014 0018            move.w     20(a0),24(a7)
[00066204] 206f 0026                 movea.l    38(a7),a0
[00066208] 3028 0012                 move.w     18(a0),d0
[0006620c] 206f 0026                 movea.l    38(a7),a0
[00066210] d068 0016                 add.w      22(a0),d0
[00066214] 5340                      subq.w     #1,d0
[00066216] 3f40 001a                 move.w     d0,26(a7)
[0006621a] 206f 0026                 movea.l    38(a7),a0
[0006621e] 3028 0014                 move.w     20(a0),d0
[00066222] 206f 0026                 movea.l    38(a7),a0
[00066226] d068 0018                 add.w      24(a0),d0
[0006622a] 5340                      subq.w     #1,d0
[0006622c] 3f40 001c                 move.w     d0,28(a7)
[00066230] 41ef 0016                 lea.l      22(a7),a0
[00066234] 7201                      moveq.l    #1,d1
[00066236] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006623c] 3029 0010                 move.w     16(a1),d0
[00066240] 4eb9 0007 2230            jsr        vs_clip
[00066246] 6016                      bra.s      $0006625E
[00066248] 41ef 0016                 lea.l      22(a7),a0
[0006624c] 4241                      clr.w      d1
[0006624e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066254] 3029 0010                 move.w     16(a1),d0
[00066258] 4eb9 0007 2230            jsr        vs_clip
[0006625e] 206f 0026                 movea.l    38(a7),a0
[00066262] 3028 0006                 move.w     6(a0),d0
[00066266] 206f 0026                 movea.l    38(a7),a0
[0006626a] 3228 0008                 move.w     8(a0),d1
[0006626e] b340                      eor.w      d1,d0
[00066270] 3e80                      move.w     d0,(a7)
[00066272] 3017                      move.w     (a7),d0
[00066274] 6614                      bne.s      $0006628A
[00066276] 7201                      moveq.l    #1,d1
[00066278] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006627e] 3028 0010                 move.w     16(a0),d0
[00066282] 4eb9 0007 3070            jsr        vswr_mode
[00066288] 6012                      bra.s      $0006629C
[0006628a] 7203                      moveq.l    #3,d1
[0006628c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00066292] 3028 0010                 move.w     16(a0),d0
[00066296] 4eb9 0007 3070            jsr        vswr_mode
[0006629c] 7001                      moveq.l    #1,d0
[0006629e] 206f 0026                 movea.l    38(a7),a0
[000662a2] c068 0006                 and.w      6(a0),d0
[000662a6] 660e                      bne.s      $000662B6
[000662a8] 7001                      moveq.l    #1,d0
[000662aa] 206f 0026                 movea.l    38(a7),a0
[000662ae] c068 0008                 and.w      8(a0),d0
[000662b2] 6700 00be                 beq        $00066372
[000662b6] 7201                      moveq.l    #1,d1
[000662b8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000662be] 3028 0010                 move.w     16(a0),d0
[000662c2] 4eb9 0007 316a            jsr        vsl_width
[000662c8] 7201                      moveq.l    #1,d1
[000662ca] 2079 0010 ee4e            movea.l    ACSblk,a0
[000662d0] 3028 0010                 move.w     16(a0),d0
[000662d4] 4eb9 0007 31c0            jsr        vsl_color
[000662da] 4242                      clr.w      d2
[000662dc] 4241                      clr.w      d1
[000662de] 2079 0010 ee4e            movea.l    ACSblk,a0
[000662e4] 3028 0010                 move.w     16(a0),d0
[000662e8] 4eb9 0007 3214            jsr        vsl_ends
[000662ee] 7201                      moveq.l    #1,d1
[000662f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000662f6] 3028 0010                 move.w     16(a0),d0
[000662fa] 4eb9 0007 30c4            jsr        vsl_type
[00066300] 206f 0026                 movea.l    38(a7),a0
[00066304] 3028 000a                 move.w     10(a0),d0
[00066308] 3f40 0012                 move.w     d0,18(a7)
[0006630c] 3f40 000e                 move.w     d0,14(a7)
[00066310] 3f40 0002                 move.w     d0,2(a7)
[00066314] 206f 0026                 movea.l    38(a7),a0
[00066318] 3028 000c                 move.w     12(a0),d0
[0006631c] 3f40 0014                 move.w     d0,20(a7)
[00066320] 3f40 0008                 move.w     d0,8(a7)
[00066324] 3f40 0004                 move.w     d0,4(a7)
[00066328] 206f 0026                 movea.l    38(a7),a0
[0006632c] 3028 000a                 move.w     10(a0),d0
[00066330] 206f 0026                 movea.l    38(a7),a0
[00066334] d068 000e                 add.w      14(a0),d0
[00066338] 5340                      subq.w     #1,d0
[0006633a] 3f40 000a                 move.w     d0,10(a7)
[0006633e] 3f40 0006                 move.w     d0,6(a7)
[00066342] 206f 0026                 movea.l    38(a7),a0
[00066346] 3028 000c                 move.w     12(a0),d0
[0006634a] 206f 0026                 movea.l    38(a7),a0
[0006634e] d068 0010                 add.w      16(a0),d0
[00066352] 5340                      subq.w     #1,d0
[00066354] 3f40 0010                 move.w     d0,16(a7)
[00066358] 3f40 000c                 move.w     d0,12(a7)
[0006635c] 41ef 0002                 lea.l      2(a7),a0
[00066360] 7205                      moveq.l    #5,d1
[00066362] 2279 0010 ee4e            movea.l    ACSblk,a1
[00066368] 3029 0010                 move.w     16(a1),d0
[0006636c] 4eb9 0007 22e0            jsr        v_pline
[00066372] 41ef 0016                 lea.l      22(a7),a0
[00066376] 4241                      clr.w      d1
[00066378] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006637e] 3029 0010                 move.w     16(a1),d0
[00066382] 4eb9 0007 2230            jsr        vs_clip
[00066388] 70fe                      moveq.l    #-2,d0
[0006638a] 206f 0026                 movea.l    38(a7),a0
[0006638e] c068 0008                 and.w      8(a0),d0
[00066392] 4fef 001e                 lea.l      30(a7),a7
[00066396] 241f                      move.l     (a7)+,d2
[00066398] 4e75                      rts
