/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      ST-Guide protocol                                     */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "msgserv.h"

static char *help_string = NULL;
static Awindow *help_meldung = NULL;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_InitSTGuide(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitSTGuide(void)
{
	if (help_string != NULL)
#if WITH_FIXES
		Ax_free(help_string);
#else
		Ax_glfree(help_string);
#endif
	help_string = NULL;
	help_meldung = NULL;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void CheckSTGuide(Awindow *win)
{
	if (win == help_meldung)
		help_meldung = NULL;
}

/* -------------------------------------------------------------------------- */

static void SendMeldung(void)
{
	if (help_meldung != NULL)
	{
		help_meldung->service(help_meldung, AS_PC_VERSION, NULL);
		help_meldung = NULL;
	}
}

/* -------------------------------------------------------------------------- */

boolean Aev_STGuideHelp(const char *hyp_text, const char *reference, Awindow *window)
{
	int16 stguide;
	ssize_t len;
	
	if (Ast_isEmpty(hyp_text) && Ast_isEmpty(reference))
		return FALSE;
	stguide = appl_find("ST-GUIDE");
	if (stguide < 0 && !ACSblk->multitask && ACSblk->gl_apid == 0)
	{
		; /* code commented out? */
	}
	if (help_string != NULL)
	{
#if WITH_FIXES
		Ax_free(help_string);
		help_string = NULL;
#else
		Ax_glfree(help_string);
#endif
	}
	SendMeldung();
	if (hyp_text == NULL || *hyp_text == '\0')
		return Aev_AcHelp("ST-GUIDE", reference, window);
#if WITH_FIXES
	if (stguide < 0)
		return FALSE;
#endif
	len = strlen(hyp_text) + strlen(reference) + 10;
	help_string = Ax_malloc(len);
	if (help_string == NULL)
		return FALSE;
	strcat(Ast_alltrim(strcat(strcpy(help_string, "*:\\"), hyp_text)), ".REF");
	if (reference != NULL && *reference != '\0')
		Ast_alltrim(strcat(strcat(help_string, " "), reference));
	
	return Aev_VaStart(stguide, help_string, NULL, -1);
}
