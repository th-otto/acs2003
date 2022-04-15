info:
[00013f92] 4fef ffce                 lea.l      -50(a7),a7
[00013f96] 2f48 002e                 move.l     a0,46(a7)
[00013f9a] 206f 002e                 movea.l    46(a7),a0
[00013f9e] 2f50 002a                 move.l     (a0),42(a7)
[00013fa2] 2f7c 0000 0262 0022       move.l     #$00000262,34(a7)
[00013faa] 42af 001e                 clr.l      30(a7)
[00013fae] 206f 002a                 movea.l    42(a7),a0
[00013fb2] 2f68 0010 0026            move.l     16(a0),38(a7)
[00013fb8] 601a                      bra.s      $00013FD4
[00013fba] 52af 001e                 addq.l     #1,30(a7)
[00013fbe] 7042                      moveq.l    #66,d0
[00013fc0] 206f 0026                 movea.l    38(a7),a0
[00013fc4] d0a8 000e                 add.l      14(a0),d0
[00013fc8] d1af 0022                 add.l      d0,34(a7)
[00013fcc] 206f 0026                 movea.l    38(a7),a0
[00013fd0] 2f50 0026                 move.l     (a0),38(a7)
[00013fd4] 202f 0026                 move.l     38(a7),d0
[00013fd8] 66e0                      bne.s      $00013FBA
[00013fda] 41f9 0009 ac1c            lea.l      WI_INFO_GENERAL,a0
[00013fe0] 2279 0009 ac24            movea.l    $0009AC24,a1
[00013fe6] 4e91                      jsr        (a1)
[00013fe8] 2f48 001a                 move.l     a0,26(a7)
[00013fec] 677c                      beq.s      $0001406A
[00013fee] 206f 002a                 movea.l    42(a7),a0
[00013ff2] 2268 0008                 movea.l    8(a0),a1
[00013ff6] 7004                      moveq.l    #4,d0
[00013ff8] 206f 001a                 movea.l    26(a7),a0
[00013ffc] 2068 0014                 movea.l    20(a0),a0
[00014000] 4eb9 0005 0fd8            jsr        Aob_puttext
[00014006] 2f2f 0022                 move.l     34(a7),-(a7)
[0001400a] 43f9 0009 acd2            lea.l      $0009ACD2,a1
[00014010] 41ef 0004                 lea.l      4(a7),a0
[00014014] 4eb9 0008 15ac            jsr        sprintf
[0001401a] 584f                      addq.w     #4,a7
[0001401c] 43d7                      lea.l      (a7),a1
[0001401e] 7008                      moveq.l    #8,d0
[00014020] 206f 001a                 movea.l    26(a7),a0
[00014024] 2068 0014                 movea.l    20(a0),a0
[00014028] 4eb9 0005 0fd8            jsr        Aob_puttext
[0001402e] 2f2f 001e                 move.l     30(a7),-(a7)
[00014032] 43f9 0009 acd6            lea.l      $0009ACD6,a1
[00014038] 41ef 0004                 lea.l      4(a7),a0
[0001403c] 4eb9 0008 15ac            jsr        sprintf
[00014042] 584f                      addq.w     #4,a7
[00014044] 43d7                      lea.l      (a7),a1
[00014046] 7006                      moveq.l    #6,d0
[00014048] 206f 001a                 movea.l    26(a7),a0
[0001404c] 2068 0014                 movea.l    20(a0),a0
[00014050] 4eb9 0005 0fd8            jsr        Aob_puttext
[00014056] 206f 001a                 movea.l    26(a7),a0
[0001405a] 4eb9 0005 9df4            jsr        Awi_dialog
[00014060] 206f 001a                 movea.l    26(a7),a0
[00014064] 4eb9 0005 85f2            jsr        Awi_delete
[0001406a] 4fef 0032                 lea.l      50(a7),a7
[0001406e] 4e75                      rts
ge_loadews:
[00014070] 2f0a                      move.l     a2,-(a7)
[00014072] 4fef ff78                 lea.l      -136(a7),a7
[00014076] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001407c] 2068 0258                 movea.l    600(a0),a0
[00014080] 2f50 0084                 move.l     (a0),132(a7)
[00014084] 6714                      beq.s      $0001409A
[00014086] 206f 0084                 movea.l    132(a7),a0
[0001408a] 0c90 2e41 4353            cmpi.l     #$2E414353,(a0)
[00014090] 6608                      bne.s      $0001409A
[00014092] 2039 000e 6e86            move.l     cews,d0
[00014098] 6602                      bne.s      $0001409C
[0001409a] 6072                      bra.s      $0001410E
[0001409c] 206f 0084                 movea.l    132(a7),a0
[000140a0] 2268 0008                 movea.l    8(a0),a1
[000140a4] 41ef 0004                 lea.l      4(a7),a0
[000140a8] 4eb9 0008 2f0c            jsr        strcpy
[000140ae] 705c                      moveq.l    #92,d0
[000140b0] 41ef 0004                 lea.l      4(a7),a0
[000140b4] 4eb9 0008 2e9e            jsr        strrchr
[000140ba] 2e88                      move.l     a0,(a7)
[000140bc] 6606                      bne.s      $000140C4
[000140be] 41ef 0004                 lea.l      4(a7),a0
[000140c2] 2e88                      move.l     a0,(a7)
[000140c4] 702e                      moveq.l    #46,d0
[000140c6] 2057                      movea.l    (a7),a0
[000140c8] 4eb9 0008 2e9e            jsr        strrchr
[000140ce] 2e88                      move.l     a0,(a7)
[000140d0] 6712                      beq.s      $000140E4
[000140d2] 43f9 0009 acda            lea.l      $0009ACDA,a1
[000140d8] 2057                      movea.l    (a7),a0
[000140da] 5248                      addq.w     #1,a0
[000140dc] 4eb9 0008 2f0c            jsr        strcpy
[000140e2] 6010                      bra.s      $000140F4
[000140e4] 43f9 0009 acde            lea.l      $0009ACDE,a1
[000140ea] 41ef 0004                 lea.l      4(a7),a0
[000140ee] 4eb9 0008 2e42            jsr        strcat
[000140f4] 43ef 0004                 lea.l      4(a7),a1
[000140f8] 303c 03eb                 move.w     #$03EB,d0
[000140fc] 2079 000e 6e86            movea.l    cews,a0
[00014102] 2479 000e 6e86            movea.l    cews,a2
[00014108] 246a 0004                 movea.l    4(a2),a2
[0001410c] 4e92                      jsr        (a2)
[0001410e] 4fef 0088                 lea.l      136(a7),a7
[00014112] 245f                      movea.l    (a7)+,a2
[00014114] 4e75                      rts
ge_save:
[00014116] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001411c] 2068 0258                 movea.l    600(a0),a0
[00014120] 4eb9 0001 4128            jsr        save
[00014126] 4e75                      rts
save:
[00014128] 4fef ff70                 lea.l      -144(a7),a7
[0001412c] 2f48 008c                 move.l     a0,140(a7)
[00014130] 206f 008c                 movea.l    140(a7),a0
[00014134] 2f50 0088                 move.l     (a0),136(a7)
[00014138] 670c                      beq.s      $00014146
[0001413a] 206f 0088                 movea.l    136(a7),a0
[0001413e] 0c90 2e41 4353            cmpi.l     #$2E414353,(a0)
[00014144] 6704                      beq.s      $0001414A
[00014146] 6000 0232                 bra        $0001437A
[0001414a] 206f 008c                 movea.l    140(a7),a0
[0001414e] 3028 0056                 move.w     86(a0),d0
[00014152] c07c 0800                 and.w      #$0800,d0
[00014156] 671a                      beq.s      $00014172
[00014158] 7008                      moveq.l    #8,d0
[0001415a] 226f 008c                 movea.l    140(a7),a1
[0001415e] 43e9 002c                 lea.l      44(a1),a1
[00014162] 206f 0088                 movea.l    136(a7),a0
[00014166] 41e8 014c                 lea.l      332(a0),a0
[0001416a] 4eb9 0008 3500            jsr        memcpy
[00014170] 6018                      bra.s      $0001418A
[00014172] 7008                      moveq.l    #8,d0
[00014174] 226f 008c                 movea.l    140(a7),a1
[00014178] 43e9 0024                 lea.l      36(a1),a1
[0001417c] 206f 0088                 movea.l    136(a7),a0
[00014180] 41e8 014c                 lea.l      332(a0),a0
[00014184] 4eb9 0008 3500            jsr        memcpy
[0001418a] 7001                      moveq.l    #1,d0
[0001418c] 206f 0088                 movea.l    136(a7),a0
[00014190] c068 0006                 and.w      6(a0),d0
[00014194] 3e80                      move.w     d0,(a7)
[00014196] 3039 0008 4804            move.w     dirtysave,d0
[0001419c] 660c                      bne.s      $000141AA
[0001419e] 7001                      moveq.l    #1,d0
[000141a0] 206f 0088                 movea.l    136(a7),a0
[000141a4] 4eb9 0001 8230            jsr        acs_closewi
[000141aa] 206f 0088                 movea.l    136(a7),a0
[000141ae] 2268 0008                 movea.l    8(a0),a1
[000141b2] 41ef 0008                 lea.l      8(a7),a0
[000141b6] 4eb9 0008 2f0c            jsr        strcpy
[000141bc] 705c                      moveq.l    #92,d0
[000141be] 41ef 0008                 lea.l      8(a7),a0
[000141c2] 4eb9 0008 2e9e            jsr        strrchr
[000141c8] 2f48 0004                 move.l     a0,4(a7)
[000141cc] 6608                      bne.s      $000141D6
[000141ce] 41ef 0008                 lea.l      8(a7),a0
[000141d2] 2f48 0004                 move.l     a0,4(a7)
[000141d6] 702e                      moveq.l    #46,d0
[000141d8] 206f 0004                 movea.l    4(a7),a0
[000141dc] 4eb9 0008 2e9e            jsr        strrchr
[000141e2] 2f48 0004                 move.l     a0,4(a7)
[000141e6] 6612                      bne.s      $000141FA
[000141e8] 43f9 0009 ace3            lea.l      $0009ACE3,a1
[000141ee] 41ef 0008                 lea.l      8(a7),a0
[000141f2] 4eb9 0008 2e42            jsr        strcat
[000141f8] 6010                      bra.s      $0001420A
[000141fa] 43f9 0009 ace8            lea.l      $0009ACE8,a1
[00014200] 206f 0004                 movea.l    4(a7),a0
[00014204] 4eb9 0008 2f0c            jsr        strcpy
[0001420a] 705c                      moveq.l    #92,d0
[0001420c] 206f 0088                 movea.l    136(a7),a0
[00014210] 2068 0008                 movea.l    8(a0),a0
[00014214] 4eb9 0008 2e9e            jsr        strrchr
[0001421a] 2f48 0004                 move.l     a0,4(a7)
[0001421e] 660c                      bne.s      $0001422C
[00014220] 206f 0088                 movea.l    136(a7),a0
[00014224] 2f68 0008 0004            move.l     8(a0),4(a7)
[0001422a] 6004                      bra.s      $00014230
[0001422c] 52af 0004                 addq.l     #1,4(a7)
[00014230] 43ef 0008                 lea.l      8(a7),a1
[00014234] 206f 0088                 movea.l    136(a7),a0
[00014238] 2068 0008                 movea.l    8(a0),a0
[0001423c] 4240                      clr.w      d0
[0001423e] 4eb9 0008 0ce8            jsr        Frename
[00014244] 72dc                      moveq.l    #-36,d1
[00014246] b280                      cmp.l      d0,d1
[00014248] 6634                      bne.s      $0001427E
[0001424a] 41ef 0008                 lea.l      8(a7),a0
[0001424e] 4eb9 0008 0ca0            jsr        Fdelete
[00014254] 43ef 0008                 lea.l      8(a7),a1
[00014258] 206f 0088                 movea.l    136(a7),a0
[0001425c] 2068 0008                 movea.l    8(a0),a0
[00014260] 4240                      clr.w      d0
[00014262] 4eb9 0008 0ce8            jsr        Frename
[00014268] 72dc                      moveq.l    #-36,d1
[0001426a] b280                      cmp.l      d0,d1
[0001426c] 6610                      bne.s      $0001427E
[0001426e] 226f 0004                 movea.l    4(a7),a1
[00014272] 41f9 0008 b05a            lea.l      ERR_RENAME,a0
[00014278] 4eb9 0006 b80c            jsr        alert_str
[0001427e] 4240                      clr.w      d0
[00014280] 206f 0088                 movea.l    136(a7),a0
[00014284] 2068 0008                 movea.l    8(a0),a0
[00014288] 4eb9 0008 0c8e            jsr        Fcreate
[0001428e] 3f40 0002                 move.w     d0,2(a7)
[00014292] 302f 0002                 move.w     2(a7),d0
[00014296] 6a2a                      bpl.s      $000142C2
[00014298] 206f 0004                 movea.l    4(a7),a0
[0001429c] 7009                      moveq.l    #9,d0
[0001429e] 2279 0010 ee4e            movea.l    ACSblk,a1
[000142a4] 2269 03d6                 movea.l    982(a1),a1
[000142a8] 4e91                      jsr        (a1)
[000142aa] 206f 0088                 movea.l    136(a7),a0
[000142ae] 2268 0008                 movea.l    8(a0),a1
[000142b2] 41ef 0008                 lea.l      8(a7),a0
[000142b6] 4240                      clr.w      d0
[000142b8] 4eb9 0008 0ce8            jsr        Frename
[000142be] 6000 0088                 bra        $00014348
[000142c2] 206f 0088                 movea.l    136(a7),a0
[000142c6] 302f 0002                 move.w     2(a7),d0
[000142ca] 4eb9 0001 8496            jsr        save_acs
[000142d0] 4a40                      tst.w      d0
[000142d2] 673e                      beq.s      $00014312
[000142d4] 206f 0004                 movea.l    4(a7),a0
[000142d8] 700a                      moveq.l    #10,d0
[000142da] 2279 0010 ee4e            movea.l    ACSblk,a1
[000142e0] 2269 03d6                 movea.l    982(a1),a1
[000142e4] 4e91                      jsr        (a1)
[000142e6] 206f 0088                 movea.l    136(a7),a0
[000142ea] 2068 0008                 movea.l    8(a0),a0
[000142ee] 4eb9 0008 0ca0            jsr        Fdelete
[000142f4] 206f 0088                 movea.l    136(a7),a0
[000142f8] 2268 0008                 movea.l    8(a0),a1
[000142fc] 41ef 0008                 lea.l      8(a7),a0
[00014300] 4240                      clr.w      d0
[00014302] 4eb9 0008 0ce8            jsr        Frename
[00014308] 33fc 0001 000e 7724       move.w     #$0001,save_aborted
[00014310] 6036                      bra.s      $00014348
[00014312] 41ef 0008                 lea.l      8(a7),a0
[00014316] 4eb9 0008 0ca0            jsr        Fdelete
[0001431c] 7001                      moveq.l    #1,d0
[0001431e] 206f 0088                 movea.l    136(a7),a0
[00014322] c0a8 0170                 and.l      368(a0),d0
[00014326] 670a                      beq.s      $00014332
[00014328] 206f 0088                 movea.l    136(a7),a0
[0001432c] 4eb9 0001 6c88            jsr        protocol
[00014332] 7002                      moveq.l    #2,d0
[00014334] 206f 0088                 movea.l    136(a7),a0
[00014338] c0a8 0170                 and.l      368(a0),d0
[0001433c] 670a                      beq.s      $00014348
[0001433e] 206f 0088                 movea.l    136(a7),a0
[00014342] 4eb9 0001 4568            jsr        backup
[00014348] 206f 0088                 movea.l    136(a7),a0
[0001434c] 3028 0006                 move.w     6(a0),d0
[00014350] c07c 0800                 and.w      #$0800,d0
[00014354] 6724                      beq.s      $0001437A
[00014356] 3017                      move.w     (a7),d0
[00014358] 6720                      beq.s      $0001437A
[0001435a] 3039 0008 4804            move.w     dirtysave,d0
[00014360] 670e                      beq.s      $00014370
[00014362] 206f 008c                 movea.l    140(a7),a0
[00014366] 3028 0056                 move.w     86(a0),d0
[0001436a] c07c 0200                 and.w      #$0200,d0
[0001436e] 670a                      beq.s      $0001437A
[00014370] 206f 008c                 movea.l    140(a7),a0
[00014374] 4eb9 0001 44d8            jsr        compiler
[0001437a] 4fef 0090                 lea.l      144(a7),a7
[0001437e] 4e75                      rts
ge_saveas:
[00014380] 2f0a                      move.l     a2,-(a7)
[00014382] 4fef ff6a                 lea.l      -150(a7),a7
[00014386] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001438c] 2f68 0258 0008            move.l     600(a0),8(a7)
[00014392] 206f 0008                 movea.l    8(a7),a0
[00014396] 2f50 0092                 move.l     (a0),146(a7)
[0001439a] 206f 0092                 movea.l    146(a7),a0
[0001439e] 2268 0008                 movea.l    8(a0),a1
[000143a2] 2079 0008 47fa            movea.l    last_path,a0
[000143a8] 4eb9 0008 2f0c            jsr        strcpy
[000143ae] 42a7                      clr.l      -(a7)
[000143b0] 4879 0009 aced            pea.l      $0009ACED
[000143b6] 4241                      clr.w      d1
[000143b8] 4240                      clr.w      d0
[000143ba] 2279 0008 47fa            movea.l    last_path,a1
[000143c0] 41f9 0008 b1c3            lea.l      ttl_save,a0
[000143c6] 4eb9 0006 dc24            jsr        Af_fileselect
[000143cc] 504f                      addq.w     #8,a7
[000143ce] 2e88                      move.l     a0,(a7)
[000143d0] 2017                      move.l     (a7),d0
[000143d2] 6718                      beq.s      $000143EC
[000143d4] 2057                      movea.l    (a7),a0
[000143d6] 2257                      movea.l    (a7),a1
[000143d8] 2269 0024                 movea.l    36(a1),a1
[000143dc] 4e91                      jsr        (a1)
[000143de] 2f48 008e                 move.l     a0,142(a7)
[000143e2] 2057                      movea.l    (a7),a0
[000143e4] 4eb9 0007 0c5e            jsr        Alu_delete
[000143ea] 6004                      bra.s      $000143F0
[000143ec] 42af 008e                 clr.l      142(a7)
[000143f0] 202f 008e                 move.l     142(a7),d0
[000143f4] 6604                      bne.s      $000143FA
[000143f6] 6000 00d8                 bra        $000144D0
[000143fa] 1f7c 0020 000e            move.b     #$20,14(a7)
[00014400] 226f 008e                 movea.l    142(a7),a1
[00014404] 41ef 000f                 lea.l      15(a7),a0
[00014408] 4eb9 0008 2f0c            jsr        strcpy
[0001440e] 206f 0008                 movea.l    8(a7),a0
[00014412] 2068 005a                 movea.l    90(a0),a0
[00014416] 2068 0008                 movea.l    8(a0),a0
[0001441a] 4eb9 0004 649c            jsr        Ast_delete
[00014420] 206f 0008                 movea.l    8(a7),a0
[00014424] 2068 004e                 movea.l    78(a0),a0
[00014428] 4eb9 0004 649c            jsr        Ast_delete
[0001442e] 41ef 000e                 lea.l      14(a7),a0
[00014432] 4eb9 0004 643c            jsr        Ast_create
[00014438] 226f 0008                 movea.l    8(a7),a1
[0001443c] 2348 004e                 move.l     a0,78(a1)
[00014440] 705c                      moveq.l    #92,d0
[00014442] 206f 008e                 movea.l    142(a7),a0
[00014446] 4eb9 0008 2e9e            jsr        strrchr
[0001444c] 5248                      addq.w     #1,a0
[0001444e] 4eb9 0004 643c            jsr        Ast_create
[00014454] 226f 0008                 movea.l    8(a7),a1
[00014458] 2269 005a                 movea.l    90(a1),a1
[0001445c] 2348 0008                 move.l     a0,8(a1)
[00014460] 206f 0008                 movea.l    8(a7),a0
[00014464] 3f68 0020 000c            move.w     32(a0),12(a7)
[0001446a] 302f 000c                 move.w     12(a7),d0
[0001446e] 6b1a                      bmi.s      $0001448A
[00014470] 4267                      clr.w      -(a7)
[00014472] 4267                      clr.w      -(a7)
[00014474] 206f 000c                 movea.l    12(a7),a0
[00014478] 2f28 004e                 move.l     78(a0),-(a7)
[0001447c] 7203                      moveq.l    #3,d1
[0001447e] 302f 0014                 move.w     20(a7),d0
[00014482] 4eb9 0007 f926            jsr        wind_set
[00014488] 504f                      addq.w     #8,a7
[0001448a] 206f 0008                 movea.l    8(a7),a0
[0001448e] 3028 0058                 move.w     88(a0),d0
[00014492] 6b22                      bmi.s      $000144B6
[00014494] 4eb9 0005 5e8c            jsr        Awi_root
[0001449a] 2f48 0004                 move.l     a0,4(a7)
[0001449e] 226f 0008                 movea.l    8(a7),a1
[000144a2] 43e9 0058                 lea.l      88(a1),a1
[000144a6] 706d                      moveq.l    #109,d0
[000144a8] 206f 0004                 movea.l    4(a7),a0
[000144ac] 246f 0004                 movea.l    4(a7),a2
[000144b0] 246a 0004                 movea.l    4(a2),a2
[000144b4] 4e92                      jsr        (a2)
[000144b6] 206f 0008                 movea.l    8(a7),a0
[000144ba] 2068 004e                 movea.l    78(a0),a0
[000144be] 5248                      addq.w     #1,a0
[000144c0] 226f 0092                 movea.l    146(a7),a1
[000144c4] 2348 0008                 move.l     a0,8(a1)
[000144c8] 206f 0008                 movea.l    8(a7),a0
[000144cc] 6100 fc5a                 bsr        save
[000144d0] 4fef 0096                 lea.l      150(a7),a7
[000144d4] 245f                      movea.l    (a7)+,a2
[000144d6] 4e75                      rts
compiler:
[000144d8] 514f                      subq.w     #8,a7
[000144da] 2f48 0004                 move.l     a0,4(a7)
[000144de] 206f 0004                 movea.l    4(a7),a0
[000144e2] 2e90                      move.l     (a0),(a7)
[000144e4] 670a                      beq.s      $000144F0
[000144e6] 2057                      movea.l    (a7),a0
[000144e8] 0c90 2e41 4353            cmpi.l     #$2E414353,(a0)
[000144ee] 6702                      beq.s      $000144F2
[000144f0] 603e                      bra.s      $00014530
[000144f2] 7001                      moveq.l    #1,d0
[000144f4] 2057                      movea.l    (a7),a0
[000144f6] 4eb9 0001 8230            jsr        acs_closewi
[000144fc] 2057                      movea.l    (a7),a0
[000144fe] 3028 020e                 move.w     526(a0),d0
[00014502] 4a40                      tst.w      d0
[00014504] 6706                      beq.s      $0001450C
[00014506] 5340                      subq.w     #1,d0
[00014508] 6714                      beq.s      $0001451E
[0001450a] 601c                      bra.s      $00014528
[0001450c] 2057                      movea.l    (a7),a0
[0001450e] 4eb9 0001 9a7c            jsr        pc_header
[00014514] 2057                      movea.l    (a7),a0
[00014516] 4eb9 0001 b6ac            jsr        pc_output
[0001451c] 600a                      bra.s      $00014528
[0001451e] 2057                      movea.l    (a7),a0
[00014520] 4eb9 0001 cf52            jsr        pp_output
[00014526] 4e71                      nop
[00014528] 2057                      movea.l    (a7),a0
[0001452a] 4eb9 0001 d1b8            jsr        str_output
[00014530] 504f                      addq.w     #8,a7
[00014532] 4e75                      rts
ge_compiler:
[00014534] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001453a] 2068 0258                 movea.l    600(a0),a0
[0001453e] 6100 ff98                 bsr.w      compiler
[00014542] 4e75                      rts
ge_protocol:
[00014544] 594f                      subq.w     #4,a7
[00014546] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001454c] 2068 0258                 movea.l    600(a0),a0
[00014550] 2e90                      move.l     (a0),(a7)
[00014552] 7001                      moveq.l    #1,d0
[00014554] 2057                      movea.l    (a7),a0
[00014556] 4eb9 0001 8230            jsr        acs_closewi
[0001455c] 2057                      movea.l    (a7),a0
[0001455e] 4eb9 0001 6c88            jsr        protocol
[00014564] 584f                      addq.w     #4,a7
[00014566] 4e75                      rts
backup:
[00014568] 4fef ffec                 lea.l      -20(a7),a7
[0001456c] 2f48 0010                 move.l     a0,16(a7)
[00014570] 42af 0008                 clr.l      8(a7)
[00014574] 206f 0010                 movea.l    16(a7),a0
[00014578] 1028 0174                 move.b     372(a0),d0
[0001457c] 6720                      beq.s      $0001459E
[0001457e] 206f 0010                 movea.l    16(a7),a0
[00014582] 41e8 0174                 lea.l      372(a0),a0
[00014586] 4eb9 0008 2f6c            jsr        strlen
[0001458c] d0bc 0000 001c            add.l      #$0000001C,d0
[00014592] 4eb9 0004 c608            jsr        Ax_malloc
[00014598] 2f48 0008                 move.l     a0,8(a7)
[0001459c] 6604                      bne.s      $000145A2
[0001459e] 6000 01e2                 bra        $00014782
[000145a2] 226f 0010                 movea.l    16(a7),a1
[000145a6] 43e9 0174                 lea.l      372(a1),a1
[000145aa] 206f 0008                 movea.l    8(a7),a0
[000145ae] 4eb9 0008 2f0c            jsr        strcpy
[000145b4] 705c                      moveq.l    #92,d0
[000145b6] 206f 0008                 movea.l    8(a7),a0
[000145ba] 4eb9 0008 2e9e            jsr        strrchr
[000145c0] 2f48 000c                 move.l     a0,12(a7)
[000145c4] 6706                      beq.s      $000145CC
[000145c6] 206f 000c                 movea.l    12(a7),a0
[000145ca] 4210                      clr.b      (a0)
[000145cc] 43f9 0009 acf7            lea.l      $0009ACF7,a1
[000145d2] 206f 0008                 movea.l    8(a7),a0
[000145d6] 4eb9 0008 2e42            jsr        strcat
[000145dc] 705c                      moveq.l    #92,d0
[000145de] 206f 0010                 movea.l    16(a7),a0
[000145e2] 2068 0008                 movea.l    8(a0),a0
[000145e6] 4eb9 0008 2e9e            jsr        strrchr
[000145ec] 2f48 000c                 move.l     a0,12(a7)
[000145f0] 660e                      bne.s      $00014600
[000145f2] 206f 0008                 movea.l    8(a7),a0
[000145f6] 4eb9 0004 c7c8            jsr        Ax_free
[000145fc] 6000 0184                 bra        $00014782
[00014600] 226f 000c                 movea.l    12(a7),a1
[00014604] 5249                      addq.w     #1,a1
[00014606] 206f 0008                 movea.l    8(a7),a0
[0001460a] 4eb9 0008 2e42            jsr        strcat
[00014610] 4eb9 0008 0e48            jsr        Tgetdate
[00014616] 7209                      moveq.l    #9,d1
[00014618] e268                      lsr.w      d1,d0
[0001461a] c07c 007f                 and.w      #$007F,d0
[0001461e] d07c 0050                 add.w      #$0050,d0
[00014622] 3f40 0006                 move.w     d0,6(a7)
[00014626] 0c6f 0064 0006            cmpi.w     #$0064,6(a7)
[0001462c] 6d06                      blt.s      $00014634
[0001462e] 046f 0064 0006            subi.w     #$0064,6(a7)
[00014634] 3f2f 0006                 move.w     6(a7),-(a7)
[00014638] 43f9 0009 acf9            lea.l      $0009ACF9,a1
[0001463e] 2f09                      move.l     a1,-(a7)
[00014640] 702e                      moveq.l    #46,d0
[00014642] 206f 000e                 movea.l    14(a7),a0
[00014646] 4eb9 0008 2e9e            jsr        strrchr
[0001464c] 225f                      movea.l    (a7)+,a1
[0001464e] 4eb9 0008 15ac            jsr        sprintf
[00014654] 544f                      addq.w     #2,a7
[00014656] 4eb9 0008 0e48            jsr        Tgetdate
[0001465c] 3f40 0006                 move.w     d0,6(a7)
[00014660] 4eb9 0008 0e56            jsr        Tgettime
[00014666] 3f40 0004                 move.w     d0,4(a7)
[0001466a] 302f 0004                 move.w     4(a7),d0
[0001466e] ea40                      asr.w      #5,d0
[00014670] c07c 003f                 and.w      #$003F,d0
[00014674] 3f00                      move.w     d0,-(a7)
[00014676] 302f 0006                 move.w     6(a7),d0
[0001467a] 720b                      moveq.l    #11,d1
[0001467c] e260                      asr.w      d1,d0
[0001467e] c07c 001f                 and.w      #$001F,d0
[00014682] 3f00                      move.w     d0,-(a7)
[00014684] 701f                      moveq.l    #31,d0
[00014686] c06f 000a                 and.w      10(a7),d0
[0001468a] 3f00                      move.w     d0,-(a7)
[0001468c] 302f 000c                 move.w     12(a7),d0
[00014690] ea40                      asr.w      #5,d0
[00014692] c07c 000f                 and.w      #$000F,d0
[00014696] 3f00                      move.w     d0,-(a7)
[00014698] 43f9 0009 ad00            lea.l      $0009AD00,a1
[0001469e] 2f09                      move.l     a1,-(a7)
[000146a0] 705c                      moveq.l    #92,d0
[000146a2] 206f 0014                 movea.l    20(a7),a0
[000146a6] 4eb9 0008 2e9e            jsr        strrchr
[000146ac] 225f                      movea.l    (a7)+,a1
[000146ae] 4eb9 0008 15ac            jsr        sprintf
[000146b4] 504f                      addq.w     #8,a7
[000146b6] 4eb9 0008 0bd2            jsr        Dgetdrv
[000146bc] 3f40 0004                 move.w     d0,4(a7)
[000146c0] 206f 0008                 movea.l    8(a7),a0
[000146c4] 1010                      move.b     (a0),d0
[000146c6] 4880                      ext.w      d0
[000146c8] d07c ffbf                 add.w      #$FFBF,d0
[000146cc] 4eb9 0008 0c48            jsr        Dsetdrv
[000146d2] 705c                      moveq.l    #92,d0
[000146d4] 206f 0008                 movea.l    8(a7),a0
[000146d8] 4eb9 0008 2e8a            jsr        strchr
[000146de] 2f48 000c                 move.l     a0,12(a7)
[000146e2] 705c                      moveq.l    #92,d0
[000146e4] 206f 000c                 movea.l    12(a7),a0
[000146e8] 5248                      addq.w     #1,a0
[000146ea] 4eb9 0008 2e8a            jsr        strchr
[000146f0] 2f48 000c                 move.l     a0,12(a7)
[000146f4] 603e                      bra.s      $00014734
[000146f6] 206f 000c                 movea.l    12(a7),a0
[000146fa] 4210                      clr.b      (a0)
[000146fc] 206f 0008                 movea.l    8(a7),a0
[00014700] 4eb9 0008 0bc2            jsr        Dcreate
[00014706] 3f40 0006                 move.w     d0,6(a7)
[0001470a] 302f 0006                 move.w     6(a7),d0
[0001470e] 6a0a                      bpl.s      $0001471A
[00014710] 0c6f ffdc 0006            cmpi.w     #$FFDC,6(a7)
[00014716] 6702                      beq.s      $0001471A
[00014718] 6020                      bra.s      $0001473A
[0001471a] 206f 000c                 movea.l    12(a7),a0
[0001471e] 10bc 005c                 move.b     #$5C,(a0)
[00014722] 705c                      moveq.l    #92,d0
[00014724] 206f 000c                 movea.l    12(a7),a0
[00014728] 5248                      addq.w     #1,a0
[0001472a] 4eb9 0008 2e8a            jsr        strchr
[00014730] 2f48 000c                 move.l     a0,12(a7)
[00014734] 202f 000c                 move.l     12(a7),d0
[00014738] 66bc                      bne.s      $000146F6
[0001473a] 302f 0004                 move.w     4(a7),d0
[0001473e] 4eb9 0008 0c48            jsr        Dsetdrv
[00014744] 202f 000c                 move.l     12(a7),d0
[00014748] 662e                      bne.s      $00014778
[0001474a] 206f 0008                 movea.l    8(a7),a0
[0001474e] 4eb9 0004 b8fa            jsr        Af_length
[00014754] 72ff                      moveq.l    #-1,d1
[00014756] b280                      cmp.l      d0,d1
[00014758] 6f1e                      ble.s      $00014778
[0001475a] 4240                      clr.w      d0
[0001475c] 206f 0008                 movea.l    8(a7),a0
[00014760] 4eb9 0008 0c8e            jsr        Fcreate
[00014766] 2e80                      move.l     d0,(a7)
[00014768] 6f0e                      ble.s      $00014778
[0001476a] 206f 0010                 movea.l    16(a7),a0
[0001476e] 302f 0002                 move.w     2(a7),d0
[00014772] 4eb9 0001 8496            jsr        save_acs
[00014778] 206f 0008                 movea.l    8(a7),a0
[0001477c] 4eb9 0004 c7c8            jsr        Ax_free
[00014782] 4fef 0014                 lea.l      20(a7),a7
[00014786] 4e75                      rts
ge_backup:
[00014788] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001478e] 2068 0258                 movea.l    600(a0),a0
[00014792] 2050                      movea.l    (a0),a0
[00014794] 6100 fdd2                 bsr        backup
[00014798] 4e75                      rts
ge_behave:
[0001479a] 594f                      subq.w     #4,a7
[0001479c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000147a2] 2ea8 0258                 move.l     600(a0),(a7)
[000147a6] 2057                      movea.l    (a7),a0
[000147a8] 0068 0004 0054            ori.w      #$0004,84(a0)
[000147ae] 2057                      movea.l    (a7),a0
[000147b0] 2050                      movea.l    (a0),a0
[000147b2] 2279 0008 adc6            movea.l    $0008ADC6,a1
[000147b8] 4e91                      jsr        (a1)
[000147ba] 2057                      movea.l    (a7),a0
[000147bc] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[000147c2] 584f                      addq.w     #4,a7
[000147c4] 4e75                      rts
ge_mainmod:
[000147c6] 594f                      subq.w     #4,a7
[000147c8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000147ce] 2ea8 0258                 move.l     600(a0),(a7)
[000147d2] 2057                      movea.l    (a7),a0
[000147d4] 0068 0004 0054            ori.w      #$0004,84(a0)
[000147da] 2057                      movea.l    (a7),a0
[000147dc] 2050                      movea.l    (a0),a0
[000147de] 2279 0008 ae68            movea.l    $0008AE68,a1
[000147e4] 4e91                      jsr        (a1)
[000147e6] 2057                      movea.l    (a7),a0
[000147e8] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[000147ee] 584f                      addq.w     #4,a7
[000147f0] 4e75                      rts
ge_palette:
[000147f2] 594f                      subq.w     #4,a7
[000147f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000147fa] 2ea8 0258                 move.l     600(a0),(a7)
[000147fe] 2057                      movea.l    (a7),a0
[00014800] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014806] 2057                      movea.l    (a7),a0
[00014808] 2050                      movea.l    (a0),a0
[0001480a] 2279 0008 7504            movea.l    $00087504,a1
[00014810] 4e91                      jsr        (a1)
[00014812] 2057                      movea.l    (a7),a0
[00014814] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[0001481a] 584f                      addq.w     #4,a7
[0001481c] 4e75                      rts
ge_init:
[0001481e] 4fef fff0                 lea.l      -16(a7),a7
[00014822] 2f48 000c                 move.l     a0,12(a7)
[00014826] 206f 000c                 movea.l    12(a7),a0
[0001482a] 2e90                      move.l     (a0),(a7)
[0001482c] 203c 0000 0262            move.l     #$00000262,d0
[00014832] 4eb9 0004 c608            jsr        Ax_malloc
[00014838] 2f48 0004                 move.l     a0,4(a7)
[0001483c] 202f 0004                 move.l     4(a7),d0
[00014840] 6616                      bne.s      $00014858
[00014842] 91c8                      suba.l     a0,a0
[00014844] 7003                      moveq.l    #3,d0
[00014846] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001484c] 2269 03d6                 movea.l    982(a1),a1
[00014850] 4e91                      jsr        (a1)
[00014852] 70ff                      moveq.l    #-1,d0
[00014854] 6000 008a                 bra        $000148E0
[00014858] 7204                      moveq.l    #4,d1
[0001485a] 4240                      clr.w      d0
[0001485c] 206f 0004                 movea.l    4(a7),a0
[00014860] 4eb9 0008 36ea            jsr        memset
[00014866] 206f 000c                 movea.l    12(a7),a0
[0001486a] 20af 0004                 move.l     4(a7),(a0)
[0001486e] 4240                      clr.w      d0
[00014870] 2057                      movea.l    (a7),a0
[00014872] 4eb9 0008 0cc0            jsr        Fopen
[00014878] 2f40 0008                 move.l     d0,8(a7)
[0001487c] 206f 0004                 movea.l    4(a7),a0
[00014880] 2157 0008                 move.l     (a7),8(a0)
[00014884] 206f 0004                 movea.l    4(a7),a0
[00014888] 202f 0008                 move.l     8(a7),d0
[0001488c] 4eb9 0001 8b6c            jsr        read_acs
[00014892] 4a40                      tst.w      d0
[00014894] 671a                      beq.s      $000148B0
[00014896] 203c 0000 0262            move.l     #$00000262,d0
[0001489c] 206f 0004                 movea.l    4(a7),a0
[000148a0] 4eb9 0004 cc28            jsr        Ax_recycle
[000148a6] 206f 000c                 movea.l    12(a7),a0
[000148aa] 4290                      clr.l      (a0)
[000148ac] 70ff                      moveq.l    #-1,d0
[000148ae] 6030                      bra.s      $000148E0
[000148b0] 206f 0004                 movea.l    4(a7),a0
[000148b4] 2157 0008                 move.l     (a7),8(a0)
[000148b8] 206f 0004                 movea.l    4(a7),a0
[000148bc] 216f 000c 000c            move.l     12(a7),12(a0)
[000148c2] 206f 0004                 movea.l    4(a7),a0
[000148c6] 4868 0168                 pea.l      360(a0)
[000148ca] 226f 0008                 movea.l    8(a7),a1
[000148ce] 43e9 014c                 lea.l      332(a1),a1
[000148d2] 206f 0010                 movea.l    16(a7),a0
[000148d6] 4eb9 0001 6372            jsr        wi_pos
[000148dc] 584f                      addq.w     #4,a7
[000148de] 4240                      clr.w      d0
[000148e0] 4fef 0010                 lea.l      16(a7),a7
[000148e4] 4e75                      rts
ge_alert:
[000148e6] 514f                      subq.w     #8,a7
[000148e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000148ee] 2ea8 0258                 move.l     600(a0),(a7)
[000148f2] 2057                      movea.l    (a7),a0
[000148f4] 2f50 0004                 move.l     (a0),4(a7)
[000148f8] 2057                      movea.l    (a7),a0
[000148fa] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014900] 23ef 0004 000c de02       move.l     4(a7),list_alert
[00014908] 206f 0004                 movea.l    4(a7),a0
[0001490c] 23e8 0024 000c de06       move.l     36(a0),$000CDE06
[00014914] 41f9 000c de02            lea.l      list_alert,a0
[0001491a] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014920] 4e91                      jsr        (a1)
[00014922] 2057                      movea.l    (a7),a0
[00014924] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[0001492a] 504f                      addq.w     #8,a7
[0001492c] 4e75                      rts
ge_icon:
[0001492e] 514f                      subq.w     #8,a7
[00014930] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014936] 2ea8 0258                 move.l     600(a0),(a7)
[0001493a] 2057                      movea.l    (a7),a0
[0001493c] 2f50 0004                 move.l     (a0),4(a7)
[00014940] 2057                      movea.l    (a7),a0
[00014942] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014948] 23ef 0004 000c e332       move.l     4(a7),list_icon
[00014950] 206f 0004                 movea.l    4(a7),a0
[00014954] 23e8 002c 000c e336       move.l     44(a0),$000CE336
[0001495c] 41f9 000c e332            lea.l      list_icon,a0
[00014962] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014968] 4e91                      jsr        (a1)
[0001496a] 2057                      movea.l    (a7),a0
[0001496c] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014972] 504f                      addq.w     #8,a7
[00014974] 4e75                      rts
ge_mouse:
[00014976] 514f                      subq.w     #8,a7
[00014978] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001497e] 2ea8 0258                 move.l     600(a0),(a7)
[00014982] 2057                      movea.l    (a7),a0
[00014984] 2f50 0004                 move.l     (a0),4(a7)
[00014988] 2057                      movea.l    (a7),a0
[0001498a] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014990] 23ef 0004 000c ece8       move.l     4(a7),list_mouse
[00014998] 206f 0004                 movea.l    4(a7),a0
[0001499c] 23e8 0040 000c ecec       move.l     64(a0),$000CECEC
[000149a4] 41f9 000c ece8            lea.l      list_mouse,a0
[000149aa] 2279 000c dc9e            movea.l    $000CDC9E,a1
[000149b0] 4e91                      jsr        (a1)
[000149b2] 2057                      movea.l    (a7),a0
[000149b4] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[000149ba] 504f                      addq.w     #8,a7
[000149bc] 4e75                      rts
ge_image:
[000149be] 514f                      subq.w     #8,a7
[000149c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000149c6] 2ea8 0258                 move.l     600(a0),(a7)
[000149ca] 2057                      movea.l    (a7),a0
[000149cc] 2f50 0004                 move.l     (a0),4(a7)
[000149d0] 2057                      movea.l    (a7),a0
[000149d2] 0068 0004 0054            ori.w      #$0004,84(a0)
[000149d8] 23ef 0004 000c e4d6       move.l     4(a7),list_image
[000149e0] 206f 0004                 movea.l    4(a7),a0
[000149e4] 23e8 0030 000c e4da       move.l     48(a0),$000CE4DA
[000149ec] 41f9 000c e4d6            lea.l      list_image,a0
[000149f2] 2279 000c dc9e            movea.l    $000CDC9E,a1
[000149f8] 4e91                      jsr        (a1)
[000149fa] 2057                      movea.l    (a7),a0
[000149fc] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014a02] 504f                      addq.w     #8,a7
[00014a04] 4e75                      rts
ge_menu:
[00014a06] 514f                      subq.w     #8,a7
[00014a08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014a0e] 2ea8 0258                 move.l     600(a0),(a7)
[00014a12] 2057                      movea.l    (a7),a0
[00014a14] 2f50 0004                 move.l     (a0),4(a7)
[00014a18] 2057                      movea.l    (a7),a0
[00014a1a] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014a20] 23ef 0004 000c ec32       move.l     4(a7),list_menu
[00014a28] 206f 0004                 movea.l    4(a7),a0
[00014a2c] 23e8 001c 000c ec36       move.l     28(a0),$000CEC36
[00014a34] 41f9 000c ec32            lea.l      list_menu,a0
[00014a3a] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014a40] 4e91                      jsr        (a1)
[00014a42] 2057                      movea.l    (a7),a0
[00014a44] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014a4a] 504f                      addq.w     #8,a7
[00014a4c] 4e75                      rts
ge_data:
[00014a4e] 514f                      subq.w     #8,a7
[00014a50] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014a56] 2ea8 0258                 move.l     600(a0),(a7)
[00014a5a] 2057                      movea.l    (a7),a0
[00014a5c] 2f50 0004                 move.l     (a0),4(a7)
[00014a60] 2057                      movea.l    (a7),a0
[00014a62] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014a68] 23ef 0004 000c deba       move.l     4(a7),list_data
[00014a70] 206f 0004                 movea.l    4(a7),a0
[00014a74] 23e8 0044 000c debe       move.l     68(a0),$000CDEBE
[00014a7c] 41f9 000c deba            lea.l      list_data,a0
[00014a82] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014a88] 4e91                      jsr        (a1)
[00014a8a] 2057                      movea.l    (a7),a0
[00014a8c] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014a92] 504f                      addq.w     #8,a7
[00014a94] 4e75                      rts
ge_object:
[00014a96] 514f                      subq.w     #8,a7
[00014a98] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014a9e] 2ea8 0258                 move.l     600(a0),(a7)
[00014aa2] 2057                      movea.l    (a7),a0
[00014aa4] 2f50 0004                 move.l     (a0),4(a7)
[00014aa8] 2057                      movea.l    (a7),a0
[00014aaa] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014ab0] 23ef 0004 000c ed8c       move.l     4(a7),list_object
[00014ab8] 206f 0004                 movea.l    4(a7),a0
[00014abc] 23e8 0018 000c ed90       move.l     24(a0),$000CED90
[00014ac4] 41f9 000c ed8c            lea.l      list_object,a0
[00014aca] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014ad0] 4e91                      jsr        (a1)
[00014ad2] 2057                      movea.l    (a7),a0
[00014ad4] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014ada] 504f                      addq.w     #8,a7
[00014adc] 4e75                      rts
ge_popup:
[00014ade] 514f                      subq.w     #8,a7
[00014ae0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014ae6] 2ea8 0258                 move.l     600(a0),(a7)
[00014aea] 2057                      movea.l    (a7),a0
[00014aec] 2f50 0004                 move.l     (a0),4(a7)
[00014af0] 2057                      movea.l    (a7),a0
[00014af2] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014af8] 23ef 0004 000c ee30       move.l     4(a7),list_popup
[00014b00] 206f 0004                 movea.l    4(a7),a0
[00014b04] 23e8 0020 000c ee34       move.l     32(a0),$000CEE34
[00014b0c] 41f9 000c ee30            lea.l      list_popup,a0
[00014b12] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014b18] 4e91                      jsr        (a1)
[00014b1a] 2057                      movea.l    (a7),a0
[00014b1c] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014b22] 504f                      addq.w     #8,a7
[00014b24] 4e75                      rts
ge_reference:
[00014b26] 514f                      subq.w     #8,a7
[00014b28] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014b2e] 2ea8 0258                 move.l     600(a0),(a7)
[00014b32] 2057                      movea.l    (a7),a0
[00014b34] 2f50 0004                 move.l     (a0),4(a7)
[00014b38] 2057                      movea.l    (a7),a0
[00014b3a] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014b40] 23ef 0004 000c eefc       move.l     4(a7),list_reference
[00014b48] 206f 0004                 movea.l    4(a7),a0
[00014b4c] 23e8 003c 000c ef00       move.l     60(a0),$000CEF00
[00014b54] 41f9 000c eefc            lea.l      list_reference,a0
[00014b5a] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014b60] 4e91                      jsr        (a1)
[00014b62] 2057                      movea.l    (a7),a0
[00014b64] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014b6a] 504f                      addq.w     #8,a7
[00014b6c] 4e75                      rts
ge_text:
[00014b6e] 514f                      subq.w     #8,a7
[00014b70] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014b76] 2ea8 0258                 move.l     600(a0),(a7)
[00014b7a] 2057                      movea.l    (a7),a0
[00014b7c] 2f50 0004                 move.l     (a0),4(a7)
[00014b80] 2057                      movea.l    (a7),a0
[00014b82] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014b88] 23ef 0004 000c f00a       move.l     4(a7),list_string
[00014b90] 206f 0004                 movea.l    4(a7),a0
[00014b94] 23e8 0034 000c f00e       move.l     52(a0),$000CF00E
[00014b9c] 41f9 000c f00a            lea.l      list_string,a0
[00014ba2] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014ba8] 4e91                      jsr        (a1)
[00014baa] 2057                      movea.l    (a7),a0
[00014bac] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014bb2] 504f                      addq.w     #8,a7
[00014bb4] 4e75                      rts
ge_tedinfo:
[00014bb6] 514f                      subq.w     #8,a7
[00014bb8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014bbe] 2ea8 0258                 move.l     600(a0),(a7)
[00014bc2] 2057                      movea.l    (a7),a0
[00014bc4] 2f50 0004                 move.l     (a0),4(a7)
[00014bc8] 2057                      movea.l    (a7),a0
[00014bca] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014bd0] 23ef 0004 000c f0d0       move.l     4(a7),list_tedi
[00014bd8] 206f 0004                 movea.l    4(a7),a0
[00014bdc] 23e8 0028 000c f0d4       move.l     40(a0),$000CF0D4
[00014be4] 41f9 000c f0d0            lea.l      list_tedi,a0
[00014bea] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014bf0] 4e91                      jsr        (a1)
[00014bf2] 2057                      movea.l    (a7),a0
[00014bf4] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014bfa] 504f                      addq.w     #8,a7
[00014bfc] 4e75                      rts
ge_userblk:
[00014bfe] 514f                      subq.w     #8,a7
[00014c00] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014c06] 2ea8 0258                 move.l     600(a0),(a7)
[00014c0a] 2057                      movea.l    (a7),a0
[00014c0c] 2f50 0004                 move.l     (a0),4(a7)
[00014c10] 2057                      movea.l    (a7),a0
[00014c12] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014c18] 23ef 0004 000c e550       move.l     4(a7),list_user
[00014c20] 206f 0004                 movea.l    4(a7),a0
[00014c24] 23e8 0038 000c e554       move.l     56(a0),$000CE554
[00014c2c] 41f9 000c e550            lea.l      list_user,a0
[00014c32] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014c38] 4e91                      jsr        (a1)
[00014c3a] 2057                      movea.l    (a7),a0
[00014c3c] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014c42] 504f                      addq.w     #8,a7
[00014c44] 4e75                      rts
ge_window:
[00014c46] 514f                      subq.w     #8,a7
[00014c48] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014c4e] 2ea8 0258                 move.l     600(a0),(a7)
[00014c52] 2057                      movea.l    (a7),a0
[00014c54] 2f50 0004                 move.l     (a0),4(a7)
[00014c58] 2057                      movea.l    (a7),a0
[00014c5a] 0068 0004 0054            ori.w      #$0004,84(a0)
[00014c60] 23ef 0004 000c e112       move.l     4(a7),list_window
[00014c68] 206f 0004                 movea.l    4(a7),a0
[00014c6c] 23e8 0014 000c e116       move.l     20(a0),$000CE116
[00014c74] 41f9 000c e112            lea.l      list_window,a0
[00014c7a] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00014c80] 4e91                      jsr        (a1)
[00014c82] 2057                      movea.l    (a7),a0
[00014c84] 0268 fffb 0054            andi.w     #$FFFB,84(a0)
[00014c8a] 504f                      addq.w     #8,a7
[00014c8c] 4e75                      rts
openFile:
[00014c8e] 2f0a                      move.l     a2,-(a7)
[00014c90] 4fef ff64                 lea.l      -156(a7),a7
[00014c94] 2f48 0098                 move.l     a0,152(a7)
[00014c98] 2f49 0094                 move.l     a1,148(a7)
[00014c9c] 206f 0094                 movea.l    148(a7),a0
[00014ca0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00014ca6] 4a40                      tst.w      d0
[00014ca8] 6706                      beq.s      $00014CB0
[00014caa] 91c8                      suba.l     a0,a0
[00014cac] 6000 017c                 bra        $00014E2A
[00014cb0] 705c                      moveq.l    #92,d0
[00014cb2] 206f 0094                 movea.l    148(a7),a0
[00014cb6] 4eb9 0008 2e9e            jsr        strrchr
[00014cbc] 2f48 008c                 move.l     a0,140(a7)
[00014cc0] 202f 008c                 move.l     140(a7),d0
[00014cc4] 6608                      bne.s      $00014CCE
[00014cc6] 2f6f 0094 008c            move.l     148(a7),140(a7)
[00014ccc] 6004                      bra.s      $00014CD2
[00014cce] 52af 008c                 addq.l     #1,140(a7)
[00014cd2] 226f 0094                 movea.l    148(a7),a1
[00014cd6] 41d7                      lea.l      (a7),a0
[00014cd8] 4eb9 0004 b758            jsr        Af_2ext
[00014cde] 41d7                      lea.l      (a7),a0
[00014ce0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00014ce6] 4a40                      tst.w      d0
[00014ce8] 6710                      beq.s      $00014CFA
[00014cea] 43f9 0009 ad16            lea.l      $0009AD16,a1
[00014cf0] 206f 008c                 movea.l    140(a7),a0
[00014cf4] 4eb9 0008 2e42            jsr        strcat
[00014cfa] 226f 0094                 movea.l    148(a7),a1
[00014cfe] 41d7                      lea.l      (a7),a0
[00014d00] 4eb9 0004 b758            jsr        Af_2ext
[00014d06] 43f9 0009 ad1b            lea.l      $0009AD1B,a1
[00014d0c] 41d7                      lea.l      (a7),a0
[00014d0e] 4eb9 0004 66ea            jsr        Ast_icmp
[00014d14] 4a40                      tst.w      d0
[00014d16] 6712                      beq.s      $00014D2A
[00014d18] 43f9 0009 ad1f            lea.l      $0009AD1F,a1
[00014d1e] 41d7                      lea.l      (a7),a0
[00014d20] 4eb9 0004 66ea            jsr        Ast_icmp
[00014d26] 4a40                      tst.w      d0
[00014d28] 6676                      bne.s      $00014DA0
[00014d2a] 2079 0009 abd4            movea.l    $0009ABD4,a0
[00014d30] 216f 008c 0008            move.l     140(a7),8(a0)
[00014d36] 1f7c 0020 000c            move.b     #$20,12(a7)
[00014d3c] 226f 0094                 movea.l    148(a7),a1
[00014d40] 41ef 000d                 lea.l      13(a7),a0
[00014d44] 4eb9 0008 2f0c            jsr        strcpy
[00014d4a] 41ef 000c                 lea.l      12(a7),a0
[00014d4e] 23c8 0009 abc8            move.l     a0,$0009ABC8
[00014d54] 41f9 0009 ab7a            lea.l      WI_GENERAL,a0
[00014d5a] 4eb9 0005 7052            jsr        Awi_create
[00014d60] 2f48 0090                 move.l     a0,144(a7)
[00014d64] 6606                      bne.s      $00014D6C
[00014d66] 91c8                      suba.l     a0,a0
[00014d68] 6000 00c0                 bra        $00014E2A
[00014d6c] 206f 0090                 movea.l    144(a7),a0
[00014d70] 2068 004e                 movea.l    78(a0),a0
[00014d74] 5248                      addq.w     #1,a0
[00014d76] 226f 0090                 movea.l    144(a7),a1
[00014d7a] 2288                      move.l     a0,(a1)
[00014d7c] 206f 0090                 movea.l    144(a7),a0
[00014d80] 226f 0090                 movea.l    144(a7),a1
[00014d84] 2269 000c                 movea.l    12(a1),a1
[00014d88] 4e91                      jsr        (a1)
[00014d8a] 4a40                      tst.w      d0
[00014d8c] 6710                      beq.s      $00014D9E
[00014d8e] 206f 0090                 movea.l    144(a7),a0
[00014d92] 4eb9 0001 4f80            jsr        term
[00014d98] 91c8                      suba.l     a0,a0
[00014d9a] 6000 008e                 bra        $00014E2A
[00014d9e] 6068                      bra.s      $00014E08
[00014da0] 43f9 0009 ad23            lea.l      $0009AD23,a1
[00014da6] 41d7                      lea.l      (a7),a0
[00014da8] 4eb9 0004 66ea            jsr        Ast_icmp
[00014dae] 4a40                      tst.w      d0
[00014db0] 6712                      beq.s      $00014DC4
[00014db2] 43f9 0009 ad26            lea.l      $0009AD26,a1
[00014db8] 41d7                      lea.l      (a7),a0
[00014dba] 4eb9 0004 66ea            jsr        Ast_icmp
[00014dc0] 4a40                      tst.w      d0
[00014dc2] 660c                      bne.s      $00014DD0
[00014dc4] 206f 0094                 movea.l    148(a7),a0
[00014dc8] 4eb9 0007 1408            jsr        Ash_module
[00014dce] 6038                      bra.s      $00014E08
[00014dd0] 91c8                      suba.l     a0,a0
[00014dd2] 2279 000d 34dc            movea.l    $000D34DC,a1
[00014dd8] 4e91                      jsr        (a1)
[00014dda] 2f48 0090                 move.l     a0,144(a7)
[00014dde] 202f 0090                 move.l     144(a7),d0
[00014de2] 6724                      beq.s      $00014E08
[00014de4] 226f 0094                 movea.l    148(a7),a1
[00014de8] 303c 00ca                 move.w     #$00CA,d0
[00014dec] 206f 0090                 movea.l    144(a7),a0
[00014df0] 246f 0090                 movea.l    144(a7),a2
[00014df4] 246a 0004                 movea.l    4(a2),a2
[00014df8] 4e92                      jsr        (a2)
[00014dfa] 206f 0090                 movea.l    144(a7),a0
[00014dfe] 226f 0090                 movea.l    144(a7),a1
[00014e02] 2269 000c                 movea.l    12(a1),a1
[00014e06] 4e91                      jsr        (a1)
[00014e08] 202f 0098                 move.l     152(a7),d0
[00014e0c] 6608                      bne.s      $00014E16
[00014e0e] 206f 0098                 movea.l    152(a7),a0
[00014e12] 20af 0090                 move.l     144(a7),(a0)
[00014e16] 226f 0094                 movea.l    148(a7),a1
[00014e1a] 2079 0008 47fa            movea.l    last_path,a0
[00014e20] 4eb9 0008 2f0c            jsr        strcpy
[00014e26] 206f 0090                 movea.l    144(a7),a0
[00014e2a] 4fef 009c                 lea.l      156(a7),a7
[00014e2e] 245f                      movea.l    (a7)+,a2
[00014e30] 4e75                      rts
ge_make:
[00014e32] 2f0a                      move.l     a2,-(a7)
[00014e34] 4fef fff4                 lea.l      -12(a7),a7
[00014e38] 2f48 0004                 move.l     a0,4(a7)
[00014e3c] 4297                      clr.l      (a7)
[00014e3e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014e44] 3028 0246                 move.w     582(a0),d0
[00014e48] 6f06                      ble.s      $00014E50
[00014e4a] 4eb9 0004 810e            jsr        Adr_unselect
[00014e50] 206f 0004                 movea.l    4(a7),a0
[00014e54] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00014e5a] 4a40                      tst.w      d0
[00014e5c] 6750                      beq.s      $00014EAE
[00014e5e] 42a7                      clr.l      -(a7)
[00014e60] 4879 0009 ad2a            pea.l      $0009AD2A
[00014e66] 7201                      moveq.l    #1,d1
[00014e68] 4240                      clr.w      d0
[00014e6a] 2279 0008 47fa            movea.l    last_path,a1
[00014e70] 41f9 0008 b1ae            lea.l      ttl_open,a0
[00014e76] 4eb9 0006 dc24            jsr        Af_fileselect
[00014e7c] 504f                      addq.w     #8,a7
[00014e7e] 2f48 0008                 move.l     a0,8(a7)
[00014e82] 202f 0008                 move.l     8(a7),d0
[00014e86] 6724                      beq.s      $00014EAC
[00014e88] 487a fe04                 pea.l      openFile(pc)
[00014e8c] 42a7                      clr.l      -(a7)
[00014e8e] 43ef 0008                 lea.l      8(a7),a1
[00014e92] 206f 0010                 movea.l    16(a7),a0
[00014e96] 246f 0010                 movea.l    16(a7),a2
[00014e9a] 246a 0040                 movea.l    64(a2),a2
[00014e9e] 4e92                      jsr        (a2)
[00014ea0] 504f                      addq.w     #8,a7
[00014ea2] 206f 0008                 movea.l    8(a7),a0
[00014ea6] 4eb9 0007 0c5e            jsr        Alu_delete
[00014eac] 600a                      bra.s      $00014EB8
[00014eae] 226f 0004                 movea.l    4(a7),a1
[00014eb2] 41d7                      lea.l      (a7),a0
[00014eb4] 6100 fdd8                 bsr        openFile
[00014eb8] 2057                      movea.l    (a7),a0
[00014eba] 4fef 000c                 lea.l      12(a7),a7
[00014ebe] 245f                      movea.l    (a7)+,a2
[00014ec0] 4e75                      rts
ge_service:
[00014ec2] 2f0a                      move.l     a2,-(a7)
[00014ec4] 4fef ffee                 lea.l      -18(a7),a7
[00014ec8] 2f48 000e                 move.l     a0,14(a7)
[00014ecc] 3f40 000c                 move.w     d0,12(a7)
[00014ed0] 2f49 0008                 move.l     a1,8(a7)
[00014ed4] 302f 000c                 move.w     12(a7),d0
[00014ed8] b07c 0025                 cmp.w      #$0025,d0
[00014edc] 6700 007a                 beq.w      $00014F58
[00014ee0] 6e14                      bgt.s      $00014EF6
[00014ee2] 5540                      subq.w     #2,d0
[00014ee4] 6752                      beq.s      $00014F38
[00014ee6] 907c 000d                 sub.w      #$000D,d0
[00014eea] 6758                      beq.s      $00014F44
[00014eec] 907c 0015                 sub.w      #$0015,d0
[00014ef0] 675c                      beq.s      $00014F4E
[00014ef2] 6000 006e                 bra.w      $00014F62
[00014ef6] 907c 2711                 sub.w      #$2711,d0
[00014efa] 6706                      beq.s      $00014F02
[00014efc] 5940                      subq.w     #4,d0
[00014efe] 672c                      beq.s      $00014F2C
[00014f00] 6060                      bra.s      $00014F62
[00014f02] 206f 000e                 movea.l    14(a7),a0
[00014f06] 2f50 0004                 move.l     (a0),4(a7)
[00014f0a] 202f 0004                 move.l     4(a7),d0
[00014f0e] 671a                      beq.s      $00014F2A
[00014f10] 2eaf 0008                 move.l     8(a7),(a7)
[00014f14] 206f 0004                 movea.l    4(a7),a0
[00014f18] 2268 0008                 movea.l    8(a0),a1
[00014f1c] 303c 2712                 move.w     #$2712,d0
[00014f20] 2057                      movea.l    (a7),a0
[00014f22] 2457                      movea.l    (a7),a2
[00014f24] 246a 0004                 movea.l    4(a2),a2
[00014f28] 4e92                      jsr        (a2)
[00014f2a] 604a                      bra.s      $00014F76
[00014f2c] 0c79 0001 000e 7724       cmpi.w     #$0001,save_aborted
[00014f34] 6602                      bne.s      $00014F38
[00014f36] 603e                      bra.s      $00014F76
[00014f38] 206f 000e                 movea.l    14(a7),a0
[00014f3c] 4eb9 0001 4f80            jsr        term
[00014f42] 6032                      bra.s      $00014F76
[00014f44] 206f 000e                 movea.l    14(a7),a0
[00014f48] 6100 f048                 bsr        info
[00014f4c] 6028                      bra.s      $00014F76
[00014f4e] 206f 0008                 movea.l    8(a7),a0
[00014f52] 30bc 0001                 move.w     #$0001,(a0)
[00014f56] 601e                      bra.s      $00014F76
[00014f58] 206f 0008                 movea.l    8(a7),a0
[00014f5c] 42a8 0002                 clr.l      2(a0)
[00014f60] 6014                      bra.s      $00014F76
[00014f62] 226f 0008                 movea.l    8(a7),a1
[00014f66] 302f 000c                 move.w     12(a7),d0
[00014f6a] 206f 000e                 movea.l    14(a7),a0
[00014f6e] 4eb9 0005 9dd0            jsr        Awi_service
[00014f74] 6002                      bra.s      $00014F78
[00014f76] 7001                      moveq.l    #1,d0
[00014f78] 4fef 0012                 lea.l      18(a7),a7
[00014f7c] 245f                      movea.l    (a7)+,a2
[00014f7e] 4e75                      rts
term:
[00014f80] 4fef fff0                 lea.l      -16(a7),a7
[00014f84] 2f48 000c                 move.l     a0,12(a7)
[00014f88] 206f 000c                 movea.l    12(a7),a0
[00014f8c] 2f50 0008                 move.l     (a0),8(a7)
[00014f90] 202f 0008                 move.l     8(a7),d0
[00014f94] 6700 00a4                 beq        $0001503A
[00014f98] 7001                      moveq.l    #1,d0
[00014f9a] 206f 0008                 movea.l    8(a7),a0
[00014f9e] 4eb9 0001 8230            jsr        acs_closewi
[00014fa4] 7001                      moveq.l    #1,d0
[00014fa6] 206f 0008                 movea.l    8(a7),a0
[00014faa] c068 0006                 and.w      6(a0),d0
[00014fae] 6700 0080                 beq        $00015030
[00014fb2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00014fb8] 3028 023a                 move.w     570(a0),d0
[00014fbc] 670a                      beq.s      $00014FC8
[00014fbe] 2f7c 0008 b007 0004       move.l     #ERR_MODIFIED,4(a7)
[00014fc6] 6008                      bra.s      $00014FD0
[00014fc8] 2f7c 0008 afaa 0004       move.l     #ERR_AMODIFIED,4(a7)
[00014fd0] 705c                      moveq.l    #92,d0
[00014fd2] 206f 0008                 movea.l    8(a7),a0
[00014fd6] 2068 0008                 movea.l    8(a0),a0
[00014fda] 4eb9 0008 2e9e            jsr        strrchr
[00014fe0] 2e88                      move.l     a0,(a7)
[00014fe2] 2017                      move.l     (a7),d0
[00014fe4] 660a                      bne.s      $00014FF0
[00014fe6] 206f 0008                 movea.l    8(a7),a0
[00014fea] 2ea8 0008                 move.l     8(a0),(a7)
[00014fee] 6002                      bra.s      $00014FF2
[00014ff0] 5297                      addq.l     #1,(a7)
[00014ff2] 2257                      movea.l    (a7),a1
[00014ff4] 206f 0004                 movea.l    4(a7),a0
[00014ff8] 4eb9 0006 b80c            jsr        alert_str
[00014ffe] 5340                      subq.w     #1,d0
[00015000] 6706                      beq.s      $00015008
[00015002] 5540                      subq.w     #2,d0
[00015004] 6716                      beq.s      $0001501C
[00015006] 601e                      bra.s      $00015026
[00015008] 206f 000c                 movea.l    12(a7),a0
[0001500c] 0068 0200 0056            ori.w      #$0200,86(a0)
[00015012] 206f 000c                 movea.l    12(a7),a0
[00015016] 6100 f110                 bsr        save
[0001501a] 6014                      bra.s      $00015030
[0001501c] 33fc 0001 000e 7724       move.w     #$0001,save_aborted
[00015024] 601e                      bra.s      $00015044
[00015026] 206f 000c                 movea.l    12(a7),a0
[0001502a] 0068 0200 0056            ori.w      #$0200,86(a0)
[00015030] 206f 0008                 movea.l    8(a7),a0
[00015034] 4eb9 0001 7f16            jsr        free_acs
[0001503a] 206f 000c                 movea.l    12(a7),a0
[0001503e] 4eb9 0005 85f2            jsr        Awi_delete
[00015044] 4fef 0010                 lea.l      16(a7),a7
[00015048] 4e75                      rts
exec_cmd:
[0001504a] 2f0a                      move.l     a2,-(a7)
[0001504c] 594f                      subq.w     #4,a7
[0001504e] 2e88                      move.l     a0,(a7)
[00015050] 2057                      movea.l    (a7),a0
[00015052] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00015058] 4a40                      tst.w      d0
[0001505a] 661c                      bne.s      $00015078
[0001505c] 2257                      movea.l    (a7),a1
[0001505e] 303c 2714                 move.w     #$2714,d0
[00015062] 2079 000e 76ca            movea.l    base_window,a0
[00015068] 2479 000e 76ca            movea.l    base_window,a2
[0001506e] 246a 0004                 movea.l    4(a2),a2
[00015072] 4e92                      jsr        (a2)
[00015074] 4a40                      tst.w      d0
[00015076] 670a                      beq.s      $00015082
[00015078] 2057                      movea.l    (a7),a0
[0001507a] 2279 0009 ab82            movea.l    $0009AB82,a1
[00015080] 4e91                      jsr        (a1)
[00015082] 584f                      addq.w     #4,a7
[00015084] 245f                      movea.l    (a7)+,a2
[00015086] 4e75                      rts
newclose:
[00015088] 2f0a                      move.l     a2,-(a7)
[0001508a] 93c9                      suba.l     a1,a1
[0001508c] 303c 2713                 move.w     #$2713,d0
[00015090] 2079 000e 76ca            movea.l    base_window,a0
[00015096] 2479 000e 76ca            movea.l    base_window,a2
[0001509c] 246a 0004                 movea.l    4(a2),a2
[000150a0] 4e92                      jsr        (a2)
[000150a2] 4279 000e 7724            clr.w      save_aborted
[000150a8] 91c8                      suba.l     a0,a0
[000150aa] 303c 2715                 move.w     #$2715,d0
[000150ae] 4eb9 0005 6a20            jsr        Awi_sendall
[000150b4] 0c79 0001 000e 7724       cmpi.w     #$0001,save_aborted
[000150bc] 6602                      bne.s      $000150C0
[000150be] 6010                      bra.s      $000150D0
[000150c0] 2039 000e 7718            move.l     oldclose,d0
[000150c6] 6708                      beq.s      $000150D0
[000150c8] 2079 000e 7718            movea.l    oldclose,a0
[000150ce] 4e90                      jsr        (a0)
[000150d0] 245f                      movea.l    (a7)+,a2
[000150d2] 4e75                      rts
timmer_200:
[000150d4] 2038 04ba                 move.l     ($000004BA).w,d0
[000150d8] 4e75                      rts
debugclick:
[000150da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000150e0] 2068 025c                 movea.l    604(a0),a0
[000150e4] 3028 000a                 move.w     10(a0),d0
[000150e8] c07c 4000                 and.w      #$4000,d0
[000150ec] 6730                      beq.s      $0001511E
[000150ee] 93c9                      suba.l     a1,a1
[000150f0] 303c 00ce                 move.w     #$00CE,d0
[000150f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000150fa] 2068 025c                 movea.l    604(a0),a0
[000150fe] 4eb9 0003 a772            jsr        Auo_editor
[00015104] 93c9                      suba.l     a1,a1
[00015106] 7005                      moveq.l    #5,d0
[00015108] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001510e] 2068 025c                 movea.l    604(a0),a0
[00015112] 4eb9 0003 a772            jsr        Auo_editor
[00015118] 4eb9 0001 5126            jsr        debugtimer
[0001511e] 4eb9 0005 0c80            jsr        Aev_release
[00015124] 4e75                      rts
debugtimer:
[00015126] 4fef ffa8                 lea.l      -88(a7),a7
[0001512a] 41fa ffa8                 lea.l      timmer_200(pc),a0
[0001512e] 4eb9 0008 0b76            jsr        Supexec
[00015134] 23c0 0009 acc2            move.l     d0,t1
[0001513a] 2039 0009 acc2            move.l     t1,d0
[00015140] 90b9 0009 acc6            sub.l      t2,d0
[00015146] b0bc 0000 03e8            cmp.l      #$000003E8,d0
[0001514c] 6c04                      bge.s      $00015152
[0001514e] 6000 04f2                 bra        $00015642
[00015152] 2039 0009 acbe            move.l     debug,d0
[00015158] 672c                      beq.s      $00015186
[0001515a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015160] 3228 0264                 move.w     612(a0),d1
[00015164] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001516a] 3028 0262                 move.w     610(a0),d0
[0001516e] 2079 0009 acbe            movea.l    debug,a0
[00015174] 41e8 0024                 lea.l      36(a0),a0
[00015178] 4eb9 0006 b7a6            jsr        Aob_within
[0001517e] 4a40                      tst.w      d0
[00015180] 6704                      beq.s      $00015186
[00015182] 6000 04be                 bra        $00015642
[00015186] 23f9 0009 acc2 0009 acc6  move.l     t1,t2
[00015190] 2039 0009 acbe            move.l     debug,d0
[00015196] 6634                      bne.s      $000151CC
[00015198] 91c8                      suba.l     a0,a0
[0001519a] 2279 000d 63e8            movea.l    $000D63E8,a1
[000151a0] 4e91                      jsr        (a1)
[000151a2] 23c8 0009 acbe            move.l     a0,debug
[000151a8] 6722                      beq.s      $000151CC
[000151aa] 2079 0009 acbe            movea.l    debug,a0
[000151b0] 2068 0014                 movea.l    20(a0),a0
[000151b4] 217c 0001 50da 0018       move.l     #debugclick,24(a0)
[000151bc] 2079 0009 acbe            movea.l    debug,a0
[000151c2] 2068 0014                 movea.l    20(a0),a0
[000151c6] 317c 0040 0008            move.w     #$0040,8(a0)
[000151cc] 2039 0009 acbe            move.l     debug,d0
[000151d2] 6604                      bne.s      $000151D8
[000151d4] 6000 046c                 bra        $00015642
[000151d8] 4eb9 0005 69d6            jsr        Awi_list
[000151de] 2f48 0050                 move.l     a0,80(a7)
[000151e2] 2f48 0054                 move.l     a0,84(a7)
[000151e6] 206f 0050                 movea.l    80(a7),a0
[000151ea] 2f50 004c                 move.l     (a0),76(a7)
[000151ee] 6700 043c                 beq        $0001562C
[000151f2] 206f 004c                 movea.l    76(a7),a0
[000151f6] 0c90 2e41 4353            cmpi.l     #$2E414353,(a0)
[000151fc] 6600 042e                 bne        $0001562C
[00015200] 206f 004c                 movea.l    76(a7),a0
[00015204] 2f68 0034 0014            move.l     52(a0),20(a7)
[0001520a] 206f 0014                 movea.l    20(a7),a0
[0001520e] 2f68 0004 0010            move.l     4(a0),16(a7)
[00015214] 206f 0014                 movea.l    20(a7),a0
[00015218] 2028 000e                 move.l     14(a0),d0
[0001521c] e488                      lsr.l      #2,d0
[0001521e] 3f40 004a                 move.w     d0,74(a7)
[00015222] 426f 0046                 clr.w      70(a7)
[00015226] 6000 01e4                 bra        $0001540C
[0001522a] 302f 0046                 move.w     70(a7),d0
[0001522e] 48c0                      ext.l      d0
[00015230] e588                      lsl.l      #2,d0
[00015232] 206f 004c                 movea.l    76(a7),a0
[00015236] d1c0                      adda.l     d0,a0
[00015238] 2f68 01f6 0008            move.l     502(a0),8(a7)
[0001523e] 206f 0008                 movea.l    8(a7),a0
[00015242] 2f68 0004 0004            move.l     4(a0),4(a7)
[00015248] 206f 0008                 movea.l    8(a7),a0
[0001524c] 2028 000e                 move.l     14(a0),d0
[00015250] e488                      lsr.l      #2,d0
[00015252] 3f40 0048                 move.w     d0,72(a7)
[00015256] 302f 0048                 move.w     72(a7),d0
[0001525a] b06f 004a                 cmp.w      74(a7),d0
[0001525e] 6740                      beq.s      $000152A0
[00015260] 2079 0009 acbe            movea.l    debug,a0
[00015266] 2279 0009 acbe            movea.l    debug,a1
[0001526c] 2269 000c                 movea.l    12(a1),a1
[00015270] 4e91                      jsr        (a1)
[00015272] 3f2f 0048                 move.w     72(a7),-(a7)
[00015276] 3f2f 0048                 move.w     72(a7),-(a7)
[0001527a] 3f2f 004e                 move.w     78(a7),-(a7)
[0001527e] 206f 0056                 movea.l    86(a7),a0
[00015282] 2f28 004e                 move.l     78(a0),-(a7)
[00015286] 43f9 0009 ad3c            lea.l      $0009AD3C,a1
[0001528c] 2079 0009 acbe            movea.l    debug,a0
[00015292] 4eb9 0004 28c4            jsr        wprintf
[00015298] 4fef 000a                 lea.l      10(a7),a7
[0001529c] 6000 03a4                 bra        $00015642
[000152a0] 426f 0044                 clr.w      68(a7)
[000152a4] 6000 0156                 bra        $000153FC
[000152a8] 426f 0040                 clr.w      64(a7)
[000152ac] 302f 0044                 move.w     68(a7),d0
[000152b0] 48c0                      ext.l      d0
[000152b2] e588                      lsl.l      #2,d0
[000152b4] 206f 0010                 movea.l    16(a7),a0
[000152b8] 2f70 0800 000c            move.l     0(a0,d0.l),12(a7)
[000152be] 3f2f 0046                 move.w     70(a7),-(a7)
[000152c2] 206f 000e                 movea.l    14(a7),a0
[000152c6] 4868 0016                 pea.l      22(a0)
[000152ca] 43f9 0009 ad83            lea.l      $0009AD83,a1
[000152d0] 41ef 001e                 lea.l      30(a7),a0
[000152d4] 4eb9 0008 15ac            jsr        sprintf
[000152da] 5c4f                      addq.w     #6,a7
[000152dc] 426f 0042                 clr.w      66(a7)
[000152e0] 6030                      bra.s      $00015312
[000152e2] 302f 0042                 move.w     66(a7),d0
[000152e6] 48c0                      ext.l      d0
[000152e8] e588                      lsl.l      #2,d0
[000152ea] 206f 0004                 movea.l    4(a7),a0
[000152ee] 2eb0 0800                 move.l     0(a0,d0.l),(a7)
[000152f2] 43ef 0018                 lea.l      24(a7),a1
[000152f6] 2057                      movea.l    (a7),a0
[000152f8] 41e8 0016                 lea.l      22(a0),a0
[000152fc] 4eb9 0004 66ea            jsr        Ast_icmp
[00015302] 4a40                      tst.w      d0
[00015304] 6608                      bne.s      $0001530E
[00015306] 3f7c 0001 0040            move.w     #$0001,64(a7)
[0001530c] 600e                      bra.s      $0001531C
[0001530e] 526f 0042                 addq.w     #1,66(a7)
[00015312] 302f 0042                 move.w     66(a7),d0
[00015316] b06f 0048                 cmp.w      72(a7),d0
[0001531a] 6dc6                      blt.s      $000152E2
[0001531c] 302f 0040                 move.w     64(a7),d0
[00015320] 663c                      bne.s      $0001535E
[00015322] 2079 0009 acbe            movea.l    debug,a0
[00015328] 2279 0009 acbe            movea.l    debug,a1
[0001532e] 2269 000c                 movea.l    12(a1),a1
[00015332] 4e91                      jsr        (a1)
[00015334] 486f 0018                 pea.l      24(a7)
[00015338] 3f2f 0048                 move.w     72(a7),-(a7)
[0001533c] 206f 0056                 movea.l    86(a7),a0
[00015340] 2f28 004e                 move.l     78(a0),-(a7)
[00015344] 43f9 0009 ad8d            lea.l      $0009AD8D,a1
[0001534a] 2079 0009 acbe            movea.l    debug,a0
[00015350] 4eb9 0004 28c4            jsr        wprintf
[00015356] 4fef 000a                 lea.l      10(a7),a7
[0001535a] 6000 009c                 bra        $000153F8
[0001535e] 302f 0044                 move.w     68(a7),d0
[00015362] b06f 0042                 cmp.w      66(a7),d0
[00015366] 6700 0090                 beq        $000153F8
[0001536a] 2079 0009 acbe            movea.l    debug,a0
[00015370] 2279 0009 acbe            movea.l    debug,a1
[00015376] 2269 000c                 movea.l    12(a1),a1
[0001537a] 4e91                      jsr        (a1)
[0001537c] 3f2f 0042                 move.w     66(a7),-(a7)
[00015380] 3f2f 0048                 move.w     72(a7),-(a7)
[00015384] 3f2f 0048                 move.w     72(a7),-(a7)
[00015388] 486f 001e                 pea.l      30(a7)
[0001538c] 43f9 0009 add5            lea.l      $0009ADD5,a1
[00015392] 2079 0009 acbe            movea.l    debug,a0
[00015398] 4eb9 0004 28c4            jsr        wprintf
[0001539e] 4fef 000a                 lea.l      10(a7),a7
[000153a2] 426f 0042                 clr.w      66(a7)
[000153a6] 6046                      bra.s      $000153EE
[000153a8] 302f 0042                 move.w     66(a7),d0
[000153ac] 48c0                      ext.l      d0
[000153ae] e588                      lsl.l      #2,d0
[000153b0] 206f 0004                 movea.l    4(a7),a0
[000153b4] 2070 0800                 movea.l    0(a0,d0.l),a0
[000153b8] 4868 0016                 pea.l      22(a0)
[000153bc] 302f 0046                 move.w     70(a7),d0
[000153c0] 48c0                      ext.l      d0
[000153c2] e588                      lsl.l      #2,d0
[000153c4] 206f 0014                 movea.l    20(a7),a0
[000153c8] 2070 0800                 movea.l    0(a0,d0.l),a0
[000153cc] 4868 0016                 pea.l      22(a0)
[000153d0] 3f2f 004a                 move.w     74(a7),-(a7)
[000153d4] 43f9 0009 ae17            lea.l      $0009AE17,a1
[000153da] 2079 0009 acbe            movea.l    debug,a0
[000153e0] 4eb9 0004 28c4            jsr        wprintf
[000153e6] 4fef 000a                 lea.l      10(a7),a7
[000153ea] 526f 0042                 addq.w     #1,66(a7)
[000153ee] 302f 0042                 move.w     66(a7),d0
[000153f2] b06f 0048                 cmp.w      72(a7),d0
[000153f6] 6db0                      blt.s      $000153A8
[000153f8] 526f 0044                 addq.w     #1,68(a7)
[000153fc] 302f 0044                 move.w     68(a7),d0
[00015400] b06f 004a                 cmp.w      74(a7),d0
[00015404] 6d00 fea2                 blt        $000152A8
[00015408] 526f 0046                 addq.w     #1,70(a7)
[0001540c] 0c6f 0003 0046            cmpi.w     #$0003,70(a7)
[00015412] 6d00 fe16                 blt        $0001522A
[00015416] 206f 004c                 movea.l    76(a7),a0
[0001541a] 2f68 0024 0014            move.l     36(a0),20(a7)
[00015420] 206f 0014                 movea.l    20(a7),a0
[00015424] 2f68 0004 0010            move.l     4(a0),16(a7)
[0001542a] 206f 0014                 movea.l    20(a7),a0
[0001542e] 2028 000e                 move.l     14(a0),d0
[00015432] e488                      lsr.l      #2,d0
[00015434] 3f40 004a                 move.w     d0,74(a7)
[00015438] 426f 0046                 clr.w      70(a7)
[0001543c] 6000 01e4                 bra        $00015622
[00015440] 302f 0046                 move.w     70(a7),d0
[00015444] 48c0                      ext.l      d0
[00015446] e588                      lsl.l      #2,d0
[00015448] 206f 004c                 movea.l    76(a7),a0
[0001544c] d1c0                      adda.l     d0,a0
[0001544e] 2f68 0202 0008            move.l     514(a0),8(a7)
[00015454] 206f 0008                 movea.l    8(a7),a0
[00015458] 2f68 0004 0004            move.l     4(a0),4(a7)
[0001545e] 206f 0008                 movea.l    8(a7),a0
[00015462] 2028 000e                 move.l     14(a0),d0
[00015466] e488                      lsr.l      #2,d0
[00015468] 3f40 0048                 move.w     d0,72(a7)
[0001546c] 302f 0048                 move.w     72(a7),d0
[00015470] b06f 004a                 cmp.w      74(a7),d0
[00015474] 6740                      beq.s      $000154B6
[00015476] 2079 0009 acbe            movea.l    debug,a0
[0001547c] 2279 0009 acbe            movea.l    debug,a1
[00015482] 2269 000c                 movea.l    12(a1),a1
[00015486] 4e91                      jsr        (a1)
[00015488] 3f2f 0048                 move.w     72(a7),-(a7)
[0001548c] 3f2f 0048                 move.w     72(a7),-(a7)
[00015490] 3f2f 004e                 move.w     78(a7),-(a7)
[00015494] 206f 0056                 movea.l    86(a7),a0
[00015498] 2f28 004e                 move.l     78(a0),-(a7)
[0001549c] 43f9 0009 ae2e            lea.l      $0009AE2E,a1
[000154a2] 2079 0009 acbe            movea.l    debug,a0
[000154a8] 4eb9 0004 28c4            jsr        wprintf
[000154ae] 4fef 000a                 lea.l      10(a7),a7
[000154b2] 6000 018e                 bra        $00015642
[000154b6] 426f 0044                 clr.w      68(a7)
[000154ba] 6000 0156                 bra        $00015612
[000154be] 426f 0040                 clr.w      64(a7)
[000154c2] 302f 0044                 move.w     68(a7),d0
[000154c6] 48c0                      ext.l      d0
[000154c8] e588                      lsl.l      #2,d0
[000154ca] 206f 0010                 movea.l    16(a7),a0
[000154ce] 2f70 0800 000c            move.l     0(a0,d0.l),12(a7)
[000154d4] 3f2f 0046                 move.w     70(a7),-(a7)
[000154d8] 206f 000e                 movea.l    14(a7),a0
[000154dc] 4868 0016                 pea.l      22(a0)
[000154e0] 43f9 0009 ae75            lea.l      $0009AE75,a1
[000154e6] 41ef 001e                 lea.l      30(a7),a0
[000154ea] 4eb9 0008 15ac            jsr        sprintf
[000154f0] 5c4f                      addq.w     #6,a7
[000154f2] 426f 0042                 clr.w      66(a7)
[000154f6] 6030                      bra.s      $00015528
[000154f8] 302f 0042                 move.w     66(a7),d0
[000154fc] 48c0                      ext.l      d0
[000154fe] e588                      lsl.l      #2,d0
[00015500] 206f 0004                 movea.l    4(a7),a0
[00015504] 2eb0 0800                 move.l     0(a0,d0.l),(a7)
[00015508] 43ef 0018                 lea.l      24(a7),a1
[0001550c] 2057                      movea.l    (a7),a0
[0001550e] 41e8 0016                 lea.l      22(a0),a0
[00015512] 4eb9 0008 2eba            jsr        strcmp
[00015518] 4a40                      tst.w      d0
[0001551a] 6608                      bne.s      $00015524
[0001551c] 3f7c 0001 0040            move.w     #$0001,64(a7)
[00015522] 600e                      bra.s      $00015532
[00015524] 526f 0042                 addq.w     #1,66(a7)
[00015528] 302f 0042                 move.w     66(a7),d0
[0001552c] b06f 0048                 cmp.w      72(a7),d0
[00015530] 6dc6                      blt.s      $000154F8
[00015532] 302f 0040                 move.w     64(a7),d0
[00015536] 663c                      bne.s      $00015574
[00015538] 2079 0009 acbe            movea.l    debug,a0
[0001553e] 2279 0009 acbe            movea.l    debug,a1
[00015544] 2269 000c                 movea.l    12(a1),a1
[00015548] 4e91                      jsr        (a1)
[0001554a] 486f 0018                 pea.l      24(a7)
[0001554e] 3f2f 0048                 move.w     72(a7),-(a7)
[00015552] 206f 0056                 movea.l    86(a7),a0
[00015556] 2f28 004e                 move.l     78(a0),-(a7)
[0001555a] 43f9 0009 ae7f            lea.l      $0009AE7F,a1
[00015560] 2079 0009 acbe            movea.l    debug,a0
[00015566] 4eb9 0004 28c4            jsr        wprintf
[0001556c] 4fef 000a                 lea.l      10(a7),a7
[00015570] 6000 009c                 bra        $0001560E
[00015574] 302f 0044                 move.w     68(a7),d0
[00015578] b06f 0042                 cmp.w      66(a7),d0
[0001557c] 6700 0090                 beq        $0001560E
[00015580] 2079 0009 acbe            movea.l    debug,a0
[00015586] 2279 0009 acbe            movea.l    debug,a1
[0001558c] 2269 000c                 movea.l    12(a1),a1
[00015590] 4e91                      jsr        (a1)
[00015592] 3f2f 0042                 move.w     66(a7),-(a7)
[00015596] 3f2f 0048                 move.w     72(a7),-(a7)
[0001559a] 3f2f 0048                 move.w     72(a7),-(a7)
[0001559e] 486f 001e                 pea.l      30(a7)
[000155a2] 43f9 0009 aec7            lea.l      $0009AEC7,a1
[000155a8] 2079 0009 acbe            movea.l    debug,a0
[000155ae] 4eb9 0004 28c4            jsr        wprintf
[000155b4] 4fef 000a                 lea.l      10(a7),a7
[000155b8] 426f 0042                 clr.w      66(a7)
[000155bc] 6046                      bra.s      $00015604
[000155be] 302f 0042                 move.w     66(a7),d0
[000155c2] 48c0                      ext.l      d0
[000155c4] e588                      lsl.l      #2,d0
[000155c6] 206f 0004                 movea.l    4(a7),a0
[000155ca] 2070 0800                 movea.l    0(a0,d0.l),a0
[000155ce] 4868 0016                 pea.l      22(a0)
[000155d2] 302f 0046                 move.w     70(a7),d0
[000155d6] 48c0                      ext.l      d0
[000155d8] e588                      lsl.l      #2,d0
[000155da] 206f 0014                 movea.l    20(a7),a0
[000155de] 2070 0800                 movea.l    0(a0,d0.l),a0
[000155e2] 4868 0016                 pea.l      22(a0)
[000155e6] 3f2f 004a                 move.w     74(a7),-(a7)
[000155ea] 43f9 0009 af0a            lea.l      $0009AF0A,a1
[000155f0] 2079 0009 acbe            movea.l    debug,a0
[000155f6] 4eb9 0004 28c4            jsr        wprintf
[000155fc] 4fef 000a                 lea.l      10(a7),a7
[00015600] 526f 0042                 addq.w     #1,66(a7)
[00015604] 302f 0042                 move.w     66(a7),d0
[00015608] b06f 0048                 cmp.w      72(a7),d0
[0001560c] 6db0                      blt.s      $000155BE
[0001560e] 526f 0044                 addq.w     #1,68(a7)
[00015612] 302f 0044                 move.w     68(a7),d0
[00015616] b06f 004a                 cmp.w      74(a7),d0
[0001561a] 6d00 fea2                 blt        $000154BE
[0001561e] 526f 0046                 addq.w     #1,70(a7)
[00015622] 0c6f 0003 0046            cmpi.w     #$0003,70(a7)
[00015628] 6d00 fe16                 blt        $00015440
[0001562c] 4eb9 0005 69d6            jsr        Awi_list
[00015632] 2f48 0050                 move.l     a0,80(a7)
[00015636] 206f 0054                 movea.l    84(a7),a0
[0001563a] b1ef 0050                 cmpa.l     80(a7),a0
[0001563e] 6600 fba6                 bne        $000151E6
[00015642] 4fef 0058                 lea.l      88(a7),a7
[00015646] 4e75                      rts
ACSinit0:
[00015648] 41f9 0009 af21            lea.l      $0009AF21,a0
[0001564e] 323c 01f4                 move.w     #$01F4,d1
[00015652] 7042                      moveq.l    #66,d0
[00015654] 4eb9 0004 cee2            jsr        Ax_setRecycleSize
[0001565a] 41f9 0009 af2a            lea.l      $0009AF2A,a0
[00015660] 7205                      moveq.l    #5,d1
[00015662] 203c 0000 0262            move.l     #$00000262,d0
[00015668] 4eb9 0004 cee2            jsr        Ax_setRecycleSize
[0001566e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015674] 23e8 029c 000e 7720       move.l     668(a0),OldAboutMe
[0001567c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015682] 217c 0001 588e 029c       move.l     #AboutGUIEditor,668(a0)
[0001568a] 4240                      clr.w      d0
[0001568c] 4e75                      rts
ACSinit:
[0001568e] 2f0a                      move.l     a2,-(a7)
[00015690] 4fef ff66                 lea.l      -154(a7),a7
[00015694] 41f9 0009 acca            lea.l      $0009ACCA,a0
[0001569a] 43ef 0008                 lea.l      8(a7),a1
[0001569e] 12d8                      move.b     (a0)+,(a1)+
[000156a0] 12d8                      move.b     (a0)+,(a1)+
[000156a2] 12d8                      move.b     (a0)+,(a1)+
[000156a4] 12d8                      move.b     (a0)+,(a1)+
[000156a6] 12d8                      move.b     (a0)+,(a1)+
[000156a8] 12d8                      move.b     (a0)+,(a1)+
[000156aa] 12d8                      move.b     (a0)+,(a1)+
[000156ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[000156b2] 2f68 04e6 0004            move.l     1254(a0),4(a7)
[000156b8] 41ef 0008                 lea.l      8(a7),a0
[000156bc] 4eb9 0008 2f6c            jsr        strlen
[000156c2] 5a80                      addq.l     #5,d0
[000156c4] 4eb9 0004 c95e            jsr        Ax_glmalloc
[000156ca] 2279 0010 ee4e            movea.l    ACSblk,a1
[000156d0] 2348 04e6                 move.l     a0,1254(a1)
[000156d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000156da] 2028 04e6                 move.l     1254(a0),d0
[000156de] 6726                      beq.s      $00015706
[000156e0] 43ef 0008                 lea.l      8(a7),a1
[000156e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000156ea] 2068 04e6                 movea.l    1254(a0),a0
[000156ee] 4eb9 0008 2f0c            jsr        strcpy
[000156f4] 202f 0004                 move.l     4(a7),d0
[000156f8] 670a                      beq.s      $00015704
[000156fa] 206f 0004                 movea.l    4(a7),a0
[000156fe] 4eb9 0004 c9da            jsr        Ax_glfree
[00015704] 600c                      bra.s      $00015712
[00015706] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001570c] 216f 0004 04e6            move.l     4(a7),1254(a0)
[00015712] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015718] 23e8 02a0 000e 7718       move.l     672(a0),oldclose
[00015720] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015726] 217c 0001 5088 02a0       move.l     #newclose,672(a0)
[0001572e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00015734] 217c 0001 5126 02ac       move.l     #debugtimer,684(a0)
[0001573c] 4eb9 0005 5e8c            jsr        Awi_root
[00015742] 2f48 0010                 move.l     a0,16(a7)
[00015746] 202f 0010                 move.l     16(a7),d0
[0001574a] 6606                      bne.s      $00015752
[0001574c] 70ff                      moveq.l    #-1,d0
[0001574e] 6000 0118                 bra        $00015868
[00015752] 206f 0010                 movea.l    16(a7),a0
[00015756] 3028 0020                 move.w     32(a0),d0
[0001575a] 6f14                      ble.s      $00015770
[0001575c] 41f9 0009 a4b8            lea.l      IC_GENERAL,a0
[00015762] 4eb9 0004 f606            jsr        Aic_create
[00015768] 226f 0010                 movea.l    16(a7),a1
[0001576c] 2348 005a                 move.l     a0,90(a1)
[00015770] 2ebc 0001 504a            move.l     #exec_cmd,(a7)
[00015776] 43d7                      lea.l      (a7),a1
[00015778] 7068                      moveq.l    #104,d0
[0001577a] 206f 0010                 movea.l    16(a7),a0
[0001577e] 246f 0010                 movea.l    16(a7),a2
[00015782] 246a 0004                 movea.l    4(a2),a2
[00015786] 4e92                      jsr        (a2)
[00015788] 91c8                      suba.l     a0,a0
[0001578a] 2279 000b 9e82            movea.l    $000B9E82,a1
[00015790] 4e91                      jsr        (a1)
[00015792] 2039 000b b542            move.l     parts_window,d0
[00015798] 6606                      bne.s      $000157A0
[0001579a] 70ff                      moveq.l    #-1,d0
[0001579c] 6000 00ca                 bra        $00015868
[000157a0] 91c8                      suba.l     a0,a0
[000157a2] 2279 0008 6164            movea.l    WI_COMMON+8,a1
[000157a8] 4e91                      jsr        (a1)
[000157aa] 23c8 000e 76ca            move.l     a0,base_window
[000157b0] 2039 000e 76ca            move.l     base_window,d0
[000157b6] 6606                      bne.s      $000157BE
[000157b8] 70ff                      moveq.l    #-1,d0
[000157ba] 6000 00ac                 bra        $00015868
[000157be] 2079 0010 ee4e            movea.l    ACSblk,a0
[000157c4] 3028 0236                 move.w     566(a0),d0
[000157c8] 6700 009c                 beq        $00015866
[000157cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000157d2] 0c68 0001 0286            cmpi.w     #$0001,646(a0)
[000157d8] 6f00 008c                 ble        $00015866
[000157dc] 3f7c 0001 0098            move.w     #$0001,152(a7)
[000157e2] 6070                      bra.s      $00015854
[000157e4] 302f 0098                 move.w     152(a7),d0
[000157e8] 48c0                      ext.l      d0
[000157ea] e588                      lsl.l      #2,d0
[000157ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[000157f2] 2068 0288                 movea.l    648(a0),a0
[000157f6] 2f70 0800 0094            move.l     0(a0,d0.l),148(a7)
[000157fc] 206f 0094                 movea.l    148(a7),a0
[00015800] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00015806] 4a40                      tst.w      d0
[00015808] 6646                      bne.s      $00015850
[0001580a] 206f 0094                 movea.l    148(a7),a0
[0001580e] 4eb9 0004 663c            jsr        Ast_alltrim
[00015814] 206f 0094                 movea.l    148(a7),a0
[00015818] 1010                      move.b     (a0),d0
[0001581a] 4880                      ext.w      d0
[0001581c] 41f9 0009 af33            lea.l      $0009AF33,a0
[00015822] 4eb9 0008 2e8a            jsr        strchr
[00015828] 2008                      move.l     a0,d0
[0001582a] 6624                      bne.s      $00015850
[0001582c] 226f 0094                 movea.l    148(a7),a1
[00015830] 41ef 0014                 lea.l      20(a7),a0
[00015834] 4eb9 0004 c2a8            jsr        Af_unquote
[0001583a] 41ef 0014                 lea.l      20(a7),a0
[0001583e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00015844] 4a40                      tst.w      d0
[00015846] 6608                      bne.s      $00015850
[00015848] 41ef 0014                 lea.l      20(a7),a0
[0001584c] 6100 f7fc                 bsr        exec_cmd
[00015850] 526f 0098                 addq.w     #1,152(a7)
[00015854] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001585a] 302f 0098                 move.w     152(a7),d0
[0001585e] b068 0286                 cmp.w      646(a0),d0
[00015862] 6d00 ff80                 blt.w      $000157E4
[00015866] 4240                      clr.w      d0
[00015868] 4fef 009a                 lea.l      154(a7),a7
[0001586c] 245f                      movea.l    (a7)+,a2
[0001586e] 4e75                      rts
