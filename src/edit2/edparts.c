#include "acs_i.h"
#include "country.h"
#include "acs_uo.h"
#include "acsplus.h"

extern Obj_Head part_palette; /* FIXME: should be static */

static void go_spec_edit(void);
static void go_flag_edit(void);
static void go_ref_edit(void);
static void go_pos_edit(void);

static boolean part_service(Awindow *self, int16 task, void *in_out);
static Awindow *part_make(void *a);
static int16 part_init(Awindow *self);
static void part_close(Awindow *self);

static void ed_abort(void);

#include "edparts.ah"

static TEDINFO button = { "BUTTON", "", "", 3, 6, 2, 0x1180, 0, -1, 6, 0 };
static TEDINFO gtext = { "TEXT", "", "", 3, 6, 2, 0x1180, 0, -1, 5, 0 };
static TEDINFO title = { " TITLE ", "", "", 3, 6, 2, 0x1180, 0, -1, 8, 0 };
static TEDINFO editext = { "abc", "EDIT:____", "XXXX", 3, 6, 2, 0x1180, 0, -1, 4, 10 };
static TEDINFO usertext = { "USERDEF", "", "", 3, 6, 2, 0x1180, 0, -1, 8, 0 };
static AUSERBLK check = { A_checkbox, 0L, NULL, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK radio = { A_radiobutton, 0L, NULL, NULL, NULL, NULL, NULL, NULL };
static AUSERBLK frame = { A_innerframe, 0x00031101L, NULL, NULL, NULL, NULL, NULL, NULL };
static Obj_Head astrabs = { NULL, "abc", 0, sizeof("abc"), sizeof("abc"), NULL, "TEXT_01", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head astredit = { NULL, "EDIT:____", 0, sizeof("EDIT:____"), sizeof("EDIT:____"), NULL, "TEXT_01", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head astrvalid = { NULL, "XXXX", 0, sizeof("XXXX"), sizeof("XXXX"), NULL, "TEXT_01", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head astring = { NULL, "STRING", 0, sizeof("STRING"), sizeof("STRING"), NULL, "TEXT_01", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head atitle = { NULL, " TITLE ", 0, sizeof(" TITLE "), sizeof(" TITLE "), NULL, "TEXT_01", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head abutton = { NULL, "BUTTON", 0, sizeof("BUTTON"), sizeof("BUTTON"), NULL, "TEXT_01", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head astrnull = { NULL, "", 0, sizeof(""), sizeof(""), NULL, "NULL_STRING", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head astrtext = { NULL, "TEXT", 0, sizeof("TEXT"), sizeof("TEXT"), NULL, "TEXT_01", 1, 0, { 0, 0, 0, 0 } };
static TEDINFO agtext_obj = { (char *)&astrtext, (char *)&astrnull, (char *)&astrnull, 3, 6, 2, 0x1180, 0, -1, sizeof("TEXT"), 0 };
static Obj_Head agtext = { NULL, &agtext_obj, 0, sizeof(agtext_obj), sizeof(agtext_obj), NULL, "TEDINFO_01", 1, 0, { 0, 0, 0, 0 } };
static TEDINFO aeditext_obj = { (char *)&astrabs, (char *)&astredit, (char *)&astrvalid, 3, 6, 2, 0x1180, 0, -1, sizeof("abc"), sizeof("EDIT:____") };
static Obj_Head aeditext = { NULL, &aeditext_obj, 0, sizeof(aeditext_obj), sizeof(aeditext_obj), NULL, "TEDINFO_01", 1, 0, { 0, 0, 0, 0 } };
static struct {
	BITBLK bit;
	int16 imagedata[72];
} abitblk_obj = {
	{ (int16 *)sizeof(BITBLK), 6, 24, 0, 0, 1 },
	{ 0x07ff, 0xffff, 0xff80, 0x0c00, 0x0000, 0x00c0, 0x183f, 0xf03f,
	  0xf060, 0x187f, 0xf860, 0x1860, 0x187f, 0xf860, 0x1860, 0x187f,
	  0xf860, 0x1860, 0x187f, 0xf860, 0x1860, 0x187f, 0xf860, 0x1860,
	  0x187f, 0xf860, 0x1860, 0x187f, 0xf860, 0x1860, 0x187f, 0xf860,
	  0x1860, 0x187f, 0xf860, 0x1860, 0x187f, 0xf860, 0x1860, 0x187f,
	  0xf860, 0x1860, 0x183f, 0xf03f, 0xf060, 0x0c00, 0x0000, 0x00c0,
	  0x07ff, 0xffff, 0xff80, 0x0000, 0x0000, 0x0000, 0x3f30, 0xc787,
	  0x8fe0, 0x0c39, 0xcccc, 0xcc00, 0x0c36, 0xcfcc, 0x0f80, 0x0c30,
	  0xcccd, 0xcc00, 0x3f30, 0xccc7, 0xcfe0, 0x0000, 0x0000, 0x0000 }
};
static Obj_Head abitblk = { NULL, &abitblk_obj, 0, sizeof(abitblk_obj), sizeof(abitblk_obj), NULL, "IMAGE_01", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head asepcall = { NULL, NULL, 0, 0, 0, NULL, "A_innerframe", 1, 0x203, { 0, 0, 0, 0 } };
static Obj_Head asepparm = { NULL, NULL, 0, 0, 0, NULL, "0x11101L", 1, 0, { 0, 0, 0, 0 } };
static AUSERBLK asep_obj = { (void *)&asepcall, (int32)(void *)&asepparm, NULL, NULL, NULL, NULL, NULL, NULL };
static Obj_Head asep = { NULL, &asep_obj, 0, sizeof(asep_obj), sizeof(asep_obj), NULL, "SEPERATOR000", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head ausercall = { NULL, NULL, 0, 0, 0, NULL, "USER_OBJ", 1, 3, { 0, 0, 0, 0 } };
static Obj_Head auserparm = { NULL, NULL, 0, 0, 0, NULL, "0x0L", 1, 0, { 0, 0, 0, 0 } };
static AUSERBLK auserblk_obj = { (void *)&ausercall, (int32)(void *)&auserparm, NULL, NULL, NULL, NULL, NULL, NULL };
static Obj_Head auserblk = { NULL, &auserblk_obj, 0, sizeof(auserblk_obj), sizeof(auserblk_obj), NULL, "USERBLK_01", 1, 0, { 0, 0, 0, 0 } };
static Obj_Head astricon = { NULL, "CICON", 0, sizeof("CICON"), sizeof("CICON"), NULL, "TEXT_01", 1, 0, { 0, 0, 0, 0 } };
static struct {
	ACSCICONBLK cicon;
	int16 iconmask[72];
	int16 icondata[72];
} aiconblk_obj = {
	{ { { (int16 *)82, (int16 *)226, (char *)&astricon, 0x1041, 20, 6, 0, 0, 48, 24, 0, 24, 48, 8 }, NULL },
	  { 0, NULL, NULL, NULL, NULL, NULL },
	  { 0, NULL, NULL, NULL, NULL, NULL }
	}, {
	  0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff,
	  0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff,
	  0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00,
	  0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff,
	  0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x00ff,
	  0xffff, 0xfe00, 0x00ff, 0xffff, 0xfe00, 0x0fff, 0xffff, 0xfff0,
	  0x0fff, 0xffff, 0xfff0, 0x0fff, 0xffff, 0xfff0, 0x0fff, 0xffff,
	  0xfff0, 0x0fff, 0xffff, 0xfff0, 0x0fff, 0xffff, 0xfff0, 0x0fff,
	  0xffff, 0xfff0, 0x0fff, 0xffff, 0xfff0, 0x0000, 0x0000, 0x0000
	}, {
	  0x00ff, 0xffff, 0xfe00, 0x00c0, 0x0000, 0x0600, 0x00c0, 0x7fff,
	  0x8600, 0x00c0, 0xc000, 0x8600, 0x00c1, 0x4000, 0x8600, 0x00c3,
	  0xc000, 0x8600, 0x00c2, 0x0000, 0x8600, 0x00c2, 0x0000, 0x8600,
	  0x00c2, 0x0000, 0x8600, 0x00c2, 0x0000, 0x8600, 0x00c2, 0x0000,
	  0x8600, 0x00c2, 0x0000, 0x8600, 0x00c2, 0x0000, 0x8600, 0x00c2,
	  0x0000, 0x8600, 0x00c2, 0x0000, 0x8600, 0x0fc3, 0xffff, 0x87f0,
	  0x0c00, 0x0000, 0x0030, 0x0c1c, 0xf9f9, 0x8830, 0x0c08, 0x8109,
	  0x4830, 0x0c08, 0x8109, 0x2830, 0x0c1c, 0xf9f9, 0x1830, 0x0c00,
	  0x0000, 0x0030, 0x0fff, 0xffff, 0xfff0, 0x0000, 0x0000, 0x0000,
	}
};
static Obj_Head aiconblk = { NULL, &aiconblk_obj, 0, sizeof(aiconblk_obj), sizeof(aiconblk_obj), NULL, "ICON_01", 1, 0, { 0, 0, 0, 0 } };

static OBJ_ENTRY tree[60] = {
	{ NULL, NULL,
	  { -1, -1, -1, 0x001a, 0x0005, 0x0000, C_UNION(&abutton), 0x0000, 0x0000, 0x0007, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x001c, 0x0000, 0x0000, C_UNION(&astring), 0x0000, 0x0000, 0x0006, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x001d, 0x0008, 0x0000, C_UNION(&aeditext), 0x0000, 0x0000, 0x0009, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x001e, 0x0008, 0x0000, C_UNION(&aeditext), 0x0000, 0x0000, 0x0009, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0019, 0x0000, 0x0000, C_UNION(0x00011101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0015, 0x0000, 0x0000, C_UNION(&agtext), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x001b, 0x0000, 0x0000, C_UNION(0x43ff1101L), 0x0000, 0x0000, 0x0002, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0016, 0x0000, 0x0000, C_UNION(&agtext), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0020, 0x0000, 0x0000, C_UNION(&atitle), 0x0000, 0x0000, 0x0007, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0017, 0x0000, 0x0000, C_UNION(&abitblk), 0x0000, 0x0000, 0x0006, 0x0002 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x001f, 0x0000, 0x0000, C_UNION(&aiconblk), 0x0000, 0x0000, 0x0006, 0x0002 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0018, 0x0000, 0x0000, C_UNION(&auserblk), 0x0000, 0x0000, 0x0008, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } },
	{ NULL, NULL,
	  { -1, -1, -1, 0x0014, 0x0000, 0x0000, C_UNION(0x00ff1101L), 0x0000, 0x0000, 0x0004, 0x0001 },
	  { NULL, NULL, 0x8000, 0x0000, NULL, NULL, 0x0000, 0x0000 } }
};
Obj_Head part_palette = { NULL, tree, 0, sizeof(tree), sizeof(tree), NULL, "PALETTE", 1, 0, { 0, 0, 0, 0 } };
static BITBLK bitblk = { abitblk_obj.imagedata, 6, 24, 0, 0, 1 };
static ACSCICONBLK iconblk = {
	{ { aiconblk_obj.iconmask, aiconblk_obj.icondata, "CICON", 0x1041, 20, 6, 0, 0, 48, 24, 0, 24, 48, 8 }, NULL },
	{ 0, NULL, NULL, NULL, NULL, NULL },
	{ 0, NULL, NULL, NULL, NULL, NULL }
};
static int16 part_ucnt = 0;

static void set_userdata(AUSER_DEF *user, int16 width, int16 height);

static UOCALLS uocall = { ed_abort, set_userdata };
Awindow *parts_window = NULL;

#define MAX_PARTS 40

static UODATAS *part_list[MAX_PARTS];

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static Obj_Head *omalloc(ssize_t size)
{
	void *data;
	Obj_Head *obj;
	
	data = NULL;
	if (size != 0 && (data = Ax_malloc(size)) == NULL)
		return NULL;
	obj = Ax_malloc(sizeof(*obj));
	if (obj == NULL)
	{
		Ax_free(data);
		return NULL;
	}
	memset(obj, 0, sizeof(*obj));
	obj->object = data;
	obj->usage = 1;
	obj->next = NULL;
	obj->used = obj->size = size;
	return obj;
}

/* -------------------------------------------------------------------------- */

static int16 part_add(UODATAS *uodata)
{
	OBJECT *work; /* 20 */
	int16 obnr;
	OBJECT *ptr; /* a4 */
	OBJECT *head; /* 16 */
	AOBJECT *aobj; /* 12 */
	OBJ_ENTRY *objentry; /* 8 */
	AUSERBLK *user; /* 4 */
	Obj_Head *obj; /* 0 */
	AUSER_DEF *aud;
	Obj_Head *entry;
	size_t len;
	
	if (part_ucnt >= MAX_PARTS)
		return FAIL;
	work = parts_window->work;
	obnr = Aob_findflag(work, -1, OF_HIDETREE);
	if (obnr < 0)
		return FAIL;
	ptr = &work[obnr];
	head = &work[ptr->ob_head];
	aobj = (AOBJECT *)head + 1;
	objentry = &tree[(int16)(int32)aobj->userp2];
	objentry->obj.ob_type = G_USERDEF;
	objentry->obj.ob_flags = uodata->insert->ob_flags;
	objentry->obj.ob_state = uodata->insert->ob_state;
	objentry->obj.ob_x = uodata->insert->ob_x;
	objentry->obj.ob_y = uodata->insert->ob_y;
	objentry->obj.ob_width = uodata->insert->ob_width;
	objentry->obj.ob_height = uodata->insert->ob_height;
	
	aud = uodata->aud;
	
	obj = omalloc(sizeof(*user));
	if (obj == NULL)
	{
		/* FIXME: leaks everything allocated above */
		return FAIL;
	}
	strupr(strncat(strcpy(obj->label, uodata->uo_name), "01", LABEL_MAX - 1));
	obj->flags = aud->type1 | (aud->type2 << 2) | (aud->type3 << 4);
	user = obj->object;

	entry = omalloc(0);
	if (entry == NULL)
	{
		/* FIXME: leaks everything allocated above */
		return FAIL;
	}
	strcpy(entry->label, uodata->uo_name);
	entry->flags = 0x203;
	user->ub_code = (void *)entry;
	
	entry = omalloc(0);
	if (entry == NULL)
	{
		/* FIXME: leaks everything allocated above */
		return FAIL;
	}
	strcpy(entry->label, aud->parm);
	entry->flags = 0;
	user->ub_parm = (int32)(void *)entry;
	
	if (aud->serv != NULL && *aud->serv != '\0')
	{
		entry = omalloc(0);
		if (entry == NULL)
		{
			/*FIXME: leaks everything allocated above */
			return FAIL;
		}
		strcpy(entry->label, aud->serv);
		entry->flags = 0x204;
	} else
	{
		entry = NULL;
	}
	user->ub_serv = (void *)entry;
	
	switch (aud->type1)
	{
	case REF_PAR:
		entry = omalloc(0);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		entry->flags = 0;
		user->ub_ptr1 = entry;
		break;

	case STR_PAR:
		len = strlen(aud->data1) + 1;
		entry = omalloc(len);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		strcpy(entry->label, "TEXT_01");
		strcpy(entry->object, aud->data1);
		user->ub_ptr1 = entry;
		break;
	
	case DATA_PAR:
		entry = omalloc(aud->len1);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		strcpy(entry->label, "DATAS_01");
		memcpy(entry->object, aud->data1, aud->len1);
		user->ub_ptr1 = entry;
		break;
	
	default:
		user->ub_ptr1 = NULL;
		break;
	}

	switch (aud->type2)
	{
	case REF_PAR:
		entry = omalloc(0);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		entry->flags = 0;
		user->ub_ptr2 = entry;
		break;

	case STR_PAR:
		len = strlen(aud->data2) + 1;
		entry = omalloc(len);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		strcpy(entry->label, "TEXT_01");
		strcpy(entry->object, aud->data2);
		user->ub_ptr2 = entry;
		break;
	
	case DATA_PAR:
		entry = omalloc(aud->len2);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		strcpy(entry->label, "DATAS_01");
		memcpy(entry->object, aud->data2, aud->len2);
		user->ub_ptr2 = entry;
		break;
	
	default:
		user->ub_ptr2 = NULL;
		break;
	}

	switch (aud->type3)
	{
	case REF_PAR:
		entry = omalloc(0);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		entry->flags = 0;
		user->ub_ptr3 = entry;
		break;

	case STR_PAR:
		len = strlen(aud->data3) + 1;
		entry = omalloc(len);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		strcpy(entry->label, "TEXT_01");
		strcpy(entry->object, aud->data3);
		user->ub_ptr3 = entry;
		break;
	
	case DATA_PAR:
		entry = omalloc(aud->len3);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		strcpy(entry->label, "DATAS_01");
		memcpy(entry->object, aud->data3, aud->len3);
		user->ub_ptr3 = entry;
		break;
	
	default:
		user->ub_ptr3 = NULL;
		break;
	}
	
	if (!Ast_isEmpty(aud->bubble))
	{
		entry = omalloc(strlen(aud->bubble) + 1);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		strcpy(entry->label, "BUBBLE_01");
		strcpy(entry->object, aud->bubble);
		entry->flags = 0x400;
	} else
	{
		entry = NULL;
	}
	user->bubble = (char *)entry;
	
	if (!Ast_isEmpty(aud->context))
	{
		entry = omalloc(strlen(aud->context) + 1);
		if (entry == NULL)
		{
			/* FIXME: leaks everything allocated above */
			return FAIL;
		}
		strcpy(entry->label, "CONTEXT_01");
		strcpy(entry->object, aud->context);
		entry->flags = 0x400;
	} else
	{
		entry = NULL;
	}
	user->context = (char *)entry;
	
	objentry->obj.ob_spec.auserblk = (void *)obj;
	
	ptr->ob_type = uodata->visual->ob_type;
	ptr->ob_state = uodata->visual->ob_state | AOS_CONST;
	ptr->ob_spec = uodata->visual->ob_spec;
	head->ob_x = ptr->ob_x = uodata->visual->ob_x;
	head->ob_y = ptr->ob_y = uodata->visual->ob_y;
	head->ob_width = ptr->ob_width = uodata->visual->ob_width;
	head->ob_height = ptr->ob_height = uodata->visual->ob_height;
	
	ptr->ob_flags &= ~OF_HIDETREE;
	if (ptr->ob_type == G_USERDEF)
	{
		AUSERBLK *auser;
		auser = ptr->ob_spec.auserblk;
		if (auser->ub_serv != NULL)
			auser->ub_serv(ptr, AUO_CREATE, NULL);
	}
	rsrc_obfix(ptr, 0);
	rsrc_obfix(head, 0);

	uodata->interface = &uocall;
	
	part_list[part_ucnt] = uodata;
	part_ucnt++;
	
	return OK;
}

/* -------------------------------------------------------------------------- */

UODATAS *part_get(const char *name)
{
	int i;
	
	for (i = part_ucnt - 1; i >= 0; i--)
	{
		if (strcmp(name, part_list[i]->uo_name) == 0)
			return part_list[i];
	}
	return NULL;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static Awindow *part_make(void *a)
{
	Awindow *win;
	char apppath[__PS__ * 2];
	char ext[6];
	char *slash;
	A_FileList *list;
	A_FileList *ptr;
	
	list = NULL; /* FIXME: useless */
	parts_window = win = Awi_create(&WI_PARTS);
	if (win != NULL)
	{
		init_boxed(win);
		init_title(win);
		init_3Dbutton(win);
		init_check(win);
		init_cycle(win);
		init_slider(win);
		init_ftext(win);
		init_inner(win);
		init_picture(win);
		init_editor(win);
		init_pattern(win);
		init_arrow(win);
		init_select(win);
	}
	
	strcpy(apppath, ACSblk->apppath);
	if (apppath[0] < 'C')
	{
		if (Dsetdrv(Dgetdrv()) & 4)
			apppath[0] = 'C';
	}
	if ((slash = strrchr(apppath, PATH_SEP)) != NULL && slash[1] != '\0')
		slash[1] = '\0';
	list = ptr = Af_readdir(apppath);
	if (list != NULL)
	{
		while (ptr != NULL)
		{
			if (strcmp(strupr(Af_2ext(ext, ptr->file)), "AME") == 0)
			{
				Ash_module(ptr->file);
			}
			ptr = ptr->next;
		}
		Af_freedir(list);
	}
	return win;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void part_close(Awindow *self)
{
	self->state |= AWS_TERM;
	Awi_closed(self);
	self->state &= ~AWS_TERM;
}

/* -------------------------------------------------------------------------- */

static int16 part_init(Awindow *self)
{
	self->state |= AWS_FORCEREDRAW;
	self->sized(self, &self->wi_act);
	return OK;
}

/* -------------------------------------------------------------------------- */

static boolean part_service(Awindow *self, int16 task, void *in_out)
{
	Awindow *win;
	
	switch (task)
	{
	case AS_TERM:
		if (ACSblk->appexit)
			Awi_delete(self);
		break;
	
	case AS_GETBUBBLE:
		((AGetObjText *)in_out)->text = NULL;
		break;
	
	case AS_ALLOWBUBBLE:
		*((boolean *)in_out) = TRUE;
		break;

	case AS_CHECKDELETE:
		*((boolean *)in_out) = FALSE;
		break;

	case AS_ACS_PART_CHECK:
		if (part_ucnt < MAX_PARTS)
			*((Awindow **)in_out) = self;
		break;
	
	case AS_ACS_PART_ADD:
		part_add(in_out);
		self->state |= AWS_LATEUPDATE;
		break;
	
	case AS_ACCLOSED:
		if (self->icon >= 0)
		{
			win = Awi_root();
			win->service(win, AS_REMICON, &self->icon);
		}
		break;
	
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void glue_parts(Awindow *win)
{
	Axywh rect;
	
	if (gluepart &&
		win->wi_id > 0 &&
		parts_window != NULL &&
		parts_window->wi_id > 0 &&
		!(parts_window->state & AWS_ICONIZED))
	{
		Aev_mess();
		rect.x = win->wi_work.x - (rect.w = parts_window->wi_act.w);
		rect.y = win->wi_work.y - ACSblk->gl_hattr;
		if (parts_window->menu != NULL)
			rect.y -= ACSblk->gl_hbox;
		if (rect.x < ACSblk->desk.x)
			rect.x = ACSblk->desk.x;
		if (rect.y < ACSblk->desk.y)
			rect.y = ACSblk->desk.y;
		rect.h = parts_window->wi_act.h;
		parts_window->moved(parts_window, &rect);
	}	
}

/* -------------------------------------------------------------------------- */

static void go_detail(void (*func)(void))
{
	Awindow *acs;
	int16 top;
	Awindow *win;
	
	acs = NULL;
	wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
	win = Awi_wid(top);
	if (win != NULL)
	{
		win->service(win, AS_ASKACSOBJ, &acs);
		if (acs != NULL && acs == win &&
			ACSblk->Aselect.actlen != 0 &&
			ACSblk->Aselect.window == acs)
		{
			ACSblk->ev_window = acs;
			func();
		}
	}
}

/* -------------------------------------------------------------------------- */

static void go_spec_edit(void)
{
	go_detail(edob_specs);
}

/* -------------------------------------------------------------------------- */

static void go_flag_edit(void)
{
	go_detail(edob_aflags);
}

/* -------------------------------------------------------------------------- */

static void go_ref_edit(void)
{
	go_detail(edob_refs);
}

/* -------------------------------------------------------------------------- */

static void go_pos_edit(void)
{
	go_detail(edob_pos);
}
