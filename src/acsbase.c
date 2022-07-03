#include "acs_i.h"
#include "acsplus.h"
#include "country.h"
#include <stddef.h>
#include "version.h"

static const char *const regstart[] = {
		"",
		"\tAn",
		"\tMartin Els„sser",
		"\tGarten„cker 30",
		"",
		"\tD - 86938 Schondorf a.A.",
		"",
		"",
		"",
		"\tRegistrierung von ACSpro",
		"",
		"\tHiermit beantrage ich die Registrierung von ACSpro Version ##### mit",
		"\tfolgenden Daten:",
		"",
		"\t  Name: 123456789012345678901234567890123456789012345678901234567890",
		"\tStraže: 123456789012345678901234567890123456789012345678901234567890",
		"\t   Ort: 123456789012345678901234567890123456789012345678901234567890",
		"\t  Land: 123456789012345678901234567890123456789012345678901234567890",
		"\t EMail: 123456789012345678901234567890123456789012345678901234567890",
		"",
		NULL
};

static const char *const regscheck[] = {
	"\tDie Zahlung erfolgt per beiliegendem Scheck ber 99,- DM.",
	"",
	NULL
};

static const char *const regkonto[] = {
	"\tDen Betrag von 99,- DM berweise ich vorab - unter Angabe obigen Namens -",
	"\tauf das Konto:",
	"",
	"\t\tMartin Els„sser",
	"\t\tPostbank Mnchen",
	"\t\tKto: 1196 34 - 804",
	"\t\tBLZ: 700 100 80",
	"",
	NULL,
};

static const char *const reginn[] = {
	"\tIch zahle den Betrag von 105,- DM per Inland-Nachnahme.",
	"",
	NULL
};

static const char *const regonn[] = {
	"\tIch zahle den Betrag von 124,- DM per Ausland-Nachnahme.",
	"",
	NULL
};

static const char *const regmail[] = {
	"\tDurch Angabe meiner EMail-Adresse erhalte ich die Registrierdaten",
	"\tan meine oben angegebenen EMail-Adresse gesendet.",
	"",
	NULL
};

static const char *const regend[] = {
	"",
	"",
	"\tDatum:",
	"",
	"\tUnterschrift:",
	"",
	NULL
};

#if KILLDEMO
boolean runasdemo = FALSE;
#else
boolean runasdemo = TRUE;
#endif

static Awindow *wdemo = NULL;
static long stepper = 0;
struct UConfig cfg = { 0, "", "", "", "", FALSE, 0, FALSE, FALSE, FALSE, 0, FALSE, 0,
	{ 0, 0, 0, 0 }, { 0, 0, 0, 0 },
	"", 0, { "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" } };
char *last_path = cfg.last_path;
char *helpacc = cfg.helpname;
boolean gluepart = TRUE;
boolean dirtysave = FALSE;
boolean snapping = TRUE;
int16 imagesnap = 1;
boolean copyindex = TRUE;
boolean refimages = TRUE;

static void (*oldabout)(void);
static long timer0;
static long timer1;
CEWSDATA cews;
Awindow *base_window;

static int16 CDECL ScrollDemo(PARMBLK *pb);
static boolean ScrollServ(OBJECT *entry, int16 task, void *in_out);
static void ab_snap(void);
static void ab_copyindex(void);
static void ab_copyimage(void);
static void ab_dirty(void);
static void ab_glue(void);
static void ab_save(void);
static void reg_me(void);
static void reg_kind(void);

static Awindow *ab_make(void *para);
static boolean ab_service(Awindow *self, int16 task, void *in_out);
static boolean demo_serv(Awindow *self, int16 task, void *in_out);
static int16 demo_init(Awindow *self);

#include "acsbase.ah"

static const char *const demotext[] = {
	DEMOT01,
	DEMOT02,
	DEMOT03,
	DEMOT04,
	DEMOT05,
	DEMOT06,
	DEMOT07,
	DEMOT08,
	DEMOT09,
	DEMOT10,
	DEMOT11,
	DEMOT12,
	DEMOT13,
	DEMOT14,
	DEMOT15,
	DEMOT16,
	DEMOT17,
	DEMOT18,
	DEMOT19,
	DEMOT20,
	DEMOT21,
	DEMOT22,
	DEMOT23,
	DEMOT24,
	DEMOT25,
	DEMOT26,
	DEMOT27,
	DEMOT28,
	DEMOT29,
	DEMOT30,
	DEMOT31,
	DEMOT32
};
#define NUM_DEMO_TEXT ((int)(sizeof(demotext) / sizeof(demotext[0])))


static char *live_snap(void *obj, long val);
static void validate(void);


/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void switch_opt(boolean *opt)
{
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, ACSblk->ev_object[ACSblk->ev_obnr].ob_state ^ OS_SELECTED);
	*opt = !*opt;
	Aev_release();
}

/* -------------------------------------------------------------------------- */

static void ab_glue(void)
{
	switch_opt(&gluepart);
}

/* -------------------------------------------------------------------------- */

static void ab_dirty(void)
{
	switch_opt(&dirtysave);
}

/* -------------------------------------------------------------------------- */

static void ab_snap(void)
{
	switch_opt(&snapping);
}

/* -------------------------------------------------------------------------- */

static void ab_copyindex(void)
{
	switch_opt(&copyindex);
}

/* -------------------------------------------------------------------------- */

static void ab_copyimage(void)
{
	switch_opt(&refimages);
}

/* -------------------------------------------------------------------------- */

static void save_it(Awindow *win)
{
	long fd;
	
	cfg.id = '3';
	cfg.flags = ACSblk->description->flags;
	cfg.gluepart = gluepart;
	cfg.dirty = dirtysave;
	cfg.imagesnap = imagesnap;
	cfg.snapping = snapping;
	cfg.copyindex = copyindex;
	cfg.refimages = refimages;
	cfg.save = win->work[BASE_AUTOSAVE].ob_state & OS_SELECTED ? TRUE : FALSE;
	if (parts_window->state & AWS_ICONIZED)
		memcpy(&cfg.pxywh, &parts_window->wi_normal, sizeof(cfg.pxywh));
	else
		memcpy(&cfg.pxywh, &parts_window->wi_act, sizeof(cfg.pxywh));
	if (win->state & AWS_ICONIZED)
		memcpy(&cfg.bxywh, &win->wi_normal, sizeof(cfg.pxywh));
	else
		memcpy(&cfg.bxywh, &win->wi_act, sizeof(cfg.pxywh));
	cfg.used = 0;
	Awi_sendall(AS_GUI_SAVECFG, win);
	fd = Fcreate(Af_cfgfile("ACS"), 0);
	if (fd > 0)
	{
		Fwrite((int)fd, sizeof(cfg), &cfg);
		Fclose((int)fd);
	}
}

/* -------------------------------------------------------------------------- */

static void ab_save(void)
{
	save_it(ACSblk->ev_window);
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static Awindow *ab_make(void *para)
{
	long fd;
	int16 i;
	int16 no3d;
	Awindow *win;
	OBJECT *tree;
#if WITH_FIXES
	char buf[8];
#else
	char buf[6];
#endif
	SLLIVE live;
	int32 size;
	
	win = Awi_create(&WI_COMMON);
	if (win == NULL)
		return NULL;
	no3d = ACSblk->description->flags & AB_NO3D;
	memset(&cews, 0, sizeof(cews));
	fd = Fopen(Af_cfgfile("ACS"), FO_READ);
	if (fd > 0)
	{
		if (Fread((int)fd, 1, buf) == 1)
		{
			struct cfg_v2 {
		    	char id;
		    	char username[128];
		    	char userserial[8];
		    	char userkey[9];
		    	char helpname[9];
		    	boolean gluepart;
		    	int16 save;
		    	boolean dirty;
		    	boolean snapping;
		    	boolean copyindex;
		    	int16 imagesnap;
		    	boolean refimages;
		    	int16 flags;
		    	Axywh pxywh;
		    	Axywh bxywh;
		    	char last_path[__PS__];
		    	int16 used;
		    	char acs[MAX_ACS][__PS__];
		    };
		    struct cfg_v2 cfg_v2;

			Fseek(0, (int)fd, SEEK_SET);
			switch (buf[0])
			{
			case '3':
				if (Fread((int)fd, sizeof(cfg), &cfg) != sizeof(cfg))
					memset(&cfg, 0, sizeof(cfg));
				break;
			
			case '2':
				if (Fread((int)fd, sizeof(cfg_v2), &cfg_v2) == sizeof(cfg_v2))
				{
					cfg.id = '3';
					strcpy(cfg.username, cfg_v2.username);
					strcpy(cfg.username, cfg_v2.username); /* FIXME: already done */
					strcpy(cfg.userserial, cfg_v2.userserial);
					strcpy(cfg.userkey, cfg_v2.userkey);
					strcpy(cfg.helpname, cfg_v2.helpname);
					memcpy(&cfg.gluepart, &cfg_v2.gluepart, offsetof(struct UConfig, last_path) - offsetof(struct UConfig, gluepart));
					strcpy(cfg.last_path, cfg_v2.last_path);
					cfg.used = cfg_v2.used;
					memcpy(cfg.acs, cfg_v2.acs, sizeof(cfg.acs));
				}
				if (cfg.id != '3')
					memset(&cfg, 0, sizeof(cfg));
				break;
			
			default:
				memset(&cfg, 0, sizeof(cfg));
				break;
			}
		} else
		{
			memset(&cfg, 0, sizeof(cfg));
		}
		Fclose((int) fd);
	}
	
	if (cfg.id == '3')
	{
		int16 flags;
		
		flags = AB_OLDMENU | AB_NOTRANSICON;
		ACSblk->description->flags = (ACSblk->description->flags & flags) | (cfg.flags & ~flags);
		gluepart = cfg.gluepart;
		dirtysave = cfg.dirty;
		imagesnap = cfg.imagesnap;
		snapping = cfg.snapping;
		copyindex = cfg.copyindex;
		refimages = cfg.refimages;
		memcpy(&parts_window->wi_act, &cfg.pxywh, sizeof(parts_window->wi_act));
		win->wi_act.x = cfg.bxywh.x;
		win->wi_act.y = cfg.bxywh.y;
		if (cfg.used > MAX_ACS)
			cfg.used = MAX_ACS;
		if (ACSblk->application)
		{
			for (i = cfg.used - 1; i >= 0; i--)
				WI_GENERAL.create(cfg.acs[i]);
		}
	}
	
	cfg.id = '3';
	tree = win->work;
	if (gluepart)
		tree[BASE_GLUEPART].ob_state |= OS_SELECTED;
	if (dirtysave)
		tree[BASE_DIRTYSAVE].ob_state |= OS_SELECTED;
	if (snapping)
		tree[BASE_SNAPPING].ob_state |= OS_SELECTED;
	if (copyindex)
		tree[BASE_COPYINDEX].ob_state |= OS_SELECTED;
	if (refimages)
		tree[BASE_REFIMAGES].ob_state |= OS_SELECTED;
	if (cfg.save)
		tree[BASE_AUTOSAVE].ob_state |= OS_SELECTED;
	Aob_puttext(tree, BASE_HELPACC, helpacc);
	Aob_puttext(tree, BASE_USERNAME, cfg.username);
	Aob_puttext(tree, BASE_USERSERIAL, cfg.userserial);
	Aob_puttext(tree, BASE_USERKEY, cfg.userkey);
	size = 4;
	Auo_slider(&tree[BASE_ICON_RASTER], AUO_SLFULL, &size);
	size = 1;
	Auo_slider(&tree[BASE_ICON_RASTER], AUO_SLSIZE, &size);
	
	switch (imagesnap)
	{
	case 1:
		size = 0;
		break;
	case 2:
		size = 1;
		break;
	case 4:
		size = 2;
		break;
	case 8:
		size = 3;
		break;
	}
	Auo_slider(&tree[BASE_ICON_RASTER], AUO_POS, &size);
	sprintf(buf, "%d", imagesnap);
	Auo_slider(&tree[BASE_ICON_RASTER], AUO_SETVAL, buf);
	live.call = live_snap;
	live.obj = &tree[BASE_ICON_RASTER];
	Auo_slider(&tree[BASE_ICON_RASTER], AUO_SLCALL, &live);
	if (((ACSblk->description->flags & AB_NO3D) ^ no3d) != 0)
	{
		Aev_WmRedraw(ACSblk->gl_apid, -1, &ACSblk->desk);
	}
	validate();
	return win;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static int16 ab_service(Awindow *self, int16 task, void *in_out)
{
	Awindow *win;
	Awindow *first;
	int16 i;
	int16 top;
	char *dot;
	char ext[6];
	OBJECT *obj;
	
	switch (task)
	{
	case AS_TERM:
		if (ACSblk->appexit)
		{
			Awi_delete(self);
		} else if (ACSblk->application)
		{
			Awi_alert(1, ERR_WICLOSE);
		} else
		{
			if (self->wi_id > 0)
				Awi_closed(self);
		}
		break;
	
	case AS_GUI_ISNOTUSED:
		for (i = 0; i < cfg.used; i++)
		{
			if (Ast_icmp(in_out, cfg.acs[i]) == 0)
				return FALSE;
		}
		break;
	
	case AS_GUI_SETUSED:
		if (cfg.used < MAX_ACS)
			strncpy(cfg.acs[cfg.used++], in_out, __PS__);
		break;
	
	case AS_INFO:
		Awi_doform(&WI_INFO_BASE, &WI_INFO_BASE);
		break;
	
	case AS_GUI_AUTOSAVE:
		if (self->work[BASE_AUTOSAVE].ob_state & OS_SELECTED)
			save_it(self);
		break;
	
	case AS_CEWS_BASE:
		cews.w_cews = *((Awindow **)in_out);
		*((Awindow **)in_out) = self;
		break;
		
	case AS_LOOKSTRING:
		wind_get(0, WF_TOP, &top, NULL, NULL, NULL);
		win = Awi_wid(top);
		if (win != NULL)
		{
			for (i = 0; i < MAX_ACS; i++)
			{
				if (cews.w_edit[i] == win)
					break;
			}
			if (i < MAX_ACS)
			{
				win->service(win, AS_EDGETENTRY, &obj);
				if (obj != NULL)
				{
					Auo_editor(obj, AUO_EDUNSELECT, NULL);
					Auo_editor(obj, AUO_BEGIN, NULL);
					Auo_editor(obj, AUO_EDNOWORD, NULL);
					Auo_editor(obj, AUO_EDFORWARD, NULL);
					Auo_editor(obj, AUO_EDNOCASE, NULL);
					Auo_editor(obj, AUO_EDFIND, in_out);
					Auo_editor(obj, AUO_EDVIEW, NULL);
					Auo_editor(obj, AUO_UPDATE, NULL);
				}
			}
		}
		break;
	
	case AS_LOADFILE:
		if (in_out == NULL)
			break;
		dot = strrchr(in_out, '.');
		if (dot != NULL)
		{
			if (strcmp(dot + 1, "ACS") == 0) /* BUG: must use Ast_icmp */
			{
				WI_GENERAL.create(in_out);
			} else
			{
				win = EDITOR.create(NULL);
				if (win != NULL)
				{
					win->service(win, AS_EDWINDOW, self);
					win->service(win, AS_EDLOADFILE, in_out);
					/* BUG: must use Ast_icmp */
					if (strcmp(dot + 1, "C") == 0 ||
						strcmp(dot + 1, "S") == 0 ||
						!strcmp(dot + 1, "PAS") == 0) /* BUG? */
					{
						for (i = 0; i < MAX_ACS; i++)
						{
							if (cews.w_edit[i] == NULL)
								break;
						}
						if (i < MAX_ACS)
						{
							cews.w_edit[i] = win;
							strcpy(cews.p_edit[i], in_out);
						}
					}
					Awi_show(win);
				}
			}
		}
		break;
	
	case AS_SAVEFILE:
		if (in_out == NULL)
			break;
		Af_2ext(ext, in_out);
		if (ext[0] != '\0')
		{
			for (i = 0; i < MAX_ACS; i++)
			{
				if (strcmp(cews.p_edit[i], in_out) == 0)
					break;
			}
			if (i < MAX_ACS)
			{
				cews.w_edit[i]->service(cews.w_edit[i], AS_EDSAVEIT, NULL);
			} else if (strcmp(ext, "ACS") == 0)
			{
				first = win = Awi_list();
				do
				{
					if (first->info != NULL &&
						Af_2ext(ext, first->info) != NULL &&
						strcmp(ext, "ACS") == 0 &&
						first->name != NULL &&
						strcmp(first->name, _WGTITEL) == 0 &&
						strcmp(first->info + 1, in_out) == 0)
					{
						saveacs(first);
					}
					first = Awi_list();
				} while (first != win && win->wi_id >= 0);
			}
		}
		break;
	
	case AS_EDTERM: /* FIXME: does not make sense, message goes to editor window, not us */
		for (i = 0; i < MAX_ACS; i++)
		{
			if (cews.w_edit[i] == in_out)
			{
				cews.w_cews->service(cews.w_cews, AS_EDTERM, cews.p_edit[i]);
				cews.w_edit[i] = NULL;
				strcpy(cews.p_edit[i], "");
			}
		}
		break;
	
	case AS_EDITCHG:
		switch (self->ob_edit)
		{
		case BASE_HELPACC:
			Aob_gettext(self->work, BASE_HELPACC, helpacc);
			break;
		case BASE_USERNAME:
			Aob_gettext(self->work, BASE_USERNAME, cfg.username);
			break;
		case BASE_USERSERIAL:
			Aob_gettext(self->work, BASE_USERSERIAL, cfg.userserial);
			break;
		case BASE_USERKEY:
			Aob_gettext(self->work, BASE_USERKEY, cfg.userkey);
			break;
		}
		validate();
		break;
		
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static char *live_snap(void *obj, long val)
{
#if WITH_FIXES
	static char buf[8];
#else
	char buf[6];
#endif
	
	switch ((int)val)
	{
	case 0:
		imagesnap = 1;
		break;
	case 1:
		imagesnap = 2;
		break;
	case 2:
		imagesnap = 4;
		break;
	default:
		imagesnap = 8;
		break;
	}
	if (imagesnap == 0)
		imagesnap = 1;
	sprintf(buf, "%d", imagesnap);
	/* BUG: returns address of local var */
	return buf;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static void reg_kind(void)
{
	OBJECT *tree;
	Axywh pos;
	const char *const regkind[] = { rkind0, rkind1, rkind2 }; /* FIXME: make static */
	int16 idx;
	int16 sel;
	
	if ((tree = Aob_create(&P_REGISTER.root)) == NULL)
		return;
	Aob_offset(&pos, ACSblk->ev_window->work, D_REGISTER_REGKIND);
	pos.x += ACSblk->ev_window->wi_work.x;
	pos.y += ACSblk->ev_window->wi_work.y;
	idx = (int)(long)ACSblk->ev_window->user;
	tree[idx + 1].ob_state |= OS_CHECKED;
	sel = Ame_popup(ACSblk->ev_window, tree, pos.x, pos.y);
	if (sel > 0)
	{
		ACSblk->ev_window->user = (void *)(long)(sel - 1);
		Aob_puttext(ACSblk->ev_object, D_REGISTER_REGKIND, regkind[sel - 1]);
		ACSblk->ev_window->obchange(ACSblk->ev_window, D_REGISTER_REGKIND, -1);
	}
	Aob_delete(tree);
}

/* -------------------------------------------------------------------------- */

static void outreg(long fd, const char *const *strings)
{
	char buf[256];
	
	while (*strings != NULL)
	{
		Fwrite((int)fd, sprintf(buf, "%s\r\n", *strings), buf);
		strings++;
	}
}

/* -------------------------------------------------------------------------- */

static void reg_me(void)
{
	char *name;
	char *street;
	char *town;
	char *country;
	char *email;
	char filename[__PS__];
	char buf[256];
	long fd;
	
	Auo_boxed(&ACSblk->ev_object[16], AUO_GETVAL, &name);
	Auo_boxed(&ACSblk->ev_object[17], AUO_GETVAL, &street);
	Auo_boxed(&ACSblk->ev_object[18], AUO_GETVAL, &town);
	Auo_boxed(&ACSblk->ev_object[19], AUO_GETVAL, &country);
	Auo_boxed(&ACSblk->ev_object[20], AUO_GETVAL, &email);
	strcat(strcpy(filename, ACSblk->apppath), "register.txt");
	if (name[0] != '\0' && street[0] != '\0' && town[0] != '\0' && country[0] != '\0' &&
		Af_select("Textname", filename, "txt") != NULL &&
		(fd = Fcreate(filename, 0)) > 0)
	{
		outreg(fd, regstart);
		switch ((int)(long)ACSblk->ev_window->user)
		{
		case 0:
			outreg(fd, regscheck);
			break;
		case 1:
			outreg(fd, regkonto);
			break;
		case 2:
			if (ACSblk->ev_object[D_REGISTER_INSIDE_GERMANY].ob_state & OS_SELECTED)
				outreg(fd, reginn);
			else
				outreg(fd, regonn);
			/* break; FIXME: missing */
		}
		if (email[0] != '\0')
			outreg(fd, regmail);
		outreg(fd, regend);
		Fseek(0, (int)fd, SEEK_SET);
		Fseek(166, (int)fd, SEEK_CUR); /* WTF: hardcoded offset of version field */
		Fwrite((int)fd, sprintf(buf, "%s.%s.%s", __STRINGIFY(ACS_VERSION_MAJOR), __STRINGIFY(ACS_VERSION_MINOR), __STRINGIFY(ACS_VERSION_MICRO)), buf);
		Fseek(36, (int)fd, SEEK_CUR);
		Fwrite((int)fd, sprintf(buf, "%-60s\r\n", name), buf);
		Fseek(9, (int)fd, SEEK_CUR);
		Fwrite((int)fd, sprintf(buf, "%-60s\r\n", street), buf);
		Fseek(9, (int)fd, SEEK_CUR);
		Fwrite((int)fd, sprintf(buf, "%-60s\r\n", town), buf);
		Fseek(9, (int)fd, SEEK_CUR);
		Fwrite((int)fd, sprintf(buf, "%-60s\r\n", country), buf);
		Fseek(9, (int)fd, SEEK_CUR);
		if (email[0] != '\0')
			Fwrite((int)fd, sprintf(buf, "%-60s\r\n", email), buf);
		else
			Fwrite((int)fd, sprintf(buf, "%-60s\r\n", ""), buf);
		Fclose((int)fd);
	}
}

/* -------------------------------------------------------------------------- */

void acs_register(void)
{
	Awindow *win;
	
	win = WI_REGISTER.create(&WI_REGISTER);
	if (win != NULL)
	{
		Aob_puttext(win->work, D_REGISTER_REGKIND, rkind0);
		Awi_dialog(win);
		Awi_delete(win);
	}
}

/* -------------------------------------------------------------------------- */

#if !KILLDEMO
static void demoabout(void)
{
	if (wdemo != NULL)
	{
		Awi_open(wdemo);
	} else
	{
		Awi_alert(1, A_DEMO);
	}
}
#endif

/* -------------------------------------------------------------------------- */

static void installdemo(void)
{
#if !KILLDEMO
	if (runasdemo)
	{
		stepper = 0;
		ACSblk->ACSaboutme = demoabout;
		if (ACSblk->ev_mtcount > 500)
			ACSblk->ev_mtcount = 500;
	} else
#endif
	{
		if (wdemo != NULL && wdemo->wi_id > 0)
			wdemo->service(wdemo, AS_TERM, NULL);
		if (oldabout)
			ACSblk->ACSaboutme = oldabout;
	}
}

/* -------------------------------------------------------------------------- */

static short crc16(const char *str);

static void ComputeKey(
	short d0,
	const char *platform,
	short d1,
	const char *program,
	const char *version_major,
	const char *version_minor,
	const char *version_micro,
	const char *username,
	const char *userserial,
	char *key)
{
	long major;
	long minor;
	long micro;
	long val;
	long keyval;
	char buf[4096];
	int i;
	int c;
	
	major = atoi(version_major);
	minor = atoi(version_minor);
	micro = atoi(version_micro);
	strcpy(buf, "Plattform: ");
	strcat(buf, platform);
	strcat(buf, " Programm: ");
	strcat(buf, program);
	strcat(buf, " Version ");
	strcat(buf, version_major);
	strcat(buf, ".");
	strcat(buf, version_minor);
	strcat(buf, version_micro);
	strcat(buf, " Seriennummer: ");
	strcat(buf, userserial);
	strcat(buf, " UserName: ");
	strcat(buf, username);
	val = ((long)d0 << 28) | ((long)d1 << 24) | (major << 16) | (minor << 8) | micro;
	keyval = 
		~((long)crc16(buf) << 16) ^
		crc16(username) ^
		crc16(userserial) ^
		~(long)crc16(platform) ^
		~(long)crc16(program) ^
		crc16(version_major) ^
		crc16(version_minor) ^
		crc16(version_micro) ^
		val;
	strcpy(key, "          ");
	for (i = 0; i < 32; i += 3)
	{
		c = (unsigned short)((keyval >> i) & 0xffffu) % 26u;
		key[i / 3] = c > 25 ? c + ('0' - 26) : c + 'A';
	}
	key[10] = '\0';
}

/* -------------------------------------------------------------------------- */

static short crc16(const char *str)
{
	unsigned char poly;
	unsigned short c;
	unsigned short crc;
	int len;
	
	crc = 0xffff;
	for (len = (int)strlen(str); len-- != 0; )
	{
		for (poly = 0, c = *str++ & 0xff; poly < 8; poly++, c >>= 1)
		{
			if (((crc & 1) ^ (c & 1)) != 0)
				crc = (crc >> 1) ^ 0x8408;
			else
				crc >>= 1;
		}
	}
	
	crc = ~crc;
	c = crc;
	crc = (crc << 8) | ((c >> 8) & 0xff);
	return crc;
}

/* -------------------------------------------------------------------------- */

static void validate(void)
{
	char key[11];
	
	if (wdemo == NULL)
	{
		if ((wdemo = WI_DEMO.create(&WI_DEMO)) != NULL)
		{
			oldabout = ACSblk->ACSaboutme;
			timer0 = timer1 = Ash_gettimer();
		}
	}
#if KILLDEMO
	runasdemo = FALSE;
#else
	runasdemo = TRUE;
#endif
	if (cfg.username[0] != '\0')
	{
		if (strncmp(cfg.userserial, "00121", 5) == 0)
		{
			ComputeKey(0, "Atari ST", 0, "ACSpro", __STRINGIFY(ACS_VERSION_MAJOR), __STRINGIFY(ACS_VERSION_MINOR), "x", cfg.username, cfg.userserial, key);
			if (Ast_cmp(cfg.userkey, key) == 0)
				runasdemo = FALSE;
		}
	}
	installdemo();
}

/* -------------------------------------------------------------------------- */

static int16 demo_init(Awindow *self)
{
	self->state |= AWS_LATEUPDATE;
	if (self->wi_id > 0)
	{
		timer1 = Ash_gettimer();
		if (timer1 - timer0 >= 50)
		{
			timer0 = timer1;
			stepper += 4;
			self->redraw(self, &self->wi_act);
		}
	} else
	{
		timer0 = timer1 = 0;
	}
	return OK;
}

/* -------------------------------------------------------------------------- */

static boolean demo_serv(Awindow *self, int16 task, void *in_out)
{
	switch (task)
	{
	case AS_TERM:
		if (ACSblk->appexit)
		{
			Awi_delete(self);
		} else
		{
			self->state |= AWS_TERM;
			Awi_closed(self);
			self->state &= ~AWS_TERM;
		}
		break;
	default:
		return Awi_service(self, task, in_out);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static boolean ScrollServ(OBJECT *entry, int16 task, void *in_out)
{
	int16 i;
	int16 id;
	char fontname[34];
	
	switch (task)
	{
	case AS_ACCLOSED:
		for (i = 1; i <= ACSblk->fonts; i++)
		{
			id = vqt_name(ACSblk->vdi_handle, i, fontname);
			if (fontname[32] != 0)
			{
				if (strstr(strupr(fontname), "TIMES") != NULL ||
					strstr(fontname, "DUTCH") != NULL)
				{
					entry->ob_spec.auserblk->ub_parm = ((long)id << 16) | 11;
					break;
				}
			}
		}
		if (i > ACSblk->fonts)
		{
			entry->ob_spec.auserblk->ub_parm = ((long)ACSblk->fontsid << 16) | ACSblk->fsheight;
		}
		break;
	
	case AS_TERM:
		break;
	
	default:
		return FALSE;
	}
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

static int16 CDECL ScrollDemo(PARMBLK *pb)
{
	int16 pxy[8];
	int16 cell_width;
	int16 cell_height;
	int16 dummy;
	int i;
	int16 x;
	int16 y;
	OBJECT *obj;
	
	pxy[0] = (pxy[4] = pb->pb_x) + (ACSblk->gl_wbox >> 1);
	pxy[1] = (pxy[5] = pb->pb_y) + (ACSblk->gl_hbox >> 1);
	pxy[2] = (pxy[6] = pb->pb_x + pb->pb_w - 1) - (ACSblk->gl_wbox >> 1);
	pxy[3] = (pxy[7] = pb->pb_y + pb->pb_h - 1) - (ACSblk->gl_hbox >> 1);
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		pxy[4] = pb->pb_xc;
		pxy[5] = pb->pb_yc;
		pxy[6] = pb->pb_xc + pb->pb_wc - 1;
		pxy[7] = pb->pb_yc + pb->pb_hc - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, &pxy[4]);
	}
	vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
	if (ACSblk->nplanes >= 4)
		vsf_color(ACSblk->vdi_handle, G_LWHITE);
	else
		vsf_color(ACSblk->vdi_handle, G_WHITE);
	vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
	v_bar(ACSblk->vdi_handle, &pxy[4]);
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		if (pb->pb_xc > pxy[0])
			pxy[0] = pb->pb_xc;
		if (pb->pb_yc > pxy[1])
			pxy[1] = pb->pb_yc;
		if (pb->pb_xc + pb->pb_wc - 1 < pxy[2])
			pxy[2] = pb->pb_xc + pb->pb_wc - 1;
		if (pb->pb_yc + pb->pb_hc - 1 < pxy[3])
			pxy[3] = pb->pb_yc + pb->pb_hc - 1;
	}
	vs_clip(ACSblk->vdi_handle, 1, pxy);
	obj = &pb->pb_tree[pb->pb_obj];
	vswr_mode(ACSblk->vdi_handle, MD_TRANS);
	vst_color(ACSblk->vdi_handle, G_BLACK);
	vst_font(ACSblk->vdi_handle, (short)((obj->ob_spec.auserblk->ub_parm) >> 16) & 0xffff);
	cell_height = (short)obj->ob_spec.auserblk->ub_parm & (short)0xffff;
	vst_height(ACSblk->vdi_handle, cell_height, &dummy, &dummy, &cell_width, &cell_height);
	vst_alignment(ACSblk->vdi_handle, TA_CENTER, TA_TOP, &dummy, &dummy);
	x = (pb->pb_w >> 1) + pb->pb_x;
	if (stepper > cell_height * NUM_DEMO_TEXT + pb->pb_h)
		stepper = 0;
	y = (pb->pb_y + pb->pb_h) - ACSblk->gl_hbox - (int16)stepper;
	for (i = 0; i < NUM_DEMO_TEXT; i++)
	{
		y += cell_height + 2;
		if (y > pb->pb_y && y + cell_height < pb->pb_y + pb->pb_h)
		{
			if (demotext[i][0] == '*')
			{
				if (ACSblk->nplanes >= 4)
					vst_color(ACSblk->vdi_handle, G_RED);
				else
					vst_effects(ACSblk->vdi_handle, TF_THICKENED);
				v_gtext(ACSblk->vdi_handle, x, y, demotext[i] + 1);
			} else
			{
				vst_color(ACSblk->vdi_handle, G_BLACK);
				vst_effects(ACSblk->vdi_handle, TF_NORMAL);
				v_gtext(ACSblk->vdi_handle, x, y, demotext[i]);
			}
		}
	}
	vs_clip(ACSblk->vdi_handle, 0, pxy);
	return 0;
}
