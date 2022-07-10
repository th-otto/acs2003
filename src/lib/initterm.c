#include "acs_i.h"
#include <ctype.h>
#include "messages/msgserv.h"

static int ProtInit = 0;
static int VdiInit = 0;
static int AesInit = 0;
static boolean aes_open = FALSE;
static int16 work_in[11] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2 };


static int16 InitAES(int16 *wchar, int16 *hchar);
static int16 InitVDI(int16 *wchar, int16 *hchar);
static int16 InitMagiC(void);
static int16 InitNAES(void);
static int16 InitScrap(void);
static int16 InitPaths(void);
static int16 InitCfg(void);
static int16 InitProtocol(void);
static void TermProtocol(void);
static void TermVDI(void);
static void TermAES(void);

#define NKI_NO200HZ  0x00000004UL

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 ACSinitialize(void)
{
	int16 ok;
	int16 wchar;
	int16 hchar;
	char *ptr;
	
	if (INmemory() == FAIL)
		return FAIL;
	if (InitAES(&wchar, &hchar) != OK)
		return FAIL;
	nkc_init(NKI_NO200HZ, 0, NULL); /* FIXME: does nothing in this implementation */
	if (InitVDI(&wchar, &hchar) != OK)
		return FAIL;
	if (InitMagiC() != OK || InitNAES() != OK)
		return FAIL;
	ACSblk->application = _app;
	ACSblk->multitask = ACSblk->AESglobal[1] != 1;
	ACSblk->menu_id = -1;
	if (INmouse() == FAIL)
		return FAIL;
	Amo_busy();
	if (INuserobj() == FAIL)
		return FAIL;
	if (InitScrap() != OK)
		return FAIL;
	if (((ptr = Ash_getenv("FS")) != NULL && *ptr != '\0') ||
		((ptr = Ash_getenv("IFS")) != NULL && *ptr != '\0'))
	{
		/*
		 * FIXME: that is nonsense; FS/IFS does not have
		 * anything to do with word separators
		 */
		strcpy(ACSblk->separator, ptr);
	}
	Pdomain(1);
	if (InitPaths() != OK)
		return FAIL;
	if (ACSblk->ACSinit0() != OK)
		return FAIL;
	InitCfg();
	if (INMsgService() != OK)
		return FAIL;
	if (InitProtocol() != OK)
		return FAIL;
	if (INwindow() == FAIL)
		return FAIL;
	ACSblk->ev_window = Awi_root();
	ok = ACSconfig.ACSinit();
	Amo_point();
	Amo_unbusy();
	Awi_update(END_UPDATE);
	
	return ok;
}

/* -------------------------------------------------------------------------- */

void ACSterminate(void)
{
	if (!aes_open)
		return;
	TRwindow();
	TRuserobj();
	TRmouse();
	Awi_update(END_UPDATE);
	TermProtocol();
	TRMsgService();
	nkc_exit();
	TermVDI();
	TermAES();
	if (ACSblk->cfg)
		Acfg_delete(ACSblk->cfg);
	TRmemory();
}

/* -------------------------------------------------------------------------- */

/*
 * return boot drive from system variables
 */
static long _acs_boot(void)
{
	return *((short *)0x446);
}

/* -------------------------------------------------------------------------- */

static int16 InitCfg(void)
{
	if (Ast_isEmpty(ACSconfig.CfgInfo.dateiname))
	{
		ACSconfig.CfgInfo.dateiname = Af_cfgfile(&ACSblk->basename[2]);
	}
	if (ACSblk->cfg == NULL)
		ACSblk->cfg = Acfg_create(&ACSconfig.CfgInfo, TRUE);
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 InitAES(int16 *wchar, int16 *hchar)
{
	if (AesInit++ != 0)
		return OK;
	ACSblk->gl_apid = appl_init();
	if (ACSblk->gl_apid < 0)
		return FAIL;
	ACSblk->phys_handle = graf_handle(wchar, hchar, &ACSblk->gl_wattr, &ACSblk->gl_hattr);
	ACSblk->vdi_handle = ACSblk->phys_handle;
	wind_get(0, WF_WORKXYWH, &ACSblk->desk.x, &ACSblk->desk.y, &ACSblk->desk.w, &ACSblk->desk.h);
	/* FIXME: also check appl_getinfo */
	/* BUG: _ACSv_magix & NAesCookie are not yet set */
	if (ACSblk->AESglobal[0] >= 0x400 || _ACSv_magix >= 0x300 || ACSblk->NAesCookie != NULL)
	{
		/* we understand AP_TERM */
		shel_write(SWM_NEWMSG, 1, 0, NULL, NULL);
	}
	aes_open = TRUE;
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 InitVDI(int16 *wchar, int16 *hchar)
{
	int16 work_out[57];
	int16 dummy;
	boolean gdos;
	
	static TEDINFO dum_ted = { " ", "", "", 3, 0, 0, 0, 0, 0, 2, 1 };
#if WITH_FIXES
	static OBJECT dum_ob = { -1, -1, -1, G_TEXT, OF_LASTOB, 0, C_UNION(&dum_ted), 0, 0, 0, 0 };
#else
	static OBJECT dum_ob = { 0, -1, -1, G_TEXT, OF_LASTOB, 0, C_UNION(&dum_ted), 0, 0, 0, 0 };
#endif

	gdos = FALSE;
	if (VdiInit++ != 0)
		return OK;
	ACSblk->vdi_handle = ACSblk->phys_handle;
	v_opnvwk(work_in, &ACSblk->vdi_handle, work_out);
	/* BUG: no check here whether call failed */
	Awi_update(BEG_UPDATE);
	ACSblk->fonts = work_out[10];
	ACSblk->ncolors = work_out[13];
	vq_extnd(ACSblk->vdi_handle, 1, work_out);
	ACSblk->nplanes = work_out[4];
	if (ACSblk->nplanes < 4)
		ACSblk->dither = 0x41;
	if (ACSblk->AESglobal[0] < 0x400 ||
		appl_getinfo(AES_LARGEFONT, &ACSblk->fheight, &ACSblk->fontid, &dummy, &dummy) == 0 ||
		appl_getinfo(AES_SMALLFONT, &ACSblk->fsheight, &ACSblk->fontsid, &dummy, &dummy) == 0)
	{
		dum_ob.ob_width = *wchar;
		dum_ob.ob_height = *hchar;
		dum_ted.te_font = IBM;
		objc_draw(&dum_ob, ROOT, 1, 0, 0, 0, 0);
		vqt_attributes(ACSblk->phys_handle, work_out);
		ACSblk->fontid = work_out[0];
		ACSblk->fheight = work_out[7];
		dum_ted.te_font = SMALL;
		objc_draw(&dum_ob, ROOT, 1, 0, 0, 0, 0);
		vqt_attributes(ACSblk->phys_handle, work_out);
		ACSblk->fontsid = work_out[0];
		ACSblk->fsheight = work_out[7];
	}
	gdos = FALSE;
	if (ACSblk->description->flags & AB_GDOSFONT)
	{
		if (vq_gdos())
		{
			ACSblk->fonts += vst_load_fonts(ACSblk->vdi_handle, 0);
			gdos = TRUE;
		}
	}
	if (!gdos)
	{
		if (ACSblk->fontsid != vst_font(ACSblk->vdi_handle, ACSblk->fontsid) && vq_gdos())
		{
			ACSblk->fonts += vst_load_fonts(ACSblk->vdi_handle, 0);
			gdos = TRUE;
		}
	}
	if (!gdos)
	{
		if (ACSblk->fontid != vst_font(ACSblk->vdi_handle, ACSblk->fontid) && vq_gdos())
		{
			ACSblk->fonts += vst_load_fonts(ACSblk->vdi_handle, 0);
			gdos = TRUE;
		}
	}
	vst_font(ACSblk->vdi_handle, ACSblk->fontid);
	vst_height(ACSblk->vdi_handle, ACSblk->fheight, &ACSblk->gl_wchar, &ACSblk->gl_hchar, &ACSblk->gl_wbox, &ACSblk->gl_hbox);
	ACSblk->description->dx = ACSblk->description->dx * ACSblk->gl_wbox;
	ACSblk->description->dy = ACSblk->description->dy * ACSblk->gl_hbox;
	
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 InitMagiC(void)
{
	if (Ash_getcookie(C_MagX, &ACSblk->MagiCCookie))
	{
		_ACSv_magix = ACSblk->MagiCCookie->aesvars->version;
	} else
	{
		_ACSv_magix = -1;
		ACSblk->MagiCCookie = NULL;
	}
	if (_ACSv_magix >= 0x300)
		ACSblk->description->flags |= AB_NOTRANSICON;
	else
		ACSblk->description->flags &= ~AB_NOTRANSICON;
	ACSblk->description->flags |= AB_SMARTREDRAW;
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 InitNAES(void)
{
	if (!Ash_getcookie(C_nAES, &ACSblk->NAesCookie))
		ACSblk->NAesCookie = NULL;
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 InitPaths(void)
{
	int16 dummy;
	int16 kstate;
	char *ptr;
	
	if (ACSblk->application)
	{
		if (shel_read(ACSblk->appname, ACSblk->apppara) == 0)
			return FAIL;
		if (ACSblk->apppara[0] != '\0')
		{
			ACSblk->apppara[ACSblk->apppara[0] + 1] = '\0';
#ifdef __GNUC__
			memmove(ACSblk->apppara, ACSblk->apppara + 1, strlen(ACSblk->apppara + 1) + 1);
#else
			strcpy(ACSblk->apppara, ACSblk->apppara + 1);
#endif
		} else if (ACSblk->argc > 1 && ACSblk->argv[1][0] != '\0')
		{
			strcpy(ACSblk->apppara, ACSblk->argv[1]);
		}
		ptr = strrchr(ACSblk->apppara, '/');
		if (ptr != NULL)
		{
			strcpy(ACSblk->appfrom, ptr + 1); /* WTF? */
			*ptr = '\0';
		} else
		{
			ACSblk->appfrom[0] = '\0';
		}
		strcpy(ACSblk->apppath, ACSblk->appname);
		ptr = strrchr(ACSblk->apppath, PATH_SEP);
		if (ptr == NULL)
		{
			if (ACSblk->apppath[0] != '\0' && ACSblk->apppath[1] == ':')
			{
				strcpy(&ACSblk->basename[2], &ACSblk->apppath[2]);
				ACSblk->apppath[2] = '\0';
			} else
			{
				strcpy(&ACSblk->basename[2], ACSblk->apppath);
				strcpy(ACSblk->apppath, "\\");
			}
		} else
		{
			++ptr;
			strcpy(&ACSblk->basename[2], ptr);
			*ptr = '\0';
		}
		ptr = strrchr(ACSblk->basename, '.');
		if (ptr != NULL)
			*ptr = '\0';
	} else
	{
		ACSblk->apppara[0] =
		ACSblk->apppath[0] =
		ACSblk->appname[0] =
		ACSblk->appfrom[0] =
		ACSblk->basename[0] = '\0';
	}
	
	if (ACSblk->description->acc_reg[0] == '\0')
		strcpy(ACSblk->description->acc_reg, "  ACS-Acc");
	
	if (ACSblk->AESglobal[0] >= 0x400 || _ACSv_magix >= 0x300 || !ACSblk->application)
	{
		ACSblk->menu_id = menu_register(ACSblk->gl_apid, ACSblk->description->acc_reg);
		graf_mkstate(&dummy, &dummy, &dummy, &kstate);
		if (!ACSblk->application && kstate != 0)
		{
			strncpy(_ALIB_ERR_ACC + 30, ACSblk->description->acc_reg, min(15, strlen(ACSblk->description->acc_reg)));
			dummy = form_alert(1, _ALIB_ERR_ACC);
			if (dummy != 1)
				return FAIL;
		}
	}
	
	ACSblk->cfg_path[0] = '\0';
	if ((ptr = Ash_getenv("HOME")) != NULL ||
		(ptr = Ash_getenv("TMPDIR")) != NULL ||
		(ptr = Ash_getenv("TMP")) != NULL)
	{
		strcpy(ACSblk->cfg_path, ptr);
		ptr = strrchr(ACSblk->cfg_path, PATH_SEP);
		if (ptr != NULL && ptr[1] == '\0')
			*ptr = '\0';
		if (toupper(ACSblk->cfg_path[0]) < 'C' || Af_length(ACSblk->cfg_path) != -1)
			ACSblk->cfg_path[0] = '\0';
		else
			strcat(ACSblk->cfg_path, "\\");
	}
	
	if (ACSblk->cfg_path[0] == '\0')
		strcpy(ACSblk->cfg_path, ACSblk->apppath);
	if (ACSblk->cfg_path[0] == '\0')
	{
		strcpy(ACSblk->cfg_path, "A:\\");
		if (Dsetdrv(Dgetdrv()) & 4)
			ACSblk->cfg_path[0] = 'C';
	}
	
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 InitProtocol(void)
{
	char *basename;
	
	if (ProtInit++ != 0)
		return OK;
	ListOfApps = Alu_create();
	if (ListOfApps == NULL)
#if WITH_FIXES
		return FAIL;
#else
		return OK;
#endif
	ListOfApps->freeElem = (void (*)(void *))Aev_DDRemove; /* FIXME: ugly cast */
	SentMsg = Alu_create();
	if (SentMsg == NULL)
	{
		Alu_delete(ListOfApps);
#if WITH_FIXES
		return FAIL;
#else
		return OK;
#endif
	}
	
	basename = &ACSblk->basename[2];
	if (!ACSblk->application || basename[0] == '\0')
		basename = &ACSblk->description->acc_reg[2];

	ACSblk->dd_name = Ax_glmalloc(10);
	
	if (ACSblk->dd_name != NULL)
	{
		strcpy(ACSblk->dd_name, "        \0");
		Ast_toupper(strncpy(ACSblk->dd_name, basename, min(strlen(basename), 8)));
	}
	
	ACSblk->AppLongName = Ax_glmalloc(51);
	if (ACSblk->AppLongName != NULL)
		strcpy(ACSblk->AppLongName, ACSblk->dd_name); /* BUG: dd_name can be null */
	
	if (ACSblk->AppLongName != NULL)
	{
		Aev_InitXAcc();
		Aev_InitGEMScript();
	}
	if (ACSblk->dd_name != NULL)
	{
		Aev_InitVA();
		Aev_InitDD();
		Aev_InitBubble();
		Aev_InitOlga();
		Aev_InitSTGuide();
		Aev_InitSE();
		Aev_InitPCHelp();
		Aev_InitSSP();
		Aev_InitDHST();
	}
	
	return OK;
}

/* -------------------------------------------------------------------------- */

static int16 InitScrap(void)
{
	long err;
	ssize_t len;
	char *ptr;
	
	scrp_read(ACSblk->scrp_path);
	if (ACSblk->scrp_path[0] == '\0')
	{
		if ((ptr = Ash_getenv("CLIPBOARD")) != NULL ||
			(ptr = Ash_getenv("CLIPBRD")) != NULL ||
			(ptr = Ash_getenv("SCRAPDIR")) != NULL)
		{
			strcpy(ACSblk->scrp_path, ptr);
		} else
		{
			strcpy(ACSblk->scrp_path, "X:\\clipbrd");
			ACSblk->scrp_path[0] = (char)Supexec(_acs_boot) + 'A';
		}
	}
	
	if (toupper(ACSblk->scrp_path[0]) >= 'C' &&
		(len = strlen(ACSblk->scrp_path)) > 0)
	{
		--len;
		if (ACSblk->scrp_path[len] == PATH_SEP)
			ACSblk->scrp_path[len] = '\0';
		err = Dcreate(ACSblk->scrp_path);
		strcat(ACSblk->scrp_path, "\\");
		if (err >= 0 || err == EACCDN)
			scrp_write(ACSblk->scrp_path);
	} else
	{
		scrp_write("");
	}
	
	return OK;
}

/* -------------------------------------------------------------------------- */

static void TermProtocol(void)
{
	if (--ProtInit != 0)
		return;
	Alu_delete(ListOfApps);
	Alu_delete(SentMsg);
	Aev_ExitDHST();
	Aev_ExitSSP();
	Aev_ExitPCHelp();
	Aev_ExitSE();
	Aev_ExitSTGuide();
	Aev_ExitOlga();
	Aev_ExitGEMScript();
	Aev_ExitBubble();
	Aev_ExitDD();
	Aev_ExitVA();
	Aev_ExitXAcc();
	if (ACSblk->AppLongName)
		Ax_glfree(ACSblk->AppLongName);
	if (ACSblk->dd_name)
		Ax_glfree(ACSblk->dd_name);
}

/* -------------------------------------------------------------------------- */

static void TermVDI(void)
{
	if (--VdiInit != 0)
		return;
	if ((ACSblk->description->flags & AB_GDOSFONT) && vq_gdos())
		vst_unload_fonts(ACSblk->vdi_handle, 0);
	v_clsvwk(ACSblk->vdi_handle);
}

/* -------------------------------------------------------------------------- */

static void TermAES(void)
{
	int16 dummy;
	int16 msg[16];
	
	if (--AesInit != 0)
		return;
	if (ACSblk->application)
	{
		appl_exit();
	} else
	{
		ACSblk->description->acc_reg[0] = '\005';
		while (TRUE)
		{
			evnt_multi(MU_MESAG | MU_TIMER,
				0, 0, 0,
				0, 0, 0, 0, 0,
				0, 0, 0, 0, 0,
				msg,
				32767, 32767,
				&dummy, &dummy, &dummy, &dummy, &dummy, &dummy);
		}
	}
}
