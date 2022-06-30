/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      BubbleGEM protocol                                    */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "msgserv.h"
#include "bubble.h"

static char *bubble_string = NULL;
static int phase = -1;

static boolean CreateBubbleString(void);
static int16 FindBubbleGEM(void);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_InitBubble(void)
{
	boolean ok;
	
	if ((ACSconfig.init_prot & CFG_INIT_BUBBLEGEM) != 0)
		FindBubbleGEM();
	ok = CreateBubbleString();
	phase = 0;
	return ok;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitBubble(void)
{
	phase = 1;
	if (bubble_string != NULL)
		Ax_glfree(bubble_string);
	bubble_string = NULL;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean CreateBubbleString(void)
{
	if (bubble_string == NULL)
	{
		bubble_string = Ax_glmalloc(256);
		if (bubble_string == NULL)
			return FALSE;
		*bubble_string = '\0';
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static int16 FindBubbleGEM(void)
{
	int16 bubble;
	int i;
	char *appname;
	
	bubble = appl_find("BUBBLE  ");
	if (bubble < 0 && ACSblk->multitask)
	{
		appname = Ash_getenv("BUBBLEGEM");
		if (appname != NULL && *appname != '\0')
		{
			Ash_prog(appname, "", (void *)ACSblk->env);
			for (i = 0; phase == 0 && bubble < 0 && i < 30; i++)
			{
				evnt_timer(100, 0);
				bubble = appl_find("BUBBLE  ");
			}
		}
	}
	return bubble;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAckBubbleGEM(MsgFktParams *params)
{
	int16 *message;
	
	message = params->message;
	if (FindBubbleGEM() == message[1])
	{
		if (CreateBubbleString() && *msg_ptr(message, 3) == bubble_string)
		{
			*bubble_string = '\0';
		}
		return TRUE;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAskFontBubbleGEM(MsgFktParams *params)
{
	int16 *message;
	
	message = params->message;
	if (FindBubbleGEM() == message[1])
	{
		return Aev_FontBubbleGEM(0, 0);
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetRequestBubbleGEM(MsgFktParams *params)
{
	return Awi_bubblegem(params->window, params->area.x, params->area.y);
}

/* -------------------------------------------------------------------------- */

int16 Aev_FontBubbleGEM(int16 font_id, int16 points)
{
	int16 bubble;
	int16 msg[8];
	
	if (points < 1)
		return TRUE;
	bubble = FindBubbleGEM();
	if (bubble >= 0 && bubble != ACSblk->gl_apid)
	{
		if (!CreateBubbleString())
			return FALSE;
		msg[0] = BUBBLEGEM_FONT;
		msg[1] = ACSblk->gl_apid;
		msg[2] = 0;
		msg[3] = font_id;
		msg[4] = points;
#if WITH_FIXES
		msg[5] = 0;
		msg[6] = 0;
#endif
		msg[7] = 0;
		return Aev_SendMsg(bubble, DATATYPE_BUBBLE, msg, NULL, -1) ? TRUE : FALSE;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_HideBubbleGEM(void)
{
	int16 bubble;
	int16 msg[8];

	bubble = FindBubbleGEM();
	if (bubble >= 0 && bubble != ACSblk->gl_apid)
	{
		memset(msg, 0, sizeof(msg));
		msg[0] = BUBBLEGEM_HIDE;
		msg[1] = ACSblk->gl_apid;
		return Aev_SendMsg(bubble, DATATYPE_BUBBLE, msg, NULL, -1) ? TRUE : FALSE;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ShowBubbleGEM(const char *text, int16 mx, int16 my)
{
	int16 bubble;
	ssize_t len;
	int16 msg[8];

	if (Ast_isEmpty(text))
		return TRUE;
	
	bubble = FindBubbleGEM();
	if (bubble >= 0 && bubble != ACSblk->gl_apid)
	{
		if (!CreateBubbleString())
			return FALSE;
		len = strlen(text);
		if (len > 255)
			len = 255;
		strncpy(bubble_string, text, (int)len);
		bubble_string[(int)len] = '\0';
		msg[0] = BUBBLEGEM_SHOW;
		msg[1] = ACSblk->gl_apid;
		msg[2] = 0;
		msg[3] = mx >= 0 ? mx : ACSblk->ev_mmox;
		msg[4] = my >= 0 ? my : ACSblk->ev_mmoy;
		msg[7] = A_isModDia() ? 1 : 0;
		*msg_ptr(msg, 5) = bubble_string;
		return Aev_SendMsg(bubble, DATATYPE_BUBBLE, msg, NULL, -1) ? TRUE : FALSE;
	}
	return FALSE;
}
