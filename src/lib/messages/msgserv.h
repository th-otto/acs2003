/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Internal include file for message protocols           */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

typedef struct {
	int16 *message;
	Axywh area;
	Awindow *window;
	AOBJECT *drag_aob;
	OBJECT *drag_obj;
	int16 drag_obnr;
	int16 drag_obednr;
	int16 scroll;
} MsgFktParams;

typedef struct {
	int16 dest_id;
	Awindow *window;
	int16 timeout;
	int16 type;
	int16 message[8];
} MsgWaitForAnswer;

typedef struct {
	int16 dest_id;
	int16 type;
	int16 *ref_msg[8];
} MsgSearchForOriginal;

typedef struct {
	int16 msg_id;
	uint32 timestamp;
	void *globData;
} XAccData;

typedef struct {
	int16 msg_id;
	uint32 timestamp;
	void *globData;
} AVData;

typedef struct {
	A_dd dd;
	XAccData xacc_data;
	AVData *va_data;
} A_dd_int;

typedef struct {
	int16 *message;
	Awindow *wd;
	int16 timeout;
	int16 type;
} MsgAllStruct;


/* MsgSearchForOriginal.type */
#define DATATYPE_VA     1
#define DATATYPE_DHST   3
#define DATATYPE_BUBBLE 4


typedef struct {
	int16 message[8];
	A_GSAntwort antwort;
} gs_answer;

typedef struct {
	int16 ap_id;
	GS_INFO info;
	int16 gs_id;
	int16 status;
} gs_con;

typedef struct {
	int16 ap_id;
	int16 gs_id;
	int16 status;
	boolean set_flag;
} gs_search;



#ifdef __GNUC__
/* to avoid "dereferencing type-punned pointer" */
static __inline void **msg_ptr(int16 *message, int n)
{
	return (void **)&message[n];
}
static __inline int32 *msg_long(int16 *message, int n)
{
	return (int32 *)&message[n];
}
#else
#define msg_ptr(message, n) ((void **)&message[n])
#define msg_long(message, n) ((int32 *)&message[n])
#endif


/*
 * lib/messages/msgserv.c
 */
extern ULinList *globProtData;

int16 INMsgService(void);
void TRMsgService(void);
boolean Aev_message(int16 *msg);
A_dd_int *Aev_DDSearch(int16 id);
boolean Aev_CmpMsgInList(void /* MsgSearchForOriginal */ *para, void /* MsgWaitForAnswer */ *msg);
int16 Aev_CmpDestID(void /* MsgSearchForOriginal */ *para, void /* MsgWaitForAnswer */ *msg);
MsgWaitForAnswer *Aev_SearchMsg(MsgSearchForOriginal *msg);
boolean Aev_DeleteMsg(MsgSearchForOriginal *msg);
boolean Aev_SendMsg(int16 dest_id, int16 type, int16 *message, Awindow *win, int16 timeout);
boolean Aev_SendAllMsg(int16 *message, int16 type, Awindow *win, int16 timeout);
boolean Aev_DDAdd(int16 id, int16 type, int16 *msg, const char *name);
boolean Aev_DDDelete(int16 id);
boolean Aev_DDRemove(A_dd_int *dd);
boolean Ash_sendmsg(int16 dest_id, int16 type, int16 *message);
boolean GetImgIntoObj(void *data, Awindow *win, int16 obnr, AOBJECT *aobj, OBJECT *obj);
boolean GetTxtIntoObj(const char *text, const char *type, Awindow *win, int16 obnr, int16 obednr, AOBJECT *aobj, OBJECT *obj);


/*
 * lib/messages/screen.c
 */
boolean Aev_GetMnSelected(MsgFktParams *params);
boolean Aev_GetWmRedraw(MsgFktParams *params);
boolean Aev_GetWmTopped(MsgFktParams *params);
boolean Aev_GetWmClosed(MsgFktParams *params);
boolean Aev_GetWmFulled(MsgFktParams *params);
boolean Aev_GetWmArrowed(MsgFktParams *params);
boolean Aev_GetWmMouseWheel(MsgFktParams *params);
boolean Aev_GetWmHSlid(MsgFktParams *params);
boolean Aev_GetWmVSlid(MsgFktParams *params);
boolean Aev_GetWmSized(MsgFktParams *params);
boolean Aev_GetWmMoved(MsgFktParams *params);
boolean Aev_GetWmBottomed(MsgFktParams *params);
boolean Aev_GetWmOnTop(MsgFktParams *params);
boolean Aev_GetWmUnTopped(MsgFktParams *params);
boolean Aev_GetWmToolbar(MsgFktParams *params);
boolean Aev_GetWmShaded(MsgFktParams *params);
boolean Aev_GetWmUnshaded(MsgFktParams *params);
boolean Aev_GetWmIconify(MsgFktParams *params);
boolean Aev_GetWmAllIconify(MsgFktParams *params);
boolean Aev_GetWmUnIconify(MsgFktParams *params);
boolean Aev_GetApTerm(MsgFktParams *params);
boolean Aev_GetScChanged(MsgFktParams *params);
boolean Aev_GetFntChanged(MsgFktParams *params);
boolean Aev_GetPrnChanged(MsgFktParams *params);
boolean Aev_GetColorsChanged(MsgFktParams *params);
boolean Aev_GetAcClose(MsgFktParams *params);
boolean Aev_GetAcOpen(MsgFktParams *params);


/*
 * lib/messages/xacc.c
 */
boolean Aev_InitXAcc(void);
boolean Aev_ExitXAcc(void);
void XAccDataDelete(XAccData *data);
boolean Aev_GetAccID(MsgFktParams *params);
boolean Aev_GetAccAck(MsgFktParams *params);
boolean Aev_GetAccAcc(MsgFktParams *params);
boolean Aev_GetAccKey(MsgFktParams *params);
boolean Aev_GetAccText(MsgFktParams *params);
boolean Aev_GetAccImg(MsgFktParams *params);
boolean Aev_GetAccMeta(MsgFktParams *params);


/*
 * lib/messages/av.c
 */
boolean Aev_InitVA(void);
boolean Aev_ExitVA(void);
void VaDataDelete(AVData *data);
boolean Aev_GetAvExit(MsgFktParams *params);
boolean Aev_GetVaProtoStatus(MsgFktParams *params);
boolean Aev_GetVaStart(MsgFktParams *params);
boolean Aev_GetAvStarted(MsgFktParams *params);
boolean Aev_GetAvSendKey(MsgFktParams *params);
boolean Aev_GetAvSendClick(MsgFktParams *params);
boolean Aev_GetVaPathUpdate(MsgFktParams *params);


/*
 * lib/messages/dd.c
 */
boolean Aev_InitDD(void);
boolean Aev_ExitDD(void);
boolean Aev_GetAPDragDrop(MsgFktParams *params);
boolean Aev_APDragDropMemory(int16 dest_id, int16 wh, int16 mx, int16 my, int16 kstate, const char *type, void *data, int32 size);


/*
 * lib/messages/dhst.c
 */
boolean Aev_InitDHST(void);
boolean Aev_ExitDHST(void);
boolean Aev_GetDhstAdd(MsgFktParams *params);
boolean Aev_GetDhstAck(MsgFktParams *params);


/*
 * lib/messages/bubble.c
 */
boolean Aev_InitBubble(void);
boolean Aev_ExitBubble(void);
boolean Aev_GetAckBubbleGEM(MsgFktParams *params);
boolean Aev_GetAskFontBubbleGEM(MsgFktParams *params);
boolean Aev_GetRequestBubbleGEM(MsgFktParams *params);
boolean Aev_ShowBubbleGEM(const char *text, int16 mx, int16 my);
boolean Aev_HideBubbleGEM(void);


/*
 * lib/messages/gemscr.c
 */
boolean Aev_InitGEMScript(void);
boolean Aev_ExitGEMScript(void);
boolean Aev_GetGSRequest(MsgFktParams *params);
boolean Aev_GetGSQuit(MsgFktParams *params);
boolean Aev_GetGSCommand(MsgFktParams *params);
boolean Aev_GetGSAck(MsgFktParams *params);
int _gs_strcmp(const void *str1, const void *str2);


/*
 * lib/messages/olga.c
 */
boolean Aev_InitOlga(void);
boolean Aev_ExitOlga(void);
boolean Aev_GetOlgaInit(MsgFktParams *params);
boolean Aev_GetOleExit(MsgFktParams *params);
boolean Aev_GetOleNew(MsgFktParams *params);
boolean Aev_GetOlgaAck(MsgFktParams *params);
boolean Aev_GetOlgaUpdated(MsgFktParams *params);
boolean Aev_GetOlgaGetInfo(MsgFktParams *params);
boolean Aev_GetOlgaClientTerminated(MsgFktParams *params);
boolean Aev_GetOlgaIdle(MsgFktParams *params);
boolean Aev_OleInit(void);
boolean Aev_OleExit(void);
void A_OlgaCreate(void *a0, void *a1, int16 d0);
boolean A_OlgaDelete(int16 d0);


/*
 * lib/messages/stguide.c
 */
boolean Aev_InitSTGuide(void);
boolean Aev_ExitSTGuide(void);
void CheckSTGuide(Awindow *win);


/*
 * lib/messages/seproto.c
 */
boolean Aev_InitSE(void);
boolean Aev_ExitSE(void);


/*
 * lib/messages/ssp.c
 */
boolean Aev_InitSSP(void);
boolean Aev_ExitSSP(void);


/*
 * lib/messages/pc_help.c
 */
boolean Aev_InitPCHelp(void);
boolean Aev_ExitPCHelp(void);
void CheckPcHelp(Awindow *win);
boolean Aev_GetAcReply(MsgFktParams *params);
