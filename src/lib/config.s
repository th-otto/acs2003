Acfg_create:
[00044572] 4fef fff6                 lea.l      -10(a7),a7
[00044576] 2f48 0006                 move.l     a0,6(a7)
[0004457a] 3f40 0004                 move.w     d0,4(a7)
[0004457e] 7022                      moveq.l    #34,d0
[00044580] 4eb9 0004 c608            jsr        Ax_malloc
[00044586] 2e88                      move.l     a0,(a7)
[00044588] 2017                      move.l     (a7),d0
[0004458a] 6604                      bne.s      $00044590
[0004458c] 91c8                      suba.l     a0,a0
[0004458e] 603a                      bra.s      $000445CA
[00044590] 7222                      moveq.l    #34,d1
[00044592] 4240                      clr.w      d0
[00044594] 2057                      movea.l    (a7),a0
[00044596] 4eb9 0008 36ea            jsr        memset
[0004459c] 226f 0006                 movea.l    6(a7),a1
[000445a0] 2057                      movea.l    (a7),a0
[000445a2] 4eb9 0004 4658            jsr        InitConfigStruct
[000445a8] 206f 0006                 movea.l    6(a7),a0
[000445ac] 2050                      movea.l    (a0),a0
[000445ae] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000445b4] 4a40                      tst.w      d0
[000445b6] 6610                      bne.s      $000445C8
[000445b8] 302f 0004                 move.w     4(a7),d0
[000445bc] 670a                      beq.s      $000445C8
[000445be] 93c9                      suba.l     a1,a1
[000445c0] 2057                      movea.l    (a7),a0
[000445c2] 4eb9 0004 4e4a            jsr        Acfg_load
[000445c8] 2057                      movea.l    (a7),a0
[000445ca] 4fef 000a                 lea.l      10(a7),a7
[000445ce] 4e75                      rts
Acfg_delete:
[000445d0] 514f                      subq.w     #8,a7
[000445d2] 2f48 0004                 move.l     a0,4(a7)
[000445d6] 2eaf 0004                 move.l     4(a7),(a7)
[000445da] 2017                      move.l     (a7),d0
[000445dc] 6732                      beq.s      $00044610
[000445de] 7001                      moveq.l    #1,d0
[000445e0] 2057                      movea.l    (a7),a0
[000445e2] c068 001a                 and.w      26(a0),d0
[000445e6] 6714                      beq.s      $000445FC
[000445e8] 2057                      movea.l    (a7),a0
[000445ea] 3028 0012                 move.w     18(a0),d0
[000445ee] 670c                      beq.s      $000445FC
[000445f0] 93c9                      suba.l     a1,a1
[000445f2] 206f 0004                 movea.l    4(a7),a0
[000445f6] 4eb9 0004 5238            jsr        Acfg_save
[000445fc] 93c9                      suba.l     a1,a1
[000445fe] 2057                      movea.l    (a7),a0
[00044600] 4eb9 0004 4866            jsr        Acfg_clear
[00044606] 7022                      moveq.l    #34,d0
[00044608] 2057                      movea.l    (a7),a0
[0004460a] 4eb9 0004 cc28            jsr        Ax_recycle
[00044610] 504f                      addq.w     #8,a7
[00044612] 4e75                      rts
Acfg_flags:
[00044614] 4fef fff4                 lea.l      -12(a7),a7
[00044618] 2f48 0008                 move.l     a0,8(a7)
[0004461c] 3f40 0006                 move.w     d0,6(a7)
[00044620] 3f41 0004                 move.w     d1,4(a7)
[00044624] 2eaf 0008                 move.l     8(a7),(a7)
[00044628] 302f 0004                 move.w     4(a7),d0
[0004462c] 6f0c                      ble.s      $0004463A
[0004462e] 302f 0006                 move.w     6(a7),d0
[00044632] 2057                      movea.l    (a7),a0
[00044634] 8168 001a                 or.w       d0,26(a0)
[00044638] 6012                      bra.s      $0004464C
[0004463a] 302f 0004                 move.w     4(a7),d0
[0004463e] 660c                      bne.s      $0004464C
[00044640] 302f 0006                 move.w     6(a7),d0
[00044644] 4640                      not.w      d0
[00044646] 2057                      movea.l    (a7),a0
[00044648] c168 001a                 and.w      d0,26(a0)
[0004464c] 2057                      movea.l    (a7),a0
[0004464e] 3028 001a                 move.w     26(a0),d0
[00044652] 4fef 000c                 lea.l      12(a7),a7
[00044656] 4e75                      rts
InitConfigStruct:
[00044658] 514f                      subq.w     #8,a7
[0004465a] 2f48 0004                 move.l     a0,4(a7)
[0004465e] 2e89                      move.l     a1,(a7)
[00044660] 2257                      movea.l    (a7),a1
[00044662] 206f 0004                 movea.l    4(a7),a0
[00044666] 4eb9 0004 47a6            jsr        Acfg_copyInfo
[0004466c] 206f 0004                 movea.l    4(a7),a0
[00044670] 4268 0014                 clr.w      20(a0)
[00044674] 206f 0004                 movea.l    4(a7),a0
[00044678] 42a8 0016                 clr.l      22(a0)
[0004467c] 206f 0004                 movea.l    4(a7),a0
[00044680] 4268 001c                 clr.w      28(a0)
[00044684] 206f 0004                 movea.l    4(a7),a0
[00044688] 42a8 001e                 clr.l      30(a0)
[0004468c] 504f                      addq.w     #8,a7
[0004468e] 4e75                      rts
Acfg_createInfo:
[00044690] 594f                      subq.w     #4,a7
[00044692] 7012                      moveq.l    #18,d0
[00044694] 4eb9 0004 c608            jsr        Ax_malloc
[0004469a] 2e88                      move.l     a0,(a7)
[0004469c] 2017                      move.l     (a7),d0
[0004469e] 6604                      bne.s      $000446A4
[000446a0] 91c8                      suba.l     a0,a0
[000446a2] 601c                      bra.s      $000446C0
[000446a4] 7212                      moveq.l    #18,d1
[000446a6] 4240                      clr.w      d0
[000446a8] 2057                      movea.l    (a7),a0
[000446aa] 4eb9 0008 36ea            jsr        memset
[000446b0] 43f9 000e 0588            lea.l      $000E0588,a1
[000446b6] 2057                      movea.l    (a7),a0
[000446b8] 4eb9 0004 46e4            jsr        Acfg_initInfo
[000446be] 2057                      movea.l    (a7),a0
[000446c0] 584f                      addq.w     #4,a7
[000446c2] 4e75                      rts
Acfg_deleteInfo:
[000446c4] 594f                      subq.w     #4,a7
[000446c6] 2e88                      move.l     a0,(a7)
[000446c8] 43f9 000e 058b            lea.l      $000E058B,a1
[000446ce] 2057                      movea.l    (a7),a0
[000446d0] 4eb9 0004 46e4            jsr        Acfg_initInfo
[000446d6] 7012                      moveq.l    #18,d0
[000446d8] 2057                      movea.l    (a7),a0
[000446da] 4eb9 0004 cc28            jsr        Ax_recycle
[000446e0] 584f                      addq.w     #4,a7
[000446e2] 4e75                      rts
Acfg_initInfo:
[000446e4] 514f                      subq.w     #8,a7
[000446e6] 2f48 0004                 move.l     a0,4(a7)
[000446ea] 2e89                      move.l     a1,(a7)
[000446ec] 206f 0004                 movea.l    4(a7),a0
[000446f0] 2010                      move.l     (a0),d0
[000446f2] 6716                      beq.s      $0004470A
[000446f4] 206f 0004                 movea.l    4(a7),a0
[000446f8] 2050                      movea.l    (a0),a0
[000446fa] 1010                      move.b     (a0),d0
[000446fc] 670c                      beq.s      $0004470A
[000446fe] 206f 0004                 movea.l    4(a7),a0
[00044702] 2050                      movea.l    (a0),a0
[00044704] 4eb9 0004 649c            jsr        Ast_delete
[0004470a] 41f9 000e 058c            lea.l      $000E058C,a0
[00044710] 4eb9 0004 643c            jsr        Ast_create
[00044716] 226f 0004                 movea.l    4(a7),a1
[0004471a] 2288                      move.l     a0,(a1)
[0004471c] 206f 0004                 movea.l    4(a7),a0
[00044720] 2028 0004                 move.l     4(a0),d0
[00044724] 671a                      beq.s      $00044740
[00044726] 206f 0004                 movea.l    4(a7),a0
[0004472a] 2068 0004                 movea.l    4(a0),a0
[0004472e] 1010                      move.b     (a0),d0
[00044730] 670e                      beq.s      $00044740
[00044732] 206f 0004                 movea.l    4(a7),a0
[00044736] 2068 0004                 movea.l    4(a0),a0
[0004473a] 4eb9 0004 649c            jsr        Ast_delete
[00044740] 2057                      movea.l    (a7),a0
[00044742] 4eb9 0004 643c            jsr        Ast_create
[00044748] 226f 0004                 movea.l    4(a7),a1
[0004474c] 2348 0004                 move.l     a0,4(a1)
[00044750] 206f 0004                 movea.l    4(a7),a0
[00044754] 2028 0008                 move.l     8(a0),d0
[00044758] 671a                      beq.s      $00044774
[0004475a] 206f 0004                 movea.l    4(a7),a0
[0004475e] 2068 0008                 movea.l    8(a0),a0
[00044762] 1010                      move.b     (a0),d0
[00044764] 670e                      beq.s      $00044774
[00044766] 206f 0004                 movea.l    4(a7),a0
[0004476a] 2068 0008                 movea.l    8(a0),a0
[0004476e] 4eb9 0004 649c            jsr        Ast_delete
[00044774] 41f9 000e 058d            lea.l      $000E058D,a0
[0004477a] 4eb9 0004 643c            jsr        Ast_create
[00044780] 226f 0004                 movea.l    4(a7),a1
[00044784] 2348 0008                 move.l     a0,8(a1)
[00044788] 206f 0004                 movea.l    4(a7),a0
[0004478c] 4268 000c                 clr.w      12(a0)
[00044790] 206f 0004                 movea.l    4(a7),a0
[00044794] 4268 000e                 clr.w      14(a0)
[00044798] 206f 0004                 movea.l    4(a7),a0
[0004479c] 317c 0020 0010            move.w     #$0020,16(a0)
[000447a2] 504f                      addq.w     #8,a7
[000447a4] 4e75                      rts
Acfg_copyInfo:
[000447a6] 514f                      subq.w     #8,a7
[000447a8] 2f48 0004                 move.l     a0,4(a7)
[000447ac] 2e89                      move.l     a1,(a7)
[000447ae] 2017                      move.l     (a7),d0
[000447b0] 6606                      bne.s      $000447B8
[000447b2] 2ebc 000e 0572            move.l     #default_info,(a7)
[000447b8] 2057                      movea.l    (a7),a0
[000447ba] 2268 0004                 movea.l    4(a0),a1
[000447be] 206f 0004                 movea.l    4(a7),a0
[000447c2] 6100 ff20                 bsr        Acfg_initInfo
[000447c6] 2057                      movea.l    (a7),a0
[000447c8] 2050                      movea.l    (a0),a0
[000447ca] 4eb9 0004 643c            jsr        Ast_create
[000447d0] 226f 0004                 movea.l    4(a7),a1
[000447d4] 2288                      move.l     a0,(a1)
[000447d6] 2057                      movea.l    (a7),a0
[000447d8] 2028 0008                 move.l     8(a0),d0
[000447dc] 670e                      beq.s      $000447EC
[000447de] 2057                      movea.l    (a7),a0
[000447e0] 2068 0008                 movea.l    8(a0),a0
[000447e4] 4eb9 0004 643c            jsr        Ast_create
[000447ea] 6002                      bra.s      $000447EE
[000447ec] 91c8                      suba.l     a0,a0
[000447ee] 226f 0004                 movea.l    4(a7),a1
[000447f2] 2348 0008                 move.l     a0,8(a1)
[000447f6] 2057                      movea.l    (a7),a0
[000447f8] 226f 0004                 movea.l    4(a7),a1
[000447fc] 3368 000c 000c            move.w     12(a0),12(a1)
[00044802] 2057                      movea.l    (a7),a0
[00044804] 226f 0004                 movea.l    4(a7),a1
[00044808] 3368 000e 000e            move.w     14(a0),14(a1)
[0004480e] 2057                      movea.l    (a7),a0
[00044810] 226f 0004                 movea.l    4(a7),a1
[00044814] 3368 0010 0010            move.w     16(a0),16(a1)
[0004481a] 206f 0004                 movea.l    4(a7),a0
[0004481e] 504f                      addq.w     #8,a7
[00044820] 4e75                      rts
Acfg_setInfo:
[00044822] 4fef fff4                 lea.l      -12(a7),a7
[00044826] 2f48 0008                 move.l     a0,8(a7)
[0004482a] 2f49 0004                 move.l     a1,4(a7)
[0004482e] 2eaf 0008                 move.l     8(a7),(a7)
[00044832] 226f 0004                 movea.l    4(a7),a1
[00044836] 2057                      movea.l    (a7),a0
[00044838] 6100 ff6c                 bsr        Acfg_copyInfo
[0004483c] 206f 0004                 movea.l    4(a7),a0
[00044840] 4fef 000c                 lea.l      12(a7),a7
[00044844] 4e75                      rts
Acfg_getInfo:
[00044846] 4fef fff4                 lea.l      -12(a7),a7
[0004484a] 2f48 0008                 move.l     a0,8(a7)
[0004484e] 2f49 0004                 move.l     a1,4(a7)
[00044852] 2eaf 0008                 move.l     8(a7),(a7)
[00044856] 2257                      movea.l    (a7),a1
[00044858] 206f 0004                 movea.l    4(a7),a0
[0004485c] 6100 ff48                 bsr        Acfg_copyInfo
[00044860] 4fef 000c                 lea.l      12(a7),a7
[00044864] 4e75                      rts
Acfg_clear:
[00044866] 4fef fff4                 lea.l      -12(a7),a7
[0004486a] 2f48 0008                 move.l     a0,8(a7)
[0004486e] 2f49 0004                 move.l     a1,4(a7)
[00044872] 2eaf 0008                 move.l     8(a7),(a7)
[00044876] 226f 0004                 movea.l    4(a7),a1
[0004487a] 2057                      movea.l    (a7),a0
[0004487c] 6100 ff28                 bsr        Acfg_copyInfo
[00044880] 2057                      movea.l    (a7),a0
[00044882] 4eb9 0004 4896            jsr        Acfg_clearAllGroups
[00044888] 2057                      movea.l    (a7),a0
[0004488a] 4eb9 0004 5d16            jsr        Acfg_clearHeader
[00044890] 4fef 000c                 lea.l      12(a7),a7
[00044894] 4e75                      rts
Acfg_clearAllGroups:
[00044896] 4fef fff0                 lea.l      -16(a7),a7
[0004489a] 2f48 000c                 move.l     a0,12(a7)
[0004489e] 2f6f 000c 0004            move.l     12(a7),4(a7)
[000448a4] 202f 0004                 move.l     4(a7),d0
[000448a8] 6700 0122                 beq        $000449CC
[000448ac] 206f 0004                 movea.l    4(a7),a0
[000448b0] 3028 0014                 move.w     20(a0),d0
[000448b4] 6f00 0116                 ble        $000449CC
[000448b8] 206f 0004                 movea.l    4(a7),a0
[000448bc] 2028 0016                 move.l     22(a0),d0
[000448c0] 6700 010a                 beq        $000449CC
[000448c4] 426f 000a                 clr.w      10(a7)
[000448c8] 6000 00ca                 bra        $00044994
[000448cc] 302f 000a                 move.w     10(a7),d0
[000448d0] 48c0                      ext.l      d0
[000448d2] e588                      lsl.l      #2,d0
[000448d4] 206f 0004                 movea.l    4(a7),a0
[000448d8] 2068 0016                 movea.l    22(a0),a0
[000448dc] 2eb0 0800                 move.l     0(a0,d0.l),(a7)
[000448e0] 2017                      move.l     (a7),d0
[000448e2] 6700 00ac                 beq        $00044990
[000448e6] 2057                      movea.l    (a7),a0
[000448e8] 3028 0004                 move.w     4(a0),d0
[000448ec] 6f00 007a                 ble.w      $00044968
[000448f0] 2057                      movea.l    (a7),a0
[000448f2] 2028 0006                 move.l     6(a0),d0
[000448f6] 6770                      beq.s      $00044968
[000448f8] 426f 0008                 clr.w      8(a7)
[000448fc] 6046                      bra.s      $00044944
[000448fe] 302f 0008                 move.w     8(a7),d0
[00044902] 48c0                      ext.l      d0
[00044904] e588                      lsl.l      #2,d0
[00044906] 2057                      movea.l    (a7),a0
[00044908] 2068 0006                 movea.l    6(a0),a0
[0004490c] 2030 0800                 move.l     0(a0,d0.l),d0
[00044910] 672e                      beq.s      $00044940
[00044912] 302f 0008                 move.w     8(a7),d0
[00044916] 48c0                      ext.l      d0
[00044918] e588                      lsl.l      #2,d0
[0004491a] 2057                      movea.l    (a7),a0
[0004491c] 2068 0006                 movea.l    6(a0),a0
[00044920] 2070 0800                 movea.l    0(a0,d0.l),a0
[00044924] 1010                      move.b     (a0),d0
[00044926] 6718                      beq.s      $00044940
[00044928] 302f 0008                 move.w     8(a7),d0
[0004492c] 48c0                      ext.l      d0
[0004492e] e588                      lsl.l      #2,d0
[00044930] 2057                      movea.l    (a7),a0
[00044932] 2068 0006                 movea.l    6(a0),a0
[00044936] 2070 0800                 movea.l    0(a0,d0.l),a0
[0004493a] 4eb9 0004 649c            jsr        Ast_delete
[00044940] 526f 0008                 addq.w     #1,8(a7)
[00044944] 2057                      movea.l    (a7),a0
[00044946] 302f 0008                 move.w     8(a7),d0
[0004494a] b068 0004                 cmp.w      4(a0),d0
[0004494e] 6dae                      blt.s      $000448FE
[00044950] 2057                      movea.l    (a7),a0
[00044952] 2068 0006                 movea.l    6(a0),a0
[00044956] 4eb9 0004 c7c8            jsr        Ax_free
[0004495c] 2057                      movea.l    (a7),a0
[0004495e] 42a8 0006                 clr.l      6(a0)
[00044962] 2057                      movea.l    (a7),a0
[00044964] 4268 0004                 clr.w      4(a0)
[00044968] 2057                      movea.l    (a7),a0
[0004496a] 2050                      movea.l    (a0),a0
[0004496c] 4eb9 0004 649c            jsr        Ast_delete
[00044972] 700a                      moveq.l    #10,d0
[00044974] 2057                      movea.l    (a7),a0
[00044976] 4eb9 0004 cc28            jsr        Ax_recycle
[0004497c] 302f 000a                 move.w     10(a7),d0
[00044980] 48c0                      ext.l      d0
[00044982] e588                      lsl.l      #2,d0
[00044984] 206f 0004                 movea.l    4(a7),a0
[00044988] 2068 0016                 movea.l    22(a0),a0
[0004498c] 42b0 0800                 clr.l      0(a0,d0.l)
[00044990] 526f 000a                 addq.w     #1,10(a7)
[00044994] 206f 0004                 movea.l    4(a7),a0
[00044998] 302f 000a                 move.w     10(a7),d0
[0004499c] b068 0014                 cmp.w      20(a0),d0
[000449a0] 6d00 ff2a                 blt        $000448CC
[000449a4] 206f 0004                 movea.l    4(a7),a0
[000449a8] 2068 0016                 movea.l    22(a0),a0
[000449ac] 4eb9 0004 c7c8            jsr        Ax_free
[000449b2] 206f 0004                 movea.l    4(a7),a0
[000449b6] 42a8 0016                 clr.l      22(a0)
[000449ba] 206f 0004                 movea.l    4(a7),a0
[000449be] 4268 0014                 clr.w      20(a0)
[000449c2] 206f 0004                 movea.l    4(a7),a0
[000449c6] 317c 0001 0012            move.w     #$0001,18(a0)
[000449cc] 4fef 0010                 lea.l      16(a7),a7
[000449d0] 4e75                      rts
Acfg_clearGroup:
[000449d2] 4fef ffd6                 lea.l      -42(a7),a7
[000449d6] 2f48 0026                 move.l     a0,38(a7)
[000449da] 2f49 0022                 move.l     a1,34(a7)
[000449de] 2f6f 0026 001e            move.l     38(a7),30(a7)
[000449e4] 42a7                      clr.l      -(a7)
[000449e6] 226f 0026                 movea.l    38(a7),a1
[000449ea] 41ef 0004                 lea.l      4(a7),a0
[000449ee] 4eb9 0004 5ebc            jsr        InitCfgSearch
[000449f4] 584f                      addq.w     #4,a7
[000449f6] 43d7                      lea.l      (a7),a1
[000449f8] 206f 001e                 movea.l    30(a7),a0
[000449fc] 4eb9 0004 6050            jsr        SearchGruppe
[00044a02] 2f48 001a                 move.l     a0,26(a7)
[00044a06] 202f 001a                 move.l     26(a7),d0
[00044a0a] 6700 0124                 beq        $00044B30
[00044a0e] 426f 0014                 clr.w      20(a7)
[00044a12] 601e                      bra.s      $00044A32
[00044a14] 302f 0014                 move.w     20(a7),d0
[00044a18] 48c0                      ext.l      d0
[00044a1a] e588                      lsl.l      #2,d0
[00044a1c] 206f 001a                 movea.l    26(a7),a0
[00044a20] 2068 0006                 movea.l    6(a0),a0
[00044a24] 2070 0800                 movea.l    0(a0,d0.l),a0
[00044a28] 4eb9 0004 649c            jsr        Ast_delete
[00044a2e] 526f 0014                 addq.w     #1,20(a7)
[00044a32] 206f 001a                 movea.l    26(a7),a0
[00044a36] 302f 0014                 move.w     20(a7),d0
[00044a3a] b068 0004                 cmp.w      4(a0),d0
[00044a3e] 6dd4                      blt.s      $00044A14
[00044a40] 206f 001a                 movea.l    26(a7),a0
[00044a44] 2068 0006                 movea.l    6(a0),a0
[00044a48] 4eb9 0004 c7c8            jsr        Ax_free
[00044a4e] 206f 001a                 movea.l    26(a7),a0
[00044a52] 2050                      movea.l    (a0),a0
[00044a54] 4eb9 0004 649c            jsr        Ast_delete
[00044a5a] 206f 001e                 movea.l    30(a7),a0
[00044a5e] 0c68 0001 0014            cmpi.w     #$0001,20(a0)
[00044a64] 6f00 00a0                 ble        $00044B06
[00044a68] 70ff                      moveq.l    #-1,d0
[00044a6a] 206f 001e                 movea.l    30(a7),a0
[00044a6e] d068 0014                 add.w      20(a0),d0
[00044a72] 48c0                      ext.l      d0
[00044a74] e588                      lsl.l      #2,d0
[00044a76] 4eb9 0004 c608            jsr        Ax_malloc
[00044a7c] 2f48 0016                 move.l     a0,22(a7)
[00044a80] 4240                      clr.w      d0
[00044a82] 3f40 0014                 move.w     d0,20(a7)
[00044a86] 3f40 0012                 move.w     d0,18(a7)
[00044a8a] 604a                      bra.s      $00044AD6
[00044a8c] 302f 0014                 move.w     20(a7),d0
[00044a90] 48c0                      ext.l      d0
[00044a92] e588                      lsl.l      #2,d0
[00044a94] 206f 001e                 movea.l    30(a7),a0
[00044a98] 2068 0016                 movea.l    22(a0),a0
[00044a9c] 2070 0800                 movea.l    0(a0,d0.l),a0
[00044aa0] b1ef 001a                 cmpa.l     26(a7),a0
[00044aa4] 6606                      bne.s      $00044AAC
[00044aa6] 526f 0014                 addq.w     #1,20(a7)
[00044aaa] 6022                      bra.s      $00044ACE
[00044aac] 302f 0014                 move.w     20(a7),d0
[00044ab0] 48c0                      ext.l      d0
[00044ab2] e588                      lsl.l      #2,d0
[00044ab4] 206f 001e                 movea.l    30(a7),a0
[00044ab8] 2068 0016                 movea.l    22(a0),a0
[00044abc] 322f 0012                 move.w     18(a7),d1
[00044ac0] 48c1                      ext.l      d1
[00044ac2] e589                      lsl.l      #2,d1
[00044ac4] 226f 0016                 movea.l    22(a7),a1
[00044ac8] 23b0 0800 1800            move.l     0(a0,d0.l),0(a1,d1.l)
[00044ace] 526f 0014                 addq.w     #1,20(a7)
[00044ad2] 526f 0012                 addq.w     #1,18(a7)
[00044ad6] 206f 001e                 movea.l    30(a7),a0
[00044ada] 302f 0014                 move.w     20(a7),d0
[00044ade] b068 0014                 cmp.w      20(a0),d0
[00044ae2] 6da8                      blt.s      $00044A8C
[00044ae4] 206f 001e                 movea.l    30(a7),a0
[00044ae8] 2068 0016                 movea.l    22(a0),a0
[00044aec] 4eb9 0004 c7c8            jsr        Ax_free
[00044af2] 206f 001e                 movea.l    30(a7),a0
[00044af6] 216f 0016 0016            move.l     22(a7),22(a0)
[00044afc] 206f 001e                 movea.l    30(a7),a0
[00044b00] 5368 0014                 subq.w     #1,20(a0)
[00044b04] 601e                      bra.s      $00044B24
[00044b06] 206f 001e                 movea.l    30(a7),a0
[00044b0a] 2068 0016                 movea.l    22(a0),a0
[00044b0e] 4eb9 0004 c7c8            jsr        Ax_free
[00044b14] 206f 001e                 movea.l    30(a7),a0
[00044b18] 42a8 0016                 clr.l      22(a0)
[00044b1c] 206f 001e                 movea.l    30(a7),a0
[00044b20] 4268 0014                 clr.w      20(a0)
[00044b24] 700a                      moveq.l    #10,d0
[00044b26] 206f 001a                 movea.l    26(a7),a0
[00044b2a] 4eb9 0004 cc28            jsr        Ax_recycle
[00044b30] 4fef 002a                 lea.l      42(a7),a7
[00044b34] 4e75                      rts
Acfg_makeName:
[00044b36] 4fef fff2                 lea.l      -14(a7),a7
[00044b3a] 2f48 000a                 move.l     a0,10(a7)
[00044b3e] 2f49 0006                 move.l     a1,6(a7)
[00044b42] 206f 0006                 movea.l    6(a7),a0
[00044b46] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00044b4c] 4a40                      tst.w      d0
[00044b4e] 6706                      beq.s      $00044B56
[00044b50] 4240                      clr.w      d0
[00044b52] 6000 0108                 bra        $00044C5C
[00044b56] 226f 0006                 movea.l    6(a7),a1
[00044b5a] 206f 0016                 movea.l    22(a7),a0
[00044b5e] 4eb9 0004 b66e            jsr        Af_2name
[00044b64] 4eb9 0004 663c            jsr        Ast_alltrim
[00044b6a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00044b70] 4a40                      tst.w      d0
[00044b72] 6706                      beq.s      $00044B7A
[00044b74] 4240                      clr.w      d0
[00044b76] 6000 00e4                 bra        $00044C5C
[00044b7a] 226f 0006                 movea.l    6(a7),a1
[00044b7e] 41ef 0002                 lea.l      2(a7),a0
[00044b82] 4eb9 0004 b758            jsr        Af_2ext
[00044b88] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00044b8e] 4a40                      tst.w      d0
[00044b90] 6710                      beq.s      $00044BA2
[00044b92] 43f9 000e 058e            lea.l      $000E058E,a1
[00044b98] 41ef 0002                 lea.l      2(a7),a0
[00044b9c] 4eb9 0008 2f0c            jsr        strcpy
[00044ba2] 206f 0006                 movea.l    6(a7),a0
[00044ba6] 4eb9 0004 b548            jsr        Af_2drv
[00044bac] 3e80                      move.w     d0,(a7)
[00044bae] 226f 0006                 movea.l    6(a7),a1
[00044bb2] 206f 0012                 movea.l    18(a7),a0
[00044bb6] 4eb9 0004 b586            jsr        Af_2path
[00044bbc] 43f9 000e 0592            lea.l      $000E0592,a1
[00044bc2] 206f 0012                 movea.l    18(a7),a0
[00044bc6] 4eb9 0004 665a            jsr        Ast_cmp
[00044bcc] 4a40                      tst.w      d0
[00044bce] 664e                      bne.s      $00044C1E
[00044bd0] 705c                      moveq.l    #92,d0
[00044bd2] 206f 0006                 movea.l    6(a7),a0
[00044bd6] 4eb9 0008 2e9e            jsr        strrchr
[00044bdc] 2008                      move.l     a0,d0
[00044bde] 663e                      bne.s      $00044C1E
[00044be0] 703a                      moveq.l    #58,d0
[00044be2] 206f 0006                 movea.l    6(a7),a0
[00044be6] 4eb9 0008 2e9e            jsr        strrchr
[00044bec] 2008                      move.l     a0,d0
[00044bee] 6628                      bne.s      $00044C18
[00044bf0] 2279 0010 ee4e            movea.l    ACSblk,a1
[00044bf6] 43e9 02d6                 lea.l      726(a1),a1
[00044bfa] 206f 0012                 movea.l    18(a7),a0
[00044bfe] 4eb9 0004 b586            jsr        Af_2path
[00044c04] 2079 0010 ee4e            movea.l    ACSblk,a0
[00044c0a] 41e8 02d6                 lea.l      726(a0),a0
[00044c0e] 4eb9 0004 b548            jsr        Af_2drv
[00044c14] 3e80                      move.w     d0,(a7)
[00044c16] 6006                      bra.s      $00044C1E
[00044c18] 206f 0012                 movea.l    18(a7),a0
[00044c1c] 4210                      clr.b      (a0)
[00044c1e] 203c 0000 2000            move.l     #$00002000,d0
[00044c24] 4eb9 0004 c608            jsr        Ax_malloc
[00044c2a] 226f 000a                 movea.l    10(a7),a1
[00044c2e] 2288                      move.l     a0,(a1)
[00044c30] 206f 000a                 movea.l    10(a7),a0
[00044c34] 2010                      move.l     (a0),d0
[00044c36] 6604                      bne.s      $00044C3C
[00044c38] 4240                      clr.w      d0
[00044c3a] 6020                      bra.s      $00044C5C
[00044c3c] 486f 0002                 pea.l      2(a7)
[00044c40] 2f2f 001a                 move.l     26(a7),-(a7)
[00044c44] 226f 001a                 movea.l    26(a7),a1
[00044c48] 302f 0008                 move.w     8(a7),d0
[00044c4c] 206f 0012                 movea.l    18(a7),a0
[00044c50] 2050                      movea.l    (a0),a0
[00044c52] 4eb9 0004 b7bc            jsr        Af_buildname
[00044c58] 504f                      addq.w     #8,a7
[00044c5a] 7001                      moveq.l    #1,d0
[00044c5c] 4fef 000e                 lea.l      14(a7),a7
[00044c60] 4e75                      rts
IsNewGroup:
[00044c62] 514f                      subq.w     #8,a7
[00044c64] 2f48 0004                 move.l     a0,4(a7)
[00044c68] 206f 0004                 movea.l    4(a7),a0
[00044c6c] 4eb9 0008 2f6c            jsr        strlen
[00044c72] 2e80                      move.l     d0,(a7)
[00044c74] 7002                      moveq.l    #2,d0
[00044c76] b097                      cmp.l      (a7),d0
[00044c78] 6c1c                      bge.s      $00044C96
[00044c7a] 206f 0004                 movea.l    4(a7),a0
[00044c7e] 0c10 005b                 cmpi.b     #$5B,(a0)
[00044c82] 6612                      bne.s      $00044C96
[00044c84] 2017                      move.l     (a7),d0
[00044c86] 206f 0004                 movea.l    4(a7),a0
[00044c8a] 0c30 005d 08ff            cmpi.b     #$5D,-1(a0,d0.l)
[00044c90] 6604                      bne.s      $00044C96
[00044c92] 7001                      moveq.l    #1,d0
[00044c94] 6002                      bra.s      $00044C98
[00044c96] 4240                      clr.w      d0
[00044c98] 504f                      addq.w     #8,a7
[00044c9a] 4e75                      rts
FoundNextGroup:
[00044c9c] 4fef fff6                 lea.l      -10(a7),a7
[00044ca0] 2f48 0006                 move.l     a0,6(a7)
[00044ca4] 2f49 0002                 move.l     a1,2(a7)
[00044ca8] 4240                      clr.w      d0
[00044caa] 206f 000e                 movea.l    14(a7),a0
[00044cae] 3080                      move.w     d0,(a0)
[00044cb0] 206f 0002                 movea.l    2(a7),a0
[00044cb4] 3080                      move.w     d0,(a0)
[00044cb6] 4257                      clr.w      (a7)
[00044cb8] 6070                      bra.s      $00044D2A
[00044cba] 226f 0006                 movea.l    6(a7),a1
[00044cbe] 303c 2000                 move.w     #$2000,d0
[00044cc2] 206f 0016                 movea.l    22(a7),a0
[00044cc6] 4eb9 0008 22be            jsr        fgets
[00044ccc] 2008                      move.l     a0,d0
[00044cce] 675a                      beq.s      $00044D2A
[00044cd0] 206f 0016                 movea.l    22(a7),a0
[00044cd4] 4eb9 0004 663c            jsr        Ast_alltrim
[00044cda] 206f 0016                 movea.l    22(a7),a0
[00044cde] 6100 ff82                 bsr.w      IsNewGroup
[00044ce2] 4a40                      tst.w      d0
[00044ce4] 672a                      beq.s      $00044D10
[00044ce6] 226f 0016                 movea.l    22(a7),a1
[00044cea] 5249                      addq.w     #1,a1
[00044cec] 206f 0012                 movea.l    18(a7),a0
[00044cf0] 4eb9 0008 2f0c            jsr        strcpy
[00044cf6] 206f 0012                 movea.l    18(a7),a0
[00044cfa] 4eb9 0008 2f6c            jsr        strlen
[00044d00] 5380                      subq.l     #1,d0
[00044d02] 206f 0012                 movea.l    18(a7),a0
[00044d06] 4230 0800                 clr.b      0(a0,d0.l)
[00044d0a] 3ebc 0001                 move.w     #$0001,(a7)
[00044d0e] 601a                      bra.s      $00044D2A
[00044d10] 206f 0002                 movea.l    2(a7),a0
[00044d14] 5250                      addq.w     #1,(a0)
[00044d16] 206f 0016                 movea.l    22(a7),a0
[00044d1a] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00044d20] 4a40                      tst.w      d0
[00044d22] 6706                      beq.s      $00044D2A
[00044d24] 206f 000e                 movea.l    14(a7),a0
[00044d28] 5250                      addq.w     #1,(a0)
[00044d2a] 206f 0006                 movea.l    6(a7),a0
[00044d2e] 4eb9 0008 22b2            jsr        feof
[00044d34] 4a40                      tst.w      d0
[00044d36] 6606                      bne.s      $00044D3E
[00044d38] 3017                      move.w     (a7),d0
[00044d3a] 6700 ff7e                 beq        $00044CBA
[00044d3e] 4fef 000a                 lea.l      10(a7),a7
[00044d42] 4e75                      rts
ReadUntilNextGroup:
[00044d44] 4fef ffec                 lea.l      -20(a7),a7
[00044d48] 2f48 0010                 move.l     a0,16(a7)
[00044d4c] 2f49 000c                 move.l     a1,12(a7)
[00044d50] 3f40 000a                 move.w     d0,10(a7)
[00044d54] 3f41 0008                 move.w     d1,8(a7)
[00044d58] 302f 000a                 move.w     10(a7),d0
[00044d5c] 906f 0008                 sub.w      8(a7),d0
[00044d60] 3f40 0004                 move.w     d0,4(a7)
[00044d64] 302f 0004                 move.w     4(a7),d0
[00044d68] 6f2c                      ble.s      $00044D96
[00044d6a] 302f 0004                 move.w     4(a7),d0
[00044d6e] 48c0                      ext.l      d0
[00044d70] e588                      lsl.l      #2,d0
[00044d72] 4eb9 0004 c608            jsr        Ax_malloc
[00044d78] 2e88                      move.l     a0,(a7)
[00044d7a] 2017                      move.l     (a7),d0
[00044d7c] 6606                      bne.s      $00044D84
[00044d7e] 4240                      clr.w      d0
[00044d80] 6000 00c2                 bra        $00044E44
[00044d84] 206f 000c                 movea.l    12(a7),a0
[00044d88] 2157 0006                 move.l     (a7),6(a0)
[00044d8c] 206f 000c                 movea.l    12(a7),a0
[00044d90] 316f 0004 0004            move.w     4(a7),4(a0)
[00044d96] 426f 0006                 clr.w      6(a7)
[00044d9a] 226f 0010                 movea.l    16(a7),a1
[00044d9e] 303c 2000                 move.w     #$2000,d0
[00044da2] 206f 0018                 movea.l    24(a7),a0
[00044da6] 4eb9 0008 22be            jsr        fgets
[00044dac] 206f 0018                 movea.l    24(a7),a0
[00044db0] 4eb9 0004 663c            jsr        Ast_alltrim
[00044db6] 6056                      bra.s      $00044E0E
[00044db8] 206f 0018                 movea.l    24(a7),a0
[00044dbc] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00044dc2] 4a40                      tst.w      d0
[00044dc4] 6626                      bne.s      $00044DEC
[00044dc6] 302f 0006                 move.w     6(a7),d0
[00044dca] b06f 0004                 cmp.w      4(a7),d0
[00044dce] 6c1c                      bge.s      $00044DEC
[00044dd0] 206f 0018                 movea.l    24(a7),a0
[00044dd4] 4eb9 0004 643c            jsr        Ast_create
[00044dda] 302f 0006                 move.w     6(a7),d0
[00044dde] 48c0                      ext.l      d0
[00044de0] e588                      lsl.l      #2,d0
[00044de2] 2257                      movea.l    (a7),a1
[00044de4] 2388 0800                 move.l     a0,0(a1,d0.l)
[00044de8] 526f 0006                 addq.w     #1,6(a7)
[00044dec] 206f 0018                 movea.l    24(a7),a0
[00044df0] 4210                      clr.b      (a0)
[00044df2] 226f 0010                 movea.l    16(a7),a1
[00044df6] 303c 2000                 move.w     #$2000,d0
[00044dfa] 206f 0018                 movea.l    24(a7),a0
[00044dfe] 4eb9 0008 22be            jsr        fgets
[00044e04] 206f 0018                 movea.l    24(a7),a0
[00044e08] 4eb9 0004 663c            jsr        Ast_alltrim
[00044e0e] 206f 0010                 movea.l    16(a7),a0
[00044e12] 4eb9 0008 22b2            jsr        feof
[00044e18] 4a40                      tst.w      d0
[00044e1a] 670e                      beq.s      $00044E2A
[00044e1c] 206f 0018                 movea.l    24(a7),a0
[00044e20] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00044e26] 4a40                      tst.w      d0
[00044e28] 660e                      bne.s      $00044E38
[00044e2a] 206f 0018                 movea.l    24(a7),a0
[00044e2e] 6100 fe32                 bsr        IsNewGroup
[00044e32] 4a40                      tst.w      d0
[00044e34] 6700 ff82                 beq.w      $00044DB8
[00044e38] 302f 0006                 move.w     6(a7),d0
[00044e3c] b06f 0004                 cmp.w      4(a7),d0
[00044e40] 4e71                      nop
[00044e42] 7001                      moveq.l    #1,d0
[00044e44] 4fef 0014                 lea.l      20(a7),a7
[00044e48] 4e75                      rts
Acfg_load:
[00044e4a] 4fef ffd0                 lea.l      -48(a7),a7
[00044e4e] 2f48 002c                 move.l     a0,44(a7)
[00044e52] 2f49 0028                 move.l     a1,40(a7)
[00044e56] 2f6f 002c 0024            move.l     44(a7),36(a7)
[00044e5c] 202f 0028                 move.l     40(a7),d0
[00044e60] 6706                      beq.s      $00044E68
[00044e62] 206f 0028                 movea.l    40(a7),a0
[00044e66] 6006                      bra.s      $00044E6E
[00044e68] 206f 0024                 movea.l    36(a7),a0
[00044e6c] 2050                      movea.l    (a0),a0
[00044e6e] 2f48 0020                 move.l     a0,32(a7)
[00044e72] 206f 0024                 movea.l    36(a7),a0
[00044e76] 6100 fa1e                 bsr        Acfg_clearAllGroups
[00044e7a] 206f 0024                 movea.l    36(a7),a0
[00044e7e] 4eb9 0004 5d16            jsr        Acfg_clearHeader
[00044e84] 206f 0024                 movea.l    36(a7),a0
[00044e88] 4268 0012                 clr.w      18(a0)
[00044e8c] 203c 0000 4004            move.l     #$00004004,d0
[00044e92] 4eb9 0004 c608            jsr        Ax_malloc
[00044e98] 2f48 000c                 move.l     a0,12(a7)
[00044e9c] 202f 000c                 move.l     12(a7),d0
[00044ea0] 6606                      bne.s      $00044EA8
[00044ea2] 4240                      clr.w      d0
[00044ea4] 6000 02d0                 bra        $00045176
[00044ea8] 206f 000c                 movea.l    12(a7),a0
[00044eac] 41e8 2003                 lea.l      8195(a0),a0
[00044eb0] 2f48 0010                 move.l     a0,16(a7)
[00044eb4] 2f2f 0010                 move.l     16(a7),-(a7)
[00044eb8] 2f2f 0010                 move.l     16(a7),-(a7)
[00044ebc] 226f 0028                 movea.l    40(a7),a1
[00044ec0] 41ef 001c                 lea.l      28(a7),a0
[00044ec4] 6100 fc70                 bsr        Acfg_makeName
[00044ec8] 504f                      addq.w     #8,a7
[00044eca] 4a40                      tst.w      d0
[00044ecc] 6610                      bne.s      $00044EDE
[00044ece] 206f 000c                 movea.l    12(a7),a0
[00044ed2] 4eb9 0004 c7c8            jsr        Ax_free
[00044ed8] 4240                      clr.w      d0
[00044eda] 6000 029a                 bra        $00045176
[00044ede] 43f9 000e 0594            lea.l      $000E0594,a1
[00044ee4] 206f 0014                 movea.l    20(a7),a0
[00044ee8] 4eb9 0008 24fa            jsr        fopen
[00044eee] 2f48 001c                 move.l     a0,28(a7)
[00044ef2] 202f 001c                 move.l     28(a7),d0
[00044ef6] 661a                      bne.s      $00044F12
[00044ef8] 206f 0014                 movea.l    20(a7),a0
[00044efc] 4eb9 0004 c7c8            jsr        Ax_free
[00044f02] 206f 000c                 movea.l    12(a7),a0
[00044f06] 4eb9 0004 c7c8            jsr        Ax_free
[00044f0c] 4240                      clr.w      d0
[00044f0e] 6000 0266                 bra        $00045176
[00044f12] 206f 0024                 movea.l    36(a7),a0
[00044f16] 3028 0010                 move.w     16(a0),d0
[00044f1a] 6f1c                      ble.s      $00044F38
[00044f1c] 206f 0024                 movea.l    36(a7),a0
[00044f20] 3228 0010                 move.w     16(a0),d1
[00044f24] 48c1                      ext.l      d1
[00044f26] 700a                      moveq.l    #10,d0
[00044f28] e1a9                      lsl.l      d0,d1
[00044f2a] 4240                      clr.w      d0
[00044f2c] 93c9                      suba.l     a1,a1
[00044f2e] 206f 001c                 movea.l    28(a7),a0
[00044f32] 4eb9 0008 2760            jsr        setvbuf
[00044f38] 3f7c 0001 000a            move.w     #$0001,10(a7)
[00044f3e] 4241                      clr.w      d1
[00044f40] 7000                      moveq.l    #0,d0
[00044f42] 206f 001c                 movea.l    28(a7),a0
[00044f46] 4eb9 0008 2476            jsr        fseek
[00044f4c] 602c                      bra.s      $00044F7A
[00044f4e] 226f 001c                 movea.l    28(a7),a1
[00044f52] 303c 2000                 move.w     #$2000,d0
[00044f56] 206f 000c                 movea.l    12(a7),a0
[00044f5a] 4eb9 0008 22be            jsr        fgets
[00044f60] 2008                      move.l     a0,d0
[00044f62] 6716                      beq.s      $00044F7A
[00044f64] 206f 000c                 movea.l    12(a7),a0
[00044f68] 4eb9 0004 663c            jsr        Ast_alltrim
[00044f6e] 6100 fcf2                 bsr        IsNewGroup
[00044f72] 4a40                      tst.w      d0
[00044f74] 6704                      beq.s      $00044F7A
[00044f76] 526f 000a                 addq.w     #1,10(a7)
[00044f7a] 206f 001c                 movea.l    28(a7),a0
[00044f7e] 4eb9 0008 22b2            jsr        feof
[00044f84] 4a40                      tst.w      d0
[00044f86] 67c6                      beq.s      $00044F4E
[00044f88] 302f 000a                 move.w     10(a7),d0
[00044f8c] 48c0                      ext.l      d0
[00044f8e] e588                      lsl.l      #2,d0
[00044f90] 4eb9 0004 c608            jsr        Ax_malloc
[00044f96] 226f 0024                 movea.l    36(a7),a1
[00044f9a] 2348 0016                 move.l     a0,22(a1)
[00044f9e] 206f 0024                 movea.l    36(a7),a0
[00044fa2] 2028 0016                 move.l     22(a0),d0
[00044fa6] 6624                      bne.s      $00044FCC
[00044fa8] 206f 001c                 movea.l    28(a7),a0
[00044fac] 4eb9 0008 2702            jsr        fclose
[00044fb2] 206f 0014                 movea.l    20(a7),a0
[00044fb6] 4eb9 0004 c7c8            jsr        Ax_free
[00044fbc] 206f 000c                 movea.l    12(a7),a0
[00044fc0] 4eb9 0004 c7c8            jsr        Ax_free
[00044fc6] 4240                      clr.w      d0
[00044fc8] 6000 01ac                 bra        $00045176
[00044fcc] 206f 0024                 movea.l    36(a7),a0
[00044fd0] 316f 000a 0014            move.w     10(a7),20(a0)
[00044fd6] 322f 000a                 move.w     10(a7),d1
[00044fda] 48c1                      ext.l      d1
[00044fdc] e589                      lsl.l      #2,d1
[00044fde] 4240                      clr.w      d0
[00044fe0] 206f 0024                 movea.l    36(a7),a0
[00044fe4] 2068 0016                 movea.l    22(a0),a0
[00044fe8] 4eb9 0008 36ea            jsr        memset
[00044fee] 206f 0010                 movea.l    16(a7),a0
[00044ff2] 4210                      clr.b      (a0)
[00044ff4] 4241                      clr.w      d1
[00044ff6] 7000                      moveq.l    #0,d0
[00044ff8] 206f 001c                 movea.l    28(a7),a0
[00044ffc] 4eb9 0008 2476            jsr        fseek
[00045002] 426f 0004                 clr.w      4(a7)
[00045006] 6000 0116                 bra        $0004511E
[0004500a] 700a                      moveq.l    #10,d0
[0004500c] 4eb9 0004 c608            jsr        Ax_malloc
[00045012] 2e88                      move.l     a0,(a7)
[00045014] 2017                      move.l     (a7),d0
[00045016] 6634                      bne.s      $0004504C
[00045018] 206f 001c                 movea.l    28(a7),a0
[0004501c] 4eb9 0008 2702            jsr        fclose
[00045022] 206f 0024                 movea.l    36(a7),a0
[00045026] 6100 f86e                 bsr        Acfg_clearAllGroups
[0004502a] 206f 0014                 movea.l    20(a7),a0
[0004502e] 4eb9 0004 c7c8            jsr        Ax_free
[00045034] 206f 000c                 movea.l    12(a7),a0
[00045038] 4eb9 0004 c7c8            jsr        Ax_free
[0004503e] 206f 0024                 movea.l    36(a7),a0
[00045042] 4268 0012                 clr.w      18(a0)
[00045046] 4240                      clr.w      d0
[00045048] 6000 012c                 bra        $00045176
[0004504c] 720a                      moveq.l    #10,d1
[0004504e] 4240                      clr.w      d0
[00045050] 2057                      movea.l    (a7),a0
[00045052] 4eb9 0008 36ea            jsr        memset
[00045058] 42a7                      clr.l      -(a7)
[0004505a] 43f9 000e 0596            lea.l      $000E0596,a1
[00045060] 2f09                      move.l     a1,-(a7)
[00045062] 206f 0018                 movea.l    24(a7),a0
[00045066] 4eb9 0004 643c            jsr        Ast_create
[0004506c] 4eb9 0004 663c            jsr        Ast_alltrim
[00045072] 225f                      movea.l    (a7)+,a1
[00045074] 4eb9 0004 6c4e            jsr        Ast_filter
[0004507a] 584f                      addq.w     #4,a7
[0004507c] 2257                      movea.l    (a7),a1
[0004507e] 2288                      move.l     a0,(a1)
[00045080] 302f 0004                 move.w     4(a7),d0
[00045084] 48c0                      ext.l      d0
[00045086] e588                      lsl.l      #2,d0
[00045088] 206f 0024                 movea.l    36(a7),a0
[0004508c] 2068 0016                 movea.l    22(a0),a0
[00045090] 2197 0800                 move.l     (a7),0(a0,d0.l)
[00045094] 206f 001c                 movea.l    28(a7),a0
[00045098] 4eb9 0008 2426            jsr        ftell
[0004509e] 2f40 0018                 move.l     d0,24(a7)
[000450a2] 2f2f 000c                 move.l     12(a7),-(a7)
[000450a6] 2f2f 0014                 move.l     20(a7),-(a7)
[000450aa] 486f 000e                 pea.l      14(a7)
[000450ae] 43ef 0014                 lea.l      20(a7),a1
[000450b2] 206f 0028                 movea.l    40(a7),a0
[000450b6] 6100 fbe4                 bsr        FoundNextGroup
[000450ba] 4fef 000c                 lea.l      12(a7),a7
[000450be] 4241                      clr.w      d1
[000450c0] 202f 0018                 move.l     24(a7),d0
[000450c4] 206f 001c                 movea.l    28(a7),a0
[000450c8] 4eb9 0008 2476            jsr        fseek
[000450ce] 2f2f 000c                 move.l     12(a7),-(a7)
[000450d2] 322f 000a                 move.w     10(a7),d1
[000450d6] 302f 000c                 move.w     12(a7),d0
[000450da] 226f 0004                 movea.l    4(a7),a1
[000450de] 206f 0020                 movea.l    32(a7),a0
[000450e2] 6100 fc60                 bsr        ReadUntilNextGroup
[000450e6] 584f                      addq.w     #4,a7
[000450e8] 4a40                      tst.w      d0
[000450ea] 662e                      bne.s      $0004511A
[000450ec] 206f 001c                 movea.l    28(a7),a0
[000450f0] 4eb9 0008 2702            jsr        fclose
[000450f6] 206f 0024                 movea.l    36(a7),a0
[000450fa] 6100 f79a                 bsr        Acfg_clearAllGroups
[000450fe] 206f 0014                 movea.l    20(a7),a0
[00045102] 4eb9 0004 c7c8            jsr        Ax_free
[00045108] 206f 000c                 movea.l    12(a7),a0
[0004510c] 4eb9 0004 c7c8            jsr        Ax_free
[00045112] 206f 0024                 movea.l    36(a7),a0
[00045116] 4268 0012                 clr.w      18(a0)
[0004511a] 526f 0004                 addq.w     #1,4(a7)
[0004511e] 302f 0004                 move.w     4(a7),d0
[00045122] b06f 000a                 cmp.w      10(a7),d0
[00045126] 6d00 fee2                 blt        $0004500A
[0004512a] 206f 0024                 movea.l    36(a7),a0
[0004512e] 2050                      movea.l    (a0),a0
[00045130] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00045136] 4a40                      tst.w      d0
[00045138] 660c                      bne.s      $00045146
[0004513a] 206f 0024                 movea.l    36(a7),a0
[0004513e] 2050                      movea.l    (a0),a0
[00045140] 4eb9 0004 649c            jsr        Ast_delete
[00045146] 206f 0014                 movea.l    20(a7),a0
[0004514a] 4eb9 0004 643c            jsr        Ast_create
[00045150] 226f 0024                 movea.l    36(a7),a1
[00045154] 2288                      move.l     a0,(a1)
[00045156] 206f 001c                 movea.l    28(a7),a0
[0004515a] 4eb9 0008 2702            jsr        fclose
[00045160] 206f 0014                 movea.l    20(a7),a0
[00045164] 4eb9 0004 c7c8            jsr        Ax_free
[0004516a] 206f 000c                 movea.l    12(a7),a0
[0004516e] 4eb9 0004 c7c8            jsr        Ax_free
[00045174] 7001                      moveq.l    #1,d0
[00045176] 4fef 0030                 lea.l      48(a7),a7
[0004517a] 4e75                      rts
WriteString:
[0004517c] 4fef fff6                 lea.l      -10(a7),a7
[00045180] 2f48 0006                 move.l     a0,6(a7)
[00045184] 2f49 0002                 move.l     a1,2(a7)
[00045188] 206f 000e                 movea.l    14(a7),a0
[0004518c] 3010                      move.w     (a0),d0
[0004518e] 6600 008e                 bne        $0004521E
[00045192] 206f 0016                 movea.l    22(a7),a0
[00045196] 4eb9 0004 663c            jsr        Ast_alltrim
[0004519c] 1010                      move.b     (a0),d0
[0004519e] 4880                      ext.w      d0
[000451a0] 206f 0002                 movea.l    2(a7),a0
[000451a4] 2068 0004                 movea.l    4(a0),a0
[000451a8] 4eb9 0008 2e8a            jsr        strchr
[000451ae] 2008                      move.l     a0,d0
[000451b0] 6664                      bne.s      $00045216
[000451b2] 4257                      clr.w      (a7)
[000451b4] 6034                      bra.s      $000451EA
[000451b6] 3017                      move.w     (a7),d0
[000451b8] 48c0                      ext.l      d0
[000451ba] e588                      lsl.l      #2,d0
[000451bc] 206f 0002                 movea.l    2(a7),a0
[000451c0] 2068 001e                 movea.l    30(a0),a0
[000451c4] 2f30 0800                 move.l     0(a0,d0.l),-(a7)
[000451c8] 206f 0006                 movea.l    6(a7),a0
[000451cc] 2068 0004                 movea.l    4(a0),a0
[000451d0] 1010                      move.b     (a0),d0
[000451d2] 4880                      ext.w      d0
[000451d4] 3f00                      move.w     d0,-(a7)
[000451d6] 43f9 000e 0599            lea.l      $000E0599,a1
[000451dc] 206f 000c                 movea.l    12(a7),a0
[000451e0] 4eb9 0008 156e            jsr        fprintf
[000451e6] 5c4f                      addq.w     #6,a7
[000451e8] 5257                      addq.w     #1,(a7)
[000451ea] 206f 0002                 movea.l    2(a7),a0
[000451ee] 3017                      move.w     (a7),d0
[000451f0] b068 001c                 cmp.w      28(a0),d0
[000451f4] 6dc0                      blt.s      $000451B6
[000451f6] 206f 0002                 movea.l    2(a7),a0
[000451fa] 2068 0004                 movea.l    4(a0),a0
[000451fe] 1010                      move.b     (a0),d0
[00045200] 4880                      ext.w      d0
[00045202] 3f00                      move.w     d0,-(a7)
[00045204] 43f9 000e 05a0            lea.l      $000E05A0,a1
[0004520a] 206f 0008                 movea.l    8(a7),a0
[0004520e] 4eb9 0008 156e            jsr        fprintf
[00045214] 544f                      addq.w     #2,a7
[00045216] 206f 000e                 movea.l    14(a7),a0
[0004521a] 30bc 0001                 move.w     #$0001,(a0)
[0004521e] 2f2f 0016                 move.l     22(a7),-(a7)
[00045222] 226f 0016                 movea.l    22(a7),a1
[00045226] 206f 000a                 movea.l    10(a7),a0
[0004522a] 4eb9 0008 156e            jsr        fprintf
[00045230] 584f                      addq.w     #4,a7
[00045232] 4fef 000a                 lea.l      10(a7),a7
[00045236] 4e75                      rts
Acfg_save:
[00045238] 4fef ffd2                 lea.l      -46(a7),a7
[0004523c] 2f48 002a                 move.l     a0,42(a7)
[00045240] 2f49 0026                 move.l     a1,38(a7)
[00045244] 2f6f 002a 0022            move.l     42(a7),34(a7)
[0004524a] 206f 0026                 movea.l    38(a7),a0
[0004524e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00045254] 4a40                      tst.w      d0
[00045256] 6606                      bne.s      $0004525E
[00045258] 206f 0026                 movea.l    38(a7),a0
[0004525c] 6006                      bra.s      $00045264
[0004525e] 206f 0022                 movea.l    34(a7),a0
[00045262] 2050                      movea.l    (a0),a0
[00045264] 2f48 001e                 move.l     a0,30(a7)
[00045268] 203c 0000 4004            move.l     #$00004004,d0
[0004526e] 4eb9 0004 c608            jsr        Ax_malloc
[00045274] 2f48 0012                 move.l     a0,18(a7)
[00045278] 202f 0012                 move.l     18(a7),d0
[0004527c] 6606                      bne.s      $00045284
[0004527e] 4240                      clr.w      d0
[00045280] 6000 01d8                 bra        $0004545A
[00045284] 206f 0012                 movea.l    18(a7),a0
[00045288] 41e8 2003                 lea.l      8195(a0),a0
[0004528c] 2f48 000e                 move.l     a0,14(a7)
[00045290] 2f2f 000e                 move.l     14(a7),-(a7)
[00045294] 2f2f 0016                 move.l     22(a7),-(a7)
[00045298] 226f 0026                 movea.l    38(a7),a1
[0004529c] 41ef 001e                 lea.l      30(a7),a0
[000452a0] 6100 f894                 bsr        Acfg_makeName
[000452a4] 504f                      addq.w     #8,a7
[000452a6] 4a40                      tst.w      d0
[000452a8] 661a                      bne.s      $000452C4
[000452aa] 206f 0016                 movea.l    22(a7),a0
[000452ae] 4eb9 0004 c7c8            jsr        Ax_free
[000452b4] 206f 0012                 movea.l    18(a7),a0
[000452b8] 4eb9 0004 c7c8            jsr        Ax_free
[000452be] 4240                      clr.w      d0
[000452c0] 6000 0198                 bra        $0004545A
[000452c4] 43f9 000e 05a4            lea.l      $000E05A4,a1
[000452ca] 206f 0016                 movea.l    22(a7),a0
[000452ce] 4eb9 0008 24fa            jsr        fopen
[000452d4] 2f48 001a                 move.l     a0,26(a7)
[000452d8] 202f 001a                 move.l     26(a7),d0
[000452dc] 661a                      bne.s      $000452F8
[000452de] 206f 0016                 movea.l    22(a7),a0
[000452e2] 4eb9 0004 c7c8            jsr        Ax_free
[000452e8] 206f 0012                 movea.l    18(a7),a0
[000452ec] 4eb9 0004 c7c8            jsr        Ax_free
[000452f2] 4240                      clr.w      d0
[000452f4] 6000 0164                 bra        $0004545A
[000452f8] 206f 0022                 movea.l    34(a7),a0
[000452fc] 3028 0010                 move.w     16(a0),d0
[00045300] 6f1c                      ble.s      $0004531E
[00045302] 206f 0022                 movea.l    34(a7),a0
[00045306] 3228 0010                 move.w     16(a0),d1
[0004530a] 48c1                      ext.l      d1
[0004530c] 700a                      moveq.l    #10,d0
[0004530e] e1a9                      lsl.l      d0,d1
[00045310] 4240                      clr.w      d0
[00045312] 93c9                      suba.l     a1,a1
[00045314] 206f 001a                 movea.l    26(a7),a0
[00045318] 4eb9 0008 2760            jsr        setvbuf
[0004531e] 206f 0022                 movea.l    34(a7),a0
[00045322] 0c68 0001 001c            cmpi.w     #$0001,28(a0)
[00045328] 6d0a                      blt.s      $00045334
[0004532a] 206f 0022                 movea.l    34(a7),a0
[0004532e] 2028 001e                 move.l     30(a0),d0
[00045332] 6604                      bne.s      $00045338
[00045334] 7001                      moveq.l    #1,d0
[00045336] 6002                      bra.s      $0004533A
[00045338] 4240                      clr.w      d0
[0004533a] 3e80                      move.w     d0,(a7)
[0004533c] 426f 0004                 clr.w      4(a7)
[00045340] 6000 00bc                 bra        $000453FE
[00045344] 302f 0004                 move.w     4(a7),d0
[00045348] 48c0                      ext.l      d0
[0004534a] e588                      lsl.l      #2,d0
[0004534c] 206f 0022                 movea.l    34(a7),a0
[00045350] 2068 0016                 movea.l    22(a0),a0
[00045354] 2f70 0800 000a            move.l     0(a0,d0.l),10(a7)
[0004535a] 206f 000a                 movea.l    10(a7),a0
[0004535e] 2050                      movea.l    (a0),a0
[00045360] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00045366] 4a40                      tst.w      d0
[00045368] 6620                      bne.s      $0004538A
[0004536a] 206f 000a                 movea.l    10(a7),a0
[0004536e] 2f10                      move.l     (a0),-(a7)
[00045370] 4879 000e 05a6            pea.l      $000E05A6
[00045376] 486f 0008                 pea.l      8(a7)
[0004537a] 226f 002e                 movea.l    46(a7),a1
[0004537e] 206f 0026                 movea.l    38(a7),a0
[00045382] 6100 fdf8                 bsr        WriteString
[00045386] 4fef 000c                 lea.l      12(a7),a7
[0004538a] 426f 0002                 clr.w      2(a7)
[0004538e] 206f 000a                 movea.l    10(a7),a0
[00045392] 2f68 0006 0006            move.l     6(a0),6(a7)
[00045398] 6028                      bra.s      $000453C2
[0004539a] 206f 0006                 movea.l    6(a7),a0
[0004539e] 2f10                      move.l     (a0),-(a7)
[000453a0] 4879 000e 05ac            pea.l      $000E05AC
[000453a6] 486f 0008                 pea.l      8(a7)
[000453aa] 226f 002e                 movea.l    46(a7),a1
[000453ae] 206f 0026                 movea.l    38(a7),a0
[000453b2] 6100 fdc8                 bsr        WriteString
[000453b6] 4fef 000c                 lea.l      12(a7),a7
[000453ba] 526f 0002                 addq.w     #1,2(a7)
[000453be] 58af 0006                 addq.l     #4,6(a7)
[000453c2] 206f 000a                 movea.l    10(a7),a0
[000453c6] 302f 0002                 move.w     2(a7),d0
[000453ca] b068 0004                 cmp.w      4(a0),d0
[000453ce] 6dca                      blt.s      $0004539A
[000453d0] 206f 000a                 movea.l    10(a7),a0
[000453d4] 2050                      movea.l    (a0),a0
[000453d6] 4eb9 0004 69f6            jsr        Ast_isEmpty
[000453dc] 4a40                      tst.w      d0
[000453de] 670a                      beq.s      $000453EA
[000453e0] 206f 000a                 movea.l    10(a7),a0
[000453e4] 3028 0004                 move.w     4(a0),d0
[000453e8] 6f10                      ble.s      $000453FA
[000453ea] 43f9 000e 05b0            lea.l      $000E05B0,a1
[000453f0] 206f 001a                 movea.l    26(a7),a0
[000453f4] 4eb9 0008 156e            jsr        fprintf
[000453fa] 526f 0004                 addq.w     #1,4(a7)
[000453fe] 206f 0022                 movea.l    34(a7),a0
[00045402] 302f 0004                 move.w     4(a7),d0
[00045406] b068 0014                 cmp.w      20(a0),d0
[0004540a] 6d00 ff38                 blt        $00045344
[0004540e] 3017                      move.w     (a7),d0
[00045410] 6620                      bne.s      $00045432
[00045412] 4879 000e 05b4            pea.l      $000E05B4
[00045418] 4879 000e 05b2            pea.l      $000E05B2
[0004541e] 486f 0008                 pea.l      8(a7)
[00045422] 226f 002e                 movea.l    46(a7),a1
[00045426] 206f 0026                 movea.l    38(a7),a0
[0004542a] 6100 fd50                 bsr        WriteString
[0004542e] 4fef 000c                 lea.l      12(a7),a7
[00045432] 206f 001a                 movea.l    26(a7),a0
[00045436] 4eb9 0008 2702            jsr        fclose
[0004543c] 206f 0022                 movea.l    34(a7),a0
[00045440] 4268 0012                 clr.w      18(a0)
[00045444] 206f 0016                 movea.l    22(a7),a0
[00045448] 4eb9 0004 c7c8            jsr        Ax_free
[0004544e] 206f 0012                 movea.l    18(a7),a0
[00045452] 4eb9 0004 c7c8            jsr        Ax_free
[00045458] 7001                      moveq.l    #1,d0
[0004545a] 4fef 002e                 lea.l      46(a7),a7
[0004545e] 4e75                      rts
Acfg_getValue:
[00045460] 4fef ffd8                 lea.l      -40(a7),a7
[00045464] 2f48 0024                 move.l     a0,36(a7)
[00045468] 2f49 0020                 move.l     a1,32(a7)
[0004546c] 2f6f 0024 001c            move.l     36(a7),28(a7)
[00045472] 426f 001a                 clr.w      26(a7)
[00045476] 206f 0030                 movea.l    48(a7),a0
[0004547a] 4210                      clr.b      (a0)
[0004547c] 2f2f 002c                 move.l     44(a7),-(a7)
[00045480] 226f 0024                 movea.l    36(a7),a1
[00045484] 41ef 0004                 lea.l      4(a7),a0
[00045488] 4eb9 0004 5ebc            jsr        InitCfgSearch
[0004548e] 584f                      addq.w     #4,a7
[00045490] 43d7                      lea.l      (a7),a1
[00045492] 206f 001c                 movea.l    28(a7),a0
[00045496] 4eb9 0004 5f3c            jsr        SearchCfgString
[0004549c] 202f 0004                 move.l     4(a7),d0
[000454a0] 671c                      beq.s      $000454BE
[000454a2] 302f 0010                 move.w     16(a7),d0
[000454a6] 6b16                      bmi.s      $000454BE
[000454a8] 202f 000c                 move.l     12(a7),d0
[000454ac] 6710                      beq.s      $000454BE
[000454ae] 202f 000c                 move.l     12(a7),d0
[000454b2] 6704                      beq.s      $000454B8
[000454b4] 7001                      moveq.l    #1,d0
[000454b6] 6002                      bra.s      $000454BA
[000454b8] 4240                      clr.w      d0
[000454ba] 3f40 001a                 move.w     d0,26(a7)
[000454be] 302f 001a                 move.w     26(a7),d0
[000454c2] 6600 00b4                 bne        $00045578
[000454c6] 206f 001c                 movea.l    28(a7),a0
[000454ca] 2028 0008                 move.l     8(a0),d0
[000454ce] 6700 00a8                 beq        $00045578
[000454d2] 206f 001c                 movea.l    28(a7),a0
[000454d6] 2068 0008                 movea.l    8(a0),a0
[000454da] 4eb9 0008 2f6c            jsr        strlen
[000454e0] 2f00                      move.l     d0,-(a7)
[000454e2] 206f 0004                 movea.l    4(a7),a0
[000454e6] 4eb9 0008 2f6c            jsr        strlen
[000454ec] d09f                      add.l      (a7)+,d0
[000454ee] 2f00                      move.l     d0,-(a7)
[000454f0] 206f 000c                 movea.l    12(a7),a0
[000454f4] 4eb9 0008 2f6c            jsr        strlen
[000454fa] d09f                      add.l      (a7)+,d0
[000454fc] 2f40 0012                 move.l     d0,18(a7)
[00045500] 202f 0012                 move.l     18(a7),d0
[00045504] 6f72                      ble.s      $00045578
[00045506] 7001                      moveq.l    #1,d0
[00045508] d0af 0012                 add.l      18(a7),d0
[0004550c] 4eb9 0004 c608            jsr        Ax_malloc
[00045512] 2f48 0016                 move.l     a0,22(a7)
[00045516] 202f 0016                 move.l     22(a7),d0
[0004551a] 675c                      beq.s      $00045578
[0004551c] 2f2f 0008                 move.l     8(a7),-(a7)
[00045520] 2f2f 0004                 move.l     4(a7),-(a7)
[00045524] 206f 0024                 movea.l    36(a7),a0
[00045528] 2f28 0008                 move.l     8(a0),-(a7)
[0004552c] 206f 0022                 movea.l    34(a7),a0
[00045530] 7003                      moveq.l    #3,d0
[00045532] 4eb9 0004 6a3a            jsr        Ast_add
[00045538] 4fef 000c                 lea.l      12(a7),a7
[0004553c] 206f 0008                 movea.l    8(a7),a0
[00045540] 4eb9 0004 649c            jsr        Ast_delete
[00045546] 2f6f 0016 0008            move.l     22(a7),8(a7)
[0004554c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00045552] 2f28 028c                 move.l     652(a0),-(a7)
[00045556] 70ff                      moveq.l    #-1,d0
[00045558] 43ef 0004                 lea.l      4(a7),a1
[0004555c] 206f 0020                 movea.l    32(a7),a0
[00045560] 4eb9 0004 5f96            jsr        SearchCfgNameInStrings
[00045566] 584f                      addq.w     #4,a7
[00045568] 202f 000c                 move.l     12(a7),d0
[0004556c] 6704                      beq.s      $00045572
[0004556e] 7001                      moveq.l    #1,d0
[00045570] 6002                      bra.s      $00045574
[00045572] 4240                      clr.w      d0
[00045574] 3f40 001a                 move.w     d0,26(a7)
[00045578] 302f 001a                 move.w     26(a7),d0
[0004557c] 6714                      beq.s      $00045592
[0004557e] 226f 000c                 movea.l    12(a7),a1
[00045582] 206f 0030                 movea.l    48(a7),a0
[00045586] 4eb9 0008 2f0c            jsr        strcpy
[0004558c] 4eb9 0004 663c            jsr        Ast_alltrim
[00045592] 2057                      movea.l    (a7),a0
[00045594] 4eb9 0004 649c            jsr        Ast_delete
[0004559a] 206f 0008                 movea.l    8(a7),a0
[0004559e] 4eb9 0004 649c            jsr        Ast_delete
[000455a4] 206f 0030                 movea.l    48(a7),a0
[000455a8] 4fef 0028                 lea.l      40(a7),a7
[000455ac] 4e75                      rts
Acfg_setValue:
[000455ae] 4fef ffd6                 lea.l      -42(a7),a7
[000455b2] 2f48 0024                 move.l     a0,36(a7)
[000455b6] 2f49 0020                 move.l     a1,32(a7)
[000455ba] 2f6f 0024 001c            move.l     36(a7),28(a7)
[000455c0] 4257                      clr.w      (a7)
[000455c2] 2f2f 002e                 move.l     46(a7),-(a7)
[000455c6] 226f 0024                 movea.l    36(a7),a1
[000455ca] 41ef 000e                 lea.l      14(a7),a0
[000455ce] 4eb9 0004 5ebc            jsr        InitCfgSearch
[000455d4] 584f                      addq.w     #4,a7
[000455d6] 43ef 000a                 lea.l      10(a7),a1
[000455da] 206f 001c                 movea.l    28(a7),a0
[000455de] 4eb9 0004 5f3c            jsr        SearchCfgString
[000455e4] 202f 000e                 move.l     14(a7),d0
[000455e8] 6612                      bne.s      $000455FC
[000455ea] 226f 000a                 movea.l    10(a7),a1
[000455ee] 206f 001c                 movea.l    28(a7),a0
[000455f2] 4eb9 0004 623e            jsr        CreateCfgGruppe
[000455f8] 2f48 000e                 move.l     a0,14(a7)
[000455fc] 202f 000e                 move.l     14(a7),d0
[00045600] 6700 011e                 beq        $00045720
[00045604] 206f 0012                 movea.l    18(a7),a0
[00045608] 4eb9 0008 2f6c            jsr        strlen
[0004560e] 2f00                      move.l     d0,-(a7)
[00045610] 206f 0036                 movea.l    54(a7),a0
[00045614] 4eb9 0008 2f6c            jsr        strlen
[0004561a] d09f                      add.l      (a7)+,d0
[0004561c] 5480                      addq.l     #2,d0
[0004561e] 2f40 0002                 move.l     d0,2(a7)
[00045622] 202f 0002                 move.l     2(a7),d0
[00045626] 4eb9 0004 c608            jsr        Ax_malloc
[0004562c] 2f48 0006                 move.l     a0,6(a7)
[00045630] 2f2f 0032                 move.l     50(a7),-(a7)
[00045634] 4879 000e 05b7            pea.l      $000E05B7
[0004563a] 2f2f 001a                 move.l     26(a7),-(a7)
[0004563e] 206f 0012                 movea.l    18(a7),a0
[00045642] 7003                      moveq.l    #3,d0
[00045644] 4eb9 0004 6a3a            jsr        Ast_add
[0004564a] 4fef 000c                 lea.l      12(a7),a7
[0004564e] 302f 001a                 move.w     26(a7),d0
[00045652] 6b06                      bmi.s      $0004565A
[00045654] 202f 0016                 move.l     22(a7),d0
[00045658] 661e                      bne.s      $00045678
[0004565a] 226f 0006                 movea.l    6(a7),a1
[0004565e] 206f 000e                 movea.l    14(a7),a0
[00045662] 4eb9 0004 6326            jsr        CreateCfgString
[00045668] 3e80                      move.w     d0,(a7)
[0004566a] 206f 001c                 movea.l    28(a7),a0
[0004566e] 317c 0001 0012            move.w     #$0001,18(a0)
[00045674] 6000 00aa                 bra        $00045720
[00045678] 206f 001c                 movea.l    28(a7),a0
[0004567c] 3028 000c                 move.w     12(a0),d0
[00045680] 672e                      beq.s      $000456B0
[00045682] 302f 001a                 move.w     26(a7),d0
[00045686] 48c0                      ext.l      d0
[00045688] e588                      lsl.l      #2,d0
[0004568a] 206f 000e                 movea.l    14(a7),a0
[0004568e] 2068 0006                 movea.l    6(a0),a0
[00045692] 2270 0800                 movea.l    0(a0,d0.l),a1
[00045696] 206f 0006                 movea.l    6(a7),a0
[0004569a] 4eb9 0004 665a            jsr        Ast_cmp
[000456a0] 4a40                      tst.w      d0
[000456a2] 6604                      bne.s      $000456A8
[000456a4] 7001                      moveq.l    #1,d0
[000456a6] 6002                      bra.s      $000456AA
[000456a8] 4240                      clr.w      d0
[000456aa] 3f40 0028                 move.w     d0,40(a7)
[000456ae] 602c                      bra.s      $000456DC
[000456b0] 302f 001a                 move.w     26(a7),d0
[000456b4] 48c0                      ext.l      d0
[000456b6] e588                      lsl.l      #2,d0
[000456b8] 206f 000e                 movea.l    14(a7),a0
[000456bc] 2068 0006                 movea.l    6(a0),a0
[000456c0] 2270 0800                 movea.l    0(a0,d0.l),a1
[000456c4] 206f 0006                 movea.l    6(a7),a0
[000456c8] 4eb9 0004 66ea            jsr        Ast_icmp
[000456ce] 4a40                      tst.w      d0
[000456d0] 6604                      bne.s      $000456D6
[000456d2] 7001                      moveq.l    #1,d0
[000456d4] 6002                      bra.s      $000456D8
[000456d6] 4240                      clr.w      d0
[000456d8] 3f40 0028                 move.w     d0,40(a7)
[000456dc] 302f 0028                 move.w     40(a7),d0
[000456e0] 663e                      bne.s      $00045720
[000456e2] 302f 001a                 move.w     26(a7),d0
[000456e6] 48c0                      ext.l      d0
[000456e8] e588                      lsl.l      #2,d0
[000456ea] 206f 000e                 movea.l    14(a7),a0
[000456ee] 2068 0006                 movea.l    6(a0),a0
[000456f2] 2070 0800                 movea.l    0(a0,d0.l),a0
[000456f6] 4eb9 0004 649c            jsr        Ast_delete
[000456fc] 302f 001a                 move.w     26(a7),d0
[00045700] 48c0                      ext.l      d0
[00045702] e588                      lsl.l      #2,d0
[00045704] 206f 000e                 movea.l    14(a7),a0
[00045708] 2068 0006                 movea.l    6(a0),a0
[0004570c] 21af 0006 0800            move.l     6(a7),0(a0,d0.l)
[00045712] 3ebc 0001                 move.w     #$0001,(a7)
[00045716] 206f 001c                 movea.l    28(a7),a0
[0004571a] 317c 0001 0012            move.w     #$0001,18(a0)
[00045720] 206f 000a                 movea.l    10(a7),a0
[00045724] 4eb9 0004 649c            jsr        Ast_delete
[0004572a] 206f 0012                 movea.l    18(a7),a0
[0004572e] 4eb9 0004 649c            jsr        Ast_delete
[00045734] 3017                      move.w     (a7),d0
[00045736] 6706                      beq.s      $0004573E
[00045738] 206f 0032                 movea.l    50(a7),a0
[0004573c] 6006                      bra.s      $00045744
[0004573e] 41f9 000e 05b9            lea.l      $000E05B9,a0
[00045744] 4fef 002a                 lea.l      42(a7),a7
[00045748] 4e75                      rts
Acfg_clearValue:
[0004574a] 4fef ffe0                 lea.l      -32(a7),a7
[0004574e] 2f48 001c                 move.l     a0,28(a7)
[00045752] 2f49 0018                 move.l     a1,24(a7)
[00045756] 2f6f 001c 0014            move.l     28(a7),20(a7)
[0004575c] 4257                      clr.w      (a7)
[0004575e] 206f 0028                 movea.l    40(a7),a0
[00045762] 4210                      clr.b      (a0)
[00045764] 2f2f 0024                 move.l     36(a7),-(a7)
[00045768] 226f 001c                 movea.l    28(a7),a1
[0004576c] 41ef 0006                 lea.l      6(a7),a0
[00045770] 4eb9 0004 5ebc            jsr        InitCfgSearch
[00045776] 584f                      addq.w     #4,a7
[00045778] 43ef 0002                 lea.l      2(a7),a1
[0004577c] 206f 0014                 movea.l    20(a7),a0
[00045780] 4eb9 0004 5f3c            jsr        SearchCfgString
[00045786] 202f 0006                 move.l     6(a7),d0
[0004578a] 6730                      beq.s      $000457BC
[0004578c] 302f 0012                 move.w     18(a7),d0
[00045790] 6b2a                      bmi.s      $000457BC
[00045792] 202f 000e                 move.l     14(a7),d0
[00045796] 6724                      beq.s      $000457BC
[00045798] 226f 000e                 movea.l    14(a7),a1
[0004579c] 206f 0028                 movea.l    40(a7),a0
[000457a0] 4eb9 0008 2f0c            jsr        strcpy
[000457a6] 4eb9 0004 663c            jsr        Ast_alltrim
[000457ac] 302f 0012                 move.w     18(a7),d0
[000457b0] 206f 0006                 movea.l    6(a7),a0
[000457b4] 4eb9 0004 63a4            jsr        DeleteCfgString
[000457ba] 3e80                      move.w     d0,(a7)
[000457bc] 206f 0002                 movea.l    2(a7),a0
[000457c0] 4eb9 0004 649c            jsr        Ast_delete
[000457c6] 206f 000a                 movea.l    10(a7),a0
[000457ca] 4eb9 0004 649c            jsr        Ast_delete
[000457d0] 3017                      move.w     (a7),d0
[000457d2] 6706                      beq.s      $000457DA
[000457d4] 206f 0028                 movea.l    40(a7),a0
[000457d8] 6006                      bra.s      $000457E0
[000457da] 41f9 000e 05ba            lea.l      $000E05BA,a0
[000457e0] 4fef 0020                 lea.l      32(a7),a7
[000457e4] 4e75                      rts
Acfg_getString:
[000457e6] 514f                      subq.w     #8,a7
[000457e8] 2f48 0004                 move.l     a0,4(a7)
[000457ec] 2e89                      move.l     a1,(a7)
[000457ee] 4879 0010 f58e            pea.l      s_val
[000457f4] 2f2f 0010                 move.l     16(a7),-(a7)
[000457f8] 226f 0008                 movea.l    8(a7),a1
[000457fc] 206f 000c                 movea.l    12(a7),a0
[00045800] 6100 fc5e                 bsr        Acfg_getValue
[00045804] 504f                      addq.w     #8,a7
[00045806] 504f                      addq.w     #8,a7
[00045808] 4e75                      rts
Acfg_getLong:
[0004580a] 4fef dff8                 lea.l      -8200(a7),a7
[0004580e] 2f48 2004                 move.l     a0,8196(a7)
[00045812] 2f49 2000                 move.l     a1,8192(a7)
[00045816] 4857                      pea.l      (a7)
[00045818] 2f2f 2010                 move.l     8208(a7),-(a7)
[0004581c] 226f 2008                 movea.l    8200(a7),a1
[00045820] 206f 200c                 movea.l    8204(a7),a0
[00045824] 6100 fc3a                 bsr        Acfg_getValue
[00045828] 504f                      addq.w     #8,a7
[0004582a] 4eb9 0008 2d5c            jsr        atol
[00045830] 4fef 2008                 lea.l      8200(a7),a7
[00045834] 4e75                      rts
Acfg_setLong:
[00045836] 4fef ffde                 lea.l      -34(a7),a7
[0004583a] 2f48 001e                 move.l     a0,30(a7)
[0004583e] 2f49 001a                 move.l     a1,26(a7)
[00045842] 2f40 0016                 move.l     d0,22(a7)
[00045846] 2f2f 0016                 move.l     22(a7),-(a7)
[0004584a] 43f9 000e 05bb            lea.l      $000E05BB,a1
[00045850] 41ef 0004                 lea.l      4(a7),a0
[00045854] 4eb9 0008 15ac            jsr        sprintf
[0004585a] 584f                      addq.w     #4,a7
[0004585c] 4857                      pea.l      (a7)
[0004585e] 2f2f 002a                 move.l     42(a7),-(a7)
[00045862] 226f 0022                 movea.l    34(a7),a1
[00045866] 206f 0026                 movea.l    38(a7),a0
[0004586a] 6100 fd42                 bsr        Acfg_setValue
[0004586e] 504f                      addq.w     #8,a7
[00045870] 4eb9 0008 2d5c            jsr        atol
[00045876] 4fef 0022                 lea.l      34(a7),a7
[0004587a] 4e75                      rts
Acfg_getChar:
[0004587c] 4fef ffc4                 lea.l      -60(a7),a7
[00045880] 2f48 0038                 move.l     a0,56(a7)
[00045884] 2f49 0034                 move.l     a1,52(a7)
[00045888] 4857                      pea.l      (a7)
[0004588a] 2f2f 0044                 move.l     68(a7),-(a7)
[0004588e] 226f 003c                 movea.l    60(a7),a1
[00045892] 206f 0040                 movea.l    64(a7),a0
[00045896] 6100 fbc8                 bsr        Acfg_getValue
[0004589a] 504f                      addq.w     #8,a7
[0004589c] 1010                      move.b     (a0),d0
[0004589e] 4fef 003c                 lea.l      60(a7),a7
[000458a2] 4e75                      rts
Acfg_setChar:
[000458a4] 4fef fff4                 lea.l      -12(a7),a7
[000458a8] 2f48 0008                 move.l     a0,8(a7)
[000458ac] 2f49 0004                 move.l     a1,4(a7)
[000458b0] 1f40 0002                 move.b     d0,2(a7)
[000458b4] 1eaf 0002                 move.b     2(a7),(a7)
[000458b8] 422f 0001                 clr.b      1(a7)
[000458bc] 4857                      pea.l      (a7)
[000458be] 2f2f 0014                 move.l     20(a7),-(a7)
[000458c2] 226f 000c                 movea.l    12(a7),a1
[000458c6] 206f 0010                 movea.l    16(a7),a0
[000458ca] 6100 fce2                 bsr        Acfg_setValue
[000458ce] 504f                      addq.w     #8,a7
[000458d0] 1010                      move.b     (a0),d0
[000458d2] 4fef 000c                 lea.l      12(a7),a7
[000458d6] 4e75                      rts
Acfg_getBool:
[000458d8] 4fef ffee                 lea.l      -18(a7),a7
[000458dc] 2f48 000e                 move.l     a0,14(a7)
[000458e0] 2f49 000a                 move.l     a1,10(a7)
[000458e4] 43f9 000e 05bf            lea.l      $000E05BF,a1
[000458ea] 2f09                      move.l     a1,-(a7)
[000458ec] 486f 0004                 pea.l      4(a7)
[000458f0] 2f2f 001e                 move.l     30(a7),-(a7)
[000458f4] 226f 0016                 movea.l    22(a7),a1
[000458f8] 206f 001a                 movea.l    26(a7),a0
[000458fc] 6100 fb62                 bsr        Acfg_getValue
[00045900] 504f                      addq.w     #8,a7
[00045902] 225f                      movea.l    (a7)+,a1
[00045904] 4eb9 0004 66ea            jsr        Ast_icmp
[0004590a] 4a40                      tst.w      d0
[0004590c] 6604                      bne.s      $00045912
[0004590e] 7001                      moveq.l    #1,d0
[00045910] 6002                      bra.s      $00045914
[00045912] 4240                      clr.w      d0
[00045914] 4fef 0012                 lea.l      18(a7),a7
[00045918] 4e75                      rts
Acfg_setBool:
[0004591a] 4fef fff6                 lea.l      -10(a7),a7
[0004591e] 2f48 0006                 move.l     a0,6(a7)
[00045922] 2f49 0002                 move.l     a1,2(a7)
[00045926] 3e80                      move.w     d0,(a7)
[00045928] 43f9 000e 05cf            lea.l      $000E05CF,a1
[0004592e] 2f09                      move.l     a1,-(a7)
[00045930] 302f 0004                 move.w     4(a7),d0
[00045934] 6708                      beq.s      $0004593E
[00045936] 41f9 000e 05c4            lea.l      $000E05C4,a0
[0004593c] 6006                      bra.s      $00045944
[0004593e] 41f9 000e 05c9            lea.l      $000E05C9,a0
[00045944] 2f08                      move.l     a0,-(a7)
[00045946] 2f2f 0016                 move.l     22(a7),-(a7)
[0004594a] 226f 000e                 movea.l    14(a7),a1
[0004594e] 206f 0012                 movea.l    18(a7),a0
[00045952] 6100 fc5a                 bsr        Acfg_setValue
[00045956] 504f                      addq.w     #8,a7
[00045958] 225f                      movea.l    (a7)+,a1
[0004595a] 4eb9 0004 66ea            jsr        Ast_icmp
[00045960] 4a40                      tst.w      d0
[00045962] 6604                      bne.s      $00045968
[00045964] 7001                      moveq.l    #1,d0
[00045966] 6002                      bra.s      $0004596A
[00045968] 4240                      clr.w      d0
[0004596a] 4fef 000a                 lea.l      10(a7),a7
[0004596e] 4e75                      rts
Acfg_isChanged:
[00045970] 594f                      subq.w     #4,a7
[00045972] 2e88                      move.l     a0,(a7)
[00045974] 2057                      movea.l    (a7),a0
[00045976] 3028 0012                 move.w     18(a0),d0
[0004597a] 584f                      addq.w     #4,a7
[0004597c] 4e75                      rts
Acfg_grpAnzahl:
[0004597e] 594f                      subq.w     #4,a7
[00045980] 2e88                      move.l     a0,(a7)
[00045982] 2057                      movea.l    (a7),a0
[00045984] 3028 0014                 move.w     20(a0),d0
[00045988] 584f                      addq.w     #4,a7
[0004598a] 4e75                      rts
Acfg_grpName:
[0004598c] 4fef fff2                 lea.l      -14(a7),a7
[00045990] 2f48 000a                 move.l     a0,10(a7)
[00045994] 3f40 0008                 move.w     d0,8(a7)
[00045998] 2f49 0004                 move.l     a1,4(a7)
[0004599c] 2eaf 000a                 move.l     10(a7),(a7)
[000459a0] 302f 0008                 move.w     8(a7),d0
[000459a4] 6b2c                      bmi.s      $000459D2
[000459a6] 2057                      movea.l    (a7),a0
[000459a8] 302f 0008                 move.w     8(a7),d0
[000459ac] b068 0014                 cmp.w      20(a0),d0
[000459b0] 6c20                      bge.s      $000459D2
[000459b2] 302f 0008                 move.w     8(a7),d0
[000459b6] 48c0                      ext.l      d0
[000459b8] e588                      lsl.l      #2,d0
[000459ba] 2057                      movea.l    (a7),a0
[000459bc] 2068 0016                 movea.l    22(a0),a0
[000459c0] 2070 0800                 movea.l    0(a0,d0.l),a0
[000459c4] 2250                      movea.l    (a0),a1
[000459c6] 206f 0004                 movea.l    4(a7),a0
[000459ca] 4eb9 0008 2f0c            jsr        strcpy
[000459d0] 6002                      bra.s      $000459D4
[000459d2] 91c8                      suba.l     a0,a0
[000459d4] 4fef 000e                 lea.l      14(a7),a7
[000459d8] 4e75                      rts
Acfg_strAnzahl:
[000459da] 4fef fff6                 lea.l      -10(a7),a7
[000459de] 2f48 0006                 move.l     a0,6(a7)
[000459e2] 3f40 0004                 move.w     d0,4(a7)
[000459e6] 2eaf 0006                 move.l     6(a7),(a7)
[000459ea] 302f 0004                 move.w     4(a7),d0
[000459ee] 6b24                      bmi.s      $00045A14
[000459f0] 2057                      movea.l    (a7),a0
[000459f2] 302f 0004                 move.w     4(a7),d0
[000459f6] b068 0014                 cmp.w      20(a0),d0
[000459fa] 6c18                      bge.s      $00045A14
[000459fc] 302f 0004                 move.w     4(a7),d0
[00045a00] 48c0                      ext.l      d0
[00045a02] e588                      lsl.l      #2,d0
[00045a04] 2057                      movea.l    (a7),a0
[00045a06] 2068 0016                 movea.l    22(a0),a0
[00045a0a] 2070 0800                 movea.l    0(a0,d0.l),a0
[00045a0e] 3028 0004                 move.w     4(a0),d0
[00045a12] 6002                      bra.s      $00045A16
[00045a14] 4240                      clr.w      d0
[00045a16] 4fef 000a                 lea.l      10(a7),a7
[00045a1a] 4e75                      rts
Acfg_isGroupPresent:
[00045a1c] 4fef ffe2                 lea.l      -30(a7),a7
[00045a20] 2f48 001a                 move.l     a0,26(a7)
[00045a24] 2f49 0016                 move.l     a1,22(a7)
[00045a28] 2f6f 001a 0012            move.l     26(a7),18(a7)
[00045a2e] 4879 000e 05d4            pea.l      $000E05D4
[00045a34] 226f 001a                 movea.l    26(a7),a1
[00045a38] 41ef 0004                 lea.l      4(a7),a0
[00045a3c] 4eb9 0004 5ebc            jsr        InitCfgSearch
[00045a42] 584f                      addq.w     #4,a7
[00045a44] 43d7                      lea.l      (a7),a1
[00045a46] 206f 0012                 movea.l    18(a7),a0
[00045a4a] 4eb9 0004 6050            jsr        SearchGruppe
[00045a50] 2008                      move.l     a0,d0
[00045a52] 6604                      bne.s      $00045A58
[00045a54] 4240                      clr.w      d0
[00045a56] 6002                      bra.s      $00045A5A
[00045a58] 7001                      moveq.l    #1,d0
[00045a5a] 4fef 001e                 lea.l      30(a7),a7
[00045a5e] 4e75                      rts
Acfg_isStringPresent:
[00045a60] 4fef ffe2                 lea.l      -30(a7),a7
[00045a64] 2f48 001a                 move.l     a0,26(a7)
[00045a68] 2f49 0016                 move.l     a1,22(a7)
[00045a6c] 2f6f 001a 0012            move.l     26(a7),18(a7)
[00045a72] 2f2f 0022                 move.l     34(a7),-(a7)
[00045a76] 226f 001a                 movea.l    26(a7),a1
[00045a7a] 41ef 0004                 lea.l      4(a7),a0
[00045a7e] 4eb9 0004 5ebc            jsr        InitCfgSearch
[00045a84] 584f                      addq.w     #4,a7
[00045a86] 43d7                      lea.l      (a7),a1
[00045a88] 206f 0012                 movea.l    18(a7),a0
[00045a8c] 4eb9 0004 5f3c            jsr        SearchCfgString
[00045a92] 0c6f ffff 0010            cmpi.w     #$FFFF,16(a7)
[00045a98] 6604                      bne.s      $00045A9E
[00045a9a] 4240                      clr.w      d0
[00045a9c] 6002                      bra.s      $00045AA0
[00045a9e] 7001                      moveq.l    #1,d0
[00045aa0] 4fef 001e                 lea.l      30(a7),a7
[00045aa4] 4e75                      rts
Acfg_strName:
[00045aa6] 4fef ffe4                 lea.l      -28(a7),a7
[00045aaa] 2f48 0018                 move.l     a0,24(a7)
[00045aae] 3f40 0016                 move.w     d0,22(a7)
[00045ab2] 3f41 0014                 move.w     d1,20(a7)
[00045ab6] 2f49 0010                 move.l     a1,16(a7)
[00045aba] 2f6f 0018 000c            move.l     24(a7),12(a7)
[00045ac0] 206f 0010                 movea.l    16(a7),a0
[00045ac4] 4210                      clr.b      (a0)
[00045ac6] 302f 0016                 move.w     22(a7),d0
[00045aca] 6b00 009a                 bmi        $00045B66
[00045ace] 206f 000c                 movea.l    12(a7),a0
[00045ad2] 302f 0016                 move.w     22(a7),d0
[00045ad6] b068 0014                 cmp.w      20(a0),d0
[00045ada] 6c00 008a                 bge        $00045B66
[00045ade] 302f 0016                 move.w     22(a7),d0
[00045ae2] 48c0                      ext.l      d0
[00045ae4] e588                      lsl.l      #2,d0
[00045ae6] 206f 000c                 movea.l    12(a7),a0
[00045aea] 2068 0016                 movea.l    22(a0),a0
[00045aee] 2f70 0800 0008            move.l     0(a0,d0.l),8(a7)
[00045af4] 302f 0014                 move.w     20(a7),d0
[00045af8] 6b6c                      bmi.s      $00045B66
[00045afa] 206f 0008                 movea.l    8(a7),a0
[00045afe] 302f 0014                 move.w     20(a7),d0
[00045b02] b068 0004                 cmp.w      4(a0),d0
[00045b06] 6c5e                      bge.s      $00045B66
[00045b08] 322f 0014                 move.w     20(a7),d1
[00045b0c] 302f 0016                 move.w     22(a7),d0
[00045b10] 206f 0018                 movea.l    24(a7),a0
[00045b14] 4eb9 0004 5c5a            jsr        Acfg_strIsComment
[00045b1a] 4a40                      tst.w      d0
[00045b1c] 6648                      bne.s      $00045B66
[00045b1e] 302f 0014                 move.w     20(a7),d0
[00045b22] 48c0                      ext.l      d0
[00045b24] e588                      lsl.l      #2,d0
[00045b26] 206f 0008                 movea.l    8(a7),a0
[00045b2a] 2068 0006                 movea.l    6(a0),a0
[00045b2e] 2eb0 0800                 move.l     0(a0,d0.l),(a7)
[00045b32] 703d                      moveq.l    #61,d0
[00045b34] 2057                      movea.l    (a7),a0
[00045b36] 4eb9 0008 2e8a            jsr        strchr
[00045b3c] 2f48 0004                 move.l     a0,4(a7)
[00045b40] 202f 0004                 move.l     4(a7),d0
[00045b44] 6720                      beq.s      $00045B66
[00045b46] 202f 0004                 move.l     4(a7),d0
[00045b4a] 9097                      sub.l      (a7),d0
[00045b4c] 2257                      movea.l    (a7),a1
[00045b4e] 206f 0010                 movea.l    16(a7),a0
[00045b52] 4eb9 0008 2fd6            jsr        strncpy
[00045b58] 206f 0004                 movea.l    4(a7),a0
[00045b5c] 91d7                      suba.l     (a7),a0
[00045b5e] 226f 0010                 movea.l    16(a7),a1
[00045b62] 4231 8800                 clr.b      0(a1,a0.l)
[00045b66] 206f 0010                 movea.l    16(a7),a0
[00045b6a] 4fef 001c                 lea.l      28(a7),a7
[00045b6e] 4e75                      rts
Acfg_strValue:
[00045b70] 4fef ffe4                 lea.l      -28(a7),a7
[00045b74] 2f48 0018                 move.l     a0,24(a7)
[00045b78] 3f40 0016                 move.w     d0,22(a7)
[00045b7c] 3f41 0014                 move.w     d1,20(a7)
[00045b80] 2f49 0010                 move.l     a1,16(a7)
[00045b84] 2f6f 0018 000c            move.l     24(a7),12(a7)
[00045b8a] 206f 0010                 movea.l    16(a7),a0
[00045b8e] 4210                      clr.b      (a0)
[00045b90] 302f 0016                 move.w     22(a7),d0
[00045b94] 6b00 00ba                 bmi        $00045C50
[00045b98] 206f 000c                 movea.l    12(a7),a0
[00045b9c] 302f 0016                 move.w     22(a7),d0
[00045ba0] b068 0014                 cmp.w      20(a0),d0
[00045ba4] 6c00 00aa                 bge        $00045C50
[00045ba8] 302f 0016                 move.w     22(a7),d0
[00045bac] 48c0                      ext.l      d0
[00045bae] e588                      lsl.l      #2,d0
[00045bb0] 206f 000c                 movea.l    12(a7),a0
[00045bb4] 2068 0016                 movea.l    22(a0),a0
[00045bb8] 2f70 0800 0008            move.l     0(a0,d0.l),8(a7)
[00045bbe] 302f 0014                 move.w     20(a7),d0
[00045bc2] 6b00 008c                 bmi        $00045C50
[00045bc6] 206f 0008                 movea.l    8(a7),a0
[00045bca] 302f 0014                 move.w     20(a7),d0
[00045bce] b068 0004                 cmp.w      4(a0),d0
[00045bd2] 6c00 007c                 bge.w      $00045C50
[00045bd6] 322f 0014                 move.w     20(a7),d1
[00045bda] 302f 0016                 move.w     22(a7),d0
[00045bde] 206f 0018                 movea.l    24(a7),a0
[00045be2] 4eb9 0004 5c5a            jsr        Acfg_strIsComment
[00045be8] 4a40                      tst.w      d0
[00045bea] 672a                      beq.s      $00045C16
[00045bec] 302f 0014                 move.w     20(a7),d0
[00045bf0] 48c0                      ext.l      d0
[00045bf2] e588                      lsl.l      #2,d0
[00045bf4] 206f 0008                 movea.l    8(a7),a0
[00045bf8] 2068 0006                 movea.l    6(a0),a0
[00045bfc] 2270 0800                 movea.l    0(a0,d0.l),a1
[00045c00] 206f 0010                 movea.l    16(a7),a0
[00045c04] 4eb9 0008 2f0c            jsr        strcpy
[00045c0a] 206f 0010                 movea.l    16(a7),a0
[00045c0e] 4eb9 0004 663c            jsr        Ast_alltrim
[00045c14] 603a                      bra.s      $00045C50
[00045c16] 302f 0014                 move.w     20(a7),d0
[00045c1a] 48c0                      ext.l      d0
[00045c1c] e588                      lsl.l      #2,d0
[00045c1e] 206f 0008                 movea.l    8(a7),a0
[00045c22] 2068 0006                 movea.l    6(a0),a0
[00045c26] 2eb0 0800                 move.l     0(a0,d0.l),(a7)
[00045c2a] 703d                      moveq.l    #61,d0
[00045c2c] 2057                      movea.l    (a7),a0
[00045c2e] 4eb9 0008 2e8a            jsr        strchr
[00045c34] 2f48 0004                 move.l     a0,4(a7)
[00045c38] 202f 0004                 move.l     4(a7),d0
[00045c3c] 6712                      beq.s      $00045C50
[00045c3e] 52af 0004                 addq.l     #1,4(a7)
[00045c42] 226f 0004                 movea.l    4(a7),a1
[00045c46] 206f 0010                 movea.l    16(a7),a0
[00045c4a] 4eb9 0008 2f0c            jsr        strcpy
[00045c50] 206f 0010                 movea.l    16(a7),a0
[00045c54] 4fef 001c                 lea.l      28(a7),a7
[00045c58] 4e75                      rts
Acfg_strIsComment:
[00045c5a] 4fef ffea                 lea.l      -22(a7),a7
[00045c5e] 2f48 0012                 move.l     a0,18(a7)
[00045c62] 3f40 0010                 move.w     d0,16(a7)
[00045c66] 3f41 000e                 move.w     d1,14(a7)
[00045c6a] 2f6f 0012 000a            move.l     18(a7),10(a7)
[00045c70] 4257                      clr.w      (a7)
[00045c72] 302f 0010                 move.w     16(a7),d0
[00045c76] 6b00 0096                 bmi        $00045D0E
[00045c7a] 206f 000a                 movea.l    10(a7),a0
[00045c7e] 302f 0010                 move.w     16(a7),d0
[00045c82] b068 0014                 cmp.w      20(a0),d0
[00045c86] 6c00 0086                 bge        $00045D0E
[00045c8a] 302f 0010                 move.w     16(a7),d0
[00045c8e] 48c0                      ext.l      d0
[00045c90] e588                      lsl.l      #2,d0
[00045c92] 206f 000a                 movea.l    10(a7),a0
[00045c96] 2068 0016                 movea.l    22(a0),a0
[00045c9a] 2f70 0800 0006            move.l     0(a0,d0.l),6(a7)
[00045ca0] 302f 000e                 move.w     14(a7),d0
[00045ca4] 6b68                      bmi.s      $00045D0E
[00045ca6] 206f 0006                 movea.l    6(a7),a0
[00045caa] 302f 000e                 move.w     14(a7),d0
[00045cae] b068 0004                 cmp.w      4(a0),d0
[00045cb2] 6c5a                      bge.s      $00045D0E
[00045cb4] 302f 000e                 move.w     14(a7),d0
[00045cb8] 48c0                      ext.l      d0
[00045cba] e588                      lsl.l      #2,d0
[00045cbc] 206f 0006                 movea.l    6(a7),a0
[00045cc0] 2068 0006                 movea.l    6(a0),a0
[00045cc4] 2f70 0800 0002            move.l     0(a0,d0.l),2(a7)
[00045cca] 6004                      bra.s      $00045CD0
[00045ccc] 52af 0002                 addq.l     #1,2(a7)
[00045cd0] 206f 0002                 movea.l    2(a7),a0
[00045cd4] 1010                      move.b     (a0),d0
[00045cd6] 6710                      beq.s      $00045CE8
[00045cd8] 206f 0002                 movea.l    2(a7),a0
[00045cdc] 1010                      move.b     (a0),d0
[00045cde] 4eb9 0004 69d0            jsr        Ach_isWhite
[00045ce4] 4a40                      tst.w      d0
[00045ce6] 66e4                      bne.s      $00045CCC
[00045ce8] 206f 0002                 movea.l    2(a7),a0
[00045cec] 1010                      move.b     (a0),d0
[00045cee] 671e                      beq.s      $00045D0E
[00045cf0] 206f 0002                 movea.l    2(a7),a0
[00045cf4] 1010                      move.b     (a0),d0
[00045cf6] 4880                      ext.w      d0
[00045cf8] 206f 000a                 movea.l    10(a7),a0
[00045cfc] 2068 0004                 movea.l    4(a0),a0
[00045d00] 4eb9 0008 2e8a            jsr        strchr
[00045d06] 2008                      move.l     a0,d0
[00045d08] 6704                      beq.s      $00045D0E
[00045d0a] 3ebc 0001                 move.w     #$0001,(a7)
[00045d0e] 3017                      move.w     (a7),d0
[00045d10] 4fef 0016                 lea.l      22(a7),a7
[00045d14] 4e75                      rts
Acfg_clearHeader:
[00045d16] 4fef fff6                 lea.l      -10(a7),a7
[00045d1a] 2f48 0006                 move.l     a0,6(a7)
[00045d1e] 2f6f 0006 0002            move.l     6(a7),2(a7)
[00045d24] 4257                      clr.w      (a7)
[00045d26] 601a                      bra.s      $00045D42
[00045d28] 3017                      move.w     (a7),d0
[00045d2a] 48c0                      ext.l      d0
[00045d2c] e588                      lsl.l      #2,d0
[00045d2e] 206f 0002                 movea.l    2(a7),a0
[00045d32] 2068 001e                 movea.l    30(a0),a0
[00045d36] 2070 0800                 movea.l    0(a0,d0.l),a0
[00045d3a] 4eb9 0004 649c            jsr        Ast_delete
[00045d40] 5257                      addq.w     #1,(a7)
[00045d42] 206f 0002                 movea.l    2(a7),a0
[00045d46] 3017                      move.w     (a7),d0
[00045d48] b068 001c                 cmp.w      28(a0),d0
[00045d4c] 6dda                      blt.s      $00045D28
[00045d4e] 206f 0002                 movea.l    2(a7),a0
[00045d52] 2068 001e                 movea.l    30(a0),a0
[00045d56] 4eb9 0004 c7c8            jsr        Ax_free
[00045d5c] 206f 0002                 movea.l    2(a7),a0
[00045d60] 42a8 001e                 clr.l      30(a0)
[00045d64] 206f 0002                 movea.l    2(a7),a0
[00045d68] 4268 001c                 clr.w      28(a0)
[00045d6c] 4fef 000a                 lea.l      10(a7),a7
[00045d70] 4e75                      rts
Acfg_headAnzahl:
[00045d72] 594f                      subq.w     #4,a7
[00045d74] 2e88                      move.l     a0,(a7)
[00045d76] 2057                      movea.l    (a7),a0
[00045d78] 3028 001c                 move.w     28(a0),d0
[00045d7c] 584f                      addq.w     #4,a7
[00045d7e] 4e75                      rts
Acfg_setHeader:
[00045d80] 4fef ffec                 lea.l      -20(a7),a7
[00045d84] 2f48 0010                 move.l     a0,16(a7)
[00045d88] 3f40 000e                 move.w     d0,14(a7)
[00045d8c] 2f49 000a                 move.l     a1,10(a7)
[00045d90] 2f6f 0010 0006            move.l     16(a7),6(a7)
[00045d96] 206f 0010                 movea.l    16(a7),a0
[00045d9a] 6100 ff7a                 bsr        Acfg_clearHeader
[00045d9e] 302f 000e                 move.w     14(a7),d0
[00045da2] 48c0                      ext.l      d0
[00045da4] e588                      lsl.l      #2,d0
[00045da6] 4eb9 0004 c608            jsr        Ax_malloc
[00045dac] 2e88                      move.l     a0,(a7)
[00045dae] 2017                      move.l     (a7),d0
[00045db0] 6604                      bne.s      $00045DB6
[00045db2] 91c8                      suba.l     a0,a0
[00045db4] 6066                      bra.s      $00045E1C
[00045db6] 322f 000e                 move.w     14(a7),d1
[00045dba] 48c1                      ext.l      d1
[00045dbc] e589                      lsl.l      #2,d1
[00045dbe] 4240                      clr.w      d0
[00045dc0] 2057                      movea.l    (a7),a0
[00045dc2] 4eb9 0008 36ea            jsr        memset
[00045dc8] 206f 0006                 movea.l    6(a7),a0
[00045dcc] 316f 000e 001c            move.w     14(a7),28(a0)
[00045dd2] 206f 0006                 movea.l    6(a7),a0
[00045dd6] 2157 001e                 move.l     (a7),30(a0)
[00045dda] 426f 0004                 clr.w      4(a7)
[00045dde] 602e                      bra.s      $00045E0E
[00045de0] 302f 0004                 move.w     4(a7),d0
[00045de4] 48c0                      ext.l      d0
[00045de6] e588                      lsl.l      #2,d0
[00045de8] 206f 000a                 movea.l    10(a7),a0
[00045dec] 2070 0800                 movea.l    0(a0,d0.l),a0
[00045df0] 4eb9 0004 643c            jsr        Ast_create
[00045df6] 4eb9 0004 663c            jsr        Ast_alltrim
[00045dfc] 302f 0004                 move.w     4(a7),d0
[00045e00] 48c0                      ext.l      d0
[00045e02] e588                      lsl.l      #2,d0
[00045e04] 2257                      movea.l    (a7),a1
[00045e06] 2388 0800                 move.l     a0,0(a1,d0.l)
[00045e0a] 526f 0004                 addq.w     #1,4(a7)
[00045e0e] 302f 0004                 move.w     4(a7),d0
[00045e12] b06f 000e                 cmp.w      14(a7),d0
[00045e16] 6dc8                      blt.s      $00045DE0
[00045e18] 206f 000a                 movea.l    10(a7),a0
[00045e1c] 4fef 0014                 lea.l      20(a7),a7
[00045e20] 4e75                      rts
Acfg_getHeader:
[00045e22] 4fef fff2                 lea.l      -14(a7),a7
[00045e26] 2f48 000a                 move.l     a0,10(a7)
[00045e2a] 2f49 0006                 move.l     a1,6(a7)
[00045e2e] 2f6f 000a 0002            move.l     10(a7),2(a7)
[00045e34] 4257                      clr.w      (a7)
[00045e36] 602e                      bra.s      $00045E66
[00045e38] 3017                      move.w     (a7),d0
[00045e3a] 48c0                      ext.l      d0
[00045e3c] e588                      lsl.l      #2,d0
[00045e3e] 206f 0002                 movea.l    2(a7),a0
[00045e42] 2068 001e                 movea.l    30(a0),a0
[00045e46] 2070 0800                 movea.l    0(a0,d0.l),a0
[00045e4a] 4eb9 0004 643c            jsr        Ast_create
[00045e50] 4eb9 0004 663c            jsr        Ast_alltrim
[00045e56] 3017                      move.w     (a7),d0
[00045e58] 48c0                      ext.l      d0
[00045e5a] e588                      lsl.l      #2,d0
[00045e5c] 226f 0006                 movea.l    6(a7),a1
[00045e60] 2388 0800                 move.l     a0,0(a1,d0.l)
[00045e64] 5257                      addq.w     #1,(a7)
[00045e66] 206f 0002                 movea.l    2(a7),a0
[00045e6a] 3017                      move.w     (a7),d0
[00045e6c] b068 001c                 cmp.w      28(a0),d0
[00045e70] 6dc6                      blt.s      $00045E38
[00045e72] 206f 0006                 movea.l    6(a7),a0
[00045e76] 4fef 000e                 lea.l      14(a7),a7
[00045e7a] 4e75                      rts
Acfg_isCfgfile:
[00045e7c] 4fef fff4                 lea.l      -12(a7),a7
[00045e80] 2f48 0008                 move.l     a0,8(a7)
[00045e84] 2f49 0004                 move.l     a1,4(a7)
[00045e88] 2eaf 0008                 move.l     8(a7),(a7)
[00045e8c] 2057                      movea.l    (a7),a0
[00045e8e] 3028 000e                 move.w     14(a0),d0
[00045e92] 6712                      beq.s      $00045EA6
[00045e94] 226f 0004                 movea.l    4(a7),a1
[00045e98] 2057                      movea.l    (a7),a0
[00045e9a] 2050                      movea.l    (a0),a0
[00045e9c] 4eb9 0004 665a            jsr        Ast_cmp
[00045ea2] 6012                      bra.s      $00045EB6
[00045ea4] 6010                      bra.s      $00045EB6
[00045ea6] 226f 0004                 movea.l    4(a7),a1
[00045eaa] 2057                      movea.l    (a7),a0
[00045eac] 2050                      movea.l    (a0),a0
[00045eae] 4eb9 0004 66ea            jsr        Ast_icmp
[00045eb4] 4e71                      nop
[00045eb6] 4fef 000c                 lea.l      12(a7),a7
[00045eba] 4e75                      rts
InitCfgSearch:
[00045ebc] 514f                      subq.w     #8,a7
[00045ebe] 2f48 0004                 move.l     a0,4(a7)
[00045ec2] 2e89                      move.l     a1,(a7)
[00045ec4] 42a7                      clr.l      -(a7)
[00045ec6] 43f9 000e 05d5            lea.l      $000E05D5,a1
[00045ecc] 2f09                      move.l     a1,-(a7)
[00045ece] 206f 0008                 movea.l    8(a7),a0
[00045ed2] 4eb9 0004 643c            jsr        Ast_create
[00045ed8] 4eb9 0004 663c            jsr        Ast_alltrim
[00045ede] 225f                      movea.l    (a7)+,a1
[00045ee0] 4eb9 0004 6c4e            jsr        Ast_filter
[00045ee6] 584f                      addq.w     #4,a7
[00045ee8] 226f 0004                 movea.l    4(a7),a1
[00045eec] 2288                      move.l     a0,(a1)
[00045eee] 206f 0004                 movea.l    4(a7),a0
[00045ef2] 42a8 0004                 clr.l      4(a0)
[00045ef6] 42a7                      clr.l      -(a7)
[00045ef8] 43f9 000e 05d8            lea.l      $000E05D8,a1
[00045efe] 2f09                      move.l     a1,-(a7)
[00045f00] 206f 0014                 movea.l    20(a7),a0
[00045f04] 4eb9 0004 643c            jsr        Ast_create
[00045f0a] 4eb9 0004 663c            jsr        Ast_alltrim
[00045f10] 225f                      movea.l    (a7)+,a1
[00045f12] 4eb9 0004 6c4e            jsr        Ast_filter
[00045f18] 584f                      addq.w     #4,a7
[00045f1a] 226f 0004                 movea.l    4(a7),a1
[00045f1e] 2348 0008                 move.l     a0,8(a1)
[00045f22] 206f 0004                 movea.l    4(a7),a0
[00045f26] 42a8 000c                 clr.l      12(a0)
[00045f2a] 206f 0004                 movea.l    4(a7),a0
[00045f2e] 317c ffff 0010            move.w     #$FFFF,16(a0)
[00045f34] 206f 0004                 movea.l    4(a7),a0
[00045f38] 504f                      addq.w     #8,a7
[00045f3a] 4e75                      rts
SearchCfgString:
[00045f3c] 514f                      subq.w     #8,a7
[00045f3e] 2f48 0004                 move.l     a0,4(a7)
[00045f42] 2e89                      move.l     a1,(a7)
[00045f44] 2057                      movea.l    (a7),a0
[00045f46] 42a8 000c                 clr.l      12(a0)
[00045f4a] 2057                      movea.l    (a7),a0
[00045f4c] 317c ffff 0010            move.w     #$FFFF,16(a0)
[00045f52] 2257                      movea.l    (a7),a1
[00045f54] 206f 0004                 movea.l    4(a7),a0
[00045f58] 4eb9 0004 6050            jsr        SearchGruppe
[00045f5e] 2257                      movea.l    (a7),a1
[00045f60] 2348 0004                 move.l     a0,4(a1)
[00045f64] 2057                      movea.l    (a7),a0
[00045f66] 2028 0004                 move.l     4(a0),d0
[00045f6a] 6726                      beq.s      $00045F92
[00045f6c] 2057                      movea.l    (a7),a0
[00045f6e] 2068 0004                 movea.l    4(a0),a0
[00045f72] 2f28 0006                 move.l     6(a0),-(a7)
[00045f76] 206f 0004                 movea.l    4(a7),a0
[00045f7a] 2068 0004                 movea.l    4(a0),a0
[00045f7e] 3028 0004                 move.w     4(a0),d0
[00045f82] 226f 0004                 movea.l    4(a7),a1
[00045f86] 206f 0008                 movea.l    8(a7),a0
[00045f8a] 4eb9 0004 5f96            jsr        SearchCfgNameInStrings
[00045f90] 584f                      addq.w     #4,a7
[00045f92] 504f                      addq.w     #8,a7
[00045f94] 4e75                      rts
SearchCfgNameInStrings:
[00045f96] 4fef ffec                 lea.l      -20(a7),a7
[00045f9a] 2f48 0010                 move.l     a0,16(a7)
[00045f9e] 2f49 000c                 move.l     a1,12(a7)
[00045fa2] 3f40 000a                 move.w     d0,10(a7)
[00045fa6] 4297                      clr.l      (a7)
[00045fa8] 302f 000a                 move.w     10(a7),d0
[00045fac] 6f06                      ble.s      $00045FB4
[00045fae] 202f 0018                 move.l     24(a7),d0
[00045fb2] 6612                      bne.s      $00045FC6
[00045fb4] 0c6f ffff 000a            cmpi.w     #$FFFF,10(a7)
[00045fba] 6600 008e                 bne        $0004604A
[00045fbe] 202f 0018                 move.l     24(a7),d0
[00045fc2] 6700 0086                 beq        $0004604A
[00045fc6] 426f 0008                 clr.w      8(a7)
[00045fca] 2eaf 0018                 move.l     24(a7),(a7)
[00045fce] 42af 0004                 clr.l      4(a7)
[00045fd2] 6036                      bra.s      $0004600A
[00045fd4] 2057                      movea.l    (a7),a0
[00045fd6] 2010                      move.l     (a0),d0
[00045fd8] 672a                      beq.s      $00046004
[00045fda] 2057                      movea.l    (a7),a0
[00045fdc] 2050                      movea.l    (a0),a0
[00045fde] 1010                      move.b     (a0),d0
[00045fe0] 6722                      beq.s      $00046004
[00045fe2] 2f2f 000c                 move.l     12(a7),-(a7)
[00045fe6] 206f 0004                 movea.l    4(a7),a0
[00045fea] 2250                      movea.l    (a0),a1
[00045fec] 206f 0014                 movea.l    20(a7),a0
[00045ff0] 4eb9 0004 6102            jsr        SearchCfgName
[00045ff6] 584f                      addq.w     #4,a7
[00045ff8] 2f48 0004                 move.l     a0,4(a7)
[00045ffc] 202f 0004                 move.l     4(a7),d0
[00046000] 6702                      beq.s      $00046004
[00046002] 602c                      bra.s      $00046030
[00046004] 526f 0008                 addq.w     #1,8(a7)
[00046008] 5897                      addq.l     #4,(a7)
[0004600a] 302f 000a                 move.w     10(a7),d0
[0004600e] 6f0a                      ble.s      $0004601A
[00046010] 302f 0008                 move.w     8(a7),d0
[00046014] b06f 000a                 cmp.w      10(a7),d0
[00046018] 6dba                      blt.s      $00045FD4
[0004601a] 0c6f ffff 000a            cmpi.w     #$FFFF,10(a7)
[00046020] 660e                      bne.s      $00046030
[00046022] 2057                      movea.l    (a7),a0
[00046024] 2010                      move.l     (a0),d0
[00046026] 6708                      beq.s      $00046030
[00046028] 2057                      movea.l    (a7),a0
[0004602a] 2050                      movea.l    (a0),a0
[0004602c] 1010                      move.b     (a0),d0
[0004602e] 66a4                      bne.s      $00045FD4
[00046030] 202f 0004                 move.l     4(a7),d0
[00046034] 6714                      beq.s      $0004604A
[00046036] 206f 000c                 movea.l    12(a7),a0
[0004603a] 216f 0004 000c            move.l     4(a7),12(a0)
[00046040] 206f 000c                 movea.l    12(a7),a0
[00046044] 316f 0008 0010            move.w     8(a7),16(a0)
[0004604a] 4fef 0014                 lea.l      20(a7),a7
[0004604e] 4e75                      rts
SearchGruppe:
[00046050] 4fef fff0                 lea.l      -16(a7),a7
[00046054] 2f48 000c                 move.l     a0,12(a7)
[00046058] 2f49 0008                 move.l     a1,8(a7)
[0004605c] 202f 0008                 move.l     8(a7),d0
[00046060] 6606                      bne.s      $00046068
[00046062] 91c8                      suba.l     a0,a0
[00046064] 6000 0096                 bra        $000460FC
[00046068] 426f 0004                 clr.w      4(a7)
[0004606c] 426f 0006                 clr.w      6(a7)
[00046070] 6068                      bra.s      $000460DA
[00046072] 302f 0006                 move.w     6(a7),d0
[00046076] 48c0                      ext.l      d0
[00046078] e588                      lsl.l      #2,d0
[0004607a] 206f 000c                 movea.l    12(a7),a0
[0004607e] 2068 0016                 movea.l    22(a0),a0
[00046082] 2eb0 0800                 move.l     0(a0,d0.l),(a7)
[00046086] 206f 000c                 movea.l    12(a7),a0
[0004608a] 3028 000c                 move.w     12(a0),d0
[0004608e] 6720                      beq.s      $000460B0
[00046090] 206f 0008                 movea.l    8(a7),a0
[00046094] 2250                      movea.l    (a0),a1
[00046096] 2057                      movea.l    (a7),a0
[00046098] 2050                      movea.l    (a0),a0
[0004609a] 4eb9 0004 665a            jsr        Ast_cmp
[000460a0] 4a40                      tst.w      d0
[000460a2] 6604                      bne.s      $000460A8
[000460a4] 7001                      moveq.l    #1,d0
[000460a6] 6002                      bra.s      $000460AA
[000460a8] 4240                      clr.w      d0
[000460aa] 3f40 0004                 move.w     d0,4(a7)
[000460ae] 601e                      bra.s      $000460CE
[000460b0] 206f 0008                 movea.l    8(a7),a0
[000460b4] 2250                      movea.l    (a0),a1
[000460b6] 2057                      movea.l    (a7),a0
[000460b8] 2050                      movea.l    (a0),a0
[000460ba] 4eb9 0004 66ea            jsr        Ast_icmp
[000460c0] 4a40                      tst.w      d0
[000460c2] 6604                      bne.s      $000460C8
[000460c4] 7001                      moveq.l    #1,d0
[000460c6] 6002                      bra.s      $000460CA
[000460c8] 4240                      clr.w      d0
[000460ca] 3f40 0004                 move.w     d0,4(a7)
[000460ce] 302f 0004                 move.w     4(a7),d0
[000460d2] 6702                      beq.s      $000460D6
[000460d4] 601a                      bra.s      $000460F0
[000460d6] 526f 0006                 addq.w     #1,6(a7)
[000460da] 302f 0004                 move.w     4(a7),d0
[000460de] 6610                      bne.s      $000460F0
[000460e0] 206f 000c                 movea.l    12(a7),a0
[000460e4] 302f 0006                 move.w     6(a7),d0
[000460e8] b068 0014                 cmp.w      20(a0),d0
[000460ec] 6d00 ff84                 blt.w      $00046072
[000460f0] 302f 0004                 move.w     4(a7),d0
[000460f4] 6704                      beq.s      $000460FA
[000460f6] 2057                      movea.l    (a7),a0
[000460f8] 6002                      bra.s      $000460FC
[000460fa] 91c8                      suba.l     a0,a0
[000460fc] 4fef 0010                 lea.l      16(a7),a7
[00046100] 4e75                      rts
SearchCfgName:
[00046102] 4fef ffee                 lea.l      -18(a7),a7
[00046106] 2f48 000e                 move.l     a0,14(a7)
[0004610a] 2f49 000a                 move.l     a1,10(a7)
[0004610e] 2f6f 000a 0004            move.l     10(a7),4(a7)
[00046114] 6004                      bra.s      $0004611A
[00046116] 52af 0004                 addq.l     #1,4(a7)
[0004611a] 206f 0004                 movea.l    4(a7),a0
[0004611e] 1010                      move.b     (a0),d0
[00046120] 6710                      beq.s      $00046132
[00046122] 206f 0004                 movea.l    4(a7),a0
[00046126] 1010                      move.b     (a0),d0
[00046128] 4eb9 0004 69d0            jsr        Ach_isWhite
[0004612e] 4a40                      tst.w      d0
[00046130] 66e4                      bne.s      $00046116
[00046132] 206f 0004                 movea.l    4(a7),a0
[00046136] 1010                      move.b     (a0),d0
[00046138] 6720                      beq.s      $0004615A
[0004613a] 206f 0004                 movea.l    4(a7),a0
[0004613e] 1010                      move.b     (a0),d0
[00046140] 4880                      ext.w      d0
[00046142] 206f 000e                 movea.l    14(a7),a0
[00046146] 2068 0004                 movea.l    4(a0),a0
[0004614a] 4eb9 0008 2e8a            jsr        strchr
[00046150] 2008                      move.l     a0,d0
[00046152] 6706                      beq.s      $0004615A
[00046154] 91c8                      suba.l     a0,a0
[00046156] 6000 00e0                 bra        $00046238
[0004615a] 206f 0016                 movea.l    22(a7),a0
[0004615e] 2ea8 0008                 move.l     8(a0),(a7)
[00046162] 3f7c 0001 0008            move.w     #$0001,8(a7)
[00046168] 604e                      bra.s      $000461B8
[0004616a] 206f 000e                 movea.l    14(a7),a0
[0004616e] 3028 000c                 move.w     12(a0),d0
[00046172] 6718                      beq.s      $0004618C
[00046174] 206f 0004                 movea.l    4(a7),a0
[00046178] 1010                      move.b     (a0),d0
[0004617a] 2057                      movea.l    (a7),a0
[0004617c] b010                      cmp.b      (a0),d0
[0004617e] 6604                      bne.s      $00046184
[00046180] 7001                      moveq.l    #1,d0
[00046182] 6002                      bra.s      $00046186
[00046184] 4240                      clr.w      d0
[00046186] 3f40 0008                 move.w     d0,8(a7)
[0004618a] 6026                      bra.s      $000461B2
[0004618c] 2057                      movea.l    (a7),a0
[0004618e] 1010                      move.b     (a0),d0
[00046190] 4eb9 0004 64b6            jsr        Ach_toupper
[00046196] 1f00                      move.b     d0,-(a7)
[00046198] 206f 0006                 movea.l    6(a7),a0
[0004619c] 1010                      move.b     (a0),d0
[0004619e] 4eb9 0004 64b6            jsr        Ach_toupper
[000461a4] b01f                      cmp.b      (a7)+,d0
[000461a6] 6604                      bne.s      $000461AC
[000461a8] 7001                      moveq.l    #1,d0
[000461aa] 6002                      bra.s      $000461AE
[000461ac] 4240                      clr.w      d0
[000461ae] 3f40 0008                 move.w     d0,8(a7)
[000461b2] 5297                      addq.l     #1,(a7)
[000461b4] 52af 0004                 addq.l     #1,4(a7)
[000461b8] 302f 0008                 move.w     8(a7),d0
[000461bc] 6718                      beq.s      $000461D6
[000461be] 2057                      movea.l    (a7),a0
[000461c0] 1010                      move.b     (a0),d0
[000461c2] 6712                      beq.s      $000461D6
[000461c4] 206f 0004                 movea.l    4(a7),a0
[000461c8] 0c10 003d                 cmpi.b     #$3D,(a0)
[000461cc] 6708                      beq.s      $000461D6
[000461ce] 206f 0004                 movea.l    4(a7),a0
[000461d2] 1010                      move.b     (a0),d0
[000461d4] 6694                      bne.s      $0004616A
[000461d6] 6004                      bra.s      $000461DC
[000461d8] 52af 0004                 addq.l     #1,4(a7)
[000461dc] 302f 0008                 move.w     8(a7),d0
[000461e0] 6722                      beq.s      $00046204
[000461e2] 206f 0004                 movea.l    4(a7),a0
[000461e6] 1010                      move.b     (a0),d0
[000461e8] 671a                      beq.s      $00046204
[000461ea] 206f 0004                 movea.l    4(a7),a0
[000461ee] 1010                      move.b     (a0),d0
[000461f0] 4eb9 0004 69d0            jsr        Ach_isWhite
[000461f6] 4a40                      tst.w      d0
[000461f8] 670a                      beq.s      $00046204
[000461fa] 206f 0004                 movea.l    4(a7),a0
[000461fe] 0c10 003d                 cmpi.b     #$3D,(a0)
[00046202] 66d4                      bne.s      $000461D8
[00046204] 302f 0008                 move.w     8(a7),d0
[00046208] 6722                      beq.s      $0004622C
[0004620a] 206f 0004                 movea.l    4(a7),a0
[0004620e] 1010                      move.b     (a0),d0
[00046210] 671a                      beq.s      $0004622C
[00046212] 206f 0004                 movea.l    4(a7),a0
[00046216] 0c10 003d                 cmpi.b     #$3D,(a0)
[0004621a] 6610                      bne.s      $0004622C
[0004621c] 206f 0004                 movea.l    4(a7),a0
[00046220] 0c10 003d                 cmpi.b     #$3D,(a0)
[00046224] 660a                      bne.s      $00046230
[00046226] 2057                      movea.l    (a7),a0
[00046228] 1010                      move.b     (a0),d0
[0004622a] 6704                      beq.s      $00046230
[0004622c] 91c8                      suba.l     a0,a0
[0004622e] 6008                      bra.s      $00046238
[00046230] 52af 0004                 addq.l     #1,4(a7)
[00046234] 206f 0004                 movea.l    4(a7),a0
[00046238] 4fef 0012                 lea.l      18(a7),a7
[0004623c] 4e75                      rts
CreateCfgGruppe:
[0004623e] 4fef ffee                 lea.l      -18(a7),a7
[00046242] 2f48 000e                 move.l     a0,14(a7)
[00046246] 2f49 000a                 move.l     a1,10(a7)
[0004624a] 700a                      moveq.l    #10,d0
[0004624c] 4eb9 0004 c608            jsr        Ax_malloc
[00046252] 2f48 0006                 move.l     a0,6(a7)
[00046256] 202f 0006                 move.l     6(a7),d0
[0004625a] 6606                      bne.s      $00046262
[0004625c] 91c8                      suba.l     a0,a0
[0004625e] 6000 00c0                 bra        $00046320
[00046262] 206f 0006                 movea.l    6(a7),a0
[00046266] 4268 0004                 clr.w      4(a0)
[0004626a] 206f 0006                 movea.l    6(a7),a0
[0004626e] 42a8 0006                 clr.l      6(a0)
[00046272] 206f 000a                 movea.l    10(a7),a0
[00046276] 4eb9 0004 643c            jsr        Ast_create
[0004627c] 226f 0006                 movea.l    6(a7),a1
[00046280] 2288                      move.l     a0,(a1)
[00046282] 206f 0006                 movea.l    6(a7),a0
[00046286] 2010                      move.l     (a0),d0
[00046288] 6610                      bne.s      $0004629A
[0004628a] 206f 0006                 movea.l    6(a7),a0
[0004628e] 4eb9 0004 c7c8            jsr        Ax_free
[00046294] 91c8                      suba.l     a0,a0
[00046296] 6000 0088                 bra        $00046320
[0004629a] 206f 000e                 movea.l    14(a7),a0
[0004629e] 3ea8 0014                 move.w     20(a0),(a7)
[000462a2] 7001                      moveq.l    #1,d0
[000462a4] d057                      add.w      (a7),d0
[000462a6] 48c0                      ext.l      d0
[000462a8] e588                      lsl.l      #2,d0
[000462aa] 4eb9 0004 c608            jsr        Ax_malloc
[000462b0] 2f48 0002                 move.l     a0,2(a7)
[000462b4] 202f 0002                 move.l     2(a7),d0
[000462b8] 661a                      bne.s      $000462D4
[000462ba] 206f 0006                 movea.l    6(a7),a0
[000462be] 2050                      movea.l    (a0),a0
[000462c0] 4eb9 0004 649c            jsr        Ast_delete
[000462c6] 206f 0006                 movea.l    6(a7),a0
[000462ca] 4eb9 0004 c7c8            jsr        Ax_free
[000462d0] 91c8                      suba.l     a0,a0
[000462d2] 604c                      bra.s      $00046320
[000462d4] 3017                      move.w     (a7),d0
[000462d6] 48c0                      ext.l      d0
[000462d8] e588                      lsl.l      #2,d0
[000462da] 206f 000e                 movea.l    14(a7),a0
[000462de] 2268 0016                 movea.l    22(a0),a1
[000462e2] 206f 0002                 movea.l    2(a7),a0
[000462e6] 4eb9 0008 3500            jsr        memcpy
[000462ec] 3017                      move.w     (a7),d0
[000462ee] 48c0                      ext.l      d0
[000462f0] e588                      lsl.l      #2,d0
[000462f2] 206f 0002                 movea.l    2(a7),a0
[000462f6] 21af 0006 0800            move.l     6(a7),0(a0,d0.l)
[000462fc] 206f 000e                 movea.l    14(a7),a0
[00046300] 2068 0016                 movea.l    22(a0),a0
[00046304] 4eb9 0004 c7c8            jsr        Ax_free
[0004630a] 206f 000e                 movea.l    14(a7),a0
[0004630e] 216f 0002 0016            move.l     2(a7),22(a0)
[00046314] 206f 000e                 movea.l    14(a7),a0
[00046318] 5268 0014                 addq.w     #1,20(a0)
[0004631c] 206f 0006                 movea.l    6(a7),a0
[00046320] 4fef 0012                 lea.l      18(a7),a7
[00046324] 4e75                      rts
CreateCfgString:
[00046326] 4fef fff2                 lea.l      -14(a7),a7
[0004632a] 2f48 000a                 move.l     a0,10(a7)
[0004632e] 2f49 0006                 move.l     a1,6(a7)
[00046332] 206f 000a                 movea.l    10(a7),a0
[00046336] 3f68 0004 0004            move.w     4(a0),4(a7)
[0004633c] 7001                      moveq.l    #1,d0
[0004633e] d06f 0004                 add.w      4(a7),d0
[00046342] 48c0                      ext.l      d0
[00046344] e588                      lsl.l      #2,d0
[00046346] 4eb9 0004 c608            jsr        Ax_malloc
[0004634c] 2e88                      move.l     a0,(a7)
[0004634e] 2017                      move.l     (a7),d0
[00046350] 6604                      bne.s      $00046356
[00046352] 4240                      clr.w      d0
[00046354] 6048                      bra.s      $0004639E
[00046356] 302f 0004                 move.w     4(a7),d0
[0004635a] 48c0                      ext.l      d0
[0004635c] e588                      lsl.l      #2,d0
[0004635e] 206f 000a                 movea.l    10(a7),a0
[00046362] 2268 0006                 movea.l    6(a0),a1
[00046366] 2057                      movea.l    (a7),a0
[00046368] 4eb9 0008 3500            jsr        memcpy
[0004636e] 302f 0004                 move.w     4(a7),d0
[00046372] 48c0                      ext.l      d0
[00046374] e588                      lsl.l      #2,d0
[00046376] 2057                      movea.l    (a7),a0
[00046378] 21af 0006 0800            move.l     6(a7),0(a0,d0.l)
[0004637e] 206f 000a                 movea.l    10(a7),a0
[00046382] 2068 0006                 movea.l    6(a0),a0
[00046386] 4eb9 0004 c7c8            jsr        Ax_free
[0004638c] 206f 000a                 movea.l    10(a7),a0
[00046390] 2157 0006                 move.l     (a7),6(a0)
[00046394] 206f 000a                 movea.l    10(a7),a0
[00046398] 5268 0004                 addq.w     #1,4(a0)
[0004639c] 7001                      moveq.l    #1,d0
[0004639e] 4fef 000e                 lea.l      14(a7),a7
[000463a2] 4e75                      rts
DeleteCfgString:
[000463a4] 4fef ffee                 lea.l      -18(a7),a7
[000463a8] 2f48 000e                 move.l     a0,14(a7)
[000463ac] 3f40 000c                 move.w     d0,12(a7)
[000463b0] 70ff                      moveq.l    #-1,d0
[000463b2] 206f 000e                 movea.l    14(a7),a0
[000463b6] d068 0004                 add.w      4(a0),d0
[000463ba] 3f40 000a                 move.w     d0,10(a7)
[000463be] 302f 000a                 move.w     10(a7),d0
[000463c2] 48c0                      ext.l      d0
[000463c4] e588                      lsl.l      #2,d0
[000463c6] 4eb9 0004 c608            jsr        Ax_malloc
[000463cc] 2f48 0004                 move.l     a0,4(a7)
[000463d0] 202f 0004                 move.l     4(a7),d0
[000463d4] 6604                      bne.s      $000463DA
[000463d6] 4240                      clr.w      d0
[000463d8] 605c                      bra.s      $00046436
[000463da] 426f 0008                 clr.w      8(a7)
[000463de] 2eaf 0004                 move.l     4(a7),(a7)
[000463e2] 6026                      bra.s      $0004640A
[000463e4] 302f 0008                 move.w     8(a7),d0
[000463e8] b06f 000c                 cmp.w      12(a7),d0
[000463ec] 6718                      beq.s      $00046406
[000463ee] 302f 0008                 move.w     8(a7),d0
[000463f2] 48c0                      ext.l      d0
[000463f4] e588                      lsl.l      #2,d0
[000463f6] 206f 000e                 movea.l    14(a7),a0
[000463fa] 2068 0006                 movea.l    6(a0),a0
[000463fe] 2257                      movea.l    (a7),a1
[00046400] 5897                      addq.l     #4,(a7)
[00046402] 22b0 0800                 move.l     0(a0,d0.l),(a1)
[00046406] 526f 0008                 addq.w     #1,8(a7)
[0004640a] 302f 0008                 move.w     8(a7),d0
[0004640e] b06f 000a                 cmp.w      10(a7),d0
[00046412] 6fd0                      ble.s      $000463E4
[00046414] 206f 000e                 movea.l    14(a7),a0
[00046418] 2068 0006                 movea.l    6(a0),a0
[0004641c] 4eb9 0004 c7c8            jsr        Ax_free
[00046422] 206f 000e                 movea.l    14(a7),a0
[00046426] 216f 0004 0006            move.l     4(a7),6(a0)
[0004642c] 206f 000e                 movea.l    14(a7),a0
[00046430] 5368 0004                 subq.w     #1,4(a0)
[00046434] 7001                      moveq.l    #1,d0
[00046436] 4fef 0012                 lea.l      18(a7),a7
[0004643a] 4e75                      rts
