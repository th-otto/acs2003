	.text

mod_height:
		movem.l    d3/a2-a5,-(a7)
		movea.l    ACSblk,a0
		movea.l    604(a0),a3
		jsr        Aus_editor
		lea.l      height,a2
		move.w     2(a2),d0
		beq.s      mod_height_1
		move.w     (a2),d3
		pea.l      (a2)
		lea.l      xd4ec2,a1
		movea.l    a3,a0
		moveq.l    #20,d0
		jsr        Aob_scanf
		addq.w     #4,a7
		cmp.w      (a2),d3
		beq.s      mod_height_1
		lea.l      216(a3),a3
		movea.l    12(a3),a4
		movea.l    a2,a1
		move.w     #0x012D,d0
		movea.l    a3,a0
		movea.l    8(a4),a5
		jsr        (a5)
		moveq.l    #-1,d1
		moveq.l    #8,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		jsr        (a1)
mod_height_1:
		movem.l    (a7)+,d3/a2-a5
		rts

liveheight:
		movem.l    d3/a2-a5,-(a7)
		subq.w     #4,a7
		movea.l    a1,a4
		lea.l      height,a2
		move.w     (a2),d3
		movea.l    a0,a3
		cmpi.b     #0x20,(a4)
		bne.s      liveheight_1
		pea.l      2(a7)
		lea.l      xd4ec2,a1
		movea.l    a4,a0
		jsr        sscanf
		addq.w     #4,a7
		move.w     -2(a2),d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		pea.l      (a7)
		pea.l      4(a7)
		movea.l    a2,a1
		lea.l      8(a7),a0
		move.w     10(a7),d1
		movea.l    ACSblk,a4
		move.w     16(a4),d0
		jsr        vst_point
		addq.w     #8,a7
		clr.w      2(a2)
		bra.s      liveheight_2
liveheight_1:
		pea.l      (a2)
		lea.l      xd4ec2,a1
		moveq.l    #20,d0
		movea.l    a3,a0
		jsr        Aob_scanf
		addq.w     #4,a7
		move.w     #0x0001,2(a2)
liveheight_2:
		cmp.w      (a2),d3
		beq.s      liveheight_3
		lea.l      216(a3),a4
		movea.l    12(a4),a3
		movea.l    a2,a1
		move.w     #0x012D,d0
		movea.l    a4,a0
		movea.l    8(a3),a5
		jsr        (a5)
		moveq.l    #-1,d1
		moveq.l    #8,d0
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		movea.l    ACSblk,a1
		movea.l    600(a1),a2
		movea.l    102(a2),a1
		jsr        (a1)
liveheight_3:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a5
		rts

set_font:
		movem.l    d3-d5/a2-a5,-(a7)
		lea.l      -40(a7),a7
		movea.l    a0,a2
		move.w     d0,d3
		pea.l      height
		lea.l      xd4ec2,a1
		moveq.l    #20,d0
		jsr        Aob_scanf
		addq.w     #4,a7
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #4,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		movea.l    table,a0
		adda.l     d0,a0
		move.l     a0,16(a7)
		move.w     34(a0),fontid
		lea.l      216(a2),a1
		move.l     a1,20(a7)
		movea.l    12(a1),a5
		lea.l      fontid,a1
		movea.l    8(a5),a3
		movea.l    20(a7),a0
		move.w     #0x012C,d0
		jsr        (a3)
		lea.l      height,a1
		move.w     #0x012D,d0
		movea.l    20(a7),a0
		movea.l    8(a5),a3
		jsr        (a3)
		lea.l      360(a2),a5
		suba.l     a1,a1
		move.w     #0x00CE,d0
		movea.l    a5,a0
		jsr        Auo_editor
		moveq.l    #-1,d3
		move.w     fontid,d1
		movea.l    ACSblk,a0
		move.w     16(a0),d0
		jsr        vst_font
		clr.w      d4
		lea.l      4(a7),a2
		lea.l      2(a7),a3
		bra.s      set_font_1
set_font_3:
		move.w     d4,d0
		ext.l      d0
		add.l      d0,d0
		movea.l    16(a7),a0
		move.w     36(a0,d0.l),d5
		tst.w      d5
		ble.s      set_font_2
		move.w     d5,-(a7)
		lea.l      xd4ec5,a1
		movea.l    a2,a0
		jsr        sprintf
		addq.w     #2,a7
		movea.l    a2,a1
		move.w     #0x00CC,d0
		movea.l    a5,a0
		jsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00CB,d0
		movea.l    a5,a0
		jsr        Auo_editor
		pea.l      (a3)
		pea.l      (a3)
		lea.l      8(a7),a1
		movea.l    a3,a0
		move.w     d5,d1
		movea.l    ACSblk,a4
		move.w     16(a4),d0
		jsr        vst_point
		addq.w     #8,a7
		tst.w      d3
		bpl.s      set_font_2
		subq.w     #1,d3
		move.w     (a7),d0
		cmp.w      height,d0
		bne.s      set_font_2
		move.w     d3,d1
		neg.w      d1
		subq.w     #2,d1
		move.w     d1,d3
set_font_2:
		addq.w     #1,d4
set_font_1:
		cmp.w      #0x000C,d4
		blt.w      set_font_3
		lea.l      xd4ec9,a1
		move.w     #0x00CC,d0
		movea.l    a5,a0
		jsr        Auo_editor
		lea.l      24(a7),a4
		tst.w      d3
		bpl.s      set_font_4
		lea.l      12(a7),a1
		move.w     #0x00E9,d0
		movea.l    a5,a0
		jsr        Auo_editor
		moveq.l    #-1,d0
		add.l      12(a7),d0
		move.l     d0,8(a4)
		move.l     d0,(a4)
		bra.s      set_font_5
set_font_4:
		move.w     d3,d0
		ext.l      d0
		move.l     d0,8(a4)
		move.l     d0,(a4)
set_font_5:
		moveq.l    #0,d0
		move.l     d0,12(a4)
		move.l     d0,4(a4)
		movea.l    a4,a1
		movea.l    a5,a0
		move.w     #0x00E4,d0
		jsr        Auo_editor
		suba.l     a1,a1
		move.w     #0x00DB,d0
		movea.l    a5,a0
		jsr        Auo_editor
		move.w     #0x0001,pixel
		lea.l      40(a7),a7
		movem.l    (a7)+,d3-d5/a2-a5
		rts

livefont:
		movem.l    d3/a2-a6,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		move.l     a1,(a7)
		movea.l    a0,a3
		movea.l    372(a3),a4
		movea.l    ACSblk,a1
		movea.l    600(a1),a5
		clr.w      d3
		bra.s      livefont_1
livefont_4:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #4,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		movea.l    table,a1
		adda.l     d0,a1
		movea.l    (a7),a0
		jsr        strcmp
		tst.w      d0
		bne.s      livefont_2
		move.w     d3,d0
		movea.l    a2,a0
		bsr        set_font
		moveq.l    #-1,d1
		moveq.l    #8,d0
		movea.l    a5,a0
		movea.l    102(a5),a1
		jsr        (a1)
		suba.l     a1,a1
		moveq.l    #6,d0
		lea.l      360(a3),a0
		movea.l    8(a4),a6
		jsr        (a6)
		bra.s      livefont_3
livefont_2:
		addq.w     #1,d3
livefont_1:
		cmp.w      fonts,d3
		blt.s      livefont_4
livefont_3:
		addq.w     #4,a7
		movem.l    (a7)+,d3/a2-a6
		rts

get_fontinfo:
		movem.l    d3-d7/a2-a6,-(a7)
		lea.l      -138(a7),a7
		move.l     a0,134(a7)
		move.w     d0,d5
		lea.l      ACSblk,a2
		movea.l    (a2),a0
		move.w     644(a0),d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #4,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		jsr        Ax_malloc
		move.l     a0,table
		bne.s      get_fontinfo_1
		clr.w      d0
		bra        get_fontinfo_2
get_fontinfo_1:
		jsr        Amo_busy
		movea.l    table,a3
		move.w     #0x0001,fonts
		moveq.l    #1,d3
		lea.l      132(a7),a5
		lea.l      128(a7),a4
		bra        get_fontinfo_3
get_fontinfo_17:
		movea.l    a3,a0
		move.w     d3,d1
		movea.l    (a2),a1
		move.w     16(a1),d0
		jsr        vqt_name
		move.w     d0,34(a3)
		move.w     d0,d1
		movea.l    (a2),a0
		move.w     16(a0),d0
		jsr        vst_font
		pea.l      (a5)
		pea.l      (a5)
		movea.l    a5,a1
		movea.l    a5,a0
		move.w     #0x00C8,d1
		movea.l    (a2),a6
		move.w     16(a6),d0
		jsr        vst_point
		addq.w     #8,a7
		move.w     d0,d4
		cmp.w      #0x00C8,d0
		bgt        get_fontinfo_4
		subq.w     #1,d0
		blt        get_fontinfo_4
		tst.w      d5
		bne        get_fontinfo_5
		pea.l      116(a7)
		pea.l      130(a7)
		pea.l      124(a7)
		movea.l    a4,a1
		lea.l      142(a7),a0
		movea.l    (a2),a6
		move.w     16(a6),d0
		jsr        vqt_fontinfo
		lea.l      12(a7),a7
		clr.w      (a5)
		cmpi.w     #0x0020,130(a7)
		bge.s      get_fontinfo_6
		moveq.l    #32,d6
		bra.s      get_fontinfo_7
get_fontinfo_6:
		move.w     130(a7),d6
get_fontinfo_7:
		bra.s      get_fontinfo_8
get_fontinfo_11:
		move.w     (a5),d0
		move.b     d6,0(a7,d0.w)
		addq.w     #1,(a5)
		addq.w     #1,d6
get_fontinfo_8:
		cmpi.w     #0x0080,(a4)
		bge.s      get_fontinfo_9
		move.w     (a4),d0
		bra.s      get_fontinfo_10
get_fontinfo_9:
		move.w     #0x0080,d0
get_fontinfo_10:
		cmp.w      d0,d6
		ble.s      get_fontinfo_11
		move.w     (a5),d0
		clr.b      0(a7,d0.w)
		lea.l      100(a7),a1
		lea.l      (a7),a0
		movea.l    (a2),a6
		move.w     16(a6),d0
		jsr        vqt_extent
		move.w     104(a7),d0
		add.w      100(a7),d0
		ext.l      d0
		divs.w     (a5),d0
		cmp.w      126(a7),d0
		bne.w      get_fontinfo_4
get_fontinfo_5:
		cmp.w      #0x0001,d3
		ble.s      get_fontinfo_12
		suba.l     a1,a1
		move.w     #0x00CB,d0
		movea.l    134(a7),a0
		jsr        Auo_editor
get_fontinfo_12:
		movea.l    a3,a1
		move.w     #0x00CC,d0
		movea.l    134(a7),a0
		jsr        Auo_editor
		move.w     #0x00C8,d7
		moveq.l    #11,d6
		bra.s      get_fontinfo_13
get_fontinfo_16:
		pea.l      (a5)
		pea.l      (a5)
		movea.l    a5,a1
		movea.l    a5,a0
		moveq.l    #-1,d1
		add.w      d7,d1
		movea.l    (a2),a6
		move.w     16(a6),d0
		jsr        vst_point
		addq.w     #8,a7
		move.w     d0,d4
		cmp.w      d7,d0
		bne.s      get_fontinfo_14
		move.w     d6,d1
		ext.l      d1
		add.l      d1,d1
		clr.w      36(a3,d1.l)
		bra.s      get_fontinfo_15
get_fontinfo_14:
		move.w     d6,d0
		ext.l      d0
		add.l      d0,d0
		move.w     d4,36(a3,d0.l)
		move.w     d4,d7
get_fontinfo_15:
		subq.w     #1,d6
get_fontinfo_13:
		tst.w      d6
		bpl.s      get_fontinfo_16
		addq.w     #1,fonts
		lea.l      60(a3),a3
get_fontinfo_4:
		addq.w     #1,d3
get_fontinfo_3:
		movea.l    (a2),a0
		cmp.w      644(a0),d3
		ble        get_fontinfo_17
		jsr        Amo_unbusy
		moveq.l    #1,d0
get_fontinfo_2:
		lea.l      138(a7),a7
		movem.l    (a7)+,d3-d7/a2-a6
		rts

serv_wi_font:
		move.l     a2,-(a7)
		movea.l    a0,a2
		move.w     d0,d1
		subq.w     #2,d1
		beq.s      serv_wi_font_1
		sub.w      #0x0018,d1
		beq.s      serv_wi_font_2
		bra.s      serv_wi_font_3
serv_wi_font_1:
		movea.l    a2,a0
		jsr        Awi_delete
		bra.s      serv_wi_font_4
serv_wi_font_2:
		movea.l    ACSblk,a0
		move.l     a2,600(a0)
		movea.l    20(a2),a0
		lea.l      360(a0),a0
		movea.l    a0,a2
		suba.l     a1,a1
		move.w     #0x00E6,d0
		jsr        Auo_editor
		bra.s      serv_wi_font_4
serv_wi_font_3:
		clr.w      d0
		bra.s      serv_wi_font_5
serv_wi_font_4:
		moveq.l    #1,d0
serv_wi_font_5:
		movea.l    (a7)+,a2
		rts

	.globl A_fontsel
A_fontsel:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -42(a7),a7
		move.l     a0,38(a7)
		move.l     a1,34(a7)
		move.w     d0,d3
		lea.l      height,a4
		movea.l    38(a7),a0
		move.w     (a0),-2(a4)
		movea.l    34(a7),a1
		move.w     (a1),(a4)
		lea.l      WI_FONTSEL,a0
		movea.l    WI_FONTSEL+8,a1
		jsr        (a1)
		movea.l    a0,a5
		move.l     a5,d0
		beq.s      A_fontsel_1
		movea.l    20(a5),a3
		lea.l      72(a3),a3
		move.w     d3,d0
		movea.l    a3,a0
		bsr        get_fontinfo
		tst.w      d0
		bne.s      A_fontsel_2
		movea.l    a5,a0
		jsr        Awi_delete
A_fontsel_1:
		moveq.l    #-1,d0
		bra        A_fontsel_3
A_fontsel_2:
		move.w     (a4),-(a7)
		lea.l      xd4ec2,a1
		moveq.l    #20,d0
		movea.l    20(a5),a0
		jsr        Aob_printf
		addq.w     #2,a7
		suba.l     a1,a1
		move.w     #0x00DC,d0
		movea.l    a3,a0
		jsr        Auo_editor
		moveq.l    #-1,d3
		add.w      -4(a4),d3
		bra.s      A_fontsel_4
A_fontsel_6:
		subq.w     #1,d3
A_fontsel_4:
		tst.w      d3
		ble.s      A_fontsel_5
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #4,d0
		sub.l      d1,d0
		lsl.l      #2,d0
		movea.l    -8(a4),a0
		move.w     -2(a4),d2
		cmp.w      34(a0,d0.l),d2
		bne.s      A_fontsel_6
A_fontsel_5:
		move.w     d3,d0
		movea.l    20(a5),a0
		bsr        set_font
		lea.l      18(a7),a2
		move.w     d3,d0
		ext.l      d0
		move.l     d0,8(a2)
		move.l     d0,(a2)
		moveq.l    #0,d1
		move.l     d1,12(a2)
		move.l     d1,4(a2)
		movea.l    a2,a1
		move.w     #0x00DA,d0
		movea.l    a3,a0
		jsr        Auo_editor
		movea.l    a2,a1
		move.w     #0x00E4,d0
		movea.l    a3,a0
		jsr        Auo_editor
		move.l     a5,(a7)
		move.l     a3,4(a7)
		move.w     #0x0003,8(a7)
		lea.l      (a7),a1
		moveq.l    #9,d0
		movea.l    a3,a0
		jsr        Auo_editor
		movea.l    20(a5),a0
		lea.l      120(a0),a0
		move.l     a0,4(a7)
		move.w     #0x0005,8(a7)
		lea.l      (a7),a1
		move.w     #0x00C8,d0
		movea.l    a3,a0
		jsr        Auo_editor
		move.l     #livefont,10(a7)
		move.l     20(a5),14(a7)
		lea.l      10(a7),a1
		move.w     #0x00E5,d0
		movea.l    a3,a0
		jsr        Auo_editor
		movea.l    20(a5),a3
		lea.l      360(a3),a3
		move.l     a3,4(a7)
		move.w     #0x000F,8(a7)
		lea.l      (a7),a1
		moveq.l    #9,d0
		movea.l    a3,a0
		jsr        Auo_editor
		movea.l    20(a5),a0
		lea.l      408(a0),a0
		move.l     a0,4(a7)
		move.w     #0x0011,8(a7)
		lea.l      (a7),a1
		move.w     #0x00C8,d0
		movea.l    a3,a0
		jsr        Auo_editor
		move.l     #liveheight,10(a7)
		move.l     20(a5),14(a7)
		lea.l      10(a7),a1
		move.w     #0x00E5,d0
		movea.l    a3,a0
		jsr        Auo_editor
		movea.l    a5,a0
		jsr        Awi_dialog
		cmp.w      #0x000A,d0
		bne.s      A_fontsel_7
		move.w     (a4),d0
		bne.s      A_fontsel_8
		movea.l    ACSblk,a0
		move.w     24(a0),(a4)
A_fontsel_8:
		movea.l    34(a7),a0
		move.w     (a4),(a0)
		movea.l    38(a7),a1
		move.w     -2(a4),(a1)
		clr.w      d3
		bra.s      A_fontsel_9
A_fontsel_7:
		moveq.l    #-1,d3
A_fontsel_9:
		movea.l    a5,a0
		jsr        Awi_delete
		movea.l    -8(a4),a0
		jsr        Ax_ifree
		move.w     d3,d0
A_fontsel_3:
		lea.l      42(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

	.data

TEXT_002:
		dc.b $00
TEXT_01:
		dc.b 'ÑîÅéôöû The quick brown fox jumps over the lazy dog',0
TEXT_013:
		dc.b 'OK',0
TEXT_02:
		dc.b 'Pixel:',0
TEXT_026:
		dc.b 'Abbruch',0
TEXT_03:
		dc.b 'Hîhe:',0
TEXT_04:
		dc.b 'Schrift:',0
TEXT_05:
		dc.b 'Test:',0
TEXT_06:
		dc.b ' Schrift-Auswahl ',0
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $0178
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON03:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_026
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON06:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_013
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_BOXED02:
		dc.l A_boxed
		dc.w $9070
		dc.w $0512
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_EDITOR01:
		dc.l A_editor
		dc.w $0000
		dc.w $0000
		dc.l Auo_editor
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_FTEXT01:
		dc.l A_ftext
		dc.w $0001
		dc.w $000d
		dc.l Auo_ftext
		dc.l TEXT_01
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_04
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME03:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_03
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME04:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_05
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_SLIDER01:
		dc.l A_slider
		dc.w $0000
		dc.w $0003
		dc.l Auo_slider
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
FONTSEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0001
		dc.w $0019
		dc.w $0000
		dc.w $0000
		dc.w $00ff
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $002e
		dc.w $0011
_01_FONTSEL:
		dc.w $0000
		dc.w $0002
		dc.w $000e
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0000
		dc.w $0000
		dc.w $002e
		dc.w $0011
_02_FONTSEL:
		dc.w $0007
		dc.w $0003
		dc.w $0005
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0001
		dc.w $0021
		dc.w $0009
_03_FONTSEL:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_EDITOR01
		dc.w $0001
		dc.w $0001
		dc.w $001d
		dc.w $0007
_03aFONTSEL:
		dc.l Aus_editor
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_05_FONTSEL:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_SLIDER01
		dc.w $001e
		dc.w $0001
		dc.w $0002
		dc.w $0007
_05aFONTSEL:
		dc.l Aus_slider
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_07_FONTSEL:
		dc.w $000a
		dc.w $0008
		dc.w $0008
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME04
		dc.w $0001
		dc.w $000a
		dc.w $002c
		dc.w $0004
_08_FONTSEL:
		dc.w $0007
		dc.w $0009
		dc.w $0009
		dc.w $0014
		dc.w $0040
		dc.w $0500
		dc.w $0000
		dc.w $1101
		dc.w $0001
		dc.w $0001
		dc.w $002a
		dc.w $0002
_09_FONTSEL:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0500
		dc.l A_FTEXT01
		dc.w $0001
		dc.w $0000
		dc.w $0028
		dc.w $0002
_10_FONTSEL:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON06
		dc.w $000a
		dc.w $000e
		dc.w $000c
		dc.w $0002
_10aFONTSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_12_FONTSEL:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0018
		dc.w $000e
		dc.w $000c
		dc.w $0002
_12aFONTSEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $8841
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_14_FONTSEL:
		dc.w $0001
		dc.w $000f
		dc.w $0014
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME03
		dc.w $0023
		dc.w $0001
		dc.w $000a
		dc.w $0009
_15_FONTSEL:
		dc.w $0011
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_EDITOR01
		dc.w $0001
		dc.w $0001
		dc.w $0006
		dc.w $0005
_15aFONTSEL:
		dc.l mod_height
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_17_FONTSEL:
		dc.w $0013
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_SLIDER01
		dc.w $0007
		dc.w $0001
		dc.w $0002
		dc.w $0005
_17aFONTSEL:
		dc.l Aus_slider
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_19_FONTSEL:
		dc.w $0014
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0040
		dc.w $0000
		dc.l TEXT_02
		dc.w $0001
		dc.w $0006
		dc.w $0006
		dc.w $0001
_20_FONTSEL:
		dc.w $000e
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0028
		dc.w $0010
		dc.l A_BOXED02
		dc.w $0002
		dc.w $0007
		dc.w $0005
		dc.w $0001
	.globl WI_FONTSEL
WI_FONTSEL:
		dc.w $0000
		dc.w $0000
		dc.l serv_wi_font
		dc.l Awi_selfcreate
		dc.l Awi_open
		dc.l Awi_init
		dc.l FONTSEL
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $200b
		dc.w $0000
		dc.w $0000
		dc.w $0078
		dc.w $0032
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $f8f8
		dc.l TEXT_06
		dc.l TEXT_002
		dc.w $2710
		dc.w $0100
		dc.w $0000
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
xd4ec2:
		dc.b '%d',0
xd4ec5:
		dc.b '%3d',0
xd4ec9:
		dc.b 'Pixel',0
		.even

	.bss

table: ds.l 1
fonts: ds.w 1
fontid: ds.w 1
height: ds.w 1
pixel: ds.w 1
