	.globl Aev_InitDD
Aev_InitDD:
		moveq.l    #1,d0
		rts

	.globl Aev_ExitDD
Aev_ExitDD:
		moveq.l    #1,d0
		rts

Aev_ddabort:
		subq.w     #6,a7
		move.w     d0,4(a7)
		move.l     d1,(a7)
		movea.l    (a7),a0
		moveq.l    #13,d0
		jsr        Psignal
		move.w     4(a7),d0
		jsr        Fclose
		moveq.l    #1,d0
		jsr        Awi_update
		clr.w      d0
		addq.w     #6,a7
		rts

	.globl Aev_GetAPDragDrop
Aev_GetAPDragDrop:
		move.l     a2,-(a7)
		lea.l      -84(a7),a7
		move.l     a0,80(a7)
		lea.l      xe1a2a,a0
		lea.l      60(a7),a1
		moveq.l    #19,d0
Aev_GetAPDragDrop_1:
		move.b     (a0)+,(a1)+
		dbf        d0,Aev_GetAPDragDrop_1
		lea.l      xe1a3e,a0
		lea.l      20(a7),a1
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		move.b     (a0)+,(a1)+
		movea.l    80(a7),a0
		movea.l    (a0),a0
		move.b     15(a0),78(a7)
		movea.l    80(a7),a0
		movea.l    (a0),a0
		move.w     14(a0),d0
		asr.w      #8,d0
		move.b     d0,77(a7)
		moveq.l    #2,d0
		lea.l      60(a7),a0
		jsr        Fopen
		move.l     d0,8(a7)
		move.l     8(a7),d0
		bpl.s      Aev_GetAPDragDrop_2
		clr.w      d0
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_2:
		move.w     10(a7),14(a7)
		clr.w      d0
		jsr        Awi_update
		/* movea.l    #$00000001,a0 */
		dc.w 0x207c,0,1
		moveq.l    #13,d0
		jsr        Psignal
		move.l     d0,4(a7)
		moveq.l    #33,d1
		clr.w      d0
		lea.l      26(a7),a0
		jsr        memset
		lea.l      xe1a58,a1
		lea.l      27(a7),a0
		jsr        strcpy
		lea.l      26(a7),a0
		moveq.l    #33,d1
		move.w     14(a7),d0
		jsr        Fwrite
		moveq.l    #33,d1
		cmp.l      d0,d1
		beq.s      Aev_GetAPDragDrop_4
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_4:
		movea.l    _globl,a0
		moveq.l    #50,d0
		jsr        mt_evnt_timer
		lea.l      12(a7),a0
		moveq.l    #2,d1
		move.w     14(a7),d0
		jsr        Fread
		moveq.l    #2,d1
		cmp.l      d0,d1
		bne.s      Aev_GetAPDragDrop_5
		cmpi.w     #$0008,12(a7)
		bge.s      Aev_GetAPDragDrop_6
Aev_GetAPDragDrop_5:
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_6:
		lea.l      20(a7),a0
		moveq.l    #4,d1
		move.w     14(a7),d0
		jsr        Fread
		moveq.l    #4,d1
		cmp.l      d0,d1
		beq.s      Aev_GetAPDragDrop_7
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_7:
		clr.b      24(a7)
		lea.l      20(a7),a0
		jsr        Ast_toupper
		subq.w     #4,12(a7)
		moveq.l    #4,d0
		lea.l      xe1a61,a1
		lea.l      20(a7),a0
		jsr        strncmp
		tst.w      d0
		bne.s      Aev_GetAPDragDrop_8
		bra.s      Aev_GetAPDragDrop_9
Aev_GetAPDragDrop_11:
		subq.w     #1,12(a7)
Aev_GetAPDragDrop_9:
		move.w     12(a7),d0
		ble.s      Aev_GetAPDragDrop_10
		lea.l      26(a7),a0
		moveq.l    #1,d1
		move.w     14(a7),d0
		jsr        Fread
		moveq.l    #1,d1
		cmp.l      d0,d1
		beq.s      Aev_GetAPDragDrop_11
Aev_GetAPDragDrop_10:
		move.b     #$01,26(a7)
		lea.l      26(a7),a0
		moveq.l    #1,d1
		move.w     14(a7),d0
		jsr        Fwrite
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		moveq.l    #1,d0
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_8:
		lea.l      (a7),a0
		moveq.l    #4,d1
		move.w     14(a7),d0
		jsr        Fread
		moveq.l    #4,d1
		cmp.l      d0,d1
		beq.s      Aev_GetAPDragDrop_12
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_12:
		subq.w     #4,12(a7)
		bra.s      Aev_GetAPDragDrop_13
Aev_GetAPDragDrop_15:
		lea.l      26(a7),a0
		moveq.l    #1,d1
		move.w     14(a7),d0
		jsr        Fread
		moveq.l    #1,d1
		cmp.l      d0,d1
		beq.s      Aev_GetAPDragDrop_14
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_14:
		subq.w     #1,12(a7)
Aev_GetAPDragDrop_13:
		move.w     12(a7),d0
		bgt.s      Aev_GetAPDragDrop_15
		moveq.l    #1,d0
		add.l      (a7),d0
		jsr        Ax_malloc
		move.l     a0,16(a7)
		move.l     16(a7),d0
		bne.s      Aev_GetAPDragDrop_16
		move.b     #$01,26(a7)
		lea.l      26(a7),a0
		moveq.l    #1,d1
		move.w     14(a7),d0
		jsr        Fwrite
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_16:
		clr.b      26(a7)
		lea.l      26(a7),a0
		moveq.l    #1,d1
		move.w     14(a7),d0
		jsr        Fwrite
		moveq.l    #1,d1
		cmp.l      d0,d1
		beq.s      Aev_GetAPDragDrop_17
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_17:
		movea.l    _globl,a0
		moveq.l    #100,d0
		jsr        mt_evnt_timer
		movea.l    16(a7),a0
		move.l     (a7),d1
		move.w     14(a7),d0
		jsr        Fread
		cmp.l      (a7),d0
		beq.s      Aev_GetAPDragDrop_18
		movea.l    16(a7),a0
		jsr        Ax_free
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_18:
		move.l     4(a7),d1
		move.w     14(a7),d0
		bsr        Aev_ddabort
		move.l     (a7),d0
		movea.l    16(a7),a0
		clr.b      0(a0,d0.l)
		moveq.l    #4,d0
		lea.l      xe1a66,a1
		lea.l      20(a7),a0
		jsr        strncmp
		tst.w      d0
		bne.s      Aev_GetAPDragDrop_19
		movea.l    80(a7),a0
		move.l     20(a0),-(a7)
		movea.l    84(a7),a0
		move.l     16(a0),-(a7)
		movea.l    88(a7),a0
		move.w     24(a0),d0
		movea.l    88(a7),a0
		movea.l    12(a0),a1
		movea.l    24(a7),a0
		jsr        GetImgIntoObj
		addq.w     #8,a7
		movea.l    16(a7),a0
		jsr        Ax_free
		moveq.l    #1,d0
		bra        Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_19:
		moveq.l    #4,d0
		lea.l      xe1a6b,a1
		lea.l      20(a7),a0
		jsr        strncmp
		tst.w      d0
		beq.s      Aev_GetAPDragDrop_20
		moveq.l    #4,d0
		lea.l      xe1a70,a1
		lea.l      20(a7),a0
		jsr        strncmp
		tst.w      d0
		bne.s      Aev_GetAPDragDrop_21
Aev_GetAPDragDrop_20:
		movea.l    80(a7),a0
		move.l     20(a0),-(a7)
		movea.l    84(a7),a0
		move.l     16(a0),-(a7)
		movea.l    88(a7),a0
		move.l     12(a0),-(a7)
		movea.l    92(a7),a0
		move.w     26(a0),d1
		movea.l    92(a7),a0
		move.w     24(a0),d0
		lea.l      32(a7),a1
		movea.l    28(a7),a0
		jsr        GetTxtIntoObj
		lea.l      12(a7),a7
		movea.l    16(a7),a0
		jsr        Ax_free
		moveq.l    #1,d0
		bra.s      Aev_GetAPDragDrop_3
Aev_GetAPDragDrop_21:
		cmpi.b     #$2E,20(a7)
		beq.s      Aev_GetAPDragDrop_22
		lea.l      xe1a75,a1
		lea.l      20(a7),a0
		jsr        strcpy
Aev_GetAPDragDrop_22:
		clr.w      d1
		move.l     (a7),d0
		movea.l    16(a7),a1
		lea.l      21(a7),a0
		jsr        Ascrp_put
		lea.l      21(a7),a1
		moveq.l    #29,d0
		movea.l    80(a7),a0
		movea.l    12(a0),a0
		movea.l    80(a7),a2
		movea.l    12(a2),a2
		movea.l    4(a2),a2
		jsr        (a2)
		tst.w      d0
		bne.s      Aev_GetAPDragDrop_23
		lea.l      21(a7),a0
		jsr        Ascrp_clear
Aev_GetAPDragDrop_23:
		moveq.l    #1,d0
Aev_GetAPDragDrop_3:
		lea.l      84(a7),a7
		movea.l    (a7)+,a2
		rts

	.data

xe1a2a:
		dc.b 'U:\PIPE\DRAGDROP.AA',0
xe1a3e:
		dc.w $0000
		dc.w $0000
		dc.w $0055
		dc.b ':\PIPE\DRAGDROP.AA',0
		dc.b $00
xe1a58:
		dc.b '.TXT.IMG',0
xe1a61:
		dc.b 'PATH',0
xe1a66:
		dc.b '.IMG',0
xe1a6b:
		dc.b '.TXT',0
xe1a70:
		dc.b 'ARGS',0
xe1a75:
		dc.b '.TMP',0
		dc.b 'U:\PIPE',0
		dc.b '    ',0
		.even
xe1a88: /* unused */
		dc.b 0
		dc.b 'PATH',0

