****************************************************************************
*
* reduced NKCC for the CF-Lib
* Pure-C compatible version
*
****************************************************************************

****************************************************************************
*						  ASSEMBLER CONTROL SECTION 					   *
****************************************************************************

VERSION 		=	$0294			; NKCC's version #

NKFf_FUNC		=	$8000
NKFf_RESVD		=	$4000
NKFf_NUM		=	$2000
NKFf_CAPS		=	$1000
NKFf_ALT		=	$0800
NKFf_CTRL		=	$0400
NKFf_SHIFT		=	$0300			; both shift keys

NKFb_FUNC		=	15				; function
NKFb_RESVD		=	14				; reserved, ignore it!
NKFb_NUM		=	13				; numeric pad
NKFb_CAPS		=	12				; CapsLock
NKFb_ALT		=	11				; Alternate
NKFb_CTRL		=	10				; Control
NKFb_LSH		=	9				; left Shift key
NKFb_RSH		=	8				; right Shift key

NK_UP			=	$01 			; cursor up
NK_DOWN 		=	$02 			; cursor down
NK_RIGHT		=	$03 			; cursor right
NK_LEFT 		=	$04 			; cursor left
NK_M_PGUP		=	$05 			; Mac: page up
NK_M_PGDOWN 	=	$06 			; Mac: page down
NK_M_END		=	$07 			; Mac: end
NK_INS			=	$0b 			; Insert
NK_CLRHOME		=	$0c 			; Clr/Home
NK_HELP 		=	$0e 			; Help
NK_UNDO 		=	$0f 			; Undo
NK_M_F11		=	$1a 			; Mac: function key #11
NK_M_F12		=	$1c 			; Mac: function key #12
NK_M_F14		=	$1d 			; Mac: function key #14
NK_ENTER		=	$0a 			; Enter
NK_DEL			=	$1f 			; Delete

****************************************************************************
*							 LOCAL TEXT SECTION 						   *
****************************************************************************

			.text

****************************************************************************
*
*  nk_findscan: find scan code
*
****************************************************************************

nk_findscan:
		btst       #NKFb_NUM,d0		 ; on numeric keypad?
		beq.s      nk_finds_search   ; no ->

		move.w     #0x4a,d1			 ; yes: try all numeric keypad
		cmp.b      0(a0,d1.w),d0     ;	scan codes first
		beq.s      nk_finds_found	 ; it matches ->

		move.w     #0x4e,d1
		cmp.b      0(a0,d1.w),d0
		beq.s      nk_finds_found

		move.w     #0x63,d1 			 ; block starts at $63

nk_finds_numsearch:
		cmp.b      0(a0,d1.w),d0			 ; match?
		beq.s      nk_finds_found				 ; yes ->

		addq.w     #1,d1				 ; next scan code
		cmp.w      #0x73,d1 			 ; block end at $72
		bcs.s      nk_finds_numsearch    ; continue search ->

nk_finds_search:
		move.w     #1,d1				 ; start with first valid scan code

nk_finds_mainsearch:
		cmp.b      0(a0,d1.w),d0		 ; match?
		beq.s      nk_finds_found				 ; yes ->

		addq.b     #1,d1				 ; next scan code
		cmp.b      #0x78,d1 			 ; $78 = last valid scan code
		bcs.s      nk_finds_mainsearch 		 ; continue search ->

		moveq.l    #0,d1				 ; not found
		rts
nk_finds_found:
		tst.w      d1					 ; found; set CCR
		rts

****************************************************************************
*
*  nkc_init: initialize NKCC
*
****************************************************************************

		.globl nkc_init
nkc_init:

*------------- fetch addresses of TOS' key scan code translation tables

		moveq.l    #-1,d0				 ; the function is also used to
		move.l     d0,-(sp)			 ; change the addresses; values
		move.l     d0,-(sp)			 ; of -1 as new addresses tell
		move.l     d0,-(sp)			 ; XBIOS not to change them
		move.w     #0x10,-(sp)			 ; Keytbl
		trap       #14 				 ; XBIOS
		lea.l      14(sp),sp			 ; clean stack

		movea.l    d0,a0				 ; ^key table structure
		move.l     (a0)+,pkey_unshift	 ; get ^unshifted table
		move.l     (a0)+,pkey_shift	 ; get ^shifted table
		move.l     (a0),pkey_caps		 ; get ^CapsLock table

*------------- exit

		move.w     #VERSION,d0 		 ; load version #
		rts							 ; bye


****************************************************************************
*
*  nkc_tconv: TOS key code converter
*
****************************************************************************

		.globl nkc_tos2n
nkc_tos2n:

		movem.l    d3-d4,-(sp) 		 ; save registers

*------------- separate TOS key code

		move.l     d0,d1				 ; TOS key code
		swap       d1					 ; .W = scan code and flags
		move.w     d1,d2				 ; copy
		move.w     #0xff,d3 			 ; and-mask
		and.w      d3,d0				 ; .B = ASCII code
		and.w      d3,d1				 ; .B = scan code
		beq        nkc_tos2n_tos306		 ; scancode=zero (key code created
										 ;	by ASCII input of TOS 3.06)? ->
		and.w      #0x1f00,d2			 ; .W = key flags (in high byte)

*------------- decide which translation table to use

		move.w     d2,d3				 ; key flags
		and.w      #NKFf_SHIFT,d3		 ; isolate bits for shift keys
		beq.s      nkc_tos2n_ktab1		 ; shift key pressed? no->

		movea.l    pkey_shift,a0		 ; yes: use shift table
		bra.s      nkc_tos2n_ktab3		 ; ->

nkc_tos2n_ktab1:
		btst       #NKFb_CAPS,d2		 ; CapsLock?
		beq.s      nkc_tos2n_ktab2		 ; no->

		movea.l    pkey_caps,a0			 ; yes: use CapsLock table
		bra.s      nkc_tos2n_ktab3		 ; ->

nkc_tos2n_ktab2:
		movea.l    pkey_unshift,a0	 	 ; use unshifted table

*------------- check if scan code is out of range
*
* Illegal scancodes can be used to produce 'macro key codes'. Their format is:
*
* - the scancode must be $84 or larger (should be $ff to work properly with old
*	versions of Mag!x)
* - the ASCII code must be in the range $20...$ff (values below are set to $20
*	by NKCC)
* - Alternate and Control are not used for the normalized key code. However,
*	if at least one of them is non-zero, then the numeric keypad flag will be
*	set in the resulting key code.
*

nkc_tos2n_ktab3:
		cmp.b      #0x84,d1 			 ; illegal scan code?
		bcs.s      nkc_tos2n_ktab4		 ; no ->

		move.w     d2,d1				 ; flags
		and.w      #NKFf_ALT|NKFf_CTRL,d1	; Alternate or Control?
		beq.s      nkc_tos2n_special			 ; no ->

		or.w       #NKFf_NUM,d0		 ; yes: set numeric keypad flag
		and.w      #NKFf_CAPS|NKFf_SHIFT,d2   ; mask off both flags

nkc_tos2n_special:
		or.w       d2,d0				 ; combine with ASCII code
		or.w       #NKFf_FUNC|NKFf_RESVD,d0   ; set function and resvd
		cmp.b      #0x20,d0 			 ; ASCII code in range?
		bcc        nkc_tos2n_exit		 ; yes ->

		move.b     #0x20,d0 			 ; no: use minimum
		bra        nkc_tos2n_exit		 ; ->

*------------- check if Alternate + number: they have simulated scan codes

nkc_tos2n_ktab4:
		cmp.b      #0x78,d1 			 ; scan code of Alt + number?
		bcs.s      nkc_tos2n_scan1		 ; no->

		sub.b      #0x76,d1 			 ; yes: calculate REAL scan code
		move.b     0(a0,d1.w),d0		 ; fetch ASCII code
		or.w       #NKFf_ALT,d2		 	; set Alternate flag
		bra        nkc_tos2n_cat_codes	 ; -> add flag byte and exit

*------------- check if exception scan code from cursor keypad

nkc_tos2n_scan1:
		lea.l      xscantab,a1	 		 ; ^exception scan code table

nkc_tos2n_search_scan:
		move.w     (a1)+,d3				 ; NKC and scan code
		bmi.s      nkc_tos2n_tabend 	 ; <0? end of table reached ->

		cmp.b      d1,d3				 ; scan code found?
		bne.s      nkc_tos2n_search_scan ; no: continue search ->

		lsr.w      #8,d3				 ; .B = NKC
		moveq.l    #0,d0				 ; mark: key code found
		bra.s      nkc_tos2n_scan2		 ; ->

nkc_tos2n_tabend:
		moveq.l    #0,d3				 ; no NKC found yet

*------------- check if rubbish ASCII code and erase it, if so

nkc_tos2n_scan2:
		move.b     0(a0,d1.w),d4			 ; ASCII code from translation table
		cmp.b      #32,d0				 ; ASCII returned by TOS < 32?
		bcc.s      nkc_tos2n_scan3			 ; no -> can't be rubbish

		cmp.b      d4,d0				 ; yes: compare with table entry
		beq.s      nkc_tos2n_scan3			 ; equal: that's ok ->

		moveq.l    #0,d0				 ; not equal: rubbish! clear it

*------------- check if ASCII code could only be produced via Alternate key
*			   combination

nkc_tos2n_scan3:
		tst.b      d0					 ; ASCII code valid?
		beq.s      nkc_tos2n_scan4		 ; no ->

		cmp.b      d4,d0				 ; compare with table entry
		beq.s      nkc_tos2n_scan4		 ; equal: normal key ->

		and.w      #!NKFf_ALT,d2		 ; no: clear Alternate flag

*------------- check if ASCII code found yet, and set it, if not

nkc_tos2n_scan4:
		tst.b      d0					 ; found?
		bne.s      nkc_tos2n_scan5		 ; yes ->

		move.b     d3,d0				 ; no: use code from exception table
		bne.s      nkc_tos2n_scan5		 ; now valid? yes ->

		move.b     d4,d0				 ; no: use code from transl. table

*------------- check special case: delete key

nkc_tos2n_scan5:
		cmp.b      #127,d0 			 ; ASCII code of Delete?
		bne.s      nkc_tos2n_scan6		 ; no ->

		move.b     #NK_DEL,d0			 ; yes: set according NKC

*------------- check if key is on numeric keypad (via scan code)

nkc_tos2n_scan6:
		cmp.b      #0x4a,d1 			 ; numeric pad scan code range?
		beq.s      nkc_tos2n_numeric	 ; yes ->

		cmp.b      #0x4e,d1
		beq.s      nkc_tos2n_numeric	 ; yes ->

		cmp.b      #0x63,d1
		bcs.s      nkc_tos2n_scan7		 ; no ->

		cmp.b      #0x72,d1
		bhi.s      nkc_tos2n_scan7		 ; no ->

nkc_tos2n_numeric:
		or.w       #NKFf_NUM,d2		 ; yes: set numeric bit

*------------- check if "function key" and set bit accordingly

nkc_tos2n_scan7:
		cmp.b      #32,d0				 ; ASCII code less than 32?
		bcc.s      nkc_tos2n_scan8		 ; no ->

		or.w       #NKFf_FUNC,d2		 ; yes: set function bit

*------------- check special case: Return or Enter key

		cmp.b      #13,d0				 ; Return or Enter key?
		bne.s      nkc_tos2n_scan8		 ; no ->

		btst       #NKFb_NUM,d2		 ; yes: from the numeric pad?
		beq.s      nkc_tos2n_scan8		 ; no -> it's Return, keep code

		moveq.l    #NK_ENTER,d0		 ; yes: it's Enter; new code

*------------- check if function key (F1-F10) via scan code

nkc_tos2n_scan8:
		cmp.b      #0x54,d1 			 ; shift + function key?
		bcs.s      nkc_tos2n_scan9		 ; no ->

		cmp.b      #0x5d,d1
		bhi.s      nkc_tos2n_scan9		 ; no ->

		sub.b      #0x54-0x3b,d1 		 ; yes: scan code for unshifted key
		move.w     d2,d3				 ; shift flags
		and.w      #NKFf_SHIFT,d3		 ; any shift key flag set?
		bne.s      nkc_tos2n_scan9		 ; yes ->
		or.w       #NKFf_SHIFT,d2		 ; no: set both flags

nkc_tos2n_scan9:
		cmp.b      #0x3b,d1 			 ; (unshifted) function key?
		bcs.s      nkc_tos2n_cat_codes	 ; no ->

		cmp.b      #0x44,d1
		bhi.s      nkc_tos2n_cat_codes	 ; no ->

		move.b     d1,d0				 ; yes: calc NKC
		sub.b      #0x2b,d0

*------------- final flag handling; mix key code (low byte) and flag byte

nkc_tos2n_cat_codes:
		movea.l    pkey_shift,a0		 ; ^shifted table
		move.b     0(a0,d1.w),d3		 ; get shifted ASCII code
		or.w       d2,d0				 ; mix flags with key code
		bmi.s      nkc_tos2n_scan10		 ; result is "function key"? ->

		and.w      #NKFf_CTRL+NKFf_ALT,d2	; Control or Alternate pressed?
		bne.s      nkc_tos2n_scan11 			 ; yes ->

nkc_tos2n_scan10:
		movea.l    pkey_unshift,a0 	 ; ^unshifted table
		cmp.b      0(a0,d1.w),d3		 ; shifted ASCII = unshifted ASCII?
		beq.s      nkc_tos2n_scan12 			 ; yes ->

		bra.s      nkc_tos2n_exit				 ; no ->

nkc_tos2n_scan11:
		or.w       #NKFf_FUNC,d0		 ; Alt/Ctrl + char: set function bit
		movea.l    pkey_caps,a0		 ; ^CapsLock table
		cmp.b      0(a0,d1.w),d3		 ; shifted ASCII = CapsLocked ASCII?
		bne.s      nkc_tos2n_exit				 ; no ->

		move.b     d3,d0			 ; yes: use shifted ASCII code

nkc_tos2n_scan12:
		or.w       #NKFf_RESVD,d0		 ; yes: nkc_cmp() has to check

*------------- restore registers and exit

nkc_tos2n_exit:
		tst.w      d0					 ; set CCR
		movem.l    (sp)+,d3-d4 		 ; restore registers
		rts							 ; bye

*------------- special handling for key codes created by TOS' 3.06 ASCII input

nkc_tos2n_tos306:
		and.w      #NKFf_CAPS,d2		 ; isolate CapsLock flag
		or.w       d2,d0				 ; merge with ASCII code
		movem.l    (sp)+,d3-d4 		 ; restore registers
		rts							 ; bye


****************************************************************************
*
*  nkc_n2tos: convert normalized key codes back to TOS format
*
****************************************************************************

		.globl nkc_n2tos
nkc_n2tos:
		move.w     d0,d1				 ; normalized key code
		and.w      #NKFf_FUNC|NKFf_ALT|NKFf_CTRL,d1 ; isolate flags
		cmp.w      #NKFf_FUNC,d1		 ; only function flag set?
		bne.s      nkc_n2tos_ktab0		 ; no ->

		cmp.b      #0x20,d0 			 ; ASCII code >= $20?
		bcs.s      nkc_n2tos_ktab0		 ; no ->

*------------- macro key

		move.w     d0,d1				 ; keep normalized key code
		and.l      #NKFf_CAPS|NKFf_SHIFT,d0   ; isolate usable flags
		btst       #NKFb_NUM,d1		 ; numeric keypad flag set?
		beq.s      nkc_n2tos_mackey 	 ; no ->

		or.w       #NKFf_ALT|NKFf_CTRL,d0	; yes: set Alternate + Control

nkc_n2tos_mackey:
		or.b       #0xff,d0 			 ; scan code always $ff
		swap       d0					 ; flags and scan code in upper word
		move.b     d1,d0				 ; ASCII code
		bra        nkc_n2tos_exit		 ; ->

*------------- select system key table to use

nkc_n2tos_ktab0:
		move.w     d0,d1				 ; normalized key code
		and.w      #NKFf_SHIFT,d1		 ; isolate bits for shift keys
		beq.s      nkc_n2tos_ktab1		 ; shift key pressed? no->

		lea.l      n_to_scan_s,a1		 ; ^default translation table
		movea.l    pkey_shift,a0		 ; yes: use shift table
		bra.s      nkc_n2tos_ktab3		 ; ->

nkc_n2tos_ktab1:
		lea.l      n_to_scan_u,a1		 ; ^unshifted translation table
		btst       #NKFb_CAPS,d0		 ; CapsLock?
		beq.s      nkc_n2tos_ktab2		 ; no->

		movea.l    pkey_caps,a0		 ; yes: use CapsLock table
		bra.s      nkc_n2tos_ktab3		 ; ->

nkc_n2tos_ktab2:
		movea.l    pkey_unshift,a0 	 ; use unshifted table

*------------- handling for ASCII codes >= 32

nkc_n2tos_ktab3:
		cmp.b      #32,d0				 ; ASCII code < 32?
		bcs.s      nkc_n2tos_lowascii	 ; yes ->

		bsr        nk_findscan 		 ; find scan code
		bne.s      nkc_n2tos_found		 ; found ->

		btst       #NKFb_FUNC,d0		 ; function flag set?
		beq.s      nkc_n2tos_notfound	 ; no ->

		move.l     a0,d1				 ; save a0
		lea.l      tolower,a0			 ; ^upper->lower case table
		moveq.l    #0,d2				 ; clear for word operation
		move.b     d0,d2				 ; ASCII code
		move.b     0(a0,d2.w),d0		 ; get lowercased ASCII code
		movea.l    d1,a0				 ; restore a0
		bsr        nk_findscan	 		 ; try to find scan code again
		bne.s      nkc_n2tos_found		 ; found ->

*------------- unknown source: treat key code as it was entered using the
*			   TOS 3.06 direct ASCII input

nkc_n2tos_notfound:
		moveq.l    #0,d1				 ; not found: clear for word op.
		move.b     d0,d1				 ; unchanged ASCII code
		and.w      #0x1f00,d0			 ; keep shift flags only
		swap       d0					 ; -> high word (scan code = 0)
		move.w     d1,d0				 ; low word: ASCII code
		bra        nkc_n2tos_exit		 ; ->

*------------- handling for ASCII codes < 32

nkc_n2tos_lowascii:
		btst       #NKFb_FUNC,d0		 ; function key?
		bne.s      nkc_n2tos_func		 ; yes ->

		and.w      #0x10ff,d0			 ; clear all flags except CapsLock
		bra.s      nkc_n2tos_notfound	 ; ->

nkc_n2tos_func:
		moveq.l    #0,d1				 ; clear for word operation
		move.b     d0,d1				 ; ASCII code (0...$1f)
		move.w     d1,d2				 ; copy
		move.b     0(a1,d1.w),d1		 ; get scan code
		bne.s      nkc_n2tos_getascii	 ; valid? ->

		moveq.l    #0,d0				 ; invalid key code!! return 0
		bra        nkc_n2tos_exit		 ; ->

nkc_n2tos_getascii:
		lea.l      n_to_scan_u,a1		 ; ^unshifted translation table
		move.b     0(a1,d2.w),d2		 ; get scan code from unshifted tab.
		move.b     0(a0,d2.w),d0		 ; get ASCII from system's table

* register contents:
*
* d0.b		   ASCII code
* d1.b		   scan code
* d0.hb 	   NKCC flags
*

nkc_n2tos_found:
		move.w     d0,d2				 ; flags and ASCII code
		and.w      #0x1f00,d0			 ; isolate shift flags
		move.b     d1,d0				 ; merge with scan code
		swap       d0					 ; -> high byte
		clr.w      d0					 ; erase low word
		move.b     d2,d0				 ; restore ASCII code

*------------- handling for Control key flag

		btst       #NKFb_CTRL,d2		 ; control key flag set?
		beq.s      nkc_n2tos_alternate	 ; no ->

		cmp.b      #0x4b,d1 			 ; scan code = "cursor left"?
		bne.s      nkc_n2tos_scanchk2	 ; no ->

		add.l      #0x280000,d0 		 ; change scan code to $73
		clr.b      d0					 ; erase ASCII code
		bra.s      nkc_n2tos_exit		 ; ->

nkc_n2tos_scanchk2:
		cmp.b      #0x4d,d1 			 ; scan code = "cursor right"?
		bne.s      nkc_n2tos_scanchk3	 ; no ->

		add.l      #0x270000,d0 		 ; change scan code to $74
		clr.b      d0					 ; erase ASCII code
		bra.s      nkc_n2tos_exit		 ; ->

nkc_n2tos_scanchk3:
		cmp.b      #0x47,d1 			 ; scan code = "ClrHome"?
		bne.s      nkc_n2tos_ascchk 	 ; no ->

		add.l      #0x300000,d0 		 ; change scan code to $77
; keep ASCII code in this case! What a mess...
		bra.s      nkc_n2tos_exit		 ; ->

nkc_n2tos_ascchk:
		lea.l      asc_trans,a0		 ; ^ASCII translation table

nkc_n2tos_ascloop:
		move.w     (a0)+,d1			 ; get next entry
		beq.s      nkc_n2tos_noctrlasc		; end of table ->

		cmp.b      d0,d1				 ; ASCII code found?
		bne.s      nkc_n2tos_ascloop	 ; no -> continue search

		lsr.w      #8,d1				 ; yes: get translated code
		move.b     d1,d0				 ; use it
		bra.s      nkc_n2tos_exit		 ; ->

nkc_n2tos_noctrlasc:
		and.b      #0x1f,d0 			 ; mask off upper 3 bits
		bra.s      nkc_n2tos_exit		 ; ->

*------------- handling for Alternate key flag

nkc_n2tos_alternate:
		btst       #NKFb_ALT,d2		 ; alternate key flag set?
		beq.s      nkc_n2tos_exit	 ; no ->

		cmp.b      #2,d1				 ; top row on main keyboard?
		bcs.s      nkc_n2tos_alphachk	 ; no ->

		cmp.b      #0xd,d1
		bhi.s      nkc_n2tos_alphachk	 ; no ->

		add.l      #0x760000,d0 		 ; yes: change scan code
		clr.b      d0					 ; and erase ASCII code
		bra.s      nkc_n2tos_exit		 ; ->

nkc_n2tos_alphachk:
		cmp.b      #'A',d0 			 ; alpha-characters?
		bcs.s      nkc_n2tos_exit		 ; no ->

		cmp.b      #'z',d0
		bhi.s      nkc_n2tos_exit		 ; no ->

		cmp.b      #'Z',d0
		bls.s      nkc_n2tos_ascii0 	 ; yes ->

		cmp.b      #'a',d0
		bcs.s      nkc_n2tos_exit		 ; no ->

nkc_n2tos_ascii0:
		clr.b      d0					 ; alpha-character: clear ASCII code

nkc_n2tos_exit:
		tst.l      d0				 	; set CCR
		rts							 ; bye


****************************************************************************
*
*  nkc_toupper: convert character to upper case
*
****************************************************************************

		.globl nkc_toupper
nkc_toupper:
		lea.l      toupper,a0           ; ^upper case translation table
		and.w      #0xff,d0             ; high byte = 0 for word operation
		move.b     0(a0,d0.w),d0        ; convert
		rts                           ; bye

****************************************************************************
*
*  nkc_tolower: convert character to lower case
*
****************************************************************************

		.globl nkc_tolower
nkc_tolower:
		lea.l      tolower,a0           ; ^lower case translation table
		and.w      #0xff,d0             ; high byte = 0 for word operation
		move.b     0(a0,d0.w),d0        ; convert
		rts                           ; bye


****************************************************************************
*							 LOCAL DATA SECTION 						   *
****************************************************************************

	.data

*  exception scan code table for cursor block keys
*
*  first entry.B:  NKCC key code
*  second entry.B: scan code returned by TOS
*
*  the table is terminated with both entries -1

xscantab:
		.dc.b	NK_UP		,  $48	 ; cursor up
	 	.dc.b	NK_DOWN 	,  $50	 ; cursor down
	 	.dc.b	NK_LEFT 	,  $4b	 ; cursor left
	 	.dc.b	NK_LEFT 	,  $73	 ; Control cursor left
	 	.dc.b	NK_RIGHT	,  $4d	 ; cursor right
	 	.dc.b	NK_RIGHT	,  $74	 ; Control cursor right
	 	.dc.b	NK_M_PGUP	,  $49	 ; Mac: page up
	 	.dc.b	NK_M_PGDOWN ,  $51	 ; Mac: page down
	 	.dc.b	NK_M_END	,  $4f	 ; Mac: end
	 	.dc.b	NK_INS		,  $52	 ; Insert
	 	.dc.b	NK_CLRHOME	,  $47	 ; ClrHome
	 	.dc.b	NK_CLRHOME	,  $77	 ; Control ClrHome
	 	.dc.b	NK_HELP 	,  $62	 ; Help
	 	.dc.b	NK_UNDO 	,  $61	 ; Undo
	 	.dc.b	NK_M_F11	,  $45	 ; Mac: F11
	 	.dc.b	NK_M_F12	,  $46	 ; Mac: F12
	 	.dc.b	NK_M_F14	,  $37	 ; Mac: F14
	 	.dc.w	-1


*  lower case to upper case conversion table
*  (array of 256 unsigned bytes)

toupper:
		dc.b 0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07
		dc.b 0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f
		dc.b 0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17
		dc.b 0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f
		dc.b 0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27
		dc.b 0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x2e,0x2f
		dc.b 0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37
		dc.b 0x38,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,0x3f
		dc.b 0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47
		dc.b 0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f
		dc.b 0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57
		dc.b 0x58,0x59,0x5a,0x5b,0x5c,0x5d,0x5e,0x5f
		dc.b 0x60,0x41,0x42,0x43,0x44,0x45,0x46,0x47
		dc.b 0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f
		dc.b 0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57
		dc.b 0x58,0x59,0x5a,0x7b,0x7c,0x7d,0x7e,0x7f
		dc.b 0x80,0x9a,0x90,0x83,0x8e,0xb6,0x8f,0x80
		dc.b 0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f
		dc.b 0x90,0x92,0x92,0x93,0x99,0x95,0x96,0x97
		dc.b 0x98,0x99,0x9a,0x9b,0x9c,0x9d,0x9e,0x9f
		dc.b 0xa0,0xa1,0xa2,0xa3,0xa5,0xa5,0xa6,0xa7
		dc.b 0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf
		dc.b 0xb7,0xb8,0xb2,0xb2,0xb5,0xb5,0xb6,0xb7
		dc.b 0xb8,0xb9,0xba,0xbb,0xbc,0xbd,0xbe,0xbf
		dc.b 0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7
		dc.b 0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf
		dc.b 0xd0,0xd1,0xd2,0xd3,0xd4,0xd5,0xd6,0xd7
		dc.b 0xd8,0xd9,0xda,0xdb,0xdc,0xdd,0xde,0xdf
		dc.b 0xe0,0xe1,0xe2,0xe3,0xe4,0xe5,0xe6,0xe7
		dc.b 0xe8,0xe9,0xea,0xeb,0xec,0xed,0xee,0xef
		dc.b 0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7
		dc.b 0xf8,0xf9,0xfa,0xfb,0xfc,0xfd,0xfe,0xff


*  upper case to lower case conversion table
*  (array of 256 unsigned bytes)

tolower:
		dc.b 0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07
		dc.b 0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f
		dc.b 0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17
		dc.b 0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f
		dc.b 0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27
		dc.b 0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x2e,0x2f
		dc.b 0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37
		dc.b 0x38,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,0x3f
		dc.b 0x40,0x61,0x62,0x63,0x64,0x65,0x66,0x67
		dc.b 0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f
		dc.b 0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77
		dc.b 0x78,0x79,0x7a,0x5b,0x5c,0x5d,0x5e,0x5f
		dc.b 0x60,0x61,0x62,0x63,0x64,0x65,0x66,0x67
		dc.b 0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f
		dc.b 0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77
		dc.b 0x78,0x79,0x7a,0x7b,0x7c,0x7d,0x7e,0x7f
		dc.b 0x87,0x81,0x82,0x83,0x84,0x85,0x86,0x87
		dc.b 0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x84,0x86
		dc.b 0x82,0x91,0x91,0x93,0x94,0x95,0x96,0x97
		dc.b 0x98,0x94,0x81,0x9b,0x9c,0x9d,0x9e,0x9f
		dc.b 0xa0,0xa1,0xa2,0xa3,0xa4,0xa4,0xa6,0xa7
		dc.b 0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf
		dc.b 0xb0,0xb1,0xb3,0xb3,0xb4,0xb4,0x85,0xb0
		dc.b 0xb1,0xb9,0xba,0xbb,0xbc,0xbd,0xbe,0xbf
		dc.b 0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7
		dc.b 0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf
		dc.b 0xd0,0xd1,0xd2,0xd3,0xd4,0xd5,0xd6,0xd7
		dc.b 0xd8,0xd9,0xda,0xdb,0xdc,0xdd,0xde,0xdf
		dc.b 0xe0,0xe1,0xe2,0xe3,0xe4,0xe5,0xe6,0xe7
		dc.b 0xe8,0xe9,0xea,0xeb,0xec,0xed,0xee,0xef
		dc.b 0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7
		dc.b 0xf8,0xf9,0xfa,0xfb,0xfc,0xfd,0xfe,0xff


*  ASCII code translation table for Control key
*
*  first entry.B:  modified ASCII code returned by TOS
*  second entry.B: original ASCII code as stored in key table
*
*  The table is terminated with both entries 0

asc_trans:	   .dc.b	0,'2'				 ; Control '2' becomes ASCII 0
			   .dc.b	$1e,'6' 			 ; Control '6' becomes ASCII $1e
			   .dc.b	$1f,'-' 			 ; Control '-' becomes ASCII $1f
			   .dc.b	$a,$d				 ; Control Return/Enter: $d -> $a
			   .dc.w	0					 ; terminator


*  normalized key code -> scan code translation table
*  for unshifted key codes
*  indexed by function code (NK_...)

n_to_scan_u:   .dc.b	$00 				 ; invalid key code
			   .dc.b	$48 				 ; cursor up
			   .dc.b	$50 				 ; cursor down
			   .dc.b	$4d 				 ; cursor right
			   .dc.b	$4b 				 ; cursor left
			   .dc.b	$49 				 ; Mac: page up
			   .dc.b	$51 				 ; Mac: page down
			   .dc.b	$4f 				 ; Mac: end
			   .dc.b	$0e 				 ; Backspace
			   .dc.b	$0f 				 ; Tab
			   .dc.b	$72 				 ; Enter
			   .dc.b	$52 				 ; Insert
			   .dc.b	$47 				 ; ClrHome
			   .dc.b	$1c 				 ; Return
			   .dc.b	$62 				 ; Help
			   .dc.b	$61 				 ; Undo
			   .dc.b	$3b 				 ; function key #1
			   .dc.b	$3c 				 ; function key #2
			   .dc.b	$3d 				 ; function key #3
			   .dc.b	$3e 				 ; function key #4
			   .dc.b	$3f 				 ; function key #5
			   .dc.b	$40 				 ; function key #6
			   .dc.b	$41 				 ; function key #7
			   .dc.b	$42 				 ; function key #8
			   .dc.b	$43 				 ; function key #9
			   .dc.b	$44 				 ; function key #10
			   .dc.b	$45 				 ; Mac: F11
			   .dc.b	$01 				 ; Esc
			   .dc.b	$46 				 ; Mac: F12
			   .dc.b	$37 				 ; Mac: F14
			   .dc.b	$00 				 ; reserved!
			   .dc.b	$53 				 ; Delete

*  normalized key code -> scan code translation table
*  for shifted key codes
*  indexed by function code (NK_...)

n_to_scan_s:   .dc.b	$00 				 ; invalid key code
			   .dc.b	$48 				 ; cursor up
			   .dc.b	$50 				 ; cursor down
			   .dc.b	$4d 				 ; cursor right
			   .dc.b	$4b 				 ; cursor left
			   .dc.b	$49 				 ; Mac: page up
			   .dc.b	$51 				 ; Mac: page down
			   .dc.b	$4f 				 ; Mac: end
			   .dc.b	$0e 				 ; Backspace
			   .dc.b	$0f 				 ; Tab
			   .dc.b	$72 				 ; Enter
			   .dc.b	$52 				 ; Insert
			   .dc.b	$47 				 ; ClrHome
			   .dc.b	$1c 				 ; Return
			   .dc.b	$62 				 ; Help
			   .dc.b	$61 				 ; Undo
			   .dc.b	$54 				 ; function key #1
			   .dc.b	$55 				 ; function key #2
			   .dc.b	$56 				 ; function key #3
			   .dc.b	$57 				 ; function key #4
			   .dc.b	$58 				 ; function key #5
			   .dc.b	$59 				 ; function key #6
			   .dc.b	$5a 				 ; function key #7
			   .dc.b	$5b 				 ; function key #8
			   .dc.b	$5c 				 ; function key #9
			   .dc.b	$5d 				 ; function key #10
			   .dc.b	$45 				 ; Mac: F11
			   .dc.b	$01 				 ; Esc
			   .dc.b	$46 				 ; Mac: F12
			   .dc.b	$37 				 ; Mac: F14
			   .dc.b	$00 				 ; reserved!
			   .dc.b	$53 				 ; Delete

****************************************************************************
*							  LOCAL BSS SECTION 						   *
****************************************************************************

			   .bss

pkey_unshift:  .ds.l	1					 ; ^unshifted key table
pkey_shift:    .ds.l	1					 ; ^shifted key table
pkey_caps:	   .ds.l	1					 ; ^CapsLock table

			   .even

* End Of File
