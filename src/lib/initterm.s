ACSinitialize:
[00042d7c] 4fef fff6                 lea.l      -10(a7),a7
[00042d80] 4eb9 0004 c4be            jsr        INmemory
[00042d86] 5240                      addq.w     #1,d0
[00042d88] 6606                      bne.s      ACSinitialize_1
[00042d8a] 70ff                      moveq.l    #-1,d0
[00042d8c] 6000 0198                 bra        ACSinitialize_2
ACSinitialize_1:
[00042d90] 43ef 0004                 lea.l      4(a7),a1
[00042d94] 41ef 0006                 lea.l      6(a7),a0
[00042d98] 4eb9 0004 2fe8            jsr        InitAES
[00042d9e] 4a40                      tst.w      d0
[00042da0] 6706                      beq.s      ACSinitialize_3
[00042da2] 70ff                      moveq.l    #-1,d0
[00042da4] 6000 0180                 bra        ACSinitialize_2
ACSinitialize_3:
[00042da8] 91c8                      suba.l     a0,a0
[00042daa] 4241                      clr.w      d1
[00042dac] 7004                      moveq.l    #4,d0
[00042dae] 4eb9 0004 3f68            jsr        nkc_init
[00042db4] 43ef 0004                 lea.l      4(a7),a1
[00042db8] 41ef 0006                 lea.l      6(a7),a0
[00042dbc] 4eb9 0004 30f4            jsr        InitVDI
[00042dc2] 4a40                      tst.w      d0
[00042dc4] 6706                      beq.s      ACSinitialize_4
[00042dc6] 70ff                      moveq.l    #-1,d0
[00042dc8] 6000 015c                 bra        ACSinitialize_2
ACSinitialize_4:
[00042dcc] 4eb9 0004 347c            jsr        InitMagiC
[00042dd2] 4a40                      tst.w      d0
[00042dd4] 660a                      bne.s      ACSinitialize_5
[00042dd6] 4eb9 0004 3500            jsr        InitNAES
[00042ddc] 4a40                      tst.w      d0
[00042dde] 6706                      beq.s      ACSinitialize_6
ACSinitialize_5:
[00042de0] 70ff                      moveq.l    #-1,d0
[00042de2] 6000 0142                 bra        ACSinitialize_2
ACSinitialize_6:
[00042de6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042dec] 3179 000e 6df0 0236       move.w     _app,566(a0)
[00042df4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042dfa] 2068 0280                 movea.l    640(a0),a0
[00042dfe] 0c68 0001 0002            cmpi.w     #$0001,2(a0)
[00042e04] 6704                      beq.s      ACSinitialize_7
[00042e06] 7001                      moveq.l    #1,d0
[00042e08] 6002                      bra.s      ACSinitialize_8
ACSinitialize_7:
[00042e0a] 4240                      clr.w      d0
ACSinitialize_8:
[00042e0c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042e12] 3140 0238                 move.w     d0,568(a0)
[00042e16] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042e1c] 317c ffff 03da            move.w     #$FFFF,986(a0)
[00042e22] 4eb9 0004 ee10            jsr        INmouse
[00042e28] 5240                      addq.w     #1,d0
[00042e2a] 6606                      bne.s      ACSinitialize_9
[00042e2c] 70ff                      moveq.l    #-1,d0
[00042e2e] 6000 00f6                 bra        ACSinitialize_2
ACSinitialize_9:
[00042e32] 4eb9 0004 eec0            jsr        Amo_busy
[00042e38] 4eb9 0006 25bc            jsr        INuserobj
[00042e3e] 5240                      addq.w     #1,d0
[00042e40] 6606                      bne.s      ACSinitialize_10
[00042e42] 70ff                      moveq.l    #-1,d0
[00042e44] 6000 00e0                 bra        ACSinitialize_2
ACSinitialize_10:
[00042e48] 4eb9 0004 3b16            jsr        InitScrap
[00042e4e] 4a40                      tst.w      d0
[00042e50] 6706                      beq.s      ACSinitialize_11
[00042e52] 70ff                      moveq.l    #-1,d0
[00042e54] 6000 00d0                 bra        ACSinitialize_2
ACSinitialize_11:
[00042e58] 41f9 000d fca0            lea.l      $000DFCA0,a0
[00042e5e] 4eb9 0005 be00            jsr        Ash_getenv
[00042e64] 2e88                      move.l     a0,(a7)
[00042e66] 6706                      beq.s      ACSinitialize_12
[00042e68] 2057                      movea.l    (a7),a0
[00042e6a] 1010                      move.b     (a0),d0
[00042e6c] 6616                      bne.s      ACSinitialize_13
ACSinitialize_12:
[00042e6e] 41f9 000d fca3            lea.l      $000DFCA3,a0
[00042e74] 4eb9 0005 be00            jsr        Ash_getenv
[00042e7a] 2e88                      move.l     a0,(a7)
[00042e7c] 6718                      beq.s      ACSinitialize_14
[00042e7e] 2057                      movea.l    (a7),a0
[00042e80] 1010                      move.b     (a0),d0
[00042e82] 6712                      beq.s      ACSinitialize_14
ACSinitialize_13:
[00042e84] 2257                      movea.l    (a7),a1
[00042e86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042e8c] 41e8 03e6                 lea.l      998(a0),a0
[00042e90] 4eb9 0008 2f0c            jsr        strcpy
ACSinitialize_14:
[00042e96] 7001                      moveq.l    #1,d0
[00042e98] 4eb9 0008 0dd6            jsr        Pdomain
[00042e9e] 4eb9 0004 3528            jsr        InitPaths
[00042ea4] 4a40                      tst.w      d0
[00042ea6] 6706                      beq.s      ACSinitialize_15
[00042ea8] 70ff                      moveq.l    #-1,d0
[00042eaa] 6000 007a                 bra.w      ACSinitialize_2
ACSinitialize_15:
[00042eae] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042eb4] 2068 02b0                 movea.l    688(a0),a0
[00042eb8] 4e90                      jsr        (a0)
[00042eba] 4a40                      tst.w      d0
[00042ebc] 6704                      beq.s      ACSinitialize_16
[00042ebe] 70ff                      moveq.l    #-1,d0
[00042ec0] 6064                      bra.s      ACSinitialize_2
ACSinitialize_16:
[00042ec2] 4eb9 0004 2f9a            jsr        InitCfg
[00042ec8] 4eb9 0005 d566            jsr        INMsgService
[00042ece] 4a40                      tst.w      d0
[00042ed0] 6704                      beq.s      ACSinitialize_17
[00042ed2] 70ff                      moveq.l    #-1,d0
[00042ed4] 6050                      bra.s      ACSinitialize_2
ACSinitialize_17:
[00042ed6] 4eb9 0004 3984            jsr        InitProtocol
[00042edc] 4a40                      tst.w      d0
[00042ede] 6704                      beq.s      ACSinitialize_18
[00042ee0] 70ff                      moveq.l    #-1,d0
[00042ee2] 6042                      bra.s      ACSinitialize_2
ACSinitialize_18:
[00042ee4] 4eb9 0005 593e            jsr        INwindow
[00042eea] 5240                      addq.w     #1,d0
[00042eec] 6604                      bne.s      ACSinitialize_19
[00042eee] 70ff                      moveq.l    #-1,d0
[00042ef0] 6034                      bra.s      ACSinitialize_2
ACSinitialize_19:
[00042ef2] 4eb9 0005 5e8c            jsr        Awi_root
[00042ef8] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042efe] 2348 0258                 move.l     a0,600(a1)
[00042f02] 2079 000a 8442            movea.l    $000A8442,a0
[00042f08] 4e90                      jsr        (a0)
[00042f0a] 3f40 0008                 move.w     d0,8(a7)
[00042f0e] 4eb9 0004 ee96            jsr        Amo_point
[00042f14] 4eb9 0004 ef0c            jsr        Amo_unbusy
[00042f1a] 4240                      clr.w      d0
[00042f1c] 4eb9 0005 ae7e            jsr        Awi_update
[00042f22] 302f 0008                 move.w     8(a7),d0
ACSinitialize_2:
[00042f26] 4fef 000a                 lea.l      10(a7),a7
[00042f2a] 4e75                      rts

ACSterminate:
[00042f2c] 3039 000d fc54            move.w     aes_open,d0
[00042f32] 6602                      bne.s      ACSterminate_1
[00042f34] 4e75                      rts
ACSterminate_1:

[00042f36] 4eb9 0005 5b7e            jsr        TRwindow
[00042f3c] 4eb9 0006 2ba4            jsr        TRuserobj
[00042f42] 4eb9 0004 ee34            jsr        TRmouse
[00042f48] 4240                      clr.w      d0
[00042f4a] 4eb9 0005 ae7e            jsr        Awi_update
[00042f50] 4eb9 0004 3c72            jsr        TermProtocol
[00042f56] 4eb9 0005 d5b4            jsr        TRMsgService
[00042f5c] 4eb9 0004 456e            jsr        nkc_exit
[00042f62] 4eb9 0004 3d12            jsr        TermVDI
[00042f68] 4eb9 0004 3d5c            jsr        TermAES
[00042f6e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042f74] 2028 04ea                 move.l     1258(a0),d0
[00042f78] 6710                      beq.s      x42f36_1
[00042f7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042f80] 2068 04ea                 movea.l    1258(a0),a0
[00042f84] 4eb9 0004 45d0            jsr        Acfg_delete
x42f36_1:
[00042f8a] 4eb9 0004 c568            jsr        TRmemory
[00042f90] 4e75                      rts

_acs_boot:
[00042f92] 3038 0446                 move.w     ($00000446).w,d0
[00042f96] 48c0                      ext.l      d0
[00042f98] 4e75                      rts

InitCfg:
[00042f9a] 2079 000a 83f8            movea.l    ACSconfig,a0
[00042fa0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00042fa6] 4a40                      tst.w      d0
[00042fa8] 6716                      beq.s      InitCfg_1
[00042faa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042fb0] 41e8 0220                 lea.l      544(a0),a0
[00042fb4] 4eb9 0004 b496            jsr        Af_cfgfile
[00042fba] 23c8 000a 83f8            move.l     a0,ACSconfig
InitCfg_1:
[00042fc0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042fc6] 2028 04ea                 move.l     1258(a0),d0
[00042fca] 6618                      bne.s      InitCfg_2
[00042fcc] 7001                      moveq.l    #1,d0
[00042fce] 41f9 000a 83f8            lea.l      ACSconfig,a0
[00042fd4] 4eb9 0004 4572            jsr        Acfg_create
[00042fda] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042fe0] 2348 04ea                 move.l     a0,1258(a1)
InitCfg_2:
[00042fe4] 4240                      clr.w      d0
[00042fe6] 4e75                      rts

InitAES:
[00042fe8] 514f                      subq.w     #8,a7
[00042fea] 2f48 0004                 move.l     a0,4(a7)
[00042fee] 2e89                      move.l     a1,(a7)
[00042ff0] 3039 000d fc52            move.w     AesInit,d0
[00042ff6] 5279 000d fc52            addq.w     #1,AesInit
[00042ffc] 4a40                      tst.w      d0
[00042ffe] 6706                      beq.s      InitAES_1
[00043000] 4240                      clr.w      d0
[00043002] 6000 00ec                 bra        InitAES_2
InitAES_1:
[00043006] 2079 000e 692a            movea.l    _globl,a0
[0004300c] 4eb9 0007 8a1c            jsr        mt_appl_init
[00043012] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043018] 3080                      move.w     d0,(a0)
[0004301a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043020] 3010                      move.w     (a0),d0
[00043022] 6a06                      bpl.s      InitAES_3
[00043024] 70ff                      moveq.l    #-1,d0
[00043026] 6000 00c8                 bra        InitAES_2
InitAES_3:
[0004302a] 2f39 000e 692a            move.l     _globl,-(a7)
[00043030] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043036] 4868 0006                 pea.l      6(a0)
[0004303a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043040] 4868 0004                 pea.l      4(a0)
[00043044] 226f 000c                 movea.l    12(a7),a1
[00043048] 206f 0010                 movea.l    16(a7),a0
[0004304c] 4eb9 0007 aabe            jsr        mt_graf_handle
[00043052] 4fef 000c                 lea.l      12(a7),a7
[00043056] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004305c] 3140 0002                 move.w     d0,2(a0)
[00043060] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043066] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004306c] 3368 0002 0010            move.w     2(a0),16(a1)
[00043072] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043078] 4868 000e                 pea.l      14(a0)
[0004307c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043082] 4868 000c                 pea.l      12(a0)
[00043086] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004308c] 4868 000a                 pea.l      10(a0)
[00043090] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043096] 4868 0008                 pea.l      8(a0)
[0004309a] 7204                      moveq.l    #4,d1
[0004309c] 4240                      clr.w      d0
[0004309e] 4eb9 0007 f7ba            jsr        wind_get
[000430a4] 4fef 0010                 lea.l      16(a7),a7
[000430a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000430ae] 2068 0280                 movea.l    640(a0),a0
[000430b2] 0c50 0400                 cmpi.w     #$0400,(a0)
[000430b6] 6c16                      bge.s      InitAES_4
[000430b8] 0c79 0300 0010 f55c       cmpi.w     #$0300,_ACSv_magix
[000430c0] 6c0c                      bge.s      InitAES_4
[000430c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000430c8] 2028 0502                 move.l     1282(a0),d0
[000430cc] 6718                      beq.s      InitAES_5
InitAES_4:
[000430ce] 2f39 000e 692a            move.l     _globl,-(a7)
[000430d4] 93c9                      suba.l     a1,a1
[000430d6] 91c8                      suba.l     a0,a0
[000430d8] 4242                      clr.w      d2
[000430da] 7201                      moveq.l    #1,d1
[000430dc] 7009                      moveq.l    #9,d0
[000430de] 4eb9 0007 bcf6            jsr        mt_shel_write
[000430e4] 584f                      addq.w     #4,a7
InitAES_5:
[000430e6] 33fc 0001 000d fc54       move.w     #$0001,aes_open
[000430ee] 4240                      clr.w      d0
InitAES_2:
[000430f0] 504f                      addq.w     #8,a7
[000430f2] 4e75                      rts

InitVDI:
[000430f4] 2f0a                      move.l     a2,-(a7)
[000430f6] 4fef ff82                 lea.l      -126(a7),a7
[000430fa] 2f48 007a                 move.l     a0,122(a7)
[000430fe] 2f49 0076                 move.l     a1,118(a7)
[00043102] 4257                      clr.w      (a7)
[00043104] 3039 000d fc50            move.w     VdiInit,d0
[0004310a] 5279 000d fc50            addq.w     #1,VdiInit
[00043110] 4a40                      tst.w      d0
[00043112] 6706                      beq.s      InitVDI_1
[00043114] 4240                      clr.w      d0
[00043116] 6000 035c                 bra        InitVDI_2
InitVDI_1:
[0004311a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043120] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043126] 3368 0002 0010            move.w     2(a0),16(a1)
[0004312c] 486f 0004                 pea.l      4(a7)
[00043130] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043136] 43e9 0010                 lea.l      16(a1),a1
[0004313a] 41f9 000d fc56            lea.l      work_in,a0
[00043140] 4eb9 0007 1eca            jsr        v_opnvwk
[00043146] 584f                      addq.w     #4,a7
[00043148] 7001                      moveq.l    #1,d0
[0004314a] 4eb9 0005 ae7e            jsr        Awi_update
[00043150] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043156] 316f 0018 0284            move.w     24(a7),644(a0)
[0004315c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043162] 316f 001e 001a            move.w     30(a7),26(a0)
[00043168] 41ef 0004                 lea.l      4(a7),a0
[0004316c] 7201                      moveq.l    #1,d1
[0004316e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043174] 3029 0010                 move.w     16(a1),d0
[00043178] 4eb9 0007 5360            jsr        vq_extnd
[0004317e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043184] 316f 000c 001c            move.w     12(a7),28(a0)
[0004318a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043190] 0c68 0004 001c            cmpi.w     #$0004,28(a0)
[00043196] 6c0c                      bge.s      InitVDI_3
[00043198] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004319e] 317c 0041 02b4            move.w     #$0041,692(a0)
InitVDI_3:
[000431a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000431aa] 2068 0280                 movea.l    640(a0),a0
[000431ae] 0c50 0400                 cmpi.w     #$0400,(a0)
[000431b2] 6d66                      blt.s      InitVDI_4
[000431b4] 2f39 000e 692a            move.l     _globl,-(a7)
[000431ba] 486f 0006                 pea.l      6(a7)
[000431be] 486f 000a                 pea.l      10(a7)
[000431c2] 2279 0010 ee4e            movea.l    ACSblk,a1
[000431c8] 43e9 0290                 lea.l      656(a1),a1
[000431cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000431d2] 41e8 0292                 lea.l      658(a0),a0
[000431d6] 4240                      clr.w      d0
[000431d8] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[000431de] 4fef 000c                 lea.l      12(a7),a7
[000431e2] 4a40                      tst.w      d0
[000431e4] 6734                      beq.s      InitVDI_4
[000431e6] 2f39 000e 692a            move.l     _globl,-(a7)
[000431ec] 486f 0006                 pea.l      6(a7)
[000431f0] 486f 000a                 pea.l      10(a7)
[000431f4] 2279 0010 ee4e            movea.l    ACSblk,a1
[000431fa] 43e9 0294                 lea.l      660(a1),a1
[000431fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043204] 41e8 0296                 lea.l      662(a0),a0
[00043208] 7001                      moveq.l    #1,d0
[0004320a] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[00043210] 4fef 000c                 lea.l      12(a7),a7
[00043214] 4a40                      tst.w      d0
[00043216] 6600 00be                 bne        InitVDI_5
InitVDI_4:
[0004321a] 206f 007a                 movea.l    122(a7),a0
[0004321e] 33d0 000d fc9c            move.w     (a0),$000DFC9C
[00043224] 206f 0076                 movea.l    118(a7),a0
[00043228] 33d0 000d fc9e            move.w     (a0),$000DFC9E
[0004322e] 33fc 0003 000d fc78       move.w     #$0003,$000DFC78
[00043236] 4267                      clr.w      -(a7)
[00043238] 4267                      clr.w      -(a7)
[0004323a] 4267                      clr.w      -(a7)
[0004323c] 2279 000e 692a            movea.l    _globl,a1
[00043242] 4242                      clr.w      d2
[00043244] 7201                      moveq.l    #1,d1
[00043246] 4240                      clr.w      d0
[00043248] 41f9 000d fc88            lea.l      dum_ob,a0
[0004324e] 4eb9 0007 9c0c            jsr        mt_objc_draw
[00043254] 5c4f                      addq.w     #6,a7
[00043256] 41ef 0004                 lea.l      4(a7),a0
[0004325a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043260] 3029 0002                 move.w     2(a1),d0
[00043264] 4eb9 0007 55b0            jsr        vqt_attributes
[0004326a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043270] 316f 0004 0290            move.w     4(a7),656(a0)
[00043276] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004327c] 316f 0012 0292            move.w     18(a7),658(a0)
[00043282] 33fc 0005 000d fc78       move.w     #$0005,$000DFC78
[0004328a] 4267                      clr.w      -(a7)
[0004328c] 4267                      clr.w      -(a7)
[0004328e] 4267                      clr.w      -(a7)
[00043290] 2279 000e 692a            movea.l    _globl,a1
[00043296] 4242                      clr.w      d2
[00043298] 7201                      moveq.l    #1,d1
[0004329a] 4240                      clr.w      d0
[0004329c] 41f9 000d fc88            lea.l      dum_ob,a0
[000432a2] 4eb9 0007 9c0c            jsr        mt_objc_draw
[000432a8] 5c4f                      addq.w     #6,a7
[000432aa] 41ef 0004                 lea.l      4(a7),a0
[000432ae] 2279 0010 ee4e            movea.l    ACSblk,a1
[000432b4] 3029 0002                 move.w     2(a1),d0
[000432b8] 4eb9 0007 55b0            jsr        vqt_attributes
[000432be] 2079 0010 ee4e            movea.l    ACSblk,a0
[000432c4] 316f 0004 0294            move.w     4(a7),660(a0)
[000432ca] 2079 0010 ee4e            movea.l    ACSblk,a0
[000432d0] 316f 0012 0296            move.w     18(a7),662(a0)
InitVDI_5:
[000432d6] 4257                      clr.w      (a7)
[000432d8] 7020                      moveq.l    #32,d0
[000432da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000432e0] 2068 023c                 movea.l    572(a0),a0
[000432e4] c068 000e                 and.w      14(a0),d0
[000432e8] 672a                      beq.s      InitVDI_6
[000432ea] 4eb9 0007 196e            jsr        vq_gdos
[000432f0] 4a40                      tst.w      d0
[000432f2] 6720                      beq.s      InitVDI_6
[000432f4] 4241                      clr.w      d1
[000432f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000432fc] 3028 0010                 move.w     16(a0),d0
[00043300] 4eb9 0007 218a            jsr        vst_load_fonts
[00043306] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004330c] d168 0284                 add.w      d0,644(a0)
[00043310] 3ebc 0001                 move.w     #$0001,(a7)
InitVDI_6:
[00043314] 3017                      move.w     (a7),d0
[00043316] 6656                      bne.s      InitVDI_7
[00043318] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004331e] 3028 0294                 move.w     660(a0),d0
[00043322] 3f00                      move.w     d0,-(a7)
[00043324] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004332a] 3228 0294                 move.w     660(a0),d1
[0004332e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043334] 3028 0010                 move.w     16(a0),d0
[00043338] 4eb9 0007 34e6            jsr        vst_font
[0004333e] 321f                      move.w     (a7)+,d1
[00043340] b240                      cmp.w      d0,d1
[00043342] 672a                      beq.s      InitVDI_7
[00043344] 4eb9 0007 196e            jsr        vq_gdos
[0004334a] 4a40                      tst.w      d0
[0004334c] 6720                      beq.s      InitVDI_7
[0004334e] 4241                      clr.w      d1
[00043350] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043356] 3028 0010                 move.w     16(a0),d0
[0004335a] 4eb9 0007 218a            jsr        vst_load_fonts
[00043360] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043366] d168 0284                 add.w      d0,644(a0)
[0004336a] 3ebc 0001                 move.w     #$0001,(a7)
InitVDI_7:
[0004336e] 3017                      move.w     (a7),d0
[00043370] 6656                      bne.s      InitVDI_8
[00043372] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043378] 3028 0290                 move.w     656(a0),d0
[0004337c] 3f00                      move.w     d0,-(a7)
[0004337e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043384] 3228 0290                 move.w     656(a0),d1
[00043388] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004338e] 3028 0010                 move.w     16(a0),d0
[00043392] 4eb9 0007 34e6            jsr        vst_font
[00043398] 321f                      move.w     (a7)+,d1
[0004339a] b240                      cmp.w      d0,d1
[0004339c] 672a                      beq.s      InitVDI_8
[0004339e] 4eb9 0007 196e            jsr        vq_gdos
[000433a4] 4a40                      tst.w      d0
[000433a6] 6720                      beq.s      InitVDI_8
[000433a8] 4241                      clr.w      d1
[000433aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[000433b0] 3028 0010                 move.w     16(a0),d0
[000433b4] 4eb9 0007 218a            jsr        vst_load_fonts
[000433ba] 2079 0010 ee4e            movea.l    ACSblk,a0
[000433c0] d168 0284                 add.w      d0,644(a0)
[000433c4] 3ebc 0001                 move.w     #$0001,(a7)
InitVDI_8:
[000433c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000433ce] 3228 0290                 move.w     656(a0),d1
[000433d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000433d8] 3028 0010                 move.w     16(a0),d0
[000433dc] 4eb9 0007 34e6            jsr        vst_font
[000433e2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000433e8] 4868 0014                 pea.l      20(a0)
[000433ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[000433f2] 4868 0012                 pea.l      18(a0)
[000433f6] 2279 0010 ee4e            movea.l    ACSblk,a1
[000433fc] 43e9 0018                 lea.l      24(a1),a1
[00043400] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043406] 41e8 0016                 lea.l      22(a0),a0
[0004340a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00043410] 322a 0292                 move.w     658(a2),d1
[00043414] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004341a] 302a 0010                 move.w     16(a2),d0
[0004341e] 4eb9 0007 3370            jsr        vst_height
[00043424] 504f                      addq.w     #8,a7
[00043426] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004342c] 2068 023c                 movea.l    572(a0),a0
[00043430] 3028 000a                 move.w     10(a0),d0
[00043434] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004343a] c1e8 0012                 muls.w     18(a0),d0
[0004343e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043444] 2068 023c                 movea.l    572(a0),a0
[00043448] 3140 000a                 move.w     d0,10(a0)
[0004344c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043452] 2068 023c                 movea.l    572(a0),a0
[00043456] 3028 000c                 move.w     12(a0),d0
[0004345a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043460] c1e8 0014                 muls.w     20(a0),d0
[00043464] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004346a] 2068 023c                 movea.l    572(a0),a0
[0004346e] 3140 000c                 move.w     d0,12(a0)
[00043472] 4240                      clr.w      d0
InitVDI_2:
[00043474] 4fef 007e                 lea.l      126(a7),a7
[00043478] 245f                      movea.l    (a7)+,a2
[0004347a] 4e75                      rts

InitMagiC:
[0004347c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043482] 41e8 04fe                 lea.l      1278(a0),a0
[00043486] 203c 4d61 6758            move.l     #$4D616758,d0
[0004348c] 4eb9 0008 0ec4            jsr        Ash_getc
[00043492] 4a40                      tst.w      d0
[00043494] 6718                      beq.s      InitMagiC_1
[00043496] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004349c] 2068 04fe                 movea.l    1278(a0),a0
[000434a0] 2068 0008                 movea.l    8(a0),a0
[000434a4] 33e8 0030 0010 f55c       move.w     48(a0),_ACSv_magix
[000434ac] 6012                      bra.s      InitMagiC_2
InitMagiC_1:
[000434ae] 33fc ffff 0010 f55c       move.w     #$FFFF,_ACSv_magix
[000434b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000434bc] 42a8 04fe                 clr.l      1278(a0)
InitMagiC_2:
[000434c0] 0c79 0300 0010 f55c       cmpi.w     #$0300,_ACSv_magix
[000434c8] 6d12                      blt.s      InitMagiC_3
[000434ca] 2079 0010 ee4e            movea.l    ACSblk,a0
[000434d0] 2068 023c                 movea.l    572(a0),a0
[000434d4] 0068 0800 000e            ori.w      #$0800,14(a0)
[000434da] 6010                      bra.s      InitMagiC_4
InitMagiC_3:
[000434dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000434e2] 2068 023c                 movea.l    572(a0),a0
[000434e6] 0268 f7ff 000e            andi.w     #$F7FF,14(a0)
InitMagiC_4:
[000434ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[000434f2] 2068 023c                 movea.l    572(a0),a0
[000434f6] 0068 0040 000e            ori.w      #$0040,14(a0)
[000434fc] 4240                      clr.w      d0
[000434fe] 4e75                      rts

InitNAES:
[00043500] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043506] 41e8 0502                 lea.l      1282(a0),a0
[0004350a] 203c 6e41 4553            move.l     #$6E414553,d0
[00043510] 4eb9 0008 0ec4            jsr        Ash_getc
[00043516] 4a40                      tst.w      d0
[00043518] 660a                      bne.s      InitNAES_1
[0004351a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043520] 42a8 0502                 clr.l      1282(a0)
InitNAES_1:
[00043524] 4240                      clr.w      d0
[00043526] 4e75                      rts

InitPaths:
[00043528] 2f0a                      move.l     a2,-(a7)
[0004352a] 514f                      subq.w     #8,a7
[0004352c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043532] 3028 0236                 move.w     566(a0),d0
[00043536] 6700 01c2                 beq        InitPaths_1
[0004353a] 2f39 000e 692a            move.l     _globl,-(a7)
[00043540] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043546] 43e9 011e                 lea.l      286(a1),a1
[0004354a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043550] 41e8 001e                 lea.l      30(a0),a0
[00043554] 4eb9 0007 bc96            jsr        mt_shel_read
[0004355a] 584f                      addq.w     #4,a7
[0004355c] 4a40                      tst.w      d0
[0004355e] 6606                      bne.s      InitPaths_2
[00043560] 70ff                      moveq.l    #-1,d0
[00043562] 6000 041a                 bra        InitPaths_3
InitPaths_2:
[00043566] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004356c] 1028 011e                 move.b     286(a0),d0
[00043570] 6734                      beq.s      InitPaths_4
[00043572] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043578] 1028 011e                 move.b     286(a0),d0
[0004357c] 4880                      ext.w      d0
[0004357e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043584] d0c0                      adda.w     d0,a0
[00043586] 4228 011f                 clr.b      287(a0)
[0004358a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043590] 43e9 011f                 lea.l      287(a1),a1
[00043594] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004359a] 41e8 011e                 lea.l      286(a0),a0
[0004359e] 4eb9 0008 2f0c            jsr        strcpy
[000435a4] 603e                      bra.s      InitPaths_5
InitPaths_4:
[000435a6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000435ac] 0c68 0001 0286            cmpi.w     #$0001,646(a0)
[000435b2] 6f30                      ble.s      InitPaths_5
[000435b4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000435ba] 2068 0288                 movea.l    648(a0),a0
[000435be] 2068 0004                 movea.l    4(a0),a0
[000435c2] 1010                      move.b     (a0),d0
[000435c4] 671e                      beq.s      InitPaths_5
[000435c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000435cc] 2068 0288                 movea.l    648(a0),a0
[000435d0] 2268 0004                 movea.l    4(a0),a1
[000435d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000435da] 41e8 011e                 lea.l      286(a0),a0
[000435de] 4eb9 0008 2f0c            jsr        strcpy
InitPaths_5:
[000435e4] 702f                      moveq.l    #47,d0
[000435e6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000435ec] 41e8 011e                 lea.l      286(a0),a0
[000435f0] 4eb9 0008 2e9e            jsr        strrchr
[000435f6] 2e88                      move.l     a0,(a7)
[000435f8] 2017                      move.l     (a7),d0
[000435fa] 671a                      beq.s      InitPaths_6
[000435fc] 2257                      movea.l    (a7),a1
[000435fe] 5249                      addq.w     #1,a1
[00043600] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043606] 41e8 019e                 lea.l      414(a0),a0
[0004360a] 4eb9 0008 2f0c            jsr        strcpy
[00043610] 2057                      movea.l    (a7),a0
[00043612] 4210                      clr.b      (a0)
[00043614] 600a                      bra.s      InitPaths_7
InitPaths_6:
[00043616] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004361c] 4228 019e                 clr.b      414(a0)
InitPaths_7:
[00043620] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043626] 43e9 001e                 lea.l      30(a1),a1
[0004362a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043630] 41e8 009e                 lea.l      158(a0),a0
[00043634] 4eb9 0008 2f0c            jsr        strcpy
[0004363a] 705c                      moveq.l    #92,d0
[0004363c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043642] 41e8 009e                 lea.l      158(a0),a0
[00043646] 4eb9 0008 2e9e            jsr        strrchr
[0004364c] 2e88                      move.l     a0,(a7)
[0004364e] 2017                      move.l     (a7),d0
[00043650] 6672                      bne.s      InitPaths_8
[00043652] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043658] 1028 009e                 move.b     158(a0),d0
[0004365c] 6734                      beq.s      InitPaths_9
[0004365e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043664] 0c28 003a 009f            cmpi.b     #$3A,159(a0)
[0004366a] 6626                      bne.s      InitPaths_9
[0004366c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043672] 43e9 00a0                 lea.l      160(a1),a1
[00043676] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004367c] 41e8 0220                 lea.l      544(a0),a0
[00043680] 4eb9 0008 2f0c            jsr        strcpy
[00043686] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004368c] 4228 00a0                 clr.b      160(a0)
[00043690] 6030                      bra.s      InitPaths_10
InitPaths_9:
[00043692] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043698] 43e9 009e                 lea.l      158(a1),a1
[0004369c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000436a2] 41e8 0220                 lea.l      544(a0),a0
[000436a6] 4eb9 0008 2f0c            jsr        strcpy
[000436ac] 43f9 000d fcab            lea.l      $000DFCAB,a1
[000436b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000436b8] 41e8 009e                 lea.l      158(a0),a0
[000436bc] 4eb9 0008 2f0c            jsr        strcpy
InitPaths_10:
[000436c2] 6018                      bra.s      InitPaths_11
InitPaths_8:
[000436c4] 5297                      addq.l     #1,(a7)
[000436c6] 2257                      movea.l    (a7),a1
[000436c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000436ce] 41e8 0220                 lea.l      544(a0),a0
[000436d2] 4eb9 0008 2f0c            jsr        strcpy
[000436d8] 2057                      movea.l    (a7),a0
[000436da] 4210                      clr.b      (a0)
InitPaths_11:
[000436dc] 702e                      moveq.l    #46,d0
[000436de] 2079 0010 ee4e            movea.l    ACSblk,a0
[000436e4] 41e8 021e                 lea.l      542(a0),a0
[000436e8] 4eb9 0008 2e9e            jsr        strrchr
[000436ee] 2e88                      move.l     a0,(a7)
[000436f0] 2017                      move.l     (a7),d0
[000436f2] 6704                      beq.s      InitPaths_12
[000436f4] 2057                      movea.l    (a7),a0
[000436f6] 4210                      clr.b      (a0)
InitPaths_12:
[000436f8] 6034                      bra.s      InitPaths_13
InitPaths_1:
[000436fa] 4200                      clr.b      d0
[000436fc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043702] 1140 021e                 move.b     d0,542(a0)
[00043706] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004370c] 1140 019e                 move.b     d0,414(a0)
[00043710] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043716] 1140 001e                 move.b     d0,30(a0)
[0004371a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043720] 1140 009e                 move.b     d0,158(a0)
[00043724] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004372a] 1140 011e                 move.b     d0,286(a0)
InitPaths_13:
[0004372e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043734] 2068 023c                 movea.l    572(a0),a0
[00043738] 1028 0010                 move.b     16(a0),d0
[0004373c] 661a                      bne.s      InitPaths_14
[0004373e] 43f9 000d fcad            lea.l      $000DFCAD,a1
[00043744] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004374a] 2068 023c                 movea.l    572(a0),a0
[0004374e] 41e8 0010                 lea.l      16(a0),a0
[00043752] 4eb9 0008 2f0c            jsr        strcpy
InitPaths_14:
[00043758] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004375e] 2068 0280                 movea.l    640(a0),a0
[00043762] 0c50 0400                 cmpi.w     #$0400,(a0)
[00043766] 6c18                      bge.s      InitPaths_15
[00043768] 0c79 0300 0010 f55c       cmpi.w     #$0300,_ACSv_magix
[00043770] 6c0e                      bge.s      InitPaths_15
[00043772] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043778] 3028 0236                 move.w     566(a0),d0
[0004377c] 6600 00d4                 bne        InitPaths_16
InitPaths_15:
[00043780] 2279 000e 692a            movea.l    _globl,a1
[00043786] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004378c] 2068 023c                 movea.l    572(a0),a0
[00043790] 41e8 0010                 lea.l      16(a0),a0
[00043794] 2479 0010 ee4e            movea.l    ACSblk,a2
[0004379a] 3012                      move.w     (a2),d0
[0004379c] 4eb9 0007 9854            jsr        mt_menu_register
[000437a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000437a8] 3140 03da                 move.w     d0,986(a0)
[000437ac] 2f39 000e 692a            move.l     _globl,-(a7)
[000437b2] 486f 0008                 pea.l      8(a7)
[000437b6] 486f 000e                 pea.l      14(a7)
[000437ba] 43ef 0012                 lea.l      18(a7),a1
[000437be] 41ef 0012                 lea.l      18(a7),a0
[000437c2] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[000437c8] 4fef 000c                 lea.l      12(a7),a7
[000437cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000437d2] 3028 0236                 move.w     566(a0),d0
[000437d6] 6600 007a                 bne.w      InitPaths_16
[000437da] 302f 0004                 move.w     4(a7),d0
[000437de] 6772                      beq.s      InitPaths_16
[000437e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000437e6] 2068 023c                 movea.l    572(a0),a0
[000437ea] 41e8 0010                 lea.l      16(a0),a0
[000437ee] 4eb9 0008 2f6c            jsr        strlen
[000437f4] 720f                      moveq.l    #15,d1
[000437f6] b280                      cmp.l      d0,d1
[000437f8] 6404                      bcc.s      InitPaths_17
[000437fa] 700f                      moveq.l    #15,d0
[000437fc] 6014                      bra.s      InitPaths_18
InitPaths_17:
[000437fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043804] 2068 023c                 movea.l    572(a0),a0
[00043808] 41e8 0010                 lea.l      16(a0),a0
[0004380c] 4eb9 0008 2f6c            jsr        strlen
InitPaths_18:
[00043812] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043818] 2268 023c                 movea.l    572(a0),a1
[0004381c] 43e9 0010                 lea.l      16(a1),a1
[00043820] 41f9 000d 6612            lea.l      $000D6612,a0
[00043826] 4eb9 0008 2fd6            jsr        strncpy
[0004382c] 2279 000e 692a            movea.l    _globl,a1
[00043832] 41f9 000d 65f4            lea.l      _A_ERR_ACC,a0
[00043838] 7001                      moveq.l    #1,d0
[0004383a] 4eb9 0007 a146            jsr        mt_form_alert
[00043840] 3f40 0006                 move.w     d0,6(a7)
[00043844] 0c6f 0001 0006            cmpi.w     #$0001,6(a7)
[0004384a] 6706                      beq.s      InitPaths_16
[0004384c] 70ff                      moveq.l    #-1,d0
[0004384e] 6000 012e                 bra        InitPaths_3
InitPaths_16:
[00043852] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043858] 4228 02d6                 clr.b      726(a0)
[0004385c] 41f9 000d fcb7            lea.l      $000DFCB7,a0
[00043862] 4eb9 0005 be00            jsr        Ash_getenv
[00043868] 2e88                      move.l     a0,(a7)
[0004386a] 6622                      bne.s      InitPaths_19
[0004386c] 41f9 000d fcbc            lea.l      $000DFCBC,a0
[00043872] 4eb9 0005 be00            jsr        Ash_getenv
[00043878] 2e88                      move.l     a0,(a7)
[0004387a] 6612                      bne.s      InitPaths_19
[0004387c] 41f9 000d fcc3            lea.l      $000DFCC3,a0
[00043882] 4eb9 0005 be00            jsr        Ash_getenv
[00043888] 2e88                      move.l     a0,(a7)
[0004388a] 6700 0088                 beq        InitPaths_20
InitPaths_19:
[0004388e] 2257                      movea.l    (a7),a1
[00043890] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043896] 41e8 02d6                 lea.l      726(a0),a0
[0004389a] 4eb9 0008 2f0c            jsr        strcpy
[000438a0] 705c                      moveq.l    #92,d0
[000438a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000438a8] 41e8 02d6                 lea.l      726(a0),a0
[000438ac] 4eb9 0008 2e9e            jsr        strrchr
[000438b2] 2e88                      move.l     a0,(a7)
[000438b4] 2017                      move.l     (a7),d0
[000438b6] 670c                      beq.s      InitPaths_21
[000438b8] 2057                      movea.l    (a7),a0
[000438ba] 1028 0001                 move.b     1(a0),d0
[000438be] 6604                      bne.s      InitPaths_21
[000438c0] 2057                      movea.l    (a7),a0
[000438c2] 4210                      clr.b      (a0)
InitPaths_21:
[000438c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000438ca] 1028 02d6                 move.b     726(a0),d0
[000438ce] 4880                      ext.w      d0
[000438d0] 4eb9 0008 3824            jsr        toupper
[000438d6] b07c 0043                 cmp.w      #$0043,d0
[000438da] 6d16                      blt.s      InitPaths_22
[000438dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000438e2] 41e8 02d6                 lea.l      726(a0),a0
[000438e6] 4eb9 0004 b8fa            jsr        Af_length
[000438ec] 72ff                      moveq.l    #-1,d1
[000438ee] b280                      cmp.l      d0,d1
[000438f0] 670c                      beq.s      InitPaths_23
InitPaths_22:
[000438f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000438f8] 4228 02d6                 clr.b      726(a0)
[000438fc] 6016                      bra.s      InitPaths_20
InitPaths_23:
[000438fe] 43f9 000d fcc7            lea.l      $000DFCC7,a1
[00043904] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004390a] 41e8 02d6                 lea.l      726(a0),a0
[0004390e] 4eb9 0008 2e42            jsr        strcat
InitPaths_20:
[00043914] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004391a] 1028 02d6                 move.b     726(a0),d0
[0004391e] 661a                      bne.s      InitPaths_24
[00043920] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043926] 43e9 009e                 lea.l      158(a1),a1
[0004392a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043930] 41e8 02d6                 lea.l      726(a0),a0
[00043934] 4eb9 0008 2f0c            jsr        strcpy
InitPaths_24:
[0004393a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043940] 1028 02d6                 move.b     726(a0),d0
[00043944] 6636                      bne.s      InitPaths_25
[00043946] 43f9 000d fcc9            lea.l      $000DFCC9,a1
[0004394c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043952] 41e8 02d6                 lea.l      726(a0),a0
[00043956] 4eb9 0008 2f0c            jsr        strcpy
[0004395c] 4eb9 0008 0bd2            jsr        Dgetdrv
[00043962] 4eb9 0008 0c48            jsr        Dsetdrv
[00043968] c0bc 0000 0004            and.l      #$00000004,d0
[0004396e] 670c                      beq.s      InitPaths_25
[00043970] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043976] 117c 0043 02d6            move.b     #$43,726(a0)
InitPaths_25:
[0004397c] 4240                      clr.w      d0
InitPaths_3:
[0004397e] 504f                      addq.w     #8,a7
[00043980] 245f                      movea.l    (a7)+,a2
[00043982] 4e75                      rts

InitProtocol:
[00043984] 594f                      subq.w     #4,a7
[00043986] 3039 000d fc4e            move.w     ProtInit,d0
[0004398c] 5279 000d fc4e            addq.w     #1,ProtInit
[00043992] 4a40                      tst.w      d0
[00043994] 6706                      beq.s      InitProtocol_1
[00043996] 4240                      clr.w      d0
[00043998] 6000 0178                 bra        InitProtocol_2
InitProtocol_1:
[0004399c] 4eb9 0007 0c0a            jsr        Alu_create
[000439a2] 23c8 000d fbaa            move.l     a0,ListOfApps
[000439a8] 2039 000d fbaa            move.l     ListOfApps,d0
[000439ae] 6606                      bne.s      InitProtocol_3
[000439b0] 4240                      clr.w      d0
[000439b2] 6000 015e                 bra        InitProtocol_2
InitProtocol_3:
[000439b6] 2079 000d fbaa            movea.l    ListOfApps,a0
[000439bc] 217c 0005 dc02 0004       move.l     #Aev_DDRemove,4(a0)
[000439c4] 4eb9 0007 0c0a            jsr        Alu_create
[000439ca] 23c8 000d fba6            move.l     a0,SentMsg
[000439d0] 2039 000d fba6            move.l     SentMsg,d0
[000439d6] 6612                      bne.s      InitProtocol_4
[000439d8] 2079 000d fbaa            movea.l    ListOfApps,a0
[000439de] 4eb9 0007 0c5e            jsr        Alu_delete
[000439e4] 4240                      clr.w      d0
[000439e6] 6000 012a                 bra        InitProtocol_2
InitProtocol_4:
[000439ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[000439f0] 41e8 0220                 lea.l      544(a0),a0
[000439f4] 2e88                      move.l     a0,(a7)
[000439f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000439fc] 3028 0236                 move.w     566(a0),d0
[00043a00] 6706                      beq.s      InitProtocol_5
[00043a02] 2057                      movea.l    (a7),a0
[00043a04] 1010                      move.b     (a0),d0
[00043a06] 6610                      bne.s      InitProtocol_6
InitProtocol_5:
[00043a08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043a0e] 2068 023c                 movea.l    572(a0),a0
[00043a12] 41e8 0012                 lea.l      18(a0),a0
[00043a16] 2e88                      move.l     a0,(a7)
InitProtocol_6:
[00043a18] 700a                      moveq.l    #10,d0
[00043a1a] 4eb9 0004 c95e            jsr        Ax_glmalloc
[00043a20] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043a26] 2348 03dc                 move.l     a0,988(a1)
[00043a2a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043a30] 2028 03dc                 move.l     988(a0),d0
[00043a34] 6748                      beq.s      InitProtocol_7
[00043a36] 43f9 000d fccd            lea.l      $000DFCCD,a1
[00043a3c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043a42] 2068 03dc                 movea.l    988(a0),a0
[00043a46] 4eb9 0008 2f0c            jsr        strcpy
[00043a4c] 2057                      movea.l    (a7),a0
[00043a4e] 4eb9 0008 2f6c            jsr        strlen
[00043a54] 7208                      moveq.l    #8,d1
[00043a56] b280                      cmp.l      d0,d1
[00043a58] 630a                      bls.s      InitProtocol_8
[00043a5a] 2057                      movea.l    (a7),a0
[00043a5c] 4eb9 0008 2f6c            jsr        strlen
[00043a62] 6002                      bra.s      InitProtocol_9
InitProtocol_8:
[00043a64] 7008                      moveq.l    #8,d0
InitProtocol_9:
[00043a66] 2257                      movea.l    (a7),a1
[00043a68] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043a6e] 2068 03dc                 movea.l    988(a0),a0
[00043a72] 4eb9 0008 2fd6            jsr        strncpy
[00043a78] 4eb9 0004 64da            jsr        Ast_toupper
InitProtocol_7:
[00043a7e] 7033                      moveq.l    #51,d0
[00043a80] 4eb9 0004 c95e            jsr        Ax_glmalloc
[00043a86] 2279 0010 ee4e            movea.l    ACSblk,a1
[00043a8c] 2348 04e6                 move.l     a0,1254(a1)
[00043a90] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043a96] 2028 04e6                 move.l     1254(a0),d0
[00043a9a] 671a                      beq.s      InitProtocol_10
[00043a9c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043aa2] 2268 03dc                 movea.l    988(a0),a1
[00043aa6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043aac] 2068 04e6                 movea.l    1254(a0),a0
[00043ab0] 4eb9 0008 2f0c            jsr        strcpy
InitProtocol_10:
[00043ab6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043abc] 2028 04e6                 move.l     1254(a0),d0
[00043ac0] 670c                      beq.s      InitProtocol_11
[00043ac2] 4eb9 0005 ec38            jsr        Aev_InitXAcc
[00043ac8] 4eb9 0006 086c            jsr        Aev_InitGEMScript
InitProtocol_11:
[00043ace] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043ad4] 2028 03dc                 move.l     988(a0),d0
[00043ad8] 6736                      beq.s      InitProtocol_12
[00043ada] 4eb9 0005 f804            jsr        Aev_InitVA
[00043ae0] 4eb9 0005 fe5c            jsr        Aev_InitDD
[00043ae6] 4eb9 0006 05be            jsr        Aev_InitBubble
[00043aec] 4eb9 0006 170c            jsr        Aev_InitOlga
[00043af2] 4eb9 0006 217e            jsr        Aev_InitSTGuide
[00043af8] 4eb9 0006 2340            jsr        Aev_InitSE
[00043afe] 4eb9 0006 2350            jsr        Aev_InitPCHelp
[00043b04] 4eb9 0006 2348            jsr        Aev_InitSSP
[00043b0a] 4eb9 0006 0262            jsr        Aev_InitDHST
InitProtocol_12:
[00043b10] 4240                      clr.w      d0
InitProtocol_2:
[00043b12] 584f                      addq.w     #4,a7
[00043b14] 4e75                      rts

InitScrap:
[00043b16] 4fef fff4                 lea.l      -12(a7),a7
[00043b1a] 2279 000e 692a            movea.l    _globl,a1
[00043b20] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043b26] 41e8 0356                 lea.l      854(a0),a0
[00043b2a] 4eb9 0007 ad6e            jsr        mt_scrp_read
[00043b30] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043b36] 1028 0356                 move.b     854(a0),d0
[00043b3a] 6672                      bne.s      InitScrap_1
[00043b3c] 41f9 000d fcd7            lea.l      $000DFCD7,a0
[00043b42] 4eb9 0005 be00            jsr        Ash_getenv
[00043b48] 2e88                      move.l     a0,(a7)
[00043b4a] 6620                      bne.s      InitScrap_2
[00043b4c] 41f9 000d fce1            lea.l      $000DFCE1,a0
[00043b52] 4eb9 0005 be00            jsr        Ash_getenv
[00043b58] 2e88                      move.l     a0,(a7)
[00043b5a] 6610                      bne.s      InitScrap_2
[00043b5c] 41f9 000d fce9            lea.l      $000DFCE9,a0
[00043b62] 4eb9 0005 be00            jsr        Ash_getenv
[00043b68] 2e88                      move.l     a0,(a7)
[00043b6a] 6714                      beq.s      InitScrap_3
InitScrap_2:
[00043b6c] 2257                      movea.l    (a7),a1
[00043b6e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043b74] 41e8 0356                 lea.l      854(a0),a0
[00043b78] 4eb9 0008 2f0c            jsr        strcpy
[00043b7e] 602e                      bra.s      InitScrap_1
InitScrap_3:
[00043b80] 43f9 000d fcf2            lea.l      $000DFCF2,a1
[00043b86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043b8c] 41e8 0356                 lea.l      854(a0),a0
[00043b90] 4eb9 0008 2f0c            jsr        strcpy
[00043b96] 41fa f3fa                 lea.l      _acs_boot(pc),a0
[00043b9a] 4eb9 0008 0b76            jsr        Supexec
[00043ba0] d03c 0041                 add.b      #$41,d0
[00043ba4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043baa] 1140 0356                 move.b     d0,854(a0)
InitScrap_1:
[00043bae] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043bb4] 1028 0356                 move.b     854(a0),d0
[00043bb8] 4880                      ext.w      d0
[00043bba] 4eb9 0008 3824            jsr        toupper
[00043bc0] b07c 0043                 cmp.w      #$0043,d0
[00043bc4] 6d00 0092                 blt        InitScrap_4
[00043bc8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043bce] 41e8 0356                 lea.l      854(a0),a0
[00043bd2] 4eb9 0008 2f6c            jsr        strlen
[00043bd8] 2f40 0004                 move.l     d0,4(a7)
[00043bdc] 6f00 007a                 ble.w      InitScrap_4
[00043be0] 53af 0004                 subq.l     #1,4(a7)
[00043be4] 202f 0004                 move.l     4(a7),d0
[00043be8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043bee] d1c0                      adda.l     d0,a0
[00043bf0] 0c28 005c 0356            cmpi.b     #$5C,854(a0)
[00043bf6] 6610                      bne.s      InitScrap_5
[00043bf8] 202f 0004                 move.l     4(a7),d0
[00043bfc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043c02] d1c0                      adda.l     d0,a0
[00043c04] 4228 0356                 clr.b      854(a0)
InitScrap_5:
[00043c08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043c0e] 41e8 0356                 lea.l      854(a0),a0
[00043c12] 4eb9 0008 0bc2            jsr        Dcreate
[00043c18] 2f40 0008                 move.l     d0,8(a7)
[00043c1c] 43f9 000d fcfd            lea.l      $000DFCFD,a1
[00043c22] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043c28] 41e8 0356                 lea.l      854(a0),a0
[00043c2c] 4eb9 0008 2e42            jsr        strcat
[00043c32] 202f 0008                 move.l     8(a7),d0
[00043c36] 6a08                      bpl.s      InitScrap_6
[00043c38] 70dc                      moveq.l    #-36,d0
[00043c3a] b0af 0008                 cmp.l      8(a7),d0
[00043c3e] 6616                      bne.s      InitScrap_7
InitScrap_6:
[00043c40] 2279 000e 692a            movea.l    _globl,a1
[00043c46] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043c4c] 41e8 0356                 lea.l      854(a0),a0
[00043c50] 4eb9 0007 adc8            jsr        mt_scrp_write
InitScrap_7:
[00043c56] 6012                      bra.s      InitScrap_8
InitScrap_4:
[00043c58] 2279 000e 692a            movea.l    _globl,a1
[00043c5e] 41f9 000d fcff            lea.l      $000DFCFF,a0
[00043c64] 4eb9 0007 adc8            jsr        mt_scrp_write
InitScrap_8:
[00043c6a] 4240                      clr.w      d0
[00043c6c] 4fef 000c                 lea.l      12(a7),a7
[00043c70] 4e75                      rts

TermProtocol:
[00043c72] 5379 000d fc4e            subq.w     #1,ProtInit
[00043c78] 6704                      beq.s      TermProtocol_1
[00043c7a] 6000 0094                 bra        TermProtocol_2
TermProtocol_1:
[00043c7e] 2079 000d fbaa            movea.l    ListOfApps,a0
[00043c84] 4eb9 0007 0c5e            jsr        Alu_delete
[00043c8a] 2079 000d fba6            movea.l    SentMsg,a0
[00043c90] 4eb9 0007 0c5e            jsr        Alu_delete
[00043c96] 4eb9 0006 0266            jsr        Aev_ExitDHST
[00043c9c] 4eb9 0006 234c            jsr        Aev_ExitSSP
[00043ca2] 4eb9 0006 2354            jsr        Aev_ExitPCHelp
[00043ca8] 4eb9 0006 2344            jsr        Aev_ExitSE
[00043cae] 4eb9 0006 2182            jsr        Aev_ExitSTGuide
[00043cb4] 4eb9 0006 177e            jsr        Aev_ExitOlga
[00043cba] 4eb9 0006 08de            jsr        Aev_ExitGEMScript
[00043cc0] 4eb9 0006 05e4            jsr        Aev_ExitBubble
[00043cc6] 4eb9 0005 fe60            jsr        Aev_ExitDD
[00043ccc] 4eb9 0005 f8d8            jsr        Aev_ExitVA
[00043cd2] 4eb9 0005 ecca            jsr        Aev_ExitXAcc
[00043cd8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043cde] 2028 04e6                 move.l     1254(a0),d0
[00043ce2] 6710                      beq.s      TermProtocol_3
[00043ce4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043cea] 2068 04e6                 movea.l    1254(a0),a0
[00043cee] 4eb9 0004 c9da            jsr        Ax_glfree
TermProtocol_3:
[00043cf4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043cfa] 2028 03dc                 move.l     988(a0),d0
[00043cfe] 6710                      beq.s      TermProtocol_2
[00043d00] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043d06] 2068 03dc                 movea.l    988(a0),a0
[00043d0a] 4eb9 0004 c9da            jsr        Ax_glfree
TermProtocol_2:
[00043d10] 4e75                      rts

TermVDI:
[00043d12] 5379 000d fc50            subq.w     #1,VdiInit
[00043d18] 6702                      beq.s      TermVDI_1
[00043d1a] 4e75                      rts
TermVDI_1:

[00043d1c] 7020                      moveq.l    #32,d0
[00043d1e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043d24] 2068 023c                 movea.l    572(a0),a0
[00043d28] c068 000e                 and.w      14(a0),d0
[00043d2c] 671c                      beq.s      x43d1c_1
[00043d2e] 4eb9 0007 196e            jsr        vq_gdos
[00043d34] 4a40                      tst.w      d0
[00043d36] 6712                      beq.s      x43d1c_1
[00043d38] 4241                      clr.w      d1
[00043d3a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043d40] 3028 0010                 move.w     16(a0),d0
[00043d44] 4eb9 0007 21de            jsr        vst_unload_fonts
x43d1c_1:
[00043d4a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043d50] 3028 0010                 move.w     16(a0),d0
[00043d54] 4eb9 0007 1f1e            jsr        v_clsvwk
[00043d5a] 4e75                      rts

TermAES:
[00043d5c] 4fef ffde                 lea.l      -34(a7),a7
[00043d60] 5379 000d fc52            subq.w     #1,AesInit
[00043d66] 6704                      beq.s      TermAES_1
[00043d68] 6000 007e                 bra.w      TermAES_2
TermAES_1:
[00043d6c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043d72] 3028 0236                 move.w     566(a0),d0
[00043d76] 670e                      beq.s      TermAES_3
[00043d78] 2079 000e 692a            movea.l    _globl,a0
[00043d7e] 4eb9 0007 8d52            jsr        mt_appl_exit
[00043d84] 6062                      bra.s      TermAES_2
TermAES_3:
[00043d86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00043d8c] 2068 023c                 movea.l    572(a0),a0
[00043d90] 117c 0005 0010            move.b     #$05,16(a0)
[00043d96] 604e                      bra.s      TermAES_4
[00043d98] 2f39 000e 692a            move.l     _globl,-(a7)
TermAES_5:
[00043d9e] 486f 0024                 pea.l      36(a7)
[00043da2] 486f 0028                 pea.l      40(a7)
[00043da6] 486f 002c                 pea.l      44(a7)
[00043daa] 486f 0030                 pea.l      48(a7)
[00043dae] 486f 0034                 pea.l      52(a7)
[00043db2] 2f3c 7fff 7fff            move.l     #$7FFF7FFF,-(a7)
[00043db8] 4267                      clr.w      -(a7)
[00043dba] 4267                      clr.w      -(a7)
[00043dbc] 4267                      clr.w      -(a7)
[00043dbe] 4267                      clr.w      -(a7)
[00043dc0] 4267                      clr.w      -(a7)
[00043dc2] 4267                      clr.w      -(a7)
[00043dc4] 4267                      clr.w      -(a7)
[00043dc6] 4267                      clr.w      -(a7)
[00043dc8] 4267                      clr.w      -(a7)
[00043dca] 4267                      clr.w      -(a7)
[00043dcc] 4267                      clr.w      -(a7)
[00043dce] 43ef 0052                 lea.l      82(a7),a1
[00043dd2] 41ef 0032                 lea.l      50(a7),a0
[00043dd6] 4242                      clr.w      d2
[00043dd8] 4241                      clr.w      d1
[00043dda] 7030                      moveq.l    #48,d0
[00043ddc] 4eb9 0007 9240            jsr        mt_evnt_multi
[00043de2] 4fef 0032                 lea.l      50(a7),a7
TermAES_4:
[00043de6] 60b0                      bra.s      TermAES_5
TermAES_2:
[00043de8] 4fef 0022                 lea.l      34(a7),a7
[00043dec] 4e75                      rts

	.data

ProtInit:
[000dfc4e]                           dc.w $0000
VdiInit:
[000dfc50]                           dc.w $0000
AesInit:
[000dfc52]                           dc.w $0000
aes_open:
[000dfc54]                           dc.w $0000
work_in:
[000dfc56]                           dc.w $0001
[000dfc58]                           dc.w $0001
[000dfc5a]                           dc.w $0001
[000dfc5c]                           dc.w $0001
[000dfc5e]                           dc.w $0001
[000dfc60]                           dc.w $0001
[000dfc62]                           dc.w $0001
[000dfc64]                           dc.w $0001
[000dfc66]                           dc.w $0001
[000dfc68]                           dc.w $0001
[000dfc6a]                           dc.w $0002
dum_ted:
[000dfc6c] 000dfca7                  dc.l $000dfca7
[000dfc70] 000dfca9                  dc.l $000dfca9
[000dfc74] 000dfcaa                  dc.l $000dfcaa
[000dfc78]                           dc.w $0003
[000dfc7a]                           dc.w $0000
[000dfc7c]                           dc.w $0000
[000dfc7e]                           dc.w $0000
[000dfc80]                           dc.w $0000
[000dfc82]                           dc.w $0000
[000dfc84]                           dc.w $0002
[000dfc86]                           dc.w $0001
dum_ob:
[000dfc88]                           dc.w $0000
[000dfc8a]                           dc.w $ffff
[000dfc8c]                           dc.w $ffff
[000dfc8e]                           dc.w $0015
[000dfc90]                           dc.w $0020
[000dfc92]                           dc.w $0000
[000dfc94] 000dfc6c                  dc.l dum_ted
[000dfc98]                           dc.w $0000
[000dfc9a]                           dc.w $0000
[000dfc9c]                           dc.w $0000
[000dfc9e]                           dc.w $0000
[000dfca0]                           dc.w $4653
[000dfca2]                           dc.w $0049
[000dfca4]                           dc.w $4653
[000dfca6]                           dc.w $0020
[000dfca8]                           dc.w $0000
[000dfcaa]                           dc.w $005c
[000dfcac]                           dc.w $0020
[000dfcae]                           dc.b ' ACS-Acc',0
[000dfcb7]                           dc.b 'HOME',0
[000dfcbc]                           dc.b 'TMPDIR',0
[000dfcc3]                           dc.b 'TMP',0
[000dfcc7]                           dc.b $5c
[000dfcc8]                           dc.w $0041
[000dfcca]                           dc.w $3a5c
[000dfccc]                           dc.w $0020
[000dfcce]                           dc.b '       ',0
[000dfcd6]                           dc.w $0043
[000dfcd8]                           dc.b 'LIPBOARD',0
[000dfce1]                           dc.b 'CLIPBRD',0
[000dfce9]                           dc.b 'SCRAPDIR',0
[000dfcf2]                           dc.b 'X:\clipbrd',0
[000dfcfd]                           dc.b $5c
[000dfcfe]                           dc.w $0000
