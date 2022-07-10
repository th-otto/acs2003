#include "acs_i.h"
#include "workout.h"
#include "country.h"

#ifdef __PUREC__
#pragma warn -use
#endif


#if COUNTRY == COUNTRY_DE
char const A_MISSENTRY[] = "[3][ Objekteintrag | nicht vorhanden! ][ Abbruch ]";
char const ERR_FILETYP[] = "[3][ Falscher Dateityp!][ Abbruch ]";
char const ERR_OPEN[] = "[3][ | Konnte Datei '%s' | nicht finden oder es trat | ein Fehler beim ôffnen ein! | ][ Abbruch ]";
char const ERR_TRANS[] = "[3][ Die Translationstabelle ist| Åbergelaufen! Bitte das ACS- | Modul in mehrere Module | aufteilen! ][ Abbruch ]";
char const ERR_TYPE[] = "[1][ Ein unzulÑssiger Objekttyp | wurde importiert!][ Abbruch ]";

static char TEXT_002[] = "";
static char TEXT_003[] = "OK";
static char TEXT_004[] = "Abbruch";
static char TEXT_006[] = "1234567890123456789012345678901";
static char TEXT_01[] = "Saving...";
static char TEXT_02[] = "Ausgabe:";
static char TEXT_03[] = "Datei:";
static char TEXT_04[] = "Liste:";
static char TEXT_05[] = "Object:";
static char TEXT_07[] = "12345*12345";
static char TEXT_10[] = "1";
static char TEXT_191[] = "Name:";
#endif

#if COUNTRY == COUNTRY_US
char const A_MISSENTRY[] = "[3][ An object entry | does not exist!][ Cancel ]\0";
char const ERR_FILETYP[] = "[3][ Wrong file-type. ][ Cancel ]\0\0";
char const ERR_OPEN[] = "[3][ Could not find file | '%s' | or an error occured | while reading.][ Cancel ]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0";
#if WITH_FIXES
char const ERR_TRANS[] = "[3][ An overflow occured within | the translation table. | Please split the ACS-file | in several parts.][ Cancel ]";
#else
/* BUG: following string is not zero-terminated */
char const ERR_TRANS[115] = "[3][ An overflow occured within | the translation table. | Please split the ACS-file | in several parts.][ Cancel ]";
#endif
char const ERR_TYPE[] = "[1][ An unknown object-| type was imported!][ Cancel ]\0\0\0\0\0\0\0\0\0";

static char TEXT_002[] = "";
static char TEXT_003[] = "OK";
static char TEXT_004[] = "Cancel";
static char TEXT_006[] = "1234567890123456789012345678901";
static char TEXT_01[] = "Saving...";
static char TEXT_02[] = "Output:";
static char TEXT_03[] = "File:";
static char TEXT_04[] = "List:";
static char TEXT_05[] = "Object:";
static char TEXT_07[] = "12345*12345";
static char TEXT_10[] = "1";
static char TEXT_191[] = "Name:";
#endif
		
char const al1_obj[] = "ML1-ALERT LIST";
char const al2_obj[] = "ML2-ALERT LIST";
char const al3_obj[] = "ML3-ALERT LIST";
char const al_obj[] = "ALERT LIST";
char const ic_obj[] = "ICON LIST";
char const if_obj[] = "DATA LIST";
char const im_obj[] = "IMAGE LIST";
char const me_obj[] = "MENU LIST";
char const mf_obj[] = "MOUSEFORM LIST";
char const ml1_obj[] = "ML1-TEXT LIST";
char const ml2_obj[] = "ML2-TEXT LIST";
char const ml3_obj[] = "ML3-TEXT LIST";
char const ob_obj[] = "OBJECTTREE LIST";
char const pu_obj[] = "POPUP LIST";
char const rf_obj[] = "REFERENCE LIST";
char const st_obj[] = "TEXT LIST";
char const te_obj[] = "TEDINFO LIST";
char const us_obj[] = "USERBLK LIST";
char const wi_obj[] = "WINDOW LIST";

static TEDINFO TEDINFO_01 = { TEXT_01, TEXT_002, TEXT_002, 0x0003, 0x0006, 0x0002, 0x1071, 0x0000, 0x0000, 0x000a, 0x0001 };
static TEDINFO TEDINFO_02 = { TEXT_07, TEXT_002, TEXT_002, 0x0003, 0x0006, 0x0002, 0x1100, 0x0000, 0x0000, 0x000c, 0x0001 };
static TEDINFO TEDINFO_064 = { TEXT_006, TEXT_002, TEXT_002, 0x0003, 0x0006, 0x0000, 0x11f0, 0x0000, 0x0000, 0x0020, 0x0001 };

static AUSERBLK A_3DBUTTON01 = { A_3Dbutton, 0xa02191f8L, Auo_string, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK A_3DBUTTON02 = { A_3Dbutton, 0x29c10178L, Auo_string, TEXT_003, NULL, NULL, NULL, NULL };
static AUSERBLK A_3DBUTTON03 = { A_3Dbutton, 0x29f101f8L, Auo_string, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK A_3DBUTTON05 = { A_3Dbutton, 0x29c10178L, Auo_string, TEXT_004, NULL, NULL, NULL, NULL };
static AUSERBLK A_BOXED02 = { A_boxed, 0x90381f12L, Auo_boxed, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK A_INNERFRAME02 = { A_innerframe, 0x18008f19L, Auo_string, TEXT_191, NULL, NULL, NULL, NULL };

static int16 _IMG_IM_SORT_XY[] = {
		0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x08ff, 0xe04f,
		0xfe38, 0x08ff, 0xe02f, 0xfe08, 0x08ff, 0xffff, 0xfe38, 0x08ff,
		0xe02f, 0xfe20, 0x08ff, 0xe04f, 0xfe38, 0x0000, 0x0000, 0x4000,
		0x0000, 0x0000, 0x4000, 0x0007, 0xffff, 0xc000, 0x0015, 0x0000,
		0x0000, 0x000e, 0x0000, 0x0000, 0x0004, 0x0000, 0x0000, 0x1cff,
		0xe04f, 0xfe20, 0x04ff, 0xe02f, 0xfe28, 0x0cff, 0xffff, 0xfe38,
		0x04ff, 0xe02f, 0xfe08, 0x1cff, 0xe04f, 0xfe08, 0x0000, 0x0000,
		0x4000, 0x0000, 0x0000, 0x4000, 0x0007, 0xffff, 0xc000, 0x0015,
		0x0000, 0x0000, 0x000e, 0x0000, 0x0000, 0x0004, 0x0000, 0x0000,
		0x1cff, 0xe04f, 0xfe10, 0x10ff, 0xe02f, 0xfe20, 0x1cff, 0xffff,
		0xfe38, 0x04ff, 0xe02f, 0xfe28, 0x1cff, 0xe04f, 0xfe38, 0x0000,
		0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
};
BITBLK IM_SORT_XY = { _IMG_IM_SORT_XY, 6, 32, 0, 0, 1 };
static int16 _IMG_IM_SORT_YX[] = {
		0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x08ff, 0xe04f,
		0xfe20, 0x08ff, 0xe02f, 0xfe28, 0x08ff, 0xe1ff, 0xfe38, 0x08ff,
		0xe12f, 0xfe08, 0x08ff, 0xe14f, 0xfe08, 0x0004, 0x0100, 0x4000,
		0x0004, 0x0100, 0x4000, 0x0004, 0x0100, 0x4000, 0x0015, 0x0101,
		0x5000, 0x000e, 0x0100, 0xe000, 0x0004, 0x0100, 0x4000, 0x1cff,
		0xe10f, 0xfe38, 0x04ff, 0xe10f, 0xfe20, 0x1cff, 0xe10f, 0xfe38,
		0x10ff, 0xe10f, 0xfe08, 0x1cff, 0xe10f, 0xfe38, 0x0004, 0x0100,
		0x4000, 0x0004, 0x0100, 0x4000, 0x0004, 0x0100, 0x4000, 0x0015,
		0x0101, 0x5000, 0x000e, 0x0100, 0xe000, 0x0004, 0x0100, 0x4000,
		0x1cff, 0xe10f, 0xfe10, 0x04ff, 0xe10f, 0xfe20, 0x0cff, 0xff0f,
		0xfe38, 0x04ff, 0xe00f, 0xfe28, 0x1cff, 0xe00f, 0xfe38, 0x0000,
		0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
};
BITBLK IM_SORT_YX = { _IMG_IM_SORT_YX, 6, 32, 0, 0, 1 };
static int16 _IMG_SUNRISE[] = {
		0x0000, 0x0000, 0x0000, 0x0000, 0x2110, 0x0000, 0x0000, 0x2110,
		0x3700, 0x0001, 0x1020, 0x4880, 0x6c00, 0x8782, 0x3700, 0x1000,
		0x1864, 0x0000, 0x000c, 0x2010, 0xc000, 0x0002, 0x4009, 0x0000,
		0x0000, 0x4008, 0x0000, 0x0000, 0x8004, 0x0000, 0x000e, 0x8005,
		0xc000, 0x0000, 0x8004, 0x0000, 0x0000, 0x8004, 0x0000, 0x3f1c,
		0x7878, 0x70f0, 0x00e3, 0x8787, 0x8f0c, 0xfe18, 0x0000, 0x0000,
		0x01e7, 0x3870, 0x3c60, 0x0000, 0x0787, 0xc39f, 0xfe1c, 0x0000,
		0x0000, 0x01e3, 0x9ce0, 0xe1e0, 0x0000, 0x030f, 0x1e1f, 0x0f07,
		0xe000, 0x70c0, 0x30f8, 0x0ccf, 0x8f3c, 0x0000, 0x0300, 0x0000
};
BITBLK SUNRISE = { _IMG_SUNRISE, 6, 24, 0, 0, 1 };

struct {
	OBJECT root;
	OBJECT _01_INFO_OB_WH;
	OBJECT _02_INFO_OB_WH;
} INFO_OB_WH = {
	{ -1,  1,  2, G_BOX,  0x0000, 0x0000, C_UNION(0x00011101L), 0x0000, 0x0000, 0x000b, 0x0002 },
	{  2, -1, -1, G_TEXT, 0x0000, 0x0000, C_UNION(&TEDINFO_02), 0x0000, 0x0000, 0x000b, 0x0001 },
	{  0, -1, -1, G_TEXT, 0x0020, 0x0000, C_UNION(&TEDINFO_02), 0x0000, 0x0001, 0x000b, 0x0001 }
};

static struct {
	OBJECT root;
	OBJECT  _01_NEW2_LABEL;
	OBJECT  _02_NEW2_LABEL;
	OBJECT  _03_NEW2_LABEL;
	AOBJECT _03aNEW2_LABEL;
	OBJECT  _05_NEW2_LABEL;
	AOBJECT _05aNEW2_LABEL;
} NEW2_LABEL = {
	{ -1,  1,  5, G_USERDEF, 0x0000, 0x0010, C_UNION(&A_3DBUTTON03), 0x0000, 0x0000, 0x0024, 0x0006 },
	{  3,  2,  2, G_USERDEF, 0x0040, 0x0000, C_UNION(&A_INNERFRAME02), 0x0001, 0x0000, 0x0022, 0x0003 },
	{  1, -1, -1, G_USERDEF, 0x0008, 0x0010, C_UNION(&A_BOXED02), 0x0001, 0x0001, 0x0020, 0x0001 },
	{  5, -1, -1, G_USERDEF, 0x4007, 0x0010, C_UNION(&A_3DBUTTON02), 0x0004, 0x0003, 0x000c, 0x0002 },
	{ NULL, NULL, 0x8000, 0x884f, NULL, NULL, 0, 0 },
	{  0, -1, -1, G_USERDEF, 0x4005, 0x0010, C_UNION(&A_3DBUTTON05), 0x0013, 0x0003, 0x000c, 0x0002 },
	{ NULL, NULL, 0x8020, 0x8841, NULL, NULL, 0, 0 }
};

static struct {
	OBJECT root;
	OBJECT  _01_NEW_LABEL;
	OBJECT  _02_NEW_LABEL;
	OBJECT  _03_NEW_LABEL;
	AOBJECT _03aNEW_LABEL;
} NEW_LABEL = {
	{ -1,  1,  3, G_USERDEF, 0x0000, 0x0010, C_UNION(&A_3DBUTTON03), 0x0000, 0x0000, 0x0024, 0x0006 },
	{  3,  2,  2, G_USERDEF, 0x0040, 0x0000, C_UNION(&A_INNERFRAME02), 0x0001, 0x0000, 0x0022, 0x0003 },
	{  1, -1, -1, G_USERDEF, 0x0008, 0x0010, C_UNION(&A_BOXED02), 0x0001, 0x0001, 0x001f, 0x0001 },
	{  0, -1, -1, G_USERDEF, 0x4007, 0x0010, C_UNION(&A_3DBUTTON02), 0x000c, 0x0003, 0x000c, 0x0002 },
	{ chk_new_label, NULL, 0x8020, 0x884f, NULL, NULL, 0, 0 }
};

struct {
	OBJECT root;
	OBJECT _01_OUTPUT_INFO;
	OBJECT _02_OUTPUT_INFO;
	OBJECT _03_OUTPUT_INFO;
	OBJECT _04_OUTPUT_INFO;
	OBJECT _05_OUTPUT_INFO;
	OBJECT _06_OUTPUT_INFO;
	OBJECT _07_OUTPUT_INFO;
	OBJECT _08_OUTPUT_INFO;
	OBJECT _09_OUTPUT_INFO;
	OBJECT _10_OUTPUT_INFO;
	OBJECT _11_OUTPUT_INFO;
	OBJECT _12_OUTPUT_INFO;
} OUTPUT_INFO = {
	{ -1,  1,  1, G_BOX, 0x0000, 0x0000, C_UNION(0x00ff1178L), 0, 0, 44, 11 },
	{  0,  2,  4, G_USERDEF, 0x0000, 0x0010, C_UNION(&A_3DBUTTON03), 0, 0, 44, 11 },
	{  4,  3,  3, G_USERDEF, 0x0000, 0x0010, C_UNION(&A_3DBUTTON01), 2, 1, 40, 1 },
	{  2, -1, -1, G_BOXTEXT, 0x0000, 0x0500, C_UNION(&TEDINFO_01), 0, 0, 40, 1 },
	{  1,  5, 12, G_USERDEF, 0x0000, 0x0010, C_UNION(&A_3DBUTTON01), 2, 3, 40, 7 },
	{  6, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_02), 0, 0, 8, 1 },
	{  7, -1, -1, G_BOXTEXT, 0x0000, 0x0000, C_UNION(&TEDINFO_064), 9, 0, 31, 1 },
	{  8, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_03), 0, 2, 6, 1 },
	{  9, -1, -1, G_BOXTEXT, 0x0000, 0x0000, C_UNION(&TEDINFO_064), 9, 2, 31, 1 },
	{ 10, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_04), 0, 4, 6, 1 },
	{ 11, -1, -1, G_BOXTEXT, 0x0000, 0x0000, C_UNION(&TEDINFO_064), 9, 4, 31, 1 },
	{ 12, -1, -1, G_STRING, 0x0000, 0x0000, C_UNION(TEXT_05), 0, 6, 7, 1 },
	{  4, -1, -1, G_BOXTEXT, 0x0020, 0x0000, C_UNION(&TEDINFO_064), 9, 6, 31, 1 }
};

Awindow WI_NEW2_LABEL = {
		NULL,
		Awi_service,
		Awi_selfcreate,
		Awi_open,
		Awi_init,
		&NEW2_LABEL.root,
		NULL,
		0, 0,
		-1,
		NAME | CLOSER | MOVER,
		{ 0, 0, 120, 50 },
		{ 0, 0, 0, 0 },
		{ 0, 0, 0, 0 },
		{ -1, -1, -1, -1 },
		0, 0,
		0xf8f8,
		TEXT_10,
		TEXT_002,
		10000,
		0,
		0,
		-1,
		NULL,
		NULL,
		Awi_keys,
		Awi_obchange,
		Awi_redraw,
		Awi_topped,
		Awi_closed,
		Awi_fulled,
		Awi_arrowed,
		Awi_hslid,
		Awi_vslid,
		Awi_sized,
		Awi_moved,
		Awi_iconify,
		Awi_uniconify,
		Awi_gemscript,
		NULL,
		NULL
};

Awindow WI_NEW_LABEL = {
		NULL,
		Awi_service,
		Awi_selfcreate,
		Awi_open,
		Awi_init,
		&NEW_LABEL.root,
		NULL,
		0, 0,
		-1,
		NAME | CLOSER | MOVER,
		{ 0, 0, 120, 50 },
		{ 0, 0, 0, 0 },
		{ 0, 0, 0, 0 },
		{ -1, -1, -1, -1 },
		0, 0,
		0xf8f8,
		TEXT_10,
		TEXT_002,
		10000,
		0,
		0,
		-1,
		NULL,
		NULL,
		Awi_keys,
		Awi_obchange,
		Awi_redraw,
		Awi_topped,
		Awi_closed,
		Awi_fulled,
		Awi_arrowed,
		Awi_hslid,
		Awi_vslid,
		Awi_sized,
		Awi_moved,
		Awi_iconify,
		Awi_uniconify,
		Awi_gemscript,
		NULL,
		NULL
};
