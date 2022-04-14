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
