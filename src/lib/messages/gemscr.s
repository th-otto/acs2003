	.globl Aev_InitGEMScript
Aev_InitGEMScript:
		moveq.l    #12,d0
		jsr        Ax_glmalloc
		move.l     a0,gs_infodata
		move.l     gs_infodata,d0
		bne.s      Aev_InitGEMScript_1
		clr.w      d0
		rts
Aev_InitGEMScript_1:
		movea.l    gs_infodata,a0
		move.l     #$0000000C,(a0)
		movea.l    gs_infodata,a0
		move.w     #$0120,4(a0)
		movea.l    gs_infodata,a0
		move.w     #$0009,6(a0)
		movea.l    gs_infodata,a0
		clr.l      8(a0)
		jsr        Alu_create
		move.l     a0,gs_connect
		move.l     gs_connect,d0
		bne.s      Aev_InitGEMScript_2
		clr.w      d0
		rts
Aev_InitGEMScript_2:
		movea.l    gs_connect,a0
		move.l     #ClearConnect,4(a0)
		moveq.l    #1,d0
		rts

	.globl Aev_ExitGEMScript
Aev_ExitGEMScript:
		movea.l    gs_connect,a0
		jsr        Alu_delete
		clr.l      gs_connect
		move.l     gs_infodata,d0
		beq.s      Aev_ExitGEMScript_1
		movea.l    gs_infodata,a0
		jsr        Ax_glfree
Aev_ExitGEMScript_1:
		clr.l      gs_infodata
		moveq.l    #1,d0
		rts

CmpIDKanal:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.w     (a0),d0
		movea.l    (a7),a0
		cmp.w      (a0),d0
		bne.s      CmpIDKanal_1
		movea.l    4(a7),a0
		move.w     2(a0),d0
		movea.l    (a7),a0
		cmp.w      14(a0),d0
		bne.s      CmpIDKanal_1
		moveq.l    #1,d0
		bra.s      CmpIDKanal_2
CmpIDKanal_1:
		clr.w      d0
CmpIDKanal_2:
		addq.w     #8,a7
		rts

SetStatus:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    4(a7),a0
		move.w     6(a0),d0
		beq.s      SetStatus_1
		movea.l    4(a7),a0
		move.w     4(a0),d0
		movea.l    (a7),a0
		or.w       d0,16(a0)
		bra.s      SetStatus_2
SetStatus_1:
		movea.l    4(a7),a0
		move.w     4(a0),d0
		not.w      d0
		movea.l    (a7),a0
		and.w      d0,16(a0)
SetStatus_2:
		addq.w     #8,a7
		rts

SendGsAck:
		move.l     a2,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		movea.l    4(a7),a0
		move.l     16(a0),d0
		beq.s      SendGsAck_1
		moveq.l    #1,d1
		movea.l    4(a7),a0
		move.w     20(a0),d0
		movea.l    4(a7),a0
		movea.l    16(a0),a0
		jsr        Ast_mergeASCIIZZ
		move.l     a0,(a7)
		bra.s      SendGsAck_2
SendGsAck_1:
		moveq.l    #3,d0
		jsr        Ax_glmalloc
		move.l     a0,(a7)
		lea.l      xe1af6,a1
		movea.l    (a7),a0
		jsr        strcpy
SendGsAck_2:
		movea.l    (a7),a1
		movea.l    4(a7),a0
		move.w     22(a0),d0
		movea.l    4(a7),a0
		jsr        Aev_GSAck
		movea.l    (a7),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    12(a2),a2
		jsr        (a2)
		addq.w     #8,a7
		movea.l    (a7)+,a2
		rts

ClearConnect:
		subq.w     #4,a7
		move.l     a0,(a7)
		moveq.l    #2,d0
		movea.l    (a7),a0
		and.w      16(a0),d0
		bne.s      ClearConnect_1
		movea.l    (a7),a0
		jsr        Aev_GSQuit
ClearConnect_1:
		moveq.l    #18,d0
		movea.l    (a7),a0
		jsr        Ax_recycle
		addq.w     #4,a7
		rts

ParseGSCommands:
		lea.l      -36(a7),a7
		move.l     a0,32(a7)
		move.l     a1,28(a7)
		clr.w      2(a7)
		clr.w      (a7)
		pea.l      (a7)
		lea.l      8(a7),a1
		movea.l    36(a7),a0
		jsr        Ast_splitASCIIZZ
		addq.w     #4,a7
		tst.w      d0
		beq        ParseGSCommands_1
		move.w     (a7),d0
		ble        ParseGSCommands_1
		clr.w      26(a7)
		move.l     4(a7),12(a7)
		bra        ParseGSCommands_2
ParseGSCommands_15:
		movea.l    12(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		ext.w      d0
		lea.l      xe1af9,a0
		jsr        strchr
		move.l     a0,d0
		beq        ParseGSCommands_3
		movea.l    12(a7),a0
		movea.l    (a0),a0
		move.b     (a0),d0
		ext.w      d0
		subq.w     #1,d0
		beq.s      ParseGSCommands_4
		subq.w     #1,d0
		beq.s      ParseGSCommands_5
		bra        ParseGSCommands_6
ParseGSCommands_4:
		movea.l    12(a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		lea.l      xe1b00,a0
		jsr        Ast_create
		movea.l    12(a7),a1
		move.l     a0,(a1)
		bra        ParseGSCommands_3
ParseGSCommands_5:
		movea.l    12(a7),a0
		movea.l    (a0),a0
		jsr        strlen
		subq.w     #1,d0
		move.w     d0,2(a7)
		move.w     2(a7),d0
		asr.w      #1,d0
		moveq.l    #1,d1
		and.w      2(a7),d1
		add.w      d1,d0
		move.w     d0,2(a7)
		moveq.l    #1,d0
		add.w      2(a7),d0
		ext.l      d0
		jsr        Ax_malloc
		move.l     a0,8(a7)
		move.l     8(a7),d0
		beq        ParseGSCommands_7
		clr.w      24(a7)
		movea.l    12(a7),a0
		movea.l    (a0),a0
		addq.w     #1,a0
		move.l     a0,20(a7)
		move.l     8(a7),16(a7)
		bra        ParseGSCommands_8
ParseGSCommands_14:
		movea.l    20(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isdigit
		tst.w      d0
		beq.s      ParseGSCommands_9
		moveq.l    #-48,d0
		movea.l    20(a7),a0
		add.b      (a0),d0
		movea.l    16(a7),a0
		move.b     d0,(a0)
		bra.s      ParseGSCommands_10
ParseGSCommands_9:
		movea.l    20(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isxdigit
		tst.w      d0
		beq.s      ParseGSCommands_10
		movea.l    20(a7),a0
		move.b     (a0),d0
		jsr        Ach_toupper
		/* add.b      #$C9,d0 */
		dc.w 0xd03c,0xffc9
		movea.l    16(a7),a0
		move.b     d0,(a0)
ParseGSCommands_10:
		addq.l     #1,20(a7)
		movea.l    20(a7),a0
		move.b     (a0),d0
		beq.s      ParseGSCommands_11
		movea.l    16(a7),a0
		move.b     (a0),d0
		lsl.b      #4,d0
		move.b     d0,(a0)
		movea.l    20(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isdigit
		tst.w      d0
		beq.s      ParseGSCommands_12
		moveq.l    #-48,d0
		movea.l    20(a7),a0
		add.b      (a0),d0
		movea.l    16(a7),a0
		or.b       d0,(a0)
		bra.s      ParseGSCommands_11
ParseGSCommands_12:
		movea.l    20(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isxdigit
		tst.w      d0
		beq.s      ParseGSCommands_11
		movea.l    20(a7),a0
		move.b     (a0),d0
		jsr        Ach_toupper
		/* add.b      #$C9,d0 */
		dc.w 0xd03c,0xffc9
		movea.l    16(a7),a0
		or.b       d0,(a0)
ParseGSCommands_11:
		addq.l     #1,16(a7)
		addq.l     #1,20(a7)
		addq.w     #1,24(a7)
ParseGSCommands_8:
		movea.l    20(a7),a0
		move.b     (a0),d0
		beq.s      ParseGSCommands_13
		move.w     24(a7),d0
		cmp.w      2(a7),d0
		blt        ParseGSCommands_14
ParseGSCommands_13:
		movea.l    16(a7),a0
		clr.b      (a0)
ParseGSCommands_7:
		movea.l    12(a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		movea.l    12(a7),a0
		move.l     8(a7),(a0)
		bra.s      ParseGSCommands_3
ParseGSCommands_6:
		movea.l    12(a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
		movea.l    12(a7),a0
		clr.l      (a0)
ParseGSCommands_3:
		addq.w     #1,26(a7)
		addq.l     #4,12(a7)
ParseGSCommands_2:
		move.w     26(a7),d0
		cmp.w      (a7),d0
		blt        ParseGSCommands_15
		clr.w      2(a7)
		clr.w      26(a7)
		move.l     4(a7),12(a7)
		bra.s      ParseGSCommands_16
ParseGSCommands_18:
		movea.l    12(a7),a0
		move.l     (a0),d0
		beq.s      ParseGSCommands_17
		addq.w     #1,2(a7)
ParseGSCommands_17:
		addq.w     #1,26(a7)
		addq.l     #4,12(a7)
ParseGSCommands_16:
		move.w     26(a7),d0
		cmp.w      (a7),d0
		blt.s      ParseGSCommands_18
		move.w     2(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		movea.l    28(a7),a1
		move.l     a0,(a1)
		move.l     28(a7),d0
		bne.s      ParseGSCommands_19
		clr.w      2(a7)
		move.w     (a7),d0
		movea.l    4(a7),a0
		jsr        Ast_deleteAry
		bra.s      ParseGSCommands_1
ParseGSCommands_19:
		clr.w      d0
		move.w     d0,24(a7)
		move.w     d0,26(a7)
		move.l     4(a7),12(a7)
		bra.s      ParseGSCommands_20
ParseGSCommands_23:
		movea.l    12(a7),a0
		move.l     (a0),d0
		beq.s      ParseGSCommands_21
		movea.l    12(a7),a0
		move.w     24(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    28(a7),a1
		movea.l    (a1),a1
		move.l     (a0),0(a1,d0.l)
		addq.w     #1,24(a7)
ParseGSCommands_21:
		addq.w     #1,26(a7)
		addq.l     #4,12(a7)
ParseGSCommands_20:
		move.w     26(a7),d0
		cmp.w      (a7),d0
		bge.s      ParseGSCommands_22
		move.w     24(a7),d0
		cmp.w      2(a7),d0
		blt.s      ParseGSCommands_23
ParseGSCommands_22:
		movea.l    4(a7),a0
		jsr        Ax_free
ParseGSCommands_1:
		move.w     2(a7),d0
		lea.l      36(a7),a7
		rts

	.globl Aev_GetGSRequest
Aev_GetGSRequest:
		move.l     a2,-(a7)
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		movea.l    20(a7),a0
		move.l     (a0),16(a7)
		movea.l    16(a7),a0
		move.w     2(a0),4(a7)
		movea.l    16(a7),a0
		move.w     14(a0),6(a7)
		pea.l      CmpIDKanal(pc)
		lea.l      8(a7),a1
		movea.l    gs_connect,a0
		movea.l    gs_connect,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.l     a0,12(a7)
		move.l     12(a7),d0
		bne.s      Aev_GetGSRequest_1
		moveq.l    #18,d0
		jsr        Ax_malloc
		move.l     a0,12(a7)
		move.l     12(a7),d0
		bne.s      Aev_GetGSRequest_2
		clr.w      d0
		bra        Aev_GetGSRequest_3
Aev_GetGSRequest_2:
		moveq.l    #18,d1
		clr.w      d0
		movea.l    12(a7),a0
		jsr        memset
		movea.l    16(a7),a0
		movea.l    12(a7),a1
		move.w     2(a0),(a1)
		movea.l    16(a7),a0
		movea.l    12(a7),a1
		move.w     14(a0),14(a1)
		movea.l    12(a7),a1
		movea.l    gs_connect,a0
		movea.l    gs_connect,a2
		movea.l    12(a2),a2
		jsr        (a2)
		bra.s      Aev_GetGSRequest_4
Aev_GetGSRequest_1:
		moveq.l    #2,d0
		movea.l    12(a7),a0
		jsr        Aev_GSReply
		bra.s      Aev_GetGSRequest_3
Aev_GetGSRequest_4:
		movea.l    16(a7),a0
		move.l     6(a0),(a7)
		clr.w      d1
		moveq.l    #12,d0
		movea.l    (a7),a0
		jsr        Ax_memCheck
		tst.w      d0
		beq.s      Aev_GetGSRequest_5
		moveq.l    #12,d0
		movea.l    (a7),a1
		movea.l    12(a7),a0
		addq.w     #2,a0
		jsr        memcpy
		movea.l    12(a7),a0
		ori.w      #$0001,16(a0)
		clr.w      d0
		movea.l    12(a7),a0
		jsr        Aev_GSReply
		bra.s      Aev_GetGSRequest_3
		bra.s      Aev_GetGSRequest_3
Aev_GetGSRequest_5:
		moveq.l    #1,d0
		movea.l    12(a7),a0
		jsr        Aev_GSReply
		nop
Aev_GetGSRequest_3:
		lea.l      24(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetGSQuit
Aev_GetGSQuit:
		move.l     a2,-(a7)
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		lea.l      xe1aba,a0
		lea.l      (a7),a1
		move.l     (a0)+,(a1)+
		move.l     (a0)+,(a1)+
		movea.l    8(a7),a0
		movea.l    (a0),a0
		move.w     2(a0),(a7)
		movea.l    8(a7),a0
		movea.l    (a0),a0
		move.w     14(a0),2(a7)
		pea.l      SetStatus(pc)
		pea.l      CmpIDKanal(pc)
		lea.l      8(a7),a1
		movea.l    gs_connect,a0
		movea.l    gs_connect,a2
		movea.l    64(a2),a2
		jsr        (a2)
		addq.w     #8,a7
		pea.l      CmpIDKanal(pc)
		lea.l      4(a7),a1
		movea.l    gs_connect,a0
		movea.l    gs_connect,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		moveq.l    #1,d0
		lea.l      12(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetGSCommand
Aev_GetGSCommand:
		move.l     a2,-(a7)
		lea.l      -48(a7),a7
		move.l     a0,44(a7)
		movea.l    44(a7),a0
		move.l     (a0),40(a7)
		moveq.l    #16,d0
		movea.l    40(a7),a1
		lea.l      (a7),a0
		jsr        memcpy
		moveq.l    #4,d0
		jsr        Ax_malloc
		move.l     a0,16(a7)
		move.w     #$0001,20(a7)
		clr.w      22(a7)
		move.l     16(a7),d0
		bne.s      Aev_GetGSCommand_1
		lea.l      (a7),a0
		bsr        SendGsAck
		clr.w      d0
		bra        Aev_GetGSCommand_2
		bra.s      Aev_GetGSCommand_3
Aev_GetGSCommand_1:
		lea.l      xe1b01,a0
		jsr        Ast_create
		movea.l    16(a7),a1
		move.l     a0,(a1)
Aev_GetGSCommand_3:
		movea.l    40(a7),a0
		move.l     6(a0),36(a7)
		clr.w      d1
		moveq.l    #-2,d0
		movea.l    36(a7),a0
		jsr        Ax_memCheck
		tst.w      d0
		beq        Aev_GetGSCommand_4
		lea.l      32(a7),a1
		movea.l    36(a7),a0
		bsr        ParseGSCommands
		move.w     d0,28(a7)
		lea.l      16(a7),a1
		movea.l    32(a7),a0
		move.w     28(a7),d0
		movea.l    ACSblk,a2
		movea.l    1262(a2),a2
		jsr        (a2)
		move.w     d0,22(a7)
		move.w     22(a7),d0
		beq.s      Aev_GetGSCommand_5
		cmpi.w     #$0001,28(a7)
		ble.s      Aev_GetGSCommand_6
		clr.w      d0
		movea.l    32(a7),a0
		movea.l    4(a0),a0
		jsr        Awi_name
		bra.s      Aev_GetGSCommand_7
Aev_GetGSCommand_6:
		jsr        Awi_root
Aev_GetGSCommand_7:
		move.l     a0,24(a7)
		move.l     24(a7),d0
		beq.s      Aev_GetGSCommand_5
		movea.l    24(a7),a0
		move.l     150(a0),d0
		beq.s      Aev_GetGSCommand_5
		pea.l      16(a7)
		movea.l    36(a7),a1
		move.w     32(a7),d0
		movea.l    28(a7),a0
		movea.l    28(a7),a2
		movea.l    150(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.w     d0,22(a7)
Aev_GetGSCommand_5:
		move.w     28(a7),d0
		movea.l    32(a7),a0
		jsr        Ast_deleteAry
		clr.w      30(a7)
		bra.s      Aev_GetGSCommand_8
Aev_GetGSCommand_9:
		move.w     30(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    16(a7),a0
		movea.l    0(a0,d0.l),a0
		jsr        Ast_delete
		addq.w     #1,30(a7)
Aev_GetGSCommand_8:
		move.w     30(a7),d0
		cmp.w      20(a7),d0
		blt.s      Aev_GetGSCommand_9
		movea.l    16(a7),a0
		jsr        Ax_free
		bra.s      Aev_GetGSCommand_10
Aev_GetGSCommand_4:
		move.w     #$0002,22(a7)
Aev_GetGSCommand_10:
		lea.l      (a7),a0
		bsr        SendGsAck
		moveq.l    #1,d0
Aev_GetGSCommand_2:
		lea.l      48(a7),a7
		movea.l    (a7)+,a2
		rts

	.globl Aev_GetGSAck
Aev_GetGSAck:
		move.l     a2,-(a7)
		lea.l      -58(a7),a7
		move.l     a0,54(a7)
		movea.l    54(a7),a0
		move.l     (a0),50(a7)
		movea.l    50(a7),a0
		move.l     6(a0),46(a7)
		movea.l    50(a7),a0
		move.l     10(a0),42(a7)
		move.w     #$1352,40(a7)
		movea.l    50(a7),a0
		move.w     2(a0),(a7)
		lea.l      40(a7),a0
		move.l     a0,4(a7)
		clr.l      8(a7)
		clr.l      12(a7)
		movea.l    50(a7),a0
		addq.w     #6,a0
		move.l     a0,16(a7)
		movea.l    50(a7),a0
		addq.w     #8,a0
		move.l     a0,20(a7)
		move.l     46(a7),d0
		beq.s      Aev_GetGSAck_1
		suba.l     a0,a0
		bra.s      Aev_GetGSAck_2
Aev_GetGSAck_1:
		movea.l    50(a7),a0
		lea.l      10(a0),a0
Aev_GetGSAck_2:
		move.l     a0,24(a7)
		move.l     46(a7),d0
		beq.s      Aev_GetGSAck_3
		suba.l     a0,a0
		bra.s      Aev_GetGSAck_4
Aev_GetGSAck_3:
		movea.l    50(a7),a0
		lea.l      12(a0),a0
Aev_GetGSAck_4:
		move.l     a0,28(a7)
		clr.l      32(a7)
		pea.l      Aev_CmpMsgInList
		lea.l      4(a7),a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.l     a0,36(a7)
		move.l     36(a7),d0
		beq.s      Aev_GetGSAck_5
		movea.l    36(a7),a0
		move.l     2(a0),d0
		nop
		pea.l      Alu_ptrCmp
		movea.l    40(a7),a1
		movea.l    SentMsg,a0
		movea.l    SentMsg,a2
		movea.l    32(a2),a2
		jsr        (a2)
		addq.w     #4,a7
Aev_GetGSAck_5:
		move.l     46(a7),d0
		beq.s      Aev_GetGSAck_6
		pea.l      Alu_ptrCmp
		movea.l    50(a7),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.l     42(a7),d0
		beq.s      Aev_GetGSAck_7
		movea.l    50(a7),a0
		clr.w      6(a0)
		movea.l    50(a7),a0
		clr.w      8(a0)
		lea.l      xe1b03,a1
		clr.w      d0
		movea.l    50(a7),a0
		jsr        Aev_GSAck
Aev_GetGSAck_7:
		bra.s      Aev_GetGSAck_8
Aev_GetGSAck_6:
		move.l     42(a7),d0
		beq.s      Aev_GetGSAck_8
		pea.l      Alu_ptrCmp
		movea.l    46(a7),a1
		movea.l    globProtData,a0
		movea.l    globProtData,a2
		movea.l    24(a2),a2
		jsr        (a2)
		addq.w     #4,a7
Aev_GetGSAck_8:
		moveq.l    #1,d0
		lea.l      58(a7),a7
		movea.l    (a7)+,a2
		rts

Aev_GSReply:
		move.l     a2,-(a7)
		lea.l      -22(a7),a7
		move.l     a0,18(a7)
		move.w     d0,16(a7)
		movea.l    18(a7),a0
		move.w     (a0),d0
		movea.l    ACSblk,a0
		cmp.w      (a0),d0
		beq.s      Aev_GSReply_1
		moveq.l    #16,d1
		clr.w      d0
		lea.l      (a7),a0
		jsr        memset
		move.w     #$1351,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		move.w     16(a7),12(a7)
		movea.l    18(a7),a0
		move.w     14(a0),14(a7)
		move.l     gs_infodata,6(a7)
		movea.l    _globl,a1
		lea.l      (a7),a0
		moveq.l    #16,d1
		movea.l    18(a7),a2
		move.w     (a2),d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_GSReply_2
		moveq.l    #1,d0
		bra.s      Aev_GSReply_3
Aev_GSReply_2:
		clr.w      d0
Aev_GSReply_3:
		bra.s      Aev_GSReply_4
Aev_GSReply_1:
		clr.w      d0
Aev_GSReply_4:
		lea.l      22(a7),a7
		movea.l    (a7)+,a2
		rts

Aev_GSQuit:
		move.l     a2,-(a7)
		lea.l      -36(a7),a7
		move.l     a0,32(a7)
		movea.l    ACSblk,a0
		move.w     (a0),d0
		movea.l    32(a7),a0
		cmp.w      (a0),d0
		beq.s      Aev_GSQuit_1
		moveq.l    #16,d1
		clr.w      d0
		lea.l      (a7),a0
		jsr        memset
		move.w     #$1354,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		movea.l    32(a7),a0
		move.w     14(a0),14(a7)
		movea.l    _globl,a1
		lea.l      (a7),a0
		moveq.l    #16,d1
		movea.l    32(a7),a2
		move.w     (a2),d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_GSQuit_2
		moveq.l    #1,d0
		bra.s      Aev_GSQuit_3
Aev_GSQuit_2:
		clr.w      d0
Aev_GSQuit_3:
		bra.s      Aev_GSQuit_4
Aev_GSQuit_1:
		clr.w      d0
Aev_GSQuit_4:
		lea.l      36(a7),a7
		movea.l    (a7)+,a2
		rts

Aev_GSAck:
		move.l     a2,-(a7)
		lea.l      -42(a7),a7
		move.l     a0,38(a7)
		move.w     d0,36(a7)
		move.l     a1,32(a7)
		movea.l    ACSblk,a0
		move.w     (a0),d0
		movea.l    38(a7),a0
		cmp.w      2(a0),d0
		beq.s      Aev_GSAck_1
		moveq.l    #16,d1
		clr.w      d0
		lea.l      (a7),a0
		jsr        memset
		move.w     #$1353,(a7)
		movea.l    ACSblk,a0
		move.w     (a0),2(a7)
		movea.l    38(a7),a0
		move.w     6(a0),6(a7)
		movea.l    38(a7),a0
		move.w     8(a0),8(a7)
		move.w     36(a7),14(a7)
		move.l     32(a7),10(a7)
		movea.l    _globl,a1
		lea.l      (a7),a0
		moveq.l    #16,d1
		movea.l    38(a7),a2
		move.w     2(a2),d0
		jsr        mt_appl_write
		tst.w      d0
		beq.s      Aev_GSAck_2
		moveq.l    #1,d0
		bra.s      Aev_GSAck_3
Aev_GSAck_2:
		clr.w      d0
Aev_GSAck_3:
		bra.s      Aev_GSAck_4
Aev_GSAck_1:
		clr.w      d0
Aev_GSAck_4:
		lea.l      42(a7),a7
		movea.l    (a7)+,a2
		rts

_gs_cmp:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a1
		movea.l    4(a7),a0
		movea.l    (a0),a0
		jsr        Ast_icmp
		addq.w     #8,a7
		rts

_gs_search:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a1
		movea.l    4(a7),a0
		jsr        Ast_icmp
		addq.w     #8,a7
		rts

	.globl _gs_strcmp
_gs_strcmp:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a1
		movea.l    4(a7),a0
		movea.l    (a0),a0
		jsr        Ast_icmp
		addq.w     #8,a7
		rts

	.globl Aev_GEMScript
Aev_GEMScript:
		move.l     a2,-(a7)
		lea.l      -14(a7),a7
		move.w     d0,12(a7)
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		movea.l    4(a7),a0
		move.w     #$0001,6(a0)
		move.w     _gs_sorted,d0
		bne.s      Aev_GEMScript_1
		lea.l      _gs_cmp(pc),a1
		moveq.l    #8,d1
		move.w     _gs_cmd_anzahl,d0
		ext.l      d0
		lea.l      _gs_commands,a0
		jsr        qsort
		move.w     #$0001,_gs_sorted
Aev_GEMScript_1:
		pea.l      _gs_search(pc)
		moveq.l    #8,d1
		move.w     _gs_cmd_anzahl,d0
		ext.l      d0
		lea.l      _gs_commands,a1
		movea.l    12(a7),a0
		movea.l    (a0),a0
		jsr        bsearch
		addq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Aev_GEMScript_2
		movea.l    (a7),a0
		move.l     4(a0),d0
		beq.s      Aev_GEMScript_3
		movea.l    4(a7),a1
		movea.l    8(a7),a0
		move.w     12(a7),d0
		movea.l    (a7),a2
		movea.l    4(a2),a2
		jsr        (a2)
		movea.l    4(a7),a0
		move.w     d0,6(a0)
		bra.s      Aev_GEMScript_2
Aev_GEMScript_3:
		movea.l    4(a7),a0
		clr.w      6(a0)
Aev_GEMScript_2:
		movea.l    4(a7),a0
		move.w     6(a0),d0
		lea.l      14(a7),a7
		movea.l    (a7)+,a2
		rts

gs_SendToTopWindow:
		move.l     a2,-(a7)
		lea.l      -14(a7),a7
		move.w     d0,12(a7)
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		jsr        Awi_ontop
		move.l     a0,(a7)
		move.l     4(a7),-(a7)
		movea.l    12(a7),a1
		move.w     16(a7),d0
		movea.l    4(a7),a0
		movea.l    4(a7),a2
		movea.l    150(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		lea.l      14(a7),a7
		movea.l    (a7)+,a2
		rts

gs_AppGetLongName:
		subq.w     #4,a7
		move.l     a1,(a7)
		movea.l    (a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		jsr        Ax_free
		movea.l    (a7),a0
		move.w     #$0001,4(a0)
		movea.l    ACSblk,a0
		movea.l    1254(a0),a0
		jsr        Ast_create
		movea.l    (a7),a1
		movea.l    (a1),a1
		move.l     a0,(a1)
		clr.w      d0
		addq.w     #4,a7
		rts

gs_CheckCommand:
		lea.l      -14(a7),a7
		move.w     d0,12(a7)
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		cmpi.w     #$0002,12(a7)
		bge.s      gs_CheckCommand_1
		moveq.l    #2,d0
		bra        gs_CheckCommand_2
gs_CheckCommand_1:
		pea.l      _gs_search(pc)
		moveq.l    #8,d1
		move.w     _gs_cmd_anzahl,d0
		ext.l      d0
		lea.l      _gs_commands,a1
		movea.l    12(a7),a0
		movea.l    4(a0),a0
		jsr        bsearch
		addq.w     #4,a7
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      gs_CheckCommand_3
		movea.l    4(a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		jsr        Ax_free
		lea.l      xe1b49,a0
		jsr        Ast_create
		movea.l    4(a7),a1
		movea.l    (a1),a1
		move.l     a0,(a1)
		movea.l    4(a7),a0
		move.w     #$0001,4(a0)
		movea.l    4(a7),a0
		clr.w      6(a0)
		bra.s      gs_CheckCommand_4
gs_CheckCommand_3:
		move.l     4(a7),-(a7)
		movea.l    12(a7),a1
		move.l     a1,-(a7)
		jsr        Awi_root
		move.w     20(a7),d0
		movea.l    (a7)+,a1
		jsr        Awi_gemscript
		addq.w     #4,a7
		movea.l    4(a7),a0
		move.w     d0,6(a0)
gs_CheckCommand_4:
		movea.l    4(a7),a0
		move.w     6(a0),d0
gs_CheckCommand_2:
		lea.l      14(a7),a7
		rts

gs_Quit:
		subq.w     #4,a7
		move.l     a1,(a7)
		jsr        Aev_quit
		movea.l    (a7),a0
		movea.l    (a0),a0
		movea.l    (a0),a0
		jsr        Ax_free
		lea.l      xe1b4b,a0
		jsr        Ast_create
		movea.l    (a7),a1
		movea.l    (a1),a1
		move.l     a0,(a1)
		movea.l    (a7),a0
		move.w     #$0001,4(a0)
		clr.w      d0
		addq.w     #4,a7
		rts

gs_GetAllCommands:
		move.l     a2,-(a7)
		lea.l      -30(a7),a7
		move.w     d0,28(a7)
		move.l     a0,24(a7)
		move.l     a1,20(a7)
		jsr        Awi_ontop
		move.l     a0,(a7)
		move.l     20(a7),-(a7)
		movea.l    28(a7),a1
		move.w     32(a7),d0
		movea.l    4(a7),a0
		movea.l    4(a7),a2
		movea.l    150(a2),a2
		jsr        (a2)
		addq.w     #4,a7
		move.w     d0,18(a7)
		move.w     18(a7),d0
		beq.s      gs_GetAllCommands_1
		move.w     18(a7),d0
		bra        gs_GetAllCommands_2
gs_GetAllCommands_1:
		move.w     _gs_cmd_anzahl,d0
		movea.l    20(a7),a0
		add.w      4(a0),d0
		move.w     d0,12(a7)
		move.w     12(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,8(a7)
		move.l     8(a7),d0
		bne.s      gs_GetAllCommands_3
		moveq.l    #2,d0
		bra        gs_GetAllCommands_2
gs_GetAllCommands_3:
		move.w     12(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		clr.w      d0
		movea.l    8(a7),a0
		jsr        memset
		clr.w      18(a7)
		bra.s      gs_GetAllCommands_4
gs_GetAllCommands_6:
		move.w     18(a7),d0
		lsl.w      #3,d0
		lea.l      _gs_commands,a0
		movea.l    0(a0,d0.w),a0
		jsr        Ast_create
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a1
		move.l     a0,0(a1,d0.l)
		move.l     8(a7),d0
		bne.s      gs_GetAllCommands_5
		move.w     _gs_cmd_anzahl,d0
		movea.l    8(a7),a0
		jsr        Ast_deleteAry
		moveq.l    #2,d0
		bra        gs_GetAllCommands_2
gs_GetAllCommands_5:
		addq.w     #1,18(a7)
gs_GetAllCommands_4:
		move.w     18(a7),d0
		cmp.w      _gs_cmd_anzahl,d0
		blt.s      gs_GetAllCommands_6
		movea.l    20(a7),a0
		move.w     4(a0),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    20(a7),a0
		movea.l    (a0),a1
		move.w     _gs_cmd_anzahl,d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    8(a7),a0
		adda.l     d1,a0
		jsr        memcpy
		lea.l      _gs_strcmp(pc),a1
		moveq.l    #4,d1
		move.w     12(a7),d0
		ext.l      d0
		movea.l    8(a7),a0
		jsr        qsort
		clr.w      14(a7)
		move.w     #$0001,18(a7)
		bra.s      gs_GetAllCommands_7
gs_GetAllCommands_9:
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		movea.l    0(a0,d0.l),a1
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		movea.l    -4(a0,d0.l),a0
		jsr        Ast_icmp
		tst.w      d0
		bne.s      gs_GetAllCommands_8
		addq.w     #1,14(a7)
gs_GetAllCommands_8:
		addq.w     #1,18(a7)
gs_GetAllCommands_7:
		move.w     18(a7),d0
		cmp.w      12(a7),d0
		blt.s      gs_GetAllCommands_9
		move.w     12(a7),d0
		sub.w      14(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq        gs_GetAllCommands_10
		movea.l    8(a7),a0
		movea.l    4(a7),a1
		move.l     (a0),(a1)
		move.w     #$0001,18(a7)
		move.w     #$0001,16(a7)
		bra.s      gs_GetAllCommands_11
gs_GetAllCommands_14:
		move.w     16(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    4(a7),a0
		movea.l    -4(a0,d0.l),a1
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		movea.l    0(a0,d0.l),a0
		jsr        Ast_icmp
		tst.w      d0
		beq.s      gs_GetAllCommands_12
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		move.w     16(a7),d1
		ext.l      d1
		lsl.l      #2,d1
		movea.l    4(a7),a1
		move.l     0(a0,d0.l),0(a1,d1.l)
		addq.w     #1,16(a7)
		move.w     18(a7),d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    8(a7),a0
		clr.l      0(a0,d0.l)
gs_GetAllCommands_12:
		addq.w     #1,18(a7)
gs_GetAllCommands_11:
		move.w     18(a7),d0
		cmp.w      12(a7),d0
		bge.s      gs_GetAllCommands_13
		move.w     12(a7),d0
		sub.w      14(a7),d0
		move.w     16(a7),d1
		cmp.w      d0,d1
		blt.s      gs_GetAllCommands_14
gs_GetAllCommands_13:
		move.w     12(a7),d0
		movea.l    8(a7),a0
		jsr        Ast_deleteAry
		move.w     14(a7),d0
		sub.w      d0,12(a7)
		bra.s      gs_GetAllCommands_15
gs_GetAllCommands_10:
		move.l     8(a7),4(a7)
gs_GetAllCommands_15:
		movea.l    20(a7),a0
		movea.l    (a0),a0
		jsr        Ax_free
		movea.l    20(a7),a0
		move.w     12(a7),4(a0)
		movea.l    20(a7),a0
		move.l     4(a7),(a0)
		clr.w      d0
gs_GetAllCommands_2:
		lea.l      30(a7),a7
		movea.l    (a7)+,a2
		rts

	.data

gs_infodata:
		dc.w $0000
		dc.w $0000
gs_connect:
		dc.w $0000
		dc.w $0000
xe1aba:
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0001
_gs_commands:
		dc.l xe1b07
		dc.l gs_CheckCommand
		dc.l xe1b14
		dc.l gs_SendToTopWindow
		dc.l xe1b1d
		dc.l gs_Quit
		dc.l xe1b22
		dc.l gs_AppGetLongName
		dc.l xe1b31
		dc.l gs_SendToTopWindow
		dc.l xe1b3a
		dc.l gs_GetAllCommands
_gs_cmd_anzahl:
		dc.w $0006
_gs_sorted:
		dc.w $0000
xe1af6:
		dc.w $3000
		dc.b $00
xe1af9: dc.b 1
		dc.w $0203
		dc.w $0405
		dc.w $0600
xe1b00:
		dc.b 0
xe1b01: dc.b $30,0
xe1b03:
		dc.b $31,0
		dc.b $00,0
xe1b07:
		dc.b 'CheckCommand',0
xe1b14:
		dc.b 'GetFront',0
xe1b1d:
		dc.b 'Quit',0
xe1b22:
		dc.b 'AppGetLongName',0
xe1b31:
		dc.b 'KeyPress',0
xe1b3a:
		dc.b 'GetAllCommands',0
xe1b49:
		dc.b $31,0
xe1b4b:
		dc.b $31,0
		.even

