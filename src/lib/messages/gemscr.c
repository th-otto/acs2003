/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      GEMscript protocol                                    */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include <ctype.h>
#include "msgserv.h"
#include "gscript.h"

typedef struct {
	const char *cmd;
	int16 (*gs_fkt)(int16 count, char **cmds, A_GSAntwort *answer);
} gs_cmd;

#define GS_STATE_REQUEST     1
#define GS_STATE_QUIT        2

static GS_INFO *gs_infodata = NULL;
static ULinList *gs_connect = NULL;

static void ClearConnect(void *elem);
static boolean Aev_GSAck(int16 *message, int16 ret_value, char *ret_str);
static boolean Aev_GSQuit(gs_con *con);
static boolean Aev_GSReply(gs_con *con, int16 code);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_InitGEMScript(void)
{
	gs_infodata = Ax_glmalloc(sizeof(*gs_infodata));
	if (gs_infodata == NULL)
		return FALSE;
	gs_infodata->len = sizeof(*gs_infodata);
	gs_infodata->version = GEMSCRIPT_VERSION;
	gs_infodata->msgs = GSM_COMMAND | GSM_HEXCODING;
	gs_infodata->ext = 0;
	gs_connect = Alu_create();
	if (gs_connect == NULL)
		return FALSE;
	gs_connect->freeElem = ClearConnect;
	
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitGEMScript(void)
{
	Alu_delete(gs_connect);
	gs_connect = NULL;
	if (gs_infodata != NULL)
		Ax_glfree(gs_infodata);
	gs_infodata = NULL;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean CmpIDKanal(void *para, void *elem)
{
	if (((gs_search *)para)->ap_id == ((gs_con *)elem)->ap_id &&
		((gs_search *)para)->gs_id == ((gs_con *)elem)->gs_id)
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

static void SetStatus(void *para, void *elem)
{
	if (((gs_search *)para)->set_flag)
		((gs_con *)elem)->status |= ((gs_search *)para)->status;
	else
		((gs_con *)elem)->status &= ~((gs_search *)para)->status;
}

/* -------------------------------------------------------------------------- */

static void SendGsAck(gs_answer *answer)
{
	char *str;
	
	if (answer->antwort.antwort != NULL)
	{
		str = Ast_mergeASCIIZZ(answer->antwort.antwort, answer->antwort.anzahl, TRUE);
	} else
	{
		str = Ax_glmalloc(3);
#if WITH_FIXES
		str[0] = '0';
		str[1] = '\0';
		str[2] = '\0';
#else
		strcpy(str, "0\0");
#endif
	}
	Aev_GSAck(answer->message, answer->antwort.ret_wert, str);
	globProtData->append(globProtData, str);
}

/* -------------------------------------------------------------------------- */

static void ClearConnect(void *elem)
{
	if ((((gs_con *)elem)->status & GS_STATE_QUIT) == 0)
		Aev_GSQuit(elem);
	Ax_recycle(elem, sizeof(gs_con));
}

/* -------------------------------------------------------------------------- */

static int16 ParseGSCommands(const char *cmd, char ***cmds)
{
	int16 i;
	int16 j;
	char *ptr;
	char *dst;
	char **strptr;
	char *tmp;
	char **strings;
	int16 retcode;
	int16 count;
	
	retcode = 0;
	count = 0;
	if (Ast_splitASCIIZZ(cmd, &strings, &count) && count > 0)
	{
		for (i = 0, strptr = strings; i < count; i++, strptr++)
		{
			if (strchr("\001\002\003\004\005\006", **strptr) != NULL)
			{
				switch (**strptr)
				{
				case '\001':
					Ast_delete(*strptr);
					*strptr = Ast_create("");
					break;
				case '\002':
					retcode = (int)strlen(*strptr) - 1;
					retcode = (retcode >> 1) + (retcode & 1);
					tmp = Ax_malloc(retcode + 1);
					if (tmp != NULL)
					{
						for (j = 0, ptr = *strptr + 1, dst = tmp; *ptr != '\0' && j < retcode; dst++, ptr++, j++)
						{
							if (isdigit(*ptr))
								*dst = *ptr - '0';
							else if (isxdigit(*ptr))
								*dst = Ach_toupper(*ptr) - 'A' + 10;
							ptr++;
							if (*ptr != '\0')
							{
								*dst <<= 4;
								if (isdigit(*ptr))
									*dst |= *ptr - '0';
								else if (isxdigit(*ptr))
									*dst |= Ach_toupper(*ptr) - 'A' + 10;
							}
						}
						*dst = '\0';
					}
					Ast_delete(*strptr);
					*strptr = tmp;
					break;
				default:
					Ast_delete(*strptr);
					*strptr = NULL;
					break;
				}
			}
		}
		retcode = 0;
		for (i = 0, strptr = strings; i < count; i++, strptr++)
		{
			if (*strptr != NULL)
				retcode++;
		}
		*cmds = Ax_malloc(retcode * sizeof(**cmds));
#if WITH_FIXES
		if (*cmds == NULL)
#else
		if (cmds == NULL)
#endif
		{
			retcode = 0;
			Ast_deleteAry(strings, count);
		} else
		{
			for (i = j = 0, strptr = strings; i < count && j < retcode; i++, strptr++)
				if (*strptr != NULL)
				{
					(*cmds)[j] = *strptr;
					j++;
				}
			Ax_free(strings);
		}
#if WITH_FIXES
	} else
	{
		*cmds = NULL;
#endif
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetGSRequest(MsgFktParams *params)
{
	int16 *message = params->message;
	gs_con *con;
	gs_search search;
	GS_INFO *info;
	
	search.ap_id = message[1];
	search.gs_id = message[7];
	con = gs_connect->searchFor(gs_connect, &search, CmpIDKanal);
	if (con == NULL)
	{
		con = Ax_malloc(sizeof(*con));
		if (con == NULL)
		{
			/* BUG: does not send reply */
			return FALSE;
		}
		memset(con, 0, sizeof(*con));
		con->ap_id = message[1];
		con->gs_id = message[7];
		gs_connect->append(gs_connect, con);
	} else
	{
		return Aev_GSReply(con, GSACK_ERROR);
	}
	info = *msg_ptr(message, 3);
	if (Ax_memCheck((const char *)info, sizeof(*info), FALSE))
	{
		memcpy(&con->info, info, sizeof(con->info));
		con->status |= GS_STATE_REQUEST;
		return Aev_GSReply(con, GSACK_OK);
	} else
	{
		return Aev_GSReply(con, GSACK_UNKNOWN);
	}
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetGSQuit(MsgFktParams *params)
{
	gs_search search = { 0, 0, GS_STATE_QUIT, TRUE };
	
	search.ap_id = params->message[1];
	search.gs_id = params->message[7];
	gs_connect->doFor(gs_connect, &search, CmpIDKanal, SetStatus);
	gs_connect->deleteFor(gs_connect, &search, CmpIDKanal);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetGSCommand(MsgFktParams *params)
{
	int16 *message = params->message;
	char *cmd;
	char **cmds;
	int16 i;
	int16 count;
	Awindow *win;
	gs_answer answer;

	memcpy(answer.message, message, sizeof(answer.message));
	answer.antwort.antwort = Ax_malloc(1 * sizeof(*answer.antwort.antwort));
	answer.antwort.anzahl = 1;
	answer.antwort.ret_wert = GSACK_OK;
	if (answer.antwort.antwort == NULL)
	{
		SendGsAck(&answer);
		return FALSE;
	} else
	{
		answer.antwort.antwort[0] = Ast_create("0");
	}
	cmd = *msg_ptr(message, 3);
	if (Ax_memCheck(cmd, -2, FALSE))
	{
		count = ParseGSCommands(cmd, &cmds);
		answer.antwort.ret_wert = ACSblk->GEMScript(count, cmds, &answer.antwort);
		if (answer.antwort.ret_wert != GSACK_OK)
		{
			win = count > 1 ? Awi_name(cmds[1], FALSE) : Awi_root();
			if (win != NULL && win->gemscript != NULL)
				answer.antwort.ret_wert = win->gemscript(win, count, cmds, &answer.antwort);
		}
		Ast_deleteAry(cmds, count);
		for (i = 0; i < answer.antwort.anzahl; i++)
			Ast_delete(answer.antwort.antwort[i]);
		Ax_free(answer.antwort.antwort);
	} else
	{
		answer.antwort.ret_wert = GSACK_ERROR;
	}
	SendGsAck(&answer);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetGSAck(MsgFktParams *params)
{
	int16 *message = params->message;
	char *cmd;
	char *result;
	int16 ref_msg0;
	MsgWaitForAnswer *answer;
	MsgSearchForOriginal search;
	
	cmd = *msg_ptr(message, 3);
	result = *msg_ptr(message, 5);
	ref_msg0 = GS_COMMAND;
	search.dest_id = message[1];
	search.ref_msg[0] = &ref_msg0;
	search.ref_msg[1] = NULL;
	search.ref_msg[2] = NULL;
	search.ref_msg[3] = &message[3];
	search.ref_msg[4] = &message[4];
	search.ref_msg[5] = cmd != NULL ? NULL : &message[5];
	search.ref_msg[6] = cmd != NULL ? NULL : &message[6];
	search.ref_msg[7] = NULL;
	answer = SentMsg->searchFor(SentMsg, &search, Aev_CmpMsgInList);
	if (answer != NULL)
	{
		if (answer->window != NULL)
		{
			; /* code commented out? */
		}
#if WITH_FIXES
		SentMsg->deleteFor(SentMsg, answer, Alu_ptrCmp);
#else
		SentMsg->searchFor(SentMsg, answer, Alu_ptrCmp);
#endif		
	}
	if (cmd != NULL)
	{
		/*
		 * GS_ACK for a GS_COMMAND message we sent ourselves
		 */
		globProtData->deleteFor(globProtData, cmd, Alu_ptrCmp);
		if (result != NULL)
		{
			message[3] = 0;
			message[4] = 0;
#if WITH_FIXES
			Aev_GSAck(message, GSACK_OK, result);
#else
			Aev_GSAck(message, GSACK_OK, "1\0\0");
#endif
		}
	} else
	{
		/*
		 * GS_ACK for the result that we sent in response to a GS_COMMAND
		 */
		if (result != NULL)
			globProtData->deleteFor(globProtData, result, Alu_ptrCmp);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean Aev_GSReply(gs_con *con, int16 code)
{
	int16 msg[8];
	
	if (con->ap_id != ACSblk->gl_apid)
	{
		memset(msg, 0, sizeof(msg));
		msg[0] = GS_REPLY;
		msg[1] = ACSblk->gl_apid;
		msg[6] = code;
		msg[7] = con->gs_id;
		*msg_ptr(msg, 3) = gs_infodata;
		return appl_write(con->ap_id, (int)sizeof(msg), msg) != 0;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

static boolean Aev_GSQuit(gs_con *con)
{
#if WITH_FIXES
	int16 msg[8];
#else
	int16 msg[16];
#endif
	
	if (ACSblk->gl_apid != con->ap_id)
	{
#if WITH_FIXES
		memset(msg, 0, sizeof(msg));
#else
		memset(msg, 0, 8 * sizeof(msg[0]));
#endif
		msg[0] = GS_QUIT;
		msg[1] = ACSblk->gl_apid;
		msg[7] = con->gs_id;
#if WITH_FIXES
		return appl_write(con->ap_id, (int)sizeof(msg), msg) != 0;
#else
		return appl_write(con->ap_id, 8 * (int)sizeof(msg[0]), msg) != 0;
#endif
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

static boolean Aev_GSAck(int16 *message, int16 ret_value, char *ret_str)
{
#if WITH_FIXES
	int16 msg[8];
#else
	int16 msg[16];
#endif
	
	if (ACSblk->gl_apid != message[1])
	{
#if WITH_FIXES
		memset(msg, 0, sizeof(msg));
#else
		memset(msg, 0, 8 * sizeof(msg[0]));
#endif
		msg[0] = GS_ACK;
		msg[1] = ACSblk->gl_apid;
		msg[3] = message[3];
		msg[4] = message[4];
		msg[7] = ret_value;
		*msg_ptr(msg, 5) = ret_str;
#if WITH_FIXES
		return appl_write(message[1], (int)sizeof(msg), msg) != 0;
#else
		return appl_write(message[1], 8 * (int)sizeof(msg[0]), msg) != 0;
#endif
	}
	return FALSE;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static int16 gs_CheckCommand(int16 count, char **cmds, A_GSAntwort *answer);
static int16 gs_SendToTopWindow(int16 count, char **cmds, A_GSAntwort *answer);
static int16 gs_Quit(int16 count, char **cmds, A_GSAntwort *answer);
static int16 gs_AppGetLongName(int16 count, char **cmds, A_GSAntwort *answer);
static int16 gs_GetAllCommands(int16 count, char **cmds, A_GSAntwort *answer);

static gs_cmd _gs_commands[] = {
	{ "CheckCommand", gs_CheckCommand },
	{ "GetFront", gs_SendToTopWindow },
	{ "Quit", gs_Quit },
	{ "AppGetLongName", gs_AppGetLongName },
	{ "KeyPress", gs_SendToTopWindow },
	{ "GetAllCommands", gs_GetAllCommands }
};
static int _gs_cmd_anzahl = (int)(sizeof(_gs_commands) / sizeof(_gs_commands[0]));
static boolean _gs_sorted = FALSE;

/* -------------------------------------------------------------------------- */

static int _gs_cmp(const void *cmd1, const void *cmd2)
{
	return Ast_icmp(((const gs_cmd *)cmd1)->cmd, ((const gs_cmd *)cmd2)->cmd);
}

/* -------------------------------------------------------------------------- */

static int _gs_search(const void *key, const void *cmd2)
{
	return Ast_icmp(key, ((const gs_cmd *)cmd2)->cmd);
}

/* -------------------------------------------------------------------------- */

int _gs_strcmp(const void *cmd1, const void *cmd2)
{
	return Ast_icmp(((const char **)cmd1)[0], ((const char **)cmd2)[0]);
}

/* -------------------------------------------------------------------------- */

int16 Aev_GEMScript(int16 anz, char **cmds, A_GSAntwort *antwort)
{
	const gs_cmd *cmd;
	
	antwort->ret_wert = GSACK_UNKNOWN;
	if (!_gs_sorted)
	{
		qsort(_gs_commands, _gs_cmd_anzahl, sizeof(_gs_commands[0]), _gs_cmp);
		_gs_sorted = TRUE;
	}
	cmd = bsearch(cmds[0], _gs_commands, _gs_cmd_anzahl, sizeof(_gs_commands[0]), _gs_search);
	if (cmd != NULL)
	{
		if (cmd->gs_fkt != NULL)
			antwort->ret_wert = cmd->gs_fkt(anz, cmds, antwort);
		else
			antwort->ret_wert = GSACK_OK;
	}
	return antwort->ret_wert;
}

/* -------------------------------------------------------------------------- */

static int16 gs_SendToTopWindow(int16 count, char **cmds, A_GSAntwort *answer)
{
	Awindow *win;
	
	win = Awi_ontop();
	return win->gemscript(win, count, cmds, answer);
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

static int16 gs_AppGetLongName(int16 count, char **cmds, A_GSAntwort *answer)
{
	Ax_free(answer->antwort[0]);
	answer->anzahl = 1;
	answer->antwort[0] = Ast_create(ACSblk->AppLongName);
	return GSACK_OK;
}

#ifdef __PUREC__
#pragma warn -par
#endif

/* -------------------------------------------------------------------------- */

static int16 gs_CheckCommand(int16 count, char **cmds, A_GSAntwort *answer)
{
	gs_cmd *cmd;

	if (count < 2)
		return GSACK_ERROR;
	cmd = bsearch(cmds[1], _gs_commands, _gs_cmd_anzahl, sizeof(_gs_commands[0]), _gs_search);
	if (cmd != NULL)
	{
		Ax_free(answer->antwort[0]);
		answer->antwort[0] = Ast_create("1");
		answer->anzahl = 1;
		answer->ret_wert = GSACK_OK;
	} else
	{
		answer->ret_wert = Awi_gemscript(Awi_root(), count, cmds, answer);
	}
	return answer->ret_wert;
}

/* -------------------------------------------------------------------------- */

static int16 gs_Quit(int16 count, char **cmds, A_GSAntwort *answer)
{
	Aev_quit();
	Ax_free(answer->antwort[0]);
	answer->antwort[0] = Ast_create("1");
	answer->anzahl = 1;
	return GSACK_OK;
}

/* -------------------------------------------------------------------------- */

static int16 gs_GetAllCommands(int16 count, char **cmds, A_GSAntwort *answer)
{
	int16 i;
	int16 k;
	int16 j;
	int16 cmdcount;
	char **ans;
	char **arr;
	Awindow *win;
	
	win = Awi_ontop();
	i = win->gemscript(win, count, cmds, answer);
	if (i != GSACK_OK)
		return i;
	cmdcount = _gs_cmd_anzahl + answer->anzahl;
	ans = Ax_malloc(cmdcount * sizeof(*ans));
	if (ans == NULL)
		return GSACK_ERROR;
	memset(ans, 0, cmdcount * sizeof(*ans));
	
	for (i = 0; i < _gs_cmd_anzahl; i++)
	{
		ans[i] = Ast_create(_gs_commands[i].cmd);
#if WITH_FIXES
		if (ans[i] == NULL)
#else
		if (ans == NULL)
#endif
		{
			Ast_deleteAry(ans, _gs_cmd_anzahl);
			return GSACK_ERROR;
		}
	}
	memcpy(&ans[_gs_cmd_anzahl], answer->antwort, answer->anzahl * sizeof(*ans));
	qsort(ans, cmdcount, sizeof(*ans), _gs_strcmp);

	j = 0;
	for (i = 1; i < cmdcount; i++)
	{
		if (Ast_icmp(ans[i - 1], ans[i]) == 0)
			j++;
	}
	arr = Ax_malloc((cmdcount - j) * sizeof(*arr));
	if (arr != NULL)
	{
		arr[0] = ans[0];
		for (i = 1, k = 1; i < cmdcount && k < (cmdcount - j); i++)
		{
			if (Ast_icmp(ans[i], arr[k - 1]) != 0)
			{
				arr[k] = ans[i];
				k++;
				ans[i] = NULL;
			}
		}
		Ast_deleteAry(ans, cmdcount);
		cmdcount -= j;
	} else
	{
		arr = ans;
	}
	Ax_free(answer->antwort);
	answer->anzahl = cmdcount;
	answer->antwort = arr;
	return GSACK_OK;
}
