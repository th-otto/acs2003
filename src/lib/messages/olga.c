/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      OLGA protocol                                         */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "msgserv.h"

static ULinList *olga_connection = NULL;
static int16 olga_id = -1;
static int16 olga_infos = 0;
static int16 olga_stufe = -1;
static int16 olga_version = 0;
static boolean use_olga = FALSE;
static int16 idle_message[8] = { -1, -1, -1, -1, -1, -1, -1, -1 };
static int16 max_id = 0;
static int16 max_grp_id = 0;
static int16 phase = -1;

static void DelConnect(void *elem);
static boolean CheckOlga(void);
static int16 FindOlgaManager(void);
static boolean CmpWindConnect(void *data, void *elem);
static OLGA_Data *ID2Connect(int16 id);
static boolean Aev_OlgaInfo(int16 ap_id, OLGA_Data *data);


/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

boolean Aev_InitOlga(void)
{
	boolean retcode = TRUE;
	
	olga_connection = Alu_create();
	if (olga_connection == NULL)
		return FALSE;
	olga_connection->freeElem = DelConnect;
	memset(idle_message, -1, sizeof(idle_message));
	if (ACSconfig.init_prot & CFG_INIT_OLGA)
	{
		if (ACSconfig.init_prot & CFG_INIT_OLGA_FULL)
			retcode = CheckOlga();
		else
			olga_id = FindOlgaManager();
	}
	phase = 0;
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitOlga(void)
{
	phase = 1;
	if (olga_id >= 0)
		Aev_OleExit();
	if (olga_connection != NULL)
	{
		Alu_delete(olga_connection);
#if WITH_FIXES
		olga_connection = NULL;
#endif
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static int16 FindAppl(const char *name, const char *env)
{
	int16 ap_id;
	int16 i;
	char *ptr;
	char buf[20];
	
	ap_id = -1;
	ap_id = appl_find(name);
	if (ap_id < 0)
	{
		ptr = Ash_getenv(env);
		if (ptr != NULL)
		{
			Ast_adl(Af_2name(buf, ptr), 8);
			ap_id = appl_find(buf);
			if (ap_id < 0 && ACSblk->multitask)
			{
				Ash_prog(ptr, "", (void *)ACSblk->env);
#if WITH_FIXES
				for (i = 0; phase == 0 && ap_id < 0 && i < 30; i++)
#else
				for (i = 0; phase == 0 && olga_id < 0 && i < 30; i++)
#endif
				{
					evnt_timer(100, 0);
					ap_id = appl_find(name);
					if (ap_id < 0)
						ap_id = appl_find(buf);
				}
			}
		}
	}
	return ap_id;
}

/* -------------------------------------------------------------------------- */

static int16 FindOlgaManager(void)
{
	if (olga_id < 0)
	{
		olga_id = FindAppl("OLGA    ", "OLGAMANAGER");
		if (olga_id < 0)
			olga_id = FindAppl("OLEMANGR", "OLEMANAGER");
		if (olga_id >= 0)
			Aev_OleInit();
	}
	return olga_id;
}

/* -------------------------------------------------------------------------- */

static boolean CheckOlga(void)
{
	int i;
	
	if (use_olga && olga_id >= 0 && olga_id != ACSblk->gl_apid)
		return TRUE;
	if (olga_id < 0)
		olga_id = FindOlgaManager();
	if (!use_olga)
	{
		for (i = 0; !use_olga && i < 30; i++)
		{
			Aev_mess();
		}
	}
	if (use_olga && olga_id >= 0 && olga_id != ACSblk->gl_apid)
		return TRUE;
	return FALSE;
}

/* -------------------------------------------------------------------------- */

static OLGA_Data *InsConnect(OLGA_Infos *info)
{
	OLGA_Data *data;
	OLGA_Data *con;
	
	if (info == NULL)
		return NULL;
	data = Ax_malloc(sizeof(*data));
	if (data == NULL)
		return NULL;
	memcpy(&data->info, info, sizeof(data->info));
	data->info.datei = Ax_glmalloc(strlen(info->datei) + 1);
	if (data->info.datei == NULL)
	{
		Ax_free(data);
		return NULL;
	}
	strcpy(data->info.datei, info->datei);
	if (info->info_datei != NULL)
	{
		data->info.info_datei = Ax_glmalloc(strlen(info->info_datei) + 1);
		if (data->info.info_datei != NULL)
			strcpy(data->info.info_datei, info->info_datei);
	}
	data->info.id = max_id++;
#if WITH_FIXES
	con = olga_connection->searchFor(olga_connection, &data->info, CmpWindConnect);
#else
	con = olga_connection->searchFor(olga_connection, &data, CmpWindConnect);
#endif
	if (con != NULL)
	{
		data->grp_id = con->grp_id;
	} else
	{
		data->grp_id = max_grp_id++;
	}
	data->olga_flags = info->olga_flags;
#if WITH_FIXES
	data->server_id = -1;
	data->info_index = 0;
	data->aktiv = -1;
	data->aktiv_anz = 0;
	data->delete = FALSE;
#endif
	return data;
}

/* -------------------------------------------------------------------------- */

static void DelConnect(void *elem)
{
	OLGA_Data *data = (OLGA_Data *)elem;
	
	data->info.window->service(data->info.window, AS_OLGA_DISCONNECT, &data->info);
	if (data->info.datei != NULL)
		Ax_glfree(data->info.datei);
	if (data->info.info_datei != NULL)
		Ax_glfree(data->info.info_datei);
	Ax_recycle(elem, sizeof(*data));
}

/* -------------------------------------------------------------------------- */

OLGA_Infos *A_OlgaCreate(Awindow *win, char *filename, char *info_filename, int16 flags)
{
	OLGA_Data *data;
	OLGA_Infos info;
	
	info.window = win;
	info.datei = filename;
	info.info_datei = info_filename;
	info.olga_flags = flags;
	data = InsConnect(&info);
	if (data == NULL)
		return NULL;
	olga_connection->append(olga_connection, data);
	return &data->info;
}

/* -------------------------------------------------------------------------- */

boolean A_OlgaDelete(int16 id)
{
	OLGA_Data *data;
	
	data = ID2Connect(id);
	if (data == NULL)
		return TRUE;
	if (data->aktiv != -1)
		data->delete = TRUE;
	else
		DelConnect(data);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

#ifndef __GNUC__
/* unused */
static boolean CmpGrpIDConnect(void *para, void *elem)
{
	return *((int16 *)para) == ((OLGA_Data *)elem)->grp_id;
}
#endif

/* -------------------------------------------------------------------------- */

static boolean CmpWindConnect(void *para, void *elem)
{
	return *((Awindow **)para) == ((OLGA_Data *)elem)->info.window;
}

/* -------------------------------------------------------------------------- */

static boolean CmpIDConnect(void *para, void *elem)
{
	return *((int16 *)para) == ((OLGA_Data *)elem)->info.id;
}

/* -------------------------------------------------------------------------- */

#ifndef __GNUC__
/* unused */
static boolean CmpWindIdConnect(void *para, void *elem)
{
	return ((OLGA_Infos *)para)->window == ((OLGA_Data *)elem)->info.window &&
		((OLGA_Infos *)para)->id == ((OLGA_Data *)elem)->info.id;
}
#endif

/* -------------------------------------------------------------------------- */

static boolean CmpDatInfoConnect(void *para, void *elem)
{
	return ((((OLGA_Data *)elem)->info.olga_flags & OLGA_INF_SENSITIV) ?
		(Ast_icmp(((OLGA_Infos *)para)->datei, ((OLGA_Data *)elem)->info.datei) == 0) :
		(Ast_cmp(((OLGA_Infos *)para)->datei, ((OLGA_Data *)elem)->info.datei) == 0)) &&
		(((OLGA_Infos *)para)->olga_flags & OLGA_INF_SERVER) == (((OLGA_Data *)elem)->olga_flags & OLGA_INF_SERVER);
}

/* -------------------------------------------------------------------------- */

static boolean CmpWindDatConnect(void *para, void *elem)
{
	return CmpWindConnect(para, elem) && CmpDatInfoConnect(para, elem);
}

/* -------------------------------------------------------------------------- */

static boolean CmpDatNoWinConnect(void *para, void *elem)
{
	return CmpDatInfoConnect(para, elem) && ((OLGA_Infos *)para)->window != ((OLGA_Data *)elem)->info.window;
}

/* -------------------------------------------------------------------------- */

#ifndef __GNUC__
/* unused */
static OLGA_Data *Wind2Connect(Awindow *win, int16 id)
{
	OLGA_Infos info;
	
	info.window = win;
	info.id = id;
	if (id < 0)
		return olga_connection->searchFor(olga_connection, &info, CmpWindConnect);
	else
		return olga_connection->searchFor(olga_connection, &info, CmpWindIdConnect);
}
#endif

/* -------------------------------------------------------------------------- */

static OLGA_Data *Datei2Connect(OLGA_Infos *info)
{
	return olga_connection->searchFor(olga_connection, info, CmpDatInfoConnect);
}

/* -------------------------------------------------------------------------- */

static OLGA_Data *ID2Connect(int16 id)
{
	return olga_connection->searchFor(olga_connection, &id, CmpIDConnect);
}

/* -------------------------------------------------------------------------- */

static void SendOlgaUpdate(void *para, void *elem)
{
	((OLGA_Data *)elem)->info.info_id = ((OLGA_Infos *)para)->info_id;
	((OLGA_Data *)elem)->info.window->service(((OLGA_Data *)elem)->info.window, AS_OLGA_UPDATED, &((OLGA_Data *)elem)->info);
}

/* -------------------------------------------------------------------------- */

void Awi_saved(Awindow *window, const char *filename)
{
	OLGA_Infos info;
	OLGA_Data *data;
	
	info.window = window;
	info.datei = NO_CONST(filename);
	data = olga_connection->searchFor(olga_connection, &info, CmpWindDatConnect);
	if (data == NULL)
	{
	} else
	{
		olga_connection->doFor(olga_connection, &data->info, CmpDatNoWinConnect, SendOlgaUpdate);
		Aev_OlgaUpdate(filename);
	}
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaInit(MsgFktParams *params)
{
	boolean same;
	int16 *message = params->message;
	
	same = olga_id == message[1];
	if (same)
	{
		if (message[7] == 0)
		{
			olga_id = -1;
			olga_infos = 0;
			olga_stufe = -1;
			olga_connection->clear(olga_connection);
		} else
		{
			olga_infos = message[3];
			olga_stufe = message[4];
			use_olga = TRUE;
		}
	}
	return same;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOleExit(MsgFktParams *params)
{
	int16 *message = params->message;
	
	if (olga_id >= 0 && olga_id == message[1])
	{
		olga_id = -1;
		olga_infos = 0;
		olga_stufe = -1;
		use_olga = FALSE;
		olga_connection->clear(olga_connection);
		return TRUE;
	}
	return FALSE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOleNew(MsgFktParams *params)
{
	int16 *message = params->message;

	olga_id = message[1];
	olga_version = message[7];
	return Aev_OleInit();
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaAck(MsgFktParams *params)
{
	int16 *message = params->message;
	OLGA_Data *data;
	OLGA_Infos info;
	char *filename;
	char *oldname;
	
	filename = NULL;
	oldname = NULL;
#if WITH_FIXES
	data = NULL;
	info.datei = NULL;
#endif
	switch (message[7])
	{
	case OLGA_UPDATE:
		info.datei = *msg_ptr(message, 3);
		info.olga_flags = OLGA_INF_SERVER;
		data = Datei2Connect(&info);
		break;
	
	case OLGA_INFO:
		data = ID2Connect(message[5]);
		if (data != NULL)
		{
			Awindow *win;
			
			win = data->info.window;
			win->service(win, AS_OLGA_CLEAR_INFO, &data->info);
		}
		break;
	
	case OLGA_RENAME:
		info.datei = *msg_ptr(message, 5);
		info.olga_flags = OLGA_INF_SERVER;
		data = Datei2Connect(&info);
		oldname = *msg_ptr(message, 3);
		break;

	case OLGA_BREAKLINK:
		info.datei = *msg_ptr(message, 3);
		info.olga_flags = OLGA_INF_SERVER;
		data = Datei2Connect(&info);
		break;
	}
	
	if (data != NULL)
	{
		if (message[0] == data->aktiv)
		{
			--data->aktiv_anz;
			if (data->aktiv_anz < 1)
				data->aktiv = -1;
			if (data->delete)
				DelConnect(data);
		}
	} else
	{
		filename = info.datei;
	}
	if (filename != NULL)
		globProtData->deleteFor(globProtData, filename, Alu_ptrCmp);
	if (oldname != NULL)
		globProtData->deleteFor(globProtData, oldname, Alu_ptrCmp);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaUpdated(MsgFktParams *params)
{
	int16 *message = params->message;
	OLGA_Infos info;
	
	info.datei = *msg_ptr(message, 3);
	if (Ax_memCheck(info.datei, -1, FALSE))
	{
		info.info_id = message[5];
		info.olga_flags = 0;
		olga_connection->doFor(olga_connection, &info, CmpDatInfoConnect, SendOlgaUpdate);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaGetInfo(MsgFktParams *params)
{
	int16 *message = params->message;
	OLGA_Data *data;
	
	data = olga_connection->searchFor(olga_connection, &message[5], CmpIDConnect);
	if (data != NULL)
	{
		Awindow *win;
		
		win = data->info.window;
		if (win->service(win, AS_OLGA_MAKE_INFO, &data->info))
			Aev_OlgaInfo(message[1], data);
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

#ifdef __PUREC__
#pragma warn -par
#endif

boolean Aev_GetOlgaClientTerminated(MsgFktParams *params)
{
	return TRUE;
}

#ifdef __PUREC__
#pragma warn .par
#endif

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaIdle(MsgFktParams *params)
{
	int16 *message = params->message;
	int16 msg[8];
	boolean retcode = TRUE;
	
	if (idle_message[0] == OLGA_IDLE && memcmp(&idle_message[4], &message[4], 4 * sizeof(message[0])) == 0)
	{
		memset(idle_message, -1, sizeof(idle_message));
	} else
	{
		if (message[1] != ACSblk->gl_apid)
		{
			memcpy(msg, message, sizeof(msg));
			msg[1] = ACSblk->gl_apid;
			retcode = appl_write(message[1], (int)sizeof(msg), msg) != 0;
		}
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OleInit(void)
{
	boolean retcode = FALSE;
	int16 msg[8];

	if (olga_id >= 0 && olga_id != ACSblk->gl_apid)
	{
		memset(msg, 0, sizeof(msg));
		msg[0] = OLE_INIT;
		msg[1] = ACSblk->gl_apid;
		msg[3] = OL_SERVER | OL_IDLE;
		msg[7] = ACSconfig.XAccType;
		retcode = appl_write(olga_id, (int)sizeof(msg), msg) != 0;
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OleExit(void)
{
	boolean retcode = FALSE;
	int16 msg[8];

	if (CheckOlga())
	{
		memset(msg, 0, sizeof(msg));
		msg[0] = OLE_EXIT;
		msg[1] = ACSblk->gl_apid;
		retcode = appl_write(olga_id, (int)sizeof(msg), msg) != 0;
		olga_id = -1;
		olga_infos = 0;
		olga_stufe = -1;
		use_olga = FALSE;
		olga_connection->clear(olga_connection);
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaIdle(void)
{
	boolean retcode = FALSE;

	if (CheckOlga())
	{
		memset(idle_message, 0, sizeof(idle_message));
		idle_message[0] = OLGA_IDLE;
		idle_message[1] = ACSblk->gl_apid;
		idle_message[4] = 0x4143; /* 'AC' */
		idle_message[5] = 0x5370; /* 'Sp' */
		idle_message[6] = 0x726f; /* 'ro' */
		idle_message[7] = 0x4d45; /* 'ME' */
		retcode = appl_write(olga_id, (int)sizeof(idle_message), idle_message) != 0;
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaUpdate(const char *filename)
{
	boolean retcode = FALSE;
	int16 msg[8];
	OLGA_Data *data;
	OLGA_Infos info;
	char *path;
	
	if (CheckOlga())
	{
		info.datei = NO_CONST(filename);
		info.olga_flags = OLGA_INF_SERVER;
		data = Datei2Connect(&info);
		memset(msg, 0, sizeof(msg));
		msg[0] = OLGA_UPDATE;
		msg[1] = ACSblk->gl_apid;
#if WITH_FIXES
		if (data != NULL && !data->delete)
#else
		if (data != NULL || data->delete)
#endif
		{
			msg[5] = Ast_isEmpty(data->info.info_datei) ? 0 : data->info.id;
			*msg_ptr(msg, 3) = data->info.datei;
			if (data->aktiv == OLGA_UPDATE)
				++data->aktiv_anz;
			else
				data->aktiv_anz = 0;
			data->aktiv = OLGA_UPDATE;
		} else
		{
			path = Ax_glmalloc(strlen(filename) + 1);
			if (path == NULL)
				return FALSE;
			globProtData->append(globProtData, path);
			strcpy(path, filename);
			*msg_ptr(msg, 3) = path;
			msg[5] = 0;
		}
		retcode = appl_write(olga_id, (int)sizeof(msg), msg) != 0;
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaGetInfo(int16 id)
{
	int16 msg[8];
	OLGA_Data *data;
	
	data = ID2Connect(id);
	if (data == NULL)
		return FALSE;
	memset(msg, 0, sizeof(msg));
	msg[0] = OLGA_GETINFO;
	msg[1] = ACSblk->gl_apid;
	msg[5] = data->info_index;
	return appl_write(data->server_id, (int)sizeof(msg), msg) != 0;
}

/* -------------------------------------------------------------------------- */

static boolean Aev_OlgaInfo(int16 ap_id, OLGA_Data *data)
{
	int16 msg[8];
	boolean retcode = TRUE;
	
	if (CheckOlga())
	{
		memset(msg, 0, sizeof(msg));
		msg[0] = OLGA_INFO;
		msg[1] = ACSblk->gl_apid;
		msg[5] = data->info.id;
		*msg_ptr(msg, 3) = data->info.info_datei;
		retcode = appl_write(ap_id, (int)sizeof(msg), msg) != 0;
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaRename(const char *old_filename, const char *new_filename)
{
	boolean retcode = FALSE;
	int16 msg[8];
	OLGA_Data *data;
	OLGA_Infos info;
	char *old_path;
	char *new_path;
	
	if (CheckOlga())
	{
		info.datei = NO_CONST(old_filename);
		info.olga_flags = OLGA_INF_SERVER;
		data = Datei2Connect(&info);
		memset(msg, 0, sizeof(msg));
		msg[0] = OLGA_RENAME;
		msg[1] = ACSblk->gl_apid;
#if WITH_FIXES
		if (data != NULL && !data->delete)
#else
		if (data != NULL || data->delete)
#endif
		{
			new_path = Ax_glmalloc(strlen(new_filename) + 1);
			if (new_path == NULL)
				return FALSE;
			strcpy(new_path, new_filename);
			old_path = data->info.datei;
			data->info.datei = new_path;
#if WITH_FIXES
			globProtData->append(globProtData, new_path);
#else
			globProtData->append(globProtData, old_path);
			msg[5] = Ast_isEmpty(data->info.info_datei) ? 0 : data->info.id;
#endif
			*msg_ptr(msg, 3) = old_path;
			*msg_ptr(msg, 5) = new_path;
			if (data->aktiv == OLGA_RENAME)
				++data->aktiv_anz;
			else
				data->aktiv_anz = 0;
			data->aktiv = OLGA_RENAME;
		} else
		{
			old_path = Ax_glmalloc(strlen(old_filename) + 1);
			if (old_path == NULL)
				return FALSE;
			globProtData->append(globProtData, old_path);
			strcpy(old_path, old_filename);
			new_path = Ax_glmalloc(strlen(new_filename) + 1);
			if (new_path == NULL)
			{
				Ax_glfree(old_path);
				return FALSE;
			}
			globProtData->append(globProtData, new_path);
			strcpy(new_path, new_filename);
			*msg_ptr(msg, 3) = old_path;
			*msg_ptr(msg, 5) = new_path;
#if !WITH_FIXES
			msg[5] = 0;
#endif
		}
		retcode = appl_write(olga_id, (int)sizeof(msg), msg) != 0;
	}
	return retcode;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaBreaklink(const char *filename)
{
	boolean retcode = FALSE;
	int16 msg[8];
	OLGA_Data *data;
	OLGA_Infos info;
	char *path;
	
	if (CheckOlga())
	{
		info.datei = NO_CONST(filename);
		info.olga_flags = OLGA_INF_SERVER;
		data = Datei2Connect(&info);
		memset(msg, 0, sizeof(msg));
		msg[0] = OLGA_BREAKLINK;
		msg[1] = ACSblk->gl_apid;
#if WITH_FIXES
		if (data != NULL && !data->delete)
#else
		if (data != NULL || data->delete)
#endif
		{
			*msg_ptr(msg, 3) = data->info.datei;
			if (data->aktiv == OLGA_BREAKLINK)
				++data->aktiv_anz;
			else
				data->aktiv_anz = 0;
			data->aktiv = OLGA_BREAKLINK;
		} else
		{
			path = Ax_glmalloc(strlen(filename) + 1);
			if (path == NULL)
				return FALSE;
			globProtData->append(globProtData, path);
			strcpy(path, filename);
			*msg_ptr(msg, 3) = path;
		}
		retcode = appl_write(olga_id, (int)sizeof(msg), msg) != 0;
	}
	return retcode;
}

