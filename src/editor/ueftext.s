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
