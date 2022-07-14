#include <string.h>
#include "acs.h"
#include "acsplus.h"

#ifndef UNUSED
# define UNUSED(x) ((void)(x))
#endif

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static boolean proto_service(Awindow *self, int16 task, void *in_out)
{
	boolean ret;
	
	if (task == AS_TERM)
	{
		ret = PROTOCOL.service(self, AS_TERM, self);
		ACSmoduleterm();
		return ret;
	}
	return PROTOCOL.service(self, task, in_out);
}

/* -------------------------------------------------------------------------- */

static long get_syshdr(void)
{
	return *((long *)0x4f2);
}

/* -------------------------------------------------------------------------- */

int16 ACSinit(void)
{
	Awindow *win;
	char path[256];
	SYSHDR *syshdr;
	MAGX_COOKIE *magiccookie;
	
	int16 i;
	char **env;
	char *envptr;
	A_dd *dd;
	
	syshdr = (SYSHDR *)Supexec(get_syshdr);
	PROTOCOL.name = " ACSblk Vars ";
	
	win = PROTOCOL.create(NULL);
	if (win == NULL)
		return FAIL;
	win->service = proto_service;
	
	wprintf(win, "ap_version: $%04x\n", ACSblk->AESglobal[0]);
	wprintf(win, "ap_count:   %4d\n", ACSblk->AESglobal[1]);
	wprintf(win, "gl_apid:    %4d\n", ACSblk->gl_apid);
	wprintf(win, "nplanes:    %4d\n", ACSblk->nplanes);
	wprintf(win, "ncolors:    %4d\n", ACSblk->ncolors);
	wprintf(win, "phys_handle:%4d\n", ACSblk->phys_handle);
	wprintf(win, "vdi_handle: %4d\n", ACSblk->vdi_handle);
	wprintf(win, "gl_wattr:   %4d\n", ACSblk->gl_wattr);
	wprintf(win, "gl_hattr:   %4d\n", ACSblk->gl_hattr);
	wprintf(win, "gl_wbox:    %4d\n", ACSblk->gl_wbox);
	wprintf(win, "gl_hbox:    %4d\n", ACSblk->gl_hbox);
	wprintf(win, "gl_wchar:   %4d\n", ACSblk->gl_wchar);
	wprintf(win, "gl_hchar:   %4d\n", ACSblk->gl_hchar);
	wprintf(win, "desk. x:    %4d\n", ACSblk->desk.x);
	wprintf(win, "desk. y:    %4d\n", ACSblk->desk.y);
	wprintf(win, "desk. w:    %4d\n", ACSblk->desk.w);
	wprintf(win, "desk. h:    %4d\n", ACSblk->desk.h);
	wprintf(win, "appname:    '%s'\n", ACSblk->appname);
	wprintf(win, "apppath:    '%s'\n", ACSblk->apppath);
	wprintf(win, "apppara:    '%s'\n", ACSblk->apppara);
	wprintf(win, "appfrom:    '%s'\n", ACSblk->appfrom);
	wprintf(win, "basename:   '%s'\n", ACSblk->basename);
	wprintf(win, "ev_mtcount:  %4ld\n", (long)ACSblk->ev_mtcount);
	wprintf(win, "application: %4d\n", ACSblk->application);
	wprintf(win, "multitask:   %4d\n", ACSblk->multitask);
	wprintf(win, "fonts:       %4d\n", ACSblk->fonts);
	wprintf(win, "argc:        %4d\n", ACSblk->argc);
	for (i = 0; i < ACSblk->argc; i++)
		wprintf(win, "argv [%d]:  '%s'\n", i, ACSblk->argv[i]);
	env = ACSblk->env;
	if (env != NULL)
	{
		while (*env != NULL)
		{
			wprintf(win, "env:       '%s'\n", *env);
			env++;
		}
	}
	if ((envptr = Ash_getenv("HOME")) != NULL)
		wprintf(win, "Home-Dir: %s\n", envptr);
	if ((envptr = Ash_getenv("AVSERVER")) != NULL)
		wprintf(win, "AV-Server: %s\n", envptr);
	wprintf(win, "fontid:      %4d\n", ACSblk->fontid);
	wprintf(win, "fheight:     %4d\n", ACSblk->fheight);
	wprintf(win, "fontsid:     %4d\n", ACSblk->fontsid);
	wprintf(win, "fsheight:    %4d\n", ACSblk->fsheight);
	wprintf(win, "dither:      $%04x\n", ACSblk->dither);
	wprintf(win, "CFG-Path:    '%s'\n", ACSblk->cfg_path);
	wprintf(win, "Scrap-Path:  '%s'\n", ACSblk->scrp_path);
	wprintf(win, "Menu-ID:     %4d\n", ACSblk->menu_id);
	wprintf(win, "eigener DD-Name:     '%s'\n", ACSblk->dd_name);
	dd = NULL;
	wprintf(win, "D&D-Partner:\n");
	while ((dd = Ash_nextdd(dd)) != NULL)
	{
		wprintf(win, "----------------------------------------\n");
		if (dd->type & DD_XACC)
			wprintf(win, "  DD-XACC-Name:'%s'\n", dd->xacc_name);
		if (dd->type & DD_VA)
			wprintf(win, "  DD-VA-Name:  '%s'\n", dd->va_name);
		wprintf(win, "  DD-Id:       %4d\n", dd->id);
	}
	wprintf(win, "----------------------------------------\n");
	if (Ash_getcookie(C_MagX, &magiccookie))
	{
		wprintf(win, "MagiC:\nVersion 0x%X\n", magiccookie->aesvars->version);
		wprintf(win, "Magisch :%ld\n", (long)magiccookie->aesvars->magic);
		wprintf(win, "Release :%d\n", magiccookie->aesvars->release);
	} else
	{
		wprintf(win, "kein MagiC\n");
	}
	if (ACSblk->description->flags & AB_LAZYEVAL)
		wprintf(win, "AB_DEBUG\n");
	if (ACSblk->description->flags & AB_NOTRANSICON)
		wprintf(win, "AB_NOTRANSICON\n");
	wprintf(win, "Sonstige Werte:\n");
	wprintf(win, "Version:     '$%04x'\n", Sversion());
	wprintf(win, "OS Version:  '$%04x'\n", syshdr->os_version);
	Dgetpath(path, 0);
	wprintf(win, "Akt Dir:     '%s'\n", path);
	wprintf(win, "Akt Drive:   '%c'\n", Dgetdrv() + 'A');
	if (ACSblk->application)
		win->open(win);

	return OK;
}
