ed_abort:
[0002f27c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f282] 2068 0258                 movea.l    600(a0),a0
[0002f286] 4eb9 0002 f28e            jsr        ed_wabort
[0002f28c] 4e75                      rts
ed_wabort:
[0002f28e] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002f292] 2448                      movea.l    a0,a2
[0002f294] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002f29a] b1e9 0240                 cmpa.l     576(a1),a0
[0002f29e] 6606                      bne.s      $0002F2A6
[0002f2a0] 4eb9 0004 810e            jsr        Adr_unselect
[0002f2a6] 4eb9 0005 1388            jsr        Awi_diaend
[0002f2ac] 2652                      movea.l    (a2),a3
[0002f2ae] 026a fffe 0054            andi.w     #$FFFE,84(a2)
[0002f2b4] 70ff                      moveq.l    #-1,d0
[0002f2b6] 3540 001e                 move.w     d0,30(a2)
[0002f2ba] 3540 001c                 move.w     d0,28(a2)
[0002f2be] 206a 0014                 movea.l    20(a2),a0
[0002f2c2] 226b 0022                 movea.l    34(a3),a1
[0002f2c6] 4e91                      jsr        (a1)
[0002f2c8] 42aa 0014                 clr.l      20(a2)
[0002f2cc] 202b 0026                 move.l     38(a3),d0
[0002f2d0] 6728                      beq.s      $0002F2FA
[0002f2d2] 206a 004a                 movea.l    74(a2),a0
[0002f2d6] 4eb9 0004 649c            jsr        Ast_delete
[0002f2dc] 256b 0026 004a            move.l     38(a3),74(a2)
[0002f2e2] 302a 0020                 move.w     32(a2),d0
[0002f2e6] 6f12                      ble.s      $0002F2FA
[0002f2e8] 4267                      clr.w      -(a7)
[0002f2ea] 4267                      clr.w      -(a7)
[0002f2ec] 2f2a 004a                 move.l     74(a2),-(a7)
[0002f2f0] 7202                      moveq.l    #2,d1
[0002f2f2] 4eb9 0007 f926            jsr        wind_set
[0002f2f8] 504f                      addq.w     #8,a7
[0002f2fa] 206a 009a                 movea.l    154(a2),a0
[0002f2fe] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002f304] 4a40                      tst.w      d0
[0002f306] 660a                      bne.s      $0002F312
[0002f308] 206a 009a                 movea.l    154(a2),a0
[0002f30c] 4eb9 0004 649c            jsr        Ast_delete
[0002f312] 256b 002a 009a            move.l     42(a3),154(a2)
[0002f318] 206a 009e                 movea.l    158(a2),a0
[0002f31c] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002f322] 4a40                      tst.w      d0
[0002f324] 660a                      bne.s      $0002F330
[0002f326] 206a 009e                 movea.l    158(a2),a0
[0002f32a] 4eb9 0004 649c            jsr        Ast_delete
[0002f330] 256b 002e 009e            move.l     46(a3),158(a2)
[0002f336] 302a 0056                 move.w     86(a2),d0
[0002f33a] c07c 0100                 and.w      #$0100,d0
[0002f33e] 6600 00cc                 bne        $0002F40C
[0002f342] 356b 0010 0024            move.w     16(a3),36(a2)
[0002f348] 356b 0012 0026            move.w     18(a3),38(a2)
[0002f34e] 356b 0014 0028            move.w     20(a3),40(a2)
[0002f354] 356b 0016 002a            move.w     22(a3),42(a2)
[0002f35a] 2079 000c 8e3a            movea.l    $000C8E3A,a0
[0002f360] 4eb9 0004 f064            jsr        Aob_create
[0002f366] 2848                      movea.l    a0,a4
[0002f368] 2548 005e                 move.l     a0,94(a2)
[0002f36c] 200c                      move.l     a4,d0
[0002f36e] 6710                      beq.s      $0002F380
[0002f370] 204c                      movea.l    a4,a0
[0002f372] 4eb9 0004 fbdc            jsr        Aob_fix
[0002f378] 204c                      movea.l    a4,a0
[0002f37a] 4eb9 0004 ec24            jsr        Ame_namefix
[0002f380] 204a                      movea.l    a2,a0
[0002f382] 226a 0010                 movea.l    16(a2),a1
[0002f386] 4e91                      jsr        (a1)
[0002f388] 206a 0014                 movea.l    20(a2),a0
[0002f38c] 316b 000c 0010            move.w     12(a3),16(a0)
[0002f392] 206a 0014                 movea.l    20(a2),a0
[0002f396] 316b 000e 0012            move.w     14(a3),18(a0)
[0002f39c] 302a 0022                 move.w     34(a2),d0
[0002f3a0] c07c 0100                 and.w      #$0100,d0
[0002f3a4] 670a                      beq.s      $0002F3B0
[0002f3a6] 322a 0022                 move.w     34(a2),d1
[0002f3aa] c27c 0800                 and.w      #$0800,d1
[0002f3ae] 6624                      bne.s      $0002F3D4
[0002f3b0] 006a 0fe0 0022            ori.w      #$0FE0,34(a2)
[0002f3b6] 006a 0100 0056            ori.w      #$0100,86(a2)
[0002f3bc] 204a                      movea.l    a2,a0
[0002f3be] 4eb9 0005 8362            jsr        Awi_closed
[0002f3c4] 204a                      movea.l    a2,a0
[0002f3c6] 4eb9 0005 7428            jsr        Awi_open
[0002f3cc] 026a feff 0056            andi.w     #$FEFF,86(a2)
[0002f3d2] 6008                      bra.s      $0002F3DC
[0002f3d4] 204a                      movea.l    a2,a0
[0002f3d6] 4eb9 0001 607e            jsr        view_shrink
[0002f3dc] 286b 001e                 movea.l    30(a3),a4
[0002f3e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f3e6] 3028 0246                 move.w     582(a0),d0
[0002f3ea] 6620                      bne.s      $0002F40C
[0002f3ec] 220c                      move.l     a4,d1
[0002f3ee] 671c                      beq.s      $0002F40C
[0002f3f0] 361c                      move.w     (a4)+,d3
[0002f3f2] 6014                      bra.s      $0002F408
[0002f3f4] 321c                      move.w     (a4)+,d1
[0002f3f6] 3001                      move.w     d1,d0
[0002f3f8] d040                      add.w      d0,d0
[0002f3fa] d041                      add.w      d1,d0
[0002f3fc] 5440                      addq.w     #2,d0
[0002f3fe] 204a                      movea.l    a2,a0
[0002f400] 4eb9 0004 7e6a            jsr        Adr_add
[0002f406] 5343                      subq.w     #1,d3
[0002f408] 4a43                      tst.w      d3
[0002f40a] 6ee8                      bgt.s      $0002F3F4
[0002f40c] 206b 001e                 movea.l    30(a3),a0
[0002f410] 4eb9 0004 c6c8            jsr        Ax_ifree
[0002f416] 42ab 001e                 clr.l      30(a3)
[0002f41a] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0002f41e] 4e75                      rts
edob_refs:
[0002f420] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002f424] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f42a] 2468 0258                 movea.l    600(a0),a2
[0002f42e] 2652                      movea.l    (a2),a3
[0002f430] 302b 000a                 move.w     10(a3),d0
[0002f434] 6b4c                      bmi.s      $0002F482
[0002f436] 322b 0018                 move.w     24(a3),d1
[0002f43a] 6b46                      bmi.s      $0002F482
[0002f43c] 226b 0004                 movea.l    4(a3),a1
[0002f440] 2869 0004                 movea.l    4(a1),a4
[0002f444] 48c0                      ext.l      d0
[0002f446] 2400                      move.l     d0,d2
[0002f448] e78a                      lsl.l      #3,d2
[0002f44a] 9480                      sub.l      d0,d2
[0002f44c] e78a                      lsl.l      #3,d2
[0002f44e] d9c2                      adda.l     d2,a4
[0002f450] 204c                      movea.l    a4,a0
[0002f452] 4eb9 0003 30dc            jsr        set_aeo
[0002f458] 2848                      movea.l    a0,a4
[0002f45a] 200c                      move.l     a4,d0
[0002f45c] 6724                      beq.s      $0002F482
[0002f45e] 2f2c 0014                 move.l     20(a4),-(a7)
[0002f462] 2f2c 0010                 move.l     16(a4),-(a7)
[0002f466] 42a7                      clr.l      -(a7)
[0002f468] 2f2c 0008                 move.l     8(a4),-(a7)
[0002f46c] 2f2c 0004                 move.l     4(a4),-(a7)
[0002f470] 2f2c 000c                 move.l     12(a4),-(a7)
[0002f474] 2250                      movea.l    (a0),a1
[0002f476] 204a                      movea.l    a2,a0
[0002f478] 4eb9 0002 f488            jsr        change_work
[0002f47e] 4fef 0018                 lea.l      24(a7),a7
[0002f482] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002f486] 4e75                      rts
change_work:
[0002f488] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[0002f48c] 4fef fef4                 lea.l      -268(a7),a7
[0002f490] 2448                      movea.l    a0,a2
[0002f492] 2849                      movea.l    a1,a4
[0002f494] 2c6f 0134                 movea.l    308(a7),a6
[0002f498] 006a 0001 0054            ori.w      #$0001,84(a2)
[0002f49e] 4eb9 0005 1388            jsr        Awi_diaend
[0002f4a4] 2652                      movea.l    (a2),a3
[0002f4a6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f4ac] 3628 0246                 move.w     582(a0),d3
[0002f4b0] 4a43                      tst.w      d3
[0002f4b2] 6f4c                      ble.s      $0002F500
[0002f4b4] b5e8 0240                 cmpa.l     576(a0),a2
[0002f4b8] 6646                      bne.s      $0002F500
[0002f4ba] 7001                      moveq.l    #1,d0
[0002f4bc] d043                      add.w      d3,d0
[0002f4be] 48c0                      ext.l      d0
[0002f4c0] d080                      add.l      d0,d0
[0002f4c2] 4eb9 0004 c608            jsr        Ax_malloc
[0002f4c8] 2a48                      movea.l    a0,a5
[0002f4ca] 2748 001e                 move.l     a0,30(a3)
[0002f4ce] 200d                      move.l     a5,d0
[0002f4d0] 6726                      beq.s      $0002F4F8
[0002f4d2] 3ac3                      move.w     d3,(a5)+
[0002f4d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f4da] 4268 0248                 clr.w      584(a0)
[0002f4de] 6010                      bra.s      $0002F4F0
[0002f4e0] 4eb9 0004 7e2a            jsr        Adr_next
[0002f4e6] 5540                      subq.w     #2,d0
[0002f4e8] 48c0                      ext.l      d0
[0002f4ea] 81fc 0003                 divs.w     #$0003,d0
[0002f4ee] 3ac0                      move.w     d0,(a5)+
[0002f4f0] 3003                      move.w     d3,d0
[0002f4f2] 5343                      subq.w     #1,d3
[0002f4f4] 4a40                      tst.w      d0
[0002f4f6] 6ee8                      bgt.s      $0002F4E0
[0002f4f8] 4eb9 0004 810e            jsr        Adr_unselect
[0002f4fe] 6004                      bra.s      $0002F504
[0002f500] 42ab 001e                 clr.l      30(a3)
[0002f504] 2a6a 0014                 movea.l    20(a2),a5
[0002f508] 376d 0010 000c            move.w     16(a5),12(a3)
[0002f50e] 376d 0012 000e            move.w     18(a5),14(a3)
[0002f514] 302a 0056                 move.w     86(a2),d0
[0002f518] c07c 0800                 and.w      #$0800,d0
[0002f51c] 671a                      beq.s      $0002F538
[0002f51e] 376a 002c 0010            move.w     44(a2),16(a3)
[0002f524] 376a 002e 0012            move.w     46(a2),18(a3)
[0002f52a] 376a 0030 0014            move.w     48(a2),20(a3)
[0002f530] 376a 0032 0016            move.w     50(a2),22(a3)
[0002f536] 6018                      bra.s      $0002F550
[0002f538] 376a 0024 0010            move.w     36(a2),16(a3)
[0002f53e] 376a 0026 0012            move.w     38(a2),18(a3)
[0002f544] 376a 0028 0014            move.w     40(a2),20(a3)
[0002f54a] 376a 002a 0016            move.w     42(a2),22(a3)
[0002f550] 206a 005e                 movea.l    94(a2),a0
[0002f554] 4eb9 0004 f20a            jsr        Aob_delete
[0002f55a] 254e 005e                 move.l     a6,94(a2)
[0002f55e] 200e                      move.l     a6,d0
[0002f560] 6708                      beq.s      $0002F56A
[0002f562] 204e                      movea.l    a6,a0
[0002f564] 4eb9 0004 ec24            jsr        Ame_namefix
[0002f56a] 204d                      movea.l    a5,a0
[0002f56c] 4eb9 0004 c7c8            jsr        Ax_free
[0002f572] 2a4c                      movea.l    a4,a5
[0002f574] 254d 0014                 move.l     a5,20(a2)
[0002f578] 377c 0002 0008            move.w     #$0002,8(a3)
[0002f57e] 204d                      movea.l    a5,a0
[0002f580] 4eb9 0004 fbdc            jsr        Aob_fix
[0002f586] 7208                      moveq.l    #8,d1
[0002f588] 70ff                      moveq.l    #-1,d0
[0002f58a] 204d                      movea.l    a5,a0
[0002f58c] 4eb9 0005 0e62            jsr        Aob_findflag
[0002f592] 3540 001c                 move.w     d0,28(a2)
[0002f596] 357c ffff 001e            move.w     #$FFFF,30(a2)
[0002f59c] 276f 012c 001a            move.l     300(a7),26(a3)
[0002f5a2] 276f 0130 0022            move.l     304(a7),34(a3)
[0002f5a8] 202f 0128                 move.l     296(a7),d0
[0002f5ac] 6754                      beq.s      $0002F602
[0002f5ae] 2240                      movea.l    d0,a1
[0002f5b0] 41d7                      lea.l      (a7),a0
[0002f5b2] 203c 0000 0100            move.l     #$00000100,d0
[0002f5b8] 4eb9 0008 2fd6            jsr        strncpy
[0002f5be] 203c 0000 0100            move.l     #$00000100,d0
[0002f5c4] 226a 004a                 movea.l    74(a2),a1
[0002f5c8] 41d7                      lea.l      (a7),a0
[0002f5ca] 4eb9 0008 2f96            jsr        strncat
[0002f5d0] 41d7                      lea.l      (a7),a0
[0002f5d2] 4eb9 0004 643c            jsr        Ast_create
[0002f5d8] 2f48 0100                 move.l     a0,256(a7)
[0002f5dc] 2008                      move.l     a0,d0
[0002f5de] 6722                      beq.s      $0002F602
[0002f5e0] 276a 004a 0026            move.l     74(a2),38(a3)
[0002f5e6] 2540 004a                 move.l     d0,74(a2)
[0002f5ea] 322a 0020                 move.w     32(a2),d1
[0002f5ee] 6f12                      ble.s      $0002F602
[0002f5f0] 4267                      clr.w      -(a7)
[0002f5f2] 4267                      clr.w      -(a7)
[0002f5f4] 2f00                      move.l     d0,-(a7)
[0002f5f6] 3001                      move.w     d1,d0
[0002f5f8] 7202                      moveq.l    #2,d1
[0002f5fa] 4eb9 0007 f926            jsr        wind_set
[0002f600] 504f                      addq.w     #8,a7
[0002f602] 276a 009a 002a            move.l     154(a2),42(a3)
[0002f608] 276a 009e 002e            move.l     158(a2),46(a3)
[0002f60e] 206f 0138                 movea.l    312(a7),a0
[0002f612] 4eb9 0004 643c            jsr        Ast_create
[0002f618] 2548 009a                 move.l     a0,154(a2)
[0002f61c] 206f 013c                 movea.l    316(a7),a0
[0002f620] 4eb9 0004 643c            jsr        Ast_create
[0002f626] 2548 009e                 move.l     a0,158(a2)
[0002f62a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002f630] 3029 0004                 move.w     4(a1),d0
[0002f634] d040                      add.w      d0,d0
[0002f636] d06d 0014                 add.w      20(a5),d0
[0002f63a] 3540 0028                 move.w     d0,40(a2)
[0002f63e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f644] 3228 0006                 move.w     6(a0),d1
[0002f648] e549                      lsl.w      #2,d1
[0002f64a] d26d 0016                 add.w      22(a5),d1
[0002f64e] 3541 002a                 move.w     d1,42(a2)
[0002f652] 49ef 0104                 lea.l      260(a7),a4
[0002f656] 2f39 000e 692a            move.l     _globl,-(a7)
[0002f65c] 486c 0006                 pea.l      6(a4)
[0002f660] 486c 0004                 pea.l      4(a4)
[0002f664] 206a 0014                 movea.l    20(a2),a0
[0002f668] 3f28 0016                 move.w     22(a0),-(a7)
[0002f66c] 3f28 0014                 move.w     20(a0),-(a7)
[0002f670] 3f28 0012                 move.w     18(a0),-(a7)
[0002f674] 43ec 0002                 lea.l      2(a4),a1
[0002f678] 204c                      movea.l    a4,a0
[0002f67a] 266a 0014                 movea.l    20(a2),a3
[0002f67e] 342b 0010                 move.w     16(a3),d2
[0002f682] 322a 0022                 move.w     34(a2),d1
[0002f686] c27c f01f                 and.w      #$F01F,d1
[0002f68a] 4240                      clr.w      d0
[0002f68c] 4eb9 0007 b8da            jsr        mt_wind_calc
[0002f692] 4fef 0012                 lea.l      18(a7),a7
[0002f696] 302a 0022                 move.w     34(a2),d0
[0002f69a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f6a0] 322c 0004                 move.w     4(a4),d1
[0002f6a4] b268 000c                 cmp.w      12(a0),d1
[0002f6a8] 6c04                      bge.s      $0002F6AE
[0002f6aa] c07c f1ff                 and.w      #$F1FF,d0
[0002f6ae] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f6b4] 322c 0006                 move.w     6(a4),d1
[0002f6b8] b268 000e                 cmp.w      14(a0),d1
[0002f6bc] 6c04                      bge.s      $0002F6C2
[0002f6be] c07c fe3f                 and.w      #$FE3F,d0
[0002f6c2] 3200                      move.w     d0,d1
[0002f6c4] c27c 0900                 and.w      #$0900,d1
[0002f6c8] 6604                      bne.s      $0002F6CE
[0002f6ca] c07c ffdf                 and.w      #$FFDF,d0
[0002f6ce] b06a 0022                 cmp.w      34(a2),d0
[0002f6d2] 6722                      beq.s      $0002F6F6
[0002f6d4] 3540 0022                 move.w     d0,34(a2)
[0002f6d8] 006a 0100 0056            ori.w      #$0100,86(a2)
[0002f6de] 204a                      movea.l    a2,a0
[0002f6e0] 4eb9 0005 8362            jsr        Awi_closed
[0002f6e6] 204a                      movea.l    a2,a0
[0002f6e8] 4eb9 0005 7428            jsr        Awi_open
[0002f6ee] 026a feff 0056            andi.w     #$FEFF,86(a2)
[0002f6f4] 6008                      bra.s      $0002F6FE
[0002f6f6] 204a                      movea.l    a2,a0
[0002f6f8] 4eb9 0001 6012            jsr        view_grow
[0002f6fe] 4fef 010c                 lea.l      268(a7),a7
[0002f702] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[0002f706] 4e75                      rts
edob_aflags:
[0002f708] 2f0a                      move.l     a2,-(a7)
[0002f70a] 2f0b                      move.l     a3,-(a7)
[0002f70c] 41f9 0010 ee4e            lea.l      ACSblk,a0
[0002f712] 2250                      movea.l    (a0),a1
[0002f714] 2469 0258                 movea.l    600(a1),a2
[0002f718] 2252                      movea.l    (a2),a1
[0002f71a] 2650                      movea.l    (a0),a3
[0002f71c] b5eb 0240                 cmpa.l     576(a3),a2
[0002f720] 663c                      bne.s      $0002F75E
[0002f722] 302b 0246                 move.w     582(a3),d0
[0002f726] 6b36                      bmi.s      $0002F75E
[0002f728] 3229 0018                 move.w     24(a1),d1
[0002f72c] 6b30                      bmi.s      $0002F75E
[0002f72e] 91c8                      suba.l     a0,a0
[0002f730] 4eb9 0003 2998            jsr        set_aflags
[0002f736] 2648                      movea.l    a0,a3
[0002f738] 200b                      move.l     a3,d0
[0002f73a] 6722                      beq.s      $0002F75E
[0002f73c] 2f2b 0014                 move.l     20(a3),-(a7)
[0002f740] 2f2b 0010                 move.l     16(a3),-(a7)
[0002f744] 42a7                      clr.l      -(a7)
[0002f746] 2f2b 0008                 move.l     8(a3),-(a7)
[0002f74a] 2f2b 0004                 move.l     4(a3),-(a7)
[0002f74e] 2f2b 000c                 move.l     12(a3),-(a7)
[0002f752] 2250                      movea.l    (a0),a1
[0002f754] 204a                      movea.l    a2,a0
[0002f756] 6100 fd30                 bsr        change_work
[0002f75a] 4fef 0018                 lea.l      24(a7),a7
[0002f75e] 265f                      movea.l    (a7)+,a3
[0002f760] 245f                      movea.l    (a7)+,a2
[0002f762] 4e75                      rts
edob_hide:
[0002f764] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[0002f768] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f76e] 2468 0258                 movea.l    600(a0),a2
[0002f772] 2652                      movea.l    (a2),a3
[0002f774] 2253                      movea.l    (a3),a1
[0002f776] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002f77c] 362b 000a                 move.w     10(a3),d3
[0002f780] 4a43                      tst.w      d3
[0002f782] 6f54                      ble.s      $0002F7D8
[0002f784] 377c ffff 000a            move.w     #$FFFF,10(a3)
[0002f78a] 4eb9 0004 810e            jsr        Adr_unselect
[0002f790] 286a 0014                 movea.l    20(a2),a4
[0002f794] 3803                      move.w     d3,d4
[0002f796] d844                      add.w      d4,d4
[0002f798] d843                      add.w      d3,d4
[0002f79a] 5444                      addq.w     #2,d4
[0002f79c] 3004                      move.w     d4,d0
[0002f79e] 204a                      movea.l    a2,a0
[0002f7a0] 4eb9 0002 f244            jsr        undraw
[0002f7a6] 3204                      move.w     d4,d1
[0002f7a8] 48c1                      ext.l      d1
[0002f7aa] 2001                      move.l     d1,d0
[0002f7ac] d080                      add.l      d0,d0
[0002f7ae] d081                      add.l      d1,d0
[0002f7b0] e788                      lsl.l      #3,d0
[0002f7b2] 0074 0080 0808            ori.w      #$0080,8(a4,d0.l)
[0002f7b8] 0074 0080 08f0            ori.w      #$0080,-16(a4,d0.l)
[0002f7be] 206b 0004                 movea.l    4(a3),a0
[0002f7c2] 2868 0004                 movea.l    4(a0),a4
[0002f7c6] 3803                      move.w     d3,d4
[0002f7c8] 48c4                      ext.l      d4
[0002f7ca] 2404                      move.l     d4,d2
[0002f7cc] e78a                      lsl.l      #3,d2
[0002f7ce] 9484                      sub.l      d4,d2
[0002f7d0] e78a                      lsl.l      #3,d2
[0002f7d2] 0074 0080 2810            ori.w      #$0080,16(a4,d2.l)
[0002f7d8] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[0002f7dc] 4e75                      rts
set_userdata:
[0002f7de] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[0002f7e2] 2848                      movea.l    a0,a4
[0002f7e4] 3600                      move.w     d0,d3
[0002f7e6] 3801                      move.w     d1,d4
[0002f7e8] 2279 0010 ee4e            movea.l    ACSblk,a1
[0002f7ee] 2069 0258                 movea.l    600(a1),a0
[0002f7f2] 2450                      movea.l    (a0),a2
[0002f7f4] 206a 0004                 movea.l    4(a2),a0
[0002f7f8] 2668 0004                 movea.l    4(a0),a3
[0002f7fc] 322a 000a                 move.w     10(a2),d1
[0002f800] 48c1                      ext.l      d1
[0002f802] 2401                      move.l     d1,d2
[0002f804] e78a                      lsl.l      #3,d2
[0002f806] 9481                      sub.l      d1,d2
[0002f808] e78a                      lsl.l      #3,d2
[0002f80a] d7c2                      adda.l     d2,a3
[0002f80c] 302b 001c                 move.w     28(a3),d0
[0002f810] 4eb9 0002 d91c            jsr        pixel_x
[0002f816] b640                      cmp.w      d0,d3
[0002f818] 6f0c                      ble.s      $0002F826
[0002f81a] 3003                      move.w     d3,d0
[0002f81c] 4eb9 0002 d888            jsr        char_x
[0002f822] 3740 001c                 move.w     d0,28(a3)
[0002f826] 302b 001e                 move.w     30(a3),d0
[0002f82a] 4eb9 0002 d944            jsr        pixel_y
[0002f830] b840                      cmp.w      d0,d4
[0002f832] 6f0c                      ble.s      $0002F840
[0002f834] 3004                      move.w     d4,d0
[0002f836] 4eb9 0002 d8d2            jsr        char_y
[0002f83c] 3740 001e                 move.w     d0,30(a3)
[0002f840] 2f0c                      move.l     a4,-(a7)
[0002f842] 226b 0014                 movea.l    20(a3),a1
[0002f846] 2052                      movea.l    (a2),a0
[0002f848] 4eb9 0003 54be            jsr        change_udf
[0002f84e] 584f                      addq.w     #4,a7
[0002f850] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[0002f854] 4e75                      rts
edob_specs:
[0002f856] 48e7 003c                 movem.l    a2-a5,-(a7)
[0002f85a] 4fef ffae                 lea.l      -82(a7),a7
[0002f85e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f864] 2ea8 0258                 move.l     600(a0),(a7)
[0002f868] 2257                      movea.l    (a7),a1
[0002f86a] 2851                      movea.l    (a1),a4
[0002f86c] 302c 000a                 move.w     10(a4),d0
[0002f870] 6b00 0164                 bmi        $0002F9D6
[0002f874] 206c 0004                 movea.l    4(a4),a0
[0002f878] 2668 0004                 movea.l    4(a0),a3
[0002f87c] 48c0                      ext.l      d0
[0002f87e] 2200                      move.l     d0,d1
[0002f880] e789                      lsl.l      #3,d1
[0002f882] 9280                      sub.l      d0,d1
[0002f884] e789                      lsl.l      #3,d1
[0002f886] d7c1                      adda.l     d1,a3
[0002f888] 142b 000f                 move.b     15(a3),d2
[0002f88c] 4882                      ext.w      d2
[0002f88e] 947c 0014                 sub.w      #$0014,d2
[0002f892] b47c 000d                 cmp.w      #$000D,d2
[0002f896] 6200 0116                 bhi        $0002F9AE
[0002f89a] d442                      add.w      d2,d2
[0002f89c] 343b 2006                 move.w     $0002F8A4(pc,d2.w),d2
[0002f8a0] 4efb 2002                 jmp        $0002F8A4(pc,d2.w)
J22:
[0002f8a4] 001c                      dc.w $001c   ; $0002f8c0-$0002f8a4
[0002f8a6] 002a                      dc.w $002a   ; $0002f8ce-$0002f8a4
[0002f8a8] 002a                      dc.w $002a   ; $0002f8ce-$0002f8a4
[0002f8aa] 0038                      dc.w $0038   ; $0002f8dc-$0002f8a4
[0002f8ac] 0046                      dc.w $0046   ; $0002f8ea-$0002f8a4
[0002f8ae] 001c                      dc.w $001c   ; $0002f8c0-$0002f8a4
[0002f8b0] 00f4                      dc.w $00f4   ; $0002f998-$0002f8a4
[0002f8b2] 001c                      dc.w $001c   ; $0002f8c0-$0002f8a4
[0002f8b4] 00f4                      dc.w $00f4   ; $0002f998-$0002f8a4
[0002f8b6] 002a                      dc.w $002a   ; $0002f8ce-$0002f8a4
[0002f8b8] 002a                      dc.w $002a   ; $0002f8ce-$0002f8a4
[0002f8ba] 0100                      dc.w $0100   ; $0002f9a4-$0002f8a4
[0002f8bc] 00f4                      dc.w $00f4   ; $0002f998-$0002f8a4
[0002f8be] 0100                      dc.w $0100   ; $0002f9a4-$0002f8a4
[0002f8c0] 204b                      movea.l    a3,a0
[0002f8c2] 4eb9 0003 140c            jsr        set_box
[0002f8c8] 2848                      movea.l    a0,a4
[0002f8ca] 6000 00e2                 bra        $0002F9AE
[0002f8ce] 204b                      movea.l    a3,a0
[0002f8d0] 4eb9 0003 2384            jsr        set_ted
[0002f8d6] 2848                      movea.l    a0,a4
[0002f8d8] 6000 00d4                 bra        $0002F9AE
[0002f8dc] 204b                      movea.l    a3,a0
[0002f8de] 4eb9 0003 191a            jsr        set_image
[0002f8e4] 2848                      movea.l    a0,a4
[0002f8e6] 6000 00c6                 bra        $0002F9AE
[0002f8ea] 2f6b 0014 0008            move.l     20(a3),8(a7)
[0002f8f0] 206f 0008                 movea.l    8(a7),a0
[0002f8f4] 2468 0004                 movea.l    4(a0),a2
[0002f8f8] 4bef 0006                 lea.l      6(a7),a5
[0002f8fc] 2f39 000e 692a            move.l     _globl,-(a7)
[0002f902] 486f 0008                 pea.l      8(a7)
[0002f906] 4855                      pea.l      (a5)
[0002f908] 224d                      movea.l    a5,a1
[0002f90a] 204d                      movea.l    a5,a0
[0002f90c] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0002f912] 4fef 000c                 lea.l      12(a7),a7
[0002f916] 7004                      moveq.l    #4,d0
[0002f918] c06f 0004                 and.w      4(a7),d0
[0002f91c] 666e                      bne.s      $0002F98C
[0002f91e] 2052                      movea.l    (a2),a0
[0002f920] 41e8 0016                 lea.l      22(a0),a0
[0002f924] 4eb9 0002 4e1a            jsr        part_get
[0002f92a] 2a48                      movea.l    a0,a5
[0002f92c] 200d                      move.l     a5,d0
[0002f92e] 675c                      beq.s      $0002F98C
[0002f930] 43eb 0008                 lea.l      8(a3),a1
[0002f934] 41ef 003a                 lea.l      58(a7),a0
[0002f938] 7018                      moveq.l    #24,d0
[0002f93a] 4eb9 0008 3500            jsr        memcpy
[0002f940] 42af 0046                 clr.l      70(a7)
[0002f944] 43ef 000c                 lea.l      12(a7),a1
[0002f948] 206f 0008                 movea.l    8(a7),a0
[0002f94c] 4eb9 0002 c95a            jsr        set_userdef
[0002f952] 43ef 003a                 lea.l      58(a7),a1
[0002f956] 41ef 000c                 lea.l      12(a7),a0
[0002f95a] 246d 0020                 movea.l    32(a5),a2
[0002f95e] 4e92                      jsr        (a2)
[0002f960] 2448                      movea.l    a0,a2
[0002f962] 200a                      move.l     a2,d0
[0002f964] 6726                      beq.s      $0002F98C
[0002f966] 2f2d 004c                 move.l     76(a5),-(a7)
[0002f96a] 2f2d 0048                 move.l     72(a5),-(a7)
[0002f96e] 42a7                      clr.l      -(a7)
[0002f970] 2f2d 002c                 move.l     44(a5),-(a7)
[0002f974] 2f2d 0028                 move.l     40(a5),-(a7)
[0002f978] 2f2d 0044                 move.l     68(a5),-(a7)
[0002f97c] 224a                      movea.l    a2,a1
[0002f97e] 206f 0018                 movea.l    24(a7),a0
[0002f982] 6100 fb04                 bsr        change_work
[0002f986] 4fef 0018                 lea.l      24(a7),a7
[0002f98a] 604a                      bra.s      $0002F9D6
[0002f98c] 204b                      movea.l    a3,a0
[0002f98e] 4eb9 0003 0ed0            jsr        set_user
[0002f994] 2848                      movea.l    a0,a4
[0002f996] 6016                      bra.s      $0002F9AE
[0002f998] 204b                      movea.l    a3,a0
[0002f99a] 4eb9 0003 1b4c            jsr        set_str
[0002f9a0] 2848                      movea.l    a0,a4
[0002f9a2] 600a                      bra.s      $0002F9AE
[0002f9a4] 204b                      movea.l    a3,a0
[0002f9a6] 4eb9 0003 1750            jsr        set_icon
[0002f9ac] 2848                      movea.l    a0,a4
[0002f9ae] 200c                      move.l     a4,d0
[0002f9b0] 6724                      beq.s      $0002F9D6
[0002f9b2] 2f2c 0014                 move.l     20(a4),-(a7)
[0002f9b6] 2f2c 0010                 move.l     16(a4),-(a7)
[0002f9ba] 42a7                      clr.l      -(a7)
[0002f9bc] 2f2c 0008                 move.l     8(a4),-(a7)
[0002f9c0] 2f2c 0004                 move.l     4(a4),-(a7)
[0002f9c4] 2f2c 000c                 move.l     12(a4),-(a7)
[0002f9c8] 2254                      movea.l    (a4),a1
[0002f9ca] 206f 0018                 movea.l    24(a7),a0
[0002f9ce] 6100 fab8                 bsr        change_work
[0002f9d2] 4fef 0018                 lea.l      24(a7),a7
[0002f9d6] 4fef 0052                 lea.l      82(a7),a7
[0002f9da] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0002f9de] 4e75                      rts
open_it:
[0002f9e0] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0002f9e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002f9ea] 2468 0258                 movea.l    600(a0),a2
[0002f9ee] 3628 0260                 move.w     608(a0),d3
[0002f9f2] 4eb9 0004 810e            jsr        Adr_unselect
[0002f9f8] 3003                      move.w     d3,d0
[0002f9fa] 204a                      movea.l    a2,a0
[0002f9fc] 4eb9 0004 7e6a            jsr        Adr_add
[0002fa02] 2652                      movea.l    (a2),a3
[0002fa04] 78fe                      moveq.l    #-2,d4
[0002fa06] d843                      add.w      d3,d4
[0002fa08] 48c4                      ext.l      d4
[0002fa0a] 89fc 0003                 divs.w     #$0003,d4
[0002fa0e] 3744 000a                 move.w     d4,10(a3)
[0002fa12] 206b 0004                 movea.l    4(a3),a0
[0002fa16] 2868 0004                 movea.l    4(a0),a4
[0002fa1a] 4bf9 000c 7eb8            lea.l      OBJ_POPUP,a5
[0002fa20] 3204                      move.w     d4,d1
[0002fa22] 48c1                      ext.l      d1
[0002fa24] 2001                      move.l     d1,d0
[0002fa26] e788                      lsl.l      #3,d0
[0002fa28] 9081                      sub.l      d1,d0
[0002fa2a] e788                      lsl.l      #3,d0
[0002fa2c] 3434 080a                 move.w     10(a4,d0.l),d2
[0002fa30] 6b08                      bmi.s      $0002FA3A
[0002fa32] 026d fff7 04d2            andi.w     #$FFF7,1234(a5)
[0002fa38] 6006                      bra.s      $0002FA40
[0002fa3a] 006d 0008 04d2            ori.w      #$0008,1234(a5)
[0002fa40] 3204                      move.w     d4,d1
[0002fa42] 48c1                      ext.l      d1
[0002fa44] 2001                      move.l     d1,d0
[0002fa46] e788                      lsl.l      #3,d0
[0002fa48] 9081                      sub.l      d1,d0
[0002fa4a] e788                      lsl.l      #3,d0
[0002fa4c] 3434 0812                 move.w     18(a4,d0.l),d2
[0002fa50] c47c 1000                 and.w      #$1000,d2
[0002fa54] 670e                      beq.s      $0002FA64
[0002fa56] 006d 0008 0502            ori.w      #$0008,1282(a5)
[0002fa5c] 026d fff7 0532            andi.w     #$FFF7,1330(a5)
[0002fa62] 600c                      bra.s      $0002FA70
[0002fa64] 026d fff7 0502            andi.w     #$FFF7,1282(a5)
[0002fa6a] 006d 0008 0532            ori.w      #$0008,1330(a5)
[0002fa70] b66b 0018                 cmp.w      24(a3),d3
[0002fa74] 661a                      bne.s      $0002FA90
[0002fa76] 006d 0008 04a2            ori.w      #$0008,1186(a5)
[0002fa7c] 006d 0008 0562            ori.w      #$0008,1378(a5)
[0002fa82] 006d 0008 0592            ori.w      #$0008,1426(a5)
[0002fa88] 006d 0008 02aa            ori.w      #$0008,682(a5)
[0002fa8e] 6018                      bra.s      $0002FAA8
[0002fa90] 026d fff7 04a2            andi.w     #$FFF7,1186(a5)
[0002fa96] 026d fff7 0562            andi.w     #$FFF7,1378(a5)
[0002fa9c] 026d fff7 0592            andi.w     #$FFF7,1426(a5)
[0002faa2] 026d fff7 02aa            andi.w     #$FFF7,682(a5)
[0002faa8] 3204                      move.w     d4,d1
[0002faaa] 48c1                      ext.l      d1
[0002faac] 2001                      move.l     d1,d0
[0002faae] e788                      lsl.l      #3,d0
[0002fab0] 9081                      sub.l      d1,d0
[0002fab2] e788                      lsl.l      #3,d0
[0002fab4] 3434 080a                 move.w     10(a4,d0.l),d2
[0002fab8] b474 080c                 cmp.w      12(a4,d0.l),d2
[0002fabc] 6708                      beq.s      $0002FAC6
[0002fabe] 026d fff7 07ba            andi.w     #$FFF7,1978(a5)
[0002fac4] 6006                      bra.s      $0002FACC
[0002fac6] 006d 0008 07ba            ori.w      #$0008,1978(a5)
[0002facc] 204d                      movea.l    a5,a0
[0002face] 4eb9 0004 fbdc            jsr        Aob_fix
[0002fad4] 206d 078c                 movea.l    1932(a5),a0
[0002fad8] 3028 0004                 move.w     4(a0),d0
[0002fadc] e748                      lsl.w      #3,d0
[0002fade] 3b40 0794                 move.w     d0,1940(a5)
[0002fae2] 3b40 0764                 move.w     d0,1892(a5)
[0002fae6] 3b40 0790                 move.w     d0,1936(a5)
[0002faea] 3228 0004                 move.w     4(a0),d1
[0002faee] e949                      lsl.w      #4,d1
[0002faf0] 3b41 074c                 move.w     d1,1868(a5)
[0002faf4] 3028 0006                 move.w     6(a0),d0
[0002faf8] 3b40 0796                 move.w     d0,1942(a5)
[0002fafc] 3b40 0766                 move.w     d0,1894(a5)
[0002fb00] 3b40 074e                 move.w     d0,1870(a5)
[0002fb04] 4eb9 0005 0c80            jsr        Aev_release
[0002fb0a] 72ff                      moveq.l    #-1,d1
[0002fb0c] 70ff                      moveq.l    #-1,d0
[0002fb0e] 224d                      movea.l    a5,a1
[0002fb10] 204a                      movea.l    a2,a0
[0002fb12] 4eb9 0004 e84a            jsr        Ame_popup
[0002fb18] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0002fb1c] 4e75                      rts
find_papa:
[0002fb1e] 48e7 1820                 movem.l    d3-d4/a2,-(a7)
[0002fb22] 2448                      movea.l    a0,a2
[0002fb24] 3600                      move.w     d0,d3
[0002fb26] 3203                      move.w     d3,d1
[0002fb28] 48c1                      ext.l      d1
[0002fb2a] 2001                      move.l     d1,d0
[0002fb2c] e788                      lsl.l      #3,d0
[0002fb2e] 9081                      sub.l      d1,d0
[0002fb30] e788                      lsl.l      #3,d0
[0002fb32] 3832 0808                 move.w     8(a2,d0.l),d4
[0002fb36] 4a44                      tst.w      d4
[0002fb38] 6a04                      bpl.s      $0002FB3E
[0002fb3a] 70ff                      moveq.l    #-1,d0
[0002fb3c] 601a                      bra.s      $0002FB58
[0002fb3e] 3204                      move.w     d4,d1
[0002fb40] 48c1                      ext.l      d1
[0002fb42] 2001                      move.l     d1,d0
[0002fb44] e788                      lsl.l      #3,d0
[0002fb46] 9081                      sub.l      d1,d0
[0002fb48] e788                      lsl.l      #3,d0
[0002fb4a] b672 080c                 cmp.w      12(a2,d0.l),d3
[0002fb4e] 6604                      bne.s      $0002FB54
[0002fb50] 3004                      move.w     d4,d0
[0002fb52] 6004                      bra.s      $0002FB58
[0002fb54] 3604                      move.w     d4,d3
[0002fb56] 60ce                      bra.s      $0002FB26
[0002fb58] 4cdf 0418                 movem.l    (a7)+,d3-d4/a2
[0002fb5c] 4e75                      rts
edob_left:
[0002fb5e] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[0002fb62] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002fb68] 2468 0258                 movea.l    600(a0),a2
[0002fb6c] 2052                      movea.l    (a2),a0
[0002fb6e] 2250                      movea.l    (a0),a1
[0002fb70] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002fb76] 3628 000a                 move.w     10(a0),d3
[0002fb7a] 2268 0004                 movea.l    4(a0),a1
[0002fb7e] 2669 0004                 movea.l    4(a1),a3
[0002fb82] 3203                      move.w     d3,d1
[0002fb84] 48c1                      ext.l      d1
[0002fb86] 2001                      move.l     d1,d0
[0002fb88] e788                      lsl.l      #3,d0
[0002fb8a] 9081                      sub.l      d1,d0
[0002fb8c] e788                      lsl.l      #3,d0
[0002fb8e] 4273 0818                 clr.w      24(a3,d0.l)
[0002fb92] 266a 0014                 movea.l    20(a2),a3
[0002fb96] 3403                      move.w     d3,d2
[0002fb98] d442                      add.w      d2,d2
[0002fb9a] d443                      add.w      d3,d2
[0002fb9c] 5442                      addq.w     #2,d2
[0002fb9e] 3602                      move.w     d2,d3
[0002fba0] 3003                      move.w     d3,d0
[0002fba2] 204b                      movea.l    a3,a0
[0002fba4] 4eb9 0005 0f3a            jsr        Aob_up
[0002fbaa] 3800                      move.w     d0,d4
[0002fbac] 4241                      clr.w      d1
[0002fbae] 3003                      move.w     d3,d0
[0002fbb0] 48c0                      ext.l      d0
[0002fbb2] 2400                      move.l     d0,d2
[0002fbb4] d482                      add.l      d2,d2
[0002fbb6] d480                      add.l      d0,d2
[0002fbb8] e78a                      lsl.l      #3,d2
[0002fbba] 3781 2810                 move.w     d1,16(a3,d2.l)
[0002fbbe] 3781 28f8                 move.w     d1,-8(a3,d2.l)
[0002fbc2] 4eb9 0004 810e            jsr        Adr_unselect
[0002fbc8] 3004                      move.w     d4,d0
[0002fbca] 204a                      movea.l    a2,a0
[0002fbcc] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002fbd2] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[0002fbd6] 4e75                      rts
edob_right:
[0002fbd8] 48e7 1e38                 movem.l    d3-d6/a2-a4,-(a7)
[0002fbdc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002fbe2] 2468 0258                 movea.l    600(a0),a2
[0002fbe6] 2652                      movea.l    (a2),a3
[0002fbe8] 2253                      movea.l    (a3),a1
[0002fbea] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002fbf0] 362b 000a                 move.w     10(a3),d3
[0002fbf4] 286a 0014                 movea.l    20(a2),a4
[0002fbf8] 3803                      move.w     d3,d4
[0002fbfa] d844                      add.w      d4,d4
[0002fbfc] d843                      add.w      d3,d4
[0002fbfe] 5444                      addq.w     #2,d4
[0002fc00] 3004                      move.w     d4,d0
[0002fc02] 204c                      movea.l    a4,a0
[0002fc04] 4eb9 0005 0f3a            jsr        Aob_up
[0002fc0a] 3a00                      move.w     d0,d5
[0002fc0c] 48c0                      ext.l      d0
[0002fc0e] 2200                      move.l     d0,d1
[0002fc10] d281                      add.l      d1,d1
[0002fc12] d280                      add.l      d0,d1
[0002fc14] e789                      lsl.l      #3,d1
[0002fc16] 3034 1814                 move.w     20(a4,d1.l),d0
[0002fc1a] 3204                      move.w     d4,d1
[0002fc1c] 48c1                      ext.l      d1
[0002fc1e] 2401                      move.l     d1,d2
[0002fc20] d482                      add.l      d2,d2
[0002fc22] d481                      add.l      d1,d2
[0002fc24] e78a                      lsl.l      #3,d2
[0002fc26] 9074 2814                 sub.w      20(a4,d2.l),d0
[0002fc2a] 4eb9 0002 d888            jsr        char_x
[0002fc30] 3c00                      move.w     d0,d6
[0002fc32] 4eb9 0002 d91c            jsr        pixel_x
[0002fc38] 3404                      move.w     d4,d2
[0002fc3a] 48c2                      ext.l      d2
[0002fc3c] 2202                      move.l     d2,d1
[0002fc3e] d281                      add.l      d1,d1
[0002fc40] d282                      add.l      d2,d1
[0002fc42] e789                      lsl.l      #3,d1
[0002fc44] 3980 1810                 move.w     d0,16(a4,d1.l)
[0002fc48] 3980 18f8                 move.w     d0,-8(a4,d1.l)
[0002fc4c] 4eb9 0004 810e            jsr        Adr_unselect
[0002fc52] 3005                      move.w     d5,d0
[0002fc54] 204a                      movea.l    a2,a0
[0002fc56] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002fc5c] 206b 0004                 movea.l    4(a3),a0
[0002fc60] 2868 0004                 movea.l    4(a0),a4
[0002fc64] 3203                      move.w     d3,d1
[0002fc66] 48c1                      ext.l      d1
[0002fc68] 2001                      move.l     d1,d0
[0002fc6a] e788                      lsl.l      #3,d0
[0002fc6c] 9081                      sub.l      d1,d0
[0002fc6e] e788                      lsl.l      #3,d0
[0002fc70] 3986 0818                 move.w     d6,24(a4,d0.l)
[0002fc74] 4cdf 1c78                 movem.l    (a7)+,d3-d6/a2-a4
[0002fc78] 4e75                      rts
edob_center:
[0002fc7a] 48e7 1e38                 movem.l    d3-d6/a2-a4,-(a7)
[0002fc7e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002fc84] 2468 0258                 movea.l    600(a0),a2
[0002fc88] 2652                      movea.l    (a2),a3
[0002fc8a] 2253                      movea.l    (a3),a1
[0002fc8c] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002fc92] 362b 000a                 move.w     10(a3),d3
[0002fc96] 3803                      move.w     d3,d4
[0002fc98] d844                      add.w      d4,d4
[0002fc9a] d843                      add.w      d3,d4
[0002fc9c] 5444                      addq.w     #2,d4
[0002fc9e] 286a 0014                 movea.l    20(a2),a4
[0002fca2] 3004                      move.w     d4,d0
[0002fca4] 204c                      movea.l    a4,a0
[0002fca6] 4eb9 0005 0f3a            jsr        Aob_up
[0002fcac] 3a00                      move.w     d0,d5
[0002fcae] 48c0                      ext.l      d0
[0002fcb0] 2200                      move.l     d0,d1
[0002fcb2] d281                      add.l      d1,d1
[0002fcb4] d280                      add.l      d0,d1
[0002fcb6] e789                      lsl.l      #3,d1
[0002fcb8] 3034 1814                 move.w     20(a4,d1.l),d0
[0002fcbc] 3204                      move.w     d4,d1
[0002fcbe] 48c1                      ext.l      d1
[0002fcc0] 2401                      move.l     d1,d2
[0002fcc2] d482                      add.l      d2,d2
[0002fcc4] d481                      add.l      d1,d2
[0002fcc6] e78a                      lsl.l      #3,d2
[0002fcc8] 9074 2814                 sub.w      20(a4,d2.l),d0
[0002fccc] e240                      asr.w      #1,d0
[0002fcce] 4eb9 0002 d888            jsr        char_x
[0002fcd4] 3c00                      move.w     d0,d6
[0002fcd6] 4eb9 0002 d91c            jsr        pixel_x
[0002fcdc] 3404                      move.w     d4,d2
[0002fcde] 48c2                      ext.l      d2
[0002fce0] 2202                      move.l     d2,d1
[0002fce2] d281                      add.l      d1,d1
[0002fce4] d282                      add.l      d2,d1
[0002fce6] e789                      lsl.l      #3,d1
[0002fce8] 3980 1810                 move.w     d0,16(a4,d1.l)
[0002fcec] 3980 18f8                 move.w     d0,-8(a4,d1.l)
[0002fcf0] 4eb9 0004 810e            jsr        Adr_unselect
[0002fcf6] 3005                      move.w     d5,d0
[0002fcf8] 204a                      movea.l    a2,a0
[0002fcfa] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002fd00] 206b 0004                 movea.l    4(a3),a0
[0002fd04] 2868 0004                 movea.l    4(a0),a4
[0002fd08] 3203                      move.w     d3,d1
[0002fd0a] 48c1                      ext.l      d1
[0002fd0c] 2001                      move.l     d1,d0
[0002fd0e] e788                      lsl.l      #3,d0
[0002fd10] 9081                      sub.l      d1,d0
[0002fd12] e788                      lsl.l      #3,d0
[0002fd14] 3986 0818                 move.w     d6,24(a4,d0.l)
[0002fd18] 4cdf 1c78                 movem.l    (a7)+,d3-d6/a2-a4
[0002fd1c] 4e75                      rts
edob_horfill:
[0002fd1e] 48e7 1e38                 movem.l    d3-d6/a2-a4,-(a7)
[0002fd22] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002fd28] 2468 0258                 movea.l    600(a0),a2
[0002fd2c] 2052                      movea.l    (a2),a0
[0002fd2e] 2250                      movea.l    (a0),a1
[0002fd30] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002fd36] 3628 000a                 move.w     10(a0),d3
[0002fd3a] 3803                      move.w     d3,d4
[0002fd3c] d844                      add.w      d4,d4
[0002fd3e] d843                      add.w      d3,d4
[0002fd40] 5444                      addq.w     #2,d4
[0002fd42] 266a 0014                 movea.l    20(a2),a3
[0002fd46] 2268 0004                 movea.l    4(a0),a1
[0002fd4a] 2869 0004                 movea.l    4(a1),a4
[0002fd4e] 3004                      move.w     d4,d0
[0002fd50] 204b                      movea.l    a3,a0
[0002fd52] 4eb9 0005 0f3a            jsr        Aob_up
[0002fd58] 3a00                      move.w     d0,d5
[0002fd5a] 48c0                      ext.l      d0
[0002fd5c] 2200                      move.l     d0,d1
[0002fd5e] d281                      add.l      d1,d1
[0002fd60] d280                      add.l      d0,d1
[0002fd62] e789                      lsl.l      #3,d1
[0002fd64] 3c33 1814                 move.w     20(a3,d1.l),d6
[0002fd68] 3204                      move.w     d4,d1
[0002fd6a] 48c1                      ext.l      d1
[0002fd6c] 2401                      move.l     d1,d2
[0002fd6e] d482                      add.l      d2,d2
[0002fd70] d481                      add.l      d1,d2
[0002fd72] e78a                      lsl.l      #3,d2
[0002fd74] 9c73 2814                 sub.w      20(a3,d2.l),d6
[0002fd78] 224b                      movea.l    a3,a1
[0002fd7a] 204c                      movea.l    a4,a0
[0002fd7c] 3003                      move.w     d3,d0
[0002fd7e] 3206                      move.w     d6,d1
[0002fd80] 4242                      clr.w      d2
[0002fd82] 4eb9 0002 d834            jsr        resize_ob
[0002fd88] 4240                      clr.w      d0
[0002fd8a] 3404                      move.w     d4,d2
[0002fd8c] 48c2                      ext.l      d2
[0002fd8e] 2202                      move.l     d2,d1
[0002fd90] d281                      add.l      d1,d1
[0002fd92] d282                      add.l      d2,d1
[0002fd94] e789                      lsl.l      #3,d1
[0002fd96] 3780 1810                 move.w     d0,16(a3,d1.l)
[0002fd9a] 3780 18f8                 move.w     d0,-8(a3,d1.l)
[0002fd9e] 3005                      move.w     d5,d0
[0002fda0] 48c0                      ext.l      d0
[0002fda2] 2c00                      move.l     d0,d6
[0002fda4] dc86                      add.l      d6,d6
[0002fda6] dc80                      add.l      d0,d6
[0002fda8] e78e                      lsl.l      #3,d6
[0002fdaa] 3433 6814                 move.w     20(a3,d6.l),d2
[0002fdae] 3782 1814                 move.w     d2,20(a3,d1.l)
[0002fdb2] 3782 18fc                 move.w     d2,-4(a3,d1.l)
[0002fdb6] 4eb9 0004 810e            jsr        Adr_unselect
[0002fdbc] 3004                      move.w     d4,d0
[0002fdbe] 204a                      movea.l    a2,a0
[0002fdc0] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002fdc6] 70fe                      moveq.l    #-2,d0
[0002fdc8] d045                      add.w      d5,d0
[0002fdca] 48c0                      ext.l      d0
[0002fdcc] 81fc 0003                 divs.w     #$0003,d0
[0002fdd0] 3a00                      move.w     d0,d5
[0002fdd2] 3403                      move.w     d3,d2
[0002fdd4] 48c2                      ext.l      d2
[0002fdd6] 2202                      move.l     d2,d1
[0002fdd8] e789                      lsl.l      #3,d1
[0002fdda] 9282                      sub.l      d2,d1
[0002fddc] e789                      lsl.l      #3,d1
[0002fdde] 4274 1818                 clr.w      24(a4,d1.l)
[0002fde2] 48c0                      ext.l      d0
[0002fde4] 2800                      move.l     d0,d4
[0002fde6] e78c                      lsl.l      #3,d4
[0002fde8] 9880                      sub.l      d0,d4
[0002fdea] e78c                      lsl.l      #3,d4
[0002fdec] 39b4 481c 181c            move.w     28(a4,d4.l),28(a4,d1.l)
[0002fdf2] 4cdf 1c78                 movem.l    (a7)+,d3-d6/a2-a4
[0002fdf6] 4e75                      rts
edob_top:
[0002fdf8] 48e7 1c38                 movem.l    d3-d5/a2-a4,-(a7)
[0002fdfc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002fe02] 2468 0258                 movea.l    600(a0),a2
[0002fe06] 2652                      movea.l    (a2),a3
[0002fe08] 2253                      movea.l    (a3),a1
[0002fe0a] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002fe10] 362b 000a                 move.w     10(a3),d3
[0002fe14] 3803                      move.w     d3,d4
[0002fe16] d844                      add.w      d4,d4
[0002fe18] d843                      add.w      d3,d4
[0002fe1a] 5444                      addq.w     #2,d4
[0002fe1c] 286a 0014                 movea.l    20(a2),a4
[0002fe20] 3004                      move.w     d4,d0
[0002fe22] 204c                      movea.l    a4,a0
[0002fe24] 4eb9 0005 0f3a            jsr        Aob_up
[0002fe2a] 3a00                      move.w     d0,d5
[0002fe2c] 4241                      clr.w      d1
[0002fe2e] 3004                      move.w     d4,d0
[0002fe30] 48c0                      ext.l      d0
[0002fe32] 2400                      move.l     d0,d2
[0002fe34] d482                      add.l      d2,d2
[0002fe36] d480                      add.l      d0,d2
[0002fe38] e78a                      lsl.l      #3,d2
[0002fe3a] 3981 2812                 move.w     d1,18(a4,d2.l)
[0002fe3e] 3981 28fa                 move.w     d1,-6(a4,d2.l)
[0002fe42] 206b 0004                 movea.l    4(a3),a0
[0002fe46] 2868 0004                 movea.l    4(a0),a4
[0002fe4a] 3803                      move.w     d3,d4
[0002fe4c] 48c4                      ext.l      d4
[0002fe4e] 2204                      move.l     d4,d1
[0002fe50] e789                      lsl.l      #3,d1
[0002fe52] 9284                      sub.l      d4,d1
[0002fe54] e789                      lsl.l      #3,d1
[0002fe56] 4274 181a                 clr.w      26(a4,d1.l)
[0002fe5a] 4eb9 0004 810e            jsr        Adr_unselect
[0002fe60] 3005                      move.w     d5,d0
[0002fe62] 204a                      movea.l    a2,a0
[0002fe64] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002fe6a] 4cdf 1c38                 movem.l    (a7)+,d3-d5/a2-a4
[0002fe6e] 4e75                      rts
edob_bottom:
[0002fe70] 48e7 1e38                 movem.l    d3-d6/a2-a4,-(a7)
[0002fe74] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002fe7a] 2468 0258                 movea.l    600(a0),a2
[0002fe7e] 2652                      movea.l    (a2),a3
[0002fe80] 2253                      movea.l    (a3),a1
[0002fe82] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002fe88] 362b 000a                 move.w     10(a3),d3
[0002fe8c] 3803                      move.w     d3,d4
[0002fe8e] d844                      add.w      d4,d4
[0002fe90] d843                      add.w      d3,d4
[0002fe92] 5444                      addq.w     #2,d4
[0002fe94] 286a 0014                 movea.l    20(a2),a4
[0002fe98] 3004                      move.w     d4,d0
[0002fe9a] 204c                      movea.l    a4,a0
[0002fe9c] 4eb9 0005 0f3a            jsr        Aob_up
[0002fea2] 3a00                      move.w     d0,d5
[0002fea4] 48c0                      ext.l      d0
[0002fea6] 2200                      move.l     d0,d1
[0002fea8] d281                      add.l      d1,d1
[0002feaa] d280                      add.l      d0,d1
[0002feac] e789                      lsl.l      #3,d1
[0002feae] 3034 1816                 move.w     22(a4,d1.l),d0
[0002feb2] 3204                      move.w     d4,d1
[0002feb4] 48c1                      ext.l      d1
[0002feb6] 2401                      move.l     d1,d2
[0002feb8] d482                      add.l      d2,d2
[0002feba] d481                      add.l      d1,d2
[0002febc] e78a                      lsl.l      #3,d2
[0002febe] 9074 2816                 sub.w      22(a4,d2.l),d0
[0002fec2] 4eb9 0002 d8d2            jsr        char_y
[0002fec8] 3c00                      move.w     d0,d6
[0002feca] 4eb9 0002 d944            jsr        pixel_y
[0002fed0] 3404                      move.w     d4,d2
[0002fed2] 48c2                      ext.l      d2
[0002fed4] 2202                      move.l     d2,d1
[0002fed6] d281                      add.l      d1,d1
[0002fed8] d282                      add.l      d2,d1
[0002feda] e789                      lsl.l      #3,d1
[0002fedc] 3980 1812                 move.w     d0,18(a4,d1.l)
[0002fee0] 3980 18fa                 move.w     d0,-6(a4,d1.l)
[0002fee4] 4eb9 0004 810e            jsr        Adr_unselect
[0002feea] 3005                      move.w     d5,d0
[0002feec] 204a                      movea.l    a2,a0
[0002feee] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002fef4] 206b 0004                 movea.l    4(a3),a0
[0002fef8] 2868 0004                 movea.l    4(a0),a4
[0002fefc] 3203                      move.w     d3,d1
[0002fefe] 48c1                      ext.l      d1
[0002ff00] 2001                      move.l     d1,d0
[0002ff02] e788                      lsl.l      #3,d0
[0002ff04] 9081                      sub.l      d1,d0
[0002ff06] e788                      lsl.l      #3,d0
[0002ff08] 3986 081a                 move.w     d6,26(a4,d0.l)
[0002ff0c] 4cdf 1c78                 movem.l    (a7)+,d3-d6/a2-a4
[0002ff10] 4e75                      rts
edob_mid:
[0002ff12] 48e7 1e38                 movem.l    d3-d6/a2-a4,-(a7)
[0002ff16] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ff1c] 2468 0258                 movea.l    600(a0),a2
[0002ff20] 2652                      movea.l    (a2),a3
[0002ff22] 2253                      movea.l    (a3),a1
[0002ff24] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002ff2a] 362b 000a                 move.w     10(a3),d3
[0002ff2e] 3803                      move.w     d3,d4
[0002ff30] d844                      add.w      d4,d4
[0002ff32] d843                      add.w      d3,d4
[0002ff34] 5444                      addq.w     #2,d4
[0002ff36] 286a 0014                 movea.l    20(a2),a4
[0002ff3a] 3004                      move.w     d4,d0
[0002ff3c] 204c                      movea.l    a4,a0
[0002ff3e] 4eb9 0005 0f3a            jsr        Aob_up
[0002ff44] 3a00                      move.w     d0,d5
[0002ff46] 48c0                      ext.l      d0
[0002ff48] 2200                      move.l     d0,d1
[0002ff4a] d281                      add.l      d1,d1
[0002ff4c] d280                      add.l      d0,d1
[0002ff4e] e789                      lsl.l      #3,d1
[0002ff50] 3034 1816                 move.w     22(a4,d1.l),d0
[0002ff54] 3204                      move.w     d4,d1
[0002ff56] 48c1                      ext.l      d1
[0002ff58] 2401                      move.l     d1,d2
[0002ff5a] d482                      add.l      d2,d2
[0002ff5c] d481                      add.l      d1,d2
[0002ff5e] e78a                      lsl.l      #3,d2
[0002ff60] 9074 2816                 sub.w      22(a4,d2.l),d0
[0002ff64] e240                      asr.w      #1,d0
[0002ff66] 4eb9 0002 d8d2            jsr        char_y
[0002ff6c] 3c00                      move.w     d0,d6
[0002ff6e] 4eb9 0002 d944            jsr        pixel_y
[0002ff74] 3404                      move.w     d4,d2
[0002ff76] 48c2                      ext.l      d2
[0002ff78] 2202                      move.l     d2,d1
[0002ff7a] d281                      add.l      d1,d1
[0002ff7c] d282                      add.l      d2,d1
[0002ff7e] e789                      lsl.l      #3,d1
[0002ff80] 3980 1812                 move.w     d0,18(a4,d1.l)
[0002ff84] 3980 18fa                 move.w     d0,-6(a4,d1.l)
[0002ff88] 4eb9 0004 810e            jsr        Adr_unselect
[0002ff8e] 3005                      move.w     d5,d0
[0002ff90] 204a                      movea.l    a2,a0
[0002ff92] 4eb9 0005 1b80            jsr        Awi_obredraw
[0002ff98] 206b 0004                 movea.l    4(a3),a0
[0002ff9c] 2868 0004                 movea.l    4(a0),a4
[0002ffa0] 3203                      move.w     d3,d1
[0002ffa2] 48c1                      ext.l      d1
[0002ffa4] 2001                      move.l     d1,d0
[0002ffa6] e788                      lsl.l      #3,d0
[0002ffa8] 9081                      sub.l      d1,d0
[0002ffaa] e788                      lsl.l      #3,d0
[0002ffac] 3986 081a                 move.w     d6,26(a4,d0.l)
[0002ffb0] 4cdf 1c78                 movem.l    (a7)+,d3-d6/a2-a4
[0002ffb4] 4e75                      rts
edob_verfill:
[0002ffb6] 48e7 1e38                 movem.l    d3-d6/a2-a4,-(a7)
[0002ffba] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002ffc0] 2468 0258                 movea.l    600(a0),a2
[0002ffc4] 2052                      movea.l    (a2),a0
[0002ffc6] 2250                      movea.l    (a0),a1
[0002ffc8] 0069 0001 0006            ori.w      #$0001,6(a1)
[0002ffce] 3628 000a                 move.w     10(a0),d3
[0002ffd2] 3803                      move.w     d3,d4
[0002ffd4] d844                      add.w      d4,d4
[0002ffd6] d843                      add.w      d3,d4
[0002ffd8] 5444                      addq.w     #2,d4
[0002ffda] 266a 0014                 movea.l    20(a2),a3
[0002ffde] 2268 0004                 movea.l    4(a0),a1
[0002ffe2] 2869 0004                 movea.l    4(a1),a4
[0002ffe6] 3004                      move.w     d4,d0
[0002ffe8] 204b                      movea.l    a3,a0
[0002ffea] 4eb9 0005 0f3a            jsr        Aob_up
[0002fff0] 3a00                      move.w     d0,d5
[0002fff2] 48c0                      ext.l      d0
[0002fff4] 2200                      move.l     d0,d1
[0002fff6] d281                      add.l      d1,d1
[0002fff8] d280                      add.l      d0,d1
[0002fffa] e789                      lsl.l      #3,d1
[0002fffc] 3c33 1816                 move.w     22(a3,d1.l),d6
[00030000] 3204                      move.w     d4,d1
[00030002] 48c1                      ext.l      d1
[00030004] 2401                      move.l     d1,d2
[00030006] d482                      add.l      d2,d2
[00030008] d481                      add.l      d1,d2
[0003000a] e78a                      lsl.l      #3,d2
[0003000c] 9c73 2816                 sub.w      22(a3,d2.l),d6
[00030010] 224b                      movea.l    a3,a1
[00030012] 204c                      movea.l    a4,a0
[00030014] 3003                      move.w     d3,d0
[00030016] 4241                      clr.w      d1
[00030018] 3406                      move.w     d6,d2
[0003001a] 4eb9 0002 d834            jsr        resize_ob
[00030020] 4240                      clr.w      d0
[00030022] 3404                      move.w     d4,d2
[00030024] 48c2                      ext.l      d2
[00030026] 2202                      move.l     d2,d1
[00030028] d281                      add.l      d1,d1
[0003002a] d282                      add.l      d2,d1
[0003002c] e789                      lsl.l      #3,d1
[0003002e] 3780 1812                 move.w     d0,18(a3,d1.l)
[00030032] 3780 18fa                 move.w     d0,-6(a3,d1.l)
[00030036] 3005                      move.w     d5,d0
[00030038] 48c0                      ext.l      d0
[0003003a] 2c00                      move.l     d0,d6
[0003003c] dc86                      add.l      d6,d6
[0003003e] dc80                      add.l      d0,d6
[00030040] e78e                      lsl.l      #3,d6
[00030042] 3433 6816                 move.w     22(a3,d6.l),d2
[00030046] 3782 1816                 move.w     d2,22(a3,d1.l)
[0003004a] 3782 18fe                 move.w     d2,-2(a3,d1.l)
[0003004e] 4eb9 0004 810e            jsr        Adr_unselect
[00030054] 3004                      move.w     d4,d0
[00030056] 204a                      movea.l    a2,a0
[00030058] 4eb9 0005 1b80            jsr        Awi_obredraw
[0003005e] 70fe                      moveq.l    #-2,d0
[00030060] d045                      add.w      d5,d0
[00030062] 48c0                      ext.l      d0
[00030064] 81fc 0003                 divs.w     #$0003,d0
[00030068] 3a00                      move.w     d0,d5
[0003006a] 3403                      move.w     d3,d2
[0003006c] 48c2                      ext.l      d2
[0003006e] 2202                      move.l     d2,d1
[00030070] e789                      lsl.l      #3,d1
[00030072] 9282                      sub.l      d2,d1
[00030074] e789                      lsl.l      #3,d1
[00030076] 4274 181a                 clr.w      26(a4,d1.l)
[0003007a] 48c0                      ext.l      d0
[0003007c] 2800                      move.l     d0,d4
[0003007e] e78c                      lsl.l      #3,d4
[00030080] 9880                      sub.l      d0,d4
[00030082] e78c                      lsl.l      #3,d4
[00030084] 39b4 481e 181e            move.w     30(a4,d4.l),30(a4,d1.l)
[0003008a] 4cdf 1c78                 movem.l    (a7)+,d3-d6/a2-a4
[0003008e] 4e75                      rts
edob_up:
[00030090] 48e7 1f38                 movem.l    d3-d7/a2-a4,-(a7)
[00030094] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003009a] 2468 0258                 movea.l    600(a0),a2
[0003009e] 2652                      movea.l    (a2),a3
[000300a0] 362b 000a                 move.w     10(a3),d3
[000300a4] 226b 0004                 movea.l    4(a3),a1
[000300a8] 2869 0004                 movea.l    4(a1),a4
[000300ac] 3003                      move.w     d3,d0
[000300ae] 204c                      movea.l    a4,a0
[000300b0] 6100 fa6c                 bsr        find_papa
[000300b4] 3800                      move.w     d0,d4
[000300b6] 48c0                      ext.l      d0
[000300b8] 2200                      move.l     d0,d1
[000300ba] e789                      lsl.l      #3,d1
[000300bc] 9280                      sub.l      d0,d1
[000300be] e789                      lsl.l      #3,d1
[000300c0] 3a34 180c                 move.w     12(a4,d1.l),d5
[000300c4] b645                      cmp.w      d5,d3
[000300c6] 6700 00a4                 beq        $0003016C
[000300ca] 2053                      movea.l    (a3),a0
[000300cc] 0068 0001 0006            ori.w      #$0001,6(a0)
[000300d2] 3c34 180a                 move.w     10(a4,d1.l),d6
[000300d6] b646                      cmp.w      d6,d3
[000300d8] 6614                      bne.s      $000300EE
[000300da] 3003                      move.w     d3,d0
[000300dc] 48c0                      ext.l      d0
[000300de] 2400                      move.l     d0,d2
[000300e0] e78a                      lsl.l      #3,d2
[000300e2] 9480                      sub.l      d0,d2
[000300e4] e78a                      lsl.l      #3,d2
[000300e6] 39b4 2808 180a            move.w     8(a4,d2.l),10(a4,d1.l)
[000300ec] 6034                      bra.s      $00030122
[000300ee] 3e06                      move.w     d6,d7
[000300f0] 3206                      move.w     d6,d1
[000300f2] 48c1                      ext.l      d1
[000300f4] 2001                      move.l     d1,d0
[000300f6] e788                      lsl.l      #3,d0
[000300f8] 9081                      sub.l      d1,d0
[000300fa] e788                      lsl.l      #3,d0
[000300fc] 3c34 0808                 move.w     8(a4,d0.l),d6
[00030100] b646                      cmp.w      d6,d3
[00030102] 66ea                      bne.s      $000300EE
[00030104] 3203                      move.w     d3,d1
[00030106] 48c1                      ext.l      d1
[00030108] 2001                      move.l     d1,d0
[0003010a] e788                      lsl.l      #3,d0
[0003010c] 9081                      sub.l      d1,d0
[0003010e] e788                      lsl.l      #3,d0
[00030110] 3c07                      move.w     d7,d6
[00030112] 48c6                      ext.l      d6
[00030114] 2406                      move.l     d6,d2
[00030116] e78a                      lsl.l      #3,d2
[00030118] 9486                      sub.l      d6,d2
[0003011a] e78a                      lsl.l      #3,d2
[0003011c] 39b4 0808 2808            move.w     8(a4,d0.l),8(a4,d2.l)
[00030122] 3205                      move.w     d5,d1
[00030124] 48c1                      ext.l      d1
[00030126] 2001                      move.l     d1,d0
[00030128] e788                      lsl.l      #3,d0
[0003012a] 9081                      sub.l      d1,d0
[0003012c] e788                      lsl.l      #3,d0
[0003012e] 3983 0808                 move.w     d3,8(a4,d0.l)
[00030132] 3a03                      move.w     d3,d5
[00030134] 48c5                      ext.l      d5
[00030136] 2405                      move.l     d5,d2
[00030138] e78a                      lsl.l      #3,d2
[0003013a] 9485                      sub.l      d5,d2
[0003013c] e78a                      lsl.l      #3,d2
[0003013e] 3984 2808                 move.w     d4,8(a4,d2.l)
[00030142] 3e04                      move.w     d4,d7
[00030144] 48c7                      ext.l      d7
[00030146] 2c07                      move.l     d7,d6
[00030148] e78e                      lsl.l      #3,d6
[0003014a] 9c87                      sub.l      d7,d6
[0003014c] e78e                      lsl.l      #3,d6
[0003014e] 3983 680c                 move.w     d3,12(a4,d6.l)
[00030152] 204a                      movea.l    a2,a0
[00030154] 226a 0010                 movea.l    16(a2),a1
[00030158] 4e91                      jsr        (a1)
[0003015a] 3e04                      move.w     d4,d7
[0003015c] de47                      add.w      d7,d7
[0003015e] de44                      add.w      d4,d7
[00030160] 5447                      addq.w     #2,d7
[00030162] 3007                      move.w     d7,d0
[00030164] 204a                      movea.l    a2,a0
[00030166] 4eb9 0005 1b80            jsr        Awi_obredraw
[0003016c] 4cdf 1cf8                 movem.l    (a7)+,d3-d7/a2-a4
[00030170] 4e75                      rts
edob_down:
[00030172] 48e7 1f30                 movem.l    d3-d7/a2-a3,-(a7)
[00030176] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003017c] 2468 0258                 movea.l    600(a0),a2
[00030180] 2052                      movea.l    (a2),a0
[00030182] 2250                      movea.l    (a0),a1
[00030184] 0069 0001 0006            ori.w      #$0001,6(a1)
[0003018a] 3628 000a                 move.w     10(a0),d3
[0003018e] 2268 0004                 movea.l    4(a0),a1
[00030192] 2669 0004                 movea.l    4(a1),a3
[00030196] 3003                      move.w     d3,d0
[00030198] 204b                      movea.l    a3,a0
[0003019a] 6100 f982                 bsr        find_papa
[0003019e] 3800                      move.w     d0,d4
[000301a0] 48c0                      ext.l      d0
[000301a2] 2200                      move.l     d0,d1
[000301a4] e789                      lsl.l      #3,d1
[000301a6] 9280                      sub.l      d0,d1
[000301a8] e789                      lsl.l      #3,d1
[000301aa] 3a33 180a                 move.w     10(a3,d1.l),d5
[000301ae] b645                      cmp.w      d5,d3
[000301b0] 6700 008e                 beq        $00030240
[000301b4] 3c05                      move.w     d5,d6
[000301b6] 3e06                      move.w     d6,d7
[000301b8] 3207                      move.w     d7,d1
[000301ba] 48c1                      ext.l      d1
[000301bc] 2001                      move.l     d1,d0
[000301be] e788                      lsl.l      #3,d0
[000301c0] 9081                      sub.l      d1,d0
[000301c2] e788                      lsl.l      #3,d0
[000301c4] 3c33 0808                 move.w     8(a3,d0.l),d6
[000301c8] b646                      cmp.w      d6,d3
[000301ca] 66ea                      bne.s      $000301B6
[000301cc] 3c04                      move.w     d4,d6
[000301ce] 48c6                      ext.l      d6
[000301d0] 2406                      move.l     d6,d2
[000301d2] e78a                      lsl.l      #3,d2
[000301d4] 9486                      sub.l      d6,d2
[000301d6] e78a                      lsl.l      #3,d2
[000301d8] b673 280c                 cmp.w      12(a3,d2.l),d3
[000301dc] 660a                      bne.s      $000301E8
[000301de] 3787 280c                 move.w     d7,12(a3,d2.l)
[000301e2] 3784 0808                 move.w     d4,8(a3,d0.l)
[000301e6] 601e                      bra.s      $00030206
[000301e8] 3203                      move.w     d3,d1
[000301ea] 48c1                      ext.l      d1
[000301ec] 2001                      move.l     d1,d0
[000301ee] e788                      lsl.l      #3,d0
[000301f0] 9081                      sub.l      d1,d0
[000301f2] e788                      lsl.l      #3,d0
[000301f4] 3c07                      move.w     d7,d6
[000301f6] 48c6                      ext.l      d6
[000301f8] 2406                      move.l     d6,d2
[000301fa] e78a                      lsl.l      #3,d2
[000301fc] 9486                      sub.l      d6,d2
[000301fe] e78a                      lsl.l      #3,d2
[00030200] 37b3 0808 2808            move.w     8(a3,d0.l),8(a3,d2.l)
[00030206] 3203                      move.w     d3,d1
[00030208] 48c1                      ext.l      d1
[0003020a] 2001                      move.l     d1,d0
[0003020c] e788                      lsl.l      #3,d0
[0003020e] 9081                      sub.l      d1,d0
[00030210] e788                      lsl.l      #3,d0
[00030212] 3785 0808                 move.w     d5,8(a3,d0.l)
[00030216] 3c04                      move.w     d4,d6
[00030218] 48c6                      ext.l      d6
[0003021a] 2406                      move.l     d6,d2
[0003021c] e78a                      lsl.l      #3,d2
[0003021e] 9486                      sub.l      d6,d2
[00030220] e78a                      lsl.l      #3,d2
[00030222] 3783 280a                 move.w     d3,10(a3,d2.l)
[00030226] 204a                      movea.l    a2,a0
[00030228] 226a 0010                 movea.l    16(a2),a1
[0003022c] 4e91                      jsr        (a1)
[0003022e] 3e04                      move.w     d4,d7
[00030230] de47                      add.w      d7,d7
[00030232] de44                      add.w      d4,d7
[00030234] 5447                      addq.w     #2,d7
[00030236] 3007                      move.w     d7,d0
[00030238] 204a                      movea.l    a2,a0
[0003023a] 4eb9 0005 1b80            jsr        Awi_obredraw
[00030240] 4cdf 0cf8                 movem.l    (a7)+,d3-d7/a2-a3
[00030244] 4e75                      rts
sort:
[00030246] 48e7 1f38                 movem.l    d3-d7/a2-a4,-(a7)
[0003024a] 594f                      subq.w     #4,a7
[0003024c] 2448                      movea.l    a0,a2
[0003024e] 3800                      move.w     d0,d4
[00030250] 2650                      movea.l    (a0),a3
[00030252] 3f6b 000a 0002            move.w     10(a3),2(a7)
[00030258] 226b 0004                 movea.l    4(a3),a1
[0003025c] 2869 0004                 movea.l    4(a1),a4
[00030260] 342f 0002                 move.w     2(a7),d2
[00030264] 48c2                      ext.l      d2
[00030266] 2202                      move.l     d2,d1
[00030268] e789                      lsl.l      #3,d1
[0003026a] 9282                      sub.l      d2,d1
[0003026c] e789                      lsl.l      #3,d1
[0003026e] 3eb4 180a                 move.w     10(a4,d1.l),(a7)
[00030272] 3a34 180c                 move.w     12(a4,d1.l),d5
[00030276] 3405                      move.w     d5,d2
[00030278] 48c2                      ext.l      d2
[0003027a] 2002                      move.l     d2,d0
[0003027c] e788                      lsl.l      #3,d0
[0003027e] 9082                      sub.l      d2,d0
[00030280] e788                      lsl.l      #3,d0
[00030282] 39bc ffff 0808            move.w     #$FFFF,8(a4,d0.l)
[00030288] 4245                      clr.w      d5
[0003028a] 3c17                      move.w     (a7),d6
[0003028c] 7eff                      moveq.l    #-1,d7
[0003028e] 3206                      move.w     d6,d1
[00030290] 48c1                      ext.l      d1
[00030292] 2001                      move.l     d1,d0
[00030294] e788                      lsl.l      #3,d0
[00030296] 9081                      sub.l      d1,d0
[00030298] e788                      lsl.l      #3,d0
[0003029a] 3634 0808                 move.w     8(a4,d0.l),d3
[0003029e] 4a43                      tst.w      d3
[000302a0] 6b00 0126                 bmi        $000303C8
[000302a4] 4a44                      tst.w      d4
[000302a6] 6732                      beq.s      $000302DA
[000302a8] 3003                      move.w     d3,d0
[000302aa] 48c0                      ext.l      d0
[000302ac] 2400                      move.l     d0,d2
[000302ae] e78a                      lsl.l      #3,d2
[000302b0] 9480                      sub.l      d0,d2
[000302b2] e78a                      lsl.l      #3,d2
[000302b4] 3034 281a                 move.w     26(a4,d2.l),d0
[000302b8] 4eb9 0002 d944            jsr        pixel_y
[000302be] 3f00                      move.w     d0,-(a7)
[000302c0] 3406                      move.w     d6,d2
[000302c2] 48c2                      ext.l      d2
[000302c4] 2202                      move.l     d2,d1
[000302c6] e789                      lsl.l      #3,d1
[000302c8] 9282                      sub.l      d2,d1
[000302ca] e789                      lsl.l      #3,d1
[000302cc] 3034 181a                 move.w     26(a4,d1.l),d0
[000302d0] 4eb9 0002 d944            jsr        pixel_y
[000302d6] b05f                      cmp.w      (a7)+,d0
[000302d8] 6c3a                      bge.s      $00030314
[000302da] 4a44                      tst.w      d4
[000302dc] 6600 00e2                 bne        $000303C0
[000302e0] 3403                      move.w     d3,d2
[000302e2] 48c2                      ext.l      d2
[000302e4] 2202                      move.l     d2,d1
[000302e6] e789                      lsl.l      #3,d1
[000302e8] 9282                      sub.l      d2,d1
[000302ea] e789                      lsl.l      #3,d1
[000302ec] 3034 1818                 move.w     24(a4,d1.l),d0
[000302f0] 4eb9 0002 d91c            jsr        pixel_x
[000302f6] 3f00                      move.w     d0,-(a7)
[000302f8] 3406                      move.w     d6,d2
[000302fa] 48c2                      ext.l      d2
[000302fc] 2202                      move.l     d2,d1
[000302fe] e789                      lsl.l      #3,d1
[00030300] 9282                      sub.l      d2,d1
[00030302] e789                      lsl.l      #3,d1
[00030304] 3034 1818                 move.w     24(a4,d1.l),d0
[00030308] 4eb9 0002 d91c            jsr        pixel_x
[0003030e] b05f                      cmp.w      (a7)+,d0
[00030310] 6d00 00ae                 blt        $000303C0
[00030314] 3403                      move.w     d3,d2
[00030316] 48c2                      ext.l      d2
[00030318] 2202                      move.l     d2,d1
[0003031a] e789                      lsl.l      #3,d1
[0003031c] 9282                      sub.l      d2,d1
[0003031e] e789                      lsl.l      #3,d1
[00030320] 3034 181a                 move.w     26(a4,d1.l),d0
[00030324] 4eb9 0002 d944            jsr        pixel_y
[0003032a] 3f00                      move.w     d0,-(a7)
[0003032c] 3406                      move.w     d6,d2
[0003032e] 48c2                      ext.l      d2
[00030330] 2202                      move.l     d2,d1
[00030332] e789                      lsl.l      #3,d1
[00030334] 9282                      sub.l      d2,d1
[00030336] e789                      lsl.l      #3,d1
[00030338] 3034 181a                 move.w     26(a4,d1.l),d0
[0003033c] 4eb9 0002 d944            jsr        pixel_y
[00030342] b05f                      cmp.w      (a7)+,d0
[00030344] 6e32                      bgt.s      $00030378
[00030346] 3403                      move.w     d3,d2
[00030348] 48c2                      ext.l      d2
[0003034a] 2202                      move.l     d2,d1
[0003034c] e789                      lsl.l      #3,d1
[0003034e] 9282                      sub.l      d2,d1
[00030350] e789                      lsl.l      #3,d1
[00030352] 3034 1818                 move.w     24(a4,d1.l),d0
[00030356] 4eb9 0002 d91c            jsr        pixel_x
[0003035c] 3f00                      move.w     d0,-(a7)
[0003035e] 3406                      move.w     d6,d2
[00030360] 48c2                      ext.l      d2
[00030362] 2202                      move.l     d2,d1
[00030364] e789                      lsl.l      #3,d1
[00030366] 9282                      sub.l      d2,d1
[00030368] e789                      lsl.l      #3,d1
[0003036a] 3034 1818                 move.w     24(a4,d1.l),d0
[0003036e] 4eb9 0002 d91c            jsr        pixel_x
[00030374] b05f                      cmp.w      (a7)+,d0
[00030376] 6f48                      ble.s      $000303C0
[00030378] 7a01                      moveq.l    #1,d5
[0003037a] 2053                      movea.l    (a3),a0
[0003037c] 8b68 0006                 or.w       d5,6(a0)
[00030380] 4a47                      tst.w      d7
[00030382] 6a04                      bpl.s      $00030388
[00030384] 3e83                      move.w     d3,(a7)
[00030386] 6010                      bra.s      $00030398
[00030388] 3207                      move.w     d7,d1
[0003038a] 48c1                      ext.l      d1
[0003038c] 2001                      move.l     d1,d0
[0003038e] e788                      lsl.l      #3,d0
[00030390] 9081                      sub.l      d1,d0
[00030392] e788                      lsl.l      #3,d0
[00030394] 3983 0808                 move.w     d3,8(a4,d0.l)
[00030398] 3203                      move.w     d3,d1
[0003039a] 48c1                      ext.l      d1
[0003039c] 2001                      move.l     d1,d0
[0003039e] e788                      lsl.l      #3,d0
[000303a0] 9081                      sub.l      d1,d0
[000303a2] e788                      lsl.l      #3,d0
[000303a4] 3206                      move.w     d6,d1
[000303a6] 48c1                      ext.l      d1
[000303a8] 2401                      move.l     d1,d2
[000303aa] e78a                      lsl.l      #3,d2
[000303ac] 9481                      sub.l      d1,d2
[000303ae] e78a                      lsl.l      #3,d2
[000303b0] 39b4 0808 2808            move.w     8(a4,d0.l),8(a4,d2.l)
[000303b6] 3986 0808                 move.w     d6,8(a4,d0.l)
[000303ba] 3e03                      move.w     d3,d7
[000303bc] 3606                      move.w     d6,d3
[000303be] 3c07                      move.w     d7,d6
[000303c0] 3e06                      move.w     d6,d7
[000303c2] 3c03                      move.w     d3,d6
[000303c4] 6000 fec8                 bra        $0003028E
[000303c8] 4a45                      tst.w      d5
[000303ca] 6600 febc                 bne        $00030288
[000303ce] 322f 0002                 move.w     2(a7),d1
[000303d2] 48c1                      ext.l      d1
[000303d4] 2001                      move.l     d1,d0
[000303d6] e788                      lsl.l      #3,d0
[000303d8] 9081                      sub.l      d1,d0
[000303da] e788                      lsl.l      #3,d0
[000303dc] 3997 080a                 move.w     (a7),10(a4,d0.l)
[000303e0] 3986 080c                 move.w     d6,12(a4,d0.l)
[000303e4] 3606                      move.w     d6,d3
[000303e6] 48c3                      ext.l      d3
[000303e8] 2403                      move.l     d3,d2
[000303ea] e78a                      lsl.l      #3,d2
[000303ec] 9483                      sub.l      d3,d2
[000303ee] e78a                      lsl.l      #3,d2
[000303f0] 39af 0002 2808            move.w     2(a7),8(a4,d2.l)
[000303f6] 204a                      movea.l    a2,a0
[000303f8] 226a 0010                 movea.l    16(a2),a1
[000303fc] 4e91                      jsr        (a1)
[000303fe] 302f 0002                 move.w     2(a7),d0
[00030402] 3800                      move.w     d0,d4
[00030404] d844                      add.w      d4,d4
[00030406] d840                      add.w      d0,d4
[00030408] 5444                      addq.w     #2,d4
[0003040a] 204a                      movea.l    a2,a0
[0003040c] 3004                      move.w     d4,d0
[0003040e] 4eb9 0005 1b80            jsr        Awi_obredraw
[00030414] 584f                      addq.w     #4,a7
[00030416] 4cdf 1cf8                 movem.l    (a7)+,d3-d7/a2-a4
[0003041a] 4e75                      rts
edob_sortxy:
[0003041c] 7001                      moveq.l    #1,d0
[0003041e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00030424] 2068 0258                 movea.l    600(a0),a0
[00030428] 6100 fe1c                 bsr        sort
[0003042c] 4e75                      rts
edob_sortyx:
[0003042e] 4240                      clr.w      d0
[00030430] 2079 0010 ee4e            movea.l    ACSblk,a0
[00030436] 2068 0258                 movea.l    600(a0),a0
[0003043a] 6100 fe0a                 bsr        sort
[0003043e] 4e75                      rts
edob_lock:
[00030440] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[00030444] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003044a] 2668 0258                 movea.l    600(a0),a3
[0003044e] 2453                      movea.l    (a3),a2
[00030450] 2252                      movea.l    (a2),a1
[00030452] 0069 0001 0006            ori.w      #$0001,6(a1)
[00030458] 362a 000a                 move.w     10(a2),d3
[0003045c] 3803                      move.w     d3,d4
[0003045e] d844                      add.w      d4,d4
[00030460] d843                      add.w      d3,d4
[00030462] 5444                      addq.w     #2,d4
[00030464] 4eb9 0004 810e            jsr        Adr_unselect
[0003046a] 266b 0014                 movea.l    20(a3),a3
[0003046e] 3204                      move.w     d4,d1
[00030470] 48c1                      ext.l      d1
[00030472] 2001                      move.l     d1,d0
[00030474] d080                      add.l      d0,d0
[00030476] d081                      add.l      d1,d0
[00030478] e788                      lsl.l      #3,d0
[0003047a] 0073 1000 080a            ori.w      #$1000,10(a3,d0.l)
[00030480] 206a 0004                 movea.l    4(a2),a0
[00030484] 2668 0004                 movea.l    4(a0),a3
[00030488] 3803                      move.w     d3,d4
[0003048a] 48c4                      ext.l      d4
[0003048c] 2404                      move.l     d4,d2
[0003048e] e78a                      lsl.l      #3,d2
[00030490] 9484                      sub.l      d4,d2
[00030492] e78a                      lsl.l      #3,d2
[00030494] 0073 1000 2812            ori.w      #$1000,18(a3,d2.l)
[0003049a] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[0003049e] 4e75                      rts
edob_unlock:
[000304a0] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[000304a4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000304aa] 2668 0258                 movea.l    600(a0),a3
[000304ae] 2453                      movea.l    (a3),a2
[000304b0] 2252                      movea.l    (a2),a1
[000304b2] 0069 0001 0006            ori.w      #$0001,6(a1)
[000304b8] 362a 000a                 move.w     10(a2),d3
[000304bc] 3803                      move.w     d3,d4
[000304be] d844                      add.w      d4,d4
[000304c0] d843                      add.w      d3,d4
[000304c2] 5444                      addq.w     #2,d4
[000304c4] 4eb9 0004 810e            jsr        Adr_unselect
[000304ca] 266b 0014                 movea.l    20(a3),a3
[000304ce] 3204                      move.w     d4,d1
[000304d0] 48c1                      ext.l      d1
[000304d2] 2001                      move.l     d1,d0
[000304d4] d080                      add.l      d0,d0
[000304d6] d081                      add.l      d1,d0
[000304d8] e788                      lsl.l      #3,d0
[000304da] 0273 efff 080a            andi.w     #$EFFF,10(a3,d0.l)
[000304e0] 206a 0004                 movea.l    4(a2),a0
[000304e4] 2668 0004                 movea.l    4(a0),a3
[000304e8] 3803                      move.w     d3,d4
[000304ea] 48c4                      ext.l      d4
[000304ec] 2404                      move.l     d4,d2
[000304ee] e78a                      lsl.l      #3,d2
[000304f0] 9484                      sub.l      d4,d2
[000304f2] e78a                      lsl.l      #3,d2
[000304f4] 0273 efff 2812            andi.w     #$EFFF,18(a3,d2.l)
[000304fa] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[000304fe] 4e75                      rts
edob_unhide:
[00030500] 48e7 1e3c                 movem.l    d3-d6/a2-a5,-(a7)
[00030504] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003050a] 2468 0258                 movea.l    600(a0),a2
[0003050e] 266a 0014                 movea.l    20(a2),a3
[00030512] 2852                      movea.l    (a2),a4
[00030514] 362c 000a                 move.w     10(a4),d3
[00030518] 226c 0004                 movea.l    4(a4),a1
[0003051c] 2a69 0004                 movea.l    4(a1),a5
[00030520] 3203                      move.w     d3,d1
[00030522] 48c1                      ext.l      d1
[00030524] 2001                      move.l     d1,d0
[00030526] e788                      lsl.l      #3,d0
[00030528] 9081                      sub.l      d1,d0
[0003052a] e788                      lsl.l      #3,d0
[0003052c] 3835 080a                 move.w     10(a5,d0.l),d4
[00030530] 4a44                      tst.w      d4
[00030532] 6b00 0082                 bmi        $000305B6
[00030536] 4245                      clr.w      d5
[00030538] 605a                      bra.s      $00030594
[0003053a] 303c 0080                 move.w     #$0080,d0
[0003053e] 3404                      move.w     d4,d2
[00030540] 48c2                      ext.l      d2
[00030542] 2202                      move.l     d2,d1
[00030544] e789                      lsl.l      #3,d1
[00030546] 9282                      sub.l      d2,d1
[00030548] e789                      lsl.l      #3,d1
[0003054a] c075 1810                 and.w      16(a5,d1.l),d0
[0003054e] 6734                      beq.s      $00030584
[00030550] 7a01                      moveq.l    #1,d5
[00030552] 3c04                      move.w     d4,d6
[00030554] dc46                      add.w      d6,d6
[00030556] dc44                      add.w      d4,d6
[00030558] dc45                      add.w      d5,d6
[0003055a] 3206                      move.w     d6,d1
[0003055c] 48c1                      ext.l      d1
[0003055e] 2001                      move.l     d1,d0
[00030560] d080                      add.l      d0,d0
[00030562] d081                      add.l      d1,d0
[00030564] e788                      lsl.l      #3,d0
[00030566] 0273 ff7f 0808            andi.w     #$FF7F,8(a3,d0.l)
[0003056c] 0273 ff7f 0820            andi.w     #$FF7F,32(a3,d0.l)
[00030572] 3c04                      move.w     d4,d6
[00030574] 48c6                      ext.l      d6
[00030576] 2406                      move.l     d6,d2
[00030578] e78a                      lsl.l      #3,d2
[0003057a] 9486                      sub.l      d6,d2
[0003057c] e78a                      lsl.l      #3,d2
[0003057e] 0275 ff7f 2810            andi.w     #$FF7F,16(a5,d2.l)
[00030584] 3204                      move.w     d4,d1
[00030586] 48c1                      ext.l      d1
[00030588] 2001                      move.l     d1,d0
[0003058a] e788                      lsl.l      #3,d0
[0003058c] 9081                      sub.l      d1,d0
[0003058e] e788                      lsl.l      #3,d0
[00030590] 3835 0808                 move.w     8(a5,d0.l),d4
[00030594] b644                      cmp.w      d4,d3
[00030596] 66a2                      bne.s      $0003053A
[00030598] 4a45                      tst.w      d5
[0003059a] 671a                      beq.s      $000305B6
[0003059c] 2054                      movea.l    (a4),a0
[0003059e] 0068 0001 0006            ori.w      #$0001,6(a0)
[000305a4] 3003                      move.w     d3,d0
[000305a6] d040                      add.w      d0,d0
[000305a8] d043                      add.w      d3,d0
[000305aa] 5240                      addq.w     #1,d0
[000305ac] 3600                      move.w     d0,d3
[000305ae] 204a                      movea.l    a2,a0
[000305b0] 4eb9 0005 1b80            jsr        Awi_obredraw
[000305b6] 4cdf 3c78                 movem.l    (a7)+,d3-d6/a2-a5
[000305ba] 4e75                      rts
edob_pos:
[000305bc] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[000305c0] 4fef fff6                 lea.l      -10(a7),a7
[000305c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000305ca] 2ea8 0258                 move.l     600(a0),(a7)
[000305ce] 2257                      movea.l    (a7),a1
[000305d0] 2451                      movea.l    (a1),a2
[000305d2] 362a 000a                 move.w     10(a2),d3
[000305d6] 4a43                      tst.w      d3
[000305d8] 6b00 04ca                 bmi        $00030AA4
[000305dc] 302a 0018                 move.w     24(a2),d0
[000305e0] 6b00 04c2                 bmi        $00030AA4
[000305e4] 41f9 000c 8f20            lea.l      WI_POSITION,a0
[000305ea] 2279 000c 8f28            movea.l    $000C8F28,a1
[000305f0] 4e91                      jsr        (a1)
[000305f2] 2648                      movea.l    a0,a3
[000305f4] 200b                      move.l     a3,d0
[000305f6] 6700 04ac                 beq        $00030AA4
[000305fa] 2257                      movea.l    (a7),a1
[000305fc] 2869 0014                 movea.l    20(a1),a4
[00030600] 206a 0004                 movea.l    4(a2),a0
[00030604] 2a68 0004                 movea.l    4(a0),a5
[00030608] 3403                      move.w     d3,d2
[0003060a] 48c2                      ext.l      d2
[0003060c] 2202                      move.l     d2,d1
[0003060e] e789                      lsl.l      #3,d1
[00030610] 9282                      sub.l      d2,d1
[00030612] e789                      lsl.l      #3,d1
[00030614] 3035 1818                 move.w     24(a5,d1.l),d0
[00030618] c07c 00ff                 and.w      #$00FF,d0
[0003061c] 3f00                      move.w     d0,-(a7)
[0003061e] 43f9 000c 91d5            lea.l      $000C91D5,a1
[00030624] 206b 0014                 movea.l    20(a3),a0
[00030628] 7007                      moveq.l    #7,d0
[0003062a] 4eb9 0005 0f94            jsr        Aob_printf
[00030630] 544f                      addq.w     #2,a7
[00030632] 3203                      move.w     d3,d1
[00030634] 48c1                      ext.l      d1
[00030636] 2001                      move.l     d1,d0
[00030638] e788                      lsl.l      #3,d0
[0003063a] 9081                      sub.l      d1,d0
[0003063c] e788                      lsl.l      #3,d0
[0003063e] 3435 081a                 move.w     26(a5,d0.l),d2
[00030642] c47c 00ff                 and.w      #$00FF,d2
[00030646] 3f02                      move.w     d2,-(a7)
[00030648] 43f9 000c 91d5            lea.l      $000C91D5,a1
[0003064e] 206b 0014                 movea.l    20(a3),a0
[00030652] 7008                      moveq.l    #8,d0
[00030654] 4eb9 0005 0f94            jsr        Aob_printf
[0003065a] 544f                      addq.w     #2,a7
[0003065c] 3203                      move.w     d3,d1
[0003065e] 48c1                      ext.l      d1
[00030660] 2001                      move.l     d1,d0
[00030662] e788                      lsl.l      #3,d0
[00030664] 9081                      sub.l      d1,d0
[00030666] e788                      lsl.l      #3,d0
[00030668] 3435 081c                 move.w     28(a5,d0.l),d2
[0003066c] c47c 00ff                 and.w      #$00FF,d2
[00030670] 3f02                      move.w     d2,-(a7)
[00030672] 43f9 000c 91d5            lea.l      $000C91D5,a1
[00030678] 206b 0014                 movea.l    20(a3),a0
[0003067c] 7009                      moveq.l    #9,d0
[0003067e] 4eb9 0005 0f94            jsr        Aob_printf
[00030684] 544f                      addq.w     #2,a7
[00030686] 3203                      move.w     d3,d1
[00030688] 48c1                      ext.l      d1
[0003068a] 2001                      move.l     d1,d0
[0003068c] e788                      lsl.l      #3,d0
[0003068e] 9081                      sub.l      d1,d0
[00030690] e788                      lsl.l      #3,d0
[00030692] 3435 081e                 move.w     30(a5,d0.l),d2
[00030696] c47c 00ff                 and.w      #$00FF,d2
[0003069a] 3f02                      move.w     d2,-(a7)
[0003069c] 43f9 000c 91d5            lea.l      $000C91D5,a1
[000306a2] 206b 0014                 movea.l    20(a3),a0
[000306a6] 700a                      moveq.l    #10,d0
[000306a8] 4eb9 0005 0f94            jsr        Aob_printf
[000306ae] 544f                      addq.w     #2,a7
[000306b0] 3203                      move.w     d3,d1
[000306b2] 48c1                      ext.l      d1
[000306b4] 2001                      move.l     d1,d0
[000306b6] e788                      lsl.l      #3,d0
[000306b8] 9081                      sub.l      d1,d0
[000306ba] e788                      lsl.l      #3,d0
[000306bc] 3435 0818                 move.w     24(a5,d0.l),d2
[000306c0] e042                      asr.w      #8,d2
[000306c2] 3f02                      move.w     d2,-(a7)
[000306c4] 43f9 000c 91d5            lea.l      $000C91D5,a1
[000306ca] 206b 0014                 movea.l    20(a3),a0
[000306ce] 700c                      moveq.l    #12,d0
[000306d0] 4eb9 0005 0f94            jsr        Aob_printf
[000306d6] 544f                      addq.w     #2,a7
[000306d8] 3203                      move.w     d3,d1
[000306da] 48c1                      ext.l      d1
[000306dc] 2001                      move.l     d1,d0
[000306de] e788                      lsl.l      #3,d0
[000306e0] 9081                      sub.l      d1,d0
[000306e2] e788                      lsl.l      #3,d0
[000306e4] 3435 081a                 move.w     26(a5,d0.l),d2
[000306e8] e042                      asr.w      #8,d2
[000306ea] 3f02                      move.w     d2,-(a7)
[000306ec] 43f9 000c 91d5            lea.l      $000C91D5,a1
[000306f2] 206b 0014                 movea.l    20(a3),a0
[000306f6] 700d                      moveq.l    #13,d0
[000306f8] 4eb9 0005 0f94            jsr        Aob_printf
[000306fe] 544f                      addq.w     #2,a7
[00030700] 3203                      move.w     d3,d1
[00030702] 48c1                      ext.l      d1
[00030704] 2001                      move.l     d1,d0
[00030706] e788                      lsl.l      #3,d0
[00030708] 9081                      sub.l      d1,d0
[0003070a] e788                      lsl.l      #3,d0
[0003070c] 3435 081c                 move.w     28(a5,d0.l),d2
[00030710] e042                      asr.w      #8,d2
[00030712] 3f02                      move.w     d2,-(a7)
[00030714] 43f9 000c 91d5            lea.l      $000C91D5,a1
[0003071a] 206b 0014                 movea.l    20(a3),a0
[0003071e] 700e                      moveq.l    #14,d0
[00030720] 4eb9 0005 0f94            jsr        Aob_printf
[00030726] 544f                      addq.w     #2,a7
[00030728] 3203                      move.w     d3,d1
[0003072a] 48c1                      ext.l      d1
[0003072c] 2001                      move.l     d1,d0
[0003072e] e788                      lsl.l      #3,d0
[00030730] 9081                      sub.l      d1,d0
[00030732] e788                      lsl.l      #3,d0
[00030734] 3435 081e                 move.w     30(a5,d0.l),d2
[00030738] e042                      asr.w      #8,d2
[0003073a] 3f02                      move.w     d2,-(a7)
[0003073c] 43f9 000c 91d5            lea.l      $000C91D5,a1
[00030742] 206b 0014                 movea.l    20(a3),a0
[00030746] 700f                      moveq.l    #15,d0
[00030748] 4eb9 0005 0f94            jsr        Aob_printf
[0003074e] 544f                      addq.w     #2,a7
[00030750] 3803                      move.w     d3,d4
[00030752] d844                      add.w      d4,d4
[00030754] d843                      add.w      d3,d4
[00030756] 5444                      addq.w     #2,d4
[00030758] 3204                      move.w     d4,d1
[0003075a] 48c1                      ext.l      d1
[0003075c] 2001                      move.l     d1,d0
[0003075e] d080                      add.l      d0,d0
[00030760] d081                      add.l      d1,d0
[00030762] e788                      lsl.l      #3,d0
[00030764] 3a34 0814                 move.w     20(a4,d0.l),d5
[00030768] 3c34 0816                 move.w     22(a4,d0.l),d6
[0003076c] 204b                      movea.l    a3,a0
[0003076e] 4eb9 0005 9df4            jsr        Awi_dialog
[00030774] b07c 0013                 cmp.w      #$0013,d0
[00030778] 6600 0322                 bne        $00030A9C
[0003077c] 2052                      movea.l    (a2),a0
[0003077e] 0068 0001 0006            ori.w      #$0001,6(a0)
[00030784] 45ef 0008                 lea.l      8(a7),a2
[00030788] 4a43                      tst.w      d3
[0003078a] 6700 0124                 beq        $000308B0
[0003078e] 4852                      pea.l      (a2)
[00030790] 43f9 000c 91d5            lea.l      $000C91D5,a1
[00030796] 7007                      moveq.l    #7,d0
[00030798] 206b 0014                 movea.l    20(a3),a0
[0003079c] 4eb9 0005 10fe            jsr        Aob_scanf
[000307a2] 584f                      addq.w     #4,a7
[000307a4] 486f 0006                 pea.l      6(a7)
[000307a8] 43f9 000c 91d5            lea.l      $000C91D5,a1
[000307ae] 700c                      moveq.l    #12,d0
[000307b0] 206b 0014                 movea.l    20(a3),a0
[000307b4] 4eb9 0005 10fe            jsr        Aob_scanf
[000307ba] 584f                      addq.w     #4,a7
[000307bc] 0c52 00ff                 cmpi.w     #$00FF,(a2)
[000307c0] 6f06                      ble.s      $000307C8
[000307c2] 34bc 00ff                 move.w     #$00FF,(a2)
[000307c6] 6006                      bra.s      $000307CE
[000307c8] 3012                      move.w     (a2),d0
[000307ca] 6a02                      bpl.s      $000307CE
[000307cc] 4252                      clr.w      (a2)
[000307ce] 0c6f 007f 0006            cmpi.w     #$007F,6(a7)
[000307d4] 6f08                      ble.s      $000307DE
[000307d6] 3f7c 007f 0006            move.w     #$007F,6(a7)
[000307dc] 600e                      bra.s      $000307EC
[000307de] 0c6f ff80 0006            cmpi.w     #$FF80,6(a7)
[000307e4] 6c06                      bge.s      $000307EC
[000307e6] 3f7c ff80 0006            move.w     #$FF80,6(a7)
[000307ec] 3012                      move.w     (a2),d0
[000307ee] c07c 00ff                 and.w      #$00FF,d0
[000307f2] 322f 0006                 move.w     6(a7),d1
[000307f6] e149                      lsl.w      #8,d1
[000307f8] 8041                      or.w       d1,d0
[000307fa] 3203                      move.w     d3,d1
[000307fc] 48c1                      ext.l      d1
[000307fe] 2401                      move.l     d1,d2
[00030800] e78a                      lsl.l      #3,d2
[00030802] 9481                      sub.l      d1,d2
[00030804] e78a                      lsl.l      #3,d2
[00030806] 3b80 2818                 move.w     d0,24(a5,d2.l)
[0003080a] 3204                      move.w     d4,d1
[0003080c] 48c1                      ext.l      d1
[0003080e] 2401                      move.l     d1,d2
[00030810] d482                      add.l      d2,d2
[00030812] d481                      add.l      d1,d2
[00030814] e78a                      lsl.l      #3,d2
[00030816] 3980 2810                 move.w     d0,16(a4,d2.l)
[0003081a] 3980 28f8                 move.w     d0,-8(a4,d2.l)
[0003081e] 4852                      pea.l      (a2)
[00030820] 43f9 000c 91d5            lea.l      $000C91D5,a1
[00030826] 206b 0014                 movea.l    20(a3),a0
[0003082a] 7008                      moveq.l    #8,d0
[0003082c] 4eb9 0005 10fe            jsr        Aob_scanf
[00030832] 584f                      addq.w     #4,a7
[00030834] 486f 0006                 pea.l      6(a7)
[00030838] 43f9 000c 91d5            lea.l      $000C91D5,a1
[0003083e] 700d                      moveq.l    #13,d0
[00030840] 206b 0014                 movea.l    20(a3),a0
[00030844] 4eb9 0005 10fe            jsr        Aob_scanf
[0003084a] 584f                      addq.w     #4,a7
[0003084c] 0c52 00ff                 cmpi.w     #$00FF,(a2)
[00030850] 6f06                      ble.s      $00030858
[00030852] 34bc 00ff                 move.w     #$00FF,(a2)
[00030856] 6006                      bra.s      $0003085E
[00030858] 3012                      move.w     (a2),d0
[0003085a] 6a02                      bpl.s      $0003085E
[0003085c] 4252                      clr.w      (a2)
[0003085e] 0c6f 007f 0006            cmpi.w     #$007F,6(a7)
[00030864] 6f08                      ble.s      $0003086E
[00030866] 3f7c 007f 0006            move.w     #$007F,6(a7)
[0003086c] 600e                      bra.s      $0003087C
[0003086e] 0c6f ff80 0006            cmpi.w     #$FF80,6(a7)
[00030874] 6c06                      bge.s      $0003087C
[00030876] 3f7c ff80 0006            move.w     #$FF80,6(a7)
[0003087c] 3012                      move.w     (a2),d0
[0003087e] c07c 00ff                 and.w      #$00FF,d0
[00030882] 322f 0006                 move.w     6(a7),d1
[00030886] e149                      lsl.w      #8,d1
[00030888] 8041                      or.w       d1,d0
[0003088a] 3203                      move.w     d3,d1
[0003088c] 48c1                      ext.l      d1
[0003088e] 2401                      move.l     d1,d2
[00030890] e78a                      lsl.l      #3,d2
[00030892] 9481                      sub.l      d1,d2
[00030894] e78a                      lsl.l      #3,d2
[00030896] 3b80 281a                 move.w     d0,26(a5,d2.l)
[0003089a] 3204                      move.w     d4,d1
[0003089c] 48c1                      ext.l      d1
[0003089e] 2401                      move.l     d1,d2
[000308a0] d482                      add.l      d2,d2
[000308a2] d481                      add.l      d1,d2
[000308a4] e78a                      lsl.l      #3,d2
[000308a6] 3980 2812                 move.w     d0,18(a4,d2.l)
[000308aa] 3980 28fa                 move.w     d0,-6(a4,d2.l)
[000308ae] 6016                      bra.s      $000308C6
[000308b0] 3204                      move.w     d4,d1
[000308b2] 48c1                      ext.l      d1
[000308b4] 2001                      move.l     d1,d0
[000308b6] d080                      add.l      d0,d0
[000308b8] d081                      add.l      d1,d0
[000308ba] e788                      lsl.l      #3,d0
[000308bc] 3f74 0810 0004            move.w     16(a4,d0.l),4(a7)
[000308c2] 3e34 0812                 move.w     18(a4,d0.l),d7
[000308c6] 4852                      pea.l      (a2)
[000308c8] 43f9 000c 91d5            lea.l      $000C91D5,a1
[000308ce] 7009                      moveq.l    #9,d0
[000308d0] 206b 0014                 movea.l    20(a3),a0
[000308d4] 4eb9 0005 10fe            jsr        Aob_scanf
[000308da] 584f                      addq.w     #4,a7
[000308dc] 486f 0006                 pea.l      6(a7)
[000308e0] 43f9 000c 91d5            lea.l      $000C91D5,a1
[000308e6] 700e                      moveq.l    #14,d0
[000308e8] 206b 0014                 movea.l    20(a3),a0
[000308ec] 4eb9 0005 10fe            jsr        Aob_scanf
[000308f2] 584f                      addq.w     #4,a7
[000308f4] 0c52 00ff                 cmpi.w     #$00FF,(a2)
[000308f8] 6f06                      ble.s      $00030900
[000308fa] 34bc 00ff                 move.w     #$00FF,(a2)
[000308fe] 6006                      bra.s      $00030906
[00030900] 3012                      move.w     (a2),d0
[00030902] 6a02                      bpl.s      $00030906
[00030904] 4252                      clr.w      (a2)
[00030906] 0c6f 007f 0006            cmpi.w     #$007F,6(a7)
[0003090c] 6f08                      ble.s      $00030916
[0003090e] 3f7c 007f 0006            move.w     #$007F,6(a7)
[00030914] 600e                      bra.s      $00030924
[00030916] 0c6f ff80 0006            cmpi.w     #$FF80,6(a7)
[0003091c] 6c06                      bge.s      $00030924
[0003091e] 3f7c ff80 0006            move.w     #$FF80,6(a7)
[00030924] 3012                      move.w     (a2),d0
[00030926] c07c 00ff                 and.w      #$00FF,d0
[0003092a] 322f 0006                 move.w     6(a7),d1
[0003092e] e149                      lsl.w      #8,d1
[00030930] 8041                      or.w       d1,d0
[00030932] 3203                      move.w     d3,d1
[00030934] 48c1                      ext.l      d1
[00030936] 2401                      move.l     d1,d2
[00030938] e78a                      lsl.l      #3,d2
[0003093a] 9481                      sub.l      d1,d2
[0003093c] e78a                      lsl.l      #3,d2
[0003093e] 3b80 281c                 move.w     d0,28(a5,d2.l)
[00030942] 3204                      move.w     d4,d1
[00030944] 48c1                      ext.l      d1
[00030946] 2401                      move.l     d1,d2
[00030948] d482                      add.l      d2,d2
[0003094a] d481                      add.l      d1,d2
[0003094c] e78a                      lsl.l      #3,d2
[0003094e] 3980 2814                 move.w     d0,20(a4,d2.l)
[00030952] 3980 28fc                 move.w     d0,-4(a4,d2.l)
[00030956] 4852                      pea.l      (a2)
[00030958] 43f9 000c 91d5            lea.l      $000C91D5,a1
[0003095e] 206b 0014                 movea.l    20(a3),a0
[00030962] 700a                      moveq.l    #10,d0
[00030964] 4eb9 0005 10fe            jsr        Aob_scanf
[0003096a] 584f                      addq.w     #4,a7
[0003096c] 486f 0006                 pea.l      6(a7)
[00030970] 43f9 000c 91d5            lea.l      $000C91D5,a1
[00030976] 700f                      moveq.l    #15,d0
[00030978] 206b 0014                 movea.l    20(a3),a0
[0003097c] 4eb9 0005 10fe            jsr        Aob_scanf
[00030982] 584f                      addq.w     #4,a7
[00030984] 0c52 00ff                 cmpi.w     #$00FF,(a2)
[00030988] 6f06                      ble.s      $00030990
[0003098a] 34bc 00ff                 move.w     #$00FF,(a2)
[0003098e] 6006                      bra.s      $00030996
[00030990] 3012                      move.w     (a2),d0
[00030992] 6a02                      bpl.s      $00030996
[00030994] 4252                      clr.w      (a2)
[00030996] 0c6f 007f 0006            cmpi.w     #$007F,6(a7)
[0003099c] 6f08                      ble.s      $000309A6
[0003099e] 3f7c 007f 0006            move.w     #$007F,6(a7)
[000309a4] 600e                      bra.s      $000309B4
[000309a6] 0c6f ff80 0006            cmpi.w     #$FF80,6(a7)
[000309ac] 6c06                      bge.s      $000309B4
[000309ae] 3f7c ff80 0006            move.w     #$FF80,6(a7)
[000309b4] 3012                      move.w     (a2),d0
[000309b6] c07c 00ff                 and.w      #$00FF,d0
[000309ba] 322f 0006                 move.w     6(a7),d1
[000309be] e149                      lsl.w      #8,d1
[000309c0] 8041                      or.w       d1,d0
[000309c2] 3203                      move.w     d3,d1
[000309c4] 48c1                      ext.l      d1
[000309c6] 2401                      move.l     d1,d2
[000309c8] e78a                      lsl.l      #3,d2
[000309ca] 9481                      sub.l      d1,d2
[000309cc] e78a                      lsl.l      #3,d2
[000309ce] 3b80 281e                 move.w     d0,30(a5,d2.l)
[000309d2] 3204                      move.w     d4,d1
[000309d4] 48c1                      ext.l      d1
[000309d6] 2401                      move.l     d1,d2
[000309d8] d482                      add.l      d2,d2
[000309da] d481                      add.l      d1,d2
[000309dc] e78a                      lsl.l      #3,d2
[000309de] 3980 2816                 move.w     d0,22(a4,d2.l)
[000309e2] 3980 28fe                 move.w     d0,-2(a4,d2.l)
[000309e6] 2279 000e 692a            movea.l    _globl,a1
[000309ec] 70ff                      moveq.l    #-1,d0
[000309ee] d044                      add.w      d4,d0
[000309f0] 204c                      movea.l    a4,a0
[000309f2] 4eb9 0007 bbd8            jsr        mt_rsrc_obfix
[000309f8] 2279 000e 692a            movea.l    _globl,a1
[000309fe] 3004                      move.w     d4,d0
[00030a00] 204c                      movea.l    a4,a0
[00030a02] 4eb9 0007 bbd8            jsr        mt_rsrc_obfix
[00030a08] 4a43                      tst.w      d3
[00030a0a] 6620                      bne.s      $00030A2C
[00030a0c] 302f 0004                 move.w     4(a7),d0
[00030a10] 3404                      move.w     d4,d2
[00030a12] 48c2                      ext.l      d2
[00030a14] 2202                      move.l     d2,d1
[00030a16] d281                      add.l      d1,d1
[00030a18] d282                      add.l      d2,d1
[00030a1a] e789                      lsl.l      #3,d1
[00030a1c] 3980 1810                 move.w     d0,16(a4,d1.l)
[00030a20] 3980 18f8                 move.w     d0,-8(a4,d1.l)
[00030a24] 3987 1812                 move.w     d7,18(a4,d1.l)
[00030a28] 3987 18fa                 move.w     d7,-6(a4,d1.l)
[00030a2c] 3204                      move.w     d4,d1
[00030a2e] 48c1                      ext.l      d1
[00030a30] 2001                      move.l     d1,d0
[00030a32] d080                      add.l      d0,d0
[00030a34] d081                      add.l      d1,d0
[00030a36] e788                      lsl.l      #3,d0
[00030a38] 9a74 0814                 sub.w      20(a4,d0.l),d5
[00030a3c] 9c74 0816                 sub.w      22(a4,d0.l),d6
[00030a40] 4a45                      tst.w      d5
[00030a42] 6604                      bne.s      $00030A48
[00030a44] 4a46                      tst.w      d6
[00030a46] 6714                      beq.s      $00030A5C
[00030a48] 224c                      movea.l    a4,a1
[00030a4a] 3406                      move.w     d6,d2
[00030a4c] 4442                      neg.w      d2
[00030a4e] 3205                      move.w     d5,d1
[00030a50] 4441                      neg.w      d1
[00030a52] 3003                      move.w     d3,d0
[00030a54] 204d                      movea.l    a5,a0
[00030a56] 4eb9 0002 d834            jsr        resize_ob
[00030a5c] 3004                      move.w     d4,d0
[00030a5e] 204c                      movea.l    a4,a0
[00030a60] 4eb9 0005 0f3a            jsr        Aob_up
[00030a66] 3e00                      move.w     d0,d7
[00030a68] 4eb9 0004 810e            jsr        Adr_unselect
[00030a6e] 4a43                      tst.w      d3
[00030a70] 6620                      bne.s      $00030A92
[00030a72] 2057                      movea.l    (a7),a0
[00030a74] 2257                      movea.l    (a7),a1
[00030a76] 2269 0010                 movea.l    16(a1),a1
[00030a7a] 4e91                      jsr        (a1)
[00030a7c] 2057                      movea.l    (a7),a0
[00030a7e] 0068 0010 0056            ori.w      #$0010,86(a0)
[00030a84] 2248                      movea.l    a0,a1
[00030a86] 43e9 0024                 lea.l      36(a1),a1
[00030a8a] 2468 0086                 movea.l    134(a0),a2
[00030a8e] 4e92                      jsr        (a2)
[00030a90] 600a                      bra.s      $00030A9C
[00030a92] 3007                      move.w     d7,d0
[00030a94] 2057                      movea.l    (a7),a0
[00030a96] 4eb9 0005 1b80            jsr        Awi_obredraw
[00030a9c] 204b                      movea.l    a3,a0
[00030a9e] 4eb9 0005 85f2            jsr        Awi_delete
[00030aa4] 4fef 000a                 lea.l      10(a7),a7
[00030aa8] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[00030aac] 4e75                      rts
edob_resetref:
[00030aae] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[00030ab2] 594f                      subq.w     #4,a7
[00030ab4] 41f9 0010 ee4e            lea.l      ACSblk,a0
[00030aba] 2250                      movea.l    (a0),a1
[00030abc] 2269 0258                 movea.l    600(a1),a1
[00030ac0] 2450                      movea.l    (a0),a2
[00030ac2] b3ea 0240                 cmpa.l     576(a2),a1
[00030ac6] 6600 00ca                 bne        $00030B92
[00030aca] 302a 0246                 move.w     582(a2),d0
[00030ace] 6b00 00c2                 bmi        $00030B92
[00030ad2] 2251                      movea.l    (a1),a1
[00030ad4] 2451                      movea.l    (a1),a2
[00030ad6] 006a 0001 0006            ori.w      #$0001,6(a2)
[00030adc] 2669 0004                 movea.l    4(a1),a3
[00030ae0] 2eab 0004                 move.l     4(a3),(a7)
[00030ae4] 2250                      movea.l    (a0),a1
[00030ae6] 4269 0248                 clr.w      584(a1)
[00030aea] 47f9 000c 91ce            lea.l      $000C91CE,a3
[00030af0] 6000 0094                 bra        $00030B86
[00030af4] 78fe                      moveq.l    #-2,d4
[00030af6] d843                      add.w      d3,d4
[00030af8] 48c4                      ext.l      d4
[00030afa] 89fc 0003                 divs.w     #$0003,d4
[00030afe] 3204                      move.w     d4,d1
[00030b00] 48c1                      ext.l      d1
[00030b02] 2001                      move.l     d1,d0
[00030b04] e788                      lsl.l      #3,d0
[00030b06] 9081                      sub.l      d1,d0
[00030b08] e788                      lsl.l      #3,d0
[00030b0a] 2857                      movea.l    (a7),a4
[00030b0c] d9c0                      adda.l     d0,a4
[00030b0e] 426c 002a                 clr.w      42(a4)
[00030b12] 2414                      move.l     (a4),d2
[00030b14] 670c                      beq.s      $00030B22
[00030b16] 2242                      movea.l    d2,a1
[00030b18] 204a                      movea.l    a2,a0
[00030b1a] 4eb9 0001 7f52            jsr        objfree
[00030b20] 4294                      clr.l      (a4)
[00030b22] 486b 0006                 pea.l      6(a3)
[00030b26] 4240                      clr.w      d0
[00030b28] 43ec 0004                 lea.l      4(a4),a1
[00030b2c] 204a                      movea.l    a2,a0
[00030b2e] 4eb9 0001 58c6            jsr        mod_ref
[00030b34] 584f                      addq.w     #4,a7
[00030b36] 486b 0006                 pea.l      6(a3)
[00030b3a] 7001                      moveq.l    #1,d0
[00030b3c] 43ec 0020                 lea.l      32(a4),a1
[00030b40] 204a                      movea.l    a2,a0
[00030b42] 4eb9 0001 58c6            jsr        mod_ref
[00030b48] 584f                      addq.w     #4,a7
[00030b4a] 486b 0006                 pea.l      6(a3)
[00030b4e] 7002                      moveq.l    #2,d0
[00030b50] 43ec 0024                 lea.l      36(a4),a1
[00030b54] 204a                      movea.l    a2,a0
[00030b56] 4eb9 0001 58c6            jsr        mod_ref
[00030b5c] 584f                      addq.w     #4,a7
[00030b5e] 486b 0006                 pea.l      6(a3)
[00030b62] 4240                      clr.w      d0
[00030b64] 43ec 002c                 lea.l      44(a4),a1
[00030b68] 204a                      movea.l    a2,a0
[00030b6a] 4eb9 0001 58c6            jsr        mod_ref
[00030b70] 584f                      addq.w     #4,a7
[00030b72] 486b 0006                 pea.l      6(a3)
[00030b76] 4240                      clr.w      d0
[00030b78] 43ec 0030                 lea.l      48(a4),a1
[00030b7c] 204a                      movea.l    a2,a0
[00030b7e] 4eb9 0001 58c6            jsr        mod_ref
[00030b84] 584f                      addq.w     #4,a7
[00030b86] 4eb9 0004 7e2a            jsr        Adr_next
[00030b8c] 3600                      move.w     d0,d3
[00030b8e] 6a00 ff64                 bpl        $00030AF4
[00030b92] 584f                      addq.w     #4,a7
[00030b94] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[00030b98] 4e75                      rts
oe_beself:
[00030b9a] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00030b9e] 4fef fff6                 lea.l      -10(a7),a7
[00030ba2] 2449                      movea.l    a1,a2
[00030ba4] 3600                      move.w     d0,d3
[00030ba6] c07c 0fff                 and.w      #$0FFF,d0
[00030baa] 48c0                      ext.l      d0
[00030bac] 2200                      move.l     d0,d1
[00030bae] d281                      add.l      d1,d1
[00030bb0] d280                      add.l      d0,d1
[00030bb2] e789                      lsl.l      #3,d1
[00030bb4] 2672 180c                 movea.l    12(a2,d1.l),a3
[00030bb8] 2e88                      move.l     a0,(a7)
[00030bba] 43f2 1800                 lea.l      0(a2,d1.l),a1
[00030bbe] 2f49 0004                 move.l     a1,4(a7)
[00030bc2] 3f43 0008                 move.w     d3,8(a7)
[00030bc6] 43d7                      lea.l      (a7),a1
[00030bc8] 246b 0008                 movea.l    8(a3),a2
[00030bcc] 206f 0004                 movea.l    4(a7),a0
[00030bd0] 7009                      moveq.l    #9,d0
[00030bd2] 4e92                      jsr        (a2)
[00030bd4] 4fef 000a                 lea.l      10(a7),a7
[00030bd8] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00030bdc] 4e75                      rts
oe_colsel:
[00030bde] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[00030be2] 514f                      subq.w     #8,a7
[00030be4] 3800                      move.w     d0,d4
[00030be6] 3601                      move.w     d1,d3
[00030be8] 3a02                      move.w     d2,d5
[00030bea] 41f9 000c 9c50            lea.l      POP_COLSEL,a0
[00030bf0] 4eb9 0004 f064            jsr        Aob_create
[00030bf6] 2448                      movea.l    a0,a2
[00030bf8] 200a                      move.l     a2,d0
[00030bfa] 6606                      bne.s      $00030C02
[00030bfc] 70ff                      moveq.l    #-1,d0
[00030bfe] 6000 00cc                 bra        $00030CCC
[00030c02] 47f9 0010 ee4e            lea.l      ACSblk,a3
[00030c08] 3003                      move.w     d3,d0
[00030c0a] 2053                      movea.l    (a3),a0
[00030c0c] 2268 0258                 movea.l    600(a0),a1
[00030c10] 2269 0014                 movea.l    20(a1),a1
[00030c14] 41d7                      lea.l      (a7),a0
[00030c16] 4eb9 0004 fe06            jsr        Aob_offset
[00030c1c] 7001                      moveq.l    #1,d0
[00030c1e] 2053                      movea.l    (a3),a0
[00030c20] 2268 0258                 movea.l    600(a0),a1
[00030c24] d069 0034                 add.w      52(a1),d0
[00030c28] d157                      add.w      d0,(a7)
[00030c2a] 7201                      moveq.l    #1,d1
[00030c2c] d269 0036                 add.w      54(a1),d1
[00030c30] d36f 0002                 add.w      d1,2(a7)
[00030c34] 3004                      move.w     d4,d0
[00030c36] d040                      add.w      d0,d0
[00030c38] 48c0                      ext.l      d0
[00030c3a] 2400                      move.l     d0,d2
[00030c3c] d482                      add.l      d2,d2
[00030c3e] d480                      add.l      d0,d2
[00030c40] e78a                      lsl.l      #3,d2
[00030c42] 0072 0004 2822            ori.w      #$0004,34(a2,d2.l)
[00030c48] 322f 0002                 move.w     2(a7),d1
[00030c4c] 224a                      movea.l    a2,a1
[00030c4e] 2053                      movea.l    (a3),a0
[00030c50] 2068 0258                 movea.l    600(a0),a0
[00030c54] 3017                      move.w     (a7),d0
[00030c56] 4eb9 0004 e84a            jsr        Ame_popup
[00030c5c] 3800                      move.w     d0,d4
[00030c5e] 6b62                      bmi.s      $00030CC2
[00030c60] 72fe                      moveq.l    #-2,d1
[00030c62] c240                      and.w      d0,d1
[00030c64] 48c1                      ext.l      d1
[00030c66] 83fc 0002                 divs.w     #$0002,d1
[00030c6a] 3801                      move.w     d1,d4
[00030c6c] 48c1                      ext.l      d1
[00030c6e] e589                      lsl.l      #2,d1
[00030c70] 41f9 000c a6d0            lea.l      colour_text,a0
[00030c76] 2270 1800                 movea.l    0(a0,d1.l),a1
[00030c7a] 3005                      move.w     d5,d0
[00030c7c] 2053                      movea.l    (a3),a0
[00030c7e] 2068 025c                 movea.l    604(a0),a0
[00030c82] 4eb9 0005 0fd8            jsr        Aob_puttext
[00030c88] 322f 0020                 move.w     32(a7),d1
[00030c8c] 48c1                      ext.l      d1
[00030c8e] 2001                      move.l     d1,d0
[00030c90] d080                      add.l      d0,d0
[00030c92] d081                      add.l      d1,d0
[00030c94] e788                      lsl.l      #3,d0
[00030c96] 2053                      movea.l    (a3),a0
[00030c98] 2268 025c                 movea.l    604(a0),a1
[00030c9c] 3404                      move.w     d4,d2
[00030c9e] 0271 fff0 080e            andi.w     #$FFF0,14(a1,d0.l)
[00030ca4] c47c 000f                 and.w      #$000F,d2
[00030ca8] 8571 080e                 or.w       d2,14(a1,d0.l)
[00030cac] 2053                      movea.l    (a3),a0
[00030cae] 2068 0258                 movea.l    600(a0),a0
[00030cb2] 2253                      movea.l    (a3),a1
[00030cb4] 2269 0258                 movea.l    600(a1),a1
[00030cb8] 2269 0066                 movea.l    102(a1),a1
[00030cbc] 3003                      move.w     d3,d0
[00030cbe] 72ff                      moveq.l    #-1,d1
[00030cc0] 4e91                      jsr        (a1)
[00030cc2] 204a                      movea.l    a2,a0
[00030cc4] 4eb9 0004 f20a            jsr        Aob_delete
[00030cca] 3004                      move.w     d4,d0
[00030ccc] 504f                      addq.w     #8,a7
[00030cce] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[00030cd2] 4e75                      rts
