Aev_InitBubble:
[000605be] 554f                      subq.w     #2,a7
[000605c0] 7008                      moveq.l    #8,d0
[000605c2] c079 000a 8436            and.w      $000A8436,d0
[000605c8] 6706                      beq.s      Aev_InitBubble_1
[000605ca] 4eb9 0006 063c            jsr        FindBubbleGEM
Aev_InitBubble_1:
[000605d0] 4eb9 0006 060a            jsr        CreateBubbleString
[000605d6] 3e80                      move.w     d0,(a7)
[000605d8] 4279 000e 1a92            clr.w      phase
[000605de] 3017                      move.w     (a7),d0
[000605e0] 544f                      addq.w     #2,a7
[000605e2] 4e75                      rts

Aev_ExitBubble:
[000605e4] 33fc 0001 000e 1a92       move.w     #$0001,phase
[000605ec] 2039 000e 1a8e            move.l     bubble_string,d0
[000605f2] 670c                      beq.s      Aev_ExitBubble_1
[000605f4] 2079 000e 1a8e            movea.l    bubble_string,a0
[000605fa] 4eb9 0004 c9da            jsr        Ax_glfree
Aev_ExitBubble_1:
[00060600] 42b9 000e 1a8e            clr.l      bubble_string
[00060606] 7001                      moveq.l    #1,d0
[00060608] 4e75                      rts

CreateBubbleString:
[0006060a] 2039 000e 1a8e            move.l     bubble_string,d0
[00060610] 6626                      bne.s      CreateBubbleString_1
[00060612] 203c 0000 0100            move.l     #$00000100,d0
[00060618] 4eb9 0004 c95e            jsr        Ax_glmalloc
[0006061e] 23c8 000e 1a8e            move.l     a0,bubble_string
[00060624] 2039 000e 1a8e            move.l     bubble_string,d0
[0006062a] 6604                      bne.s      CreateBubbleString_2
[0006062c] 4240                      clr.w      d0
[0006062e] 4e75                      rts
CreateBubbleString_2:
CreateBubbleString_1:

[00060630] 2079 000e 1a8e            movea.l    bubble_string,a0
[00060636] 4210                      clr.b      (a0)
[00060638] 7001                      moveq.l    #1,d0
[0006063a] 4e75                      rts

FindBubbleGEM:
[0006063c] 514f                      subq.w     #8,a7
[0006063e] 2279 000e 692a            movea.l    _globl,a1
[00060644] 41f9 000e 1a94            lea.l      $000E1A94,a0
[0006064a] 4eb9 0007 8b56            jsr        mt_appl_find
[00060650] 3f40 0006                 move.w     d0,6(a7)
[00060654] 302f 0006                 move.w     6(a7),d0
[00060658] 6a00 0088                 bpl        FindBubbleGEM_1
[0006065c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00060662] 3028 0238                 move.w     568(a0),d0
[00060666] 6700 007a                 beq.w      FindBubbleGEM_1
[0006066a] 41f9 000e 1a9d            lea.l      $000E1A9D,a0
[00060670] 4eb9 0005 be00            jsr        Ash_getenv
[00060676] 2e88                      move.l     a0,(a7)
[00060678] 2017                      move.l     (a7),d0
[0006067a] 6766                      beq.s      FindBubbleGEM_1
[0006067c] 2057                      movea.l    (a7),a0
[0006067e] 1010                      move.b     (a0),d0
[00060680] 6760                      beq.s      FindBubbleGEM_1
[00060682] 2079 0010 ee4e            movea.l    ACSblk,a0
[00060688] 2f28 028c                 move.l     652(a0),-(a7)
[0006068c] 43f9 000e 1aa7            lea.l      $000E1AA7,a1
[00060692] 206f 0004                 movea.l    4(a7),a0
[00060696] 4eb9 0005 5e98            jsr        Ash_prog
[0006069c] 584f                      addq.w     #4,a7
[0006069e] 426f 0004                 clr.w      4(a7)
[000606a2] 6028                      bra.s      FindBubbleGEM_2
[000606a4] 2079 000e 692a            movea.l    _globl,a0
FindBubbleGEM_3:
[000606aa] 7064                      moveq.l    #100,d0
[000606ac] 4eb9 0007 91d4            jsr        mt_evnt_timer
[000606b2] 2279 000e 692a            movea.l    _globl,a1
[000606b8] 41f9 000e 1aa8            lea.l      $000E1AA8,a0
[000606be] 4eb9 0007 8b56            jsr        mt_appl_find
[000606c4] 3f40 0006                 move.w     d0,6(a7)
[000606c8] 526f 0004                 addq.w     #1,4(a7)
FindBubbleGEM_2:
[000606cc] 3039 000e 1a92            move.w     phase,d0
[000606d2] 660e                      bne.s      FindBubbleGEM_1
[000606d4] 302f 0006                 move.w     6(a7),d0
[000606d8] 6a08                      bpl.s      FindBubbleGEM_1
[000606da] 0c6f 001e 0004            cmpi.w     #$001E,4(a7)
[000606e0] 6dc2                      blt.s      FindBubbleGEM_3
FindBubbleGEM_1:
[000606e2] 302f 0006                 move.w     6(a7),d0
[000606e6] 504f                      addq.w     #8,a7
[000606e8] 4e75                      rts

Aev_GetAckBubbleGEM:
[000606ea] 514f                      subq.w     #8,a7
[000606ec] 2f48 0004                 move.l     a0,4(a7)
[000606f0] 206f 0004                 movea.l    4(a7),a0
[000606f4] 2e90                      move.l     (a0),(a7)
[000606f6] 2057                      movea.l    (a7),a0
[000606f8] 2f08                      move.l     a0,-(a7)
[000606fa] 6100 ff40                 bsr        FindBubbleGEM
[000606fe] 205f                      movea.l    (a7)+,a0
[00060700] b068 0002                 cmp.w      2(a0),d0
[00060704] 6622                      bne.s      Aev_GetAckBubbleGEM_1
[00060706] 6100 ff02                 bsr        CreateBubbleString
[0006070a] 4a40                      tst.w      d0
[0006070c] 6716                      beq.s      Aev_GetAckBubbleGEM_2
[0006070e] 2057                      movea.l    (a7),a0
[00060710] 2068 0006                 movea.l    6(a0),a0
[00060714] b1f9 000e 1a8e            cmpa.l     bubble_string,a0
[0006071a] 6608                      bne.s      Aev_GetAckBubbleGEM_2
[0006071c] 2079 000e 1a8e            movea.l    bubble_string,a0
[00060722] 4210                      clr.b      (a0)
Aev_GetAckBubbleGEM_2:
[00060724] 7001                      moveq.l    #1,d0
[00060726] 6002                      bra.s      Aev_GetAckBubbleGEM_3
Aev_GetAckBubbleGEM_1:
[00060728] 4240                      clr.w      d0
Aev_GetAckBubbleGEM_3:
[0006072a] 504f                      addq.w     #8,a7
[0006072c] 4e75                      rts

Aev_GetRequestBubbleGEM:
[0006072e] 594f                      subq.w     #4,a7
[00060730] 2e88                      move.l     a0,(a7)
[00060732] 2057                      movea.l    (a7),a0
[00060734] 3228 0006                 move.w     6(a0),d1
[00060738] 2057                      movea.l    (a7),a0
[0006073a] 3028 0004                 move.w     4(a0),d0
[0006073e] 2057                      movea.l    (a7),a0
[00060740] 2068 000c                 movea.l    12(a0),a0
[00060744] 4eb9 0005 b292            jsr        Awi_bubblegem
[0006074a] 584f                      addq.w     #4,a7
[0006074c] 4e75                      rts

Aev_ShowBubbleGEM:
[0006074e] 4fef ffe2                 lea.l      -30(a7),a7
[00060752] 2f48 001a                 move.l     a0,26(a7)
[00060756] 3f40 0018                 move.w     d0,24(a7)
[0006075a] 3f41 0016                 move.w     d1,22(a7)
[0006075e] 206f 001a                 movea.l    26(a7),a0
[00060762] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00060768] 4a40                      tst.w      d0
[0006076a] 6706                      beq.s      Aev_ShowBubbleGEM_1
[0006076c] 7001                      moveq.l    #1,d0
[0006076e] 6000 00f6                 bra        Aev_ShowBubbleGEM_2
Aev_ShowBubbleGEM_1:
[00060772] 6100 fec8                 bsr        FindBubbleGEM
[00060776] 3f40 0014                 move.w     d0,20(a7)
[0006077a] 302f 0014                 move.w     20(a7),d0
[0006077e] 6b00 00e4                 bmi        Aev_ShowBubbleGEM_3
[00060782] 2079 0010 ee4e            movea.l    ACSblk,a0
[00060788] 302f 0014                 move.w     20(a7),d0
[0006078c] b050                      cmp.w      (a0),d0
[0006078e] 6700 00d4                 beq        Aev_ShowBubbleGEM_3
[00060792] 6100 fe76                 bsr        CreateBubbleString
[00060796] 4a40                      tst.w      d0
[00060798] 6606                      bne.s      Aev_ShowBubbleGEM_4
[0006079a] 4240                      clr.w      d0
[0006079c] 6000 00c8                 bra        Aev_ShowBubbleGEM_2
Aev_ShowBubbleGEM_4:
[000607a0] 206f 001a                 movea.l    26(a7),a0
[000607a4] 4eb9 0008 2f6c            jsr        strlen
[000607aa] 2f40 0010                 move.l     d0,16(a7)
[000607ae] 0caf 0000 00ff 0010       cmpi.l     #$000000FF,16(a7)
[000607b6] 6f08                      ble.s      Aev_ShowBubbleGEM_5
[000607b8] 2f7c 0000 00ff 0010       move.l     #$000000FF,16(a7)
Aev_ShowBubbleGEM_5:
[000607c0] 302f 0012                 move.w     18(a7),d0
[000607c4] 48c0                      ext.l      d0
[000607c6] 226f 001a                 movea.l    26(a7),a1
[000607ca] 2079 000e 1a8e            movea.l    bubble_string,a0
[000607d0] 4eb9 0008 2fd6            jsr        strncpy
[000607d6] 302f 0012                 move.w     18(a7),d0
[000607da] 2079 000e 1a8e            movea.l    bubble_string,a0
[000607e0] 4230 0000                 clr.b      0(a0,d0.w)
[000607e4] 3ebc babb                 move.w     #$BABB,(a7)
[000607e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000607ee] 3f50 0002                 move.w     (a0),2(a7)
[000607f2] 426f 0004                 clr.w      4(a7)
[000607f6] 302f 0018                 move.w     24(a7),d0
[000607fa] 6b06                      bmi.s      Aev_ShowBubbleGEM_6
[000607fc] 302f 0018                 move.w     24(a7),d0
[00060800] 600a                      bra.s      Aev_ShowBubbleGEM_7
Aev_ShowBubbleGEM_6:
[00060802] 2079 0010 ee4e            movea.l    ACSblk,a0
[00060808] 3028 0262                 move.w     610(a0),d0
Aev_ShowBubbleGEM_7:
[0006080c] 3f40 0006                 move.w     d0,6(a7)
[00060810] 302f 0016                 move.w     22(a7),d0
[00060814] 6b06                      bmi.s      Aev_ShowBubbleGEM_8
[00060816] 302f 0016                 move.w     22(a7),d0
[0006081a] 600a                      bra.s      Aev_ShowBubbleGEM_9
Aev_ShowBubbleGEM_8:
[0006081c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00060822] 3028 0264                 move.w     612(a0),d0
Aev_ShowBubbleGEM_9:
[00060826] 3f40 0008                 move.w     d0,8(a7)
[0006082a] 4eb9 0006 c076            jsr        A_isModDia
[00060830] 4a40                      tst.w      d0
[00060832] 6704                      beq.s      Aev_ShowBubbleGEM_10
[00060834] 7001                      moveq.l    #1,d0
[00060836] 6002                      bra.s      Aev_ShowBubbleGEM_11
Aev_ShowBubbleGEM_10:
[00060838] 4240                      clr.w      d0
Aev_ShowBubbleGEM_11:
[0006083a] 3f40 000e                 move.w     d0,14(a7)
[0006083e] 2f79 000e 1a8e 000a       move.l     bubble_string,10(a7)
[00060846] 74ff                      moveq.l    #-1,d2
[00060848] 93c9                      suba.l     a1,a1
[0006084a] 41d7                      lea.l      (a7),a0
[0006084c] 7204                      moveq.l    #4,d1
[0006084e] 302f 0014                 move.w     20(a7),d0
[00060852] 4eb9 0005 d902            jsr        Aev_SendMsg
[00060858] 4a40                      tst.w      d0
[0006085a] 6704                      beq.s      Aev_ShowBubbleGEM_12
[0006085c] 7001                      moveq.l    #1,d0
[0006085e] 6002                      bra.s      Aev_ShowBubbleGEM_13
Aev_ShowBubbleGEM_12:
[00060860] 4240                      clr.w      d0
Aev_ShowBubbleGEM_13:
[00060862] 6002                      bra.s      Aev_ShowBubbleGEM_2
Aev_ShowBubbleGEM_3:
[00060864] 4240                      clr.w      d0
Aev_ShowBubbleGEM_2:
[00060866] 4fef 001e                 lea.l      30(a7),a7
[0006086a] 4e75                      rts

	.data

bubble_string:
[000e1a8e]                           dc.w $0000
[000e1a90]                           dc.w $0000
phase:
[000e1a92]                           dc.w $ffff
[000e1a94]                           dc.b 'BUBBLE  ',0
[000e1a9d]                           dc.b 'BUBBLEGEM',0
[000e1aa7]                           dc.b $00
[000e1aa8]                           dc.b 'BUBBLE  ',0
[000e1ab1]                           dc.b $00
