init_ftext:
[0002aca6] 2f0a                      move.l     a2,-(a7)
[0002aca8] 2f0b                      move.l     a3,-(a7)
[0002acaa] 2448                      movea.l    a0,a2
[0002acac] 43f9 000c 41ee            lea.l      data,a1
[0002acb2] 303c 2329                 move.w     #$2329,d0
[0002acb6] 266a 0004                 movea.l    4(a2),a3
[0002acba] 4e93                      jsr        (a3)
[0002acbc] 265f                      movea.l    (a7)+,a3
[0002acbe] 245f                      movea.l    (a7)+,a2
[0002acc0] 4e75                      rts
minsize:
[0002acc2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002acc8] 32a8 0012                 move.w     18(a0),(a1)
[0002accc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002acd2] 226f 0004                 movea.l    4(a7),a1
[0002acd6] 32a8 0014                 move.w     20(a0),(a1)
[0002acda] 4e75                      rts
object_tree:
[0002acdc] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0002ace0] 4fef feb8                 lea.l      -328(a7),a7
[0002ace4] 2f48 0144                 move.l     a0,324(a7)
[0002ace8] 2449                      movea.l    a1,a2
[0002acea] 41f9 000c 423e            lea.l      $000C423E,a0
[0002acf0] 43ef 0012                 lea.l      18(a7),a1
[0002acf4] 7031                      moveq.l    #49,d0
[0002acf6] 12d8                      move.b     (a0)+,(a1)+
[0002acf8] 51c8 fffc                 dbf        d0,$0002ACF6
[0002acfc] 41f9 000c 3d20            lea.l      ED_FTEXT,a0
[0002ad02] 4eb9 0004 f064            jsr        Aob_create
[0002ad08] 2648                      movea.l    a0,a3
[0002ad0a] 200b                      move.l     a3,d0
[0002ad0c] 6606                      bne.s      $0002AD14
[0002ad0e] 91c8                      suba.l     a0,a0
[0002ad10] 6000 02c6                 bra        $0002AFD8
[0002ad14] 49eb 0048                 lea.l      72(a3),a4
[0002ad18] 7016                      moveq.l    #22,d0
[0002ad1a] c06a 0008                 and.w      8(a2),d0
[0002ad1e] 816c 0008                 or.w       d0,8(a4)
[0002ad22] 703f                      moveq.l    #63,d0
[0002ad24] c06a 000a                 and.w      10(a2),d0
[0002ad28] 816c 000a                 or.w       d0,10(a4)
[0002ad2c] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002ad32] 2052                      movea.l    (a2),a0
[0002ad34] 2ea8 0258                 move.l     600(a0),(a7)
[0002ad38] 2f4c 0004                 move.l     a4,4(a7)
[0002ad3c] 3f7c 0003 0008            move.w     #$0003,8(a7)
[0002ad42] 43d7                      lea.l      (a7),a1
[0002ad44] 7009                      moveq.l    #9,d0
[0002ad46] 204c                      movea.l    a4,a0
[0002ad48] 4eb9 0006 6924            jsr        Auo_ftext
[0002ad4e] 700a                      moveq.l    #10,d0
[0002ad50] 224b                      movea.l    a3,a1
[0002ad52] 2052                      movea.l    (a2),a0
[0002ad54] 2068 0258                 movea.l    600(a0),a0
[0002ad58] 4eb9 0003 0b9a            jsr        oe_beself
[0002ad5e] 700b                      moveq.l    #11,d0
[0002ad60] 224b                      movea.l    a3,a1
[0002ad62] 2052                      movea.l    (a2),a0
[0002ad64] 2068 0258                 movea.l    600(a0),a0
[0002ad68] 4eb9 0003 0b9a            jsr        oe_beself
[0002ad6e] 702b                      moveq.l    #43,d0
[0002ad70] 224b                      movea.l    a3,a1
[0002ad72] 2052                      movea.l    (a2),a0
[0002ad74] 2068 0258                 movea.l    600(a0),a0
[0002ad78] 4eb9 0003 0b9a            jsr        oe_beself
[0002ad7e] 702d                      moveq.l    #45,d0
[0002ad80] 224b                      movea.l    a3,a1
[0002ad82] 2052                      movea.l    (a2),a0
[0002ad84] 2068 0258                 movea.l    600(a0),a0
[0002ad88] 4eb9 0003 0b9a            jsr        oe_beself
[0002ad8e] 2f6c 000c 000a            move.l     12(a4),10(a7)
[0002ad94] 4bef 000e                 lea.l      14(a7),a5
[0002ad98] 4855                      pea.l      (a5)
[0002ad9a] 43f9 000c 42a2            lea.l      $000C42A2,a1
[0002ada0] 206f 0148                 movea.l    328(a7),a0
[0002ada4] 2050                      movea.l    (a0),a0
[0002ada6] 4eb9 0008 1b26            jsr        sscanf
[0002adac] 584f                      addq.w     #4,a7
[0002adae] 2615                      move.l     (a5),d3
[0002adb0] 7010                      moveq.l    #16,d0
[0002adb2] e0a3                      asr.l      d0,d3
[0002adb4] 4244                      clr.w      d4
[0002adb6] 6018                      bra.s      $0002ADD0
[0002adb8] 41ef 0012                 lea.l      18(a7),a0
[0002adbc] 3204                      move.w     d4,d1
[0002adbe] 2252                      movea.l    (a2),a1
[0002adc0] 3029 0010                 move.w     16(a1),d0
[0002adc4] 4eb9 0007 5734            jsr        vqt_name
[0002adca] b640                      cmp.w      d0,d3
[0002adcc] 670a                      beq.s      $0002ADD8
[0002adce] 5244                      addq.w     #1,d4
[0002add0] 2052                      movea.l    (a2),a0
[0002add2] b868 0284                 cmp.w      644(a0),d4
[0002add6] 6de0                      blt.s      $0002ADB8
[0002add8] 2052                      movea.l    (a2),a0
[0002adda] b868 0284                 cmp.w      644(a0),d4
[0002adde] 6618                      bne.s      $0002ADF8
[0002ade0] 41f9 000c 3474            lea.l      A_ADAPTFONT,a0
[0002ade6] 7001                      moveq.l    #1,d0
[0002ade8] 4eb9 0005 a600            jsr        Awi_alert
[0002adee] 5340                      subq.w     #1,d0
[0002adf0] 6606                      bne.s      $0002ADF8
[0002adf2] 2abc 0001 000d            move.l     #$0001000D,(a5)
[0002adf8] 206f 000a                 movea.l    10(a7),a0
[0002adfc] 2155 0004                 move.l     (a5),4(a0)
[0002ae00] 2615                      move.l     (a5),d3
[0002ae02] 7010                      moveq.l    #16,d0
[0002ae04] e0a3                      asr.l      d0,d3
[0002ae06] 486f 0012                 pea.l      18(a7)
[0002ae0a] 43f9 000c 42a9            lea.l      $000C42A9,a1
[0002ae10] 204b                      movea.l    a3,a0
[0002ae12] 7027                      moveq.l    #39,d0
[0002ae14] 4eb9 0005 0f94            jsr        Aob_printf
[0002ae1a] 584f                      addq.w     #4,a7
[0002ae1c] 302d 0002                 move.w     2(a5),d0
[0002ae20] c07c 00ff                 and.w      #$00FF,d0
[0002ae24] 3f00                      move.w     d0,-(a7)
[0002ae26] 43f9 000c 42af            lea.l      $000C42AF,a1
[0002ae2c] 204b                      movea.l    a3,a0
[0002ae2e] 7028                      moveq.l    #40,d0
[0002ae30] 4eb9 0005 0f94            jsr        Aob_printf
[0002ae36] 544f                      addq.w     #2,a7
[0002ae38] 2015                      move.l     (a5),d0
[0002ae3a] 720e                      moveq.l    #14,d1
[0002ae3c] e2a0                      asr.l      d1,d0
[0002ae3e] c07c 0003                 and.w      #$0003,d0
[0002ae42] 4a40                      tst.w      d0
[0002ae44] 6716                      beq.s      $0002AE5C
[0002ae46] 5340                      subq.w     #1,d0
[0002ae48] 670a                      beq.s      $0002AE54
[0002ae4a] 5340                      subq.w     #1,d0
[0002ae4c] 6716                      beq.s      $0002AE64
[0002ae4e] 5340                      subq.w     #1,d0
[0002ae50] 671a                      beq.s      $0002AE6C
[0002ae52] 601e                      bra.s      $0002AE72
[0002ae54] 006b 0001 027a            ori.w      #$0001,634(a3)
[0002ae5a] 6016                      bra.s      $0002AE72
[0002ae5c] 006b 0001 02aa            ori.w      #$0001,682(a3)
[0002ae62] 600e                      bra.s      $0002AE72
[0002ae64] 006b 0001 030a            ori.w      #$0001,778(a3)
[0002ae6a] 6006                      bra.s      $0002AE72
[0002ae6c] 006b 0001 02da            ori.w      #$0001,730(a3)
[0002ae72] 2015                      move.l     (a5),d0
[0002ae74] c0bc 0000 0100            and.l      #$00000100,d0
[0002ae7a] 6706                      beq.s      $0002AE82
[0002ae7c] 006b 0001 0142            ori.w      #$0001,322(a3)
[0002ae82] 2015                      move.l     (a5),d0
[0002ae84] c0bc 0000 0200            and.l      #$00000200,d0
[0002ae8a] 6706                      beq.s      $0002AE92
[0002ae8c] 006b 0001 0172            ori.w      #$0001,370(a3)
[0002ae92] 2015                      move.l     (a5),d0
[0002ae94] c0bc 0000 0400            and.l      #$00000400,d0
[0002ae9a] 6706                      beq.s      $0002AEA2
[0002ae9c] 006b 0001 01a2            ori.w      #$0001,418(a3)
[0002aea2] 2015                      move.l     (a5),d0
[0002aea4] c0bc 0000 0800            and.l      #$00000800,d0
[0002aeaa] 6706                      beq.s      $0002AEB2
[0002aeac] 006b 0001 01d2            ori.w      #$0001,466(a3)
[0002aeb2] 2015                      move.l     (a5),d0
[0002aeb4] c0bc 0000 1000            and.l      #$00001000,d0
[0002aeba] 6706                      beq.s      $0002AEC2
[0002aebc] 006b 0001 0202            ori.w      #$0001,514(a3)
[0002aec2] 2015                      move.l     (a5),d0
[0002aec4] c0bc 0000 2000            and.l      #$00002000,d0
[0002aeca] 6706                      beq.s      $0002AED2
[0002aecc] 006b 0001 0232            ori.w      #$0001,562(a3)
[0002aed2] 206f 0144                 movea.l    324(a7),a0
[0002aed6] 0c68 0002 0008            cmpi.w     #$0002,8(a0)
[0002aedc] 6616                      bne.s      $0002AEF4
[0002aede] 2a68 000a                 movea.l    10(a0),a5
[0002aee2] 224d                      movea.l    a5,a1
[0002aee4] 7004                      moveq.l    #4,d0
[0002aee6] 246f 000a                 movea.l    10(a7),a2
[0002aeea] 246a 0008                 movea.l    8(a2),a2
[0002aeee] 204c                      movea.l    a4,a0
[0002aef0] 4e92                      jsr        (a2)
[0002aef2] 6006                      bra.s      $0002AEFA
[0002aef4] 4bf9 000c 4284            lea.l      $000C4284,a5
[0002aefa] 204d                      movea.l    a5,a0
[0002aefc] 4eb9 0008 2f6c            jsr        strlen
[0002af02] 2600                      move.l     d0,d3
[0002af04] 45ef 0044                 lea.l      68(a7),a2
[0002af08] b67c 00ff                 cmp.w      #$00FF,d3
[0002af0c] 6f1c                      ble.s      $0002AF2A
[0002af0e] 203c 0000 00ff            move.l     #$000000FF,d0
[0002af14] 43ed 00ff                 lea.l      255(a5),a1
[0002af18] 204a                      movea.l    a2,a0
[0002af1a] 4eb9 0008 2fd6            jsr        strncpy
[0002af20] 422a 00ff                 clr.b      255(a2)
[0002af24] 363c 00ff                 move.w     #$00FF,d3
[0002af28] 6002                      bra.s      $0002AF2C
[0002af2a] 4212                      clr.b      (a2)
[0002af2c] 2f0d                      move.l     a5,-(a7)
[0002af2e] 3f03                      move.w     d3,-(a7)
[0002af30] 43f9 000c 42b4            lea.l      $000C42B4,a1
[0002af36] 700a                      moveq.l    #10,d0
[0002af38] 204b                      movea.l    a3,a0
[0002af3a] 4eb9 0005 0f94            jsr        Aob_printf
[0002af40] 5c4f                      addq.w     #6,a7
[0002af42] 224a                      movea.l    a2,a1
[0002af44] 700b                      moveq.l    #11,d0
[0002af46] 204b                      movea.l    a3,a0
[0002af48] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002af4e] 206b 0414                 movea.l    1044(a3),a0
[0002af52] 226f 000a                 movea.l    10(a7),a1
[0002af56] 2368 000c 0018            move.l     12(a0),24(a1)
[0002af5c] 206f 0144                 movea.l    324(a7),a0
[0002af60] 2068 0026                 movea.l    38(a0),a0
[0002af64] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002af6a] 4a40                      tst.w      d0
[0002af6c] 6712                      beq.s      $0002AF80
[0002af6e] 43f9 000c 4284            lea.l      $000C4284,a1
[0002af74] 702b                      moveq.l    #43,d0
[0002af76] 204b                      movea.l    a3,a0
[0002af78] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002af7e] 6012                      bra.s      $0002AF92
[0002af80] 206f 0144                 movea.l    324(a7),a0
[0002af84] 2268 0026                 movea.l    38(a0),a1
[0002af88] 702b                      moveq.l    #43,d0
[0002af8a] 204b                      movea.l    a3,a0
[0002af8c] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002af92] 206b 0444                 movea.l    1092(a3),a0
[0002af96] 226f 000a                 movea.l    10(a7),a1
[0002af9a] 2368 000c 001c            move.l     12(a0),28(a1)
[0002afa0] 206f 0144                 movea.l    324(a7),a0
[0002afa4] 2068 002a                 movea.l    42(a0),a0
[0002afa8] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002afae] 4a40                      tst.w      d0
[0002afb0] 6712                      beq.s      $0002AFC4
[0002afb2] 43f9 000c 4284            lea.l      $000C4284,a1
[0002afb8] 702d                      moveq.l    #45,d0
[0002afba] 204b                      movea.l    a3,a0
[0002afbc] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002afc2] 6012                      bra.s      $0002AFD6
[0002afc4] 206f 0144                 movea.l    324(a7),a0
[0002afc8] 2268 002a                 movea.l    42(a0),a1
[0002afcc] 702d                      moveq.l    #45,d0
[0002afce] 204b                      movea.l    a3,a0
[0002afd0] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002afd6] 204b                      movea.l    a3,a0
[0002afd8] 4fef 0148                 lea.l      328(a7),a7
[0002afdc] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0002afe0] 4e75                      rts
test_it:
[0002afe2] 2f0a                      move.l     a2,-(a7)
[0002afe4] 2f0b                      move.l     a3,-(a7)
[0002afe6] 2648                      movea.l    a0,a3
[0002afe8] 2449                      movea.l    a1,a2
[0002afea] 22bc 0006 639a            move.l     #A_ftext,(a1)
[0002aff0] 486a 0004                 pea.l      4(a2)
[0002aff4] 43f9 000c 42a2            lea.l      $000C42A2,a1
[0002affa] 2050                      movea.l    (a0),a0
[0002affc] 4eb9 0008 1b26            jsr        sscanf
[0002b002] 584f                      addq.w     #4,a7
[0002b004] 257c 0006 6924 0008       move.l     #Auo_ftext,8(a2)
[0002b00c] 0c6b 0002 0008            cmpi.w     #$0002,8(a3)
[0002b012] 6608                      bne.s      $0002B01C
[0002b014] 256b 000a 000c            move.l     10(a3),12(a2)
[0002b01a] 6004                      bra.s      $0002B020
[0002b01c] 42aa 000c                 clr.l      12(a2)
[0002b020] 7000                      moveq.l    #0,d0
[0002b022] 2540 0014                 move.l     d0,20(a2)
[0002b026] 2540 0010                 move.l     d0,16(a2)
[0002b02a] 206b 0026                 movea.l    38(a3),a0
[0002b02e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b034] 4a40                      tst.w      d0
[0002b036] 6704                      beq.s      $0002B03C
[0002b038] 91c8                      suba.l     a0,a0
[0002b03a] 6004                      bra.s      $0002B040
[0002b03c] 206b 0026                 movea.l    38(a3),a0
[0002b040] 2548 0018                 move.l     a0,24(a2)
[0002b044] 206b 002a                 movea.l    42(a3),a0
[0002b048] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b04e] 4a40                      tst.w      d0
[0002b050] 6704                      beq.s      $0002B056
[0002b052] 91c8                      suba.l     a0,a0
[0002b054] 6004                      bra.s      $0002B05A
[0002b056] 206b 002a                 movea.l    42(a3),a0
[0002b05a] 2548 001c                 move.l     a0,28(a2)
[0002b05e] 265f                      movea.l    (a7)+,a3
[0002b060] 245f                      movea.l    (a7)+,a2
[0002b062] 4e75                      rts
abort:
[0002b064] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b06a] 2268 0258                 movea.l    600(a0),a1
[0002b06e] 2069 0014                 movea.l    20(a1),a0
[0002b072] 2068 0054                 movea.l    84(a0),a0
[0002b076] 42a8 0018                 clr.l      24(a0)
[0002b07a] 42a8 001c                 clr.l      28(a0)
[0002b07e] 2079 000c 422e            movea.l    $000C422E,a0
[0002b084] 2050                      movea.l    (a0),a0
[0002b086] 4e90                      jsr        (a0)
[0002b088] 4e75                      rts
ok:
[0002b08a] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002b08e] 4fef fdd2                 lea.l      -558(a7),a7
[0002b092] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b098] 2268 0258                 movea.l    600(a0),a1
[0002b09c] 2469 0014                 movea.l    20(a1),a2
[0002b0a0] 266a 0054                 movea.l    84(a2),a3
[0002b0a4] 49f9 0010 c542            lea.l      parm,a4
[0002b0aa] 2f2b 0004                 move.l     4(a3),-(a7)
[0002b0ae] 43f9 000c 42a2            lea.l      $000C42A2,a1
[0002b0b4] 204c                      movea.l    a4,a0
[0002b0b6] 4eb9 0008 15ac            jsr        sprintf
[0002b0bc] 584f                      addq.w     #4,a7
[0002b0be] 2e8c                      move.l     a4,(a7)
[0002b0c0] 2f7c 000c 428e 0004       move.l     #$000C428E,4(a7)
[0002b0c8] 49ef 002e                 lea.l      46(a7),a4
[0002b0cc] 224c                      movea.l    a4,a1
[0002b0ce] 700a                      moveq.l    #10,d0
[0002b0d0] 204a                      movea.l    a2,a0
[0002b0d2] 4eb9 0005 11da            jsr        Aob_gettext
[0002b0d8] 204c                      movea.l    a4,a0
[0002b0da] 4eb9 0008 2f6c            jsr        strlen
[0002b0e0] 2600                      move.l     d0,d3
[0002b0e2] 43f4 3000                 lea.l      0(a4,d3.w),a1
[0002b0e6] 700b                      moveq.l    #11,d0
[0002b0e8] 204a                      movea.l    a2,a0
[0002b0ea] 4eb9 0005 11da            jsr        Aob_gettext
[0002b0f0] 1014                      move.b     (a4),d0
[0002b0f2] 670c                      beq.s      $0002B100
[0002b0f4] 3f7c 0002 0008            move.w     #$0002,8(a7)
[0002b0fa] 2f4c 000a                 move.l     a4,10(a7)
[0002b0fe] 6008                      bra.s      $0002B108
[0002b100] 426f 0008                 clr.w      8(a7)
[0002b104] 42af 000a                 clr.l      10(a7)
[0002b108] 42af 000e                 clr.l      14(a7)
[0002b10c] 4240                      clr.w      d0
[0002b10e] 3f40 001c                 move.w     d0,28(a7)
[0002b112] 3f40 0012                 move.w     d0,18(a7)
[0002b116] 7200                      moveq.l    #0,d1
[0002b118] 2f41 001e                 move.l     d1,30(a7)
[0002b11c] 2f41 0014                 move.l     d1,20(a7)
[0002b120] 7000                      moveq.l    #0,d0
[0002b122] 2f40 0022                 move.l     d0,34(a7)
[0002b126] 2f40 0018                 move.l     d0,24(a7)
[0002b12a] 43ef 0026                 lea.l      38(a7),a1
[0002b12e] 41ea 0408                 lea.l      1032(a2),a0
[0002b132] 7003                      moveq.l    #3,d0
[0002b134] 4eb9 0006 a068            jsr        Auo_boxed
[0002b13a] 206f 0026                 movea.l    38(a7),a0
[0002b13e] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b144] 4a40                      tst.w      d0
[0002b146] 6704                      beq.s      $0002B14C
[0002b148] 42af 0026                 clr.l      38(a7)
[0002b14c] 43ef 002a                 lea.l      42(a7),a1
[0002b150] 7003                      moveq.l    #3,d0
[0002b152] 41ea 0438                 lea.l      1080(a2),a0
[0002b156] 4eb9 0006 a068            jsr        Auo_boxed
[0002b15c] 206f 002a                 movea.l    42(a7),a0
[0002b160] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0002b166] 4a40                      tst.w      d0
[0002b168] 6704                      beq.s      $0002B16E
[0002b16a] 42af 002a                 clr.l      42(a7)
[0002b16e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002b174] 3228 0014                 move.w     20(a0),d1
[0002b178] 3028 0012                 move.w     18(a0),d0
[0002b17c] 41d7                      lea.l      (a7),a0
[0002b17e] 2279 000c 422e            movea.l    $000C422E,a1
[0002b184] 2269 0004                 movea.l    4(a1),a1
[0002b188] 4e91                      jsr        (a1)
[0002b18a] 6100 fed8                 bsr        abort
[0002b18e] 4fef 022e                 lea.l      558(a7),a7
[0002b192] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0002b196] 4e75                      rts
font_sel:
[0002b198] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0002b19c] 4fef ffc6                 lea.l      -58(a7),a7
[0002b1a0] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002b1a6] 2052                      movea.l    (a2),a0
[0002b1a8] 2668 0258                 movea.l    600(a0),a3
[0002b1ac] 2ea8 025c                 move.l     604(a0),(a7)
[0002b1b0] 2268 025c                 movea.l    604(a0),a1
[0002b1b4] 2869 0054                 movea.l    84(a1),a4
[0002b1b8] 4bef 0038                 lea.l      56(a7),a5
[0002b1bc] 202c 0004                 move.l     4(a4),d0
[0002b1c0] 7210                      moveq.l    #16,d1
[0002b1c2] e2a0                      asr.l      d1,d0
[0002b1c4] 3a80                      move.w     d0,(a5)
[0002b1c6] 342c 0006                 move.w     6(a4),d2
[0002b1ca] c47c 00ff                 and.w      #$00FF,d2
[0002b1ce] 3f42 0036                 move.w     d2,54(a7)
[0002b1d2] 43ef 0036                 lea.l      54(a7),a1
[0002b1d6] 204d                      movea.l    a5,a0
[0002b1d8] 7001                      moveq.l    #1,d0
[0002b1da] 4eb9 0004 10c8            jsr        A_fontsel
[0002b1e0] 4a40                      tst.w      d0
[0002b1e2] 6600 009e                 bne        $0002B282
[0002b1e6] 0c6f 00ff 0036            cmpi.w     #$00FF,54(a7)
[0002b1ec] 6f06                      ble.s      $0002B1F4
[0002b1ee] 3f7c 00ff 0036            move.w     #$00FF,54(a7)
[0002b1f4] 202c 0004                 move.l     4(a4),d0
[0002b1f8] c0bc 0000 ff00            and.l      #$0000FF00,d0
[0002b1fe] 3215                      move.w     (a5),d1
[0002b200] 48c1                      ext.l      d1
[0002b202] 7410                      moveq.l    #16,d2
[0002b204] e5a9                      lsl.l      d2,d1
[0002b206] 8081                      or.l       d1,d0
[0002b208] 322f 0036                 move.w     54(a7),d1
[0002b20c] 48c1                      ext.l      d1
[0002b20e] 8081                      or.l       d1,d0
[0002b210] 2940 0004                 move.l     d0,4(a4)
[0002b214] 4243                      clr.w      d3
[0002b216] 49ef 0004                 lea.l      4(a7),a4
[0002b21a] 6018                      bra.s      $0002B234
[0002b21c] 204c                      movea.l    a4,a0
[0002b21e] 3203                      move.w     d3,d1
[0002b220] 2252                      movea.l    (a2),a1
[0002b222] 3029 0010                 move.w     16(a1),d0
[0002b226] 4eb9 0007 5734            jsr        vqt_name
[0002b22c] 3215                      move.w     (a5),d1
[0002b22e] b240                      cmp.w      d0,d1
[0002b230] 670a                      beq.s      $0002B23C
[0002b232] 5243                      addq.w     #1,d3
[0002b234] 2052                      movea.l    (a2),a0
[0002b236] b668 0284                 cmp.w      644(a0),d3
[0002b23a] 6de0                      blt.s      $0002B21C
[0002b23c] 4854                      pea.l      (a4)
[0002b23e] 43f9 000c 42a9            lea.l      $000C42A9,a1
[0002b244] 7027                      moveq.l    #39,d0
[0002b246] 206f 0004                 movea.l    4(a7),a0
[0002b24a] 4eb9 0005 0f94            jsr        Aob_printf
[0002b250] 584f                      addq.w     #4,a7
[0002b252] 3f2f 0036                 move.w     54(a7),-(a7)
[0002b256] 43f9 000c 42af            lea.l      $000C42AF,a1
[0002b25c] 7028                      moveq.l    #40,d0
[0002b25e] 206f 0002                 movea.l    2(a7),a0
[0002b262] 4eb9 0005 0f94            jsr        Aob_printf
[0002b268] 544f                      addq.w     #2,a7
[0002b26a] 72ff                      moveq.l    #-1,d1
[0002b26c] 7022                      moveq.l    #34,d0
[0002b26e] 204b                      movea.l    a3,a0
[0002b270] 226b 0066                 movea.l    102(a3),a1
[0002b274] 4e91                      jsr        (a1)
[0002b276] 72ff                      moveq.l    #-1,d1
[0002b278] 7002                      moveq.l    #2,d0
[0002b27a] 204b                      movea.l    a3,a0
[0002b27c] 226b 0066                 movea.l    102(a3),a1
[0002b280] 4e91                      jsr        (a1)
[0002b282] 4fef 003a                 lea.l      58(a7),a7
[0002b286] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0002b28a] 4e75                      rts
edf_pos:
[0002b28c] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0002b290] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002b296] 2052                      movea.l    (a2),a0
[0002b298] 3228 0260                 move.w     608(a0),d1
[0002b29c] 48c1                      ext.l      d1
[0002b29e] 2001                      move.l     d1,d0
[0002b2a0] d080                      add.l      d0,d0
[0002b2a2] d081                      add.l      d1,d0
[0002b2a4] e788                      lsl.l      #3,d0
[0002b2a6] 2068 025c                 movea.l    604(a0),a0
[0002b2aa] 41f0 0818                 lea.l      24(a0,d0.l),a0
[0002b2ae] 2628 000c                 move.l     12(a0),d3
[0002b2b2] 2252                      movea.l    (a2),a1
[0002b2b4] 2069 025c                 movea.l    604(a1),a0
[0002b2b8] 2668 0054                 movea.l    84(a0),a3
[0002b2bc] 02ab ffff 3fff 0004       andi.l     #$FFFF3FFF,4(a3)
[0002b2c4] 7001                      moveq.l    #1,d0
[0002b2c6] 2052                      movea.l    (a2),a0
[0002b2c8] 3428 0260                 move.w     608(a0),d2
[0002b2cc] 48c2                      ext.l      d2
[0002b2ce] 2202                      move.l     d2,d1
[0002b2d0] d281                      add.l      d1,d1
[0002b2d2] d282                      add.l      d2,d1
[0002b2d4] e789                      lsl.l      #3,d1
[0002b2d6] 2268 025c                 movea.l    604(a0),a1
[0002b2da] c071 180a                 and.w      10(a1,d1.l),d0
[0002b2de] 670a                      beq.s      $0002B2EA
[0002b2e0] 2003                      move.l     d3,d0
[0002b2e2] 720e                      moveq.l    #14,d1
[0002b2e4] e3a8                      lsl.l      d1,d0
[0002b2e6] 81ab 0004                 or.l       d0,4(a3)
[0002b2ea] 72ff                      moveq.l    #-1,d1
[0002b2ec] 2052                      movea.l    (a2),a0
[0002b2ee] 3028 0260                 move.w     608(a0),d0
[0002b2f2] 2068 0258                 movea.l    600(a0),a0
[0002b2f6] 2252                      movea.l    (a2),a1
[0002b2f8] 2669 0258                 movea.l    600(a1),a3
[0002b2fc] 226b 0066                 movea.l    102(a3),a1
[0002b300] 4e91                      jsr        (a1)
[0002b302] 72ff                      moveq.l    #-1,d1
[0002b304] 7002                      moveq.l    #2,d0
[0002b306] 2052                      movea.l    (a2),a0
[0002b308] 2068 0258                 movea.l    600(a0),a0
[0002b30c] 2252                      movea.l    (a2),a1
[0002b30e] 2669 0258                 movea.l    600(a1),a3
[0002b312] 226b 0066                 movea.l    102(a3),a1
[0002b316] 4e91                      jsr        (a1)
[0002b318] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0002b31c] 4e75                      rts
edf_effect:
[0002b31e] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0002b322] 45f9 0010 ee4e            lea.l      ACSblk,a2
[0002b328] 2052                      movea.l    (a2),a0
[0002b32a] 3228 0260                 move.w     608(a0),d1
[0002b32e] 48c1                      ext.l      d1
[0002b330] 2001                      move.l     d1,d0
[0002b332] d080                      add.l      d0,d0
[0002b334] d081                      add.l      d1,d0
[0002b336] e788                      lsl.l      #3,d0
[0002b338] 2068 025c                 movea.l    604(a0),a0
[0002b33c] 41f0 0818                 lea.l      24(a0,d0.l),a0
[0002b340] 2628 000c                 move.l     12(a0),d3
[0002b344] 2252                      movea.l    (a2),a1
[0002b346] 2069 025c                 movea.l    604(a1),a0
[0002b34a] 2668 0054                 movea.l    84(a0),a3
[0002b34e] 2403                      move.l     d3,d2
[0002b350] e18a                      lsl.l      #8,d2
[0002b352] 4682                      not.l      d2
[0002b354] c5ab 0004                 and.l      d2,4(a3)
[0002b358] 7001                      moveq.l    #1,d0
[0002b35a] 2052                      movea.l    (a2),a0
[0002b35c] 3428 0260                 move.w     608(a0),d2
[0002b360] 48c2                      ext.l      d2
[0002b362] 2202                      move.l     d2,d1
[0002b364] d281                      add.l      d1,d1
[0002b366] d282                      add.l      d2,d1
[0002b368] e789                      lsl.l      #3,d1
[0002b36a] 2268 025c                 movea.l    604(a0),a1
[0002b36e] c071 180a                 and.w      10(a1,d1.l),d0
[0002b372] 6708                      beq.s      $0002B37C
[0002b374] 2003                      move.l     d3,d0
[0002b376] e188                      lsl.l      #8,d0
[0002b378] 81ab 0004                 or.l       d0,4(a3)
[0002b37c] 72ff                      moveq.l    #-1,d1
[0002b37e] 2052                      movea.l    (a2),a0
[0002b380] 3028 0260                 move.w     608(a0),d0
[0002b384] 2068 0258                 movea.l    600(a0),a0
[0002b388] 2252                      movea.l    (a2),a1
[0002b38a] 2669 0258                 movea.l    600(a1),a3
[0002b38e] 226b 0066                 movea.l    102(a3),a1
[0002b392] 4e91                      jsr        (a1)
[0002b394] 72ff                      moveq.l    #-1,d1
[0002b396] 7002                      moveq.l    #2,d0
[0002b398] 2052                      movea.l    (a2),a0
[0002b39a] 2068 0258                 movea.l    600(a0),a0
[0002b39e] 2252                      movea.l    (a2),a1
[0002b3a0] 2669 0258                 movea.l    600(a1),a3
[0002b3a4] 226b 0066                 movea.l    102(a3),a1
[0002b3a8] 4e91                      jsr        (a1)
[0002b3aa] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0002b3ae] 4e75                      rts

	.data

A_ADAPTFONT:
[000c3474]                           dc.b '[2][ Die Schriftgrîûe ist negativ| und ist wahrscheinlich ein| Objekt nach alter Definition.| Soll es auf den Standardwert| gesetzt werden? ][OK| Abbruch ]',0
BUBBLE_01:
[000c3510]                           dc.b 'Die énderungen werden Åbernommen und Åberschreiben die alten Einstellungen.',0
BUBBLE_02:
[000c355c]                           dc.b 'Die énderungen werden verworfen, die alten Einstellungen bleiben erhalten.',0
BUBBLE_03:
[000c35a7]                           dc.b 'Hier kann der String, der fÅr BubbleGEM verwendet werden soll, eingegeben werden.',0
BUBBLE_04:
[000c35f9]                           dc.b 'Hier kann der String eingegeben werden, der das aufzurufende Context-Popup beschreibt (siehe in der Dokumentation zu Ame_strpopup).',0
BUBBLE_05:
[000c367d]                           dc.b 'Im erscheinenden Font-Selektor kînnen der Zeichensatz und die Zeichenhîhe ausgewÑhlt werden.',0
BUBBLE_06:
[000c36da]                           dc.b 'Der Text soll fett dargestellt werden.',0
BUBBLE_07:
[000c3701]                           dc.b 'Der Text soll hell dargestellt werden.',0
BUBBLE_08:
[000c3728]                           dc.b 'Der Text soll kursiv dargestellt werden.',0
BUBBLE_09:
[000c3751]                           dc.b 'Der Text soll unterstrichen dargestellt werden.',0
BUBBLE_10:
[000c3781]                           dc.b 'Der Text soll hohl dargestellt werden.',0
BUBBLE_11:
[000c37a8]                           dc.b 'Der Text soll schattiert dargestellt werden.',0
BUBBLE_12:
[000c37d5]                           dc.b 'Der Text soll linksbÅndig dargestellt werden.',0
BUBBLE_13:
[000c3803]                           dc.b 'Der Text soll rechtsbÅndig dargestellt werden.',0
BUBBLE_14:
[000c3832]                           dc.b 'Der Text soll zentriert dargestellt werden.',0
BUBBLE_15:
[000c385e]                           dc.b 'Der Text soll im Blocksatz dargestellt werden.',0
BUBBLE_16:
[000c388d]                           dc.b 'Hier wird der Text in bis zu zwei Zeilen eingegeben.',0
TEXT_005:
[000c38c2]                           dc.w $4f4b
[000c38c4]                           dc.w $0041
[000c38c6]                           dc.b 'bbruch',0
TEXT_01:
[000c38cd]                           dc.b 'Schrift...',0
TEXT_02:
[000c38d8]                           dc.b '12345',0
TEXT_03:
[000c38de]                           dc.b '123456789012345678901234567890',0
TEXT_04:
[000c38fd]                           dc.b 'Hîhe:',0
TEXT_05:
[000c3903]                           dc.b 'Name:',0
TEXT_06:
[000c3909]                           dc.b 'Effekte:',0
TEXT_07:
[000c3912]                           dc.b 'Text:',0
TEXT_08:
[000c3918]                           dc.b 'fett',0
TEXT_09:
[000c391d]                           dc.b 'hell ',0
TEXT_10:
[000c3923]                           dc.b 'kursiv',0
TEXT_11:
[000c392a]                           dc.b 'unterstrichen',0
TEXT_12:
[000c3938]                           dc.b 'hohl    ',0
TEXT_13:
[000c3941]                           dc.b 'schattiert',0
TEXT_14:
[000c394c]                           dc.b 'links',0
TEXT_15:
[000c3952]                           dc.b 'Ausrichtung:',0
TEXT_16:
[000c395f]                           dc.b 'rechts',0
TEXT_17:
[000c3966]                           dc.b 'zentriert',0
TEXT_18:
[000c3970]                           dc.b 'Blocksatz',0
TEXT_19:
[000c397a]                           dc.b 'Sonstiges',0
TEXT_20:
[000c3984]                           dc.b 'BubbleGEM-Text',0
TEXT_21:
[000c3993]                           dc.b 'Context-Popup',0
TEXT_22:
[000c39a1]                           dc.b 'Zeichensatz & Zeichenhîhe',0
extra:
[000c39bb]                           dc.b 'The quick brown fox jumps over the lazy dog',0
help_title:
[000c39e7]                           dc.b 'Der FText-Editor',0
title:
[000c39f8]                           dc.b 'FTEXT -',0
A_3DBUTTON01:
[000c3a00] 00064a22                  dc.l A_3Dbutton
[000c3a04]                           dc.w $29f1
[000c3a06]                           dc.w $01f8
[000c3a08] 000630f2                  dc.l Auo_string
[000c3a0c]                           dc.w $0000
[000c3a0e]                           dc.w $0000
[000c3a10]                           dc.w $0000
[000c3a12]                           dc.w $0000
[000c3a14]                           dc.w $0000
[000c3a16]                           dc.w $0000
[000c3a18]                           dc.w $0000
[000c3a1a]                           dc.w $0000
[000c3a1c]                           dc.w $0000
[000c3a1e]                           dc.w $0000
A_3DBUTTON02:
[000c3a20] 00064a22                  dc.l A_3Dbutton
[000c3a24]                           dc.w $2011
[000c3a26]                           dc.w $9178
[000c3a28] 000630f2                  dc.l Auo_string
[000c3a2c]                           dc.w $0000
[000c3a2e]                           dc.w $0000
[000c3a30]                           dc.w $0000
[000c3a32]                           dc.w $0000
[000c3a34]                           dc.w $0000
[000c3a36]                           dc.w $0000
[000c3a38]                           dc.w $0000
[000c3a3a]                           dc.w $0000
[000c3a3c]                           dc.w $0000
[000c3a3e]                           dc.w $0000
A_3DBUTTON05:
[000c3a40] 00064a22                  dc.l A_3Dbutton
[000c3a44]                           dc.w $29c1
[000c3a46]                           dc.w $0178
[000c3a48] 000630f2                  dc.l Auo_string
[000c3a4c] 000c38c2                  dc.l TEXT_005
[000c3a50]                           dc.w $0000
[000c3a52]                           dc.w $0000
[000c3a54]                           dc.w $0000
[000c3a56]                           dc.w $0000
[000c3a58] 000c3510                  dc.l BUBBLE_01
[000c3a5c]                           dc.w $0000
[000c3a5e]                           dc.w $0000
A_3DBUTTON06:
[000c3a60] 00064a22                  dc.l A_3Dbutton
[000c3a64]                           dc.w $21f1
[000c3a66]                           dc.w $0178
[000c3a68] 000630f2                  dc.l Auo_string
[000c3a6c]                           dc.w $0000
[000c3a6e]                           dc.w $0000
[000c3a70]                           dc.w $0000
[000c3a72]                           dc.w $0000
[000c3a74]                           dc.w $0000
[000c3a76]                           dc.w $0000
[000c3a78]                           dc.w $0000
[000c3a7a]                           dc.w $0000
[000c3a7c]                           dc.w $0000
[000c3a7e]                           dc.w $0000
A_3DBUTTON08:
[000c3a80] 00064a22                  dc.l A_3Dbutton
[000c3a84]                           dc.w $29c1
[000c3a86]                           dc.w $0178
[000c3a88] 000630f2                  dc.l Auo_string
[000c3a8c] 000c38c5                  dc.l TEXT_009
[000c3a90]                           dc.w $0000
[000c3a92]                           dc.w $0000
[000c3a94]                           dc.w $0000
[000c3a96]                           dc.w $0000
[000c3a98] 000c355c                  dc.l BUBBLE_02
[000c3a9c]                           dc.w $0000
[000c3a9e]                           dc.w $0000
A_3DBUTTON09:
[000c3aa0] 00064a22                  dc.l A_3Dbutton
[000c3aa4]                           dc.w $29c1
[000c3aa6]                           dc.w $0178
[000c3aa8] 000630f2                  dc.l Auo_string
[000c3aac] 000c38cd                  dc.l TEXT_01
[000c3ab0]                           dc.w $0000
[000c3ab2]                           dc.w $0000
[000c3ab4]                           dc.w $0000
[000c3ab6]                           dc.w $0000
[000c3ab8] 000c367d                  dc.l BUBBLE_05
[000c3abc]                           dc.w $0000
[000c3abe]                           dc.w $0000
A_BOXED02:
[000c3ac0] 0006afea                  dc.l A_boxed
[000c3ac4]                           dc.w $9000
[000c3ac6]                           dc.w $ff12
[000c3ac8] 0006a068                  dc.l Auo_boxed
[000c3acc]                           dc.w $0000
[000c3ace]                           dc.w $0000
[000c3ad0]                           dc.w $0000
[000c3ad2]                           dc.w $0000
[000c3ad4]                           dc.w $0000
[000c3ad6]                           dc.w $0000
[000c3ad8] 000c388d                  dc.l BUBBLE_16
[000c3adc]                           dc.w $0000
[000c3ade]                           dc.w $0000
A_BOXED04:
[000c3ae0] 0006afea                  dc.l A_boxed
[000c3ae4]                           dc.w $9038
[000c3ae6]                           dc.w $ff12
[000c3ae8] 0006a068                  dc.l Auo_boxed
[000c3aec]                           dc.w $0000
[000c3aee]                           dc.w $0000
[000c3af0]                           dc.w $0000
[000c3af2]                           dc.w $0000
[000c3af4]                           dc.w $0000
[000c3af6]                           dc.w $0000
[000c3af8] 000c35a7                  dc.l BUBBLE_03
[000c3afc]                           dc.w $0000
[000c3afe]                           dc.w $0000
A_BOXED05:
[000c3b00] 0006afea                  dc.l A_boxed
[000c3b04]                           dc.w $9038
[000c3b06]                           dc.w $ff12
[000c3b08] 0006a068                  dc.l Auo_boxed
[000c3b0c]                           dc.w $0000
[000c3b0e]                           dc.w $0000
[000c3b10]                           dc.w $0000
[000c3b12]                           dc.w $0000
[000c3b14]                           dc.w $0000
[000c3b16]                           dc.w $0000
[000c3b18] 000c35f9                  dc.l BUBBLE_04
[000c3b1c]                           dc.w $0000
[000c3b1e]                           dc.w $0000
A_CHECKBOX01:
[000c3b20] 0006323e                  dc.l A_checkbox
[000c3b24]                           dc.w $0000
[000c3b26]                           dc.w $0001
[000c3b28] 000630f2                  dc.l Auo_string
[000c3b2c] 000c3918                  dc.l TEXT_08
[000c3b30]                           dc.w $0000
[000c3b32]                           dc.w $0000
[000c3b34]                           dc.w $0000
[000c3b36]                           dc.w $0000
[000c3b38] 000c36da                  dc.l BUBBLE_06
[000c3b3c]                           dc.w $0000
[000c3b3e]                           dc.w $0000
A_CHECKBOX02:
[000c3b40] 0006323e                  dc.l A_checkbox
[000c3b44]                           dc.w $0000
[000c3b46]                           dc.w $0001
[000c3b48] 000630f2                  dc.l Auo_string
[000c3b4c] 000c391d                  dc.l TEXT_09
[000c3b50]                           dc.w $0000
[000c3b52]                           dc.w $0000
[000c3b54]                           dc.w $0000
[000c3b56]                           dc.w $0000
[000c3b58] 000c3701                  dc.l BUBBLE_07
[000c3b5c]                           dc.w $0000
[000c3b5e]                           dc.w $0000
A_CHECKBOX03:
[000c3b60] 0006323e                  dc.l A_checkbox
[000c3b64]                           dc.w $0000
[000c3b66]                           dc.w $0001
[000c3b68] 000630f2                  dc.l Auo_string
[000c3b6c] 000c3923                  dc.l TEXT_10
[000c3b70]                           dc.w $0000
[000c3b72]                           dc.w $0000
[000c3b74]                           dc.w $0000
[000c3b76]                           dc.w $0000
[000c3b78] 000c3728                  dc.l BUBBLE_08
[000c3b7c]                           dc.w $0000
[000c3b7e]                           dc.w $0000
A_CHECKBOX04:
[000c3b80] 0006323e                  dc.l A_checkbox
[000c3b84]                           dc.w $0000
[000c3b86]                           dc.w $0001
[000c3b88] 000630f2                  dc.l Auo_string
[000c3b8c] 000c392a                  dc.l TEXT_11
[000c3b90]                           dc.w $0000
[000c3b92]                           dc.w $0000
[000c3b94]                           dc.w $0000
[000c3b96]                           dc.w $0000
[000c3b98] 000c3751                  dc.l BUBBLE_09
[000c3b9c]                           dc.w $0000
[000c3b9e]                           dc.w $0000
A_CHECKBOX05:
[000c3ba0] 0006323e                  dc.l A_checkbox
[000c3ba4]                           dc.w $0000
[000c3ba6]                           dc.w $0001
[000c3ba8] 000630f2                  dc.l Auo_string
[000c3bac] 000c3938                  dc.l TEXT_12
[000c3bb0]                           dc.w $0000
[000c3bb2]                           dc.w $0000
[000c3bb4]                           dc.w $0000
[000c3bb6]                           dc.w $0000
[000c3bb8] 000c3781                  dc.l BUBBLE_10
[000c3bbc]                           dc.w $0000
[000c3bbe]                           dc.w $0000
A_CHECKBOX06:
[000c3bc0] 0006323e                  dc.l A_checkbox
[000c3bc4]                           dc.w $0000
[000c3bc6]                           dc.w $0001
[000c3bc8] 000630f2                  dc.l Auo_string
[000c3bcc] 000c3941                  dc.l TEXT_13
[000c3bd0]                           dc.w $0000
[000c3bd2]                           dc.w $0000
[000c3bd4]                           dc.w $0000
[000c3bd6]                           dc.w $0000
[000c3bd8] 000c37a8                  dc.l BUBBLE_11
[000c3bdc]                           dc.w $0000
[000c3bde]                           dc.w $0000
A_CHECKBOX07:
[000c3be0] 0006323e                  dc.l A_checkbox
[000c3be4]                           dc.w $0000
[000c3be6]                           dc.w $0001
[000c3be8] 000630f2                  dc.l Auo_string
[000c3bec] 000c394c                  dc.l TEXT_14
[000c3bf0]                           dc.w $0000
[000c3bf2]                           dc.w $0000
[000c3bf4]                           dc.w $0000
[000c3bf6]                           dc.w $0000
[000c3bf8] 000c37d5                  dc.l BUBBLE_12
[000c3bfc]                           dc.w $0000
[000c3bfe]                           dc.w $0000
A_CHECKBOX08:
[000c3c00] 0006323e                  dc.l A_checkbox
[000c3c04]                           dc.w $0000
[000c3c06]                           dc.w $0001
[000c3c08] 000630f2                  dc.l Auo_string
[000c3c0c] 000c395f                  dc.l TEXT_16
[000c3c10]                           dc.w $0000
[000c3c12]                           dc.w $0000
[000c3c14]                           dc.w $0000
[000c3c16]                           dc.w $0000
[000c3c18] 000c3803                  dc.l BUBBLE_13
[000c3c1c]                           dc.w $0000
[000c3c1e]                           dc.w $0000
A_CHECKBOX09:
[000c3c20] 0006323e                  dc.l A_checkbox
[000c3c24]                           dc.w $0000
[000c3c26]                           dc.w $0001
[000c3c28] 000630f2                  dc.l Auo_string
[000c3c2c] 000c3966                  dc.l TEXT_17
[000c3c30]                           dc.w $0000
[000c3c32]                           dc.w $0000
[000c3c34]                           dc.w $0000
[000c3c36]                           dc.w $0000
[000c3c38] 000c3832                  dc.l BUBBLE_14
[000c3c3c]                           dc.w $0000
[000c3c3e]                           dc.w $0000
A_CHECKBOX10:
[000c3c40] 0006323e                  dc.l A_checkbox
[000c3c44]                           dc.w $0000
[000c3c46]                           dc.w $0001
[000c3c48] 000630f2                  dc.l Auo_string
[000c3c4c] 000c3970                  dc.l TEXT_18
[000c3c50]                           dc.w $0000
[000c3c52]                           dc.w $0000
[000c3c54]                           dc.w $0000
[000c3c56]                           dc.w $0000
[000c3c58] 000c385e                  dc.l BUBBLE_15
[000c3c5c]                           dc.w $0000
[000c3c5e]                           dc.w $0000
A_FTEXT01:
[000c3c60] 0006639a                  dc.l A_ftext
[000c3c64]                           dc.w $0001
[000c3c66]                           dc.w $000d
[000c3c68] 00066924                  dc.l Auo_ftext
[000c3c6c] 000c39bb                  dc.l extra
[000c3c70]                           dc.w $0000
[000c3c72]                           dc.w $0000
[000c3c74]                           dc.w $0000
[000c3c76]                           dc.w $0000
[000c3c78]                           dc.w $0000
[000c3c7a]                           dc.w $0000
[000c3c7c]                           dc.w $0000
[000c3c7e]                           dc.w $0000
A_INNERFRAME01:
[000c3c80] 00064256                  dc.l A_innerframe
[000c3c84]                           dc.w $1800
[000c3c86]                           dc.w $8f19
[000c3c88] 000630f2                  dc.l Auo_string
[000c3c8c] 000c3909                  dc.l TEXT_06
[000c3c90]                           dc.w $0000
[000c3c92]                           dc.w $0000
[000c3c94]                           dc.w $0000
[000c3c96]                           dc.w $0000
[000c3c98]                           dc.w $0000
[000c3c9a]                           dc.w $0000
[000c3c9c]                           dc.w $0000
[000c3c9e]                           dc.w $0000
A_INNERFRAME02:
[000c3ca0] 00064256                  dc.l A_innerframe
[000c3ca4]                           dc.w $1800
[000c3ca6]                           dc.w $8f19
[000c3ca8] 000630f2                  dc.l Auo_string
[000c3cac] 000c3912                  dc.l TEXT_07
[000c3cb0]                           dc.w $0000
[000c3cb2]                           dc.w $0000
[000c3cb4]                           dc.w $0000
[000c3cb6]                           dc.w $0000
[000c3cb8]                           dc.w $0000
[000c3cba]                           dc.w $0000
[000c3cbc]                           dc.w $0000
[000c3cbe]                           dc.w $0000
A_INNERFRAME03:
[000c3cc0] 00064256                  dc.l A_innerframe
[000c3cc4]                           dc.w $1800
[000c3cc6]                           dc.w $8f19
[000c3cc8] 000630f2                  dc.l Auo_string
[000c3ccc] 000c3952                  dc.l TEXT_15
[000c3cd0]                           dc.w $0000
[000c3cd2]                           dc.w $0000
[000c3cd4]                           dc.w $0000
[000c3cd6]                           dc.w $0000
[000c3cd8]                           dc.w $0000
[000c3cda]                           dc.w $0000
[000c3cdc]                           dc.w $0000
[000c3cde]                           dc.w $0000
A_INNERFRAME04:
[000c3ce0] 00064256                  dc.l A_innerframe
[000c3ce4]                           dc.w $1800
[000c3ce6]                           dc.w $8f19
[000c3ce8] 000630f2                  dc.l Auo_string
[000c3cec] 000c397a                  dc.l TEXT_19
[000c3cf0]                           dc.w $0000
[000c3cf2]                           dc.w $0000
[000c3cf4]                           dc.w $0000
[000c3cf6]                           dc.w $0000
[000c3cf8]                           dc.w $0000
[000c3cfa]                           dc.w $0000
[000c3cfc]                           dc.w $0000
[000c3cfe]                           dc.w $0000
A_INNERFRAME05:
[000c3d00] 00064256                  dc.l A_innerframe
[000c3d04]                           dc.w $1800
[000c3d06]                           dc.w $8f19
[000c3d08] 000630f2                  dc.l Auo_string
[000c3d0c] 000c39a1                  dc.l TEXT_22
[000c3d10]                           dc.w $0000
[000c3d12]                           dc.w $0000
[000c3d14]                           dc.w $0000
[000c3d16]                           dc.w $0000
[000c3d18]                           dc.w $0000
[000c3d1a]                           dc.w $0000
[000c3d1c]                           dc.w $0000
[000c3d1e]                           dc.w $0000
ED_FTEXT:
[000c3d20]                           dc.w $ffff
[000c3d22]                           dc.w $0001
[000c3d24]                           dc.w $0029
[000c3d26]                           dc.w $0018
[000c3d28]                           dc.w $0040
[000c3d2a]                           dc.w $0010
[000c3d2c] 000c3a60                  dc.l A_3DBUTTON06
[000c3d30]                           dc.w $0000
[000c3d32]                           dc.w $0000
[000c3d34]                           dc.w $003d
[000c3d36]                           dc.w $0017
_01_ED_FTEXT:
[000c3d38]                           dc.w $0004
[000c3d3a]                           dc.w $0002
[000c3d3c]                           dc.w $0002
[000c3d3e]                           dc.w $0018
[000c3d40]                           dc.w $0040
[000c3d42]                           dc.w $0000
[000c3d44] 000c3a00                  dc.l A_3DBUTTON01
[000c3d48]                           dc.w $0000
[000c3d4a]                           dc.w $0000
[000c3d4c]                           dc.w $0019
[000c3d4e]                           dc.w $0005
_02_ED_FTEXT:
[000c3d50]                           dc.w $0001
[000c3d52]                           dc.w $0003
[000c3d54]                           dc.w $0003
[000c3d56]                           dc.w $0014
[000c3d58]                           dc.w $0040
[000c3d5a]                           dc.w $0000
[000c3d5c]                           dc.w $00fd
[000c3d5e]                           dc.w $0170
[000c3d60]                           dc.w $0001
[000c3d62]                           dc.w $0001
[000c3d64]                           dc.w $0017
[000c3d66]                           dc.w $0003
_03_ED_FTEXT:
[000c3d68]                           dc.w $0002
[000c3d6a]                           dc.w $ffff
[000c3d6c]                           dc.w $ffff
[000c3d6e]                           dc.w $0018
[000c3d70]                           dc.w $0040
[000c3d72]                           dc.w $1000
[000c3d74] 000c3c60                  dc.l A_FTEXT01
[000c3d78]                           dc.w $0000
[000c3d7a]                           dc.w $0000
[000c3d7c]                           dc.w $0017
[000c3d7e]                           dc.w $0003
_04_ED_FTEXT:
[000c3d80]                           dc.w $0006
[000c3d82]                           dc.w $ffff
[000c3d84]                           dc.w $ffff
[000c3d86]                           dc.w $0018
[000c3d88]                           dc.w $4007
[000c3d8a]                           dc.w $0010
[000c3d8c] 000c3a40                  dc.l A_3DBUTTON05
[000c3d90]                           dc.w $001f
[000c3d92]                           dc.w $0001
[000c3d94]                           dc.w $000c
[000c3d96]                           dc.w $0002
_04aED_FTEXT:
[000c3d98] 0002b08a                  dc.l ok
[000c3d9c]                           dc.w $0000
[000c3d9e]                           dc.w $0000
[000c3da0]                           dc.w $8000
[000c3da2]                           dc.w $884f
[000c3da4]                           dc.w $0000
[000c3da6]                           dc.w $0000
[000c3da8]                           dc.w $0000
[000c3daa]                           dc.w $0000
[000c3dac]                           dc.w $0000
[000c3dae]                           dc.w $0000
_06_ED_FTEXT:
[000c3db0]                           dc.w $0008
[000c3db2]                           dc.w $ffff
[000c3db4]                           dc.w $ffff
[000c3db6]                           dc.w $0018
[000c3db8]                           dc.w $4005
[000c3dba]                           dc.w $0010
[000c3dbc] 000c3a80                  dc.l A_3DBUTTON08
[000c3dc0]                           dc.w $002e
[000c3dc2]                           dc.w $0001
[000c3dc4]                           dc.w $000c
[000c3dc6]                           dc.w $0002
_06aED_FTEXT:
[000c3dc8] 0002b064                  dc.l abort
[000c3dcc]                           dc.w $0000
[000c3dce]                           dc.w $0000
[000c3dd0]                           dc.w $8000
[000c3dd2]                           dc.w $8841
[000c3dd4]                           dc.w $0000
[000c3dd6]                           dc.w $0000
[000c3dd8]                           dc.w $0000
[000c3dda]                           dc.w $0000
[000c3ddc]                           dc.w $0000
[000c3dde]                           dc.w $0000
_08_ED_FTEXT:
[000c3de0]                           dc.w $000c
[000c3de2]                           dc.w $0009
[000c3de4]                           dc.w $0009
[000c3de6]                           dc.w $0018
[000c3de8]                           dc.w $0040
[000c3dea]                           dc.w $0000
[000c3dec] 000c3ca0                  dc.l A_INNERFRAME02
[000c3df0]                           dc.w $0001
[000c3df2]                           dc.w $0005
[000c3df4]                           dc.w $003b
[000c3df6]                           dc.w $0004
_09_ED_FTEXT:
[000c3df8]                           dc.w $0008
[000c3dfa]                           dc.w $000a
[000c3dfc]                           dc.w $000b
[000c3dfe]                           dc.w $0018
[000c3e00]                           dc.w $0040
[000c3e02]                           dc.w $0000
[000c3e04] 000c3a20                  dc.l A_3DBUTTON02
[000c3e08]                           dc.w $0001
[000c3e0a]                           dc.w $0001
[000c3e0c]                           dc.w $0039
[000c3e0e]                           dc.w $0002
_10_ED_FTEXT:
[000c3e10]                           dc.w $000b
[000c3e12]                           dc.w $ffff
[000c3e14]                           dc.w $ffff
[000c3e16]                           dc.w $0018
[000c3e18]                           dc.w $0008
[000c3e1a]                           dc.w $0000
[000c3e1c] 000c3ac0                  dc.l A_BOXED02
[000c3e20]                           dc.w $0000
[000c3e22]                           dc.w $0000
[000c3e24]                           dc.w $0039
[000c3e26]                           dc.w $0001
_11_ED_FTEXT:
[000c3e28]                           dc.w $0009
[000c3e2a]                           dc.w $ffff
[000c3e2c]                           dc.w $ffff
[000c3e2e]                           dc.w $0018
[000c3e30]                           dc.w $0008
[000c3e32]                           dc.w $0000
[000c3e34] 000c3ac0                  dc.l A_BOXED02
[000c3e38]                           dc.w $0000
[000c3e3a]                           dc.w $0001
[000c3e3c]                           dc.w $0039
[000c3e3e]                           dc.w $0001
_12_ED_FTEXT:
[000c3e40]                           dc.w $0019
[000c3e42]                           dc.w $000d
[000c3e44]                           dc.w $0017
[000c3e46]                           dc.w $0018
[000c3e48]                           dc.w $0040
[000c3e4a]                           dc.w $0000
[000c3e4c] 000c3c80                  dc.l A_INNERFRAME01
[000c3e50]                           dc.w $0001
[000c3e52]                           dc.w $0009
[000c3e54]                           dc.w $001d
[000c3e56]                           dc.w $0005
_13_ED_FTEXT:
[000c3e58]                           dc.w $000f
[000c3e5a]                           dc.w $ffff
[000c3e5c]                           dc.w $ffff
[000c3e5e]                           dc.w $0018
[000c3e60]                           dc.w $0041
[000c3e62]                           dc.w $0000
[000c3e64] 000c3b20                  dc.l A_CHECKBOX01
[000c3e68]                           dc.w $0001
[000c3e6a]                           dc.w $0001
[000c3e6c]                           dc.w $0007
[000c3e6e]                           dc.w $0001
_13aED_FTEXT:
[000c3e70] 0002b31e                  dc.l edf_effect
[000c3e74]                           dc.w $0000
[000c3e76]                           dc.w $0000
[000c3e78]                           dc.w $8000
[000c3e7a]                           dc.w $0000
[000c3e7c]                           dc.w $0000
[000c3e7e]                           dc.w $0001
[000c3e80]                           dc.w $0000
[000c3e82]                           dc.w $0000
[000c3e84]                           dc.w $0000
[000c3e86]                           dc.w $0000
_15_ED_FTEXT:
[000c3e88]                           dc.w $0011
[000c3e8a]                           dc.w $ffff
[000c3e8c]                           dc.w $ffff
[000c3e8e]                           dc.w $0018
[000c3e90]                           dc.w $0041
[000c3e92]                           dc.w $0000
[000c3e94] 000c3b40                  dc.l A_CHECKBOX02
[000c3e98]                           dc.w $0001
[000c3e9a]                           dc.w $0002
[000c3e9c]                           dc.w $0008
[000c3e9e]                           dc.w $0001
_15aED_FTEXT:
[000c3ea0] 0002b31e                  dc.l edf_effect
[000c3ea4]                           dc.w $0000
[000c3ea6]                           dc.w $0000
[000c3ea8]                           dc.w $8000
[000c3eaa]                           dc.w $0000
[000c3eac]                           dc.w $0000
[000c3eae]                           dc.w $0002
[000c3eb0]                           dc.w $0000
[000c3eb2]                           dc.w $0000
[000c3eb4]                           dc.w $0000
[000c3eb6]                           dc.w $0000
_17_ED_FTEXT:
[000c3eb8]                           dc.w $0013
[000c3eba]                           dc.w $ffff
[000c3ebc]                           dc.w $ffff
[000c3ebe]                           dc.w $0018
[000c3ec0]                           dc.w $0041
[000c3ec2]                           dc.w $0000
[000c3ec4] 000c3b60                  dc.l A_CHECKBOX03
[000c3ec8]                           dc.w $0001
[000c3eca]                           dc.w $0003
[000c3ecc]                           dc.w $0009
[000c3ece]                           dc.w $0001
_17aED_FTEXT:
[000c3ed0] 0002b31e                  dc.l edf_effect
[000c3ed4]                           dc.w $0000
[000c3ed6]                           dc.w $0000
[000c3ed8]                           dc.w $8000
[000c3eda]                           dc.w $0000
[000c3edc]                           dc.w $0000
[000c3ede]                           dc.w $0004
[000c3ee0]                           dc.w $0000
[000c3ee2]                           dc.w $0000
[000c3ee4]                           dc.w $0000
[000c3ee6]                           dc.w $0000
_19_ED_FTEXT:
[000c3ee8]                           dc.w $0015
[000c3eea]                           dc.w $ffff
[000c3eec]                           dc.w $ffff
[000c3eee]                           dc.w $0018
[000c3ef0]                           dc.w $0041
[000c3ef2]                           dc.w $0000
[000c3ef4] 000c3b80                  dc.l A_CHECKBOX04
[000c3ef8]                           dc.w $000c
[000c3efa]                           dc.w $0001
[000c3efc]                           dc.w $0010
[000c3efe]                           dc.w $0001
_19aED_FTEXT:
[000c3f00] 0002b31e                  dc.l edf_effect
[000c3f04]                           dc.w $0000
[000c3f06]                           dc.w $0000
[000c3f08]                           dc.w $8000
[000c3f0a]                           dc.w $0000
[000c3f0c]                           dc.w $0000
[000c3f0e]                           dc.w $0008
[000c3f10]                           dc.w $0000
[000c3f12]                           dc.w $0000
[000c3f14]                           dc.w $0000
[000c3f16]                           dc.w $0000
_21_ED_FTEXT:
[000c3f18]                           dc.w $0017
[000c3f1a]                           dc.w $ffff
[000c3f1c]                           dc.w $ffff
[000c3f1e]                           dc.w $0018
[000c3f20]                           dc.w $0041
[000c3f22]                           dc.w $0000
[000c3f24] 000c3ba0                  dc.l A_CHECKBOX05
[000c3f28]                           dc.w $000c
[000c3f2a]                           dc.w $0002
[000c3f2c]                           dc.w $000b
[000c3f2e]                           dc.w $0001
_21aED_FTEXT:
[000c3f30] 0002b31e                  dc.l edf_effect
[000c3f34]                           dc.w $0000
[000c3f36]                           dc.w $0000
[000c3f38]                           dc.w $8000
[000c3f3a]                           dc.w $0000
[000c3f3c]                           dc.w $0000
[000c3f3e]                           dc.w $0010
[000c3f40]                           dc.w $0000
[000c3f42]                           dc.w $0000
[000c3f44]                           dc.w $0000
[000c3f46]                           dc.w $0000
_23_ED_FTEXT:
[000c3f48]                           dc.w $000c
[000c3f4a]                           dc.w $ffff
[000c3f4c]                           dc.w $ffff
[000c3f4e]                           dc.w $0018
[000c3f50]                           dc.w $0041
[000c3f52]                           dc.w $0000
[000c3f54] 000c3bc0                  dc.l A_CHECKBOX06
[000c3f58]                           dc.w $000c
[000c3f5a]                           dc.w $0003
[000c3f5c]                           dc.w $000d
[000c3f5e]                           dc.w $0001
_23aED_FTEXT:
[000c3f60] 0002b31e                  dc.l edf_effect
[000c3f64]                           dc.w $0000
[000c3f66]                           dc.w $0000
[000c3f68]                           dc.w $8000
[000c3f6a]                           dc.w $0000
[000c3f6c]                           dc.w $0000
[000c3f6e]                           dc.w $0020
[000c3f70]                           dc.w $0000
[000c3f72]                           dc.w $0000
[000c3f74]                           dc.w $0000
[000c3f76]                           dc.w $0000
_25_ED_FTEXT:
[000c3f78]                           dc.w $0022
[000c3f7a]                           dc.w $001a
[000c3f7c]                           dc.w $0020
[000c3f7e]                           dc.w $0018
[000c3f80]                           dc.w $0040
[000c3f82]                           dc.w $0000
[000c3f84] 000c3cc0                  dc.l A_INNERFRAME03
[000c3f88]                           dc.w $001e
[000c3f8a]                           dc.w $0009
[000c3f8c]                           dc.w $001e
[000c3f8e]                           dc.w $0005
_26_ED_FTEXT:
[000c3f90]                           dc.w $001c
[000c3f92]                           dc.w $ffff
[000c3f94]                           dc.w $ffff
[000c3f96]                           dc.w $0018
[000c3f98]                           dc.w $0051
[000c3f9a]                           dc.w $0000
[000c3f9c] 000c3be0                  dc.l A_CHECKBOX07
[000c3fa0]                           dc.w $0001
[000c3fa2]                           dc.w $0001
[000c3fa4]                           dc.w $0008
[000c3fa6]                           dc.w $0001
_26aED_FTEXT:
[000c3fa8] 0002b28c                  dc.l edf_pos
[000c3fac]                           dc.w $0000
[000c3fae]                           dc.w $0000
[000c3fb0]                           dc.w $8000
[000c3fb2]                           dc.w $0000
[000c3fb4]                           dc.w $0000
[000c3fb6]                           dc.w $0001
[000c3fb8]                           dc.w $0000
[000c3fba]                           dc.w $0000
[000c3fbc]                           dc.w $0000
[000c3fbe]                           dc.w $0000
_28_ED_FTEXT:
[000c3fc0]                           dc.w $001e
[000c3fc2]                           dc.w $ffff
[000c3fc4]                           dc.w $ffff
[000c3fc6]                           dc.w $0018
[000c3fc8]                           dc.w $0051
[000c3fca]                           dc.w $0000
[000c3fcc] 000c3c20                  dc.l A_CHECKBOX09
[000c3fd0]                           dc.w $0001
[000c3fd2]                           dc.w $0002
[000c3fd4]                           dc.w $000c
[000c3fd6]                           dc.w $0001
_28aED_FTEXT:
[000c3fd8] 0002b28c                  dc.l edf_pos
[000c3fdc]                           dc.w $0000
[000c3fde]                           dc.w $0000
[000c3fe0]                           dc.w $8000
[000c3fe2]                           dc.w $0000
[000c3fe4]                           dc.w $0000
[000c3fe6]                           dc.w $0000
[000c3fe8]                           dc.w $0000
[000c3fea]                           dc.w $0000
[000c3fec]                           dc.w $0000
[000c3fee]                           dc.w $0000
_30_ED_FTEXT:
[000c3ff0]                           dc.w $0020
[000c3ff2]                           dc.w $ffff
[000c3ff4]                           dc.w $ffff
[000c3ff6]                           dc.w $0018
[000c3ff8]                           dc.w $0051
[000c3ffa]                           dc.w $0000
[000c3ffc] 000c3c40                  dc.l A_CHECKBOX10
[000c4000]                           dc.w $0010
[000c4002]                           dc.w $0002
[000c4004]                           dc.w $000c
[000c4006]                           dc.w $0001
_30aED_FTEXT:
[000c4008] 0002b28c                  dc.l edf_pos
[000c400c]                           dc.w $0000
[000c400e]                           dc.w $0000
[000c4010]                           dc.w $8000
[000c4012]                           dc.w $0000
[000c4014]                           dc.w $0000
[000c4016]                           dc.w $0003
[000c4018]                           dc.w $0000
[000c401a]                           dc.w $0000
[000c401c]                           dc.w $0000
[000c401e]                           dc.w $0000
_32_ED_FTEXT:
[000c4020]                           dc.w $0019
[000c4022]                           dc.w $ffff
[000c4024]                           dc.w $ffff
[000c4026]                           dc.w $0018
[000c4028]                           dc.w $0051
[000c402a]                           dc.w $0000
[000c402c] 000c3c00                  dc.l A_CHECKBOX08
[000c4030]                           dc.w $0010
[000c4032]                           dc.w $0001
[000c4034]                           dc.w $0009
[000c4036]                           dc.w $0001
_32aED_FTEXT:
[000c4038] 0002b28c                  dc.l edf_pos
[000c403c]                           dc.w $0000
[000c403e]                           dc.w $0000
[000c4040]                           dc.w $8000
[000c4042]                           dc.w $0000
[000c4044]                           dc.w $0000
[000c4046]                           dc.w $0002
[000c4048]                           dc.w $0000
[000c404a]                           dc.w $0000
[000c404c]                           dc.w $0000
[000c404e]                           dc.w $0000
_34_ED_FTEXT:
[000c4050]                           dc.w $0029
[000c4052]                           dc.w $0023
[000c4054]                           dc.w $0028
[000c4056]                           dc.w $0018
[000c4058]                           dc.w $0040
[000c405a]                           dc.w $0000
[000c405c] 000c3d00                  dc.l A_INNERFRAME05
[000c4060]                           dc.w $0001
[000c4062]                           dc.w $000e
[000c4064]                           dc.w $003b
[000c4066]                           dc.w $0004
_35_ED_FTEXT:
[000c4068]                           dc.w $0025
[000c406a]                           dc.w $ffff
[000c406c]                           dc.w $ffff
[000c406e]                           dc.w $0018
[000c4070]                           dc.w $0005
[000c4072]                           dc.w $0000
[000c4074] 000c3aa0                  dc.l A_3DBUTTON09
[000c4078]                           dc.w $0001
[000c407a]                           dc.w $0001
[000c407c]                           dc.w $000c
[000c407e]                           dc.w $0002
_35aED_FTEXT:
[000c4080] 0002b198                  dc.l font_sel
[000c4084]                           dc.w $0000
[000c4086]                           dc.w $0000
[000c4088]                           dc.w $8000
[000c408a]                           dc.w $8853
[000c408c]                           dc.w $0000
[000c408e]                           dc.w $0000
[000c4090]                           dc.w $0000
[000c4092]                           dc.w $0000
[000c4094]                           dc.w $0000
[000c4096]                           dc.w $0000
_37_ED_FTEXT:
[000c4098]                           dc.w $0026
[000c409a]                           dc.w $ffff
[000c409c]                           dc.w $ffff
[000c409e]                           dc.w $001c
[000c40a0]                           dc.w $0040
[000c40a2]                           dc.w $0000
[000c40a4] 000c3903                  dc.l TEXT_05
[000c40a8]                           dc.w $000f
[000c40aa]                           dc.w $0001
[000c40ac]                           dc.w $0005
[000c40ae]                           dc.w $0001
_38_ED_FTEXT:
[000c40b0]                           dc.w $0027
[000c40b2]                           dc.w $ffff
[000c40b4]                           dc.w $ffff
[000c40b6]                           dc.w $001c
[000c40b8]                           dc.w $0040
[000c40ba]                           dc.w $0000
[000c40bc] 000c38fd                  dc.l TEXT_04
[000c40c0]                           dc.w $000f
[000c40c2]                           dc.w $0002
[000c40c4]                           dc.w $0005
[000c40c6]                           dc.w $0001
_39_ED_FTEXT:
[000c40c8]                           dc.w $0028
[000c40ca]                           dc.w $ffff
[000c40cc]                           dc.w $ffff
[000c40ce]                           dc.w $001c
[000c40d0]                           dc.w $0040
[000c40d2]                           dc.w $0000
[000c40d4] 000c38de                  dc.l TEXT_03
[000c40d8]                           dc.w $0015
[000c40da]                           dc.w $0001
[000c40dc]                           dc.w $001e
[000c40de]                           dc.w $0001
_40_ED_FTEXT:
[000c40e0]                           dc.w $0022
[000c40e2]                           dc.w $ffff
[000c40e4]                           dc.w $ffff
[000c40e6]                           dc.w $001c
[000c40e8]                           dc.w $0040
[000c40ea]                           dc.w $0000
[000c40ec] 000c38d8                  dc.l TEXT_02
[000c40f0]                           dc.w $0015
[000c40f2]                           dc.w $0002
[000c40f4]                           dc.w $0005
[000c40f6]                           dc.w $0001
_41_ED_FTEXT:
[000c40f8]                           dc.w $0000
[000c40fa]                           dc.w $002a
[000c40fc]                           dc.w $002d
[000c40fe]                           dc.w $0018
[000c4100]                           dc.w $0040
[000c4102]                           dc.w $0000
[000c4104] 000c3ce0                  dc.l A_INNERFRAME04
[000c4108]                           dc.w $0001
[000c410a]                           dc.w $0012
[000c410c]                           dc.w $003b
[000c410e]                           dc.w $0005
_42_ED_FTEXT:
[000c4110]                           dc.w $002b
[000c4112]                           dc.w $ffff
[000c4114]                           dc.w $ffff
[000c4116]                           dc.w $001c
[000c4118]                           dc.w $0000
[000c411a]                           dc.w $0000
[000c411c] 000c3984                  dc.l TEXT_20
[000c4120]                           dc.w $0001
[000c4122]                           dc.w $0001
[000c4124]                           dc.w $000e
[000c4126]                           dc.w $0001
_43_ED_FTEXT:
[000c4128]                           dc.w $002c
[000c412a]                           dc.w $ffff
[000c412c]                           dc.w $ffff
[000c412e]                           dc.w $0018
[000c4130]                           dc.w $0008
[000c4132]                           dc.w $0010
[000c4134] 000c3ae0                  dc.l A_BOXED04
[000c4138]                           dc.w $0010
[000c413a]                           dc.w $0001
[000c413c]                           dc.w $002a
[000c413e]                           dc.w $0001
_44_ED_FTEXT:
[000c4140]                           dc.w $002d
[000c4142]                           dc.w $ffff
[000c4144]                           dc.w $ffff
[000c4146]                           dc.w $001c
[000c4148]                           dc.w $0000
[000c414a]                           dc.w $0000
[000c414c] 000c3993                  dc.l TEXT_21
[000c4150]                           dc.w $0001
[000c4152]                           dc.w $0003
[000c4154]                           dc.w $000d
[000c4156]                           dc.w $0001
_45_ED_FTEXT:
[000c4158]                           dc.w $0029
[000c415a]                           dc.w $ffff
[000c415c]                           dc.w $ffff
[000c415e]                           dc.w $0018
[000c4160]                           dc.w $0028
[000c4162]                           dc.w $0010
[000c4164] 000c3b00                  dc.l A_BOXED05
[000c4168]                           dc.w $0010
[000c416a]                           dc.w $0003
[000c416c]                           dc.w $002a
[000c416e]                           dc.w $0001
ftext:
[000c4170] 0006639a                  dc.l A_ftext
[000c4174]                           dc.w $0001
[000c4176]                           dc.w $000d
[000c4178] 00066924                  dc.l Auo_ftext
[000c417c] 000c4270                  dc.l $000c4270
[000c4180]                           dc.w $0000
[000c4182]                           dc.w $0000
[000c4184]                           dc.w $0000
[000c4186]                           dc.w $0000
[000c4188]                           dc.w $0000
[000c418a]                           dc.w $0000
[000c418c]                           dc.w $0000
[000c418e]                           dc.w $0000
visual:
[000c4190]                           dc.w $ffff
[000c4192]                           dc.w $ffff
[000c4194]                           dc.w $ffff
[000c4196]                           dc.w $0018
[000c4198]                           dc.w $0000
[000c419a]                           dc.w $0010
[000c419c] 000c4170                  dc.l ftext
[000c41a0]                           dc.w $0000
[000c41a2]                           dc.w $0000
[000c41a4]                           dc.w $000a
[000c41a6]                           dc.w $0002
logical:
[000c41a8]                           dc.w $ffff
[000c41aa]                           dc.w $ffff
[000c41ac]                           dc.w $ffff
[000c41ae]                           dc.w $0018
[000c41b0]                           dc.w $0040
[000c41b2]                           dc.w $0000
[000c41b4]                           dc.w $0000
[000c41b6]                           dc.w $0000
[000c41b8]                           dc.w $0000
[000c41ba]                           dc.w $0000
[000c41bc]                           dc.w $0005
[000c41be]                           dc.w $0002
aud:
[000c41c0] 000c4285                  dc.l $000c4285
[000c41c4] 000c428e                  dc.l $000c428e
[000c41c8]                           dc.w $0002
[000c41ca] 000c4298                  dc.l $000c4298
[000c41ce]                           dc.w $0000
[000c41d0]                           dc.w $0000
[000c41d2]                           dc.w $0000
[000c41d4]                           dc.w $0000
[000c41d6]                           dc.w $0000
[000c41d8]                           dc.w $0000
[000c41da]                           dc.w $0000
[000c41dc]                           dc.w $0000
[000c41de]                           dc.w $0000
[000c41e0]                           dc.w $0000
[000c41e2]                           dc.w $0000
[000c41e4]                           dc.w $0000
[000c41e6]                           dc.w $0000
[000c41e8]                           dc.w $0000
[000c41ea]                           dc.w $0000
[000c41ec]                           dc.w $0000
data:
[000c41ee]                           dc.b 'A_ftext',0
[000c41f6]                           dc.w $0000
[000c41f8]                           dc.w $0000
[000c41fa]                           dc.w $0000
[000c41fc]                           dc.w $0000
[000c41fe]                           dc.w $0000
[000c4200]                           dc.w $0000
[000c4202]                           dc.w $0000
[000c4204]                           dc.w $0000
[000c4206]                           dc.w $0000
[000c4208]                           dc.w $0000
[000c420a]                           dc.w $0000
[000c420c]                           dc.w $0000
[000c420e] 0002acdc                  dc.l object_tree
[000c4212] 0002afe2                  dc.l test_it
[000c4216] 0002b08a                  dc.l ok
[000c421a] 0004f20a                  dc.l Aob_delete
[000c421e] 000c4190                  dc.l visual
[000c4222] 000c41a8                  dc.l logical
[000c4226] 000c41c0                  dc.l aud
[000c422a] 0002acc2                  dc.l minsize
[000c422e]                           dc.w $0000
[000c4230]                           dc.w $0000
[000c4232] 000c39f8                  dc.l title
[000c4236] 000c39e7                  dc.l help_title
[000c423a]                           dc.w $0000
[000c423c]                           dc.w $0000
[000c423e]                           dc.w $0000
[000c4240]                           dc.w $0000
[000c4242]                           dc.w $0000
[000c4244]                           dc.w $0000
[000c4246]                           dc.w $0000
[000c4248]                           dc.w $0000
[000c424a]                           dc.w $0000
[000c424c]                           dc.w $0000
[000c424e]                           dc.w $0000
[000c4250]                           dc.w $0000
[000c4252]                           dc.w $0000
[000c4254]                           dc.w $0000
[000c4256]                           dc.w $0000
[000c4258]                           dc.w $0000
[000c425a]                           dc.w $0000
[000c425c]                           dc.w $0000
[000c425e]                           dc.w $0000
[000c4260]                           dc.w $0000
[000c4262]                           dc.w $0000
[000c4264]                           dc.w $0000
[000c4266]                           dc.w $0000
[000c4268]                           dc.w $0000
[000c426a]                           dc.w $0000
[000c426c]                           dc.w $0000
[000c426e]                           dc.w $0000
[000c4270]                           dc.b 'Guten Tag mit ACSpro',0
[000c4285]                           dc.b '0x1000DL',0
[000c428e]                           dc.b 'Auo_ftext',0
[000c4298]                           dc.b 'Guten Tag',0
[000c42a2]                           dc.b '0x%lxL',0
[000c42a9]                           dc.b '%-30s',0
[000c42af]                           dc.b '%-5d',0
[000c42b4]                           dc.b '%-*s',0
[000c42b9]                           dc.b $00
