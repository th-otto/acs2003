/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Drag&Drop protocol                                    */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#define __USE_MINT_SIGNAL
#include "acs_i.h"
#include "msgserv.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_InitDD(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitDD(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean Aev_ddabort(int fd, int32 oldhandler)
{
	Psignal(SIGPIPE, (void *)oldhandler);
	Fclose(fd);
	Awi_update(BEG_UPDATE);
	return FALSE;
}

/* -------------------------------------------------------------------------- */

static int GetDDTypes(int fh, char *exts)
{
	int retcode = DD_NAK;
	int32 rfds;
	char ans;
	
	retcode = DD_NAK;
	rfds = 1L << fh; /* FIXME: check for fh < 32 */
	if (Fselect(3000, &rfds, NULL, NULL) != 0 &&
		rfds != 0 &&
		Fread(fh, sizeof(ans), &ans) == sizeof(ans) &&
		ans == DD_OK &&
		Fread(fh, 32, exts) == 32)
	{
		retcode = DD_OK;
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

static int SendDDHeader(int fh, int16 headlen, const char *header)
{
	int retcode = DD_NAK;
	char ans;
	
	if (Fwrite(fh, sizeof(headlen), &headlen) == sizeof(headlen) &&
		Fwrite(fh, headlen, header) == headlen)
	{
		evnt_timer(10, 0);
		if (Fread(fh, sizeof(ans), &ans) == sizeof(ans))
			retcode = ans;
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

static long CreateDDPipe(char *pipename)
{
	long fd;
	
	fd = Fcreate(pipename, FA_HIDDEN);
	while (fd < 0)
	{
		pipename[18]++;
		if (pipename[18] > 'Z')
		{
			pipename[17]++;
			if (pipename[17] > 'Z')
				break;
			else
				pipename[18] = 'A';
		}
		fd = Fcreate(pipename, FA_HIDDEN);
	}
	return fd;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAPDragDrop(MsgFktParams *params)
{
	char pipename[20] = "U:\\PIPE\\DRAGDROP.AA";
	char exts[33];
	char type[5] = "";
	char *data;
	int fh;
	int16 headlen;
	long fd;
	int32 oldhandler;
	int32 size;
	
	pipename[18] = params->message[7];
	pipename[17] = params->message[7] >> 8;
	fd = Fopen(pipename, FO_RW);
	if (fd < 0)
		return FALSE;
	
	fh = (int)fd;
	Awi_update(END_UPDATE);
	oldhandler = (int32)Psignal(SIGPIPE, (void *)SIG_IGN);
	memset(exts, 0, sizeof(exts));
	strcpy(exts + 1, ".TXT.IMG");
	if (Fwrite(fh, sizeof(exts), exts) != sizeof(exts))
		return Aev_ddabort(fh, oldhandler);
	evnt_timer(50, 0);
	if (Fread(fh, sizeof(headlen), &headlen) != sizeof(headlen) ||
		headlen < 8)
		return Aev_ddabort(fh, oldhandler);
	if (Fread(fh, 4, type) != 4)
		return Aev_ddabort(fh, oldhandler);
	type[4] = '\0';
	Ast_toupper(type);
	headlen -= 4;
	if (strncmp(type, "PATH", 4) == 0)
	{
		while (headlen > 0 && Fread(fh, 1, exts) == 1)
			headlen--;
		exts[0] = DD_NAK;
		Fwrite(fh, 1, exts);
		Aev_ddabort(fh, oldhandler);
		return TRUE;
	}
	if (Fread(fh, sizeof(size), &size) != sizeof(size))
		return Aev_ddabort(fh, oldhandler);
	headlen -= sizeof(size);
	while (headlen > 0)
	{
		if (Fread(fh, 1, exts) != 1)
			return Aev_ddabort(fh, oldhandler);
		headlen--;
	}
	data = Ax_malloc(size + 1);
	if (data == NULL)
	{
		exts[0] = DD_NAK;
		Fwrite(fh, 1, exts);
		return Aev_ddabort(fh, oldhandler);
	}
	exts[0] = DD_OK;
	if (Fwrite(fh, 1, exts) != 1)
	{
#if WITH_FIXES
		Ax_free(data);
#endif
		return Aev_ddabort(fh, oldhandler);
	}
	evnt_timer(100, 0);
	if (Fread(fh, size, data) != size)
	{
		Ax_free(data);
		return Aev_ddabort(fh, oldhandler);
	}
	Aev_ddabort(fh, oldhandler);
	data[size] = '\0';

	if (strncmp(type, ".IMG", 4) == 0)
	{
		GetImgIntoObj(data, params->window, params->drag_obnr, params->drag_aob, params->drag_obj);
		Ax_free(data);
		return TRUE;
	}

	if (strncmp(type, ".TXT", 4) == 0 || strncmp(type, "ARGS", 4) == 0)
	{
		GetTxtIntoObj(data, type, params->window, params->drag_obnr, params->drag_obednr, params->drag_aob, params->drag_obj);
		Ax_free(data);
		return TRUE;
	}
	
	if (type[0] != '.')
		strcpy(type, ".TMP");
	Ascrp_put(&type[1], data, size, FALSE);
	if (!params->window->service(params->window, AS_SCRAP_IMPORT, &type[1]))
		Ascrp_clear(&type[1]);

	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_APDragDropMemory(int16 dest_id, int16 wh, int16 mx, int16 my, int16 kstate, const char *type, void *data, int32 size)
{
	char pipename[20] = "U:\\PIPE\\DRAGDROP.AA";
	XATTR xattr;
	int16 msg[8];
	int16 headlen;
	boolean retcode;
	int32 oldhandler;
	long fd;
	int fh;
	char exts[34];
	
	retcode = FALSE;
	if (Dsetdrv(Dgetdrv()) & (1L << ('U' - 'A')) &&
		Fxattr(0, "U:\\PIPE", &xattr) == 0)
	{
		fd = CreateDDPipe(pipename);
		if (fd >= 0)
		{
			fh = (int)fd;
			Awi_update(END_UPDATE);
			msg[0] = AP_DRAGDROP;
			msg[1] = ACSblk->gl_apid;
#if WITH_FIXES
			msg[2] = 0;
#endif
			msg[3] = wh;
			msg[4] = mx >= 0 ? mx : ACSblk->ev_mmox;
			msg[5] = my >= 0 ? my : ACSblk->ev_mmoy;
			msg[6] = kstate;
			msg[7] = (pipename[17] << 8) | pipename[18];
			if (appl_write(dest_id, (int)sizeof(msg), msg) != 0 &&
				GetDDTypes(fh, exts) == DD_OK)
			{
				oldhandler = Psignal(SIGPIPE, (void *)SIG_IGN);
				headlen = 10;
				strncpy(exts, type, 4);
				exts[4] = '\0';
				strcat(exts, "    \0\0");
				exts[4] = (char)((size >> 24) & 0xff);
				exts[5] = (char)((size >> 16) & 0xff);
				exts[6] = (char)((size >> 8) & 0xff);
				exts[7] = (char)((size) & 0xff);
				if (SendDDHeader(fh, headlen, exts) == DD_OK)
				{
					if (Ast_icmp(type, "PATH") != 0)
					{
						if (Fwrite(fh, size, data) == size)
							retcode = TRUE;
					} else
					{
						if (Fread(fh, size, data) == size)
							retcode = TRUE;
					}
				}
				Psignal(SIGPIPE, (void *)oldhandler);
			}
			Fclose(fh);
			Awi_update(BEG_UPDATE);
		}
	}
	
	return retcode;
}
