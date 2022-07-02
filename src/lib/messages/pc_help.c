/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      PC-Help protocol                                      */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "msgserv.h"
#include "pc_help.h"

static char *help_string = NULL;
static int16 help_version = 0;
static Awindow *help_meldung = NULL;
static char help_name[10] = "";

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_InitPCHelp(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitPCHelp(void)
{
	if (help_string != NULL)
		Ax_glfree(help_string);
	help_string = NULL;
	help_meldung = NULL;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static int16 FindPCHelp(const char *name)
{
	int16 ap_id;
	
	if (name != NULL && *name != '\0')
	{
		ap_id = appl_find(name);
		strncpy(help_name, name, 8);
		help_name[9] = '\0';
	} else
	{
		ap_id = -1;
	}
	if (ap_id < 0)
	{
		ap_id = appl_find("PC_HELP ");
		strncpy(help_name, "PC_HELP ", 8);
		help_name[9] = '\0';
	}
	if (ap_id < 0)
	{
		ap_id = appl_find("ST-GUIDE");
		strncpy(help_name, "ST-GUIDE", 8);
		help_name[9] = '\0';
	}
	if (ap_id < 0)
		help_name[0] = '\0';
	return ap_id;
}

/* -------------------------------------------------------------------------- */

void CheckPcHelp(Awindow *win)
{
	if (win == help_meldung)
		help_meldung = NULL;
}

/* -------------------------------------------------------------------------- */

static void SendMeldung(boolean got_version)
{
	if (help_meldung != NULL)
	{
		if (!got_version)
			help_version = 0;
		help_meldung->service(help_meldung, AS_PC_VERSION, &help_version);
		help_meldung = NULL;
	}
}

/* -------------------------------------------------------------------------- */

int16 Aev_PCHelpVersion(void)
{
	return help_version;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAcReply(MsgFktParams *params)
{
	int16 *message = params->message;
	
	/* WTF? */
	if (message[2] > 0 && appl_find(help_name) == message[1])
	{
		help_version = message[2];
		SendMeldung(TRUE);
		if (help_string != NULL)
			Ax_glfree(help_string);
		help_string = NULL;
		help_name[0] = '\0';
		return TRUE;
	} else
	{
		;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_AcHelp(const char *help_acc, const char *reference, Awindow *window)
{
	int16 pchelp;
	int16 msg[8];
	
	pchelp = FindPCHelp(help_acc);
	if (pchelp >= 0 && pchelp != ACSblk->gl_apid)
	{
		SendMeldung(FALSE);
		if (help_string != NULL)
			Ax_glfree(help_string);
		help_string = Ast_copy(reference, TRUE);
		if (Ast_isEmpty(help_string))
			return FALSE;
		msg[0] = AC_HELP;
		msg[1] = ACSblk->gl_apid;
		msg[2] = 0;
		msg[5] = 0;
		msg[6] = 0;
		msg[7] = 0;
		*msg_ptr(msg, 3) = help_string;
		help_meldung = window;
		return appl_write(pchelp, (int)sizeof(msg), msg) != 0;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

int16 Aev_AcVersion(const char *help_acc, Awindow *window)
{
	int16 pchelp;
	int16 msg[8];
	
	pchelp = FindPCHelp(help_acc);
	if (pchelp >= 0 && pchelp != ACSblk->gl_apid)
	{
		SendMeldung(FALSE);
		if (help_string != NULL)
			Ax_glfree(help_string);
		help_string = NULL;
		memset(msg, 0, sizeof(msg));
		msg[0] = AC_VERSION;
		msg[1] = ACSblk->gl_apid;
		help_meldung = window;
		return appl_write(pchelp, (int)sizeof(msg), msg) != 0;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

int16 Aev_AcCopy(const char *help_acc, Awindow *window)
{
	int16 pchelp;
	int16 msg[8];
	
	pchelp = FindPCHelp(help_acc);
	if (pchelp >= 0 && pchelp != ACSblk->gl_apid)
	{
		SendMeldung(FALSE);
		if (help_string != NULL)
			Ax_glfree(help_string);
		help_string = NULL;
		memset(msg, 0, sizeof(msg));
		msg[0] = AC_COPY;
		msg[1] = ACSblk->gl_apid;
		help_meldung = window;
		return appl_write(pchelp, (int)sizeof(msg), msg) != 0;
	}
	return FALSE;
}
