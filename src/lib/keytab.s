	.globl Akt_getKeyTab
Akt_getKeyTab:
		move.l     kt,d0
		bne.s      Akt_getKeyTab_1
		lea.l      kt,a0
		move.l     #$4B455954,d0
		jsr        Ash_getc
		tst.w      d0
		beq.s      Akt_getKeyTab_2
		movea.l    kt,a0
		cmpi.l     #$4B455954,(a0)
		beq.s      Akt_getKeyTab_1
Akt_getKeyTab_2:
		clr.l      kt
Akt_getKeyTab_1:
		movea.l    kt,a0
		rts

	.globl Akt_getExpMinNr
Akt_getExpMinNr:
		subq.w     #4,a7
		bsr.w      Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getExpMinNr_1
		movea.l    (a7),a0
		moveq.l    #104,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getExpMinNr_1
		movea.l    (a7),a0
		movea.l    104(a0),a0
		jsr        (a0)
		bra.s      Akt_getExpMinNr_2
		bra.s      Akt_getExpMinNr_2
Akt_getExpMinNr_1:
		clr.w      d0
		nop
Akt_getExpMinNr_2:
		addq.w     #4,a7
		rts

	.globl Akt_getExpMaxNr
Akt_getExpMaxNr:
		subq.w     #4,a7
		bsr.w      Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getExpMaxNr_1
		movea.l    (a7),a0
		movea.l    8(a0),a0
		jsr        (a0)
		bra.s      Akt_getExpMaxNr_2
		bra.s      Akt_getExpMaxNr_2
Akt_getExpMaxNr_1:
		moveq.l    #-1,d0
		nop
Akt_getExpMaxNr_2:
		addq.w     #4,a7
		rts

	.globl Akt_getImpMinNr
Akt_getImpMinNr:
		subq.w     #4,a7
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getImpMinNr_1
		movea.l    (a7),a0
		moveq.l    #104,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getImpMinNr_1
		movea.l    (a7),a0
		movea.l    108(a0),a0
		jsr        (a0)
		bra.s      Akt_getImpMinNr_2
		bra.s      Akt_getImpMinNr_2
Akt_getImpMinNr_1:
		clr.w      d0
		nop
Akt_getImpMinNr_2:
		addq.w     #4,a7
		rts

	.globl Akt_getImpMaxNr
Akt_getImpMaxNr:
		subq.w     #4,a7
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getImpMaxNr_1
		movea.l    (a7),a0
		movea.l    24(a0),a0
		jsr        (a0)
		bra.s      Akt_getImpMaxNr_2
		bra.s      Akt_getImpMaxNr_2
Akt_getImpMaxNr_1:
		moveq.l    #-1,d0
		nop
Akt_getImpMaxNr_2:
		addq.w     #4,a7
		rts

	.globl Akt_getExpNameFromNr
Akt_getExpNameFromNr:
		subq.w     #6,a7
		move.w     d0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getExpNameFromNr_1
		movea.l    (a7),a0
		moveq.l    #56,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getExpNameFromNr_2
		move.w     4(a7),-(a7)
		movea.l    2(a7),a0
		movea.l    48(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		movea.l    d0,a0
		bra.s      Akt_getExpNameFromNr_3
		bra.s      Akt_getExpNameFromNr_4
Akt_getExpNameFromNr_2:
		move.w     4(a7),-(a7)
		move.w     6(a7),d0
		movea.l    2(a7),a0
		movea.l    12(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		bra.s      Akt_getExpNameFromNr_3
Akt_getExpNameFromNr_4:
		bra.s      Akt_getExpNameFromNr_3
Akt_getExpNameFromNr_1:
		suba.l     a0,a0
		nop
Akt_getExpNameFromNr_3:
		addq.w     #6,a7
		rts

	.globl Akt_getImpNameFromNr
Akt_getImpNameFromNr:
		subq.w     #6,a7
		move.w     d0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getImpNameFromNr_1
		movea.l    (a7),a0
		moveq.l    #56,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getImpNameFromNr_2
		move.w     4(a7),-(a7)
		movea.l    2(a7),a0
		movea.l    52(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		movea.l    d0,a0
		bra.s      Akt_getImpNameFromNr_3
		bra.s      Akt_getImpNameFromNr_4
Akt_getImpNameFromNr_2:
		move.w     4(a7),-(a7)
		move.w     6(a7),d0
		movea.l    2(a7),a0
		movea.l    28(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		bra.s      Akt_getImpNameFromNr_3
Akt_getImpNameFromNr_4:
		bra.s      Akt_getImpNameFromNr_3
Akt_getImpNameFromNr_1:
		suba.l     a0,a0
		nop
Akt_getImpNameFromNr_3:
		addq.w     #6,a7
		rts

	.globl Akt_getExpShortNameFromNr
Akt_getExpShortNameFromNr:
		subq.w     #6,a7
		move.w     d0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getExpShortNameFromNr_1
		movea.l    (a7),a0
		moveq.l    #64,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getExpShortNameFromNr_1
		move.w     4(a7),-(a7)
		movea.l    2(a7),a0
		movea.l    56(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		movea.l    d0,a0
		bra.s      Akt_getExpShortNameFromNr_2
		bra.s      Akt_getExpShortNameFromNr_2
Akt_getExpShortNameFromNr_1:
		suba.l     a0,a0
		nop
Akt_getExpShortNameFromNr_2:
		addq.w     #6,a7
		rts

	.globl Akt_getImpShortNameFromNr
Akt_getImpShortNameFromNr:
		subq.w     #6,a7
		move.w     d0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getImpShortNameFromNr_1
		movea.l    (a7),a0
		moveq.l    #64,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getImpShortNameFromNr_1
		move.w     4(a7),-(a7)
		movea.l    2(a7),a0
		movea.l    60(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		movea.l    d0,a0
		bra.s      Akt_getImpShortNameFromNr_2
		bra.s      Akt_getImpShortNameFromNr_2
Akt_getImpShortNameFromNr_1:
		suba.l     a0,a0
		nop
Akt_getImpShortNameFromNr_2:
		addq.w     #6,a7
		rts

	.globl Akt_getRelease
Akt_getRelease:
		subq.w     #4,a7
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getRelease_1
		movea.l    (a7),a0
		moveq.l    #76,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getRelease_1
		movea.l    (a7),a0
		movea.l    64(a0),a0
		jsr        (a0)
		bra.s      Akt_getRelease_2
		bra.s      Akt_getRelease_2
Akt_getRelease_1:
		moveq.l    #-1,d0
		nop
Akt_getRelease_2:
		addq.w     #4,a7
		rts

	.globl Akt_getExpNrFromId
Akt_getExpNrFromId:
		subq.w     #6,a7
		move.w     d0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getExpNrFromId_1
		move.w     4(a7),-(a7)
		movea.l    2(a7),a0
		movea.l    16(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		bra.s      Akt_getExpNrFromId_2
		bra.s      Akt_getExpNrFromId_2
Akt_getExpNrFromId_1:
		moveq.l    #-1,d0
		nop
Akt_getExpNrFromId_2:
		addq.w     #6,a7
		rts

	.globl Akt_getImpNrFromId
Akt_getImpNrFromId:
		subq.w     #6,a7
		move.w     d0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getImpNrFromId_1
		move.w     4(a7),-(a7)
		movea.l    2(a7),a0
		movea.l    32(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		bra.s      Akt_getImpNrFromId_2
		bra.s      Akt_getImpNrFromId_2
Akt_getImpNrFromId_1:
		moveq.l    #-1,d0
		nop
Akt_getImpNrFromId_2:
		addq.w     #6,a7
		rts

	.globl Akt_getExpIdFromNr
Akt_getExpIdFromNr:
		subq.w     #6,a7
		move.w     d0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getExpIdFromNr_1
		movea.l    (a7),a0
		moveq.l    #76,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getExpIdFromNr_1
		move.w     4(a7),-(a7)
		movea.l    2(a7),a0
		movea.l    68(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		bra.s      Akt_getExpIdFromNr_2
		bra.s      Akt_getExpIdFromNr_2
Akt_getExpIdFromNr_1:
		moveq.l    #-1,d0
		nop
Akt_getExpIdFromNr_2:
		addq.w     #6,a7
		rts

	.globl Akt_getImpIdFromNr
Akt_getImpIdFromNr:
		subq.w     #6,a7
		move.w     d0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getImpIdFromNr_1
		movea.l    (a7),a0
		moveq.l    #76,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getImpIdFromNr_1
		move.w     4(a7),-(a7)
		movea.l    2(a7),a0
		movea.l    72(a0),a0
		jsr        (a0)
		addq.w     #2,a7
		bra.s      Akt_getImpIdFromNr_2
		bra.s      Akt_getImpIdFromNr_2
Akt_getImpIdFromNr_1:
		moveq.l    #-1,d0
		nop
Akt_getImpIdFromNr_2:
		addq.w     #6,a7
		rts

	.globl Akt_getExpNrFromName
Akt_getExpNrFromName:
		subq.w     #8,a7
		move.l     a0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getExpNrFromName_1
		movea.l    (a7),a0
		moveq.l    #84,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getExpNrFromName_1
		move.l     4(a7),-(a7)
		movea.l    4(a7),a0
		movea.l    76(a0),a0
		jsr        (a0)
		addq.w     #4,a7
		bra.s      Akt_getExpNrFromName_2
		bra.s      Akt_getExpNrFromName_2
Akt_getExpNrFromName_1:
		clr.w      d0
		nop
Akt_getExpNrFromName_2:
		addq.w     #8,a7
		rts

	.globl Akt_getImpNrFromName
Akt_getImpNrFromName:
		subq.w     #8,a7
		move.l     a0,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_getImpNrFromName_1
		movea.l    (a7),a0
		moveq.l    #84,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getImpNrFromName_1
		move.l     4(a7),-(a7)
		movea.l    4(a7),a0
		movea.l    80(a0),a0
		jsr        (a0)
		addq.w     #4,a7
		bra.s      Akt_getImpNrFromName_2
		bra.s      Akt_getImpNrFromName_2
Akt_getImpNrFromName_1:
		clr.w      d0
		nop
Akt_getImpNrFromName_2:
		addq.w     #8,a7
		rts

	.globl Akt_getEuro
Akt_getEuro:
		subq.w     #8,a7
		bsr        Akt_getKeyTab
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      Akt_getEuro_1
		movea.l    4(a7),a0
		moveq.l    #88,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_getEuro_1
		movea.l    4(a7),a0
		movea.l    84(a0),a0
		jsr        (a0)
		bra.s      Akt_getEuro_2
		bra.s      Akt_getEuro_2
Akt_getEuro_1:
		lea.l      (a7),a0
		move.l     #$4555524F,d0
		jsr        Ash_getc
		tst.w      d0
		beq.s      Akt_getEuro_3
		move.l     (a7),d0
		bra.s      Akt_getEuro_2
		bra.s      Akt_getEuro_2
Akt_getEuro_3:
		move.l     #$000002EC,d0
		nop
Akt_getEuro_2:
		addq.w     #8,a7
		rts

	.globl Akt_CharAtari2X
Akt_CharAtari2X:
		subq.w     #8,a7
		move.w     d0,6(a7)
		move.b     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_CharAtari2X_1
		move.b     4(a7),-(a7)
		move.w     8(a7),-(a7)
		movea.l    4(a7),a0
		movea.l    20(a0),a0
		jsr        (a0)
		addq.w     #4,a7
		bra.s      Akt_CharAtari2X_2
		bra.s      Akt_CharAtari2X_2
Akt_CharAtari2X_1:
		move.b     4(a7),d0
		nop
Akt_CharAtari2X_2:
		addq.w     #8,a7
		rts

	.globl Akt_CharX2Atari
Akt_CharX2Atari:
		subq.w     #8,a7
		move.w     d0,6(a7)
		move.b     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_CharX2Atari_1
		move.b     4(a7),-(a7)
		move.w     8(a7),-(a7)
		movea.l    4(a7),a0
		movea.l    36(a0),a0
		jsr        (a0)
		addq.w     #4,a7
		bra.s      Akt_CharX2Atari_2
		bra.s      Akt_CharX2Atari_2
Akt_CharX2Atari_1:
		move.b     4(a7),d0
		nop
Akt_CharX2Atari_2:
		addq.w     #8,a7
		rts

	.globl Akt_BlockAtari2X
Akt_BlockAtari2X:
		lea.l      -26(a7),a7
		move.l     a0,14(a7)
		move.w     d0,12(a7)
		move.l     a1,8(a7)
		move.l     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     8(a7),d0
		beq.s      Akt_BlockAtari2X_1
		movea.l    14(a7),a0
		cmpa.l     8(a7),a0
		beq.s      Akt_BlockAtari2X_1
		move.l     4(a7),d0
		movea.l    8(a7),a1
		movea.l    14(a7),a0
		jsr        memcpy
Akt_BlockAtari2X_1:
		move.l     (a7),d0
		beq.s      Akt_BlockAtari2X_2
		movea.l    (a7),a0
		moveq.l    #48,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_BlockAtari2X_3
		move.l     14(a7),-(a7)
		move.l     8(a7),-(a7)
		move.w     20(a7),-(a7)
		movea.l    10(a7),a0
		movea.l    40(a0),a0
		jsr        (a0)
		lea.l      10(a7),a7
		bra.s      Akt_BlockAtari2X_2
Akt_BlockAtari2X_3:
		move.l     14(a7),22(a7)
		clr.l      18(a7)
		bra.s      Akt_BlockAtari2X_4
Akt_BlockAtari2X_5:
		movea.l    22(a7),a0
		move.b     (a0),-(a7)
		move.w     14(a7),-(a7)
		movea.l    4(a7),a0
		movea.l    20(a0),a0
		jsr        (a0)
		addq.w     #4,a7
		movea.l    22(a7),a0
		move.b     d0,(a0)
		addq.l     #1,18(a7)
		addq.l     #1,22(a7)
Akt_BlockAtari2X_4:
		move.l     18(a7),d0
		cmp.l      4(a7),d0
		blt.s      Akt_BlockAtari2X_5
Akt_BlockAtari2X_2:
		movea.l    14(a7),a0
		lea.l      26(a7),a7
		rts

	.globl Akt_BlockX2Atari
Akt_BlockX2Atari:
		lea.l      -26(a7),a7
		move.l     a0,14(a7)
		move.w     d0,12(a7)
		move.l     a1,8(a7)
		move.l     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     8(a7),d0
		beq.s      Akt_BlockX2Atari_1
		movea.l    14(a7),a0
		cmpa.l     8(a7),a0
		beq.s      Akt_BlockX2Atari_1
		move.l     4(a7),d0
		movea.l    8(a7),a1
		movea.l    14(a7),a0
		jsr        memcpy
Akt_BlockX2Atari_1:
		move.l     (a7),d0
		beq.s      Akt_BlockX2Atari_2
		movea.l    (a7),a0
		moveq.l    #48,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_BlockX2Atari_3
		move.l     14(a7),-(a7)
		move.l     8(a7),-(a7)
		move.w     20(a7),-(a7)
		movea.l    10(a7),a0
		movea.l    44(a0),a0
		jsr        (a0)
		lea.l      10(a7),a7
		bra.s      Akt_BlockX2Atari_2
Akt_BlockX2Atari_3:
		move.l     14(a7),22(a7)
		clr.l      18(a7)
		bra.s      Akt_BlockX2Atari_4
Akt_BlockX2Atari_5:
		movea.l    22(a7),a0
		move.b     (a0),-(a7)
		move.w     14(a7),-(a7)
		movea.l    4(a7),a0
		movea.l    36(a0),a0
		jsr        (a0)
		addq.w     #4,a7
		movea.l    22(a7),a0
		move.b     d0,(a0)
		addq.l     #1,18(a7)
		addq.l     #1,22(a7)
Akt_BlockX2Atari_4:
		move.l     18(a7),d0
		cmp.l      4(a7),d0
		blt.s      Akt_BlockX2Atari_5
Akt_BlockX2Atari_2:
		movea.l    14(a7),a0
		lea.l      26(a7),a7
		rts

	.globl Akt_StringAtari2X
Akt_StringAtari2X:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		jsr        strlen
		move.l     d0,d1
		addq.l     #1,d1
		movea.l    (a7),a1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		bsr        Akt_BlockAtari2X
		lea.l      10(a7),a7
		rts

	.globl Akt_StringX2Atari
Akt_StringX2Atari:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		jsr        strlen
		move.l     d0,d1
		addq.l     #1,d1
		movea.l    (a7),a1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		bsr        Akt_BlockX2Atari
		lea.l      10(a7),a7
		rts

	.globl Akt_CharX2Unicode
Akt_CharX2Unicode:
		subq.w     #8,a7
		move.w     d0,6(a7)
		move.b     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_CharX2Unicode_1
		movea.l    (a7),a0
		moveq.l    #96,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_CharX2Unicode_1
		move.b     4(a7),-(a7)
		move.w     8(a7),-(a7)
		movea.l    4(a7),a0
		movea.l    88(a0),a0
		jsr        (a0)
		addq.w     #4,a7
		bra.s      Akt_CharX2Unicode_2
		bra.s      Akt_CharX2Unicode_2
Akt_CharX2Unicode_1:
		move.b     4(a7),d0
		ext.w      d0
		nop
Akt_CharX2Unicode_2:
		addq.w     #8,a7
		rts

	.globl Akt_CharUnicode2X
Akt_CharUnicode2X:
		subq.w     #8,a7
		move.w     d0,6(a7)
		move.w     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_CharUnicode2X_1
		movea.l    (a7),a0
		moveq.l    #96,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_CharUnicode2X_1
		move.w     4(a7),-(a7)
		move.w     8(a7),-(a7)
		movea.l    4(a7),a0
		movea.l    92(a0),a0
		jsr        (a0)
		addq.w     #4,a7
		bra.s      Akt_CharUnicode2X_2
		bra.s      Akt_CharUnicode2X_2
Akt_CharUnicode2X_1:
		moveq.l    #-1,d0
		and.b      5(a7),d0
		nop
Akt_CharUnicode2X_2:
		addq.w     #8,a7
		rts

	.globl Akt_BlockX2Unicode
Akt_BlockX2Unicode:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.w     d0,12(a7)
		move.l     a1,8(a7)
		move.l     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_BlockX2Unicode_1
		movea.l    (a7),a0
		moveq.l    #96,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_BlockX2Unicode_2
		move.l     4(a7),-(a7)
		move.l     12(a7),-(a7)
		move.w     20(a7),-(a7)
		move.l     24(a7),-(a7)
		movea.l    14(a7),a0
		movea.l    96(a0),a0
		jsr        (a0)
		lea.l      14(a7),a7
		bra.s      Akt_BlockX2Unicode_1
Akt_BlockX2Unicode_2:
		move.l     4(a7),d1
		add.l      d1,d1
		clr.w      d0
		movea.l    14(a7),a0
		jsr        memset
		suba.l     a0,a0
		bra.s      Akt_BlockX2Unicode_3
Akt_BlockX2Unicode_1:
		movea.l    14(a7),a0
Akt_BlockX2Unicode_3:
		lea.l      18(a7),a7
		rts

	.globl Akt_BlockUnicode2X
Akt_BlockUnicode2X:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.w     d0,12(a7)
		move.l     a1,8(a7)
		move.l     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_BlockUnicode2X_1
		movea.l    (a7),a0
		moveq.l    #96,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_BlockUnicode2X_2
		move.l     4(a7),-(a7)
		move.l     12(a7),-(a7)
		move.w     20(a7),-(a7)
		move.l     24(a7),-(a7)
		movea.l    14(a7),a0
		movea.l    100(a0),a0
		jsr        (a0)
		lea.l      14(a7),a7
		bra.s      Akt_BlockUnicode2X_1
Akt_BlockUnicode2X_2:
		suba.l     a0,a0
		bra.s      Akt_BlockUnicode2X_3
Akt_BlockUnicode2X_1:
		movea.l    14(a7),a0
Akt_BlockUnicode2X_3:
		lea.l      18(a7),a7
		rts

	.globl Akt_StringX2Unicode
Akt_StringX2Unicode:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.w     d0,4(a7)
		move.l     a1,(a7)
		movea.l    (a7),a0
		jsr        strlen
		move.l     d0,d1
		addq.l     #1,d1
		movea.l    (a7),a1
		move.w     4(a7),d0
		movea.l    6(a7),a0
		bsr        Akt_BlockX2Unicode
		lea.l      10(a7),a7
		rts

	.globl Akt_BlockXUtf2Unicode
Akt_BlockXUtf2Unicode:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		move.w     d0,8(a7)
		move.l     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_BlockXUtf2Unicode_1
		movea.l    (a7),a0
		moveq.l    #104,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_BlockXUtf2Unicode_2
		move.l     4(a7),-(a7)
		move.l     26(a7),-(a7)
		move.w     16(a7),-(a7)
		move.l     20(a7),-(a7)
		move.l     28(a7),-(a7)
		movea.l    18(a7),a0
		movea.l    120(a0),a0
		jsr        (a0)
		lea.l      18(a7),a7
		bra.s      Akt_BlockXUtf2Unicode_1
Akt_BlockXUtf2Unicode_2:
		suba.l     a0,a0
		bra.s      Akt_BlockXUtf2Unicode_3
Akt_BlockXUtf2Unicode_1:
		movea.l    14(a7),a0
Akt_BlockXUtf2Unicode_3:
		lea.l      18(a7),a7
		rts

	.globl Akt_BlockUnicode2XUtf
Akt_BlockUnicode2XUtf:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		move.w     d0,8(a7)
		move.l     d1,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_BlockUnicode2XUtf_1
		movea.l    (a7),a0
		moveq.l    #104,d0
		cmp.l      4(a0),d0
		bgt.s      Akt_BlockUnicode2XUtf_1
		move.l     4(a7),-(a7)
		move.l     26(a7),-(a7)
		move.w     16(a7),-(a7)
		move.l     20(a7),-(a7)
		move.l     28(a7),-(a7)
		movea.l    18(a7),a0
		movea.l    124(a0),a0
		jsr        (a0)
		lea.l      18(a7),a7
		movea.l    14(a7),a0
		bra.s      Akt_BlockUnicode2XUtf_2
Akt_BlockUnicode2XUtf_1:
		suba.l     a0,a0
Akt_BlockUnicode2XUtf_2:
		lea.l      18(a7),a7
		rts

	.globl Akt_BlockXUtf2U2XUtf
Akt_BlockXUtf2U2XUtf:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     a1,12(a7)
		move.w     d0,10(a7)
		move.l     d1,6(a7)
		move.w     d2,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_BlockXUtf2U2XUtf_1
		movea.l    (a7),a0
		cmpi.l     #$00000084,4(a0)
		blt.s      Akt_BlockXUtf2U2XUtf_2
		move.w     4(a7),-(a7)
		move.l     8(a7),-(a7)
		move.l     30(a7),-(a7)
		move.w     20(a7),-(a7)
		move.l     24(a7),-(a7)
		move.l     32(a7),-(a7)
		movea.l    20(a7),a0
		movea.l    128(a0),a0
		jsr        (a0)
		lea.l      20(a7),a7
		movea.l    16(a7),a0
		bra.s      Akt_BlockXUtf2U2XUtf_3
		bra.s      Akt_BlockXUtf2U2XUtf_1
Akt_BlockXUtf2U2XUtf_2:
		move.l     12(a7),d0
		beq.s      Akt_BlockXUtf2U2XUtf_1
		movea.l    12(a7),a0
		move.l     #$FFFFFFFF,(a0)
Akt_BlockXUtf2U2XUtf_1:
		suba.l     a0,a0
Akt_BlockXUtf2U2XUtf_3:
		lea.l      20(a7),a7
		rts

	.globl Akt_BlockXUtf2XUtf
Akt_BlockXUtf2XUtf:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     a1,12(a7)
		move.w     d0,10(a7)
		move.l     d1,6(a7)
		move.w     d2,4(a7)
		bsr        Akt_getKeyTab
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Akt_BlockXUtf2XUtf_1
		movea.l    (a7),a0
		cmpi.l     #$00000088,4(a0)
		blt.s      Akt_BlockXUtf2XUtf_2
		move.w     4(a7),-(a7)
		move.l     8(a7),-(a7)
		move.l     30(a7),-(a7)
		move.w     20(a7),-(a7)
		move.l     24(a7),-(a7)
		move.l     32(a7),-(a7)
		movea.l    20(a7),a0
		movea.l    132(a0),a0
		jsr        (a0)
		lea.l      20(a7),a7
		movea.l    16(a7),a0
		bra.s      Akt_BlockXUtf2XUtf_3
		bra.s      Akt_BlockXUtf2XUtf_1
Akt_BlockXUtf2XUtf_2:
		move.l     12(a7),d0
		beq.s      Akt_BlockXUtf2XUtf_1
		movea.l    12(a7),a0
		move.l     #$FFFFFFFF,(a0)
Akt_BlockXUtf2XUtf_1:
		suba.l     a0,a0
Akt_BlockXUtf2XUtf_3:
		lea.l      20(a7),a7
		rts

	.globl Akt_StringXUtf2Unicode
Akt_StringXUtf2Unicode:
		lea.l      -10(a7),a7
		move.l     a0,6(a7)
		move.l     a1,2(a7)
		move.w     d0,(a7)
		move.l     14(a7),-(a7)
		movea.l    18(a7),a0
		jsr        strlen
		move.l     d0,d1
		addq.l     #1,d1
		move.w     4(a7),d0
		movea.l    6(a7),a1
		movea.l    10(a7),a0
		bsr        Akt_BlockXUtf2Unicode
		addq.w     #4,a7
		lea.l      10(a7),a7
		rts

	.globl Akt_StringXUtf2U2XUtf
Akt_StringXUtf2U2XUtf:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.w     d0,2(a7)
		move.w     d1,(a7)
		move.l     16(a7),-(a7)
		movea.l    20(a7),a0
		jsr        strlen
		move.l     d0,d1
		addq.l     #1,d1
		move.w     6(a7),d0
		movea.l    8(a7),a1
		movea.l    12(a7),a0
		move.w     4(a7),d2
		bsr        Akt_BlockXUtf2U2XUtf
		addq.w     #4,a7
		lea.l      12(a7),a7
		rts

	.globl Akt_StringXUtf2XUtf
Akt_StringXUtf2XUtf:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		move.w     d0,2(a7)
		move.w     d1,(a7)
		move.l     16(a7),-(a7)
		movea.l    20(a7),a0
		jsr        strlen
		move.l     d0,d1
		addq.l     #1,d1
		move.w     6(a7),d0
		movea.l    8(a7),a1
		movea.l    12(a7),a0
		move.w     4(a7),d2
		bsr        Akt_BlockXUtf2XUtf
		addq.w     #4,a7
		lea.l      12(a7),a7
		rts

	.globl Akt_popExpName
Akt_popExpName:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		bsr        Akt_getExpMaxNr
		addq.w     #1,d0
		move.w     d0,10(a7)
		move.w     10(a7),d1
		move.w     d1,d0
		lsl.w      #2,d0
		add.w      d1,d0
		lsl.w      #3,d0
		addq.w     #1,d0
		ext.l      d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Akt_popExpName_1
		suba.l     a0,a0
		bra        Akt_popExpName_2
Akt_popExpName_1:
		movea.l    4(a7),a0
		clr.b      (a0)
		clr.w      d0
		move.w     d0,12(a7)
		move.w     d0,8(a7)
		bra.s      Akt_popExpName_3
Akt_popExpName_7:
		move.w     12(a7),d0
		bsr        Akt_getExpNameFromNr
		move.l     a0,(a7)
		lea.l      xe146e,a1
		movea.l    4(a7),a0
		jsr        strcat
		movea.l    (a7),a1
		movea.l    4(a7),a0
		jsr        strcat
		move.w     12(a7),d0
		cmp.w      10(a7),d0
		bge.s      Akt_popExpName_4
		lea.l      xe1470,a1
		movea.l    4(a7),a0
		jsr        strcat
		bra.s      Akt_popExpName_5
Akt_popExpName_4:
		lea.l      xe1473,a1
		movea.l    4(a7),a0
		jsr        strcat
Akt_popExpName_5:
		move.w     8(a7),d0
		ext.l      d0
		move.l     d0,-(a7)
		movea.l    4(a7),a0
		jsr        strlen
		cmp.l      (a7)+,d0
		bls.s      Akt_popExpName_6
		movea.l    (a7),a0
		jsr        strlen
		move.w     d0,8(a7)
Akt_popExpName_6:
		addq.w     #1,12(a7)
Akt_popExpName_3:
		move.w     12(a7),d0
		cmp.w      10(a7),d0
		blt        Akt_popExpName_7
		move.l     14(a7),d0
		beq.s      Akt_popExpName_8
		moveq.l    #2,d0
		add.w      8(a7),d0
		movea.l    14(a7),a0
		move.w     d0,(a0)
Akt_popExpName_8:
		movea.l    4(a7),a0
Akt_popExpName_2:
		lea.l      18(a7),a7
		rts

	.globl Akt_popImpName
Akt_popImpName:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		bsr        Akt_getImpMaxNr
		addq.w     #1,d0
		move.w     d0,10(a7)
		move.w     10(a7),d1
		move.w     d1,d0
		lsl.w      #2,d0
		add.w      d1,d0
		lsl.w      #3,d0
		addq.w     #1,d0
		ext.l      d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Akt_popImpName_1
		suba.l     a0,a0
		bra        Akt_popImpName_2
Akt_popImpName_1:
		movea.l    4(a7),a0
		clr.b      (a0)
		clr.w      d0
		move.w     d0,12(a7)
		move.w     d0,8(a7)
		bra.s      Akt_popImpName_3
Akt_popImpName_7:
		move.w     12(a7),d0
		bsr        Akt_getImpNameFromNr
		move.l     a0,(a7)
		lea.l      xe1475,a1
		movea.l    4(a7),a0
		jsr        strcat
		movea.l    (a7),a1
		movea.l    4(a7),a0
		jsr        strcat
		move.w     12(a7),d0
		cmp.w      10(a7),d0
		bge.s      Akt_popImpName_4
		lea.l      xe1477,a1
		movea.l    4(a7),a0
		jsr        strcat
		bra.s      Akt_popImpName_5
Akt_popImpName_4:
		lea.l      xe147a,a1
		movea.l    4(a7),a0
		jsr        strcat
Akt_popImpName_5:
		move.w     8(a7),d0
		ext.l      d0
		move.l     d0,-(a7)
		movea.l    4(a7),a0
		jsr        strlen
		cmp.l      (a7)+,d0
		bls.s      Akt_popImpName_6
		movea.l    (a7),a0
		jsr        strlen
		move.w     d0,8(a7)
Akt_popImpName_6:
		addq.w     #1,12(a7)
Akt_popImpName_3:
		move.w     12(a7),d0
		cmp.w      10(a7),d0
		blt        Akt_popImpName_7
		move.l     14(a7),d0
		beq.s      Akt_popImpName_8
		moveq.l    #2,d0
		add.w      8(a7),d0
		movea.l    14(a7),a0
		move.w     d0,(a0)
Akt_popImpName_8:
		movea.l    4(a7),a0
Akt_popImpName_2:
		lea.l      18(a7),a7
		rts

	.globl Akt_chooseExpNr
Akt_chooseExpNr:
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.w     d0,18(a7)
		move.w     d1,16(a7)
		move.w     #$FFFF,(a7)
		lea.l      2(a7),a0
		bsr        Akt_popExpName
		move.l     a0,12(a7)
		move.l     12(a7),d0
		bne.s      Akt_chooseExpNr_1
		moveq.l    #-1,d0
		bra.s      Akt_chooseExpNr_2
Akt_chooseExpNr_1:
		pea.l      xe147c
		move.w     20(a7),d2
		move.w     22(a7),d1
		movea.l    ACSblk,a0
		move.w     22(a0),d0
		muls.w     6(a7),d0
		movea.l    16(a7),a1
		movea.l    24(a7),a0
		jsr        Ame_strpopup
		addq.w     #4,a7
		move.l     a0,8(a7)
		move.l     8(a7),d0
		beq.s      Akt_chooseExpNr_3
		moveq.l    #124,d0
		movea.l    8(a7),a0
		jsr        strchr
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      Akt_chooseExpNr_4
		movea.l    4(a7),a0
		clr.b      (a0)
Akt_chooseExpNr_4:
		movea.l    8(a7),a0
		jsr        Ast_alltrim
		movea.l    8(a7),a0
		bsr        Akt_getExpNrFromName
		move.w     d0,(a7)
Akt_chooseExpNr_3:
		move.w     (a7),d0
Akt_chooseExpNr_2:
		lea.l      24(a7),a7
		rts

	.globl Akt_chooseImpNr
Akt_chooseImpNr:
		lea.l      -24(a7),a7
		move.l     a0,20(a7)
		move.w     d0,18(a7)
		move.w     d1,16(a7)
		move.w     #$FFFF,(a7)
		lea.l      2(a7),a0
		bsr        Akt_popImpName
		move.l     a0,12(a7)
		move.l     12(a7),d0
		bne.s      Akt_chooseImpNr_1
		moveq.l    #-1,d0
		bra.s      Akt_chooseImpNr_2
Akt_chooseImpNr_1:
		pea.l      xe147d
		move.w     20(a7),d2
		move.w     22(a7),d1
		movea.l    ACSblk,a0
		move.w     22(a0),d0
		muls.w     6(a7),d0
		movea.l    16(a7),a1
		movea.l    24(a7),a0
		jsr        Ame_strpopup
		addq.w     #4,a7
		move.l     a0,8(a7)
		move.l     8(a7),d0
		beq.s      Akt_chooseImpNr_3
		moveq.l    #124,d0
		movea.l    8(a7),a0
		jsr        strchr
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      Akt_chooseImpNr_4
		movea.l    4(a7),a0
		clr.b      (a0)
Akt_chooseImpNr_4:
		movea.l    8(a7),a0
		jsr        Ast_alltrim
		movea.l    8(a7),a0
		bsr        Akt_getImpNrFromName
		move.w     d0,(a7)
Akt_chooseImpNr_3:
		move.w     (a7),d0
Akt_chooseImpNr_2:
		lea.l      24(a7),a7
		rts

	.data

kt:
		dc.w $0000
		dc.w $0000
xe146e:
		dc.b $20,00
xe1470:
		dc.b $20,$7c,0
xe1473:
		dc.b $20,0
xe1475:
		dc.b $20,0
xe1477:
		dc.b $20,$7c,0
xe147a:
		dc.b $20,0
xe147c:
		dc.b 0
xe147d:
		dc.b 0
		.even
