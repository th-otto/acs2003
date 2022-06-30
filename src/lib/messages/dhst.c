/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Document HiSTory protocol                             */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "msgserv.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_InitDHST(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitDHST(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void freeDhstInfo(DHSTINFO *info)
{
	if (info->appname != NULL)
		globProtData->deleteFor(globProtData, info->appname, Alu_ptrCmp);
	if (info->apppath != NULL)
		globProtData->deleteFor(globProtData, info->apppath, Alu_ptrCmp);
	if (info->docname != NULL)
		globProtData->deleteFor(globProtData, info->docname, Alu_ptrCmp);
	if (info->docpath != NULL)
		globProtData->deleteFor(globProtData, info->docpath, Alu_ptrCmp);
	globProtData->deleteFor(globProtData, info, Alu_ptrCmp);
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetDhstAdd(MsgFktParams *params)
{
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

boolean Aev_GetDhstAck(MsgFktParams *params)
{
	MsgSearchForOriginal search;
	MsgSearchForOriginal *answer;
	int16 ref_msg0 = DHST_ADD;
	int16 *message = params->message;
	DHSTINFO *info;
	
	info = *msg_ptr(message, 3);
	freeDhstInfo(info);
	search.dest_id = message[1];
	search.type = DATATYPE_DHST;
	search.ref_msg[0] = &ref_msg0;
	search.ref_msg[1] = NULL;
	search.ref_msg[2] = NULL;
	search.ref_msg[3] = &message[3];
	search.ref_msg[4] = &message[4];
	search.ref_msg[5] = NULL;
	search.ref_msg[6] = NULL;
	search.ref_msg[7] = NULL;
	answer = SentMsg->searchFor(SentMsg, &search, Aev_CmpMsgInList);
	if (answer != NULL)
	{
#if WITH_FIXES
		SentMsg->deleteFor(SentMsg, answer, Alu_ptrCmp);
#else
		SentMsg->searchFor(SentMsg, answer, Alu_ptrCmp);
#endif
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_DhstAdd(const char *docname, const char *docpath)
{
	DHSTINFO *info;
	int16 server;
	int16 msg[8];
	int32 dhst;
	
	if (!Ash_getcookie(C_DHST, &dhst) || (server = (int16)(dhst & 0xffff)) < 0)
		return FALSE;
	info = Ax_glmalloc(sizeof(*info));
	if (info == NULL)
		return FALSE;
#if WITH_FIXES
	memset(info, 0, sizeof(*info));
#else
	memset(info, 0, sizeof(info));
#endif
	globProtData->append(globProtData, info);
	info->appname = Ast_alltrim(Ast_copy(ACSblk->AppLongName, TRUE));
	info->apppath = Ast_alltrim(Ast_copy(ACSblk->appname, TRUE));
	info->docname = Ast_copy(docname, TRUE);
	info->docpath = Ast_copy(docpath, TRUE);
	globProtData->append(globProtData, info->appname);
	globProtData->append(globProtData, info->apppath);
	globProtData->append(globProtData, info->docname);
	globProtData->append(globProtData, info->docpath);
	msg[0] = DHST_ADD;
	msg[1] = ACSblk->gl_apid;
	msg[2] = 0;
	msg[5] = 0;
	msg[6] = 0;
	msg[7] = 0;
	*msg_ptr(msg, 3) = info;
	return Aev_SendMsg(server, DATATYPE_DHST, msg, NULL, -1);
}

/* -------------------------------------------------------------------------- */

boolean Aev_DhstSaved(const char *file)
{
	char *name;
	boolean retcode;
	
	name = Ax_malloc(strlen(file));
	if (name == NULL)
		return FALSE;
	retcode = Aev_DhstAdd(Af_2fullname(name, file), file);
	Ax_free(name);
	return retcode;
}

