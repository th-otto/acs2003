INuserobj:
[000625bc] 2f0a                      move.l     a2,-(a7)
[000625be] 594f                      subq.w     #4,a7
[000625c0] 3039 000e 1bfa            move.w     icn_count,d0
[000625c6] 5279 000e 1bfa            addq.w     #1,icn_count
[000625cc] 4a40                      tst.w      d0
[000625ce] 660e                      bne.s      INuserobj_1
[000625d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000625d6] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[000625dc] 6c06                      bge.s      INuserobj_2
INuserobj_1:
[000625de] 4240                      clr.w      d0
[000625e0] 6000 05bc                 bra        INuserobj_3
INuserobj_2:
[000625e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000625ea] 3ea8 001c                 move.w     28(a0),(a7)
[000625ee] 2079 0010 ee4e            movea.l    ACSblk,a0
[000625f4] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[000625fa] 6f0c                      ble.s      INuserobj_4
[000625fc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062602] 317c 0004 001c            move.w     #$0004,28(a0)
INuserobj_4:
[00062608] 7210                      moveq.l    #16,d1
[0006260a] 7010                      moveq.l    #16,d0
[0006260c] 4eb9 0005 4b6e            jsr        Abp_create
[00062612] 23c8 000e 1c1c            move.l     a0,icn_mask
[00062618] 6606                      bne.s      INuserobj_5
[0006261a] 70ff                      moveq.l    #-1,d0
[0006261c] 6000 0580                 bra        INuserobj_3
INuserobj_5:
[00062620] 7210                      moveq.l    #16,d1
[00062622] 7010                      moveq.l    #16,d0
[00062624] 4eb9 0005 4b6e            jsr        Abp_create
[0006262a] 23c8 000e 1bfc            move.l     a0,icn_chk_sel
[00062630] 6700 0096                 beq        INuserobj_6
[00062634] 7210                      moveq.l    #16,d1
[00062636] 7010                      moveq.l    #16,d0
[00062638] 4eb9 0005 4b6e            jsr        Abp_create
[0006263e] 23c8 000e 1c00            move.l     a0,icn_chk_un
[00062644] 6700 0082                 beq        INuserobj_6
[00062648] 7210                      moveq.l    #16,d1
[0006264a] 7010                      moveq.l    #16,d0
[0006264c] 4eb9 0005 4b6e            jsr        Abp_create
[00062652] 23c8 000e 1c0c            move.l     a0,icn_rad_sel
[00062658] 676e                      beq.s      INuserobj_6
[0006265a] 7210                      moveq.l    #16,d1
[0006265c] 7010                      moveq.l    #16,d0
[0006265e] 4eb9 0005 4b6e            jsr        Abp_create
[00062664] 23c8 000e 1c10            move.l     a0,icn_rad_un
[0006266a] 675c                      beq.s      INuserobj_6
[0006266c] 7210                      moveq.l    #16,d1
[0006266e] 7010                      moveq.l    #16,d0
[00062670] 4eb9 0005 4b6e            jsr        Abp_create
[00062676] 23c8 000e 1c04            move.l     a0,icn_chk_dissel
[0006267c] 674a                      beq.s      INuserobj_6
[0006267e] 7210                      moveq.l    #16,d1
[00062680] 7010                      moveq.l    #16,d0
[00062682] 4eb9 0005 4b6e            jsr        Abp_create
[00062688] 23c8 000e 1c08            move.l     a0,icn_chk_disun
[0006268e] 6738                      beq.s      INuserobj_6
[00062690] 7210                      moveq.l    #16,d1
[00062692] 7010                      moveq.l    #16,d0
[00062694] 4eb9 0005 4b6e            jsr        Abp_create
[0006269a] 23c8 000e 1c14            move.l     a0,icn_rad_dissel
[000626a0] 6726                      beq.s      INuserobj_6
[000626a2] 7210                      moveq.l    #16,d1
[000626a4] 7010                      moveq.l    #16,d0
[000626a6] 4eb9 0005 4b6e            jsr        Abp_create
[000626ac] 23c8 000e 1c18            move.l     a0,icn_rad_disun
[000626b2] 6714                      beq.s      INuserobj_6
[000626b4] 7210                      moveq.l    #16,d1
[000626b6] 7010                      moveq.l    #16,d0
[000626b8] 4eb9 0005 4b6e            jsr        Abp_create
[000626be] 23c8 000e 1c20            move.l     a0,icn_tmp
[000626c4] 6600 00f4                 bne        INuserobj_7
INuserobj_6:
[000626c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000626ce] 3157 001c                 move.w     (a7),28(a0)
[000626d2] 2079 000e 1c1c            movea.l    icn_mask,a0
[000626d8] 4eb9 0005 4c04            jsr        Abp_delete
[000626de] 42b9 000e 1c1c            clr.l      icn_mask
[000626e4] 2039 000e 1c10            move.l     icn_rad_un,d0
[000626ea] 6712                      beq.s      INuserobj_8
[000626ec] 2079 000e 1c10            movea.l    icn_rad_un,a0
[000626f2] 4eb9 0005 4c04            jsr        Abp_delete
[000626f8] 42b9 000e 1c10            clr.l      icn_rad_un
INuserobj_8:
[000626fe] 2039 000e 1c0c            move.l     icn_rad_sel,d0
[00062704] 6712                      beq.s      INuserobj_9
[00062706] 2079 000e 1c0c            movea.l    icn_rad_sel,a0
[0006270c] 4eb9 0005 4c04            jsr        Abp_delete
[00062712] 42b9 000e 1c0c            clr.l      icn_rad_sel
INuserobj_9:
[00062718] 2039 000e 1c00            move.l     icn_chk_un,d0
[0006271e] 6712                      beq.s      INuserobj_10
[00062720] 2079 000e 1c00            movea.l    icn_chk_un,a0
[00062726] 4eb9 0005 4c04            jsr        Abp_delete
[0006272c] 42b9 000e 1c00            clr.l      icn_chk_un
INuserobj_10:
[00062732] 2039 000e 1bfc            move.l     icn_chk_sel,d0
[00062738] 6712                      beq.s      INuserobj_11
[0006273a] 2079 000e 1bfc            movea.l    icn_chk_sel,a0
[00062740] 4eb9 0005 4c04            jsr        Abp_delete
[00062746] 42b9 000e 1bfc            clr.l      icn_chk_sel
INuserobj_11:
[0006274c] 2039 000e 1c18            move.l     icn_rad_disun,d0
[00062752] 6712                      beq.s      INuserobj_12
[00062754] 2079 000e 1c18            movea.l    icn_rad_disun,a0
[0006275a] 4eb9 0005 4c04            jsr        Abp_delete
[00062760] 42b9 000e 1c18            clr.l      icn_rad_disun
INuserobj_12:
[00062766] 2039 000e 1c14            move.l     icn_rad_dissel,d0
[0006276c] 6712                      beq.s      INuserobj_13
[0006276e] 2079 000e 1c14            movea.l    icn_rad_dissel,a0
[00062774] 4eb9 0005 4c04            jsr        Abp_delete
[0006277a] 42b9 000e 1c14            clr.l      icn_rad_dissel
INuserobj_13:
[00062780] 2039 000e 1c08            move.l     icn_chk_disun,d0
[00062786] 6712                      beq.s      INuserobj_14
[00062788] 2079 000e 1c08            movea.l    icn_chk_disun,a0
[0006278e] 4eb9 0005 4c04            jsr        Abp_delete
[00062794] 42b9 000e 1c08            clr.l      icn_chk_disun
INuserobj_14:
[0006279a] 2039 000e 1c04            move.l     icn_chk_dissel,d0
[000627a0] 6712                      beq.s      INuserobj_15
[000627a2] 2079 000e 1c04            movea.l    icn_chk_dissel,a0
[000627a8] 4eb9 0005 4c04            jsr        Abp_delete
[000627ae] 42b9 000e 1c04            clr.l      icn_chk_dissel
INuserobj_15:
[000627b4] 70ff                      moveq.l    #-1,d0
[000627b6] 6000 03e6                 bra        INuserobj_3
INuserobj_7:
[000627ba] 2079 0010 ee4e            movea.l    ACSblk,a0
[000627c0] 3157 001c                 move.w     (a7),28(a0)
[000627c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000627ca] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[000627d0] 6f26                      ble.s      INuserobj_16
[000627d2] 426f 0002                 clr.w      2(a7)
[000627d6] 6018                      bra.s      INuserobj_17
INuserobj_18:
[000627d8] 302f 0002                 move.w     2(a7),d0
[000627dc] 48c0                      ext.l      d0
[000627de] d080                      add.l      d0,d0
[000627e0] 2079 000d e0a0            movea.l    _CHK_3D_S,a0
[000627e6] 0a70 ffff 0800            eori.w     #$FFFF,0(a0,d0.l)
[000627ec] 526f 0002                 addq.w     #1,2(a7)
INuserobj_17:
[000627f0] 0c6f fff0 0002            cmpi.w     #$FFF0,2(a7)
[000627f6] 6de0                      blt.s      INuserobj_18
INuserobj_16:
[000627f8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000627fe] 3228 001c                 move.w     28(a0),d1
[00062802] 48c1                      ext.l      d1
[00062804] eb89                      lsl.l      #5,d1
[00062806] 4240                      clr.w      d0
[00062808] 2079 000e 1c20            movea.l    icn_tmp,a0
[0006280e] 2050                      movea.l    (a0),a0
[00062810] 4eb9 0008 36ea            jsr        memset
[00062816] 203c 0000 0080            move.l     #$00000080,d0
[0006281c] 2079 000d e0c2            movea.l    $000DE0C2,a0
[00062822] 2268 0002                 movea.l    2(a0),a1
[00062826] 2079 000e 1c20            movea.l    icn_tmp,a0
[0006282c] 2050                      movea.l    (a0),a0
[0006282e] 4eb9 0008 3500            jsr        memcpy
[00062834] 2079 000e 1c20            movea.l    icn_tmp,a0
[0006283a] 317c 0001 000a            move.w     #$0001,10(a0)
[00062840] 2279 000e 1bfc            movea.l    icn_chk_sel,a1
[00062846] 2079 000e 1c20            movea.l    icn_tmp,a0
[0006284c] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062852] 302a 0010                 move.w     16(a2),d0
[00062856] 4eb9 0007 4978            jsr        vr_trnfm
[0006285c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062862] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[00062868] 6f26                      ble.s      INuserobj_19
[0006286a] 426f 0002                 clr.w      2(a7)
[0006286e] 6018                      bra.s      INuserobj_20
INuserobj_21:
[00062870] 302f 0002                 move.w     2(a7),d0
[00062874] 48c0                      ext.l      d0
[00062876] d080                      add.l      d0,d0
[00062878] 2079 000d e132            movea.l    _CHK_3D_U,a0
[0006287e] 0a70 ffff 0800            eori.w     #$FFFF,0(a0,d0.l)
[00062884] 526f 0002                 addq.w     #1,2(a7)
INuserobj_20:
[00062888] 0c6f fff0 0002            cmpi.w     #$FFF0,2(a7)
[0006288e] 6de0                      blt.s      INuserobj_21
INuserobj_19:
[00062890] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062896] 3228 001c                 move.w     28(a0),d1
[0006289a] 48c1                      ext.l      d1
[0006289c] eb89                      lsl.l      #5,d1
[0006289e] 4240                      clr.w      d0
[000628a0] 2079 000e 1c20            movea.l    icn_tmp,a0
[000628a6] 2050                      movea.l    (a0),a0
[000628a8] 4eb9 0008 36ea            jsr        memset
[000628ae] 203c 0000 0080            move.l     #$00000080,d0
[000628b4] 2079 000d e154            movea.l    $000DE154,a0
[000628ba] 2268 0002                 movea.l    2(a0),a1
[000628be] 2079 000e 1c20            movea.l    icn_tmp,a0
[000628c4] 2050                      movea.l    (a0),a0
[000628c6] 4eb9 0008 3500            jsr        memcpy
[000628cc] 2079 000e 1c20            movea.l    icn_tmp,a0
[000628d2] 317c 0001 000a            move.w     #$0001,10(a0)
[000628d8] 2279 000e 1c00            movea.l    icn_chk_un,a1
[000628de] 2079 000e 1c20            movea.l    icn_tmp,a0
[000628e4] 2479 0010 ee4e            movea.l    ACSblk,a2
[000628ea] 302a 0010                 move.w     16(a2),d0
[000628ee] 4eb9 0007 4978            jsr        vr_trnfm
[000628f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000628fa] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[00062900] 6f26                      ble.s      INuserobj_22
[00062902] 426f 0002                 clr.w      2(a7)
[00062906] 6018                      bra.s      INuserobj_23
INuserobj_24:
[00062908] 302f 0002                 move.w     2(a7),d0
[0006290c] 48c0                      ext.l      d0
[0006290e] d080                      add.l      d0,d0
[00062910] 2079 000d df7c            movea.l    _CHK_3D_DS,a0
[00062916] 0a70 ffff 0800            eori.w     #$FFFF,0(a0,d0.l)
[0006291c] 526f 0002                 addq.w     #1,2(a7)
INuserobj_23:
[00062920] 0c6f fff0 0002            cmpi.w     #$FFF0,2(a7)
[00062926] 6de0                      blt.s      INuserobj_24
INuserobj_22:
[00062928] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006292e] 3228 001c                 move.w     28(a0),d1
[00062932] 48c1                      ext.l      d1
[00062934] eb89                      lsl.l      #5,d1
[00062936] 4240                      clr.w      d0
[00062938] 2079 000e 1c20            movea.l    icn_tmp,a0
[0006293e] 2050                      movea.l    (a0),a0
[00062940] 4eb9 0008 36ea            jsr        memset
[00062946] 203c 0000 0080            move.l     #$00000080,d0
[0006294c] 2079 000d df9e            movea.l    $000DDF9E,a0
[00062952] 2268 0002                 movea.l    2(a0),a1
[00062956] 2079 000e 1c20            movea.l    icn_tmp,a0
[0006295c] 2050                      movea.l    (a0),a0
[0006295e] 4eb9 0008 3500            jsr        memcpy
[00062964] 2079 000e 1c20            movea.l    icn_tmp,a0
[0006296a] 317c 0001 000a            move.w     #$0001,10(a0)
[00062970] 2279 000e 1c04            movea.l    icn_chk_dissel,a1
[00062976] 2079 000e 1c20            movea.l    icn_tmp,a0
[0006297c] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062982] 302a 0010                 move.w     16(a2),d0
[00062986] 4eb9 0007 4978            jsr        vr_trnfm
[0006298c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062992] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[00062998] 6f26                      ble.s      INuserobj_25
[0006299a] 426f 0002                 clr.w      2(a7)
[0006299e] 6018                      bra.s      INuserobj_26
INuserobj_27:
[000629a0] 302f 0002                 move.w     2(a7),d0
[000629a4] 48c0                      ext.l      d0
[000629a6] d080                      add.l      d0,d0
[000629a8] 2079 000d e00e            movea.l    _CHK_3D_DU,a0
[000629ae] 0a70 ffff 0800            eori.w     #$FFFF,0(a0,d0.l)
[000629b4] 526f 0002                 addq.w     #1,2(a7)
INuserobj_26:
[000629b8] 0c6f fff0 0002            cmpi.w     #$FFF0,2(a7)
[000629be] 6de0                      blt.s      INuserobj_27
INuserobj_25:
[000629c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000629c6] 3228 001c                 move.w     28(a0),d1
[000629ca] 48c1                      ext.l      d1
[000629cc] eb89                      lsl.l      #5,d1
[000629ce] 4240                      clr.w      d0
[000629d0] 2079 000e 1c20            movea.l    icn_tmp,a0
[000629d6] 2050                      movea.l    (a0),a0
[000629d8] 4eb9 0008 36ea            jsr        memset
[000629de] 203c 0000 0080            move.l     #$00000080,d0
[000629e4] 2079 000d e030            movea.l    $000DE030,a0
[000629ea] 2268 0002                 movea.l    2(a0),a1
[000629ee] 2079 000e 1c20            movea.l    icn_tmp,a0
[000629f4] 2050                      movea.l    (a0),a0
[000629f6] 4eb9 0008 3500            jsr        memcpy
[000629fc] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062a02] 317c 0001 000a            move.w     #$0001,10(a0)
[00062a08] 2279 000e 1c08            movea.l    icn_chk_disun,a1
[00062a0e] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062a14] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062a1a] 302a 0010                 move.w     16(a2),d0
[00062a1e] 4eb9 0007 4978            jsr        vr_trnfm
[00062a24] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062a2a] 3228 001c                 move.w     28(a0),d1
[00062a2e] 48c1                      ext.l      d1
[00062a30] eb89                      lsl.l      #5,d1
[00062a32] 4240                      clr.w      d0
[00062a34] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062a3a] 2050                      movea.l    (a0),a0
[00062a3c] 4eb9 0008 36ea            jsr        memset
[00062a42] 203c 0000 0080            move.l     #$00000080,d0
[00062a48] 2079 000d f330            movea.l    $000DF330,a0
[00062a4e] 2268 0002                 movea.l    2(a0),a1
[00062a52] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062a58] 2050                      movea.l    (a0),a0
[00062a5a] 4eb9 0008 3500            jsr        memcpy
[00062a60] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062a66] 317c 0001 000a            move.w     #$0001,10(a0)
[00062a6c] 2279 000e 1c0c            movea.l    icn_rad_sel,a1
[00062a72] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062a78] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062a7e] 302a 0010                 move.w     16(a2),d0
[00062a82] 4eb9 0007 4978            jsr        vr_trnfm
[00062a88] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062a8e] 3228 001c                 move.w     28(a0),d1
[00062a92] 48c1                      ext.l      d1
[00062a94] eb89                      lsl.l      #5,d1
[00062a96] 4240                      clr.w      d0
[00062a98] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062a9e] 2050                      movea.l    (a0),a0
[00062aa0] 4eb9 0008 36ea            jsr        memset
[00062aa6] 203c 0000 0080            move.l     #$00000080,d0
[00062aac] 2079 000d f3c2            movea.l    $000DF3C2,a0
[00062ab2] 2268 0002                 movea.l    2(a0),a1
[00062ab6] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062abc] 2050                      movea.l    (a0),a0
[00062abe] 4eb9 0008 3500            jsr        memcpy
[00062ac4] 2279 000e 1c10            movea.l    icn_rad_un,a1
[00062aca] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062ad0] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062ad6] 302a 0010                 move.w     16(a2),d0
[00062ada] 4eb9 0007 4978            jsr        vr_trnfm
[00062ae0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062ae6] 3228 001c                 move.w     28(a0),d1
[00062aea] 48c1                      ext.l      d1
[00062aec] eb89                      lsl.l      #5,d1
[00062aee] 4240                      clr.w      d0
[00062af0] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062af6] 2050                      movea.l    (a0),a0
[00062af8] 4eb9 0008 36ea            jsr        memset
[00062afe] 203c 0000 0080            move.l     #$00000080,d0
[00062b04] 2079 000d f20c            movea.l    $000DF20C,a0
[00062b0a] 2268 0002                 movea.l    2(a0),a1
[00062b0e] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062b14] 2050                      movea.l    (a0),a0
[00062b16] 4eb9 0008 3500            jsr        memcpy
[00062b1c] 2279 000e 1c14            movea.l    icn_rad_dissel,a1
[00062b22] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062b28] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062b2e] 302a 0010                 move.w     16(a2),d0
[00062b32] 4eb9 0007 4978            jsr        vr_trnfm
[00062b38] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062b3e] 3228 001c                 move.w     28(a0),d1
[00062b42] 48c1                      ext.l      d1
[00062b44] eb89                      lsl.l      #5,d1
[00062b46] 4240                      clr.w      d0
[00062b48] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062b4e] 2050                      movea.l    (a0),a0
[00062b50] 4eb9 0008 36ea            jsr        memset
[00062b56] 203c 0000 0080            move.l     #$00000080,d0
[00062b5c] 2079 000d f29e            movea.l    $000DF29E,a0
[00062b62] 2268 0002                 movea.l    2(a0),a1
[00062b66] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062b6c] 2050                      movea.l    (a0),a0
[00062b6e] 4eb9 0008 3500            jsr        memcpy
[00062b74] 2279 000e 1c18            movea.l    icn_rad_disun,a1
[00062b7a] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062b80] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062b86] 302a 0010                 move.w     16(a2),d0
[00062b8a] 4eb9 0007 4978            jsr        vr_trnfm
[00062b90] 2079 000e 1c20            movea.l    icn_tmp,a0
[00062b96] 4eb9 0005 4c04            jsr        Abp_delete
[00062b9c] 4240                      clr.w      d0
INuserobj_3:
[00062b9e] 584f                      addq.w     #4,a7
[00062ba0] 245f                      movea.l    (a7)+,a2
[00062ba2] 4e75                      rts

TRuserobj:
[00062ba4] 5379 000e 1bfa            subq.w     #1,icn_count
[00062baa] 6616                      bne.s      TRuserobj_1
[00062bac] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062bb2] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00062bb8] 6d08                      blt.s      TRuserobj_1
[00062bba] 2039 000e 1c10            move.l     icn_rad_un,d0
[00062bc0] 6604                      bne.s      TRuserobj_2
TRuserobj_1:
[00062bc2] 6000 00a0                 bra        TRuserobj_3
TRuserobj_2:
[00062bc6] 2079 000e 1c10            movea.l    icn_rad_un,a0
[00062bcc] 4eb9 0005 4c04            jsr        Abp_delete
[00062bd2] 2079 000e 1c0c            movea.l    icn_rad_sel,a0
[00062bd8] 4eb9 0005 4c04            jsr        Abp_delete
[00062bde] 2079 000e 1c00            movea.l    icn_chk_un,a0
[00062be4] 4eb9 0005 4c04            jsr        Abp_delete
[00062bea] 2079 000e 1bfc            movea.l    icn_chk_sel,a0
[00062bf0] 4eb9 0005 4c04            jsr        Abp_delete
[00062bf6] 2079 000e 1c18            movea.l    icn_rad_disun,a0
[00062bfc] 4eb9 0005 4c04            jsr        Abp_delete
[00062c02] 2079 000e 1c14            movea.l    icn_rad_dissel,a0
[00062c08] 4eb9 0005 4c04            jsr        Abp_delete
[00062c0e] 2079 000e 1c08            movea.l    icn_chk_disun,a0
[00062c14] 4eb9 0005 4c04            jsr        Abp_delete
[00062c1a] 2079 000e 1c04            movea.l    icn_chk_dissel,a0
[00062c20] 4eb9 0005 4c04            jsr        Abp_delete
[00062c26] 2079 000e 1c1c            movea.l    icn_mask,a0
[00062c2c] 4eb9 0005 4c04            jsr        Abp_delete
[00062c32] 7000                      moveq.l    #0,d0
[00062c34] 23c0 000e 1c04            move.l     d0,icn_chk_dissel
[00062c3a] 23c0 000e 1bfc            move.l     d0,icn_chk_sel
[00062c40] 23c0 000e 1c08            move.l     d0,icn_chk_disun
[00062c46] 23c0 000e 1c00            move.l     d0,icn_chk_un
[00062c4c] 23c0 000e 1c18            move.l     d0,icn_rad_disun
[00062c52] 23c0 000e 1c10            move.l     d0,icn_rad_un
[00062c58] 23c0 000e 1c14            move.l     d0,icn_rad_dissel
[00062c5e] 23c0 000e 1c0c            move.l     d0,icn_rad_sel
TRuserobj_3:
[00062c64] 4e75                      rts

g_string:
[00062c66] 2f0a                      move.l     a2,-(a7)
[00062c68] 4fef ffd4                 lea.l      -44(a7),a7
[00062c6c] 3f40 002a                 move.w     d0,42(a7)
[00062c70] 3f41 0028                 move.w     d1,40(a7)
[00062c74] 2f48 0024                 move.l     a0,36(a7)
[00062c78] 3f42 0022                 move.w     d2,34(a7)
[00062c7c] 302f 0034                 move.w     52(a7),d0
[00062c80] 6704                      beq.s      g_string_1
[00062c82] 7002                      moveq.l    #2,d0
[00062c84] 6002                      bra.s      g_string_2
g_string_1:
[00062c86] 4240                      clr.w      d0
g_string_2:
[00062c88] 3f40 0002                 move.w     d0,2(a7)
[00062c8c] 302f 0034                 move.w     52(a7),d0
[00062c90] 6704                      beq.s      g_string_3
[00062c92] 7002                      moveq.l    #2,d0
[00062c94] 6002                      bra.s      g_string_4
g_string_3:
[00062c96] 4240                      clr.w      d0
g_string_4:
[00062c98] 3e80                      move.w     d0,(a7)
[00062c9a] 302f 0022                 move.w     34(a7),d0
[00062c9e] c07c 0800                 and.w      #$0800,d0
[00062ca2] 6704                      beq.s      g_string_5
[00062ca4] 0057 0008                 ori.w      #$0008,(a7)
g_string_5:
[00062ca8] 302f 0022                 move.w     34(a7),d0
[00062cac] c07c 0400                 and.w      #$0400,d0
[00062cb0] 6704                      beq.s      g_string_6
[00062cb2] 0057 0010                 ori.w      #$0010,(a7)
g_string_6:
[00062cb6] 302f 0022                 move.w     34(a7),d0
[00062cba] c07c 0300                 and.w      #$0300,d0
[00062cbe] 6704                      beq.s      g_string_7
[00062cc0] 0057 0001                 ori.w      #$0001,(a7)
g_string_7:
[00062cc4] 302f 0022                 move.w     34(a7),d0
[00062cc8] c07c 0c00                 and.w      #$0C00,d0
[00062ccc] 6706                      beq.s      g_string_8
[00062cce] 026f 7fff 0022            andi.w     #$7FFF,34(a7)
g_string_8:
[00062cd4] 4200                      clr.b      d0
[00062cd6] 1f40 000c                 move.b     d0,12(a7)
[00062cda] 1f40 000d                 move.b     d0,13(a7)
[00062cde] 302f 0022                 move.w     34(a7),d0
[00062ce2] 6726                      beq.s      g_string_9
[00062ce4] 302f 0022                 move.w     34(a7),d0
[00062ce8] c07c 8000                 and.w      #$8000,d0
[00062cec] 661c                      bne.s      g_string_9
[00062cee] 102f 0023                 move.b     35(a7),d0
[00062cf2] 4eb9 0004 64c8            jsr        Ach_tolower
[00062cf8] 1f40 000d                 move.b     d0,13(a7)
[00062cfc] 102f 0023                 move.b     35(a7),d0
[00062d00] 4eb9 0004 64b6            jsr        Ach_toupper
[00062d06] 1f40 000c                 move.b     d0,12(a7)
g_string_9:
[00062d0a] 102f 000d                 move.b     13(a7),d0
[00062d0e] 4880                      ext.w      d0
[00062d10] 206f 0024                 movea.l    36(a7),a0
[00062d14] 4eb9 0008 2e8a            jsr        strchr
[00062d1a] 2f48 0008                 move.l     a0,8(a7)
[00062d1e] 102f 000c                 move.b     12(a7),d0
[00062d22] 4880                      ext.w      d0
[00062d24] 206f 0024                 movea.l    36(a7),a0
[00062d28] 4eb9 0008 2e8a            jsr        strchr
[00062d2e] 2f48 0004                 move.l     a0,4(a7)
[00062d32] 202f 0008                 move.l     8(a7),d0
[00062d36] 6710                      beq.s      g_string_10
[00062d38] 202f 0004                 move.l     4(a7),d0
[00062d3c] 6710                      beq.s      g_string_11
[00062d3e] 206f 0008                 movea.l    8(a7),a0
[00062d42] b1ef 0004                 cmpa.l     4(a7),a0
[00062d46] 6306                      bls.s      g_string_11
g_string_10:
[00062d48] 2f6f 0004 0008            move.l     4(a7),8(a7)
g_string_11:
[00062d4e] 206f 0008                 movea.l    8(a7),a0
[00062d52] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00062d58] 4a40                      tst.w      d0
[00062d5a] 6600 011e                 bne        g_string_12
[00062d5e] 206f 0008                 movea.l    8(a7),a0
[00062d62] 13d0 000e 1c24            move.b     (a0),save
[00062d68] 206f 0008                 movea.l    8(a7),a0
[00062d6c] 4210                      clr.b      (a0)
[00062d6e] 206f 0024                 movea.l    36(a7),a0
[00062d72] 1010                      move.b     (a0),d0
[00062d74] 6756                      beq.s      g_string_13
[00062d76] 322f 0002                 move.w     2(a7),d1
[00062d7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062d80] 3028 0010                 move.w     16(a0),d0
[00062d84] 4eb9 0007 358e            jsr        vst_effects
[00062d8a] 43ef 0012                 lea.l      18(a7),a1
[00062d8e] 206f 0024                 movea.l    36(a7),a0
[00062d92] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062d98] 302a 0010                 move.w     16(a2),d0
[00062d9c] 4eb9 0007 55fe            jsr        vqt_extent
[00062da2] 302f 0016                 move.w     22(a7),d0
[00062da6] 906f 0012                 sub.w      18(a7),d0
[00062daa] 3f40 0010                 move.w     d0,16(a7)
[00062dae] 206f 0024                 movea.l    36(a7),a0
[00062db2] 342f 0028                 move.w     40(a7),d2
[00062db6] 322f 002a                 move.w     42(a7),d1
[00062dba] 2279 0010 ee4e            movea.l    ACSblk,a1
[00062dc0] 3029 0010                 move.w     16(a1),d0
[00062dc4] 4eb9 0007 24b0            jsr        v_gtext
[00062dca] 6004                      bra.s      g_string_14
g_string_13:
[00062dcc] 426f 0010                 clr.w      16(a7)
g_string_14:
[00062dd0] 3217                      move.w     (a7),d1
[00062dd2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062dd8] 3028 0010                 move.w     16(a0),d0
[00062ddc] 4eb9 0007 358e            jsr        vst_effects
[00062de2] 43ef 0012                 lea.l      18(a7),a1
[00062de6] 41f9 000e 1c24            lea.l      save,a0
[00062dec] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062df2] 302a 0010                 move.w     16(a2),d0
[00062df6] 4eb9 0007 55fe            jsr        vqt_extent
[00062dfc] 302f 0016                 move.w     22(a7),d0
[00062e00] 906f 0012                 sub.w      18(a7),d0
[00062e04] 3f40 000e                 move.w     d0,14(a7)
[00062e08] 41f9 000e 1c24            lea.l      save,a0
[00062e0e] 342f 0028                 move.w     40(a7),d2
[00062e12] 322f 002a                 move.w     42(a7),d1
[00062e16] d26f 0010                 add.w      16(a7),d1
[00062e1a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00062e20] 3029 0010                 move.w     16(a1),d0
[00062e24] 4eb9 0007 24b0            jsr        v_gtext
[00062e2a] 206f 0008                 movea.l    8(a7),a0
[00062e2e] 1028 0001                 move.b     1(a0),d0
[00062e32] 673a                      beq.s      g_string_15
[00062e34] 322f 0002                 move.w     2(a7),d1
[00062e38] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062e3e] 3028 0010                 move.w     16(a0),d0
[00062e42] 4eb9 0007 358e            jsr        vst_effects
[00062e48] 206f 0008                 movea.l    8(a7),a0
[00062e4c] 5248                      addq.w     #1,a0
[00062e4e] 342f 0028                 move.w     40(a7),d2
[00062e52] 322f 002a                 move.w     42(a7),d1
[00062e56] d26f 0010                 add.w      16(a7),d1
[00062e5a] d26f 000e                 add.w      14(a7),d1
[00062e5e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00062e64] 3029 0010                 move.w     16(a1),d0
[00062e68] 4eb9 0007 24b0            jsr        v_gtext
g_string_15:
[00062e6e] 206f 0008                 movea.l    8(a7),a0
[00062e72] 10b9 000e 1c24            move.b     save,(a0)
[00062e78] 603e                      bra.s      g_string_16
g_string_12:
[00062e7a] 206f 0024                 movea.l    36(a7),a0
[00062e7e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00062e84] 4a40                      tst.w      d0
[00062e86] 6630                      bne.s      g_string_16
[00062e88] 322f 0002                 move.w     2(a7),d1
[00062e8c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062e92] 3028 0010                 move.w     16(a0),d0
[00062e96] 4eb9 0007 358e            jsr        vst_effects
[00062e9c] 206f 0024                 movea.l    36(a7),a0
[00062ea0] 342f 0028                 move.w     40(a7),d2
[00062ea4] 322f 002a                 move.w     42(a7),d1
[00062ea8] 2279 0010 ee4e            movea.l    ACSblk,a1
[00062eae] 3029 0010                 move.w     16(a1),d0
[00062eb2] 4eb9 0007 24b0            jsr        v_gtext
g_string_16:
[00062eb8] 4fef 002c                 lea.l      44(a7),a7
[00062ebc] 245f                      movea.l    (a7)+,a2
[00062ebe] 4e75                      rts

g_stringLen:
[00062ec0] 2f0a                      move.l     a2,-(a7)
[00062ec2] 4fef ffd4                 lea.l      -44(a7),a7
[00062ec6] 2f48 0028                 move.l     a0,40(a7)
[00062eca] 3f40 0026                 move.w     d0,38(a7)
[00062ece] 3f41 0024                 move.w     d1,36(a7)
[00062ed2] 426f 0012                 clr.w      18(a7)
[00062ed6] 426f 0010                 clr.w      16(a7)
[00062eda] 426f 000e                 clr.w      14(a7)
[00062ede] 302f 0024                 move.w     36(a7),d0
[00062ee2] 6704                      beq.s      g_stringLen_1
[00062ee4] 7002                      moveq.l    #2,d0
[00062ee6] 6002                      bra.s      g_stringLen_2
g_stringLen_1:
[00062ee8] 4240                      clr.w      d0
g_stringLen_2:
[00062eea] 3f40 0002                 move.w     d0,2(a7)
[00062eee] 302f 0024                 move.w     36(a7),d0
[00062ef2] 6704                      beq.s      g_stringLen_3
[00062ef4] 7002                      moveq.l    #2,d0
[00062ef6] 6002                      bra.s      g_stringLen_4
g_stringLen_3:
[00062ef8] 4240                      clr.w      d0
g_stringLen_4:
[00062efa] 3e80                      move.w     d0,(a7)
[00062efc] 302f 0026                 move.w     38(a7),d0
[00062f00] c07c 0800                 and.w      #$0800,d0
[00062f04] 6704                      beq.s      g_stringLen_5
[00062f06] 0057 0008                 ori.w      #$0008,(a7)
g_stringLen_5:
[00062f0a] 302f 0026                 move.w     38(a7),d0
[00062f0e] c07c 0400                 and.w      #$0400,d0
[00062f12] 6704                      beq.s      g_stringLen_6
[00062f14] 0057 0010                 ori.w      #$0010,(a7)
g_stringLen_6:
[00062f18] 302f 0026                 move.w     38(a7),d0
[00062f1c] c07c 0300                 and.w      #$0300,d0
[00062f20] 6704                      beq.s      g_stringLen_7
[00062f22] 0057 0001                 ori.w      #$0001,(a7)
g_stringLen_7:
[00062f26] 302f 0026                 move.w     38(a7),d0
[00062f2a] c07c 0c00                 and.w      #$0C00,d0
[00062f2e] 6706                      beq.s      g_stringLen_8
[00062f30] 026f 7fff 0026            andi.w     #$7FFF,38(a7)
g_stringLen_8:
[00062f36] 4200                      clr.b      d0
[00062f38] 1f40 000c                 move.b     d0,12(a7)
[00062f3c] 1f40 000d                 move.b     d0,13(a7)
[00062f40] 302f 0026                 move.w     38(a7),d0
[00062f44] 6726                      beq.s      g_stringLen_9
[00062f46] 302f 0026                 move.w     38(a7),d0
[00062f4a] c07c 8000                 and.w      #$8000,d0
[00062f4e] 661c                      bne.s      g_stringLen_9
[00062f50] 102f 0027                 move.b     39(a7),d0
[00062f54] 4eb9 0004 64c8            jsr        Ach_tolower
[00062f5a] 1f40 000d                 move.b     d0,13(a7)
[00062f5e] 102f 0027                 move.b     39(a7),d0
[00062f62] 4eb9 0004 64b6            jsr        Ach_toupper
[00062f68] 1f40 000c                 move.b     d0,12(a7)
g_stringLen_9:
[00062f6c] 102f 000d                 move.b     13(a7),d0
[00062f70] 4880                      ext.w      d0
[00062f72] 206f 0028                 movea.l    40(a7),a0
[00062f76] 4eb9 0008 2e8a            jsr        strchr
[00062f7c] 2f48 0008                 move.l     a0,8(a7)
[00062f80] 102f 000c                 move.b     12(a7),d0
[00062f84] 4880                      ext.w      d0
[00062f86] 206f 0028                 movea.l    40(a7),a0
[00062f8a] 4eb9 0008 2e8a            jsr        strchr
[00062f90] 2f48 0004                 move.l     a0,4(a7)
[00062f94] 202f 0008                 move.l     8(a7),d0
[00062f98] 6710                      beq.s      g_stringLen_10
[00062f9a] 202f 0004                 move.l     4(a7),d0
[00062f9e] 6710                      beq.s      g_stringLen_11
[00062fa0] 206f 0008                 movea.l    8(a7),a0
[00062fa4] b1ef 0004                 cmpa.l     4(a7),a0
[00062fa8] 6306                      bls.s      g_stringLen_11
g_stringLen_10:
[00062faa] 2f6f 0004 0008            move.l     4(a7),8(a7)
g_stringLen_11:
[00062fb0] 206f 0008                 movea.l    8(a7),a0
[00062fb4] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00062fba] 4a40                      tst.w      d0
[00062fbc] 6600 00da                 bne        g_stringLen_12
[00062fc0] 206f 0008                 movea.l    8(a7),a0
[00062fc4] 13d0 000e 1c26            move.b     (a0),save
[00062fca] 206f 0008                 movea.l    8(a7),a0
[00062fce] 4210                      clr.b      (a0)
[00062fd0] 206f 0028                 movea.l    40(a7),a0
[00062fd4] 1010                      move.b     (a0),d0
[00062fd6] 6738                      beq.s      g_stringLen_13
[00062fd8] 322f 0002                 move.w     2(a7),d1
[00062fdc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00062fe2] 3028 0010                 move.w     16(a0),d0
[00062fe6] 4eb9 0007 358e            jsr        vst_effects
[00062fec] 43ef 0014                 lea.l      20(a7),a1
[00062ff0] 206f 0028                 movea.l    40(a7),a0
[00062ff4] 2479 0010 ee4e            movea.l    ACSblk,a2
[00062ffa] 302a 0010                 move.w     16(a2),d0
[00062ffe] 4eb9 0007 55fe            jsr        vqt_extent
[00063004] 302f 0018                 move.w     24(a7),d0
[00063008] 906f 0014                 sub.w      20(a7),d0
[0006300c] 3f40 0012                 move.w     d0,18(a7)
g_stringLen_13:
[00063010] 3217                      move.w     (a7),d1
[00063012] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063018] 3028 0010                 move.w     16(a0),d0
[0006301c] 4eb9 0007 358e            jsr        vst_effects
[00063022] 43ef 0014                 lea.l      20(a7),a1
[00063026] 41f9 000e 1c26            lea.l      save,a0
[0006302c] 2479 0010 ee4e            movea.l    ACSblk,a2
[00063032] 302a 0010                 move.w     16(a2),d0
[00063036] 4eb9 0007 55fe            jsr        vqt_extent
[0006303c] 302f 0018                 move.w     24(a7),d0
[00063040] 906f 0014                 sub.w      20(a7),d0
[00063044] 3f40 0010                 move.w     d0,16(a7)
[00063048] 206f 0008                 movea.l    8(a7),a0
[0006304c] 1028 0001                 move.b     1(a0),d0
[00063050] 673a                      beq.s      g_stringLen_14
[00063052] 322f 0002                 move.w     2(a7),d1
[00063056] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006305c] 3028 0010                 move.w     16(a0),d0
[00063060] 4eb9 0007 358e            jsr        vst_effects
[00063066] 43ef 0014                 lea.l      20(a7),a1
[0006306a] 206f 0008                 movea.l    8(a7),a0
[0006306e] 5248                      addq.w     #1,a0
[00063070] 2479 0010 ee4e            movea.l    ACSblk,a2
[00063076] 302a 0010                 move.w     16(a2),d0
[0006307a] 4eb9 0007 55fe            jsr        vqt_extent
[00063080] 302f 0018                 move.w     24(a7),d0
[00063084] 906f 0014                 sub.w      20(a7),d0
[00063088] 3f40 000e                 move.w     d0,14(a7)
g_stringLen_14:
[0006308c] 206f 0008                 movea.l    8(a7),a0
[00063090] 10b9 000e 1c26            move.b     save,(a0)
[00063096] 6046                      bra.s      g_stringLen_15
g_stringLen_12:
[00063098] 206f 0028                 movea.l    40(a7),a0
[0006309c] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000630a2] 4a40                      tst.w      d0
[000630a4] 6638                      bne.s      g_stringLen_15
[000630a6] 322f 0002                 move.w     2(a7),d1
[000630aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[000630b0] 3028 0010                 move.w     16(a0),d0
[000630b4] 4eb9 0007 358e            jsr        vst_effects
[000630ba] 43ef 0014                 lea.l      20(a7),a1
[000630be] 206f 0028                 movea.l    40(a7),a0
[000630c2] 2479 0010 ee4e            movea.l    ACSblk,a2
[000630c8] 302a 0010                 move.w     16(a2),d0
[000630cc] 4eb9 0007 55fe            jsr        vqt_extent
[000630d2] 302f 0018                 move.w     24(a7),d0
[000630d6] 906f 0014                 sub.w      20(a7),d0
[000630da] 3f40 0012                 move.w     d0,18(a7)
g_stringLen_15:
[000630de] 302f 0012                 move.w     18(a7),d0
[000630e2] d06f 0010                 add.w      16(a7),d0
[000630e6] d06f 000e                 add.w      14(a7),d0
[000630ea] 4fef 002c                 lea.l      44(a7),a7
[000630ee] 245f                      movea.l    (a7)+,a2
[000630f0] 4e75                      rts

Auo_string:
[000630f2] 4fef ffea                 lea.l      -22(a7),a7
[000630f6] 2f48 0012                 move.l     a0,18(a7)
[000630fa] 3f40 0010                 move.w     d0,16(a7)
[000630fe] 2f49 000c                 move.l     a1,12(a7)
[00063102] 206f 0012                 movea.l    18(a7),a0
[00063106] 2ea8 000c                 move.l     12(a0),(a7)
[0006310a] 302f 0010                 move.w     16(a7),d0
[0006310e] b07c 0014                 cmp.w      #$0014,d0
[00063112] 6200 010c                 bhi        Auo_string_1
[00063116] d040                      add.w      d0,d0
[00063118] 303b 0006                 move.w     $00063120(pc,d0.w),d0
[0006311c] 4efb 0002                 jmp        $00063120(pc,d0.w)
J47:
[00063120] 0100                      dc.w $0100   ; Auo_string_1-J47
[00063122] 002a                      dc.w $002a   ; Auo_string_2-J47
[00063124] 0086                      dc.w $0086   ; Auo_string_3-J47
[00063126] 00ce                      dc.w $00ce   ; Auo_string_4-J47
[00063128] 0096                      dc.w $0096   ; Auo_string_5-J47
[0006312a] 00da                      dc.w $00da   ; Auo_string_6-J47
[0006312c] 00da                      dc.w $00da   ; Auo_string_6-J47
[0006312e] 0100                      dc.w $0100   ; Auo_string_1-J47
[00063130] 0100                      dc.w $0100   ; Auo_string_1-J47
[00063132] 0062                      dc.w $0062   ; Auo_string_7-J47
[00063134] 0100                      dc.w $0100   ; Auo_string_1-J47
[00063136] 0100                      dc.w $0100   ; Auo_string_1-J47
[00063138] 0100                      dc.w $0100   ; Auo_string_1-J47
[0006313a] 0100                      dc.w $0100   ; Auo_string_1-J47
[0006313c] 0100                      dc.w $0100   ; Auo_string_1-J47
[0006313e] 0100                      dc.w $0100   ; Auo_string_1-J47
[00063140] 0100                      dc.w $0100   ; Auo_string_1-J47
[00063142] 0100                      dc.w $0100   ; Auo_string_1-J47
[00063144] 0100                      dc.w $0100   ; Auo_string_1-J47
[00063146] 0094                      dc.w $0094   ; Auo_string_8-J47
[00063148] 0094                      dc.w $0094   ; Auo_string_8-J47
Auo_string_2:
[0006314a] 2057                      movea.l    (a7),a0
[0006314c] 2028 000c                 move.l     12(a0),d0
[00063150] 6712                      beq.s      Auo_string_9
[00063152] 2057                      movea.l    (a7),a0
[00063154] 2068 000c                 movea.l    12(a0),a0
[00063158] 4eb9 0004 643c            jsr        Ast_create
[0006315e] 2257                      movea.l    (a7),a1
[00063160] 2348 000c                 move.l     a0,12(a1)
Auo_string_9:
[00063164] 2057                      movea.l    (a7),a0
[00063166] 2028 000c                 move.l     12(a0),d0
[0006316a] 6612                      bne.s      Auo_string_10
[0006316c] 41f9 000e 1c44            lea.l      $000E1C44,a0
[00063172] 4eb9 0004 643c            jsr        Ast_create
[00063178] 2257                      movea.l    (a7),a1
[0006317a] 2348 000c                 move.l     a0,12(a1)
Auo_string_10:
[0006317e] 6000 00a4                 bra        Auo_string_11
Auo_string_7:
[00063182] 2f6f 000c 0008            move.l     12(a7),8(a7)
[00063188] 206f 0008                 movea.l    8(a7),a0
[0006318c] 2257                      movea.l    (a7),a1
[0006318e] 2350 0010                 move.l     (a0),16(a1)
[00063192] 206f 0008                 movea.l    8(a7),a0
[00063196] 3028 0008                 move.w     8(a0),d0
[0006319a] 48c0                      ext.l      d0
[0006319c] 2057                      movea.l    (a7),a0
[0006319e] 2140 0014                 move.l     d0,20(a0)
[000631a2] 6000 0080                 bra        Auo_string_11
Auo_string_3:
[000631a6] 2057                      movea.l    (a7),a0
[000631a8] 2068 000c                 movea.l    12(a0),a0
[000631ac] 4eb9 0004 649c            jsr        Ast_delete
[000631b2] 6070                      bra.s      Auo_string_11
Auo_string_8:
[000631b4] 606e                      bra.s      Auo_string_11
Auo_string_5:
[000631b6] 2057                      movea.l    (a7),a0
[000631b8] 2068 000c                 movea.l    12(a0),a0
[000631bc] 4eb9 0004 649c            jsr        Ast_delete
[000631c2] 206f 000c                 movea.l    12(a7),a0
[000631c6] 4eb9 0004 643c            jsr        Ast_create
[000631cc] 2257                      movea.l    (a7),a1
[000631ce] 2348 000c                 move.l     a0,12(a1)
[000631d2] 2057                      movea.l    (a7),a0
[000631d4] 2028 000c                 move.l     12(a0),d0
[000631d8] 6612                      bne.s      Auo_string_12
[000631da] 41f9 000e 1c45            lea.l      $000E1C45,a0
[000631e0] 4eb9 0004 643c            jsr        Ast_create
[000631e6] 2257                      movea.l    (a7),a1
[000631e8] 2348 000c                 move.l     a0,12(a1)
Auo_string_12:
[000631ec] 6036                      bra.s      Auo_string_11
Auo_string_4:
[000631ee] 2057                      movea.l    (a7),a0
[000631f0] 226f 000c                 movea.l    12(a7),a1
[000631f4] 22a8 000c                 move.l     12(a0),(a1)
[000631f8] 602a                      bra.s      Auo_string_11
Auo_string_6:
[000631fa] 2057                      movea.l    (a7),a0
[000631fc] 2f68 0010 0004            move.l     16(a0),4(a7)
[00063202] 202f 0004                 move.l     4(a7),d0
[00063206] 6716                      beq.s      Auo_string_13
[00063208] 72ff                      moveq.l    #-1,d1
[0006320a] 2057                      movea.l    (a7),a0
[0006320c] 3028 0016                 move.w     22(a0),d0
[00063210] 206f 0004                 movea.l    4(a7),a0
[00063214] 226f 0004                 movea.l    4(a7),a1
[00063218] 2269 0066                 movea.l    102(a1),a1
[0006321c] 4e91                      jsr        (a1)
Auo_string_13:
[0006321e] 6004                      bra.s      Auo_string_11
Auo_string_1:
[00063220] 4240                      clr.w      d0
[00063222] 6002                      bra.s      Auo_string_14
Auo_string_11:
[00063224] 7001                      moveq.l    #1,d0
Auo_string_14:
[00063226] 4fef 0016                 lea.l      22(a7),a7
[0006322a] 4e75                      rts

A_radiobutton:
[0006322c] 2f02                      move.l     d2,-(a7)
[0006322e] 2f2f 0008                 move.l     8(a7),-(a7)
[00063232] 4eb9 0006 323e            jsr        A_checkbox
[00063238] 584f                      addq.w     #4,a7
[0006323a] 241f                      move.l     (a7)+,d2
[0006323c] 4e75                      rts

A_checkbox:
[0006323e] 2f02                      move.l     d2,-(a7)
[00063240] 2f0a                      move.l     a2,-(a7)
[00063242] 4fef ffae                 lea.l      -82(a7),a7
[00063246] 206f 005e                 movea.l    94(a7),a0
[0006324a] 3028 0016                 move.w     22(a0),d0
[0006324e] 660a                      bne.s      A_checkbox_1
[00063250] 206f 005e                 movea.l    94(a7),a0
[00063254] 3028 0018                 move.w     24(a0),d0
[00063258] 6758                      beq.s      A_checkbox_2
A_checkbox_1:
[0006325a] 206f 005e                 movea.l    94(a7),a0
[0006325e] 3f68 0012 002e            move.w     18(a0),46(a7)
[00063264] 206f 005e                 movea.l    94(a7),a0
[00063268] 3f68 0014 0030            move.w     20(a0),48(a7)
[0006326e] 206f 005e                 movea.l    94(a7),a0
[00063272] 3028 0012                 move.w     18(a0),d0
[00063276] 206f 005e                 movea.l    94(a7),a0
[0006327a] d068 0016                 add.w      22(a0),d0
[0006327e] 5340                      subq.w     #1,d0
[00063280] 3f40 0032                 move.w     d0,50(a7)
[00063284] 206f 005e                 movea.l    94(a7),a0
[00063288] 3028 0014                 move.w     20(a0),d0
[0006328c] 206f 005e                 movea.l    94(a7),a0
[00063290] d068 0018                 add.w      24(a0),d0
[00063294] 5340                      subq.w     #1,d0
[00063296] 3f40 0034                 move.w     d0,52(a7)
[0006329a] 41ef 002e                 lea.l      46(a7),a0
[0006329e] 7201                      moveq.l    #1,d1
[000632a0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000632a6] 3029 0010                 move.w     16(a1),d0
[000632aa] 4eb9 0007 2230            jsr        vs_clip
[000632b0] 6016                      bra.s      A_checkbox_3
A_checkbox_2:
[000632b2] 41ef 002e                 lea.l      46(a7),a0
[000632b6] 4241                      clr.w      d1
[000632b8] 2279 0010 ee4e            movea.l    ACSblk,a1
[000632be] 3029 0010                 move.w     16(a1),d0
[000632c2] 4eb9 0007 2230            jsr        vs_clip
A_checkbox_3:
[000632c8] 206f 005e                 movea.l    94(a7),a0
[000632cc] 3228 0004                 move.w     4(a0),d1
[000632d0] 48c1                      ext.l      d1
[000632d2] 2001                      move.l     d1,d0
[000632d4] d080                      add.l      d0,d0
[000632d6] d081                      add.l      d1,d0
[000632d8] e788                      lsl.l      #3,d0
[000632da] 206f 005e                 movea.l    94(a7),a0
[000632de] 2050                      movea.l    (a0),a0
[000632e0] d1c0                      adda.l     d0,a0
[000632e2] 2f48 0008                 move.l     a0,8(a7)
[000632e6] 206f 0008                 movea.l    8(a7),a0
[000632ea] 41e8 0018                 lea.l      24(a0),a0
[000632ee] 2f48 0004                 move.l     a0,4(a7)
[000632f2] 7020                      moveq.l    #32,d0
[000632f4] 206f 0008                 movea.l    8(a7),a0
[000632f8] c068 0008                 and.w      8(a0),d0
[000632fc] 661a                      bne.s      A_checkbox_4
[000632fe] 206f 0004                 movea.l    4(a7),a0
[00063302] 3028 0008                 move.w     8(a0),d0
[00063306] c07c 8000                 and.w      #$8000,d0
[0006330a] 670c                      beq.s      A_checkbox_4
[0006330c] 206f 0004                 movea.l    4(a7),a0
[00063310] 3f68 000a 0018            move.w     10(a0),24(a7)
[00063316] 6004                      bra.s      A_checkbox_5
A_checkbox_4:
[00063318] 426f 0018                 clr.w      24(a7)
A_checkbox_5:
[0006331c] 206f 0008                 movea.l    8(a7),a0
[00063320] 2f68 000c 000c            move.l     12(a0),12(a7)
[00063326] 206f 000c                 movea.l    12(a7),a0
[0006332a] 2ea8 000c                 move.l     12(a0),(a7)
[0006332e] 2017                      move.l     (a7),d0
[00063330] 670e                      beq.s      A_checkbox_6
[00063332] 2057                      movea.l    (a7),a0
[00063334] 4eb9 0008 2f6c            jsr        strlen
[0006333a] 3f40 001c                 move.w     d0,28(a7)
[0006333e] 6004                      bra.s      A_checkbox_7
A_checkbox_6:
[00063340] 426f 001c                 clr.w      28(a7)
A_checkbox_7:
[00063344] 206f 005e                 movea.l    94(a7),a0
[00063348] 3028 0006                 move.w     6(a0),d0
[0006334c] 206f 005e                 movea.l    94(a7),a0
[00063350] 3228 0008                 move.w     8(a0),d1
[00063354] b340                      eor.w      d1,d0
[00063356] 3f40 0024                 move.w     d0,36(a7)
[0006335a] 302f 001c                 move.w     28(a7),d0
[0006335e] 6f00 0224                 ble        A_checkbox_8
[00063362] 206f 005e                 movea.l    94(a7),a0
[00063366] 3028 0010                 move.w     16(a0),d0
[0006336a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063370] 9068 0014                 sub.w      20(a0),d0
[00063374] e240                      asr.w      #1,d0
[00063376] 206f 005e                 movea.l    94(a7),a0
[0006337a] d068 000c                 add.w      12(a0),d0
[0006337e] 3f40 002a                 move.w     d0,42(a7)
[00063382] 302f 0024                 move.w     36(a7),d0
[00063386] 6600 01b8                 bne        A_checkbox_9
[0006338a] 7202                      moveq.l    #2,d1
[0006338c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063392] 3028 0010                 move.w     16(a0),d0
[00063396] 4eb9 0007 3070            jsr        vswr_mode
[0006339c] 4241                      clr.w      d1
[0006339e] 2079 0010 ee4e            movea.l    ACSblk,a0
[000633a4] 3028 0010                 move.w     16(a0),d0
[000633a8] 4eb9 0007 3492            jsr        vst_rotation
[000633ae] 7201                      moveq.l    #1,d1
[000633b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000633b6] 3028 0010                 move.w     16(a0),d0
[000633ba] 4eb9 0007 353a            jsr        vst_color
[000633c0] 43ef 0022                 lea.l      34(a7),a1
[000633c4] 41ef 0022                 lea.l      34(a7),a0
[000633c8] 7405                      moveq.l    #5,d2
[000633ca] 4241                      clr.w      d1
[000633cc] 2479 0010 ee4e            movea.l    ACSblk,a2
[000633d2] 302a 0010                 move.w     16(a2),d0
[000633d6] 4eb9 0007 35e2            jsr        vst_alignment
[000633dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000633e2] 3228 0290                 move.w     656(a0),d1
[000633e6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000633ec] 3028 0010                 move.w     16(a0),d0
[000633f0] 4eb9 0007 34e6            jsr        vst_font
[000633f6] 486f 0022                 pea.l      34(a7)
[000633fa] 486f 0026                 pea.l      38(a7)
[000633fe] 43ef 002a                 lea.l      42(a7),a1
[00063402] 41ef 002a                 lea.l      42(a7),a0
[00063406] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006340c] 322a 0292                 move.w     658(a2),d1
[00063410] 2479 0010 ee4e            movea.l    ACSblk,a2
[00063416] 302a 0010                 move.w     16(a2),d0
[0006341a] 4eb9 0007 3370            jsr        vst_height
[00063420] 504f                      addq.w     #8,a7
[00063422] 7008                      moveq.l    #8,d0
[00063424] 206f 005e                 movea.l    94(a7),a0
[00063428] c068 0008                 and.w      8(a0),d0
[0006342c] 6726                      beq.s      A_checkbox_10
[0006342e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063434] 2068 023c                 movea.l    572(a0),a0
[00063438] 3028 000e                 move.w     14(a0),d0
[0006343c] c07c 0100                 and.w      #$0100,d0
[00063440] 660e                      bne.s      A_checkbox_11
[00063442] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063448] 0c68 0002 001c            cmpi.w     #$0002,28(a0)
[0006344e] 6f04                      ble.s      A_checkbox_10
A_checkbox_11:
[00063450] 7201                      moveq.l    #1,d1
[00063452] 6002                      bra.s      A_checkbox_12
A_checkbox_10:
[00063454] 4241                      clr.w      d1
A_checkbox_12:
[00063456] 302f 0018                 move.w     24(a7),d0
[0006345a] 2057                      movea.l    (a7),a0
[0006345c] 6100 fa62                 bsr        g_stringLen
[00063460] 3f40 001a                 move.w     d0,26(a7)
[00063464] 7008                      moveq.l    #8,d0
[00063466] 206f 005e                 movea.l    94(a7),a0
[0006346a] c068 0008                 and.w      8(a0),d0
[0006346e] 6774                      beq.s      A_checkbox_13
[00063470] 4267                      clr.w      -(a7)
[00063472] 342f 001a                 move.w     26(a7),d2
[00063476] 206f 0002                 movea.l    2(a7),a0
[0006347a] 322f 002c                 move.w     44(a7),d1
[0006347e] 226f 0060                 movea.l    96(a7),a1
[00063482] 3029 000a                 move.w     10(a1),d0
[00063486] 226f 0060                 movea.l    96(a7),a1
[0006348a] d069 000e                 add.w      14(a1),d0
[0006348e] 906f 001c                 sub.w      28(a7),d0
[00063492] 6100 f7d2                 bsr        g_string
[00063496] 544f                      addq.w     #2,a7
[00063498] 7203                      moveq.l    #3,d1
[0006349a] 2079 0010 ee4e            movea.l    ACSblk,a0
[000634a0] 3028 0010                 move.w     16(a0),d0
[000634a4] 4eb9 0007 3070            jsr        vswr_mode
[000634aa] 4267                      clr.w      -(a7)
[000634ac] 342f 001a                 move.w     26(a7),d2
[000634b0] 206f 0002                 movea.l    2(a7),a0
[000634b4] 322f 002c                 move.w     44(a7),d1
[000634b8] 226f 0060                 movea.l    96(a7),a1
[000634bc] 3029 000a                 move.w     10(a1),d0
[000634c0] 226f 0060                 movea.l    96(a7),a1
[000634c4] d069 000e                 add.w      14(a1),d0
[000634c8] 906f 001c                 sub.w      28(a7),d0
[000634cc] 6100 f798                 bsr        g_string
[000634d0] 544f                      addq.w     #2,a7
[000634d2] 7202                      moveq.l    #2,d1
[000634d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000634da] 3028 0010                 move.w     16(a0),d0
[000634de] 4eb9 0007 3070            jsr        vswr_mode
A_checkbox_13:
[000634e4] 7008                      moveq.l    #8,d0
[000634e6] 206f 005e                 movea.l    94(a7),a0
[000634ea] c068 0008                 and.w      8(a0),d0
[000634ee] 6726                      beq.s      A_checkbox_14
[000634f0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000634f6] 2068 023c                 movea.l    572(a0),a0
[000634fa] 3028 000e                 move.w     14(a0),d0
[000634fe] c07c 0100                 and.w      #$0100,d0
[00063502] 660e                      bne.s      A_checkbox_15
[00063504] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006350a] 0c68 0002 001c            cmpi.w     #$0002,28(a0)
[00063510] 6f04                      ble.s      A_checkbox_14
A_checkbox_15:
[00063512] 7001                      moveq.l    #1,d0
[00063514] 6002                      bra.s      A_checkbox_16
A_checkbox_14:
[00063516] 4240                      clr.w      d0
A_checkbox_16:
[00063518] 3f00                      move.w     d0,-(a7)
[0006351a] 342f 001a                 move.w     26(a7),d2
[0006351e] 206f 0002                 movea.l    2(a7),a0
[00063522] 322f 002c                 move.w     44(a7),d1
[00063526] 226f 0060                 movea.l    96(a7),a1
[0006352a] 3029 000a                 move.w     10(a1),d0
[0006352e] 226f 0060                 movea.l    96(a7),a1
[00063532] d069 000e                 add.w      14(a1),d0
[00063536] 906f 001c                 sub.w      28(a7),d0
[0006353a] 6100 f72a                 bsr        g_string
[0006353e] 544f                      addq.w     #2,a7
A_checkbox_9:
[00063540] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063546] 3028 0014                 move.w     20(a0),d0
[0006354a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063550] c1e8 0004                 muls.w     4(a0),d0
[00063554] 48c0                      ext.l      d0
[00063556] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006355c] 81e8 0006                 divs.w     6(a0),d0
[00063560] 3f40 0012                 move.w     d0,18(a7)
[00063564] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006356a] 3f68 0014 0010            move.w     20(a0),16(a7)
[00063570] 302f 0012                 move.w     18(a7),d0
[00063574] e240                      asr.w      #1,d0
[00063576] 206f 005e                 movea.l    94(a7),a0
[0006357a] d068 000a                 add.w      10(a0),d0
[0006357e] 3f40 002c                 move.w     d0,44(a7)
[00063582] 6028                      bra.s      A_checkbox_17
A_checkbox_8:
[00063584] 206f 005e                 movea.l    94(a7),a0
[00063588] 3f68 000e 0012            move.w     14(a0),18(a7)
[0006358e] 206f 005e                 movea.l    94(a7),a0
[00063592] 3f68 0010 0010            move.w     16(a0),16(a7)
[00063598] 206f 005e                 movea.l    94(a7),a0
[0006359c] 3f68 000a 002c            move.w     10(a0),44(a7)
[000635a2] 206f 005e                 movea.l    94(a7),a0
[000635a6] 3f68 000c 002a            move.w     12(a0),42(a7)
A_checkbox_17:
[000635ac] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[000635b2] 6608                      bne.s      A_checkbox_18
[000635b4] 0c6f 0010 0012            cmpi.w     #$0010,18(a7)
[000635ba] 6724                      beq.s      A_checkbox_19
A_checkbox_18:
[000635bc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000635c2] 302f 0010                 move.w     16(a7),d0
[000635c6] b068 0014                 cmp.w      20(a0),d0
[000635ca] 6600 04a8                 bne        A_checkbox_20
[000635ce] 302f 001c                 move.w     28(a7),d0
[000635d2] 6f00 04a0                 ble        A_checkbox_20
[000635d6] 0c6f 000f 0010            cmpi.w     #$000F,16(a7)
[000635dc] 6d00 0496                 blt        A_checkbox_20
A_checkbox_19:
[000635e0] 42b9 0011 452c            clr.l      act
[000635e6] 7010                      moveq.l    #16,d0
[000635e8] 206f 005e                 movea.l    94(a7),a0
[000635ec] 3428 0004                 move.w     4(a0),d2
[000635f0] 48c2                      ext.l      d2
[000635f2] 2202                      move.l     d2,d1
[000635f4] d281                      add.l      d1,d1
[000635f6] d282                      add.l      d2,d1
[000635f8] e789                      lsl.l      #3,d1
[000635fa] 206f 005e                 movea.l    94(a7),a0
[000635fe] 2050                      movea.l    (a0),a0
[00063600] c070 1808                 and.w      8(a0,d1.l),d0
[00063604] 6700 013e                 beq        A_checkbox_21
[00063608] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006360e] 2068 023c                 movea.l    572(a0),a0
[00063612] 3028 000e                 move.w     14(a0),d0
[00063616] c07c 0100                 and.w      #$0100,d0
[0006361a] 660c                      bne.s      A_checkbox_22
[0006361c] 7001                      moveq.l    #1,d0
[0006361e] 206f 005e                 movea.l    94(a7),a0
[00063622] c0a8 001a                 and.l      26(a0),d0
[00063626] 664e                      bne.s      A_checkbox_23
A_checkbox_22:
[00063628] 7001                      moveq.l    #1,d0
[0006362a] 206f 005e                 movea.l    94(a7),a0
[0006362e] c068 0008                 and.w      8(a0),d0
[00063632] 6720                      beq.s      A_checkbox_24
[00063634] 7008                      moveq.l    #8,d0
[00063636] 206f 005e                 movea.l    94(a7),a0
[0006363a] c068 0008                 and.w      8(a0),d0
[0006363e] 670a                      beq.s      A_checkbox_25
[00063640] 2f7c 000d f026 001e       move.l     #_RD_1D_DS,30(a7)
[00063648] 6008                      bra.s      A_checkbox_26
A_checkbox_25:
[0006364a] 2f7c 000d f0f2 001e       move.l     #_RD_1D_S,30(a7)
A_checkbox_26:
[00063652] 601e                      bra.s      A_checkbox_27
A_checkbox_24:
[00063654] 7008                      moveq.l    #8,d0
[00063656] 206f 005e                 movea.l    94(a7),a0
[0006365a] c068 0008                 and.w      8(a0),d0
[0006365e] 670a                      beq.s      A_checkbox_28
[00063660] 2f7c 000d f08c 001e       move.l     #_RD_1D_DU,30(a7)
[00063668] 6008                      bra.s      A_checkbox_27
A_checkbox_28:
[0006366a] 2f7c 000d f158 001e       move.l     #_RD_1D_U,30(a7)
A_checkbox_27:
[00063672] 6000 00cc                 bra        A_checkbox_29
A_checkbox_23:
[00063676] 7001                      moveq.l    #1,d0
[00063678] 206f 005e                 movea.l    94(a7),a0
[0006367c] c068 0008                 and.w      8(a0),d0
[00063680] 6760                      beq.s      A_checkbox_30
[00063682] 7008                      moveq.l    #8,d0
[00063684] 206f 005e                 movea.l    94(a7),a0
[00063688] c068 0008                 and.w      8(a0),d0
[0006368c] 672a                      beq.s      A_checkbox_31
[0006368e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063694] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[0006369a] 6d12                      blt.s      A_checkbox_32
[0006369c] 2039 000e 1c14            move.l     icn_rad_dissel,d0
[000636a2] 670a                      beq.s      A_checkbox_32
[000636a4] 23f9 000e 1c14 0011 452c  move.l     icn_rad_dissel,act
A_checkbox_32:
[000636ae] 2f7c 000d f1ea 001e       move.l     #_RD_3D_DS,30(a7)
[000636b6] 6028                      bra.s      A_checkbox_33
A_checkbox_31:
[000636b8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000636be] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[000636c4] 6d12                      blt.s      A_checkbox_34
[000636c6] 2039 000e 1c0c            move.l     icn_rad_sel,d0
[000636cc] 670a                      beq.s      A_checkbox_34
[000636ce] 23f9 000e 1c0c 0011 452c  move.l     icn_rad_sel,act
A_checkbox_34:
[000636d8] 2f7c 000d f30e 001e       move.l     #_RD_3D_S,30(a7)
A_checkbox_33:
[000636e0] 605e                      bra.s      A_checkbox_29
A_checkbox_30:
[000636e2] 7008                      moveq.l    #8,d0
[000636e4] 206f 005e                 movea.l    94(a7),a0
[000636e8] c068 0008                 and.w      8(a0),d0
[000636ec] 672a                      beq.s      A_checkbox_35
[000636ee] 2079 0010 ee4e            movea.l    ACSblk,a0
[000636f4] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[000636fa] 6d12                      blt.s      A_checkbox_36
[000636fc] 2039 000e 1c14            move.l     icn_rad_dissel,d0
[00063702] 670a                      beq.s      A_checkbox_36
[00063704] 23f9 000e 1c18 0011 452c  move.l     icn_rad_disun,act
A_checkbox_36:
[0006370e] 2f7c 000d f27c 001e       move.l     #_RD_3D_DU,30(a7)
[00063716] 6028                      bra.s      A_checkbox_29
A_checkbox_35:
[00063718] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006371e] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00063724] 6d12                      blt.s      A_checkbox_37
[00063726] 2039 000e 1c0c            move.l     icn_rad_sel,d0
[0006372c] 670a                      beq.s      A_checkbox_37
[0006372e] 23f9 000e 1c10 0011 452c  move.l     icn_rad_un,act
A_checkbox_37:
[00063738] 2f7c 000d f3a0 001e       move.l     #_RD_3D_U,30(a7)
A_checkbox_29:
[00063740] 6000 013a                 bra        A_checkbox_38
A_checkbox_21:
[00063744] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006374a] 2068 023c                 movea.l    572(a0),a0
[0006374e] 3028 000e                 move.w     14(a0),d0
[00063752] c07c 0100                 and.w      #$0100,d0
[00063756] 660c                      bne.s      A_checkbox_39
[00063758] 7001                      moveq.l    #1,d0
[0006375a] 206f 005e                 movea.l    94(a7),a0
[0006375e] c0a8 001a                 and.l      26(a0),d0
[00063762] 664e                      bne.s      A_checkbox_40
A_checkbox_39:
[00063764] 7001                      moveq.l    #1,d0
[00063766] 206f 005e                 movea.l    94(a7),a0
[0006376a] c068 0008                 and.w      8(a0),d0
[0006376e] 6720                      beq.s      A_checkbox_41
[00063770] 7008                      moveq.l    #8,d0
[00063772] 206f 005e                 movea.l    94(a7),a0
[00063776] c068 0008                 and.w      8(a0),d0
[0006377a] 670a                      beq.s      A_checkbox_42
[0006377c] 2f7c 000d ddb8 001e       move.l     #_CHK_1D_DS,30(a7)
[00063784] 6008                      bra.s      A_checkbox_43
A_checkbox_42:
[00063786] 2f7c 000d de84 001e       move.l     #_CHK_1D_S,30(a7)
A_checkbox_43:
[0006378e] 601e                      bra.s      A_checkbox_44
A_checkbox_41:
[00063790] 7008                      moveq.l    #8,d0
[00063792] 206f 005e                 movea.l    94(a7),a0
[00063796] c068 0008                 and.w      8(a0),d0
[0006379a] 670a                      beq.s      A_checkbox_45
[0006379c] 2f7c 000d de1e 001e       move.l     #_CHK_1D_DU,30(a7)
[000637a4] 6008                      bra.s      A_checkbox_44
A_checkbox_45:
[000637a6] 2f7c 000d deea 001e       move.l     #_CHK_1D_U,30(a7)
A_checkbox_44:
[000637ae] 6000 00cc                 bra        A_checkbox_38
A_checkbox_40:
[000637b2] 7001                      moveq.l    #1,d0
[000637b4] 206f 005e                 movea.l    94(a7),a0
[000637b8] c068 0008                 and.w      8(a0),d0
[000637bc] 6760                      beq.s      A_checkbox_46
[000637be] 7008                      moveq.l    #8,d0
[000637c0] 206f 005e                 movea.l    94(a7),a0
[000637c4] c068 0008                 and.w      8(a0),d0
[000637c8] 672a                      beq.s      A_checkbox_47
[000637ca] 2079 0010 ee4e            movea.l    ACSblk,a0
[000637d0] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[000637d6] 6d12                      blt.s      A_checkbox_48
[000637d8] 2039 000e 1c04            move.l     icn_chk_dissel,d0
[000637de] 670a                      beq.s      A_checkbox_48
[000637e0] 23f9 000e 1c04 0011 452c  move.l     icn_chk_dissel,act
A_checkbox_48:
[000637ea] 2f7c 000d df7c 001e       move.l     #_CHK_3D_DS,30(a7)
[000637f2] 6028                      bra.s      A_checkbox_49
A_checkbox_47:
[000637f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000637fa] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00063800] 6d12                      blt.s      A_checkbox_50
[00063802] 2039 000e 1bfc            move.l     icn_chk_sel,d0
[00063808] 670a                      beq.s      A_checkbox_50
[0006380a] 23f9 000e 1bfc 0011 452c  move.l     icn_chk_sel,act
A_checkbox_50:
[00063814] 2f7c 000d e0a0 001e       move.l     #_CHK_3D_S,30(a7)
A_checkbox_49:
[0006381c] 605e                      bra.s      A_checkbox_38
A_checkbox_46:
[0006381e] 7008                      moveq.l    #8,d0
[00063820] 206f 005e                 movea.l    94(a7),a0
[00063824] c068 0008                 and.w      8(a0),d0
[00063828] 672a                      beq.s      A_checkbox_51
[0006382a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063830] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00063836] 6d12                      blt.s      A_checkbox_52
[00063838] 2039 000e 1c08            move.l     icn_chk_disun,d0
[0006383e] 670a                      beq.s      A_checkbox_52
[00063840] 23f9 000e 1c08 0011 452c  move.l     icn_chk_disun,act
A_checkbox_52:
[0006384a] 2f7c 000d e00e 001e       move.l     #_CHK_3D_DU,30(a7)
[00063852] 6028                      bra.s      A_checkbox_38
A_checkbox_51:
[00063854] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006385a] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00063860] 6d12                      blt.s      A_checkbox_53
[00063862] 2039 000e 1c00            move.l     icn_chk_un,d0
[00063868] 670a                      beq.s      A_checkbox_53
[0006386a] 23f9 000e 1c00 0011 452c  move.l     icn_chk_un,act
A_checkbox_53:
[00063874] 2f7c 000d e132 001e       move.l     #_CHK_3D_U,30(a7)
A_checkbox_38:
[0006387c] 426f 0036                 clr.w      54(a7)
[00063880] 426f 0038                 clr.w      56(a7)
[00063884] 3f7c 000f 003a            move.w     #$000F,58(a7)
[0006388a] 3f7c 000f 003c            move.w     #$000F,60(a7)
[00063890] 206f 005e                 movea.l    94(a7),a0
[00063894] 3f68 000a 003e            move.w     10(a0),62(a7)
[0006389a] 206f 005e                 movea.l    94(a7),a0
[0006389e] 3028 0010                 move.w     16(a0),d0
[000638a2] e240                      asr.w      #1,d0
[000638a4] 206f 005e                 movea.l    94(a7),a0
[000638a8] d068 000c                 add.w      12(a0),d0
[000638ac] 5140                      subq.w     #8,d0
[000638ae] 3f40 0040                 move.w     d0,64(a7)
[000638b2] 700f                      moveq.l    #15,d0
[000638b4] d06f 003e                 add.w      62(a7),d0
[000638b8] 3f40 0042                 move.w     d0,66(a7)
[000638bc] 700f                      moveq.l    #15,d0
[000638be] d06f 0040                 add.w      64(a7),d0
[000638c2] 3f40 0044                 move.w     d0,68(a7)
[000638c6] 206f 001e                 movea.l    30(a7),a0
[000638ca] 23d0 000e 1c28            move.l     (a0),rad
[000638d0] 4240                      clr.w      d0
[000638d2] 33c0 000e 1c3a            move.w     d0,$000E1C3A
[000638d8] 33c0 000e 1c38            move.w     d0,$000E1C38
[000638de] 33c0 000e 1c36            move.w     d0,$000E1C36
[000638e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000638ea] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[000638f0] 6e30                      bgt.s      A_checkbox_54
[000638f2] 4879 000e 1c40            pea.l      col2
[000638f8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000638fe] 4868 026a                 pea.l      618(a0)
[00063902] 43f9 000e 1c28            lea.l      rad,a1
[00063908] 41ef 003e                 lea.l      62(a7),a0
[0006390c] 7202                      moveq.l    #2,d1
[0006390e] 2479 0010 ee4e            movea.l    ACSblk,a2
[00063914] 302a 0010                 move.w     16(a2),d0
[00063918] 4eb9 0007 4902            jsr        vrt_cpyfm
[0006391e] 504f                      addq.w     #8,a7
[00063920] 605c                      bra.s      A_checkbox_55
A_checkbox_54:
[00063922] 7201                      moveq.l    #1,d1
[00063924] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006392a] 3028 0010                 move.w     16(a0),d0
[0006392e] 4eb9 0007 3070            jsr        vswr_mode
[00063934] 7201                      moveq.l    #1,d1
[00063936] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006393c] 3028 0010                 move.w     16(a0),d0
[00063940] 4eb9 0007 3660            jsr        vsf_interior
[00063946] 7201                      moveq.l    #1,d1
[00063948] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006394e] 3028 0010                 move.w     16(a0),d0
[00063952] 4eb9 0007 375c            jsr        vsf_perimeter
[00063958] 4241                      clr.w      d1
[0006395a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063960] 3028 0010                 move.w     16(a0),d0
[00063964] 4eb9 0007 3708            jsr        vsf_color
[0006396a] 41ef 003e                 lea.l      62(a7),a0
[0006396e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00063974] 3029 0010                 move.w     16(a1),d0
[00063978] 4eb9 0007 282e            jsr        v_bar
A_checkbox_55:
[0006397e] 2039 0011 452c            move.l     act,d0
[00063984] 6710                      beq.s      A_checkbox_56
[00063986] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006398c] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[00063992] 6f00 007c                 ble.w      A_checkbox_57
A_checkbox_56:
[00063996] 206f 001e                 movea.l    30(a7),a0
[0006399a] 23e8 0004 000e 1c28       move.l     4(a0),rad
[000639a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000639a8] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[000639ae] 6e30                      bgt.s      A_checkbox_58
[000639b0] 4879 000e 1c3c            pea.l      col
[000639b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000639bc] 4868 026a                 pea.l      618(a0)
[000639c0] 43f9 000e 1c28            lea.l      rad,a1
[000639c6] 41ef 003e                 lea.l      62(a7),a0
[000639ca] 7202                      moveq.l    #2,d1
[000639cc] 2479 0010 ee4e            movea.l    ACSblk,a2
[000639d2] 302a 0010                 move.w     16(a2),d0
[000639d6] 4eb9 0007 4902            jsr        vrt_cpyfm
[000639dc] 504f                      addq.w     #8,a7
[000639de] 602e                      bra.s      A_checkbox_59
A_checkbox_58:
[000639e0] 4879 000e 1c3c            pea.l      col
[000639e6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000639ec] 4868 026a                 pea.l      618(a0)
[000639f0] 43f9 000e 1c28            lea.l      rad,a1
[000639f6] 41ef 003e                 lea.l      62(a7),a0
[000639fa] 7202                      moveq.l    #2,d1
[000639fc] 2479 0010 ee4e            movea.l    ACSblk,a2
[00063a02] 302a 0010                 move.w     16(a2),d0
[00063a06] 4eb9 0007 4902            jsr        vrt_cpyfm
[00063a0c] 504f                      addq.w     #8,a7
A_checkbox_59:
[00063a0e] 6060                      bra.s      A_checkbox_60
A_checkbox_57:
[00063a10] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063a16] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[00063a1c] 6e2a                      bgt.s      A_checkbox_61
[00063a1e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063a24] 4868 026a                 pea.l      618(a0)
[00063a28] 2279 0011 452c            movea.l    act,a1
[00063a2e] 41ef 003a                 lea.l      58(a7),a0
[00063a32] 7207                      moveq.l    #7,d1
[00063a34] 2479 0010 ee4e            movea.l    ACSblk,a2
[00063a3a] 302a 0010                 move.w     16(a2),d0
[00063a3e] 4eb9 0007 489e            jsr        vro_cpyfm
[00063a44] 584f                      addq.w     #4,a7
[00063a46] 6028                      bra.s      A_checkbox_60
A_checkbox_61:
[00063a48] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063a4e] 4868 026a                 pea.l      618(a0)
[00063a52] 2279 0011 452c            movea.l    act,a1
[00063a58] 41ef 003a                 lea.l      58(a7),a0
[00063a5c] 7203                      moveq.l    #3,d1
[00063a5e] 2479 0010 ee4e            movea.l    ACSblk,a2
[00063a64] 302a 0010                 move.w     16(a2),d0
[00063a68] 4eb9 0007 489e            jsr        vro_cpyfm
[00063a6e] 584f                      addq.w     #4,a7
A_checkbox_60:
[00063a70] 6000 07ba                 bra        A_checkbox_62
A_checkbox_20:
[00063a74] 7008                      moveq.l    #8,d0
[00063a76] 206f 005e                 movea.l    94(a7),a0
[00063a7a] c068 0008                 and.w      8(a0),d0
[00063a7e] 6700 02e2                 beq        A_checkbox_63
[00063a82] 7201                      moveq.l    #1,d1
[00063a84] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063a8a] 3028 0010                 move.w     16(a0),d0
[00063a8e] 4eb9 0007 3070            jsr        vswr_mode
[00063a94] 7202                      moveq.l    #2,d1
[00063a96] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063a9c] 3028 0010                 move.w     16(a0),d0
[00063aa0] 4eb9 0007 3660            jsr        vsf_interior
[00063aa6] 7204                      moveq.l    #4,d1
[00063aa8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063aae] 3028 0010                 move.w     16(a0),d0
[00063ab2] 4eb9 0007 36b4            jsr        vsf_style
[00063ab8] 7201                      moveq.l    #1,d1
[00063aba] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063ac0] 3028 0010                 move.w     16(a0),d0
[00063ac4] 4eb9 0007 375c            jsr        vsf_perimeter
[00063aca] 7201                      moveq.l    #1,d1
[00063acc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063ad2] 3028 0010                 move.w     16(a0),d0
[00063ad6] 4eb9 0007 3708            jsr        vsf_color
[00063adc] 7010                      moveq.l    #16,d0
[00063ade] 206f 005e                 movea.l    94(a7),a0
[00063ae2] 3428 0004                 move.w     4(a0),d2
[00063ae6] 48c2                      ext.l      d2
[00063ae8] 2202                      move.l     d2,d1
[00063aea] d281                      add.l      d1,d1
[00063aec] d282                      add.l      d2,d1
[00063aee] e789                      lsl.l      #3,d1
[00063af0] 206f 005e                 movea.l    94(a7),a0
[00063af4] 2050                      movea.l    (a0),a0
[00063af6] c070 1808                 and.w      8(a0,d1.l),d0
[00063afa] 6700 00cc                 beq        A_checkbox_64
[00063afe] 70fe                      moveq.l    #-2,d0
[00063b00] d06f 0012                 add.w      18(a7),d0
[00063b04] e240                      asr.w      #1,d0
[00063b06] 3f40 0028                 move.w     d0,40(a7)
[00063b0a] 0c6f 0004 0028            cmpi.w     #$0004,40(a7)
[00063b10] 6c06                      bge.s      A_checkbox_65
[00063b12] 3f7c 0004 0028            move.w     #$0004,40(a7)
A_checkbox_65:
[00063b18] 70fe                      moveq.l    #-2,d0
[00063b1a] d06f 0010                 add.w      16(a7),d0
[00063b1e] e240                      asr.w      #1,d0
[00063b20] 3f40 0026                 move.w     d0,38(a7)
[00063b24] 0c6f 0004 0026            cmpi.w     #$0004,38(a7)
[00063b2a] 6c06                      bge.s      A_checkbox_66
[00063b2c] 3f7c 0004 0026            move.w     #$0004,38(a7)
A_checkbox_66:
[00063b32] 302f 001c                 move.w     28(a7),d0
[00063b36] 660a                      bne.s      A_checkbox_67
[00063b38] 302f 0012                 move.w     18(a7),d0
[00063b3c] e240                      asr.w      #1,d0
[00063b3e] d16f 002c                 add.w      d0,44(a7)
A_checkbox_67:
[00063b42] 302f 0010                 move.w     16(a7),d0
[00063b46] e240                      asr.w      #1,d0
[00063b48] d16f 002a                 add.w      d0,42(a7)
[00063b4c] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[00063b52] 6608                      bne.s      A_checkbox_68
[00063b54] 0c6f 0010 0012            cmpi.w     #$0010,18(a7)
[00063b5a] 671e                      beq.s      A_checkbox_69
A_checkbox_68:
[00063b5c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063b62] 302f 0010                 move.w     16(a7),d0
[00063b66] b068 0014                 cmp.w      20(a0),d0
[00063b6a] 662e                      bne.s      A_checkbox_70
[00063b6c] 302f 001c                 move.w     28(a7),d0
[00063b70] 6f28                      ble.s      A_checkbox_70
[00063b72] 0c6f 000f 0010            cmpi.w     #$000F,16(a7)
[00063b78] 6d20                      blt.s      A_checkbox_70
A_checkbox_69:
[00063b7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063b80] 2068 023c                 movea.l    572(a0),a0
[00063b84] 3028 000e                 move.w     14(a0),d0
[00063b88] c07c 0100                 and.w      #$0100,d0
[00063b8c] 660c                      bne.s      A_checkbox_70
[00063b8e] 7001                      moveq.l    #1,d0
[00063b90] 206f 005e                 movea.l    94(a7),a0
[00063b94] c0a8 001a                 and.l      26(a0),d0
[00063b98] 6608                      bne.s      A_checkbox_71
A_checkbox_70:
[00063b9a] 556f 0028                 subq.w     #2,40(a7)
[00063b9e] 556f 0026                 subq.w     #2,38(a7)
A_checkbox_71:
[00063ba2] 3f2f 0026                 move.w     38(a7),-(a7)
[00063ba6] 3f2f 002a                 move.w     42(a7),-(a7)
[00063baa] 342f 002e                 move.w     46(a7),d2
[00063bae] 322f 0030                 move.w     48(a7),d1
[00063bb2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063bb8] 3028 0010                 move.w     16(a0),d0
[00063bbc] 4eb9 0007 29e4            jsr        v_ellipse
[00063bc2] 584f                      addq.w     #4,a7
[00063bc4] 6000 0198                 bra        A_checkbox_72
A_checkbox_64:
[00063bc8] 302f 001c                 move.w     28(a7),d0
[00063bcc] 6f00 009e                 ble        A_checkbox_73
[00063bd0] 70fe                      moveq.l    #-2,d0
[00063bd2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063bd8] d068 0014                 add.w      20(a0),d0
[00063bdc] 3f40 0014                 move.w     d0,20(a7)
[00063be0] 0c6f 0008 0014            cmpi.w     #$0008,20(a7)
[00063be6] 6c06                      bge.s      A_checkbox_74
[00063be8] 3f7c 0008 0014            move.w     #$0008,20(a7)
A_checkbox_74:
[00063bee] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063bf4] 3028 0014                 move.w     20(a0),d0
[00063bf8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063bfe] c1e8 0004                 muls.w     4(a0),d0
[00063c02] 48c0                      ext.l      d0
[00063c04] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063c0a] 81e8 0006                 divs.w     6(a0),d0
[00063c0e] 5940                      subq.w     #4,d0
[00063c10] 3f40 0016                 move.w     d0,22(a7)
[00063c14] 0c6f 0008 0016            cmpi.w     #$0008,22(a7)
[00063c1a] 6c06                      bge.s      A_checkbox_75
[00063c1c] 3f7c 0008 0016            move.w     #$0008,22(a7)
A_checkbox_75:
[00063c22] 7002                      moveq.l    #2,d0
[00063c24] 206f 005e                 movea.l    94(a7),a0
[00063c28] d068 000a                 add.w      10(a0),d0
[00063c2c] 3f40 004a                 move.w     d0,74(a7)
[00063c30] 206f 005e                 movea.l    94(a7),a0
[00063c34] 3028 0010                 move.w     16(a0),d0
[00063c38] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063c3e] 9068 0014                 sub.w      20(a0),d0
[00063c42] e240                      asr.w      #1,d0
[00063c44] 206f 005e                 movea.l    94(a7),a0
[00063c48] d068 000c                 add.w      12(a0),d0
[00063c4c] 3f40 004c                 move.w     d0,76(a7)
[00063c50] 302f 004a                 move.w     74(a7),d0
[00063c54] d06f 0016                 add.w      22(a7),d0
[00063c58] 3f40 004e                 move.w     d0,78(a7)
[00063c5c] 302f 004c                 move.w     76(a7),d0
[00063c60] d06f 0014                 add.w      20(a7),d0
[00063c64] 3f40 0050                 move.w     d0,80(a7)
[00063c68] 6000 008a                 bra        A_checkbox_76
A_checkbox_73:
[00063c6c] 70fe                      moveq.l    #-2,d0
[00063c6e] 206f 005e                 movea.l    94(a7),a0
[00063c72] d068 0010                 add.w      16(a0),d0
[00063c76] 3f40 0014                 move.w     d0,20(a7)
[00063c7a] 0c6f 0008 0014            cmpi.w     #$0008,20(a7)
[00063c80] 6c06                      bge.s      A_checkbox_77
[00063c82] 3f7c 0008 0014            move.w     #$0008,20(a7)
A_checkbox_77:
[00063c88] 70fe                      moveq.l    #-2,d0
[00063c8a] 206f 005e                 movea.l    94(a7),a0
[00063c8e] d068 000e                 add.w      14(a0),d0
[00063c92] 3f40 0016                 move.w     d0,22(a7)
[00063c96] 0c6f 0008 0016            cmpi.w     #$0008,22(a7)
[00063c9c] 6c06                      bge.s      A_checkbox_78
[00063c9e] 3f7c 0008 0016            move.w     #$0008,22(a7)
A_checkbox_78:
[00063ca4] 206f 005e                 movea.l    94(a7),a0
[00063ca8] 3028 000e                 move.w     14(a0),d0
[00063cac] 906f 0016                 sub.w      22(a7),d0
[00063cb0] e240                      asr.w      #1,d0
[00063cb2] 206f 005e                 movea.l    94(a7),a0
[00063cb6] d068 000a                 add.w      10(a0),d0
[00063cba] 3f40 004a                 move.w     d0,74(a7)
[00063cbe] 206f 005e                 movea.l    94(a7),a0
[00063cc2] 3028 0010                 move.w     16(a0),d0
[00063cc6] 906f 0014                 sub.w      20(a7),d0
[00063cca] e240                      asr.w      #1,d0
[00063ccc] 206f 005e                 movea.l    94(a7),a0
[00063cd0] d068 000c                 add.w      12(a0),d0
[00063cd4] 3f40 004c                 move.w     d0,76(a7)
[00063cd8] 302f 004a                 move.w     74(a7),d0
[00063cdc] d06f 0016                 add.w      22(a7),d0
[00063ce0] 5540                      subq.w     #2,d0
[00063ce2] 3f40 004e                 move.w     d0,78(a7)
[00063ce6] 302f 004c                 move.w     76(a7),d0
[00063cea] d06f 0014                 add.w      20(a7),d0
[00063cee] 5540                      subq.w     #2,d0
[00063cf0] 3f40 0050                 move.w     d0,80(a7)
A_checkbox_76:
[00063cf4] 0c6f 0010 0010            cmpi.w     #$0010,16(a7)
[00063cfa] 6608                      bne.s      A_checkbox_79
[00063cfc] 0c6f 0010 0012            cmpi.w     #$0010,18(a7)
[00063d02] 671e                      beq.s      A_checkbox_80
A_checkbox_79:
[00063d04] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063d0a] 302f 0010                 move.w     16(a7),d0
[00063d0e] b068 0014                 cmp.w      20(a0),d0
[00063d12] 6636                      bne.s      A_checkbox_81
[00063d14] 302f 001c                 move.w     28(a7),d0
[00063d18] 6f30                      ble.s      A_checkbox_81
[00063d1a] 0c6f 000f 0010            cmpi.w     #$000F,16(a7)
[00063d20] 6d28                      blt.s      A_checkbox_81
A_checkbox_80:
[00063d22] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063d28] 2068 023c                 movea.l    572(a0),a0
[00063d2c] 3028 000e                 move.w     14(a0),d0
[00063d30] c07c 0100                 and.w      #$0100,d0
[00063d34] 6614                      bne.s      A_checkbox_81
[00063d36] 7001                      moveq.l    #1,d0
[00063d38] 206f 005e                 movea.l    94(a7),a0
[00063d3c] c0a8 001a                 and.l      26(a0),d0
[00063d40] 6708                      beq.s      A_checkbox_81
[00063d42] 546f 004e                 addq.w     #2,78(a7)
[00063d46] 546f 0050                 addq.w     #2,80(a7)
A_checkbox_81:
[00063d4a] 41ef 004a                 lea.l      74(a7),a0
[00063d4e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00063d54] 3029 0010                 move.w     16(a1),d0
[00063d58] 4eb9 0007 282e            jsr        v_bar
A_checkbox_72:
[00063d5e] 6000 04cc                 bra        A_checkbox_62
A_checkbox_63:
[00063d62] 7010                      moveq.l    #16,d0
[00063d64] 206f 005e                 movea.l    94(a7),a0
[00063d68] 3428 0004                 move.w     4(a0),d2
[00063d6c] 48c2                      ext.l      d2
[00063d6e] 2202                      move.l     d2,d1
[00063d70] d281                      add.l      d1,d1
[00063d72] d282                      add.l      d2,d1
[00063d74] e789                      lsl.l      #3,d1
[00063d76] 206f 005e                 movea.l    94(a7),a0
[00063d7a] 2050                      movea.l    (a0),a0
[00063d7c] c070 1808                 and.w      8(a0,d1.l),d0
[00063d80] 6700 0184                 beq        A_checkbox_82
[00063d84] 70fc                      moveq.l    #-4,d0
[00063d86] d06f 0012                 add.w      18(a7),d0
[00063d8a] e240                      asr.w      #1,d0
[00063d8c] 3f40 0028                 move.w     d0,40(a7)
[00063d90] 0c6f 0004 0028            cmpi.w     #$0004,40(a7)
[00063d96] 6c06                      bge.s      A_checkbox_83
[00063d98] 3f7c 0004 0028            move.w     #$0004,40(a7)
A_checkbox_83:
[00063d9e] 70fc                      moveq.l    #-4,d0
[00063da0] d06f 0010                 add.w      16(a7),d0
[00063da4] e240                      asr.w      #1,d0
[00063da6] 3f40 0026                 move.w     d0,38(a7)
[00063daa] 0c6f 0004 0026            cmpi.w     #$0004,38(a7)
[00063db0] 6c06                      bge.s      A_checkbox_84
[00063db2] 3f7c 0004 0026            move.w     #$0004,38(a7)
A_checkbox_84:
[00063db8] 302f 001c                 move.w     28(a7),d0
[00063dbc] 660a                      bne.s      A_checkbox_85
[00063dbe] 302f 0012                 move.w     18(a7),d0
[00063dc2] e240                      asr.w      #1,d0
[00063dc4] d16f 002c                 add.w      d0,44(a7)
A_checkbox_85:
[00063dc8] 302f 0010                 move.w     16(a7),d0
[00063dcc] e240                      asr.w      #1,d0
[00063dce] d16f 002a                 add.w      d0,42(a7)
[00063dd2] 302f 0024                 move.w     36(a7),d0
[00063dd6] 670e                      beq.s      A_checkbox_86
[00063dd8] 7001                      moveq.l    #1,d0
[00063dda] 206f 005e                 movea.l    94(a7),a0
[00063dde] c068 0008                 and.w      8(a0),d0
[00063de2] 6600 0094                 bne        A_checkbox_87
A_checkbox_86:
[00063de6] 7201                      moveq.l    #1,d1
[00063de8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063dee] 3028 0010                 move.w     16(a0),d0
[00063df2] 4eb9 0007 3070            jsr        vswr_mode
[00063df8] 4241                      clr.w      d1
[00063dfa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063e00] 3028 0010                 move.w     16(a0),d0
[00063e04] 4eb9 0007 3660            jsr        vsf_interior
[00063e0a] 7201                      moveq.l    #1,d1
[00063e0c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063e12] 3028 0010                 move.w     16(a0),d0
[00063e16] 4eb9 0007 375c            jsr        vsf_perimeter
[00063e1c] 7201                      moveq.l    #1,d1
[00063e1e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063e24] 3028 0010                 move.w     16(a0),d0
[00063e28] 4eb9 0007 3708            jsr        vsf_color
[00063e2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063e34] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[00063e3a] 6f1a                      ble.s      A_checkbox_88
[00063e3c] 7001                      moveq.l    #1,d0
[00063e3e] 4eb9 0004 3dee            jsr        Avdi_getRGB
[00063e44] 7201                      moveq.l    #1,d1
[00063e46] 2279 0010 ee4e            movea.l    ACSblk,a1
[00063e4c] 3029 0010                 move.w     16(a1),d0
[00063e50] 4eb9 0007 2ffe            jsr        vs_color
A_checkbox_88:
[00063e56] 3f2f 0026                 move.w     38(a7),-(a7)
[00063e5a] 3f2f 002a                 move.w     42(a7),-(a7)
[00063e5e] 342f 002e                 move.w     46(a7),d2
[00063e62] 322f 0030                 move.w     48(a7),d1
[00063e66] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063e6c] 3028 0010                 move.w     16(a0),d0
[00063e70] 4eb9 0007 29e4            jsr        v_ellipse
[00063e76] 584f                      addq.w     #4,a7
A_checkbox_87:
[00063e78] 7001                      moveq.l    #1,d0
[00063e7a] 206f 005e                 movea.l    94(a7),a0
[00063e7e] c068 0008                 and.w      8(a0),d0
[00063e82] 6700 007e                 beq.w      A_checkbox_89
[00063e86] 7203                      moveq.l    #3,d1
[00063e88] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063e8e] 3028 0010                 move.w     16(a0),d0
[00063e92] 4eb9 0007 3070            jsr        vswr_mode
[00063e98] 7201                      moveq.l    #1,d1
[00063e9a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063ea0] 3028 0010                 move.w     16(a0),d0
[00063ea4] 4eb9 0007 3660            jsr        vsf_interior
[00063eaa] 4241                      clr.w      d1
[00063eac] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063eb2] 3028 0010                 move.w     16(a0),d0
[00063eb6] 4eb9 0007 375c            jsr        vsf_perimeter
[00063ebc] 70fd                      moveq.l    #-3,d0
[00063ebe] d06f 0026                 add.w      38(a7),d0
[00063ec2] 5540                      subq.w     #2,d0
[00063ec4] 6f08                      ble.s      A_checkbox_90
[00063ec6] 70fd                      moveq.l    #-3,d0
[00063ec8] d06f 0026                 add.w      38(a7),d0
[00063ecc] 6002                      bra.s      A_checkbox_91
A_checkbox_90:
[00063ece] 7002                      moveq.l    #2,d0
A_checkbox_91:
[00063ed0] 3f00                      move.w     d0,-(a7)
[00063ed2] 70fd                      moveq.l    #-3,d0
[00063ed4] d06f 002a                 add.w      42(a7),d0
[00063ed8] 5540                      subq.w     #2,d0
[00063eda] 6f08                      ble.s      A_checkbox_92
[00063edc] 70fd                      moveq.l    #-3,d0
[00063ede] d06f 002a                 add.w      42(a7),d0
[00063ee2] 6002                      bra.s      A_checkbox_93
A_checkbox_92:
[00063ee4] 7002                      moveq.l    #2,d0
A_checkbox_93:
[00063ee6] 3f00                      move.w     d0,-(a7)
[00063ee8] 342f 002e                 move.w     46(a7),d2
[00063eec] 322f 0030                 move.w     48(a7),d1
[00063ef0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063ef6] 3028 0010                 move.w     16(a0),d0
[00063efa] 4eb9 0007 29e4            jsr        v_ellipse
[00063f00] 584f                      addq.w     #4,a7
A_checkbox_89:
[00063f02] 6000 0328                 bra        A_checkbox_62
A_checkbox_82:
[00063f06] 7201                      moveq.l    #1,d1
[00063f08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063f0e] 3028 0010                 move.w     16(a0),d0
[00063f12] 4eb9 0007 30c4            jsr        vsl_type
[00063f18] 7201                      moveq.l    #1,d1
[00063f1a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063f20] 3028 0010                 move.w     16(a0),d0
[00063f24] 4eb9 0007 316a            jsr        vsl_width
[00063f2a] 7201                      moveq.l    #1,d1
[00063f2c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063f32] 3028 0010                 move.w     16(a0),d0
[00063f36] 4eb9 0007 31c0            jsr        vsl_color
[00063f3c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063f42] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[00063f48] 6f1a                      ble.s      A_checkbox_94
[00063f4a] 7001                      moveq.l    #1,d0
[00063f4c] 4eb9 0004 3dee            jsr        Avdi_getRGB
[00063f52] 7201                      moveq.l    #1,d1
[00063f54] 2279 0010 ee4e            movea.l    ACSblk,a1
[00063f5a] 3029 0010                 move.w     16(a1),d0
[00063f5e] 4eb9 0007 2ffe            jsr        vs_color
A_checkbox_94:
[00063f64] 4242                      clr.w      d2
[00063f66] 4241                      clr.w      d1
[00063f68] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063f6e] 3028 0010                 move.w     16(a0),d0
[00063f72] 4eb9 0007 3214            jsr        vsl_ends
[00063f78] 302f 001c                 move.w     28(a7),d0
[00063f7c] 6f00 0098                 ble        A_checkbox_95
[00063f80] 70fc                      moveq.l    #-4,d0
[00063f82] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063f88] d068 0014                 add.w      20(a0),d0
[00063f8c] 3f40 0014                 move.w     d0,20(a7)
[00063f90] 0c6f 0008 0014            cmpi.w     #$0008,20(a7)
[00063f96] 6c06                      bge.s      A_checkbox_96
[00063f98] 3f7c 0008 0014            move.w     #$0008,20(a7)
A_checkbox_96:
[00063f9e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063fa4] 3028 0014                 move.w     20(a0),d0
[00063fa8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063fae] c1e8 0004                 muls.w     4(a0),d0
[00063fb2] 48c0                      ext.l      d0
[00063fb4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00063fba] 81e8 0006                 divs.w     6(a0),d0
[00063fbe] 5940                      subq.w     #4,d0
[00063fc0] 3f40 0016                 move.w     d0,22(a7)
[00063fc4] 0c6f 0008 0016            cmpi.w     #$0008,22(a7)
[00063fca] 6c06                      bge.s      A_checkbox_97
[00063fcc] 3f7c 0008 0016            move.w     #$0008,22(a7)
A_checkbox_97:
[00063fd2] 7002                      moveq.l    #2,d0
[00063fd4] 206f 005e                 movea.l    94(a7),a0
[00063fd8] d068 000a                 add.w      10(a0),d0
[00063fdc] 3f40 004a                 move.w     d0,74(a7)
[00063fe0] 206f 005e                 movea.l    94(a7),a0
[00063fe4] 3028 0010                 move.w     16(a0),d0
[00063fe8] 906f 0014                 sub.w      20(a7),d0
[00063fec] e240                      asr.w      #1,d0
[00063fee] 206f 005e                 movea.l    94(a7),a0
[00063ff2] d068 000c                 add.w      12(a0),d0
[00063ff6] 3f40 004c                 move.w     d0,76(a7)
[00063ffa] 302f 004a                 move.w     74(a7),d0
[00063ffe] d06f 0016                 add.w      22(a7),d0
[00064002] 3f40 004e                 move.w     d0,78(a7)
[00064006] 302f 004c                 move.w     76(a7),d0
[0006400a] d06f 0014                 add.w      20(a7),d0
[0006400e] 3f40 0050                 move.w     d0,80(a7)
[00064012] 6000 008a                 bra        A_checkbox_98
A_checkbox_95:
[00064016] 70fe                      moveq.l    #-2,d0
[00064018] 206f 005e                 movea.l    94(a7),a0
[0006401c] d068 0010                 add.w      16(a0),d0
[00064020] 3f40 0014                 move.w     d0,20(a7)
[00064024] 0c6f 0008 0014            cmpi.w     #$0008,20(a7)
[0006402a] 6c06                      bge.s      A_checkbox_99
[0006402c] 3f7c 0008 0014            move.w     #$0008,20(a7)
A_checkbox_99:
[00064032] 70fe                      moveq.l    #-2,d0
[00064034] 206f 005e                 movea.l    94(a7),a0
[00064038] d068 000e                 add.w      14(a0),d0
[0006403c] 3f40 0016                 move.w     d0,22(a7)
[00064040] 0c6f 0008 0016            cmpi.w     #$0008,22(a7)
[00064046] 6c06                      bge.s      A_checkbox_100
[00064048] 3f7c 0008 0016            move.w     #$0008,22(a7)
A_checkbox_100:
[0006404e] 206f 005e                 movea.l    94(a7),a0
[00064052] 3028 000e                 move.w     14(a0),d0
[00064056] 906f 0016                 sub.w      22(a7),d0
[0006405a] e240                      asr.w      #1,d0
[0006405c] 206f 005e                 movea.l    94(a7),a0
[00064060] d068 000a                 add.w      10(a0),d0
[00064064] 3f40 004a                 move.w     d0,74(a7)
[00064068] 206f 005e                 movea.l    94(a7),a0
[0006406c] 3028 0010                 move.w     16(a0),d0
[00064070] 906f 0014                 sub.w      20(a7),d0
[00064074] e240                      asr.w      #1,d0
[00064076] 206f 005e                 movea.l    94(a7),a0
[0006407a] d068 000c                 add.w      12(a0),d0
[0006407e] 3f40 004c                 move.w     d0,76(a7)
[00064082] 302f 004a                 move.w     74(a7),d0
[00064086] d06f 0016                 add.w      22(a7),d0
[0006408a] 5540                      subq.w     #2,d0
[0006408c] 3f40 004e                 move.w     d0,78(a7)
[00064090] 302f 004c                 move.w     76(a7),d0
[00064094] d06f 0014                 add.w      20(a7),d0
[00064098] 5540                      subq.w     #2,d0
[0006409a] 3f40 0050                 move.w     d0,80(a7)
A_checkbox_98:
[0006409e] 302f 0024                 move.w     36(a7),d0
[000640a2] 670e                      beq.s      A_checkbox_101
[000640a4] 7001                      moveq.l    #1,d0
[000640a6] 206f 005e                 movea.l    94(a7),a0
[000640aa] c068 0008                 and.w      8(a0),d0
[000640ae] 6600 0086                 bne        A_checkbox_102
A_checkbox_101:
[000640b2] 7201                      moveq.l    #1,d1
[000640b4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000640ba] 3028 0010                 move.w     16(a0),d0
[000640be] 4eb9 0007 3070            jsr        vswr_mode
[000640c4] 4241                      clr.w      d1
[000640c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000640cc] 3028 0010                 move.w     16(a0),d0
[000640d0] 4eb9 0007 3660            jsr        vsf_interior
[000640d6] 7201                      moveq.l    #1,d1
[000640d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000640de] 3028 0010                 move.w     16(a0),d0
[000640e2] 4eb9 0007 375c            jsr        vsf_perimeter
[000640e8] 7201                      moveq.l    #1,d1
[000640ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[000640f0] 3028 0010                 move.w     16(a0),d0
[000640f4] 4eb9 0007 3708            jsr        vsf_color
[000640fa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064100] 0c68 0008 001c            cmpi.w     #$0008,28(a0)
[00064106] 6f1a                      ble.s      A_checkbox_103
[00064108] 7001                      moveq.l    #1,d0
[0006410a] 4eb9 0004 3dee            jsr        Avdi_getRGB
[00064110] 7201                      moveq.l    #1,d1
[00064112] 2279 0010 ee4e            movea.l    ACSblk,a1
[00064118] 3029 0010                 move.w     16(a1),d0
[0006411c] 4eb9 0007 2ffe            jsr        vs_color
A_checkbox_103:
[00064122] 41ef 004a                 lea.l      74(a7),a0
[00064126] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006412c] 3029 0010                 move.w     16(a1),d0
[00064130] 4eb9 0007 282e            jsr        v_bar
A_checkbox_102:
[00064136] 7001                      moveq.l    #1,d0
[00064138] 206f 005e                 movea.l    94(a7),a0
[0006413c] c068 0008                 and.w      8(a0),d0
[00064140] 6700 00ea                 beq        A_checkbox_62
[00064144] 7203                      moveq.l    #3,d1
[00064146] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006414c] 3028 0010                 move.w     16(a0),d0
[00064150] 4eb9 0007 3070            jsr        vswr_mode
[00064156] 7201                      moveq.l    #1,d1
[00064158] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006415e] 3028 0010                 move.w     16(a0),d0
[00064162] 4eb9 0007 3070            jsr        vswr_mode
[00064168] 41ef 004a                 lea.l      74(a7),a0
[0006416c] 7202                      moveq.l    #2,d1
[0006416e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00064174] 3029 0010                 move.w     16(a1),d0
[00064178] 4eb9 0007 22e0            jsr        v_pline
[0006417e] 3f6f 004a 0022            move.w     74(a7),34(a7)
[00064184] 3f6f 004e 004a            move.w     78(a7),74(a7)
[0006418a] 3f6f 0022 004e            move.w     34(a7),78(a7)
[00064190] 41ef 004a                 lea.l      74(a7),a0
[00064194] 7202                      moveq.l    #2,d1
[00064196] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006419c] 3029 0010                 move.w     16(a1),d0
[000641a0] 4eb9 0007 22e0            jsr        v_pline
[000641a6] 302f 004a                 move.w     74(a7),d0
[000641aa] d06f 004e                 add.w      78(a7),d0
[000641ae] 3f40 0022                 move.w     d0,34(a7)
[000641b2] 7001                      moveq.l    #1,d0
[000641b4] c06f 0022                 and.w      34(a7),d0
[000641b8] 6716                      beq.s      A_checkbox_104
[000641ba] 302f 0022                 move.w     34(a7),d0
[000641be] e240                      asr.w      #1,d0
[000641c0] 3f40 004a                 move.w     d0,74(a7)
[000641c4] 7001                      moveq.l    #1,d0
[000641c6] d06f 004a                 add.w      74(a7),d0
[000641ca] 3f40 004e                 move.w     d0,78(a7)
[000641ce] 600e                      bra.s      A_checkbox_105
A_checkbox_104:
[000641d0] 302f 0022                 move.w     34(a7),d0
[000641d4] e240                      asr.w      #1,d0
[000641d6] 3f40 004e                 move.w     d0,78(a7)
[000641da] 3f40 004a                 move.w     d0,74(a7)
A_checkbox_105:
[000641de] 302f 004c                 move.w     76(a7),d0
[000641e2] d06f 0050                 add.w      80(a7),d0
[000641e6] 3f40 0022                 move.w     d0,34(a7)
[000641ea] 7001                      moveq.l    #1,d0
[000641ec] c06f 0022                 and.w      34(a7),d0
[000641f0] 6716                      beq.s      A_checkbox_106
[000641f2] 302f 0022                 move.w     34(a7),d0
[000641f6] e240                      asr.w      #1,d0
[000641f8] 3f40 004c                 move.w     d0,76(a7)
[000641fc] 7001                      moveq.l    #1,d0
[000641fe] d06f 004c                 add.w      76(a7),d0
[00064202] 3f40 0050                 move.w     d0,80(a7)
[00064206] 600e                      bra.s      A_checkbox_107
A_checkbox_106:
[00064208] 302f 0022                 move.w     34(a7),d0
[0006420c] e240                      asr.w      #1,d0
[0006420e] 3f40 0050                 move.w     d0,80(a7)
[00064212] 3f40 004c                 move.w     d0,76(a7)
A_checkbox_107:
[00064216] 41ef 004a                 lea.l      74(a7),a0
[0006421a] 7202                      moveq.l    #2,d1
[0006421c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00064222] 3029 0010                 move.w     16(a1),d0
[00064226] 4eb9 0007 22e0            jsr        v_pline
A_checkbox_62:
[0006422c] 41ef 002e                 lea.l      46(a7),a0
[00064230] 4241                      clr.w      d1
[00064232] 2279 0010 ee4e            movea.l    ACSblk,a1
[00064238] 3029 0010                 move.w     16(a1),d0
[0006423c] 4eb9 0007 2230            jsr        vs_clip
[00064242] 70f6                      moveq.l    #-10,d0
[00064244] 206f 005e                 movea.l    94(a7),a0
[00064248] c068 0008                 and.w      8(a0),d0
[0006424c] 4fef 0052                 lea.l      82(a7),a7
[00064250] 245f                      movea.l    (a7)+,a2
[00064252] 241f                      move.l     (a7)+,d2
[00064254] 4e75                      rts

A_innerframe:
[00064256] 2f02                      move.l     d2,-(a7)
[00064258] 2f0a                      move.l     a2,-(a7)
[0006425a] 4fef ffaa                 lea.l      -86(a7),a7
[0006425e] 426f 0014                 clr.w      20(a7)
[00064262] 206f 0062                 movea.l    98(a7),a0
[00064266] 3028 0016                 move.w     22(a0),d0
[0006426a] 660a                      bne.s      A_innerframe_1
[0006426c] 206f 0062                 movea.l    98(a7),a0
[00064270] 3028 0018                 move.w     24(a0),d0
[00064274] 6758                      beq.s      A_innerframe_2
A_innerframe_1:
[00064276] 206f 0062                 movea.l    98(a7),a0
[0006427a] 3f68 0012 004e            move.w     18(a0),78(a7)
[00064280] 206f 0062                 movea.l    98(a7),a0
[00064284] 3f68 0014 0050            move.w     20(a0),80(a7)
[0006428a] 206f 0062                 movea.l    98(a7),a0
[0006428e] 3028 0012                 move.w     18(a0),d0
[00064292] 206f 0062                 movea.l    98(a7),a0
[00064296] d068 0016                 add.w      22(a0),d0
[0006429a] 5340                      subq.w     #1,d0
[0006429c] 3f40 0052                 move.w     d0,82(a7)
[000642a0] 206f 0062                 movea.l    98(a7),a0
[000642a4] 3028 0014                 move.w     20(a0),d0
[000642a8] 206f 0062                 movea.l    98(a7),a0
[000642ac] d068 0018                 add.w      24(a0),d0
[000642b0] 5340                      subq.w     #1,d0
[000642b2] 3f40 0054                 move.w     d0,84(a7)
[000642b6] 41ef 004e                 lea.l      78(a7),a0
[000642ba] 7201                      moveq.l    #1,d1
[000642bc] 2279 0010 ee4e            movea.l    ACSblk,a1
[000642c2] 3029 0010                 move.w     16(a1),d0
[000642c6] 4eb9 0007 2230            jsr        vs_clip
[000642cc] 6016                      bra.s      A_innerframe_3
A_innerframe_2:
[000642ce] 41ef 004e                 lea.l      78(a7),a0
[000642d2] 4241                      clr.w      d1
[000642d4] 2279 0010 ee4e            movea.l    ACSblk,a1
[000642da] 3029 0010                 move.w     16(a1),d0
[000642de] 4eb9 0007 2230            jsr        vs_clip
A_innerframe_3:
[000642e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000642ea] 3028 0012                 move.w     18(a0),d0
[000642ee] e240                      asr.w      #1,d0
[000642f0] 206f 0062                 movea.l    98(a7),a0
[000642f4] d068 000a                 add.w      10(a0),d0
[000642f8] 3f40 004e                 move.w     d0,78(a7)
[000642fc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064302] 3028 0014                 move.w     20(a0),d0
[00064306] e240                      asr.w      #1,d0
[00064308] 206f 0062                 movea.l    98(a7),a0
[0006430c] d068 000c                 add.w      12(a0),d0
[00064310] 3f40 0050                 move.w     d0,80(a7)
[00064314] 302f 004e                 move.w     78(a7),d0
[00064318] 206f 0062                 movea.l    98(a7),a0
[0006431c] d068 000e                 add.w      14(a0),d0
[00064320] 5340                      subq.w     #1,d0
[00064322] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064328] 9068 0012                 sub.w      18(a0),d0
[0006432c] 3f40 0052                 move.w     d0,82(a7)
[00064330] 302f 0050                 move.w     80(a7),d0
[00064334] 206f 0062                 movea.l    98(a7),a0
[00064338] d068 0010                 add.w      16(a0),d0
[0006433c] 5340                      subq.w     #1,d0
[0006433e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064344] 9068 0014                 sub.w      20(a0),d0
[00064348] 3f40 0054                 move.w     d0,84(a7)
[0006434c] 206f 0062                 movea.l    98(a7),a0
[00064350] 41e8 001a                 lea.l      26(a0),a0
[00064354] 2e88                      move.l     a0,(a7)
[00064356] 206f 0062                 movea.l    98(a7),a0
[0006435a] 3028 0006                 move.w     6(a0),d0
[0006435e] 206f 0062                 movea.l    98(a7),a0
[00064362] 3228 0008                 move.w     8(a0),d1
[00064366] b340                      eor.w      d1,d0
[00064368] 3f40 0026                 move.w     d0,38(a7)
[0006436c] 302f 0026                 move.w     38(a7),d0
[00064370] 6600 0606                 bne        A_innerframe_4
[00064374] 7201                      moveq.l    #1,d1
[00064376] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006437c] 3028 0010                 move.w     16(a0),d0
[00064380] 4eb9 0007 3070            jsr        vswr_mode
[00064386] 7201                      moveq.l    #1,d1
[00064388] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006438e] 3028 0010                 move.w     16(a0),d0
[00064392] 4eb9 0007 30c4            jsr        vsl_type
[00064398] 7201                      moveq.l    #1,d1
[0006439a] 2079 0010 ee4e            movea.l    ACSblk,a0
[000643a0] 3028 0010                 move.w     16(a0),d0
[000643a4] 4eb9 0007 316a            jsr        vsl_width
[000643aa] 4242                      clr.w      d2
[000643ac] 4241                      clr.w      d1
[000643ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[000643b4] 3028 0010                 move.w     16(a0),d0
[000643b8] 4eb9 0007 3214            jsr        vsl_ends
[000643be] 70ff                      moveq.l    #-1,d0
[000643c0] d06f 004e                 add.w      78(a7),d0
[000643c4] 3f40 004a                 move.w     d0,74(a7)
[000643c8] 3f40 0046                 move.w     d0,70(a7)
[000643cc] 3f40 003a                 move.w     d0,58(a7)
[000643d0] 70ff                      moveq.l    #-1,d0
[000643d2] d06f 0050                 add.w      80(a7),d0
[000643d6] 3f40 004c                 move.w     d0,76(a7)
[000643da] 3f40 0040                 move.w     d0,64(a7)
[000643de] 3f40 003c                 move.w     d0,60(a7)
[000643e2] 7002                      moveq.l    #2,d0
[000643e4] d06f 0052                 add.w      82(a7),d0
[000643e8] 3f40 0042                 move.w     d0,66(a7)
[000643ec] 3f40 003e                 move.w     d0,62(a7)
[000643f0] 7002                      moveq.l    #2,d0
[000643f2] d06f 0054                 add.w      84(a7),d0
[000643f6] 3f40 0048                 move.w     d0,72(a7)
[000643fa] 3f40 0044                 move.w     d0,68(a7)
[000643fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064404] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[0006440a] 6d3a                      blt.s      A_innerframe_5
[0006440c] 2057                      movea.l    (a7),a0
[0006440e] 2010                      move.l     (a0),d0
[00064410] 7210                      moveq.l    #16,d1
[00064412] e2a0                      asr.l      d1,d0
[00064414] c07c 000f                 and.w      #$000F,d0
[00064418] 3f40 0018                 move.w     d0,24(a7)
[0006441c] 322f 0018                 move.w     24(a7),d1
[00064420] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064426] 3028 0010                 move.w     16(a0),d0
[0006442a] 4eb9 0007 31c0            jsr        vsl_color
[00064430] 41ef 003a                 lea.l      58(a7),a0
[00064434] 7205                      moveq.l    #5,d1
[00064436] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006443c] 3029 0010                 move.w     16(a1),d0
[00064440] 4eb9 0007 22e0            jsr        v_pline
A_innerframe_5:
[00064446] 426f 0028                 clr.w      40(a7)
[0006444a] 600e                      bra.s      A_innerframe_6
A_innerframe_7:
[0006444c] 302f 0028                 move.w     40(a7),d0
[00064450] d040                      add.w      d0,d0
[00064452] 5377 003a                 subq.w     #1,58(a7,d0.w)
[00064456] 526f 0028                 addq.w     #1,40(a7)
A_innerframe_6:
[0006445a] 0c6f 000a 0028            cmpi.w     #$000A,40(a7)
[00064460] 6dea                      blt.s      A_innerframe_7
[00064462] 700f                      moveq.l    #15,d0
[00064464] 2057                      movea.l    (a7),a0
[00064466] c068 0002                 and.w      2(a0),d0
[0006446a] 3f40 0018                 move.w     d0,24(a7)
[0006446e] 322f 0018                 move.w     24(a7),d1
[00064472] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064478] 3028 0010                 move.w     16(a0),d0
[0006447c] 4eb9 0007 31c0            jsr        vsl_color
[00064482] 41ef 003a                 lea.l      58(a7),a0
[00064486] 7205                      moveq.l    #5,d1
[00064488] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006448e] 3029 0010                 move.w     16(a1),d0
[00064492] 4eb9 0007 22e0            jsr        v_pline
[00064498] 2057                      movea.l    (a7),a0
[0006449a] 2010                      move.l     (a0),d0
[0006449c] 720c                      moveq.l    #12,d1
[0006449e] e2a0                      asr.l      d1,d0
[000644a0] c07c 000f                 and.w      #$000F,d0
[000644a4] 3f40 0018                 move.w     d0,24(a7)
[000644a8] 2057                      movea.l    (a7),a0
[000644aa] 2010                      move.l     (a0),d0
[000644ac] 7209                      moveq.l    #9,d1
[000644ae] e2a0                      asr.l      d1,d0
[000644b0] c07c 0007                 and.w      #$0007,d0
[000644b4] 3f40 0016                 move.w     d0,22(a7)
[000644b8] 0c6f 0008 0018            cmpi.w     #$0008,24(a7)
[000644be] 663e                      bne.s      A_innerframe_8
[000644c0] 0c6f 0007 0016            cmpi.w     #$0007,22(a7)
[000644c6] 6636                      bne.s      A_innerframe_8
[000644c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000644ce] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[000644d4] 6c28                      bge.s      A_innerframe_8
[000644d6] 7070                      moveq.l    #112,d0
[000644d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000644de] c068 02b4                 and.w      692(a0),d0
[000644e2] e840                      asr.w      #4,d0
[000644e4] 3f40 0016                 move.w     d0,22(a7)
[000644e8] 700f                      moveq.l    #15,d0
[000644ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[000644f0] c068 02b4                 and.w      692(a0),d0
[000644f4] 3f40 0018                 move.w     d0,24(a7)
[000644f8] 3f7c 0001 0014            move.w     #$0001,20(a7)
A_innerframe_8:
[000644fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064504] 2068 023c                 movea.l    572(a0),a0
[00064508] 3028 000e                 move.w     14(a0),d0
[0006450c] c07c 0100                 and.w      #$0100,d0
[00064510] 6708                      beq.s      A_innerframe_9
[00064512] 426f 0018                 clr.w      24(a7)
[00064516] 426f 0016                 clr.w      22(a7)
A_innerframe_9:
[0006451a] 302f 0016                 move.w     22(a7),d0
[0006451e] 6614                      bne.s      A_innerframe_10
[00064520] 4241                      clr.w      d1
[00064522] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064528] 3028 0010                 move.w     16(a0),d0
[0006452c] 4eb9 0007 3660            jsr        vsf_interior
[00064532] 6042                      bra.s      A_innerframe_11
A_innerframe_10:
[00064534] 0c6f 0007 0016            cmpi.w     #$0007,22(a7)
[0006453a] 6614                      bne.s      A_innerframe_12
[0006453c] 7201                      moveq.l    #1,d1
[0006453e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064544] 3028 0010                 move.w     16(a0),d0
[00064548] 4eb9 0007 3660            jsr        vsf_interior
[0006454e] 6026                      bra.s      A_innerframe_11
A_innerframe_12:
[00064550] 7202                      moveq.l    #2,d1
[00064552] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064558] 3028 0010                 move.w     16(a0),d0
[0006455c] 4eb9 0007 3660            jsr        vsf_interior
[00064562] 322f 0016                 move.w     22(a7),d1
[00064566] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006456c] 3028 0010                 move.w     16(a0),d0
[00064570] 4eb9 0007 36b4            jsr        vsf_style
A_innerframe_11:
[00064576] 322f 0018                 move.w     24(a7),d1
[0006457a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064580] 3028 0010                 move.w     16(a0),d0
[00064584] 4eb9 0007 3708            jsr        vsf_color
[0006458a] 4241                      clr.w      d1
[0006458c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064592] 3028 0010                 move.w     16(a0),d0
[00064596] 4eb9 0007 375c            jsr        vsf_perimeter
[0006459c] 41ef 004e                 lea.l      78(a7),a0
[000645a0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000645a6] 3029 0010                 move.w     16(a1),d0
[000645aa] 4eb9 0007 282e            jsr        v_bar
[000645b0] 206f 0062                 movea.l    98(a7),a0
[000645b4] 3228 0004                 move.w     4(a0),d1
[000645b8] 48c1                      ext.l      d1
[000645ba] 2001                      move.l     d1,d0
[000645bc] d080                      add.l      d0,d0
[000645be] d081                      add.l      d1,d0
[000645c0] e788                      lsl.l      #3,d0
[000645c2] 206f 0062                 movea.l    98(a7),a0
[000645c6] 2050                      movea.l    (a0),a0
[000645c8] d1c0                      adda.l     d0,a0
[000645ca] 2f48 000c                 move.l     a0,12(a7)
[000645ce] 206f 000c                 movea.l    12(a7),a0
[000645d2] 2f68 000c 0010            move.l     12(a0),16(a7)
[000645d8] 206f 0010                 movea.l    16(a7),a0
[000645dc] 2f68 000c 0004            move.l     12(a0),4(a7)
[000645e2] 202f 0004                 move.l     4(a7),d0
[000645e6] 6700 0390                 beq        A_innerframe_4
[000645ea] 206f 0004                 movea.l    4(a7),a0
[000645ee] 4eb9 0008 2f6c            jsr        strlen
[000645f4] 3f40 0024                 move.w     d0,36(a7)
[000645f8] 302f 0024                 move.w     36(a7),d0
[000645fc] 6f00 037a                 ble        A_innerframe_4
[00064600] 206f 000c                 movea.l    12(a7),a0
[00064604] 41e8 0018                 lea.l      24(a0),a0
[00064608] 2f48 0008                 move.l     a0,8(a7)
[0006460c] 7020                      moveq.l    #32,d0
[0006460e] 206f 000c                 movea.l    12(a7),a0
[00064612] c068 0008                 and.w      8(a0),d0
[00064616] 661a                      bne.s      A_innerframe_13
[00064618] 206f 0008                 movea.l    8(a7),a0
[0006461c] 3028 0008                 move.w     8(a0),d0
[00064620] c07c 8000                 and.w      #$8000,d0
[00064624] 670c                      beq.s      A_innerframe_13
[00064626] 206f 0008                 movea.l    8(a7),a0
[0006462a] 3f68 000a 0022            move.w     10(a0),34(a7)
[00064630] 6004                      bra.s      A_innerframe_14
A_innerframe_13:
[00064632] 426f 0022                 clr.w      34(a7)
A_innerframe_14:
[00064636] 4241                      clr.w      d1
[00064638] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006463e] 3028 0010                 move.w     16(a0),d0
[00064642] 4eb9 0007 3492            jsr        vst_rotation
[00064648] 4241                      clr.w      d1
[0006464a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064650] 3028 0010                 move.w     16(a0),d0
[00064654] 4eb9 0007 358e            jsr        vst_effects
[0006465a] 2057                      movea.l    (a7),a0
[0006465c] 2010                      move.l     (a0),d0
[0006465e] e880                      asr.l      #4,d0
[00064660] c07c 000f                 and.w      #$000F,d0
[00064664] 3f40 0018                 move.w     d0,24(a7)
[00064668] 322f 0018                 move.w     24(a7),d1
[0006466c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064672] 3028 0010                 move.w     16(a0),d0
[00064676] 4eb9 0007 353a            jsr        vst_color
[0006467c] 43ef 0028                 lea.l      40(a7),a1
[00064680] 41ef 0028                 lea.l      40(a7),a0
[00064684] 7405                      moveq.l    #5,d2
[00064686] 4241                      clr.w      d1
[00064688] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006468e] 302a 0010                 move.w     16(a2),d0
[00064692] 4eb9 0007 35e2            jsr        vst_alignment
[00064698] 2057                      movea.l    (a7),a0
[0006469a] 2010                      move.l     (a0),d0
[0006469c] c0bc 0800 0000            and.l      #$08000000,d0
[000646a2] 675c                      beq.s      A_innerframe_15
[000646a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000646aa] 3228 0294                 move.w     660(a0),d1
[000646ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[000646b4] 3028 0010                 move.w     16(a0),d0
[000646b8] 4eb9 0007 34e6            jsr        vst_font
[000646be] 486f 0020                 pea.l      32(a7)
[000646c2] 486f 0022                 pea.l      34(a7)
[000646c6] 43ef 0030                 lea.l      48(a7),a1
[000646ca] 41ef 0030                 lea.l      48(a7),a0
[000646ce] 2479 0010 ee4e            movea.l    ACSblk,a2
[000646d4] 322a 0296                 move.w     662(a2),d1
[000646d8] 2479 0010 ee4e            movea.l    ACSblk,a2
[000646de] 302a 0010                 move.w     16(a2),d0
[000646e2] 4eb9 0007 3370            jsr        vst_height
[000646e8] 504f                      addq.w     #8,a7
[000646ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[000646f0] 3028 0014                 move.w     20(a0),d0
[000646f4] 906f 0020                 sub.w      32(a7),d0
[000646f8] e240                      asr.w      #1,d0
[000646fa] 3f40 001a                 move.w     d0,26(a7)
[000646fe] 604a                      bra.s      A_innerframe_16
A_innerframe_15:
[00064700] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064706] 3228 0290                 move.w     656(a0),d1
[0006470a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064710] 3028 0010                 move.w     16(a0),d0
[00064714] 4eb9 0007 34e6            jsr        vst_font
[0006471a] 426f 001a                 clr.w      26(a7)
[0006471e] 486f 0020                 pea.l      32(a7)
[00064722] 486f 0022                 pea.l      34(a7)
[00064726] 43ef 0030                 lea.l      48(a7),a1
[0006472a] 41ef 0030                 lea.l      48(a7),a0
[0006472e] 2479 0010 ee4e            movea.l    ACSblk,a2
[00064734] 322a 0292                 move.w     658(a2),d1
[00064738] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006473e] 302a 0010                 move.w     16(a2),d0
[00064742] 4eb9 0007 3370            jsr        vst_height
[00064748] 504f                      addq.w     #8,a7
A_innerframe_16:
[0006474a] 43ef 002a                 lea.l      42(a7),a1
[0006474e] 206f 0004                 movea.l    4(a7),a0
[00064752] 2479 0010 ee4e            movea.l    ACSblk,a2
[00064758] 302a 0010                 move.w     16(a2),d0
[0006475c] 4eb9 0007 55fe            jsr        vqt_extent
[00064762] 302f 002e                 move.w     46(a7),d0
[00064766] 906f 002a                 sub.w      42(a7),d0
[0006476a] 5240                      addq.w     #1,d0
[0006476c] 3f40 001e                 move.w     d0,30(a7)
[00064770] 2057                      movea.l    (a7),a0
[00064772] 2010                      move.l     (a0),d0
[00064774] 7218                      moveq.l    #24,d1
[00064776] e2a0                      asr.l      d1,d0
[00064778] c07c 0007                 and.w      #$0007,d0
[0006477c] b07c 0006                 cmp.w      #$0006,d0
[00064780] 6200 012a                 bhi        A_innerframe_17
[00064784] d040                      add.w      d0,d0
[00064786] 303b 0006                 move.w     $0006478E(pc,d0.w),d0
[0006478a] 4efb 0002                 jmp        $0006478E(pc,d0.w)
J48:
[0006478e] 011e                      dc.w $011e   ; A_innerframe_17-J48
[00064790] 000e                      dc.w $000e   ; A_innerframe_18-J48
[00064792] 0038                      dc.w $0038   ; A_innerframe_19-J48
[00064794] 011e                      dc.w $011e   ; A_innerframe_17-J48
[00064796] 006a                      dc.w $006a   ; A_innerframe_20-J48
[00064798] 00a2                      dc.w $00a2   ; A_innerframe_21-J48
[0006479a] 00dc                      dc.w $00dc   ; A_innerframe_22-J48
A_innerframe_18:
[0006479c] 206f 0062                 movea.l    98(a7),a0
[000647a0] 3028 000e                 move.w     14(a0),d0
[000647a4] 906f 001e                 sub.w      30(a7),d0
[000647a8] e240                      asr.w      #1,d0
[000647aa] 206f 0062                 movea.l    98(a7),a0
[000647ae] d068 000a                 add.w      10(a0),d0
[000647b2] 3f40 001c                 move.w     d0,28(a7)
[000647b6] 206f 0062                 movea.l    98(a7),a0
[000647ba] 3028 000c                 move.w     12(a0),d0
[000647be] d16f 001a                 add.w      d0,26(a7)
[000647c2] 6000 010a                 bra        A_innerframe_23
A_innerframe_19:
[000647c6] 206f 0062                 movea.l    98(a7),a0
[000647ca] 3028 000a                 move.w     10(a0),d0
[000647ce] 206f 0062                 movea.l    98(a7),a0
[000647d2] d068 000e                 add.w      14(a0),d0
[000647d6] 906f 001e                 sub.w      30(a7),d0
[000647da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000647e0] 9068 0012                 sub.w      18(a0),d0
[000647e4] 3f40 001c                 move.w     d0,28(a7)
[000647e8] 206f 0062                 movea.l    98(a7),a0
[000647ec] 3028 000c                 move.w     12(a0),d0
[000647f0] d16f 001a                 add.w      d0,26(a7)
[000647f4] 6000 00d8                 bra        A_innerframe_23
A_innerframe_20:
[000647f8] 206f 0062                 movea.l    98(a7),a0
[000647fc] 3028 000a                 move.w     10(a0),d0
[00064800] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064806] d068 0012                 add.w      18(a0),d0
[0006480a] 3f40 001c                 move.w     d0,28(a7)
[0006480e] 206f 0062                 movea.l    98(a7),a0
[00064812] 3028 000c                 move.w     12(a0),d0
[00064816] 206f 0062                 movea.l    98(a7),a0
[0006481a] d068 0010                 add.w      16(a0),d0
[0006481e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064824] 9068 0014                 sub.w      20(a0),d0
[00064828] d16f 001a                 add.w      d0,26(a7)
[0006482c] 6000 00a0                 bra        A_innerframe_23
A_innerframe_21:
[00064830] 206f 0062                 movea.l    98(a7),a0
[00064834] 3028 000e                 move.w     14(a0),d0
[00064838] 906f 001e                 sub.w      30(a7),d0
[0006483c] e240                      asr.w      #1,d0
[0006483e] 206f 0062                 movea.l    98(a7),a0
[00064842] d068 000a                 add.w      10(a0),d0
[00064846] 3f40 001c                 move.w     d0,28(a7)
[0006484a] 206f 0062                 movea.l    98(a7),a0
[0006484e] 3028 000c                 move.w     12(a0),d0
[00064852] 206f 0062                 movea.l    98(a7),a0
[00064856] d068 0010                 add.w      16(a0),d0
[0006485a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064860] 9068 0014                 sub.w      20(a0),d0
[00064864] d16f 001a                 add.w      d0,26(a7)
[00064868] 6064                      bra.s      A_innerframe_23
A_innerframe_22:
[0006486a] 206f 0062                 movea.l    98(a7),a0
[0006486e] 3028 000a                 move.w     10(a0),d0
[00064872] 206f 0062                 movea.l    98(a7),a0
[00064876] d068 000e                 add.w      14(a0),d0
[0006487a] 906f 001e                 sub.w      30(a7),d0
[0006487e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064884] 9068 0012                 sub.w      18(a0),d0
[00064888] 3f40 001c                 move.w     d0,28(a7)
[0006488c] 206f 0062                 movea.l    98(a7),a0
[00064890] 3028 000c                 move.w     12(a0),d0
[00064894] 206f 0062                 movea.l    98(a7),a0
[00064898] d068 0010                 add.w      16(a0),d0
[0006489c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000648a2] 9068 0014                 sub.w      20(a0),d0
[000648a6] d16f 001a                 add.w      d0,26(a7)
[000648aa] 6022                      bra.s      A_innerframe_23
A_innerframe_17:
[000648ac] 206f 0062                 movea.l    98(a7),a0
[000648b0] 3028 000a                 move.w     10(a0),d0
[000648b4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000648ba] d068 0012                 add.w      18(a0),d0
[000648be] 3f40 001c                 move.w     d0,28(a7)
[000648c2] 206f 0062                 movea.l    98(a7),a0
[000648c6] 3028 000c                 move.w     12(a0),d0
[000648ca] d16f 001a                 add.w      d0,26(a7)
A_innerframe_23:
[000648ce] 302f 001c                 move.w     28(a7),d0
[000648d2] d06f 0032                 add.w      50(a7),d0
[000648d6] 906f 002a                 sub.w      42(a7),d0
[000648da] 3f40 002e                 move.w     d0,46(a7)
[000648de] 302f 001a                 move.w     26(a7),d0
[000648e2] d06f 0034                 add.w      52(a7),d0
[000648e6] d06f 002c                 add.w      44(a7),d0
[000648ea] 5340                      subq.w     #1,d0
[000648ec] 3f40 0030                 move.w     d0,48(a7)
[000648f0] 70fe                      moveq.l    #-2,d0
[000648f2] d06f 001c                 add.w      28(a7),d0
[000648f6] 3f40 002a                 move.w     d0,42(a7)
[000648fa] 3f6f 001a 002c            move.w     26(a7),44(a7)
[00064900] 41ef 002a                 lea.l      42(a7),a0
[00064904] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006490a] 3029 0010                 move.w     16(a1),d0
[0006490e] 4eb9 0007 282e            jsr        v_bar
[00064914] 2057                      movea.l    (a7),a0
[00064916] 2010                      move.l     (a0),d0
[00064918] 721c                      moveq.l    #28,d1
[0006491a] e2a0                      asr.l      d1,d0
[0006491c] c0bc 0000 0001            and.l      #$00000001,d0
[00064922] 672a                      beq.s      A_innerframe_24
[00064924] 302f 0014                 move.w     20(a7),d0
[00064928] 6724                      beq.s      A_innerframe_24
[0006492a] 303c 0080                 move.w     #$0080,d0
[0006492e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064934] c068 02b4                 and.w      692(a0),d0
[00064938] 6714                      beq.s      A_innerframe_24
[0006493a] 7201                      moveq.l    #1,d1
[0006493c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064942] 3028 0010                 move.w     16(a0),d0
[00064946] 4eb9 0007 3070            jsr        vswr_mode
[0006494c] 6012                      bra.s      A_innerframe_25
A_innerframe_24:
[0006494e] 7202                      moveq.l    #2,d1
[00064950] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064956] 3028 0010                 move.w     16(a0),d0
[0006495a] 4eb9 0007 3070            jsr        vswr_mode
A_innerframe_25:
[00064960] 4267                      clr.w      -(a7)
[00064962] 342f 0024                 move.w     36(a7),d2
[00064966] 206f 0006                 movea.l    6(a7),a0
[0006496a] 322f 001c                 move.w     28(a7),d1
[0006496e] 302f 001e                 move.w     30(a7),d0
[00064972] 6100 e2f2                 bsr        g_string
[00064976] 544f                      addq.w     #2,a7
A_innerframe_4:
[00064978] 7001                      moveq.l    #1,d0
[0006497a] c06f 0026                 and.w      38(a7),d0
[0006497e] 660c                      bne.s      A_innerframe_26
[00064980] 7001                      moveq.l    #1,d0
[00064982] 206f 0062                 movea.l    98(a7),a0
[00064986] c068 0008                 and.w      8(a0),d0
[0006498a] 676c                      beq.s      A_innerframe_27
A_innerframe_26:
[0006498c] 526f 004e                 addq.w     #1,78(a7)
[00064990] 526f 0050                 addq.w     #1,80(a7)
[00064994] 536f 0052                 subq.w     #1,82(a7)
[00064998] 536f 0054                 subq.w     #1,84(a7)
[0006499c] 7203                      moveq.l    #3,d1
[0006499e] 2079 0010 ee4e            movea.l    ACSblk,a0
[000649a4] 3028 0010                 move.w     16(a0),d0
[000649a8] 4eb9 0007 3070            jsr        vswr_mode
[000649ae] 7201                      moveq.l    #1,d1
[000649b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000649b6] 3028 0010                 move.w     16(a0),d0
[000649ba] 4eb9 0007 3660            jsr        vsf_interior
[000649c0] 7201                      moveq.l    #1,d1
[000649c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000649c8] 3028 0010                 move.w     16(a0),d0
[000649cc] 4eb9 0007 3708            jsr        vsf_color
[000649d2] 4241                      clr.w      d1
[000649d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000649da] 3028 0010                 move.w     16(a0),d0
[000649de] 4eb9 0007 375c            jsr        vsf_perimeter
[000649e4] 41ef 004e                 lea.l      78(a7),a0
[000649e8] 2279 0010 ee4e            movea.l    ACSblk,a1
[000649ee] 3029 0010                 move.w     16(a1),d0
[000649f2] 4eb9 0007 282e            jsr        v_bar
A_innerframe_27:
[000649f8] 41ef 004e                 lea.l      78(a7),a0
[000649fc] 4241                      clr.w      d1
[000649fe] 2279 0010 ee4e            movea.l    ACSblk,a1
[00064a04] 3029 0010                 move.w     16(a1),d0
[00064a08] 4eb9 0007 2230            jsr        vs_clip
[00064a0e] 70f6                      moveq.l    #-10,d0
[00064a10] 206f 0062                 movea.l    98(a7),a0
[00064a14] c068 0008                 and.w      8(a0),d0
[00064a18] 4fef 0056                 lea.l      86(a7),a7
[00064a1c] 245f                      movea.l    (a7)+,a2
[00064a1e] 241f                      move.l     (a7)+,d2
[00064a20] 4e75                      rts

A_3Dbutton:
[00064a22] 2f02                      move.l     d2,-(a7)
[00064a24] 2f0a                      move.l     a2,-(a7)
[00064a26] 4fef ff96                 lea.l      -106(a7),a7
[00064a2a] 206f 0076                 movea.l    118(a7),a0
[00064a2e] 3028 0016                 move.w     22(a0),d0
[00064a32] 660c                      bne.s      A_3Dbutton_1
[00064a34] 206f 0076                 movea.l    118(a7),a0
[00064a38] 3028 0018                 move.w     24(a0),d0
[00064a3c] 6700 0082                 beq        A_3Dbutton_2
A_3Dbutton_1:
[00064a40] 206f 0076                 movea.l    118(a7),a0
[00064a44] 3f68 0012 005e            move.w     18(a0),94(a7)
[00064a4a] 206f 0076                 movea.l    118(a7),a0
[00064a4e] 3f68 0014 0060            move.w     20(a0),96(a7)
[00064a54] 206f 0076                 movea.l    118(a7),a0
[00064a58] 3028 0016                 move.w     22(a0),d0
[00064a5c] 6714                      beq.s      A_3Dbutton_3
[00064a5e] 206f 0076                 movea.l    118(a7),a0
[00064a62] 3028 0012                 move.w     18(a0),d0
[00064a66] 206f 0076                 movea.l    118(a7),a0
[00064a6a] d068 0016                 add.w      22(a0),d0
[00064a6e] 5340                      subq.w     #1,d0
[00064a70] 6008                      bra.s      A_3Dbutton_4
A_3Dbutton_3:
[00064a72] 206f 0076                 movea.l    118(a7),a0
[00064a76] 3028 0012                 move.w     18(a0),d0
A_3Dbutton_4:
[00064a7a] 3f40 0062                 move.w     d0,98(a7)
[00064a7e] 206f 0076                 movea.l    118(a7),a0
[00064a82] 3028 0018                 move.w     24(a0),d0
[00064a86] 6714                      beq.s      A_3Dbutton_5
[00064a88] 206f 0076                 movea.l    118(a7),a0
[00064a8c] 3028 0014                 move.w     20(a0),d0
[00064a90] 206f 0076                 movea.l    118(a7),a0
[00064a94] d068 0018                 add.w      24(a0),d0
[00064a98] 5340                      subq.w     #1,d0
[00064a9a] 6008                      bra.s      A_3Dbutton_6
A_3Dbutton_5:
[00064a9c] 206f 0076                 movea.l    118(a7),a0
[00064aa0] 3028 0014                 move.w     20(a0),d0
A_3Dbutton_6:
[00064aa4] 3f40 0064                 move.w     d0,100(a7)
[00064aa8] 41ef 005e                 lea.l      94(a7),a0
[00064aac] 7201                      moveq.l    #1,d1
[00064aae] 2279 0010 ee4e            movea.l    ACSblk,a1
[00064ab4] 3029 0010                 move.w     16(a1),d0
[00064ab8] 4eb9 0007 2230            jsr        vs_clip
[00064abe] 6016                      bra.s      A_3Dbutton_7
A_3Dbutton_2:
[00064ac0] 41ef 005e                 lea.l      94(a7),a0
[00064ac4] 4241                      clr.w      d1
[00064ac6] 2279 0010 ee4e            movea.l    ACSblk,a1
[00064acc] 3029 0010                 move.w     16(a1),d0
[00064ad0] 4eb9 0007 2230            jsr        vs_clip
A_3Dbutton_7:
[00064ad6] 206f 0076                 movea.l    118(a7),a0
[00064ada] 3228 0004                 move.w     4(a0),d1
[00064ade] 48c1                      ext.l      d1
[00064ae0] 2001                      move.l     d1,d0
[00064ae2] d080                      add.l      d0,d0
[00064ae4] d081                      add.l      d1,d0
[00064ae6] e788                      lsl.l      #3,d0
[00064ae8] 206f 0076                 movea.l    118(a7),a0
[00064aec] 2050                      movea.l    (a0),a0
[00064aee] d1c0                      adda.l     d0,a0
[00064af0] 2f48 0008                 move.l     a0,8(a7)
[00064af4] 206f 0008                 movea.l    8(a7),a0
[00064af8] 41e8 0018                 lea.l      24(a0),a0
[00064afc] 2f48 0004                 move.l     a0,4(a7)
[00064b00] 7020                      moveq.l    #32,d0
[00064b02] 206f 0008                 movea.l    8(a7),a0
[00064b06] c068 0008                 and.w      8(a0),d0
[00064b0a] 661a                      bne.s      A_3Dbutton_8
[00064b0c] 206f 0004                 movea.l    4(a7),a0
[00064b10] 3028 0008                 move.w     8(a0),d0
[00064b14] c07c 8000                 and.w      #$8000,d0
[00064b18] 670c                      beq.s      A_3Dbutton_8
[00064b1a] 206f 0004                 movea.l    4(a7),a0
[00064b1e] 3f68 000a 0028            move.w     10(a0),40(a7)
[00064b24] 6004                      bra.s      A_3Dbutton_9
A_3Dbutton_8:
[00064b26] 426f 0028                 clr.w      40(a7)
A_3Dbutton_9:
[00064b2a] 206f 0008                 movea.l    8(a7),a0
[00064b2e] 2f68 000c 000c            move.l     12(a0),12(a7)
[00064b34] 206f 000c                 movea.l    12(a7),a0
[00064b38] 2ea8 000c                 move.l     12(a0),(a7)
[00064b3c] 6606                      bne.s      A_3Dbutton_10
[00064b3e] 426f 002a                 clr.w      42(a7)
[00064b42] 600c                      bra.s      A_3Dbutton_11
A_3Dbutton_10:
[00064b44] 2057                      movea.l    (a7),a0
[00064b46] 4eb9 0008 2f6c            jsr        strlen
[00064b4c] 3f40 002a                 move.w     d0,42(a7)
A_3Dbutton_11:
[00064b50] 206f 0076                 movea.l    118(a7),a0
[00064b54] 2f68 001a 0066            move.l     26(a0),102(a7)
[00064b5a] 202f 0066                 move.l     102(a7),d0
[00064b5e] 7214                      moveq.l    #20,d1
[00064b60] e2a0                      asr.l      d1,d0
[00064b62] c07c 000f                 and.w      #$000F,d0
[00064b66] 3f40 0024                 move.w     d0,36(a7)
[00064b6a] 0c6f 0007 0024            cmpi.w     #$0007,36(a7)
[00064b70] 6f06                      ble.s      A_3Dbutton_12
[00064b72] 066f fff0 0024            addi.w     #$FFF0,36(a7)
A_3Dbutton_12:
[00064b78] 302f 0066                 move.w     102(a7),d0
[00064b7c] e148                      lsl.w      #8,d0
[00064b7e] e040                      asr.w      #8,d0
[00064b80] c07c 000f                 and.w      #$000F,d0
[00064b84] 3f40 0026                 move.w     d0,38(a7)
[00064b88] 302f 0026                 move.w     38(a7),d0
[00064b8c] 6f10                      ble.s      A_3Dbutton_13
[00064b8e] 7002                      moveq.l    #2,d0
[00064b90] 206f 0008                 movea.l    8(a7),a0
[00064b94] c068 0008                 and.w      8(a0),d0
[00064b98] 6704                      beq.s      A_3Dbutton_13
[00064b9a] 526f 0026                 addq.w     #1,38(a7)
A_3Dbutton_13:
[00064b9e] 700f                      moveq.l    #15,d0
[00064ba0] c06f 0068                 and.w      104(a7),d0
[00064ba4] 5140                      subq.w     #8,d0
[00064ba6] 6620                      bne.s      A_3Dbutton_14
[00064ba8] 302f 0068                 move.w     104(a7),d0
[00064bac] e848                      lsr.w      #4,d0
[00064bae] c07c 0007                 and.w      #$0007,d0
[00064bb2] 5f40                      subq.w     #7,d0
[00064bb4] 6612                      bne.s      A_3Dbutton_14
[00064bb6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064bbc] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00064bc2] 6c04                      bge.s      A_3Dbutton_14
[00064bc4] 7001                      moveq.l    #1,d0
[00064bc6] 6002                      bra.s      A_3Dbutton_15
A_3Dbutton_14:
[00064bc8] 4240                      clr.w      d0
A_3Dbutton_15:
[00064bca] 3f40 0018                 move.w     d0,24(a7)
[00064bce] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064bd4] 3f68 02b4 0014            move.w     692(a0),20(a7)
[00064bda] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064be0] 2068 023c                 movea.l    572(a0),a0
[00064be4] 3028 000e                 move.w     14(a0),d0
[00064be8] c07c 0100                 and.w      #$0100,d0
[00064bec] 3f40 0016                 move.w     d0,22(a7)
[00064bf0] 302f 0016                 move.w     22(a7),d0
[00064bf4] 6718                      beq.s      A_3Dbutton_16
[00064bf6] 0c6f 0001 0026            cmpi.w     #$0001,38(a7)
[00064bfc] 6f10                      ble.s      A_3Dbutton_16
[00064bfe] 7044                      moveq.l    #68,d0
[00064c00] 206f 0008                 movea.l    8(a7),a0
[00064c04] c068 0008                 and.w      8(a0),d0
[00064c08] 6604                      bne.s      A_3Dbutton_16
[00064c0a] 7001                      moveq.l    #1,d0
[00064c0c] 6002                      bra.s      A_3Dbutton_17
A_3Dbutton_16:
[00064c0e] 4240                      clr.w      d0
A_3Dbutton_17:
[00064c10] 3f40 0010                 move.w     d0,16(a7)
[00064c14] 302f 0010                 move.w     16(a7),d0
[00064c18] 6708                      beq.s      A_3Dbutton_18
[00064c1a] 556f 0024                 subq.w     #2,36(a7)
[00064c1e] 546f 0026                 addq.w     #2,38(a7)
A_3Dbutton_18:
[00064c22] 206f 0076                 movea.l    118(a7),a0
[00064c26] 3028 000a                 move.w     10(a0),d0
[00064c2a] 906f 0024                 sub.w      36(a7),d0
[00064c2e] 3f40 005e                 move.w     d0,94(a7)
[00064c32] 206f 0076                 movea.l    118(a7),a0
[00064c36] 3028 000c                 move.w     12(a0),d0
[00064c3a] 906f 0024                 sub.w      36(a7),d0
[00064c3e] 3f40 0060                 move.w     d0,96(a7)
[00064c42] 206f 0076                 movea.l    118(a7),a0
[00064c46] 3028 000a                 move.w     10(a0),d0
[00064c4a] 206f 0076                 movea.l    118(a7),a0
[00064c4e] d068 000e                 add.w      14(a0),d0
[00064c52] d06f 0024                 add.w      36(a7),d0
[00064c56] 5340                      subq.w     #1,d0
[00064c58] 3f40 0062                 move.w     d0,98(a7)
[00064c5c] 206f 0076                 movea.l    118(a7),a0
[00064c60] 3028 000c                 move.w     12(a0),d0
[00064c64] 206f 0076                 movea.l    118(a7),a0
[00064c68] d068 0010                 add.w      16(a0),d0
[00064c6c] d06f 0024                 add.w      36(a7),d0
[00064c70] 5340                      subq.w     #1,d0
[00064c72] 3f40 0064                 move.w     d0,100(a7)
[00064c76] 302f 0062                 move.w     98(a7),d0
[00064c7a] b06f 005e                 cmp.w      94(a7),d0
[00064c7e] 6c06                      bge.s      A_3Dbutton_19
[00064c80] 3f6f 005e 0062            move.w     94(a7),98(a7)
A_3Dbutton_19:
[00064c86] 302f 0064                 move.w     100(a7),d0
[00064c8a] b06f 0060                 cmp.w      96(a7),d0
[00064c8e] 6c06                      bge.s      A_3Dbutton_20
[00064c90] 3f6f 0060 0064            move.w     96(a7),100(a7)
A_3Dbutton_20:
[00064c96] 206f 0076                 movea.l    118(a7),a0
[00064c9a] 3028 0008                 move.w     8(a0),d0
[00064c9e] 206f 0076                 movea.l    118(a7),a0
[00064ca2] 3228 0006                 move.w     6(a0),d1
[00064ca6] b340                      eor.w      d1,d0
[00064ca8] 3f40 002c                 move.w     d0,44(a7)
[00064cac] 302f 002c                 move.w     44(a7),d0
[00064cb0] 6600 030c                 bne        A_3Dbutton_21
[00064cb4] 202f 0066                 move.l     102(a7),d0
[00064cb8] c0bc 8000 0000            and.l      #$80000000,d0
[00064cbe] 6600 00ea                 bne        A_3Dbutton_22
[00064cc2] 7201                      moveq.l    #1,d1
[00064cc4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064cca] 3028 0010                 move.w     16(a0),d0
[00064cce] 4eb9 0007 3070            jsr        vswr_mode
[00064cd4] 302f 0018                 move.w     24(a7),d0
[00064cd8] 6718                      beq.s      A_3Dbutton_23
[00064cda] 7070                      moveq.l    #112,d0
[00064cdc] c06f 0014                 and.w      20(a7),d0
[00064ce0] e840                      asr.w      #4,d0
[00064ce2] 3f40 0032                 move.w     d0,50(a7)
[00064ce6] 700f                      moveq.l    #15,d0
[00064ce8] c06f 0014                 and.w      20(a7),d0
[00064cec] 3f40 0030                 move.w     d0,48(a7)
[00064cf0] 6018                      bra.s      A_3Dbutton_24
A_3Dbutton_23:
[00064cf2] 302f 0068                 move.w     104(a7),d0
[00064cf6] e848                      lsr.w      #4,d0
[00064cf8] c07c 0007                 and.w      #$0007,d0
[00064cfc] 3f40 0032                 move.w     d0,50(a7)
[00064d00] 700f                      moveq.l    #15,d0
[00064d02] c06f 0068                 and.w      104(a7),d0
[00064d06] 3f40 0030                 move.w     d0,48(a7)
A_3Dbutton_24:
[00064d0a] 302f 0016                 move.w     22(a7),d0
[00064d0e] 6704                      beq.s      A_3Dbutton_25
[00064d10] 426f 0032                 clr.w      50(a7)
A_3Dbutton_25:
[00064d14] 302f 0032                 move.w     50(a7),d0
[00064d18] 6614                      bne.s      A_3Dbutton_26
[00064d1a] 4241                      clr.w      d1
[00064d1c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064d22] 3028 0010                 move.w     16(a0),d0
[00064d26] 4eb9 0007 3660            jsr        vsf_interior
[00064d2c] 6042                      bra.s      A_3Dbutton_27
A_3Dbutton_26:
[00064d2e] 0c6f 0007 0032            cmpi.w     #$0007,50(a7)
[00064d34] 6614                      bne.s      A_3Dbutton_28
[00064d36] 7201                      moveq.l    #1,d1
[00064d38] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064d3e] 3028 0010                 move.w     16(a0),d0
[00064d42] 4eb9 0007 3660            jsr        vsf_interior
[00064d48] 6026                      bra.s      A_3Dbutton_27
A_3Dbutton_28:
[00064d4a] 7202                      moveq.l    #2,d1
[00064d4c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064d52] 3028 0010                 move.w     16(a0),d0
[00064d56] 4eb9 0007 3660            jsr        vsf_interior
[00064d5c] 322f 0032                 move.w     50(a7),d1
[00064d60] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064d66] 3028 0010                 move.w     16(a0),d0
[00064d6a] 4eb9 0007 36b4            jsr        vsf_style
A_3Dbutton_27:
[00064d70] 322f 0030                 move.w     48(a7),d1
[00064d74] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064d7a] 3028 0010                 move.w     16(a0),d0
[00064d7e] 4eb9 0007 3708            jsr        vsf_color
[00064d84] 4241                      clr.w      d1
[00064d86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064d8c] 3028 0010                 move.w     16(a0),d0
[00064d90] 4eb9 0007 375c            jsr        vsf_perimeter
[00064d96] 41ef 005e                 lea.l      94(a7),a0
[00064d9a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00064da0] 3029 0010                 move.w     16(a1),d0
[00064da4] 4eb9 0007 282e            jsr        v_bar
A_3Dbutton_22:
[00064daa] 302f 002a                 move.w     42(a7),d0
[00064dae] 6f00 020e                 ble        A_3Dbutton_21
[00064db2] 302f 0068                 move.w     104(a7),d0
[00064db6] ee48                      lsr.w      #7,d0
[00064db8] c07c 0001                 and.w      #$0001,d0
[00064dbc] 3f40 002e                 move.w     d0,46(a7)
[00064dc0] 302f 0018                 move.w     24(a7),d0
[00064dc4] 672c                      beq.s      A_3Dbutton_29
[00064dc6] 302f 002e                 move.w     46(a7),d0
[00064dca] 660e                      bne.s      A_3Dbutton_30
[00064dcc] 303c 0080                 move.w     #$0080,d0
[00064dd0] c06f 0014                 and.w      20(a7),d0
[00064dd4] ee40                      asr.w      #7,d0
[00064dd6] 3f40 002e                 move.w     d0,46(a7)
A_3Dbutton_30:
[00064dda] 302f 002e                 move.w     46(a7),d0
[00064dde] 6612                      bne.s      A_3Dbutton_29
[00064de0] 302f 0014                 move.w     20(a7),d0
[00064de4] c07c 0100                 and.w      #$0100,d0
[00064de8] 6708                      beq.s      A_3Dbutton_29
[00064dea] 2057                      movea.l    (a7),a0
[00064dec] 4eb9 0004 64da            jsr        Ast_toupper
A_3Dbutton_29:
[00064df2] 302f 002e                 move.w     46(a7),d0
[00064df6] 6714                      beq.s      A_3Dbutton_31
[00064df8] 7201                      moveq.l    #1,d1
[00064dfa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064e00] 3028 0010                 move.w     16(a0),d0
[00064e04] 4eb9 0007 3070            jsr        vswr_mode
[00064e0a] 6012                      bra.s      A_3Dbutton_32
A_3Dbutton_31:
[00064e0c] 7202                      moveq.l    #2,d1
[00064e0e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064e14] 3028 0010                 move.w     16(a0),d0
[00064e18] 4eb9 0007 3070            jsr        vswr_mode
A_3Dbutton_32:
[00064e1e] 43ef 0036                 lea.l      54(a7),a1
[00064e22] 41ef 0036                 lea.l      54(a7),a0
[00064e26] 7405                      moveq.l    #5,d2
[00064e28] 4241                      clr.w      d1
[00064e2a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00064e30] 302a 0010                 move.w     16(a2),d0
[00064e34] 4eb9 0007 35e2            jsr        vst_alignment
[00064e3a] 4241                      clr.w      d1
[00064e3c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064e42] 3028 0010                 move.w     16(a0),d0
[00064e46] 4eb9 0007 3492            jsr        vst_rotation
[00064e4c] 4241                      clr.w      d1
[00064e4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064e54] 3028 0010                 move.w     16(a0),d0
[00064e58] 4eb9 0007 358e            jsr        vst_effects
[00064e5e] 322f 0068                 move.w     104(a7),d1
[00064e62] e049                      lsr.w      #8,d1
[00064e64] c27c 000f                 and.w      #$000F,d1
[00064e68] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064e6e] 3028 0010                 move.w     16(a0),d0
[00064e72] 4eb9 0007 353a            jsr        vst_color
[00064e78] 202f 0066                 move.l     102(a7),d0
[00064e7c] c0bc 4000 0000            and.l      #$40000000,d0
[00064e82] 675e                      beq.s      A_3Dbutton_33
[00064e84] 302f 0018                 move.w     24(a7),d0
[00064e88] 6710                      beq.s      A_3Dbutton_34
[00064e8a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064e90] 3028 02b4                 move.w     692(a0),d0
[00064e94] c07c 0100                 and.w      #$0100,d0
[00064e98] 6648                      bne.s      A_3Dbutton_33
A_3Dbutton_34:
[00064e9a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064ea0] 3228 0294                 move.w     660(a0),d1
[00064ea4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064eaa] 3028 0010                 move.w     16(a0),d0
[00064eae] 4eb9 0007 34e6            jsr        vst_font
[00064eb4] 486f 001e                 pea.l      30(a7)
[00064eb8] 486f 003c                 pea.l      60(a7)
[00064ebc] 43ef 003e                 lea.l      62(a7),a1
[00064ec0] 41ef 003e                 lea.l      62(a7),a0
[00064ec4] 2479 0010 ee4e            movea.l    ACSblk,a2
[00064eca] 322a 0296                 move.w     662(a2),d1
[00064ece] 2479 0010 ee4e            movea.l    ACSblk,a2
[00064ed4] 302a 0010                 move.w     16(a2),d0
[00064ed8] 4eb9 0007 3370            jsr        vst_height
[00064ede] 504f                      addq.w     #8,a7
[00064ee0] 6046                      bra.s      A_3Dbutton_35
A_3Dbutton_33:
[00064ee2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064ee8] 3228 0290                 move.w     656(a0),d1
[00064eec] 2079 0010 ee4e            movea.l    ACSblk,a0
[00064ef2] 3028 0010                 move.w     16(a0),d0
[00064ef6] 4eb9 0007 34e6            jsr        vst_font
[00064efc] 486f 001e                 pea.l      30(a7)
[00064f00] 486f 003c                 pea.l      60(a7)
[00064f04] 43ef 003e                 lea.l      62(a7),a1
[00064f08] 41ef 003e                 lea.l      62(a7),a0
[00064f0c] 2479 0010 ee4e            movea.l    ACSblk,a2
[00064f12] 322a 0292                 move.w     658(a2),d1
[00064f16] 2479 0010 ee4e            movea.l    ACSblk,a2
[00064f1c] 302a 0010                 move.w     16(a2),d0
[00064f20] 4eb9 0007 3370            jsr        vst_height
[00064f26] 504f                      addq.w     #8,a7
A_3Dbutton_35:
[00064f28] 43ef 003a                 lea.l      58(a7),a1
[00064f2c] 2057                      movea.l    (a7),a0
[00064f2e] 2479 0010 ee4e            movea.l    ACSblk,a2
[00064f34] 302a 0010                 move.w     16(a2),d0
[00064f38] 4eb9 0007 55fe            jsr        vqt_extent
[00064f3e] 302f 003e                 move.w     62(a7),d0
[00064f42] 906f 003a                 sub.w      58(a7),d0
[00064f46] 3f40 0038                 move.w     d0,56(a7)
[00064f4a] 206f 0076                 movea.l    118(a7),a0
[00064f4e] 3028 0010                 move.w     16(a0),d0
[00064f52] 906f 001e                 sub.w      30(a7),d0
[00064f56] e240                      asr.w      #1,d0
[00064f58] 206f 0076                 movea.l    118(a7),a0
[00064f5c] d068 000c                 add.w      12(a0),d0
[00064f60] 3f40 0020                 move.w     d0,32(a7)
[00064f64] 202f 0066                 move.l     102(a7),d0
[00064f68] 721c                      moveq.l    #28,d1
[00064f6a] e2a0                      asr.l      d1,d0
[00064f6c] c07c 0003                 and.w      #$0003,d0
[00064f70] 4a40                      tst.w      d0
[00064f72] 6706                      beq.s      A_3Dbutton_36
[00064f74] 5340                      subq.w     #1,d0
[00064f76] 670a                      beq.s      A_3Dbutton_37
[00064f78] 6018                      bra.s      A_3Dbutton_38
A_3Dbutton_36:
[00064f7a] 3f6f 005e 0022            move.w     94(a7),34(a7)
[00064f80] 6024                      bra.s      A_3Dbutton_39
A_3Dbutton_37:
[00064f82] 302f 0062                 move.w     98(a7),d0
[00064f86] 906f 0038                 sub.w      56(a7),d0
[00064f8a] 5240                      addq.w     #1,d0
[00064f8c] 3f40 0022                 move.w     d0,34(a7)
[00064f90] 6014                      bra.s      A_3Dbutton_39
A_3Dbutton_38:
[00064f92] 302f 005e                 move.w     94(a7),d0
[00064f96] d06f 0062                 add.w      98(a7),d0
[00064f9a] 906f 0038                 sub.w      56(a7),d0
[00064f9e] e240                      asr.w      #1,d0
[00064fa0] 5240                      addq.w     #1,d0
[00064fa2] 3f40 0022                 move.w     d0,34(a7)
A_3Dbutton_39:
[00064fa6] 4267                      clr.w      -(a7)
[00064fa8] 342f 002a                 move.w     42(a7),d2
[00064fac] 206f 0002                 movea.l    2(a7),a0
[00064fb0] 322f 0022                 move.w     34(a7),d1
[00064fb4] 302f 0024                 move.w     36(a7),d0
[00064fb8] 6100 dcac                 bsr        g_string
[00064fbc] 544f                      addq.w     #2,a7
A_3Dbutton_21:
[00064fbe] 302f 0016                 move.w     22(a7),d0
[00064fc2] 670c                      beq.s      A_3Dbutton_40
[00064fc4] 7001                      moveq.l    #1,d0
[00064fc6] 3f40 001a                 move.w     d0,26(a7)
[00064fca] 3f40 001c                 move.w     d0,28(a7)
[00064fce] 6022                      bra.s      A_3Dbutton_41
A_3Dbutton_40:
[00064fd0] 302f 0068                 move.w     104(a7),d0
[00064fd4] 720c                      moveq.l    #12,d1
[00064fd6] e268                      lsr.w      d1,d0
[00064fd8] c07c 000f                 and.w      #$000F,d0
[00064fdc] 3f40 001c                 move.w     d0,28(a7)
[00064fe0] 302f 0066                 move.w     102(a7),d0
[00064fe4] e048                      lsr.w      #8,d0
[00064fe6] c07c 00ff                 and.w      #$00FF,d0
[00064fea] c07c 000f                 and.w      #$000F,d0
[00064fee] 3f40 001a                 move.w     d0,26(a7)
A_3Dbutton_41:
[00064ff2] 302f 0026                 move.w     38(a7),d0
[00064ff6] 6700 04fc                 beq        A_3Dbutton_42
[00064ffa] 302f 002c                 move.w     44(a7),d0
[00064ffe] 670c                      beq.s      A_3Dbutton_43
[00065000] 302f 001c                 move.w     28(a7),d0
[00065004] b06f 001a                 cmp.w      26(a7),d0
[00065008] 6700 04ea                 beq        A_3Dbutton_42
A_3Dbutton_43:
[0006500c] 3f6f 0026 0034            move.w     38(a7),52(a7)
[00065012] 302f 0034                 move.w     52(a7),d0
[00065016] 6a0a                      bpl.s      A_3Dbutton_44
[00065018] 302f 0034                 move.w     52(a7),d0
[0006501c] 4440                      neg.w      d0
[0006501e] 3f40 0034                 move.w     d0,52(a7)
A_3Dbutton_44:
[00065022] 7201                      moveq.l    #1,d1
[00065024] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006502a] 3028 0010                 move.w     16(a0),d0
[0006502e] 4eb9 0007 3070            jsr        vswr_mode
[00065034] 7201                      moveq.l    #1,d1
[00065036] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006503c] 3028 0010                 move.w     16(a0),d0
[00065040] 4eb9 0007 316a            jsr        vsl_width
[00065046] 4242                      clr.w      d2
[00065048] 4241                      clr.w      d1
[0006504a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065050] 3028 0010                 move.w     16(a0),d0
[00065054] 4eb9 0007 3214            jsr        vsl_ends
[0006505a] 7001                      moveq.l    #1,d0
[0006505c] 206f 0076                 movea.l    118(a7),a0
[00065060] c068 0008                 and.w      8(a0),d0
[00065064] 6700 0084                 beq        A_3Dbutton_45
[00065068] 302f 0018                 move.w     24(a7),d0
[0006506c] 674e                      beq.s      A_3Dbutton_46
[0006506e] 302f 0014                 move.w     20(a7),d0
[00065072] c07c 0400                 and.w      #$0400,d0
[00065076] 6708                      beq.s      A_3Dbutton_47
[00065078] 0c6f 0009 001a            cmpi.w     #$0009,26(a7)
[0006507e] 6710                      beq.s      A_3Dbutton_48
A_3Dbutton_47:
[00065080] 302f 0014                 move.w     20(a7),d0
[00065084] c07c 0200                 and.w      #$0200,d0
[00065088] 6732                      beq.s      A_3Dbutton_46
[0006508a] 302f 001a                 move.w     26(a7),d0
[0006508e] 662c                      bne.s      A_3Dbutton_46
A_3Dbutton_48:
[00065090] 7201                      moveq.l    #1,d1
[00065092] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065098] 3028 0010                 move.w     16(a0),d0
[0006509c] 4eb9 0007 31c0            jsr        vsl_color
[000650a2] 7207                      moveq.l    #7,d1
[000650a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000650aa] 3028 0010                 move.w     16(a0),d0
[000650ae] 4eb9 0007 30c4            jsr        vsl_type
[000650b4] 3f7c 0001 0012            move.w     #$0001,18(a7)
[000650ba] 602a                      bra.s      A_3Dbutton_49
A_3Dbutton_46:
[000650bc] 322f 001a                 move.w     26(a7),d1
[000650c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000650c6] 3028 0010                 move.w     16(a0),d0
[000650ca] 4eb9 0007 31c0            jsr        vsl_color
[000650d0] 7201                      moveq.l    #1,d1
[000650d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000650d8] 3028 0010                 move.w     16(a0),d0
[000650dc] 4eb9 0007 30c4            jsr        vsl_type
[000650e2] 426f 0012                 clr.w      18(a7)
A_3Dbutton_49:
[000650e6] 6000 0080                 bra        A_3Dbutton_50
A_3Dbutton_45:
[000650ea] 302f 0018                 move.w     24(a7),d0
[000650ee] 674e                      beq.s      A_3Dbutton_51
[000650f0] 302f 0014                 move.w     20(a7),d0
[000650f4] c07c 0400                 and.w      #$0400,d0
[000650f8] 6708                      beq.s      A_3Dbutton_52
[000650fa] 0c6f 0009 001c            cmpi.w     #$0009,28(a7)
[00065100] 6710                      beq.s      A_3Dbutton_53
A_3Dbutton_52:
[00065102] 302f 0014                 move.w     20(a7),d0
[00065106] c07c 0200                 and.w      #$0200,d0
[0006510a] 6732                      beq.s      A_3Dbutton_51
[0006510c] 302f 001c                 move.w     28(a7),d0
[00065110] 662c                      bne.s      A_3Dbutton_51
A_3Dbutton_53:
[00065112] 7201                      moveq.l    #1,d1
[00065114] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006511a] 3028 0010                 move.w     16(a0),d0
[0006511e] 4eb9 0007 31c0            jsr        vsl_color
[00065124] 7207                      moveq.l    #7,d1
[00065126] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006512c] 3028 0010                 move.w     16(a0),d0
[00065130] 4eb9 0007 30c4            jsr        vsl_type
[00065136] 3f7c 0001 0012            move.w     #$0001,18(a7)
[0006513c] 602a                      bra.s      A_3Dbutton_50
A_3Dbutton_51:
[0006513e] 322f 001c                 move.w     28(a7),d1
[00065142] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065148] 3028 0010                 move.w     16(a0),d0
[0006514c] 4eb9 0007 31c0            jsr        vsl_color
[00065152] 7201                      moveq.l    #1,d1
[00065154] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006515a] 3028 0010                 move.w     16(a0),d0
[0006515e] 4eb9 0007 30c4            jsr        vsl_type
[00065164] 426f 0012                 clr.w      18(a7)
A_3Dbutton_50:
[00065168] 302f 005e                 move.w     94(a7),d0
[0006516c] 3f40 004e                 move.w     d0,78(a7)
[00065170] 3f40 004a                 move.w     d0,74(a7)
[00065174] 3f6f 0064 004c            move.w     100(a7),76(a7)
[0006517a] 302f 0060                 move.w     96(a7),d0
[0006517e] 3f40 0054                 move.w     d0,84(a7)
[00065182] 3f40 0050                 move.w     d0,80(a7)
[00065186] 3f6f 0062 0052            move.w     98(a7),82(a7)
[0006518c] 6000 00b4                 bra        A_3Dbutton_54
A_3Dbutton_58:
[00065190] 302f 0010                 move.w     16(a7),d0
[00065194] 671a                      beq.s      A_3Dbutton_55
[00065196] 0c6f 0002 0034            cmpi.w     #$0002,52(a7)
[0006519c] 6c12                      bge.s      A_3Dbutton_55
[0006519e] 4241                      clr.w      d1
[000651a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000651a6] 3028 0010                 move.w     16(a0),d0
[000651aa] 4eb9 0007 31c0            jsr        vsl_color
A_3Dbutton_55:
[000651b0] 536f 004a                 subq.w     #1,74(a7)
[000651b4] 526f 004c                 addq.w     #1,76(a7)
[000651b8] 536f 004e                 subq.w     #1,78(a7)
[000651bc] 536f 0050                 subq.w     #1,80(a7)
[000651c0] 526f 0052                 addq.w     #1,82(a7)
[000651c4] 536f 0054                 subq.w     #1,84(a7)
[000651c8] 302f 0012                 move.w     18(a7),d0
[000651cc] 675e                      beq.s      A_3Dbutton_56
[000651ce] 323c 5555                 move.w     #$5555,d1
[000651d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000651d8] 3028 0010                 move.w     16(a0),d0
[000651dc] 4eb9 0007 3118            jsr        vsl_udsty
[000651e2] 41ef 004a                 lea.l      74(a7),a0
[000651e6] 7202                      moveq.l    #2,d1
[000651e8] 2279 0010 ee4e            movea.l    ACSblk,a1
[000651ee] 3029 0010                 move.w     16(a1),d0
[000651f2] 4eb9 0007 22e0            jsr        v_pline
[000651f8] 7001                      moveq.l    #1,d0
[000651fa] c06f 004e                 and.w      78(a7),d0
[000651fe] 6614                      bne.s      A_3Dbutton_57
[00065200] 323c aaaa                 move.w     #$AAAA,d1
[00065204] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006520a] 3028 0010                 move.w     16(a0),d0
[0006520e] 4eb9 0007 3118            jsr        vsl_udsty
A_3Dbutton_57:
[00065214] 41ef 004e                 lea.l      78(a7),a0
[00065218] 7202                      moveq.l    #2,d1
[0006521a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065220] 3029 0010                 move.w     16(a1),d0
[00065224] 4eb9 0007 22e0            jsr        v_pline
[0006522a] 6016                      bra.s      A_3Dbutton_54
A_3Dbutton_56:
[0006522c] 41ef 004a                 lea.l      74(a7),a0
[00065230] 7203                      moveq.l    #3,d1
[00065232] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065238] 3029 0010                 move.w     16(a1),d0
[0006523c] 4eb9 0007 22e0            jsr        v_pline
A_3Dbutton_54:
[00065242] 302f 0034                 move.w     52(a7),d0
[00065246] 536f 0034                 subq.w     #1,52(a7)
[0006524a] 4a40                      tst.w      d0
[0006524c] 6600 ff42                 bne        A_3Dbutton_58
[00065250] 3f6f 0026 0034            move.w     38(a7),52(a7)
[00065256] 302f 0034                 move.w     52(a7),d0
[0006525a] 6a0a                      bpl.s      A_3Dbutton_59
[0006525c] 302f 0034                 move.w     52(a7),d0
[00065260] 4440                      neg.w      d0
[00065262] 3f40 0034                 move.w     d0,52(a7)
A_3Dbutton_59:
[00065266] 7001                      moveq.l    #1,d0
[00065268] 206f 0076                 movea.l    118(a7),a0
[0006526c] c068 0008                 and.w      8(a0),d0
[00065270] 6700 0084                 beq        A_3Dbutton_60
[00065274] 302f 0018                 move.w     24(a7),d0
[00065278] 674e                      beq.s      A_3Dbutton_61
[0006527a] 302f 0014                 move.w     20(a7),d0
[0006527e] c07c 0400                 and.w      #$0400,d0
[00065282] 6708                      beq.s      A_3Dbutton_62
[00065284] 0c6f 0009 001c            cmpi.w     #$0009,28(a7)
[0006528a] 6710                      beq.s      A_3Dbutton_63
A_3Dbutton_62:
[0006528c] 302f 0014                 move.w     20(a7),d0
[00065290] c07c 0200                 and.w      #$0200,d0
[00065294] 6732                      beq.s      A_3Dbutton_61
[00065296] 302f 001c                 move.w     28(a7),d0
[0006529a] 662c                      bne.s      A_3Dbutton_61
A_3Dbutton_63:
[0006529c] 7201                      moveq.l    #1,d1
[0006529e] 2079 0010 ee4e            movea.l    ACSblk,a0
[000652a4] 3028 0010                 move.w     16(a0),d0
[000652a8] 4eb9 0007 31c0            jsr        vsl_color
[000652ae] 7207                      moveq.l    #7,d1
[000652b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000652b6] 3028 0010                 move.w     16(a0),d0
[000652ba] 4eb9 0007 30c4            jsr        vsl_type
[000652c0] 3f7c 0001 0012            move.w     #$0001,18(a7)
[000652c6] 602a                      bra.s      A_3Dbutton_64
A_3Dbutton_61:
[000652c8] 322f 001c                 move.w     28(a7),d1
[000652cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000652d2] 3028 0010                 move.w     16(a0),d0
[000652d6] 4eb9 0007 31c0            jsr        vsl_color
[000652dc] 7201                      moveq.l    #1,d1
[000652de] 2079 0010 ee4e            movea.l    ACSblk,a0
[000652e4] 3028 0010                 move.w     16(a0),d0
[000652e8] 4eb9 0007 30c4            jsr        vsl_type
[000652ee] 426f 0012                 clr.w      18(a7)
A_3Dbutton_64:
[000652f2] 6000 0080                 bra        A_3Dbutton_65
A_3Dbutton_60:
[000652f6] 302f 0018                 move.w     24(a7),d0
[000652fa] 674e                      beq.s      A_3Dbutton_66
[000652fc] 302f 0014                 move.w     20(a7),d0
[00065300] c07c 0400                 and.w      #$0400,d0
[00065304] 6708                      beq.s      A_3Dbutton_67
[00065306] 0c6f 0009 001a            cmpi.w     #$0009,26(a7)
[0006530c] 6710                      beq.s      A_3Dbutton_68
A_3Dbutton_67:
[0006530e] 302f 0014                 move.w     20(a7),d0
[00065312] c07c 0200                 and.w      #$0200,d0
[00065316] 6732                      beq.s      A_3Dbutton_66
[00065318] 302f 001a                 move.w     26(a7),d0
[0006531c] 662c                      bne.s      A_3Dbutton_66
A_3Dbutton_68:
[0006531e] 7201                      moveq.l    #1,d1
[00065320] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065326] 3028 0010                 move.w     16(a0),d0
[0006532a] 4eb9 0007 31c0            jsr        vsl_color
[00065330] 7207                      moveq.l    #7,d1
[00065332] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065338] 3028 0010                 move.w     16(a0),d0
[0006533c] 4eb9 0007 30c4            jsr        vsl_type
[00065342] 3f7c 0001 0012            move.w     #$0001,18(a7)
[00065348] 602a                      bra.s      A_3Dbutton_65
A_3Dbutton_66:
[0006534a] 322f 001a                 move.w     26(a7),d1
[0006534e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065354] 3028 0010                 move.w     16(a0),d0
[00065358] 4eb9 0007 31c0            jsr        vsl_color
[0006535e] 7201                      moveq.l    #1,d1
[00065360] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065366] 3028 0010                 move.w     16(a0),d0
[0006536a] 4eb9 0007 30c4            jsr        vsl_type
[00065370] 426f 0012                 clr.w      18(a7)
A_3Dbutton_65:
[00065374] 3f6f 005e 004a            move.w     94(a7),74(a7)
[0006537a] 302f 0064                 move.w     100(a7),d0
[0006537e] 3f40 004c                 move.w     d0,76(a7)
[00065382] 3f40 0050                 move.w     d0,80(a7)
[00065386] 3f6f 0060 0054            move.w     96(a7),84(a7)
[0006538c] 302f 0062                 move.w     98(a7),d0
[00065390] 3f40 0052                 move.w     d0,82(a7)
[00065394] 3f40 004e                 move.w     d0,78(a7)
[00065398] 6000 00b4                 bra        A_3Dbutton_69
A_3Dbutton_73:
[0006539c] 302f 0010                 move.w     16(a7),d0
[000653a0] 671a                      beq.s      A_3Dbutton_70
[000653a2] 0c6f 0002 0034            cmpi.w     #$0002,52(a7)
[000653a8] 6c12                      bge.s      A_3Dbutton_70
[000653aa] 4241                      clr.w      d1
[000653ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[000653b2] 3028 0010                 move.w     16(a0),d0
[000653b6] 4eb9 0007 31c0            jsr        vsl_color
A_3Dbutton_70:
[000653bc] 536f 004a                 subq.w     #1,74(a7)
[000653c0] 526f 004c                 addq.w     #1,76(a7)
[000653c4] 526f 004e                 addq.w     #1,78(a7)
[000653c8] 526f 0050                 addq.w     #1,80(a7)
[000653cc] 526f 0052                 addq.w     #1,82(a7)
[000653d0] 536f 0054                 subq.w     #1,84(a7)
[000653d4] 302f 0012                 move.w     18(a7),d0
[000653d8] 675e                      beq.s      A_3Dbutton_71
[000653da] 323c 5555                 move.w     #$5555,d1
[000653de] 2079 0010 ee4e            movea.l    ACSblk,a0
[000653e4] 3028 0010                 move.w     16(a0),d0
[000653e8] 4eb9 0007 3118            jsr        vsl_udsty
[000653ee] 41ef 004e                 lea.l      78(a7),a0
[000653f2] 7202                      moveq.l    #2,d1
[000653f4] 2279 0010 ee4e            movea.l    ACSblk,a1
[000653fa] 3029 0010                 move.w     16(a1),d0
[000653fe] 4eb9 0007 22e0            jsr        v_pline
[00065404] 7001                      moveq.l    #1,d0
[00065406] c06f 004e                 and.w      78(a7),d0
[0006540a] 6714                      beq.s      A_3Dbutton_72
[0006540c] 323c aaaa                 move.w     #$AAAA,d1
[00065410] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065416] 3028 0010                 move.w     16(a0),d0
[0006541a] 4eb9 0007 3118            jsr        vsl_udsty
A_3Dbutton_72:
[00065420] 41ef 004a                 lea.l      74(a7),a0
[00065424] 7202                      moveq.l    #2,d1
[00065426] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006542c] 3029 0010                 move.w     16(a1),d0
[00065430] 4eb9 0007 22e0            jsr        v_pline
[00065436] 6016                      bra.s      A_3Dbutton_69
A_3Dbutton_71:
[00065438] 41ef 004a                 lea.l      74(a7),a0
[0006543c] 7203                      moveq.l    #3,d1
[0006543e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065444] 3029 0010                 move.w     16(a1),d0
[00065448] 4eb9 0007 22e0            jsr        v_pline
A_3Dbutton_69:
[0006544e] 302f 0034                 move.w     52(a7),d0
[00065452] 536f 0034                 subq.w     #1,52(a7)
[00065456] 4a40                      tst.w      d0
[00065458] 6600 ff42                 bne        A_3Dbutton_73
[0006545c] 7005                      moveq.l    #5,d0
[0006545e] 206f 0008                 movea.l    8(a7),a0
[00065462] c068 0008                 and.w      8(a0),d0
[00065466] 5b40                      subq.w     #5,d0
[00065468] 6600 008a                 bne        A_3Dbutton_42
[0006546c] 7020                      moveq.l    #32,d0
[0006546e] 206f 0008                 movea.l    8(a7),a0
[00065472] c068 000a                 and.w      10(a0),d0
[00065476] 667c                      bne.s      A_3Dbutton_42
[00065478] 7201                      moveq.l    #1,d1
[0006547a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065480] 3028 0010                 move.w     16(a0),d0
[00065484] 4eb9 0007 30c4            jsr        vsl_type
[0006548a] 322f 0068                 move.w     104(a7),d1
[0006548e] e049                      lsr.w      #8,d1
[00065490] c27c 000f                 and.w      #$000F,d1
[00065494] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006549a] 3028 0010                 move.w     16(a0),d0
[0006549e] 4eb9 0007 31c0            jsr        vsl_color
[000654a4] 536f 004a                 subq.w     #1,74(a7)
[000654a8] 526f 004c                 addq.w     #1,76(a7)
[000654ac] 526f 004e                 addq.w     #1,78(a7)
[000654b0] 526f 0050                 addq.w     #1,80(a7)
[000654b4] 526f 0052                 addq.w     #1,82(a7)
[000654b8] 536f 0054                 subq.w     #1,84(a7)
[000654bc] 41ef 004a                 lea.l      74(a7),a0
[000654c0] 7203                      moveq.l    #3,d1
[000654c2] 2279 0010 ee4e            movea.l    ACSblk,a1
[000654c8] 3029 0010                 move.w     16(a1),d0
[000654cc] 4eb9 0007 22e0            jsr        v_pline
[000654d2] 3f6f 004a 004e            move.w     74(a7),78(a7)
[000654d8] 3f6f 0054 0050            move.w     84(a7),80(a7)
[000654de] 41ef 004a                 lea.l      74(a7),a0
[000654e2] 7203                      moveq.l    #3,d1
[000654e4] 2279 0010 ee4e            movea.l    ACSblk,a1
[000654ea] 3029 0010                 move.w     16(a1),d0
[000654ee] 4eb9 0007 22e0            jsr        v_pline
A_3Dbutton_42:
[000654f4] 302f 0026                 move.w     38(a7),d0
[000654f8] 670a                      beq.s      A_3Dbutton_74
[000654fa] 302f 001c                 move.w     28(a7),d0
[000654fe] b06f 001a                 cmp.w      26(a7),d0
[00065502] 6670                      bne.s      A_3Dbutton_75
A_3Dbutton_74:
[00065504] 7001                      moveq.l    #1,d0
[00065506] c06f 002c                 and.w      44(a7),d0
[0006550a] 660c                      bne.s      A_3Dbutton_76
[0006550c] 7001                      moveq.l    #1,d0
[0006550e] 206f 0076                 movea.l    118(a7),a0
[00065512] c068 0008                 and.w      8(a0),d0
[00065516] 675c                      beq.s      A_3Dbutton_75
A_3Dbutton_76:
[00065518] 7203                      moveq.l    #3,d1
[0006551a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065520] 3028 0010                 move.w     16(a0),d0
[00065524] 4eb9 0007 3070            jsr        vswr_mode
[0006552a] 7201                      moveq.l    #1,d1
[0006552c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065532] 3028 0010                 move.w     16(a0),d0
[00065536] 4eb9 0007 3660            jsr        vsf_interior
[0006553c] 7201                      moveq.l    #1,d1
[0006553e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065544] 3028 0010                 move.w     16(a0),d0
[00065548] 4eb9 0007 3708            jsr        vsf_color
[0006554e] 4241                      clr.w      d1
[00065550] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065556] 3028 0010                 move.w     16(a0),d0
[0006555a] 4eb9 0007 375c            jsr        vsf_perimeter
[00065560] 41ef 005e                 lea.l      94(a7),a0
[00065564] 2279 0010 ee4e            movea.l    ACSblk,a1
[0006556a] 3029 0010                 move.w     16(a1),d0
[0006556e] 4eb9 0007 282e            jsr        v_bar
A_3Dbutton_75:
[00065574] 7008                      moveq.l    #8,d0
[00065576] c06f 002c                 and.w      44(a7),d0
[0006557a] 660c                      bne.s      A_3Dbutton_77
[0006557c] 7008                      moveq.l    #8,d0
[0006557e] 206f 0076                 movea.l    118(a7),a0
[00065582] c068 0008                 and.w      8(a0),d0
[00065586] 676e                      beq.s      A_3Dbutton_78
A_3Dbutton_77:
[00065588] 7204                      moveq.l    #4,d1
[0006558a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065590] 3028 0010                 move.w     16(a0),d0
[00065594] 4eb9 0007 3070            jsr        vswr_mode
[0006559a] 7202                      moveq.l    #2,d1
[0006559c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000655a2] 3028 0010                 move.w     16(a0),d0
[000655a6] 4eb9 0007 3660            jsr        vsf_interior
[000655ac] 7204                      moveq.l    #4,d1
[000655ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[000655b4] 3028 0010                 move.w     16(a0),d0
[000655b8] 4eb9 0007 36b4            jsr        vsf_style
[000655be] 4241                      clr.w      d1
[000655c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000655c6] 3028 0010                 move.w     16(a0),d0
[000655ca] 4eb9 0007 3708            jsr        vsf_color
[000655d0] 4241                      clr.w      d1
[000655d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000655d8] 3028 0010                 move.w     16(a0),d0
[000655dc] 4eb9 0007 375c            jsr        vsf_perimeter
[000655e2] 41ef 005e                 lea.l      94(a7),a0
[000655e6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000655ec] 3029 0010                 move.w     16(a1),d0
[000655f0] 4eb9 0007 282e            jsr        v_bar
A_3Dbutton_78:
[000655f6] 41ef 005e                 lea.l      94(a7),a0
[000655fa] 4241                      clr.w      d1
[000655fc] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065602] 3029 0010                 move.w     16(a1),d0
[00065606] 4eb9 0007 2230            jsr        vs_clip
[0006560c] 70e6                      moveq.l    #-26,d0
[0006560e] 206f 0076                 movea.l    118(a7),a0
[00065612] c068 0008                 and.w      8(a0),d0
[00065616] 4fef 006a                 lea.l      106(a7),a7
[0006561a] 245f                      movea.l    (a7)+,a2
[0006561c] 241f                      move.l     (a7)+,d2
[0006561e] 4e75                      rts

A_title:
[00065620] 2f02                      move.l     d2,-(a7)
[00065622] 2f0a                      move.l     a2,-(a7)
[00065624] 4fef ffc8                 lea.l      -56(a7),a7
[00065628] 206f 0044                 movea.l    68(a7),a0
[0006562c] 3028 0016                 move.w     22(a0),d0
[00065630] 660a                      bne.s      A_title_1
[00065632] 206f 0044                 movea.l    68(a7),a0
[00065636] 3028 0018                 move.w     24(a0),d0
[0006563a] 6758                      beq.s      A_title_2
A_title_1:
[0006563c] 206f 0044                 movea.l    68(a7),a0
[00065640] 3f68 0012 0030            move.w     18(a0),48(a7)
[00065646] 206f 0044                 movea.l    68(a7),a0
[0006564a] 3f68 0014 0032            move.w     20(a0),50(a7)
[00065650] 206f 0044                 movea.l    68(a7),a0
[00065654] 3028 0012                 move.w     18(a0),d0
[00065658] 206f 0044                 movea.l    68(a7),a0
[0006565c] d068 0016                 add.w      22(a0),d0
[00065660] 5340                      subq.w     #1,d0
[00065662] 3f40 0034                 move.w     d0,52(a7)
[00065666] 206f 0044                 movea.l    68(a7),a0
[0006566a] 3028 0014                 move.w     20(a0),d0
[0006566e] 206f 0044                 movea.l    68(a7),a0
[00065672] d068 0018                 add.w      24(a0),d0
[00065676] 5340                      subq.w     #1,d0
[00065678] 3f40 0036                 move.w     d0,54(a7)
[0006567c] 41ef 0030                 lea.l      48(a7),a0
[00065680] 7201                      moveq.l    #1,d1
[00065682] 2279 0010 ee4e            movea.l    ACSblk,a1
[00065688] 3029 0010                 move.w     16(a1),d0
[0006568c] 4eb9 0007 2230            jsr        vs_clip
[00065692] 6016                      bra.s      A_title_3
A_title_2:
[00065694] 41ef 0030                 lea.l      48(a7),a0
[00065698] 4241                      clr.w      d1
[0006569a] 2279 0010 ee4e            movea.l    ACSblk,a1
[000656a0] 3029 0010                 move.w     16(a1),d0
[000656a4] 4eb9 0007 2230            jsr        vs_clip
A_title_3:
[000656aa] 206f 0044                 movea.l    68(a7),a0
[000656ae] 3028 0006                 move.w     6(a0),d0
[000656b2] 206f 0044                 movea.l    68(a7),a0
[000656b6] 3228 0008                 move.w     8(a0),d1
[000656ba] b340                      eor.w      d1,d0
[000656bc] 3f40 001c                 move.w     d0,28(a7)
[000656c0] 302f 001c                 move.w     28(a7),d0
[000656c4] 6600 02fa                 bne        A_title_4
[000656c8] 206f 0044                 movea.l    68(a7),a0
[000656cc] 3228 0004                 move.w     4(a0),d1
[000656d0] 48c1                      ext.l      d1
[000656d2] 2001                      move.l     d1,d0
[000656d4] d080                      add.l      d0,d0
[000656d6] d081                      add.l      d1,d0
[000656d8] e788                      lsl.l      #3,d0
[000656da] 206f 0044                 movea.l    68(a7),a0
[000656de] 2050                      movea.l    (a0),a0
[000656e0] d1c0                      adda.l     d0,a0
[000656e2] 2f48 0008                 move.l     a0,8(a7)
[000656e6] 206f 0008                 movea.l    8(a7),a0
[000656ea] 2f68 000c 000c            move.l     12(a0),12(a7)
[000656f0] 206f 000c                 movea.l    12(a7),a0
[000656f4] 2ea8 000c                 move.l     12(a0),(a7)
[000656f8] 2017                      move.l     (a7),d0
[000656fa] 6700 021a                 beq        A_title_5
[000656fe] 2057                      movea.l    (a7),a0
[00065700] 4eb9 0008 2f6c            jsr        strlen
[00065706] 3f40 001a                 move.w     d0,26(a7)
[0006570a] 302f 001a                 move.w     26(a7),d0
[0006570e] 6f00 0206                 ble        A_title_5
[00065712] 206f 0008                 movea.l    8(a7),a0
[00065716] 41e8 0018                 lea.l      24(a0),a0
[0006571a] 2f48 0004                 move.l     a0,4(a7)
[0006571e] 7020                      moveq.l    #32,d0
[00065720] 206f 0008                 movea.l    8(a7),a0
[00065724] c068 0008                 and.w      8(a0),d0
[00065728] 661a                      bne.s      A_title_6
[0006572a] 206f 0004                 movea.l    4(a7),a0
[0006572e] 3028 0008                 move.w     8(a0),d0
[00065732] c07c 8000                 and.w      #$8000,d0
[00065736] 670c                      beq.s      A_title_6
[00065738] 206f 0004                 movea.l    4(a7),a0
[0006573c] 3f68 000a 0018            move.w     10(a0),24(a7)
[00065742] 6004                      bra.s      A_title_7
A_title_6:
[00065744] 426f 0018                 clr.w      24(a7)
A_title_7:
[00065748] 7008                      moveq.l    #8,d0
[0006574a] 206f 0044                 movea.l    68(a7),a0
[0006574e] c0a8 001a                 and.l      26(a0),d0
[00065752] 6714                      beq.s      A_title_8
[00065754] 7201                      moveq.l    #1,d1
[00065756] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006575c] 3028 0010                 move.w     16(a0),d0
[00065760] 4eb9 0007 3070            jsr        vswr_mode
[00065766] 6012                      bra.s      A_title_9
A_title_8:
[00065768] 7202                      moveq.l    #2,d1
[0006576a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065770] 3028 0010                 move.w     16(a0),d0
[00065774] 4eb9 0007 3070            jsr        vswr_mode
A_title_9:
[0006577a] 4241                      clr.w      d1
[0006577c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065782] 3028 0010                 move.w     16(a0),d0
[00065786] 4eb9 0007 3492            jsr        vst_rotation
[0006578c] 4241                      clr.w      d1
[0006578e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065794] 3028 0010                 move.w     16(a0),d0
[00065798] 4eb9 0007 358e            jsr        vst_effects
[0006579e] 7201                      moveq.l    #1,d1
[000657a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000657a6] 3028 0010                 move.w     16(a0),d0
[000657aa] 4eb9 0007 353a            jsr        vst_color
[000657b0] 43ef 001e                 lea.l      30(a7),a1
[000657b4] 41ef 001e                 lea.l      30(a7),a0
[000657b8] 7405                      moveq.l    #5,d2
[000657ba] 4241                      clr.w      d1
[000657bc] 2479 0010 ee4e            movea.l    ACSblk,a2
[000657c2] 302a 0010                 move.w     16(a2),d0
[000657c6] 4eb9 0007 35e2            jsr        vst_alignment
[000657cc] 7004                      moveq.l    #4,d0
[000657ce] 206f 0044                 movea.l    68(a7),a0
[000657d2] c0a8 001a                 and.l      26(a0),d0
[000657d6] 675a                      beq.s      A_title_10
[000657d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000657de] 3228 0294                 move.w     660(a0),d1
[000657e2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000657e8] 3028 0010                 move.w     16(a0),d0
[000657ec] 4eb9 0007 34e6            jsr        vst_font
[000657f2] 486f 0016                 pea.l      22(a7)
[000657f6] 486f 0018                 pea.l      24(a7)
[000657fa] 43ef 0026                 lea.l      38(a7),a1
[000657fe] 41ef 0026                 lea.l      38(a7),a0
[00065802] 2479 0010 ee4e            movea.l    ACSblk,a2
[00065808] 322a 0296                 move.w     662(a2),d1
[0006580c] 2479 0010 ee4e            movea.l    ACSblk,a2
[00065812] 302a 0010                 move.w     16(a2),d0
[00065816] 4eb9 0007 3370            jsr        vst_height
[0006581c] 504f                      addq.w     #8,a7
[0006581e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065824] 3028 0014                 move.w     20(a0),d0
[00065828] 906f 0016                 sub.w      22(a7),d0
[0006582c] 3f40 0010                 move.w     d0,16(a7)
[00065830] 604a                      bra.s      A_title_11
A_title_10:
[00065832] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065838] 3228 0290                 move.w     656(a0),d1
[0006583c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065842] 3028 0010                 move.w     16(a0),d0
[00065846] 4eb9 0007 34e6            jsr        vst_font
[0006584c] 486f 0016                 pea.l      22(a7)
[00065850] 486f 0018                 pea.l      24(a7)
[00065854] 43ef 0026                 lea.l      38(a7),a1
[00065858] 41ef 0026                 lea.l      38(a7),a0
[0006585c] 2479 0010 ee4e            movea.l    ACSblk,a2
[00065862] 322a 0292                 move.w     658(a2),d1
[00065866] 2479 0010 ee4e            movea.l    ACSblk,a2
[0006586c] 302a 0010                 move.w     16(a2),d0
[00065870] 4eb9 0007 3370            jsr        vst_height
[00065876] 504f                      addq.w     #8,a7
[00065878] 426f 0010                 clr.w      16(a7)
A_title_11:
[0006587c] 43ef 0020                 lea.l      32(a7),a1
[00065880] 2057                      movea.l    (a7),a0
[00065882] 2479 0010 ee4e            movea.l    ACSblk,a2
[00065888] 302a 0010                 move.w     16(a2),d0
[0006588c] 4eb9 0007 55fe            jsr        vqt_extent
[00065892] 302f 0024                 move.w     36(a7),d0
[00065896] 906f 0020                 sub.w      32(a7),d0
[0006589a] 5240                      addq.w     #1,d0
[0006589c] 3f40 0014                 move.w     d0,20(a7)
[000658a0] 7003                      moveq.l    #3,d0
[000658a2] 206f 0044                 movea.l    68(a7),a0
[000658a6] c068 001c                 and.w      28(a0),d0
[000658aa] 5340                      subq.w     #1,d0
[000658ac] 6706                      beq.s      A_title_12
[000658ae] 5340                      subq.w     #1,d0
[000658b0] 671e                      beq.s      A_title_13
[000658b2] 6038                      bra.s      A_title_14
A_title_12:
[000658b4] 206f 0044                 movea.l    68(a7),a0
[000658b8] 3028 000e                 move.w     14(a0),d0
[000658bc] 906f 0014                 sub.w      20(a7),d0
[000658c0] e240                      asr.w      #1,d0
[000658c2] 206f 0044                 movea.l    68(a7),a0
[000658c6] d068 000a                 add.w      10(a0),d0
[000658ca] 3f40 0012                 move.w     d0,18(a7)
[000658ce] 6026                      bra.s      A_title_15
A_title_13:
[000658d0] 206f 0044                 movea.l    68(a7),a0
[000658d4] 3028 000a                 move.w     10(a0),d0
[000658d8] 206f 0044                 movea.l    68(a7),a0
[000658dc] d068 000e                 add.w      14(a0),d0
[000658e0] 906f 0014                 sub.w      20(a7),d0
[000658e4] 5240                      addq.w     #1,d0
[000658e6] 3f40 0012                 move.w     d0,18(a7)
[000658ea] 600a                      bra.s      A_title_15
A_title_14:
[000658ec] 206f 0044                 movea.l    68(a7),a0
[000658f0] 3f68 000a 0012            move.w     10(a0),18(a7)
A_title_15:
[000658f6] 4267                      clr.w      -(a7)
[000658f8] 342f 001a                 move.w     26(a7),d2
[000658fc] 206f 0002                 movea.l    2(a7),a0
[00065900] 226f 0046                 movea.l    70(a7),a1
[00065904] 3229 000c                 move.w     12(a1),d1
[00065908] d26f 0012                 add.w      18(a7),d1
[0006590c] 302f 0014                 move.w     20(a7),d0
[00065910] 6100 d354                 bsr        g_string
[00065914] 544f                      addq.w     #2,a7
A_title_5:
[00065916] 7201                      moveq.l    #1,d1
[00065918] 2079 0010 ee4e            movea.l    ACSblk,a0
[0006591e] 3028 0010                 move.w     16(a0),d0
[00065922] 4eb9 0007 3070            jsr        vswr_mode
[00065928] 7201                      moveq.l    #1,d1
[0006592a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065930] 3028 0010                 move.w     16(a0),d0
[00065934] 4eb9 0007 30c4            jsr        vsl_type
[0006593a] 7201                      moveq.l    #1,d1
[0006593c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065942] 3028 0010                 move.w     16(a0),d0
[00065946] 4eb9 0007 316a            jsr        vsl_width
[0006594c] 7201                      moveq.l    #1,d1
[0006594e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065954] 3028 0010                 move.w     16(a0),d0
[00065958] 4eb9 0007 31c0            jsr        vsl_color
[0006595e] 4242                      clr.w      d2
[00065960] 4241                      clr.w      d1
[00065962] 2079 0010 ee4e            movea.l    ACSblk,a0
[00065968] 3028 0010                 move.w     16(a0),d0
[0006596c] 4eb9 0007 3214            jsr        vsl_ends
[00065972] 206f 0044                 movea.l    68(a7),a0
[00065976] 3f68 000a 0020            move.w     10(a0),32(a7)
[0006597c] 206f 0044                 movea.l    68(a7),a0
[00065980] 3028 000a                 move.w     10(a0),d0
[00065984] 206f 0044                 movea.l    68(a7),a0
[00065988] d068 000e                 add.w      14(a0),d0
[0006598c] 5340                      subq.w     #1,d0
[0006598e] 3f40 0024                 move.w     d0,36(a7)
[00065992] 206f 0044                 movea.l    68(a7),a0
[00065996] 3028 000c                 move.w     12(a0),d0
[0006599a] 206f 0044                 movea.l    68(a7),a0
[0006599e] d068 0010                 add.w      16(a0),d0
[000659a2] 3f40 0026                 move.w     d0,38(a7)
[000659a6] 3f40 0022                 move.w     d0,34(a7)
[000659aa] 41ef 0020                 lea.l      32(a7),a0
[000659ae] 7202                      moveq.l    #2,d1
[000659b0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000659b6] 3029 0010                 move.w     16(a1),d0
[000659ba] 4eb9 0007 22e0            jsr        v_pline
A_title_4:
[000659c0] 41ef 0030                 lea.l      48(a7),a0
[000659c4] 4241                      clr.w      d1
[000659c6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000659cc] 3029 0010                 move.w     16(a1),d0
[000659d0] 4eb9 0007 2230            jsr        vs_clip
[000659d6] 70f7                      moveq.l    #-9,d0
[000659d8] 206f 0044                 movea.l    68(a7),a0
[000659dc] c068 0008                 and.w      8(a0),d0
[000659e0] 4fef 0038                 lea.l      56(a7),a7
[000659e4] 245f                      movea.l    (a7)+,a2
[000659e6] 241f                      move.l     (a7)+,d2
[000659e8] 4e75                      rts

	.data

icn_count:
[000e1bfa]                           dc.w $0000
icn_chk_sel:
[000e1bfc]                           dc.w $0000
[000e1bfe]                           dc.w $0000
icn_chk_un:
[000e1c00]                           dc.w $0000
[000e1c02]                           dc.w $0000
icn_chk_dissel:
[000e1c04]                           dc.w $0000
[000e1c06]                           dc.w $0000
icn_chk_disun:
[000e1c08]                           dc.w $0000
[000e1c0a]                           dc.w $0000
icn_rad_sel:
[000e1c0c]                           dc.w $0000
[000e1c0e]                           dc.w $0000
icn_rad_un:
[000e1c10]                           dc.w $0000
[000e1c12]                           dc.w $0000
icn_rad_dissel:
[000e1c14]                           dc.w $0000
[000e1c16]                           dc.w $0000
icn_rad_disun:
[000e1c18]                           dc.w $0000
[000e1c1a]                           dc.w $0000
icn_mask:
[000e1c1c]                           dc.w $0000
[000e1c1e]                           dc.w $0000
icn_tmp:
[000e1c20]                           dc.w $0000
[000e1c22]                           dc.w $0000
save:
[000e1c24]                           dc.w $2000
save:
[000e1c26]                           dc.w $2000
rad:
[000e1c28]                           dc.w $0000
[000e1c2a]                           dc.w $0000
[000e1c2c]                           dc.w $0010
[000e1c2e]                           dc.w $0010
[000e1c30]                           dc.w $0001
[000e1c32]                           dc.w $0001
[000e1c34]                           dc.w $0001
[000e1c36]                           dc.w $0000
[000e1c38]                           dc.w $0000
[000e1c3a]                           dc.w $0000
col:
[000e1c3c]                           dc.w $0001
[000e1c3e]                           dc.w $0000
col2:
[000e1c40]                           dc.w $0000
[000e1c42]                           dc.w $0001
[000e1c44]                           dc.w $0000
