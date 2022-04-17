
	.globl Ax_mterm
Ax_mterm:
[000713c0] 2f0a                      move.l     a2,-(a7)
[000713c2] 2f0b                      move.l     a3,-(a7)
[000713c4] 2648                      movea.l    a0,a3
[000713c6] 45f9 000e 32dc            lea.l      oldbas,a2
[000713cc] 2012                      move.l     (a2),d0
[000713ce] 6730                      beq.s      Ax_mterm_1
[000713d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000713d6] 3228 0236                 move.w     566(a0),d1
[000713da] 6606                      bne.s      Ax_mterm_2
[000713dc] 3428 0238                 move.w     568(a0),d2
[000713e0] 670a                      beq.s      Ax_mterm_3
Ax_mterm_2:
[000713e2] 2052                      movea.l    (a2),a0
[000713e4] 4eb9 0008 0d9c            jsr        Mfree
[000713ea] 6014                      bra.s      Ax_mterm_1
Ax_mterm_3:
[000713ec] 4eb9 0004 3ef8            jsr        accgemdo
[000713f2] 2052                      movea.l    (a2),a0
[000713f4] 4eb9 0008 0d9c            jsr        Mfree
[000713fa] 4eb9 0004 3f10            jsr        oldgemdo
Ax_mterm_1:
[00071400] 248b                      move.l     a3,(a2)
[00071402] 265f                      movea.l    (a7)+,a3
[00071404] 245f                      movea.l    (a7)+,a2
[00071406] 4e75                      rts

	.globl Ash_module
Ash_module:
[00071408] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0007140c] 2648                      movea.l    a0,a3
[0007140e] 45f9 0010 ee4e            lea.l      ACSblk,a2
[00071414] 2052                      movea.l    (a2),a0
[00071416] 3028 0236                 move.w     566(a0),d0
[0007141a] 660a                      bne.s      Ash_module_1
[0007141c] 3228 0238                 move.w     568(a0),d1
[00071420] 6604                      bne.s      Ash_module_1
[00071422] 7601                      moveq.l    #1,d3
[00071424] 6002                      bra.s      Ash_module_2
Ash_module_1:
[00071426] 4243                      clr.w      d3
Ash_module_2:
[00071428] 4a43                      tst.w      d3
[0007142a] 6706                      beq.s      Ash_module_3
[0007142c] 4eb9 0004 3ef8            jsr        accgemdo
Ash_module_3:
[00071432] 4bf9 000e 32e0            lea.l      nix,a5
[00071438] 4855                      pea.l      (a5)
[0007143a] 224d                      movea.l    a5,a1
[0007143c] 204b                      movea.l    a3,a0
[0007143e] 7003                      moveq.l    #3,d0
[00071440] 4eb9 0008 0de6            jsr        Pexec
[00071446] 584f                      addq.w     #4,a7
[00071448] 2a40                      movea.l    d0,a5
[0007144a] 49ed 0100                 lea.l      256(a5),a4
[0007144e] 4a80                      tst.l      d0
[00071450] 6b00 00d4                 bmi        Ash_module_4
[00071454] b0bc 0000 ffff            cmp.l      #$0000FFFF,d0
[0007145a] 6700 00ca                 beq        Ash_module_4
[0007145e] 222d 000c                 move.l     12(a5),d1
[00071462] d2ad 0014                 add.l      20(a5),d1
[00071466] d2ad 001c                 add.l      28(a5),d1
[0007146a] d2bc 0000 0400            add.l      #$00000400,d1
[00071470] 204d                      movea.l    a5,a0
[00071472] 4240                      clr.w      d0
[00071474] 4eb9 0008 0dac            jsr        Mshrink
[0007147a] 4a40                      tst.w      d0
[0007147c] 670c                      beq.s      Ash_module_5
[0007147e] 204b                      movea.l    a3,a0
[00071480] 700f                      moveq.l    #15,d0
[00071482] 2252                      movea.l    (a2),a1
[00071484] 2269 03d6                 movea.l    982(a1),a1
[00071488] 4e91                      jsr        (a1)
Ash_module_5:
[0007148a] 0c94 4143 5336            cmpi.l     #$41435336,(a4)
[00071490] 6d0c                      blt.s      Ash_module_6
[00071492] 0c94 4143 5337            cmpi.l     #$41435337,(a4)
[00071498] 6e04                      bgt.s      Ash_module_6
[0007149a] 7801                      moveq.l    #1,d4
[0007149c] 6024                      bra.s      Ash_module_7
Ash_module_6:
[0007149e] 0c94 4143 5330            cmpi.l     #$41435330,(a4)
[000714a4] 6d08                      blt.s      Ash_module_8
[000714a6] 0c94 4143 5338            cmpi.l     #$41435338,(a4)
[000714ac] 6f24                      ble.s      Ash_module_9
Ash_module_8:
[000714ae] 0c94 4267 4e41            cmpi.l     #$42674E41,(a4)
[000714b4] 661c                      bne.s      Ash_module_9
[000714b6] 0cac 4143 5339 0004       cmpi.l     #$41435339,4(a4)
[000714be] 6612                      bne.s      Ash_module_9
[000714c0] 4244                      clr.w      d4
Ash_module_7:
[000714c2] 4a44                      tst.w      d4
[000714c4] 662c                      bne.s      Ash_module_10
[000714c6] 204c                      movea.l    a4,a0
[000714c8] 4eb9 0007 1588            jsr        PushFuncLists
[000714ce] 4a40                      tst.w      d0
[000714d0] 6620                      bne.s      Ash_module_10
Ash_module_9:
[000714d2] 204d                      movea.l    a5,a0
[000714d4] 4eb9 0008 0d9c            jsr        Mfree
[000714da] 4a43                      tst.w      d3
[000714dc] 6706                      beq.s      Ash_module_11
[000714de] 4eb9 0004 3f10            jsr        oldgemdo
Ash_module_11:
[000714e4] 204b                      movea.l    a3,a0
[000714e6] 700e                      moveq.l    #14,d0
[000714e8] 2252                      movea.l    (a2),a1
[000714ea] 2269 03d6                 movea.l    982(a1),a1
[000714ee] 4e91                      jsr        (a1)
[000714f0] 604a                      bra.s      Ash_module_12
Ash_module_10:
[000714f2] 4a43                      tst.w      d3
[000714f4] 6706                      beq.s      Ash_module_13
[000714f6] 4eb9 0004 3f10            jsr        oldgemdo
Ash_module_13:
[000714fc] 4a44                      tst.w      d4
[000714fe] 6640                      bne.s      Ash_module_14
[00071500] 42a7                      clr.l      -(a7)
[00071502] 224d                      movea.l    a5,a1
[00071504] 91c8                      suba.l     a0,a0
[00071506] 7004                      moveq.l    #4,d0
[00071508] 4eb9 0008 0de6            jsr        Pexec
[0007150e] 584f                      addq.w     #4,a7
[00071510] 4a80                      tst.l      d0
[00071512] 672c                      beq.s      Ash_module_14
[00071514] 4a43                      tst.w      d3
[00071516] 6706                      beq.s      Ash_module_15
[00071518] 4eb9 0004 3ef8            jsr        accgemdo
Ash_module_15:
[0007151e] 204d                      movea.l    a5,a0
[00071520] 4eb9 0008 0d9c            jsr        Mfree
Ash_module_4:
[00071526] 4a43                      tst.w      d3
[00071528] 6706                      beq.s      Ash_module_16
[0007152a] 4eb9 0004 3f10            jsr        oldgemdo
Ash_module_16:
[00071530] 204b                      movea.l    a3,a0
[00071532] 700d                      moveq.l    #13,d0
[00071534] 2252                      movea.l    (a2),a1
[00071536] 2269 03d6                 movea.l    982(a1),a1
[0007153a] 4e91                      jsr        (a1)
Ash_module_12:
[0007153c] 70ff                      moveq.l    #-1,d0
[0007153e] 6042                      bra.s      Ash_module_17
Ash_module_14:
[00071540] 4a44                      tst.w      d4
[00071542] 6734                      beq.s      Ash_module_18
[00071544] 0c94 4143 5336            cmpi.l     #$41435336,(a4)
[0007154a] 6d34                      blt.s      Ash_module_19
[0007154c] 0c94 4143 5337            cmpi.l     #$41435337,(a4)
[00071552] 6e2c                      bgt.s      Ash_module_19
[00071554] 2a6c 0004                 movea.l    4(a4),a5
[00071558] 2952 0008                 move.l     (a2),8(a4)
[0007155c] 0c94 4143 5336            cmpi.l     #$41435336,(a4)
[00071562] 6608                      bne.s      Ash_module_20
[00071564] 41f9 000e 466c            lea.l      ACS230,a0
[0007156a] 6006                      bra.s      Ash_module_21
Ash_module_20:
[0007156c] 41f9 000e 4340            lea.l      ACS233,a0
Ash_module_21:
[00071572] 2948 000c                 move.l     a0,12(a4)
[00071576] 6008                      bra.s      Ash_module_19
Ash_module_18:
[00071578] 2a6c 0008                 movea.l    8(a4),a5
[0007157c] 2952 000c                 move.l     (a2),12(a4)
Ash_module_19:
[00071580] 4e95                      jsr        (a5)
Ash_module_17:
[00071582] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00071586] 4e75                      rts

PushFuncLists:
[00071588] 48e7 0038                 movem.l    a2-a4,-(a7)
[0007158c] 43e8 0014                 lea.l      20(a0),a1
[00071590] 45f9 000e 4274            lea.l      funcs,a2
[00071596] 47f9 000e 433c            lea.l      funcsAnz,a3
[0007159c] 2228 0010                 move.l     16(a0),d1
[000715a0] b293                      cmp.l      (a3),d1
[000715a2] 662c                      bne.s      PushFuncLists_1
[000715a4] 4240                      clr.w      d0
[000715a6] 6032                      bra.s      PushFuncLists_2
PushFuncLists_9:
[000715a8] 3229 0004                 move.w     4(a1),d1
[000715ac] 4291                      clr.l      (a1)
[000715ae] 4242                      clr.w      d2
[000715b0] 2052                      movea.l    (a2),a0
[000715b2] 600c                      bra.s      PushFuncLists_3
PushFuncLists_6:
[000715b4] b268 0004                 cmp.w      4(a0),d1
[000715b8] 6602                      bne.s      PushFuncLists_4
[000715ba] 2290                      move.l     (a0),(a1)
PushFuncLists_4:
[000715bc] 5242                      addq.w     #1,d2
[000715be] 5c48                      addq.w     #6,a0
PushFuncLists_3:
[000715c0] 4a91                      tst.l      (a1)
[000715c2] 6608                      bne.s      PushFuncLists_5
[000715c4] 286a 0004                 movea.l    4(a2),a4
[000715c8] b454                      cmp.w      (a4),d2
[000715ca] 6de8                      blt.s      PushFuncLists_6
PushFuncLists_5:
[000715cc] 2211                      move.l     (a1),d1
[000715ce] 6604                      bne.s      PushFuncLists_7
PushFuncLists_1:
[000715d0] 4240                      clr.w      d0
[000715d2] 6010                      bra.s      PushFuncLists_8
PushFuncLists_7:
[000715d4] 5240                      addq.w     #1,d0
[000715d6] 5c49                      addq.w     #6,a1
[000715d8] 504a                      addq.w     #8,a2
PushFuncLists_2:
[000715da] 3200                      move.w     d0,d1
[000715dc] 48c1                      ext.l      d1
[000715de] b293                      cmp.l      (a3),d1
[000715e0] 6dc6                      blt.s      PushFuncLists_9
[000715e2] 7001                      moveq.l    #1,d0
PushFuncLists_8:
[000715e4] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000715e8] 4e75                      rts

	.data

oldbas:
[000e32dc]                           dc.w $0000
[000e32de]                           dc.w $0000
nix:
[000e32e0]                           dc.w $0000
[000e32e2]                           dc.w $0000
func1Abp:
[000e32e4] 00054b6e                  dc.l Abp_create
[000e32e8] 00054c04                  dc.l Abp_delete
[000e32ec] 00054c18                  dc.l Abp_start
[000e32f0] 00054cf2                  dc.l Abp_end
[000e32f4] 00054d96                  dc.l Abp_mfdb2img
[000e32f8] 00055410                  dc.l Abp_img2mfdb
funcAbp:
[000e32fc] 000e32e4                  dc.l func1Abp
[000e3300]                           dc.w $0000
funcAnzAbp:
[000e3302]                           dc.w $0001
func1Acfg:
[000e3304] 00044572                  dc.l Acfg_create
[000e3308] 000445d0                  dc.l Acfg_delete
[000e330c] 00044866                  dc.l Acfg_clear
[000e3310] 00044896                  dc.l Acfg_clearAllGroups
[000e3314] 000449d2                  dc.l Acfg_clearGroup
[000e3318] 00044e4a                  dc.l Acfg_load
[000e331c] 00045238                  dc.l Acfg_save
[000e3320] 00045970                  dc.l Acfg_isChanged
[000e3324] 00045460                  dc.l Acfg_getValue
[000e3328] 000455ae                  dc.l Acfg_setValue
[000e332c] 0004574a                  dc.l Acfg_clearValue
[000e3330] 0004587c                  dc.l Acfg_getChar
[000e3334] 000458a4                  dc.l Acfg_setChar
[000e3338] 0004580a                  dc.l Acfg_getLong
[000e333c] 00045836                  dc.l Acfg_setLong
[000e3340] 000457e6                  dc.l Acfg_getString
[000e3344] 000458d8                  dc.l Acfg_getBool
[000e3348] 0004591a                  dc.l Acfg_setBool
[000e334c] 00045d16                  dc.l Acfg_clearHeader
[000e3350] 00045d72                  dc.l Acfg_headAnzahl
[000e3354] 00045d80                  dc.l Acfg_setHeader
[000e3358] 00045e22                  dc.l Acfg_getHeader
[000e335c] 0004597e                  dc.l Acfg_grpAnzahl
[000e3360] 0004598c                  dc.l Acfg_grpName
[000e3364] 000459da                  dc.l Acfg_strAnzahl
[000e3368] 00045aa6                  dc.l Acfg_strName
[000e336c] 00045b70                  dc.l Acfg_strValue
[000e3370] 00045c5a                  dc.l Acfg_strIsComment
[000e3374] 00045e7c                  dc.l Acfg_isCfgfile
[000e3378] 00044690                  dc.l Acfg_createInfo
[000e337c] 000446c4                  dc.l Acfg_deleteInfo
[000e3380] 00044822                  dc.l Acfg_setInfo
[000e3384] 00044846                  dc.l Acfg_getInfo
[000e3388] 000447a6                  dc.l Acfg_copyInfo
[000e338c] 00044614                  dc.l Acfg_flags
[000e3390] 00045a1c                  dc.l Acfg_isGroupPresent
[000e3394] 00045a60                  dc.l Acfg_isStringPresent
funcAcfg:
[000e3398] 000e3304                  dc.l func1Acfg
[000e339c]                           dc.w $0000
funcAnzAcfg:
[000e339e]                           dc.w $0001
func1Ach:
[000e33a0] 000464c8                  dc.l Ach_tolower
[000e33a4] 000464b6                  dc.l Ach_toupper
[000e33a8] 000469d0                  dc.l Ach_isWhite
funcAch:
[000e33ac] 000e33a0                  dc.l func1Ach
[000e33b0]                           dc.w $0000
funcAnzAch:
[000e33b2]                           dc.w $0001
func1Adr:
[000e33b4] 000484fe                  dc.l Adr_box
[000e33b8] 00049140                  dc.l Adr_drag
[000e33bc] 00047e2a                  dc.l Adr_next
[000e33c0] 00047e6a                  dc.l Adr_add
[000e33c4] 00047f76                  dc.l Adr_del
[000e33c8] 0004810e                  dc.l Adr_unselect
[000e33cc] 00047e1e                  dc.l Adr_start
funcAdr:
[000e33d0] 000e33b4                  dc.l func1Adr
[000e33d4]                           dc.w $0000
funcAnzAdr:
[000e33d6]                           dc.w $0001
func1Aev:
[000e33d8] 0004a30e                  dc.l Aev_quit
[000e33dc] 00050c80                  dc.l Aev_release
[000e33e0] 0004b086                  dc.l Aev_mess
[000e33e4] 0004a2f8                  dc.l Aev_unhidepointer
[000e33e8] 000603f2                  dc.l Aev_DhstAdd
[000e33ec] 0006056e                  dc.l Aev_DhstSaved
[000e33f0] 0005eb60                  dc.l Aev_WmRedraw
funcAev:
[000e33f4] 000e33d8                  dc.l func1Aev
[000e33f8]                           dc.w $0000
funcAnzAev:
[000e33fa]                           dc.w $0001
func1Af:
[000e33fc] 0004b496                  dc.l Af_cfgfile
[000e3400] 0006cefe                  dc.l Af_select
[000e3404] 0004b548                  dc.l Af_2drv
[000e3408] 0004b586                  dc.l Af_2path
[000e340c] 0004b66e                  dc.l Af_2name
[000e3410] 0004b706                  dc.l Af_2fullname
[000e3414] 0004b758                  dc.l Af_2ext
[000e3418] 0004b7bc                  dc.l Af_buildname
[000e341c] 0004b8fa                  dc.l Af_length
[000e3420] 0006d206                  dc.l Af_first_fsel
[000e3424] 0006d450                  dc.l Af_next_fsel
[000e3428] 0004c0de                  dc.l Af_first
[000e342c] 0004c12c                  dc.l Af_next
[000e3430] 0004bfa2                  dc.l Af_readdir
[000e3434] 0004c0a6                  dc.l Af_freedir
[000e3438] 0006dc24                  dc.l Af_fileselect
[000e343c] 0004c1a6                  dc.l Af_quote
[000e3440] 0004c2a8                  dc.l Af_unquote
funcAf:
[000e3444] 000e33fc                  dc.l func1Af
[000e3448]                           dc.w $0000
funcAnzAf:
[000e344a]                           dc.w $0001
func1Aic:
[000e344c] 0004f606                  dc.l Aic_create
[000e3450] 0004f99a                  dc.l Aic_delete
funcAic:
[000e3454] 000e344c                  dc.l func1Aic
[000e3458]                           dc.w $0000
funcAnzAic:
[000e345a]                           dc.w $0001
func1Aim:
[000e345c] 0004fa4c                  dc.l Aim_create
[000e3460] 0004fa76                  dc.l Aim_delete
funcAim:
[000e3464] 000e345c                  dc.l func1Aim
[000e3468]                           dc.w $0000
funcAnzAim:
[000e346a]                           dc.w $0001
func1Alu:
[000e346c] 00070c0a                  dc.l Alu_create
[000e3470] 00070c5e                  dc.l Alu_delete
funcAlu:
[000e3474] 000e346c                  dc.l func1Alu
[000e3478]                           dc.w $0000
funcAnzAlu:
[000e347a]                           dc.w $0001
func1Ame:
[000e347c] 0004ec24                  dc.l Ame_namefix
[000e3480] 0004e84a                  dc.l Ame_popup
funcAme:
[000e3484] 000e347c                  dc.l func1Ame
[000e3488]                           dc.w $0000
funcAnzAme:
[000e348a]                           dc.w $0001
func1Amo:
[000e348c] 0004ee3c                  dc.l Amo_new
[000e3490] 0004eec0                  dc.l Amo_busy
[000e3494] 0004ef0c                  dc.l Amo_unbusy
[000e3498] 0004ef40                  dc.l Amo_hide
[000e349c] 0004ef66                  dc.l Amo_show
funcAmo:
[000e34a0] 000e348c                  dc.l func1Amo
[000e34a4]                           dc.w $0000
funcAnzAmo:
[000e34a6]                           dc.w $0001
func1Aob:
[000e34a8] 0004f064                  dc.l Aob_create
[000e34ac] 0004f20a                  dc.l Aob_delete
[000e34b0] 0004fbdc                  dc.l Aob_fix
[000e34b4] 0004fe06                  dc.l Aob_offset
[000e34b8] 0005009c                  dc.l Aob_save
[000e34bc] 0005021e                  dc.l Aob_restore
[000e34c0] 000509a4                  dc.l Aob_watch
[000e34c4] 00050e62                  dc.l Aob_findflag
[000e34c8] 000505fa                  dc.l Aob_alias
[000e34cc] 00050f3a                  dc.l Aob_up
[000e34d0] 0004fd76                  dc.l Aob_icon
[000e34d4] 00050fd8                  dc.l Aob_puttext
[000e34d8] 000511da                  dc.l Aob_gettext
[000e34dc] 0006b7a6                  dc.l Aob_within
[000e34e0] 00050f94                  dc.l Aob_printf
[000e34e4] 000510fe                  dc.l Aob_scanf
[000e34e8] 00054784                  dc.l Aob_flags
[000e34ec] 0005484e                  dc.l Aob_state
[000e34f0] 0005491c                  dc.l Aob_service
[000e34f4] 00054a3e                  dc.l Aob_visible
[000e34f8] 0004f302                  dc.l Aob_count
funcAob:
[000e34fc] 000e34a8                  dc.l func1Aob
[000e3500]                           dc.w $0000
funcAnzAob:
[000e3502]                           dc.w $0001
func1Ascrp:
[000e3504] 0006c904                  dc.l Ascrp_clear
[000e3508] 0006ca2c                  dc.l Ascrp_get
[000e350c] 0006cc22                  dc.l Ascrp_put
funcAscrp:
[000e3510] 000e3504                  dc.l func1Ascrp
[000e3514]                           dc.w $0000
funcAnzAscrp:
[000e3516]                           dc.w $0001
func1Ash:
[000e3518] 00055e98                  dc.l Ash_prog
[000e351c] 0005bb0c                  dc.l Ash_error
[000e3520] 00080ec4                  dc.l Ash_getc
[000e3524] 0005be00                  dc.l Ash_getenv
[000e3528] 0005dd58                  dc.l Ash_nextdd
[000e352c] 0005dc8e                  dc.l Ash_sendall
[000e3530] 00071a10                  dc.l Ash_CallEdDI
[000e3534] 000719aa                  dc.l Ash_NVDICookie
[000e3538] 000719de                  dc.l Ash_NVDIVersion
[000e353c] 000719f6                  dc.l Ash_NVDIDatum
[000e3540] 0005be80                  dc.l Ash_thermometer
[000e3544] 0006d518                  dc.l Ash_fileselect
[000e3548] 0006fb8a                  dc.l Ash_font
[000e354c] 0006ebaa                  dc.l Ash_print
[000e3550] 00080f6c                  dc.l Ash_gett
[000e3554] 0006eb66                  dc.l Ash_printSetIcon
[000e3558] 0006fb46                  dc.l Ash_fontSetIcon
[000e355c] 0006d4d4                  dc.l Ash_fileSetIcon
[000e3560] 00080fc0                  dc.l Ash_getO
[000e3564] 00080fce                  dc.l Ash_getM
[000e3568] 00080ffa                  dc.l Ash_getN
[000e356c] 00081026                  dc.l Ash_getM
[000e3570] 00081044                  dc.l Ash_getM
funcAsh:
[000e3574] 000e3518                  dc.l func1Ash
[000e3578]                           dc.w $0000
funcAnzAsh:
[000e357a]                           dc.w $0001
func1Ast:
[000e357c] 0004643c                  dc.l Ast_create
[000e3580] 0004649c                  dc.l Ast_delete
[000e3584] 0004651a                  dc.l Ast_tolower
[000e3588] 000464da                  dc.l Ast_toupper
[000e358c] 0004655a                  dc.l Ast_ltrim
[000e3590] 000465c6                  dc.l Ast_rtrim
[000e3594] 0004663c                  dc.l Ast_alltrim
[000e3598] 0004665a                  dc.l Ast_cmp
[000e359c] 000466ea                  dc.l Ast_icmp
[000e35a0] 000469f6                  dc.l Ast_isEmpty
[000e35a4] 00046a3a                  dc.l Ast_add
[000e35a8] 00046b28                  dc.l Ast_adl
[000e35ac] 00046b7e                  dc.l Ast_adr
[000e35b0] 00046be8                  dc.l Ast_adc
[000e35b4] 00046c4e                  dc.l Ast_filter
[000e35b8] 00046d06                  dc.l Ast_count
[000e35bc] 00046e7e                  dc.l Ast_fcmp
[000e35c0] 00046798                  dc.l Ast_ncmp
[000e35c4] 0004684c                  dc.l Ast_incmp
[000e35c8] 0004691e                  dc.l Ast_istr
funcAst:
[000e35cc] 000e357c                  dc.l func1Ast
[000e35d0]                           dc.w $0000
funcAnzAst:
[000e35d2]                           dc.w $0001
func1Ate:
[000e35d4] 0004fa88                  dc.l Ate_create
[000e35d8] 0004fb24                  dc.l Ate_delete
funcAte:
[000e35dc] 000e35d4                  dc.l func1Ate
[000e35e0]                           dc.w $0000
funcAnzAte:
[000e35e2]                           dc.w $0001
func1Auo:
[000e35e4] 00066924                  dc.l Auo_ftext
[000e35e8] 000630f2                  dc.l Auo_string
[000e35ec] 00067456                  dc.l Auo_cycle
[000e35f0] 0006863e                  dc.l Auo_picture
[000e35f4] 0006a068                  dc.l Auo_boxed
funcAuo:
[000e35f8] 000e35e4                  dc.l func1Auo
[000e35fc]                           dc.w $0000
funcAnzAuo:
[000e35fe]                           dc.w $0001
func1Aus:
[000e3600] 0004fb5e                  dc.l Aus_create
[000e3604] 0004fbb2                  dc.l Aus_delete
[000e3608] 00069b4e                  dc.l Aus_boxed
[000e360c] 00067ca4                  dc.l Aus_cycle
funcAus:
[000e3610] 000e3600                  dc.l func1Aus
[000e3614]                           dc.w $0000
funcAnzAus:
[000e3616]                           dc.w $0001
func1Awi:
[000e3618] 00055e68                  dc.l Awi_wid
[000e361c] 00055e8c                  dc.l Awi_root
[000e3620] 000569d6                  dc.l Awi_list
[000e3624] 00056a20                  dc.l Awi_sendall
[000e3628] 00056b70                  dc.l Awi_down
[000e362c] 00056af6                  dc.l Awi_up
[000e3630] 00056bea                  dc.l Awi_show
[000e3634] 00055e94                  dc.l Awi_init
[000e3638] 00057052                  dc.l Awi_create
[000e363c] 00057428                  dc.l Awi_open
[000e3640] 00058362                  dc.l Awi_closed
[000e3644] 000585f2                  dc.l Awi_delete
[000e3648] 000587a4                  dc.l Awi_topped
[000e364c] 000587ec                  dc.l Awi_fulled
[000e3650] 00058bb0                  dc.l Awi_sized
[000e3654] 00058d50                  dc.l Awi_moved
[000e3658] 00051388                  dc.l Awi_diaend
[000e365c] 0005147c                  dc.l Awi_diastart
[000e3660] 0006b744                  dc.l Awi_keys
[000e3664] 00052906                  dc.l Awi_obview
[000e3668] 00059dd0                  dc.l Awi_service
[000e366c] 000544c4                  dc.l Awi_scroll
[000e3670] 00051852                  dc.l Awi_obchange
[000e3674] 00051b80                  dc.l Awi_obredraw
[000e3678] 00051c46                  dc.l Awi_redraw
[000e367c] 0005217c                  dc.l Awi_arrowed
[000e3680] 000524b4                  dc.l Awi_hslid
[000e3684] 0005255e                  dc.l Awi_vslid
[000e3688] 0005998a                  dc.l Awi_iconify
[000e368c] 00059c6c                  dc.l Awi_uniconify
[000e3690] 0005b5b6                  dc.l Awi_gemscript
[000e3694] 00057b82                  dc.l Awi_modal
[000e3698] 00059df4                  dc.l Awi_dialog
[000e369c] 0005a600                  dc.l Awi_alert
[000e36a0] 00056c16                  dc.l Awi_selfcreate
[000e36a4] 0006b77a                  dc.l Awi_nokey
[000e36a8] 0005ae7e                  dc.l Awi_update
[000e36ac] 0005180a                  dc.l Awi_uoself
[000e36b0] 0005a366                  dc.l Awi_doform
[000e36b4] 000549ce                  dc.l Awi_observice
[000e36b8] 00055c5a                  dc.l Awi_ontop
[000e36bc] 00056f2a                  dc.l Awi_layout
[000e36c0] 00054a98                  dc.l Awi_obvisible
funcAwi:
[000e36c4] 000e3618                  dc.l func1Awi
[000e36c8]                           dc.w $0000
funcAnzAwi:
[000e36ca]                           dc.w $0001
func1A:
[000e36cc] 0006c596                  dc.l A_dialog
[000e36d0] 0006323e                  dc.l A_checkbox
[000e36d4] 0006322c                  dc.l A_radiobutton
[000e36d8] 00064256                  dc.l A_innerframe
[000e36dc] 000659ea                  dc.l A_pattern
[000e36e0] 00065c72                  dc.l A_arrows
[000e36e4] 000661d6                  dc.l A_select
[000e36e8] 0006639a                  dc.l A_ftext
[000e36ec] 00065620                  dc.l A_title
[000e36f0] 00064a22                  dc.l A_3Dbutton
[000e36f4] 00066c46                  dc.l A_cycle
[000e36f8] 00067ece                  dc.l A_picture
[000e36fc] 0006c5a6                  dc.l A_dialog2
[000e3700] 0006afea                  dc.l A_boxed
funcA:
[000e3704] 000e36cc                  dc.l func1A
[000e3708]                           dc.w $0000
funcAnzA:
[000e370a]                           dc.w $0001
func1Sonst:
[000e370c] 0004c608                  dc.l Ax_malloc
[000e3710] 0004c7c8                  dc.l Ax_free
[000e3714] 0004c6c8                  dc.l Ax_ifree
[000e3718] 0004c95e                  dc.l Ax_glmalloc
[000e371c] 0004c9da                  dc.l Ax_glfree
[000e3720] 000713c0                  dc.l Ax_mterm
[000e3724] 0006b80c                  dc.l alert_str
[000e3728] 0006c662                  dc.l intersect
[000e372c] 0006c7a0                  dc.l xywh2array
[000e3730] 0006c7f0                  dc.l array2xywh
[000e3734] 00047518                  dc.l dotted_xline
[000e3738] 000475e6                  dc.l dotted_yline
[000e373c] 00043f94                  dc.l nkc_tos2
[000e3740] 00044108                  dc.l nkc_n2to
[000e3744] 000442c2                  dc.l nkc_gem2n
[000e3748] 00044330                  dc.l nkc_n2gem
[000e374c] 00044284                  dc.l nkc_gemks2n
[000e3750] 000442d6                  dc.l nkc_n2gemks
[000e3754] 0004435a                  dc.l nkc_n2kstate
[000e3758] 00044374                  dc.l nkc_kstate
[000e375c] 000443b8                  dc.l nkc_cmp
[000e3760] 00044274                  dc.l nkc_tolo
[000e3764] 00044264                  dc.l nkc_toup
[000e3768] 0007e94e                  dc.l appl_getinfo
[000e376c] 0004cee2                  dc.l Ax_setRecycleSize
[000e3770] 0004cffe                  dc.l Ax_getRecycleStat
[000e3774] 0004cc28                  dc.l Ax_recycle
[000e3778] 00043dee                  dc.l Avdi_getRGB
funcSonst:
[000e377c] 000e370c                  dc.l func1Sonst
[000e3780]                           dc.w $0000
funcAnzSonst:
[000e3782]                           dc.w $0001
func1Vdi:
[000e3784] 0007195c                  dc.l vdi
[000e3788] 00071946                  dc.l vdi_
[000e378c] 00071ac2                  dc.l v_opnwk
[000e3790] 00071e80                  dc.l v_clswk
[000e3794] 00071eca                  dc.l v_opnvwk
[000e3798] 00071f1e                  dc.l v_clsvwk
[000e379c] 00071f68                  dc.l v_clrwk
[000e37a0] 00071fb2                  dc.l v_updwk
[000e37a4] 00071ffc                  dc.l v_opnbm
[000e37a8] 00072140                  dc.l v_clsbm
[000e37ac] 0007218a                  dc.l vst_load_fonts
[000e37b0] 000721de                  dc.l vst_unload_fonts
[000e37b4] 00072230                  dc.l vs_clip
[000e37b8] 000722e0                  dc.l v_pline
[000e37bc] 0007245a                  dc.l v_pmarker
[000e37c0] 000724b0                  dc.l v_gtext
[000e37c4] 0007258e                  dc.l v_fillarea
[000e37c8] 00072708                  dc.l v_cellarray
[000e37cc] 00072782                  dc.l v_contourfill
[000e37d0] 0007282e                  dc.l v_bar
[000e37d4] 0007287a                  dc.l v_arc
[000e37d8] 000728f6                  dc.l v_pieslice
[000e37dc] 00072972                  dc.l v_circle
[000e37e0] 000729e4                  dc.l v_ellipse
[000e37e4] 00072a4c                  dc.l v_ellarc
[000e37e8] 00072abe                  dc.l v_ellpie
[000e37ec] 00072bc8                  dc.l v_justified
[000e37f0] 000727e2                  dc.l vr_recfl
[000e37f4] 00072b7c                  dc.l v_rfbox
[000e37f8] 00072b30                  dc.l v_rbox
[000e37fc] 0007196e                  dc.l vq_gdos
[000e3800] 00073070                  dc.l vswr_mode
[000e3804] 000730c4                  dc.l vsl_type
[000e3808] 00073118                  dc.l vsl_udsty
[000e380c] 0007316a                  dc.l vsl_width
[000e3810] 000731c0                  dc.l vsl_color
[000e3814] 00073214                  dc.l vsl_ends
[000e3818] 00073270                  dc.l vsm_type
[000e381c] 000732c4                  dc.l vsm_height
[000e3820] 0007331c                  dc.l vsm_color
[000e3824] 00073370                  dc.l vst_height
[000e3828] 00073402                  dc.l vst_point
[000e382c] 00073492                  dc.l vst_rotation
[000e3830] 000734e6                  dc.l vst_font
[000e3834] 0007353a                  dc.l vst_color
[000e3838] 0007358e                  dc.l vst_effects
[000e383c] 000735e2                  dc.l vst_alignment
[000e3840] 00073660                  dc.l vsf_interior
[000e3844] 000736b4                  dc.l vsf_style
[000e3848] 00073708                  dc.l vsf_color
[000e384c] 0007375c                  dc.l vsf_perimeter
[000e3850] 0007380e                  dc.l vsf_udpat
[000e3854] 00073868                  dc.l vsf_updat
[000e3858] 00072ffe                  dc.l vs_color
[000e385c] 00074978                  dc.l vr_trnfm
[000e3860] 0007489e                  dc.l vro_cpyfm
[000e3864] 00074902                  dc.l vrt_cpyfm
[000e3868] 000749d6                  dc.l v_get_pixel
[000e386c] 00074b16                  dc.l vsin_mode
[000e3870] 00074b74                  dc.l vrq_locator
[000e3874] 00074bfc                  dc.l vsm_locator
[000e3878] 00074ca0                  dc.l vrq_valuator
[000e387c] 00074d14                  dc.l vsm_valuator
[000e3880] 00074da4                  dc.l vrq_choice
[000e3884] 00074e06                  dc.l vsm_choice
[000e3888] 00074e64                  dc.l vrq_string
[000e388c] 00074f6c                  dc.l vsm_string
[000e3890] 0007507a                  dc.l vex_timv
[000e3894] 000750de                  dc.l v_show_c
[000e3898] 00075130                  dc.l v_hide_c
[000e389c] 0007517a                  dc.l vq_mouse
[000e38a0] 000751e2                  dc.l vex_butv
[000e38a4] 00075248                  dc.l vex_motv
[000e38a8] 000752ae                  dc.l vex_curv
[000e38ac] 00075314                  dc.l vq_key_s
[000e38b0] 00075360                  dc.l vq_extnd
[000e38b4] 00075484                  dc.l vql_attributes
[000e38b8] 00075516                  dc.l vqm_attributes
[000e38bc] 00075564                  dc.l vqf_attributes
[000e38c0] 000755b0                  dc.l vqt_attributes
[000e38c4] 000755fe                  dc.l vqt_extent
[000e38c8] 000756b2                  dc.l vqt_width
[000e38cc] 00075734                  dc.l vqt_name
[000e38d0] 0007598a                  dc.l vqin_mode
[000e38d4] 000759de                  dc.l vqt_fontinfo
[000e38d8] 000753b6                  dc.l vq_scrninfo
[000e38dc] 00075406                  dc.l vq_color
[000e38e0] 000758fe                  dc.l vq_cellarray
[000e38e4] 0007684e                  dc.l vq_chcells
[000e38e8] 000768ba                  dc.l v_exit_cur
[000e38ec] 00076904                  dc.l v_enter_cur
[000e38f0] 0007694e                  dc.l v_curup
[000e38f4] 00076998                  dc.l v_curdown
[000e38f8] 000769e2                  dc.l v_curright
[000e38fc] 00076a2c                  dc.l v_curleft
[000e3900] 00076a76                  dc.l v_curhome
[000e3904] 00076ac0                  dc.l v_eeos
[000e3908] 00076b0a                  dc.l v_eeol
[000e390c] 00076b54                  dc.l v_curaddress
[000e3910] 00076bce                  dc.l v_curtext
[000e3914] 00076c80                  dc.l v_rvon
[000e3918] 00076cca                  dc.l v_rvoff
[000e391c] 00076d14                  dc.l vq_curaddress
[000e3920] 00076d80                  dc.l vq_tabstatus
[000e3924] 00076dcc                  dc.l v_hardcopy
[000e3928] 00076e16                  dc.l v_dspcur
[000e392c] 00076e72                  dc.l v_rmcur
[000e3930] 00076ebc                  dc.l v_form_adv
[000e3934] 00076f52                  dc.l v_clear_disp_list
[000e3938] 00077094                  dc.l vq_scan
[000e393c] 0007712a                  dc.l v_alpha_text
[000e3940] 000774c2                  dc.l vs_palette
[000e3944] 00077516                  dc.l v_sound
[000e3948] 00077572                  dc.l vs_mute
[000e394c] 00077692                  dc.l vt_resolution
[000e3950] 00077710                  dc.l vt_axis
[000e3954] 0007778e                  dc.l vt_origin
[000e3958] 000777ea                  dc.l vq_tdimensions
[000e395c] 00077856                  dc.l vt_alignment
[000e3960] 000778b2                  dc.l vsp_film
[000e3964] 0007790e                  dc.l vqp_filmname
[000e3968] 000779b0                  dc.l vsc_expose
[000e396c] 00077a02                  dc.l v_meta_extents
[000e3970] 00077a6a                  dc.l v_write_meta
[000e3974] 00077acc                  dc.l vm_pagesize
[000e3978] 00077b2c                  dc.l vm_coords
[000e397c] 00077b9a                  dc.l vm_filename
[000e3980] 00077c42                  dc.l v_offset
[000e3984] 00077c94                  dc.l v_fontinit
[000e3988] 00077ce6                  dc.l v_escape2000
[000e398c] 00076f06                  dc.l v_output_window
[000e3990] 00076f9c                  dc.l v_bit_image
[000e3994] 00071996                  dc.l fix31ToPixel
[000e3998] 00071b24                  dc.l v_opnprn
[000e399c] 00071d8c                  dc.l v_opnmeta
[000e39a0] 00076520                  dc.l vq_devinfo
[000e39a4] 0007670c                  dc.l vq_ext_devinfo
[000e39a8] 000775c6                  dc.l vs_calibrate
[000e39ac] 00077624                  dc.l vq_calibrate
[000e39b0] 00072336                  dc.l v_bez
[000e39b4] 00072cb6                  dc.l v_bez_on
[000e39b8] 00072d04                  dc.l v_bez_off
[000e39bc] 00072d4e                  dc.l v_bez_qual
[000e39c0] 000725e4                  dc.l v_bez_fill
[000e39c4] 000757ca                  dc.l vqt_ext_name
[000e39c8] 00075b98                  dc.l vqt_char_index
[000e39cc] 00075bfc                  dc.l vqt_isCharAvailable
[000e39d0] 00075e1a                  dc.l vqt_xfntinfo
[000e39d4] 000740a0                  dc.l vst_name
[000e39d8] 00075ea6                  dc.l vqt_name_and_id
[000e39dc] 00075f7a                  dc.l vqt_fontheader
[000e39e0] 00076006                  dc.l vqt_trackkern
[000e39e4] 00076072                  dc.l vqt_pairkern
[000e39e8] 00074202                  dc.l vst_charmap
[000e39ec] 00074254                  dc.l vst_kern
[000e39f0] 00074356                  dc.l vst_kern_offset
[000e39f4] 000760f0                  dc.l v_getbitmap_info
[000e39f8] 000761aa                  dc.l vqt_f_extent
[000e39fc] 0007625e                  dc.l vqt_real_extent
[000e3a00] 00072dbc                  dc.l v_ftext
[000e3a04] 00072e98                  dc.l v_ftext_offset
[000e3a08] 00076328                  dc.l v_getoutline
[000e3a0c] 00074436                  dc.l vst_arbpt32
[000e3a10] 000764ae                  dc.l vqt_advance32
[000e3a14] 000747ba                  dc.l vst_setsize32
[000e3a18] 0007484a                  dc.l vst_skew
[000e3a1c] 000771e2                  dc.l v_orient
[000e3a20] 00077240                  dc.l v_trays
[000e3a24] 000772ca                  dc.l vq_tray_names
[000e3a28] 00077364                  dc.l v_page_size
[000e3a2c] 000773c4                  dc.l vq_page_name
[000e3a30] 00073886                  dc.l vst_fg_color
[000e3a34] 00073904                  dc.l vsf_fg_color
[000e3a38] 00073982                  dc.l vsl_fg_color
[000e3a3c] 00073a00                  dc.l vsm_fg_color
[000e3a40] 00073a7e                  dc.l vsr_fg_color
[000e3a44] 00073afc                  dc.l vst_bg_color
[000e3a48] 00073b7a                  dc.l vsf_bg_color
[000e3a4c] 00073bf8                  dc.l vsl_bg_color
[000e3a50] 00073c76                  dc.l vsm_bg_color
[000e3a54] 00073cf4                  dc.l vsr_bg_color
[000e3a58] 00077ebe                  dc.l vqt_fg_color
[000e3a5c] 00077f3a                  dc.l vqf_fg_color
[000e3a60] 00077fb6                  dc.l vql_fg_color
[000e3a64] 00078032                  dc.l vqm_fg_color
[000e3a68] 000780ae                  dc.l vqr_fg_color
[000e3a6c] 0007812a                  dc.l vqt_bg_color
[000e3a70] 000781a6                  dc.l vqf_bg_color
[000e3a74] 00078222                  dc.l vql_bg_color
[000e3a78] 0007829e                  dc.l vqm_bg_color
[000e3a7c] 0007831a                  dc.l vqr_bg_color
[000e3a80] 00078396                  dc.l v_color2value
[000e3a84] 00078414                  dc.l v_value2color
[000e3a88] 00078498                  dc.l v_color2nearest
[000e3a8c] 00078546                  dc.l vq_px_format
[000e3a90] 00073d72                  dc.l vs_ctab
[000e3a94] 00073dd4                  dc.l vs_ctab_entry
[000e3a98] 00073e5c                  dc.l vs_dflt_ctab
[000e3a9c] 000785a4                  dc.l vq_ctab
[000e3aa0] 00078604                  dc.l vq_ctab_entry
[000e3aa4] 00078688                  dc.l vq_ctab_id
[000e3aa8] 000786d4                  dc.l v_ctab_idx2vdi
[000e3aac] 00078728                  dc.l v_ctab_vdi2idx
[000e3ab0] 0007877c                  dc.l v_ctab_idx2value
[000e3ab4] 000787d2                  dc.l v_get_ctab_id
[000e3ab8] 00078820                  dc.l vq_dflt_ctab
[000e3abc] 00078932                  dc.l v_create_itab
[000e3ac0] 00078996                  dc.l v_delete_itab
[000e3ac4] 00074a54                  dc.l vr_transfer_bits
[000e3ac8] 00073ea8                  dc.l vs_hilite_color
[000e3acc] 00073f26                  dc.l vs_min_color
[000e3ad0] 00073fa4                  dc.l vs_max_color
[000e3ad4] 00074022                  dc.l vs_weight_color
[000e3ad8] 00075c2a                  dc.l vq_hilite_color
[000e3adc] 00075ca6                  dc.l vq_min_color
[000e3ae0] 00075d22                  dc.l vq_max_color
[000e3ae4] 00075d9e                  dc.l vq_weight_color
[000e3ae8] 00077d38                  dc.l vs_document_info
[000e3aec] 00077464                  dc.l vq_prn_scaling
[000e3af0] 000720ca                  dc.l v_open_bm
[000e3af4] 0007205c                  dc.l v_resize_bm
[000e3af8] 000763a4                  dc.l v_get_outline
[000e3afc] 000742d2                  dc.l vst_track_offset
[000e3b00] 000744c8                  dc.l vst_arbpt
[000e3b04] 00076422                  dc.l vqt_advance
[000e3b08] 0007472a                  dc.l vst_setsize
[000e3b0c] 00071986                  dc.l vq_vgdos
[000e3b10] 00074174                  dc.l vst_width
[000e3b14] 00074388                  dc.l vst_scratch
[000e3b18] 000743da                  dc.l vst_error
[000e3b1c] 0007455a                  dc.l v_savecache
[000e3b20] 00074612                  dc.l v_loadcache
[000e3b24] 000746de                  dc.l v_flushcache
[000e3b28] 000767ec                  dc.l vqt_cachesize
[000e3b2c] 00076792                  dc.l vqt_get_table
[000e3b30] 00076bb0                  dc.l vs_curaddress
[000e3b34] 000737b0                  dc.l vsf_perimeter3
[000e3b38] 00075aac                  dc.l vqt_justified
[000e3b3c] 00071bd6                  dc.l v_opnprnwrk
[000e3b40] 00071ce0                  dc.l v_opnmatrixprn
[000e3b44] 00072284                  dc.l v_set_app_buff
[000e3b48] 0007665c                  dc.l vqt_devinfo
[000e3b4c] 00078880                  dc.l v_create_ctab
[000e3b50] 000788de                  dc.l v_delete_ctab
[000e3b54] 00077e56                  dc.l v_setrgb
funcVdi:
[000e3b58] 000e3784                  dc.l func1Vdi
[000e3b5c]                           dc.w $0000
funcAnzVdi:
[000e3b5e]                           dc.w $0001
func1Aes:
[000e3b60] 000789ec                  dc.l aes
[000e3b64] 0007e84c                  dc.l appl_init
[000e3b68] 0007e85a                  dc.l appl_read
[000e3b6c] 0007e880                  dc.l appl_write
[000e3b70] 0007e8a6                  dc.l appl_find
[000e3b74] 0007e90e                  dc.l appl_search
[000e3b78] 0007e8bc                  dc.l appl_tplay
[000e3b7c] 0007e8e2                  dc.l appl_trecord
[000e3b80] 0007e900                  dc.l appl_yield
[000e3b84] 0007e940                  dc.l appl_exit
[000e3b88] 0007e94e                  dc.l appl_getinfo
[000e3b8c] 0007e986                  dc.l appl_control
[000e3b90] 0007e9ac                  dc.l evnt_keybd
[000e3b94] 0007e9ba                  dc.l evnt_button
[000e3b98] 0007ea02                  dc.l evnt_mouse
[000e3b9c] 0007ea52                  dc.l evnt_mesag
[000e3ba0] 0007ea68                  dc.l evnt_timer
[000e3ba4] 0007eb24                  dc.l evnt_event
[000e3ba8] 0007ea90                  dc.l evnt_multi
[000e3bac] 0007eb5c                  dc.l evnt_dclick
[000e3bb0] 0007eb7a                  dc.l menu_bar
[000e3bb4] 0007eb98                  dc.l menu_icheck
[000e3bb8] 0007ebbe                  dc.l menu_ienable
[000e3bbc] 0007ebe4                  dc.l menu_tnormal
[000e3bc0] 0007ec0a                  dc.l menu_text
[000e3bc4] 0007ec38                  dc.l menu_register
[000e3bc8] 0007ec56                  dc.l menu_unregister
[000e3bcc] 0007ec6c                  dc.l menu_click
[000e3bd0] 0007ec8a                  dc.l menu_attach
[000e3bd4] 0007ecc0                  dc.l menu_istart
[000e3bd8] 0007ecf2                  dc.l menu_popup
[000e3bdc] 0007ed28                  dc.l menu_settings
[000e3be0] 0007ed46                  dc.l objc_add
[000e3be4] 0007ed6c                  dc.l objc_delete
[000e3be8] 0007ed8a                  dc.l objc_draw
[000e3bec] 0007edcc                  dc.l objc_find
[000e3bf0] 0007ee06                  dc.l objc_offset
[000e3bf4] 0007ee38                  dc.l objc_order
[000e3bf8] 0007ee5e                  dc.l objc_edit
[000e3bfc] 0007eede                  dc.l objc_change
[000e3c00] 0007ef2a                  dc.l objc_sysvar
[000e3c04] 0007ef6c                  dc.l form_do
[000e3c08] 0007ef8a                  dc.l form_dial
[000e3c0c] 0007efce                  dc.l form_alert
[000e3c10] 0007efec                  dc.l form_error
[000e3c14] 0007f002                  dc.l form_center
[000e3c18] 0007f032                  dc.l form_keybd
[000e3c1c] 0007f074                  dc.l form_button
[000e3c20] 0007f18e                  dc.l graf_rubbox
[000e3c24] 0007f1d0                  dc.l graf_rubberbox
[000e3c28] 0007f254                  dc.l graf_dragbox
[000e3c2c] 0007f2a8                  dc.l graf_mbox
[000e3c30] 0007f2de                  dc.l graf_movebox
[000e3c34] 0007f310                  dc.l graf_growbox
[000e3c38] 0007f350                  dc.l graf_shrinkbox
[000e3c3c] 0007f390                  dc.l graf_watchbox
[000e3c40] 0007f3fc                  dc.l graf_slidebox
[000e3c44] 0007f42e                  dc.l graf_handle
[000e3c48] 0007f48a                  dc.l graf_mouse
[000e3c4c] 0007f4a8                  dc.l graf_mkstate
[000e3c50] 0007f4d4                  dc.l graf_multirubber
[000e3c54] 0007f51c                  dc.l scrp_read
[000e3c58] 0007f532                  dc.l scrp_write
[000e3c5c] 0007f556                  dc.l fsel_input
[000e3c60] 0007f57c                  dc.l fsel_exinput
[000e3c64] 0007f5a8                  dc.l fsel_boxinput
[000e3c68] 0007f5d8                  dc.l fslx_open
[000e3c6c] 0007f638                  dc.l fslx_close
[000e3c70] 0007f64e                  dc.l fslx_getnxtfile
[000e3c74] 0007f670                  dc.l fslx_evnt
[000e3c78] 0007f6ac                  dc.l fslx_do
[000e3c7c] 0007f70c                  dc.l fslx_set_flags
[000e3c80] 0007f72a                  dc.l wind_create
[000e3c84] 0007f75c                  dc.l wind_open
[000e3c88] 0007f78e                  dc.l wind_close
[000e3c8c] 0007f7a4                  dc.l wind_delete
[000e3c90] 0007f7ba                  dc.l wind_get
[000e3c94] 0007f8f8                  dc.l wind_getQSB
[000e3c98] 0007f926                  dc.l wind_set
[000e3c9c] 0007fa06                  dc.l wind_find
[000e3ca0] 0007fa24                  dc.l wind_update
[000e3ca4] 0007fa3a                  dc.l wind_calc
[000e3ca8] 0007fa8e                  dc.l wind_new
[000e3cac] 0007faba                  dc.l rsrc_load
[000e3cb0] 0007fad0                  dc.l rsrc_free
[000e3cb4] 0007fade                  dc.l rsrc_gaddr
[000e3cb8] 0007fb04                  dc.l rsrc_saddr
[000e3cbc] 0007fb2a                  dc.l rsrc_obfix
[000e3cc0] 0007fb48                  dc.l rsrc_rcfix
[000e3cc4] 0007fb5e                  dc.l shel_read
[000e3cc8] 0007fb80                  dc.l shel_write
[000e3ccc] 0007fbbe                  dc.l shel_get
[000e3cd0] 0007fbdc                  dc.l shel_put
[000e3cd4] 0007fbfa                  dc.l shel_find
[000e3cd8] 0007fc10                  dc.l shel_envrn
[000e3cdc] 0007fc32                  dc.l shel_help
[000e3ce0] 0007fc60                  dc.l fnts_add
[000e3ce4] 0007fc82                  dc.l fnts_close
[000e3ce8] 0007fca8                  dc.l fnts_create
[000e3cec] 0007fcea                  dc.l fnts_delete
[000e3cf0] 0007fd08                  dc.l fnts_do
[000e3cf4] 0007fd58                  dc.l fnts_evnt
[000e3cf8] 0007fd90                  dc.l fnts_get_info
[000e3cfc] 0007fdc2                  dc.l fnts_get_name
[000e3d00] 0007fdfa                  dc.l fnts_get_no_styles
[000e3d04] 0007fe18                  dc.l fnts_get_style
[000e3d08] 0007fe42                  dc.l fnts_open
[000e3d0c] 0007fe86                  dc.l fnts_remove
[000e3d10] 0007fe9c                  dc.l fnts_update
[000e3d14] 0007fed6                  dc.l lbox_ascroll_to
[000e3d18] 0007ff08                  dc.l lbox_scroll_to
[000e3d1c] 0007ff3a                  dc.l lbox_bscroll_to
[000e3d20] 0007ff6c                  dc.l lbox_cnt_items
[000e3d24] 0007ff82                  dc.l lbox_create
[000e3d28] 0007ffee                  dc.l lbox_delete
[000e3d2c] 00080004                  dc.l lbox_do
[000e3d30] 00080022                  dc.l lbox_free_items
[000e3d34] 00080038                  dc.l lbox_free_list
[000e3d38] 0008004e                  dc.l lbox_get_afirst
[000e3d3c] 00080064                  dc.l lbox_get_first
[000e3d40] 0008007a                  dc.l lbox_get_avis
[000e3d44] 00080090                  dc.l lbox_get_visible
[000e3d48] 000800a6                  dc.l lbox_get_bentries
[000e3d4c] 000800bc                  dc.l lbox_get_bfirst
[000e3d50] 000800d2                  dc.l lbox_get_idx
[000e3d54] 000800f4                  dc.l lbox_get_item
[000e3d58] 00080112                  dc.l lbox_get_items
[000e3d5c] 00080128                  dc.l lbox_get_slct_idx
[000e3d60] 0008013e                  dc.l lbox_get_slct_item
[000e3d64] 00080154                  dc.l lbox_get_tree
[000e3d68] 0008016a                  dc.l lbox_get_udata
[000e3d6c] 00080180                  dc.l lbox_set_asldr
[000e3d70] 000801ae                  dc.l lbox_set_slider
[000e3d74] 000801dc                  dc.l lbox_set_bentries
[000e3d78] 000801fa                  dc.l lbox_set_bsldr
[000e3d7c] 00080228                  dc.l lbox_set_items
[000e3d80] 0008024a                  dc.l lbox_update
[000e3d84] 0008026c                  dc.l pdlg_add_printers
[000e3d88] 0008028e                  dc.l pdlg_add_sub_dialogs
[000e3d8c] 000802b0                  dc.l pdlg_close
[000e3d90] 000802d6                  dc.l pdlg_create
[000e3d94] 000802ec                  dc.l pdlg_delete
[000e3d98] 00080302                  dc.l pdlg_dflt_settings
[000e3d9c] 00080324                  dc.l pdlg_do
[000e3da0] 00080356                  dc.l pdlg_evnt
[000e3da4] 00080382                  dc.l pdlg_free_settings
[000e3da8] 00080398                  dc.l pdlg_get_setsize
[000e3dac] 000803a6                  dc.l pdlg_new_settings
[000e3db0] 000803bc                  dc.l pdlg_open
[000e3db4] 000803fe                  dc.l pdlg_remove_printers
[000e3db8] 00080414                  dc.l pdlg_remove_sub_dialogs
[000e3dbc] 0008042a                  dc.l pdlg_update
[000e3dc0] 0008044c                  dc.l pdlg_use_settings
[000e3dc4] 0008046e                  dc.l pdlg_validate_settings
[000e3dc8] 000806e6                  dc.l edit_create
[000e3dcc] 00080982                  dc.l edit_set_buf
[000e3dd0] 000806f4                  dc.l edit_open
[000e3dd4] 00080712                  dc.l edit_close
[000e3dd8] 00080730                  dc.l edit_delete
[000e3ddc] 00080746                  dc.l edit_cursor
[000e3de0] 00080778                  dc.l edit_evnt
[000e3de4] 000807b2                  dc.l edit_get_buf
[000e3de8] 000807ea                  dc.l edit_get_format
[000e3dec] 0008081c                  dc.l edit_get_colour
[000e3df0] 0008084e                  dc.l edit_get_color
[000e3df4] 00080880                  dc.l edit_get_font
[000e3df8] 000808bc                  dc.l edit_get_cursor
[000e3dfc] 000808ea                  dc.l edit_get_dirty
[000e3e00] 00080908                  dc.l edit_get_sel
[000e3e04] 0008093a                  dc.l edit_get_scrollinfo
[000e3e08] 000809b8                  dc.l edit_set_format
[000e3e0c] 000809ea                  dc.l edit_set_colour
[000e3e10] 000809ea                  dc.l edit_set_colour
[000e3e14] 00080a1c                  dc.l edit_set_font
[000e3e18] 00080a5a                  dc.l edit_set_cursor
[000e3e1c] 00080a88                  dc.l edit_resized
[000e3e20] 00080aba                  dc.l edit_set_dirty
[000e3e24] 00080ae0                  dc.l edit_scroll
[000e3e28] 0007eb46                  dc.l EvntMulti
[000e3e2c] 0007f0aa                  dc.l form_wbutton
[000e3e30] 0007f0e8                  dc.l form_xdial
[000e3e34] 0007f138                  dc.l form_xdo
[000e3e38] 0007f170                  dc.l form_xerr
[000e3e3c] 00078a06                  dc.l _crystal
[000e3e40] 0007f3c2                  dc.l graf_wwatchbox
[000e3e44] 0007f45a                  dc.l graf_xhandle
[000e3e48] 00080490                  dc.l wdlg_create
[000e3e4c] 000804d0                  dc.l wdlg_open
[000e3e50] 00080518                  dc.l wdlg_close
[000e3e54] 0008053e                  dc.l wdlg_delete
[000e3e58] 00080554                  dc.l wdlg_get_tree
[000e3e5c] 0008057a                  dc.l wdlg_get_edit
[000e3e60] 0008059c                  dc.l wdlg_get_udata
[000e3e64] 000805b2                  dc.l wdlg_get_handle
[000e3e68] 000805c8                  dc.l wdlg_set_edit
[000e3e6c] 000805e6                  dc.l wdlg_set_tree
[000e3e70] 00080608                  dc.l wdlg_set_size
[000e3e74] 0008062a                  dc.l wdlg_set_iconify
[000e3e78] 00080662                  dc.l wdlg_set_uniconify
[000e3e7c] 0008068e                  dc.l wdlg_evnt
[000e3e80] 000806b0                  dc.l wdlg_redraw
[000e3e84] 0007fa9c                  dc.l wind_draw
[000e3e88] 0007f548                  dc.l scrp_clear
[000e3e8c] 0007ee9c                  dc.l objc_xedit
[000e3e90] 0007f212                  dc.l graf_rubbbox
funcAes:
[000e3e94] 000e3b60                  dc.l func1Aes
[000e3e98]                           dc.w $0000
funcAnzAes:
[000e3e9a]                           dc.w $0001
func1MtAes:
[000e3e9c] 00078a1c                  dc.l mt_appl_init
[000e3ea0] 00078a7a                  dc.l mt_appl_read
[000e3ea4] 00078ae8                  dc.l mt_appl_write
[000e3ea8] 00078b56                  dc.l mt_appl_find
[000e3eac] 00078cd2                  dc.l mt_appl_search
[000e3eb0] 00078bb0                  dc.l mt_appl_tplay
[000e3eb4] 00078c1e                  dc.l mt_appl_trecord
[000e3eb8] 00078c82                  dc.l mt_appl_yield
[000e3ebc] 00078d52                  dc.l mt_appl_exit
[000e3ec0] 00078da2                  dc.l mt_appl_getinfo
[000e3ec4] 00078f5c                  dc.l mt_appl_control
[000e3ec8] 00078fca                  dc.l mt_evnt_keybd
[000e3ecc] 0007901a                  dc.l mt_evnt_button
[000e3ed0] 000790c4                  dc.l mt_evnt_mouse
[000e3ed4] 0007917a                  dc.l mt_evnt_mesag
[000e3ed8] 000791d4                  dc.l mt_evnt_timer
[000e3edc] 000794b4                  dc.l mt_evnt_event
[000e3ee0] 00079240                  dc.l mt_evnt_multi
[000e3ee4] 000795ce                  dc.l mt_evnt_dclick
[000e3ee8] 00079632                  dc.l mt_menu_bar
[000e3eec] 00079696                  dc.l mt_menu_icheck
[000e3ef0] 00079704                  dc.l mt_menu_ienable
[000e3ef4] 00079772                  dc.l mt_menu_tnormal
[000e3ef8] 000797ea                  dc.l mt_menu_text
[000e3efc] 00079854                  dc.l mt_menu_register
[000e3f00] 000798b8                  dc.l mt_menu_unregister
[000e3f04] 00079912                  dc.l mt_menu_click
[000e3f08] 00079976                  dc.l mt_menu_attach
[000e3f0c] 000799ea                  dc.l mt_menu_istart
[000e3f10] 00079a62                  dc.l mt_menu_popup
[000e3f14] 00079ad6                  dc.l mt_menu_settings
[000e3f18] 00079b3a                  dc.l mt_objc_add
[000e3f1c] 00079ba8                  dc.l mt_objc_delete
[000e3f20] 00079c0c                  dc.l mt_objc_draw
[000e3f24] 00079c96                  dc.l mt_objc_find
[000e3f28] 00079d14                  dc.l mt_objc_offset
[000e3f2c] 00079d94                  dc.l mt_objc_order
[000e3f30] 00079e02                  dc.l mt_objc_edit
[000e3f34] 00079f2c                  dc.l mt_objc_change
[000e3f38] 00079fbc                  dc.l mt_objc_sysvar
[000e3f3c] 0007a050                  dc.l mt_form_do
[000e3f40] 0007a0b4                  dc.l mt_form_dial
[000e3f44] 0007a146                  dc.l mt_form_alert
[000e3f48] 0007a1aa                  dc.l mt_form_error
[000e3f4c] 0007a218                  dc.l mt_form_center
[000e3f50] 0007a2aa                  dc.l mt_form_keybd
[000e3f54] 0007a33e                  dc.l mt_form_button
[000e3f58] 0007a5be                  dc.l mt_graf_rubbox
[000e3f5c] 0007a652                  dc.l mt_graf_rubberbox
[000e3f60] 0007a6ce                  dc.l mt_graf_dragbox
[000e3f64] 0007a77a                  dc.l mt_graf_mbox
[000e3f68] 0007a7fa                  dc.l mt_graf_movebox
[000e3f6c] 0007a834                  dc.l mt_graf_growbox
[000e3f70] 0007a8c0                  dc.l mt_graf_shrinkbox
[000e3f74] 0007a94c                  dc.l mt_graf_watchbox
[000e3f78] 0007aa46                  dc.l mt_graf_slidebox
[000e3f7c] 0007aabe                  dc.l mt_graf_handle
[000e3f80] 0007abe4                  dc.l mt_graf_mouse
[000e3f84] 0007ac48                  dc.l mt_graf_mkstate
[000e3f88] 0007acd4                  dc.l mt_graf_multirubber
[000e3f8c] 0007ad6e                  dc.l mt_scrp_read
[000e3f90] 0007adc8                  dc.l mt_scrp_write
[000e3f94] 0007ae72                  dc.l mt_fsel_input
[000e3f98] 0007aee0                  dc.l mt_fsel_exinput
[000e3f9c] 0007af8e                  dc.l mt_fsel_boxinput
[000e3fa0] 0007b03c                  dc.l mt_fslx_open
[000e3fa4] 0007b0f2                  dc.l mt_fslx_close
[000e3fa8] 0007b14c                  dc.l mt_fslx_getnxtfile
[000e3fac] 0007b1ac                  dc.l mt_fslx_evnt
[000e3fb0] 0007b250                  dc.l mt_fslx_do
[000e3fb4] 0007b326                  dc.l mt_fslx_set_flags
[000e3fb8] 0007b396                  dc.l mt_wind_create
[000e3fbc] 0007b410                  dc.l mt_wind_open
[000e3fc0] 0007b48a                  dc.l mt_wind_close
[000e3fc4] 0007b4e4                  dc.l mt_wind_delete
[000e3fc8] 0007b53e                  dc.l mt_wind_get
[000e3fcc] 0007b67e                  dc.l mt_wind_getQSB
[000e3fd0] 0007b730                  dc.l mt_wind_set
[000e3fd4] 0007b81c                  dc.l mt_wind_find
[000e3fd8] 0007b880                  dc.l mt_wind_update
[000e3fdc] 0007b8da                  dc.l mt_wind_calc
[000e3fe0] 0007b996                  dc.l mt_wind_new
[000e3fe4] 0007ba4a                  dc.l mt_rsrc_load
[000e3fe8] 0007baa4                  dc.l mt_rsrc_free
[000e3fec] 0007baf4                  dc.l mt_rsrc_gaddr
[000e3ff0] 0007bb6a                  dc.l mt_rsrc_saddr
[000e3ff4] 0007bbd8                  dc.l mt_rsrc_obfix
[000e3ff8] 0007bc3c                  dc.l mt_rsrc_rcfix
[000e3ffc] 0007bc96                  dc.l mt_shel_read
[000e4000] 0007bcf6                  dc.l mt_shel_write
[000e4004] 0007bd74                  dc.l mt_shel_get
[000e4008] 0007bdd8                  dc.l mt_shel_put
[000e400c] 0007be3c                  dc.l mt_shel_find
[000e4010] 0007be96                  dc.l mt_shel_envrn
[000e4014] 0007bf22                  dc.l mt_shel_help
[000e4018] 0007bf8c                  dc.l mt_fnts_add
[000e401c] 0007bff0                  dc.l mt_fnts_close
[000e4020] 0007c072                  dc.l mt_fnts_create
[000e4024] 0007c0f6                  dc.l mt_fnts_delete
[000e4028] 0007c15a                  dc.l mt_fnts_do
[000e402c] 0007c210                  dc.l mt_fnts_evnt
[000e4030] 0007c2b6                  dc.l mt_fnts_get_info
[000e4034] 0007c33c                  dc.l mt_fnts_get_name
[000e4038] 0007c3b8                  dc.l mt_fnts_get_no_styles
[000e403c] 0007c420                  dc.l mt_fnts_get_style
[000e4040] 0007c494                  dc.l mt_fnts_open
[000e4044] 0007c51e                  dc.l mt_fnts_remove
[000e4048] 0007c57a                  dc.l mt_fnts_update
[000e404c] 0007c5fe                  dc.l mt_lbox_ascroll_to
[000e4050] 0007c670                  dc.l mt_lbox_scroll_to
[000e4054] 0007c69e                  dc.l mt_lbox_bscroll_to
[000e4058] 0007c710                  dc.l mt_lbox_cnt_items
[000e405c] 0007c76e                  dc.l mt_lbox_create
[000e4060] 0007c82e                  dc.l mt_lbox_delete
[000e4064] 0007c888                  dc.l mt_lbox_do
[000e4068] 0007c8ec                  dc.l mt_lbox_free_items
[000e406c] 0007c948                  dc.l mt_lbox_free_list
[000e4070] 0007c9a4                  dc.l mt_lbox_get_afirst
[000e4074] 0007ca04                  dc.l mt_lbox_get_first
[000e4078] 0007ca1a                  dc.l mt_lbox_get_avis
[000e407c] 0007ca7a                  dc.l mt_lbox_get_visible
[000e4080] 0007ca90                  dc.l mt_lbox_get_bentries
[000e4084] 0007caf0                  dc.l mt_lbox_get_bfirst
[000e4088] 0007cb50                  dc.l mt_lbox_get_idx
[000e408c] 0007cbb6                  dc.l mt_lbox_get_item
[000e4090] 0007cc20                  dc.l mt_lbox_get_items
[000e4094] 0007cc80                  dc.l mt_lbox_get_slct_idx
[000e4098] 0007cce0                  dc.l mt_lbox_get_slct_item
[000e409c] 0007cd40                  dc.l mt_lbox_get_tree
[000e40a0] 0007cda0                  dc.l mt_lbox_get_udata
[000e40a4] 0007ce00                  dc.l mt_lbox_set_asldr
[000e40a8] 0007ce6a                  dc.l mt_lbox_set_slider
[000e40ac] 0007ce94                  dc.l mt_lbox_set_bentries
[000e40b0] 0007cefa                  dc.l mt_lbox_set_bsldr
[000e40b4] 0007cf66                  dc.l mt_lbox_set_items
[000e40b8] 0007cfc8                  dc.l mt_lbox_update
[000e40bc] 0007d024                  dc.l mt_pdlg_add_printers
[000e40c0] 0007d088                  dc.l mt_pdlg_add_sub_dialogs
[000e40c4] 0007d0ee                  dc.l mt_pdlg_close
[000e40c8] 0007d16e                  dc.l mt_pdlg_create
[000e40cc] 0007d1c8                  dc.l mt_pdlg_delete
[000e40d0] 0007d222                  dc.l mt_pdlg_dflt_settings
[000e40d4] 0007d288                  dc.l mt_pdlg_do
[000e40d8] 0007d2f8                  dc.l mt_pdlg_evnt
[000e40dc] 0007d36c                  dc.l mt_pdlg_free_settings
[000e40e0] 0007d3cc                  dc.l mt_pdlg_get_setsize
[000e40e4] 0007d420                  dc.l mt_pdlg_new_settings
[000e40e8] 0007d480                  dc.l mt_pdlg_open
[000e40ec] 0007d504                  dc.l mt_pdlg_remove_printers
[000e40f0] 0007d564                  dc.l mt_pdlg_remove_sub_dialogs
[000e40f4] 0007d5c4                  dc.l mt_pdlg_update
[000e40f8] 0007d62e                  dc.l mt_pdlg_use_settings
[000e40fc] 0007d694                  dc.l mt_pdlg_validate_settings
[000e4100] 0007dd70                  dc.l mt_edit_create
[000e4104] 0007e478                  dc.l mt_edit_set_buf
[000e4108] 0007ddc0                  dc.l mt_edit_open
[000e410c] 0007de24                  dc.l mt_edit_close
[000e4110] 0007de84                  dc.l mt_edit_delete
[000e4114] 0007deda                  dc.l mt_edit_cursor
[000e4118] 0007df52                  dc.l mt_edit_evnt
[000e411c] 0007dfd8                  dc.l mt_edit_get_buf
[000e4120] 0007e06c                  dc.l mt_edit_get_format
[000e4124] 0007e0f2                  dc.l mt_edit_get_colour
[000e4128] 0007e178                  dc.l mt_edit_get_color
[000e412c] 0007e1a6                  dc.l mt_edit_get_font
[000e4130] 0007e24c                  dc.l mt_edit_get_cursor
[000e4134] 0007e2c4                  dc.l mt_edit_get_dirty
[000e4138] 0007e32e                  dc.l mt_edit_get_sel
[000e413c] 0007e3b0                  dc.l mt_edit_get_scrollinfo
[000e4140] 0007e4ec                  dc.l mt_edit_set_format
[000e4144] 0007e566                  dc.l mt_edit_set_colour
[000e4148] 0007e566                  dc.l mt_edit_set_colour
[000e414c] 0007e5e0                  dc.l mt_edit_set_font
[000e4150] 0007e666                  dc.l mt_edit_set_cursor
[000e4154] 0007e6d2                  dc.l mt_edit_resized
[000e4158] 0007e758                  dc.l mt_edit_set_dirty
[000e415c] 0007e7c8                  dc.l mt_edit_scroll
[000e4160] 0007955c                  dc.l mt_EvntMulti
[000e4164] 0007a3ba                  dc.l mt_form_wbutton
[000e4168] 0007a440                  dc.l mt_form_xdial
[000e416c] 0007a4dc                  dc.l mt_form_xdo
[000e4170] 0007a55a                  dc.l mt_form_xerr
[000e4174] 0007a9c8                  dc.l mt_graf_wwatchbox
[000e4178] 0007ab4a                  dc.l mt_graf_xhandle
[000e417c] 0007d6fa                  dc.l mt_wdlg_create
[000e4180] 0007d77a                  dc.l mt_wdlg_open
[000e4184] 0007d804                  dc.l mt_wdlg_close
[000e4188] 0007d886                  dc.l mt_wdlg_delete
[000e418c] 0007d8e0                  dc.l mt_wdlg_get_tree
[000e4190] 0007d94a                  dc.l mt_wdlg_get_edit
[000e4194] 0007d9be                  dc.l mt_wdlg_get_udata
[000e4198] 0007da1e                  dc.l mt_wdlg_get_handle
[000e419c] 0007da7e                  dc.l mt_wdlg_set_edit
[000e41a0] 0007dae6                  dc.l mt_wdlg_set_tree
[000e41a4] 0007db4c                  dc.l mt_wdlg_set_size
[000e41a8] 0007dbb2                  dc.l mt_wdlg_set_iconify
[000e41ac] 0007dc2e                  dc.l mt_wdlg_set_uniconify
[000e41b0] 0007dca0                  dc.l mt_wdlg_evnt
[000e41b4] 0007dd00                  dc.l mt_wdlg_redraw
[000e41b8] 0007b9e6                  dc.l mt_wind_draw
[000e41bc] 0007ae22                  dc.l mt_scrp_clear
[000e41c0] 00079e94                  dc.l mt_objc_xedit
[000e41c4] 0007a690                  dc.l mt_graf_rubbbox
funcMtAes:
[000e41c8] 000e3e9c                  dc.l func1MtAes
[000e41cc]                           dc.w $0000
funcAnzMtAes:
[000e41ce]                           dc.w $0001
func1Keytab:
[000e41d0] 0005c8fe                  dc.l Akt_getKeyTab
[000e41d4] 0005cadc                  dc.l Akt_getRelease
[000e41d8] 0005cc36                  dc.l Akt_getEuro
[000e41dc] 0005c962                  dc.l Akt_getExpMaxNr
[000e41e0] 0005c9ac                  dc.l Akt_getImpMaxNr
[000e41e4] 0005c9cc                  dc.l Akt_getExpNameFromNr
[000e41e8] 0005ca1c                  dc.l Akt_getImpNameFromNr
[000e41ec] 0005ca6c                  dc.l Akt_getExpShortNameFromNr
[000e41f0] 0005caa4                  dc.l Akt_getImpShortNameFromNr
[000e41f4] 0005cb06                  dc.l Akt_getExpNrFromId
[000e41f8] 0005cb32                  dc.l Akt_getImpNrFromId
[000e41fc] 0005cb5e                  dc.l Akt_getExpIdFromNr
[000e4200] 0005cb94                  dc.l Akt_getImpIdFromNr
[000e4204] 0005cbca                  dc.l Akt_getExpNrFromName
[000e4208] 0005cc00                  dc.l Akt_getImpNrFromName
[000e420c] 0005cc84                  dc.l Akt_CharAtari2X
[000e4210] 0005ccba                  dc.l Akt_CharX2Atari
[000e4214] 0005ccf0                  dc.l Akt_BlockAtari2X
[000e4218] 0005cd9a                  dc.l Akt_BlockX2Atari
[000e421c] 0005ce44                  dc.l Akt_StringAtari2X
[000e4220] 0005ce72                  dc.l Akt_StringX2Atari
[000e4224] 0005cea0                  dc.l Akt_CharX2Unicode
[000e4228] 0005cee2                  dc.l Akt_CharUnicode2X
[000e422c] 0005cf24                  dc.l Akt_BlockX2Unicode
[000e4230] 0005cf8c                  dc.l Akt_BlockUnicode2X
[000e4234] 0005cfe2                  dc.l Akt_StringX2Unicode
[000e4238] 0005d262                  dc.l Akt_popExpName
[000e423c] 0005d34c                  dc.l Akt_popImpName
[000e4240] 0005d436                  dc.l Akt_chooseExpNr
[000e4244] 0005d4ce                  dc.l Akt_chooseImpNr
[000e4248] 0005c938                  dc.l Akt_getExpMinNr
[000e424c] 0005c982                  dc.l Akt_getImpMinNr
[000e4250] 0005d010                  dc.l Akt_BlockXUtf2Unicode
[000e4254] 0005d06a                  dc.l Akt_BlockUnicode2XUtf
[000e4258] 0005d1aa                  dc.l Akt_StringXUtf2Unicode
[000e425c] 0005d0c2                  dc.l Akt_BlockXUtf2U2XUtf
[000e4260] 0005d136                  dc.l Akt_BlockXUtf2XUtf
[000e4264] 0005d1e2                  dc.l Akt_StringXUtf2U2XUtf
[000e4268] 0005d222                  dc.l Akt_StringXUtf2XUtf
funcKeytab:
[000e426c] 000e41d0                  dc.l func1Keytab
[000e4270]                           dc.w $0000
funcAnzKeytab:
[000e4272]                           dc.w $0001
	.globl funcs
funcs:
[000e4274] 000e32fc                  dc.l funcAbp
[000e4278] 000e3302                  dc.l funcAnzAbp
[000e427c] 000e3398                  dc.l funcAcfg
[000e4280] 000e339e                  dc.l funcAnzAcfg
[000e4284] 000e33ac                  dc.l funcAch
[000e4288] 000e33b2                  dc.l funcAnzAch
[000e428c] 000e33d0                  dc.l funcAdr
[000e4290] 000e33d6                  dc.l funcAnzAdr
[000e4294] 000e33f4                  dc.l funcAev
[000e4298] 000e33fa                  dc.l funcAnzAev
[000e429c] 000e3444                  dc.l funcAf
[000e42a0] 000e344a                  dc.l funcAnzAf
[000e42a4] 000e3454                  dc.l funcAic
[000e42a8] 000e345a                  dc.l funcAnzAic
[000e42ac] 000e3464                  dc.l funcAim
[000e42b0] 000e346a                  dc.l funcAnzAim
[000e42b4] 000e3474                  dc.l funcAlu
[000e42b8] 000e347a                  dc.l funcAnzAlu
[000e42bc] 000e3484                  dc.l funcAme
[000e42c0] 000e348a                  dc.l funcAnzAme
[000e42c4] 000e34a0                  dc.l funcAmo
[000e42c8] 000e34a6                  dc.l funcAnzAmo
[000e42cc] 000e34fc                  dc.l funcAob
[000e42d0] 000e3502                  dc.l funcAnzAob
[000e42d4] 000e3510                  dc.l funcAscrp
[000e42d8] 000e3516                  dc.l funcAnzAscrp
[000e42dc] 000e3574                  dc.l funcAsh
[000e42e0] 000e357a                  dc.l funcAnzAsh
[000e42e4] 000e35cc                  dc.l funcAst
[000e42e8] 000e35d2                  dc.l funcAnzAst
[000e42ec] 000e35dc                  dc.l funcAte
[000e42f0] 000e35e2                  dc.l funcAnzAte
[000e42f4] 000e35f8                  dc.l funcAuo
[000e42f8] 000e35fe                  dc.l funcAnzAuo
[000e42fc] 000e3610                  dc.l funcAus
[000e4300] 000e3616                  dc.l funcAnzAus
[000e4304] 000e36c4                  dc.l funcAwi
[000e4308] 000e36ca                  dc.l funcAnzAwi
[000e430c] 000e3704                  dc.l funcA
[000e4310] 000e370a                  dc.l funcAnzA
[000e4314] 000e377c                  dc.l funcSonst
[000e4318] 000e3782                  dc.l funcAnzSonst
[000e431c] 000e3b58                  dc.l funcVdi
[000e4320] 000e3b5e                  dc.l funcAnzVdi
[000e4324] 000e3e94                  dc.l funcAes
[000e4328] 000e3e9a                  dc.l funcAnzAes
[000e432c] 000e426c                  dc.l funcKeytab
[000e4330] 000e4272                  dc.l funcAnzKeytab
[000e4334] 000e41c8                  dc.l funcMtAes
[000e4338] 000e41ce                  dc.l funcAnzMtAes
	.globl funcsAnz
funcsAnz:
[000e433c]                           dc.w $0000
[000e433e]                           dc.w $0019
	.globl ACS233
ACS233:
[000e4340] 00055e68                  dc.l Awi_wid
[000e4344] 00055e8c                  dc.l Awi_root
[000e4348] 000569d6                  dc.l Awi_list
[000e434c] 00056a20                  dc.l Awi_sendall
[000e4350] 00056b70                  dc.l Awi_down
[000e4354] 00056af6                  dc.l Awi_up
[000e4358] 00056bea                  dc.l Awi_show
[000e435c] 00055e94                  dc.l Awi_init
[000e4360] 0007174a                  dc.l Awi_create23x
[000e4364] 00057428                  dc.l Awi_open
[000e4368] 00058362                  dc.l Awi_closed
[000e436c] 000585f2                  dc.l Awi_delete
[000e4370] 000587a4                  dc.l Awi_topped
[000e4374] 000587ec                  dc.l Awi_fulled
[000e4378] 00058bb0                  dc.l Awi_sized
[000e437c] 00058d50                  dc.l Awi_moved
[000e4380] 00051388                  dc.l Awi_diaend
[000e4384] 0005147c                  dc.l Awi_diastart
[000e4388] 0006b744                  dc.l Awi_keys
[000e438c] 00052906                  dc.l Awi_obview
[000e4390] 00059dd0                  dc.l Awi_service
[000e4394] 000544c4                  dc.l Awi_scroll
[000e4398] 00051852                  dc.l Awi_obchange
[000e439c] 00051b80                  dc.l Awi_obredraw
[000e43a0] 00051c46                  dc.l Awi_redraw
[000e43a4] 00071928                  dc.l Awi_arrowed23x
[000e43a8] 000524b4                  dc.l Awi_hslid
[000e43ac] 0005255e                  dc.l Awi_vslid
[000e43b0] 0004b496                  dc.l Af_cfgfile
[000e43b4] 0004a30e                  dc.l Aev_quit
[000e43b8] 0004b086                  dc.l Aev_mess
[000e43bc] 0004a2f8                  dc.l Aev_unhidepointer
[000e43c0] 0004ee3c                  dc.l Amo_new
[000e43c4] 0004eec0                  dc.l Amo_busy
[000e43c8] 0004ef0c                  dc.l Amo_unbusy
[000e43cc] 0004ef40                  dc.l Amo_hide
[000e43d0] 0004ef66                  dc.l Amo_show
[000e43d4] 0007162c                  dc.l Aob_create23x
[000e43d8] 0004f20a                  dc.l Aob_delete
[000e43dc] 0004fbdc                  dc.l Aob_fix
[000e43e0] 0004fe06                  dc.l Aob_offset
[000e43e4] 0005009c                  dc.l Aob_save
[000e43e8] 0005021e                  dc.l Aob_restore
[000e43ec] 000509a4                  dc.l Aob_watch
[000e43f0] 00050e62                  dc.l Aob_findflag
[000e43f4] 00050f3a                  dc.l Aob_up
[000e43f8] 0004ec24                  dc.l Ame_namefix
[000e43fc] 0004e84a                  dc.l Ame_popup
[000e4400] 00054b6e                  dc.l Abp_create
[000e4404] 00054c04                  dc.l Abp_delete
[000e4408] 00054c18                  dc.l Abp_start
[000e440c] 00054cf2                  dc.l Abp_end
[000e4410] 000484fe                  dc.l Adr_box
[000e4414] 00049140                  dc.l Adr_drag
[000e4418] 00047e2a                  dc.l Adr_next
[000e441c] 00047e6a                  dc.l Adr_add
[000e4420] 00047f76                  dc.l Adr_del
[000e4424] 0004810e                  dc.l Adr_unselect
[000e4428] 0004643c                  dc.l Ast_create
[000e442c] 0004649c                  dc.l Ast_delete
[000e4430] 0004f606                  dc.l Aic_create
[000e4434] 0004f99a                  dc.l Aic_delete
[000e4438] 0004fa4c                  dc.l Aim_create
[000e443c] 0004fa76                  dc.l Aim_delete
[000e4440] 000715ec                  dc.l Aus_create23x
[000e4444] 0004fbb2                  dc.l Aus_delete
[000e4448] 0004fa88                  dc.l Ate_create
[000e444c] 0004fb24                  dc.l Ate_delete
[000e4450] 0004c608                  dc.l Ax_malloc
[000e4454] 0004c7c8                  dc.l Ax_free
[000e4458] 0004c6c8                  dc.l Ax_ifree
[000e445c] 000713c0                  dc.l Ax_mterm
[000e4460] 0006b77a                  dc.l Awi_nokey
[000e4464] 000505fa                  dc.l Aob_alias
[000e4468] 0006c596                  dc.l A_dialog
[000e446c] 0006b80c                  dc.l alert_str
[000e4470] 0006c662                  dc.l intersect
[000e4474] 0006323e                  dc.l A_checkbox
[000e4478] 0006322c                  dc.l A_radiobutton
[000e447c] 00064256                  dc.l A_innerframe
[000e4480] 000659ea                  dc.l A_pattern
[000e4484] 00065c72                  dc.l A_arrows
[000e4488] 00047e1e                  dc.l Adr_start
[000e448c] 000661d6                  dc.l A_select
[000e4490] 00055e98                  dc.l Ash_prog
[000e4494] 0006cefe                  dc.l Af_select
[000e4498] 0006639a                  dc.l A_ftext
[000e449c] 00065620                  dc.l A_title
[000e44a0] 00064a22                  dc.l A_3Dbutton
[000e44a4] 00066c46                  dc.l A_cycle
[000e44a8] 00067ece                  dc.l A_picture
[000e44ac] 00066924                  dc.l Auo_ftext
[000e44b0] 000630f2                  dc.l Auo_string
[000e44b4] 00067456                  dc.l Auo_cycle
[000e44b8] 00067ca4                  dc.l Aus_cycle
[000e44bc] 0006863e                  dc.l Auo_picture
[000e44c0] 0006c5a6                  dc.l A_dialog2
[000e44c4] 0004fd76                  dc.l Aob_icon
[000e44c8] 00057b82                  dc.l Awi_modal
[000e44cc] 00059df4                  dc.l Awi_dialog
[000e44d0] 0005a600                  dc.l Awi_alert
[000e44d4] 00056c16                  dc.l Awi_selfcreate
[000e44d8] 00050c80                  dc.l Aev_release
[000e44dc] 00050fd8                  dc.l Aob_puttext
[000e44e0] 000511da                  dc.l Aob_gettext
[000e44e4] 0006b7a6                  dc.l Aob_within
[000e44e8] 0006c7a0                  dc.l xywh2array
[000e44ec] 0006c7f0                  dc.l array2xywh
[000e44f0] 00047518                  dc.l dotted_xline
[000e44f4] 000475e6                  dc.l dotted_yline
[000e44f8] 0005bb0c                  dc.l Ash_error
[000e44fc] 00080ec4                  dc.l Ash_getc
[000e4500] 00043f94                  dc.l nkc_tos2
[000e4504] 000442c2                  dc.l nkc_gem2n
[000e4508] 00044108                  dc.l nkc_n2to
[000e450c] 00044330                  dc.l nkc_n2gem
[000e4510] 00044374                  dc.l nkc_kstate
[000e4514] 000443b8                  dc.l nkc_cmp
[000e4518] 00054d96                  dc.l Abp_mfdb2img
[000e451c] 00055410                  dc.l Abp_img2mfdb
[000e4520] 00050f94                  dc.l Aob_printf
[000e4524] 000510fe                  dc.l Aob_scanf
[000e4528] 0004b548                  dc.l Af_2drv
[000e452c] 0004b586                  dc.l Af_2path
[000e4530] 0004b66e                  dc.l Af_2name
[000e4534] 0004b706                  dc.l Af_2fullname
[000e4538] 0004b758                  dc.l Af_2ext
[000e453c] 0004b7bc                  dc.l Af_buildname
[000e4540] 0004b8fa                  dc.l Af_length
[000e4544] 0006c904                  dc.l Ascrp_clear
[000e4548] 0006ca2c                  dc.l Ascrp_get
[000e454c] 0006cc22                  dc.l Ascrp_put
[000e4550] 0005be00                  dc.l Ash_getenv
[000e4554] 0005dd58                  dc.l Ash_nextdd
[000e4558] 0005dc8e                  dc.l Ash_sendall
[000e455c] 0006d206                  dc.l Af_first_fsel
[000e4560] 0006d450                  dc.l Af_next_fsel
[000e4564] 00044274                  dc.l nkc_tolo
[000e4568] 00044264                  dc.l nkc_toup
[000e456c] 0005ae7e                  dc.l Awi_update
[000e4570] 0006afea                  dc.l A_boxed
[000e4574] 0006a068                  dc.l Auo_boxed
[000e4578] 00069b4e                  dc.l Aus_boxed
[000e457c] 0005180a                  dc.l Awi_uoself
[000e4580] 0004c0de                  dc.l Af_first
[000e4584] 0004c12c                  dc.l Af_next
[000e4588] 0004bfa2                  dc.l Af_readdir
[000e458c] 0004c0a6                  dc.l Af_freedir
[000e4590] 00070c0a                  dc.l Alu_create
[000e4594] 00070c5e                  dc.l Alu_delete
[000e4598] 00044572                  dc.l Acfg_create
[000e459c] 000445d0                  dc.l Acfg_delete
[000e45a0] 00044866                  dc.l Acfg_clear
[000e45a4] 000449d2                  dc.l Acfg_clearGroup
[000e45a8] 00044e4a                  dc.l Acfg_load
[000e45ac] 00045238                  dc.l Acfg_save
[000e45b0] 00045970                  dc.l Acfg_isChanged
[000e45b4] 00045460                  dc.l Acfg_getValue
[000e45b8] 000455ae                  dc.l Acfg_setValue
[000e45bc] 0004574a                  dc.l Acfg_clearValue
[000e45c0] 00045d16                  dc.l Acfg_clearHeader
[000e45c4] 00045d72                  dc.l Acfg_headAnzahl
[000e45c8] 00045d80                  dc.l Acfg_setHeader
[000e45cc] 00045e22                  dc.l Acfg_getHeader
[000e45d0] 0004597e                  dc.l Acfg_grpAnzahl
[000e45d4] 0004598c                  dc.l Acfg_grpName
[000e45d8] 000459da                  dc.l Acfg_strAnzahl
[000e45dc] 00045aa6                  dc.l Acfg_strName
[000e45e0] 00045e7c                  dc.l Acfg_isCfgfile
[000e45e4] 00044690                  dc.l Acfg_createInfo
[000e45e8] 000446c4                  dc.l Acfg_deleteInfo
[000e45ec] 00044822                  dc.l Acfg_setInfo
[000e45f0] 00044846                  dc.l Acfg_getInfo
[000e45f4] 000447a6                  dc.l Acfg_copyInfo
[000e45f8] 000464c8                  dc.l Ach_tolower
[000e45fc] 000464b6                  dc.l Ach_toupper
[000e4600] 000469d0                  dc.l Ach_isWhite
[000e4604] 0004651a                  dc.l Ast_tolower
[000e4608] 000464da                  dc.l Ast_toupper
[000e460c] 0004655a                  dc.l Ast_ltrim
[000e4610] 000465c6                  dc.l Ast_rtrim
[000e4614] 0004663c                  dc.l Ast_alltrim
[000e4618] 0004665a                  dc.l Ast_cmp
[000e461c] 000466ea                  dc.l Ast_icmp
[000e4620] 000469f6                  dc.l Ast_isEmpty
[000e4624] 00046a3a                  dc.l Ast_add
[000e4628] 00046b28                  dc.l Ast_adl
[000e462c] 00046b7e                  dc.l Ast_adr
[000e4630] 00046be8                  dc.l Ast_adc
[000e4634] 00046c4e                  dc.l Ast_filter
[000e4638] 00046d06                  dc.l Ast_count
[000e463c] 00046e7e                  dc.l Ast_fcmp
[000e4640] 0005a366                  dc.l Awi_doform
[000e4644] 000715ea                  dc.l noop
[000e4648] 000715ea                  dc.l noop
[000e464c] 000715ea                  dc.l noop
[000e4650] 000715ea                  dc.l noop
[000e4654] 000715ea                  dc.l noop
[000e4658] 000715ea                  dc.l noop
[000e465c] 000715ea                  dc.l noop
[000e4660] 000715ea                  dc.l noop
[000e4664] 000715ea                  dc.l noop
[000e4668] 000715ea                  dc.l noop
	.globl ACS230
ACS230:
[000e466c] 00055e68                  dc.l Awi_wid
[000e4670] 00055e8c                  dc.l Awi_root
[000e4674] 000569d6                  dc.l Awi_list
[000e4678] 00056a20                  dc.l Awi_sendall
[000e467c] 00056b70                  dc.l Awi_down
[000e4680] 00056af6                  dc.l Awi_up
[000e4684] 00056bea                  dc.l Awi_show
[000e4688] 00055e94                  dc.l Awi_init
[000e468c] 0007174a                  dc.l Awi_create23x
[000e4690] 00057428                  dc.l Awi_open
[000e4694] 00058362                  dc.l Awi_closed
[000e4698] 000585f2                  dc.l Awi_delete
[000e469c] 000587a4                  dc.l Awi_topped
[000e46a0] 000587ec                  dc.l Awi_fulled
[000e46a4] 00058bb0                  dc.l Awi_sized
[000e46a8] 00058d50                  dc.l Awi_moved
[000e46ac] 00051388                  dc.l Awi_diaend
[000e46b0] 0005147c                  dc.l Awi_diastart
[000e46b4] 0006b744                  dc.l Awi_keys
[000e46b8] 00052906                  dc.l Awi_obview
[000e46bc] 00059dd0                  dc.l Awi_service
[000e46c0] 000544c4                  dc.l Awi_scroll
[000e46c4] 00051852                  dc.l Awi_obchange
[000e46c8] 00051b80                  dc.l Awi_obredraw
[000e46cc] 00051c46                  dc.l Awi_redraw
[000e46d0] 00071928                  dc.l Awi_arrowed23x
[000e46d4] 000524b4                  dc.l Awi_hslid
[000e46d8] 0005255e                  dc.l Awi_vslid
[000e46dc] 0004b496                  dc.l Af_cfgfile
[000e46e0] 0004a30e                  dc.l Aev_quit
[000e46e4] 0004b086                  dc.l Aev_mess
[000e46e8] 0004a2f8                  dc.l Aev_unhidepointer
[000e46ec] 0004ee3c                  dc.l Amo_new
[000e46f0] 0004eec0                  dc.l Amo_busy
[000e46f4] 0004ef0c                  dc.l Amo_unbusy
[000e46f8] 0004ef40                  dc.l Amo_hide
[000e46fc] 0004ef66                  dc.l Amo_show
[000e4700] 0007162c                  dc.l Aob_create23x
[000e4704] 0004f20a                  dc.l Aob_delete
[000e4708] 0004fbdc                  dc.l Aob_fix
[000e470c] 0004fe06                  dc.l Aob_offset
[000e4710] 0005009c                  dc.l Aob_save
[000e4714] 0005021e                  dc.l Aob_restore
[000e4718] 000509a4                  dc.l Aob_watch
[000e471c] 00050e62                  dc.l Aob_findflag
[000e4720] 00050f3a                  dc.l Aob_up
[000e4724] 0004ec24                  dc.l Ame_namefix
[000e4728] 0004e84a                  dc.l Ame_popup
[000e472c] 00054b6e                  dc.l Abp_create
[000e4730] 00054c04                  dc.l Abp_delete
[000e4734] 00054c18                  dc.l Abp_start
[000e4738] 00054cf2                  dc.l Abp_end
[000e473c] 000484fe                  dc.l Adr_box
[000e4740] 00049140                  dc.l Adr_drag
[000e4744] 00047e2a                  dc.l Adr_next
[000e4748] 00047e6a                  dc.l Adr_add
[000e474c] 00047f76                  dc.l Adr_del
[000e4750] 0004810e                  dc.l Adr_unselect
[000e4754] 0004643c                  dc.l Ast_create
[000e4758] 0004649c                  dc.l Ast_delete
[000e475c] 0004f606                  dc.l Aic_create
[000e4760] 0004f99a                  dc.l Aic_delete
[000e4764] 0004fa4c                  dc.l Aim_create
[000e4768] 0004fa76                  dc.l Aim_delete
[000e476c] 000715ec                  dc.l Aus_create23x
[000e4770] 0004fbb2                  dc.l Aus_delete
[000e4774] 0004fa88                  dc.l Ate_create
[000e4778] 0004fb24                  dc.l Ate_delete
[000e477c] 0004c608                  dc.l Ax_malloc
[000e4780] 0004c7c8                  dc.l Ax_free
[000e4784] 0004c6c8                  dc.l Ax_ifree
[000e4788] 000713c0                  dc.l Ax_mterm
[000e478c] 0006b77a                  dc.l Awi_nokey
[000e4790] 000505fa                  dc.l Aob_alias
[000e4794] 0006c596                  dc.l A_dialog
[000e4798] 0006b80c                  dc.l alert_str
[000e479c] 0006c662                  dc.l intersect
[000e47a0] 0006323e                  dc.l A_checkbox
[000e47a4] 0006322c                  dc.l A_radiobutton
[000e47a8] 00064256                  dc.l A_innerframe
[000e47ac] 000659ea                  dc.l A_pattern
[000e47b0] 00065c72                  dc.l A_arrows
[000e47b4] 00047e1e                  dc.l Adr_start
[000e47b8] 000661d6                  dc.l A_select
[000e47bc] 00055e98                  dc.l Ash_prog
[000e47c0] 0006cefe                  dc.l Af_select
[000e47c4] 0006639a                  dc.l A_ftext
[000e47c8] 00065620                  dc.l A_title
[000e47cc] 00064a22                  dc.l A_3Dbutton
[000e47d0] 00066c46                  dc.l A_cycle
[000e47d4] 00067ece                  dc.l A_picture
[000e47d8] 00066924                  dc.l Auo_ftext
[000e47dc] 000630f2                  dc.l Auo_string
[000e47e0] 00067456                  dc.l Auo_cycle
[000e47e4] 00067ca4                  dc.l Aus_cycle
[000e47e8] 0006863e                  dc.l Auo_picture
[000e47ec] 0006c5a6                  dc.l A_dialog2
[000e47f0] 0004fd76                  dc.l Aob_icon
[000e47f4] 00057b82                  dc.l Awi_modal
[000e47f8] 00059df4                  dc.l Awi_dialog
[000e47fc] 0005a600                  dc.l Awi_alert
[000e4800] 00056c16                  dc.l Awi_selfcreate
[000e4804] 00050c80                  dc.l Aev_release
[000e4808] 00050fd8                  dc.l Aob_puttext
[000e480c] 000511da                  dc.l Aob_gettext
[000e4810] 0006b7a6                  dc.l Aob_within
[000e4814] 0006c7a0                  dc.l xywh2array
[000e4818] 0006c7f0                  dc.l array2xywh
[000e481c] 00047518                  dc.l dotted_xline
[000e4820] 000475e6                  dc.l dotted_yline
[000e4824] 0005bb0c                  dc.l Ash_error
[000e4828] 00080ec4                  dc.l Ash_getc
[000e482c] 00043f94                  dc.l nkc_tos2
[000e4830] 000442c2                  dc.l nkc_gem2n
[000e4834] 00044108                  dc.l nkc_n2to
[000e4838] 00044330                  dc.l nkc_n2gem
[000e483c] 00044374                  dc.l nkc_kstate
[000e4840] 000443b8                  dc.l nkc_cmp
[000e4844] 00054d96                  dc.l Abp_mfdb2img
[000e4848] 00055410                  dc.l Abp_img2mfdb
[000e484c] 00050f94                  dc.l Aob_printf
[000e4850] 000510fe                  dc.l Aob_scanf
[000e4854] 0004b548                  dc.l Af_2drv
[000e4858] 0004b586                  dc.l Af_2path
[000e485c] 0004b66e                  dc.l Af_2name
[000e4860] 0004b706                  dc.l Af_2fullname
[000e4864] 0004b758                  dc.l Af_2ext
[000e4868] 0004b7bc                  dc.l Af_buildname
[000e486c] 0004b8fa                  dc.l Af_length
[000e4870] 0006c904                  dc.l Ascrp_clear
[000e4874] 0006ca2c                  dc.l Ascrp_get
[000e4878] 0006cc22                  dc.l Ascrp_put
[000e487c] 0005be00                  dc.l Ash_getenv
[000e4880] 0005dd58                  dc.l Ash_nextdd
[000e4884] 0005dc8e                  dc.l Ash_sendall
[000e4888] 0006d206                  dc.l Af_first_fsel
[000e488c] 0006d450                  dc.l Af_next_fsel
[000e4890] 00044274                  dc.l nkc_tolo
[000e4894] 00044264                  dc.l nkc_toup
[000e4898] 0005ae7e                  dc.l Awi_update
[000e489c] 0006afea                  dc.l A_boxed
[000e48a0] 0006a068                  dc.l Auo_boxed
[000e48a4] 00069b4e                  dc.l Aus_boxed
[000e48a8] 0005180a                  dc.l Awi_uoself
[000e48ac] 00071932                  dc.l Af_first230
[000e48b0] 0007193c                  dc.l Af_next230
[000e48b4] 0004bfa2                  dc.l Af_readdir
[000e48b8] 0004c0a6                  dc.l Af_freedir
[000e48bc] 00070c0a                  dc.l Alu_create
[000e48c0] 00070c5e                  dc.l Alu_delete
[000e48c4] 00044572                  dc.l Acfg_create
[000e48c8] 000445d0                  dc.l Acfg_delete
[000e48cc] 00044866                  dc.l Acfg_clear
[000e48d0] 000449d2                  dc.l Acfg_clearGroup
[000e48d4] 00044e4a                  dc.l Acfg_load
[000e48d8] 00045238                  dc.l Acfg_save
[000e48dc] 00045970                  dc.l Acfg_isChanged
[000e48e0] 00045460                  dc.l Acfg_getValue
[000e48e4] 000455ae                  dc.l Acfg_setValue
[000e48e8] 0004574a                  dc.l Acfg_clearValue
[000e48ec] 00045d16                  dc.l Acfg_clearHeader
[000e48f0] 00045d72                  dc.l Acfg_headAnzahl
[000e48f4] 00045d80                  dc.l Acfg_setHeader
[000e48f8] 00045e22                  dc.l Acfg_getHeader
[000e48fc] 0004597e                  dc.l Acfg_grpAnzahl
[000e4900] 0004598c                  dc.l Acfg_grpName
[000e4904] 000459da                  dc.l Acfg_strAnzahl
[000e4908] 00045aa6                  dc.l Acfg_strName
[000e490c] 00045e7c                  dc.l Acfg_isCfgfile
[000e4910] 00044690                  dc.l Acfg_createInfo
[000e4914] 000446c4                  dc.l Acfg_deleteInfo
[000e4918] 00044822                  dc.l Acfg_setInfo
[000e491c] 00044846                  dc.l Acfg_getInfo
[000e4920] 000447a6                  dc.l Acfg_copyInfo
[000e4924] 000464c8                  dc.l Ach_tolower
[000e4928] 000464b6                  dc.l Ach_toupper
[000e492c] 000469d0                  dc.l Ach_isWhite
[000e4930] 0004651a                  dc.l Ast_tolower
[000e4934] 000464da                  dc.l Ast_toupper
[000e4938] 0004655a                  dc.l Ast_ltrim
[000e493c] 000465c6                  dc.l Ast_rtrim
[000e4940] 0004663c                  dc.l Ast_alltrim
[000e4944] 0004665a                  dc.l Ast_cmp
[000e4948] 000466ea                  dc.l Ast_icmp
[000e494c] 000469f6                  dc.l Ast_isEmpty
[000e4950] 00046a3a                  dc.l Ast_add
[000e4954] 00046b28                  dc.l Ast_adl
[000e4958] 00046b7e                  dc.l Ast_adr
[000e495c] 00046be8                  dc.l Ast_adc
[000e4960] 00046c4e                  dc.l Ast_filter
[000e4964] 00046d06                  dc.l Ast_count
[000e4968] 00046e7e                  dc.l Ast_fcmp
[000e496c] 0005a366                  dc.l Awi_doform
[000e4970] 000715ea                  dc.l noop
[000e4974] 000715ea                  dc.l noop
[000e4978] 000715ea                  dc.l noop
[000e497c] 000715ea                  dc.l noop
[000e4980] 000715ea                  dc.l noop
[000e4984] 000715ea                  dc.l noop
[000e4988] 000715ea                  dc.l noop
[000e498c] 000715ea                  dc.l noop
[000e4990] 000715ea                  dc.l noop
[000e4994] 000715ea                  dc.l noop
[000e4998]                           dc.w $0000
