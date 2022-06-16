/****************************************************************************
 *
 * reduced NKCC for the CF-Lib
 *
 ****************************************************************************/

#include "acs_i.h"

#if WITH_FIXES
static uint8 *pshift = NULL;
#else
static int32 *pshift = NULL;
#endif

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* convert gem key & state to NKC code */
int16 nkc_gemks2n(int16 gemkey, int16 kstate)
{
	return nkc_tos2n((int32)(gemkey & 0xff) | (((int32)gemkey & 0xff00) << 8) | ((int32)(kstate & 0xff) << 24)) & ~NKF_RESVD;
}

/* -------------------------------------------------------------------------- */

/* convert gem key to NKC code */
int16 nkc_gem2n(int16 gemkey)
{
#if WITH_FIXES
	return nkc_gemks2n(gemkey, nkc_kstate());
#else
	return nkc_gemks2n(nkc_kstate(), gemkey);
#endif
}

/* -------------------------------------------------------------------------- */

/* convert NKC code to GEM key & state */
void nkc_n2gemks(int16 norm, int16 *kstate, int16 *gemkey)
{
	int32 toskey;
	
	toskey = nkc_n2tos(norm);
	if (gemkey != NULL)
		*gemkey = (int16)(toskey & 0xff) | (int16)((toskey & 0xff0000L) >> 8);
	if (kstate != NULL)
		*kstate = (int16)((toskey & 0xff000000UL) >> 24);
}

/* -------------------------------------------------------------------------- */

/* convert NKC code to GEM key */
int16 nkc_n2gem(int16 nkcode)
{
	int32 toskey;
	
	toskey = nkc_n2tos(nkcode);
	return (int16)(toskey & 0xff) | (int16)((toskey & 0xff0000L) >> 8);
}

/* -------------------------------------------------------------------------- */

/* convert NKC code to GEM state */
int16 nkc_n2kstate(int16 nkcode)
{
	return (int16)((nkc_n2tos(nkcode) & 0xff000000UL) >> 24);
}

/* -------------------------------------------------------------------------- */

/* get current shift state from OS */
int16 nkc_kstate(void)
{
	SYSHDR *syshdr;
	
	if (pshift == NULL)
	{
		syshdr = Ash_getOSHeader();
		if (syshdr->os_version != 0x100)
		{
			pshift = (void *)syshdr->kbshift;
		} else
		{
			pshift = (void *)0xe1b;
		}
	}
	return (int16)(*pshift & 0x1f) << 8;
}

/* -------------------------------------------------------------------------- */

int16 nkc_cmp(int16 refkey, int16 kcode)
{
	int16 cmp;
	char refupc;
	char refc;
	char kcodec;
	
	cmp = refkey ^ kcode;
	refc = refkey & 0xff;
	kcodec = kcode & 0xff;
	if (cmp == 0)
	{
		return TRUE;
	} else if (cmp & NKF_FUNC)
	{
		if (cmp & (NKF_ALT | NKF_CTRL))
			return FALSE;
		if (refc >= 0x20)
		{
			if (((refkey == 0) & NKF_RESVD) && (cmp & NKF_NUM))
				return FALSE;
			if (refc != kcodec)
				return FALSE;
			if ((kcode == 0) & NKF_RESVD)
				return TRUE;
		} else
		{
			if (refc != kcodec)
				return FALSE;
		}
		if ((cmp == 0) & NKF_SHIFT)
			return TRUE;
		if ((refkey & NKF_SHIFT) != NKF_SHIFT)
			return FALSE;
		return (kcode & NKF_SHIFT) ? TRUE : FALSE;
	} else
	{
		if (((refkey == 0) & NKF_RESVD) && (cmp & NKF_NUM))
			return FALSE;
		refupc = nkc_toupper(refkey);
		if (refc != kcodec)
		{
			if (refkey & NKF_CAPS)
			{
				return refupc == (char)(nkc_toupper(kcode) & 0xff) ? TRUE : FALSE;
			} else
			{
				return FALSE;
			}
		}
		if ((kcode == 0) & NKF_RESVD)
			return TRUE;
		if ((cmp == 0) & NKF_SHIFT)
			return TRUE;
		if ((refkey & NKF_SHIFT) != NKF_SHIFT)
			return FALSE;
	}
	return (kcode & NKF_SHIFT) ? TRUE : FALSE;
}

/* -------------------------------------------------------------------------- */

int16 nkc_exit(void)
{
	return OK;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/*
 * Generic C versions of the functions found in nkcc_s.s for Pure-C
 */
#ifndef __PUREC__

static unsigned char const toupper_table[256] = {
	0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,
	0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f,
	0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,
	0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f,
	0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,
	0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x2e,0x2f,
	0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,
	0x38,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,0x3f,
	0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47,
	0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f,
	0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57,
	0x58,0x59,0x5a,0x5b,0x5c,0x5d,0x5e,0x5f,
	0x60,0x41,0x42,0x43,0x44,0x45,0x46,0x47,
	0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f,
	0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57,
	0x58,0x59,0x5a,0x7b,0x7c,0x7d,0x7e,0x7f,
	0x80,0x9a,0x90,0x83,0x8e,0xb6,0x8f,0x80,
	0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f,
	0x90,0x92,0x92,0x93,0x99,0x95,0x96,0x97,
	0x98,0x99,0x9a,0x9b,0x9c,0x9d,0x9e,0x9f,
	0xa0,0xa1,0xa2,0xa3,0xa5,0xa5,0xa6,0xa7,
	0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf,
	0xb7,0xb8,0xb2,0xb2,0xb5,0xb5,0xb6,0xb7,
	0xb8,0xb9,0xba,0xbb,0xbc,0xbd,0xbe,0xbf,
	0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7,
	0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf,
	0xd0,0xd1,0xd2,0xd3,0xd4,0xd5,0xd6,0xd7,
	0xd8,0xd9,0xda,0xdb,0xdc,0xdd,0xde,0xdf,
	0xe0,0xe1,0xe2,0xe3,0xe4,0xe5,0xe6,0xe7,
	0xe8,0xe9,0xea,0xeb,0xec,0xed,0xee,0xef,
	0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,
	0xf8,0xf9,0xfa,0xfb,0xfc,0xfd,0xfe,0xff
};

static unsigned char const tolower_table[256] = {
	0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,
	0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f,
	0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,
	0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f,
	0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,
	0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x2e,0x2f,
	0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,
	0x38,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,0x3f,
	0x40,0x61,0x62,0x63,0x64,0x65,0x66,0x67,
	0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f,
	0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,
	0x78,0x79,0x7a,0x5b,0x5c,0x5d,0x5e,0x5f,
	0x60,0x61,0x62,0x63,0x64,0x65,0x66,0x67,
	0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f,
	0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,
	0x78,0x79,0x7a,0x7b,0x7c,0x7d,0x7e,0x7f,
	0x87,0x81,0x82,0x83,0x84,0x85,0x86,0x87,
	0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x84,0x86,
	0x82,0x91,0x91,0x93,0x94,0x95,0x96,0x97,
	0x98,0x94,0x81,0x9b,0x9c,0x9d,0x9e,0x9f,
	0xa0,0xa1,0xa2,0xa3,0xa4,0xa4,0xa6,0xa7,
	0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf,
	0xb0,0xb1,0xb3,0xb3,0xb4,0xb4,0x85,0xb0,
	0xb1,0xb9,0xba,0xbb,0xbc,0xbd,0xbe,0xbf,
	0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7,
	0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf,
	0xd0,0xd1,0xd2,0xd3,0xd4,0xd5,0xd6,0xd7,
	0xd8,0xd9,0xda,0xdb,0xdc,0xdd,0xde,0xdf,
	0xe0,0xe1,0xe2,0xe3,0xe4,0xe5,0xe6,0xe7,
	0xe8,0xe9,0xea,0xeb,0xec,0xed,0xee,0xef,
	0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,
	0xf8,0xf9,0xfa,0xfb,0xfc,0xfd,0xfe,0xff
};

static short const xscantab[] =
{
	(NK_UP << 8) |	0x48,	   /* cursor up			    */
	(NK_DOWN << 8) | 0x50,     /* cursor down			*/
	(NK_LEFT << 8) | 0x4b,	   /* cursor left			*/
	(NK_LEFT << 8) | 0x73,	   /* Control cursor left	*/
	(NK_RIGHT << 8) | 0x4d,	   /* cursor right			*/
	(NK_RIGHT << 8) | 0x74,	   /* Control cursor right	*/
	(NK_M_PGUP << 8) | 0x49,   /* Mac: page up          */
	(NK_M_PGDN << 8) | 0x51,   /* Mac: page down        */
	(NK_M_END << 8) | 0x4f,    /* Mac: end              */
	(NK_INS << 8) | 0x52,	   /* Insert				*/
	(NK_CLRHOME << 8) | 0x47,  /* ClrHome				*/
	(NK_CLRHOME << 8) | 0x77,  /* Control ClrHome		*/
	(NK_HELP << 8) | 0x62,	   /* Help					*/
	(NK_UNDO << 8) | 0x61,	   /* Undo					*/
	(NK_M_F11 << 8) | 0x45,    /* Mac: F11              */
	(NK_M_F12 << 8) | 0x46,    /* Mac: F12              */
	(NK_M_F14 << 8) | 0x37,    /* Mac: F14              */
	-1
};

/*
 *  ASCII code translation table for Control key
 *
 *  first entry.B:  modified ASCII code returned by TOS
 *  second entry.B: original ASCII code as stored in key table
 *
 *  The table is terminated with both entries 0
 */
static unsigned char const asc_trans[] = {

	0, '2',			/* Control '2' becomes ASCII 0 */
	0x1e, '6', 		/* Control '6' becomes ASCII $1e */
	0x1f, '-', 		/* Control '-' becomes ASCII $1f */
	0x0a, 0x0d,		/* Control Return/Enter: $d -> $a */
	0, 0			/* terminator */
};

/*
 *  normalized key code -> scan code translation table
 *  for unshifted key codes
 *  indexed by function code (NK_...)
 */
static unsigned char const n_to_scan_u[] = {
	0x00, 				 /* invalid key code */
	0x48, 				 /* cursor up */
	0x50, 				 /* cursor down */
	0x4d, 				 /* cursor right */
	0x4b, 				 /* cursor left */
	0x49, 				 /* Mac: page up */
	0x51, 				 /* Mac: page down */
	0x4f, 				 /* Mac: end */
	0x0e, 				 /* Backspace */
	0x0f, 				 /* Tab */
	0x72, 				 /* Enter */
	0x52, 				 /* Insert */
	0x47, 				 /* ClrHome */
	0x1c, 				 /* Return */
	0x62, 				 /* Help */
	0x61, 				 /* Undo */
	0x3b, 				 /* function key #1 */
	0x3c, 				 /* function key #2 */
	0x3d, 				 /* function key #3 */
	0x3e, 				 /* function key #4 */
	0x3f, 				 /* function key #5 */
	0x40, 				 /* function key #6 */
	0x41, 				 /* function key #7 */
	0x42, 				 /* function key #8 */
	0x43, 				 /* function key #9 */
	0x44, 				 /* function key #10 */
	0x45, 				 /* Mac: F11 */
	0x01, 				 /* Esc */
	0x46, 				 /* Mac: F12 */
	0x37, 				 /* Mac: F14 */
	0x00, 				 /* reserved! */
	0x53 				 /* Delete */
};

/*
 *  normalized key code -> scan code translation table
 *  for shifted key codes
 *  indexed by function code (NK_...)
 */
static unsigned char const n_to_scan_s[] = {
	0x00, 				 /* invalid key code */
	0x48, 				 /* cursor up */
	0x50, 				 /* cursor down */
	0x4d, 				 /* cursor right */
	0x4b, 				 /* cursor left */
	0x49, 				 /* Mac: page up */
	0x51, 				 /* Mac: page down */
	0x4f, 				 /* Mac: end */
	0x0e, 				 /* Backspace */
	0x0f, 				 /* Tab */
	0x72, 				 /* Enter */
	0x52, 				 /* Insert */
	0x47, 				 /* ClrHome */
	0x1c, 				 /* Return */
	0x62, 				 /* Help */
	0x61, 				 /* Undo */
	0x54, 				 /* function key #1 */
	0x55, 				 /* function key #2 */
	0x56, 				 /* function key #3 */
	0x57, 				 /* function key #4 */
	0x58, 				 /* function key #5 */
	0x59, 				 /* function key #6 */
	0x5a, 				 /* function key #7 */
	0x5b, 				 /* function key #8 */
	0x5c, 				 /* function key #9 */
	0x5d, 				 /* function key #10 */
	0x45, 				 /* Mac: F11 */
	0x01, 				 /* Esc */
	0x46, 				 /* Mac: F12 */
	0x37, 				 /* Mac: F14 */
	0x00, 				 /* reserved! */
	0x53 				 /* Delete */
};

static const unsigned char *pkey_unshift;
static const unsigned char *pkey_shift;
static const unsigned char *pkey_caps;

/* -------------------------------------------------------------------------- */

int16 nkc_tolower(int16 key)
{
	return tolower_table[key & 0xff];
}

/* -------------------------------------------------------------------------- */

int16 nkc_toupper(int16 key)
{
	return toupper_table[key & 0xff];
}

/* -------------------------------------------------------------------------- */

/*
*  In:   D0.L           key code in TOS format:
*                                   0                    1
*                       bit 31:     ignored              ignored
*                       bit 30:     ignored              ignored
*                       bit 29:     ignored              ignored
*                       bit 28:     no CapsLock          CapsLock
*                       bit 27:     no Alternate         Alternate pressed
*                       bit 26:     no Control           Control pressed
*                       bit 25:     no left Shift key    left Shift pressed
*                       bit 24:     no right Shift key   right Shift pressed
*
*                       bits 23...16: scan code
*                       bits 15...08: ignored
*                       bits 07...00: ASCII code (or rubbish in most cases
*                          when Control or Alternate is pressed ...)
*
*  Out:  D0.W           normalized key code:
*                       bits 15...08: flags:
*                                   0                    1
*                       NKF?_FUNC   printable char       "function key"
*                       NKF?_RESVD  ignore it            ignore it
*                       NKF?_NUM    main keypad          numeric keypad
*                       NKF?_CAPS   no CapsLock          CapsLock
*                       NKF?_ALT    no Alternate         Alternate pressed
*                       NKF?_CTRL   no Control           Control pressed
*                       NKF?_LSH    no left Shift key    left Shift pressed
*                       NKF?_RSH    no right Shift key   right Shift pressed
*
*                       bits 07...00: key code
*                       function (NKF?_FUNC set):
*                          < 32: special key (NK_...)
*                          >=32: printable char + Control and/or Alternate
*                       no function (NKF?_FUNC not set):
*                          printable character (0...255!!!)
*/
int16 nkc_tos2n(int32 toskey)
{
	const short *tab;
	const unsigned char *ktab;
	unsigned short state, scan, ascii;
	short nkc;

	ascii = toskey & 0xff;
	state = (unsigned short)(toskey >> 16);
	scan = state & 0xff;
	
	if (scan == 0)
	{
		/* special handling for key codes created by TOS' 3.06 ASCII input */
		state &= NKF_CAPS;
		return ascii | state;
	}
	
	state &= (NKF_CAPS|NKF_SHIFT|NKF_CTRL|NKF_ALT);
	
	if (state & NKF_SHIFT)
		ktab = pkey_shift;
	else if (state & NKF_CAPS)
		ktab = pkey_caps;
	else
		ktab = pkey_unshift;

	/*
	 *------------- check if scan code is out of range
	 *
	 * Illegal scancodes can be used to produce 'macro key codes'. Their format is:
	 *
	 * - the scancode must be $84 or larger (should be $ff to work properly with old
	 *   versions of Mag!x)
	 * - the ASCII code must be in the range $20...$ff (values below are set to $20
	 *   by NKCC)
	 * - Alternate and Control are not used for the normalized key code. However,
	 *   if at least one of them is non-zero, then the numeric keypad flag will be
	 *   set in the resulting key code.
	 */
	if (scan >= 0x84)
	{
		/* Alternate or Control? */
		if (state & (NKF_ALT | NKF_CTRL))
		{
			/* yes: set numeric keypad flag */
			ascii |= NKF_NUM;
			/* mask off both flags */
			state &= NKF_CAPS | NKF_SHIFT;
		}
		/* set function and resvd */
		state |= NKF_FUNC | NKF_RESVD;
		/* ASCII code in range? */
		if ((unsigned char)ascii < 0x20)
		{
			/* no: use minimum */
			ascii = 0x20;
		}
		/* combine with ASCII code */
		return ascii | state;
	}
	
	/*
	 * check if Alternate + number: they have simulated scan codes
	 */
	if (scan >= 0x78)
	{
		ascii = ktab[scan - 0x76];
		state |= NKF_ALT;
	} else
	{
		/*
		 * check if exception scan code from cursor keypad
		 */
		/* no NKC found yet */
		nkc = 0;
		tab = xscantab;
		while (*tab > 0)
		{
			if ((*tab & 0xff) == scan)
			{
				nkc = (*tab >> 8) & 0xff;
				/* mark: key code found */
				ascii = 0;
				break;
			}
			tab++;
		}
		
		/*
		 * check if rubbish ASCII code and erase it, if so
		 */
		if (ascii <= 0x20 && ktab[scan] != ascii)
			ascii = 0;
		
		/*
		 * check if ASCII code could only be produced via Alternate key
		 * combination
		 */
		if (ascii != 0 && ktab[scan] != ascii)
			state &= ~NKF_ALT;
		
		/*
		 * check if ASCII code found yet, and set it, if not
		 */
		if (ascii == 0)
		{
			/* not found, use code from exception table */
			ascii = nkc;
			if (ascii == 0)
				ascii = ktab[scan];
		}
		
		/*
		 * check special case: delete key
		 */
		if (ascii == 0x7f)
			ascii = NK_DEL;
		
		/*
		 * check if key is on numeric keypad (via scan code)
		 */
		if (scan == 0x4a || scan == 0x4e || (scan >= 0x63 && scan <= 0x72))
			state |= NKF_NUM;

		/*
		 * check if "function key" and set bit accordingly
		 */
		if (ascii < 0x20)
		{
			state |= NKF_FUNC;
			/* check special case: Return or Enter key */
			if (ascii == 0x0d && (state & NKF_NUM))
				ascii = NK_ENTER;
		}
		
		/*
		 * check if function key (F1-F10) via scan code
		 */
		if (scan >= 0x54 && scan <= 0x5d)
		{
			/* yes: scan code for unshifted key */
			scan -= 0x54 - 0x3b;
			if (state & NKF_SHIFT)
				state |= NKF_SHIFT;
		}
		/* (unshifted) function key? */
		if (scan >= 0x3b && scan <= 0x44)
		{
			/* yes: calc NKC */
			ascii = scan - 0x2b;
		}
	}
	
	/*
	 * final flag handling; mix key code (low byte) and flag byte
	 */
	ktab = pkey_shift;
	nkc = ktab[scan];
	if ((state & NKF_FUNC) || (state & (NKF_CTRL|NKF_ALT)) == 0)
	{
		ktab = pkey_unshift;
		if (ktab[scan] != nkc)
			return ascii | state;
	} else
	{
		state |= NKF_FUNC;
		ktab = pkey_caps;
		if (ktab[scan] != nkc)
			return ascii | state;
		ascii = nkc;
	}
	state |= NKF_RESVD;
	return ascii | state;
}

/* -------------------------------------------------------------------------- */

static int16 nk_findscan(int16 nkcode, const unsigned char *ktab)
{
	int16 i;
	
	/* on numeric keypad? */
	if (nkcode & NKF_NUM)
	{
		if (ktab[0x4a] == (unsigned char)nkcode)
			return 0x4a;
		if (ktab[0x4e] == (unsigned char)nkcode)
			return 0x4e;
		for (i = 0x63; i < 0x73; i++)
			if (ktab[i] == (unsigned char)nkcode)
				return i;
	}
	for (i = 1; i < 0x78; i++)
		if (ktab[i] == (unsigned char)nkcode)
			return i;
	return 0;
}

/* -------------------------------------------------------------------------- */

int32 nkc_n2tos(int16 nkcode)
{
	uint16 state;
	const unsigned char *ktab;
	const unsigned char *trans_tab;
	int32 toskey;
	
	/* isolate flags */
	state = nkcode & (NKF_FUNC | NKF_ALT | NKF_CTRL);
	/* only function flag set? */
	if (state == NKF_FUNC && (unsigned char)nkcode < 0x20)
	{
		/* keep normalized key code */
		state = nkcode;
		/* isolate usable flags */
		nkcode &= NKF_CAPS | NKF_SHIFT;
		if (state & NKF_NUM)
			nkcode |= NKF_ALT | NKF_CTRL;
		/* scan code always $ff */
		nkcode |= 0xff;
		return ((int32)nkcode << 16) | (state & 0xff);
	}

	/* keep normalized key code */
	state = nkcode;
	
	/* select system key table to use */
	trans_tab = n_to_scan_u;
	if (state & K_SHIFT)
	{
		trans_tab = n_to_scan_s;
		ktab = pkey_shift;
	} else if (state & NKF_CAPS)
	{
		ktab = pkey_caps;
	} else
	{
		ktab = pkey_unshift;
	}
	
	if ((unsigned char)nkcode >= 0x20)
	{
		/* find scan code */
		if ((state = nk_findscan(nkcode, ktab)) == 0 &&
			(!(nkcode & NKF_FUNC) || (state = nk_findscan((nkcode & 0xff00) | tolower_table[nkcode & 0xff], ktab))) == 0)
			/* unknown source: treat key code as it was entered using the
			   TOS 3.06 direct ASCII input */
			return ((int32)(nkcode & 0x1f00) << 16) | (unsigned char)nkcode;
	} else
	{
		if (!(nkcode & NKF_FUNC))
		{
			/* clear all flags except CapsLock */
			nkcode &= NKF_CAPS | 0xff;
			return ((int32)(nkcode & 0x1f00) << 16) | (unsigned char)nkcode;
		}
		if ((state = trans_tab[nkcode & 0xff]) == 0)
			return 0;
		nkcode = (nkcode & 0xff00) | n_to_scan_u[nkcode & 0xff];
	}
	
	toskey = (((int32)(nkcode & 0x1f00) | state) << 16) | (unsigned char)nkcode;
	
	/* handling for Control key flag */
	if (nkcode & NKF_CTRL)
	{
		/* scan code = "cursor left"? */
		if ((unsigned char)state == 0x4b)
		{
			/* change scan code to $73 */
			toskey += 0x2800000L;
			/* erase ASCII code */
			toskey &= ~0xffL;
			return toskey;
		}
		/* scan code = "cursor right"? */
		if ((unsigned char)state == 0x4d)
		{
			/* change scan code to $74 */
			toskey += 0x2700000L;
			/* erase ASCII code */
			toskey &= ~0xffL;
			return toskey;
		}
		/* scan code = "ClrHome"? */
		if ((unsigned char)state == 0x47)
		{
			/* change scan code to $77 */
			toskey += 0x2700000L;
			/* keep ASCII code in this case! What a mess... */
			return toskey;
		}

		ktab = asc_trans;
		while (ktab[1] != 0)
		{
			if (ktab[1] == (unsigned char)nkcode)
			{
				toskey &= ~0xff;
				toskey |= ktab[0];
				return toskey;
			}
			ktab += 2;
		}
		toskey &= 0xffffff1fL;
		return toskey;
	}
	
	/* handling for Alternate key flag */
	if (nkcode & NKF_ALT)
	{
		/* top row on main keyboard? */
		if ((unsigned char)state >= 2 && (unsigned char)state <= 13)
		{
			/* change scan code */
			toskey += 0x7600000L;
			/* erase ASCII code */
			toskey &= ~0xffL;
			return toskey;
		}
		/* alpha-characters? */
		if (((unsigned char)nkcode >= 'A' && (unsigned char)nkcode <= 'Z') ||
			((unsigned char)nkcode >= 'a' && (unsigned char)nkcode <= 'z'))
		{
			/* alpha-character: clear ASCII code */
			toskey &= ~0xffL;
		}
	}
	
	return toskey;
}

/* -------------------------------------------------------------------------- */

void nkc_init(unsigned long flags, int16 vdi_handle, int16 *pglobl)
{
	void *pmin = (void *)-1;
	KEYTAB *tbl;
	
	UNUSED(flags);
	UNUSED(vdi_handle);
	UNUSED(pglobl);
	/* fetch addresses of TOS' key scan code translation tables */
	tbl = (KEYTAB *)Keytbl(pmin, pmin, pmin);
	pkey_unshift = (const unsigned char *)tbl->unshift;
	pkey_shift = (const unsigned char *)tbl->shift;
	pkey_caps = (const unsigned char *)tbl->capslock;
}

#endif /* __PUREC__ */
