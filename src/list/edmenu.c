#include "acs_i.h"

#define STATIC

static Obj_Head aboutme = {
	NULL,
	ABOUT,
	0,
	sizeof(ABOUT),
	sizeof(ABOUT),
	NULL,
	"TEXT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};
static char sep[] = "--------------------";
static Obj_Head separator = {
	NULL,
	sep,
	0,
	sizeof(sep),
	sizeof(sep),
	NULL,
	"TEXT_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};
static char dummy[] = "";
static Obj_Head anystr = {
	NULL,
	dummy,
	0,
	sizeof(dummy),
	sizeof(dummy),
	NULL,
	"NULL_STRING",
	1,
	0,
	{ 0, 0, 0, 0 }
};

protomen:
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $ffff
	dc.w $0001
	dc.w $0004
	dc.w $0019
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000

	dc.w $0000
	dc.w $0000
	dc.w $005a
	dc.w $0019
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0004
	dc.w $0002
	dc.w $0002
	dc.w $0014

	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $1100
	dc.w $0000
	dc.w $0000
	dc.w $005a
	dc.w $0201
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0001
	dc.w $0003
	dc.w $0003
	dc.w $0019
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0002
	dc.w $0000
	dc.w $0006
	dc.w $0301
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0002
	dc.w $ffff
	dc.w $ffff
	dc.w $0020
	dc.w $0000
	dc.w $0000
	dc.l anystr
	dc.w $0000
	dc.w $0000
	dc.w $0006
	dc.w $0301
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0005
	dc.w $0005
	dc.w $0019
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0301
	dc.w $0050
	dc.w $0013
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0004
	dc.w $0006
	dc.w $000d
	dc.w $0014
	dc.w $0000
	dc.w $0000
	dc.w $00ff
	dc.w $1100
	dc.w $0002
	dc.w $0000
	dc.w $0014
	dc.w $0008
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0007
	dc.w $ffff
	dc.w $ffff
	dc.w $001c
	dc.w $0000
	dc.w $2000
	dc.l aboutme
	dc.w $0000
	dc.w $0000
	dc.w $0014
	dc.w $0001
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0008
	dc.w $ffff
	dc.w $ffff
	dc.w $001c
	dc.w $0000
	dc.w $2008
	dc.l separator
	dc.w $0000
	dc.w $0001
	dc.w $0014
	dc.w $0001
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0009
	dc.w $ffff
	dc.w $ffff
	dc.w $001c
	dc.w $0000
	dc.w $2000
	dc.l anystr
	dc.w $0000
	dc.w $0002
	dc.w $0014
	dc.w $0001
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $000a
	dc.w $ffff
	dc.w $ffff
	dc.w $001c
	dc.w $0000
	dc.w $2000
	dc.l anystr
	dc.w $0000
	dc.w $0003
	dc.w $0014
	dc.w $0001
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $000b
	dc.w $ffff
	dc.w $ffff
	dc.w $001c
	dc.w $0000
	dc.w $2000
	dc.l anystr
	dc.w $0000
	dc.w $0004
	dc.w $0014
	dc.w $0001
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $000c
	dc.w $ffff
	dc.w $ffff
	dc.w $001c
	dc.w $0000
	dc.w $2000
	dc.l anystr
	dc.w $0000
	dc.w $0005
	dc.w $0014
	dc.w $0001
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $000d
	dc.w $ffff
	dc.w $ffff
	dc.w $001c
	dc.w $0000
	dc.w $2000
	dc.l anystr
	dc.w $0000
	dc.w $0006
	dc.w $0014
	dc.w $0001
	dc.w $0000
	dc.w $0000
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
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0005
	dc.w $ffff
	dc.w $ffff
	dc.w $001c
	dc.w $0000
	dc.w $2000
	dc.l anystr
	dc.w $0000
	dc.w $0007
	dc.w $0014
	dc.w $0001
	dc.w $0000
	dc.w $0000
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

static Obj_Head protomenu = {
	NULL,
	protomen,
	0,
	sizeof(protomen),
	sizeof(protomen),
	NULL,
	"MENU_01",
	1,
	0,
	{ 0, 0, 0, 0 }
};

STATIC Obj_Head *copy_menu(ACS_HEAD *acs, const Obj_Head *obj);
STATIC OBJECT *new_work(Obj_Head *objlist);

LISTPARM list_menu = {
	NULL,
	NULL,
	&WI_MENU,
	me_list,
	me_name,
	LIST_MENU,
	&protomenu,
	copy_menu,
	del_menu,
	new_work,
	NULL
};
