#include "acs_i.h"
#include "acsplus.h"
#include "lib/messages/msgserv.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* -------------------------------------------------------------------------- */

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

boolean Aev_GetDhstAdd(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetDhstAck(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_DhstAdd(const char *docname, const char *docpath)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_DhstSaved(const char *file)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_InitBubble(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitBubble(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAckBubbleGEM(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAskFontBubbleGEM(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetRequestBubbleGEM(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_FontBubbleGEM(int16 font_id, int16 points)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ShowBubbleGEM(const char *text, int16 mx, int16 my)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_HideBubbleGEM(int16 d0)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_InitGEMScript(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitGEMScript(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetGSRequest(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetGSQuit(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetGSCommand(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetGSAck(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int _gs_strcmp(const void *str1, const void *str2)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_GEMScript(int16 anz, char **cmd, A_GSAntwort *antwort)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_InitOlga(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitOlga(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void Awi_saved(Awindow *window, const char *datei)
{
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaInit(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOleExit(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOleNew(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaAck(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaUpdated(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaGetInfo(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaClientTerminated(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetOlgaIdle(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OleInit(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OleExit(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaIdle(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaUpdate(const char *datei)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaGetInfo(int16 id)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaRename(const char *old_datei, const char *new_datei)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_OlgaBreaklink(const char *datei)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void A_OlgaCreate(void *a0, void *a1, int16 d0)
{
}

/* -------------------------------------------------------------------------- */

boolean A_OlgaDelete(int16 d0)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_InitSTGuide(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitSTGuide(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void CheckSTGuide(Awindow *win)
{
}

/* -------------------------------------------------------------------------- */

int16 Aev_STGuideHelp(char *hyp_text, char *referenz, Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_InitSE(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitSE(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_InitSSP(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitSSP(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_InitPCHelp(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitPCHelp(void)
{
	return TRUE;
}

/* -------------------------------------------------------------------------- */

void CheckPcHelp(Awindow *win)
{
}

/* -------------------------------------------------------------------------- */

int16 Aev_PCHelpVersion(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAcReply(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_AcHelp(const char *help_acc, const char *referenz, Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_AcVersion(char *help_acc, Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_AcCopy(char *help_acc, Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 INuserobj(void)
{
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRuserobj(void)
{
}

/* -------------------------------------------------------------------------- */

boolean Auo_string(OBJECT *entry, int16 task, void *in_out)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_radiobutton(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_checkbox(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_innerframe(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_3Dbutton(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_title(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_pattern(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_arrows(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_select(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_ftext(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Auo_ftext(OBJECT *entry, int16 task, void *in_out)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_cycle(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Auo_cycle(OBJECT *entry, int16 task, void *in_out)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Ame_strpopup(Awindow *wi, char *pstr, const char *chk, int16 width, int16 x, int16 y)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aus_cycle(void)
{
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_picture(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Auo_picture(OBJECT *entry, int16 task, void *in_out)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aus_boxed(void)
{
}

/* -------------------------------------------------------------------------- */

void Aus_objboxed(Awindow *win, OBJECT *tree, int16 obnr)
{
}

/* -------------------------------------------------------------------------- */

boolean Auo_boxed(OBJECT *entry, int16 task, void *in_out)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 CDECL A_boxed(PARMBLK *pb)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aud_boxed(void)
{
}

/* -------------------------------------------------------------------------- */

int16 Awi_keys(Awindow *window, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_sendkey(Awindow *wi, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_nokey(Awindow *wi, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aob_within(const Axywh* rect, int16 x, int16 y)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 alert_str(const char* alert, const char* para)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Act_save(CONTEXT *ctx)
{
}

/* -------------------------------------------------------------------------- */

void Act_restore(CONTEXT *ctx)
{
}

/* -------------------------------------------------------------------------- */

boolean A_isModDia(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 A_dialog(OBJECT *dia)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 A_dialog2(OBJECT *dia)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean intersect(Axywh* to, const Axywh* from)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void xywh2array(int16 *to, const Axywh *from)
{
}

/* -------------------------------------------------------------------------- */

void array2xywh(Axywh *to, const int16 *from)
{
}

/* -------------------------------------------------------------------------- */

void Ascrp_clear(const char *ext)
{
}

/* -------------------------------------------------------------------------- */

int16 Ascrp_get(const char *ext, void **buffer, ssize_t *len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean a_dialog_active;

boolean Ascrp_put (const char *ext, void *buffer, long len, boolean append)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Adate_ymd2dow(void)
{
}

/* -------------------------------------------------------------------------- */

int16 Adate_getMonth(const char *date, char *out_month)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Ash_printSetIcon(CICONBLK *icon, int16 ghost)
{
}

/* -------------------------------------------------------------------------- */

int16 Ash_print(PRN_SETTINGS *setting, int16 x, int16 y, int16 option, const char *title, Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

Awindow PrintSelWind;

/* -------------------------------------------------------------------------- */

void Ash_fontSetIcon(CICONBLK *icon, int16 ghost)
{
}

/* -------------------------------------------------------------------------- */

int16 Ash_font(const char *title, int16 x, int16 y, int16 font_flag,
         int16 button_flag, A_FontSel *font, const char *sample, const char *opt_button,
         A_FontFkt set, A_FontFkt mark, A_FontFkt opt, void *para, Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

Awindow FontSelWind;

/* -------------------------------------------------------------------------- */

ULinList *Alu_create(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Alu_delete(ULinList *liste)
{
}

/* -------------------------------------------------------------------------- */

int16 Alu_ptrCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_longCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_intCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_charCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_strCmp(void *para, void *elem)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_striCmp(void *para, void *elem)
{
	return 0;
}
