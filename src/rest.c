#include "acs_i.h"
#include "acsplus.h"
#include "lib/messages/msgserv.h"

Awindow *Aroot_wi;
Awindow *_ACSv_winds[MAX_WINDS];
CICONBLK *_ACSv_wiicons[MAX_WINDS];
boolean _ACSv_wmenu;
int16 _Wmax_wi;

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 INmemory(void)
{
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRmemory(void)
{
}

/* -------------------------------------------------------------------------- */

void *Ax_malloc(ssize_t size)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Ax_ifree(void *memory)
{
}

/* -------------------------------------------------------------------------- */

void Ax_free(void *memory)
{
}

/* -------------------------------------------------------------------------- */

void Ax_release(void)
{
}

/* -------------------------------------------------------------------------- */

void *Ax_glmalloc(ssize_t size)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Ax_glfree(void *memory)
{
}

/* -------------------------------------------------------------------------- */

int16 Ax_memCheck(const char *buffer, ssize_t len, int16 write)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Ax_recycle(void *memory, ssize_t size)
{
}

/* -------------------------------------------------------------------------- */

int16 Ax_setRecycleSize(ssize_t size, int16 amount, const char *beschreibung)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

MemFreeBlockStat *Ax_getRecycleStat(int16 *anzahl)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Ame_popup(Awindow *window, OBJECT *popup, int16 x, int16 y)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Ame_root(int16 title, int16 idx)
{
}

/* -------------------------------------------------------------------------- */

void Ame_drop(Awindow *win, int16 mx, int16 my)
{
}

/* -------------------------------------------------------------------------- */

int16 Ame_key(Awindow *win, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Ame_namefix(OBJECT *menu)
{
}

/* -------------------------------------------------------------------------- */

int16 INmouse(void)
{
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRmouse(void)
{
}

/* -------------------------------------------------------------------------- */

void Amo_new(Amouse *mouse)
{
}

/* -------------------------------------------------------------------------- */

void Amo_point(void)
{
}

/* -------------------------------------------------------------------------- */

void Amo_busy(void)
{
}

/* -------------------------------------------------------------------------- */

void Amo_unbusy(void)
{
}

/* -------------------------------------------------------------------------- */

void Amo_hide(void)
{
}

/* -------------------------------------------------------------------------- */

void Amo_show(void)
{
}


/* -------------------------------------------------------------------------- */

int16 Amo_restart(Amouse *mouse)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Amo_return(int16 busy, Amouse *mouse)
{
}

/* -------------------------------------------------------------------------- */

OBJECT *Aob_create(const OBJECT *parent)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aob_delete(OBJECT *object)
{
}

/* -------------------------------------------------------------------------- */

int16 Aob_count(const OBJECT *tree, boolean count_aobject)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

CICONBLK *Aic_create(const CICONBLK *icon)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aic_delete(CICONBLK *icon)
{
}

/* -------------------------------------------------------------------------- */

BITBLK *Aim_create(const BITBLK *bitblk)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aim_delete(BITBLK *bitblk)
{
}

/* -------------------------------------------------------------------------- */

TEDINFO *Ate_create(const TEDINFO *tedi)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Ate_delete(TEDINFO *tedi)
{
}

/* -------------------------------------------------------------------------- */

AUSERBLK *Aus_create(const AUSERBLK *user)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aus_delete(AUSERBLK *user)
{
}

/* -------------------------------------------------------------------------- */

void Aob_fix(OBJECT *object)
{
}

/* -------------------------------------------------------------------------- */

void Aob_icon(OBJECT *object)
{
}

/* -------------------------------------------------------------------------- */

void Aob_offset(Axywh *redraw, OBJECT *ob, int16 entry)
{
}

/* -------------------------------------------------------------------------- */

MFDB *Aob_save(Axywh *rect)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aob_restore(MFDB *save, Axywh *rect)
{
}

/* -------------------------------------------------------------------------- */

int16 Aob_tobkey(Awindow *win, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aob_wobkey(Awindow *win, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aob_execute(Awindow *win, OBJECT *tree, int16 obnr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aob_alias(void)
{
}

/* -------------------------------------------------------------------------- */

int16 Aob_select(Awindow *win, OBJECT *tree, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aob_watch(Awindow *window, int16 obnr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aev_release(void)
{
}

/* -------------------------------------------------------------------------- */

int16 Aob_findflag(OBJECT *ob, int16 obnr, int16 flag)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aob_up(OBJECT *ob, int16 obnr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aob_printf(OBJECT *ob, int16 obnr, const char *format, ...)
{
}

/* -------------------------------------------------------------------------- */

void Aob_puttext(OBJECT *ob, int16 obnr, const char *text)
{
}

/* -------------------------------------------------------------------------- */

int16 Aob_scanf(OBJECT *ob, int16 obnr, const char *format, ...)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aob_gettext(const OBJECT *ob, int16 obnr, char *text)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_diaend(void)
{
}

/* -------------------------------------------------------------------------- */

void Awi_diastart(void)
{
}

/* -------------------------------------------------------------------------- */

void Awi_uoself(Awindow *wi)
{
}

/* -------------------------------------------------------------------------- */

void Awi_obchange(Awindow *window, int16 obnr, int16 new_state)
{
}

/* -------------------------------------------------------------------------- */

void Awi_obredraw(Awindow *window, int16 obnr)
{
}

/* -------------------------------------------------------------------------- */

void Awi_redraw(Awindow *window, Axywh *limit)
{
}

/* -------------------------------------------------------------------------- */

void Awi_arrowed(Awindow *window, int16 which, int16 amount)
{
}

/* -------------------------------------------------------------------------- */

void Awi_hslid(Awindow *window, int16 pos)
{
}

/* -------------------------------------------------------------------------- */

void Awi_vslid(Awindow *window, int16 pos)
{
}

/* -------------------------------------------------------------------------- */

boolean Awi_wheeled(Awindow *wind, int16 wheels[16], int16 mx, int16 my)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_obview(Awindow *window, Axywh *xywh)
{
}

/* -------------------------------------------------------------------------- */

void Awi_chdef(Awindow *window, Axywh *xywh)
{
}

/* -------------------------------------------------------------------------- */

boolean Awi_focuschg(Awindow *win, int16 from, int16 to)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_help(Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aus_help(void)
{
}

/* -------------------------------------------------------------------------- */

int16 Awi_keysend(Awindow *window, int16 kstate, int16 key)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_scroll(Awindow *window, int16 x, int16 y)
{
}

/* -------------------------------------------------------------------------- */

int16 Aob_flags(Awindow *window, int16 obnr, int16 flag, int16 setflag)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aob_state(Awindow *window, int16 obnr, int16 flag, int16 setflag)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aob_service(OBJECT *tree, int16 obnr, int16 task, void *in_out)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Awi_observice(Awindow *win, int16 obnr, int16 task, void *in_out)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aob_help(void)
{
}

/* -------------------------------------------------------------------------- */

boolean Aob_visible(OBJECT *tree, int16 obnr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Awi_obvisible(Awindow *win, int16 obnr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void INbackplan(void)
{
}

/* -------------------------------------------------------------------------- */

MFDB *Abp_create(int16 w, int16 h)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Abp_delete(MFDB *backplane)
{
}

/* -------------------------------------------------------------------------- */

void Abp_start(MFDB *backplane)
{
}

/* -------------------------------------------------------------------------- */

void Abp_end(void)
{
}

/* -------------------------------------------------------------------------- */

int16 Abp_mfdb2img(MFDB *org, IMG_HEADER **dest, ssize_t *img_len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Abp_img2mfdb(IMG_HEADER *org, MFDB **dest, int16 do_trnsfm)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 INwindow(void)
{
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRwindow(void)
{
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_ontop(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_setontop(Awindow *win)
{
}

/* -------------------------------------------------------------------------- */

void Awi_invalid(void)
{
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_wid(int16 wid)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_root(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_init(Awindow *window)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int32 Ash_prog(char *path, char *command, char **env)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_list(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_sendall(int16 task, void *in_out)
{
}

/* -------------------------------------------------------------------------- */

void Awi_lateupdate(void)
{
}

/* -------------------------------------------------------------------------- */

void Awi_up(void)
{
}

/* -------------------------------------------------------------------------- */

void Awi_down(void)
{
}

/* -------------------------------------------------------------------------- */

void Awi_show(Awindow *window)
{
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_selfcreate(void *x)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_layout(int16 flag3D, int16 flagModernMenu, int16 redraw)
{
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_create(const Awindow *parent)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_slider(Awindow *win)
{
}

/* -------------------------------------------------------------------------- */

int16 Awi_open(Awindow *win)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_register(Awindow *win)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_backdrop(Awindow *win)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_modal(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_up_modal(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_show_menu(boolean show)
{
}

/* -------------------------------------------------------------------------- */

void Awi_closed(Awindow *win)
{
}

/* -------------------------------------------------------------------------- */

void Awi_delete(Awindow *win)
{
}

/* -------------------------------------------------------------------------- */

void Awi_topped(Awindow *win)
{
}

/* -------------------------------------------------------------------------- */

void Awi_fulled(Awindow *win)
{
}

/* -------------------------------------------------------------------------- */

void Awi_sized(Awindow *window, Axywh *area)
{
}

/* -------------------------------------------------------------------------- */

void Awi_moved(Awindow *window, Axywh *area)
{
}

/* -------------------------------------------------------------------------- */

void Awi_cleanup(Awindow *win)
{
}

/* -------------------------------------------------------------------------- */

int16 Awi_iconify(Awindow *win, boolean all)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_uniconify(Awindow *win)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Awi_service(Awindow *window, int16 task, void *in_out)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_dialog(Awindow *win)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_doform(Awindow *mod_dia, void *para)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_diaabort(void)
{
}

/* -------------------------------------------------------------------------- */

int16 _init_alert(Awindow *win)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_alert(int16 but, const char *text)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Awi_update(int16 mode)
{
}

/* -------------------------------------------------------------------------- */

OBJECT *Awi_obfind(Awindow *window, int16 x, int16 y, OBJECT **tree, int16 *obnr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_bubblegem(Awindow *window, int16 mx, int16 my)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_context(Awindow *window, int16 mx, int16 my)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

Awindow *Awi_name(const char *title, int16 sensitiv)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Awi_gemscript(Awindow *wi, int16 anz, char **cmds, A_GSAntwort *antwort)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Awi_shadow(Awindow *win)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Ash_error(int16 messerr, const void *para)
{
}

/* -------------------------------------------------------------------------- */

/* Kommandozeile parsen und Optionen befüllen */
int16 Ash_cmdParsen(char *options[256], const int16 argc, char **argv,
         const char *optionBeginChars, const char *optionsAllowed,
         const char *optionsWithParam, int16 (*wrongOption)(const char c),
         ULinList *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Ash_getenv(const char *var)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

KEYT *Akt_getKeyTab(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getExpMinNr(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getExpMaxNr(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getImpMinNr(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getImpMaxNr(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_getExpNameFromNr(int16 nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_getImpNameFromNr(int16 nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_getExpShortNameFromNr(int16 nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_getImpShortNameFromNr(int16 nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getRelease(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getExpNrFromId(int16 id)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getImpNrFromId(int16 id)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getExpIdFromNr(int16 nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getImpIdFromNr(int16 nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getExpNrFromName(char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getImpNrFromName(char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getInfoShort(int16 nr, int16 what, int16 *info)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_getInfoString(int16 nr, int16 what, char *info, int16 max_len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int32 Akt_getEuro(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char Akt_CharAtari2X(int16 nr, char ch)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char Akt_CharX2Atari(int16 nr, char ch)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_BlockAtari2X(char *dest_string, int16 nr, char *source_string, ssize_t len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_BlockX2Atari(char *dest_string, int16 nr, char *source_string, ssize_t len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_StringAtari2X(char *dest_string, int16 nr, char *source_string)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_StringX2Atari(char *dest_string, int16 nr, char *source_string)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_CharX2Unicode(int16 nr, char ch)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char Akt_CharUnicode2X(int16 nr, int16 unicode)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 *Akt_BlockX2Unicode(int16 *unicode, int16 nr, char *x_chrs, ssize_t len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_BlockUnicode2X(char *x_chrs, int16 nr, int16 *unicode, ssize_t len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 *Akt_StringX2Unicode(int16 *unicode, int16 nr, char *string)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int32 Akt_CharXUtf2Unicode(int16 nr, char *string, ssize_t len, int16 *read_chars)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 *Akt_BlockXUtf2Unicode(int16 *unicode, ssize_t *uni_len, int16 nr, char *x_chrs, ssize_t len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_BlockUnicode2XUtf(char *x_chrs, ssize_t *str_len, int16 nr, int16 *unicode, ssize_t len)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_BlockXUtf2U2XUtf(char *dest, ssize_t *dest_len, int16 dest_nr, char *source, ssize_t src_len, int16 src_nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_BlockXUtf2XUtf(char *dest, ssize_t *dest_len, int16 dest_nr, char *source, ssize_t src_len, int16 src_nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 *Akt_StringXUtf2Unicode(int16 *unicode, ssize_t *uni_len, int16 nr, char *string)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_StringXUtf2U2XUtf(char *dest, ssize_t *dest_len, int16 dest_nr, char *source, int16 src_nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_StringXUtf2XUtf(char *dest, ssize_t *dest_len, int16 dest_nr, char *source, int16 src_nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_popExpName(int16 *width)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Akt_popImpName(int16 *width)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_chooseExpNr(Awindow *window, int16 x, int16 y)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Akt_chooseImpNr(Awindow *window, int16 x, int16 y)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 INMsgService(void)
{
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRMsgService(void)
{
}

/* -------------------------------------------------------------------------- */

boolean Aev_message(int16 *msg)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_CmpMsgInList(void *list, int16 *msg)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_CmpDestID(void *list, void *msg)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aev_SearchMsg(void *a0)
{
}

/* -------------------------------------------------------------------------- */

boolean Aev_DeleteMsg(void *a0)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_SendMsg(int16 dest_id, int16 type, int16 *message, Awindow *win, int16 timeout)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Aev_SendMsg2all(void *a0, void *a1)
{
}

/* -------------------------------------------------------------------------- */

boolean Aev_SendAllMsg(int16 *message, int16 type, Awindow *win, int16 timeout)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

A_dd_int *Aev_DDSearch(int16 id)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_DDAdd(int16 id, int16 type, void *msg, const char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_DDDelete(int16 id)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_DDRemove(void *a0)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Ash_sendmsg(int16 d0, int16 d1, void *a0)
{
}

/* -------------------------------------------------------------------------- */

boolean Ash_sendall(int16 *mess, int32 type)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

A_dd *Ash_nextdd(A_dd *act)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean GetImgIntoObj(void *data, Awindow *win, int16 obnr, AOBJECT *aobj, OBJECT *obj)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

ULinListe *globProtData;

boolean GetTxtIntoObj(const char *text, const char *type, Awindow *win, int16 obnr, int16 obednr, AOBJECT *aobj, OBJECT *obj)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetMnSelected(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmRedraw(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmTopped(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmClosed(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmFulled(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmArrowed(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmMouseWheel(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmHSlid(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmVSlid(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmSized(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmMoved(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmBottomed(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmOnTop(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmUnTopped(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmToolbar(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmShaded(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmUnshaded(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmIconify(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmAllIconify(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetWmUnIconify(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetApTerm(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetScChanged(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetFntChanged(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetPrnChanged(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetColorsChanged(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAcClose(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAcOpen(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_WmRedraw(int16 dest_id, int16 wind_id, const Axywh *area)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_InitVA(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_ExitVA(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void VaDataDelete(void)
{
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAvExit(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetVaProtoStatus(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetVaStart(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAvStarted(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAvSendKey(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetAvSendClick(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_GetVaPathUpdate(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_AvProtokoll(int16 dest_id, Awindow *window, int16 timeout)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_AvExit(int16 dest_id, Awindow *window, int16 timeout)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_VaStart(int16 dest_id, const char *cmd, Awindow *window, int16 timeout)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Aev_AvStarted(int16 dest_id, int16 ok, const char *cmd)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

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

boolean Aev_GetAPDragDrop(MsgFktParams *params)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Aev_APDragDropMemory(int16 dp, int16 d1, int16 d2, void *a0, void *a2)
{
	return 0;
}

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

boolean Aev_ShowBubbleGEM(void *a0, int16 d0, int16 d1)
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

int16 _gs_strcmp(const char *str1, const char *str2)
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

boolean Aev_GetOlgaCLientTerminated(MsgFktParams *params)
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

void CheckSTGuide(void *a0)
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

void CheckPcHelp(void *a0)
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

char *Ame_strpopup(Awindow *wi, char *pstr, char *chk, int16 width, int16 x, int16 y)
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

void Aus_objboxed(void *a0, void *a1, int16 d0)
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

int16 a_dialog_active;

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
