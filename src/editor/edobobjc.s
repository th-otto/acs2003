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

	.data

TEXT_002:
[000c4b17]                           dc.b $00
TEXT_003:
[000c4b18]                           dc.b 'OK',0
TEXT_006:
[000c4b1b]                           dc.b '1234567890123456789012345678901',0
TEXT_01:
[000c4b3b]                           dc.b 'Subobj:',0
TEXT_010:
[000c4b43]                           dc.b ' MENö EDITOR ',0
TEXT_011:
[000c4b51]                           dc.b ' OBJEKTBAUM EDITOR ',0
TEXT_012:
[000c4b65]                           dc.b ' POPUP EDITOR ',0
TEXT_02:
[000c4b74]                           dc.b 'MENöS',0
TEXT_03:
[000c4b7a]                           dc.b '  Objekt-Editor...',0
TEXT_04:
[000c4b8d]                           dc.b '  Lerne Tasten       '
[000c4ba2]                           dc.w $074c
[000c4ba4]                           dc.w $0020
[000c4ba6]                           dc.b ' Referenzen...',0
TEXT_06:
[000c4bb5]                           dc.b '  Information...     ^I',0
TEXT_069:
[000c4bcd]                           dc.b 'Datei:',0
TEXT_07:
[000c4bd4]                           dc.b '  Referenzen lîschen',0
TEXT_071:
[000c4be9]                           dc.b 'Objekt:',0
TEXT_08:
[000c4bf1]                           dc.b 'Char:',0
TEXT_086:
[000c4bf7]                           dc.b '  Verstecke',0
TEXT_087:
[000c4c03]                           dc.b '  Decke auf',0
TEXT_088:
[000c4c0f]                           dc.b '  Verriegeln',0
TEXT_089:
[000c4c1c]                           dc.b '  Entriegeln',0
TEXT_09:
[000c4c29]                           dc.b '  Test...            '
[000c4c3e]                           dc.w $0754
[000c4c40]                           dc.w $0020
[000c4c42]                           dc.b ' Rechts',0
TEXT_091:
[000c4c4a]                           dc.b '  Mitte',0
TEXT_092:
[000c4c52]                           dc.b '  Links',0
TEXT_093:
[000c4c5a]                           dc.b '  Oben',0
TEXT_094:
[000c4c61]                           dc.b '-Vertikal-',0
TEXT_095:
[000c4c6c]                           dc.b '  Unten',0
TEXT_097:
[000c4c74]                           dc.b '  Nach oben',0
TEXT_098:
[000c4c80]                           dc.b '  Nach unten',0
TEXT_099:
[000c4c8d]                           dc.b 'Horizontal',0
TEXT_10:
[000c4c98]                           dc.b 'Pixel:',0
TEXT_100:
[000c4c9f]                           dc.b '  FÅllen',0
TEXT_11:
[000c4ca8]                           dc.b '  Sichtbarkeit    '
[000c4cba]                           dc.w $0300
TEXT_13:
[000c4cbc]                           dc.b 'Ob_Y:',0
TEXT_133:
[000c4cc2]                           dc.b '123456',0
TEXT_14:
[000c4cc9]                           dc.b 'Ob_Width:',0
TEXT_15:
[000c4cd3]                           dc.b 'Ob_Height:',0
TEXT_16:
[000c4cde]                           dc.b ' Objekt(e) angewÑhlt ',0
TEXT_17:
[000c4cf4]                           dc.b 'POPUP',0
TEXT_170:
[000c4cfa]                           dc.b '  öber mich ...     ',0
TEXT_171:
[000c4d0f]                           dc.b '--------------------',0
TEXT_18:
[000c4d24]                           dc.b '  Kontroll-Fenster    K',0
TEXT_19:
[000c4d3c]                           dc.b '  Position...',0
TEXT_20:
[000c4d4a]                           dc.b '  Ausrichtung     '
[000c4d5c]                           dc.w $0300
TEXT_21:
[000c4d5e]                           dc.b 'Ob_X:',0
TEXT_22:
[000c4d64]                           dc.b ' Information ',0
TEXT_23:
[000c4d72]                           dc.b ' Position ',0
TEXT_239:
[000c4d7d]                           dc.b 'Aufruf:',0
TEXT_24:
[000c4d85]                           dc.b 'Aufdecken',0
TEXT_245:
[000c4d8f]                           dc.b 'Index:',0
TEXT_25:
[000c4d96]                           dc.b ' Objekt(e) empfangen ',0
TEXT_26:
[000c4dac]                           dc.b '  Status...',0
TEXT_27:
[000c4db8]                           dc.b 'OBJEKTE',0
TEXT_28:
[000c4dc0]                           dc.b '  Reihenfolge     '
[000c4dd2]                           dc.w $0300
TEXT_29:
[000c4dd4]                           dc.b 'Verriegeln',0
TEXT_30:
[000c4ddf]                           dc.b 'vertikal:',0
TEXT_301:
[000c4de9]                           dc.b 'Abbruch',0
TEXT_31:
[000c4df1]                           dc.b 'horizontal:',0
TEXT_32:
[000c4dfd]                           dc.b 'nach Unten',0
TEXT_339:
[000c4e08]                           dc.b ' Baum ',0
TEXT_34:
[000c4e0f]                           dc.b 'Verstecken',0
TEXT_35:
[000c4e1a]                           dc.b 'Entriegeln',0
TEXT_36:
[000c4e25]                           dc.b 'nach Oben',0
testmode:
[000c4e2f]                           dc.b ' TESTMODE -',0
[000c4e3b]                           dc.b $00
DATAS_01:
[000c4e3c]                           dc.w $0000
[000c4e3e]                           dc.w $0000
[000c4e40]                           dc.w $02f0
[000c4e42]                           dc.w $0000
[000c4e44]                           dc.w $0000
[000c4e46]                           dc.w $0000
[000c4e48]                           dc.w $7fff
[000c4e4a]                           dc.w $ffff
[000c4e4c]                           dc.w $fffe
[000c4e4e]                           dc.w $4000
[000c4e50]                           dc.w $0000
[000c4e52]                           dc.w $0002
[000c4e54]                           dc.w $5fff
[000c4e56]                           dc.w $ffff
[000c4e58]                           dc.w $fffa
[000c4e5a]                           dc.w $5800
[000c4e5c]                           dc.w $03ff
[000c4e5e]                           dc.w $fffa
[000c4e60]                           dc.w $5800
[000c4e62]                           dc.w $038f
[000c4e64]                           dc.w $f81a
[000c4e66]                           dc.w $58ef
[000c4e68]                           dc.w $63bf
[000c4e6a]                           dc.w $ffda
[000c4e6c]                           dc.w $5800
[000c4e6e]                           dc.w $03bf
[000c4e70]                           dc.w $ffda
[000c4e72]                           dc.w $5800
[000c4e74]                           dc.w $03bf
[000c4e76]                           dc.w $ffda
[000c4e78]                           dc.w $5fff
[000c4e7a]                           dc.w $ffbf
[000c4e7c]                           dc.w $ffda
[000c4e7e]                           dc.w $5fff
[000c4e80]                           dc.w $ffbf
[000c4e82]                           dc.w $ffda
[000c4e84]                           dc.w $5800
[000c4e86]                           dc.w $03bf
[000c4e88]                           dc.w $ffda
[000c4e8a]                           dc.w $5800
[000c4e8c]                           dc.w $03bf
[000c4e8e]                           dc.w $ffda
[000c4e90]                           dc.w $58f6
[000c4e92]                           dc.w $e3bf
[000c4e94]                           dc.w $ffda
[000c4e96]                           dc.w $5800
[000c4e98]                           dc.w $03bf
[000c4e9a]                           dc.w $ffda
[000c4e9c]                           dc.w $5800
[000c4e9e]                           dc.w $0380
[000c4ea0]                           dc.w $001a
[000c4ea2]                           dc.w $5fff
[000c4ea4]                           dc.w $ffff
[000c4ea6]                           dc.w $fffa
[000c4ea8]                           dc.w $5fff
[000c4eaa]                           dc.w $ffff
[000c4eac]                           dc.w $fffa
[000c4eae]                           dc.w $5fff
[000c4eb0]                           dc.w $ffff
[000c4eb2]                           dc.w $fffa
[000c4eb4]                           dc.w $5fff
[000c4eb6]                           dc.w $ffff
[000c4eb8]                           dc.w $fffa
[000c4eba]                           dc.w $5fff
[000c4ebc]                           dc.w $ffff
[000c4ebe]                           dc.w $fffa
[000c4ec0]                           dc.w $5fc0
[000c4ec2]                           dc.w $07c0
[000c4ec4]                           dc.w $01fa
[000c4ec6]                           dc.w $5fdf
[000c4ec8]                           dc.w $f7df
[000c4eca]                           dc.w $fdfa
[000c4ecc]                           dc.w $5fdf
[000c4ece]                           dc.w $f7df
[000c4ed0]                           dc.w $fdfa
[000c4ed2]                           dc.w $5fdf
[000c4ed4]                           dc.w $f7df
[000c4ed6]                           dc.w $fdfa
[000c4ed8]                           dc.w $5fc0
[000c4eda]                           dc.w $07c0
[000c4edc]                           dc.w $01fa
[000c4ede]                           dc.w $5fff
[000c4ee0]                           dc.w $ffff
[000c4ee2]                           dc.w $fffa
[000c4ee4]                           dc.w $5fff
[000c4ee6]                           dc.w $ffff
[000c4ee8]                           dc.w $fffa
[000c4eea]                           dc.w $4000
[000c4eec]                           dc.w $0000
[000c4eee]                           dc.w $0002
[000c4ef0]                           dc.w $7fff
[000c4ef2]                           dc.w $ffff
[000c4ef4]                           dc.w $fffe
[000c4ef6]                           dc.w $0000
[000c4ef8]                           dc.w $0000
[000c4efa]                           dc.w $0000
[000c4efc]                           dc.w $0000
[000c4efe]                           dc.w $0000
[000c4f00]                           dc.w $0000
[000c4f02]                           dc.w $7fff
[000c4f04]                           dc.w $ffff
[000c4f06]                           dc.w $fffe
[000c4f08]                           dc.w $4000
[000c4f0a]                           dc.w $0000
[000c4f0c]                           dc.w $0002
[000c4f0e]                           dc.w $5fff
[000c4f10]                           dc.w $ffff
[000c4f12]                           dc.w $fffa
[000c4f14]                           dc.w $5800
[000c4f16]                           dc.w $03ff
[000c4f18]                           dc.w $fffa
[000c4f1a]                           dc.w $5800
[000c4f1c]                           dc.w $038f
[000c4f1e]                           dc.w $f81a
[000c4f20]                           dc.w $58ef
[000c4f22]                           dc.w $63bf
[000c4f24]                           dc.w $ffda
[000c4f26]                           dc.w $5800
[000c4f28]                           dc.w $03bf
[000c4f2a]                           dc.w $ffda
[000c4f2c]                           dc.w $5800
[000c4f2e]                           dc.w $03bf
[000c4f30]                           dc.w $ffda
[000c4f32]                           dc.w $5fff
[000c4f34]                           dc.w $ffbf
[000c4f36]                           dc.w $ffda
[000c4f38]                           dc.w $5fff
[000c4f3a]                           dc.w $ffbf
[000c4f3c]                           dc.w $ffda
[000c4f3e]                           dc.w $5800
[000c4f40]                           dc.w $03bf
[000c4f42]                           dc.w $ffda
[000c4f44]                           dc.w $5800
[000c4f46]                           dc.w $03bf
[000c4f48]                           dc.w $ffda
[000c4f4a]                           dc.w $58f6
[000c4f4c]                           dc.w $e3bf
[000c4f4e]                           dc.w $ffda
[000c4f50]                           dc.w $5800
[000c4f52]                           dc.w $03bf
[000c4f54]                           dc.w $ffda
[000c4f56]                           dc.w $5800
[000c4f58]                           dc.w $0380
[000c4f5a]                           dc.w $001a
[000c4f5c]                           dc.w $5fff
[000c4f5e]                           dc.w $ffff
[000c4f60]                           dc.w $fffa
[000c4f62]                           dc.w $5fff
[000c4f64]                           dc.w $ffff
[000c4f66]                           dc.w $fffa
[000c4f68]                           dc.w $5fff
[000c4f6a]                           dc.w $ffff
[000c4f6c]                           dc.w $fffa
[000c4f6e]                           dc.w $5fff
[000c4f70]                           dc.w $ffff
[000c4f72]                           dc.w $fffa
[000c4f74]                           dc.w $5fff
[000c4f76]                           dc.w $ffff
[000c4f78]                           dc.w $fffa
[000c4f7a]                           dc.w $5fc0
[000c4f7c]                           dc.w $07c0
[000c4f7e]                           dc.w $01fa
[000c4f80]                           dc.w $5fdf
[000c4f82]                           dc.w $f7df
[000c4f84]                           dc.w $fdfa
[000c4f86]                           dc.w $5fdf
[000c4f88]                           dc.w $f7df
[000c4f8a]                           dc.w $fdfa
[000c4f8c]                           dc.w $5fdf
[000c4f8e]                           dc.w $f7df
[000c4f90]                           dc.w $fdfa
[000c4f92]                           dc.w $5fc0
[000c4f94]                           dc.w $07c0
[000c4f96]                           dc.w $01fa
[000c4f98]                           dc.w $5fff
[000c4f9a]                           dc.w $ffff
[000c4f9c]                           dc.w $fffa
[000c4f9e]                           dc.w $5fff
[000c4fa0]                           dc.w $ffff
[000c4fa2]                           dc.w $fffa
[000c4fa4]                           dc.w $4000
[000c4fa6]                           dc.w $0000
[000c4fa8]                           dc.w $0002
[000c4faa]                           dc.w $7fff
[000c4fac]                           dc.w $ffff
[000c4fae]                           dc.w $fffe
[000c4fb0]                           dc.w $0000
[000c4fb2]                           dc.w $0000
[000c4fb4]                           dc.w $0000
[000c4fb6]                           dc.w $0000
[000c4fb8]                           dc.w $0000
[000c4fba]                           dc.w $0000
[000c4fbc]                           dc.w $7fff
[000c4fbe]                           dc.w $ffff
[000c4fc0]                           dc.w $fffe
[000c4fc2]                           dc.w $4000
[000c4fc4]                           dc.w $0000
[000c4fc6]                           dc.w $0002
[000c4fc8]                           dc.w $5fff
[000c4fca]                           dc.w $ffff
[000c4fcc]                           dc.w $fffa
[000c4fce]                           dc.w $5800
[000c4fd0]                           dc.w $03ff
[000c4fd2]                           dc.w $fffa
[000c4fd4]                           dc.w $5800
[000c4fd6]                           dc.w $038f
[000c4fd8]                           dc.w $f81a
[000c4fda]                           dc.w $58ef
[000c4fdc]                           dc.w $63bf
[000c4fde]                           dc.w $ffda
[000c4fe0]                           dc.w $5800
[000c4fe2]                           dc.w $03bf
[000c4fe4]                           dc.w $ffda
[000c4fe6]                           dc.w $5800
[000c4fe8]                           dc.w $03bf
[000c4fea]                           dc.w $ffda
[000c4fec]                           dc.w $5fff
[000c4fee]                           dc.w $ffbf
[000c4ff0]                           dc.w $ffda
[000c4ff2]                           dc.w $5fff
[000c4ff4]                           dc.w $ffbf
[000c4ff6]                           dc.w $ffda
[000c4ff8]                           dc.w $5800
[000c4ffa]                           dc.w $03bf
[000c4ffc]                           dc.w $ffda
[000c4ffe]                           dc.w $5800
[000c5000]                           dc.w $03bf
[000c5002]                           dc.w $ffda
[000c5004]                           dc.w $58f6
[000c5006]                           dc.w $e3bf
[000c5008]                           dc.w $ffda
[000c500a]                           dc.w $5800
[000c500c]                           dc.w $03bf
[000c500e]                           dc.w $ffda
[000c5010]                           dc.w $5800
[000c5012]                           dc.w $0380
[000c5014]                           dc.w $001a
[000c5016]                           dc.w $5fff
[000c5018]                           dc.w $ffff
[000c501a]                           dc.w $fffa
[000c501c]                           dc.w $5fff
[000c501e]                           dc.w $ffff
[000c5020]                           dc.w $fffa
[000c5022]                           dc.w $5fff
[000c5024]                           dc.w $ffff
[000c5026]                           dc.w $fffa
[000c5028]                           dc.w $5fff
[000c502a]                           dc.w $ffff
[000c502c]                           dc.w $fffa
[000c502e]                           dc.w $5fff
[000c5030]                           dc.w $ffff
[000c5032]                           dc.w $fffa
[000c5034]                           dc.w $5fc0
[000c5036]                           dc.w $07c0
[000c5038]                           dc.w $01fa
[000c503a]                           dc.w $5fdf
[000c503c]                           dc.w $f7df
[000c503e]                           dc.w $fdfa
[000c5040]                           dc.w $5fdf
[000c5042]                           dc.w $f7df
[000c5044]                           dc.w $fdfa
[000c5046]                           dc.w $5fdf
[000c5048]                           dc.w $f7df
[000c504a]                           dc.w $fdfa
[000c504c]                           dc.w $5fc0
[000c504e]                           dc.w $07c0
[000c5050]                           dc.w $01fa
[000c5052]                           dc.w $5fff
[000c5054]                           dc.w $ffff
[000c5056]                           dc.w $fffa
[000c5058]                           dc.w $5fff
[000c505a]                           dc.w $ffff
[000c505c]                           dc.w $fffa
[000c505e]                           dc.w $4000
[000c5060]                           dc.w $0000
[000c5062]                           dc.w $0002
[000c5064]                           dc.w $7fff
[000c5066]                           dc.w $ffff
[000c5068]                           dc.w $fffe
[000c506a]                           dc.w $0000
[000c506c]                           dc.w $0000
[000c506e]                           dc.w $0000
[000c5070]                           dc.w $0000
[000c5072]                           dc.w $0000
[000c5074]                           dc.w $0000
[000c5076]                           dc.w $7fff
[000c5078]                           dc.w $ffff
[000c507a]                           dc.w $fffe
[000c507c]                           dc.w $4000
[000c507e]                           dc.w $0000
[000c5080]                           dc.w $0006
[000c5082]                           dc.w $4000
[000c5084]                           dc.w $0000
[000c5086]                           dc.w $0006
[000c5088]                           dc.w $47ff
[000c508a]                           dc.w $fc07
[000c508c]                           dc.w $f006
[000c508e]                           dc.w $4400
[000c5090]                           dc.w $0470
[000c5092]                           dc.w $07e6
[000c5094]                           dc.w $44ef
[000c5096]                           dc.w $6440
[000c5098]                           dc.w $0026
[000c509a]                           dc.w $4400
[000c509c]                           dc.w $0453
[000c509e]                           dc.w $dfa6
[000c50a0]                           dc.w $47ff
[000c50a2]                           dc.w $fc40
[000c50a4]                           dc.w $0026
[000c50a6]                           dc.w $4000
[000c50a8]                           dc.w $0040
[000c50aa]                           dc.w $0026
[000c50ac]                           dc.w $4000
[000c50ae]                           dc.w $0053
[000c50b0]                           dc.w $f7a6
[000c50b2]                           dc.w $47ff
[000c50b4]                           dc.w $fc40
[000c50b6]                           dc.w $0026
[000c50b8]                           dc.w $4400
[000c50ba]                           dc.w $0440
[000c50bc]                           dc.w $0026
[000c50be]                           dc.w $44f6
[000c50c0]                           dc.w $e453
[000c50c2]                           dc.w $bfa6
[000c50c4]                           dc.w $4400
[000c50c6]                           dc.w $0440
[000c50c8]                           dc.w $0026
[000c50ca]                           dc.w $47ff
[000c50cc]                           dc.w $fc7f
[000c50ce]                           dc.w $ffe6
[000c50d0]                           dc.w $4000
[000c50d2]                           dc.w $0000
[000c50d4]                           dc.w $0006
[000c50d6]                           dc.w $4000
[000c50d8]                           dc.w $0000
[000c50da]                           dc.w $0006
[000c50dc]                           dc.w $4000
[000c50de]                           dc.w $0000
[000c50e0]                           dc.w $0006
[000c50e2]                           dc.w $4000
[000c50e4]                           dc.w $0000
[000c50e6]                           dc.w $0006
[000c50e8]                           dc.w $407f
[000c50ea]                           dc.w $fc7f
[000c50ec]                           dc.w $ff06
[000c50ee]                           dc.w $4040
[000c50f0]                           dc.w $0c40
[000c50f2]                           dc.w $0306
[000c50f4]                           dc.w $4040
[000c50f6]                           dc.w $0c40
[000c50f8]                           dc.w $0306
[000c50fa]                           dc.w $4047
[000c50fc]                           dc.w $cc47
[000c50fe]                           dc.w $f306
[000c5100]                           dc.w $4040
[000c5102]                           dc.w $0c40
[000c5104]                           dc.w $0306
[000c5106]                           dc.w $407f
[000c5108]                           dc.w $fc7f
[000c510a]                           dc.w $ff06
[000c510c]                           dc.w $407f
[000c510e]                           dc.w $fc7f
[000c5110]                           dc.w $ff06
[000c5112]                           dc.w $4000
[000c5114]                           dc.w $0000
[000c5116]                           dc.w $0006
[000c5118]                           dc.w $7fff
[000c511a]                           dc.w $ffff
[000c511c]                           dc.w $fffe
[000c511e]                           dc.w $7fff
[000c5120]                           dc.w $ffff
[000c5122]                           dc.w $fffe
[000c5124]                           dc.w $0000
[000c5126]                           dc.w $0000
[000c5128]                           dc.w $0000
DATAS_02:
[000c512a]                           dc.w $0000
[000c512c]                           dc.w $0000
[000c512e]                           dc.w $0000
[000c5130]                           dc.w $7fff
[000c5132]                           dc.w $ffff
[000c5134]                           dc.w $fffe
[000c5136]                           dc.w $7fff
[000c5138]                           dc.w $ffff
[000c513a]                           dc.w $fffe
[000c513c]                           dc.w $7fff
[000c513e]                           dc.w $ffff
[000c5140]                           dc.w $fffe
[000c5142]                           dc.w $7fff
[000c5144]                           dc.w $ffff
[000c5146]                           dc.w $fffe
[000c5148]                           dc.w $7fff
[000c514a]                           dc.w $ffff
[000c514c]                           dc.w $fffe
[000c514e]                           dc.w $7fff
[000c5150]                           dc.w $ffff
[000c5152]                           dc.w $fffe
[000c5154]                           dc.w $7fff
[000c5156]                           dc.w $ffff
[000c5158]                           dc.w $fffe
[000c515a]                           dc.w $7fff
[000c515c]                           dc.w $ffff
[000c515e]                           dc.w $fffe
[000c5160]                           dc.w $7fff
[000c5162]                           dc.w $ffff
[000c5164]                           dc.w $fffe
[000c5166]                           dc.w $7fff
[000c5168]                           dc.w $ffff
[000c516a]                           dc.w $fffe
[000c516c]                           dc.w $7fff
[000c516e]                           dc.w $ffff
[000c5170]                           dc.w $fffe
[000c5172]                           dc.w $7fff
[000c5174]                           dc.w $ffff
[000c5176]                           dc.w $fffe
[000c5178]                           dc.w $7fff
[000c517a]                           dc.w $ffff
[000c517c]                           dc.w $fffe
[000c517e]                           dc.w $7fff
[000c5180]                           dc.w $ffff
[000c5182]                           dc.w $fffe
[000c5184]                           dc.w $7fff
[000c5186]                           dc.w $ffff
[000c5188]                           dc.w $fffe
[000c518a]                           dc.w $7fff
[000c518c]                           dc.w $ffff
[000c518e]                           dc.w $fffe
[000c5190]                           dc.w $7fff
[000c5192]                           dc.w $ffff
[000c5194]                           dc.w $fffe
[000c5196]                           dc.w $7fff
[000c5198]                           dc.w $ffff
[000c519a]                           dc.w $fffe
[000c519c]                           dc.w $7fff
[000c519e]                           dc.w $ffff
[000c51a0]                           dc.w $fffe
[000c51a2]                           dc.w $7fff
[000c51a4]                           dc.w $ffff
[000c51a6]                           dc.w $fffe
[000c51a8]                           dc.w $7fff
[000c51aa]                           dc.w $ffff
[000c51ac]                           dc.w $fffe
[000c51ae]                           dc.w $7fff
[000c51b0]                           dc.w $ffff
[000c51b2]                           dc.w $fffe
[000c51b4]                           dc.w $7fff
[000c51b6]                           dc.w $ffff
[000c51b8]                           dc.w $fffe
[000c51ba]                           dc.w $7fff
[000c51bc]                           dc.w $ffff
[000c51be]                           dc.w $fffe
[000c51c0]                           dc.w $7fff
[000c51c2]                           dc.w $ffff
[000c51c4]                           dc.w $fffe
[000c51c6]                           dc.w $7fff
[000c51c8]                           dc.w $ffff
[000c51ca]                           dc.w $fffe
[000c51cc]                           dc.w $7fff
[000c51ce]                           dc.w $ffff
[000c51d0]                           dc.w $fffe
[000c51d2]                           dc.w $7fff
[000c51d4]                           dc.w $ffff
[000c51d6]                           dc.w $fffe
[000c51d8]                           dc.w $7fff
[000c51da]                           dc.w $ffff
[000c51dc]                           dc.w $fffe
[000c51de]                           dc.w $0000
[000c51e0]                           dc.w $0000
[000c51e2]                           dc.w $0000
DATAS_03:
[000c51e4]                           dc.w $0000
[000c51e6]                           dc.w $0000
[000c51e8]                           dc.w $02c0
[000c51ea]                           dc.w $0000
[000c51ec]                           dc.w $0000
[000c51ee]                           dc.w $0000
[000c51f0]                           dc.w $0000
[000c51f2]                           dc.w $0000
[000c51f4]                           dc.w $0000
[000c51f6]                           dc.w $0000
[000c51f8]                           dc.w $0000
[000c51fa]                           dc.w $0000
[000c51fc]                           dc.w $0000
[000c51fe]                           dc.w $0000
[000c5200]                           dc.w $0000
[000c5202]                           dc.w $0000
[000c5204]                           dc.w $0000
[000c5206]                           dc.w $0000
[000c5208]                           dc.w $0000
[000c520a]                           dc.w $0000
[000c520c]                           dc.w $0000
[000c520e]                           dc.w $1fff
[000c5210]                           dc.w $ffff
[000c5212]                           dc.w $fff0
[000c5214]                           dc.w $101f
[000c5216]                           dc.w $f000
[000c5218]                           dc.w $0010
[000c521a]                           dc.w $1798
[000c521c]                           dc.w $33e0
[000c521e]                           dc.w $0010
[000c5220]                           dc.w $101f
[000c5222]                           dc.w $f000
[000c5224]                           dc.w $0010
[000c5226]                           dc.w $1fff
[000c5228]                           dc.w $ffff
[000c522a]                           dc.w $fff0
[000c522c]                           dc.w $0010
[000c522e]                           dc.w $0040
[000c5230]                           dc.w $0000
[000c5232]                           dc.w $0017
[000c5234]                           dc.w $ff40
[000c5236]                           dc.w $0000
[000c5238]                           dc.w $0010
[000c523a]                           dc.w $0040
[000c523c]                           dc.w $0000
[000c523e]                           dc.w $0010
[000c5240]                           dc.w $0040
[000c5242]                           dc.w $0000
[000c5244]                           dc.w $0015
[000c5246]                           dc.w $5540
[000c5248]                           dc.w $0000
[000c524a]                           dc.w $0010
[000c524c]                           dc.w $0040
[000c524e]                           dc.w $0000
[000c5250]                           dc.w $001f
[000c5252]                           dc.w $ffc0
[000c5254]                           dc.w $0000
[000c5256]                           dc.w $0018
[000c5258]                           dc.w $00c0
[000c525a]                           dc.w $0000
[000c525c]                           dc.w $001f
[000c525e]                           dc.w $ffc0
[000c5260]                           dc.w $0000
[000c5262]                           dc.w $0010
[000c5264]                           dc.w $0040
[000c5266]                           dc.w $0000
[000c5268]                           dc.w $0017
[000c526a]                           dc.w $fe40
[000c526c]                           dc.w $0000
[000c526e]                           dc.w $0010
[000c5270]                           dc.w $0040
[000c5272]                           dc.w $0000
[000c5274]                           dc.w $001f
[000c5276]                           dc.w $ffc0
[000c5278]                           dc.w $0000
[000c527a]                           dc.w $0000
[000c527c]                           dc.w $0000
[000c527e]                           dc.w $0000
[000c5280]                           dc.w $0000
[000c5282]                           dc.w $0000
[000c5284]                           dc.w $0000
[000c5286]                           dc.w $0000
[000c5288]                           dc.w $0000
[000c528a]                           dc.w $0000
[000c528c]                           dc.w $0000
[000c528e]                           dc.w $0000
[000c5290]                           dc.w $0000
[000c5292]                           dc.w $0000
[000c5294]                           dc.w $0000
[000c5296]                           dc.w $0000
[000c5298]                           dc.w $0000
[000c529a]                           dc.w $0000
[000c529c]                           dc.w $0000
[000c529e]                           dc.w $0000
[000c52a0]                           dc.w $0000
[000c52a2]                           dc.w $0000
[000c52a4]                           dc.w $0000
[000c52a6]                           dc.w $0000
[000c52a8]                           dc.w $0000
[000c52aa]                           dc.w $0000
[000c52ac]                           dc.w $0000
[000c52ae]                           dc.w $0000
[000c52b0]                           dc.w $0000
[000c52b2]                           dc.w $0000
[000c52b4]                           dc.w $0000
[000c52b6]                           dc.w $0000
[000c52b8]                           dc.w $0000
[000c52ba]                           dc.w $0000
[000c52bc]                           dc.w $1fff
[000c52be]                           dc.w $ffff
[000c52c0]                           dc.w $fff0
[000c52c2]                           dc.w $101f
[000c52c4]                           dc.w $f000
[000c52c6]                           dc.w $0010
[000c52c8]                           dc.w $1798
[000c52ca]                           dc.w $33e0
[000c52cc]                           dc.w $0010
[000c52ce]                           dc.w $101f
[000c52d0]                           dc.w $f000
[000c52d2]                           dc.w $0010
[000c52d4]                           dc.w $1fff
[000c52d6]                           dc.w $ffff
[000c52d8]                           dc.w $fff0
[000c52da]                           dc.w $0010
[000c52dc]                           dc.w $0040
[000c52de]                           dc.w $0000
[000c52e0]                           dc.w $0017
[000c52e2]                           dc.w $ff40
[000c52e4]                           dc.w $0000
[000c52e6]                           dc.w $0010
[000c52e8]                           dc.w $0040
[000c52ea]                           dc.w $0000
[000c52ec]                           dc.w $0010
[000c52ee]                           dc.w $0040
[000c52f0]                           dc.w $0000
[000c52f2]                           dc.w $0015
[000c52f4]                           dc.w $5540
[000c52f6]                           dc.w $0000
[000c52f8]                           dc.w $0010
[000c52fa]                           dc.w $0040
[000c52fc]                           dc.w $0000
[000c52fe]                           dc.w $001f
[000c5300]                           dc.w $ffc0
[000c5302]                           dc.w $0000
[000c5304]                           dc.w $0018
[000c5306]                           dc.w $00c0
[000c5308]                           dc.w $0000
[000c530a]                           dc.w $001f
[000c530c]                           dc.w $ffc0
[000c530e]                           dc.w $0000
[000c5310]                           dc.w $0010
[000c5312]                           dc.w $0040
[000c5314]                           dc.w $0000
[000c5316]                           dc.w $0017
[000c5318]                           dc.w $fe40
[000c531a]                           dc.w $0000
[000c531c]                           dc.w $0010
[000c531e]                           dc.w $0040
[000c5320]                           dc.w $0000
[000c5322]                           dc.w $001f
[000c5324]                           dc.w $ffc0
[000c5326]                           dc.w $0000
[000c5328]                           dc.w $0000
[000c532a]                           dc.w $0000
[000c532c]                           dc.w $0000
[000c532e]                           dc.w $0000
[000c5330]                           dc.w $0000
[000c5332]                           dc.w $0000
[000c5334]                           dc.w $0000
[000c5336]                           dc.w $0000
[000c5338]                           dc.w $0000
[000c533a]                           dc.w $0000
[000c533c]                           dc.w $0000
[000c533e]                           dc.w $0000
[000c5340]                           dc.w $0000
[000c5342]                           dc.w $0000
[000c5344]                           dc.w $0000
[000c5346]                           dc.w $0000
[000c5348]                           dc.w $0000
[000c534a]                           dc.w $0000
[000c534c]                           dc.w $0000
[000c534e]                           dc.w $0000
[000c5350]                           dc.w $0000
[000c5352]                           dc.w $0000
[000c5354]                           dc.w $0000
[000c5356]                           dc.w $0000
[000c5358]                           dc.w $0000
[000c535a]                           dc.w $0000
[000c535c]                           dc.w $0000
[000c535e]                           dc.w $0000
[000c5360]                           dc.w $0000
[000c5362]                           dc.w $0000
[000c5364]                           dc.w $0000
[000c5366]                           dc.w $0000
[000c5368]                           dc.w $0000
[000c536a]                           dc.w $1fff
[000c536c]                           dc.w $ffff
[000c536e]                           dc.w $fff0
[000c5370]                           dc.w $101f
[000c5372]                           dc.w $f000
[000c5374]                           dc.w $0010
[000c5376]                           dc.w $1798
[000c5378]                           dc.w $33e0
[000c537a]                           dc.w $0010
[000c537c]                           dc.w $101f
[000c537e]                           dc.w $f000
[000c5380]                           dc.w $0010
[000c5382]                           dc.w $1fff
[000c5384]                           dc.w $ffff
[000c5386]                           dc.w $fff0
[000c5388]                           dc.w $0010
[000c538a]                           dc.w $0040
[000c538c]                           dc.w $0000
[000c538e]                           dc.w $0017
[000c5390]                           dc.w $ff40
[000c5392]                           dc.w $0000
[000c5394]                           dc.w $0010
[000c5396]                           dc.w $0040
[000c5398]                           dc.w $0000
[000c539a]                           dc.w $0010
[000c539c]                           dc.w $0040
[000c539e]                           dc.w $0000
[000c53a0]                           dc.w $0015
[000c53a2]                           dc.w $5540
[000c53a4]                           dc.w $0000
[000c53a6]                           dc.w $0010
[000c53a8]                           dc.w $0040
[000c53aa]                           dc.w $0000
[000c53ac]                           dc.w $001f
[000c53ae]                           dc.w $ffc0
[000c53b0]                           dc.w $0000
[000c53b2]                           dc.w $0018
[000c53b4]                           dc.w $00c0
[000c53b6]                           dc.w $0000
[000c53b8]                           dc.w $001f
[000c53ba]                           dc.w $ffc0
[000c53bc]                           dc.w $0000
[000c53be]                           dc.w $0010
[000c53c0]                           dc.w $0040
[000c53c2]                           dc.w $0000
[000c53c4]                           dc.w $0017
[000c53c6]                           dc.w $fe40
[000c53c8]                           dc.w $0000
[000c53ca]                           dc.w $0010
[000c53cc]                           dc.w $0040
[000c53ce]                           dc.w $0000
[000c53d0]                           dc.w $001f
[000c53d2]                           dc.w $ffc0
[000c53d4]                           dc.w $0000
[000c53d6]                           dc.w $0000
[000c53d8]                           dc.w $0000
[000c53da]                           dc.w $0000
[000c53dc]                           dc.w $0000
[000c53de]                           dc.w $0000
[000c53e0]                           dc.w $0000
[000c53e2]                           dc.w $0000
[000c53e4]                           dc.w $0000
[000c53e6]                           dc.w $0000
[000c53e8]                           dc.w $0000
[000c53ea]                           dc.w $0000
[000c53ec]                           dc.w $0000
[000c53ee]                           dc.w $0000
[000c53f0]                           dc.w $0000
[000c53f2]                           dc.w $0000
[000c53f4]                           dc.w $0000
[000c53f6]                           dc.w $0000
[000c53f8]                           dc.w $0000
[000c53fa]                           dc.w $0000
[000c53fc]                           dc.w $0000
[000c53fe]                           dc.w $0000
[000c5400]                           dc.w $0000
[000c5402]                           dc.w $0000
[000c5404]                           dc.w $0000
[000c5406]                           dc.w $0000
[000c5408]                           dc.w $0000
[000c540a]                           dc.w $0000
[000c540c]                           dc.w $0000
[000c540e]                           dc.w $0000
[000c5410]                           dc.w $0000
[000c5412]                           dc.w $0000
[000c5414]                           dc.w $0000
[000c5416]                           dc.w $0000
[000c5418]                           dc.w $1fff
[000c541a]                           dc.w $ffff
[000c541c]                           dc.w $fff0
[000c541e]                           dc.w $101f
[000c5420]                           dc.w $f000
[000c5422]                           dc.w $0018
[000c5424]                           dc.w $1798
[000c5426]                           dc.w $33e0
[000c5428]                           dc.w $0018
[000c542a]                           dc.w $101f
[000c542c]                           dc.w $f000
[000c542e]                           dc.w $0018
[000c5430]                           dc.w $1fff
[000c5432]                           dc.w $ffff
[000c5434]                           dc.w $fff8
[000c5436]                           dc.w $0ff0
[000c5438]                           dc.w $007f
[000c543a]                           dc.w $fff8
[000c543c]                           dc.w $0017
[000c543e]                           dc.w $ff60
[000c5440]                           dc.w $0000
[000c5442]                           dc.w $0010
[000c5444]                           dc.w $0060
[000c5446]                           dc.w $0000
[000c5448]                           dc.w $0010
[000c544a]                           dc.w $0060
[000c544c]                           dc.w $0000
[000c544e]                           dc.w $0015
[000c5450]                           dc.w $5560
[000c5452]                           dc.w $0000
[000c5454]                           dc.w $0010
[000c5456]                           dc.w $0060
[000c5458]                           dc.w $0000
[000c545a]                           dc.w $001f
[000c545c]                           dc.w $ffe0
[000c545e]                           dc.w $0000
[000c5460]                           dc.w $0018
[000c5462]                           dc.w $00e0
[000c5464]                           dc.w $0000
[000c5466]                           dc.w $001f
[000c5468]                           dc.w $ffe0
[000c546a]                           dc.w $0000
[000c546c]                           dc.w $0010
[000c546e]                           dc.w $0060
[000c5470]                           dc.w $0000
[000c5472]                           dc.w $0017
[000c5474]                           dc.w $fe60
[000c5476]                           dc.w $0000
[000c5478]                           dc.w $0010
[000c547a]                           dc.w $0060
[000c547c]                           dc.w $0000
[000c547e]                           dc.w $001f
[000c5480]                           dc.w $ffe0
[000c5482]                           dc.w $0000
[000c5484]                           dc.w $000f
[000c5486]                           dc.w $ffe0
[000c5488]                           dc.w $0000
[000c548a]                           dc.w $0000
[000c548c]                           dc.w $0000
[000c548e]                           dc.w $0000
[000c5490]                           dc.w $0000
[000c5492]                           dc.w $0000
[000c5494]                           dc.w $0000
[000c5496]                           dc.w $0000
[000c5498]                           dc.w $0000
[000c549a]                           dc.w $0000
[000c549c]                           dc.w $0000
[000c549e]                           dc.w $0000
[000c54a0]                           dc.w $0000
DATAS_04:
[000c54a2]                           dc.w $0000
[000c54a4]                           dc.w $0000
[000c54a6]                           dc.w $0000
[000c54a8]                           dc.w $0000
[000c54aa]                           dc.w $0000
[000c54ac]                           dc.w $0000
[000c54ae]                           dc.w $0000
[000c54b0]                           dc.w $0000
[000c54b2]                           dc.w $0000
[000c54b4]                           dc.w $0000
[000c54b6]                           dc.w $0000
[000c54b8]                           dc.w $0000
[000c54ba]                           dc.w $0000
[000c54bc]                           dc.w $0000
[000c54be]                           dc.w $0000
[000c54c0]                           dc.w $0000
[000c54c2]                           dc.w $0000
[000c54c4]                           dc.w $0000
[000c54c6]                           dc.w $1fff
[000c54c8]                           dc.w $ffff
[000c54ca]                           dc.w $fff0
[000c54cc]                           dc.w $1fff
[000c54ce]                           dc.w $ffff
[000c54d0]                           dc.w $fff8
[000c54d2]                           dc.w $1fff
[000c54d4]                           dc.w $ffff
[000c54d6]                           dc.w $fff8
[000c54d8]                           dc.w $1fff
[000c54da]                           dc.w $ffff
[000c54dc]                           dc.w $fff8
[000c54de]                           dc.w $1fff
[000c54e0]                           dc.w $ffff
[000c54e2]                           dc.w $fff8
[000c54e4]                           dc.w $0fff
[000c54e6]                           dc.w $ffff
[000c54e8]                           dc.w $fff8
[000c54ea]                           dc.w $001f
[000c54ec]                           dc.w $ffe0
[000c54ee]                           dc.w $0000
[000c54f0]                           dc.w $001f
[000c54f2]                           dc.w $ffe0
[000c54f4]                           dc.w $0000
[000c54f6]                           dc.w $001f
[000c54f8]                           dc.w $ffe0
[000c54fa]                           dc.w $0000
[000c54fc]                           dc.w $001f
[000c54fe]                           dc.w $ffe0
[000c5500]                           dc.w $0000
[000c5502]                           dc.w $001f
[000c5504]                           dc.w $ffe0
[000c5506]                           dc.w $0000
[000c5508]                           dc.w $001f
[000c550a]                           dc.w $ffe0
[000c550c]                           dc.w $0000
[000c550e]                           dc.w $001f
[000c5510]                           dc.w $ffe0
[000c5512]                           dc.w $0000
[000c5514]                           dc.w $001f
[000c5516]                           dc.w $ffe0
[000c5518]                           dc.w $0000
[000c551a]                           dc.w $001f
[000c551c]                           dc.w $ffe0
[000c551e]                           dc.w $0000
[000c5520]                           dc.w $001f
[000c5522]                           dc.w $ffe0
[000c5524]                           dc.w $0000
[000c5526]                           dc.w $001f
[000c5528]                           dc.w $ffe0
[000c552a]                           dc.w $0000
[000c552c]                           dc.w $001f
[000c552e]                           dc.w $ffe0
[000c5530]                           dc.w $0000
[000c5532]                           dc.w $000f
[000c5534]                           dc.w $ffe0
[000c5536]                           dc.w $0000
[000c5538]                           dc.w $0000
[000c553a]                           dc.w $0000
[000c553c]                           dc.w $0000
[000c553e]                           dc.w $0000
[000c5540]                           dc.w $0000
[000c5542]                           dc.w $0000
[000c5544]                           dc.w $0000
[000c5546]                           dc.w $0000
[000c5548]                           dc.w $0000
[000c554a]                           dc.w $0000
[000c554c]                           dc.w $0000
[000c554e]                           dc.w $0000
DATAS_05:
[000c5550]                           dc.w $0000
[000c5552]                           dc.w $0000
[000c5554]                           dc.w $02c0
[000c5556]                           dc.w $0000
[000c5558]                           dc.w $0000
[000c555a]                           dc.w $0000
[000c555c]                           dc.w $0000
[000c555e]                           dc.w $0000
[000c5560]                           dc.w $0000
[000c5562]                           dc.w $0000
[000c5564]                           dc.w $0000
[000c5566]                           dc.w $0000
[000c5568]                           dc.w $0000
[000c556a]                           dc.w $0000
[000c556c]                           dc.w $0000
[000c556e]                           dc.w $0000
[000c5570]                           dc.w $0000
[000c5572]                           dc.w $0000
[000c5574]                           dc.w $0000
[000c5576]                           dc.w $0000
[000c5578]                           dc.w $0000
[000c557a]                           dc.w $1fff
[000c557c]                           dc.w $ffff
[000c557e]                           dc.w $fff0
[000c5580]                           dc.w $101f
[000c5582]                           dc.w $f000
[000c5584]                           dc.w $0010
[000c5586]                           dc.w $1798
[000c5588]                           dc.w $33e0
[000c558a]                           dc.w $0010
[000c558c]                           dc.w $101f
[000c558e]                           dc.w $f000
[000c5590]                           dc.w $0010
[000c5592]                           dc.w $1fff
[000c5594]                           dc.w $ffff
[000c5596]                           dc.w $fff0
[000c5598]                           dc.w $0010
[000c559a]                           dc.w $0040
[000c559c]                           dc.w $0000
[000c559e]                           dc.w $0017
[000c55a0]                           dc.w $ff40
[000c55a2]                           dc.w $0000
[000c55a4]                           dc.w $0010
[000c55a6]                           dc.w $0040
[000c55a8]                           dc.w $0000
[000c55aa]                           dc.w $0010
[000c55ac]                           dc.w $0040
[000c55ae]                           dc.w $0000
[000c55b0]                           dc.w $0015
[000c55b2]                           dc.w $5540
[000c55b4]                           dc.w $0000
[000c55b6]                           dc.w $0010
[000c55b8]                           dc.w $0040
[000c55ba]                           dc.w $0000
[000c55bc]                           dc.w $001f
[000c55be]                           dc.w $ffc0
[000c55c0]                           dc.w $0000
[000c55c2]                           dc.w $0018
[000c55c4]                           dc.w $00c0
[000c55c6]                           dc.w $0000
[000c55c8]                           dc.w $001f
[000c55ca]                           dc.w $ffc0
[000c55cc]                           dc.w $0000
[000c55ce]                           dc.w $0010
[000c55d0]                           dc.w $0040
[000c55d2]                           dc.w $0000
[000c55d4]                           dc.w $0017
[000c55d6]                           dc.w $fe40
[000c55d8]                           dc.w $0000
[000c55da]                           dc.w $0010
[000c55dc]                           dc.w $0040
[000c55de]                           dc.w $0000
[000c55e0]                           dc.w $001f
[000c55e2]                           dc.w $ffc0
[000c55e4]                           dc.w $0000
[000c55e6]                           dc.w $0000
[000c55e8]                           dc.w $0000
[000c55ea]                           dc.w $0000
[000c55ec]                           dc.w $0000
[000c55ee]                           dc.w $0000
[000c55f0]                           dc.w $0000
[000c55f2]                           dc.w $0000
[000c55f4]                           dc.w $0000
[000c55f6]                           dc.w $0000
[000c55f8]                           dc.w $0000
[000c55fa]                           dc.w $0000
[000c55fc]                           dc.w $0000
[000c55fe]                           dc.w $0000
[000c5600]                           dc.w $0000
[000c5602]                           dc.w $0000
[000c5604]                           dc.w $0000
[000c5606]                           dc.w $0000
[000c5608]                           dc.w $0000
[000c560a]                           dc.w $0000
[000c560c]                           dc.w $0000
[000c560e]                           dc.w $0000
[000c5610]                           dc.w $0000
[000c5612]                           dc.w $0000
[000c5614]                           dc.w $0000
[000c5616]                           dc.w $0000
[000c5618]                           dc.w $0000
[000c561a]                           dc.w $0000
[000c561c]                           dc.w $0000
[000c561e]                           dc.w $0000
[000c5620]                           dc.w $0000
[000c5622]                           dc.w $0000
[000c5624]                           dc.w $0000
[000c5626]                           dc.w $0000
[000c5628]                           dc.w $1fff
[000c562a]                           dc.w $ffff
[000c562c]                           dc.w $fff0
[000c562e]                           dc.w $101f
[000c5630]                           dc.w $f000
[000c5632]                           dc.w $0010
[000c5634]                           dc.w $1798
[000c5636]                           dc.w $33e0
[000c5638]                           dc.w $0010
[000c563a]                           dc.w $101f
[000c563c]                           dc.w $f000
[000c563e]                           dc.w $0010
[000c5640]                           dc.w $1fff
[000c5642]                           dc.w $ffff
[000c5644]                           dc.w $fff0
[000c5646]                           dc.w $0010
[000c5648]                           dc.w $0040
[000c564a]                           dc.w $0000
[000c564c]                           dc.w $0017
[000c564e]                           dc.w $ff40
[000c5650]                           dc.w $0000
[000c5652]                           dc.w $0010
[000c5654]                           dc.w $0040
[000c5656]                           dc.w $0000
[000c5658]                           dc.w $0010
[000c565a]                           dc.w $0040
[000c565c]                           dc.w $0000
[000c565e]                           dc.w $0015
[000c5660]                           dc.w $5540
[000c5662]                           dc.w $0000
[000c5664]                           dc.w $0010
[000c5666]                           dc.w $0040
[000c5668]                           dc.w $0000
[000c566a]                           dc.w $001f
[000c566c]                           dc.w $ffc0
[000c566e]                           dc.w $0000
[000c5670]                           dc.w $0018
[000c5672]                           dc.w $00c0
[000c5674]                           dc.w $0000
[000c5676]                           dc.w $001f
[000c5678]                           dc.w $ffc0
[000c567a]                           dc.w $0000
[000c567c]                           dc.w $0010
[000c567e]                           dc.w $0040
[000c5680]                           dc.w $0000
[000c5682]                           dc.w $0017
[000c5684]                           dc.w $fe40
[000c5686]                           dc.w $0000
[000c5688]                           dc.w $0010
[000c568a]                           dc.w $0040
[000c568c]                           dc.w $0000
[000c568e]                           dc.w $001f
[000c5690]                           dc.w $ffc0
[000c5692]                           dc.w $0000
[000c5694]                           dc.w $0000
[000c5696]                           dc.w $0000
[000c5698]                           dc.w $0000
[000c569a]                           dc.w $0000
[000c569c]                           dc.w $0000
[000c569e]                           dc.w $0000
[000c56a0]                           dc.w $0000
[000c56a2]                           dc.w $0000
[000c56a4]                           dc.w $0000
[000c56a6]                           dc.w $0000
[000c56a8]                           dc.w $0000
[000c56aa]                           dc.w $0000
[000c56ac]                           dc.w $0000
[000c56ae]                           dc.w $0000
[000c56b0]                           dc.w $0000
[000c56b2]                           dc.w $0000
[000c56b4]                           dc.w $0000
[000c56b6]                           dc.w $0000
[000c56b8]                           dc.w $0000
[000c56ba]                           dc.w $0000
[000c56bc]                           dc.w $0000
[000c56be]                           dc.w $0000
[000c56c0]                           dc.w $0000
[000c56c2]                           dc.w $0000
[000c56c4]                           dc.w $0000
[000c56c6]                           dc.w $0000
[000c56c8]                           dc.w $0000
[000c56ca]                           dc.w $0000
[000c56cc]                           dc.w $0000
[000c56ce]                           dc.w $0000
[000c56d0]                           dc.w $0000
[000c56d2]                           dc.w $0000
[000c56d4]                           dc.w $0000
[000c56d6]                           dc.w $1fff
[000c56d8]                           dc.w $ffff
[000c56da]                           dc.w $fff0
[000c56dc]                           dc.w $101f
[000c56de]                           dc.w $f000
[000c56e0]                           dc.w $0010
[000c56e2]                           dc.w $1798
[000c56e4]                           dc.w $33e0
[000c56e6]                           dc.w $0010
[000c56e8]                           dc.w $101f
[000c56ea]                           dc.w $f000
[000c56ec]                           dc.w $0010
[000c56ee]                           dc.w $1fff
[000c56f0]                           dc.w $ffff
[000c56f2]                           dc.w $fff0
[000c56f4]                           dc.w $0010
[000c56f6]                           dc.w $0040
[000c56f8]                           dc.w $0000
[000c56fa]                           dc.w $0017
[000c56fc]                           dc.w $ff40
[000c56fe]                           dc.w $0000
[000c5700]                           dc.w $0010
[000c5702]                           dc.w $0040
[000c5704]                           dc.w $0000
[000c5706]                           dc.w $0010
[000c5708]                           dc.w $0040
[000c570a]                           dc.w $0000
[000c570c]                           dc.w $0015
[000c570e]                           dc.w $5540
[000c5710]                           dc.w $0000
[000c5712]                           dc.w $0010
[000c5714]                           dc.w $0040
[000c5716]                           dc.w $0000
[000c5718]                           dc.w $001f
[000c571a]                           dc.w $ffc0
[000c571c]                           dc.w $0000
[000c571e]                           dc.w $0018
[000c5720]                           dc.w $00c0
[000c5722]                           dc.w $0000
[000c5724]                           dc.w $001f
[000c5726]                           dc.w $ffc0
[000c5728]                           dc.w $0000
[000c572a]                           dc.w $0010
[000c572c]                           dc.w $0040
[000c572e]                           dc.w $0000
[000c5730]                           dc.w $0017
[000c5732]                           dc.w $fe40
[000c5734]                           dc.w $0000
[000c5736]                           dc.w $0010
[000c5738]                           dc.w $0040
[000c573a]                           dc.w $0000
[000c573c]                           dc.w $001f
[000c573e]                           dc.w $ffc0
[000c5740]                           dc.w $0000
[000c5742]                           dc.w $0000
[000c5744]                           dc.w $0000
[000c5746]                           dc.w $0000
[000c5748]                           dc.w $0000
[000c574a]                           dc.w $0000
[000c574c]                           dc.w $0000
[000c574e]                           dc.w $0000
[000c5750]                           dc.w $0000
[000c5752]                           dc.w $0000
[000c5754]                           dc.w $0000
[000c5756]                           dc.w $0000
[000c5758]                           dc.w $0000
[000c575a]                           dc.w $0000
[000c575c]                           dc.w $0000
[000c575e]                           dc.w $0000
[000c5760]                           dc.w $0000
[000c5762]                           dc.w $0000
[000c5764]                           dc.w $0000
[000c5766]                           dc.w $0000
[000c5768]                           dc.w $0000
[000c576a]                           dc.w $0000
[000c576c]                           dc.w $0000
[000c576e]                           dc.w $0000
[000c5770]                           dc.w $0000
[000c5772]                           dc.w $0000
[000c5774]                           dc.w $0000
[000c5776]                           dc.w $0000
[000c5778]                           dc.w $0000
[000c577a]                           dc.w $0000
[000c577c]                           dc.w $0000
[000c577e]                           dc.w $0000
[000c5780]                           dc.w $0000
[000c5782]                           dc.w $0000
[000c5784]                           dc.w $1fff
[000c5786]                           dc.w $ffff
[000c5788]                           dc.w $fff0
[000c578a]                           dc.w $101f
[000c578c]                           dc.w $f000
[000c578e]                           dc.w $0018
[000c5790]                           dc.w $1798
[000c5792]                           dc.w $33e0
[000c5794]                           dc.w $0018
[000c5796]                           dc.w $101f
[000c5798]                           dc.w $f000
[000c579a]                           dc.w $0018
[000c579c]                           dc.w $1fff
[000c579e]                           dc.w $ffff
[000c57a0]                           dc.w $fff8
[000c57a2]                           dc.w $0ff0
[000c57a4]                           dc.w $007f
[000c57a6]                           dc.w $fff8
[000c57a8]                           dc.w $0017
[000c57aa]                           dc.w $ff60
[000c57ac]                           dc.w $0000
[000c57ae]                           dc.w $0010
[000c57b0]                           dc.w $0060
[000c57b2]                           dc.w $0000
[000c57b4]                           dc.w $0010
[000c57b6]                           dc.w $0060
[000c57b8]                           dc.w $0000
[000c57ba]                           dc.w $0015
[000c57bc]                           dc.w $5560
[000c57be]                           dc.w $0000
[000c57c0]                           dc.w $0010
[000c57c2]                           dc.w $0060
[000c57c4]                           dc.w $0000
[000c57c6]                           dc.w $001f
[000c57c8]                           dc.w $ffe0
[000c57ca]                           dc.w $0000
[000c57cc]                           dc.w $0018
[000c57ce]                           dc.w $00e0
[000c57d0]                           dc.w $0000
[000c57d2]                           dc.w $001f
[000c57d4]                           dc.w $ffe0
[000c57d6]                           dc.w $0000
[000c57d8]                           dc.w $0010
[000c57da]                           dc.w $0060
[000c57dc]                           dc.w $0000
[000c57de]                           dc.w $0017
[000c57e0]                           dc.w $fe60
[000c57e2]                           dc.w $0000
[000c57e4]                           dc.w $0010
[000c57e6]                           dc.w $0060
[000c57e8]                           dc.w $0000
[000c57ea]                           dc.w $001f
[000c57ec]                           dc.w $ffe0
[000c57ee]                           dc.w $0000
[000c57f0]                           dc.w $000f
[000c57f2]                           dc.w $ffe0
[000c57f4]                           dc.w $0000
[000c57f6]                           dc.w $0000
[000c57f8]                           dc.w $0000
[000c57fa]                           dc.w $0000
[000c57fc]                           dc.w $0000
[000c57fe]                           dc.w $0000
[000c5800]                           dc.w $0000
[000c5802]                           dc.w $0000
[000c5804]                           dc.w $0000
[000c5806]                           dc.w $0000
[000c5808]                           dc.w $0000
[000c580a]                           dc.w $0000
[000c580c]                           dc.w $0000
DATAS_06:
[000c580e]                           dc.w $0000
[000c5810]                           dc.w $0000
[000c5812]                           dc.w $0000
[000c5814]                           dc.w $0000
[000c5816]                           dc.w $0000
[000c5818]                           dc.w $0000
[000c581a]                           dc.w $0000
[000c581c]                           dc.w $0000
[000c581e]                           dc.w $0000
[000c5820]                           dc.w $0000
[000c5822]                           dc.w $0000
[000c5824]                           dc.w $0000
[000c5826]                           dc.w $0000
[000c5828]                           dc.w $0000
[000c582a]                           dc.w $0000
[000c582c]                           dc.w $0000
[000c582e]                           dc.w $0000
[000c5830]                           dc.w $0000
[000c5832]                           dc.w $1fff
[000c5834]                           dc.w $ffff
[000c5836]                           dc.w $fff0
[000c5838]                           dc.w $1fff
[000c583a]                           dc.w $ffff
[000c583c]                           dc.w $fff8
[000c583e]                           dc.w $1fff
[000c5840]                           dc.w $ffff
[000c5842]                           dc.w $fff8
[000c5844]                           dc.w $1fff
[000c5846]                           dc.w $ffff
[000c5848]                           dc.w $fff8
[000c584a]                           dc.w $1fff
[000c584c]                           dc.w $ffff
[000c584e]                           dc.w $fff8
[000c5850]                           dc.w $0fff
[000c5852]                           dc.w $ffff
[000c5854]                           dc.w $fff8
[000c5856]                           dc.w $001f
[000c5858]                           dc.w $ffe0
[000c585a]                           dc.w $0000
[000c585c]                           dc.w $001f
[000c585e]                           dc.w $ffe0
[000c5860]                           dc.w $0000
[000c5862]                           dc.w $001f
[000c5864]                           dc.w $ffe0
[000c5866]                           dc.w $0000
[000c5868]                           dc.w $001f
[000c586a]                           dc.w $ffe0
[000c586c]                           dc.w $0000
[000c586e]                           dc.w $001f
[000c5870]                           dc.w $ffe0
[000c5872]                           dc.w $0000
[000c5874]                           dc.w $001f
[000c5876]                           dc.w $ffe0
[000c5878]                           dc.w $0000
[000c587a]                           dc.w $001f
[000c587c]                           dc.w $ffe0
[000c587e]                           dc.w $0000
[000c5880]                           dc.w $001f
[000c5882]                           dc.w $ffe0
[000c5884]                           dc.w $0000
[000c5886]                           dc.w $001f
[000c5888]                           dc.w $ffe0
[000c588a]                           dc.w $0000
[000c588c]                           dc.w $001f
[000c588e]                           dc.w $ffe0
[000c5890]                           dc.w $0000
[000c5892]                           dc.w $001f
[000c5894]                           dc.w $ffe0
[000c5896]                           dc.w $0000
[000c5898]                           dc.w $001f
[000c589a]                           dc.w $ffe0
[000c589c]                           dc.w $0000
[000c589e]                           dc.w $000f
[000c58a0]                           dc.w $ffe0
[000c58a2]                           dc.w $0000
[000c58a4]                           dc.w $0000
[000c58a6]                           dc.w $0000
[000c58a8]                           dc.w $0000
[000c58aa]                           dc.w $0000
[000c58ac]                           dc.w $0000
[000c58ae]                           dc.w $0000
[000c58b0]                           dc.w $0000
[000c58b2]                           dc.w $0000
[000c58b4]                           dc.w $0000
[000c58b6]                           dc.w $0000
[000c58b8]                           dc.w $0000
[000c58ba]                           dc.w $0000
DATAS_07:
[000c58bc]                           dc.w $0000
[000c58be]                           dc.w $0000
[000c58c0]                           dc.w $02c0
[000c58c2]                           dc.w $0000
[000c58c4]                           dc.w $0000
[000c58c6]                           dc.w $0000
[000c58c8]                           dc.w $0000
[000c58ca]                           dc.w $0000
[000c58cc]                           dc.w $0000
[000c58ce]                           dc.w $0000
[000c58d0]                           dc.w $0000
[000c58d2]                           dc.w $0000
[000c58d4]                           dc.w $0000
[000c58d6]                           dc.w $0000
[000c58d8]                           dc.w $0000
[000c58da]                           dc.w $0000
[000c58dc]                           dc.w $0000
[000c58de]                           dc.w $0000
[000c58e0]                           dc.w $0000
[000c58e2]                           dc.w $0000
[000c58e4]                           dc.w $0000
[000c58e6]                           dc.w $007f
[000c58e8]                           dc.w $ff00
[000c58ea]                           dc.w $0000
[000c58ec]                           dc.w $007f
[000c58ee]                           dc.w $ff00
[000c58f0]                           dc.w $0000
[000c58f2]                           dc.w $007f
[000c58f4]                           dc.w $ff00
[000c58f6]                           dc.w $0000
[000c58f8]                           dc.w $007f
[000c58fa]                           dc.w $ff00
[000c58fc]                           dc.w $0000
[000c58fe]                           dc.w $007f
[000c5900]                           dc.w $ff00
[000c5902]                           dc.w $0000
[000c5904]                           dc.w $007f
[000c5906]                           dc.w $ff00
[000c5908]                           dc.w $0000
[000c590a]                           dc.w $007f
[000c590c]                           dc.w $ff00
[000c590e]                           dc.w $0000
[000c5910]                           dc.w $007f
[000c5912]                           dc.w $ffff
[000c5914]                           dc.w $f000
[000c5916]                           dc.w $0070
[000c5918]                           dc.w $07ff
[000c591a]                           dc.w $f000
[000c591c]                           dc.w $007f
[000c591e]                           dc.w $ffff
[000c5920]                           dc.w $f000
[000c5922]                           dc.w $007f
[000c5924]                           dc.w $ffff
[000c5926]                           dc.w $f000
[000c5928]                           dc.w $007f
[000c592a]                           dc.w $ffff
[000c592c]                           dc.w $f000
[000c592e]                           dc.w $007f
[000c5930]                           dc.w $ffc0
[000c5932]                           dc.w $7000
[000c5934]                           dc.w $007f
[000c5936]                           dc.w $ffff
[000c5938]                           dc.w $f000
[000c593a]                           dc.w $007f
[000c593c]                           dc.w $ffff
[000c593e]                           dc.w $f000
[000c5940]                           dc.w $007f
[000c5942]                           dc.w $ff00
[000c5944]                           dc.w $0000
[000c5946]                           dc.w $007f
[000c5948]                           dc.w $ff00
[000c594a]                           dc.w $0000
[000c594c]                           dc.w $0000
[000c594e]                           dc.w $0000
[000c5950]                           dc.w $0000
[000c5952]                           dc.w $0000
[000c5954]                           dc.w $0000
[000c5956]                           dc.w $0000
[000c5958]                           dc.w $0000
[000c595a]                           dc.w $0000
[000c595c]                           dc.w $0000
[000c595e]                           dc.w $0000
[000c5960]                           dc.w $0000
[000c5962]                           dc.w $0000
[000c5964]                           dc.w $0000
[000c5966]                           dc.w $0000
[000c5968]                           dc.w $0000
[000c596a]                           dc.w $0000
[000c596c]                           dc.w $0000
[000c596e]                           dc.w $0000
[000c5970]                           dc.w $0000
[000c5972]                           dc.w $0000
[000c5974]                           dc.w $0000
[000c5976]                           dc.w $0000
[000c5978]                           dc.w $0000
[000c597a]                           dc.w $0000
[000c597c]                           dc.w $0000
[000c597e]                           dc.w $0000
[000c5980]                           dc.w $0000
[000c5982]                           dc.w $0000
[000c5984]                           dc.w $0000
[000c5986]                           dc.w $0000
[000c5988]                           dc.w $0000
[000c598a]                           dc.w $0000
[000c598c]                           dc.w $0000
[000c598e]                           dc.w $0000
[000c5990]                           dc.w $0000
[000c5992]                           dc.w $0000
[000c5994]                           dc.w $007f
[000c5996]                           dc.w $ff00
[000c5998]                           dc.w $0000
[000c599a]                           dc.w $007f
[000c599c]                           dc.w $ff00
[000c599e]                           dc.w $0000
[000c59a0]                           dc.w $007f
[000c59a2]                           dc.w $ff00
[000c59a4]                           dc.w $0000
[000c59a6]                           dc.w $007f
[000c59a8]                           dc.w $ff00
[000c59aa]                           dc.w $0000
[000c59ac]                           dc.w $007f
[000c59ae]                           dc.w $ff00
[000c59b0]                           dc.w $0000
[000c59b2]                           dc.w $007f
[000c59b4]                           dc.w $ff00
[000c59b6]                           dc.w $0000
[000c59b8]                           dc.w $007f
[000c59ba]                           dc.w $ff00
[000c59bc]                           dc.w $0000
[000c59be]                           dc.w $007f
[000c59c0]                           dc.w $ffff
[000c59c2]                           dc.w $f000
[000c59c4]                           dc.w $0070
[000c59c6]                           dc.w $07ff
[000c59c8]                           dc.w $f000
[000c59ca]                           dc.w $007f
[000c59cc]                           dc.w $ffff
[000c59ce]                           dc.w $f000
[000c59d0]                           dc.w $007f
[000c59d2]                           dc.w $ffff
[000c59d4]                           dc.w $f000
[000c59d6]                           dc.w $007f
[000c59d8]                           dc.w $ffff
[000c59da]                           dc.w $f000
[000c59dc]                           dc.w $007f
[000c59de]                           dc.w $ffc0
[000c59e0]                           dc.w $7000
[000c59e2]                           dc.w $007f
[000c59e4]                           dc.w $ffff
[000c59e6]                           dc.w $f000
[000c59e8]                           dc.w $007f
[000c59ea]                           dc.w $ffff
[000c59ec]                           dc.w $f000
[000c59ee]                           dc.w $007f
[000c59f0]                           dc.w $ff00
[000c59f2]                           dc.w $0000
[000c59f4]                           dc.w $007f
[000c59f6]                           dc.w $ff00
[000c59f8]                           dc.w $0000
[000c59fa]                           dc.w $0000
[000c59fc]                           dc.w $0000
[000c59fe]                           dc.w $0000
[000c5a00]                           dc.w $0000
[000c5a02]                           dc.w $0000
[000c5a04]                           dc.w $0000
[000c5a06]                           dc.w $0000
[000c5a08]                           dc.w $0000
[000c5a0a]                           dc.w $0000
[000c5a0c]                           dc.w $0000
[000c5a0e]                           dc.w $0000
[000c5a10]                           dc.w $0000
[000c5a12]                           dc.w $0000
[000c5a14]                           dc.w $0000
[000c5a16]                           dc.w $0000
[000c5a18]                           dc.w $0000
[000c5a1a]                           dc.w $0000
[000c5a1c]                           dc.w $0000
[000c5a1e]                           dc.w $0000
[000c5a20]                           dc.w $0000
[000c5a22]                           dc.w $0000
[000c5a24]                           dc.w $0000
[000c5a26]                           dc.w $0000
[000c5a28]                           dc.w $0000
[000c5a2a]                           dc.w $0000
[000c5a2c]                           dc.w $0000
[000c5a2e]                           dc.w $0000
[000c5a30]                           dc.w $0000
[000c5a32]                           dc.w $0000
[000c5a34]                           dc.w $0000
[000c5a36]                           dc.w $0000
[000c5a38]                           dc.w $0000
[000c5a3a]                           dc.w $0000
[000c5a3c]                           dc.w $0000
[000c5a3e]                           dc.w $0000
[000c5a40]                           dc.w $0000
[000c5a42]                           dc.w $007f
[000c5a44]                           dc.w $ff00
[000c5a46]                           dc.w $0000
[000c5a48]                           dc.w $007f
[000c5a4a]                           dc.w $ff00
[000c5a4c]                           dc.w $0000
[000c5a4e]                           dc.w $007f
[000c5a50]                           dc.w $ff00
[000c5a52]                           dc.w $0000
[000c5a54]                           dc.w $007f
[000c5a56]                           dc.w $ff00
[000c5a58]                           dc.w $0000
[000c5a5a]                           dc.w $007f
[000c5a5c]                           dc.w $ff00
[000c5a5e]                           dc.w $0000
[000c5a60]                           dc.w $007f
[000c5a62]                           dc.w $ff00
[000c5a64]                           dc.w $0000
[000c5a66]                           dc.w $007f
[000c5a68]                           dc.w $ff00
[000c5a6a]                           dc.w $0000
[000c5a6c]                           dc.w $007f
[000c5a6e]                           dc.w $ffff
[000c5a70]                           dc.w $f000
[000c5a72]                           dc.w $0070
[000c5a74]                           dc.w $07ff
[000c5a76]                           dc.w $f000
[000c5a78]                           dc.w $007f
[000c5a7a]                           dc.w $ffff
[000c5a7c]                           dc.w $f000
[000c5a7e]                           dc.w $007f
[000c5a80]                           dc.w $ffff
[000c5a82]                           dc.w $f000
[000c5a84]                           dc.w $007f
[000c5a86]                           dc.w $ffff
[000c5a88]                           dc.w $f000
[000c5a8a]                           dc.w $007f
[000c5a8c]                           dc.w $ffc0
[000c5a8e]                           dc.w $7000
[000c5a90]                           dc.w $007f
[000c5a92]                           dc.w $ffff
[000c5a94]                           dc.w $f000
[000c5a96]                           dc.w $007f
[000c5a98]                           dc.w $ffff
[000c5a9a]                           dc.w $f000
[000c5a9c]                           dc.w $007f
[000c5a9e]                           dc.w $ff00
[000c5aa0]                           dc.w $0000
[000c5aa2]                           dc.w $007f
[000c5aa4]                           dc.w $ff00
[000c5aa6]                           dc.w $0000
[000c5aa8]                           dc.w $0000
[000c5aaa]                           dc.w $0000
[000c5aac]                           dc.w $0000
[000c5aae]                           dc.w $0000
[000c5ab0]                           dc.w $0000
[000c5ab2]                           dc.w $0000
[000c5ab4]                           dc.w $0000
[000c5ab6]                           dc.w $0000
[000c5ab8]                           dc.w $0000
[000c5aba]                           dc.w $0000
[000c5abc]                           dc.w $0000
[000c5abe]                           dc.w $0000
[000c5ac0]                           dc.w $0000
[000c5ac2]                           dc.w $0000
[000c5ac4]                           dc.w $0000
[000c5ac6]                           dc.w $0000
[000c5ac8]                           dc.w $0000
[000c5aca]                           dc.w $0000
[000c5acc]                           dc.w $0000
[000c5ace]                           dc.w $0000
[000c5ad0]                           dc.w $0000
[000c5ad2]                           dc.w $0000
[000c5ad4]                           dc.w $0000
[000c5ad6]                           dc.w $0000
[000c5ad8]                           dc.w $0000
[000c5ada]                           dc.w $0000
[000c5adc]                           dc.w $0000
[000c5ade]                           dc.w $0000
[000c5ae0]                           dc.w $0000
[000c5ae2]                           dc.w $0000
[000c5ae4]                           dc.w $0000
[000c5ae6]                           dc.w $0000
[000c5ae8]                           dc.w $0000
[000c5aea]                           dc.w $0000
[000c5aec]                           dc.w $0000
[000c5aee]                           dc.w $0000
[000c5af0]                           dc.w $007f
[000c5af2]                           dc.w $ff00
[000c5af4]                           dc.w $0000
[000c5af6]                           dc.w $0040
[000c5af8]                           dc.w $0180
[000c5afa]                           dc.w $0000
[000c5afc]                           dc.w $004f
[000c5afe]                           dc.w $f980
[000c5b00]                           dc.w $0000
[000c5b02]                           dc.w $0040
[000c5b04]                           dc.w $0180
[000c5b06]                           dc.w $0000
[000c5b08]                           dc.w $0040
[000c5b0a]                           dc.w $0180
[000c5b0c]                           dc.w $0000
[000c5b0e]                           dc.w $0055
[000c5b10]                           dc.w $5580
[000c5b12]                           dc.w $0000
[000c5b14]                           dc.w $0040
[000c5b16]                           dc.w $0180
[000c5b18]                           dc.w $0000
[000c5b1a]                           dc.w $007f
[000c5b1c]                           dc.w $ffff
[000c5b1e]                           dc.w $f000
[000c5b20]                           dc.w $0070
[000c5b22]                           dc.w $0700
[000c5b24]                           dc.w $1800
[000c5b26]                           dc.w $007f
[000c5b28]                           dc.w $ff3f
[000c5b2a]                           dc.w $9800
[000c5b2c]                           dc.w $0040
[000c5b2e]                           dc.w $0100
[000c5b30]                           dc.w $1800
[000c5b32]                           dc.w $004f
[000c5b34]                           dc.w $f9ff
[000c5b36]                           dc.w $f800
[000c5b38]                           dc.w $0040
[000c5b3a]                           dc.w $01c0
[000c5b3c]                           dc.w $7800
[000c5b3e]                           dc.w $0040
[000c5b40]                           dc.w $01ff
[000c5b42]                           dc.w $f800
[000c5b44]                           dc.w $004f
[000c5b46]                           dc.w $f9ff
[000c5b48]                           dc.w $f800
[000c5b4a]                           dc.w $0040
[000c5b4c]                           dc.w $01ff
[000c5b4e]                           dc.w $f800
[000c5b50]                           dc.w $007f
[000c5b52]                           dc.w $ff80
[000c5b54]                           dc.w $0000
[000c5b56]                           dc.w $003f
[000c5b58]                           dc.w $ff80
[000c5b5a]                           dc.w $0000
[000c5b5c]                           dc.w $0000
[000c5b5e]                           dc.w $0000
[000c5b60]                           dc.w $0000
[000c5b62]                           dc.w $0000
[000c5b64]                           dc.w $0000
[000c5b66]                           dc.w $0000
[000c5b68]                           dc.w $0000
[000c5b6a]                           dc.w $0000
[000c5b6c]                           dc.w $0000
[000c5b6e]                           dc.w $0000
[000c5b70]                           dc.w $0000
[000c5b72]                           dc.w $0000
[000c5b74]                           dc.w $0000
[000c5b76]                           dc.w $0000
[000c5b78]                           dc.w $0000
DATAS_08:
[000c5b7a]                           dc.w $0000
[000c5b7c]                           dc.w $0000
[000c5b7e]                           dc.w $0000
[000c5b80]                           dc.w $0000
[000c5b82]                           dc.w $0000
[000c5b84]                           dc.w $0000
[000c5b86]                           dc.w $0000
[000c5b88]                           dc.w $0000
[000c5b8a]                           dc.w $0000
[000c5b8c]                           dc.w $0000
[000c5b8e]                           dc.w $0000
[000c5b90]                           dc.w $0000
[000c5b92]                           dc.w $0000
[000c5b94]                           dc.w $0000
[000c5b96]                           dc.w $0000
[000c5b98]                           dc.w $0000
[000c5b9a]                           dc.w $0000
[000c5b9c]                           dc.w $0000
[000c5b9e]                           dc.w $007f
[000c5ba0]                           dc.w $ff00
[000c5ba2]                           dc.w $0000
[000c5ba4]                           dc.w $007f
[000c5ba6]                           dc.w $ff80
[000c5ba8]                           dc.w $0000
[000c5baa]                           dc.w $007f
[000c5bac]                           dc.w $ff80
[000c5bae]                           dc.w $0000
[000c5bb0]                           dc.w $007f
[000c5bb2]                           dc.w $ff80
[000c5bb4]                           dc.w $0000
[000c5bb6]                           dc.w $007f
[000c5bb8]                           dc.w $ff80
[000c5bba]                           dc.w $0000
[000c5bbc]                           dc.w $007f
[000c5bbe]                           dc.w $ff80
[000c5bc0]                           dc.w $0000
[000c5bc2]                           dc.w $007f
[000c5bc4]                           dc.w $ff80
[000c5bc6]                           dc.w $0000
[000c5bc8]                           dc.w $007f
[000c5bca]                           dc.w $ffff
[000c5bcc]                           dc.w $f000
[000c5bce]                           dc.w $007f
[000c5bd0]                           dc.w $ffff
[000c5bd2]                           dc.w $f800
[000c5bd4]                           dc.w $007f
[000c5bd6]                           dc.w $ffff
[000c5bd8]                           dc.w $f800
[000c5bda]                           dc.w $007f
[000c5bdc]                           dc.w $ffff
[000c5bde]                           dc.w $f800
[000c5be0]                           dc.w $007f
[000c5be2]                           dc.w $ffff
[000c5be4]                           dc.w $f800
[000c5be6]                           dc.w $007f
[000c5be8]                           dc.w $ffff
[000c5bea]                           dc.w $f800
[000c5bec]                           dc.w $007f
[000c5bee]                           dc.w $ffff
[000c5bf0]                           dc.w $f800
[000c5bf2]                           dc.w $007f
[000c5bf4]                           dc.w $ffff
[000c5bf6]                           dc.w $f800
[000c5bf8]                           dc.w $007f
[000c5bfa]                           dc.w $ffff
[000c5bfc]                           dc.w $f800
[000c5bfe]                           dc.w $007f
[000c5c00]                           dc.w $ff80
[000c5c02]                           dc.w $0000
[000c5c04]                           dc.w $003f
[000c5c06]                           dc.w $ff80
[000c5c08]                           dc.w $0000
[000c5c0a]                           dc.w $0000
[000c5c0c]                           dc.w $0000
[000c5c0e]                           dc.w $0000
[000c5c10]                           dc.w $0000
[000c5c12]                           dc.w $0000
[000c5c14]                           dc.w $0000
[000c5c16]                           dc.w $0000
[000c5c18]                           dc.w $0000
[000c5c1a]                           dc.w $0000
[000c5c1c]                           dc.w $0000
[000c5c1e]                           dc.w $0000
[000c5c20]                           dc.w $0000
[000c5c22]                           dc.w $0000
[000c5c24]                           dc.w $0000
[000c5c26]                           dc.w $0000
DATAS_09:
[000c5c28]                           dc.w $0000
[000c5c2a]                           dc.w $0000
[000c5c2c]                           dc.w $02c0
[000c5c2e]                           dc.w $0000
[000c5c30]                           dc.w $0000
[000c5c32]                           dc.w $0000
[000c5c34]                           dc.w $0000
[000c5c36]                           dc.w $0000
[000c5c38]                           dc.w $0000
[000c5c3a]                           dc.w $0000
[000c5c3c]                           dc.w $0000
[000c5c3e]                           dc.w $0000
[000c5c40]                           dc.w $0000
[000c5c42]                           dc.w $0000
[000c5c44]                           dc.w $0000
[000c5c46]                           dc.w $0000
[000c5c48]                           dc.w $0000
[000c5c4a]                           dc.w $0000
[000c5c4c]                           dc.w $0000
[000c5c4e]                           dc.w $0000
[000c5c50]                           dc.w $0000
[000c5c52]                           dc.w $007f
[000c5c54]                           dc.w $ff00
[000c5c56]                           dc.w $0000
[000c5c58]                           dc.w $007f
[000c5c5a]                           dc.w $ff00
[000c5c5c]                           dc.w $0000
[000c5c5e]                           dc.w $007f
[000c5c60]                           dc.w $ff00
[000c5c62]                           dc.w $0000
[000c5c64]                           dc.w $007f
[000c5c66]                           dc.w $ff00
[000c5c68]                           dc.w $0000
[000c5c6a]                           dc.w $007f
[000c5c6c]                           dc.w $ff00
[000c5c6e]                           dc.w $0000
[000c5c70]                           dc.w $007f
[000c5c72]                           dc.w $ff00
[000c5c74]                           dc.w $0000
[000c5c76]                           dc.w $007f
[000c5c78]                           dc.w $ff00
[000c5c7a]                           dc.w $0000
[000c5c7c]                           dc.w $007f
[000c5c7e]                           dc.w $ffff
[000c5c80]                           dc.w $f000
[000c5c82]                           dc.w $0070
[000c5c84]                           dc.w $07ff
[000c5c86]                           dc.w $f000
[000c5c88]                           dc.w $007f
[000c5c8a]                           dc.w $ffff
[000c5c8c]                           dc.w $f000
[000c5c8e]                           dc.w $007f
[000c5c90]                           dc.w $ffff
[000c5c92]                           dc.w $f000
[000c5c94]                           dc.w $007f
[000c5c96]                           dc.w $ffff
[000c5c98]                           dc.w $f000
[000c5c9a]                           dc.w $007f
[000c5c9c]                           dc.w $ffc0
[000c5c9e]                           dc.w $7000
[000c5ca0]                           dc.w $007f
[000c5ca2]                           dc.w $ffff
[000c5ca4]                           dc.w $f000
[000c5ca6]                           dc.w $007f
[000c5ca8]                           dc.w $ffff
[000c5caa]                           dc.w $f000
[000c5cac]                           dc.w $007f
[000c5cae]                           dc.w $ff00
[000c5cb0]                           dc.w $0000
[000c5cb2]                           dc.w $007f
[000c5cb4]                           dc.w $ff00
[000c5cb6]                           dc.w $0000
[000c5cb8]                           dc.w $0000
[000c5cba]                           dc.w $0000
[000c5cbc]                           dc.w $0000
[000c5cbe]                           dc.w $0000
[000c5cc0]                           dc.w $0000
[000c5cc2]                           dc.w $0000
[000c5cc4]                           dc.w $0000
[000c5cc6]                           dc.w $0000
[000c5cc8]                           dc.w $0000
[000c5cca]                           dc.w $0000
[000c5ccc]                           dc.w $0000
[000c5cce]                           dc.w $0000
[000c5cd0]                           dc.w $0000
[000c5cd2]                           dc.w $0000
[000c5cd4]                           dc.w $0000
[000c5cd6]                           dc.w $0000
[000c5cd8]                           dc.w $0000
[000c5cda]                           dc.w $0000
[000c5cdc]                           dc.w $0000
[000c5cde]                           dc.w $0000
[000c5ce0]                           dc.w $0000
[000c5ce2]                           dc.w $0000
[000c5ce4]                           dc.w $0000
[000c5ce6]                           dc.w $0000
[000c5ce8]                           dc.w $0000
[000c5cea]                           dc.w $0000
[000c5cec]                           dc.w $0000
[000c5cee]                           dc.w $0000
[000c5cf0]                           dc.w $0000
[000c5cf2]                           dc.w $0000
[000c5cf4]                           dc.w $0000
[000c5cf6]                           dc.w $0000
[000c5cf8]                           dc.w $0000
[000c5cfa]                           dc.w $0000
[000c5cfc]                           dc.w $0000
[000c5cfe]                           dc.w $0000
[000c5d00]                           dc.w $007f
[000c5d02]                           dc.w $ff00
[000c5d04]                           dc.w $0000
[000c5d06]                           dc.w $007f
[000c5d08]                           dc.w $ff00
[000c5d0a]                           dc.w $0000
[000c5d0c]                           dc.w $007f
[000c5d0e]                           dc.w $ff00
[000c5d10]                           dc.w $0000
[000c5d12]                           dc.w $007f
[000c5d14]                           dc.w $ff00
[000c5d16]                           dc.w $0000
[000c5d18]                           dc.w $007f
[000c5d1a]                           dc.w $ff00
[000c5d1c]                           dc.w $0000
[000c5d1e]                           dc.w $007f
[000c5d20]                           dc.w $ff00
[000c5d22]                           dc.w $0000
[000c5d24]                           dc.w $007f
[000c5d26]                           dc.w $ff00
[000c5d28]                           dc.w $0000
[000c5d2a]                           dc.w $007f
[000c5d2c]                           dc.w $ffff
[000c5d2e]                           dc.w $f000
[000c5d30]                           dc.w $0070
[000c5d32]                           dc.w $07ff
[000c5d34]                           dc.w $f000
[000c5d36]                           dc.w $007f
[000c5d38]                           dc.w $ffff
[000c5d3a]                           dc.w $f000
[000c5d3c]                           dc.w $007f
[000c5d3e]                           dc.w $ffff
[000c5d40]                           dc.w $f000
[000c5d42]                           dc.w $007f
[000c5d44]                           dc.w $ffff
[000c5d46]                           dc.w $f000
[000c5d48]                           dc.w $007f
[000c5d4a]                           dc.w $ffc0
[000c5d4c]                           dc.w $7000
[000c5d4e]                           dc.w $007f
[000c5d50]                           dc.w $ffff
[000c5d52]                           dc.w $f000
[000c5d54]                           dc.w $007f
[000c5d56]                           dc.w $ffff
[000c5d58]                           dc.w $f000
[000c5d5a]                           dc.w $007f
[000c5d5c]                           dc.w $ff00
[000c5d5e]                           dc.w $0000
[000c5d60]                           dc.w $007f
[000c5d62]                           dc.w $ff00
[000c5d64]                           dc.w $0000
[000c5d66]                           dc.w $0000
[000c5d68]                           dc.w $0000
[000c5d6a]                           dc.w $0000
[000c5d6c]                           dc.w $0000
[000c5d6e]                           dc.w $0000
[000c5d70]                           dc.w $0000
[000c5d72]                           dc.w $0000
[000c5d74]                           dc.w $0000
[000c5d76]                           dc.w $0000
[000c5d78]                           dc.w $0000
[000c5d7a]                           dc.w $0000
[000c5d7c]                           dc.w $0000
[000c5d7e]                           dc.w $0000
[000c5d80]                           dc.w $0000
[000c5d82]                           dc.w $0000
[000c5d84]                           dc.w $0000
[000c5d86]                           dc.w $0000
[000c5d88]                           dc.w $0000
[000c5d8a]                           dc.w $0000
[000c5d8c]                           dc.w $0000
[000c5d8e]                           dc.w $0000
[000c5d90]                           dc.w $0000
[000c5d92]                           dc.w $0000
[000c5d94]                           dc.w $0000
[000c5d96]                           dc.w $0000
[000c5d98]                           dc.w $0000
[000c5d9a]                           dc.w $0000
[000c5d9c]                           dc.w $0000
[000c5d9e]                           dc.w $0000
[000c5da0]                           dc.w $0000
[000c5da2]                           dc.w $0000
[000c5da4]                           dc.w $0000
[000c5da6]                           dc.w $0000
[000c5da8]                           dc.w $0000
[000c5daa]                           dc.w $0000
[000c5dac]                           dc.w $0000
[000c5dae]                           dc.w $007f
[000c5db0]                           dc.w $ff00
[000c5db2]                           dc.w $0000
[000c5db4]                           dc.w $007f
[000c5db6]                           dc.w $ff00
[000c5db8]                           dc.w $0000
[000c5dba]                           dc.w $007f
[000c5dbc]                           dc.w $ff00
[000c5dbe]                           dc.w $0000
[000c5dc0]                           dc.w $007f
[000c5dc2]                           dc.w $ff00
[000c5dc4]                           dc.w $0000
[000c5dc6]                           dc.w $007f
[000c5dc8]                           dc.w $ff00
[000c5dca]                           dc.w $0000
[000c5dcc]                           dc.w $007f
[000c5dce]                           dc.w $ff00
[000c5dd0]                           dc.w $0000
[000c5dd2]                           dc.w $007f
[000c5dd4]                           dc.w $ff00
[000c5dd6]                           dc.w $0000
[000c5dd8]                           dc.w $007f
[000c5dda]                           dc.w $ffff
[000c5ddc]                           dc.w $f000
[000c5dde]                           dc.w $0070
[000c5de0]                           dc.w $07ff
[000c5de2]                           dc.w $f000
[000c5de4]                           dc.w $007f
[000c5de6]                           dc.w $ffff
[000c5de8]                           dc.w $f000
[000c5dea]                           dc.w $007f
[000c5dec]                           dc.w $ffff
[000c5dee]                           dc.w $f000
[000c5df0]                           dc.w $007f
[000c5df2]                           dc.w $ffff
[000c5df4]                           dc.w $f000
[000c5df6]                           dc.w $007f
[000c5df8]                           dc.w $ffc0
[000c5dfa]                           dc.w $7000
[000c5dfc]                           dc.w $007f
[000c5dfe]                           dc.w $ffff
[000c5e00]                           dc.w $f000
[000c5e02]                           dc.w $007f
[000c5e04]                           dc.w $ffff
[000c5e06]                           dc.w $f000
[000c5e08]                           dc.w $007f
[000c5e0a]                           dc.w $ff00
[000c5e0c]                           dc.w $0000
[000c5e0e]                           dc.w $007f
[000c5e10]                           dc.w $ff00
[000c5e12]                           dc.w $0000
[000c5e14]                           dc.w $0000
[000c5e16]                           dc.w $0000
[000c5e18]                           dc.w $0000
[000c5e1a]                           dc.w $0000
[000c5e1c]                           dc.w $0000
[000c5e1e]                           dc.w $0000
[000c5e20]                           dc.w $0000
[000c5e22]                           dc.w $0000
[000c5e24]                           dc.w $0000
[000c5e26]                           dc.w $0000
[000c5e28]                           dc.w $0000
[000c5e2a]                           dc.w $0000
[000c5e2c]                           dc.w $0000
[000c5e2e]                           dc.w $0000
[000c5e30]                           dc.w $0000
[000c5e32]                           dc.w $0000
[000c5e34]                           dc.w $0000
[000c5e36]                           dc.w $0000
[000c5e38]                           dc.w $0000
[000c5e3a]                           dc.w $0000
[000c5e3c]                           dc.w $0000
[000c5e3e]                           dc.w $0000
[000c5e40]                           dc.w $0000
[000c5e42]                           dc.w $0000
[000c5e44]                           dc.w $0000
[000c5e46]                           dc.w $0000
[000c5e48]                           dc.w $0000
[000c5e4a]                           dc.w $0000
[000c5e4c]                           dc.w $0000
[000c5e4e]                           dc.w $0000
[000c5e50]                           dc.w $0000
[000c5e52]                           dc.w $0000
[000c5e54]                           dc.w $0000
[000c5e56]                           dc.w $0000
[000c5e58]                           dc.w $0000
[000c5e5a]                           dc.w $0000
[000c5e5c]                           dc.w $007f
[000c5e5e]                           dc.w $ff00
[000c5e60]                           dc.w $0000
[000c5e62]                           dc.w $0040
[000c5e64]                           dc.w $0180
[000c5e66]                           dc.w $0000
[000c5e68]                           dc.w $004f
[000c5e6a]                           dc.w $f980
[000c5e6c]                           dc.w $0000
[000c5e6e]                           dc.w $0040
[000c5e70]                           dc.w $0180
[000c5e72]                           dc.w $0000
[000c5e74]                           dc.w $0040
[000c5e76]                           dc.w $0180
[000c5e78]                           dc.w $0000
[000c5e7a]                           dc.w $0055
[000c5e7c]                           dc.w $5580
[000c5e7e]                           dc.w $0000
[000c5e80]                           dc.w $0040
[000c5e82]                           dc.w $0180
[000c5e84]                           dc.w $0000
[000c5e86]                           dc.w $007f
[000c5e88]                           dc.w $ffff
[000c5e8a]                           dc.w $f000
[000c5e8c]                           dc.w $0070
[000c5e8e]                           dc.w $0700
[000c5e90]                           dc.w $1800
[000c5e92]                           dc.w $007f
[000c5e94]                           dc.w $ff3f
[000c5e96]                           dc.w $9800
[000c5e98]                           dc.w $0040
[000c5e9a]                           dc.w $0100
[000c5e9c]                           dc.w $1800
[000c5e9e]                           dc.w $004f
[000c5ea0]                           dc.w $f9ff
[000c5ea2]                           dc.w $f800
[000c5ea4]                           dc.w $0040
[000c5ea6]                           dc.w $01c0
[000c5ea8]                           dc.w $7800
[000c5eaa]                           dc.w $0040
[000c5eac]                           dc.w $01ff
[000c5eae]                           dc.w $f800
[000c5eb0]                           dc.w $004f
[000c5eb2]                           dc.w $f9ff
[000c5eb4]                           dc.w $f800
[000c5eb6]                           dc.w $0040
[000c5eb8]                           dc.w $01ff
[000c5eba]                           dc.w $f800
[000c5ebc]                           dc.w $007f
[000c5ebe]                           dc.w $ff80
[000c5ec0]                           dc.w $0000
[000c5ec2]                           dc.w $003f
[000c5ec4]                           dc.w $ff80
[000c5ec6]                           dc.w $0000
[000c5ec8]                           dc.w $0000
[000c5eca]                           dc.w $0000
[000c5ecc]                           dc.w $0000
[000c5ece]                           dc.w $0000
[000c5ed0]                           dc.w $0000
[000c5ed2]                           dc.w $0000
[000c5ed4]                           dc.w $0000
[000c5ed6]                           dc.w $0000
[000c5ed8]                           dc.w $0000
[000c5eda]                           dc.w $0000
[000c5edc]                           dc.w $0000
[000c5ede]                           dc.w $0000
[000c5ee0]                           dc.w $0000
[000c5ee2]                           dc.w $0000
[000c5ee4]                           dc.w $0000
DATAS_10:
[000c5ee6]                           dc.w $0000
[000c5ee8]                           dc.w $0000
[000c5eea]                           dc.w $0000
[000c5eec]                           dc.w $0000
[000c5eee]                           dc.w $0000
[000c5ef0]                           dc.w $0000
[000c5ef2]                           dc.w $0000
[000c5ef4]                           dc.w $0000
[000c5ef6]                           dc.w $0000
[000c5ef8]                           dc.w $0000
[000c5efa]                           dc.w $0000
[000c5efc]                           dc.w $0000
[000c5efe]                           dc.w $0000
[000c5f00]                           dc.w $0000
[000c5f02]                           dc.w $0000
[000c5f04]                           dc.w $0000
[000c5f06]                           dc.w $0000
[000c5f08]                           dc.w $0000
[000c5f0a]                           dc.w $007f
[000c5f0c]                           dc.w $ff00
[000c5f0e]                           dc.w $0000
[000c5f10]                           dc.w $007f
[000c5f12]                           dc.w $ff80
[000c5f14]                           dc.w $0000
[000c5f16]                           dc.w $007f
[000c5f18]                           dc.w $ff80
[000c5f1a]                           dc.w $0000
[000c5f1c]                           dc.w $007f
[000c5f1e]                           dc.w $ff80
[000c5f20]                           dc.w $0000
[000c5f22]                           dc.w $007f
[000c5f24]                           dc.w $ff80
[000c5f26]                           dc.w $0000
[000c5f28]                           dc.w $007f
[000c5f2a]                           dc.w $ff80
[000c5f2c]                           dc.w $0000
[000c5f2e]                           dc.w $007f
[000c5f30]                           dc.w $ff80
[000c5f32]                           dc.w $0000
[000c5f34]                           dc.w $007f
[000c5f36]                           dc.w $ffff
[000c5f38]                           dc.w $f000
[000c5f3a]                           dc.w $007f
[000c5f3c]                           dc.w $ffff
[000c5f3e]                           dc.w $f800
[000c5f40]                           dc.w $007f
[000c5f42]                           dc.w $ffff
[000c5f44]                           dc.w $f800
[000c5f46]                           dc.w $007f
[000c5f48]                           dc.w $ffff
[000c5f4a]                           dc.w $f800
[000c5f4c]                           dc.w $007f
[000c5f4e]                           dc.w $ffff
[000c5f50]                           dc.w $f800
[000c5f52]                           dc.w $007f
[000c5f54]                           dc.w $ffff
[000c5f56]                           dc.w $f800
[000c5f58]                           dc.w $007f
[000c5f5a]                           dc.w $ffff
[000c5f5c]                           dc.w $f800
[000c5f5e]                           dc.w $007f
[000c5f60]                           dc.w $ffff
[000c5f62]                           dc.w $f800
[000c5f64]                           dc.w $007f
[000c5f66]                           dc.w $ffff
[000c5f68]                           dc.w $f800
[000c5f6a]                           dc.w $007f
[000c5f6c]                           dc.w $ff80
[000c5f6e]                           dc.w $0000
[000c5f70]                           dc.w $003f
[000c5f72]                           dc.w $ff80
[000c5f74]                           dc.w $0000
[000c5f76]                           dc.w $0000
[000c5f78]                           dc.w $0000
[000c5f7a]                           dc.w $0000
[000c5f7c]                           dc.w $0000
[000c5f7e]                           dc.w $0000
[000c5f80]                           dc.w $0000
[000c5f82]                           dc.w $0000
[000c5f84]                           dc.w $0000
[000c5f86]                           dc.w $0000
[000c5f88]                           dc.w $0000
[000c5f8a]                           dc.w $0000
[000c5f8c]                           dc.w $0000
[000c5f8e]                           dc.w $0000
[000c5f90]                           dc.w $0000
[000c5f92]                           dc.w $0000
DATAS_11:
[000c5f94]                           dc.w $0000
[000c5f96]                           dc.w $0000
[000c5f98]                           dc.w $02f0
[000c5f9a]                           dc.w $0000
[000c5f9c]                           dc.w $0000
[000c5f9e]                           dc.w $0000
[000c5fa0]                           dc.w $7fff
[000c5fa2]                           dc.w $ffff
[000c5fa4]                           dc.w $fffe
[000c5fa6]                           dc.w $4000
[000c5fa8]                           dc.w $0000
[000c5faa]                           dc.w $0002
[000c5fac]                           dc.w $5fff
[000c5fae]                           dc.w $ffff
[000c5fb0]                           dc.w $fffa
[000c5fb2]                           dc.w $5800
[000c5fb4]                           dc.w $03ff
[000c5fb6]                           dc.w $fffa
[000c5fb8]                           dc.w $5800
[000c5fba]                           dc.w $038f
[000c5fbc]                           dc.w $f81a
[000c5fbe]                           dc.w $58ef
[000c5fc0]                           dc.w $63bf
[000c5fc2]                           dc.w $ffda
[000c5fc4]                           dc.w $5800
[000c5fc6]                           dc.w $03bf
[000c5fc8]                           dc.w $ffda
[000c5fca]                           dc.w $5800
[000c5fcc]                           dc.w $03bf
[000c5fce]                           dc.w $ffda
[000c5fd0]                           dc.w $5fff
[000c5fd2]                           dc.w $ffbf
[000c5fd4]                           dc.w $ffda
[000c5fd6]                           dc.w $5fff
[000c5fd8]                           dc.w $ffbf
[000c5fda]                           dc.w $ffda
[000c5fdc]                           dc.w $5800
[000c5fde]                           dc.w $03bf
[000c5fe0]                           dc.w $ffda
[000c5fe2]                           dc.w $5800
[000c5fe4]                           dc.w $03bf
[000c5fe6]                           dc.w $ffda
[000c5fe8]                           dc.w $58f6
[000c5fea]                           dc.w $e3bf
[000c5fec]                           dc.w $ffda
[000c5fee]                           dc.w $5800
[000c5ff0]                           dc.w $03bf
[000c5ff2]                           dc.w $ffda
[000c5ff4]                           dc.w $5800
[000c5ff6]                           dc.w $0380
[000c5ff8]                           dc.w $001a
[000c5ffa]                           dc.w $5fff
[000c5ffc]                           dc.w $ffff
[000c5ffe]                           dc.w $fffa
[000c6000]                           dc.w $5fff
[000c6002]                           dc.w $ffff
[000c6004]                           dc.w $fffa
[000c6006]                           dc.w $5fff
[000c6008]                           dc.w $ffff
[000c600a]                           dc.w $fffa
[000c600c]                           dc.w $5fff
[000c600e]                           dc.w $ffff
[000c6010]                           dc.w $fffa
[000c6012]                           dc.w $5fff
[000c6014]                           dc.w $ffff
[000c6016]                           dc.w $fffa
[000c6018]                           dc.w $5fc0
[000c601a]                           dc.w $07c0
[000c601c]                           dc.w $01fa
[000c601e]                           dc.w $5fdf
[000c6020]                           dc.w $f7df
[000c6022]                           dc.w $fdfa
[000c6024]                           dc.w $5fdf
[000c6026]                           dc.w $f7df
[000c6028]                           dc.w $fdfa
[000c602a]                           dc.w $5fdf
[000c602c]                           dc.w $f7df
[000c602e]                           dc.w $fdfa
[000c6030]                           dc.w $5fc0
[000c6032]                           dc.w $07c0
[000c6034]                           dc.w $01fa
[000c6036]                           dc.w $5fff
[000c6038]                           dc.w $ffff
[000c603a]                           dc.w $fffa
[000c603c]                           dc.w $5fff
[000c603e]                           dc.w $ffff
[000c6040]                           dc.w $fffa
[000c6042]                           dc.w $4000
[000c6044]                           dc.w $0000
[000c6046]                           dc.w $0002
[000c6048]                           dc.w $7fff
[000c604a]                           dc.w $ffff
[000c604c]                           dc.w $fffe
[000c604e]                           dc.w $0000
[000c6050]                           dc.w $0000
[000c6052]                           dc.w $0000
[000c6054]                           dc.w $0000
[000c6056]                           dc.w $0000
[000c6058]                           dc.w $0000
[000c605a]                           dc.w $7fff
[000c605c]                           dc.w $ffff
[000c605e]                           dc.w $fffe
[000c6060]                           dc.w $4000
[000c6062]                           dc.w $0000
[000c6064]                           dc.w $0002
[000c6066]                           dc.w $5fff
[000c6068]                           dc.w $ffff
[000c606a]                           dc.w $fffa
[000c606c]                           dc.w $5800
[000c606e]                           dc.w $03ff
[000c6070]                           dc.w $fffa
[000c6072]                           dc.w $5800
[000c6074]                           dc.w $038f
[000c6076]                           dc.w $f81a
[000c6078]                           dc.w $58ef
[000c607a]                           dc.w $63bf
[000c607c]                           dc.w $ffda
[000c607e]                           dc.w $5800
[000c6080]                           dc.w $03bf
[000c6082]                           dc.w $ffda
[000c6084]                           dc.w $5800
[000c6086]                           dc.w $03bf
[000c6088]                           dc.w $ffda
[000c608a]                           dc.w $5fff
[000c608c]                           dc.w $ffbf
[000c608e]                           dc.w $ffda
[000c6090]                           dc.w $5fff
[000c6092]                           dc.w $ffbf
[000c6094]                           dc.w $ffda
[000c6096]                           dc.w $5800
[000c6098]                           dc.w $03bf
[000c609a]                           dc.w $ffda
[000c609c]                           dc.w $5800
[000c609e]                           dc.w $03bf
[000c60a0]                           dc.w $ffda
[000c60a2]                           dc.w $58f6
[000c60a4]                           dc.w $e3bf
[000c60a6]                           dc.w $ffda
[000c60a8]                           dc.w $5800
[000c60aa]                           dc.w $03bf
[000c60ac]                           dc.w $ffda
[000c60ae]                           dc.w $5800
[000c60b0]                           dc.w $0380
[000c60b2]                           dc.w $001a
[000c60b4]                           dc.w $5fff
[000c60b6]                           dc.w $ffff
[000c60b8]                           dc.w $fffa
[000c60ba]                           dc.w $5fff
[000c60bc]                           dc.w $ffff
[000c60be]                           dc.w $fffa
[000c60c0]                           dc.w $5fff
[000c60c2]                           dc.w $ffff
[000c60c4]                           dc.w $fffa
[000c60c6]                           dc.w $5fff
[000c60c8]                           dc.w $ffff
[000c60ca]                           dc.w $fffa
[000c60cc]                           dc.w $5fff
[000c60ce]                           dc.w $ffff
[000c60d0]                           dc.w $fffa
[000c60d2]                           dc.w $5fc0
[000c60d4]                           dc.w $07c0
[000c60d6]                           dc.w $01fa
[000c60d8]                           dc.w $5fdf
[000c60da]                           dc.w $f7df
[000c60dc]                           dc.w $fdfa
[000c60de]                           dc.w $5fdf
[000c60e0]                           dc.w $f7df
[000c60e2]                           dc.w $fdfa
[000c60e4]                           dc.w $5fdf
[000c60e6]                           dc.w $f7df
[000c60e8]                           dc.w $fdfa
[000c60ea]                           dc.w $5fc0
[000c60ec]                           dc.w $07c0
[000c60ee]                           dc.w $01fa
[000c60f0]                           dc.w $5fff
[000c60f2]                           dc.w $ffff
[000c60f4]                           dc.w $fffa
[000c60f6]                           dc.w $5fff
[000c60f8]                           dc.w $ffff
[000c60fa]                           dc.w $fffa
[000c60fc]                           dc.w $4000
[000c60fe]                           dc.w $0000
[000c6100]                           dc.w $0002
[000c6102]                           dc.w $7fff
[000c6104]                           dc.w $ffff
[000c6106]                           dc.w $fffe
[000c6108]                           dc.w $0000
[000c610a]                           dc.w $0000
[000c610c]                           dc.w $0000
[000c610e]                           dc.w $0000
[000c6110]                           dc.w $0000
[000c6112]                           dc.w $0000
[000c6114]                           dc.w $7fff
[000c6116]                           dc.w $ffff
[000c6118]                           dc.w $fffe
[000c611a]                           dc.w $4000
[000c611c]                           dc.w $0000
[000c611e]                           dc.w $0002
[000c6120]                           dc.w $5fff
[000c6122]                           dc.w $ffff
[000c6124]                           dc.w $fffa
[000c6126]                           dc.w $5800
[000c6128]                           dc.w $03ff
[000c612a]                           dc.w $fffa
[000c612c]                           dc.w $5800
[000c612e]                           dc.w $038f
[000c6130]                           dc.w $f81a
[000c6132]                           dc.w $58ef
[000c6134]                           dc.w $63bf
[000c6136]                           dc.w $ffda
[000c6138]                           dc.w $5800
[000c613a]                           dc.w $03bf
[000c613c]                           dc.w $ffda
[000c613e]                           dc.w $5800
[000c6140]                           dc.w $03bf
[000c6142]                           dc.w $ffda
[000c6144]                           dc.w $5fff
[000c6146]                           dc.w $ffbf
[000c6148]                           dc.w $ffda
[000c614a]                           dc.w $5fff
[000c614c]                           dc.w $ffbf
[000c614e]                           dc.w $ffda
[000c6150]                           dc.w $5800
[000c6152]                           dc.w $03bf
[000c6154]                           dc.w $ffda
[000c6156]                           dc.w $5800
[000c6158]                           dc.w $03bf
[000c615a]                           dc.w $ffda
[000c615c]                           dc.w $58f6
[000c615e]                           dc.w $e3bf
[000c6160]                           dc.w $ffda
[000c6162]                           dc.w $5800
[000c6164]                           dc.w $03bf
[000c6166]                           dc.w $ffda
[000c6168]                           dc.w $5800
[000c616a]                           dc.w $0380
[000c616c]                           dc.w $001a
[000c616e]                           dc.w $5fff
[000c6170]                           dc.w $ffff
[000c6172]                           dc.w $fffa
[000c6174]                           dc.w $5fff
[000c6176]                           dc.w $ffff
[000c6178]                           dc.w $fffa
[000c617a]                           dc.w $5fff
[000c617c]                           dc.w $ffff
[000c617e]                           dc.w $fffa
[000c6180]                           dc.w $5fff
[000c6182]                           dc.w $ffff
[000c6184]                           dc.w $fffa
[000c6186]                           dc.w $5fff
[000c6188]                           dc.w $ffff
[000c618a]                           dc.w $fffa
[000c618c]                           dc.w $5fc0
[000c618e]                           dc.w $07c0
[000c6190]                           dc.w $01fa
[000c6192]                           dc.w $5fdf
[000c6194]                           dc.w $f7df
[000c6196]                           dc.w $fdfa
[000c6198]                           dc.w $5fdf
[000c619a]                           dc.w $f7df
[000c619c]                           dc.w $fdfa
[000c619e]                           dc.w $5fdf
[000c61a0]                           dc.w $f7df
[000c61a2]                           dc.w $fdfa
[000c61a4]                           dc.w $5fc0
[000c61a6]                           dc.w $07c0
[000c61a8]                           dc.w $01fa
[000c61aa]                           dc.w $5fff
[000c61ac]                           dc.w $ffff
[000c61ae]                           dc.w $fffa
[000c61b0]                           dc.w $5fff
[000c61b2]                           dc.w $ffff
[000c61b4]                           dc.w $fffa
[000c61b6]                           dc.w $4000
[000c61b8]                           dc.w $0000
[000c61ba]                           dc.w $0002
[000c61bc]                           dc.w $7fff
[000c61be]                           dc.w $ffff
[000c61c0]                           dc.w $fffe
[000c61c2]                           dc.w $0000
[000c61c4]                           dc.w $0000
[000c61c6]                           dc.w $0000
[000c61c8]                           dc.w $0000
[000c61ca]                           dc.w $0000
[000c61cc]                           dc.w $0000
[000c61ce]                           dc.w $7fff
[000c61d0]                           dc.w $ffff
[000c61d2]                           dc.w $fffe
[000c61d4]                           dc.w $4000
[000c61d6]                           dc.w $0000
[000c61d8]                           dc.w $0006
[000c61da]                           dc.w $4000
[000c61dc]                           dc.w $0000
[000c61de]                           dc.w $0006
[000c61e0]                           dc.w $47ff
[000c61e2]                           dc.w $fc07
[000c61e4]                           dc.w $f006
[000c61e6]                           dc.w $4400
[000c61e8]                           dc.w $0470
[000c61ea]                           dc.w $07e6
[000c61ec]                           dc.w $44ef
[000c61ee]                           dc.w $6440
[000c61f0]                           dc.w $0026
[000c61f2]                           dc.w $4400
[000c61f4]                           dc.w $0453
[000c61f6]                           dc.w $dfa6
[000c61f8]                           dc.w $47ff
[000c61fa]                           dc.w $fc40
[000c61fc]                           dc.w $0026
[000c61fe]                           dc.w $4000
[000c6200]                           dc.w $0040
[000c6202]                           dc.w $0026
[000c6204]                           dc.w $4000
[000c6206]                           dc.w $0053
[000c6208]                           dc.w $f7a6
[000c620a]                           dc.w $47ff
[000c620c]                           dc.w $fc40
[000c620e]                           dc.w $0026
[000c6210]                           dc.w $4400
[000c6212]                           dc.w $0440
[000c6214]                           dc.w $0026
[000c6216]                           dc.w $44f6
[000c6218]                           dc.w $e453
[000c621a]                           dc.w $bfa6
[000c621c]                           dc.w $4400
[000c621e]                           dc.w $0440
[000c6220]                           dc.w $0026
[000c6222]                           dc.w $47ff
[000c6224]                           dc.w $fc7f
[000c6226]                           dc.w $ffe6
[000c6228]                           dc.w $4000
[000c622a]                           dc.w $0000
[000c622c]                           dc.w $0006
[000c622e]                           dc.w $4000
[000c6230]                           dc.w $0000
[000c6232]                           dc.w $0006
[000c6234]                           dc.w $4000
[000c6236]                           dc.w $0000
[000c6238]                           dc.w $0006
[000c623a]                           dc.w $4000
[000c623c]                           dc.w $0000
[000c623e]                           dc.w $0006
[000c6240]                           dc.w $407f
[000c6242]                           dc.w $fc7f
[000c6244]                           dc.w $ff06
[000c6246]                           dc.w $4040
[000c6248]                           dc.w $0c40
[000c624a]                           dc.w $0306
[000c624c]                           dc.w $4040
[000c624e]                           dc.w $0c40
[000c6250]                           dc.w $0306
[000c6252]                           dc.w $4047
[000c6254]                           dc.w $cc47
[000c6256]                           dc.w $f306
[000c6258]                           dc.w $4040
[000c625a]                           dc.w $0c40
[000c625c]                           dc.w $0306
[000c625e]                           dc.w $407f
[000c6260]                           dc.w $fc7f
[000c6262]                           dc.w $ff06
[000c6264]                           dc.w $407f
[000c6266]                           dc.w $fc7f
[000c6268]                           dc.w $ff06
[000c626a]                           dc.w $4000
[000c626c]                           dc.w $0000
[000c626e]                           dc.w $0006
[000c6270]                           dc.w $7fff
[000c6272]                           dc.w $ffff
[000c6274]                           dc.w $fffe
[000c6276]                           dc.w $7fff
[000c6278]                           dc.w $ffff
[000c627a]                           dc.w $fffe
[000c627c]                           dc.w $0000
[000c627e]                           dc.w $0000
[000c6280]                           dc.w $0000
DATAS_12:
[000c6282]                           dc.w $0000
[000c6284]                           dc.w $0000
[000c6286]                           dc.w $0000
[000c6288]                           dc.w $7fff
[000c628a]                           dc.w $ffff
[000c628c]                           dc.w $fffe
[000c628e]                           dc.w $7fff
[000c6290]                           dc.w $ffff
[000c6292]                           dc.w $fffe
[000c6294]                           dc.w $7fff
[000c6296]                           dc.w $ffff
[000c6298]                           dc.w $fffe
[000c629a]                           dc.w $7fff
[000c629c]                           dc.w $ffff
[000c629e]                           dc.w $fffe
[000c62a0]                           dc.w $7fff
[000c62a2]                           dc.w $ffff
[000c62a4]                           dc.w $fffe
[000c62a6]                           dc.w $7fff
[000c62a8]                           dc.w $ffff
[000c62aa]                           dc.w $fffe
[000c62ac]                           dc.w $7fff
[000c62ae]                           dc.w $ffff
[000c62b0]                           dc.w $fffe
[000c62b2]                           dc.w $7fff
[000c62b4]                           dc.w $ffff
[000c62b6]                           dc.w $fffe
[000c62b8]                           dc.w $7fff
[000c62ba]                           dc.w $ffff
[000c62bc]                           dc.w $fffe
[000c62be]                           dc.w $7fff
[000c62c0]                           dc.w $ffff
[000c62c2]                           dc.w $fffe
[000c62c4]                           dc.w $7fff
[000c62c6]                           dc.w $ffff
[000c62c8]                           dc.w $fffe
[000c62ca]                           dc.w $7fff
[000c62cc]                           dc.w $ffff
[000c62ce]                           dc.w $fffe
[000c62d0]                           dc.w $7fff
[000c62d2]                           dc.w $ffff
[000c62d4]                           dc.w $fffe
[000c62d6]                           dc.w $7fff
[000c62d8]                           dc.w $ffff
[000c62da]                           dc.w $fffe
[000c62dc]                           dc.w $7fff
[000c62de]                           dc.w $ffff
[000c62e0]                           dc.w $fffe
[000c62e2]                           dc.w $7fff
[000c62e4]                           dc.w $ffff
[000c62e6]                           dc.w $fffe
[000c62e8]                           dc.w $7fff
[000c62ea]                           dc.w $ffff
[000c62ec]                           dc.w $fffe
[000c62ee]                           dc.w $7fff
[000c62f0]                           dc.w $ffff
[000c62f2]                           dc.w $fffe
[000c62f4]                           dc.w $7fff
[000c62f6]                           dc.w $ffff
[000c62f8]                           dc.w $fffe
[000c62fa]                           dc.w $7fff
[000c62fc]                           dc.w $ffff
[000c62fe]                           dc.w $fffe
[000c6300]                           dc.w $7fff
[000c6302]                           dc.w $ffff
[000c6304]                           dc.w $fffe
[000c6306]                           dc.w $7fff
[000c6308]                           dc.w $ffff
[000c630a]                           dc.w $fffe
[000c630c]                           dc.w $7fff
[000c630e]                           dc.w $ffff
[000c6310]                           dc.w $fffe
[000c6312]                           dc.w $7fff
[000c6314]                           dc.w $ffff
[000c6316]                           dc.w $fffe
[000c6318]                           dc.w $7fff
[000c631a]                           dc.w $ffff
[000c631c]                           dc.w $fffe
[000c631e]                           dc.w $7fff
[000c6320]                           dc.w $ffff
[000c6322]                           dc.w $fffe
[000c6324]                           dc.w $7fff
[000c6326]                           dc.w $ffff
[000c6328]                           dc.w $fffe
[000c632a]                           dc.w $7fff
[000c632c]                           dc.w $ffff
[000c632e]                           dc.w $fffe
[000c6330]                           dc.w $7fff
[000c6332]                           dc.w $ffff
[000c6334]                           dc.w $fffe
[000c6336]                           dc.w $0000
[000c6338]                           dc.w $0000
[000c633a]                           dc.w $0000
DATAS_13:
[000c633c]                           dc.w $0000
[000c633e]                           dc.w $0000
[000c6340]                           dc.w $02f0
[000c6342]                           dc.w $0000
[000c6344]                           dc.w $0000
[000c6346]                           dc.w $0000
[000c6348]                           dc.w $7fff
[000c634a]                           dc.w $ffff
[000c634c]                           dc.w $fffe
[000c634e]                           dc.w $4000
[000c6350]                           dc.w $0000
[000c6352]                           dc.w $0002
[000c6354]                           dc.w $5fff
[000c6356]                           dc.w $ffff
[000c6358]                           dc.w $fffa
[000c635a]                           dc.w $5800
[000c635c]                           dc.w $03ff
[000c635e]                           dc.w $fffa
[000c6360]                           dc.w $5800
[000c6362]                           dc.w $038f
[000c6364]                           dc.w $f81a
[000c6366]                           dc.w $58ef
[000c6368]                           dc.w $63bf
[000c636a]                           dc.w $ffda
[000c636c]                           dc.w $5800
[000c636e]                           dc.w $03bf
[000c6370]                           dc.w $ffda
[000c6372]                           dc.w $5800
[000c6374]                           dc.w $03bf
[000c6376]                           dc.w $ffda
[000c6378]                           dc.w $5fff
[000c637a]                           dc.w $ffbf
[000c637c]                           dc.w $ffda
[000c637e]                           dc.w $5fff
[000c6380]                           dc.w $ffbf
[000c6382]                           dc.w $ffda
[000c6384]                           dc.w $5800
[000c6386]                           dc.w $03bf
[000c6388]                           dc.w $ffda
[000c638a]                           dc.w $5800
[000c638c]                           dc.w $03bf
[000c638e]                           dc.w $ffda
[000c6390]                           dc.w $58f6
[000c6392]                           dc.w $e3bf
[000c6394]                           dc.w $ffda
[000c6396]                           dc.w $5800
[000c6398]                           dc.w $03bf
[000c639a]                           dc.w $ffda
[000c639c]                           dc.w $5800
[000c639e]                           dc.w $0380
[000c63a0]                           dc.w $001a
[000c63a2]                           dc.w $5fff
[000c63a4]                           dc.w $ffff
[000c63a6]                           dc.w $fffa
[000c63a8]                           dc.w $5fff
[000c63aa]                           dc.w $ffff
[000c63ac]                           dc.w $fffa
[000c63ae]                           dc.w $5fff
[000c63b0]                           dc.w $ffff
[000c63b2]                           dc.w $fffa
[000c63b4]                           dc.w $5fff
[000c63b6]                           dc.w $ffff
[000c63b8]                           dc.w $fffa
[000c63ba]                           dc.w $5fff
[000c63bc]                           dc.w $ffff
[000c63be]                           dc.w $fffa
[000c63c0]                           dc.w $5fc0
[000c63c2]                           dc.w $07c0
[000c63c4]                           dc.w $01fa
[000c63c6]                           dc.w $5fdf
[000c63c8]                           dc.w $f7df
[000c63ca]                           dc.w $fdfa
[000c63cc]                           dc.w $5fdf
[000c63ce]                           dc.w $f7df
[000c63d0]                           dc.w $fdfa
[000c63d2]                           dc.w $5fdf
[000c63d4]                           dc.w $f7df
[000c63d6]                           dc.w $fdfa
[000c63d8]                           dc.w $5fc0
[000c63da]                           dc.w $07c0
[000c63dc]                           dc.w $01fa
[000c63de]                           dc.w $5fff
[000c63e0]                           dc.w $ffff
[000c63e2]                           dc.w $fffa
[000c63e4]                           dc.w $5fff
[000c63e6]                           dc.w $ffff
[000c63e8]                           dc.w $fffa
[000c63ea]                           dc.w $4000
[000c63ec]                           dc.w $0000
[000c63ee]                           dc.w $0002
[000c63f0]                           dc.w $7fff
[000c63f2]                           dc.w $ffff
[000c63f4]                           dc.w $fffe
[000c63f6]                           dc.w $0000
[000c63f8]                           dc.w $0000
[000c63fa]                           dc.w $0000
[000c63fc]                           dc.w $0000
[000c63fe]                           dc.w $0000
[000c6400]                           dc.w $0000
[000c6402]                           dc.w $7fff
[000c6404]                           dc.w $ffff
[000c6406]                           dc.w $fffe
[000c6408]                           dc.w $4000
[000c640a]                           dc.w $0000
[000c640c]                           dc.w $0002
[000c640e]                           dc.w $5fff
[000c6410]                           dc.w $ffff
[000c6412]                           dc.w $fffa
[000c6414]                           dc.w $5800
[000c6416]                           dc.w $03ff
[000c6418]                           dc.w $fffa
[000c641a]                           dc.w $5800
[000c641c]                           dc.w $038f
[000c641e]                           dc.w $f81a
[000c6420]                           dc.w $58ef
[000c6422]                           dc.w $63bf
[000c6424]                           dc.w $ffda
[000c6426]                           dc.w $5800
[000c6428]                           dc.w $03bf
[000c642a]                           dc.w $ffda
[000c642c]                           dc.w $5800
[000c642e]                           dc.w $03bf
[000c6430]                           dc.w $ffda
[000c6432]                           dc.w $5fff
[000c6434]                           dc.w $ffbf
[000c6436]                           dc.w $ffda
[000c6438]                           dc.w $5fff
[000c643a]                           dc.w $ffbf
[000c643c]                           dc.w $ffda
[000c643e]                           dc.w $5800
[000c6440]                           dc.w $03bf
[000c6442]                           dc.w $ffda
[000c6444]                           dc.w $5800
[000c6446]                           dc.w $03bf
[000c6448]                           dc.w $ffda
[000c644a]                           dc.w $58f6
[000c644c]                           dc.w $e3bf
[000c644e]                           dc.w $ffda
[000c6450]                           dc.w $5800
[000c6452]                           dc.w $03bf
[000c6454]                           dc.w $ffda
[000c6456]                           dc.w $5800
[000c6458]                           dc.w $0380
[000c645a]                           dc.w $001a
[000c645c]                           dc.w $5fff
[000c645e]                           dc.w $ffff
[000c6460]                           dc.w $fffa
[000c6462]                           dc.w $5fff
[000c6464]                           dc.w $ffff
[000c6466]                           dc.w $fffa
[000c6468]                           dc.w $5fff
[000c646a]                           dc.w $ffff
[000c646c]                           dc.w $fffa
[000c646e]                           dc.w $5fff
[000c6470]                           dc.w $ffff
[000c6472]                           dc.w $fffa
[000c6474]                           dc.w $5fff
[000c6476]                           dc.w $ffff
[000c6478]                           dc.w $fffa
[000c647a]                           dc.w $5fc0
[000c647c]                           dc.w $07c0
[000c647e]                           dc.w $01fa
[000c6480]                           dc.w $5fdf
[000c6482]                           dc.w $f7df
[000c6484]                           dc.w $fdfa
[000c6486]                           dc.w $5fdf
[000c6488]                           dc.w $f7df
[000c648a]                           dc.w $fdfa
[000c648c]                           dc.w $5fdf
[000c648e]                           dc.w $f7df
[000c6490]                           dc.w $fdfa
[000c6492]                           dc.w $5fc0
[000c6494]                           dc.w $07c0
[000c6496]                           dc.w $01fa
[000c6498]                           dc.w $5fff
[000c649a]                           dc.w $ffff
[000c649c]                           dc.w $fffa
[000c649e]                           dc.w $5fff
[000c64a0]                           dc.w $ffff
[000c64a2]                           dc.w $fffa
[000c64a4]                           dc.w $4000
[000c64a6]                           dc.w $0000
[000c64a8]                           dc.w $0002
[000c64aa]                           dc.w $7fff
[000c64ac]                           dc.w $ffff
[000c64ae]                           dc.w $fffe
[000c64b0]                           dc.w $0000
[000c64b2]                           dc.w $0000
[000c64b4]                           dc.w $0000
[000c64b6]                           dc.w $0000
[000c64b8]                           dc.w $0000
[000c64ba]                           dc.w $0000
[000c64bc]                           dc.w $7fff
[000c64be]                           dc.w $ffff
[000c64c0]                           dc.w $fffe
[000c64c2]                           dc.w $4000
[000c64c4]                           dc.w $0000
[000c64c6]                           dc.w $0002
[000c64c8]                           dc.w $5fff
[000c64ca]                           dc.w $ffff
[000c64cc]                           dc.w $fffa
[000c64ce]                           dc.w $5800
[000c64d0]                           dc.w $03ff
[000c64d2]                           dc.w $fffa
[000c64d4]                           dc.w $5800
[000c64d6]                           dc.w $038f
[000c64d8]                           dc.w $f81a
[000c64da]                           dc.w $58ef
[000c64dc]                           dc.w $63bf
[000c64de]                           dc.w $ffda
[000c64e0]                           dc.w $5800
[000c64e2]                           dc.w $03bf
[000c64e4]                           dc.w $ffda
[000c64e6]                           dc.w $5800
[000c64e8]                           dc.w $03bf
[000c64ea]                           dc.w $ffda
[000c64ec]                           dc.w $5fff
[000c64ee]                           dc.w $ffbf
[000c64f0]                           dc.w $ffda
[000c64f2]                           dc.w $5fff
[000c64f4]                           dc.w $ffbf
[000c64f6]                           dc.w $ffda
[000c64f8]                           dc.w $5800
[000c64fa]                           dc.w $03bf
[000c64fc]                           dc.w $ffda
[000c64fe]                           dc.w $5800
[000c6500]                           dc.w $03bf
[000c6502]                           dc.w $ffda
[000c6504]                           dc.w $58f6
[000c6506]                           dc.w $e3bf
[000c6508]                           dc.w $ffda
[000c650a]                           dc.w $5800
[000c650c]                           dc.w $03bf
[000c650e]                           dc.w $ffda
[000c6510]                           dc.w $5800
[000c6512]                           dc.w $0380
[000c6514]                           dc.w $001a
[000c6516]                           dc.w $5fff
[000c6518]                           dc.w $ffff
[000c651a]                           dc.w $fffa
[000c651c]                           dc.w $5fff
[000c651e]                           dc.w $ffff
[000c6520]                           dc.w $fffa
[000c6522]                           dc.w $5fff
[000c6524]                           dc.w $ffff
[000c6526]                           dc.w $fffa
[000c6528]                           dc.w $5fff
[000c652a]                           dc.w $ffff
[000c652c]                           dc.w $fffa
[000c652e]                           dc.w $5fff
[000c6530]                           dc.w $ffff
[000c6532]                           dc.w $fffa
[000c6534]                           dc.w $5fc0
[000c6536]                           dc.w $07c0
[000c6538]                           dc.w $01fa
[000c653a]                           dc.w $5fdf
[000c653c]                           dc.w $f7df
[000c653e]                           dc.w $fdfa
[000c6540]                           dc.w $5fdf
[000c6542]                           dc.w $f7df
[000c6544]                           dc.w $fdfa
[000c6546]                           dc.w $5fdf
[000c6548]                           dc.w $f7df
[000c654a]                           dc.w $fdfa
[000c654c]                           dc.w $5fc0
[000c654e]                           dc.w $07c0
[000c6550]                           dc.w $01fa
[000c6552]                           dc.w $5fff
[000c6554]                           dc.w $ffff
[000c6556]                           dc.w $fffa
[000c6558]                           dc.w $5fff
[000c655a]                           dc.w $ffff
[000c655c]                           dc.w $fffa
[000c655e]                           dc.w $4000
[000c6560]                           dc.w $0000
[000c6562]                           dc.w $0002
[000c6564]                           dc.w $7fff
[000c6566]                           dc.w $ffff
[000c6568]                           dc.w $fffe
[000c656a]                           dc.w $0000
[000c656c]                           dc.w $0000
[000c656e]                           dc.w $0000
[000c6570]                           dc.w $0000
[000c6572]                           dc.w $0000
[000c6574]                           dc.w $0000
[000c6576]                           dc.w $7fff
[000c6578]                           dc.w $ffff
[000c657a]                           dc.w $fffe
[000c657c]                           dc.w $4000
[000c657e]                           dc.w $0000
[000c6580]                           dc.w $0006
[000c6582]                           dc.w $4000
[000c6584]                           dc.w $0000
[000c6586]                           dc.w $0006
[000c6588]                           dc.w $47ff
[000c658a]                           dc.w $fc07
[000c658c]                           dc.w $f006
[000c658e]                           dc.w $4400
[000c6590]                           dc.w $0470
[000c6592]                           dc.w $07e6
[000c6594]                           dc.w $44ef
[000c6596]                           dc.w $6440
[000c6598]                           dc.w $0026
[000c659a]                           dc.w $4400
[000c659c]                           dc.w $0453
[000c659e]                           dc.w $dfa6
[000c65a0]                           dc.w $47ff
[000c65a2]                           dc.w $fc40
[000c65a4]                           dc.w $0026
[000c65a6]                           dc.w $4000
[000c65a8]                           dc.w $0040
[000c65aa]                           dc.w $0026
[000c65ac]                           dc.w $4000
[000c65ae]                           dc.w $0053
[000c65b0]                           dc.w $f7a6
[000c65b2]                           dc.w $47ff
[000c65b4]                           dc.w $fc40
[000c65b6]                           dc.w $0026
[000c65b8]                           dc.w $4400
[000c65ba]                           dc.w $0440
[000c65bc]                           dc.w $0026
[000c65be]                           dc.w $44f6
[000c65c0]                           dc.w $e453
[000c65c2]                           dc.w $bfa6
[000c65c4]                           dc.w $4400
[000c65c6]                           dc.w $0440
[000c65c8]                           dc.w $0026
[000c65ca]                           dc.w $47ff
[000c65cc]                           dc.w $fc7f
[000c65ce]                           dc.w $ffe6
[000c65d0]                           dc.w $4000
[000c65d2]                           dc.w $0000
[000c65d4]                           dc.w $0006
[000c65d6]                           dc.w $4000
[000c65d8]                           dc.w $0000
[000c65da]                           dc.w $0006
[000c65dc]                           dc.w $4000
[000c65de]                           dc.w $0000
[000c65e0]                           dc.w $0006
[000c65e2]                           dc.w $4000
[000c65e4]                           dc.w $0000
[000c65e6]                           dc.w $0006
[000c65e8]                           dc.w $407f
[000c65ea]                           dc.w $fc7f
[000c65ec]                           dc.w $ff06
[000c65ee]                           dc.w $4040
[000c65f0]                           dc.w $0c40
[000c65f2]                           dc.w $0306
[000c65f4]                           dc.w $4040
[000c65f6]                           dc.w $0c40
[000c65f8]                           dc.w $0306
[000c65fa]                           dc.w $4047
[000c65fc]                           dc.w $cc47
[000c65fe]                           dc.w $f306
[000c6600]                           dc.w $4040
[000c6602]                           dc.w $0c40
[000c6604]                           dc.w $0306
[000c6606]                           dc.w $407f
[000c6608]                           dc.w $fc7f
[000c660a]                           dc.w $ff06
[000c660c]                           dc.w $407f
[000c660e]                           dc.w $fc7f
[000c6610]                           dc.w $ff06
[000c6612]                           dc.w $4000
[000c6614]                           dc.w $0000
[000c6616]                           dc.w $0006
[000c6618]                           dc.w $7fff
[000c661a]                           dc.w $ffff
[000c661c]                           dc.w $fffe
[000c661e]                           dc.w $7fff
[000c6620]                           dc.w $ffff
[000c6622]                           dc.w $fffe
[000c6624]                           dc.w $0000
[000c6626]                           dc.w $0000
[000c6628]                           dc.w $0000
DATAS_14:
[000c662a]                           dc.w $0000
[000c662c]                           dc.w $0000
[000c662e]                           dc.w $0000
[000c6630]                           dc.w $7fff
[000c6632]                           dc.w $ffff
[000c6634]                           dc.w $fffe
[000c6636]                           dc.w $7fff
[000c6638]                           dc.w $ffff
[000c663a]                           dc.w $fffe
[000c663c]                           dc.w $7fff
[000c663e]                           dc.w $ffff
[000c6640]                           dc.w $fffe
[000c6642]                           dc.w $7fff
[000c6644]                           dc.w $ffff
[000c6646]                           dc.w $fffe
[000c6648]                           dc.w $7fff
[000c664a]                           dc.w $ffff
[000c664c]                           dc.w $fffe
[000c664e]                           dc.w $7fff
[000c6650]                           dc.w $ffff
[000c6652]                           dc.w $fffe
[000c6654]                           dc.w $7fff
[000c6656]                           dc.w $ffff
[000c6658]                           dc.w $fffe
[000c665a]                           dc.w $7fff
[000c665c]                           dc.w $ffff
[000c665e]                           dc.w $fffe
[000c6660]                           dc.w $7fff
[000c6662]                           dc.w $ffff
[000c6664]                           dc.w $fffe
[000c6666]                           dc.w $7fff
[000c6668]                           dc.w $ffff
[000c666a]                           dc.w $fffe
[000c666c]                           dc.w $7fff
[000c666e]                           dc.w $ffff
[000c6670]                           dc.w $fffe
[000c6672]                           dc.w $7fff
[000c6674]                           dc.w $ffff
[000c6676]                           dc.w $fffe
[000c6678]                           dc.w $7fff
[000c667a]                           dc.w $ffff
[000c667c]                           dc.w $fffe
[000c667e]                           dc.w $7fff
[000c6680]                           dc.w $ffff
[000c6682]                           dc.w $fffe
[000c6684]                           dc.w $7fff
[000c6686]                           dc.w $ffff
[000c6688]                           dc.w $fffe
[000c668a]                           dc.w $7fff
[000c668c]                           dc.w $ffff
[000c668e]                           dc.w $fffe
[000c6690]                           dc.w $7fff
[000c6692]                           dc.w $ffff
[000c6694]                           dc.w $fffe
[000c6696]                           dc.w $7fff
[000c6698]                           dc.w $ffff
[000c669a]                           dc.w $fffe
[000c669c]                           dc.w $7fff
[000c669e]                           dc.w $ffff
[000c66a0]                           dc.w $fffe
[000c66a2]                           dc.w $7fff
[000c66a4]                           dc.w $ffff
[000c66a6]                           dc.w $fffe
[000c66a8]                           dc.w $7fff
[000c66aa]                           dc.w $ffff
[000c66ac]                           dc.w $fffe
[000c66ae]                           dc.w $7fff
[000c66b0]                           dc.w $ffff
[000c66b2]                           dc.w $fffe
[000c66b4]                           dc.w $7fff
[000c66b6]                           dc.w $ffff
[000c66b8]                           dc.w $fffe
[000c66ba]                           dc.w $7fff
[000c66bc]                           dc.w $ffff
[000c66be]                           dc.w $fffe
[000c66c0]                           dc.w $7fff
[000c66c2]                           dc.w $ffff
[000c66c4]                           dc.w $fffe
[000c66c6]                           dc.w $7fff
[000c66c8]                           dc.w $ffff
[000c66ca]                           dc.w $fffe
[000c66cc]                           dc.w $7fff
[000c66ce]                           dc.w $ffff
[000c66d0]                           dc.w $fffe
[000c66d2]                           dc.w $7fff
[000c66d4]                           dc.w $ffff
[000c66d6]                           dc.w $fffe
[000c66d8]                           dc.w $7fff
[000c66da]                           dc.w $ffff
[000c66dc]                           dc.w $fffe
[000c66de]                           dc.w $0000
[000c66e0]                           dc.w $0000
[000c66e2]                           dc.w $0000
DATAS_17:
[000c66e4]                           dc.w $0000
[000c66e6]                           dc.w $0000
[000c66e8]                           dc.w $02c0
[000c66ea]                           dc.w $0000
[000c66ec]                           dc.w $0000
[000c66ee]                           dc.w $0000
[000c66f0]                           dc.w $0000
[000c66f2]                           dc.w $0000
[000c66f4]                           dc.w $0000
[000c66f6]                           dc.w $0000
[000c66f8]                           dc.w $0000
[000c66fa]                           dc.w $0000
[000c66fc]                           dc.w $0000
[000c66fe]                           dc.w $0000
[000c6700]                           dc.w $0000
[000c6702]                           dc.w $0000
[000c6704]                           dc.w $0000
[000c6706]                           dc.w $0000
[000c6708]                           dc.w $0000
[000c670a]                           dc.w $0000
[000c670c]                           dc.w $0000
[000c670e]                           dc.w $1fff
[000c6710]                           dc.w $ffff
[000c6712]                           dc.w $fff0
[000c6714]                           dc.w $101f
[000c6716]                           dc.w $f000
[000c6718]                           dc.w $0010
[000c671a]                           dc.w $1798
[000c671c]                           dc.w $33e0
[000c671e]                           dc.w $0010
[000c6720]                           dc.w $101f
[000c6722]                           dc.w $f000
[000c6724]                           dc.w $0010
[000c6726]                           dc.w $1fff
[000c6728]                           dc.w $ffff
[000c672a]                           dc.w $fff0
[000c672c]                           dc.w $0010
[000c672e]                           dc.w $0040
[000c6730]                           dc.w $0000
[000c6732]                           dc.w $0017
[000c6734]                           dc.w $ff40
[000c6736]                           dc.w $0000
[000c6738]                           dc.w $0010
[000c673a]                           dc.w $0040
[000c673c]                           dc.w $0000
[000c673e]                           dc.w $0010
[000c6740]                           dc.w $0040
[000c6742]                           dc.w $0000
[000c6744]                           dc.w $0015
[000c6746]                           dc.w $5540
[000c6748]                           dc.w $0000
[000c674a]                           dc.w $0010
[000c674c]                           dc.w $0040
[000c674e]                           dc.w $0000
[000c6750]                           dc.w $001f
[000c6752]                           dc.w $ffc0
[000c6754]                           dc.w $0000
[000c6756]                           dc.w $0018
[000c6758]                           dc.w $00c0
[000c675a]                           dc.w $0000
[000c675c]                           dc.w $001f
[000c675e]                           dc.w $ffc0
[000c6760]                           dc.w $0000
[000c6762]                           dc.w $0010
[000c6764]                           dc.w $0040
[000c6766]                           dc.w $0000
[000c6768]                           dc.w $0017
[000c676a]                           dc.w $fe40
[000c676c]                           dc.w $0000
[000c676e]                           dc.w $0010
[000c6770]                           dc.w $0040
[000c6772]                           dc.w $0000
[000c6774]                           dc.w $001f
[000c6776]                           dc.w $ffc0
[000c6778]                           dc.w $0000
[000c677a]                           dc.w $0000
[000c677c]                           dc.w $0000
[000c677e]                           dc.w $0000
[000c6780]                           dc.w $0000
[000c6782]                           dc.w $0000
[000c6784]                           dc.w $0000
[000c6786]                           dc.w $0000
[000c6788]                           dc.w $0000
[000c678a]                           dc.w $0000
[000c678c]                           dc.w $0000
[000c678e]                           dc.w $0000
[000c6790]                           dc.w $0000
[000c6792]                           dc.w $0000
[000c6794]                           dc.w $0000
[000c6796]                           dc.w $0000
[000c6798]                           dc.w $0000
[000c679a]                           dc.w $0000
[000c679c]                           dc.w $0000
[000c679e]                           dc.w $0000
[000c67a0]                           dc.w $0000
[000c67a2]                           dc.w $0000
[000c67a4]                           dc.w $0000
[000c67a6]                           dc.w $0000
[000c67a8]                           dc.w $0000
[000c67aa]                           dc.w $0000
[000c67ac]                           dc.w $0000
[000c67ae]                           dc.w $0000
[000c67b0]                           dc.w $0000
[000c67b2]                           dc.w $0000
[000c67b4]                           dc.w $0000
[000c67b6]                           dc.w $0000
[000c67b8]                           dc.w $0000
[000c67ba]                           dc.w $0000
[000c67bc]                           dc.w $1fff
[000c67be]                           dc.w $ffff
[000c67c0]                           dc.w $fff0
[000c67c2]                           dc.w $101f
[000c67c4]                           dc.w $f000
[000c67c6]                           dc.w $0010
[000c67c8]                           dc.w $1798
[000c67ca]                           dc.w $33e0
[000c67cc]                           dc.w $0010
[000c67ce]                           dc.w $101f
[000c67d0]                           dc.w $f000
[000c67d2]                           dc.w $0010
[000c67d4]                           dc.w $1fff
[000c67d6]                           dc.w $ffff
[000c67d8]                           dc.w $fff0
[000c67da]                           dc.w $0010
[000c67dc]                           dc.w $0040
[000c67de]                           dc.w $0000
[000c67e0]                           dc.w $0017
[000c67e2]                           dc.w $ff40
[000c67e4]                           dc.w $0000
[000c67e6]                           dc.w $0010
[000c67e8]                           dc.w $0040
[000c67ea]                           dc.w $0000
[000c67ec]                           dc.w $0010
[000c67ee]                           dc.w $0040
[000c67f0]                           dc.w $0000
[000c67f2]                           dc.w $0015
[000c67f4]                           dc.w $5540
[000c67f6]                           dc.w $0000
[000c67f8]                           dc.w $0010
[000c67fa]                           dc.w $0040
[000c67fc]                           dc.w $0000
[000c67fe]                           dc.w $001f
[000c6800]                           dc.w $ffc0
[000c6802]                           dc.w $0000
[000c6804]                           dc.w $0018
[000c6806]                           dc.w $00c0
[000c6808]                           dc.w $0000
[000c680a]                           dc.w $001f
[000c680c]                           dc.w $ffc0
[000c680e]                           dc.w $0000
[000c6810]                           dc.w $0010
[000c6812]                           dc.w $0040
[000c6814]                           dc.w $0000
[000c6816]                           dc.w $0017
[000c6818]                           dc.w $fe40
[000c681a]                           dc.w $0000
[000c681c]                           dc.w $0010
[000c681e]                           dc.w $0040
[000c6820]                           dc.w $0000
[000c6822]                           dc.w $001f
[000c6824]                           dc.w $ffc0
[000c6826]                           dc.w $0000
[000c6828]                           dc.w $0000
[000c682a]                           dc.w $0000
[000c682c]                           dc.w $0000
[000c682e]                           dc.w $0000
[000c6830]                           dc.w $0000
[000c6832]                           dc.w $0000
[000c6834]                           dc.w $0000
[000c6836]                           dc.w $0000
[000c6838]                           dc.w $0000
[000c683a]                           dc.w $0000
[000c683c]                           dc.w $0000
[000c683e]                           dc.w $0000
[000c6840]                           dc.w $0000
[000c6842]                           dc.w $0000
[000c6844]                           dc.w $0000
[000c6846]                           dc.w $0000
[000c6848]                           dc.w $0000
[000c684a]                           dc.w $0000
[000c684c]                           dc.w $0000
[000c684e]                           dc.w $0000
[000c6850]                           dc.w $0000
[000c6852]                           dc.w $0000
[000c6854]                           dc.w $0000
[000c6856]                           dc.w $0000
[000c6858]                           dc.w $0000
[000c685a]                           dc.w $0000
[000c685c]                           dc.w $0000
[000c685e]                           dc.w $0000
[000c6860]                           dc.w $0000
[000c6862]                           dc.w $0000
[000c6864]                           dc.w $0000
[000c6866]                           dc.w $0000
[000c6868]                           dc.w $0000
[000c686a]                           dc.w $1fff
[000c686c]                           dc.w $ffff
[000c686e]                           dc.w $fff0
[000c6870]                           dc.w $101f
[000c6872]                           dc.w $f000
[000c6874]                           dc.w $0010
[000c6876]                           dc.w $1798
[000c6878]                           dc.w $33e0
[000c687a]                           dc.w $0010
[000c687c]                           dc.w $101f
[000c687e]                           dc.w $f000
[000c6880]                           dc.w $0010
[000c6882]                           dc.w $1fff
[000c6884]                           dc.w $ffff
[000c6886]                           dc.w $fff0
[000c6888]                           dc.w $0010
[000c688a]                           dc.w $0040
[000c688c]                           dc.w $0000
[000c688e]                           dc.w $0017
[000c6890]                           dc.w $ff40
[000c6892]                           dc.w $0000
[000c6894]                           dc.w $0010
[000c6896]                           dc.w $0040
[000c6898]                           dc.w $0000
[000c689a]                           dc.w $0010
[000c689c]                           dc.w $0040
[000c689e]                           dc.w $0000
[000c68a0]                           dc.w $0015
[000c68a2]                           dc.w $5540
[000c68a4]                           dc.w $0000
[000c68a6]                           dc.w $0010
[000c68a8]                           dc.w $0040
[000c68aa]                           dc.w $0000
[000c68ac]                           dc.w $001f
[000c68ae]                           dc.w $ffc0
[000c68b0]                           dc.w $0000
[000c68b2]                           dc.w $0018
[000c68b4]                           dc.w $00c0
[000c68b6]                           dc.w $0000
[000c68b8]                           dc.w $001f
[000c68ba]                           dc.w $ffc0
[000c68bc]                           dc.w $0000
[000c68be]                           dc.w $0010
[000c68c0]                           dc.w $0040
[000c68c2]                           dc.w $0000
[000c68c4]                           dc.w $0017
[000c68c6]                           dc.w $fe40
[000c68c8]                           dc.w $0000
[000c68ca]                           dc.w $0010
[000c68cc]                           dc.w $0040
[000c68ce]                           dc.w $0000
[000c68d0]                           dc.w $001f
[000c68d2]                           dc.w $ffc0
[000c68d4]                           dc.w $0000
[000c68d6]                           dc.w $0000
[000c68d8]                           dc.w $0000
[000c68da]                           dc.w $0000
[000c68dc]                           dc.w $0000
[000c68de]                           dc.w $0000
[000c68e0]                           dc.w $0000
[000c68e2]                           dc.w $0000
[000c68e4]                           dc.w $0000
[000c68e6]                           dc.w $0000
[000c68e8]                           dc.w $0000
[000c68ea]                           dc.w $0000
[000c68ec]                           dc.w $0000
[000c68ee]                           dc.w $0000
[000c68f0]                           dc.w $0000
[000c68f2]                           dc.w $0000
[000c68f4]                           dc.w $0000
[000c68f6]                           dc.w $0000
[000c68f8]                           dc.w $0000
[000c68fa]                           dc.w $0000
[000c68fc]                           dc.w $0000
[000c68fe]                           dc.w $0000
[000c6900]                           dc.w $0000
[000c6902]                           dc.w $0000
[000c6904]                           dc.w $0000
[000c6906]                           dc.w $0000
[000c6908]                           dc.w $0000
[000c690a]                           dc.w $0000
[000c690c]                           dc.w $0000
[000c690e]                           dc.w $0000
[000c6910]                           dc.w $0000
[000c6912]                           dc.w $0000
[000c6914]                           dc.w $0000
[000c6916]                           dc.w $0000
[000c6918]                           dc.w $1fff
[000c691a]                           dc.w $ffff
[000c691c]                           dc.w $fff0
[000c691e]                           dc.w $101f
[000c6920]                           dc.w $f000
[000c6922]                           dc.w $0018
[000c6924]                           dc.w $1798
[000c6926]                           dc.w $33e0
[000c6928]                           dc.w $0018
[000c692a]                           dc.w $101f
[000c692c]                           dc.w $f000
[000c692e]                           dc.w $0018
[000c6930]                           dc.w $1fff
[000c6932]                           dc.w $ffff
[000c6934]                           dc.w $fff8
[000c6936]                           dc.w $0ff0
[000c6938]                           dc.w $007f
[000c693a]                           dc.w $fff8
[000c693c]                           dc.w $0017
[000c693e]                           dc.w $ff60
[000c6940]                           dc.w $0000
[000c6942]                           dc.w $0010
[000c6944]                           dc.w $0060
[000c6946]                           dc.w $0000
[000c6948]                           dc.w $0010
[000c694a]                           dc.w $0060
[000c694c]                           dc.w $0000
[000c694e]                           dc.w $0015
[000c6950]                           dc.w $5560
[000c6952]                           dc.w $0000
[000c6954]                           dc.w $0010
[000c6956]                           dc.w $0060
[000c6958]                           dc.w $0000
[000c695a]                           dc.w $001f
[000c695c]                           dc.w $ffe0
[000c695e]                           dc.w $0000
[000c6960]                           dc.w $0018
[000c6962]                           dc.w $00e0
[000c6964]                           dc.w $0000
[000c6966]                           dc.w $001f
[000c6968]                           dc.w $ffe0
[000c696a]                           dc.w $0000
[000c696c]                           dc.w $0010
[000c696e]                           dc.w $0060
[000c6970]                           dc.w $0000
[000c6972]                           dc.w $0017
[000c6974]                           dc.w $fe60
[000c6976]                           dc.w $0000
[000c6978]                           dc.w $0010
[000c697a]                           dc.w $0060
[000c697c]                           dc.w $0000
[000c697e]                           dc.w $001f
[000c6980]                           dc.w $ffe0
[000c6982]                           dc.w $0000
[000c6984]                           dc.w $000f
[000c6986]                           dc.w $ffe0
[000c6988]                           dc.w $0000
[000c698a]                           dc.w $0000
[000c698c]                           dc.w $0000
[000c698e]                           dc.w $0000
[000c6990]                           dc.w $0000
[000c6992]                           dc.w $0000
[000c6994]                           dc.w $0000
[000c6996]                           dc.w $0000
[000c6998]                           dc.w $0000
[000c699a]                           dc.w $0000
[000c699c]                           dc.w $0000
[000c699e]                           dc.w $0000
[000c69a0]                           dc.w $0000
DATAS_18:
[000c69a2]                           dc.w $0000
[000c69a4]                           dc.w $0000
[000c69a6]                           dc.w $0000
[000c69a8]                           dc.w $0000
[000c69aa]                           dc.w $0000
[000c69ac]                           dc.w $0000
[000c69ae]                           dc.w $0000
[000c69b0]                           dc.w $0000
[000c69b2]                           dc.w $0000
[000c69b4]                           dc.w $0000
[000c69b6]                           dc.w $0000
[000c69b8]                           dc.w $0000
[000c69ba]                           dc.w $0000
[000c69bc]                           dc.w $0000
[000c69be]                           dc.w $0000
[000c69c0]                           dc.w $0000
[000c69c2]                           dc.w $0000
[000c69c4]                           dc.w $0000
[000c69c6]                           dc.w $1fff
[000c69c8]                           dc.w $ffff
[000c69ca]                           dc.w $fff0
[000c69cc]                           dc.w $1fff
[000c69ce]                           dc.w $ffff
[000c69d0]                           dc.w $fff8
[000c69d2]                           dc.w $1fff
[000c69d4]                           dc.w $ffff
[000c69d6]                           dc.w $fff8
[000c69d8]                           dc.w $1fff
[000c69da]                           dc.w $ffff
[000c69dc]                           dc.w $fff8
[000c69de]                           dc.w $1fff
[000c69e0]                           dc.w $ffff
[000c69e2]                           dc.w $fff8
[000c69e4]                           dc.w $0fff
[000c69e6]                           dc.w $ffff
[000c69e8]                           dc.w $fff8
[000c69ea]                           dc.w $001f
[000c69ec]                           dc.w $ffe0
[000c69ee]                           dc.w $0000
[000c69f0]                           dc.w $001f
[000c69f2]                           dc.w $ffe0
[000c69f4]                           dc.w $0000
[000c69f6]                           dc.w $001f
[000c69f8]                           dc.w $ffe0
[000c69fa]                           dc.w $0000
[000c69fc]                           dc.w $001f
[000c69fe]                           dc.w $ffe0
[000c6a00]                           dc.w $0000
[000c6a02]                           dc.w $001f
[000c6a04]                           dc.w $ffe0
[000c6a06]                           dc.w $0000
[000c6a08]                           dc.w $001f
[000c6a0a]                           dc.w $ffe0
[000c6a0c]                           dc.w $0000
[000c6a0e]                           dc.w $001f
[000c6a10]                           dc.w $ffe0
[000c6a12]                           dc.w $0000
[000c6a14]                           dc.w $001f
[000c6a16]                           dc.w $ffe0
[000c6a18]                           dc.w $0000
[000c6a1a]                           dc.w $001f
[000c6a1c]                           dc.w $ffe0
[000c6a1e]                           dc.w $0000
[000c6a20]                           dc.w $001f
[000c6a22]                           dc.w $ffe0
[000c6a24]                           dc.w $0000
[000c6a26]                           dc.w $001f
[000c6a28]                           dc.w $ffe0
[000c6a2a]                           dc.w $0000
[000c6a2c]                           dc.w $001f
[000c6a2e]                           dc.w $ffe0
[000c6a30]                           dc.w $0000
[000c6a32]                           dc.w $000f
[000c6a34]                           dc.w $ffe0
[000c6a36]                           dc.w $0000
[000c6a38]                           dc.w $0000
[000c6a3a]                           dc.w $0000
[000c6a3c]                           dc.w $0000
[000c6a3e]                           dc.w $0000
[000c6a40]                           dc.w $0000
[000c6a42]                           dc.w $0000
[000c6a44]                           dc.w $0000
[000c6a46]                           dc.w $0000
[000c6a48]                           dc.w $0000
[000c6a4a]                           dc.w $0000
[000c6a4c]                           dc.w $0000
[000c6a4e]                           dc.w $0000
DATAS_19:
[000c6a50]                           dc.w $0000
[000c6a52]                           dc.w $0000
[000c6a54]                           dc.w $02c0
[000c6a56]                           dc.w $0000
[000c6a58]                           dc.w $0000
[000c6a5a]                           dc.w $0000
[000c6a5c]                           dc.w $0000
[000c6a5e]                           dc.w $0000
[000c6a60]                           dc.w $0000
[000c6a62]                           dc.w $0000
[000c6a64]                           dc.w $0000
[000c6a66]                           dc.w $0000
[000c6a68]                           dc.w $0000
[000c6a6a]                           dc.w $0000
[000c6a6c]                           dc.w $0000
[000c6a6e]                           dc.w $0000
[000c6a70]                           dc.w $0000
[000c6a72]                           dc.w $0000
[000c6a74]                           dc.w $0000
[000c6a76]                           dc.w $0000
[000c6a78]                           dc.w $0000
[000c6a7a]                           dc.w $007f
[000c6a7c]                           dc.w $ff00
[000c6a7e]                           dc.w $0000
[000c6a80]                           dc.w $007f
[000c6a82]                           dc.w $ff00
[000c6a84]                           dc.w $0000
[000c6a86]                           dc.w $007f
[000c6a88]                           dc.w $ff00
[000c6a8a]                           dc.w $0000
[000c6a8c]                           dc.w $007f
[000c6a8e]                           dc.w $ff00
[000c6a90]                           dc.w $0000
[000c6a92]                           dc.w $007f
[000c6a94]                           dc.w $ff00
[000c6a96]                           dc.w $0000
[000c6a98]                           dc.w $007f
[000c6a9a]                           dc.w $ff00
[000c6a9c]                           dc.w $0000
[000c6a9e]                           dc.w $007f
[000c6aa0]                           dc.w $ff00
[000c6aa2]                           dc.w $0000
[000c6aa4]                           dc.w $007f
[000c6aa6]                           dc.w $ffff
[000c6aa8]                           dc.w $f000
[000c6aaa]                           dc.w $0070
[000c6aac]                           dc.w $07ff
[000c6aae]                           dc.w $f000
[000c6ab0]                           dc.w $007f
[000c6ab2]                           dc.w $ffff
[000c6ab4]                           dc.w $f000
[000c6ab6]                           dc.w $007f
[000c6ab8]                           dc.w $ffff
[000c6aba]                           dc.w $f000
[000c6abc]                           dc.w $007f
[000c6abe]                           dc.w $ffff
[000c6ac0]                           dc.w $f000
[000c6ac2]                           dc.w $007f
[000c6ac4]                           dc.w $ffc0
[000c6ac6]                           dc.w $7000
[000c6ac8]                           dc.w $007f
[000c6aca]                           dc.w $ffff
[000c6acc]                           dc.w $f000
[000c6ace]                           dc.w $007f
[000c6ad0]                           dc.w $ffff
[000c6ad2]                           dc.w $f000
[000c6ad4]                           dc.w $007f
[000c6ad6]                           dc.w $ff00
[000c6ad8]                           dc.w $0000
[000c6ada]                           dc.w $007f
[000c6adc]                           dc.w $ff00
[000c6ade]                           dc.w $0000
[000c6ae0]                           dc.w $0000
[000c6ae2]                           dc.w $0000
[000c6ae4]                           dc.w $0000
[000c6ae6]                           dc.w $0000
[000c6ae8]                           dc.w $0000
[000c6aea]                           dc.w $0000
[000c6aec]                           dc.w $0000
[000c6aee]                           dc.w $0000
[000c6af0]                           dc.w $0000
[000c6af2]                           dc.w $0000
[000c6af4]                           dc.w $0000
[000c6af6]                           dc.w $0000
[000c6af8]                           dc.w $0000
[000c6afa]                           dc.w $0000
[000c6afc]                           dc.w $0000
[000c6afe]                           dc.w $0000
[000c6b00]                           dc.w $0000
[000c6b02]                           dc.w $0000
[000c6b04]                           dc.w $0000
[000c6b06]                           dc.w $0000
[000c6b08]                           dc.w $0000
[000c6b0a]                           dc.w $0000
[000c6b0c]                           dc.w $0000
[000c6b0e]                           dc.w $0000
[000c6b10]                           dc.w $0000
[000c6b12]                           dc.w $0000
[000c6b14]                           dc.w $0000
[000c6b16]                           dc.w $0000
[000c6b18]                           dc.w $0000
[000c6b1a]                           dc.w $0000
[000c6b1c]                           dc.w $0000
[000c6b1e]                           dc.w $0000
[000c6b20]                           dc.w $0000
[000c6b22]                           dc.w $0000
[000c6b24]                           dc.w $0000
[000c6b26]                           dc.w $0000
[000c6b28]                           dc.w $007f
[000c6b2a]                           dc.w $ff00
[000c6b2c]                           dc.w $0000
[000c6b2e]                           dc.w $007f
[000c6b30]                           dc.w $ff00
[000c6b32]                           dc.w $0000
[000c6b34]                           dc.w $007f
[000c6b36]                           dc.w $ff00
[000c6b38]                           dc.w $0000
[000c6b3a]                           dc.w $007f
[000c6b3c]                           dc.w $ff00
[000c6b3e]                           dc.w $0000
[000c6b40]                           dc.w $007f
[000c6b42]                           dc.w $ff00
[000c6b44]                           dc.w $0000
[000c6b46]                           dc.w $007f
[000c6b48]                           dc.w $ff00
[000c6b4a]                           dc.w $0000
[000c6b4c]                           dc.w $007f
[000c6b4e]                           dc.w $ff00
[000c6b50]                           dc.w $0000
[000c6b52]                           dc.w $007f
[000c6b54]                           dc.w $ffff
[000c6b56]                           dc.w $f000
[000c6b58]                           dc.w $0070
[000c6b5a]                           dc.w $07ff
[000c6b5c]                           dc.w $f000
[000c6b5e]                           dc.w $007f
[000c6b60]                           dc.w $ffff
[000c6b62]                           dc.w $f000
[000c6b64]                           dc.w $007f
[000c6b66]                           dc.w $ffff
[000c6b68]                           dc.w $f000
[000c6b6a]                           dc.w $007f
[000c6b6c]                           dc.w $ffff
[000c6b6e]                           dc.w $f000
[000c6b70]                           dc.w $007f
[000c6b72]                           dc.w $ffc0
[000c6b74]                           dc.w $7000
[000c6b76]                           dc.w $007f
[000c6b78]                           dc.w $ffff
[000c6b7a]                           dc.w $f000
[000c6b7c]                           dc.w $007f
[000c6b7e]                           dc.w $ffff
[000c6b80]                           dc.w $f000
[000c6b82]                           dc.w $007f
[000c6b84]                           dc.w $ff00
[000c6b86]                           dc.w $0000
[000c6b88]                           dc.w $007f
[000c6b8a]                           dc.w $ff00
[000c6b8c]                           dc.w $0000
[000c6b8e]                           dc.w $0000
[000c6b90]                           dc.w $0000
[000c6b92]                           dc.w $0000
[000c6b94]                           dc.w $0000
[000c6b96]                           dc.w $0000
[000c6b98]                           dc.w $0000
[000c6b9a]                           dc.w $0000
[000c6b9c]                           dc.w $0000
[000c6b9e]                           dc.w $0000
[000c6ba0]                           dc.w $0000
[000c6ba2]                           dc.w $0000
[000c6ba4]                           dc.w $0000
[000c6ba6]                           dc.w $0000
[000c6ba8]                           dc.w $0000
[000c6baa]                           dc.w $0000
[000c6bac]                           dc.w $0000
[000c6bae]                           dc.w $0000
[000c6bb0]                           dc.w $0000
[000c6bb2]                           dc.w $0000
[000c6bb4]                           dc.w $0000
[000c6bb6]                           dc.w $0000
[000c6bb8]                           dc.w $0000
[000c6bba]                           dc.w $0000
[000c6bbc]                           dc.w $0000
[000c6bbe]                           dc.w $0000
[000c6bc0]                           dc.w $0000
[000c6bc2]                           dc.w $0000
[000c6bc4]                           dc.w $0000
[000c6bc6]                           dc.w $0000
[000c6bc8]                           dc.w $0000
[000c6bca]                           dc.w $0000
[000c6bcc]                           dc.w $0000
[000c6bce]                           dc.w $0000
[000c6bd0]                           dc.w $0000
[000c6bd2]                           dc.w $0000
[000c6bd4]                           dc.w $0000
[000c6bd6]                           dc.w $007f
[000c6bd8]                           dc.w $ff00
[000c6bda]                           dc.w $0000
[000c6bdc]                           dc.w $007f
[000c6bde]                           dc.w $ff00
[000c6be0]                           dc.w $0000
[000c6be2]                           dc.w $007f
[000c6be4]                           dc.w $ff00
[000c6be6]                           dc.w $0000
[000c6be8]                           dc.w $007f
[000c6bea]                           dc.w $ff00
[000c6bec]                           dc.w $0000
[000c6bee]                           dc.w $007f
[000c6bf0]                           dc.w $ff00
[000c6bf2]                           dc.w $0000
[000c6bf4]                           dc.w $007f
[000c6bf6]                           dc.w $ff00
[000c6bf8]                           dc.w $0000
[000c6bfa]                           dc.w $007f
[000c6bfc]                           dc.w $ff00
[000c6bfe]                           dc.w $0000
[000c6c00]                           dc.w $007f
[000c6c02]                           dc.w $ffff
[000c6c04]                           dc.w $f000
[000c6c06]                           dc.w $0070
[000c6c08]                           dc.w $07ff
[000c6c0a]                           dc.w $f000
[000c6c0c]                           dc.w $007f
[000c6c0e]                           dc.w $ffff
[000c6c10]                           dc.w $f000
[000c6c12]                           dc.w $007f
[000c6c14]                           dc.w $ffff
[000c6c16]                           dc.w $f000
[000c6c18]                           dc.w $007f
[000c6c1a]                           dc.w $ffff
[000c6c1c]                           dc.w $f000
[000c6c1e]                           dc.w $007f
[000c6c20]                           dc.w $ffc0
[000c6c22]                           dc.w $7000
[000c6c24]                           dc.w $007f
[000c6c26]                           dc.w $ffff
[000c6c28]                           dc.w $f000
[000c6c2a]                           dc.w $007f
[000c6c2c]                           dc.w $ffff
[000c6c2e]                           dc.w $f000
[000c6c30]                           dc.w $007f
[000c6c32]                           dc.w $ff00
[000c6c34]                           dc.w $0000
[000c6c36]                           dc.w $007f
[000c6c38]                           dc.w $ff00
[000c6c3a]                           dc.w $0000
[000c6c3c]                           dc.w $0000
[000c6c3e]                           dc.w $0000
[000c6c40]                           dc.w $0000
[000c6c42]                           dc.w $0000
[000c6c44]                           dc.w $0000
[000c6c46]                           dc.w $0000
[000c6c48]                           dc.w $0000
[000c6c4a]                           dc.w $0000
[000c6c4c]                           dc.w $0000
[000c6c4e]                           dc.w $0000
[000c6c50]                           dc.w $0000
[000c6c52]                           dc.w $0000
[000c6c54]                           dc.w $0000
[000c6c56]                           dc.w $0000
[000c6c58]                           dc.w $0000
[000c6c5a]                           dc.w $0000
[000c6c5c]                           dc.w $0000
[000c6c5e]                           dc.w $0000
[000c6c60]                           dc.w $0000
[000c6c62]                           dc.w $0000
[000c6c64]                           dc.w $0000
[000c6c66]                           dc.w $0000
[000c6c68]                           dc.w $0000
[000c6c6a]                           dc.w $0000
[000c6c6c]                           dc.w $0000
[000c6c6e]                           dc.w $0000
[000c6c70]                           dc.w $0000
[000c6c72]                           dc.w $0000
[000c6c74]                           dc.w $0000
[000c6c76]                           dc.w $0000
[000c6c78]                           dc.w $0000
[000c6c7a]                           dc.w $0000
[000c6c7c]                           dc.w $0000
[000c6c7e]                           dc.w $0000
[000c6c80]                           dc.w $0000
[000c6c82]                           dc.w $0000
[000c6c84]                           dc.w $007f
[000c6c86]                           dc.w $ff00
[000c6c88]                           dc.w $0000
[000c6c8a]                           dc.w $0040
[000c6c8c]                           dc.w $0180
[000c6c8e]                           dc.w $0000
[000c6c90]                           dc.w $004f
[000c6c92]                           dc.w $f980
[000c6c94]                           dc.w $0000
[000c6c96]                           dc.w $0040
[000c6c98]                           dc.w $0180
[000c6c9a]                           dc.w $0000
[000c6c9c]                           dc.w $0040
[000c6c9e]                           dc.w $0180
[000c6ca0]                           dc.w $0000
[000c6ca2]                           dc.w $0055
[000c6ca4]                           dc.w $5580
[000c6ca6]                           dc.w $0000
[000c6ca8]                           dc.w $0040
[000c6caa]                           dc.w $0180
[000c6cac]                           dc.w $0000
[000c6cae]                           dc.w $007f
[000c6cb0]                           dc.w $ffff
[000c6cb2]                           dc.w $f000
[000c6cb4]                           dc.w $0070
[000c6cb6]                           dc.w $0700
[000c6cb8]                           dc.w $1800
[000c6cba]                           dc.w $007f
[000c6cbc]                           dc.w $ff3f
[000c6cbe]                           dc.w $9800
[000c6cc0]                           dc.w $0040
[000c6cc2]                           dc.w $0100
[000c6cc4]                           dc.w $1800
[000c6cc6]                           dc.w $004f
[000c6cc8]                           dc.w $f9ff
[000c6cca]                           dc.w $f800
[000c6ccc]                           dc.w $0040
[000c6cce]                           dc.w $01c0
[000c6cd0]                           dc.w $7800
[000c6cd2]                           dc.w $0040
[000c6cd4]                           dc.w $01ff
[000c6cd6]                           dc.w $f800
[000c6cd8]                           dc.w $004f
[000c6cda]                           dc.w $f9ff
[000c6cdc]                           dc.w $f800
[000c6cde]                           dc.w $0040
[000c6ce0]                           dc.w $01ff
[000c6ce2]                           dc.w $f800
[000c6ce4]                           dc.w $007f
[000c6ce6]                           dc.w $ff80
[000c6ce8]                           dc.w $0000
[000c6cea]                           dc.w $003f
[000c6cec]                           dc.w $ff80
[000c6cee]                           dc.w $0000
[000c6cf0]                           dc.w $0000
[000c6cf2]                           dc.w $0000
[000c6cf4]                           dc.w $0000
[000c6cf6]                           dc.w $0000
[000c6cf8]                           dc.w $0000
[000c6cfa]                           dc.w $0000
[000c6cfc]                           dc.w $0000
[000c6cfe]                           dc.w $0000
[000c6d00]                           dc.w $0000
[000c6d02]                           dc.w $0000
[000c6d04]                           dc.w $0000
[000c6d06]                           dc.w $0000
[000c6d08]                           dc.w $0000
[000c6d0a]                           dc.w $0000
[000c6d0c]                           dc.w $0000
DATAS_20:
[000c6d0e]                           dc.w $0000
[000c6d10]                           dc.w $0000
[000c6d12]                           dc.w $0000
[000c6d14]                           dc.w $0000
[000c6d16]                           dc.w $0000
[000c6d18]                           dc.w $0000
[000c6d1a]                           dc.w $0000
[000c6d1c]                           dc.w $0000
[000c6d1e]                           dc.w $0000
[000c6d20]                           dc.w $0000
[000c6d22]                           dc.w $0000
[000c6d24]                           dc.w $0000
[000c6d26]                           dc.w $0000
[000c6d28]                           dc.w $0000
[000c6d2a]                           dc.w $0000
[000c6d2c]                           dc.w $0000
[000c6d2e]                           dc.w $0000
[000c6d30]                           dc.w $0000
[000c6d32]                           dc.w $007f
[000c6d34]                           dc.w $ff00
[000c6d36]                           dc.w $0000
[000c6d38]                           dc.w $007f
[000c6d3a]                           dc.w $ff80
[000c6d3c]                           dc.w $0000
[000c6d3e]                           dc.w $007f
[000c6d40]                           dc.w $ff80
[000c6d42]                           dc.w $0000
[000c6d44]                           dc.w $007f
[000c6d46]                           dc.w $ff80
[000c6d48]                           dc.w $0000
[000c6d4a]                           dc.w $007f
[000c6d4c]                           dc.w $ff80
[000c6d4e]                           dc.w $0000
[000c6d50]                           dc.w $007f
[000c6d52]                           dc.w $ff80
[000c6d54]                           dc.w $0000
[000c6d56]                           dc.w $007f
[000c6d58]                           dc.w $ff80
[000c6d5a]                           dc.w $0000
[000c6d5c]                           dc.w $007f
[000c6d5e]                           dc.w $ffff
[000c6d60]                           dc.w $f000
[000c6d62]                           dc.w $007f
[000c6d64]                           dc.w $ffff
[000c6d66]                           dc.w $f800
[000c6d68]                           dc.w $007f
[000c6d6a]                           dc.w $ffff
[000c6d6c]                           dc.w $f800
[000c6d6e]                           dc.w $007f
[000c6d70]                           dc.w $ffff
[000c6d72]                           dc.w $f800
[000c6d74]                           dc.w $007f
[000c6d76]                           dc.w $ffff
[000c6d78]                           dc.w $f800
[000c6d7a]                           dc.w $007f
[000c6d7c]                           dc.w $ffff
[000c6d7e]                           dc.w $f800
[000c6d80]                           dc.w $007f
[000c6d82]                           dc.w $ffff
[000c6d84]                           dc.w $f800
[000c6d86]                           dc.w $007f
[000c6d88]                           dc.w $ffff
[000c6d8a]                           dc.w $f800
[000c6d8c]                           dc.w $007f
[000c6d8e]                           dc.w $ffff
[000c6d90]                           dc.w $f800
[000c6d92]                           dc.w $007f
[000c6d94]                           dc.w $ff80
[000c6d96]                           dc.w $0000
[000c6d98]                           dc.w $003f
[000c6d9a]                           dc.w $ff80
[000c6d9c]                           dc.w $0000
[000c6d9e]                           dc.w $0000
[000c6da0]                           dc.w $0000
[000c6da2]                           dc.w $0000
[000c6da4]                           dc.w $0000
[000c6da6]                           dc.w $0000
[000c6da8]                           dc.w $0000
[000c6daa]                           dc.w $0000
[000c6dac]                           dc.w $0000
[000c6dae]                           dc.w $0000
[000c6db0]                           dc.w $0000
[000c6db2]                           dc.w $0000
[000c6db4]                           dc.w $0000
[000c6db6]                           dc.w $0000
[000c6db8]                           dc.w $0000
[000c6dba]                           dc.w $0000
DATAS_21:
[000c6dbc]                           dc.w $0000
[000c6dbe]                           dc.w $0000
[000c6dc0]                           dc.w $02f0
[000c6dc2]                           dc.w $0000
[000c6dc4]                           dc.w $0000
[000c6dc6]                           dc.w $0000
[000c6dc8]                           dc.w $7fff
[000c6dca]                           dc.w $ffff
[000c6dcc]                           dc.w $fffe
[000c6dce]                           dc.w $4000
[000c6dd0]                           dc.w $0000
[000c6dd2]                           dc.w $0002
[000c6dd4]                           dc.w $5fff
[000c6dd6]                           dc.w $ffff
[000c6dd8]                           dc.w $fffa
[000c6dda]                           dc.w $5800
[000c6ddc]                           dc.w $03ff
[000c6dde]                           dc.w $fffa
[000c6de0]                           dc.w $5800
[000c6de2]                           dc.w $038f
[000c6de4]                           dc.w $f81a
[000c6de6]                           dc.w $58ef
[000c6de8]                           dc.w $63bf
[000c6dea]                           dc.w $ffda
[000c6dec]                           dc.w $5800
[000c6dee]                           dc.w $03bf
[000c6df0]                           dc.w $ffda
[000c6df2]                           dc.w $5800
[000c6df4]                           dc.w $03bf
[000c6df6]                           dc.w $ffda
[000c6df8]                           dc.w $5fff
[000c6dfa]                           dc.w $ffbf
[000c6dfc]                           dc.w $ffda
[000c6dfe]                           dc.w $5fff
[000c6e00]                           dc.w $ffbf
[000c6e02]                           dc.w $ffda
[000c6e04]                           dc.w $5800
[000c6e06]                           dc.w $03bf
[000c6e08]                           dc.w $ffda
[000c6e0a]                           dc.w $5800
[000c6e0c]                           dc.w $03bf
[000c6e0e]                           dc.w $ffda
[000c6e10]                           dc.w $58f6
[000c6e12]                           dc.w $e3bf
[000c6e14]                           dc.w $ffda
[000c6e16]                           dc.w $5800
[000c6e18]                           dc.w $03bf
[000c6e1a]                           dc.w $ffda
[000c6e1c]                           dc.w $5800
[000c6e1e]                           dc.w $0380
[000c6e20]                           dc.w $001a
[000c6e22]                           dc.w $5fff
[000c6e24]                           dc.w $ffff
[000c6e26]                           dc.w $fffa
[000c6e28]                           dc.w $5fff
[000c6e2a]                           dc.w $ffff
[000c6e2c]                           dc.w $fffa
[000c6e2e]                           dc.w $5fff
[000c6e30]                           dc.w $ffff
[000c6e32]                           dc.w $fffa
[000c6e34]                           dc.w $5fff
[000c6e36]                           dc.w $ffff
[000c6e38]                           dc.w $fffa
[000c6e3a]                           dc.w $5fff
[000c6e3c]                           dc.w $ffff
[000c6e3e]                           dc.w $fffa
[000c6e40]                           dc.w $5fc0
[000c6e42]                           dc.w $07c0
[000c6e44]                           dc.w $01fa
[000c6e46]                           dc.w $5fdf
[000c6e48]                           dc.w $f7df
[000c6e4a]                           dc.w $fdfa
[000c6e4c]                           dc.w $5fdf
[000c6e4e]                           dc.w $f7df
[000c6e50]                           dc.w $fdfa
[000c6e52]                           dc.w $5fdf
[000c6e54]                           dc.w $f7df
[000c6e56]                           dc.w $fdfa
[000c6e58]                           dc.w $5fc0
[000c6e5a]                           dc.w $07c0
[000c6e5c]                           dc.w $01fa
[000c6e5e]                           dc.w $5fff
[000c6e60]                           dc.w $ffff
[000c6e62]                           dc.w $fffa
[000c6e64]                           dc.w $5fff
[000c6e66]                           dc.w $ffff
[000c6e68]                           dc.w $fffa
[000c6e6a]                           dc.w $4000
[000c6e6c]                           dc.w $0000
[000c6e6e]                           dc.w $0002
[000c6e70]                           dc.w $7fff
[000c6e72]                           dc.w $ffff
[000c6e74]                           dc.w $fffe
[000c6e76]                           dc.w $0000
[000c6e78]                           dc.w $0000
[000c6e7a]                           dc.w $0000
[000c6e7c]                           dc.w $0000
[000c6e7e]                           dc.w $0000
[000c6e80]                           dc.w $0000
[000c6e82]                           dc.w $7fff
[000c6e84]                           dc.w $ffff
[000c6e86]                           dc.w $fffe
[000c6e88]                           dc.w $4000
[000c6e8a]                           dc.w $0000
[000c6e8c]                           dc.w $0002
[000c6e8e]                           dc.w $5fff
[000c6e90]                           dc.w $ffff
[000c6e92]                           dc.w $fffa
[000c6e94]                           dc.w $5800
[000c6e96]                           dc.w $03ff
[000c6e98]                           dc.w $fffa
[000c6e9a]                           dc.w $5800
[000c6e9c]                           dc.w $038f
[000c6e9e]                           dc.w $f81a
[000c6ea0]                           dc.w $58ef
[000c6ea2]                           dc.w $63bf
[000c6ea4]                           dc.w $ffda
[000c6ea6]                           dc.w $5800
[000c6ea8]                           dc.w $03bf
[000c6eaa]                           dc.w $ffda
[000c6eac]                           dc.w $5800
[000c6eae]                           dc.w $03bf
[000c6eb0]                           dc.w $ffda
[000c6eb2]                           dc.w $5fff
[000c6eb4]                           dc.w $ffbf
[000c6eb6]                           dc.w $ffda
[000c6eb8]                           dc.w $5fff
[000c6eba]                           dc.w $ffbf
[000c6ebc]                           dc.w $ffda
[000c6ebe]                           dc.w $5800
[000c6ec0]                           dc.w $03bf
[000c6ec2]                           dc.w $ffda
[000c6ec4]                           dc.w $5800
[000c6ec6]                           dc.w $03bf
[000c6ec8]                           dc.w $ffda
[000c6eca]                           dc.w $58f6
[000c6ecc]                           dc.w $e3bf
[000c6ece]                           dc.w $ffda
[000c6ed0]                           dc.w $5800
[000c6ed2]                           dc.w $03bf
[000c6ed4]                           dc.w $ffda
[000c6ed6]                           dc.w $5800
[000c6ed8]                           dc.w $0380
[000c6eda]                           dc.w $001a
[000c6edc]                           dc.w $5fff
[000c6ede]                           dc.w $ffff
[000c6ee0]                           dc.w $fffa
[000c6ee2]                           dc.w $5fff
[000c6ee4]                           dc.w $ffff
[000c6ee6]                           dc.w $fffa
[000c6ee8]                           dc.w $5fff
[000c6eea]                           dc.w $ffff
[000c6eec]                           dc.w $fffa
[000c6eee]                           dc.w $5fff
[000c6ef0]                           dc.w $ffff
[000c6ef2]                           dc.w $fffa
[000c6ef4]                           dc.w $5fff
[000c6ef6]                           dc.w $ffff
[000c6ef8]                           dc.w $fffa
[000c6efa]                           dc.w $5fc0
[000c6efc]                           dc.w $07c0
[000c6efe]                           dc.w $01fa
[000c6f00]                           dc.w $5fdf
[000c6f02]                           dc.w $f7df
[000c6f04]                           dc.w $fdfa
[000c6f06]                           dc.w $5fdf
[000c6f08]                           dc.w $f7df
[000c6f0a]                           dc.w $fdfa
[000c6f0c]                           dc.w $5fdf
[000c6f0e]                           dc.w $f7df
[000c6f10]                           dc.w $fdfa
[000c6f12]                           dc.w $5fc0
[000c6f14]                           dc.w $07c0
[000c6f16]                           dc.w $01fa
[000c6f18]                           dc.w $5fff
[000c6f1a]                           dc.w $ffff
[000c6f1c]                           dc.w $fffa
[000c6f1e]                           dc.w $5fff
[000c6f20]                           dc.w $ffff
[000c6f22]                           dc.w $fffa
[000c6f24]                           dc.w $4000
[000c6f26]                           dc.w $0000
[000c6f28]                           dc.w $0002
[000c6f2a]                           dc.w $7fff
[000c6f2c]                           dc.w $ffff
[000c6f2e]                           dc.w $fffe
[000c6f30]                           dc.w $0000
[000c6f32]                           dc.w $0000
[000c6f34]                           dc.w $0000
[000c6f36]                           dc.w $0000
[000c6f38]                           dc.w $0000
[000c6f3a]                           dc.w $0000
[000c6f3c]                           dc.w $7fff
[000c6f3e]                           dc.w $ffff
[000c6f40]                           dc.w $fffe
[000c6f42]                           dc.w $4000
[000c6f44]                           dc.w $0000
[000c6f46]                           dc.w $0002
[000c6f48]                           dc.w $5fff
[000c6f4a]                           dc.w $ffff
[000c6f4c]                           dc.w $fffa
[000c6f4e]                           dc.w $5800
[000c6f50]                           dc.w $03ff
[000c6f52]                           dc.w $fffa
[000c6f54]                           dc.w $5800
[000c6f56]                           dc.w $038f
[000c6f58]                           dc.w $f81a
[000c6f5a]                           dc.w $58ef
[000c6f5c]                           dc.w $63bf
[000c6f5e]                           dc.w $ffda
[000c6f60]                           dc.w $5800
[000c6f62]                           dc.w $03bf
[000c6f64]                           dc.w $ffda
[000c6f66]                           dc.w $5800
[000c6f68]                           dc.w $03bf
[000c6f6a]                           dc.w $ffda
[000c6f6c]                           dc.w $5fff
[000c6f6e]                           dc.w $ffbf
[000c6f70]                           dc.w $ffda
[000c6f72]                           dc.w $5fff
[000c6f74]                           dc.w $ffbf
[000c6f76]                           dc.w $ffda
[000c6f78]                           dc.w $5800
[000c6f7a]                           dc.w $03bf
[000c6f7c]                           dc.w $ffda
[000c6f7e]                           dc.w $5800
[000c6f80]                           dc.w $03bf
[000c6f82]                           dc.w $ffda
[000c6f84]                           dc.w $58f6
[000c6f86]                           dc.w $e3bf
[000c6f88]                           dc.w $ffda
[000c6f8a]                           dc.w $5800
[000c6f8c]                           dc.w $03bf
[000c6f8e]                           dc.w $ffda
[000c6f90]                           dc.w $5800
[000c6f92]                           dc.w $0380
[000c6f94]                           dc.w $001a
[000c6f96]                           dc.w $5fff
[000c6f98]                           dc.w $ffff
[000c6f9a]                           dc.w $fffa
[000c6f9c]                           dc.w $5fff
[000c6f9e]                           dc.w $ffff
[000c6fa0]                           dc.w $fffa
[000c6fa2]                           dc.w $5fff
[000c6fa4]                           dc.w $ffff
[000c6fa6]                           dc.w $fffa
[000c6fa8]                           dc.w $5fff
[000c6faa]                           dc.w $ffff
[000c6fac]                           dc.w $fffa
[000c6fae]                           dc.w $5fff
[000c6fb0]                           dc.w $ffff
[000c6fb2]                           dc.w $fffa
[000c6fb4]                           dc.w $5fc0
[000c6fb6]                           dc.w $07c0
[000c6fb8]                           dc.w $01fa
[000c6fba]                           dc.w $5fdf
[000c6fbc]                           dc.w $f7df
[000c6fbe]                           dc.w $fdfa
[000c6fc0]                           dc.w $5fdf
[000c6fc2]                           dc.w $f7df
[000c6fc4]                           dc.w $fdfa
[000c6fc6]                           dc.w $5fdf
[000c6fc8]                           dc.w $f7df
[000c6fca]                           dc.w $fdfa
[000c6fcc]                           dc.w $5fc0
[000c6fce]                           dc.w $07c0
[000c6fd0]                           dc.w $01fa
[000c6fd2]                           dc.w $5fff
[000c6fd4]                           dc.w $ffff
[000c6fd6]                           dc.w $fffa
[000c6fd8]                           dc.w $5fff
[000c6fda]                           dc.w $ffff
[000c6fdc]                           dc.w $fffa
[000c6fde]                           dc.w $4000
[000c6fe0]                           dc.w $0000
[000c6fe2]                           dc.w $0002
[000c6fe4]                           dc.w $7fff
[000c6fe6]                           dc.w $ffff
[000c6fe8]                           dc.w $fffe
[000c6fea]                           dc.w $0000
[000c6fec]                           dc.w $0000
[000c6fee]                           dc.w $0000
[000c6ff0]                           dc.w $0000
[000c6ff2]                           dc.w $0000
[000c6ff4]                           dc.w $0000
[000c6ff6]                           dc.w $7fff
[000c6ff8]                           dc.w $ffff
[000c6ffa]                           dc.w $fffe
[000c6ffc]                           dc.w $4000
[000c6ffe]                           dc.w $0000
[000c7000]                           dc.w $0006
[000c7002]                           dc.w $4000
[000c7004]                           dc.w $0000
[000c7006]                           dc.w $0006
[000c7008]                           dc.w $47ff
[000c700a]                           dc.w $fc07
[000c700c]                           dc.w $f006
[000c700e]                           dc.w $4400
[000c7010]                           dc.w $0470
[000c7012]                           dc.w $07e6
[000c7014]                           dc.w $44ef
[000c7016]                           dc.w $6440
[000c7018]                           dc.w $0026
[000c701a]                           dc.w $4400
[000c701c]                           dc.w $0453
[000c701e]                           dc.w $dfa6
[000c7020]                           dc.w $47ff
[000c7022]                           dc.w $fc40
[000c7024]                           dc.w $0026
[000c7026]                           dc.w $4000
[000c7028]                           dc.w $0040
[000c702a]                           dc.w $0026
[000c702c]                           dc.w $4000
[000c702e]                           dc.w $0053
[000c7030]                           dc.w $f7a6
[000c7032]                           dc.w $47ff
[000c7034]                           dc.w $fc40
[000c7036]                           dc.w $0026
[000c7038]                           dc.w $4400
[000c703a]                           dc.w $0440
[000c703c]                           dc.w $0026
[000c703e]                           dc.w $44f6
[000c7040]                           dc.w $e453
[000c7042]                           dc.w $bfa6
[000c7044]                           dc.w $4400
[000c7046]                           dc.w $0440
[000c7048]                           dc.w $0026
[000c704a]                           dc.w $47ff
[000c704c]                           dc.w $fc7f
[000c704e]                           dc.w $ffe6
[000c7050]                           dc.w $4000
[000c7052]                           dc.w $0000
[000c7054]                           dc.w $0006
[000c7056]                           dc.w $4000
[000c7058]                           dc.w $0000
[000c705a]                           dc.w $0006
[000c705c]                           dc.w $4000
[000c705e]                           dc.w $0000
[000c7060]                           dc.w $0006
[000c7062]                           dc.w $4000
[000c7064]                           dc.w $0000
[000c7066]                           dc.w $0006
[000c7068]                           dc.w $407f
[000c706a]                           dc.w $fc7f
[000c706c]                           dc.w $ff06
[000c706e]                           dc.w $4040
[000c7070]                           dc.w $0c40
[000c7072]                           dc.w $0306
[000c7074]                           dc.w $4040
[000c7076]                           dc.w $0c40
[000c7078]                           dc.w $0306
[000c707a]                           dc.w $4047
[000c707c]                           dc.w $cc47
[000c707e]                           dc.w $f306
[000c7080]                           dc.w $4040
[000c7082]                           dc.w $0c40
[000c7084]                           dc.w $0306
[000c7086]                           dc.w $407f
[000c7088]                           dc.w $fc7f
[000c708a]                           dc.w $ff06
[000c708c]                           dc.w $407f
[000c708e]                           dc.w $fc7f
[000c7090]                           dc.w $ff06
[000c7092]                           dc.w $4000
[000c7094]                           dc.w $0000
[000c7096]                           dc.w $0006
[000c7098]                           dc.w $7fff
[000c709a]                           dc.w $ffff
[000c709c]                           dc.w $fffe
[000c709e]                           dc.w $7fff
[000c70a0]                           dc.w $ffff
[000c70a2]                           dc.w $fffe
[000c70a4]                           dc.w $0000
[000c70a6]                           dc.w $0000
[000c70a8]                           dc.w $0000
DATAS_22:
[000c70aa]                           dc.w $0000
[000c70ac]                           dc.w $0000
[000c70ae]                           dc.w $0000
[000c70b0]                           dc.w $7fff
[000c70b2]                           dc.w $ffff
[000c70b4]                           dc.w $fffe
[000c70b6]                           dc.w $7fff
[000c70b8]                           dc.w $ffff
[000c70ba]                           dc.w $fffe
[000c70bc]                           dc.w $7fff
[000c70be]                           dc.w $ffff
[000c70c0]                           dc.w $fffe
[000c70c2]                           dc.w $7fff
[000c70c4]                           dc.w $ffff
[000c70c6]                           dc.w $fffe
[000c70c8]                           dc.w $7fff
[000c70ca]                           dc.w $ffff
[000c70cc]                           dc.w $fffe
[000c70ce]                           dc.w $7fff
[000c70d0]                           dc.w $ffff
[000c70d2]                           dc.w $fffe
[000c70d4]                           dc.w $7fff
[000c70d6]                           dc.w $ffff
[000c70d8]                           dc.w $fffe
[000c70da]                           dc.w $7fff
[000c70dc]                           dc.w $ffff
[000c70de]                           dc.w $fffe
[000c70e0]                           dc.w $7fff
[000c70e2]                           dc.w $ffff
[000c70e4]                           dc.w $fffe
[000c70e6]                           dc.w $7fff
[000c70e8]                           dc.w $ffff
[000c70ea]                           dc.w $fffe
[000c70ec]                           dc.w $7fff
[000c70ee]                           dc.w $ffff
[000c70f0]                           dc.w $fffe
[000c70f2]                           dc.w $7fff
[000c70f4]                           dc.w $ffff
[000c70f6]                           dc.w $fffe
[000c70f8]                           dc.w $7fff
[000c70fa]                           dc.w $ffff
[000c70fc]                           dc.w $fffe
[000c70fe]                           dc.w $7fff
[000c7100]                           dc.w $ffff
[000c7102]                           dc.w $fffe
[000c7104]                           dc.w $7fff
[000c7106]                           dc.w $ffff
[000c7108]                           dc.w $fffe
[000c710a]                           dc.w $7fff
[000c710c]                           dc.w $ffff
[000c710e]                           dc.w $fffe
[000c7110]                           dc.w $7fff
[000c7112]                           dc.w $ffff
[000c7114]                           dc.w $fffe
[000c7116]                           dc.w $7fff
[000c7118]                           dc.w $ffff
[000c711a]                           dc.w $fffe
[000c711c]                           dc.w $7fff
[000c711e]                           dc.w $ffff
[000c7120]                           dc.w $fffe
[000c7122]                           dc.w $7fff
[000c7124]                           dc.w $ffff
[000c7126]                           dc.w $fffe
[000c7128]                           dc.w $7fff
[000c712a]                           dc.w $ffff
[000c712c]                           dc.w $fffe
[000c712e]                           dc.w $7fff
[000c7130]                           dc.w $ffff
[000c7132]                           dc.w $fffe
[000c7134]                           dc.w $7fff
[000c7136]                           dc.w $ffff
[000c7138]                           dc.w $fffe
[000c713a]                           dc.w $7fff
[000c713c]                           dc.w $ffff
[000c713e]                           dc.w $fffe
[000c7140]                           dc.w $7fff
[000c7142]                           dc.w $ffff
[000c7144]                           dc.w $fffe
[000c7146]                           dc.w $7fff
[000c7148]                           dc.w $ffff
[000c714a]                           dc.w $fffe
[000c714c]                           dc.w $7fff
[000c714e]                           dc.w $ffff
[000c7150]                           dc.w $fffe
[000c7152]                           dc.w $7fff
[000c7154]                           dc.w $ffff
[000c7156]                           dc.w $fffe
[000c7158]                           dc.w $7fff
[000c715a]                           dc.w $ffff
[000c715c]                           dc.w $fffe
[000c715e]                           dc.w $0000
[000c7160]                           dc.w $0000
[000c7162]                           dc.w $0000
TEDI_001:
[000c7164] 000c4b1b                  dc.l TEXT_006
[000c7168] 000c4b17                  dc.l TEXT_002
[000c716c] 000c4b17                  dc.l TEXT_002
[000c7170]                           dc.w $0003
[000c7172]                           dc.w $0006
[000c7174]                           dc.w $0000
[000c7176]                           dc.w $1180
[000c7178]                           dc.w $0000
[000c717a]                           dc.w $0000
[000c717c]                           dc.w $0020
[000c717e]                           dc.w $0001
TEDI_042:
[000c7180] 000c4cc2                  dc.l TEXT_133
[000c7184] 000c4b17                  dc.l TEXT_002
[000c7188] 000c4b17                  dc.l TEXT_002
[000c718c]                           dc.w $0003
[000c718e]                           dc.w $0006
[000c7190]                           dc.w $0001
[000c7192]                           dc.w $1180
[000c7194]                           dc.w $0000
[000c7196]                           dc.w $0000
[000c7198]                           dc.w $0007
[000c719a]                           dc.w $0001
A_3DBUTTON01:
[000c719c] 00064a22                  dc.l A_3Dbutton
[000c71a0]                           dc.w $2011
[000c71a2]                           dc.w $9178
[000c71a4] 000630f2                  dc.l Auo_string
[000c71a8]                           dc.w $0000
[000c71aa]                           dc.w $0000
[000c71ac]                           dc.w $0000
[000c71ae]                           dc.w $0000
[000c71b0]                           dc.w $0000
[000c71b2]                           dc.w $0000
[000c71b4]                           dc.w $0000
[000c71b6]                           dc.w $0000
[000c71b8]                           dc.w $0000
[000c71ba]                           dc.w $0000
A_3DBUTTON02:
[000c71bc] 00064a22                  dc.l A_3Dbutton
[000c71c0]                           dc.w $29f1
[000c71c2]                           dc.w $01f8
[000c71c4] 000630f2                  dc.l Auo_string
[000c71c8]                           dc.w $0000
[000c71ca]                           dc.w $0000
[000c71cc]                           dc.w $0000
[000c71ce]                           dc.w $0000
[000c71d0]                           dc.w $0000
[000c71d2]                           dc.w $0000
[000c71d4]                           dc.w $0000
[000c71d6]                           dc.w $0000
[000c71d8]                           dc.w $0000
[000c71da]                           dc.w $0000
A_3DBUTTON03:
[000c71dc] 00064a22                  dc.l A_3Dbutton
[000c71e0]                           dc.w $29c1
[000c71e2]                           dc.w $0178
[000c71e4] 000630f2                  dc.l Auo_string
[000c71e8] 000c4b18                  dc.l TEXT_003
[000c71ec]                           dc.w $0000
[000c71ee]                           dc.w $0000
[000c71f0]                           dc.w $0000
[000c71f2]                           dc.w $0000
[000c71f4]                           dc.w $0000
[000c71f6]                           dc.w $0000
[000c71f8]                           dc.w $0000
[000c71fa]                           dc.w $0000
A_3DBUTTON04:
[000c71fc] 00064a22                  dc.l A_3Dbutton
[000c7200]                           dc.w $09f1
[000c7202]                           dc.w $0178
[000c7204] 000630f2                  dc.l Auo_string
[000c7208] 000c4ba5                  dc.l TEXT_05
[000c720c]                           dc.w $0000
[000c720e]                           dc.w $0000
[000c7210]                           dc.w $0000
[000c7212]                           dc.w $0000
[000c7214]                           dc.w $0000
[000c7216]                           dc.w $0000
[000c7218]                           dc.w $0000
[000c721a]                           dc.w $0000
A_3DBUTTON05:
[000c721c] 00064a22                  dc.l A_3Dbutton
[000c7220]                           dc.w $29c1
[000c7222]                           dc.w $0178
[000c7224] 000630f2                  dc.l Auo_string
[000c7228] 000c4de9                  dc.l TEXT_301
[000c722c]                           dc.w $0000
[000c722e]                           dc.w $0000
[000c7230]                           dc.w $0000
[000c7232]                           dc.w $0000
[000c7234]                           dc.w $0000
[000c7236]                           dc.w $0000
[000c7238]                           dc.w $0000
[000c723a]                           dc.w $0000
A_3DBUTTON06:
[000c723c] 00064a22                  dc.l A_3Dbutton
[000c7240]                           dc.w $09f1
[000c7242]                           dc.w $0178
[000c7244] 000630f2                  dc.l Auo_string
[000c7248] 000c4b7a                  dc.l TEXT_03
[000c724c]                           dc.w $0000
[000c724e]                           dc.w $0000
[000c7250]                           dc.w $0000
[000c7252]                           dc.w $0000
[000c7254]                           dc.w $0000
[000c7256]                           dc.w $0000
[000c7258]                           dc.w $0000
[000c725a]                           dc.w $0000
A_3DBUTTON07:
[000c725c] 00064a22                  dc.l A_3Dbutton
[000c7260]                           dc.w $09f1
[000c7262]                           dc.w $0178
[000c7264] 000630f2                  dc.l Auo_string
[000c7268] 000c4ca8                  dc.l TEXT_11
[000c726c]                           dc.w $0000
[000c726e]                           dc.w $0000
[000c7270]                           dc.w $0000
[000c7272]                           dc.w $0000
[000c7274]                           dc.w $0000
[000c7276]                           dc.w $0000
[000c7278]                           dc.w $0000
[000c727a]                           dc.w $0000
A_3DBUTTON08:
[000c727c] 00064a22                  dc.l A_3Dbutton
[000c7280]                           dc.w $29f1
[000c7282]                           dc.w $0178
[000c7284] 000630f2                  dc.l Auo_string
[000c7288]                           dc.w $0000
[000c728a]                           dc.w $0000
[000c728c]                           dc.w $0000
[000c728e]                           dc.w $0000
[000c7290]                           dc.w $0000
[000c7292]                           dc.w $0000
[000c7294]                           dc.w $0000
[000c7296]                           dc.w $0000
[000c7298]                           dc.w $0000
[000c729a]                           dc.w $0000
A_3DBUTTON09:
[000c729c] 00064a22                  dc.l A_3Dbutton
[000c72a0]                           dc.w $09f1
[000c72a2]                           dc.w $0178
[000c72a4] 000630f2                  dc.l Auo_string
[000c72a8] 000c4d3c                  dc.l TEXT_19
[000c72ac]                           dc.w $0000
[000c72ae]                           dc.w $0000
[000c72b0]                           dc.w $0000
[000c72b2]                           dc.w $0000
[000c72b4]                           dc.w $0000
[000c72b6]                           dc.w $0000
[000c72b8]                           dc.w $0000
[000c72ba]                           dc.w $0000
A_3DBUTTON10:
[000c72bc] 00064a22                  dc.l A_3Dbutton
[000c72c0]                           dc.w $09f1
[000c72c2]                           dc.w $0178
[000c72c4] 000630f2                  dc.l Auo_string
[000c72c8] 000c4d4a                  dc.l TEXT_20
[000c72cc]                           dc.w $0000
[000c72ce]                           dc.w $0000
[000c72d0]                           dc.w $0000
[000c72d2]                           dc.w $0000
[000c72d4]                           dc.w $0000
[000c72d6]                           dc.w $0000
[000c72d8]                           dc.w $0000
[000c72da]                           dc.w $0000
A_3DBUTTON11:
[000c72dc] 00064a22                  dc.l A_3Dbutton
[000c72e0]                           dc.w $09f1
[000c72e2]                           dc.w $0178
[000c72e4] 000630f2                  dc.l Auo_string
[000c72e8] 000c4c52                  dc.l TEXT_092
[000c72ec]                           dc.w $0000
[000c72ee]                           dc.w $0000
[000c72f0]                           dc.w $0000
[000c72f2]                           dc.w $0000
[000c72f4]                           dc.w $0000
[000c72f6]                           dc.w $0000
[000c72f8]                           dc.w $0000
[000c72fa]                           dc.w $0000
A_3DBUTTON12:
[000c72fc] 00064a22                  dc.l A_3Dbutton
[000c7300]                           dc.w $29f1
[000c7302]                           dc.w $01f8
[000c7304] 000630f2                  dc.l Auo_string
[000c7308]                           dc.w $0000
[000c730a]                           dc.w $0000
[000c730c]                           dc.w $0000
[000c730e]                           dc.w $0000
[000c7310]                           dc.w $0000
[000c7312]                           dc.w $0000
[000c7314]                           dc.w $0000
[000c7316]                           dc.w $0000
[000c7318]                           dc.w $0000
[000c731a]                           dc.w $0000
A_3DBUTTON13:
[000c731c] 00064a22                  dc.l A_3Dbutton
[000c7320]                           dc.w $09f1
[000c7322]                           dc.w $0178
[000c7324] 000630f2                  dc.l Auo_string
[000c7328] 000c4dac                  dc.l TEXT_26
[000c732c]                           dc.w $0000
[000c732e]                           dc.w $0000
[000c7330]                           dc.w $0000
[000c7332]                           dc.w $0000
[000c7334]                           dc.w $0000
[000c7336]                           dc.w $0000
[000c7338]                           dc.w $0000
[000c733a]                           dc.w $0000
A_3DBUTTON14:
[000c733c] 00064a22                  dc.l A_3Dbutton
[000c7340]                           dc.w $09f1
[000c7342]                           dc.w $0178
[000c7344] 000630f2                  dc.l Auo_string
[000c7348] 000c4dc0                  dc.l TEXT_28
[000c734c]                           dc.w $0000
[000c734e]                           dc.w $0000
[000c7350]                           dc.w $0000
[000c7352]                           dc.w $0000
[000c7354]                           dc.w $0000
[000c7356]                           dc.w $0000
[000c7358]                           dc.w $0000
[000c735a]                           dc.w $0000
A_3DBUTTON15:
[000c735c] 00064a22                  dc.l A_3Dbutton
[000c7360]                           dc.w $09f1
[000c7362]                           dc.w $0178
[000c7364] 000630f2                  dc.l Auo_string
[000c7368] 000c4c4a                  dc.l TEXT_091
[000c736c]                           dc.w $0000
[000c736e]                           dc.w $0000
[000c7370]                           dc.w $0000
[000c7372]                           dc.w $0000
[000c7374]                           dc.w $0000
[000c7376]                           dc.w $0000
[000c7378]                           dc.w $0000
[000c737a]                           dc.w $0000
A_3DBUTTON16:
[000c737c] 00064a22                  dc.l A_3Dbutton
[000c7380]                           dc.w $09f1
[000c7382]                           dc.w $0178
[000c7384] 000630f2                  dc.l Auo_string
[000c7388] 000c4c41                  dc.l TEXT_090
[000c738c]                           dc.w $0000
[000c738e]                           dc.w $0000
[000c7390]                           dc.w $0000
[000c7392]                           dc.w $0000
[000c7394]                           dc.w $0000
[000c7396]                           dc.w $0000
[000c7398]                           dc.w $0000
[000c739a]                           dc.w $0000
A_3DBUTTON17:
[000c739c] 00064a22                  dc.l A_3Dbutton
[000c73a0]                           dc.w $09f1
[000c73a2]                           dc.w $0178
[000c73a4] 000630f2                  dc.l Auo_string
[000c73a8] 000c4c9f                  dc.l TEXT_100
[000c73ac]                           dc.w $0000
[000c73ae]                           dc.w $0000
[000c73b0]                           dc.w $0000
[000c73b2]                           dc.w $0000
[000c73b4]                           dc.w $0000
[000c73b6]                           dc.w $0000
[000c73b8]                           dc.w $0000
[000c73ba]                           dc.w $0000
A_3DBUTTON18:
[000c73bc] 00064a22                  dc.l A_3Dbutton
[000c73c0]                           dc.w $09f1
[000c73c2]                           dc.w $0178
[000c73c4] 000630f2                  dc.l Auo_string
[000c73c8] 000c4c5a                  dc.l TEXT_093
[000c73cc]                           dc.w $0000
[000c73ce]                           dc.w $0000
[000c73d0]                           dc.w $0000
[000c73d2]                           dc.w $0000
[000c73d4]                           dc.w $0000
[000c73d6]                           dc.w $0000
[000c73d8]                           dc.w $0000
[000c73da]                           dc.w $0000
A_3DBUTTON19:
[000c73dc] 00064a22                  dc.l A_3Dbutton
[000c73e0]                           dc.w $09f1
[000c73e2]                           dc.w $0178
[000c73e4] 000630f2                  dc.l Auo_string
[000c73e8] 000c4c6c                  dc.l TEXT_095
[000c73ec]                           dc.w $0000
[000c73ee]                           dc.w $0000
[000c73f0]                           dc.w $0000
[000c73f2]                           dc.w $0000
[000c73f4]                           dc.w $0000
[000c73f6]                           dc.w $0000
[000c73f8]                           dc.w $0000
[000c73fa]                           dc.w $0000
A_3DBUTTON20:
[000c73fc] 00064a22                  dc.l A_3Dbutton
[000c7400]                           dc.w $6800
[000c7402]                           dc.w $8178
[000c7404] 000630f2                  dc.l Auo_string
[000c7408] 000c4ddf                  dc.l TEXT_30
[000c740c]                           dc.w $0000
[000c740e]                           dc.w $0000
[000c7410]                           dc.w $0000
[000c7412]                           dc.w $0000
[000c7414]                           dc.w $0000
[000c7416]                           dc.w $0000
[000c7418]                           dc.w $0000
[000c741a]                           dc.w $0000
A_3DBUTTON21:
[000c741c] 00064a22                  dc.l A_3Dbutton
[000c7420]                           dc.w $29f1
[000c7422]                           dc.w $0178
[000c7424] 000630f2                  dc.l Auo_string
[000c7428] 000c4d85                  dc.l TEXT_24
[000c742c]                           dc.w $0000
[000c742e]                           dc.w $0000
[000c7430]                           dc.w $0000
[000c7432]                           dc.w $0000
[000c7434]                           dc.w $0000
[000c7436]                           dc.w $0000
[000c7438]                           dc.w $0000
[000c743a]                           dc.w $0000
A_3DBUTTON22:
[000c743c] 00064a22                  dc.l A_3Dbutton
[000c7440]                           dc.w $6800
[000c7442]                           dc.w $8178
[000c7444] 000630f2                  dc.l Auo_string
[000c7448] 000c4df1                  dc.l TEXT_31
[000c744c]                           dc.w $0000
[000c744e]                           dc.w $0000
[000c7450]                           dc.w $0000
[000c7452]                           dc.w $0000
[000c7454]                           dc.w $0000
[000c7456]                           dc.w $0000
[000c7458]                           dc.w $0000
[000c745a]                           dc.w $0000
A_3DBUTTON23:
[000c745c] 00064a22                  dc.l A_3Dbutton
[000c7460]                           dc.w $29f1
[000c7462]                           dc.w $0178
[000c7464] 000630f2                  dc.l Auo_string
[000c7468] 000c4dd4                  dc.l TEXT_29
[000c746c]                           dc.w $0000
[000c746e]                           dc.w $0000
[000c7470]                           dc.w $0000
[000c7472]                           dc.w $0000
[000c7474]                           dc.w $0000
[000c7476]                           dc.w $0000
[000c7478]                           dc.w $0000
[000c747a]                           dc.w $0000
A_3DBUTTON24:
[000c747c] 00064a22                  dc.l A_3Dbutton
[000c7480]                           dc.w $29f1
[000c7482]                           dc.w $0178
[000c7484] 000630f2                  dc.l Auo_string
[000c7488] 000c4e1a                  dc.l TEXT_35
[000c748c]                           dc.w $0000
[000c748e]                           dc.w $0000
[000c7490]                           dc.w $0000
[000c7492]                           dc.w $0000
[000c7494]                           dc.w $0000
[000c7496]                           dc.w $0000
[000c7498]                           dc.w $0000
[000c749a]                           dc.w $0000
A_3DBUTTON25:
[000c749c] 00064a22                  dc.l A_3Dbutton
[000c74a0]                           dc.w $29f1
[000c74a2]                           dc.w $0178
[000c74a4] 000630f2                  dc.l Auo_string
[000c74a8] 000c4e25                  dc.l TEXT_36
[000c74ac]                           dc.w $0000
[000c74ae]                           dc.w $0000
[000c74b0]                           dc.w $0000
[000c74b2]                           dc.w $0000
[000c74b4]                           dc.w $0000
[000c74b6]                           dc.w $0000
[000c74b8]                           dc.w $0000
[000c74ba]                           dc.w $0000
A_3DBUTTON26:
[000c74bc] 00064a22                  dc.l A_3Dbutton
[000c74c0]                           dc.w $29f1
[000c74c2]                           dc.w $0178
[000c74c4] 000630f2                  dc.l Auo_string
[000c74c8] 000c4dfd                  dc.l TEXT_32
[000c74cc]                           dc.w $0000
[000c74ce]                           dc.w $0000
[000c74d0]                           dc.w $0000
[000c74d2]                           dc.w $0000
[000c74d4]                           dc.w $0000
[000c74d6]                           dc.w $0000
[000c74d8]                           dc.w $0000
[000c74da]                           dc.w $0000
A_3DBUTTON28:
[000c74dc] 00064a22                  dc.l A_3Dbutton
[000c74e0]                           dc.w $29f1
[000c74e2]                           dc.w $0178
[000c74e4] 000630f2                  dc.l Auo_string
[000c74e8] 000c4e0f                  dc.l TEXT_34
[000c74ec]                           dc.w $0000
[000c74ee]                           dc.w $0000
[000c74f0]                           dc.w $0000
[000c74f2]                           dc.w $0000
[000c74f4]                           dc.w $0000
[000c74f6]                           dc.w $0000
[000c74f8]                           dc.w $0000
[000c74fa]                           dc.w $0000
A_ARROWS02:
[000c74fc] 00065c72                  dc.l A_arrows
[000c7500]                           dc.w $2209
[000c7502]                           dc.w $0001
[000c7504]                           dc.w $0000
[000c7506]                           dc.w $0000
[000c7508]                           dc.w $0000
[000c750a]                           dc.w $0000
[000c750c]                           dc.w $0000
[000c750e]                           dc.w $0000
[000c7510]                           dc.w $0000
[000c7512]                           dc.w $0000
[000c7514]                           dc.w $0000
[000c7516]                           dc.w $0000
[000c7518]                           dc.w $0000
[000c751a]                           dc.w $0000
A_ARROWS03:
[000c751c] 00065c72                  dc.l A_arrows
[000c7520]                           dc.w $0001
[000c7522]                           dc.w $0001
[000c7524]                           dc.w $0000
[000c7526]                           dc.w $0000
[000c7528]                           dc.w $0000
[000c752a]                           dc.w $0000
[000c752c]                           dc.w $0000
[000c752e]                           dc.w $0000
[000c7530]                           dc.w $0000
[000c7532]                           dc.w $0000
[000c7534]                           dc.w $0000
[000c7536]                           dc.w $0000
[000c7538]                           dc.w $0000
[000c753a]                           dc.w $0000
A_BOXED01:
[000c753c] 0006afea                  dc.l A_boxed
[000c7540]                           dc.w $9078
[000c7542]                           dc.w $0412
[000c7544] 0006a068                  dc.l Auo_boxed
[000c7548]                           dc.w $0000
[000c754a]                           dc.w $0000
[000c754c]                           dc.w $0000
[000c754e]                           dc.w $0000
[000c7550]                           dc.w $0000
[000c7552]                           dc.w $0000
[000c7554]                           dc.w $0000
[000c7556]                           dc.w $0000
[000c7558]                           dc.w $0000
[000c755a]                           dc.w $0000
A_BOXED02:
[000c755c] 0006afea                  dc.l A_boxed
[000c7560]                           dc.w $9078
[000c7562]                           dc.w $0412
[000c7564] 0006a068                  dc.l Auo_boxed
[000c7568]                           dc.w $0000
[000c756a]                           dc.w $0000
[000c756c]                           dc.w $0000
[000c756e]                           dc.w $0000
[000c7570]                           dc.w $0000
[000c7572]                           dc.w $0000
[000c7574]                           dc.w $0000
[000c7576]                           dc.w $0000
[000c7578]                           dc.w $0000
[000c757a]                           dc.w $0000
A_BOXED03:
[000c757c] 0006afea                  dc.l A_boxed
[000c7580]                           dc.w $9078
[000c7582]                           dc.w $0412
[000c7584] 0006a068                  dc.l Auo_boxed
[000c7588]                           dc.w $0000
[000c758a]                           dc.w $0000
[000c758c]                           dc.w $0000
[000c758e]                           dc.w $0000
[000c7590]                           dc.w $0000
[000c7592]                           dc.w $0000
[000c7594]                           dc.w $0000
[000c7596]                           dc.w $0000
[000c7598]                           dc.w $0000
[000c759a]                           dc.w $0000
_C4_IC_MENU:
[000c759c]                           dc.w $0004
[000c759e] 000c66ea                  dc.l $000c66ea
[000c75a2] 000c69a2                  dc.l DATAS_18
[000c75a6]                           dc.w $0000
[000c75a8]                           dc.w $0000
[000c75aa]                           dc.w $0000
[000c75ac]                           dc.w $0000
[000c75ae]                           dc.w $0000
[000c75b0]                           dc.w $0000
_MSK_IC_MENU:
[000c75b2]                           dc.w $0000
[000c75b4]                           dc.w $0000
[000c75b6]                           dc.w $0000
[000c75b8]                           dc.w $0000
[000c75ba]                           dc.w $0000
[000c75bc]                           dc.w $0000
[000c75be]                           dc.w $0000
[000c75c0]                           dc.w $0000
[000c75c2]                           dc.w $0000
[000c75c4]                           dc.w $0000
[000c75c6]                           dc.w $0000
[000c75c8]                           dc.w $0000
[000c75ca]                           dc.w $0000
[000c75cc]                           dc.w $0000
[000c75ce]                           dc.w $0000
[000c75d0]                           dc.w $0000
[000c75d2]                           dc.w $0000
[000c75d4]                           dc.w $0000
[000c75d6]                           dc.w $1fff
[000c75d8]                           dc.w $ffff
[000c75da]                           dc.w $fff0
[000c75dc]                           dc.w $1fff
[000c75de]                           dc.w $ffff
[000c75e0]                           dc.w $fff8
[000c75e2]                           dc.w $1fff
[000c75e4]                           dc.w $ffff
[000c75e6]                           dc.w $fff8
[000c75e8]                           dc.w $1fff
[000c75ea]                           dc.w $ffff
[000c75ec]                           dc.w $fff8
[000c75ee]                           dc.w $1fff
[000c75f0]                           dc.w $ffff
[000c75f2]                           dc.w $fff8
[000c75f4]                           dc.w $0fff
[000c75f6]                           dc.w $ffff
[000c75f8]                           dc.w $fff8
[000c75fa]                           dc.w $001f
[000c75fc]                           dc.w $ffe0
[000c75fe]                           dc.w $0000
[000c7600]                           dc.w $001f
[000c7602]                           dc.w $ffe0
[000c7604]                           dc.w $0000
[000c7606]                           dc.w $001f
[000c7608]                           dc.w $ffe0
[000c760a]                           dc.w $0000
[000c760c]                           dc.w $001f
[000c760e]                           dc.w $ffe0
[000c7610]                           dc.w $0000
[000c7612]                           dc.w $001f
[000c7614]                           dc.w $ffe0
[000c7616]                           dc.w $0000
[000c7618]                           dc.w $001f
[000c761a]                           dc.w $ffe0
[000c761c]                           dc.w $0000
[000c761e]                           dc.w $001f
[000c7620]                           dc.w $ffe0
[000c7622]                           dc.w $0000
[000c7624]                           dc.w $001f
[000c7626]                           dc.w $ffe0
[000c7628]                           dc.w $0000
[000c762a]                           dc.w $001f
[000c762c]                           dc.w $ffe0
[000c762e]                           dc.w $0000
[000c7630]                           dc.w $001f
[000c7632]                           dc.w $ffe0
[000c7634]                           dc.w $0000
[000c7636]                           dc.w $001f
[000c7638]                           dc.w $ffe0
[000c763a]                           dc.w $0000
[000c763c]                           dc.w $001f
[000c763e]                           dc.w $ffe0
[000c7640]                           dc.w $0000
[000c7642]                           dc.w $000f
[000c7644]                           dc.w $ffe0
[000c7646]                           dc.w $0000
[000c7648]                           dc.w $0000
[000c764a]                           dc.w $0000
[000c764c]                           dc.w $0000
[000c764e]                           dc.w $0000
[000c7650]                           dc.w $0000
[000c7652]                           dc.w $0000
[000c7654]                           dc.w $0000
[000c7656]                           dc.w $0000
[000c7658]                           dc.w $0000
[000c765a]                           dc.w $0000
[000c765c]                           dc.w $0000
[000c765e]                           dc.w $0000
_DAT_IC_MENU:
[000c7660]                           dc.w $0000
[000c7662]                           dc.w $0000
[000c7664]                           dc.w $0000
[000c7666]                           dc.w $0000
[000c7668]                           dc.w $0000
[000c766a]                           dc.w $0000
[000c766c]                           dc.w $0000
[000c766e]                           dc.w $0000
[000c7670]                           dc.w $0000
[000c7672]                           dc.w $0000
[000c7674]                           dc.w $0000
[000c7676]                           dc.w $0000
[000c7678]                           dc.w $0000
[000c767a]                           dc.w $0000
[000c767c]                           dc.w $0000
[000c767e]                           dc.w $0000
[000c7680]                           dc.w $0000
[000c7682]                           dc.w $0000
[000c7684]                           dc.w $1fff
[000c7686]                           dc.w $ffff
[000c7688]                           dc.w $fff0
[000c768a]                           dc.w $101f
[000c768c]                           dc.w $f000
[000c768e]                           dc.w $0018
[000c7690]                           dc.w $1798
[000c7692]                           dc.w $33e0
[000c7694]                           dc.w $0018
[000c7696]                           dc.w $101f
[000c7698]                           dc.w $f000
[000c769a]                           dc.w $0018
[000c769c]                           dc.w $1fff
[000c769e]                           dc.w $ffff
[000c76a0]                           dc.w $fff8
[000c76a2]                           dc.w $0ff0
[000c76a4]                           dc.w $007f
[000c76a6]                           dc.w $fff8
[000c76a8]                           dc.w $0017
[000c76aa]                           dc.w $ff60
[000c76ac]                           dc.w $0000
[000c76ae]                           dc.w $0010
[000c76b0]                           dc.w $0060
[000c76b2]                           dc.w $0000
[000c76b4]                           dc.w $0010
[000c76b6]                           dc.w $0060
[000c76b8]                           dc.w $0000
[000c76ba]                           dc.w $0015
[000c76bc]                           dc.w $5560
[000c76be]                           dc.w $0000
[000c76c0]                           dc.w $0010
[000c76c2]                           dc.w $0060
[000c76c4]                           dc.w $0000
[000c76c6]                           dc.w $001f
[000c76c8]                           dc.w $ffe0
[000c76ca]                           dc.w $0000
[000c76cc]                           dc.w $0018
[000c76ce]                           dc.w $00e0
[000c76d0]                           dc.w $0000
[000c76d2]                           dc.w $001f
[000c76d4]                           dc.w $ffe0
[000c76d6]                           dc.w $0000
[000c76d8]                           dc.w $0010
[000c76da]                           dc.w $0060
[000c76dc]                           dc.w $0000
[000c76de]                           dc.w $0017
[000c76e0]                           dc.w $fe60
[000c76e2]                           dc.w $0000
[000c76e4]                           dc.w $0010
[000c76e6]                           dc.w $0060
[000c76e8]                           dc.w $0000
[000c76ea]                           dc.w $001f
[000c76ec]                           dc.w $ffe0
[000c76ee]                           dc.w $0000
[000c76f0]                           dc.w $000f
[000c76f2]                           dc.w $ffe0
[000c76f4]                           dc.w $0000
[000c76f6]                           dc.w $0000
[000c76f8]                           dc.w $0000
[000c76fa]                           dc.w $0000
[000c76fc]                           dc.w $0000
[000c76fe]                           dc.w $0000
[000c7700]                           dc.w $0000
[000c7702]                           dc.w $0000
[000c7704]                           dc.w $0000
[000c7706]                           dc.w $0000
[000c7708]                           dc.w $0000
[000c770a]                           dc.w $0000
[000c770c]                           dc.w $0000
IC_MENU:
[000c770e] 000c75b2                  dc.l _MSK_IC_MENU
[000c7712] 000c7660                  dc.l _DAT_IC_MENU
[000c7716] 000c4b74                  dc.l TEXT_02
[000c771a]                           dc.w $1000
[000c771c]                           dc.w $0000
[000c771e]                           dc.w $0000
[000c7720]                           dc.w $000c
[000c7722]                           dc.w $0000
[000c7724]                           dc.w $0030
[000c7726]                           dc.w $001d
[000c7728]                           dc.w $0000
[000c772a]                           dc.w $0020
[000c772c]                           dc.w $0048
[000c772e]                           dc.w $0008
[000c7730] 000c759c                  dc.l _C4_IC_MENU
_C4_IC_OBJECT:
[000c7734]                           dc.w $0004
[000c7736] 000c6dc2                  dc.l $000c6dc2
[000c773a] 000c70aa                  dc.l DATAS_22
[000c773e]                           dc.w $0000
[000c7740]                           dc.w $0000
[000c7742]                           dc.w $0000
[000c7744]                           dc.w $0000
[000c7746]                           dc.w $0000
[000c7748]                           dc.w $0000
_MSK_IC_OBJECT:
[000c774a]                           dc.w $0000
[000c774c]                           dc.w $0000
[000c774e]                           dc.w $0000
[000c7750]                           dc.w $7fff
[000c7752]                           dc.w $ffff
[000c7754]                           dc.w $fffe
[000c7756]                           dc.w $7fff
[000c7758]                           dc.w $ffff
[000c775a]                           dc.w $fffe
[000c775c]                           dc.w $7fff
[000c775e]                           dc.w $ffff
[000c7760]                           dc.w $fffe
[000c7762]                           dc.w $7fff
[000c7764]                           dc.w $ffff
[000c7766]                           dc.w $fffe
[000c7768]                           dc.w $7fff
[000c776a]                           dc.w $ffff
[000c776c]                           dc.w $fffe
[000c776e]                           dc.w $7fff
[000c7770]                           dc.w $ffff
[000c7772]                           dc.w $fffe
[000c7774]                           dc.w $7fff
[000c7776]                           dc.w $ffff
[000c7778]                           dc.w $fffe
[000c777a]                           dc.w $7fff
[000c777c]                           dc.w $ffff
[000c777e]                           dc.w $fffe
[000c7780]                           dc.w $7fff
[000c7782]                           dc.w $ffff
[000c7784]                           dc.w $fffe
[000c7786]                           dc.w $7fff
[000c7788]                           dc.w $ffff
[000c778a]                           dc.w $fffe
[000c778c]                           dc.w $7fff
[000c778e]                           dc.w $ffff
[000c7790]                           dc.w $fffe
[000c7792]                           dc.w $7fff
[000c7794]                           dc.w $ffff
[000c7796]                           dc.w $fffe
[000c7798]                           dc.w $7fff
[000c779a]                           dc.w $ffff
[000c779c]                           dc.w $fffe
[000c779e]                           dc.w $7fff
[000c77a0]                           dc.w $ffff
[000c77a2]                           dc.w $fffe
[000c77a4]                           dc.w $7fff
[000c77a6]                           dc.w $ffff
[000c77a8]                           dc.w $fffe
[000c77aa]                           dc.w $7fff
[000c77ac]                           dc.w $ffff
[000c77ae]                           dc.w $fffe
[000c77b0]                           dc.w $7fff
[000c77b2]                           dc.w $ffff
[000c77b4]                           dc.w $fffe
[000c77b6]                           dc.w $7fff
[000c77b8]                           dc.w $ffff
[000c77ba]                           dc.w $fffe
[000c77bc]                           dc.w $7fff
[000c77be]                           dc.w $ffff
[000c77c0]                           dc.w $fffe
[000c77c2]                           dc.w $7fff
[000c77c4]                           dc.w $ffff
[000c77c6]                           dc.w $fffe
[000c77c8]                           dc.w $7fff
[000c77ca]                           dc.w $ffff
[000c77cc]                           dc.w $fffe
[000c77ce]                           dc.w $7fff
[000c77d0]                           dc.w $ffff
[000c77d2]                           dc.w $fffe
[000c77d4]                           dc.w $7fff
[000c77d6]                           dc.w $ffff
[000c77d8]                           dc.w $fffe
[000c77da]                           dc.w $7fff
[000c77dc]                           dc.w $ffff
[000c77de]                           dc.w $fffe
[000c77e0]                           dc.w $7fff
[000c77e2]                           dc.w $ffff
[000c77e4]                           dc.w $fffe
[000c77e6]                           dc.w $7fff
[000c77e8]                           dc.w $ffff
[000c77ea]                           dc.w $fffe
[000c77ec]                           dc.w $7fff
[000c77ee]                           dc.w $ffff
[000c77f0]                           dc.w $fffe
[000c77f2]                           dc.w $7fff
[000c77f4]                           dc.w $ffff
[000c77f6]                           dc.w $fffe
[000c77f8]                           dc.w $7fff
[000c77fa]                           dc.w $ffff
[000c77fc]                           dc.w $fffe
[000c77fe]                           dc.w $0000
[000c7800]                           dc.w $0000
[000c7802]                           dc.w $0000
_DAT_IC_OBJECT:
[000c7804]                           dc.w $0000
[000c7806]                           dc.w $0000
[000c7808]                           dc.w $0000
[000c780a]                           dc.w $7fff
[000c780c]                           dc.w $ffff
[000c780e]                           dc.w $fffe
[000c7810]                           dc.w $4000
[000c7812]                           dc.w $0000
[000c7814]                           dc.w $0002
[000c7816]                           dc.w $4000
[000c7818]                           dc.w $0003
[000c781a]                           dc.w $fe02
[000c781c]                           dc.w $47ff
[000c781e]                           dc.w $fc78
[000c7820]                           dc.w $00f2
[000c7822]                           dc.w $4400
[000c7824]                           dc.w $0440
[000c7826]                           dc.w $0012
[000c7828]                           dc.w $44ef
[000c782a]                           dc.w $6440
[000c782c]                           dc.w $0012
[000c782e]                           dc.w $4400
[000c7830]                           dc.w $0453
[000c7832]                           dc.w $df92
[000c7834]                           dc.w $47ff
[000c7836]                           dc.w $fc40
[000c7838]                           dc.w $0012
[000c783a]                           dc.w $4000
[000c783c]                           dc.w $0040
[000c783e]                           dc.w $0012
[000c7840]                           dc.w $4000
[000c7842]                           dc.w $0053
[000c7844]                           dc.w $f792
[000c7846]                           dc.w $47ff
[000c7848]                           dc.w $fc40
[000c784a]                           dc.w $0012
[000c784c]                           dc.w $4400
[000c784e]                           dc.w $0440
[000c7850]                           dc.w $0012
[000c7852]                           dc.w $44f6
[000c7854]                           dc.w $e453
[000c7856]                           dc.w $bf92
[000c7858]                           dc.w $4400
[000c785a]                           dc.w $0440
[000c785c]                           dc.w $0012
[000c785e]                           dc.w $47ff
[000c7860]                           dc.w $fc7f
[000c7862]                           dc.w $fff2
[000c7864]                           dc.w $4000
[000c7866]                           dc.w $0000
[000c7868]                           dc.w $0002
[000c786a]                           dc.w $4000
[000c786c]                           dc.w $0000
[000c786e]                           dc.w $0002
[000c7870]                           dc.w $4000
[000c7872]                           dc.w $0000
[000c7874]                           dc.w $0002
[000c7876]                           dc.w $4000
[000c7878]                           dc.w $0000
[000c787a]                           dc.w $0002
[000c787c]                           dc.w $407f
[000c787e]                           dc.w $fc00
[000c7880]                           dc.w $0002
[000c7882]                           dc.w $407f
[000c7884]                           dc.w $fc3f
[000c7886]                           dc.w $fe02
[000c7888]                           dc.w $4060
[000c788a]                           dc.w $0c20
[000c788c]                           dc.w $0202
[000c788e]                           dc.w $4067
[000c7890]                           dc.w $cc27
[000c7892]                           dc.w $f202
[000c7894]                           dc.w $4060
[000c7896]                           dc.w $0c20
[000c7898]                           dc.w $0202
[000c789a]                           dc.w $407f
[000c789c]                           dc.w $fc3f
[000c789e]                           dc.w $fe02
[000c78a0]                           dc.w $407f
[000c78a2]                           dc.w $fc00
[000c78a4]                           dc.w $0002
[000c78a6]                           dc.w $4000
[000c78a8]                           dc.w $0000
[000c78aa]                           dc.w $0002
[000c78ac]                           dc.w $4000
[000c78ae]                           dc.w $0000
[000c78b0]                           dc.w $0002
[000c78b2]                           dc.w $7fff
[000c78b4]                           dc.w $ffff
[000c78b6]                           dc.w $fffe
[000c78b8]                           dc.w $0000
[000c78ba]                           dc.w $0000
[000c78bc]                           dc.w $0000
IC_OBJECT:
[000c78be] 000c774a                  dc.l _MSK_IC_OBJECT
[000c78c2] 000c7804                  dc.l _DAT_IC_OBJECT
[000c78c6] 000c4db8                  dc.l TEXT_27
[000c78ca]                           dc.w $1000
[000c78cc]                           dc.w $0000
[000c78ce]                           dc.w $0000
[000c78d0]                           dc.w $000c
[000c78d2]                           dc.w $0000
[000c78d4]                           dc.w $0030
[000c78d6]                           dc.w $001f
[000c78d8]                           dc.w $0000
[000c78da]                           dc.w $0020
[000c78dc]                           dc.w $0048
[000c78de]                           dc.w $0008
[000c78e0] 000c7734                  dc.l _C4_IC_OBJECT
_C4_IC_POPUP:
[000c78e4]                           dc.w $0004
[000c78e6] 000c6a56                  dc.l $000c6a56
[000c78ea] 000c6d0e                  dc.l DATAS_20
[000c78ee]                           dc.w $0000
[000c78f0]                           dc.w $0000
[000c78f2]                           dc.w $0000
[000c78f4]                           dc.w $0000
[000c78f6]                           dc.w $0000
[000c78f8]                           dc.w $0000
_MSK_IC_POPUP:
[000c78fa]                           dc.w $0000
[000c78fc]                           dc.w $0000
[000c78fe]                           dc.w $0000
[000c7900]                           dc.w $0000
[000c7902]                           dc.w $0000
[000c7904]                           dc.w $0000
[000c7906]                           dc.w $0000
[000c7908]                           dc.w $0000
[000c790a]                           dc.w $0000
[000c790c]                           dc.w $0000
[000c790e]                           dc.w $0000
[000c7910]                           dc.w $0000
[000c7912]                           dc.w $0000
[000c7914]                           dc.w $0000
[000c7916]                           dc.w $0000
[000c7918]                           dc.w $0000
[000c791a]                           dc.w $0000
[000c791c]                           dc.w $0000
[000c791e]                           dc.w $007f
[000c7920]                           dc.w $ff00
[000c7922]                           dc.w $0000
[000c7924]                           dc.w $007f
[000c7926]                           dc.w $ff80
[000c7928]                           dc.w $0000
[000c792a]                           dc.w $007f
[000c792c]                           dc.w $ff80
[000c792e]                           dc.w $0000
[000c7930]                           dc.w $007f
[000c7932]                           dc.w $ff80
[000c7934]                           dc.w $0000
[000c7936]                           dc.w $007f
[000c7938]                           dc.w $ff80
[000c793a]                           dc.w $0000
[000c793c]                           dc.w $007f
[000c793e]                           dc.w $ff80
[000c7940]                           dc.w $0000
[000c7942]                           dc.w $007f
[000c7944]                           dc.w $ff80
[000c7946]                           dc.w $0000
[000c7948]                           dc.w $007f
[000c794a]                           dc.w $ffff
[000c794c]                           dc.w $f000
[000c794e]                           dc.w $007f
[000c7950]                           dc.w $ffff
[000c7952]                           dc.w $f800
[000c7954]                           dc.w $007f
[000c7956]                           dc.w $ffff
[000c7958]                           dc.w $f800
[000c795a]                           dc.w $007f
[000c795c]                           dc.w $ffff
[000c795e]                           dc.w $f800
[000c7960]                           dc.w $007f
[000c7962]                           dc.w $ffff
[000c7964]                           dc.w $f800
[000c7966]                           dc.w $007f
[000c7968]                           dc.w $ffff
[000c796a]                           dc.w $f800
[000c796c]                           dc.w $007f
[000c796e]                           dc.w $ffff
[000c7970]                           dc.w $f800
[000c7972]                           dc.w $007f
[000c7974]                           dc.w $ffff
[000c7976]                           dc.w $f800
[000c7978]                           dc.w $007f
[000c797a]                           dc.w $ffff
[000c797c]                           dc.w $f800
[000c797e]                           dc.w $007f
[000c7980]                           dc.w $ff80
[000c7982]                           dc.w $0000
[000c7984]                           dc.w $003f
[000c7986]                           dc.w $ff80
[000c7988]                           dc.w $0000
[000c798a]                           dc.w $0000
[000c798c]                           dc.w $0000
[000c798e]                           dc.w $0000
[000c7990]                           dc.w $0000
[000c7992]                           dc.w $0000
[000c7994]                           dc.w $0000
[000c7996]                           dc.w $0000
[000c7998]                           dc.w $0000
[000c799a]                           dc.w $0000
[000c799c]                           dc.w $0000
[000c799e]                           dc.w $0000
[000c79a0]                           dc.w $0000
[000c79a2]                           dc.w $0000
[000c79a4]                           dc.w $0000
[000c79a6]                           dc.w $0000
_DAT_IC_POPUP:
[000c79a8]                           dc.w $0000
[000c79aa]                           dc.w $0000
[000c79ac]                           dc.w $0000
[000c79ae]                           dc.w $0000
[000c79b0]                           dc.w $0000
[000c79b2]                           dc.w $0000
[000c79b4]                           dc.w $0000
[000c79b6]                           dc.w $0000
[000c79b8]                           dc.w $0000
[000c79ba]                           dc.w $0000
[000c79bc]                           dc.w $0000
[000c79be]                           dc.w $0000
[000c79c0]                           dc.w $0000
[000c79c2]                           dc.w $0000
[000c79c4]                           dc.w $0000
[000c79c6]                           dc.w $0000
[000c79c8]                           dc.w $0000
[000c79ca]                           dc.w $0000
[000c79cc]                           dc.w $007f
[000c79ce]                           dc.w $ff00
[000c79d0]                           dc.w $0000
[000c79d2]                           dc.w $0040
[000c79d4]                           dc.w $0180
[000c79d6]                           dc.w $0000
[000c79d8]                           dc.w $004f
[000c79da]                           dc.w $f980
[000c79dc]                           dc.w $0000
[000c79de]                           dc.w $0040
[000c79e0]                           dc.w $0180
[000c79e2]                           dc.w $0000
[000c79e4]                           dc.w $0040
[000c79e6]                           dc.w $0180
[000c79e8]                           dc.w $0000
[000c79ea]                           dc.w $0055
[000c79ec]                           dc.w $5580
[000c79ee]                           dc.w $0000
[000c79f0]                           dc.w $0040
[000c79f2]                           dc.w $0180
[000c79f4]                           dc.w $0000
[000c79f6]                           dc.w $007f
[000c79f8]                           dc.w $ffff
[000c79fa]                           dc.w $f000
[000c79fc]                           dc.w $0070
[000c79fe]                           dc.w $0700
[000c7a00]                           dc.w $1800
[000c7a02]                           dc.w $007f
[000c7a04]                           dc.w $ff3f
[000c7a06]                           dc.w $9800
[000c7a08]                           dc.w $0040
[000c7a0a]                           dc.w $0100
[000c7a0c]                           dc.w $1800
[000c7a0e]                           dc.w $004f
[000c7a10]                           dc.w $f9ff
[000c7a12]                           dc.w $f800
[000c7a14]                           dc.w $0040
[000c7a16]                           dc.w $01c0
[000c7a18]                           dc.w $7800
[000c7a1a]                           dc.w $0040
[000c7a1c]                           dc.w $01ff
[000c7a1e]                           dc.w $f800
[000c7a20]                           dc.w $004f
[000c7a22]                           dc.w $f9ff
[000c7a24]                           dc.w $f800
[000c7a26]                           dc.w $0040
[000c7a28]                           dc.w $01ff
[000c7a2a]                           dc.w $f800
[000c7a2c]                           dc.w $007f
[000c7a2e]                           dc.w $ff80
[000c7a30]                           dc.w $0000
[000c7a32]                           dc.w $003f
[000c7a34]                           dc.w $ff80
[000c7a36]                           dc.w $0000
[000c7a38]                           dc.w $0000
[000c7a3a]                           dc.w $0000
[000c7a3c]                           dc.w $0000
[000c7a3e]                           dc.w $0000
[000c7a40]                           dc.w $0000
[000c7a42]                           dc.w $0000
[000c7a44]                           dc.w $0000
[000c7a46]                           dc.w $0000
[000c7a48]                           dc.w $0000
[000c7a4a]                           dc.w $0000
[000c7a4c]                           dc.w $0000
[000c7a4e]                           dc.w $0000
[000c7a50]                           dc.w $0000
[000c7a52]                           dc.w $0000
[000c7a54]                           dc.w $0000
IC_POPUP:
[000c7a56] 000c78fa                  dc.l _MSK_IC_POPUP
[000c7a5a] 000c79a8                  dc.l _DAT_IC_POPUP
[000c7a5e] 000c4cf4                  dc.l TEXT_17
[000c7a62]                           dc.w $1000
[000c7a64]                           dc.w $0000
[000c7a66]                           dc.w $0000
[000c7a68]                           dc.w $000c
[000c7a6a]                           dc.w $0000
[000c7a6c]                           dc.w $0030
[000c7a6e]                           dc.w $001d
[000c7a70]                           dc.w $0000
[000c7a72]                           dc.w $0020
[000c7a74]                           dc.w $0048
[000c7a76]                           dc.w $0008
[000c7a78] 000c78e4                  dc.l _C4_IC_POPUP
_IMG_IM_SORT_XY:
[000c7a7c]                           dc.w $0000
[000c7a7e]                           dc.w $0000
[000c7a80]                           dc.w $0000
[000c7a82]                           dc.w $0000
[000c7a84]                           dc.w $0000
[000c7a86]                           dc.w $0000
[000c7a88]                           dc.w $08ff
[000c7a8a]                           dc.w $e04f
[000c7a8c]                           dc.w $fe38
[000c7a8e]                           dc.w $08ff
[000c7a90]                           dc.w $e02f
[000c7a92]                           dc.w $fe08
[000c7a94]                           dc.w $08ff
[000c7a96]                           dc.w $ffff
[000c7a98]                           dc.w $fe38
[000c7a9a]                           dc.w $08ff
[000c7a9c]                           dc.w $e02f
[000c7a9e]                           dc.w $fe20
[000c7aa0]                           dc.w $08ff
[000c7aa2]                           dc.w $e04f
[000c7aa4]                           dc.w $fe38
[000c7aa6]                           dc.w $0000
[000c7aa8]                           dc.w $0000
[000c7aaa]                           dc.w $4000
[000c7aac]                           dc.w $0000
[000c7aae]                           dc.w $0000
[000c7ab0]                           dc.w $4000
[000c7ab2]                           dc.w $0007
[000c7ab4]                           dc.w $ffff
[000c7ab6]                           dc.w $c000
[000c7ab8]                           dc.w $0015
[000c7aba]                           dc.w $0000
[000c7abc]                           dc.w $0000
[000c7abe]                           dc.w $000e
[000c7ac0]                           dc.w $0000
[000c7ac2]                           dc.w $0000
[000c7ac4]                           dc.w $0004
[000c7ac6]                           dc.w $0000
[000c7ac8]                           dc.w $0000
[000c7aca]                           dc.w $1cff
[000c7acc]                           dc.w $e04f
[000c7ace]                           dc.w $fe20
[000c7ad0]                           dc.w $04ff
[000c7ad2]                           dc.w $e02f
[000c7ad4]                           dc.w $fe28
[000c7ad6]                           dc.w $0cff
[000c7ad8]                           dc.w $ffff
[000c7ada]                           dc.w $fe38
[000c7adc]                           dc.w $04ff
[000c7ade]                           dc.w $e02f
[000c7ae0]                           dc.w $fe08
[000c7ae2]                           dc.w $1cff
[000c7ae4]                           dc.w $e04f
[000c7ae6]                           dc.w $fe08
[000c7ae8]                           dc.w $0000
[000c7aea]                           dc.w $0000
[000c7aec]                           dc.w $4000
[000c7aee]                           dc.w $0000
[000c7af0]                           dc.w $0000
[000c7af2]                           dc.w $4000
[000c7af4]                           dc.w $0007
[000c7af6]                           dc.w $ffff
[000c7af8]                           dc.w $c000
[000c7afa]                           dc.w $0015
[000c7afc]                           dc.w $0000
[000c7afe]                           dc.w $0000
[000c7b00]                           dc.w $000e
[000c7b02]                           dc.w $0000
[000c7b04]                           dc.w $0000
[000c7b06]                           dc.w $0004
[000c7b08]                           dc.w $0000
[000c7b0a]                           dc.w $0000
[000c7b0c]                           dc.w $1cff
[000c7b0e]                           dc.w $e04f
[000c7b10]                           dc.w $fe10
[000c7b12]                           dc.w $10ff
[000c7b14]                           dc.w $e02f
[000c7b16]                           dc.w $fe20
[000c7b18]                           dc.w $1cff
[000c7b1a]                           dc.w $ffff
[000c7b1c]                           dc.w $fe38
[000c7b1e]                           dc.w $04ff
[000c7b20]                           dc.w $e02f
[000c7b22]                           dc.w $fe28
[000c7b24]                           dc.w $1cff
[000c7b26]                           dc.w $e04f
[000c7b28]                           dc.w $fe38
[000c7b2a]                           dc.w $0000
[000c7b2c]                           dc.w $0000
[000c7b2e]                           dc.w $0000
[000c7b30]                           dc.w $0000
[000c7b32]                           dc.w $0000
[000c7b34]                           dc.w $0000
[000c7b36]                           dc.w $0000
[000c7b38]                           dc.w $0000
[000c7b3a]                           dc.w $0000
IM_SORT_XY:
[000c7b3c] 000c7a7c                  dc.l _IMG_IM_SORT_XY
[000c7b40]                           dc.w $0006
[000c7b42]                           dc.w $0020
[000c7b44]                           dc.w $0000
[000c7b46]                           dc.w $0000
[000c7b48]                           dc.w $0001
_IMG_IM_SORT_YX:
[000c7b4a]                           dc.w $0000
[000c7b4c]                           dc.w $0000
[000c7b4e]                           dc.w $0000
[000c7b50]                           dc.w $0000
[000c7b52]                           dc.w $0000
[000c7b54]                           dc.w $0000
[000c7b56]                           dc.w $08ff
[000c7b58]                           dc.w $e04f
[000c7b5a]                           dc.w $fe20
[000c7b5c]                           dc.w $08ff
[000c7b5e]                           dc.w $e02f
[000c7b60]                           dc.w $fe28
[000c7b62]                           dc.w $08ff
[000c7b64]                           dc.w $e1ff
[000c7b66]                           dc.w $fe38
[000c7b68]                           dc.w $08ff
[000c7b6a]                           dc.w $e12f
[000c7b6c]                           dc.w $fe08
[000c7b6e]                           dc.w $08ff
[000c7b70]                           dc.w $e14f
[000c7b72]                           dc.w $fe08
[000c7b74]                           dc.w $0004
[000c7b76]                           dc.w $0100
[000c7b78]                           dc.w $4000
[000c7b7a]                           dc.w $0004
[000c7b7c]                           dc.w $0100
[000c7b7e]                           dc.w $4000
[000c7b80]                           dc.w $0004
[000c7b82]                           dc.w $0100
[000c7b84]                           dc.w $4000
[000c7b86]                           dc.w $0015
[000c7b88]                           dc.w $0101
[000c7b8a]                           dc.w $5000
[000c7b8c]                           dc.w $000e
[000c7b8e]                           dc.w $0100
[000c7b90]                           dc.w $e000
[000c7b92]                           dc.w $0004
[000c7b94]                           dc.w $0100
[000c7b96]                           dc.w $4000
[000c7b98]                           dc.w $1cff
[000c7b9a]                           dc.w $e10f
[000c7b9c]                           dc.w $fe38
[000c7b9e]                           dc.w $04ff
[000c7ba0]                           dc.w $e10f
[000c7ba2]                           dc.w $fe20
[000c7ba4]                           dc.w $1cff
[000c7ba6]                           dc.w $e10f
[000c7ba8]                           dc.w $fe38
[000c7baa]                           dc.w $10ff
[000c7bac]                           dc.w $e10f
[000c7bae]                           dc.w $fe08
[000c7bb0]                           dc.w $1cff
[000c7bb2]                           dc.w $e10f
[000c7bb4]                           dc.w $fe38
[000c7bb6]                           dc.w $0004
[000c7bb8]                           dc.w $0100
[000c7bba]                           dc.w $4000
[000c7bbc]                           dc.w $0004
[000c7bbe]                           dc.w $0100
[000c7bc0]                           dc.w $4000
[000c7bc2]                           dc.w $0004
[000c7bc4]                           dc.w $0100
[000c7bc6]                           dc.w $4000
[000c7bc8]                           dc.w $0015
[000c7bca]                           dc.w $0101
[000c7bcc]                           dc.w $5000
[000c7bce]                           dc.w $000e
[000c7bd0]                           dc.w $0100
[000c7bd2]                           dc.w $e000
[000c7bd4]                           dc.w $0004
[000c7bd6]                           dc.w $0100
[000c7bd8]                           dc.w $4000
[000c7bda]                           dc.w $1cff
[000c7bdc]                           dc.w $e10f
[000c7bde]                           dc.w $fe10
[000c7be0]                           dc.w $04ff
[000c7be2]                           dc.w $e10f
[000c7be4]                           dc.w $fe20
[000c7be6]                           dc.w $0cff
[000c7be8]                           dc.w $ff0f
[000c7bea]                           dc.w $fe38
[000c7bec]                           dc.w $04ff
[000c7bee]                           dc.w $e00f
[000c7bf0]                           dc.w $fe28
[000c7bf2]                           dc.w $1cff
[000c7bf4]                           dc.w $e00f
[000c7bf6]                           dc.w $fe38
[000c7bf8]                           dc.w $0000
[000c7bfa]                           dc.w $0000
[000c7bfc]                           dc.w $0000
[000c7bfe]                           dc.w $0000
[000c7c00]                           dc.w $0000
[000c7c02]                           dc.w $0000
[000c7c04]                           dc.w $0000
[000c7c06]                           dc.w $0000
[000c7c08]                           dc.w $0000
IM_SORT_YX:
[000c7c0a] 000c7b4a                  dc.l _IMG_IM_SORT_YX
[000c7c0e]                           dc.w $0006
[000c7c10]                           dc.w $0020
[000c7c12]                           dc.w $0000
[000c7c14]                           dc.w $0000
[000c7c16]                           dc.w $0001
MEN_EDIT:
[000c7c18]                           dc.w $ffff
[000c7c1a]                           dc.w $0001
[000c7c1c]                           dc.w $0005
[000c7c1e]                           dc.w $0019
[000c7c20]                           dc.w $0000
[000c7c22]                           dc.w $0000
[000c7c24]                           dc.w $0000
[000c7c26]                           dc.w $0000
[000c7c28]                           dc.w $0000
[000c7c2a]                           dc.w $0000
[000c7c2c]                           dc.w $005a
[000c7c2e]                           dc.w $0019
_01_MEN_EDIT:
[000c7c30]                           dc.w $0005
[000c7c32]                           dc.w $0002
[000c7c34]                           dc.w $0002
[000c7c36]                           dc.w $0014
[000c7c38]                           dc.w $0000
[000c7c3a]                           dc.w $0000
[000c7c3c]                           dc.w $0000
[000c7c3e]                           dc.w $1100
[000c7c40]                           dc.w $0000
[000c7c42]                           dc.w $0000
[000c7c44]                           dc.w $005a
[000c7c46]                           dc.w $0201
_02_MEN_EDIT:
[000c7c48]                           dc.w $0001
[000c7c4a]                           dc.w $0003
[000c7c4c]                           dc.w $0004
[000c7c4e]                           dc.w $0019
[000c7c50]                           dc.w $0000
[000c7c52]                           dc.w $0000
[000c7c54]                           dc.w $0000
[000c7c56]                           dc.w $0000
[000c7c58]                           dc.w $0002
[000c7c5a]                           dc.w $0000
[000c7c5c]                           dc.w $000c
[000c7c5e]                           dc.w $0301
_03_MEN_EDIT:
[000c7c60]                           dc.w $0004
[000c7c62]                           dc.w $ffff
[000c7c64]                           dc.w $ffff
[000c7c66]                           dc.w $0020
[000c7c68]                           dc.w $0000
[000c7c6a]                           dc.w $0000
[000c7c6c] 000c4b17                  dc.l TEXT_002
[000c7c70]                           dc.w $0000
[000c7c72]                           dc.w $0000
[000c7c74]                           dc.w $0006
[000c7c76]                           dc.w $0301
_04_MEN_EDIT:
[000c7c78]                           dc.w $0002
[000c7c7a]                           dc.w $ffff
[000c7c7c]                           dc.w $ffff
[000c7c7e]                           dc.w $0020
[000c7c80]                           dc.w $0000
[000c7c82]                           dc.w $0000
[000c7c84] 000c4e08                  dc.l TEXT_339
[000c7c88]                           dc.w $0006
[000c7c8a]                           dc.w $0000
[000c7c8c]                           dc.w $0006
[000c7c8e]                           dc.w $0301
_05_MEN_EDIT:
[000c7c90]                           dc.w $0000
[000c7c92]                           dc.w $0006
[000c7c94]                           dc.w $000f
[000c7c96]                           dc.w $0019
[000c7c98]                           dc.w $0000
[000c7c9a]                           dc.w $0000
[000c7c9c]                           dc.w $0000
[000c7c9e]                           dc.w $0000
[000c7ca0]                           dc.w $0000
[000c7ca2]                           dc.w $0301
[000c7ca4]                           dc.w $0050
[000c7ca6]                           dc.w $0013
_06_MEN_EDIT:
[000c7ca8]                           dc.w $000f
[000c7caa]                           dc.w $0007
[000c7cac]                           dc.w $000e
[000c7cae]                           dc.w $0014
[000c7cb0]                           dc.w $0000
[000c7cb2]                           dc.w $0000
[000c7cb4]                           dc.w $00ff
[000c7cb6]                           dc.w $1100
[000c7cb8]                           dc.w $0002
[000c7cba]                           dc.w $0000
[000c7cbc]                           dc.w $0014
[000c7cbe]                           dc.w $0008
_07_MEN_EDIT:
[000c7cc0]                           dc.w $0008
[000c7cc2]                           dc.w $ffff
[000c7cc4]                           dc.w $ffff
[000c7cc6]                           dc.w $001c
[000c7cc8]                           dc.w $0000
[000c7cca]                           dc.w $2000
[000c7ccc] 000c4cfa                  dc.l TEXT_170
[000c7cd0]                           dc.w $0000
[000c7cd2]                           dc.w $0000
[000c7cd4]                           dc.w $0014
[000c7cd6]                           dc.w $0001
_08_MEN_EDIT:
[000c7cd8]                           dc.w $0009
[000c7cda]                           dc.w $ffff
[000c7cdc]                           dc.w $ffff
[000c7cde]                           dc.w $001c
[000c7ce0]                           dc.w $0000
[000c7ce2]                           dc.w $2000
[000c7ce4] 000c4d0f                  dc.l TEXT_171
[000c7ce8]                           dc.w $0000
[000c7cea]                           dc.w $0001
[000c7cec]                           dc.w $0014
[000c7cee]                           dc.w $0001
_09_MEN_EDIT:
[000c7cf0]                           dc.w $000a
[000c7cf2]                           dc.w $ffff
[000c7cf4]                           dc.w $ffff
[000c7cf6]                           dc.w $001c
[000c7cf8]                           dc.w $0000
[000c7cfa]                           dc.w $2000
[000c7cfc] 000c4b17                  dc.l TEXT_002
[000c7d00]                           dc.w $0000
[000c7d02]                           dc.w $0002
[000c7d04]                           dc.w $0014
[000c7d06]                           dc.w $0001
_10_MEN_EDIT:
[000c7d08]                           dc.w $000b
[000c7d0a]                           dc.w $ffff
[000c7d0c]                           dc.w $ffff
[000c7d0e]                           dc.w $001c
[000c7d10]                           dc.w $0000
[000c7d12]                           dc.w $2000
[000c7d14] 000c4b17                  dc.l TEXT_002
[000c7d18]                           dc.w $0000
[000c7d1a]                           dc.w $0003
[000c7d1c]                           dc.w $0014
[000c7d1e]                           dc.w $0001
_11_MEN_EDIT:
[000c7d20]                           dc.w $000c
[000c7d22]                           dc.w $ffff
[000c7d24]                           dc.w $ffff
[000c7d26]                           dc.w $001c
[000c7d28]                           dc.w $0000
[000c7d2a]                           dc.w $2000
[000c7d2c] 000c4b17                  dc.l TEXT_002
[000c7d30]                           dc.w $0000
[000c7d32]                           dc.w $0004
[000c7d34]                           dc.w $0014
[000c7d36]                           dc.w $0001
_12_MEN_EDIT:
[000c7d38]                           dc.w $000d
[000c7d3a]                           dc.w $ffff
[000c7d3c]                           dc.w $ffff
[000c7d3e]                           dc.w $001c
[000c7d40]                           dc.w $0000
[000c7d42]                           dc.w $2000
[000c7d44] 000c4b17                  dc.l TEXT_002
[000c7d48]                           dc.w $0000
[000c7d4a]                           dc.w $0005
[000c7d4c]                           dc.w $0014
[000c7d4e]                           dc.w $0001
_13_MEN_EDIT:
[000c7d50]                           dc.w $000e
[000c7d52]                           dc.w $ffff
[000c7d54]                           dc.w $ffff
[000c7d56]                           dc.w $001c
[000c7d58]                           dc.w $0000
[000c7d5a]                           dc.w $2000
[000c7d5c] 000c4b17                  dc.l TEXT_002
[000c7d60]                           dc.w $0000
[000c7d62]                           dc.w $0006
[000c7d64]                           dc.w $0014
[000c7d66]                           dc.w $0001
_14_MEN_EDIT:
[000c7d68]                           dc.w $0006
[000c7d6a]                           dc.w $ffff
[000c7d6c]                           dc.w $ffff
[000c7d6e]                           dc.w $001c
[000c7d70]                           dc.w $0000
[000c7d72]                           dc.w $2000
[000c7d74] 000c4b17                  dc.l TEXT_002
[000c7d78]                           dc.w $0000
[000c7d7a]                           dc.w $0007
[000c7d7c]                           dc.w $0014
[000c7d7e]                           dc.w $0001
_15_MEN_EDIT:
[000c7d80]                           dc.w $0005
[000c7d82]                           dc.w $0010
[000c7d84]                           dc.w $001a
[000c7d86]                           dc.w $0014
[000c7d88]                           dc.w $0000
[000c7d8a]                           dc.w $0000
[000c7d8c]                           dc.w $00ff
[000c7d8e]                           dc.w $1101
[000c7d90]                           dc.w $0008
[000c7d92]                           dc.w $0000
[000c7d94]                           dc.w $0018
[000c7d96]                           dc.w $0007
_16_MEN_EDIT:
[000c7d98]                           dc.w $0012
[000c7d9a]                           dc.w $ffff
[000c7d9c]                           dc.w $ffff
[000c7d9e]                           dc.w $001c
[000c7da0]                           dc.w $0000
[000c7da2]                           dc.w $0100
[000c7da4] 000c4b8d                  dc.l TEXT_04
[000c7da8]                           dc.w $0000
[000c7daa]                           dc.w $0000
[000c7dac]                           dc.w $0018
[000c7dae]                           dc.w $0001
_16aMEN_EDIT:
[000c7db0] 0002bc74                  dc.l eded_keys
[000c7db4]                           dc.w $0000
[000c7db6]                           dc.w $0000
[000c7db8]                           dc.w $8000
[000c7dba]                           dc.w $884c
[000c7dbc]                           dc.w $0000
[000c7dbe]                           dc.w $0000
[000c7dc0]                           dc.w $0000
[000c7dc2]                           dc.w $0000
[000c7dc4]                           dc.w $0000
[000c7dc6]                           dc.w $0000
_18_MEN_EDIT:
[000c7dc8]                           dc.w $0014
[000c7dca]                           dc.w $ffff
[000c7dcc]                           dc.w $ffff
[000c7dce]                           dc.w $001c
[000c7dd0]                           dc.w $0000
[000c7dd2]                           dc.w $0100
[000c7dd4] 000c4c29                  dc.l TEXT_09
[000c7dd8]                           dc.w $0000
[000c7dda]                           dc.w $0001
[000c7ddc]                           dc.w $0018
[000c7dde]                           dc.w $0001
_18aMEN_EDIT:
[000c7de0] 0002c2ea                  dc.l eded_try
[000c7de4]                           dc.w $0000
[000c7de6]                           dc.w $0000
[000c7de8]                           dc.w $8000
[000c7dea]                           dc.w $8854
[000c7dec]                           dc.w $0000
[000c7dee]                           dc.w $0000
[000c7df0]                           dc.w $0000
[000c7df2]                           dc.w $0000
[000c7df4]                           dc.w $0000
[000c7df6]                           dc.w $0000
_20_MEN_EDIT:
[000c7df8]                           dc.w $0015
[000c7dfa]                           dc.w $ffff
[000c7dfc]                           dc.w $ffff
[000c7dfe]                           dc.w $0018
[000c7e00]                           dc.w $0000
[000c7e02]                           dc.w $0108
[000c7e04] 000c74fc                  dc.l A_ARROWS02
[000c7e08]                           dc.w $0000
[000c7e0a]                           dc.w $0002
[000c7e0c]                           dc.w $0018
[000c7e0e]                           dc.w $0001
_21_MEN_EDIT:
[000c7e10]                           dc.w $0017
[000c7e12]                           dc.w $ffff
[000c7e14]                           dc.w $ffff
[000c7e16]                           dc.w $001c
[000c7e18]                           dc.w $0000
[000c7e1a]                           dc.w $0100
[000c7e1c] 000c4bb5                  dc.l TEXT_06
[000c7e20]                           dc.w $0000
[000c7e22]                           dc.w $0003
[000c7e24]                           dc.w $0018
[000c7e26]                           dc.w $0001
_21aMEN_EDIT:
[000c7e28] 0002bbc8                  dc.l eded_info
[000c7e2c]                           dc.w $0000
[000c7e2e]                           dc.w $0000
[000c7e30]                           dc.w $8000
[000c7e32]                           dc.w $8449
[000c7e34]                           dc.w $0000
[000c7e36]                           dc.w $0000
[000c7e38]                           dc.w $0000
[000c7e3a]                           dc.w $0000
[000c7e3c]                           dc.w $0000
[000c7e3e]                           dc.w $0000
_23_MEN_EDIT:
[000c7e40]                           dc.w $0018
[000c7e42]                           dc.w $ffff
[000c7e44]                           dc.w $ffff
[000c7e46]                           dc.w $0018
[000c7e48]                           dc.w $0000
[000c7e4a]                           dc.w $0108
[000c7e4c] 000c74fc                  dc.l A_ARROWS02
[000c7e50]                           dc.w $0000
[000c7e52]                           dc.w $0004
[000c7e54]                           dc.w $0018
[000c7e56]                           dc.w $0001
_24_MEN_EDIT:
[000c7e58]                           dc.w $001a
[000c7e5a]                           dc.w $ffff
[000c7e5c]                           dc.w $ffff
[000c7e5e]                           dc.w $001c
[000c7e60]                           dc.w $0000
[000c7e62]                           dc.w $0100
[000c7e64] 000c4bd4                  dc.l TEXT_07
[000c7e68]                           dc.w $0000
[000c7e6a]                           dc.w $0005
[000c7e6c]                           dc.w $0018
[000c7e6e]                           dc.w $0001
_24aMEN_EDIT:
[000c7e70] 00030aae                  dc.l edob_resetref
[000c7e74]                           dc.w $0000
[000c7e76]                           dc.w $0000
[000c7e78]                           dc.w $8000
[000c7e7a]                           dc.w $0000
[000c7e7c]                           dc.w $0000
[000c7e7e]                           dc.w $0000
[000c7e80]                           dc.w $0000
[000c7e82]                           dc.w $0000
[000c7e84]                           dc.w $0000
[000c7e86]                           dc.w $0000
_26_MEN_EDIT:
[000c7e88]                           dc.w $000f
[000c7e8a]                           dc.w $ffff
[000c7e8c]                           dc.w $ffff
[000c7e8e]                           dc.w $001c
[000c7e90]                           dc.w $0000
[000c7e92]                           dc.w $0100
[000c7e94] 000c4d24                  dc.l TEXT_18
[000c7e98]                           dc.w $0000
[000c7e9a]                           dc.w $0006
[000c7e9c]                           dc.w $0018
[000c7e9e]                           dc.w $0001
_26aMEN_EDIT:
[000c7ea0] 0002bbda                  dc.l eded_parts
[000c7ea4]                           dc.w $0000
[000c7ea6]                           dc.w $0000
[000c7ea8]                           dc.w $8020
[000c7eaa]                           dc.w $004b
[000c7eac]                           dc.w $0000
[000c7eae]                           dc.w $0000
[000c7eb0]                           dc.w $0000
[000c7eb2]                           dc.w $0000
[000c7eb4]                           dc.w $0000
[000c7eb6]                           dc.w $0000
OBJ_POPUP:
[000c7eb8]                           dc.w $ffff
[000c7eba]                           dc.w $0001
[000c7ebc]                           dc.w $0052
[000c7ebe]                           dc.w $0014
[000c7ec0]                           dc.w $0000
[000c7ec2]                           dc.w $0020
[000c7ec4]                           dc.w $00ff
[000c7ec6]                           dc.w $1100
[000c7ec8]                           dc.w $0000
[000c7eca]                           dc.w $0000
[000c7ecc]                           dc.w $0014
[000c7ece]                           dc.w $0007
_01_OBJ_POPUP:
[000c7ed0]                           dc.w $0003
[000c7ed2]                           dc.w $ffff
[000c7ed4]                           dc.w $ffff
[000c7ed6]                           dc.w $0018
[000c7ed8]                           dc.w $0041
[000c7eda]                           dc.w $0000
[000c7edc] 000c723c                  dc.l A_3DBUTTON06
[000c7ee0]                           dc.w $0000
[000c7ee2]                           dc.w $0000
[000c7ee4]                           dc.w $0014
[000c7ee6]                           dc.w $0001
_01aOBJ_POPUP:
[000c7ee8] 0002f856                  dc.l edob_specs
[000c7eec]                           dc.w $0000
[000c7eee]                           dc.w $0000
[000c7ef0]                           dc.w $8000
[000c7ef2]                           dc.w $0000
[000c7ef4]                           dc.w $0000
[000c7ef6]                           dc.w $0000
[000c7ef8]                           dc.w $0000
[000c7efa]                           dc.w $0000
[000c7efc]                           dc.w $0000
[000c7efe]                           dc.w $0000
_03_OBJ_POPUP:
[000c7f00]                           dc.w $0005
[000c7f02]                           dc.w $ffff
[000c7f04]                           dc.w $ffff
[000c7f06]                           dc.w $0018
[000c7f08]                           dc.w $0041
[000c7f0a]                           dc.w $0000
[000c7f0c] 000c731c                  dc.l A_3DBUTTON13
[000c7f10]                           dc.w $0000
[000c7f12]                           dc.w $0001
[000c7f14]                           dc.w $0014
[000c7f16]                           dc.w $0001
_03aOBJ_POPUP:
[000c7f18] 0002f708                  dc.l edob_aflags
[000c7f1c]                           dc.w $0000
[000c7f1e]                           dc.w $0000
[000c7f20]                           dc.w $8000
[000c7f22]                           dc.w $0000
[000c7f24]                           dc.w $0000
[000c7f26]                           dc.w $0000
[000c7f28]                           dc.w $0000
[000c7f2a]                           dc.w $0000
[000c7f2c]                           dc.w $0000
[000c7f2e]                           dc.w $0000
_05_OBJ_POPUP:
[000c7f30]                           dc.w $0007
[000c7f32]                           dc.w $ffff
[000c7f34]                           dc.w $ffff
[000c7f36]                           dc.w $0018
[000c7f38]                           dc.w $0041
[000c7f3a]                           dc.w $0000
[000c7f3c] 000c71fc                  dc.l A_3DBUTTON04
[000c7f40]                           dc.w $0000
[000c7f42]                           dc.w $0002
[000c7f44]                           dc.w $0014
[000c7f46]                           dc.w $0001
_05aOBJ_POPUP:
[000c7f48] 0002f420                  dc.l edob_refs
[000c7f4c]                           dc.w $0000
[000c7f4e]                           dc.w $0000
[000c7f50]                           dc.w $8000
[000c7f52]                           dc.w $0000
[000c7f54]                           dc.w $0000
[000c7f56]                           dc.w $0000
[000c7f58]                           dc.w $0000
[000c7f5a]                           dc.w $0000
[000c7f5c]                           dc.w $0000
[000c7f5e]                           dc.w $0000
_07_OBJ_POPUP:
[000c7f60]                           dc.w $0009
[000c7f62]                           dc.w $ffff
[000c7f64]                           dc.w $ffff
[000c7f66]                           dc.w $0018
[000c7f68]                           dc.w $0041
[000c7f6a]                           dc.w $0000
[000c7f6c] 000c729c                  dc.l A_3DBUTTON09
[000c7f70]                           dc.w $0000
[000c7f72]                           dc.w $0003
[000c7f74]                           dc.w $0014
[000c7f76]                           dc.w $0001
_07aOBJ_POPUP:
[000c7f78] 000305bc                  dc.l edob_pos
[000c7f7c]                           dc.w $0000
[000c7f7e]                           dc.w $0000
[000c7f80]                           dc.w $8000
[000c7f82]                           dc.w $0000
[000c7f84]                           dc.w $0000
[000c7f86]                           dc.w $0000
[000c7f88]                           dc.w $0000
[000c7f8a]                           dc.w $0000
[000c7f8c]                           dc.w $0000
[000c7f8e]                           dc.w $0000
_09_OBJ_POPUP:
[000c7f90]                           dc.w $001c
[000c7f92]                           dc.w $000a
[000c7f94]                           dc.w $001a
[000c7f96]                           dc.w $0014
[000c7f98]                           dc.w $0080
[000c7f9a]                           dc.w $0020
[000c7f9c]                           dc.w $00ff
[000c7f9e]                           dc.w $1101
[000c7fa0]                           dc.w $0000
[000c7fa2]                           dc.w $0004
[000c7fa4]                           dc.w $000a
[000c7fa6]                           dc.w $000a
_10_OBJ_POPUP:
[000c7fa8]                           dc.w $000b
[000c7faa]                           dc.w $ffff
[000c7fac]                           dc.w $ffff
[000c7fae]                           dc.w $001c
[000c7fb0]                           dc.w $0000
[000c7fb2]                           dc.w $2008
[000c7fb4] 000c4c8d                  dc.l TEXT_099
[000c7fb8]                           dc.w $0000
[000c7fba]                           dc.w $0000
[000c7fbc]                           dc.w $000a
[000c7fbe]                           dc.w $0001
_11_OBJ_POPUP:
[000c7fc0]                           dc.w $000d
[000c7fc2]                           dc.w $ffff
[000c7fc4]                           dc.w $ffff
[000c7fc6]                           dc.w $001c
[000c7fc8]                           dc.w $0001
[000c7fca]                           dc.w $0000
[000c7fcc] 000c4c52                  dc.l TEXT_092
[000c7fd0]                           dc.w $0000
[000c7fd2]                           dc.w $0001
[000c7fd4]                           dc.w $000a
[000c7fd6]                           dc.w $0001
_11aOBJ_POPUP:
[000c7fd8] 0002fb5e                  dc.l edob_left
[000c7fdc]                           dc.w $0000
[000c7fde]                           dc.w $0000
[000c7fe0]                           dc.w $8000
[000c7fe2]                           dc.w $0000
[000c7fe4]                           dc.w $0000
[000c7fe6]                           dc.w $0000
[000c7fe8]                           dc.w $0000
[000c7fea]                           dc.w $0000
[000c7fec]                           dc.w $0000
[000c7fee]                           dc.w $0000
_13_OBJ_POPUP:
[000c7ff0]                           dc.w $000f
[000c7ff2]                           dc.w $ffff
[000c7ff4]                           dc.w $ffff
[000c7ff6]                           dc.w $001c
[000c7ff8]                           dc.w $0001
[000c7ffa]                           dc.w $0000
[000c7ffc] 000c4c4a                  dc.l TEXT_091
[000c8000]                           dc.w $0000
[000c8002]                           dc.w $0002
[000c8004]                           dc.w $000a
[000c8006]                           dc.w $0001
_13aOBJ_POPUP:
[000c8008] 0002fc7a                  dc.l edob_center
[000c800c]                           dc.w $0000
[000c800e]                           dc.w $0000
[000c8010]                           dc.w $8000
[000c8012]                           dc.w $0000
[000c8014]                           dc.w $0000
[000c8016]                           dc.w $0000
[000c8018]                           dc.w $0000
[000c801a]                           dc.w $0000
[000c801c]                           dc.w $0000
[000c801e]                           dc.w $0000
_15_OBJ_POPUP:
[000c8020]                           dc.w $0011
[000c8022]                           dc.w $ffff
[000c8024]                           dc.w $ffff
[000c8026]                           dc.w $001c
[000c8028]                           dc.w $0001
[000c802a]                           dc.w $0000
[000c802c] 000c4c41                  dc.l TEXT_090
[000c8030]                           dc.w $0000
[000c8032]                           dc.w $0003
[000c8034]                           dc.w $000a
[000c8036]                           dc.w $0001
_15aOBJ_POPUP:
[000c8038] 0002fbd8                  dc.l edob_right
[000c803c]                           dc.w $0000
[000c803e]                           dc.w $0000
[000c8040]                           dc.w $8000
[000c8042]                           dc.w $0000
[000c8044]                           dc.w $0000
[000c8046]                           dc.w $0000
[000c8048]                           dc.w $0000
[000c804a]                           dc.w $0000
[000c804c]                           dc.w $0000
[000c804e]                           dc.w $0000
_17_OBJ_POPUP:
[000c8050]                           dc.w $0013
[000c8052]                           dc.w $ffff
[000c8054]                           dc.w $ffff
[000c8056]                           dc.w $001c
[000c8058]                           dc.w $0001
[000c805a]                           dc.w $0000
[000c805c] 000c4c9f                  dc.l TEXT_100
[000c8060]                           dc.w $0000
[000c8062]                           dc.w $0004
[000c8064]                           dc.w $000a
[000c8066]                           dc.w $0001
_17aOBJ_POPUP:
[000c8068] 0002fd1e                  dc.l edob_horfill
[000c806c]                           dc.w $0000
[000c806e]                           dc.w $0000
[000c8070]                           dc.w $8000
[000c8072]                           dc.w $0000
[000c8074]                           dc.w $0000
[000c8076]                           dc.w $0000
[000c8078]                           dc.w $0000
[000c807a]                           dc.w $0000
[000c807c]                           dc.w $0000
[000c807e]                           dc.w $0000
_19_OBJ_POPUP:
[000c8080]                           dc.w $0014
[000c8082]                           dc.w $ffff
[000c8084]                           dc.w $ffff
[000c8086]                           dc.w $001c
[000c8088]                           dc.w $0000
[000c808a]                           dc.w $2008
[000c808c] 000c4c61                  dc.l TEXT_094
[000c8090]                           dc.w $0000
[000c8092]                           dc.w $0005
[000c8094]                           dc.w $000a
[000c8096]                           dc.w $0001
_20_OBJ_POPUP:
[000c8098]                           dc.w $0016
[000c809a]                           dc.w $ffff
[000c809c]                           dc.w $ffff
[000c809e]                           dc.w $001c
[000c80a0]                           dc.w $0001
[000c80a2]                           dc.w $0000
[000c80a4] 000c4c5a                  dc.l TEXT_093
[000c80a8]                           dc.w $0000
[000c80aa]                           dc.w $0006
[000c80ac]                           dc.w $000a
[000c80ae]                           dc.w $0001
_20aOBJ_POPUP:
[000c80b0] 0002fdf8                  dc.l edob_top
[000c80b4]                           dc.w $0000
[000c80b6]                           dc.w $0000
[000c80b8]                           dc.w $8000
[000c80ba]                           dc.w $0000
[000c80bc]                           dc.w $0000
[000c80be]                           dc.w $0000
[000c80c0]                           dc.w $0000
[000c80c2]                           dc.w $0000
[000c80c4]                           dc.w $0000
[000c80c6]                           dc.w $0000
_22_OBJ_POPUP:
[000c80c8]                           dc.w $0018
[000c80ca]                           dc.w $ffff
[000c80cc]                           dc.w $ffff
[000c80ce]                           dc.w $001c
[000c80d0]                           dc.w $0001
[000c80d2]                           dc.w $0000
[000c80d4] 000c4c4a                  dc.l TEXT_091
[000c80d8]                           dc.w $0000
[000c80da]                           dc.w $0007
[000c80dc]                           dc.w $000a
[000c80de]                           dc.w $0001
_22aOBJ_POPUP:
[000c80e0] 0002ff12                  dc.l edob_mid
[000c80e4]                           dc.w $0000
[000c80e6]                           dc.w $0000
[000c80e8]                           dc.w $8000
[000c80ea]                           dc.w $0000
[000c80ec]                           dc.w $0000
[000c80ee]                           dc.w $0000
[000c80f0]                           dc.w $0000
[000c80f2]                           dc.w $0000
[000c80f4]                           dc.w $0000
[000c80f6]                           dc.w $0000
_24_OBJ_POPUP:
[000c80f8]                           dc.w $001a
[000c80fa]                           dc.w $ffff
[000c80fc]                           dc.w $ffff
[000c80fe]                           dc.w $001c
[000c8100]                           dc.w $0001
[000c8102]                           dc.w $0000
[000c8104] 000c4c6c                  dc.l TEXT_095
[000c8108]                           dc.w $0000
[000c810a]                           dc.w $0008
[000c810c]                           dc.w $000a
[000c810e]                           dc.w $0001
_24aOBJ_POPUP:
[000c8110] 0002fe70                  dc.l edob_bottom
[000c8114]                           dc.w $0000
[000c8116]                           dc.w $0000
[000c8118]                           dc.w $8000
[000c811a]                           dc.w $0000
[000c811c]                           dc.w $0000
[000c811e]                           dc.w $0000
[000c8120]                           dc.w $0000
[000c8122]                           dc.w $0000
[000c8124]                           dc.w $0000
[000c8126]                           dc.w $0000
_26_OBJ_POPUP:
[000c8128]                           dc.w $0009
[000c812a]                           dc.w $ffff
[000c812c]                           dc.w $ffff
[000c812e]                           dc.w $001c
[000c8130]                           dc.w $0001
[000c8132]                           dc.w $0000
[000c8134] 000c4c9f                  dc.l TEXT_100
[000c8138]                           dc.w $0000
[000c813a]                           dc.w $0009
[000c813c]                           dc.w $000a
[000c813e]                           dc.w $0001
_26aOBJ_POPUP:
[000c8140] 0002ffb6                  dc.l edob_verfill
[000c8144]                           dc.w $0000
[000c8146]                           dc.w $0000
[000c8148]                           dc.w $8000
[000c814a]                           dc.w $0000
[000c814c]                           dc.w $0000
[000c814e]                           dc.w $0000
[000c8150]                           dc.w $0000
[000c8152]                           dc.w $0000
[000c8154]                           dc.w $0000
[000c8156]                           dc.w $0000
_28_OBJ_POPUP:
[000c8158]                           dc.w $0030
[000c815a]                           dc.w $001d
[000c815c]                           dc.w $001d
[000c815e]                           dc.w $0018
[000c8160]                           dc.w $0041
[000c8162]                           dc.w $0000
[000c8164] 000c72bc                  dc.l A_3DBUTTON10
[000c8168]                           dc.w $0000
[000c816a]                           dc.w $0004
[000c816c]                           dc.w $0014
[000c816e]                           dc.w $0001
_29_OBJ_POPUP:
[000c8170]                           dc.w $001c
[000c8172]                           dc.w $001e
[000c8174]                           dc.w $002e
[000c8176]                           dc.w $0014
[000c8178]                           dc.w $0080
[000c817a]                           dc.w $0020
[000c817c]                           dc.w $00ff
[000c817e]                           dc.w $1101
[000c8180]                           dc.w $0000
[000c8182]                           dc.w $0000
[000c8184]                           dc.w $000d
[000c8186]                           dc.w $000a
_30_OBJ_POPUP:
[000c8188]                           dc.w $001f
[000c818a]                           dc.w $ffff
[000c818c]                           dc.w $ffff
[000c818e]                           dc.w $0018
[000c8190]                           dc.w $0000
[000c8192]                           dc.w $0000
[000c8194] 000c743c                  dc.l A_3DBUTTON22
[000c8198]                           dc.w $0000
[000c819a]                           dc.w $0000
[000c819c]                           dc.w $000d
[000c819e]                           dc.w $0001
_31_OBJ_POPUP:
[000c81a0]                           dc.w $0021
[000c81a2]                           dc.w $ffff
[000c81a4]                           dc.w $ffff
[000c81a6]                           dc.w $0018
[000c81a8]                           dc.w $0041
[000c81aa]                           dc.w $0000
[000c81ac] 000c72dc                  dc.l A_3DBUTTON11
[000c81b0]                           dc.w $0000
[000c81b2]                           dc.w $0001
[000c81b4]                           dc.w $000d
[000c81b6]                           dc.w $0001
_31aOBJ_POPUP:
[000c81b8] 0002fb5e                  dc.l edob_left
[000c81bc]                           dc.w $0000
[000c81be]                           dc.w $0000
[000c81c0]                           dc.w $8000
[000c81c2]                           dc.w $0000
[000c81c4]                           dc.w $0000
[000c81c6]                           dc.w $0000
[000c81c8]                           dc.w $0000
[000c81ca]                           dc.w $0000
[000c81cc]                           dc.w $0000
[000c81ce]                           dc.w $0000
_33_OBJ_POPUP:
[000c81d0]                           dc.w $0023
[000c81d2]                           dc.w $ffff
[000c81d4]                           dc.w $ffff
[000c81d6]                           dc.w $0018
[000c81d8]                           dc.w $0041
[000c81da]                           dc.w $0000
[000c81dc] 000c735c                  dc.l A_3DBUTTON15
[000c81e0]                           dc.w $0000
[000c81e2]                           dc.w $0002
[000c81e4]                           dc.w $000d
[000c81e6]                           dc.w $0001
_33aOBJ_POPUP:
[000c81e8] 0002fc7a                  dc.l edob_center
[000c81ec]                           dc.w $0000
[000c81ee]                           dc.w $0000
[000c81f0]                           dc.w $8000
[000c81f2]                           dc.w $0000
[000c81f4]                           dc.w $0000
[000c81f6]                           dc.w $0000
[000c81f8]                           dc.w $0000
[000c81fa]                           dc.w $0000
[000c81fc]                           dc.w $0000
[000c81fe]                           dc.w $0000
_35_OBJ_POPUP:
[000c8200]                           dc.w $0025
[000c8202]                           dc.w $ffff
[000c8204]                           dc.w $ffff
[000c8206]                           dc.w $0018
[000c8208]                           dc.w $0041
[000c820a]                           dc.w $0000
[000c820c] 000c737c                  dc.l A_3DBUTTON16
[000c8210]                           dc.w $0000
[000c8212]                           dc.w $0003
[000c8214]                           dc.w $000d
[000c8216]                           dc.w $0001
_35aOBJ_POPUP:
[000c8218] 0002fbd8                  dc.l edob_right
[000c821c]                           dc.w $0000
[000c821e]                           dc.w $0000
[000c8220]                           dc.w $8000
[000c8222]                           dc.w $0000
[000c8224]                           dc.w $0000
[000c8226]                           dc.w $0000
[000c8228]                           dc.w $0000
[000c822a]                           dc.w $0000
[000c822c]                           dc.w $0000
[000c822e]                           dc.w $0000
_37_OBJ_POPUP:
[000c8230]                           dc.w $0027
[000c8232]                           dc.w $ffff
[000c8234]                           dc.w $ffff
[000c8236]                           dc.w $0018
[000c8238]                           dc.w $0041
[000c823a]                           dc.w $0000
[000c823c] 000c739c                  dc.l A_3DBUTTON17
[000c8240]                           dc.w $0000
[000c8242]                           dc.w $0004
[000c8244]                           dc.w $000d
[000c8246]                           dc.w $0001
_37aOBJ_POPUP:
[000c8248] 0002fd1e                  dc.l edob_horfill
[000c824c]                           dc.w $0000
[000c824e]                           dc.w $0000
[000c8250]                           dc.w $8000
[000c8252]                           dc.w $0000
[000c8254]                           dc.w $0000
[000c8256]                           dc.w $0000
[000c8258]                           dc.w $0000
[000c825a]                           dc.w $0000
[000c825c]                           dc.w $0000
[000c825e]                           dc.w $0000
_39_OBJ_POPUP:
[000c8260]                           dc.w $0028
[000c8262]                           dc.w $ffff
[000c8264]                           dc.w $ffff
[000c8266]                           dc.w $0018
[000c8268]                           dc.w $0000
[000c826a]                           dc.w $0000
[000c826c] 000c73fc                  dc.l A_3DBUTTON20
[000c8270]                           dc.w $0000
[000c8272]                           dc.w $0005
[000c8274]                           dc.w $000d
[000c8276]                           dc.w $0001
_40_OBJ_POPUP:
[000c8278]                           dc.w $002a
[000c827a]                           dc.w $ffff
[000c827c]                           dc.w $ffff
[000c827e]                           dc.w $0018
[000c8280]                           dc.w $0041
[000c8282]                           dc.w $0000
[000c8284] 000c73bc                  dc.l A_3DBUTTON18
[000c8288]                           dc.w $0000
[000c828a]                           dc.w $0006
[000c828c]                           dc.w $000d
[000c828e]                           dc.w $0001
_40aOBJ_POPUP:
[000c8290] 0002fdf8                  dc.l edob_top
[000c8294]                           dc.w $0000
[000c8296]                           dc.w $0000
[000c8298]                           dc.w $8000
[000c829a]                           dc.w $0000
[000c829c]                           dc.w $0000
[000c829e]                           dc.w $0000
[000c82a0]                           dc.w $0000
[000c82a2]                           dc.w $0000
[000c82a4]                           dc.w $0000
[000c82a6]                           dc.w $0000
_42_OBJ_POPUP:
[000c82a8]                           dc.w $002c
[000c82aa]                           dc.w $ffff
[000c82ac]                           dc.w $ffff
[000c82ae]                           dc.w $0018
[000c82b0]                           dc.w $0041
[000c82b2]                           dc.w $0000
[000c82b4] 000c735c                  dc.l A_3DBUTTON15
[000c82b8]                           dc.w $0000
[000c82ba]                           dc.w $0007
[000c82bc]                           dc.w $000d
[000c82be]                           dc.w $0001
_42aOBJ_POPUP:
[000c82c0] 0002ff12                  dc.l edob_mid
[000c82c4]                           dc.w $0000
[000c82c6]                           dc.w $0000
[000c82c8]                           dc.w $8000
[000c82ca]                           dc.w $0000
[000c82cc]                           dc.w $0000
[000c82ce]                           dc.w $0000
[000c82d0]                           dc.w $0000
[000c82d2]                           dc.w $0000
[000c82d4]                           dc.w $0000
[000c82d6]                           dc.w $0000
_44_OBJ_POPUP:
[000c82d8]                           dc.w $002e
[000c82da]                           dc.w $ffff
[000c82dc]                           dc.w $ffff
[000c82de]                           dc.w $0018
[000c82e0]                           dc.w $0041
[000c82e2]                           dc.w $0000
[000c82e4] 000c73dc                  dc.l A_3DBUTTON19
[000c82e8]                           dc.w $0000
[000c82ea]                           dc.w $0008
[000c82ec]                           dc.w $000d
[000c82ee]                           dc.w $0001
_44aOBJ_POPUP:
[000c82f0] 0002fe70                  dc.l edob_bottom
[000c82f4]                           dc.w $0000
[000c82f6]                           dc.w $0000
[000c82f8]                           dc.w $8000
[000c82fa]                           dc.w $0000
[000c82fc]                           dc.w $0000
[000c82fe]                           dc.w $0000
[000c8300]                           dc.w $0000
[000c8302]                           dc.w $0000
[000c8304]                           dc.w $0000
[000c8306]                           dc.w $0000
_46_OBJ_POPUP:
[000c8308]                           dc.w $001d
[000c830a]                           dc.w $ffff
[000c830c]                           dc.w $ffff
[000c830e]                           dc.w $0018
[000c8310]                           dc.w $0041
[000c8312]                           dc.w $0000
[000c8314] 000c739c                  dc.l A_3DBUTTON17
[000c8318]                           dc.w $0000
[000c831a]                           dc.w $0009
[000c831c]                           dc.w $000d
[000c831e]                           dc.w $0001
_46aOBJ_POPUP:
[000c8320] 0002ffb6                  dc.l edob_verfill
[000c8324]                           dc.w $0000
[000c8326]                           dc.w $0000
[000c8328]                           dc.w $8000
[000c832a]                           dc.w $0000
[000c832c]                           dc.w $0000
[000c832e]                           dc.w $0000
[000c8330]                           dc.w $0000
[000c8332]                           dc.w $0000
[000c8334]                           dc.w $0000
[000c8336]                           dc.w $0000
_48_OBJ_POPUP:
[000c8338]                           dc.w $003f
[000c833a]                           dc.w $0031
[000c833c]                           dc.w $003e
[000c833e]                           dc.w $0014
[000c8340]                           dc.w $0080
[000c8342]                           dc.w $0020
[000c8344]                           dc.w $00ff
[000c8346]                           dc.w $1101
[000c8348]                           dc.w $0000
[000c834a]                           dc.w $0005
[000c834c]                           dc.w $000e
[000c834e]                           dc.w $0008
_49_OBJ_POPUP:
[000c8350]                           dc.w $0033
[000c8352]                           dc.w $ffff
[000c8354]                           dc.w $ffff
[000c8356]                           dc.w $001c
[000c8358]                           dc.w $0001
[000c835a]                           dc.w $2000
[000c835c] 000c4bf7                  dc.l TEXT_086
[000c8360]                           dc.w $0000
[000c8362]                           dc.w $0000
[000c8364]                           dc.w $000e
[000c8366]                           dc.w $0001
_49aOBJ_POPUP:
[000c8368] 0002f764                  dc.l edob_hide
[000c836c]                           dc.w $0000
[000c836e]                           dc.w $0000
[000c8370]                           dc.w $8000
[000c8372]                           dc.w $0000
[000c8374]                           dc.w $0000
[000c8376]                           dc.w $0000
[000c8378]                           dc.w $0000
[000c837a]                           dc.w $0000
[000c837c]                           dc.w $0000
[000c837e]                           dc.w $0000
_51_OBJ_POPUP:
[000c8380]                           dc.w $0035
[000c8382]                           dc.w $ffff
[000c8384]                           dc.w $ffff
[000c8386]                           dc.w $001c
[000c8388]                           dc.w $0001
[000c838a]                           dc.w $2000
[000c838c] 000c4c03                  dc.l TEXT_087
[000c8390]                           dc.w $0000
[000c8392]                           dc.w $0001
[000c8394]                           dc.w $000e
[000c8396]                           dc.w $0001
_51aOBJ_POPUP:
[000c8398] 00030500                  dc.l edob_unhide
[000c839c]                           dc.w $0000
[000c839e]                           dc.w $0000
[000c83a0]                           dc.w $8000
[000c83a2]                           dc.w $0000
[000c83a4]                           dc.w $0000
[000c83a6]                           dc.w $0000
[000c83a8]                           dc.w $0000
[000c83aa]                           dc.w $0000
[000c83ac]                           dc.w $0000
[000c83ae]                           dc.w $0000
_53_OBJ_POPUP:
[000c83b0]                           dc.w $0037
[000c83b2]                           dc.w $ffff
[000c83b4]                           dc.w $ffff
[000c83b6]                           dc.w $001c
[000c83b8]                           dc.w $0001
[000c83ba]                           dc.w $0000
[000c83bc] 000c4c0f                  dc.l TEXT_088
[000c83c0]                           dc.w $0000
[000c83c2]                           dc.w $0003
[000c83c4]                           dc.w $000e
[000c83c6]                           dc.w $0001
_53aOBJ_POPUP:
[000c83c8] 00030440                  dc.l edob_lock
[000c83cc]                           dc.w $0000
[000c83ce]                           dc.w $0000
[000c83d0]                           dc.w $8000
[000c83d2]                           dc.w $0000
[000c83d4]                           dc.w $0000
[000c83d6]                           dc.w $0000
[000c83d8]                           dc.w $0000
[000c83da]                           dc.w $0000
[000c83dc]                           dc.w $0000
[000c83de]                           dc.w $0000
_55_OBJ_POPUP:
[000c83e0]                           dc.w $0039
[000c83e2]                           dc.w $ffff
[000c83e4]                           dc.w $ffff
[000c83e6]                           dc.w $001c
[000c83e8]                           dc.w $0001
[000c83ea]                           dc.w $0000
[000c83ec] 000c4c1c                  dc.l TEXT_089
[000c83f0]                           dc.w $0000
[000c83f2]                           dc.w $0004
[000c83f4]                           dc.w $000e
[000c83f6]                           dc.w $0001
_55aOBJ_POPUP:
[000c83f8] 000304a0                  dc.l edob_unlock
[000c83fc]                           dc.w $0000
[000c83fe]                           dc.w $0000
[000c8400]                           dc.w $8000
[000c8402]                           dc.w $0000
[000c8404]                           dc.w $0000
[000c8406]                           dc.w $0000
[000c8408]                           dc.w $0000
[000c840a]                           dc.w $0000
[000c840c]                           dc.w $0000
[000c840e]                           dc.w $0000
_57_OBJ_POPUP:
[000c8410]                           dc.w $003b
[000c8412]                           dc.w $ffff
[000c8414]                           dc.w $ffff
[000c8416]                           dc.w $001c
[000c8418]                           dc.w $0001
[000c841a]                           dc.w $0000
[000c841c] 000c4c74                  dc.l TEXT_097
[000c8420]                           dc.w $0000
[000c8422]                           dc.w $0006
[000c8424]                           dc.w $000e
[000c8426]                           dc.w $0001
_57aOBJ_POPUP:
[000c8428] 00030090                  dc.l edob_up
[000c842c]                           dc.w $0000
[000c842e]                           dc.w $0000
[000c8430]                           dc.w $8000
[000c8432]                           dc.w $0000
[000c8434]                           dc.w $0000
[000c8436]                           dc.w $0000
[000c8438]                           dc.w $0000
[000c843a]                           dc.w $0000
[000c843c]                           dc.w $0000
[000c843e]                           dc.w $0000
_59_OBJ_POPUP:
[000c8440]                           dc.w $003d
[000c8442]                           dc.w $ffff
[000c8444]                           dc.w $ffff
[000c8446]                           dc.w $001c
[000c8448]                           dc.w $0001
[000c844a]                           dc.w $0000
[000c844c] 000c4c80                  dc.l TEXT_098
[000c8450]                           dc.w $0000
[000c8452]                           dc.w $0007
[000c8454]                           dc.w $000e
[000c8456]                           dc.w $0001
_59aOBJ_POPUP:
[000c8458] 00030172                  dc.l edob_down
[000c845c]                           dc.w $0000
[000c845e]                           dc.w $0000
[000c8460]                           dc.w $8000
[000c8462]                           dc.w $0000
[000c8464]                           dc.w $0000
[000c8466]                           dc.w $0000
[000c8468]                           dc.w $0000
[000c846a]                           dc.w $0000
[000c846c]                           dc.w $0000
[000c846e]                           dc.w $0000
_61_OBJ_POPUP:
[000c8470]                           dc.w $003e
[000c8472]                           dc.w $ffff
[000c8474]                           dc.w $ffff
[000c8476]                           dc.w $0018
[000c8478]                           dc.w $0000
[000c847a]                           dc.w $0008
[000c847c] 000c74fc                  dc.l A_ARROWS02
[000c8480]                           dc.w $0000
[000c8482]                           dc.w $0002
[000c8484]                           dc.w $000e
[000c8486]                           dc.w $0001
_62_OBJ_POPUP:
[000c8488]                           dc.w $0030
[000c848a]                           dc.w $ffff
[000c848c]                           dc.w $ffff
[000c848e]                           dc.w $0018
[000c8490]                           dc.w $0000
[000c8492]                           dc.w $0008
[000c8494] 000c74fc                  dc.l A_ARROWS02
[000c8498]                           dc.w $0000
[000c849a]                           dc.w $0005
[000c849c]                           dc.w $000e
[000c849e]                           dc.w $0001
_63_OBJ_POPUP:
[000c84a0]                           dc.w $004d
[000c84a2]                           dc.w $0040
[000c84a4]                           dc.w $0040
[000c84a6]                           dc.w $0018
[000c84a8]                           dc.w $0041
[000c84aa]                           dc.w $0000
[000c84ac] 000c725c                  dc.l A_3DBUTTON07
[000c84b0]                           dc.w $0000
[000c84b2]                           dc.w $0005
[000c84b4]                           dc.w $0014
[000c84b6]                           dc.w $0001
_64_OBJ_POPUP:
[000c84b8]                           dc.w $003f
[000c84ba]                           dc.w $0041
[000c84bc]                           dc.w $004b
[000c84be]                           dc.w $0014
[000c84c0]                           dc.w $0080
[000c84c2]                           dc.w $0020
[000c84c4]                           dc.w $00ff
[000c84c6]                           dc.w $1101
[000c84c8]                           dc.w $0000
[000c84ca]                           dc.w $0000
[000c84cc]                           dc.w $0024
[000c84ce]                           dc.w $0002
_65_OBJ_POPUP:
[000c84d0]                           dc.w $0043
[000c84d2]                           dc.w $ffff
[000c84d4]                           dc.w $ffff
[000c84d6]                           dc.w $0018
[000c84d8]                           dc.w $0041
[000c84da]                           dc.w $0000
[000c84dc] 000c74dc                  dc.l A_3DBUTTON28
[000c84e0]                           dc.w $0000
[000c84e2]                           dc.w $0000
[000c84e4]                           dc.w $000c
[000c84e6]                           dc.w $0001
_65aOBJ_POPUP:
[000c84e8] 0002f764                  dc.l edob_hide
[000c84ec]                           dc.w $0000
[000c84ee]                           dc.w $0000
[000c84f0]                           dc.w $8000
[000c84f2]                           dc.w $0000
[000c84f4]                           dc.w $0000
[000c84f6]                           dc.w $0000
[000c84f8]                           dc.w $0000
[000c84fa]                           dc.w $0000
[000c84fc]                           dc.w $0000
[000c84fe]                           dc.w $0000
_67_OBJ_POPUP:
[000c8500]                           dc.w $0045
[000c8502]                           dc.w $ffff
[000c8504]                           dc.w $ffff
[000c8506]                           dc.w $0018
[000c8508]                           dc.w $0041
[000c850a]                           dc.w $0000
[000c850c] 000c741c                  dc.l A_3DBUTTON21
[000c8510]                           dc.w $0000
[000c8512]                           dc.w $0001
[000c8514]                           dc.w $000c
[000c8516]                           dc.w $0001
_67aOBJ_POPUP:
[000c8518] 00030500                  dc.l edob_unhide
[000c851c]                           dc.w $0000
[000c851e]                           dc.w $0000
[000c8520]                           dc.w $8000
[000c8522]                           dc.w $0000
[000c8524]                           dc.w $0000
[000c8526]                           dc.w $0000
[000c8528]                           dc.w $0000
[000c852a]                           dc.w $0000
[000c852c]                           dc.w $0000
[000c852e]                           dc.w $0000
_69_OBJ_POPUP:
[000c8530]                           dc.w $0047
[000c8532]                           dc.w $ffff
[000c8534]                           dc.w $ffff
[000c8536]                           dc.w $0018
[000c8538]                           dc.w $0041
[000c853a]                           dc.w $0000
[000c853c] 000c745c                  dc.l A_3DBUTTON23
[000c8540]                           dc.w $000c
[000c8542]                           dc.w $0000
[000c8544]                           dc.w $000c
[000c8546]                           dc.w $0001
_69aOBJ_POPUP:
[000c8548] 00030440                  dc.l edob_lock
[000c854c]                           dc.w $0000
[000c854e]                           dc.w $0000
[000c8550]                           dc.w $8000
[000c8552]                           dc.w $0000
[000c8554]                           dc.w $0000
[000c8556]                           dc.w $0000
[000c8558]                           dc.w $0000
[000c855a]                           dc.w $0000
[000c855c]                           dc.w $0000
[000c855e]                           dc.w $0000
_71_OBJ_POPUP:
[000c8560]                           dc.w $0049
[000c8562]                           dc.w $ffff
[000c8564]                           dc.w $ffff
[000c8566]                           dc.w $0018
[000c8568]                           dc.w $0041
[000c856a]                           dc.w $0000
[000c856c] 000c747c                  dc.l A_3DBUTTON24
[000c8570]                           dc.w $000c
[000c8572]                           dc.w $0001
[000c8574]                           dc.w $000c
[000c8576]                           dc.w $0001
_71aOBJ_POPUP:
[000c8578] 000304a0                  dc.l edob_unlock
[000c857c]                           dc.w $0000
[000c857e]                           dc.w $0000
[000c8580]                           dc.w $8000
[000c8582]                           dc.w $0000
[000c8584]                           dc.w $0000
[000c8586]                           dc.w $0000
[000c8588]                           dc.w $0000
[000c858a]                           dc.w $0000
[000c858c]                           dc.w $0000
[000c858e]                           dc.w $0000
_73_OBJ_POPUP:
[000c8590]                           dc.w $004b
[000c8592]                           dc.w $ffff
[000c8594]                           dc.w $ffff
[000c8596]                           dc.w $0018
[000c8598]                           dc.w $0041
[000c859a]                           dc.w $0000
[000c859c] 000c749c                  dc.l A_3DBUTTON25
[000c85a0]                           dc.w $0018
[000c85a2]                           dc.w $0000
[000c85a4]                           dc.w $000c
[000c85a6]                           dc.w $0001
_73aOBJ_POPUP:
[000c85a8] 00030090                  dc.l edob_up
[000c85ac]                           dc.w $0000
[000c85ae]                           dc.w $0000
[000c85b0]                           dc.w $8000
[000c85b2]                           dc.w $0000
[000c85b4]                           dc.w $0000
[000c85b6]                           dc.w $0000
[000c85b8]                           dc.w $0000
[000c85ba]                           dc.w $0000
[000c85bc]                           dc.w $0000
[000c85be]                           dc.w $0000
_75_OBJ_POPUP:
[000c85c0]                           dc.w $0040
[000c85c2]                           dc.w $ffff
[000c85c4]                           dc.w $ffff
[000c85c6]                           dc.w $0018
[000c85c8]                           dc.w $0041
[000c85ca]                           dc.w $0000
[000c85cc] 000c74bc                  dc.l A_3DBUTTON26
[000c85d0]                           dc.w $0018
[000c85d2]                           dc.w $0001
[000c85d4]                           dc.w $000c
[000c85d6]                           dc.w $0001
_75aOBJ_POPUP:
[000c85d8] 00030172                  dc.l edob_down
[000c85dc]                           dc.w $0000
[000c85de]                           dc.w $0000
[000c85e0]                           dc.w $8000
[000c85e2]                           dc.w $0000
[000c85e4]                           dc.w $0000
[000c85e6]                           dc.w $0000
[000c85e8]                           dc.w $0000
[000c85ea]                           dc.w $0000
[000c85ec]                           dc.w $0000
[000c85ee]                           dc.w $0000
_77_OBJ_POPUP:
[000c85f0]                           dc.w $0052
[000c85f2]                           dc.w $004e
[000c85f4]                           dc.w $0050
[000c85f6]                           dc.w $0014
[000c85f8]                           dc.w $0080
[000c85fa]                           dc.w $0020
[000c85fc]                           dc.w $00ff
[000c85fe]                           dc.w $1101
[000c8600]                           dc.w $0000
[000c8602]                           dc.w $0006
[000c8604]                           dc.w $000c
[000c8606]                           dc.w $0002
_78_OBJ_POPUP:
[000c8608]                           dc.w $0050
[000c860a]                           dc.w $ffff
[000c860c]                           dc.w $ffff
[000c860e]                           dc.w $0017
[000c8610]                           dc.w $0001
[000c8612]                           dc.w $0000
[000c8614] 000c7c0a                  dc.l IM_SORT_YX
[000c8618]                           dc.w $0000
[000c861a]                           dc.w $0000
[000c861c]                           dc.w $0006
[000c861e]                           dc.w $0002
_78aOBJ_POPUP:
[000c8620] 0003042e                  dc.l edob_sortyx
[000c8624]                           dc.w $0000
[000c8626]                           dc.w $0000
[000c8628]                           dc.w $8000
[000c862a]                           dc.w $0000
[000c862c]                           dc.w $0000
[000c862e]                           dc.w $0000
[000c8630]                           dc.w $0000
[000c8632]                           dc.w $0000
[000c8634]                           dc.w $0000
[000c8636]                           dc.w $0000
_80_OBJ_POPUP:
[000c8638]                           dc.w $004d
[000c863a]                           dc.w $ffff
[000c863c]                           dc.w $ffff
[000c863e]                           dc.w $0017
[000c8640]                           dc.w $0001
[000c8642]                           dc.w $0000
[000c8644] 000c7b3c                  dc.l IM_SORT_XY
[000c8648]                           dc.w $0006
[000c864a]                           dc.w $0000
[000c864c]                           dc.w $0006
[000c864e]                           dc.w $0002
_80aOBJ_POPUP:
[000c8650] 0003041c                  dc.l edob_sortxy
[000c8654]                           dc.w $0000
[000c8656]                           dc.w $0000
[000c8658]                           dc.w $8000
[000c865a]                           dc.w $0000
[000c865c]                           dc.w $0000
[000c865e]                           dc.w $0000
[000c8660]                           dc.w $0000
[000c8662]                           dc.w $0000
[000c8664]                           dc.w $0000
[000c8666]                           dc.w $0000
_82_OBJ_POPUP:
[000c8668]                           dc.w $0000
[000c866a]                           dc.w $0053
[000c866c]                           dc.w $0053
[000c866e]                           dc.w $0018
[000c8670]                           dc.w $0041
[000c8672]                           dc.w $0000
[000c8674] 000c733c                  dc.l A_3DBUTTON14
[000c8678]                           dc.w $0000
[000c867a]                           dc.w $0006
[000c867c]                           dc.w $0014
[000c867e]                           dc.w $0001
_83_OBJ_POPUP:
[000c8680]                           dc.w $0052
[000c8682]                           dc.w $0054
[000c8684]                           dc.w $0056
[000c8686]                           dc.w $0014
[000c8688]                           dc.w $0080
[000c868a]                           dc.w $0020
[000c868c]                           dc.w $00ff
[000c868e]                           dc.w $1101
[000c8690]                           dc.w $0000
[000c8692]                           dc.w $0000
[000c8694]                           dc.w $000c
[000c8696]                           dc.w $0002
_84_OBJ_POPUP:
[000c8698]                           dc.w $0056
[000c869a]                           dc.w $ffff
[000c869c]                           dc.w $ffff
[000c869e]                           dc.w $0017
[000c86a0]                           dc.w $0041
[000c86a2]                           dc.w $0000
[000c86a4] 000c7c0a                  dc.l IM_SORT_YX
[000c86a8]                           dc.w $0000
[000c86aa]                           dc.w $0000
[000c86ac]                           dc.w $0006
[000c86ae]                           dc.w $0002
_84aOBJ_POPUP:
[000c86b0] 0003042e                  dc.l edob_sortyx
[000c86b4]                           dc.w $0000
[000c86b6]                           dc.w $0000
[000c86b8]                           dc.w $8000
[000c86ba]                           dc.w $0000
[000c86bc]                           dc.w $0000
[000c86be]                           dc.w $0000
[000c86c0]                           dc.w $0000
[000c86c2]                           dc.w $0000
[000c86c4]                           dc.w $0000
[000c86c6]                           dc.w $0000
_86_OBJ_POPUP:
[000c86c8]                           dc.w $0053
[000c86ca]                           dc.w $ffff
[000c86cc]                           dc.w $ffff
[000c86ce]                           dc.w $0017
[000c86d0]                           dc.w $0041
[000c86d2]                           dc.w $0000
[000c86d4] 000c7b3c                  dc.l IM_SORT_XY
[000c86d8]                           dc.w $0006
[000c86da]                           dc.w $0000
[000c86dc]                           dc.w $0006
[000c86de]                           dc.w $0002
_86aOBJ_POPUP:
[000c86e0] 0003041c                  dc.l edob_sortxy
[000c86e4]                           dc.w $0000
[000c86e6]                           dc.w $0000
[000c86e8]                           dc.w $8020
[000c86ea]                           dc.w $0000
[000c86ec]                           dc.w $0000
[000c86ee]                           dc.w $0000
[000c86f0]                           dc.w $0000
[000c86f2]                           dc.w $0000
[000c86f4]                           dc.w $0000
[000c86f6]                           dc.w $0000
FINE_POS:
[000c86f8]                           dc.w $ffff
[000c86fa]                           dc.w $0001
[000c86fc]                           dc.w $0001
[000c86fe]                           dc.w $0019
[000c8700]                           dc.w $0040
[000c8702]                           dc.w $0000
[000c8704]                           dc.w $00ff
[000c8706]                           dc.w $1178
[000c8708]                           dc.w $0000
[000c870a]                           dc.w $0000
[000c870c]                           dc.w $001a
[000c870e]                           dc.w $000a
_01_FINE_POS:
[000c8710]                           dc.w $0000
[000c8712]                           dc.w $0002
[000c8714]                           dc.w $0015
[000c8716]                           dc.w $0018
[000c8718]                           dc.w $0040
[000c871a]                           dc.w $0510
[000c871c] 000c727c                  dc.l A_3DBUTTON08
[000c8720]                           dc.w $0000
[000c8722]                           dc.w $0000
[000c8724]                           dc.w $001a
[000c8726]                           dc.w $000a
_02_FINE_POS:
[000c8728]                           dc.w $0003
[000c872a]                           dc.w $ffff
[000c872c]                           dc.w $ffff
[000c872e]                           dc.w $001c
[000c8730]                           dc.w $0040
[000c8732]                           dc.w $0000
[000c8734] 000c4bf1                  dc.l TEXT_08
[000c8738]                           dc.w $000c
[000c873a]                           dc.w $0001
[000c873c]                           dc.w $0005
[000c873e]                           dc.w $0001
_03_FINE_POS:
[000c8740]                           dc.w $0004
[000c8742]                           dc.w $ffff
[000c8744]                           dc.w $ffff
[000c8746]                           dc.w $001c
[000c8748]                           dc.w $0040
[000c874a]                           dc.w $0000
[000c874c] 000c4c98                  dc.l TEXT_10
[000c8750]                           dc.w $0012
[000c8752]                           dc.w $0001
[000c8754]                           dc.w $0006
[000c8756]                           dc.w $0001
_04_FINE_POS:
[000c8758]                           dc.w $0005
[000c875a]                           dc.w $ffff
[000c875c]                           dc.w $ffff
[000c875e]                           dc.w $001c
[000c8760]                           dc.w $0040
[000c8762]                           dc.w $0000
[000c8764] 000c4d5e                  dc.l TEXT_21
[000c8768]                           dc.w $0006
[000c876a]                           dc.w $0002
[000c876c]                           dc.w $0005
[000c876e]                           dc.w $0001
_05_FINE_POS:
[000c8770]                           dc.w $0010
[000c8772]                           dc.w $0006
[000c8774]                           dc.w $0006
[000c8776]                           dc.w $0018
[000c8778]                           dc.w $0040
[000c877a]                           dc.w $0000
[000c877c] 000c719c                  dc.l A_3DBUTTON01
[000c8780]                           dc.w $000c
[000c8782]                           dc.w $0002
[000c8784]                           dc.w $000c
[000c8786]                           dc.w $0004
_06_FINE_POS:
[000c8788]                           dc.w $0005
[000c878a]                           dc.w $0007
[000c878c]                           dc.w $000f
[000c878e]                           dc.w $0014
[000c8790]                           dc.w $0040
[000c8792]                           dc.w $0000
[000c8794]                           dc.w $00ff
[000c8796]                           dc.w $0101
[000c8798]                           dc.w $0000
[000c879a]                           dc.w $0000
[000c879c]                           dc.w $000c
[000c879e]                           dc.w $0004
_07_FINE_POS:
[000c87a0]                           dc.w $0008
[000c87a2]                           dc.w $ffff
[000c87a4]                           dc.w $ffff
[000c87a6]                           dc.w $0018
[000c87a8]                           dc.w $0008
[000c87aa]                           dc.w $0000
[000c87ac] 000c757c                  dc.l A_BOXED03
[000c87b0]                           dc.w $0000
[000c87b2]                           dc.w $0000
[000c87b4]                           dc.w $0005
[000c87b6]                           dc.w $0001
_08_FINE_POS:
[000c87b8]                           dc.w $0009
[000c87ba]                           dc.w $ffff
[000c87bc]                           dc.w $ffff
[000c87be]                           dc.w $0018
[000c87c0]                           dc.w $0008
[000c87c2]                           dc.w $0000
[000c87c4] 000c755c                  dc.l A_BOXED02
[000c87c8]                           dc.w $0000
[000c87ca]                           dc.w $0001
[000c87cc]                           dc.w $0005
[000c87ce]                           dc.w $0001
_09_FINE_POS:
[000c87d0]                           dc.w $000a
[000c87d2]                           dc.w $ffff
[000c87d4]                           dc.w $ffff
[000c87d6]                           dc.w $0018
[000c87d8]                           dc.w $0008
[000c87da]                           dc.w $0000
[000c87dc] 000c753c                  dc.l A_BOXED01
[000c87e0]                           dc.w $0000
[000c87e2]                           dc.w $0002
[000c87e4]                           dc.w $0005
[000c87e6]                           dc.w $0001
_10_FINE_POS:
[000c87e8]                           dc.w $000b
[000c87ea]                           dc.w $ffff
[000c87ec]                           dc.w $ffff
[000c87ee]                           dc.w $0018
[000c87f0]                           dc.w $0008
[000c87f2]                           dc.w $0000
[000c87f4] 000c753c                  dc.l A_BOXED01
[000c87f8]                           dc.w $0000
[000c87fa]                           dc.w $0003
[000c87fc]                           dc.w $0005
[000c87fe]                           dc.w $0001
_11_FINE_POS:
[000c8800]                           dc.w $000c
[000c8802]                           dc.w $ffff
[000c8804]                           dc.w $ffff
[000c8806]                           dc.w $0018
[000c8808]                           dc.w $0000
[000c880a]                           dc.w $0000
[000c880c] 000c751c                  dc.l A_ARROWS03
[000c8810]                           dc.w $0005
[000c8812]                           dc.w $0000
[000c8814]                           dc.w $0002
[000c8816]                           dc.w $0004
_12_FINE_POS:
[000c8818]                           dc.w $000d
[000c881a]                           dc.w $ffff
[000c881c]                           dc.w $ffff
[000c881e]                           dc.w $0018
[000c8820]                           dc.w $0008
[000c8822]                           dc.w $0000
[000c8824] 000c753c                  dc.l A_BOXED01
[000c8828]                           dc.w $0007
[000c882a]                           dc.w $0000
[000c882c]                           dc.w $0005
[000c882e]                           dc.w $0001
_13_FINE_POS:
[000c8830]                           dc.w $000e
[000c8832]                           dc.w $ffff
[000c8834]                           dc.w $ffff
[000c8836]                           dc.w $0018
[000c8838]                           dc.w $0008
[000c883a]                           dc.w $0000
[000c883c] 000c753c                  dc.l A_BOXED01
[000c8840]                           dc.w $0007
[000c8842]                           dc.w $0001
[000c8844]                           dc.w $0005
[000c8846]                           dc.w $0001
_14_FINE_POS:
[000c8848]                           dc.w $000f
[000c884a]                           dc.w $ffff
[000c884c]                           dc.w $ffff
[000c884e]                           dc.w $0018
[000c8850]                           dc.w $0008
[000c8852]                           dc.w $0000
[000c8854] 000c753c                  dc.l A_BOXED01
[000c8858]                           dc.w $0007
[000c885a]                           dc.w $0002
[000c885c]                           dc.w $0005
[000c885e]                           dc.w $0001
_15_FINE_POS:
[000c8860]                           dc.w $0006
[000c8862]                           dc.w $ffff
[000c8864]                           dc.w $ffff
[000c8866]                           dc.w $0018
[000c8868]                           dc.w $0008
[000c886a]                           dc.w $0000
[000c886c] 000c753c                  dc.l A_BOXED01
[000c8870]                           dc.w $0007
[000c8872]                           dc.w $0003
[000c8874]                           dc.w $0005
[000c8876]                           dc.w $0001
_16_FINE_POS:
[000c8878]                           dc.w $0011
[000c887a]                           dc.w $ffff
[000c887c]                           dc.w $ffff
[000c887e]                           dc.w $001c
[000c8880]                           dc.w $0040
[000c8882]                           dc.w $0000
[000c8884] 000c4cbc                  dc.l TEXT_13
[000c8888]                           dc.w $0006
[000c888a]                           dc.w $0003
[000c888c]                           dc.w $0005
[000c888e]                           dc.w $0001
_17_FINE_POS:
[000c8890]                           dc.w $0012
[000c8892]                           dc.w $ffff
[000c8894]                           dc.w $ffff
[000c8896]                           dc.w $001c
[000c8898]                           dc.w $0040
[000c889a]                           dc.w $0000
[000c889c] 000c4cc9                  dc.l TEXT_14
[000c88a0]                           dc.w $0002
[000c88a2]                           dc.w $0004
[000c88a4]                           dc.w $0009
[000c88a6]                           dc.w $0001
_18_FINE_POS:
[000c88a8]                           dc.w $0013
[000c88aa]                           dc.w $ffff
[000c88ac]                           dc.w $ffff
[000c88ae]                           dc.w $001c
[000c88b0]                           dc.w $0040
[000c88b2]                           dc.w $0000
[000c88b4] 000c4cd3                  dc.l TEXT_15
[000c88b8]                           dc.w $0001
[000c88ba]                           dc.w $0005
[000c88bc]                           dc.w $000a
[000c88be]                           dc.w $0001
_19_FINE_POS:
[000c88c0]                           dc.w $0015
[000c88c2]                           dc.w $ffff
[000c88c4]                           dc.w $ffff
[000c88c6]                           dc.w $0018
[000c88c8]                           dc.w $4007
[000c88ca]                           dc.w $0010
[000c88cc] 000c71dc                  dc.l A_3DBUTTON03
[000c88d0]                           dc.w $0002
[000c88d2]                           dc.w $0007
[000c88d4]                           dc.w $000a
[000c88d6]                           dc.w $0002
_19aFINE_POS:
[000c88d8]                           dc.w $0000
[000c88da]                           dc.w $0000
[000c88dc]                           dc.w $0000
[000c88de]                           dc.w $0000
[000c88e0]                           dc.w $8000
[000c88e2]                           dc.w $884f
[000c88e4]                           dc.w $0000
[000c88e6]                           dc.w $0000
[000c88e8]                           dc.w $0000
[000c88ea]                           dc.w $0000
[000c88ec]                           dc.w $0000
[000c88ee]                           dc.w $0000
_21_FINE_POS:
[000c88f0]                           dc.w $0001
[000c88f2]                           dc.w $ffff
[000c88f4]                           dc.w $ffff
[000c88f6]                           dc.w $0018
[000c88f8]                           dc.w $4005
[000c88fa]                           dc.w $0010
[000c88fc] 000c721c                  dc.l A_3DBUTTON05
[000c8900]                           dc.w $000e
[000c8902]                           dc.w $0007
[000c8904]                           dc.w $000a
[000c8906]                           dc.w $0002
_21aFINE_POS:
[000c8908]                           dc.w $0000
[000c890a]                           dc.w $0000
[000c890c]                           dc.w $0000
[000c890e]                           dc.w $0000
[000c8910]                           dc.w $8020
[000c8912]                           dc.w $8841
[000c8914]                           dc.w $0000
[000c8916]                           dc.w $0000
[000c8918]                           dc.w $0000
[000c891a]                           dc.w $0000
[000c891c]                           dc.w $0000
[000c891e]                           dc.w $0000
INFO_EDIT:
[000c8920]                           dc.w $ffff
[000c8922]                           dc.w $0001
[000c8924]                           dc.w $0001
[000c8926]                           dc.w $0019
[000c8928]                           dc.w $0040
[000c892a]                           dc.w $0000
[000c892c]                           dc.w $00ff
[000c892e]                           dc.w $1141
[000c8930]                           dc.w $0000
[000c8932]                           dc.w $0000
[000c8934]                           dc.w $0028
[000c8936]                           dc.w $0005
_01_INFO_EDIT:
[000c8938]                           dc.w $0000
[000c893a]                           dc.w $0002
[000c893c]                           dc.w $0007
[000c893e]                           dc.w $0018
[000c8940]                           dc.w $0040
[000c8942]                           dc.w $0010
[000c8944] 000c72fc                  dc.l A_3DBUTTON12
[000c8948]                           dc.w $0000
[000c894a]                           dc.w $0000
[000c894c]                           dc.w $0028
[000c894e]                           dc.w $0005
_02_INFO_EDIT:
[000c8950]                           dc.w $0003
[000c8952]                           dc.w $ffff
[000c8954]                           dc.w $ffff
[000c8956]                           dc.w $001c
[000c8958]                           dc.w $0040
[000c895a]                           dc.w $0000
[000c895c] 000c4b3b                  dc.l TEXT_01
[000c8960]                           dc.w $0001
[000c8962]                           dc.w $0003
[000c8964]                           dc.w $0007
[000c8966]                           dc.w $0001
_03_INFO_EDIT:
[000c8968]                           dc.w $0004
[000c896a]                           dc.w $ffff
[000c896c]                           dc.w $ffff
[000c896e]                           dc.w $001c
[000c8970]                           dc.w $0040
[000c8972]                           dc.w $0000
[000c8974] 000c4be9                  dc.l TEXT_071
[000c8978]                           dc.w $0001
[000c897a]                           dc.w $0002
[000c897c]                           dc.w $0007
[000c897e]                           dc.w $0001
_04_INFO_EDIT:
[000c8980]                           dc.w $0005
[000c8982]                           dc.w $ffff
[000c8984]                           dc.w $ffff
[000c8986]                           dc.w $0016
[000c8988]                           dc.w $0040
[000c898a]                           dc.w $0000
[000c898c] 000c7164                  dc.l TEDI_001
[000c8990]                           dc.w $0008
[000c8992]                           dc.w $0001
[000c8994]                           dc.w $001f
[000c8996]                           dc.w $0001
_05_INFO_EDIT:
[000c8998]                           dc.w $0006
[000c899a]                           dc.w $ffff
[000c899c]                           dc.w $ffff
[000c899e]                           dc.w $0016
[000c89a0]                           dc.w $0040
[000c89a2]                           dc.w $0000
[000c89a4] 000c7164                  dc.l TEDI_001
[000c89a8]                           dc.w $0008
[000c89aa]                           dc.w $0002
[000c89ac]                           dc.w $001f
[000c89ae]                           dc.w $0001
_06_INFO_EDIT:
[000c89b0]                           dc.w $0007
[000c89b2]                           dc.w $ffff
[000c89b4]                           dc.w $ffff
[000c89b6]                           dc.w $0016
[000c89b8]                           dc.w $0040
[000c89ba]                           dc.w $0000
[000c89bc] 000c7180                  dc.l TEDI_042
[000c89c0]                           dc.w $0008
[000c89c2]                           dc.w $0003
[000c89c4]                           dc.w $0006
[000c89c6]                           dc.w $0001
_07_INFO_EDIT:
[000c89c8]                           dc.w $0001
[000c89ca]                           dc.w $ffff
[000c89cc]                           dc.w $ffff
[000c89ce]                           dc.w $001c
[000c89d0]                           dc.w $0060
[000c89d2]                           dc.w $0000
[000c89d4] 000c4bcd                  dc.l TEXT_069
[000c89d8]                           dc.w $0002
[000c89da]                           dc.w $0001
[000c89dc]                           dc.w $0006
[000c89de]                           dc.w $0001
MINIOB:
[000c89e0]                           dc.w $ffff
[000c89e2]                           dc.w $ffff
[000c89e4]                           dc.w $ffff
[000c89e6]                           dc.w $0018
[000c89e8]                           dc.w $0060
[000c89ea]                           dc.w $0010
[000c89ec] 000c71bc                  dc.l A_3DBUTTON02
[000c89f0]                           dc.w $0000
[000c89f2]                           dc.w $0000
[000c89f4]                           dc.w $001c
[000c89f6]                           dc.w $000b
TRY_CLICK:
[000c89f8]                           dc.w $ffff
[000c89fa]                           dc.w $0001
[000c89fc]                           dc.w $0001
[000c89fe]                           dc.w $0019
[000c8a00]                           dc.w $0040
[000c8a02]                           dc.w $0000
[000c8a04]                           dc.w $00ff
[000c8a06]                           dc.w $1178
[000c8a08]                           dc.w $0000
[000c8a0a]                           dc.w $0000
[000c8a0c]                           dc.w $0028
[000c8a0e]                           dc.w $0009
_01_TRY_CLICK:
[000c8a10]                           dc.w $0000
[000c8a12]                           dc.w $0002
[000c8a14]                           dc.w $000c
[000c8a16]                           dc.w $0018
[000c8a18]                           dc.w $0040
[000c8a1a]                           dc.w $0010
[000c8a1c] 000c727c                  dc.l A_3DBUTTON08
[000c8a20]                           dc.w $0000
[000c8a22]                           dc.w $0000
[000c8a24]                           dc.w $0028
[000c8a26]                           dc.w $0009
_02_TRY_CLICK:
[000c8a28]                           dc.w $0003
[000c8a2a]                           dc.w $ffff
[000c8a2c]                           dc.w $ffff
[000c8a2e]                           dc.w $001c
[000c8a30]                           dc.w $0040
[000c8a32]                           dc.w $0000
[000c8a34] 000c4bcd                  dc.l TEXT_069
[000c8a38]                           dc.w $0002
[000c8a3a]                           dc.w $0001
[000c8a3c]                           dc.w $0006
[000c8a3e]                           dc.w $0001
_03_TRY_CLICK:
[000c8a40]                           dc.w $0004
[000c8a42]                           dc.w $ffff
[000c8a44]                           dc.w $ffff
[000c8a46]                           dc.w $0016
[000c8a48]                           dc.w $0040
[000c8a4a]                           dc.w $0000
[000c8a4c] 000c7164                  dc.l TEDI_001
[000c8a50]                           dc.w $0008
[000c8a52]                           dc.w $0001
[000c8a54]                           dc.w $001f
[000c8a56]                           dc.w $0001
_04_TRY_CLICK:
[000c8a58]                           dc.w $0005
[000c8a5a]                           dc.w $ffff
[000c8a5c]                           dc.w $ffff
[000c8a5e]                           dc.w $001c
[000c8a60]                           dc.w $0040
[000c8a62]                           dc.w $0000
[000c8a64] 000c4be9                  dc.l TEXT_071
[000c8a68]                           dc.w $0001
[000c8a6a]                           dc.w $0002
[000c8a6c]                           dc.w $0007
[000c8a6e]                           dc.w $0001
_05_TRY_CLICK:
[000c8a70]                           dc.w $0006
[000c8a72]                           dc.w $ffff
[000c8a74]                           dc.w $ffff
[000c8a76]                           dc.w $0016
[000c8a78]                           dc.w $0040
[000c8a7a]                           dc.w $0000
[000c8a7c] 000c7164                  dc.l TEDI_001
[000c8a80]                           dc.w $0008
[000c8a82]                           dc.w $0002
[000c8a84]                           dc.w $001f
[000c8a86]                           dc.w $0001
_06_TRY_CLICK:
[000c8a88]                           dc.w $0007
[000c8a8a]                           dc.w $ffff
[000c8a8c]                           dc.w $ffff
[000c8a8e]                           dc.w $001c
[000c8a90]                           dc.w $0040
[000c8a92]                           dc.w $0000
[000c8a94] 000c4d7d                  dc.l TEXT_239
[000c8a98]                           dc.w $0001
[000c8a9a]                           dc.w $0003
[000c8a9c]                           dc.w $0007
[000c8a9e]                           dc.w $0001
_07_TRY_CLICK:
[000c8aa0]                           dc.w $0008
[000c8aa2]                           dc.w $ffff
[000c8aa4]                           dc.w $ffff
[000c8aa6]                           dc.w $0016
[000c8aa8]                           dc.w $0040
[000c8aaa]                           dc.w $0000
[000c8aac] 000c7164                  dc.l TEDI_001
[000c8ab0]                           dc.w $0008
[000c8ab2]                           dc.w $0003
[000c8ab4]                           dc.w $001f
[000c8ab6]                           dc.w $0001
_08_TRY_CLICK:
[000c8ab8]                           dc.w $0009
[000c8aba]                           dc.w $ffff
[000c8abc]                           dc.w $ffff
[000c8abe]                           dc.w $001c
[000c8ac0]                           dc.w $0040
[000c8ac2]                           dc.w $0000
[000c8ac4] 000c4d8f                  dc.l TEXT_245
[000c8ac8]                           dc.w $0002
[000c8aca]                           dc.w $0004
[000c8acc]                           dc.w $0006
[000c8ace]                           dc.w $0001
_09_TRY_CLICK:
[000c8ad0]                           dc.w $000a
[000c8ad2]                           dc.w $ffff
[000c8ad4]                           dc.w $ffff
[000c8ad6]                           dc.w $0016
[000c8ad8]                           dc.w $0040
[000c8ada]                           dc.w $0000
[000c8adc] 000c7164                  dc.l TEDI_001
[000c8ae0]                           dc.w $0008
[000c8ae2]                           dc.w $0004
[000c8ae4]                           dc.w $001f
[000c8ae6]                           dc.w $0001
_10_TRY_CLICK:
[000c8ae8]                           dc.w $000c
[000c8aea]                           dc.w $ffff
[000c8aec]                           dc.w $ffff
[000c8aee]                           dc.w $0018
[000c8af0]                           dc.w $4007
[000c8af2]                           dc.w $0010
[000c8af4] 000c71dc                  dc.l A_3DBUTTON03
[000c8af8]                           dc.w $0007
[000c8afa]                           dc.w $0006
[000c8afc]                           dc.w $000c
[000c8afe]                           dc.w $0002
_10aTRY_CLICK:
[000c8b00]                           dc.w $0000
[000c8b02]                           dc.w $0000
[000c8b04]                           dc.w $0000
[000c8b06]                           dc.w $0000
[000c8b08]                           dc.w $8000
[000c8b0a]                           dc.w $884f
[000c8b0c]                           dc.w $0000
[000c8b0e]                           dc.w $0000
[000c8b10]                           dc.w $0000
[000c8b12]                           dc.w $0000
[000c8b14]                           dc.w $0000
[000c8b16]                           dc.w $0000
_12_TRY_CLICK:
[000c8b18]                           dc.w $0001
[000c8b1a]                           dc.w $ffff
[000c8b1c]                           dc.w $ffff
[000c8b1e]                           dc.w $0018
[000c8b20]                           dc.w $4005
[000c8b22]                           dc.w $0010
[000c8b24] 000c721c                  dc.l A_3DBUTTON05
[000c8b28]                           dc.w $0015
[000c8b2a]                           dc.w $0006
[000c8b2c]                           dc.w $000c
[000c8b2e]                           dc.w $0002
_12aTRY_CLICK:
[000c8b30]                           dc.w $0000
[000c8b32]                           dc.w $0000
[000c8b34]                           dc.w $0000
[000c8b36]                           dc.w $0000
[000c8b38]                           dc.w $8020
[000c8b3a]                           dc.w $8841
[000c8b3c]                           dc.w $0000
[000c8b3e]                           dc.w $0000
[000c8b40]                           dc.w $0000
[000c8b42]                           dc.w $0000
[000c8b44]                           dc.w $0000
[000c8b46]                           dc.w $0000
TRY_DRAG:
[000c8b48]                           dc.w $ffff
[000c8b4a]                           dc.w $0001
[000c8b4c]                           dc.w $0001
[000c8b4e]                           dc.w $0019
[000c8b50]                           dc.w $0040
[000c8b52]                           dc.w $0000
[000c8b54]                           dc.w $00ff
[000c8b56]                           dc.w $1178
[000c8b58]                           dc.w $0000
[000c8b5a]                           dc.w $0000
[000c8b5c]                           dc.w $0028
[000c8b5e]                           dc.w $0009
_01_TRY_DRAG:
[000c8b60]                           dc.w $0000
[000c8b62]                           dc.w $0002
[000c8b64]                           dc.w $000c
[000c8b66]                           dc.w $0018
[000c8b68]                           dc.w $0040
[000c8b6a]                           dc.w $0010
[000c8b6c] 000c727c                  dc.l A_3DBUTTON08
[000c8b70]                           dc.w $0000
[000c8b72]                           dc.w $0000
[000c8b74]                           dc.w $0028
[000c8b76]                           dc.w $0009
_02_TRY_DRAG:
[000c8b78]                           dc.w $0003
[000c8b7a]                           dc.w $ffff
[000c8b7c]                           dc.w $ffff
[000c8b7e]                           dc.w $001c
[000c8b80]                           dc.w $0040
[000c8b82]                           dc.w $0000
[000c8b84] 000c4bcd                  dc.l TEXT_069
[000c8b88]                           dc.w $0002
[000c8b8a]                           dc.w $0001
[000c8b8c]                           dc.w $0006
[000c8b8e]                           dc.w $0001
_03_TRY_DRAG:
[000c8b90]                           dc.w $0004
[000c8b92]                           dc.w $ffff
[000c8b94]                           dc.w $ffff
[000c8b96]                           dc.w $0016
[000c8b98]                           dc.w $0040
[000c8b9a]                           dc.w $0000
[000c8b9c] 000c7164                  dc.l TEDI_001
[000c8ba0]                           dc.w $0008
[000c8ba2]                           dc.w $0001
[000c8ba4]                           dc.w $001f
[000c8ba6]                           dc.w $0001
_04_TRY_DRAG:
[000c8ba8]                           dc.w $0005
[000c8baa]                           dc.w $ffff
[000c8bac]                           dc.w $ffff
[000c8bae]                           dc.w $001c
[000c8bb0]                           dc.w $0040
[000c8bb2]                           dc.w $0000
[000c8bb4] 000c4be9                  dc.l TEXT_071
[000c8bb8]                           dc.w $0001
[000c8bba]                           dc.w $0002
[000c8bbc]                           dc.w $0007
[000c8bbe]                           dc.w $0001
_05_TRY_DRAG:
[000c8bc0]                           dc.w $0006
[000c8bc2]                           dc.w $ffff
[000c8bc4]                           dc.w $ffff
[000c8bc6]                           dc.w $0016
[000c8bc8]                           dc.w $0040
[000c8bca]                           dc.w $0000
[000c8bcc] 000c7164                  dc.l TEDI_001
[000c8bd0]                           dc.w $0008
[000c8bd2]                           dc.w $0002
[000c8bd4]                           dc.w $001f
[000c8bd6]                           dc.w $0001
_06_TRY_DRAG:
[000c8bd8]                           dc.w $0007
[000c8bda]                           dc.w $ffff
[000c8bdc]                           dc.w $ffff
[000c8bde]                           dc.w $001c
[000c8be0]                           dc.w $0040
[000c8be2]                           dc.w $0000
[000c8be4] 000c4d7d                  dc.l TEXT_239
[000c8be8]                           dc.w $0001
[000c8bea]                           dc.w $0003
[000c8bec]                           dc.w $0007
[000c8bee]                           dc.w $0001
_07_TRY_DRAG:
[000c8bf0]                           dc.w $0008
[000c8bf2]                           dc.w $ffff
[000c8bf4]                           dc.w $ffff
[000c8bf6]                           dc.w $0016
[000c8bf8]                           dc.w $0040
[000c8bfa]                           dc.w $0000
[000c8bfc] 000c7164                  dc.l TEDI_001
[000c8c00]                           dc.w $0008
[000c8c02]                           dc.w $0003
[000c8c04]                           dc.w $001f
[000c8c06]                           dc.w $0001
_08_TRY_DRAG:
[000c8c08]                           dc.w $0009
[000c8c0a]                           dc.w $ffff
[000c8c0c]                           dc.w $ffff
[000c8c0e]                           dc.w $001c
[000c8c10]                           dc.w $0040
[000c8c12]                           dc.w $0000
[000c8c14] 000c4d8f                  dc.l TEXT_245
[000c8c18]                           dc.w $0002
[000c8c1a]                           dc.w $0004
[000c8c1c]                           dc.w $0006
[000c8c1e]                           dc.w $0001
_09_TRY_DRAG:
[000c8c20]                           dc.w $000a
[000c8c22]                           dc.w $ffff
[000c8c24]                           dc.w $ffff
[000c8c26]                           dc.w $0016
[000c8c28]                           dc.w $0040
[000c8c2a]                           dc.w $0000
[000c8c2c] 000c7164                  dc.l TEDI_001
[000c8c30]                           dc.w $0008
[000c8c32]                           dc.w $0004
[000c8c34]                           dc.w $001f
[000c8c36]                           dc.w $0001
_10_TRY_DRAG:
[000c8c38]                           dc.w $000c
[000c8c3a]                           dc.w $ffff
[000c8c3c]                           dc.w $ffff
[000c8c3e]                           dc.w $0018
[000c8c40]                           dc.w $4007
[000c8c42]                           dc.w $0010
[000c8c44] 000c71dc                  dc.l A_3DBUTTON03
[000c8c48]                           dc.w $0007
[000c8c4a]                           dc.w $0006
[000c8c4c]                           dc.w $000c
[000c8c4e]                           dc.w $0002
_10aTRY_DRAG:
[000c8c50]                           dc.w $0000
[000c8c52]                           dc.w $0000
[000c8c54]                           dc.w $0000
[000c8c56]                           dc.w $0000
[000c8c58]                           dc.w $8000
[000c8c5a]                           dc.w $884f
[000c8c5c]                           dc.w $0000
[000c8c5e]                           dc.w $0000
[000c8c60]                           dc.w $0000
[000c8c62]                           dc.w $0000
[000c8c64]                           dc.w $0000
[000c8c66]                           dc.w $0000
_12_TRY_DRAG:
[000c8c68]                           dc.w $0001
[000c8c6a]                           dc.w $ffff
[000c8c6c]                           dc.w $ffff
[000c8c6e]                           dc.w $0018
[000c8c70]                           dc.w $4005
[000c8c72]                           dc.w $0010
[000c8c74] 000c721c                  dc.l A_3DBUTTON05
[000c8c78]                           dc.w $0015
[000c8c7a]                           dc.w $0006
[000c8c7c]                           dc.w $000c
[000c8c7e]                           dc.w $0002
_12aTRY_DRAG:
[000c8c80]                           dc.w $0000
[000c8c82]                           dc.w $0000
[000c8c84]                           dc.w $0000
[000c8c86]                           dc.w $0000
[000c8c88]                           dc.w $8020
[000c8c8a]                           dc.w $8841
[000c8c8c]                           dc.w $0000
[000c8c8e]                           dc.w $0000
[000c8c90]                           dc.w $0000
[000c8c92]                           dc.w $0000
[000c8c94]                           dc.w $0000
[000c8c96]                           dc.w $0000
WI_INFO:
[000c8c98]                           dc.w $0000
[000c8c9a]                           dc.w $0000
[000c8c9c] 00059dd0                  dc.l Awi_service
[000c8ca0] 0002ba08                  dc.l make_a_window
[000c8ca4] 00057428                  dc.l Awi_open
[000c8ca8] 00055e94                  dc.l Awi_init
[000c8cac] 000c8920                  dc.l INFO_EDIT
[000c8cb0]                           dc.w $0000
[000c8cb2]                           dc.w $0000
[000c8cb4]                           dc.w $0000
[000c8cb6]                           dc.w $0000
[000c8cb8]                           dc.w $ffff
[000c8cba]                           dc.w $000b
[000c8cbc]                           dc.w $0000
[000c8cbe]                           dc.w $0000
[000c8cc0]                           dc.w $0078
[000c8cc2]                           dc.w $0032
[000c8cc4]                           dc.w $0000
[000c8cc6]                           dc.w $0000
[000c8cc8]                           dc.w $0000
[000c8cca]                           dc.w $0000
[000c8ccc]                           dc.w $0000
[000c8cce]                           dc.w $0000
[000c8cd0]                           dc.w $0000
[000c8cd2]                           dc.w $0000
[000c8cd4]                           dc.w $ffff
[000c8cd6]                           dc.w $ffff
[000c8cd8]                           dc.w $ffff
[000c8cda]                           dc.w $ffff
[000c8cdc]                           dc.w $0000
[000c8cde]                           dc.w $0000
[000c8ce0]                           dc.w $fcf8
[000c8ce2] 000c4d64                  dc.l TEXT_22
[000c8ce6] 000c4b17                  dc.l TEXT_002
[000c8cea]                           dc.w $2710
[000c8cec]                           dc.w $0000
[000c8cee]                           dc.w $0000
[000c8cf0]                           dc.w $ffff
[000c8cf2]                           dc.w $0000
[000c8cf4]                           dc.w $0000
[000c8cf6]                           dc.w $0000
[000c8cf8]                           dc.w $0000
[000c8cfa] 0006b744                  dc.l Awi_keys
[000c8cfe] 00051852                  dc.l Awi_obchange
[000c8d02] 00051c46                  dc.l Awi_redraw
[000c8d06] 000587a4                  dc.l Awi_topped
[000c8d0a] 00058362                  dc.l Awi_closed
[000c8d0e] 000587ec                  dc.l Awi_fulled
[000c8d12] 0005217c                  dc.l Awi_arrowed
[000c8d16] 000524b4                  dc.l Awi_hslid
[000c8d1a] 0005255e                  dc.l Awi_vslid
[000c8d1e] 00058bb0                  dc.l Awi_sized
[000c8d22] 00058d50                  dc.l Awi_moved
[000c8d26] 0005998a                  dc.l Awi_iconify
[000c8d2a] 00059c6c                  dc.l Awi_uniconify
[000c8d2e] 0005b5b6                  dc.l Awi_gemscript
[000c8d32]                           dc.w $0000
[000c8d34]                           dc.w $0000
[000c8d36]                           dc.w $0000
[000c8d38]                           dc.w $0000
WI_MENU:
[000c8d3a]                           dc.w $0000
[000c8d3c]                           dc.w $0000
[000c8d3e] 00025e98                  dc.l me_service
[000c8d42] 00025916                  dc.l me_make
[000c8d46] 0002ba88                  dc.l open_me
[000c8d4a] 0002569a                  dc.l me_init
[000c8d4e]                           dc.w $0000
[000c8d50]                           dc.w $0000
[000c8d52]                           dc.w $0000
[000c8d54]                           dc.w $0000
[000c8d56]                           dc.w $0000
[000c8d58]                           dc.w $0000
[000c8d5a]                           dc.w $ffff
[000c8d5c]                           dc.w $4fff
[000c8d5e]                           dc.w $0000
[000c8d60]                           dc.w $0000
[000c8d62]                           dc.w $0023
[000c8d64]                           dc.w $000e
[000c8d66]                           dc.w $0000
[000c8d68]                           dc.w $0000
[000c8d6a]                           dc.w $0000
[000c8d6c]                           dc.w $0000
[000c8d6e]                           dc.w $0000
[000c8d70]                           dc.w $0000
[000c8d72]                           dc.w $0000
[000c8d74]                           dc.w $0000
[000c8d76]                           dc.w $ffff
[000c8d78]                           dc.w $ffff
[000c8d7a]                           dc.w $ffff
[000c8d7c]                           dc.w $ffff
[000c8d7e]                           dc.w $0000
[000c8d80]                           dc.w $0000
[000c8d82]                           dc.w $f8f8
[000c8d84] 000c4b43                  dc.l TEXT_010
[000c8d88] 000c4b17                  dc.l TEXT_002
[000c8d8c]                           dc.w $2710
[000c8d8e]                           dc.w $0100
[000c8d90]                           dc.w $0000
[000c8d92]                           dc.w $ffff
[000c8d94] 000c770e                  dc.l IC_MENU
[000c8d98] 000c7c18                  dc.l MEN_EDIT
[000c8d9c] 0002bb16                  dc.l key_me
[000c8da0] 00051852                  dc.l Awi_obchange
[000c8da4] 00051c46                  dc.l Awi_redraw
[000c8da8] 0002bad4                  dc.l top_me
[000c8dac] 0002ba54                  dc.l close_me
[000c8db0] 000587ec                  dc.l Awi_fulled
[000c8db4] 0005217c                  dc.l Awi_arrowed
[000c8db8] 000524b4                  dc.l Awi_hslid
[000c8dbc] 0005255e                  dc.l Awi_vslid
[000c8dc0] 00058bb0                  dc.l Awi_sized
[000c8dc4] 0002bb00                  dc.l move_me
[000c8dc8] 0005998a                  dc.l Awi_iconify
[000c8dcc] 00059c6c                  dc.l Awi_uniconify
[000c8dd0] 0005b5b6                  dc.l Awi_gemscript
[000c8dd4] 000c4ada                  dc.l STGUIDE_02
[000c8dd8]                           dc.w $0000
[000c8dda]                           dc.w $0000
WI_OBJECT:
[000c8ddc]                           dc.w $0000
[000c8dde]                           dc.w $0000
[000c8de0] 0002c7ae                  dc.l ed_service
[000c8de4] 000251ba                  dc.l ob_make
[000c8de8] 0002ba88                  dc.l open_me
[000c8dec] 0002c438                  dc.l ed_init
[000c8df0]                           dc.w $0000
[000c8df2]                           dc.w $0000
[000c8df4]                           dc.w $0000
[000c8df6]                           dc.w $0000
[000c8df8]                           dc.w $0000
[000c8dfa]                           dc.w $0000
[000c8dfc]                           dc.w $ffff
[000c8dfe]                           dc.w $4fff
[000c8e00]                           dc.w $0000
[000c8e02]                           dc.w $0000
[000c8e04]                           dc.w $0063
[000c8e06]                           dc.w $0063
[000c8e08]                           dc.w $0000
[000c8e0a]                           dc.w $0000
[000c8e0c]                           dc.w $0000
[000c8e0e]                           dc.w $0000
[000c8e10]                           dc.w $0000
[000c8e12]                           dc.w $0000
[000c8e14]                           dc.w $0000
[000c8e16]                           dc.w $0000
[000c8e18]                           dc.w $ffff
[000c8e1a]                           dc.w $ffff
[000c8e1c]                           dc.w $ffff
[000c8e1e]                           dc.w $ffff
[000c8e20]                           dc.w $0000
[000c8e22]                           dc.w $0000
[000c8e24]                           dc.w $f8f8
[000c8e26] 000c4b51                  dc.l TEXT_011
[000c8e2a] 000c4b17                  dc.l TEXT_002
[000c8e2e]                           dc.w $2710
[000c8e30]                           dc.w $0100
[000c8e32]                           dc.w $0000
[000c8e34]                           dc.w $ffff
[000c8e36] 000c78be                  dc.l IC_OBJECT
[000c8e3a] 000c7c18                  dc.l MEN_EDIT
[000c8e3e] 0002bb16                  dc.l key_me
[000c8e42] 00051852                  dc.l Awi_obchange
[000c8e46] 00051c46                  dc.l Awi_redraw
[000c8e4a] 0002bad4                  dc.l top_me
[000c8e4e] 0002ba54                  dc.l close_me
[000c8e52] 000587ec                  dc.l Awi_fulled
[000c8e56] 0005217c                  dc.l Awi_arrowed
[000c8e5a] 000524b4                  dc.l Awi_hslid
[000c8e5e] 0005255e                  dc.l Awi_vslid
[000c8e62] 00058bb0                  dc.l Awi_sized
[000c8e66] 0002bb00                  dc.l move_me
[000c8e6a] 0005998a                  dc.l Awi_iconify
[000c8e6e] 00059c6c                  dc.l Awi_uniconify
[000c8e72] 0005b5b6                  dc.l Awi_gemscript
[000c8e76] 000c4ac4                  dc.l STGUIDE_01
[000c8e7a]                           dc.w $0000
[000c8e7c]                           dc.w $0000
WI_POPUP:
[000c8e7e]                           dc.w $0000
[000c8e80]                           dc.w $0000
[000c8e82] 0002c7ae                  dc.l ed_service
[000c8e86] 0002652c                  dc.l pu_make
[000c8e8a] 0002ba88                  dc.l open_me
[000c8e8e] 000264ac                  dc.l pu_init
[000c8e92]                           dc.w $0000
[000c8e94]                           dc.w $0000
[000c8e96]                           dc.w $0000
[000c8e98]                           dc.w $0000
[000c8e9a]                           dc.w $0000
[000c8e9c]                           dc.w $0000
[000c8e9e]                           dc.w $ffff
[000c8ea0]                           dc.w $4fff
[000c8ea2]                           dc.w $0000
[000c8ea4]                           dc.w $0000
[000c8ea6]                           dc.w $0020
[000c8ea8]                           dc.w $0010
[000c8eaa]                           dc.w $0000
[000c8eac]                           dc.w $0000
[000c8eae]                           dc.w $0000
[000c8eb0]                           dc.w $0000
[000c8eb2]                           dc.w $0000
[000c8eb4]                           dc.w $0000
[000c8eb6]                           dc.w $0000
[000c8eb8]                           dc.w $0000
[000c8eba]                           dc.w $ffff
[000c8ebc]                           dc.w $ffff
[000c8ebe]                           dc.w $ffff
[000c8ec0]                           dc.w $ffff
[000c8ec2]                           dc.w $0000
[000c8ec4]                           dc.w $0000
[000c8ec6]                           dc.w $f8f8
[000c8ec8] 000c4b65                  dc.l TEXT_012
[000c8ecc] 000c4b17                  dc.l TEXT_002
[000c8ed0]                           dc.w $2710
[000c8ed2]                           dc.w $0100
[000c8ed4]                           dc.w $0000
[000c8ed6]                           dc.w $ffff
[000c8ed8] 000c7a56                  dc.l IC_POPUP
[000c8edc] 000c7c18                  dc.l MEN_EDIT
[000c8ee0] 0002bb16                  dc.l key_me
[000c8ee4] 00051852                  dc.l Awi_obchange
[000c8ee8] 00051c46                  dc.l Awi_redraw
[000c8eec] 0002bad4                  dc.l top_me
[000c8ef0] 0002ba54                  dc.l close_me
[000c8ef4] 000587ec                  dc.l Awi_fulled
[000c8ef8] 0005217c                  dc.l Awi_arrowed
[000c8efc] 000524b4                  dc.l Awi_hslid
[000c8f00] 0005255e                  dc.l Awi_vslid
[000c8f04] 00058bb0                  dc.l Awi_sized
[000c8f08] 0002bb00                  dc.l move_me
[000c8f0c] 0005998a                  dc.l Awi_iconify
[000c8f10] 00059c6c                  dc.l Awi_uniconify
[000c8f14] 0005b5b6                  dc.l Awi_gemscript
[000c8f18] 000c4aea                  dc.l STGUIDE_03
[000c8f1c]                           dc.w $0000
[000c8f1e]                           dc.w $0000
WI_POSITION:
[000c8f20]                           dc.w $0000
[000c8f22]                           dc.w $0000
[000c8f24] 00059dd0                  dc.l Awi_service
[000c8f28] 00056c16                  dc.l Awi_selfcreate
[000c8f2c] 00057428                  dc.l Awi_open
[000c8f30] 00055e94                  dc.l Awi_init
[000c8f34] 000c86f8                  dc.l FINE_POS
[000c8f38]                           dc.w $0000
[000c8f3a]                           dc.w $0000
[000c8f3c]                           dc.w $0000
[000c8f3e]                           dc.w $0000
[000c8f40]                           dc.w $ffff
[000c8f42]                           dc.w $000b
[000c8f44]                           dc.w $0000
[000c8f46]                           dc.w $0000
[000c8f48]                           dc.w $0078
[000c8f4a]                           dc.w $0032
[000c8f4c]                           dc.w $0000
[000c8f4e]                           dc.w $0000
[000c8f50]                           dc.w $0000
[000c8f52]                           dc.w $0000
[000c8f54]                           dc.w $0000
[000c8f56]                           dc.w $0000
[000c8f58]                           dc.w $0000
[000c8f5a]                           dc.w $0000
[000c8f5c]                           dc.w $ffff
[000c8f5e]                           dc.w $ffff
[000c8f60]                           dc.w $ffff
[000c8f62]                           dc.w $ffff
[000c8f64]                           dc.w $0000
[000c8f66]                           dc.w $0000
[000c8f68]                           dc.w $fcf8
[000c8f6a] 000c4d72                  dc.l TEXT_23
[000c8f6e] 000c4b17                  dc.l TEXT_002
[000c8f72]                           dc.w $2710
[000c8f74]                           dc.w $0000
[000c8f76]                           dc.w $0000
[000c8f78]                           dc.w $ffff
[000c8f7a]                           dc.w $0000
[000c8f7c]                           dc.w $0000
[000c8f7e]                           dc.w $0000
[000c8f80]                           dc.w $0000
[000c8f82] 0006b744                  dc.l Awi_keys
[000c8f86] 00051852                  dc.l Awi_obchange
[000c8f8a] 00051c46                  dc.l Awi_redraw
[000c8f8e] 000587a4                  dc.l Awi_topped
[000c8f92] 00058362                  dc.l Awi_closed
[000c8f96] 000587ec                  dc.l Awi_fulled
[000c8f9a] 0005217c                  dc.l Awi_arrowed
[000c8f9e] 000524b4                  dc.l Awi_hslid
[000c8fa2] 0005255e                  dc.l Awi_vslid
[000c8fa6] 00058bb0                  dc.l Awi_sized
[000c8faa] 00058d50                  dc.l Awi_moved
[000c8fae] 0005998a                  dc.l Awi_iconify
[000c8fb2] 00059c6c                  dc.l Awi_uniconify
[000c8fb6] 0005b5b6                  dc.l Awi_gemscript
[000c8fba] 000c4afb                  dc.l STGUIDE_04
[000c8fbe]                           dc.w $0000
[000c8fc0]                           dc.w $0000
WI_TRYCLICK:
[000c8fc2]                           dc.w $0000
[000c8fc4]                           dc.w $0000
[000c8fc6] 00059dd0                  dc.l Awi_service
[000c8fca] 0002ba08                  dc.l make_a_window
[000c8fce] 00057428                  dc.l Awi_open
[000c8fd2] 00055e94                  dc.l Awi_init
[000c8fd6] 000c89f8                  dc.l TRY_CLICK
[000c8fda]                           dc.w $0000
[000c8fdc]                           dc.w $0000
[000c8fde]                           dc.w $0000
[000c8fe0]                           dc.w $0000
[000c8fe2]                           dc.w $ffff
[000c8fe4]                           dc.w $000b
[000c8fe6]                           dc.w $0000
[000c8fe8]                           dc.w $0000
[000c8fea]                           dc.w $0078
[000c8fec]                           dc.w $0032
[000c8fee]                           dc.w $0000
[000c8ff0]                           dc.w $0000
[000c8ff2]                           dc.w $0000
[000c8ff4]                           dc.w $0000
[000c8ff6]                           dc.w $0000
[000c8ff8]                           dc.w $0000
[000c8ffa]                           dc.w $0000
[000c8ffc]                           dc.w $0000
[000c8ffe]                           dc.w $ffff
[000c9000]                           dc.w $ffff
[000c9002]                           dc.w $ffff
[000c9004]                           dc.w $ffff
[000c9006]                           dc.w $0000
[000c9008]                           dc.w $0000
[000c900a]                           dc.w $fcf8
[000c900c] 000c4cde                  dc.l TEXT_16
[000c9010] 000c4b17                  dc.l TEXT_002
[000c9014]                           dc.w $2710
[000c9016]                           dc.w $0000
[000c9018]                           dc.w $0000
[000c901a]                           dc.w $ffff
[000c901c]                           dc.w $0000
[000c901e]                           dc.w $0000
[000c9020]                           dc.w $0000
[000c9022]                           dc.w $0000
[000c9024] 0006b744                  dc.l Awi_keys
[000c9028] 00051852                  dc.l Awi_obchange
[000c902c] 00051c46                  dc.l Awi_redraw
[000c9030] 000587a4                  dc.l Awi_topped
[000c9034] 00058362                  dc.l Awi_closed
[000c9038] 000587ec                  dc.l Awi_fulled
[000c903c] 0005217c                  dc.l Awi_arrowed
[000c9040] 000524b4                  dc.l Awi_hslid
[000c9044] 0005255e                  dc.l Awi_vslid
[000c9048] 00058bb0                  dc.l Awi_sized
[000c904c] 00058d50                  dc.l Awi_moved
[000c9050] 0005998a                  dc.l Awi_iconify
[000c9054] 00059c6c                  dc.l Awi_uniconify
[000c9058] 0005b5b6                  dc.l Awi_gemscript
[000c905c]                           dc.w $0000
[000c905e]                           dc.w $0000
[000c9060]                           dc.w $0000
[000c9062]                           dc.w $0000
WI_TRYDRAG:
[000c9064]                           dc.w $0000
[000c9066]                           dc.w $0000
[000c9068] 00059dd0                  dc.l Awi_service
[000c906c] 0002ba08                  dc.l make_a_window
[000c9070] 00057428                  dc.l Awi_open
[000c9074] 00055e94                  dc.l Awi_init
[000c9078] 000c8b48                  dc.l TRY_DRAG
[000c907c]                           dc.w $0000
[000c907e]                           dc.w $0000
[000c9080]                           dc.w $0000
[000c9082]                           dc.w $0000
[000c9084]                           dc.w $ffff
[000c9086]                           dc.w $000b
[000c9088]                           dc.w $0000
[000c908a]                           dc.w $0000
[000c908c]                           dc.w $0078
[000c908e]                           dc.w $0032
[000c9090]                           dc.w $0000
[000c9092]                           dc.w $0000
[000c9094]                           dc.w $0000
[000c9096]                           dc.w $0000
[000c9098]                           dc.w $0000
[000c909a]                           dc.w $0000
[000c909c]                           dc.w $0000
[000c909e]                           dc.w $0000
[000c90a0]                           dc.w $ffff
[000c90a2]                           dc.w $ffff
[000c90a4]                           dc.w $ffff
[000c90a6]                           dc.w $ffff
[000c90a8]                           dc.w $0000
[000c90aa]                           dc.w $0000
[000c90ac]                           dc.w $fcf8
[000c90ae] 000c4d96                  dc.l TEXT_25
[000c90b2] 000c4b17                  dc.l TEXT_002
[000c90b6]                           dc.w $2710
[000c90b8]                           dc.w $0000
[000c90ba]                           dc.w $0000
[000c90bc]                           dc.w $ffff
[000c90be]                           dc.w $0000
[000c90c0]                           dc.w $0000
[000c90c2]                           dc.w $0000
[000c90c4]                           dc.w $0000
[000c90c6] 0006b744                  dc.l Awi_keys
[000c90ca] 00051852                  dc.l Awi_obchange
[000c90ce] 00051c46                  dc.l Awi_redraw
[000c90d2] 000587a4                  dc.l Awi_topped
[000c90d6] 00058362                  dc.l Awi_closed
[000c90da] 000587ec                  dc.l Awi_fulled
[000c90de] 0005217c                  dc.l Awi_arrowed
[000c90e2] 000524b4                  dc.l Awi_hslid
[000c90e6] 0005255e                  dc.l Awi_vslid
[000c90ea] 00058bb0                  dc.l Awi_sized
[000c90ee] 00058d50                  dc.l Awi_moved
[000c90f2] 0005998a                  dc.l Awi_iconify
[000c90f6] 00059c6c                  dc.l Awi_uniconify
[000c90fa] 0005b5b6                  dc.l Awi_gemscript
[000c90fe]                           dc.w $0000
[000c9100]                           dc.w $0000
[000c9102]                           dc.w $0000
[000c9104]                           dc.w $0000
visible_editors:
[000c9106]                           dc.w $0000
control:
[000c9108] 0002ccba                  dc.l user_control
[000c910c]                           dc.w $0000
[000c910e]                           dc.w $0000
[000c9110]                           dc.w $0000
[000c9112]                           dc.w $0000
[000c9114]                           dc.w $0000
[000c9116]                           dc.w $0000
[000c9118]                           dc.w $0000
[000c911a]                           dc.w $0000
[000c911c]                           dc.w $0000
[000c911e]                           dc.w $0000
[000c9120]                           dc.w $0000
[000c9122]                           dc.w $0000
[000c9124]                           dc.w $0000
[000c9126]                           dc.w $0000
entry:
[000c9128]                           dc.w $ffff
[000c912a]                           dc.w $ffff
[000c912c]                           dc.w $ffff
[000c912e]                           dc.w $0000
[000c9130]                           dc.w $0000
[000c9132]                           dc.w $0000
[000c9134]                           dc.w $0000
[000c9136]                           dc.w $0000
[000c9138]                           dc.w $0000
[000c913a]                           dc.w $0000
[000c913c]                           dc.w $0000
[000c913e]                           dc.w $0000
ent01:
[000c9140]                           dc.w $ffff
[000c9142]                           dc.w $ffff
[000c9144]                           dc.w $ffff
[000c9146]                           dc.w $0018
[000c9148]                           dc.w $0040
[000c914a]                           dc.w $2030
[000c914c] 000c9108                  dc.l control
[000c9150]                           dc.w $0000
[000c9152]                           dc.w $0000
[000c9154]                           dc.w $0000
[000c9156]                           dc.w $0000
ent02:
[000c9158] 0002deb8                  dc.l ed_edit
[000c915c] 0002db2a                  dc.l ed_dragged
[000c9160]                           dc.w $8000
[000c9162]                           dc.w $0000
[000c9164]                           dc.w $0000
[000c9166]                           dc.w $0000
[000c9168]                           dc.w $0000
[000c916a]                           dc.w $0000
[000c916c]                           dc.w $0000
[000c916e]                           dc.w $2af8
dither:
[000c9170] 00064a22                  dc.l A_3Dbutton
[000c9174]                           dc.w $0000
[000c9176]                           dc.w $0078
[000c9178]                           dc.w $0000
[000c917a]                           dc.w $0000
[000c917c]                           dc.w $0000
[000c917e]                           dc.w $0000
[000c9180]                           dc.w $0000
[000c9182]                           dc.w $0000
[000c9184]                           dc.w $0000
[000c9186]                           dc.w $0000
[000c9188]                           dc.w $0000
[000c918a]                           dc.w $0000
[000c918c]                           dc.w $0000
[000c918e]                           dc.w $0000
deskob:
[000c9190]                           dc.w $ffff
[000c9192]                           dc.w $0001
[000c9194]                           dc.w $0002
[000c9196]                           dc.w $0018
[000c9198]                           dc.w $0040
[000c919a]                           dc.w $2000
[000c919c] 000c9170                  dc.l dither
[000c91a0]                           dc.w $0000
[000c91a2]                           dc.w $0000
[000c91a4]                           dc.w $0004
[000c91a6]                           dc.w $0002
[000c91a8]                           dc.b '%4ld',0
[000c91ad]                           dc.b '- NULL -',0
[000c91b6]                           dc.b '0x%lx',0
[000c91bc]                           dc.b 'INDEX NAME',0
[000c91c7]                           dc.b $00
[000c91c8]                           dc.b '%d*%d',0
[000c91ce]                           dc.b '0x%lxL',0
[000c91d5]                           dc.b $25
[000c91d6]                           dc.w $6400
