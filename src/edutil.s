set_flag:
[000158a2] 5d4f                      subq.w     #6,a7
[000158a4] 3f40 0004                 move.w     d0,4(a7)
[000158a8] 2e88                      move.l     a0,(a7)
[000158aa] 302f 0004                 move.w     4(a7),d0
[000158ae] 670a                      beq.s      $000158BA
[000158b0] 2057                      movea.l    (a7),a0
[000158b2] 0068 0001 000a            ori.w      #$0001,10(a0)
[000158b8] 6008                      bra.s      $000158C2
[000158ba] 2057                      movea.l    (a7),a0
[000158bc] 0268 fffe 000a            andi.w     #$FFFE,10(a0)
[000158c2] 5c4f                      addq.w     #6,a7
[000158c4] 4e75                      rts
mod_ref:
[000158c6] 4fef fff2                 lea.l      -14(a7),a7
[000158ca] 2f48 000a                 move.l     a0,10(a7)
[000158ce] 2f49 0006                 move.l     a1,6(a7)
[000158d2] 3f40 0004                 move.w     d0,4(a7)
[000158d6] 206f 0006                 movea.l    6(a7),a0
[000158da] 2e90                      move.l     (a0),(a7)
[000158dc] 206f 0012                 movea.l    18(a7),a0
[000158e0] 1010                      move.b     (a0),d0
[000158e2] 671a                      beq.s      $000158FE
[000158e4] 302f 0004                 move.w     4(a7),d0
[000158e8] 226f 0012                 movea.l    18(a7),a1
[000158ec] 206f 000a                 movea.l    10(a7),a0
[000158f0] 4eb9 0003 5de0            jsr        dup_ref
[000158f6] 226f 0006                 movea.l    6(a7),a1
[000158fa] 2288                      move.l     a0,(a1)
[000158fc] 6006                      bra.s      $00015904
[000158fe] 206f 0006                 movea.l    6(a7),a0
[00015902] 4290                      clr.l      (a0)
[00015904] 2017                      move.l     (a7),d0
[00015906] 670c                      beq.s      $00015914
[00015908] 2257                      movea.l    (a7),a1
[0001590a] 206f 000a                 movea.l    10(a7),a0
[0001590e] 4eb9 0003 5dae            jsr        del_ref
[00015914] 4fef 000e                 lea.l      14(a7),a7
[00015918] 4e75                      rts
set_ref:
[0001591a] 514f                      subq.w     #8,a7
[0001591c] 2f48 0004                 move.l     a0,4(a7)
[00015920] 2e89                      move.l     a1,(a7)
[00015922] 202f 0004                 move.l     4(a7),d0
[00015926] 6606                      bne.s      $0001592E
[00015928] 2057                      movea.l    (a7),a0
[0001592a] 4210                      clr.b      (a0)
[0001592c] 6010                      bra.s      $0001593E
[0001592e] 226f 0004                 movea.l    4(a7),a1
[00015932] 43e9 0016                 lea.l      22(a1),a1
[00015936] 2057                      movea.l    (a7),a0
[00015938] 4eb9 0008 2f0c            jsr        strcpy
[0001593e] 504f                      addq.w     #8,a7
[00015940] 4e75                      rts
set_val:
[00015942] 514f                      subq.w     #8,a7
[00015944] 2f48 0004                 move.l     a0,4(a7)
[00015948] 2e89                      move.l     a1,(a7)
[0001594a] 202f 0004                 move.l     4(a7),d0
[0001594e] 6606                      bne.s      $00015956
[00015950] 2057                      movea.l    (a7),a0
[00015952] 4210                      clr.b      (a0)
[00015954] 6010                      bra.s      $00015966
[00015956] 206f 0004                 movea.l    4(a7),a0
[0001595a] 2268 0004                 movea.l    4(a0),a1
[0001595e] 2057                      movea.l    (a7),a0
[00015960] 4eb9 0008 2f0c            jsr        strcpy
[00015966] 504f                      addq.w     #8,a7
[00015968] 4e75                      rts
A_rubberbox:
[0001596a] 2f0a                      move.l     a2,-(a7)
[0001596c] 4fef ffaa                 lea.l      -86(a7),a7
[00015970] 3f40 0054                 move.w     d0,84(a7)
[00015974] 3f41 0052                 move.w     d1,82(a7)
[00015978] 3f42 0050                 move.w     d2,80(a7)
[0001597c] 2f48 004c                 move.l     a0,76(a7)
[00015980] 2f49 0048                 move.l     a1,72(a7)
[00015984] 41f9 000a 7d22            lea.l      INFO_OB_WH,a0
[0001598a] 4eb9 0004 f064            jsr        Aob_create
[00015990] 2f48 0010                 move.l     a0,16(a7)
[00015994] 6700 00f2                 beq        $00015A88
[00015998] 206f 0010                 movea.l    16(a7),a0
[0001599c] 4eb9 0004 fbdc            jsr        Aob_fix
[000159a2] 302f 0054                 move.w     84(a7),d0
[000159a6] 206f 0010                 movea.l    16(a7),a0
[000159aa] 9068 0014                 sub.w      20(a0),d0
[000159ae] 206f 0010                 movea.l    16(a7),a0
[000159b2] 3140 0010                 move.w     d0,16(a0)
[000159b6] 302f 0052                 move.w     82(a7),d0
[000159ba] 206f 0010                 movea.l    16(a7),a0
[000159be] 9068 0016                 sub.w      22(a0),d0
[000159c2] 206f 0010                 movea.l    16(a7),a0
[000159c6] 3140 0012                 move.w     d0,18(a0)
[000159ca] 206f 0010                 movea.l    16(a7),a0
[000159ce] 3028 0010                 move.w     16(a0),d0
[000159d2] 6b0a                      bmi.s      $000159DE
[000159d4] 206f 0010                 movea.l    16(a7),a0
[000159d8] 3028 0012                 move.w     18(a0),d0
[000159dc] 6a12                      bpl.s      $000159F0
[000159de] 206f 0010                 movea.l    16(a7),a0
[000159e2] 4eb9 0004 f20a            jsr        Aob_delete
[000159e8] 42af 0010                 clr.l      16(a7)
[000159ec] 6000 009a                 bra        $00015A88
[000159f0] 206f 0010                 movea.l    16(a7),a0
[000159f4] 3228 0016                 move.w     22(a0),d1
[000159f8] 206f 0010                 movea.l    16(a7),a0
[000159fc] 3028 0014                 move.w     20(a0),d0
[00015a00] 4eb9 0005 4b6e            jsr        Abp_create
[00015a06] 2f48 000c                 move.l     a0,12(a7)
[00015a0a] 677c                      beq.s      $00015A88
[00015a0c] 206f 0010                 movea.l    16(a7),a0
[00015a10] 3028 0010                 move.w     16(a0),d0
[00015a14] 3f40 0014                 move.w     d0,20(a7)
[00015a18] 72ff                      moveq.l    #-1,d1
[00015a1a] 206f 0010                 movea.l    16(a7),a0
[00015a1e] d268 0014                 add.w      20(a0),d1
[00015a22] 3f41 0020                 move.w     d1,32(a7)
[00015a26] d041                      add.w      d1,d0
[00015a28] 3f40 0018                 move.w     d0,24(a7)
[00015a2c] 206f 0010                 movea.l    16(a7),a0
[00015a30] 3028 0012                 move.w     18(a0),d0
[00015a34] 3f40 0016                 move.w     d0,22(a7)
[00015a38] 72ff                      moveq.l    #-1,d1
[00015a3a] 206f 0010                 movea.l    16(a7),a0
[00015a3e] d268 0016                 add.w      22(a0),d1
[00015a42] 3f41 0022                 move.w     d1,34(a7)
[00015a46] d041                      add.w      d1,d0
[00015a48] 3f40 001a                 move.w     d0,26(a7)
[00015a4c] 4240                      clr.w      d0
[00015a4e] 3f40 001e                 move.w     d0,30(a7)
[00015a52] 3f40 001c                 move.w     d0,28(a7)
[00015a56] 4eb9 0004 ef40            jsr        Amo_hide
[00015a5c] 2f2f 000c                 move.l     12(a7),-(a7)
[00015a60] 2279 0010 ee4e            movea.l    ACSblk,a1
[00015a66] 43e9 026a                 lea.l      618(a1),a1
[00015a6a] 41ef 0018                 lea.l      24(a7),a0
[00015a6e] 7203                      moveq.l    #3,d1
[00015a70] 2479 0010 ee4e            movea.l    ACSblk,a2
[00015a76] 302a 0010                 move.w     16(a2),d0
[00015a7a] 4eb9 0007 489e            jsr        vro_cpyfm
[00015a80] 584f                      addq.w     #4,a7
[00015a82] 4eb9 0004 ef66            jsr        Amo_show
[00015a88] 3039 0008 4808            move.w     imagesnap,d0
[00015a8e] e240                      asr.w      #1,d0
[00015a90] 3f40 003a                 move.w     d0,58(a7)
[00015a94] 302f 003a                 move.w     58(a7),d0
[00015a98] 6606                      bne.s      $00015AA0
[00015a9a] 3f7c 0001 003a            move.w     #$0001,58(a7)
[00015aa0] 70ff                      moveq.l    #-1,d0
[00015aa2] d079 0008 4808            add.w      imagesnap,d0
[00015aa8] 4640                      not.w      d0
[00015aaa] 3f40 0038                 move.w     d0,56(a7)
[00015aae] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015ab4] 2068 023c                 movea.l    572(a0),a0
[00015ab8] 41e8 0044                 lea.l      68(a0),a0
[00015abc] 4eb9 0004 ee3c            jsr        Amo_new
[00015ac2] 4240                      clr.w      d0
[00015ac4] 3f40 0026                 move.w     d0,38(a7)
[00015ac8] 3f40 0024                 move.w     d0,36(a7)
[00015acc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015ad2] 3028 0008                 move.w     8(a0),d0
[00015ad6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015adc] d068 000c                 add.w      12(a0),d0
[00015ae0] 3f40 0028                 move.w     d0,40(a7)
[00015ae4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015aea] 3028 000a                 move.w     10(a0),d0
[00015aee] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015af4] d068 000e                 add.w      14(a0),d0
[00015af8] 3f40 002a                 move.w     d0,42(a7)
[00015afc] 41ef 0024                 lea.l      36(a7),a0
[00015b00] 7201                      moveq.l    #1,d1
[00015b02] 2279 0010 ee4e            movea.l    ACSblk,a1
[00015b08] 3029 0010                 move.w     16(a1),d0
[00015b0c] 4eb9 0007 2230            jsr        vs_clip
[00015b12] 302f 0054                 move.w     84(a7),d0
[00015b16] d06f 0060                 add.w      96(a7),d0
[00015b1a] 5340                      subq.w     #1,d0
[00015b1c] 3f40 0042                 move.w     d0,66(a7)
[00015b20] 302f 0052                 move.w     82(a7),d0
[00015b24] d06f 0062                 add.w      98(a7),d0
[00015b28] 5340                      subq.w     #1,d0
[00015b2a] 3f40 0040                 move.w     d0,64(a7)
[00015b2e] 302f 0054                 move.w     84(a7),d0
[00015b32] d06f 0050                 add.w      80(a7),d0
[00015b36] 5340                      subq.w     #1,d0
[00015b38] 3f40 0046                 move.w     d0,70(a7)
[00015b3c] 302f 0052                 move.w     82(a7),d0
[00015b40] d06f 005e                 add.w      94(a7),d0
[00015b44] 5340                      subq.w     #1,d0
[00015b46] 3f40 0044                 move.w     d0,68(a7)
[00015b4a] 2f39 000e 692a            move.l     _globl,-(a7)
[00015b50] 486f 0040                 pea.l      64(a7)
[00015b54] 486f 0046                 pea.l      70(a7)
[00015b58] 43ef 0038                 lea.l      56(a7),a1
[00015b5c] 41ef 003a                 lea.l      58(a7),a0
[00015b60] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00015b66] 4fef 000c                 lea.l      12(a7),a7
[00015b6a] 6000 049a                 bra        $00016006
[00015b6e] 302f 002e                 move.w     46(a7),d0
[00015b72] 906f 0054                 sub.w      84(a7),d0
[00015b76] d06f 003a                 add.w      58(a7),d0
[00015b7a] c06f 0038                 and.w      56(a7),d0
[00015b7e] d06f 0054                 add.w      84(a7),d0
[00015b82] 5340                      subq.w     #1,d0
[00015b84] 3f40 002e                 move.w     d0,46(a7)
[00015b88] 302f 002c                 move.w     44(a7),d0
[00015b8c] 906f 0052                 sub.w      82(a7),d0
[00015b90] d06f 003a                 add.w      58(a7),d0
[00015b94] c06f 0038                 and.w      56(a7),d0
[00015b98] d06f 0052                 add.w      82(a7),d0
[00015b9c] 5340                      subq.w     #1,d0
[00015b9e] 3f40 002c                 move.w     d0,44(a7)
[00015ba2] 3f6f 002e 0032            move.w     46(a7),50(a7)
[00015ba8] 3f6f 002c 0030            move.w     44(a7),48(a7)
[00015bae] 302f 0032                 move.w     50(a7),d0
[00015bb2] b06f 0042                 cmp.w      66(a7),d0
[00015bb6] 6f06                      ble.s      $00015BBE
[00015bb8] 3f6f 0042 0032            move.w     66(a7),50(a7)
[00015bbe] 302f 0030                 move.w     48(a7),d0
[00015bc2] b06f 0040                 cmp.w      64(a7),d0
[00015bc6] 6f06                      ble.s      $00015BCE
[00015bc8] 3f6f 0040 0030            move.w     64(a7),48(a7)
[00015bce] 302f 0032                 move.w     50(a7),d0
[00015bd2] b06f 0046                 cmp.w      70(a7),d0
[00015bd6] 6c06                      bge.s      $00015BDE
[00015bd8] 3f6f 0046 0032            move.w     70(a7),50(a7)
[00015bde] 302f 0030                 move.w     48(a7),d0
[00015be2] b06f 0044                 cmp.w      68(a7),d0
[00015be6] 6c06                      bge.s      $00015BEE
[00015be8] 3f6f 0044 0030            move.w     68(a7),48(a7)
[00015bee] 7001                      moveq.l    #1,d0
[00015bf0] c06f 003e                 and.w      62(a7),d0
[00015bf4] 670a                      beq.s      $00015C00
[00015bf6] 7002                      moveq.l    #2,d0
[00015bf8] c06f 003e                 and.w      62(a7),d0
[00015bfc] 6700 018e                 beq        $00015D8C
[00015c00] 41ef 0024                 lea.l      36(a7),a0
[00015c04] 4241                      clr.w      d1
[00015c06] 2279 0010 ee4e            movea.l    ACSblk,a1
[00015c0c] 3029 0010                 move.w     16(a1),d0
[00015c10] 4eb9 0007 2230            jsr        vs_clip
[00015c16] 302f 0032                 move.w     50(a7),d0
[00015c1a] 906f 0054                 sub.w      84(a7),d0
[00015c1e] 5240                      addq.w     #1,d0
[00015c20] 206f 004c                 movea.l    76(a7),a0
[00015c24] 3080                      move.w     d0,(a0)
[00015c26] 302f 0030                 move.w     48(a7),d0
[00015c2a] 906f 0052                 sub.w      82(a7),d0
[00015c2e] 5240                      addq.w     #1,d0
[00015c30] 206f 0048                 movea.l    72(a7),a0
[00015c34] 3080                      move.w     d0,(a0)
[00015c36] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015c3c] 2068 023c                 movea.l    572(a0),a0
[00015c40] 41e8 0038                 lea.l      56(a0),a0
[00015c44] 4eb9 0004 ee3c            jsr        Amo_new
[00015c4a] 202f 0010                 move.l     16(a7),d0
[00015c4e] 6700 0120                 beq        $00015D70
[00015c52] 202f 000c                 move.l     12(a7),d0
[00015c56] 6700 008c                 beq        $00015CE4
[00015c5a] 206f 0010                 movea.l    16(a7),a0
[00015c5e] 3028 0010                 move.w     16(a0),d0
[00015c62] 3f40 001c                 move.w     d0,28(a7)
[00015c66] 72ff                      moveq.l    #-1,d1
[00015c68] 206f 0010                 movea.l    16(a7),a0
[00015c6c] d268 0014                 add.w      20(a0),d1
[00015c70] 3f41 0018                 move.w     d1,24(a7)
[00015c74] d041                      add.w      d1,d0
[00015c76] 3f40 0020                 move.w     d0,32(a7)
[00015c7a] 206f 0010                 movea.l    16(a7),a0
[00015c7e] 3028 0012                 move.w     18(a0),d0
[00015c82] 3f40 001e                 move.w     d0,30(a7)
[00015c86] 72ff                      moveq.l    #-1,d1
[00015c88] 206f 0010                 movea.l    16(a7),a0
[00015c8c] d268 0016                 add.w      22(a0),d1
[00015c90] 3f41 001a                 move.w     d1,26(a7)
[00015c94] d041                      add.w      d1,d0
[00015c96] 3f40 0022                 move.w     d0,34(a7)
[00015c9a] 4240                      clr.w      d0
[00015c9c] 3f40 0016                 move.w     d0,22(a7)
[00015ca0] 3f40 0014                 move.w     d0,20(a7)
[00015ca4] 4eb9 0004 ef40            jsr        Amo_hide
[00015caa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015cb0] 4868 026a                 pea.l      618(a0)
[00015cb4] 226f 0010                 movea.l    16(a7),a1
[00015cb8] 41ef 0018                 lea.l      24(a7),a0
[00015cbc] 7203                      moveq.l    #3,d1
[00015cbe] 2479 0010 ee4e            movea.l    ACSblk,a2
[00015cc4] 302a 0010                 move.w     16(a2),d0
[00015cc8] 4eb9 0007 489e            jsr        vro_cpyfm
[00015cce] 584f                      addq.w     #4,a7
[00015cd0] 4eb9 0004 ef66            jsr        Amo_show
[00015cd6] 206f 000c                 movea.l    12(a7),a0
[00015cda] 4eb9 0005 4c04            jsr        Abp_delete
[00015ce0] 6000 0084                 bra        $00015D66
[00015ce4] 206f 0010                 movea.l    16(a7),a0
[00015ce8] 3028 0012                 move.w     18(a0),d0
[00015cec] 206f 0010                 movea.l    16(a7),a0
[00015cf0] d068 0016                 add.w      22(a0),d0
[00015cf4] 5340                      subq.w     #1,d0
[00015cf6] 3f00                      move.w     d0,-(a7)
[00015cf8] 206f 0012                 movea.l    18(a7),a0
[00015cfc] 3028 0010                 move.w     16(a0),d0
[00015d00] 206f 0012                 movea.l    18(a7),a0
[00015d04] d068 0014                 add.w      20(a0),d0
[00015d08] 5340                      subq.w     #1,d0
[00015d0a] 3f00                      move.w     d0,-(a7)
[00015d0c] 206f 0014                 movea.l    20(a7),a0
[00015d10] 3f28 0012                 move.w     18(a0),-(a7)
[00015d14] 206f 0016                 movea.l    22(a7),a0
[00015d18] 3f28 0010                 move.w     16(a0),-(a7)
[00015d1c] 206f 0018                 movea.l    24(a7),a0
[00015d20] 3028 0012                 move.w     18(a0),d0
[00015d24] 206f 0018                 movea.l    24(a7),a0
[00015d28] d068 0016                 add.w      22(a0),d0
[00015d2c] 5340                      subq.w     #1,d0
[00015d2e] 3f00                      move.w     d0,-(a7)
[00015d30] 206f 001a                 movea.l    26(a7),a0
[00015d34] 3028 0010                 move.w     16(a0),d0
[00015d38] 206f 001a                 movea.l    26(a7),a0
[00015d3c] d068 0014                 add.w      20(a0),d0
[00015d40] 5340                      subq.w     #1,d0
[00015d42] 3f00                      move.w     d0,-(a7)
[00015d44] 2079 000e 692a            movea.l    _globl,a0
[00015d4a] 226f 001c                 movea.l    28(a7),a1
[00015d4e] 3429 0012                 move.w     18(a1),d2
[00015d52] 226f 001c                 movea.l    28(a7),a1
[00015d56] 3229 0010                 move.w     16(a1),d1
[00015d5a] 7003                      moveq.l    #3,d0
[00015d5c] 4eb9 0007 a0b4            jsr        mt_form_dial
[00015d62] 4fef 000c                 lea.l      12(a7),a7
[00015d66] 206f 0010                 movea.l    16(a7),a0
[00015d6a] 4eb9 0004 f20a            jsr        Aob_delete
[00015d70] 4eb9 0005 0c80            jsr        Aev_release
[00015d76] 7002                      moveq.l    #2,d0
[00015d78] c06f 003e                 and.w      62(a7),d0
[00015d7c] 6708                      beq.s      $00015D86
[00015d7e] 4240                      clr.w      d0
[00015d80] 6000 0288                 bra        $0001600A
[00015d84] 6006                      bra.s      $00015D8C
[00015d86] 7001                      moveq.l    #1,d0
[00015d88] 6000 0280                 bra        $0001600A
[00015d8c] 2279 000e 692a            movea.l    _globl,a1
[00015d92] 91c8                      suba.l     a0,a0
[00015d94] 303c 0100                 move.w     #$0100,d0
[00015d98] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00015d9e] 7203                      moveq.l    #3,d1
[00015da0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015da6] 3028 0010                 move.w     16(a0),d0
[00015daa] 4eb9 0007 3070            jsr        vswr_mode
[00015db0] 7201                      moveq.l    #1,d1
[00015db2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015db8] 3028 0010                 move.w     16(a0),d0
[00015dbc] 4eb9 0007 31c0            jsr        vsl_color
[00015dc2] 342f 0052                 move.w     82(a7),d2
[00015dc6] 322f 0032                 move.w     50(a7),d1
[00015dca] 302f 0054                 move.w     84(a7),d0
[00015dce] 4eb9 0004 7518            jsr        dotted_xline
[00015dd4] 342f 0030                 move.w     48(a7),d2
[00015dd8] 322f 0032                 move.w     50(a7),d1
[00015ddc] 302f 0054                 move.w     84(a7),d0
[00015de0] 4eb9 0004 7518            jsr        dotted_xline
[00015de6] 342f 0054                 move.w     84(a7),d2
[00015dea] 322f 0030                 move.w     48(a7),d1
[00015dee] 302f 0052                 move.w     82(a7),d0
[00015df2] 4eb9 0004 75e6            jsr        dotted_yline
[00015df8] 342f 0032                 move.w     50(a7),d2
[00015dfc] 322f 0030                 move.w     48(a7),d1
[00015e00] 302f 0052                 move.w     82(a7),d0
[00015e04] 4eb9 0004 75e6            jsr        dotted_yline
[00015e0a] 202f 0010                 move.l     16(a7),d0
[00015e0e] 6700 00d8                 beq        $00015EE8
[00015e12] 302f 0030                 move.w     48(a7),d0
[00015e16] 906f 0052                 sub.w      82(a7),d0
[00015e1a] 5240                      addq.w     #1,d0
[00015e1c] 48c0                      ext.l      d0
[00015e1e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015e24] 81e8 0014                 divs.w     20(a0),d0
[00015e28] 3f00                      move.w     d0,-(a7)
[00015e2a] 302f 0034                 move.w     52(a7),d0
[00015e2e] 906f 0056                 sub.w      86(a7),d0
[00015e32] 5240                      addq.w     #1,d0
[00015e34] 48c0                      ext.l      d0
[00015e36] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015e3c] 81e8 0012                 divs.w     18(a0),d0
[00015e40] 3f00                      move.w     d0,-(a7)
[00015e42] 43f9 000a 46f8            lea.l      $000A46F8,a1
[00015e48] 41ef 0004                 lea.l      4(a7),a0
[00015e4c] 4eb9 0008 15ac            jsr        sprintf
[00015e52] 584f                      addq.w     #4,a7
[00015e54] 43d7                      lea.l      (a7),a1
[00015e56] 7001                      moveq.l    #1,d0
[00015e58] 206f 0010                 movea.l    16(a7),a0
[00015e5c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00015e62] 302f 0030                 move.w     48(a7),d0
[00015e66] 906f 0052                 sub.w      82(a7),d0
[00015e6a] 5240                      addq.w     #1,d0
[00015e6c] 3f00                      move.w     d0,-(a7)
[00015e6e] 302f 0034                 move.w     52(a7),d0
[00015e72] 906f 0056                 sub.w      86(a7),d0
[00015e76] 5240                      addq.w     #1,d0
[00015e78] 3f00                      move.w     d0,-(a7)
[00015e7a] 43f9 000a 46fe            lea.l      $000A46FE,a1
[00015e80] 41ef 0004                 lea.l      4(a7),a0
[00015e84] 4eb9 0008 15ac            jsr        sprintf
[00015e8a] 584f                      addq.w     #4,a7
[00015e8c] 43d7                      lea.l      (a7),a1
[00015e8e] 7002                      moveq.l    #2,d0
[00015e90] 206f 0010                 movea.l    16(a7),a0
[00015e94] 4eb9 0005 0fd8            jsr        Aob_puttext
[00015e9a] 206f 0010                 movea.l    16(a7),a0
[00015e9e] 3028 0012                 move.w     18(a0),d0
[00015ea2] 206f 0010                 movea.l    16(a7),a0
[00015ea6] d068 0016                 add.w      22(a0),d0
[00015eaa] 5340                      subq.w     #1,d0
[00015eac] 3f00                      move.w     d0,-(a7)
[00015eae] 206f 0012                 movea.l    18(a7),a0
[00015eb2] 3028 0010                 move.w     16(a0),d0
[00015eb6] 206f 0012                 movea.l    18(a7),a0
[00015eba] d068 0014                 add.w      20(a0),d0
[00015ebe] 5340                      subq.w     #1,d0
[00015ec0] 3f00                      move.w     d0,-(a7)
[00015ec2] 206f 0014                 movea.l    20(a7),a0
[00015ec6] 3f28 0012                 move.w     18(a0),-(a7)
[00015eca] 2279 000e 692a            movea.l    _globl,a1
[00015ed0] 206f 0016                 movea.l    22(a7),a0
[00015ed4] 3428 0010                 move.w     16(a0),d2
[00015ed8] 7202                      moveq.l    #2,d1
[00015eda] 4240                      clr.w      d0
[00015edc] 206f 0016                 movea.l    22(a7),a0
[00015ee0] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00015ee6] 5c4f                      addq.w     #6,a7
[00015ee8] 2279 000e 692a            movea.l    _globl,a1
[00015eee] 91c8                      suba.l     a0,a0
[00015ef0] 303c 0101                 move.w     #$0101,d0
[00015ef4] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00015efa] 606c                      bra.s      $00015F68
[00015efc] 2f39 000e 692a            move.l     _globl,-(a7)
[00015f02] 486f 0040                 pea.l      64(a7)
[00015f06] 486f 0046                 pea.l      70(a7)
[00015f0a] 43ef 0040                 lea.l      64(a7),a1
[00015f0e] 41ef 0042                 lea.l      66(a7),a0
[00015f12] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00015f18] 4fef 000c                 lea.l      12(a7),a7
[00015f1c] 7001                      moveq.l    #1,d0
[00015f1e] c06f 003e                 and.w      62(a7),d0
[00015f22] 6708                      beq.s      $00015F2C
[00015f24] 7002                      moveq.l    #2,d0
[00015f26] c06f 003e                 and.w      62(a7),d0
[00015f2a] 6702                      beq.s      $00015F2E
[00015f2c] 603c                      bra.s      $00015F6A
[00015f2e] 302f 0036                 move.w     54(a7),d0
[00015f32] 906f 002e                 sub.w      46(a7),d0
[00015f36] b06f 003a                 cmp.w      58(a7),d0
[00015f3a] 6e2a                      bgt.s      $00015F66
[00015f3c] 302f 002e                 move.w     46(a7),d0
[00015f40] 906f 0036                 sub.w      54(a7),d0
[00015f44] b06f 003a                 cmp.w      58(a7),d0
[00015f48] 6e1c                      bgt.s      $00015F66
[00015f4a] 302f 0034                 move.w     52(a7),d0
[00015f4e] 906f 002c                 sub.w      44(a7),d0
[00015f52] b06f 003a                 cmp.w      58(a7),d0
[00015f56] 6e0e                      bgt.s      $00015F66
[00015f58] 302f 002c                 move.w     44(a7),d0
[00015f5c] 906f 0034                 sub.w      52(a7),d0
[00015f60] b06f 003a                 cmp.w      58(a7),d0
[00015f64] 6f02                      ble.s      $00015F68
[00015f66] 6002                      bra.s      $00015F6A
[00015f68] 6092                      bra.s      $00015EFC
[00015f6a] 2279 000e 692a            movea.l    _globl,a1
[00015f70] 91c8                      suba.l     a0,a0
[00015f72] 303c 0100                 move.w     #$0100,d0
[00015f76] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00015f7c] 7203                      moveq.l    #3,d1
[00015f7e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015f84] 3028 0010                 move.w     16(a0),d0
[00015f88] 4eb9 0007 3070            jsr        vswr_mode
[00015f8e] 7201                      moveq.l    #1,d1
[00015f90] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015f96] 3028 0010                 move.w     16(a0),d0
[00015f9a] 4eb9 0007 31c0            jsr        vsl_color
[00015fa0] 342f 0052                 move.w     82(a7),d2
[00015fa4] 322f 0032                 move.w     50(a7),d1
[00015fa8] 302f 0054                 move.w     84(a7),d0
[00015fac] 4eb9 0004 7518            jsr        dotted_xline
[00015fb2] 342f 0030                 move.w     48(a7),d2
[00015fb6] 322f 0032                 move.w     50(a7),d1
[00015fba] 302f 0054                 move.w     84(a7),d0
[00015fbe] 4eb9 0004 7518            jsr        dotted_xline
[00015fc4] 342f 0054                 move.w     84(a7),d2
[00015fc8] 322f 0030                 move.w     48(a7),d1
[00015fcc] 302f 0052                 move.w     82(a7),d0
[00015fd0] 4eb9 0004 75e6            jsr        dotted_yline
[00015fd6] 342f 0032                 move.w     50(a7),d2
[00015fda] 322f 0030                 move.w     48(a7),d1
[00015fde] 302f 0052                 move.w     82(a7),d0
[00015fe2] 4eb9 0004 75e6            jsr        dotted_yline
[00015fe8] 2279 000e 692a            movea.l    _globl,a1
[00015fee] 91c8                      suba.l     a0,a0
[00015ff0] 303c 0101                 move.w     #$0101,d0
[00015ff4] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00015ffa] 3f6f 0036 002e            move.w     54(a7),46(a7)
[00016000] 3f6f 0034 002c            move.w     52(a7),44(a7)
[00016006] 6000 fb66                 bra        $00015B6E
[0001600a] 4fef 0056                 lea.l      86(a7),a7
[0001600e] 245f                      movea.l    (a7)+,a2
[00016010] 4e75                      rts
view_grow:
[00016012] 2f0a                      move.l     a2,-(a7)
[00016014] 594f                      subq.w     #4,a7
[00016016] 2e88                      move.l     a0,(a7)
[00016018] 7002                      moveq.l    #2,d0
[0001601a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00016020] 2068 023c                 movea.l    572(a0),a0
[00016024] c068 000e                 and.w      14(a0),d0
[00016028] 6736                      beq.s      $00016060
[0001602a] 2057                      movea.l    (a7),a0
[0001602c] 3f28 002a                 move.w     42(a0),-(a7)
[00016030] 206f 0002                 movea.l    2(a7),a0
[00016034] 3f28 0028                 move.w     40(a0),-(a7)
[00016038] 206f 0004                 movea.l    4(a7),a0
[0001603c] 3f28 0026                 move.w     38(a0),-(a7)
[00016040] 206f 0006                 movea.l    6(a7),a0
[00016044] 3f28 0024                 move.w     36(a0),-(a7)
[00016048] 4267                      clr.w      -(a7)
[0001604a] 2079 000e 692a            movea.l    _globl,a0
[00016050] 4242                      clr.w      d2
[00016052] 4241                      clr.w      d1
[00016054] 4240                      clr.w      d0
[00016056] 4eb9 0007 a834            jsr        mt_graf_growbox
[0001605c] 4fef 000a                 lea.l      10(a7),a7
[00016060] 2057                      movea.l    (a7),a0
[00016062] 0068 0010 0056            ori.w      #$0010,86(a0)
[00016068] 2257                      movea.l    (a7),a1
[0001606a] 43e9 0024                 lea.l      36(a1),a1
[0001606e] 2057                      movea.l    (a7),a0
[00016070] 2457                      movea.l    (a7),a2
[00016072] 246a 0086                 movea.l    134(a2),a2
[00016076] 4e92                      jsr        (a2)
[00016078] 584f                      addq.w     #4,a7
[0001607a] 245f                      movea.l    (a7)+,a2
[0001607c] 4e75                      rts
view_shrink:
[0001607e] 2f0a                      move.l     a2,-(a7)
[00016080] 594f                      subq.w     #4,a7
[00016082] 2e88                      move.l     a0,(a7)
[00016084] 7002                      moveq.l    #2,d0
[00016086] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001608c] 2068 023c                 movea.l    572(a0),a0
[00016090] c068 000e                 and.w      14(a0),d0
[00016094] 6736                      beq.s      $000160CC
[00016096] 2057                      movea.l    (a7),a0
[00016098] 3f28 002a                 move.w     42(a0),-(a7)
[0001609c] 206f 0002                 movea.l    2(a7),a0
[000160a0] 3f28 0028                 move.w     40(a0),-(a7)
[000160a4] 206f 0004                 movea.l    4(a7),a0
[000160a8] 3f28 0026                 move.w     38(a0),-(a7)
[000160ac] 206f 0006                 movea.l    6(a7),a0
[000160b0] 3f28 0024                 move.w     36(a0),-(a7)
[000160b4] 4267                      clr.w      -(a7)
[000160b6] 2079 000e 692a            movea.l    _globl,a0
[000160bc] 4242                      clr.w      d2
[000160be] 4241                      clr.w      d1
[000160c0] 4240                      clr.w      d0
[000160c2] 4eb9 0007 a8c0            jsr        mt_graf_shrinkbox
[000160c8] 4fef 000a                 lea.l      10(a7),a7
[000160cc] 2057                      movea.l    (a7),a0
[000160ce] 0068 0010 0056            ori.w      #$0010,86(a0)
[000160d4] 2257                      movea.l    (a7),a1
[000160d6] 43e9 0024                 lea.l      36(a1),a1
[000160da] 2057                      movea.l    (a7),a0
[000160dc] 2457                      movea.l    (a7),a2
[000160de] 246a 0086                 movea.l    134(a2),a2
[000160e2] 4e92                      jsr        (a2)
[000160e4] 584f                      addq.w     #4,a7
[000160e6] 245f                      movea.l    (a7)+,a2
[000160e8] 4e75                      rts
new_name:
[000160ea] 4fef fff6                 lea.l      -10(a7),a7
[000160ee] 2f48 0006                 move.l     a0,6(a7)
[000160f2] 2f49 0002                 move.l     a1,2(a7)
[000160f6] 206f 0006                 movea.l    6(a7),a0
[000160fa] 2068 005a                 movea.l    90(a0),a0
[000160fe] 2068 0008                 movea.l    8(a0),a0
[00016102] 4eb9 0004 649c            jsr        Ast_delete
[00016108] 206f 0006                 movea.l    6(a7),a0
[0001610c] 2068 004e                 movea.l    78(a0),a0
[00016110] 4eb9 0004 649c            jsr        Ast_delete
[00016116] 206f 0002                 movea.l    2(a7),a0
[0001611a] 41e8 0016                 lea.l      22(a0),a0
[0001611e] 4eb9 0004 643c            jsr        Ast_create
[00016124] 226f 0006                 movea.l    6(a7),a1
[00016128] 2269 005a                 movea.l    90(a1),a1
[0001612c] 2348 0008                 move.l     a0,8(a1)
[00016130] 206f 0002                 movea.l    2(a7),a0
[00016134] 41e8 0016                 lea.l      22(a0),a0
[00016138] 4eb9 0004 643c            jsr        Ast_create
[0001613e] 226f 0006                 movea.l    6(a7),a1
[00016142] 2348 004e                 move.l     a0,78(a1)
[00016146] 206f 0006                 movea.l    6(a7),a0
[0001614a] 3ea8 0020                 move.w     32(a0),(a7)
[0001614e] 3017                      move.w     (a7),d0
[00016150] 6b1a                      bmi.s      $0001616C
[00016152] 4267                      clr.w      -(a7)
[00016154] 4267                      clr.w      -(a7)
[00016156] 206f 000a                 movea.l    10(a7),a0
[0001615a] 2f28 004e                 move.l     78(a0),-(a7)
[0001615e] 7203                      moveq.l    #3,d1
[00016160] 302f 0008                 move.w     8(a7),d0
[00016164] 4eb9 0007 f926            jsr        wind_set
[0001616a] 504f                      addq.w     #8,a7
[0001616c] 4fef 000a                 lea.l      10(a7),a7
[00016170] 4e75                      rts
chk_new_label:
[00016172] 4fef ff80                 lea.l      -128(a7),a7
[00016176] 43d7                      lea.l      (a7),a1
[00016178] 7002                      moveq.l    #2,d0
[0001617a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00016180] 2068 025c                 movea.l    604(a0),a0
[00016184] 4eb9 0005 11da            jsr        Aob_gettext
[0001618a] 1017                      move.b     (a7),d0
[0001618c] 670c                      beq.s      $0001619A
[0001618e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00016194] 317c 0001 0268            move.w     #$0001,616(a0)
[0001619a] 4fef 0080                 lea.l      128(a7),a7
[0001619e] 4e75                      rts
newlabel:
[000161a0] 4fef ff74                 lea.l      -140(a7),a7
[000161a4] 2f48 0088                 move.l     a0,136(a7)
[000161a8] 2f49 0084                 move.l     a1,132(a7)
[000161ac] 41f9 000a 8064            lea.l      WI_NEW_LABEL,a0
[000161b2] 2279 000a 806c            movea.l    $000A806C,a1
[000161b8] 4e91                      jsr        (a1)
[000161ba] 2f48 0080                 move.l     a0,128(a7)
[000161be] 6604                      bne.s      $000161C4
[000161c0] 6000 008a                 bra        $0001624C
[000161c4] 206f 0080                 movea.l    128(a7),a0
[000161c8] 2068 004a                 movea.l    74(a0),a0
[000161cc] 4eb9 0004 649c            jsr        Ast_delete
[000161d2] 206f 0090                 movea.l    144(a7),a0
[000161d6] 4eb9 0004 643c            jsr        Ast_create
[000161dc] 226f 0080                 movea.l    128(a7),a1
[000161e0] 2348 004a                 move.l     a0,74(a1)
[000161e4] 226f 0084                 movea.l    132(a7),a1
[000161e8] 43e9 0016                 lea.l      22(a1),a1
[000161ec] 7002                      moveq.l    #2,d0
[000161ee] 206f 0080                 movea.l    128(a7),a0
[000161f2] 2068 0014                 movea.l    20(a0),a0
[000161f6] 4eb9 0005 0fd8            jsr        Aob_puttext
[000161fc] 206f 0080                 movea.l    128(a7),a0
[00016200] 4eb9 0005 9df4            jsr        Awi_dialog
[00016206] 43d7                      lea.l      (a7),a1
[00016208] 7002                      moveq.l    #2,d0
[0001620a] 206f 0080                 movea.l    128(a7),a0
[0001620e] 2068 0014                 movea.l    20(a0),a0
[00016212] 4eb9 0005 11da            jsr        Aob_gettext
[00016218] 1017                      move.b     (a7),d0
[0001621a] 67e0                      beq.s      $000161FC
[0001621c] 206f 0088                 movea.l    136(a7),a0
[00016220] 3028 0006                 move.w     6(a0),d0
[00016224] c07c 4000                 and.w      #$4000,d0
[00016228] 6708                      beq.s      $00016232
[0001622a] 41d7                      lea.l      (a7),a0
[0001622c] 4eb9 0008 3180            jsr        strupr
[00016232] 43d7                      lea.l      (a7),a1
[00016234] 206f 0084                 movea.l    132(a7),a0
[00016238] 41e8 0016                 lea.l      22(a0),a0
[0001623c] 4eb9 0008 2f0c            jsr        strcpy
[00016242] 206f 0080                 movea.l    128(a7),a0
[00016246] 4eb9 0005 85f2            jsr        Awi_delete
[0001624c] 4fef 008c                 lea.l      140(a7),a7
[00016250] 4e75                      rts
new2label:
[00016252] 4fef ff72                 lea.l      -142(a7),a7
[00016256] 2f48 008a                 move.l     a0,138(a7)
[0001625a] 2f49 0086                 move.l     a1,134(a7)
[0001625e] 41f9 000a 7fc2            lea.l      WI_NEW2_LABEL,a0
[00016264] 2279 000a 7fca            movea.l    $000A7FCA,a1
[0001626a] 4e91                      jsr        (a1)
[0001626c] 2f48 0082                 move.l     a0,130(a7)
[00016270] 6606                      bne.s      $00016278
[00016272] 4240                      clr.w      d0
[00016274] 6000 00a0                 bra        $00016316
[00016278] 206f 0082                 movea.l    130(a7),a0
[0001627c] 2068 004a                 movea.l    74(a0),a0
[00016280] 4eb9 0004 649c            jsr        Ast_delete
[00016286] 206f 0092                 movea.l    146(a7),a0
[0001628a] 4eb9 0004 643c            jsr        Ast_create
[00016290] 226f 0082                 movea.l    130(a7),a1
[00016294] 2348 004a                 move.l     a0,74(a1)
[00016298] 226f 0086                 movea.l    134(a7),a1
[0001629c] 43e9 0016                 lea.l      22(a1),a1
[000162a0] 7002                      moveq.l    #2,d0
[000162a2] 206f 0082                 movea.l    130(a7),a0
[000162a6] 2068 0014                 movea.l    20(a0),a0
[000162aa] 4eb9 0005 0fd8            jsr        Aob_puttext
[000162b0] 206f 0082                 movea.l    130(a7),a0
[000162b4] 4eb9 0005 9df4            jsr        Awi_dialog
[000162ba] 3f40 0080                 move.w     d0,128(a7)
[000162be] 43d7                      lea.l      (a7),a1
[000162c0] 7002                      moveq.l    #2,d0
[000162c2] 206f 0082                 movea.l    130(a7),a0
[000162c6] 2068 0014                 movea.l    20(a0),a0
[000162ca] 4eb9 0005 11da            jsr        Aob_gettext
[000162d0] 206f 0082                 movea.l    130(a7),a0
[000162d4] 4eb9 0005 85f2            jsr        Awi_delete
[000162da] 0c6f 0003 0080            cmpi.w     #$0003,128(a7)
[000162e0] 6630                      bne.s      $00016312
[000162e2] 1017                      move.b     (a7),d0
[000162e4] 672c                      beq.s      $00016312
[000162e6] 206f 008a                 movea.l    138(a7),a0
[000162ea] 3028 0006                 move.w     6(a0),d0
[000162ee] c07c 4000                 and.w      #$4000,d0
[000162f2] 6708                      beq.s      $000162FC
[000162f4] 41d7                      lea.l      (a7),a0
[000162f6] 4eb9 0008 3180            jsr        strupr
[000162fc] 43d7                      lea.l      (a7),a1
[000162fe] 206f 0086                 movea.l    134(a7),a0
[00016302] 41e8 0016                 lea.l      22(a0),a0
[00016306] 4eb9 0008 2f0c            jsr        strcpy
[0001630c] 7001                      moveq.l    #1,d0
[0001630e] 6006                      bra.s      $00016316
[00016310] 6004                      bra.s      $00016316
[00016312] 4240                      clr.w      d0
[00016314] 4e71                      nop
[00016316] 4fef 008e                 lea.l      142(a7),a7
[0001631a] 4e75                      rts
wicalc_pos:
[0001631c] 4fef fff2                 lea.l      -14(a7),a7
[00016320] 2f40 000a                 move.l     d0,10(a7)
[00016324] 2f41 0006                 move.l     d1,6(a7)
[00016328] 2f42 0002                 move.l     d2,2(a7)
[0001632c] 202f 0006                 move.l     6(a7),d0
[00016330] 6606                      bne.s      $00016338
[00016332] 3eaf 000c                 move.w     12(a7),(a7)
[00016336] 601a                      bra.s      $00016352
[00016338] 202f 000a                 move.l     10(a7),d0
[0001633c] 222f 0002                 move.l     2(a7),d1
[00016340] 4eb9 0008 3cac            jsr        _lmul
[00016346] 222f 0006                 move.l     6(a7),d1
[0001634a] 4eb9 0008 3cf6            jsr        _ldiv
[00016350] 3e80                      move.w     d0,(a7)
[00016352] 3017                      move.w     (a7),d0
[00016354] b06f 0012                 cmp.w      18(a7),d0
[00016358] 6c04                      bge.s      $0001635E
[0001635a] 3eaf 0012                 move.w     18(a7),(a7)
[0001635e] 3017                      move.w     (a7),d0
[00016360] b06f 0014                 cmp.w      20(a7),d0
[00016364] 6f04                      ble.s      $0001636A
[00016366] 3eaf 0014                 move.w     20(a7),(a7)
[0001636a] 3017                      move.w     (a7),d0
[0001636c] 4fef 000e                 lea.l      14(a7),a7
[00016370] 4e75                      rts
wi_pos:
[00016372] 514f                      subq.w     #8,a7
[00016374] 2f48 0004                 move.l     a0,4(a7)
[00016378] 2e89                      move.l     a1,(a7)
[0001637a] 2057                      movea.l    (a7),a0
[0001637c] 3028 0004                 move.w     4(a0),d0
[00016380] 6604                      bne.s      $00016386
[00016382] 6000 016e                 bra        $000164F2
[00016386] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001638c] 3028 0008                 move.w     8(a0),d0
[00016390] 2079 0010 ee4e            movea.l    ACSblk,a0
[00016396] d068 000c                 add.w      12(a0),d0
[0001639a] 3f00                      move.w     d0,-(a7)
[0001639c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000163a2] 3f28 0008                 move.w     8(a0),-(a7)
[000163a6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000163ac] 3428 0008                 move.w     8(a0),d2
[000163b0] 48c2                      ext.l      d2
[000163b2] 206f 0010                 movea.l    16(a7),a0
[000163b6] 3210                      move.w     (a0),d1
[000163b8] 48c1                      ext.l      d1
[000163ba] 206f 0004                 movea.l    4(a7),a0
[000163be] 3010                      move.w     (a0),d0
[000163c0] 48c0                      ext.l      d0
[000163c2] 6100 ff58                 bsr        wicalc_pos
[000163c6] 584f                      addq.w     #4,a7
[000163c8] 206f 0004                 movea.l    4(a7),a0
[000163cc] 3140 0024                 move.w     d0,36(a0)
[000163d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000163d6] 3028 000a                 move.w     10(a0),d0
[000163da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000163e0] d068 000e                 add.w      14(a0),d0
[000163e4] 3f00                      move.w     d0,-(a7)
[000163e6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000163ec] 3f28 000a                 move.w     10(a0),-(a7)
[000163f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000163f6] 3428 000a                 move.w     10(a0),d2
[000163fa] 48c2                      ext.l      d2
[000163fc] 206f 0010                 movea.l    16(a7),a0
[00016400] 3228 0002                 move.w     2(a0),d1
[00016404] 48c1                      ext.l      d1
[00016406] 206f 0004                 movea.l    4(a7),a0
[0001640a] 3028 0002                 move.w     2(a0),d0
[0001640e] 48c0                      ext.l      d0
[00016410] 6100 ff0a                 bsr        wicalc_pos
[00016414] 584f                      addq.w     #4,a7
[00016416] 206f 0004                 movea.l    4(a7),a0
[0001641a] 3140 0026                 move.w     d0,38(a0)
[0001641e] 206f 0004                 movea.l    4(a7),a0
[00016422] 3028 0022                 move.w     34(a0),d0
[00016426] c07c 0e20                 and.w      #$0E20,d0
[0001642a] 674c                      beq.s      $00016478
[0001642c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00016432] 3028 000c                 move.w     12(a0),d0
[00016436] d040                      add.w      d0,d0
[00016438] 3f00                      move.w     d0,-(a7)
[0001643a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00016440] 3028 0004                 move.w     4(a0),d0
[00016444] e548                      lsl.w      #2,d0
[00016446] 3f00                      move.w     d0,-(a7)
[00016448] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001644e] 3428 000c                 move.w     12(a0),d2
[00016452] 48c2                      ext.l      d2
[00016454] 206f 0010                 movea.l    16(a7),a0
[00016458] 3228 0004                 move.w     4(a0),d1
[0001645c] 48c1                      ext.l      d1
[0001645e] 206f 0004                 movea.l    4(a7),a0
[00016462] 3028 0004                 move.w     4(a0),d0
[00016466] 48c0                      ext.l      d0
[00016468] 6100 feb2                 bsr        wicalc_pos
[0001646c] 584f                      addq.w     #4,a7
[0001646e] 206f 0004                 movea.l    4(a7),a0
[00016472] 3140 0028                 move.w     d0,40(a0)
[00016476] 6010                      bra.s      $00016488
[00016478] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001647e] 226f 0004                 movea.l    4(a7),a1
[00016482] 3368 000c 0028            move.w     12(a0),40(a1)
[00016488] 206f 0004                 movea.l    4(a7),a0
[0001648c] 3028 0022                 move.w     34(a0),d0
[00016490] c07c 01e0                 and.w      #$01E0,d0
[00016494] 674c                      beq.s      $000164E2
[00016496] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001649c] 3028 000e                 move.w     14(a0),d0
[000164a0] d040                      add.w      d0,d0
[000164a2] 3f00                      move.w     d0,-(a7)
[000164a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000164aa] 3028 0006                 move.w     6(a0),d0
[000164ae] e548                      lsl.w      #2,d0
[000164b0] 3f00                      move.w     d0,-(a7)
[000164b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000164b8] 3428 000e                 move.w     14(a0),d2
[000164bc] 48c2                      ext.l      d2
[000164be] 206f 0010                 movea.l    16(a7),a0
[000164c2] 3228 0006                 move.w     6(a0),d1
[000164c6] 48c1                      ext.l      d1
[000164c8] 206f 0004                 movea.l    4(a7),a0
[000164cc] 3028 0006                 move.w     6(a0),d0
[000164d0] 48c0                      ext.l      d0
[000164d2] 6100 fe48                 bsr        wicalc_pos
[000164d6] 584f                      addq.w     #4,a7
[000164d8] 206f 0004                 movea.l    4(a7),a0
[000164dc] 3140 002a                 move.w     d0,42(a0)
[000164e0] 6010                      bra.s      $000164F2
[000164e2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000164e8] 226f 0004                 movea.l    4(a7),a1
[000164ec] 3368 000e 002a            move.w     14(a0),42(a1)
[000164f2] 504f                      addq.w     #8,a7
[000164f4] 4e75                      rts
convert:
[000164f6] 2f0a                      move.l     a2,-(a7)
[000164f8] 4fef ffcc                 lea.l      -52(a7),a7
[000164fc] 2f48 0030                 move.l     a0,48(a7)
[00016500] 2f49 002c                 move.l     a1,44(a7)
[00016504] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001650a] 7001                      moveq.l    #1,d0
[0001650c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00016512] 1229 001d                 move.b     29(a1),d1
[00016516] e368                      lsl.w      d1,d0
[00016518] b068 001a                 cmp.w      26(a0),d0
[0001651c] 6700 0228                 beq        $00016746
[00016520] 206f 0030                 movea.l    48(a7),a0
[00016524] 3028 0008                 move.w     8(a0),d0
[00016528] 206f 0030                 movea.l    48(a7),a0
[0001652c] c1e8 0006                 muls.w     6(a0),d0
[00016530] 48c0                      ext.l      d0
[00016532] 2f40 0026                 move.l     d0,38(a7)
[00016536] 4240                      clr.w      d0
[00016538] 3f40 0006                 move.w     d0,6(a7)
[0001653c] 3f40 0004                 move.w     d0,4(a7)
[00016540] 3f40 0002                 move.w     d0,2(a7)
[00016544] 3e80                      move.w     d0,(a7)
[00016546] 426f 0010                 clr.w      16(a7)
[0001654a] 6000 01e8                 bra        $00016734
[0001654e] 302f 0010                 move.w     16(a7),d0
[00016552] 3f40 000e                 move.w     d0,14(a7)
[00016556] 3f40 000a                 move.w     d0,10(a7)
[0001655a] 302f 0010                 move.w     16(a7),d0
[0001655e] 206f 0030                 movea.l    48(a7),a0
[00016562] c1e8 0008                 muls.w     8(a0),d0
[00016566] 48c0                      ext.l      d0
[00016568] 2f40 0022                 move.l     d0,34(a7)
[0001656c] 426f 0012                 clr.w      18(a7)
[00016570] 6000 01ae                 bra        $00016720
[00016574] 302f 0012                 move.w     18(a7),d0
[00016578] e840                      asr.w      #4,d0
[0001657a] 48c0                      ext.l      d0
[0001657c] d0af 0022                 add.l      34(a7),d0
[00016580] 2f40 001e                 move.l     d0,30(a7)
[00016584] 202f 001e                 move.l     30(a7),d0
[00016588] d080                      add.l      d0,d0
[0001658a] 206f 003c                 movea.l    60(a7),a0
[0001658e] d1c0                      adda.l     d0,a0
[00016590] 2f48 0014                 move.l     a0,20(a7)
[00016594] 202f 001e                 move.l     30(a7),d0
[00016598] d080                      add.l      d0,d0
[0001659a] 206f 0030                 movea.l    48(a7),a0
[0001659e] 2050                      movea.l    (a0),a0
[000165a0] d1c0                      adda.l     d0,a0
[000165a2] 2f48 0018                 move.l     a0,24(a7)
[000165a6] 302f 0012                 move.w     18(a7),d0
[000165aa] 3f40 000c                 move.w     d0,12(a7)
[000165ae] 3f40 0008                 move.w     d0,8(a7)
[000165b2] 203c 0000 8000            move.l     #$00008000,d0
[000165b8] 720f                      moveq.l    #15,d1
[000165ba] c22f 0013                 and.b      19(a7),d1
[000165be] e2a0                      asr.l      d1,d0
[000165c0] 3f40 001c                 move.w     d0,28(a7)
[000165c4] 206f 0014                 movea.l    20(a7),a0
[000165c8] 3010                      move.w     (a0),d0
[000165ca] c06f 001c                 and.w      28(a7),d0
[000165ce] 6700 0104                 beq        $000166D4
[000165d2] 426f 002a                 clr.w      42(a7)
[000165d6] 206f 0018                 movea.l    24(a7),a0
[000165da] 3010                      move.w     (a0),d0
[000165dc] c06f 001c                 and.w      28(a7),d0
[000165e0] 6704                      beq.s      $000165E6
[000165e2] 526f 002a                 addq.w     #1,42(a7)
[000165e6] 202f 0026                 move.l     38(a7),d0
[000165ea] d080                      add.l      d0,d0
[000165ec] d1af 0018                 add.l      d0,24(a7)
[000165f0] 206f 0018                 movea.l    24(a7),a0
[000165f4] 3010                      move.w     (a0),d0
[000165f6] c06f 001c                 and.w      28(a7),d0
[000165fa] 6704                      beq.s      $00016600
[000165fc] 546f 002a                 addq.w     #2,42(a7)
[00016600] 202f 0026                 move.l     38(a7),d0
[00016604] d080                      add.l      d0,d0
[00016606] d1af 0018                 add.l      d0,24(a7)
[0001660a] 206f 0018                 movea.l    24(a7),a0
[0001660e] 3010                      move.w     (a0),d0
[00016610] c06f 001c                 and.w      28(a7),d0
[00016614] 6704                      beq.s      $0001661A
[00016616] 586f 002a                 addq.w     #4,42(a7)
[0001661a] 202f 0026                 move.l     38(a7),d0
[0001661e] d080                      add.l      d0,d0
[00016620] d1af 0018                 add.l      d0,24(a7)
[00016624] 206f 0018                 movea.l    24(a7),a0
[00016628] 3010                      move.w     (a0),d0
[0001662a] c06f 001c                 and.w      28(a7),d0
[0001662e] 6704                      beq.s      $00016634
[00016630] 506f 002a                 addq.w     #8,42(a7)
[00016634] 202f 0026                 move.l     38(a7),d0
[00016638] d080                      add.l      d0,d0
[0001663a] d1af 0018                 add.l      d0,24(a7)
[0001663e] 206f 0018                 movea.l    24(a7),a0
[00016642] 3010                      move.w     (a0),d0
[00016644] c06f 001c                 and.w      28(a7),d0
[00016648] 6706                      beq.s      $00016650
[0001664a] 066f 0010 002a            addi.w     #$0010,42(a7)
[00016650] 202f 0026                 move.l     38(a7),d0
[00016654] d080                      add.l      d0,d0
[00016656] d1af 0018                 add.l      d0,24(a7)
[0001665a] 206f 0018                 movea.l    24(a7),a0
[0001665e] 3010                      move.w     (a0),d0
[00016660] c06f 001c                 and.w      28(a7),d0
[00016664] 6706                      beq.s      $0001666C
[00016666] 066f 0020 002a            addi.w     #$0020,42(a7)
[0001666c] 202f 0026                 move.l     38(a7),d0
[00016670] d080                      add.l      d0,d0
[00016672] d1af 0018                 add.l      d0,24(a7)
[00016676] 206f 0018                 movea.l    24(a7),a0
[0001667a] 3010                      move.w     (a0),d0
[0001667c] c06f 001c                 and.w      28(a7),d0
[00016680] 6706                      beq.s      $00016688
[00016682] 066f 0040 002a            addi.w     #$0040,42(a7)
[00016688] 202f 0026                 move.l     38(a7),d0
[0001668c] d080                      add.l      d0,d0
[0001668e] d1af 0018                 add.l      d0,24(a7)
[00016692] 206f 0018                 movea.l    24(a7),a0
[00016696] 3010                      move.w     (a0),d0
[00016698] c06f 001c                 and.w      28(a7),d0
[0001669c] 6706                      beq.s      $000166A4
[0001669e] 066f 0080 002a            addi.w     #$0080,42(a7)
[000166a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000166aa] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[000166b0] 6c06                      bge.s      $000166B8
[000166b2] 026f 000f 002a            andi.w     #$000F,42(a7)
[000166b8] 0c6f 0010 002a            cmpi.w     #$0010,42(a7)
[000166be] 6c12                      bge.s      $000166D2
[000166c0] 302f 002a                 move.w     42(a7),d0
[000166c4] d040                      add.w      d0,d0
[000166c6] 41f9 000a 46c2            lea.l      map,a0
[000166cc] 3f70 0000 002a            move.w     0(a0,d0.w),42(a7)
[000166d2] 6010                      bra.s      $000166E4
[000166d4] 70ff                      moveq.l    #-1,d0
[000166d6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000166dc] d068 001a                 add.w      26(a0),d0
[000166e0] 3f40 002a                 move.w     d0,42(a7)
[000166e4] 302f 002a                 move.w     42(a7),d0
[000166e8] 33c0 000e 7726            move.w     d0,col
[000166ee] 33c0 000e 7728            move.w     d0,$000E7728
[000166f4] 4879 000e 7726            pea.l      col
[000166fa] 2f2f 0030                 move.l     48(a7),-(a7)
[000166fe] 43f9 000a 46e4            lea.l      punkt,a1
[00016704] 41ef 0008                 lea.l      8(a7),a0
[00016708] 7201                      moveq.l    #1,d1
[0001670a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00016710] 302a 0010                 move.w     16(a2),d0
[00016714] 4eb9 0007 4902            jsr        vrt_cpyfm
[0001671a] 504f                      addq.w     #8,a7
[0001671c] 526f 0012                 addq.w     #1,18(a7)
[00016720] 206f 002c                 movea.l    44(a7),a0
[00016724] 302f 0012                 move.w     18(a7),d0
[00016728] b068 0004                 cmp.w      4(a0),d0
[0001672c] 6d00 fe46                 blt        $00016574
[00016730] 526f 0010                 addq.w     #1,16(a7)
[00016734] 206f 002c                 movea.l    44(a7),a0
[00016738] 302f 0010                 move.w     16(a7),d0
[0001673c] b068 0006                 cmp.w      6(a0),d0
[00016740] 6d00 fe0c                 blt        $0001654E
[00016744] 6018                      bra.s      $0001675E
[00016746] 226f 002c                 movea.l    44(a7),a1
[0001674a] 206f 0030                 movea.l    48(a7),a0
[0001674e] 2479 0010 ee4e            movea.l    ACSblk,a2
[00016754] 302a 0010                 move.w     16(a2),d0
[00016758] 4eb9 0007 4978            jsr        vr_trnfm
[0001675e] 4fef 0034                 lea.l      52(a7),a7
[00016762] 245f                      movea.l    (a7)+,a2
[00016764] 4e75                      rts
to_cicon:
[00016766] 4fef ffbc                 lea.l      -68(a7),a7
[0001676a] 2f48 0040                 move.l     a0,64(a7)
[0001676e] 2f49 003c                 move.l     a1,60(a7)
[00016772] 3f40 003a                 move.w     d0,58(a7)
[00016776] 700f                      moveq.l    #15,d0
[00016778] 206f 0048                 movea.l    72(a7),a0
[0001677c] d068 0016                 add.w      22(a0),d0
[00016780] c07c fff0                 and.w      #$FFF0,d0
[00016784] 3f40 0038                 move.w     d0,56(a7)
[00016788] 302f 0038                 move.w     56(a7),d0
[0001678c] 206f 0048                 movea.l    72(a7),a0
[00016790] c1e8 0018                 muls.w     24(a0),d0
[00016794] e640                      asr.w      #3,d0
[00016796] 48c0                      ext.l      d0
[00016798] 2f40 0034                 move.l     d0,52(a7)
[0001679c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000167a2] 302f 003a                 move.w     58(a7),d0
[000167a6] b068 001c                 cmp.w      28(a0),d0
[000167aa] 6f0e                      ble.s      $000167BA
[000167ac] 41f9 000a 469d            lea.l      a_planemess,a0
[000167b2] 7001                      moveq.l    #1,d0
[000167b4] 4eb9 0005 a600            jsr        Awi_alert
[000167ba] 202f 0034                 move.l     52(a7),d0
[000167be] 2079 0010 ee4e            movea.l    ACSblk,a0
[000167c4] 3228 001c                 move.w     28(a0),d1
[000167c8] 48c1                      ext.l      d1
[000167ca] 4eb9 0008 3cac            jsr        _lmul
[000167d0] 5c80                      addq.l     #6,d0
[000167d2] 2f40 0030                 move.l     d0,48(a7)
[000167d6] 202f 0034                 move.l     52(a7),d0
[000167da] 322f 003a                 move.w     58(a7),d1
[000167de] 48c1                      ext.l      d1
[000167e0] 4eb9 0008 3cac            jsr        _lmul
[000167e6] 2f40 002c                 move.l     d0,44(a7)
[000167ea] 426f 0022                 clr.w      34(a7)
[000167ee] 3f7c 0001 000e            move.w     #$0001,14(a7)
[000167f4] 302f 0038                 move.w     56(a7),d0
[000167f8] 3f40 0008                 move.w     d0,8(a7)
[000167fc] 3f40 001c                 move.w     d0,28(a7)
[00016800] 206f 0048                 movea.l    72(a7),a0
[00016804] 3028 0018                 move.w     24(a0),d0
[00016808] 3f40 000a                 move.w     d0,10(a7)
[0001680c] 3f40 001e                 move.w     d0,30(a7)
[00016810] 302f 0038                 move.w     56(a7),d0
[00016814] e840                      asr.w      #4,d0
[00016816] 3f40 000c                 move.w     d0,12(a7)
[0001681a] 3f40 0020                 move.w     d0,32(a7)
[0001681e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00016824] 3028 001c                 move.w     28(a0),d0
[00016828] 3f40 0010                 move.w     d0,16(a7)
[0001682c] 3f40 0024                 move.w     d0,36(a7)
[00016830] 4240                      clr.w      d0
[00016832] 3f40 0016                 move.w     d0,22(a7)
[00016836] 3f40 0014                 move.w     d0,20(a7)
[0001683a] 3f40 0012                 move.w     d0,18(a7)
[0001683e] 3f40 002a                 move.w     d0,42(a7)
[00016842] 3f40 0028                 move.w     d0,40(a7)
[00016846] 3f40 0026                 move.w     d0,38(a7)
[0001684a] 202f 0030                 move.l     48(a7),d0
[0001684e] 4eb9 0004 c608            jsr        Ax_malloc
[00016854] 2e88                      move.l     a0,(a7)
[00016856] 660e                      bne.s      $00016866
[00016858] 206f 0048                 movea.l    72(a7),a0
[0001685c] 42a8 0022                 clr.l      34(a0)
[00016860] 91c8                      suba.l     a0,a0
[00016862] 6000 00a4                 bra        $00016908
[00016866] 2f57 0004                 move.l     (a7),4(a7)
[0001686a] 222f 0030                 move.l     48(a7),d1
[0001686e] 4240                      clr.w      d0
[00016870] 206f 0004                 movea.l    4(a7),a0
[00016874] 4eb9 0008 36ea            jsr        memset
[0001687a] 202f 002c                 move.l     44(a7),d0
[0001687e] 226f 0040                 movea.l    64(a7),a1
[00016882] 5c49                      addq.w     #6,a1
[00016884] 206f 0004                 movea.l    4(a7),a0
[00016888] 4eb9 0008 3500            jsr        memcpy
[0001688e] 202f 0030                 move.l     48(a7),d0
[00016892] 4eb9 0004 c608            jsr        Ax_malloc
[00016898] 2e88                      move.l     a0,(a7)
[0001689a] 6616                      bne.s      $000168B2
[0001689c] 206f 0004                 movea.l    4(a7),a0
[000168a0] 4eb9 0004 c6c8            jsr        Ax_ifree
[000168a6] 206f 0048                 movea.l    72(a7),a0
[000168aa] 42a8 0022                 clr.l      34(a0)
[000168ae] 91c8                      suba.l     a0,a0
[000168b0] 6056                      bra.s      $00016908
[000168b2] 2057                      movea.l    (a7),a0
[000168b4] 5c48                      addq.w     #6,a0
[000168b6] 2f48 0018                 move.l     a0,24(a7)
[000168ba] 2057                      movea.l    (a7),a0
[000168bc] 30bc 0001                 move.w     #$0001,(a0)
[000168c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000168c6] 2068 023c                 movea.l    572(a0),a0
[000168ca] 3028 000e                 move.w     14(a0),d0
[000168ce] c07c 0800                 and.w      #$0800,d0
[000168d2] 6714                      beq.s      $000168E8
[000168d4] 202f 002c                 move.l     44(a7),d0
[000168d8] 226f 0004                 movea.l    4(a7),a1
[000168dc] 206f 0018                 movea.l    24(a7),a0
[000168e0] 4eb9 0008 3500            jsr        memcpy
[000168e6] 6012                      bra.s      $000168FA
[000168e8] 2f2f 003c                 move.l     60(a7),-(a7)
[000168ec] 43ef 001c                 lea.l      28(a7),a1
[000168f0] 41ef 0008                 lea.l      8(a7),a0
[000168f4] 6100 fc00                 bsr        convert
[000168f8] 584f                      addq.w     #4,a7
[000168fa] 206f 0004                 movea.l    4(a7),a0
[000168fe] 4eb9 0004 c6c8            jsr        Ax_ifree
[00016904] 206f 0018                 movea.l    24(a7),a0
[00016908] 4fef 0044                 lea.l      68(a7),a7
[0001690c] 4e75                      rts


	.data

hex:
[000a468c]                           dc.b '0123456789ABCDEF',0
a_planemess:
[000a469d]                           dc.b '[1][ |planes > nplanes!| ][   OK   ]',0
map:
[000a46c2]                           dc.w $0000
[000a46c4]                           dc.w $0002
[000a46c6]                           dc.w $0003
[000a46c8]                           dc.w $0006
[000a46ca]                           dc.w $0004
[000a46cc]                           dc.w $0007
[000a46ce]                           dc.w $0005
[000a46d0]                           dc.w $0008
[000a46d2]                           dc.w $0009
[000a46d4]                           dc.w $000a
[000a46d6]                           dc.w $000b
[000a46d8]                           dc.w $000e
[000a46da]                           dc.w $000c
[000a46dc]                           dc.w $000f
[000a46de]                           dc.w $000d
[000a46e0]                           dc.w $0001
xff:
[000a46e2]                           dc.w $ffff
punkt:
[000a46e4] 000a46e2                  dc.l xff
[000a46e8]                           dc.w $0001
[000a46ea]                           dc.w $0001
[000a46ec]                           dc.w $0001
[000a46ee]                           dc.w $0000
[000a46f0]                           dc.w $0001
[000a46f2]                           dc.w $0000
[000a46f4]                           dc.w $0000
[000a46f6]                           dc.w $0000
[000a46f8]                           dc.b '%d*%d',0
[000a46fe]                           dc.b '%d*%d',0
[000a4704]                           dc.b '%-32s"',0
[000a470b]                           dc.b $22
[000a470c]                           dc.w $5c00
[000a470e]                           dc.b '"',$0d,$0a,0
[000a4712]                           dc.b $0d,$0a,$0d,$0a,0
[000a4717]                           dc.b $0d,$0a,'====================',$0d,$0a,$0d,$0a,0
[000a4732]                           dc.b 'free ',0
[000a4738]                           dc.b 'extern ',0
[000a4740]                           dc.b 'local',0
[000a4746]                           dc.b 'global',0
[000a474d]                           dc.b $0d,$0a,'%s [usage %d %s]',$0d,$0a,'----------------------------------------',$0d,$0a,'keycode| click               | drag                | index               ',$0d,$0a,'=======|=====================|=====================|=====================',$0d,$0a,0
[000a4822]                           dc.b '%-7s|%-21s|%-21s|%-21s',$0d,$0a,0
[000a483b]                           dc.b 'all',0
[000a483f]                           dc.b $0d,$0a,$09,$09,$09,' List of all named objects',$0d,$0a,$09,$09,$09,' =========================',$0d,$0a,$0d,$0a,$0d,$0a,$09,'Name',$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,' |Use |Size |',$09,' Name',$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,' |Use |Size |',$0d,$0a,'===============================|====|=====|================================|====|=====|',0
[000a491a]                           dc.b '%-31s|%4d|%5ld|',0
[000a492a]                           dc.b $0d,$0a,'=======================================================================================',$0d,$0a,0
[000a4986]                           dc.b '%ld objects containing %ld bytes user data',$0d,$0a,$0d,$0a,0
[000a49b5]                           dc.b '.LST',0
[000a49ba]                           dc.b 'Protokoll',0
[000a49c4]                           dc.b $09,$09,'TEXTS',$0d,$0a,$09,$09,'=====',$0d,$0a,$0d,$0a,0
[000a49d9]                           dc.b $09,$09,'ALERTBOXES',$0d,$0a,$09,$09,'==========',$0d,$0a,$0d,$0a,0
trans:
[000a49f8]                           dc.w $0000
[000a49fa]                           dc.w $0000
transcount:
[000a49fc]                           dc.w $0000
[000a49fe]                           dc.w $0000
FixV3x:
[000a4a00] 0001779c                  dc.l fix_window
[000a4a04] 00017baa                  dc.l fix_object
[000a4a08] 00017baa                  dc.l fix_object
[000a4a0c] 00017baa                  dc.l fix_object
[000a4a10]                           dc.w $0000
[000a4a12]                           dc.w $0000
[000a4a14] 00017d02                  dc.l fix_tedinfo
[000a4a18] 0001795c                  dc.l fix_icon
[000a4a1c]                           dc.w $0000
[000a4a1e]                           dc.w $0000
[000a4a20]                           dc.w $0000
[000a4a22]                           dc.w $0000
[000a4a24] 00017d42                  dc.l fix_user
[000a4a28]                           dc.w $0000
[000a4a2a]                           dc.w $0000
[000a4a2c]                           dc.w $0000
[000a4a2e]                           dc.w $0000
[000a4a30]                           dc.w $0000
[000a4a32]                           dc.w $0000
[000a4a34]                           dc.w $0000
[000a4a36]                           dc.w $0000
[000a4a38]                           dc.w $0000
[000a4a3a]                           dc.w $0000
UnfixV3x:
[000a4a3c] 0001787c                  dc.l unfix_window
[000a4a40] 00017c56                  dc.l unfix_object
[000a4a44] 00017c56                  dc.l unfix_object
[000a4a48] 00017c56                  dc.l unfix_object
[000a4a4c]                           dc.w $0000
[000a4a4e]                           dc.w $0000
[000a4a50] 00017d22                  dc.l unfix_tedinfo
[000a4a54] 000179ae                  dc.l unfix_icon
[000a4a58]                           dc.w $0000
[000a4a5a]                           dc.w $0000
[000a4a5c]                           dc.w $0000
[000a4a5e]                           dc.w $0000
[000a4a60] 00017d8a                  dc.l unfix_user
[000a4a64]                           dc.w $0000
[000a4a66]                           dc.w $0000
[000a4a68]                           dc.w $0000
[000a4a6a]                           dc.w $0000
[000a4a6c]                           dc.w $0000
[000a4a6e]                           dc.w $0000
[000a4a70]                           dc.w $0000
[000a4a72]                           dc.w $0000
[000a4a74]                           dc.w $0000
[000a4a76]                           dc.w $0000
UnfixV2x:
[000a4a78] 00017dd2                  dc.l unfix_window2
[000a4a7c] 00017c56                  dc.l unfix_object
[000a4a80] 00017c56                  dc.l unfix_object
[000a4a84] 00017c56                  dc.l unfix_object
[000a4a88]                           dc.w $0000
[000a4a8a]                           dc.w $0000
[000a4a8c] 00017d22                  dc.l unfix_tedinfo
[000a4a90] 000179ae                  dc.l unfix_icon
[000a4a94]                           dc.w $0000
[000a4a96]                           dc.w $0000
[000a4a98]                           dc.w $0000
[000a4a9a]                           dc.w $0000
[000a4a9c] 00017e76                  dc.l unfix_user2
[000a4aa0]                           dc.w $0000
[000a4aa2]                           dc.w $0000
[000a4aa4]                           dc.w $0000
[000a4aa6]                           dc.w $0000
[000a4aa8]                           dc.w $0000
[000a4aaa]                           dc.w $0000
[000a4aac]                           dc.w $0000
[000a4aae]                           dc.w $0000
[000a4ab0]                           dc.w $0000
[000a4ab2]                           dc.w $0000
UnfixV1x:
[000a4ab4] 00017dd2                  dc.l unfix_window2
[000a4ab8] 00017c56                  dc.l unfix_object
[000a4abc] 00017c56                  dc.l unfix_object
[000a4ac0] 00017c56                  dc.l unfix_object
[000a4ac4]                           dc.w $0000
[000a4ac6]                           dc.w $0000
[000a4ac8] 00017d22                  dc.l unfix_tedinfo
[000a4acc] 000179ae                  dc.l unfix_icon
[000a4ad0]                           dc.w $0000
[000a4ad2]                           dc.w $0000
[000a4ad4]                           dc.w $0000
[000a4ad6]                           dc.w $0000
[000a4ad8] 00017e26                  dc.l unfix_user1
[000a4adc]                           dc.w $0000
[000a4ade]                           dc.w $0000
[000a4ae0]                           dc.w $0000
[000a4ae2]                           dc.w $0000
[000a4ae4]                           dc.w $0000
[000a4ae6]                           dc.w $0000
[000a4ae8]                           dc.w $0000
[000a4aea]                           dc.w $0000
[000a4aec]                           dc.w $0000
[000a4aee]                           dc.w $0000
zero:
[000a4af0]                           dc.w $0000
[000a4af2]                           dc.w $0000
[000a4af4]                           dc.w $0000
[000a4af6]                           dc.w $0000
[000a4af8]                           dc.b '%00d',0
[000a4afd]                           dc.b $00
pc_welcome:
[000a4afe]                           dc.b '/*********************************************************************/',$0d,$0a,'/*                                                                   */',$0d,$0a,'/* This file was created with ACS3.00 at %.24s    */',$0d,$0a,'/*                                                                   */',$0d,$0a,'/* The contents are based on file:                                   */',$0d,$0a,'/*    %-62s */',$0d,$0a,'/*                                                                   */',$0d,$0a,'/* (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin ElsÑsser */',$0d,$0a,'/*********************************************************************/',$0d,$0a,0
pp_welcome:
[000a4d44]                           dc.b '(*********************************************************************)',$0d,$0a,'(*                                                                   *)',$0d,$0a,'(* This file was created with ACS3.00 at %.24s    *)',$0d,$0a,'(*                                                                   *)',$0d,$0a,'(* The contents are based on file:                                   *)',$0d,$0a,'(*    %-62s *)',$0d,$0a,'(*                                                                   *)',$0d,$0a,'(* (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin ElsÑsser *)',$0d,$0a,'(*********************************************************************)',$0d,$0a,0
str_welcome:
[000a4f8a]                           dc.b '; This file was created with ACS3.00 at %.24s',$0d,$0a,'; from %s',$0d,$0a,'; Do not edit this file, since changes will be lost when generating',$0d,$0a,'; (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin ElsÑsser',$0d,$0a,0
[000a504f]                           dc.b $00
[000a5050] 000a794f                  dc.l ml1_obj
[000a5054] 000a795d                  dc.l ml2_obj
[000a5058] 000a796b                  dc.l ml3_obj
mlal_title:
[000a505c] 000a78df                  dc.l al1_obj
[000a5060] 000a78ee                  dc.l al2_obj
[000a5064] 000a78fd                  dc.l al3_obj
proto:
[000a5068]                           dc.b '.ACS'
[000a506c]                           dc.w $0191
[000a506e]                           dc.w $b800
[000a5070]                           dc.w $0000
[000a5072]                           dc.w $0000
[000a5074]                           dc.w $0000
[000a5076]                           dc.w $0000
[000a5078]                           dc.w $0000
[000a507a]                           dc.w $0000
[000a507c]                           dc.w $0000
[000a507e]                           dc.w $0000
[000a5080]                           dc.w $0000
[000a5082]                           dc.w $0000
[000a5084]                           dc.w $0000
[000a5086]                           dc.w $0000
[000a5088]                           dc.w $0000
[000a508a]                           dc.w $0000
[000a508c]                           dc.w $0000
[000a508e]                           dc.w $0000
[000a5090]                           dc.w $0000
[000a5092]                           dc.w $0000
[000a5094]                           dc.w $0000
[000a5096]                           dc.w $0000
[000a5098]                           dc.w $0000
[000a509a]                           dc.w $0000
[000a509c]                           dc.w $0000
[000a509e]                           dc.w $0000
[000a50a0]                           dc.w $0000
[000a50a2]                           dc.w $0000
[000a50a4]                           dc.w $0000
[000a50a6]                           dc.w $0000
[000a50a8]                           dc.w $0000
[000a50aa]                           dc.w $0000
[000a50ac]                           dc.w $0000
[000a50ae]                           dc.w $0000
[000a50b0]                           dc.w $0000
[000a50b2]                           dc.w $0000
[000a50b4]                           dc.b 'ACS3.00',0
[000a50bc]                           dc.w $012c
[000a50be]                           dc.w $ff9d
[000a50c0]                           dc.w $ff9d
[000a50c2]                           dc.w $0051
[000a50c4]                           dc.b '  ACS ACCESSORY  ',0
[000a50d6]                           dc.w $0000
[000a50d8]                           dc.w $0000
[000a50da]                           dc.w $0000
[000a50dc]                           dc.w $0000
[000a50de]                           dc.w $0000
[000a50e0]                           dc.w $0000
[000a50e2]                           dc.w $0000
[000a50e4]                           dc.w $0000
[000a50e6]                           dc.w $0000
[000a50e8]                           dc.w $0000
[000a50ea]                           dc.w $0000
[000a50ec]                           dc.w $0000
[000a50ee]                           dc.w $0000
[000a50f0]                           dc.w $0000
[000a50f2]                           dc.w $0002
[000a50f4]                           dc.w $0000
[000a50f6]                           dc.w $0000
[000a50f8]                           dc.w $0003
[000a50fa]                           dc.w $0000
[000a50fc]                           dc.w $0000
[000a50fe]                           dc.w $0004
[000a5100]                           dc.w $0000
[000a5102]                           dc.w $0000
[000a5104]                           dc.w $0001
[000a5106]                           dc.w $0000
[000a5108]                           dc.w $0000
[000a510a]                           dc.w $0005
[000a510c]                           dc.w $0000
[000a510e]                           dc.w $0000
[000a5110]                           dc.w $0006
[000a5112]                           dc.w $0000
[000a5114]                           dc.w $0000
[000a5116]                           dc.w $0007
[000a5118]                           dc.w $0000
[000a511a]                           dc.w $0000
[000a511c]                           dc.w $0000
[000a511e]                           dc.w $0000
[000a5120]                           dc.w $0000
[000a5122]                           dc.w $0000
[000a5124]                           dc.w $0000
[000a5126]                           dc.w $0000
[000a5128]                           dc.w $0000
[000a512a]                           dc.w $0000
[000a512c]                           dc.w $0000
[000a512e]                           dc.w $0000
[000a5130]                           dc.w $0000
[000a5132]                           dc.w $0000
[000a5134]                           dc.w $0000
[000a5136]                           dc.w $0000
[000a5138]                           dc.w $0000
[000a513a]                           dc.w $0000
[000a513c]                           dc.w $0000
[000a513e]                           dc.w $0000
[000a5140]                           dc.w $0000
[000a5142]                           dc.w $0000
[000a5144]                           dc.w $0000
[000a5146]                           dc.w $0000
[000a5148]                           dc.w $0000
[000a514a]                           dc.w $0000
[000a514c]                           dc.w $0000
[000a514e]                           dc.w $0000
[000a5150]                           dc.w $0000
[000a5152]                           dc.w $0000
[000a5154]                           dc.w $0000
[000a5156]                           dc.w $0000
[000a5158]                           dc.w $0000
[000a515a]                           dc.w $0000
[000a515c]                           dc.w $0000
[000a515e]                           dc.w $0000
[000a5160]                           dc.w $0000
[000a5162]                           dc.w $0000
[000a5164]                           dc.w $0000
[000a5166]                           dc.w $0000
[000a5168]                           dc.w $0000
[000a516a]                           dc.w $0000
[000a516c]                           dc.w $0000
[000a516e]                           dc.w $0000
[000a5170]                           dc.w $0000
[000a5172]                           dc.w $0000
[000a5174]                           dc.w $0000
[000a5176]                           dc.w $0000
[000a5178]                           dc.w $0000
[000a517a]                           dc.w $0000
[000a517c]                           dc.w $0000
[000a517e]                           dc.w $0000
[000a5180]                           dc.w $0000
[000a5182]                           dc.w $0000
[000a5184]                           dc.w $0000
[000a5186]                           dc.w $0000
[000a5188]                           dc.w $0000
[000a518a]                           dc.w $0000
[000a518c]                           dc.w $0000
[000a518e]                           dc.w $0000
[000a5190]                           dc.w $0000
[000a5192]                           dc.w $0000
[000a5194]                           dc.w $0000
[000a5196]                           dc.w $0000
[000a5198]                           dc.w $0000
[000a519a]                           dc.w $0000
[000a519c]                           dc.w $0000
[000a519e]                           dc.w $0000
[000a51a0]                           dc.w $0000
[000a51a2]                           dc.w $0000
[000a51a4]                           dc.w $0000
[000a51a6]                           dc.w $0000
[000a51a8]                           dc.w $0000
[000a51aa]                           dc.w $0000
[000a51ac]                           dc.w $0000
[000a51ae]                           dc.w $0000
[000a51b0]                           dc.w $0000
[000a51b2]                           dc.w $0000
[000a51b4]                           dc.w $0000
[000a51b6]                           dc.w $0000
[000a51b8]                           dc.w $0000
[000a51ba]                           dc.w $0000
[000a51bc]                           dc.w $0000
[000a51be]                           dc.w $0000
[000a51c0]                           dc.w $0000
[000a51c2]                           dc.w $0000
[000a51c4]                           dc.w $0000
[000a51c6]                           dc.w $0000
[000a51c8]                           dc.w $0000
[000a51ca]                           dc.w $0000
[000a51cc]                           dc.w $0000
[000a51ce]                           dc.w $0000
[000a51d0]                           dc.w $0000
[000a51d2]                           dc.w $0000
[000a51d4]                           dc.w $0000
[000a51d6]                           dc.w $0000
[000a51d8]                           dc.w $0000
[000a51da]                           dc.w $0000
[000a51dc]                           dc.w $0000
[000a51de]                           dc.w $0000
[000a51e0]                           dc.w $0000
[000a51e2]                           dc.w $0000
[000a51e4]                           dc.w $0000
[000a51e6]                           dc.w $0000
[000a51e8]                           dc.w $0000
[000a51ea]                           dc.w $0000
[000a51ec]                           dc.w $0000
[000a51ee]                           dc.w $0000
[000a51f0]                           dc.w $0000
[000a51f2]                           dc.w $0000
[000a51f4]                           dc.w $0000
[000a51f6]                           dc.w $0000
[000a51f8]                           dc.w $0000
[000a51fa]                           dc.w $0000
[000a51fc]                           dc.w $0000
[000a51fe]                           dc.w $0000
[000a5200]                           dc.w $0000
[000a5202]                           dc.w $0000
[000a5204]                           dc.w $0000
[000a5206]                           dc.w $0000
[000a5208]                           dc.w $0000
[000a520a]                           dc.w $0000
[000a520c]                           dc.w $0000
[000a520e]                           dc.w $0000
[000a5210]                           dc.w $0000
[000a5212]                           dc.w $0000
[000a5214]                           dc.w $0000
[000a5216]                           dc.w $0000
[000a5218]                           dc.w $0000
[000a521a]                           dc.w $0000
[000a521c]                           dc.w $0000
[000a521e]                           dc.w $0000
[000a5220]                           dc.w $0000
[000a5222]                           dc.w $0000
[000a5224]                           dc.w $0000
[000a5226]                           dc.w $0000
[000a5228]                           dc.w $0000
[000a522a]                           dc.w $0000
[000a522c]                           dc.w $0000
[000a522e]                           dc.w $0000
[000a5230]                           dc.w $0000
[000a5232]                           dc.w $0000
[000a5234]                           dc.w $0000
[000a5236]                           dc.w $0000
[000a5238]                           dc.w $0000
[000a523a]                           dc.w $0000
[000a523c]                           dc.w $0000
[000a523e]                           dc.w $0000
[000a5240]                           dc.w $0000
[000a5242]                           dc.w $0000
[000a5244]                           dc.w $0000
[000a5246]                           dc.w $0000
[000a5248]                           dc.w $0000
[000a524a]                           dc.w $0000
[000a524c]                           dc.w $0000
[000a524e]                           dc.w $0000
[000a5250]                           dc.w $0000
[000a5252]                           dc.w $0000
[000a5254]                           dc.w $0000
[000a5256]                           dc.w $0000
[000a5258]                           dc.w $0000
[000a525a]                           dc.w $0000
[000a525c]                           dc.w $0000
[000a525e]                           dc.w $0000
[000a5260]                           dc.w $0000
[000a5262]                           dc.w $0000
[000a5264]                           dc.w $0000
[000a5266]                           dc.w $0000
[000a5268]                           dc.w $0000
[000a526a]                           dc.w $0000
[000a526c]                           dc.w $0000
[000a526e]                           dc.w $0000
[000a5270]                           dc.w $0000
[000a5272]                           dc.w $0000
[000a5274]                           dc.w $0000
[000a5276]                           dc.w $0000
[000a5278]                           dc.w $0000
[000a527a]                           dc.w $0000
[000a527c]                           dc.w $0000
[000a527e]                           dc.w $0000
[000a5280]                           dc.w $0000
[000a5282]                           dc.w $0000
[000a5284]                           dc.w $0000
[000a5286]                           dc.w $0000
[000a5288]                           dc.w $0000
[000a528a]                           dc.w $0000
[000a528c]                           dc.w $0020
[000a528e]                           dc.w $0000
[000a5290]                           dc.w $0000
[000a5292]                           dc.w $0000
[000a5294]                           dc.w $0000
[000a5296]                           dc.w $0000
[000a5298]                           dc.w $0000
[000a529a]                           dc.w $0000
[000a529c]                           dc.w $0000
[000a529e]                           dc.w $0000
[000a52a0]                           dc.w $0000
[000a52a2]                           dc.w $0000
[000a52a4]                           dc.w $0000
[000a52a6]                           dc.w $0000
[000a52a8]                           dc.w $0000
[000a52aa]                           dc.w $0000
[000a52ac]                           dc.w $0000
[000a52ae]                           dc.w $0000
[000a52b0]                           dc.w $0000
[000a52b2]                           dc.w $0000
[000a52b4]                           dc.w $0000
[000a52b6]                           dc.w $0000
[000a52b8]                           dc.w $0000
[000a52ba]                           dc.w $000d
[000a52bc]                           dc.w $0000
[000a52be]                           dc.w $0000
[000a52c0]                           dc.w $0000
[000a52c2]                           dc.w $0000
[000a52c4]                           dc.w $0000
[000a52c6]                           dc.w $0000
[000a52c8]                           dc.w $0000
[000a52ca]                           dc.w $0000
[000a52cc]                           dc.w $0000
[000a52ce]                           dc.w $0000
[000a52d0]                           dc.w $0000
[000a52d2]                           dc.w $0000
[000a52d4]                           dc.w $0000
[000a52d6]                           dc.w $0000
[000a52d8]                           dc.w $0000
[000a52da]                           dc.w $0000
[000a52dc]                           dc.w $0000
[000a52de]                           dc.w $0000
[000a52e0]                           dc.b '                               ',0
[000a5300]                           dc.w $0001
[000a5302]                           dc.w $0000
[000a5304]                           dc.w $0000
[000a5306]                           dc.w $0000
[000a5308]                           dc.w $0000
[000a530a]                           dc.w $0000
[000a530c]                           dc.w $0000
[000a530e]                           dc.w $0000
[000a5310]                           dc.w $0000
[000a5312]                           dc.w $0000
[000a5314]                           dc.w $0000
[000a5316]                           dc.w $0000
[000a5318]                           dc.w $0000
[000a531a]                           dc.w $0000
[000a531c]                           dc.w $0000
[000a531e]                           dc.w $0000
[000a5320]                           dc.w $0000
[000a5322]                           dc.w $0000
[000a5324]                           dc.w $0000
[000a5326]                           dc.w $0000
[000a5328]                           dc.w $0000
[000a532a]                           dc.w $0000
[000a532c]                           dc.w $0000
[000a532e]                           dc.w $0000
[000a5330]                           dc.w $0000
[000a5332]                           dc.w $0000
[000a5334]                           dc.w $0000
[000a5336]                           dc.w $0000
[000a5338]                           dc.w $0000
[000a533a]                           dc.w $0000
[000a533c]                           dc.w $0000
[000a533e]                           dc.w $0000
[000a5340]                           dc.w $0000
[000a5342]                           dc.w $0001
[000a5344]                           dc.w $0000
[000a5346]                           dc.w $0000
[000a5348]                           dc.w $0000
[000a534a]                           dc.w $0000
[000a534c]                           dc.w $0000
[000a534e]                           dc.w $0025
[000a5350]                           dc.b '.28s'
[000a5354]                           dc.w $0125
[000a5356]                           dc.w $6401
[000a5358]                           dc.w $0041
[000a535a]                           dc.b 'CS(%02d)',0
[000a5363]                           dc.b 'RSC',0
[000a5367]                           dc.b $00
obsproto:
[000a5368]                           dc.w $0000
[000a536a]                           dc.w $0000
[000a536c]                           dc.w $0000
[000a536e]                           dc.w $0000
[000a5370]                           dc.w $ffff
[000a5372]                           dc.w $ffff
[000a5374]                           dc.w $ffff
[000a5376]                           dc.w $0014
[000a5378]                           dc.w $0000
[000a537a]                           dc.w $0010
[000a537c]                           dc.w $0002
[000a537e]                           dc.w $1100
[000a5380]                           dc.w $0000
[000a5382]                           dc.w $0000
[000a5384]                           dc.w $0020
[000a5386]                           dc.w $000c
[000a5388]                           dc.w $0000
[000a538a]                           dc.w $0000
[000a538c]                           dc.w $0000
[000a538e]                           dc.w $0000
[000a5390]                           dc.w $8000
[000a5392]                           dc.w $0000
[000a5394]                           dc.w $0000
[000a5396]                           dc.w $0000
[000a5398]                           dc.w $0000
[000a539a]                           dc.w $0000
[000a539c]                           dc.w $0000
[000a539e]                           dc.w $0000
[000a53a0]                           dc.w $0041
[000a53a2]                           dc.b 'LERTBOX_01',0
[000a53ad]                           dc.b 'Alertbox',0
[000a53b6]                           dc.b 'TEXT_01',0
[000a53be]                           dc.b 'Freier String',0
[000a53cc]                           dc.b 'MENU_01',0
[000a53d4]                           dc.b 'OBJECT_01',0
[000a53de]                           dc.b '.DFN',0
[000a53e3]                           dc.b '.ACS',0
[000a53e8]                           dc.b $0d,$0a,$0d,$0a,'extern Adescr ACSdescr;',$0d,$0a,$0d,$0a,0
[000a5408]                           dc.b 'ACS(',0
[000a540d]                           dc.b $0d,$0a,'extern OBJECT %s;',$0d,$0a,0
[000a5423]                           dc.b '#define %-14s (%3d)',$0d,$0a,0
[000a5439]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ANSI-C Prototypes',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a545b]                           dc.b 'extern void %s( void );',$0d,$0a,0
[000a5475]                           dc.b 'extern INT16 CDECL %s( PARMBLK *pb );',$0d,$0a,0
[000a549d]                           dc.b 'extern INT16 %s( OBJECT *entry, INT16 task, void *in_out );',$0d,$0a,0
[000a54db]                           dc.b 'extern INT16 %s( Awindow *wind );',$0d,$0a,0
[000a54ff]                           dc.b 'extern Awindow *%s( void *para );',$0d,$0a,0
[000a5523]                           dc.b 'extern INT16 %s( Awindow *wind, INT16 kstate, INT16 key );',$0d,$0a,0
[000a5560]                           dc.b 'extern void %s( Awindow *wind, INT16 obnr, INT16 state );',$0d,$0a,0
[000a559c]                           dc.b 'extern void %s( Awindow *wind, Axywh *area );',$0d,$0a,0
[000a55cc]                           dc.b 'extern void %s( Awindow *wind );',$0d,$0a,0
[000a55ef]                           dc.b 'extern void %s( Awindow *wind, INT16 pos, INT16 amount );',$0d,$0a,0
[000a562b]                           dc.b 'extern void %s( Awindow *wind, INT16 pos );',$0d,$0a,0
[000a5659]                           dc.b 'extern INT16 %s( Awindow *wind, INT16 task, void *in_out );',$0d,$0a,0
[000a5697]                           dc.b 'extern INT16 %s( Awindow *wind, INT16 all );',$0d,$0a,0
[000a56c6]                           dc.b 'extern INT16 %s( Awindow *wind, INT16 anz, char **cmd, A_GSAntwort *antwort );',$0d,$0a,0
[000a5717]                           dc.b 'extern INT16 %s( void );',$0d,$0a,0
[000a5732]                           dc.b 'extern INT16 %s( INT16 *message );',$0d,$0a,0
[000a5757]                           dc.b 'extern void %s( INT16 *button, INT16 *kreturn );',$0d,$0a,0
[000a578a]                           dc.b 'extern void %s( INT16 *kstate, INT16 *key );',$0d,$0a,0
[000a57b9]                           dc.b 'extern INT16 %s( INT16 anz, char **cmd, A_GSAntwort *antwort );',$0d,$0a,0
[000a57fb]                           dc.b '/* %s Type %d ?? */',$0d,$0a,0
[000a5811]                           dc.b $2e
[000a5812]                           dc.w $4800
[000a5814]                           dc.b 'ANSI C Header',0
[000a5822]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'PLATFORM',$09,$09,'*/',$0d,$0a,'#define ACS_ATARI',$0d,$0a,0
[000a584c]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ALERTBOXES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5867]                           dc.b 'extern char %s [%ld];',$0d,$0a,0
[000a587f]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'STRINGS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5897]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ICONS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a58ad]                           dc.b 'extern CICONBLK %s;',$0d,$0a,0
[000a58c3]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'IMAGES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a58da]                           dc.b 'extern BITBLK %s;',$0d,$0a,0
[000a58ee]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'MENU TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5909]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'POPUP TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5925]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'OBJECT TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5942]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'WINDOWS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a595a]                           dc.b 'extern Awindow %s;',$0d,$0a,0
[000a596f]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'MOUSEFORMS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a598a]                           dc.b 'extern MFORM %s;',$0d,$0a,0
[000a599d]                           dc.b $00
xacc_types:
[000a599e]                           dc.w $0000
[000a59a0]                           dc.w $0057
[000a59a2]                           dc.w $5000
[000a59a4]                           dc.w $4454
[000a59a6]                           dc.w $0045
[000a59a8]                           dc.w $4400
[000a59aa]                           dc.w $4442
[000a59ac]                           dc.w $0053
[000a59ae]                           dc.w $5300
[000a59b0]                           dc.w $5247
[000a59b2]                           dc.w $0056
[000a59b4]                           dc.w $4700
[000a59b6]                           dc.w $4747
[000a59b8]                           dc.w $004d
[000a59ba]                           dc.w $5500
[000a59bc]                           dc.w $4344
[000a59be]                           dc.w $0044
[000a59c0]                           dc.w $4300
[000a59c2]                           dc.w $4454
[000a59c4]                           dc.w $0050
[000a59c6]                           dc.w $4500
[000a59c8]                           dc.w $0025
[000a59ca]                           dc.b '-12s',0
[000a59cf]                           dc.b '&%-12s',0
[000a59d6]                           dc.b '&%-12s[3]',0
[000a59e0]                           dc.b $0d,$0a,$0d,$0a,'Adescr ACSdescr =',0
[000a59f6]                           dc.b $0d,$0a,$09,'{',$0d,$0a,0
[000a59fd]                           dc.b $09,$09,'"%s", %d,',$0d,$0a,$09,$09,'%2d, %2d,',$0d,$0a,$09,$09,'%#4x,',$0d,$0a,$09,$09,'"%s",',$0d,$0a,$09,$09,0
[000a5a2c]                           dc.b 'ACS3.00',0
[000a5a34]                           dc.b '&PUR_DESK',0
[000a5a3e]                           dc.w $2c20
[000a5a40]                           dc.w $004e
[000a5a42]                           dc.b 'ULL',0
[000a5a46]                           dc.b ',',$0d,$0a,$09,$09,'{',$0d,$0a,0
[000a5a4f]                           dc.b ',',$0d,$0a,0
[000a5a53]                           dc.b $09,$09,$09,'{%3d, NULL}',0
[000a5a62]                           dc.b $09,$09,$09,'{255, &%s}',0
[000a5a70]                           dc.b $0d,$0a,$09,$09,'},',$0d,$0a,0
[000a5a79]                           dc.b 'ACS(%02d)',0
[000a5a83]                           dc.b $09,$09,'"%s"',0
[000a5a8a]                           dc.w $2c00
[000a5a8c]                           dc.b $09,'};',$0d,$0a,0
[000a5a92]                           dc.b $0d,$0a,$0d,$0a,' Aconfig ACSconfig =',0
[000a5aab]                           dc.b $0d,$0a,$09,'{',$0d,$0a,$09,$09,0
[000a5ab4]                           dc.w $7b22
[000a5ab6]                           dc.w $0022
[000a5ab8]                           dc.b ', "',0
[000a5abc]                           dc.w $253b
[000a5abe]                           dc.w $0022
[000a5ac0]                           dc.w $2c20
[000a5ac2]                           dc.w $0054
[000a5ac4]                           dc.b 'RUE, ',0
[000a5aca]                           dc.b 'FALSE, ',0
[000a5ad2]                           dc.b '%i},',$0d,$0a,$09,$09,0
[000a5adb]                           dc.b '4},',$0d,$0a,$09,$09,0
[000a5ae3]                           dc.b ', ',$0d,$0a,$09,$09,0
[000a5aea]                           dc.b '%i, ',0
[000a5aef]                           dc.b ''%s', ',0
[000a5af6]                           dc.b '0, ',0
[000a5afa]                           dc.b 'ACSinit',0
[000a5b02]                           dc.b $0d,$0a,$09,'};',$0d,$0a,0
[000a5b0a]                           dc.b 'static CICON _C%d_%-s = {',$0d,$0a,$09,$09,'%d,',$0d,$0a,$09,$09,0
[000a5b2f]                           dc.b ',',$0d,$0a,$09,$09,'&_C%d_%-s};',$0d,$0a,0
[000a5b42]                           dc.b ',',$0d,$0a,$09,$09,'NULL};',$0d,$0a,0
[000a5b50]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ICONS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5b66]                           dc.b 'static INT16 _MSK_%-s [] = {',$0d,$0a,$09,$09,0
[000a5b87]                           dc.b '%#06x, ',0
[000a5b8f]                           dc.b '%#06x};',$0d,$0a,'static INT16 _DAT_%-s [] = {',$0d,$0a,$09,$09,0
[000a5bb9]                           dc.b '%#06x};',$0d,$0a,0
[000a5bc3]                           dc.b '       ',0
[000a5bcb]                           dc.b 'static ',0
[000a5bd3]                           dc.b 'CICONBLK %-s = {{',$0d,$0a,$09,$09,'_MSK_%-s, _DAT_%-s, %-s,',$0d,$0a,$09,$09,'%#6x, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d},',0
[000a5c3d]                           dc.b '&_C%d_%-s',0
[000a5c47]                           dc.b '};',$0d,$0a,$0d,$0a,0
[000a5c4e]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'MOUSEFORMS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5c69]                           dc.b 'MFORM %-s =',$0d,$0a,$09,$09,'{',$0d,$0a,$09,$09,$09,'%2d, %2d, %2d, %2d, %2d,',$0d,$0a,$09,$09,$09,'{',$0d,$0a,$09,$09,$09,$09,0
[000a5ca3]                           dc.b '%#06x',$0d,$0a,$09,$09,$09,'},',$0d,$0a,$09,$09,$09,'{',$0d,$0a,$09,$09,$09,$09,0
[000a5cbc]                           dc.b '%#06x',$0d,$0a,$09,$09,$09,'}',$0d,$0a,$09,$09,'};',$0d,$0a,$0d,$0a,$0d,$0a,0
[000a5cd4]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'IMAGES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5ceb]                           dc.b 'static INT16 _IMG_%-s [] =',$0d,$0a,$09,'{',$0d,$0a,$09,$09,0
[000a5d0e]                           dc.b '%#06x',$0d,$0a,$09,'};',$0d,$0a,0
[000a5d1b]                           dc.b 'BITBLK %-s = {_IMG_%-s, %2d, %2d, %2d, %2d, %#04x};',$0d,$0a,$0d,$0a,0
[000a5d53]                           dc.b '#define %-14s (%3d)',$0d,$0a,0
[000a5d69]                           dc.b 'OBJECT  %-12s    ',0
[000a5d7b]                           dc.b 'static OBJECT  _%02d_%-12s',0
[000a5d96]                           dc.b ' = { %2d, %2d, %2d, %2d, %#6x, %#6x, ',0
[000a5dbc]                           dc.b ' %#010lxL',$09,$09,$09,$09,0
[000a5dca]                           dc.b '(long) %-12s',0
[000a5dd7]                           dc.b '(long) &%-12s',0
[000a5de5]                           dc.b ' , %2d, %2d, %2d, %2d };',$0d,$0a,0
[000a5e00]                           dc.b 'static AOBJECT _%02da%-12s = {',0
[000a5e1f]                           dc.b 'NULL',$09,$09,' ',0
[000a5e27]                           dc.b 'NULL',$09,$09,$09,$09,0
[000a5e30]                           dc.b '0',$09,$09,$09,$09,$09,0
[000a5e37]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'DATAS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5e4d]                           dc.b 'INT16 %-12s [] =',$0d,$0a,$09,'{',$0d,$0a,$09,$09,$09,0
[000a5e67]                           dc.b '%#06x',$0d,$0a,$09,'};',$0d,$0a,$0d,$0a,0
[000a5e76]                           dc.b 'ACS(',0
[000a5e7b]                           dc.b 'char %-12s [] = "',0
[000a5e8d]                           dc.b $5c
[000a5e8e]                           dc.w $6e00
[000a5e90]                           dc.w $5c72
[000a5e92]                           dc.w $005c
[000a5e94]                           dc.w $7400
[000a5e96]                           dc.w $5c76
[000a5e98]                           dc.w $005c
[000a5e9a]                           dc.w $6200
[000a5e9c]                           dc.w $5c61
[000a5e9e]                           dc.w $005c
[000a5ea0]                           dc.w $6600
[000a5ea2]                           dc.w $5c22
[000a5ea4]                           dc.w $005c
[000a5ea6]                           dc.w $5c00
[000a5ea8]                           dc.w $2563
[000a5eaa]                           dc.w $0022
[000a5eac]                           dc.b ';',$0d,$0a,0
[000a5eb0]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'TEDINFOS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5ec9]                           dc.b 'static TEDINFO %-12s = {%s, %s, %s, %d, %d, %d, %#x, %d, %d, %ld, %ld};',$0d,$0a,0
[000a5f13]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'AUSERBLK',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5f2c]                           dc.b 'static AUSERBLK %-12s = {%s, ',0
[000a5f4a]                           dc.w $304c
[000a5f4c]                           dc.w $000d
[000a5f4e]                           dc.b $0a,$0d,$0a,'/*',$09,$09,'WINDOWS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a5f65]                           dc.b 'Awindow %-12s =',$0d,$0a,$09,'{',$0d,$0a,$09,$09,0
[000a5f7d]                           dc.b 'Awi_service',0
[000a5f89]                           dc.b 'Awi_selfcreate',0
[000a5f98]                           dc.b 'Awi_open',0
[000a5fa1]                           dc.b 'Awi_init',0
[000a5faa]                           dc.b ', 0, 0, -1,',$0d,$0a,$09,$09,0
[000a5fba]                           dc.b '%#6x, {%2i, %2i, %2i, %2i},',$0d,$0a,$09,$09,0
[000a5fda]                           dc.b '{0, 0, 0, 0}, {0, 0, 0, 0}, {-1, -1, -1, -1}, 0, 0,',$0d,$0a,$09,$09,0
[000a6012]                           dc.b '%#6x,',$0d,$0a,$09,$09,0
[000a601c]                           dc.b '%4d, %#6x, 0, -1,',$0d,$0a,$09,$09,0
[000a6032]                           dc.b 'Awi_keys',0
[000a603b]                           dc.b 'Awi_obchange',0
[000a6048]                           dc.b 'Awi_redraw',0
[000a6053]                           dc.b 'Awi_topped',0
[000a605e]                           dc.b 'Awi_closed',0
[000a6069]                           dc.b 'Awi_fulled',0
[000a6074]                           dc.b 'Awi_arrowed',0
[000a6080]                           dc.b 'Awi_hslid',0
[000a608a]                           dc.b 'Awi_vslid',0
[000a6094]                           dc.b 'Awi_sized',0
[000a609e]                           dc.b 'Awi_moved',0
[000a60a8]                           dc.b 'Awi_iconify',0
[000a60b4]                           dc.b 'Awi_uniconify',0
[000a60c2]                           dc.b 'Awi_gemscript',0
[000a60d0]                           dc.b $0d,$0a,$09,'};',$0d,$0a,$0d,$0a,$0d,$0a,0
[000a60dc]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ANSI-C Routines',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a60fc]                           dc.b '/* '%s' Not yet defined by user */',$0d,$0a,0
[000a6121]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ANSI-C Prototypes',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a6143]                           dc.b 'static void %s( void );',$0d,$0a,0
[000a615d]                           dc.b 'static INT16 CDECL %s( PARMBLK* pb );',$0d,$0a,0
[000a6185]                           dc.b 'static INT16 %s( OBJECT *entry, INT16 task, void *in_out );',$0d,$0a,0
[000a61c3]                           dc.b 'static INT16 %s( Awindow* wind );',$0d,$0a,0
[000a61e7]                           dc.b 'static Awindow *%s( void *para );',$0d,$0a,0
[000a620b]                           dc.b 'static INT16 %s( Awindow *wind, INT16 kstate, INT16 key );',$0d,$0a,0
[000a6248]                           dc.b 'static void %s( Awindow *wind, INT16 obnr, INT16 state );',$0d,$0a,0
[000a6284]                           dc.b 'static void %s( Awindow *wind, Axywh *area );',$0d,$0a,0
[000a62b4]                           dc.b 'static void %s( Awindow *wind );',$0d,$0a,0
[000a62d7]                           dc.b 'static void %s( Awindow *wind, INT16 pos, INT16 amount );',$0d,$0a,0
[000a6313]                           dc.b 'static void %s( Awindow *wind, INT16 pos );',$0d,$0a,0
[000a6341]                           dc.b 'static INT16 %s( Awindow *wind, INT16 task, void *in_out );',$0d,$0a,0
[000a637f]                           dc.b 'static INT16 %s( Awindow *wind, INT16 all );',$0d,$0a,0
[000a63ae]                           dc.b 'static INT16 %s( Awindow *wind, INT16 anz, char **cmds, A_GSAntwort *antwort );',$0d,$0a,0
[000a6400]                           dc.b 'static INT16 %s( void );',$0d,$0a,0
[000a641b]                           dc.b 'static INT16 %s( INT16 *message );',$0d,$0a,0
[000a6440]                           dc.b 'static void %s( INT16 *button, INT16 *kreturn );',$0d,$0a,0
[000a6473]                           dc.b 'static void %s( INT16 *kstate, INT16 *key );',$0d,$0a,0
[000a64a2]                           dc.b 'static INT16 %s( INT16 anz, char **cmd, A_GSAntwort *antwort );',$0d,$0a,0
[000a64e4]                           dc.b '/* %s Type %d ?? */',$0d,$0a,0
[000a64fa]                           dc.b '.AH',0
[000a64fe]                           dc.b 'ANSI C Code',0
[000a650a]                           dc.b $0d,$0a,'/*',$09,$09,'GUI-LANGUAGE',$09,$09,'*/',$0d,$0a,0
[000a6523]                           dc.b '#define ACS_LANG%d',$0d,$0a,0
[000a6538]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ALERT BOXES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a6554]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'STRINGS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a656c]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'MENU TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a6587]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'POPUP TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a65a3]                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'OBJECT TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
[000a65c0]                           dc.b ';',$0d,$0a,0
[000a65c4]                           dc.b '                                '',0
[000a65e6]                           dc.b ''#%i'',0
[000a65ec]                           dc.w $2727
[000a65ee]                           dc.w $0025
[000a65f0]                           dc.w $6300
[000a65f2]                           dc.b ''#0',0
[000a65f6]                           dc.w $2573
[000a65f8]                           dc.w $0040
[000a65fa]                           dc.w $2573
[000a65fc]                           dc.w $0040
[000a65fe]                           dc.b '%-12s[3]',0
[000a6607]                           dc.b $0d,$0a,'IMPLEMENTATION',$0d,$0a,$0d,$0a,'(*',$09,'Pascal Routines',$09,'*)',$0d,$0a,$0d,$0a,0
[000a6635]                           dc.b '(* '%s' Not yet defined by user *)',$0d,$0a,0
[000a665a]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'Pascal Prototypes',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a667c]                           dc.b 'Procedure %s;',$0d,$0a,0
[000a668c]                           dc.b 'Function %s( dummy1, dummy2: Pointer; pb: PARMBLKPtr ) : Integer;',$0d,$0a,0
[000a66d0]                           dc.b 'Function %s( entry: ACSOBJECTPtr; task: Integer; in_out: Pointer ) : Boolean;',$0d,$0a,0
[000a6720]                           dc.b 'Function %s( wi: AwindowPtr ) : Integer;',$0d,$0a,0
[000a674b]                           dc.b 'Function %s( para: Pointer ) : AwindowPtr;',$0d,$0a,0
[000a6778]                           dc.b 'Function %s( wi: AwindowPtr; kstate, key: Integer ) : Integer;',$0d,$0a,0
[000a67b9]                           dc.b 'Procedure %s( wi: AwindowPtr; obnr, state: Integer );',$0d,$0a,0
[000a67f1]                           dc.b 'Procedure %s( wi: AwindowPtr; area: AxywhPtr );',$0d,$0a,0
[000a6823]                           dc.b 'Procedure %s( wi: AwindowPtr );',$0d,$0a,0
[000a6845]                           dc.b 'Procedure %s( wi: AwindowPtr; pos: Integer );',$0d,$0a,0
[000a6875]                           dc.b 'Function %s( wi: AwindowPtr; task: Integer; in_out: Pointer ) : Boolean;',$0d,$0a,0
[000a68c0]                           dc.b 'Function %s( wi: AwindowPtr; all: Integer ) : Integer;',$0d,$0a,0
[000a68f9]                           dc.b 'Function %s( wi: AwindowPtr; anz: Integer; cmd: Pointer; antwort: A_GSAntwortPtr ) : Integer;',$0d,$0a,0
[000a6959]                           dc.b '(* %s Type %d ?? *)',$0d,$0a,0
[000a696f]                           dc.b $0d,$0a,$0d,$0a,'ACSdescr: Adescr = ',$0d,$0a,$09,'(',$0d,$0a,0
[000a698d]                           dc.b $09,$09,'magic: '%s'#0; version: %d; dx: %2d; dy: %2d; flags: $%04x;',$0d,$0a,' ',$09,$09,'acc_reg: ',0
[000a69d9]                           dc.b 'ACS3.00',0
[000a69e1]                           dc.b $09,$09,'root: ',0
[000a69ea]                           dc.b 'NIL',0
[000a69ee]                           dc.b '; acc: ',0
[000a69f6]                           dc.b ';',$0d,$0a,$09,$09,'mouse: (',$0d,$0a,0
[000a6a06]                           dc.b ',',$0d,$0a,0
[000a6a0a]                           dc.b $09,$09,$09,'(number: 255; form: @%s)',0
[000a6a26]                           dc.b $09,$09,$09,'(number: %3d; form: NIL)',0
[000a6a42]                           dc.b $0d,$0a,$09,$09,');',$0d,$0a,$09,$09,'mess: (',$0d,$0a,0
[000a6a56]                           dc.b $09,$09,$09,$09,0
[000a6a5b]                           dc.b 'ACS(%02d)',0
[000a6a65]                           dc.b $0d,$0a,$09,$09,')',$0d,$0a,$09,');',$0d,$0a,0
[000a6a72]                           dc.b $0d,$0a,$0d,$0a,'ACSconfig: Aconfig = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a6a94]                           dc.b 'CfgInfo: (',$0d,$0a,$09,$09,$09,'dateiname: '',0
[000a6ab0]                           dc.b ''; comment: '',0
[000a6abe]                           dc.w $253b
[000a6ac0]                           dc.w $0027
[000a6ac2]                           dc.b '; env_praefix: ',0
[000a6ad2]                           dc.b '; ',$0d,$0a,$09,$09,$09,'casesensitiv: ',0
[000a6ae8]                           dc.b 'TRUE',0
[000a6aed]                           dc.b 'FALSE',0
[000a6af3]                           dc.b '; file_sensitiv: ',0
[000a6b05]                           dc.b ';',$0d,$0a,$09,$09,$09,'file_buffer: ',0
[000a6b19]                           dc.b '%i',$0d,$0a,$09,$09,');',$0d,$0a,$09,$09,0
[000a6b26]                           dc.b 'BaseName: '',0
[000a6b32]                           dc.b 'PUR_DESK',0
[000a6b3b]                           dc.b ''; ACSterm: ',0
[000a6b48]                           dc.b '; ACSaboutme: ',0
[000a6b57]                           dc.b '; ACSclose: ',0
[000a6b64]                           dc.b ';',$0d,$0a,$09,$09,'ACSmessage: ',0
[000a6b76]                           dc.b '; ACSmproto: ',0
[000a6b84]                           dc.b '; ACStimer: ',0
[000a6b91]                           dc.b '; ACSkey: ',0
[000a6b9c]                           dc.b ';',$0d,$0a,$09,$09,'ACSbutton: ',0
[000a6bad]                           dc.b '; ACSmouse: ',0
[000a6bba]                           dc.b '; ACSwikey: ',0
[000a6bc7]                           dc.b ';',$0d,$0a,$09,$09,'init_prot: ',0
[000a6bd8]                           dc.b '%i; XAccType: ',0
[000a6be7]                           dc.b '%i; ACSGEMScript: ',0
[000a6bfa]                           dc.b '_C%d_%-s: CICON = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'num_planes: %d;',$0d,$0a,$09,$09,'col_data: ',0
[000a6c32]                           dc.b ';',$0d,$0a,$09,$09,'col_mask: ',0
[000a6c42]                           dc.b ';',$0d,$0a,$09,$09,'sel_data: ',0
[000a6c52]                           dc.b ';',$0d,$0a,$09,$09,'sel_mask: ',0
[000a6c62]                           dc.b ';',$0d,$0a,$09,$09,'next_res: @_C%d_%-s);',$0d,$0a,0
[000a6c7f]                           dc.b ';',$0d,$0a,$09,$09,'next_res: NIL);',$0d,$0a,0
[000a6c96]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'ICONS',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a6cac]                           dc.b '_MSK_%-s: array [0..%d] of WORD = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a6cd7]                           dc.b '$%04x, ',0
[000a6cdf]                           dc.b '$%04x',$0d,$0a,$09,');',$0d,$0a,'_DAT_%-s: array [0..%d] of WORD = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a6d16]                           dc.b '$%04x',$0d,$0a,$09,');',$0d,$0a,0
[000a6d23]                           dc.b '%-s: CICONBLK = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'monoblk: ',$0d,$0a,$09,$09,'(',$0d,$0a,$09,$09,$09,'ib_pmask: @_MSK_%s; ib_pdata: @_DAT_%s; ib_ptext: @%s;',$0d,$0a,$09,$09,$09,'ib_char: $%04x; ib_xchar: %2d; ib_ychar: %2d;',$0d,$0a,$09,$09,$09,'ib_xicon: %2d; ib_yicon: %2d; ib_wicon: %2d; ib_hicon: %2d;',$0d,$0a,$09,$09,$09,'ib_xtext: %2d; ib_ytext: %2d; ib_wtext: %2d; ib_htext: %2d',$0d,$0a,$09,$09,');',$0d,$0a,$09,$09,'mainlist: ',0
[000a6e4a]                           dc.b '@_C%d_%-s',0
[000a6e54]                           dc.b $0d,$0a,$09,');',$0d,$0a,$0d,$0a,0
[000a6e5e]                           dc.b $0d,$0a,'(*',$09,$09,'MOUSEFORMS',$09,$09,'*)',$0d,$0a,0
[000a6e75]                           dc.b '%-s: MFORM = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'mf_xhot: %2d; mf_yhot: %2d; mf_nplanes: %2d; mf_fg: %2d; mf_bg: %2d;',$0d,$0a,$09,$09,'mf_mask:',$0d,$0a,$09,$09,'(',$0d,$0a,$09,$09,$09,0
[000a6ee5]                           dc.b '%d, ',0
[000a6eea]                           dc.b '%d',$0d,$0a,$09,$09,');',$0d,$0a,$09,$09,'mf_data:',$0d,$0a,$09,$09,'(',$0d,$0a,$09,$09,$09,0
[000a6f09]                           dc.b '%d',$0d,$0a,$09,$09,')',$0d,$0a,$09,');',$0d,$0a,$0d,$0a,0
[000a6f1a]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'IMAGES',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a6f31]                           dc.b '_IMG_%-s: array [0..%d] of WORD = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,$09,0
[000a6f5d]                           dc.b '$%04x',$0d,$0a,$09,$09,');',$0d,$0a,$09,0
[000a6f6c]                           dc.b '%-s: BITBLK = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'bi_pdata: @_IMG_%s;',$0d,$0a,$09,$09,'bi_wb: %2d; bi_hl: %2d; bi_x: %2d; bi_y: %2d; bi_color: %d',$0d,$0a,$09,');',$0d,$0a,$0d,$0a,0
[000a6fdd]                           dc.b '%s = %d;',$0d,$0a,0
[000a6fe8]                           dc.b '%s : Array [0 ..%d] of ACSOBJECT = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a7014]                           dc.b '(aes: (ob_next: %2d; ob_head: %2d; ob_tail: %2d; ob_type: %2d; ob_flags: $%04x; ob_state: $%04x;',0
[000a7075]                           dc.b 'ob_spec: (index: $%08lx);',0
[000a708f]                           dc.b 'ob_spec: (free_string: @%s);',0
[000a70ac]                           dc.b 'ob_x: %2d; ob_y: %2d; ob_width: %2d; ob_height: %2d))',0
[000a70e2]                           dc.b ',',$0d,$0a,$09,$09,0
[000a70e8]                           dc.b '(acs: (',0
[000a70f0]                           dc.b 'click: ',0
[000a70f8]                           dc.w $3b20
[000a70fa]                           dc.w $0064
[000a70fc]                           dc.b 'rag: ',0
[000a7102]                           dc.b 'ob_flags: $%04x; key: $%04x;',0
[000a711f]                           dc.b 'userp1: ',0
[000a7128]                           dc.b ';userp2: ',0
[000a7132]                           dc.b '; mo_index: %d; aob_type: %s))',0
[000a7151]                           dc.b 'ACS(',0
[000a7156]                           dc.b '%s: packed array [1..%ld] of char = ',0
[000a717b]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'TEDINFOS',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a7194]                           dc.b '%s: TEDINFO = ',$0d,$0a,$09,'(',$0d,$0a,$09,$09,'te_ptext: @%s; te_ptmplt: @%s; te_pvalid: @%s;',$0d,$0a,$09,$09,'te_font: %d; te_just: %d; te_color: $%04x; te_thickness: %d; te_txtlen: %ld; te_tmplen: %ld',$0d,$0a,$09,');',$0d,$0a,0
[000a723f]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'AUSERBLK',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a7258]                           dc.b '%s: AUSERBLK = (ub_code: %s; ub_parm: ',0
[000a727f]                           dc.b '$%s',0
[000a7283]                           dc.b '; ub_serv: ',0
[000a728f]                           dc.b '; ub_ptr1: ',0
[000a729b]                           dc.b '; ub_ptr2: ',0
[000a72a7]                           dc.b '; ub_ptr3: ',0
[000a72b3]                           dc.b '; bubble: ',0
[000a72be]                           dc.b '; context: ',0
[000a72ca]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'DATAS',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a72e0]                           dc.b '%-s: array [0..%ld] of WORD =',$0d,$0a,$09,'(',$0d,$0a,$09,$09,0
[000a7306]                           dc.b $0d,$0a,$0d,$0a,'(*',$09,$09,'WINDOWS',$09,$09,'*)',$0d,$0a,$0d,$0a,0
[000a731e]                           dc.b '%s: Awindow = ',$0d,$0a,$09,'(',$0d,$0a,0
[000a7333]                           dc.b $09,$09,'user: ',0
[000a733c]                           dc.b ';',$0d,$0a,$09,$09,'service: ',0
[000a734b]                           dc.b 'Awi_service',0
[000a7357]                           dc.b ';',$0d,$0a,$09,$09,'create: ',0
[000a7365]                           dc.b 'Awi_selfcreate',0
[000a7374]                           dc.b ';',$0d,$0a,$09,$09,'open: ',0
[000a7380]                           dc.b 'Awi_open',0
[000a7389]                           dc.b ';',$0d,$0a,$09,$09,'init: ',0
[000a7395]                           dc.b 'Awi_init',0
[000a739e]                           dc.b ';',$0d,$0a,$09,$09,'work: ',0
[000a73aa]                           dc.b ';',$0d,$0a,$09,$09,'toolbar: ',0
[000a73b9]                           dc.b ';',$0d,$0a,$09,$09,'ob_edit: -1; ob_col: -1; wi_id: -1;',0
[000a73e2]                           dc.b $0d,$0a,$09,$09,'wi_kind: $%04x; wi_act: (x: %2i; y: %2i; w: %2i; h: %2i);',0
[000a7420]                           dc.b $0d,$0a,$09,$09,'wi_slider: (x: -1; y: -1; w: -1; h: -1);',0
[000a744d]                           dc.b $0d,$0a,$09,$09,'snap_mask: $%04x;',0
[000a7463]                           dc.b $0d,$0a,$09,$09,'name: ',0
[000a746e]                           dc.b '; info: ',0
[000a7477]                           dc.b ';',$0d,$0a,$09,$09,'ob_len: $%04x; kind: $%04x; icon : -1',0
[000a74a2]                           dc.b ';',$0d,$0a,$09,$09,'iconblk: ',0
[000a74b1]                           dc.b ';',$0d,$0a,$09,$09,'menu: ',0
[000a74bd]                           dc.b ';',$0d,$0a,$09,$09,'keys: ',0
[000a74c9]                           dc.b 'Awi_keys',0
[000a74d2]                           dc.b ';',$0d,$0a,$09,$09,'obchange: ',0
[000a74e2]                           dc.b 'Awi_obchange',0
[000a74ef]                           dc.b ';',$0d,$0a,$09,$09,'redraw: ',0
[000a74fd]                           dc.b 'Awi_redraw',0
[000a7508]                           dc.b ';',$0d,$0a,$09,$09,'topped: ',0
[000a7516]                           dc.b 'Awi_topped',0
[000a7521]                           dc.b ';',$0d,$0a,$09,$09,'closed: ',0
[000a752f]                           dc.b 'Awi_closed',0
[000a753a]                           dc.b ';',$0d,$0a,$09,$09,'fulled: ',0
[000a7548]                           dc.b 'Awi_fulled',0
[000a7553]                           dc.b ';',$0d,$0a,$09,$09,'arrowed: ',0
[000a7562]                           dc.b 'Awi_arrowed',0
[000a756e]                           dc.b ';',$0d,$0a,$09,$09,'hslid: ',0
[000a757b]                           dc.b 'Awi_hslid',0
[000a7585]                           dc.b ';',$0d,$0a,$09,$09,'vslid: ',0
[000a7592]                           dc.b 'Awi_vslid',0
[000a759c]                           dc.b ';',$0d,$0a,$09,$09,'sized: ',0
[000a75a9]                           dc.b 'Awi_sized',0
[000a75b3]                           dc.b ';',$0d,$0a,$09,$09,'moved: ',0
[000a75c0]                           dc.b 'Awi_moved',0
[000a75ca]                           dc.w $2e49
[000a75cc]                           dc.w $0050
[000a75ce]                           dc.b 'ure PASCAL Code',0
[000a75de]                           dc.b $0d,$0a,'(*',$09,$09,'Platform & GUI-Language',$09,$09,'*)',$0d,$0a,0
[000a7602]                           dc.b '(*$DEFINE ACS_ATARI*)',$0d,$0a,0
[000a761a]                           dc.b '(*$DEFINE ACS_LANG%d*)',$0d,$0a,0
[000a7633]                           dc.b 'Const',$0d,$0a,0
[000a763b]                           dc.b $0d,$0a,'(*',$09,$09,'ALERT BOXES',$09,$09,'*)',$0d,$0a,0
[000a7653]                           dc.b $0d,$0a,'(*',$09,$09,'STRINGS',$09,$09,'*)',$0d,$0a,0
[000a7667]                           dc.b $0d,$0a,'(*',$09,$09,'MENU TREES',$09,$09,'*)',$0d,$0a,0
[000a767e]                           dc.b $0d,$0a,'(*',$09,$09,'POPUP TREES',$09,$09,'*)',$0d,$0a,0
[000a7696]                           dc.b $0d,$0a,'(*',$09,$09,'OBJECT TREES',$09,$09,'*)',$0d,$0a,0
[000a76af]                           dc.b $00
[000a76b0]                           dc.b '%-12s',0
[000a76b6]                           dc.b '&%-12s',0
[000a76bd]                           dc.b '&%-12s[3]',0
[000a76c7]                           dc.b 'ACS(',0
[000a76cc]                           dc.b '%s=#',0
[000a76d1]                           dc.b '#',$0d,$0a,0
[000a76d5]                           dc.b '.ST0',0
[000a76da]                           dc.b 'String-Export',0
[000a76e8]                           dc.b '[%s]',$0d,$0a,0
[000a76ef]                           dc.b 'GUI-LANGUAGE=ACS_LANG%d',$0d,$0a,0
[000a7709]                           dc.b $00
A_MISSENTRY:
[000a770a]                           dc.b '[3][ Objekteintrag | nicht vorhanden! ][ Abbruch ]',0
ERR_FILETYP:
[000a773d]                           dc.b '[3][ Falscher Dateityp!][ Abbruch ]',0
ERR_OPEN:
[000a7761]                           dc.b '[3][ | Konnte Datei '%s' | nicht finden oder es trat | ein Fehler beim ôffnen ein! | ][ Abbruch ]',0
ERR_TRANS:
[000a77c3]                           dc.b '[3][ Die Translationstabelle ist| Åbergelaufen! Bitte das ACS- | Modul in mehrere Module | aufteilen! ][ Abbruch ]',0
ERR_TYPE:
[000a7836]                           dc.b '[1][ Ein unzulÑssiger Objekttyp | wurde importiert!][ Abbruch ]',0
TEXT_002:
[000a7876]                           dc.w $004f
[000a7878]                           dc.w $4b00
TEXT_004:
[000a787a]                           dc.b 'Abbruch',0
TEXT_006:
[000a7882]                           dc.b '1234567890123456789012345678901',0
TEXT_01:
[000a78a2]                           dc.b 'Saving...',0
TEXT_02:
[000a78ac]                           dc.b 'Ausgabe:',0
TEXT_03:
[000a78b5]                           dc.b 'Datei:',0
TEXT_04:
[000a78bc]                           dc.b 'Liste:',0
TEXT_05:
[000a78c3]                           dc.b 'Object:',0
TEXT_07:
[000a78cb]                           dc.b '12345*12345',0
TEXT_10:
[000a78d7]                           dc.b $31
[000a78d8]                           dc.w $004e
[000a78da]                           dc.b 'ame:',0
al1_obj:
[000a78df]                           dc.b 'ML1-ALERT LIST',0
al2_obj:
[000a78ee]                           dc.b 'ML2-ALERT LIST',0
al3_obj:
[000a78fd]                           dc.b 'ML3-ALERT LIST',0
al_obj:
[000a790c]                           dc.b 'ALERT LIST',0
ic_obj:
[000a7917]                           dc.b 'ICON LIST',0
if_obj:
[000a7921]                           dc.b 'DATA LIST',0
im_obj:
[000a792b]                           dc.b 'IMAGE LIST',0
me_obj:
[000a7936]                           dc.b 'MENU LIST',0
mf_obj:
[000a7940]                           dc.b 'MOUSEFORM LIST',0
ml1_obj:
[000a794f]                           dc.b 'ML1-TEXT LIST',0
ml2_obj:
[000a795d]                           dc.b 'ML2-TEXT LIST',0
ml3_obj:
[000a796b]                           dc.b 'ML3-TEXT LIST',0
ob_obj:
[000a7979]                           dc.b 'OBJECTTREE LIST',0
pu_obj:
[000a7989]                           dc.b 'POPUP LIST',0
rf_obj:
[000a7994]                           dc.b 'REFERENCE LIST',0
st_obj:
[000a79a3]                           dc.b 'TEXT LIST',0
te_obj:
[000a79ad]                           dc.b 'TEDINFO LIST',0
us_obj:
[000a79ba]                           dc.b 'USERBLK LIST',0
wi_obj:
[000a79c7]                           dc.b 'WINDOW LIST',0
[000a79d3]                           dc.b $00
[000a79d4] 000a78a2                  dc.l TEXT_01
[000a79d8] 000a7876                  dc.l TEXT_002
[000a79dc] 000a7876                  dc.l TEXT_002
[000a79e0]                           dc.w $0003
[000a79e2]                           dc.w $0006
[000a79e4]                           dc.w $0002
[000a79e6]                           dc.w $1071
[000a79e8]                           dc.w $0000
[000a79ea]                           dc.w $0000
[000a79ec]                           dc.w $000a
[000a79ee]                           dc.w $0001
TEDINFO_02:
[000a79f0] 000a78cb                  dc.l TEXT_07
[000a79f4] 000a7876                  dc.l TEXT_002
[000a79f8] 000a7876                  dc.l TEXT_002
[000a79fc]                           dc.w $0003
[000a79fe]                           dc.w $0006
[000a7a00]                           dc.w $0002
[000a7a02]                           dc.w $1100
[000a7a04]                           dc.w $0000
[000a7a06]                           dc.w $0000
[000a7a08]                           dc.w $000c
[000a7a0a]                           dc.w $0001
TEDINFO_064:
[000a7a0c] 000a7882                  dc.l TEXT_006
[000a7a10] 000a7876                  dc.l TEXT_002
[000a7a14] 000a7876                  dc.l TEXT_002
[000a7a18]                           dc.w $0003
[000a7a1a]                           dc.w $0006
[000a7a1c]                           dc.w $0000
[000a7a1e]                           dc.w $11f0
[000a7a20]                           dc.w $0000
[000a7a22]                           dc.w $0000
[000a7a24]                           dc.w $0020
[000a7a26]                           dc.w $0001
A_3DBUTTON01:
[000a7a28] 00064a22                  dc.l A_3Dbutton
[000a7a2c]                           dc.w $a021
[000a7a2e]                           dc.w $91f8
[000a7a30] 000630f2                  dc.l Auo_string
[000a7a34]                           dc.w $0000
[000a7a36]                           dc.w $0000
[000a7a38]                           dc.w $0000
[000a7a3a]                           dc.w $0000
[000a7a3c]                           dc.w $0000
[000a7a3e]                           dc.w $0000
[000a7a40]                           dc.w $0000
[000a7a42]                           dc.w $0000
[000a7a44]                           dc.w $0000
[000a7a46]                           dc.w $0000
A_3DBUTTON02:
[000a7a48] 00064a22                  dc.l A_3Dbutton
[000a7a4c]                           dc.w $29c1
[000a7a4e]                           dc.w $0178
[000a7a50] 000630f2                  dc.l Auo_string
[000a7a54] 000a7877                  dc.l TEXT_003
[000a7a58]                           dc.w $0000
[000a7a5a]                           dc.w $0000
[000a7a5c]                           dc.w $0000
[000a7a5e]                           dc.w $0000
[000a7a60]                           dc.w $0000
[000a7a62]                           dc.w $0000
[000a7a64]                           dc.w $0000
[000a7a66]                           dc.w $0000
A_3DBUTTON03:
[000a7a68] 00064a22                  dc.l A_3Dbutton
[000a7a6c]                           dc.w $29f1
[000a7a6e]                           dc.w $01f8
[000a7a70] 000630f2                  dc.l Auo_string
[000a7a74]                           dc.w $0000
[000a7a76]                           dc.w $0000
[000a7a78]                           dc.w $0000
[000a7a7a]                           dc.w $0000
[000a7a7c]                           dc.w $0000
[000a7a7e]                           dc.w $0000
[000a7a80]                           dc.w $0000
[000a7a82]                           dc.w $0000
[000a7a84]                           dc.w $0000
[000a7a86]                           dc.w $0000
A_3DBUTTON05:
[000a7a88] 00064a22                  dc.l A_3Dbutton
[000a7a8c]                           dc.w $29c1
[000a7a8e]                           dc.w $0178
[000a7a90] 000630f2                  dc.l Auo_string
[000a7a94] 000a787a                  dc.l TEXT_004
[000a7a98]                           dc.w $0000
[000a7a9a]                           dc.w $0000
[000a7a9c]                           dc.w $0000
[000a7a9e]                           dc.w $0000
[000a7aa0]                           dc.w $0000
[000a7aa2]                           dc.w $0000
[000a7aa4]                           dc.w $0000
[000a7aa6]                           dc.w $0000
A_BOXED02:
[000a7aa8] 0006afea                  dc.l A_boxed
[000a7aac]                           dc.w $9038
[000a7aae]                           dc.w $1f12
[000a7ab0] 0006a068                  dc.l Auo_boxed
[000a7ab4]                           dc.w $0000
[000a7ab6]                           dc.w $0000
[000a7ab8]                           dc.w $0000
[000a7aba]                           dc.w $0000
[000a7abc]                           dc.w $0000
[000a7abe]                           dc.w $0000
[000a7ac0]                           dc.w $0000
[000a7ac2]                           dc.w $0000
[000a7ac4]                           dc.w $0000
[000a7ac6]                           dc.w $0000
A_INNERFRAME02:
[000a7ac8] 00064256                  dc.l A_innerframe
[000a7acc]                           dc.w $1800
[000a7ace]                           dc.w $8f19
[000a7ad0] 000630f2                  dc.l Auo_string
[000a7ad4] 000a78d9                  dc.l TEXT_191
[000a7ad8]                           dc.w $0000
[000a7ada]                           dc.w $0000
[000a7adc]                           dc.w $0000
[000a7ade]                           dc.w $0000
[000a7ae0]                           dc.w $0000
[000a7ae2]                           dc.w $0000
[000a7ae4]                           dc.w $0000
[000a7ae6]                           dc.w $0000
_IMG_IM_SORT_XY:
[000a7ae8]                           dc.w $0000
[000a7aea]                           dc.w $0000
[000a7aec]                           dc.w $0000
[000a7aee]                           dc.w $0000
[000a7af0]                           dc.w $0000
[000a7af2]                           dc.w $0000
[000a7af4]                           dc.w $08ff
[000a7af6]                           dc.w $e04f
[000a7af8]                           dc.w $fe38
[000a7afa]                           dc.w $08ff
[000a7afc]                           dc.w $e02f
[000a7afe]                           dc.w $fe08
[000a7b00]                           dc.w $08ff
[000a7b02]                           dc.w $ffff
[000a7b04]                           dc.w $fe38
[000a7b06]                           dc.w $08ff
[000a7b08]                           dc.w $e02f
[000a7b0a]                           dc.w $fe20
[000a7b0c]                           dc.w $08ff
[000a7b0e]                           dc.w $e04f
[000a7b10]                           dc.w $fe38
[000a7b12]                           dc.w $0000
[000a7b14]                           dc.w $0000
[000a7b16]                           dc.w $4000
[000a7b18]                           dc.w $0000
[000a7b1a]                           dc.w $0000
[000a7b1c]                           dc.w $4000
[000a7b1e]                           dc.w $0007
[000a7b20]                           dc.w $ffff
[000a7b22]                           dc.w $c000
[000a7b24]                           dc.w $0015
[000a7b26]                           dc.w $0000
[000a7b28]                           dc.w $0000
[000a7b2a]                           dc.w $000e
[000a7b2c]                           dc.w $0000
[000a7b2e]                           dc.w $0000
[000a7b30]                           dc.w $0004
[000a7b32]                           dc.w $0000
[000a7b34]                           dc.w $0000
[000a7b36]                           dc.w $1cff
[000a7b38]                           dc.w $e04f
[000a7b3a]                           dc.w $fe20
[000a7b3c]                           dc.w $04ff
[000a7b3e]                           dc.w $e02f
[000a7b40]                           dc.w $fe28
[000a7b42]                           dc.w $0cff
[000a7b44]                           dc.w $ffff
[000a7b46]                           dc.w $fe38
[000a7b48]                           dc.w $04ff
[000a7b4a]                           dc.w $e02f
[000a7b4c]                           dc.w $fe08
[000a7b4e]                           dc.w $1cff
[000a7b50]                           dc.w $e04f
[000a7b52]                           dc.w $fe08
[000a7b54]                           dc.w $0000
[000a7b56]                           dc.w $0000
[000a7b58]                           dc.w $4000
[000a7b5a]                           dc.w $0000
[000a7b5c]                           dc.w $0000
[000a7b5e]                           dc.w $4000
[000a7b60]                           dc.w $0007
[000a7b62]                           dc.w $ffff
[000a7b64]                           dc.w $c000
[000a7b66]                           dc.w $0015
[000a7b68]                           dc.w $0000
[000a7b6a]                           dc.w $0000
[000a7b6c]                           dc.w $000e
[000a7b6e]                           dc.w $0000
[000a7b70]                           dc.w $0000
[000a7b72]                           dc.w $0004
[000a7b74]                           dc.w $0000
[000a7b76]                           dc.w $0000
[000a7b78]                           dc.w $1cff
[000a7b7a]                           dc.w $e04f
[000a7b7c]                           dc.w $fe10
[000a7b7e]                           dc.w $10ff
[000a7b80]                           dc.w $e02f
[000a7b82]                           dc.w $fe20
[000a7b84]                           dc.w $1cff
[000a7b86]                           dc.w $ffff
[000a7b88]                           dc.w $fe38
[000a7b8a]                           dc.w $04ff
[000a7b8c]                           dc.w $e02f
[000a7b8e]                           dc.w $fe28
[000a7b90]                           dc.w $1cff
[000a7b92]                           dc.w $e04f
[000a7b94]                           dc.w $fe38
[000a7b96]                           dc.w $0000
[000a7b98]                           dc.w $0000
[000a7b9a]                           dc.w $0000
[000a7b9c]                           dc.w $0000
[000a7b9e]                           dc.w $0000
[000a7ba0]                           dc.w $0000
[000a7ba2]                           dc.w $0000
[000a7ba4]                           dc.w $0000
[000a7ba6]                           dc.w $0000
IM_SORT_XY:
[000a7ba8] 000a7ae8                  dc.l _IMG_IM_SORT_XY
[000a7bac]                           dc.w $0006
[000a7bae]                           dc.w $0020
[000a7bb0]                           dc.w $0000
[000a7bb2]                           dc.w $0000
[000a7bb4]                           dc.w $0001
_IMG_IM_SORT_YX:
[000a7bb6]                           dc.w $0000
[000a7bb8]                           dc.w $0000
[000a7bba]                           dc.w $0000
[000a7bbc]                           dc.w $0000
[000a7bbe]                           dc.w $0000
[000a7bc0]                           dc.w $0000
[000a7bc2]                           dc.w $08ff
[000a7bc4]                           dc.w $e04f
[000a7bc6]                           dc.w $fe20
[000a7bc8]                           dc.w $08ff
[000a7bca]                           dc.w $e02f
[000a7bcc]                           dc.w $fe28
[000a7bce]                           dc.w $08ff
[000a7bd0]                           dc.w $e1ff
[000a7bd2]                           dc.w $fe38
[000a7bd4]                           dc.w $08ff
[000a7bd6]                           dc.w $e12f
[000a7bd8]                           dc.w $fe08
[000a7bda]                           dc.w $08ff
[000a7bdc]                           dc.w $e14f
[000a7bde]                           dc.w $fe08
[000a7be0]                           dc.w $0004
[000a7be2]                           dc.w $0100
[000a7be4]                           dc.w $4000
[000a7be6]                           dc.w $0004
[000a7be8]                           dc.w $0100
[000a7bea]                           dc.w $4000
[000a7bec]                           dc.w $0004
[000a7bee]                           dc.w $0100
[000a7bf0]                           dc.w $4000
[000a7bf2]                           dc.w $0015
[000a7bf4]                           dc.w $0101
[000a7bf6]                           dc.w $5000
[000a7bf8]                           dc.w $000e
[000a7bfa]                           dc.w $0100
[000a7bfc]                           dc.w $e000
[000a7bfe]                           dc.w $0004
[000a7c00]                           dc.w $0100
[000a7c02]                           dc.w $4000
[000a7c04]                           dc.w $1cff
[000a7c06]                           dc.w $e10f
[000a7c08]                           dc.w $fe38
[000a7c0a]                           dc.w $04ff
[000a7c0c]                           dc.w $e10f
[000a7c0e]                           dc.w $fe20
[000a7c10]                           dc.w $1cff
[000a7c12]                           dc.w $e10f
[000a7c14]                           dc.w $fe38
[000a7c16]                           dc.w $10ff
[000a7c18]                           dc.w $e10f
[000a7c1a]                           dc.w $fe08
[000a7c1c]                           dc.w $1cff
[000a7c1e]                           dc.w $e10f
[000a7c20]                           dc.w $fe38
[000a7c22]                           dc.w $0004
[000a7c24]                           dc.w $0100
[000a7c26]                           dc.w $4000
[000a7c28]                           dc.w $0004
[000a7c2a]                           dc.w $0100
[000a7c2c]                           dc.w $4000
[000a7c2e]                           dc.w $0004
[000a7c30]                           dc.w $0100
[000a7c32]                           dc.w $4000
[000a7c34]                           dc.w $0015
[000a7c36]                           dc.w $0101
[000a7c38]                           dc.w $5000
[000a7c3a]                           dc.w $000e
[000a7c3c]                           dc.w $0100
[000a7c3e]                           dc.w $e000
[000a7c40]                           dc.w $0004
[000a7c42]                           dc.w $0100
[000a7c44]                           dc.w $4000
[000a7c46]                           dc.w $1cff
[000a7c48]                           dc.w $e10f
[000a7c4a]                           dc.w $fe10
[000a7c4c]                           dc.w $04ff
[000a7c4e]                           dc.w $e10f
[000a7c50]                           dc.w $fe20
[000a7c52]                           dc.w $0cff
[000a7c54]                           dc.w $ff0f
[000a7c56]                           dc.w $fe38
[000a7c58]                           dc.w $04ff
[000a7c5a]                           dc.w $e00f
[000a7c5c]                           dc.w $fe28
[000a7c5e]                           dc.w $1cff
[000a7c60]                           dc.w $e00f
[000a7c62]                           dc.w $fe38
[000a7c64]                           dc.w $0000
[000a7c66]                           dc.w $0000
[000a7c68]                           dc.w $0000
[000a7c6a]                           dc.w $0000
[000a7c6c]                           dc.w $0000
[000a7c6e]                           dc.w $0000
[000a7c70]                           dc.w $0000
[000a7c72]                           dc.w $0000
[000a7c74]                           dc.w $0000
IM_SORT_YX:
[000a7c76] 000a7bb6                  dc.l _IMG_IM_SORT_YX
[000a7c7a]                           dc.w $0006
[000a7c7c]                           dc.w $0020
[000a7c7e]                           dc.w $0000
[000a7c80]                           dc.w $0000
[000a7c82]                           dc.w $0001
_IMG_SUNRISE:
[000a7c84]                           dc.w $0000
[000a7c86]                           dc.w $0000
[000a7c88]                           dc.w $0000
[000a7c8a]                           dc.w $0000
[000a7c8c]                           dc.w $2110
[000a7c8e]                           dc.w $0000
[000a7c90]                           dc.w $0000
[000a7c92]                           dc.w $2110
[000a7c94]                           dc.w $3700
[000a7c96]                           dc.w $0001
[000a7c98]                           dc.w $1020
[000a7c9a]                           dc.w $4880
[000a7c9c]                           dc.w $6c00
[000a7c9e]                           dc.w $8782
[000a7ca0]                           dc.w $3700
[000a7ca2]                           dc.w $1000
[000a7ca4]                           dc.w $1864
[000a7ca6]                           dc.w $0000
[000a7ca8]                           dc.w $000c
[000a7caa]                           dc.w $2010
[000a7cac]                           dc.w $c000
[000a7cae]                           dc.w $0002
[000a7cb0]                           dc.w $4009
[000a7cb2]                           dc.w $0000
[000a7cb4]                           dc.w $0000
[000a7cb6]                           dc.w $4008
[000a7cb8]                           dc.w $0000
[000a7cba]                           dc.w $0000
[000a7cbc]                           dc.w $8004
[000a7cbe]                           dc.w $0000
[000a7cc0]                           dc.w $000e
[000a7cc2]                           dc.w $8005
[000a7cc4]                           dc.w $c000
[000a7cc6]                           dc.w $0000
[000a7cc8]                           dc.w $8004
[000a7cca]                           dc.w $0000
[000a7ccc]                           dc.w $0000
[000a7cce]                           dc.w $8004
[000a7cd0]                           dc.w $0000
[000a7cd2]                           dc.w $3f1c
[000a7cd4]                           dc.w $7878
[000a7cd6]                           dc.w $70f0
[000a7cd8]                           dc.w $00e3
[000a7cda]                           dc.w $8787
[000a7cdc]                           dc.w $8f0c
[000a7cde]                           dc.w $fe18
[000a7ce0]                           dc.w $0000
[000a7ce2]                           dc.w $0000
[000a7ce4]                           dc.w $01e7
[000a7ce6]                           dc.b '8p<`',0
[000a7ceb]                           dc.b $00
[000a7cec]                           dc.w $0787
[000a7cee]                           dc.w $c39f
[000a7cf0]                           dc.w $fe1c
[000a7cf2]                           dc.w $0000
[000a7cf4]                           dc.w $0000
[000a7cf6]                           dc.w $01e3
[000a7cf8]                           dc.w $9ce0
[000a7cfa]                           dc.w $e1e0
[000a7cfc]                           dc.w $0000
[000a7cfe]                           dc.w $030f
[000a7d00]                           dc.w $1e1f
[000a7d02]                           dc.w $0f07
[000a7d04]                           dc.w $e000
[000a7d06]                           dc.w $70c0
[000a7d08]                           dc.w $30f8
[000a7d0a]                           dc.w $0ccf
[000a7d0c]                           dc.w $8f3c
[000a7d0e]                           dc.w $0000
[000a7d10]                           dc.w $0300
[000a7d12]                           dc.w $0000
SUNRISE:
[000a7d14] 000a7c84                  dc.l _IMG_SUNRISE
[000a7d18]                           dc.w $0006
[000a7d1a]                           dc.w $0018
[000a7d1c]                           dc.w $0000
[000a7d1e]                           dc.w $0000
[000a7d20]                           dc.w $0001
INFO_OB_WH:
[000a7d22]                           dc.w $ffff
[000a7d24]                           dc.w $0001
[000a7d26]                           dc.w $0002
[000a7d28]                           dc.w $0014
[000a7d2a]                           dc.w $0000
[000a7d2c]                           dc.w $0000
[000a7d2e]                           dc.w $0001
[000a7d30]                           dc.w $1101
[000a7d32]                           dc.w $0000
[000a7d34]                           dc.w $0000
[000a7d36]                           dc.w $000b
[000a7d38]                           dc.w $0002
_01_INFO_OB_WH:
[000a7d3a]                           dc.w $0002
[000a7d3c]                           dc.w $ffff
[000a7d3e]                           dc.w $ffff
[000a7d40]                           dc.w $0015
[000a7d42]                           dc.w $0000
[000a7d44]                           dc.w $0000
[000a7d46] 000a79f0                  dc.l TEDINFO_02
[000a7d4a]                           dc.w $0000
[000a7d4c]                           dc.w $0000
[000a7d4e]                           dc.w $000b
[000a7d50]                           dc.w $0001
_02_INFO_OB_WH:
[000a7d52]                           dc.w $0000
[000a7d54]                           dc.w $ffff
[000a7d56]                           dc.w $ffff
[000a7d58]                           dc.w $0015
[000a7d5a]                           dc.w $0020
[000a7d5c]                           dc.w $0000
[000a7d5e] 000a79f0                  dc.l TEDINFO_02
[000a7d62]                           dc.w $0000
[000a7d64]                           dc.w $0001
[000a7d66]                           dc.w $000b
[000a7d68]                           dc.w $0001
NEW2_LABEL:
[000a7d6a]                           dc.w $ffff
[000a7d6c]                           dc.w $0001
[000a7d6e]                           dc.w $0005
[000a7d70]                           dc.w $0018
[000a7d72]                           dc.w $0000
[000a7d74]                           dc.w $0010
[000a7d76] 000a7a68                  dc.l A_3DBUTTON03
[000a7d7a]                           dc.w $0000
[000a7d7c]                           dc.w $0000
[000a7d7e]                           dc.w $0024
[000a7d80]                           dc.w $0006
_01_NEW2_LABEL:
[000a7d82]                           dc.w $0003
[000a7d84]                           dc.w $0002
[000a7d86]                           dc.w $0002
[000a7d88]                           dc.w $0018
[000a7d8a]                           dc.w $0040
[000a7d8c]                           dc.w $0000
[000a7d8e] 000a7ac8                  dc.l A_INNERFRAME02
[000a7d92]                           dc.w $0001
[000a7d94]                           dc.w $0000
[000a7d96]                           dc.w $0022
[000a7d98]                           dc.w $0003
_02_NEW2_LABEL:
[000a7d9a]                           dc.w $0001
[000a7d9c]                           dc.w $ffff
[000a7d9e]                           dc.w $ffff
[000a7da0]                           dc.w $0018
[000a7da2]                           dc.w $0008
[000a7da4]                           dc.w $0010
[000a7da6] 000a7aa8                  dc.l A_BOXED02
[000a7daa]                           dc.w $0001
[000a7dac]                           dc.w $0001
[000a7dae]                           dc.w $0020
[000a7db0]                           dc.w $0001
_03_NEW2_LABEL:
[000a7db2]                           dc.w $0005
[000a7db4]                           dc.w $ffff
[000a7db6]                           dc.w $ffff
[000a7db8]                           dc.w $0018
[000a7dba]                           dc.w $4007
[000a7dbc]                           dc.w $0010
[000a7dbe] 000a7a48                  dc.l A_3DBUTTON02
[000a7dc2]                           dc.w $0004
[000a7dc4]                           dc.w $0003
[000a7dc6]                           dc.w $000c
[000a7dc8]                           dc.w $0002
_03aNEW2_LABEL:
[000a7dca]                           dc.w $0000
[000a7dcc]                           dc.w $0000
[000a7dce]                           dc.w $0000
[000a7dd0]                           dc.w $0000
[000a7dd2]                           dc.w $8000
[000a7dd4]                           dc.w $884f
[000a7dd6]                           dc.w $0000
[000a7dd8]                           dc.w $0000
[000a7dda]                           dc.w $0000
[000a7ddc]                           dc.w $0000
[000a7dde]                           dc.w $0000
[000a7de0]                           dc.w $0000
_05_NEW2_LABEL:
[000a7de2]                           dc.w $0000
[000a7de4]                           dc.w $ffff
[000a7de6]                           dc.w $ffff
[000a7de8]                           dc.w $0018
[000a7dea]                           dc.w $4005
[000a7dec]                           dc.w $0010
[000a7dee] 000a7a88                  dc.l A_3DBUTTON05
[000a7df2]                           dc.w $0013
[000a7df4]                           dc.w $0003
[000a7df6]                           dc.w $000c
[000a7df8]                           dc.w $0002
_05aNEW2_LABEL:
[000a7dfa]                           dc.w $0000
[000a7dfc]                           dc.w $0000
[000a7dfe]                           dc.w $0000
[000a7e00]                           dc.w $0000
[000a7e02]                           dc.w $8020
[000a7e04]                           dc.w $8841
[000a7e06]                           dc.w $0000
[000a7e08]                           dc.w $0000
[000a7e0a]                           dc.w $0000
[000a7e0c]                           dc.w $0000
[000a7e0e]                           dc.w $0000
[000a7e10]                           dc.w $0000
NEW_LABEL:
[000a7e12]                           dc.w $ffff
[000a7e14]                           dc.w $0001
[000a7e16]                           dc.w $0003
[000a7e18]                           dc.w $0018
[000a7e1a]                           dc.w $0000
[000a7e1c]                           dc.w $0010
[000a7e1e] 000a7a68                  dc.l A_3DBUTTON03
[000a7e22]                           dc.w $0000
[000a7e24]                           dc.w $0000
[000a7e26]                           dc.w $0024
[000a7e28]                           dc.w $0006
_01_NEW_LABEL:
[000a7e2a]                           dc.w $0003
[000a7e2c]                           dc.w $0002
[000a7e2e]                           dc.w $0002
[000a7e30]                           dc.w $0018
[000a7e32]                           dc.w $0040
[000a7e34]                           dc.w $0000
[000a7e36] 000a7ac8                  dc.l A_INNERFRAME02
[000a7e3a]                           dc.w $0001
[000a7e3c]                           dc.w $0000
[000a7e3e]                           dc.w $0022
[000a7e40]                           dc.w $0003
_02_NEW_LABEL:
[000a7e42]                           dc.w $0001
[000a7e44]                           dc.w $ffff
[000a7e46]                           dc.w $ffff
[000a7e48]                           dc.w $0018
[000a7e4a]                           dc.w $0008
[000a7e4c]                           dc.w $0010
[000a7e4e] 000a7aa8                  dc.l A_BOXED02
[000a7e52]                           dc.w $0001
[000a7e54]                           dc.w $0001
[000a7e56]                           dc.w $001f
[000a7e58]                           dc.w $0001
_03_NEW_LABEL:
[000a7e5a]                           dc.w $0000
[000a7e5c]                           dc.w $ffff
[000a7e5e]                           dc.w $ffff
[000a7e60]                           dc.w $0018
[000a7e62]                           dc.w $4007
[000a7e64]                           dc.w $0010
[000a7e66] 000a7a48                  dc.l A_3DBUTTON02
[000a7e6a]                           dc.w $000c
[000a7e6c]                           dc.w $0003
[000a7e6e]                           dc.w $000c
[000a7e70]                           dc.w $0002
_03aNEW_LABEL:
[000a7e72] 00016172                  dc.l chk_new_label
[000a7e76]                           dc.w $0000
[000a7e78]                           dc.w $0000
[000a7e7a]                           dc.w $8020
[000a7e7c]                           dc.w $884f
[000a7e7e]                           dc.w $0000
[000a7e80]                           dc.w $0000
[000a7e82]                           dc.w $0000
[000a7e84]                           dc.w $0000
[000a7e86]                           dc.w $0000
[000a7e88]                           dc.w $0000
OUTPUT_INFO:
[000a7e8a]                           dc.w $ffff
[000a7e8c]                           dc.w $0001
[000a7e8e]                           dc.w $0001
[000a7e90]                           dc.w $0014
[000a7e92]                           dc.w $0000
[000a7e94]                           dc.w $0000
[000a7e96]                           dc.w $00ff
[000a7e98]                           dc.w $1178
[000a7e9a]                           dc.w $0000
[000a7e9c]                           dc.w $0000
[000a7e9e]                           dc.w $002c
[000a7ea0]                           dc.w $000b
_01_OUTPUT_INFO:
[000a7ea2]                           dc.w $0000
[000a7ea4]                           dc.w $0002
[000a7ea6]                           dc.w $0004
[000a7ea8]                           dc.w $0018
[000a7eaa]                           dc.w $0000
[000a7eac]                           dc.w $0010
[000a7eae] 000a7a68                  dc.l A_3DBUTTON03
[000a7eb2]                           dc.w $0000
[000a7eb4]                           dc.w $0000
[000a7eb6]                           dc.w $002c
[000a7eb8]                           dc.w $000b
_02_OUTPUT_INFO:
[000a7eba]                           dc.w $0004
[000a7ebc]                           dc.w $0003
[000a7ebe]                           dc.w $0003
[000a7ec0]                           dc.w $0018
[000a7ec2]                           dc.w $0000
[000a7ec4]                           dc.w $0010
[000a7ec6] 000a7a28                  dc.l A_3DBUTTON01
[000a7eca]                           dc.w $0002
[000a7ecc]                           dc.w $0001
[000a7ece]                           dc.w $0028
[000a7ed0]                           dc.w $0001
_03_OUTPUT_INFO:
[000a7ed2]                           dc.w $0002
[000a7ed4]                           dc.w $ffff
[000a7ed6]                           dc.w $ffff
[000a7ed8]                           dc.w $0016
[000a7eda]                           dc.w $0000
[000a7edc]                           dc.w $0500
[000a7ede] 000a79d4                  dc.l TEDINFO_01
[000a7ee2]                           dc.w $0000
[000a7ee4]                           dc.w $0000
[000a7ee6]                           dc.w $0028
[000a7ee8]                           dc.w $0001
_04_OUTPUT_INFO:
[000a7eea]                           dc.w $0001
[000a7eec]                           dc.w $0005
[000a7eee]                           dc.w $000c
[000a7ef0]                           dc.w $0018
[000a7ef2]                           dc.w $0000
[000a7ef4]                           dc.w $0010
[000a7ef6] 000a7a28                  dc.l A_3DBUTTON01
[000a7efa]                           dc.w $0002
[000a7efc]                           dc.w $0003
[000a7efe]                           dc.w $0028
[000a7f00]                           dc.w $0007
_05_OUTPUT_INFO:
[000a7f02]                           dc.w $0006
[000a7f04]                           dc.w $ffff
[000a7f06]                           dc.w $ffff
[000a7f08]                           dc.w $001c
[000a7f0a]                           dc.w $0000
[000a7f0c]                           dc.w $0000
[000a7f0e] 000a78ac                  dc.l TEXT_02
[000a7f12]                           dc.w $0000
[000a7f14]                           dc.w $0000
[000a7f16]                           dc.w $0008
[000a7f18]                           dc.w $0001
_06_OUTPUT_INFO:
[000a7f1a]                           dc.w $0007
[000a7f1c]                           dc.w $ffff
[000a7f1e]                           dc.w $ffff
[000a7f20]                           dc.w $0016
[000a7f22]                           dc.w $0000
[000a7f24]                           dc.w $0000
[000a7f26] 000a7a0c                  dc.l TEDINFO_064
[000a7f2a]                           dc.w $0009
[000a7f2c]                           dc.w $0000
[000a7f2e]                           dc.w $001f
[000a7f30]                           dc.w $0001
_07_OUTPUT_INFO:
[000a7f32]                           dc.w $0008
[000a7f34]                           dc.w $ffff
[000a7f36]                           dc.w $ffff
[000a7f38]                           dc.w $001c
[000a7f3a]                           dc.w $0000
[000a7f3c]                           dc.w $0000
[000a7f3e] 000a78b5                  dc.l TEXT_03
[000a7f42]                           dc.w $0000
[000a7f44]                           dc.w $0002
[000a7f46]                           dc.w $0006
[000a7f48]                           dc.w $0001
_08_OUTPUT_INFO:
[000a7f4a]                           dc.w $0009
[000a7f4c]                           dc.w $ffff
[000a7f4e]                           dc.w $ffff
[000a7f50]                           dc.w $0016
[000a7f52]                           dc.w $0000
[000a7f54]                           dc.w $0000
[000a7f56] 000a7a0c                  dc.l TEDINFO_064
[000a7f5a]                           dc.w $0009
[000a7f5c]                           dc.w $0002
[000a7f5e]                           dc.w $001f
[000a7f60]                           dc.w $0001
_09_OUTPUT_INFO:
[000a7f62]                           dc.w $000a
[000a7f64]                           dc.w $ffff
[000a7f66]                           dc.w $ffff
[000a7f68]                           dc.w $001c
[000a7f6a]                           dc.w $0000
[000a7f6c]                           dc.w $0000
[000a7f6e] 000a78bc                  dc.l TEXT_04
[000a7f72]                           dc.w $0000
[000a7f74]                           dc.w $0004
[000a7f76]                           dc.w $0006
[000a7f78]                           dc.w $0001
_10_OUTPUT_INFO:
[000a7f7a]                           dc.w $000b
[000a7f7c]                           dc.w $ffff
[000a7f7e]                           dc.w $ffff
[000a7f80]                           dc.w $0016
[000a7f82]                           dc.w $0000
[000a7f84]                           dc.w $0000
[000a7f86] 000a7a0c                  dc.l TEDINFO_064
[000a7f8a]                           dc.w $0009
[000a7f8c]                           dc.w $0004
[000a7f8e]                           dc.w $001f
[000a7f90]                           dc.w $0001
_11_OUTPUT_INFO:
[000a7f92]                           dc.w $000c
[000a7f94]                           dc.w $ffff
[000a7f96]                           dc.w $ffff
[000a7f98]                           dc.w $001c
[000a7f9a]                           dc.w $0000
[000a7f9c]                           dc.w $0000
[000a7f9e] 000a78c3                  dc.l TEXT_05
[000a7fa2]                           dc.w $0000
[000a7fa4]                           dc.w $0006
[000a7fa6]                           dc.w $0007
[000a7fa8]                           dc.w $0001
_12_OUTPUT_INFO:
[000a7faa]                           dc.w $0004
[000a7fac]                           dc.w $ffff
[000a7fae]                           dc.w $ffff
[000a7fb0]                           dc.w $0016
[000a7fb2]                           dc.w $0020
[000a7fb4]                           dc.w $0000
[000a7fb6] 000a7a0c                  dc.l TEDINFO_064
[000a7fba]                           dc.w $0009
[000a7fbc]                           dc.w $0006
[000a7fbe]                           dc.w $001f
[000a7fc0]                           dc.w $0001
WI_NEW2_LABEL:
[000a7fc2]                           dc.w $0000
[000a7fc4]                           dc.w $0000
[000a7fc6] 00059dd0                  dc.l Awi_service
[000a7fca] 00056c16                  dc.l Awi_selfcreate
[000a7fce] 00057428                  dc.l Awi_open
[000a7fd2] 00055e94                  dc.l Awi_init
[000a7fd6] 000a7d6a                  dc.l NEW2_LABEL
[000a7fda]                           dc.w $0000
[000a7fdc]                           dc.w $0000
[000a7fde]                           dc.w $0000
[000a7fe0]                           dc.w $0000
[000a7fe2]                           dc.w $ffff
[000a7fe4]                           dc.w $000b
[000a7fe6]                           dc.w $0000
[000a7fe8]                           dc.w $0000
[000a7fea]                           dc.w $0078
[000a7fec]                           dc.w $0032
[000a7fee]                           dc.w $0000
[000a7ff0]                           dc.w $0000
[000a7ff2]                           dc.w $0000
[000a7ff4]                           dc.w $0000
[000a7ff6]                           dc.w $0000
[000a7ff8]                           dc.w $0000
[000a7ffa]                           dc.w $0000
[000a7ffc]                           dc.w $0000
[000a7ffe]                           dc.w $ffff
[000a8000]                           dc.w $ffff
[000a8002]                           dc.w $ffff
[000a8004]                           dc.w $ffff
[000a8006]                           dc.w $0000
[000a8008]                           dc.w $0000
[000a800a]                           dc.w $f8f8
[000a800c] 000a78d7                  dc.l TEXT_10
[000a8010] 000a7876                  dc.l TEXT_002
[000a8014]                           dc.w $2710
[000a8016]                           dc.w $0000
[000a8018]                           dc.w $0000
[000a801a]                           dc.w $ffff
[000a801c]                           dc.w $0000
[000a801e]                           dc.w $0000
[000a8020]                           dc.w $0000
[000a8022]                           dc.w $0000
[000a8024] 0006b744                  dc.l Awi_keys
[000a8028] 00051852                  dc.l Awi_obchange
[000a802c] 00051c46                  dc.l Awi_redraw
[000a8030] 000587a4                  dc.l Awi_topped
[000a8034] 00058362                  dc.l Awi_closed
[000a8038] 000587ec                  dc.l Awi_fulled
[000a803c] 0005217c                  dc.l Awi_arrowed
[000a8040] 000524b4                  dc.l Awi_hslid
[000a8044] 0005255e                  dc.l Awi_vslid
[000a8048] 00058bb0                  dc.l Awi_sized
[000a804c] 00058d50                  dc.l Awi_moved
[000a8050] 0005998a                  dc.l Awi_iconify
[000a8054] 00059c6c                  dc.l Awi_uniconify
[000a8058] 0005b5b6                  dc.l Awi_gemscript
[000a805c]                           dc.w $0000
[000a805e]                           dc.w $0000
[000a8060]                           dc.w $0000
[000a8062]                           dc.w $0000
WI_NEW_LABEL:
[000a8064]                           dc.w $0000
[000a8066]                           dc.w $0000
[000a8068] 00059dd0                  dc.l Awi_service
[000a806c] 00056c16                  dc.l Awi_selfcreate
[000a8070] 00057428                  dc.l Awi_open
[000a8074] 00055e94                  dc.l Awi_init
[000a8078] 000a7e12                  dc.l NEW_LABEL
[000a807c]                           dc.w $0000
[000a807e]                           dc.w $0000
[000a8080]                           dc.w $0000
[000a8082]                           dc.w $0000
[000a8084]                           dc.w $ffff
[000a8086]                           dc.w $000b
[000a8088]                           dc.w $0000
[000a808a]                           dc.w $0000
[000a808c]                           dc.w $0078
[000a808e]                           dc.w $0032
[000a8090]                           dc.w $0000
[000a8092]                           dc.w $0000
[000a8094]                           dc.w $0000
[000a8096]                           dc.w $0000
[000a8098]                           dc.w $0000
[000a809a]                           dc.w $0000
[000a809c]                           dc.w $0000
[000a809e]                           dc.w $0000
[000a80a0]                           dc.w $ffff
[000a80a2]                           dc.w $ffff
[000a80a4]                           dc.w $ffff
[000a80a6]                           dc.w $ffff
[000a80a8]                           dc.w $0000
[000a80aa]                           dc.w $0000
[000a80ac]                           dc.w $f8f8
[000a80ae] 000a78d7                  dc.l TEXT_10
[000a80b2] 000a7876                  dc.l TEXT_002
[000a80b6]                           dc.w $2710
[000a80b8]                           dc.w $0000
[000a80ba]                           dc.w $0000
[000a80bc]                           dc.w $ffff
[000a80be]                           dc.w $0000
[000a80c0]                           dc.w $0000
[000a80c2]                           dc.w $0000
[000a80c4]                           dc.w $0000
[000a80c6] 0006b744                  dc.l Awi_keys
[000a80ca] 00051852                  dc.l Awi_obchange
[000a80ce] 00051c46                  dc.l Awi_redraw
[000a80d2] 000587a4                  dc.l Awi_topped
[000a80d6] 00058362                  dc.l Awi_closed
[000a80da] 000587ec                  dc.l Awi_fulled
[000a80de] 0005217c                  dc.l Awi_arrowed
[000a80e2] 000524b4                  dc.l Awi_hslid
[000a80e6] 0005255e                  dc.l Awi_vslid
[000a80ea] 00058bb0                  dc.l Awi_sized
[000a80ee] 00058d50                  dc.l Awi_moved
[000a80f2] 0005998a                  dc.l Awi_iconify
[000a80f6] 00059c6c                  dc.l Awi_uniconify
[000a80fa] 0005b5b6                  dc.l Awi_gemscript
[000a80fe]                           dc.w $0000
[000a8100]                           dc.w $0000
[000a8102]                           dc.w $0000
[000a8104]                           dc.w $0000

MO_ADD:
[000a8106]                           dc.w $0008
[000a8108]                           dc.w $0008
[000a810a]                           dc.w $0001
[000a810c]                           dc.w $0000
[000a810e]                           dc.w $0001
[000a8110]                           dc.w $0300
[000a8112]                           dc.w $1fb0
[000a8114]                           dc.w $3ff8
[000a8116]                           dc.w $3ffc
[000a8118]                           dc.w $7ffe
[000a811a]                           dc.w $fffe
[000a811c]                           dc.w $fffe
[000a811e]                           dc.w $7fff
[000a8120]                           dc.w $7fff
[000a8122]                           dc.w $ffff
[000a8124]                           dc.w $ffff
[000a8126]                           dc.w $7fff
[000a8128]                           dc.w $3fff
[000a812a]                           dc.w $0fff
[000a812c]                           dc.w $01ff
[000a812e]                           dc.w $007f
[000a8130]                           dc.w $0300
[000a8132]                           dc.w $1cb0
[000a8134]                           dc.b '$H"$q'
[000a8139]                           dc.b $12
[000a813a]                           dc.w $9802
[000a813c]                           dc.w $84c2
[000a813e]                           dc.w $40c1
[000a8140]                           dc.w $73f1
[000a8142]                           dc.w $9bf0
[000a8144]                           dc.w $84cc
[000a8146]                           dc.w $40cc
[000a8148]                           dc.w $303f
[000a814a]                           dc.w $0e3f
[000a814c]                           dc.w $018c
[000a814e]                           dc.w $006c
MO_BLACK:
[000a8150]                           dc.w $0000
[000a8152]                           dc.w $0000
[000a8154]                           dc.w $0001
[000a8156]                           dc.w $0000
[000a8158]                           dc.w $0001
[000a815a]                           dc.w $c0ff
[000a815c]                           dc.w $e0ff
[000a815e]                           dc.w $f0ff
[000a8160]                           dc.w $f8ff
[000a8162]                           dc.w $fcff
[000a8164]                           dc.w $feff
[000a8166]                           dc.w $ffff
[000a8168]                           dc.w $ffff
[000a816a]                           dc.w $ffc0
[000a816c]                           dc.w $ffe0
[000a816e]                           dc.w $fe00
[000a8170]                           dc.w $ef00
[000a8172]                           dc.w $cf00
[000a8174]                           dc.w $8780
[000a8176]                           dc.w $0780
[000a8178]                           dc.w $0380
[000a817a]                           dc.w $0000
[000a817c]                           dc.b '@~`~p~x~|~~~'
[000a8188]                           dc.w $7f00
[000a818a]                           dc.w $7f80
[000a818c]                           dc.w $7c00
[000a818e]                           dc.w $6c00
[000a8190]                           dc.w $4600
[000a8192]                           dc.w $0600
[000a8194]                           dc.w $0300
[000a8196]                           dc.w $0300
[000a8198]                           dc.w $0000
MO_DRAG:
[000a819a]                           dc.w $0008
[000a819c]                           dc.w $0008
[000a819e]                           dc.w $0001
[000a81a0]                           dc.w $0000
[000a81a2]                           dc.w $0001
[000a81a4]                           dc.w $0300
[000a81a6]                           dc.w $1fb0
[000a81a8]                           dc.w $3ff8
[000a81aa]                           dc.w $3ffc
[000a81ac]                           dc.w $7ffe
[000a81ae]                           dc.w $fffe
[000a81b0]                           dc.w $fffe
[000a81b2]                           dc.w $7fff
[000a81b4]                           dc.w $7fff
[000a81b6]                           dc.w $ffff
[000a81b8]                           dc.w $ffff
[000a81ba]                           dc.w $7fff
[000a81bc]                           dc.w $3fff
[000a81be]                           dc.w $0fff
[000a81c0]                           dc.w $01ff
[000a81c2]                           dc.w $007f
[000a81c4]                           dc.w $0300
[000a81c6]                           dc.w $1cb0
[000a81c8]                           dc.b '$H"$q'
[000a81cd]                           dc.b $12
[000a81ce]                           dc.w $9802
[000a81d0]                           dc.w $84c2
[000a81d2]                           dc.w $40c1
[000a81d4]                           dc.w $73f1
[000a81d6]                           dc.w $9bf0
[000a81d8]                           dc.w $84c0
[000a81da]                           dc.w $40c0
[000a81dc]                           dc.w $3000
[000a81de]                           dc.w $0e00
[000a81e0]                           dc.w $0180
[000a81e2]                           dc.w $0060
MO_TRANS:
[000a81e4]                           dc.w $0000
[000a81e6]                           dc.w $0000
[000a81e8]                           dc.w $0001
[000a81ea]                           dc.w $0000
[000a81ec]                           dc.w $0001
[000a81ee]                           dc.w $c0ff
[000a81f0]                           dc.w $e0ff
[000a81f2]                           dc.w $f0ff
[000a81f4]                           dc.w $f8ff
[000a81f6]                           dc.w $fcff
[000a81f8]                           dc.w $feff
[000a81fa]                           dc.w $ffff
[000a81fc]                           dc.w $ffff
[000a81fe]                           dc.w $ffc0
[000a8200]                           dc.w $ffe0
[000a8202]                           dc.w $fe00
[000a8204]                           dc.w $ef00
[000a8206]                           dc.w $cf00
[000a8208]                           dc.w $8780
[000a820a]                           dc.w $0780
[000a820c]                           dc.w $0380
[000a820e]                           dc.w $00ff
[000a8210]                           dc.w $40ab
[000a8212]                           dc.w $60d5
[000a8214]                           dc.w $70ab
[000a8216]                           dc.w $78d5
[000a8218]                           dc.w $7cab
[000a821a]                           dc.w $7ed5
[000a821c]                           dc.w $7fff
[000a821e]                           dc.w $7f80
[000a8220]                           dc.w $7c00
[000a8222]                           dc.w $6c00
[000a8224]                           dc.w $4600
[000a8226]                           dc.w $0600
[000a8228]                           dc.w $0300
[000a822a]                           dc.w $0300
[000a822c]                           dc.w $0000
MO_WHITE:
[000a822e]                           dc.w $0000
[000a8230]                           dc.w $0000
[000a8232]                           dc.w $0001
[000a8234]                           dc.w $0000
[000a8236]                           dc.w $0001
[000a8238]                           dc.w $c0ff
[000a823a]                           dc.w $e0ff
[000a823c]                           dc.w $f0ff
[000a823e]                           dc.w $f8ff
[000a8240]                           dc.w $fcff
[000a8242]                           dc.w $feff
[000a8244]                           dc.w $ffff
[000a8246]                           dc.w $ffff
[000a8248]                           dc.w $ffc0
[000a824a]                           dc.w $ffe0
[000a824c]                           dc.w $fe00
[000a824e]                           dc.w $ef00
[000a8250]                           dc.w $cf00
[000a8252]                           dc.w $8780
[000a8254]                           dc.w $0780
[000a8256]                           dc.w $0380
[000a8258]                           dc.w $00ff
[000a825a]                           dc.b '@Å`ÅpÅxÅ|Å~Å'
[000a8266]                           dc.w $7fff
[000a8268]                           dc.w $7f80
[000a826a]                           dc.w $7c00
[000a826c]                           dc.w $6c00
[000a826e]                           dc.w $4600
[000a8270]                           dc.w $0600
[000a8272]                           dc.w $0300
[000a8274]                           dc.w $0300
[000a8276]                           dc.w $0000
ACSdescr:
[000a8278]                           dc.b 'ACS3.00',0
[000a8280]                           dc.w $012c
[000a8282]                           dc.w $ffb0
[000a8284]                           dc.w $ffb0
[000a8286]                           dc.w $0677
[000a8288]                           dc.b '  ACSpro 3.0.0'
[000a8296]                           dc.w $e100
[000a8298]                           dc.w $0000
[000a829a]                           dc.w $0000
[000a829c]                           dc.w $0000
[000a829e]                           dc.w $0000
[000a82a0]                           dc.w $0000
[000a82a2]                           dc.w $0000
[000a82a4]                           dc.w $0000
[000a82a6]                           dc.w $0000
[000a82a8] 000d01fa                  dc.l PUR_DESK
[000a82ac]                           dc.w $0000
[000a82ae]                           dc.w $0000
[000a82b0]                           dc.w $0000
[000a82b2]                           dc.w $0000
[000a82b4]                           dc.w $0000
[000a82b6]                           dc.w $0002
[000a82b8]                           dc.w $0000
[000a82ba]                           dc.w $0000
[000a82bc]                           dc.w $0003
[000a82be]                           dc.w $0000
[000a82c0]                           dc.w $0000
[000a82c2]                           dc.w $0004
[000a82c4]                           dc.w $0000
[000a82c6]                           dc.w $0000
[000a82c8]                           dc.w $0001
[000a82ca]                           dc.w $0000
[000a82cc]                           dc.w $0000
[000a82ce]                           dc.w $0005
[000a82d0]                           dc.w $0000
[000a82d2]                           dc.w $0000
[000a82d4]                           dc.w $0006
[000a82d6]                           dc.w $0000
[000a82d8]                           dc.w $0000
[000a82da]                           dc.w $0007
[000a82dc]                           dc.w $0000
[000a82de]                           dc.w $0000
[000a82e0]                           dc.w $00ff
[000a82e2] 000a8150                  dc.l MO_BLACK
[000a82e6]                           dc.w $00ff
[000a82e8] 000a822e                  dc.l MO_WHITE
[000a82ec]                           dc.w $00ff
[000a82ee] 000a81e4                  dc.l MO_TRANS
[000a82f2]                           dc.w $00ff
[000a82f4] 000a819a                  dc.l MO_DRAG
[000a82f8]                           dc.w $00ff
[000a82fa] 000a8106                  dc.l MO_ADD
[000a82fe]                           dc.w $0000
[000a8300]                           dc.w $0000
[000a8302]                           dc.w $0000
[000a8304]                           dc.w $0000
[000a8306]                           dc.w $0000
[000a8308]                           dc.w $0000
[000a830a]                           dc.w $0000
[000a830c]                           dc.w $0000
[000a830e]                           dc.w $0000
[000a8310]                           dc.w $0000
[000a8312]                           dc.w $0000
[000a8314]                           dc.w $0000
[000a8316]                           dc.w $0000
[000a8318]                           dc.w $0000
[000a831a]                           dc.w $0000
[000a831c]                           dc.w $0000
[000a831e]                           dc.w $0000
[000a8320]                           dc.w $0000
[000a8322]                           dc.w $0000
[000a8324]                           dc.w $0000
[000a8326]                           dc.w $0000
[000a8328]                           dc.w $0000
[000a832a]                           dc.w $0000
[000a832c]                           dc.w $0000
[000a832e]                           dc.w $0000
[000a8330]                           dc.w $0000
[000a8332]                           dc.w $0000
[000a8334]                           dc.w $0000
[000a8336]                           dc.w $0000
[000a8338]                           dc.w $0000
[000a833a]                           dc.w $0000
[000a833c]                           dc.w $0000
[000a833e]                           dc.w $0000
[000a8340]                           dc.w $0000
[000a8342]                           dc.w $0000
[000a8344]                           dc.w $0000
[000a8346]                           dc.w $0000
[000a8348]                           dc.w $0000
[000a834a]                           dc.w $0000
[000a834c]                           dc.w $0000
[000a834e]                           dc.w $0000
[000a8350]                           dc.w $0000
[000a8352]                           dc.w $0000
[000a8354]                           dc.w $0000
[000a8356]                           dc.w $0000
[000a8358]                           dc.w $0000
[000a835a]                           dc.w $0000
[000a835c]                           dc.w $0000
[000a835e]                           dc.w $0000
[000a8360]                           dc.w $0000
[000a8362]                           dc.w $0000
[000a8364]                           dc.w $0000
[000a8366]                           dc.w $0000
[000a8368]                           dc.w $0000
[000a836a]                           dc.w $0000
[000a836c]                           dc.w $0000
[000a836e]                           dc.w $0000
[000a8370] 000a8446                  dc.l $000a8446
[000a8374] 000a8485                  dc.l $000a8485
[000a8378] 000a84b7                  dc.l $000a84b7
[000a837c] 000a852c                  dc.l $000a852c
[000a8380] 000a8564                  dc.l $000a8564
[000a8384] 000a85a0                  dc.l $000a85a0
[000a8388] 000a85db                  dc.l $000a85db
[000a838c] 000a862f                  dc.l $000a862f
[000a8390] 000a8688                  dc.l $000a8688
[000a8394] 000a86f5                  dc.l $000a86f5
[000a8398] 000a875c                  dc.l $000a875c
[000a839c] 000a87a3                  dc.l $000a87a3
[000a83a0] 000a87f0                  dc.l $000a87f0
[000a83a4] 000a882a                  dc.l $000a882a
[000a83a8] 000a886a                  dc.l $000a886a
[000a83ac] 000a88be                  dc.l $000a88be
[000a83b0] 000a890a                  dc.l $000a890a
[000a83b4] 000a8961                  dc.l $000a8961
[000a83b8] 000a89bf                  dc.l $000a89bf
[000a83bc] 000a8a03                  dc.l $000a8a03
[000a83c0] 000a8a41                  dc.l $000a8a41
[000a83c4] 000a8a7b                  dc.l $000a8a7b
[000a83c8] 000a8abe                  dc.l $000a8abe
[000a83cc] 000a8b01                  dc.l $000a8b01
[000a83d0] 000a8b55                  dc.l $000a8b55
[000a83d4] 000a8b9f                  dc.l $000a8b9f
[000a83d8] 000a8bee                  dc.l $000a8bee
[000a83dc] 000a8c33                  dc.l $000a8c33
[000a83e0] 000a8c73                  dc.l $000a8c73
[000a83e4] 000a8cbf                  dc.l $000a8cbf
[000a83e8] 000a8d11                  dc.l $000a8d11
[000a83ec] 000a8d1b                  dc.l $000a8d1b
[000a83f0] 000a8d23                  dc.l $000a8d23
[000a83f4] 000a8d2a                  dc.l $000a8d2a
ACSconfig:
[000a83f8] 000a8484                  dc.l $000a8484
[000a83fc] 000a8d34                  dc.l $000a8d34
[000a8400]                           dc.w $0000
[000a8402]                           dc.w $0000
[000a8404]                           dc.w $0000
[000a8406]                           dc.w $0000
[000a8408]                           dc.w $0004
[000a840a] 000a8d37                  dc.l $000a8d37
[000a840e]                           dc.w $0000
[000a8410]                           dc.w $0000
[000a8412]                           dc.w $0000
[000a8414]                           dc.w $0000
[000a8416]                           dc.w $0000
[000a8418]                           dc.w $0000
[000a841a]                           dc.w $0000
[000a841c]                           dc.w $0000
[000a841e]                           dc.w $0000
[000a8420]                           dc.w $0000
[000a8422]                           dc.w $0000
[000a8424]                           dc.w $0000
[000a8426]                           dc.w $0000
[000a8428]                           dc.w $0000
[000a842a]                           dc.w $0000
[000a842c]                           dc.w $0000
[000a842e]                           dc.w $0000
[000a8430]                           dc.w $0000
[000a8432]                           dc.w $0000
[000a8434]                           dc.w $0000
[000a8436]                           dc.w $000c
[000a8438]                           dc.w $5045
[000a843a]                           dc.w $0000
[000a843c]                           dc.w $0000
[000a843e] 00015648                  dc.l ACSinit0
[000a8442] 0001568e                  dc.l ACSinit
[000a8446]                           dc.b '[3][ Es ist ein allgemeiner | Fehler aufgetreten! ][ Abbruch ]',0
[000a8485]                           dc.b '[1][ Ein Fehler ist aufgetreten! | %s][ Abbruch ]',0
[000a84b7]                           dc.b '[1][ Die Anzahl der momentan| darstellbaren Farben oder| die aktuelle Bildauflîsung | ist nicht korrekt!][ Abbruch ]',0
[000a852c]                           dc.b '[1][ Eine Datei lieû sich | nicht erzeugen!][ Abbruch ]',0
[000a8564]                           dc.b '[3][ Die Datei '%s'| lÑût sich nicht erzeugen! ][ Abbruch ]',0
[000a85a0]                           dc.b '[1][ Auf fremden Speicher | wurde zugegriffen!][ Abbruch ]',0
[000a85db]                           dc.b '[2][ | Soll das Accessory | >>               << | gestartet werden?| ][Ja|  Nein  ]',0
[000a862f]                           dc.b '[2][ Unbekannte GEM-Nachricht | erhalten.| ID = '%s'| Weiterhin berichten?][Ja|  Nein  ]',0
[000a8688]                           dc.b '[3][ Keine freie GEM-Fenster-ID | mehr vorhanden!| Abhilfe: Ein offenes| GEM-Fenster schlieûen.][    OK    ]',0
[000a86f5]                           dc.b '[3][ Kein freier ACS-Fenster- | Platz mehr vorhanden!| Abhilfe: Ein ACS-Fenster| lîschen.][    OK    ]',0
[000a875c]                           dc.b '[1][ Es ist ein Fehler bei der | Ein-/Ausgabe aufgetreten!][ Abbruch ]',0
[000a87a3]                           dc.b '[1][ Es ist ein Fehler in| der Speicherverwaltung | aufgetreten!][ Abbruch ]',0
[000a87f0]                           dc.b '[1][ Das Modul konnte nicht | geladen werden!][ Abbruch ]',0
[000a882a]                           dc.b '[1][ Das Modul '%s' | konnte nicht geladen werden! ][ Abbruch ]',0
[000a886a]                           dc.b '[1][ Beim Laden des Moduls | (mit Pexec-3) ist ein| Fehler aufgetreten!][ Abbruch ]',0
[000a88be]                           dc.b '[1][ Beim Laden des Moduls | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]',0
[000a890a]                           dc.b '[1][ Der dem Modul folgende| Restspeicher kann nicht | freigegeben werden!][ Abbruch ]',0
[000a8961]                           dc.b '[1][ Der dem Modul '%s' | folgenden Restspeicher kann | nicht freigegeben werden!][ Abbruch ]',0
[000a89bf]                           dc.b '[1][ Die Adresse eines Speicher- | blocks ist ungerade!][ Abbruch ]',0
[000a8a03]                           dc.b '[1][ Eine Datei lieû sich| nicht korrekt îffnen! ][ Abbruch ]',0
[000a8a41]                           dc.b '[1][ Die Datei '%s' | lÑût sich nicht îffnen!][ Abbruch ]',0
[000a8a7b]                           dc.b '[1][ Es steht nicht genÅgend | Speicher zur VerfÅgung!][ Abbruch ]',0
[000a8abe]                           dc.b '[1][ Ein Fehler trat auf einem| Ein-/Ausgabekanal auf!][ Abbruch ]',0
[000a8b01]                           dc.b '[1][ Ein Speicherblock| befindet sich auûerhalb | der legalen Bereiche!][ Abbruch ]',0
[000a8b55]                           dc.b '[1][ Beim Lesen aus einer Datei| ist ein Fehler aufgetreten! ][ Abbruch ]',0
[000a8b9f]                           dc.b '[1][ Beim Lesen aus der Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]',0
[000a8bee]                           dc.b '[1][ Das Modul hat leider eine | falsche Versionsnummer!][ Abbruch ]',0
[000a8c33]                           dc.b '[1][Das Modul|'%s'|hat eine falsche|Versionsnummer!][ Abbruch ]',0
[000a8c73]                           dc.b '[1][ Beim Schreiben in eine Datei | ist ein Fehler aufgetreten!][ Abbruch ]',0
[000a8cbf]                           dc.b '[1][ Beim Schreiben in die Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]',0
[000a8d11]                           dc.b ' Achtung ',0
[000a8d1b]                           dc.b ' Frage ',0
[000a8d23]                           dc.b ' Stop ',0
[000a8d2a]                           dc.b ' Meldung ',0
[000a8d34]                           dc.w $253b
[000a8d36]                           dc.w $0050
[000a8d38]                           dc.b 'UR_DESK',0
